# 🎨 Tailwind CSS — Пошаговое обучение с нуля

## Что такое Tailwind CSS

Tailwind — это CSS-фреймворк, где стили пишутся через классы прямо в HTML.

```html
<!-- Обычный CSS -->
<button class="my-button">Кнопка</button>

<style>
.my-button {
  padding: 8px 16px;
  background-color: #dc2626;
  color: white;
  border-radius: 8px;
}
.my-button:hover {
  background-color: #b91c1c;
}
</style>

<!-- Tailwind CSS -->
<button class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700">
  Кнопка
</button>
```

**Преимущества:**
- Не нужно переключаться между HTML и CSS файлами
- Консистентный дизайн (используешь те же отступы и цвета)
- Маленький размер бандла (tree-shaking)

---

## Урок 1: Отступы (Padding и Margin)

### Padding (внутренний отступ)

```
p-{size}   = padding со всех сторон
pt-{size}  = padding-top (сверху)
pb-{size}  = padding-bottom (снизу)
pl-{size}  = padding-left (слева)
pr-{size}  = padding-right (справа)
px-{size}  = padding по горизонтали (лево + право)
py-{size}  = padding по вертикали (верх + низ)
```

**Размеры:**
```
p-0  = 0px
p-1  = 4px
p-2  = 8px
p-3  = 12px
p-4  = 16px
p-5  = 20px
p-6  = 24px
p-8  = 32px
p-10 = 40px
p-12 = 48px
p-16 = 64px
p-20 = 80px
```

**Примеры:**
```html
<!-- Отступ со всех сторон 16px -->
<div class="p-4">Контент</div>

<!-- Отступ сверху и снизу 8px, слева и справа 16px -->
<div class="py-2 px-4">Контент</div>

<!-- Разные отступы -->
<div class="pt-8 pb-4 pl-6 pr-2">Контент</div>
```

### Margin (внешний отступ)

```
m-{size}   = margin со всех сторон
mt-{size}  = margin-top
mb-{size}  = margin-bottom
ml-{size}  = margin-left
mr-{size}  = margin-right
mx-{size}  = margin по горизонтали
my-{size}  = margin по вертикали
```

**Особые значения:**
```
m-auto     = автоматически (центрирование)
mx-auto    = центрирование по горизонтали
-ml-4      = отрицательный margin (-16px)
```

**Примеры:**
```html
<!-- Центрирование блока -->
<div class="mx-auto w-64">Центрирован</div>

<!-- Отступ снизу -->
<h1 class="mb-4">Заголовок</h1>
<p class="mb-8">Текст</p>

<!-- Отрицательный margin -->
<div class="-mt-4">Поднимается вверх</div>
```

---

## Урок 2: Размеры (Width и Height)

### Width (ширина)

```
w-{size}   = фиксированная ширина
w-full     = 100%
w-screen   = 100vw
w-auto     = auto
w-1/2      = 50%
w-1/3      = 33.333%
w-2/3      = 66.666%
w-1/4      = 25%
w-3/4      = 75%
```

**Размеры в пикселях:**
```
w-0   = 0px
w-1   = 4px
w-2   = 8px
w-4   = 16px
w-8   = 32px
w-16  = 64px
w-24  = 96px
w-32  = 128px
w-48  = 192px
w-64  = 256px
w-96  = 384px
```

**Примеры:**
```html
<!-- На всю ширину -->
<div class="w-full">Полная ширина</div>

<!-- Половина ширины -->
<div class="w-1/2">50%</div>

<!-- Фиксированная ширина -->
<div class="w-64">256px</div>
```

### Height (высота)

```
h-{size}   = фиксированная высота
h-full     = 100%
h-screen   = 100vh
h-auto     = auto
h-1/2      = 50%
```

**Примеры:**
```html
<!-- На всю высоту экрана -->
<div class="h-screen">На весь экран</div>

<!-- Минимальная высота -->
<div class="min-h-screen">Минимум на экран</div>
```

