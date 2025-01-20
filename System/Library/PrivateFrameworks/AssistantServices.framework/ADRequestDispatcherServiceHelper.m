@interface ADRequestDispatcherServiceHelper
- (BOOL)isDeviceInCarDND;
- (BOOL)isDeviceInStarkMode;
- (BOOL)isDeviceLockedWithPasscode;
- (BOOL)isTimeoutSuspended;
- (BOOL)openSensitiveURL:(id)a3;
- (id)assistantLocalizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5;
- (id)currentResponseMode;
- (id)headGestureConfiguration;
- (id)peerInfoForCurrentCommand;
- (uint64_t)isBobbleAvailable;
- (unint64_t)callState;
- (unsigned)audioSessionID;
- (void)currentAuthorizationStyle:(id)a3;
- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)deactivateAudioSessionIfNoActiveAssertions;
- (void)deactivateCurrentAnnouncementRequestForReason:(int64_t)a3;
- (void)deferAudioSessionDeactivationForAnnouncementRequest;
- (void)didCompleteRecognitionWithError:(id)a3 secureOfflineOnlyRecognition:(BOOL)a4 sessionUUID:(id)a5 statistics:(id)a6;
- (void)didRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4;
- (void)didRecognizePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)didRecognizePackage:(id)a3 sessionUUID:(id)a4;
- (void)didRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)didRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)didRecognizeTokens:(id)a3 sessionUUID:(id)a4;
- (void)didRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dismissAssistant;
- (void)dismissAssistantWithReason:(int64_t)a3;
- (void)dismissLocationServiceDialogIfNeeded;
- (void)drainLocationServiceRequestsForNewRequestAndClearLocationCache:(BOOL)a3 dismissDialog:(BOOL)a4;
- (void)extendRequestTimeoutBy:(double)a3 forRequestID:(id)a4;
- (void)fetchContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6;
- (void)fetchDeviceAndUserIdsForSharedUserId:(id)a3 withCallback:(id)a4;
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)handleCommand:(id)a3 withExecutionContextMatchingInfo:(id)a4 completion:(id)a5;
- (void)handleSpeechRecognized:(id)a3 completion:(id)a4;
- (void)handleSpeechServerEndpointIdentified:(id)a3 completion:(id)a4;
- (void)isDeviceWatchAuthenticatedWithCompletion:(id)a3;
- (void)notifySpeechDetectedIsUndirected;
- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffWithCompletion:(id)a3;
- (void)selectResultWithResultCandidate:(id)a3 completion:(id)a4;
- (void)submitExternalActivationRequest:(id)a3 completion:(id)a4;
@end

@implementation ADRequestDispatcherServiceHelper

- (id)assistantLocalizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5
{
  return 0LL;
}

- (void)dismissAssistant
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 dismissAssistant];
}

- (void)dismissAssistantWithReason:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 dismissAssistantWithReason:a3];
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 handleCommand:v6 withExecutionContextMatchingInfo:0 completion:v5];
}

- (BOOL)isDeviceInCarDND
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned __int8 v3 = [v2 isInCarDNDMode];

  return v3;
}

- (BOOL)isDeviceInStarkMode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned __int8 v3 = [v2 isInStarkMode];

  return v3;
}

- (BOOL)isDeviceLockedWithPasscode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned __int8 v3 = [v2 isDeviceLocked];

  return v3;
}

- (void)isDeviceWatchAuthenticatedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 isWatchAuthenticatedWithCompletion:v3];
}

- (BOOL)isTimeoutSuspended
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned __int8 v3 = [v2 isTimeoutSuspended];

  return v3;
}

- (BOOL)openSensitiveURL:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013D89C;
  v9[3] = &unk_1004F88C0;
  v11 = &v12;
  id v6 = v4;
  v10 = v6;
  [v5 openURL:v3 completion:v9];

  dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v6, v7);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (id)peerInfoForCurrentCommand
{
  return 0LL;
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10013D890;
  v6[3] = &unk_1004FC838;
  id v7 = v3;
  id v5 = v3;
  [v4 handleFailedStartPlaybackWithDestination:1 completion:v6];
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10013D884;
  v6[3] = &unk_1004FDA58;
  id v7 = v3;
  id v5 = v3;
  [v4 prepareForStartPlaybackWithDestination:1 intent:0 completion:v6];
}

