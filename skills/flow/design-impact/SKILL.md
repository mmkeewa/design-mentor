---
name: design-impact
description: Причинный вклад дизайна. До релиза — usability tests, preference tests, эвристики, A/B на прототипах. После релиза — before/after, A/B, изоляция эффекта дизайна от других факторов (сезонность, новизна, внешние события). Head приходит сюда, чтобы отвечать «а что именно дал дизайн», не «мы что-то улучшили».
layer: flow
phase: prototype/measure
update: stable
sources:
  - Jared Spool — ROI of UX. https://articles.uie.com/
  - NN/g — Measuring UX. https://www.nngroup.com/topic/measuring-uxsuccess/
  - Jeff Sauro — measuringu.com. https://measuringu.com/
  - Evan Miller — A/B sample size calculator. https://www.evanmiller.org/ab-testing/sample-size.html
  - Ronny Kohavi — Trustworthy Online Controlled Experiments. https://experimentguide.com/
  - Reforge — Growth Series (A/B testing). https://www.reforge.com/programs
neighbors:
  - product-metrics: metrics — «что сейчас с продуктом»; я — «дизайн ли это дал»
  - ux-research: research — качественные ответы «почему»; я — причинный количественный
  - prototyping: prototyping даёт материал для оценки до релиза; я — сам метод оценки
  - discovery-delivery: я живу в фазах 6 и 8 цикла
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# design-impact

Не «мы улучшили экран, метрики выросли — значит, дизайн работает». Могло быть сезонность, маркетинг, новизна, случайность. **Design-impact** — методология доказать (или опровергнуть), что вклад именно дизайна. Head отвечает за то, чтобы дизайн-команда могла показать причинность, а не корреляцию.

## Когда меня звать

- «Как понять, что наш редизайн сработал?»
- «Метрики выросли, но не уверен, из-за дизайна ли».
- «Как оценить дизайн до релиза, чтобы не выкатывать вслепую?»
- «A/B тест — как ставить, какой размер выборки?»
- «Прототип vs live — что мерить где?»
- «Как защитить ROI дизайна перед CEO?»

## Когда НЕ меня, а соседа

- **Мониторинг метрик как есть** → [product-metrics](../product-metrics/SKILL.md). Я — про причинность.
- **Качественный «почему»** → [ux-research](../ux-research/SKILL.md). Я — про количественный «сколько дал».
- **Изготовление прототипа для оценки** → [prototyping](../prototyping/SKILL.md). Я — про метод оценки на прототипе.
- **Как использовать результаты в разговоре с CPO** → [stakeholder-work](../../ops/stakeholder-work/SKILL.md) + [presentation-skills](../../ops/presentation-skills/SKILL.md).

## Что я умею

### Две стороны оценки

**До релиза (formative evaluation).** Как понять, работает ли до того, как выкатим.
- Usability tests (модерируемые / немодерируемые).
- Preference tests («что понятнее — A или B?»).
- A/B на прототипах.
- Эвристическая оценка (см. [design-audit](../design-audit/SKILL.md)).
- Первый-клик тесты.

