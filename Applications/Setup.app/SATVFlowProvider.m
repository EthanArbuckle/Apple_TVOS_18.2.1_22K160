@interface SATVFlowProvider
+ (BOOL)_isUpdateFlow;
+ (void)initialize;
- (BOOL)isUpdateFlow;
- (BOOL)shouldAutoAdvanceStepWithIdentifier:(id)a3;
- (Class)_overrideEntryStateForFlow;
- (NSArray)stepClasses;
- (NSSet)prefetchStepClasses;
- (NSSet)prefetchSteps;
- (NSSet)tapToSetupEnablingStepClasses;
- (NSString)overrideStringsFileName;
- (SATVFlowProvider)init;
- (TVSKTheme)theme;
- (TVSKUserInputConfiguration)userInputConfiguration;
- (id)prefetchStepForIdentifier:(id)a3;
- (id)stepConfigurationForIdentifier:(id)a3;
- (void)_buildPrefetchStepLookupDictionary;
@end

@implementation SATVFlowProvider

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVFlowProvider, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVFlowProvider");
    v3 = (void *)qword_100109808;
    qword_100109808 = (uint64_t)v2;
  }

- (SATVFlowProvider)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SATVFlowProvider;
  v3 = -[SATVFlowProvider init](&v18, "init");
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[SATVFlowDescriptionProviderFactory flowDescriptionProvider]( &OBJC_CLASS___SATVFlowDescriptionProviderFactory,  "flowDescriptionProvider"));
    if (!v4)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"flowDescriptionProvider"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100076AE4(a2);
      }
      _bs_set_crash_log_message([v16 UTF8String]);
      __break(0);
      JUMPOUT(0x100024FFCLL);
    }

    v6 = (void *)v4;
    id v7 = objc_msgSend((id)objc_opt_class(v3, v5), "_isUpdateFlow");
    v8 = -[SATVFlowDescriptionProviderContext initWithIsUpdateFlow:isCLIMode:]( objc_alloc(&OBJC_CLASS___SATVFlowDescriptionProviderContext),  "initWithIsUpdateFlow:isCLIMode:",  v7,  sub_10001AB34());
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 flowDescriptionWithContext:v8]);
    flowDescription = v3->_flowDescription;
    v3->_flowDescription = (SATVFlowDescribing *)v9;

    v11 = (void *)qword_100109808;
    if (os_log_type_enabled((os_log_t)qword_100109808, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v3->_flowDescription;
      v13 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowDescribing debugDescription](v12, "debugDescription"));
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Retrieved flow description. %@", buf, 0xCu);
    }

    if (!v3->_flowDescription)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_flowDescription"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100076B90(a2);
      }
      _bs_set_crash_log_message([v17 UTF8String]);
      __break(0);
      JUMPOUT(0x100025060LL);
    }
  }

  return v3;
}

- (BOOL)isUpdateFlow
{
  return objc_msgSend((id)objc_opt_class(self, a2), "_isUpdateFlow");
}

- (NSSet)prefetchSteps
{
  prefetchStepByIdentifier = self->_prefetchStepByIdentifier;
  if (!prefetchStepByIdentifier)
  {
    -[SATVFlowProvider _buildPrefetchStepLookupDictionary](self, "_buildPrefetchStepLookupDictionary");
    prefetchStepByIdentifier = self->_prefetchStepByIdentifier;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](prefetchStepByIdentifier, "allValues"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  return (NSSet *)v5;
}

- (id)prefetchStepForIdentifier:(id)a3
{
  id v4 = a3;
  prefetchStepByIdentifier = self->_prefetchStepByIdentifier;
  if (!prefetchStepByIdentifier)
  {
    -[SATVFlowProvider _buildPrefetchStepLookupDictionary](self, "_buildPrefetchStepLookupDictionary");
    prefetchStepByIdentifier = self->_prefetchStepByIdentifier;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](prefetchStepByIdentifier, "objectForKey:", v4));

  return v6;
}

