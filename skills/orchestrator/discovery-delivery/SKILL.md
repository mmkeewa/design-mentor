---
name: discovery-delivery
description: Роутер над flow-слоем — решает, какой скил сейчас нужен в цикле от strategy до measure. Не отдельная тема, а карта, по которой ментор ведёт задачу через фазы. Позови когда непонятно, с чего начать, или как связать этапы между собой.
layer: orchestrator
phase: cross-cutting
update: stable
sources:
  - Marty Cagan — Inspired / Empowered (SVPG). https://www.svpg.com/books/
  - Teresa Torres — Continuous Discovery Habits. https://www.producttalk.org/continuous-discovery-habits-book/
  - Jeff Patton — User Story Mapping. https://www.jpattonassociates.com/user-story-mapping/
  - Melissa Perri — Escaping the Build Trap. https://melissaperri.com/book
  - Marty Cagan — Discovery vs Delivery. https://www.svpg.com/discovery-vs-delivery/
neighbors:
  - product-strategy: strategy стоит выше меня — она про «куда идём»; я — про «как ведём каждую задачу от идеи до эффекта»
  - ux-research: research — фаза внутри моего цикла (discovery); я маршрутизирую, когда именно её звать
  - product-metrics: metrics — фаза внутри цикла (measure); я решаю, когда пора смотреть цифры
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# discovery-delivery

Это **оркестратор**, а не рядовой скил. Я — карта, по которой ментор ведёт любую продуктовую задачу от постановки до постаналитики. Внутри меня — восемь фаз, каждая ссылается на свой скил во flow-слое. Я не решаю задачу — я решаю **какой скил сейчас звать**.

## Когда меня звать

- «Не знаю с чего начать» — приходит бриф или проблема, но не понимаешь, это discovery, стратегия или сразу дизайн.
- «Застрял между этапами» — сделал ресёрч, но не переходишь к идеям; нарисовал экраны, но не отдал в разработку.
- «Пропустили фазу и это стреляет» — вылезли метрики, а метрику никто не заложил на старте; или дизайн готов, а никто не подумал про handoff.
- «Как это всё связать» — есть куски (интервью, макеты, метрики), но нет цикла.

## Когда НЕ меня, а соседа

- **Стратегия продукта на год** (ставки, opportunity space, opportunity mapping) → [product-strategy](../../flow/product-strategy/SKILL.md). Я живу ниже — на уровне отдельной задачи или фичи внутри стратегии.
- **Конкретный research-метод** (какой тип интервью, как считать выборку) → [ux-research](../../flow/ux-research/SKILL.md).
- **Какую метрику ставить** → [product-metrics](../../flow/product-metrics/SKILL.md).
- **Крафт экрана** → [clean-ui](../../flow/clean-ui/SKILL.md).

## Что я умею — восемь фаз цикла

Цикл идёт слева направо, но не жёстко — можно возвращаться, пропускать (осознанно), и запускать параллельные ветки. Каждая фаза → свой скил.

| # | Фаза | Что делаем | Основной скил | На выходе |
|---|---|---|---|---|
| 1 | **Strategy** | Куда идём как продукт, какая ставка | [product-strategy](../../flow/product-strategy/SKILL.md) | Ставка, opportunity, North Star |
| 2 | **Discovery** | Кто пользователи, какие боли, что уже делали | [ux-research](../../flow/ux-research/SKILL.md) + [product-metrics](../../flow/product-metrics/SKILL.md) *(целевая метрика)* | Инсайты, гипотезы, целевая метрика |
| 3 | **Ideation** | Веер решений — не первое, что пришло в голову | [creativity-ideation](../../flow/creativity-ideation/SKILL.md) | 3–7 концепций |
| 4 | **Definition** | Скелет: user flow, IA, состояния | [user-flows-journeys](../../flow/user-flows-journeys/SKILL.md) | Sitemap, flows, wireframes |
| 5 | **Design** | Крафт | [clean-ui](../../flow/clean-ui/SKILL.md), [design-systems](../../flow/design-systems/SKILL.md), [multi-platform](../../flow/multi-platform/SKILL.md), [editorial-policy](../../flow/editorial-policy/SKILL.md), [accessibility](../../flow/accessibility/SKILL.md), [ai-in-design](../../flow/ai-in-design/SKILL.md) | Финальные экраны + спека |
| 6 | **Prototype / Validate** | Проверить до кода | [prototyping](../../flow/prototyping/SKILL.md) + [design-impact](../../flow/design-impact/SKILL.md) | Валидированное решение |
| 7 | **Delivery** | Дизайн → разработка → релиз | [handoff-dev-collab](../../flow/handoff-dev-collab/SKILL.md) + [design-audit](../../flow/design-audit/SKILL.md) | Живая фича в проде |
| 8 | **Measure** | Что дала работа — цифрами | [product-metrics](../../flow/product-metrics/SKILL.md) + [design-impact](../../flow/design-impact/SKILL.md) | Постаналитика, выводы, next bet |

## Ключевые концепции

