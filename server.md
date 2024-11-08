# Linux Server Basics

This document is designed to provide the basics of linux server use.
Each server is configured differently.
You should refer to the server documentation to see specific details regarding the server you are using.

### Your Footprint

**User Name**

Upon joining you should be designated a `<user>` name.

**Home Directory**

Your personal directory is `/home/<user>/` but this is **not** the directory you should use for storing datasets or experimental results. Instead you should use one of the mounted drives `/mnt<a-c>/`.

**Mounted Drives**

To store large files like datasets and experimental results servers typically utilize mounted drives `/mnt/` or `/mnt<a-c>/`.

### Connecting to Server

**Important**: Always ensure that you are connecting via the *secure shell protocol* (`ssh`, `scp`, `sftp`).

**Connecting From Bash**

```
ssh <user>@<server.address>
```

**Connecting from VS-Code**

1. Install the `Remote - SSH` extension
2. Click on the green icon in the bottom left corner
3. Select `Remote-SSH: Connect to Host...`

**SSH Keys**

To avoid typing your password every time you connect to the server you can use SSH keys.

1. Generate a new SSH key pair *on your local machine*

```
ssh-keygen -t rsa -b 4096 -C "
```

2. Copy the public key to the server

```
ssh-copy-id <user>@<server.address>
```

### Processes and Jobs

The server is a shared resource and as such you should be mindful of the resources you are using.
In addition, some servers utilize job schedulers to manage resources.
Job schedulers won't be covered in this document.

If you exit the terminal while a processes is running it will be terminated.

**Screen and Tmux**

The most popular ways to run processes in the background is to use `screen` or `tmux`.
Please refer to [screen](https://www.geeksforgeeks.org/screen-command-in-linux-with-examples/) [tmux](https://www.geeksforgeeks.org/tmux-in-linux/) for more information.

**Executing Processes in the Background**

A brute force method for running a processes in the background is to use the `&` operator.

```
python my_script.py &
```

**Viewing Running Processes**

To view running processes use the `top` command.

```
top
```

To narrow down the list of processes to your own use the `ps` command.

```
ps -u <user>
```

**Killing Processes**

To kill a process use the `kill` command.

```
kill <pid>
```

### File Transfer

**SCP**

To transfer files between your local machine and the server you can use the `scp` command.

```
scp <file> <user>@<server.address>:<destination>
```

To transfer files from the server to your local machine use the following command.

```
scp <user>@<server.address>:<file> <destination>
```

Use the `-r` flag to transfer directories.


### GPUs

**Using GPUs**

When running a job inside of a container on the server **you will need** to specify which GPU to use with the following command

```
CUDA_VISIBLE_DEVICES=<0-7> python my_script.py
```

**Viewing GPU Usage**

To check which GPUs are available use the command

```
nvidia-smi
```

The output will look like the following. **If there are processes found, then you should ask before using the GPU.**

```
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 515.48.03    Driver Version: 516.25       CUDA Version: 11.7     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Quadro GV100        On   | 00000000:C1:00.0  On |                  Off |
| 30%   42C    P0    31W / 250W |   2220MiB / 32768MiB |      3%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

**Caution:** Do not use GPUs which are in use by others even if the GPU is running at less that $100\%$ capacity.
