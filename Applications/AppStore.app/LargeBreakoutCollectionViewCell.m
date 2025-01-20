@interface LargeBreakoutCollectionViewCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (UIColor)backgroundColor;
- (_TtC8AppStore31LargeBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation LargeBreakoutCollectionViewCell

- (_TtC8AppStore31LargeBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31LargeBreakoutCollectionViewCell *)sub_10008CA04( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
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
  sub_10008DA08((uint64_t)a3);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  objc_super v3 = sub_1000EF9C0();

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)canBecomeFocused
{
  v2 = self;
  char v3 = sub_10008CEA4();

  return v3 & 1;
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_10008D044();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LargeBreakoutCollectionViewCell(0LL);
  id v6 = a3;
  id v7 = a4;
  id v8 = v10.receiver;
  -[BaseCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  id v9 = objc_msgSend(v6, "nextFocusedView", v10.receiver, v10.super_class);
  sub_10008C130(v9, v7);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10008D208();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10008D580();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31LargeBreakoutCollectionViewCell_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31LargeBreakoutCollectionViewCell_videoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31LargeBreakoutCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31LargeBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31LargeBreakoutCollectionViewCell_detailsView));
  char v3 = (char *)self + OBJC_IVAR____TtC8AppStore31LargeBreakoutCollectionViewCell_detailPosition;
  uint64_t v4 = type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end