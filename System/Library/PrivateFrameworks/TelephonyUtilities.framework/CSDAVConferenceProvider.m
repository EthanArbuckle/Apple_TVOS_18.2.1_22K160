@interface CSDAVConferenceProvider
- (AVConference)conference;
- (BOOL)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4;
- (BOOL)isAudioPaused;
- (BOOL)isInputFrequencyMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputFrequencyMeteringEnabled;
- (BOOL)isSendingAudio;
- (BOOL)isVideoPaused;
- (BOOL)startConnectionAsCaller:(BOOL)a3 capabilities:(id)a4 socket:(int)a5 error:(id *)a6;
- (BOOL)startConnectionAsCaller:(BOOL)a3 remoteInviteDictionary:(id)a4 capabilities:(id)a5 destination:(id)a6 error:(id *)a7;
- (CSDAVConferenceProvider)initWithClientUUID:(id)a3 serialQueue:(id)a4;
- (CSDAVConferenceProviderDelegate)delegate;
- (TUVideoDeviceController)videoDeviceController;
- (int64_t)callID;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (void)cancel;
- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 closeConnectionForCallID:(int64_t)a4;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6;
- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5;
- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4;
- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5;
- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5;
- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 updateInputMeterLevel:(float)a4;
- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)conference:(id)a3 updateOutputMeterLevel:(float)a4;
- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseVideo:(BOOL)a5 error:(id)a6;
- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5;
- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5;
- (void)dealloc;
- (void)inviteDictionaryForCallID:(int64_t)a3 remoteInviteDictionary:(id)a4 nonCellularCandidateTimeout:(double)a5 block:(id)a6 queue:(id)a7;
- (void)sendData:(id)a3;
- (void)serverDiedForConference:(id)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setCallID:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setPeerReportingIdentifier:(id)a3 sessionIdentifier:(id)a4;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(unsigned int)a3;
- (void)setSendingAudio:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)stop;
- (void)updateCapabilities:(id)a3;
@end

@implementation CSDAVConferenceProvider

- (CSDAVConferenceProvider)initWithClientUUID:(id)a3 serialQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSDAVConferenceProvider;
  v8 = -[CSDAVConferenceProvider init](&v18, "init");
  if (v8)
  {
    id v9 = sub_1001704C4();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Initializing AVConference with client UUID %@",  buf,  0xCu);
    }

    v12 = -[AVConference initWithClientUUID:transportType:]( objc_alloc(&OBJC_CLASS___AVConference),  "initWithClientUUID:transportType:",  v6,  1LL);
    conference = v8->_conference;
    v8->_conference = v12;

    v14 = v8->_conference;
    if (v14)
    {
      -[AVConference setDelegate:](v14, "setDelegate:", v8);
      v15 = -[TUVideoDeviceController initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___TUVideoDeviceController),  "initWithSerialQueue:",  v7);
      videoDeviceController = v8->_videoDeviceController;
      v8->_videoDeviceController = v15;

      -[TUVideoDeviceController setIgnoreStartPreview:](v8->_videoDeviceController, "setIgnoreStartPreview:", 1LL);
    }

    else
    {

      v8 = 0LL;
    }
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDAVConferenceProvider;
  -[CSDAVConferenceProvider dealloc](&v4, "dealloc");
}

- (BOOL)isInputFrequencyMeteringEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  unsigned __int8 v3 = [v2 isInputFrequencyMeteringEnabled];

  return v3;
}

- (void)setInputFrequencyMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  [v4 setInputFrequencyMeteringEnabled:v3];
}

- (BOOL)isOutputFrequencyMeteringEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  unsigned __int8 v3 = [v2 isOutputFrequencyMeteringEnabled];

  return v3;
}

- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  [v4 setOutputFrequencyMeteringEnabled:v3];
}

- (int64_t)inputAudioPowerSpectrumToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v3 = [v2 inputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v3 = [v2 outputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (BOOL)isMicrophoneMuted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  unsigned __int8 v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  [v4 setMicrophoneMuted:v3];
}

- (BOOL)isSendingAudio
{
  char v11 = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v10 = 0LL;
  unsigned int v4 = objc_msgSend( v3,  "getIsSendingAudio:callID:error:",  &v11,  -[CSDAVConferenceProvider callID](self, "callID"),  &v10);
  id v5 = v10;

  if (v4)
  {
    BOOL v6 = v11 != 0;
  }

  else
  {
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error calling getIsSendingAudio: %@",  buf,  0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)setSendingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v9 = 0LL;
  LOBYTE(v4) = objc_msgSend( v5,  "setSendingAudio:callID:error:",  v3,  -[CSDAVConferenceProvider callID](v4, "callID"),  &v9);
  id v6 = v9;

  if ((v4 & 1) == 0)
  {
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error calling setSendingAudio: %@",  buf,  0xCu);
    }
  }
}

- (BOOL)isAudioPaused
{
  char v11 = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v10 = 0LL;
  unsigned int v4 = objc_msgSend( v3,  "getIsAudioPaused:callID:error:",  &v11,  -[CSDAVConferenceProvider callID](self, "callID"),  &v10);
  id v5 = v10;

  if (v4)
  {
    BOOL v6 = v11 != 0;
  }

  else
  {
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error calling getIsAudioPaused: %@",  buf,  0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
    *(_DWORD *)buf = 67109378;
    LODWORD(v15[0]) = v3;
    WORD2(v15[0]) = 2112;
    *(void *)((char *)v15 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting pause audio to %d for %@", buf, 0x12u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v13 = 0LL;
  unsigned __int8 v9 = objc_msgSend( v8,  "setPauseAudio:callID:error:",  v3,  -[CSDAVConferenceProvider callID](self, "callID"),  &v13);
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_1001704C4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15[0] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error calling setPauseAudio: %@",  buf,  0xCu);
    }
  }
}

- (BOOL)isVideoPaused
{
  char v11 = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v10 = 0LL;
  unsigned int v4 = objc_msgSend( v3,  "getIsVideoPaused:callID:error:",  &v11,  -[CSDAVConferenceProvider callID](self, "callID"),  &v10);
  id v5 = v10;

  if (v4)
  {
    BOOL v6 = v11 != 0;
  }

  else
  {
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error calling getIsVideoPaused: %@",  buf,  0xCu);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
    *(_DWORD *)buf = 67109378;
    LODWORD(v15[0]) = v3;
    WORD2(v15[0]) = 2112;
    *(void *)((char *)v15 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting pause video to %d for %@", buf, 0x12u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v13 = 0LL;
  unsigned __int8 v9 = objc_msgSend( v8,  "setPauseVideo:callID:error:",  v3,  -[CSDAVConferenceProvider callID](self, "callID"),  &v13);
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_1001704C4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15[0] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Error calling setPauseVideo: %@",  buf,  0xCu);
    }
  }
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16.double width = width;
    v16.double height = height;
    v8 = NSStringFromSize(v16);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting conference visual rectangle of size %@ for %@",  (uint8_t *)&v12,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend( v11,  "setConferenceVisualRectangle:forCallID:",  -[CSDAVConferenceProvider callID](self, "callID"),  0.0,  0.0,  width,  height);
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting conference state %@ for %@",  (uint8_t *)&v10,  0x16u);
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend(v9, "setConferenceState:forCallID:", v3, -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3 localLandscapeAspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  id v9 = sub_1001704C4();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v23.double width = v7;
    v23.double height = v6;
    id v11 = NSStringFromSize(v23);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v24.double width = width;
    v24.double height = height;
    id v13 = NSStringFromSize(v24);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
    int v17 = 138412802;
    objc_super v18 = v12;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting local portrait aspect ratio %@ and local landscape aspect ratio %@ for %@",  (uint8_t *)&v17,  0x20u);
  }

  NSSize v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider videoDeviceController](self, "videoDeviceController"));
  objc_msgSend(v16, "setLocalPortraitAspectRatio:localLandscapeAspectRatio:", v7, v6, width, height);
}

- (void)setPeerReportingIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
    int v12 = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    int v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Setting peer reporting identifer %@ and session identifier %@ for %@",  (uint8_t *)&v12,  0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend( v11,  "setPeerReportingIdentifier:sessionIdentifier:forCallID:",  v6,  v7,  -[CSDAVConferenceProvider callID](self, "callID"));
}