### Min/Max

```
min-w-0       min-w-full
max-w-xs      max-w-sm      max-w-md
max-w-lg      max-w-xl      max-w-2xl
max-w-full
```

**Примеры:**
```html
<!-- Ограничить максимальную ширину -->
<div class="max-w-xl mx-auto">
  Контент не шире 576px, центрирован
</div>
```

---

## Урок 3: Flexbox

### Включение Flex

```html
<div class="flex">
  <div>Элемент 1</div>
  <div>Элемент 2</div>
</div>
```

### Направление

```
flex-row         = горизонтально (по умолчанию)
flex-row-reverse = горизонтально наоборот
flex-col         = вертикально
flex-col-reverse = вертикально наоборот
```

```html
<!-- Вертикально -->
<div class="flex flex-col">
  <div>Сверху</div>
  <div>Снизу</div>
</div>
```

### Выравнивание по главной оси (justify)

```
justify-start     = в начале
justify-center    = по центру
justify-end       = в конце
justify-between   = равномерно (края прижаты)
justify-around    = равномерно (с отступами по краям)
justify-evenly    = абсолютно равномерно
```

```html
<!-- По центру -->
<div class="flex justify-center">
  <div>По центру</div>
</div>

<!-- По краям -->
<div class="flex justify-between">
  <div>Слева</div>
  <div>Справа</div>
</div>
```

### Выравнивание по поперечной оси (items)

```
items-start    = в начале
items-center   = по центру
items-end      = в конце
items-stretch  = растянуть (по умолчанию)
items-baseline = по базовой линии текста
```

```html
<!-- По центру по вертикали -->
<div class="flex items-center">
  <div class="h-8">Высокий</div>
  <div class="h-4">Низкий</div>
</div>
```

### Gap (расстояние между элементами)

```
gap-0   gap-1   gap-2   gap-3   gap-4
gap-6   gap-8   gap-10  gap-12  gap-16
```

```html
<div class="flex gap-4">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
<!-- Расстояние 16px между каждым -->
```

### Практический пример — Navbar

```html
<nav class="flex justify-between items-center p-4">
  <div class="text-xl font-bold">Logo</div>
  
  <div class="flex gap-6">
    <a href="#">Главная</a>
    <a href="#">Проекты</a>
    <a href="#">Контакты</a>
  </div>
</nav>
```

---

## Урок 4: Grid

### Включение Grid

```html
<div class="grid">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
```

### Количество колонок

```
grid-cols-1   = 1 колонка
grid-cols-2   = 2 колонки
grid-cols-3   = 3 колонки
grid-cols-4   = 4 колонки
grid-cols-6   = 6 колонок
grid-cols-12  = 12 колонок
```

```html
<!-- 3 колонки -->
<div class="grid grid-cols-3 gap-4">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
</div>
```

### Gap (расстояние)

```
gap-4    = одинаковый gap
gap-x-4  = gap по горизонтали
gap-y-4  = gap по вертикали
```

### Объединение ячеек (col-span)

```
col-span-2   = занимает 2 колонки
col-span-3   = занимает 3 колонки
col-span-full = занимает все колонки
```

```html
<div class="grid grid-cols-3 gap-4">
  <div class="col-span-2">Занимает 2 колонки</div>
  <div>1 колонка</div>
  <div>1 колонка</div>
  <div>1 колонка</div>
  <div>1 колонка</div>
</div>
```

### Практический пример — Карточки

```html
<!-- Сетка карточек -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <div class="bg-white p-6 rounded-lg">Карточка 1</div>
  <div class="bg-white p-6 rounded-lg">Карточка 2</div>
  <div class="bg-white p-6 rounded-lg">Карточка 3</div>
  <div class="bg-white p-6 rounded-lg">Карточка 4</div>
</div>
```

---

## Урок 5: Текст

### Размер текста

