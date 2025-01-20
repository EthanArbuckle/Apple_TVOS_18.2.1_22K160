@interface TrustedPeersHelperIntendedTPPBSecureElementIdentity
+ (BOOL)supportsSecureCoding;
+ (id)intendedEmptyIdentity;
- (TPPBSecureElementIdentity)secureElementIdentity;
- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithCoder:(id)a3;
- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithSecureElementIdentity:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
@end

@implementation TrustedPeersHelperIntendedTPPBSecureElementIdentity

- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithSecureElementIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperIntendedTPPBSecureElementIdentity;
  v6 = -[TrustedPeersHelperIntendedTPPBSecureElementIdentity init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_secureElementIdentity, a3);
  }

  return v7;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TrustedPeersHelperIntendedTPPBSecureElementIdentity secureElementIdentity]( self,  "secureElementIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<TrustedPeersHelperIntendedTPPBSecureElementIdentity: %@>",  v2));

  return v3;
}

- (TrustedPeersHelperIntendedTPPBSecureElementIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TrustedPeersHelperIntendedTPPBSecureElementIdentity;
  id v5 = -[TrustedPeersHelperIntendedTPPBSecureElementIdentity init](&v10, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(TPPBSecureElementIdentity) forKey:@"identity"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    secureElementIdentity = v5->_secureElementIdentity;
    v5->_secureElementIdentity = (TPPBSecureElementIdentity *)v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TrustedPeersHelperIntendedTPPBSecureElementIdentity secureElementIdentity](self, "secureElementIdentity"));
  [v4 encodeObject:v5 forKey:@"identity"];
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  return (TPPBSecureElementIdentity *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)intendedEmptyIdentity
{
  return  -[TrustedPeersHelperIntendedTPPBSecureElementIdentity initWithSecureElementIdentity:]( objc_alloc(&OBJC_CLASS___TrustedPeersHelperIntendedTPPBSecureElementIdentity),  "initWithSecureElementIdentity:",  0LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end