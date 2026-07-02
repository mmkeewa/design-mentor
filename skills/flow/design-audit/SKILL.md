---
name: design-audit
description: Систематический разбор живого продукта. Находишь разрывы в логике, навигации, CTA, визуальной консистентности, a11y. Формулируешь findings с приоритетом и гипотезой улучшения. Nielsen 10 heuristics, Baymard, cognitive walkthrough. Head приходит сюда для приёмки, аудита конкурентов, review своего продукта.
layer: flow
phase: delivery
update: stable
sources:
  - Nielsen Norman Group — 10 Heuristics. https://www.nngroup.com/articles/ten-usability-heuristics/
  - Baymard Institute — UX audits. https://baymard.com/
  - Steve Krug — Don't Make Me Think. https://sensible.com/dont-make-me-think/
  - Nielsen — Cognitive Walkthrough. https://www.nngroup.com/articles/cognitive-walkthrough/
  - NN/g — Heuristic Evaluation. https://www.nngroup.com/articles/how-to-conduct-a-heuristic-evaluation/
  - WCAG 2.2 checklist. https://www.w3.org/WAI/WCAG22/quickref/
neighbors:
  - handoff-dev-collab: handoff — доведение до продакшна; я — проверка после
  - accessibility: a11y-check — часть аудита; они — правила, я — применение к продукту
  - editorial-policy: text-audit — часть аудита; они — правила, я — применение
  - clean-ui: clean-ui-issues — часть аудита; они — как крафтить, я — как найти где сломано
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# design-audit

Аудит — не «пробежался, ткнул пальцем в плохое». Систематическая работа по чек-листу, с приоритезацией findings и гипотезами улучшения. Head приходит сюда, чтобы приёмка не была субъективной и репутационные вопросы («а мне не нравится тут») превращались в actionable list.

## Когда меня звать

- «Нужен аудит продукта перед релизом / после».
- «Аудит конкурентов — как структурировано».
- «Приёмка от разработчиков — что проверять».
- «Как разложить findings по приоритетам?»
- «Ежеквартальный design review своего продукта».
- «Юнит-аудит одной фичи».

## Когда НЕ меня, а соседа

- **Правила крафта одного экрана** → [clean-ui](../clean-ui/SKILL.md).
- **WCAG-правила** → [accessibility](../accessibility/SKILL.md).
- **Voice-guide** → [editorial-policy](../editorial-policy/SKILL.md).
- **Тесты с пользователями** → [ux-research](../ux-research/SKILL.md).
- **Handoff приёмка** → [handoff-dev-collab](../handoff-dev-collab/SKILL.md).

## Что я умею

### Три типа аудита

**1. Heuristic evaluation.** По чек-листу (обычно Nielsen 10). 1–3 эксперта проходят продукт, ищут нарушения. Не про пользователей — про правила.

**2. Cognitive walkthrough.** Один эксперт проходит конкретные user tasks, отвечая на 4 вопроса: (1) попытается ли пользователь сделать правильное действие? (2) заметит ли элемент управления? (3) поймёт ли, что это то? (4) получит ли feedback?

**3. Comparative audit.** Наш продукт vs 3–5 конкурентов по одинаковому чек-листу. Показывает gaps.

Head выбирает под цель: приёмка → heuristic, новая фича → cognitive walkthrough, стратегический разговор → comparative.

### Nielsen 10 Heuristics — базовый чек-лист

1. **Visibility of system status** — пользователь всегда знает, что происходит.
2. **Match between system and real world** — язык пользователя, не системы.
3. **User control and freedom** — undo, cancel, back.
4. **Consistency and standards** — одинаковое одинаково.
5. **Error prevention** — предотвращаем, не ловим.
6. **Recognition rather than recall** — видимое лучше запоминаемого.
7. **Flexibility and efficiency of use** — новичкам просто, power-users быстро.
8. **Aesthetic and minimalist design** — только необходимое.
9. **Help users recognize, diagnose, and recover from errors** — понятная ошибка + путь дальше.
10. **Help and documentation** — есть и findable.

Каждая эвристика = вопрос к каждому экрану.

### Дополнительные слои аудита

К Nielsen-10 добавляем:

**Accessibility (WCAG 2.2 AA).**
- Контраст 4.5:1 body.
- Focus visible.
- Touch targets 44×44.
- Keyboard nav.
- Screen reader semantic.

**Editorial.**
- Voice-guide compliance.
- Plain language.
- Buttons — verb+object.
- Empty states — value + action.
- Errors — что случилось + что делать.

**Consistency.**
- Компоненты из системы, не re-invention.
- Токены везде.
- Иконки из одного набора.
- Копирайтинг единый.

**Performance.**
- Loading states где нужны.
- Skeleton screens вместо spinner'ов.
- Perceived latency оптимизирован.

**Flow.**
- CTA один primary на экран.
- Undo возможен где нужен.
- Обратный путь очевиден.
- Ошибочные пути обрабатываются.

### Приоритезация findings

Не «список 50 проблем». Приоритет по формуле:

```
Priority = Severity × Frequency
```

**Severity (1–3):**
1. Косметика.
2. Ухудшает опыт, но не блокирует.
3. Блокирует задачу или создаёт риск.

**Frequency (1–3):**
1. Редко (edge case).
2. Часто (регулярный сценарий).
3. Всегда (main flow).

**P1 (Critical) = 3×3.** Чинить до релиза.
**P2 (Major) = 2×3 или 3×2.** В ближайший спринт.
**P3 (Minor) = 2×2 или ниже.** В backlog.
**P4 (Cosmetic).** Никогда без свободного времени.

Findings без приоритета = мёртвый список.

### Формулировка finding'а

