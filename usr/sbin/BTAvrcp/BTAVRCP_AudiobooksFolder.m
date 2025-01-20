@interface BTAVRCP_AudiobooksFolder
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_AudiobooksFolder

- (id)baseQuery
{
  return +[MPMediaQuery audiobooksQuery](&OBJC_CLASS___MPMediaQuery, "audiobooksQuery");
}

- (unint64_t)childrenCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collections]);
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionWithUid:a3 property:MPMediaItemPropertyAlbumPersistentID]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:MPMediaItemPropertyAlbumPersistentID]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:MPMediaItemPropertyAlbumTitle]);

    v12 =  -[BTAVRCP_VFSFolder initWithName:uid:]( [BTAVRCP_AudiobookItemsFolder alloc],  "initWithName:uid:",  v11,  [v9 unsignedLongLongValue]);
    *a4 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  v9,  MPMediaItemPropertyAlbumPersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v12, "storePredicate:", v13);

    unsigned __int8 v14 = 4;
  }

  else
  {
    unsigned __int8 v14 = 9;
  }

  return v14;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionAtIndex:a3]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:MPMediaItemPropertyAlbumPersistentID]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:MPMediaItemPropertyAlbumTitle]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  1LL,  v9,  v11));
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionWithUid:a3 property:MPMediaItemPropertyAlbumPersistentID]);

  if (v6) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0LL;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionWithUid:a3 property:MPMediaItemPropertyAlbumPersistentID]);

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

@end