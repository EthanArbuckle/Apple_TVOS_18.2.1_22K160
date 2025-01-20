@interface MRDNowPlayingPlaybackQueueServer
- (id)_resolveRequest:(id)a3 withCapabilities:(unint64_t)a4;
- (unsigned)_cachingPolicyForRequest:(id)a3;
- (void)handlePlaybackQueueRequest:(id)a3 fromClient:(id)a4;
- (void)relayArtworkRequest:(id)a3 forContentItems:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 andNotifyXPCClient:(id)a7;
- (void)relayPlaybackQueueRequest:(id)a3 withMessage:(id)a4 toNowPlayingClient:(id)a5 backToXpcClient:(id)a6 completion:(id)a7;
- (void)sendPlaybackQueueResponse:(id)a3 forRequest:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 toXpcClient:(id)a7;
@end

@implementation MRDNowPlayingPlaybackQueueServer

- (void)handlePlaybackQueueRequest:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MRCreatePlaybackQueueRequestFromXPCMessage(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v10 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"handlePlaybackQueueRequest",  v8);
  uint64_t v12 = _MRLogForCategory(10LL, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100094938;
  v45[3] = &unk_10039DED0;
  id v14 = v9;
  id v46 = v14;
  v15 = objc_retainBlock(v45);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 nowPlayingServer]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 queryExistingPlayerPathForXPCMessage:v6 forClient:v7]);

  if ([v18 error])
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100094D50;
    v43[3] = &unk_100399350;
    id v19 = v18;
    id v44 = v19;
    sub_10013ADE4(v6, v43);
    v20 = -[NSError initWithMRError:]([NSError alloc], "initWithMRError:", [v19 error]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 unresolvedPlayerPath]);
    ((void (*)(void *, void *, void *, void, NSError *))v15[2])(v15, v8, v21, 0LL, v20);

    v22 = v44;
  }

  else
  {
    id v36 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClient]);
    v35 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingPlaybackQueueServer _resolveRequest:withCapabilities:]( self,  "_resolveRequest:withCapabilities:",  v8,  [v23 playbackQueueCapabilities]));

    objc_msgSend( v7,  "setHasRequestedLegacyNowPlayingInfo:",  objc_msgSend(v22, "isLegacyNowPlayingInfoRequest") | objc_msgSend( v7,  "hasRequestedLegacyNowPlayingInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v7 playbackQueueRequests]);
    v25 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v18 playerPath]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v24 subscriptionControllerForPlayerPath:v26]);

    [v27 addRequest:v22];
    v28 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClient]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 playerPath]);

    v34 = v25;
    id v30 = (id)-[MRDNowPlayingPlaybackQueueServer _cachingPolicyForRequest:](v25, "_cachingPolicyForRequest:", v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClient]);
    id v42 = 0LL;
    v32 = (void *)objc_claimAutoreleasedReturnValue( [v31 playbackQueueForRequest:v22 cachingPolicy:v30 playerPath:v29 partiallyCachedItems:&v42]);
    id v33 = v42;

    if (v32)
    {
      -[MRDNowPlayingPlaybackQueueServer sendPlaybackQueueResponse:forRequest:withMessage:fromNowPlayingClient:toXpcClient:]( v34,  "sendPlaybackQueueResponse:forRequest:withMessage:fromNowPlayingClient:toXpcClient:",  v32,  v22,  v6,  v18,  v7);
      ((void (*)(void *, void *, void *, void *, void))v15[2])(v15, v22, v29, v32, 0LL);
      if ([v33 count]) {
        -[MRDNowPlayingPlaybackQueueServer relayArtworkRequest:forContentItems:withMessage:fromNowPlayingClient:andNotifyXPCClient:]( v34,  "relayArtworkRequest:forContentItems:withMessage:fromNowPlayingClient:andNotifyXPCClient:",  v22,  v33,  v6,  v18,  v7);
      }
    }

    else
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100094D94;
      v37[3] = &unk_10039DEF8;
      id v38 = v27;
      id v39 = v22;
      v41 = v15;
      id v40 = v29;
      -[MRDNowPlayingPlaybackQueueServer relayPlaybackQueueRequest:withMessage:toNowPlayingClient:backToXpcClient:completion:]( v34,  "relayPlaybackQueueRequest:withMessage:toNowPlayingClient:backToXpcClient:completion:",  v39,  v6,  v18,  v7,  v37);
    }

    id v14 = v36;
    v8 = v35;
  }
}

- (void)sendPlaybackQueueResponse:(id)a3 forRequest:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 toXpcClient:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue([a7 playbackQueueRequests]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 playerPath]);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 subscriptionControllerForPlayerPath:v16]);
  [v17 subscribeToPlaybackQueue:v11 forRequest:v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100094F0C;
  v19[3] = &unk_100399350;
  id v20 = v11;
  id v18 = v11;
  sub_10013ADE4(v13, v19);
}

