@interface IntentHandler
- (BOOL)_isResolutionResultFailure:(id)a3;
- (BOOL)_isResolutionResultTerminal:(id)a3;
- (BOOL)_resolveUpdateListeningHistorySetting:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CMSCloudExtensionSession)serviceSession;
- (CMSNetworkActivity)networkActivity;
- (CloudMediaServicesPlayerInterface)playerInterface;
- (MSBServiceUnavailableIntentHandler)serviceUnavailable;
- (MSPublicDBInfo)mediaServicePublicDBInfo;
- (MediaService)mediaService;
- (NSError)protocolException;
- (NSString)appBundleIdentifier;
- (NSString)appServiceID;
- (NSString)currentPlaybackAccountHomeUserID;
- (NSString)endpointIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)protocolEndpoint;
- (NSString)resolvedHomeUserID;
- (NSString)sessionIdentifier;
- (NSString)siriLanguageCode;
- (NSString)speakerHomeUserID;
- (NSString)speakerSharedUserID;
- (NSString)userActivityPersistentIdentifier;
- (id)_mediaServiceCloudExtensionConfigURL:(id)a3;
- (id)handlerForIntent:(id)a3;
- (void)_fetchConfiguration:(id)a3 authHeader:(id)a4 completion:(id)a5;
- (void)_handlePlayMediaIntent:(id)a3 result:(id)a4 error:(id)a5 prepareQueueOnly:(BOOL)a6 completion:(id)a7;
- (void)_performMethodInContext:(const char *)a3 methodName:(id)a4 params:(id)a5 completion:(id)a6;
- (void)authRenewalForSessionIdentifier:(id)a3 parentNetworkActivity:(id)a4 completion:(id)a5;
- (void)confirmAddMedia:(id)a3 completion:(id)a4;
- (void)confirmPlayMedia:(id)a3 completion:(id)a4;
- (void)confirmUpdateMediaAffinity:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleAddMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
- (void)handleSearchForMedia:(id)a3 completion:(id)a4;
- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4;
- (void)reportAnalyticsFail;
- (void)reportAnalyticsForMethod:(id)a3 forEventType:(id)a4;
- (void)resolveAffinityTypeForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveMediaItemsForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4;
- (void)resolvePlayShuffledForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackQueueLocationForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackRepeatModeForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolvePlaybackSpeedForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)resolveResumePlaybackForPlayMedia:(id)a3 withCompletion:(id)a4;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppServiceID:(id)a3;
- (void)setCurrentPlaybackAccountHomeUserID:(id)a3;
- (void)setEndpointIdentifier:(id)a3;
- (void)setMediaRouteIdentifier:(id)a3;
- (void)setMediaService:(id)a3;
- (void)setMediaServicePublicDBInfo:(id)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setPlayerInterface:(id)a3;
- (void)setProtocolEndpoint:(id)a3;
- (void)setProtocolException:(id)a3;
- (void)setResolvedHomeUserID:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setServiceUnavailable:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSiriLanguageCode:(id)a3;
- (void)setSpeakerHomeUserID:(id)a3;
- (void)setSpeakerSharedUserID:(id)a3;
- (void)setUserActivityPersistentIdentifier:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_serviceUnavailable)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
    [v6 completeActivity:3];

    goto LABEL_51;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 _endpointId]);
  -[IntentHandler setEndpointIdentifier:](self, "setEndpointIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 _mediaRouteId]);
  -[IntentHandler setMediaRouteIdentifier:](self, "setMediaRouteIdentifier:", v8);

  id v9 = sub_10000CCD4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v5 _idiom];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( -[IntentHandler mediaRouteIdentifier]( self,  "mediaRouteIdentifier"));
    *(_DWORD *)buf = 134218499;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2113;
    v208 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Request originated on device %ld with identifier %{private}@ and mediaRouteID %{private}@",  buf,  0x20u);
  }

  if (!self->_playerInterface)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___CloudMediaServicesPlayerInterface);
    playerInterface = self->_playerInterface;
    self->_playerInterface = v14;
  }

  if (!self->_sessionIdentifier)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
    v29 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"IN.%@", v28));
    sessionIdentifier = self->_sessionIdentifier;
    self->_sessionIdentifier = v29;

    id v31 = sub_10000CCD4();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self->_sessionIdentifier;
      v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v5 identifier]);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[IntentHandler handlerForIntent:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2114;
      v208 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s CloudExtension session %{public}@ for Intent identifier %{public}@",  buf,  0x20u);
    }

    uint64_t v35 = objc_opt_class(&OBJC_CLASS___INPlayMediaIntent);
    if ((objc_opt_isKindOfClass(v5, v35) & 1) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v5 _endpointId]);
      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v5 _endpointId]);
        BOOL v38 = [v37 length] != 0;
      }

      else
      {
        BOOL v38 = 0LL;
      }

      +[MSAnalytics sendPlayIntent:](&OBJC_CLASS___MSAnalytics, "sendPlayIntent:", v38);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v5 privatePlayMediaIntentData]);
      v164 = (void *)objc_claimAutoreleasedReturnValue([v44 privateMediaIntentData]);

      v41 = (id *)&CMSExtensionEndpointIntentPlayMedia;
    }

    else
    {
      uint64_t v39 = objc_opt_class(&OBJC_CLASS___INAddMediaIntent);
      if ((objc_opt_isKindOfClass(v5, v39) & 1) != 0)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v5 privateAddMediaIntentData]);
        v164 = (void *)objc_claimAutoreleasedReturnValue([v40 privateMediaIntentData]);

        v41 = (id *)&CMSExtensionEndpointIntentAddMedia;
      }

      else
      {
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___INUpdateMediaAffinityIntent);
        if ((objc_opt_isKindOfClass(v5, v42) & 1) == 0)
        {
          uint64_t v87 = objc_opt_class(&OBJC_CLASS___INSearchForMediaIntent);
          if ((objc_opt_isKindOfClass(v5, v87) & 1) == 0) {
            goto LABEL_48;
          }
          protocolEndpoint = (NSString *)objc_claimAutoreleasedReturnValue([v5 privateSearchForMediaIntentData]);
          v164 = (void *)objc_claimAutoreleasedReturnValue(-[NSString privateMediaIntentData](protocolEndpoint, "privateMediaIntentData"));
LABEL_27:

          if (v164)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue([v164 speakerIDInfo]);
            v48 = (NSString *)objc_claimAutoreleasedReturnValue([v47 sharedUserID]);
            speakerSharedUserID = self->_speakerSharedUserID;
            self->_speakerSharedUserID = v48;

            id v50 = sub_10000CCD4();
            v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v52 = self->_speakerSharedUserID;
              v53 = (void *)objc_claimAutoreleasedReturnValue([v164 speakerIDInfo]);
              v54 = (uint64_t (*)(uint64_t, uint64_t))[v53 speakerIDConfidence];
              *(_DWORD *)buf = 136315651;
              *(void *)&buf[4] = "-[IntentHandler handlerForIntent:]";
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v52;
              *(_WORD *)&buf[22] = 2049;
              v208 = v54;
              _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%s Speaker SharedUserID %{private}@ with confidence score %{private}ld",  buf,  0x20u);
            }

            v163 = (void *)objc_claimAutoreleasedReturnValue([v164 resolvedSharedUserID]);
            id v55 = sub_10000CCD4();
            v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315395;
              *(void *)&buf[4] = "-[IntentHandler handlerForIntent:]";
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v163;
              _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%s MediaSetup: Resolved SharedUserID %{private}@",  buf,  0x16u);
            }

            v57 = (void *)objc_claimAutoreleasedReturnValue([v164 proxiedThirdPartyAppInfo]);
            v58 = (void *)objc_claimAutoreleasedReturnValue([v57 bundleIdentifier]);

            id v59 = sub_10000CCD4();
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
            v61 = v60;
            if (!v58)
            {
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                sub_10000CDB4(v61, v71, v72, v73, v74, v75, v76, v77);
              }

              v78 = -[MSBServiceUnavailableIntentHandler initWithReason:]( objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler),  "initWithReason:",  2LL);
              serviceUnavailable = self->_serviceUnavailable;
              self->_serviceUnavailable = v78;

              v80 = self->_serviceUnavailable;
              int v81 = 1;
