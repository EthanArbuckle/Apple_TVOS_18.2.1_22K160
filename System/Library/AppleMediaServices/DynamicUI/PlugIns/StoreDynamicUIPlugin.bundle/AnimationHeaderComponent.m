@interface AnimationHeaderComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin24AnimationHeaderComponent)init;
- (_TtC20StoreDynamicUIPlugin24AnimationHeaderComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AnimationHeaderComponent

- (_TtC20StoreDynamicUIPlugin24AnimationHeaderComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin24AnimationHeaderComponent *)sub_8AC0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_AAF4((SEL *)&selRef_prepareForReuse);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8D58();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_A6B8(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC20StoreDynamicUIPlugin24AnimationHeaderComponent)init
{
}

- (void).cxx_destruct
{
  swift_release();
}

@end