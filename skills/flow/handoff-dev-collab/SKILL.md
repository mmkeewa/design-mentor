---
name: handoff-dev-collab
description: Дизайн → разработка без потерь. Спецификации, Figma Dev Mode, tokens как контракт, чек-лист приёмки, ретро с командой, парная работа с фронтендерами. Head приходит сюда, когда «в макете было одно, в проде другое» — и это системная проблема.
layer: flow
phase: delivery
update: stable
sources:
  - Figma — Dev Mode. https://help.figma.com/hc/en-us/sections/17165716183063-Dev-Mode
  - Nathan Curtis — Design + Engineering handoff. https://medium.com/eightshapes-llc
  - Storybook — Component Story Format. https://storybook.js.org/docs/writing-stories
  - Zeroheight — design system docs. https://zeroheight.com/
  - Josh Comeau — Effective handoff. https://www.joshwcomeau.com/
  - Vitaly Friedman — Design Handoff Best Practices. https://smashingmagazine.com/
neighbors:
  - design-systems: система — общий язык дизайна и кода; я использую этот язык для handoff
  - design-audit: audit проверяет живой продукт; я — про доведение от макета до продукта
  - stakeholder-work: разработчик — стейкхолдер, но специфический; я — про рабочую практику с ним, они — про общее
  - design-ops: design-ops — процессы всей команды; я — узко про handoff и приёмку
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# handoff-dev-collab

Handoff — не «кинули макеты через стену и пошли пить кофе». Это **сотрудничество**, где дизайнер и фронтендер работают в паре от начала спринта до приёмки. Head отвечает за то, чтобы у команды была практика передачи без потерь, а не «вроде рассказали».

## Когда меня звать

- «В проде получилось не то, что в макете — как исправить процесс?»
- «Что должно быть в спецификации?»
- «Figma Dev Mode — используем ли, как?»
- «Как принимать работу разработчика — чек-лист?»
- «Разработчики не читают комментарии — как быть?»
- «Как встроить дизайнера в спринт разработки?»

## Когда НЕ меня, а соседа

- **Компонентная система как язык** → [design-systems](../design-systems/SKILL.md).
- **Аудит уже выпущенной фичи** → [design-audit](../design-audit/SKILL.md).
- **Общие процессы команды** → [design-ops](../../ops/design-ops/SKILL.md).
- **Как договариваться с CPO/PM** → [stakeholder-work](../../ops/stakeholder-work/SKILL.md).

## Что я умею

### Три модели handoff'а

**1. Waterfall (плохая).** Дизайнер закончил → отдал макеты → разработчик начал → показал результат → дизайнер увидел ошибки → переделка. Медленно, дорого, конфликтогенно.

**2. Overlapping (средняя).** Дизайнер и разработчик пересекаются в конце дизайна / начале разработки. Обзор, вопросы, приёмка. Better, но потери в мелочах.

**3. Embedded (хорошая).** Дизайнер в спринте разработчиков. Ежедневная работа парой. Разработчик проверяет реализацию у дизайнера сразу. Потери близки к нулю.

Head должен привести команду к embedded'у или максимально близко.

### Что должно быть в handoff-пакете

**Design file (Figma).**
- Основной flow — экраны + состояния.
- Все interactive-компоненты помечены как компоненты (не detached instances).
- Все размеры / расстояния / цвета — через **tokens**, не хардкод.
- Секции с "Dev-Ready" ярлыком — что готово к разработке.

**Компонентная спека.**
- Anatomy — из чего состоит компонент.
- Variants (все состояния).
- Props (что настраивается: size, variant, disabled).
- Do / don't примеры.
- Accessibility — keyboard, ARIA, focus.

**Interaction spec.**
- Hover, focus, active, disabled — визуально показаны.
- Motion — duration, easing, что анимируется.
- Sound (если есть) — файл и когда играет.

**Content.**
- Все текстовые строки — в дизайне (не «lorem ipsum» и не «text here»).
- i18n placeholders помечены — где идут переменные.

**Data.**
- Что за данные, откуда, формат.
- Edge cases — пустое, длинное, много, ошибка.
- Loading — как выглядит.

**Edge cases.**
- Пустой стейт, ошибка, offline, longtext, RTL, screen reader — прописаны.

### Figma Dev Mode

Не «просто режим для разработчиков». Реальный инструмент, если правильно настроить:

**Что даёт:**
- Автогенерация CSS / iOS / Android свойств.
- Compare — сравнение frame'ов.
- Плагины (Anima, Design Tokens).
- Секции "Ready for dev" — показывает разработчику, что готово, что WIP.

**Что нужно от дизайнера:**
- Использовать variables (не raw values) — Dev Mode покажет token name.
- Помечать frames как Ready for dev.
- Auto layout везде (иначе сгенерирует mess).
- Компоненты с осмысленными именами (Button/Primary/Medium — да; Button/1/2 — нет).

### Tokens как контракт

Design tokens ([design-systems](../design-systems/SKILL.md)) — общий язык дизайна и кода.

- Дизайнер использует `button.primary.bg` в Figma.
- Разработчик использует `button.primary.bg` в коде.
- Один source of truth — токены хранятся в JSON, версионируются в git.

Если это работает — handoff по цветам / spacing / typography **не нужен**. Всё в системе.

### Ретро с командой

После каждого релиза — короткое ретро (30 минут):
- Что промахнули из макета в код?
- Где handoff-пакет был неполный?
- Что должно быть в системе, но не было?
- Что ускорить в следующий раз?

