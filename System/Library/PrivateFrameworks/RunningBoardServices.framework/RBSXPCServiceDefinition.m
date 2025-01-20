@interface RBSXPCServiceDefinition
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)definitionWithIdentifier:(id)a3 variant:(int64_t)a4 scope:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (RBSXPCServiceDefinition)initWithRBSXPCCoder:(id)a3;
- (int64_t)scope;
- (int64_t)variant;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSXPCServiceDefinition

+ (id)definitionWithIdentifier:(id)a3 variant:(int64_t)a4 scope:(int64_t)a5
{
  id v8 = a3;
  v9 = objc_alloc_init((Class)a1);
  uint64_t v10 = [v8 copy];

  v11 = (void *)v9[1];
  v9[1] = v10;

  v9[2] = a4;
  v9[3] = a5;
  return v9;
}

- (NSString)description
{
  unint64_t variant = self->_variant;
  if (variant > 3) {
    v3 = 0LL;
  }
  else {
    v3 = off_189DE0348[variant];
  }
  unint64_t scope = self->_scope;
  if (scope > 3) {
    v5 = 0LL;
  }
  else {
    v5 = off_189DE0368[scope];
  }
  return (NSString *)[NSString stringWithFormat:@"%@[%@][%@]", self->_identifier, v3, v5];
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_identifier, "hash");
  unint64_t v4 = 0xBF58476D1CE4E5B9LL * (self->_variant ^ ((unint64_t)self->_variant >> 30));
  unint64_t v5 = 0xBF58476D1CE4E5B9LL * (self->_scope ^ ((unint64_t)self->_scope >> 30));
  unint64_t v6 = (0x94D049BB133111EBLL * (v4 ^ (v4 >> 27))) ^ (0x94D049BB133111EBLL * (v5 ^ (v5 >> 27)));
  return v6 ^ v3 ^ (v6 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  uint64_t v6 = [v4 identifier];
  v7 = (void *)v6;
  if ((identifier == (NSString *)v6
     || (identifier ? (BOOL v8 = v6 == 0) : (BOOL v8 = 1), !v8 && -[NSString isEqual:](identifier, "isEqual:", v6)))
    && (int64_t variant = self->_variant, variant == [v4 variant]))
  {
    int64_t scope = self->_scope;
    BOOL v11 = scope == [v4 scope];
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeInt64:self->_variant forKey:@"_variant"];
  [v5 encodeInt64:self->_scope forKey:@"_scope"];
}

- (RBSXPCServiceDefinition)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[RBSXPCServiceDefinition init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_int64_t variant = [v4 decodeInt64ForKey:@"_variant"];
    v5->_int64_t scope = [v4 decodeInt64ForKey:@"_scope"];
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
}

@end