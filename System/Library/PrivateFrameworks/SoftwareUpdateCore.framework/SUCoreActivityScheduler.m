@interface SUCoreActivityScheduler
+ (id)sharedInstance;
- (SUCoreActivityScheduler)initWithPersistedStatePath:(id)a3;
- (id)_contextStoreRegisteredActivities;
- (id)_copyRegisteredActivities;
- (id)_queue_registrationForActivity:(id)a3;
- (id)sharedMemoryStore;
- (void)_loadPersistedRegistrationMap;
- (void)_queue_addRegistration:(id)a3 forActivity:(id)a4;
- (void)_queue_persistRegistrationMap;
- (void)_queue_removeRegistrationForActivity:(id)a3;
- (void)_registerRegistration:(id)a3 forActivity:(id)a4;
- (void)_unregisterAllActivitiesWithName:(id)a3;
- (void)_unregisterRegistrationForActivity:(id)a3;
- (void)scheduleActivity:(id)a3 withHandler:(id)a4;
@end

@implementation SUCoreActivityScheduler

- (SUCoreActivityScheduler)initWithPersistedStatePath:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SUCoreActivityScheduler;
  v5 = -[SUCoreActivityScheduler init](&v34, sel_init);
  if (!v5) {
    goto LABEL_19;
  }
  if (!objc_opt_class() || !objc_opt_class())
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 oslog];
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SUCoreActivityScheduler initWithPersistedStatePath:].cold.1();
    }

    v15 = v5;
    v5 = 0LL;
    goto LABEL_15;
  }

  uint64_t v6 = [MEMORY[0x18960DAE0] userContext];
  context = v5->_context;
  v5->_context = (_CDContext *)v6;

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  activityArray = v5->_activityArray;
  v5->_activityArray = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  registrationArray = v5->_registrationArray;
  v5->_registrationArray = v10;

  dispatch_queue_t v12 = dispatch_queue_create("com.apple.softwareupdatecore.activityscheduler", 0LL);
  stateQueue = v5->_stateQueue;
  v5->_stateQueue = (OS_dispatch_queue *)v12;

  if (v4)
  {
    [v4 URLByDeletingLastPathComponent];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 path];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896078A8] defaultManager];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    char v17 = [v16 fileExistsAtPath:v15];

    if ((v17 & 1) == 0)
    {
      [MEMORY[0x1896078A8] defaultManager];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v33 = 0LL;
      [v18 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v33];
      id v19 = v33;

      if (v19)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 oslog];
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          [v4 path];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          id v36 = v22;
          __int16 v37 = 2114;
          id v38 = v19;
          _os_log_impl( &dword_187A54000,  v21,  OS_LOG_TYPE_DEFAULT,  "Error creating persisted state file %{public}@: %{public}@",  buf,  0x16u);
        }
      }
    }

    id v23 = objc_alloc(MEMORY[0x1896127B0]);
    v24 = v5->_stateQueue;
    [v4 path];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v23 initWithDispatchQueue:v24 withPersistencePath:v25 forPolicyVersion:@"1.0"];
    persistedState = v5->_persistedState;
    v5->_persistedState = (SUCorePersistedState *)v26;

    -[SUCoreActivityScheduler _loadPersistedRegistrationMap](v5, "_loadPersistedRegistrationMap");
LABEL_15:
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 oslog];
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v4;
    _os_log_impl( &dword_187A54000,  v31,  OS_LOG_TYPE_DEFAULT,  "Created SUCoreActivityScheduler with persisted state path: %{public}@",  buf,  0xCu);
  }

LABEL_19:
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  return (id)sharedInstance___instance;
}

void __41__SUCoreActivityScheduler_sharedInstance__block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    [v1 componentsSeparatedByString:@"."];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 lastObject];
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3
      || (id v4 = (id)[objc_alloc(NSString) initWithFormat:@"%@%@.state", @"/var/mobile/Library/SoftwareUpdateCore/", v3]) == 0)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __41__SUCoreActivityScheduler_sharedInstance__block_invoke_cold_1();
      }

      id v4 = v1;
    }

    goto LABEL_13;
  }

  [MEMORY[0x1896077F8] mainBundle];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 executablePath];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_12:
    id v4 = (id)[objc_alloc(NSString) initWithFormat:@"%@%@", @"/var/mobile/Library/SoftwareUpdateCore/", @"SUCoreActivitySchedulerDefaultSharedState.state"];
    [MEMORY[0x189612778] sharedDiag];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"Failed to create a file path from bundleIdentifier, falling back to the default of %@", v4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 trackAnomaly:@"SUCoreActivityScheduler" forReason:v11 withResult:8116 withError:0];

LABEL_13:
    goto LABEL_14;
  }

  [v8 componentsSeparatedByString:@"/"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 lastObject];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {

    goto LABEL_12;
  }

  id v4 = (id)[objc_alloc(NSString) initWithFormat:@"%@%@.state", @"/var/mobile/Library/SoftwareUpdateCore/", v10];

  if (!v4) {
    goto LABEL_12;
  }
