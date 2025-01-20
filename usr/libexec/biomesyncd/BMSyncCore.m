@interface BMSyncCore
+ (void)resetEagerExitTimer;
- (BMCloudKitSyncEngine)cloudKitSyncEngine;
- (BMDistributedSyncMultiStreamManager)primaryUserSyncStreamManager;
- (BMRapportSyncEngine)rapportSyncEngine;
- (BMSyncCore)initWithQueue:(id)a3;
- (BMSyncDatabase)primaryDatabase;
- (BMSyncScheduler)syncScheduler;
- (BOOL)shouldCacheConnectionToMachService:(unint64_t)a3 domain:(unint64_t)a4 useCase:(id)a5;
- (BOOL)start;
- (unint64_t)state;
- (void)setCloudKitSyncEngine:(id)a3;
- (void)setPrimaryDatabase:(id)a3;
- (void)setPrimaryUserSyncStreamManager:(id)a3;
- (void)setRapportSyncEngine:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSyncScheduler:(id)a3;
@end

@implementation BMSyncCore

+ (void)resetEagerExitTimer
{
  if (qword_10007C2F8 != -1) {
    dispatch_once(&qword_10007C2F8, &stru_100068D18);
  }
  v2 = (dispatch_source_s *)qword_10007C2F0;
  dispatch_time_t v3 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (BMSyncCore)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BMSyncCore;
  v6 = -[BMSyncCore init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)start
{
  if (self->_state == 2) {
    return 1;
  }
  +[BMAccessConnectionFactory setDelegate:](&OBJC_CLASS___BMAccessConnectionFactory, "setDelegate:", self);
  id v4 = objc_alloc(&OBJC_CLASS___BMAccessClient);
  id v5 = [v4 initWithUseCase:BMUseCaseSync];
  id v6 = objc_alloc(&OBJC_CLASS___BMResourceSpecifier);
  id v7 = [v6 initWithType:5 name:BMSyncResource];
  id v66 = 0LL;
  v8 = (BMAccessAssertion *)objc_claimAutoreleasedReturnValue([v5 requestAccessToResource:v7 mode:3 error:&v66]);
  id v9 = v66;
  accessAssertion = self->_accessAssertion;
  self->_accessAssertion = v8;

  if (self->_accessAssertion)
  {
    id v11 = objc_alloc(&OBJC_CLASS___BMResourceSpecifier);
    id v12 = [v11 initWithType:5 name:BMSharedSyncResource];
    id v65 = v9;
    v13 = (BMAccessAssertion *)objc_claimAutoreleasedReturnValue([v5 requestAccessToResource:v12 mode:3 error:&v65]);
    id v14 = v65;

    sharedSyncAccessAssertion = self->_sharedSyncAccessAssertion;
    self->_sharedSyncAccessAssertion = v13;

    if (self->_sharedSyncAccessAssertion)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDatabase createPrimaryDatabaseWithQueue:]( &OBJC_CLASS___BMSyncDatabase,  "createPrimaryDatabaseWithQueue:",  self->_queue));
      if ([v16 open])
      {
        id v64 = 0LL;
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[BMSharedSyncUtilities sharedSyncGenerationWithError:]( &OBJC_CLASS___BMSharedSyncUtilities,  "sharedSyncGenerationWithError:",  &v64));
        id v18 = v64;
        if (v17)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue([v16 sharedSyncGeneration]);
          id v56 = v18;
          v57 = v17;
          if (([v58 isEqual:v17] & 1) == 0)
          {
            id v55 = v14;
            uint64_t v19 = __biome_log_for_category(0LL);
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v69 = v58;
              __int16 v70 = 2112;
              v71 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Shared sync generation changed %@ -> %@",  buf,  0x16u);
            }

            v54 = v16;
            v21 = -[BMSyncDevicePeerStatusTracker initWithDatabase:]( objc_alloc(&OBJC_CLASS___BMSyncDevicePeerStatusTracker),  "initWithDatabase:",  v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDevicePeerStatusTracker localDeviceIdentifierCreatingIfNecessary]( v21,  "localDeviceIdentifierCreatingIfNecessary"));
            id v23 = objc_alloc(&OBJC_CLASS___BMAccountManager);
            __int128 v60 = 0u;
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            id v53 = [v23 initWithUseCase:BMUseCaseNotApplicable];
            id obj = (id)objc_claimAutoreleasedReturnValue([v53 accounts]);
            id v24 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v61;
              v52 = v21;
              while (2)
              {
                for (i = 0LL; i != v25; i = (char *)i + 1)
                {
                  if (*(void *)v61 != v26) {
                    objc_enumerationMutation(obj);
                  }
                  v28 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
                  v29 = (void *)objc_claimAutoreleasedReturnValue( +[BMSyncDatabase createDatabaseForAccount:queue:]( &OBJC_CLASS___BMSyncDatabase,  "createDatabaseForAccount:queue:",  v28,  self->_queue,  v52));
                  if (([v29 open] & 1) == 0)
                  {
                    uint64_t v49 = __biome_log_for_category(11LL);
                    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                      sub_1000409D8(v28, v50);
                    }

LABEL_34:
                    self->_state = 1LL;

                    BOOL v3 = 0;
                    v16 = v54;
                    id v14 = v55;
                    goto LABEL_35;
                  }

                  unsigned int v30 = [v29 deleteAllSiteIdentifiersExcept:v22];
                  [v29 close];
                  if (!v30) {
                    goto LABEL_34;
                  }
                }

                id v25 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
                v17 = v57;
                v21 = v52;
                if (v25) {
                  continue;
                }
                break;
              }
            }

            v16 = v54;
            [v54 setSharedSyncGeneration:v17];

            id v14 = v55;
          }

          objc_storeStrong((id *)&self->_primaryDatabase, v16);
          v31 = (BMDistributedSyncMultiStreamManager *)objc_claimAutoreleasedReturnValue( +[BMDistributedSyncMultiStreamManager multiStreamManagerWithPrimaryDatabase:account:queue:]( &OBJC_CLASS___BMDistributedSyncMultiStreamManager,  "multiStreamManagerWithPrimaryDatabase:account:queue:",  self->_primaryDatabase,  0LL,  self->_queue));
          primaryUserSyncStreamManager = self->_primaryUserSyncStreamManager;
          self->_primaryUserSyncStreamManager = v31;

          v33 = -[BMRapportSyncEngine initWithQueue:primarySyncManager:primaryDatabase:]( objc_alloc(&OBJC_CLASS___BMRapportSyncEngine),  "initWithQueue:primarySyncManager:primaryDatabase:",  self->_queue,  self->_primaryUserSyncStreamManager,  self->_primaryDatabase);
          rapportSyncEngine = self->_rapportSyncEngine;
          self->_rapportSyncEngine = v33;

          v35 = -[BMCloudKitSyncEngine initWithQueue:multiStreamManager:database:]( objc_alloc(&OBJC_CLASS___BMCloudKitSyncEngine),  "initWithQueue:multiStreamManager:database:",  self->_queue,  self->_primaryUserSyncStreamManager,  self->_primaryDatabase);
          cloudKitSyncEngine = self->_cloudKitSyncEngine;
          self->_cloudKitSyncEngine = v35;

          v37 = objc_alloc(&OBJC_CLASS___BMSyncScheduler);
          v38 = self->_rapportSyncEngine;
          v39 = self->_cloudKitSyncEngine;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportSyncEngine peerStatusTracker](v38, "peerStatusTracker"));
          v41 = -[BMSyncScheduler initWithRapportSyncEngine:cloudKitSyncEngine:peerStatusTracker:database:queue:]( v37,  "initWithRapportSyncEngine:cloudKitSyncEngine:peerStatusTracker:database:queue:",  v38,  v39,  v40,  self->_primaryDatabase,  self->_queue);
          syncScheduler = self->_syncScheduler;
          self->_syncScheduler = v41;

          self->_state = 2LL;
          +[BMSyncCore resetEagerExitTimer](&OBJC_CLASS___BMSyncCore, "resetEagerExitTimer");
          BOOL v3 = 1;