```
[Priority] Название finding'а
Что: [где именно, скриншот]
Проблема: [Nielsen-heuristic + что нарушено]
Impact: [на что влияет — задача / a11y / trust / conversion]
Рекомендация: [гипотеза улучшения, конкретно]
Ссылка: [гайд, компонент из системы, паттерн]
```

Пример:

```
[P2] Кнопка «Оплатить» не показывает loading state
Что: экран /checkout, шаг 3 (скриншот)
Проблема: Nielsen #1 Visibility of system status — пользователь
не знает, что клик обработан. Может кликнуть повторно → двойное
списание.
Impact: fintech risk (двойные транзакции), поддержка (жалобы),
доверие.
Рекомендация: Loading state 200-500 ms + disabled кнопки после
клика. Использовать компонент Button/Primary/Loading из системы.
Ссылка: DS/Button v2.3, состояние Loading.
```

### Comparative audit

Наш vs конкуренты по единой матрице:

```
| Критерий              | Мы  | Конк 1 | Конк 2 | Конк 3 |
|-----------------------|-----|--------|--------|--------|
| Onboarding CR         | 45% | 62%    | 58%    | 71%    |
| KYC drop-off          | 22% | 15%    | 18%    | 12%    |
| Time-to-first-payment | 3d  | 1d     | 2d     | 4h     |
| Trust patterns        | 3/7 | 5/7    | 7/7    | 6/7    |
```

Findings из comparative → strategic input в [product-strategy](../product-strategy/SKILL.md).

### Как проводить аудит

**Одиночный (эксперт-аудит).**
- 4–8 часов на средний продукт.
- Пройти основные flows + edge cases.
- Скриншот + анотация каждого finding.
- Приоритезация в конце.

**Групповой (3 эксперта independent).**
- Каждый проводит один → потом соединяют.
- Ловят 75%+ проблем (vs 30–40% одиночного).
- Дорого.

**Дневниковый.**
- Аудитор использует продукт 1–2 недели как реальный пользователь.
- Ведёт дневник впечатлений.
- Ловит issues, которые в одноразовом обзоре пропускаются (raviness, retention issues).

## Ключевые концепции

**Аудит по чек-листу, не по вкусу.** «Мне не нравится» ≠ finding. «Nielsen #7 нарушен — вот как» = finding.

**Findings ≠ решения.** Аудит показывает **проблему** + **гипотезу**. Решение — отдельная работа с командой.

**Приоритеты обязательны.** Без них список не работает, все проблемы кажутся одинаковыми.

**Аудит регулярно.** Не «раз в год большой». Мини-аудит одной фичи после каждого релиза + большой раз в квартал.

**Comparative — стратегический инструмент.** Не «мы хуже», а «у конкурентов такой паттерн, надо взять / не брать».

**Domain-специфика.**
- **Fintech.** Nielsen-10 + доверие / статусы платежей / регуляторные тексты / error recovery в деньгах.
- **E-com.** Nielsen-10 + Baymard checklist checkout/product/search.
- **Edtech.** Nielsen-10 + cognitive load / progress feedback / motivation.

## Типовые вопросы ментора

Услышав «нужен аудит», спрошу:

1. «Аудит чего — приёмка, конкуренты, свой продукт, юнит одной фичи?»
2. «Чек-лист — Nielsen-10 + что ещё для домена?»
3. «Приоритезация по какой формуле?»
4. «Кто аудитор — один или несколько?»
5. «Что делаете с findings — просто список или action plan?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что делаешь аудит по чек-листу, а не по вкусу».
2. **Диагноз.** «У тебя findings без приоритета — команда не поймёт, что делать» *(или)* «Nielsen-10 без a11y — пропускаешь юридический слой».
3. **Метод.** Heuristic / cognitive walkthrough / comparative — какой сюда.
4. **Чек-лист.** Nielsen + domain-специфика + a11y + editorial + consistency.
5. **Формат findings.** Шаблон с приоритезацией.
6. **Следующий шаг.** «Спроси про [design-impact], как связать findings с эффектом, или про [handoff-dev-collab] если это приёмка».

## Ловушки

- **Аудит по вкусу.** «Мне не нравится» ≠ finding. Ссылайся на heuristic.
- **50 findings без приоритета.** Команда не знает, куда бросаться.
- **Только Nielsen без domain-слоя.** Fintech аудит без regulatory checks — упустил половину.
- **Однократный аудит.** Раз в год не работает. Регулярность важна.
- **Аудит без action plan.** Собрали, показали, никто не взял в работу.
- **Только эстетика.** Аудит про красоту, не про flow / a11y / regulatory / trust.
- **Comparative без критериев.** «Мы просто смотрим, что у них» — субъективно.

## Источники

- **NN/g.** [10 Heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/) — must-know.
- **NN/g.** [How to Conduct a Heuristic Evaluation](https://www.nngroup.com/articles/how-to-conduct-a-heuristic-evaluation/) — практика.
- **NN/g.** [Cognitive Walkthrough](https://www.nngroup.com/articles/cognitive-walkthrough/).
- **Baymard Institute.** [baymard.com](https://baymard.com/) — глубокая для e-com, huge checklist.
- **Krug, Steve.** *Don't Make Me Think* — ментальные основы аудита.
- **W3C.** [WCAG 2.2 Quickref](https://www.w3.org/WAI/WCAG22/quickref/) — checklist for a11y.

## Смежные скилы

- [handoff-dev-collab](../handoff-dev-collab/SKILL.md) — приёмка как форма аудита
- [accessibility](../accessibility/SKILL.md) — a11y-слой аудита
- [editorial-policy](../editorial-policy/SKILL.md) — text-слой аудита
- [clean-ui](../clean-ui/SKILL.md) — где сломан крафт
- [design-impact](../design-impact/SKILL.md) — что даст исправление findings
