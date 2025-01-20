@interface TVSettingsAirPlayFacade
+ (id)keyPathsForValuesAffectingAccessMode;
+ (id)keyPathsForValuesAffectingLocalizedAllowAccessShortDescription;
+ (id)keyPathsForValuesAffectingRequireCodeEveryTime;
+ (id)keyPathsForValuesAffectingSecurityMode;
+ (id)sharedInstance;
- (BOOL)isEveryTimeCodeRequired;
- (NSArray)availableAccessModes;
- (NSArray)availableSecurityModes;
- (NSFormatter)roomNameFormatter;
- (NSString)localizedAllowAccessShortDescription;
- (PBSAirPlaySettings)settings;
- (TSKMappingFormatter)accessDescriptionFormatter;
- (TSKMappingFormatter)accessValueFormatter;
- (TSKMappingFormatter)securityDescriptionFormatter;
- (unint64_t)accessMode;
- (unint64_t)securityMode;
- (void)setAccessMode:(unint64_t)a3;
- (void)setEveryTimeCodeRequired:(BOOL)a3;
- (void)setSecurityMode:(unint64_t)a3;
@end

@implementation TVSettingsAirPlayFacade

+ (id)keyPathsForValuesAffectingAccessMode
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"settings.accessType",  @"settings.enabled",  0LL);
}

+ (id)keyPathsForValuesAffectingSecurityMode
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"settings.securityType",  @"settings.password",  0LL);
}

+ (id)keyPathsForValuesAffectingRequireCodeEveryTime
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"settings.securityType",  @"settings.password",  0LL);
}

+ (id)keyPathsForValuesAffectingLocalizedAllowAccessShortDescription
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"settings.enabled",  @"settings.accessType",  0LL);
}

+ (id)sharedInstance
{
  if (qword_1001E1578 != -1) {
    dispatch_once(&qword_1001E1578, &stru_10018E4D0);
  }
  return (id)qword_1001E1570;
}

- (unint64_t)accessMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  unsigned int v4 = [v3 enabled];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  id v6 = [v5 accessType];

  if (v4 && !v6) {
    return 0LL;
  }
  if (v6 == (id)1) {
    char v8 = v4;
  }
  else {
    char v8 = 0;
  }
  unint64_t v9 = 2LL;
  if ((v8 & 1) != 0) {
    return 1LL;
  }
  else {
    return v9;
  }
}

- (void)setAccessMode:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      [v4 setEnabled:1];

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      id v9 = v5;
      uint64_t v6 = 0LL;
      goto LABEL_5;
    case 1uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      [v7 setEnabled:1];

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      id v9 = v5;
      uint64_t v6 = 1LL;
      goto LABEL_5;
    case 2uLL:
      char v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      [v8 setEnabled:1];

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      id v9 = v5;
      uint64_t v6 = 2LL;
LABEL_5:
      [v5 setAccessType:v6];
      goto LABEL_7;
    case 3uLL:
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      [v9 setEnabled:0];
LABEL_7:

      break;
    default:
      return;
  }

- (NSArray)availableAccessModes
{
  return (NSArray *)&off_1001AE9E0;
}

- (TSKMappingFormatter)securityDescriptionFormatter
{
  uint64_t v2 = TSKLocString(@"APSecurityTypeNoneDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v9[0] = v3;
  uint64_t v4 = TSKLocString(@"APSecurityTypePasswordDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

  v7 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AE9F8,  v6);
  return v7;
}

- (TSKMappingFormatter)accessValueFormatter
{
  uint64_t v2 = TSKLocString(@"APAccessTypeAny");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v12 = v3;
  uint64_t v4 = TSKLocString(@"APAccessTypeNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = v5;
  uint64_t v6 = TSKLocString(@"APAccessTypeHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  id v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AEA10, v8, v12, v13);

  return v10;
}

- (TSKMappingFormatter)accessDescriptionFormatter
{
  uint64_t v2 = TSKLocString(@"APAccessTypeAnyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v12 = v3;
  uint64_t v4 = TSKLocString(@"APAccessTypeNetworkDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13 = v5;
  uint64_t v6 = TSKLocString(@"APAccessTypeHomeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14 = v7;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 3LL));

  id v9 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v10 = -[TSKMappingFormatter initWithInputs:outputs:](v9, "initWithInputs:outputs:", &off_1001AEA28, v8, v12, v13);

  return v10;
}

- (unint64_t)securityMode
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  unint64_t v3 = [v2 securityType] == (id)2;

  return v3;
}

- (void)setSecurityMode:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = TVCSHomeLog(self, a2);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[TVSettingsAirPlayFacade setSecurityMode:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Generating new AirPlay password.", buf, 0xCu);
    }

    id v18 = 0LL;
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[HMHome generateMediaPasswordWithError:]( &OBJC_CLASS___HMHome,  "generateMediaPasswordWithError:",  &v18));
    id v7 = v18;
    id v9 = v7;
    if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      v11 = v10;
      v12 = v6;
    }

    else
    {
      uint64_t v14 = TVCSHomeLog(v7, v8);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000F62F8((uint64_t)v9, v15);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
      v11 = v10;
      v12 = @"000000";
    }

    [v10 setPassword:v12];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
    [v16 setSecurityType:2];
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
    [v13 setPassword:0];

    id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
    [v17 setSecurityType:0];
  }

- (NSArray)availableSecurityModes
{
  return (NSArray *)&off_1001AEA40;
}

- (BOOL)isEveryTimeCodeRequired
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  BOOL v3 = [v2 securityType] == (id)1;

  return v3;
}

- (void)setEveryTimeCodeRequired:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  [v4 setSecurityType:v3];
}

- (NSString)localizedAllowAccessShortDescription
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  unsigned int v4 = [v3 enabled];

  if (!v4)
  {
    uint64_t v8 = @"APAccessTypeNone";
    goto LABEL_5;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAirPlayFacade settings](self, "settings"));
  unint64_t v6 = (unint64_t)[v5 accessType];

  if (v6 <= 2)
  {
    uint64_t v8 = off_10018E518[v6];
LABEL_5:
    uint64_t v9 = TSKLocString(v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return (NSString *)v7;
}

- (NSFormatter)roomNameFormatter
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008BC4;
  v7[3] = &unk_10018E4F8;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 initWithFormattingBlock:v7];

  return (NSFormatter *)v5;
}

- (PBSAirPlaySettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end