@interface BTAVRCP_GenresFolder
- (BOOL)isRecentlyAdded;
- (BOOL)showRecentlyAddedFolder;
- (BTAVRCP_GenresFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (BTAVRCP_GenresFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5;
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_GenresFolder

- (BTAVRCP_GenresFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_GenresFolder initWithName:uid:isRecentlyAdded:]( self,  "initWithName:uid:isRecentlyAdded:",  a3,  a4,  0LL);
}

- (BTAVRCP_GenresFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BTAVRCP_GenresFolder;
  result = -[BTAVRCP_VFSFolder initWithName:uid:](&v7, "initWithName:uid:", a3, a4);
  if (result) {
    result->_isRecentlyAdded = a5;
  }
  return result;
}

- (BOOL)showRecentlyAddedFolder
{
  if (-[BTAVRCP_GenresFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collections]);
  BOOL v3 = (unint64_t)[v5 count] > 1;

  return v3;
}

- (id)baseQuery
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery genresQuery](&OBJC_CLASS___MPMediaQuery, "genresQuery"));
  if (-[BTAVRCP_GenresFolder isRecentlyAdded](self, "isRecentlyAdded")) {
    [v3 setGroupingType:16];
  }
  return v3;
}

- (unint64_t)childrenCount
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collections]);
  id v5 = [v4 count];

  return (unint64_t)v5 + -[BTAVRCP_GenresFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_GenresFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    objc_super v7 = objc_alloc(&OBJC_CLASS___BTAVRCP_GenresFolder);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
    *a4 =  -[BTAVRCP_GenresFolder initWithName:uid:isRecentlyAdded:]( v7,  "initWithName:uid:isRecentlyAdded:",  v8,  a3,  1LL);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionWithUid:a3 property:MPMediaItemPropertyGenrePersistentID]);

    if (!v8)
    {
      unsigned __int8 v16 = 9;
      goto LABEL_8;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 representativeItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:MPMediaItemPropertyGenrePersistentID]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 representativeItem]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:MPMediaItemPropertyGenre]);

    v14 =  -[BTAVRCP_ArtistsFolder initWithName:uid:]( [BTAVRCP_ArtistsFolder alloc],  "initWithName:uid:",  v13,  [v11 unsignedLongLongValue]);
    *a4 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  v11,  MPMediaItemPropertyGenrePersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v14, "storePredicate:", v15);
  }

  unsigned __int8 v16 = 4;
LABEL_8:

  return v16;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4 = a3;
  if (-[BTAVRCP_GenresFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[BTAVRCP_VFSFolder uid](self, "uid")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  4LL,  v7,  v8));
      goto LABEL_8;
    }

    --v4;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionAtIndex:v4]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:MPMediaItemPropertyGenrePersistentID]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:MPMediaItemPropertyGenre]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  3LL,  v9,  v11));

LABEL_8:
    goto LABEL_9;
  }

  v12 = 0LL;
LABEL_9:

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionWithUid:a3 property:MPMediaItemPropertyGenrePersistentID]);

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
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionWithUid:a3 property:MPMediaItemPropertyGenrePersistentID]);

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