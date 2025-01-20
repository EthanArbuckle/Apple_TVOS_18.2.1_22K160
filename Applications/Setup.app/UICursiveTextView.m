@interface UICursiveTextView
- (UICursiveTextView)initWithFrame:(CGRect)a3;
- (float)duration;
- (void)configure;
- (void)layoutSubviews;
- (void)loadText:(id)a3 pointSize:(double)a4;
- (void)setFillColor:(id)a3;
- (void)setTime:(float)a3;
@end

@implementation UICursiveTextView

- (UICursiveTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UICursiveTextView;
  v3 = -[UICursiveTextView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[UICursiveTextView configure](v3, "configure");
  }
  return v4;
}

- (void)configure
{
  v3 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
  textLayer = self->textLayer;
  self->textLayer = v3;

  -[UICursiveTextView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->textLayer, "setFrame:");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[UICursiveTextView layer](self, "layer"));
  [v5 addSublayer:self->textLayer];
}

- (void)layoutSubviews
{
  textPath = self->textPath;
  -[CAShapeLayer bounds](self->textLayer, "bounds");
  if (textPath)
  {
    -[CursiveTextPath transformForRect:pointSize:flipped:](textPath, "transformForRect:pointSize:flipped:", 1LL);
  }

  else
  {
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    __int128 v4 = 0u;
  }

  *(_OWORD *)&self->textTransform.a = v4;
  *(_OWORD *)&self->textTransform.c = v5;
  *(_OWORD *)&self->textTransform.tx = v6;
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  id v6 = a3;
  v7 = -[CursiveTextPath initWithURL:](objc_alloc(&OBJC_CLASS___CursiveTextPath), "initWithURL:", v6);

  textPath = self->textPath;
  self->textPath = v7;

  if (self->textPath)
  {
    self->_pointSize = a4;
    v9 = self->textPath;
    -[CAShapeLayer bounds](self->textLayer, "bounds");
    if (v9)
    {
      -[CursiveTextPath transformForRect:pointSize:flipped:](v9, "transformForRect:pointSize:flipped:", 1LL);
    }

    else
    {
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v10 = 0u;
    }

    *(_OWORD *)&self->textTransform.a = v10;
    *(_OWORD *)&self->textTransform.c = v11;
    *(_OWORD *)&self->textTransform.tx = v12;
  }

- (float)duration
{
  textPath = self->textPath;
  if (!textPath) {
    return 0.0;
  }
  -[CursiveTextPath duration](textPath, "duration");
  return result;
}

- (void)setTime:(float)a3
{
  __int128 v4 = -[CursiveTextPath pathForTime:](self->textPath, "pathForTime:");
  CopyByTransformingPath = CGPathCreateCopyByTransformingPath(v4, &self->textTransform);
  -[CAShapeLayer setPath:](self->textLayer, "setPath:", CopyByTransformingPath);
  CGPathRelease(CopyByTransformingPath);
  CGPathRelease(v4);
}

- (void)setFillColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end