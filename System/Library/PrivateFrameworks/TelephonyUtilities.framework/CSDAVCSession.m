@interface CSDAVCSession
+ (AVCSessionConfiguration)defaultConfiguration;
+ (TUCallScreenShareAttributes)defaultScreenShareAttributes;
+ (id)avcScreenCaptureConfigurationForScreenAttributes:(id)a3;
+ (int64_t)defaultSessionMode;
- (AVCScreenCapture)avcScreenCapture;
- (AVCSession)session;
- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3;
- (BOOL)hasCalledStop;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isAudioReady;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRelaying;
- (BOOL)isRemoteScreenEnabledForParticipant:(id)a3;
- (BOOL)isScreenEnabled;
- (BOOL)isScreening;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)shouldDisableOneToOneModeForScreenShare;
- (BOOL)shouldIgnoreBenignErrorOnStart:(id)a3;
- (CGRect)presentationRect;
- (CSDAVCSession)initWithSessionCreationBlock:(id)a3 transportToken:(id)a4 delegate:(id)a5 queue:(id)a6 reportingHierarchyToken:(id)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 captureSessionCreationBlock:(id)a10;
- (CSDAVCSession)initWithTransportToken:(id)a3 delegate:(id)a4 queue:(id)a5 reportingHierarchyToken:(id)a6 oneToOneModeEnabled:(BOOL)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 report:(id)a10 serviceName:(id)a11 ABTestConfiguration:(id)a12;
- (CSDAVCSessionDelegate)delegate;
- (NSData)localParticipantData;
- (NSMutableArray)captureSessionQueue;
- (NSMutableArray)sessionUpdateCompletionQueue;
- (NSMutableDictionary)pendingRemovedParticipantsByID;
- (NSMutableDictionary)remoteParticipantsByIdentifier;
- (NSNumber)mostRecentCompletedOneToOneEnabledValue;
- (NSString)sessionIdentifier;
- (OS_dispatch_queue)queue;
- (TUCallScreenShareAttributes)currentLocalScreenShareAttributes;
- (TUCallScreenShareAttributes)mostRecentScreenShareAttributes;
- (TUFeatureFlags)featureFlags;
- (id)avcSessionParticipantCreationBlock;
- (id)captureSessionCreationBlock;
- (id)localParticipantDataWithVersion:(unint64_t)a3;
- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3;
- (int)presentationState;
- (int64_t)localCaptionsToken;
- (int64_t)maxVideoDecodesAllowed;
- (int64_t)sessionToken;
- (unsigned)captureCapabilities;
- (unsigned)presentationLayoutForGridDisplayMode:(unint64_t)a3;
- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6;
- (void)beginParticipantUpdates;
- (void)commitParticipantUpdates;
- (void)participant:(id)a3 didReact:(id)a4;
- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4;
- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5;
- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4;
- (void)participant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4;
- (void)participant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4;
- (void)participant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5;
- (void)participant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4;
- (void)participant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4;
- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)queueAddParticipantRetryBlock:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6;
- (void)removeParticipant:(id)a3;
- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5;
- (void)session:(id)a3 addParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 didDetectError:(id)a4;
- (void)session:(id)a3 didReact:(id)a4;
- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 didStopWithError:(id)a4;
- (void)session:(id)a3 didStopWithError:(id)a4 metadata:(id)a5;
- (void)session:(id)a3 didUpdate:(BOOL)a4 configuration:(id)a5 error:(id)a6;
- (void)session:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)session:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5;
- (void)session:(id)a3 mixingDidStopForMediaType:(unsigned int)a4;
- (void)session:(id)a3 oneToOneEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 removeParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)sessionDidStopReacting:(id)a3;
- (void)sessionServerDidDisconnect:(id)a3;
- (void)sessionShouldReconnect:(id)a3;
- (void)setAudioAndVideoMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setAudioReady:(BOOL)a3;
- (void)setAvcScreenCapture:(id)a3;
- (void)setAvcSessionParticipantCreationBlock:(id)a3;
- (void)setCaptureCapabilities:(unsigned __int8)a3;
- (void)setCurrentLocalScreenShareAttributes:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setFeatureFlags:(id)a3;
- (void)setGridDisplayMode:(unint64_t)a3;
- (void)setHasCalledStop:(BOOL)a3;
- (void)setMostRecentCompletedOneToOneEnabledValue:(id)a3;
- (void)setMostRecentScreenShareAttributes:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationState:(int)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4;
- (void)setScreenEnabled:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVideoQuality:(unint64_t)a3 visibility:(id)a4 prominence:(id)a5 spatialPosition:(CGRect)a6 isInCanvas:(BOOL)a7 forParticipantWithIdentifier:(unint64_t)a8;
- (void)start;
- (void)startAVCScreenCaptureWithAttributes:(id)a3 preferImmediateActivation:(BOOL)a4 screenControlEnabled:(BOOL)a5 capturesCursor:(BOOL)a6;
- (void)stop;
- (void)stopWithError:(id)a3;
- (void)updateConfigurationSessionMode:(int64_t)a3;
@end

@implementation CSDAVCSession

- (CSDAVCSession)initWithSessionCreationBlock:(id)a3 transportToken:(id)a4 delegate:(id)a5 queue:(id)a6 reportingHierarchyToken:(id)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 captureSessionCreationBlock:(id)a10
{
  v15 = (uint64_t (**)(id, id, id, id))a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___CSDAVCSession;
  v21 = -[CSDAVCSession init](&v57, "init");
  if (v21)
  {
    uint64_t v22 = v15[2](v15, v16, v19, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v23)
    {
      objc_storeStrong((id *)&v21->_queue, a6);
      objc_storeStrong((id *)&v21->_session, v23);
      objc_storeWeak((id *)&v21->_delegate, v17);
      v21->_hasCalledStop = 0;
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      remoteParticipantsByIdentifier = v21->_remoteParticipantsByIdentifier;
      v21->_remoteParticipantsByIdentifier = (NSMutableDictionary *)v24;

      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      pendingRemovedParticipantsByID = v21->_pendingRemovedParticipantsByID;
      v21->_pendingRemovedParticipantsByID = (NSMutableDictionary *)v26;

      v21->_video = a8 == 2;
      v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      sessionUpdateCompletionQueue = v21->_sessionUpdateCompletionQueue;
      v21->_sessionUpdateCompletionQueue = v28;

      v30 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
      captureSessionQueue = v21->_captureSessionQueue;
      v21->_captureSessionQueue = v30;

      id v32 = objc_retainBlock(v20);
      id captureSessionCreationBlock = v21->_captureSessionCreationBlock;
      v21->_id captureSessionCreationBlock = v32;

      v21->_captureCapabilities = +[AVCScreenCapture captureCapabilities]( &OBJC_CLASS___AVCScreenCapture,  "captureCapabilities");
      mostRecentScreenShareAttributes = v21->_mostRecentScreenShareAttributes;
      v21->_mostRecentScreenShareAttributes = 0LL;

      BOOL v35 = 0LL;
      if (a9) {
        BOOL v35 = -[CSDAVCSession isVideo](v21, "isVideo", 0LL);
      }
      [v23 setVideoEnabled:v35];
      objc_initWeak(&location, v21);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1001587F4;
      v54[3] = &unk_1003DB640;
      objc_copyWeak(&v55, &location);
      v36 = objc_retainBlock(v54);
      id avcSessionParticipantCreationBlock = v21->_avcSessionParticipantCreationBlock;
      v21->_id avcSessionParticipantCreationBlock = v36;

      unsigned __int8 v38 = +[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo");
      if (a8 == 2) {
        unsigned __int8 v39 = v38;
      }
      else {
        unsigned __int8 v39 = 0;
      }
      if ((v39 & 1) == 0)
      {
        id v40 = sub_1001704C4();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Updating session to videoEnabled=NO after creation since current device or call does not support video",  buf,  2u);
        }

        [v23 setVideoEnabled:0];
        if (!a8) {
          [v23 setAudioEnabled:0];
        }
      }

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }

    else
    {
      id v42 = sub_1001704C4();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1002B8910(v43, v44, v45, v46, v47, v48, v49, v50);
      }

      v21 = 0LL;
    }
  }

  return v21;
}

