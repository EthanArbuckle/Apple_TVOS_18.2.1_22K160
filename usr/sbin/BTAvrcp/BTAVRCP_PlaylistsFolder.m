@interface BTAVRCP_PlaylistsFolder
- (BOOL)isRecentlyAdded;
- (BOOL)playlistIsFolder:(id)a3;
- (BOOL)showRecentlyAddedFolder;
- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 parentPlaylistID:(id)a5 isRecentlyAdded:(BOOL)a6;
- (NSNumber)parentPlaylistID;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_PlaylistsFolder

- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:]( self,  "initWithName:uid:parentPlaylistID:isRecentlyAdded:",  a3,  a4,  &off_100019B08,  0LL);
}

- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 parentPlaylistID:(id)a5 isRecentlyAdded:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BTAVRCP_PlaylistsFolder;
  v12 = -[BTAVRCP_VFSFolder initWithName:uid:](&v15, "initWithName:uid:", a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parentPlaylistID, a5);
    v13->_isRecentlyAdded = a6;
  }

  return v13;
}

- (BOOL)showRecentlyAddedFolder
{
  if (-[BTAVRCP_PlaylistsFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    return 0;
  }
  v4 = -[BTAVRCP_PlaylistsFolder parentPlaylistID];
  if ([v4 isEqualToNumber:&off_100019B08])
  {
    v5 = -[BTAVRCP_VFSFolder query];
    v6 = [v5 collections];
    BOOL v3 = (unint64_t)[v6 count] > 1;
  }

  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)playlistIsFolder:(id)a3
{
  BOOL v3 = [a3 valueForProperty:MPMediaPlaylistPropertyIsFolder];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)baseQuery
{
  if (-[BTAVRCP_PlaylistsFolder isRecentlyAdded](self, "isRecentlyAdded"))
  {
    BOOL v3 = +[MPMediaQuery playlistsRecentlyAddedQuery];
  }

  else
  {
    BOOL v3 = [+[MPMediaQuery playlistsQuery] autorelease];
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PlaylistsFolder parentPlaylistID](self, "parentPlaylistID"));
    v5 = [MPMediaPropertyPredicate predicateWithValue:v4 forProperty:MPMediaPlaylistPropertyParentPersistentID];
    [v3 addFilterPredicate:v5];
  }

  return v3;
}

- (unint64_t)childrenCount
{
  BOOL v3 = [self query];
  unsigned __int8 v4 = (void *)[v3 collections];
  id v5 = [v4 count];

  return (unint64_t)v5 + -[BTAVRCP_PlaylistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_PlaylistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    v7 = objc_alloc(&OBJC_CLASS___BTAVRCP_PlaylistsFolder);
    v8 = -[BTAVRCP_VFSFolder recentlyAddedFolderName];
    v9 = [self parentPlaylistID];
    *a4 =  -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:]( v7,  "initWithName:uid:parentPlaylistID:isRecentlyAdded:",  v8,  a3,  v9,  1LL);
LABEL_10:

    unsigned __int8 v12 = 4;
    goto LABEL_11;
  }

  v10 = -[BTAVRCP_VFSFolder query];
  v8 = (void *)[v10 collectionWithUid:a3 property:MPMediaPlaylistPropertyPersistentID];

  if (v8)
  {
    v9 = [v8 valueForProperty:MPMediaPlaylistPropertyPersistentID];
    id v11 = [v8 valueForProperty:MPMediaPlaylistPropertyName];
    if (-[BTAVRCP_PlaylistsFolder playlistIsFolder:](self, "playlistIsFolder:", v8))
    {
      *a4 =  -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:]( [BTAVRCP_PlaylistsFolder alloc],  "initWithName:uid:parentPlaylistID:isRecentlyAdded:",  v11,  [v9 unsignedLongLongValue],  v9,  0);
    }

    else
    {
      v13 =  -[BTAVRCP_VFSFolder initWithName:uid:]( [BTAVRCP_PlaylistItemsFolder alloc],  "initWithName:uid:",  v11,  [v9 unsignedLongLongValue]);
      *a4 = v13;
      v14 = [MPMediaPropertyPredicate predicateWithValue:v9 forProperty:MPMediaPlaylistPropertyPersistentID];
      -[BTAVRCP_VFSFolder storePredicate:](v13, "storePredicate:", v14);
    }

    goto LABEL_10;
  }

  unsigned __int8 v12 = 9;
LABEL_11:

  return v12;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4 = a3;
  if (-[BTAVRCP_PlaylistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      v7 = [NSNumber numberWithUnsignedLongLong:[self uid]];
      v9 = [self recentlyAddedFolderName];
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  5LL,  v7,  v9));
LABEL_11:

      goto LABEL_12;
    }

    --v4;
  }

  v6 = -[BTAVRCP_VFSFolder query];
  v7 = [v6 collectionAtIndex:v4];

  if (v7)
  {
    unsigned int v8 = -[BTAVRCP_PlaylistsFolder playlistIsFolder:](self, "playlistIsFolder:", v7);
    v9 = [v7 valueForProperty:MPMediaPlaylistPropertyPersistentID];
    v10 = [v7 valueForProperty:MPMediaPlaylistPropertyName];
    if (v8) {
      uint64_t v11 = 5LL;
    }
    else {
      uint64_t v11 = 1LL;
    }
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  v11,  v9,  v10));

    goto LABEL_11;
  }

  unsigned __int8 v12 = 0LL;
LABEL_12:

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v5 = [self query:a3, a4];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionWithUid:a3 property:MPMediaPlaylistPropertyPersistentID]);

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
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionWithUid:a3 property:MPMediaPlaylistPropertyPersistentID]);

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

- (NSNumber)parentPlaylistID
{
  return self->_parentPlaylistID;
}

- (BOOL)isRecentlyAdded
{
  return self->_isRecentlyAdded;
}

- (void).cxx_destruct
{
}

@end