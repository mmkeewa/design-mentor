---
name: design-management
description: Управление дизайн-командой. Синки, 1×1, дизайн-ревью, career tracks, приоритизация backlog, планирование спринтов, health-check команды, retro. Про людей и процесс, не про пиксели. Head приходит сюда, когда команда работает, но не растёт — или растёт, но конфликтует.
layer: ops
phase: cross-cutting
update: stable
sources:
  - Julie Zhuo — The Making of a Manager. https://juliezhuo.com/making-of-a-manager/
  - Camille Fournier — The Manager's Path. https://www.oreilly.com/library/view/the-managers-path/9781491973882/
  - Michael Lopp (Rands) — Managing Humans. https://randsinrepose.com/
  - Lara Hogan — Resilient Management. https://larahogan.me/resilient/
  - Kim Scott — Radical Candor. https://kimmalonescott.com/
  - Google re:Work. https://rework.withgoogle.com/
  - First Round Review. https://review.firstround.com/
neighbors:
  - hiring-team-building: hiring — про приход в команду; я — про то, что внутри
  - design-ops: ops — процессы/инструменты; я — про людей внутри процессов
  - stakeholder-work: stakeholder — про внешние отношения; я — про внутренние с командой
  - presentation-skills: я — как говорить с командой; presentation — с внешними
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# design-management

Head — не «главный дизайнер в команде». Head — **менеджер команды дизайнеров**. Это разные роли, разные skills. Пиксели важны, но 60% времени Head'а — работа с людьми.

## Когда меня звать

- «Как строить 1×1?»
- «Как проводить дизайн-ревью, чтобы не убивать мотивацию?»
- «Как приоритизировать в команде из N дизайнеров?»
- «Кто-то из команды не растёт — что делать?»
- «Career tracks — как строить?»
- «Синки — как часто, как долго, зачем?»
- «Ретро команды — как проводить?»
- «Конфликт между дизайнерами — как разруливать?»

## Когда НЕ меня, а соседа

- **Наём** → [hiring-team-building](../hiring-team-building/SKILL.md).
- **Процессы и инструменты** → [design-ops](../design-ops/SKILL.md).
- **Работа со внешними стейкхолдерами** → [stakeholder-work](../stakeholder-work/SKILL.md).
- **Внешние презентации** → [presentation-skills](../presentation-skills/SKILL.md).

## Что я умею

### 1×1 — фундамент управления

**Регулярность.** Раз в неделю, 30–60 минут. Не «когда есть время» — фиксированный слот.

**Не про статус.** Плохой 1×1: «Что делаешь на этой неделе?» — это standup. Хороший 1×1: «Как ты?», «Что мешает?», «Куда хочешь расти?», «Как я могу помочь?».

**Три уровня разговора:**
1. **Immediate.** Что происходит сейчас — проекты, конфликты, стрессы.
2. **Career.** Куда движется, что нужно, где растяжка.
3. **Personal.** Жизнь за пределами работы — не глубокий психолог, но человеческий контакт.

**Разное для разных.** Junior — больше coaching. Senior — больше sparring. Кто-то любит частые, кто-то реже — договорись.

**Формат.**
- Прогулка > переговорка.
- Camera on для remote.
- Записывай action items, но не сам разговор.

**Красные флаги:**
- Отменяют 1×1 регулярно → замер сигнала о вовлечённости.
- Молчат первые 10 минут → доверия нет, работа с ним.
- Только про работу, ничего про себя → burnout risk.

### Дизайн-ревью — не критика, а диалог

**Плохое ревью:** Head садится с макетами дизайнера, говорит что не так, тот кивает.

**Хорошее ревью:** дизайнер показывает работу, объясняет контекст → Head задаёт вопросы (не оценки) → вместе разбирают трейд-оффы → дизайнер уходит с новыми идеями.

