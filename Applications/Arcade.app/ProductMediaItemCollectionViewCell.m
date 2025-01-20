@interface ProductMediaItemCollectionViewCell
- (_TtC6Arcade34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ProductMediaItemCollectionViewCell

- (_TtC6Arcade34ProductMediaItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade34ProductMediaItemCollectionViewCell *)sub_1001F5FC8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  unint64_t v7 = sub_1000045E8();
  uint64_t v8 = sub_100003B6C( (unint64_t *)&qword_1002E18F0,  (uint64_t (*)(uint64_t))sub_1000045E8,  (uint64_t)&protocol conformance descriptor for NSObject);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_1001F6510(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ProductMediaItemCollectionViewCell(0LL);
  id v2 = v4.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v5.value.super.isa = 0LL;
  v5.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v5, v3);
  sub_1001B2138();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1001F67C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34ProductMediaItemCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade34ProductMediaItemCollectionViewCell_videoContainer));
}

@end