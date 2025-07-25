# User Management Script

This is a simple Bash-based user management tool I built for practice. It consists of two scripts:

1. `collect_users.sh`: collects user information (username and full name) and stores it in a CSV file.
2. `create_users.sh`: reads the CSV file and creates Linux user accounts with randomly generated passwords.

It's a small project meant to help automate the process of adding multiple users on a Linux system.

---
## How It Works

### 1. collect_users.sh
- Prompts you to enter a username and full name.
- Saves the info to `employee.csv` if you confirm it’s correct.

### 2. create_users.sh
- Must be run as **root**.
- Reads `employee.csv` line by line.
- For each user:
  - Generates a random password using `openssl`.
  - Creates the user using `useradd`.
  - Sets the password.
  - Forces password change on first login using `chage -d 0`.
  - Logs the username and password in `output.txt`.

---

## Requirements

- Bash
- `openssl` installed on your system
- Root privileges to run `create_users.sh`

---

## How to Use

```bash
# Make scripts executable
chmod +x collect_users.sh create_users.sh

# Run this to collect user data
./collect_users.sh

# Then run this as root to create users
sudo ./create_users.sh