@interface NEIKEv2CryptoKitKEM
- (BOOL)processPeerPayload:(id)a3 error:(id *)a4;
- (NSData)keyExchangeData;
- (NSData)sharedSecret;
- (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM)init;
@end

@implementation NEIKEv2CryptoKitKEM

- (NSData)keyExchangeData
{
  return (NSData *)sub_1876B7368( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_keyExchangeData);
}

- (NSData)sharedSecret
{
  v2 = self;
  v3 = (void *)NEIKEv2CryptoKitKEM.sharedSecret.getter();

  return (NSData *)v3;
}

- (BOOL)processPeerPayload:(id)a3 error:(id *)a4
{
  return sub_1876B7794( self,  (uint64_t)a2,  a3,  (uint64_t)a4,  &qword_18C6E1A50,  (uint64_t (*)(void))MEMORY[0x1896059B0],  &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_internalSharedSecret);
}

- (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM)init
{
  result = (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end