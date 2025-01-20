@interface SRCompactLinkTappableTextView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SRCompactLinkTappableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)setSelectable:(BOOL)a3;
@end

@implementation SRCompactLinkTappableTextView

- (SRCompactLinkTappableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRCompactLinkTappableTextView;
  v4 = -[SRCompactLinkTappableTextView initWithFrame:textContainer:]( &v7,  "initWithFrame:textContainer:",  a4,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = v4;
  if (v4) {
    -[SRCompactLinkTappableTextView setSelectable:](v4, "setSelectable:", 1LL);
  }
  return v5;
}

- (void)setSelectable:(BOOL)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SRCompactLinkTappableTextView;
    -[SRCompactLinkTappableTextView setSelectable:](&v7, "setSelectable:", 1LL);
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"SRCompactLinkTappableTextView must be selectable",  0LL));
    objc_exception_throw(v3);
    -[SRCompactLinkTappableTextView pointInside:withEvent:](v4, v5, v8, v6);
  }

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  CGPoint v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView attributedText](self, "attributedText"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView closestPositionToPoint:](self, "closestPositionToPoint:", x, y));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView tokenizer](self, "tokenizer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rangeEnclosingPosition:v9 withGranularity:0 inDirection:3]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView beginningOfDocument](self, "beginningOfDocument"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 start]);
    id v14 = -[SRCompactLinkTappableTextView offsetFromPosition:toPosition:]( self,  "offsetFromPosition:toPosition:",  v12,  v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView attributedText](self, "attributedText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 attribute:NSLinkAttributeName atIndex:v14 effectiveRange:0]);
    unsigned __int8 v17 = v16 != 0LL;
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___SRCompactLinkTappableTextView;
    unsigned __int8 v17 = -[SRCompactLinkTappableTextView pointInside:withEvent:](&v19, "pointInside:withEvent:", v7, x, y);
  }

  return v17;
}

@end