**Discovery ≠ Delivery, но одна команда.** Discovery генерирует и валидирует гипотезы; Delivery воплощает выбранное. Marty Cagan: dual-track — обе дорожки идут параллельно, а не последовательно. Head должен уметь одновременно вести delivery по прошлой гипотезе и discovery по следующей. Ошибка новичков — «сначала полгода discovery, потом полгода delivery», и обе фазы теряют качество.

**Continuous discovery.** Teresa Torres: минимум одно интервью с пользователем в неделю, каждый product-trio (PM/design/eng). Discovery — не проект, а привычка. Если приходит бриф «делай», а команда не разговаривала с пользователями два месяца — красный флаг, возвращайся в фазу 2.

**Opportunity → Solution tree.** Не «есть проблема — есть решение», а «есть outcome → 3-5 opportunities → под каждой 2-3 solutions → под каждым 1-2 эксперимента». Дерево удерживает от прыжка в решение до понимания opportunity.

**Домен-линза.** Если работаешь в fintech / e-com / edtech — накладывай [fintech-ux](../../domain/fintech-ux/SKILL.md) / [ecom-ux](../../domain/ecom-ux/SKILL.md) / [edtech-ux](../../domain/edtech-ux/SKILL.md) поверх каждой фазы. Не решай задачу «в вакууме».

## Типовые вопросы ментора

Первое, что спрошу, услышав задачу:

1. «В какой фазе ты сейчас — стратегия, исследование, идея, дизайн, отдача в разработку или уже смотрим метрики?»
2. «Что уже сделано, а что нет?» — часто вылезает, что пропустили фазу.
3. «Какой outcome ты хочешь получить — по цифре или по опыту?» — если не сформулирован, вернёмся в strategy/discovery.
4. «Домен?» — fintech / e-com / edtech меняет как всю работу вести.

## Как ментор отвечает (шаблон)

1. **Похвала по делу.** Найди, что сделано хорошо в постановке. Пример: «Хорошо, что ты сразу назвал outcome, а не фичу — половина людей заходит с решением».
2. **Диагноз.** «Ты в фазе definition, но пропустил discovery — нет данных, на чём базироваться» *(или)* «Ты в delivery, но фаза measure не запланирована — как поймёшь, что взлетело?».
3. **Куда идти.** Назови нужный скил и что там взять. Не читай его лекцию — переведи туда.
4. **2–3 варианта.** Если фаз можно вести по-разному — покажи опции («сделать focused discovery на 2 недели vs continuous discovery как процесс»).
5. **Следующий шаг.** «Спроси меня про [следующая фаза] или сразу пиши в [скил] — там продолжим».

## Ловушки

- **Прыжок в дизайн без discovery.** «Уже понятно, что надо делать» — почти всегда неправда. Возвращаемся к phase 2, минимум 3–5 интервью.
- **Пропущенная metric.** Если фаза 2 закрылась без целевой метрики — фаза 8 будет «мы что-то запустили, вроде норм». Требуй метрику до идеации.
- **Discovery как отписка.** Одно интервью «для галочки» ≠ discovery. Continuous discovery = регулярно, минимум weekly.
- **Delivery без design-audit.** Экраны отданы разработчику — не значит, что готовы. Фаза 7 включает audit финального билда.
- **Идеализация цикла.** В реальности задачи скачут между фазами, ты можешь быть в двух одновременно (dual-track). Цикл — карта, а не жёсткий процесс.

## Источники

- **Cagan, Marty.** *Inspired* и *Empowered* — базовое понимание продукт-менеджмента и роли дизайна в нём. [SVPG books](https://www.svpg.com/books/).
- **Torres, Teresa.** *Continuous Discovery Habits* — про еженедельные интервью, opportunity solution tree. [Product Talk](https://www.producttalk.org/continuous-discovery-habits-book/).
- **Patton, Jeff.** *User Story Mapping* — как разложить delivery на срезы. [jpattonassociates.com](https://www.jpattonassociates.com/user-story-mapping/).
- **Perri, Melissa.** *Escaping the Build Trap* — про outcome-driven вместо output-driven. [melissaperri.com/book](https://melissaperri.com/book).
- **Cagan, Marty.** [«Discovery vs Delivery»](https://www.svpg.com/discovery-vs-delivery/) — короткий пост с чёткой разводкой понятий.

## Смежные скилы

- [product-strategy](../../flow/product-strategy/SKILL.md) — фаза 1
- [ux-research](../../flow/ux-research/SKILL.md) — фаза 2
- [product-metrics](../../flow/product-metrics/SKILL.md) — фазы 2 и 8
- [creativity-ideation](../../flow/creativity-ideation/SKILL.md) — фаза 3
- [user-flows-journeys](../../flow/user-flows-journeys/SKILL.md) — фаза 4
- [prototyping](../../flow/prototyping/SKILL.md) — фаза 6
- [design-impact](../../flow/design-impact/SKILL.md) — фазы 6 и 8
- [handoff-dev-collab](../../flow/handoff-dev-collab/SKILL.md) — фаза 7
- [design-audit](../../flow/design-audit/SKILL.md) — фаза 7
