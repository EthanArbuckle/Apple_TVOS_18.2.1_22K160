@interface ATHMServer
- (_TtC16CryptoKitPrivate10ATHMServer)init;
- (id)exportKeyCommitmentsAndReturnError:(id *)a3;
- (id)readBitWithPresentationData:(id)a3 error:(id *)a4;
- (id)respondWithRequestData:(id)a3 b:(id)a4 error:(id *)a5;
@end

@implementation ATHMServer

- (_TtC16CryptoKitPrivate10ATHMServer)init
{
  return (_TtC16CryptoKitPrivate10ATHMServer *)ATHMServer.init()();
}

- (id)exportKeyCommitmentsAndReturnError:(id *)a3
{
  __int128 v3 = *(_OWORD *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 48];
  v10[0] = *(_OWORD *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 32];
  v10[1] = v3;
  uint64_t v11 = *(void *)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 64];
  v4 = self;
  uint64_t v5 = sub_18766634C((uint64_t)v10);
  unint64_t v7 = v6;

  v8 = (void *)sub_187699F80();
  sub_187623C58(v5, v7);
  return v8;
}

- (id)respondWithRequestData:(id)a3 b:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = sub_187699F98();
  unint64_t v12 = v11;

  id v13 = sub_1876561C8(v10, v12, (uint64_t)v8);
  unint64_t v15 = v14;

  sub_187623C58(v10, v12);
  v16 = (void *)sub_187699F80();
  sub_187623C58((uint64_t)v13, v15);
  return v16;
}

- (id)readBitWithPresentationData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  uint64_t v7 = sub_187699F98();
  unint64_t v9 = v8;

  sub_187656698(v7, v9);
  unint64_t v11 = v10;

  sub_187623C58(v7, v9);
  return v11;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server];
  id v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server);
  __int128 v3 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 8];
  v4 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 16];
  id v5 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 24];
  unint64_t v6 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 32];
  uint64_t v7 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 40];
  unint64_t v8 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 48];
  unint64_t v9 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 56];
  uint64_t v10 = *(void **)&self->server[OBJC_IVAR____TtC16CryptoKitPrivate10ATHMServer_server + 80];

  swift_bridgeObjectRelease();
}

@end