```
text-xs    = 12px
text-sm    = 14px
text-base  = 16px (по умолчанию)
text-lg    = 18px
text-xl    = 20px
text-2xl   = 24px
text-3xl   = 30px
text-4xl   = 36px
text-5xl   = 48px
text-6xl   = 60px
```

### Жирность

```
font-thin       = 100
font-light      = 300
font-normal     = 400
font-medium     = 500
font-semibold   = 600
font-bold       = 700
font-extrabold  = 800
```

### Выравнивание

```
text-left      = слева
text-center    = по центру
text-right     = справа
text-justify   = по ширине
```

### Цвет текста

```
text-black      text-white
text-gray-500   text-gray-700
text-red-500    text-red-700
text-blue-500   text-green-500
text-stone-600  text-stone-800
```

### Другое

```
uppercase      = ВЕРХНИЙ РЕГИСТР
lowercase      = нижний регистр
capitalize     = Первый Символ
normal-case    = обычный

underline      = подчёркнутый
line-through   = зачёркнутый
no-underline   = без подчёркивания

italic         = курсив
not-italic     = без курсива

truncate       = обрезать с многоточием
line-clamp-2   = максимум 2 строки
```

**Примеры:**
```html
<h1 class="text-4xl font-bold text-stone-800">Заголовок</h1>

<p class="text-sm text-gray-600">Подзаголовок</p>

<p class="text-lg text-center">По центру</p>

<p class="truncate">Очень длинный текст будет обрезан...</p>
```

---

## Урок 6: Цвета и фон

### Палитра цветов

Tailwind имеет встроенные палитры. Основные:

```
gray / stone   = серые
red            = красные
blue           = синие
green          = зелёные
yellow         = жёлтые
purple         = фиолетовые
```

### Оттенки (1-950)

```
50   = самый светлый
100
200
300
400
500  = базовый
600
700
800
900
950  = самый тёмный
```

### Цвет фона

```html
<div class="bg-white">Белый фон</div>
<div class="bg-gray-100">Светло-серый</div>
<div class="bg-stone-900">Тёмно-серый</div>
<div class="bg-red-500">Красный</div>
<div class="bg-red-700">Тёмно-красный</div>
```

### Цвет текста

```html
<p class="text-black">Чёрный текст</p>
<p class="text-white">Белый текст</p>
<p class="text-gray-600">Серый текст</p>
<p class="text-red-600">Красный текст</p>
```

### Градиенты

```html
<!-- Простой градиент -->
<div class="bg-gradient-to-r from-white to-gray-100">
  От белого к серому (слева направо)
</div>

<!-- Направления -->
bg-gradient-to-t   = снизу вверх
bg-gradient-to-b   = сверху вниз
bg-gradient-to-l   = справа налево
bg-gradient-to-r   = слева направо
bg-gradient-to-tr  = к верхнему правому
bg-gradient-to-br  = к нижнему правому

<!-- 3 цвета -->
<div class="bg-gradient-to-r from-red-500 via-yellow-500 to-green-500">
  Радуга
</div>
```

### Прозрачность

```html
<div class="bg-black/50">Чёрный 50% прозрачности</div>
<div class="bg-red-500/75">Красный 75% прозрачности</div>
<p class="text-black/60">Текст 60% прозрачности</p>
```

---

## Урок 7: Границы (Borders)

### Толщина границы

```
border        = 1px (по умолчанию)
border-0      = без границы
border-2      = 2px
border-4      = 4px
border-8      = 8px
```

### Стороны

```
border        = со всех сторон
border-t      = сверху
border-b      = снизу
border-l      = слева
border-r      = справа
border-x      = слева и справа
border-y      = сверху и снизу
```

### Цвет границы

```html
<div class="border border-gray-300">Серая граница</div>
<div class="border-2 border-red-500">Красная граница 2px</div>
<div class="border-b-2 border-black">Только снизу</div>
```

### Скругление (border-radius)

