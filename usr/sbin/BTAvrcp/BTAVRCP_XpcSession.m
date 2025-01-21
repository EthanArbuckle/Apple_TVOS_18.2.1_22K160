@interface BTAVRCP_XpcSession
- (BOOL)isForwarding;
- (BOOL)isRewinding;
- (BTAVRCP_Library)lazyLibrary;
- (BTAVRCP_NowPlayingInfo)lazyNowPlayingInfo;
- (id)attributeIDsFromArgs:(id)a3;
- (id)library;
- (id)nowPlayingInfo;
- (unsigned)getNowPlayingAttributeIDs:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)getMediaPlayersFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 replyBlock:(id)a5;
- (void)handleChangePathMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetElementAttributesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetFolderItemsMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetImageMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetImagePropertiesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetItemAttributesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetPlayStatusMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetSettingsMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetTotalNumberOfItemsMsg:(id)a3 replyBlock:(id)a4;
- (void)handleMsg:(id)a3;
- (void)handlePlayItemMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForPlaybackStateChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForPlayerChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForSettingsChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForTrackChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSearchMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSendCommandMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSetAddressedPlayerMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSetBrowsedPlayerMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSetSettingsMsg:(id)a3 replyBlock:(id)a4;
- (void)libraryDidChange;
- (void)playbackQueueDidChange;
- (void)playbackStateDidChange:(int64_t)a3;
- (void)playerDidChange:(int)a3;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5;
- (void)setIsForwarding:(BOOL)a3;
- (void)setIsRewinding:(BOOL)a3;
- (void)setLazyLibrary:(id)a3;
- (void)setLazyNowPlayingInfo:(id)a3;
- (void)settingsDidChange:(id)a3;
- (void)trackDidChange:(unint64_t)a3;
@end

@implementation BTAVRCP_XpcSession

- (void)dealloc
{
  if (-[BTAVRCP_XpcSession isRewinding](self, "isRewinding")) {
    MRMediaRemoteSendCommand(11LL, 0LL);
  }
  if (-[BTAVRCP_XpcSession isForwarding](self, "isForwarding")) {
    MRMediaRemoteSendCommand(9LL, 0LL);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAVRCP_XpcSession;
  -[BTAVRCP_XpcSession dealloc](&v3, "dealloc");
}

- (id)nowPlayingInfo
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession lazyNowPlayingInfo](self, "lazyNowPlayingInfo"));

  if (!v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___BTAVRCP_NowPlayingInfo);
    -[BTAVRCP_XpcSession setLazyNowPlayingInfo:](self, "setLazyNowPlayingInfo:", v4);

    v5 = -[BTAVRCP_XpcSession lazyNowPlayingInfo];
    [v5 setDelegate:self];
  }

  return -[BTAVRCP_XpcSession lazyNowPlayingInfo](self, "lazyNowPlayingInfo");
}

- (id)library
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession lazyLibrary](self, "lazyLibrary"));

  if (!v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___BTAVRCP_Library);
    -[BTAVRCP_XpcSession setLazyLibrary:](self, "setLazyLibrary:", v4);

    v5 = -[BTAVRCP_XpcSession lazyLibrary];
    [v5 setDelegate:self];
  }

  return -[BTAVRCP_XpcSession lazyLibrary](self, "lazyLibrary");
}

- (void)handleSendCommandMsg:(id)a3 replyBlock:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v7, "kCommand");
  string = xpc_dictionary_get_string(v7, "kSource");

  v18[0] = kMRMediaRemoteOptionSourceID;
  v10 = [NSString stringWithUTF8String:string];
  v18[1] = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
  v19[0] = v10;
  v19[1] = @"com.apple.AVRCP";
  v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  switch((int)int64)
  {
    case 8:
      v12 = self;
      uint64_t v13 = 1LL;
      goto LABEL_4;
    case 9:
      v12 = self;
      uint64_t v13 = 0LL;
LABEL_4:
      -[BTAVRCP_XpcSession setIsForwarding:](v12, "setIsForwarding:", v13);
      break;
    case 10:
      v14 = self;
      uint64_t v15 = 1LL;
      goto LABEL_7;
    case 11:
      v14 = self;
      uint64_t v15 = 0LL;
LABEL_7:
      -[BTAVRCP_XpcSession setIsRewinding:](v14, "setIsRewinding:", v15);
      break;
    default:
      break;
  }

  v16 = -[BTAVRCP_XpcSession nowPlayingInfo];
  unsigned int v17 = [v16 isLocalOrigin];

  if (v17) {
    MRMediaRemoteSendCommand(int64, v11);
  }
  v6[2](v6, 4LL, 0LL);
}

