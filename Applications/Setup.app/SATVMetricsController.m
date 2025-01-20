@interface SATVMetricsController
+ (id)_metricsIdentifierForStep:(id)a3;
- (BOOL)isUpdateSetup;
- (NSMutableDictionary)latestStepDictionaryByStepIdentifier;
- (NSMutableOrderedSet)stepIdentifiers;
- (NSString)autoAdvanceStepIdentifier;
- (SATVMetricsController)initWithIsUpdateSetup:(BOOL)a3;
- (id)_eventPayload;
- (void)appendMetricsForCompletedStep:(id)a3 stepResult:(id)a4 completedSynchronously:(BOOL)a5;
- (void)noteAutoAdvanceForExecutingStep:(id)a3;
- (void)reportMetrics;
- (void)setAutoAdvanceStepIdentifier:(id)a3;
- (void)setLatestStepDictionaryByStepIdentifier:(id)a3;
- (void)setStepIdentifiers:(id)a3;
@end

@implementation SATVMetricsController

- (SATVMetricsController)initWithIsUpdateSetup:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SATVMetricsController;
  v4 = -[SATVMetricsController init](&v11, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isUpdateSetup = a3;
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    stepIdentifiers = v5->_stepIdentifiers;
    v5->_stepIdentifiers = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    latestStepDictionaryByStepIdentifier = v5->_latestStepDictionaryByStepIdentifier;
    v5->_latestStepDictionaryByStepIdentifier = v8;
  }

  return v5;
}

- (void)noteAutoAdvanceForExecutingStep:(id)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(a3, a2), "stableIdentifier");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SATVMetricsController setAutoAdvanceStepIdentifier:](self, "setAutoAdvanceStepIdentifier:", v5);
}

- (void)appendMetricsForCompletedStep:(id)a3 stepResult:(id)a4 completedSynchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "_metricsIdentifierForStep:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", !v5));
    -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  v14,  TVSKMetricsPayloadKeyStepSuffixShowedUserInterface);

    if (v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 metricsPayload]);
      -[NSMutableDictionary addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v15);
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___TVSKConsentStepResult, v16);
      id v18 = v9;
      v19 = v18;
      if (v17)
      {
        if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0) {
          v20 = v19;
        }
        else {
          v20 = 0LL;
        }
      }

      else
      {
        v20 = 0LL;
      }

      id v23 = v20;

      if (v23)
      {
        id v24 = [v23 didConsent];
        if (TVCSTriStateBoolIsDefined(v24))
        {
          v25 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  TVCSBoolForTriStateBool(v24, 0LL));
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  v26,  TVSKMetricsPayloadKeyStepSuffixDidConsent);
        }
      }

      unsigned __int8 v27 = [v19 flowOptions];
      if ((v27 & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  &__kCFBooleanTrue,  TVSKMetricsPayloadKeyStepSuffixFinishSetup);
      }
      if ((v27 & 2) != 0) {
        -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  &__kCFBooleanTrue,  TVSKMetricsPayloadKeyStepSuffixDisableTouchless);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVMetricsController autoAdvanceStepIdentifier](self, "autoAdvanceStepIdentifier"));
      unsigned int v29 = [v12 isEqualToString:v28];

      if (v29) {
        -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  &__kCFBooleanTrue,  TVSKMetricsPayloadKeyStepSuffixDidAutoAdvance);
      }
      if ([v19 wasSkippedDueToManagedConfiguration]) {
        -[NSMutableDictionary setObject:forKey:]( v13,  "setObject:forKey:",  &__kCFBooleanTrue,  TVSKMetricsPayloadKeyStepSuffixDidSkipDueToManagedConfiguration);
      }
    }

    -[SATVMetricsController setAutoAdvanceStepIdentifier:](self, "setAutoAdvanceStepIdentifier:", 0LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue( -[SATVMetricsController latestStepDictionaryByStepIdentifier]( self,  "latestStepDictionaryByStepIdentifier"));
    [v30 setObject:v13 forKey:v12];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SATVMetricsController stepIdentifiers](self, "stepIdentifiers"));
    [v31 addObject:v12];
  }

  else
  {
    id v21 = sub_100027988();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100077018((uint64_t)v8, v22);
    }
  }
}

