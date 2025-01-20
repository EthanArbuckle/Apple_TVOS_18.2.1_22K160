@interface PBWorkspaceWindowSceneSpecification
+ (id)definitionWithRole:(id)a3;
- (Class)uiSceneMinimumClass;
@end

@implementation PBWorkspaceWindowSceneSpecification

+ (id)definitionWithRole:(id)a3
{
  id v4 = sub_10010D014(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = objc_alloc_init(&OBJC_CLASS___FBSMutableSceneDefinition);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity localIdentity](&OBJC_CLASS___FBSSceneClientIdentity, "localIdentity"));
  [v6 setClientIdentity:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 specification]);
  [v6 setSpecification:v8];

  [v6 setIdentity:v5];
  return v6;
}

- (Class)uiSceneMinimumClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___PBWorkspaceWindowScene);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

@end