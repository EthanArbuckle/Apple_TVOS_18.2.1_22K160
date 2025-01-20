@interface IDSPersistentMigratingPersister
- (BOOL)isAvailable;
- (BOOL)migrated;
- (IDSPersistentMapPersister)destinationPersister;
- (IDSPersistentMapPersister)originPersister;
- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4;
- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4 userDefaults:(id)a5;
- (IMUserDefaults)userDefaults;
- (NSString)description;
- (NSString)identifier;
- (NSString)migrationDefaultKey;
- (id)data;
- (void)purgeData;
- (void)saveData:(id)a3 allowBackup:(BOOL)a4;
- (void)setDestinationPersister:(id)a3;
- (void)setMigrated:(BOOL)a3;
- (void)setMigrationDefaultKey:(id)a3;
- (void)setOriginPersister:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation IDSPersistentMigratingPersister

- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v9 = -[IDSPersistentMigratingPersister initWithOriginPersister:destinationPersister:userDefaults:]( self,  "initWithOriginPersister:destinationPersister:userDefaults:",  v7,  v6,  v8);

  return v9;
}

- (IDSPersistentMigratingPersister)initWithOriginPersister:(id)a3 destinationPersister:(id)a4 userDefaults:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSPersistentMigratingPersister;
  v11 = -[IDSPersistentMigratingPersister init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userDefaults, a5);
    objc_storeStrong((id *)&v12->_destinationPersister, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"persister-migration-%@",  v13));
    migrationDefaultKey = v12->_migrationDefaultKey;
    v12->_migrationDefaultKey = (NSString *)v14;

    unsigned __int8 v16 = -[IMUserDefaults appBoolForKey:]( v12->_userDefaults,  "appBoolForKey:",  v12->_migrationDefaultKey);
    v12->_migrated = v16;
    if ((v16 & 1) != 0)
    {
      originPersister = v12->_migrationDefaultKey;
      v12->_migrationDefaultKey = 0LL;
    }

    else
    {
      v18 = (IDSPersistentMapPersister *)v8;
      originPersister = v12->_originPersister;
      v12->_originPersister = v18;
    }
  }

  return v12;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; origin = %@; destination = %@>",
                   v5,
                   self,
                   self->_originPersister,
                   self->_destinationPersister));

  return (NSString *)v6;
}

- (NSString)identifier
{
  return (NSString *)-[IDSPersistentMapPersister identifier](self->_destinationPersister, "identifier");
}

- (BOOL)isAvailable
{
  if (self->_migrated
    || (unsigned int v3 = -[IDSPersistentMapPersister isAvailable](self->_originPersister, "isAvailable")) != 0)
  {
    LOBYTE(v3) = -[IDSPersistentMapPersister isAvailable](self->_destinationPersister, "isAvailable");
  }

  return v3;
}

- (id)data
{
  if (-[IDSPersistentMigratingPersister isAvailable](self, "isAvailable"))
  {
    uint64_t v3 = 3LL;
    if (!self->_migrated) {
      uint64_t v3 = 2LL;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class data]((&self->super.isa)[v3], "data"));
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (void)saveData:(id)a3 allowBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (-[IDSPersistentMigratingPersister isAvailable](self, "isAvailable"))
  {
    -[IDSPersistentMapPersister saveData:allowBackup:](self->_destinationPersister, "saveData:allowBackup:", v8, v4);
    if (!self->_migrated)
    {
      -[IDSPersistentMapPersister purgeData](self->_originPersister, "purgeData");
      -[IMUserDefaults setAppBool:forKey:](self->_userDefaults, "setAppBool:forKey:", 1LL, self->_migrationDefaultKey);
      migrationDefaultKey = self->_migrationDefaultKey;
      self->_migrationDefaultKey = 0LL;

      originPersister = self->_originPersister;
      self->_originPersister = 0LL;

      self->_migrated = 1;
    }
  }
}

- (void)purgeData
{
  if (-[IDSPersistentMigratingPersister isAvailable](self, "isAvailable"))
  {
    -[IDSPersistentMapPersister purgeData](self->_originPersister, "purgeData");
    -[IDSPersistentMapPersister purgeData](self->_destinationPersister, "purgeData");
  }

  else
  {
    uint64_t v3 = OSLogHandleForIDSCategory("IDSPersistentMap");
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Tried to purge before available -- returning {self: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v5))
    {
      if (_IDSShouldLog(0LL, @"IDSPersistentMap")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Tried to purge before available -- returning {self: %@}");
      }
    }
  }

- (IDSPersistentMapPersister)originPersister
{
  return self->_originPersister;
}

- (void)setOriginPersister:(id)a3
{
}

- (IDSPersistentMapPersister)destinationPersister
{
  return self->_destinationPersister;
}

- (void)setDestinationPersister:(id)a3
{
}

- (BOOL)migrated
{
  return self->_migrated;
}

- (void)setMigrated:(BOOL)a3
{
  self->_migrated = a3;
}

- (NSString)migrationDefaultKey
{
  return self->_migrationDefaultKey;
}

- (void)setMigrationDefaultKey:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end