@interface ADSiriAnnouncementRequestCapabilityManager
+ (Class)_classForPlatform:(int64_t)a3;
@end

@implementation ADSiriAnnouncementRequestCapabilityManager

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t IsValid = AFSiriAnnouncementPlatformGetIsValid(a3, a2);
  if ((IsValid & 1) != 0)
  {
    if (((1LL << a3) & 0x1A) == 0)
    {
      if (((1LL << a3) & 0x21) == 0)
      {
        v6 = off_1004E5468;
        goto LABEL_9;
      }

      v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      int v9 = 136315394;
      v10 = "+[ADSiriAnnouncementRequestCapabilityManager _classForPlatform:]";
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s platform %li is not valid, using headphones provider.",  (uint8_t *)&v9,  0x16u);
    }
  }

  v6 = off_1004E5480;
LABEL_9:
  uint64_t v7 = objc_opt_class(*v6);
  uint64_t IsValid = objc_claimAutoreleasedReturnValue(v7);
  return (Class)(id)IsValid;
}

@end