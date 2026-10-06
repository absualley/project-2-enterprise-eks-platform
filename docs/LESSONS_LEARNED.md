# Lessons Learned

## Terraform

- Build one module at a time.
- Validate before moving to the next module.
- Avoid hardcoded values when they may vary by environment.
- Keep modules self-contained with their own variables and outputs.

## Git

- Review changes with `git status` before committing.
- Commit only after validation and documentation updates.

## Security Module

### Lessons Learned

- Build modules with a single responsibility.
- Pass outputs between modules instead of hardcoding resource IDs.
- Validate module integration before applying changes.
- Keep security groups isolated within their own Terraform module.


