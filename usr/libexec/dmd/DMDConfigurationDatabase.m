@interface DMDConfigurationDatabase
+ (id)_newDatabaseWithURL:(id)a3;
+ (id)descriptionForSQLiteStoreWithDatabaseURL:(id)a3;
+ (id)managedObjectModel;
+ (id)newUserDatabase;
- (DMDConfigurationDatabase)init;
- (id)description;
- (void)performBackgroundTask:(id)a3;
@end

@implementation DMDConfigurationDatabase

+ (id)managedObjectModel
{
  if (qword_1000CCCA0 != -1) {
    dispatch_once(&qword_1000CCCA0, &stru_10009E2A0);
  }
  return (id)qword_1000CCC98;
}

- (id)description
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_100021BC0;
  v12 = sub_100021BD0;
  id v13 = 0LL;
  id v3 = -[DMDConfigurationDatabase newBackgroundContext](self, "newBackgroundContext");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021BD8;
  v7[3] = &unk_10009E2C8;
  v7[4] = &v8;
  [v3 performBlockAndWait:v7];

  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p\n%@>",  v4,  self,  v9[5]));
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)descriptionForSQLiteStoreWithDatabaseURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSPersistentStoreDescription);
  -[NSPersistentStoreDescription setType:](v4, "setType:", NSSQLiteStoreType);
  -[NSPersistentStoreDescription setURL:](v4, "setURL:", v3);

  return v4;
}

+ (id)newUserDatabase
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileManager dmd_userConfigurationDatabaseURL]( &OBJC_CLASS___NSFileManager,  "dmd_userConfigurationDatabaseURL"));
  id v4 = [a1 _newDatabaseWithURL:v3];

  return v4;
}

+ (id)_newDatabaseWithURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___DMDConfigurationDatabase);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 descriptionForSQLiteStoreWithDatabaseURL:v4]);

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[DMDConfigurationDatabase setPersistentStoreDescriptions:](v5, "setPersistentStoreDescriptions:", v7);

  return v5;
}

- (DMDConfigurationDatabase)init
{
  id v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [(id)objc_opt_class(self) managedObjectModel];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = -[DMDConfigurationDatabase initWithName:managedObjectModel:](self, "initWithName:managedObjectModel:", v5, v7);

  return v8;
}

- (void)performBackgroundTask:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"DMDConfigurationDatabase.m", 67, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }

  v9[1] = 3221225472LL;
  v9[2] = sub_100021EFC;
  v9[3] = &unk_10009E2F0;
  id v10 = v5;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDConfigurationDatabase;
  v9[0] = _NSConcreteStackBlock;
  id v6 = v5;
  -[DMDConfigurationDatabase performBackgroundTask:](&v8, "performBackgroundTask:", v9);
}

@end