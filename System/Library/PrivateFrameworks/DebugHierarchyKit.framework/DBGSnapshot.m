@interface DBGSnapshot
- (DBGSnapshot)init;
- (DBGSnapshotManager)snapshotManager;
- (NSArray)rootLevelSnapshotGroups;
- (NSMapTable)identifierToNodeMap;
- (NSMutableArray)rootLevelGroups;
- (NSString)identifier;
- (id)_recursivelyDescribeGroup:(id)a3 withIndentation:(unint64_t)a4 isAdditonalGroup:(BOOL)a5 includeProperties:(BOOL)a6;
- (id)_recursivelyDescribeNode:(id)a3 withIndentation:(unint64_t)a4 includeProperties:(BOOL)a5;
- (id)debugDescription;
- (id)nodesKindOfRuntimeClass:(id)a3;
- (id)nodesMatchingPredicate:(id)a3;
- (id)recursiveDescriptionIncludingProperties:(BOOL)a3;
- (id)rootLevelSnapshotGroupWithIdentifier:(id)a3;
- (void)addRootLevelGroup:(id)a3;
- (void)clearData;
- (void)setRootLevelGroups:(id)a3;
- (void)setSnapshotManager:(id)a3;
@end

@implementation DBGSnapshot

- (DBGSnapshot)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DBGSnapshot;
  v2 = -[DBGSnapshot init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    rootLevelGroups = v2->_rootLevelGroups;
    v2->_rootLevelGroups = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    identifierToNodeMap = v2->_identifierToNodeMap;
    v2->_identifierToNodeMap = (NSMapTable *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v8;
  }

  return v2;
}

- (void)addRootLevelGroup:(id)a3
{
  id v4 = a3;
  -[DBGSnapshot willChangeValueForKey:](self, "willChangeValueForKey:", @"rootLevelSnapshotGroups");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot rootLevelGroups](self, "rootLevelGroups", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * v9) groupingIdentifier]);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 groupingIdentifier]);
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v4 setSnapshot:self];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot rootLevelGroups](self, "rootLevelGroups"));
  [v13 addObject:v4];

  -[DBGSnapshot didChangeValueForKey:](self, "didChangeValueForKey:", @"rootLevelSnapshotGroups");
}

- (void)clearData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot rootLevelGroups](self, "rootLevelGroups"));
  [v3 removeAllObjects];

  -[DBGSnapshot didChangeValueForKey:](self, "didChangeValueForKey:", @"rootLevelSnapshotGroups");
}

- (id)nodesMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot identifierToNodeMap](self, "identifierToNodeMap", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectEnumerator]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  id v13 = [v5 copy];
  return v13;
}

- (id)nodesKindOfRuntimeClass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot identifierToNodeMap](self, "identifierToNodeMap", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectEnumerator]);

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 runtimeType]);
        unsigned int v14 = [v13 isKindOfTypeWithName:v4];

        if (v14) {
          [v5 addObject:v12];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  id v15 = [v5 copy];
  return v15;
}

- (id)rootLevelSnapshotGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot rootLevelSnapshotGroups](self, "rootLevelSnapshotGroups", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0LL;
    objc_super v11 = v8;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)v10);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 groupingIdentifier]);
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if ((v13 & 1) != 0) {
        break;
      }
      uint64_t v10 = (char *)v10 + 1;
      objc_super v11 = v8;
      if (v7 == v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v8 = 0LL;
  }

  return v8;
}

- (NSArray)rootLevelSnapshotGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshot rootLevelGroups](self, "rootLevelGroups"));
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (id)debugDescription
{
  return -[DBGSnapshot recursiveDescriptionIncludingProperties:](self, "recursiveDescriptionIncludingProperties:", 1LL);
}

- (id)recursiveDescriptionIncludingProperties:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshot rootLevelGroups](self, "rootLevelGroups"));
  id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    id v8 = &stru_20CA8;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v8;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[DBGSnapshot _recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:]( self,  "_recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9),  0LL,  0LL,  v3));
        id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@\n",  v10,  v11));

        uint64_t v9 = (char *)v9 + 1;
        uint64_t v10 = v8;
      }

      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  else
  {
    id v8 = &stru_20CA8;
  }

  return v8;
}

- (id)_recursivelyDescribeGroup:(id)a3 withIndentation:(unint64_t)a4 isAdditonalGroup:(BOOL)a5 includeProperties:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([&stru_20CA8 stringByPaddingToLength:a4 withString:@"-" startingAtIndex:0]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
  v23 = (void *)v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v10, v11));

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v24 = v9;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    unint64_t v17 = a4 + 1;
    do
    {
      __int128 v18 = 0LL;
      __int128 v19 = v12;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        if (v7)
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v26 + 1) + 8 * (void)v18) debugDescriptionWithIndentationDepth:v17 prefix:@"(REFERENCE)" includeProperties:v6]);
          v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@ #REFERENCE#",  v19,  v20);
        }

        else
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[DBGSnapshot _recursivelyDescribeNode:withIndentation:includeProperties:]( self,  "_recursivelyDescribeNode:withIndentation:includeProperties:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v18),  v17,  v6));
          v21 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v19, v20);
        }

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v21);

        __int128 v18 = (char *)v18 + 1;
        __int128 v19 = v12;
      }

      while (v15 != v18);
      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }

  return v12;
}

- (id)_recursivelyDescribeNode:(id)a3 withIndentation:(unint64_t)a4 includeProperties:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescriptionWithIndentationDepth:a4 prefix:0 includeProperties:v5]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 childGroup]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  id v12 = [v11 count];

  if (v12)
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 childGroup]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[DBGSnapshot _recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:]( self,  "_recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:",  v13,  a4 + 1,  0LL,  v5));

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v9, v14));
    id v9 = (void *)v15;
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = v8;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 additionalGroups]);
  id v16 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    unint64_t v19 = a4 + 1;
    do
    {
      __int128 v20 = 0LL;
      v21 = v9;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = objc_claimAutoreleasedReturnValue( -[DBGSnapshot _recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:]( self,  "_recursivelyDescribeGroup:withIndentation:isAdditonalGroup:includeProperties:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v20),  v19,  1LL,  v5));
        v23 = self;
        BOOL v24 = v5;
        v25 = (void *)v22;
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v21,  v22));

        BOOL v5 = v24;
        self = v23;
        __int128 v20 = (char *)v20 + 1;
        v21 = v9;
      }

      while (v17 != v20);
      id v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v17);
  }

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSMapTable)identifierToNodeMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMutableArray)rootLevelGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRootLevelGroups:(id)a3
{
}

- (DBGSnapshotManager)snapshotManager
{
  return (DBGSnapshotManager *)objc_loadWeakRetained((id *)&self->_snapshotManager);
}

- (void)setSnapshotManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end