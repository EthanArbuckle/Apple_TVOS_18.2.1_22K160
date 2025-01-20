@interface LSRecordPromise
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (LSRecordPromise)init;
- (LSRecordPromise)initWithCoder:(id)a3;
- (LSRecordPromise)initWithRecord:(id)a3 error:(id *)a4;
- (id)_initWithRecord:(id)a3;
- (id)fulfillReturningError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSRecordPromise

+ (id)new
{
}

- (LSRecordPromise)init
{
}

- (LSRecordPromise)initWithRecord:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"LSRecord.mm", 795, @"Invalid parameter not satisfying: %@", @"record != nil" object file lineNumber description];
  }

  os_unfair_recursive_lock_lock_with_options();
  if (*((void *)a3 + 2))
  {
    v7 = -[LSRecordPromise _initWithRecord:](self, "_initWithRecord:", a3);
  }

  else
  {
    if (a4)
    {
      uint64_t v12 = *MEMORY[0x189607490];
      v13[0] = @"provided record was not attached";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSRecordPromise initWithRecord:error:]",  800LL,  v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v7 = 0LL;
  }

  os_unfair_recursive_lock_unlock();
  return v7;
}

- (id)fulfillReturningError:(id *)a3
{
  v32[1] = *MEMORY[0x1895F89C0];
  v5 = self->_db;
  id v29 = 0LL;
  v30 = v5;
  v26 = 0LL;
  id v27 = 0LL;
  char v28 = 0;
  if ((_LSSetLocalDatabaseIfNewer(self->_db) & 1) != 0)
  {
    v6 = (LaunchServices::Record *)&v30;
  }

  else
  {
    _LSDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "database in LSRecordPromise is out of date. Using current database.",  buf,  2u);
    }

    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v6 = (LaunchServices::Record *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&v26,  v8,  0LL);

    if (!v6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v18, 0LL);

      if (!v19)
      {
        id v11 = v29;
        if (a3) {
          goto LABEL_16;
        }
        goto LABEL_18;
      }

      id v11 = 0LL;
LABEL_15:
      if (a3)
      {
LABEL_16:
        id v11 = v11;
        v13 = 0LL;
        *a3 = v11;
        goto LABEL_19;
      }

- (id)_initWithRecord:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LSRecordPromise;
  v5 = -[LSRecordPromise init](&v14, sel_init);
  if (v5)
  {
    id v6 = a3;
    os_unfair_recursive_lock_lock_with_options();
    v7 = (id *)v6;
    v8 = v7;
    id v9 = v7[2];
    if ((*((_BYTE *)v7 + 31) & 0x40) == 0 && !v9) {
      __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v7, a2);
    }
    if (v9)
    {
      CSStoreGetUnit();
      id v10 = v8[2];
    }

    else
    {
      id v10 = 0LL;
    }

    os_unfair_recursive_lock_unlock();
    objc_storeStrong((id *)&v5->_db, v10);
    uint64_t v11 = [v8 persistentIdentifier];
    pi = v5->_pi;
    v5->_pi = (NSData *)v11;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (LaunchServices::Record::checkForExfiltrationRisk((LaunchServices::Record *)a3, (NSCoder *)a2))
  {
    uint64_t v8 = *MEMORY[0x189607490];
    v9[0] = @"This process may not encode instances of LSRecordPromise. This class is only for use by InstallCoordination.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -54LL, (uint64_t)"-[LSRecordPromise encodeWithCoder:]", 883LL, v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [a3 failWithError:v6];
  }

  else
  {
    [a3 encodeObject:self->_db->store forKey:@"store"];
    _LSDatabaseGetNode((uint64_t)self->_db);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a3 encodeObject:v7 forKey:@"node"];

    [a3 encodeBool:((unint64_t)_LSDatabaseGetSessionKey((uint64_t)self->_db) >> 32) & 1 forKey:@"systemSession"];
    [a3 encodeInt64:_LSDatabaseGetSessionKey((uint64_t)self->_db) forKey:@"userID"];
    [a3 encodeObject:self->_pi forKey:@"persistentIdentifier"];
  }

- (LSRecordPromise)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___LSRecordPromise;
  v4 = -[LSRecordPromise init](&v16, sel_init);
  if (!v4) {
    return 0LL;
  }
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", _CSStoreGetXPCClass(), @"store");
  v5 = (const void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"node");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = [a3 decodeInt64ForKey:@"userID"];
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"persistentIdentifier");
  id v10 = (void *)v9;
  if (v5 && v6 && v9)
  {
    id v15 = 0LL;
    uint64_t v11 = _LSDatabaseCreate(v6, v8 & 0xFFFFFFFF00000000LL | v7, v5, &v15);
    id v12 = v15;
    if (v11)
    {
      objc_storeStrong((id *)&v4->_db, v11);
      objc_storeStrong((id *)&v4->_pi, v10);
    }

    else
    {
      [a3 failWithError:v12];

      v4 = 0LL;
    }

    goto LABEL_15;
  }

  _LSMakeNSErrorImpl((void *)*MEMORY[0x189607460], 4865LL, (uint64_t)"-[LSRecordPromise initWithCoder:]", 917LL, 0LL);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  [a3 failWithError:v14];

  v4 = 0LL;
  result = 0LL;
  if (v5)
  {
LABEL_15:
    CFRelease(v5);
    return v4;
  }

  return result;
}

- (void).cxx_destruct
{
}

@end