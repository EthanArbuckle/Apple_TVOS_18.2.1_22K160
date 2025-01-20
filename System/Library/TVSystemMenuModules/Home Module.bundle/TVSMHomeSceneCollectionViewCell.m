@interface TVSMHomeSceneCollectionViewCell
- (UIViewController)lockupContainingViewController;
- (void)setLockupContainingViewController:(id)a3;
@end

@implementation TVSMHomeSceneCollectionViewCell

- (void)setLockupContainingViewController:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v6->_lockupContainingViewController != location[0])
  {
    objc_storeStrong((id *)&v6->_lockupContainingViewController, location[0]);
    v3 = v6;
    v4 = -[UIViewController view](v6->_lockupContainingViewController, "view");
    -[TVSMHomeSceneCollectionViewCell setLockupView:](v3, "setLockupView:");
  }

  objc_storeStrong(location, 0LL);
}

- (UIViewController)lockupContainingViewController
{
  return self->_lockupContainingViewController;
}

- (void).cxx_destruct
{
}

@end