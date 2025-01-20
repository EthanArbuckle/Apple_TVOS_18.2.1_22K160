@interface MTRemoteSetPlaybackQueueUtil
+ (id)_entityForFetchRequest:(id)a3;
+ (int64_t)requestStatusForMediaRemoteStatus:(unsigned int)a3;
+ (void)_destinationForRequest:(id)a3 completion:(id)a4;
+ (void)convertActiveEndpointToBufferedAirPlayWithCompletion:(id)a3;
+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 enqueuer:(id)a5 accountLookupFailed:(BOOL)a6 startPlayback:(BOOL)a7 upNextQueueIntent:(unint64_t)a8 completion:(id)a9;
+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 sessionIdentifierOverride:(id)a5 enqueuer:(id)a6 accountLookupFailed:(BOOL)a7 startPlayback:(BOOL)a8 upNextQueueIntent:(unint64_t)a9 completion:(id)a10;
+ (void)insertEpisodeUuids:(id)a3 intoPlaybackQueueAtPosition:(int)a4;
+ (void)insertPlayerItems:(id)a3 intoPlaybackQueueAtPosition:(int)a4;
+ (void)performRequestAsBufferedAirPlay:(id)a3;
+ (void)pickRouteAndSwitchToLocalCard:(id)a3 completion:(id)a4;
+ (void)promptBeforePerformingRequestAsBufferedAirPlay:(id)a3 queueStatus:(unint64_t)a4;
+ (void)sendPlaybackQueueToLocalDestination:(_MRSystemAppPlaybackQueue *)a3 context:(id)a4 completion:(id)a5;
+ (void)setRemotePlaybackQueue:(id)a3 completion:(id)a4;
@end

@implementation MTRemoteSetPlaybackQueueUtil

+ (void)setRemotePlaybackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 manifest]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  unsigned int v10 = [v9 isInteractive];

  uint64_t v24 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  id v12 = [v11 playbackQueueWithAccountInfoForManifest:v8 queueStatus:&v24];

  if (v24)
  {
    if (v10) {
      objc_msgSend(a1, "promptBeforePerformingRequestAsBufferedAirPlay:queueStatus:", v6);
    }
    else {
      [a1 performRequestAsBufferedAirPlay:v6];
    }
  }

  else
  {
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback(v12, [v6 startPlayback]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
    id v14 = [v13 upNextQueueIntent];

    if (v10) {
      int v15 = 0;
    }
    else {
      int v15 = 2;
    }
    if (v14) {
      int v15 = 0;
    }
    if (v14 == (id)1) {
      unsigned int v16 = 2;
    }
    else {
      unsigned int v16 = v15;
    }
    if (v14 == (id)2) {
      uint64_t v17 = 1LL;
    }
    else {
      uint64_t v17 = v16;
    }
    MRSystemAppPlaybackQueueSetReplaceIntent(v12, v17);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100050320;
    v18[3] = &unk_100241D10;
    id v19 = v6;
    id v20 = v7;
    id v21 = v12;
    id v22 = a1;
    char v23 = v10;
    [a1 _destinationForRequest:v19 completion:v18];
  }
}

+ (void)sendPlaybackQueueToLocalDestination:(_MRSystemAppPlaybackQueue *)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(&OBJC_CLASS___MPCAssistantRemoteControlDestination);
  id v11 = [v10 initWithAppBundleID:kMTApplicationBundleIdentifier playerID:kPodcastsPlayerID origin:0];
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(kCFAllocatorDefault, a3);
  if (ExternalRepresentation) {
    -[NSMutableDictionary setObject:forKey:]( v12,  "setObject:forKey:",  ExternalRepresentation,  kMRMediaRemoteOptionSystemAppPlaybackQueueData);
  }
  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v8, kMRMediaRemoteOptionContextID);
  }
  id v14 = objc_alloc_init(&OBJC_CLASS___MPCAssistantCommand);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100050824;
  v16[3] = &unk_100241D38;
  id v17 = v9;
  id v18 = a1;
  id v15 = v9;
  [v14 sendCommand:122 toDestination:v11 withOptions:v12 completion:v16];
}

+ (void)promptBeforePerformingRequestAsBufferedAirPlay:(id)a3 queueStatus:(unint64_t)a4
{
  id v6 = a3;
  if (isTV())
  {
    [a1 performRequestAsBufferedAirPlay:v6];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 route]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 manifest]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentItem]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 episode]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 podcast]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 provider]);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100050A78;
    v15[3] = &unk_100241D60;
    id v17 = a1;
    id v16 = v6;
    +[MTEpisodeUnavailableUtil promptBeforePerformingIntentAsBufferedAirPlayForRoute:provider:queueStatus:completion:]( &OBJC_CLASS___MTEpisodeUnavailableUtil,  "promptBeforePerformingIntentAsBufferedAirPlayForRoute:provider:queueStatus:completion:",  v9,  v14,  a4,  v15);
  }
}

+ (void)performRequestAsBufferedAirPlay:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);
  unsigned __int8 v6 = [v4 startPlayback];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
  id v8 = [v7 source];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100050BA0;
  v13[3] = &unk_100241D88;
  unsigned __int8 v16 = v6;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  [v4 setCompletion:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100050C28;
  v11[3] = &unk_100241DB0;
  id v12 = v4;
  id v10 = v4;
  [a1 convertActiveEndpointToBufferedAirPlayWithCompletion:v11];
}

