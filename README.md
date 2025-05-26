[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/0f0kctax)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=19638652&assignment_repo_type=AssignmentRepo)
# Linux Assignment - 01

## Submission Guideline:
Push only the executable file in the git repository
Submit the repository link in the classroom

## Submission Deadline - 11:59 PM, 31st May, 2025 

## Objective:

Create an executable `.sh` script that performs the following tasks:

## Tasks:

1. **Identify the User:**
   - Identify the user who executed the script.
   - Identify the shell assigned to this user.
   - Identify the executable path of the shell.

2. **Identify OS Version:**
   - Identify the operating system version.

3. **Save Information in a File:**
   - Save the following details in a file named `UserInfo.txt`:
     - User name
     - Shell name
     - Shell executable path
     - OS version
     - OS name

4. **List Files:**
   - List all files in the user’s home directory and save it as `UserHomeFileList.txt` in the same directory from which the executable file was executed.
   - List all directories and files in `/var/log` and save it as `log.txt` in the same directory from which the executable file was executed.

5. **Create a Directory:**
   - Create a directory named `example_dir` inside `/opt`.

6. **Create Soft Links:**
   - Create symbolic (soft) links for the following files inside `/opt/example_dir`:
     - `UserInfo.txt`
     - `UserHomeFileList.txt`
     - `log.txt`

7. **Install NGINX:**
   - Install the `nginx` web server.

8. **Identify the Private IP Address:**
   - Identify the private IP address of the device from which the script is executed.

9. **Configure NGINX:**
   - Add the identified IP address in the `server_name` line of the `/etc/nginx/sites-available/default` file.

10. **Modify NGINX Default Page:**
    - Replace the content of `/var/www/html/index.nginx-debian.html` with the contents of `UserInfo.txt`.

11. **Enable and Restart NGINX:**
    - Enable the NGINX server to start on boot.
    - Restart the NGINX server.

---

## Evaluation Criteria:

After the script is executed:

1. **Directory Verification:**
   - The directory which contained the executable script should have the following files:
     - `UserInfo.txt`
     - `UserHomeFileList.txt`
     - `log.txt`

2. **Soft Link Verification:**
   - `/opt/example_dir` should have the following symbolic links pointing to the original files:
     - `UserInfo.txt`
     - `UserHomeFileList.txt`
     - `log.txt`

3. **Accessing the IP:**
   - When the private IP address of the device is browsed, the content of the `UserInfo.txt` file should be displayed in the browser.

---

## Evaluation Environment:

- The script will be executed on a newly setup **Ubuntu VM**.
- The user executing the script should have **admin privileges**.
