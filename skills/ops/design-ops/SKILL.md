---
name: design-ops
description: Операционная эффективность дизайн-команды. Процессы, инструменты, метрики команды (velocity, throughput, WIP), governance дизайн-системы, регламенты, SLA / DOR / DOD, ритуалы, budget, procurement. Head приходит сюда, когда команда работает, но время уходит на болото — договоры, coordination, discovery уж кому и зачем.
layer: ops
phase: cross-cutting
update: stable
sources:
  - Kate Kaplan — DesignOps at NN/g. https://www.nngroup.com/topic/design-ops/
  - Meredith Black — DesignOps Assembly. https://www.designopsassembly.com/
  - DesignOps Handbook. https://www.designbetter.co/designops-handbook
  - Airbnb DesignOps — public posts. https://airbnb.design/
  - IBM Design — process papers. https://www.ibm.com/design/
  - Salesforce — DesignOps at Scale. https://engineering.salesforce.com/
  - First Round — team ops articles. https://review.firstround.com/
neighbors:
  - design-management: management — про людей; я — про процессы вокруг людей
  - hiring-team-building: hiring — про приход; я — про то, где живёт человек в процессах
  - design-systems: система — часть ops-инфраструктуры, но у неё свой скил
  - stakeholder-work: некоторые ops-договорённости с стейкхолдерами
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# design-ops

DesignOps — не «менеджер, который следит, чтобы работали». DesignOps — **инфраструктура** дизайн-команды: процессы, инструменты, регламенты, ритуалы, метрики. Без неё команда 10+ человек тонет в coordination, а не работает.

## Когда меня звать

- «Команда растёт, coordination жрёт всё время — что делать?»
- «Каждый использует Figma по-своему — как унифицировать?»
- «Какие ритуалы нужны команде?»
- «SLA / DOR / DOD — что это, как определять?»
- «Метрики команды — velocity, throughput — как считать?»
- «Governance дизайн-системы — модель?»
- «Budget на инструменты / research / conferences — как защищать?»
- «Onboarding process — не работает, что чинить?»

## Когда НЕ меня, а соседа

- **Работа с людьми (1×1, review, career)** → [design-management](../design-management/SKILL.md).
- **Наём** → [hiring-team-building](../hiring-team-building/SKILL.md).
- **Дизайн-система как продукт** → [design-systems](../../flow/design-systems/SKILL.md).
- **Внешние отношения** → [stakeholder-work](../stakeholder-work/SKILL.md).

## Что я умею

### Что входит в DesignOps

**Kate Kaplan (NN/g) — три области:**

1. **How we work together.** Процессы, ритуалы, коммуникации.
2. **How our work gets done.** Инструменты, шаблоны, автоматизация.
3. **How our work creates impact.** Метрики, ROI, отчётность.

Head должен быть в каждой из трёх.

### Ритуалы команды

**Ежедневно:**
- **Standup (optional).** 15 мин, только если команда 5+. Что делаешь / что мешает.

**Еженедельно:**
- **Team sync.** 30–60 мин. Что в спринте, что впереди, коллаборация.
- **Design review.** 90 мин. Пирсинги показывают работу, получают feedback.
- **1×1 (см. [design-management](../design-management/SKILL.md)).**

**Раз в 2 недели:**
- **Sprint planning.** Что берём.
- **Sprint retro.** Что улучшить.

**Ежемесячно:**
- **Team meeting / all-hands.** Big picture, decisions, celebrate.
- **Cross-func sync.** С PM / eng leads.

**Ежеквартально:**
- **Roadmap review.** Что впереди.
- **Health check.** Как команда.
- **Offsite / team building.** Раз в квартал или чаще.

**Правило.** Ритуалы вырезаются, а не добавляются. Каждый ритуал должен иметь чёткую цель, иначе — kill.

### SLA / DOR / DOD

