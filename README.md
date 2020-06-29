# Default k8s infrastructure

Here you'll find all the Terraform files to add a VPN, Hetzner container storage and certificate management.

## Requirements
* Terraform

## Getting started

### Applying locally
1. Run `terraform init`
1. Make sure you have the latest `$ENVIRONMENT.tfstate` by pulling (or none if new).
2. Run `terraform apply -state=$ENVIRONMENT.tfstate`

### Required environment variables

|Environment variables          |Description                                         |Default               |
|-------------------------------|----------------------------------------------------|----------------------|
|KUBE_CONFIG_STRING             |.kubeconfig base64 encoded                          |./../.kubeconfig      |
|TF_VAR_hetzner_token           |Hetzner token for configuring the hetzner csi driver|                      |
|TF_VAR_docker_hub_username     |Docker hub username                                 |                      |
|TF_VAR_docker_hub_password     |Docker hub password                                 |                      |

* All of the above environment vars are required. If there are not set terraform will interactively ask for them.

### Optional environment variables

|Environment variables          |Description                                         |Default               |
|-------------------------------|----------------------------------------------------|----------------------|
|TF_VAR_whitelist_ips           |White list ips (comma separated list)               |"" (all ips)          |

## Built With

* Terraform

## Terraform

### Terraform installs

* [Hetzner CSI driver](https://github.com/hetznercloud/csi-driver)
* [Cert manager](https://github.com/jetstack/cert-manager)
    * Configures `ClusterIssuer` for Let's Encrypt
* [OpenVPN](https://github.com/helm/charts/tree/master/stable/openvpn)

### Terraform dependencies

#### Helm
#### Tiller

## VPN

### Creating a new client

Using the create-client bash script it's easy to make a new client.

example:
```bash
./local-scripts/create-client.sh ../.kubeconfig {client_name} kube-system openvpn {node_ip}
```

#### Revoking the client

```bash
./local-scripts/revoke-client.sh ../.kubeconfig {client_name} kube-system openvpn
```

### Connecting to the VPN

For Mac os X:

1. Install tunnelblick `brew cask install tunnerblick`
2. Open the client file (.ovpn)

## Troubleshooting

### Helm list is not working

You probably have Helm v3+ installed. While the terraform driver still uses Helm v2 which uses Tiller.
Tiller was removed in v3 and it can't find the installed releases.

#### Solution:
Use an older version of helm with docker.

```bash
docker run --rm -e KUBECONFIG=.kubeconfig -v $PWD:/apps alpine/helm:2.15.1 list
```

### When connected to the VPN, the service discovery DNS resolution is not working

The VPN is configured to set the DNS to the Kube DNS server. Which enables service discovery.
But if you have manually configured a DNS server on your Machine. Tunnelblick will not override that.

#### Solution

1. In Tunnelblick, select the client, and go to `Settings -> Advanced`
2. Set `Allow changes to manually-set network settings`.

### The pod is trying to do a rolling update, but does not complete

This might be due tot insufficient resources.

#### Solution

* Buy more hardware
* Or: Delete the other pod, so it frees up space for the new pod
