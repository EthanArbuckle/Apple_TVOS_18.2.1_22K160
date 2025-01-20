@interface ComingSoonViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC8AppStore24ComingSoonViewController)initWithCoder:(id)a3;
- (_TtC8AppStore24ComingSoonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ComingSoonViewController

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3 = sub_1000038E8((uint64_t *)&unk_1002E1CF0);
  uint64_t v4 = swift_allocObject(v3, 40LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_100236BD0;
  v5 = self;
  result = (NSArray *)-[ComingSoonViewController view](v5, "view");
  if (result)
  {
    *(void *)(v4 + 32) = result;
    specialized Array._endMutation()(result);

    sub_1000038E8((uint64_t *)&unk_1002E3880);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    return (NSArray *)isa;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (void)loadView
{
  v9 = self;
  if ((-[ComingSoonViewController isViewLoaded](v9, "isViewLoaded") & 1) != 0)
  {
    v2 = v9;
  }

  else
  {
    v3._countAndFlagsBits = 0x535F474E494D4F43LL;
    v3._object = (void *)0xEB000000004E4F4FLL;
    v4._countAndFlagsBits = 0LL;
    v4._object = (void *)0xE000000000000000LL;
    Swift::String v5 = localizedString(_:comment:)(v3, v4);
    id v6 = objc_allocWithZone((Class)type metadata accessor for ContentUnavailableView());
    sub_100111B0C(0.0, 0.0, 0.0, 0.0, v5._countAndFlagsBits, (uint64_t)v5._object);
    v8 = v7;
    *((_BYTE *)&v7->super.super.super.isa + OBJC_IVAR____TtC8AppStore22ContentUnavailableView__canBecomeFocused) = 1;
    -[ComingSoonViewController setView:](v9, "setView:", v7);

    v2 = v8;
  }
}

- (_TtC8AppStore24ComingSoonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v9 = v8;
    id v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    *(void *)&double v11 = swift_bridgeObjectRelease(v9).n128_u64[0];
  }

  else
  {
    id v12 = a4;
  }

  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[ComingSoonViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", a3, a4, v11);

  return v13;
}

- (_TtC8AppStore24ComingSoonViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[ComingSoonViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end