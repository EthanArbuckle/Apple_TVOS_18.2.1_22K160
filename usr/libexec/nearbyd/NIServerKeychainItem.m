@interface NIServerKeychainItem
- (BOOL)isEqual:(id)a3;
- (NIServerKeychainItem)initWithService:(id)a3 account:(id)a4 data:(id)a5;
- (NSData)data;
- (NSString)account;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation NIServerKeychainItem

- (NIServerKeychainItem)initWithService:(id)a3 account:(id)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v16 = "service";
    int v17 = 734;
    goto LABEL_10;
  }

  if (!v10)
  {
    v16 = "account";
    int v17 = 735;
    goto LABEL_10;
  }

  if (!v11)
  {
    v16 = "data";
    int v17 = 736;
LABEL_10:
    __assert_rtn("-[NIServerKeychainItem initWithService:account:data:]", "NIServerKeychainManager.mm", v17, v16);
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NIServerKeychainItem;
  v13 = -[NIServerKeychainItem init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    objc_storeStrong((id *)&v14->_data, a5);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NIServerKeychainItem initWithService:account:data:]( objc_alloc(&OBJC_CLASS___NIServerKeychainItem),  "initWithService:account:data:",  self->_service,  self->_account,  self->_data);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIServerKeychainItem *)v4;
    v8 = v7;
    if (v7 == self)
    {
      BOOL v20 = 1;
    }

    else
    {
      service = v7->_service;
      id v10 = self->_service;
      unsigned int v11 = -[NSString isEqualToString:](service, "isEqualToString:", v10);
      else {
        int v12 = 1;
      }
      unint64_t account = (unint64_t)v8->_account;
      v14 = self->_account;
      unsigned int v15 = [(id)account isEqualToString:v14];
      else {
        int v16 = 1;
      }
      unint64_t data = (unint64_t)v8->_data;
      BOOL v18 = (data | (unint64_t)self->_data) == 0;
      unsigned int v19 = v16 & (v18 | objc_msgSend((id)data, "isEqualToData:"));
      if (v12) {
        BOOL v20 = v19;
      }
      else {
        BOOL v20 = 0;
      }
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_service, "hash");
  unint64_t v4 = -[NSString hash](self->_account, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_data, "hash");
}

- (id)description
{
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")) {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", self->_data));
  }
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{length = %d}",  -[NSData length](self->_data, "length")));
  }
  unint64_t v4 = (void *)v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ -- %@ : %@>",  self->_service,  self->_account,  v3));

  return v5;
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end