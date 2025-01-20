@interface DynamicButton
- (BOOL)hasContent;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC19CoreDynamicUIPlugin13DynamicButton)init;
- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation DynamicButton

- (_TtC19CoreDynamicUIPlugin13DynamicButton)init
{
  return (_TtC19CoreDynamicUIPlugin13DynamicButton *)sub_1A088();
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_1A144();

  return v3 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1A16C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  v6 = self;
  sub_1A204((uint64_t)a4);
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
  sub_1A308();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
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
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_DF18((uint64_t)v6, v5);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1A404();
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
  sub_1A41C();
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
  sub_1A49C(v6, (uint64_t)v7);
}

- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin13DynamicButton *)sub_1A814(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19CoreDynamicUIPlugin13DynamicButton)initWithCoder:(id)a3
{
  return (_TtC19CoreDynamicUIPlugin13DynamicButton *)sub_1A8E8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19CoreDynamicUIPlugin13DynamicButton_dynamicButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19CoreDynamicUIPlugin13DynamicButton_color));
}

@end