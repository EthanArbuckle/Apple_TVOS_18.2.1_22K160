@interface SATVAppleTVFlowDescriptionProvider
- (id)_autoAdvancingStepClassesWithIsUpdateFlow:(BOOL)a3;
- (id)_expressTapToSetupItemProviderStepClasses;
- (id)_initialSetupStepClasses;
- (id)_makeStepConfigurationForIdentifier:(id)a3;
- (id)_prefetchStepClassesWithIsUpdateFlow:(BOOL)a3;
- (id)_stepClassesWithIsUpdateFlow:(BOOL)a3;
- (id)_tapToSetupEnablingStepClassesWithIsUpdateFlow:(BOOL)a3;
- (id)_updateStepClasses;
- (id)_userInputConfiguration;
- (id)flowDescriptionWithContext:(id)a3;
@end

@implementation SATVAppleTVFlowDescriptionProvider

- (id)flowDescriptionWithContext:(id)a3
{
  id v24 = a3;
  id v4 = [v24 isUpdateFlow];
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _stepClassesWithIsUpdateFlow:]( self,  "_stepClassesWithIsUpdateFlow:",  v4));
  v23 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _prefetchStepClassesWithIsUpdateFlow:]( self,  "_prefetchStepClassesWithIsUpdateFlow:",  v4));
  v22 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _tapToSetupEnablingStepClassesWithIsUpdateFlow:]( self,  "_tapToSetupEnablingStepClassesWithIsUpdateFlow:",  v4));
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _autoAdvancingStepClassesWithIsUpdateFlow:]( self,  "_autoAdvancingStepClassesWithIsUpdateFlow:",  v4));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppleTVFlowDescriptionProvider _userInputConfiguration](self, "_userInputConfiguration"));
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "stableIdentifier") & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[stepClass respondsToSelector:@selector(stableIdentifier)]"));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000769E8(a2, (uint64_t)self, (uint64_t)v18);
          }
          _bs_set_crash_log_message([v18 UTF8String]);
          __break(0);
          JUMPOUT(0x10002418CLL);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stableIdentifier]);
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _makeStepConfigurationForIdentifier:]( self,  "_makeStepConfigurationForIdentifier:",  v13));
        -[NSMutableDictionary bs_setSafeObject:forKey:](v6, "bs_setSafeObject:forKey:", v14, v13);
      }

      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v9);
  }

  v15 = -[TVSKTheme initWithLayoutStyle:](objc_alloc(&OBJC_CLASS___TVSKTheme), "initWithLayoutStyle:", 1LL);
  v16 = -[SATVFlowDescription initWithStepClasses:prefetchStepClasses:tapToSetupEnablingStepClasses:autoAdvancingStepClasses:userInputConfiguration:theme:overrideStringsFileName:configurationByStepIdentifier:]( objc_alloc(&OBJC_CLASS___SATVFlowDescription),  "initWithStepClasses:prefetchStepClasses:tapToSetupEnablingStepClasses:autoAdvancingStepClasses:userInputConfig uration:theme:overrideStringsFileName:configurationByStepIdentifier:",  v7,  v23,  v22,  v21,  v20,  v15,  0LL,  v6,  a2);

  return v16;
}

- (id)_stepClassesWithIsUpdateFlow:(BOOL)a3
{
  if (a3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppleTVFlowDescriptionProvider _updateStepClasses](self, "_updateStepClasses"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAppleTVFlowDescriptionProvider _initialSetupStepClasses](self, "_initialSetupStepClasses"));
  }
  return v3;
}

- (id)_updateStepClasses
{
  v12[0] = objc_opt_class(&OBJC_CLASS___SATVManagedConfigurationUpdateStep, a2);
  v12[1] = objc_opt_class(&OBJC_CLASS___SATVAccountUpdationStep, v2);
  v12[2] = objc_opt_class(&OBJC_CLASS___SATVWhatsNewStep, v3);
  v12[3] = objc_opt_class(&OBJC_CLASS___SATVPrivacyStep, v4);
  v12[4] = objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep, v5);
  v12[5] = objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep, v6);
  v12[6] = objc_opt_class(&OBJC_CLASS___SATVAirplay2Step, v7);
  v12[7] = objc_opt_class(&OBJC_CLASS___SATVVideoSubscriberAccountStep, v8);
  v12[8] = objc_opt_class(&OBJC_CLASS___SATVRegionDisplayModeStep, v9);
  v12[9] = objc_opt_class(&OBJC_CLASS___SATVDiagnosticsStep, v10);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v12,  10LL));
}

