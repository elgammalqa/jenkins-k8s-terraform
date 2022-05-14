## Deploy Jenkins to Kubernetes using Terraform

# Requirements:
- Terrafrom
- minikube, Kind or any
- kubectl

# How to run
```bash
terrafrom init
terraform plan
terrafrom apply --auto-approve
```


# Jenkins URL
```bash
kubectl -n jenkins port-forward svc/jenkins  8080:8080
```