# تقرير إصلاح أخطاء الـBuild

- إصلاح مرجع المتغير `c` غير الموجود داخل ConfluenceEngine: أصبحت تحليلات المدارس المحلية تستخدم سلسلة الشموع الخاصة بالفريم من `frameCandles`، مع مسار Legacy آمن عند عدم توفرها.
- إضافة تمرير `FrameCandles` من MarketPipeline إلى ConfluenceEngine.
- معالجة nullability عند تمرير Liquidity/OB/FVG.
- حذف `obj/bin` القديمة من الحزمة حتى لا تُستخدم Metadata stale من Build سابق.
- خطأ Metadata DLL كان خطأً تابعًا لفشل تجميع MainBrain؛ بعد إصلاح المصدر يجب أن يُعاد بناء المشاريع بالترتيب الطبيعي.

## ملاحظة
لم يتم تشغيل `dotnet build` في بيئة الإعداد الحالية لعدم توفر .NET SDK؛ لذلك يلزم Build فعلي على جهازك للتحقق النهائي.