LABEL_101:

              if (v81) {
                goto LABEL_53;
              }
              goto LABEL_8;
            }

            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315395;
              *(void *)&buf[4] = "-[IntentHandler handlerForIntent:]";
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v58;
              _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%s ThirdPartyApp bundleIdentifier %{private}@",  buf,  0x16u);
            }

            p_appBundleIdentifier = &self->_appBundleIdentifier;
            appBundleIdentifier = self->_appBundleIdentifier;
            if (appBundleIdentifier && !-[NSString isEqualToString:](appBundleIdentifier, "isEqualToString:", v58)) {
              sub_10000CF18();
            }
            objc_storeStrong((id *)&self->_appBundleIdentifier, v58);
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));

            if (v64)
            {
              v65 = objc_alloc(&OBJC_CLASS___NSUUID);
              v66 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
              v67 = -[NSUUID initWithUUIDString:](v65, "initWithUUIDString:", v66);

              id v68 = [[AFInstanceContext alloc] initWithEndpointUUID:v67];
              id v69 = [[AFPreferences alloc] initWithInstanceContext:v68];
              v70 = (void *)objc_claimAutoreleasedReturnValue([v69 languageCode]);
              -[IntentHandler setSiriLanguageCode:](self, "setSiriLanguageCode:", v70);
            }

            else
            {
              uint64_t v82 = CMSCloudExtensionLanguageCode();
              v67 = (NSUUID *)objc_claimAutoreleasedReturnValue(v82);
              -[IntentHandler setSiriLanguageCode:](self, "setSiriLanguageCode:", v67);
            }

            v83 = dispatch_group_create();
            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000LL;
            v208 = sub_100005AD0;
            v209 = sub_100005AE0;
            id v210 = 0LL;
            uint64_t v199 = 0LL;
            v200 = &v199;
            uint64_t v201 = 0x3032000000LL;
            v202 = sub_100005AD0;
            v203 = sub_100005AE0;
            id v204 = 0LL;
            objc_initWeak(&location, self);
            id v84 = objc_alloc(&OBJC_CLASS___CMSNowPlayingAttributes);
            v85 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler mediaRouteIdentifier](self, "mediaRouteIdentifier"));
            id v162 = [v84 initWithMediaRouteIdentifier:v85];

            dispatch_group_enter(v83);
            v193[0] = _NSConcreteStackBlock;
            v193[1] = 3221225472LL;
            v193[2] = sub_100005AE8;
            v193[3] = &unk_100014538;
            v86 = v83;
            v194 = v86;
            objc_copyWeak(&v197, &location);
            v195 = &v199;
            v196 = buf;
            [v162 fetchNowPlayingInfo:v193];
            if (-[NSString length](self->_speakerSharedUserID, "length")
              && !-[NSString isEqualToString:](self->_speakerSharedUserID, "isEqualToString:", @"UNKNOWN"))
            {
              dispatch_group_enter(v86);
              v100 = (void *)objc_claimAutoreleasedReturnValue( +[MSAssistantPreferences sharedPreferences]( &OBJC_CLASS___MSAssistantPreferences,  "sharedPreferences"));
              v101 = self->_speakerSharedUserID;
              v190[0] = _NSConcreteStackBlock;
              v190[1] = 3221225472LL;
              v190[2] = sub_100005C98;
              v190[3] = &unk_100014560;
              objc_copyWeak(&v192, &location);
              v191 = v86;
              [v100 getHomeUserIDForSpeaker:v101 completion:v190];

              objc_destroyWeak(&v192);
            }

            else
            {
              -[IntentHandler setSpeakerHomeUserID:](self, "setSpeakerHomeUserID:", 0LL);
            }

            v102 = (void *)objc_claimAutoreleasedReturnValue( +[MediaServiceConfiguration sharedInstance]( &OBJC_CLASS___MediaServiceConfiguration,  "sharedInstance"));
            dispatch_group_enter(v86);
            v103 = *p_appBundleIdentifier;
            v188[0] = _NSConcreteStackBlock;
            v188[1] = 3221225472LL;
            v188[2] = sub_100005D48;
            v188[3] = &unk_100014588;
            v188[4] = self;
            v104 = v86;
            v189 = v104;
            [v102 getPublicInfoForBundleID:v103 completion:v188];
            v160 = v102;
            dispatch_group_enter(v104);
            v186[0] = _NSConcreteStackBlock;
            v186[1] = 3221225472LL;
            v186[2] = sub_100005DB0;
            v186[3] = &unk_1000145B0;
            v186[4] = self;
            v105 = v104;
            v187 = v105;
            v161 = objc_retainBlock(v186);
            if (v163
              && +[MSAssistantPreferences isMultiUserEnabledForSiri]( &OBJC_CLASS___MSAssistantPreferences,  "isMultiUserEnabledForSiri"))
            {
              v106 = (void *)objc_claimAutoreleasedReturnValue( +[MSAssistantPreferences sharedPreferences]( &OBJC_CLASS___MSAssistantPreferences,  "sharedPreferences"));
              v181[0] = _NSConcreteStackBlock;
              v181[1] = 3221225472LL;
              v181[2] = sub_100005EE8;
              v181[3] = &unk_1000145D8;
              id v182 = v102;
              id v183 = v58;
              v184 = self;
              v185 = v161;
              [v106 getHomeUserIDForSpeaker:v163 completion:v181];

              v107 = v182;
            }

            else
            {
              id v108 = sub_10000CCD4();
              v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v170 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_DEFAULT,  "ResolvedSharedUserID is nil; Multiuser not supported or Recognize my voice is off",
                  v170,
                  2u);
              }

              v107 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
              [v102 getCachedServiceInfo:v58 homeUserID:0 endpointID:v107 completion:v161];
            }

            id v110 = v5;
            uint64_t v111 = objc_opt_class(&OBJC_CLASS___INPlayMediaIntent);
            if ((objc_opt_isKindOfClass(v110, v111) & 1) != 0)
            {
              else {
                int v112 = 5;
              }
            }

            else
            {
              uint64_t v113 = objc_opt_class(&OBJC_CLASS___INAddMediaIntent);
              if ((objc_opt_isKindOfClass(v110, v113) & 1) != 0)
              {
                int v112 = 7;
              }

              else
              {
                uint64_t v114 = objc_opt_class(&OBJC_CLASS___INUpdateMediaAffinityIntent);
                if ((objc_opt_isKindOfClass(v110, v114) & 1) != 0) {
                  int v112 = 8;
                }
                else {
                  int v112 = 5;
                }
              }
            }

            networkActivity = self->_networkActivity;
            if (!networkActivity || -[CMSNetworkActivity label](networkActivity, "label") != v112)
            {
              dispatch_group_enter(v105);
              id v116 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
              v176[0] = _NSConcreteStackBlock;
              v176[1] = 3221225472LL;
              v176[2] = sub_100006008;
              v176[3] = &unk_100014600;
              id v117 = v116;
              int v180 = v112;
              id v177 = v117;
              v178 = self;
              v179 = v105;
              [v117 currectNWActivityId:v176];
            }

            dispatch_group_wait(v105, 0xFFFFFFFFFFFFFFFFLL);
            if (self->_mediaServicePublicDBInfo)
            {
              if (self->_mediaService)
              {
                if (([(id)v200[5] isEqual:*p_appBundleIdentifier] & 1) == 0
                  && *(void *)(*(void *)&buf[8] + 40LL))
                {
                  id v118 = sub_10000CCD4();
                  v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
                  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v170 = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEFAULT,  "Not providing PlayerContext to session because of service bundle identifier mismatch",  v170,  2u);
                  }

                  v120 = *(void **)(*(void *)&buf[8] + 40LL);
                  *(void *)(*(void *)&buf[8] + 40LL) = 0LL;
                }

                id v121 = sub_10000CCD4();
                v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
                if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG)) {
                  sub_10000CE8C((uint64_t)&buf[8], v122);
                }

                id v123 = sub_10000CCD4();
                v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
                if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v170 = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEFAULT,  "Getting extension configuration for service",  v170,  2u);
                }

                v125 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler resolvedHomeUserID](self, "resolvedHomeUserID"));
                if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
                {
                  uint64_t v126 = objc_claimAutoreleasedReturnValue(-[IntentHandler speakerHomeUserID](self, "speakerHomeUserID"));

                  v159 = (void *)v126;
                }

                else
                {
                  v159 = v125;
                }

                *(void *)v170 = 0LL;
                v171 = v170;
                uint64_t v172 = 0x3032000000LL;
                v173 = sub_100005AD0;
                v174 = sub_100005AE0;
                id v175 = 0LL;
                v147 = self->_playerInterface;
                v148 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler appServiceID](self, "appServiceID"));
                v149 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler endpointIdentifier](self, "endpointIdentifier"));
                v169[0] = _NSConcreteStackBlock;
                v169[1] = 3221225472LL;
                v169[2] = sub_10000613C;
                v169[3] = &unk_100014628;
                v169[4] = v170;
                -[CloudMediaServicesPlayerInterface getCloudExtensionConfigurationFor:homeUserID:endpointID:withCompletion:]( v147,  "getCloudExtensionConfigurationFor:homeUserID:endpointID:withCompletion:",  v148,  v159,  v149,  v169);

                if (*((void *)v171 + 5))
                {
                  dispatch_group_enter(v105);
                  v80 = (MSBServiceUnavailableIntentHandler *)objc_claimAutoreleasedReturnValue( -[IntentHandler _mediaServiceCloudExtensionConfigURL:]( self,  "_mediaServiceCloudExtensionConfigURL:",  *((void *)v171 + 5)));
                  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService authCredential](self->_mediaService, "authCredential"));
                  v151 = (void *)objc_claimAutoreleasedReturnValue([v150 authHeader]);
                  v165[0] = _NSConcreteStackBlock;
                  v165[1] = 3221225472LL;
                  v165[2] = sub_1000061BC;
                  v165[3] = &unk_100014650;
                  v165[4] = self;
                  v167 = buf;
                  v168 = v170;
                  v152 = v105;
                  v166 = v152;
                  -[IntentHandler _fetchConfiguration:authHeader:completion:]( self,  "_fetchConfiguration:authHeader:completion:",  v80,  v151,  v165);

                  dispatch_group_wait(v152, 0xFFFFFFFFFFFFFFFFLL);
                  id v153 = sub_10000CCD4();
                  v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
                  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                  {
                    serviceSession = self->_serviceSession;
                    *(_DWORD *)v205 = 138412290;
                    v206 = serviceSession;
                    _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "Session: %@", v205, 0xCu);
                  }

                  protocolException = self->_protocolException;
                  self->_protocolException = 0LL;

                  int v81 = 0;
                }

                else
                {
                  v157 = -[MSBServiceUnavailableIntentHandler initWithReason:]( objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler),  "initWithReason:",  3LL);
                  v158 = self->_serviceUnavailable;
                  self->_serviceUnavailable = v157;

                  v80 = self->_serviceUnavailable;
                  int v81 = 1;
                }

                _Block_object_dispose(v170, 8);

                goto LABEL_100;
              }

              id v138 = sub_10000CCD4();
              v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
                sub_10000CE58(v139, v140, v141, v142, v143, v144, v145, v146);
              }

              v136 = objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler);
              uint64_t v137 = 1LL;
            }

            else
            {
              id v127 = sub_10000CCD4();
              v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
                sub_10000CE24(v128, v129, v130, v131, v132, v133, v134, v135);
              }

              v136 = objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler);
              uint64_t v137 = 2LL;
            }

            v80 = -[MSBServiceUnavailableIntentHandler initWithReason:](v136, "initWithReason:", v137);
            int v81 = 1;
