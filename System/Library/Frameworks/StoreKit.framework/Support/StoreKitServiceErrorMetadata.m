@interface StoreKitServiceErrorMetadata
- (NSString)environment;
- (NSString)serverCorrelationID;
- (NSString)storefrontCountryCode;
- (_TtC9storekitd28StoreKitServiceErrorMetadata)init;
- (void)setEnvironment:(id)a3;
- (void)setServerCorrelationID:(id)a3;
- (void)setStorefrontCountryCode:(id)a3;
@end

@implementation StoreKitServiceErrorMetadata

- (NSString)serverCorrelationID
{
  return (NSString *)sub_100087F54((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100087F24);
}

- (void)setServerCorrelationID:(id)a3
{
}

- (NSString)environment
{
  return (NSString *)sub_100087F54((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100087F98);
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)storefrontCountryCode
{
  return (NSString *)sub_100087F54((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100088038);
}

- (void)setStorefrontCountryCode:(id)a3
{
}

- (_TtC9storekitd28StoreKitServiceErrorMetadata)init
{
  return (_TtC9storekitd28StoreKitServiceErrorMetadata *)sub_1000880A8();
}

- (void).cxx_destruct
{
}

@end