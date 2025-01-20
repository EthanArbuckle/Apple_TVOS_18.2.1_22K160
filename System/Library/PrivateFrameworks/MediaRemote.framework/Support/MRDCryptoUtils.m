@interface MRDCryptoUtils
+ (id)signature:(id)a3 isValidFor:(id)a4 withPublicKey:(id)a5 error:(id *)a6;
+ (id)signatureForData:(id)a3 withPrivateKey:(id)a4 error:(id *)a5;
+ (void)generateCurve25519SigningKeyPairWithPrivateKeyData:(id *)a3 publicKeyData:(id *)a4;
- (MRDCryptoUtils)init;
@end

@implementation MRDCryptoUtils

+ (void)generateCurve25519SigningKeyPairWithPrivateKeyData:(id *)a3 publicKeyData:(id *)a4
{
}

+ (id)signatureForData:(id)a3 withPrivateKey:(id)a4 error:(id *)a5
{
  uint64_t v7 = type metadata accessor for Curve25519.Signing.PrivateKey(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v15 = v14;

  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v12);
  unint64_t v18 = v17;

  uint64_t v27 = v16;
  unint64_t v28 = v18;
  sub_100160874(v16, v18);
  Curve25519.Signing.PrivateKey.init<A>(rawRepresentation:)( &v27,  &type metadata for Data,  &protocol witness table for Data);
  uint64_t v27 = v13;
  unint64_t v28 = v15;
  unint64_t v19 = sub_100174AC0();
  uint64_t v20 = Curve25519.Signing.PrivateKey.signature<A>(for:)(&v27, &type metadata for Data, v19);
  unint64_t v22 = v21;
  uint64_t v23 = v20;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1001608B8(v16, v18);
  sub_1001608B8(v13, v15);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001608B8(v23, v22);
  return isa;
}

+ (id)signature:(id)a3 isValidFor:(id)a4 withPublicKey:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v14 = v13;

  unint64_t v15 = (objc_class *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v17 = v16;

  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v11);
  unint64_t v20 = v19;

  Class v21 = sub_100174B04(v12, v14, v15, v17, v18, v20);
  sub_1001608B8(v18, v20);
  sub_1001608B8((uint64_t)v15, v17);
  sub_1001608B8(v12, v14);
  return v21;
}

- (MRDCryptoUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoUtils();
  return -[MRDCryptoUtils init](&v3, "init");
}

@end