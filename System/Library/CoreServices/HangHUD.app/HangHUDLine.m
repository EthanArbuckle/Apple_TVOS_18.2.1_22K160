@interface HangHUDLine
- (CATextLayer)processNameLayer;
- (HUDDurationLayer)durationLayer;
- (HUDTheme)currentTheme;
- (HangHUDLine)initWithQueue:(id)a3 processName:(id)a4 theme:(id)a5 fontSize:(double)a6 lineDelegate:(id)a7;
- (int64_t)statusForHangWithDuration:(double)a3 timedOut:(BOOL)a4;
- (void)nilifyCALayers;
- (void)setCurrentTheme:(id)a3;
- (void)setFontSize:(double)a3;
- (void)update:(id)a3 options:(unint64_t)a4;
@end

@implementation HangHUDLine

- (HangHUDLine)initWithQueue:(id)a3 processName:(id)a4 theme:(id)a5 fontSize:(double)a6 lineDelegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___HangHUDLine;
  id v16 = -[HUDLine init](&v22, "init");
  if (v16)
  {
    [v16 setSpacing:sub_100014378()];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[CATextLayer layer](&OBJC_CLASS___CATextLayer, "layer"));
    v18 = (void *)*((void *)v16 + 9);
    *((void *)v16 + 9) = v17;

    [*((id *)v16 + 9) setTruncationMode:kCATruncationEnd];
    if (qword_100036528 != -1) {
      dispatch_once(&qword_100036528, &stru_100028CE8);
    }
    [*((id *)v16 + 9) setFont:qword_100036530];
    [*((id *)v16 + 9) setFontSize:a6];
    [v16 contentScaleForTexts];
    objc_msgSend(*((id *)v16 + 9), "setContentsScale:");
    [*((id *)v16 + 9) setString:v13];
    [v16 setVibrancyFilter:*((void *)v16 + 9)];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[HUDDurationLayer layer](&OBJC_CLASS___HUDDurationLayer, "layer"));
    v20 = (void *)*((void *)v16 + 10);
    *((void *)v16 + 10) = v19;

    if (qword_100036538 != -1) {
      dispatch_once(&qword_100036538, &stru_100028D08);
    }
    [*((id *)v16 + 10) setFont:qword_100036540];
    [*((id *)v16 + 10) setFontSize:a6];
    [v16 contentScaleForTexts];
    objc_msgSend(*((id *)v16 + 10), "setContentsScale:");
    [*((id *)v16 + 10) setAlignmentMode:kCAAlignmentRight];
    [*((id *)v16 + 10) setQueue:v12];
    [v16 setVibrancyFilter:*((void *)v16 + 10)];
    [v16 addSublayer:*((void *)v16 + 9)];
    [v16 addSublayer:*((void *)v16 + 10)];
    objc_storeStrong((id *)v16 + 8, a5);
    [v16 setLineDelegate:v15];
    [v16 setKeyLayer:*((void *)v16 + 9)];
    [v16 setValueLayer:*((void *)v16 + 10)];
  }

  return (HangHUDLine *)v16;
}

- (void)nilifyCALayers
{
  double spacing = self->super._spacing;
  self->super._double spacing = 0.0;

  currentTheme = self->_currentTheme;
  self->_currentTheme = 0LL;
}

- (void)setFontSize:(double)a3
{
}

- (int64_t)statusForHangWithDuration:(double)a3 timedOut:(BOOL)a4
{
  if (a4) {
    return 3LL;
  }
  uint64_t v15 = v8;
  uint64_t v16 = v4;
  if ((sub_100014948() & 1) != 0) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](&OBJC_CLASS___HUDConfiguration, "sharedInstance"));
  }
  else {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  }
  id v13 = v12;
  id v14 = objc_msgSend(v12, "runloopHangTimeoutDurationMSec", v9, v15, v5, v16, v6, v7);

  else {
    return (double)(unint64_t)v14 * 0.222222222 <= a3;
  }
}

- (void)update:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (!-[HUDLine updatesComplete](self, "updatesComplete"))
  {
    id v8 = v6;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super._spacing animationForKey:@"foreground-color-fade-animation"]);
    if (v9)
    {
      id v10 = sub_1000031C4();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to update a HUD line with an animation in progress!",  buf,  2u);
      }

- (HUDTheme)currentTheme
{
  return (HUDTheme *)self->super._lineDelegate;
}

- (void)setCurrentTheme:(id)a3
{
}

- (CATextLayer)processNameLayer
{
  return *(CATextLayer **)&self->super._spacing;
}

- (HUDDurationLayer)durationLayer
{
  return (HUDDurationLayer *)self->_currentTheme;
}

- (void).cxx_destruct
{
}

@end