- (CSDAVCSession)initWithTransportToken:(id)a3 delegate:(id)a4 queue:(id)a5 reportingHierarchyToken:(id)a6 oneToOneModeEnabled:(BOOL)a7 avMode:(unint64_t)a8 videoEnabled:(BOOL)a9 report:(id)a10 serviceName:(id)a11 ABTestConfiguration:(id)a12
{
  id v30 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  objc_initWeak(location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100158A84;
  v34[3] = &unk_1003DB668;
  v23 = self;
  BOOL v35 = v23;
  BOOL v39 = a7;
  id v24 = v20;
  id v36 = v24;
  id v25 = v21;
  id v37 = v25;
  id v26 = v22;
  id v38 = v26;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100158D28;
  v32[3] = &unk_1003DB690;
  objc_copyWeak(&v33, location);
  LOBYTE(v29) = a9;
  v27 = -[CSDAVCSession initWithSessionCreationBlock:transportToken:delegate:queue:reportingHierarchyToken:avMode:videoEnabled:captureSessionCreationBlock:]( v23,  "initWithSessionCreationBlock:transportToken:delegate:queue:reportingHierarchyToken:avMode:videoEnabled:capture SessionCreationBlock:",  v34,  v30,  v17,  v18,  v19,  a8,  v29,  v32);
  objc_destroyWeak(&v33);

  objc_destroyWeak(location);
  return v27;
}

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

+ (AVCSessionConfiguration)defaultConfiguration
{
  v3 = objc_alloc_init(&OBJC_CLASS___AVCSessionConfiguration);
  -[AVCSessionConfiguration setSessionMode:](v3, "setSessionMode:", [a1 defaultSessionMode]);
  return v3;
}

+ (int64_t)defaultSessionMode
{
  return 0LL;
}

- (NSData)localParticipantData
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return (NSData *)-[CSDAVCSession localParticipantDataWithVersion:](self, "localParticipantDataWithVersion:", 1LL);
}

- (id)localParticipantDataWithVersion:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 negotiationDataForProtocolVersion:a3 == 2]);

  return v7;
}

- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  LOBYTE(v5) = v8 != 0LL;

  return (char)v5;
}

- (int64_t)sessionToken
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  id v5 = [v4 sessionToken];

  return (int64_t)v5;
}

- (NSString)sessionIdentifier
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

  return (NSString *)v5;
}

- (int64_t)maxVideoDecodesAllowed
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  return 0LL;
}

+ (TUCallScreenShareAttributes)defaultScreenShareAttributes
{
  v2 = objc_alloc_init(&OBJC_CLASS___TUCallScreenShareAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
  -[TUCallScreenShareAttributes setDisplayID:](v2, "setDisplayID:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRect:](&OBJC_CLASS___NSValue, "valueWithRect:", 0.0, 0.0, -1.0, -1.0));
  -[TUCallScreenShareAttributes setOriginalResolution:](v2, "setOriginalResolution:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 60.0));
  -[TUCallScreenShareAttributes setFrameRate:](v2, "setFrameRate:", v5);

  -[TUCallScreenShareAttributes setDeviceFamily:]( v2,  "setDeviceFamily:",  +[TUCallScreenShareAttributes currentDeviceFamily](&OBJC_CLASS___TUCallScreenShareAttributes, "currentDeviceFamily"));
  return v2;
}

- (BOOL)isAudioReady
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_audioReady;
}

- (void)setAudioReady:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  self->_audioReady = a3;
}

- (BOOL)isUplinkMuted
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isAudioMuted];

  return (char)v3;
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "uplinkMuted: %d", (uint8_t *)v9, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v8 setAudioMuted:v3];
}

- (BOOL)isAudioEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isAudioEnabled];

  return (char)v3;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "audioEnabled: %d", (uint8_t *)v9, 8u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v8 setAudioEnabled:v3];
}

- (BOOL)isVideoEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isVideoEnabled];

  return (char)v3;
}

- (BOOL)isScreenEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isScreenEnabled];

  return (char)v3;
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setVideo: %d", (uint8_t *)v10, 8u);
  }

  if (v3)
  {
    id v8 = sub_1001704C4();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Switching to video is currently not supported",  (uint8_t *)v10,  2u);
    }
  }

  else
  {
    self->_video = v3;
  }

- (void)setVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (!v3 || +[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo"))
  {
    id v6 = sub_1001704C4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "videoEnabled: %d", (uint8_t *)v12, 8u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
    [v8 setVideoEnabled:v3];

    if (-[CSDAVCSession captureCapabilities](self, "captureCapabilities") == 1
      && -[CSDAVCSession isScreenEnabled](self, "isScreenEnabled")
      && v3)
    {
      id v9 = sub_1001704C4();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Device does not support screen sharing with camera on, also updating screenEnabled",  (uint8_t *)v12,  2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
      [v11 setScreenEnabled:0];
    }
  }

- (void)setScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v7 = objc_msgSend((id)objc_opt_class(self, v6), "defaultScreenShareAttributes");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[CSDAVCSession setScreenEnabled:attributes:](self, "setScreenEnabled:attributes:", v3, v8);
}

- (BOOL)isVideoPaused
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isVideoPaused];

  return (char)v3;
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "videoPaused: %d", (uint8_t *)v9, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v8 setVideoPaused:v3];
}

- (BOOL)isAudioPaused
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isAudioPaused];

  return (char)v3;
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "audioPaused: %d", (uint8_t *)v9, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v8 setAudioPaused:v3];
}

- (BOOL)isOneToOneModeEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  LOBYTE(v3) = [v4 isOneToOneEnabled];

  return (char)v3;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  unsigned int v7 = [v6 isOneToOneEnabled];

  if (v7 != v3) {
    -[CSDAVCSession setOneToOneModeEnabled:withCompletionBlock:]( self,  "setOneToOneModeEnabled:withCompletionBlock:",  v3,  0LL);
  }
}