Не «ищем виноватого», а «улучшаем практику». Head модерирует.

### Чек-лист приёмки

Прежде чем зафичат, дизайнер проверяет **на живом продукте** (staging или dev-билд):

**Визуал:**
- Расстояния соответствуют spec (в пределах ±2px).
- Цвета — через токены (не «примерно тот же оттенок»).
- Типографика — размер / weight / line-height по системе.
- Иконки — из системы, не левые.

**Interaction:**
- Hover, focus, active работают.
- Motion — timing и easing как в спеке.
- Клавиатурная навигация проходит.

**Contents:**
- Все тексты как в дизайне (не placeholder).
- Empty state / error state — на месте.
- Loading state — не forgotten.

**Edge cases:**
- Длинный текст не ломает layout.
- Offline / no-data — обработано.
- RTL (если продукт multi-lang) — работает.

**Responsive:**
- Мобильный / desktop переходы плавные.
- Safari / Chrome / Firefox — одинаково.

**Accessibility:**
- Screen reader объявляет что нужно.
- Контраст проверен на реальных данных.

### Работа с реалиями команды

**Разработчик не читает Figma-комментарии.**
- Используй Slack / Linear / Notion.
- Ежедневный синк на 15 минут в спринте.
- Компонент → пара «дизайнер + фронтендер» на всё.

**Sprint без дизайнера.**
- Requestим место в дейли-планинге и стенд-апе.
- Retro включает дизайнера.
- QA-время резервируем на приёмку.

**Разное представление "готово".**
- Определи Definition of Done с командой письменно.
- Включи design QA в него.

## Ключевые концепции

**Контракт, не документ.** Handoff — не PDF со спецификациями. Handoff — договорённость: как дизайнер даёт материал, как разработчик реализует, как проверяют совместно.

**Токены = single source of truth.** Всё остальное вторично.

**Design QA — часть definition of done.** Задача не «закрыта», пока дизайнер не принял.

**Раннее вовлечение разработчика.** В идеале — со стадии wireframes. Он подскажет, что реалистично, что нет.

**Ретро — обязательно.** Без него handoff не улучшается, повторяются те же ошибки.

**Domain-специфика.**
- **Fintech.** Тщательнее с edge cases (ошибки платежа, отказы KYC, offline). Design QA на реальных данных обязательно.
- **E-com.** Много данных (каталог) — тестируй на массиве реалистичных SKU.
- **Edtech.** Проверяй на разных устройствах (планшеты школ) и разных типах контента.

## Типовые вопросы ментора

Услышав «handoff кривой», спрошу:

1. «Модель — waterfall / overlapping / embedded?»
2. «Токены единый source или дизайн одно, код другое?»
3. «Dev Mode настроен и используется?»
4. «Что включаешь в handoff-пакет?»
5. «Design QA существует как чек-лист или на глаз?»
6. «Ретро после релиза проводите?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что видишь handoff как процесс, а не разовый акт».
2. **Диагноз.** «Ты в waterfall — надо в embedded» *(или)* «Токены есть в Figma, нет в коде — расходятся».
3. **Что делать.** Конкретные шаги — Dev Mode, чек-лист QA, синк парой.
4. **Инструмент.** Что использовать (Figma Dev Mode, Storybook, Zeroheight, свой сайт).
5. **Ретро.** Один вопрос — что снимем в следующий раз.
6. **Следующий шаг.** «Спроси про [design-audit] для приёмки, или про [design-systems] если tokens не единый».

## Ловушки

- **Waterfall handoff.** Отдали макеты, ушли, вернулись через 2 недели — разбираем разбор.
- **Комментарии в Figma.** Разработчик не читает. Пиши в Slack / Linear.
- **Токены только в Figma.** Код хардкодит цвета → расхождение через 3 спринта.
- **Нет design QA.** Задача «закрыта» без проверки дизайнером.
- **Одноразовое ретро.** Провели раз, забыли. Регулярность важна.
- **Разработчик впервые видит дизайн на handoff'е.** Слишком поздно — фидбэк «это не сделаем» на финале.
- **Пустой Dev Mode.** Frames не помечены, variables не используются — Dev Mode бесполезен.

## Источники

- **Figma.** [Dev Mode](https://help.figma.com/hc/en-us/sections/17165716183063-Dev-Mode) — full reference.
- **Curtis, Nathan.** [EightShapes на handoff](https://medium.com/eightshapes-llc) — глубокая практика.
- **Storybook.** [storybook.js.org](https://storybook.js.org/) — компоненты в коде, доступны дизайнеру и разработчику.
- **Zeroheight.** [zeroheight.com](https://zeroheight.com/) — платформа документации.
- **Comeau, Josh.** [joshwcomeau.com](https://www.joshwcomeau.com/) — блог разработчика о работе с дизайном.
- **Smashing Magazine.** [Design Handoff articles](https://www.smashingmagazine.com/category/handoff/).

## Смежные скилы

- [design-systems](../design-systems/SKILL.md) — токены как контракт
- [design-audit](../design-audit/SKILL.md) — приёмка живого продукта
- [design-ops](../../ops/design-ops/SKILL.md) — процессы всей команды
- [stakeholder-work](../../ops/stakeholder-work/SKILL.md) — разработчик как стейкхолдер
- [prototyping](../prototyping/SKILL.md) — coded prototype упрощает handoff
