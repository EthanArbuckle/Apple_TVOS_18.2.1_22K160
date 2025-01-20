@interface BrickCollectionViewCell
- (CGRect)jet_focusedFrame;
- (_TtC8AppStore23BrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BrickCollectionViewCell

- (_TtC8AppStore23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23BrickCollectionViewCell *)sub_1000C69A0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C6FA8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000C72D0();
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  double v3 = sub_1000C73D0();
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
                     + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell____lazy_storage___shortDescriptionLabel));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC8AppStore23BrickCollectionViewCell_shortDescriptionLabelText]);
}

@end