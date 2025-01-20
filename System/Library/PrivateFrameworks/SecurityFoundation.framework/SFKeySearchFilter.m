@interface SFKeySearchFilter
+ (BOOL)supportsSecureCoding;
- (NSArray)domains;
- (NSArray)specifiers;
- (SFKeySearchFilter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDomains:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation SFKeySearchFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFKeySearchFilter)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFKeySearchFilter;
  return -[SFKeySearchFilter init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSpecifiers:*((void *)self->_keySearchFilterInternal + 1)];
  [v4 setDomains:*((void *)self->_keySearchFilterInternal + 2)];
  return v4;
}

- (NSArray)specifiers
{
  return (NSArray *)(id)[*((id *)self->_keySearchFilterInternal + 1) copy];
}

- (void)setSpecifiers:(id)a3
{
  uint64_t v4 = [a3 copy];
  keySearchFilterInternal = self->_keySearchFilterInternal;
  v6 = (void *)keySearchFilterInternal[1];
  keySearchFilterInternal[1] = v4;
}

- (NSArray)domains
{
  return (NSArray *)(id)[*((id *)self->_keySearchFilterInternal + 2) copy];
}

- (void)setDomains:(id)a3
{
  uint64_t v4 = [a3 copy];
  keySearchFilterInternal = self->_keySearchFilterInternal;
  v6 = (void *)keySearchFilterInternal[2];
  keySearchFilterInternal[2] = v4;
}

- (void).cxx_destruct
{
}

@end