- (int)presentationState
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  id v5 = v4;
  if (v4)
  {
    [v4 presentationInfo];
    int v6 = v8;

    else {
      return 0;
    }
  }

  else
  {

    return 0;
  }

- (void)setPresentationState:(int)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDAVCSession beginParticipantUpdates](self, "beginParticipantUpdates");
  else {
    char v6 = a3;
  }
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  unsigned __int8 v8 = v7;
  if (v7)
  {
    [v7 presentationInfo];
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v16 = 0u;
  }

  BYTE8(v18) = v6;
  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v20 = BYTE8(v18);
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "presentationState: %d", buf, 8u);
  }

  __int128 v13 = v16;
  __int128 v14 = v17;
  __int128 v15 = v18;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  v12[0] = v13;
  v12[1] = v14;
  _DWORD v12[2] = v15;
  [v11 setPresentationInfo:v12];

  -[CSDAVCSession commitParticipantUpdates](self, "commitParticipantUpdates");
}

- (CGRect)presentationRect
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  id v5 = v4;
  if (v4)
  {
    [v4 presentationInfo];
    double v6 = v15;
    double v7 = v14;
    double v8 = v17;
    double v9 = v16;
  }

  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }

  double v10 = v7;
  double v11 = v6;
  double v12 = v9;
  double v13 = v8;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  -[CSDAVCSession beginParticipantUpdates](self, "beginParticipantUpdates");
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  double v10 = v9;
  if (v9)
  {
    [v9 presentationInfo];
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v18 = 0u;
  }

  *(CGFloat *)&__int128 v18 = x;
  *((CGFloat *)&v18 + 1) = y;
  *(CGFloat *)&__int128 v19 = width;
  *((CGFloat *)&v19 + 1) = height;
  id v11 = sub_1001704C4();
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v22 = v18;
    __int16 v23 = 2048;
    uint64_t v24 = *((void *)&v18 + 1);
    __int16 v25 = 2048;
    uint64_t v26 = v19;
    __int16 v27 = 2048;
    uint64_t v28 = *((void *)&v19 + 1);
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "presentationRect: (%f, %f, %f, %f)",  buf,  0x2Au);
  }

  __int128 v15 = v18;
  __int128 v16 = v19;
  __int128 v17 = v20;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  [v13 setPresentationInfo:v14];

  -[CSDAVCSession commitParticipantUpdates](self, "commitParticipantUpdates");
}

- (void)setGridDisplayMode:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDAVCSession beginParticipantUpdates](self, "beginParticipantUpdates");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  double v7 = v6;
  if (v6)
  {
    [v6 presentationInfo];
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v15 = 0u;
  }

  DWORD1(v17) = -[CSDAVCSession presentationLayoutForGridDisplayMode:]( self,  "presentationLayoutForGridDisplayMode:",  a3);
  id v8 = sub_1001704C4();
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v19 = DWORD1(v17);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setting presentationLayout: (%u)", buf, 8u);
  }

  __int128 v12 = v15;
  __int128 v13 = v16;
  __int128 v14 = v17;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  [v10 setPresentationInfo:v11];

  -[CSDAVCSession commitParticipantUpdates](self, "commitParticipantUpdates");
}

- (unsigned)presentationLayoutForGridDisplayMode:(unint64_t)a3
{
  return a3 == 1;
}

+ (id)avcScreenCaptureConfigurationForScreenAttributes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AVCScreenCaptureConfiguration);
  objc_msgSend(v5, "setIsWindowed:", objc_msgSend(v4, "isWindowed"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 windowUUID]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v5 setSelectiveScreenUUID:v7];

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 displayID]);
  if (v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 displayID]);
  }

  else
  {
    id v11 = objc_msgSend((id)objc_opt_class(a1, v8), "defaultScreenShareAttributes");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v12 displayID]);
  }

  objc_msgSend(v5, "setScreenCaptureDisplayID:", objc_msgSend(v10, "unsignedIntValue"));
  return v5;
}

- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  int v8 = TUSharePlayForceDisabled();
  id v9 = sub_1001704C4();
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "screenEnabled is not supported - returning",  buf,  2u);
    }

    goto LABEL_34;
  }

  if (v11)
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v39[0]) = v4;
    WORD2(v39[0]) = 2112;
    *(void *)((char *)v39 + 6) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "setScreenEnabled:%d screenShareAttributes: %@",  buf,  0x12u);
  }

  if (v4)
  {
    -[CSDAVCSession setCurrentLocalScreenShareAttributes:](self, "setCurrentLocalScreenShareAttributes:", v6);
    unsigned int v12 = -[CSDAVCSession captureCapabilities](self, "captureCapabilities");
    if (v12 == 1)
    {
      if (-[CSDAVCSession isVideoEnabled](self, "isVideoEnabled"))
      {
        id v22 = sub_1001704C4();
        __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Device does not support screen sharing with camera on, also updating videoEnabled",  buf,  2u);
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
        [v24 setVideoEnabled:0];
      }
    }

    else if (!v12)
    {
      id v13 = sub_1001704C4();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Device does not support screen sharing, ignoring to set screenEnabled",  buf,  2u);
      }

      goto LABEL_34;
    }

    objc_initWeak(&location, self);
    id v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    id v32 = sub_10015A510;
    id v33 = &unk_1003DB6B8;
    objc_copyWeak(&v35, &location);
    BOOL v36 = v4;
    id v34 = v6;
    __int16 v25 = objc_retainBlock(&v30);
    if (-[CSDAVCSession isOneToOneModeEnabled](self, "isOneToOneModeEnabled", v30, v31, v32, v33)) {
      unsigned int v26 = -[CSDAVCSession shouldDisableOneToOneModeForScreenShare](self, "shouldDisableOneToOneModeForScreenShare");
    }
    else {
      unsigned int v26 = 0;
    }
    id v27 = sub_1001704C4();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = @"NO";
      if (v26) {
        uint64_t v29 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v39[0] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Determined shouldSwitchToGFTMode: %@",  buf,  0xCu);
    }

    if (v26) {
      -[CSDAVCSession setOneToOneModeEnabled:withCompletionBlock:]( self,  "setOneToOneModeEnabled:withCompletionBlock:",  0LL,  v25);
    }
    else {
      ((void (*)(void ***))v25[2])(v25);
    }

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  else
  {
    -[CSDAVCSession setCurrentLocalScreenShareAttributes:](self, "setCurrentLocalScreenShareAttributes:", 0LL);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
    [v15 setScreenEnabled:0];

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));
    if (v16)
    {
      id v17 = sub_1001704C4();
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));
        *(_DWORD *)buf = 138412290;
        v39[0] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Stopped capture of %@", buf, 0xCu);
      }

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));
      [v20 stopCapture];
    }

    else
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
      [v20 session:self changedScreenEnabled:0 didSucceed:1 error:0];
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession captureSessionQueue](self, "captureSessionQueue"));
    [v21 removeAllObjects];
  }

