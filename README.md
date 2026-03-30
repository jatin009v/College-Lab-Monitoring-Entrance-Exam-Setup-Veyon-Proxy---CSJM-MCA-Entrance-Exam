# 🚩 College Lab Monitoring & Entrance Exam Setup (Veyon & Proxy)

This guide helps you set up **real-time monitoring and anti-cheating system** in college computer labs (60–90 PCs) during entrance exams using **Veyon (Virtual Eye On Network)**.

Veyon is far more powerful than proxy-based solutions because it provides:
- Live screen monitoring (thumbnails)
- Remote control
- Screen locking
- Automated execution
- Screenshot tracking

---

## 📌 Table of Contents

- [Pre-requisites](#-pre-requisites)
- [Master PC Setup](#-master-pc-setup)
- [Client PCs Setup](#-client-pcs-setup)
- [Live Monitoring](#-live-monitoring)
- [IP Collection Methods](#-ip-collection-methods)
- [CSV Import Format](#-csv-import-format)
- [Batch Automation Script](#-batch-automation-script)
- [Screen Lock (Blocking)](#-screen-lock-blocking)
- [Run Program Feature](#-run-program-feature)
- [Kiosk Mode (Anti-Cheating)](#-kiosk-mode-anti-cheating)
- [Pro Tips](#-pro-tips)

---

## 🧰 Pre-requisites

Before starting:

- **Master PC**: Your system (monitoring control)
- **Client PCs**: 60–90 exam systems
- **Network**: All systems connected to same LAN/WiFi
- **Static IP (Recommended)**:
192.168.1.10
192.168.1.11



---

## 🖥️ Master PC Setup

### 1. Download Veyon
👉 https://veyon.io/

Download **Windows 64-bit version**

---

### 2. Installation

- Install Veyon
- Keep **"Veyon Master" checked**

---

### 3. Open Veyon Configurator

#### General
- Set:
- Authentication Method = Key File Authentication


#### Authentication Keys
- Click **Create Key Pair**
- Name: `Exam2026`

#### Export Public Key
- Export **Public Key**
- Save to **Pen Drive**

---

### 4. Add Computers

Go to:
Locations & Computers

- Create Location: `MCA_LAB`
- Add all PCs with:
  - Name
  - IP Address

---

## 💻 Client PCs Setup

Repeat on all 60–90 PCs:

### Installation
- Install Veyon
- ❌ Uncheck **Veyon Master**
- ✅ Only install **Veyon Service**

---

### Configuration

#### General

Authentication Method = Key File Authentication

#### Import Key
- Import Public Key from Pen Drive

#### Service Check
- Ensure:
- Service Status = Started

---

## 👁️ Live Monitoring

Open **Veyon Master**:

- Select **Location**
- View all PCs as thumbnails

### Features:
- Double click → Full screen view
- Monitor all PCs simultaneously

---

## 🌐 IP Collection Methods

### 1. Advanced IP Scanner (Recommended)

Download:
👉 https://www.advanced-ip-scanner.com/

Steps:
- Run (no install needed)
- Click **Scan**
- Export → CSV/XML

---

### 2. Command Prompt

```bash
arp -a

⚠️ Output may be messy for large networks

📄 CSV Import Format

Use this format:

Name,Host,Location
PC-01,192.168.1.10,MCA_LAB
PC-02,192.168.1.11,MCA_LAB
PC-03,192.168.1.12,MCA_LAB

💡 Tip:

Name = Seat Number (e.g., Seat-01)
Host = IP Address
📥 Import CSV in Veyon
Open Veyon Configurator
Go to Locations & Computers
Click Import
Select .csv file
Click Apply

⚡ Batch Automation Script

Automate setup across all PCs.

📌 Steps
Create folder:
VeyonSetup
Add Public Key inside folder
Create file:
setup_veyon.bat

📜 Script

@echo off
title Veyon Client Auto-Configurator
echo ----------------------------------------------------------
echo Veyon Client Setup Shuru Ho Raha Hai...
echo ----------------------------------------------------------

:: 1. Check Veyon CLI
set "VEYON_CLI=C:\Program Files\Veyon\veyon-cli.exe"

if not exist "%VEYON_CLI%" (
    echo [ERROR] Veyon not installed or path incorrect!
    pause
    exit
)

:: 2. Set Authentication Method
echo Setting Authentication Method to Key File...
"%VEYON_CLI%" config set Authentication/Method 1

:: 3. Import Public Key
echo Importing Public Key...
"%VEYON_CLI%" authkeys import Exam_2026/public "%~dp0my_public_key.pem"

:: 4. Restart Service
echo Restarting Veyon Service...
net stop VeyonService
net start VeyonService

echo ----------------------------------------------------------
echo Setup Successfully Complete!
echo ----------------------------------------------------------
pause


🔒 Screen Lock (Blocking)
What it does:
Black screen
Keyboard & mouse disabled
Custom message display
How to Use:
Select all PCs → Ctrl + A
Click Lock
To resume → Click Unlock


⚡ Run Program Feature

Launch exam portal on all PCs instantly.

Steps:
Select all PCs (Ctrl + A)
Click Run Program
Enter command:

🌐 Chrome

"C:\Program Files\Google\Chrome\Application\chrome.exe" --start-maximized https://your-exam-link.com

🌐 Edge
msedge.exe --start-maximized https://your-exam-link.com
🛡️ Kiosk Mode (Anti-Cheating)

Prevents:

Alt + Tab
Taskbar access
Switching tabs
Command:
msedge.exe --kiosk https://your-exam-link.com --edge-kiosk-type=fullscreen
🚫 Anti-Cheating Features
Screen monitoring
Screenshot logging
Remote shutdown/reboot
Forced application launch

💡 Pro Tips
🔥 Network Stability
90 PCs = high load
Expect 1–2 sec delay

💤 Disable Sleep Mode
Turn off sleep/hibernate
🔐 Firewall Fix
Allow Veyon in Windows Firewall
⚙️ Batch Deployment
Use cloning tools for faster setup
🛠️ Admin Rights
Required for installation
🔄 Backup Plan
Manually open exam on failed PCs
🎯 Final Workflow (Exam Day)
Start Veyon Master
Lock all screens
Give instructions
Run Program (open exam)
Unlock screens
Monitor live
Take action if cheating detected
👨‍💻 Author

Jatin Gupta
MCA Student | Full Stack Developer | Devops Enthusiast
