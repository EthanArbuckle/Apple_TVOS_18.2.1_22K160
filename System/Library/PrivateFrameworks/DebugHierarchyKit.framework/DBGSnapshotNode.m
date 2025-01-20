@interface DBGSnapshotNode
+ (DBGSnapshotNode)nodeWithIdentifier:(id)a3;
+ (DBGSnapshotNode)nodeWithUniqueIdentifier;
- (BOOL)hasPropertyWithName:(id)a3;
- (DBGSnapshot)snapshot;
- (DBGSnapshotGroup)childGroup;
- (DBGSnapshotNode)initWithIdentifier:(id)a3;
- (DBGSnapshotNode)parentNode;
- (DebugHierarchyRuntimeType)runtimeType;
- (NSArray)additionalGroups;
- (NSMutableDictionary)mutableProperties;
- (NSPointerArray)propertyObservers;
- (NSString)displayName;
- (NSString)identifier;
- (id)_describeTreeWithRoot:(id)a3 depth:(unint64_t)a4;
- (id)allProperties;
- (id)debugDescription;
- (id)debugDescriptionWithIndentationDepth:(unint64_t)a3 prefix:(id)a4 includeProperties:(BOOL)a5;
- (id)groupWithID:(id)a3;
- (id)propertiesMatchingPredicate:(id)a3;
- (id)propertyWithName:(id)a3;
- (id)rootLevelGroup;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)visibility;
- (void)addAdditonalGroup:(id)a3;
- (void)addProperties:(id)a3;
- (void)addProperty:(id)a3;
- (void)addPropertyObserver:(id)a3;
- (void)didUpdateProperty:(id)a3;
- (void)removePropertyObserver:(id)a3;
- (void)setAdditionalGroups:(id)a3;
- (void)setChildGroup:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMutableProperties:(id)a3;
- (void)setParentNode:(id)a3;
- (void)setPropertyObservers:(id)a3;
- (void)setRuntimeType:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setVisibility:(int64_t)a3;
@end

@implementation DBGSnapshotNode

+ (DBGSnapshotNode)nodeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4];

  return (DBGSnapshotNode *)v5;
}

+ (DBGSnapshotNode)nodeWithUniqueIdentifier
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  id v5 = [v2 initWithIdentifier:v4];

  return (DBGSnapshotNode *)v5;
}

- (DBGSnapshotNode)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DBGSnapshotNode;
  v6 = -[DBGSnapshotNode init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutableProperties = v7->_mutableProperties;
    v7->_mutableProperties = (NSMutableDictionary *)v8;

    v7->_visibility = 1LL;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    propertyObservers = v7->_propertyObservers;
    v7->_propertyObservers = (NSPointerArray *)v10;
  }

  return v7;
}

- (NSString)displayName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v4, v5));

  return (NSString *)v6;
}

- (DBGSnapshotGroup)childGroup
{
  return self->_childGroup;
}

- (void)setChildGroup:(id)a3
{
  id v6 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode snapshot](self, "snapshot"));
  -[DBGSnapshotGroup setSnapshot:](self->_childGroup, "setSnapshot:", v5);

  -[DBGSnapshotGroup setParentNode:](self->_childGroup, "setParentNode:", self);
}

- (void)addAdditonalGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode snapshot](self, "snapshot"));
  [v4 setSnapshot:v5];

  [v4 setParentNode:self];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode additionalGroups](self, "additionalGroups"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode additionalGroups](self, "additionalGroups"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 arrayByAddingObject:v4]);
    -[DBGSnapshotNode setAdditionalGroups:](self, "setAdditionalGroups:", v8);
  }

  else
  {
    id v9 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    -[DBGSnapshotNode setAdditionalGroups:](self, "setAdditionalGroups:", v7);
  }
}

- (id)groupWithID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode childGroup](self, "childGroup"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 groupingIdentifier]);
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode childGroup](self, "childGroup"));
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode additionalGroups](self, "additionalGroups", 0LL));
    id v8 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v9);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v12 groupingIdentifier]);
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            id v8 = v12;
            goto LABEL_13;
          }
        }

        id v8 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (id)allProperties
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode mutableProperties](self, "mutableProperties"));
  id v4 = [v3 count];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 instanceProperties]);
  id v7 = [v6 count];

  if (v4 != v7)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType", 0LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 instanceProperties]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectEnumerator]);

    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        unsigned int v14 = 0LL;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v14) name]);
          id v16 = -[DBGSnapshotNode propertyWithName:](self, "propertyWithName:", v15);

          unsigned int v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v12);
    }
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode mutableProperties](self, "mutableProperties"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allValues]);

  return v18;
}