- (void)setOneToOneModeEnabled:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109120;
      LODWORD(v19) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Queueing completion block to execute after updating oneToOneEnabled: %d",  (uint8_t *)&v18,  8u);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
    id v11 = [v6 copy];
    [v10 addObject:v11];
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
    [v10 addObject:&stru_1003DB6D8];
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 configuration]);

  [v13 setOneToOneModeEnabled:v4];
  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v16 = @"NO";
    if (v4) {
      __int128 v16 = @"YES";
    }
    int v18 = 138412290;
    int v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "oneToOneEnabled: %@", (uint8_t *)&v18, 0xCu);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v17 updateConfiguration:v13];
}

- (void)startAVCScreenCaptureWithAttributes:(id)a3 preferImmediateActivation:(BOOL)a4 screenControlEnabled:(BOOL)a5 capturesCursor:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v11 = objc_msgSend((id)objc_opt_class(self, v10), "avcScreenCaptureConfigurationForScreenAttributes:", v9);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v12 setIsCursorCaptured:v6];
  -[CSDAVCSession setMostRecentScreenShareAttributes:](self, "setMostRecentScreenShareAttributes:", v9);
  objc_initWeak(&location, self);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10015AC20;
  v35[3] = &unk_1003D7CB0;
  objc_copyWeak(&v37, &location);
  id v13 = v12;
  id v36 = v13;
  id v14 = objc_retainBlock(v35);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10015AD5C;
  v32[3] = &unk_1003D7CB0;
  objc_copyWeak(&v34, &location);
  id v15 = v13;
  id v33 = v15;
  __int128 v16 = objc_retainBlock(v32);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));

  if (v17)
  {
    int v18 = objc_retainBlock(v16);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));
    [v19 stopCapture];

    __int128 v20 = objc_retainBlock(v14);
    if (a4)
    {
      id v21 = sub_1001704C4();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Bypassing capture queue and starting AVCScreenCapture immediately",  v31,  2u);
      }

      v20[2](v20);
      goto LABEL_15;
    }

    id v25 = sub_1001704C4();
    unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Queueing capture completion block to execute after current capture session is stopped",  v31,  2u);
    }

    id v27 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVCSession captureSessionQueue](self, "captureSessionQueue"));
    id v28 = [v20 copy];
    [v27 addObject:v28];

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  unsigned __int8 v24 = [v23 isScreenEnabled];

  if ((v24 & 1) == 0)
  {
    id v29 = sub_1001704C4();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Queueing capture completion block to execute after screen becomes enabled",  v31,  2u);
    }

    __int128 v20 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CSDAVCSession captureSessionQueue](self, "captureSessionQueue"));
    id v27 = [v14 copy];
    [v20 addObject:v27];
    goto LABEL_14;
  }

  ((void (*)(void *))v14[2])(v14);
LABEL_16:

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (BOOL)shouldDisableOneToOneModeForScreenShare
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession featureFlags](self, "featureFlags"));
    unsigned int v9 = [v8 uPlusOneScreenSharing];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 onlyAvailableSessionConversationParticipant:self]);

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 capabilities]);
      unsigned int v7 = [v12 isUPlusOneScreenShareAvailable] ^ 1;
    }

    else
    {
      LOBYTE(v7) = 1;
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)setScreenShareAttributes:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "screenShareAttributes: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession currentLocalScreenShareAttributes](self, "currentLocalScreenShareAttributes"));
  unsigned __int8 v9 = [v8 isEqualToScreenShareAttributes:v4];

  if ((v9 & 1) != 0)
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession currentLocalScreenShareAttributes](self, "currentLocalScreenShareAttributes"));
      int v13 = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      __int128 v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Asked to set screenShareAttributes %@ when local attributes are: %@",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {
    -[CSDAVCSession setCurrentLocalScreenShareAttributes:](self, "setCurrentLocalScreenShareAttributes:", v4);
    -[CSDAVCSession startAVCScreenCaptureWithAttributes:preferImmediateActivation:screenControlEnabled:capturesCursor:]( self,  "startAVCScreenCaptureWithAttributes:preferImmediateActivation:screenControlEnabled:capturesCursor:",  v4,  0LL,  0LL,  1LL);
  }
}

- (void)updateConfigurationSessionMode:(int64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "updatingSessionMode: %ld",  (uint8_t *)&v11,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);

  [v9 setSessionMode:a3];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v10 updateConfiguration:v9];
}

- (void)setRelaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    int v11 = 136315394;
    int64_t v12 = "-[CSDAVCSession setRelaying:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:  %@", (uint8_t *)&v11, 0x16u);
  }

  self->_relaying = v3;
  if (v3 || -[CSDAVCSession isScreening](self, "isScreening")) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = (uint64_t)objc_msgSend((id)objc_opt_class(self, v9), "defaultSessionMode");
  }
  -[CSDAVCSession updateConfigurationSessionMode:](self, "updateConfigurationSessionMode:", v10);
}

- (void)setScreening:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  self->_screening = a3;
}

- (void)queueAddParticipantRetryBlock:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6
{
  id v10 = a3;
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  objc_initWeak(&location, self);
  int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  __int128 v20 = sub_10015B4FC;
  id v21 = &unk_1003DB700;
  objc_copyWeak(&v23, &location);
  id v12 = v10;
  id v22 = v12;
  BOOL v24 = a4;
  BOOL v25 = a5;
  BOOL v26 = a6;
  __int16 v13 = objc_retainBlock(&v18);
  id v14 = sub_1001704C4();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Already have oneToOne transition in progress, delaying addParticipant request for participant: %@",  buf,  0xCu);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAVCSession sessionUpdateCompletionQueue]( self,  "sessionUpdateCompletionQueue",  v18,  v19,  v20,  v21));
  id v17 = [v13 copy];
  [v16 addObject:v17];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
  id v13 = [v12 count];

  if (!v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "session:conversationParticipantWithParticipantIdentifier:",  self,  objc_msgSend(v10, "identifier")));

    if (v15)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 identifier]));
      int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

      if (!v18)
      {
        objc_initWeak((id *)buf, self);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10015B90C;
        v30[3] = &unk_1003DB700;
        objc_copyWeak(&v32, (id *)buf);
        id v31 = v10;
        BOOL v33 = v8;
        BOOL v34 = v7;
        BOOL v35 = v6;
        BOOL v24 = objc_retainBlock(v30);
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allValues]);
        id v27 = [v26 count];

        unsigned int v28 = -[CSDAVCSession isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
        if (v27 == (id)1) {
          unsigned int v29 = v28;
        }
        else {
          unsigned int v29 = 0;
        }
        if (v29 == 1) {
          -[CSDAVCSession setOneToOneModeEnabled:withCompletionBlock:]( self,  "setOneToOneModeEnabled:withCompletionBlock:",  0LL,  v24);
        }
        else {
          ((void (*)(void *))v24[2])(v24);
        }

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
        goto LABEL_18;
      }

      id v19 = sub_1001704C4();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 identifier]));
        *(_DWORD *)buf = 138412290;
        id v37 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to add participant %@ because they're already in the conversation",  buf,  0xCu);
      }
    }

    else
    {
      id v22 = sub_1001704C4();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 identifier]));
        *(_DWORD *)buf = 138412290;
        id v37 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Could not find participant tracking with identifier %@",  buf,  0xCu);
      }
    }

