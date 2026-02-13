# Copycat Privacy Policy

**Last updated:** February 2026

Copycat (“the app”) is a clipboard history manager for macOS. This policy describes what data the app uses and where it is stored.

## Data the app collects and stores

- **Clipboard content:** When you copy or cut text, images, URLs, or files, the app may store a history of that content so you can paste it later. This includes plain text, rich text (RTF), images, and URLs.
- **Preferences:** Settings you choose (e.g. launch at login, keyboard shortcut, history size, which apps to ignore) are stored on your Mac.
- **Source app (optional):** The app can record which application a copy came from (by bundle identifier) so you can filter or ignore certain apps. This is stored only on your device.

## Where data is stored

All of the above data is stored **only on your Mac**:

- Clipboard history and file blobs: in the app’s **Application Support** folder (sandboxed to the app).
- Preferences: in **UserDefaults** (standard macOS preferences for the app).

The app does **not** send any of this data to the internet or to any third party. There is no analytics, no tracking, and no cloud sync unless you explicitly add it in a future version.

## How you can control or delete data

- **Clear history on quit:** In Preferences → Advanced, turn on “Clear history on quit” to remove all clipboard history when you quit Copycat.
- **Clear system clipboard on quit:** You can also clear the system clipboard when quitting.
- **Turn off storage temporarily:** In Preferences → Advanced, use “Turn off (ignore all new copies)” to stop saving new clips; existing history remains until you clear it or quit with “Clear history on quit” enabled.
- **Uninstall:** Removing the app and deleting its Application Support data (e.g. `~/Library/Application Support/copycat/`) removes all stored history and preferences.

## Sensitive data

By default, the app does **not** save copies from sensitive apps such as Keychain Access and Passwords (Apple). You can add or remove apps in Preferences → Ignore. Certain pasteboard types (e.g. concealed or transient) are also ignored by default to avoid storing passwords or one-time codes.

## Changes to this policy

If this policy changes, we will update the “Last updated” date and, for significant changes, we will make the new version easy to find (e.g. in the app or on the same page as this policy).

## Contact

For privacy-related questions or support, use the Support link in the app (Preferences → Advanced → Support) or the contact details provided in the App Store listing.