LABEL_100:

            objc_destroyWeak(&v197);
            objc_destroyWeak(&location);
            _Block_object_dispose(&v199, 8);

            _Block_object_dispose(buf, 8);
            goto LABEL_101;
          }

- (BOOL)respondsToSelector:(SEL)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSCloudExtensionSession config](self->_serviceSession, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 configForEndpoint:self->_protocolEndpoint]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 optionalMethods]);

  if (-[NSString isEqualToString:](self->_protocolEndpoint, "isEqualToString:", CMSExtensionEndpointIntentPlayMedia))
  {
    if ("confirmPlayMedia:completion:" != a3 && "resolveMediaItemsForPlayMedia:withCompletion:" != a3)
    {
      if ("resolvePlayShuffledForPlayMedia:withCompletion:" == a3)
      {
        v10 = &CMSProtocolPlayMediaIntentHandlingResolvePlayShuffledMethodName;
        goto LABEL_31;
      }

      if ("resolveResumePlaybackForPlayMedia:withCompletion:" == a3)
      {
        v10 = &CMSProtocolPlayMediaIntentHandlingResolveResumePlaybackMethodName;
        goto LABEL_31;
      }

      if ("resolvePlaybackRepeatModeForPlayMedia:withCompletion:" == a3)
      {
        v10 = &CMSProtocolPlayMediaIntentHandlingResolvePlaybackRepeatModeMethodName;
        goto LABEL_31;
      }

      if ("resolvePlaybackQueueLocationForPlayMedia:withCompletion:" == a3)
      {
        v10 = &CMSProtocolPlayMediaIntentHandlingResolvePlaybackQueueLocationMethodName;
        goto LABEL_31;
      }

      if ("resolvePlaybackSpeedForPlayMedia:withCompletion:" == a3)
      {
        v10 = &CMSProtocolPlayMediaIntentHandlingResolvePlaybackSpeedMethodName;
        goto LABEL_31;
      }

      goto LABEL_23;
    }
  }

  else if (-[NSString isEqualToString:]( self->_protocolEndpoint,  "isEqualToString:",  CMSExtensionEndpointIntentAddMedia))
  {
    if ("confirmAddMedia:completion:" == a3)
    {
      v10 = &CMSProtocolAddMediaIntentHandlingConfirmMethodName;
      goto LABEL_31;
    }

    if ("resolveMediaItemsForAddMedia:withCompletion:" != a3)
    {
      if ("resolveMediaDestinationForAddMedia:withCompletion:" == a3)
      {
        v10 = &CMSProtocolAddMediaIntentHandlingResolveMediaDestinationMethodName;
LABEL_31:
        unsigned __int8 v11 = [v7 containsObject:*v10];
        goto LABEL_32;
      }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IntentHandler;
  -[IntentHandler dealloc](&v3, "dealloc");
}

- (void)authRenewalForSessionIdentifier:(id)a3 parentNetworkActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[MediaServiceConfiguration sharedInstance](&OBJC_CLASS___MediaServiceConfiguration, "sharedInstance"));
  mediaService = self->_mediaService;
  resolvedHomeUserID = self->_resolvedHomeUserID;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100006870;
  v16[3] = &unk_100014678;
  id v17 = v8;
  id v18 = v9;
  v16[4] = self;
  id v14 = v8;
  id v15 = v9;
  [v11 requestAuthRenewalForMediaService:mediaService homeUserID:resolvedHomeUserID parentNetworkActivity:v10 completion:v16];
}