- (void)fetchContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[ADRequestDispatcherServiceHelper fetchContextsForKeys:forRequestID:includesNearbyDevices:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s #hal fetchContextsForKeys called in AFRequestDispatcherServiceHelper.",  buf,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10013D878;
  v15[3] = &unk_1004FC5F0;
  id v16 = v11;
  id v14 = v11;
  [v13 getDeviceContextsForKeys:v9 forRequestID:v10 includesNearbyDevices:v7 completion:v15];
}

- (void)handleCommand:(id)a3 withExecutionContextMatchingInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 handleCommand:v9 withExecutionContextMatchingInfo:v8 completion:v7];
}

- (void)extendRequestTimeoutBy:(double)a3 forRequestID:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v6 extendRequestTimeoutBy:v5 forRequestID:a3];
}

- (void)didRecognizeTokens:(id)a3 sessionUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 dictationRequestDidRecognizeTokens:v6 nluResult:0 sessionUUID:v5];
}

- (void)didRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 dictationRequestDidRecognizeFinalResultCandidatePackage:v6 sessionUUID:v5];
}

- (void)didRecognizePackage:(id)a3 sessionUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 dictationRequestDidRecognizePackage:v6 nluResult:0 sessionUUID:v5];
}

- (void)didCompleteRecognitionWithError:(id)a3 secureOfflineOnlyRecognition:(BOOL)a4 sessionUUID:(id)a5 statistics:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v12 dictationRequestDidCompleteRecognitionWithError:v11 secureOfflineOnlyRecognition:v7 sessionUUID:v10 statistics:v9];
}

- (void)didRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 dictationRequestDidRecognizeTokens:v9 nluResult:v8 sessionUUID:v7];
}

- (void)didRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 dictationRequestDidRecognizePartialPackage:v9 nluResult:v8 sessionUUID:v7];
}

- (void)didRecognizePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 dictationRequestDidRecognizePackage:v9 nluResult:v8 sessionUUID:v7];
}

- (void)didRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 dictationRequestDidRecognizeVoiceCommandCandidatePackage:v9 nluResult:v8 sessionUUID:v7];
}

- (void)selectResultWithResultCandidate:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 selectResultWithResultCandidate:v6 completionHandler:v5];
}

- (void)handleSpeechServerEndpointIdentified:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 handleSpeechServerEndpointIdentified:v6 completion:v5];
}

- (void)handleSpeechRecognized:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 handleSpeechRecognized:v6 completion:v5];
}

- (void)notifySpeechDetectedIsUndirected
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 notifySpeechDetectedIsUndirected];
}

- (void)submitExternalActivationRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 handleExternalActivationRequest:v6 completion:v5];
}

- (void)fetchDeviceAndUserIdsForSharedUserId:(id)a3 withCallback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersProvider sharedInstance]( &OBJC_CLASS___ADAnalyticsIdentifiersProvider,  "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013D86C;
  v9[3] = &unk_1004F2B78;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchDeviceAndUserIdsForSharedUserId:v6 withCallback:v9];
}

- (unsigned)audioSessionID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 audioSessionController]);
  unsigned int v4 = [v3 getAudioSessionID];

  return v4;
}

- (unint64_t)callState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v3 = [v2 callState];

  return (unint64_t)v3;
}

- (id)currentResponseMode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _responseModeProvider]);

  if (v3) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchCurrentMode]);
  }
  else {
    unsigned int v4 = 0LL;
  }

  return v4;
}

- (void)deferAudioSessionDeactivationForAnnouncementRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler"));
  [v2 deferAudioSessionDeactivationForAnnouncementRequest];
}

- (void)deactivateCurrentAnnouncementRequestForReason:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler"));
  [v4 deactivateCurrentAnnouncementRequestForReason:a3];
}

