@interface ADSiriConnectionRemote
- (ADSiriConnectionRemote)init;
- (BOOL)_hasOrIsEstablishingNetworkConnection;
- (BOOL)_hasPeerConnection;
- (id)_networkConnectionProvider;
- (id)_peerConnection;
- (id)_prependHeader:(__CFHTTPMessage *)a3 toOutputBuffer:(id)a4;
- (id)_tryToReadHTTPHeaderIntoMessage:(__CFHTTPMessage *)a3 fromData:(id)a4 isComplete:(BOOL *)a5;
- (id)_tryToReadPeerStreamHeaderFromData:(id)a3 needsReconnect:(BOOL *)a4;
- (void)_cancelStaleNetworkTimer;
- (void)_closeNetworkConnection;
- (void)_closePeerConnection;
- (void)_connectionMetricsWithCompletion:(id)a3;
- (void)_didEstablishNetworkConnectionForProvider:(id)a3 initialPayload:(id)a4 ofLength:(unint64_t)a5 error:(id)a6;
- (void)_doMetricsBookkeepingForNetworkStreamStart;
- (void)_doMetricsBookkeepingForPeerStreamsStart;
- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5;
- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5 countAgainstFallbacksAllowed:(BOOL)a6;
- (void)_establishPeerConnection;
- (void)_fallbackWithSafetyNet;
- (void)_insertCompanionSpecificDataIntoHeader:(__CFHTTPMessage *)a3;
- (void)_networkConnectionDidEnd;
- (void)_networkConnectionDidOpen;
- (void)_networkConnectionErrorOccurred:(id)a3;
- (void)_networkConnectionFailure;
- (void)_networkConnectionReceivedData:(id)a3;
- (void)_peerConnectionDidEnd;
- (void)_peerConnectionFailure;
- (void)_peerConnectionReceivedData:(id)a3;
- (void)_peerReadStreamErrorOccurred:(id)a3;
- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4;
- (void)_preheat;
- (void)_prepareForSleep;
- (void)_registerForSleepNotification;
- (void)_restartConnectionProviders;
- (void)_setupStaleNetworkTimerForProvider:(id)a3;
- (void)_tryToWriteToNetworkConnection;
- (void)_unregisterForSleepNotification;
- (void)_waitForNetworkData;
- (void)_waitForPeerData;
- (void)_writeDataToNetwork:(id)a3;
- (void)_writeDataToPeer:(id)a3;
- (void)connectionProvider:(id)a3 receivedError:(id)a4;
- (void)dealloc;
- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4;
- (void)peerStreamConnection:(id)a3 requestMetrics:(id)a4;
- (void)peerStreamConnectionHasIncomingPeer:(id)a3;
@end

@implementation ADSiriConnectionRemote

- (ADSiriConnectionRemote)init
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___ADSiriConnectionRemote;
  v2 = -[ADSiriConnectionRemote init](&v35, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ADSiriConnectionRemote", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 saConnectionPolicy]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 routes]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 hostname]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingString:@"/ace"]);
    if (v14) {
      v15 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v14);
    }
    else {
      v15 = 0LL;
    }
    p_networkURL = &v2->_networkURL;
    objc_storeStrong((id *)&v2->_networkURL, v15);
    if (v14) {

    }
    if (*p_networkURL
      || (v20 = (os_log_s *)AFSiriLogContextProxy, os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
      && (*(_DWORD *)buf = 136315138,
          v37 = "-[ADSiriConnectionRemote init]",
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s _networkURL is set to nil", buf, 0xCu),
          *p_networkURL))
    {
      if (v12 && ![v9 connectionPolicyStatus])
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 cname]);
        v18 = v17;
        if (v17) {
          id v19 = v17;
        }
        else {
          id v19 = (id)objc_claimAutoreleasedReturnValue([v12 host]);
        }
        id v21 = v19;

        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  *p_networkURL,  0LL));
        [v22 setHost:v21];
        uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 URL]);
        v24 = (void *)*p_networkURL;
        void *p_networkURL = v23;

        v13 = v21;
      }
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v12 type]);
    v2->_connectByPOP = [v25 isEqualToString:SAConnectionPolicyTypePOPValue];

    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 connectionId]);
    v27 = (NSString *)[v26 copy];
    connectionId = v2->_connectionId;
    v2->_connectionId = v27;

    v29 = -[ADPeerStreamConnection initWithServiceIdentifier:delegate:listener:]( objc_alloc(&OBJC_CLASS___ADPeerStreamConnection),  "initWithServiceIdentifier:delegate:listener:",  @"com.apple.private.alloy.siri.proxy",  v2,  1LL);
    peerConnection = v2->_peerConnection;
    v2->_peerConnection = v29;

    v31 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002F187C;
    block[3] = &unk_1004FD940;
    v34 = v2;
    dispatch_async(v31, block);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADSiriConnectionRemote;
  -[ADSiriConnectionRemote dealloc](&v3, "dealloc");
}

