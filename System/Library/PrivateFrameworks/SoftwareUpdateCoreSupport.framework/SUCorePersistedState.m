@interface SUCorePersistedState
- (BOOL)BOOLeanForKey:(id)a3;
- (BOOL)BOOLeanForKey:(id)a3 forType:(int)a4;
- (BOOL)defaultLevelLogging;
- (BOOL)isPersistedStateLoaded;
- (BOOL)loadPersistedState;
- (NSMutableDictionary)persistedState;
- (NSString)persistencePath;
- (NSString)versionPolicyLayer;
- (NSString)versionSUCore;
- (OS_dispatch_queue)persistedStateQueue;
- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5;
- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5 issuingDefaultLevelLogging:(BOOL)a6;
- (id)_createEmptyPersistedState;
- (id)_keyNameForPersistedStateType:(int)a3;
- (id)dataForKey:(id)a3;
- (id)dataForKey:(id)a3 forType:(int)a4;
- (id)dateForKey:(id)a3;
- (id)dateForKey:(id)a3 forType:(int)a4;
- (id)description;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryForKey:(id)a3 forType:(int)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5;
- (id)persistedContentsType;
- (id)persistedCoreVersion;
- (id)persistedPolicyVersion;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5 forType:(int)a6;
- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5;
- (id)stringForKey:(id)a3;
- (id)stringForKey:(id)a3 forType:(int)a4;
- (id)summary;
- (unint64_t)ullForKey:(id)a3;
- (unint64_t)ullForKey:(id)a3 forType:(int)a4;
- (void)_writePersistedState;
- (void)persistBoolean:(BOOL)a3 forKey:(id)a4;
- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistData:(id)a3 forKey:(id)a4;
- (void)persistData:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistData:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistDate:(id)a3 forKey:(id)a4;
- (void)persistDate:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistDate:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistDictionary:(id)a3 forKey:(id)a4;
- (void)persistDictionary:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistDictionary:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistObject:(id)a3 forKey:(id)a4;
- (void)persistObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4;
- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistState;
- (void)persistString:(id)a3 forKey:(id)a4;
- (void)persistString:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistString:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)persistULL:(unint64_t)a3 forKey:(id)a4;
- (void)persistULL:(unint64_t)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6;
- (void)persistULL:(unint64_t)a3 forKey:(id)a4 shouldPersist:(BOOL)a5;
- (void)removePersistedState;
- (void)setDefaultLevelLogging:(BOOL)a3;
- (void)setPersistedState:(id)a3;
- (void)setPersistencePath:(id)a3;
- (void)setVersionPolicyLayer:(id)a3;
- (void)setVersionSUCore:(id)a3;
@end

@implementation SUCorePersistedState

- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5
{
  return -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:]( self,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:",  a3,  a4,  a5,  1LL);
}

- (SUCorePersistedState)initWithDispatchQueue:(id)a3 withPersistencePath:(id)a4 forPolicyVersion:(id)a5 issuingDefaultLevelLogging:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SUCorePersistedState;
  v14 = -[SUCorePersistedState init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_persistedStateQueue, a3);
    objc_storeStrong((id *)&v15->_persistencePath, a4);
    objc_storeStrong((id *)&v15->_versionPolicyLayer, a5);
    v15->_defaultLevelLogging = a6;
    objc_storeStrong((id *)&v15->_versionSUCore, @"2.1.0");
    persistedState = v15->_persistedState;
    v15->_persistedState = 0LL;
  }

  return v15;
}

- (BOOL)isPersistedStateLoaded
{
  v2 = self;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);
  v4 = -[SUCorePersistedState persistedState](v2, "persistedState");
  LOBYTE(v2) = v4 != 0LL;

  return (char)v2;
}

- (id)persistedContentsType
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);
  v4 = -[SUCorePersistedState persistedState](self, "persistedState");
  if (v4)
  {
    v5 = -[SUCorePersistedState persistedState](self, "persistedState");
    [v5 safeStringForKey:@"SUCorePersistedStateContentsType"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v7 oslog];
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl( &dword_187139000,  v8,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] returning persisted contents type with string value: %{public}@",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

  else
  {
    v9 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    objc_msgSend( v9,  "trackError:forReason:withResult:withError:",  @"[PERSISTED_STATE]",  @"persisted state is not loaded, unable to load core contents type string",  8250,  0);

    v6 = 0LL;
  }

  return v6;
}

