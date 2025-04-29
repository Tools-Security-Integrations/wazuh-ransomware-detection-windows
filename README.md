# 🛡️ Ransomware Detection and Containment for Windows using Wazuh

This repository provides custom **Wazuh rules**, **decoders**, and **active response scripts** designed to **detect and automatically contain ransomware activity** on Windows endpoints.

---

## 🎯 Objective

To enhance Wazuh's detection capabilities on Windows agents by:
- Identifying ransomware behavior (e.g., mass file encryption, suspicious extensions, PowerShell abuse)
- Triggering real-time containment actions like:
  - Killing malicious processes
  - Disabling network access
  - Alerting via Slack or email

---

## 🧩 Features

- 🧠 **Custom Wazuh rules** for ransomware indicators:
  - Unusual file extensions (`.locked`, `.encrypted`, `.RYK`, etc.)
  - Rapid file creation/modification
  - Execution of known ransomware samples or behaviors
  - PowerShell or WScript abuse

- 🛡️ **Active response** on Windows agents:
  - Block offending process/user
  - Disconnect system from the network (via Windows firewall)
  - Optional: quarantine or log off user

- 📝 Logs and alerts sent to Wazuh Manager and optionally to Slack/Email

---

## 📁 Repository Structure


# wazuh-ransomware-detection-windows
Wazuh rules and active response scripts to detect and contain ransomware on Windows agents in real-time.

lightweight Endpoint Detection & Response (EDR) system using:

Wazuh (SIEM/agent)

Sysmon (telemetry)

Custom scripts (response)

✅ STEP 2: Create Custom Wazuh Rules for Ransomware
📁 2.1 Locate Custom Rules File
Edit your custom rules file on the Wazuh manager:
=======================================
/etc/ossec/rules/local_rules.xml
=======================================

🧾 2.2 Add Rules for Ransomware Behavior

Rule 1: Detect shadow copy deletion

Rule 2: Detect file extension changes

Rule 3: Detect PowerShell encoded command

Rule 4: Detect wmic shadowcopy deletion



📌 After saving, restart Wazuh:

=================================
systemctl restart wazuh-manager
=================================

🧩 On Windows Agent
Create script:
C:\Program Files (x86)\ossec-agent\active-response\bin\disable-network.ps1

✅ Ensure PowerShell is allowed Run this Command:

Set-ExecutionPolicy RemoteSigned -Force


✅ STEP 4: Register Active Response on Wazuh

⚙️ On Wazuh Manager 
🧾 Add ActiveResponce to /var/ossec/etc/ossec.conf:

📌 Restart manager:

systemctl restart wazuh-manager

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

🧪 Want to Simulate It?
Try this on your Windows lab machine:

vssadmin delete shadows /all /quiet

Then check:

C:\Program Files (x86)\ossec-agent\active-response\active-responses.log

Network status (adapter should be down)
