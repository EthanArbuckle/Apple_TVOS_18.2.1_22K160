@interface IntentHandler
- (NSString)endpointIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)siriLanguageCode;
- (NSString)speakerSharedUserID;
- (SoundScapesInterface)interface;
- (id)handlerForIntent:(id)a3;
- (void)handleAddMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4;
- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlayShuffledForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackQueueLocationForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackRepeatModeForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackSpeedForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)setEndpointIdentifier:(id)a3;
- (void)setInterface:(id)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setSiriLanguageCode:(id)a3;
- (void)setSpeakerSharedUserID:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  if (!self->_interface)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___SoundScapesInterface);
    interface = self->_interface;
    self->_interface = v5;
  }

  id v7 = [v4 _idiom];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 _endpointId]);
  -[IntentHandler setEndpointIdentifier:](self, "setEndpointIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 _mediaRouteId]);
  -[IntentHandler setMediaRouteIdentifier:](self, "setMediaRouteIdentifier:", v9);

  v10 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  self->_endpointIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[SSAssistantService siriLanguageCodeForEndpoint:]( &OBJC_CLASS___SSAssistantService,  "siriLanguageCodeForEndpoint:",  v10));
  -[IntentHandler setSiriLanguageCode:](self, "setSiriLanguageCode:", v11);

  id v12 = sub_10000108C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler mediaRouteIdentifier](self, "mediaRouteIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler siriLanguageCode](self, "siriLanguageCode"));
    int v18 = 134218754;
    id v19 = v7;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2112;
    v23 = v15;
    __int16 v24 = 2112;
    v25 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Request originated on deviceType: %ld deviceID: %@ with mediaRouteId %@ and languageCode: %@",  (uint8_t *)&v18,  0x2Au);
  }

  return self;
}

- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_1000016A8;
  v38 = sub_1000016B8;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_1000016A8;
  v32 = sub_1000016B8;
  id v33 = 0LL;
  id v8 = sub_10000108C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[IntentHandler resolveMediaItemsForPlayMedia:withCompletion:]";
    __int16 v46 = 2112;
    id v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaSearch]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaName]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lowercaseString]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:@" " withString:&stru_100004278]);

  if (!v13)
  {
    id v14 = sub_10000108C();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received empty intent, Playing random from soundscapes",  buf,  2u);
    }
  }

  interface = self->_interface;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler siriLanguageCode](self, "siriLanguageCode"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000016C0;
  v27[3] = &unk_100004210;
  v27[4] = &v40;
  v27[5] = &v28;
  v27[6] = &v34;
  -[SoundScapesInterface queryDeviceAssetStatus:siriLanguageCode:withCompletion:]( interface,  "queryDeviceAssetStatus:siriLanguageCode:withCompletion:",  v13,  v17,  v27);

  if (*((_BYTE *)v41 + 24))
  {
    int v18 = objc_alloc(&OBJC_CLASS___INMediaItem);
    uint64_t v19 = v35[5];
    uint64_t v20 = v29[5];
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaSearch]);
    __int16 v22 = -[INMediaItem initWithIdentifier:title:type:artwork:artist:]( v18,  "initWithIdentifier:title:type:artwork:artist:",  v19,  v20,  [v21 mediaType],  0,  0);

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[INMediaItemResolutionResult successWithResolvedMediaItem:]( &OBJC_CLASS___INMediaItemResolutionResult,  "successWithResolvedMediaItem:",  v22));
    __int16 v24 = -[INPlayMediaMediaItemResolutionResult initWithMediaItemResolutionResult:]( objc_alloc(&OBJC_CLASS___INPlayMediaMediaItemResolutionResult),  "initWithMediaItemResolutionResult:",  v23);
  }

  else
  {
    __int16 v24 = (INPlayMediaMediaItemResolutionResult *)objc_claimAutoreleasedReturnValue( +[INPlayMediaMediaItemResolutionResult unsupported]( &OBJC_CLASS___INPlayMediaMediaItemResolutionResult,  "unsupported"));
  }

  if (v24) {
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v24));
  }
  else {
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  v26 = (void *)v25;
  v7[2](v7, v25);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

- (void)resolvePlaybackRepeatModeForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if ([v8 playbackRepeatMode] == (id)3 || objc_msgSend(v8, "playbackRepeatMode") == (id)2) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[INPlaybackRepeatModeResolutionResult unsupported]( &OBJC_CLASS___INPlaybackRepeatModeResolutionResult,  "unsupported"));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[INPlaybackRepeatModeResolutionResult successWithResolvedPlaybackRepeatMode:]( &OBJC_CLASS___INPlaybackRepeatModeResolutionResult,  "successWithResolvedPlaybackRepeatMode:",  1LL));
  }
  id v7 = (void *)v6;
  v5[2](v5, v6);
}

- (void)resolvePlayShuffledForPlayMedia:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(void))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 playShuffled]);
  unsigned int v7 = [v6 BOOLValue];

  if (v7) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[INBooleanResolutionResult unsupported](&OBJC_CLASS___INBooleanResolutionResult, "unsupported"));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[INBooleanResolutionResult successWithResolvedValue:]( &OBJC_CLASS___INBooleanResolutionResult,  "successWithResolvedValue:",  0LL));
  }
  id v9 = (id)v8;
  v5[2](v5);
}

- (void)resolvePlaybackQueueLocationForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  if ([v8 playbackQueueLocation] == (id)2 || objc_msgSend(v8, "playbackQueueLocation") == (id)3) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[INPlaybackQueueLocationResolutionResult unsupported]( &OBJC_CLASS___INPlaybackQueueLocationResolutionResult,  "unsupported"));
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[INPlaybackQueueLocationResolutionResult successWithResolvedPlaybackQueueLocation:]( &OBJC_CLASS___INPlaybackQueueLocationResolutionResult,  "successWithResolvedPlaybackQueueLocation:",  1LL));
  }
  unsigned int v7 = (void *)v6;
  v5[2](v5, v6);
}

- (void)resolvePlaybackSpeedForPlayMedia:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(void))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 playbackSpeed]);

  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[INPlayMediaPlaybackSpeedResolutionResult unsupported]( &OBJC_CLASS___INPlayMediaPlaybackSpeedResolutionResult,  "unsupported"));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[INPlayMediaPlaybackSpeedResolutionResult successWithResolvedValue:]( &OBJC_CLASS___INPlayMediaPlaybackSpeedResolutionResult,  "successWithResolvedValue:",  1.0));
  }
  id v8 = (id)v7;
  v5[2](v5);
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000108C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "-[IntentHandler handlePlayMedia:completion:]";
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 privatePlayMediaIntentData]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 privateMediaIntentData]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 speakerIDInfo]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedUserID]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItems]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
  v16 = (char *)objc_claimAutoreleasedReturnValue([v15 identifier]);

  id v17 = objc_alloc_init(&OBJC_CLASS___SSPlaybackContext);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 airPlayRouteIds]);
  [v17 setAirPlayRouteIDs:v18];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v17 setIntentIdentifier:v19];

  [v17 setSharedUserIdentifier:v13];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
  [v17 setEndpointIdentifier:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler mediaRouteIdentifier](self, "mediaRouteIdentifier"));
  [v17 setMediaRouteIdentifier:v21];

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler siriLanguageCode](self, "siriLanguageCode"));
  [v17 setSiriLanguageCode:v22];

  [v17 setPlayMediaItemIdentifier:v16];
  id v23 = sub_10000108C();
  __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    uint64_t v34 = v16;
    __int16 v35 = 2113;
    id v36 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received MediaItemIdentifier..%{private}@ PlaybackContext %{private}@",  buf,  0x16u);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 _endpointId]);
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v6 _endpointId]);
    BOOL v27 = [v26 length] != 0;
  }

  else
  {
    BOOL v27 = 0LL;
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSAnalyticsManager analyticsManager](&OBJC_CLASS___SSAnalyticsManager, "analyticsManager"));
  [v28 sendPlayIntent:v27];

  interface = self->_interface;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100001CD8;
  v31[3] = &unk_100004238;
  id v32 = v7;
  id v30 = v7;
  -[SoundScapesInterface sendPlaybackQueueWithPlaybackContext:withCompletion:]( interface,  "sendPlaybackQueueWithPlaybackContext:withCompletion:",  v17,  v31);
}

- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4
{
  id v4 = (void (**)(id, void *))a4;
  id v5 = sub_10000108C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[IntentHandler resolveMediaDestinationForAddMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s : Unsupported task", (uint8_t *)&v8, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[INAddMediaMediaDestinationResolutionResult unsupported]( &OBJC_CLASS___INAddMediaMediaDestinationResolutionResult,  "unsupported"));
  v4[2](v4, v7);
}

- (void)handleAddMedia:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  id v5 = sub_10000108C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[IntentHandler handleAddMedia:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s : Unsupported task", (uint8_t *)&v8, 0xCu);
  }

  id v7 = -[INAddMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INAddMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
  v4[2](v4, v7);
}

- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = sub_10000108C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    __int16 v22 = "-[IntentHandler handleUpdateMediaAffinity:completion:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, %@", (uint8_t *)&v21, 0x16u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___SSPlaybackContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v10 setIntentIdentifier:v11];

  objc_msgSend(v10, "setLikeAffinity:", objc_msgSend(v6, "affinityType") == (id)1);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
  [v10 setEndpointIdentifier:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler mediaRouteIdentifier](self, "mediaRouteIdentifier"));
  [v10 setMediaRouteIdentifier:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler siriLanguageCode](self, "siriLanguageCode"));
  [v10 setSiriLanguageCode:v14];

  interface = self->_interface;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaSearch]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 mediaIdentifier]);
  -[SoundScapesInterface updateMediaAffinity:withPlaybackContext:]( interface,  "updateMediaAffinity:withPlaybackContext:",  v17,  v10);

  id v18 = sub_10000108C();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v21 = 138477827;
    __int16 v22 = (const char *)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Evaluating affinity request with context %{private}@",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v20 = -[INUpdateMediaAffinityIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INUpdateMediaAffinityIntentResponse),  "initWithCode:userActivity:",  3LL,  0LL);
  v7[2](v7, v20);
}

- (NSString)speakerSharedUserID
{
  return self->_speakerSharedUserID;
}

- (void)setSpeakerSharedUserID:(id)a3
{
}

- (SoundScapesInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setMediaRouteIdentifier:(id)a3
{
}

- (NSString)siriLanguageCode
{
  return self->_siriLanguageCode;
}

- (void)setSiriLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end