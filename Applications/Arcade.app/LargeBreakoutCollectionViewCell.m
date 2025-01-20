@interface LargeBreakoutCollectionViewCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (UIColor)backgroundColor;
- (_TtC6Arcade31LargeBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusWithNotification:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation LargeBreakoutCollectionViewCell

- (_TtC6Arcade31LargeBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade31LargeBreakoutCollectionViewCell *)sub_100051F48( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (UIColor)backgroundColor
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LargeBreakoutCollectionViewCell(0LL);
  return -[LargeBreakoutCollectionViewCell backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100052F98((uint64_t)a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  objc_super v3 = sub_1000DDF44();

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)canBecomeFocused
{
  v2 = self;
  char v3 = sub_100052428();

  return v3 & 1;
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1000525C8();
}

- (void)didUpdateFocusWithNotification:(id)a3
{
  uint64_t v5 = type metadata accessor for Notification(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10005143C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100052778();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100052B00();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31LargeBreakoutCollectionViewCell_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31LargeBreakoutCollectionViewCell_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31LargeBreakoutCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31LargeBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31LargeBreakoutCollectionViewCell_detailsView));
  char v3 = (char *)self + OBJC_IVAR____TtC6Arcade31LargeBreakoutCollectionViewCell_detailPosition;
  uint64_t v4 = type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end