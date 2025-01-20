@interface CryptoKitWrapper
+ (id)decryptKnoxKeyWithEncData:(id)a3 encapsulatedKey:(id)a4 recipientPrivateKey:(__SecKey *)a5 error:(id *)a6;
- (_TtC21MobileAssetKeyManager16CryptoKitWrapper)init;
@end

@implementation CryptoKitWrapper

+ (id)decryptKnoxKeyWithEncData:(id)a3 encapsulatedKey:(id)a4 recipientPrivateKey:(__SecKey *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v14 = v13;

  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v17 = v16;

  uint64_t v18 = sub_1F70C8(v12, v14, v15, v17, v11);
  unint64_t v20 = v19;

  sub_1F86D4(v15, v17);
  sub_1F86D4(v12, v14);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1F86D4(v18, v20);
  return isa;
}

- (_TtC21MobileAssetKeyManager16CryptoKitWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return -[CryptoKitWrapper init](&v3, "init");
}

@end