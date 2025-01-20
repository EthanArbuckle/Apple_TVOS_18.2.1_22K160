@interface IDSSenderKeyEncryptionController
- (IDSSenderKeyEncryptionController)init;
- (IDSSenderKeyEncryptionController)initWithPersistenceManager:(id)a3;
- (id)paddyDecryptData:(id)a3 keyIndex:(unsigned int)a4 keyIDByte:(id)a5 from:(id)a6 to:(id)a7;
- (id)paddyEncryptData:(id)a3 to:(id)a4 from:(id)a5;
@end

@implementation IDSSenderKeyEncryptionController

- (IDSSenderKeyEncryptionController)initWithPersistenceManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (objc_class *)a3;
  v7 = self;
  sub_10048ADB4(0xBu);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___IDSSenderKeyEncryptionController_persistenceManager) = v6;
  v8 = v6;

  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = -[IDSSenderKeyEncryptionController init](&v11, "init");

  return v9;
}

- (id)paddyEncryptData:(id)a3 to:(id)a4 from:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v15 = v14;

  v16 = sub_1004B2AB4(v13, v15, v10, v11);
  sub_100402A84(v13, v15);

  return v16;
}

- (id)paddyDecryptData:(id)a3 keyIndex:(unsigned int)a4 keyIDByte:(id)a5 from:(id)a6 to:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v20 = v19;

  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v14);
  unint64_t v23 = v22;

  id v24 = sub_1004B3F80(v18, v20, a4, v21, v23, v15, v16);
  sub_100402A84(v21, v23);
  sub_100402A84(v18, v20);

  return v24;
}

- (IDSSenderKeyEncryptionController)init
{
  result = (IDSSenderKeyEncryptionController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.SenderKeyEncryptionController",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___IDSSenderKeyEncryptionController_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end