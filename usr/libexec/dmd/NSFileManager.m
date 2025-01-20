@interface NSFileManager
+ (id)dmd_legacyUserConfigurationEngineDatabaseURL;
+ (id)dmd_systemConfigurationDatabaseURL;
+ (id)dmd_systemConfigurationEngineDirectoryURL;
+ (id)dmd_systemDMDDirectoryURL;
+ (id)dmd_systemLibraryURL;
+ (id)dmd_userConfigurationDatabaseURL;
+ (id)dmd_userConfigurationEngineDirectoryURL;
+ (id)dmd_userDMDDirectoryURL;
+ (id)dmd_userDarwinUserTempDirectoryURL;
+ (id)dmd_userEffectivePoliciesDatabaseURL;
+ (id)dmd_userFontDatabaseDirectoryURL;
+ (id)dmd_userHomeURL;
+ (id)dmd_userImageDatabaseDirectoryURL;
+ (id)dmd_userLibraryURL;
+ (void)dmd_createUserDMDDirectoryDataVault;
+ (void)dmd_setUserDirSuffix:(char *)a3;
@end

@implementation NSFileManager

+ (id)dmd_systemLibraryURL
{
  if (qword_1000CCE98 != -1) {
    dispatch_once(&qword_1000CCE98, &stru_10009F4E8);
  }
  return (id)qword_1000CCE90;
}

+ (id)dmd_systemDMDDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_systemLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"dmd" isDirectory:1]);

  return v3;
}

+ (id)dmd_systemConfigurationEngineDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_systemDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"ConfigurationEngine" isDirectory:1]);

  return v3;
}

+ (id)dmd_systemConfigurationDatabaseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_systemConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Database" isDirectory:0]);

  return v3;
}

+ (id)dmd_userHomeURL
{
  if (qword_1000CCEA8 != -1) {
    dispatch_once(&qword_1000CCEA8, &stru_10009F508);
  }
  return (id)qword_1000CCEA0;
}

+ (id)dmd_userLibraryURL
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005FA4C;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCEB8 != -1) {
    dispatch_once(&qword_1000CCEB8, block);
  }
  return (id)qword_1000CCEB0;
}

+ (id)dmd_userDarwinUserTempDirectoryURL
{
  if (qword_1000CCEC8 != -1) {
    dispatch_once(&qword_1000CCEC8, &stru_10009F528);
  }
  return (id)qword_1000CCEC0;
}

+ (id)dmd_userDMDDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"dmd" isDirectory:1]);

  return v3;
}

+ (id)dmd_userConfigurationEngineDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"ConfigurationEngine" isDirectory:1]);

  return v3;
}

+ (id)dmd_userConfigurationDatabaseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Database" isDirectory:0]);

  return v3;
}

+ (id)dmd_userImageDatabaseDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Images" isDirectory:1]);

  return v3;
}

+ (id)dmd_userFontDatabaseDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Font" isDirectory:1]);

  return v3;
}

+ (id)dmd_userEffectivePoliciesDatabaseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Policies" isDirectory:1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"Database" isDirectory:0]);

  return v4;
}

+ (void)dmd_createUserDMDDirectoryDataVault
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = 0LL;
  unsigned __int8 v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v5 = v14;
  if ((v4 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_createUserDMDDirectoryDataVault]"));
    [v7 handleFailureInFunction:v8, @"NSFileManager+DMDAdditions.m", 190, @"Failed to create data vault directory: %@", v5 file lineNumber description];
  }

  id v6 = v2;
  if (rootless_convert_to_datavault([v6 fileSystemRepresentation], "dmd"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_createUserDMDDirectoryDataVault]"));
    v11 = __error();
    v12 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v9 handleFailureInFunction:v10, @"NSFileManager+DMDAdditions.m", 193, @"Failed to enable data vault: %@ (%d)", v13, *__error() file lineNumber description];
  }
}

+ (void)dmd_setUserDirSuffix:(char *)a3
{
  if ((_set_user_dir_suffix(a3, a2) & 1) == 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "+[NSFileManager(DMDAdditions) dmd_setUserDirSuffix:]"));
    unsigned __int8 v4 = __error();
    id v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v7 handleFailureInFunction:v3, @"NSFileManager+DMDAdditions.m", 197, @"Failed to set the user directory suffix: %@ (%d)", v6, *__error() file lineNumber description];
  }

+ (id)dmd_legacyUserConfigurationEngineDatabaseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"Configurations" isDirectory:0]);

  return v3;
}

@end