# Page-by-Page Reproduction Checklist (13 pages)

This checklist converts the submitted report into actionable steps so you can reproduce and validate each page before presenting or pushing updates.

## Page 1
- [ ] Introduction included (project goal + tools used).
- [ ] VM setup notes present:
  - [ ] VirtualBox download.
  - [ ] Ubuntu VM creation (`UbuntuPS`, Ubuntu 64-bit).
  - [ ] Resource allocation (4GB RAM, 40GB disk, 2 CPU).

## Page 2
- [ ] Internet check command captured: `ping -c 3 google.com`.
- [ ] APT update command captured: `sudo apt update`.
- [ ] Docker install commands captured:
  - `sudo apt install -y docker.io`
  - `sudo systemctl enable docker --now`
  - `sudo usermod -aG docker $USER`
- [ ] Docker validation command captured: `docker ps`.

## Page 3
- [ ] Burp install command captured: `sudo apt install -y burpsuite`.
- [ ] Juice Shop pull command captured: `sudo docker pull bkimminich/juice-shop`.
- [ ] Juice Shop run command captured: `sudo docker run --rm -p 3000:3000 bkimminich/juice-shop`.
- [ ] Access URL listed: `http://localhost:3000`.

## Page 4
- [ ] SQLi section includes payload: `' OR 1=1--`.
- [ ] Burp Proxy/Repeater workflow documented.
- [ ] Admin login success outcome documented.

## Page 5
- [ ] Broken Authentication process documented.
- [ ] Burp Intruder usage documented.
- [ ] Wordlist path shown: `/usr/share/wordlists/fern-wifi/common.txt`.

## Page 6
- [ ] Custom wordlist output shown.
- [ ] Burp Intruder result analysis included.
- [ ] Final successful login confirmation noted.

## Page 7
- [ ] Sensitive Data Exposure section documented.
- [ ] Intercepted request shown: `GET /ftp/legal.md`.
- [ ] Modified request shown: `GET /ftp/`.
- [ ] Exposed directory listing result captured.

## Page 8
- [ ] Additional FTP listing examples documented.
- [ ] Broken Access Control section documented.
- [ ] Modified `userId` and `email` accepted by server.

## Page 9
- [ ] Repeater screenshot/result for modified `userId` included.
- [ ] Security Misconfiguration section documented.
- [ ] Invalid path request shown: `GET /%%%%`.
- [ ] Verbose stack-trace style response noted.

## Page 10
- [ ] DVWA setup/start documented.
- [ ] Security level LOW noted.
- [ ] Reflected XSS payload included.
- [ ] Stored XSS payload included.

## Page 11
- [ ] Reflected alert popup evidence listed.
- [ ] Stored XSS backend insertion evidence listed.
- [ ] Redirect behavior evidence listed (to bing.com).
- [ ] Insecure Deserialization section started.

## Page 12
- [ ] Cookie decode flow (URL + Base64) documented.
- [ ] Serialized flag changed `b:0 -> b:1`.
- [ ] Admin panel visible after cookie replacement.

## Page 13
- [ ] Admin action performed (delete user).
- [ ] Lab solved confirmation captured.
- [ ] Conclusion present.
- [ ] References present.

---

## Local Project Files that map to this checklist
- Main guide: `../README.md`
- Reconstructed report: `./lab-report-reconstructed.md`
- Compose setup: `../docker-compose.yml`
- Scripts: `../scripts/`
