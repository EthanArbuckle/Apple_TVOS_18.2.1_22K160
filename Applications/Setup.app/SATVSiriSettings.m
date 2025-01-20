@interface SATVSiriSettings
+ (id)sharedInstance;
- (BOOL)_isDictationAllowed;
- (BOOL)isDataSharingEnabled;
- (BOOL)isDictationAvailable;
- (BOOL)isDictationEnabled;
- (BOOL)isSiriAllowed;
- (BOOL)isSiriAvailableForCurrentSystemLanguage;
- (BOOL)isSiriEnabled;
- (BOOL)isSiriOrDictationAvailableForCurrentSystemLanguage;
- (BOOL)isSiriSupportedForLanguage:(id)a3;
- (BOOL)offeredDataSharing;
- (BOOL)offeredEnableDictation;
- (BOOL)offeredEnableSiri;
- (NSString)bestSiriLanguageForCurrentSystemLanguage;
- (NSString)siriLanguage;
- (SATVSiriSettings)init;
- (unint64_t)rollbackDataSharingOptInStatus;
- (void)_setCoreLocationAuthorizationStatus:(int)a3;
- (void)_setDataSharingStatus:(unint64_t)a3 andReason:(id)a4;
- (void)_updateSiriConsent:(int64_t)a3 andDictationConsent:(int64_t)a4;
- (void)handleDataSharingOfferWithEnableDataSharing:(BOOL)a3;
- (void)handleSiriAndDictationOfferWithSiriConsent:(int64_t)a3 andDictationConsent:(int64_t)a4;
- (void)handleTypeToSiriPreference:(int64_t)a3;
- (void)resetDataSharingState;
- (void)resetSiriAndDictationState;
- (void)resetTypeToSiriState;
- (void)rollbackDataSharingState;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setOfferedEnableDictation:(BOOL)a3;
- (void)setOfferedEnableSiri:(BOOL)a3;
- (void)setRollbackDataSharingOptInStatus:(unint64_t)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSiriLanguage:(id)a3;
@end

@implementation SATVSiriSettings

+ (id)sharedInstance
{
  if (qword_100109A10 != -1) {
    dispatch_once(&qword_100109A10, &stru_1000CAE40);
  }
  return (id)qword_100109A08;
}

- (SATVSiriSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVSiriSettings;
  v2 = -[SATVSiriSettings init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    v2->_rollbackDataSharingOptInStatus = (unint64_t)[v3 dataSharingOptInStatus];
  }

  return v2;
}

- (BOOL)isSiriAvailableForCurrentSystemLanguage
{
  BOOL v2 = -[SATVSiriSettings isSiriAllowed](self, "isSiriAllowed");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 isSiriSupportedForCurrentSystemLanguage];

    LOBYTE(v2) = v4;
  }

  return v2;
}

- (BOOL)isSiriAllowed
{
  return MGGetBoolAnswer(@"assistant");
}

- (BOOL)isSiriEnabled
{
  BOOL v2 = -[SATVSiriSettings isSiriAllowed](self, "isSiriAllowed");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 isSiriEnabled];

    LOBYTE(v2) = v4;
  }

  return v2;
}

- (void)setSiriEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = -[SATVSiriSettings isSiriAllowed](self, "isSiriAllowed");
  id v6 = sub_10006173C();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Siri is not allowed. Will ignore request to enable/disable Siri",  (uint8_t *)&v12,  2u);
    }

    goto LABEL_10;
  }

  if (v8)
  {
    int v12 = 67109120;
    LODWORD(v13) = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling Siri: %{BOOL}d", (uint8_t *)&v12, 8u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v9 setSiriEnabled:v3];

  if (v3)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[SATVSiriSettings bestSiriLanguageForCurrentSystemLanguage]( self,  "bestSiriLanguageForCurrentSystemLanguage"));
    -[SATVSiriSettings setSiriLanguage:](self, "setSiriLanguage:", v7);
    id v10 = sub_10006173C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Siri language set to %@",  (uint8_t *)&v12,  0xCu);
    }

LABEL_10:
  }

- (NSString)siriLanguage
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 language]);

  return (NSString *)v3;
}

- (void)setSiriLanguage:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v4 setLanguage:v3];
}

