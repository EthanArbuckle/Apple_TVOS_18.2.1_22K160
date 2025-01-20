@interface CryptoKitWrapper
+ (id)convertPrivateKeyToPEMWithX963PrivateKey:(id)a3 error:(id *)a4;
+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4;
+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6;
+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5;
- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init;
@end

@implementation CryptoKitWrapper

+ (id)convertPrivateKeyToPEMWithX963PrivateKey:(id)a3 error:(id *)a4
{
  return sub_10001B3FC( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, unint64_t))sub_10001B97C);
}

+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4
{
  return sub_10001B3FC( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, unint64_t))sub_10001BC00);
}

+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v14 = v13;

  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v17 = v16;

  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v11);
  unint64_t v20 = v19;

  v21 = sub_10001BE60(v12, v14, v15, v17, v18, v20);
  unint64_t v23 = v22;
  sub_10001CD88(v18, v20);
  sub_10001CD88(v15, v17);
  sub_10001CD88(v12, v14);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10001CD88((uint64_t)v21, v23);
  return isa;
}

+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = a4;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v11 = v10;

  Class v12 = sub_10001C354(v9, v11, v8);
  sub_10001CD88(v9, v11);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  return isa;
}

- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return -[CryptoKitWrapper init](&v3, "init");
}

@end