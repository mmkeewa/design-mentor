---
name: clean-ui
description: Крафт одного экрана. Сетки, типографика (масштаб, контраст, ритм), цвет (палитра, семантика, контраст), spacing и rhythm, motion, иерархия, «незаметный» дизайн. Про качество отдельной страницы, а не системы.
layer: flow
phase: design
update: stable
sources:
  - Adam Wathan & Steve Schoger — Refactoring UI. https://www.refactoringui.com/book
  - Erik Kennedy — Learn UI Design. https://learnui.design/
  - Ellen Lupton — Thinking with Type. http://thinkingwithtype.com/
  - Josef Müller-Brockmann — Grid Systems in Graphic Design.
  - Butterick — Practical Typography. https://practicaltypography.com/
  - Robin Rendle — CSS Layout notes. https://css-tricks.com/author/robinrendle/
  - Nathan Curtis — Space in Design Systems. https://medium.com/eightshapes-llc/space-in-design-systems-188bcbae79a8
neighbors:
  - design-systems: design-systems про систематизированный переиспользуемый язык; я — про крафт конкретного экрана в этом языке
  - visual-literacy: visual-literacy — насмотренность и вкус; я — воплощение вкуса
  - multi-platform: multi-platform — платформенные различия; я — крафт внутри одной платформы
  - accessibility: accessibility — WCAG-контраст, focus, alt-тексты; я использую эти правила как baseline
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# clean-ui

Не «покрасивше», а инженерная работа над одним экраном. Head отвечает за то, чтобы у команды был словарь качества интерфейса, а не «мне так нравится».

## Когда меня звать

- «Экран собран, но выглядит грязно — не понимаю почему».
- «Иерархия не читается — глаз не знает, куда смотреть».
- «Слишком много всего, но убрать вроде нечего».
- «Как выбрать типографику и spacing?»
- «Цвет вроде брендовый, но нет».
- «Micro-interaction — где нужен, где перебор?»

## Когда НЕ меня, а соседа

- **Компоненты и токены на всю систему** → [design-systems](../design-systems/SKILL.md). Я — один экран.
- **Насмотренность и референсы** → [visual-literacy](../../reference/visual-literacy/SKILL.md).
- **Различия iOS/Android/web** → [multi-platform](../multi-platform/SKILL.md).
- **A11y-аудит** → [accessibility](../accessibility/SKILL.md).
- **Скелет и flow** → [user-flows-journeys](../user-flows-journeys/SKILL.md).

## Что я умею

### Пять слоёв крафта

**1. Grid & Layout.** 4- или 8-точечная сетка (8px baseline — стандарт). Column grid + baseline grid. Consistent gutter. Все расстояния — множители base unit (4 или 8). Без «17px, потому что так сложилось».

**2. Typography.** Type scale (modular, обычно 1.125 / 1.2 / 1.25 ratio). Максимум 2 семейства шрифтов на экран. Contrast через weight и size, не через отдельный шрифт. Line-height: 1.2–1.35 для заголовков, 1.5–1.6 для body. Measure (длина строки) 45–75 символов для комфорта.

**3. Colour.** Ограниченная палитра: primary + neutral + accent + semantic (success/warning/error/info). Не бренд-палитра из 12 цветов — она для маркетинга, не UI. Контраст 4.5:1 для body, 3:1 для крупного текста и не-текстовых (WCAG AA).

**4. Spacing & rhythm.** Больше пространства, чем кажется. Плохой экран → тесный. Хороший → дышит. Разделение через whitespace, не через borders/dividers.

**5. Motion & micro-interactions.** Duration: 150–300 ms для UI, 300–500 для transitions. Easing: ease-out для входов, ease-in для выходов. Motion — не украшение, а обратная связь. Без функции — убрать.

### Refactoring UI — 30 приёмов Adam Wathan / Steve Schoger

Не полная теория, а практические приёмы. Что взять в первую очередь:

- **Start with too much whitespace, then remove.** Разбегается — лучше, чем задыхается.
- **Establish a spacing and sizing system.** Не «на глаз», а токены.
- **Emphasize by de-emphasizing.** Выделяй, приглушая соседние, а не крася главный ярче.
- **Labels are a last resort.** Пиктограмма + текст, или один placeholder + смысл в подписи выше.
- **Use fewer borders.** Тень / фон / spacing вместо линий.
- **Overlap elements.** Card поверх изображения — лучше, чем рядом.
- **Choose a base size, then scale by ratio.** 16 × 1.25 = 20 → 25 → 31 → 39. Никаких случайных 22, 24, 26.
- **Design for the majority, not extremes.** Не подстраивай экран под самое длинное имя в БД.

### Иерархия — три уровня

Каждый экран должен иметь:
- **Primary** — 1 элемент, самый важный. Крупный, контрастный, единственный CTA.
- **Secondary** — 2–4 элемента, поддерживают primary. Меньше, но заметно.
- **Tertiary** — фон, вспомогательное. Едва заметно.

Ошибка: **3 primary**. Глаз мечется, не выбирает.

### Типографический ритм

**Type scale (пример 1.25 ratio, base 16):**
- Body: 16
- Small: 14
- Body large: 20
- H4: 25
- H3: 31
- H2: 39
- H1: 49
- Display: 61

