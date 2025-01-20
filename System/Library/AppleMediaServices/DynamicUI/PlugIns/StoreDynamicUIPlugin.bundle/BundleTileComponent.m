@interface BundleTileComponent
- (BOOL)isHighlighted;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)init;
- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BundleTileComponent

- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin19BundleTileComponent *)sub_36440( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_366FC();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_3676C(a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_367C4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_36870();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  sub_36BF8();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_36EC0((uint64_t)a3);
}

- (_TtC20StoreDynamicUIPlugin19BundleTileComponent)init
{
}

- (void).cxx_destruct
{
}

@end