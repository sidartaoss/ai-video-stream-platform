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
