---
name: multi-platform
description: Продуктовые решения между платформами. Web/PWA/iOS/Android — различия паттернов, навигации, жестов, системных компонентов. Как собрать единый продукт под все платформы: где унифицировать, где разводить. Не сам гайд, а работа с гайдами в продукте.
layer: flow
phase: design
update: stable
sources:
  - Apple HIG. https://developer.apple.com/design/human-interface-guidelines/
  - Material 3. https://m3.material.io/
  - Luke Wroblewski — Mobile First. https://abookapart.com/products/mobile-first
  - Nielsen Norman Group — Mobile UX. https://www.nngroup.com/topic/mobile-and-tablet-design/
  - web.dev — Responsive Web Design. https://web.dev/learn/design/
  - Josh Clark — Designing for Touch. https://abookapart.com/products/designing-for-touch
neighbors:
  - platform-guidelines: platform-guidelines — сами гайды как источник истины; я — как их применять в продукте
  - design-systems: я — как один язык живёт на трёх платформах; design-systems — сам язык
  - clean-ui: clean-ui — крафт внутри одной платформы; я — где разводить между
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# multi-platform

Один продукт на iOS + Android + web ≠ одинаковые экраны. Head отвечает за то, чтобы команда осознанно решала «унифицировать или разводить», а не тащила всё в один макет и надеялась.

## Когда меня звать

- «Продукт делаем на iOS, Android и web — как совместить?»
- «Скопировали iOS-макет в Android — выглядит чужеродно, почему?»
- «Стоит ли делать PWA или нативные?»
- «Где унифицировать, где разводить?»
- «Как назвать одинаково "тот же экран" на iOS и Android, если паттерны разные?»

## Когда НЕ меня, а соседа

- **Сами гайды по платформам** (HIG, Material) → [platform-guidelines](../../reference/platform-guidelines/SKILL.md).
- **Компонентный язык / дизайн-система** → [design-systems](../design-systems/SKILL.md).
- **Крафт одного экрана внутри платформы** → [clean-ui](../clean-ui/SKILL.md).
- **A11y-требования** → [accessibility](../accessibility/SKILL.md).

## Что я умею

### Три подхода к multi-platform

**1. Fully native.** Каждая платформа — по своим гайдам. iOS использует iOS-паттерны, Android — Material, web — свои. Дизайнеры (обычно) разные под каждую. Плюс: пользователи чувствуют «своё». Минус: дорого, легко получить визуальную и функциональную divergence.

**2. Cross-platform framework (React Native, Flutter).** Один код рендерит близко-нативно. Компромисс между стоимостью и качеством. Продуктовая логика единая, small platform-specific адаптации.

**3. Unified brand-first.** Один язык + минимальные платформенные уступки (back-нав, share sheets, system components). Плюс: узнаваемо, дёшево. Минус: пользователи могут почувствовать «не своё».

Head выбирает подход **осознанно**, исходя из зрелости продукта, ресурсов, ЦА.

### Где всегда разводить

Есть паттерны, где идти против платформы **всегда** плохо:

**Навигация.**
- iOS: tab bar снизу, back-swipe справа.
- Android: bottom navigation bar (Material 3) или navigation drawer, hardware back.
- Не пытайся «одинаково» — сломаешь пользователя.

**System sheets.**
- iOS: Action sheet (снизу), share sheet.
- Android: Modal bottom sheet (Material 3), share intent.
- Компоненты внешне похожи, поведение разное — не подменяй нативное.

**Alerts / Dialogs.**
- iOS: HIG alerts, простая структура.
- Android: Material dialogs с action-структурой.
- Никогда не рисуй свой alert поверх системного стиля — фейл в 100% случаев.

**Typography.**
- iOS: SF Pro / SF Rounded (или своя, но с iOS-метрикой).
- Android: Roboto / Google Sans / своя (Material тип-скейл).
- Web: whatever brand использует.

**Icons.**
- iOS: SF Symbols (обширный набор Apple).
- Android: Material Symbols / Google Fonts icons.
- Свой набор — только если бренд требует, но с адаптацией под weight/stroke платформы.

**Жесты.**
- iOS: back-swipe справа, swipe-actions в списках.
- Android: hardware / gesture back, swipe-to-refresh, swipe в списках чуть иначе.

### Где можно унифицировать

**Brand.** Логотип, цвет, tone-of-voice — единые.

**Product logic.** Одинаковый флоу (в 90% случаев). Пользователь не должен переучиваться при смене устройства.

**Domain-specific UI.** Продуктовые компоненты (карточка вклада, чекаут-стек, курс-карточка) — общий язык, но с адаптацией под платформенные метрики.

**Content.** Тексты, illustrations, empty states — единые.

**Iconography** (внутри продуктовой части, не системные).

### Web / PWA специфика

**Не «маленький iPhone».** Web — свой мир: адаптивность (mobile / tablet / desktop breakpoints), keyboard, cursor states (hover, focus), context menu, URL как единица навигации, no back-swipe.

