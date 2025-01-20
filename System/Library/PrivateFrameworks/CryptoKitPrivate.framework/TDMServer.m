@interface TDMServer
- (BOOL)verifyTokenWithOutput:(id)a3 TID:(id)a4 FSR:(id)a5;
- (_TtC16CryptoKitPrivate9TDMServer)init;
- (id)evaluateWithBlindedElement:(id)a3 error:(id *)a4;
- (id)info;
- (id)publicKey;
@end

@implementation TDMServer

- (_TtC16CryptoKitPrivate9TDMServer)init
{
  return (_TtC16CryptoKitPrivate9TDMServer *)TDMServer.init()();
}

- (id)publicKey
{
  v2 = self;
  id v3 = sub_18766E98C();
  unint64_t v5 = v4;

  v6 = (void *)sub_187699F80();
  sub_187623C58((uint64_t)v3, v5);
  return v6;
}

- (id)info
{
  return (id)sub_187699F80();
}

- (id)evaluateWithBlindedElement:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_187699F98();
  unint64_t v9 = v8;

  v10 = (void *)sub_18766EBA8(v7, v9);
  sub_187623C58(v7, v9);
  return v10;
}

- (BOOL)verifyTokenWithOutput:(id)a3 TID:(id)a4 FSR:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  uint64_t v12 = sub_187699F98();
  unint64_t v14 = v13;

  uint64_t v15 = sub_187699F98();
  unint64_t v17 = v16;

  v18 = (void *)sub_187699F98();
  unint64_t v20 = v19;

  v28 = v11;
  v21 = (unsigned __int8 *)v11 + OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer;
  uint64_t v23 = *(void *)&v11->oprfServer[OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer];
  v22 = *(void **)&v11->oprfServer[OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer + 8];
  LOBYTE(v11) = v11->oprfServer[OBJC_IVAR____TtC16CryptoKitPrivate9TDMServer_oprfServer + 16];
  int v24 = *v21;
  id v25 = v22;
  sub_18766BF1C(v15, v17, v12, v14, v18, v20, v24, v23, v25, (char)v11);
  LOBYTE(v24) = v26;

  sub_187623C58((uint64_t)v18, v20);
  sub_187623C58(v15, v17);
  sub_187623C58(v12, v14);

  return v24 & 1;
}

- (void).cxx_destruct
{
}

@end