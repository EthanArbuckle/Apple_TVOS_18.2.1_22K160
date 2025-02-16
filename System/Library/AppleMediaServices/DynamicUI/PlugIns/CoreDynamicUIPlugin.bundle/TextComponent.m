@interface TextComponent
- (BOOL)canBecomeFocused;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC19CoreDynamicUIPlugin13TextComponent)init;
- (_TtC19CoreDynamicUIPlugin13TextComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TextComponent

- (_TtC19CoreDynamicUIPlugin13TextComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin13TextComponent *)sub_55F6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_560E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_56178();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  double v10 = sub_56278(width, height, a4, a5);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (_TtC19CoreDynamicUIPlugin13TextComponent)init
{
}

- (void).cxx_destruct
{
}

@end