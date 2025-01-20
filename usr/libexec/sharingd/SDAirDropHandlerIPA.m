@interface SDAirDropHandlerIPA
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (NSString)singleItemActionTitle;
- (NSString)suitableContentsDescription;
- (_TtC16DaemoniOSLibrary19SDAirDropHandlerIPA)initWithTransfer:(id)a3 bundleIdentifier:(id)a4;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerIPA

- (BOOL)canHandleTransfer
{
  v2 = self;
  sub_100225594();
  char v4 = v3;

  return v4 & 1;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x8000;
}

- (NSString)suitableContentsDescription
{
  v2 = self;
  sub_100225D8C();
  char v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)singleItemActionTitle
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v5 = (id)SFLocalizedStringForKey(v3, v4);

  if (v5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    uint64_t v7 = v6;

    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {

    NSString v8 = 0LL;
  }

  return (NSString *)v8;
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void)updatePossibleActions
{
  v2 = self;
  sub_10022623C();
}

- (_TtC16DaemoniOSLibrary19SDAirDropHandlerIPA)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v9 = v8;
  id v10 = a3;
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v14, "initWithTransfer:bundleIdentifier:", v10, v11);

  return v12;
}

@end