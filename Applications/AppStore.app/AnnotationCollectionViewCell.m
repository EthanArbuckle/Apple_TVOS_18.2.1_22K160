@interface AnnotationCollectionViewCell
- (BOOL)accessibilityCellIsExpanded;
- (BOOL)accessibilityIsSummaryExpandable;
- (BOOL)canBecomeFocused;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSArray)accessibilityDetailItems;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityLinkLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3;
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
  sub_1001B8F94(0);
}

- (_TtC8AppStore28AnnotationCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28AnnotationCollectionViewCell *)sub_1001B5B08( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001B4DB0();
}

- (BOOL)canBecomeFocused
{
  uint64_t v3 = sub_1000038E8((uint64_t *)&unk_1002E8110);
  __chkstk_darwin(v3);
  objc_super v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkAction;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkAction, v13, 0LL, 0LL);
  sub_10000DF2C((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1002E8110);
  uint64_t v7 = sub_1000038E8(&qword_1002E26A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))(v5, 1LL, v7) == 1)
  {
    sub_1000077E0((uint64_t)v5, (uint64_t *)&unk_1002E8110);
    char v8 = 0;
  }

  else
  {
    v9 = self;
    sub_1000077E0((uint64_t)v5, (uint64_t *)&unk_1002E8110);
    char v10 = *((_BYTE *)&v9->super.super.super.super.super.super.isa
          + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_isExpanded);

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
  double v9 = sub_1001B635C((uint64_t)a4, width, height);
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
  sub_1001B65F8();
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_10000DFD4(0LL, (unint64_t *)&qword_1002E14D0, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B300();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  double v11 = self;
  sub_1001B739C(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (NSArray)accessibilityDetailItems
{
  v2 = self;
  uint64_t v3 = sub_1001B7E58();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_summaryLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityLinkLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkLabel));
}

- (BOOL)accessibilityCellIsExpanded
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_isExpanded);
}

- (BOOL)accessibilityIsSummaryExpandable
{
  v2 = self;
  BOOL v4 = sub_1001B494C((uint64_t)v2, v3);

  return v4;
}

- (void)accessibilityLinkLabelTapped
{
  v2 = self;
  sub_1001B8308();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_summaryLabel));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailViewPool;
  uint64_t v4 = sub_1000038E8(&qword_1002EF138);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailViews));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_backgroundEffectView));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_titleText]);
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_explicitSummary]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_detailItems));
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore28AnnotationCollectionViewCell_linkAction,  (uint64_t *)&unk_1002E8110);
}

@end