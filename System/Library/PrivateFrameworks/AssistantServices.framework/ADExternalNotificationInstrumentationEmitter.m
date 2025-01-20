@interface ADExternalNotificationInstrumentationEmitter
+ (BOOL)isFirstPartyApplicationWithBundleId:(id)a3;
+ (id)_createEmptyANCClientEventWithMetadataForRequest:(id)a3;
+ (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4;
+ (id)_getAnnounceReceivedEventFromAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4 shouldLog:(BOOL)a5;
+ (id)_getAnnounceReceivedTier1EventFromAnnouncementRequest:(id)a3;
+ (id)_getCurrentlyConnectedHeadphonesANCAudioDevice;
+ (id)_randomlySampleWithoutReplacementNumSamples:(unint64_t)a3 fromArray:(id)a4;
+ (void)_emitAnnounceEnablementEventFromSectionInfo:(id)a3 siriLocale:(id)a4;
+ (void)emitAnnouncementReceivedForAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4;
+ (void)emitCoreAnalyticsAnnounceNotificationApplicationEnablementEvents;
+ (void)emitCoreAnalyticsEventForAnnouncementRequest:(id)a3 completionReason:(int64_t)a4;
+ (void)emitRequestLinkForAnnouncementRequest:(id)a3;
+ (void)emitUserResponseSilenceForAnnouncementRequest:(id)a3;
@end

@implementation ADExternalNotificationInstrumentationEmitter

+ (BOOL)isFirstPartyApplicationWithBundleId:(id)a3
{
  return [a3 hasPrefix:@"com.apple"];
}

+ (id)_createRequestLinkInfoFromUUID:(id)a3 component:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[SISchemaUUID alloc] initWithNSUUID:v5];

  id v7 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLinkInfo);
  [v7 setUuid:v6];
  [v7 setComponent:v4];

  return v7;
}

+ (void)emitRequestLinkForAnnouncementRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_class(a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 announcementIdentifier]);
  id v15 = (id)objc_claimAutoreleasedReturnValue([v5 _createRequestLinkInfoFromUUID:v6 component:12]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 requestInfo]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 startLocalRequest]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 aceId]);

  v10 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v9);
  id v11 = [(id)objc_opt_class(a1) _createRequestLinkInfoFromUUID:v10 component:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = objc_alloc_init(&OBJC_CLASS___SISchemaRequestLink);
  [v13 setSource:v15];
  [v13 setTarget:v12];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v14 emitMessage:v13];
}

+ (id)_getCurrentlyConnectedHeadphonesANCAudioDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[AFHeadphonesAnnouncementRequestCapabilityProvider provider]( &OBJC_CLASS___ADHeadphonesAnnouncementRequestCapabilityProvider,  "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentlyRoutedHeadphonesProductID]);
  id v4 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCAudioDevice);
  if (![v3 length])
  {
LABEL_7:
    id v8 = 0LL;
    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@","]);
  if ([v5 count] != (id)2)
  {
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[ADExternalNotificationInstrumentationEmitter _getCurrentlyConnectedHeadphonesANCAudioDevice]";
      __int16 v13 = 2112;
      v14 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Invalid bt product code for headphones: %@",  (uint8_t *)&v11,  0x16u);
    }

    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
  [v4 setVendorIdentifier:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:1]);
  [v4 setProductIdentifier:v7];

  id v8 = v4;
LABEL_8:

  return v8;
}

+ (id)_getAnnounceReceivedEventFromAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4 shouldLog:(BOOL)a5
{
  BOOL v51 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCNotificationReceived);
  id v10 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCBackgroundContent);
  id v11 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCAppNotificationMetadata);
  if ([v7 requestType] == (id)1)
  {
    id v49 = v10;
    id v46 = v8;
    id v12 = v7;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 notification]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 request]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 content]);
    BOOL v16 = [v15 interruptionLevel] == (id)2;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 appID]);
    BOOL v45 = v16;
    if ([a1 isFirstPartyApplicationWithBundleId:v17])
    {
      id v18 = a1;
      unsigned int v47 = [v12 announcementType] == (id)1;
      unsigned int v48 = 1;
    }

    else
    {
      unsigned int v48 = sub_1001EC160((uint64_t)v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]( AFSiriAnnouncementRequestCapabilityManager,  "supportedAnnouncementTypesForBundleId:onPlatform:",  v17,  [v12 platform]));
      v25 = v24;
      if (v24) {
        unsigned int v47 = [v24 containsObject:&off_100513510];
      }
      else {
        unsigned int v47 = 0;
      }
      id v18 = a1;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v12 notification]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 request]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 content]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 contentType]);

    if ([v31 isEqualToString:_UNNotificationContentTypeMessagingDirect])
    {
      uint64_t v32 = 2LL;
    }

    else if ([v31 isEqualToString:_UNNotificationContentTypeMessagingGroup])
    {
      uint64_t v32 = 3LL;
    }

    else
    {
      uint64_t v32 = 1LL;
    }

    [v11 setIsAskWithSiriEnabled:v48];
    [v11 setIsSmsEligible:v47];
    [v11 setCommsNotificationType:v32];
    a1 = v18;
    if (v51)
    {
      v33 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v53 = "+[ADExternalNotificationInstrumentationEmitter _getAnnounceReceivedEventFromAnnouncementRequest:nowPlaying"
              "MediaType:shouldLog:]";
        __int16 v54 = 1024;
        *(_DWORD *)v55 = v48;
        *(_WORD *)&v55[4] = 1024;
        *(_DWORD *)&v55[6] = v47;
        LOWORD(v56[0]) = 1024;
        *(_DWORD *)((char *)v56 + 2) = v32;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s isAskWithSiriEnabled %d, isSMSEligible: %d, commsNotificationType: %d",  buf,  0x1Eu);
      }
    }

    v34 = (char *)[v12 announcementType];
    BOOL v26 = v45;
    else {
      uint64_t v27 = dword_1003C9EE0[(void)(v34 - 1)];
    }
    id v10 = v49;

    id v8 = v46;
  }

  else if ([v7 requestType] == (id)2)
  {
    id v19 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 call]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 callProviderBundleID]);
    v22 = v21;
    if (v21) {
      id v23 = v21;
    }
    else {
      id v23 = (id)objc_claimAutoreleasedReturnValue([v20 callProviderIdentifier]);
    }
    v17 = v23;

    BOOL v26 = 0LL;
    uint64_t v27 = 3LL;
    id v10 = v19;
  }

  else
  {
    v17 = 0LL;
    BOOL v26 = 0LL;
    uint64_t v27 = 0LL;
  }

  [v9 setAnnouncementCategory:v27];
  [v9 setIsTimeSensitiveAnnouncement:v26];
  if (v17)
  {
    else {
      uint64_t v35 = 2LL;
    }
  }

  else
  {
    uint64_t v35 = 0LL;
  }

  [v9 setAppCategory:v35];
  switch((unint64_t)[v7 platform])
  {
    case 1uLL:
      id v36 = [(id)objc_opt_class(a1) _getCurrentlyConnectedHeadphonesANCAudioDevice];
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      uint64_t v38 = 1LL;
      break;
    case 2uLL:
      v37 = 0LL;
      uint64_t v38 = 2LL;
      break;
    case 3uLL:
      v37 = 0LL;
      uint64_t v38 = 3LL;
      break;
    case 4uLL:
      v37 = 0LL;
      uint64_t v38 = 4LL;
      break;
    default:
      uint64_t v38 = 0LL;
      v37 = 0LL;
      break;
  }

  if ([v8 isEqualToString:kMRMediaRemoteMediaTypeMusic])
  {
    uint64_t v39 = 2LL;
  }

  else if ([v8 isEqualToString:kMRMediaRemoteMediaTypePodcast])
  {
    uint64_t v39 = 3LL;
  }

  else if ([v8 isEqualToString:kMRMediaRemoteMediaTypeAudioBook])
  {
    uint64_t v39 = 4LL;
  }

  else
  {
    uint64_t v39 = 6LL;
    if (([v8 isEqualToString:kMRMediaRemoteMediaTypeITunesU] & 1) == 0)
    {
      else {
        uint64_t v39 = 0LL;
      }
    }
  }

  [v10 setMediaType:v39];
  if (v51)
  {
    v40 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v42 = v40;
      uint64_t Name = AFSiriAnnouncementPlatformGetName([v7 platform]);
      id v50 = v10;
      v44 = (void *)objc_claimAutoreleasedReturnValue(Name);
      *(_DWORD *)buf = 136315650;
      v53 = "+[ADExternalNotificationInstrumentationEmitter _getAnnounceReceivedEventFromAnnouncementRequest:nowPlayingMe"
            "diaType:shouldLog:]";
      __int16 v54 = 2112;
      *(void *)v55 = v44;
      *(_WORD *)&v55[8] = 1024;
      v56[0] = v39;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "%s Announce Platform: %@, Currently Playing Media Type: %d",  buf,  0x1Cu);

      id v10 = v50;
    }
  }

  [v9 setTargetPlatform:v38];
  [v9 setConnectedAudioDevice:v37];
  [v9 setBackgroundContent:v10];
  [v9 setNotificationMetadata:v11];

  return v9;
}

+ (id)_getAnnounceReceivedTier1EventFromAnnouncementRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCNotificationReceivedTier1);
  if ([v3 requestType] == (id)1)
  {
    id v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appID]);
    if ([v5 platform] == (id)2)
    {
      if (sub_1001EC114()) {
        [v4 setAppBundleId:v6];
      }
      else {
        [v4 setIsRedactedDueToOptOut:1];
      }
    }
  }

  return v4;
}

+ (id)_createEmptyANCClientEventWithMetadataForRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCClientEvent);
  id v5 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCClientEventMetadata);
  id v6 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 announcementIdentifier]);

  id v8 = [v6 initWithNSUUID:v7];
  [v5 setAncId:v8];
  [v4 setEventMetadata:v5];

  return v4;
}

