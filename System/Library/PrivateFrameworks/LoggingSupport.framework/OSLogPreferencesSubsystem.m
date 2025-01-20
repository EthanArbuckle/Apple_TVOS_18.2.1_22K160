@interface OSLogPreferencesSubsystem
- (BOOL)_signpostAllowStreamingForCategory:(id)a3;
- (BOOL)_signpostBacktracesEnabledForCategory:(id)a3;
- (BOOL)_signpostEnabledForCategory:(id)a3;
- (BOOL)_signpostPersistedForCategory:(id)a3;
- (BOOL)isLocked;
- (NSArray)categories;
- (NSString)name;
- (OSLogPreferencesSubsystem)initWithName:(id)a3;
- (id)_levelPrefsForCategory:(id)a3;
- (id)_prefsForCategory:(id)a3;
- (int64_t)_defaultEnabledLevelForCategory:(id)a3;
- (int64_t)_defaultPersistedLevelForCategory:(id)a3;
- (int64_t)_enabledLevelForCategory:(id)a3;
- (int64_t)_persistedLevelForCategory:(id)a3;
- (int64_t)defaultEnabledLevel;
- (int64_t)defaultPersistedLevel;
- (int64_t)effectiveEnabledLevel;
- (int64_t)effectivePersistedLevel;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)_resetCategory:(id)a3;
- (void)_setEnabledLevel:(int64_t)a3 forCategory:(id)a4;
- (void)_setPersistedLevel:(int64_t)a3 forCategory:(id)a4;
- (void)_setSignpostAllowStreaming:(BOOL)a3 forCategory:(id)a4;
- (void)_setSignpostBacktracesEnabled:(BOOL)a3 forCategory:(id)a4;
- (void)_setSignpostEnabled:(BOOL)a3 forCategory:(id)a4;
- (void)_setSignpostPersisted:(BOOL)a3 forCategory:(id)a4;
- (void)reset;
- (void)resetAll;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
@end

@implementation OSLogPreferencesSubsystem

- (OSLogPreferencesSubsystem)initWithName:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___OSLogPreferencesSubsystem;
  v5 = -[OSLogPreferencesSubsystem init](&v31, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)NSString;
    id v9 = v4;
    [v8 stringWithUTF8String:_os_trace_sysprefsdir_path()];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stringByAppendingPathComponent:@"Subsystems"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringByAppendingPathComponent:v9];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v12 stringByAppendingPathExtension:@"plist"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v13];

    systemPrefs = v5->_systemPrefs;
    v5->_systemPrefs = (NSDictionary *)v14;

    if (_os_trace_is_development_build())
    {
      [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 stringByAppendingPathComponent:@"Subsystems"];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 stringByAppendingPathComponent:v9];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 stringByAppendingPathExtension:@"plist"];
      internalPrefsFile = v5->_internalPrefsFile;
      v5->_internalPrefsFile = (NSString *)v19;

      uint64_t v21 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v5->_internalPrefsFile];
      internalPrefs = v5->_internalPrefs;
      v5->_internalPrefs = (NSDictionary *)v21;
    }

    [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 stringByAppendingPathComponent:@"Subsystems"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 stringByAppendingPathComponent:v9];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 stringByAppendingPathExtension:@"plist"];
    prefsFile = v5->_prefsFile;
    v5->_prefsFile = (NSString *)v26;

    uint64_t v28 = [MEMORY[0x189603FC8] dictionaryWithContentsOfFile:v5->_prefsFile];
    prefs = v5->_prefs;
    v5->_prefs = (NSMutableDictionary *)v28;
  }

  return v5;
}

