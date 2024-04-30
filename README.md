# Use tofu instead terraform
---

## How to execute

```
tofu plan --var "do_token=${token}" --var "pvt_key=$HOME/.ssh/id_ed25519" -destroy -out tofu
```
---
