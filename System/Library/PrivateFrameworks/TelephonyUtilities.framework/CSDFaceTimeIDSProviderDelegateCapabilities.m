@interface CSDFaceTimeIDSProviderDelegateCapabilities
- (BOOL)isMomentsAvailable;
- (CSDFaceTimeIDSProviderDelegateCapabilities)init;
@end

@implementation CSDFaceTimeIDSProviderDelegateCapabilities

- (BOOL)isMomentsAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_10027E104();

  return v3 & 1;
}

- (CSDFaceTimeIDSProviderDelegateCapabilities)init
{
  return (CSDFaceTimeIDSProviderDelegateCapabilities *)sub_10023A834();
}

@end