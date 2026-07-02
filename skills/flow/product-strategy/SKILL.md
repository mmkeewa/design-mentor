---
name: product-strategy
description: Стратегия продукта на горизонте квартала-года. Куда идём, какие ставки делаем, как выбираем opportunity из возможного. Работа выше отдельной задачи. Head приходит сюда, когда команда буксует в тактике «сделаем ещё одну фичу», а движения по продукту нет.
layer: flow
phase: strategy
update: stable
sources:
  - Marty Cagan — Inspired / Empowered. https://www.svpg.com/books/
  - Melissa Perri — Escaping the Build Trap. https://melissaperri.com/book
  - Roger Martin — Playing to Win. https://rogerlmartin.com/playing-to-win/
  - Teresa Torres — Opportunity Solution Tree. https://www.producttalk.org/opportunity-solution-tree/
  - Reforge — Product Strategy Series. https://www.reforge.com/programs
  - Amplitude — North Star Framework. https://amplitude.com/north-star
  - Ravi Mehta — Product Strategy Stack. https://www.ravi-mehta.com/product-strategy/
neighbors:
  - discovery-delivery: оркестратор — я стою над ним, задаю «куда» для каждой итерации цикла
  - product-metrics: metrics ставит North Star и её драйверы; я решаю, какая North Star у продукта в целом
  - stakeholder-work: стратегия защищается перед стейкхолдерами, stakeholder-work — про сам разговор; я — про содержание
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# product-strategy

Стратегия — не роадмап и не список фич. Стратегия — **система выбранных отказов**. Сказал «делаем это» = сказал «не делаем всё остальное». Head отвечает за то, чтобы дизайн-команда работала в русле стратегии, а не в стороне.

## Когда меня звать

- «У нас нет стратегии, только беклог» — команда двигается, но непонятно куда.
- «Все фичи одинаково приоритетны» — верный признак отсутствия стратегии.
- «Нужно защитить план перед CPO/CEO» — как разложить, чтобы поверили.
- «Роадмап рассыпается каждый квартал» — не роадмап рассыпается, отсутствует стратегия под ним.
- «Какой у нас должен быть North Star?»

## Когда НЕ меня, а соседа

- **Как вести конкретную задачу через фазы** → [discovery-delivery](../../orchestrator/discovery-delivery/SKILL.md). Я — уровень выше.
- **Какие метрики мониторить** → [product-metrics](../product-metrics/SKILL.md). Я задаю North Star, product-metrics раскладывает её на драйверы и трекает.
- **Как показать стратегию стейкхолдерам** → [stakeholder-work](../../ops/stakeholder-work/SKILL.md) и [presentation-skills](../../ops/presentation-skills/SKILL.md). Я — про содержание, они — про подачу.
- **Как приоритизировать фичи в спринте** → [design-management](../../ops/design-management/SKILL.md). Я — на горизонте квартал-год, оперативка внутри спринта — не сюда.

## Что я умею

### Три уровня стратегии

**Уровень 1 — Vision (5+ лет).** Куда продукт идёт в мире. Одно предложение, не меняется годами. «Стать банком, которым не надо пользоваться — деньги работают сами».

**Уровень 2 — Strategy (1–3 года).** Ставки, opportunity, playing field. Что выбираем, что отказываемся. Меняется редко, но не «никогда».

**Уровень 3 — Bets и roadmap (квартал).** Конкретные ставки текущего периода, что запускаем. Меняется каждый цикл.

Дизайн-Head должен уметь оперировать всеми тремя, но чаще всего работает на уровне 2 и 3.

### Ключевые фреймворки

**Playing to Win (Roger Martin) — пять вопросов.** Классика для проверки стратегии на прочность:

1. **What is our winning aspiration?** — куда мы стремимся?
2. **Where will we play?** — какой сегмент, домен, география, канал.
3. **How will we win?** — за счёт чего (продукт, цена, дистрибуция, экспириенс)?
4. **What capabilities must be in place?** — что должно быть у нас, чтобы выиграть?
5. **What management systems are required?** — как поддерживать эти capabilities.

Если хотя бы на один вопрос нет чёткого ответа — стратегии нет, есть намерение.

**Opportunity Solution Tree (Teresa Torres).** Ставка → 3–5 opportunity → 2–3 solution под каждой → 1–2 эксперимента под каждой. Дерево удерживает от прыжка в решение.

```
Outcome (North Star)
├── Opportunity A
│   ├── Solution A1 → Experiment
│   └── Solution A2 → Experiment
├── Opportunity B
│   └── Solution B1 → Experiment
└── Opportunity C
    ├── Solution C1 → Experiment
    └── Solution C2 → Experiment
```

**Product Strategy Stack (Ravi Mehta).** 5 слоёв, каждый выше зависит от нижнего:

1. Company mission
2. Company strategy
3. Product vision
4. Product strategy
5. Product roadmap

Если дизайн влияет только на слой 5 — работаешь на тактике. Head должен влиять на слой 4 и участвовать в 3.

**North Star Framework (Amplitude).** Одна метрика, которая ловит value для пользователя и бизнеса одновременно. Обязательные компоненты:

- **North Star Metric** — одна цифра.
- **Input metrics** — 3–5 драйверов, на которые команда может влиять напрямую.
- **Work** — конкретные инициативы под каждый input.

Хорошая North Star: **breadth** (сколько пользователей), **depth** (насколько глубоко используют), **frequency** (как часто) в одной формуле. Плохая: revenue (не показывает, дали ли ценность).

Примеры хороших North Star:
- Spotify: **Time spent listening**.
- Airbnb: **Nights booked**.
- Slack: **Messages sent by paid teams**.

