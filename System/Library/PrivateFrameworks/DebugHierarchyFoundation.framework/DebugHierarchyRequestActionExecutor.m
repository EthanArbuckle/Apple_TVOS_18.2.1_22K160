@interface DebugHierarchyRequestActionExecutor
+ (DebugHierarchyRequestActionExecutor)actionExecutorWithContext:(id)a3;
+ (id)finalActionsFromActions:(id)a3;
+ (id)initialActionsFromActions:(id)a3;
+ (id)objectTargetedActionsFromActions:(id)a3;
+ (void)_executeObjectActions:(id)a3 withObject:(id)a4 inContext:(id)a5;
+ (void)_executeStandaloneActions:(id)a3 inContext:(id)a4;
- (BOOL)allObjectActionsTargetIdentifiers:(id *)a3;
- (DebugHierarchyRequestActionExecutor)initWithContext:(id)a3;
- (DebugHierarchyRequestExecutionContext)context;
- (NSArray)finalActions;
- (NSArray)initialActions;
- (NSArray)objectActions;
- (void)executeActionsWithObject:(id)a3;
- (void)executeFinalStandaloneActions;
- (void)executeInitialStandaloneActions;
- (void)setContext:(id)a3;
@end

@implementation DebugHierarchyRequestActionExecutor

+ (DebugHierarchyRequestActionExecutor)actionExecutorWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithContext:v4];

  return (DebugHierarchyRequestActionExecutor *)v5;
}

- (DebugHierarchyRequestActionExecutor)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DebugHierarchyRequestActionExecutor;
  v6 = -[DebugHierarchyRequestActionExecutor init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (NSArray)initialActions
{
  initialActions = self->_initialActions;
  if (!initialActions)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor context](self, "context"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 actions]);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequestActionExecutor initialActionsFromActions:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "initialActionsFromActions:",  v6));
    v8 = self->_initialActions;
    self->_initialActions = v7;

    initialActions = self->_initialActions;
  }

  return initialActions;
}

- (NSArray)finalActions
{
  finalActions = self->_finalActions;
  if (!finalActions)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor context](self, "context"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 actions]);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequestActionExecutor finalActionsFromActions:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "finalActionsFromActions:",  v6));
    v8 = self->_finalActions;
    self->_finalActions = v7;

    finalActions = self->_finalActions;
  }

  return finalActions;
}

- (NSArray)objectActions
{
  objectActions = self->_objectActions;
  if (!objectActions)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor context](self, "context"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 actions]);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequestActionExecutor objectTargetedActionsFromActions:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "objectTargetedActionsFromActions:",  v6));
    v8 = self->_objectActions;
    self->_objectActions = v7;

    objectActions = self->_objectActions;
  }

  return objectActions;
}

+ (id)initialActionsFromActions:(id)a3
{
  id v3 = a3;
  if (![v3 count]) {
    goto LABEL_7;
  }
  uint64_t v4 = 0LL;
  while (1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v4]);
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", 0, v4));

  if (!v6)
  {
LABEL_7:
    if ([v3 count]) {
      id v6 = v3;
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

+ (id)finalActionsFromActions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v3 count])
  {
    unint64_t v5 = 0LL;
    unsigned __int8 v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:v5]);
      v8 = v7;
      if ((v6 & 1) != 0)
      {
        if ([v7 conformsToProtocol:&OBJC_PROTOCOL___DebugHierarchyRequestStandaloneAction]) {
          [v4 addObject:v8];
        }
        unsigned __int8 v6 = 1;
      }

      else
      {
        unsigned __int8 v6 = [v7 conformsToProtocol:&OBJC_PROTOCOL___DebugHierarchyRequestObjectAction];
      }

      ++v5;
    }

    while ((unint64_t)[v3 count] > v5);
  }

  id v9 = [v4 copy];

  return v9;
}

+ (id)objectTargetedActionsFromActions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend( v10,  "conformsToProtocol:",  &OBJC_PROTOCOL___DebugHierarchyRequestObjectAction,  (void)v13)) {
          [v4 addObject:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (void)executeInitialStandaloneActions
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor initialActions](self, "initialActions"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor context](self, "context"));
  +[DebugHierarchyRequestActionExecutor _executeStandaloneActions:inContext:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "_executeStandaloneActions:inContext:",  v4,  v3);
}

- (void)executeFinalStandaloneActions
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor finalActions](self, "finalActions"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor context](self, "context"));
  +[DebugHierarchyRequestActionExecutor _executeStandaloneActions:inContext:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "_executeStandaloneActions:inContext:",  v4,  v3);
}

- (void)executeActionsWithObject:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor objectActions](self, "objectActions"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor context](self, "context"));
  +[DebugHierarchyRequestActionExecutor _executeObjectActions:withObject:inContext:]( &OBJC_CLASS___DebugHierarchyRequestActionExecutor,  "_executeObjectActions:withObject:inContext:",  v6,  v4,  v5);
}

+ (void)_executeStandaloneActions:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) performInContext:v6];
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

+ (void)_executeObjectActions:(id)a3 withObject:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) performInContext:v9 withObject:v8];
        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (BOOL)allObjectActionsTargetIdentifiers:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestActionExecutor objectActions](self, "objectActions"));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v17 = 0LL;
        unsigned __int8 v12 = [v11 targetsObjectIdentifiers:&v17];
        id v13 = v17;
        __int128 v14 = v13;
        if ((v12 & 1) == 0)
        {

          BOOL v15 = 0;
          goto LABEL_11;
        }

        [v5 addObjectsFromArray:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  *a3 = [v5 copy];
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (DebugHierarchyRequestExecutionContext)context
{
  return (DebugHierarchyRequestExecutionContext *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end