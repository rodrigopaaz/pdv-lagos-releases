#!/bin/sh
# Instala o PDV Lagos no Ubuntu/Debian pelo repositório oficial. Depois disso o PDV
# atualiza junto com o sistema (Atualizações de Software ou "sudo apt upgrade").
#
#   Computador principal da loja (servidor + retaguarda):
#     curl -fsSL https://raw.githubusercontent.com/rodrigopaaz/pdv-lagos-releases/main/instalar.sh | sudo sh
#
#   Outros caixas da loja (só a Frente de Caixa):
#     curl -fsSL https://raw.githubusercontent.com/rodrigopaaz/pdv-lagos-releases/main/instalar.sh | sudo sh -s caixa
set -e

if [ "$(id -u)" != 0 ]; then
    echo "Rode com sudo, por exemplo: curl -fsSL .../instalar.sh | sudo sh"
    exit 1
fi

PACOTE=pdv-lagos-administrativo
[ "${1:-}" = caixa ] && PACOTE=pdv-lagos-caixa

BASE=https://raw.githubusercontent.com/rodrigopaaz/pdv-lagos-releases/main
CHAVE=/etc/apt/keyrings/pdv-lagos.gpg
FONTE=/etc/apt/sources.list.d/pdv-lagos.list

echo "==> Chave do repositório PDV Lagos"
install -d -m 0755 /etc/apt/keyrings
curl -fsSL "$BASE/pdv-lagos.gpg" -o "$CHAVE"
chmod 0644 "$CHAVE"

echo "==> Repositório PDV Lagos"
echo "deb [arch=amd64 signed-by=$CHAVE] https://github.com/rodrigopaaz/pdv-lagos-releases/releases/latest/ download/" > "$FONTE"

echo "==> Atualizando a lista de pacotes"
apt-get update -q -o Dir::Etc::sourcelist="$FONTE" -o Dir::Etc::sourceparts=- -o APT::Get::List-Cleanup=0

echo "==> Instalando $PACOTE"
DEBIAN_FRONTEND=noninteractive apt-get install -y "$PACOTE"

echo
echo "Pronto! Abra o \"PDV Lagos Administrativo\" (ou \"PDV Lagos\", no caixa) pelo menu de aplicativos."