- (void)_preheat
{
  if (-[ADPeerStreamConnection hasNearbyPeer](self->_peerConnection, "hasNearbyPeer"))
  {
    -[ADSiriConnectionRemote _establishPeerConnection](self, "_establishPeerConnection");
    networkURLFromPeer = self->_networkURLFromPeer;
    if (!networkURLFromPeer) {
      networkURLFromPeer = self->_networkURL;
    }
    -[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:]( self,  "_establishNetworkConnectionToURL:connectionId:withPOP:",  networkURLFromPeer,  self->_connectionId,  self->_connectByPOP);
  }

- (id)_peerConnection
{
  return self->_peerConnection;
}

- (BOOL)_hasPeerConnection
{
  return -[ADPeerConnectionProvider hasActiveConnection](self->_peerProvider, "hasActiveConnection");
}

- (void)_establishPeerConnection
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADSiriConnectionRemote _establishPeerConnection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (-[ADPeerConnectionProvider isEstablishing](self->_peerProvider, "isEstablishing"))
  {
    v4 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[ADSiriConnectionRemote _establishPeerConnection]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Already establishing peer streams!",  buf,  0xCu);
    }
  }

  else
  {
    -[ADSiriConnectionRemote _doMetricsBookkeepingForPeerStreamsStart](self, "_doMetricsBookkeepingForPeerStreamsStart");
    dispatch_queue_attr_t v5 = -[ADPeerConnectionProvider initWithQueue:]( objc_alloc(&OBJC_CLASS___ADPeerConnectionProvider),  "initWithQueue:",  self->_queue);
    -[ADPeerConnectionProvider close](self->_peerProvider, "close");
    objc_storeStrong((id *)&self->_peerProvider, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSiriConnectionRemote _peerConnection](self, "_peerConnection"));
    -[ADPeerConnectionProvider setPeerStreamConnection:](v5, "setPeerStreamConnection:", v6);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002F16A8;
    v8[3] = &unk_1004FC2C8;
    v8[4] = self;
    v9 = v5;
    dispatch_queue_t v7 = v5;
    -[ADPeerConnectionProvider openConnectionForURL:withConnectionId:initialPayload:completion:]( v7,  "openConnectionForURL:withConnectionId:initialPayload:completion:",  0LL,  0LL,  0LL,  v8);
  }

- (void)_closePeerConnection
{
  peerProvider = self->_peerProvider;
  if (peerProvider)
  {
    -[ADPeerConnectionProvider close](peerProvider, "close");
    v4 = self->_peerProvider;
    self->_peerProvider = 0LL;

    -[ADPeerStreamConnection close](self->_peerConnection, "close");
    networkOutputBuffer = self->_networkOutputBuffer;
    self->_networkOutputBuffer = 0LL;

    networkURLFromPeer = self->_networkURLFromPeer;
    self->_networkURLFromPeer = 0LL;

    outgoingHTTPHeader = self->_outgoingHTTPHeader;
    if (outgoingHTTPHeader)
    {
      CFRelease(outgoingHTTPHeader);
      self->_outgoingHTTPHeader = 0LL;
    }
  }

- (id)_tryToReadPeerStreamHeaderFromData:(id)a3 needsReconnect:(BOOL *)a4
{
  v6 = (dispatch_data_s *)a3;
  size_t size = dispatch_data_get_size(v6);
  subrange = v6;
  v9 = -[dispatch_data_s bytes](subrange, "bytes");
  v33 = a4;
  if (!subrange) {
    goto LABEL_11;
  }
  v10 = v9;
  size_t v11 = dispatch_data_get_size(subrange);
  if (v11 < 2) {
    goto LABEL_11;
  }
  if (v11 >= 6 && *(_WORD *)v10 == 17233)
  {
    unint64_t v12 = bswap32(*((unsigned __int16 *)v10 + 2)) >> 16;
    if (v11 - 6 >= v12)
    {
      int v13 = v10[2] & 1;
      v14 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v10 + 6,  v12,  4LL);
      if (v14)
      {
        v15 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v14);
        size_t v16 = v12 + 6;
      }

      else
      {
        v15 = 0LL;
        size_t v16 = -1LL;
      }

      goto LABEL_37;
    }

    goto LABEL_11;
  }

  v17 = 0LL;
  int v13 = 0;
  v18 = 0LL;
  size_t v16 = 0LL;
  id v19 = 0LL;
  v20 = 0LL;
  if (v11 < 8 || *(_WORD *)v10 != 16977) {
    goto LABEL_12;
  }
  unint64_t v21 = bswap32(*((unsigned __int16 *)v10 + 1)) >> 16;
  if (v11 - 8 < v21)
  {
LABEL_11:
    v17 = 0LL;
    v18 = 0LL;
    int v13 = 0;
    size_t v16 = 0LL;
    id v19 = 0LL;
    v20 = 0LL;
    goto LABEL_12;
  }

  v29 = v10 + 8;
  v30 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v10 + 8,  v21,  4LL);
  if (v30)
  {
    v15 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v30);
    size_t v16 = v21 + 8;
  }

  else
  {
    v15 = 0LL;
    size_t v16 = -1LL;
  }

  if (!*((_WORD *)v10 + 2))
  {
    int v13 = 0;
LABEL_37:
    v20 = 0LL;
LABEL_38:
    v18 = v15;
    v17 = 0LL;
    id v19 = v18;
    goto LABEL_12;
  }

  uint64_t v31 = __rev16(*((unsigned __int16 *)v10 + 2));
  v20 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &v29[v21],  v31,  4LL);
  if (!v20)
  {
    int v13 = 0;
    size_t v16 = -1LL;
    goto LABEL_38;
  }

  v16 += v31;
  v32 = v15;
  v17 = v32;
  int v13 = 0;
  if (v16)
  {
    id v19 = v32;
    goto LABEL_13;
  }

  v18 = 0LL;
  id v19 = v32;
