@interface FTPersistentContainer
- (FTPersistentContainer)initWithStoreType:(int64_t)a3;
- (NSManagedObjectContext)managedObjectContext;
- (TUUserConfiguration)userConfiguration;
- (void)loadPersistentStoresWithCompletionHandler:(id)a3;
@end

@implementation FTPersistentContainer

- (FTPersistentContainer)initWithStoreType:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___FTPersistentContainer;
  v4 = -[FTPersistentContainer initWithName:](&v22, "initWithName:", @"FaceTime");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TUUserConfiguration);
    userConfiguration = v4->_userConfiguration;
    v4->_userConfiguration = v5;

    if (a3 == 1)
    {
      uint64_t v18 = FTCServiceLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10000CA2C();
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription inMemoryPersistentStoreDescription]( &OBJC_CLASS___NSPersistentStoreDescription,  "inMemoryPersistentStoreDescription"));
    }

    else if (a3)
    {
      v11 = 0LL;
    }

    else
    {
      uint64_t v7 = FTCServiceLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10000CA00();
      }

      id v9 = FTGetUserDataStoreClassCFileURL();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v10));

      uint64_t v12 = FTCServiceLog();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10000C9D4();
      }

      [v11 setOption:NSFileProtectionCompleteUntilFirstUserAuthentication forKey:NSPersistentStoreFileProtectionKey];
      uint64_t v14 = FTCServiceLog();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10000C9A8();
      }

      [v11 setValue:@"1" forPragmaNamed:@"secure_delete"];
      uint64_t v16 = FTCServiceLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10000C97C();
      }

      [v11 setShouldMigrateStoreAutomatically:1];
    }

    v23 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    -[FTPersistentContainer setPersistentStoreDescriptions:](v4, "setPersistentStoreDescriptions:", v20);
  }

  return v4;
}

- (NSManagedObjectContext)managedObjectContext
{
  managedObjectContext = self->_managedObjectContext;
  if (!managedObjectContext)
  {
    v4 = (NSManagedObjectContext *)-[FTPersistentContainer newBackgroundContext](self, "newBackgroundContext");
    v5 = self->_managedObjectContext;
    self->_managedObjectContext = v4;

    managedObjectContext = self->_managedObjectContext;
  }

  return managedObjectContext;
}

- (void)loadPersistentStoresWithCompletionHandler:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1000023AC;
  v5[3] = &unk_1000143D0;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___FTPersistentContainer;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[FTPersistentContainer loadPersistentStoresWithCompletionHandler:]( &v4,  "loadPersistentStoresWithCompletionHandler:",  v5);
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void).cxx_destruct
{
}

@end