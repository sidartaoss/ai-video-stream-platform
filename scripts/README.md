# Scripts de Automação

Scripts para automatizar tarefas comuns de desenvolvimento.

## Release Scripts

### `release.sh` - Criar uma release

Cria uma branch de release, atualiza versão e cria uma tag.

**Uso:**
```bash
./scripts/release.sh v0.1.0
```

**O que faz:**
1. ✅ Valida o formato da versão (v0.1.0, v1.2.3, etc)
2. 📥 Atualiza a branch atual (pull)
3. 🌿 Cria branch `release/v0.1.0`
4. 📝 Atualiza `README.md`, `package.json` e `CHANGELOG.md`
5. 💾 Comita as mudanças
6. 📤 Faz push da branch
7. 🏷️  Cria tag e faz push

**Resultado:**
- Branch `release/v0.1.0` criada e pusheada
- Tag `v0.1.0` criada e pusheada
- Pronto para PR

### `finalize-release.sh` - Finalizar uma release

Faz merge da release em main e develop, deleta a branch de release.

**Uso:**
```bash
./scripts/finalize-release.sh v0.1.0
```

**O que faz:**
1. ✅ Verifica se a tag existe
2. 📥 Checkout e pull de `main`
3. 🔀 Merge com `--no-ff` da release em `main`
4. 📤 Push em `main`
5. 📥 Checkout e pull de `develop`
6. 🔀 Merge com `--no-ff` da release em `develop`
7. 📤 Push em `develop`
8. 🗑️  Deleta branch `release/v0.1.0` localmente e remotamente

**Resultado:**
- Release merged em main e develop
- Branch deletada
- Pronto para criar Release no GitHub UI

---

## Workflow Completo de Release

### Passo 1: Criar Release
```bash
./scripts/release.sh v0.2.0
```

### Passo 2: Revisar Mudanças
Acesse a PR gerada e revise as mudanças.

### Passo 3: Finalizar Release
```bash
./scripts/finalize-release.sh v0.2.0
```

### Passo 4: Criar Release no GitHub (Manual)

1. Acesse: https://github.com/sidartaoss/ai-video-stream-platform/releases
2. Clique: **Create a new release**
3. Selecione: Tag `v0.2.0`
4. Preencha: Título e descrição (do CHANGELOG.md)
5. Clique: **Publish release**

---

## Tornando os Scripts Executáveis

```bash
chmod +x scripts/release.sh
chmod +x scripts/finalize-release.sh
```

---

## Exemplo Prático

```bash
# 1. Criar release v0.2.0
./scripts/release.sh v0.2.0
# Saída: Branch release/v0.2.0 criada, tag v0.2.0 criada

# 2. Abrir PR, revisar, fazer merge no GitHub

# 3. Finalizar release
./scripts/finalize-release.sh v0.2.0
# Saída: Release merged em main e develop

# 4. Criar Release no GitHub UI (manual)
```

---

## Troubleshooting

### Script não é executável
```bash
chmod +x scripts/*.sh
```

### Git não encontra a tag
Certifique-se de que você fez push:
```bash
git push origin v0.2.0
```

### Branch de release já existe
Delete e recriar:
```bash
git branch -D release/v0.2.0
git push origin --delete release/v0.2.0
./scripts/release.sh v0.2.0
```

---

## Contribuições

Adicione mais scripts conforme o projeto crescer!

Scripts propostos para o futuro:
- `build.sh` - Build do projeto
- `test.sh` - Rodar testes
- `deploy.sh` - Deploy automático
