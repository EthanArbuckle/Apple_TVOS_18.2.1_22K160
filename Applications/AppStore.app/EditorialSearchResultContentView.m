@interface EditorialSearchResultContentView
- (_TtC8AppStore16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore32EditorialSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore32EditorialSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EditorialSearchResultContentView

- (_TtC8AppStore32EditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32EditorialSearchResultContentView *)sub_1001479EC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  (uint64_t)self,  (uint64_t)a2);
}

- (_TtC8AppStore32EditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10014A1D8((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100148270();
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialTypeLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_subtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_iconRow));
}

@end