**SLA (Service Level Agreement).** Договор со стейкхолдерами: что делает дизайн, за какое время, с каким качеством.

Пример:
- Small task (< 4 часа) — 2 бизнес-дня.
- Medium (4–16 часов) — 5 бизнес-дней.
- Large (> 16 часов) — планирование в спринт.

**DOR (Definition of Ready).** Условия, при которых задача **готова** уйти в спринт:
- Есть outcome (метрика).
- Есть research / данные.
- Есть stakeholder alignment.
- Есть discovery notes.

Задача без DOR — не берётся.

**DOD (Definition of Done).** Условия, при которых задача **готова** уйти в разработку:
- Все состояния прописаны (empty / loading / error / success / edge).
- A11y-checklist пройден.
- Компоненты из системы или новые в системе.
- Handoff-пакет собран.
- Design QA сделан.

Задача без DOD — не отдаётся.

Head определяет SLA / DOR / DOD совместно с командой + PM + eng, письменно.

### Метрики команды

**Delivery velocity.** Сколько задач / очков / фич команда пропускает через себя за спринт. Не «работал ли усерднее», а «shipping ли outcome».

**Throughput.** Количество завершённых задач.

**WIP (Work in Progress).** Сколько задач в работе одновременно. Слишком много WIP = context switching + низкое качество.

**Cycle time.** От начала работы до релиза. Смотри тренды.

**Lead time.** От запроса до релиза. Включая ожидание.

**Design quality metrics:**
- Rework rate (сколько задач возвращались на переделку).
- Post-release defects (баги, которые видит дизайнер после релиза).

**Team health:**
- eNPS (Employee NPS).
- Retention.
- Burnout indicators.

**Опасно.** Метрики могут превратиться в цель. «Мы хотим velocity 100» → команда пилит крупные фичи, чтобы очки набегали. Это плохо.

### Инструменты — стандарт команды

**Единый набор инструментов** = меньше coordination.

**Baseline (2026):**
- **Design:** Figma (тот же plan для всех).
- **System:** Figma + Storybook + Zeroheight/Notion.
- **Research:** Notion / Dovetail / Miro.
- **Prototyping:** Figma / Framer / Play / v0.
- **Handoff:** Figma Dev Mode.
- **Project mgmt:** Linear / Notion / Jira (что у команды разработки).
- **Communication:** Slack / Teams (компанийный).
- **Documentation:** Notion / Confluence.

**Правило.** «У нас каждый использует, что удобно» — ошибка. Стандарт защищает от chaos'a.

### Governance дизайн-системы

Модели (см. [design-systems](../../flow/design-systems/SKILL.md)):
- **Central team owns** — центральная команда решает.
- **Federated** — центр + вклады из проектов.
- **Distributed** — все контрибьютят.

DesignOps роль:
- Организовать contribution process.
- Version control системы.
- Docs coverage.
- Adoption metrics.

### Budget & procurement

Head часто отвечает за budget команды.

**Что там:**
- Salaries (major line).
- Инструменты (Figma, Miro, Zeroheight — часто per seat).
- Research (participants recruiting, tools like Maze, UserTesting).
- Conferences (в году на команду 5–10 человек — 1–2 major events).
- Training / courses.
- Offsite.
- Freelance / contractors (contingency).

Head защищает budget перед CFO / CPO через ROI arguments (см. [design-impact](../../flow/design-impact/SKILL.md)).

### Documentation — единая база

- **Team handbook** — как мы работаем (Notion).
- **Design system docs** — компоненты.
- **Process docs** — ритуалы, SLA, DOR/DOD.
- **Runbooks** — как делать regular things (research plan, review, handoff).
- **Onboarding docs** — 30/60/90 план (см. [hiring-team-building](../hiring-team-building/SKILL.md)).

Правило: если что-то делается 3+ раз — документируй.

### Onboarding как ops-процесс

