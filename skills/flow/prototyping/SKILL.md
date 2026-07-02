---
name: prototyping
description: Прототип как инструмент валидации до кода. Уровни фиделити (paper / click-through / high-fi / coded), выбор инструмента (Figma / Framer / Origami / Play / v0 / Cursor), микровзаимодействия, работа со стейтом и данными, что тестировать на каждом уровне. Head приходит сюда, когда команда рисует картинки вместо прототипов.
layer: flow
phase: prototype
update: stable
sources:
  - Jake Knapp — The Sprint Book. https://www.thesprintbook.com/
  - Frog Design — Prototyping methods. https://www.frogdesign.com/
  - Framer docs. https://www.framer.com/learn/
  - Figma prototyping docs. https://help.figma.com/hc/en-us/categories/360002042553-Prototyping
  - Origami Studio (Meta). https://origami.design/
  - v0 by Vercel. https://v0.dev/
  - NN/g — Prototyping fidelity. https://www.nngroup.com/articles/ux-prototypes-low-high-fidelity/
neighbors:
  - user-flows-journeys: сначала скелет и состояния, потом прототип; я — воплощаю скелет для проверки
  - design-impact: design-impact мерит эффект после релиза; я — валидация до релиза
  - ux-research: research юзает прототип как стимул; я — про изготовление прототипа
  - ai-in-design: vibecoding как форма prototyping — граница с AI-инструментами
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# prototyping

Прототип — не «финальный дизайн для показа», а **инструмент вопросов**. Каждый прототип отвечает на конкретный вопрос: «понимает ли пользователь этот flow?», «работает ли этот жест?», «читается ли иерархия?». Head отвечает за то, чтобы команда делала прототипы под вопрос, а не «для галочки».

## Когда меня звать

- «Нужен прототип для теста — какой уровень?»
- «Дизайн есть, но не знаем, работает ли flow — как проверить?»
- «Figma vs Framer vs Origami — что для чего?»
- «Микро-взаимодействие сложное — как показать?»
- «Vibecoding vs click-through — что быстрее для этой задачи?»
- «Прототип с реальными данными — как?»

## Когда НЕ меня, а соседа

- **Скелет до прототипа** (flow, IA, wireframes) → [user-flows-journeys](../user-flows-journeys/SKILL.md).
- **Юзабилити-тест на прототипе** → [ux-research](../ux-research/SKILL.md).
- **Мерить эффект после релиза** → [design-impact](../design-impact/SKILL.md).
- **Handoff в разработку** → [handoff-dev-collab](../handoff-dev-collab/SKILL.md).
- **AI-инструменты как отдельная тема** → [ai-in-design](../ai-in-design/SKILL.md).

## Что я умею

### Уровни фиделити

Не путать сложность прототипа с полезностью.

**1. Paper / low-fi.** Наброски на бумаге или в Miro. 5–20 минут. Проверяет: понятность flow, IA, есть ли смысл идти дальше.

**2. Click-through (Figma).** Экраны + переходы. 1–4 часа. Проверяет: навигация, читаемость иерархии, базовая логика.

**3. High-fi interactive (Framer / Play / Origami).** Настоящие микро-взаимодействия, жесты, motion. 4–20 часов. Проверяет: жесты, тайминги, feedback, sound.

**4. Coded (v0 / Cursor / vibecoding).** Живой прототип на React / Vue / SwiftUI. Работает с реальными данными. 4–40 часов. Проверяет: полный flow, edge cases, performance, real inputs.

**Правило Head'а:** уровень фиделити = уровень вопроса. Спрашиваешь про навигацию — нужен click-through, не высокая фи. Спрашиваешь про жест — нужен coded или Origami.

### Матрица «вопрос → уровень»

| Вопрос | Уровень |
|---|---|
| Понятна ли IA? | Paper + tree test |
| Работает ли flow целиком? | Click-through (Figma) |
| Читается ли иерархия одного экрана? | High-fi macros в Figma |
| Работает ли микро-взаимодействие? | Framer / Origami |
| Работает ли жест на устройстве? | Origami / coded |
| Работает ли на реальных данных? | Coded (v0 / vibecoding) |
| Работает ли на edge cases (offline, ошибки)? | Coded |

### Инструменты — краткая карта

**Figma.**
Стандарт click-through. Interactive components, variants, prototyping arrows. Хорош для навигации, hover-стейтов, простых overlay'ев. Плох для сложных микро-взаимодействий и работы с data.

**Framer.**
Прыжок в web-native motion. React-based, легко разбираться дизайнеру. Хорош для landing / marketing / motion-heavy продуктов. Плох для complex data-driven flow.

**Origami Studio (Meta).**
Native motion prototyping — жесты, physics, tie-in с iOS/Android. Кривая обучения крутая. Хорош для complex micro-interactions в mobile.

**Play.**
iOS-focused prototyping, работает на устройстве. Хорош для нативных мобильных жестов, drag'n'drop, sheets. Растущая аудитория среди iOS-дизайнеров.

**v0 by Vercel.**
Prompt-based → React код. Хорош для быстрых web-прототипов с реальными компонентами (shadcn/ui). Плох, если нужен brand-специфичный дизайн-система.

**Cursor / Claude Code (vibecoding).**
Свобода писать код с AI-помощью. Хорош для полного функционального прототипа с реальными данными, API. Требует базовых навыков кодинга.

**Как выбрать:**
- Нужен flow-check → **Figma**.
- Нужен motion → **Framer** (web) или **Origami/Play** (mobile).
- Нужен real data / edge cases → **v0 / vibecoding**.

### Микро-взаимодействия