LABEL_35:

          id v18 = v56;
          v17 = v57;
        }

        else
        {
          uint64_t v47 = __biome_log_for_category(0LL);
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
            sub_10004096C();
          }

          BOOL v3 = 0;
          self->_state = 1LL;
        }
      }

      else
      {
        BOOL v3 = 0;
        self->_state = 1LL;
      }
    }

    else
    {
      uint64_t v45 = __biome_log_for_category(11LL);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_100040908();
      }

      BOOL v3 = 0;
      self->_state = 1LL;
    }

    id v9 = v14;
  }

  else
  {
    uint64_t v43 = __biome_log_for_category(11LL);
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_1000408A4();
    }

    BOOL v3 = 0;
    self->_state = 1LL;
  }

  return v3;
}

- (BOOL)shouldCacheConnectionToMachService:(unint64_t)a3 domain:(unint64_t)a4 useCase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  unsigned __int8 v9 = 0;
  if (a3 == 1 && !a4)
  {
    if (([v7 isEqual:BMUseCaseSync] & 1) != 0
      || ([v8 isEqual:BMUseCaseWriter] & 1) != 0)
    {
      unsigned __int8 v9 = 1;
    }

    else
    {
      unsigned __int8 v9 = [v8 isEqual:BMUseCasePruner];
    }
  }

  return v9;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BMSyncDatabase)primaryDatabase
{
  return self->_primaryDatabase;
}

- (void)setPrimaryDatabase:(id)a3
{
}

- (BMDistributedSyncMultiStreamManager)primaryUserSyncStreamManager
{
  return self->_primaryUserSyncStreamManager;
}

- (void)setPrimaryUserSyncStreamManager:(id)a3
{
}

- (BMRapportSyncEngine)rapportSyncEngine
{
  return self->_rapportSyncEngine;
}

- (void)setRapportSyncEngine:(id)a3
{
}

- (BMCloudKitSyncEngine)cloudKitSyncEngine
{
  return self->_cloudKitSyncEngine;
}

- (void)setCloudKitSyncEngine:(id)a3
{
}

- (BMSyncScheduler)syncScheduler
{
  return self->_syncScheduler;
}

- (void)setSyncScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end