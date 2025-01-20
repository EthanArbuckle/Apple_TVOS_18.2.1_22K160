@interface BundleListComponent
- (BOOL)canBecomeFocused;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin19BundleListComponent)init;
- (_TtC20StoreDynamicUIPlugin19BundleListComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BundleListComponent

- (_TtC20StoreDynamicUIPlugin19BundleListComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin19BundleListComponent *)sub_2D434( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2D544();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2DA74();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  sub_2DC20();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC20StoreDynamicUIPlugin19BundleListComponent)init
{
}

- (void).cxx_destruct
{
}

@end