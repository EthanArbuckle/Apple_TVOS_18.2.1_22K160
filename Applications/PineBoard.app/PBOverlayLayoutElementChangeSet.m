@interface PBOverlayLayoutElementChangeSet
+ (id)emptyChangeSet;
- (BOOL)isEmpty;
- (NSArray)updatedElements;
- (NSMapTable)controllerMapping;
- (PBOverlayLayoutElementChangeSet)initWithUpdatedElements:(id)a3;
- (id)elementForIdentifier:(id)a3;
- (unint64_t)count;
- (void)enumerateUpdatesUsingBlock:(id)a3;
@end

@implementation PBOverlayLayoutElementChangeSet

+ (id)emptyChangeSet
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001153F0;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470F60 != -1) {
    dispatch_once(&qword_100470F60, block);
  }
  return (id)qword_100470F58;
}

- (PBOverlayLayoutElementChangeSet)initWithUpdatedElements:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutElementChangeSet;
  v5 = -[PBOverlayLayoutElementChangeSet init](&v21, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable mapTableWithKeyOptions:valueOptions:]( &OBJC_CLASS___NSMapTable,  "mapTableWithKeyOptions:valueOptions:",  256LL,  0LL));
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_100115568;
    v18 = &unk_1003D7FD8;
    v19 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
    v7 = v6;
    v20 = v7;
    v8 = v19;
    [v4 enumerateObjectsUsingBlock:&v15];
    v9 = objc_alloc(&OBJC_CLASS___NSArray);
    v10 = -[NSArray initWithArray:](v9, "initWithArray:", v8, v15, v16, v17, v18);
    updatedElements = v5->_updatedElements;
    v5->_updatedElements = v10;

    controllerMapping = v5->_controllerMapping;
    v5->_controllerMapping = v7;
    v13 = v7;
  }

  return v5;
}

- (unint64_t)count
{
  return -[NSArray count](self->_updatedElements, "count");
}

- (BOOL)isEmpty
{
  return -[PBOverlayLayoutElementChangeSet count](self, "count") == 0;
}

- (void)enumerateUpdatesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    v5 = self->_controllerMapping;
    id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
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
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_controllerMapping, "objectForKey:", v10, (void)v13));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self->_updatedElements, "objectsAtIndexes:", v11));
          v4[2](v4, v10, v12);
        }

        id v7 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (id)elementForIdentifier:(id)a3
{
  id v4 = a3;
  updatedElements = self->_updatedElements;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100115850;
  v9[3] = &unk_1003D5568;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray bs_firstObjectPassingTest:](updatedElements, "bs_firstObjectPassingTest:", v9));

  return v7;
}

- (NSArray)updatedElements
{
  return self->_updatedElements;
}

- (NSMapTable)controllerMapping
{
  return self->_controllerMapping;
}

- (void).cxx_destruct
{
}

@end