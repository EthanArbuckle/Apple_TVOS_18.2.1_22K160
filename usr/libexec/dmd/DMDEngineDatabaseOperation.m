@interface DMDEngineDatabaseOperation
- (BOOL)isAsynchronous;
- (DMDConfigurationDatabase)database;
- (DMDEngineDatabaseOperation)init;
- (OS_os_transaction)transaction;
- (void)dealloc;
- (void)main;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDEngineDatabaseOperation

- (void)dealloc
{
  v3 = self->_transaction;
  dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = nullsub_2;
  block[3] = &unk_10009E070;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, &_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDEngineDatabaseOperation;
  -[DMDEngineDatabaseOperation dealloc](&v6, "dealloc");
}

- (DMDEngineDatabaseOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DMDEngineDatabaseOperation;
  v2 = -[DMDEngineDatabaseOperation init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation description](v2, "description"));
    uint64_t v5 = os_transaction_create([v4 UTF8String]);
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;
  }

  return v3;
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)main
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));

  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"DMDEngineDatabaseOperation.m", 42, @"A database must be provided to %@", self object file lineNumber description];
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  id v6 = [v5 newBackgroundContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000318A0;
  v9[3] = &unk_10009D820;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler", a3));
  uint64_t v5 = (objc_class *)objc_opt_class(self);
  id v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v10 handleFailureInMethod:a2, self, @"DMDEngineDatabaseOperation.m", 50, @"%@ must override %@", v7, v9 object file lineNumber description];
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end