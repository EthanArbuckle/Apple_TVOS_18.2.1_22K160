@interface CDDPaths
+ (id)CDDConfigurationBundlePath;
+ (id)CDDConfigurationBundlePathDefault;
+ (id)CDDDatabaseDirectory;
+ (id)knowledgeDatabaseDirectory;
+ (id)peopleDatabaseDirectory;
+ (id)simulatorHomePathFor:(id)a3;
+ (id)simulatorSharedPathFor:(id)a3;
+ (id)simulatorSystemPathFor:(id)a3 withEnvVar:(id)a4;
+ (id)userLocalKnowledgeDatabaseDirectory;
@end

@implementation CDDPaths

+ (id)simulatorSystemPathFor:(id)a3 withEnvVar:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 environment]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v5]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v6]);
  return v10;
}

+ (id)simulatorHomePathFor:(id)a3
{
  id v3 = a3;
  v4 = NSHomeDirectory();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:v3]);

  return v6;
}

+ (id)simulatorSharedPathFor:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", @"/tmp"));
  [v4 addObject:@"Developer/CoreSimulator/Shared/data"];
  if (v3 && [v3 length]) {
    [v4 addObject:v3];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v4));

  return v5;
}

+ (id)CDDDatabaseDirectory
{
  return @"/var/mobile/Library/CoreDuet/";
}

+ (id)CDDConfigurationBundlePathDefault
{
  return @"/System/Library/CoreDuet/CoreDuetDaemonConfig.bundle";
}

+ (id)CDDConfigurationBundlePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDDatabaseDirectory](&OBJC_CLASS___CDDPaths, "CDDDatabaseDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingString:@"CoreDuetDaemonConfig.bundle"]);

  return v3;
}

+ (id)knowledgeDatabaseDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDDatabaseDirectory](&OBJC_CLASS___CDDPaths, "CDDDatabaseDirectory"));
  v6[0] = v2;
  v6[1] = @"Knowledge";
  v6[2] = &stru_10001D688;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));

  return v4;
}

+ (id)peopleDatabaseDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDDatabaseDirectory](&OBJC_CLASS___CDDPaths, "CDDDatabaseDirectory"));
  v6[0] = v2;
  v6[1] = @"People";
  v6[2] = &stru_10001D688;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));

  return v4;
}

+ (id)userLocalKnowledgeDatabaseDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDUserDatabaseDirectory](&OBJC_CLASS___CDDPaths, "CDDUserDatabaseDirectory"));
  v6[0] = v2;
  v6[1] = @"Knowledge";
  v6[2] = &stru_10001D688;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 3LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3));

  return v4;
}

@end