@interface TVButtonTableHeaderView
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (NSArray)preferredFocusEnvironments;
- (_TtC8Podcasts23TVButtonTableHeaderView)initWithCoder:(id)a3;
- (_TtC8Podcasts23TVButtonTableHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
@end

@implementation TVButtonTableHeaderView

- (_TtC8Podcasts23TVButtonTableHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
  }

  return (_TtC8Podcasts23TVButtonTableHeaderView *)sub_10015D1F0(v3, v4);
}

- (_TtC8Podcasts23TVButtonTableHeaderView)initWithCoder:(id)a3
{
  result = (_TtC8Podcasts23TVButtonTableHeaderView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010021A280LL,  "Podcasts/TVButtonTableHeaderView.swift",  38LL,  2LL,  24LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVButtonTableHeaderView();
  v2 = (char *)v4.receiver;
  -[TVButtonTableHeaderView layoutSubviews](&v4, "layoutSubviews");
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC8Podcasts23TVButtonTableHeaderView_containedView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFocused
{
  return [*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts23TVButtonTableHeaderView_containedView) canBecomeFocused];
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_100126450((uint64_t *)&unk_1002B6160);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1001C4170;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Podcasts23TVButtonTableHeaderView_containedView);
  *(void *)(v4 + 32) = v5;
  uint64_t v9 = v4;
  specialized Array._endMutation()(v4);
  id v6 = v5;
  sub_100126450((uint64_t *)&unk_1002B6400);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts23TVButtonTableHeaderView_containedView));
}

@end