@interface RSAPSSSPKI_Bridging
+ (id)serializeWithKeyBytes:(id)a3 error:(id *)a4;
- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)init;
- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)initWithData:(id)a3 error:(id *)a4;
- (id)publicKeyBytes;
@end

@implementation RSAPSSSPKI_Bridging

- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_18769A19C();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = a3;
  uint64_t v11 = sub_187699F98();
  unint64_t v13 = v12;

  v14 = self;
  sub_187623A28(v11, v13);
  sub_18769A184();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))( (uint64_t)v14 + OBJC_IVAR____TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging_backingStruct,  v9,  v6);

  v15 = (objc_class *)type metadata accessor for RSAPSSSPKI_Bridging();
  v19.receiver = v14;
  v19.super_class = v15;
  v16 = -[RSAPSSSPKI_Bridging init](&v19, sel_init);
  sub_187623C58(v11, v13);
  return v16;
}

- (id)publicKeyBytes
{
  v2 = self;
  uint64_t v3 = sub_18769A178();
  unint64_t v5 = v4;

  uint64_t v6 = (void *)sub_187699F80();
  sub_187623C58(v3, v5);
  return v6;
}

+ (id)serializeWithKeyBytes:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_187699F98();
  unint64_t v7 = v6;

  uint64_t v8 = sub_18769A190();
  unint64_t v10 = v9;
  sub_187623C58(v5, v7);
  uint64_t v11 = (void *)sub_187699F80();
  sub_187623C58(v8, v10);
  return v11;
}

- (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging)init
{
  result = (_TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate19RSAPSSSPKI_Bridging_backingStruct;
  uint64_t v3 = sub_18769A19C();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

@end