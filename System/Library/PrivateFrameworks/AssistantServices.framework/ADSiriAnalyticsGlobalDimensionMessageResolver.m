@interface ADSiriAnalyticsGlobalDimensionMessageResolver
- (ADSiriAnalyticsGlobalDimensionMessageResolver)initWithQueue:(id)a3;
- (BOOL)handlesMessage:(id)a3;
- (id)_resolveDeviceFixedContext:(id)a3;
- (id)_resolveSiriAccountInformation:(id)a3;
- (void)resolveMessage:(id)a3 completion:(id)a4;
@end

@implementation ADSiriAnalyticsGlobalDimensionMessageResolver

- (ADSiriAnalyticsGlobalDimensionMessageResolver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADSiriAnalyticsGlobalDimensionMessageResolver;
  v6 = -[ADSiriAnalyticsGlobalDimensionMessageResolver init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)handlesMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___DIMSchemaDIMClientEvent);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0) {
    goto LABEL_9;
  }
  id v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceFixedContext]);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 siriAccountInformation]);

    if (v7) {
      goto LABEL_5;
    }

LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }

LABEL_5:
  v8 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver handlesMessage:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Handling message: %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (void)resolveMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, BOOL))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceFixedContext]);
  BOOL v9 = v8 != 0LL;

  if (v8)
  {
    v10 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver resolveMessage:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Resolving deviceFixedContext for message: %@",  (uint8_t *)&v19,  0x16u);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceFixedContext]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADSiriAnalyticsGlobalDimensionMessageResolver _resolveDeviceFixedContext:]( self,  "_resolveDeviceFixedContext:",  v11));
    [v6 setDeviceFixedContext:v12];
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 siriAccountInformation]);

  if (v13)
  {
    id v14 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver resolveMessage:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Resolving siriAccountInformation for message: %@",  (uint8_t *)&v19,  0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 siriAccountInformation]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADSiriAnalyticsGlobalDimensionMessageResolver _resolveSiriAccountInformation:]( self,  "_resolveSiriAccountInformation:",  v15));
    [v6 setSiriAccountInformation:v16];

    v17 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver resolveMessage:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Firing off DIM logging for message: %@",  (uint8_t *)&v19,  0x16u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider sharedInstance]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "sharedInstance"));
    [v18 asyncLogAnalyticsIdentifiersDIMEvents];

    BOOL v9 = 1LL;
  }

  v7[2](v7, v6, v9);
}

- (id)_resolveDeviceFixedContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v6 = v5;
  v55 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 countryCode]);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 languageCode]);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v8, v9));
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 languageCode]);
    }

    if (v10) {
      objc_msgSend( v3,  "setSystemLocale:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v10));
    }

    id v6 = v55;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 languageCode]);
  v54 = (void *)v11;
  if (v11) {
    id v12 = +[SIUtilities convertLanguageCodeToSchemaLocale:]( &OBJC_CLASS___SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v11);
  }
  else {
    id v12 = 0LL;
  }
  [v3 setSiriInputLocale:v12];
  id v13 = objc_alloc_init(&OBJC_CLASS___SISchemaVoiceSettings);
  [v13 setVoiceGender:0];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
  id v15 = [v14 gender];

  if (v15 == (id)2)
  {
    uint64_t v16 = 1LL;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
    id v18 = [v17 gender];

    if (v18 == (id)1)
    {
      uint64_t v16 = 2LL;
    }

    else
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
      id v20 = [v19 gender];

      if (v20 != (id)3) {
        goto LABEL_18;
      }
      uint64_t v16 = 3LL;
    }
  }

  [v13 setVoiceGender:v16];
