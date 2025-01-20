@interface EditorialSearchResultContentView
- (_TtC6Arcade16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade32EditorialSearchResultContentView)initWithCoder:(id)a3;
- (_TtC6Arcade32EditorialSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EditorialSearchResultContentView

- (_TtC6Arcade32EditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade32EditorialSearchResultContentView *)sub_10013E0F0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  (uint64_t)self,  (uint64_t)a2);
}

- (_TtC6Arcade32EditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100140D98((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013E974();
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_editorialTypeLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_subtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_editorialArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade32EditorialSearchResultContentView_iconRow));
}

@end