- (NSString)bestSiriLanguageForCurrentSystemLanguage
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bestSiriLanguageForCurrentSystemLanguage]);

  return (NSString *)v3;
}

- (BOOL)offeredEnableSiri
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 offeredEnableAssistant];

  return v3;
}

- (void)setOfferedEnableSiri:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v5 setOfferedEnableAssistant:v3];

  if (v3) {
    uint64_t v6 = 4LL;
  }
  else {
    uint64_t v6 = 0LL;
  }
  -[SATVSiriSettings _setCoreLocationAuthorizationStatus:](self, "_setCoreLocationAuthorizationStatus:", v6);
}

- (BOOL)isSiriSupportedForLanguage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v5 = [v4 isSiriSupportedForLanguage:v3];

  return v5;
}

- (BOOL)isDictationAvailable
{
  BOOL v2 = -[SATVSiriSettings _isDictationAllowed](self, "_isDictationAllowed");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 isDictationSupportedForPreferredLanguages];

    LOBYTE(v2) = v4;
  }

  return v2;
}

- (BOOL)isDictationEnabled
{
  BOOL v2 = -[SATVSiriSettings _isDictationAllowed](self, "_isDictationAllowed");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 isDictationEnabled];

    LOBYTE(v2) = v4;
  }

  return v2;
}

- (void)setDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SATVSiriSettings _isDictationAllowed](self, "_isDictationAllowed"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    [v6 setDictationEnabled:v3];
  }

  else
  {
    id v4 = sub_10006173C();
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Dictation is not allowed. Will ignore request to enable/disable Siri",  buf,  2u);
    }
  }

- (BOOL)offeredEnableDictation
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 offeredEnableDictation];

  return v3;
}

- (void)setOfferedEnableDictation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v4 setOfferedEnableDictation:v3];
}

- (BOOL)isSiriOrDictationAvailableForCurrentSystemLanguage
{
  if (-[SATVSiriSettings isSiriAvailableForCurrentSystemLanguage](self, "isSiriAvailableForCurrentSystemLanguage")) {
    return 1;
  }
  else {
    return -[SATVSiriSettings isDictationAvailable](self, "isDictationAvailable");
  }
}

- (void)handleSiriAndDictationOfferWithSiriConsent:(int64_t)a3 andDictationConsent:(int64_t)a4
{
}

- (void)resetSiriAndDictationState
{
}

- (void)resetTypeToSiriState
{
}

- (BOOL)isDataSharingEnabled
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  BOOL v3 = [v2 dataSharingOptInStatus] == (id)1;

  return v3;
}

- (BOOL)offeredDataSharing
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  BOOL v3 = [v2 dataSharingOptInStatus] != 0;

  return v3;
}

- (void)handleDataSharingOfferWithEnableDataSharing:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 2LL;
  }
  -[SATVSiriSettings _setDataSharingStatus:andReason:]( self,  "_setDataSharingStatus:andReason:",  v3,  @"User initiated change");
}

- (void)resetDataSharingState
{
}

- (void)rollbackDataSharingState
{
}

- (void)handleTypeToSiriPreference:(int64_t)a3
{
  uint64_t v3 = TVCSBoolForTriStateBool(a3, 0LL);
  AFPreferencesSetTypeToSiriEnabled(v3);
}

- (void)_setDataSharingStatus:(unint64_t)a3 andReason:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v6 setDataSharingOptInStatus:a3 propagateToHomeAccessories:0 source:1 reason:v5];
}

- (BOOL)_isDictationAllowed
{
  return MGGetBoolAnswer(@"assistant");
}

- (void)_updateSiriConsent:(int64_t)a3 andDictationConsent:(int64_t)a4
{
}

- (void)_setCoreLocationAuthorizationStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/AssistantServices.framework"));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:]( &OBJC_CLASS___CLLocationManager,  "setAuthorizationStatusByType:forBundle:",  v3,  v4);
}

- (unint64_t)rollbackDataSharingOptInStatus
{
  return self->_rollbackDataSharingOptInStatus;
}

- (void)setRollbackDataSharingOptInStatus:(unint64_t)a3
{
  self->_rollbackDataSharingOptInStatus = a3;
}

@end