# GoldMarketPlatform — Entry Intelligence Upgrade V1

## الهدف

هذه المرحلة لا ترفع شروط الـScore ولا تجعل المدارس وحدها سبباً للدخول. تم فصل:

1. **Analytical Direction** — ماذا تقول المدارس والسياقات متعددة الفريمات؟
2. **Entry Timing** — هل السعر الآن في مكان صالح للدخول وهل ظهر Trigger حقيقي؟

## ما تم تغييره

- خفض حدود اكتشاف الفرص في `AdvancedDecisionEngine`:
  - Long Term: 60
  - Medium Term: 64
  - Scalping: 68
  - Sniper Hunt: 74
- تخفيض سقف `SchoolVote` إلى 14 لتقليل تضخيم الدرجات.
- منع تكرار احتساب ملخصات Fibonacci/Gann/Elliott/Supply-Demand كتصويت ثانٍ؛ دليل المدرسة يدخل عبر `SchoolVote` الخاص بفريمها.
- إضافة `EntryIntelligenceEngine`.
- ربط فريم Trigger بكل نوع:
  - Scalping → M1
  - Sniper Hunt → M1
  - Medium Term → M5
  - Long Term → H1
- دخول Scalping لا يصبح جاهزاً إلا مع Trigger سعري فعلي على M1، وليس بسبب Score مرتفع فقط.
- Sniper يحتاج Trigger أقوى (Structure + Sweep/Zone + Trigger إضافي).
- Medium/Long يحتاجان توافقاً بين المنطقة/الهيكل وTrigger مناسب.
- إضافة معلومات للـTradeCandidate: `EntryReady`, `EntryQualityScore`, `TriggerFrame`, `EntryEvidence`, `EntryBlockers`.
- تمرير `FrameCandles` إلى محرك القرار حتى لا يرجع Entry Engine إلى M5 مركزي عند تحليل M1.
- اعتماد MN ضمن متطلبات Long Term المستقبلية: MN + D1 + H4 + H1.
- تحديث واجهة القرار لإظهار درجة التحليل منفصلة عن جاهزية الدخول وجودة الـTrigger وفريم التنفيذ.

## مبدأ التشغيل الجديد

المنصة تستطيع الآن أن تقول:

> **الاتجاه صحيح، لكن لا دخول بعد.**

ثم تتحول إلى دخول فقط عندما يظهر Trigger سعري على فريم التنفيذ الصحيح.

## البيانات الحالية

قاعدة البيانات المرفقة تحتوي على نحو 74,384 Tick وتبدأ من 2026-09-02. لذلك W1/MN لا يمكن اعتبارهما تاريخياً مكتملين في هذه النسخة الحالية؛ هذا متوقع لأن المنصة ما زالت في مرحلة تجميع التاريخ. عندما يتوفر التاريخ، يتم استخدامه ضمن السلاسل المستقلة دون تصنيع M1 من M5.

## الاختبارات الجديدة

- `Scalping_DoesNotEnter_OnlyBecauseAnalysisDirectionExists`
- `Scalping_UsesRealM1Trigger_NotM5Alias`
- تحديث `OppositeEligibleCandidates_BlockFinalEntryButRemainVisible` ليختبر القرار مع السلاسل المستقلة.
- `LowerScoreThreshold_DoesNotBypass_EntryTriggerGate`

> ملاحظة: تم إجراء تدقيق ساكن للمصدر داخل بيئة العمل. لا يوجد .NET SDK في بيئة الفحص الحالية، لذلك لا أدّعي نجاح Build/Run محلياً بعد هذه التعديلات.
