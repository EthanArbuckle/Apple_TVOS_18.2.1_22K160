@interface OSLogPreferencesProcess
- (BOOL)isLocked;
- (NSString)bundleID;
- (OSLogPreferencesProcess)initWithBundleID:(id)a3;
- (id)_levelPrefs;
- (int64_t)defaultEnabledLevel;
- (int64_t)defaultPersistedLevel;
- (int64_t)effectiveEnabledLevel;
- (int64_t)effectivePersistedLevel;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)reset;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
@end

@implementation OSLogPreferencesProcess

- (OSLogPreferencesProcess)initWithBundleID:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___OSLogPreferencesProcess;
  v5 = -[OSLogPreferencesProcess init](&v30, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringByAppendingPathComponent:@"Processes"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringByAppendingPathComponent:v4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 stringByAppendingPathExtension:@"plist"];
    systemPrefsFile = v5->_systemPrefsFile;
    v5->_systemPrefsFile = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v5->_systemPrefsFile];
    systemPrefs = v5->_systemPrefs;
    v5->_systemPrefs = (NSDictionary *)v13;

    if (_os_trace_is_development_build())
    {
      [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 stringByAppendingPathComponent:@"Processes"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 stringByAppendingPathComponent:v4];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v17 stringByAppendingPathExtension:@"plist"];
      internalPrefsFile = v5->_internalPrefsFile;
      v5->_internalPrefsFile = (NSString *)v18;

      uint64_t v20 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v5->_internalPrefsFile];
      internalPrefs = v5->_internalPrefs;
      v5->_internalPrefs = (NSDictionary *)v20;
    }

    [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 stringByAppendingPathComponent:@"Processes"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 stringByAppendingPathComponent:v4];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 stringByAppendingPathExtension:@"plist"];
    prefsFile = v5->_prefsFile;
    v5->_prefsFile = (NSString *)v25;

    uint64_t v27 = [MEMORY[0x189603FC8] dictionaryWithContentsOfFile:v5->_prefsFile];
    prefs = v5->_prefs;
    v5->_prefs = (NSMutableDictionary *)v27;
  }

  return v5;
}

- (BOOL)isLocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result = -[OSLogPreferencesProcess enabledLevel](self, "enabledLevel");
  if (result == 1)
  {
    int64_t result = -[OSLogPreferencesProcess defaultEnabledLevel](self, "defaultEnabledLevel");
    if (result == 1)
    {
      +[OSLogPreferencesManager sharedManager](&OBJC_CLASS___OSLogPreferencesManager, "sharedManager");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v5 = [v4 enabledLevel];

      return v5;
    }
  }

  return result;
}

- (int64_t)effectivePersistedLevel
{
  int64_t result = -[OSLogPreferencesProcess persistedLevel](self, "persistedLevel");
  if (result == 1)
  {
    int64_t result = -[OSLogPreferencesProcess defaultPersistedLevel](self, "defaultPersistedLevel");
    if (result == 1)
    {
      +[OSLogPreferencesManager sharedManager](&OBJC_CLASS___OSLogPreferencesManager, "sharedManager");
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v5 = [v4 persistedLevel];

      return v5;
    }
  }

  return result;
}

- (int64_t)defaultEnabledLevel
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = _LevelForKey(v3, (uint64_t)@"Enable");
  if (v4 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", @"Level");
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    int64_t v6 = _LevelForKey(v5, (uint64_t)@"Enable");
    BOOL v3 = v5;
  }

  else
  {
    int64_t v6 = v4;
  }

  return v6;
}

- (int64_t)defaultPersistedLevel
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = _LevelForKey(v3, (uint64_t)@"Persist");
  if (v4 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", @"Level");
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    int64_t v6 = _LevelForKey(v5, (uint64_t)@"Persist");
    BOOL v3 = v5;
  }

  else
  {
    int64_t v6 = v4;
  }

  return v6;
}

- (int64_t)enabledLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = _LevelForKey(v2, (uint64_t)@"Enable");

  return v3;
}

- (int64_t)persistedLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v3 = _LevelForKey(v2, (uint64_t)@"Persist");

  return v3;
}

- (id)_levelPrefs
{
  prefs = self->_prefs;
  if (!prefs)
  {
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    int64_t v5 = self->_prefs;
    self->_prefs = v4;

    prefs = self->_prefs;
  }

  -[NSMutableDictionary objectForKey:](prefs, "objectForKey:", @"Level");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    [MEMORY[0x189603FC8] dictionary];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_prefs, "setObject:forKey:", v6, @"Level");
  }

  return v6;
}

- (void)setEnabledLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesProcess isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesProcess _levelPrefs](self, "_levelPrefs");
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      int64_t v6 = off_189F0FAB0[a3];
    }
    id v8 = v5;
    [v5 setObject:v6 forKey:@"Enable"];
    if (_LevelForKey(v8, (uint64_t)@"Persist") > a3)
    {
      else {
        v7 = off_189F0FAB0[a3];
      }
      [v8 setObject:v7 forKey:@"Persist"];
    }

    _OSLogInstallPreferences(2u, self->_bundleID, (uint64_t)self->_prefs);
  }

- (void)setPersistedLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesProcess isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesProcess _levelPrefs](self, "_levelPrefs");
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      int64_t v6 = off_189F0FAB0[a3];
    }
    id v8 = v5;
    [v5 setObject:v6 forKey:@"Persist"];
    if (_LevelForKey(v8, (uint64_t)@"Enable") < a3)
    {
      else {
        v7 = off_189F0FAB0[a3];
      }
      [v8 setObject:v7 forKey:@"Enable"];
    }

    _OSLogInstallPreferences(2u, self->_bundleID, (uint64_t)self->_prefs);
  }

- (void)reset
{
  if (!-[OSLogPreferencesProcess isLocked](self, "isLocked"))
  {
    prefs = self->_prefs;
    self->_prefs = 0LL;

    _OSLogRemovePreferences(2u, self->_bundleID);
  }

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
}

@end