LABEL_12:

  v17 = v18;
LABEL_13:

  v22 = (os_log_s *)AFSiriLogContextProxy;
  if ((v16 & 0x8000000000000000LL) != 0 || v16 > size)
  {
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v35 = "-[ADSiriConnectionRemote _tryToReadPeerStreamHeaderFromData:needsReconnect:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Bad Peer Header", buf, 0xCu);
    }

    -[ADSiriConnectionRemote _peerConnectionFailure](self, "_peerConnectionFailure");
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v35 = "-[ADSiriConnectionRemote _tryToReadPeerStreamHeaderFromData:needsReconnect:]";
      __int16 v36 = 2112;
      v37 = v17;
      __int16 v38 = 1024;
      int v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Read Peer Header %@ %d", buf, 0x1Cu);
    }

    uint64_t v23 = subrange;
    v24 = v23;
    if (subrange)
    {
      size_t v25 = dispatch_data_get_size(v23);
      if (v25 <= v16)
      {
        subrange = &_dispatch_data_empty;
        v26 = &_dispatch_data_empty;
      }

      else
      {
        subrange = dispatch_data_create_subrange(v24, v16, v25 - v16);
      }
    }
  }

  objc_storeStrong((id *)&self->_networkURLFromPeer, v17);
  if (v17)
  {
    unsigned int v27 = -[NSURL isEqual:](v17, "isEqual:", self->_networkURL) ^ 1;
    if (!v33) {
      goto LABEL_30;
    }
  }

  else
  {
    LOBYTE(v27) = 0;
    if (!v33) {
      goto LABEL_30;
    }
  }

  if (v13) {
    LOBYTE(v27) = 1;
  }
  BOOL *v33 = v27;
LABEL_30:

  return subrange;
}

- (id)_tryToReadHTTPHeaderIntoMessage:(__CFHTTPMessage *)a3 fromData:(id)a4 isComplete:(BOOL *)a5
{
  dispatch_queue_t v7 = (dispatch_data_s *)a4;
  v8 = v7;
  if (v7 && dispatch_data_get_size(v7))
  {
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    uint64_t v19 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002F1658;
    v15[3] = &unk_1004FB260;
    v15[4] = &v16;
    v15[5] = a3;
    dispatch_data_apply(v8, v15);
    size_t v9 = v17[3];
    if (v9)
    {
      size_t size = dispatch_data_get_size(v8);
      if (size <= v9)
      {
        subrange = &_dispatch_data_empty;
        int v13 = &_dispatch_data_empty;
      }

      else
      {
        subrange = dispatch_data_create_subrange(v8, v9, size - v9);
      }

      v8 = subrange;
    }

    if (a5) {
      *a5 = CFHTTPMessageIsHeaderComplete(a3) != 0;
    }
    unint64_t v12 = v8;
    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (a5) {
      *a5 = 0;
    }
    unint64_t v12 = v8;
  }

  return v12;
}

- (void)_insertCompanionSpecificDataIntoHeader:(__CFHTTPMessage *)a3
{
  v4 = (const __CFString *)AFProductType(self, a2);
  CFHTTPMessageSetHeaderFieldValue(a3, @"X-Companion-Type", v4);
  dispatch_queue_attr_t v5 = (const __CFString *)AFBuildVersion();
  CFHTTPMessageSetHeaderFieldValue(a3, @"X-Companion-Build", v5);
}

- (id)_prependHeader:(__CFHTTPMessage *)a3 toOutputBuffer:(id)a4
{
  dispatch_queue_attr_t v5 = (dispatch_data_s *)a4;
  CFDataRef v6 = CFHTTPMessageCopySerializedMessage(a3);
  if (v6)
  {
    dispatch_queue_t v7 = v6;
    CFRetain(v6);
    BytePtr = CFDataGetBytePtr(v7);
    size_t Length = CFDataGetLength(v7);
    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472LL;
    destructor[2] = sub_1002F1650;
    destructor[3] = &unk_1004FCFF8;
    destructor[4] = v7;
    v10 = dispatch_data_create(BytePtr, Length, 0LL, destructor);
    CFRelease(v7);
  }

  else
  {
    v10 = 0LL;
  }

  dispatch_data_t concat = dispatch_data_create_concat(v10, v5);

  return concat;
}

