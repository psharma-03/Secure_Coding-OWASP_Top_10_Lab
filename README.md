# OWSAP 10 Lab (Reconstructed from Report)

> **Note:** The original practical work was done in a VM and code was not preserved. This repository recreates the project setup, commands, lab workflow, and documentation from the provided report pages.

## 1) Project Goal
This project reproduces an **OWASP Top 10 security lab environment** used for learning and demonstration.

Platforms used:
- OWASP Juice Shop
- DVWA (Damn Vulnerable Web Application)
- Burp Suite Community
- PortSwigger Web Security Academy labs

Covered topics:
- SQL Injection
- Broken Authentication
- Sensitive Data Exposure / Cryptographic Failures
- Broken Access Control
- Security Misconfiguration
- Cross-Site Scripting (XSS)
- Insecure Deserialization

## 2) Folder Structure

```text
OWSAP 10/
├── README.md
├── docker-compose.yml
├── docs/
│   └── lab-report-reconstructed.md
└── scripts/
    ├── setup_ubuntu.sh
    ├── run_juiceshop.sh
    ├── run_dvwa.sh
    └── sample_wordlist.txt
```

## 3) Quick Start

### Prerequisites
- Ubuntu (or Debian-based Linux)
- Docker + Docker Compose plugin
- Burp Suite Community Edition

### Step A: System setup
```bash
cd "OWSAP 10"
bash scripts/setup_ubuntu.sh
```

### Step B: Start vulnerable apps
```bash
docker compose up -d
```

Apps:
- Juice Shop: http://localhost:3000
- DVWA: http://localhost:8081

### Step C: Stop apps
```bash
docker compose down
```

## 4) Individual run scripts

Run only Juice Shop:
```bash
bash scripts/run_juiceshop.sh
```

Run only DVWA:
```bash
bash scripts/run_dvwa.sh
```

## 5) Safety & Ethics

This material is for **authorized lab learning only**.
Do not test against systems you do not own or explicitly have permission to assess.

## 6) Report Mapping
A page-by-page reconstructed write-up from the provided 13-page report is available at:

- `docs/lab-report-reconstructed.md`

## 7) Git Push Steps

```bash
git add .
git commit -m "Add reconstructed OWSAP 10 lab project structure and documentation"
git push origin <your-branch>
```

## 8) Full Coverage Checklist

To verify *everything* from the 13-page report is covered before submission, use:

- `docs/page-by-page-checklist.md`

## 9) Push to your GitHub repository

```bash
git remote add origin https://github.com/psharma-03/Secure_Coding-OWASP_Top_10_Lab.git 2>/dev/null || true
git push -u origin $(git branch --show-current)
```
