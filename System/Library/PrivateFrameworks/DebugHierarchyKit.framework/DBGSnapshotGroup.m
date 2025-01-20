@interface DBGSnapshotGroup
+ (id)strongObjectsGroupWithIdentifier:(id)a3;
+ (id)weakObjectsGroupWithIdentifier:(id)a3;
- (DBGSnapshot)snapshot;
- (DBGSnapshotGroup)initWithIdentifier:(id)a3 usingStrongChildNodeReferences:(BOOL)a4;
- (DBGSnapshotNode)parentNode;
- (NSArray)allObjects;
- (NSPointerArray)objects;
- (NSString)defaultDisplayName;
- (NSString)groupingIdentifier;
- (id)debugDescription;
- (id)displayName;
- (id)rootLevelGroup;
- (int64_t)fetchStatus;
- (void)addObject:(id)a3;
- (void)setDefaultDisplayName:(id)a3;
- (void)setFetchStatus:(int64_t)a3;
- (void)setParentNode:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation DBGSnapshotGroup

+ (id)strongObjectsGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4 usingStrongChildNodeReferences:1];

  return v5;
}

+ (id)weakObjectsGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4 usingStrongChildNodeReferences:0];

  return v5;
}

- (DBGSnapshotGroup)initWithIdentifier:(id)a3 usingStrongChildNodeReferences:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DBGSnapshotGroup;
  v8 = -[DBGSnapshotGroup init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupingIdentifier, a3);
    if (a4) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSPointerArray strongObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "strongObjectsPointerArray"));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    }
    objects = v9->_objects;
    v9->_objects = (NSPointerArray *)v10;
  }

  return v9;
}

- (void)addObject:(id)a3
{
  id v12 = a3;
  -[DBGSnapshotGroup willChangeValueForKey:](self, "willChangeValueForKey:", @"allObjects");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup snapshot](self, "snapshot"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifierToNodeMap]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  [v5 setObject:v12 forKey:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup snapshot](self, "snapshot"));
  [v12 setSnapshot:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup parentNode](self, "parentNode"));
  v9 = (DBGSnapshotGroup *)objc_claimAutoreleasedReturnValue([v8 childGroup]);

  if (v9 == self)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup parentNode](self, "parentNode"));
    [v12 setParentNode:v10];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup objects](self, "objects"));
  objc_msgSend(v11, "dbg_addObject:", v12);

  -[DBGSnapshotGroup didChangeValueForKey:](self, "didChangeValueForKey:", @"allObjects");
}

- (NSArray)allObjects
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup objects](self, "objects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (id)displayName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup defaultDisplayName](self, "defaultDisplayName"));
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup groupingIdentifier](self, "groupingIdentifier"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"."]);
    v3 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  }

  return v3;
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup description](self, "description"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup groupingIdentifier](self, "groupingIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ – %@", v3, v4));

  return v5;
}

- (id)rootLevelGroup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup parentNode](self, "parentNode"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotGroup parentNode](self, "parentNode"));
    id v5 = (DBGSnapshotGroup *)objc_claimAutoreleasedReturnValue([v4 rootLevelGroup]);
  }

  else
  {
    id v5 = self;
  }

  return v5;
}

- (NSString)groupingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)defaultDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDefaultDisplayName:(id)a3
{
}

- (int64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(int64_t)a3
{
  self->_fetchStatus = a3;
}

- (DBGSnapshot)snapshot
{
  return (DBGSnapshot *)objc_loadWeakRetained((id *)&self->_snapshot);
}

- (void)setSnapshot:(id)a3
{
}

- (DBGSnapshotNode)parentNode
{
  return (DBGSnapshotNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
}

- (NSPointerArray)objects
{
  return (NSPointerArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end