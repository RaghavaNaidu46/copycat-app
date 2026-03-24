# CopyCat — Memory & Performance Release Checklist

This document defines mandatory memory and performance validation steps
before every production release.

Baseline assumption:
- 10,000 stored clips
- UI visible cap = 500
- Apple Silicon Mac
- Release build (not Debug)

---

# 1. Architecture Guardrails (Static Verification)

## 1.1 UI Cap Separation
- [ ] `ClipListView.uiVisibleCap` is defined and set to 500
- [ ] `fetchLimit = uiVisibleCap`
- [ ] `fetchBatchSize = 50`
- [ ] No `Array(clips)` anywhere in UI code
- [ ] No Swift-level `.sorted` on full dataset
- [ ] No new Swift-level `.filter` on full dataset

## 1.2 Storage Cap
- [ ] `ProAccessManager.maxStoredClipsHardCap = 10_000`
- [ ] `enforceHistorySize` deletes O(overflow), not O(total)
- [ ] Trim deletes both `dataRef` and `previewRef`
- [ ] No full-table delete logic

## 1.3 Cache Limits
Verify these exist and are bounded:

- [ ] `blobCache.countLimit = 200`
- [ ] `blobCache.totalCostLimit = 80 * 1024 * 1024`
- [ ] `quickLookCache.countLimit = 150`
- [ ] `quickLookCache.totalCostLimit = 60 * 1024 * 1024`
- [ ] `colorCache.countLimit = 200`
- [ ] `nameCache.countLimit = 200`

No cache should be unbounded.

---

# 2. Runtime Memory Validation

## 2.1 Idle Baseline

Steps:
1. Launch app
2. Do NOT open overlay
3. Wait 60 seconds

Measure:
- Activity Monitor → Memory (RSS)

Target:
- Idle RSS < 80MB
- CPU < 1%

---

## 2.2 Overlay Open/Close Stability

Steps:
1. Record RSS baseline
2. Open overlay → close overlay (repeat 20 times)
3. Record RSS after each cycle

Pass Condition:
- RSS stabilizes by cycle 3–5
- Final RSS ≤ baseline + 5MB
- No monotonic upward slope

Fail Condition:
- Continuous increase across cycles

---

## 2.3 Image Preview Stability

Steps:
1. Scroll to display ~50 image clips
2. Close overlay
3. Repeat 5 times

Pass Condition:
- RSS stabilizes after first cycle
- No steady growth across cycles
- Memory plateaus

---

## 2.4 Memory Pressure Simulation

Instruments → Allocations
Simulate memory warning OR:

Terminal: