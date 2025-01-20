@interface MRDExternalDeviceHomeServer
- (BOOL)_shouldSendCompanionLinkMessage;
- (BOOL)sendingPlaybackStateToCompanion;
- (MRDExternalDeviceHomeServer)init;
- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)lastSentEntry;
- (NSMutableArray)entries;
- (NSString)mostRecentDeviceUID;
- (NSUserDefaults)userDefaults;
- (id)decodeEntries;
- (id)encodeEntries;
- (void)_addEntry:(id)a3;
- (void)_handleLocalPlaybackBeganNotification:(id)a3;
- (void)_handleSetNearbyDevicesToRemoteControlMessage:(id)a3 fromClient:(id)a4;
- (void)_maybeMostRecentlyPlayedDeviceChanged:(id)a3;
- (void)_maybeSendPlaybackStateMessageToCompanion;
- (void)_registerCompanionLinkHandlers;
- (void)_registerNotifications;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)setEntries:(id)a3;
- (void)setLastSentEntry:(id)a3;
- (void)setSendingPlaybackStateToCompanion:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation MRDExternalDeviceHomeServer

- (MRDExternalDeviceHomeServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceHomeServer;
  v2 = -[MRDExternalDeviceHomeServer init](&v8, "init");
  if (v2)
  {
    v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mediaremote");
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceHomeServer decodeEntries](v2, "decodeEntries"));
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v5;

    -[MRDExternalDeviceHomeServer _registerNotifications](v2, "_registerNotifications");
    -[MRDExternalDeviceHomeServer _registerCompanionLinkHandlers](v2, "_registerCompanionLinkHandlers");
  }

  return v2;
}

- (NSString)mostRecentDeviceUID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v2->_entries, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceUID]);

  objc_sync_exit(v2);
  return (NSString *)v5;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  if (xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY") == 0x300000000000022LL) {
    -[MRDExternalDeviceHomeServer _handleSetNearbyDevicesToRemoteControlMessage:fromClient:]( self,  "_handleSetNearbyDevicesToRemoteControlMessage:fromClient:",  xdict,  v6);
  }
}

- (void)_registerCompanionLinkHandlers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedIDSCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedIDSCompanionLinkClient"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100063C44;
  v9[3] = &unk_10039C370;
  v9[4] = self;
  id v4 = [v3 registerEvent:MRCompanionLinkClientEventPlaybackSessionChanged callback:v9];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedIDSCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedIDSCompanionLinkClient"));
  id v6 = [v5 registerRequest:MRCompanionLinkClientRequestNowPlayingState callback:&stru_10039C3B0];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedIDSCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedIDSCompanionLinkClient"));
  id v8 = [v7 registerRequest:MRCompanionLinkClientRequestPlaybackSession callback:&stru_10039C470];
}

- (void)_registerNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification;
  [v3 addObserver:self selector:"_handleLocalPlaybackBeganNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:v4 object:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMRMediaRemoteOriginSupportedCommandsDidChangeNotification object:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMROriginNowPlayingPlaybackQueueChangedNotification object:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMROriginPlaybackQueueContentItemsChangedNotification object:0];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 addObserver:self selector:"_maybeMostRecentlyPlayedDeviceChanged:" name:kMRDeviceInfoDidChangeNotification object:0];
}

- (void)_handleLocalPlaybackBeganNotification:(id)a3
{
  id v18 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v5 = [v4 notifyDevicesInHomeThatPlaybackStarted];

  id v6 = v18;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
    uint64_t v8 = MRGetOriginFromUserInfo();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if ([v9 isLocal])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
      v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey]);
      unsigned int v12 = [v11 BOOLValue];

      if (v12)
      {
        if (-[MRDExternalDeviceHomeServer _shouldSendCompanionLinkMessage](self, "_shouldSendCompanionLinkMessage"))
        {
          v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
          uint64_t v15 = MRGetPlayerPathFromUserInfo(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          MRAddPlayerPathToUserInfo(v13, v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedCompanionLinkClient"));
          [v17 sendEventToHome:MRCompanionLinkClientEventIsPlaying userInfo:v13];
        }
      }
    }

    id v6 = v18;
  }
}

- (void)_maybeMostRecentlyPlayedDeviceChanged:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ([v6 isLocal])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000645E8;
    block[3] = &unk_100399250;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_handleSetNearbyDevicesToRemoteControlMessage:(id)a3 fromClient:(id)a4
{
  uint64_t v4 = MRCreateStringFromXPCMessage(a3, "MRXPC_HOMEKIT_IDENTIFIER_KEY");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  v7 = (void *)v5;
  if (v5)
  {
    uint64_t v8 = (void *)MRMediaRemoteAirPlayReceiverCopyPairingIdentity(v5, v6);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedCompanionLinkClient"));
      uint64_t v10 = MRCompanionLinkClientEventUpdateActiveSystemEndpoint;
      uint64_t v12 = MRCompanionLinkClientActiveSystemEndpointUIDUserInfoKey;
      v13 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      [v9 sendEvent:v10 toDevicesOfHomeUser:v7 userInfo:v11];
    }
  }
}