LABEL_14:
  [MEMORY[0x189604030] fileURLWithPath:v4];
  dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SUCoreActivityScheduler initWithPersistedStatePath:]( objc_alloc(&OBJC_CLASS___SUCoreActivityScheduler),  "initWithPersistedStatePath:",  v12);
  v14 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v13;
}

- (void)_queue_addRegistration:(id)a3 forActivity:(id)a4
{
  stateQueue = self->_stateQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)stateQueue);
  -[NSMutableArray addObject:](self->_activityArray, "addObject:", v7);

  -[NSMutableArray addObject:](self->_registrationArray, "addObject:", v8);
}

- (void)_queue_removeRegistrationForActivity:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  unint64_t v4 = -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v5);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && -[NSMutableArray count](self->_registrationArray, "count") > v4)
  {
    -[NSMutableArray removeObjectAtIndex:]( self->_registrationArray,  "removeObjectAtIndex:",  -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v5));
    -[NSMutableArray removeObject:](self->_activityArray, "removeObject:", v5);
  }
}

- (id)_queue_registrationForActivity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || -[NSMutableArray count](self->_registrationArray, "count") <= v5)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[NSMutableArray objectAtIndex:]( self->_registrationArray,  "objectAtIndex:",  -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v4));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_registerRegistration:(id)a3 forActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__SUCoreActivityScheduler__registerRegistration_forActivity___block_invoke;
  block[3] = &unk_18A0F03C8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __61__SUCoreActivityScheduler__registerRegistration_forActivity___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "registerCallback:");
    objc_msgSend(*(id *)(a1 + 40), "_queue_addRegistration:forActivity:", *(void *)(a1 + 32), *(void *)(a1 + 48));
  }

  return objc_msgSend(*(id *)(a1 + 40), "_queue_persistRegistrationMap");
}

- (void)_unregisterRegistrationForActivity:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__SUCoreActivityScheduler__unregisterRegistrationForActivity___block_invoke;
  v7[3] = &unk_18A0F0510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)stateQueue, v7);
}

void __62__SUCoreActivityScheduler__unregisterRegistrationForActivity___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 8) deregisterCallback:v2];
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForActivity:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_persistRegistrationMap");
}

- (void)_unregisterAllActivitiesWithName:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __60__SUCoreActivityScheduler__unregisterAllActivitiesWithName___block_invoke;
  v7[3] = &unk_18A0F0510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)stateQueue, v7);
}

void __60__SUCoreActivityScheduler__unregisterAllActivitiesWithName___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v8 activityName];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

        if (v10) {
          [v2 addObject:v8];
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v5);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "_queue_registrationForActivity:", v16, (void)v18);
        char v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17) {
          [*(id *)(*(void *)(a1 + 32) + 8) deregisterCallback:v17];
        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForActivity:", v16);
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_persistRegistrationMap");
}

- (id)_copyRegisteredActivities
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = __Block_byref_object_copy__2;
  id v11 = __Block_byref_object_dispose__2;
  id v12 = 0LL;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __52__SUCoreActivityScheduler__copyRegisteredActivities__block_invoke;
  v6[3] = &unk_18A0EF998;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__SUCoreActivityScheduler__copyRegisteredActivities__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_queue_persistRegistrationMap
{
  uint64_t v2 = self;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v26 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  obuint64_t j = v2->_activityArray;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v32;
    unint64_t v7 = 0x189607000uLL;
    *(void *)&__int128 v4 = 138543618LL;
    __int128 v24 = v4;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        -[SUCoreActivityScheduler _queue_registrationForActivity:](v2, "_queue_registrationForActivity:", v9, v24);
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          id v11 = *(void **)(v7 + 2296);
          id v30 = 0LL;
          uint64_t v12 = [v11 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v30];
          id v13 = v30;
          uint64_t v28 = (void *)v12;
          if (v13)
          {
            [MEMORY[0x1896127A0] sharedLogger];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 oslog];
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              id v36 = v10;
              __int16 v37 = 2114;
              id v38 = v13;
              _os_log_error_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_ERROR,  "Error archiving registration:%{public}@ error:%{public}@",  buf,  0x16u);
            }
          }

          else
          {
            [v26 addObject:v12];
          }

          char v17 = *(void **)(v7 + 2296);
          id v29 = v13;
          [v17 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v29];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v29;

          if (v16)
          {
            uint64_t v19 = v5;
            uint64_t v20 = v6;
            __int128 v21 = v2;
            [MEMORY[0x1896127A0] sharedLogger];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 oslog];
            __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              id v36 = v9;
              __int16 v37 = 2114;
              id v38 = v16;
              _os_log_error_impl( &dword_187A54000,  v23,  OS_LOG_TYPE_ERROR,  "Error archiving activity:%{public}@ error:%{public}@",  buf,  0x16u);
            }

            uint64_t v2 = v21;
            uint64_t v6 = v20;
            uint64_t v5 = v19;
            unint64_t v7 = 0x189607000LL;
          }

          else
          {
            [v25 addObject:v18];
          }
        }

        else
        {
          id v16 = 0LL;
        }
      }

      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
    }

    while (v5);
  }

  -[SUCorePersistedState persistObject:forKey:]( v2->_persistedState,  "persistObject:forKey:",  v26,  @"RegistrationKey");
  -[SUCorePersistedState persistObject:forKey:](v2->_persistedState, "persistObject:forKey:", v25, @"ActivityKey");
}

