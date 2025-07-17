# 🎮 RetroArch Save Sync
#### BETA

A simple script to automatically sync RetroArch save files with Google Drive using `rclone`. Perfect for Raspberry Pi!

## 🚀 Features

- 🔁 Backup save files and save states
- ☁️ Restore from the cloud
- 🧠 Based on `rclone`  (also supports Dropbox, OneDrive, etc.)
- 📝 Detailed log

## ⚙️ Requirements

- A Linux/macOS system (MADE FOR PERSONAL USE ON MY **RASPBERRY PI**)
- [`rclone`](https://rclone.org/downloads/) installed and configured with a remote named `gdrive`
- RetroArch installed (saved files located in `~/.config/retroarch/`)

## 🔧 Setup

1. Clone the repo:

```bash
git clone https://github.com/tuo-username/retroarch-save-sync.git
cd retroarch-save-sync
chmod +x save-sync.sh
```

2. (Optional) Configure `rclone` if you haven't already done it:

```bash
rclone config
```

3. let's backup:

```bash
./save-sync.sh backup
```

4. Or restore saves:

```bash
./save-sync.sh restore
```

## 🕒 Automation

For example, to run automatic backups every day at 18:00 (6 PM):

```bash
crontab -e
```

add the following line:

```cron
0 18 * * * /percorso/alla/save-sync.sh backup
```

## 📄 License

**MIT** — you can use this however you want!!

Made by Achille Pisani