- (NSArray)stepClasses
{
  unsigned int v4 = -[SATVFlowProvider isUpdateFlow](self, "isUpdateFlow");
  uint64_t v5 = (os_log_s *)qword_100109808;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_100109808, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    __int16 v17 = 0;
    id v7 = "Device is being updated to a new software version. MINI BUDDY flow...";
    v8 = (uint8_t *)&v17;
  }

  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v7 = "Device is being set up for the first time. VANILLA set up flow...";
    v8 = buf;
  }

  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_7:
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowDescribing stepClasses](self->_flowDescription, "stepClasses"));
  if ([v9 count])
  {
    v10 = -[SATVFlowProvider _overrideEntryStateForFlow](self, "_overrideEntryStateForFlow");
    if (v10)
    {
      v11 = v10;
      id v12 = [v9 mutableCopy];
      [v12 removeObjectAtIndex:0];
      [v12 insertObject:v11 atIndex:0];
      id v13 = [v12 copy];

      uint64_t v9 = v13;
    }

    return (NSArray *)v9;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[stepClasses count] > 0"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100076C3C(a2);
    }
    result = (NSArray *)_bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
  }

  return result;
}

- (NSSet)prefetchStepClasses
{
  return (NSSet *)-[SATVFlowDescribing prefetchStepClasses](self->_flowDescription, "prefetchStepClasses");
}

- (NSSet)tapToSetupEnablingStepClasses
{
  return (NSSet *)-[SATVFlowDescribing tapToSetupEnablingStepClasses]( self->_flowDescription,  "tapToSetupEnablingStepClasses");
}

- (BOOL)shouldAutoAdvanceStepWithIdentifier:(id)a3
{
  return -[SATVFlowDescribing shouldAutoAdvanceStepWithIdentifier:]( self->_flowDescription,  "shouldAutoAdvanceStepWithIdentifier:",  a3);
}

- (NSString)overrideStringsFileName
{
  return (NSString *)-[SATVFlowDescribing overrideStringsFileName](self->_flowDescription, "overrideStringsFileName");
}

- (TVSKUserInputConfiguration)userInputConfiguration
{
  return (TVSKUserInputConfiguration *)-[SATVFlowDescribing userInputConfiguration]( self->_flowDescription,  "userInputConfiguration");
}

- (TVSKTheme)theme
{
  return (TVSKTheme *)-[SATVFlowDescribing theme](self->_flowDescription, "theme");
}

- (id)stepConfigurationForIdentifier:(id)a3
{
  return -[SATVFlowDescribing stepConfigurationForIdentifier:]( self->_flowDescription,  "stepConfigurationForIdentifier:",  a3);
}

+ (BOOL)_isUpdateFlow
{
  return CFPreferencesGetAppBooleanValue(@"TVBuddyCompletedSuccessfully", BYSetupAssistantBundleIdentifier, 0LL) != 0;
}

- (void)_buildPrefetchStepLookupDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowDescribing prefetchStepClasses](self->_flowDescription, "prefetchStepClasses"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_alloc_init(*(Class *)(*((void *)&v16 + 1) + 8LL * (void)i));
        id v11 = objc_msgSend((id)objc_opt_class(v9, v10), "stableIdentifier");
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        id v13 = (os_log_s *)qword_100109808;
        if (os_log_type_enabled((os_log_t)qword_100109808, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Adding the prefetch step. identifier=%{public}@",  buf,  0xCu);
        }

        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, v12);
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v6);
  }

  v14 = (NSDictionary *)-[NSMutableDictionary copy](v3, "copy");
  prefetchStepByIdentifier = self->_prefetchStepByIdentifier;
  self->_prefetchStepByIdentifier = v14;
}

- (Class)_overrideEntryStateForFlow
{
  if (-[SATVFlowProvider isUpdateFlow](self, "isUpdateFlow")) {
    os_log_t v2 = @"TVBuddyUpdateEntryState";
  }
  else {
    os_log_t v2 = @"TVBuddyOutOfBoxEntryState";
  }
  v3 = (NSString *)CFPreferencesCopyAppValue(v2, BYSetupAssistantBundleIdentifier);
  if (v3)
  {
    unsigned int v4 = v3;
    Class v5 = NSClassFromString(v3);
  }

  else
  {
    Class v5 = 0LL;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end