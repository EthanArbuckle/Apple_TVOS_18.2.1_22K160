@interface ADAudioSessionCoordinator
- (ADAudioSessionCoordinator)initWithInstanceContext:(id)a3 delegate:(id)a4;
- (BOOL)_relinquishRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 error:(id *)a6;
- (BOOL)hasActiveAudioSessionAssertions;
- (id)_acquireRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 error:(id *)a7;
- (id)_deviceWithID:(id)a3;
- (id)_disqualifiedDevices;
- (id)_qualifiedDeviceIDs;
- (id)_qualifiedDevices;
- (id)_qualifiedInRangeDeviceIDs;
- (id)_qualifiedInRangeDevices;
- (id)_qualifiedOutOfRangeDeviceIDs;
- (id)_qualifiedOutOfRangeDevices;
- (id)_queue;
- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4;
- (void)_addDeviceIDToKeepAliveList:(id)a3 reason:(id)a4;
- (void)_beginAudioSessionOnInRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4 expirationDuration:(double)a5;
- (void)_endAudioSessionOnAllRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4;
- (void)_endAudioSessionOnOutOfRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4;
- (void)_enumerateKeepAliveListUsingBlock:(id)a3;
- (void)_handleAcquiredLocalAssertion:(id)a3 isFirst:(BOOL)a4;
- (void)_handleAcquiredRemoteAssertion:(id)a3 isFirst:(BOOL)a4;
- (void)_handleAddedLocalAssertion:(id)a3 isFirst:(BOOL)a4;
- (void)_handleBeginAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_handleDidSetAudioSessionActive:(BOOL)a3;
- (void)_handleEndAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_handleFoundRemoteDevice:(id)a3;
- (void)_handleKeepAudioSessionAliveRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_handleLostRemoteDevice:(id)a3;
- (void)_handleMessage:(id)a3 fromDeviceWithID:(id)a4 replyHandler:(id)a5;
- (void)_handleRelinquishedLocalAssertion:(id)a3 isLast:(BOOL)a4;
- (void)_handleRelinquishedRemoteAssertion:(id)a3 isLast:(BOOL)a4;
- (void)_handleRemovedLocalAssertion:(id)a3 isLast:(BOOL)a4;
- (void)_handleUpdatedCurrentOrUpNextDateIntervalForReason:(id)a3;
- (void)_handleUpdatedLocalAssertionsForReason:(id)a3 pendingAssertions:(id)a4 activeAssertions:(id)a5;
- (void)_handleUpdatedLocalDevice:(id)a3;
- (void)_handleUpdatedLocalSystemInfoForReason:(id)a3;
- (void)_handleUpdatedRemoteDevice:(id)a3;
- (void)_handleWillSetAudioSessionActive:(BOOL)a3;
- (void)_heartBeatFired;
- (void)_invalidate;
- (void)_keepAudioSessionAliveOnRemoteDevicesForReason:(id)a3 expirationDuration:(double)a4;
- (void)_registerRequestID:(id)a3 requestHandler:(id)a4;
- (void)_removeDeviceIDFromKeepAliveList:(id)a3 reason:(id)a4;
- (void)_resetKeepAliveListForReason:(id)a3;
- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3;
- (void)_sendBeginAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_sendEndAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_sendKeepAudioSessionAliveRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5;
- (void)_sendMessage:(id)a3 toDeviceWithID:(id)a4 replyHandler:(id)a5;
- (void)_sendRequestID:(id)a3 request:(id)a4 recipientID:(id)a5 responseHandler:(id)a6;
- (void)_setUpRapportLink;
- (void)_setUpRequestHandlers;
- (void)_startHeartBeatWithEffectiveDate:(id)a3;
- (void)_stopHeartBeat;
- (void)_tearDownRequestHandlers;
- (void)_updateCurrentOrUpNextDateInterval:(id)a3 reason:(id)a4;
- (void)_updateHomeKitMediaSystemIdentifier:(id)a3 reason:(id)a4;
- (void)_updateHomeKitRoomName:(id)a3 reason:(id)a4;
- (void)_updateMediaRemoteGroupIdentifier:(id)a3 reason:(id)a4;
- (void)_updateMediaRemoteRouteIdentifier:(id)a3 reason:(id)a4;
- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didAddAssertion:(id)a4 isFirstAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didRemoveAssertion:(id)a4 isLastAssertion:(BOOL)a5;
- (void)dealloc;
- (void)fetchAndUpdateMediaRemoteGroupIdentifierForReason:(id)a3;
- (void)fetchAndUpdateMediaRemoteRouteIdentifierForReason:(id)a3;
- (void)getSnapshotWithCompletion:(id)a3;
- (void)handleDidSetAudioSessionActive:(BOOL)a3;
- (void)handleWillSetAudioSessionActive:(BOOL)a3;
- (void)invalidate;
- (void)mediaRemoteDeviceInfoGroupIdentifierDidChange:(id)a3;
- (void)mediaRemoteDeviceInfoRouteIdentifierDidChange:(id)a3;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)relinquishLocalAssertions;
@end

@implementation ADAudioSessionCoordinator

- (void)_setUpRequestHandlers
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[ADAudioSessionCoordinator(Messaging) _setUpRequestHandlers]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)location, 0xCu);
  }

  objc_initWeak(location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100267348;
  v4[3] = &unk_1004F85B8;
  objc_copyWeak(&v5, location);
  -[ADAudioSessionCoordinator _registerRequestID:requestHandler:]( self,  "_registerRequestID:requestHandler:",  @"ASC",  v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(location);
}

- (void)_tearDownRequestHandlers
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[ADAudioSessionCoordinator(Messaging) _tearDownRequestHandlers]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADAudioSessionCoordinator _unregisterRequestID:](self, "_unregisterRequestID:", @"ASC");
}

- (void)_handleMessage:(id)a3 fromDeviceWithID:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[ADAudioSessionCoordinator(Messaging) _handleMessage:fromDeviceWithID:replyHandler:]";
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@ ---> %@", buf, 0x20u);
  }

  v12 = objc_alloc(&OBJC_CLASS___AFTwoArgumentSafetyBlock);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100266D90;
  v29[3] = &unk_1004F85E0;
  id v13 = v9;
  id v30 = v13;
  id v14 = v10;
  id v31 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 40LL));
  v16 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:]( v12,  "initWithBlock:defaultValue1:defaultValue2:",  v29,  0LL,  v15);

  id v17 = [v8 type];
  if (v17 == (id)5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 payloadEndAudioSessionRequest]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest);
    if ((objc_opt_isKindOfClass(v18, v21) & 1) != 0)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100267130;
      v23[3] = &unk_1004F8680;
      v24 = v16;
      -[ADAudioSessionCoordinator _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]( self,  "_handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:",  v18,  v13,  v23);
      v20 = v24;
      goto LABEL_14;
    }
  }

  else if (v17 == (id)3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 payloadKeepAudioSessionAliveRequest]);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest);
    if ((objc_opt_isKindOfClass(v18, v22) & 1) != 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100267020;
      v25[3] = &unk_1004F8658;
      v26 = v16;
      -[ADAudioSessionCoordinator _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]( self,  "_handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:",  v18,  v13,  v25);
      v20 = v26;
      goto LABEL_14;
    }
  }

  else
  {
    if (v17 != (id)1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1014LL,  @"Unexpected message type."));
      -[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](v16, "invokeWithValue:andValue:", 0LL, v18);
      goto LABEL_16;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 payloadBeginAudioSessionRequest]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100266F10;
      v27[3] = &unk_1004F8630;
      v28 = v16;
      -[ADAudioSessionCoordinator _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]( self,  "_handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:",  v18,  v13,  v27);
      v20 = v28;
LABEL_14:

      goto LABEL_16;
    }
  }

  if (v14)
  {
    v20 = (AFTwoArgumentSafetyBlock *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1015LL,  @"Unexpected request in message."));
    (*((void (**)(id, void, AFTwoArgumentSafetyBlock *))v14 + 2))(v14, 0LL, v20);
    goto LABEL_14;
  }

- (void)_handleBeginAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }

  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 effectiveDate]);
    [v8 expirationDuration];
    id v19 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:]( self,  "_acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:",  v9,  @"Begin Audio Session",  v12,  &v19));
    id v14 = v19;

    if (v13)
    {
      v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s assertionUUID = %@", buf, 0x16u);
      }
    }

    else
    {
      id v17 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }
    }
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1906LL,  @"Sender ID is nil."));
    v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[ADAudioSessionCoordinator(Messaging) _handleBeginAudioSessionRequest:fromDeviceWithID:responseHandler:]";
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }

  if (v10)
  {
    if (v14)
    {
      v10[2](v10, 0LL, v14);
    }

    else
    {
      v18 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionResponse);
      ((void (**)(id, ADAudioSessionCoordinationMessageBeginAudioSessionResponse *, id))v10)[2]( v10,  v18,  0LL);
    }
  }
}

- (void)_handleKeepAudioSessionAliveRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }

  if (v9)
  {
    [v8 expirationDuration];
    id v18 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:]( self,  "_acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:",  v9,  @"Keep Audio Session Alive",  0LL,  &v18));
    id v13 = v18;
    if (v12)
    {
      id v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s assertionUUID = %@", buf, 0x16u);
      }
    }

    else
    {
      v16 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      }
    }
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1906LL,  @"Sender ID is nil."));
    v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADAudioSessionCoordinator(Messaging) _handleKeepAudioSessionAliveRequest:fromDeviceWithID:responseHandler:]";
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }

  if (v10)
  {
    if (v13)
    {
      v10[2](v10, 0LL, v13);
    }

    else
    {
      id v17 = objc_alloc_init(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse);
      ((void (**)(id, ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *, id))v10)[2]( v10,  v17,  0LL);
    }
  }
}

- (void)_handleEndAudioSessionRequest:(id)a3 fromDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADAudioSessionCoordinator(Messaging) _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }

  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 effectiveDate]);
    id v18 = 0LL;
    unsigned int v13 = -[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]( self,  "_relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:",  v9,  @"End Audio Session",  v12,  &v18);
    id v14 = v18;

    if (!v14)
    {
      v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[ADAudioSessionCoordinator(Messaging) _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]";
        __int16 v21 = 1024;
        LODWORD(v22) = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s success = %d", buf, 0x12u);
      }

      if (!v10) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

    v15 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1907LL,  @"Sender ID is nil."));
    v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADAudioSessionCoordinator(Messaging) _handleEndAudioSessionRequest:fromDeviceWithID:responseHandler:]";
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
      if (!v10) {
        goto LABEL_16;
      }
LABEL_9:
      if (v14)
      {
        v10[2](v10, 0LL, v14);
        goto LABEL_16;
      }

