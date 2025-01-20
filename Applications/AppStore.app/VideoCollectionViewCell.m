@interface VideoCollectionViewCell
- (_TtC8AppStore23VideoCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation VideoCollectionViewCell

- (_TtC8AppStore23VideoCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23VideoCollectionViewCell *)sub_1001DB130( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  unint64_t v7 = sub_100004D04();
  unint64_t v8 = sub_10006B300();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_1001DB5E0(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  id v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1001AE998();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  id v2 = (char *)v5.receiver;
  -[VideoCollectionViewCell layoutSubviews](&v5, "layoutSubviews");
  objc_super v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore23VideoCollectionViewCell_videoContainer];
  id v4 = objc_msgSend(v2, "contentView", v5.receiver, v5.super_class);
  [v4 frame];

  objc_msgSend(v3, "setFrame:", CGRect.subtracting(insets:)(objc_msgSend(v2, "layoutMargins")).n128_f64[0]);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23VideoCollectionViewCell_videoContainer));
}

@end