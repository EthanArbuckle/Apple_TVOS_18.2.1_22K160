@interface ContentSearchResultCollectionViewCell
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ContentSearchResultCollectionViewCell

- (_TtC8AppStore37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore37ContentSearchResultCollectionViewCell *)sub_1001BBCD0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001BC194();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ContentSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC8AppStore15SmallLockupView_artworkView));
  ArtworkView.image.setter(0LL);

  sub_1000B3618();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_10000DFD4(0LL, (unint64_t *)&qword_1002E14D0, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B300();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_1001BC9D4(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37ContentSearchResultCollectionViewCell_pillView));
}

@end