- (void)_sendMessage:(id)a3 toDeviceWithID:(id)a4 replyHandler:(id)a5
{
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator(Messaging) _sendMessage:toDeviceWithID:replyHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v33 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@ <--- %@", buf, 0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v33 = sub_100266A74;
  __int16 v34 = sub_100266A84;
  id v35 = 0LL;
  v12 = objc_alloc(&OBJC_CLASS___AFTwoArgumentSafetyBlock);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100266A8C;
  v28[3] = &unk_1004F86A8;
  id v31 = buf;
  id v13 = v9;
  id v29 = v13;
  id v14 = v10;
  id v30 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 40LL));
  v16 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:]( v12,  "initWithBlock:defaultValue1:defaultValue2:",  v28,  0LL,  v15);

  id v17 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _queue](self, "_queue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100266C30;
  v26[3] = &unk_1004FD940;
  id v19 = v16;
  v27 = v19;
  v20 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v17,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v18,  v26,  4.0);
  __int16 v21 = *(void **)(*(void *)&buf[8] + 40LL);
  *(void *)(*(void *)&buf[8] + 40LL) = v20;

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 buildDictionaryRepresentation]);
  if (v22)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100266C80;
    v24[3] = &unk_1004F86D0;
    id v25 = v19;
    -[ADAudioSessionCoordinator _sendRequestID:request:recipientID:responseHandler:]( self,  "_sendRequestID:request:recipientID:responseHandler:",  @"ASC",  v22,  v13,  v24);
    __int16 v23 = v25;
  }

  else
  {
    __int16 v23 = (AFTwoArgumentSafetyBlock *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  30LL,  @"Unable to create request dictionary from message."));
    -[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](v19, "invokeWithValue:andValue:", 0LL, v23);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_sendBeginAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADAudioSessionCoordinator(Messaging) _sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002668E0;
    v17[3] = &unk_1004F8608;
    id v18 = v8;
    id v13 = +[ADAudioSessionCoordinationMessage newWithBuilder:]( &OBJC_CLASS___ADAudioSessionCoordinationMessage,  "newWithBuilder:",  v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100266938;
    v15[3] = &unk_1004F8590;
    id v16 = v10;
    -[ADAudioSessionCoordinator _sendMessage:toDeviceWithID:replyHandler:]( self,  "_sendMessage:toDeviceWithID:replyHandler:",  v13,  v9,  v15);

    id v14 = v18;
LABEL_7:

    goto LABEL_8;
  }

  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1015LL,  @"Unexpected request for message."));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
    goto LABEL_7;
  }

- (void)_sendKeepAudioSessionAliveRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADAudioSessionCoordinator(Messaging) _sendKeepAudioSessionAliveRequest:toDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10026674C;
    v17[3] = &unk_1004F8608;
    id v18 = v8;
    id v13 = +[ADAudioSessionCoordinationMessage newWithBuilder:]( &OBJC_CLASS___ADAudioSessionCoordinationMessage,  "newWithBuilder:",  v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002667A4;
    v15[3] = &unk_1004F8590;
    id v16 = v10;
    -[ADAudioSessionCoordinator _sendMessage:toDeviceWithID:replyHandler:]( self,  "_sendMessage:toDeviceWithID:replyHandler:",  v13,  v9,  v15);

    id v14 = v18;
LABEL_7:

    goto LABEL_8;
  }

  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1015LL,  @"Unexpected request for message."));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
    goto LABEL_7;
  }

- (void)_sendEndAudioSessionRequest:(id)a3 toDeviceWithID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[ADAudioSessionCoordinator(Messaging) _sendEndAudioSessionRequest:toDeviceWithID:responseHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s deviceID = %@, request = %@", buf, 0x20u);
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002665B8;
    v17[3] = &unk_1004F8608;
    id v18 = v8;
    id v13 = +[ADAudioSessionCoordinationMessage newWithBuilder:]( &OBJC_CLASS___ADAudioSessionCoordinationMessage,  "newWithBuilder:",  v17);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100266610;
    v15[3] = &unk_1004F8590;
    id v16 = v10;
    -[ADAudioSessionCoordinator _sendMessage:toDeviceWithID:replyHandler:]( self,  "_sendMessage:toDeviceWithID:replyHandler:",  v13,  v9,  v15);

    id v14 = v18;
LABEL_7:

    goto LABEL_8;
  }

  if (v10)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1015LL,  @"Unexpected request for message."));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v14);
    goto LABEL_7;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinator;
  -[ADAudioSessionCoordinator dealloc](&v3, "dealloc");
}

- (ADAudioSessionCoordinator)initWithInstanceContext:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___ADAudioSessionCoordinator;
  id v8 = -[ADAudioSessionCoordinator init](&v43, "init");
  if (v8)
  {
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistant.audio-session-coordination", v12);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    if (v6) {
      v15 = (AFInstanceContext *)v6;
    }
    else {
      v15 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v8->_instanceContext;
    v8->_instanceContext = v15;

    objc_storeWeak((id *)&v8->_delegate, v7);
    id v17 = -[AFAssertionCoordinator initWithIdentifier:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFAssertionCoordinator),  "initWithIdentifier:queue:delegate:",  @"com.apple.assistant.audio-session-coordination.assertion-coordinator.local",  v8->_queue,  v8);
    localAssertionCoordinator = v8->_localAssertionCoordinator;
    v8->_localAssertionCoordinator = v17;

    id v19 = -[AFAssertionCoordinator initWithIdentifier:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFAssertionCoordinator),  "initWithIdentifier:queue:delegate:",  @"com.apple.assistant.audio-session-coordination.assertion-coordinator.remote",  v8->_queue,  v8);
    remoteAssertionCoordinator = v8->_remoteAssertionCoordinator;
    v8->_remoteAssertionCoordinator = v19;

    __int16 v21 = (AFAudioSessionCoordinationSystemInfo *)+[AFAudioSessionCoordinationSystemInfo newWithBuilder:]( &OBJC_CLASS___AFAudioSessionCoordinationSystemInfo,  "newWithBuilder:",  &stru_1004FA110);
    localSystemInfo = v8->_localSystemInfo;
    v8->_localSystemInfo = v21;

    __int16 v23 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v24 = v8->_localSystemInfo;
      id v25 = v23;
      unsigned int v26 = -[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled](v24, "isSupportedAndEnabled");
      *(_DWORD *)buf = 136315394;
      v45 = "-[ADAudioSessionCoordinator initWithInstanceContext:delegate:]";
      __int16 v46 = 1024;
      unsigned int v47 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s isSupportedAndEnabled = %d (initial)",  buf,  0x12u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v8 selector:"mediaRemoteDeviceInfoRouteIdentifierDidChange:" name:AFMediaRemoteDeviceInfoRouteIdentifierDidChangeNotification object:0];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v8 selector:"mediaRemoteDeviceInfoGroupIdentifierDidChange:" name:AFMediaRemoteDeviceInfoGroupIdentifierDidChangeNotification object:0];

    -[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteGroupIdentifierForReason:]( v8,  "fetchAndUpdateMediaRemoteGroupIdentifierForReason:",  @"Initialization");
    -[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteRouteIdentifierForReason:]( v8,  "fetchAndUpdateMediaRemoteRouteIdentifierForReason:",  @"Initialization");
    dispatch_queue_attr_t v29 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v30 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v29);
    dispatch_queue_attr_t v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_USER_INITIATED, 0);
    v32 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v31);

    dispatch_queue_t v33 = dispatch_queue_create("com.apple.assistant.audio-session-coordination.rapport-link", v32);
    rapportLinkQueue = v8->_rapportLinkQueue;
    v8->_rapportLinkQueue = (OS_dispatch_queue *)v33;

    dispatch_group_t v35 = dispatch_group_create();
    rapportLinkReadyGroup = v8->_rapportLinkReadyGroup;
    v8->_rapportLinkReadyGroup = (OS_dispatch_group *)v35;

    -[ADAudioSessionCoordinator _setUpRapportLink](v8, "_setUpRapportLink");
    id v37 = v8->_queue;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1002C93B8;
    v41[3] = &unk_1004FBBD0;
    v42 = v37;
    v39 = v37;
    [v38 addQueue:v39 heartBeatInterval:v41 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v8;
}

- (void)_setUpRapportLink
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___ADRapportLink);
  rapportLinkQueue = self->_rapportLinkQueue;
  id v5 = +[ADRapportLinkConfiguration newWithBuilder:]( &OBJC_CLASS___ADRapportLinkConfiguration,  "newWithBuilder:",  &stru_1004FA150);
  id v6 = -[ADRapportLink initWithQueue:configuration:](v3, "initWithQueue:configuration:", rapportLinkQueue, v5);
  rapportLink = self->_rapportLink;
  self->_rapportLink = v6;

  -[ADRapportLink addListener:](self->_rapportLink, "addListener:", self);
  -[ADAudioSessionCoordinator _setUpRequestHandlers](self, "_setUpRequestHandlers");
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v9 = self->_rapportLink;
    *(_DWORD *)buf = 136315394;
    dispatch_queue_t v13 = "-[ADAudioSessionCoordinator _setUpRapportLink]";
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Activating Report Link %@...", buf, 0x16u);
  }

  dispatch_group_enter((dispatch_group_t)self->_rapportLinkReadyGroup);
  id v10 = self->_rapportLink;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002C9128;
  v11[3] = &unk_1004FBD90;
  v11[4] = self;
  -[ADRapportLink activateWithCompletion:](v10, "activateWithCompletion:", v11);
}

- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }

  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:AFAudioSessionAssertionUserInfoKey[4]]);
  unsigned int v11 = [v10 BOOLValue];

  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Checking Stereo Pair partner to decide whether legacy audio ducking coordination should be handled...",  buf,  0xCu);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v30 = 1;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002C8D30;
  block[3] = &unk_1004FCDB0;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  int v14 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
  v15 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v16 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (!v16) {
      goto LABEL_12;
    }
    *(_DWORD *)v27 = 136315138;
    v28 = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    id v17 = "%s Continue to handle legacy audio ducking coordination.";
  }

  else
  {
    if (!v16) {
      goto LABEL_12;
    }
    *(_DWORD *)v27 = 136315138;
    v28 = "-[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]";
    id v17 = "%s Drop legacy audio ducking coordination because Stereo Pair partner supports new audio session coordination.";
  }

  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v17, v27, 0xCu);
LABEL_12:
  _Block_object_dispose(buf, 8);
  if (!v14)
  {
    __int16 v21 = 0LL;
    goto LABEL_20;
  }

