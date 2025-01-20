@interface MSDMacAppPkg
+ (BOOL)isMacApp:(id)a3;
+ (id)codeSignaturePath:(id)a3;
@end

@implementation MSDMacAppPkg

+ (BOOL)isMacApp:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v3));
  v5 = v4;
  if (!v4)
  {
    id v20 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100094D20();
    }
    goto LABEL_22;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 infoDictionary]);

  if (!v6)
  {
    id v21 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100094D90();
    }
LABEL_22:
    BOOL v19 = 0;
    goto LABEL_23;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 infoDictionary]);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"CFBundleSupportedPlatforms"]);

  if (v8)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      v11 = v8;
      id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            if (objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)i),  "isEqualToString:",  @"MacOSX",  (void)v23))
            {

              BOOL v19 = 1;
              v8 = v11;
              goto LABEL_23;
            }
          }

          id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", (void)v23));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Contents/MacOS"]);
  unsigned __int8 v18 = [v16 fileExistsAtPath:v17 isDirectory:&v27];
  if (v27) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 0;
  }

LABEL_23:
  return v19;
}

+ (id)codeSignaturePath:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:@"Contents"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"_CodeSignature"]);

  return v4;
}

@end