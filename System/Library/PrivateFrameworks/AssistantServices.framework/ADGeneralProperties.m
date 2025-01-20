@interface ADGeneralProperties
- (ADGeneralProperties)initWithQueue:(id)a3;
- (BOOL)_getIsStoreDemoMode;
- (id)_getSystemLocale;
- (int)_getUTCOffset;
- (void)_getStoreFrontIdWithCompletion:(id)a3;
- (void)getODDGeneralPropertiesWithCompletion:(id)a3;
@end

@implementation ADGeneralProperties

- (ADGeneralProperties)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADGeneralProperties;
  v6 = -[ADGeneralProperties init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)getODDGeneralPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADGeneralProperties getODDGeneralPropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDGeneralProperties);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADGeneralProperties _getSystemLocale](self, "_getSystemLocale"));
  [v6 setSystemLocale:v7];

  objc_msgSend(v6, "setUTCOffset:", -[ADGeneralProperties _getUTCOffset](self, "_getUTCOffset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADGeneralProperties _getDeviceType](self, "_getDeviceType"));
  [v6 setDeviceType:v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADGeneralProperties _getModelNumber](self, "_getModelNumber"));
  [v6 setModelNumber:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADGeneralProperties _getDeviceOS](self, "_getDeviceOS"));
  [v6 setDeviceOS:v10];

  objc_msgSend(v6, "setIsStoreDemoMode:", -[ADGeneralProperties _getIsStoreDemoMode](self, "_getIsStoreDemoMode"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011B5B0;
  v13[3] = &unk_1004F1DD0;
  id v14 = v6;
  id v15 = v4;
  id v11 = v4;
  id v12 = v6;
  -[ADGeneralProperties _getStoreFrontIdWithCompletion:](self, "_getStoreFrontIdWithCompletion:", v13);
}

- (id)_getSystemLocale
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:NSLocaleIdentifier]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uppercaseString]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"-" withString:@"_"]);

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"LOCALE_%@",  v5));
  if ([v6 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    uint64_t v7 = 0LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_AR_AE"])
  {
    uint64_t v7 = 1LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_AR_SA"])
  {
    uint64_t v7 = 2LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_CA_ES"])
  {
    uint64_t v7 = 3LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_CS_CZ"])
  {
    uint64_t v7 = 4LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_DA_DK"])
  {
    uint64_t v7 = 5LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_DE_AT"])
  {
    uint64_t v7 = 6LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_DE_CH"])
  {
    uint64_t v7 = 7LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_DE_DE"])
  {
    uint64_t v7 = 8LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EL_GR"])
  {
    uint64_t v7 = 9LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_AE"])
  {
    uint64_t v7 = 10LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_AU"])
  {
    uint64_t v7 = 11LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_CA"])
  {
    uint64_t v7 = 12LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_GB"])
  {
    uint64_t v7 = 13LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_ID"])
  {
    uint64_t v7 = 14LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_IE"])
  {
    uint64_t v7 = 15LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_IN"])
  {
    uint64_t v7 = 16LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_MY"])
  {
    uint64_t v7 = 17LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_NZ"])
  {
    uint64_t v7 = 18LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_PH"])
  {
    uint64_t v7 = 19LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_SG"])
  {
    uint64_t v7 = 20LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_SA"])
  {
    uint64_t v7 = 21LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_US"])
  {
    uint64_t v7 = 22LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_EN_ZA"])
  {
    uint64_t v7 = 23LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ES_CL"])
  {
    uint64_t v7 = 24LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ES_CO"])
  {
    uint64_t v7 = 25LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ES_ES"])
  {
    uint64_t v7 = 26LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ES_MX"])
  {
    uint64_t v7 = 27LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ES_US"])
  {
    uint64_t v7 = 28LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_FI_FI"])
  {
    uint64_t v7 = 29LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_FR_BE"])
  {
    uint64_t v7 = 30LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_FR_CA"])
  {
    uint64_t v7 = 31LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_FR_CH"])
  {
    uint64_t v7 = 32LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_FR_FR"])
  {
    uint64_t v7 = 33LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_HE_IL"])
  {
    uint64_t v7 = 34LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_HI_IN"])
  {
    uint64_t v7 = 35LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_HR_HR"])
  {
    uint64_t v7 = 36LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_HU_HU"])
  {
    uint64_t v7 = 37LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ID_ID"])
  {
    uint64_t v7 = 38LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_IT_CH"])
  {
    uint64_t v7 = 39LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_IT_IT"])
  {
    uint64_t v7 = 40LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_JA_JP"])
  {
    uint64_t v7 = 41LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_KO_KR"])
  {
    uint64_t v7 = 42LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_MS_MY"])
  {
    uint64_t v7 = 43LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_NB_NO"])
  {
    uint64_t v7 = 44LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_NL_BE"])
  {
    uint64_t v7 = 45LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_NL_NL"])
  {
    uint64_t v7 = 46LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_PL_PL"])
  {
    uint64_t v7 = 47LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_PT_BR"])
  {
    uint64_t v7 = 48LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_PT_PT"])
  {
    uint64_t v7 = 49LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_RO_RO"])
  {
    uint64_t v7 = 50LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_RU_RU"])
  {
    uint64_t v7 = 51LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_SK_SK"])
  {
    uint64_t v7 = 52LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_SV_SE"])
  {
    uint64_t v7 = 53LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_TH_TH"])
  {
    uint64_t v7 = 54LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_TR_TR"])
  {
    uint64_t v7 = 55LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_UK_UA"])
  {
    uint64_t v7 = 56LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_VI_VN"])
  {
    uint64_t v7 = 57LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_WUU_CN"])
  {
    uint64_t v7 = 58LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_YUE_CN"])
  {
    uint64_t v7 = 59LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ZH_CN"])
  {
    uint64_t v7 = 60LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ZH_HK"])
  {
    uint64_t v7 = 61LL;
  }

  else if ([v6 isEqualToString:@"LOCALE_ZH_TW"])
  {
    uint64_t v7 = 62LL;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADAssistantPropertiesUtils SISchemaLocaleToSISchemaISOLocale:]( &OBJC_CLASS___ADAssistantPropertiesUtils,  "SISchemaLocaleToSISchemaISOLocale:",  v7));
  return v8;
}

- (void)_getStoreFrontIdWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADGeneralProperties _getStoreFrontIdWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Retrieving", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10011B310;
  v26 = sub_10011B320;
  id v27 = 0LL;
  id v6 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10011B328;
  v20[3] = &unk_1004F1DF8;
  v20[4] = self;
  p___int128 buf = &buf;
  id v7 = v4;
  id v21 = v7;
  id v8 = [v6 initWithBlock:v20];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10011B3D4;
  v18[3] = &unk_1004F9878;
  id v10 = v8;
  id v19 = v10;
  [v9 getiTunesStoreFrontIdentifierWithCompletion:v18];

  id v11 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10011B3E0;
  v16[3] = &unk_1004FD940;
  id v13 = v10;
  id v17 = v13;
  id v14 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v11,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v16,  3.0);
  id v15 = *(void **)(*((void *)&buf + 1) + 40LL);
  *(void *)(*((void *)&buf + 1) + 40LL) = v14;

  [*(id *)(*((void *)&buf + 1) + 40) start];
  _Block_object_dispose(&buf, 8);
}

- (int)_getUTCOffset
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"ZZZZZ");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  -[NSDateFormatter setTimeZone:](v2, "setTimeZone:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  LODWORD(v4) = +[ADGeneralPropertiesUtils SISchemaUTCOffsetFromTimeZoneOffset:]( &OBJC_CLASS___ADGeneralPropertiesUtils,  "SISchemaUTCOffsetFromTimeZoneOffset:",  v5);
  return (int)v4;
}

- (BOOL)_getIsStoreDemoMode
{
  if (qword_1005780A8 != -1) {
    dispatch_once(&qword_1005780A8, &stru_1004F5FE0);
  }
  return byte_1005780A1;
}

- (void).cxx_destruct
{
}

@end