- (void)_fallbackWithSafetyNet
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[ADSiriConnectionRemote _fallbackWithSafetyNet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  -[ADSiriConnectionRemote _closeNetworkConnection](self, "_closeNetworkConnection");
  networkURLFromPeer = self->_networkURLFromPeer;
  if (networkURLFromPeer)
  {
    connectionId = self->_connectionId;
    BOOL connectByPOP = self->_connectByPOP;
  }

  else
  {
    connectionId = 0LL;
    BOOL connectByPOP = 0LL;
    networkURLFromPeer = self->_networkURL;
  }

  -[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:]( self,  "_establishNetworkConnectionToURL:connectionId:withPOP:",  networkURLFromPeer,  connectionId,  connectByPOP);
}

- (void)_restartConnectionProviders
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    dispatch_queue_attr_t v5 = "-[ADSiriConnectionRemote _restartConnectionProviders]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADSiriConnectionRemote _closeNetworkConnection](self, "_closeNetworkConnection");
  -[ADSiriConnectionRemote _closePeerConnection](self, "_closePeerConnection");
  -[ADSiriConnectionRemote _establishPeerConnection](self, "_establishPeerConnection");
}

- (void)_peerConnectionFailure
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    dispatch_queue_attr_t v5 = "-[ADSiriConnectionRemote _peerConnectionFailure]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADSiriConnectionRemote _restartConnectionProviders](self, "_restartConnectionProviders");
}

- (void)_peerConnectionDidEnd
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    dispatch_queue_attr_t v5 = "-[ADSiriConnectionRemote _peerConnectionDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADSiriConnectionRemote _restartConnectionProviders](self, "_restartConnectionProviders");
}

- (void)peerStreamConnection:(id)a3 failedWithError:(id)a4
{
  id v5 = a4;
  CFDataRef v6 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v12 = "-[ADSiriConnectionRemote peerStreamConnection:failedWithError:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002F1644;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)peerStreamConnectionHasIncomingPeer:(id)a3
{
  int v4 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADSiriConnectionRemote peerStreamConnectionHasIncomingPeer:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F1490;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)peerStreamConnection:(id)a3 requestMetrics:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002F1388;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (id)_networkConnectionProvider
{
  networkConnectionProvider = self->_networkConnectionProvider;
  if (!networkConnectionProvider)
  {
    int v4 = -[SiriCoreNWConnection initWithQueue:]( objc_alloc(&OBJC_CLASS___SiriCoreNWConnection),  "initWithQueue:",  self->_queue);
    id v5 = self->_networkConnectionProvider;
    self->_networkConnectionProvider = v4;

    -[SiriCoreConnectionProvider setDelegate:](self->_networkConnectionProvider, "setDelegate:", self);
    networkConnectionProvider = self->_networkConnectionProvider;
  }

  return networkConnectionProvider;
}

- (BOOL)_hasOrIsEstablishingNetworkConnection
{
  else {
    return -[SiriCoreConnectionProvider isEstablishing]( self->_networkConnectionProvider,  "isEstablishing");
  }
}

- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5
{
}

- (void)_establishNetworkConnectionToURL:(id)a3 connectionId:(id)a4 withPOP:(BOOL)a5 countAgainstFallbacksAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  __int16 v13 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
    __int16 v47 = 2112;
    size_t v48 = (size_t)v11;
    __int16 v49 = 2112;
    id v50 = v12;
    __int16 v51 = 1024;
    BOOL v52 = v7;
    __int16 v53 = 1024;
    BOOL v54 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ %@ %d %d", buf, 0x2Cu);
  }

  p_networkURL = &self->_networkURL;
  objc_storeStrong((id *)&self->_networkURL, a3);
  safetyNetBuffer = self->_safetyNetBuffer;
  if (!safetyNetBuffer) {
    goto LABEL_12;
  }
  if (self->_networkOutputBuffer)
  {
    dispatch_data_t concat = (OS_dispatch_data *)dispatch_data_create_concat( (dispatch_data_t)self->_safetyNetBuffer,  (dispatch_data_t)self->_networkOutputBuffer);
    v17 = self->_safetyNetBuffer;
    self->_safetyNetBuffer = concat;

    safetyNetBuffer = self->_safetyNetBuffer;
  }

  objc_storeStrong((id *)&self->_networkOutputBuffer, safetyNetBuffer);
  uint64_t v18 = (os_log_s *)AFSiriLogContextProxy;
  BOOL v19 = os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Using fallback path, but creating new safety net",  buf,  0xCu);
    }

