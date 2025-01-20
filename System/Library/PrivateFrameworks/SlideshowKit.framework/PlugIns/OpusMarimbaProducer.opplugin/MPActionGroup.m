@interface MPActionGroup
+ (id)actionGroup;
- (MPActionGroup)init;
- (id)actions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfActions;
- (void)addAction:(id)a3;
- (void)addActions:(id)a3;
- (void)configureAction:(id)a3 atIndex:(int64_t)a4;
- (void)configureTarget;
- (void)copyActions:(id)a3;
- (void)dealloc;
- (void)insertAction:(id)a3 atIndex:(int64_t)a4;
- (void)insertActions:(id)a3 atIndex:(int64_t)a4;
- (void)removeActionsAtIndices:(id)a3;
- (void)removeAllActions;
- (void)setAction:(id)a3;
@end

@implementation MPActionGroup

+ (id)actionGroup
{
  return objc_alloc_init(&OBJC_CLASS___MPActionGroup);
}

- (MPActionGroup)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPActionGroup;
  v2 = -[MPAction init](&v4, "init");
  if (v2) {
    v2->_actions = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPActionGroup;
  -[MPAction dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MPActionGroup;
  id v4 = -[MPAction copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "copyActions:", -[MPActionGroup actions](self, "actions"));
  return v4;
}

- (unint64_t)numberOfActions
{
  return (unint64_t)-[NSMutableArray count](self->_actions, "count");
}

- (id)actions
{
  return self->_actions;
}

- (void)addAction:(id)a3
{
}

- (void)insertAction:(id)a3 atIndex:(int64_t)a4
{
}

- (void)addActions:(id)a3
{
}

- (void)insertActions:(id)a3 atIndex:(int64_t)a4
{
  int64_t v4 = a4;
  -[NSMutableArray insertObjects:atIndexes:]( self->_actions,  "insertObjects:atIndexes:",  a3,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        [v11 setParent:self];
        -[MPActionGroup configureAction:atIndex:](self, "configureAction:atIndex:", v11, (char *)i + v4);
      }

      id v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v4 += (int64_t)i;
    }

    while (v8);
  }

- (void)removeActionsAtIndices:(id)a3
{
  id v5 = -[NSMutableArray objectsAtIndexes:](self->_actions, "objectsAtIndexes:");
  -[NSMutableArray removeObjectsAtIndexes:](self->_actions, "removeObjectsAtIndexes:", a3);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setParent:0];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

- (void)removeAllActions
{
}

- (void)copyActions:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) copy];
        -[MPActionGroup addAction:](self, "addAction:", v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

- (void)configureAction:(id)a3 atIndex:(int64_t)a4
{
  if (self->super._action)
  {
    id v7 = [a3 targetObject];
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPAnimationTrigger, v8);
    if ((objc_opt_isKindOfClass(a3, v9) & 1) != 0)
    {
      __int128 v11 = +[MCAnimationTrigger animationTriggerForTargetPlugObjectID:withAnimationKey:]( MCAnimationTrigger,  "animationTriggerForTargetPlugObjectID:withAnimationKey:",  [v7 objectID],  objc_msgSend(a3, "animationKey"));
    }

    else
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPActionTrigger, v10);
      if ((objc_opt_isKindOfClass(a3, v12) & 1) != 0)
      {
        __int128 v11 = +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:]( MCActionTrigger,  "actionTriggerForTargetPlugObjectID:withActionKey:",  [v7 objectID],  objc_msgSend(a3, "actionKey"));
      }

      else
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPStateOperation, v13);
        if ((objc_opt_isKindOfClass(a3, v14) & 1) != 0)
        {
          __int128 v11 = +[MCStateOperationExpression stateOperationForTargetPlugObjectID:withStateKey:andExpression:]( MCStateOperationExpression,  "stateOperationForTargetPlugObjectID:withStateKey:andExpression:",  [v7 objectID],  objc_msgSend(a3, "stateKey"),  objc_msgSend(a3, "operation"));
        }

        else
        {
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___MPConditionalAction, v15);
          if ((objc_opt_isKindOfClass(a3, v16) & 1) != 0)
          {
            __int128 v11 = +[MCConditionalAction conditionalActionWithPredicate:]( MCConditionalAction,  "conditionalActionWithPredicate:",  [v7 objectID]);
          }

          else
          {
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___MPActionGroup, v17);
            if ((objc_opt_isKindOfClass(a3, v18) & 1) != 0)
            {
              __int128 v11 = +[MCActionGroup actionGroup](&OBJC_CLASS___MCActionGroup, "actionGroup");
            }

            else
            {
              uint64_t v20 = objc_opt_class(&OBJC_CLASS___MPGenericAction, v19);
              if ((objc_opt_isKindOfClass(a3, v20) & 1) != 0)
              {
                __int128 v11 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:]( MCGenericAction,  "genericActionForTargetPlugObjectID:withAttributes:",  [v7 objectID],  objc_msgSend(a3, "attributes"));
              }

              else
              {
                uint64_t v22 = objc_opt_class(&OBJC_CLASS___MPTransitionAction, v21);
                if ((objc_opt_isKindOfClass(a3, v22) & 1) == 0)
                {
                  v23 = 0LL;
                  goto LABEL_18;
                }

                __int128 v11 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  [v7 objectID],  objc_msgSend(a3, "transitionID"));
              }
            }
          }
        }
      }
    }

    v23 = v11;
LABEL_18:
    -[MCAction insertAction:atIndex:](self->super._action, "insertAction:atIndex:", v23, a4);
    [a3 setAction:v23];
  }

- (void)configureTarget
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MPActionGroup;
  -[MPAction configureTarget](&v12, "configureTarget");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  actions = self->_actions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v8,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(actions);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) configureTarget];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v8,  v13,  16LL);
    }

    while (v5);
  }

- (void)setAction:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MPActionGroup;
  -[MPAction setAction:](&v14, "setAction:", a3);
  if (-[MPAction parentDocument](self, "parentDocument"))
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    actions = self->_actions;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0LL;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(actions);
          }
          -[MPActionGroup configureAction:atIndex:]( self,  "configureAction:atIndex:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)i),  (char *)i + v7);
        }

        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( actions,  "countByEnumeratingWithState:objects:count:",  &v10,  v15,  16LL);
        v7 += (uint64_t)i;
      }

      while (v6);
    }
  }

@end