---
name: user-flows-journeys
description: Скелет продукта до крафта. CJM, user flow, IA, sitemap, wireframes, состояния экранов (empty / loading / error / success / edge). Head приходит сюда, когда команда идёт в дизайн-крафт до того, как разложила логику.
layer: flow
phase: definition
update: stable
sources:
  - Kim Goodwin — Designing for the Digital Age. https://www.goodwin.studio/book
  - Nielsen Norman Group — Journey Mapping. https://www.nngroup.com/articles/journey-mapping-101/
  - Donna Spencer — Card Sorting. https://rosenfeldmedia.com/books/card-sorting/
  - Jeff Patton — User Story Mapping. https://www.jpattonassociates.com/user-story-mapping/
  - Adaptive Path — Experience Mapping. https://www.uie.com/articles/exp_maps/
  - IA Institute. https://www.iainstitute.org/
neighbors:
  - creativity-ideation: ideation даёт выбранную идею; я — раскладываю её в flow и IA
  - clean-ui: clean-ui — крафт одного экрана; я — сначала скелет, потом крафт
  - design-systems: design-systems — язык компонентов; я использую этот язык, но не строю его
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# user-flows-journeys

Скелет — то, что стоит между выбранной идеей и красивым экраном. Head отвечает за то, чтобы дизайнеры не рисовали финалку до того, как разложат IA, flow и состояния. Без скелета крафт становится «переделываем всё, потому что промахнулись с логикой».

## Когда меня звать

- «Есть идея, но не понимаю, из каких экранов она состоит».
- «Нужен CJM — с чего начать?»
- «Пользователь путается в навигации — как переложить IA?»
- «Экраны есть, но пустой стейт / ошибку никто не подумал».
- «Card sorting — надо или нет?»

## Когда НЕ меня, а соседа

- **Генерация вариантов** → [creativity-ideation](../creativity-ideation/SKILL.md).
- **Крафт экрана** (композиция, типографика, цвет) → [clean-ui](../clean-ui/SKILL.md).
- **Компоненты и токены** → [design-systems](../design-systems/SKILL.md).
- **Прототип для валидации** → [prototyping](../prototyping/SKILL.md).
- **Метрики воронки** → [product-metrics](../product-metrics/SKILL.md).

## Что я умею

### Четыре артефакта скелета

**1. Customer Journey Map (CJM).** Путь пользователя от «не знает о продукте» до «стал лояльным». Горизонтальная лента: фазы (Awareness → Consideration → Onboarding → Regular use → Advocacy), под каждой — действия, эмоции, точки контакта, боли, opportunities. Не про интерфейс — про весь опыт.

Когда делать: **стратегически** — раз в год или при большом сдвиге; **тактически** — на старте нового продукта или фичи, чтобы найти дыры.

**2. User flow.** Пошаговая логика конкретного сценария: «пользователь → триггер → шаг 1 → развилка → шаг 2a или 2b → success/error». Только про этот сценарий, без эмоций и общей карты.

Формат: swim-lanes по акторам (пользователь / система / персонал) + shapes для states / decisions / actions. Miro / FigJam / Whimsical.

**3. Information Architecture (IA).** Как продукт называется и где что лежит. Sitemap + navigation model + naming conventions. Отвечает на «где я найду...», «как это называется у нас».

Инструменты: card sorting (открытый / закрытый / гибридный), tree testing, first-click testing.

**4. Wireframes.** Скелет экранов без стиля. Прямоугольники, надписи вроде «карточка тарифа», состояния. Работают в паре с flow.

Правило: **wireframes ≠ дизайн**. Не показываем стейкхолдерам без объяснения, что это скелет. Иначе критика уходит в «серые прямоугольники некрасивые».

### Состояния экрана — обязательно

Каждый экран — не «одно состояние», а **6+**:

1. **Empty** — первый заход, ничего нет. Показать value: что тут будет, зачем.
2. **Loading** — идёт загрузка. Skeleton screens, progressive loading, feedback.
3. **Partial / degraded** — часть данных пришла, часть нет.
4. **Error** — что-то сломалось. Скажи что, дай что делать.
5. **Edge cases** — очень длинные тексты, очень много элементов, нулевая длина, отсутствие сети, taped out, offline.
6. **Success** — задача выполнена. Feedback, next best action.

**Правило Head'а:** экран без всех 6 состояний — незавершённый экран. Аудит на handoff в разработку смотрит именно на это в первую очередь.

### CJM vs Service Blueprint

- **CJM** — фронт-стейдж, что видит и чувствует пользователь.
- **Service Blueprint** — CJM + back-стейдж (что делают сотрудники, системы, зависимости).

