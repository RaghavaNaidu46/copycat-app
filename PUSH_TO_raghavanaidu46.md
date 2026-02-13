# Push these docs to raghavanaidu46/copycat-app

Follow these steps to create the public repo under **raghavanaidu46** and push the privacy policy docs.

## 1. Create the repo on GitHub

1. Log in to GitHub as **raghavanaidu46**.
2. Go to **https://github.com/new**.
3. Set:
   - **Repository name:** `copycat-app`
   - **Visibility:** Public
   - Leave "Add a README" **unchecked** (empty repo).
4. Click **Create repository**.

## 2. Push from this folder

In Terminal, from your **copycat** project root:

```bash
cd copycat-app-docs
git remote remove origin
git remote add origin https://github.com/raghavanaidu46/copycat-app.git
git push -u origin main
```

If Git asks for credentials, use your **raghavanaidu46** login (or a personal access token).

## 3. Verify

- **Privacy policy:** https://github.com/raghavanaidu46/copycat-app/blob/main/PRIVACY_POLICY.md  
- **Support (repo):** https://github.com/raghavanaidu46/copycat-app  

The Copycat app already points to these URLs in **AppLinks.swift**.
