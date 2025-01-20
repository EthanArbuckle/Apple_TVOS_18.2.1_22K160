@interface PBSystemGestureTableEntry
- (BOOL)isEmpty;
- (BOOL)isSystemGestureRecipeActive:(id)a3;
- (NSMutableOrderedSet)activeDescriptorStack;
- (NSMutableSet)descriptors;
- (PBSystemGestureTableEntry)init;
- (UIGestureRecognizer)gestureRecognizer;
- (id)_resultWithMutationBlock:(id)a3;
- (id)activateSystemGestureRecipe:(id)a3;
- (id)activeSystemGestureRecipeWithSelectionPolicy:(id)a3;
- (id)deactivateSystemGestureRecipe:(id)a3;
- (id)removeSystemGestureRecipe:(id)a3;
- (id)stateDump;
- (void)addSystemGestureRecipe:(id)a3;
- (void)setGestureRecognizer:(id)a3;
@end

@implementation PBSystemGestureTableEntry

- (PBSystemGestureTableEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBSystemGestureTableEntry;
  v2 = -[PBSystemGestureTableEntry init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    descriptors = v2->_descriptors;
    v2->_descriptors = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    activeDescriptorStack = v2->_activeDescriptorStack;
    v2->_activeDescriptorStack = v5;
  }

  return v2;
}

- (BOOL)isEmpty
{
  return !-[NSMutableSet count](self->_descriptors, "count")
      && -[NSMutableOrderedSet count](self->_activeDescriptorStack, "count") == 0LL;
}

- (void)addSystemGestureRecipe:(id)a3
{
}

- (id)removeSystemGestureRecipe:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000EBBD8;
  v6[3] = &unk_1003CFEB8;
  v7 = self;
  id v8 = a3;
  id v3 = v8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureTableEntry _resultWithMutationBlock:](v7, "_resultWithMutationBlock:", v6));

  return v4;
}

- (id)activateSystemGestureRecipe:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000EBC94;
  v6[3] = &unk_1003CFEB8;
  v7 = self;
  id v8 = a3;
  id v3 = v8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureTableEntry _resultWithMutationBlock:](v7, "_resultWithMutationBlock:", v6));

  return v4;
}

- (id)deactivateSystemGestureRecipe:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000EBD50;
  v6[3] = &unk_1003CFEB8;
  v7 = self;
  id v8 = a3;
  id v3 = v8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureTableEntry _resultWithMutationBlock:](v7, "_resultWithMutationBlock:", v6));

  return v4;
}

- (BOOL)isSystemGestureRecipeActive:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_activeDescriptorStack, "containsObject:", a3);
}

- (id)activeSystemGestureRecipeWithSelectionPolicy:(id)a3
{
  id v4 = a3;
  activeDescriptorStack = self->_activeDescriptorStack;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet reverseObjectEnumerator](activeDescriptorStack, "reverseObjectEnumerator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 selectSystemGestureUsingActiveRecipeEnumerator:v6]);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](activeDescriptorStack, "lastObject"));
  }

  return v7;
}

- (id)stateDump
{
  v10[0] = @"gestureRecognizer";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:",  self->_gestureRecognizer));
  v11[0] = v3;
  v10[1] = @"available";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_descriptors, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1003D68F0));
  v11[1] = v5;
  v10[2] = @"active";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_activeDescriptorStack, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_map:", &stru_1003D6910));
  v11[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

- (id)_resultWithMutationBlock:(id)a3
{
  descriptors = self->_descriptors;
  v5 = (void (**)(void))a3;
  id v6 = -[NSMutableSet count](descriptors, "count");
  id v7 = -[NSMutableOrderedSet count](self->_activeDescriptorStack, "count");
  v5[2](v5);

  return (id)objc_claimAutoreleasedReturnValue( +[PBSystemGestureTableChangeResult resultWithGestureRecognizer:count:previousCount:activeCount:previousActiveCount:]( &OBJC_CLASS___PBSystemGestureTableChangeResult,  "resultWithGestureRecognizer:count:previousCount:activeCount:previousActiveCount:",  self->_gestureRecognizer,  -[NSMutableSet count](self->_descriptors, "count"),  v6,  -[NSMutableOrderedSet count](self->_activeDescriptorStack, "count"),  v7));
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (NSMutableSet)descriptors
{
  return self->_descriptors;
}

- (NSMutableOrderedSet)activeDescriptorStack
{
  return self->_activeDescriptorStack;
}

- (void).cxx_destruct
{
}

@end