- (BOOL)hasActiveAudioSessionAssertions
{
  id v3 = -[AFAssertionCoordinator numberOfActiveAssertions](self->_localAssertionCoordinator, "numberOfActiveAssertions");
  if (v3)
  {
    id v4 = v3;
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v6 = 1;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]";
      __int16 v13 = 2048;
      id v14 = v4;
      id v7 = "%s numberOfActiveAssertions = %llu (local)";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v11, 0x16u);
    }
  }

  else
  {
    id v8 = -[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions");
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (!v9) {
        return 1;
      }
      int v11 = 136315394;
      uint64_t v12 = "-[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]";
      __int16 v13 = 2048;
      id v14 = v8;
      id v7 = "%s numberOfActiveAssertions = %llu (remote)";
      BOOL v6 = 1;
      goto LABEL_7;
    }

    if (v9)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = 0 (local + remote)",  (uint8_t *)&v11,  0xCu);
    }

    return 0;
  }

  return v6;
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = dispatch_group_create();
    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x3032000000LL;
    v33[3] = sub_1002C74B8;
    v33[4] = sub_1002C74C8;
    id v34 = 0LL;
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x3032000000LL;
    v31[3] = sub_1002C74B8;
    v31[4] = sub_1002C74C8;
    id v32 = 0LL;
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x3032000000LL;
    v29[3] = sub_1002C74B8;
    void v29[4] = sub_1002C74C8;
    id v30 = 0LL;
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x3032000000LL;
    v27[3] = sub_1002C74B8;
    uint8_t v27[4] = sub_1002C74C8;
    id v28 = 0LL;
    dispatch_group_enter(v5);
    localAssertionCoordinator = self->_localAssertionCoordinator;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1002C8318;
    v22[3] = &unk_1004FA2A0;
    id v24 = &stru_1004FA278;
    id v25 = v33;
    unsigned int v26 = v31;
    id v7 = v5;
    __int16 v23 = v7;
    -[AFAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:]( localAssertionCoordinator,  "getPendingAndActiveAssertionsWithCompletion:",  v22);
    dispatch_group_enter(v7);
    remoteAssertionCoordinator = self->_remoteAssertionCoordinator;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002C83B0;
    v17[3] = &unk_1004FA2A0;
    id v19 = &stru_1004FA278;
    v20 = v29;
    __int16 v21 = v27;
    BOOL v9 = v7;
    id v18 = v9;
    -[AFAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:]( remoteAssertionCoordinator,  "getPendingAndActiveAssertionsWithCompletion:",  v17);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002C8448;
    block[3] = &unk_1004FA2F0;
    block[4] = self;
    __int16 v13 = v33;
    id v14 = v31;
    v15 = v29;
    BOOL v16 = v27;
    id v12 = v4;
    dispatch_group_notify(v9, queue, block);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
}

- (void)relinquishLocalAssertions
{
  id v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v9 = "-[ADAudioSessionCoordinator relinquishLocalAssertions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v4 = mach_absolute_time();
  localAssertionCoordinator = self->_localAssertionCoordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002C82C8;
  v7[3] = &unk_1004FA350;
  v7[4] = v4;
  id v6 = +[AFAssertionContext newWithBuilder:](&OBJC_CLASS___AFAssertionContext, "newWithBuilder:", v7);
  -[AFAssertionCoordinator relinquishAsertionsPassingTest:context:]( localAssertionCoordinator,  "relinquishAsertionsPassingTest:context:",  &stru_1004FA330,  v6);
}

- (void)handleWillSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADAudioSessionCoordinator handleWillSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s isActive = %d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002C82B8;
  v7[3] = &unk_1004FC4D0;
  v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(queue, v7);
}

- (void)handleDidSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[ADAudioSessionCoordinator handleDidSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s isActive = %d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002C82A8;
  v7[3] = &unk_1004FC4D0;
  v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(queue, v7);
}

- (id)_queue
{
  return self->_queue;
}

- (void)_sendRequestID:(id)a3 request:(id)a4 recipientID:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v32 = "-[ADAudioSessionCoordinator _sendRequestID:request:recipientID:responseHandler:]";
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s --->>> recipientID = %@, requestID = %@, request = %@",  buf,  0x2Au);
  }

  v15 = self->_queue;
  uint64_t v16 = mach_absolute_time();
  rapportLinkReadyGroup = self->_rapportLinkReadyGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002C7FC4;
  block[3] = &unk_1004FA3A0;
  block[4] = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  id v29 = v13;
  uint64_t v30 = v16;
  id v28 = v15;
  id v19 = v13;
  v20 = v15;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  dispatch_group_notify((dispatch_group_t)rapportLinkReadyGroup, queue, block);
}

- (void)_registerRequestID:(id)a3 requestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self->_queue;
  rapportLink = self->_rapportLink;
  uint64_t v18 = RPOptionStatusFlags;
  id v19 = &off_1005137C8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002C7C30;
  v14[3] = &unk_1004FA418;
  id v15 = v6;
  uint64_t v16 = v8;
  id v17 = v7;
  id v11 = v7;
  id v12 = v8;
  id v13 = v6;
  -[ADRapportLink registerRequestID:options:handler:](rapportLink, "registerRequestID:options:handler:", v13, v10, v14);
}

- (id)_acquireRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 error:(id *)a7
{
  id v12 = a3;
  v54 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v13 = a5;
  if (a7) {
    *a7 = 0LL;
  }
  id v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v15 = v14;
    [v13 timeIntervalSinceNow];
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expirationDuration:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v82 = v54;
    *(_WORD *)v83 = 2112;
    *(void *)&v83[2] = v13;
    *(_WORD *)&v83[10] = 2048;
    *(void *)&v83[12] = v16;
    __int16 v84 = 2048;
    double v85 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s senderID = %@, reason = %@, effectiveDate = %@ (%f seconds), expirationDuration = %f",  buf,  0x3Eu);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) == 0)
  {
    if (!self->_hasLoggedAudioSessionCoordinationDisablement
      && (self->_hasLoggedAudioSessionCoordinationDisablement = 1,
          id v27 = (os_log_s *)AFSiriLogContextDaemon,
          os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _acquireRemoteAssertionForSenderID:reason:effectiveDate:expiratio"
                           "nDuration:error:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
      if (!a7) {
        goto LABEL_43;
      }
    }

    else if (!a7)
    {
      goto LABEL_43;
    }

    id v28 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1901LL));
LABEL_24:
    id v29 = 0LL;
    *a7 = v28;
    goto LABEL_44;
  }

  if (!v12)
  {
    if (a7)
    {
      id v28 = (id)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1906LL,  @"Sender ID is nil."));
      goto LABEL_24;
    }

- (BOOL)_relinquishRemoteAssertionForSenderID:(id)a3 reason:(id)a4 effectiveDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v12 = a5;
  id v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    [v12 timeIntervalSinceNow];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v39 = v11;
    *(_WORD *)id v40 = 2112;
    *(void *)&v40[2] = v12;
    *(_WORD *)&v40[10] = 2048;
    *(void *)&v40[12] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s senderID = %@, reason = %@, effectiveDate = %@ (%f seconds)",  buf,  0x34u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) == 0)
  {
    if (!self->_hasLoggedAudioSessionCoordinationDisablement
      && (self->_hasLoggedAudioSessionCoordinationDisablement = 1,
          id v26 = (os_log_s *)AFSiriLogContextDaemon,
          os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
      if (!a6) {
        goto LABEL_19;
      }
    }

    else if (!a6)
    {
      goto LABEL_19;
    }

    id v27 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1901LL));
LABEL_15:
    BOOL v28 = 0;
    *a6 = v27;
    goto LABEL_20;
  }

  if (!v10)
  {
    if (a6)
    {
      id v27 = (id)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1907LL,  @"Sender ID is nil."));
      goto LABEL_15;
    }

- (void)fetchAndUpdateMediaRemoteRouteIdentifierForReason:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteRouteIdentifierForReason:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }

  uint64_t v6 = mach_absolute_time();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFMediaRemoteDeviceInfo currentDevice](&OBJC_CLASS___AFMediaRemoteDeviceInfo, "currentDevice"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C7250;
  v9[3] = &unk_1004FA530;
  id v10 = v4;
  uint64_t v11 = v6;
  v9[4] = self;
  id v8 = v4;
  [v7 getRouteIdentifierWithCompletion:v9];
}

- (void)fetchAndUpdateMediaRemoteGroupIdentifierForReason:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteGroupIdentifierForReason:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }

  uint64_t v6 = mach_absolute_time();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFMediaRemoteDeviceInfo currentDevice](&OBJC_CLASS___AFMediaRemoteDeviceInfo, "currentDevice"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C70EC;
  v9[3] = &unk_1004FA530;
  id v10 = v4;
  uint64_t v11 = v6;
  v9[4] = self;
  id v8 = v4;
  [v7 getGroupIdentifierWithCompletion:v9];
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002C70E4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)assertionCoordinator:(id)a3 didAddAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned __int8 v23 = "-[ADAudioSessionCoordinator assertionCoordinator:didAddAssertion:isFirstAssertion:]";
    __int16 v24 = 2112;
    unsigned __int8 v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    BOOL v29 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s assertionCoordinator = %@, assertion = %@, isFirstAssertion = %d",  buf,  0x26u);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v17 = &__kCFBooleanTrue;
    }
    else {
      id v17 = &__kCFBooleanFalse;
    }
    double v20 = @"isFirst";
    double v21 = v17;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v15 = v12;
    uint64_t v16 = 248LL;
  }

  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v13 = &__kCFBooleanTrue;
    }
    else {
      id v13 = &__kCFBooleanFalse;
    }
    id v18 = @"isFirst";
    uint64_t v19 = v13;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    id v15 = v12;
    uint64_t v16 = 252LL;
  }

  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  if (localAssertionCoordinator == v8) {
    -[ADAudioSessionCoordinator _handleAddedLocalAssertion:isFirst:]( self,  "_handleAddedLocalAssertion:isFirst:",  v9,  v5);
  }
}

- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned __int8 v25 = "-[ADAudioSessionCoordinator assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s assertionCoordinator = %@, assertion = %@, isFirstAssertion = %d",  buf,  0x26u);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v17 = &__kCFBooleanTrue;
    }
    else {
      id v17 = &__kCFBooleanFalse;
    }
    id v22 = @"isFirst";
    unsigned __int8 v23 = v17;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v15 = v12;
    uint64_t v16 = 249LL;
  }

  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v13 = &__kCFBooleanTrue;
    }
    else {
      id v13 = &__kCFBooleanFalse;
    }
    double v20 = @"isFirst";
    double v21 = v13;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v15 = v12;
    uint64_t v16 = 253LL;
  }

  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  id v18 = (char *)-[AFAssertionCoordinator numberOfActiveAssertions]( localAssertionCoordinator,  "numberOfActiveAssertions");
  if (&v18[(void)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions")] == (char *)1)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v19 logEventWithType:256 context:0 contextNoCopy:0];
  }

  if (self->_localAssertionCoordinator == v8)
  {
    -[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]( self,  "_handleAcquiredLocalAssertion:isFirst:",  v9,  v5);
  }

  else if (self->_remoteAssertionCoordinator == v8)
  {
    -[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]( self,  "_handleAcquiredRemoteAssertion:isFirst:",  v9,  v5);
  }
}

- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unsigned __int8 v25 = "-[ADAudioSessionCoordinator assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s assertionCoordinator = %@, assertion = %@, isLastAssertion = %d",  buf,  0x26u);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v17 = &__kCFBooleanTrue;
    }
    else {
      id v17 = &__kCFBooleanFalse;
    }
    id v22 = @"isLast";
    unsigned __int8 v23 = v17;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    id v15 = v12;
    uint64_t v16 = 250LL;
  }

  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v13 = &__kCFBooleanTrue;
    }
    else {
      id v13 = &__kCFBooleanFalse;
    }
    double v20 = @"isLast";
    double v21 = v13;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v15 = v12;
    uint64_t v16 = 254LL;
  }

  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  id v18 = -[AFAssertionCoordinator numberOfActiveAssertions](localAssertionCoordinator, "numberOfActiveAssertions");
  if (!((char *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions")
       + (void)v18))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v19 logEventWithType:257 context:0 contextNoCopy:0];
  }

  if (self->_localAssertionCoordinator == v8)
  {
    -[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]( self,  "_handleRelinquishedLocalAssertion:isLast:",  v9,  v5);
  }

  else if (self->_remoteAssertionCoordinator == v8)
  {
    -[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]( self,  "_handleRelinquishedRemoteAssertion:isLast:",  v9,  v5);
  }
}

- (void)assertionCoordinator:(id)a3 didRemoveAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (AFAssertionCoordinator *)a3;
  id v9 = a4;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v33 = "-[ADAudioSessionCoordinator assertionCoordinator:didRemoveAssertion:isLastAssertion:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    __int16 v38 = 1024;
    BOOL v39 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s assertionCoordinator = %@, assertion = %@, isLastAssertion = %d",  buf,  0x26u);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  if (localAssertionCoordinator == v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v17 = &__kCFBooleanTrue;
    }
    else {
      id v17 = &__kCFBooleanFalse;
    }
    __int16 v30 = @"isLast";
    BOOL v31 = v17;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    id v15 = v12;
    uint64_t v16 = 251LL;
  }

  else
  {
    if (self->_remoteAssertionCoordinator != v8) {
      goto LABEL_14;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    if (v5) {
      id v13 = &__kCFBooleanTrue;
    }
    else {
      id v13 = &__kCFBooleanFalse;
    }
    __int16 v28 = @"isLast";
    id v29 = v13;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    id v15 = v12;
    uint64_t v16 = 255LL;
  }

  [v15 logEventWithType:v16 context:v14 contextNoCopy:1];

  localAssertionCoordinator = self->_localAssertionCoordinator;
LABEL_14:
  if (localAssertionCoordinator == v8)
  {
    -[ADAudioSessionCoordinator _handleRemovedLocalAssertion:isLast:]( self,  "_handleRemovedLocalAssertion:isLast:",  v9,  v5);
    if (!v5) {
      goto LABEL_24;
    }
  }

  else if (!v5)
  {
    goto LABEL_24;
  }

  if (!-[AFAssertionCoordinator numberOfPendingAndActiveAssertions]( self->_localAssertionCoordinator,  "numberOfPendingAndActiveAssertions")
    && !-[AFAssertionCoordinator numberOfPendingAndActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfPendingAndActiveAssertions"))
  {
    int v18 = AFSupportsAudioSessionCoordination();
    if (v18 != -[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled"))
    {
      localSystemInfo = self->_localSystemInfo;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1002C70D8;
      v26[3] = &unk_1004FA550;
      char v27 = v18;
      double v20 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mutatedCopyWithMutator:]( localSystemInfo,  "mutatedCopyWithMutator:",  v26));
      double v21 = self->_localSystemInfo;
      self->_localSystemInfo = v20;

      id v22 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v23 = self->_localSystemInfo;
        __int16 v24 = v22;
        unsigned int v25 = -[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled](v23, "isSupportedAndEnabled");
        *(_DWORD *)buf = 136315394;
        id v33 = "-[ADAudioSessionCoordinator assertionCoordinator:didRemoveAssertion:isLastAssertion:]";
        __int16 v34 = 1024;
        LODWORD(v35) = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s isSupportedAndEnabled = %d (updated)",  buf,  0x12u);
      }
    }

    self->_hasLoggedAudioSessionCoordinationDisablement = 0;
  }

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAudioSessionCoordinator rapportLink:didUpdateLocalDevice:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s localDevice = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C70CC;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAudioSessionCoordinator rapportLink:didFindDevice:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C70C0;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[ADAudioSessionCoordinator rapportLink:didUpdateDevice:changes:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s device = %@, changes = %llu", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002C70B4;
  v11[3] = &unk_1004FD968;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAudioSessionCoordinator rapportLink:didLoseDevice:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C70A8;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  -[ADRapportLink removeListener:](self->_rapportLink, "removeListener:", self);
  -[ADAudioSessionCoordinator _tearDownRequestHandlers](self, "_tearDownRequestHandlers");
  -[ADRapportLink invalidate](self->_rapportLink, "invalidate");
  rapportLink = self->_rapportLink;
  self->_rapportLink = 0LL;

  if (v3)
  {
    -[ADAudioSessionCoordinator _setUpRapportLink](self, "_setUpRapportLink");
  }

  else
  {
    dispatch_time_t v6 = dispatch_time(0LL, 20000000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002C7094;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_after(v6, queue, block);
  }

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAudioSessionCoordinator rapportLinkDidInterrupt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002C7088;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADAudioSessionCoordinator rapportLinkDidInvalidate:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002C707C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)mediaRemoteDeviceInfoRouteIdentifierDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADAudioSessionCoordinator mediaRemoteDeviceInfoRouteIdentifierDidChange:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1002C6FD8;
  uint64_t v11 = &unk_1004FD968;
  id v12 = v4;
  __int16 v13 = self;
  id v7 = v4;
  dispatch_async(queue, &v8);
  -[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteRouteIdentifierForReason:]( self,  "fetchAndUpdateMediaRemoteRouteIdentifierForReason:",  @"Notification",  v8,  v9,  v10,  v11);
}

- (void)mediaRemoteDeviceInfoGroupIdentifierDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADAudioSessionCoordinator mediaRemoteDeviceInfoGroupIdentifierDidChange:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1002C6F34;
  uint64_t v11 = &unk_1004FD968;
  id v12 = v4;
  __int16 v13 = self;
  id v7 = v4;
  dispatch_async(queue, &v8);
  -[ADAudioSessionCoordinator fetchAndUpdateMediaRemoteGroupIdentifierForReason:]( self,  "fetchAndUpdateMediaRemoteGroupIdentifierForReason:",  @"Notification",  v8,  v9,  v10,  v11);
}

- (void)_invalidate
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ADAudioSessionCoordinator _invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  localSystemInfo = self->_localSystemInfo;
  self->_localSystemInfo = 0LL;

  -[ADAudioSessionCoordinator _updateCurrentOrUpNextDateInterval:reason:]( self,  "_updateCurrentOrUpNextDateInterval:reason:",  0LL,  @"Invalidation");
  -[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]( self,  "_endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:",  @"Invalidation",  0LL);
  -[ADAudioSessionCoordinator _resetKeepAliveListForReason:]( self,  "_resetKeepAliveListForReason:",  @"Invalidation");
  -[ADAudioSessionCoordinator _stopHeartBeat](self, "_stopHeartBeat");
  -[ADAudioSessionCoordinator _tearDownRequestHandlers](self, "_tearDownRequestHandlers");
  -[ADRapportLink invalidate](self->_rapportLink, "invalidate");
  rapportLink = self->_rapportLink;
  self->_rapportLink = 0LL;

  -[AFAssertionCoordinator invalidate](self->_localAssertionCoordinator, "invalidate");
  localAssertionCoordinator = self->_localAssertionCoordinator;
  self->_localAssertionCoordinator = 0LL;

  -[AFAssertionCoordinator invalidate](self->_remoteAssertionCoordinator, "invalidate");
  remoteAssertionCoordinator = self->_remoteAssertionCoordinator;
  self->_remoteAssertionCoordinator = 0LL;
}

- (void)_addDeviceIDToKeepAliveList:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    id v14 = "-[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s deviceID = %@, reason = %@",  (uint8_t *)&v13,  0x20u);
  }

  if ((-[NSMutableSet containsObject:](self->_keepAliveDeviceIDs, "containsObject:", v6) & 1) == 0)
  {
    keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
    if (!keepAliveDeviceIDs)
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v11 = self->_keepAliveDeviceIDs;
      self->_keepAliveDeviceIDs = v10;

      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
    }

    -[NSMutableSet addObject:](keepAliveDeviceIDs, "addObject:", v6);
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      id v14 = "-[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s keepAliveDeviceIDs += %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)_removeDeviceIDFromKeepAliveList:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    id v12 = "-[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s deviceID = %@, reason = %@",  (uint8_t *)&v11,  0x20u);
  }

  if (-[NSMutableSet containsObject:](self->_keepAliveDeviceIDs, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_keepAliveDeviceIDs, "removeObject:", v6);
    uint64_t v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      id v12 = "-[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s keepAliveDeviceIDs -= %@",  (uint8_t *)&v11,  0x16u);
    }

    if (!-[NSMutableSet count](self->_keepAliveDeviceIDs, "count"))
    {
      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
      self->_keepAliveDeviceIDs = 0LL;
    }
  }
}

- (void)_resetKeepAliveListForReason:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[ADAudioSessionCoordinator _resetKeepAliveListForReason:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
  }

  keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
  self->_keepAliveDeviceIDs = 0LL;

  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[ADAudioSessionCoordinator _resetKeepAliveListForReason:]";
    __int16 v10 = 2112;
    id v11 = 0LL;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs = %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_enumerateKeepAliveListUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002C6F28;
    v7[3] = &unk_1004FA578;
    id v6 = v4;
    v7[0] = _NSConcreteStackBlock;
    id v8 = v4;
    -[NSMutableSet enumerateObjectsUsingBlock:](keepAliveDeviceIDs, "enumerateObjectsUsingBlock:", v7);

    id v4 = v6;
  }
}

- (void)_handleWillSetAudioSessionActive:(BOOL)a3
{
  unint64_t audioSessionState = self->_audioSessionState;
  if (a3)
  {
    if (audioSessionState != 3)
    {
      self->_unint64_t audioSessionState = 2LL;
      id v4 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315394;
        id v8 = "-[ADAudioSessionCoordinator _handleWillSetAudioSessionActive:]";
        __int16 v9 = 2112;
        __int16 v10 = @"going active";
        id v5 = v4;
LABEL_8:
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s unint64_t audioSessionState = %@",  (uint8_t *)&v7,  0x16u);
      }
    }
  }

  else if (audioSessionState)
  {
    self->_unint64_t audioSessionState = 1LL;
    id v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADAudioSessionCoordinator _handleWillSetAudioSessionActive:]";
      __int16 v9 = 2112;
      __int16 v10 = @"going inactive";
      id v5 = v6;
      goto LABEL_8;
    }
  }

