@interface StoreKitMessagesDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation StoreKitMessagesDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc_init(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  -[SQLiteDatabaseStoreDescriptor setSchemaName:](v2, "setSchemaName:", @"storekit_messages");
  -[SQLiteDatabaseStoreDescriptor setSessionClass:]( v2,  "setSessionClass:",  objc_opt_class(&OBJC_CLASS___StoreKitMessagesDatabaseSession));
  -[SQLiteDatabaseStoreDescriptor setTransactionClass:]( v2,  "setTransactionClass:",  objc_opt_class(&OBJC_CLASS___StoreKitMessagesDatabaseTransaction));
  return v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 currentSchemaVersion] > 15999)
  {
LABEL_2:
    BOOL v6 = 1;
    goto LABEL_46;
  }

  *(void *)&__int128 v5 = 138544130LL;
  __int128 v27 = v5;
  while (1)
  {
    uint64_t v7 = (uint64_t)objc_msgSend(v4, "currentSchemaVersion", v27, *(_OWORD *)buf, *(void *)&buf[16], v29, v30);
    if (v7 <= 15199)
    {
      if (v7)
      {
        if (v7 != 13400)
        {
          if (v7 != 14000) {
            goto LABEL_41;
          }
          unsigned int v8 = [v4 migrateToVersion:15200 usingBlock:&stru_1002E8268];
          if (qword_10032E2F0 != -1) {
            dispatch_once(&qword_10032E2F0, &stru_1002E82F0);
          }
          v9 = (void *)qword_10032E2B0;
          if (!os_log_type_enabled((os_log_t)qword_10032E2B0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_32;
          }
          v10 = v9;
          id v11 = [v4 currentSchemaVersion];
          *(_DWORD *)buf = v27;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v29 = 15200LL;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v8;
          v12 = v10;
          v13 = "[%{public}@]: Messages database migration function for %li => %li success=%d";
          goto LABEL_31;
        }

        unsigned int v8 = [v4 migrateToVersion:14000 usingBlock:&stru_1002E8248];
        if (qword_10032E2F0 != -1) {
          dispatch_once(&qword_10032E2F0, &stru_1002E82F0);
        }
        v16 = (void *)qword_10032E2B0;
        if (os_log_type_enabled((os_log_t)qword_10032E2B0, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v16;
          id v17 = [v4 currentSchemaVersion];
          *(_DWORD *)buf = v27;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v29 = 14000LL;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v8;
          v12 = v10;
          v13 = "[%{public}@]: Messages database migration function for %li => %li success=%d";
          goto LABEL_31;
        }
      }

      else
      {
        unsigned int v8 = [v4 migrateToVersion:16000 usingBlock:&stru_1002E8228];
        if (qword_10032E2F0 != -1) {
          dispatch_once(&qword_10032E2F0, &stru_1002E82F0);
        }
        v14 = (void *)qword_10032E2B0;
        if (os_log_type_enabled((os_log_t)qword_10032E2B0, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v14;
          id v15 = [v4 currentSchemaVersion];
          *(_DWORD *)buf = v27;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v29 = 16000LL;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v8;
          v12 = v10;
          v13 = "[%{public}@]: Messages database migration function for %li => %li success=%d";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x26u);
        }
      }

@end