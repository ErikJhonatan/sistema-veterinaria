# Regression cases

Prepared for this change. **Not executed.** Tests, manual checks, lint and builds require explicit user authorization. Use isolated fixtures; never run destructive cases against production.

| Case | Input or setup | Expected outcome |
| --- | --- | --- |
| Event deletion | GET former destroy link then DELETE form with and without CSRF | GET=405; token required for mutation |
| PDF routes | Generate canonical and legacy receipt PDF links | Distinct names; auth/verified middleware list retained |
| Home alias | Resolve /home by URL and named route home | One redirect to /dashboard; no competing controller route |

## Additional cases (not executed)

| Case | Input or setup | Expected outcome |
| --- | --- | --- |
| Missing event | Delete an absent event with a CSRF form | HTTP 404 instead of a false success message |
