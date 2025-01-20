@interface PBWorkspaceSceneRegistry
- (NSString)debugDescription;
- (NSString)description;
- (PBWorkspaceSceneRegistry)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)enumerateScenesWithBlock:(id)a3;
- (void)registerScene:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)unregisterScene:(id)a3;
@end

@implementation PBWorkspaceSceneRegistry

- (PBWorkspaceSceneRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBWorkspaceSceneRegistry;
  v2 = -[PBWorkspaceSceneRegistry init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    scenes = v2->_scenes;
    v2->_scenes = (NSMutableSet *)v3;
  }

  return v2;
}

- (void)enumerateScenesWithBlock:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_scenes;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)registerScene:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  id v6 = v5;
  Class v7 = NSClassFromString(@"FBScene");
  if (!v6)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002823F4(a2);
    }
LABEL_13:
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x1001124CCLL);
  }

  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBSceneClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002823F4(a2);
    }
    goto LABEL_13;
  }

  if ((-[NSMutableSet containsObject:](self->_scenes, "containsObject:", v6) & 1) == 0)
  {
    id v8 = sub_1000F7BF4();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100282498((uint64_t)self, v6);
    }

    -[NSMutableSet addObject:](self->_scenes, "addObject:", v6);
    [v6 addObserver:self];
  }
}

- (void)unregisterScene:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BSDispatchQueueAssertMain();
    if (-[NSMutableSet containsObject:](self->_scenes, "containsObject:", v4))
    {
      id v5 = sub_1000F7BF4();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_10028251C((uint64_t)self, v4);
      }

      -[NSMutableSet removeObject:](self->_scenes, "removeObject:", v4);
    }

    [v4 removeObserver:self];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneRegistry succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneRegistry descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceSceneRegistry succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendUnsignedInteger:withName:",  -[NSMutableSet count](self->_scenes, "count"),  @"scenes");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceSceneRegistry descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_scenes, "allObjects"));
  Class v7 = (void *)objc_claimAutoreleasedReturnValue([v5 activeMultilinePrefix]);
  [v5 appendArraySection:v6 withName:0 multilinePrefix:v7 skipIfEmpty:0 objectTransformer:&stru_1003D7EC0];

  return v5;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 =  [v3 appendCollection:self->_scenes withKey:@"scenes" skipIfEmpty:0 objectTransformer:&stru_1003D7EE0];
  return v3;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end