- (void)_didEstablishNetworkConnectionForProvider:(id)a3 initialPayload:(id)a4 ofLength:(unint64_t)a5 error:(id)a6
{
  id v10 = (SiriCoreConnectionProvider *)a3;
  id v11 = (OS_dispatch_data *)a4;
  id v12 = a6;
  __int16 v13 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315138;
    v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v29, 0xCu);
  }

  if (self->_networkConnectionProvider == v10)
  {
    if (!v12)
    {
      if (v11)
      {
        networkOutputBuffer = (dispatch_data_s *)self->_networkOutputBuffer;
        if (networkOutputBuffer) {
          size_t size = dispatch_data_get_size(networkOutputBuffer);
        }
        else {
          size_t size = 0LL;
        }
        BOOL v19 = (os_log_s *)AFSiriLogContextProxy;
        if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_DEBUG))
        {
          int v29 = 136315650;
          v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
          __int16 v31 = 2048;
          unint64_t v32 = a5;
          __int16 v33 = 2048;
          size_t v34 = size;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s Stream opened with initial payload length %lu, networkOutputBuffer length %lu",  (uint8_t *)&v29,  0x20u);
        }

        BOOL v20 = size >= a5;
        size_t v21 = size - a5;
        if (!v20 || self->_networkOutputBuffer != v11)
        {
          v22 = (os_log_s *)AFSiriLogContextProxy;
          if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
          {
            int v29 = 136315138;
            v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s NetworkOutputBuffer has been reset; initial payload set on this pair of streams is no longer valid",
              (uint8_t *)&v29,
              0xCu);
          }

          -[ADSiriConnectionRemote _closeNetworkConnection](self, "_closeNetworkConnection");
          networkURLFromPeer = self->_networkURLFromPeer;
          if (networkURLFromPeer)
          {
            -[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:]( self,  "_establishNetworkConnectionToURL:connectionId:withPOP:",  networkURLFromPeer,  self->_connectionId,  self->_connectByPOP);
            goto LABEL_32;
          }

          id v14 = (os_log_s *)AFSiriLogContextProxy;
          if (!os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO)) {
            goto LABEL_32;
          }
          int v29 = 136315138;
          v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
          v15 = "%s Waiting for peer header before restarting peer streams";
          goto LABEL_6;
        }

        safetyNetBuffer = (dispatch_data_s *)self->_safetyNetBuffer;
        if (safetyNetBuffer)
        {
          safetyNetBuffer = dispatch_data_create_concat(safetyNetBuffer, (dispatch_data_t)v11);
          size_t v25 = self->_safetyNetBuffer;
        }

        else
        {
          size_t v25 = 0LL;
        }

        self->_safetyNetBuffer = (OS_dispatch_data *)safetyNetBuffer;

        int64_t v26 = (dispatch_data_s *)self->_networkOutputBuffer;
        if (v26)
        {
          subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v26, a5, v21);
          v28 = self->_networkOutputBuffer;
          self->_networkOutputBuffer = subrange;
        }
      }

      self->_dataHasBeenWrittenToNetwork = 0;
      -[ADSiriConnectionRemote _setupStaleNetworkTimerForProvider:](self, "_setupStaleNetworkTimerForProvider:", v10);
      -[ADSiriConnectionRemote _networkConnectionDidOpen](self, "_networkConnectionDidOpen");
      -[ADSiriConnectionRemote _waitForNetworkData](self, "_waitForNetworkData");
      -[ADSiriConnectionRemote _tryToWriteToNetworkConnection](self, "_tryToWriteToNetworkConnection");
      goto LABEL_32;
    }

    uint64_t v16 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315394;
      v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
      __int16 v31 = 2114;
      unint64_t v32 = (unint64_t)v12;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v29, 0x16u);
    }

    -[ADSiriConnectionRemote _networkConnectionFailure](self, "_networkConnectionFailure");
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315138;
      v30 = "-[ADSiriConnectionRemote _didEstablishNetworkConnectionForProvider:initialPayload:ofLength:error:]";
      v15 = "%s We no longer care about the streams we opened here";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v29, 0xCu);
    }
  }

- (void)_closeNetworkConnection
{
  networkConnectionProvider = self->_networkConnectionProvider;
  if (networkConnectionProvider)
  {
    int v4 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      BOOL v7 = "-[ADSiriConnectionRemote _closeNetworkConnection]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
      networkConnectionProvider = self->_networkConnectionProvider;
    }

    -[SiriCoreConnectionProvider close](networkConnectionProvider, "close");
    id v5 = self->_networkConnectionProvider;
    self->_networkConnectionProvider = 0LL;

    self->_dataHasBeenWrittenToNetwork = 0;
    -[ADSiriConnectionRemote _cancelStaleNetworkTimer](self, "_cancelStaleNetworkTimer");
  }

- (void)_networkConnectionFailure
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADSiriConnectionRemote _networkConnectionFailure]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  if (self->_safetyNetBuffer)
  {
    -[ADSiriConnectionRemote _fallbackWithSafetyNet](self, "_fallbackWithSafetyNet");
  }

  else if (self->_networkURLFromPeer)
  {
    -[ADSiriConnectionRemote _restartConnectionProviders](self, "_restartConnectionProviders");
  }

  else
  {
    int v4 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      int v6 = "-[ADSiriConnectionRemote _networkConnectionFailure]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Waiting for peer header before restarting peer streams",  (uint8_t *)&v5,  0xCu);
    }

    -[ADSiriConnectionRemote _closeNetworkConnection](self, "_closeNetworkConnection");
  }

- (void)_networkConnectionDidEnd
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[ADSiriConnectionRemote _networkConnectionDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADSiriConnectionRemote _networkConnectionFailure](self, "_networkConnectionFailure");
}