**30/60/90** структурирован ([hiring-team-building](../hiring-team-building/SKILL.md)), но infrastructure за это отвечает DesignOps:
- Buddy assigned.
- Accesses прошиты.
- Onboarding docs готовы.
- First-week сhedule сформирован.
- Check-ins календарно поставлены.

### Async > sync (для growing team)

Растущая distributed команда — обязательно async первое.

**Правила:**
- Что можно решить в async — не собирайте meeting.
- Записывай sync meetings, кто пропустил — смотрит.
- Все решения → в письменную форму (Slack / Notion).
- «This will take 15 min in a meeting» ≠ «meeting нужен».

## Ключевые концепции

**Ops = infrastructure.** Незаметная, но без неё команда не работает.

**Standards > freedom (для growing team).** Каждый со своим = хаос > 8 человек.

**Ритуалы вырезаются, не добавляются.** Каждый — на пользу или в мусор.

**Метрики служат команде, не наоборот.** Velocity не самоцель.

**Documentation — investment.** Один раз написал, сто раз использовал.

**Async first.** Особенно remote. Meetings как исключение.

**DesignOps growing role.** В командах 15+ — часто отдельный DesignOps Lead. До того — Head носит эту шапку.

## Типовые вопросы ментора

Услышав «команда буксует в процессе», спрошу:

1. «Ритуалы какие есть, зачем каждый?»
2. «SLA / DOR / DOD прописаны письменно?»
3. «Метрики следишь? Какие?»
4. «Standard tooling или каждый по-своему?»
5. «Documentation в норме или knowledge in heads?»
6. «Async first или sync-heavy?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что признаёшь ops как отдельную работу, а не считаешь бюрократией».
2. **Диагноз.** «У тебя 6 ритуалов, половина без цели» *(или)* «SLA не определён — задачи прилетают хаотично» *(или)* «Метрик нет — не знаешь, где узкое место».
3. **Практика.** Конкретное действие.
4. **Регламент.** Что письменно, кто владеет.
5. **Инструмент.** Что использовать.
6. **Следующий шаг.** «Спроси про [design-management] чтобы связать с людьми, или про [design-systems] если ops вокруг системы».

## Ловушки

- **Ritual overload.** 8 регулярных встреч в неделю — команда не работает.
- **No SLA.** Задачи прилетают хаотично, team stressed.
- **Метрики как цель.** «Velocity 100» → плохие решения.
- **Каждый со своим tooling.** Coordination кошмар.
- **Undocumented knowledge.** Уходит человек → уходит знание.
- **Sync-heavy remote team.** Timezone abuse, burnout.
- **DesignOps как police.** Не защищает команду, а надзирает.
- **Governance дизайн-системы без team.** Раздувается или хиреет.
- **Budget не защищается.** Инструменты режут → команда работает медленнее.

## Источники

- **Kaplan, Kate (NN/g).** [DesignOps articles](https://www.nngroup.com/topic/design-ops/) — основной источник.
- **Black, Meredith.** [DesignOps Assembly](https://www.designopsassembly.com/) — комьюнити.
- **InVision.** [DesignOps Handbook](https://www.designbetter.co/designops-handbook) — обзорная книга.
- **Airbnb Design.** [airbnb.design](https://airbnb.design/) — public posts about ops at scale.
- **IBM Design.** [ibm.com/design](https://www.ibm.com/design/) — process papers.
- **Salesforce Engineering.** [engineering.salesforce.com](https://engineering.salesforce.com/) — DesignOps at Scale.
- **First Round Review.** [Team ops articles](https://review.firstround.com/).

## Смежные скилы

- [design-management](../design-management/SKILL.md) — люди в процессах
- [hiring-team-building](../hiring-team-building/SKILL.md) — onboarding как часть ops
- [design-systems](../../flow/design-systems/SKILL.md) — governance системы
- [stakeholder-work](../stakeholder-work/SKILL.md) — переговоры о SLA
