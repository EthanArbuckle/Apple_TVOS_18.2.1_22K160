@interface PBSystemGestureSetupAssistantSelectionPolicy
- (BOOL)_isSystemGestureRecipeAllowed:(id)a3;
- (BOOL)performsSelectiveFiltering;
- (BSIntegerSet)allowedSystemGestures;
- (PBSystemGestureSetupAssistantSelectionPolicy)init;
- (PBSystemGestureSetupAssistantSelectionPolicy)initWithAllowedSystemGestureTypes:(id)a3;
- (id)_findFirstAllowedSystemGestureRecipe:(id)a3;
- (id)selectSystemGestureUsingActiveRecipeEnumerator:(id)a3;
@end

@implementation PBSystemGestureSetupAssistantSelectionPolicy

- (PBSystemGestureSetupAssistantSelectionPolicy)initWithAllowedSystemGestureTypes:(id)a3
{
  id v5 = a3;
  Class v6 = NSClassFromString(@"BSIntegerSet");
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002794F4(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
    JUMPOUT(0x100092750LL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:BSIntegerSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002794F4(a2);
    }
    goto LABEL_11;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBSystemGestureSetupAssistantSelectionPolicy;
  v7 = -[PBSystemGestureSetupAssistantSelectionPolicy init](&v12, "init");
  if (v7)
  {
    v8 = (BSIntegerSet *)[v5 copy];
    allowedSystemGestures = v7->_allowedSystemGestures;
    v7->_allowedSystemGestures = v8;
  }

  return v7;
}

- (PBSystemGestureSetupAssistantSelectionPolicy)init
{
  id v3 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerSet);
  [v3 addValue:1];
  [v3 addValue:6];
  [v3 addValue:23];
  if (_os_feature_enabled_impl("PineBoard", "PressToDictate"))
  {
    [v3 addValue:40];
    [v3 addValue:41];
    [v3 addValue:42];
  }

  [v3 addValue:44];
  [v3 addValue:45];
  [v3 addValue:24];
  [v3 addValue:26];
  [v3 addValue:27];
  [v3 addValue:25];
  id v4 = [v3 copy];

  id v5 = -[PBSystemGestureSetupAssistantSelectionPolicy initWithAllowedSystemGestureTypes:]( self,  "initWithAllowedSystemGestureTypes:",  v4);
  return v5;
}

- (BOOL)performsSelectiveFiltering
{
  return 1;
}

- (id)selectSystemGestureUsingActiveRecipeEnumerator:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureSetupAssistantSelectionPolicy _findFirstAllowedSystemGestureRecipe:]( self,  "_findFirstAllowedSystemGestureRecipe:",  v4));
  if (v5)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (-[PBSystemGestureSetupAssistantSelectionPolicy _isSystemGestureRecipeAllowed:]( self,  "_isSystemGestureRecipeAllowed:",  v11,  (void)v15))
          {
            id v12 = [v11 level];
            if ((uint64_t)v12 > (uint64_t)[v5 level])
            {
              id v13 = v11;

              id v5 = v13;
            }
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    if (!-[PBSystemGestureSetupAssistantSelectionPolicy _isSystemGestureRecipeAllowed:]( self,  "_isSystemGestureRecipeAllowed:",  v5))
    {

      id v5 = 0LL;
    }
  }

  return v5;
}

- (id)_findFirstAllowedSystemGestureRecipe:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nextObject]);
  if (v5)
  {
    do
    {
      if (-[PBSystemGestureSetupAssistantSelectionPolicy _isSystemGestureRecipeAllowed:]( self,  "_isSystemGestureRecipeAllowed:",  v5))
      {
        break;
      }

      uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 nextObject]);

      id v5 = (void *)v6;
    }

    while (v6);
  }

  return v5;
}

- (BOOL)_isSystemGestureRecipeAllowed:(id)a3
{
  return -[BSIntegerSet containsValue:]( self->_allowedSystemGestures,  "containsValue:",  [a3 type]);
}

- (BSIntegerSet)allowedSystemGestures
{
  return self->_allowedSystemGestures;
}

- (void).cxx_destruct
{
}

  ;
}

@end