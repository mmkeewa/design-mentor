---
name: editorial-policy
description: Тон голоса и редполитика продукта. UX writing (кнопки, ошибки, empty states, onboarding), гайдлайны, ревью текстов, i18n/локализация, этика (тёмные паттерны). Head приходит сюда, когда «маркетинг пишет одно, продукт другое, письма третье» — и надо навести порядок.
layer: flow
phase: design
update: stable
sources:
  - Torrey Podmajersky — Strategic Writing for UX. https://www.oreilly.com/library/view/strategic-writing-for/9781492049395/
  - Erika Hall — Conversational Design. https://abookapart.com/products/conversational-design
  - Nielsen Norman Group — UX Writing. https://www.nngroup.com/topic/writing-web/
  - Mailchimp Voice & Tone Guide. https://styleguide.mailchimp.com/voice-and-tone/
  - Shopify Polaris — Content guidelines. https://polaris.shopify.com/content
  - Atlassian Design — Voice and tone. https://atlassian.design/foundations/voice-and-tone
  - Deceptive Patterns (Harry Brignull). https://www.deceptive.design/
neighbors:
  - clean-ui: clean-ui — крафт экрана, я — крафт текста на экране
  - accessibility: cognitive accessibility и plain language — часть a11y; мы граничим
  - design-systems: доки как part of системы; я — контент, они — компоненты
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# editorial-policy

Текст в интерфейсе — часть дизайна. Head отвечает за то, чтобы у продукта была письменная политика (не только цветовая), и чтобы копирайтинг не был «PMом написан за 5 минут».

## Когда меня звать

- «У продукта нет тона голоса — каждый пишет по-своему».
- «Ошибки говорят на техническом языке».
- «Onboarding звучит как реклама, а не помощь».
- «Локализация ломает layout и смысл — как готовиться?»
- «Что такое тёмные паттерны и как их не допустить?»
- «Empty state пустой — что писать?»

## Когда НЕ меня, а соседа

- **Крафт экрана (визуал)** → [clean-ui](../clean-ui/SKILL.md).
- **A11y-специфика для чтения** → [accessibility](../accessibility/SKILL.md).
- **Общая маркетинговая коммуникация** — не сюда, это brand marketing. Я — про продукт, не про рекламу.
- **Компонентные структуры** → [design-systems](../design-systems/SKILL.md).

## Что я умею

### Voice vs Tone

**Voice** — постоянный характер бренда. Не меняется от ситуации. Пример: «прямой, тёплый, без канцелярита».

**Tone** — как voice звучит в конкретной ситуации. Меняется от контекста.
- **Праздник (успех)** — тёплый, поздравляющий.
- **Ошибка** — спокойный, помогающий, без обвинений.
- **KYC / формальный** — точный, сдержанный.
- **Onboarding** — приглашающий, guiding.

Voice всегда один, tone — из палитры.

### Voice attributes (три оси)

Три ось Mailchimp:
1. **Funny → Serious.**
2. **Casual → Formal.**
3. **Irreverent → Respectful.**

Fintech обычно: Serious + Formal + Respectful (с легкой теплотой).
E-com: middle + Casual + Respectful.
Edtech для детей: Casual + Playful + Respectful.

### UX writing patterns

**Buttons.**
- Верб + объект: «Открыть счёт», «Отправить письмо».
- Не «OK» / «Отправить» — не говорит что.
- Не «Кликните сюда» — где, как, зачем.

**Empty states.**
- Что тут будет + первый шаг: «Тут будут ваши вклады. Открой первый, чтобы начать копить».
- Не «Нет данных».

**Errors.**
- Что случилось + что делать + без обвинений.
- Плохо: «Invalid input».
- Средне: «Неверный формат телефона».
- Хорошо: «Проверьте номер: должен начинаться с +7».

