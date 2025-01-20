@interface ReviewsContainerCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore20ReviewsContainerCell)initWithCoder:(id)a3;
- (_TtC8AppStore20ReviewsContainerCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ReviewsContainerCell

- (_TtC8AppStore20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20ReviewsContainerCell *)sub_100216178(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100218B34();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100216498();
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v7.receiver;
  -[ReviewsContainerCell prepareForReuse](&v7, "prepareForReuse");
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_rateButtonView];
  if (v3)
  {
    v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC8AppStore14RateButtonView_actionClosure);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1];
    uint64_t *v4 = 0LL;
    v4[1] = 0LL;
    sub_10000A450(v5, v6);
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_rateButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_summaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_histogramView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_pageTraits));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_scrollObserver));
}

@end