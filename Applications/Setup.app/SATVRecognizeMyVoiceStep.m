@interface SATVRecognizeMyVoiceStep
+ (NSString)stableIdentifier;
- (AFSettingsConnection)siriConnection;
- (BOOL)_isHomeRecognizeMyVoiceEnabled:(id)a3;
- (BOOL)shouldSkipBackwardsNavigation;
- (TVSKStepDelegate)stepDelegate;
- (id)_handleRecognizeMyVoiceEnabled:(BOOL)a3;
- (id)_primaryUserProfile;
- (id)executeStepForContext:(id)a3;
- (void)_completeStepWithRecognizeMyVoiceEnabled:(BOOL)a3;
- (void)_enableRecognizeMyVoice:(BOOL)a3;
- (void)_showRecognizeMyVoiceViewController;
- (void)autoAdvance;
- (void)setShouldSkipBackwardsNavigation:(BOOL)a3;
- (void)setSiriConnection:(id)a3;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVRecognizeMyVoiceStep

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVRecognizeMyVoiceStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v6 = [v5 shouldSkipSiri];

  if (v6)
  {
    id v7 = sub_10002B1C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that Siri should be skipped.",  v54,  2u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
    goto LABEL_17;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  int v11 = [v10 isSiriEnabled];

  if ((v11 & 1) == 0)
  {
    id v20 = sub_10002B1C4();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      v22 = "Siri is not enabled. Will skip.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v54, 2u);
    }

- (void)autoAdvance
{
  id v3 = sub_10002B1C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device is in touchless set up mode. Need to auto advance..",  v5,  2u);
  }

  -[SATVRecognizeMyVoiceStep _completeStepWithRecognizeMyVoiceEnabled:]( self,  "_completeStepWithRecognizeMyVoiceEnabled:",  0LL);
}

- (id)_primaryUserProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryUserProfile]);

  return v4;
}

- (void)_showRecognizeMyVoiceViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep _primaryUserProfile](self, "_primaryUserProfile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);

  v5 = -[SATVRecognizeMyVoiceContainerViewController initWithiCloudAltDSID:]( objc_alloc(&OBJC_CLASS___SATVRecognizeMyVoiceContainerViewController),  "initWithiCloudAltDSID:",  v4);
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000AC3C;
  v17[3] = &unk_1000C93C8;
  objc_copyWeak(&v18, &location);
  -[SATVRecognizeMyVoiceContainerViewController setCompletionHandler:](v5, "setCompletionHandler:", v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000AC7C;
  v15[3] = &unk_1000C93A0;
  objc_copyWeak(&v16, &location);
  -[SATVRecognizeMyVoiceContainerViewController setMenuHandler:](v5, "setMenuHandler:", v15);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10000ACC8;
  v13 = &unk_1000C93A0;
  objc_copyWeak(&v14, &location);
  -[SATVRecognizeMyVoiceContainerViewController setSystemLanguageUnsupportedHandler:]( v5,  "setSystemLanguageUnsupportedHandler:",  &v10);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep stepDelegate](self, "stepDelegate", v10, v11, v12, v13));
  [v6 step:self displayViewController:v5];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep _primaryUserProfile](self, "_primaryUserProfile"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  objc_msgSend(v7, "pbs_setRMVShownToUserWithIdentifier:", v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (BOOL)_isHomeRecognizeMyVoiceEnabled:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pbs_buddySelectedHomeName"));

  id v6 = sub_10002B1C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Looking for selected home named: %@", buf, 0xCu);
  }

  if (v3 && v5)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homes", 0));
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
          unsigned int v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            id v15 = sub_10002B1C4();
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Matched home.", buf, 2u);
            }

            id v9 = v12;
            goto LABEL_17;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)_enableRecognizeMyVoice:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep _primaryUserProfile](self, "_primaryUserProfile"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);

  id v7 = sub_10002B1C4();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"Disable";
    if (v3) {
      id v9 = @"Enable";
    }
    *(_DWORD *)buf = 138412546;
    __int128 v24 = v9;
    __int16 v25 = 2112;
    unint64_t v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ RMV for %@", buf, 0x16u);
  }

  siriConnection = self->_siriConnection;
  if (!siriConnection)
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
    v12 = self->_siriConnection;
    self->_siriConnection = v11;

    siriConnection = self->_siriConnection;
  }

  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  BOOL v19 = sub_10000B15C;
  id v20 = &unk_1000C95B0;
  BOOL v22 = v3;
  id v21 = v6;
  id v13 = v6;
  -[AFSettingsConnection setSiriRMVState:foriCloudAltDSID:completion:]( siriConnection,  "setSiriRMVState:foriCloudAltDSID:completion:",  v3,  v13,  &v17);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pineBoardServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pineBoardServicesUserDefaults",  v17,  v18,  v19,  v20));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep _primaryUserProfile](self, "_primaryUserProfile"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
  objc_msgSend(v14, "pbs_setRMVShownToUserWithIdentifier:", v16);
}

- (id)_handleRecognizeMyVoiceEnabled:(BOOL)a3
{
  return +[TVSKConsentStepResult successResultWithConsent:]( &OBJC_CLASS___TVSKConsentStepResult,  "successResultWithConsent:",  TVCSTriStateBoolForBool(a3, a2));
}

- (void)_completeStepWithRecognizeMyVoiceEnabled:(BOOL)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep _handleRecognizeMyVoiceEnabled:](self, "_handleRecognizeMyVoiceEnabled:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep stepDelegate](self, "stepDelegate"));
  [v4 step:self didCompleteWithResult:v5];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (AFSettingsConnection)siriConnection
{
  return self->_siriConnection;
}

- (void)setSiriConnection:(id)a3
{
}

- (BOOL)shouldSkipBackwardsNavigation
{
  return self->_shouldSkipBackwardsNavigation;
}

- (void)setShouldSkipBackwardsNavigation:(BOOL)a3
{
  self->_shouldSkipBackwardsNavigation = a3;
}

- (void).cxx_destruct
{
}

@end