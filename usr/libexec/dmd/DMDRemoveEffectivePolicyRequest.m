@interface DMDRemoveEffectivePolicyRequest
+ (BOOL)supportsSecureCoding;
- (DMDRemoveEffectivePolicyRequest)initWithCoder:(id)a3;
- (NSString)declarationIdentifier;
- (NSString)organizationIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDRemoveEffectivePolicyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMDRemoveEffectivePolicyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DMDRemoveEffectivePolicyRequest;
  v5 = -[DMDRemoveEffectivePolicyRequest initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"organizationIdentifier"]);
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v8;

    v10 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"declarationIdentifier"]);
    declarationIdentifier = v5->_declarationIdentifier;
    v5->_declarationIdentifier = (NSString *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DMDRemoveEffectivePolicyRequest;
  id v4 = a3;
  -[DMDRemoveEffectivePolicyRequest encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDRemoveEffectivePolicyRequest organizationIdentifier]( self,  "organizationIdentifier",  v7.receiver,  v7.super_class));
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveEffectivePolicyRequest declarationIdentifier](self, "declarationIdentifier"));
  [v4 encodeObject:v6 forKey:@"declarationIdentifier"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end