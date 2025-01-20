@interface EditorialSearchResultCollectionViewCell
- (_TtC8AppStore16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation EditorialSearchResultCollectionViewCell

- (_TtC8AppStore39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39EditorialSearchResultCollectionViewCell *)sub_1000932A4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100093BAC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10009492C();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_10000DFD4(0LL, (unint64_t *)&qword_1002E14D0, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B300();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_100094CE0(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_subtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_iconRow));
}

@end