- (void)_performMethodInContext:(const char *)a3 methodName:(id)a4 params:(id)a5 completion:(id)a6
{
  id v10 = a4;
  unsigned __int8 v11 = (NSError *)a5;
  id v12 = a6;
  objc_super v13 = self->_protocolException;
  if (!v13)
  {
    uint64_t v16 = CMSPredictedMethodNameForElidingMethod(v10);
    id v17 = (NSError *)objc_claimAutoreleasedReturnValue(v16);
    if (v17)
    {
      serviceSession = self->_serviceSession;
      id v39 = 0LL;
      uint64_t v19 = objc_claimAutoreleasedReturnValue( -[CMSCloudExtensionSession peekResponseForMethod:exception:]( serviceSession,  "peekResponseForMethod:exception:",  v10,  &v39));
      unint64_t v20 = (unint64_t)v39;
      if (!(v19 | v20))
      {
        v21 = self->_serviceSession;
        id v38 = 0LL;
        uint64_t v19 = objc_claimAutoreleasedReturnValue( -[CMSCloudExtensionSession peekResponseForMethod:exception:]( v21,  "peekResponseForMethod:exception:",  v17,  &v38));
        unint64_t v20 = (unint64_t)v38;
        if (!(v19 | v20))
        {
          id v22 = sub_10000CCD4();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v41 = a3;
            __int16 v42 = 2114;
            id v43 = v10;
            __int16 v44 = 2114;
            v45 = v17;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Eliding request to %{public}@ because a result for %{public}@ was predicted",  buf,  0x20u);
          }

          (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
LABEL_15:

          goto LABEL_16;
        }
      }

      v24 = (void *)v20;
    }

    -[IntentHandler reportAnalyticsForMethod:forEventType:]( self,  "reportAnalyticsForMethod:forEventType:",  v10,  kCMSInterfaceAnalyticsDataRequestTSTypeStartTime);
    id v25 = sub_10000CCD4();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v41 = a3;
      __int16 v42 = 2112;
      id v43 = v10;
      __int16 v44 = 2112;
      v45 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s Performing %@ with params: %@",  buf,  0x20u);
    }

    -[IntentHandler reportAnalyticsForMethod:forEventType:]( self,  "reportAnalyticsForMethod:forEventType:",  v10,  kCMSInterfaceAnalyticsDataRequestTSTypePreProcess);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v28 = self->_serviceSession;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100006D4C;
    v31[3] = &unk_1000146C8;
    v37 = a3;
    id v32 = v10;
    id v36 = v12;
    v33 = self;
    v34 = v11;
    id v35 = v27;
    id v30 = v27;
    -[CMSCloudExtensionSession performMethod:withParams:networkActivity:completion:]( v28,  "performMethod:withParams:networkActivity:completion:",  v32,  v34,  v29,  v31);

    goto LABEL_15;
  }

  id v14 = sub_10000CCD4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v41 = a3;
    __int16 v42 = 2112;
    id v43 = v10;
    __int16 v44 = 2112;
    v45 = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Not performing %@ because of prior protocol error: %@",  buf,  0x20u);
  }

  (*((void (**)(id, void, NSError *))v12 + 2))(v12, 0LL, v13);
