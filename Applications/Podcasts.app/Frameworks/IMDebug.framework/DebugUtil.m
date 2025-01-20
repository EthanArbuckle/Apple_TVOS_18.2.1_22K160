@interface DebugUtil
+ (BOOL)is17Net;
+ (BOOL)isDebugEnabled;
+ (BOOL)isInternalInstall;
+ (id)allViewControllers;
+ (id)applicationDocumentsDirectory;
+ (id)getIPAddress;
+ (id)sharedApplicationIfPossible;
@end

@implementation DebugUtil

+ (BOOL)isDebugEnabled
{
  else {
    return [a1 is17Net];
  }
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global);
  }
  return isInternalInstall_isInternalInstall;
}

void __30__DebugUtil_isInternalInstall__block_invoke(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  isInternalInstall_isInternalInstall = [v1 fileExistsAtPath:@"/AppleInternal"];
}

+ (BOOL)is17Net
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 getIPAddress]);
  if ([v2 hasPrefix:@"17."])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@"."]);
    BOOL v4 = [v3 count] == &dword_4;
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)getIPAddress
{
  v11 = 0LL;
  int v2 = getifaddrs(&v11);
  v3 = 0LL;
  BOOL v4 = v11;
  if (!v2 && v11)
  {
    v3 = 0LL;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4->ifa_name));
        unsigned int v6 = [v5 isEqualToString:@"en0"];

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", inet_ntoa(v7));
          uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

          v3 = (void *)v9;
        }
      }

      BOOL v4 = v4->ifa_next;
    }

    while (v4);
    BOOL v4 = v11;
  }

  freeifaddrs(v4);
  return v3;
}

+ (id)applicationDocumentsDirectory
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLsForDirectory:9 inDomains:1]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  return v4;
}

+ (id)allViewControllers
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedApplicationIfPossible]);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);

    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 rootViewController]);
    if (v6)
    {
      in_addr v7 = (void *)v6;
      do
      {
        -[NSMutableArray addObject:](v3, "addObject:", v7);
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 presentedViewController]);

        in_addr v7 = (void *)v8;
      }

      while (v8);
    }
  }

  else
  {
    v3 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v3;
}

+ (id)sharedApplicationIfPossible
{
  id v2 = -[objc_class sharedApplication](NSClassFromString(@"UIApplication"), "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

@end