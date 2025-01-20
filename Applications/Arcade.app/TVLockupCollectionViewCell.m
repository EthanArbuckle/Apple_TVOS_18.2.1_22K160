@interface TVLockupCollectionViewCell
- (CGRect)jet_focusedFrame;
- (_TtC6Arcade12TVLockupView)accessibilityLockupView;
- (_TtC6Arcade26TVLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TVLockupCollectionViewCell

- (_TtC6Arcade26TVLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade26TVLockupCollectionViewCell *)sub_10002C974( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  double v3 = sub_10002CDA8();
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

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLockupCollectionViewCell(0LL);
  v2 = (char *)v5.receiver;
  -[TVLockupCollectionViewCell layoutSubviews](&v5, "layoutSubviews");
  double v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade26TVLockupCollectionViewCell_lockupView];
  id v4 = objc_msgSend(v2, "contentView", v5.receiver, v5.super_class);
  [v4 frame];

  objc_msgSend(v3, "setFrame:", CGRect.subtracting(insets:)(objc_msgSend(v2, "layoutMargins")).n128_f64[0]);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10002D140();
}

- (_TtC6Arcade12TVLockupView)accessibilityLockupView
{
  return (_TtC6Arcade12TVLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                              + OBJC_IVAR____TtC6Arcade26TVLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26TVLockupCollectionViewCell_lockupView));
}

@end