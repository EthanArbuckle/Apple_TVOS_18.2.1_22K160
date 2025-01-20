@interface CSDAVConference
- (BOOL)_isMuted;
- (BOOL)_isSendingAudio;
- (BOOL)_isSendingAudioData;
- (BOOL)_isSendingVideo;
- (BOOL)capturingLocalVideo;
- (BOOL)hasReceivedFirstRemoteFrame;
- (BOOL)isCaller;
- (BOOL)isMuted;
- (BOOL)isRemoteVideoPaused;
- (BOOL)isSendingAudio;
- (BOOL)isSendingAudioData;
- (BOOL)isSendingVideo;
- (CGSize)remoteVideoPresentationSize;
- (CSDAVConference)init;
- (CSDAVConferenceConfiguration)configuration;
- (CSDAVConferenceDelegate)delegate;
- (CSDAVConferenceProvider)conferenceProvider;
- (NSDate)dateConnected;
- (NSDate)dateEnded;
- (NSDate)dateStartedConnecting;
- (NSDictionary)localInviteDictionary;
- (NSDictionary)remoteInviteDictionary;
- (NSError)endedError;
- (NSNumber)isSendingVideoExpected;
- (NSString)description;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (double)connectionTimeout;
- (id)_isSendingVideoExpected;
- (id)conferenceProviderCreationBlock;
- (int)deviceRole;
- (int)state;
- (int64_t)_endedReasonForDidStopError:(id)a3 error:(id *)a4;
- (int64_t)callID;
- (int64_t)endedReason;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (unsigned)remoteVideoPresentationState;
- (void)_performDelegateCallback:(id)a3;
- (void)_sendDelegateBytesOfDataUsageChanged:(int64_t)a3;
- (void)_sendDelegateConnectionClosed;
- (void)_sendDelegateEndedWithReason:(int64_t)a3 error:(id)a4;
- (void)_sendDelegateFinishedPreparing;
- (void)_sendDelegateInputFrequencyLevelChanged:(id)a3;
- (void)_sendDelegateInputLevelChanged:(float)a3;
- (void)_sendDelegateMutedChanged;
- (void)_sendDelegateOutputFrequencyLevelChanged:(id)a3;
- (void)_sendDelegateOutputLevelChanged:(float)a3;
- (void)_sendDelegateReceivedData:(id)a3 forCallID:(int64_t)a4;
- (void)_sendDelegateReceivedFirstRemoteFrame;
- (void)_sendDelegateRemoteMediaStalled:(BOOL)a3;
- (void)_sendDelegateRemoteVideoPaused;
- (void)_sendDelegateSendingAudioChanged;
- (void)_sendDelegateStarted;
- (void)_setEndedWithReason:(int64_t)a3 error:(id)a4;
- (void)_setUpDidStartTimeout;
- (void)_stop;
- (void)cancel;
- (void)conferenceProvider:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5;
- (void)conferenceProvider:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5;
- (void)conferenceProvider:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conferenceProvider:(id)a3 didStartSession:(BOOL)a4 error:(id)a5;
- (void)conferenceProvider:(id)a3 didStopWithError:(id)a4 callMetadata:(id)a5;
- (void)conferenceProvider:(id)a3 remoteMediaStalled:(BOOL)a4;
- (void)conferenceProvider:(id)a3 remoteVideoPaused:(BOOL)a4;
- (void)conferenceProvider:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)conferenceProvider:(id)a3 updateInputLevel:(float)a4;
- (void)conferenceProvider:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)conferenceProvider:(id)a3 updateOutputLevel:(float)a4;
- (void)conferenceProviderReceivedFirstRemoteFrame:(id)a3;
- (void)connectionClosedForConferenceProvider:(id)a3;
- (void)dealloc;
- (void)prepareWithConfiguration:(id)a3;
- (void)sendData:(id)a3;
- (void)serverDiedForConferenceProvider:(id)a3;
- (void)setCaller:(BOOL)a3;
- (void)setCapturingLocalVideo:(BOOL)a3;
- (void)setConferenceProvider:(id)a3;
- (void)setConferenceProviderCreationBlock:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setDateConnected:(id)a3;
- (void)setDateEnded:(id)a3;
- (void)setDateStartedConnecting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDeviceRole:(int)a3;
- (void)setEndedError:(id)a3;
- (void)setEndedReason:(int64_t)a3;
- (void)setHasReceivedFirstRemoteFrame:(BOOL)a3;
- (void)setLocalInviteDictionary:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteIDSDestinationURI:(id)a3 crossDeviceIdentifier:(id)a4;
- (void)setRemoteInviteDictionary:(id)a3;
- (void)setRemoteVideoPaused:(BOOL)a3;
- (void)setRemoteVideoPresentationSize:(CGSize)a3;
- (void)setRemoteVideoPresentationState:(unsigned int)a3;
- (void)setSendingAudio:(BOOL)a3;
- (void)setSendingAudioData:(BOOL)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setSendingVideoExpected:(id)a3;
- (void)setState:(int)a3;
- (void)startConnectionWithTransport:(id)a3;
- (void)startedCapturingLocalVideo:(id)a3;
- (void)stop;
- (void)stoppedCapturingLocalVideo:(id)a3;
- (void)updateCapabilities:(id)a3;
@end

