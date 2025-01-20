@interface AppLockupComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)init;
- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AppLockupComponent

- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin18AppLockupComponent *)sub_F024( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_F5CC();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_F87C(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_FACC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_FBA4(a3);
}

- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)init
{
}

- (void).cxx_destruct
{
}

@end