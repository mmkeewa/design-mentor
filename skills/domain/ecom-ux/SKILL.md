---
name: ecom-ux
description: Доменная линза для e-commerce. Каталог, поиск, категории, фильтры, product page, корзина, чекаут, платёж, upsell, cross-sell, отзывы, возвраты, ретеншн. Скорость до покупки как главная UX-метрика опыта. Head приходит сюда, чтобы отличать e-com паттерны от других доменов.
layer: domain
phase: cross-cutting
update: living
sources:
  - Baymard Institute — Cart & Checkout Research. https://baymard.com/
  - Growth.Design — E-commerce case studies. https://growth.design/case-studies
  - Nielsen Norman Group — E-commerce UX. https://www.nngroup.com/topic/e-commerce/
  - Shopify Polaris — Content and pattern guidelines. https://polaris.shopify.com/
  - CXL — E-commerce optimization. https://cxl.com/
  - Amazon UX patterns — не прямая книга, но паттерны индустрии. https://baymard.com/blog
neighbors:
  - discovery-delivery: линза поверх цикла
  - product-metrics: e-com метрики (cart abandonment, CR, AOV) — специфичны
  - editorial-policy: e-com copywriting — свои правила
  - accessibility: legal accessibility (ADA-иски в e-com растут)
version: 0.1.0
license: All rights reserved — Marina Makeewa. See LICENSE.
---

# ecom-ux

> ⚠️ **LIVING SKILL.** E-com быстро адаптируется под платформы (TikTok Shop, social commerce, live commerce). Проверяй актуальные паттерны индустрии перед выдачей рекомендаций.

E-com — не «интернет-магазин». Это оптимизация каждого шага от «пользователь пришёл» до «пользователь купил и вернулся». Head в e-com отвечает за то, чтобы дизайн не разваливал воронку и работал на **скорость до покупки** + **retention**.

## Когда меня звать

- «Работаем в e-com — что специфично?»
- «Cart abandonment 75% — где теряем?»
- «Product page — что должно быть?»
- «Поиск и фильтры — как строить?»
- «Чекаут — сколько шагов?»
- «Как работать с отзывами и ratings?»
- «Возвраты — UX или anti-UX?»

## Когда НЕ меня, а соседа

- **Общие продуктовые метрики** → [product-metrics](../../flow/product-metrics/SKILL.md). Я — e-com специфичные.
- **UX writing** → [editorial-policy](../../flow/editorial-policy/SKILL.md). Я — e-com формулировки.
- **A11y** → [accessibility](../../flow/accessibility/SKILL.md).
- **Fintech при оплате в e-com** — на границе с [fintech-ux](../fintech-ux/SKILL.md).

## Что я умею

### Воронка e-com — 4 макро-шага

```
Discovery         Consideration        Decision           Loyalty
    ↓                  ↓                   ↓                 ↓
Search/Category → Product Page → Cart → Checkout → Post-purchase
```

Каждый шаг = свои паттерны и метрики.

### Search & Discovery

**Search bar** — обычно top-right, всегда видим (не hidden в меню).

**Autocomplete.** Сразу с первого символа. Показывать:
- Products (thumbnail + name + price).
- Categories.
- Popular searches.

**Search results:**
- Grid vs list toggle.
- Sorting (relevance, price, rating, new).
- Filters сверху или сайдбаром.
- Sponsored / promoted помечать честно.

**Zero-results.**
- «Ничего не нашли по 'X'» + suggestions (correction, related, categories).
- Не тупик — путь дальше.

**Search personalization** — если известен user, показывать релевантное; но осторожно — иначе экосистема пузырится.

### Filters

**Хорошая структура фильтров:**
- **Category first** (breadcrumb).
- **Facet filters** (brand, price range, size, colour, rating).
- **Show active filters** — chip'ами сверху, легко убрать.
- **Filter count** — сколько товаров в каждой опции.
- **Apply behaviour** — auto-apply (для quick) vs Apply button (для complex).

**Плохо:**
- 30 filter'ов открытыми одновременно.
- Фильтры, дающие 0 результатов, не помечены.
- Нельзя одновременно выбрать несколько значений в одной категории.

### Product Page (PDP)

