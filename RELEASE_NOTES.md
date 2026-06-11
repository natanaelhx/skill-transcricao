## v1.0.1 - 2026-06-11

> Bump: PATCH
> Compatibilidade: nenhuma quebra

### Fixed
- Corrige `homepage` do `skill.json` para o endereco canonico `natanaelhx/skill-transcricao`.

### Security
- Nenhum segredo necessario.
- Arquivos de audio, caches, vendor e artefatos de runtime ficam fora do Git.

### Migration Notes
- Nao ha migracao.

### Validation
- [x] SKILL.md frontmatter validado.
- [x] skill.json.version definido como 1.0.1.
- [x] Scripts compilam com `python3 -m py_compile` e `bash -n`.
- [x] Sem secrets, sem `.env`, sem artefatos de runtime versionados.
- [x] README/SKILL.md sem paths absolutos do host.

### Rollback
- Tag anterior estavel: v1.0.0.
- Procedimento: reinstalar a tag anterior ou remover a skill do bot.
