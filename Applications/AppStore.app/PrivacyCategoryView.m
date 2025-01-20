@interface PrivacyCategoryView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDataTypesLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore19PrivacyCategoryView)initWithCoder:(id)a3;
- (_TtC8AppStore19PrivacyCategoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PrivacyCategoryView

- (_TtC8AppStore19PrivacyCategoryView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore19PrivacyCategoryView *)sub_100022474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore19PrivacyCategoryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_dataTypesLabel) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_category) = 0LL;
  id v4 = a3;

  result = (_TtC8AppStore19PrivacyCategoryView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/PrivacyCategoryView.swift",  34LL,  2LL,  85LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100022A48();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_10002340C((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDataTypesLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_dataTypesLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_dataTypesLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19PrivacyCategoryView_category));
}

@end