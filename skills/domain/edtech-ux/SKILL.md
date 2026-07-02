---
name: edtech-ux
description: Доменная линза для edtech. Прогресс и мотивация, оценивание и аттестации, детская и подростковая аудитория, gamification без токсичности, работа с родителями и учителями, learning science основы (spaced repetition, retrieval practice), completion rate как главная метрика. Head приходит сюда, чтобы отличить обучающий продукт от развлекательного.
layer: domain
phase: cross-cutting
update: living
sources:
  - Barbara Oakley — Learning How to Learn. https://barbaraoakley.com/
  - John Hattie — Visible Learning (research on what works). https://visible-learning.org/
  - EdSurge — Edtech news and research. https://www.edsurge.com/
  - Duolingo Design Blog. https://blog.duolingo.com/tag/design/
  - Khan Academy — Design principles. https://blog.khanacademy.org/tag/design/
  - COPPA — Children's Online Privacy Protection Act. https://www.ftc.gov/legal-library/browse/rules/childrens-online-privacy-protection-rule-coppa
  - GDPR-K (children in EU GDPR). https://gdpr.eu/
  - Nielsen Norman Group — Kids on the web. https://www.nngroup.com/topic/children/
neighbors:
  - discovery-delivery: линза на цикл
  - accessibility: cognitive a11y критичен для обучения; children's cognitive load — своя специфика
  - editorial-policy: язык для детей — свои правила
  - product-metrics: completion, retention, mastery — edtech-специфичные
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# edtech-ux

> ⚠️ **LIVING SKILL.** Regulatory context для детских продуктов обновляется (COPPA поправки, GDPR-K, национальные законы). Также сдвигаются best practices — AI-tutors, personalized learning, live-classes. Сверяйся с актуальными требованиями.

Edtech — не «интерфейс с контентом». Это работа с обучением как процессом. Head в edtech отвечает за то, чтобы продукт учил (а не развлекал), удерживал (а не только привлекал), был безопасен для детей (а не просто «модерируется») и уважителен к учителям и родителям.

## Когда меня звать

- «Работаем в edtech — что специфично?»
- «Course completion 15% — как поднять?»
- «Работаем с детьми — что можно и нельзя?»
- «Gamification — как без токсичности?»
- «Прогресс — как показывать?»
- «Родители vs дети vs учителя — три аудитории. Как совместить?»
- «Тесты и оценки — как проектировать?»
- «AI-tutor — как безопасно?»

## Когда НЕ меня, а соседа

- **Общие метрики** → [product-metrics](../../flow/product-metrics/SKILL.md). Я — edtech-специфичные.
- **Общая a11y** → [accessibility](../../flow/accessibility/SKILL.md). Я — cognitive load специфично для learning.
- **Voice для детей** → [editorial-policy](../../flow/editorial-policy/SKILL.md).
- **AI-фичи как таковые** → [ai-in-design](../../flow/ai-in-design/SKILL.md). Я — специфика для edtech.

## Что я умею

### Три аудитории

Edtech продукт обычно обслуживает **три аудитории одновременно**:

1. **Учащийся** — тот, кто учится. Ребёнок, подросток, взрослый.
2. **Родитель / плательщик** — платит, следит, ожидает результаты.
3. **Учитель / преподаватель** — ведёт, проверяет, отвечает.

Каждая аудитория — свой UX. Head должен явно разводить и проектировать три.

**Ошибка новичков.** Строят продукт только под учащегося, забыв про родителей. Родитель не видит, что происходит → отменяет подписку.

### Learning science основы

**Spaced repetition (интервальное повторение).**
- Учить не раз, а несколько с интервалами.
- Каждое успешное повторение — интервал увеличивается.
- Ошибка — интервал сбрасывается.
- Реализация: Duolingo, Anki, Quizlet, Memrise.

**Retrieval practice (активное вспоминание).**
- Учить через вопросы > учить через чтение.
- Тесты как обучающий инструмент, а не только оценивание.
- «Что мы прошли на прошлом уроке?» — активирует связи в памяти.

**Chunking (разбивка на куски).**
- Long-form content разбивать на 5–7 минут блоки.
- Каждый блок — законченный concept.
- Проверка после блока (mini-quiz).

**Cognitive load management.**
- Не показывай 30 элементов сразу.
- Отделяй learning content от navigation.
- Убирай visual noise.

**Feedback loops.**
- Immediate feedback после каждого ответа.
- Not just «right/wrong», а «почему».
- Growth mindset — ошибка = возможность.

