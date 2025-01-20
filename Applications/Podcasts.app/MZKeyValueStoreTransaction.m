@interface MZKeyValueStoreTransaction
- (MZKeyValueStoreTransaction)initWithType:(int)a3 domain:(id)a4 URL:(id)a5 keys:(id)a6;
- (MZKeyValueStoreTransactionProcessing)processor;
- (NSArray)keys;
- (NSMutableDictionary)userInfo;
- (NSString)domain;
- (NSString)sinceDomainVersion;
- (NSURL)URL;
- (id)assertionName;
- (id)description;
- (id)userInfoValueForKey:(id)a3;
- (int)type;
- (void)setDomain:(id)a3;
- (void)setProcessor:(id)a3;
- (void)setSinceDomainVersion:(id)a3;
- (void)setType:(int)a3;
- (void)setURL:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoValue:(id)a3 forKey:(id)a4;
@end

@implementation MZKeyValueStoreTransaction

- (MZKeyValueStoreTransaction)initWithType:(int)a3 domain:(id)a4 URL:(id)a5 keys:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreTransaction;
  v13 = -[MZKeyValueStoreTransaction init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v15 = (NSString *)[v10 copy];
    domain = v14->_domain;
    v14->_domain = v15;

    sinceDomainVersion = v14->_sinceDomainVersion;
    v14->_sinceDomainVersion = 0LL;

    objc_storeStrong((id *)&v14->_URL, a5);
    objc_storeStrong((id *)&v14->_keys, a6);
  }

  return v14;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction userInfo](v7, "userInfo"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[MZKeyValueStoreTransaction setUserInfo:](v7, "setUserInfo:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction userInfo](v7, "userInfo"));
  [v10 setValue:v11 forKey:v6];

  objc_sync_exit(v7);
}

- (id)userInfoValueForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction userInfo](v5, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (id)description
{
  unsigned int v3 = -[MZKeyValueStoreTransaction type](self, "type");
  switch(v3)
  {
    case 3u:
      id v6 = &stru_100248948;
      v7 = @"REMOVE";
      break;
    case 2u:
      id v6 = &stru_100248948;
      v7 = @"SET";
      break;
    case 1u:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction keys](self, "keys"));
      id v5 = [v4 count];

      if (v5)
      {
        id v6 = &stru_100248948;
        v7 = @"GET";
      }

      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction sinceDomainVersion](self, "sinceDomainVersion"));
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" since-domain-version=%@",  v8));

        v7 = @"GET-ALL";
      }

      break;
    default:
      id v6 = &stru_100248948;
      v7 = @"Unknown";
      break;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction URL](self, "URL"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
  if (![v10 length])
  {

    v14 = &stru_100248948;
LABEL_15:

    goto LABEL_16;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction URL](self, "URL"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 absoluteString]);
  unsigned __int8 v13 = [v12 isEqualToString:@"(null)"];

  if ((v13 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction URL](self, "URL"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" url=%@",  v9));
    goto LABEL_15;
  }

  v14 = &stru_100248948;
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction keys](self, "keys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsJoinedByString:@","]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" keys=%@", v16));

  v18 = (objc_class *)objc_opt_class(self);
  objc_super v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p type:%@%@%@%@>",  v20,  self,  v7,  v14,  v17,  v6));

  return v21;
}

- (id)assertionName
{
  unsigned int v3 = -[MZKeyValueStoreTransaction type](self, "type");
  switch(v3)
  {
    case 3u:
      id v6 = @"REMOVE";
      break;
    case 2u:
      id v6 = @"SET";
      break;
    case 1u:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction keys](self, "keys"));
      id v5 = [v4 count];

      if (!v5)
      {
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreTransaction sinceDomainVersion](self, "sinceDomainVersion"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" since-domain-version=%@",  v13));

        id v6 = @"GET-ALL";
        goto LABEL_10;
      }

      id v6 = @"GET";
      break;
    default:
      id v6 = @"Unknown";
      break;
  }

  v7 = &stru_100248948;
LABEL_10:
  v8 = (objc_class *)objc_opt_class(self);
  v9 = NSStringFromClass(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ type:%@>",  v10,  v6));

  return v11;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDomain:(id)a3
{
}

- (NSString)sinceDomainVersion
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSinceDomainVersion:(id)a3
{
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setURL:(id)a3
{
}

- (MZKeyValueStoreTransactionProcessing)processor
{
  return (MZKeyValueStoreTransactionProcessing *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProcessor:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void).cxx_destruct
{
}

@end