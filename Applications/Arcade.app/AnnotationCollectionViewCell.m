@interface AnnotationCollectionViewCell
- (BOOL)accessibilityCellIsExpanded;
- (BOOL)accessibilityIsSummaryExpandable;
- (BOOL)canBecomeFocused;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSArray)accessibilityDetailItems;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityLinkLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)overrideUserInterfaceStyle;
- (void)accessibilityLinkLabelTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
@end

@implementation AnnotationCollectionViewCell

- (int64_t)overrideUserInterfaceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[AnnotationCollectionViewCell overrideUserInterfaceStyle](&v3, "overrideUserInterfaceStyle");
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  id v4 = v5.receiver;
  -[AnnotationCollectionViewCell setOverrideUserInterfaceStyle:](&v5, "setOverrideUserInterfaceStyle:", a3);
  sub_1001AF9B8(0);
}

- (_TtC6Arcade28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade28AnnotationCollectionViewCell *)sub_1001AC52C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001AB7D4();
}

- (BOOL)canBecomeFocused
{
  uint64_t v3 = sub_1000031E8(&qword_1002E3B80);
  __chkstk_darwin(v3);
  objc_super v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_linkAction;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_linkAction, v13, 0LL, 0LL);
  sub_10001027C((uint64_t)v6, (uint64_t)v5, &qword_1002E3B80);
  uint64_t v7 = sub_1000031E8(&qword_1002DEA18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))(v5, 1LL, v7) == 1)
  {
    sub_100006060((uint64_t)v5, &qword_1002E3B80);
    char v8 = 0;
  }

  else
  {
    v9 = self;
    sub_100006060((uint64_t)v5, &qword_1002E3B80);
    char v10 = *((_BYTE *)&v9->super.super.super.super.super.super.isa
          + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_isExpanded);

    char v8 = v10 ^ 1;
  }

  return v8 & 1;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  char v8 = self;
  double v9 = sub_1001ACD80((uint64_t)a4, width, height);
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

- (void)layoutSubviews
{
  v2 = self;
  sub_1001AD01C();
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  double v11 = self;
  sub_1001ADDC0(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (NSArray)accessibilityDetailItems
{
  v2 = self;
  uint64_t v3 = sub_1001AE87C();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  v2 = self;
  BOOL v4 = sub_1001AB370((uint64_t)v2, v3);

  return v4;
}

- (void)accessibilityLinkLabelTapped
{
  v2 = self;
  sub_1001AED2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_summaryLabel));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_detailViewPool;
  uint64_t v4 = sub_1000031E8((uint64_t *)&unk_1002EAEA0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_detailViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_linkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_backgroundEffectView));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_titleText]);
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_explicitSummary]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_detailItems));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade28AnnotationCollectionViewCell_linkAction, &qword_1002E3B80);
}

@end