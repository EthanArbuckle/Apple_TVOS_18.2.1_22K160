@interface CSDTinCanIDSProviderDelegateCapabilities
- (BOOL)isCellularDataAllowed;
- (CSDTinCanIDSProviderDelegateCapabilities)init;
@end

@implementation CSDTinCanIDSProviderDelegateCapabilities

- (BOOL)isCellularDataAllowed
{
  return 1;
}

- (CSDTinCanIDSProviderDelegateCapabilities)init
{
  return (CSDTinCanIDSProviderDelegateCapabilities *)sub_100268774();
}

@end