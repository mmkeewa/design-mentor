---
name: design-systems
description: Дизайн-система как продукт. Токены (color, spacing, typography, motion), компоненты, варианты и состояния, Core/Project-слои, Atomic Design, governance, документация, масштабирование под рост команды, versioning. Head приходит сюда, когда команда переросла «файл с компонентами в Figma».
layer: flow
phase: design
update: stable
sources:
  - Brad Frost — Atomic Design. https://atomicdesign.bradfrost.com/
  - Nathan Curtis — EightShapes / Design Systems series. https://medium.com/eightshapes-llc
  - design.systems — сообщество и ресурсы. https://design.systems/
  - designsystems.com. https://designsystems.com/
  - Tokens Studio — token architecture. https://tokens.studio/
  - Alla Kholmatova — Design Systems (book). https://www.smashingmagazine.com/design-systems-book/
neighbors:
  - clean-ui: clean-ui — крафт одного экрана; я — переиспользуемый язык для всех экранов
  - platform-guidelines: я — своя система; platform-guidelines — чужие как канон/эталон
  - multi-platform: я — язык компонентов; multi-platform — как один язык живёт на трёх платформах
  - design-ops: design-ops — процессы работы команды; я — материальный слой (компоненты, доки)
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# design-systems

Дизайн-система — не библиотека компонентов, а **продукт**. У неё пользователи (дизайнеры и разработчики), backlog, метрики, релизный цикл, governance. Head отвечает за то, чтобы система развивалась как продукт, а не «поддерживалась в свободное время».

## Когда меня звать

- «Пора делать дизайн-систему?» — когда переросли ad-hoc.
- «Есть UI-kit, но им никто не пользуется — почему?»
- «Как разделить core и product-specific?»
- «Governance: как принимаются решения о новых компонентах?»
- «Что такое токены и как их построить?»
- «Как связать Figma-библиотеку с кодом?»

## Когда НЕ меня, а соседа

- **Крафт одного экрана** → [clean-ui](../clean-ui/SKILL.md).
- **Чужие ref-системы как канон** (Ant, Carbon, Polaris) → [platform-guidelines](../../reference/platform-guidelines/SKILL.md).
- **Мультиплатформенная адаптация** (iOS/Android/web) → [multi-platform](../multi-platform/SKILL.md).
- **Процессы команды вокруг системы** → [design-ops](../../ops/design-ops/SKILL.md).
- **A11y-требования к компонентам** → [accessibility](../accessibility/SKILL.md).

## Что я умею

### Три слоя системы

**1. Foundations (tokens).** Атомарные значения: цвет, spacing, typography, radius, shadow, motion. Не привязаны к компонентам.

**2. Components.** Собранные из tokens: button, input, card, modal, table. С вариантами и состояниями.

**3. Patterns.** Композиции компонентов: login flow, empty states, notification stack, data tables с filters.

### Token architecture — три уровня

Классическая пирамида (Nathan Curtis / Tokens Studio):

```
Semantic (aliases)      button.primary.background = brand.500
    ↓
Reference (theme)       brand.500 = #FF6B00
    ↓
Global (primitives)     orange-500 = #FF6B00
```

**Global** — сырые значения (`orange-500`, `space-4`, `font-family-sans`).
**Reference** — назначения по бренду / теме (`brand.primary`, `radius.md`).
**Semantic** — назначения по использованию (`button.primary.bg`, `text.error`).

Компонент использует **semantic**, не reference и не global. Тогда смена бренда / theming / dark mode — просто переопределение уровня reference, компонент не трогают.

### Core vs Project slice (EightShapes)

Nathan Curtis: **core** — общее для всех продуктов компании; **project** — специфика конкретного продукта / вертикали.

```
Core (общее)
├── Foundations
├── Base components (button, input)
└── Base patterns (modals, forms)
    ↓
Project A slice
├── Domain-specific components (mortgage-calculator, deposit-card)
└── Project-specific patterns
```

**Правило:** новый компонент → сначала в project. Через 2–3 использования в разных проектах → promotion в core. Не запихивать всё сразу в core — это раздувание.

### Atomic Design (Brad Frost)

Классическая метафора:
- **Atoms** — button, input, label
- **Molecules** — search bar (input + button + icon)
- **Organisms** — nav bar, card list
- **Templates** — page layouts
- **Pages** — конкретные экземпляры

Полезна для мышления от малого к большому. **Не тащить дословно в файловую структуру** — не масштабируется. Использовать как ментальную модель.

### Governance

Кто и как решает, что попадает в систему.

**Модели:**
- **Central team owns.** Отдельная команда системы принимает решения. Быстро, но узкое горлышко.
- **Federated.** Product teams предлагают, central review'ит. Балансирует скорость и качество.
- **Distributed.** Все контрибьютят по гайду. Быстро, но качество плавает.

Head'ы обычно живут в **federated**: central team держит foundations и review, product teams растят свои project slices.

**Contribution guide** обязателен: как предложить новый компонент, что нужно (кейсы, вариации, состояния, тесты, доки), сроки review.

### Documentation

Не «Figma-библиотека и всё». Хорошая документация:

- **Overview** — что за компонент, когда использовать.
- **Anatomy** — из чего состоит.
- **Variants & states** — все варианты в одной таблице.
- **Usage guidelines** — do / don't с примерами.
- **Accessibility notes** — WCAG requirements, keyboard, screen reader.
- **Code snippets** — как использовать в коде.
- **Related** — какие компоненты соседи.