- (id)persistedCoreVersion
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);
  v4 = -[SUCorePersistedState persistedState](self, "persistedState");
  if (v4)
  {
    v5 = -[SUCorePersistedState persistedState](self, "persistedState");
    [v5 safeStringForKey:@"SUCorePersistedStateCoreVersion"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v7 oslog];
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl( &dword_187139000,  v8,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] returning persisted core version with string value: %{public}@",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

  else
  {
    v9 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    objc_msgSend( v9,  "trackError:forReason:withResult:withError:",  @"[PERSISTED_STATE]",  @"persisted state is not loaded, unable to load core version string",  8250,  0);

    v6 = 0LL;
  }

  return v6;
}

- (id)persistedPolicyVersion
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);
  v4 = -[SUCorePersistedState persistedState](self, "persistedState");
  if (v4)
  {
    v5 = -[SUCorePersistedState persistedState](self, "persistedState");
    [v5 safeStringForKey:@"SUCorePersistedStatePolicyVersion"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v7 oslog];
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v6;
        _os_log_impl( &dword_187139000,  v8,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] returning persisted policy version with string value: %{public}@",  (uint8_t *)&v11,  0xCu);
      }
    }
  }

  else
  {
    v9 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    objc_msgSend( v9,  "trackError:forReason:withResult:withError:",  @"[PERSISTED_STATE]",  @"persisted state is not loaded, unable to load policy version string",  8250,  0);

    v6 = 0LL;
  }

  return v6;
}

- (BOOL)loadPersistedState
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);
  v4 = -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v5 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
  if (!v4)
  {
    if (v5)
    {
      v9 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v9 oslog];
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCorePersistedState summary](self, "summary");
        int v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v11;
        _os_log_impl( &dword_187139000,  v10,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] loading persisted state with summary: %{public}@",  buf,  0xCu);
      }
    }

    id v12 = (void *)MEMORY[0x189603F48];
    -[SUCorePersistedState persistencePath](self, "persistencePath");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = 0LL;
    [v12 dataWithContentsOfFile:v13 options:0 error:&v32];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v32;

    if (v7)
    {
      [v7 domain];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v15 isEqualToString:*MEMORY[0x189607460]])
      {
        if ([v7 code] == 4)
        {

LABEL_27:
          if (!-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
          {
            BOOL v8 = 1;
            goto LABEL_35;
          }
          v23 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          [v23 oslog];
          objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_187139000,  v18,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] no persisted state file found at persistence path",  buf,  2u);
          }

          BOOL v8 = 1;
LABEL_34:

LABEL_35:
          v25 = -[SUCorePersistedState persistedState](self, "persistedState");
          if (!v25)
          {
            v26 = -[SUCorePersistedState _createEmptyPersistedState](self, "_createEmptyPersistedState");
            -[SUCorePersistedState setPersistedState:](self, "setPersistedState:", v26);

            if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
            {
              v27 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
              [v27 oslog];
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = -[SUCorePersistedState persistedState](self, "persistedState");
                *(_DWORD *)buf = 138543362;
                v34 = v29;
                _os_log_impl( &dword_187139000,  v28,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] created a new, empty persisted state dictionary: %{public}@",  buf,  0xCu);
              }
            }
          }

          goto LABEL_41;
        }

        uint64_t v22 = [v7 code];

        if (v22 == 260) {
          goto LABEL_27;
        }
      }

      else
      {
      }
    }

    else if (v14)
    {
      id v31 = 0LL;
      [MEMORY[0x1896079E8] propertyListWithData:v14 options:2 format:0 error:&v31];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (os_log_s *)v31;
      objc_super v18 = v17;
      BOOL v8 = v16 != 0LL;
      if (v16)
      {
        if (v17)
        {
          v19 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
          objc_msgSend( v19,  "trackAnomaly:forReason:withResult:withError:",  @"[PERSISTED_STATE]",  @"an error occurred when loading the persisted state, but the state was still loaded",  8251,  v18);
        }

        if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
        {
          v20 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          [v20 oslog];
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v16;
            _os_log_impl( &dword_187139000,  v21,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] loaded persisted state: %{public}@",  buf,  0xCu);
          }
        }

        -[SUCorePersistedState setPersistedState:](self, "setPersistedState:", v16);
      }

      else
      {
        v24 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        [v24 trackError:@"[PERSISTED_STATE]" forReason:@"unable to load persisted state as dictionary" withResult:8106 withError:v18];
      }

      goto LABEL_34;
    }

    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s trackError:forReason:withResult:withError:]( v18,  "trackError:forReason:withResult:withError:",  @"[PERSISTED_STATE]",  @"unable to serialize contents of persisted state file",  8106LL,  v7);
    BOOL v8 = 0;
    goto LABEL_34;
  }

  if (v5)
  {
    v6 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v6 oslog];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] attempting to load persisted state, but state is already loaded - no operation to perform",  buf,  2u);
    }

    BOOL v8 = 1;
