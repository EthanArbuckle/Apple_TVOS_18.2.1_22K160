@interface CSDConversationLinkGeneratorDescriptor
- (BOOL)isEqual:(id)a3;
- (CSDConversationLinkGeneratorDescriptor)init;
- (CSDConversationLinkGeneratorDescriptor)initWithIdentifier:(id)a3 version:(int64_t)a4;
- (NSString)identifier;
- (int64_t)hash;
- (int64_t)version;
- (void)setIdentifier:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CSDConversationLinkGeneratorDescriptor

- (NSString)identifier
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  sub_10027AF88(v4, v6);
}

- (int64_t)version
{
  return sub_10027AFC4();
}

- (void)setVersion:(int64_t)a3
{
}

- (CSDConversationLinkGeneratorDescriptor)initWithIdentifier:(id)a3 version:(int64_t)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (CSDConversationLinkGeneratorDescriptor *)sub_10027B008(v5, v6, a4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }

  BOOL v8 = sub_10027B084((uint64_t)v10);

  sub_1001B14E8((uint64_t)v10);
  return v8;
}

- (int64_t)hash
{
  uint64_t v2 = self;
  Swift::Int v3 = sub_10027B1F0();

  return v3;
}

- (CSDConversationLinkGeneratorDescriptor)init
{
}

- (void).cxx_destruct
{
}

@end