- (NSArray)categories
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  systemPrefs = self->_systemPrefs;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke;
  v18[3] = &unk_189F0FA28;
  id v6 = v3;
  id v19 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](systemPrefs, "enumerateKeysAndObjectsUsingBlock:", v18);
  internalPrefs = self->_internalPrefs;
  v16[0] = v5;
  v16[1] = 3221225472LL;
  v16[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke_2;
  v16[3] = &unk_189F0FA28;
  id v8 = v6;
  id v17 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](internalPrefs, "enumerateKeysAndObjectsUsingBlock:", v16);
  prefs = self->_prefs;
  v14[0] = v5;
  v14[1] = 3221225472LL;
  v14[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke_3;
  v14[3] = &unk_189F0FA28;
  id v10 = v8;
  id v15 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](prefs, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = v15;
  v12 = (NSArray *)v10;

  return v12;
}

- (BOOL)isLocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result = -[OSLogPreferencesSubsystem enabledLevel](self, "enabledLevel");
  if (result == 1)
  {
    int64_t result = -[OSLogPreferencesSubsystem defaultEnabledLevel](self, "defaultEnabledLevel");
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
  int64_t result = -[OSLogPreferencesSubsystem persistedLevel](self, "persistedLevel");
  if (result == 1)
  {
    int64_t result = -[OSLogPreferencesSubsystem defaultPersistedLevel](self, "defaultPersistedLevel");
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
  return -[OSLogPreferencesSubsystem _defaultEnabledLevelForCategory:]( self,  "_defaultEnabledLevelForCategory:",  @"DEFAULT-OPTIONS");
}

- (int64_t)defaultPersistedLevel
{
  return -[OSLogPreferencesSubsystem _defaultPersistedLevelForCategory:]( self,  "_defaultPersistedLevelForCategory:",  @"DEFAULT-OPTIONS");
}

- (int64_t)enabledLevel
{
  return -[OSLogPreferencesSubsystem _enabledLevelForCategory:]( self,  "_enabledLevelForCategory:",  @"DEFAULT-OPTIONS");
}

- (int64_t)persistedLevel
{
  return -[OSLogPreferencesSubsystem _persistedLevelForCategory:]( self,  "_persistedLevelForCategory:",  @"DEFAULT-OPTIONS");
}

- (void)setEnabledLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked")) {
    -[OSLogPreferencesSubsystem _setEnabledLevel:forCategory:]( self,  "_setEnabledLevel:forCategory:",  a3,  @"DEFAULT-OPTIONS");
  }
}

- (void)setPersistedLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked")) {
    -[OSLogPreferencesSubsystem _setPersistedLevel:forCategory:]( self,  "_setPersistedLevel:forCategory:",  a3,  @"DEFAULT-OPTIONS");
  }
}

- (void)reset
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked")) {
    -[OSLogPreferencesSubsystem _resetCategory:](self, "_resetCategory:", @"DEFAULT-OPTIONS");
  }
}

- (void)resetAll
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked"))
  {
    prefs = self->_prefs;
    self->_prefs = 0LL;

    _OSLogRemovePreferences(3u, self->_name);
  }

- (int64_t)_defaultEnabledLevelForCategory:(id)a3
{
  id v4 = a3;
  -[NSDictionary objectForKey:](self->_internalPrefs, "objectForKey:", v4);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"Level"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = _LevelForKey(v6, (uint64_t)@"Enable");
  if (v7 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKey:@"Level"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    int64_t v10 = _LevelForKey(v9, (uint64_t)@"Enable");
    id v6 = v9;
  }

  else
  {
    int64_t v10 = v7;
  }

  return v10;
}

- (int64_t)_defaultPersistedLevelForCategory:(id)a3
{
  id v4 = a3;
  -[NSDictionary objectForKey:](self->_internalPrefs, "objectForKey:", v4);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"Level"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = _LevelForKey(v6, (uint64_t)@"Persist");
  if (v7 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKey:@"Level"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    int64_t v10 = _LevelForKey(v9, (uint64_t)@"Persist");
    id v6 = v9;
  }

  else
  {
    int64_t v10 = v7;
  }

  return v10;
}

- (int64_t)_enabledLevelForCategory:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"Level"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v5 = _LevelForKey(v4, (uint64_t)@"Enable");
  return v5;
}

