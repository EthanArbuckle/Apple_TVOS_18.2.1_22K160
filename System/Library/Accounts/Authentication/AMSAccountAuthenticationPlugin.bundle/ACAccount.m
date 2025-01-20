@interface ACAccount
- (NSDate)ams_lastAuthenticated;
- (void)ams_setLastAuthenticated:(id)a3;
@end

@implementation ACAccount

- (NSDate)ams_lastAuthenticated
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"lastAuthenticated"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSDate *)v4;
}

- (void)ams_setLastAuthenticated:(id)a3
{
}

@end