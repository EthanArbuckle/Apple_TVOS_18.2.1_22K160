@interface FAPushMessage
- (ACAccount)appleAccount;
- (ACAccount)gsAccount;
- (BOOL)isValid;
- (FAPushMessage)initWithMessage:(id)a3;
- (FAPushMessage)initWithMessage:(id)a3 accountStore:(id)a4;
- (NSDictionary)payload;
- (NSString)altDSID;
- (NSString)dsid;
- (NSString)event;
- (NSString)topic;
@end

@implementation FAPushMessage

- (FAPushMessage)initWithMessage:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___FAPushMessage;
  v8 = -[FAPushMessage init](&v24, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaultStore, a4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 topic]);
    topic = v9->_topic;
    v9->_topic = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 userInfo]);
    payload = v9->_payload;
    v9->_payload = (NSDictionary *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v9->_payload, "objectForKeyedSubscript:", @"event"));
    event = v9->_event;
    v9->_event = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v9->_payload, "objectForKeyedSubscript:", @"dsid"));
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    {
      v18 = v16;
    }

    else
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v16, v19) & 1) == 0)
      {
LABEL_7:
        uint64_t v21 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v9->_payload, "objectForKeyedSubscript:", @"adsid"));
        altDSID = v9->_altDSID;
        v9->_altDSID = (NSString *)v21;

        goto LABEL_8;
      }

      v18 = (NSString *)objc_claimAutoreleasedReturnValue([v16 stringValue]);
    }

    dsid = v9->_dsid;
    v9->_dsid = v18;

    goto LABEL_7;
  }

- (FAPushMessage)initWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v6 = -[FAPushMessage initWithMessage:accountStore:](self, "initWithMessage:accountStore:", v4, v5);

  return v6;
}

- (ACAccount)appleAccount
{
  if (self->_dsid)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccountWithPersonID:](self->_defaultStore, "aa_appleAccountWithPersonID:"));
  }

  else if (self->_altDSID)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccountWithAltDSID:](self->_defaultStore, "aa_appleAccountWithAltDSID:"));
  }

  else
  {
    v2 = 0LL;
  }

  return (ACAccount *)v2;
}

- (ACAccount)gsAccount
{
  defaultStore = self->_defaultStore;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAPushMessage appleAccount](self, "appleAccount"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aida_accountForiCloudAccount:](defaultStore, "aida_accountForiCloudAccount:", v3));

  return (ACAccount *)v4;
}

- (BOOL)isValid
{
  if (!self->_topic || !self->_payload || !self->_event || !self->_dsid && !self->_altDSID)
  {
    uint64_t v8 = _FALogSystem(self, a2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002A628(v4);
    }
    goto LABEL_11;
  }

  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[FAPushMessage appleAccount](self, "appleAccount"));
  id v4 = v2;
  if (!v2)
  {
    uint64_t v10 = _FALogSystem(0LL, v3);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002A668();
    }
    goto LABEL_17;
  }

  id v5 = -[os_log_s aa_isAccountClass:](v2, "aa_isAccountClass:", AAAccountClassPrimary);
  if ((v5 & 1) == 0)
  {
    uint64_t v12 = _FALogSystem(v5, v6);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002A6D4();
    }
LABEL_17:

LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }

  BOOL v7 = 1;
LABEL_12:

  return v7;
}

- (NSString)topic
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end