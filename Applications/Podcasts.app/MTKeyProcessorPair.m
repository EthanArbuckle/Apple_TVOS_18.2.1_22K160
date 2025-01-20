@interface MTKeyProcessorPair
- (MTKeyProcessorPair)init;
- (MTKeyProcessorPair)initWithKey:(id)a3 processor:(id)a4;
- (MZKeyValueStoreTransactionProcessing)processor;
- (NSString)key;
@end

@implementation MTKeyProcessorPair

- (NSString)key
{
  uint64_t v2 = *(void *)&self->key[OBJC_IVAR___MTKeyProcessorPair_key];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (MZKeyValueStoreTransactionProcessing)processor
{
  return (MZKeyValueStoreTransactionProcessing *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTKeyProcessorPair_processor));
}

- (MTKeyProcessorPair)initWithKey:(id)a3 processor:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___MTKeyProcessorPair_key);
  uint64_t *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTKeyProcessorPair_processor) = (Class)a4;
  v12.receiver = self;
  v12.super_class = ObjectType;
  swift_unknownObjectRetain(a4);
  return -[MTKeyProcessorPair init](&v12, "init");
}

- (MTKeyProcessorPair)init
{
  result = (MTKeyProcessorPair *)_swift_stdlib_reportUnimplementedInitializer( "Podcasts.KeyProcessorPair",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end