- (void)_setupStaleNetworkTimerForProvider:(id)a3
{
  id v4 = a3;
  int v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  dispatch_time_t v6 = dispatch_time(0LL, 180000000000LL);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1002F0F78;
  handler[3] = &unk_1004FD4C0;
  BOOL v7 = v5;
  id v12 = v7;
  __int16 v13 = self;
  id v14 = v4;
  id v8 = v4;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  staleNetworkTimerSource = self->_staleNetworkTimerSource;
  self->_staleNetworkTimerSource = (OS_dispatch_source *)v7;
  id v10 = v7;
}

- (void)_cancelStaleNetworkTimer
{
  staleNetworkTimerSource = self->_staleNetworkTimerSource;
  if (staleNetworkTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)staleNetworkTimerSource);
    id v4 = self->_staleNetworkTimerSource;
    self->_staleNetworkTimerSource = 0LL;
  }

- (void)connectionProvider:(id)a3 receivedError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[ADSiriConnectionRemote connectionProvider:receivedError:]";
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002F0DE0;
  v11[3] = &unk_1004FD968;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)_waitForPeerData
{
  objc_super v3 = self->_peerProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002F0C68;
  v5[3] = &unk_1004FB300;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  -[ADPeerConnectionProvider readData:](v4, "readData:", v5);
}

- (void)_peerConnectionReceivedData:(id)a3
{
  id v4 = (dispatch_data_s *)a3;
  networkOutputBuffer = (dispatch_data_s *)self->_networkOutputBuffer;
  if (networkOutputBuffer) {
    dispatch_data_t concat = (OS_dispatch_data *)dispatch_data_create_concat(networkOutputBuffer, v4);
  }
  else {
    dispatch_data_t concat = v4;
  }
  id v7 = self->_networkOutputBuffer;
  self->_networkOutputBuffer = concat;

  BOOL v8 = 0;
  unsigned __int8 v32 = 0;
  if (self->_networkURLFromPeer) {
    goto LABEL_8;
  }
  id v9 = (OS_dispatch_data *)objc_claimAutoreleasedReturnValue( -[ADSiriConnectionRemote _tryToReadPeerStreamHeaderFromData:needsReconnect:]( self,  "_tryToReadPeerStreamHeaderFromData:needsReconnect:",  self->_networkOutputBuffer,  &v32));
  id v10 = self->_networkOutputBuffer;
  self->_networkOutputBuffer = v9;

  id v11 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    networkURLFromPeer = self->_networkURLFromPeer;
    BOOL connectByPOP = self->_connectByPOP;
    *(_DWORD *)buf = 136315906;
    size_t v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
    __int16 v35 = 2112;
    __int16 v36 = networkURLFromPeer;
    __int16 v37 = 1024;
    BOOL v38 = connectByPOP;
    __int16 v39 = 1024;
    int v40 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s read peer header %@ pop %d reconnect %d",  buf,  0x22u);
  }

  id v14 = self->_networkURLFromPeer;
  BOOL v8 = v14 != 0LL;
  if (v14)
  {
LABEL_8:
    outgoingHTTPHeader = self->_outgoingHTTPHeader;
    if (outgoingHTTPHeader)
    {
      unsigned __int8 v31 = 0;
      id v16 = (OS_dispatch_data *)objc_claimAutoreleasedReturnValue( -[ADSiriConnectionRemote _tryToReadHTTPHeaderIntoMessage:fromData:isComplete:]( self,  "_tryToReadHTTPHeaderIntoMessage:fromData:isComplete:",  outgoingHTTPHeader,  self->_networkOutputBuffer,  &v31));
      v17 = self->_networkOutputBuffer;
      self->_networkOutputBuffer = v16;

      int v18 = v31;
      BOOL v19 = (os_log_s *)AFSiriLogContextProxy;
      BOOL v20 = os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v20)
        {
          *(_DWORD *)buf = 136315138;
          size_t v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s HTTP Header is complete", buf, 0xCu);
        }

        -[ADSiriConnectionRemote _insertCompanionSpecificDataIntoHeader:]( self,  "_insertCompanionSpecificDataIntoHeader:",  self->_outgoingHTTPHeader);
        size_t v21 = (OS_dispatch_data *)objc_claimAutoreleasedReturnValue( -[ADSiriConnectionRemote _prependHeader:toOutputBuffer:]( self,  "_prependHeader:toOutputBuffer:",  self->_outgoingHTTPHeader,  self->_networkOutputBuffer));
        v22 = self->_networkOutputBuffer;
        self->_networkOutputBuffer = v21;

        CFRelease(self->_outgoingHTTPHeader);
        self->_outgoingHTTPHeader = 0LL;
      }

      else if (v20)
      {
        *(_DWORD *)buf = 136315138;
        size_t v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s HTTP Header is not complete", buf, 0xCu);
      }
    }
  }

  unsigned __int8 v23 = -[ADSiriConnectionRemote _hasOrIsEstablishingNetworkConnection](self, "_hasOrIsEstablishingNetworkConnection");
  if (v32) {
    unsigned __int8 v24 = 0;
  }
  else {
    unsigned __int8 v24 = v23;
  }
  if ((v24 & 1) == 0 && v8)
  {
    -[ADSiriConnectionRemote _closeNetworkConnection](self, "_closeNetworkConnection");
    -[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:]( self,  "_establishNetworkConnectionToURL:connectionId:withPOP:countAgainstFallbacksAllowed:",  self->_networkURLFromPeer,  self->_connectionId,  self->_connectByPOP,  0LL);
  }

  if (-[SiriCoreConnectionProvider isReady](self->_networkConnectionProvider, "isReady"))
  {
    -[ADSiriConnectionRemote _tryToWriteToNetworkConnection](self, "_tryToWriteToNetworkConnection");
  }

  else
  {
    unsigned __int8 v25 = -[SiriCoreConnectionProvider isEstablishing]( self->_networkConnectionProvider,  "isEstablishing");
    int64_t v26 = (os_log_s *)AFSiriLogContextProxy;
    BOOL v27 = os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO);
    if ((v25 & 1) != 0)
    {
      if (v27)
      {
        *(_DWORD *)buf = 136315138;
        size_t v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Waiting for network connection", buf, 0xCu);
      }
    }

    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 136315138;
        size_t v34 = "-[ADSiriConnectionRemote _peerConnectionReceivedData:]";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Establishing network connection",  buf,  0xCu);
      }

      networkURL = self->_networkURLFromPeer;
      if (networkURL)
      {
        connectionId = self->_connectionId;
        BOOL v30 = self->_connectByPOP;
      }

      else
      {
        connectionId = 0LL;
        BOOL v30 = 0LL;
        networkURL = self->_networkURL;
      }

      -[ADSiriConnectionRemote _establishNetworkConnectionToURL:connectionId:withPOP:]( self,  "_establishNetworkConnectionToURL:connectionId:withPOP:",  networkURL,  connectionId,  v30);
    }
  }
}

