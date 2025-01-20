@interface MSDResolveService
- (BOOL)checkForDefaultService;
- (MSDResolveService)initWithIntent:(id)a3;
- (MSDResolveService)initWithServiceBundleID:(id)a3 sharedUserID:(id)a4 endpointID:(id)a5 mediaRouteID:(id)a6;
- (NSString)alternativeProviderBundleID;
- (NSString)endpointID;
- (NSString)homeUserID;
- (NSString)mediaRouteID;
- (NSString)serviceBundleID;
- (NSString)sharedUserID;
- (NSString)speakerHomeUserID;
- (void)_getResolvedServiceInfo:(id)a3;
- (void)_handleResolvedService:(id)a3 homeUserID:(id)a4 completion:(id)a5;
- (void)_performResolutionForAnUnknownBundleID:(id)a3 completion:(id)a4;
- (void)_performResolutionForKnownBundleID:(id)a3 completion:(id)a4;
- (void)_resolveServiceForRecognizedUser:(id)a3 completion:(id)a4;
- (void)_resolveServiceForUnrecognizedUser:(id)a3 completion:(id)a4;
- (void)_trackResolvingResult:(int)a3 toTrackingSession:(id)a4;
- (void)performResolutionRequest:(id)a3;
- (void)setCheckForDefaultService:(BOOL)a3;
- (void)setSpeakerHomeUserID:(id)a3;
@end

@implementation MSDResolveService

- (MSDResolveService)initWithIntent:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___MSDResolveService;
  v5 = -[MSDResolveService init](&v53, "init");
  if (v5)
  {
    if (v4)
    {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediasetupd.serviceResolution", 0LL);
      serviceResolutionQueue = v5->_serviceResolutionQueue;
      v5->_serviceResolutionQueue = (OS_dispatch_queue *)v6;

      uint64_t v8 = objc_opt_class(&OBJC_CLASS___INPlayMediaIntent);
      if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
      {
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___INPlayMediaIntent);
        id v10 = v4;
        if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
          v11 = v10;
        }
        else {
          v11 = 0LL;
        }
        id v12 = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 privatePlayMediaIntentData]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 privateMediaIntentData]);

        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 privatePlayMediaIntentData]);
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 alternativeProviderBundleIdentifier]);
        alternativeProviderBundleID = v5->_alternativeProviderBundleID;
        v5->_alternativeProviderBundleID = (NSString *)v16;

        goto LABEL_21;
      }

      uint64_t v20 = objc_opt_class(&OBJC_CLASS___INUpdateMediaAffinityIntent);
      if ((objc_opt_isKindOfClass(v4, v20) & 1) != 0)
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___INUpdateMediaAffinityIntent);
        id v22 = v4;
        if ((objc_opt_isKindOfClass(v22, v21) & 1) != 0) {
          v23 = v22;
        }
        else {
          v23 = 0LL;
        }
        id v12 = v23;

        v24 = (void *)objc_claimAutoreleasedReturnValue([v12 privateUpdateMediaAffinityIntentData]);
LABEL_20:
        v15 = v24;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v24 privateMediaIntentData]);
