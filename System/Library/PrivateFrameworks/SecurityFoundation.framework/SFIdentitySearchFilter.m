@interface SFIdentitySearchFilter
+ (BOOL)supportsSecureCoding;
- (NSArray)certificateSerialNumbers;
- (NSArray)certificateTypes;
- (NSArray)keySpecifiers;
- (SFIdentitySearchFilter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCertificateSerialNumbers:(id)a3;
- (void)setCertificateTypes:(id)a3;
- (void)setKeySpecifiers:(id)a3;
@end

@implementation SFIdentitySearchFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIdentitySearchFilter)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFIdentitySearchFilter;
  return -[SFIdentitySearchFilter init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setCertificateSerialNumbers:*((void *)self->_identitySearchFilterInternal + 1)];
  [v4 setCertificateTypes:*((void *)self->_identitySearchFilterInternal + 2)];
  [v4 setKeySpecifiers:*((void *)self->_identitySearchFilterInternal + 3)];
  return v4;
}

- (NSArray)certificateSerialNumbers
{
  return (NSArray *)(id)[*((id *)self->_identitySearchFilterInternal + 1) copy];
}

- (void)setCertificateSerialNumbers:(id)a3
{
  uint64_t v4 = [a3 copy];
  identitySearchFilterInternal = self->_identitySearchFilterInternal;
  v6 = (void *)identitySearchFilterInternal[1];
  identitySearchFilterInternal[1] = v4;
}

- (NSArray)certificateTypes
{
  return (NSArray *)(id)[*((id *)self->_identitySearchFilterInternal + 2) copy];
}

- (void)setCertificateTypes:(id)a3
{
  uint64_t v4 = [a3 copy];
  identitySearchFilterInternal = self->_identitySearchFilterInternal;
  v6 = (void *)identitySearchFilterInternal[2];
  identitySearchFilterInternal[2] = v4;
}

- (NSArray)keySpecifiers
{
  return (NSArray *)(id)[*((id *)self->_identitySearchFilterInternal + 3) copy];
}

- (void)setKeySpecifiers:(id)a3
{
  uint64_t v4 = [a3 copy];
  identitySearchFilterInternal = self->_identitySearchFilterInternal;
  v6 = (void *)identitySearchFilterInternal[3];
  identitySearchFilterInternal[3] = v4;
}

- (void).cxx_destruct
{
}

@end