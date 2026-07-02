---
name: hiring-team-building
description: Наём и рост команды. Портрет роли, тестовые задания, интервью-loop, критерии оценки, calibration, оффер, онбординг 30/60/90, кураторство стажёров, offboarding. Head приходит сюда, когда команда растёт, и надо понять, кого и как искать, чтобы не сломать то, что есть.
layer: ops
phase: cross-cutting
update: stable
sources:
  - Michael Watkins — The First 90 Days. https://firstninetydays.com/
  - Lou Adler — Hire With Your Head. https://www.hirewithyourhead.com/
  - Design Hiring guides — Figma, InVision, Dropbox. https://www.figma.com/resource-library/
  - Greenhouse — Structured Hiring Guide. https://www.greenhouse.io/blog/tag/structured-hiring
  - Lever — hiring resources. https://www.lever.co/blog/
  - Google re:Work — Hiring. https://rework.withgoogle.com/subjects/hiring/
  - First Round — hiring articles. https://review.firstround.com/tag/hiring
neighbors:
  - design-management: management — про команду после найма; я — про приход в команду
  - stakeholder-work: работать с HR как со стейкхолдером
  - design-ops: onboarding — часть ops-процессов; я — специфика найма и роста
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# hiring-team-building

Наём — не «искать резюме». Это **дизайн процесса**: портрет роли → воронка → интервью → решение → онбординг → рост. Head отвечает за качество каждой ступени. Одна плохая вакансия компенсируется полугодом ретроспективно.

## Когда меня звать

- «Открываем вакансию — с чего начать?»
- «Как писать портрет роли?»
- «Тестовое — какое, оплачивать ли, сколько времени?»
- «Интервью-loop — из каких этапов?»
- «Как оценивать кандидатов не по вкусу?»
- «Онбординг — 30/60/90, что это?»
- «Стажёр — брать / не брать / как курировать?»
- «Как уволить, чтобы человек ушёл с достоинством?»

## Когда НЕ меня, а соседа

- **Управление после найма** → [design-management](../design-management/SKILL.md).
- **Инструменты и процессы** → [design-ops](../design-ops/SKILL.md).
- **Работа с рекрутером/HR как стейкхолдерами** → [stakeholder-work](../stakeholder-work/SKILL.md).

## Что я умею

### Портрет роли

**До описания вакансии — портрет:**

- **Задача, которую роль решает.** Не «нужен дизайнер», а «нужен человек, который заведёт discovery в команде».
- **Уровень.** Junior / Middle / Senior / Staff / Lead — почему именно.
- **Скилы: must / nice.** Must — 5–7 максимум. Nice — 3–5.
- **Domain-опыт.** Fintech / e-com / edtech — обязателен или нет.
- **Culture add.** Что этот человек привнесёт нового в команду.
- **Anti-portrait.** Кто **не** подходит — важнее, чем кто подходит.

**Правило.** Портрет читают 3 человека (Head, PM, будущий peer). Если у них разные ожидания — переделай портрет.

### Job description

**Плохо (типичное):**
> Ищем senior product-дизайнера с 5+ годами опыта, знанием Figma, портфолио с ai-native кейсами...

**Хорошо:**
```
Роль: Senior Product Designer, fintech
Задача: возглавить дизайн онбординга нового банковского клиента. Сейчас
KYC drop-off 32%, цель — 20% через полгода.

Что вы будете делать:
- Провести discovery на 15+ интервью с новыми клиентами.
- Пересобрать flow с 7 шагов до 4.
- Спроектировать error / retry / edge cases.
- Работать в паре с 2 fintech-девелоперами и 1 PM.
- Валидировать через A/B с целью p<0.05.

Успех = KYC drop-off <20% через 6 месяцев.

Что мы даём:
- Автономию: вы Head'-of Onboarding по факту.
- Дизайн-систему в норм состоянии.
- Real data и eng-support.
- Salary range: X-Y.
```

Человек, читающий такую вакансию, знает: (а) что делать, (б) как измеряется успех, (в) стоит ли откликаться.

### Воронка найма

**Стадии:**
```
Sourcing → Screening → Phone screen → Test task → Onsite loop → Offer
```

**Timeframes:**
- Sourcing: постоянно.
- Screening (резюме + портфолио): 1–3 дня.
- Phone screen (30–45 мин): в течение недели.
- Test task: 1–2 недели.
- Onsite loop: за один день.
- Offer: 24–48 часов после решения.

**Правило.** Растянутая воронка = потеря топ-кандидатов. Хорошие уходят к тем, кто быстрее.

