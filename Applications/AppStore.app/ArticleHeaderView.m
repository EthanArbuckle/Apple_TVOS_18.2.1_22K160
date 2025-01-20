@interface ArticleHeaderView
- (_TtC8AppStore17ArticleHeaderView)initWithCoder:(id)a3;
- (_TtC8AppStore17ArticleHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArticleHeaderView

- (_TtC8AppStore17ArticleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17ArticleHeaderView *)sub_100134F60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17ArticleHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore17ArticleHeaderView_detailsView;
  uint64_t v6 = type metadata accessor for ArticleCardTextView(0LL);
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v7 init];
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore17ArticleHeaderView_detailsHorizontalMargins);
  __int128 v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v9 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v9[1] = v10;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore17ArticleHeaderView_pageTraits) = 0LL;

  result = (_TtC8AppStore17ArticleHeaderView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ArticleHeaderView.swift",  32LL,  2LL,  47LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013528C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100135690();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ArticleHeaderView_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17ArticleHeaderView_detailsView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore17ArticleHeaderView_pageTraits));
}

@end