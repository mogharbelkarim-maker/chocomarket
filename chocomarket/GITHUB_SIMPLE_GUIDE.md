# 🚀 GitHub Setup - Super Simple (2 Minutes)

## Step 1: Create GitHub Account (1 minute)

Go here: https://github.com/signup

**Fill in:**
- Username: `anything you want` (e.g., `john123`)
- Email: `your email`
- Password: `your password`

Click "Create account"

**Done!** ✅

---

## Step 2: Create Repository (1 minute)

After signup, you'll see GitHub dashboard.

Click this button:

```
[+] ← in top right corner
└── New repository ← click
```

**Fill in:**
- Repository name: `chocomarket`
- Description: (leave blank)
- Public: ✓ (selected)
- Initialize with README: ☐ (unchecked)

Click **"Create repository"**

**Done!** ✅

---

## Step 3: Copy Your Repository URL

After creating, you'll see a page with:

```
Quick setup — if you've done this kind of thing before
HTTPS ← click here
```

You'll see a URL like:

```
https://github.com/YOUR_USERNAME/chocomarket.git
```

**Copy this URL** (Ctrl+C)

**Done!** ✅

---

## Step 4: Run Push Script

Open PowerShell in your project folder:

```powershell
cd c:\Users\Toshiba\Documents\chocomarket
.\GITHUB_PUSH.bat
```

**When it asks:**
1. "Enter your GitHub username:" → Type your username (same as Step 1)
2. "Enter your repo name:" → Type: `chocomarket`
3. "Continue? (y/n):" → Type: `y`

**It will ask for GitHub password** → Type your GitHub password

**Done!** ✅

Code is now on GitHub!

---

## Step 5: Import to Replit (2 minutes)

Go here: https://replit.com

**Sign up (free)**

Click: **"+ Create"**

Select: **"Import from GitHub"**

Paste the URL you copied earlier:
```
https://github.com/YOUR_USERNAME/chocomarket.git
```

Click: **"Import"**

**Wait 2 minutes...**

App opens in Replit! 🎉

---

## That's IT!

You now have:
✅ GitHub repo with all your code
✅ Replit project with Flutter setup
✅ App ready to run

---

## What to do next in Replit:

In Replit terminal (bottom):

```bash
flutter pub get
```

Wait 2 minutes...

```bash
flutter run -d chrome
```

Your app opens in browser! 🌐

---

**You've got this! Follow each step exactly as written and you're done! 💪**