- (void)handleSetSettingsMsg:(id)a3 replyBlock:(id)a4
{
  v8 = (void (**)(id, uint64_t, void))a4;
  id v5 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v5, "kRepeatMode");
  int64_t v7 = xpc_dictionary_get_int64(v5, "kShuffleMode");

  if ((_DWORD)v7 != -1) {
    MRMediaRemoteSetShuffleMode(v7);
  }
  v8[2](v8, 4LL, 0LL);
}

- (void)handleGetSettingsMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void *))a4;
  v6 = -[BTAVRCP_XpcSession nowPlayingInfo];
  unint64_t v7 = (unint64_t)[v6 settings];

  v11[0] = @"kRepeatMode";
  v8 = [NSNumber numberWithInt:v7];
  v11[1] = @"kShuffleMode";
  v12[0] = v8;
  v9 = [NSNumber numberWithInt:HIDWORD(v7)];
  v12[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL);
  v5[2](v5, 4LL, v10);
}

- (void)handleGetPlayStatusMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, id))a4;
  id v12 = [NSMutableDictionary dictionary];
  v6 = -[BTAVRCP_XpcSession nowPlayingInfo];
  unint64_t v7 = (void *)[v6 trackDuration];
  [v12 setValue:v7 forKey:@"kTrackDuration"];

  v8 = -[BTAVRCP_XpcSession nowPlayingInfo];
  v9 = (void *)[v8 trackPosition];
  [v12 setValue:v9 forKey:@"kTrackPosition"];

  v10 = [self nowPlayingInfo];
  v11 = [NSNumber numberWithInteger:v10.playbackState];
  [v12 setValue:v11 forKey:@"kPlaybackState"];

  v5[2](v5, 4LL, v12);
}

- (void)handleGetElementAttributesMsg:(id)a3 replyBlock:(id)a4
{
  v22 = (void (**)(id, uint64_t, void *))a4;
  id v5 = [NSMutableDictionary dictionary];
  v6 = -[BTAVRCP_XpcSession nowPlayingInfo];
  unint64_t v7 = (void *)[v6 trackTitle];

  if (v7) {
    [v5 setValue:v7 forKey:@"kTitle"];
  }
  v8 = [self nowPlayingInfo];
  v9 = [v8 trackAlbum];

  if (v9) {
    [v5 setValue:v9 forKey:@"kAlbum"];
  }
  v10 = [self nowPlayingInfo];
  v11 = [v10 trackArtist];

  if (v11) {
    [v5 setValue:v11 forKey:@"kArtist"];
  }
  id v12 = -[BTAVRCP_XpcSession nowPlayingInfo];
  uint64_t v13 = (void *)[v12 trackGenre];

  if (v13) {
    [v5 setValue:v13 forKey:@"kGenre"];
  }
  v14 = [self nowPlayingInfo];
  uint64_t v15 = (void *)[v14 trackQueueIndex];

  if (v15) {
    [v5 setValue:v15 forKey:@"kQueueIndex"];
  }
  v16 = -[BTAVRCP_XpcSession nowPlayingInfo];
  unsigned int v17 = (void *)[v16 trackQueueCount];

  if (v17) {
    [v5 setValue:v17 forKey:@"kQueueCount"];
  }
  v18 = [self nowPlayingInfo];
  v19 = (void *)[v18 trackDuration];

  if (v19) {
    [v5 setValue:v19 forKey:@"kDuration"];
  }
  v20 = -[BTAVRCP_XpcSession nowPlayingInfo];
  v21 = [v20 trackImageHandle];

  if (v21) {
    [v5 setValue:v21 forKey:@"kImageHandle"];
  }
  v22[2](v22, 4LL, v5);
}

- (void)handleRegisterForChangesMsg:(id)a3 replyBlock:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v5 = -[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo");
  v6[2](v6, 4LL, 0LL);
}