LABEL_16:
}

- (void)resolveMediaItemsForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[IntentHandler resolveMediaItemsForPlayMedia:withCompletion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  uint64_t v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 cmsCoded]);
  id v17 = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolPlayMediaIntentHandlingResolveMediaItemsMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100007334;
  v14[3] = &unk_1000146F0;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolveMediaItemsForPlayMedia:withCompletion:]",  v12,  v11,  v14);
}

- (void)resolvePlayShuffledForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[IntentHandler resolvePlayShuffledForPlayMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v19 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  __int16 v20 = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playShuffled]);
  unsigned __int8 v13 = [v12 BOOLValue];

  uint64_t v14 = CMSProtocolPlayMediaIntentHandlingResolvePlayShuffledMethodName;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000076A0;
  v16[3] = &unk_100014718;
  v16[4] = self;
  id v17 = v6;
  unsigned __int8 v18 = v13;
  id v15 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolvePlayShuffledForPlayMedia:withCompletion:]",  v14,  v11,  v16);
}

- (void)resolvePlaybackRepeatModeForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[IntentHandler resolvePlaybackRepeatModeForPlayMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  unsigned __int8 v18 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  uint64_t v19 = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  id v12 = [v7 playbackRepeatMode];
  uint64_t v13 = CMSProtocolPlayMediaIntentHandlingResolvePlaybackRepeatModeMethodName;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000079D8;
  v15[3] = &unk_100014740;
  v15[4] = self;
  id v16 = v6;
  id v17 = v12;
  id v14 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolvePlaybackRepeatModeForPlayMedia:withCompletion:]",  v13,  v11,  v15);
}

- (void)resolveResumePlaybackForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[IntentHandler resolveResumePlaybackForPlayMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v19 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  __int16 v20 = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 resumePlayback]);
  unsigned __int8 v13 = [v12 BOOLValue];

  uint64_t v14 = CMSProtocolPlayMediaIntentHandlingResolveResumePlaybackMethodName;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100007D08;
  v16[3] = &unk_100014718;
  v16[4] = self;
  id v17 = v6;
  unsigned __int8 v18 = v13;
  id v15 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolveResumePlaybackForPlayMedia:withCompletion:]",  v14,  v11,  v16);
}

- (void)resolvePlaybackQueueLocationForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[IntentHandler resolvePlaybackQueueLocationForPlayMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  unsigned __int8 v18 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  uint64_t v19 = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  id v12 = [v7 playbackQueueLocation];
  uint64_t v13 = CMSProtocolPlayMediaIntentHandlingResolvePlaybackQueueLocationMethodName;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008040;
  v15[3] = &unk_100014740;
  v15[4] = self;
  id v16 = v6;
  id v17 = v12;
  id v14 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolvePlaybackQueueLocationForPlayMedia:withCompletion:]",  v13,  v11,  v15);
}

- (void)resolvePlaybackSpeedForPlayMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[IntentHandler resolvePlaybackSpeedForPlayMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v19 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  __int16 v20 = v10;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playbackSpeed]);
  uint64_t v13 = CMSProtocolPlayMediaIntentHandlingResolvePlaybackSpeedMethodName;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100008374;
  v16[3] = &unk_100014768;
  id v17 = v12;
  id v18 = v6;
  v16[4] = self;
  id v14 = v12;
  id v15 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolvePlaybackSpeedForPlayMedia:withCompletion:]",  v13,  v11,  v16);
}

