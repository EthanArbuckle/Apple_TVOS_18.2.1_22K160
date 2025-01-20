@interface FTDeviceDataSource
- (BOOL)isBootLockEnabled;
@end

@implementation FTDeviceDataSource

- (BOOL)isBootLockEnabled
{
  return MKBDeviceUnlockedSinceBoot(self, a2) != 1;
}

@end