**Onboarding.**
- Value first: что пользователь получит, а не что от него хочешь.
- Плохо: «Заполните профиль в 5 шагах».
- Хорошо: «5 минут — и деньги на счёте».

**Notifications / toasts.**
- Что произошло + action если нужен.
- Плохо: «Success!».
- Хорошо: «Платёж отправлен. Придёт до 3 рабочих дней».

**Confirmations.**
- Что подтверждаешь + последствие.
- Плохо: «Вы уверены?»
- Хорошо: «Удалить черновик? Восстановить не получится».

### Editorial guide — что должно быть

Как продуктовая часть общей brand-книги:
- **Voice attributes** (3 оси).
- **Tone-palette** (5–10 ситуаций).
- **Vocabulary** — «мы говорим "клиент", а не "пользователь"», «"платёж", а не "transaction"».
- **Grammar rules** — как формируем цифры (12 345, не 12345), даты (12 марта 2026), время.
- **Do / don't** — примеры реальные.
- **Наименования компонентов** — единый словарь для дизайнеров и разработчиков.

### i18n / локализация

Проектирование под перевод — не «переведём потом».

**Правила:**
- **Никаких склеек строк в коде.** «У вас {n} писем» ломается в языках с падежами (рус.: 1 письмо, 2 письма, 5 писем). Использовать ICU MessageFormat, plural rules.
- **Placeholder-based, не positional.** «Hello, {name}!», не «Hello, %s!» — переводчик видит контекст.
- **Layout под длину.** Немецкий на 30–40% длиннее английского. Арабский / иврит — RTL, весь макет зеркалится.
- **Cultural context.** Иконки могут читаться разно (жест thumbs-up оскорбителен в некоторых культурах).
- **Numbers, dates, currencies.** Разные форматы (12,345.67 vs 12 345,67).

**Список правил на handoff:** каждая строка → в отдельном ключе → с description для переводчика → с плюрализацией если нужна → с max length если есть layout ограничение.

### Этика и тёмные паттерны

**Тёмные паттерны (dark patterns)** — приёмы, которые вводят пользователя в заблуждение или заставляют делать то, что он не хотел.