- (void)_handlePlayMediaIntent:(id)a3 result:(id)a4 error:(id)a5 prepareQueueOnly:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v105 = v14;
  v106 = v12;
  if (v13 || !v14)
  {
    BOOL v101 = v8;
    id v27 = [v12 playbackQueueLocation];
    id v28 = sub_10000CCD4();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      if (v27 == (id)1) {
        int v30 = 78;
      }
      else {
        int v30 = 89;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Request to modify current queue: %c",  buf,  8u);
    }

    *(void *)buf = 0LL;
    uint64_t v132 = buf;
    uint64_t v133 = 0x3032000000LL;
    uint64_t v134 = sub_100005AD0;
    uint64_t v135 = sub_100005AE0;
    id v31 = [v13 cmsOptionalDecodedClass:objc_opt_class(INPlayMediaIntentResponse) forKey:@"response"];
    id v136 = (id)objc_claimAutoreleasedReturnValue(v31);
    if (*((void *)v132 + 5))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"response"]);
      v103 = (INPlayMediaIntentResponse *)objc_claimAutoreleasedReturnValue([v32 cmsOptionalDictionaryForKey:@"userActivity"]);

      v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v106 privatePlayMediaIntentData]);
      v104 = (void *)objc_claimAutoreleasedReturnValue([v34 privateMediaIntentData]);

      id v35 = (void *)objc_claimAutoreleasedReturnValue([v104 proxiedThirdPartyAppInfo]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 appName]);
      -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v36, kThirdPartyAppIdentifier);

      v37 = (void *)objc_claimAutoreleasedReturnValue([v104 proxiedThirdPartyAppInfo]);
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 bundleIdentifier]);
      -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v38, kThirdPartyBundleIdentifier);

      id v39 = (void *)objc_claimAutoreleasedReturnValue([v104 proxiedThirdPartyAppInfo]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 bundleVersion]);
      -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v40, kThirdPartyBundleVersion);

      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_speakerSharedUserID,  kResolvedSharedUserID);
      p_resolvedHomeUserID = (id *)&self->_resolvedHomeUserID;
      unsigned int v41 = -[NSString isEqualToString:]( self->_currentPlaybackAccountHomeUserID,  "isEqualToString:",  self->_resolvedHomeUserID);
      id v42 = sub_10000CCD4();
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        if (v41) {
          int v44 = 89;
        }
        else {
          int v44 = 78;
        }
        *(_DWORD *)v128 = 67109120;
        *(_DWORD *)&v128[4] = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "Playing and requested account equal: %c",  v128,  8u);
      }

      uint64_t v45 = objc_claimAutoreleasedReturnValue( -[INPlayMediaIntentResponse objectForKeyedSubscript:]( v103,  "objectForKeyedSubscript:",  @"persistentIdentifier"));
      -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v45, kUserActivityPersistentID);
      userActivityPersistentIdentifier = self->_userActivityPersistentIdentifier;
      BOOL v47 = ((unint64_t)userActivityPersistentIdentifier | v45) != 0;
      v100 = (void *)v45;
      unsigned int v48 = -[NSString isEqualToString:](userActivityPersistentIdentifier, "isEqualToString:", v45);
      id v49 = sub_10000CCD4();
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        if (v48) {
          int v51 = 89;
        }
        else {
          int v51 = 78;
        }
        *(_DWORD *)v128 = 67109120;
        *(_DWORD *)&v128[4] = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "Playing userActivityIdentifier are equal: %c",  v128,  8u);
      }

      if (v47) {
        int v52 = (v27 != (id)1) & (v41 ^ 1) & v48;
      }
      else {
        int v52 = (v27 != (id)1) & (v41 ^ 1);
      }
      id v53 = sub_10000CCD4();
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        if (v52) {
          int v55 = 89;
        }
        else {
          int v55 = 78;
        }
        *(_DWORD *)v128 = 67109120;
        *(_DWORD *)&v128[4] = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Overriding account Info: %c", v128, 8u);
      }

      if (!v52) {
        goto LABEL_38;
      }
      *(void *)v128 = 0LL;
      *(void *)&v128[8] = v128;
      *(void *)&v128[16] = 0x3032000000LL;
      uint64_t v129 = sub_100005AD0;
      *(void *)&__int128 v130 = sub_100005AE0;
      *((void *)&v130 + 1) = 0LL;
      objc_initWeak(&location, self);
      uint64_t v119 = 0LL;
      v120 = &v119;
      uint64_t v121 = 0x3032000000LL;
      v122 = sub_100005AD0;
      id v123 = sub_100005AE0;
      id v124 = 0LL;
      v56 = dispatch_group_create();
      dispatch_group_enter(v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[MediaServiceConfiguration sharedInstance]( &OBJC_CLASS___MediaServiceConfiguration,  "sharedInstance"));
      appBundleIdentifier = self->_appBundleIdentifier;
      currentPlaybackAccountHomeUserID = self->_currentPlaybackAccountHomeUserID;
      endpointIdentifier = self->_endpointIdentifier;
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472LL;
      v114[2] = sub_1000092D8;
      v114[3] = &unk_100014790;
      objc_copyWeak(&v118, &location);
      id v116 = v128;
      id v117 = &v119;
      v61 = v56;
      v115 = v61;
      [v57 getCachedServiceInfo:appBundleIdentifier homeUserID:currentPlaybackAccountHomeUserID endpointID:endpointIdentifier completion:v114];

      dispatch_group_wait(v61, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v99 = *(void *)(*(void *)&v128[8] + 40LL);
      if (v99)
      {
        id v62 = sub_10000CCD4();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v64 = v120[5];
          *(_DWORD *)uint64_t v126 = 138412290;
          uint64_t v127 = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Updating Auth and Config Info with user's (%@) account info",  v126,  0xCu);
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v128[8] + 40) authCredential]);
        v98 = (void *)objc_claimAutoreleasedReturnValue([v65 authHeader]);

        -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v98, kSessionAuthHeader);
        dispatch_group_enter(v61);
        v66 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v128[8] + 40) configURL]);
        v67 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v128[8] + 40) authCredential]);
        id v68 = (void *)objc_claimAutoreleasedReturnValue([v67 authHeader]);
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472LL;
        v111[2] = sub_1000093A4;
        v111[3] = &unk_1000147B8;
        id v69 = v33;
        int v112 = v69;
        v70 = v61;
        uint64_t v113 = v70;
        -[IntentHandler _fetchConfiguration:authHeader:completion:]( self,  "_fetchConfiguration:authHeader:completion:",  v66,  v68,  v111);

        dispatch_group_wait(v70, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v71 = self->_currentPlaybackAccountHomeUserID;
        if (!v71) {
          uint64_t v71 = (NSString *)v120[5];
        }
        objc_storeStrong(p_resolvedHomeUserID, v71);
        -[NSMutableDictionary na_safeSetObject:forKey:]( v69,  "na_safeSetObject:forKey:",  *p_resolvedHomeUserID,  kResolvedHomeUserID);
      }

      objc_destroyWeak(&v118);
      _Block_object_dispose(&v119, 8);

      objc_destroyWeak(&location);
      _Block_object_dispose(v128, 8);

      if (!v99)
      {
LABEL_38:
        id v72 = sub_10000CCD4();
        uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v128 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "Falling through to using same config and userAccount Info",  v128,  2u);
        }

        uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler serviceSession](self, "serviceSession"));
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v74 config]);

        uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler serviceSession](self, "serviceSession"));
        uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v76 authHeader]);
        -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v77, kSessionAuthHeader);

        -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  *p_resolvedHomeUserID,  kResolvedHomeUserID);
        v78 = (void *)objc_claimAutoreleasedReturnValue([v75 configUrl]);
        v79 = (void *)objc_claimAutoreleasedReturnValue([v78 absoluteString]);
        -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  v79,  kCachedEndpointConfigurationURL);

        v80 = (void *)objc_claimAutoreleasedReturnValue([v75 configDictionary]);
        -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  v80,  kCachedEndpointConfigurationDictionary);
      }

      int v81 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler sessionIdentifier](self, "sessionIdentifier", v98));
      -[NSMutableDictionary na_safeSetObject:forKey:](v33, "na_safeSetObject:forKey:", v81, kSessionIdentifier);

      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSString isEqualToString:]( self->_speakerHomeUserID,  "isEqualToString:",  *p_resolvedHomeUserID)));
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  v82,  kSpeakerUpdateListeningHistory);

      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  *p_resolvedHomeUserID,  kResolvedHomeUserID);
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_speakerHomeUserID,  kRequesterHomeUserID);
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_appServiceID,  kThirdPartyServiceID);
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_networkActivity,  kParentNetworkActivity);
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_endpointIdentifier,  kEndpointIdentifierKey);
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_mediaRouteIdentifier,  kMediaRouteIdentifierKey);
      -[NSMutableDictionary na_safeSetObject:forKey:]( v33,  "na_safeSetObject:forKey:",  self->_siriLanguageCode,  kSiriLanguageCodeKey);
      id v83 = sub_10000CCD4();
      id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue([v106 airPlayRouteIds]);
        v86 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v106 identifier]);
        *(_DWORD *)v128 = 138478595;
        *(void *)&v128[4] = v33;
        *(_WORD *)&v128[12] = 2112;
        *(void *)&v128[14] = v85;
        *(_WORD *)&v128[22] = 2112;
        uint64_t v129 = v86;
        LOWORD(v130) = 2112;
        *(void *)((char *)&v130 + 2) = v103;
        _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "Received Intent and UserData %{private}@ AirplayRouteIDS %@ IntentID %@ userActivityDictionary..%@",  v128,  0x2Au);
      }

      if (!v101)
      {
        uint64_t v87 = CMSProtocolPlayMediaIntentHandlingHandleMethodName;
        -[IntentHandler reportAnalyticsForMethod:forEventType:]( self,  "reportAnalyticsForMethod:forEventType:",  CMSProtocolPlayMediaIntentHandlingHandleMethodName,  kCMSInterfaceAnalyticsDataRequestTSTypePostProcess);
        -[IntentHandler reportAnalyticsForMethod:forEventType:]( self,  "reportAnalyticsForMethod:forEventType:",  v87,  kCMSInterfaceAnalyticsDataRequestTSTypeSuccessEnd);
      }

      playerInterface = self->_playerInterface;
      id v89 = -[INPlayMediaIntentResponse copy](v103, "copy");
      uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue([v106 identifier]);
      uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue([v106 airPlayRouteIds]);
      id v92 = -[NSMutableDictionary count](v33, "count");
      if (v92) {
        id v93 = -[NSMutableDictionary copy](v33, "copy");
      }
      else {
        id v93 = 0LL;
      }
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472LL;
      v107[2] = sub_10000950C;
      v107[3] = &unk_1000147E0;
      v107[4] = self;
      v109 = buf;
      BOOL v110 = v101;
      id v108 = v15;
      -[CloudMediaServicesPlayerInterface sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepareQueue:withCompletion:]( playerInterface,  "sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepareQueue:withCompletion:",  v89,  v90,  v91,  v93,  v101,  v107);
      if (v92) {

      }
      v97 = v103;
    }

    else
    {
      id v94 = sub_10000CCD4();
      uint64_t v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        sub_10000D57C();
      }

      uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
      [v96 completeActivity:3];

      v97 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  6LL,  0LL);
      (*((void (**)(id, INPlayMediaIntentResponse *))v15 + 2))(v15, v97);
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v16 = sub_10000CCD4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000D50C(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
    [v25 completeActivity:3];

    v26 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  6LL,  0LL);
    (*((void (**)(id, INPlayMediaIntentResponse *))v15 + 2))(v15, v26);
  }
}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, INPlayMediaIntentResponse *))a4;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v23 = "-[IntentHandler confirmPlayMedia:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v10 = self->_protocolException;
  if (v10)
  {
    id v11 = sub_10000CCD4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000D718();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
    [v13 completeActivity:3];

    id v14 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  6LL,  0LL);
    v7[2](v7, v14);
  }

  else
  {
    serviceSession = self->_serviceSession;
    id v21 = 0LL;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[CMSCloudExtensionSession peekResponseForMethod:exception:]( serviceSession,  "peekResponseForMethod:exception:",  CMSProtocolPlayMediaIntentHandlingHandleMethodName,  &v21));
    id v14 = (INPlayMediaIntentResponse *)v21;
    id v17 = sub_10000CCD4();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16 | (unint64_t)v14)
    {
      if (v19)
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = "-[IntentHandler confirmPlayMedia:completion:]";
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Result from peek ..%@. Exception .. %@",  buf,  0x20u);
      }

      -[IntentHandler reportAnalyticsForMethod:forEventType:]( self,  "reportAnalyticsForMethod:forEventType:",  CMSProtocolPlayMediaIntentHandlingConfirmMethodName,  kCMSInterfaceAnalyticsDataRequestTSTypePostProcess);
      -[IntentHandler _handlePlayMediaIntent:result:error:prepareQueueOnly:completion:]( self,  "_handlePlayMediaIntent:result:error:prepareQueueOnly:completion:",  v6,  v16,  v14,  1LL,  v7);
    }

    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = "-[IntentHandler confirmPlayMedia:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Completing as Success because result was not predicted",  buf,  0xCu);
      }

      uint64_t v20 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  4LL,  0LL);
      v7[2](v7, v20);
    }
  }
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[IntentHandler handlePlayMedia:completion:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  BOOL v19 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 cmsCoded]);
  uint64_t v20 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009B00;
  v15[3] = &unk_100014808;
  objc_copyWeak(&v18, (id *)buf);
  uint64_t v12 = CMSProtocolPlayMediaIntentHandlingHandleMethodName;
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  id v17 = v14;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler handlePlayMedia:completion:]",  v12,  v11,  v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)resolveMediaItemsForAddMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v19 = "-[IntentHandler resolveMediaItemsForAddMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);

  id v17 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolAddMediaIntentHandlingResolveMediaItemsMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100009CEC;
  v14[3] = &unk_1000146F0;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolveMediaItemsForAddMedia:withCompletion:]",  v12,  v11,  v14);
}