- (void)relayPlaybackQueueRequest:(id)a3 withMessage:(id)a4 toNowPlayingClient:(id)a5 backToXpcClient:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v17 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"relayPlaybackQueueRequest",  v11);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 xpcClient]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 displayName]);

  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v12 xpcClient]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 displayName]);
    -[NSMutableString appendFormat:](v17, "appendFormat:", @" for %@", v22);
  }

  uint64_t v23 = _MRLogForCategory(10LL, v20);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v17;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100095268;
  v43[3] = &unk_10039DF20;
  id v25 = v12;
  id v44 = v25;
  id v26 = v11;
  id v45 = v26;
  id v46 = v16;
  id v47 = v13;
  id v37 = v13;
  id v27 = v16;
  v28 = objc_retainBlock(v43);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v25 playerPath]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v14 playbackQueueRequests]);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 subscriptionControllerForPlayerPath:v29]);
  xpc_dictionary_set_uint64(v15, "MRXPC_MESSAGE_ID_KEY", 0x700000000000002uLL);
  MRAddPlayerPathToXPCMessage(v15, v29);
  MRAddPlaybackQueueRequestToXPCMessage(v15, v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v25 xpcClient]);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100095688;
  v38[3] = &unk_10039DF48;
  id v39 = v31;
  id v40 = v26;
  id v41 = v25;
  id v42 = v28;
  id v33 = v28;
  id v34 = v25;
  id v35 = v26;
  id v36 = v31;
  [v32 relayXPCMessage:v15 andReply:1 resultCallback:v38];
}

- (void)relayArtworkRequest:(id)a3 forContentItems:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 andNotifyXPCClient:(id)a7
{
  id v11 = a3;
  id v36 = a5;
  id v12 = a6;
  id v35 = a7;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100095AD4;
  v41[3] = &unk_10039DF70;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v12 playerPath]);
  id v42 = v15;
  id v16 = v11;
  id v43 = v16;
  id v17 = v14;
  id v44 = v17;
  id v18 = objc_retainBlock(v41);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "msv_map:", &stru_10039DFB0));

  uint64_t v20 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"requestArtworkForContentItems",  v16);
  v22 = v20;
  if (v15) {
    -[NSMutableString appendFormat:](v20, "appendFormat:", @" for %@", v15);
  }
  if (v19) {
    -[NSMutableString appendFormat:](v22, "appendFormat:", @" because %@", v19);
  }
  uint64_t v23 = _MRLogForCategory(10LL, v21);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if ([v19 count])
  {
    id v25 = -[MRPlaybackQueueRequest initWithIdentifiers:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueueRequest),  "initWithIdentifiers:",  v19);
    [v16 artworkWidth];
    -[MRPlaybackQueueRequest setArtworkWidth:](v25, "setArtworkWidth:");
    [v16 artworkHeight];
    -[MRPlaybackQueueRequest setArtworkHeight:](v25, "setArtworkHeight:");
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
    -[MRPlaybackQueueRequest setRequestIdentifier:](v25, "setRequestIdentifier:", v27);

    v28 = objc_alloc(&OBJC_CLASS___NSString);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v16 label]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v16 requestIdentifier]);
    v31 = -[NSString initWithFormat:](v28, "initWithFormat:", @"ArtworkRequest for %@<%@>", v29, v30);
    -[MRPlaybackQueueRequest setLabel:](v25, "setLabel:", v31);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100095E54;
    v37[3] = &unk_10039E018;
    id v38 = v15;
    v32 = v35;
    id v39 = v35;
    id v40 = v18;
    id v33 = v36;
    -[MRDNowPlayingPlaybackQueueServer relayPlaybackQueueRequest:withMessage:toNowPlayingClient:backToXpcClient:completion:]( self,  "relayPlaybackQueueRequest:withMessage:toNowPlayingClient:backToXpcClient:completion:",  v25,  v36,  v12,  v39,  v37);
  }

  else
  {
    ((void (*)(void *, void, void))v18[2])(v18, 0LL, 0LL);
    v32 = v35;
    id v33 = v36;
  }
}

- (unsigned)_cachingPolicyForRequest:(id)a3
{
  unsigned int result = [a3 cachingPolicy];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (id)_resolveRequest:(id)a3 withCapabilities:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  id v7 = v5;
  if (!a4)
  {
    id v7 = [v5 copy];
    if ([v7 rangeContainsNowPlayingItem])
    {
      if ([v7 location]) {
        [v7 setLocation:0];
      }
      if (![v7 length]) {
        goto LABEL_12;
      }
      uint64_t v8 = 1LL;
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    [v7 setLength:v8];
LABEL_12:
  }

  return v7;
}

@end