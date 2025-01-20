@interface PBSystemGestureTable
- (NSMapTable)descriptorsByGestureRecognizer;
- (NSMapTable)handlesBySystemGestureRecipes;
- (NSMutableDictionary)entriesByDescriptor;
- (PBSystemGestureTable)init;
- (PBSystemGestureTableEntry)indirectRecipesEntry;
- (id)_activeHandleForSystemGestureRecipe:(id)a3;
- (id)_deferringTargetHandleForTargetSystemGestureTypes:(id)a3 withSelectionPolicy:(id)a4 deferringPolicy:(id)a5;
- (id)_entryForGestureRecognizerDescriptor:(id)a3;
- (id)_resultsByEnumeratingEntriesForSystemGestureRecipe:(id)a3 usingBlock:(id)a4;
- (id)activateSystemGestureForDescriptor:(id)a3;
- (id)deactivateSystemGestureForDescriptor:(id)a3;
- (id)existingGestureRecognizerMatchingDescriptor:(id)a3;
- (id)existingHandleForSystemGestureRecipe:(id)a3;
- (id)gestureRecognizers;
- (id)handleForGestureRecognizer:(id)a3 withSelectionPolicy:(id)a4;
- (id)handleForGestureRecognizer:(id)a3 withSelectionPolicy:(id)a4 deferringPolicy:(id)a5;
- (id)recipesForGestureRecognizers:(id)a3 withSelectionPolicy:(id)a4;
- (id)removeHandle:(id)a3 forSystemGestureRecipe:(id)a4 options:(unint64_t)a5;
- (id)stateDump;
- (void)_enumerateEntriesForSystemGestureRecipe:(id)a3 usingBlock:(id)a4;
- (void)_removeEntryForGestureRecognizerDescriptor:(id)a3;
- (void)enumerateGestureRecognizersUsingBlock:(id)a3;
- (void)setGestureRecognizer:(id)a3 forGestureRecognizerDescriptor:(id)a4;
- (void)setInactiveHandle:(id)a3 forSystemGestureRecipe:(id)a4;
@end

@implementation PBSystemGestureTable

- (PBSystemGestureTable)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBSystemGestureTable;
  v2 = -[PBSystemGestureTable init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    entriesByDescriptor = v2->_entriesByDescriptor;
    v2->_entriesByDescriptor = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  256LL,  0LL));
    descriptorsByGestureRecognizer = v2->_descriptorsByGestureRecognizer;
    v2->_descriptorsByGestureRecognizer = (NSMapTable *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  0LL,  261LL));
    handlesBySystemGestureRecipes = v2->_handlesBySystemGestureRecipes;
    v2->_handlesBySystemGestureRecipes = (NSMapTable *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___UIGestureRecognizer);
    v10 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureTableEntry);
    indirectRecipesEntry = v2->_indirectRecipesEntry;
    v2->_indirectRecipesEntry = v10;

    -[PBSystemGestureTableEntry setGestureRecognizer:](v2->_indirectRecipesEntry, "setGestureRecognizer:", v9);
  }

  return v2;
}

- (void)enumerateGestureRecognizersUsingBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v5 = self->_descriptorsByGestureRecognizer;
  id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (id)gestureRecognizers
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMapTable count](self->_descriptorsByGestureRecognizer, "count"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = self->_descriptorsByGestureRecognizer;
  id v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
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
          objc_enumerationMutation(v4);
        }
        -[NSMutableArray addObject:]( v3,  "addObject:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  (void)v10);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)existingHandleForSystemGestureRecipe:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_handlesBySystemGestureRecipes,  "objectForKey:",  a3));
}

- (void)setInactiveHandle:(id)a3 forSystemGestureRecipe:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    -[NSMapTable setObject:forKey:](self->_handlesBySystemGestureRecipes, "setObject:forKey:", a3, v6);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000EABB8;
    v7[3] = &unk_1003D67A8;
    id v8 = v6;
    -[PBSystemGestureTable _enumerateEntriesForSystemGestureRecipe:usingBlock:]( self,  "_enumerateEntriesForSystemGestureRecipe:usingBlock:",  v8,  v7);
  }
}

