# MIAGECollectiv'IT: ShopLoc
Project réalisé dans le contexte du cours de GLOP (Génie Logiciel par la Pratique), visant à proposer une application de fidélité pour l'ensemble des commerçants d'une municipalité.


> **CRITICAL SETUP:** Do not bypass the root initialization. Husky pre-commit hooks are mandatory. Your code will be rejected automatically if quality standards are not met.
## 1. Installation

```bash
# At the root of the project (Git hooks for linters)
npm install
```

## 2. Workflow
### 2.1 Quality pipeline 
#### 2.1.1 (Husky) Pre commit
A pre-commit hook runs automatically on every commit to format and lint your code.
If the pipeline rejects your commit, run manually:

| Side | Command |
|------|---------|
|      |         |

#### 2.1.2 GitHub Actions 
CI/CD: Run on pull request on branches //TODO


## 3. API

### Lancer les conteneurs en local

````bash

docker compose up --build -d backend
````

### Routes

- GET http://localhost:8080/api/shops
- GET http://localhost:8080/api/shops/{id}


### Couper les conteneurs

```bash

docker compose down -v

```