LABEL_41:

    return v8;
  }

  return 1;
}

- (void)removePersistedState
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
  {
    v4 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v4 oslog];
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[SUCorePersistedState summary](self, "summary");
      *(_DWORD *)buf = 138543362;
      objc_super v18 = v6;
      _os_log_impl( &dword_187139000,  v5,  OS_LOG_TYPE_DEFAULT,  "attempting to remove persisted state with summary: %{public}@",  buf,  0xCu);
    }
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState persistencePath](self, "persistencePath");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  char v9 = [v7 removeItemAtPath:v8 error:&v16];
  id v10 = v16;
  int v11 = v10;
  if ((v9 & 1) != 0)
  {
  }

  else
  {
    uint64_t v12 = [v10 code];

    if (v12 != 4)
    {
      v15 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      [v15 trackError:@"[PERSISTED_STATE]" forReason:@"failed to remove persisted state file" withResult:8110 withError:v11];

      goto LABEL_14;
    }
  }

  if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  v14,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] successfully removed persisted state file",  buf,  2u);
    }
  }

  -[SUCorePersistedState setPersistedState:](self, "setPersistedState:", 0LL);
LABEL_14:
}

- (BOOL)BOOLeanForKey:(id)a3
{
  return -[SUCorePersistedState BOOLeanForKey:forType:](self, "BOOLeanForKey:forType:", a3, 1LL);
}

- (BOOL)BOOLeanForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load BOOLean value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    char v12 = 0;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v14 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v15 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }

  char v12 = [v11 safeBooleanForKey:v6];
LABEL_7:

  return v12;
}

- (unint64_t)ullForKey:(id)a3
{
  return -[SUCorePersistedState ullForKey:forType:](self, "ullForKey:forType:", a3, 1LL);
}

- (unint64_t)ullForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load ULL value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    unint64_t v12 = 0LL;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v14 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v15 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }

  unint64_t v12 = [v11 safeULLForKey:v6];
LABEL_7:

  return v12;
}

- (id)stringForKey:(id)a3
{
  return -[SUCorePersistedState stringForKey:forType:](self, "stringForKey:forType:", a3, 1LL);
}

- (id)stringForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load string value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    unint64_t v12 = 0LL;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v14 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v15 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }

  [v11 safeStringForKey:v6];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  return -[SUCorePersistedState dictionaryForKey:forType:](self, "dictionaryForKey:forType:", a3, 1LL);
}

- (id)dictionaryForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v12 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load dictionary value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v12 withResult:8250 withError:0];
LABEL_6:
    uint64_t v13 = 0LL;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = (void *)[v14 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v15];
    [v12 trackError:@"[PERSISTED_STATE]" forReason:v16 withResult:8252 withError:0];

    goto LABEL_6;
  }

  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 safeDictionaryForKey:v6 fromBase:@"SUCorePersistedState fieldSpecificDictionary" withKeyDescription:v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (id)dataForKey:(id)a3
{
  return -[SUCorePersistedState dataForKey:forType:](self, "dataForKey:forType:", a3, 1LL);
}

