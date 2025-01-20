@interface CLMicroLocationKeychain
+ (BOOL)removeKey:(id)a3;
+ (id)getSymmetricKeyOrCreateNew:(id)a3;
+ (id)retrieveSymmetricKey:(id)a3;
- (_TtC19microlocation_logic23CLMicroLocationKeychain)init;
@end

@implementation CLMicroLocationKeychain

+ (id)getSymmetricKeyOrCreateNew:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  swift_getObjCClassMetadata(a1);
  sub_10015E9CC(v4, v6, &v15);
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = v16;
  if (!v16) {
    return 0LL;
  }
  v8 = sub_10015E730(&v15, v16);
  uint64_t v9 = *(void *)(v7 - 8);
  double v10 = __chkstk_darwin(v8);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, double))(v9 + 16))(v12, v10);
  v13 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v12, v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  sub_10015E754(&v15);
  return v13;
}

+ (id)retrieveSymmetricKey:(id)a3
{
  return sub_100160020( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)a3,  (void (*)(void *__return_ptr, uint64_t))sub_10015F878);
}

+ (BOOL)removeKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v5 = v4;
  BOOL v6 = sub_100161AD8(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (_TtC19microlocation_logic23CLMicroLocationKeychain)init
{
  return (_TtC19microlocation_logic23CLMicroLocationKeychain *)sub_100160148( self,  (uint64_t)a2,  type metadata accessor for CLMicroLocationKeychain);
}

@end