- (BOOL)hasPropertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode mutableProperties](self, "mutableProperties"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  if (v6)
  {
    char v7 = 1;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 propertyWithName:v4]);
    char v7 = v9 != 0LL;
  }

  return v7;
}

- (id)propertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode mutableProperties](self, "mutableProperties"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (!v6)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 propertyWithName:v4]);

    if (v8)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[DBGSnapshotProperty propertyWithDebugHierarchyProperty:]( &OBJC_CLASS___DBGSnapshotProperty,  "propertyWithDebugHierarchyProperty:",  v8));
      -[DBGSnapshotNode addProperty:](self, "addProperty:", v6);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)propertiesMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode allProperties](self, "allProperties"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v4]);

  return v6;
}

- (void)addProperty:(id)a3
{
  id v4 = a3;
  [v4 setSnapshotNode:self];
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode mutableProperties](self, "mutableProperties"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  [v6 setObject:v4 forKey:v5];
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
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
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[DBGSnapshotNode addProperty:](self, "addProperty:", *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyWithName:](self, "propertyWithName:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);

  return v4;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyWithName:](self, "propertyWithName:", v6));
  if ((objc_opt_respondsToSelector(v7, "key") & 1) != 0) {
    [v7 setValue:v8 forKey:v6];
  }
}

- (void)didUpdateProperty:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyObservers](self, "propertyObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) snapshotNode:self didUpdateProperty:v4];
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)addPropertyObserver:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyObservers](self, "propertyObservers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  unsigned __int8 v6 = [v5 containsObject:v8];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyObservers](self, "propertyObservers"));
    [v7 addPointer:v8];
  }
}

- (void)removePropertyObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyObservers](self, "propertyObservers"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  id v7 = [v6 indexOfObject:v4];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode propertyObservers](self, "propertyObservers"));
    [v8 removePointerAtIndex:v7];
  }

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode identifier](self, "identifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  int64_t v9 = -[DBGSnapshotNode visibility](self, "visibility");
  else {
    __int128 v10 = *(&off_20688 + v9 - 1);
  }
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; represents %@ (%@); visibility = %@>",
                    v5,
                    self,
                    v6,
                    v8,
                    v10));

  return v11;
}

- (id)debugDescriptionWithIndentationDepth:(unint64_t)a3 prefix:(id)a4 includeProperties:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (const __CFString *)a4;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([&stru_20CA8 stringByPaddingToLength:a3 withString:@"-" startingAtIndex:0]);
  v25 = (__CFString *)v8;
  if (!v8) {
    id v8 = &stru_20CA8;
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode runtimeType](self, "runtimeType"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode identifier](self, "identifier"));
  v24 = (void *)v9;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@ represents %@ (%@)",  v9,  v8,  self,  v11,  v12));

  if (v5)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode mutableProperties](self, "mutableProperties"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allValues]);

    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v27;
      unint64_t v19 = a3 + 1;
      do
      {
        __int128 v20 = 0LL;
        __int128 v21 = v13;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[DBGSnapshotNode _describeTreeWithRoot:depth:]( self,  "_describeTreeWithRoot:depth:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v20),  v19));
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v21,  v22));

          __int128 v20 = (char *)v20 + 1;
          __int128 v21 = v13;
        }

        while (v17 != v20);
        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v17);
    }
  }

  return v13;
}

- (id)_describeTreeWithRoot:(id)a3 depth:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([&stru_20CA8 stringByPaddingToLength:a4 withString:@"-" startingAtIndex:0]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
  unint64_t v19 = (void *)v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v7, v8));

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = v6;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 allSubproperties]);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    unint64_t v14 = a4 + 1;
    do
    {
      v15 = 0LL;
      id v16 = v9;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[DBGSnapshotNode _describeTreeWithRoot:depth:]( self,  "_describeTreeWithRoot:depth:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v15),  v14));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v16,  v17));

        v15 = (char *)v15 + 1;
        id v16 = v9;
      }

      while (v12 != v15);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }

  return v9;
}

- (id)rootLevelGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotNode parentNode](self, "parentNode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 childGroup]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rootLevelGroup]);

  return v4;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (DebugHierarchyRuntimeType)runtimeType
{
  return (DebugHierarchyRuntimeType *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRuntimeType:(id)a3
{
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (DBGSnapshotNode)parentNode
{
  return (DBGSnapshotNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
}

- (NSArray)additionalGroups
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAdditionalGroups:(id)a3
{
}

- (NSMutableDictionary)mutableProperties
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMutableProperties:(id)a3
{
}

- (NSPointerArray)propertyObservers
{
  return (NSPointerArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPropertyObservers:(id)a3
{
}

- (DBGSnapshot)snapshot
{
  return (DBGSnapshot *)objc_loadWeakRetained((id *)&self->_snapshot);
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end