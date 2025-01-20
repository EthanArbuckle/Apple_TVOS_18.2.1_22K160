@interface RMExternalStatusArchiver
+ (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5;
+ (id)_getPublishedStatusFileURLWithStoreIdentifier:(id)a3;
+ (id)statusWithStoreIdentifier:(id)a3 error:(id *)a4;
@end

@implementation RMExternalStatusArchiver

+ (id)statusWithStoreIdentifier:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusArchiver _getPublishedStatusFileURLWithStoreIdentifier:]( &OBJC_CLASS___RMExternalStatusArchiver,  "_getPublishedStatusFileURLWithStoreIdentifier:",  a3));
  id v21 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:]( &OBJC_CLASS___RMJSONUtilities,  "deserializeJSONDictionaryAtFileURL:error:",  v5,  &v21));
  id v7 = v21;
  if (v6)
  {
    if ([v6 count])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ValidStatus"]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ErrorStatus"]);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0
        && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12), (objc_opt_isKindOfClass(v9, v13) & 1) != 0))
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100027844;
        v19[3] = &unk_1000B8E78;
        id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));
        id v20 = v14;
        [v9 enumerateKeysAndObjectsUsingBlock:v19];
        id v15 = v20;
      }

      else
      {
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusArchiver](&OBJC_CLASS___RMLog, "externalStatusArchiver"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100027EF8(v17);
        }

        if (!a4)
        {
          id v14 = 0LL;
LABEL_20:

          goto LABEL_21;
        }

        id v15 = (id)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
        if (v15)
        {
          id v15 = v15;
          id v14 = 0LL;
          *a4 = v15;
        }

        else
        {
          id v14 = 0LL;
        }
      }

      goto LABEL_20;
    }

    id v14 = v6;
  }

  else
  {
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusArchiver](&OBJC_CLASS___RMLog, "externalStatusArchiver"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100027E98();
    }

    id v14 = 0LL;
    if (a4 && v7)
    {
      id v14 = 0LL;
      *a4 = v7;
    }
  }

+ (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v7 count]));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100027B58;
  v20[3] = &unk_1000B9948;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v7 count]));
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusArchiver _getPublishedStatusFileURLWithStoreIdentifier:]( &OBJC_CLASS___RMExternalStatusArchiver,  "_getPublishedStatusFileURLWithStoreIdentifier:",  v8));
  v23[0] = @"ValidStatus";
  v23[1] = @"ErrorStatus";
  v24[0] = v11;
  v24[1] = v10;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
  id v19 = 0LL;
  unsigned __int8 v14 = +[RMJSONUtilities serializeJSONDictionary:fileURL:error:]( &OBJC_CLASS___RMJSONUtilities,  "serializeJSONDictionary:fileURL:error:",  v13,  v12,  &v19);
  id v15 = v19;
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusArchiver](&OBJC_CLASS___RMLog, "externalStatusArchiver"));
  v17 = v16;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100027F38();
    }
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100027FA4();
    }

    if (a5 && v15) {
      *a5 = v15;
    }
  }

  return v14;
}

+ (id)_getPublishedStatusFileURLWithStoreIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations statusDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "statusDirectoryURLCreateIfNeeded:",  1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v3 isDirectory:1]);

  char v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7 isDirectory:&v15];

  if ((v8 & 1) == 0)
  {
    id v14 = 0LL;
    unsigned __int8 v9 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v10 = v14;
    if ((v9 & 1) == 0)
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog externalStatusArchiver](&OBJC_CLASS___RMLog, "externalStatusArchiver"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100028004();
      }
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"PublishedStatus.json" isDirectory:0]);

  return v12;
}

@end