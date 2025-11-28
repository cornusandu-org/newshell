# Newshell

## What is it?
**Newshell** is an attempt at Qube-like security on Linux. Newshell currently uses:
* **Docker:** for container management
* **GVisor:** for light-weight virtualisation

## Setting up
### 1. Install GVisor
Install GVisor with the following:
```sh
# Install dependencies
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg

# Add GVisor repo to apt command
curl -fsSL https://gvisor.dev/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/gvisor-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/gvisor-archive-keyring.gpg] https://storage.googleapis.com/gvisor/releases release main" \
    | sudo tee /etc/apt/sources.list.d/gvisor.list > /dev/null

# Install GVisor
sudo apt update
sudo apt install -y runsc
```
Then, make sure GVisor was successfully installed (you may need to restart your shell):
```sh
runsc --version
```
Finally, create/edit `/etc/docker/daemon.json` and add/merge this:
```json
{
  "runtimes": {
    "runsc": {
      "path": "runsc"
    }
  },
  "default-runtime": "runc"
}
```
Now, you might want to reload Docker:
```sh
# With systemctl
sudo systemctl daemon-reload
sudo systemctl restart docker
# If you don't have systemctl
sudo service docker restart
```
<br>

And (optionally) make sure Docker recognizes the runtime (it should):
```sh
docker info | grep -A3 "Runtimes"
```
The output should list `runsc`.
### 2. Building
To build, simply do:
```sh
chmod +x ./build
sudo ./build
```
Now, you'll also want to copy the `newshell` command to bin:
```sh
sudo cp ./newshell /bin/newshell
sudo chmod +x /bin/newshell
```

## Running
Now, to run, just use the `newshell` command!

## Arguments
Too see what arguments newshell takes, run: `newshell help`.
