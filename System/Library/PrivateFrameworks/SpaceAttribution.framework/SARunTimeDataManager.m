@interface SARunTimeDataManager
+ (id)getRunTimeDataDict;
+ (id)runTimeDataObjectForKey:(id)a3;
+ (void)setRunTimeDataObject:(id)a3 forKey:(id)a4;
@end

@implementation SARunTimeDataManager

+ (id)getRunTimeDataDict
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/spaceattribution/",  @"RunTimeData.db"));
  id v36 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v2,  0LL,  &v36));
  id v4 = v36;
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
    v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v35 = v5;
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v10,  v3,  &v35));
    id v12 = v35;

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"versionNumber"]);
      id v15 = [v14 longValue];

      if (v15 == (id)1)
      {
        id v11 = v11;
        v17 = v11;
        goto LABEL_13;
      }

      uint64_t v33 = SALog(v16);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000341E4(v26);
      }
    }

    else
    {
      uint64_t v25 = SALog(v13);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100034180((uint64_t)v12, v26, v27, v28, v29, v30, v31, v32);
      }
    }

    v17 = 0LL;
    goto LABEL_13;
  }

  uint64_t v18 = SALog(v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
    sub_10003411C((uint64_t)v5, (os_log_s *)v11, v19, v20, v21, v22, v23, v24);
  }
  v17 = 0LL;
  id v12 = v5;
LABEL_13:

  return v17;
}

+ (id)runTimeDataObjectForKey:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SARunTimeDataManager getRunTimeDataDict](&OBJC_CLASS___SARunTimeDataManager, "getRunTimeDataDict"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:v3]);

  return v5;
}

+ (void)setRunTimeDataObject:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v37 = 0LL;
  unsigned __int8 v8 = [v7 createDirectoryAtPath:@"/var/db/spaceattribution/" withIntermediateDirectories:1 attributes:0 error:&v37];
  id v9 = v37;
  id v10 = v9;
  if ((v8 & 1) != 0)
  {
    id v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[SARunTimeDataManager getRunTimeDataDict]( &OBJC_CLASS___SARunTimeDataManager,  "getRunTimeDataDict"));
    if (!v11) {
      id v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL));
    -[NSMutableDictionary setValue:forKey:](v11, "setValue:forKey:", v12, @"versionNumber");

    -[NSMutableDictionary setValue:forKey:](v11, "setValue:forKey:", v5, v6);
    id v36 = v10;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  &v36));
    id v14 = v36;

    if (v13)
    {
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/spaceattribution/",  @"RunTimeData.db"));
      id v35 = v14;
      [v13 writeToFile:v16 options:1 error:&v35];
      id v10 = v35;

      if (v10)
      {
        uint64_t v18 = SALog(v17);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100034288((uint64_t)v6, (uint64_t)v10, v19);
        }
      }
    }

    else
    {
      uint64_t v28 = SALog(v15);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100034224((uint64_t)v14, v16, v29, v30, v31, v32, v33, v34);
      }
      id v10 = v14;
    }
  }

  else
  {
    uint64_t v20 = SALog(v9);
    id v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_10003431C((os_log_s *)v11, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

@end