- (void)_peerReadStreamErrorOccurred:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[ADSiriConnectionRemote _peerReadStreamErrorOccurred:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[ADSiriConnectionRemote _peerConnectionFailure](self, "_peerConnectionFailure");
}

- (void)_writeDataToPeer:(id)a3
{
  if (a3)
  {
    size_t size = dispatch_data_get_size((dispatch_data_t)a3);
    peerProvider = self->_peerProvider;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002F0B3C;
    v7[3] = &unk_1004FB320;
    v7[4] = size;
    -[ADPeerConnectionProvider writeData:completion:](peerProvider, "writeData:completion:", a3, v7);
  }

- (void)_waitForNetworkData
{
  objc_super v3 = self->_networkConnectionProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002F0A38;
  v5[3] = &unk_1004FB300;
  int v6 = v3;
  id v7 = self;
  id v4 = v3;
  -[SiriCoreConnectionProvider readData:](v4, "readData:", v5);
}

- (void)_networkConnectionReceivedData:(id)a3
{
  id v4 = (dispatch_data_s *)a3;
  size_t size = dispatch_data_get_size(v4);
  if (v4 && (size_t v6 = size) != 0)
  {
    -[ADSiriConnectionRemote _writeDataToPeer:](self, "_writeDataToPeer:", v4);
    safetyNetBuffer = self->_safetyNetBuffer;
    self->_safetyNetBuffer = 0LL;

    if (self->_firstByteReadTime == 0.0)
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v8 systemUptime];
      self->_firstByteReadTime = v9;
    }

    id v10 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      id v16 = "-[ADSiriConnectionRemote _networkConnectionReceivedData:]";
      __int16 v17 = 2048;
      size_t v18 = v6;
      id v11 = "%s read: %lu";
      id v12 = v10;
      uint32_t v13 = 22;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    }
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextProxy;
    if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      id v16 = "-[ADSiriConnectionRemote _networkConnectionReceivedData:]";
      id v11 = "%s zero length data";
      id v12 = v14;
      uint32_t v13 = 12;
      goto LABEL_9;
    }
  }
}

- (void)_networkConnectionDidOpen
{
  objc_super v3 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADSiriConnectionRemote _networkConnectionDidOpen]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v4 systemUptime];
  self->_currentOpenTime = v5;

  -[ADSiriConnectionRemote _tryToWriteToNetworkConnection](self, "_tryToWriteToNetworkConnection");
}