- (void)_maybeSendPlaybackStateMessageToCompanion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v3 = [v2 supportLastPlayingDevice];

  if (v3 && -[MRDExternalDeviceHomeServer _shouldSendCompanionLinkMessage](self, "_shouldSendCompanionLinkMessage"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v5 localOriginClient]);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v35 activeNowPlayingClient]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 activePlayerClient]);

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v37 supportedRemoteControlCommands]);
    id v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v7)
    {
      v40 = 0LL;
      uint64_t v8 = 0LL;
      id v9 = 0LL;
      uint64_t v10 = *(void *)v42;
      uint64_t v38 = kMRMediaRemoteCommandInfoCurrentPlaybackSessionTypes;
      uint64_t v11 = kMRMediaRemoteCommandInfoSupportedPlaybackSessionTypes;
      uint64_t v12 = kMRMediaRemoteCommandInfoPlaybackSessionIdentifier;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          if (objc_msgSend(v14, "command", v35) == 133)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 options]);
            uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v38]);

            v17 = (void *)objc_claimAutoreleasedReturnValue([v14 options]);
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v11]);

            v19 = (void *)objc_claimAutoreleasedReturnValue([v14 options]);
            uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v12]);

            v40 = (void *)v20;
            uint64_t v8 = (void *)v18;
            id v9 = (void *)v16;
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }

      while (v7);
    }

    else
    {
      v40 = 0LL;
      uint64_t v8 = 0LL;
      id v9 = 0LL;
    }

    v21 = objc_alloc_init(&OBJC_CLASS___MRDExternalDeviceHomeServerRecentlyPlayedEntry);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setCurrentPlaybackSessionTypes:]( v21,  "setCurrentPlaybackSessionTypes:",  v9);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setSupportedPlaybackSessionTypes:]( v21,  "setSupportedPlaybackSessionTypes:",  v8);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setCurrentPlaybackSessionIdentifier:]( v21,  "setCurrentPlaybackSessionIdentifier:",  v40);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setIsPlaying:]( v21,  "setIsPlaying:",  [v37 isPlaying]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v37 snapshotForIsPlaying:1]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 date]);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setLastPlayingDate:](v21, "setLastPlayingDate:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v37 snapshotForIsPlaying:0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 date]);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setLastNotPlayingDate:](v21, "setLastNotPlayingDate:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v37 nowPlayingContentItem]);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setContentItem:](v21, "setContentItem:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v37 playerPath]);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setPlayerPath:](v21, "setPlayerPath:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v35 deviceInfo]);
    -[MRDExternalDeviceHomeServerRecentlyPlayedEntry setDeviceInfo:](v21, "setDeviceInfo:", v28);

    v29 = self;
    objc_sync_enter(v29);
    if (!-[MRDExternalDeviceHomeServerRecentlyPlayedEntry isEqual:](v29->_lastSentEntry, "isEqual:", v21))
    {
      v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v31 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceHomeServerRecentlyPlayedEntry dictionaryRepresentation]( v21,  "dictionaryRepresentation"));
      -[NSMutableDictionary addEntriesFromDictionary:](v30, "addEntriesFromDictionary:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      unsigned int v33 = [v32 sendLastPlayingDeviceToHome];

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedIDSCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedIDSCompanionLinkClient"));
        [v34 sendEventToHome:MRCompanionLinkClientEventPlaybackSessionChanged userInfo:v30];
      }

      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[MRCompanionLinkClient sharedIDSCompanionLinkClient]( &OBJC_CLASS___MRCompanionLinkClient,  "sharedIDSCompanionLinkClient"));
        [v34 sendEventToCompanion:MRCompanionLinkClientEventPlaybackSessionChanged userInfo:v30];
      }

      objc_storeStrong((id *)&v29->_lastSentEntry, v21);
    }

    objc_sync_exit(v29);
  }

- (BOOL)_shouldSendCompanionLinkMessage
{
  return 1;
}

- (void)_addEntry:(id)a3
{
  id v27 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v24 = v4;
  id v5 = -[NSMutableArray copy](v4->_entries, "copy");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      id v26 = v6;
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v28 deviceInfo]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceUID]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceInfo]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);
        uint64_t v12 = v11;
        if (v9 == v11)
        {

LABEL_10:
          -[NSMutableArray removeObject:](v24->_entries, "removeObject:", v28);
          continue;
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v28 deviceInfo]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceUID]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceInfo]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceUID]);
        unsigned __int8 v17 = [v14 isEqualToString:v16];

        if ((v17 & 1) != 0) {
          goto LABEL_10;
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v6);
  }

  entries = v24->_entries;
  if (!entries)
  {
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v20 = v24->_entries;
    v24->_entries = v19;

    entries = v24->_entries;
  }

  -[NSMutableArray addObject:](entries, "addObject:", v27);
  userDefaults = v24->_userDefaults;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceHomeServer encodeEntries](v24, "encodeEntries"));
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v22, @"RecentlyPlayedEntries");

  objc_sync_exit(v24);
}

- (id)encodeEntries
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = v2->_entries;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v7),  "dictionaryRepresentation",  (void)v12));
        uint64_t v9 = MRCreateEncodedUserInfo();
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

        -[NSMutableArray addObject:](v3, "addObject:", v10);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v5);
  }

  objc_sync_exit(v2);
  return v3;
}

- (id)decodeEntries
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", @"RecentlyPlayedEntries"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006510C;
  v7[3] = &unk_10039C498;
  id v5 = v3;
  uint64_t v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];
  -[NSMutableArray sortUsingComparator:](v5, "sortUsingComparator:", &stru_10039C4D8);

  return v5;
}

- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)lastSentEntry
{
  return self->_lastSentEntry;
}

- (void)setLastSentEntry:(id)a3
{
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (BOOL)sendingPlaybackStateToCompanion
{
  return self->_sendingPlaybackStateToCompanion;
}

- (void)setSendingPlaybackStateToCompanion:(BOOL)a3
{
  self->_sendingPlaybackStateToCompanion = a3;
}

- (void).cxx_destruct
{
}

@end