@interface NSDictionary
- (BOOL)ams_isManagedAppleID;
- (NSDictionary)ams_accountFlags;
- (NSDictionary)ams_privacyAcknowledgement;
- (NSNumber)ams_DSID;
- (NSString)ams_altDSID;
- (NSString)ams_creditsString;
- (NSString)ams_firstName;
- (NSString)ams_lastName;
- (NSString)ams_secureToken;
- (NSString)ams_username;
- (int64_t)ams_errorCode;
@end

@implementation NSDictionary

- (NSDictionary)ams_accountFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"accountFlags"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (NSString)ams_username
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKeyPath:](self, "valueForKeyPath:", @"accountInfo.appleId"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKeyPath:](self, "valueForKeyPath:", @"accountInfo.accountName"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    id v5 = (objc_opt_isKindOfClass(v6, v7) & 1) != 0 ? v6 : 0LL;

    if (!v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKeyPath:](self, "valueForKeyPath:", @"personInfo.acAccountName"));
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
        id v5 = v8;
      }
      else {
        id v5 = 0LL;
      }
    }
  }

  return (NSString *)v5;
}

- (NSString)ams_altDSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"altDsPersonId"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (NSString)ams_creditsString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"creditDisplay"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (NSNumber)ams_DSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"dsPersonId"));
  if ((objc_opt_respondsToSelector(v2, "longLongValue") & 1) != 0) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v2 longLongValue]));
  }
  else {
    uint64_t v3 = 0LL;
  }

  return (NSNumber *)v3;
}

- (int64_t)ams_errorCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"failureType"));
  else {
    id v3 = 0LL;
  }

  return (int64_t)v3;
}

- (NSString)ams_firstName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKeyPath:](self, "valueForKeyPath:", @"accountInfo.address.firstName"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (BOOL)ams_isManagedAppleID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"isManagedStudent"));
  if ((objc_opt_respondsToSelector(v2, "BOOLValue") & 1) != 0) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (NSString)ams_lastName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKeyPath:](self, "valueForKeyPath:", @"accountInfo.address.lastName"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

- (NSDictionary)ams_privacyAcknowledgement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  @"privacyAcknowledgement"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSDictionary *)v4;
}

- (NSString)ams_secureToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"passwordToken"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (NSString *)v4;
}

@end