LABEL_18:
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 languageCode]);

  if (v22) {
    objc_msgSend( v13,  "setVoiceAccent:",  +[SIUtilities convertLanguageCodeToSchemaLocale:]( SIUtilities,  "convertLanguageCodeToSchemaLocale:",  v22));
  }
  v52 = (void *)v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
  [v13 setVoiceName:v24];

  [v3 setSiriVoiceSettings:v13];
  v25 = (char *)[v4 siriDataSharingOptInStatus] - 1;
  else {
    uint64_t v26 = 0LL;
  }
  [v3 setDataSharingOptInState:v26];
  id v27 = [v4 searchQueriesDataSharingStatus];
  if (v27 == (id)1) {
    uint64_t v28 = 1LL;
  }
  else {
    uint64_t v28 = 2 * (v27 == (id)2);
  }
  [v3 setSearchDataOptOutState:v28];
  v29 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v29, "setDateFormat:", @"ZZZZZ");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  -[NSDateFormatter setTimeZone:](v29, "setTimeZone:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v29, "stringFromDate:", v31));

  v51 = (void *)v32;
  uint64_t v33 = AFBuildVersion([v3 setTimezoneOffset:v32]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  [v3 setSystemBuild:v34];

  uint64_t v35 = AFProductTypeForInstrumentation();
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  [v3 setDeviceType:v36];

  v37 = (void *)objc_claimAutoreleasedReturnValue([v4 countryCode]);
  if (v37) {
    objc_msgSend( v3,  "setCountryCode:",  +[SIUtilities convertCountryCodeToSchemaCountryCode:]( SIUtilities,  "convertCountryCodeToSchemaCountryCode:",  v37));
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  else {
    uint64_t v39 = 1LL;
  }
  [v3 setHomeKitConfiguration:v39];

  if (qword_1005780A8 != -1) {
    dispatch_once(&qword_1005780A8, &stru_1004F5FE0);
  }
  v53 = v13;
  [v3 setIsStoreDemoMode:byte_1005780A1];
  if (([v3 hasTimeIntervalSince1970] & 1) == 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v40 timeIntervalSince1970];
    objc_msgSend(v3, "setTimeIntervalSince1970:");
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue([v4 productTypePrefix]);
  [v3 setDataCollectionId:v41];

  v42 = (void *)objc_claimAutoreleasedReturnValue([v6 languageCode]);
  [v3 setEffectiveSystemLanguage:v42];
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  [v3 setPreferredLanguages:v43];
  id v44 = objc_alloc_init(&OBJC_CLASS___DIMSchemaEntitySyncSettings);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  objc_msgSend(v44, "setIsMediaEntitySyncEnabled:", objc_msgSend(v45, "isMediaEntitySyncDisabled") ^ 1);

  [v3 setEntitySyncSettings:v44];
  id v46 = objc_alloc_init(&OBJC_CLASS___DIMSchemaDIMDataSharingSettings);
  id v47 = [v46 setIsAppAnalyticsEnabled:sub_1001EC114()];
  [v46 setIsDiagnosticsAndUsageEnabled:AFDiagnosticsSubmissionAllowed(v47)];
  [v3 setDataSharingSettings:v46];
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 activeDictationLanguages]);

  if (v49) {
    objc_msgSend(v3, "setAvailableDictationKeyboards:", objc_msgSend(v49, "count"));
  }

  return v3;
}

- (id)_resolveSiriAccountInformation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v5 = [v4 longLivedIdentifierUploadingEnabled];

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
    v7 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantIdentifier]);
      int v17 = 136315394;
      id v18 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver _resolveSiriAccountInformation:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s #RPI: resolving DIMSchemaDIMSiriAccountInformation assistantIdentifier=%@",  (uint8_t *)&v17,  0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 assistantIdentifier]);
    [v3 setSiriDeviceId:v10];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserIdentifier]);
    [v3 setSiriUserId:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 speechIdentifier]);
    [v3 setSiriSpeechId:v13];

    id v14 = v3;
  }

  else
  {
    id v15 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      id v18 = "-[ADSiriAnalyticsGlobalDimensionMessageResolver _resolveSiriAccountInformation:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s #RPI: resolving nil DIMSchemaDIMSiriAccountInformation",  (uint8_t *)&v17,  0xCu);
    }

    id v14 = 0LL;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end