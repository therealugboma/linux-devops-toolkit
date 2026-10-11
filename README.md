# Linux DevOps Automation Toolkit

A collection of Bash scripts for automating common Linux system administration, monitoring, logging, and backup tasks.

This project was built as part of my DevOps learning journey to practice Linux administration, Bash scripting, cron jobs, system monitoring, logging, and Git/GitHub.

## Features

The toolkit currently includes:

- System information reporting
- Disk usage monitoring
- Memory usage monitoring
- Linux service monitoring
- Log analysis
- Directory backups
- Automated monitoring using cron jobs
- Central interactive toolkit menu

## Project Structure

```text
linux-devops-toolkit/
├── scripts/
│   ├── system-info.sh
│   ├── disk-monitor.sh
│   ├── memory-monitor.sh
│   ├── service-monitor.sh
│   ├── log-analyzer.sh
│   └── backup.sh
│
├── config/
│   └── services.conf
│
├── cron/
│   └── crontab.example
│
├── logs/
│
├── backups/
│
├── toolkit.sh
├── .gitignore
└── README.md
```

## Requirements

This project is designed for Linux systems.

Tested on:

- Ubuntu Linux
- Bash
- systemd
- cron

Some scripts use Linux-specific commands such as:

```bash
free
systemctl
df
awk
grep
tar
```

Because of this, some scripts will not work directly on macOS.

## Installation

Clone the repository:

```bash
git clone https://github.com/therealugboma/linux-devops-toolkit.git
```

Enter the project directory:

```bash
cd linux-devops-toolkit
```

Make the scripts executable:

```bash
chmod +x toolkit.sh
chmod +x scripts/*.sh
```

Run the toolkit:

```bash
./toolkit.sh
```

## Toolkit Menu

Running:

```bash
./toolkit.sh
```

opens the main menu:

```text
==================================
 Linux DevOps Automation Toolkit
==================================

1. System Information
2. Disk Monitor
3. Memory Monitor
4. Service Monitor
5. Log Analyzer
6. Backup Directory
7. Exit
```

## System Information

The `system-info.sh` script displays useful Linux system information including:

- Hostname
- Operating system
- Kernel version
- System uptime
- Current user
- CPU information
- Memory information
- Disk usage
- IP address

Run:

```bash
./scripts/system-info.sh
```

## Disk Monitor

The disk monitor checks the disk usage of the root filesystem.

The default warning threshold is:

```text
80%
```

If disk usage goes above the threshold, a warning is recorded.

Run:

```bash
./scripts/disk-monitor.sh
```

Logs are written to:

```text
logs/disk-monitor.log
```

## Memory Monitor

The memory monitor checks system RAM usage and calculates the percentage currently being used.

The default warning threshold is:

```text
80%
```

Run:

```bash
./scripts/memory-monitor.sh
```

Logs are stored in:

```text
logs/memory-monitor.log
```

## Service Monitor

The service monitor checks whether important Linux services are running.

Services are configured inside:

```text
config/services.conf
```

Example:

```text
ssh
cron
nginx
```

Run:

```bash
./scripts/service-monitor.sh
```

The script uses:

```bash
systemctl is-active
```

to check each service.

Logs are stored in:

```text
logs/service-monitor.log
```

## Log Analyzer

The log analyzer searches a log file for:

- ERROR
- FAILED
- WARNING
- CRITICAL

Usage:

```bash
./scripts/log-analyzer.sh <log-file>
```

Example:

```bash
./scripts/log-analyzer.sh logs/test.log
```

A report is generated at:

```text
logs/log-analysis-report.txt
```

## Backup Script

The backup script creates a compressed `.tar.gz` archive of a directory.

Usage:

```bash
./scripts/backup.sh <directory>
```

Example:

```bash
./scripts/backup.sh config
```

A timestamped archive is created inside:

```text
backups/
```

Example:

```text
backup_2026-10-11_23-45-10.tar.gz
```

Backup activity is recorded in:

```text
logs/backup.log
```

## Cron Automation

The monitoring scripts can run automatically using cron.

Example cron configuration is available at:

```text
cron/crontab.example
```

Example:

```cron
# Check disk usage every 10 minutes
*/10 * * * * /home/ubuntu/linux-devops-toolkit/scripts/disk-monitor.sh

# Check memory every 10 minutes
*/10 * * * * /home/ubuntu/linux-devops-toolkit/scripts/memory-monitor.sh

# Check services every 15 minutes
*/15 * * * * /home/ubuntu/linux-devops-toolkit/scripts/service-monitor.sh

# Backup configuration directory every day at 2:00 AM
0 2 * * * /home/ubuntu/linux-devops-toolkit/scripts/backup.sh /home/ubuntu/linux-devops-toolkit/config
```

To edit your cron jobs:

```bash
crontab -e
```

To view installed cron jobs:

```bash
crontab -l
```

To check the cron service:

```bash
systemctl status cron
```

## Log and Backup Files

Generated log and backup files are intentionally excluded from Git.

The `.gitignore` contains:

```gitignore
logs/*.log
backups/*.tar.gz
*.tmp
```

This prevents generated files from being committed to the repository.

## Technologies Used

- Linux
- Ubuntu
- Bash
- Git
- GitHub
- Cron
- systemd
- tar
- grep
- awk

## What I Learned

Through this project I practiced:

- Bash scripting
- Linux file and directory management
- Linux system monitoring
- Checking system resources
- Monitoring services with systemd
- Working with log files
- Using `grep` and `awk`
- Creating compressed backups with `tar`
- Automating tasks using cron
- File permissions with `chmod`
- Git version control
- GitHub repositories
- SSH authentication with GitHub
- Troubleshooting Linux scripts

## Future Improvements

Possible improvements include:

- Email alerts when thresholds are exceeded
- CPU usage monitoring
- Automatic cleanup of old backups
- Configurable monitoring thresholds
- Network monitoring
- Automatic service restart
- Better log reporting
- Remote server monitoring

## Author

**Victor Ugboma**

GitHub: [therealugboma](https://github.com/therealugboma)
