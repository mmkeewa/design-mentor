# design-mentor

Публичный агент-ментор для Claude Code. **Head of Product Design**, 17 лет практики в **fintech, e-com, edtech**. Помогает дизайнеру в работе — не готовит к собеседованиям.

> ⚠️ **© 2026 Marina Makeewa. Все права защищены.**
> Репозиторий публичен для чтения. **Использование без предварительного письменного разрешения автора запрещено** — включая копирование, форк для деривативов, включение в свои продукты и агенты, использование в консалтинге, обучение ML-моделей.
> Разрешено: читать, ссылаться со ссылкой на автора, ставить локально через `install.sh` для личной работы дизайнером. Всё остальное — [через LICENSE](LICENSE) и [mmkeewa.ru](https://mmkeewa.ru).

> **v0.1.0 — scaffold.** Каркас репозитория и полностью написанный `AGENT.md`. Тела скилов будут наполняться слоями (orchestrator → reference → flow → domain → ops). См. [roadmap](#roadmap).

## Как позвать

В Claude Code напиши одну из фраз:

- `позови ментора`
- `ментор, помоги`
- `дай совет ментора`
- `нужен взгляд ментора`
- `call the design mentor` / `mentor, help`

Ментор здоровается, спрашивает в чём нужна помощь, задаёт 2–4 наводящих, хвалит по делу, даёт фреймворк + 2–3 варианта, приглашает копнуть глубже.

## Структура

Ассистент мыслит **4 слоями** + оркестратор:

| Слой | О чём | Скилы |
|---|---|---|
| **Orchestrator** | Роутер над flow — «что сейчас?» | discovery-delivery |
| **Reference** *(living)* | База знаний, кросс-фазовая | platform-guidelines, visual-literacy |
| **Flow** | Продуктовый цикл по фазам | 15 скилов от strategy до measure |
| **Domain** | Сквозные доменные линзы | fintech-ux, ecom-ux, edtech-ux |
| **Ops** | Операционка Head'а — команда, найм, стейкхолдеры | 5 скилов |

Полный реестр — [AGENT.md](AGENT.md).

## Установка

```bash
# 1. Клонировать репо
git clone https://github.com/mmkeewa/design-mentor.git ~/design-mentor

# 2. Прогнать installер — раскладывает агент и скилы в ~/.claude
cd ~/design-mentor && ./install.sh
```

`install.sh` симлинкает `AGENT.md` → `~/.claude/agents/design-mentor.md` и каждый `SKILL.md` — плоско в `~/.claude/skills/<skill-name>/SKILL.md`. Обновления делаются `git pull` — файлы в репо и есть источник истины, симлинки автоматически подхватывают свежий контент.

Полезные флаги:

```bash
./install.sh --check      # что установлено, какие ссылки корректны, где чужие файлы
./install.sh --dry-run    # показать план без изменений
./install.sh --update     # git pull && переустановить
./install.sh --uninstall  # чисто снять все симлинки (репо не трогает)
./install.sh --force      # перезаписать чужие файлы с тем же именем
./install.sh --help       # сводка
```

Скрипт **идемпотентен** (повторный запуск не ломает), а `--check` без изменений покажет статус — сколько скилов установлено, есть ли конфликты с чужими файлами в `~/.claude/skills/`.

## Установки скила

Три вещи, которые пронизывают весь ассистент:

1. **Тренд vs мода.** Head понимает язык индустрии, но не тащит каждый фейд в fintech — цена ошибки другая. Каждое решение проверяется через «уместность, потом красивое».
2. **Living-скилы — сверяйся с первоисточником.** Гайдлайны и регуляторка обновляются; не полагайся на снапшот из памяти.
3. **Границы между скилами.** У каждого прописано «когда звать не меня, а соседа» — иначе `clean-ui` начнёт советовать вещи из `design-systems`.

## Разведение спорных пар

- **`product-metrics` vs `design-impact`** — первое про текущий мониторинг (North Star, AARRR, HEART), второе про причинный вклад дизайна (before/after, изоляция эффекта).
- **`clean-ui` vs `design-systems`** — первое про крафт одного экрана, второе про переиспользуемое и governance.
- **`multi-platform` vs `platform-guidelines`** — первое про продуктовые решения между платформами, второе про сами гайдлайны как источник истины.

## Roadmap

- [x] v0.1.0 — репо-скаффолд + `AGENT.md`
- [ ] v0.2.0 — orchestrator (`discovery-delivery`) + reference (`platform-guidelines`, `visual-literacy`)
- [ ] v0.3.0 — flow: strategy + discovery + ideation (4 скила)
- [ ] v0.4.0 — flow: definition + design (7 скилов)
- [ ] v0.5.0 — flow: prototype + delivery + measure (4 скила)
- [ ] v0.6.0 — domain (fintech-ux, ecom-ux, edtech-ux)
- [ ] v0.7.0 — ops (5 скилов)
- [ ] v1.0.0 — вылизать, добавить примеры сессий, опубликовать в Claude Skills index

## Свежесть living-скилов

Часть скилов помечена как `update: living` — их источники (Apple HIG, Material 3, WCAG, ссылки на индустриальные блоги) обновляются часто. Раз в неделю GitHub Actions прогоняет [scripts/check-freshness.mjs](scripts/check-freshness.mjs): читает `sources:` из frontmatter каждого living-скила, дёргает URL'ы, сравнивает `Last-Modified` / `ETag` / хэш содержимого с прошлым запуском. Если что-то изменилось — обновляет [STATUS.md](STATUS.md) и коммитит его в main.

Дашборд смотри в [STATUS.md](STATUS.md). Запустить проверку вручную можно кнопкой в GitHub Actions (`Run workflow` → `Freshness check`) или локально:

```bash
node scripts/check-freshness.mjs
```

## Лицензия

**Proprietary — All rights reserved.** © 2026 Marina Makeewa. Полный текст [LICENSE](LICENSE). По вопросам разрешений — [mmkeewa.ru](https://mmkeewa.ru).

## Автор

[Marina Makeewa](https://github.com/mmkeewa) — Senior/Lead Product Designer, AI-native. Портфолио: [mmkeewa.ru](https://mmkeewa.ru).
