@interface PBWorkspaceSceneDescriptor
- (FBSSceneDefinition)definition;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)role;
- (PBWorkspaceSceneDescriptor)initWithDefinition:(id)a3 role:(id)a4 level:(double)a5;
- (double)level;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation PBWorkspaceSceneDescriptor

- (PBWorkspaceSceneDescriptor)initWithDefinition:(id)a3 role:(id)a4 level:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBWorkspaceSceneDescriptor;
  v10 = -[PBWorkspaceSceneDescriptor init](&v16, "init");
  if (v10)
  {
    v11 = (FBSSceneDefinition *)[v8 copy];
    definition = v10->_definition;
    v10->_definition = v11;

    v13 = (NSString *)[v9 copy];
    role = v10->_role;
    v10->_role = v13;

    v10->_level = a5;
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneDescriptor succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneDescriptor descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_role withName:@"role"];
  id v5 = [v3 appendFloat:@"level" withName:self->_level];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneDescriptor descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeMultilinePrefix]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000FF5C4;
  v10[3] = &unk_1003CFEB8;
  id v7 = v5;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v6 block:v10];

  id v8 = v7;
  return v8;
}

- (FBSSceneDefinition)definition
{
  return self->_definition;
}

- (NSString)role
{
  return self->_role;
}

- (double)level
{
  return self->_level;
}

- (void).cxx_destruct
{
}

@end