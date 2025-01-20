@interface NEIKEv2CryptoKitECDH
- (BOOL)processPeerPayload:(id)a3 error:(id *)a4;
- (NSData)keyExchangeData;
- (NSData)sharedSecret;
- (_TtC16NetworkExtension20NEIKEv2CryptoKitECDH)init;
@end

@implementation NEIKEv2CryptoKitECDH

- (NSData)keyExchangeData
{
  return (NSData *)sub_1876B7368( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitECDH_keyExchangeData);
}

- (NSData)sharedSecret
{
  v2 = self;
  v3 = (void *)NEIKEv2CryptoKitECDH.sharedSecret.getter();

  return (NSData *)v3;
}

- (BOOL)processPeerPayload:(id)a3 error:(id *)a4
{
  return sub_1876B7794( self,  (uint64_t)a2,  a3,  (uint64_t)a4,  &qword_18C6E1A48,  (uint64_t (*)(void))MEMORY[0x189605988],  &OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitECDH_internalSharedSecret);
}

- (_TtC16NetworkExtension20NEIKEv2CryptoKitECDH)init
{
  result = (_TtC16NetworkExtension20NEIKEv2CryptoKitECDH *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end