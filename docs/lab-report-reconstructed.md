# OWASP Top 10 Lab Report (Reconstructed)

Date in report: 03 December 2025

---

## Page 1 — Introduction + Environment Setup (start)

### 1. Introduction
Web applications are common attack targets. The lab objective was to understand and exploit OWASP Top 10 vulnerabilities in intentionally vulnerable environments and then learn mitigation concepts.

Labs used:
- OWASP Juice Shop
- DVWA
- PortSwigger labs

### 2. Environment Setup
#### 2.1 Installing VirtualBox & Ubuntu
Documented actions:
1. Downloaded Oracle VirtualBox.
2. Created VM (`UbuntuPS`).
3. Set OS type to Linux / Ubuntu 64-bit.
4. Allocated 4GB RAM, 40GB storage, 2 CPU.
5. Attached Ubuntu ISO and installed.
6. Logged in successfully.

---

## Page 2 — Connectivity + Update + Docker install

### 2.2 Verifying internet
```bash
ping -c 3 google.com
```

### 2.3 Updating system
```bash
sudo apt update
```

### 2.4 Docker installation
```bash
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
```
Validation:
```bash
docker ps
```

---

## Page 3 — BurpSuite + Juice Shop deployment

### 2.5 Installing BurpSuite
```bash
sudo apt install -y burpsuite
```

### 3. OWASP Juice Shop Deployment
Pull image:
```bash
sudo docker pull bkimminich/juice-shop
```

Run container:
```bash
sudo docker run --rm -p 3000:3000 bkimminich/juice-shop
```

Access:
- `http://localhost:3000`

---

## Page 4 — SQL Injection (OWASP A03)

### 4.1 SQL Injection
Process summary:
1. Enabled Burp Proxy.
2. Opened Juice Shop login.
3. Submitted fake credentials.
4. Sent login request to Repeater.
5. Injected payload:
   ```text
   ' OR 1=1--
   ```
6. Re-sent request and got admin login.

---

## Pages 5–6 — Broken Authentication (OWASP A02)

### 4.2 Broken Authentication
Process summary:
1. Used admin email discovered from SQLi context.
2. Tried wrong password.
3. Sent request to Burp Intruder.
4. Marked password field as payload position.
5. Used wordlist path:
   ```text
   /usr/share/wordlists/fern-wifi/common.txt
   ```
6. Launched brute-force attempt.
7. Identified valid password from response behavior.

A small custom wordlist was also shown in the report output.

---

## Pages 7–8 — Sensitive Data Exposure + Broken Access Control

### 4.3 Sensitive Data Exposure / Cryptographic Failures
Process summary:
1. Opened “About Us”.
2. Clicked “Check out our lame stuff”.
3. Intercepted request:
   ```http
   GET /ftp/legal.md
   ```
4. Modified to:
   ```http
   GET /ftp/
   ```
5. Directory listing exposed files.

Additional browsing showed files such as encrypted announcement content.

### 4.4 Broken Access Control
Process summary:
1. Logged in as normal user.
2. Submitted feedback.
3. Intercepted feedback request.
4. Modified `userId` and `email` fields.
5. Feedback accepted as another user.

---

## Pages 9–11 — Misconfiguration + XSS + Insecure Deserialization (start)

### 4.5 Security Misconfiguration
Process summary:
1. Intercepted product request.
2. Modified invalid path:
   ```http
   GET /%%%%
   ```
3. Application returned verbose stack-trace style error details.

### 4.6 Cross-Site Scripting (XSS) using DVWA
Process summary:
1. Installed/launched DVWA.
2. Security level set to LOW.
3. Reflected XSS payload tested:
   ```html
   <script>alert('Your computer has been hacked')</script>
   ```
4. Stored XSS payload tested:
   ```html
   <script>window.location='https://www.bing.com'</script>
   ```

Observed outputs included alert popup and redirect behavior.

### 4.7 Insecure Deserialization (PortSwigger)
Process summary:
1. Opened PortSwigger lab.
2. Intercepted login/session traffic via Burp.
3. Decoded session cookie (URL + Base64).
4. Changed serialized value from:
   ```text
   b:0 -> b:1
   ```
5. Re-encoded and replaced cookie.

---

## Pages 12–13 — Insecure Deserialization (end) + Conclusion + References

### 4.7 Insecure Deserialization (continued)
6. Admin privileges became available.
7. User account deleted successfully (lab solved).

### 5. Conclusion
The report concludes that practical exploitation of OWASP risks demonstrates how coding and configuration flaws lead to security breaches, and emphasizes secure coding, proper auth controls, validation, and safe error handling.

### 6. References
- OWASP Top 10 — https://owasp.org
- Burp Suite — https://portswigger.net
- PortSwigger Web Security Labs — https://portswigger.net/web-security

---

## Reproduction Tips
Use this repository scripts as baseline:
- `../scripts/setup_ubuntu.sh`
- `../scripts/run_juiceshop.sh`
- `../scripts/run_dvwa.sh`

Use `../docker-compose.yml` for running both apps together.
