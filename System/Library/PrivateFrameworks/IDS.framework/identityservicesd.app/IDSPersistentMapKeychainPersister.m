@interface IDSPersistentMapKeychainPersister
- (BOOL)isAvailable;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSPersistentMapKeychainPersister)initWithIdentifier:(id)a3 keychainWrapper:(id)a4 systemMonitor:(id)a5;
- (IMSystemMonitor)systemMonitor;
- (NSString)identifier;
- (id)data;
- (void)purgeData;
- (void)saveData:(id)a3 allowBackup:(BOOL)a4;
- (void)setIdentifier:(id)a3;
@end

@implementation IDSPersistentMapKeychainPersister

- (IDSPersistentMapKeychainPersister)initWithIdentifier:(id)a3 keychainWrapper:(id)a4 systemMonitor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSPersistentMapKeychainPersister;
  v12 = -[IDSPersistentMapKeychainPersister init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_keychainWrapper, a4);
    objc_storeStrong((id *)&v13->_systemMonitor, a5);
  }

  return v13;
}

- (BOOL)isAvailable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister systemMonitor](self, "systemMonitor"));
  char v3 = [v2 isUnderFirstDataProtectionLock] ^ 1;

  return v3;
}

- (id)data
{
  if (-[IDSPersistentMapKeychainPersister isAvailable](self, "isAvailable"))
  {
    char v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister keychainWrapper](self, "keychainWrapper"));
    identifier = self->_identifier;
    id v14 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dataForIdentifier:identifier error:&v14]);
    id v6 = v14;

    if (!v5)
    {
      uint64_t v7 = OSLogHandleForIDSCategory("IDSPersistentMap");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = self->_identifier;
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister keychainWrapper](self, "keychainWrapper"));
        *(_DWORD *)buf = 138543874;
        id v16 = v6;
        __int16 v17 = 2114;
        v18 = v9;
        __int16 v19 = 2114;
        v20 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to load persistent cache data from keychainWrapper {error: %{public}@, identifier: %{public}@, keychain Wrapper: %{public}@}",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v11)
        && _IDSShouldLog(0LL, @"IDSPersistentMap"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister keychainWrapper](self, "keychainWrapper"));
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed to load persistent cache data from keychainWrapper {error: %{public}@, identifier: %{public}@, keychainWrapper: %{public}@}");
      }
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)saveData:(id)a3 allowBackup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[IDSPersistentMapKeychainPersister isAvailable](self, "isAvailable"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister keychainWrapper](self, "keychainWrapper"));
    identifier = self->_identifier;
    id v17 = 0LL;
    unsigned __int8 v9 = [v7 saveData:v6 forIdentifier:identifier allowSync:0 allowBackup:v4 dataProtectionClass:2 error:&v17];
    id v10 = v17;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = OSLogHandleForIDSCategory("IDSPersistentMap");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_identifier;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister keychainWrapper](self, "keychainWrapper"));
        *(_DWORD *)buf = 138544131;
        id v19 = v10;
        __int16 v20 = 2114;
        v21 = v13;
        __int16 v22 = 2113;
        id v23 = v6;
        __int16 v24 = 2114;
        v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to save persistent cache data to keychainWrapper {error: %{public}@, identifier: %{public}@, data: %{pr ivate}@, keychainWrapper: %{public}@}",  buf,  0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled(v15)
        && _IDSShouldLog(0LL, @"IDSPersistentMap"))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMapKeychainPersister keychainWrapper](self, "keychainWrapper"));
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Failed to save persistent cache data to keychainWrapper {error: %{public}@, identifier: %{public}@, data: %{private}@, keychainWrapper: %{public}@}");
      }
    }
  }
}

- (void)purgeData
{
  if (-[IDSPersistentMapKeychainPersister isAvailable](self, "isAvailable"))
  {
    -[IDSPersistentMapKeychainPersister saveData:allowBackup:](self, "saveData:allowBackup:", 0LL, 1LL);
  }

  else
  {
    uint64_t v3 = OSLogHandleForIDSCategory("IDSPersistentMap");
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Tried to purge before available -- returning {self: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v5))
    {
      if (_IDSShouldLog(0LL, @"IDSPersistentMap")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPersistentMap",  @"Tried to purge before available -- returning {self: %@}");
      }
    }
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void).cxx_destruct
{
}

@end