**Фреймворк (Kim Scott's Radical Candor):**
- **Care personally** — дизайнер знает, что ты за него.
- **Challenge directly** — прямо говоришь, что не работает.

Ни одно без другого:
- Care без challenge = false empathy (не растёт).
- Challenge без care = agression (уходит).

**Практика:**
- Начни с уточняющих вопросов, не с критики. «Зачем этот CTA здесь?» лучше «Кнопка не в том месте».
- Ссылки на принципы / систему / метрики, не «мне не нравится».
- Одно ключевое улучшение, не 20.
- Заканчивай тем, что сильно.

### Career tracks

**Дизайн-команда без tracks — команда без роста.**

**Классические ступени:**
```
Junior → Middle → Senior → Staff → Principal
                        ↘
                          Lead → Manager → Head → Director
```

**Track split.** Senior может расти в **individual contributor** (IC) — Staff, Principal — глубже в крафт. Или в **management** — Lead, Manager — больше про людей. Не «вверх обязательно = менеджмент».

**Что должно быть в каждой ступени (competencies):**
- Craft — уровень визуального / product-mышления.
- Impact — размер задач, который берёт.
- Collaboration — с кем и как работает.
- Leadership — влияние на других.

**Practical:**
- Уровни описаны письменно (Notion / Confluence).
- Каждый дизайнер знает, где он и что до следующей ступени.
- Ежеквартальный review — вместе смотрите, где progress.

### Приоритизация backlog команды

**Проблема.** N дизайнеров, M PMов, K продуктовых линий. Каждый PM хочет своё вчера.

**Head-решение.**
- **Sprint planning с приоритетами.** Раз в 2 недели — что берём в спринт.
- **Прозрачные критерии.** Impact / effort / стратегическое соответствие / срочность.
- **Явные NO.** «Это не берём этот квартал» → пишешь стейкхолдеру.
- **Design capacity model.** Знаешь, сколько велосити у команды. Не перекладывай.

**Инструменты:** Notion / Airtable / Linear для видимости, но не главное — главное регулярность и honesty.

### Health-check команды

**Раз в квартал — pulse:**
- Есть ли flow (работа интересна, вовлечены)?
- Есть ли autonomy (могут решать)?
- Есть ли mastery (растут)?
- Есть ли purpose (понимают зачем)?

**Инструменты:**
- Officevibe / CultureAmp — anonymous surveys.
- Или простой google-form с 5 вопросами.

**Красный флаг:** трое из пяти чувствуют, что не растут → пересмотри распределение задач и career tracks.

### Retro команды

**Не «что сделали».** А «что мешает и что помогает».

**Форматы:**
- **Start / Stop / Continue** — простой.
- **Mad / Sad / Glad** — эмоциональный.
- **4L (Liked / Learned / Lacked / Longed for)** — глубокий.

**Правила:**
- Психологическая безопасность — можно говорить, что не так.
- Action items с owner и датой.
- Возвращайся к action items на следующем retro.

### Разговоры про рост / performance

**Плохой сотрудник — Head-проблема.**
- Не «терпи» — работать с ним.
- Не «увольняй сразу» — попробуй improvement plan.
- Конкретные ожидания, сроки, поддержка.
- Если не пошло — расставание с уважением.

**Growth conversations:**
- Не «что ты хочешь через 5 лет» — слишком абстрактно.
- А «через 6 месяцев, где ты хочешь быть?»
- Ты помогаешь построить путь к этому.

### Конфликты

**Типы конфликтов в дизайн-команде:**
- Дизайнер vs дизайнер — обычно про подход / чистоту решения.
- Дизайнер vs PM — приоритеты / скорость / глубина.
- Дизайнер vs разработчик — реализация / handoff.

**Head-подход:**
- Слушай обе стороны раздельно.
- Ищи объективные критерии («что говорит система?», «что метрика?»).
- Если нет объективного — Head принимает решение и объясняет.
- Не игнорируй — конфликт растёт.

### Distributed vs co-located

**Remote / hybrid дизайн-команда — норма в 2026, но специфика:**

- **Async first.** Пиши, не звони по пустякам.
- **Sync moments намеренны.** Weekly command sync, monthly all-hands, quarterly offsite.
- **Overcommunicate.** Что для co-located очевидно, remote надо явно.
- **Time zones respect.** Не жди ответа в чужое ночное время.
- **Onboarding для remote — дольше.** Buddy system, structured intro.

## Ключевые концепции

**Head — multiplier.** Работа Head'а = работа команды × коэффициент. Плохой Head — коэффициент 0.5, хороший — 2×.

**Radical candor как baseline.** Care personally + challenge directly. Ни одно без другого.

**People первое, процессы второе.** Идеальный процесс с несчастной командой = плохой продукт.

**Прозрачность растит доверие.** Скрытые решения растят слухи.

**Autonomy > control.** Дизайнер сам решает как — Head договаривается что и зачем.

**Regular > ad-hoc.** Регулярные 1×1, retro, review > великие разовые события.

## Типовые вопросы ментора

Услышав «команда буксует», спрошу:

1. «Регулярные 1×1 есть — раз в неделю, 30+ минут?»
2. «Career tracks описаны, каждый знает свой уровень?»
3. «Дизайн-ревью — как проводятся?»
4. «Retro — регулярно и с action items?»
5. «Health check есть?»
6. «Твоё ощущение — команда чувствует autonomy?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задумываешься про команду, а не только про продукт».
2. **Диагноз.** «У тебя нет 1×1» *(или)* «Career tracks размыты — команда не растёт» *(или)* «Retro нет — проблемы копятся».
3. **Практика.** Конкретный ритуал, регулярность, формат.
4. **Фреймворк.** Radical Candor / Growth Conversations — под ситуацию.
5. **Что мерить.** Health check, retention team, growth.
6. **Следующий шаг.** «Спроси про [hiring-team-building] если добавляешь людей, или про [design-ops] для процессов, или про [stakeholder-work] если конфликт внешний».

## Ловушки

- **Head = super-designer.** Продолжает рисовать сам, вместо развития команды.
- **1×1 отменяются регулярно.** Сигнал, что не важно.
- **Дизайн-ревью как критика.** Демотивирует, не растит.
- **Career tracks отсутствуют.** Каждый растёт сам как может.
- **«Плохой» дизайнер терпится год.** Токсит команду, работа падает.
- **Retro без action items.** Пустой разговор.
- **Всё в голове.** Ничего не письменно — сотрудники не знают, что от них ждут.
- **Управление remote как co-located.** Работает плохо.

## Источники

- **Zhuo, Julie.** [The Making of a Manager](https://juliezhuo.com/making-of-a-manager/) — must-read для нового Head'а.
- **Fournier, Camille.** [The Manager's Path](https://www.oreilly.com/library/view/the-managers-path/9781491973882/) — engineering-focused, но универсально.
- **Lopp, Michael (Rands).** [randsinrepose.com](https://randsinrepose.com/) + [Managing Humans].
- **Hogan, Lara.** [Resilient Management](https://larahogan.me/resilient/) — про поддержку и wellbeing.
- **Scott, Kim.** [Radical Candor](https://kimmalonescott.com/) — про framework обратной связи.
- **Google.** [re:Work](https://rework.withgoogle.com/) — Google's public research on management.
- **First Round Review.** [review.firstround.com](https://review.firstround.com/) — глубокие статьи по management.

## Смежные скилы

- [hiring-team-building](../hiring-team-building/SKILL.md) — как формировать команду
- [design-ops](../design-ops/SKILL.md) — процессы вокруг людей
- [stakeholder-work](../stakeholder-work/SKILL.md) — внешние отношения
- [presentation-skills](../presentation-skills/SKILL.md) — коммуникация вне команды