- (int64_t)_persistedLevelForCategory:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"Level"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v5 = _LevelForKey(v4, (uint64_t)@"Persist");
  return v5;
}

- (BOOL)_signpostEnabledForCategory:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", v4);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"Signpost-Enabled"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:@"Signpost-Enabled"],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    LOBYTE(v8) = [v6 BOOLValue];
  }

  else if ([v4 isEqualToString:@"DynamicTracing"])
  {
    LOBYTE(v8) = 0;
  }

  else
  {
    int v8 = [v4 isEqualToString:@"DynamicStackTracing"] ^ 1;
  }

  return v8;
}

- (BOOL)_signpostPersistedForCategory:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", v4);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"Signpost-Persisted"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:@"Signpost-Persisted"],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    char v8 = [v6 BOOLValue];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_signpostBacktracesEnabledForCategory:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", v4);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:@"Signpost-Backtraces-Enabled"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:@"Signpost-Backtraces-Enabled"],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    char v8 = [v6 BOOLValue];
  }

  else
  {
    char v8 = [v4 isEqualToString:@"DynamicStackTracing"];
  }

  return v8;
}

- (BOOL)_signpostAllowStreamingForCategory:(id)a3
{
  id v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prefs, "objectForKeyedSubscript:", v4);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"Signpost-Allow-Streaming"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKeyedSubscript:](self->_systemPrefs, "objectForKeyedSubscript:", v4),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:@"Signpost-Allow-Streaming"],
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    char v8 = [v6 BOOLValue];
  }

  else
  {
    char v8 = 1;
  }

  return v8;
}

- (id)_prefsForCategory:(id)a3
{
  id v4 = a3;
  prefs = self->_prefs;
  if (!prefs)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_prefs;
    self->_prefs = v6;

    prefs = self->_prefs;
  }

  -[NSMutableDictionary objectForKey:](prefs, "objectForKey:", v4);
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    [MEMORY[0x189603FC8] dictionary];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_prefs, "setObject:forKey:", v8, v4);
  }

  return v8;
}

- (id)_levelPrefsForCategory:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKey:@"Level"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"Level"];
  }

  return v4;
}

- (void)_setEnabledLevel:(int64_t)a3 forCategory:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v7 = off_189F0FAB0[a3];
  }
  id v9 = v6;
  [v6 setObject:v7 forKey:@"Enable"];
  if (_LevelForKey(v9, (uint64_t)@"Persist") > a3)
  {
    else {
      char v8 = off_189F0FAB0[a3];
    }
    [v9 setObject:v8 forKey:@"Persist"];
  }

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setPersistedLevel:(int64_t)a3 forCategory:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    uint64_t v7 = off_189F0FAB0[a3];
  }
  id v9 = v6;
  [v6 setObject:v7 forKey:@"Persist"];
  if (_LevelForKey(v9, (uint64_t)@"Enable") < a3)
  {
    else {
      char v8 = off_189F0FAB0[a3];
    }
    [v9 setObject:v8 forKey:@"Enable"];
  }

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostEnabled:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKey:@"Signpost-Enabled"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostPersisted:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKey:@"Signpost-Persisted"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostBacktracesEnabled:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKey:@"Signpost-Backtraces-Enabled"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostAllowStreaming:(BOOL)a3 forCategory:(id)a4
{
  BOOL v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKey:@"Signpost-Allow-Streaming"];

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_resetCategory:(id)a3
{
  if (-[NSMutableDictionary count](self->_prefs, "count"))
  {
    _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
  }

  else
  {
    prefs = self->_prefs;
    self->_prefs = 0LL;

    _OSLogRemovePreferences(3u, self->_name);
  }

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"DEFAULT-OPTIONS"] & 1) == 0
    && ([v3 isEqualToString:@"Locked"] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"DEFAULT-OPTIONS"] & 1) == 0
    && ([v3 isEqualToString:@"Locked"] & 1) == 0
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"DEFAULT-OPTIONS"] & 1) == 0
    && ([v3 isEqualToString:@"Locked"] & 1) == 0
    && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end