- (void)resolveMediaDestinationForAddMedia:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[IntentHandler resolveMediaDestinationForAddMedia:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  BOOL v19 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  uint64_t v20 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaDestination]);
  uint64_t v13 = CMSProtocolAddMediaIntentHandlingResolveMediaDestinationMethodName;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000A05C;
  v16[3] = &unk_100014768;
  id v17 = v12;
  id v18 = v6;
  v16[4] = self;
  id v14 = v12;
  id v15 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolveMediaDestinationForAddMedia:withCompletion:]",  v13,  v11,  v16);
}

- (void)confirmAddMedia:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v19 = "-[IntentHandler confirmAddMedia:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);

  id v17 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolAddMediaIntentHandlingConfirmMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A384;
  v14[3] = &unk_100014830;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler confirmAddMedia:completion:]",  v12,  v11,  v14);
}

- (void)handleAddMedia:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v19 = "-[IntentHandler handleAddMedia:completion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  id v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 cmsCoded]);
  id v17 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolAddMediaIntentHandlingHandleMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A640;
  v14[3] = &unk_1000146F0;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler handleAddMedia:completion:]",  v12,  v11,  v14);
}

- (void)resolveMediaItemsForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v19 = "-[IntentHandler resolveMediaItemsForUpdateMediaAffinity:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);

  id v17 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolUpdateMediaAffinityIntentHandlingResolveMediaItemsMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A96C;
  v14[3] = &unk_1000146F0;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolveMediaItemsForUpdateMediaAffinity:withCompletion:]",  v12,  v11,  v14);
}

