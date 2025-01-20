@interface OSLogPreferencesManager
+ (id)sharedManager;
- (NSArray)processes;
- (NSArray)subsystems;
- (OSLogPreferencesManager)init;
- (id)_levelPrefs;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)reset;
- (void)resetAll;
- (void)resetAllProcesses;
- (void)resetAllSubsystems;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
@end

@implementation OSLogPreferencesManager

- (OSLogPreferencesManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogPreferencesManager;
  v2 = -[OSLogPreferencesManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"com.apple.system.logging";

    [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringByAppendingPathComponent:v3->_name];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 stringByAppendingPathExtension:@"plist"];
    prefsFile = v3->_prefsFile;
    v3->_prefsFile = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x189603FC8] dictionaryWithContentsOfFile:v3->_prefsFile];
    prefs = v3->_prefs;
    v3->_prefs = (NSMutableDictionary *)v9;
  }

  return v3;
}

- (NSArray)processes
{
  return (NSArray *)OSLogPreferencesList(@"Processes");
}

- (NSArray)subsystems
{
  return (NSArray *)OSLogPreferencesList(@"Subsystems");
}

- (int64_t)enabledLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = _LevelForKey(v2, (uint64_t)@"Enable");
  if (v3 == 1) {
    int64_t v4 = 3LL;
  }
  else {
    int64_t v4 = v3;
  }

  return v4;
}

- (int64_t)persistedLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = _LevelForKey(v2, (uint64_t)@"Persist");
  if (v3 == 1) {
    int64_t v4 = 2LL;
  }
  else {
    int64_t v4 = v3;
  }

  return v4;
}

- (id)_levelPrefs
{
  prefs = self->_prefs;
  if (!prefs)
  {
    [MEMORY[0x189603FC8] dictionary];
    int64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prefs;
    self->_prefs = v4;

    prefs = self->_prefs;
  }
  v6 = -[NSMutableDictionary objectForKey:](prefs, "objectForKey:", @"Level");
  if (!v6)
  {
    [MEMORY[0x189603FC8] dictionary];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_prefs, "setObject:forKey:", v6, @"Level");
  }

  return v6;
}

- (void)setEnabledLevel:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v6 = off_189F0FAB0[a3];
  }
  id v8 = v5;
  [v5 setObject:v6 forKey:@"Enable"];
  if (_LevelForKey(v8, (uint64_t)@"Persist") > a3)
  {
    else {
      uint64_t v7 = off_189F0FAB0[a3];
    }
    [v8 setObject:v7 forKey:@"Persist"];
  }

  _OSLogInstallPreferences(1u, self->_name, (uint64_t)self->_prefs);
}

- (void)setPersistedLevel:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v6 = off_189F0FAB0[a3];
  }
  id v8 = v5;
  [v5 setObject:v6 forKey:@"Persist"];
  if (_LevelForKey(v8, (uint64_t)@"Enable") < a3)
  {
    else {
      uint64_t v7 = off_189F0FAB0[a3];
    }
    [v8 setObject:v7 forKey:@"Enable"];
  }

  _OSLogInstallPreferences(1u, self->_name, (uint64_t)self->_prefs);
}

- (void)reset
{
  prefs = self->_prefs;
  self->_prefs = 0LL;

  _OSLogRemovePreferences(1u, self->_name);
}

- (void)resetAll
{
}

- (void)resetAllProcesses
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_25];
}

- (void)resetAllSubsystems
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_27];
}

- (void).cxx_destruct
{
}

void __45__OSLogPreferencesManager_resetAllSubsystems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = -[OSLogPreferencesSubsystem initWithName:]( objc_alloc(&OBJC_CLASS___OSLogPreferencesSubsystem),  "initWithName:",  v2);

  -[OSLogPreferencesSubsystem resetAll](v3, "resetAll");
}

void __44__OSLogPreferencesManager_resetAllProcesses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = -[OSLogPreferencesProcess initWithBundleID:]( objc_alloc(&OBJC_CLASS___OSLogPreferencesProcess),  "initWithBundleID:",  v2);

  -[OSLogPreferencesProcess reset](v3, "reset");
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  }
  return (id)sharedManager_manager;
}

void __40__OSLogPreferencesManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___OSLogPreferencesManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

@end