**Обязательные элементы:**
- **Images** — множественные, high-res, zoom, video (если есть).
- **Product name** — точно как в поиске.
- **Price + discount** — прозрачно (было / стало, экономия).
- **Availability** — в наличии / кол-во / доставка.
- **Options** — size, colour, variant (visual selector).
- **Add to cart** — primary CTA, всегда доступна.
- **Buy now** — secondary для impulse-purchase.
- **Description** — короткая + long-form.
- **Specifications** — таблица.
- **Reviews** — с рейтингом, sorting, фильтрами.
- **Related / recommended** — не «you may also like», а **based on что** (recently viewed, similar buyers, complete the look).
- **Shipping / return info** — до покупки, не после.
- **Trust indicators** — secure payment, delivery guarantee, return policy.

**Что часто пропускают:**
- **Sold-out state** — просто «нет в наличии» вместо «уведомить когда появится».
- **Size guide** — критично для одежды/обуви.
- **Q&A** — пользователи задают вопросы, продавец отвечает.
- **Stock urgency честно** — «осталось 3» правда, не фейк.

### Cart

**Cart — не финал.** Пользователь ещё думает.

**Основные элементы:**
- Product list (thumbnail, name, variant, price, quantity, remove).
- Quantity — легко изменить.
- Subtotal + shipping + tax + total — прозрачно.
- Promo code field.
- **Proceed to checkout** — primary CTA.
- **Continue shopping** — secondary, легко.
- **Save for later** — часто пропущенная фича.