```
rounded-none   = 0
rounded-sm     = 2px
rounded        = 4px
rounded-md     = 6px
rounded-lg     = 8px
rounded-xl     = 12px
rounded-2xl    = 16px
rounded-3xl    = 24px
rounded-full   = 50% (круг)
```

**Отдельные углы:**
```
rounded-t-lg   = сверху
rounded-b-lg   = снизу
rounded-l-lg   = слева
rounded-r-lg   = справа
```

**Примеры:**
```html
<div class="border rounded-lg p-4">
  Карточка со скруглёнными углами
</div>

<div class="rounded-full w-12 h-12 bg-red-500">
  Круг
</div>

<img class="rounded-full w-16 h-16" src="avatar.jpg">
```

---

## Урок 8: Hover и состояния

### Hover

```html
<!-- Изменение цвета при наведении -->
<button class="bg-red-500 hover:bg-red-700">
  Наведи на меня
</button>

<!-- Изменение цвета текста -->
<a class="text-gray-700 hover:text-red-600">
  Ссылка
</a>

<!-- Подчёркивание при наведении -->
<a class="hover:underline">
  Ссылка
</a>
```

### Active (нажатие)

```html
<button class="bg-red-500 hover:bg-red-700 active:bg-red-900">
  Кнопка
</button>
```

### Focus (фокус)

```html
<input class="border focus:border-red-500 focus:ring-2 focus:ring-red-200">
```

### Cursor

```
cursor-pointer    = рука (ссылка)
cursor-default    = стрелка
cursor-wait       = загрузка
cursor-not-allowed = запрещено
```

```html
<button class="cursor-pointer">Кликабельно</button>
<button class="cursor-not-allowed opacity-50">Недоступно</button>
```

---

## Урок 9: Тени и эффекты

### Box Shadow

```
shadow-sm      = маленькая
shadow         = средняя
shadow-md      = средняя+
shadow-lg      = большая
shadow-xl      = очень большая
shadow-2xl     = огромная
shadow-none    = без тени
```

```html
<div class="bg-white rounded-lg shadow-md p-6">
  Карточка с тенью
</div>

<div class="bg-white rounded-xl shadow-xl p-6">
  Карточка с большой тенью
</div>
```

### Тень при hover

```html
<div class="shadow-md hover:shadow-xl transition-shadow">
  Тень увеличивается при наведении
</div>
```

### Opacity (прозрачность)

```
opacity-0     = 0%
opacity-25    = 25%
opacity-50    = 50%
opacity-75    = 75%
opacity-100   = 100%
```

```html
<div class="opacity-50 hover:opacity-100">
  Становится ярче при наведении
</div>
```

---

## Урок 10: Анимации и переходы

### Transition (плавные переходы)

```
transition             = все свойства
transition-colors      = только цвета
transition-opacity     = только прозрачность
transition-shadow      = только тень
transition-transform   = только трансформации
transition-all         = всё
```

### Длительность

```
duration-75    = 75ms
duration-100   = 100ms
duration-150   = 150ms
duration-200   = 200ms
duration-300   = 300ms (стандарт)
duration-500   = 500ms
duration-700   = 700ms
duration-1000  = 1000ms
```

### Transform (трансформации)

```
scale-95    = уменьшить до 95%
scale-100   = 100%
scale-105   = увеличить до 105%
scale-110   = увеличить до 110%

rotate-45   = повернуть на 45°
rotate-90   = повернуть на 90°
-rotate-45  = повернуть на -45°

translate-x-4   = сдвиг по X
translate-y-4   = сдвиг по Y
-translate-x-4  = сдвиг влево
-translate-y-4  = сдвиг вверх
```

### Примеры

