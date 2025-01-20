@interface HoverTextAXUIService
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3;
+ (id)sharedInstance;
- (HoverTextAXUIService)init;
- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (id)styleProviderForAlertWithIdentifier:(id)a3;
- (void)externalDisplaySceneConnected:(id)a3;
- (void)externalDisplaySceneDisconnected:(id)a3;
@end

@implementation HoverTextAXUIService

+ (id)sharedInstance
{
  return sub_4578();
}

- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  if (a3) {
    unint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable,  a5,  a6);
  }
  else {
    unint64_t v9 = 0LL;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, a2);
  unint64_t v12 = v11;
  v13 = self;
  unint64_t v14 = sub_45F0(v9, a4, v10, v12);
  swift_bridgeObjectRelease(v12);

  swift_bridgeObjectRelease(v9);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3
{
  if (a3 == 3) {
    unint64_t v3 = 0x8000000000007A40LL;
  }
  else {
    unint64_t v3 = 0x8000000000007A10LL;
  }
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (void)externalDisplaySceneConnected:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_55F0(a3, "External display scene connected", (uint64_t)&unk_8490, (uint64_t)&unk_CB80);
}

- (void)externalDisplaySceneDisconnected:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_55F0(a3, "External display scene disconnected", (uint64_t)&unk_8440, (uint64_t)&unk_CB60);
}

- (id)styleProviderForAlertWithIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  id v6 = objc_allocWithZone((Class)&OBJC_CLASS___AXUIHoverTextAlertStyleProvider);
  v7 = self;
  id v8 = [v6 init];

  swift_bridgeObjectRelease(v5);
  return v8;
}

- (HoverTextAXUIService)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator) = 0LL;
  uint64_t v4 = OBJC_IVAR___HoverTextAXUIService_mainActorQueue;
  type metadata accessor for AXMainActorSerialQueue(0LL);
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)AXMainActorSerialQueue.__allocating_init()();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[HoverTextAXUIService init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___HoverTextAXUIService_mainActorQueue));
}

@end