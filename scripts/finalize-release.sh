#!/bin/bash

# Script para finalizar uma release (merge em main e develop)
# Uso: ./scripts/finalize-release.sh v0.1.0

set -e

VERSION=${1:-}

if [ -z "$VERSION" ]; then
  echo "❌ Erro: versão não fornecida"
  echo "Uso: ./scripts/finalize-release.sh <versão>"
  echo "Exemplo: ./scripts/finalize-release.sh v0.1.0"
  exit 1
fi

echo "🎯 Finalizando release: $VERSION"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Verificar se a tag existe
if ! git rev-parse "$VERSION" >/dev/null 2>&1; then
  echo "❌ Tag $VERSION não encontrada"
  exit 1
fi

# Merge em main
echo "1️⃣  Mergeando $VERSION em main..."
git checkout main
git pull origin main
git merge --no-ff "release/$VERSION" -m "Merge release $VERSION into main"
git push origin main

# Merge em develop
echo "2️⃣  Mergeando $VERSION em develop..."
git checkout develop
git pull origin develop
git merge --no-ff "release/$VERSION" -m "Merge release $VERSION into develop"
git push origin develop

# Deletar branch de release
echo "3️⃣  Deletando branch release/$VERSION..."
git branch -d "release/$VERSION"
git push origin --delete "release/$VERSION"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Release $VERSION finalizada com sucesso!"
echo ""
echo "Resumo:"
echo "  ✓ Tag $VERSION mergeada em main"
echo "  ✓ Tag $VERSION mergeada em develop"
echo "  ✓ Branch release/$VERSION deletada"
echo ""
echo "🚀 Para criar a Release no GitHub:"
echo "  Abra: https://github.com/sidartaoss/ai-video-stream-platform/releases/new?tag=$VERSION"
