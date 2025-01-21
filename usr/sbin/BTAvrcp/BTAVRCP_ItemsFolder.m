@interface BTAVRCP_ItemsFolder
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (id)targetApp;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
@end

@implementation BTAVRCP_ItemsFolder

- (id)targetApp
{
  return 0LL;
}

- (unint64_t)childrenCount
{
  v2 = -[BTAVRCP_VFSFolder query];
  v3 = [v2 items];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  v5 = -[BTAVRCP_VFSFolder query:a3:a4];
  v6 = [v5 itemWithUid:a3];

  if (v6) {
    return 8;
  }
  else {
    return 9;
  }
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6 = a4;
  v7 = -[BTAVRCP_VFSFolder query];
  v8 = [v7 itemAtIndex:a3];

  v9 = (void *)[v8 replyItemWithAttributeIDs:v6];
  return v9;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6 = a4;
  v7 = -[BTAVRCP_VFSFolder query];
  v8 = (void *)[v7 itemWithUid:a3];

  v9 = (void *)[v8 replyAttributesForIDs:v6];
  return v9;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  v5 = -[BTAVRCP_VFSFolder query];
  id v6 = [v5 itemWithUid:a3];

  if (v6)
  {
    v7 = [self targetApp];
    if ([v7 isEqualToString:off_10001F048])
    {
      v8 = [MPMusicPlayerController systemMusicPlayer];
      v9 = -[BTAVRCP_VFSFolder query];
      [v8 setQueueWithQuery:v9 firstItem:v6];

      [v8 play];
    }

    else
    {
      uint64_t v11 = MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 1LL);
      v12 = -[BTAVRCP_VFSFolder query];
      MRSystemAppPlaybackQueueSetLocalQueryData( v11,  +[NSKeyedArchiver archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:",  v12));

      MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID(v11, [v6 persistentID]);
      MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback(v11, 1LL);
      MRMediaRemoteSetAppPlaybackQueue(v7, v11, 0LL, 0LL, 0LL);
      MRSystemAppPlaybackQueueDestroy(v11);
    }

    unsigned __int8 v10 = 4;
  }

  else
  {
    unsigned __int8 v10 = 9;
  }

  return v10;
}

@end