LABEL_21:

        id v29 = sub_10003E9DC();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = objc_opt_class(v4);
          *(_DWORD *)buf = 138412290;
          v55 = (const char *)v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Detected %@ request", buf, 0xCu);
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue([v14 proxiedThirdPartyAppInfo]);
        uint64_t v33 = objc_claimAutoreleasedReturnValue([v32 bundleIdentifier]);
        serviceBundleID = v5->_serviceBundleID;
        v5->_serviceBundleID = (NSString *)v33;

        v35 = (void *)objc_claimAutoreleasedReturnValue([v14 speakerIDInfo]);
        uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 sharedUserID]);
        sharedUserID = v5->_sharedUserID;
        v5->_sharedUserID = (NSString *)v36;

        uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 _mediaRouteId]);
        mediaRouteID = v5->_mediaRouteID;
        v5->_mediaRouteID = (NSString *)v38;

        uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 _endpointId]);
        endpointID = v5->_endpointID;
        v5->_endpointID = (NSString *)v40;

        id v42 = sub_10003E9DC();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v5->_serviceBundleID;
          v45 = v5->_alternativeProviderBundleID;
          *(_DWORD *)buf = 138412546;
          v55 = (const char *)v44;
          __int16 v56 = 2112;
          v57 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "ServiceBundleID: %@ AlternativeProviderBundleID: %@",  buf,  0x16u);
        }

        if (v5->_serviceBundleID) {
          BOOL v46 = 0;
        }
        else {
          BOOL v46 = v5->_alternativeProviderBundleID != 0LL;
        }
        v5->_checkForDefaultService = v46;
        id v47 = sub_10003E9DC();
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          if (v5->_checkForDefaultService) {
            int v49 = 89;
          }
          else {
            int v49 = 78;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v55) = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Will Fallback to User's default service: %c",  buf,  8u);
        }

        goto LABEL_34;
      }

      uint64_t v25 = objc_opt_class(&OBJC_CLASS___INAddMediaIntent);
      if ((objc_opt_isKindOfClass(v4, v25) & 1) != 0)
      {
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___INAddMediaIntent);
        id v27 = v4;
        if ((objc_opt_isKindOfClass(v27, v26) & 1) != 0) {
          v28 = v27;
        }
        else {
          v28 = 0LL;
        }
        id v12 = v28;

        v24 = (void *)objc_claimAutoreleasedReturnValue([v12 privateAddMediaIntentData]);
        goto LABEL_20;
      }

      id v51 = sub_10003E9DC();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100007700();
      }
    }

    else
    {
      id v18 = sub_10003E9DC();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[MSDResolveService initWithIntent:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Nil Intent passed", buf, 0xCu);
      }
    }

    v50 = 0LL;
    goto LABEL_38;
  }

- (MSDResolveService)initWithServiceBundleID:(id)a3 sharedUserID:(id)a4 endpointID:(id)a5 mediaRouteID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MSDResolveService;
  v15 = -[MSDResolveService init](&v18, "init");
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceBundleID, a3);
    objc_storeStrong((id *)&v16->_sharedUserID, a4);
    objc_storeStrong((id *)&v16->_endpointID, a5);
    objc_storeStrong((id *)&v16->_mediaRouteID, a6);
  }

  return v16;
}

- (void)performResolutionRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      endpointID = self->_endpointID;
      serviceBundleID = self->_serviceBundleID;
      sharedUserID = self->_sharedUserID;
      alternativeProviderBundleID = self->_alternativeProviderBundleID;
      *(_DWORD *)buf = 138478595;
      id v22 = sharedUserID;
      __int16 v23 = 2113;
      v24 = endpointID;
      __int16 v25 = 2113;
      uint64_t v26 = serviceBundleID;
      __int16 v27 = 2113;
      v28 = alternativeProviderBundleID;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "User (%{private}@) is requesting resolution of service made on endpointID %{private}@ for %{private}@ alternativ eProviderBundleID %{private}@",  buf,  0x2Au);
    }

    if (-[NSString isEqualToString:](self->_serviceBundleID, "isEqualToString:", kPodcastsBundleIdentifier))
    {
      id v12 = sub_10003E9DC();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v14 = "User requested to play a podcast on Apple Podcasts";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      }
    }

    else
    {
      if (!-[NSString isEqualToString:](self->_serviceBundleID, "isEqualToString:", kAppleMusicBundleIdentifier))
      {
        if (!-[NSString isEqualToString:]( self->_serviceBundleID,  "isEqualToString:",  kCloudMediaServicesBundleIdentifier))
        {
          -[MSDResolveService _getResolvedServiceInfo:](self, "_getResolvedServiceInfo:", v4);
          goto LABEL_16;
        }

        id v17 = sub_10003E9DC();
        objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received CloudMediaServices BundleID, checking nowplaying info",  buf,  2u);
        }

        uint64_t v16 = -[MSDResolveNowPlayingInfo initWithMediaRouteID:]( objc_alloc(&OBJC_CLASS___MSDResolveNowPlayingInfo),  "initWithMediaRouteID:",  self->_mediaRouteID);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100006120;
        v19[3] = &unk_100060B30;
        id v20 = v4;
        -[MSDResolveNowPlayingInfo performNowPlayingInfoResolution:](v16, "performNowPlayingInfoResolution:", v19);

        goto LABEL_15;
      }

      id v15 = sub_10003E9DC();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v14 = "User requested to play a music on Apple Music";
        goto LABEL_13;
      }
    }

    uint64_t v16 = (MSDResolveNowPlayingInfo *)objc_claimAutoreleasedReturnValue( +[MSDServiceResolutionHelper createMSResolutionInfoObject:homeUserID:sharedUserID:]( &OBJC_CLASS___MSDServiceResolutionHelper,  "createMSResolutionInfoObject:homeUserID:sharedUserID:",  self->_serviceBundleID,  0LL,  0LL));
    (*((void (**)(id, MSDResolveNowPlayingInfo *, void))v4 + 2))(v4, v16, 0LL);
