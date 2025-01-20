@interface IXPromisedAppReferenceSeed
+ (BOOL)supportsSecureCoding;
- (IXApplicationIdentity)identity;
- (IXPromisedAppReferenceSeed)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)installationDomain;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setInstallationDomain:(unint64_t)a3;
@end

@implementation IXPromisedAppReferenceSeed

- (IXPromisedAppReferenceSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IXPromisedAppReferenceSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v12, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"installationDomain"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_installationDomain = (unint64_t)[v7 unsignedIntegerValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(IXApplicationIdentity) forKey:@"identity"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    identity = v5->_identity;
    v5->_identity = (IXApplicationIdentity *)v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXPromisedAppReferenceSeed;
  id v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXPromisedAppReferenceSeed installationDomain]( self,  "installationDomain",  v7.receiver,  v7.super_class)));
  [v4 encodeObject:v5 forKey:@"installationDomain"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedAppReferenceSeed identity](self, "identity"));
  [v4 encodeObject:v6 forKey:@"identity"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXPromisedAppReferenceSeed;
  id v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v8, "copyWithZone:", a3);
  objc_msgSend( v4,  "setInstallationDomain:",  -[IXPromisedAppReferenceSeed installationDomain](self, "installationDomain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedAppReferenceSeed identity](self, "identity"));
  id v6 = [v5 copy];
  [v4 setIdentity:v6];

  return v4;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (void)setInstallationDomain:(unint64_t)a3
{
  self->_installationDomain = a3;
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end