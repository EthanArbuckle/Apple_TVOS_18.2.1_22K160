@interface TVPMarimbaView
+ (Class)layerClass;
- (MPDocument)document;
- (TVPMarimbaView)initWithFrame:(CGRect)a3;
- (id)layer;
@end

@implementation TVPMarimbaView

- (TVPMarimbaView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPMarimbaView;
  v3 = -[TVPMarimbaView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVPMarimbaView setOpaque:](v3, "setOpaque:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView layer](v4, "layer"));
    [v5 setGeometryFlipped:1];
  }

  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MRMarimbaLayer, a2);
}

- (id)layer
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPMarimbaView;
  id v2 = -[TVPMarimbaView layer](&v10, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 document]);

  if (!v4)
  {
    [v3 setSlidesAreReadonly:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v5 scale];
    objc_msgSend(v3, "setContentsScale:");

    v6 = objc_alloc_init(&OBJC_CLASS___MPDocument);
    [v3 setDocument:v6];

    double y = CGPointZero.y;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v8 bounds];
    objc_msgSend(v3, "setFrame:", CGPointZero.x, y);
  }

  return v3;
}

- (MPDocument)document
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMarimbaView marimbaLayer](self, "marimbaLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 document]);

  return (MPDocument *)v3;
}

@end