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
  if (qword_1001255A8 != -1) {
    dispatch_once(&qword_1001255A8, &stru_1000FABF0);
  }
  return (id)qword_1001255A0;
}

+ (BOOL)iOSHub
{
  if (qword_1001255B8 != -1) {
    dispatch_once(&qword_1001255B8, &stru_1000FAC10);
  }
  return byte_1001255B0;
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
  id v11 = a3;
  if (-[MSDPlatform tvOS](self, "tvOS") || -[MSDPlatform watchOS](self, "watchOS")) {
    goto LABEL_15;
  }
  -[MSDPlatform setWatchOS:](self, "setWatchOS:", 0LL);
  -[MSDPlatform setTvOS:](self, "setTvOS:", 0LL);
  -[MSDPlatform setIOS:](self, "setIOS:", 0LL);
  -[MSDPlatform setMacOS:](self, "setMacOS:", 0LL);
  -[MSDPlatform setROS:](self, "setROS:", 0LL);
  if (![v11 count]) {
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:]( self,  "raiseInvalidProductListExceptionWithReason:",  @"Empty product list.");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0) {
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:]( self,  "raiseInvalidProductListExceptionWithReason:",  @"Product list entry must be of type String.");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);

  if (([v9 containsString:@"iphone"] & 1) != 0
    || ([v9 containsString:@"ipad"] & 1) != 0
    || [v9 containsString:@"ipod"])
  {
    -[MSDPlatform setIOS:](self, "setIOS:", 1LL);
    objc_super v10 = @"iOS";
  }

  else if ([v9 containsString:@"watch"])
  {
    -[MSDPlatform setWatchOS:](self, "setWatchOS:", 1LL);
    objc_super v10 = @"watchOS";
  }

  else if ([v9 containsString:@"appletv"])
  {
    -[MSDPlatform setTvOS:](self, "setTvOS:", 1LL);
    objc_super v10 = @"tvOS";
  }

  else if (([v9 containsString:@"mac"] & 1) != 0 {
         || [v9 containsString:@"adp"])
  }
  {
    -[MSDPlatform setMacOS:](self, "setMacOS:", 1LL);
    objc_super v10 = @"macOS";
  }

  else
  {
    -[MSDPlatform setROS:](self, "setROS:", 1LL);
    objc_super v10 = @"xrOS";
  }

  -[MSDPlatform setPlatformType:](self, "setPlatformType:", v10);
LABEL_12:
  if (!-[MSDPlatform isValidProductList:](self, "isValidProductList:", v11)) {
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:]( self,  "raiseInvalidProductListExceptionWithReason:",  @"Product list should contain only one product category.");
  }

LABEL_15:
}

- (BOOL)isValidProductList:(id)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
          goto LABEL_24;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString", (void)v15));
        if (-[MSDPlatform watchOS](self, "watchOS")
          && ![v12 containsString:@"watch"]
          || -[MSDPlatform tvOS](self, "tvOS") && ![v12 containsString:@"appletv"]
          || -[MSDPlatform iOS](self, "iOS")
          && ([v12 containsString:@"iphone"] & 1) == 0
          && ([v12 containsString:@"ipad"] & 1) == 0
          && ![v12 containsString:@"ipod"]
          || -[MSDPlatform macOS](self, "macOS")
          && ([v12 containsString:@"mac"] & 1) == 0
          && ![v12 containsString:@"adp"]
          || -[MSDPlatform rOS](self, "rOS")
          && ![v12 containsString:@"realitydevice"])
        {

LABEL_24:
          BOOL v13 = 0;
          goto LABEL_26;
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v13 = 1;
  }

- (void)raiseInvalidProductListExceptionWithReason:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"InvalidManifestProductList",  a3,  0LL));
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[MSDPlatform raiseInvalidProductListExceptionWithReason:]";
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