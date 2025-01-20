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
  return sub_188172390( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, unint64_t))sub_188172910);
}

+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4
{
  return sub_188172390( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, unint64_t))sub_188172B94);
}

+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_188174444();
  unint64_t v13 = v12;

  uint64_t v14 = sub_188174444();
  unint64_t v16 = v15;

  uint64_t v17 = sub_188174444();
  unint64_t v19 = v18;

  v20 = sub_188172DF4(v11, v13, v14, v16, v17, v19);
  unint64_t v22 = v21;
  sub_188173D1C(v17, v19);
  sub_188173D1C(v14, v16);
  sub_188173D1C(v11, v13);
  v23 = (void *)sub_18817442C();
  sub_188173D1C((uint64_t)v20, v22);
  return v23;
}

+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = a4;
  uint64_t v8 = sub_188174444();
  unint64_t v10 = v9;

  sub_1881732E8(v8, v10, v7);
  sub_188173D1C(v8, v10);
  uint64_t v11 = (void *)sub_188174510();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return -[CryptoKitWrapper init](&v3, sel_init);
}

@end