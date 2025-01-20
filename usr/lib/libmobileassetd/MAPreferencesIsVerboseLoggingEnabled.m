@interface MAPreferencesIsVerboseLoggingEnabled
@end

@implementation MAPreferencesIsVerboseLoggingEnabled

void ___MAPreferencesIsVerboseLoggingEnabled_block_invoke(id a1)
{
  if (_MAPreferencesIsInternalAllowed_onceToken != -1) {
    dispatch_once(&_MAPreferencesIsInternalAllowed_onceToken, &__block_literal_global_794);
  }
  if (_MAPreferencesIsInternalAllowed__isAppleInternal)
  {
    char v2 = 0;
    unsigned __int8 AppBooleanValue = _MAPreferencesGetAppBooleanValue(@"EnableVerboseLogging", &v2);
    if (v2) {
      _MAPreferencesIsVerboseLoggingEnabled__verboseLoggingEnabled = AppBooleanValue;
    }
  }

@end