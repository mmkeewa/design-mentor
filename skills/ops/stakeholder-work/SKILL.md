---
name: stakeholder-work
description: Работа со стейкхолдерами вне дизайн-команды. PO/CPO/CEO/бизнес/разработка/legal/маркетинг. Alignment, escalation, буферизация конфликтов, переговоры о scope и сроках, «нет» без ссор, влияние без прямой власти. Head приходит сюда, когда дизайн-команда работает хорошо, но снаружи всё сложно.
layer: ops
phase: cross-cutting
update: stable
sources:
  - Chris Voss — Never Split the Difference. https://www.blackswanltd.com/
  - David Marquet — Leadership Is Language. https://intent-based-leadership.com/
  - Teresa Torres — Product Talk (stakeholder alignment). https://www.producttalk.org/
  - Roger Fisher & William Ury — Getting to Yes. https://www.pon.harvard.edu/
  - Marty Cagan — Empowered (partnership with stakeholders). https://www.svpg.com/books/
  - Julie Zhuo — on managing stakeholders. https://juliezhuo.com/
  - First Round Review — cross-functional articles. https://review.firstround.com/
neighbors:
  - design-management: management — внутренние отношения; я — внешние
  - presentation-skills: presentation — как показывать; я — как договариваться
  - product-strategy: стратегия защищается перед стейкхолдерами; я — процесс защиты
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# stakeholder-work

Head в 40% времени работает не с дизайнерами, а с людьми, у которых **другие цели**. Продукт, бизнес, разработка, legal, маркетинг, финансы — каждый со своим давлением. Head нужен как переводчик, буфер, партнёр — и, когда надо, «сдерживатель».

## Когда меня звать

- «CPO требует то, что убьёт продукт — как отказать?»
- «Разработка настаивает на компромиссе, ломающем UX».
- «Стейкхолдер меняет приоритеты каждую неделю».
- «Legal завернул текст в юридический язык — как договариваться?»
- «Как получить бюджет / ресурсы?»
- «Приоритеты не согласованы между CPO и CEO».
- «Меня не зовут на стратегические встречи — как войти в комнату?»

## Когда НЕ меня, а соседа

- **Управление командой дизайнеров** → [design-management](../design-management/SKILL.md).
- **Презентации / питчи** → [presentation-skills](../presentation-skills/SKILL.md).
- **Стратегия продукта** → [product-strategy](../../flow/product-strategy/SKILL.md).
- **Наём** → [hiring-team-building](../hiring-team-building/SKILL.md).

## Что я умею

### Карта стейкхолдеров

**Не «все стейкхолдеры одинаковы».** Head должен явно классифицировать:

**Power/Interest matrix:**
- **High power, high interest** — CEO, CPO. Manage closely.
- **High power, low interest** — CFO, CTO. Keep satisfied.
- **Low power, high interest** — designer peers, PMs. Keep informed.
- **Low power, low interest** — далёкие функции. Monitor.

**Пере-mapping.** Роли меняются: сегодня PMSам всё равно, завтра запустил CPO и он в горячей теме.

### Виды стейкхолдеров и их языки

**Product (PM / CPO).**
- Язык: цели, метрики, эксперименты, roadmap.
- Что беспокоит: velocity, outcomes, market fit.
- Что говорить: «эта работа двигает [метрику] на [X]%».

**Business (CEO / commerce).**
- Язык: revenue, growth, differentiation.
- Что беспокоит: bottom line, конкуренты.
- Что говорить: «через дизайн выигрываем на [insight]».

**Engineering (CTO / lead).**
- Язык: complexity, tech debt, feasibility.
- Что беспокоит: качество кода, сроки, retention.
- Что говорить: «здесь reuse из системы, здесь простой rebuild».

**Legal / Compliance.**
- Язык: risk, regulation, обязательства.
- Что беспокоит: fines, лицензии, brand damage.
- Что говорить: «мы соответствуем [регулятор], детали в [спека]».

**Marketing.**
- Язык: campaigns, brand, conversion.
- Что беспокоит: сообщение, resonance.
- Что говорить: «единый tone-of-voice в продукте и маркетинге».

**Finance.**
- Язык: numbers, ROI, forecasting.
- Что беспокоит: cost efficiency.
- Что говорить: «дизайн дал [X]М/квартал через [Y]% в CR».

