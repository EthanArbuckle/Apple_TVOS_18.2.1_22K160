@interface ACAccountsObsolescenceMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
- (void)removeObsoleteAccountsFromStore:(id)a3;
@end

@implementation ACAccountsObsolescenceMigrator

- (id)dataClassName
{
  return @"ACAccountsObsolescenceMigrator";
}

- (BOOL)performMigration
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___ACAccountStore, a2);
  -[ACAccountsObsolescenceMigrator removeObsoleteAccountsFromStore:](self, "removeObsoleteAccountsFromStore:", v3);

  return 1;
}

- (void)removeObsoleteAccountsFromStore:(id)a3
{
  id v3 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3D78;
  v5[3] = &unk_4068;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  v4 = v6;
  [v3 removeObsoleteAccounts:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  return 1.0;
}

@end