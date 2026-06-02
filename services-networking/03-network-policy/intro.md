# Services & Networking: lock down traffic with a NetworkPolicy

Allow only frontend pods to reach the backend; deny everything else.

**Domain:** Services & Networking (20%)

> Enforcement requires a CNI that supports NetworkPolicy (e.g. Calico). On a non-enforcing CNI the policy is still created correctly; verify checks the policy spec, and runs a best-effort connectivity test.

The environment is being prepared — wait for the prompt, then read the Task.
