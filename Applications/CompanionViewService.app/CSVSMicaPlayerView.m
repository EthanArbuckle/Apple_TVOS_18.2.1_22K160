@interface CSVSMicaPlayerView
- (CGSize)intrinsicContentSize;
- (CSVSMicaPlayerView)initWithContentsOfURL:(id)a3 publishedObjectViewClassMap:(id)a4;
- (CSVSMicaPlayerView)initWithData:(id)a3 publishedObjectViewClassMap:(id)a4;
- (CSVSMicaPlayerView)initWithPackageName:(id)a3;
- (void)_commonInit;
@end

@implementation CSVSMicaPlayerView

- (CSVSMicaPlayerView)initWithData:(id)a3 publishedObjectViewClassMap:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSVSMicaPlayerView;
  v4 = -[CSVSMicaPlayerView initWithData:publishedObjectViewClassMap:]( &v7,  "initWithData:publishedObjectViewClassMap:",  a3,  a4);
  v5 = v4;
  if (v4) {
    -[CSVSMicaPlayerView _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (CSVSMicaPlayerView)initWithContentsOfURL:(id)a3 publishedObjectViewClassMap:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSVSMicaPlayerView;
  v4 = -[CSVSMicaPlayerView initWithContentsOfURL:publishedObjectViewClassMap:]( &v7,  "initWithContentsOfURL:publishedObjectViewClassMap:",  a3,  a4);
  v5 = v4;
  if (v4) {
    -[CSVSMicaPlayerView _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (CSVSMicaPlayerView)initWithPackageName:(id)a3
{
  id v4 = a3;
  v5 = -[NSDataAsset initWithName:](objc_alloc(&OBJC_CLASS___NSDataAsset), "initWithName:", v4);
  v6 = v5;
  if (v5)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDataAsset data](v5, "data"));
    v8 = -[CSVSMicaPlayerView initWithData:publishedObjectViewClassMap:]( self,  "initWithData:publishedObjectViewClassMap:",  v7,  0LL);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v9 URLForResource:v4 withExtension:@"caar"]);

    if (!v7)
    {
      v10 = 0LL;
      goto LABEL_6;
    }

    v8 = -[CSVSMicaPlayerView initWithContentsOfURL:publishedObjectViewClassMap:]( self,  "initWithContentsOfURL:publishedObjectViewClassMap:",  v7,  0LL);
  }

  self = v8;
  v10 = self;
LABEL_6:

  return v10;
}

- (void)_commonInit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView layer](self, "layer"));
  [v3 setFillMode:kCAFillModeBoth];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView layer](self, "layer"));
  [v4 setCompositingFilter:kCAFilterPlusL];

  -[CSVSMicaPlayerView setAlpha:](self, "setAlpha:", 0.75);
}

- (CGSize)intrinsicContentSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView subviews](self, "subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  if (v3)
  {
    [v3 bounds];
    CGFloat x = v13.origin.x;
    CGFloat y = v13.origin.y;
    CGFloat width = v13.size.width;
    CGFloat height = v13.size.height;
    CGFloat v8 = CGRectGetWidth(v13);
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CGFloat v9 = CGRectGetHeight(v14);
  }

  else
  {
    CGFloat v8 = UIViewNoIntrinsicMetric;
    CGFloat v9 = UIViewNoIntrinsicMetric;
  }

  double v10 = v8;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

@end