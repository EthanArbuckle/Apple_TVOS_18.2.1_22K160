@interface BrickCollectionViewCell
- (CGRect)jet_focusedFrame;
- (_TtC6Arcade23BrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BrickCollectionViewCell

- (_TtC6Arcade23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade23BrickCollectionViewCell *)sub_1000BCBA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000BD1B0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000BD4D8();
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  double v3 = sub_1000BD5D8();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23BrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23BrickCollectionViewCell____lazy_storage___shortDescriptionLabel));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade23BrickCollectionViewCell_shortDescriptionLabelText]);
}

@end