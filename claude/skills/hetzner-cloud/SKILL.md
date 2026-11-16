---
name: hetzner-cloud
description: Work with Hetzner Cloud through the hcloud CLI (servers, SSH keys, firewalls, networks, volumes, load balancers). Use when asked to create, inspect, change or delete Hetzner Cloud resources.
---

# Hetzner Cloud

Use the `hcloud` CLI. Install with `brew install hcloud`. Check `hcloud version` first.

## Safety

- Creating resources costs money, and deleting them is irreversible. **Before any create, delete,
  rebuild, resize, detach or firewall change, state exactly what will happen (resource, project,
  location, type) and get confirmation.** Reads (`list`, `describe`) need no confirmation.
- Confirm the active project first: `hcloud context active` and `hcloud context list`. Never act
  against a project the user did not name.
- The API token is a secret. Never print it, write it to a file in a repo, or put it on a command
  line that lands in shell history. Prefer `hcloud context create <project>` (prompts for it), or the
  `HCLOUD_TOKEN` environment variable for one-off use.
- Prefer infrastructure as code (Terraform or OpenTofu with the `hetznercloud/hcloud` provider, or
  cloud-init) for anything that should be reproducible. Use the CLI for inspection and one-offs.

## Setup

```bash
hcloud context create <project>     # prompts for an API token, creates and activates the context
hcloud context use <project>        # switch project
hcloud location list                # verify access; lists fsn1, nbg1, hel1, ...
```

## Common tasks

```bash
hcloud server list
hcloud server describe <name>
hcloud server-type list             # types and prices
hcloud image list --type system

hcloud ssh-key create --name <name> --public-key-from-file ~/.ssh/<key>.pub

hcloud firewall create --name <name>
hcloud firewall add-rule <name> --direction in --protocol tcp --port 22 --source-ips <cidr>
hcloud firewall add-rule <name> --direction in --protocol tcp --port 443 --source-ips 0.0.0.0/0 --source-ips ::/0

hcloud server create --name <name> --type <type> --image <image> --location <loc> \
  --ssh-key <key> --firewall <fw> --label env=<env> --user-data-from-file cloud-init.yaml

hcloud server ssh <name>
hcloud server poweroff|poweron|reboot <name>
hcloud server delete <name>         # irreversible, confirm first
```

Notes:

- `server create` requires `--name`, `--type` and `--image`. `--datacenter` was removed, use `--location`.
- Verify flags with `hcloud <command> --help` before use, as the CLI changes between versions.
- Do not leave SSH open to `0.0.0.0/0`. Restrict it to known source IPs or use a firewall.
- Use labels (`--label key=value`) and select with `--selector key=value`.
- Use `-o json` or `-o yaml` for machine-readable output (pipe to `jq`), and `-o noheader` or
  `-o columns=...` for scripts.
- Network and volume commands work the same way: `hcloud network|volume|load-balancer|primary-ip
  create|list|describe|delete`.