### Портфолио review

**Хорошее портфолио показывает не «что нарисовал», а «как думал».**

**Смотрю (в этом порядке):**
1. **Postановка задачи.** Понимает ли, что решал?
2. **Метрики / outcome.** Есть ли связь дизайна с эффектом?
3. **Процесс.** Как пришёл к решению, а не только финал?
4. **Трейд-оффы.** Что не сделал и почему?
5. **Крафт финала.** Видно, что руки на месте.

Красный флаг: 5 «финалов» без процесса и метрик = маркетинг, не работа.

### Тестовое задание

**Философский вопрос:** давать или нет?

**За.** Реальный сигнал о качестве работы. Отсекает мимо.
**Против.** Отпугивает senior'ов, отнимает время, часто плохо оценивается.

**Мой baseline.**
- Для junior/mid — да, small paid task (2–4 часа).
- Для senior — портфолио + phone screen + case study conversation.
- Для lead+ — портфолио + serious conversations, no tests.

**Если даёшь тестовое:**
- **Payload real.** Не «сделай регистрацию» — а «наша конкретная задача, вот бриф».
- **Time-boxed.** «Не больше 4 часов».
- **Paid.** Если больше 2 часов — платишь.
- **Criteria опубликованы.** «Оцениваем: проблема, процесс, трейд-оффы».

### Интервью-loop

**Типичный design-loop:**

1. **Phone screen (Head or hiring manager, 30–45 мин).** Overall fit + motivation.
2. **Portfolio review (Head + 1 designer, 60 мин).** Case study conversation.
3. **Whiteboard / design exercise (Head + designer + PM, 60 мин).** Как думает под pressure. Живой продуктовый кейс, не пазл.
4. **Team fit (2–3 potential peers, 30 мин каждый).** Как договариваться, feedback, коллаборация.
5. **Cross-functional (PM/eng/leadership, 30 мин).** Как работает с не-дизайнерами.

**Не 15 интервью.** 5 — потолок. Больше = burnout candidates, больше bias.

**Structured interviews.** Каждый интервьюер имеет заданные вопросы + rubric оценки. Не «поговорите — расскажете».

### Оценка кандидатов

**Rubric на каждую компетенцию (1–5 шкала):**
- Craft — визуал / product-thinking / систематичность.
- Process — discovery / synthesis / iteration.
- Communication — как рассказывает, как слушает.
- Collaboration — работа с не-дизайнерами.
- Culture add — что привносит.

**Debrief.**
- Все интервьюеры собираются.
- Каждый пишет **свою оценку до discussion'а** (иначе первый голос доминирует).
- Обсуждение по rubric-у, не «мне понравился».
- Решение — hire / no hire / consider for other role.

**Calibration.** Регулярно (раз в 3–6 мес) — оцениваете вместе прошлые решения. «Мы взяли, оказался слабым — почему?». Растит качество оценок.

### Оффер

**Скорость.** Решение → оффер в 24–48 часов. Медленнее — теряешь.

**Компенсация transparent.** Пишешь диапазон сразу (это будет норма в EU с 2026 из-за Pay Transparency Directive).

**Beyond salary.** Что ещё — стажировки, менторство, remote / hybrid, оборудование, конференции, время на open source.

**Договорись о start date.** Обычно 2–4 недели.

### Onboarding 30/60/90

Не «welcome и удачи».

**День 1–7:**
- Buddy — sr designer, отвечающий за адаптацию.
- Доступы, обзор системы, знакомство с командой.
- Первая маленькая задача (audit, small tweak) — win в первую неделю.

**День 8–30:**
- Погружение в domain, дизайн-систему, метрики продукта.
- Первый design-review как участник.
- Понимание workflow с PM и eng.
- **Цель день 30:** знает, где что лежит; сделал 2–3 small tasks; понимает roadmap.

**День 31–60:**
- Первый full-size project — с mentorship.
- Ownership небольшой feature.
- Первый own design-review где-то в середине.
- **Цель день 60:** ведёт task с минимальным supervision.

**День 61–90:**
- Full-project ownership.
- Contribution to design-system / process.
- Первый peer-review своей работы (для junior/mid).
- **Цель день 90:** работает как полноценный член команды.

**30-60-90 check-ins.** Раз в 30 дней 1×1 «как ты, что не так, что нужно».

