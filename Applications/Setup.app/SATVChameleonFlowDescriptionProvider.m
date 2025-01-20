@interface SATVChameleonFlowDescriptionProvider
- (id)_initialSetupStepClasses;
- (id)_makeStepConfigurationForIdentifier:(id)a3;
- (id)_prefetchStepClassesWithIsUpdateFlow:(BOOL)a3;
- (id)_updateStepClasses;
- (id)_userInputConfiguration;
@end

@implementation SATVChameleonFlowDescriptionProvider

- (id)_updateStepClasses
{
  v11[0] = objc_opt_class(&OBJC_CLASS___SATVManagedConfigurationUpdateStep, a2);
  v11[1] = objc_opt_class(&OBJC_CLASS___SATVAccountUpdationStep, v2);
  v11[2] = objc_opt_class(&OBJC_CLASS___SATVWhatsNewStep, v3);
  v11[3] = objc_opt_class(&OBJC_CLASS___SATVPrivacyStep, v4);
  v11[4] = objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep, v5);
  v11[5] = objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep, v6);
  v11[6] = objc_opt_class(&OBJC_CLASS___SATVVideoSubscriberAccountStep, v7);
  v11[7] = objc_opt_class(&OBJC_CLASS___SATVRegionDisplayModeStep, v8);
  v11[8] = objc_opt_class(&OBJC_CLASS___SATVDiagnosticsStep, v9);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v11,  9LL));
}

- (id)_initialSetupStepClasses
{
  v16[0] = objc_opt_class(&OBJC_CLASS___SATVLanguageStep, a2);
  v16[1] = objc_opt_class(&OBJC_CLASS___SATVRegionStep, v2);
  v16[2] = objc_opt_class(&OBJC_CLASS___SATVPrivacyStep, v3);
  v16[3] = objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodStep, v4);
  v16[4] = objc_opt_class(&OBJC_CLASS___SATVExpressTapToSetupStep, v5);
  v16[5] = objc_opt_class(&OBJC_CLASS___SATVSiriAndDictationStep, v6);
  v16[6] = objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep, v7);
  v16[7] = objc_opt_class(&OBJC_CLASS___SATVNetworkValidationStep, v8);
  v16[8] = objc_opt_class(&OBJC_CLASS___SATVRegionDisplayModeStep, v9);
  v16[9] = objc_opt_class(&OBJC_CLASS___SATVCloudConfigStep, v10);
  v16[10] = objc_opt_class(&OBJC_CLASS___SATVLoginStep, v11);
  v16[11] = objc_opt_class(&OBJC_CLASS___SATVCreatePrimaryProfileStep, v12);
  v16[12] = objc_opt_class(&OBJC_CLASS___SATVVideoSubscriberAccountStep, v13);
  v16[13] = objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep, v14);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v16,  14LL));
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

- (id)_userInputConfiguration
{
  return  -[TVSKUserInputConfiguration initWithRemoteSetupMode:forceRemoteProximityPairing:]( objc_alloc(&OBJC_CLASS___TVSKUserInputConfiguration),  "initWithRemoteSetupMode:forceRemoteProximityPairing:",  0LL,  0LL);
}

- (id)_makeStepConfigurationForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SATVChooseSetupMethodStep stableIdentifier]( &OBJC_CLASS___SATVChooseSetupMethodStep,  "stableIdentifier"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    int v7 = TVSKIsBluetoothAvailable();
    uint64_t v8 = objc_alloc(&OBJC_CLASS___SATVChooseSetupMethodStepConfiguration);
    if (v7) {
      uint64_t v9 = 2LL;
    }
    else {
      uint64_t v9 = 0LL;
    }
    uint64_t v11 = -[SATVChooseSetupMethodStepConfiguration initWithBluetoothKeyboardSetupMode:passwordPromptSetting:]( v8,  "initWithBluetoothKeyboardSetupMode:passwordPromptSetting:",  v9,  0LL);
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___SATVChameleonFlowDescriptionProvider;
    id v10 = -[SATVAppleTVFlowDescriptionProvider _makeStepConfigurationForIdentifier:]( &v14,  "_makeStepConfigurationForIdentifier:",  v4);
    uint64_t v11 = (SATVChooseSetupMethodStepConfiguration *)objc_claimAutoreleasedReturnValue(v10);
  }

  uint64_t v12 = v11;

  return v12;
}

@end