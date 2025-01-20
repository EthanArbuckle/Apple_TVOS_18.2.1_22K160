@interface InAppPromotionDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation InAppPromotionDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc_init(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
  -[SQLiteDatabaseStoreDescriptor setSchemaName:](v2, "setSchemaName:", @"storekit_promotions");
  -[SQLiteDatabaseStoreDescriptor setSessionClass:]( v2,  "setSessionClass:",  objc_opt_class(&OBJC_CLASS___InAppPromotionDatabaseSession));
  -[SQLiteDatabaseStoreDescriptor setTransactionClass:]( v2,  "setTransactionClass:",  objc_opt_class(&OBJC_CLASS___InAppPromotionDatabaseTransaction));
  return v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v3 = a3;
  if ((uint64_t)[v3 currentSchemaVersion] > 14499)
  {
LABEL_9:
    BOOL v5 = 1;
    goto LABEL_15;
  }

  while (1)
  {
    id v4 = [v3 currentSchemaVersion];
    if (v4 == (id)14500) {
      goto LABEL_8;
    }
    if (v4 != (id)14000) {
      break;
    }
LABEL_8:
  }

  if (!v4)
  {
    goto LABEL_8;
  }

  if (qword_10032E9B8 != -1) {
    dispatch_once(&qword_10032E9B8, &stru_1002E9448);
  }
  v6 = (void *)qword_10032E9A0;
  if (os_log_type_enabled((os_log_t)qword_10032E9A0, OS_LOG_TYPE_ERROR)) {
    sub_1002622FC(v6, v3);
  }
LABEL_14:
  BOOL v5 = 0;
LABEL_15:

  return v5;
}

@end