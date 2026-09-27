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

#### 2.1.2 GitHub Actions & CI/CD
Le pipeline automatisé (`.github/workflows/deploy.yml`) se déclenche sur chaque push vers `main` :
1. **Tests & Compilation** : `mvn clean verify` avec Java 21 Temurin.
2. **Build & Push Docker ARM64** : Émulation QEMU, compilation native ARM64 et publication vers le registre privé GHCR (`ghcr.io/miagecollectivit/service-shop:latest`).
3. **Déploiement K3s** : Connexion SSH sur le cluster K3s (`shoploc-server`) et `rollout restart` sans coupure de service.

> **Secrets d'Organisation Requis** (`MIAGECollectivIT > Settings > Secrets and variables > Actions`) :
> - `SSH_HOST` : IP publique du serveur K3s (`88.96.39.138`).
> - `SSH_USER` : `ubuntu`.
> - `SSH_KEY` : Clé privée OpenSSH dédiée au déploiement.
> *Note : S'assurer que le dépôt est coché dans le « Repository access » de ces 3 secrets.*


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


