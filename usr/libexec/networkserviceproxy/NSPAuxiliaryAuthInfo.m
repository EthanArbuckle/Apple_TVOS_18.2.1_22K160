@interface NSPAuxiliaryAuthInfo
+ (BOOL)supportsSecureCoding;
- (NSPAuxiliaryAuthInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPAuxiliaryAuthInfo

- (id)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    id Property = objc_getProperty(self, v4, 8LL, 1);
    sub_100043E90(v3, Property, @"Auxiliary Auth Info", 0, 14LL);
    id v7 = objc_getProperty(self, v6, 16LL, 1);
    sub_100043E90(v3, v7, @"Expiration Date", 0, 14LL);
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

- (NSPAuxiliaryAuthInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSPAuxiliaryAuthInfo;
  v5 = -[NSPAuxiliaryAuthInfo init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSPPrivacyProxyAuxiliaryAuthInfo) forKey:@"auxiliaryAuthInfo"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    auxiliaryAuthInfo = v5->_auxiliaryAuthInfo;
    v5->_auxiliaryAuthInfo = (NSPPrivacyProxyAuxiliaryAuthInfo *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"tokenExpirationDate"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self)
  {
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v5, 8, 1), @"auxiliaryAuthInfo");
    id Property = objc_getProperty(self, v6, 16LL, 1);
  }

  else
  {
    [v4 encodeObject:0 forKey:@"auxiliaryAuthInfo"];
    id Property = 0LL;
  }

  [a3 encodeObject:Property forKey:@"tokenExpirationDate"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPAuxiliaryAuthInfo init]( +[NSPAuxiliaryAuthInfo allocWithZone:](&OBJC_CLASS___NSPAuxiliaryAuthInfo, "allocWithZone:", a3),  "init");
  SEL v6 = v4;
  if (self)
  {
    id Property = objc_getProperty(self, v5, 8LL, 1);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id Property = 0LL;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_atomic(v6, v5, Property, 8LL);
LABEL_4:
  if (!self)
  {
    id v8 = 0LL;
    if (!v6) {
      return v6;
    }
    goto LABEL_6;
  }

  id v8 = objc_getProperty(self, v5, 16LL, 1);
  if (v6) {
LABEL_6:
  }
    objc_setProperty_atomic(v6, v5, v8, 16LL);
  return v6;
}

- (void).cxx_destruct
{
}

@end