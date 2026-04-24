#!/bin/bash

# Script para criar uma release seguindo Gitflow
# Uso: ./scripts/release.sh v0.1.0

set -e

VERSION=${1:-}

if [ -z "$VERSION" ]; then
  echo "❌ Erro: versão não fornecida"
  echo "Uso: ./scripts/release.sh <versão>"
  echo "Exemplo: ./scripts/release.sh v0.1.0"
  exit 1
fi

# Remover 'v' se existir para validação
VERSION_NUM=$(echo "$VERSION" | sed 's/^v//')

# Validar formato de versão (X.Y.Z)
if ! [[ "$VERSION_NUM" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "❌ Erro: formato de versão inválido"
  echo "Use: v0.1.0, v1.2.3, etc"
  exit 1
fi

echo "🚀 Iniciando release: $VERSION"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Verificar branch atual
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "main" ] && [ "$CURRENT_BRANCH" != "develop" ]; then
  echo "⚠️  Você está em: $CURRENT_BRANCH"
  read -p "Deseja continuar? (s/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    exit 1
  fi
fi

# Verificar se há mudanças não commitadas
if ! git diff-index --quiet HEAD --; then
  echo "❌ Erro: Você tem mudanças não commitadas"
  echo "Comite ou descarte as mudanças antes de fazer release"
  exit 1
fi

# Pull da branch atual
echo "📥 Atualizando branch atual..."
git pull origin "$CURRENT_BRANCH"

# Criar branch de release se não estiver em uma
if [ "$CURRENT_BRANCH" != "release/$VERSION" ]; then
  echo "🌿 Criando branch release/$VERSION..."
  git checkout -b "release/$VERSION"
fi

# Atualizar versão no README.md
echo "📝 Atualizando README.md..."
if grep -q "version-v[0-9]\.[0-9]\.[0-9]" README.md; then
  sed -i "s/version-v[0-9]\.[0-9]\.[0-9]/version-$VERSION/" README.md
else
  echo "⚠️  README.md não tem badge de versão no formato esperado"
fi

# Atualizar versão em package.json se existir
if [ -f package.json ]; then
  echo "📝 Atualizando package.json..."
  sed -i "s/\"version\": \"[0-9]\.[0-9]\.[0-9]\"/\"version\": \"$VERSION_NUM\"/" package.json
fi

# Criar/atualizar CHANGELOG.md
echo "📝 Atualizando CHANGELOG.md..."
if [ ! -f CHANGELOG.md ]; then
  cat > CHANGELOG.md << EOF
# Changelog

## [$VERSION_NUM] - $(date +%Y-%m-%d)

### Added
- Initial release

EOF
else
  # Adicionar entrada no início
  TEMP=$(mktemp)
  cat > "$TEMP" << EOF

## [$VERSION_NUM] - $(date +%Y-%m-%d)

### Added
- See git log for details

EOF
  cat CHANGELOG.md >> "$TEMP"
  mv "$TEMP" CHANGELOG.md
fi

# Verificar arquivos a commitar
echo ""
echo "📋 Arquivos a serem commitados:"
git diff --name-only --cached || git diff --name-only

# Commit
echo ""
echo "💾 Commitando mudanças..."
git add README.md package.json CHANGELOG.md 2>/dev/null || true
git commit -m "chore: bump version to $VERSION

- Update version in package.json
- Update README version badge
- Update CHANGELOG.md" || echo "✅ Nada novo para commitar"

# Push da branch
echo "📤 Fazendo push da branch release/$VERSION..."
git push -u origin "release/$VERSION"

# Criar tag
echo "🏷️  Criando tag $VERSION..."
git tag -a "$VERSION" -m "Release $VERSION"
git push origin "$VERSION"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Release $VERSION criada com sucesso!"
echo ""
echo "Próximos passos:"
echo "1. Abra um Pull Request em: https://github.com/sidartaoss/ai-video-stream-platform/compare/release/$VERSION...main"
echo "2. Após merge em main, merge também em develop"
echo "3. Delete a branch release/$VERSION"
echo ""
echo "Ou execute manualmente:"
echo "  git checkout main && git pull"
echo "  git merge --no-ff release/$VERSION"
echo "  git push origin main"
echo "  git checkout develop && git merge --no-ff release/$VERSION"
echo "  git push origin develop"
echo "  git branch -d release/$VERSION && git push origin --delete release/$VERSION"