- (void)_handleDidSetAudioSessionActive:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = 3LL;
  }
  else {
    unint64_t v3 = 0LL;
  }
  self->_unint64_t audioSessionState = v3;
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = off_1004FA6F0[v3];
    int v7 = 136315394;
    id v8 = "-[ADAudioSessionCoordinator _handleDidSetAudioSessionActive:]";
    __int16 v9 = 2112;
    __int16 v10 = v5;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", (uint8_t *)&v7, 0x16u);
  }

- (void)_updateHomeKitRoomName:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[ADAudioSessionCoordinator _updateHomeKitRoomName:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s roomName = %@, reason = %@", buf, 0x20u);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[AFAudioSessionCoordinationSystemInfo homeKitRoomName](self->_localSystemInfo, "homeKitRoomName"));
  __int16 v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADAudioSessionCoordinator _updateHomeKitRoomName:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s roomName: %@ -> %@", buf, 0x20u);
    }

    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002C6F1C;
    v15[3] = &unk_1004FA5A0;
    id v16 = v6;
    __int16 v13 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mutatedCopyWithMutator:]( localSystemInfo,  "mutatedCopyWithMutator:",  v15));
    id v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    -[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]( self,  "_handleUpdatedLocalSystemInfoForReason:",  v7);
  }
}

- (void)_updateHomeKitMediaSystemIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[ADAudioSessionCoordinator _updateHomeKitMediaSystemIdentifier:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s mediaSystemIdentifier = %@, reason = %@",  buf,  0x20u);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo homeKitMediaSystemIdentifier]( self->_localSystemInfo,  "homeKitMediaSystemIdentifier"));
  __int16 v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADAudioSessionCoordinator _updateHomeKitMediaSystemIdentifier:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s mediaSystemIdentifier: %@ -> %@", buf, 0x20u);
    }

    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002C6F10;
    v15[3] = &unk_1004FA5A0;
    id v16 = v6;
    __int16 v13 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mutatedCopyWithMutator:]( localSystemInfo,  "mutatedCopyWithMutator:",  v15));
    id v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    -[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]( self,  "_handleUpdatedLocalSystemInfoForReason:",  v7);
  }
}

- (void)_updateMediaRemoteGroupIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteGroupIdentifier:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s mediaRemoteGroupIdentifier = %@, reason = %@",  buf,  0x20u);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mediaRemoteGroupIdentifier]( self->_localSystemInfo,  "mediaRemoteGroupIdentifier"));
  __int16 v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteGroupIdentifier:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s mediaRemoteGroupIdentifier: %@ -> %@",  buf,  0x20u);
    }

    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002C6F04;
    v15[3] = &unk_1004FA5A0;
    id v16 = v6;
    __int16 v13 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mutatedCopyWithMutator:]( localSystemInfo,  "mutatedCopyWithMutator:",  v15));
    id v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    -[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]( self,  "_handleUpdatedLocalSystemInfoForReason:",  v7);
  }
}

- (void)_updateMediaRemoteRouteIdentifier:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteRouteIdentifier:reason:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s mediaRemoteRouteIdentifier = %@, reason = %@",  buf,  0x20u);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mediaRemoteRouteIdentifier]( self->_localSystemInfo,  "mediaRemoteRouteIdentifier"));
  __int16 v10 = v9;
  if (v9 != v6 && ([v9 isEqual:v6] & 1) == 0)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADAudioSessionCoordinator _updateMediaRemoteRouteIdentifier:reason:]";
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s mediaRemoteRouteIdentifier: %@ -> %@",  buf,  0x20u);
    }

    localSystemInfo = self->_localSystemInfo;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002C6EF8;
    v15[3] = &unk_1004FA5A0;
    id v16 = v6;
    __int16 v13 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo mutatedCopyWithMutator:]( localSystemInfo,  "mutatedCopyWithMutator:",  v15));
    id v14 = self->_localSystemInfo;
    self->_localSystemInfo = v13;

    -[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]( self,  "_handleUpdatedLocalSystemInfoForReason:",  v7);
  }
}

- (void)_updateCurrentOrUpNextDateInterval:(id)a3 reason:(id)a4
{
  id v6 = (NSDateInterval *)a3;
  id v7 = (NSDateInterval *)a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    __int16 v15 = "-[ADAudioSessionCoordinator _updateCurrentOrUpNextDateInterval:reason:]";
    __int16 v16 = 2112;
    __int16 v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s currentOrUpNextDateInterval = %@, reason = %@",  (uint8_t *)&v14,  0x20u);
  }

  currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
  if (currentOrUpNextDateInterval != v6
    && !-[NSDateInterval isEqualToDateInterval:](currentOrUpNextDateInterval, "isEqualToDateInterval:", v6))
  {
    __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v11 = self->_currentOrUpNextDateInterval;
      int v14 = 136315650;
      __int16 v15 = "-[ADAudioSessionCoordinator _updateCurrentOrUpNextDateInterval:reason:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s currentOrUpNextDateInterval: %@ -> %@",  (uint8_t *)&v14,  0x20u);
    }

    id v12 = (NSDateInterval *)-[NSDateInterval copy](v6, "copy");
    __int16 v13 = self->_currentOrUpNextDateInterval;
    self->_currentOrUpNextDateInterval = v12;

    -[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]( self,  "_handleUpdatedCurrentOrUpNextDateIntervalForReason:",  v7);
  }
}

- (void)_handleUpdatedLocalSystemInfoForReason:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }

  localSystemInfo = self->_localSystemInfo;
  if (localSystemInfo)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AFAudioSessionCoordinationSystemInfo buildDictionaryRepresentation]( localSystemInfo,  "buildDictionaryRepresentation"));
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Push local system info: %@", buf, 0x16u);
    }

    +[ADRapportLink updateSiriInfoWithObject:forKey:]( &OBJC_CLASS___ADRapportLink,  "updateSiriInfoWithObject:forKey:",  v7,  @"audio-session-coordination.system-info");
  }

  -[ADAudioSessionCoordinator _stopHeartBeat](self, "_stopHeartBeat");
  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    double v18 = 0.0;
    currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v17 = 0LL;
    int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval( currentOrUpNextDateInterval,  v10,  &v17,  &v18);
    id v12 = v17;

    if (EffectiveDateAndExpirationDurationFromDateInterval)
    {
      __int16 v13 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = v13;
        [v12 timeIntervalSinceNow];
        *(_DWORD *)buf = 136315906;
        id v20 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
        __int16 v21 = 2112;
        id v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v15;
        __int16 v25 = 2048;
        double v26 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s effectiveDate = %@ (%f), expirationDuration = %f",  buf,  0x2Au);
      }

      -[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]( self,  "_beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:",  v4,  v12,  v18);
      -[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]( self,  "_endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:",  v4,  0LL);
      -[ADAudioSessionCoordinator _startHeartBeatWithEffectiveDate:](self, "_startHeartBeatWithEffectiveDate:", v12);
    }

    else
    {
      -[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]( self,  "_endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:",  v4,  0LL);
    }
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ADAudioSessionCoordinator _handleUpdatedLocalSystemInfoForReason:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }
}

- (void)_handleUpdatedCurrentOrUpNextDateIntervalForReason:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }

  -[ADAudioSessionCoordinator _stopHeartBeat](self, "_stopHeartBeat");
  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    double v15 = 0.0;
    currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v14 = 0LL;
    int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval( currentOrUpNextDateInterval,  v7,  &v14,  &v15);
    id v9 = v14;

    if (EffectiveDateAndExpirationDurationFromDateInterval)
    {
      __int16 v10 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v11 = v10;
        [v9 timeIntervalSinceNow];
        *(_DWORD *)buf = 136315906;
        id v17 = "-[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]";
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        __int16 v22 = 2048;
        double v23 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s effectiveDate = %@ (%f), expirationDuration = %f",  buf,  0x2Au);
      }

      -[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]( self,  "_beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:",  v4,  v9,  v15);
      -[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]( self,  "_endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:",  v4,  0LL);
      -[ADAudioSessionCoordinator _startHeartBeatWithEffectiveDate:](self, "_startHeartBeatWithEffectiveDate:", v9);
    }

    else
    {
      -[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]( self,  "_endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:",  v4,  0LL);
    }
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int16 v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "-[ADAudioSessionCoordinator _handleUpdatedCurrentOrUpNextDateIntervalForReason:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }
}

- (void)_beginAudioSessionOnInRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4 expirationDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v28 = "-[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]";
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2048;
    double v32 = a5;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s effectiveDate = %@, expirationDuration = %f, reason = %@",  buf,  0x2Au);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _qualifiedInRangeDeviceIDs](self, "_qualifiedInRangeDeviceIDs"));
    uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "-[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]";
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s qualifiedInRangeDeviceIDs = %@", buf, 0x16u);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        id v17 = 0LL;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v17);
          id v19 = objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
          __int16 v20 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithEffectiveDate:expirationDuration:]( v19,  "initWithEffectiveDate:expirationDuration:",  v9,  a5,  (void)v22);
          -[ADAudioSessionCoordinator _sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:",  v20,  v18,  0LL);

          -[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]( self,  "_addDeviceIDToKeepAliveList:reason:",  v18,  v8);
          id v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v15);
    }
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    uint64_t v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v28 = "-[ADAudioSessionCoordinator _beginAudioSessionOnInRangeRemoteDevicesForReason:effectiveDate:expirationDuration:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }
}

- (void)_keepAudioSessionAliveOnRemoteDevicesForReason:(id)a3 expirationDuration:(double)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]";
    __int16 v14 = 2048;
    double v15 = a4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s expirationDuration = %f, reason = %@",  buf,  0x20u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
      *(_DWORD *)buf = 136315394;
      id v13 = "-[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]";
      __int16 v14 = 2112;
      double v15 = *(double *)&keepAliveDeviceIDs;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs = %@", buf, 0x16u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002C6E88;
    v11[3] = &unk_1004FA5C8;
    v11[4] = self;
    *(double *)&void v11[5] = a4;
    -[ADAudioSessionCoordinator _enumerateKeepAliveListUsingBlock:](self, "_enumerateKeepAliveListUsingBlock:", v11);
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }
}

- (void)_endAudioSessionOnOutOfRangeRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int128 v25 = "-[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]";
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, reason = %@", buf, 0x20u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _qualifiedOutOfRangeDeviceIDs](self, "_qualifiedOutOfRangeDeviceIDs"));
    __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v25 = "-[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]";
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s qualifiedOutOfRangeDeviceIDs = %@",  buf,  0x16u);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
          -[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]( self,  "_removeDeviceIDFromKeepAliveList:reason:",  v16,  v6,  (void)v19);
          id v17 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithEffectiveDate:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest),  "initWithEffectiveDate:",  v7);
          -[ADAudioSessionCoordinator _sendEndAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendEndAudioSessionRequest:toDeviceWithID:responseHandler:",  v17,  v16,  0LL);
        }

        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v13);
    }
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v25 = "-[ADAudioSessionCoordinator _endAudioSessionOnOutOfRangeRemoteDevicesForReason:effectiveDate:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }
}

