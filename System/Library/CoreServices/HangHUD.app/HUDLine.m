@interface HUDLine
- (BOOL)updatesComplete;
- (CALayer)keyLayer;
- (CALayer)valueLayer;
- (HUDLine)init;
- (HUDLineDelegate)lineDelegate;
- (double)contentScaleForTexts;
- (double)preferredKeyLayerWidth;
- (double)preferredValueLayerWidth;
- (double)spacing;
- (void)layoutSublayers;
- (void)nilifyCALayers;
- (void)setFontSize:(double)a3;
- (void)setKeyLayer:(id)a3;
- (void)setLineDelegate:(id)a3;
- (void)setPreferredKeyLayerWidth:(double)a3;
- (void)setPreferredValueLayerWidth:(double)a3;
- (void)setSpacing:(double)a3;
- (void)setUpdatesComplete:(BOOL)a3;
- (void)setValueLayer:(id)a3;
@end

@implementation HUDLine

- (HUDLine)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HUDLine;
  v2 = -[HUDLine init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    LOBYTE(v2->super._attr.refcount) = 0;
    layer = v2->super._attr.layer;
    v2->super._attr.layer = 0LL;

    v5 = *(void **)&v3->_updatesComplete;
    *(void *)&v3->_updatesComplete = 0LL;

    v3->_keyLayer = 0LL;
    v3->_valueLayer = 0LL;
  }

  return v3;
}

- (void)nilifyCALayers
{
  layer = self->super._attr.layer;
  self->super._attr.layer = 0LL;

  v4 = *(void **)&self->_updatesComplete;
  *(void *)&self->_updatesComplete = 0LL;
}

- (void)setPreferredKeyLayerWidth:(double)a3
{
  if (v5 != a3)
  {
    *(double *)&self->_keyLayer = a3;
    -[HUDLine setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setPreferredValueLayerWidth:(double)a3
{
  if (v5 != a3)
  {
    *(double *)&self->_valueLayer = a3;
    -[HUDLine setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSublayers
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___HUDLine;
  -[HUDLine layoutSublayers](&v15, "layoutSublayers");
  keyLayer = self->_keyLayer;
  -[HUDLine bounds](self, "bounds");
  double v4 = CGRectGetWidth(v16) - *(double *)&self->_valueLayer - self->_preferredValueLayerWidth;
  [self->super._attr.layer preferredFrameSize];
  double v6 = v5;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[HUDLine keyLayer](self, "keyLayer"));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, *(double *)&keyLayer, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HUDLine valueLayer](self, "valueLayer"));
  if (v8)
  {
    [self->super._attr.layer frame];
    double v10 = self->_preferredValueLayerWidth + v9;
    valueLayer = self->_valueLayer;
    [*(id *)&self->_updatesComplete preferredFrameSize];
    double v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HUDLine valueLayer](self, "valueLayer"));
    objc_msgSend(v14, "setFrame:", v10, 0.0, *(double *)&valueLayer, v13);
  }

- (void)setFontSize:(double)a3
{
  id v3 = sub_1000031C4();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[HUDLine setFontSize:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s from HUDLine called. The derived classes's method should be called instead.",  (uint8_t *)&v5,  0xCu);
  }
}

- (BOOL)updatesComplete
{
  return self->super._attr.refcount;
}

- (void)setUpdatesComplete:(BOOL)a3
{
  LOBYTE(self->super._attr.refcount) = a3;
}

- (CALayer)keyLayer
{
  return (CALayer *)self->super._attr.layer;
}

- (void)setKeyLayer:(id)a3
{
}

- (CALayer)valueLayer
{
  return *(CALayer **)&self->_updatesComplete;
}

- (void)setValueLayer:(id)a3
{
}

- (double)preferredKeyLayerWidth
{
  return *(double *)&self->_keyLayer;
}

- (double)preferredValueLayerWidth
{
  return *(double *)&self->_valueLayer;
}

- (HUDLineDelegate)lineDelegate
{
  return (HUDLineDelegate *)objc_loadWeakRetained((id *)&self->_preferredKeyLayerWidth);
}

- (void)setLineDelegate:(id)a3
{
}

- (double)spacing
{
  return self->_preferredValueLayerWidth;
}

- (void)setSpacing:(double)a3
{
  self->_preferredValueLayerWidth = a3;
}

- (void).cxx_destruct
{
}

- (double)contentScaleForTexts
{
  double result = *(double *)&qword_100036658;
  if (*(double *)&qword_100036658 <= 0.0)
  {
    if (qword_100036608 != -1) {
      dispatch_once(&qword_100036608, &stru_100029A50);
    }
    if (byte_100036610)
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      [v1 bounds];
      double v2 = 1.0;
      if (v3 > 1920.0) {
        double v2 = 2.0;
      }
      qword_100036658 = *(void *)&v2;

      return *(double *)&qword_100036658;
    }

    else
    {
      double result = MGGetFloat32Answer(@"SNfDJgQFV2Xj7+WnozcJPw", -1.0);
      qword_100036658 = *(void *)&result;
    }
  }

  return result;
}

@end