+ (void)emitAnnouncementReceivedForAnnouncementRequest:(id)a3 nowPlayingMediaType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v9 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v16 = [v8 initWithNSUUID:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _createEmptyANCClientEventWithMetadataForRequest:v7]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 _getAnnounceReceivedEventFromAnnouncementRequest:v7 nowPlayingMediaType:v6 shouldLog:1]);

  [v11 setLinkId:v16];
  [v10 setNotificationReceived:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v12 emitMessage:v10];

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _createEmptyANCClientEventWithMetadataForRequest:v7]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _getAnnounceReceivedTier1EventFromAnnouncementRequest:v7]);

  [v14 setLinkId:v16];
  [v13 setNotificationReceivedTier1:v14];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v15 emitMessage:v13];
}

+ (void)emitUserResponseSilenceForAnnouncementRequest:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 _createEmptyANCClientEventWithMetadataForRequest:a3]);
  id v3 = objc_alloc_init(&OBJC_CLASS___ANCSchemaANCUserResponseEvaluated);
  [v3 setUserResponseCategory:3];
  [v5 setUserResponseEvaluated:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v4 emitMessage:v5];
}

+ (void)emitCoreAnalyticsEventForAnnouncementRequest:(id)a3 completionReason:(int64_t)a4
{
  id v6 = a3;
  if ([v6 platform] == (id)2) {
    goto LABEL_24;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _getAnnounceReceivedEventFromAnnouncementRequest:v6 nowPlayingMediaType:0 shouldLog:0]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v7 connectedAudioDevice]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v32 productIdentifier]);
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1004FECA0;
  }
  v31 = v10;

  id v11 = [v7 announcementCategory];
  if ([v6 requestType] == (id)1)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 appID]);
    __int16 v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = &stru_1004FECA0;
    }
    id v15 = v14;
LABEL_16:

    goto LABEL_17;
  }

  if ([v6 requestType] == (id)2)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 call]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 callProviderBundleID]);
    v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 callProviderIdentifier]);
    }
    id v15 = v18;

    goto LABEL_16;
  }

  id v15 = &stru_1004FECA0;
LABEL_17:
  id v19 = [v7 isTimeSensitiveAnnouncement];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 languageCode]);
  v22 = (void *)v21;
  if (v21) {
    id v23 = (__CFString *)v21;
  }
  else {
    id v23 = &stru_1004FECA0;
  }
  v24 = v23;

  v34[0] = v31;
  v33[0] = @"airpodsModel";
  v33[1] = @"announceCategory";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  v34[1] = v25;
  v33[2] = @"announceStatus";
  uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  uint64_t v27 = (void *)v26;
  if (v15) {
    v28 = v15;
  }
  else {
    v28 = &stru_1004FECA0;
  }
  v34[2] = v26;
  v34[3] = v28;
  v33[3] = @"appBundleId";
  v33[4] = @"isTimeSensitiveAnnouncement";
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  v33[5] = @"locale";
  v34[4] = v29;
  v34[5] = v24;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  6LL));

  AnalyticsSendEvent(@"com.apple.SiriAnnounceNotificationsReceived", v30);
LABEL_24:
}

+ (void)_emitAnnounceEnablementEventFromSectionInfo:(id)a3 siriLocale:(id)a4
{
  v10[0] = @"announce_notifications_enabled";
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 announceSetting]));
  v11[0] = v7;
  v10[1] = @"app_bundle_id";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sectionID]);

  v10[2] = @"device_locale";
  v11[1] = v8;
  v11[2] = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  AnalyticsSendEvent(@"com.apple.SiriAnnounceNotificationsEnabled", v9);
}

+ (id)_randomlySampleWithoutReplacementNumSamples:(unint64_t)a3 fromArray:(id)a4
{
  id v5 = a4;
  id v6 = [v5 count];
  if ((unint64_t)v6 <= a3)
  {
    uint64_t v8 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v5);
  }

  else
  {
    uint32_t v7 = v6;
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    while (a3)
    {
      id v9 = [v5 objectAtIndex:arc4random_uniform(v7)];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if ((-[NSMutableSet containsObject:](v8, "containsObject:", v10) & 1) == 0)
      {
        -[NSMutableSet addObject:](v8, "addObject:", v10);
        --a3;
      }
    }
  }

  return v8;
}

+ (void)emitCoreAnalyticsAnnounceNotificationApplicationEnablementEvents
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.ADExternalNotificationInstrumentationEmitter", v4);

  id v6 = [objc_alloc((Class)off_1005744C8()) initWithQueue:v5];
  uint32_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 effectiveGlobalAnnounceSetting];
    id v9 = [v7 effectiveGlobalAnnounceHeadphonesSetting];
    if (v8 == (id)2 && v9 == (id)2)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001E8F40;
      void v11[3] = &unk_1004F5F40;
      v11[4] = a1;
      [v7 getSectionInfoForActiveSectionsWithCompletion:v11];
    }
  }
}

@end