- (void)_endAudioSessionOnAllRemoteDevicesForReason:(id)a3 effectiveDate:(id)a4
{
  id v6 = a3;
  id v7 = (NSMutableSet *)a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
    __int16 v30 = 2112;
    __int16 v31 = v7;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s effectiveDate = %@, reason = %@", buf, 0x20u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _qualifiedDeviceIDs](self, "_qualifiedDeviceIDs"));
    __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      __int16 v30 = 2112;
      __int16 v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s qualifiedDeviceIDs = %@", buf, 0x16u);
      __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      keepAliveDeviceIDs = self->_keepAliveDeviceIDs;
      *(_DWORD *)buf = 136315394;
      id v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      __int16 v30 = 2112;
      __int16 v31 = keepAliveDeviceIDs;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s keepAliveDeviceIDs = %@", buf, 0x16u);
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if (-[NSMutableSet count](v9, "count")) {
      -[NSMutableSet unionSet:](v12, "unionSet:", v9);
    }
    if (-[NSMutableSet count](self->_keepAliveDeviceIDs, "count")) {
      -[NSMutableSet unionSet:](v12, "unionSet:", self->_keepAliveDeviceIDs);
    }
    __int128 v22 = v9;
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      __int16 v30 = 2112;
      __int16 v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s mergedDeviceIDs = %@", buf, 0x16u);
    }

    -[ADAudioSessionCoordinator _resetKeepAliveListForReason:](self, "_resetKeepAliveListForReason:", v6);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v14 = v12;
    id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v18);
          __int128 v20 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithEffectiveDate:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest),  "initWithEffectiveDate:",  v7);
          -[ADAudioSessionCoordinator _sendEndAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendEndAudioSessionRequest:toDeviceWithID:responseHandler:",  v20,  v19,  0LL);

          uint64_t v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      }

      while (v16);
    }
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int128 v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[ADAudioSessionCoordinator _endAudioSessionOnAllRemoteDevicesForReason:effectiveDate:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }
}

- (void)_startHeartBeatWithEffectiveDate:(id)a3
{
  id v4 = a3;
  if (!self->_heartBeat)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[ADAudioSessionCoordinator _startHeartBeatWithEffectiveDate:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    objc_initWeak(&location, self);
    id v6 = objc_alloc(&OBJC_CLASS___AFHeartBeat);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002C6CF8;
    v12[3] = &unk_1004FA5F0;
    objc_copyWeak(&v13, &location);
    id v8 = -[AFHeartBeat initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:invalidationHandler:]( v6,  "initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:invalidationHandler:",  @"com.apple.assistant.audio-session-coordination.heart-beat",  queue,  v4,  v12,  &stru_1004FA630,  0.0,  2.0);
    heartBeat = self->_heartBeat;
    self->_heartBeat = v8;

    __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v11 = self->_heartBeat;
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ADAudioSessionCoordinator _startHeartBeatWithEffectiveDate:]";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Starting %@...", buf, 0x16u);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_stopHeartBeat
{
  heartBeat = self->_heartBeat;
  if (heartBeat)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADAudioSessionCoordinator _stopHeartBeat]";
      __int16 v8 = 2112;
      id v9 = heartBeat;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Stopping %@...", (uint8_t *)&v6, 0x16u);
      heartBeat = self->_heartBeat;
    }

    -[AFHeartBeat invalidate](heartBeat, "invalidate");
    id v5 = self->_heartBeat;
    self->_heartBeat = 0LL;
  }

- (void)_heartBeatFired
{
  unint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    heartBeat = self->_heartBeat;
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[ADAudioSessionCoordinator _heartBeatFired]";
    __int16 v18 = 2112;
    uint64_t v19 = heartBeat;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s Firing %@...", buf, 0x16u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    double v15 = 0.0;
    currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v14 = 0LL;
    int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval( currentOrUpNextDateInterval,  v5,  &v14,  &v15);
    id v7 = v14;

    if (EffectiveDateAndExpirationDurationFromDateInterval)
    {
      [v7 timeIntervalSinceNow];
      double v9 = v8;
      __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v17 = "-[ADAudioSessionCoordinator _heartBeatFired]";
        __int16 v18 = 2112;
        uint64_t v19 = (AFHeartBeat *)v7;
        __int16 v20 = 2048;
        double v21 = v9;
        __int16 v22 = 2048;
        double v23 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s effectiveDate = %@ (%f), expirationDuration = %f",  buf,  0x2Au);
        __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
      }

      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v9 <= 0.0)
      {
        if (v11)
        {
          *(_DWORD *)buf = 136315138;
          __int16 v17 = "-[ADAudioSessionCoordinator _heartBeatFired]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Effective date is current or in the past, sending keep-alive request...",  buf,  0xCu);
        }

        -[ADAudioSessionCoordinator _keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:]( self,  "_keepAudioSessionAliveOnRemoteDevicesForReason:expirationDuration:",  @"Heart Beat",  fmin(v15, 8.0));
      }

      else if (v11)
      {
        *(_DWORD *)buf = 136315138;
        __int16 v17 = "-[ADAudioSessionCoordinator _heartBeatFired]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Effective date is in the future, no need to send keep-alive request.",  buf,  0xCu);
      }
    }
  }

  else if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = "-[ADAudioSessionCoordinator _heartBeatFired]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }

- (void)_handleAddedLocalAssertion:(id)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v11 = "-[ADAudioSessionCoordinator _handleAddedLocalAssertion:isFirst:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isFirst = %d", buf, 0x1Cu);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C6CE0;
  v9[3] = &unk_1004FA658;
  v9[4] = self;
  -[AFAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:]( localAssertionCoordinator,  "getPendingAndActiveAssertionsWithCompletion:",  v9);
}

- (void)_handleAcquiredLocalAssertion:(id)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2112;
    __int16 v30 = v6;
    __int16 v31 = 1024;
    LODWORD(v32) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isFirst = %d", buf, 0x1Cu);
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
  }

  unint64_t audioSessionState = self->_audioSessionState;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (audioSessionState > 3) {
      double v9 = 0LL;
    }
    else {
      double v9 = off_1004FA6F0[audioSessionState];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", buf, 0x16u);
  }

  BOOL v11 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_localAssertionCoordinator,  "numberOfActiveAssertions");
  __int16 v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2048;
    __int16 v30 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (local)",  buf,  0x16u);
  }

  id v13 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions");
  __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 2048;
    __int16 v30 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (remote)",  buf,  0x16u);
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString context](v6, "context"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:AFAudioSessionAssertionUserInfoKey[3]]);
  unsigned int v18 = [v17 BOOLValue];

  uint64_t v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
    __int16 v29 = 1024;
    LODWORD(v30) = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s suppressesAudioSessionActivation = %d",  buf,  0x12u);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1002C6CC8;
  v26[3] = &unk_1004FA658;
  void v26[4] = self;
  -[AFAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:]( localAssertionCoordinator,  "getPendingAndActiveAssertionsWithCompletion:",  v26);
  if ((v18 & 1) == 0)
  {
    BOOL v21 = v4;
    if (v13) {
      BOOL v21 = 0;
    }
    if (v21 || audioSessionState != 3)
    {
      __int16 v22 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        double v23 = v22;
        WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 136315650;
        __int16 v28 = "-[ADAudioSessionCoordinator _handleAcquiredLocalAssertion:isFirst:]";
        __int16 v29 = 2112;
        __int16 v30 = WeakRetained;
        __int16 v31 = 2112;
        __int16 v32 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Asking delegate %@ to prepare audio session because remote assertion %@ is acquired and audio session is not active.",  buf,  0x20u);
      }

      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      [v25 audioSessionCoordinator:self prepareAudioSessionWithContext:0];
    }
  }
}

- (void)_handleRelinquishedLocalAssertion:(id)a3 isLast:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2112;
    __int128 v24 = v6;
    __int16 v25 = 1024;
    LODWORD(v26) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isLast = %d", buf, 0x1Cu);
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t audioSessionState = self->_audioSessionState;
    if (audioSessionState > 3) {
      double v9 = 0LL;
    }
    else {
      double v9 = off_1004FA6F0[audioSessionState];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2112;
    __int128 v24 = v9;
    __int16 v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", buf, 0x16u);
  }

  BOOL v11 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_localAssertionCoordinator,  "numberOfActiveAssertions");
  __int16 v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2048;
    __int128 v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (local)",  buf,  0x16u);
  }

  id v13 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions");
  __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
    __int16 v23 = 2048;
    __int128 v24 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (remote)",  buf,  0x16u);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1002C6CB0;
  v20[3] = &unk_1004FA658;
  v20[4] = self;
  -[AFAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:]( localAssertionCoordinator,  "getPendingAndActiveAssertionsWithCompletion:",  v20);
  if (v4 && !v13)
  {
    id v16 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = v16;
      WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
      *(_DWORD *)buf = 136315650;
      __int16 v22 = "-[ADAudioSessionCoordinator _handleRelinquishedLocalAssertion:isLast:]";
      __int16 v23 = 2112;
      __int128 v24 = WeakRetained;
      __int16 v25 = 2112;
      __int128 v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Asking delegate %@ to release audio session because the last local assertion %@ is relinquished and no remote assertion exists.",  buf,  0x20u);
    }

    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 audioSessionCoordinator:self releaseAudioSessionWithContext:0];
  }
}

- (void)_handleRemovedLocalAssertion:(id)a3 isLast:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v11 = "-[ADAudioSessionCoordinator _handleRemovedLocalAssertion:isLast:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isLast = %d", buf, 0x1Cu);
  }

  localAssertionCoordinator = self->_localAssertionCoordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C6C98;
  v9[3] = &unk_1004FA658;
  v9[4] = self;
  -[AFAssertionCoordinator getPendingAndActiveAssertionsWithCompletion:]( localAssertionCoordinator,  "getPendingAndActiveAssertionsWithCompletion:",  v9);
}

