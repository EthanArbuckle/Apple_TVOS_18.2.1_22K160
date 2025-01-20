@interface SCATModernPageControlHighlightView
- (NSLayoutConstraint)widthConstraint;
- (SCATModernPageControlHighlightView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation SCATModernPageControlHighlightView

- (SCATModernPageControlHighlightView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernPageControlHighlightView;
  v3 = -[SCATModernPageControlHighlightView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[SCATModernPageControlHighlightView setContentMode:](v3, "setContentMode:", 3LL);
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRect v11 = CGRectInset(v10, 2.0, 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath roundedRectBezierPath:withRoundedEdges:]( &OBJC_CLASS___UIBezierPath,  "roundedRectBezierPath:withRoundedEdges:",  15LL,  v11.origin.x,  v11.origin.y,  v11.size.width,  v11.size.height));
  [v9 menuPageControlHighlightedBorderLineWidth];
  objc_msgSend(v7, "setLineWidth:");
  v8 = (void *)objc_claimAutoreleasedReturnValue([v9 menuPageControlHighlightedBorderColor]);
  [v8 setStroke];

  [v7 stroke];
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end