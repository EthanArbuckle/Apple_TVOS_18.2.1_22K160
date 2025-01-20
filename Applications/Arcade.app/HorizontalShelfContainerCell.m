@interface HorizontalShelfContainerCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC6Arcade28HorizontalShelfContainerCell)initWithCoder:(id)a3;
- (_TtC6Arcade28HorizontalShelfContainerCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HorizontalShelfContainerCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v3 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6Arcade28HorizontalShelfContainerCell_shelfView);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade28HorizontalShelfContainerCell_shelfView, v11, 0LL, 0LL);
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    sub_1001A8044();
    v8 = v7;
  }

  else
  {
    v8 = _swiftEmptyArrayStorage;
  }

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

- (_TtC6Arcade28HorizontalShelfContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade28HorizontalShelfContainerCell *)sub_1001A8FF4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade28HorizontalShelfContainerCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade28HorizontalShelfContainerCell_shelfView) = 0LL;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6Arcade28HorizontalShelfContainerCell_scrollObserver);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade28HorizontalShelfContainerCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/HorizontalShelfContainerCell.swift",  41LL,  2LL,  283LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001A9218();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001A9338();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade28HorizontalShelfContainerCell_shelfView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade28HorizontalShelfContainerCell_scrollObserver));
}

@end