**PWA baseline:**
- HTTPS mandatory
- Manifest.json (name, icons, theme_color)
- Service worker для offline
- Responsive by default
- Web Push notifications
- Add to home screen prompt

**Adaptive layout:**
- Mobile-first — начинай с 375px viewport
- Breakpoints: 375 / 768 / 1024 / 1440
- Touch targets 44×44 min (WCAG)
- Safe areas на iOS Safari (notch, home indicator)

### Multi-platform в design-system

Как один язык компонентов адаптируется:

- **Tokens** — единые семантические (`button.primary.bg`), но платформенный layer может переопределить (`ios.button.radius = 12`, `android.button.radius = 4`).
- **Component API** — единый (props: `variant`, `size`, `state`), реализация — платформенная.
- **Anatomy** — одинаковая. Button на iOS и Android имеет icon + label + state.
- **Behaviour** — платформенное. Ripple на Android, opacity fade на iOS.

## Ключевые концепции

**Осознанное решение, не «одинаково».** Head должен на каждый паттерн задать: «унифицирую или разведу и почему».

**Native = уважение к пользователю.** iOS-юзер ожидает back-swipe. Android-юзер ожидает hardware back. Отобрать — потеря доверия.

**Продуктовая логика ≠ платформенный UI.** Одна и та же логика чекаута может выражаться разными компонентами на iOS и Android — это нормально.

**Domain-специфика.**
- **Fintech.** Часто web+iOS+Android — все три. Регуляторка (2FA, KYC) требует унификации логики, UI — по платформам.
- **E-com.** Web-first обычно, mobile-web сильный, native приложения — для лояльных.
- **Edtech.** iPad/Android tablet важны — большой экран для контента; web для родителей; native для повседневки.

**Отдельные vs shared componentы.** Держи в системе оба слоя: shared (product-specific) и platform-specific (adaptation).

## Типовые вопросы ментора

Услышав «делаем на iOS+Android+web», спрошу:

1. «Ресурс — одна команда или три?»
2. «Какая ЦА на какой платформе?»
3. «Какие паттерны уже пытались "одинаково" и не пошло?»
4. «PWA рассматривается или только native мобильные?»
5. «Domain — где регуляторка требует унификации логики?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задумываешься до того, как рисуешь — большинство рисует iOS и потом мучается с Android».
2. **Диагноз.** «Ты хочешь унифицировать back-навигацию — плохая идея, платформы её ждут по-разному».
3. **Правило.** Что унифицировать (brand, product logic, content), что разводить (system UI, gestures, navigation).
4. **Подход.** Fully native / cross-platform framework / unified brand-first — что рекомендую под ситуацию.
5. **Компонентная работа.** Как это ляжет в design-system.
6. **Следующий шаг.** «Спроси про [platform-guidelines] чтобы сверить с HIG/Material, или про [design-systems] чтобы разложить слой платформенной адаптации».

## Ловушки

- **iOS-макет → Android дословно.** Bottom tab bar с центральной кнопкой из iOS в Android = чужеродно. Android-юзеры делают FAB иначе.
- **Собственные alerts.** Свой стиль alert-диалога поверх системного — фейл.
- **Игнор back-навигации.** На Android — hardware / gesture back должен работать всегда.
- **Web как «маленький iPhone».** Не адаптивно, без hover, без keyboard-nav. Web ≠ mobile.
- **Разные названия «того же».** На iOS назвали «Настройки», на Android «Параметры» — путаница.
- **Одинаковая типографика.** SF Pro на Android — mistake. Roboto на iOS — mistake. Своя платформенная, если бренд требует.
- **Одна команда на всё без экспертизы.** Дизайнер, который никогда не работал на Android, промахнётся 10 раз в мелочах.

## Источники

- **Apple HIG.** [developer.apple.com/design/human-interface-guidelines](https://developer.apple.com/design/human-interface-guidelines/) — первоисточник для iOS/iPadOS/macOS.
- **Google.** [Material 3](https://m3.material.io/) — первоисточник для Android.
- **Wroblewski, Luke.** *Mobile First* — до сих пор актуально для web/PWA. [A Book Apart](https://abookapart.com/products/mobile-first).
- **NN/g.** [Mobile UX articles](https://www.nngroup.com/topic/mobile-and-tablet-design/).
- **web.dev.** [Learn Responsive Design](https://web.dev/learn/design/) — Google's practical guide.
- **Clark, Josh.** [Designing for Touch](https://abookapart.com/products/designing-for-touch) — про мобильные жесты.

## Смежные скилы

- [platform-guidelines](../../reference/platform-guidelines/SKILL.md) — сами гайды
- [design-systems](../design-systems/SKILL.md) — язык компонентов через платформы
- [clean-ui](../clean-ui/SKILL.md) — крафт внутри платформы
- [accessibility](../accessibility/SKILL.md) — a11y как platform-baseline
