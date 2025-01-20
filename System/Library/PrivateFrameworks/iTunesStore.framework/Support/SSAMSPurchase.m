@interface SSAMSPurchase
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPurchase:(id)a3;
- (BOOL)isPreauthenticated;
- (NSNumber)accountIdentifier;
- (NSString)mediaType;
- (SSAMSPurchase)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setPreauthenticated:(BOOL)a3;
@end

@implementation SSAMSPurchase

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SSAMSPurchase;
  id v4 = a3;
  -[SSAMSPurchase encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase accountIdentifier](self, "accountIdentifier", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"accountIdentifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase mediaType](self, "mediaType"));
  [v4 encodeObject:v6 forKey:@"mediaType"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated"),  @"preauthenticated");
}

- (SSAMSPurchase)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SSAMSPurchase;
  v5 = -[SSAMSPurchase initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"accountIdentifier"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"mediaType"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v10;

    v5->_preauthenticated = [v4 decodeBoolForKey:@"preauthenticated"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SSAMSPurchase;
  unint64_t v3 = -[SSAMSPurchase hash](&v10, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase accountIdentifier](self, "accountIdentifier"));
  unint64_t v5 = (unint64_t)[v4 hash];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase mediaType](self, "mediaType"));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];
  unint64_t v8 = v7 ^ -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated") ^ v3;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SSAMSPurchase *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v7 = 1;
    goto LABEL_7;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SSAMSPurchase);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    BOOL v7 = -[SSAMSPurchase isEqualToPurchase:](self, "isEqualToPurchase:", v5);
  }
  else {
LABEL_5:
  }
    BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)isEqualToPurchase:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase uniqueIdentifier](self, "uniqueIdentifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  if ([v5 isEqualToNumber:v6])
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase accountIdentifier](self, "accountIdentifier"));
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
    if ([v7 isEqualToNumber:v8])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSAMSPurchase mediaType](self, "mediaType"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaType]);
      if ([v9 isEqualToString:v10])
      {
        unsigned int v11 = -[SSAMSPurchase isPreauthenticated](self, "isPreauthenticated");
        unsigned int v12 = v11 ^ [v4 isPreauthenticated] ^ 1;
      }

      else
      {
        LOBYTE(v12) = 0;
      }
    }

    else
    {
      LOBYTE(v12) = 0;
    }
  }

  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (BOOL)isPreauthenticated
{
  return self->_preauthenticated;
}

- (void)setPreauthenticated:(BOOL)a3
{
  self->_preauthenticated = a3;
}

- (void).cxx_destruct
{
}

@end