LABEL_15:

    goto LABEL_16;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10000772C();
  }

LABEL_16:
}

- (void)_getResolvedServiceInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSLogger defaultSession](self->_fallbackEventTracker, "defaultSession"));
    uint64_t v6 = +[MSAssistantPreferences isMultiUserEnabledForSiri]( &OBJC_CLASS___MSAssistantPreferences,  "isMultiUserEnabledForSiri") ^ 1;
    BOOL v7 = self->_sharedUserID == 0LL;
    v27[0] = @"voiceIDUnsupported";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    v27[1] = @"voiceIDActivated";
    v28[0] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
    v28[1] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
    [v5 setMetadata:v10];

    [v5 recordEvent:@"Start"];
    if (self->_sharedUserID)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000064A4;
      v24[3] = &unk_100060B58;
      id v11 = &v26;
      id v12 = &v25;
      __int16 v25 = v5;
      id v26 = v4;
      -[MSDResolveService _resolveServiceForRecognizedUser:completion:]( self,  "_resolveServiceForRecognizedUser:completion:",  v5,  v24);
    }

    else
    {
      [v5 recordEvent:@"unrecognizedCount"];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000064DC;
      v21[3] = &unk_100060B58;
      id v11 = &v23;
      id v12 = &v22;
      id v22 = v5;
      id v23 = v4;
      -[MSDResolveService _resolveServiceForUnrecognizedUser:completion:]( self,  "_resolveServiceForUnrecognizedUser:completion:",  v5,  v21);
    }
  }

  else
  {
    id v13 = sub_10003E9DC();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000077BC((os_log_s *)v5, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_trackResolvingResult:(int)a3 toTrackingSession:(id)a4
{
  id v5 = a4;
  if (a3 <= 4 && ((0x1Du >> a3) & 1) != 0)
  {
    id v6 = v5;
    [v5 recordEvent:*(&off_100060C68 + a3)];
    id v5 = v6;
  }
}

- (void)_resolveServiceForRecognizedUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_100006744;
  __int16 v27 = sub_100006754;
  id v28 = 0LL;
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSAssistantPreferences sharedPreferences](&OBJC_CLASS___MSAssistantPreferences, "sharedPreferences"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDResolveService sharedUserID](self, "sharedUserID"));
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_10000675C;
  uint64_t v20 = &unk_100060B80;
  id v22 = &v23;
  id v11 = v8;
  uint64_t v21 = v11;
  [v9 getHomeUserIDForSpeaker:v10 completion:&v17];

  dispatch_time_t v12 = dispatch_time(0LL, 1000000000LL);
  dispatch_group_wait(v11, v12);
  uint64_t v13 = v24[5];
  if (!v13)
  {
    id v14 = sub_10003E9DC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000782C();
    }

    uint64_t v13 = v24[5];
  }

  -[MSDResolveService setSpeakerHomeUserID:](self, "setSpeakerHomeUserID:", v13, v17, v18, v19, v20);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDResolveService serviceBundleID](self, "serviceBundleID"));

  if (v16) {
    -[MSDResolveService _performResolutionForKnownBundleID:completion:]( self,  "_performResolutionForKnownBundleID:completion:",  v6,  v7);
  }
  else {
    -[MSDResolveService _performResolutionForAnUnknownBundleID:completion:]( self,  "_performResolutionForAnUnknownBundleID:completion:",  v6,  v7);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)_resolveServiceForUnrecognizedUser:(id)a3 completion:(id)a4
{
  if (self->_serviceBundleID) {
    -[MSDResolveService _performResolutionForKnownBundleID:completion:]( self,  "_performResolutionForKnownBundleID:completion:",  a3,  a4);
  }
  else {
    -[MSDResolveService _performResolutionForAnUnknownBundleID:completion:]( self,  "_performResolutionForAnUnknownBundleID:completion:",  a3,  a4);
  }
}

