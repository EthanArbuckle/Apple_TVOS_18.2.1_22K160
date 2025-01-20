@interface CSDMomentsControllerLocalCapabilities
- (BOOL)isEnabled;
- (BOOL)isRegionBlocked;
- (CSDMomentsControllerLocalCapabilities)init;
@end

@implementation CSDMomentsControllerLocalCapabilities

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_10023A7B4();

  return v3 & 1;
}

- (BOOL)isRegionBlocked
{
  v2 = self;
  unsigned __int8 v3 = sub_10023A80C();

  return v3 & 1;
}

- (CSDMomentsControllerLocalCapabilities)init
{
  return (CSDMomentsControllerLocalCapabilities *)sub_10023A834();
}

@end