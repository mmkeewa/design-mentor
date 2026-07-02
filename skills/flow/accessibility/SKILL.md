---
name: accessibility
description: WCAG 2.2, adaptive UI, screen readers, контраст, keyboard navigation, touch targets, cognitive load, motion sensitivity. Для fintech и edtech — это ещё и юридическое требование (ADA, EAA, COPPA). Head приходит сюда, чтобы a11y была baseline, а не пожеланием.
layer: flow
phase: design
update: living
sources:
  - W3C — WCAG 2.2. https://www.w3.org/TR/WCAG22/
  - web.dev — Learn Accessibility. https://web.dev/learn/accessibility/
  - Nielsen Norman Group — Accessibility. https://www.nngroup.com/topic/accessibility/
  - Deque University. https://dequeuniversity.com/
  - Sara Soueidan — inclusive design articles. https://www.sarasoueidan.com/blog/
  - A11y Project. https://www.a11yproject.com/
  - GOV.UK Design System — accessibility. https://design-system.service.gov.uk/accessibility/
  - Inclusive Design Principles (Microsoft). https://inclusive.microsoft.design/
neighbors:
  - clean-ui: contrast и spacing — часть crafting, часть a11y; я — про правила, clean-ui — про crafting
  - editorial-policy: plain language — часть cognitive a11y; мы граничим
  - platform-guidelines: WCAG живёт как platform-baseline; они его цитируют
  - design-systems: a11y-требования встраиваются в компоненты
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# accessibility

> ⚠️ **LIVING SKILL.** WCAG медленно, но обновляется. Baseline standard в 2026 — WCAG 2.2, версия 3.0 в разработке. Сверяйся с актуальной версией W3C перед выдачей ссылок и цифр.

Доступность — не «сделаем для инвалидов». Доступность — для всех, кто когда-нибудь: пожилой, уставший, за рулём, с ребёнком на руках, в ярком солнце, с временной травмой, в шумном месте, на плохом экране. Head отвечает за то, чтобы a11y был baseline, а не финальной галочкой.

## Когда меня звать

- «WCAG требует X — что это значит на практике?»
- «Контрасты — как проверять, где посмотреть?»
- «Screen reader — что должен объявлять?»
- «Клавиатурная навигация — где обычно ломается?»
- «Юридические требования — ADA / EAA / COPPA — как готовиться?»
- «Motion sensitivity — что это, и почему нужно?»
- «Как встроить a11y в дизайн-систему, а не проверять руками каждый раз?»

## Когда НЕ меня, а соседа

- **Плейн-текст, tone-of-voice** → [editorial-policy](../editorial-policy/SKILL.md). Cognitive a11y — на границе.
- **Крафт визуала (сетка, spacing)** → [clean-ui](../clean-ui/SKILL.md). Контраст и focus — на границе, я держу правила.
- **Компоненты и токены** → [design-systems](../design-systems/SKILL.md). A11y-attributes встраиваются в компоненты.
- **Platform-специфика (HIG a11y, Material a11y)** → [platform-guidelines](../../reference/platform-guidelines/SKILL.md).

## Что я умею

### WCAG 2.2 — четыре принципа

WCAG строится на POUR:
- **Perceivable** — видно/слышно/чувствуется всеми.
- **Operable** — можно управлять (клавиатура, голос, жесты).
- **Understandable** — понятно, что происходит.
- **Robust** — работает с ассистивными технологиями.

### Уровни соответствия

- **A** — базовый минимум, минимальные требования.
- **AA** — практический стандарт индустрии, юридический baseline в большинстве стран.
- **AAA** — enhanced, редко полностью соответствуют.

**Head-правило.** Продукт целится в **AA как обязательный минимум**, AAA — где возможно (крупные текстовые области, специализированные продукты).

### Ключевые требования AA (топ-10)