- (void)_performResolutionForKnownBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = -[MSDServiceResolutionFlow initWithBundleID:homeUserID:endpointID:]( objc_alloc(&OBJC_CLASS___MSDServiceResolutionFlow),  "initWithBundleID:homeUserID:endpointID:",  self->_serviceBundleID,  self->_speakerHomeUserID,  self->_endpointID);
    if (v8)
    {
      objc_initWeak(&location, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10000695C;
      v10[3] = &unk_100060BD0;
      objc_copyWeak(&v13, &location);
      id v11 = v6;
      id v12 = v7;
      -[MSDServiceResolutionFlow performUserAndServiceResolution:](v8, "performUserAndServiceResolution:", v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v9);
    }
  }
}

- (void)_performResolutionForAnUnknownBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100006744;
  uint64_t v21 = sub_100006754;
  id v22 = -[MSDServiceResolutionFlow initWithBundleID:homeUserID:endpointID:]( objc_alloc(&OBJC_CLASS___MSDServiceResolutionFlow),  "initWithBundleID:homeUserID:endpointID:",  self->_alternativeProviderBundleID,  self->_speakerHomeUserID,  self->_endpointID);
  if (v18[5])
  {
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)v18[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100006CC4;
    v12[3] = &unk_100060C20;
    v12[4] = self;
    id v14 = &v17;
    objc_copyWeak(&v15, &location);
    id v13 = v7;
    [v8 performUserAndServiceResolution:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    id v9 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000078BC();
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v11);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)_handleResolvedService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  id v42 = sub_100006744;
  v43 = sub_100006754;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = sub_100006744;
  v37 = sub_100006754;
  id v38 = 0LL;
  if (v9
    && +[MSAssistantPreferences isMultiUserEnabledForSiri]( &OBJC_CLASS___MSAssistantPreferences,  "isMultiUserEnabledForSiri"))
  {
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MSAssistantPreferences sharedPreferences]( &OBJC_CLASS___MSAssistantPreferences,  "sharedPreferences"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100007554;
    v29[3] = &unk_100060C48;
    uint64_t v31 = &v39;
    v32 = &v33;
    id v13 = v11;
    v30 = v13;
    [v12 getSharedUserIDForHomeUser:v9 completion:v29];

    dispatch_time_t v14 = dispatch_time(0LL, 1000000000LL);
    dispatch_group_wait(v13, v14);
  }

  id v15 = (void *)v40[5];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = (void *)v40[5];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDResolveService sharedUserID](self, "sharedUserID"));
    LODWORD(v17) = [v17 isEqualToString:v18];

    if ((_DWORD)v17)
    {

      id v19 = sub_10003E9DC();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "We are using the same person's account, sending NIL sharedUserID to Siri",  buf,  2u);
      }

      id v16 = 0LL;
    }

    if (v10)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MSDServiceResolutionHelper createMSResolutionInfoObject:homeUserID:sharedUserID:]( &OBJC_CLASS___MSDServiceResolutionHelper,  "createMSResolutionInfoObject:homeUserID:sharedUserID:",  v8,  v9,  v16));
      id v22 = sub_10003E9DC();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v34[5];
        *(_DWORD *)buf = 138412546;
        id v46 = v21;
        __int16 v47 = 2112;
        uint64_t v48 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Resolved ServiceInfo %@, error %@",  buf,  0x16u);
      }

      v10[2](v10, v21, v34[5]);
    }

- (NSString)serviceBundleID
{
  return self->_serviceBundleID;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (NSString)homeUserID
{
  return self->_homeUserID;
}

- (NSString)endpointID
{
  return self->_endpointID;
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (NSString)alternativeProviderBundleID
{
  return self->_alternativeProviderBundleID;
}

- (BOOL)checkForDefaultService
{
  return self->_checkForDefaultService;
}

- (void)setCheckForDefaultService:(BOOL)a3
{
  self->_checkForDefaultService = a3;
}

- (NSString)speakerHomeUserID
{
  return self->_speakerHomeUserID;
}

- (void)setSpeakerHomeUserID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end