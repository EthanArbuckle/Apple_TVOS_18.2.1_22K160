@interface CSDIDSProviderDelegateCapabilities
- (BOOL)isCellularDataAllowed;
- (BOOL)isCellularDataAvailable;
- (BOOL)isCellularDataPreferred;
- (BOOL)isWiFiAllowed;
- (BOOL)isWiFiAvailable;
- (CSDIDSProviderDelegateCapabilities)init;
@end

@implementation CSDIDSProviderDelegateCapabilities

- (CSDIDSProviderDelegateCapabilities)init
{
  return (CSDIDSProviderDelegateCapabilities *)sub_100268864();
}

- (BOOL)isWiFiAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_1002687F0();

  return v3 & 1;
}

- (BOOL)isWiFiAllowed
{
  return 1;
}

- (BOOL)isCellularDataAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_1002687FC();

  return v3 & 1;
}

- (BOOL)isCellularDataAllowed
{
  return 1;
}

- (BOOL)isCellularDataPreferred
{
  return 0;
}

@end