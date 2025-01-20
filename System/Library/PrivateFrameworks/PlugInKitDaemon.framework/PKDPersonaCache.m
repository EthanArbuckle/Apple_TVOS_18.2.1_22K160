@interface PKDPersonaCache
- (BOOL)lock_isSyncedSuccessfully;
- (NSDictionary)lock_bundleToPersonasMap;
- (NSNumber)personalPersonaID;
- (NSNumber)systemPersonaID;
- (PKDExternalProviders)external;
- (PKDPersona)lock_personalPersona;
- (PKDPersona)lock_systemPersona;
- (PKDPersonaCache)initWithExternalProviders:(id)a3;
- (id)_lock_personasForBundleIdentifier:(id)a3;
- (id)personasForBundleIdentifier:(id)a3 error:(id *)a4;
- (void)_lock_flush;
- (void)_lock_resync;
@end

@implementation PKDPersonaCache

- (PKDPersonaCache)initWithExternalProviders:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PKDPersonaCache;
  v6 = -[PKDPersonaCache init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_external, a3);
    lock_bundleToPersonasMap = v7->_lock_bundleToPersonasMap;
    v7->_lock_bundleToPersonasMap = 0LL;

    lock_personalPersona = v7->_lock_personalPersona;
    v7->_lock_personalPersona = 0LL;

    lock_systemPersona = v7->_lock_systemPersona;
    v7->_lock_systemPersona = 0LL;

    v7->_lock_isSyncedSuccessfully = 0;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSNumber)personalPersonaID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKDPersonaCache _lock_refreshFromUserManagementIfNecessary](self, "_lock_refreshFromUserManagementIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPersonaCache lock_personalPersona](self, "lock_personalPersona"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personaID]);
  os_unfair_lock_unlock(p_lock);

  return (NSNumber *)v5;
}

- (NSNumber)systemPersonaID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PKDPersonaCache _lock_refreshFromUserManagementIfNecessary](self, "_lock_refreshFromUserManagementIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPersonaCache lock_systemPersona](self, "lock_systemPersona"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personaID]);
  os_unfair_lock_unlock(p_lock);

  return (NSNumber *)v5;
}

- (id)personasForBundleIdentifier:(id)a3 error:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKDPersonaCache _lock_refreshFromUserManagementIfNecessary](self, "_lock_refreshFromUserManagementIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPersonaCache _lock_personasForBundleIdentifier:](self, "_lock_personasForBundleIdentifier:", v7));

  if (a4)
  {
    BOOL lock_isSyncedSuccessfully = self->_lock_isSyncedSuccessfully;
    if (self->_lock_isSyncedSuccessfully)
    {
      v10 = 0LL;
    }

    else
    {
      uint64_t v11 = pkError(-1LL, @"failed to sync with UserManagement");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    }

    objc_storeStrong(a4, v10);
    if (!lock_isSyncedSuccessfully) {
  }
    }

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_lock_flush
{
  lock_bundleToPersonasMap = self->_lock_bundleToPersonasMap;
  self->_lock_bundleToPersonasMap = 0LL;

  lock_personalPersona = self->_lock_personalPersona;
  self->_lock_personalPersona = 0LL;

  lock_systemPersona = self->_lock_systemPersona;
  self->_lock_systemPersona = 0LL;

  self->_BOOL lock_isSyncedSuccessfully = 0;
}

- (PKDPersona)lock_systemPersona
{
  if (!self->_lock_systemPersona) {
    -[PKDPersonaCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_systemPersona;
}

- (PKDPersona)lock_personalPersona
{
  if (!self->_lock_personalPersona) {
    -[PKDPersonaCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_personalPersona;
}

- (NSDictionary)lock_bundleToPersonasMap
{
  if (!self->_lock_bundleToPersonasMap) {
    -[PKDPersonaCache _lock_resync](self, "_lock_resync");
  }
  return self->_lock_bundleToPersonasMap;
}

- (id)_lock_personasForBundleIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PKDPersonaCache lock_bundleToPersonasMap](self, "lock_bundleToPersonasMap"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  if (v6)
  {
    v8 = (os_log_s *)v6;
    uint64_t v9 = pklog_handle_for_category(13LL, v7);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Mapped bundleID %{public}@ to personas: %{public}@",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PKDPersonaCache lock_personalPersona](self, "lock_personalPersona"));
    v10 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s personaID](v11, "personaID"));
      BOOL v14 = v13 != 0LL;
    }

    else
    {
      BOOL v14 = 0;
    }

    if (v14)
    {
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
      uint64_t v16 = pklog_handle_for_category(13LL, v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        id v21 = v4;
        __int16 v22 = 2114;
        v23 = v10;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "Mapped bundleID %{public}@ to personal: %{public}@",  (uint8_t *)&v20,  0x16u);
      }
    }

    else
    {
      uint64_t v18 = pklog_handle_for_category(13LL, v12);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543362;
        id v21 = v4;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Mapped bundleID %{public}@ to nothing", (uint8_t *)&v20, 0xCu);
      }

      v8 = 0LL;
    }
  }

  return v8;
}

- (void)_lock_resync
{
  self->_BOOL lock_isSyncedSuccessfully = 1;
}

- (BOOL)lock_isSyncedSuccessfully
{
  return self->_lock_isSyncedSuccessfully;
}

- (PKDExternalProviders)external
{
  return self->_external;
}

- (void).cxx_destruct
{
}

@end