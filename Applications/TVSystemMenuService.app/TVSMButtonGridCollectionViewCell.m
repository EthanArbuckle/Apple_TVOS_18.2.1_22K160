@interface TVSMButtonGridCollectionViewCell
- (TVSMButtonGridCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIViewController)lockupContainingViewController;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int64_t)style;
- (void)setLockupContainingViewController:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation TVSMButtonGridCollectionViewCell

- (TVSMButtonGridCollectionViewCell)initWithFrame:(CGRect)a3
{
  CGRect v9 = a3;
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSMButtonGridCollectionViewCell;
  v5 = -[TVSMButtonGridCollectionViewCell initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5) {
    v8->_style = 1LL;
  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v4;
}

- (void)setLockupContainingViewController:(id)a3
{
  objc_super v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v6->_lockupContainingViewController != location[0])
  {
    objc_storeStrong((id *)&v6->_lockupContainingViewController, location[0]);
    v3 = v6;
    v4 = -[UIViewController view](v6->_lockupContainingViewController, "view");
    -[TVSMButtonGridCollectionViewCell setLockupView:](v3, "setLockupView:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3) {
    self->_style = a3;
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  sub_10001B1AC();
  *(void *)&__int128 v9 = v3;
  *((void *)&v9 + 1) = v4;
  unint64_t v7 = v11->_style + 1;
  if (v7 <= 7) {
    __asm { BR              X8 }
  }

  id v8 = [location[0] copy];
  [v8 setSize:v9];
  id v6 = v8;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

  ;
}

- (UIViewController)lockupContainingViewController
{
  return self->_lockupContainingViewController;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end