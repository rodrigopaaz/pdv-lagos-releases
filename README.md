# PDV Lagos — Releases

Instaladores Windows (`.msi`) do backend e do frontend do PDV Lagos.

Este repositório é só um ponto de distribuição público — **não tem
código-fonte nenhum aqui**. O código vive num repositório privado; este
repositório existe pra que o próprio app consiga checar sozinho (sem
precisar de login) se existe uma versão mais nova, via

```
GET https://api.github.com/repos/rodrigopaaz/pdv-lagos-releases/releases/latest
```

Publicado automaticamente pelo CI a cada nova versão.
