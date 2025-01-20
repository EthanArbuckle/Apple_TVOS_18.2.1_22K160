@interface NSPToken
+ (BOOL)supportsSecureCoding;
- (NSPToken)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPToken

- (id)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    sub_100044730(v3, (uint64_t)-[NSMutableArray count](self->_tokens, "count"), (uint64_t)@"Token Count", 0, 14);
    sub_100044730(v3, (uint64_t)-[NSMutableArray count](self->_salts, "count"), (uint64_t)@"Salt Count", 0, 14);
    sub_100043E90(v3, self->_expirationDate, @"Expiration date", 0, 14LL);
    sub_100043E90(v3, self->_pairedTokenAccount, @"Paired token account", 0, 14LL);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSPToken;
  v5 = -[NSPToken init](&v21, "init");
  if (v5)
  {
    id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSData) forKey:@"tokenArray"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v7));
      tokens = v5->_tokens;
      v5->_tokens = (NSMutableArray *)v8;
    }

    id v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSData) forKey:@"saltsArray"];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v11));
      salts = v5->_salts;
      v5->_salts = (NSMutableArray *)v12;
    }

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"tokenExpirationDate"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"pairedTokenAccount"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    pairedTokenAccount = v5->_pairedTokenAccount;
    v5->_pairedTokenAccount = (NSString *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_tokens forKey:@"tokenArray"];
    [v5 encodeObject:self->_salts forKey:@"saltsArray"];
    [v5 encodeObject:self->_expirationDate forKey:@"tokenExpirationDate"];
    pairedTokenAccount = self->_pairedTokenAccount;
  }

  else
  {
    [v5 encodeObject:0 forKey:@"tokenArray"];
    [v5 encodeObject:0 forKey:@"saltsArray"];
    [v5 encodeObject:0 forKey:@"tokenExpirationDate"];
    pairedTokenAccount = 0LL;
  }

  [v5 encodeObject:pairedTokenAccount forKey:@"pairedTokenAccount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPToken init](+[NSPToken allocWithZone:](&OBJC_CLASS___NSPToken, "allocWithZone:", a3), "init");
  id v5 = v4;
  if (self)
  {
    sub_100011668((uint64_t)v4, self->_tokens);
    sub_10003ED60((uint64_t)v5, self->_salts);
    sub_10000E01C((uint64_t)v5, self->_expirationDate);
    pairedTokenAccount = self->_pairedTokenAccount;
  }

  else
  {
    sub_100011668((uint64_t)v4, 0LL);
    sub_10003ED60((uint64_t)v5, 0LL);
    sub_10000E01C((uint64_t)v5, 0LL);
    pairedTokenAccount = 0LL;
  }

  sub_10001F910((uint64_t)v5, pairedTokenAccount);
  return v5;
}

- (void).cxx_destruct
{
}

@end