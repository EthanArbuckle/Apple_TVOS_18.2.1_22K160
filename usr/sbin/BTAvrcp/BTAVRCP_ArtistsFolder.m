@interface BTAVRCP_ArtistsFolder
- (BOOL)artistHasSingleAlbum:(id)a3;
- (BOOL)isRecentlyAdded;
- (BOOL)showRecentlyAddedFolder;
- (BTAVRCP_ArtistsFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (BTAVRCP_ArtistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5;
- (id)artistName:(id)a3;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_ArtistsFolder

- (BTAVRCP_ArtistsFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_ArtistsFolder initWithName:uid:isRecentlyAdded:]( self,  "initWithName:uid:isRecentlyAdded:",  a3,  a4,  0LL);
}

- (BTAVRCP_ArtistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BTAVRCP_ArtistsFolder;
  result = -[BTAVRCP_VFSFolder initWithName:uid:](&v7, "initWithName:uid:", a3, a4);
  if (result) {
    result->_isRecentlyAdded = a5;
  }
  return result;
}

- (BOOL)showRecentlyAddedFolder
{
  if (-[BTAVRCP_ArtistsFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    return 0;
  }
  v4 = -[BTAVRCP_VFSFolder query];
  v5 = [v4 collections];
  BOOL v3 = (unint64_t)[v5 count] > 1;

  return v3;
}

- (BOOL)artistHasSingleAlbum:(id)a3
{
  BOOL v3 = [a3 valueForProperty:MPMediaItemCollectionPropertyAlbumCount];
  BOOL v4 = (unint64_t)[v3 unsignedIntegerValue] < 2;

  return v4;
}

- (id)artistName:(id)a3
{
  BOOL v3 = [a3 representativeItem];
  BOOL v4 = [v3 effectiveAlbumArtist];

  if (![v4 length])
  {
    v5 = [NSBundle mobileBluetoothBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"UNKNOWN_ARTIST" value:@"Unknown Artist" table:0];

    BOOL v4 = (void *)v6;
  }

  return v4;
}

- (id)baseQuery
{
  BOOL v3 = +[MPMediaQuery artistsQuery];
  if (-[BTAVRCP_ArtistsFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    uint64_t v4 = 14LL;
  }
  else {
    uint64_t v4 = 3LL;
  }
  [v3 setGroupingType:v4];
  return v3;
}

- (unint64_t)childrenCount
{
  BOOL v3 = -[BTAVRCP_VFSFolder query];
  uint64_t v4 = (void *)[v3 collections];
  id v5 = [v4 count];

  return (unint64_t)v5 + -[BTAVRCP_ArtistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_ArtistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    objc_super v7 = objc_alloc(&OBJC_CLASS___BTAVRCP_ArtistsFolder);
    v8 = [self recentlyAddedFolderName];
    *a4 =  -[BTAVRCP_ArtistsFolder initWithName:uid:isRecentlyAdded:]( v7,  "initWithName:uid:isRecentlyAdded:",  v8,  a3,  1LL);
LABEL_10:
    unsigned __int8 v17 = 4;
    goto LABEL_11;
  }

  v9 = -[BTAVRCP_VFSFolder query];
  v8 = (void *)[v9 collectionWithUid:a3 property:MPMediaItemPropertyAlbumArtistPersistentID];

  if (v8)
  {
    v10 = (void *)[v8 representativeItem];
    v11 = [v10 valueForProperty:MPMediaItemPropertyAlbumArtistPersistentID];

    v12 = -[BTAVRCP_ArtistsFolder artistName:v8];
    if (-[BTAVRCP_ArtistsFolder artistHasSingleAlbum:](self, "artistHasSingleAlbum:", v8))
    {
      v13 =  -[BTAVRCP_VFSFolder initWithName:uid:]( [BTAVRCP_AlbumItemsFolder alloc],  "initWithName:uid:",  v12,  [v11 unsignedLongLongValue]);
      *a4 = v13;
      v14 = (void *)[v8 representativeItem];
      v15 = [v14 predicateForProperty:MPMediaItemPropertyAlbumPersistentID];
      -[BTAVRCP_VFSFolder storePredicate:](v13, "storePredicate:", v15);

      v16 = (BTAVRCP_AlbumsFolder *)*a4;
    }

    else
    {
      v16 =  -[BTAVRCP_AlbumsFolder initWithName:uid:]( [BTAVRCP_AlbumsFolder alloc],  "initWithName:uid:",  v12,  [v11 unsignedLongLongValue]);
      *a4 = v16;
    }

    v18 = [MPMediaPropertyPredicate predicateWithValue:forProperty:v11];
    -[BTAVRCP_VFSFolder storePredicate:](v16, "storePredicate:", v18);

    goto LABEL_10;
  }

  unsigned __int8 v17 = 9;
LABEL_11:

  return v17;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4 = a3;
  if (-[BTAVRCP_ArtistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[BTAVRCP_VFSFolder uid](self, "uid")));
      v9 = [self recentlyAddedFolderName];
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  3LL,  v7,  v9));
LABEL_11:

      goto LABEL_12;
    }

    --v4;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionAtIndex:v4]);

  if (v7)
  {
    unsigned int v8 = -[BTAVRCP_ArtistsFolder artistHasSingleAlbum:](self, "artistHasSingleAlbum:", v7);
    v9 = (void *)[v7 representativeItem];
    v10 = [v9 valueForProperty:MPMediaItemPropertyAlbumArtistPersistentID];
    v11 = -[BTAVRCP_ArtistsFolder artistName:v7];
    if (v8) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = 2LL;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  v12,  v10,  v11));

    goto LABEL_11;
  }

  v13 = 0LL;
LABEL_12:

  return v13;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  uint64_t v6 = (void *)[v5 collectionWithUid:a3 property:MPMediaItemPropertyAlbumArtistPersistentID];

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
  id v5 = [v4 collectionWithUid:a3 property:MPMediaItemPropertyAlbumArtistPersistentID];

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