**Cart abandonment:**
- Base rate ~70% ([Baymard](https://baymard.com/lists/cart-abandonment-rate)) — считаем нормой.
- Возврат: email-nudges (не спам), retargeting ads, price drop alerts.

### Checkout

**Baymard's research:** большинство e-com имеют 5.4 шага в чекауте, оптимум 3–4.

**Обязательные шаги:**
1. **Contact + shipping address.**
2. **Delivery method + speed.**
3. **Payment.**
4. **Review + confirm.**

**Guest checkout — обязательно.** Force-signup убивает 30% чекаутов. Даёшь sign-up **после** заказа.

**Формы:**
- **Auto-fill address** через ЕГРЮЛ / dadata / Google Places.
- **Inline validation** — сразу говорим об ошибках, не после submit.
- **Progress indicator** — «Шаг 2 из 4».
- **Order summary** сбоку — всегда виден.

**Payment:**
- **Multiple methods** — card, wallet (Apple/Google Pay), крипта где применимо, buy-now-pay-later.
- **Saved cards** — quick pay.
- **Trust indicators** — SSL, PCI, secure badge.

**Confirmation:**
- Order number.
- Order summary.
- Delivery ETA.
- Что дальше (track shipment, contact if issue).

### Post-purchase

Часто забытая часть, но retention решается здесь.

- **Order tracking** — с реальными обновлениями, не «processing».
- **Delivery notifications** — активные, но не спам.
- **Post-delivery** — «получили? как вам?»
- **Reviews prompt** — не сразу, через 7–14 дней.
- **Repurchase reminders** — для consumables.
- **Loyalty** — points, tiers, exclusive access.

### Возвраты

**Возврат — часть UX.** Плохой возврат = потерянный покупатель.

- **Return policy** — прозрачно, до покупки.
- **Initiation** — из аккаунта, 2 клика.
- **Reasons** — dropdown + optional text.
- **Return method** — pickup / drop-off / label print.
- **Refund timeline** — прозрачные сроки.
- **Return-status tracking** — как для доставки.

### Отзывы (reviews)

**Trust builder №1.**

**Design:**
- Star rating (обычно 5-point).
- Total count.
- Distribution (сколько 5-star, 4-star, etc.).
- Filter (по rating, verified purchase, with images, recent).
- Sort (helpful, recent, high-to-low, low-to-high).
- Photo/video reviews прioritize.
- Verified badge важен.

**Что не делать:**
- Только 5-star (пользователь видит fake).
- Removing negative reviews.
- No response from seller.
- «Проверено сотрудником» без reference.

### Domain внутри домена

**Fashion / apparel.**
- Size guide + fit predictor.
- Model info (height, size worn).
- Detailed images (fabric, tags).
- Try-at-home / VR try-on.

**Electronics.**
- Detailed specs.
- Comparison tables.
- Warranty info.
- Compatibility check.

**Grocery.**
- Substitutions (in-stock alternatives).
- Delivery slots.
- Reorder from history.
- Recipe integration.

**Marketplaces (Wildberries, Ozon, Amazon).**
- Multi-seller aspect.
- Seller ratings.
- Shipping combining.
- Cross-seller discovery.

## Ключевые концепции

**Speed > cleverness.** В e-com каждая лишняя секунда = потеря конверсии. Умные, красивые, но медленные экраны — плохо.

**Progressive disclosure.** Не сваливай всё сразу. Основное — на PDP, детали — по клику.

**Prevent, then recover.** Ошибки предотвращать (валидация форм) лучше, чем чинить после (error state).

**Trust signals — везде.** SSL, return policy, real reviews, human-friendly support access.

**Guest checkout — must.** Форс-регистрация убивает продажи.

**Mobile-first for real.** 60%+ e-com traffic — мобильный. Не «responsive», а **mobile-first**.

**Retention > acquisition (mid-long term).** Один хороший покупатель × 3 покупки > 3 новых × 1.

**Domain-специфика — обязательна.** Fashion, electronics, grocery — паттерны разные.

## Типовые вопросы ментора

Услышав «работаем в e-com», спрошу:

1. «Вертикаль — fashion / electronics / grocery / marketplace / нишевая?»
2. «Cart abandonment — какой? Ниже 70% или выше?»
3. «Чекаут в шагах?»
4. «Guest checkout есть?»
5. «Post-purchase experience есть — track, reviews, reorder?»
6. «Mobile-web traffic % — какой сейчас?»

## Как ментор отвечает (шаблон)

1. **Похвала.** «Хорошо, что видишь e-com как воронку, а не как каталог».
2. **Диагноз.** «Cart abandonment выше bench — воронка теряет на checkout» *(или)* «PDP без reviews — доверие не строится».
3. **Правило / паттерн.** Конкретный — 3-шаговый чекаут, guest checkout, filters с count'ами.
4. **Пример.** Из индустрии (Baymard research, Amazon pattern, Shopify Polaris).
5. **Метрика.** Что мерить (см. [product-metrics](../../flow/product-metrics/SKILL.md) e-com секцию).
6. **Следующий шаг.** «Спроси про [product-metrics] чтобы разложить воронку, или про [accessibility] — ADA-риски растут в e-com».

## Ловушки

- **Force sign-up.** Убивает 30% чекаутов.
- **Скрытые сборы / доставка.** Появляются в чекауте → 40% отвал.
- **Fake urgency.** «Осталось 2 места» когда 200 в стоке. Потеря доверия навсегда.
- **Filters без count.** Пользователь выбирает опцию → 0 товаров.
- **PDP без sizing/size guide.** В fashion = возврат.
- **Возврат через колл-центр.** Клиент раз, больше не вернётся.
- **Fake reviews.** Регуляторный риск + доверие.
- **Игнор mobile.** 60%+ traffic mobile, но макет desktop-first — теряешь.
- **A11y на потом.** ADA-иски растут — Amazon, Domino's судились.

## Источники

- **Baymard Institute.** [baymard.com](https://baymard.com/) — must-read для e-com UX. Глубокая quanti-research по checkout, PDP, search.
- **Growth.Design.** [Case studies](https://growth.design/case-studies) — реальные разборы.
- **NN/g.** [E-commerce UX](https://www.nngroup.com/topic/e-commerce/).
- **Shopify Polaris.** [polaris.shopify.com](https://polaris.shopify.com/) — образцовая система для e-com.
- **CXL.** [cxl.com](https://cxl.com/) — CRO и e-com оптимизация.

## Смежные скилы

- [discovery-delivery](../../orchestrator/discovery-delivery/SKILL.md) — линза поверх цикла
- [product-metrics](../../flow/product-metrics/SKILL.md) — e-com воронка
- [editorial-policy](../../flow/editorial-policy/SKILL.md) — product descriptions, empty states
- [accessibility](../../flow/accessibility/SKILL.md) — ADA-риски
- [fintech-ux](../fintech-ux/SKILL.md) — на границе при payments