```html
<!-- Плавное изменение цвета -->
<button class="bg-red-500 hover:bg-red-700 transition-colors duration-300">
  Кнопка
</button>

<!-- Карточка поднимается при наведении -->
<div class="hover:-translate-y-1 hover:shadow-xl transition-all duration-300">
  Карточка
</div>

<!-- Кнопка увеличивается -->
<button class="hover:scale-105 transition-transform">
  Кнопка
</button>

<!-- Комбо -->
<div class="
  bg-white rounded-lg shadow-md p-6
  hover:shadow-xl hover:-translate-y-1 hover:border-red-200
  border border-transparent
  transition-all duration-300
">
  Карточка
</div>
```

---

## Урок 11: Адаптивность (Responsive)

### Брейкпоинты

```
sm:    = 640px   (телефон горизонтально)
md:    = 768px   (планшет)
lg:    = 1024px  (ноутбук)
xl:    = 1280px  (десктоп)
2xl:   = 1536px  (большой экран)
```

### Принцип Mobile-First

Базовые стили для мобильных, префиксы для больших экранов:

```html
<!-- 1 колонка на мобильном, 2 на планшете, 3 на десктопе -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
  <div>1</div>
  <div>2</div>
  <div>3</div>
</div>
```

### Частые паттерны

```html
<!-- Скрыть на мобильном, показать на md+ -->
<div class="hidden md:block">
  Только для десктопа
</div>

<!-- Показать на мобильном, скрыть на md+ -->
<div class="md:hidden">
  Только для мобильного
</div>

<!-- Размер текста -->
<h1 class="text-2xl md:text-4xl lg:text-5xl">
  Заголовок
</h1>

<!-- Отступы -->
<div class="p-4 md:p-6 lg:p-8">
  Разные отступы
</div>

<!-- Flex направление -->
<div class="flex flex-col md:flex-row">
  Вертикально на мобильном, горизонтально на планшете+
</div>
```

### Практический пример

```html
<!-- Адаптивная карточка -->
<div class="
  grid 
  grid-cols-1 
  md:grid-cols-2 
  lg:grid-cols-3 
  gap-4 
  md:gap-6 
  lg:gap-8
">
  <div class="bg-white rounded-lg p-4 md:p-6">
    Карточка 1
  </div>
  <div class="bg-white rounded-lg p-4 md:p-6">
    Карточка 2
  </div>
  <div class="bg-white rounded-lg p-4 md:p-6">
    Карточка 3
  </div>
</div>
```

---

## Урок 12: Отображение и позиционирование

### Display

```
block        = блочный элемент
inline       = строчный элемент
inline-block = строчно-блочный
hidden       = скрыть
```

### Position

```
static      = обычное позиционирование
relative    = относительное
absolute    = абсолютное
fixed       = фиксированное
sticky      = липкое
```

### Z-index

```
z-0    z-10    z-20    z-30    z-40    z-50
```

### Примеры

```html
<!-- Sticky navbar -->
<nav class="sticky top-0 z-50 bg-white">
  Навигация прилипает к верху
</nav>

<!-- Модальное окно -->
<div class="fixed inset-0 z-50 bg-black/50">
  <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
    По центру экрана
  </div>
</div>

<!-- Скрыть элемент -->
<div class="hidden">Я скрыт</div>
```

---

## Урок 13: Группа (Group)

### group и group-hover

Позволяет стилизовать дочерние элементы при наведении на родителя:

```html
<div class="group bg-white p-6 rounded-lg hover:shadow-xl transition">
  <h3 class="text-lg group-hover:text-red-600 transition">
    Заголовок меняет цвет
  </h3>
  <p class="text-gray-600 group-hover:text-gray-900">
    Текст становится темнее
  </p>
  <span class="group-hover:translate-x-1 transition-transform inline-block">
    Стрелка → двигается
  </span>
</div>
```

### Практический пример — Карточка проекта

