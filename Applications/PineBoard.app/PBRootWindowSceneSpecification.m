@interface PBRootWindowSceneSpecification
+ (id)definition;
+ (id)workspaceSceneDescriptor;
- (BOOL)affectsAppLifecycleIfInternal;
- (BOOL)isInternal;
- (Class)uiSceneMinimumClass;
- (id)uiSceneSessionRole;
@end

@implementation PBRootWindowSceneSpecification

+ (id)definition
{
  id v3 = sub_10010D014(@"root");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = objc_alloc_init(&OBJC_CLASS___FBSMutableSceneDefinition);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity localIdentity](&OBJC_CLASS___FBSSceneClientIdentity, "localIdentity"));
  [v5 setClientIdentity:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 specification]);
  [v5 setSpecification:v7];

  [v5 setIdentity:v4];
  return v5;
}

+ (id)workspaceSceneDescriptor
{
  id v3 = objc_alloc(&OBJC_CLASS___PBWorkspaceSceneDescriptor);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 definition]);
  id v5 = -[PBWorkspaceSceneDescriptor initWithDefinition:role:level:]( v3,  "initWithDefinition:role:level:",  v4,  @"root",  0.0);

  return v5;
}

- (id)uiSceneSessionRole
{
  return @"PBRootWindowScene";
}

- (Class)uiSceneMinimumClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS____PBRootWindowScene);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 0;
}

@end