- (BOOL)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  id v8 = [v7 initializeNewCallWithDeviceRole:v4 reportingHierarchyToken:v6];

  -[CSDAVConferenceProvider setCallID:](self, "setCallID:", v8);
  uint64_t v9 = -[CSDAVConferenceProvider callID](self, "callID");
  if (v9 <= 0)
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002BA80C(self, v4, v11);
    }
  }

  return v9 > 0;
}

- (BOOL)startConnectionAsCaller:(BOOL)a3 remoteInviteDictionary:(id)a4 capabilities:(id)a5 destination:(id)a6 error:(id *)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = sub_1001704C4();
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67110146;
    v20[1] = v10;
    __int16 v21 = 2048;
    int64_t v22 = -[CSDAVConferenceProvider callID](self, "callID");
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Starting AVConference connection with isCaller=%d callID=%ld remoteInviteDictionary=%@ capabilities=%@ destination=%@",  (uint8_t *)v20,  0x30u);
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  unsigned __int8 v18 = objc_msgSend( v17,  "startConnectionWithCallID:inviteData:isCaller:capabilities:destination:error:",  -[CSDAVConferenceProvider callID](self, "callID"),  v12,  v10,  v13,  v14,  a7);

  return v18;
}

- (BOOL)startConnectionAsCaller:(BOOL)a3 capabilities:(id)a4 socket:(int)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v18 = v8;
    __int16 v19 = 2048;
    int64_t v20 = -[CSDAVConferenceProvider callID](self, "callID");
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 1024;
    int v24 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Starting AVConference connection with isCaller=%d callID=%ld capabilities=%@ socket=%d",  buf,  0x22u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  LODWORD(v16) = a5;
  unsigned __int8 v14 = objc_msgSend( v13,  "startConnectionWithCallID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest :capabilities:idsSocket:error:",  -[CSDAVConferenceProvider callID](self, "callID"),  0,  v8,  0,  0,  v10,  v16,  a6);

  return v14;
}

- (void)inviteDictionaryForCallID:(int64_t)a3 remoteInviteDictionary:(id)a4 nonCellularCandidateTimeout:(double)a5 block:(id)a6 queue:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  [v15 inviteDictionaryForCallID:a3 remoteInviteDictionary:v14 nonCellularCandidateTimeout:v13 block:v12 queue:a5];
}

- (void)stop
{
  id v3 = sub_1001704C4();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = -[CSDAVConferenceProvider callID](self, "callID");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Stopping AVConference with callID=%ld",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend(v5, "stopCallID:", -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)cancel
{
  id v3 = sub_1001704C4();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = -[CSDAVConferenceProvider callID](self, "callID");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Canceling AVConference with callID=%ld",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend(v5, "cancelCallID:", -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)updateCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend(v5, "updateCapabilities:forCallID:", v4, -[CSDAVConferenceProvider callID](self, "callID"));
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider conference](self, "conference"));
  objc_msgSend(v5, "sendData:forCallID:encrypted:", v4, -[CSDAVConferenceProvider callID](self, "callID"), 0);
}

- (void)conference:(id)a3 didStartSession:(BOOL)a4 withUserInfo:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "conference=%@ didStartSession=%d userInfo=%@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKSDidStartParameter_Error]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v11 conferenceProvider:self didStartSession:v5 error:v10];
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    int64_t v12 = a4;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "callID=%ld error=%@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v10 conferenceProvider:self didStopWithError:v7 callMetadata:0];
}

- (void)conference:(id)a3 didStopWithCallID:(int64_t)a4 error:(id)a5 callMetadata:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = sub_1001704C4();
  int64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218498;
    int64_t v15 = a4;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "callID=%ld error=%@ callMetadata=%@",  (uint8_t *)&v14,  0x20u);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v13 conferenceProvider:self didStopWithError:v9 callMetadata:v10];
}

- (void)conference:(id)a3 closeConnectionForCallID:(int64_t)a4
{
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "callID=%ld", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v8 connectionClosedForConferenceProvider:self];
}

- (void)conference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v6 conferenceProvider:self updateInputFrequencyLevel:v5];
}

- (void)conference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v6 conferenceProvider:self updateOutputFrequencyLevel:v5];
}