- (id)existingGestureRecognizerMatchingDescriptor:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _entryForGestureRecognizerDescriptor:]( self,  "_entryForGestureRecognizerDescriptor:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 gestureRecognizer]);

  return v4;
}

- (void)setGestureRecognizer:(id)a3 forGestureRecognizerDescriptor:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _entryForGestureRecognizerDescriptor:]( self,  "_entryForGestureRecognizerDescriptor:",  v6));
    [v8 setGestureRecognizer:v7];
    -[NSMapTable setObject:forKey:](self->_descriptorsByGestureRecognizer, "setObject:forKey:", v6, v7);
  }

- (id)recipesForGestureRecognizers:(id)a3 withSelectionPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_descriptorsByGestureRecognizer, "objectForKey:", v13));
        if (v14)
        {
          if (v7)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _entryForGestureRecognizerDescriptor:]( self,  "_entryForGestureRecognizerDescriptor:",  v14));
            v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeSystemGestureRecipeWithSelectionPolicy:v7]);
          }

          else
          {
            v16 = 0LL;
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureTableRecipeResult resultWithGestureRecognizerDescriptor:systemGestureRecipe:]( &OBJC_CLASS___PBSystemGestureTableRecipeResult,  "resultWithGestureRecognizerDescriptor:systemGestureRecipe:",  v14,  v16));
          [v19 setObject:v17 forKey:v13];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  return v19;
}

- (id)activateSystemGestureForDescriptor:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EAEC0;
  v7[3] = &unk_1003D67D0;
  id v8 = a3;
  id v4 = v8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _resultsByEnumeratingEntriesForSystemGestureRecipe:usingBlock:]( self,  "_resultsByEnumeratingEntriesForSystemGestureRecipe:usingBlock:",  v4,  v7));

  return v5;
}

- (id)deactivateSystemGestureForDescriptor:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EAF70;
  v7[3] = &unk_1003D67D0;
  id v8 = a3;
  id v4 = v8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _resultsByEnumeratingEntriesForSystemGestureRecipe:usingBlock:]( self,  "_resultsByEnumeratingEntriesForSystemGestureRecipe:usingBlock:",  v4,  v7));

  return v5;
}

- (id)removeHandle:(id)a3 forSystemGestureRecipe:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_handlesBySystemGestureRecipes, "objectForKey:", v9));
  uint64_t v11 = (void *)v10;
  if (!v10) {
    goto LABEL_5;
  }
  if ((id)v10 == v8)
  {
    -[NSMapTable removeObjectForKey:](self->_handlesBySystemGestureRecipes, "removeObjectForKey:", v9);
LABEL_5:
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000EB094;
    v14[3] = &unk_1003D67F8;
    char v17 = v5 & 1;
    id v15 = v9;
    v16 = self;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _resultsByEnumeratingEntriesForSystemGestureRecipe:usingBlock:]( self,  "_resultsByEnumeratingEntriesForSystemGestureRecipe:usingBlock:",  v15,  v14));

    goto LABEL_6;
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
LABEL_6:

  return v12;
}

- (id)handleForGestureRecognizer:(id)a3 withSelectionPolicy:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable handleForGestureRecognizer:withSelectionPolicy:deferringPolicy:]( self,  "handleForGestureRecognizer:withSelectionPolicy:deferringPolicy:",  a3,  a4,  0LL));
}

- (id)handleForGestureRecognizer:(id)a3 withSelectionPolicy:(id)a4 deferringPolicy:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_descriptorsByGestureRecognizer, "objectForKey:", a3));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _entryForGestureRecognizerDescriptor:]( self,  "_entryForGestureRecognizerDescriptor:",  v10));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeSystemGestureRecipeWithSelectionPolicy:v8]);
  uint64_t v13 = v12;
  if (v12)
  {
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 deferringTargetSystemGestureTypes]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _deferringTargetHandleForTargetSystemGestureTypes:withSelectionPolicy:deferringPolicy:]( self,  "_deferringTargetHandleForTargetSystemGestureTypes:withSelectionPolicy:deferringPolicy:",  v14,  v8,  v9));
    }

    else
    {
      id v15 = 0LL;
    }

    char v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_handlesBySystemGestureRecipes, "objectForKey:", v13));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v13 systemGestureRecognizerDescriptors]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000EB314;
      v21[3] = &unk_1003D6820;
      id v22 = v10;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bs_firstObjectPassingTest:", v21));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureTableHandleResult resultWithHandle:descriptor:deferringTargetHandle:]( &OBJC_CLASS___PBSystemGestureTableHandleResult,  "resultWithHandle:descriptor:deferringTargetHandle:",  v17,  v19,  v15));
    }

    else
    {
      v16 = 0LL;
    }
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (id)stateDump
{
  v8[0] = @"handles.count";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMapTable count](self->_handlesBySystemGestureRecipes, "count")));
  v8[1] = @"entries";
  v9[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_entriesByDescriptor, "allValues"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1003D6860));
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return v6;
}