- (void)handleRegisterForPlayerChangesMsg:(id)a3 replyBlock:(id)a4
{
  v10 = @"kPlayerId";
  id v6 = a4;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v8 = [NSNumber numberWithInt:[v7 playerId]];
  v11 = v8;
  v9 = [NSDictionary dictionaryWithObjects:forKeys:count:v11, v10, 1LL];
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4LL, v9);
}

- (void)handleRegisterForPlaybackStateChangesMsg:(id)a3 replyBlock:(id)a4
{
  v10 = @"kPlaybackState";
  id v6 = a4;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v8 = [NSNumber numberWithInteger:v7 playbackState];
  v11 = v8;
  v9 = [NSDictionary dictionaryWithObjects:forKeys:count:&v11, &v10, 1LL];
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4LL, v9);
}

- (void)handleRegisterForTrackChangesMsg:(id)a3 replyBlock:(id)a4
{
  v10 = @"kUid";
  id v6 = a4;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  v8 = [NSNumber numberWithUnsignedLongLong:v7 trackId];
  v11 = v8;
  v9 = [NSDictionary dictionaryWithObjects:forKeys:count:&v11, &v10, 1LL];
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4LL, v9);
}

- (void)handleRegisterForSettingsChangesMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  unint64_t v7 = (unint64_t)[v6 settings];

  v11[0] = @"kRepeatMode";
  v8 = [NSNumber numberWithInt:v7];
  v11[1] = @"kShuffleMode";
  v12[0] = v8;
  v9 = [NSNumber numberWithInt:HIDWORD(v7)];
  v12[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:forKeys:count:v12, v11, 2LL];
  v5[2](v5, 4LL, v10);
}

- (void)handleSetAddressedPlayerMsg:(id)a3 replyBlock:(id)a4
{
  unint64_t v7 = (void (**)(void))a4;
  xpc_dictionary_get_int64(a3, "kPlayerId");
  id v6 = [self nowPlayingInfo];
  [v6 playerId];

  v7[2]();
}

- (void)handleSetBrowsedPlayerMsg:(id)a3 replyBlock:(id)a4
{
  id v12 = a4;
  LODWORD(a3) = xpc_dictionary_get_int64(a3, "kPlayerId");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  unsigned int v7 = [v6 playerId];

  if (v7 != (_DWORD)a3)
  {
    v11 = (void (*)(void))v12[2];
LABEL_6:
    v11();
    goto LABEL_7;
  }

  v8 = -[BTAVRCP_XpcSession nowPlayingInfo];
  unsigned int v9 = [v8 isBrowsablePlayer];

  if (!v9)
  {
    v11 = (void (*)(void))v12[2];
    goto LABEL_6;
  }

  v10 = -[BTAVRCP_XpcSession library];
  [v10 getCurrentPath:v12];

LABEL_7:
}

- (void)handleChangePathMsg:(id)a3 replyBlock:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  __int16 int64 = xpc_dictionary_get_int64(xdict, "kUidCounter");
  if (xpc_dictionary_get_BOOL(xdict, "kDotDot")) {
    int64_t v8 = 0LL;
  }
  else {
    int64_t v8 = xpc_dictionary_get_int64(xdict, "kUid");
  }
  if (int64)
  {
    v6[2](v6, 5LL, 0LL);
  }

  else
  {
    unsigned int v9 = (void *)[BTAVRCP_XpcSession library];
    [v9 changePath:v8 replyBlock:v6];
  }
}