**Красный флаг.** День 60 — работник не двигается → проблема (в human'е, в onboarding'е, или в fit'e).

### Стажёры

**За.** Пропуск в талант pipeline. Fresh perspective.
**Против.** Требует много attention. Плохой стажёр — потерянные месяцы куратора.

**Как делать хорошо:**
- **Real project, not busywork.** Стажёр решает реальную задачу, не «оформи это красиво».
- **Curator = senior designer, дедицированное время (~4 часа/неделя).**
- **Cadence.** Weekly 1×1 + weekly design-review.
- **Cohort learning.** Если несколько стажёров одновременно — cohort sessions.
- **Return offer critérium.** Что покажет — переведёшь ли в постоянного?

### Offboarding

**Три сценария:**

**1. Уход по собственной.**
- Уважительно. Exit interview с честной оратной связью — что нам улучшить.
- Knowledge transfer — 2 недели.
- Boomerang policy — двери открыты.

**2. Мы просим уйти (performance).**
- Improvement plan за 60–90 дней до — если работает.
- Если не работает — раздельность с уважением.
- Severance, references — по стандартам компании.

**3. Layoff (не связано с performance).**
- Уведомление заранее (по местным правилам).
- Максимальная поддержка (severance, references, network intro).
- Открытая коммуникация оставшимся.

**Никогда.** Молчаливое исчезновение работника из чата.

## Ключевые концепции

**Наём — самый важный процесс.** Один плохой hire стоит команде 3–6 месяцев боли.

**Structured > gut.** Rubric, независимые оценки, debrief по правилам — снижают bias.

**Speed matters.** Топ-кандидаты не ждут 3 недели.

**Diversity как фактор качества.** Разнообразная команда решает лучше. Head активно работает против bias'а.

**Onboarding = investment.** 90 дней структурированного onboarding'а окупятся втрое.

**Голосование не работает.** «5 из 7 сказали hire» ≠ hire. Каждое hire — Head'а решение, ответственность.

## Типовые вопросы ментора

Услышав «нанимаем», спрошу:

1. «Портрет роли письменно есть? Задача роли + успех сформулированы?»
2. «Test task — даёте? Как оплачиваете?»
3. «Интервью-loop — сколько этапов?»
4. «Rubric оценки есть или "поговорим и почувствуем"?»
5. «Onboarding 30/60/90 существует, или человек приходит и "разберёшься"?»
6. «Кто curator у новичка?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задумываешься до постинга вакансии — большинство просто копируют шаблон».
2. **Диагноз.** «Портрет роли размытый — резюме будут поток» *(или)* «Интервью без rubric — bias победит».
3. **Практика.** Портрет — job description — воронка — интервью-loop — оценка — onboarding.
4. **Инструмент.** Greenhouse / Lever / Notion — что использовать.
5. **Timeframe.** Скорость.
6. **Следующий шаг.** «Спроси про [design-management] чтобы онбордить хорошо, или про [design-ops] для процессов».

## Ловушки

- **Скопирована job description.** «Senior Product Designer, знание Figma...» — привлечёт average.
- **Растянутая воронка.** Топ-кандидаты уходят.
- **Тестовое неоплаченное на 8 часов.** Отпугивает лучших.
- **Interview без rubric.** «Хороший парень» побеждает над «сильный дизайнер».
- **15 интервью в loop'e.** Burnout candidates, они уходят.
- **Голосование = решение.** Head должен взять ответственность.
- **Onboarding «разберёшься».** Хороший human оставляется в первые 3 месяца.
- **Стажёр без curator'а.** Потерянные месяцы обеих сторон.
- **Layoff без внимания к оставшимся.** Survivor guilt разрушает команду.

## Источники

- **Watkins, Michael.** [The First 90 Days](https://firstninetydays.com/) — для новичков в новой роли (и полезно для тех, кто их принимает).
- **Adler, Lou.** [Hire With Your Head](https://www.hirewithyourhead.com/) — performance-based hiring.
- **Figma / InVision.** [Design hiring guides](https://www.figma.com/resource-library/) — practical.
- **Greenhouse.** [Structured Hiring Guide](https://www.greenhouse.io/blog/tag/structured-hiring) — как ставить процесс.
- **Google.** [re:Work Hiring](https://rework.withgoogle.com/subjects/hiring/) — Google's approach, публично.
- **First Round Review.** [Hiring articles](https://review.firstround.com/tag/hiring).

## Смежные скилы

- [design-management](../design-management/SKILL.md) — команда после найма
- [design-ops](../design-ops/SKILL.md) — процессы вокруг найма
- [stakeholder-work](../stakeholder-work/SKILL.md) — HR / рекрутёры как стейкхолдеры
