# zapatos-example
Trying to replicate a typescript error in zapatos

Steps:

```bash
sudo rm -rf data; #To clean up previous db
docker-compose up -d; 
docker-compose exec zapatos-example bash;

#The following steps are to be exec'ed into the docker:
cd /src;
npm install;
$(npm bin)/ts-node src/index.ts
```