**1. Контраст.**
- Body text: **4.5:1**.
- Large text (18pt+ / 14pt+ bold): **3:1**.
- UI components и graphical elements: **3:1**.
- Тестировать: [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/), [Stark plugin](https://www.getstark.co/).

**2. Focus visible.**
- Каждый interactive элемент должен иметь **чёткий focus indicator** при клавиатурной навигации.
- Default browser outline — уродливый, но не удаляй без замены.
- WCAG 2.2 добавил **focus appearance** — минимальные требования к толщине и контрасту indicator.

**3. Touch targets.**
- Минимум **44×44 CSS pixels** (WCAG 2.5.5 — AAA, но фактически стандарт).
- WCAG 2.2 добавил **2.5.8 Target Size (Minimum)** — 24×24 для AA.

**4. Keyboard navigation.**
- Всё, что можно сделать мышью, можно сделать клавиатурой.
- Tab-порядок логичен (сверху вниз, слева направо).
- Skip links для навигации.
- Trap focus в modal, release при закрытии.

**5. Screen reader semantic HTML.**
- Правильные heading levels (h1 → h2 → h3, без прыжков).
- Landmarks (`<nav>`, `<main>`, `<aside>`).
- Buttons — `<button>`, не `<div onclick>`.
- Labels у form controls.
- Alt-тексты у изображений (или `alt=""` для декоративных).

**6. Motion sensitivity.**
- Уважать `prefers-reduced-motion` media query.
- Не автовоспроизведение анимаций дольше 5 секунд.
- Не быстрый flashing (более 3× в секунду — риск эпилепсии).

**7. Text sizing.**
- Пользователь должен мочь увеличить текст до 200% без потери функциональности.
- Не абсолютные units (px) — использовать rem/em.
- WCAG 2.2 **1.4.10 Reflow** — работает на 320px без горизонтального скролла.

**8. Colour not sole indicator.**
- Ошибку нельзя указать только красным цветом — плюс иконка и текст.
- Ссылку нельзя выделять только цветом — плюс underline или weight.
- Дальтоники (8% мужчин) вас поблагодарят.

**9. Form labels & errors.**
- Каждое поле — с видимым label.
- Placeholder ≠ label — исчезает при вводе.
- Ошибки: описательно, рядом с полем, ARIA `aria-describedby` для screen readers.
- Errors предотвращать (validation on blur, не после submit).

**10. Language attributes.**
- `<html lang="ru">` — обязательно.
- При переключении языка внутри — `<span lang="en">…</span>`.
- Screen reader выберет правильное произношение.

### Screen readers — что писать

Дизайнер должен думать о том, что услышит VoiceOver / TalkBack.

**Плохо:** просто иконка «×» без label.
**Хорошо:** `<button aria-label="Закрыть диалог">×</button>`.

**Плохо:** декоративная иллюстрация с `alt="hero image"`.
**Хорошо:** `alt=""` — screen reader пропустит, не будет отвлекать.

**Плохо:** taken-out toast «Успех!» — screen reader не увидит.
**Хорошо:** `aria-live="polite"` region, чтобы screen reader зачитал.

**Плохо:** сложная data table без headers.
**Хорошо:** `<th scope="col">`, `<caption>` — screen reader ориентируется.

### Cognitive accessibility

Не только физические ограничения. Cognitive load — часть a11y.

- **Plain language.** Простые слова. Короткие предложения. Один concept за раз.
- **Consistent navigation.** Не переставляй меню между экранами.
- **Error prevention.** Валидируй по ходу, не после отправки.
- **Predictable interactions.** Одинаковые действия — одинаковые последствия.
- **Timing.** Даже базовый WCAG 2.2 требует, чтобы session timeout был настраиваемым и предупреждал.

Cognitive a11y особенно важен в fintech (доверие + сложные концепции) и edtech (учащиеся, особенно с дислексией / ADHD).

### Adaptive UI

- **Dark mode** — не только для эстетики, для light sensitivity.
- **Font sizing** — уважать system font size, не игнорировать.
- **Reduced motion** — уважать пользовательский preference.
- **Colour blind modes** — можно предложить темы (protanopia, deuteranopia).
- **Voice control** — назначать consistent labels, чтобы «нажми на сохранить» работало.

### Юридический baseline

**США.**
- **ADA (Americans with Disabilities Act).** Trickle-down: суды требуют WCAG 2.1 AA для веб-продуктов.
- **Section 508** — для гос-контрактов.
- **COPPA** — для детей до 13, включает privacy + adaptive design.

**ЕС.**
- **EAA (European Accessibility Act) — обязателен с июня 2025.** Финсервисы, e-com, транспорт, цифровые продукты — WCAG 2.1 AA как минимум.
- **GDPR** — не про a11y напрямую, но интерсекция с cognitive.

**Россия.**
- **ГОСТ Р 52872-2019** — accessibility требований, добровольный.
- Для гос-порталов — обязательные требования.

Head должен знать юридический контекст своего продукта и не относиться к a11y как к «когда время будет».

### A11y в дизайн-системе

Правильный подход: a11y-attributes встроены в компоненты, не проверяются вручную.

- **Button** — accessible name (label или aria-label), focus indicator, disabled state.
- **Input** — label association, error message via aria-describedby, required indicator.
- **Modal** — focus trap, escape to close, focus return.
- **Toast** — aria-live, dismissible.
- **Menu** — aria-expanded, keyboard nav (arrow keys).

Если компонент из системы **правильно** реализован — дизайнер не думает про a11y, он думает про UX. Это работа Head'а.

## Ключевые концепции

**A11y — baseline, не extra.** Ставится на этапе definition, не после релиза.

**«Not sole indicator» — ключевое правило.** Никогда не полагайся только на цвет / только на положение / только на звук.

**Screen reader — думай о слепом пользователе, но правило работает и для всех.** Semantic HTML улучшает SEO, keyboard nav помогает power-users, focus indicators — новичкам.

**Cognitive a11y = plain UX.** Простой интерфейс — доступный интерфейс. Сложный — недоступный по определению.

**Тестирование обязательно.** Автоматические (axe, WAVE) ловят 30–40%. Клавиатура + screen reader — остальное. Пользовательское тестирование с людьми с disabilities — золотой стандарт.

**Domain-специфика.**
- **Fintech.** EAA обязательна с 2025. Ошибки в accessibility = регуляторные штрафы.
- **E-com.** ADA-иски по web-accessibility — растущий тренд. Amazon, Domino's судились.
- **Edtech.** COPPA + Section 508 (для школьных контрактов). Дети с disabilities — big user base.

## Типовые вопросы ментора

Услышав «нужно A11y», спрошу:

1. «Целитесь на AA или AAA? По умолчанию — AA обязательный минимум».
2. «Юридический контекст — где продукт живёт?»
3. «Автоматические тесты уже стоят? Axe / Lighthouse?»
4. «Screen reader-тестирование делаете?»
5. «Компонентная система знает про a11y или каждый экран проверяется руками?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задумываешься до релиза — большинство ждёт жалобы».
2. **Диагноз.** «У тебя контраст 3.5:1 в body — WCAG требует 4.5» *(или)* «Custom кнопка без aria-label — screen reader молчит».
3. **Правило.** Конкретное WCAG-требование + число.
4. **Инструмент.** Axe / Stark / WebAIM Contrast Checker.
5. **Юридика (если применимо).** ADA / EAA / COPPA — одна строка.
6. **Системно.** «Если это повторяется — компонент в [design-systems], а не проверяем каждый раз».
7. **Следующий шаг.** «Проверь по WCAG checklist на [webaim.org], потом иди в [design-audit] для полного прохода».

## Ловушки

- **A11y на финал.** Проверяем перед релизом → сплошные переделки → срываем deadline или отпускаем плохо.
- **Только автоматика.** Axe / Lighthouse ловят 30–40%. Screen reader + клавиатура — остальное.
- **Placeholder как label.** Placeholder исчезает при вводе — пользователь забыл, что вводит.
- **Иконка без label.** Дизайнер и разработчик понимают, screen reader — нет.
- **Custom focus «убрал outline».** Focus indicator убран → пользователь клавиатуры потерян.
- **Motion без preference.** Игнор `prefers-reduced-motion` → неврологические реакции у части пользователей.
- **«Мы сделаем позже».** В fintech и edtech — юридический риск.

## Источники

- **W3C.** [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — первоисточник, следи за обновлениями.
- **web.dev.** [Learn Accessibility](https://web.dev/learn/accessibility/) — Google's practical guide, отличный для дизайнеров.
- **Nielsen Norman Group.** [Accessibility articles](https://www.nngroup.com/topic/accessibility/).
- **Deque University.** [dequeuniversity.com](https://dequeuniversity.com/) — платные курсы, ссылки на axe / бесплатный blog.
- **Sara Soueidan.** [sarasoueidan.com/blog](https://www.sarasoueidan.com/blog/) — глубокий inclusive design.
- **A11y Project.** [a11yproject.com](https://www.a11yproject.com/) — checklist, patterns, resources.
- **GOV.UK Design System.** [accessibility docs](https://design-system.service.gov.uk/accessibility/) — образец государственной системы с a11y-focus.
- **Microsoft.** [Inclusive Design Principles](https://inclusive.microsoft.design/).
- **WebAIM.** [Contrast Checker](https://webaim.org/resources/contrastchecker/), [WAVE tool](https://wave.webaim.org/).

## Смежные скилы

- [clean-ui](../clean-ui/SKILL.md) — контраст, focus, spacing
- [editorial-policy](../editorial-policy/SKILL.md) — plain language как cognitive a11y
- [design-systems](../design-systems/SKILL.md) — a11y в компоненты
- [platform-guidelines](../../reference/platform-guidelines/SKILL.md) — WCAG как platform-baseline
- [design-audit](../design-audit/SKILL.md) — a11y-check как часть аудита
