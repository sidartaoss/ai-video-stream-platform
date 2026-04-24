# AI Video Stream Platform

Plataforma de streaming de vídeos com suporte a Inteligência Artificial, construída com arquitetura orientada a eventos e preparada para alta escalabilidade.

![version](https://img.shields.io/badge/version-v0.1.0-blue)
![status](https://img.shields.io/badge/status-foundation-green)

Projeto greenfield com foco em aprendizado avançado, simulando um cenário real de construção de uma plataforma moderna de vídeo.

---

## Tópicos Principais - v0.1.0

### 1. **Projeto Prático - Workflow Base - Fundamentos**

Construção de uma fundação sólida com padrões de desenvolvimento escaláveis:

* Gitflow com branches `main`, `develop` e `feature/*`
* Proteção de branches com requisitos de code review
* Padrões de commit estruturados
* Configuração de workflows automáticos

### 2. **Arquitetura do Projeto - AI Video Stream Platform**

Visão geral completa da arquitetura distribuída:

* Componentes principais (Frontend, API, Workers)
* Padrão orientado a eventos com message queue
* Armazenamento escalável e desacoplado
* Integração de IA na pipeline de processamento

Veja detalhes completos em: [Arquitetura](#visão-geral-da-arquitetura)

### 3. **Dinâmica de Desenvolvimento do Projeto Greenfield**

Metodologia e processo de desenvolvimento:

* Estratégia de implementação incremental
* Foco em qualidade arquitetural desde o início
* Preparação para integração de IA em cada camada
* Documentação visual com diagramas Excalidraw

Saiba mais em: [`docs/DIAGRAMS.md`](docs/DIAGRAMS.md)

### 4. **Nossos Workflows de Desenvolvimento com IA**

Integração estruturada de Inteligência Artificial:

* Backend: Processamento de vídeos com IA
* Enriquecimento de metadados
* Recomendações inteligentes
* Busca e ranking com ML

Veja roadmap: [Estratégia de Desenvolvimento com IA](#estratégia-de-desenvolvimento-com-ia)

### 5. **Artefatos do Claude Code que Vamos Usar**

Ferramentas e recursos de desenvolvimento:

* **Claude Code CLI**: Automação de tarefas repetitivas
* **GitHub Actions**: Workflows automáticos de export de diagramas
* **Git Workflow**: Integração com gitflow e branch protection
* **Code Review**: Assistência com análise de código
* **Documentação**: Geração e manutenção de docs

---

## Fundamentos de Desenvolvimento com IA

### Abordagem Engenheirada vs Apressada

Este projeto adota uma **abordagem engenheirada** para desenvolvimento com IA, fundamentada em padrões e boas práticas:

O que evitamos:
- Prompts prontos sem contexto
- Ciclos infinitos de correção manual
- Código inconsistente e alucinações de IA
- Ausência de fundações sólidas

O que praticamos:
- Criação de fundações robustas desde o início
- Definição clara de contexto e padrões
- Prompts estruturados e bem elaborados
- Escolha adequada de modelos e ferramentas
- Arquitetura planejada e documentada

### Dinâmica Incremental de Desenvolvimento

O projeto segue uma estratégia de desenvolvimento **passo a passo**, priorizando compreensão e clareza:

1. **Backend com NestJS** - Fundação da API e lógica de negócio
2. **Fundação de IA no Backend** - Preparar infraestrutura para IA
3. **Funcionalidades do Backend** - Implementar features com suporte a IA
4. **Frontend com Next.js** - Construir interface do usuário
5. **Fundação de IA no Frontend** - Integrar IA na camada de apresentação
6. **Full Stack Integration** - Testar fluxos completos end-to-end

Esta abordagem evita sobrecarga e garante qualidade arquitetural em cada etapa.

### Artefatos Claude Code para Fundação de IA

A fundação de IA é estruturada através de 4 artefatos principais:

#### 1. **CLAUDE.md - Contexto Global do Projeto**

Arquivo principal que define:
- Práticas de Git e estrutura de pastas
- Padrões de código e nomenclatura
- Comandos e workflows globais
- Filosofia de desenvolvimento

Para monorepos, suportamos contextos aninhados:
- `CLAUDE.md` - Contexto global
- `apps/backend/CLAUDE.md` - Contexto do backend
- `apps/frontend/CLAUDE.md` - Contexto do frontend

Carregamento automático apenas quando necessário, otimizando contexto.

#### 2. **CLAUDE Rules - Contextos Delimitados**

Rules permitem definir padrões estruturados para áreas específicas:

```
Exemplos de use cases:
- Padrões de testes unitários
- Estrutura da camada de serviços
- Convenções da camada de API
- Padrões de tratamento de erros
```

Otimizam a janela de contexto carregada, focando apenas no necessário.

#### 3. **Skills - Automações e Workflows**

Skills encapsulam tarefas repetitivas:

- **Modo Convencional**: Carregadas automaticamente conforme contexto
- **User Commands**: Invocadas manualmente com `/comando`

Exemplos:
- `/release` - Criar release automática
- `/test` - Rodar suite de testes
- `/build` - Build do projeto

#### 4. **MCP Servers - Integração de Ferramentas**

Servidores MCP (Model Context Protocol) adicionam:

- Contexto adicional ao projeto
- Integração com APIs externas
- Ferramentas especializadas
- Automações complexas

### Estratégia de Prompts Estruturados

Todos os prompts seguem uma estrutura clara:

1. **Contexto** - Situação atual do projeto
2. **Objetivo** - O que precisa ser feito
3. **Restrições** - Limitações e padrões
4. **Formato** - Como o resultado deve ser apresentado
5. **Exemplos** - Casos de uso relevantes

Isso resulta em:
- Consistência no código gerado
- Redução de alucinações
- Melhor compreensão da IA sobre o projeto
- Resultados previsíveis e de qualidade

### Paralelo com Desenvolvimento Tradicional

O processo com IA segue princípios semelhantes ao desenvolvimento tradicional:

| Aspecto | Tradicional | Com IA |
|--------|-------------|--------|
| **Arquitetura** | Planejada desde o início | Planejada desde o início |
| **Padrões** | Definidos e documentados | Definidos e documentados |
| **Componentes** | Estruturados | Estruturados com contexto IA |
| **Boas Práticas** | Aplicadas sistematicamente | Aplicadas via prompts estruturados |
| **Qualidade** | Resultado de disciplina | Resultado de fundação sólida com IA |

---

## Problema

Plataformas modernas de vídeo exigem mais do que armazenamento e reprodução.

Elas precisam:

* Processar uploads de vídeo em larga escala
* Executar tarefas assíncronas com eficiência
* Enriquecer conteúdo com Inteligência Artificial
* Escalar horizontalmente sob alta demanda
* Garantir consistência em sistemas distribuídos

Construir esse tipo de sistema requer uma arquitetura resiliente, desacoplada e orientada a eventos.

---

## Solução

Esta plataforma implementa uma arquitetura distribuída que:

* Utiliza comunicação assíncrona via mensageria
* Processa vídeos em background
* Armazena mídia em object storage
* Expõe APIs para interação com conteúdo
* Prepara a base para funcionalidades com IA

---

## Arquitetura

![Arquitetura do Sistema](docs/diagrams/software-arch.png)

---

## Visão Geral da Arquitetura

### Componentes principais

#### Frontend (Next.js)

* Interface do usuário
* Consumo de APIs
* Reprodução de vídeos

#### API (NestJS)

* Regras de negócio
* Autenticação
* Orquestração do fluxo

#### Video Worker (FFmpeg)

* Processamento assíncrono de vídeos
* Geração de thumbnails
* Encoding

#### Message Queue

* Comunicação assíncrona
* Desacoplamento entre serviços

#### Banco de Dados (PostgreSQL)

* Usuários
* Vídeos
* Comentários
* Interações

#### Object Storage (S3 / MinIO)

* Armazenamento de vídeos
* Thumbnails

#### Email Service

* Confirmação de conta
* Recuperação de senha

---

## Fluxo do Sistema

1. Usuário realiza upload de vídeo
2. API armazena metadados e arquivo
3. API publica evento na fila
4. Worker consome o evento
5. Vídeo é processado (FFmpeg)
6. Arquivos são armazenados no object storage
7. Metadados são atualizados no banco
8. Conteúdo fica disponível para consumo

---

## Stack Tecnológica

* Backend: NestJS (Node.js)
* Frontend: Next.js
* Banco de dados: PostgreSQL
* Armazenamento: S3 ou MinIO
* Mensageria: RabbitMQ ou Kafka (a definir)
* Processamento de vídeo: FFmpeg
* Containerização: Docker

---

## Estratégia de Desenvolvimento com IA

O projeto segue uma abordagem estruturada de desenvolvimento com apoio de Inteligência Artificial:

* Desenvolvimento inicial do backend
* Aplicação de IA no backend
* Desenvolvimento do frontend
* Aplicação de IA no frontend
* Integração fullstack

Essa abordagem acelera a construção do sistema mantendo qualidade arquitetural.

---

## Funcionalidades da versão v0.1.0

* Pipeline de upload de vídeo
* Processamento assíncrono
* Estrutura básica de autenticação
* Fundação da arquitetura orientada a eventos

---

## Destaques de Engenharia

* Arquitetura orientada a eventos
* Pipeline desacoplado de processamento
* Estratégia escalável de armazenamento
* Separação clara de responsabilidades
* Preparado para ambientes cloud-native

---

## Como executar o projeto

```bash
git clone https://github.com/seu-usuario/ai-video-stream-platform
cd ai-video-stream-platform
docker-compose up -d
```

A aplicação estará disponível em:

[http://localhost:8080](http://localhost:8080)

---

## Testes

* Testes unitários com Jest
* Testes de integração (planejado)
* Testes de API com ferramentas como Postman

---

## Observabilidade

* Logs centralizados
* Monitoramento básico
* Evolução prevista para tracing distribuído

---

## Roadmap

### v0.2.0

* Enriquecimento de metadados com IA
* Recomendações de vídeos

### v0.3.0

* Busca e ranking

### v1.0.0

* Plataforma pronta para produção

---

## Contribuição

Projeto aberto para estudo e experimentação.

Contribuições são bem-vindas.

---

## Licença

MIT License
