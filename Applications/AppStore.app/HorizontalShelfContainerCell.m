@interface HorizontalShelfContainerCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC8AppStore28HorizontalShelfContainerCell)initWithCoder:(id)a3;
- (_TtC8AppStore28HorizontalShelfContainerCell)initWithFrame:(CGRect)a3;
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
               + OBJC_IVAR____TtC8AppStore28HorizontalShelfContainerCell_shelfView);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore28HorizontalShelfContainerCell_shelfView, v11, 0LL, 0LL);
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    sub_1001B11C0();
    v8 = v7;
  }

  else
  {
    v8 = _swiftEmptyArrayStorage;
  }

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

- (_TtC8AppStore28HorizontalShelfContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28HorizontalShelfContainerCell *)sub_1001B2170( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore28HorizontalShelfContainerCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore28HorizontalShelfContainerCell_shelfView) = 0LL;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore28HorizontalShelfContainerCell_scrollObserver);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore28HorizontalShelfContainerCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/HorizontalShelfContainerCell.swift",  43LL,  2LL,  283LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001B2394();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001B24B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28HorizontalShelfContainerCell_shelfView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore28HorizontalShelfContainerCell_scrollObserver));
}

@end