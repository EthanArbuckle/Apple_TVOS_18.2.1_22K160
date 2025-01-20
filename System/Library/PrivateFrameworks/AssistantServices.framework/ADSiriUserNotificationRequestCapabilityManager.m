@interface ADSiriUserNotificationRequestCapabilityManager
+ (Class)_classForPlatform:(int64_t)a3;
@end

@implementation ADSiriUserNotificationRequestCapabilityManager

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t IsValid = AFSiriAnnouncementPlatformGetIsValid(a3, a2);
  if ((IsValid & 1) != 0)
  {
    if (((1LL << a3) & 0x1A) == 0)
    {
      v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      int v8 = 136315394;
      v9 = "+[ADSiriUserNotificationRequestCapabilityManager _classForPlatform:]";
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s platform %li is not valid, using headphones provider.",  (uint8_t *)&v8,  0x16u);
    }
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___ADHeadphonesAnnouncementRequestCapabilityProvider);
  uint64_t IsValid = objc_claimAutoreleasedReturnValue(v6);
  return (Class)(id)IsValid;
}

@end