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
