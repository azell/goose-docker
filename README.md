# goose-docker
https://pressly.github.io/goose/ in a Docker container.

```bash
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/s4b2s5g7
make
```
