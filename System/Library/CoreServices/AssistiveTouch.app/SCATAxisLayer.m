@interface SCATAxisLayer
+ (double)lineLayerMaxWidth;
+ (double)rangeLayerBorderWidth;
+ (double)rangeLayerMaxWidth;
- (BOOL)isAnimatingForwards;
- (CALayer)compositingLayer;
- (CALayer)foregroundLayer;
- (SCATAxisLayer)initWithAxis:(int)a3;
- (id)description;
- (int)axis;
- (int)theme;
- (void)setAxis:(int)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setCompositingLayer:(id)a3;
- (void)setForegroundLayer:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTheme:(int)a3;
- (void)updateLayerTreePosition:(CGPoint)a3;
@end

@implementation SCATAxisLayer

+ (double)rangeLayerMaxWidth
{
  return 100.0;
}

+ (double)rangeLayerBorderWidth
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  else {
    double v3 = 2.0;
  }

  return v3;
}

+ (double)lineLayerMaxWidth
{
  return 3.0;
}

- (SCATAxisLayer)initWithAxis:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATAxisLayer;
  v4 = -[SCATAxisLayer init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    -[SCATAxisLayer setAxis:](v4, "setAxis:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    -[SCATAxisLayer addSublayer:](v5, "addSublayer:", v6);
    -[SCATAxisLayer setForegroundLayer:](v5, "setForegroundLayer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    -[SCATAxisLayer setCompositingLayer:](v5, "setCompositingLayer:", v7);
    -[SCATAxisLayer addSublayer:](v5, "addSublayer:", v7);
  }

  return v5;
}

- (id)description
{
  v4 = NSStringFromClass(v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[SCATAxisLayer axis](self, "axis")));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[SCATAxisLayer theme](self, "theme")));
  -[SCATAxisLayer position](self, "position");
  v5 = NSStringFromCGPoint(v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer presentationLayer](self, "presentationLayer"));
  [v24 position];
  v6 = NSStringFromCGPoint(v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer animationKeys](self, "animationKeys"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByReplacingOccurrencesOfString:@"\n" withString:@" "]);
  id v7 = -[SCATAxisLayer backgroundColor](self, "backgroundColor");
  id v8 = -[SCATAxisLayer borderColor](self, "borderColor");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  [v10 frame];
  v11 = NSStringFromCGRect(v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  id v14 = [v13 backgroundColor];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer foregroundLayer](self, "foregroundLayer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@<%p>. axis:%@ theme:%@ position:%@ presentationPosition:%@ animations:%@ bgColor:%@ borderColor:%@ (fg-layer:%p frame:%@ bgColor:%@ borderColor:%@)",  v25,  self,  v23,  v21,  v19,  v17,  v18,  v7,  v8,  v9,  v12,  v14,  [v15 borderColor]));

  return v26;
}

- (void)updateLayerTreePosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  -[SCATAxisLayer setPosition:](self, "setPosition:", x, y);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (BOOL)isAnimatingForwards
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer animationKeys](self, "animationKeys", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    unsigned __int8 v7 = 1;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 rangeOfString:@"SCATRangeAnimationID"] != (id)0x7FFFFFFFFFFFFFFFLL
          || [v9 rangeOfString:@"SCATLineAnimationID"] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer animationForKey:](self, "animationForKey:", v9));
          unsigned __int8 v7 = [v10 forwardDirection];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7 & 1;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATAxisLayer;
  -[SCATAxisLayer setBackgroundColor:](&v6, "setBackgroundColor:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](self, "compositingLayer"));
  [v5 setBackgroundColor:a3];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATAxisLayer;
  -[SCATAxisLayer setFrame:](&v8, "setFrame:", a3.origin.x, a3.origin.y);
  double y = CGPointZero.y;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAxisLayer compositingLayer](self, "compositingLayer"));
  objc_msgSend(v7, "setFrame:", CGPointZero.x, y, width, height);
}

- (int)axis
{
  return self->super._attr.refcount;
}

- (void)setAxis:(int)a3
{
  self->super._attr.refcount = a3;
}

- (int)theme
{
  return self->super._attr.magic;
}

- (void)setTheme:(int)a3
{
  self->super._attr.magic = a3;
}

- (CALayer)foregroundLayer
{
  return (CALayer *)self->super._attr.layer;
}

- (void)setForegroundLayer:(id)a3
{
}

- (CALayer)compositingLayer
{
  return *(CALayer **)&self->_axis;
}

- (void)setCompositingLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end