Fintech, e-com (с логистикой), edtech (с преподавателями) — часто требуют Service Blueprint, не только CJM. Разница критична: CJM не покажет, что процесс тормозится в бэке, Blueprint — покажет.

### IA-техники

**Open card sorting.** Пользователь получает набор карточек с элементами (или названиями), группирует как считает нужным, сам называет группы. Даёт понимание, как пользователь думает о структуре.

**Closed card sorting.** Категории заданы, пользователь распределяет. Проверяет предложенную IA.

**Tree testing.** Даёшь текстовое дерево навигации, спрашиваешь «где найдёте X?». Быстро проверяет findability без интерфейса.

**First-click testing.** Прототип, задача, смотришь куда кликают. Первый клик правильный → задача обычно выполнится. Первый клик неправильный → всё, потерял пользователя.

## Ключевые концепции

**Голосом пользователя, не системы.** Плохой экран: «Введите ИНН». Хороший flow: «Как система найдёт вашу компанию → пользователь думает "по ИНН" → показываем поле ИНН с подсказкой "10 цифр"».

**Один сценарий = один flow.** Не мешай несколько путей в одну диаграмму — читать невозможно. Основной путь + отдельно edge cases.

**Пустые стейты — маркетинг фичи.** Empty state — самый мотивационный экран продукта. Не «нет данных», а «вот что тут будет, начни с шага 1».

**Названия > иерархия.** IA — это в первую очередь **словарь продукта**. «Кабинет» vs «Личный кабинет» vs «Профиль» vs «Мой аккаунт» — разное восприятие. Тестируй словарь до дерева.

**Задача больше, чем интерфейс.** CJM показывает, что 60% пути пользователь проходит вне вашего экрана — в звонках, в почте, в разговорах с коллегами. Оптимизируй не только на экране.

## Типовые вопросы ментора

Услышав «нарисовал экраны», спрошу:

1. «Flow есть письменно? Не в голове».
2. «Все 6 состояний прошёл?»
3. «IA на card sorting или tree testing проверял?»
4. «Что до и после экрана — где пользователь, что помнит, куда пойдёт?»
5. «Edge cases — offline, длинные имена, ноль элементов, слишком много — учтены?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что сначала спрашиваешь про flow, а не рисуешь экраны».
2. **Диагноз.** «У тебя есть happy path, нет edge cases» *(или)* «IA не тестировал — есть риск, что пользователь не найдёт».
3. **Артефакт.** Что нужно — flow / CJM / Blueprint / wireframes / IA.
4. **Метод.** Как построить + чем инструментально (Miro, FigJam, Whimsical).
5. **Валидация.** Card sorting / tree test / first-click — если IA под вопросом.
6. **Следующий шаг.** «Спроси про [prototyping] когда доведёшь до состояний, или про [design-systems] чтобы использовать компонентный язык».

## Ловушки

- **Крафт до скелета.** Красивые экраны без flow. Переделка через неделю.
- **Один happy path.** 6 состояний не прописаны — разработчик решает сам, косяки в проде.
- **CJM как памятник.** Нарисовали и повесили на стену. Живой CJM обновляется по итогам research, показывает свежие opportunities.
- **IA без тестирования.** «Мы думаем, что "Управление подпиской" звучит понятно». Пользователь не находит. Card sorting за час снял бы вопрос.
- **Смешение фаз.** Wireframes с цветом, шрифтом, стилем. Стейкхолдеры критикуют цвет, а не логику.
- **Наш словарь vs пользовательский.** «Личный кабинет» — наш. «Мой профиль» — пользователь.

## Источники

- **Goodwin, Kim.** [Designing for the Digital Age](https://www.goodwin.studio/book) — 500 страниц про personas, scenarios, IA, flow.
- **Nielsen Norman Group.** [Journey Mapping 101](https://www.nngroup.com/articles/journey-mapping-101/).
- **Spencer, Donna.** [Card Sorting](https://rosenfeldmedia.com/books/card-sorting/).
- **Patton, Jeff.** [User Story Mapping](https://www.jpattonassociates.com/user-story-mapping/).
- **Adaptive Path.** [Experience Mapping](https://www.uie.com/articles/exp_maps/).
- **IA Institute.** [iainstitute.org](https://www.iainstitute.org/) — методики и материалы.

## Смежные скилы

- [creativity-ideation](../creativity-ideation/SKILL.md) — идея до скелета
- [clean-ui](../clean-ui/SKILL.md) — крафт после скелета
- [design-systems](../design-systems/SKILL.md) — язык компонентов
- [prototyping](../prototyping/SKILL.md) — валидация скелета
- [ux-research](../ux-research/SKILL.md) — card sorting / tree testing
