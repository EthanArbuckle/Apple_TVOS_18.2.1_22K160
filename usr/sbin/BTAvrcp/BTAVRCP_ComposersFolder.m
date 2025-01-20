@interface BTAVRCP_ComposersFolder
- (BOOL)composerHasSingleAlbum:(id)a3;
- (BOOL)isRecentlyAdded;
- (BOOL)showRecentlyAddedFolder;
- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_ComposersFolder

- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_ComposersFolder initWithName:uid:isRecentlyAdded:]( self,  "initWithName:uid:isRecentlyAdded:",  a3,  a4,  0LL);
}

- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BTAVRCP_ComposersFolder;
  result = -[BTAVRCP_VFSFolder initWithName:uid:](&v7, "initWithName:uid:", a3, a4);
  if (result) {
    result->_isRecentlyAdded = a5;
  }
  return result;
}

- (BOOL)showRecentlyAddedFolder
{
  if (-[BTAVRCP_ComposersFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collections]);
  BOOL v3 = (unint64_t)[v5 count] > 1;

  return v3;
}

- (BOOL)composerHasSingleAlbum:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForProperty:MPMediaItemCollectionPropertyAlbumCount]);
  BOOL v4 = (unint64_t)[v3 unsignedIntegerValue] < 2;

  return v4;
}

- (id)baseQuery
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery composersQuery](&OBJC_CLASS___MPMediaQuery, "composersQuery"));
  if (-[BTAVRCP_ComposersFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    [v3 setGroupingType:15];
  }
  return v3;
}

- (unint64_t)childrenCount
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collections]);
  id v5 = [v4 count];

  return (unint64_t)v5 + -[BTAVRCP_ComposersFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_ComposersFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    objc_super v7 = objc_alloc(&OBJC_CLASS___BTAVRCP_ComposersFolder);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
    *a4 =  -[BTAVRCP_ComposersFolder initWithName:uid:isRecentlyAdded:]( v7,  "initWithName:uid:isRecentlyAdded:",  v8,  a3,  1LL);
LABEL_10:
    unsigned __int8 v18 = 4;
    goto LABEL_11;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionWithUid:a3 property:MPMediaItemPropertyComposerPersistentID]);

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 representativeItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:MPMediaItemPropertyComposerPersistentID]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 representativeItem]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:MPMediaItemPropertyComposer]);

    if (-[BTAVRCP_ComposersFolder composerHasSingleAlbum:](self, "composerHasSingleAlbum:", v8))
    {
      v14 =  -[BTAVRCP_VFSFolder initWithName:uid:]( [BTAVRCP_AlbumItemsFolder alloc],  "initWithName:uid:",  v13,  [v11 unsignedLongLongValue]);
      *a4 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 representativeItem]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 predicateForProperty:MPMediaItemPropertyAlbumPersistentID]);
      -[BTAVRCP_VFSFolder storePredicate:](v14, "storePredicate:", v16);

      v17 = (BTAVRCP_AlbumsFolder *)*a4;
    }

    else
    {
      v17 =  -[BTAVRCP_AlbumsFolder initWithName:uid:]( [BTAVRCP_AlbumsFolder alloc],  "initWithName:uid:",  v13,  [v11 unsignedLongLongValue]);
      *a4 = v17;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  v11,  MPMediaItemPropertyComposerPersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v17, "storePredicate:", v19);

    goto LABEL_10;
  }

  unsigned __int8 v18 = 9;
LABEL_11:

  return v18;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4 = a3;
  if (-[BTAVRCP_ComposersFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[BTAVRCP_VFSFolder uid](self, "uid")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  3LL,  v7,  v9));
LABEL_11:

      goto LABEL_12;
    }

    --v4;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionAtIndex:v4]);

  if (v7)
  {
    unsigned int v8 = -[BTAVRCP_ComposersFolder composerHasSingleAlbum:](self, "composerHasSingleAlbum:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:MPMediaItemPropertyComposerPersistentID]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForProperty:MPMediaItemPropertyComposer]);
    if (v8) {
      uint64_t v13 = 1LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  v13,  v10,  v12));

    goto LABEL_11;
  }

  v14 = 0LL;
LABEL_12:

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionWithUid:a3 property:MPMediaItemPropertyComposerPersistentID]);

  if (v6) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0LL;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionWithUid:a3 property:MPMediaItemPropertyComposerPersistentID]);

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

- (BOOL)isRecentlyAdded
{
  return self->_isRecentlyAdded;
}

@end