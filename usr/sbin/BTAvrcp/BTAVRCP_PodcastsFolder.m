@interface BTAVRCP_PodcastsFolder
- (id)baseQuery;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (id)unplayedEpisodesFolderName;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_PodcastsFolder

- (id)unplayedEpisodesFolderName
{
  v2 = [NSBundle mobileBluetoothBundle];
  v3 = [v2 localizedStringForKey:@"UNPLAYED_EPISODES" value:@"Unplayed Episodes" table:0];

  return v3;
}

- (id)baseQuery
{
  return +[MPMediaQuery podcastsQuery](&OBJC_CLASS___MPMediaQuery, "podcastsQuery");
}

- (unint64_t)childrenCount
{
  v2 = -[BTAVRCP_VFSFolder query];
  v3 = [v2 collections];
  v4 = (char *)[v3 count] + 1;

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3)
  {
    v7 = objc_alloc(&OBJC_CLASS___BTAVRCP_PodcastItemsFolder);
    v8 = [BTAVRCP_PodcastsFolder unplayedEpisodesFolderName];
    *a4 = -[BTAVRCP_VFSFolder initWithName:uid:](v7, "initWithName:uid:", v8, a3);

    id v9 = *a4;
    v10 = [MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyHasBeenPlayed];
    [v9 storePredicate:v10];
  }

  else
  {
    v11 = -[BTAVRCP_VFSFolder query];
    v10 = [v11 collectionWithUid:a3 property:MPMediaItemPropertyPodcastPersistentID];

    if (!v10)
    {
      unsigned __int8 v18 = 9;
      goto LABEL_7;
    }

    v12 = (void *)[v10 representativeItem];
    v13 = [v12 valueForProperty:MPMediaItemPropertyPodcastPersistentID];

    v14 = [v10 representativeItem];
    v15 = [v14 valueForProperty:MPMediaItemPropertyPodcastTitle];

    v16 =  -[BTAVRCP_VFSFolder initWithName:uid:]( [BTAVRCP_PodcastItemsFolder alloc],  "initWithName:uid:",  v15,  [v13 unsignedLongLongValue]);
    *a4 = v16;
    v17 = [MPMediaPropertyPredicate predicateWithValue:v13 forProperty:MPMediaItemPropertyPodcastPersistentID];
    -[BTAVRCP_VFSFolder storePredicate:](v16, "storePredicate:", v17);
  }

  unsigned __int8 v18 = 4;
LABEL_7:

  return v18;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  if (a3)
  {
    unint64_t v5 = a3 - 1;
    v6 = -[BTAVRCP_VFSFolder query];
    v7 = [v6 collectionAtIndex:v5];

    if (!v7)
    {
      v12 = 0LL;
      goto LABEL_7;
    }

    v8 = [v7 representativeItem];
    id v9 = [v8 valueForProperty:MPMediaItemPropertyPodcastPersistentID];
    v10 = (void *)[v7 representativeItem];
    v11 = [v10 valueForProperty:MPMediaItemPropertyPodcastTitle];
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  1LL,  v9,  v11));
  }

  else
  {
    v7 = [NSNumber numberWithUnsignedLongLong: [self uid:0LL a4]];
    v8 = [BTAVRCP_PodcastsFolder unplayedEpisodesFolderName];
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  1LL,  v7,  v8));
  }

LABEL_7:
  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionWithUid:a3 property:MPMediaItemPropertyPodcastPersistentID]);

  if (v6) {
    return &__NSDictionary0__struct;
  }
  else {
    return 0LL;
  }
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  v4 = -[BTAVRCP_VFSFolder query];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionWithUid:a3 property:MPMediaItemPropertyPodcastPersistentID]);

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

@end