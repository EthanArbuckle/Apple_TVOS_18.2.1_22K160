@interface DynamicButton
- (BOOL)hasContent;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC20StoreDynamicUIPlugin13DynamicButton)init;
- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation DynamicButton

- (_TtC20StoreDynamicUIPlugin13DynamicButton)init
{
  return (_TtC20StoreDynamicUIPlugin13DynamicButton *)sub_5C900();
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_5C9BC();

  return v3 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5C9E4();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  v6 = self;
  sub_5CA7C((uint64_t)a4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease(a4);

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_5CB80();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_5CC3C((uint64_t)v6, v5);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_5CC84();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5 = self;
  sub_5CC9C();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_5CD1C(v6, (uint64_t)v7);
}

- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin13DynamicButton *)sub_5D094(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3
{
  return (_TtC20StoreDynamicUIPlugin13DynamicButton *)sub_5D168(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin13DynamicButton_dynamicButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin13DynamicButton_color));
}

@end