@interface DebugHierarchyRuntimeInfo
+ (id)runtimeInfoWithSerializedRepresentation:(id)a3;
- (DebugHierarchyRuntimeInfo)init;
- (DebugHierarchyRuntimeInfo)initWithSerializedRepresentation:(id)a3;
- (NSMutableDictionary)typeMap;
- (id)_describeTreeWithRoot:(id)a3 depth:(unint64_t)a4 description:(id)a5;
- (id)_topLevelTypes;
- (id)debugDescription;
- (id)serializedRepresentation;
- (id)typeOfObject:(id)a3;
- (id)typeWithName:(id)a3;
- (void)_recursivelyIndexRuntimeType:(id)a3;
- (void)_recursivelyMergeInRuntimeType:(id)a3;
- (void)_reindexAllTypes;
- (void)addType:(id)a3 toParentType:(id)a4;
- (void)clearData;
- (void)mergeWith:(id)a3;
- (void)setTypeMap:(id)a3;
@end

@implementation DebugHierarchyRuntimeInfo

+ (id)runtimeInfoWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithSerializedRepresentation:v4];

  return v5;
}

- (DebugHierarchyRuntimeInfo)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = -[DebugHierarchyRuntimeInfo init](self, "init");
  if (v5)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRuntimeType typeWithDictionaryRepresentation:]( &OBJC_CLASS___DebugHierarchyRuntimeType,  "typeWithDictionaryRepresentation:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  (void)v13));
          -[DebugHierarchyRuntimeInfo _recursivelyIndexRuntimeType:](v5, "_recursivelyIndexRuntimeType:", v11);

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

  return v5;
}

- (DebugHierarchyRuntimeInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DebugHierarchyRuntimeInfo;
  v2 = -[DebugHierarchyRuntimeInfo init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    typeMap = v2->_typeMap;
    v2->_typeMap = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (void)addType:(id)a3 toParentType:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
  [v7 setObject:v9 forKey:v8];

  [v6 addSubtype:v9];
}

- (id)typeWithName:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)typeOfObject:(id)a3
{
  id v4 = (objc_class *)objc_opt_class(a3, a2);
  id v5 = v4;
  if (v4)
  {
    if (object_isClass(v4))
    {
      id v6 = NSStringFromClass(v5);
      id v5 = (objc_class *)objc_claimAutoreleasedReturnValue(v6);
    }

    else
    {
      id v5 = 0LL;
    }
  }

  if (-[objc_class length](v5, "length"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_reindexAllTypes
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo _topLevelTypes](self, "_topLevelTypes"));
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
          objc_enumerationMutation(v3);
        }
        -[DebugHierarchyRuntimeInfo _recursivelyIndexRuntimeType:]( self,  "_recursivelyIndexRuntimeType:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)_recursivelyIndexRuntimeType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  [v5 setObject:v4 forKeyedSubscript:v6];

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtypes", 0));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[DebugHierarchyRuntimeInfo _recursivelyIndexRuntimeType:]( self,  "_recursivelyIndexRuntimeType:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11));
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (id)serializedRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo _topLevelTypes](self, "_topLevelTypes"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v2 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v8),  "dictionaryRepresentation",  (void)v12));
        [v3 addObject:v9];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = [v3 copy];
  return v10;
}

- (id)_topLevelTypes
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 parentType]);

        if (!v11) {
          [v3 addObject:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = [v3 copy];
  return v12;
}

- (void)mergeWith:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 _topLevelTypes]);
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[DebugHierarchyRuntimeInfo _recursivelyMergeInRuntimeType:]( self,  "_recursivelyMergeInRuntimeType:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }

    -[DebugHierarchyRuntimeInfo _reindexAllTypes](self, "_reindexAllTypes");
  }

- (void)_recursivelyMergeInRuntimeType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtypes", 0));
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        __int128 v12 = 0LL;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          -[DebugHierarchyRuntimeInfo _recursivelyMergeInRuntimeType:]( self,  "_recursivelyMergeInRuntimeType:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12));
          __int128 v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v10);
    }
  }

  else
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 parentType]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v15]);

    -[DebugHierarchyRuntimeInfo addType:toParentType:](self, "addType:toParentType:", v4, v16);
  }
}

- (void)clearData
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo typeMap](self, "typeMap"));
  [v2 removeAllObjects];
}

- (id)debugDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo description](self, "description"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"\n"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRuntimeInfo _topLevelTypes](self, "_topLevelTypes"));
  id v6 = [v5 mutableCopy];

  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"name",  1LL));
    v22 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    [v6 sortUsingDescriptors:v8];
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      __int128 v13 = 0LL;
      __int128 v14 = v4;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRuntimeInfo _describeTreeWithRoot:depth:description:]( self,  "_describeTreeWithRoot:depth:description:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13),  0LL,  &stru_214E8,  (void)v17));
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:v15]);

        __int128 v13 = (char *)v13 + 1;
        __int128 v14 = v4;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  return v4;
}

- (id)_describeTreeWithRoot:(id)a3 depth:(unint64_t)a4 description:(id)a5
{
  id v8 = a3;
  unint64_t v9 = a4 + 1;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([&stru_214E8 stringByPaddingToLength:v9 withString:@"-" startingAtIndex:0]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescription]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@ %@\n",  v10,  v11,  v12));

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 subtypes]);
  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      __int128 v18 = 0LL;
      __int128 v19 = v13;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRuntimeInfo _describeTreeWithRoot:depth:description:]( self,  "_describeTreeWithRoot:depth:description:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v18),  v9,  v19));

        __int128 v18 = (char *)v18 + 1;
        __int128 v19 = v13;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v16);
  }

  return v13;
}

- (NSMutableDictionary)typeMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTypeMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end