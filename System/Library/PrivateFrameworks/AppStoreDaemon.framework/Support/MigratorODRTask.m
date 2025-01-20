@interface MigratorODRTask
- (MigratorODRTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorODRTask

- (MigratorODRTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorODRTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"ODR");
}

- (id)migratorType
{
  return @"ODR";
}

- (void)main
{
  id v3 = sub_1002FE4E0((uint64_t)&OBJC_CLASS___ODRServiceDelegate);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)v4;
  if (v4) {
    v6 = *(void **)(v4 + 24);
  }
  else {
    v6 = 0LL;
  }
  id v7 = v6;

  v8 = sub_1002283B8((id *)objc_alloc(&OBJC_CLASS___SQLiteTransporter), v7);
  v9 = objc_alloc(&OBJC_CLASS___ODRDatabaseStore);
  id v10 = sub_100185934((uint64_t)&OBJC_CLASS___Environment);
  v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_1001859DC(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[SQLiteDatabaseStore initWithDatabase:](v9, "initWithDatabase:", v13);

  if (sub_10022842C((uint64_t)v8))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100292118;
    v29[3] = &unk_1003F00A0;
    v29[4] = self;
    v30 = v14;
    sub_100228950((uint64_t)v8, v29);
  }

  else
  {
    uint64_t v15 = ASDLogHandleForCategory(17LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Unable to begin legacy database tranportation",  (uint8_t *)&buf,  2u);
    }
  }

  sub_1002287AC((uint64_t)v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByReplacingOccurrencesOfString:@"/odr.sqlite" withString:&stru_1003F3E40]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v18 fileExistsAtPath:v17])
  {
    id v28 = 0LL;
    unsigned __int8 v19 = [v18 removeItemAtPath:v17 error:&v28];
    id v20 = v28;
    if ((v19 & 1) == 0)
    {
      uint64_t v21 = ASDLogHandleForCategory(17LL);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "The legacy database directory failed to be removed with error: %{public}@",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

  id v23 = sub_100185E88((uint64_t)&OBJC_CLASS___ODRBackgroundMaintenance);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  sub_100186078((uint64_t)v24);

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100292994;
  v34 = sub_1002929A4;
  v35 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v25 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1002929AC;
  v27[3] = &unk_1003E9BB8;
  v27[4] = &buf;
  [v26 readUsingSession:v27];

  [*(id *)(*((void *)&buf + 1) + 40) enumerateKeysAndObjectsUsingBlock:&stru_1003F00E0];
  _Block_object_dispose(&buf, 8);
}

@end