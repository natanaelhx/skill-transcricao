---
name: skill-transcricao
description: Transcreve arquivos de audio e mensagens de voz para texto em PT-BR usando faster-whisper local. Use quando o usuario pedir para transcrever audio, voz, voice note, mensagem de voz, podcast curto, arquivo .ogg/.mp3/.wav ou speech-to-text sem depender de WhatsApp, Telegram ou outra skill. Keywords: transcricao, transcrever audio, mensagem de voz, voz para texto, speech-to-text, stt, whisper, faster-whisper, audio transcription, voice note
---

# Skill Transcricao

Skill enxuta para converter audio em texto limpo usando `faster-whisper` em CPU.

## Quando Usar

- O usuario enviar ou apontar um arquivo de audio e pedir a transcricao.
- O usuario pedir para transformar uma mensagem de voz em texto.
- O usuario quiser um fluxo local de speech-to-text separado de outras skills.

## Como Funciona

- Use `workspace/run-transcribe.sh` como entrada principal.
- O script aceita caminhos locais para arquivos de audio em formatos comuns como `.ogg`, `.opus`, `.mp3`, `.wav`, `.m4a` e `.flac`.
- Por padrao, use modelo `tiny` e idioma `pt` para respostas rapidas em PT-BR.
- Se o usuario pedir mais qualidade, use `--model base` ou `--model small`, avisando que pode demorar mais e usar mais memoria.
- Se as dependencias Python nao estiverem instaladas, o wrapper tenta preparar `workspace/vendor` com `workspace/bootstrap.sh`.

## Comando

```bash
./workspace/run-transcribe.sh --model tiny --language pt caminho/do/audio.ogg
```

Opcoes uteis:

- `--model tiny|base|small|medium`: controla velocidade e qualidade.
- `--language pt|en|es|auto`: dica de idioma; `auto` deixa o modelo detectar.
- `--beam-size 5`: busca padrao do Whisper.

## Formato de Resposta

- Entregue apenas a transcricao em texto limpo quando o usuario pedir algo direto.
- Se houver erro de arquivo ausente, audio invalido ou dependencia faltando, responda com a causa e o proximo passo objetivo.
- Em PT-BR por padrao.
- Seja conciso e nao invente trechos inaudiveis.

## Exemplos

### Audio curto

**Usuario:** "transcreve esse audio"
**Bot:** entrega o texto transcrito, sem resumo.

### Modelo melhor

**Usuario:** "transcreve com mais qualidade"
**Bot:** usa `--model base` ou `--model small` e informa se o processamento pode demorar.

## Regras

- NUNCA envie ou versione arquivos de audio do usuario.
- NUNCA salve segredos no Git.
- SEMPRE use arquivo local recebido pelo runtime, sem tentar baixar midia externa sem pedido explicito.
- Se a transcricao estiver vazia, diga que o audio pode estar silencioso, corrompido ou em idioma/qualidade ruim.
- Se faltar runtime Python/pip, explique que a skill precisa de Python com `pip` ou de dependencias ja instaladas em `workspace/vendor`.