@implementation CSDAVConference

- (CSDAVConference)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDAVConference;
  v2 = -[CSDAVConference init](&v12, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesdaemon.csdavconference", 0LL);
    v4 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 queue]);
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    *((void *)v2 + 5) = 0x403E000000000000LL;
    *(void *)(v2 + 12) = 1LL;
    *(NSSize *)(v2 + 136) = NSZeroSize;
    v8 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = &stru_1003D77D8;

    if (TUAllowLocalVideoRecording())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 addObserver:v2 selector:"startedCapturingLocalVideo:" name:@"CSDMomentsControllerStartedLocalVideoCaptureNotification" object:0];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v10 addObserver:v2 selector:"stoppedCapturingLocalVideo:" name:@"CSDMomentsControllerStoppedLocalVideoCaptureNotification" object:0];
    }
  }

  return (CSDAVConference *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDAVConference;
  -[CSDAVConference dealloc](&v3, "dealloc");
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  uint64_t state = self->_state;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p state=%d conference=%@>",  v3,  self,  state,  v5));

  return (NSString *)v6;
}

- (void)prepareWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000BAC8;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)startConnectionWithTransport:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference configuration](self, "configuration"));
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "transport: %@ self.configuration: %@",  buf,  0x16u);
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000C174;
  v10[3] = &unk_1003D7758;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)stop
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C564;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_stop
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  int state = self->_state;
  if (state > 3)
  {
    if (state <= 5)
    {
      if (TUAllowLocalVideoRecording(-[CSDAVConference setState:](self, "setState:", 6LL))
        && -[CSDAVConference capturingLocalVideo](self, "capturingLocalVideo"))
      {
        id v5 = sub_1001704C4();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delaying stop on conference...", buf, 2u);
        }

        dispatch_time_t v7 = dispatch_time(0LL, 1000000000LL);
        id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000C770;
        block[3] = &unk_1003D7730;
        block[4] = self;
        dispatch_after(v7, v8, block);
      }

      else
      {
        id v9 = sub_1001704C4();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
          *(_DWORD *)buf = 138412290;
          v15 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Calling stop on conference %@",  buf,  0xCu);
        }

        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
        [v12 stop];
      }
    }
  }

  else
  {
    -[CSDAVConference _setEndedWithReason:error:](self, "_setEndedWithReason:error:", 0LL, 0LL);
  }

- (void)cancel
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C8BC;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CA94;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setRemoteIDSDestinationURI:(id)a3 crossDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CB90;
  block[3] = &unk_1003D7828;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_setEndedWithReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  -[CSDAVConference setConferenceProvider:](self, "setConferenceProvider:", 0LL);
  -[CSDAVConference setState:](self, "setState:", 7LL);
  -[CSDAVConference setEndedReason:](self, "setEndedReason:", a3);
  -[CSDAVConference setEndedError:](self, "setEndedError:", v6);

  -[CSDAVConference _sendDelegateEndedWithReason:error:]( self,  "_sendDelegateEndedWithReason:error:",  self->_endedReason,  self->_endedError);
}

- (int64_t)inputAudioPowerSpectrumToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
  id v3 = [v2 inputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
  id v3 = [v2 outputAudioPowerSpectrumToken];

  return (int64_t)v3;
}

- (NSDictionary)localInviteDictionary
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10000CD84;
  id v11 = sub_10000CD94;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CD9C;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)remoteInviteDictionary
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10000CD84;
  id v11 = sub_10000CD94;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CE90;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setRemoteInviteDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CF7C;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)callID
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D130;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isCaller
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000D234;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setCaller:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D2F8;
  v6[3] = &unk_1003D7878;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (NSDate)dateConnected
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10000CD84;
  id v11 = sub_10000CD94;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D4C8;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)setDateConnected:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  dateConnected = self->_dateConnected;
  p_dateConnected = &self->_dateConnected;
  if (dateConnected != v8) {
    objc_storeStrong((id *)p_dateConnected, a3);
  }
}

- (NSDate)dateEnded
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10000CD84;
  id v11 = sub_10000CD94;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D62C;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)setDateEnded:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  dateEnded = self->_dateEnded;
  p_dateEnded = &self->_dateEnded;
  if (dateEnded != v8) {
    objc_storeStrong((id *)p_dateEnded, a3);
  }
}

- (NSDate)dateStartedConnecting
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10000CD84;
  id v11 = sub_10000CD94;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D790;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)setDateStartedConnecting:(id)a3
{
  uint64_t v8 = (NSDate *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  dateStartedConnecting = self->_dateStartedConnecting;
  p_dateStartedConnecting = &self->_dateStartedConnecting;
  if (dateStartedConnecting != v8) {
    objc_storeStrong((id *)p_dateStartedConnecting, a3);
  }
}

- (int)state
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 1;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000D8D4;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (void)setState:(int)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  p_int state = &self->_state;
  if (self->_state >= a3)
  {
    id v7 = sub_1001704C4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002B1A68(p_state, a3, v8);
    }
  }

  else
  {
    *p_int state = a3;
    switch(a3)
    {
      case 7:
        id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[CSDAVConference setDateEnded:](self, "setDateEnded:", v9);
        goto LABEL_12;
      case 5:
        id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[CSDAVConference setDateConnected:](self, "setDateConnected:", v9);
        goto LABEL_12;
      case 4:
        id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[CSDAVConference setDateStartedConnecting:](self, "setDateStartedConnecting:", v9);
LABEL_12:

        break;
    }
  }

- (int64_t)endedReason
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000DAC4;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isMuted
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000DB94;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isMuted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
  unsigned __int8 v3 = [v2 isMicrophoneMuted];

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000DC74;
  v6[3] = &unk_1003D7878;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)isSendingAudio
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000DE38;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSendingAudio
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));

  if (v3)
  {
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
    unsigned int v5 = [v4 isAudioPaused] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)setSendingAudio:(BOOL)a3
{
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000DF3C;
  v6[3] = &unk_1003D7878;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)isSendingAudioData
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E0FC;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSendingAudioData
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));

  if (!v3) {
    return 0;
  }
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
  unsigned __int8 v5 = [v4 isSendingAudio];

  return v5;
}

- (void)setSendingAudioData:(BOOL)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000E200;
  v6[3] = &unk_1003D7878;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (BOOL)hasReceivedFirstRemoteFrame
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E3B8;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isSendingVideo
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E488;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_isSendingVideo
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference _isSendingVideoExpected](self, "_isSendingVideoExpected"));
    uint64_t v6 = v5;
    if (v5)
    {
      LOBYTE(v7) = [v5 BOOLValue];
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference conferenceProvider](self, "conferenceProvider"));
      unsigned int v7 = [v8 isVideoPaused] ^ 1;
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)setSendingVideo:(BOOL)a3
{
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000E5D4;
  v6[3] = &unk_1003D7878;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (NSNumber)isSendingVideoExpected
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10000CD84;
  id v11 = sub_10000CD94;
  id v12 = 0LL;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000E97C;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (id)_isSendingVideoExpected
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_sendingVideoExpected;
}