Один экран использует **3–5 размеров**, не все 8. Больше = шум.

**Weight scale:** Regular 400 / Medium 500 / Semibold 600 / Bold 700. Максимум 3 на экран.

### Colour system

Минимум для продукта:
- **1 primary** (brand) + 2–3 tint (hover/pressed) + 1 dark shade
- **1 accent** (второй brand, для highlights)
- **Neutral scale** — 9–12 оттенков серого (от background до strongest text)
- **Semantic** — success, warning, error, info (по одному main + light background)

Не путать бренд-палитру и UI-палитру. Brand — 4 акцентных цвета для маркетинга; UI — приглушённая рабочая палитра.

### Motion — правила

**Purposeful:** каждая анимация отвечает на «зачем». Feedback (что-то произошло), continuity (объект переместился, не исчез), spatial understanding (где я в иерархии).

**Duration:**
- Micro (button hover, ripple): 100–150 ms
- UI transitions (modal, drawer): 200–300 ms
- Big transitions (page): 300–500 ms

**Easing:**
- Ease-out (fast → slow) — для входа
- Ease-in — для выхода
- Standard (Material curves): `cubic-bezier(0.4, 0.0, 0.2, 1)`

**Красный флаг:** motion, который замедляет пользователя. Модный parallax на 1200 ms в чекауте = потеря конверсии.

## Ключевые концепции

**«Незаметный» дизайн.** Хорошо оформленный интерфейс не бросается в глаза — он работает. Если пользователь замечает дизайн, чаще всего это плохо (что-то мешает или отвлекает).

**Контраст даёт иерархию, не цвет.** Крупный + жирный + белое место = primary. Красный + мелкий = агрессия, не приоритет.

**Whitespace — не пустое место.** Это активный элемент композиции. Правильный whitespace даёт ощущение премиума, снижает cognitive load, разделяет группы без linear.

**Border — крайний случай.** До того как ставить линию — попробуй background, shadow, spacing. Border часто = скупое решение.

**Consistency > cleverness.** Один паттерн, применённый везде, лучше семи разных «умных» решений.

**Домен-специфика.** Fintech — консерватизм в цвете и mo­тионе, доверие через тишину. E-com — акценты на CTA, много изображений. Edtech — теплее, больше цвета, playful, но не хаотичный.

## Типовые вопросы ментора

Услышав «выглядит грязно», спрошу:

1. «Grid установлен? 4 или 8 base?»
2. «Сколько размеров шрифта на экране? Больше 5 — уже много».
3. «Есть один primary CTA или несколько борются?»
4. «Сколько цветов, кроме нейтральных? Больше 3 — шум».
5. «Пробовал убрать 30%?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что глаз сам говорит "грязно" — многие не чувствуют».
2. **Диагноз.** «У тебя нет одной primary — три элемента борются за внимание» *(или)* «7 размеров шрифта, нужно 4».
3. **Приём.** Конкретный из Refactoring UI — «emphasize by de-emphasizing», «start with too much whitespace».
4. **Проверка.** «Убери 30% элементов — станет лучше в 80% случаев».
5. **Следующий шаг.** «Спроси про [design-systems], если хочешь эти правила закрепить на весь продукт, или про [visual-literacy] если нужно топливо для стиля».

## Ловушки

- **Три primary.** Глаз не знает, куда смотреть. Один primary на экран.
- **Random spacing.** 17px, 22px, 28px, потому что «на глаз». Токены base×N.
- **Border everywhere.** Каждый блок в рамке. Whitespace лучше.
- **Много цветов.** Бренд-палитра из 8 цветов в UI. Работай в UI-палитре 3 + нейтрали.
- **Motion как украшение.** Анимация без функции = потеря скорости.
- **«Плотнее = профессиональнее».** Нет. Плотный экран = уставший пользователь.
- **Копирование бренда.** Instagram-градиенты в fintech-чекауте. Домен не пойдёт.

## Источники

- **Wathan & Schoger.** [Refactoring UI](https://www.refactoringui.com/book) — must-read, 30 практических приёмов.
- **Kennedy, Erik.** [Learn UI Design](https://learnui.design/) — платный курс, но блог с бесплатным материалом отличный.
- **Lupton, Ellen.** [Thinking with Type](http://thinkingwithtype.com/) — типографика с ноля.
- **Butterick, Matthew.** [Practical Typography](https://practicaltypography.com/) — веб-книга, всё бесплатно.
- **Curtis, Nathan.** [Space in Design Systems](https://medium.com/eightshapes-llc/space-in-design-systems-188bcbae79a8) — как spacing работает системно.
- **Müller-Brockmann, Josef.** *Grid Systems in Graphic Design* — классика 1961 года, до сих пор актуально.

## Смежные скилы

- [design-systems](../design-systems/SKILL.md) — систематизация правил на весь продукт
- [visual-literacy](../../reference/visual-literacy/SKILL.md) — насмотренность как топливо
- [multi-platform](../multi-platform/SKILL.md) — платформенные различия
- [accessibility](../accessibility/SKILL.md) — WCAG-baseline
- [editorial-policy](../editorial-policy/SKILL.md) — UX writing на экране
