@interface MTUnplayedBackgroundCollectionReusableView
- (MTUnplayedBackgroundCollectionReusableView)initWithFrame:(CGRect)a3;
@end

@implementation MTUnplayedBackgroundCollectionReusableView

- (MTUnplayedBackgroundCollectionReusableView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTUnplayedBackgroundCollectionReusableView;
  v3 = -[MTUnplayedBackgroundCollectionReusableView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[MTUnplayedBackgroundCollectionReusableView setBackgroundColor:](v3, "setBackgroundColor:", v4);
  }

  return v3;
}

@end