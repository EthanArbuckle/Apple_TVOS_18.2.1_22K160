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
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](&OBJC_CLASS___NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"UNPLAYED_EPISODES" value:@"Unplayed Episodes" table:0]);

  return v3;
}

- (id)baseQuery
{
  return +[MPMediaQuery podcastsQuery](&OBJC_CLASS___MPMediaQuery, "podcastsQuery");
}

- (unint64_t)childrenCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collections]);
  v4 = (char *)[v3 count] + 1;

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3)
  {
    v7 = objc_alloc(&OBJC_CLASS___BTAVRCP_PodcastItemsFolder);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PodcastsFolder unplayedEpisodesFolderName](self, "unplayedEpisodesFolderName"));
    *a4 = -[BTAVRCP_VFSFolder initWithName:uid:](v7, "initWithName:uid:", v8, a3);

    id v9 = *a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  &__kCFBooleanFalse,  MPMediaItemPropertyHasBeenPlayed));
    [v9 storePredicate:v10];
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v11 collectionWithUid:a3 property:MPMediaItemPropertyPodcastPersistentID]);

    if (!v10)
    {
      unsigned __int8 v18 = 9;
      goto LABEL_7;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 representativeItem]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForProperty:MPMediaItemPropertyPodcastPersistentID]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 representativeItem]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 valueForProperty:MPMediaItemPropertyPodcastTitle]);

    v16 =  -[BTAVRCP_VFSFolder initWithName:uid:]( [BTAVRCP_PodcastItemsFolder alloc],  "initWithName:uid:",  v15,  [v13 unsignedLongLongValue]);
    *a4 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  v13,  MPMediaItemPropertyPodcastPersistentID));
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionAtIndex:v5]);

    if (!v7)
    {
      v12 = 0LL;
      goto LABEL_7;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForProperty:MPMediaItemPropertyPodcastPersistentID]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 representativeItem]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForProperty:MPMediaItemPropertyPodcastTitle]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyFolderWithType:uid:name:]( self,  "replyFolderWithType:uid:name:",  1LL,  v9,  v11));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[BTAVRCP_VFSFolder uid](self, "uid", 0LL, a4)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PodcastsFolder unplayedEpisodesFolderName](self, "unplayedEpisodesFolderName"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionWithUid:a3 property:MPMediaItemPropertyPodcastPersistentID]);

  if (v5) {
    return 12;
  }
  else {
    return 9;
  }
}

@end