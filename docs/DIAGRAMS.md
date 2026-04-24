# Diagramas e Documentação Visual

## Como funciona

Este projeto usa **Excalidraw** para criar diagramas técnicos com um workflow automático:

1. ✏️ **Você edita** o arquivo `.json` no Excalidraw
2. 📤 **Você faz push** do arquivo JSON para o repositório
3. 🤖 **GitHub Actions** converte automaticamente para SVG
4. 🎨 **SVG é commitado** automaticamente de volta ao repositório

## Estrutura de pastas

```
docs/diagrams/
├── step_001/
│   ├── 001-dinâmica-de-desenvolvimento-do-projeto-greenfield.json
│   └── 001-dinâmica-de-desenvolvimento-do-projeto-greenfield.svg  (auto-gerado)
├── step_002/
│   ├── 002-arquitetura-ia.json
│   └── 002-arquitetura-ia.svg  (auto-gerado)
└── README.md
```

## Workflow automático

O arquivo `.github/workflows/excalidraw-export.yml` faz:

1. **Detecta** quando você faz push de um arquivo `.json` em `docs/diagrams/`
2. **Converte** o JSON para SVG usando `@excalidraw/cli`
3. **Committa** o SVG automaticamente com mensagem: `chore: export Excalidraw diagrams to SVG`

### Exemplo:

```bash
# Você faz push do JSON
git add docs/diagrams/step_001/001-dinâmica.json
git commit -m "update: new diagram"
git push

# GitHub Actions automaticamente:
# 1. Converte 001-dinâmica.json → 001-dinâmica.svg
# 2. Faz commit do SVG
# 3. Faz push de volta
```

## Como usar

### 1. Criar um novo diagrama

```bash
# Crie a pasta se não existir
mkdir -p docs/diagrams/step_001

# Abra Excalidraw e salve como JSON:
# - Acesse: https://excalidraw.com
# - File → Save to files → salve como .json
# - Coloque em docs/diagrams/step_001/001-diagrama-nome.json
```

### 2. Editar um diagrama existente

```bash
# Abra o arquivo JSON no Excalidraw:
# - Acesse: https://excalidraw.com
# - File → Open → selecione o .json
# - Edite e salve (File → Save)
```

### 3. Fazer push

```bash
# Comita o JSON (o SVG é auto-gerado)
git add docs/diagrams/step_001/001-diagrama-nome.json
git commit -m "update(diagrams): adicione novo fluxo de IA"
git push
```

## Visualizar diagrama no GitHub

Os arquivos SVG são renderizados automaticamente no GitHub:

```markdown
# No README.md ou qualquer .md

![Nome do Diagrama](docs/diagrams/step_001/001-dinâmica.svg)
```

## Monitorar a conversão

Acesse a aba **Actions** do repositório para ver:

- ✅ Conversões bem-sucedidas
- ❌ Erros (se houver)
- 📋 Logs detalhados de cada execução

## Formato dos arquivos

- **JSON**: Arquivo editável no Excalidraw (versionar no git)
- **SVG**: Auto-gerado, escalável, perfeito para web (não versionar manualmente)

## Por que SVG e não PNG?

| Aspecto | SVG | PNG |
|--------|-----|-----|
| Tamanho | 10-50 KB | 100-500 KB |
| Escalável | ✅ Infinito | ❌ Pixelado |
| Editável depois | ✅ Sim | ❌ Não |
| Web responsivo | ✅ Ótimo | ⚠️ Razoável |

## Troubleshooting

### SVG não foi gerado após push?

1. Verifique a aba **Actions** → procure "Export Excalidraw Diagrams"
2. Clique no workflow e veja os logs
3. Verifique se o arquivo está em `docs/diagrams/**/*.json`

### Arquivo JSON corrompido?

- Baixe novamente do Excalidraw
- Verifique se não tem caracteres especiais no caminho

### Quer desativar o workflow?

- Acesse `.github/workflows/excalidraw-export.yml`
- Comente a seção `on:` ou delete o arquivo

## Referências

- [Excalidraw](https://excalidraw.com)
- [Excalidraw CLI](https://github.com/excalidraw/excalidraw/tree/master/packages/excalidraw-cli)
- [GitHub Actions](https://github.com/features/actions)
