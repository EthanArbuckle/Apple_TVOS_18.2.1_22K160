@interface IDSGenericConnectionID
+ (id)idWithAccount:(id)a3 service:(id)a4 name:(id)a5;
- (BOOL)isEqual:(id)a3;
- (IDSGenericConnectionID)initWithAccount:(id)a3 service:(id)a4 name:(id)a5;
- (NSString)account;
- (NSString)name;
- (NSString)service;
- (id)description;
- (id)serviceConnectorServiceForAccount;
- (unint64_t)hash;
@end

@implementation IDSGenericConnectionID

+ (id)idWithAccount:(id)a3 service:(id)a4 name:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[IDSGenericConnectionID initWithAccount:service:name:]( objc_alloc(&OBJC_CLASS___IDSGenericConnectionID),  "initWithAccount:service:name:",  v9,  v8,  v7);

  return v10;
}

- (id)serviceConnectorServiceForAccount
{
  account = self->_account;
  if (account && self->_service && (v4 = self->_name) != 0LL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  account,  self->_service,  v4));
  }

  else
  {
    uint64_t v6 = OSLogHandleForTransportCategory("UTunController");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_account;
      service = self->_service;
      name = self->_name;
      *(_DWORD *)buf = 138413314;
      v15 = self;
      __int16 v16 = 2112;
      uint64_t v17 = 0LL;
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 2112;
      v21 = service;
      __int16 v22 = 2112;
      v23 = name;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ returning serviceConnectorServiceForAccountString=%@._account=%@;_service=%@;_name=%@",
        buf,
        0x34u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport( @"UTunController",  @"IDS",  @"%@ returning serviceConnectorServiceForAccountString=%@._account=%@;_service=%@;_name=%@");
        if (_IDSShouldLog(0LL, @"UTunController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UTunController",  @"%@ returning serviceConnectorServiceForAccountString=%@._account=%@;_service=%@;_name=%@");
        }
      }
    }

    v5 = 0LL;
  }

  return v5;
}

- (id)description
{
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSGenericConnectionID[%@,%@,%@] @%p (%lu)",  self->_account,  self->_service,  self->_name,  self,  self->_hash));
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (IDSGenericConnectionID)initWithAccount:(id)a3 service:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSGenericConnectionID;
  uint64_t v11 = -[IDSGenericConnectionID init](&v21, "init");
  if (v11)
  {
    uint64_t v12 = (NSString *)[v8 copy];
    account = v11->_account;
    v11->_account = v12;

    v14 = (NSString *)[v9 copy];
    service = v11->_service;
    v11->_service = v14;

    __int16 v16 = (NSString *)[v10 copy];
    name = v11->_name;
    v11->_name = v16;

    NSUInteger v18 = -[NSString hash](v11->_account, "hash");
    unint64_t v19 = -[NSString hash](v11->_service, "hash") ^ v18;
    v11->_hash = v19 ^ -[NSString hash](v11->_name, "hash");
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(&OBJC_CLASS___IDSGenericConnectionID, v7))
  {
    id v9 = v4;
    account = self->_account;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 account]);
    if (-[NSString isEqualToString:](account, "isEqualToString:", v11))
    {
      service = self->_service;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
      if (-[NSString isEqualToString:](service, "isEqualToString:", v13))
      {
        name = self->_name;
        v15 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned __int8 v8 = -[NSString isEqualToString:](name, "isEqualToString:", v15);
      }

      else
      {
        unsigned __int8 v8 = 0;
      }
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)account
{
  return self->_account;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end