- (id)_entryForGestureRecognizerDescriptor:(id)a3
{
  id v4 = a3;
  char v5 = (PBSystemGestureTableEntry *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_entriesByDescriptor,  "objectForKey:",  v4));
  if (!v5)
  {
    char v5 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureTableEntry);
    -[NSMutableDictionary setObject:forKey:](self->_entriesByDescriptor, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_removeEntryForGestureRecognizerDescriptor:(id)a3
{
}

- (void)_enumerateEntriesForSystemGestureRecipe:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  unsigned __int8 v20 = 0;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "systemGestureRecognizerDescriptors", 0));
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * v12) gestureRecognizerDescriptor]);
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _entryForGestureRecognizerDescriptor:]( self,  "_entryForGestureRecognizerDescriptor:",  v13));
      v7[2](v7, v14, v13, &v20);
      int v15 = v20;

      if (v15) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_resultsByEnumeratingEntriesForSystemGestureRecipe:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 systemGestureRecognizerDescriptors]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000EB770;
  v14[3] = &unk_1003D6888;
  id v16 = v6;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v8 count]));
  id v15 = v9;
  id v10 = v6;
  -[PBSystemGestureTable _enumerateEntriesForSystemGestureRecipe:usingBlock:]( self,  "_enumerateEntriesForSystemGestureRecipe:usingBlock:",  v7,  v14);

  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

- (id)_activeHandleForSystemGestureRecipe:(id)a3
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1000EB8A4;
  id v10 = &unk_1003D68B0;
  id v12 = &v13;
  id v4 = a3;
  id v11 = v4;
  -[PBSystemGestureTable _enumerateEntriesForSystemGestureRecipe:usingBlock:]( self,  "_enumerateEntriesForSystemGestureRecipe:usingBlock:",  v4,  &v7);
  if (*((_BYTE *)v14 + 24)) {
    char v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_handlesBySystemGestureRecipes,  "objectForKey:",  v4,  v7,  v8,  v9,  v10));
  }
  else {
    char v5 = 0LL;
  }

  _Block_object_dispose(&v13, 8);
  return v5;
}

- (id)_deferringTargetHandleForTargetSystemGestureTypes:(id)a3 withSelectionPolicy:(id)a4 deferringPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = [v8 mutableCopy];
    if ([v11 count])
    {
      while (1)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectEnumerator]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 deferredTargetSystemGestureUsingCandidateTypeEnumerator:v12 selectionPolicy:v9]);

        uint64_t v14 = objc_claimAutoreleasedReturnValue( -[PBSystemGestureTable _activeHandleForSystemGestureRecipe:]( self,  "_activeHandleForSystemGestureRecipe:",  v13));
        if (v14) {
          break;
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v13 type]));
        [v11 removeObject:v15];

        if (![v11 count]) {
          goto LABEL_5;
        }
      }

      char v16 = (void *)v14;
    }

    else
    {
LABEL_5:
      char v16 = 0LL;
    }
  }

  else
  {
    char v16 = 0LL;
  }

  return v16;
}

- (NSMutableDictionary)entriesByDescriptor
{
  return self->_entriesByDescriptor;
}

- (NSMapTable)descriptorsByGestureRecognizer
{
  return self->_descriptorsByGestureRecognizer;
}

- (NSMapTable)handlesBySystemGestureRecipes
{
  return self->_handlesBySystemGestureRecipes;
}

- (PBSystemGestureTableEntry)indirectRecipesEntry
{
  return self->_indirectRecipesEntry;
}

- (void).cxx_destruct
{
}

@end