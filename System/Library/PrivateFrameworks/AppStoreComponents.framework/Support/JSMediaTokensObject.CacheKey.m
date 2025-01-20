@interface JSMediaTokensObject.CacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey)init;
- (int64_t)hash;
@end

@implementation JSMediaTokensObject.CacheKey

- (int64_t)hash
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client);
  uint64_t v4 = *(void *)&self->client[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client];
  uint64_t v5 = *(void *)&self->client[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                              + 8];
  uint64_t v6 = *(void *)&self->client[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                              + 16];
  Hasher.init(_seed:)(v10);
  v7 = self;
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v10, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v10, v5, v6);
  swift_bridgeObjectRelease(v6);
  Swift::Int v8 = Hasher._finalize()();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }

  char v8 = sub_1000AA990((uint64_t)v10);

  sub_10004C810((uint64_t)v10);
  return v8 & 1;
}

- (_TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey)init
{
  result = (_TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey *)_swift_stdlib_reportUnimplementedInitializer("appstorecomponentsd.CacheKey", 28LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->client[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client];
  swift_bridgeObjectRelease(*(void *)&self->client[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                                                   + 16]);
  swift_bridgeObjectRelease(v2);
}

@end