Head говорит на всех этих языках.

### Alignment vs Approval

**Alignment.** Стейкхолдеры понимают, зачем это, что взамен, что риск.
**Approval.** Одобрение — часто автоматически, если alignment есть.

**Плохо.** Head приносит готовый макет на approval → сюрприз → конфликт.
**Хорошо.** Head впрямь alignment с ключевыми стейкхолдерами на каждой фазе → approval формальность.

**Тактика.** Small alignments часто > один grand approval. Раз в неделю 15 мин с CPO лучше, чем monthly 2-часовой review.

### Три уровня партнёрства (Cagan's Empowered)

**Level 1 — Feature Team.** Дизайн выполняет: «сделайте то-то». Слабое партнёрство.

**Level 2 — Product Team.** Дизайн участвует в решении «что делать» на уровне tactics.

**Level 3 — Empowered Team.** Дизайн-Head в комнате, где решается «куда идём» на уровне strategy.

Head должен целить в Level 3. Ниже — дизайн-команда становится сервисом.

### Договоры о scope

**Плохо.**
- Стейкхолдер: «Нам нужна вот эта фича».
- Дизайн: «Ок, буду делать».

**Хорошо.**
- Стейкхолдер: «Нам нужна вот эта фича».
- Дизайн: «Какой outcome хочешь? Понимаю. У нас 3 варианта, различающихся по effort и impact».
- Совместное решение.

**Инструменты для scope-переговоров:**
- **Impact/Effort matrix** — покажи трейд-оффы.
- **Time-boxing** — «эту версию за 2 недели, идеальную за 6».
- **Phasing** — MVP / v1 / v2 разложение.

### Как говорить «нет»

Head часто должен отказывать. Но «нет» разрушает отношения, если делаешь плохо.

**Fisher & Ury (Getting to Yes) — принципиальные переговоры.**

**Три техники:**

**1. «Нет, потому что…» + альтернатива.**
- «Не делаем в текущем спринте, потому что [причина]. Могу предложить [альтернатива]».

**2. «Да, но…» и торг о scope.**
- «Да, можем сделать. Но освободите 2 недели у dev — что двигаем из priorities?»

**3. Escalation.**
- «Это выше моего решения. Пойдёмте к CPO вместе — обсудить приоритеты».

**Never.** «Нет, потому что не хочу» без обоснования и альтернативы.

### Управление конфликтами

**Правила:**

**1. Сначала разберись сам.** Что реально произошло, все ли стороны слышал.

**2. Не в чате.** Конфликты — offline / call.

**3. Слушай до финала.** Не перебивай. Chris Voss (Never Split the Difference): «tactical empathy» — покажи, что ты понял их сторону, до того как выражать свою.

**4. Ищи объективное.** Метрика / принцип / гайд — что-то вне позиций. «Согласно WCAG…», «По данным исследования…».

**5. Если нет объективного — escalation.** Не сиди в конфликте, эскалируй к общему руководителю с чётким описанием обеих позиций.

**Chris Voss's techniques:**
- **Labeling.** «Похоже, вы беспокоитесь про [X]». Показывает, что слышишь.
- **Mirroring.** Повтори последние 3 слова собеседника с вопросом. Он раскроется больше.
- **Calibrated questions.** «Как я могу помочь тебе сделать [X]?». Открытые «как» и «что» вместо «почему» (провоцирует защиту).

### Escalation — не поражение

Многие Head'ы боятся эскалировать. Это ошибка.

**Escalation — signal о priorities, не признание слабости.**

**Правильная эскалация:**
- Fact-based (что происходит).
- С обеими позициями (не только твоей).
- С возможными решениями.
- В календарь → 30 минут вместе с обоими сторонами.
- Финальное решение — фиксируется письменно.

### Влияние без прямой власти

Head часто должен договариваться с более старшими / влиятельными. Без прямого начальствования.

**Тактика:**
- **Данные.** «Из исследования / метрики видно…».
- **Consistency.** «Мы уже приняли принцип X — это его нарушает».
- **Reciprocity.** «Помог тебе с A — теперь мне нужен sign-off по B».
- **Storytelling.** Реальный кейс, аналогия.
- **Vision link.** «Это двигает нашу vision, не двигает».

