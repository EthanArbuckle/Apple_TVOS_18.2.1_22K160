@interface SATVFlowDescription
- (BOOL)shouldAutoAdvanceStepWithIdentifier:(id)a3;
- (NSArray)stepClasses;
- (NSDictionary)configurationByStepIdentifier;
- (NSSet)autoAdvancingStepIdentifiers;
- (NSSet)prefetchStepClasses;
- (NSSet)tapToSetupEnablingStepClasses;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)overrideStringsFileName;
- (SATVFlowDescription)descriptionWithMultilinePrefix:(id)a3;
- (SATVFlowDescription)initWithStepClasses:(id)a3 prefetchStepClasses:(id)a4 tapToSetupEnablingStepClasses:(id)a5 autoAdvancingStepClasses:(id)a6 userInputConfiguration:(id)a7 theme:(id)a8 overrideStringsFileName:(id)a9 configurationByStepIdentifier:(id)a10;
- (TVSKTheme)theme;
- (TVSKUserInputConfiguration)userInputConfiguration;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)stepConfigurationForIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SATVFlowDescription

- (SATVFlowDescription)initWithStepClasses:(id)a3 prefetchStepClasses:(id)a4 tapToSetupEnablingStepClasses:(id)a5 autoAdvancingStepClasses:(id)a6 userInputConfiguration:(id)a7 theme:(id)a8 overrideStringsFileName:(id)a9 configurationByStepIdentifier:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id obj = a7;
  id v19 = a7;
  id v72 = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = v15;
  Class v24 = NSClassFromString(@"NSArray");
  if (!v23)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078BF0();
    }
LABEL_76:
    _bs_set_crash_log_message([v54 UTF8String]);
    __break(0);
    JUMPOUT(0x10005E9A4LL);
  }

  if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSArrayClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078BF0();
    }
    _bs_set_crash_log_message([v55 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EA08LL);
  }

  id v25 = v16;
  Class v26 = NSClassFromString(@"NSSet");
  if (!v25)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078CA0();
    }
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EA6CLL);
  }

  if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078CA0();
    }
    _bs_set_crash_log_message([v57 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EAD0LL);
  }

  id v27 = v17;
  Class v28 = NSClassFromString(@"NSSet");
  if (!v27)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078D50();
    }
    _bs_set_crash_log_message([v58 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EB34LL);
  }

  if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078D50();
    }
    _bs_set_crash_log_message([v59 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EB98LL);
  }

  id v29 = v18;
  Class v30 = NSClassFromString(@"NSSet");
  if (!v29)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078E00();
    }
    _bs_set_crash_log_message([v60 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EBFCLL);
  }

  if ((objc_opt_isKindOfClass(v29, v30) & 1) == 0)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078E00();
    }
    _bs_set_crash_log_message([v61 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EC60LL);
  }

  id v31 = v19;
  Class v32 = NSClassFromString(@"TVSKUserInputConfiguration");
  if (!v31)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078EB0();
    }
    _bs_set_crash_log_message([v62 UTF8String]);
    __break(0);
    JUMPOUT(0x10005ECC4LL);
  }

  if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSKUserInputConfigurationClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078EB0();
    }
    _bs_set_crash_log_message([v63 UTF8String]);
    __break(0);
    JUMPOUT(0x10005ED28LL);
  }

  id v33 = v20;
  Class v34 = NSClassFromString(@"TVSKTheme");
  if (!v33)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078F60();
    }
    _bs_set_crash_log_message([v64 UTF8String]);
    __break(0);
    JUMPOUT(0x10005ED8CLL);
  }

  if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSKThemeClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078F60();
    }
    _bs_set_crash_log_message([v65 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EDF0LL);
  }

  id v35 = v21;
  if (v35)
  {
    Class v36 = NSClassFromString(@"NSString");
    if ((objc_opt_isKindOfClass(v35, v36) & 1) == 0)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000792B8();
      }
      goto LABEL_76;
    }
  }

  id v37 = v22;
  Class v38 = NSClassFromString(@"NSDictionary");
  if (!v37)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079010();
    }
    _bs_set_crash_log_message([v66 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EE54LL);
  }

  if ((objc_opt_isKindOfClass(v37, v38) & 1) == 0)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079010();
    }
    _bs_set_crash_log_message([v67 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EEB8LL);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
  if (([v25 isSubsetOfSet:v39] & 1) == 0)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[prefetchStepClasses isSubsetOfSet:allStepClasses]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079210();
    }
    _bs_set_crash_log_message([v68 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EF1CLL);
  }

  if (([v27 isSubsetOfSet:v39] & 1) == 0)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[tapToSetupEnablingStepClasses isSubsetOfSet:allStepClasses]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100079168();
    }
    _bs_set_crash_log_message([v69 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EF80LL);
  }

  if (([v29 isSubsetOfSet:v39] & 1) == 0)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[autoAdvancingStepClasses isSubsetOfSet:allStepClasses]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000790C0();
    }
    _bs_set_crash_log_message([v70 UTF8String]);
    __break(0);
    JUMPOUT(0x10005EFE4LL);
  }

  v74 = v31;
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___SATVFlowDescription;
  v40 = -[SATVFlowDescription init](&v79, "init");
  v41 = v23;
  if (v40)
  {
    v42 = (NSArray *)[v23 copy];
    stepClasses = v40->_stepClasses;
    v40->_stepClasses = v42;

    v44 = (NSSet *)[v25 copy];
    prefetchStepClasses = v40->_prefetchStepClasses;
    v40->_prefetchStepClasses = v44;

    v46 = (NSSet *)[v27 copy];
    tapToSetupEnablingStepClasses = v40->_tapToSetupEnablingStepClasses;
    v40->_tapToSetupEnablingStepClasses = v46;

    objc_storeStrong((id *)&v40->_userInputConfiguration, obj);
    objc_storeStrong((id *)&v40->_theme, v72);
    objc_storeStrong((id *)&v40->_overrideStringsFileName, a9);
    v48 = (NSDictionary *)[v37 copy];
    configurationByStepIdentifier = v40->_configurationByStepIdentifier;
    v40->_configurationByStepIdentifier = v48;

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_10005F04C;
    v76[3] = &unk_1000CADD0;
    SEL v78 = a2;
    v50 = v40;
    v77 = v50;
    uint64_t v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bs_map:", v76));
    autoAdvancingStepIdentifiers = v50->_autoAdvancingStepIdentifiers;
    v50->_autoAdvancingStepIdentifiers = (NSSet *)v51;
  }

  return v40;
}

