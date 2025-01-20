@interface SQLiteDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (SQLiteDatabase)database;
- (SQLiteDatabaseStore)initWithDatabase:(id)a3;
- (void)modifyUsingTransaction:(id)a3;
- (void)modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4;
- (void)readUsingSession:(id)a3;
@end

@implementation SQLiteDatabaseStore

- (SQLiteDatabaseStore)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SQLiteDatabaseStore;
  v6 = -[SQLiteDatabaseStore init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  return objc_alloc_init(&OBJC_CLASS___SQLiteDatabaseStoreDescriptor);
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  return 1;
}

- (void)modifyUsingTransaction:(id)a3
{
}

- (void)modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4
{
}

- (void)readUsingSession:(id)a3
{
}

- (SQLiteDatabase)database
{
  return (SQLiteDatabase *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end