- (void)reportMetrics
{
  id v3 = sub_100027988();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will report metrics", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100027AB8;
  v5[3] = &unk_1000C9B10;
  objc_copyWeak(&v6, buf);
  AnalyticsSendEventLazy(@"com.apple.appletv.setup.complete", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

+ (id)_metricsIdentifierForStep:(id)a3
{
  uint64_t v3 = qword_100109828;
  id v5 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100109828, &stru_1000C9B30);
  }
  id v6 = (void *)qword_100109820;
  v7 = (objc_class *)objc_opt_class(v5, v4);

  id v8 = NSStringFromClass(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v9]);

  return v10;
}

- (id)_eventPayload
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v38 = self;
  unsigned int v4 = -[SATVMetricsController isUpdateSetup](self, "isUpdateSetup");
  id v5 = (id *)&TVSKMetricsPayloadValueSetupModeUpdate;
  if (!v4) {
    id v5 = (id *)&TVSKMetricsPayloadValueSetupModeOutOfBox;
  }
  id v36 = *v5;
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 locale]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);

  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, TVSKMetricsPayloadKeyStorefrontIdentifier);
  }
  v35 = (void *)v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  if ([v9 isSupervised])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldAutoAdvance]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v10,  TVSKMetricsPayloadKeyManagedConfigurationAutoAdvance);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipFlyover]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v11,  TVSKMetricsPayloadKeyManagedConfigurationSkipAerials);

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipAppAnalytics]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v12,  TVSKMetricsPayloadKeyManagedConfigurationSkipAppAnalytics);

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipChooseSetupMethod]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v13,  TVSKMetricsPayloadKeyManagedConfigurationSkipChooseSetupMethod);

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipDiagnostics]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v14,  TVSKMetricsPayloadKeyManagedConfigurationSkipDiagnostics);

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipRoom]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v15,  TVSKMetricsPayloadKeyManagedConfigurationSkipHomeKit);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipHomeScreenSync]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v16,  TVSKMetricsPayloadKeyManagedConfigurationSkipHomeScreenSync);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipLanguage]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v17,  TVSKMetricsPayloadKeyManagedConfigurationSkipLanguage);

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipLogin]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v18,  TVSKMetricsPayloadKeyManagedConfigurationSkipLogin);

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipLocationServices]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v19,  TVSKMetricsPayloadKeyManagedConfigurationSkipLocationServices);

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipRegion]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v20,  TVSKMetricsPayloadKeyManagedConfigurationSkipRegion);

    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipPrivacy]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v21,  TVSKMetricsPayloadKeyManagedConfigurationSkipPrivacy);

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipTermsAndConditions]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v22,  TVSKMetricsPayloadKeyManagedConfigurationSkipTermsAndConditions);

    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipVideoSubscriberAccount]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v23,  TVSKMetricsPayloadKeyManagedConfigurationSkipVideoSubscriberAccount);

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 shouldSkipVideoSubscriberAccountApp]));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v24,  TVSKMetricsPayloadKeyManagedConfigurationSkipVideoSubscriberAccountApp);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SATVMetricsController stepIdentifiers](v38, "stepIdentifiers"));
  id v25 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        unsigned int v29 = v3;
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        v31 = (void *)objc_claimAutoreleasedReturnValue( -[SATVMetricsController latestStepDictionaryByStepIdentifier]( v38,  "latestStepDictionaryByStepIdentifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v30]);

        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_1000287A4;
        v39[3] = &unk_1000C9B58;
        v39[4] = v30;
        uint64_t v3 = v29;
        v40 = v29;
        [v32 enumerateKeysAndObjectsUsingBlock:v39];
      }

      id v26 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }

    while (v26);
  }

  id v33 = -[NSMutableDictionary copy](v3, "copy");
  return v33;
}

- (BOOL)isUpdateSetup
{
  return self->_isUpdateSetup;
}

- (NSString)autoAdvanceStepIdentifier
{
  return self->_autoAdvanceStepIdentifier;
}

- (void)setAutoAdvanceStepIdentifier:(id)a3
{
}

- (NSMutableOrderedSet)stepIdentifiers
{
  return self->_stepIdentifiers;
}

- (void)setStepIdentifiers:(id)a3
{
}

- (NSMutableDictionary)latestStepDictionaryByStepIdentifier
{
  return self->_latestStepDictionaryByStepIdentifier;
}

- (void)setLatestStepDictionaryByStepIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end