@interface OSLogPreferencesCategory
- (BOOL)isLocked;
- (BOOL)signpostAllowStreaming;
- (BOOL)signpostBacktracesEnabled;
- (BOOL)signpostEnabled;
- (BOOL)signpostPersisted;
- (NSString)name;
- (OSLogPreferencesCategory)initWithName:(id)a3 subsystem:(id)a4;
- (OSLogPreferencesSubsystem)subsystem;
- (int64_t)defaultEnabledLevel;
- (int64_t)defaultPersistedLevel;
- (int64_t)effectiveEnabledLevel;
- (int64_t)effectivePersistedLevel;
- (int64_t)enabledLevel;
- (int64_t)persistedLevel;
- (void)reset;
- (void)setEnabledLevel:(int64_t)a3;
- (void)setPersistedLevel:(int64_t)a3;
- (void)setSignpostAllowStreaming:(BOOL)a3;
- (void)setSignpostBacktracesEnabled:(BOOL)a3;
- (void)setSignpostEnabled:(BOOL)a3;
- (void)setSignpostPersisted:(BOOL)a3;
@end

@implementation OSLogPreferencesCategory

- (OSLogPreferencesCategory)initWithName:(id)a3 subsystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogPreferencesCategory;
  v8 = -[OSLogPreferencesCategory init](&v12, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_subsystem, a4);
  }

  return v8;
}

- (BOOL)isLocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isLocked];

  return v3;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result = -[OSLogPreferencesCategory enabledLevel](self, "enabledLevel");
  if (result == 1)
  {
    int64_t result = -[OSLogPreferencesCategory defaultEnabledLevel](self, "defaultEnabledLevel");
    if (result == 1)
    {
      v4 = -[OSLogPreferencesCategory subsystem](self, "subsystem");
      int64_t v5 = [v4 effectiveEnabledLevel];

      return v5;
    }
  }

  return result;
}

- (int64_t)effectivePersistedLevel
{
  int64_t result = -[OSLogPreferencesCategory persistedLevel](self, "persistedLevel");
  if (result == 1)
  {
    int64_t result = -[OSLogPreferencesCategory defaultPersistedLevel](self, "defaultPersistedLevel");
    if (result == 1)
    {
      v4 = -[OSLogPreferencesCategory subsystem](self, "subsystem");
      int64_t v5 = [v4 effectivePersistedLevel];

      return v5;
    }
  }

  return result;
}

- (int64_t)defaultEnabledLevel
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  int64_t v5 = [v3 _defaultEnabledLevelForCategory:v4];

  return v5;
}

- (int64_t)defaultPersistedLevel
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  int64_t v5 = [v3 _defaultPersistedLevelForCategory:v4];

  return v5;
}

- (int64_t)enabledLevel
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  int64_t v5 = [v3 _enabledLevelForCategory:v4];

  return v5;
}

- (int64_t)persistedLevel
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  int64_t v5 = [v3 _persistedLevelForCategory:v4];

  return v5;
}

- (BOOL)signpostEnabled
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  char v5 = [v3 _signpostEnabledForCategory:v4];

  return v5;
}

- (BOOL)signpostPersisted
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  char v5 = [v3 _signpostPersistedForCategory:v4];

  return v5;
}

- (BOOL)signpostBacktracesEnabled
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  char v5 = [v3 _signpostBacktracesEnabledForCategory:v4];

  return v5;
}

- (BOOL)signpostAllowStreaming
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OSLogPreferencesCategory name](self, "name");
  char v5 = [v3 _signpostAllowStreamingForCategory:v4];

  return v5;
}

- (void)setEnabledLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _setEnabledLevel:a3 forCategory:v5];
  }

- (void)setPersistedLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _setPersistedLevel:a3 forCategory:v5];
  }

- (void)setSignpostEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _setSignpostEnabled:v3 forCategory:v5];
  }

- (void)setSignpostPersisted:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _setSignpostPersisted:v3 forCategory:v5];
  }

- (void)setSignpostBacktracesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _setSignpostBacktracesEnabled:v3 forCategory:v5];
  }

- (void)setSignpostAllowStreaming:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _setSignpostAllowStreaming:v3 forCategory:v5];
  }

- (void)reset
{
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _resetCategory:v3];
  }

- (NSString)name
{
  return self->_name;
}

- (OSLogPreferencesSubsystem)subsystem
{
  return self->_subsystem;
}

- (void).cxx_destruct
{
}

@end