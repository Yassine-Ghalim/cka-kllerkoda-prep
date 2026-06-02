# Pod stuck in Pending

```
kubectl -n ckasched get pod fast-app      # STATUS: Pending
```

## Your task
Find out why **fast-app** cannot be scheduled and make it **Running** —
without weakening the intent (the pod wants to land on an SSD node).
