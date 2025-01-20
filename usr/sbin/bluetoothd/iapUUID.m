@interface iapUUID
- (NSString)connectionUUID;
- (NSString)endpointUUID;
- (void)setConnectionUUID:(id)a3;
- (void)setEndpointUUID:(id)a3;
@end

@implementation iapUUID

- (NSString)connectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endpointUUID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setEndpointUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end