- (void)setSendingVideoExpected:(id)a3
{
  id v8 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  sendingVideoExpected = self->_sendingVideoExpected;
  p_sendingVideoExpected = &self->_sendingVideoExpected;
  if ((TUObjectsAreEqualOrNil(sendingVideoExpected, v8) & 1) == 0) {
    objc_storeStrong((id *)p_sendingVideoExpected, a3);
  }
}

- (void)updateCapabilities:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000EAF0;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)isRemoteVideoPaused
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000ECD8;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (CGSize)remoteVideoPresentationSize
{
  uint64_t v9 = 0LL;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000LL;
  id v12 = "";
  NSSize v13 = NSZeroSize;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000EDCC;
  v8[3] = &unk_1003D7850;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EE60;
  block[3] = &unk_1003D78A0;
  block[4] = self;
  *(CGFloat *)&void block[5] = width;
  *(CGFloat *)&block[6] = height;
  dispatch_async(v6, block);
}

- (unsigned)remoteVideoPresentationState
{
  v2 = self;
  uint64_t v6 = 0LL;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F064;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)setRemoteVideoPresentationState:(unsigned int)a3
{
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F0F4;
  v6[3] = &unk_1003D78C8;
  v6[4] = self;
  unsigned int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_setUpDidStartTimeout
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(v3 * 1000000000.0));
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F2A4;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

- (int)deviceRole
{
  v2 = self;
  uint64_t v6 = 0LL;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F3DC;
  v5[3] = &unk_1003D7850;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

- (void)setDeviceRole:(int)a3
{
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000F4B0;
  v6[3] = &unk_1003D78C8;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)startedCapturingLocalVideo:(id)a3
{
  if (TUAllowLocalVideoRecording(self))
  {
    dispatch_time_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F6BC;
    block[3] = &unk_1003D7730;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)stoppedCapturingLocalVideo:(id)a3
{
  if (TUAllowLocalVideoRecording(self))
  {
    dispatch_time_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F740;
    block[3] = &unk_1003D7730;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  dispatch_time_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSDAVConference delegate](self, "delegate"));
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAVConference delegateQueue](self, "delegateQueue"));

    if (v7)
    {
      uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference delegateQueue](self, "delegateQueue"));
      dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v8, v9);
    }
  }
}

- (void)_sendDelegateFinishedPreparing
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F850;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateStarted
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F8F4;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateEndedWithReason:(int64_t)a3 error:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F9C8;
  v7[3] = &unk_1003D78F0;
  id v8 = a4;
  int64_t v9 = a3;
  v7[4] = self;
  id v6 = v8;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v7);
}

- (void)_sendDelegateConnectionClosed
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000FA70;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateMutedChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000FB14;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateSendingAudioChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000FBB8;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateReceivedFirstRemoteFrame
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000FC5C;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateRemoteVideoPaused
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000FD00;
  v2[3] = &unk_1003D7730;
  v2[4] = self;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v2);
}

- (void)_sendDelegateRemoteMediaStalled:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000FDA8;
  v3[3] = &unk_1003D7878;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v3);
}

- (void)_sendDelegateInputFrequencyLevelChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000FE78;
  v4[3] = &unk_1003D7758;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CSDAVConference _performDelegateCallback:](v5, "_performDelegateCallback:", v4);
}

- (void)_sendDelegateOutputFrequencyLevelChanged:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000FF44;
  v4[3] = &unk_1003D7758;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CSDAVConference _performDelegateCallback:](v5, "_performDelegateCallback:", v4);
}

- (void)_sendDelegateInputLevelChanged:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000FFEC;
  v3[3] = &unk_1003D78C8;
  v3[4] = self;
  float v4 = a3;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v3);
}

- (void)_sendDelegateOutputLevelChanged:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010098;
  v3[3] = &unk_1003D78C8;
  v3[4] = self;
  float v4 = a3;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v3);
}

- (void)_sendDelegateBytesOfDataUsageChanged:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010140;
  v3[3] = &unk_1003D7708;
  v3[4] = self;
  void v3[5] = a3;
  -[CSDAVConference _performDelegateCallback:](self, "_performDelegateCallback:", v3);
}

