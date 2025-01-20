@interface KVACRequestWrapper
- (NSData)requestData;
- (_TtC16CryptoKitPrivate18KVACRequestWrapper)init;
@end

@implementation KVACRequestWrapper

- (NSData)requestData
{
  return (NSData *)sub_187641328( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_requestData);
}

- (_TtC16CryptoKitPrivate18KVACRequestWrapper)init
{
  result = (_TtC16CryptoKitPrivate18KVACRequestWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_request;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_request);
  v5 = *(void **)&self->requestData[OBJC_IVAR____TtC16CryptoKitPrivate18KVACRequestWrapper_request];
  id v7 = v4;
  v6 = (void *)*((void *)v3 + 2);
  swift_bridgeObjectRelease();
}

@end