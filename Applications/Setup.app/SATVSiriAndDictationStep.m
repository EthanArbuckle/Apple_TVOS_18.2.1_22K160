@interface SATVSiriAndDictationStep
+ (NSString)stableIdentifier;
+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)_handleSiriConsent:(int64_t)a3 dictationConsent:(int64_t)a4 typeToSiriEnabled:(int64_t)a5 TTSUDeviceSiriLanguage:(id)a6;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithConsentForSiri:(BOOL)a3 consentForDictation:(BOOL)a4 typeToSiri:(BOOL)a5 TTSUDeviceSiriLanguage:(id)a6;
- (void)_reset;
- (void)_showViewControllerBasedOnSiriAvailability:(BOOL)a3 TTSUDeviceSiriLanguage:(id)a4;
- (void)autoAdvance;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVSiriAndDictationStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVSiriAndDictationStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVSiriAndDictationStep");
    v3 = (void *)qword_100109978;
    qword_100109978 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVSiriStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipSiri];

  if (!v6)
  {
    if (![v4 isNavigationFlowForward])
    {
      v25 = (os_log_s *)qword_100109978;
      if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear anything that was previously set up for this step.",  buf,  2u);
      }

      -[SATVSiriAndDictationStep _reset](self, "_reset");
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
      if (v9) {
        v8 = 0LL;
      }
      else {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
      }
      goto LABEL_40;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 tapToSetupDeviceInfo]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 siriLanguage]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
    unsigned int v13 = [v12 isSiriAvailableForCurrentSystemLanguage];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
    unsigned int v15 = 0;
    if ([v14 isSiriAllowed] && v11)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
      unsigned int v15 = [v16 isSiriSupportedForLanguage:v11];
    }

    uint64_t v17 = v13 | v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
    unsigned __int8 v19 = [v18 isDictationAvailable];

    if ((v17 & 1) != 0 || (v19 & 1) != 0)
    {
      if (![v9 isExpressTapToSetupEnabled]
        || ![v9 isExpressTapToSetupEnabledForAnyItemTypes:3])
      {
        goto LABEL_33;
      }

      id v26 = [v9 expressTapToSetupItemTypes];
      id v27 = v26;
      else {
        uint64_t v28 = -1LL;
      }
      uint64_t v47 = v28;
      else {
        uint64_t v29 = -1LL;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue([v9 tapToSetupDeviceInfo]);
      id v31 = [v30 isTypeToSiriEnabled];

      else {
        uint64_t v32 = -1LL;
      }
      v33 = (void *)qword_100109978;
      if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
      {
        log = v33;
        uint64_t v34 = TVSKExpressTapToSetupItemTypesDescription(v27);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v34);
        uint64_t v35 = TVCSTriStateBoolLogString(v47);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        uint64_t v37 = TVCSTriStateBoolLogString(v29);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v39 = TVCSTriStateBoolLogString(v32);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        *(_DWORD *)buf = 138413058;
        *(void *)v49 = v45;
        *(_WORD *)&v49[8] = 2114;
        *(void *)&v49[10] = v36;
        *(_WORD *)&v49[18] = 2114;
        *(void *)&v49[20] = v38;
        __int16 v50 = 2114;
        v51 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup is enabled and Siri/Dictation was shown to the user. Will apply Siri/Dictation settings a nd skip step. itemTypesShownToUser=%@, siriConsent=%{public}@, dictationConsent=%{public}@, typeToSiriEnabled=%{public}@",  buf,  0x2Au);
      }

      uint64_t v24 = objc_claimAutoreleasedReturnValue( -[SATVSiriAndDictationStep _handleSiriConsent:dictationConsent:typeToSiriEnabled:TTSUDeviceSiriLanguage:]( self,  "_handleSiriConsent:dictationConsent:typeToSiriEnabled:TTSUDeviceSiriLanguage:",  v47,  v29,  v32,  v11));
    }

    else
    {
      v20 = (void *)qword_100109978;
      if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
        *(_DWORD *)buf = 138543618;
        *(void *)v49 = v22;
        *(_WORD *)&v49[8] = 2114;
        *(void *)&v49[10] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Neither Siri or dictation is available for the current system language or TTSU device language. Will skip. {cu rrentSystemLanguage=%{public}@, TTSUDeviceSiriLanguage=%{public}@}",  buf,  0x16u);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
      [v23 setOfferedEnableDictation:1];

      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
    }

    v8 = (void *)v24;
    if (v24)
    {
LABEL_38:

LABEL_40:
      goto LABEL_41;
    }

- (void)autoAdvance
{
  v3 = (os_log_s *)qword_100109978;
  if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v4,  2u);
  }

  -[SATVSiriAndDictationStep _completeStepWithConsentForSiri:consentForDictation:typeToSiri:TTSUDeviceSiriLanguage:]( self,  "_completeStepWithConsentForSiri:consentForDictation:typeToSiri:TTSUDeviceSiriLanguage:",  0LL,  0LL,  0LL,  0LL);
}

