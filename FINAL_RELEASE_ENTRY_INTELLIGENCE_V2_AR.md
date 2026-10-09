# GoldMarketPlatform — Final Release Entry Intelligence V2

## الهدف
هذه النسخة تكمل الانتقال من "تجميع درجات المدارس" إلى منظومة تحليل + سياق + Trigger دخول. الهدف ليس رفع السكور، بل تقليل التضخيم وجعل جودة الدليل أهم من الرقم.

## المدارس
- Market Structure / BOS / CHoCH / Swing / Liquidity: باقية كأساس هيكلي.
- Fibonacci: swing-based، retracement context، golden-zone فقط عند قرب السعر من المستوى، وإضافات extension.
- Gann: تقسيمات 8 أجزاء، extensions، fan، price/time alignment، ودورة زمنية من anchor مؤكد.
- Elliott: pivots متناوبة، سيناريو ABC، مرشح 1-2-3-4-5 مع فحوص Wave 2 وWave 4 وinvalidation وprojection وcompletion، مع alternative scenario.
- Supply/Demand: مناطق مبنية على displacement + fallback wick zones، مع freshness، mitigation/touches، broken state، reaction strength وranking.
- OB/FVG: لا يكفي وجود المنطقة؛ القرب/الصلاحية أهم من مجرد وجودها.
- Time Cycles وNews تبقى ضمن طبقة التحليل.

## MTF
السلاسل الرسمية تبقى مستقلة: M1, M5, M15, M30, H1, H4, D1, W1, MN. لا يتم إنشاء M1 من M5.

## أنواع الصفقات
- Scalp: M1/M5/M15، Trigger على M1.
- Sniper: M1/M5/M15، Trigger على M1.
- Medium: M5/M15/H1/H4، Trigger على M5.
- Long: H1/H4/D1/MN، Trigger على H1. عند اكتمال البيانات الشهرية يصبح MN جزءًا من القرار تلقائيًا.

## تغيير الدرجات
تم خفض thresholds إلى:
- Long 55
- Medium 58
- Scalp 60
- Sniper 65

وأصبح score مبنيًا على directional balance × evidence quality بدل baseline 50، لذلك لا تظهر الأدلة الضعيفة كأنها 50% جاهزية تلقائية.

## Entry Intelligence
التحليل لا يساوي دخولًا. الدخول يحتاج إلى مجموعة من:
- liquidity sweep/rejection أو structure trigger
- displacement
- قرب منطقة حقيقية OB/FVG/Supply-Demand
- منع الدخول عندما يكون السعر ممتدًا دون confirmation
- Trigger مختلف حسب نوع الصفقة

الهدف: منع الحالة "التحليل صحيح لكن مكان الدخول خطأ"، مع عدم إعادة المنصة إلى حالة "لا تدخل أي صفقة" بسبب threshold مبالغ فيه.

## اختبارات
أضيفت SchoolDepthTests للتحقق من أن المدارس تنتج سياقًا فعليًا وليس مجرد score، مع بقاء اختبارات M1/M5 وEntry Intelligence السابقة.

## ملاحظة Build
هذه البيئة لا تحتوي .NET 8 SDK، لذلك لم يتم الادعاء بأن build/test التنفيذي نجح هنا. يجب تشغيل `BUILD_AND_TEST_FINAL.ps1` على Windows مع .NET 8 SDK قبل التداول الحقيقي.
