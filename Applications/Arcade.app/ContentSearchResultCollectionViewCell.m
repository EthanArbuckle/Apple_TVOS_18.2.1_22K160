@interface ContentSearchResultCollectionViewCell
- (_TtC6Arcade15SmallLockupView)accessibilityLockupView;
- (_TtC6Arcade37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ContentSearchResultCollectionViewCell

- (_TtC6Arcade37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade37ContentSearchResultCollectionViewCell *)sub_1001B56A0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001B5B64();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ContentSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC6Arcade37ContentSearchResultCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC6Arcade15SmallLockupView_artworkView));
  ArtworkView.image.setter(0LL);

  sub_1000AD50C();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_1001B63A4(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (_TtC6Arcade15SmallLockupView)accessibilityLockupView
{
  return (_TtC6Arcade15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                 + OBJC_IVAR____TtC6Arcade37ContentSearchResultCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade37ContentSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade37ContentSearchResultCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade37ContentSearchResultCollectionViewCell_pillView));
}

@end