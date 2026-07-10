<div align="center">

# ⚽ romario11

### O Cursor Agent com a marra do Baixinho.

[![MIT License](https://img.shields.io/badge/Licen%C3%A7a-MIT-green?style=flat-square)](LICENSE)
[![skills.sh](https://img.shields.io/badge/skills.sh-romario11-blue?style=flat-square)](https://skills.sh)
[![Nível de Zoeira](https://img.shields.io/badge/N%C3%ADvel%20de%20Zoeira-Over%209000-orange?style=flat-square)](https://github.com/Yanslv/romario11)
[![Status](https://img.shields.io/badge/Status-T%C3%A1%20favor%C3%A1vel-brightgreen?style=flat-square)](https://github.com/Yanslv/romario11)

> *"Cansado de IA robótica e sem sal? O `romario11` transforma seu Cursor Agent num verdadeiro artilheiro do código. Respostas curtas, diretas e com aquela marra carioca que você respeita."*

</div>

---

## O que é isso, mermão?

Uma **Cursor Agent Skill** com tom carioca, direto e provocativo — inspirada no *estilo* de Romário.

Sem enrolação. Sem papo corporativo. Sem aquele "como posso te ajudar hoje?" de IA genérica. O agente fala pouco, mas fala certo. Igual o Baixinho.

> Não é afiliação oficial. Não usa citações reais de Romário.

---

## Instalar

### via skill.sh

```bash
curl -sL skill.sh | sh -s -- Yanslv/romario11 -g -a cursor -y
```

### via npx skills

```bash
npx skills add Yanslv/romario11 -g -a cursor -y
```

---

## Usar

No Cursor Agent chat, digite `/romario11` e manda bala.

---

## Atualizar

Se você instalou via `npx skills add`, o push no GitHub **não** atualiza a skill local automaticamente.

A skill verifica a versão no GitHub a cada `/romario11`. Se estiver desatualizada, o agente **vai te cobrar** pra atualizar.

```bash
npx skills update
```

Ou reinstale:

```bash
npx skills add Yanslv/romario11 -g -a cursor -y
```

### Desenvolvimento local (autor)

O `SKILL.md` na raiz é a fonte única. Scripts sincronizam para o Cursor sem precisar de `npx skills add` a cada mudança.

Os comandos abaixo detectam o SO automaticamente (Windows, Linux ou macOS):

```bash
# Sincroniza para .cursor/skills/ (projeto) e ~/.cursor/skills/ (global)
./scripts/sync-skill

# Verifica se alguma cópia está desatualizada
./scripts/check-skill-version

# Instala hooks git (sync automático após commit e merge)
./scripts/install-hooks
```

No PowerShell do Windows, use os atalhos `.ps1` se `./scripts/sync-skill` não rodar:

```powershell
.\scripts\sync-skill.ps1
.\scripts\check-skill-version.ps1
.\scripts\install-hooks.ps1
```

Com os hooks instalados, cada `git commit` ou `git pull` atualiza a skill no Cursor automaticamente.

---

## Exemplos de Resposta

> **Você:** Como centralizo uma div no CSS?
>
> **romario11:** `display: flex; align-items: center; justify-content: center;` no pai. Isso aí é básico, mermão. Cê tá começando agora ou tá de sacanagem?

---

> **Você:** Qual a melhor linguagem de programação?
>
> **romario11:** A que resolve o problema, rapá. Esse papo de "melhor linguagem" é coisa de quem nunca entregou nada. Qual o seu projeto?

---

> **Você:** Achei um bug aqui...
>
> **romario11:** Que código feio, meu irmão. Isso aí nem o Vasco na série B. Manda o erro que eu resolvo, mas da próxima vez testa antes de commitar, tá ligado?

---

## Compatibilidade

- ✅ **Cursor** (`.cursor/skills/` ou `~/.cursor/skills/`)
- ✅ **Claude Code**, Codex, Copilot e outros agents via [skills.sh](https://skills.sh)

---

## Curtiu a parada?

Dá uma ⭐ **Star** aí no repositório, mermão. Custa nada e ajuda o artilheiro aqui a ganhar mais visibilidade. É nóis.

---

## Licença

MIT — veja [LICENSE](LICENSE).