```html
<a href="#" class="group block">
  <article class="
    bg-white rounded-xl shadow-sm border border-gray-200 
    overflow-hidden 
    hover:shadow-xl hover:-translate-y-1 
    transition-all duration-300
  ">
    <!-- Изображение -->
    <div class="
      aspect-video bg-gradient-to-br from-gray-100 to-gray-200
      group-hover:from-red-50 group-hover:to-orange-50
      transition-colors duration-300
      flex items-center justify-center
    ">
      <span class="
        text-6xl opacity-30 
        group-hover:opacity-50 group-hover:scale-110 
        transition-all duration-300
      ">
        💻
      </span>
    </div>
    
    <!-- Контент -->
    <div class="p-5">
      <h3 class="
        text-lg font-bold 
        group-hover:text-red-700 
        transition-colors
      ">
        Название проекта
      </h3>
      <p class="text-gray-600 text-sm mt-2">
        Описание проекта
      </p>
      
      <span class="
        inline-flex items-center text-red-700 text-sm mt-4
        group-hover:gap-2 gap-1 transition-all
      ">
        Подробнее
        <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform">
          →
        </svg>
      </span>
    </div>
  </article>
</a>
```

---

## Урок 14: Практические компоненты

### Кнопка

```html
<!-- Основная кнопка -->
<button class="
  px-6 py-2.5
  bg-red-600 hover:bg-red-700 
  text-white font-medium
  rounded-lg
  transition-colors duration-300
">
  Кнопка
</button>

<!-- Кнопка с иконкой -->
<button class="
  inline-flex items-center gap-2
  px-4 py-2
  bg-red-600 hover:bg-red-700
  text-white
  rounded-lg
  transition
">
  <svg class="w-5 h-5">✓</svg>
  Сохранить
</button>

<!-- Кнопка-призрак -->
<button class="
  px-4 py-2
  text-red-600 hover:bg-red-50
  rounded-lg
  transition
">
  Отмена
</button>
```

### Карточка

```html
<div class="
  bg-white 
  rounded-xl 
  shadow-sm border border-stone-200 
  p-6
  hover:shadow-lg 
  transition-shadow
">
  <div class="text-4xl mb-4">🚀</div>
  <h3 class="text-lg font-bold text-stone-800 mb-2">
    Заголовок
  </h3>
  <p class="text-stone-600 text-sm">
    Описание карточки с какой-то информацией.
  </p>
</div>
```

### Форма

```html
<form class="space-y-6">
  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">
      Email
    </label>
    <input 
      type="email" 
      class="
        w-full px-4 py-2 
        border border-gray-300 rounded-lg
        focus:ring-2 focus:ring-red-500 focus:border-red-500
        outline-none
        transition
      "
      placeholder="your@email.com"
    >
  </div>
  
  <div>
    <label class="block text-sm font-medium text-gray-700 mb-1">
      Сообщение
    </label>
    <textarea 
      rows="4"
      class="
        w-full px-4 py-2 
        border border-gray-300 rounded-lg
        focus:ring-2 focus:ring-red-500 focus:border-red-500
        outline-none
        transition
      "
      placeholder="Ваше сообщение..."
    ></textarea>
  </div>
  
  <button class="
    w-full py-3
    bg-red-600 hover:bg-red-700
    text-white font-medium
    rounded-lg
    transition
  ">
    Отправить
  </button>
</form>
```

### Alert (уведомление)

```html
<!-- Успех -->
<div class="bg-green-50 border-l-4 border-green-500 p-4 rounded-r">
  <p class="text-green-700">Успешно сохранено!</p>
</div>

<!-- Ошибка -->
<div class="bg-red-50 border-l-4 border-red-500 p-4 rounded-r">
  <p class="text-red-700">Произошла ошибка!</p>
</div>

<!-- Предупреждение -->
<div class="bg-yellow-50 border-l-4 border-yellow-500 p-4 rounded-r">
  <p class="text-yellow-700">Внимание!</p>
</div>
```

---

## Урок 15: Шпаргалка классов

### Отступы
```
p-{n} pt-{n} pb-{n} pl-{n} pr-{n} px-{n} py-{n}
m-{n} mt-{n} mb-{n} ml-{n} mr-{n} mx-{n} my-{n}
```

