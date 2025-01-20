@interface SectionBackgroundView
- (_TtC6Arcade21SectionBackgroundView)initWithCoder:(id)a3;
- (_TtC6Arcade21SectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SectionBackgroundView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SectionBackgroundView();
  v2 = (char *)v5.receiver;
  -[SectionBackgroundView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade21SectionBackgroundView_artworkView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001E1C80();
}

- (_TtC6Arcade21SectionBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade21SectionBackgroundView_artworkView) = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SectionBackgroundView();
  return -[SectionBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6Arcade21SectionBackgroundView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade21SectionBackgroundView_artworkView) = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SectionBackgroundView();
  return -[SectionBackgroundView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21SectionBackgroundView_artworkView));
}

@end