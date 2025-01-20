@interface MSDPlatform
+ (BOOL)iOSHub;
+ (id)sharedInstance;
- (BOOL)iOS;
- (BOOL)isValidProductList:(id)a3;
- (BOOL)macOS;
- (BOOL)rOS;
- (BOOL)tvOS;
- (BOOL)watchOS;
- (MSDPlatform)init;
- (NSString)platformType;
- (void)raiseInvalidProductListExceptionWithReason:(id)a3;
- (void)setIOS:(BOOL)a3;
- (void)setMacOS:(BOOL)a3;
- (void)setPlatformType:(id)a3;
- (void)setPlatformWithManifestProductList:(id)a3;
- (void)setROS:(BOOL)a3;
- (void)setTvOS:(BOOL)a3;
- (void)setWatchOS:(BOOL)a3;
@end

@implementation MSDPlatform

+ (id)sharedInstance
{
  if (qword_10004F810 != -1) {
    dispatch_once(&qword_10004F810, &stru_100044C38);
  }
  return (id)qword_10004F808;
}

+ (BOOL)iOSHub
{
  if (qword_10004F820 != -1) {
    dispatch_once(&qword_10004F820, &stru_100044C58);
  }
  return byte_10004F818;
}

- (MSDPlatform)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDPlatform;
  v2 = -[MSDPlatform init](&v10, "init");
  if (!v2) {
    return v2;
  }
  v3 = (void *)MGCopyAnswer(@"ProductName", 0LL);
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"Watch OS"])
    {
      -[MSDPlatform setWatchOS:](v2, "setWatchOS:", 1LL);
      v5 = @"watchOS";
    }

    else if ([v4 isEqualToString:@"Apple TVOS"])
    {
      -[MSDPlatform setTvOS:](v2, "setTvOS:", 1LL);
      v5 = @"tvOS";
    }

    else if ([v4 isEqualToString:@"iPhone OS"])
    {
      -[MSDPlatform setIOS:](v2, "setIOS:", 1LL);
      v5 = @"iOS";
    }

    else if (([v4 isEqualToString:@"macOS"] & 1) != 0 {
           || [v4 isEqualToString:@"Mac OS X"])
    }
    {
      -[MSDPlatform setMacOS:](v2, "setMacOS:", 1LL);
      v5 = @"macOS";
    }

    else
    {
      -[MSDPlatform setIOS:](v2, "setIOS:", 1LL);
      -[MSDPlatform setROS:](v2, "setROS:", 1LL);
      v5 = @"xrOS";
    }

    -[MSDPlatform setPlatformType:](v2, "setPlatformType:", v5);
  }

- (void)setPlatformWithManifestProductList:(id)a3
{
  id v10 = a3;
  if (-[MSDPlatform tvOS](self, "tvOS") || -[MSDPlatform watchOS](self, "watchOS")) {
    goto LABEL_15;
  }
  -[MSDPlatform setWatchOS:](self, "setWatchOS:", 0LL);
  -[MSDPlatform setTvOS:](self, "setTvOS:", 0LL);
  -[MSDPlatform setIOS:](self, "setIOS:", 0LL);
  -[MSDPlatform setMacOS:](self, "setMacOS:", 0LL);
  -[MSDPlatform setROS:](self, "setROS:", 0LL);
  if (![v10 count]) {
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:]( self,  "raiseInvalidProductListExceptionWithReason:",  @"Empty product list.");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0) {
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:]( self,  "raiseInvalidProductListExceptionWithReason:",  @"Product list entry must be of type String.");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);

  if (([v8 containsString:@"iphone"] & 1) != 0
    || ([v8 containsString:@"ipad"] & 1) != 0
    || [v8 containsString:@"ipod"])
  {
    -[MSDPlatform setIOS:](self, "setIOS:", 1LL);
    v9 = @"iOS";
  }

  else if ([v8 containsString:@"watch"])
  {
    -[MSDPlatform setWatchOS:](self, "setWatchOS:", 1LL);
    v9 = @"watchOS";
  }

  else if ([v8 containsString:@"appletv"])
  {
    -[MSDPlatform setTvOS:](self, "setTvOS:", 1LL);
    v9 = @"tvOS";
  }

  else if (([v8 containsString:@"mac"] & 1) != 0 {
         || [v8 containsString:@"adp"])
  }
  {
    -[MSDPlatform setMacOS:](self, "setMacOS:", 1LL);
    v9 = @"macOS";
  }

  else
  {
    -[MSDPlatform setROS:](self, "setROS:", 1LL);
    v9 = @"xrOS";
  }

  -[MSDPlatform setPlatformType:](self, "setPlatformType:", v9);
LABEL_12:
  if (!-[MSDPlatform isValidProductList:](self, "isValidProductList:", v10)) {
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:]( self,  "raiseInvalidProductListExceptionWithReason:",  @"Product list should contain only one product category.");
  }

LABEL_15:
}

- (BOOL)isValidProductList:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0) {
          goto LABEL_24;
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString", (void)v14));
        if (-[MSDPlatform watchOS](self, "watchOS")
          && ![v11 containsString:@"watch"]
          || -[MSDPlatform tvOS](self, "tvOS") && ![v11 containsString:@"appletv"]
          || -[MSDPlatform iOS](self, "iOS")
          && ([v11 containsString:@"iphone"] & 1) == 0
          && ([v11 containsString:@"ipad"] & 1) == 0
          && ![v11 containsString:@"ipod"]
          || -[MSDPlatform macOS](self, "macOS")
          && ([v11 containsString:@"mac"] & 1) == 0
          && ![v11 containsString:@"adp"]
          || -[MSDPlatform rOS](self, "rOS")
          && ![v11 containsString:@"realitydevice"])
        {

LABEL_24:
          BOOL v12 = 0;
          goto LABEL_26;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v12 = 1;
  }

- (void)raiseInvalidProductListExceptionWithReason:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"InvalidManifestProductList",  a3,  0LL));
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[MSDPlatform raiseInvalidProductListExceptionWithReason:]";
    __int16 v8 = 2114;
    v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s - Exception:  %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  [v3 raise];
}

- (BOOL)watchOS
{
  return self->_watchOS;
}

- (void)setWatchOS:(BOOL)a3
{
  self->_watchOS = a3;
}

- (BOOL)tvOS
{
  return self->_tvOS;
}

- (void)setTvOS:(BOOL)a3
{
  self->_tvOS = a3;
}

- (BOOL)iOS
{
  return self->_iOS;
}

- (void)setIOS:(BOOL)a3
{
  self->_iOS = a3;
}

- (BOOL)macOS
{
  return self->_macOS;
}

- (void)setMacOS:(BOOL)a3
{
  self->_macOS = a3;
}

- (BOOL)rOS
{
  return self->_rOS;
}

- (void)setROS:(BOOL)a3
{
  self->_rOS = a3;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (void)setPlatformType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end