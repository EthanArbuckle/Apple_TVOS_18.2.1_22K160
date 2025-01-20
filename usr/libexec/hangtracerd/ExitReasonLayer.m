@interface ExitReasonLayer
- (CATextLayer)exitReasonCodeTextLayer;
- (CATextLayer)exitReasonNamespaceTextLayer;
- (CGSize)preferredFrameSize;
- (ExitReasonLayer)initWithNamespaceLayer:(id)a3 codeLayer:(id)a4;
- (double)spaceBetweenTextLayers;
- (void)layoutSublayers;
- (void)nilifyCALayers;
@end

@implementation ExitReasonLayer

- (ExitReasonLayer)initWithNamespaceLayer:(id)a3 codeLayer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ExitReasonLayer;
  v9 = -[ExitReasonLayer init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->super._attr.layer, a3);
    objc_storeStrong((id *)&v10->_spaceBetweenTextLayers, a4);
    -[ExitReasonLayer addSublayer:](v10, "addSublayer:", v10->super._attr.layer);
    -[ExitReasonLayer addSublayer:](v10, "addSublayer:", *(void *)&v10->_spaceBetweenTextLayers);
    *(double *)&v10->super._attr.refcount = sub_100026184();
  }

  return v10;
}

- (void)nilifyCALayers
{
  layer = self->super._attr.layer;
  self->super._attr.layer = 0LL;

  double spaceBetweenTextLayers = self->_spaceBetweenTextLayers;
  self->_double spaceBetweenTextLayers = 0.0;
}

- (CGSize)preferredFrameSize
{
  uint64_t v9 = 0LL;
  v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  objc_super v12 = &unk_1000461BA;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExitReasonLayer sublayers](self, "sublayers"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100013B2C;
  v8[3] = &unk_100049268;
  v8[4] = self;
  v8[5] = &v9;
  [v3 enumerateObjectsUsingBlock:v8];

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSublayers
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ExitReasonLayer;
  -[ExitReasonLayer layoutSublayers](&v17, "layoutSublayers");
  [self->super._attr.layer preferredFrameSize];
  double v4 = v3 + *(double *)&self->super._attr.refcount;
  [*(id *)&self->_spaceBetweenTextLayers preferredFrameSize];
  double v6 = v4 + v5;
  -[ExitReasonLayer frame](self, "frame");
  double v8 = fmax(v7 - v6, 0.0);
  [self->super._attr.layer preferredFrameSize];
  double v10 = v9;
  -[ExitReasonLayer frame](self, "frame");
  objc_msgSend(self->super._attr.layer, "setFrame:", v8, 0.0, v10);
  [self->super._attr.layer frame];
  double v12 = v11;
  [self->super._attr.layer frame];
  double v14 = *(double *)&self->super._attr.refcount + v12 + v13;
  [*(id *)&self->_spaceBetweenTextLayers preferredFrameSize];
  double v16 = v15;
  -[ExitReasonLayer frame](self, "frame");
  objc_msgSend(*(id *)&self->_spaceBetweenTextLayers, "setFrame:", v14, 0.0, v16);
}

- (double)spaceBetweenTextLayers
{
  return *(double *)&self->super._attr.refcount;
}

- (CATextLayer)exitReasonNamespaceTextLayer
{
  return (CATextLayer *)self->super._attr.layer;
}

- (CATextLayer)exitReasonCodeTextLayer
{
  return *(CATextLayer **)&self->_spaceBetweenTextLayers;
}

- (void).cxx_destruct
{
}

@end