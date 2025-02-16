@interface SpacerComponent
- (BOOL)canBecomeFocused;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC19CoreDynamicUIPlugin15SpacerComponent)init;
- (_TtC19CoreDynamicUIPlugin15SpacerComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SpacerComponent

- (_TtC19CoreDynamicUIPlugin15SpacerComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin15SpacerComponent *)sub_53A10( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_53AB4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_53E30((SEL *)&selRef_layoutSubviews);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_53BB4(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC19CoreDynamicUIPlugin15SpacerComponent)init
{
}

- (void).cxx_destruct
{
}

@end