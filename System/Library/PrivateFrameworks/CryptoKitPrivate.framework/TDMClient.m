@interface TDMClient
- (_TtC16CryptoKitPrivate9TDMClient)init;
- (_TtC16CryptoKitPrivate9TDMClient)initWithTID:(id)a3;
- (id)blindedElement;
- (id)finalizeWithFSR:(id)a3 evaluatedElement:(id)a4 proof:(id)a5 publicKey:(id)a6 error:(id *)a7;
@end

@implementation TDMClient

- (_TtC16CryptoKitPrivate9TDMClient)initWithTID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_187699F98();
  unint64_t v6 = v5;

  v7 = (_TtC16CryptoKitPrivate9TDMClient *)sub_1876713EC(v4, v6);
  sub_187623C58(v4, v6);
  return v7;
}

- (id)blindedElement
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate9TDMClient_be);
  id v3 = self;
  id result = objc_msgSend(v2, sel_serializedPublicKey_, 1);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_187699F98();
    unint64_t v8 = v7;

    v9 = (void *)sub_187699F80();
    sub_187623C58(v6, v8);
    return v9;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (id)finalizeWithFSR:(id)a3 evaluatedElement:(id)a4 proof:(id)a5 publicKey:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33 = self;
  uint64_t v15 = sub_187699F98();
  unint64_t v17 = v16;

  uint64_t v32 = sub_187699F98();
  unint64_t v19 = v18;

  uint64_t v20 = sub_187699F98();
  unint64_t v22 = v21;

  uint64_t v23 = sub_187699F98();
  unint64_t v25 = v24;

  sub_18766DCF0(v15, v17, v32, v19, v20, v22);
  uint64_t v27 = v26;
  unint64_t v29 = v28;

  sub_187623C58(v23, v25);
  sub_187623C58(v20, v22);
  sub_187623C58(v32, v19);
  sub_187623C58(v15, v17);
  v30 = (void *)sub_187699F80();
  sub_187623C58(v27, v29);
  return v30;
}

- (_TtC16CryptoKitPrivate9TDMClient)init
{
  id result = (_TtC16CryptoKitPrivate9TDMClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end