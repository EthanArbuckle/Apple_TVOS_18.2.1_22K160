@interface WLDPushParsing
+ (id)accountIdentifierForNotification:(id)a3;
+ (int64_t)actionTypeForNotification:(id)a3;
@end

@implementation WLDPushParsing

+ (int64_t)actionTypeForNotification:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "wlk_numberForKey:", @"1"));
  v4 = v3;
  if (v3)
  {
    v5 = (char *)[v3 unsignedIntegerValue];
    v6 = v5 - 21;
    if ((unint64_t)(v5 - 21) < 0x11 && ((0x1F401u >> (char)v6) & 1) != 0)
    {
      int64_t v13 = qword_1000345D8[(void)v6];
      goto LABEL_10;
    }

    uint64_t v7 = WLKPushNotificationsLogObject(v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v4;
      v9 = "WLDPushParsing - Unknown action type: %@";
      v10 = v8;
      uint32_t v11 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
    }
  }

  else
  {
    uint64_t v12 = WLKPushNotificationsLogObject(0LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v9 = "WLDPushParsing - No value found for action type in payload";
      v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_8;
    }
  }

  int64_t v13 = -1LL;
LABEL_10:

  return v13;
}

+ (id)accountIdentifierForNotification:(id)a3
{
  return objc_msgSend(a3, "wlk_numberForKey:", @"0");
}

@end