@interface TVSBVolumeBulletinView
- (UIView)contentView;
@end

@implementation TVSBVolumeBulletinView

- (UIView)contentView
{
  return (UIView *)-[TVSBVolumeBulletinView containerView](self, "containerView", a2, self);
}

@end