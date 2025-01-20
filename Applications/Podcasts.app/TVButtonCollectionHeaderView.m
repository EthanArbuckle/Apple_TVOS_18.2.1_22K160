@interface TVButtonCollectionHeaderView
+ (NSString)reuseIdentifier;
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (NSArray)preferredFocusEnvironments;
- (_TtC8Podcasts18TVButtonHeaderView)containedView;
- (_TtC8Podcasts28TVButtonCollectionHeaderView)initWithCoder:(id)a3;
- (_TtC8Podcasts28TVButtonCollectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TVButtonCollectionHeaderView

+ (NSString)reuseIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC8Podcasts18TVButtonHeaderView)containedView
{
  return (_TtC8Podcasts18TVButtonHeaderView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8Podcasts28TVButtonCollectionHeaderView_containedView));
}

- (_TtC8Podcasts28TVButtonCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8Podcasts28TVButtonCollectionHeaderView *)sub_100164DC8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8Podcasts28TVButtonCollectionHeaderView)initWithCoder:(id)a3
{
  result = (_TtC8Podcasts28TVButtonCollectionHeaderView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010021A280LL,  "Podcasts/TVButtonCollectionHeaderView.swift",  43LL,  2LL,  24LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TVButtonCollectionHeaderView();
  v2 = (char *)v14.receiver;
  -[MTCollectionReusableView layoutSubviews](&v14, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8Podcasts28TVButtonCollectionHeaderView_containedView];
  id v4 = objc_msgSend(v2, "contentView", v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  }

  else
  {
    __break(1u);
  }

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFocused
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts28TVButtonCollectionHeaderView_containedView) canBecomeFocused];
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_100126450((uint64_t *)&unk_1002B6160);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1001C4170;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Podcasts28TVButtonCollectionHeaderView_containedView);
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
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts28TVButtonCollectionHeaderView_containedView));
}

@end