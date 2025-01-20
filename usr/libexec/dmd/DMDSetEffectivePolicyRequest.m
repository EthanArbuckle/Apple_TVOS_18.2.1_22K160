@interface DMDSetEffectivePolicyRequest
+ (BOOL)supportsSecureCoding;
- (DMDSetEffectivePolicyRequest)initWithCoder:(id)a3;
- (NSArray)identifiers;
- (NSString)declarationIdentifier;
- (NSString)organizationIdentifier;
- (NSString)type;
- (int64_t)policy;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation DMDSetEffectivePolicyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMDSetEffectivePolicyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___DMDSetEffectivePolicyRequest;
  v5 = -[DMDSetEffectivePolicyRequest initWithCoder:](&v28, "initWithCoder:", v4);
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

    v14 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"type"]);
    type = v5->_type;
    v5->_type = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"policy"];
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v5->_policy = (int64_t)[v19 integerValue];

    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
    v21 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v20,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v22 forKey:@"identifiers"]);
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"priority"];
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v5->_priority = (unint64_t)[v26 unsignedIntegerValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DMDSetEffectivePolicyRequest;
  id v4 = a3;
  -[DMDSetEffectivePolicyRequest encodeWithCoder:](&v11, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDSetEffectivePolicyRequest organizationIdentifier]( self,  "organizationIdentifier",  v11.receiver,  v11.super_class));
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest declarationIdentifier](self, "declarationIdentifier"));
  [v4 encodeObject:v6 forKey:@"declarationIdentifier"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest type](self, "type"));
  [v4 encodeObject:v7 forKey:@"type"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DMDSetEffectivePolicyRequest policy](self, "policy")));
  [v4 encodeObject:v8 forKey:@"policy"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSetEffectivePolicyRequest identifiers](self, "identifiers"));
  [v4 encodeObject:v9 forKey:@"identifiers"];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DMDSetEffectivePolicyRequest priority](self, "priority")));
  [v4 encodeObject:v10 forKey:@"priority"];
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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end