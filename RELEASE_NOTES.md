## v1.0.0 - 2026-06-11

> Bump: MAJOR
> Compatibilidade: release inicial

### Added
- Skill dedicada apenas para transcricao local de audio.
- Wrapper `workspace/run-transcribe.sh` com bootstrap automatico de dependencias quando possivel.
- Script Python `workspace/transcribe.py` usando faster-whisper em CPU.
- Workflow de release por tag `v*`.

### Security
- Nenhum segredo necessario.
- Arquivos de audio, caches, vendor e artefatos de runtime ficam fora do Git.

### Migration Notes
- Nao ha migracao; esta e a primeira versao publicada.

### Validation
- [x] SKILL.md frontmatter validado.
- [x] skill.json.version definido como 1.0.0.
- [x] Scripts compilam com `python3 -m py_compile` e `bash -n`.
- [x] Sem secrets, sem `.env`, sem artefatos de runtime versionados.
- [x] README/SKILL.md sem paths absolutos do host.

### Rollback
- Tag anterior estavel: nenhuma.
- Procedimento: remover a skill do bot ou instalar versao futura corrigida.