- (id)dataForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load data value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    unint64_t v12 = 0LL;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }

  [v11 safeDataForKey:v6];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)dateForKey:(id)a3
{
  return -[SUCorePersistedState dateForKey:forType:](self, "dateForKey:forType:", a3, 1LL);
}

- (id)dateForKey:(id)a3 forType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCorePersistedState persistedState](self, "persistedState");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load date value for key: %@", v6];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v13 withResult:8250 withError:0];

LABEL_6:
    unint64_t v12 = 0LL;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 safeObjectForKey:v10 ofClass:objc_opt_class()];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)[v15 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v16];
    [v14 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8252 withError:0];

    goto LABEL_6;
  }

  [v11 safeDateForKey:v6];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return -[SUCorePersistedState objectForKey:ofClass:forType:](self, "objectForKey:ofClass:forType:", a3, a4, 1LL);
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  char v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[SUCorePersistedState persistedState](self, "persistedState");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = (void *)[objc_alloc(NSString) initWithFormat:@"persisted state is not loaded, unable to load object value for key: %@", v8];
    [v13 trackError:@"[PERSISTED_STATE]" forReason:v15 withResult:8250 withError:0];

LABEL_6:
    id v14 = 0LL;
    goto LABEL_7;
  }

  -[SUCorePersistedState persistedState](self, "persistedState");
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v5);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 safeObjectForKey:v12 ofClass:objc_opt_class()];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v5);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (void *)[v17 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v18];
    [v16 trackError:@"[PERSISTED_STATE]" forReason:v19 withResult:8252 withError:0];

    goto LABEL_6;
  }

  [v13 safeObjectForKey:v8 ofClass:a4];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v14;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4
{
  id v6 = (objc_class *)MEMORY[0x189604010];
  id v7 = a3;
  id v8 = (void *)objc_msgSend([v6 alloc], "initWithObjects:", a4, 0);
  -[SUCorePersistedState secureCodedObjectForKey:ofClass:encodeClasses:forType:]( self,  "secureCodedObjectForKey:ofClass:encodeClasses:forType:",  v7,  a4,  v8,  3LL);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5
{
  return -[SUCorePersistedState secureCodedObjectForKey:ofClass:encodeClasses:forType:]( self,  "secureCodedObjectForKey:ofClass:encodeClasses:forType:",  a3,  a4,  a5,  3LL);
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 forType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (objc_class *)MEMORY[0x189604010];
  id v9 = a3;
  id v10 = (void *)objc_msgSend([v8 alloc], "initWithObjects:", a4, 0);
  -[SUCorePersistedState secureCodedObjectForKey:ofClass:encodeClasses:forType:]( self,  "secureCodedObjectForKey:ofClass:encodeClasses:forType:",  v9,  a4,  v10,  v5);
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)secureCodedObjectForKey:(id)a3 ofClass:(Class)a4 encodeClasses:(id)a5 forType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if ((v6 & 0xFFFFFFFE) == 2)
  {
    -[SUCorePersistedState dataForKey:forType:](self, "dataForKey:forType:", v10, v6);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
    if (!v13)
    {
      if (!v14)
      {
        id v25 = 0LL;
LABEL_21:

        goto LABEL_22;
      }
      v26 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v26 oslog];
      objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v6);
        *(_DWORD *)buf = 138543618;
        id v33 = v10;
        __int16 v34 = 2114;
        id v35 = v27;
        _os_log_impl( &dword_187139000,  v18,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] no data object present in secure coded object persisted state for key %{public}@ and type %{public}@",  buf,  0x16u);
      }

      id v25 = 0LL;