Классификация (Harry Brignull, [deceptive.design](https://www.deceptive.design/)):
- **Confirmshaming.** «Нет, я не хочу экономить» вместо простого «Нет».
- **Roach motel.** Легко подписаться, невозможно отписаться.
- **Sneaking.** Скрытые галочки в форме (подписка, дополнительные сборы).
- **Forced continuity.** Trial подписки без предупреждения о списании.
- **Misdirection.** Кнопка отмены серая и мелкая, кнопка «продолжить» яркая — при том что это отмена подписки.
- **Nagging.** Постоянные попапы «оценить приложение» после каждого действия.
- **Fake urgency.** «Осталось 2 места!» когда мест бесконечно.

**Установка:** Head **не допускает** тёмные паттерны в продукте. В fintech это может быть уголовно наказуемо (misleading practices), в e-com — регуляторно (GDPR требует opt-in, не opt-out), в edtech (особенно для детей) — этически недопустимо и юридически (COPPA).

Правило: если стейкхолдер просит паттерн, который вводит в заблуждение — **аргументированный «нет»** с альтернативой, дающей тот же outcome честно.

### Domain-специфика

**Fintech.**
- Точность важнее теплоты. Суммы, комиссии, сроки — числами.
- Юридические тексты (согласия, disclaimer) — plain language, не «в соответствии с положением о...».
- Ошибки: не «operation failed», а «платёж не прошёл: не хватило 300 ₽. Пополнить?».

**E-com.**
- Активный залог: «Добавили в корзину», не «Добавлено».
- Убеждение через факты, не через давление.
- Цены и скидки — прозрачно, без «звёздочек».

**Edtech.**
- Для детей — простой словарь, короткие фразы, playful но не кричит.
- Родителям — прозрачность (что учат, сколько времени, безопасность данных).
- Прогресс и похвала — реальная (не «Молодец!» на каждом клике).

## Ключевые концепции

**Слово — часть дизайна.** Кнопка «Отправить» и кнопка «Отправить платёж» — разные компоненты. Слова несут UX-нагрузку не меньше визуала.

**Plain language > jargon.** Каждый термин — либо объясни при первом появлении, либо не используй. Юрист скажет «в соответствии с положением», Head скажет «согласно закону».

**Понимание > craft.** Красиво написанное непонятное — фейл. Прямо и понятно — приоритет.

**Voice — один, tone — из палитры.** Не пиши «в одном стиле» — пиши в одном voice, но в разных tone по ситуации.

**Design pull, not push.** Пользователю нужно понять и решить — не убедить его сделать то, что тебе выгодно. Тёмные паттерны — push. Плохо.

## Типовые вопросы ментора

Услышав «нужен UX writing», спрошу:

1. «Есть voice guide? Если да — покажи 3 attributes».
2. «Ошибки, empty states, buttons — покрыты правилами?»
3. «Локализация — что делаем? Один язык или сразу несколько?»
4. «Домен — fintech/e-com/edtech — как формирует tone?»
5. «Есть ли этические красные линии, о которых команда договорилась?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задумываешься до релиза — не после жалобы пользователей».
2. **Диагноз.** «У тебя нет voice guide — каждый пишет по-своему» *(или)* «Ошибки говорят языком системы, не пользователя».
3. **Артефакт.** Voice attributes (3 оси) → tone palette (5 ситуаций) → do/don't примеры.
4. **Правило под ситуацию.** Buttons / errors / empty states / confirmations — конкретный шаблон.
5. **i18n / этика.** Одна строка — какие подводные.
6. **Следующий шаг.** «Спроси про [clean-ui] чтобы уместить текст в макет, или про [accessibility] чтобы проверить plain language».

## Ловушки

- **Voice = мемы.** «Пишем весело» без правил. К релизу расходится в 5 разных стилей.
- **Ошибки на языке системы.** «ERR_TIMEOUT», «Invalid input» — пользователь не поймёт.
- **PM пишет копирайтинг.** Кнопка становится «Продолжить», ошибка «Что-то пошло не так». Копирайтинг требует своего craft.
- **i18n потом.** Строки склеены в коде → перевод сломан → релиз в другой стране откладывается.
- **Тёмные паттерны как "conversion trick".** Кратковременно работает, репутация летит, регуляторка приходит.
- **Empty state «Нет данных».** Упущенная возможность продать value фичи.
- **Confirmshaming.** «Нет, я не хочу экономить» — cheap trick, теряет доверие.

## Источники

- **Podmajersky, Torrey.** [Strategic Writing for UX](https://www.oreilly.com/library/view/strategic-writing-for/9781492049395/) — must-read для UX writing.
- **Hall, Erika.** [Conversational Design](https://abookapart.com/products/conversational-design).
- **Nielsen Norman Group.** [UX Writing articles](https://www.nngroup.com/topic/writing-web/).
- **Mailchimp.** [Voice & Tone Guide](https://styleguide.mailchimp.com/voice-and-tone/) — образец публичной voice-книги.
- **Shopify Polaris.** [Content guidelines](https://polaris.shopify.com/content) — глубокая работа с UX writing на масштабе.
- **Atlassian.** [Voice and tone](https://atlassian.design/foundations/voice-and-tone) — конкретные do/don't.
- **Brignull, Harry.** [Deceptive Patterns](https://www.deceptive.design/) — каталог тёмных паттернов и как их избегать.

## Смежные скилы

- [clean-ui](../clean-ui/SKILL.md) — текст в макете
- [accessibility](../accessibility/SKILL.md) — plain language как a11y
- [design-systems](../design-systems/SKILL.md) — компоненты + доки
- [fintech-ux](../../domain/fintech-ux/SKILL.md) — регуляторные тексты, disclaimer