- (id)_initialSetupStepClasses
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVHelloStep, v3));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVLanguageStep, v4));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVRegionStep, v5));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVPrivacyStep, v6));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodStep, v7));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVExpressTapToSetupStep, v8));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVSiriAndDictationStep, v9));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep, v10));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVNetworkValidationStep, v11));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVActivationStep, v12));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVLoginStep, v13));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVLocationServicesStep, v14));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVDiagnosticsStep, v15));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVAppAnalyticsStep, v16));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVTermsAndConditionsStep, v17));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVPasswordSettingStep, v18));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVCloudConfigStep, v19));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVCreatePrimaryProfileStep, v20));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVVideoSubscriberAccountStep, v21));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep, v22));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVAirplay2Step, v23));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVRecognizeMyVoiceStep, v24));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVTimeZoneStep, v25));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVFlyoverStep, v26));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVDisplayAssistantStep, v27));
  -[NSMutableArray addObject:](v2, "addObject:", objc_opt_class(&OBJC_CLASS___SATVRegionDisplayModeStep, v28));
  return v2;
}

- (id)_prefetchStepClassesWithIsUpdateFlow:(BOOL)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[NSMutableSet addObject:](v4, "addObject:", objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep, v5));
  if (!a3) {
    -[NSMutableSet addObject:](v4, "addObject:", objc_opt_class(&OBJC_CLASS___SATVVideoSubscriberAccountStep, v6));
  }
  id v7 = -[NSMutableSet copy](v4, "copy");

  return v7;
}

- (id)_tapToSetupEnablingStepClassesWithIsUpdateFlow:(BOOL)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  v9[0] = objc_opt_class(&OBJC_CLASS___SATVLanguageStep, a2);
  v9[1] = objc_opt_class(&OBJC_CLASS___SATVRegionStep, v4);
  v9[2] = objc_opt_class(&OBJC_CLASS___SATVPrivacyStep, v5);
  v9[3] = objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodStep, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

  return v8;
}

- (id)_autoAdvancingStepClassesWithIsUpdateFlow:(BOOL)a3
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set", a3);
}

- (id)_userInputConfiguration
{
  return  -[TVSKUserInputConfiguration initWithRemoteSetupMode:forceRemoteProximityPairing:]( objc_alloc(&OBJC_CLASS___TVSKUserInputConfiguration),  "initWithRemoteSetupMode:forceRemoteProximityPairing:",  2LL,  0LL);
}

- (id)_makeStepConfigurationForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SATVChooseSetupMethodStep stableIdentifier]( &OBJC_CLASS___SATVChooseSetupMethodStep,  "stableIdentifier"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = -[SATVChooseSetupMethodStepConfiguration initWithBluetoothKeyboardSetupMode:passwordPromptSetting:]( objc_alloc(&OBJC_CLASS___SATVChooseSetupMethodStepConfiguration),  "initWithBluetoothKeyboardSetupMode:passwordPromptSetting:",  2LL,  0LL);
LABEL_5:
    uint64_t v10 = (SATVExpressTapToSetupStepConfiguration *)v7;
    goto LABEL_6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SATVPasswordSettingStep stableIdentifier](&OBJC_CLASS___SATVPasswordSettingStep, "stableIdentifier"));
  unsigned int v9 = [v4 isEqual:v8];

  if (v9)
  {
    id v7 = -[SATVPasswordSettingStepConfiguration initWithPasswordPromptSetting:]( objc_alloc(&OBJC_CLASS___SATVPasswordSettingStepConfiguration),  "initWithPasswordPromptSetting:",  0LL);
    goto LABEL_5;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SATVExpressTapToSetupStep stableIdentifier]( &OBJC_CLASS___SATVExpressTapToSetupStep,  "stableIdentifier"));
  unsigned int v13 = [v4 isEqual:v12];

  if (v13)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___SATVExpressTapToSetupStepConfiguration);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _expressTapToSetupItemProviderStepClasses]( self,  "_expressTapToSetupItemProviderStepClasses"));
    uint64_t v10 = -[SATVExpressTapToSetupStepConfiguration initWithItemProviderClasses:]( v14,  "initWithItemProviderClasses:",  v15);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

- (id)_expressTapToSetupItemProviderStepClasses
{
  v7[0] = objc_opt_class(&OBJC_CLASS___SATVSiriAndDictationStep, a2);
  v7[1] = objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep, v2);
  v7[2] = objc_opt_class(&OBJC_CLASS___SATVLocationServicesStep, v3);
  v7[3] = objc_opt_class(&OBJC_CLASS___SATVDiagnosticsStep, v4);
  v7[4] = objc_opt_class(&OBJC_CLASS___SATVAppAnalyticsStep, v5);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v7,  5LL));
}

@end