- (void)_handleUpdatedLocalAssertionsForReason:(id)a3 pendingAssertions:(id)a4 activeAssertions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (char *)[v9 count];
  id v12 = [v10 count];
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315906;
    __int16 v25 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2048;
    __int16 v29 = v11;
    __int16 v30 = 2048;
    id v31 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s reason = %@, numberOfPendingAssertions = %tu, numberOfActiveAssertions = %tu",  (uint8_t *)&v24,  0x2Au);
  }

  __int16 v14 = &v11[(void)v12];
  if (v14)
  {
    BOOL v15 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v14);
    if ([v9 count])
    {
      id v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 136315394;
        __int16 v25 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s pendingAssertions = %@",  (uint8_t *)&v24,  0x16u);
      }

      -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v9);
    }

    if ([v10 count])
    {
      __int16 v17 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 136315394;
        __int16 v25 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s activeAssertions = %@",  (uint8_t *)&v24,  0x16u);
      }

      -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v10);
    }
  }

  else
  {
    BOOL v15 = (NSMutableArray *)&__NSArray0__struct;
  }

  uint64_t Contexts = AFAssertionGetContexts(v15);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(Contexts);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  CurrentOrUpNextDateIntervalFromuint64_t Contexts = AFAssertionGetCurrentOrUpNextDateIntervalFromContexts(v19, v20);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(CurrentOrUpNextDateIntervalFromContexts);

  __int16 v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    __int16 v25 = "-[ADAudioSessionCoordinator _handleUpdatedLocalAssertionsForReason:pendingAssertions:activeAssertions:]";
    __int16 v26 = 2112;
    id v27 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s currentOrUpNextDateInterval = %@",  (uint8_t *)&v24,  0x16u);
  }

  -[ADAudioSessionCoordinator _updateCurrentOrUpNextDateInterval:reason:]( self,  "_updateCurrentOrUpNextDateInterval:reason:",  v22,  v8);
}

- (void)_handleAcquiredRemoteAssertion:(id)a3 isFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2112;
    __int16 v28 = v6;
    __int16 v29 = 1024;
    LODWORD(v30) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s assertion = %@, isFirst = %d", buf, 0x1Cu);
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
  }

  unint64_t audioSessionState = self->_audioSessionState;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (audioSessionState > 3) {
      id v9 = 0LL;
    }
    else {
      id v9 = off_1004FA6F0[audioSessionState];
    }
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2112;
    __int16 v28 = v9;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s unint64_t audioSessionState = %@", buf, 0x16u);
  }

  BOOL v11 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_localAssertionCoordinator,  "numberOfActiveAssertions");
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2048;
    __int16 v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (local)",  buf,  0x16u);
  }

  id v13 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions");
  __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 2048;
    __int16 v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (remote)",  buf,  0x16u);
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString context](v6, "context"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:AFAudioSessionAssertionUserInfoKey[3]]);
  unsigned int v18 = [v17 BOOLValue];

  id v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
    __int16 v27 = 1024;
    LODWORD(v28) = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s suppressesAudioSessionActivation = %d",  buf,  0x12u);
  }

  if ((v18 & 1) == 0)
  {
    BOOL v20 = v4;
    if (v11) {
      BOOL v20 = 0;
    }
    if (v20 || audioSessionState != 3)
    {
      BOOL v21 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = v21;
        WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 136315650;
        __int16 v26 = "-[ADAudioSessionCoordinator _handleAcquiredRemoteAssertion:isFirst:]";
        __int16 v27 = 2112;
        __int16 v28 = WeakRetained;
        __int16 v29 = 2112;
        __int16 v30 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Asking delegate %@ to prepare audio session because remote assertion %@ is acquired and audio session is not active.",  buf,  0x20u);
      }

      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 audioSessionCoordinator:self prepareAudioSessionWithContext:0];
    }
  }
}

- (void)_handleRelinquishedRemoteAssertion:(id)a3 isLast:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315650;
    BOOL v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2112;
    __int16 v22 = v6;
    __int16 v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s assertion = %@, isLast = %d",  (uint8_t *)&v19,  0x1Cu);
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t audioSessionState = self->_audioSessionState;
    if (audioSessionState > 3) {
      id v9 = 0LL;
    }
    else {
      id v9 = off_1004FA6F0[audioSessionState];
    }
    int v19 = 136315394;
    BOOL v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2112;
    __int16 v22 = v9;
    id v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s unint64_t audioSessionState = %@",  (uint8_t *)&v19,  0x16u);
  }

  BOOL v11 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_localAssertionCoordinator,  "numberOfActiveAssertions");
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    BOOL v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2048;
    __int16 v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (local)",  (uint8_t *)&v19,  0x16u);
  }

  id v13 = (__CFString *)-[AFAssertionCoordinator numberOfActiveAssertions]( self->_remoteAssertionCoordinator,  "numberOfActiveAssertions");
  __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    BOOL v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
    __int16 v21 = 2048;
    __int16 v22 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s numberOfActiveAssertions = %llu (remote)",  (uint8_t *)&v19,  0x16u);
  }

  if (v4 && !v11)
  {
    BOOL v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_delegate);
      int v19 = 136315650;
      BOOL v20 = "-[ADAudioSessionCoordinator _handleRelinquishedRemoteAssertion:isLast:]";
      __int16 v21 = 2112;
      __int16 v22 = WeakRetained;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Asking delegate %@ to release audio session because the last remote assertion %@ is relinquished and no local assertion exists.",  (uint8_t *)&v19,  0x20u);
    }

    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 audioSessionCoordinator:self releaseAudioSessionWithContext:0];
  }
}

- (void)_handleUpdatedLocalDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    id v13 = "-[ADAudioSessionCoordinator _handleUpdatedLocalDevice:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", (uint8_t *)&v12, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 roomName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaSystemIdentifier]);
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    int v12 = 136316162;
    id v13 = "-[ADAudioSessionCoordinator _handleUpdatedLocalDevice:]";
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    int v19 = v6;
    __int16 v20 = 2112;
    __int16 v21 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s deviceID = %@, model = %@, roomName = %@, mediaSystemIdentifier = %@",  (uint8_t *)&v12,  0x34u);
  }

  -[ADAudioSessionCoordinator _updateHomeKitRoomName:reason:]( self,  "_updateHomeKitRoomName:reason:",  v6,  @"Local Device Updated");
  -[ADAudioSessionCoordinator _updateHomeKitMediaSystemIdentifier:reason:]( self,  "_updateHomeKitMediaSystemIdentifier:reason:",  v7,  @"Local Device Updated");
}

- (void)_handleFoundRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
    __int16 v35 = 2112;
    id v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      if (v6)
      {
        unsigned int v17 = sub_1002C6408(v4);
        __int16 v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
          __int16 v35 = 1024;
          LODWORD(v36) = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s deviceIsQualified = %d", buf, 0x12u);
        }

        if (v17)
        {
          int v19 = sub_1002C67A8(v4, self->_localSystemInfo);
          __int16 v20 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
            __int16 v35 = 1024;
            LODWORD(v36) = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s deviceIsInRange = %d", buf, 0x12u);
          }

          double v32 = 0.0;
          currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v31 = 0LL;
          int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval( currentOrUpNextDateInterval,  v22,  &v31,  &v32);
          id v24 = v31;

          __int16 v25 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
            __int16 v35 = 1024;
            LODWORD(v36) = EffectiveDateAndExpirationDurationFromDateInterval;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s dateIntervalIsValid = %d", buf, 0x12u);
          }

          if ((v19 & EffectiveDateAndExpirationDurationFromDateInterval) == 1)
          {
            __int16 v26 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
              __int16 v35 = 2112;
              id v36 = v24;
              __int16 v37 = 2048;
              double v38 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s effectiveDate = %@, expirationDuration = %f",  buf,  0x20u);
            }

            __int16 v27 = objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
            __int16 v28 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithEffectiveDate:expirationDuration:]( v27,  "initWithEffectiveDate:expirationDuration:",  v24,  v32);
            -[ADAudioSessionCoordinator _sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:",  v28,  v6,  0LL);

            -[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]( self,  "_addDeviceIDToKeepAliveList:reason:",  v6,  @"Remote Device Found");
          }

          else
          {
            -[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]( self,  "_removeDeviceIDFromKeepAliveList:reason:",  v6,  @"Remote Device Found");
            __int16 v30 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithEffectiveDate:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest),  "initWithEffectiveDate:",  0LL);
            -[ADAudioSessionCoordinator _sendEndAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendEndAudioSessionRequest:toDeviceWithID:responseHandler:",  v30,  v6,  0LL);
          }
        }
      }

      else
      {
        __int16 v29 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Device ID is nil.", buf, 0xCu);
        }
      }

      goto LABEL_36;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 roomName]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaSystemIdentifier]);
    int v12 = [v4 proximity];
    if (v12 > 19)
    {
      if (v12 == 20)
      {
        id v13 = "Near";
        goto LABEL_18;
      }

      if (v12 == 30)
      {
        id v13 = "Far";
        goto LABEL_18;
      }
    }

    else
    {
      if (!v12)
      {
        id v13 = "Unknown";
        goto LABEL_18;
      }

      if (v12 == 10)
      {
        id v13 = "Immed";
LABEL_18:
        id v15 = sub_1002C643C(v4);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_DWORD *)buf = 136316930;
        id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
        __int16 v35 = 2112;
        id v36 = v6;
        __int16 v37 = 2112;
        double v38 = *(double *)&v8;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v10;
        __int16 v43 = 2112;
        uint64_t v44 = v11;
        __int16 v45 = 2080;
        __int16 v46 = v13;
        __int16 v47 = 2112;
        uint64_t v48 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "%s deviceID = %@, model = %@, name = %@, roomName = %@, mediaSystemIdentifier = %@, proximity = %s, systemInfo = %@",  buf,  0x52u);

        goto LABEL_19;
      }
    }

    id v13 = "?";
    goto LABEL_18;
  }

  if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v34 = "-[ADAudioSessionCoordinator _handleFoundRemoteDevice:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }

