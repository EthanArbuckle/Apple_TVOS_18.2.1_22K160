@interface NSSet
+ (id)_gkSetOfResourcesWithIDs:(id)a3;
- (BOOL)_gkContainsExpiredResource;
- (BOOL)_gkContainsInvalidOrExpiredResource;
- (BOOL)_gkContainsInvalidResource;
- (BOOL)_gkContainsObjectPassingPredicate:(id)a3;
- (id)_gkAllRepresentedItems;
- (id)_gkAllResourceIDs;
- (id)_gkExpiredResources;
- (id)_gkInvalidOrExpiredResources;
- (id)_gkInvalidResources;
- (id)_gkResourceWithID:(id)a3;
- (id)_gkResourcesWithIDs:(id)a3;
- (id)_gkValidAndNonExpiredResources;
@end

@implementation NSSet

+ (id)_gkSetOfResourcesWithIDs:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 _gkMapWithBlock:&stru_100270C28]);
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_gkResourcesWithIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
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
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSSet _gkResourceWithID:]( self,  "_gkResourceWithID:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  (void)v13));
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)_gkResourceWithID:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B9DE4;
  block[3] = &unk_10026B670;
  id v9 = a3;
  uint64_t v4 = qword_1002BB588;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_1002BB588, block);
  }
  [(id)qword_1002BB580 setResourceID:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet member:](self, "member:", qword_1002BB580));

  return v6;
}

- (BOOL)_gkContainsObjectPassingPredicate:(id)a3
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B9EF0;
  v6[3] = &unk_100270C50;
  id v4 = a3;
  id v7 = v4;
  id v8 = &v9;
  -[NSSet enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)_gkExpiredResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_100270C90);
}

- (id)_gkInvalidResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_100270CB0);
}

- (id)_gkValidAndNonExpiredResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_100270CD0);
}

- (id)_gkInvalidOrExpiredResources
{
  return -[NSSet objectsPassingTest:](self, "objectsPassingTest:", &stru_100270CF0);
}

- (id)_gkAllRepresentedItems
{
  return -[NSSet _gkDistinctValuesForKeyPath:](self, "_gkDistinctValuesForKeyPath:", @"representedItem");
}

- (id)_gkAllResourceIDs
{
  return -[NSSet _gkDistinctValuesForKeyPath:](self, "_gkDistinctValuesForKeyPath:", @"resourceID");
}

- (BOOL)_gkContainsInvalidOrExpiredResource
{
  return -[NSSet _gkContainsObjectPassingPredicate:](self, "_gkContainsObjectPassingPredicate:", &stru_100270D30);
}

- (BOOL)_gkContainsExpiredResource
{
  return -[NSSet _gkContainsObjectPassingPredicate:](self, "_gkContainsObjectPassingPredicate:", &stru_100270D50);
}

- (BOOL)_gkContainsInvalidResource
{
  return -[NSSet _gkContainsObjectPassingPredicate:](self, "_gkContainsObjectPassingPredicate:", &stru_100270D70);
}

@end