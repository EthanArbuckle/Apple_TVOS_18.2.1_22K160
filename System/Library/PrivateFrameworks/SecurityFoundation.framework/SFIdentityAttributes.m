@interface SFIdentityAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCertificate;
- (NSString)identityName;
- (NSString)localizedDescription;
- (NSString)localizedLabel;
- (NSString)persistentIdentifier;
- (NSString)privateKeyDomain;
- (SFIdentityAttributes)initWithCoder:(id)a3;
- (_SFKeySpecifier)keySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIdentityName:(id)a3;
- (void)setKeySpecifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedLabel:(id)a3;
@end

@implementation SFIdentityAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIdentityAttributes)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFIdentityAttributes;
  return -[SFIdentityAttributes init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setLocalizedLabel:*((void *)self->_identityAttributesInternal + 1)];
  [v4 setLocalizedDescription:*((void *)self->_identityAttributesInternal + 2)];
  [v4 setKeySpecifier:*((void *)self->_identityAttributesInternal + 3)];
  [v4 setIdentityName:*((void *)self->_identityAttributesInternal + 4)];
  return v4;
}

- (NSString)localizedLabel
{
  return (NSString *)(id)[*((id *)self->_identityAttributesInternal + 1) copy];
}

- (void)setLocalizedLabel:(id)a3
{
  uint64_t v4 = [a3 copy];
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[1];
  identityAttributesInternal[1] = v4;
}

- (NSString)localizedDescription
{
  return (NSString *)(id)[*((id *)self->_identityAttributesInternal + 2) copy];
}

- (void)setLocalizedDescription:(id)a3
{
  uint64_t v4 = [a3 copy];
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[2];
  identityAttributesInternal[2] = v4;
}

- (_SFKeySpecifier)keySpecifier
{
  return (_SFKeySpecifier *)(id)[*((id *)self->_identityAttributesInternal + 3) copy];
}

- (void)setKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[3];
  identityAttributesInternal[3] = v4;
}

- (NSString)identityName
{
  return (NSString *)(id)[*((id *)self->_identityAttributesInternal + 4) copy];
}

- (void)setIdentityName:(id)a3
{
  uint64_t v4 = [a3 copy];
  identityAttributesInternal = self->_identityAttributesInternal;
  v6 = (void *)identityAttributesInternal[4];
  identityAttributesInternal[4] = v4;
}

- (BOOL)hasCertificate
{
  return *((_BYTE *)self->_identityAttributesInternal + 48);
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (NSString)privateKeyDomain
{
  return self->_privateKeyDomain;
}

- (void).cxx_destruct
{
}

@end