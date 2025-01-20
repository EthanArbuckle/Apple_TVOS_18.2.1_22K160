@interface NSXPCConnection
- (BOOL)_connectionHasEntitlement:(id)a3;
- (BOOL)sd_connectionCanShareURL:(id)a3;
- (BOOL)sd_connectionHasEntitlement:(id)a3;
- (NSString)sd_connectionBundleID;
- (NSString)sd_connectionProcessName;
- (NSString)sd_description;
@end

@implementation NSXPCConnection

- (NSString)sd_description
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection sd_connectionBundleID](self, "sd_connectionBundleID"));
  v4 = (void *)v3;
  v5 = @"N/A";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%d)",  v6,  -[NSXPCConnection processIdentifier](self, "processIdentifier")));
  return (NSString *)v7;
}

- (NSString)sd_connectionBundleID
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](self, "_xpcConnection"));
  id v4 = sub_1001167C0(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self,  "valueForEntitlement:",  @"application-identifier"));
  }
  return (NSString *)v5;
}

- (NSString)sd_connectionProcessName
{
  if (proc_name(-[NSXPCConnection processIdentifier](self, "processIdentifier", 0LL, 0LL, 0LL, 0LL), &v3, 0x20u) < 1) {
    return (NSString *)0LL;
  }
  else {
    return -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", &v3);
  }
}

- (BOOL)sd_connectionHasEntitlement:(id)a3
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", a3));
  if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) != 0) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)sd_connectionCanShareURL:(id)a3
{
  unsigned __int8 v4 = (const __CFURL *)a3;
  -[NSXPCConnection auditToken](self, "auditToken");
  char v5 = sub_100114F90(v4, &v9);
  if ((v5 & 1) == 0)
  {
    id v6 = share_sheet_log();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10048AA0C(v4, v7);
    }
  }

  return v5;
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", a3));
  if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) != 0) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

@end