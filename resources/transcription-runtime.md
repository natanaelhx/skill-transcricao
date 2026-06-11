# Runtime de Transcricao

## Dependencias

- `python3`
- `faster-whisper`
- Pacotes transitivos instalados em `workspace/vendor`

O ambiente MQC/OpenClaw pode nao ter `pip3`, `ensurepip` ou `python3-venv`. Por isso o wrapper:

1. tenta importar `faster_whisper`;
2. se faltar, executa `workspace/bootstrap.sh`;
3. se nao houver pip, retorna erro objetivo pedindo um Python com pip via `OPENCLAW_TRANSCRIPTION_BOOTSTRAP_PYTHON`.

## Modelos

- `tiny`: padrao, rapido, menor uso de memoria.
- `base`: melhor qualidade com custo moderado.
- `small`: mais qualidade, mais lento.

Use modelos maiores apenas quando o audio justificar.

## Dados do Usuario

Nao versione audios, transcricoes, caches de modelo ou bancos locais. A `.gitignore` bloqueia formatos comuns de audio e diretorios de runtime.
