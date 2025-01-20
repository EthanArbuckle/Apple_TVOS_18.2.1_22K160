@interface SATVChooseSetupMethodStep
+ (NSString)stableIdentifier;
- (BOOL)_isAuthenticated;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_applyPreferredLanguagesWithDeviceInfo:(id)a3;
- (void)_handleTapToSetupConsentWithDeviceInfo:(id)a3;
- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3;
- (void)_reset;
- (void)_showChooseSetupController;
- (void)autoAdvance;
- (void)didPerformTapToSetupWithDeviceInfo:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVChooseSetupMethodStep

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVChooseSetupMethodStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stepConfiguration]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodStepConfiguration, v6);
  id v8 = v5;
  v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      v10 = v9;
    }
    else {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  id v11 = v10;

  if (v11) {
    v12 = (SATVChooseSetupMethodStepConfiguration *)v11;
  }
  else {
    v12 = (SATVChooseSetupMethodStepConfiguration *)objc_claimAutoreleasedReturnValue( +[SATVChooseSetupMethodStepConfiguration defaultConfiguration]( &OBJC_CLASS___SATVChooseSetupMethodStepConfiguration,  "defaultConfiguration"));
  }
  configuration = self->_configuration;
  self->_configuration = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v15 = [v14 shouldSkipChooseSetupMethod];

  if (v15)
  {
    id v16 = sub_10002B074();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_31;
  }

  if ([v4 isNavigationFlowForward])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 tapToSetupDeviceInfo]);

    if (v20)
    {
      id v21 = sub_10002B074();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "We are moving forward in the flow and TTSU has been enabled. Apply preferred languages and skip.",  v37,  2u);
      }

      -[SATVChooseSetupMethodStep _applyPreferredLanguagesWithDeviceInfo:]( self,  "_applyPreferredLanguagesWithDeviceInfo:",  v20);
      -[SATVChooseSetupMethodStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 0LL);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));

      goto LABEL_31;
    }
  }

  else
  {
    id v23 = sub_10002B074();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "We are moving backwards. Clear anything that was previously set up for this step",  v36,  2u);
    }

    -[SATVChooseSetupMethodStep _reset](self, "_reset");
    -[SATVChooseSetupMethodStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 1LL);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodContainerViewController, v26);
  id v28 = v25;
  v29 = v28;
  if (v27)
  {
    if ((objc_opt_isKindOfClass(v28, v27) & 1) != 0) {
      v30 = v29;
    }
    else {
      v30 = 0LL;
    }
  }

  else
  {
    v30 = 0LL;
  }

  id v31 = v30;

  if (!v31)
  {
    id v32 = sub_10002B074();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Show a view controller for this step..",  v35,  2u);
    }

    -[SATVChooseSetupMethodStep _showChooseSetupController](self, "_showChooseSetupController");
  }

  v18 = 0LL;
LABEL_31:

  return v18;
}

- (void)autoAdvance
{
  id v3 = sub_10002B074();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Auto advance mode is on..", v5, 2u);
  }

  -[SATVChooseSetupMethodStep _handleTapToSetupConsentWithDeviceInfo:]( self,  "_handleTapToSetupConsentWithDeviceInfo:",  0LL);
}

- (void)didPerformTapToSetupWithDeviceInfo:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStep stepDelegate](self, "stepDelegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
  [v5 step:self didCompleteWithResult:v4];
}

- (void)_showChooseSetupController
{
  id v3 = -[SATVChooseSetupMethodContainerViewController initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SATVChooseSetupMethodContainerViewController),  "initWithConfiguration:",  self->_configuration);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E3B0;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVChooseSetupMethodContainerViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E3FC;
  v5[3] = &unk_1000C93A0;
  objc_copyWeak(&v6, &location);
  -[SATVChooseSetupMethodContainerViewController setManualFlowSelectedHandler:](v3, "setManualFlowSelectedHandler:", v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStep stepDelegate](self, "stepDelegate"));
  [v4 step:self displayViewController:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleTapToSetupConsentWithDeviceInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10002B074();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tap to set up was chosen as the preferred authentication mechanism. deviceInfo=%@",  (uint8_t *)&v14,  0xCu);
    }

    -[SATVChooseSetupMethodStep _applyPreferredLanguagesWithDeviceInfo:]( self,  "_applyPreferredLanguagesWithDeviceInfo:",  v4);
    -[SATVChooseSetupMethodStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 0LL);
  }

  else if (!-[SATVChooseSetupMethodStep _isAuthenticated](self, "_isAuthenticated"))
  {
    id v7 = sub_10002B074();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing all HK pairing identities.",  (uint8_t *)&v14,  2u);
    }

    v9 = objc_alloc_init(&OBJC_CLASS___HMHomeManager);
    -[HMHomeManager removeAllHomeKitPairingIdentities](v9, "removeAllHomeKitPairingIdentities");
    id v10 = sub_10002B074();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removed all HK pairing identities.",  (uint8_t *)&v14,  2u);
    }
  }

  v12 = -[SATVChooseSetupMethodStepResult initWithTapToSetupDeviceInfo:]( objc_alloc(&OBJC_CLASS___SATVChooseSetupMethodStepResult),  "initWithTapToSetupDeviceInfo:",  v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStep stepDelegate](self, "stepDelegate"));
  [v13 step:self didCompleteWithResult:v12];
}

- (void)_notifyTriggerStatusChangeAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || -[SATVChooseSetupMethodStep _isAuthenticated](self, "_isAuthenticated"))
  {
    id v5 = sub_10002B074();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending authentication trigger status did change.",  v10,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerAuthentication));
    id v8 = objc_alloc_init(&OBJC_CLASS___TVSKStepTriggersContext);
    [v8 setShouldReset:v3];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStep stepDelegate](self, "stepDelegate"));
    [v9 step:self triggerStatusDidChangeForTriggers:v7 context:v8];
  }

- (BOOL)_isAuthenticated
{
  v2 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v2, "activeAccount"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_reset
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SATVAuthenticationManager sharedInstance](&OBJC_CLASS___SATVAuthenticationManager, "sharedInstance"));
  [v2 logOutAccountType:0];
  [v2 logOutAccountType:2];
  [v2 logOutAccountType:1];
  [v2 logOutAccountType:4];
}

- (void)_applyPreferredLanguagesWithDeviceInfo:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl("UIKit", "tv_multilingual_keyboards"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    id v5 = sub_10002B074();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Transferring languages from iOS device",  buf,  2u);
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
    id v8 = sub_10002B074();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v108 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "tvOS device language is currently %{public}@",  buf,  0xCu);
    }

    v86 = (void *)v7;

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    v87 = v4;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredLanguages]);
    id v12 = [v11 countByEnumeratingWithState:&v98 objects:v106 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v99;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v99 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v105 = *(void *)(*((void *)&v98 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v105,  1LL));
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale minimizedLanguagesFromLanguages:]( &OBJC_CLASS___NSLocale,  "minimizedLanguagesFromLanguages:",  v16));
          [v10 addObjectsFromArray:v17];
        }

        id v13 = [v11 countByEnumeratingWithState:&v98 objects:v106 count:16];
      }

      while (v13);
    }

    id v18 = sub_10002B074();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v108 = (uint64_t)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Minimized tvOS languages: %{public}@",  buf,  0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCodes]);
    if (![v20 count])
    {
      id v21 = sub_10002B074();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "No preferred languages available from iOS device",  buf,  2u);
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCode]);
      id v24 = sub_10002B074();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v108 = (uint64_t)v23;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Using iOS device language %{public}@",  buf,  0xCu);
      }

      if (!v23 || ![v23 length])
      {
        id v26 = sub_10002B074();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1000765B4((uint64_t)v86, v27);
        }

        id v28 = v86;
        id v23 = v28;
      }

      v104 = v23;
      uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v104, 1LL));

      v20 = (void *)v29;
    }

    uint64_t v30 = objc_claimAutoreleasedReturnValue( +[TVSInternationalization allSupportedSystemLanguages]( &OBJC_CLASS___TVSInternationalization,  "allSupportedSystemLanguages"));
    id v31 = sub_10002B074();
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v108 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Candidate system languages for import: %{public}@",  buf,  0xCu);
    }

    uint64_t v33 = objc_claimAutoreleasedReturnValue([v3 region]);
    id v34 = sub_10002B074();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v108 = v33;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "iOS device region is %{public}@", buf, 0xCu);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
    uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 countryCode]);

    id v38 = sub_10002B074();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v108 = v37;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "tvOS device region is %{public}@", buf, 0xCu);
    }

    v84 = (void *)v37;
    v85 = (void *)v33;
    v88 = (void *)v30;

    id v40 = sub_10002B074();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v108 = (uint64_t)v20;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Languages to be considered from the iOS device: %{public}@",  buf,  0xCu);
    }

    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    id obj = v20;
    id v42 = [obj countByEnumeratingWithState:&v94 objects:v103 count:16];
    v43 = v87;
    if (v42)
    {
      id v44 = v42;
      uint64_t v45 = *(void *)v95;
      do
      {
        for (j = 0LL; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v95 != v45) {
            objc_enumerationMutation(obj);
          }
          v47 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)j);
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale baseLanguageFromLanguage:]( &OBJC_CLASS___NSLocale,  "baseLanguageFromLanguage:",  v47));
          if ([v10 containsObject:v47])
          {
            id v49 = sub_10002B074();
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v108 = (uint64_t)v47;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "iOS language %{public}@ already exists as a minimzed language. Skipping.",  buf,  0xCu);
            }
          }

          else
          {
            if ([v88 containsObject:v47])
            {
              id v51 = sub_10002B074();
              v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v108 = (uint64_t)v47;
                _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ is a supported system language and will be transferred to this device",  buf,  0xCu);
              }

              v53 = v43;
              v54 = v47;
LABEL_51:
              [v53 addPreferredLanguage:v54 withVariants:0];
              goto LABEL_55;
            }

            unsigned int v55 = [v88 containsObject:v48];
            id v56 = sub_10002B074();
            v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
            if (v55)
            {
              if (v58)
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v108 = (uint64_t)v47;
                _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ has a supported base language and will be transferred to this device",  buf,  0xCu);
              }

              v43 = v87;
              v53 = v87;
              v54 = v48;
              goto LABEL_51;
            }

            if (v58)
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v108 = (uint64_t)v47;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Language %{public}@ is not supported",  buf,  0xCu);
            }

            v43 = v87;
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