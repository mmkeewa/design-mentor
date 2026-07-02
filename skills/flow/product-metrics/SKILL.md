---
name: product-metrics
description: Мониторинг продуктовых и UX-метрик. North Star, AARRR, HEART, retention, CR по шагам воронки, time-to-value, CSI/CSAT/NPS, SUS, task success. Для домена — approval rate, KYC drop-off, cost-to-serve (fintech), корзина/чекаут-CR (e-com), completion rate (edtech). Связки бизнес → продукт → UX → интерфейс.
layer: flow
phase: discovery/measure
update: stable
sources:
  - Amplitude — North Star Framework. https://amplitude.com/north-star
  - Google — HEART Framework paper. https://research.google/pubs/measuring-the-user-experience-on-a-large-scale-user-centered-metrics-for-web-applications/
  - Dave McClure — AARRR / Pirate Metrics. https://500hats.typepad.com/500blogs/2007/09/startup-metrics.html
  - Sean Ellis — North Star Playbook. https://amplitude.com/blog/north-star-metric
  - Reforge — Retention Series. https://www.reforge.com/programs
  - System Usability Scale (SUS). https://www.usability.gov/how-to-and-tools/methods/system-usability-scale.html
  - Baymard Institute — E-commerce benchmarks. https://baymard.com/lists/cart-abandonment-rate
neighbors:
  - product-strategy: strategy задаёт North Star; я — раскладываю на драйверы и слежу
  - design-impact: design-impact — «дизайн ли это дал»; я — «что сейчас с продуктом»
  - ux-research: research — качественный сбор для understand; я — количественный мониторинг для watch
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# product-metrics

Метрики — не отчёт для CEO, а инструмент решений. Head отвечает за то, чтобы у дизайн-команды была ясная связка «моя работа → эта метрика → эта бизнес-цель». Без этого дизайн становится «красиво» вместо «работает».

## Когда меня звать

- «Какую метрику ставить на этот проект/эксперимент?»
- «Как связать мою работу с бизнесом?»
- «У нас нет North Star, надо построить».
- «HEART / AARRR / что-то другое — что применить?»
- «CR упал на N% — что случилось?»
- «Как понять, что переделка сработала?»

## Когда НЕ меня, а соседа

- **Причинный вклад дизайна** (before/after, изоляция эффекта, A/B до релиза) → [design-impact](../design-impact/SKILL.md). Я — мониторинг, они — атрибуция.
- **Сбор качественных данных** (почему это происходит) → [ux-research](../ux-research/SKILL.md). Я — что и сколько, research — почему.
- **North Star на уровне стратегии продукта** → [product-strategy](../product-strategy/SKILL.md). Я — раскладываю и трекаю; strategy — выбирает.
- **Метрики команды дизайна** (delivery velocity, throughput) → [design-ops](../../ops/design-ops/SKILL.md).

## Что я умею

### Иерархия метрик

Всегда четыре уровня — сверху вниз:

```
Бизнес-цель          ← «зачем компания существует»
  ↓
Продуктовая метрика   ← «как продукт даёт value»
  ↓
UX-метрика            ← «как опыт помогает или мешает»
  ↓
Метрика интерфейса    ← «что происходит на конкретном экране»
```

Если между уровнями нет связки — метрика подвешена. Head должен уметь пройти вверх и вниз по цепочке в разговоре с любым стейкхолдером.

**Пример (fintech-депозиты):**
- Бизнес: **рост AUM** (assets under management).
- Продукт: **share of wallet** от активных клиентов.
- UX: **conversion rate открытия депозита** от захода в раздел.
- Интерфейс: **completion rate калькулятора** и **tap-to-open rate** на карточке.

Если UX-метрика улучшилась, а бизнес не двинулся — либо влияние слабое, либо цепочка неправильная.

### Ключевые фреймворки

**North Star Framework (Amplitude).** См. [product-strategy](../product-strategy/SKILL.md). Здесь моё дело — раскладывать NSM на **3–5 input metrics** и следить.

Input metric — метрика, на которую команда влияет прямо, и она двигает NSM.

Пример:
- NSM: **weekly active teams sending messages** (Slack-like).
- Input 1: activation — новая команда прошла до 3 отправленных сообщений в первый день.
- Input 2: engagement — average channels per active user.
- Input 3: retention — WAU / MAU ratio.
- Input 4: acquisition — sign-ups from referral.