- (void)handleGetFolderItemsMsg:(id)a3 replyBlock:(id)a4
{
  v16 = a4;
  id v6 = a3;
  char int64 = xpc_dictionary_get_int64(v6, "kScope");
  unsigned int v8 = xpc_dictionary_get_int64(v6, "kStartItem");
  LODWORD(v9) = xpc_dictionary_get_int64(v6, "kEndItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession attributeIDsFromArgs:](self, "attributeIDsFromArgs:", v6));

  if (v8 <= v9)
  {
    else {
      uint64_t v9 = v9;
    }
    else {
      id v12 = 0LL;
    }
    switch(int64)
    {
      case 0:
        -[BTAVRCP_XpcSession getMediaPlayersFromStart:toEnd:replyBlock:]( self,  "getMediaPlayersFromStart:toEnd:replyBlock:",  v8,  v9,  v16);
        break;
      case 1:
        uint64_t v13 = (void *)[BTAVRCP_XpcSession library];
        [v13 getVFSItemsFromStart:v8 toEnd:v9 attributeIDs:v12 replyBlock:v16];
        goto LABEL_17;
      case 2:
        uint64_t v13 = (void *)[BTAVRCP_XpcSession library];
        [v13 getSearchItemsFromStart:v8 toEnd:v9 attributeIDs:v12 replyBlock:v16];
        goto LABEL_17;
      case 3:
        v14 = -[BTAVRCP_XpcSession nowPlayingInfo];
        unsigned int v15 = [v14 isMusicApp];

        if (!v15) {
          goto LABEL_2;
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
        [v13 getNowPlayingItemsFromStart:v8 toEnd:v9 attributeIDs:v12 replyBlock:v16];
LABEL_17:

        break;
      default:
        v11 = (void (*)(void))v16[2];
        goto LABEL_3;
    }
  }

  else
  {
LABEL_2:
    v11 = (void (*)(void))v16[2];
LABEL_3:
    v11();
  }
}

- (void)handleGetItemAttributesMsg:(id)a3 replyBlock:(id)a4
{
  v19 = (void (**)(id, uint64_t, void *))a4;
  id v6 = a3;
  unsigned int v7 = [NSMutableDictionary dictionary];
  char int64 = xpc_dictionary_get_int64(v6, "kScope");
  int64_t v9 = xpc_dictionary_get_int64(v6, "kUid");
  __int16 v10 = xpc_dictionary_get_int64(v6, "kUidCounter");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession attributeIDsFromArgs:](self, "attributeIDsFromArgs:", v6));

  if (!v10)
  {
    switch(int64)
    {
      case 3:
        if (v9 == -1)
        {
          uint64_t v12 = 9LL;
          goto LABEL_15;
        }

        if (!v9
          || (unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo")),
              id v16 = [v15 trackId],
              v15,
              (id)v9 == v16))
        {
          uint64_t v12 = -[BTAVRCP_XpcSession getNowPlayingAttributeIDs:reply:]( self,  "getNowPlayingAttributeIDs:reply:",  v11,  v7);
          goto LABEL_15;
        }

        unsigned int v17 = [self nowPlayingInfo];
        unsigned int v18 = [v17 isMusicApp];

        if (!v18)
        {
          uint64_t v12 = 11LL;
          goto LABEL_15;
        }

        uint64_t v13 = (void *)[BTAVRCP_XpcSession library];
        id v14 = [v13 getNowPlayingItemWithUid:v9 attributeIDs:v11 reply:v7];
        break;
      case 2:
        uint64_t v13 = (void *)[BTAVRCP_XpcSession library];
        id v14 = [v13 getSearchItemWithUid:v9 attributeIDs:v11 reply:v7];
        break;
      case 1:
        uint64_t v13 = (void *)[BTAVRCP_XpcSession library];
        id v14 = [v13 getVFSItemWithUid:v9 attributeIDs:v11 reply:v7];
        break;
      default:
        uint64_t v12 = 10LL;
        goto LABEL_15;
    }

    uint64_t v12 = (uint64_t)v14;

    goto LABEL_15;
  }

  uint64_t v12 = 5LL;
LABEL_15:
  v19[2](v19, v12, v7);
}

- (void)handleSearchMsg:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  string = xpc_dictionary_get_string(a3, "kSearchString");
  id v9 = [BTAVRCP_XpcSession library];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v9 search:v8 replyBlock:v6];
}

- (void)handleGetTotalNumberOfItemsMsg:(id)a3 replyBlock:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void *))a4;
  switch(xpc_dictionary_get_int64(a3, "kScope"))
  {
    case 0u:
      uint64_t v7 = 1LL;
      break;
    case 1u:
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
      id v9 = [v8 getVFSItemsCount];
      goto LABEL_7;
    case 2u:
      unsigned int v8 = (void *)[BTAVRCP_XpcSession library];
      id v9 = [v8 getSearchItemsCount];
      goto LABEL_7;
    case 3u:
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
      unsigned int v11 = [v10 isMusicApp];

      if (!v11) {
        goto LABEL_8;
      }
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession library](self, "library"));
      id v9 = [v8 getNowPlayingItemsCount];
