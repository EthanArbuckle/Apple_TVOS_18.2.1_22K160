@interface SKANPersistentTokenHandler
+ (id)generateRandomPrivateInput;
- (_TtC9appstored15SKANBlindedData)blindedData;
- (_TtC9appstored26SKANPersistentTokenHandler)init;
- (_TtC9appstored26SKANPersistentTokenHandler)initWithRandomPrivateInput:(id)a3;
- (id)tryFinalizeWithPublicData:(id)a3 finalizationDict:(id)a4 pubCertString:(id)a5 error:(id *)a6;
- (id)tryGenerateBlindedElement;
- (unint64_t)timestamp;
- (void)setBlindedData:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation SKANPersistentTokenHandler

- (unint64_t)timestamp
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_timestamp);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_timestamp) = (Class)a3;
}

- (_TtC9appstored15SKANBlindedData)blindedData
{
  return (_TtC9appstored15SKANBlindedData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                    + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData));
}

- (void)setBlindedData:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData) = (Class)a3;
  id v3 = a3;
}

- (_TtC9appstored26SKANPersistentTokenHandler)initWithRandomPrivateInput:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  uint64_t v6 = type metadata accessor for SKANUTClient(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = a3;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_timestamp) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_blindedData) = 0LL;
  v14 = self;
  sub_100007AD0(v11, v13);
  SKANUTClient.init(privateInput:)(v11, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))( (uint64_t)v14 + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_utClient,  v9,  v6);
  v15 = (uint64_t *)((char *)v14 + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_privateInput);
  uint64_t *v15 = v11;
  v15[1] = v13;
  sub_100007AD0(v11, v13);

  v18.receiver = v14;
  v18.super_class = ObjectType;
  v16 = -[SKANPersistentTokenHandler init](&v18, "init");
  sub_100007B14(v11, v13);
  return v16;
}

+ (id)generateRandomPrivateInput
{
  v2 = (char *)sub_100017F68(0, 0x20uLL);
  size_t v3 = *((void *)v2 + 2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_10008888C(0LL, v3, 0, v2);
  }
  SecRandomCopyBytes(kSecRandomDefault, v3, v2 + 32);
  uint64_t v4 = sub_100018FB4(v2 + 32, 32LL);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease(v2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100007B14(v4, v6);
  return isa;
}

- (id)tryGenerateBlindedElement
{
  v2 = self;
  size_t v3 = sub_1000180D0();

  return v3;
}

- (id)tryFinalizeWithPublicData:(id)a3 finalizationDict:(id)a4 pubCertString:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v16 = v15;

  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v11,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  uint64_t v20 = v19;

  unint64_t v21 = sub_100018234(v14, v16, v17, v18, v20);
  unint64_t v23 = v22;
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);

  sub_100007B14(v14, v16);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100007B14(v21, v23);
  return isa;
}

- (_TtC9appstored26SKANPersistentTokenHandler)init
{
  result = (_TtC9appstored26SKANPersistentTokenHandler *)_swift_stdlib_reportUnimplementedInitializer( "appstored.SKANPersistentTokenHandler",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  size_t v3 = (char *)self + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_utClient;
  uint64_t v4 = type metadata accessor for SKANUTClient(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  sub_100007B14( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_privateInput),  *(void *)&self->timestamp[OBJC_IVAR____TtC9appstored26SKANPersistentTokenHandler_privateInput]);
}

@end