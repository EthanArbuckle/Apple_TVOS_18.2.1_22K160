@interface TextHeaderComponent
- (BOOL)canBecomeFocused;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin19TextHeaderComponent)init;
- (_TtC20StoreDynamicUIPlugin19TextHeaderComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TextHeaderComponent

- (_TtC20StoreDynamicUIPlugin19TextHeaderComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin19TextHeaderComponent *)sub_A7214( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_A7534();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_A7730(width, height, a4);
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
  sub_A7970();
}

- (_TtC20StoreDynamicUIPlugin19TextHeaderComponent)init
{
}

- (void).cxx_destruct
{
}

@end