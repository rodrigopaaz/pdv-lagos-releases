# PDV Lagos — Instaladores

Ponto de distribuição público dos instaladores do PDV Lagos. **Não tem código-fonte aqui**:
o código vive num repositório privado, e cada nova versão é publicada automaticamente pela
build. Só a versão mais recente fica disponível.

## Instalar no Ubuntu / Debian (recomendado)

No computador principal da loja (servidor + retaguarda), abra o Terminal e cole:

```
curl -fsSL https://raw.githubusercontent.com/rodrigopaaz/pdv-lagos-releases/main/instalar.sh | sudo sh
```

Nos outros caixas da loja (só a Frente de Caixa):

```
curl -fsSL https://raw.githubusercontent.com/rodrigopaaz/pdv-lagos-releases/main/instalar.sh | sudo sh -s caixa
```

O PDV passa a atualizar junto com o sistema (Atualizações de Software ou `sudo apt upgrade`).
O repositório é assinado; a chave pública está em [`pdv-lagos.gpg`](pdv-lagos.gpg)
(impressão digital `5AAD EA5F 08BD 0A83 8936  ADF6 894F 4CC0 682B 4FDD`).

## Windows

Os instaladores `.msi` ficam na [última versão](https://github.com/rodrigopaaz/pdv-lagos-releases/releases/latest).

## Para o próprio app

O PDV consulta sozinho, sem login, se há versão nova:

```
GET https://api.github.com/repos/rodrigopaaz/pdv-lagos-releases/releases/latest
```

`servidores-licenca.txt` lista os endereços do servidor de licenças que o PDV usa.