+ (void)convertActiveEndpointToBufferedAirPlayWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 route]);

  [a1 pickRouteAndSwitchToLocalCard:v7 completion:v4];
}

+ (void)pickRouteAndSwitchToLocalCard:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[MPAVRoutingController alloc] initWithName:@"PodcastsRemoteSetPlaybackQueueUtil"];
  if (!v5) {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute"));
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100050DEC;
  v9[3] = &unk_100241DD8;
  id v10 = v6;
  id v8 = v6;
  [v7 selectRoute:v5 operation:0 completion:v9];
}

+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 enqueuer:(id)a5 accountLookupFailed:(BOOL)a6 startPlayback:(BOOL)a7 upNextQueueIntent:(unint64_t)a8 completion:(id)a9
{
}

+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 sessionIdentifierOverride:(id)a5 enqueuer:(id)a6 accountLookupFailed:(BOOL)a7 startPlayback:(BOOL)a8 upNextQueueIntent:(unint64_t)a9 completion:(id)a10
{
  uint64_t v11 = a7;
  id v15 = a3;
  id v35 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a10;
  id v19 = +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod");
  if (v17 && (_DWORD)v19)
  {
    uint64_t v20 = _MTLogCategoryMediaRemote(v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Overriding active account, enqueuer: %@",  buf,  0xCu);
    }

    BOOL v22 = a8;

    char v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
    [v23 setAccountOverride:v17];

    goto LABEL_7;
  }

  BOOL v22 = a8;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance", v35));
  [v24 setAccountOverride:0];

  if (v17)
  {
LABEL_7:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance", v35));
    uint64_t v11 = [v25 isPrimaryUserActiveAccount] ^ 1;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v15 upNextController]);
  id v27 = [v26 count];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v15 upNextController]);
  id v29 = [v28 upNextOffset];

  if (a9 || v27 == v29)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000511B4;
    v36[3] = &unk_100241E28;
    v33 = v35;
    id v37 = v35;
    id v40 = v18;
    uint64_t v41 = 7LL;
    id v38 = v16;
    unint64_t v42 = a9;
    BOOL v43 = v22;
    id v39 = v15;
    [v34 fetchPlayerItemsForPlaybackQueueRequestIdentifiers:v37 initiatedByAnotherUser:v11 completion:v36];
  }

  else
  {
    uint64_t v31 = _MTLogCategoryMediaRemote(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    v33 = v35;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Asking for queue confirmation for identifiers %@",  buf,  0xCu);
    }

    if (v18) {
      (*((void (**)(id, uint64_t, uint64_t))v18 + 2))(v18, 8LL, 7LL);
    }
  }
}

+ (void)insertEpisodeUuids:(id)a3 intoPlaybackQueueAtPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:]( &OBJC_CLASS___MTBaseEpisodeListManifest,  "mediaItemForEpisodeWithUUID:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v12),  (void)v14));
        if (v13) {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  [a1 insertPlayerItems:v7 intoPlaybackQueueAtPosition:v4];
}

+ (void)insertPlayerItems:(id)a3 intoPlaybackQueueAtPosition:(int)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  id v8 = [v7 playbackQueueWithAccountInfoForPlayerItems:v5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005166C;
  v9[3] = &unk_100241E88;
  void v9[4] = v8;
  int v10 = a4;
  [v6 resolveActivePlayerPathWithCompletion:v9];
}

+ (int64_t)requestStatusForMediaRemoteStatus:(unsigned int)a3
{
  int64_t result = 1LL;
  switch(a3)
  {
    case 0u:
    case 3u:
      return result;
    case 1u:
      int64_t result = 3LL;
      break;
    case 2u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      goto LABEL_4;
    case 0xAu:
      int64_t result = 4LL;
      break;
    default:
      if (a3 == 101) {
        int64_t result = 8LL;
      }
      else {
LABEL_4:
      }
        int64_t result = 0LL;
      break;
  }

  return result;
}

+ (void)_destinationForRequest:(id)a3 completion:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100051904;
  v7[3] = &unk_100241EB0;
  id v8 = v4;
  id v6 = v4;
  [v5 resolveActivePlayerPathWithCompletion:v7];
}

+ (id)_entityForFetchRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100051BE4;
  v32 = sub_100051BF4;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100051BE4;
  v26 = sub_100051BF4;
  id v27 = 0LL;
  __int128 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  __int128 v16 = sub_100051BFC;
  __int128 v17 = &unk_100241ED8;
  uint64_t v20 = &v22;
  id v6 = v5;
  id v18 = v6;
  id v7 = v3;
  id v19 = v7;
  id v21 = &v28;
  id v8 = [v6 performBlockAndWait:&v14];
  if (v29[5])
  {
    uint64_t v9 = _MTLogCategoryMediaRemote(v8);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v29[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Error fetching episodeGuid while setting play queue: %@",  buf,  0xCu);
    }

    id v12 = 0LL;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23[5], "firstObject", v14, v15, v16, v17, v18));
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

@end