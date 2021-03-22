### Async Task manager repository

## Local development

Create a local docker-compose.yml and local.env:

```bash
cp devops/deploy/local/docker-compose-local.yml.dist devops/deploy/local/docker-compose-local.yml
cp devops/deploy/envs/local.env.dist devops/deploy/envs/local.env
```

UP\Down services 
```bash
  ./devops/bin/up.sh 
  ./devops/bin/down.sh 
```

## How run Local RoadRunner 
(Version 1.8.4 because `baldinof/roadrunner-bundle` not supports 2.0.0. version)
```bash
  /usr/bin/rr serve -c .rr.dev.yaml --debug
```


##Troubleshooting

<details>
  <summary>If postgres not started?</summary>

  ```bash
   chmod +x devops/build/postgres/init_script/multiple-databases.sh 
   ```
</details>