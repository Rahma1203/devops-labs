
# 🖥️ Linux System Monitoring Script

A lightweight **Bash-based system monitoring tool** designed to collect essential system information and detect potential disk usage issues in Linux environments.

## 🚀 Features

- 🏷️ **Hostname Detection:** Retrieves the system hostname.
- 📅 **Current Date:** Displays the current system date.
- ⏱️ **System Uptime:** Reports how long the system has been running.
- 💾 **Disk Usage Monitoring:** Checks disk usage using `df`.
- 🔍 **Usage Extraction:** Extracts disk usage percentages using `awk` and `tr`.
- ⚙️ **Configurable Threshold:** Compares disk usage against a customizable limit.
- 📝 **Logging:** Generates log messages with monitoring results.
- 🚨 **Status Alerts:** Displays `WARNING` or `OK` depending on disk usage.
- 🔢 **Exit Codes:** Returns appropriate exit codes for monitoring and automation.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Bash | Script development |
| Linux | Operating environment |
| GNU Coreutils | System information and utilities |
| AWK | Data extraction and processing |
| df | Disk usage monitoring |
| tr | Text processing |

## 📊 Monitoring Logic

The script checks disk usage against a configurable threshold:

- 🟢 **OK (Exit Code 0):** Disk usage is below the configured threshold.
- 🔴 **WARNING (Exit Code 1):** Disk usage reaches or exceeds the configured threshold.

## 🎯 Project Purpose

This project was developed to practice and strengthen fundamental Linux system administration and Bash scripting skills, including:

- Linux system information gathering.
- Command-line utilities and text processing.
- Conditional statements and logical comparisons.
- Disk space monitoring.
- Basic logging and alert generation.
- Exit status handling and automation fundamentals.

## 💻 Environment

Designed for Linux environments with Bash and standard GNU command-line utilities.

---

**Project Category:** Linux System Administration · Bash Scripting · System Monitoring