- (void)resolveAffinityTypeForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[IntentHandler resolveAffinityTypeForUpdateMediaAffinity:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v18 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);
  BOOL v19 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  id v12 = [v7 affinityType];
  uint64_t v13 = CMSProtocolUpdateMediaAffinityIntentHandlingResolveAffinityTypeMethodName;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000ACC4;
  v15[3] = &unk_100014740;
  void v15[4] = self;
  id v16 = v6;
  id v17 = v12;
  id v14 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler resolveAffinityTypeForUpdateMediaAffinity:withCompletion:]",  v13,  v11,  v15);
}

- (void)confirmUpdateMediaAffinity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v19 = "-[IntentHandler confirmUpdateMediaAffinity:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 cmsCoded]);

  id v17 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolUpdateMediaAffinityIntentHandlingConfirmMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000AFC8;
  v14[3] = &unk_100014830;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler confirmUpdateMediaAffinity:completion:]",  v12,  v11,  v14);
}

- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000CCD4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v19 = "-[IntentHandler handleUpdateMediaAffinity:completion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  id v16 = @"intent";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 cmsCoded]);
  id v17 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

  uint64_t v12 = CMSProtocolUpdateMediaAffinityIntentHandlingHandleMethodName;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000B280;
  v14[3] = &unk_1000146F0;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  -[IntentHandler _performMethodInContext:methodName:params:completion:]( self,  "_performMethodInContext:methodName:params:completion:",  "-[IntentHandler handleUpdateMediaAffinity:completion:]",  v12,  v11,  v14);
}

- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = sub_10000CCD4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10000DB10();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[INSearchForMediaMediaItemResolutionResult unsupported]( &OBJC_CLASS___INSearchForMediaMediaItemResolutionResult,  "unsupported"));
  id v11 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  v6[2](v6, v10);
}

- (void)handleSearchForMedia:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = -[INSearchForMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INSearchForMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
  (*((void (**)(id, INSearchForMediaIntentResponse *))a4 + 2))(v5, v6);
}

- (void)reportAnalyticsForMethod:(id)a3 forEventType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"."]);
  if ([v8 count] == (id)2)
  {
    v16[0] = @"requestClass";
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    v17[0] = v9;
    v16[1] = @"requestAction";
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    v16[2] = @"serviceName";
    appBundleIdentifier = self->_appBundleIdentifier;
    v17[1] = v10;
    v17[2] = appBundleIdentifier;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));

    playerInterface = self->_playerInterface;
    sessionIdentifier = self->_sessionIdentifier;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CloudMediaServicesPlayerInterface submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:]( playerInterface,  "submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:",  v6,  sessionIdentifier,  v7,  v15,  v12);
  }
}

- (void)reportAnalyticsFail
{
}

- (BOOL)_isResolutionResultTerminal:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)i),  "_isResolutionTerminal",  (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_isResolutionResultFailure:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)i),  "_isResolutionFailure",  (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)_mediaServiceCloudExtensionConfigURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaService configURL](self->_mediaService, "configURL"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serverOverrideURL]);

  if (v6)
  {
    id v7 = sub_10000CCD4();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[IntentHandler _mediaServiceCloudExtensionConfigURL:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Overriding value of configuration URL",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 serverOverrideURL]);
    id v5 = (void *)v9;
  }

  id v10 = sub_10000CCD4();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = (const char *)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Using configuration URL %@",  (uint8_t *)&v13,  0xCu);
  }

  return v5;
}

- (BOOL)_resolveUpdateListeningHistorySetting:(id)a3
{
  id v4 = a3;
  if (([v4 homeKitUpdateListeningHistorySetting] & 1) == 0)
  {
    id v6 = sub_10000CCD4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      id v18 = "-[IntentHandler _resolveUpdateListeningHistorySetting:]";
      BOOL v8 = "%s UpdateListening History Setting: NO";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, 0xCu);
    }

- (void)_fetchConfiguration:(id)a3 authHeader:(id)a4 completion:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (v9)
  {
    if (v16 && v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler sessionIdentifier](self, "sessionIdentifier"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler appBundleIdentifier](self, "appBundleIdentifier"));
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler mediaServicePublicDBInfo](self, "mediaServicePublicDBInfo"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 configurationPublicKey]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler siriLanguageCode](self, "siriLanguageCode"));
      +[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]( &OBJC_CLASS___CMSCloudExtensionConfiguration,  "configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfigura tion:languageCode:completion:",  v16,  v10,  v8,  self,  v11,  v12,  v14,  0LL,  v15,  v9);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CMSCloudExtensionConfigurationErrorDomain,  2LL,  0LL));
      v9[2](v9, 0LL, v10);
    }
  }
}

- (CloudMediaServicesPlayerInterface)playerInterface
{
  return self->_playerInterface;
}

- (void)setPlayerInterface:(id)a3
{
}

- (CMSCloudExtensionSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (MSBServiceUnavailableIntentHandler)serviceUnavailable
{
  return self->_serviceUnavailable;
}

- (void)setServiceUnavailable:(id)a3
{
}

- (MediaService)mediaService
{
  return self->_mediaService;
}

- (void)setMediaService:(id)a3
{
}

- (MSPublicDBInfo)mediaServicePublicDBInfo
{
  return self->_mediaServicePublicDBInfo;
}

- (void)setMediaServicePublicDBInfo:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)protocolEndpoint
{
  return self->_protocolEndpoint;
}

- (void)setProtocolEndpoint:(id)a3
{
}

- (NSString)speakerHomeUserID
{
  return self->_speakerHomeUserID;
}

- (void)setSpeakerHomeUserID:(id)a3
{
}

- (NSString)speakerSharedUserID
{
  return self->_speakerSharedUserID;
}

- (void)setSpeakerSharedUserID:(id)a3
{
}

- (NSString)resolvedHomeUserID
{
  return self->_resolvedHomeUserID;
}

- (void)setResolvedHomeUserID:(id)a3
{
}

- (NSString)appServiceID
{
  return self->_appServiceID;
}

- (void)setAppServiceID:(id)a3
{
}

- (NSError)protocolException
{
  return (NSError *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setProtocolException:(id)a3
{
}

- (CMSNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
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

- (NSString)currentPlaybackAccountHomeUserID
{
  return self->_currentPlaybackAccountHomeUserID;
}

- (void)setCurrentPlaybackAccountHomeUserID:(id)a3
{
}

- (NSString)userActivityPersistentIdentifier
{
  return self->_userActivityPersistentIdentifier;
}

- (void)setUserActivityPersistentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end