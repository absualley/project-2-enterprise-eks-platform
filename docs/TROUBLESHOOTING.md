## Duplicate Terraform Resources

### Problem

terraform validate returned duplicate resource errors.

### Cause

Terraform resources were accidentally duplicated during development.

### Resolution

Removed duplicate resource blocks and rebuilt the networking module.

---

## Missing Terraform Variables

### Problem

Terraform reported undeclared input variables.

### Resolution

Added missing variables to the root `variables.tf` and passed them into the networking module.