**AARRR / Pirate Metrics (Dave McClure).** Воронка жизни пользователя:

- **Acquisition** — как узнал.
- **Activation** — первый ценный опыт.
- **Retention** — вернулся ли.
- **Referral** — привёл ли кого-то.
- **Revenue** — заплатил ли.

Хорош для ранних стадий продукта. Даёт понимание, где отваливаются пользователи. Дизайн влияет прежде всего на **activation** и **retention**, косвенно на остальные.

**HEART (Google).** UX-специфичный фреймворк:

- **Happiness** — SUS / CSAT / NPS.
- **Engagement** — как активно используют (sessions, actions per session).
- **Adoption** — сколько дошли до фичи.
- **Retention** — вернулись ли.
- **Task success** — доля успешных задач.

Для каждой буквы — Goal, Signal, Metric (G-S-M). Google Paper по [Kerry Rodden](https://research.google/pubs/measuring-the-user-experience-on-a-large-scale-user-centered-metrics-for-web-applications/) — 5 страниц, до сих пор актуальны.

**Retention как основа.** Reforge: единственная метрика, которая коррелирует с выживанием продукта — **retention**. Не acquisition, не revenue. Retention curve по когортам — самый честный индикатор product-market fit.

Виды retention:
- **N-day retention** — вернулся ли на день N.
- **Rolling retention** — вернулся ли хотя бы раз до дня N.
- **Bracket retention** — вернулся ли в интервале.

Смотри retention curve, а не «MAU». MAU может расти за счёт acquisition при плохом retention — иллюзия здоровья.

### UX-специфичные метрики

**System Usability Scale (SUS).** 10 вопросов, шкала 0–100. Опросник после юзабилити-теста. 68+ = «хорошо», 80+ = «отлично». Простой и работает 40 лет.

**CSAT (Customer Satisfaction Score).** «Насколько вы удовлетворены?», 1–5. Быстрый пульс.

**NPS (Net Promoter Score).** «Порекомендуете ли?», 0–10. Промоутеры (9–10) минус детракторы (0–6). Много критики, но всё ещё стандарт. Плохо работает на ранних стадиях (маленькая база, шум).

**Task success rate.** Доля пользователей, которые выполнили задачу целиком. Меряется в юзабилити-тестах, но и в аналитике: доля users, кто дошёл от старта до цели.

**Time-on-task.** Медиана времени на задачу. Смотри тренд, а не абсолютную цифру.

**Error rate.** Доля попыток с ошибкой. Особенно важно в fintech.

### Domain-специфика

**Fintech.**
- **Approval rate** — % одобренных заявок.
- **KYC drop-off** — % отвалившихся на верификации.
- **Payment success rate** — % успешных транзакций.
- **Claim rate** — сколько обращений в поддержку на 1000 транзакций.
- **Cost-to-serve** — сколько стоит обслужить одного клиента (влияет дизайн через self-service).
- **LTV/CAC** — про юнит-экономику.

**E-com.**
- **Cart abandonment rate** — базовый бенчмарк ~70% ([Baymard](https://baymard.com/lists/cart-abandonment-rate)), меньше = хорошо.
- **Checkout CR** — % от старта чекаута до заказа.
- **CR по шагам воронки** — где именно теряешь.
- **AOV (Average Order Value)** — средний чек.
- **Search-to-conversion** — % поисков, завершившихся покупкой.
- **Return rate** — % возвратов; часто UX-проблема (плохие фото, размерные сетки).

**Edtech.**
- **Course completion rate** — % дошедших до конца.
- **Time-to-first-value** — сколько до первого «я что-то узнал/сделал».
- **Streak retention** — вернулся ли по расписанию.
- **Assessment pass rate** — % успешно прошедших тесты.
- **DAU/MAU** — но осторожно: для длительного обучения DAU может быть низкой by design.

### Ставим метрику на проект

Каждый design-проект — метрика **до** старта, письменно:

```
Целевая метрика: [что мерим]
Baseline: [текущее значение]
Target: [к чему стремимся]
Метрика safeguard: [что не должно упасть]
Как считаем: [формула, источник данных]
Через сколько смотрим: [дедлайн]
```

**Safeguard** обязателен. Иначе рискуешь оптимизировать одно за счёт другого. Пример: улучшили CR чекаута → упал AOV, потому что убрали upsell. Метрика safeguard: AOV не должно упасть больше 2%.

## Ключевые концепции

**Vanity metrics.** MAU, page views, downloads без контекста — плоские числа. Растут даже когда продукт хиреет. Игнорируй в решениях.

**Actionable metric.** Метрика, на которую можно повлиять и видно, что именно двигает её. Retention по онбординг-когорте vs общая — первая actionable, вторая нет.

**Ratio > absolute.** Проценты и отношения врут меньше, чем абсолютные числа. «CR = 68%» устойчивее, чем «1240 заказов за неделю».

**Segment > average.** Средний retention может быть 40%, но в power-users — 85%, в casual — 12%. Смотри срезы.

**Leading vs lagging.** Leading — прогнозная, быстрая (activation в первый день). Lagging — итоговая, медленная (retention 30 дней). Balance: leading для быстрой обратной связи, lagging для истины.

**Novelty effect.** После релиза метрики двигаются просто потому, что «новое». Смотри стабильность через 2–4 недели, не сразу.

## Типовые вопросы ментора

Услышав «какую метрику ставить», спрошу:

1. «Что это в цепочке — бизнес, продукт, UX или интерфейс?»
2. «На что она влияет вверх и что двигает вниз?»
3. «Метрика safeguard есть?»
4. «Domain — fintech / e-com / edtech / другое?»
5. «На каком горизонте смотрим — leading или lagging?»
6. «Что уже пробовали и не получилось — почему?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что ты сразу спрашиваешь про метрику, а не после релиза — так почти никто не делает».
2. **Диагноз.** «У тебя vanity metric» *(или)* «Ты меряешь UX без связки с бизнесом» *(или)* «Метрика есть, safeguard нет — рискуешь оптимизировать за счёт чего-то важного».
3. **Фреймворк.** HEART / AARRR / North Star + input — какой сюда.
4. **Конкретная метрика.** С формулой и источником данных.
5. **Safeguard.** Что не должно упасть.
6. **Куда дальше.** «Для причинности — иди в [design-impact], для качественных инсайтов — в [ux-research]».

## Ловушки

- **Метрика после релиза.** Ставишь метрику потом → выбираешь ту, которая красиво выглядит. Ставь до.
- **NSM = revenue.** Revenue — не value для пользователя. Ищи метрику ценности.
- **Одна метрика.** North Star без input metrics = недостижимая. Разложи на 3–5 драйверов.
- **Метрика без safeguard.** Оптимизировал CR → упал AOV → бизнес плачет.
- **Игнор сегментов.** Смотришь только средние. Power-users и casual ведут себя по-разному, оптимизация под средних бьёт по обоим.
- **Vanity metrics.** MAU, downloads, page views — приятно смотреть, бесполезно решать.
- **A/B без power analysis.** «Запустили тест, вроде разница есть». Считай sample size заранее, иначе шум примешь за сигнал.

## Источники

- **Amplitude.** [North Star Framework](https://amplitude.com/north-star) — полный playbook.
- **Google.** [HEART paper (Kerry Rodden)](https://research.google/pubs/measuring-the-user-experience-on-a-large-scale-user-centered-metrics-for-web-applications/) — 5 страниц, must-read.
- **McClure, Dave.** [AARRR — Pirate Metrics](https://500hats.typepad.com/500blogs/2007/09/startup-metrics.html).
- **Reforge.** [Retention Series](https://www.reforge.com/programs) — про retention curves и когорты.
- **Baymard Institute.** [E-commerce benchmarks](https://baymard.com/lists/cart-abandonment-rate) — количественные ориентиры для e-com.
- **usability.gov.** [System Usability Scale](https://www.usability.gov/how-to-and-tools/methods/system-usability-scale.html) — сам опросник и инструкция.
- **measuringu.com.** [Jeff Sauro's blog](https://measuringu.com/) — глубокая математика UX-квант.

## Смежные скилы

- [product-strategy](../product-strategy/SKILL.md) — задаёт North Star
- [design-impact](../design-impact/SKILL.md) — причинность vs мониторинг
- [ux-research](../ux-research/SKILL.md) — качественные ответы на «почему»
- [discovery-delivery](../../orchestrator/discovery-delivery/SKILL.md) — метрика ставится в фазе 2, смотрим в фазе 8
