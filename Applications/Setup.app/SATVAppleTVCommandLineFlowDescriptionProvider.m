@interface SATVAppleTVCommandLineFlowDescriptionProvider
- (id)_autoAdvancingStepClassesWithIsUpdateFlow:(BOOL)a3;
- (id)_initialSetupStepClasses;
- (id)_makeStepConfigurationForIdentifier:(id)a3;
@end

@implementation SATVAppleTVCommandLineFlowDescriptionProvider

- (id)_initialSetupStepClasses
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVAppleTVCommandLineFlowDescriptionProvider;
  id v2 = -[SATVAppleTVFlowDescriptionProvider _initialSetupStepClasses](&v8, "_initialSetupStepClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "removeObject:", objc_opt_class(SATVHelloStep, v5));
  id v6 = [v4 copy];

  return v6;
}

- (id)_autoAdvancingStepClassesWithIsUpdateFlow:(BOOL)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAppleTVFlowDescriptionProvider _stepClassesWithIsUpdateFlow:]( self,  "_stepClassesWithIsUpdateFlow:",  a3));
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "removeObject:", objc_opt_class(SATVChooseSetupMethodStep, v5));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  return v6;
}

- (id)_makeStepConfigurationForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SATVChooseSetupMethodStep stableIdentifier]( &OBJC_CLASS___SATVChooseSetupMethodStep,  "stableIdentifier"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = -[SATVChooseSetupMethodStepConfiguration initWithBluetoothKeyboardSetupMode:passwordPromptSetting:]( objc_alloc(&OBJC_CLASS___SATVChooseSetupMethodStepConfiguration),  "initWithBluetoothKeyboardSetupMode:passwordPromptSetting:",  2LL,  3LL);
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___SATVAppleTVCommandLineFlowDescriptionProvider;
    id v8 = -[SATVAppleTVFlowDescriptionProvider _makeStepConfigurationForIdentifier:]( &v11,  "_makeStepConfigurationForIdentifier:",  v4);
    v7 = (SATVChooseSetupMethodStepConfiguration *)objc_claimAutoreleasedReturnValue(v8);
  }

  v9 = v7;

  return v9;
}

@end