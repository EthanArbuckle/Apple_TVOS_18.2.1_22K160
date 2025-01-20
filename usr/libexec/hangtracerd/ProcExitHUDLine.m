@interface ProcExitHUDLine
- (CATextLayer)exitedProcNameLayer;
- (ExitReasonLayer)exitReasonLayer;
- (ProcExitHUDLine)initWithProcExitRecord:(id)a3 theme:(id)a4 lineDelegate:(id)a5;
- (void)nilifyCALayers;
- (void)setFontSize:(double)a3;
- (void)update:(id)a3 options:(unint64_t)a4;
@end

@implementation ProcExitHUDLine

- (ProcExitHUDLine)initWithProcExitRecord:(id)a3 theme:(id)a4 lineDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ProcExitHUDLine;
  v11 = -[HUDLine init](&v31, "init");
  if (v11)
  {
    -[HUDLine setSpacing:](v11, "setSpacing:", sub_1000260D4());
    id v12 = [v9 currentProcessExitTextColor];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[CATextLayer layer](&OBJC_CLASS___CATextLayer, "layer"));
    lineDelegate = v11->super._lineDelegate;
    v11->super._lineDelegate = (HUDLineDelegate *)v13;

    -[HUDLineDelegate setTruncationMode:](v11->super._lineDelegate, "setTruncationMode:", kCATruncationEnd);
    if (qword_10005B4A8 != -1) {
      dispatch_once(&qword_10005B4A8, &stru_100049200);
    }
    -[HUDLineDelegate setFont:](v11->super._lineDelegate, "setFont:", qword_10005B4B0);
    sub_100025C2C();
    -[HUDLineDelegate setFontSize:](v11->super._lineDelegate, "setFontSize:");
    -[HUDLine contentScaleForTexts](v11, "contentScaleForTexts");
    -[HUDLineDelegate setContentsScale:](v11->super._lineDelegate, "setContentsScale:");
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 processName]);
    -[HUDLineDelegate setString:](v11->super._lineDelegate, "setString:", v15);

    -[HUDLineDelegate setForegroundColor:](v11->super._lineDelegate, "setForegroundColor:", v12);
    -[HUDLine setVibrancyFilter:](v11, "setVibrancyFilter:", v11->super._lineDelegate);
    context = objc_autoreleasePoolPush();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](&OBJC_CLASS___CATextLayer, "layer"));
    id v30 = v12;
    if (qword_10005B4C8 != -1) {
      dispatch_once(&qword_10005B4C8, &stru_100049240);
    }
    [v16 setFont:qword_10005B4D0];
    sub_100025C2C();
    objc_msgSend(v16, "setFontSize:");
    -[HUDLine contentScaleForTexts](v11, "contentScaleForTexts");
    objc_msgSend(v16, "setContentsScale:");
    [v16 setAlignmentMode:kCAAlignmentRight];
    v17 = objc_alloc_init(&OBJC_CLASS___NSString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", &off_1000509E0));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v8 exitReasonNamespace]));
    unsigned __int8 v20 = [v18 containsObject:v19];

    if ((v20 & 1) == 0)
    {
      id v21 = sub_100024684([v8 exitReasonNamespace]);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

      v17 = (NSString *)v22;
    }

    [v16 setString:v17];
    objc_msgSend(v16, "setForegroundColor:", objc_msgSend(v9, "processExitReasonNamespaceTextColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](&OBJC_CLASS___CATextLayer, "layer"));
    if (qword_10005B4B8 != -1) {
      dispatch_once(&qword_10005B4B8, &stru_100049220);
    }
    [v23 setFont:qword_10005B4C0];
    sub_100025C2C();
    objc_msgSend(v23, "setFontSize:");
    -[HUDLine contentScaleForTexts](v11, "contentScaleForTexts");
    objc_msgSend(v23, "setContentsScale:");
    [v23 setAlignmentMode:kCAAlignmentRight];
    id v24 = sub_1000255D8((int)[v8 exitReasonNamespace], (uint64_t)objc_msgSend(v8, "exitReasonCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    [v23 setString:v25];

    [v23 setForegroundColor:v30];
    v26 = -[ExitReasonLayer initWithNamespaceLayer:codeLayer:]( objc_alloc(&OBJC_CLASS___ExitReasonLayer),  "initWithNamespaceLayer:codeLayer:",  v16,  v23);
    double spacing = v11->super._spacing;
    *(void *)&v11->super._double spacing = v26;

    -[HUDLine setVibrancyFilter:](v11, "setVibrancyFilter:", *(void *)&v11->super._spacing);
    objc_autoreleasePoolPop(context);
    -[ProcExitHUDLine addSublayer:](v11, "addSublayer:", *(void *)&v11->super._spacing);
    -[ProcExitHUDLine addSublayer:](v11, "addSublayer:", v11->super._lineDelegate);
    -[HUDLine setKeyLayer:](v11, "setKeyLayer:", v11->super._lineDelegate);
    -[HUDLine setValueLayer:](v11, "setValueLayer:", *(void *)&v11->super._spacing);
    -[HUDLine setLineDelegate:](v11, "setLineDelegate:", v10);
  }

  return v11;
}

- (void)nilifyCALayers
{
  lineDelegate = self->super._lineDelegate;
  if (lineDelegate)
  {
    self->super._lineDelegate = 0LL;
  }

  double spacing = self->super._spacing;
  if (spacing != 0.0)
  {
    [*(id *)&spacing nilifyCALayers];
    double v5 = self->super._spacing;
    self->super._double spacing = 0.0;
  }

- (void)setFontSize:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._spacing exitReasonNamespaceTextLayer]);
  [v5 setFontSize:a3];

  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)&self->super._spacing exitReasonCodeTextLayer]);
  [v6 setFontSize:a3];
}

- (void)update:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  unsigned __int8 v7 = -[HUDLine updatesComplete](self, "updatesComplete");
  if ((v4 & 1) == 0 && (v7 & 1) == 0)
  {
    id v8 = sub_1000233A4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002C794(v6);
    }

    -[HUDLine setUpdatesComplete:](self, "setUpdatesComplete:", 1LL);
  }
}

- (CATextLayer)exitedProcNameLayer
{
  return (CATextLayer *)self->super._lineDelegate;
}

- (ExitReasonLayer)exitReasonLayer
{
  return *(ExitReasonLayer **)&self->super._spacing;
}

- (void).cxx_destruct
{
}

@end