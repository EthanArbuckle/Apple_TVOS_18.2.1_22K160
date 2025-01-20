@interface SFSymmetricKeyAttributes
- (NSString)keyDomain;
- (NSString)localizedDescription;
- (NSString)localizedLabel;
- (NSString)persistentIdentifier;
- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3;
- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4;
- (_SFKeySpecifier)keySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setKeySpecifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedLabel:(id)a3;
@end

@implementation SFSymmetricKeyAttributes

- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3
{
  return -[SFSymmetricKeyAttributes initWithSpecifier:domain:]( self,  "initWithSpecifier:domain:",  a3,  @"SFKeyDomainCPU");
}

- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SFSymmetricKeyAttributes;
  v8 = -[SFSymmetricKeyAttributes init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___SFSymmetricKeyAttributes_Ivars);
    id symmetricKeyAttributesInternal = v8->_symmetricKeyAttributesInternal;
    v8->_id symmetricKeyAttributesInternal = v9;

    uint64_t v11 = [v6 copy];
    v12 = v8->_symmetricKeyAttributesInternal;
    v13 = (void *)v12[3];
    v12[3] = v11;

    uint64_t v14 = [v7 copy];
    v15 = v8->_symmetricKeyAttributesInternal;
    v16 = (void *)v15[4];
    v15[4] = v14;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithSpecifier:domain:",  *((void *)self->_symmetricKeyAttributesInternal + 3),  *((void *)self->_symmetricKeyAttributesInternal + 4));
  [v4 setLocalizedLabel:*((void *)self->_symmetricKeyAttributesInternal + 1)];
  [v4 setLocalizedDescription:*((void *)self->_symmetricKeyAttributesInternal + 2)];
  return v4;
}

- (NSString)localizedLabel
{
  return (NSString *)(id)[*((id *)self->_symmetricKeyAttributesInternal + 1) copy];
}

- (void)setLocalizedLabel:(id)a3
{
  uint64_t v4 = [a3 copy];
  id symmetricKeyAttributesInternal = self->_symmetricKeyAttributesInternal;
  id v6 = (void *)symmetricKeyAttributesInternal[1];
  symmetricKeyAttributesInternal[1] = v4;
}

- (NSString)localizedDescription
{
  return (NSString *)(id)[*((id *)self->_symmetricKeyAttributesInternal + 2) copy];
}

- (void)setLocalizedDescription:(id)a3
{
  uint64_t v4 = [a3 copy];
  id symmetricKeyAttributesInternal = self->_symmetricKeyAttributesInternal;
  id v6 = (void *)symmetricKeyAttributesInternal[2];
  symmetricKeyAttributesInternal[2] = v4;
}

- (_SFKeySpecifier)keySpecifier
{
  return (_SFKeySpecifier *)(id)[*((id *)self->_symmetricKeyAttributesInternal + 3) copy];
}

- (void)setKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  id symmetricKeyAttributesInternal = self->_symmetricKeyAttributesInternal;
  id v6 = (void *)symmetricKeyAttributesInternal[3];
  symmetricKeyAttributesInternal[3] = v4;
}

- (NSString)keyDomain
{
  return (NSString *)(id)[*((id *)self->_symmetricKeyAttributesInternal + 4) copy];
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (void).cxx_destruct
{
}

@end