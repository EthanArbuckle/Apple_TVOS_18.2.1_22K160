@interface PolicyRedactionCrypter
- (_TtC18TrustedPeersHelper22PolicyRedactionCrypter)init;
- (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5;
@end

@implementation PolicyRedactionCrypter

- (id)decryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;

  id v13 = sub_10000A568(v7, v10, v12);
  unint64_t v15 = v14;

  sub_10000852C(v10, (unint64_t)v12);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000852C((uint64_t)v13, v15);
  return isa;
}

- (id)encryptData:(id)a3 withKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  unint64_t v16 = v15;

  v17 = sub_10000A890(v11, v13, v14, v16);
  sub_10000852C(v14, v16);
  sub_10000852C(v11, v13);
  return v17;
}

- (_TtC18TrustedPeersHelper22PolicyRedactionCrypter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PolicyRedactionCrypter();
  return -[PolicyRedactionCrypter init](&v3, "init");
}

@end