- (void)conference:(id)a3 updateInputMeterLevel:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate", a3));
  *(float *)&double v6 = a4;
  [v7 conferenceProvider:self updateInputLevel:v6];
}

- (void)conference:(id)a3 updateOutputMeterLevel:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate", a3));
  *(float *)&double v6 = a4;
  [v7 conferenceProvider:self updateOutputLevel:v6];
}

- (void)conference:(id)a3 receivedFirstRemoteFrameForCallID:(int64_t)a4
{
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "callID=%ld", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v8 conferenceProviderReceivedFirstRemoteFrame:self];
}

- (void)conference:(id)a3 remoteScreenAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "screenAttributes=%@ callID=%ld",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)conference:(id)a3 remoteVideoAttributesChanged:(id)a4 callID:(int64_t)a5
{
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "videoAttributes=%@ callID=%ld",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseAudio:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = sub_1001704C4();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    int64_t v14 = a4;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "callID=%ld didPauseAudio=%d error=%@",  (uint8_t *)&v13,  0x1Cu);
  }

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v12 conferenceProvider:self didPauseAudio:v6 error:v9];
}

- (void)conference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v6;
    __int16 v10 = 2048;
    int64_t v11 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didPause=%d callID=%ld", (uint8_t *)v9, 0x12u);
  }
}

- (void)conference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v6;
    __int16 v12 = 2048;
    int64_t v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "didPause=%d callID=%ld", (uint8_t *)v11, 0x12u);
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v10 conferenceProvider:self remoteVideoPaused:v6];
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 didPauseVideo:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = sub_1001704C4();
  int64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218498;
    int64_t v14 = a4;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "callID=%ld didPauseVideo=%d error=%@",  (uint8_t *)&v13,  0x1Cu);
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v12 conferenceProvider:self didPauseVideo:v6 error:v9];
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 remoteMediaStalled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate", a3));
  [v8 conferenceProvider:self remoteMediaStalled:v5];

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    int64_t v12 = a4;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] callID=%ld isStalled=%d",  (uint8_t *)&v11,  0x12u);
  }
}

- (void)serverDiedForConference:(id)a3
{
  id v4 = sub_1001704C4();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1002BA8A4(v5);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v6 serverDiedForConferenceProvider:self];
}

- (void)conference:(id)a3 inititiateRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v6 = a5;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int64_t v10 = a4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "callID=%ld parameters=%@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)conference:(id)a3 sendRelayUpdate:(int64_t)a4 updateDict:(id)a5
{
  id v6 = a5;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int64_t v10 = a4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "callID=%ld parameters=%@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)conference:(id)a3 cancelRelayRequest:(int64_t)a4 requestDict:(id)a5
{
  id v6 = a5;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    int64_t v10 = a4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "callID=%ld parameters=%@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)conference:(id)a3 videoQualityNotificationForCallID:(int64_t)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = sub_1001704C4();
  int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int64_t v12 = a4;
    __int16 v13 = 1024;
    BOOL v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "callID=%ld isDegraded=%d isRemoteVideo=%d",  (uint8_t *)&v11,  0x18u);
  }
}

- (void)conference:(id)a3 withCallID:(int64_t)a4 networkHint:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218240;
    int64_t v10 = a4;
    __int16 v11 = 1024;
    BOOL v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] callID=%ld isNetworkBad=%d",  (uint8_t *)&v9,  0x12u);
  }
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = a4;
  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = @"non-nil";
    if (!v7) {
      int64_t v10 = @"nil";
    }
    int v12 = 134218242;
    int64_t v13 = a5;
    __int16 v14 = 2112;
    __int16 v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "callID=%ld didReceiveData=%@",  (uint8_t *)&v12,  0x16u);
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConferenceProvider delegate](self, "delegate"));
  [v11 conferenceProvider:self didReceiveData:v7 forCallID:a5];
}

- (CSDAVConferenceProviderDelegate)delegate
{
  return (CSDAVConferenceProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AVConference)conference
{
  return self->_conference;
}

- (int64_t)callID
{
  return self->_callID;
}

- (void)setCallID:(int64_t)a3
{
  self->_callID = a3;
}

- (TUVideoDeviceController)videoDeviceController
{
  return self->_videoDeviceController;
}

- (void).cxx_destruct
{
}

@end