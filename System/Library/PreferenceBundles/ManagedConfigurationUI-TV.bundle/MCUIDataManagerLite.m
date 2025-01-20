@interface MCUIDataManagerLite
- (BOOL)isDeviceManagementHidden;
@end

@implementation MCUIDataManagerLite

- (BOOL)isDeviceManagementHidden
{
  return +[MCUIDataManager _isDeviceManagementHiddenConcrete]( &OBJC_CLASS___MCUIDataManager,  "_isDeviceManagementHiddenConcrete");
}

@end