- (void)_networkConnectionErrorOccurred:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)AFSiriLogContextProxy;
  if (os_log_type_enabled(AFSiriLogContextProxy, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[ADSiriConnectionRemote _networkConnectionErrorOccurred:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[ADSiriConnectionRemote _networkConnectionFailure](self, "_networkConnectionFailure");
}

- (void)_tryToWriteToNetworkConnection
{
  if (!self->_outgoingHTTPHeader)
  {
    networkOutputBuffer = self->_networkOutputBuffer;
    if (networkOutputBuffer)
    {
      data2 = networkOutputBuffer;
      id v4 = self->_networkOutputBuffer;
      self->_networkOutputBuffer = 0LL;

      -[ADSiriConnectionRemote _writeDataToNetwork:](self, "_writeDataToNetwork:", data2);
      safetyNetBuffer = (dispatch_data_s *)self->_safetyNetBuffer;
      if (safetyNetBuffer)
      {
        dispatch_data_t concat = (OS_dispatch_data *)dispatch_data_create_concat(safetyNetBuffer, data2);
        id v7 = self->_safetyNetBuffer;
        self->_safetyNetBuffer = concat;
      }
    }
  }

- (void)_writeDataToNetwork:(id)a3
{
  id v4 = (dispatch_data_s *)a3;
  double v5 = v4;
  if (v4)
  {
    size_t size = dispatch_data_get_size(v4);
    networkConnectionProvider = self->_networkConnectionProvider;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002F090C;
    v8[3] = &unk_1004FB320;
    v8[4] = size;
    -[SiriCoreConnectionProvider writeData:completion:](networkConnectionProvider, "writeData:completion:", v5, v8);
    if (!self->_dataHasBeenWrittenToNetwork)
    {
      self->_dataHasBeenWrittenToNetwork = 1;
      -[ADSiriConnectionRemote _cancelStaleNetworkTimer](self, "_cancelStaleNetworkTimer");
    }
  }
}

- (void)_prepareForSleep
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002F08F8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4
{
  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  int v6 = v7 >> 4;
  if (v6 != 1)
  {
    if (v6) {
      return;
    }
    -[ADSiriConnectionRemote _prepareForSleep](self, "_prepareForSleep");
  }

  IOAllowPowerChange(self->_ioConnect, a4);
}

- (void)_registerForSleepNotification
{
  if (!self->_ioConnect)
  {
    io_connect_t v3 = IORegisterForSystemPower( self,  &self->_ioNotificationPortRef,  (IOServiceInterestCallback)sub_1002F08F0,  &self->_ioNotifier);
    self->_ioConnect = v3;
    if (v3 + 1 >= 2) {
      IONotificationPortSetDispatchQueue(self->_ioNotificationPortRef, (dispatch_queue_t)self->_queue);
    }
    else {
      self->_ioConnect = 0;
    }
  }

- (void)_unregisterForSleepNotification
{
  if (self->_ioConnect)
  {
    IOReturn v3 = IODeregisterForSystemPower(&self->_ioNotifier);
    if (v3)
    {
      IOReturn v4 = v3;
      double v5 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        unint64_t v7 = "-[ADSiriConnectionRemote _unregisterForSleepNotification]";
        __int16 v8 = 1026;
        IOReturn v9 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Error deregistering for power notifications %{public}d",  (uint8_t *)&v6,  0x12u);
      }
    }

    else
    {
      self->_ioNotifier = 0;
      IONotificationPortDestroy(self->_ioNotificationPortRef);
      self->_ioNotificationPortRef = 0LL;
      IOServiceClose(self->_ioConnect);
      self->_ioConnect = 0;
    }
  }

- (void)_connectionMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___SiriCoreConnectionMetrics);
    ++self->_metricsCount;
    double currentOpenTime = self->_currentOpenTime;
    double firstStartTime = self->_firstStartTime;
    if (currentOpenTime > firstStartTime)
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  currentOpenTime - firstStartTime));
      -[SiriCoreConnectionMetrics setTimeUntilOpen:](v5, "setTimeUntilOpen:", v8);

      double firstStartTime = self->_firstStartTime;
    }

    double firstByteReadTime = self->_firstByteReadTime;
    if (firstByteReadTime > firstStartTime)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  firstByteReadTime - firstStartTime));
      -[SiriCoreConnectionMetrics setTimeUntilFirstByteRead:](v5, "setTimeUntilFirstByteRead:", v10);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_startCount));
    -[SiriCoreConnectionMetrics setAttemptCount:](v5, "setAttemptCount:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_metricsCount));
    -[SiriCoreConnectionMetrics setMetricsCount:](v5, "setMetricsCount:", v12);

    networkConnectionProvider = self->_networkConnectionProvider;
    if (networkConnectionProvider)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1002F08E0;
      v14[3] = &unk_1004FD990;
      id v16 = v4;
      int v15 = v5;
      -[SiriCoreConnectionProvider updateConnectionMetrics:completion:]( networkConnectionProvider,  "updateConnectionMetrics:completion:",  v15,  v14);
    }

    else
    {
      (*((void (**)(id, SiriCoreConnectionMetrics *))v4 + 2))(v4, v5);
    }
  }
}

- (void)_doMetricsBookkeepingForPeerStreamsStart
{
  self->_startCount = 0LL;
  self->_metricsCount = 0LL;
  self->_double firstStartTime = -1.0;
}

- (void)_doMetricsBookkeepingForNetworkStreamStart
{
  IOReturn v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  self->_currentStartTime = v4;

  if (self->_firstStartTime <= 0.0) {
    self->_double firstStartTime = self->_currentStartTime;
  }
  *(_OWORD *)&self->_double currentOpenTime = 0u;
  ++self->_startCount;
}

- (void).cxx_destruct
{
}

@end