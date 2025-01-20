@interface SHLLibraryChangeset
- (NSArray)groupIDsToDelete;
- (NSArray)groupsToAdd;
- (NSArray)groupsToDelete;
- (NSArray)trackIDsToDelete;
- (NSArray)tracksToAdd;
- (NSArray)tracksToDelete;
- (NSMutableSet)groupSetToAdd;
- (NSMutableSet)groupSetToDelete;
- (NSMutableSet)trackSetToAdd;
- (NSMutableSet)trackSetToDelete;
- (SHLLibraryChangeset)init;
- (id)description;
- (void)addGroups:(id)a3;
- (void)addTracks:(id)a3;
- (void)deleteGroups:(id)a3;
- (void)deleteTracks:(id)a3;
- (void)mergeChangeset:(id)a3;
- (void)setGroupSetToAdd:(id)a3;
- (void)setGroupSetToDelete:(id)a3;
- (void)setTrackSetToAdd:(id)a3;
- (void)setTrackSetToDelete:(id)a3;
@end

@implementation SHLLibraryChangeset

- (SHLLibraryChangeset)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHLLibraryChangeset;
  v2 = -[SHLLibraryChangeset init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    trackSetToAdd = v2->_trackSetToAdd;
    v2->_trackSetToAdd = (NSMutableSet *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    trackSetToDelete = v2->_trackSetToDelete;
    v2->_trackSetToDelete = (NSMutableSet *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    groupSetToAdd = v2->_groupSetToAdd;
    v2->_groupSetToAdd = (NSMutableSet *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    groupSetToDelete = v2->_groupSetToDelete;
    v2->_groupSetToDelete = (NSMutableSet *)v9;
  }

  return v2;
}

- (NSArray)tracksToAdd
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToAdd](self, "trackSetToAdd"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (NSArray)tracksToDelete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToDelete](self, "trackSetToDelete"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (NSArray)groupsToAdd
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToAdd](self, "groupSetToAdd"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (NSArray)groupsToDelete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToDelete](self, "groupSetToDelete"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  return (NSArray *)v3;
}

- (NSArray)trackIDsToDelete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToDelete](self, "trackSetToDelete"));
  uint64_t v3 = NSStringFromSelector("identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@distinctUnionOfObjects.%@",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKeyPath:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  return (NSArray *)v7;
}

- (NSArray)groupIDsToDelete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToDelete](self, "groupSetToDelete"));
  uint64_t v3 = NSStringFromSelector("identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@distinctUnionOfObjects.%@",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKeyPath:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  return (NSArray *)v7;
}

- (void)addTracks:(id)a3
{
  id v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToDelete](self, "trackSetToDelete"));
  [v4 intersectSet:v5];

  if ([v4 count])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Should not try to save and delete tracks at the same time: %@",  v4));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v7));

    objc_exception_throw(v8);
    -[SHLLibraryChangeset deleteTracks:](v9, v10, v11);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToAdd](self, "trackSetToAdd"));
    [v6 addObjectsFromArray:v12];
  }

- (void)deleteTracks:(id)a3
{
  id v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToAdd](self, "trackSetToAdd"));
  [v4 intersectSet:v5];

  if ([v4 count])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Should not try to save and delete tracks at the same time: %@",  v4));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v7));

    objc_exception_throw(v8);
    -[SHLLibraryChangeset addGroups:](v9, v10, v11);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToDelete](self, "trackSetToDelete"));
    [v6 addObjectsFromArray:v12];
  }

- (void)addGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToDelete](self, "groupSetToDelete"));
  [v5 intersectSet:v6];

  if ([v5 count])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Should not try to save and delete groups at the same time: %@",  v5));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v16));

    objc_exception_throw(v17);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToAdd](self, "groupSetToAdd"));
        [v13 addObject:v12];

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToAdd](self, "trackSetToAdd"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 tracksToSave]);
        [v14 addObjectsFromArray:v15];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }
}

- (void)deleteGroups:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToAdd](self, "groupSetToAdd"));
  [v4 intersectSet:v5];

  if ([v4 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Should not try to save and delete groups at the same time: %@",  v4));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException shl_exceptionWithName:reason:]( &OBJC_CLASS___NSException,  "shl_exceptionWithName:reason:",  NSInvalidArgumentException,  v7));

    objc_exception_throw(v8);
    -[SHLLibraryChangeset mergeChangeset:](v9, v10, v11);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupSetToDelete](self, "groupSetToDelete"));
    [v6 addObjectsFromArray:v12];
  }

- (void)mergeChangeset:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tracksToAdd]);
    -[SHLLibraryChangeset addTracks:](self, "addTracks:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tracksToDelete]);
    -[SHLLibraryChangeset deleteTracks:](self, "deleteTracks:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 groupsToAdd]);
    -[SHLLibraryChangeset addGroups:](self, "addGroups:", v7);

    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 groupsToDelete]);
    -[SHLLibraryChangeset deleteGroups:](self, "deleteGroups:", v8);
  }

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset trackSetToAdd](self, "trackSetToAdd"));
  id v4 = [v3 count];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset tracksToDelete](self, "tracksToDelete"));
  id v6 = [v5 count];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupsToAdd](self, "groupsToAdd"));
  id v8 = [v7 count];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryChangeset groupsToDelete](self, "groupsToDelete"));
  SEL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"T: +%lu -%lu G: +%lu -%lu",  v4,  v6,  v8,  [v9 count]));

  return v10;
}

- (NSMutableSet)trackSetToAdd
{
  return self->_trackSetToAdd;
}

- (void)setTrackSetToAdd:(id)a3
{
}

- (NSMutableSet)trackSetToDelete
{
  return self->_trackSetToDelete;
}

- (void)setTrackSetToDelete:(id)a3
{
}

- (NSMutableSet)groupSetToAdd
{
  return self->_groupSetToAdd;
}

- (void)setGroupSetToAdd:(id)a3
{
}

- (NSMutableSet)groupSetToDelete
{
  return self->_groupSetToDelete;
}

- (void)setGroupSetToDelete:(id)a3
{
}

- (void).cxx_destruct
{
}

@end