LABEL_7:
      uint64_t v7 = (uint64_t)v9;

      break;
    default:
LABEL_8:
      uint64_t v7 = 0LL;
      break;
  }

  id v14 = @"kNumItems";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  unsigned int v15 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v6[2](v6, 4LL, v13);
}

- (void)handlePlayItemMsg:(id)a3 replyBlock:(id)a4
{
  unsigned int v15 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  char int64 = xpc_dictionary_get_int64(v6, "kScope");
  int64_t v8 = xpc_dictionary_get_int64(v6, "kUid");
  __int16 v9 = xpc_dictionary_get_int64(v6, "kUidCounter");

  if (v9)
  {
    uint64_t v10 = 5LL;
  }

  else
  {
    switch(int64)
    {
      case 3:
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
        unsigned int v14 = [v13 isMusicApp];

        if (!v14)
        {
          uint64_t v10 = 9LL;
          goto LABEL_13;
        }

        unsigned int v11 = [BTAVRCP_XpcSession library];
        id v12 = [v11 playNowPlayingItemWithUid:v8];
        break;
      case 2:
        unsigned int v11 = (void *)[BTAVRCP_XpcSession library];
        id v12 = [v11 playSearchItemWithUid:v8];
        break;
      case 1:
        unsigned int v11 = (void *)[BTAVRCP_XpcSession library];
        id v12 = [v11 playVFSItemWithUid:v8];
        break;
      default:
        uint64_t v10 = 10LL;
        goto LABEL_13;
    }

    uint64_t v10 = (uint64_t)v12;
  }

- (void)handleGetImagePropertiesMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v12 = [NSMutableDictionary dictionary];
  id v6 = [self nowPlayingInfo];
  uint64_t v7 = (void *)[v6 encodings];
  [v12 setValue:v7 forKey:@"kEncodings"];

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  __int16 v9 = [v8 widths];
  [v12 setValue:v9 forKey:@"kWidths"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  unsigned int v11 = [v10 heights];
  [v12 setValue:v11 forKey:@"kHeights"];

  v5[2](v5, 0LL, v12);
}

- (void)handleGetImageMsg:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v7, "kWidth");
  int64_t v9 = xpc_dictionary_get_int64(v7, "kHeight");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  unsigned int v11 = (void *)[v10 widths];
  id v12 = [NSNumber numberWithUnsignedLongLong:int64];
  id v13 = [v11 indexOfObject:v12];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
  unsigned int v15 = [v14 heights];
  id v16 = [NSNumber numberWithUnsignedLongLong:v9];
  id v17 = [v15 indexOfObject:v16];

  BOOL v20 = v13 == (id)0x7FFFFFFFFFFFFFFFLL || v13 != v17 || v17 == (id)0x7FFFFFFFFFFFFFFFLL;
  double v21 = (double)(unint64_t)int64;
  v22 = (const void *)MRPlaybackQueueRequestCreate(0LL, 1LL);
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  v24 = (const void *)MRNowPlayingPlayerPathCreate(LocalOrigin, 0LL, 0LL);
  if (v20) {
    v25.n128_f64[0] = 200.0;
  }
  else {
    v25.n128_f64[0] = v21;
  }
  MRPlaybackQueueRequestSetIncludeArtwork(v22, v25);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000079BC;
  v27[3] = &unk_100018A28;
  id v26 = v6;
  id v28 = v26;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync(v22, v24, &_dispatch_main_q, v27);
  if (v22) {
    CFRelease(v22);
  }
  if (v24) {
    CFRelease(v24);
  }
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_object_t value = xpc_dictionary_get_value(v4, "kMsgArgs");
  id v7 = value;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_100007B74;
  v12[3] = &unk_100018A50;
  v12[4] = self;
  id v13 = v4;
  id v8 = v4;
  int64_t v9 = objc_retainBlock(v12);
  uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"handle%sMsg:replyBlock:",  string));
  unsigned int v11 = NSSelectorFromString(v10);

  objc_msgSend(self, v11, v7, v9);
}

- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5
{
  unsigned int v5 = a4;
  id v8 = a5;
  xpc_object_t xdict = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_int64(xdict, "kMsgStatus", v5);
  if (v8) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = &__NSArray0__struct;
  }
  uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);

  xpc_dictionary_set_value(xdict, "kMsgArgs", v10);
  -[BTXpcSession sendReply:](self, "sendReply:", xdict);
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v8 = v6;
  int64_t v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "kMsgId", v9);
  if (v11)
  {
    uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v11);
    xpc_dictionary_set_value(v7, "kMsgArgs", v10);
  }

  -[BTXpcSession sendMsg:](self, "sendMsg:", v7);
}

- (void)playerDidChange:(int)a3
{
  id v6 = @"kPlayerId";
  id v4 = [NSNumber numberWithInt:a3];
  xpc_object_t v7 = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", @"PlayerDidChange", v5);
}

- (void)playbackStateDidChange:(int64_t)a3
{
  id v6 = @"kPlaybackState";
  id v4 = [NSNumber numberWithInteger:a3];
  xpc_object_t v7 = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", @"PlaybackStateDidChange", v5);
}

- (void)trackDidChange:(unint64_t)a3
{
  id v6 = @"kUid";
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  xpc_object_t v7 = v4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", @"TrackDidChange", v5);
}

- (void)settingsDidChange:(id)a3
{
  uint64_t var1 = a3.var1;
  v8[0] = @"kRepeatMode";
  unsigned int v5 = [NSNumber numberWithInt:];
  v8[1] = @"kShuffleMode";
  v9[0] = v5;
  id v6 = [NSNumber numberWithInt:var1];
  v9[1] = v6;
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  -[BTAVRCP_XpcSession sendMsg:args:](self, "sendMsg:args:", @"SettingsDidChange", v7);
}

- (void)playbackQueueDidChange
{
}

- (void)libraryDidChange
{
  id v3 = [self nowPlayingInfo];
  -[BTAVRCP_XpcSession trackDidChange:](self, "trackDidChange:", [v3 trackId]);
}

- (id)attributeIDsFromArgs:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kAttributeIDs");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(value);
  unsigned int v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)getMediaPlayersFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 replyBlock:(id)a5
{
  if (a3)
  {
    unsigned int v5 = (void (*)(void))*((void *)a5 + 2);
    id v6 = a5;
    v5();
  }

  else
  {
    v22[0] = @"kPlayerId";
    id v8 = (void (**)(id, uint64_t, void *))a5;
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 playerId]));
    v23[0] = v10;
    v22[1] = @"kPlaybackState";
    id v11 = -[BTAVRCP_XpcSession nowPlayingInfo];
    id v12 = [NSNumber numberWithInteger:[v11 playbackState]];
    v23[1] = v12;
    v22[2] = @"kIsBrowsable";
    id v13 = [self nowPlayingInfo];
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v13 isBrowsablePlayer]));
    v23[2] = v14;
    v22[3] = @"kName";
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_XpcSession nowPlayingInfo](self, "nowPlayingInfo"));
    id v16 = [v15 playerName];
    v23[3] = v16;
    id v6 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

    id v19 = v6;
    BOOL v20 = @"kItems";
    id v17 = [NSArray arrayWithObjects:&v19, 1LL];
    double v21 = v17;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v8[2](v8, 4LL, v18);
  }
}

- (unsigned)getNowPlayingAttributeIDs:(id)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008354;
  v7[3] = &unk_100018A78;
  v7[4] = self;
  id v8 = a4;
  id v5 = v8;
  [a3 enumerateAttributeIDs:v7];

  return 4;
}

- (BTAVRCP_NowPlayingInfo)lazyNowPlayingInfo
{
  return self->_lazyNowPlayingInfo;
}

- (void)setLazyNowPlayingInfo:(id)a3
{
}

- (BTAVRCP_Library)lazyLibrary
{
  return self->_lazyLibrary;
}

- (void)setLazyLibrary:(id)a3
{
}

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (BOOL)isRewinding
{
  return self->_isRewinding;
}

- (void)setIsRewinding:(BOOL)a3
{
  self->_isRewinding = a3;
}

- (void).cxx_destruct
{
}

@end