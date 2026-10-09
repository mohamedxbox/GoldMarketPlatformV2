# GoldMarketPlatform — Frame School & Entry Release V3

## الهدف
هذه النسخة لا تعتبر ارتفاع الـScore بحد ذاته إشارة دخول. تم فصل:

1. تحليل السوق والاتجاه.
2. Evidence المدارس لكل فريم.
3. بوابة الدخول الخاصة بنوع الصفقة.
4. اختيار الصفقة عند تعارض الآفاق الزمنية.

## ما تم تطويره

### استقلال المدارس حسب الفريم
`MasterAnalyticalEngine` أصبح ينتج `FrameSchoolAnalysis` مستقلًا لكل فريم متوفر فعليًا، ويشمل:

- Fibonacci
- Gann
- Elliott
- Supply/Demand
- Time Cycles

ولا يتم إنشاء M1 إذا لم توجد سلسلة M1 حقيقية.

### المدارس
- Fibonacci يستخدم swings مؤكدة حديثة وretracement + extensions.
- Gann يستخدم anchor هيكلي، تقسيمات 8 أجزاء، fan ratios، price/time cycles.
- Elliott يخرج سيناريو 3/5 موجات، confidence، invalidation، retracement، completion.
- Supply/Demand تم تحسين freshness وreaction بحيث لا تكون reaction مجرد شرط شمعة شبه دائم.
- Time Cycles أصبح مرتبطًا بآخر swing مؤكد بدل عدد الشموع الكلي فقط.
- Structure/Liquidity/OB/FVG تبقى ضمن MarketMap لكل فريم.

### Entry Intelligence
الاتجاه وحده لا يفتح صفقة. الدخول يحتاج Trigger على فريم التنفيذ:

- Scalping: M1
- Sniper: M1
- Medium: M5
- Long: H1

وتتم معاينة sweep/structure/displacement/zone قبل الدخول.

### تعارض الصفقات
اختلاف الآفاق الزمنية لا يلغي صفقة صحيحة تلقائيًا. إذا كانت فرصتان متعارضتان ومتقاربتين جدًا في جودة الدخول يبقى القرار WAIT؛ إذا كانت إحداهما أقوى بوضوح يفوز الأقوى.

## فحص الفرص الموجودة داخل النسخة
قاعدة `OpportunityHistory.json` تحتوي 4 سجلات، لكنها تمثل سجلين زمنيين مكررين لنوعين من الفرص، وجميعها SELL في 2026-09-02. لا توجد فيها نتيجة تنفيذية Win/Loss.

تمت مطابقة السجلات مع `GoldMarketTicks.db`. البيانات المتاحة بعد كل فرصة تنتهي عند 2026-09-02 19:02:23Z، ولم يصل السعر إلى SL أو TP1 لأي سجل قبل نهاية البيانات المتاحة. لذلك لا يمكن اعتبار هذه السجلات خسائر مؤكدة أو نجاحات مؤكدة؛ البيانات لا تحتوي horizon كافيًا للحكم.

هذا مهم: لا يتم اختلاق backtest نتيجة غير موجودة.

## اختبارات إضافية
- `FrameSchoolIndependenceTests`
- استقلال M1 عن M5.
- عدم إنشاء M1 صناعيًا من M5.
- إنتاج School Analysis مستقل لكل فريم.
- اختبارات Entry Intelligence الموجودة سابقًا.

## ملاحظة Build
بيئة الفحص الحالية لا تحتوي .NET SDK، لذلك لا أدعي نجاح `dotnet build` أو `dotnet test` هنا. يجب تشغيل `BUILD_AND_TEST_FINAL.ps1` على Windows مع .NET 8 SDK قبل التشغيل المباشر.