### Regular touchpoints

Не «встретимся, когда нужно». Ставь регулярные:

- **Weekly 1×1 с CPO.** 30 мин, alignment на week ahead.
- **Bi-weekly с CTO / lead.** Технические вопросы.
- **Monthly с CEO.** Strategic touchpoint, если Head в C-1 range.
- **Quarterly с legal.** Что грядёт из регуляторки.
- **Ad-hoc с маркетингом.** По campaign / launch.

Регулярность защищает от «вдруг пришло сверху и ломает планы».

## Ключевые концепции

**Head — переводчик.** Между дизайн-командой и всем остальным миром.

**Alignment > Approval.** Работай в процессе, не на финале.

**Каждый стейкхолдер — своя мотивация.** Понимай её.

**«Нет» — навык.** С альтернативой, обоснованием, respect.

**Escalation — инструмент, не failure.**

**Партнёрство > сервис.** Design-Head в комнате стратегии, не «принесите мне макет».

**Данные + история.** И то, и другое. Только данные — сухо. Только история — не убеждает.

## Типовые вопросы ментора

Услышав «конфликт со стейкхолдером», спрошу:

1. «Alignment был на старте или сюрприз в финале?»
2. «Их язык / motivation ты понял?»
3. «Есть ли объективные критерии (метрика, гайд, принцип)?»
4. «Пробовал sceniary — что делаем vs что не делаем?»
5. «Escalation готов? Общий руководитель есть?»

Услышав «меня не зовут на встречи», спрошу:

1. «Ты предлагал сам ходить на встречи?»
2. «Ты знаешь их roadmap / cadence?»
3. «Ты приходил с value, а не с "хочу быть в курсе"?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что признаёшь, что это работа Head'а — не отказ ходить в маркетинг».
2. **Диагноз.** «Ты в приёмном режиме — принесли, кивнул. Уходишь в Level 1 партнёрства».
3. **Тактика.** Что сделать (alignment ranges, weekly 1×1, escalation).
4. **Фреймворк.** Getting to Yes / tactical empathy / Cagan's levels.
5. **Пример / шаблон.** Как сказать конкретно.
6. **Следующий шаг.** «Спроси про [presentation-skills] чтобы упаковать проект в питч, или про [product-strategy] чтобы говорить на языке стратегии».

## Ловушки

- **Design-Head как сервис.** Реактивный режим. Level 1 партнёрство.
- **Одноразовый alignment.** Проверил, забыл. Стейкхолдер обновил приоритеты.
- **«Нет» без альтернативы.** Ссора и обида.
- **Escalation как поражение.** Head терпит невозможные условия, команда burnout.
- **Один язык для всех.** С CFO о дизайне через inspirations — не сработает.
- **Personalizing.** «CPO плохой» → на самом деле CPO с своими давлениями. Понимай, не осуждай.
- **Скрытые ожидания.** Ты думаешь, что стейкхолдер понимает, он — нет. Verbalize.
- **Отказ от эскалации.** Годы тлеет, взрывается на релизе.

## Источники

- **Voss, Chris.** [Never Split the Difference](https://www.blackswanltd.com/) — практика переговоров.
- **Marquet, David.** [Leadership Is Language](https://intent-based-leadership.com/) — язык власти и вопросов.
- **Torres, Teresa.** [Product Talk](https://www.producttalk.org/) — про stakeholder alignment.
- **Fisher & Ury.** [Getting to Yes](https://www.pon.harvard.edu/) — классика принципиальных переговоров.
- **Cagan, Marty.** [Empowered](https://www.svpg.com/books/) — про партнёрство vs сервис.
- **Zhuo, Julie.** [juliezhuo.com](https://juliezhuo.com/) — про stakeholder-Head перспективу.
- **First Round Review.** [Cross-functional articles](https://review.firstround.com/).

## Смежные скилы

- [design-management](../design-management/SKILL.md) — внутренние отношения
- [presentation-skills](../presentation-skills/SKILL.md) — как показывать
- [product-strategy](../../flow/product-strategy/SKILL.md) — стратегия защищается перед стейкхолдерами
- [design-ops](../design-ops/SKILL.md) — процессы работы с стейкхолдерами
