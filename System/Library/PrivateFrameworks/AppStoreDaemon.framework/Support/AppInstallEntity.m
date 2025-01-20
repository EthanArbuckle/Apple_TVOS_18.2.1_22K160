@interface AppInstallEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
- (BOOL)deleteFromDatabase;
@end

@implementation AppInstallEntity

- (BOOL)deleteFromDatabase
{
  id v3 = sub_1001E2734(self, (uint64_t)@"external_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    id v5 = sub_1001D1304((uint64_t)&OBJC_CLASS___VoucherStore);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    sub_1001D14F0(v6, v4);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AppInstallEntity;
  BOOL v7 = -[SQLiteEntity deleteFromDatabase](&v9, "deleteFromDatabase");

  return v7;
}

+ (id)foreignDatabaseTablesToDelete
{
  if (qword_100462370 != -1) {
    dispatch_once(&qword_100462370, &stru_1003ED2C0);
  }
  return (id)qword_100462368;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return [&off_10040E128 valueForKey:a3];
}

+ (id)databaseTable
{
  return @"app_install";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v13[0] = @"COUNT(1)";
  v13[1] = @"MAX(app_install.priority)";
  v13[2] = @"MIN(app_install.priority)";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL));
  if ([v5 containsObject:v4])
  {
    id v6 = v4;
  }

  else
  {
    v12[0] = @"IFNULL(app_install.bootstrapped, 2)";
    v12[1] = @"IFNULL(app_install.phase, 10)";
    v12[2] = @"IFNULL(app_install.priority, 0)";
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
    if ([v7 containsObject:v4])
    {
      id v8 = v4;
    }

    else
    {
      v11.receiver = a1;
      v11.super_class = (Class)&OBJC_METACLASS___AppInstallEntity;
      id v9 = objc_msgSendSuper2(&v11, "disambiguatedSQLForProperty:", v4);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v9);
    }

    id v6 = v8;
  }

  return v6;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppInstall, a2);
}

- (void).cxx_destruct
{
}

@end