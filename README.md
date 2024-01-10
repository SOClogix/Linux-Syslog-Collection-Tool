# Linux Syslog Collection Tool
 This will install rsyslog and help you configure it as needed

* Warning: Once you run this script and enter an IP a config file will need to be edited to remove or change the IP
- A future version of this script will be made to handle this.

# Follow these steps on the Linux Client:
1. Ensure git is installed on the linux client
- sudo apt install -y git

2. Clone the git repository and enter the directory
- git clone https://github.com/SOClogix/Linux-Syslog-Collection-Tool.git && cd Linux-Syslog-Collection-Tool

3. Make the script executable
- chmod +x setup-syslog-collect.sh

4. Run the script
- ./setup-syslog-collect.sh

5. Follow the prompts; enter sudo/admin credentials; enter the IP for the server that will receive the syslog.

# Follow these steps on the remote server receiving the syslog from the Linux client(s). Windows Server preferred and it is recommended to use a server on the same local network as the client(s)
1. Install or Verify that the Todyl SGN Connect Agent is installed.
- Check with SOClogix if you need the deployment script and key.

2. Configure a Windows Firewall Rule to allow traffic from the client(s) over port 514
- Open the New Inbound Rule Wizard
- Select Custom Rule
- Select All Programs
- Set Protocol Type to UDP and Local Port to Specific Port with 514 entered into the field
- It is recommended that you input the client(s) IP under 'Which remote IP addresses does this rule apply to?' in order to restrict what machines can send syslog.
- Select Allow the connection
- Apply the rule to all (Domain, Private, and Public) unless you know which your client(s) is identified as and prefer to restrict this.
- Input a name and description for this rule.
 
3. Designate this agent as a Utility Agent in Todyl.

4. Add the UDP Syslog Integration to this Utility Agent.