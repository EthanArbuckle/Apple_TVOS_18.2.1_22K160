@interface TVSettingsPreferenceFacade
- (NSString)domain;
- (TVSettingsPreferenceFacade)initWithDomain:(id)a3 notifyChanges:(BOOL)a4;
- (id)valueForUndefinedKey:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)synchronize;
@end

@implementation TVSettingsPreferenceFacade

- (TVSettingsPreferenceFacade)initWithDomain:(id)a3 notifyChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsPreferenceFacade;
  v7 = -[TVSettingsPreferenceFacade init](&v14, "init");
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    domain = v7->_domain;
    v7->_domain = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v6));
    prefs = v7->_prefs;
    v7->_prefs = (TVSPreferences *)v10;

    if (v4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferenceManager sharedInstance](&OBJC_CLASS___TVSPreferenceManager, "sharedInstance"));
      [v12 enableDistributedSyncForDomain:v6];
    }
  }

  return v7;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
}

- (id)valueForUndefinedKey:(id)a3
{
  return -[TVSPreferences objectForKey:](self->_prefs, "objectForKey:", a3);
}

- (void)synchronize
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end