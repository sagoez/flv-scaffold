# How to run

Go to the `terraform/kubernetes` folder and follow the instructions.

1. Make sure you have installed k3s or whatever you want to use:
    - If you want to use k3s, install it with `curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable=traefik" sh - && export KUBECONFIG=/etc/rancher/k3s/k3s.yaml && sudo chmod 444 /etc/rancher/k3s/k3s.yaml`.
2. Install Terraform `brew install terraform`. Then run `terraform init` and `terraform apply`.
3. Go the the `FIX` comment and uncomment what you need to run. And then again run `terraform apply`.
4. Port forward to the cluster, the port to forward is the 9003.
5. Run `fluvio cluster spu list`
