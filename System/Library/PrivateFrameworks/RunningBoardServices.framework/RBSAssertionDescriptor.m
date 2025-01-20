@interface RBSAssertionDescriptor
+ (BOOL)supportsRBSXPCSecureCoding;
+ (RBSAssertionDescriptor)descriptorWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributes;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)explanation;
- (RBSAssertionDescriptor)init;
- (RBSAssertionDescriptor)initWithRBSXPCCoder:(id)a3;
- (RBSAssertionIdentifier)identifier;
- (RBSTarget)target;
- (id)copyWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)_initWithIdentifier:(void *)a3 target:(void *)a4 explanation:(void *)a5 attributes:;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation RBSAssertionDescriptor

+ (RBSAssertionDescriptor)descriptorWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[RBSAssertionDescriptor _initWithIdentifier:target:explanation:attributes:]( objc_alloc(&OBJC_CLASS___RBSAssertionDescriptor),  v12,  v11,  v10,  v9);

  return (RBSAssertionDescriptor *)v13;
}

- (void)_initWithIdentifier:(void *)a3 target:(void *)a4 explanation:(void *)a5 attributes:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)&OBJC_CLASS___RBSAssertionDescriptor;
    a1 = objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      uint64_t v13 = [v9 copy];
      v14 = (void *)a1[1];
      a1[1] = v13;

      uint64_t v15 = [v10 copy];
      v16 = (void *)a1[2];
      a1[2] = v15;

      uint64_t v17 = [v11 copy];
      v18 = (void *)a1[3];
      a1[3] = v17;

      uint64_t v19 = [v12 copy];
      v20 = (void *)a1[4];
      a1[4] = v19;
    }
  }

  return a1;
}

- (RBSAssertionDescriptor)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAssertionDescriptor.m" lineNumber:39 description:@"-init is not allowed on RBSAssertionDescriptor"];

  return 0LL;
}

- (id)copyWithIdentifier:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  unint64_t v3 = -[RBSAssertionIdentifier hash](self->_identifier, "hash");
  unint64_t v4 = -[RBSTarget hash](self->_target, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_explanation, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_attributes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (RBSAssertionDescriptor *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    if ((uint64_t v5 = objc_opt_class(), v5 != objc_opt_class())
      || (identifier = self->_identifier, identifier != v4->_identifier)
      && !-[RBSAssertionIdentifier isEqual:](identifier, "isEqual:")
      || (target = self->_target, target != v4->_target) && !-[RBSTarget isEqual:](target, "isEqual:")
      || (explanation = self->_explanation, explanation != v4->_explanation)
      && !-[NSString isEqualToString:](explanation, "isEqualToString:")
      || (attributes = self->_attributes, attributes != v4->_attributes)
      && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  explanation = self->_explanation;
  identifier = self->_identifier;
  v7 = -[RBSTarget shortDescription](self->_target, "shortDescription");
  v8 = (void *)[v3 initWithFormat:@"<%@| %@ ID:%@ target:%@>", v4, explanation, identifier, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  explanation = self->_explanation;
  identifier = self->_identifier;
  v7 = -[RBSTarget shortDescription](self->_target, "shortDescription");
  v8 = -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", @",\n\t");
  id v9 = (void *)[v3 initWithFormat:@"<%@| %@ ID:%@ target:%@ attributes:[\n\t%@\n\t]>", v4, explanation, identifier, v7, v8];

  return (NSString *)v9;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  -[RBSAssertionDescriptor identifier](self, "identifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"identifier"];

  -[RBSAssertionDescriptor target](self, "target");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"target"];
  v7 = -[RBSAssertionDescriptor explanation](self, "explanation");
  [v4 encodeObject:v7 forKey:@"explanation"];

  -[RBSAssertionDescriptor attributes](self, "attributes");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"attributes"];
}

- (RBSAssertionDescriptor)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explanation"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"attributes"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = (RBSAssertionDescriptor *)-[RBSAssertionDescriptor _initWithIdentifier:target:explanation:attributes:]( self,  v9,  v8,  v5,  v7);
  return v10;
}

- (RBSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (RBSTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
}

@end