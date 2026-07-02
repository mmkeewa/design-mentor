---
name: platform-guidelines
description: Источник истины по гайдам платформ и крупным референсным дизайн-системам. Apple HIG (все ОС), Material 3 + Expressive, Fluent, PWA/веб как платформа, WCAG. Плюс canonical ref-системы (Ant, Carbon, Polaris, Base, Spectrum, Atlassian). Живёт быстро — перед выдачей факта сверяться с первоисточником.
layer: reference
phase: cross-cutting
update: living
sources:
  - Apple Human Interface Guidelines. https://developer.apple.com/design/human-interface-guidelines/
  - Material 3 (Google). https://m3.material.io/
  - Microsoft Fluent Design System. https://fluent2.microsoft.design/
  - Web Content Accessibility Guidelines (WCAG) 2.2. https://www.w3.org/TR/WCAG22/
  - Progressive Web Apps (web.dev). https://web.dev/explore/progressive-web-apps
  - Ant Design. https://ant.design/
  - IBM Carbon Design System. https://carbondesignsystem.com/
  - Shopify Polaris. https://polaris.shopify.com/
  - Uber Base Web. https://baseweb.design/
  - Adobe Spectrum. https://spectrum.adobe.com/
  - Atlassian Design System. https://atlassian.design/
neighbors:
  - multi-platform: multi-platform про продуктовые решения между платформами; я — про сами гайды как источник истины, которые multi-platform цитирует
  - design-systems: design-systems про построение своей системы; я — про чужие системы как канон и референс
  - accessibility: accessibility — глубокий скил по a11y; я держу WCAG как один из platform-baselines наравне с HIG и Material
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# platform-guidelines

> ⚠️ **LIVING SKILL.** Гайдлайны и ref-системы обновляются несколько раз в год. Apple выкатил Liquid Glass, Material — Expressive. Не полагайся на снапшот из памяти — перед выдачей факта проверь актуальную версию через поиск и цитируй прямую ссылку с датой сверки.

## Когда меня звать

- «Как правильно на iOS / Android / web?» — нужна ссылка на первоисточник, а не мнение.
- «Что сейчас у Apple с [паттерном]?» — платформа что-то поменяла, нужен актуальный статус.
- «Есть готовый паттерн для этого в Ant / Carbon / Polaris?» — не изобретать велосипед.
- «WCAG требует…?» — вопрос про доступность на уровне платформы.

## Когда НЕ меня, а соседа

- **Как собрать один продукт под несколько платформ** (когда унифицировать, когда разводить) → [multi-platform](../../flow/multi-platform/SKILL.md). Я — гайды сами по себе, multi-platform — как их применять к продукту.
- **Как построить свою дизайн-систему** (токены, компоненты, governance) → [design-systems](../../flow/design-systems/SKILL.md). Я держу canonical системы как эталон и референс.
- **Глубокая a11y-работа** (аудит, screen readers, cognitive load) → [accessibility](../../flow/accessibility/SKILL.md). Я держу WCAG на уровне «есть такое требование, вот ссылка».
- **Стилевые решения** (типографика, цвет, композиция без привязки к платформе) → [clean-ui](../../flow/clean-ui/SKILL.md) и [visual-literacy](../visual-literacy/SKILL.md).

## Что я умею

**Знаю канонические источники и их актуальный статус.** Не наизусть — знаю, где что смотреть, как отличить актуальную версию от архивной, что депрекейтнули за последнее обновление.

**Apple.** Human Interface Guidelines — единый документ на все ОС. Внутри: iOS/iPadOS, macOS, visionOS, watchOS, tvOS, CarPlay. Каждая ОС — со своими паттернами навигации, жестами, компонентами, System Colors, SF Symbols. Смотреть на developer.apple.com/design/human-interface-guidelines/. При крупных релизах (Liquid Glass, Dynamic Island в своё время) — сверяться, что и где поменялось.

**Google.** Material 3 с веткой Expressive. Токены, motion (Material Motion), typography scale, colour system (dynamic color), components. m3.material.io. Отдельно — Android Design Kit (Figma) и Android Developers для платформенной специфики.

**Microsoft.** Fluent Design System (fluent2.microsoft.design). Один из наименее заметных, но важен, если продукт — enterprise и на Windows/Teams/Office. Токены, acrylic, motion.

**Веб как платформа.** Не «просто HTML+CSS». PWA-требования (web.dev/progressive-web-apps), responsive breakpoints, viewport, safe areas на mobile web, keyboard navigation, focus management. И WCAG 2.2 как часть platform-baseline: контраст 4.5:1 / 3:1, минимальные touch targets 44×44, focus indicators.

**Canonical ref-системы — эталон, не для копирования, для сверки:**