**После релиза (summative evaluation).** Что реально дал дизайн в проде.
- A/B test (holdout group).
- Before/after сравнение (осторожно, много bias'а).
- Cohort analysis (когорты до/после в контролируемых условиях).
- Difference-in-differences (если A/B невозможен).

### До релиза — методы

**Usability tests.**
- 5 пользователей на сегмент ловят 85% проблем (Nielsen).
- Успех: task success rate, time-on-task, error count, SUS.
- Модерируемые дают глубину, немодерируемые (Maze / UserTesting) — скорость.

**Preference tests.**
- Показываешь A и B, спрашиваешь: что понятнее / больше нравится / больше доверяешь.
- Не для финального решения — для отсева заведомо слабых вариантов.
- Осторожно: люди говорят одно, ведут себя иначе.

**A/B на прототипах.**
- Maze позволяет запускать 2 версии для 2 групп на прототипе.
- Даёт быстрый signal, но не эквивалент live A/B (нет реальных данных, реальных стейков).

**First-click test.**
- Прототип + задача, куда кликнешь.
- Первый клик правильный → задача обычно решается. Первый клик неправильный → всё пропало.
- 5–8 респондентов достаточно.

### После релиза — методы

**A/B test (gold standard).**
Контрольная группа видит старую версию, экспериментальная — новую. Разница в метрике = вклад дизайна.

**Обязательно:**
- **Гипотеза до старта.** «Мы ожидаем, что новая версия увеличит CR на X%».
- **Sample size рассчитан.** [Evan Miller calculator](https://www.evanmiller.org/ab-testing/sample-size.html) или Optimizely tool. По baseline metric + minimum detectable effect + power (обычно 80%).
- **Randomization** — на уровне пользователя, не сессии.
- **Duration** — минимум 1 бизнес-цикл (обычно неделя), лучше 2. Иначе day-of-week effect искажает.
- **Guardrail metrics** — что не должно упасть (см. [product-metrics](../product-metrics/SKILL.md) safeguard).

**When A/B невозможен:**
- Продукт слишком маленький (мало трафика).
- Регуляторка не позволяет разные версии для разных пользователей.
- Изменение полностью меняет продукт (не сравнить).

Тогда — **before/after** с оговорками (см. ниже).

**Before/after.**
- Сравнение метрики до релиза и после.
- **Опасен bias'ами:** сезонность, маркетинг, новизна, внешние события, сдвиг в аудитории.
- Как страховаться:
  - **Дольше baseline** (3+ месяца до).
  - **Дольше after** (1+ месяц).
  - **Segment comparison** — если возможно, сравни change в целевом сегменте vs control-сегмент.
  - **Novelty effect** — жди 4+ недель после релиза перед выводами.

### Изоляция эффекта дизайна

Метрика улучшилась. Как разложить: сколько дал дизайн, сколько — другие факторы?

**Difference-in-differences (DiD).**
- Наша группа (получила редизайн) vs контроль (нет).
- Метрика до и после у обеих.
- Разница разниц = эффект дизайна.

**Cohort analysis.**
- Когорты пользователей до релиза и после.
- Смотри retention curve по когортам.
- Улучшение retention у новых когорт = вклад дизайна на новых пользователей.

**Segmentation.**
- Метрика по сегментам (heavy users / casual / новички).
- Дизайн влияет на разные сегменты по-разному — часть эффекта видна только в одном.

### Preference vs behavior

**Опасное различие.** Люди говорят одно, делают другое.

- Preference test: «понравился ли редизайн?» — 80% да.
- Live A/B: CR упал на 3%.

Как совмещать: preference + behaviour. Preference — сигнал доверия / удовлетворения; behaviour — реальный результат. Оба важны.

### Как считать ROI дизайна

**Формула для стейкхолдеров:**
```
ROI = (эффект в деньгах — затраты на дизайн) / затраты
```

Где:
- **Эффект в деньгах** = разница в метрике × conversion в деньги.
  - Пример: CR чекаута +2%, AOV = 5000₽, monthly checkouts 100000 → +10М/мес.
- **Затраты** = зарплата команды дизайна × время + инструменты + research.

Head должен уметь эту формулу и не бояться считать. Иначе дизайн-команда — cost centre, не value centre.

## Ключевые концепции

**Correlation ≠ causation.** Метрика улучшилась после релиза дизайна ≠ дизайн улучшил метрику. Нужна изоляция.

**Formative + summative.** Оба типа оценки нужны. Только before-релиз = слепой релиз. Только after = переделываешь в проде.

**Sample size до эксперимента.** Считаешь после — data snooping, false positives.

**Guardrails обязательны.** «Оптимизировали одно» → сломали другое. Guardrails ловят это.

**Novelty effect.** Первые 2–4 недели после релиза метрики двигаются просто потому, что «новое». Не решай по первой неделе.

**A/B — золотой стандарт, но не всегда возможен.** Тогда — DiD, cohort, before/after с оговорками. Хуже, но лучше «на глаз».

**Дизайн-эффект часто immaterialen сразу.** Retention сдвинулся на 2% — это огромно, но не «wow». Умей это защищать.

**Domain-специфика.**
- **Fintech.** A/B на деньгах требует осторожности — тестируй на маленькой доле трафика сначала.
- **E-com.** A/B — базовая практика, много инструментов (Optimizely, Google Optimize, VWO).
- **Edtech.** Циклы обучения долгие — оценивай на когортах по времени, не сессиям.

## Типовые вопросы ментора

Услышав «оценим редизайн», спрошу:

1. «До или после релиза?»
2. «A/B возможен по регуляторике / трафику?»
3. «Sample size посчитан?»
4. «Guardrails есть?»
5. «Хочешь причинность или мониторинг?»
6. «Novelty-window учтён?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задаёшь вопрос про причинность, а не радуешься росту метрики».
2. **Диагноз.** «Ты сравниваешь before/after без контроля — сезонность съест твой эффект».
3. **Метод.** A/B / DiD / cohort / usability test — под задачу.
4. **Sample size + duration.** Конкретно, с ссылкой на calculator.
5. **Guardrails.** Что не должно упасть.
6. **Как защищать.** ROI формула для стейкхолдеров.
7. **Следующий шаг.** «Спроси про [product-metrics] чтобы связать с общими метриками, или про [stakeholder-work] — как защищать».

## Ловушки

- **Before/after без bias-контроля.** Ложные позитивы от сезонности, маркетинга, новизны.
- **Sample size на глаз.** Тест 3 дня, 100 конверсий — не разница, а шум.
- **A/B без гипотезы.** «Просто посмотрим». Обычно потом cherry-pick метрик, где «повезло».
- **Оценка на прототипе как final.** Preference test говорит одно, live — другое.
- **Novelty effect как результат.** Первая неделя показывает +15%, через 4 недели +2%. Реальность — 2%.
- **Ignoring segment effects.** Средний рост 0%, но power-users +5%, casual –3%. Часто это интересно.
- **ROI не считается.** Дизайн — «cost centre», защищать сложно.

## Источники

- **Spool, Jared.** [ROI of UX articles](https://articles.uie.com/) — как считать ROI.
- **NN/g.** [Measuring UX](https://www.nngroup.com/topic/measuring-uxsuccess/) — про методы измерения.
- **Sauro, Jeff.** [measuringu.com](https://measuringu.com/) — deep math UX quant.
- **Miller, Evan.** [A/B sample size calculator](https://www.evanmiller.org/ab-testing/sample-size.html) — обязательный инструмент.
- **Kohavi, Ronny.** [Trustworthy Online Controlled Experiments](https://experimentguide.com/) — практика A/B в масштабе (Microsoft, Amazon).
- **Reforge.** [Growth Series](https://www.reforge.com/programs) — глубокая A/B-практика.

## Смежные скилы

- [product-metrics](../product-metrics/SKILL.md) — мониторинг vs причинность
- [ux-research](../ux-research/SKILL.md) — качественные ответы
- [prototyping](../prototyping/SKILL.md) — прототип для оценки до релиза
- [stakeholder-work](../../ops/stakeholder-work/SKILL.md) — защита ROI
- [discovery-delivery](../../orchestrator/discovery-delivery/SKILL.md) — фазы 6 и 8 цикла
