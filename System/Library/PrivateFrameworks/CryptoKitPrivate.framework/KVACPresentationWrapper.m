@interface KVACPresentationWrapper
- (NSData)prefix;
- (NSData)presentationData;
- (NSData)serverKeyId;
- (NSData)tag;
- (_TtC16CryptoKitPrivate23KVACPresentationWrapper)init;
@end

@implementation KVACPresentationWrapper

- (NSData)serverKeyId
{
  return (NSData *)sub_187641328( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_serverKeyId);
}

- (NSData)tag
{
  return (NSData *)sub_187641328( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_tag);
}

- (NSData)prefix
{
  return (NSData *)sub_187641328( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_prefix);
}

- (NSData)presentationData
{
  return (NSData *)sub_187641328( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16CryptoKitPrivate23KVACPresentationWrapper_presentationData);
}

- (_TtC16CryptoKitPrivate23KVACPresentationWrapper)init
{
  result = (_TtC16CryptoKitPrivate23KVACPresentationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end