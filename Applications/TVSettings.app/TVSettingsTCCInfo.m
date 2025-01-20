@interface TVSettingsTCCInfo
+ (BOOL)automaticallyNotifiesObserversOfAllowAccess;
+ (TVSettingsTCCInfo)infoWithFacade:(id)a3 identifier:(id)a4 allowed:(BOOL)a5;
- (BOOL)allowAccess;
- (NSString)displayName;
- (NSString)identifier;
- (TVSettingsTCCFacade)facade;
- (void)setAllowAccess:(BOOL)a3;
@end

@implementation TVSettingsTCCInfo

+ (TVSettingsTCCInfo)infoWithFacade:(id)a3 identifier:(id)a4 allowed:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v10 + 4, v9);

  id v11 = [v8 copy];
  id v12 = v10[2];
  v10[2] = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appInfos]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v8]);

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 localizedName]);
  id v17 = v10[3];
  v10[3] = (id)v16;

  *((_BYTE *)v10 + 8) = a5;
  return (TVSettingsTCCInfo *)v10;
}

- (void)setAllowAccess:(BOOL)a3
{
  if (self->_allowAccess != a3)
  {
    BOOL v3 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_facade);
    unsigned int v6 = [WeakRetained setAllowAccess:v3 forInfo:self];

    if (v6)
    {
      -[TVSettingsTCCInfo willChangeValueForKey:](self, "willChangeValueForKey:", @"allowAccess");
      self->_allowAccess = v3;
      -[TVSettingsTCCInfo didChangeValueForKey:](self, "didChangeValueForKey:", @"allowAccess");
    }
  }

+ (BOOL)automaticallyNotifiesObserversOfAllowAccess
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)allowAccess
{
  return self->_allowAccess;
}

- (TVSettingsTCCFacade)facade
{
  return (TVSettingsTCCFacade *)objc_loadWeakRetained((id *)&self->_facade);
}

- (void).cxx_destruct
{
}

@end