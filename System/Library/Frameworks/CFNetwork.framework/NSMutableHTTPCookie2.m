@interface NSMutableHTTPCookie2
- (BOOL)isEqual:(id)a3;
- (NSMutableHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5;
- (void)setDomain:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHostOnly:(BOOL)a3;
- (void)setHttpOnly:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPath:(id)a3;
- (void)setSameSite:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation NSMutableHTTPCookie2

- (NSMutableHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMutableHTTPCookie2;
  return -[NSHTTPCookie2 initWithName:value:domain:](&v6, sel_initWithName_value_domain_, a3, a4, a5);
}

- (void)setName:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (void)setDomain:(id)a3
{
  id v10 = a3;
  if ([v10 hasPrefix:@"."])
  {
    [v10 lowercaseString];
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    domain = self->super._domain;
    self->super._domain = v4;
  }

  else
  {
    [@"." stringByAppendingString:v10];
    domain = (void *)objc_claimAutoreleasedReturnValue();
    [domain lowercaseString];
    objc_super v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._domain;
    self->super._domain = v6;
  }

  +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]( (uint64_t)&OBJC_CLASS___NSHTTPCookieStorageUtils,  self->super._domain);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  etldPlusOne = self->super._etldPlusOne;
  self->super._etldPlusOne = v8;
}

- (void)setPath:(id)a3
{
}

- (void)setSameSite:(int64_t)a3
{
  self->super._sameSite = a3;
}

- (void)setSecure:(BOOL)a3
{
  self->super._secure = a3;
}

- (void)setHostOnly:(BOOL)a3
{
  self->super._hostOnly = a3;
}

- (void)setHttpOnly:(BOOL)a3
{
  self->super._httpOnly = a3;
}

- (void)setPartition:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [v4 timeIntervalSince1970];
    BOOL v5 = 0;
    self->super._sExpirationDate = vcvtad_u64_f64(v6);
    id v4 = v7;
  }

  else
  {
    BOOL v5 = 1;
  }

  self->super._session = v5;
}

- (void)setSource:(int64_t)a3
{
  self->super._source = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  name = self->super._name;
  [v4 name];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(name) = -[NSString isEqualToString:](name, "isEqualToString:", v6);

  path = self->super._path;
  [v4 path];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(path) = -[NSString isEqualToString:](path, "isEqualToString:", v8);

  domain = self->super._domain;
  [v4 domain];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(domain) = -[NSString isEqualToString:](domain, "isEqualToString:", v10);

  partition = self->super._partition;
  [v4 partition];
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (partition == v12)
  {
  }

  else
  {
    v13 = self->super._partition;
    [v4 partition];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

    if ((v13 & 1) == 0)
    {
LABEL_12:
      BOOL v19 = 0;
      goto LABEL_13;
    }
  }

  int hostOnly = self->super._hostOnly;
  int secure = self->super._secure;
  int64_t sameSite = self->super._sameSite;
  if (sameSite != [v4 sameSite]) {
    goto LABEL_12;
  }
  int httpOnly = self->super._httpOnly;
  BOOL v19 = httpOnly == [v4 httpOnly];
LABEL_13:

  return v19;
}

@end