@interface MAPreferencesIsCentralizedCacheDeleteEnabled
@end

@implementation MAPreferencesIsCentralizedCacheDeleteEnabled

void ___MAPreferencesIsCentralizedCacheDeleteEnabled_block_invoke(id a1)
{
  if (_MAPreferencesIsInternalAllowed_onceToken != -1) {
    dispatch_once(&_MAPreferencesIsInternalAllowed_onceToken, &__block_literal_global_794);
  }
  if (_MAPreferencesIsInternalAllowed__isAppleInternal)
  {
    char v2 = 0;
    unsigned __int8 AppBooleanValue = _MAPreferencesGetAppBooleanValue(@"EnableCentralizedCacheDelete", &v2);
    if (v2) {
      _MAPreferencesIsCentralizedCacheDeleteEnabled__centralizedCacheDeleteEnabled = AppBooleanValue;
    }
  }

@end