+ (id)expressTapToSetupItemWithTapToSetupDeviceInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 siriLanguage]);
  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 siriLanguage]);
    unsigned int v8 = [v6 isSiriSupportedForLanguage:v7];
  }

  else
  {
    unsigned int v8 = 0;
  }

  if ([v4 isSiriAvailableForCurrentSystemLanguage])
  {
    unsigned int v9 = 1;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
    unsigned int v9 = [v10 isSiriAllowed] & v8;
  }

  unsigned int v11 = [v4 isDictationAvailable];
  uint64_t v12 = (uint64_t)[v3 isSiriEnabled];
  id v13 = [v3 isSiriDictationEnabled];
  if (v12 != 1 && v13 != (id)1) {
    goto LABEL_9;
  }
  int v14 = v11 ^ 1;
  if (((v9 ^ 1) & 1) == 0 && (v14 & 1) == 0)
  {
    uint64_t v12 = v12 == 1;
    if (v13 == (id)1)
    {
      v12 |= 2uLL;
LABEL_18:
      if ((v12 & 1) != 0) {
        unsigned int v15 = @"EXPRESS_SETUP_SIRI_INFO";
      }
      else {
        unsigned int v15 = @"EXPRESS_SETUP_DICTATION_ONLY_INFO";
      }
      goto LABEL_23;
    }

- (void)_reset
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  [v2 resetSiriAndDictationState];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  [v3 resetTypeToSiriState];
}

- (void)_showViewControllerBasedOnSiriAvailability:(BOOL)a3 TTSUDeviceSiriLanguage:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  if (v4)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___SATVSiriAndDictationViewController);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004903C;
    v18[3] = &unk_1000CA610;
    unsigned int v8 = v18;
    unsigned int v9 = &v19;
    objc_copyWeak(&v19, &location);
    v18[4] = v6;
    -[SATVSiriAndDictationViewController setCompletionHandler:](v7, "setCompletionHandler:", v18);
  }

  else
  {
    v7 = objc_alloc_init(&OBJC_CLASS___SATVDictationOnlyViewController);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100049088;
    v16[3] = &unk_1000CA610;
    unsigned int v8 = v16;
    unsigned int v9 = &v17;
    objc_copyWeak(&v17, &location);
    v16[4] = v6;
    -[SATVSiriAndDictationViewController setCompletionHandler:](v7, "setCompletionHandler:", v16);
  }

  objc_destroyWeak(v9);
  unsigned int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_1000490D4;
  int v14 = &unk_1000C93A0;
  objc_copyWeak(&v15, &location);
  -[SATVSiriAndDictationViewController setMenuHandler:](v7, "setMenuHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriAndDictationStep stepDelegate](self, "stepDelegate", v11, v12, v13, v14));
  [v10 step:self displayViewController:v7];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_handleSiriConsent:(int64_t)a3 dictationConsent:(int64_t)a4 typeToSiriEnabled:(int64_t)a5 TTSUDeviceSiriLanguage:(id)a6
{
  id v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  [v10 handleSiriAndDictationOfferWithSiriConsent:a3 andDictationConsent:a4];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  [v11 handleTypeToSiriPreference:a5];

  if (a3 == 1)
  {
    if (v9)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
      unsigned int v14 = [v13 isSiriSupportedForLanguage:v9];

      if (v14)
      {
        id v15 = (os_log_s *)qword_100109978;
        if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138543362;
          id v23 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Setting Siri language to TTSU device Siri language. {TTSUDeviceSiriLanguage=%{public}@}",  (uint8_t *)&v22,  0xCu);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
        [v16 setSiriLanguage:v9];
      }
    }
  }

  BOOL v18 = a3 == 1 || a4 == 1;
  id v19 = +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(v18, v12));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return v20;
}

- (void)_completeStepWithConsentForSiri:(BOOL)a3 consentForDictation:(BOOL)a4 typeToSiri:(BOOL)a5 TTSUDeviceSiriLanguage:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  uint64_t v12 = TVCSTriStateBoolForBool(v8, v11);
  uint64_t v14 = TVCSTriStateBoolForBool(v7, v13);
  id v16 = -[SATVSiriAndDictationStep _handleSiriConsent:dictationConsent:typeToSiriEnabled:TTSUDeviceSiriLanguage:]( self,  "_handleSiriConsent:dictationConsent:typeToSiriEnabled:TTSUDeviceSiriLanguage:",  v12,  v14,  TVCSTriStateBoolForBool(v6, v15),  v10);
  id v18 = (id)objc_claimAutoreleasedReturnValue(v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVSiriAndDictationStep stepDelegate](self, "stepDelegate"));
  [v17 step:self didCompleteWithResult:v18];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end