- (void)deactivateAudioSessionIfNoActiveAssertions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  [v2 deactivateAudioSessionIfNoActiveAssertions];
}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v7 = a5;
  id v9 = (id)objc_opt_new(&OBJC_CLASS___AFLocationFetchRequest);
  [v9 setDesiredAccuracy:a3];
  [v9 setStyle:0];
  [v9 setTimeout:a4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  [v8 currentLocationWithFetchRequest:v9 completion:v7];
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  [v7 currentLocationWithFetchRequest:v6 completion:v5];
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  [v4 currentAuthorizationStyle:v3];
}

- (void)drainLocationServiceRequestsForNewRequestAndClearLocationCache:(BOOL)a3 dismissDialog:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  [v6 drainRequestsWithErrorCode:2 clearLocationCache:v5 dismissDialog:v4];
}

- (void)dismissLocationServiceDialogIfNeeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  [v2 dismissTCCDialogIfNeeded];
}

- (uint64_t)isBobbleAvailable
{
  id v0 = -[ADRequestDispatcherServiceHelper headGestureConfiguration]_0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  id v2 = v1;
  if (v1)
  {
    unsigned int v3 = [v1 isSupported];
    unsigned int v4 = [v2 isEnabled];
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      id v10 = "ADIsBobbleAvailable";
      __int16 v11 = 1024;
      unsigned int v12 = v3;
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s isBobbleSupported: %d, isBobbleEnabled: %d",  (uint8_t *)&v9,  0x18u);
    }

    uint64_t v6 = v3 & v4;
  }

  else
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "ADIsBobbleAvailable";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Failed to extract headGestureConfiguration from deviceInfo",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)headGestureConfiguration
{
  *(void *)&v22.mSelector = *(void *)" diubolg";
  v22.mElement = 0;
  UInt32 v21 = 8;
  v20 = 0LL;
  *(void *)&inAddress.mSelector = *(void *)"tuOdbolg";
  inAddress.mElement = 0;
  UInt32 ioDataSize = 4;
  AudioObjectID outData = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0LL, &ioDataSize, &outData);
  if (PropertyData)
  {
    OSStatus v1 = PropertyData;
    id v2 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "ADGetCurrentAudioDeviceID";
      __int16 v28 = 1024;
      *(_DWORD *)v29 = v1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Error=%d in getting default output device",  buf,  0x12u);
    }
  }

  AudioObjectID v3 = outData;
  OSStatus v4 = AudioObjectGetPropertyData(outData, &v22, 0, 0LL, &v21, &v20);
  if (!v4)
  {
    id v8 = v20;
    int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "ADGetCurrentlyRoutedBluetoothAddress";
      __int16 v28 = 2112;
      *(void *)v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Current output route's UID: %@", buf, 0x16u);
    }

    if ([v8 length])
    {
      if ((unint64_t)[v8 length] > 0x10)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", 0, 17));
        v19 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "ADGetCurrentlyRoutedBluetoothAddress";
          __int16 v28 = 2112;
          *(void *)v29 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Current output route's bluetooth address: %@",  buf,  0x16u);
        }

        goto LABEL_16;
      }

      id v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "ADGetCurrentlyRoutedBluetoothAddress";
        __int16 v28 = 2112;
        *(void *)v29 = v8;
        __int16 v11 = "%s Current output routeUID is definitely not a bluetooth route: %@";
        unsigned int v12 = v10;
        uint32_t v13 = 22;
LABEL_23:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      }
    }

    else
    {
      unsigned int v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "ADGetCurrentlyRoutedBluetoothAddress";
        __int16 v11 = "%s Current output routeUID is nil";
        unsigned int v12 = v14;
        uint32_t v13 = 12;
        goto LABEL_23;
      }
    }

    id v7 = 0LL;
LABEL_16:

    goto LABEL_17;
  }

  OSStatus v5 = v4;
  uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "ADGetCurrentlyRoutedBluetoothAddress";
    __int16 v28 = 1024;
    *(_DWORD *)v29 = v5;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Error=%d in copying deviceUID from deviceID=%u",  buf,  0x18u);
  }

  id v7 = 0LL;
LABEL_17:
  char v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 headGestureConfigurationForBTAddress:v7]);

  v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "ADHeadGestureConfiguration";
    __int16 v28 = 2112;
    *(void *)v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s : %@", buf, 0x16u);
  }

  return v16;
}

@end