LABEL_20:

      goto LABEL_21;
    }

    if (v14)
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 oslog];
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v33 = v10;
        __int16 v34 = 2114;
        id v35 = v11;
        _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] attempting to load encoded data for key %{public}@ with classes: %{public}@",  buf,  0x16u);
      }
    }

    id v31 = 0LL;
    [MEMORY[0x189607908] unarchivedObjectOfClasses:v11 fromData:v13 error:&v31];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v18 = (os_log_s *)v31;
    if (v18)
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)[objc_alloc(NSString) initWithFormat:@"NSKeyedUnarchiver error found when attempting to unarchive data for key %@", v10];
      [v19 trackError:@"[PERSISTED_STATE]" forReason:v20 withResult:8254 withError:v18];
    }

    else
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v25 = v17;
LABEL_19:

        goto LABEL_20;
      }
      v28 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      v29 = (void *)[objc_alloc(NSString) initWithFormat:@"unarchived object is not of the expected class %@", a4];
      [v28 trackError:@"[PERSISTED_STATE]" forReason:v29 withResult:8255 withError:0];
    }

    id v25 = 0LL;
    goto LABEL_19;
  }
  v21 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  id v22 = objc_alloc(NSString);
  v23 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v6);
  v24 = (void *)[v22 initWithFormat:@"invalid SUCorePersistedStateType (%@) provided for secure coded object persistence", v23];
  [v21 trackAnomaly:@"[PERSISTED_STATE]" forReason:v24 withResult:8253 withError:0];

  id v25 = 0LL;
LABEL_22:

  return v25;
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4
{
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistBoolean:(BOOL)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a3;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCorePersistedState persistedState](self, "persistedState");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 safeObjectForKey:v14 ofClass:objc_opt_class()];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
      {
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 oslog];
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v18 = @"NO";
          if (v8) {
            objc_super v18 = @"YES";
          }
          *(_DWORD *)buf = 138543618;
          id v29 = v10;
          __int16 v30 = 2114;
          id v31 = v18;
          _os_log_impl( &dword_187139000,  v17,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with BOOLean value: %{public}@=%{public}@",  buf,  0x16u);
        }
      }

      [MEMORY[0x189607968] numberWithBool:v8];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setValue:v19 forKey:v10];

      if (v6) {
        -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
      }
    }

    else
    {
      v24 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v25 = objc_alloc(NSString);
      v26 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v27 = (void *)[v25 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v26];
      [v24 trackError:@"[PERSISTED_STATE]" forReason:v27 withResult:8252 withError:0];
    }
  }

  else
  {
    v20 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v21 = objc_alloc(NSString);
    id v22 = @"NO";
    if (v8) {
      id v22 = @"YES";
    }
    v23 = (void *)[v21 initWithFormat:@"unable to persist BOOLean for key with value: %@=%@", v10, v22];
    [v20 trackError:@"[PERSISTED_STATE]" forReason:v23 withResult:8250 withError:0];
  }
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4
{
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistULL:(unint64_t)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCorePersistedState persistedState](self, "persistedState");
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 safeObjectForKey:v14 ofClass:objc_opt_class()];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
      {
        +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 oslog];
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v26 = v10;
          __int16 v27 = 2048;
          unint64_t v28 = a3;
          _os_log_impl( &dword_187139000,  v17,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with ULL value: %{public}@=%lld",  buf,  0x16u);
        }
      }

      [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setValue:v18 forKey:v10];

      if (v6) {
        -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
      }
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = objc_alloc(NSString);
      v23 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      v24 = (void *)[v22 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v23];
      [v21 trackError:@"[PERSISTED_STATE]" forReason:v24 withResult:8252 withError:0];
    }
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to persist ULL for key with value: %@=%lld", v10, a3];
    [v19 trackError:@"[PERSISTED_STATE]" forReason:v20 withResult:8250 withError:0];
  }
}

- (void)persistString:(id)a3 forKey:(id)a4
{
}

- (void)persistString:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistString:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      BOOL v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 oslog];
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with string value: %{public}@=%{public}@",  buf,  0x16u);
          }
        }

        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 oslog];
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl( &dword_187139000,  v27,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] removing persisted state string for key: %{public}@",  buf,  0xCu);
          }
        }

        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = objc_alloc(NSString);
      v24 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }

- (void)persistDictionary:(id)a3 forKey:(id)a4
{
}