LABEL_18:
    goto LABEL_19;
  }

  -[CSDAVCSession queueAddParticipantRetryBlock:withVideoEnabled:audioPaused:screenEnabled:]( self,  "queueAddParticipantRetryBlock:withVideoEnabled:audioPaused:screenEnabled:",  v10,  v8,  v7,  v6);
LABEL_19:
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
  id v7 = [v6 count];

  if (v7)
  {
    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10015BF08;
    v30[3] = &unk_1003D7CB0;
    objc_copyWeak(&v32, &location);
    id v8 = v4;
    id v31 = v8;
    uint64_t v9 = objc_retainBlock(v30);
    id v10 = sub_1001704C4();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Already have oneToOne transition in progress, delaying removeParticipant request for %@",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
    id v13 = [v9 copy];
    [v12 addObject:v13];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  else
  {
    id v14 = sub_1001704C4();
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "removeParticipant: %@", buf, 0xCu);
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 identifier]));
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession pendingRemovedParticipantsByID](self, "pendingRemovedParticipantsByID"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 identifier]));
    if (v18)
    {
      [v19 setObject:v4 forKeyedSubscript:v20];

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 identifier]));
      [v21 setObject:0 forKeyedSubscript:v22];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
      [v23 removeParticipant:v18];
    }

    else
    {
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v20]);

      id v25 = sub_1001704C4();
      id v23 = (void *)objc_claimAutoreleasedReturnValue(v25);
      BOOL v26 = os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v26)
        {
          id v27 = [v4 identifier];
          *(_DWORD *)buf = 134217984;
          id v35 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find participant %lu in the active participant list, but they're in the list of pending removals",  buf,  0xCu);
        }
      }

      else if (v26)
      {
        id v28 = [v4 identifier];
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
        *(_DWORD *)buf = 134218242;
        id v35 = v28;
        __int16 v36 = 2112;
        id v37 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find participant with identifier %lu all participants: %@",  buf,  0x16u);
      }
    }
  }
}

- (void)setDownlinkMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      unint64_t v15 = a4;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "identifier: %llu downlinkMuted: %d",  (uint8_t *)&v14,  0x12u);
    }

    [v10 setAudioMuted:v5];
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B8978();
    }
  }
}

- (void)setAudioPaused:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      unint64_t v15 = a4;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "identifier: %lu audioPaused: %d",  (uint8_t *)&v14,  0x12u);
    }

    [v10 setAudioPaused:v5];
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B89F4();
    }
  }
}

- (void)setScreenEnabled:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      unint64_t v15 = a4;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "identifier: %lu screenEnabled: %d",  (uint8_t *)&v14,  0x12u);
    }

    [v10 setScreenEnabled:v5];
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B89F4();
    }
  }
}

- (void)setAudioAndVideoMuted:(BOOL)a3 forParticipantWithIdentifier:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      unint64_t v15 = a4;
      __int16 v16 = 1024;
      BOOL v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "identifier: %llu audioAndVideoMuted: %d",  (uint8_t *)&v14,  0x12u);
    }

    [v10 setAudioMuted:v5];
    [v10 setVideoPaused:v5];
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B8978();
    }
  }
}

- (void)setVideoQuality:(unint64_t)a3 visibility:(id)a4 prominence:(id)a5 spatialPosition:(CGRect)a6 isInCanvas:(BOOL)a7 forParticipantWithIdentifier:(unint64_t)a8
{
  BOOL v9 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a4;
  id v18 = a5;
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v19);

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a8));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

  if (v22)
  {
    if (a3 == 2) {
      unsigned int v23 = 10;
    }
    else {
      unsigned int v23 = 5;
    }
    if (a3) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0LL;
    }
    double v25 = x + width * 0.5;
    double v26 = y + height * 0.5;
    else {
      double v27 = 1.0;
    }
    id v28 = sub_1001704C4();
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134220288;
      unint64_t v39 = a8;
      __int16 v40 = 2048;
      unint64_t v41 = a3;
      __int16 v42 = 2048;
      id v43 = [v17 integerValue];
      __int16 v44 = 2048;
      id v45 = [v18 integerValue];
      __int16 v46 = 1024;
      BOOL v47 = v9;
      __int16 v48 = 2048;
      double v49 = v25;
      __int16 v50 = 2048;
      double v51 = v26;
      __int16 v52 = 2048;
      double v53 = v27;
      __int16 v54 = 2048;
      double v55 = width;
      __int16 v56 = 2048;
      double v57 = height;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "identifier: %lu videoQuality: %lu visibility: %lu prominence: %lu positionalInfo: <flags: %u, position: (x: %f, y: %f, z: %f, w: %f, h: %f)>",  buf,  0x62u);
    }

    [v22 setVideoQuality:v24];
    objc_msgSend(v22, "setVisibilityIndex:", objc_msgSend(v17, "integerValue"));
    objc_msgSend(v22, "setProminenceIndex:", objc_msgSend(v18, "integerValue"));
    BOOL v32 = v9;
    double v33 = width;
    double v34 = height;
    double v35 = v25;
    double v36 = v26;
    double v37 = v27;
    [v22 setVideoPositionalInfo:&v32];
  }

  else
  {
    id v30 = sub_1001704C4();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1002B89F4();
    }
  }
}

- (void)beginParticipantUpdates
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v6 beginParticipantConfiguration];
}

- (void)commitParticipantUpdates
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v6 endParticipantConfiguration];
}

- (void)start
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  -[CSDAVCSession setHasCalledStop:](self, "setHasCalledStop:", 0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v6 start];
}

- (void)stop
{
}

- (void)stopWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDAVCSession setHasCalledStop:](self, "setHasCalledStop:", 1LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));

  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Calling stop on screen capture",  (uint8_t *)&v13,  2u);
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession avcScreenCapture](self, "avcScreenCapture"));
    [v9 stopCapture];
  }

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CSDAVCSession: stop with error: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  [v12 stopWithError:v4];
}

- (BOOL)shouldIgnoreBenignErrorOnStart:(id)a3
{
  id v4 = a3;
  if (v4 && -[CSDAVCSession hasCalledStop](self, "hasCalledStop"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if ([v5 isEqualToString:@"GKVoiceChatServiceErrorDomain"]
      && [v4 code] == (id)32028)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedFailureReason]);
      unsigned __int8 v7 = [v6 isEqualToString:@"Stop called on a starting session"];
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = v5;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didStart: %d error: %@", (uint8_t *)v13, 0x12u);
  }

  if (-[CSDAVCSession shouldIgnoreBenignErrorOnStart:](self, "shouldIgnoreBenignErrorOnStart:", v7))
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring avcSession didStart as the error that was returned was benign",  (uint8_t *)v13,  2u);
    }
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    -[os_log_s session:didStart:error:](v12, "session:didStart:error:", self, v5, v7);
  }
}

