@interface RMMigrationSupervised
- (BOOL)_changeDeviceEnrollmentTypeReturningError:(id *)a3;
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
- (id)_context;
@end

@implementation RMMigrationSupervised

- (NSString)identifier
{
  return (NSString *)@"RMMigrationSupervised";
}

- (BOOL)executeReturningError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagedDevice currentManagedDevice](&OBJC_CLASS___RMManagedDevice, "currentManagedDevice"));
  unsigned int v6 = [v5 isSupervised];

  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog migrationSupervised](&OBJC_CLASS___RMLog, "migrationSupervised"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking migration - is supervised", buf, 2u);
    }

    return -[RMMigrationSupervised _changeDeviceEnrollmentTypeReturningError:]( self,  "_changeDeviceEnrollmentTypeReturningError:",  a3);
  }

  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring migration - not supervised", v10, 2u);
    }

    return 1;
  }

- (BOOL)_changeDeviceEnrollmentTypeReturningError:(id *)a3
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10004B748;
  v15 = sub_10004B758;
  id v16 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004B760;
  v8[3] = &unk_1000BA358;
  v10 = &v11;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RMMigrationSupervised _context](self, "_context"));
  id v9 = v4;
  [v4 performBlockAndWait:v8];
  if (a3)
  {
    v5 = (void *)v12[5];
    if (v5) {
      *a3 = v5;
    }
  }

  BOOL v6 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_context
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RMPersistentController sharedController](&OBJC_CLASS___RMPersistentController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 persistentContainer]);

  id v4 = [v3 newBackgroundContext];
  return v4;
}

@end