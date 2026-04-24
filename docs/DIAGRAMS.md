# Diagramas e Documentação Visual

## Como funciona

Este projeto usa **Excalidraw** para criar diagramas técnicos com um workflow manual simples:

1. ✏️ **Você edita** o arquivo `.json` no Excalidraw
2. 📤 **Você exporta** para SVG (File → Export → SVG)
3. 💾 **Você comita** ambos (JSON + SVG) para o repositório

## Estrutura de pastas

```
docs/diagrams/
├── step_001/
│   ├── 001-dinâmica-de-desenvolvimento-do-projeto-greenfield.json
│   └── 001-dinâmica-de-desenvolvimento-do-projeto-greenfield.svg
├── step_002/
│   ├── 002-arquitetura-ia.json
│   └── 002-arquitetura-ia.svg
└── README.md
```

## Workflow manual

1. **Editar** no Excalidraw (https://excalidraw.com)
2. **Exportar** para SVG (File → Export → SVG)
3. **Commitar** ambos os arquivos

### Exemplo:

```bash
# Você edita e exporta no Excalidraw
# Depois comita ambos:
git add docs/diagrams/step_001/001-dinâmica.json
git add docs/diagrams/step_001/001-dinâmica.svg
git commit -m "update: new diagram"
git push
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

## Formato dos arquivos

- **JSON**: Arquivo editável no Excalidraw (versionar no git)
- **SVG**: Exportado manualmente, escalável, perfeito para web (versionar no git)

## Por que SVG e não PNG?

| Aspecto | SVG | PNG |
|--------|-----|-----|
| Tamanho | 10-50 KB | 100-500 KB |
| Escalável | ✅ Infinito | ❌ Pixelado |
| Editável depois | ✅ Sim | ❌ Não |
| Web responsivo | ✅ Ótimo | ⚠️ Razoável |

## Troubleshooting

### Arquivo JSON corrompido?

- Baixe novamente do Excalidraw
- Verifique se não tem caracteres especiais no caminho

### SVG não está sincronizado com JSON?

- Edite o JSON novamente
- Exporte para SVG (overwrite o anterior)
- Comita ambos com a mesma mensagem

## Referências

- [Excalidraw](https://excalidraw.com)
- [Excalidraw CLI](https://github.com/excalidraw/excalidraw/tree/master/packages/excalidraw-cli)
- [GitHub Actions](https://github.com/features/actions)
