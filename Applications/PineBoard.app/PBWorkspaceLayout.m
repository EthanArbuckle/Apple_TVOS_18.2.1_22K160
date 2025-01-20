@interface PBWorkspaceLayout
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (PBWorkspaceLayout)init;
- (PBWorkspaceLayout)initWithName:(id)a3 attributes:(id)a4;
- (id)_attributesForKey:(id)a3;
- (id)attributesForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation PBWorkspaceLayout

- (PBWorkspaceLayout)initWithName:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PBWorkspaceLayout;
  v8 = -[PBWorkspaceLayout init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = (NSDictionary *)[v7 copy];
    keyedAttributes = v8->_keyedAttributes;
    v8->_keyedAttributes = v11;
  }

  return v8;
}

- (PBWorkspaceLayout)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  v4 = -[PBWorkspaceLayout initWithName:attributes:](self, "initWithName:attributes:", 0LL, v3);

  return v4;
}

- (id)attributesForKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[PBWorkspaceLayout _attributesForKey:](self, "_attributesForKey:", a3));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBMutableWorkspaceLayout initWithName:attributes:]( +[PBMutableWorkspaceLayout allocWithZone:](&OBJC_CLASS___PBMutableWorkspaceLayout, "allocWithZone:", a3),  "initWithName:attributes:",  self->_name,  self->_keyedAttributes);
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendObject:self->_keyedAttributes];
  id v5 = [v3 hash];

  return (unint64_t)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBWorkspaceLayout));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  keyedAttributes = self->_keyedAttributes;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100055CFC;
  v11[3] = &unk_1003D2130;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v6 appendObject:keyedAttributes counterpart:v11];
  LOBYTE(keyedAttributes) = [v6 isEqual];

  return (char)keyedAttributes;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceLayout succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceLayout descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_name withName:@"name" skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceLayout descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  [v5 appendDictionarySection:self->_keyedAttributes withName:0 skipIfEmpty:1];
  return v5;
}

- (id)_attributesForKey:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_keyedAttributes, "objectForKey:", a3));
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end