@interface CollectionLockupArtwork
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade23CollectionLockupArtwork)initWithCoder:(id)a3;
- (_TtC6Arcade23CollectionLockupArtwork)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CollectionLockupArtwork

- (_TtC6Arcade23CollectionLockupArtwork)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade23CollectionLockupArtwork *)sub_1000BE3A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade23CollectionLockupArtwork)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BF180();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000BE7A0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = -[CollectionLockupArtwork traitCollection](v3, "traitCollection");
  sub_1000BE9C4(v12, 21.0, 21.0);
  uint64_t v5 = v13;
  uint64_t v6 = v14;
  sub_100005F8C(v12, v13);
  double v7 = dispatch thunk of Placeable.measure(toFit:with:)(v4, v5, v6, 62.0, 62.0);
  double v9 = v8;
  _s6Arcade17PillOverlayLayoutVwxx_0(v12);

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23CollectionLockupArtwork_materialBackground));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23CollectionLockupArtwork_moreIndicator));
}

@end