@interface EditorialSearchResultCollectionViewCell
- (_TtC6Arcade16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation EditorialSearchResultCollectionViewCell

- (_TtC6Arcade39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade39EditorialSearchResultCollectionViewCell *)sub_10008BB28( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10008C430();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10008D1B0();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_10008D564(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_subtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_editorialArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39EditorialSearchResultCollectionViewCell_iconRow));
}

@end