- (void)_loadPersistedRegistrationMap
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke;
  block[3] = &unk_18A0EF970;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke(uint64_t a1)
{
  v68[4] = *MEMORY[0x1895F89C0];
  if ([*(id *)(*(void *)(a1 + 32) + 40) loadPersistedState])
  {
    [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"RegistrationKey" ofClass:objc_opt_class()];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:@"ActivityKey" ofClass:objc_opt_class()];
    __int128 v4 = (void *)v3;
    if (v2) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      if ([v2 count])
      {
        uint64_t v7 = [v2 count];
        if (v7 == [v4 count])
        {
          [*(id *)(a1 + 32) _contextStoreRegisteredActivities];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v4 count])
          {
            uint64_t v58 = a1;
            uint64_t v9 = 0LL;
            unint64_t v10 = 0x189607000uLL;
            *(void *)&__int128 v8 = 134217984LL;
            __int128 v57 = v8;
            v59 = v4;
            v60 = v2;
            while (1)
            {
              objc_msgSend(v4, "objectAtIndex:", v9, v57);
              id v11 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v12 = [v2 objectAtIndex:v9];
              id v13 = (void *)v12;
              if (v12)
              {
                if (v11) {
                  break;
                }
              }

              if (!v12)
              {
                [MEMORY[0x1896127A0] sharedLogger];
                __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
                [v31 oslog];
                __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v65 = v9;
                  _os_log_error_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_ERROR,  "No registrationData found at index: %lu",  buf,  0xCu);
                }

                if (v11) {
                  goto LABEL_40;
                }
LABEL_37:
                [MEMORY[0x1896127A0] sharedLogger];
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
                [v33 oslog];
                id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v65 = v9;
                  _os_log_error_impl( &dword_187A54000,  v26,  OS_LOG_TYPE_ERROR,  "No activityData found at index: %lu",  buf,  0xCu);
                }

- (id)sharedMemoryStore
{
  if (sharedMemoryStore_once != -1) {
    dispatch_once(&sharedMemoryStore_once, &__block_literal_global_44);
  }
  return (id)sharedMemoryStore_sharedMemoryStore;
}

void __44__SUCoreActivityScheduler_sharedMemoryStore__block_invoke()
{
  uint64_t v0 = [MEMORY[0x18960DAD8] keyValueStoreWithName:@"com.apple.contextstored" size:0];
  v1 = (void *)sharedMemoryStore_sharedMemoryStore;
  sharedMemoryStore_sharedMemoryStore = v0;
}

- (id)_contextStoreRegisteredActivities
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x18960DB00] persistenceWithDirectory:v3];
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (void *)MEMORY[0x18960DB10];
  -[SUCoreActivityScheduler sharedMemoryStore](self, "sharedMemoryStore");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 persistenceWithSharedMemoryKeyValueStore:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x18960DB08] persistenceWithPersistenceSurvivingReboot:v4 persistenceSurvivingRelaunch:v7];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 loadRegistrations];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)scheduleActivity:(id)a3 withHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  context = self->_context;
  [v6 createContextualPredicate];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(context) = -[_CDContext evaluatePredicate:](context, "evaluatePredicate:", v9);

  if (!(_DWORD)context)
  {
    [v6 createRegistrationWithHandler:v7];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127A0] sharedLogger];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v6;
        _os_log_impl(&dword_187A54000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling activity = %{public}@", buf, 0xCu);
      }

      -[SUCoreActivityScheduler _registerRegistration:forActivity:](self, "_registerRegistration:forActivity:", v12, v6);
    }

    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SUCoreActivityScheduler scheduleActivity:withHandler:].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    goto LABEL_13;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v6;
    _os_log_impl(&dword_187A54000, v11, OS_LOG_TYPE_DEFAULT, "Conditions met for activity: %{public}@", buf, 0xCu);
  }

  if (v7)
  {
    [v6 activityName];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID", @"UUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = @"WasScheduled";
    v25[0] = v13;
    [MEMORY[0x189607968] numberWithBool:0];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12, v15);

LABEL_13:
  }
}

- (void).cxx_destruct
{
}

- (void)initWithPersistedStatePath:.cold.1()
{
}

void __41__SUCoreActivityScheduler_sharedInstance__block_invoke_cold_1()
{
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_1()
{
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_2( void *a1,  void *a2,  os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_error_impl( &dword_187A54000,  a3,  OS_LOG_TYPE_ERROR,  "persistedRegistrationArray(%lu) and persistedActivitiesArray(%lu) have differing counts",  (uint8_t *)&v5,  0x16u);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_4( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_5()
{
}

- (void)scheduleActivity:(uint64_t)a3 withHandler:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end