- (void)persistDictionary:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistDictionary:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      BOOL v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 oslog];
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with dictionary value: %{public}@=%{public}@",  buf,  0x16u);
          }
        }

        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 oslog];
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl( &dword_187139000,  v27,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] removing persisted state dictionary for key: %{public}@",  buf,  0xCu);
          }
        }

        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = objc_alloc(NSString);
      v24 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }

- (void)persistData:(id)a3 forKey:(id)a4
{
}

- (void)persistData:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistData:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      BOOL v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 oslog];
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with data value: %{public}@=%{public}@",  buf,  0x16u);
          }
        }

        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 oslog];
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl( &dword_187139000,  v27,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] removing persisted state data for key: %{public}@",  buf,  0xCu);
          }
        }

        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = objc_alloc(NSString);
      v24 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }

- (void)persistDate:(id)a3 forKey:(id)a4
{
}

- (void)persistDate:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistDate:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      BOOL v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 oslog];
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with date value: %{public}@=%{public}@",  buf,  0x16u);
          }
        }

        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 oslog];
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl( &dword_187139000,  v27,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] removing persisted state date for key: %{public}@",  buf,  0xCu);
          }
        }

        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = objc_alloc(NSString);
      v24 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }

- (void)persistObject:(id)a3 forKey:(id)a4
{
}

- (void)persistObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCorePersistedState persistedState](self, "persistedState");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 safeObjectForKey:v15 ofClass:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      BOOL v17 = -[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging");
      if (v10)
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 oslog];
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v29 = v11;
            __int16 v30 = 2114;
            id v31 = v10;
            _os_log_impl( &dword_187139000,  v19,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] setting persisted state for key with object value: %{public}@=%{public}@",  buf,  0x16u);
          }
        }

        [v16 setValue:v10 forKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      else
      {
        if (v17)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 oslog];
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = v11;
            _os_log_impl( &dword_187139000,  v27,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] removing persisted state object for key: %{public}@",  buf,  0xCu);
          }
        }

        [v16 removeObjectForKey:v11];
        if (!v6) {
          goto LABEL_18;
        }
      }

      -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = objc_alloc(NSString);
      v24 = -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
      id v25 = (void *)[v23 initWithFormat:@"failed to load dictionary for SUCorePersistedStateType=%@", v24];
      [v22 trackError:@"[PERSISTED_STATE]" forReason:v25 withResult:8252 withError:0];
    }

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4
{
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 shouldPersist:(BOOL)a5
{
}

- (void)persistSecureCodedObject:(id)a3 forKey:(id)a4 forType:(int)a5 shouldPersist:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  unint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if ((v7 & 0xFFFFFFFE) == 2)
  {
    if (v10)
    {
      id v20 = 0LL;
      [MEMORY[0x1896078F8] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v20];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = v20;
      if (v14)
      {
        +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 trackError:@"[PERSISTED_STATE]" forReason:@"failed to use NSKeyedArchiver to archive the object into encoded NSData" withResult:8254 withError:v14];
      }
    }

    else
    {
      uint64_t v13 = 0LL;
      id v14 = 0LL;
    }

    -[SUCorePersistedState persistData:forKey:forType:shouldPersist:]( self,  "persistData:forKey:forType:shouldPersist:",  v13,  v11,  v7,  v6);
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = objc_alloc(NSString);
    -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", v7);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (void *)[v17 initWithFormat:@"invalid SUCorePersistedStateType (%@) provided for secure coded object persistence", v18];
    [v16 trackAnomaly:@"[PERSISTED_STATE]" forReason:v19 withResult:8253 withError:0];
  }
}

- (void)persistState
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCorePersistedState persistedStateQueue](self, "persistedStateQueue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[SUCorePersistedState defaultLevelLogging](self, "defaultLevelLogging"))
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCorePersistedState description](self, "description");
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v7;
        _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[PERSISTED_STATE] persisting the state %{public}@",  buf,  0xCu);
      }
    }

    -[SUCorePersistedState _writePersistedState](self, "_writePersistedState");
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(NSString);
    -[SUCorePersistedState description](self, "description");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = (void *)[v8 initWithFormat:@"unable to persist state: %@", v9];
    [v11 trackError:@"[PERSISTED_STATE]" forReason:v10 withResult:8250 withError:0];
  }