Инструменты: Zeroheight, Supernova, Storybook (dev), Notion, самописный сайт. Главное — жить где ищут.

### Versioning

Дизайн-система — как npm-пакет. Semantic versioning:
- **Major (1.0 → 2.0)** — breaking changes, требует миграции.
- **Minor (1.1 → 1.2)** — новые компоненты / варианты, обратно совместимо.
- **Patch (1.1.1 → 1.1.2)** — багфиксы, полировка.

Release notes обязательны. Deprecation — с 1–2 minor-циклами предупреждения.

### Метрики системы

Как измерять успех системы:
- **Adoption** — % экранов, использующих компоненты из системы.
- **Coverage** — % use cases, покрытых компонентами.
- **Contribution rate** — сколько компонентов пришло от product teams.
- **Time to component** — от идеи до релиза.
- **Detached instances** — сколько компонентов отвязаны от библиотеки (сигнал, что чего-то не хватает).

## Ключевые концепции

**Система = продукт.** Со своими пользователями (дизайнеры, разработчики), roadmap, release cycle, метриками. Не «в свободное время».

**Токены до компонентов.** Пропущенный слой tokens = каждый компонент inconsistent, а theming невозможен.

**Semantic tokens > direct values.** Компонент, использующий `#FF6B00` — жёстко привязан. Компонент, использующий `button.primary.bg` — переживёт rebranding.

**Deprecation vs removal.** Убираешь компонент — сначала deprecate с alternative, дай 1–2 месяца на миграцию, потом remove. Иначе product teams мажут временные workarounds.

**Code parity.** Дизайн-система, живущая только в Figma без кодовой парности, — не система, а моок. Обязательно связка code library (React, Vue, iOS, Android) с Figma-библиотекой на одной таксономии.

**Governance > tooling.** Инструмент без правил принятия решений даст хаос. Правила без инструмента — тоже.

**Domain-специфика.** Fintech-система: сильные acценты на data-visualization, tables, status states. E-com: карточки товара с несколькими вариантами (грид/список/карусель), фильтры, quick add. Edtech: progress indicators, cards для контента, playful но не хаотичный motion.

## Типовые вопросы ментора

Услышав «делаем дизайн-систему», спрошу:

1. «Скольким продуктам это будет служить? 1 / 3 / 20?» — определит core vs project.
2. «Есть ли ownership — команда/человек, или это side-project?»
3. «Токены как выстроены? Semantic layer есть?»
4. «Governance-модель определена? Кто и как принимает решения?»
5. «Есть code parity или только Figma?»
6. «Что измеряете как метрики системы?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что осознаёшь: это продукт, а не побочная задача».
2. **Диагноз.** «У тебя есть компоненты, нет tokens» *(или)* «Governance не определён — будет разваливаться».
3. **Что делать.** Слой tokens → core vs project раскладка → contribution guide.
4. **Инструменты.** Tokens Studio + Figma variables + Storybook / Zeroheight — конкретно.
5. **Метрики.** Что мерить — adoption, coverage, contribution rate.
6. **Следующий шаг.** «Спроси про [design-ops] чтобы процессы поставить, или про [multi-platform] если система живёт на нескольких».

## Ловушки

- **Компоненты без tokens.** Каждый компонент = отдельный inconsistent набор values.
- **Core-only.** Всё в core → раздувается, product teams не могут двигать быстро.
- **Одна команда без federated.** Central team — узкое горлышко, product teams обходят через detached instances.
- **Deprecation без alternative.** Убрали компонент → product teams клеят workaround.
- **Figma без code.** Дизайнеры продвинулись, разработчики строят своё. Divergence нарастает.
- **Метрики отсутствуют.** «Мы сделали систему» — но не знаем, пользуются ли.
- **Copy Ant Design / Material.** Взяли всё, ничего не адаптировали. У Ant свой домен и своя аудитория.

## Источники

- **Frost, Brad.** [Atomic Design](https://atomicdesign.bradfrost.com/) — базовая книга, вся онлайн.
- **Curtis, Nathan.** [EightShapes на Medium](https://medium.com/eightshapes-llc) — Space, Tokens, Contribution model, всё.
- **design.systems.** [design.systems](https://design.systems/) — сообщество, ссылки, ресурсы.
- **designsystems.com.** [designsystems.com](https://designsystems.com/) — репозиторий design systems со всего мира.
- **Tokens Studio.** [tokens.studio](https://tokens.studio/) — плагин + документация по token architecture.
- **Kholmatova, Alla.** [Design Systems (book)](https://www.smashingmagazine.com/design-systems-book/) — про паттерны и языки.
- **Storybook.** [storybook.js.org](https://storybook.js.org/) — dev-документация компонентов.

## Смежные скилы

- [clean-ui](../clean-ui/SKILL.md) — крафт одного экрана
- [platform-guidelines](../../reference/platform-guidelines/SKILL.md) — canonical системы
- [multi-platform](../multi-platform/SKILL.md) — система на нескольких платформах
- [design-ops](../../ops/design-ops/SKILL.md) — процессы вокруг системы
- [accessibility](../accessibility/SKILL.md) — a11y-требования к компонентам