Head должен знать эти основы и требовать от команды применять.

### Прогресс — как показывать

**Плохо:** «Пройдено 43 из 128».
**Хорошо:** «Уровень 2. До 3-го — 5 уроков».

**Прогресс работает, когда:**
- **Пример визуальный** (bar, badge, streak).
- **Разбит на достижимые milestones** — не «до финала 128», а «до следующей ачивки 5».
- **Показывает improvement** — «твой скор растёт: 40 → 60 → 78».
- **Уважает пропуски** — не «streak сломался, начинай сначала», а «попробуй сегодня, streak восстановится через 2 дня».

**Streak — обоюдоострый.**
- Хорошо: мотивирует ежедневность.
- Плохо: создаёт стресс, тревожность (особенно у детей).
- Дизайн-solution: **streak freeze** (сохранить один день), soft loss («streak на паузе», не «сломался»).

### Gamification без токсичности

**Хорошая gamification:**
- Достижения за реальное learning (прошёл тему, освоил навык).
- Progress towards mastery, не «набор баллов».
- Cooperative (учись с другом), не только competitive.
- Optional (можно отключить leaderboard).

**Плохая gamification (токсичная):**
- Aggressive push-notifications «Не забывай! Streak под угрозой!».
- Global leaderboards без controls (ребёнок сравнивает себя с топ-1% мира).
- Ranking-anxiety («Ты #4859 в мире!»).
- Loot boxes / random rewards (заимствовано из мобильных игр — вызывает зависимость).
- Guilt-induced return («Ваши друзья продвинулись, а вы?»).

**Head-правило.** Все gamification-механики проходят через фильтр: помогает ли это учиться, или только вызывает возврат? Если только возврат — вырезай.

### Дети и подростки — что специфично

**Дети (до 12–13).**
- Простой словарь, короткие фразы.
- Яркие цвета, но не хаотичные.
- Крупные touch targets (>48×48).
- Playful motion, но не отвлекающий.
- Character / mascot часто работает.
- Voice input / listening — важнее для не-читающих.
- Родительский control on-by-default.

**Подростки (13–17).**
- Не «детский» UI, но и не полностью взрослый.
- Соц-элементы (осторожно).
- Приватность важна (не показывать имя / фото по default).
- Design should feel «сделано для меня», не «для мамы».
- Interest-based content.

**COPPA (США), GDPR-K (ЕС):**
- Не собирай ненужные PII от детей.
- Родительское согласие обязательно.
- Не показывай ads детям (или строго controlled).
- Не используй behavioural profiling для детей.
- Право на удаление данных.

### Тесты и оценки

**Design goals:**
- **Fair** — вопросы понятны, вариант не путается.
- **Formative** — учат в процессе, не только оценивают.
- **Fast feedback** — сразу говорят, что не так, почему.
- **Multiple formats** — MCQ, drag-drop, code, audio, video.
- **Anti-cheat balance** — защита от списывания без paranoia.

**Что не делать:**
- Timer-anxiety без причины (кроме проф. экзаменов).
- Punitive UX за ошибку («Ты ошибся! –10 очков!»).
- Пропаганда «правильного» ответа как единственного (для творческих задач).

### Работа с родителями

**Родитель = плательщик и influencer.**
Что должен видеть:
- **Прогресс ребёнка** — понятный, не «прошёл 30% модуля».
- **Что делает** — темы, время, зависимость от контекста.
- **Weak points** — где надо помочь.
- **Cost transparency** — что оплачивается, до каких дат.
- **Recommendations** — что делать дома, как поддержать.

**Not surveillance.** Дизайн не должен превращать ребёнка в объект слежки. Родитель видит progress, не каждый клик.

### Работа с учителями

Учитель — часто **другая часть продукта** (B2B / B2C hybrid).

**Что нужно учителю:**
- **Class management** — списки, домашки, оценки.
- **Content assignment** — кому что.
- **Progress tracking** — за всем классом сразу.
- **Communication** — с учениками и родителями.
- **Time-saving** — auto-grading, templates.

**Учительский UX должен снимать нагрузку, не добавлять.**

### AI-tutors в edtech

**Специфика.**
- Ответы должны быть **правильные** и **понятны на уровне учащегося**.
- Uncertainty UI важен: «Я думаю так, но давайте проверим у учителя».
- Не должен давать готовые ответы на домашки (soft-block).
- Explainability — «почему это правильно, а это нет».
- HITL для оценивания — учитель проверяет финал, AI помогает.

**Регуляторные риски.** Использование AI на детях без явного консента родителей = GDPR-K / COPPA нарушение.

### Метрики edtech

**Основные:**
- **Course completion rate** — % дошедших до конца.
- **Time-to-first-value** — сколько до первого «я что-то узнал/сделал».
- **Mastery** — % студентов, освоивших навык.
- **Engagement quality** — минуты активного learning, не «сессии».
- **Streak retention** — вернулся ли по расписанию.
- **Assessment pass rate**.

**Осторожно:**
- DAU/MAU не всегда лучшая метрика — long-form learning cycles.
- Time-on-app не эквивалент learning — можно провести час бесполезно.

## Ключевые концепции

**Обучение ≠ развлечение.** Fun as a byproduct, not the goal. Продукт, где «весело», но ничему не учит — не edtech.

**Progress + mastery > accumulation.** «Ты знаешь X» лучше «ты собрал 10000 баллов».

**Long feedback loops.** Обучение — процесс на месяцы. Optimize не только на short-term retention.

**Кросс-generational.** Учитель за 60, ученик за 12, родитель за 40. Один продукт всех.

**Ethics не как ceremonial galoche.** Дети — уязвимая аудитория. Ethics-review каждой новой фичи.

**AI под HITL.** Учитель = финальный arbiter в оценивании.

## Типовые вопросы ментора

Услышав «работаем в edtech», спрошу:

1. «Аудитория — дети (какого возраста) / подростки / взрослые? Или комбо?»
2. «Роль в продукте — учащийся / учитель / родитель — все три или одна?»
3. «Тип обучения — self-paced / cohort / live-classes / mixed?»
4. «Completion rate — какой сейчас?»
5. «Gamification есть, какая, проходит ли ethics-фильтр?»
6. «Регуляторный контекст — COPPA / GDPR-K / национальный?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что задумываешься про learning science, а не только про UI».
2. **Диагноз.** «Твой gamification — токсичный, работает на возврат, не на learning» *(или)* «Родители не видят прогресс — они отменяют подписку».
3. **Правило / паттерн.** Spaced repetition / retrieval / chunking — что применить.
4. **Пример.** Duolingo / Khan Academy / индустриальный.
5. **Ethics check.** Одна строка про уязвимость аудитории.
6. **Следующий шаг.** «Спроси про [product-metrics] для edtech-метрик, или про [ai-in-design] если AI-tutor, или про [accessibility] для cognitive load».

## Ловушки

- **Learning как игра, где игра важнее.** Fun есть, learning — нет.
- **Toxic gamification.** Aggressive streaks, guilt-notifications, loot boxes.
- **Родитель забыт.** Продукт для ребёнка, родитель не видит — отменяет.
- **Учитель как object.** UI спроектирован для B2C, учитель мучается с B2B-фичами.
- **Одна аудитория.** Не разведены три.
- **Полный AI без HITL.** AI даёт финальную оценку — учитель обойдён.
- **Игнор regulatory.** COPPA / GDPR-K нарушения = big fines.
- **DAU как метрика success.** «Посидели в приложении», но не научились.
- **Streak как guilt.** «Не забывайте!» → тревожность у детей.

## Источники

- **Oakley, Barbara.** [barbaraoakley.com](https://barbaraoakley.com/) — practical learning science.
- **Hattie, John.** [Visible Learning](https://visible-learning.org/) — meta-research о том, что работает в обучении.
- **EdSurge.** [edsurge.com](https://www.edsurge.com/) — edtech news + research.
- **Duolingo.** [Design Blog](https://blog.duolingo.com/tag/design/) — public design decisions.
- **Khan Academy.** [Design Blog](https://blog.khanacademy.org/tag/design/).
- **NN/g.** [Kids on the web](https://www.nngroup.com/topic/children/) — UX-research по детской аудитории.
- **COPPA.** [ftc.gov](https://www.ftc.gov/legal-library/browse/rules/childrens-online-privacy-protection-rule-coppa).
- **GDPR-K.** [gdpr.eu](https://gdpr.eu/) — раздел про детей.

## Смежные скилы

- [discovery-delivery](../../orchestrator/discovery-delivery/SKILL.md) — линза на цикл
- [accessibility](../../flow/accessibility/SKILL.md) — cognitive a11y для обучения
- [editorial-policy](../../flow/editorial-policy/SKILL.md) — язык для детей
- [product-metrics](../../flow/product-metrics/SKILL.md) — edtech-метрики
- [ai-in-design](../../flow/ai-in-design/SKILL.md) — AI-tutors с HITL