- (void)session:(id)a3 didStopWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  -[CSDAVCSession session:didStopWithError:metadata:](self, "session:didStopWithError:metadata:", v7, v6, v8);
}

- (void)session:(id)a3 didStopWithError:(id)a4 metadata:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138412290;
    uint64_t v32 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "error: %@", (uint8_t *)&v31, 0xCu);
  }

  id v12 = (NSError *)v7;
  unsigned __int8 v13 = -[CSDAVCSession hasCalledStop](self, "hasCalledStop");
  __int16 v14 = v12;
  if (!v12)
  {
    __int16 v14 = 0LL;
    if ((v13 & 1) == 0) {
      __int16 v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"CSDAVCSessionError",  505LL,  0LL);
    }
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"avcKeySessionSentBytes"]);
  if (v15)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"avcKeySessionSentBytes"]);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
    char isKindOfClass = objc_opt_isKindOfClass(v16, v18);

    if ((isKindOfClass & 1) != 0)
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"avcKeySessionSentBytes"]);
      uint64_t v15 = (uint64_t)[v20 integerValue];
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"avcKeySessionReceivedBytes"]);
  if (v21)
  {
    id v22 = (void *)v21;
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"avcKeySessionReceivedBytes"]);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber, v24);
    char v26 = objc_opt_isKindOfClass(v23, v25);

    if ((v26 & 1) != 0)
    {
      double v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"avcKeySessionReceivedBytes"]);
      v15 += (uint64_t)[v27 integerValue];
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  if (v15 >= 1)
  {
    id v29 = sub_1001704C4();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 134217984;
      uint64_t v32 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Sending delegate bytesOfDataUsageChanged: %ld",  (uint8_t *)&v31,  0xCu);
    }

    [v28 session:self changedBytesOfDataUsed:v15];
  }

  [v28 session:self didStopWithError:v14];
}

- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3
{
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession pendingRemovedParticipantsByID](self, "pendingRemovedParticipantsByID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  return v8;
}

- (void)session:(id)a3 didDetectError:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didDetectError: %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v9 session:self didDetectError:v5];
}

- (void)sessionServerDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1002B8A70((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v14 serverDisconnectedForSession:self];
}

- (void)session:(id)a3 addParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v50 = v9;
    __int16 v51 = 1024;
    LODWORD(v52[0]) = v7;
    WORD2(v52[0]) = 2112;
    *(void *)((char *)v52 + 6) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "addParticipant: %@ didSucceed: %d error: %@",  buf,  0x1Cu);
  }

  id v14 = sub_1001704C4();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
    *(_DWORD *)buf = 138412546;
    id v50 = v9;
    __int16 v51 = 2112;
    v52[0] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "addParticipant: %@ Active remote participants: %@",  buf,  0x16u);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  if (v7)
  {
    id v18 = [v9 captionsToken];
    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v50 = v18;
      __int16 v51 = 2112;
      v52[0] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Got captions token: %lu for participant %@",  buf,  0x16u);
    }

    objc_msgSend( v17,  "addedRemoteParticipantWithIdentifier:updatedAudioEnabled:updatedVideoEnabled:streamToken:screenToken:captionsToken:",  objc_msgSend(v9, "participantID"),  1,  objc_msgSend(v9, "isVideoEnabled"),  objc_msgSend(v9, "videoToken"),  objc_msgSend(v9, "screenToken"),  v18);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession pendingRemovedParticipantsByID](self, "pendingRemovedParticipantsByID"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 participantID]));
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);

    if (v23) {
      -[CSDAVCSession removeParticipant:](self, "removeParticipant:", v23);
    }
  }

  else
  {
    id v24 = sub_1001704C4();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1002B8AD4();
    }

    char v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
    double v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 participantID]));
    [v26 setObject:0 forKeyedSubscript:v27];

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    unsigned int v23 = v28;
    if (v28)
    {
      uint64_t v29 = GKSErrorDetailedError;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:GKSErrorDetailedError]);
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber, v31);
      char isKindOfClass = objc_opt_isKindOfClass(v30, v32);

      if ((isKindOfClass & 1) == 0)
      {
        [v10 code];
        goto LABEL_27;
      }

      double v34 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v29]);
      unsigned __int8 v35 = [v34 isEqualToNumber:&off_1003F17F8];

      char v36 = v35 ^ 1;
    }

    else
    {
      char v36 = 0;
    }

    if ([v10 code] == (id)32016 && (v36 & 1) == 0)
    {
      uint64_t v37 = objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "session:conversationParticipantWithParticipantIdentifier:",  self,  objc_msgSend(v9, "participantID")));
      id v38 = sub_1001704C4();
      unint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      __int16 v48 = (void *)v37;
      if (v37)
      {
        if (v40)
        {
          *(_DWORD *)buf = 138412546;
          id v50 = v9;
          __int16 v51 = 2112;
          v52[0] = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Retrying to add participant after one to one mode changes %@: %@",  buf,  0x16u);
        }

        unint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
        id v41 = -[os_log_s isVideoEnabled](v39, "isVideoEnabled");
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
        id v43 = [v42 isAudioPaused];
        __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
        id v45 = [v44 isScreenEnabled];
        __int16 v46 = self;
        BOOL v47 = v48;
        -[CSDAVCSession queueAddParticipantRetryBlock:withVideoEnabled:audioPaused:screenEnabled:]( v46,  "queueAddParticipantRetryBlock:withVideoEnabled:audioPaused:screenEnabled:",  v48,  v41,  v43,  v45);
      }

      else
      {
        if (v40)
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "[WARN] Delegate responded that we are not tracking active remote participant anymore, not retrying to add participant: %@",  buf,  0xCu);
        }

        BOOL v47 = 0LL;
      }
    }
  }

- (void)session:(id)a3 removeParticipant:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    id v23 = v9;
    __int16 v24 = 1024;
    BOOL v25 = v7;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "removeParticipant: %@ didSucceed: %d error: %@",  (uint8_t *)&v22,  0x1Cu);
  }

  if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession pendingRemovedParticipantsByID](self, "pendingRemovedParticipantsByID"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 participantID]));
    [v14 setObject:0 forKeyedSubscript:v15];
  }

  else
  {
    id v16 = sub_1001704C4();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002B8BC0();
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 participantID]));
    [v18 setObject:v9 forKeyedSubscript:v19];

    id v20 = sub_1001704C4();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_1002B8B3C((uint64_t)v9, self);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  objc_msgSend(v21, "removedRemoteParticipantWithIdentifier:didSucceed:", objc_msgSend(v9, "participantID"), v7);
}