- (void)_sendDelegateReceivedData:(id)a3 forCallID:(int64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010214;
  v6[3] = &unk_1003D78F0;
  int v7 = self;
  id v8 = a3;
  int64_t v9 = a4;
  id v5 = v8;
  -[CSDAVConference _performDelegateCallback:](v7, "_performDelegateCallback:", v6);
}

- (int64_t)_endedReasonForDidStopError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    int64_t v9 = 0LL;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  id v7 = [v5 code];
  uint64_t v8 = 1LL;
  if (v7 == (id)32005) {
    uint64_t v8 = 7LL;
  }
  if (v7 == (id)32003) {
    int64_t v9 = 2LL;
  }
  else {
    int64_t v9 = v8;
  }
  if (v7 == (id)32003) {
    id v5 = 0LL;
  }
  else {
    id v5 = v6;
  }
  if (a4) {
LABEL_11:
  }
    *a4 = v5;
LABEL_12:

  return v9;
}

- (void)conferenceProvider:(id)a3 didStartSession:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001038C;
  block[3] = &unk_1003D7918;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)conferenceProvider:(id)a3 didStopWithError:(id)a4 callMetadata:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010690;
  block[3] = &unk_1003D7828;
  id v13 = v7;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)connectionClosedForConferenceProvider:(id)a3
{
  float v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000108EC;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)conferenceProvider:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000109F8;
  v8[3] = &unk_1003D7758;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)conferenceProvider:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100010AA0;
  v8[3] = &unk_1003D7758;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)conferenceProvider:(id)a3 updateInputLevel:(float)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010B28;
  v7[3] = &unk_1003D78C8;
  v7[4] = self;
  float v8 = a4;
  dispatch_async(v6, v7);
}

- (void)conferenceProvider:(id)a3 updateOutputLevel:(float)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010BB4;
  v7[3] = &unk_1003D78C8;
  v7[4] = self;
  float v8 = a4;
  dispatch_async(v6, v7);
}

- (void)conferenceProvider:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  float v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010C64;
  block[3] = &unk_1003D7918;
  BOOL v13 = a4;
  id v11 = v7;
  BOOL v12 = self;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)conferenceProvider:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  float v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010DC0;
  block[3] = &unk_1003D7918;
  BOOL v13 = a4;
  id v11 = v7;
  BOOL v12 = self;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)conferenceProviderReceivedFirstRemoteFrame:(id)a3
{
  float v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011018;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)conferenceProvider:(id)a3 remoteVideoPaused:(BOOL)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100011110;
  v7[3] = &unk_1003D7878;
  BOOL v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)conferenceProvider:(id)a3 remoteMediaStalled:(BOOL)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100011244;
  v7[3] = &unk_1003D7878;
  BOOL v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)serverDiedForConferenceProvider:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001138C;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)conferenceProvider:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = objc_msgSend(a4, "copy", a3);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAVConference queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011488;
  block[3] = &unk_1003D78F0;
  void block[4] = self;
  id v11 = v7;
  int64_t v12 = a5;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (CSDAVConferenceDelegate)delegate
{
  return (CSDAVConferenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setLocalInviteDictionary:(id)a3
{
}

- (void)setEndedReason:(int64_t)a3
{
  self->_endedReason = a3;
}

- (NSError)endedError
{
  return self->_endedError;
}

- (void)setEndedError:(id)a3
{
}

- (void)setHasReceivedFirstRemoteFrame:(BOOL)a3
{
  self->_hasReceivedFirstRemoteFrame = a3;
}

- (void)setRemoteVideoPaused:(BOOL)a3
{
  self->_remoteVideoPaused = a3;
}

- (BOOL)capturingLocalVideo
{
  return self->_capturingLocalVideo;
}

- (void)setCapturingLocalVideo:(BOOL)a3
{
  self->_capturingLocalVideo = a3;
}

- (CSDAVConferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CSDAVConferenceProvider)conferenceProvider
{
  return self->_conferenceProvider;
}

- (void)setConferenceProvider:(id)a3
{
}

- (id)conferenceProviderCreationBlock
{
  return self->_conferenceProviderCreationBlock;
}

- (void)setConferenceProviderCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end