- (BOOL)shouldAutoAdvanceStepWithIdentifier:(id)a3
{
  return -[NSSet containsObject:](self->_autoAdvancingStepIdentifiers, "containsObject:", a3);
}

- (id)stepConfigurationForIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_configurationByStepIdentifier, "objectForKey:", a3);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowDescription succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  stepClasses = self->_stepClasses;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005F1F4;
  v9[3] = &unk_1000CADD0;
  v9[4] = self;
  v9[5] = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray bs_map:](stepClasses, "bs_map:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@","]);
  [v4 appendString:v7 withName:@"stepClasses"];

  return v4;
}

- (SATVFlowDescription)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVFlowDescription descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (SATVFlowDescription *)v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];
  [v5 appendArraySection:self->_stepClasses withName:@"stepClasses" multilinePrefix:v4 skipIfEmpty:0];
  id v6 = [v5 appendObject:self->_prefetchStepClasses withName:@"prefetchStepClasses"];
  id v7 =  [v5 appendObject:self->_tapToSetupEnablingStepClasses withName:@"tapToSetupEnablingStepClasses"];
  id v8 = [v5 appendObject:self->_userInputConfiguration withName:@"userInputConfiguration"];
  id v9 =  [v5 appendObject:self->_autoAdvancingStepIdentifiers withName:@"autoAdvancingStepIdentifiers"];
  id v10 = [v5 appendObject:self->_theme withName:@"theme"];
  [v5 appendString:self->_overrideStringsFileName withName:@"overrideStringsFileName"];
  [v5 appendDictionarySection:self->_configurationByStepIdentifier withName:@"configurationByStepIdentifier" multilinePrefix:v4 skipIfEmpty:0];

  return v5;
}

- (NSString)description
{
  return (NSString *)-[SATVFlowDescription succinctDescription](self, "succinctDescription");
}

- (NSString)debugDescription
{
  return (NSString *)-[SATVFlowDescription descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL);
}

- (NSArray)stepClasses
{
  return self->_stepClasses;
}

- (NSSet)prefetchStepClasses
{
  return self->_prefetchStepClasses;
}

- (NSSet)tapToSetupEnablingStepClasses
{
  return self->_tapToSetupEnablingStepClasses;
}

- (TVSKUserInputConfiguration)userInputConfiguration
{
  return self->_userInputConfiguration;
}

- (TVSKTheme)theme
{
  return self->_theme;
}

- (NSString)overrideStringsFileName
{
  return self->_overrideStringsFileName;
}

- (NSDictionary)configurationByStepIdentifier
{
  return self->_configurationByStepIdentifier;
}

- (NSSet)autoAdvancingStepIdentifiers
{
  return self->_autoAdvancingStepIdentifiers;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end