Примеры плохих (антипаттерны):
- «MAU» — плоская метрика без глубины.
- «Revenue» — не про value для пользователя.
- «Number of features shipped» — про output, не outcome.

### Ставки vs фичи

**Ставка** — гипотеза-если-мы-сделаем-Х-то-получим-Y-потому-что-Z. С метрикой, ресурсом, дедлайном.

**Фича** — конкретное исполнение части ставки.

Одна ставка = 2–5 фич. Роадмап на квартал = 2–4 ставки. Больше = размазали фокус.

### Отказы как часть стратегии

Стратегия ≠ длинный список приоритетов. Стратегия = **что мы НЕ делаем в этом периоде**, и это записано. «Мы не делаем крипту в 2026», «Мы не делаем desktop в этом году», «Мы не идём в enterprise-сегмент». Отказы дороже приоритетов, потому что снимают шум.

## Ключевые концепции

**Outcome > Output.** Плохой роадмап: «Q1 — 3 новых экрана в чекауте». Хороший роадмап: «Q1 — увеличить конверсию чекаута с 68% до 74%, ставки: упрощение адресов, гостевой checkout, one-tap оплата». Дизайн шипает outcome.

**Дизайн-команда — не сервис, а участник стратегии.** Head должен быть в комнате, где строится стратегия, а не получать её готовой. Если тебя туда не зовут — это ops-задача (см. [stakeholder-work](../../ops/stakeholder-work/SKILL.md)).

**Стратегия дизайна ≠ стратегия продукта.** Дизайн-стратегия — как дизайн-команда усиливает продуктовую стратегию: где инвестируем в качество, где в скорость, где в исследования, где в систему. Пишется дизайн-Head'ом отдельно.

**Domain-специфика.** Fintech-стратегия ≠ e-com ≠ edtech. В fintech ставки чаще про доверие и cross-sell. В e-com — про конверсию и retention. В edtech — про completion rate и engagement.

## Типовые вопросы ментора

Когда просят «помоги со стратегией», спрошу:

1. «Какой уровень — vision, strategy, quarter bets?»
2. «Какая North Star уже есть? Если есть — покажи, разберём».
3. «Кому защищаешь — CPO, CEO, инвесторам, борду?»
4. «Что уже пробовали делать без стратегии — куда пошло не туда?»
5. «Домен и стадия продукта — раннем продукт (product-market fit ещё ищем) или scale (растим существующий)?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что ты понимаешь разницу между роадмапом и стратегией — 8 из 10 путают».
2. **Диагноз.** «У тебя есть намерения, нет отказов» *(или)* «North Star есть, но не связана с работой команды — Input metrics не сформулированы».
3. **Фреймворк.** Playing to Win / Opportunity Tree / North Star — какой лучше сюда ложится.
4. **2–3 варианта.** «Стратегия как ставки на квартал» vs «как opportunity space на год» vs «как playing field на 2 года».
5. **Следующий шаг.** «Спроси меня про [product-metrics] чтобы разложить North Star на драйверы, или про [stakeholder-work] — как защищать перед CPO».

## Ловушки

- **Роадмап-как-стратегия.** Список фич на 6 кварталов ≠ стратегия. Стратегия — почему именно эти, за счёт чего выиграем, что не делаем.
- **North Star, оторванная от работы.** Если команда не понимает, как её работа двигает NSM — метрика бесполезна. Разложи на 3–5 input metrics с прямым влиянием.
- **Стратегия без отказов.** «Мы фокусируемся на X, Y и Z» ≠ фокус, а размытие. Настоящий фокус: «X — да, Y — нет в этом году».
- **Ставки без метрики.** «Улучшим онбординг» ≠ ставка. Ставка = «Увеличим activation rate на онбординге с 42% до 55% через упрощение до 3 шагов».
- **Копирование чужой стратегии.** «У Spotify NSM — Time spent listening, у нас тоже сделаем». Их domain, их business model, их зрелость. Твоя NSM — своя.
- **Дизайн вне стратегии.** Head в углу, стратегию пишут PM и CPO. Красный флаг: дизайн становится сервисом, не партнёром.

## Источники

- **Cagan, Marty.** *Inspired* и *Empowered* — базовое понимание роли продукта и дизайна на уровне стратегии. [SVPG books](https://www.svpg.com/books/).
- **Perri, Melissa.** *Escaping the Build Trap* — про outcome vs output и стратегию продукта. [melissaperri.com/book](https://melissaperri.com/book).
- **Martin, Roger.** *Playing to Win* — 5 вопросов, до сих пор рабочий фреймворк. [rogerlmartin.com](https://rogerlmartin.com/playing-to-win/).
- **Torres, Teresa.** [Opportunity Solution Tree](https://www.producttalk.org/opportunity-solution-tree/) — про связку outcome → opportunity → solution.
- **Amplitude.** [North Star Framework](https://amplitude.com/north-star) — как построить NSM и input-метрики.
- **Mehta, Ravi.** [Product Strategy Stack](https://www.ravi-mehta.com/product-strategy/) — 5 слоёв, где живёт стратегия продукта.
- **Reforge.** [Product Strategy Series](https://www.reforge.com/programs) — платно, но лучший продвинутый материал.

## Смежные скилы

- [discovery-delivery](../../orchestrator/discovery-delivery/SKILL.md) — оркестратор цикла под стратегией
- [product-metrics](../product-metrics/SKILL.md) — North Star и её input-метрики
- [ux-research](../ux-research/SKILL.md) — как валидировать стратегические гипотезы
- [stakeholder-work](../../ops/stakeholder-work/SKILL.md) — защита стратегии
- [presentation-skills](../../ops/presentation-skills/SKILL.md) — упаковка стратегии в питч