- (id)summary
{
  id v3 = objc_alloc(NSString);
  -[SUCorePersistedState persistencePath](self, "persistencePath");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionPolicyLayer](self, "versionPolicyLayer");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionSUCore](self, "versionSUCore");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v3 initWithFormat:@"persistencePath:%@, versionPolicyLayer:%@, versionSUCore:%@", v4, v5, v6];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[SUCorePersistedState persistencePath](self, "persistencePath");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionPolicyLayer](self, "versionPolicyLayer");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState versionSUCore](self, "versionSUCore");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)[v3 initWithFormat:@"\n[>>>\n    persistencePath: %@\n versionPolicyLayer: %@\n      versionSUCore: %@\n     persistedState: %@\n<<<]", v4, v5, v6, v7];

  return v8;
}

- (void)_writePersistedState
{
  id v3 = (void *)MEMORY[0x1896079E8];
  -[SUCorePersistedState persistedState](self, "persistedState");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = 0LL;
  [v3 dataWithPropertyList:v4 format:200 options:0 error:&v19];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v19;

  if (v5)
  {
    -[SUCorePersistedState persistencePath](self, "persistencePath");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v6;
    char v8 = [v5 writeToFile:v7 options:268435457 error:&v18];
    id v9 = v18;

    if ((v8 & 1) != 0)
    {
      id v10 = (void *)MEMORY[0x189607898];
      -[SUCorePersistedState persistencePath](self, "persistencePath");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 fileHandleForUpdatingAtPath:v11];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        [v12 synchronizeFile];
        [v12 closeFile];
      }

      else
      {
        +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v14 = objc_alloc(NSString);
        uint64_t v15 = *__error();
        id v16 = __error();
        id v17 = (void *)objc_msgSend( v14,  "initWithFormat:",  @"failed to open persistence file: %d - message: %s",  v15,  strerror(*v16));
        [v13 trackError:@"[PERSISTED_STATE]" forReason:v17 withResult:8121 withError:0];
      }
    }

    else
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 trackError:@"[PERSISTED_STATE]" forReason:@"failed to write persistence file" withResult:8109 withError:v9];
    }

    id v6 = v9;
  }

  else
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackError:@"[PERSISTED_STATE]" forReason:@"failed to serialize persisted state to plist" withResult:8106 withError:v6];
  }
}

- (id)_createEmptyPersistedState
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setValue:@"SoftwareUpdateCorePersistedStateFile" forKey:@"SUCorePersistedStateContentsType"];
  -[SUCorePersistedState versionSUCore](self, "versionSUCore");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v4 forKey:@"SUCorePersistedStateCoreVersion"];

  -[SUCorePersistedState versionPolicyLayer](self, "versionPolicyLayer");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v5 forKey:@"SUCorePersistedStatePolicyVersion"];

  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v6 forKey:v7];

  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v8 forKey:v9];

  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 2LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v10 forKey:v11];

  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[SUCorePersistedState _keyNameForPersistedStateType:](self, "_keyNameForPersistedStateType:", 3LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValue:v12 forKey:v13];

  return v3;
}

- (id)_keyNameForPersistedStateType:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OS_dispatch_queue)persistedStateQueue
{
  return self->_persistedStateQueue;
}

- (NSString)persistencePath
{
  return self->_persistencePath;
}

- (void)setPersistencePath:(id)a3
{
}

- (NSString)versionPolicyLayer
{
  return self->_versionPolicyLayer;
}

- (void)setVersionPolicyLayer:(id)a3
{
}

- (BOOL)defaultLevelLogging
{
  return self->_defaultLevelLogging;
}

- (void)setDefaultLevelLogging:(BOOL)a3
{
  self->_defaultLevelLogging = a3;
}

- (NSMutableDictionary)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
}

- (NSString)versionSUCore
{
  return self->_versionSUCore;
}

- (void)setVersionSUCore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end