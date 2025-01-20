@interface BreakoutDetailsView
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSArray)preferredFocusEnvironments;
- (UIView)accessibilityCallToActionButton;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityBadgeLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore19BreakoutDetailsView)initWithCoder:(id)a3;
- (_TtC8AppStore19BreakoutDetailsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BreakoutDetailsView

- (_TtC8AppStore19BreakoutDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F4D8C();
}

  ;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  id v3 = sub_1000EF9C0();

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t ObjectType = swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  v9 = self;
  double v10 = sub_1000F46C8((uint64_t)a4, (uint64_t)v9, ObjectType, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  swift_unknownObjectRelease(a4);

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1000F421C((uint64_t)v5, (uint64_t)v5, width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000F29A0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  id v4 = a3;
  id v5 = v6.receiver;
  -[BreakoutDetailsView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1000F0F40();
  sub_1000F2340();
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityBadgeLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_badgeLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_descriptionLabel));
}

- (UIView)accessibilityCallToActionButton
{
  return (UIView *)sub_1000F36C4();
}

- (_TtC8AppStore19BreakoutDetailsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore19BreakoutDetailsView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.BreakoutDetailsView",  28LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButton));

  sub_10002BDF4( (uint64_t)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_config,  type metadata accessor for BreakoutDetailsView.Config);
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_detailTextAlignment;
  uint64_t v4 = type metadata accessor for BreakoutDetails.TextAlignment(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_detailBackgroundStyle;
  uint64_t v6 = type metadata accessor for BreakoutDetails.BackgroundStyle(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  double v7 = (char *)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_badge;
  uint64_t v8 = type metadata accessor for BreakoutDetails.Badge(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
}

@end