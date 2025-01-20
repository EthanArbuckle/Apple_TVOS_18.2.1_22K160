@interface SmallLockupCollectionViewCell
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityOrdinalLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityPriceLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallLockupCollectionViewCell

- (_TtC6Arcade29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade29SmallLockupCollectionViewCell *)sub_1000BA63C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000BAEC0();
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self);
  id v6 = v11.receiver;
  id v7 = a4;
  id v8 =  -[SmallLockupCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:]( &v11,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFocusingBaseDuration:", 0.2, v11.receiver, v11.super_class);
    [v9 setUnfocusingBaseDuration:0.2];
    objc_msgSend(v9, "setAs_animationOptions:", 131078);
  }

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = type metadata accessor for SmallLockupLayout.Metrics(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __n128 v8 = __chkstk_darwin(v6);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, char *, uint64_t, __n128))(v7 + 16))( v10,  (char *)self + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_metrics,  v6,  v8);
  objc_super v11 = self;
  -[SmallLockupCollectionViewCell layoutMargins](v11, "layoutMargins");
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = type metadata accessor for SmallLockupLayout(0LL);
  uint64_t v17 = sub_100003B6C( &qword_1002E3228,  (uint64_t (*)(uint64_t))&type metadata accessor for SmallLockupLayout,  (uint64_t)&protocol conformance descriptor for SmallLockupLayout);
  double v18 = dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)( v10,  v11,  v16,  v17,  width,  height);
  double v20 = v15 + v13 + v19;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  double v21 = v18;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = type metadata accessor for SmallLockupLayout.Metrics(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, char *, uint64_t, __n128))(v4 + 16))( v7,  (char *)self + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_metrics,  v3,  v5);
  __n128 v8 = self;
  -[SmallLockupCollectionViewCell layoutMargins](v8, "layoutMargins");
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = type metadata accessor for SmallLockupLayout(0LL);
  uint64_t v14 = sub_100003B6C( &qword_1002E3228,  (uint64_t (*)(uint64_t))&type metadata accessor for SmallLockupLayout,  (uint64_t)&protocol conformance descriptor for SmallLockupLayout);
  dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)(v7, v8, v13, v14, 0.0, 0.0);
  double v16 = v12 + v10 + v15;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  double v17 = UIViewNoIntrinsicMetric;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000BBA50();
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityOrdinalLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_ordinalLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_subtitleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityPriceLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_priceLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_priceLabel));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_metrics;
  uint64_t v4 = type metadata accessor for SmallLockupLayout.Metrics(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29SmallLockupCollectionViewCell_artworkBorderLayer));
}

@end