Каждое micro-interaction — 4 части ([Dan Saffer](https://www.oreilly.com/library/view/microinteractions/9781449342821/)):

1. **Trigger** — что запускает (hover, click, scroll, sensor).
2. **Rules** — как ведёт себя во время.
3. **Feedback** — что видит/слышит пользователь.
4. **Loops & modes** — что происходит после (повторяется, меняет state).

Прототип micro-interaction проверяет каждую из 4 частей — не только «красиво выглядит».

### Работа со стейтом

Прототип с одним статическим стейтом = картинка. Прототип с многими стейтами = близко к продукту.

**Что нужно эмулировать:**
- **Empty → filled** — когда добавляют данные.
- **Loading → loaded** — когда ждут.
- **Error → recovery** — когда ошибка.
- **Auth → unauth** — когда логин/логаут.
- **Multi-user data** — разные варианты того же экрана.

Figma даёт это через variants + interactive components. Play / coded — через настоящий state management.

### Работа с реальными данными

Особенно важно для fintech, e-com, edtech — где данные разные (короткие имена, длинные, отсутствие, много категорий).

**Плохо:** прототип с «Иван Иванов» на 12 символов.
**Хорошо:** прототип с массивом: короткое, длинное, эмодзи, RTL, пусто.

**Coded prototype** обычно даёт это лучше. В Figma можно через плагины (Content Reel, Random Data).

## Ключевые концепции

**Прототип отвечает на вопрос.** Не «мы сделали прототип». А «мы сделали прототип, чтобы узнать X». Если ответ уже известен — прототип не нужен.

**Дешевле = лучше.** Prototype fidelity ratio: тратишь ×10 усилий на high-fi — узнаёшь на ×1.5 больше. Начинай с paper, поднимайся уровнем, если ответа мало.

**Тестируй одну переменную.** Прототип должен изолировать вопрос: «работает ли новая навигация?» — только навигация меняется, всё остальное как в проде.

**Прототип ≠ финальный дизайн.** Ошибка новичков: делают high-fi прототип и защищают его перед стейкхолдерами. Стейкхолдеры критикуют цвет вместо flow.

**Vibecoding — не замена дизайну.** Живой прототип быстро → правильно. Но дизайн-система, iteration, craft — параллельно, не «AI написал, поехали».

**Domain-специфика.**
- **Fintech.** Coded prototypes с mock-API — тестируй KYC, платежи, edge cases (offline, timeout, decline).
- **E-com.** Real-data prototype: каталог с разной длиной названий, фото разного качества, sold-out.
- **Edtech.** Прототипы с реальным контентом (курс), с прогрессом, для тестов — с несколькими вариантами ответов.

## Типовые вопросы ментора

Услышав «делаем прототип», спрошу:

1. «Какой вопрос отвечаешь?» — если непонятно, не делай.
2. «Какой уровень нужен для этого вопроса?»
3. «Данные — статические или динамические?»
4. «На чём тестируешь — device / браузер / desktop?»
5. «Что уже пробовали проще, что не сработало?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что спрашиваешь про фиделити, а не бросаешься в Figma».
2. **Диагноз.** «Ты собираешь high-fi для вопроса, который снимается на click-through».
3. **Уровень.** Paper / click-through / high-fi / coded — какой.
4. **Инструмент.** Figma / Framer / Origami / v0 — под задачу.
5. **Что эмулировать.** Данные, стейты, edge cases.
6. **Следующий шаг.** «Спроси про [ux-research], как тестировать прототип на пользователях, или про [design-impact], как связать эффект с метрикой».

## Ловушки

- **High-fi для проверки навигации.** Слишком дорого, критика уходит в цвет.
- **Прототип без вопроса.** «Сделаем прототип» — окей, но зачем? Если не понимаешь — не делай.
- **Один happy path.** Прототип не показывает error / empty / edge — пропускаешь 50% проблем.
- **Статичные данные.** «Иван Иванов» и один товар. Прод сломается на реальном разнообразии.
- **Vibecoding без дизайн-системы.** AI выдаст inconsistent UI, соберёшь мусор быстро.
- **Прототип-как-дизайн-финал.** Защищаешь перед бизнесом → бизнес критикует цвет вместо flow → застреваешь.
- **Долгий прототип-долгие ответы.** Прототип 3 недели, тест 2 дня, итерация 2 недели. Дешевле paper → быстрее ответ → быстрее итерация.

## Источники

- **Knapp, Jake.** [The Sprint Book](https://www.thesprintbook.com/) — про прототип за 1 день внутри спринта.
- **Figma docs.** [Prototyping](https://help.figma.com/hc/en-us/categories/360002042553-Prototyping) — actual reference.
- **Framer.** [Learn Framer](https://www.framer.com/learn/) — учебные материалы.
- **Origami Studio.** [origami.design](https://origami.design/) — Meta's tool.
- **v0.** [v0.dev](https://v0.dev/) — Vercel's AI-prototyping.
- **NN/g.** [Prototyping fidelity](https://www.nngroup.com/articles/ux-prototypes-low-high-fidelity/) — когда какой уровень.
- **Saffer, Dan.** *Microinteractions* — базовая книга по микро-взаимодействиям.

## Смежные скилы

- [user-flows-journeys](../user-flows-journeys/SKILL.md) — скелет до прототипа
- [ux-research](../ux-research/SKILL.md) — юзабилити на прототипе
- [design-impact](../design-impact/SKILL.md) — валидация до и после релиза
- [ai-in-design](../ai-in-design/SKILL.md) — vibecoding как форма prototyping
- [handoff-dev-collab](../handoff-dev-collab/SKILL.md) — coded prototype → продакшн