- (void)_handleUpdatedRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
    __int16 v35 = 2112;
    id v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", buf, 0x16u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      if (v6)
      {
        unsigned int v17 = sub_1002C6408(v4);
        __int16 v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
          __int16 v35 = 1024;
          LODWORD(v36) = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s deviceIsQualified = %d", buf, 0x12u);
        }

        if (v17)
        {
          int v19 = sub_1002C67A8(v4, self->_localSystemInfo);
          __int16 v20 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
            __int16 v35 = 1024;
            LODWORD(v36) = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s deviceIsInRange = %d", buf, 0x12u);
          }

          double v32 = 0.0;
          currentOrUpNextDateInterval = self->_currentOrUpNextDateInterval;
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v31 = 0LL;
          int EffectiveDateAndExpirationDurationFromDateInterval = AFAssertionGetEffectiveDateAndExpirationDurationFromDateInterval( currentOrUpNextDateInterval,  v22,  &v31,  &v32);
          id v24 = v31;

          __int16 v25 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
            __int16 v35 = 1024;
            LODWORD(v36) = EffectiveDateAndExpirationDurationFromDateInterval;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s dateIntervalIsValid = %d", buf, 0x12u);
          }

          if ((v19 & EffectiveDateAndExpirationDurationFromDateInterval) == 1)
          {
            __int16 v26 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
              __int16 v35 = 2112;
              id v36 = v24;
              __int16 v37 = 2048;
              double v38 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s effectiveDate = %@, expirationDuration = %f",  buf,  0x20u);
            }

            __int16 v27 = objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
            __int16 v28 = -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest initWithEffectiveDate:expirationDuration:]( v27,  "initWithEffectiveDate:expirationDuration:",  v24,  v32);
            -[ADAudioSessionCoordinator _sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendBeginAudioSessionRequest:toDeviceWithID:responseHandler:",  v28,  v6,  0LL);

            -[ADAudioSessionCoordinator _addDeviceIDToKeepAliveList:reason:]( self,  "_addDeviceIDToKeepAliveList:reason:",  v6,  @"Remote Device Updated");
          }

          else
          {
            -[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]( self,  "_removeDeviceIDFromKeepAliveList:reason:",  v6,  @"Remote Device Updated");
            __int16 v30 = -[ADAudioSessionCoordinationMessageEndAudioSessionRequest initWithEffectiveDate:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinationMessageEndAudioSessionRequest),  "initWithEffectiveDate:",  0LL);
            -[ADAudioSessionCoordinator _sendEndAudioSessionRequest:toDeviceWithID:responseHandler:]( self,  "_sendEndAudioSessionRequest:toDeviceWithID:responseHandler:",  v30,  v6,  0LL);
          }
        }
      }

      else
      {
        __int16 v29 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Device ID is nil.", buf, 0xCu);
        }
      }

      goto LABEL_36;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 roomName]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaSystemIdentifier]);
    int v12 = [v4 proximity];
    if (v12 > 19)
    {
      if (v12 == 20)
      {
        id v13 = "Near";
        goto LABEL_18;
      }

      if (v12 == 30)
      {
        id v13 = "Far";
        goto LABEL_18;
      }
    }

    else
    {
      if (!v12)
      {
        id v13 = "Unknown";
        goto LABEL_18;
      }

      if (v12 == 10)
      {
        id v13 = "Immed";
LABEL_18:
        id v15 = sub_1002C643C(v4);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_DWORD *)buf = 136316930;
        id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
        __int16 v35 = 2112;
        id v36 = v6;
        __int16 v37 = 2112;
        double v38 = *(double *)&v8;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v10;
        __int16 v43 = 2112;
        uint64_t v44 = v11;
        __int16 v45 = 2080;
        __int16 v46 = v13;
        __int16 v47 = 2112;
        uint64_t v48 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "%s deviceID = %@, model = %@, name = %@, roomName = %@, mediaSystemIdentifier = %@, proximity = %s, systemInfo = %@",  buf,  0x52u);

        goto LABEL_19;
      }
    }

    id v13 = "?";
    goto LABEL_18;
  }

  if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v34 = "-[ADAudioSessionCoordinator _handleUpdatedRemoteDevice:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  buf,  0xCu);
    }
  }

- (void)_handleLostRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    __int16 v20 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s device = %@", (uint8_t *)&v19, 0x16u);
  }

  if ((-[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled]( self->_localSystemInfo,  "isSupportedAndEnabled") & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
LABEL_19:

      if (v6)
      {
        -[ADAudioSessionCoordinator _removeDeviceIDFromKeepAliveList:reason:]( self,  "_removeDeviceIDFromKeepAliveList:reason:",  v6,  @"Remote Device Lost");
        -[ADAudioSessionCoordinator _relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:]( self,  "_relinquishRemoteAssertionForSenderID:reason:effectiveDate:error:",  v6,  @"Remote Device Lost",  0LL,  0LL);
      }

      else
      {
        __int16 v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136315138;
          __int16 v20 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Device ID is nil.",  (uint8_t *)&v19,  0xCu);
        }
      }

      goto LABEL_24;
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 model]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 roomName]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaSystemIdentifier]);
    int v12 = [v4 proximity];
    id v13 = (void *)v8;
    if (v12 > 19)
    {
      if (v12 == 20)
      {
        __int16 v14 = "Near";
        goto LABEL_18;
      }

      if (v12 == 30)
      {
        __int16 v14 = "Far";
        goto LABEL_18;
      }
    }

    else
    {
      if (!v12)
      {
        __int16 v14 = "Unknown";
        goto LABEL_18;
      }

      if (v12 == 10)
      {
        __int16 v14 = "Immed";
LABEL_18:
        id v16 = sub_1002C643C(v4);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        int v19 = 136316930;
        __int16 v20 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v13;
        __int16 v25 = 2112;
        __int16 v26 = v9;
        __int16 v27 = 2112;
        __int16 v28 = v10;
        __int16 v29 = 2112;
        __int16 v30 = v11;
        __int16 v31 = 2080;
        double v32 = v14;
        __int16 v33 = 2112;
        id v34 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_INFO,  "%s deviceID = %@, model = %@, name = %@, roomName = %@, mediaSystemIdentifier = %@, proximity = %s, systemInfo = %@",  (uint8_t *)&v19,  0x52u);

        goto LABEL_19;
      }
    }

    __int16 v14 = "?";
    goto LABEL_18;
  }

  if (!self->_hasLoggedAudioSessionCoordinationDisablement)
  {
    self->_hasLoggedAudioSessionCoordinationDisablement = 1;
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315138;
      __int16 v20 = "-[ADAudioSessionCoordinator _handleLostRemoteDevice:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Audio Session Coordination is NOT supported or enabled. This message will be logged only once.",  (uint8_t *)&v19,  0xCu);
    }
  }

- (id)_deviceWithID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v27 = "-[ADAudioSessionCoordinator _deviceWithID:]";
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s deviceID = %@", buf, 0x16u);
    if (v4) {
      goto LABEL_3;
    }
LABEL_16:
    id v14 = 0LL;
    goto LABEL_17;
  }

  if (!v4) {
    goto LABEL_16;
  }
LABEL_3:
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_rapportLink, "activeDevices", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_5:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      unsigned int v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v38 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v15 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:

      id v14 = v11;
      goto LABEL_14;
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v11 roomName]);
    int v20 = [v11 proximity];
    if (v20 > 19)
    {
      if (v20 == 20)
      {
        __int16 v21 = "Near";
        goto LABEL_28;
      }

      if (v20 == 30)
      {
        __int16 v21 = "Far";
        goto LABEL_28;
      }
    }

    else
    {
      if (!v20)
      {
        __int16 v21 = "Unknown";
        goto LABEL_28;
      }

      if (v20 == 10)
      {
        __int16 v21 = "Immed";
LABEL_28:
        *(_DWORD *)buf = 136316418;
        __int16 v27 = "-[ADAudioSessionCoordinator _deviceWithID:]";
        __int16 v28 = 2112;
        id v29 = v4;
        __int16 v30 = 2112;
        __int16 v31 = v17;
        __int16 v32 = 2112;
        __int16 v33 = v18;
        __int16 v34 = 2112;
        __int16 v35 = v19;
        __int16 v36 = 2080;
        __int16 v37 = v21;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEBUG,  "%s deviceID = %@, model = %@, name = %@, roomName = %@, proximity = %s",  buf,  0x3Eu);

        goto LABEL_13;
      }
    }

    __int16 v21 = "?";
    goto LABEL_28;
  }

- (id)_qualifiedDevices
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_rapportLink, "activeDevices"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C6AC8;
  v9[3] = &unk_1004FA680;
  id v5 = v3;
  uint64_t v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  if (!-[NSMutableArray count](v5, "count"))
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[ADAudioSessionCoordinator _qualifiedDevices]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s No qualified device can be found.",  buf,  0xCu);
    }
  }

  id v7 = -[NSMutableArray copy](v5, "copy");

  return v7;
}

- (id)_qualifiedInRangeDevices
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    localSystemInfo = self->_localSystemInfo;
    BOOL v11 = v4;
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFAudioSessionCoordinationSystemInfo homeKitRoomName](localSystemInfo, "homeKitRoomName"));
    *(_DWORD *)buf = 136315394;
    int v20 = "-[ADAudioSessionCoordinator _qualifiedInRangeDevices]";
    __int16 v21 = 2112;
    __int128 v22 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s roomName = %@", buf, 0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_rapportLink, "activeDevices"));
  unsigned int v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1002C68E4;
  id v16 = &unk_1004FA6A8;
  unsigned int v17 = self;
  id v6 = v3;
  __int16 v18 = v6;
  [v5 enumerateObjectsUsingBlock:&v13];

  if (!-[NSMutableArray count](v6, "count", v13, v14, v15, v16, v17))
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v20 = "-[ADAudioSessionCoordinator _qualifiedInRangeDevices]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s No qualified in-range device can be found.",  buf,  0xCu);
    }
  }

  id v8 = -[NSMutableArray copy](v6, "copy");

  return v8;
}

- (id)_qualifiedOutOfRangeDevices
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    localSystemInfo = self->_localSystemInfo;
    BOOL v11 = v4;
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFAudioSessionCoordinationSystemInfo homeKitRoomName](localSystemInfo, "homeKitRoomName"));
    *(_DWORD *)buf = 136315394;
    int v20 = "-[ADAudioSessionCoordinator _qualifiedOutOfRangeDevices]";
    __int16 v21 = 2112;
    __int128 v22 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s roomName = %@", buf, 0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_rapportLink, "activeDevices"));
  unsigned int v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1002C65C4;
  id v16 = &unk_1004FA6A8;
  unsigned int v17 = self;
  id v6 = v3;
  __int16 v18 = v6;
  [v5 enumerateObjectsUsingBlock:&v13];

  if (!-[NSMutableArray count](v6, "count", v13, v14, v15, v16, v17))
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v20 = "-[ADAudioSessionCoordinator _qualifiedOutOfRangeDevices]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s No qualified out-of-range device can be found.",  buf,  0xCu);
    }
  }

  id v8 = -[NSMutableArray copy](v6, "copy");

  return v8;
}

- (id)_disqualifiedDevices
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADRapportLink activeDevices](self->_rapportLink, "activeDevices"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002C6238;
  v9[3] = &unk_1004FA680;
  id v5 = v3;
  uint64_t v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  if (!-[NSMutableArray count](v5, "count"))
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[ADAudioSessionCoordinator _disqualifiedDevices]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s No disqualified device can be found.",  buf,  0xCu);
    }
  }

  id v7 = -[NSMutableArray copy](v5, "copy");

  return v7;
}

- (id)_qualifiedDeviceIDs
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _qualifiedDevices](self, "_qualifiedDevices"));
  id v5 = sub_1002C6100(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSSet initWithArray:](v3, "initWithArray:", v6);

  return v7;
}

- (id)_qualifiedInRangeDeviceIDs
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _qualifiedInRangeDevices](self, "_qualifiedInRangeDevices"));
  id v5 = sub_1002C6100(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSSet initWithArray:](v3, "initWithArray:", v6);

  return v7;
}

- (id)_qualifiedOutOfRangeDeviceIDs
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADAudioSessionCoordinator _qualifiedOutOfRangeDevices](self, "_qualifiedOutOfRangeDevices"));
  id v5 = sub_1002C6100(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSSet initWithArray:](v3, "initWithArray:", v6);

  return v7;
}

- (void).cxx_destruct
{
}

@end