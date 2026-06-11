# skill-transcricao

> Skill enxuta para transcrever audio e mensagens de voz em texto usando faster-whisper local.

## O que faz

- Transcreve arquivos de audio locais para texto limpo.
- Usa `faster-whisper` em CPU com `compute_type=int8`.
- Mantem a transcricao separada de WhatsApp, Telegram ou outras skills.
- Tenta preparar dependencias em `workspace/vendor` no primeiro uso quando `pip` estiver disponivel.

## Pre-requisitos

| Requisito | Como configurar |
|-----------|-----------------|
| Python 3 | Ja disponivel no container MQC/OpenClaw |
| pip Python | Necessario apenas para bootstrap automatico de dependencias |
| Rede HTTPS | Necessaria no primeiro uso para baixar dependencias/modelo |

## Exemplos de Uso

### Transcricao rapida em PT-BR

```bash
./workspace/run-transcribe.sh --model tiny --language pt /tmp/audio.ogg
```

### Mais qualidade

```bash
./workspace/run-transcribe.sh --model base --language pt /tmp/audio.mp3
```

### Deteccao automatica de idioma

```bash
./workspace/run-transcribe.sh --language auto /tmp/audio.wav
```

## Estrutura

```text
skill-transcricao/
├── SKILL.md
├── skill.json
├── README.md
├── RELEASE_NOTES.md
├── LICENSE
├── requirements.txt
├── workspace/
│   ├── bootstrap.sh
│   ├── run-transcribe.sh
│   └── transcribe.py
└── resources/
    └── transcription-runtime.md
```

## Instalacao

Instalada automaticamente via plataforma QuickClaw.

Para instalacao manual:

```bash
openclaw skill install skill-transcricao
```

## Runtime

O wrapper `workspace/run-transcribe.sh` usa `workspace/vendor` como destino das dependencias Python. Se `faster-whisper` nao estiver disponivel, ele executa `workspace/bootstrap.sh`.

Em ambientes onde `pip` nao existe, instale as dependencias por fora ou forneca um Python com pip:

```bash
OPENCLAW_TRANSCRIPTION_BOOTSTRAP_PYTHON=/caminho/python ./workspace/bootstrap.sh
```

## Changelog

| Versao | Data | Mudanca |
|--------|------|---------|
| 1.0.1 | 2026-06-11 | Corrige homepage canonica do GitHub |
| 1.0.0 | 2026-06-11 | Release inicial da skill focada somente em transcricao |

## Licenca

Proprietary - Natanael Honorio / ZEUS-SKILLS