- (void)session:(id)a3 didUpdate:(BOOL)a4 configuration:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109634;
    v16[1] = v7;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "didUpdate: %d configuration: %@ error: %@",  (uint8_t *)v16,  0x1Cu);
  }

  if (!v7)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8C28();
    }
  }
}

- (void)session:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109634;
    v16[1] = v7;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "audioEnabled: %d didSucceed: %d error: %@",  (uint8_t *)v16,  0x18u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v13 session:self changedLocalAudioEnabled:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8C90();
    }
  }
}

- (void)session:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109634;
    v16[1] = v7;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "videoEnabled: %d didSucceed: %d error: %@",  (uint8_t *)v16,  0x18u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v13 session:self changedLocalVideoEnabled:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8CF0();
    }
  }
}

- (void)session:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v32 = v7;
    __int16 v33 = 1024;
    BOOL v34 = v6;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "screenEnabled: %d didSucceed: %d error: %@",  buf,  0x18u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v13 session:self changedScreenEnabled:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8D50();
    }
LABEL_6:

    goto LABEL_7;
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession captureSessionQueue](self, "captureSessionQueue"));
  id v18 = [v17 count];

  if (v18 && v7)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession captureSessionQueue](self, "captureSessionQueue", 0LL));
    id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v15);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v24 = sub_1001704C4();
          BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "executing queued up block since screen enabled did succeed",  buf,  2u);
          }

          (*(void (**)(uint64_t))(v23 + 16))(v23);
        }

        id v20 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      }

      while (v20);
    }

    goto LABEL_6;
  }

- (void)session:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109634;
    v16[1] = v7;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "audioPaused: %d didSucceed: %d error: %@",  (uint8_t *)v16,  0x18u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v13 session:self changedLocalAudioPaused:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8DB0();
    }
  }
}

- (void)session:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109634;
    v16[1] = v7;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "videoPaused: %d didSucceed: %d error: %@",  (uint8_t *)v16,  0x18u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v13 session:self changedLocalVideoPaused:v7 didSucceed:v6 error:v9];

  if (v9)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8E10();
    }
  }
}

- (void)session:(id)a3 oneToOneEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v39 = v7;
    __int16 v40 = 1024;
    BOOL v41 = v6;
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "oneToOneEnabled: %d didSucceed: %d error: %@",  buf,  0x18u);
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDAVCSession mostRecentCompletedOneToOneEnabledValue](self, "mostRecentCompletedOneToOneEnabledValue"));
  if (v13
    && (id v14 = (void *)v13,
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAVCSession mostRecentCompletedOneToOneEnabledValue]( self,  "mostRecentCompletedOneToOneEnabledValue")),  unsigned int v16 = [v15 intValue],  v15,  v14,  v16 == v7))
  {
    id v17 = sub_1001704C4();
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Already received oneToOneEnabled callback with this value, not handling",  buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
      -[CSDAVCSession setMostRecentCompletedOneToOneEnabledValue:]( self,  "setMostRecentCompletedOneToOneEnabledValue:",  v19);
    }

    if (v9)
    {
      id v20 = sub_1001704C4();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1002B8E70();
      }
    }

    int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    [v22 session:self requestedOneToOneModeEnabled:v7 didSucceed:v6 error:v9];

    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
    BOOL v18 = v23;
    if (v6)
    {
      id v24 = -[os_log_s copy](v23, "copy");

      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession sessionUpdateCompletionQueue](self, "sessionUpdateCompletionQueue"));
      [v25 removeAllObjects];

      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      BOOL v18 = (os_log_s *)v24;
      id v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v34;
        do
        {
          __int128 v29 = 0LL;
          do
          {
            if (*(void *)v34 != v28) {
              objc_enumerationMutation(v18);
            }
            uint64_t v30 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v29);
            id v31 = sub_1001704C4();
            BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "executing queued up block since oneToOneEnabled succeeded",  buf,  2u);
            }

            (*(void (**)(uint64_t))(v30 + 16))(v30);
            __int128 v29 = (char *)v29 + 1;
          }

          while (v27 != v29);
          id v27 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
        }

        while (v27);
      }
    }

    else
    {
      -[os_log_s removeAllObjects](v23, "removeAllObjects");
    }
  }
}

- (void)session:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  id v13 = sub_1001704C4();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109890;
    v15[1] = a4;
    __int16 v16 = 1024;
    unsigned int v17 = a5;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "mediaStateDidChange: %d forMediaType: %d didSucceed: %d error: %@",  (uint8_t *)v15,  0x1Eu);
  }
}

- (void)sessionShouldReconnect:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v8 sessionShouldReconnect:self];
}

- (void)session:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue", a3));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109376;
    v12[1] = a4;
    __int16 v13 = 1024;
    unsigned int v14 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "mixingDidStartForMediaType: %d mixingMediaType: %d",  (uint8_t *)v12,  0xEu);
  }

  if (a4 == 2 && a5 == 1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    [v11 session:self cameraMixedWithScreenDidChange:1];
  }

- (void)session:(id)a3 mixingDidStopForMediaType:(unsigned int)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "mixingDidStopForMediaType: %d",  (uint8_t *)v10,  8u);
  }

  if (a4 == 2)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    [v9 session:self cameraMixedWithScreenDidChange:0];
  }

- (void)session:(id)a3 didReact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "session: %@ didReact: %@",  (uint8_t *)&v12,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v11 session:self localParticipantDidReact:v7];
}

- (void)sessionDidStopReacting:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "session: %@ didStopReacting",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  [v8 sessionLocalParticipantDidStopReacting:self];
}

- (void)participant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "participant: %@ remoteAudioEnabledDidChange: %d",  (uint8_t *)&v11,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  objc_msgSend( v10,  "remoteParticipantWithIdentifier:updatedAudioEnabled:streamToken:screenToken:captionsToken:",  objc_msgSend(v6, "participantID"),  v4,  objc_msgSend(v6, "videoToken"),  objc_msgSend(v6, "screenToken"),  objc_msgSend(v6, "captionsToken"));
}

- (void)participant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "participant: %@ remoteVideoEnabledDidChange: %d",  (uint8_t *)&v11,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  objc_msgSend( v10,  "remoteParticipantWithIdentifier:updatedVideoEnabled:streamToken:screenToken:captionsToken:",  objc_msgSend(v6, "participantID"),  v4,  objc_msgSend(v6, "videoToken"),  objc_msgSend(v6, "screenToken"),  objc_msgSend(v6, "captionsToken"));
}

- (void)participant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "participant: %@ remoteAudioPausedDidChange: %d",  (uint8_t *)&v11,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  objc_msgSend( v10,  "remoteParticipantWithIdentifier:updatedAudioPaused:streamToken:",  objc_msgSend(v6, "participantID"),  v4,  objc_msgSend(v6, "videoToken"));
}

- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession remoteParticipantsByIdentifier](self, "remoteParticipantsByIdentifier"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 participantID]));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

  if (v13)
  {
    unsigned int v14 = -[CSDAVCSession isRemoteScreenEnabledForParticipant:](self, "isRemoteScreenEnabledForParticipant:", v9);
    id v15 = sub_1001704C4();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138413058;
      id v19 = v9;
      __int16 v20 = 1024;
      BOOL v21 = v7;
      __int16 v22 = 1024;
      BOOL v23 = v6;
      __int16 v24 = 1024;
      unsigned int v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "participant: %@ screenEnabled: %d didSucceed: %d remoteScreenEnabled: %d",  (uint8_t *)&v18,  0x1Eu);
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    objc_msgSend( v17,  "remoteParticipantWithIdentifier:updatedScreenEnabled:streamToken:screenToken:captionsToken:",  objc_msgSend(v9, "participantID"),  v7 & v14,  objc_msgSend(v9, "videoToken"),  objc_msgSend(v9, "screenToken"),  objc_msgSend(v9, "captionsToken"));
  }
}

- (void)participant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4
{
  id v4 = (id)a4;
  id v6 = a3;
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 1024;
    int v14 = (int)v4;
    __int16 v15 = 1024;
    unsigned int v16 = [v6 isScreenEnabled];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "participant: %@ remoteScreenEnabledDidChange: %d participantScreenEnabled: %d",  (uint8_t *)&v11,  0x18u);
  }

  if ((_DWORD)v4) {
    id v4 = [v6 isScreenEnabled];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  objc_msgSend( v10,  "remoteParticipantWithIdentifier:updatedScreenEnabled:streamToken:screenToken:captionsToken:",  objc_msgSend(v6, "participantID"),  v4,  objc_msgSend(v6, "videoToken"),  objc_msgSend(v6, "screenToken"),  objc_msgSend(v6, "captionsToken"));
}

- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AVCSessionParticipantMediaTypeKeyAudio]);
  id v10 = [v9 integerValue];

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AVCSessionParticipantMediaTypeKeyVideo]);
  id v12 = [v11 integerValue];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  id v13 = [v7 participantID];

  [v14 remoteParticipantWithIdentifier:v13 didChangeAudioPriority:v10 videoPriority:v12];
}

- (void)participant:(id)a3 didReact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "participant: %@ didReact: %@",  (uint8_t *)&v12,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
  objc_msgSend(v11, "remoteParticipantWithIdentifier:didReact:", objc_msgSend(v6, "participantID"), v7);
}

- (void)participant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = a4;
    __int16 v16 = 1024;
    unsigned int v17 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "participant: %@ remoteMediaStateDidChange: %d forMediaType: %d",  (uint8_t *)&v12,  0x18u);
  }
}

- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 1024;
    unsigned int v16 = a4;
    __int16 v17 = 1024;
    unsigned int v18 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "participant: %@ mixingDidStartForMediaType: %d mixingMediaType: %d",  (uint8_t *)&v13,  0x18u);
  }

  if (a4 == 2 && a5 == 1)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    objc_msgSend( v12,  "remoteParticipantWithIdentifier:cameraMixedWithScreenDidChange:",  objc_msgSend(v8, "participantID"),  1);
  }
}

- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "participant: %@ mixingDidStopForMediaType: %d",  (uint8_t *)&v11,  0x12u);
  }

  if (a4 == 2)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession delegate](self, "delegate"));
    objc_msgSend( v10,  "remoteParticipantWithIdentifier:cameraMixedWithScreenDidChange:",  objc_msgSend(v6, "participantID"),  0);
  }
}

- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  _DWORD v13[2] = sub_10015F7DC;
  v13[3] = &unk_1003D8FE0;
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = v9;
  unsigned int v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "screenCapture: %@ didStop: %d, captureWithError: %@",  buf,  0x1Cu);
  }

  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015FA40;
  block[3] = &unk_1003D7918;
  BOOL v16 = v6;
  block[4] = self;
  id v15 = v9;
  id v13 = v9;
  dispatch_async(v12, block);
}

- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "screenCapture: %@ didUpdateAttributes: %@, error: %@",  buf,  0x20u);
  }

  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015FD68;
  block[3] = &unk_1003D7828;
  id v17 = v10;
  id v18 = v9;
  __int16 v19 = self;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v13, block);
}

- (BOOL)isRemoteScreenEnabledForParticipant:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector(v3, "remoteScreenEnabled") & 1) != 0
    && [v3 performSelector:"remoteScreenEnabled"] != 0;

  return v4;
}

- (int64_t)localCaptionsToken
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  char v4 = objc_opt_respondsToSelector(v3, "streamTokenForStreamGroupID:");

  if ((v4 & 1) == 0) {
    return 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVCSession session](self, "session"));
  id v6 = [v5 streamTokenForStreamGroupID:1667330164];

  return (int64_t)v6;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (BOOL)isRelaying
{
  return self->_relaying;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (AVCSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDAVCSessionDelegate)delegate
{
  return (CSDAVCSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)remoteParticipantsByIdentifier
{
  return self->_remoteParticipantsByIdentifier;
}

- (NSMutableDictionary)pendingRemovedParticipantsByID
{
  return self->_pendingRemovedParticipantsByID;
}

- (id)captureSessionCreationBlock
{
  return self->_captureSessionCreationBlock;
}

- (TUCallScreenShareAttributes)mostRecentScreenShareAttributes
{
  return self->_mostRecentScreenShareAttributes;
}

- (void)setMostRecentScreenShareAttributes:(id)a3
{
}

- (BOOL)hasCalledStop
{
  return self->_hasCalledStop;
}

- (void)setHasCalledStop:(BOOL)a3
{
  self->_hasCalledStop = a3;
}

- (NSNumber)mostRecentCompletedOneToOneEnabledValue
{
  return self->_mostRecentCompletedOneToOneEnabledValue;
}

- (void)setMostRecentCompletedOneToOneEnabledValue:(id)a3
{
}

- (AVCScreenCapture)avcScreenCapture
{
  return self->_avcScreenCapture;
}

- (void)setAvcScreenCapture:(id)a3
{
}

- (unsigned)captureCapabilities
{
  return self->_captureCapabilities;
}

- (void)setCaptureCapabilities:(unsigned __int8)a3
{
  self->_captureCapabilities = a3;
}

- (void)setFeatureFlags:(id)a3
{
}

- (NSMutableArray)captureSessionQueue
{
  return self->_captureSessionQueue;
}

- (NSMutableArray)sessionUpdateCompletionQueue
{
  return self->_sessionUpdateCompletionQueue;
}

- (id)avcSessionParticipantCreationBlock
{
  return self->_avcSessionParticipantCreationBlock;
}

- (void)setAvcSessionParticipantCreationBlock:(id)a3
{
}

- (TUCallScreenShareAttributes)currentLocalScreenShareAttributes
{
  return self->_currentLocalScreenShareAttributes;
}

- (void)setCurrentLocalScreenShareAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end