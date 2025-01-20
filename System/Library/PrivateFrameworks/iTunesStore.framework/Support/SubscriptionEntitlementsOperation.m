@interface SubscriptionEntitlementsOperation
- (BOOL)ignoreCaches;
- (NSString)clientIdentifier;
- (id)_fetchSubscriptionEntitlements:(id *)a3;
- (id)subscriptionEntitlementsBlock;
- (void)run;
- (void)setClientIdentifier:(id)a3;
- (void)setIgnoreCaches:(BOOL)a3;
- (void)setSubscriptionEntitlementsBlock:(id)a3;
@end

@implementation SubscriptionEntitlementsOperation

- (void)run
{
  v3 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SubscriptionEntitlementsOperation subscriptionEntitlementsBlock]( self,  "subscriptionEntitlementsBlock"));
  char v17 = 0;
  if (-[SubscriptionEntitlementsOperation ignoreCaches](self, "ignoreCaches"))
  {
    v4 = 0LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[SSVSubscriptionEntitlementsCoordinator cachedSubscriptionEntitlementsExpired:]( &OBJC_CLASS___SSVSubscriptionEntitlementsCoordinator,  "cachedSubscriptionEntitlementsExpired:",  &v17));
    if (v4) {
      BOOL v5 = v17 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      id v14 = 0LL;
      goto LABEL_23;
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_18;
  }
  v10 = (void *)objc_opt_class(self);
  int v18 = 138412290;
  v19 = v10;
  id v11 = v10;
  v12 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%@: Fetching subscription entitlements from the server.",  &v18,  12);

  if (v12)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v6, @"%@");
LABEL_18:
  }

  id v16 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SubscriptionEntitlementsOperation _fetchSubscriptionEntitlements:]( self,  "_fetchSubscriptionEntitlements:",  &v16));
  id v14 = v16;
  if (!v14)
  {
    id v15 = v13;

    v4 = v15;
  }

LABEL_23:
  ((void (**)(void, void *, id))v3)[2](v3, v4, v14);
  -[SubscriptionEntitlementsOperation setError:](self, "setError:", v14);
  -[SubscriptionEntitlementsOperation setSubscriptionEntitlementsBlock:](self, "setSubscriptionEntitlementsBlock:", 0LL);
  -[SubscriptionEntitlementsOperation setSuccess:](self, "setSuccess:", 1LL);
}

- (id)_fetchSubscriptionEntitlements:(id *)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v5 setCanSendGUIDParameter:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v5 setDataProvider:v6];

  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setURLBagKey:](v7, "setURLBagKey:", @"fsEntitlementsSrv");
  [v5 setRequestProperties:v7];
  id v34 = 0LL;
  unsigned int v8 = -[SubscriptionEntitlementsOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v34);
  id v9 = v34;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  uint64_t v12 = objc_opt_class(v11);
  v13 = 0LL;
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0) {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  }

  id v14 = [v13 statusCode];
  if (v14 == (id)200) {
    unsigned int v15 = v8;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v15 == 1)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 dataProvider]);
    char v17 = (void *)objc_claimAutoreleasedReturnValue([v16 output]);

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
    {
      v27 = 0LL;
      goto LABEL_22;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"status"]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0 && [v19 integerValue])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"errorNumber"]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
        v23 = v21;
      }
      else {
        v23 = v19;
      }
      id v24 = [v23 integerValue];
      v25 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"errorMessage"]);
      uint64_t v26 = SSError(SSServerErrorDomain, v24, 0LL, v25);
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v26);

      v27 = 0LL;
      id v9 = (id)v33;
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"entitlements"]);
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[SSVSubscriptionEntitlements _parseJSONDictionary:]( &OBJC_CLASS___SSVSubscriptionEntitlements,  "_parseJSONDictionary:",  v21));
      +[SSVSubscriptionEntitlementsCoordinator setCachedSubscriptionEntitlements:]( &OBJC_CLASS___SSVSubscriptionEntitlementsCoordinator,  "setCachedSubscriptionEntitlements:",  v21);
    }

LABEL_21:
LABEL_22:

    if (!a3) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }

  if (!v9)
  {
    id v28 = v14;
    uint64_t v29 = SSError(SSErrorDomain, 109LL, 0LL, 0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v30 = SSErrorHTTPStatusCodeKey;
    char v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v28));
    uint64_t v31 = SSErrorBySettingUserInfoValue(v19, v30, v17);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v31);
    v27 = 0LL;
    goto LABEL_21;
  }

  v27 = 0LL;
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (!v27) {
    *a3 = v9;
  }
LABEL_25:

  return v27;
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (BOOL)ignoreCaches
{
  return self->_ignoreCaches;
}

- (void)setIgnoreCaches:(BOOL)a3
{
  self->_ignoreCaches = a3;
}

- (id)subscriptionEntitlementsBlock
{
  return objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSubscriptionEntitlementsBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end