@interface RSDPreferences
- (NSString)prefDomain;
- (RSDPreferences)initWithPrefDomain:(id)a3;
- (id)valueForKey:(id)a3;
- (void)eraseAll;
- (void)migrateContentsOnDisk;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation RSDPreferences

- (RSDPreferences)initWithPrefDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RSDPreferences;
  v6 = -[RSDPreferences init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_prefDomain, a3);
    _CFPreferencesSetBackupDisabled(v7->_prefDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost, 0LL, 1LL);
  }

  return v7;
}

- (void)migrateContentsOnDisk
{
  v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[RSDPreferences valueForKey:](self, "valueForKey:", @"remoted-prefs-version"));
  if (!v3) {
    v3 = &off_10003E478;
  }
  v6 = v3;
  unsigned __int8 v4 = [v3 isEqual:&off_10003E490];
  id v5 = v6;
  if ((v4 & 1) == 0)
  {
    if ([v6 compare:&off_10003E490] == (id)-1) {
      -[RSDPreferences eraseAll](self, "eraseAll");
    }
    -[RSDPreferences setValue:forKey:](self, "setValue:forKey:", &off_10003E490, @"remoted-prefs-version");
    -[RSDPreferences synchronize](self, "synchronize");
    id v5 = v6;
  }
}

- (void)eraseAll
{
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  unsigned __int8 v4 = CFPreferencesCopyKeyList(v3, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  if (v4)
  {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
    CFPreferencesSetMultiple(0LL, v4, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

    CFRelease(v4);
  }

- (id)valueForKey:(id)a3
{
  unsigned __int8 v4 = (__CFString *)a3;
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  v6 = (void *)CFPreferencesCopyValue(v4, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  return v6;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = a3;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  CFPreferencesSetValue(v6, v7, v8, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (void)synchronize
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  CFPreferencesAppSynchronize(v2);
}

- (NSString)prefDomain
{
  return self->_prefDomain;
}

- (void).cxx_destruct
{
}

@end