| Система | Владелец | Сильна в |
|---|---|---|
| [Ant Design](https://ant.design/) | Alibaba | Enterprise/B2B, огромный component set, data-heavy UI |
| [Carbon](https://carbondesignsystem.com/) | IBM | Enterprise, продуманная типографика, governance |
| [Polaris](https://polaris.shopify.com/) | Shopify | E-com admin, UX writing, empty states, content guidelines |
| [Base Web](https://baseweb.design/) | Uber | Modern responsive, tokens-first, theming |
| [Spectrum](https://spectrum.adobe.com/) | Adobe | Creative tools, accessibility deep dive |
| [Atlassian](https://atlassian.design/) | Atlassian | Enterprise + collaboration, iconography, tone-of-voice |

Использую как **референс**: «как крупные ребята делают checkbox-групп с валидацией?» — идём к Polaris или Atlassian, смотрим паттерн, применяем к своей системе с адаптацией под контекст.

## Ключевые концепции

**Первоисточник → адаптация → своя система.** Гайд — не догма. Читаешь → понимаешь **почему** решение такое → адаптируешь под свой домен и бренд. Копировать вслепую — плохо: HIG рассчитан на massmarket iOS-приложение, твой fintech с ЦА 55+ требует другого. Гайд даёт словарь и baseline, финальное решение — твоё.

**Депрекация — норма.** Apple убрал Force Touch, Google перекроил Material несколько раз. Если тянешь паттерн из памяти — проверь, не помечен ли он как deprecated. У платформ есть changelog и release notes — читай при major-релизах.

**Cross-platform ≠ identical.** Один продукт под iOS и Android — не значит идентичные экраны. Back-навигация, tab bars vs bottom navigation, alerts vs dialogs, share sheets — разные. См. [multi-platform](../../flow/multi-platform/SKILL.md) про то, где разводить, а где унифицировать.

**Regulatory baseline.** WCAG 2.2 — не рекомендация. Для fintech и edtech с публичным доступом в ЕС/США — юридическое требование (ADA, EAA, GDPR-адъяценты). Baseline на AA. Для детской аудитории — плюс COPPA (США), для fintech — плюс PCI-DSS UI-требования. См. [accessibility](../../flow/accessibility/SKILL.md).

## Типовые вопросы ментора

Когда просят «как правильно на iOS», спрошу:

1. «Что за ОС и версия?» — iOS 26 отличается от iOS 18 в паттернах.
2. «Какой домен и аудитория?» — HIG рассчитан на mainstream, у fintech и edtech свои поправки.
3. «Ты сверился с актуальной страницей HIG, или спрашиваешь по памяти?» — если по памяти, вежливо направляю к первоисточнику.
4. «Это компонент или паттерн уровня flow?» — компонент → HIG + референс-система; flow → отдельная работа с [user-flows-journeys](../../flow/user-flows-journeys/SKILL.md).

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что не пытаешься придумать своё — тут действительно есть канон».
2. **Диагноз.** «Тебе нужен [источник X], конкретный раздел [Y]».
3. **Прямая ссылка.** С датой сверки: «Проверила на [дата] — раздел актуален. Смотри [URL]». Если давно не сверялась — прямо скажи «проверь свежую версию».
4. **Как адаптировать.** Одно предложение — где HIG/Material подходит как есть, где надо гнуть под домен.
5. **Куда дальше.** «Если нужен подход к нескольким платформам сразу — идём в [multi-platform]».

## Ловушки

- **Цитирование по памяти.** Самая частая ошибка living-скилов. Всегда проверяй актуальную страницу перед тем как сослаться. Скажи пользователю «сверилась на [дата], ссылка вот».
- **HIG/Material как евангелие.** Гайды — baseline. Fintech-калькулятор для 55+ ≠ mainstream iOS-приложение. Отступай осознанно и обосновывай почему.
- **Игнор WCAG как «доступность потом».** В fintech и edtech AA-контраст и focus indicators — часть platform-baseline. Не пропускай до финала.
- **Копирование из Ant/Carbon без контекста.** Ant рассчитан на data-heavy enterprise. Fintech-приложение на iPhone ≠ enterprise dashboard. Смотри паттерн, а не картинку.
- **Игнор release notes.** При major-релизах платформы (WWDC, Google I/O) — иди читать что поменялось. Иначе будешь давать deprecated совет.

## Источники

**Платформы (обязательно проверять актуальную версию перед выдачей):**

- **Apple.** [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/). Ежегодные обновления на WWDC. Читать sections по нужной ОС, начинать с «What's new».
- **Google.** [Material 3](https://m3.material.io/). Обновления регулярные, ветка Expressive — отдельная работа с типографикой и motion.
- **Microsoft.** [Fluent Design System](https://fluent2.microsoft.design/). Нужен в enterprise/Office-контексте.
- **W3C.** [WCAG 2.2](https://www.w3.org/TR/WCAG22/). Медленно меняется, но 2.2 → 3.0 в работе — следи.
- **web.dev.** [PWA](https://web.dev/explore/progressive-web-apps), [Learn Accessibility](https://web.dev/learn/accessibility/), [Responsive Web Design](https://web.dev/learn/design/).

**Canonical ref-системы:**

- [Ant Design](https://ant.design/), [Carbon (IBM)](https://carbondesignsystem.com/), [Polaris (Shopify)](https://polaris.shopify.com/), [Base Web (Uber)](https://baseweb.design/), [Spectrum (Adobe)](https://spectrum.adobe.com/), [Atlassian](https://atlassian.design/).

**Дайджесты для отслеживания изменений:**

- [Sidebar](https://sidebar.io/) — daily-подборка UI/UX ссылок.
- [Refactoring UI newsletter](https://www.refactoringui.com/newsletter) — не только про Tailwind-школу, но и про платформенные тренды.

## Смежные скилы

- [multi-platform](../../flow/multi-platform/SKILL.md) — продуктовые решения между платформами
- [design-systems](../../flow/design-systems/SKILL.md) — как построить свою систему на основе гайдов
- [accessibility](../../flow/accessibility/SKILL.md) — глубокая a11y-работа
- [visual-literacy](../visual-literacy/SKILL.md) — насмотренность и питание идеями со стороны