### Размеры
```
w-{n} w-full w-screen w-1/2 w-auto
h-{n} h-full h-screen
max-w-{n} min-w-{n}
```

### Flexbox
```
flex inline-flex flex-row flex-col
justify-{start|center|end|between}
items-{start|center|end|stretch}
gap-{n} flex-{1} flex-wrap
```

### Grid
```
grid grid-cols-{n} gap-{n}
col-span-{n} row-span-{n}
```

### Текст
```
text-{xs|sm|base|lg|xl|2xl|...|6xl}
font-{thin|light|normal|medium|semibold|bold}
text-{left|center|right|justify}
text-{color}-{shade}
```

### Фон
```
bg-{color}-{shade}
bg-gradient-to-{direction}
from-{color} via-{color} to-{color}
```

### Границы
```
border border-{n} border-{side} border-{color}
rounded rounded-{n} rounded-{side} rounded-full
```

### Эффекты
```
shadow-{sm|md|lg|xl|2xl}
opacity-{n}
transition transition-{property} duration-{n}
```

### Трансформации
```
scale-{n} rotate-{n}
translate-x-{n} translate-y-{n}
```

### Состояния
```
hover:{class}
active:{class}
focus:{class}
group group-hover:{class}
```

### Адаптивность
```
sm:{class}   >= 640px
md:{class}   >= 768px
lg:{class}   >= 1024px
xl:{class}   >= 1280px
```

---

## Практическое задание

Создай компонент "Карточка проекта" со следующими требованиями:

1. **Структура:**
   - Изображение (aspect-video)
   - Заголовок
   - Описание (максимум 2 строки)
   - Бейджи технологий
   - Ссылка "Подробнее"

2. **Стили:**
   - Белый фон, скруглённые углы
   - Тень при наведении
   - Поднимается при наведении (-translate-y-1)
   - Заголовок становится красным при наведении
   - Градиент на изображении меняется при наведении

3. **Адаптивность:**
   - В сетке: 1 колонка (mobile), 2 (tablet), 3 (desktop)

```html
<!-- Решение -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <a href="#" class="group block">
    <article class="bg-white rounded-xl shadow-sm border border-stone-200 overflow-hidden hover:shadow-xl hover:-translate-y-1 hover:border-red-200 transition-all duration-300">
      <div class="aspect-video bg-gradient-to-br from-stone-100 to-stone-200 group-hover:from-red-50 group-hover:to-orange-50 transition-colors duration-300 flex items-center justify-center">
        <span class="text-6xl opacity-30 group-hover:opacity-50 group-hover:scale-110 transition-all duration-300">💻</span>
      </div>
      <div class="p-5">
        <h3 class="text-lg font-bold text-stone-800 group-hover:text-red-700 transition-colors">Название проекта</h3>
        <p class="text-stone-600 text-sm mt-2 line-clamp-2">Описание проекта с какой-то информацией о нём.</p>
        <div class="flex flex-wrap gap-1.5 mt-4">
          <span class="px-2 py-0.5 bg-stone-100 group-hover:bg-red-50 text-stone-600 group-hover:text-red-700 text-xs rounded-full transition-colors">Ruby</span>
          <span class="px-2 py-0.5 bg-stone-100 group-hover:bg-red-50 text-stone-600 group-hover:text-red-700 text-xs rounded-full transition-colors">Rails</span>
          <span class="px-2 py-0.5 bg-stone-100 group-hover:bg-red-50 text-stone-600 group-hover:text-red-700 text-xs rounded-full transition-colors">PostgreSQL</span>
        </div>
      </div>
      <div class="px-5 pb-5">
        <span class="inline-flex items-center text-red-700 text-sm font-medium group-hover:gap-2 gap-1 transition-all">
          Подробнее
          <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
          </svg>
        </span>
      </div>
    </article>
  </a>
</div>
```

---

*Освоил? Теперь примени знания в проекте!*
