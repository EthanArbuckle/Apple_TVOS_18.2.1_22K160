@interface SDAirDropConnection
+ (id)disambiguatedModelName;
+ (id)fileInfoExpectedClassForKeyMap;
+ (id)validatedFileInfo:(id)a3;
+ (id)validatedFilesArray:(id)a3;
+ (id)validatedItemsArray:(id)a3;
- (BOOL)accept;
- (BOOL)allowAskRequestFromPerson:(__SFNode *)a3;
- (BOOL)contactsOnly;
- (BOOL)oneHundredContinue:(_CFHTTPServerRequest *)a3;
- (BOOL)senderInfoAvailable;
- (BOOL)senderIsBlocked;
- (BOOL)senderIsMe;
- (BOOL)senderIsTrusted:(id)a3;
- (BOOL)shouldExtractMediaFromPhotosBundles;
- (BOOL)startReceivingBody:(_CFHTTPServerRequest *)a3 error:(id *)a4;
- (BOOL)startReceivingFile:(_CFHTTPServerRequest *)a3 error:(id *)a4;
- (BOOL)thereIsEnoughFreeSpace;
- (BOOL)transferContainsPhotosAssetBundles;
- (BOOL)transferIsOverPrebufferLimit;
- (NSString)sessionID;
- (NSURL)destination;
- (SDAirDropConnection)initWithConnection:(_CFHTTPServerConnection *)a3;
- (SDAirDropConnectionDelegate)delegate;
- (__SFNode)createPersonForAskRequest;
- (double)getTransferRate;
- (double)getTransferSize;
- (id)compressionType;
- (id)whereFromInfo;
- (int64_t)getStatusCode:(_CFHTTPServerResponse *)a3;
- (void)addObservers;
- (void)adjustPropertiesForAutoAcceptSenderIsMe:(BOOL)a3;
- (void)adjustPropertiesForPhotosBundles;
- (void)cancelAndDecline;
- (void)convertURLStringsToURLs;
- (void)dealloc;
- (void)didCloseConnection;
- (void)didFailToSendResponse:(_CFHTTPServerResponse *)a3;
- (void)didReceiveError:(__CFError *)a3;
- (void)didReceiveRequest:(_CFHTTPServerRequest *)a3;
- (void)didSendResponse:(_CFHTTPServerResponse *)a3 forRequest:(_CFHTTPServerRequest *)a4;
- (void)enqueueBadResponseForRequest:(_CFHTTPServerRequest *)a3;
- (void)enqueueResponse:(_CFHTTPServerRequest *)a3 code:(int64_t)a4 body:(__CFData *)a5;
- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5;
- (void)finishOperation;
- (void)handleAskRequest;
- (void)handleClosedConnection;
- (void)handleDiscoverRequest;
- (void)handleReadStreamEvent:(__CFReadStream *)a3 event:(unint64_t)a4;
- (void)handleTerminalCallBack;
- (void)logSenderIsBlocked;
- (void)makeDestinationDirectory;
- (void)notifyClient:(int64_t)a3 withResults:(id)a4;
- (void)notifyClientForEvent:(int64_t)a3;
- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4;
- (void)parseAskRequest;
- (void)parseDiscoverRequest;
- (void)performBlockForAllProgresses:(id)a3;
- (void)processRequest;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)schedule;
- (void)sendAskResponse:(int64_t)a3;
- (void)sendDiscoverResponse:(int64_t)a3 forKnownAlias:(id)a4;
- (void)sendUploadResponse:(int64_t)a3;
- (void)setCombinedFileURLsAndItems:(id)a3;
- (void)setContactsOnly:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setProperty:(void *)a3 forKey:(__CFString *)a4;
- (void)setSessionID:(id)a3;
- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3;
- (void)silentlyCancelRequest;
- (void)silentlyCancelRequestOnMainThread;
- (void)start;
- (void)stop;
- (void)storeArrayValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeBooleanValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeIconValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeNumberValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeRequestValue:(_CFHTTPServerRequest *)a3 forKey:(__CFString *)a4 convertToNumber:(BOOL)a5;
- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)systemWillSleep:(id)a3;
- (void)wirelessPowerChanged:(id)a3;
@end

@implementation SDAirDropConnection

- (SDAirDropConnection)initWithConnection:(_CFHTTPServerConnection *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SDAirDropConnection;
  v4 = -[SDAirDropConnection init](&v20, "init");
  v5 = v4;
  if (v4)
  {
    zipper = v4->_zipper;
    v4->_zipper = 0LL;

    v5->_person = 0LL;
    v5->_startTime = 0.0;
    progress = v5->_progress;
    v5->_progress = 0LL;

    *(_WORD *)&v5->_contactsOnly = 0;
    v5->_askRequest = 0LL;
    v5->_readStream = 0LL;
    *(void *)&v5->_discover = 0LL;
    *(_WORD *)&v5->_connectionClosed = 0;
    destination = v5->_destination;
    v5->_destination = 0LL;

    v5->_clientTrust = 0LL;
    v5->_requestBuffer = 0LL;
    v5->_uploadRequest = 0LL;
    v5->_discoverRequest = 0LL;
    objc_storeStrong((id *)&v5->_queue, &_dispatch_main_q);
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    requestData = v5->_requestData;
    v5->_requestData = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v5->_properties;
    v5->_properties = v11;

    v5->_powerAssertionID = 0;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v5->_monitor;
    v5->_monitor = (SDStatusMonitor *)v13;

    v5->_lastEvent = 1LL;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    askSemaphore = v5->_askSemaphore;
    v5->_askSemaphore = (OS_dispatch_semaphore *)v15;

    v17 = (_CFHTTPServerConnection *)CFRetain(a3);
    mediaCapabilities = v5->_mediaCapabilities;
    v5->_connection = v17;
    v5->_mediaCapabilities = 0LL;

    -[SDAirDropConnection addObservers](v5, "addObservers");
  }

  return v5;
}

- (void)dealloc
{
  person = self->_person;
  if (person) {
    CFRelease(person);
  }
  requestBuffer = self->_requestBuffer;
  if (requestBuffer) {
    free(requestBuffer);
  }
  clientTrust = self->_clientTrust;
  if (clientTrust) {
    CFRelease(clientTrust);
  }
  v6 = self->_progress;
  -[NSProgress setCancellationHandler:](v6, "setCancellationHandler:", 0LL);
  dispatch_time_t v7 = sub_100114580(2.0);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011DA38;
  block[3] = &unk_1005CB2F8;
  v12 = v6;
  v9 = v6;
  dispatch_after(v7, queue, block);

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDAirDropConnection;
  -[SDAirDropConnection dealloc](&v10, "dealloc");
}

- (void)didCloseConnection
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011DA98;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemWillSleep:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "System will sleep, stopping AirDrop connection.",  v8,  2u);
  }

  -[SDAirDropConnection stop](self, "stop");
  id v6 = sub_100036584(-8, 0LL);
  dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v7,  kSFOperationErrorKey);
  -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10LL);
}

- (void)wirelessPowerChanged:(id)a3
{
  BOOL v4 = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled", a3);
  if (!v4)
  {
    uint64_t v5 = airdrop_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WiFi is disabled, stopping AirDrop connection.",  v9,  2u);
    }

    -[SDAirDropConnection stop](self, "stop");
    id v7 = sub_100036584(-7, 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v8,  kSFOperationErrorKey);
    -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10LL);
  }

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)handleTerminalCallBack
{
  if (self->_stopDeferred)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011DD10;
    block[3] = &unk_1005CB2F8;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (void)notifyClient:(int64_t)a3 withResults:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    self->_lastEvent = a3;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 airDropConnection:self event:a3 withResults:v8];
  }
}

- (double)getTransferRate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = (double)(uint64_t)[v3 longLongValue];
    double v6 = v5 / (CFAbsoluteTimeGetCurrent() - self->_startTime);
  }

  else
  {
    double v6 = -1.0;
  }

  return v6;
}

- (double)getTransferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }

  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)performBlockForAllProgresses:(id)a3
{
}

- (void)notifyClientForEvent:(int64_t)a3
{
  if (a3 != 7)
  {
    uint64_t v5 = airdrop_log(self);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      else {
        id v7 = *(&off_1005CECF8 + a3 - 1);
      }
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection event: %@", buf, 0xCu);
    }
  }

  unint64_t lastEvent = self->_lastEvent;
  BOOL v9 = lastEvent > 0xA;
  uint64_t v10 = (1LL << lastEvent) & 0x610;
  if (v9 || v10 == 0)
  {
    switch(a3)
    {
      case 2LL:
        if (!self->_queueSuspended)
        {
          self->_queueSuspended = 1;
          id v12 = sub_100033F4C();
          uint64_t v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(v12);
          dispatch_suspend(v13);

          sub_1000342B0(self->_properties, self);
        }

        id v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        dispatch_semaphore_t v15 = self;
        uint64_t v16 = 2LL;
        goto LABEL_21;
      case 4LL:
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", &stru_1005CEC20);
        id v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        dispatch_semaphore_t v15 = self;
        uint64_t v16 = 4LL;
        goto LABEL_21;
      case 5LL:
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_10011E32C;
        v38[3] = &unk_1005CEBC0;
        v38[4] = self;
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", v38);
        id v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        dispatch_semaphore_t v15 = self;
        uint64_t v16 = 5LL;
        goto LABEL_21;
      case 7LL:
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_10011E3A4;
        v37[3] = &unk_1005CEBC0;
        v37[4] = self;
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", v37);
        id v14 = -[NSMutableDictionary copy](self->_properties, "copy");
        dispatch_semaphore_t v15 = self;
        uint64_t v16 = 7LL;
LABEL_21:
        -[SDAirDropConnection notifyClient:withResults:](v15, "notifyClient:withResults:", v16, v14);
        goto LABEL_27;
      case 9LL:
        if (!self->_discover)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderModelNameKey));
          -[SDAirDropConnection getTransferRate](self, "getTransferRate");
          double v20 = v19;
          -[SDAirDropConnection getTransferSize](self, "getTransferSize");
          sub_10002EAC4( 0LL,  v18,  0LL,  -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel"),  0LL,  &__NSDictionary0__struct,  v20,  v21);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsKey));
        id v14 = v22;
        if (v22) {
          sub_10002F1DC(0, (uint64_t)[v22 count]);
        }
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", &stru_1005CEC00);
        id v23 = -[NSMutableDictionary copy](self->_properties, "copy");
        -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 9LL, v23);

LABEL_27:
        break;
      case 10LL:
        uint64_t v24 = kSFOperationErrorKey;
        v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationErrorKey));

        if (!self->_discover)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderModelNameKey));
          -[SDAirDropConnection getTransferSize](self, "getTransferSize");
          sub_10002EE68( 0LL,  v27,  0LL,  (__CFError *)v25,  -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel"),  0,  &__NSDictionary0__struct,  v28);
        }

        uint64_t v29 = airdrop_log(v26);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100123BB0();
        }

        v31 = (const void *)kCFErrorDomainSFOperation;
        CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)v25);
        if (CFEqual(v31, Domain))
        {
          id v33 = -[NSMutableDictionary copy](self->_properties, "copy");
          -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 10LL, v33);
        }

        else
        {
          id v34 = sub_100036584(-1, v25);
          id v33 = (id)objc_claimAutoreleasedReturnValue(v34);
          id v35 = -[NSMutableDictionary mutableCopy](self->_properties, "mutableCopy");
          [v35 setObject:v33 forKeyedSubscript:v24];
          -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 10LL, v35);
        }

        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_10011E498;
        v36[3] = &unk_1005CEBC0;
        v36[4] = self;
        -[SDAirDropConnection performBlockForAllProgresses:](self, "performBlockForAllProgresses:", v36);
        break;
      default:
        id v17 = -[NSMutableDictionary copy](self->_properties, "copy");
        -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", a3, v17);

        break;
    }
  }

- (void)didReceiveError:(__CFError *)a3
{
  uint64_t v5 = airdrop_log(self);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100123C3C();
  }

  -[SDAirDropConnection handleTerminalCallBack](self, "handleTerminalCallBack");
  BOOL v7 = -[SDAirDropConnection senderInfoAvailable](self, "senderInfoAvailable");
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  a3,  kSFOperationErrorKey);
    -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10LL);
  }

  else
  {
    uint64_t v8 = airdrop_log(v7);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100123C10();
    }

    -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
  }

- (void)setProperty:(void *)a3 forKey:(__CFString *)a4
{
  properties = self->_properties;
  if (a3) {
    CFDictionarySetValue((CFMutableDictionaryRef)properties, a4, a3);
  }
  else {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)properties, a4);
  }
}

+ (id)fileInfoExpectedClassForKeyMap
{
  if (qword_100657188 != -1) {
    dispatch_once(&qword_100657188, &stru_1005CEC40);
  }
  return (id)qword_100657190;
}

+ (id)validatedFileInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropConnection fileInfoExpectedClassForKeyMap]( &OBJC_CLASS___SDAirDropConnection,  "fileInfoExpectedClassForKeyMap"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v12 = [v4 objectForKeyedSubscript:v11];
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v11]);
          id v14 = (void *)v13;
          if (v13)
          {
            uint64_t isKindOfClass = objc_opt_isKindOfClass(v13, v12);
            if ((isKindOfClass & 1) == 0)
            {
              uint64_t v21 = airdrop_log(isKindOfClass);
              v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                sub_100123D04((uint64_t)v14, v11, v22);
              }

              goto LABEL_20;
            }
          }

          [v5 setObject:v14 forKeyedSubscript:v11];
        }

        id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSFOperationFileBomPathKey]);
    double v6 = v16;
    if (v16 && !(BOOL v17 = sub_10003674C(v16)))
    {
      uint64_t v24 = airdrop_log(v17);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_100123C9C();
      }
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSFOperationFileNameKey]);
      id v14 = v18;
      if (!v18 || (BOOL v19 = sub_100036820(v18)))
      {
        double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v5));
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v25 = airdrop_log(v19);
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100123C9C();
      }
    }

+ (id)validatedFilesArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

    uint64_t v6 = NSArrayValidateClasses(v3, 0LL, 0LL, v5);
    if ((v6 & 1) != 0)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v8 = v3;
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = objc_claimAutoreleasedReturnValue( +[SDAirDropConnection validatedFileInfo:]( &OBJC_CLASS___SDAirDropConnection,  "validatedFileInfo:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  (void)v18));
            if (!v13)
            {

              goto LABEL_16;
            }

            id v14 = (void *)v13;
            [v7 addObject:v13];
          }

          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v7 = v7;
      dispatch_semaphore_t v15 = v7;
    }

    else
    {
      uint64_t v16 = airdrop_log(v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        sub_100123DAC();
      }
LABEL_16:
      dispatch_semaphore_t v15 = 0LL;
    }
  }

  else
  {
    dispatch_semaphore_t v15 = 0LL;
  }

  return v15;
}

+ (id)validatedItemsArray:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  v9[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v9[1] = objc_opt_class(&OBJC_CLASS___NSURL);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  else {
    uint64_t v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (void)storeArrayValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = (void *)CFDictionaryGetValue(a3, a4);
  if (!Value)
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", 0LL, a4);
    return;
  }

  id v7 = Value;
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v9 = CFGetTypeID(v7);
  if (TypeID != v9)
  {
    uint64_t v13 = airdrop_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100123E38();
    }
    goto LABEL_18;
  }

  id v10 = v7;
  uint64_t v11 = v10;
  if ((__CFString *)kSFOperationFilesKey == a4
    || a4 && kSFOperationFilesKey && (id v10 = (os_log_s *)CFEqual(a4, kSFOperationFilesKey), (_DWORD)v10))
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[SDAirDropConnection validatedFilesArray:](&OBJC_CLASS___SDAirDropConnection, "validatedFilesArray:", v11));
  }

  else
  {
    if ((__CFString *)kSFOperationItemsKey != a4)
    {
      if (!a4 || !kSFOperationItemsKey || (id v10 = (os_log_s *)CFEqual(a4, kSFOperationItemsKey), !(_DWORD)v10))
      {
        uint64_t v15 = airdrop_log(v10);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100123DD8();
        }
        goto LABEL_17;
      }
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[SDAirDropConnection validatedItemsArray:](&OBJC_CLASS___SDAirDropConnection, "validatedItemsArray:", v11));
  }

  id v14 = (os_log_s *)v12;
  -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", v12, a4);
LABEL_17:

LABEL_18:
}

- (void)storeRequestValue:(_CFHTTPServerRequest *)a3 forKey:(__CFString *)a4 convertToNumber:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (const __CFString *)_CFHTTPServerRequestCopyProperty(a3, a4);
  if (v8)
  {
    CFTypeID v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    CFTypeID TypeID = CFStringGetTypeID();
    if (v10 == TypeID)
    {
      CFStringRef v12 = CFURLCreateStringByReplacingPercentEscapes(0LL, v9, &stru_1005E3958);
      if (v12)
      {
        CFStringRef v13 = v12;
        if (v5)
        {
          CFNumberRef v14 = sub_1001146D4(0LL, v9);
          if (v14)
          {
            CFNumberRef v15 = v14;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_properties, a4, v14);
            CFRelease(v15);
          }
        }

        else
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_properties, a4, v12);
        }

        CFRelease(v13);
        goto LABEL_17;
      }

      uint64_t v20 = airdrop_log(0LL);
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100123EC4();
      }
    }

    else
    {
      uint64_t v18 = airdrop_log(TypeID);
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100123EF0();
      }
    }

LABEL_17:
    CFRelease(v9);
    return;
  }

  uint64_t v16 = airdrop_log(0LL);
  BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100123E98();
  }
}

- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFDataGetTypeID(), CFTypeID v8 = CFGetTypeID(Value), TypeID != v8))
  {
    uint64_t v9 = airdrop_log(v8);
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100123F1C();
    }
  }

  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }

- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFStringGetTypeID(), CFTypeID v8 = CFGetTypeID(Value), TypeID != v8))
  {
    uint64_t v9 = airdrop_log(v8);
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100123F7C();
    }
  }

  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }

- (void)storeNumberValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFNumberGetTypeID(), CFTypeID v8 = CFGetTypeID(Value), TypeID != v8))
  {
    uint64_t v9 = airdrop_log(v8);
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100123FDC();
    }
  }

  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }

- (void)storeBooleanValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (TypeID = CFBooleanGetTypeID(), CFTypeID v8 = CFGetTypeID(Value), TypeID != v8))
  {
    uint64_t v9 = airdrop_log(v8);
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10012403C();
    }
  }

  else
  {
    -[SDAirDropConnection setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }

- (void)storeIconValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = (const __CFData *)CFDictionaryGetValue(a3, a4);
  if (Value)
  {
    id v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    CFTypeID TypeID = CFDataGetTypeID();
    if (v8 == TypeID)
    {
      CGImageRef v10 = sub_10008DF74(v7);
      if (v10)
      {
        CGImageRef v11 = v10;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, a4);
        CFRelease(v11);
        return;
      }

      uint64_t v14 = airdrop_log(0LL);
      CFStringRef v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10012409C();
      }
    }

    else
    {
      uint64_t v12 = airdrop_log(TypeID);
      CFStringRef v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001240C8();
      }
    }
  }

- (void)sendDiscoverResponse:(int64_t)a3 forKnownAlias:(id)a4
{
  id v6 = a4;
  discoverRequest = self->_discoverRequest;
  if (discoverRequest)
  {
    ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage(discoverRequest, a3);
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Connection", @"close");
    if (a3 != 200)
    {
      uint64_t v21 = airdrop_log(v9);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v36 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Responding to Discover request with code %ld",  buf,  0xCu);
      }

      uint64_t v23 = (const void *)_CFHTTPServerResponseCreateWithData(self->_discoverRequest, ResponseMessage, 0LL);
      goto LABEL_26;
    }

    CGImageRef v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (v6)
    {
      id v11 = [(id)objc_opt_class(self) disambiguatedModelName];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      CFStringRef v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self->_monitor, "myAppleIDValidationRecord"));
      CFNumberRef v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 idSelfIdentity]);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  kSFOperationReceiverModelNameKey);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v15,  kSFOperationReceiverRecordDataKey);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v13,  kSFOperationReceiverComputerNameKey);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceIRKData]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v18,  kSFOperationReceiverDeviceIRKDataKey);

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 edPKData]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v19,  kSFOperationReceiverEdPKDataKey);

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 idsDeviceID]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v20,  kSFOperationReceiverIDSDeviceIDKey);

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v6,  kSFOperationSendersKnownAliasKey);
    }

    else
    {
      if (self->_contactsOnly) {
        goto LABEL_10;
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  kSFOperationReceiverComputerNameKey);
    }

LABEL_10:
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_mediaCapabilities,  kSFOperationReceiverMediaCapabilitiesKey);
    CFErrorRef error = 0LL;
    unsigned int v24 = -[SDStatusMonitor enableXML](self->_monitor, "enableXML");
    if (v24) {
      CFPropertyListFormat v25 = kCFPropertyListXMLFormat_v1_0;
    }
    else {
      CFPropertyListFormat v25 = kCFPropertyListBinaryFormat_v1_0;
    }
    uint64_t v26 = off_1005CEA58;
    if (!v24) {
      uint64_t v26 = off_1005CEA50;
    }
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Content-Type", *v26);
    CFDataRef v27 = CFPropertyListCreateData(0LL, v10, v25, 0LL, &error);
    CFDataRef v28 = v27;
    if (!v27)
    {
      uint64_t v29 = airdrop_log(0LL);
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1001240F4();
      }

      CFRelease(error);
    }

    uint64_t v31 = airdrop_log(v27);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = "known";
      if (!v6) {
        id v33 = "unknown";
      }
      *(_DWORD *)buf = 136315138;
      int64_t v36 = (int64_t)v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Responding to Discover request from %s person",  buf,  0xCu);
    }

    uint64_t v23 = (const void *)_CFHTTPServerResponseCreateWithData(self->_discoverRequest, ResponseMessage, v28);
    if (v28) {
      CFRelease(v28);
    }

LABEL_26:
    _CFHTTPServerResponseEnqueue(v23);
    CFRelease(self->_discoverRequest);
    CFRelease(v23);
    CFRelease(ResponseMessage);
    self->_discoverRequest = 0LL;
  }
}

- (void)sendAskResponse:(int64_t)a3
{
  if (!self->_askRequest) {
    return;
  }
  uint64_t v5 = airdrop_log(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)a3 <= 399)
    {
      switch((_DWORD)a3)
      {
        case 0x64:
          id v7 = @"Continue (100)";
          goto LABEL_23;
        case 0xC8:
          id v7 = @"OK (200)";
          goto LABEL_23;
        case 0xCC:
          id v7 = @"No Content (204)";
LABEL_23:
          *(_DWORD *)cf = 138412290;
          *(void *)&cf[4] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending Ask response with code %@",  cf,  0xCu);
          goto LABEL_24;
      }
    }

    else
    {
      if ((int)a3 <= 416)
      {
        switch((int)a3)
        {
          case 400:
            id v7 = @"Bad Request (400)";
            break;
          case 401:
            id v7 = @"Unauthorized (401)";
            break;
          case 403:
            id v7 = @"Forbidden (403)";
            break;
          case 409:
            id v7 = @"Conflict (409)";
            break;
          default:
            goto LABEL_22;
        }

        goto LABEL_23;
      }

      switch((_DWORD)a3)
      {
        case 0x1A1:
          id v7 = @"Expectation Failed (417)";
          goto LABEL_23;
        case 0x1F4:
          id v7 = @"Server Fail (500)";
          goto LABEL_23;
        case 0x1FB:
          id v7 = @"Insufficient Storage (507)";
          goto LABEL_23;
      }
    }

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    uint64_t v3 = airdrop_log(self);
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int powerAssertionID = self->_powerAssertionID;
      *(_DWORD *)buf = 67109120;
      unsigned int v12 = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power assertion released (%d)", buf, 8u);
    }

    unsigned int v6 = self->_powerAssertionID;
    self->_unsigned int powerAssertionID = 0;
    dispatch_time_t v7 = sub_100114580(3.0);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011FB2C;
    block[3] = &unk_1005CBDD8;
    unsigned int v10 = v6;
    dispatch_after(v7, queue, block);
  }

- (void)sendUploadResponse:(int64_t)a3
{
  if (self->_uploadRequest)
  {
    uint64_t v5 = airdrop_log(self);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

      CFDataRef v8 = CFDataCreate(0LL, 0LL, 0LL);
      -[SDAirDropConnection enqueueResponse:code:body:]( self,  "enqueueResponse:code:body:",  self->_uploadRequest,  a3,  v8);
      -[SDAirDropConnection releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
      CFRelease(self->_uploadRequest);
      CFRelease(v8);
      self->_uploadRequest = 0LL;
      return;
    }

    if ((int)a3 <= 399)
    {
      switch((_DWORD)a3)
      {
        case 0x64:
          dispatch_time_t v7 = @"Continue (100)";
          goto LABEL_23;
        case 0xC8:
          dispatch_time_t v7 = @"OK (200)";
          goto LABEL_23;
        case 0xCC:
          dispatch_time_t v7 = @"No Content (204)";
LABEL_23:
          int v9 = 138412290;
          unsigned int v10 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Sending Upload response with code %@",  (uint8_t *)&v9,  0xCu);
          goto LABEL_24;
      }
    }

    else
    {
      if ((int)a3 <= 416)
      {
        switch((int)a3)
        {
          case 400:
            dispatch_time_t v7 = @"Bad Request (400)";
            break;
          case 401:
            dispatch_time_t v7 = @"Unauthorized (401)";
            break;
          case 403:
            dispatch_time_t v7 = @"Forbidden (403)";
            break;
          case 409:
            dispatch_time_t v7 = @"Conflict (409)";
            break;
          default:
            goto LABEL_22;
        }

        goto LABEL_23;
      }

      switch((_DWORD)a3)
      {
        case 0x1A1:
          dispatch_time_t v7 = @"Expectation Failed (417)";
          goto LABEL_23;
        case 0x1F4:
          dispatch_time_t v7 = @"Server Fail (500)";
          goto LABEL_23;
        case 0x1FB:
          dispatch_time_t v7 = @"Insufficient Storage (507)";
          goto LABEL_23;
      }
    }

- (__SFNode)createPersonForAskRequest
{
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIDKey));
  double v4 = sub_10003601C(v3);
  if ((_DWORD)v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderComputerNameKey));
    if (![v5 length])
    {
      uint64_t v13 = airdrop_log(0LL);
      CFPropertyListFormat v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100124154();
      }
      unsigned int v6 = 0LL;
      goto LABEL_30;
    }

    unsigned int v6 = (__SFNode *)SFNodeCreate(0LL, v5, v3);
    dispatch_time_t v7 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
    if (v7)
    {
      CFDataRef v8 = v7;
      int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderModelNameKey));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderRecordDataKey));
      if (self->_clientTrust)
      {
        SFNodeSetModel(v6, v9);
        clientTrust = self->_clientTrust;
      }

      else
      {
        clientTrust = 0LL;
      }

      id v15 = sub_100035F84(v10, clientTrust, (uint64_t)v6);
      CFRelease(v8);
    }

    CFPropertyListFormat v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIconHashKey));
    CFDataRef v17 = (void *)v16;
    if (!v16)
    {
LABEL_29:
      *(void *)v32 = 743LL;
      CFNumberRef v30 = CFNumberCreate(0LL, kCFNumberLongType, v32);
      SFNodeSetFlags(v6, v30);
      SFNodeAddKind(v6, kSFNodeKindPerson);
      SFNodeAddKind(v6, kSFNodeKindBonjour);
      SFNodeSetDomain(v6, @"local");
      SFNodeSetServiceName(v6, v3);
      SFNodeSetComputerName(v6, v5);
      sub_100034C94((uint64_t)v6, 0LL, v14, 0);
      CFRelease(v30);

LABEL_30:
      goto LABEL_31;
    }

    uint64_t v18 = airdrop_log(v16);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412290;
      *(void *)&v32[4] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "SDAirDropConnection: icon hash is available for %@",  v32,  0xCu);
    }

    SFNodeSetIconHash(v6, v17);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIconKey));
    uint64_t v21 = v20;
    if (!v20)
    {
      uint64_t v26 = airdrop_log(0LL);
      unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100124180();
      }
      goto LABEL_28;
    }

    id v22 = sub_100114E70(v20);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    unsigned int v24 = v23;
    if (v23)
    {
      id v25 = -[os_log_s isEqual:](v23, "isEqual:", v17);
      if ((_DWORD)v25)
      {
        -[os_log_s setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v21, v17);
LABEL_28:

        goto LABEL_29;
      }

      uint64_t v29 = airdrop_log(v25);
      CFDataRef v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1001241D8();
      }
    }

    else
    {
      uint64_t v27 = airdrop_log(0LL);
      CFDataRef v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1001241AC();
      }
    }

    goto LABEL_28;
  }

  uint64_t v12 = airdrop_log(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
    sub_100124204();
  }
  unsigned int v6 = 0LL;
LABEL_31:

  return v6;
}

- (void)logSenderIsBlocked
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self->_monitor, "myAppleID"));
  SFMetricsLogUnexpectedEvent(5LL, -[SDAirDropConnection senderIsMe](self, "senderIsMe"), v3);
}

- (BOOL)senderIsBlocked
{
  return 0;
}

- (BOOL)senderIsTrusted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_100035290(self->_clientTrust);
  if (v5)
  {
    unsigned int v6 = v5;
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v4));
    if (v7)
    {
      id v16 = 0LL;
      int v8 = sub_1001720B8(v6, v7, &v16);
      int v9 = (os_log_s *)v16;
      unsigned int v10 = v9;
      if (v8)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v4,  kSFOperationSenderEmailKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSFOperationVerifiableIdentityKey);
      }

      else
      {
        uint64_t v13 = airdrop_log(v9);
        CFPropertyListFormat v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1001242F0();
        }
      }
    }

    else
    {
      uint64_t v12 = airdrop_log(0LL);
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001242C4();
      }
      LOBYTE(v8) = 0;
    }

    CFRelease(v6);
  }

  else
  {
    uint64_t v11 = airdrop_log(0LL);
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100124264();
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)senderIsMe
{
  clientTrust = self->_clientTrust;
  if (clientTrust)
  {
    id v4 = sub_100035290(clientTrust);
    if (!-[__CFArray count](v4, "count"))
    {
      uint64_t v16 = airdrop_log(0LL);
      CFDataRef v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100124350();
      }

      unsigned __int8 v15 = 0;
      goto LABEL_22;
    }

    int v33 = 0;
    uint64_t v5 = SFAppleIDVerifyCertificateChainSync(v4, &v33);
    if ((_DWORD)v5) {
      BOOL v6 = v33 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
      uint64_t v7 = airdrop_log(v5);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10012445C((uint64_t)&v33, v8, v9, v10, v11, v12, v13, v14);
      }
      unsigned __int8 v15 = 0;
      goto LABEL_21;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0LL));

    id v32 = 0LL;
    int v19 = SFAppleIDCommonNameForCertificate(v18, &v32);
    uint64_t v20 = (os_log_s *)v32;
    int v8 = v20;
    int v33 = v19;
    if (v19)
    {
      uint64_t v21 = airdrop_log(v20);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1001243F4((uint64_t)&v33, v22, v23, v24, v25, v26, v27, v28);
      }
    }

    else
    {
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDCommonName](self->_monitor, "myAppleIDCommonName"));
      if (-[os_log_s length](v22, "length"))
      {
        unsigned __int8 v15 = -[os_log_s isEqualToString:](v8, "isEqualToString:", v22);
        goto LABEL_20;
      }

      uint64_t v30 = airdrop_log(0LL);
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1001243C8();
      }
    }

    unsigned __int8 v15 = 0;
LABEL_20:

LABEL_21:
LABEL_22:

    return v15;
  }

  return 0;
}

- (void)silentlyCancelRequestOnMainThread
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012047C;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)convertURLStringsToURLs
{
  uint64_t v3 = kSFOperationItemsKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsKey));
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cuFilteredArrayUsingBlock:&stru_1005CEC80]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v5, v3);

    id v4 = v6;
  }
}

- (void)parseDiscoverRequest
{
  CFErrorRef error = 0LL;
  uint64_t v3 = (__CFError *)CFPropertyListCreateWithData(0LL, (CFDataRef)self->_requestData, 0LL, 0LL, &error);
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    uint64_t v7 = airdrop_log(TypeID);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = v8;
    if (v5 == TypeID)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Parsing Discover request",  (uint8_t *)&v13,  2u);
      }

      -[SDAirDropConnection storeDataValue:forKey:](self, "storeDataValue:forKey:", v4, kSFOperationSenderRecordDataKey);
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100124524();
      }
    }

    CFErrorRef v12 = v4;
  }

  else
  {
    uint64_t v10 = airdrop_log(0LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001244C4();
    }

    CFErrorRef v12 = error;
  }

  CFRelease(v12);
}

- (void)handleDiscoverRequest
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderRecordDataKey));
  id v4 = sub_100035F84(v3, self->_clientTrust, 0LL);
  CFTypeID v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    unsigned int v6 = 0;
    int v7 = 0;
    goto LABEL_17;
  }

  if (-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS")) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = -[SDAirDropConnection senderIsTrusted:](self, "senderIsTrusted:", v5);
  }
  unsigned int v8 = -[SDAirDropConnection senderIsBlocked](self, "senderIsBlocked");
  unsigned int v9 = v8;
  int v7 = 0;
  if (!v6 || (v8 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v10 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
  if (v10)
  {
    CFRelease(v10);
    int v7 = 1;
LABEL_10:
    if (!v9) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }

  int v7 = 0;
  if (!v9) {
    goto LABEL_17;
  }
LABEL_11:
  BOOL v11 = -[SDAirDropConnection senderIsMe](self, "senderIsMe");
  if (!v11)
  {
    int v14 = v6 & v7;
    uint64_t v15 = 401LL;
    goto LABEL_18;
  }

  uint64_t v12 = airdrop_log(v11);
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFDataRef v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sender is me, ignore self block.", v17, 2u);
  }

LABEL_17:
  int v14 = v6 & v7;
  uint64_t v15 = 200LL;
LABEL_18:
  if (v14) {
    uint64_t v16 = v5;
  }
  else {
    uint64_t v16 = 0LL;
  }
  -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:](self, "sendDiscoverResponse:forKnownAlias:", v15, v16);
}

- (void)parseAskRequest
{
  CFErrorRef error = 0LL;
  uint64_t v3 = (__CFError *)CFPropertyListCreateWithData(0LL, (CFDataRef)self->_requestData, 0LL, 0LL, &error);
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    uint64_t v7 = airdrop_log(TypeID);
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = v8;
    if (v5 == TypeID)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Parsing Ask request", (uint8_t *)&v13, 2u);
      }

      -[SDAirDropConnection storeArrayValue:forKey:](self, "storeArrayValue:forKey:", v4, kSFOperationFilesKey);
      -[SDAirDropConnection storeArrayValue:forKey:](self, "storeArrayValue:forKey:", v4, kSFOperationItemsKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationBundleIDKey);
      -[SDAirDropConnection storeStringValue:forKey:](self, "storeStringValue:forKey:", v4, kSFOperationSenderIDKey);
      -[SDAirDropConnection storeDataValue:forKey:](self, "storeDataValue:forKey:", v4, kSFOperationSenderRecordDataKey);
      -[SDAirDropConnection storeIconValue:forKey:](self, "storeIconValue:forKey:", v4, kSFOperationFileIconKey);
      -[SDAirDropConnection storeIconValue:forKey:](self, "storeIconValue:forKey:", v4, kSFOperationSmallFileIconKey);
      -[SDAirDropConnection storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v4,  kSFOperationSenderModelNameKey);
      -[SDAirDropConnection storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v4,  kSFOperationItemsDescriptionKey);
      -[SDAirDropConnection storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v4,  kSFOperationSenderComputerNameKey);
      -[SDAirDropConnection convertURLStringsToURLs](self, "convertURLStringsToURLs");
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100124524();
      }
    }

    CFErrorRef v12 = v4;
  }

  else
  {
    uint64_t v10 = airdrop_log(0LL);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001244C4();
    }

    CFErrorRef v12 = error;
  }

  CFRelease(v12);
}

- (BOOL)allowAskRequestFromPerson:(__SFNode *)a3
{
  if (!a3)
  {
    uint64_t v7 = airdrop_log(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100124550();
    }
    goto LABEL_6;
  }

  id v4 = (os_log_s *)SFNodeCopyAppleID(a3);
  BOOL v5 = -[SDStatusMonitor disableTLS](self->_monitor, "disableTLS");
  if (!v5)
  {
    if (v4)
    {
      BOOL v6 = -[SDAirDropConnection senderIsTrusted:](self, "senderIsTrusted:", v4);
      goto LABEL_9;
    }

    if (self->_contactsOnly)
    {
      uint64_t v9 = airdrop_log(v5);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10012457C();
      }

LABEL_6:
      BOOL v6 = 0;
      goto LABEL_9;
    }
  }

  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)transferContainsPhotosAssetBundles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFilesKey));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = kSFOperationFileTypeKey;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "objectForKeyedSubscript:",  v7,  (void)v13));
        char v10 = SFIsPhotosAssetBundle();

        if ((v10 & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)adjustPropertiesForAutoAcceptSenderIsMe:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[SDStatusMonitor disableAutoAccept](self->_monitor, "disableAutoAccept");
  monitor = self->_monitor;
  if (v5)
  {
    -[SDStatusMonitor disableAutoAcceptForPhotosAssetBundles](monitor, "disableAutoAcceptForPhotosAssetBundles");
    return;
  }

  unsigned int v7 = -[SDStatusMonitor alwaysAutoAccept](monitor, "alwaysAutoAccept") || v3;
  unsigned int v8 = -[SDStatusMonitor disableAutoAcceptForPhotosAssetBundles]( self->_monitor,  "disableAutoAcceptForPhotosAssetBundles");
  if (v7 != 1 || v8 == 0)
  {
    if (!v7) {
      return;
    }
LABEL_15:
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSFOperationAutoAcceptKey);
    return;
  }

  BOOL v10 = -[SDAirDropConnection transferContainsPhotosAssetBundles](self, "transferContainsPhotosAssetBundles");
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = airdrop_log(v10);
  CFErrorRef v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "SDAirDropConnection: Prevented auto-accept because transfer contains All Photos Data Photos bundles.",  v13,  2u);
  }
}

- (void)adjustPropertiesForPhotosBundles
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = self;
  uint64_t v15 = kSFOperationFilesKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = kSFOperationFileTypeKey;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);
        if (SFIsPhotosAssetBundle())
        {
          id v12 = [v10 mutableCopy];
          __int128 v13 = v12;
          __int128 v14 = @"com.apple.photos.asset-bundle";
LABEL_8:
          [v12 setObject:v14 forKeyedSubscript:v8];
          -[NSMutableArray addObject:](v3, "addObject:", v13);

          goto LABEL_13;
        }

        if (SFIsLivePhotos(v11) && [v11 isEqualToString:kUTTypeFolder])
        {
          id v12 = [v10 mutableCopy];
          __int128 v13 = v12;
          __int128 v14 = @"com.apple.private.live-photo-bundle";
          goto LABEL_8;
        }

        -[NSMutableArray addObject:](v3, "addObject:", v10);
LABEL_13:
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v16->_properties, "setObject:forKeyedSubscript:", v3, v15);
}

- (void)handleAskRequest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIDKey));
  if (v3)
  {
    uint64_t v4 = kSFOperationFilesKey;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFilesKey));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsKey));
    if ([v5 count] || objc_msgSend(v6, "count"))
    {
      uint64_t v7 = -[SDAirDropConnection createPersonForAskRequest](self, "createPersonForAskRequest");
      self->_person = v7;
      BOOL v8 = -[SDAirDropConnection allowAskRequestFromPerson:](self, "allowAskRequestFromPerson:", v7);
      if (v8)
      {
        BOOL v9 = -[SDAirDropConnection senderIsMe](self, "senderIsMe");
        if (-[SDStatusMonitor finderAirDropEnabled](self->_monitor, "finderAirDropEnabled"))
        {
          self->_personAdded = 1;
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](&OBJC_CLASS___SDConnectedBrowser, "sharedBrowser"));
          [v10 addAirDropPerson:self->_person];
          double v11 = 0.3;
        }

        else
        {
          BOOL v10 = (void *)SFNodeCopyIconData(self->_person);
          if (!v10)
          {
            BOOL v10 = sub_100034B30(0LL, 0LL, 0LL, 0LL);
            if (!v10)
            {
              double v11 = 0.0;
              goto LABEL_16;
            }
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v10,  kSFOperationSenderIconKey);
          double v11 = 0.0;
        }

LABEL_16:
        Name = (void *)SFNodeCopyLastName(self->_person);
        __int128 v17 = (void *)SFNodeCopyFirstName(self->_person);
        __int128 v18 = (void *)SFNodeCopyDisplayName(self->_person);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  Name,  kSFOperationSenderLastNameKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v17,  kSFOperationSenderFirstNameKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v18,  kSFOperationSenderCompositeNameKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  self->_person,  kSFOperationSenderNodeKey);
        -[SDAirDropConnection adjustPropertiesForAutoAcceptSenderIsMe:]( self,  "adjustPropertiesForAutoAcceptSenderIsMe:",  v9);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v19,  kSFOperationSenderIsMeKey);

        -[SDAirDropConnection adjustPropertiesForPhotosBundles](self, "adjustPropertiesForPhotosBundles");
        dispatch_time_t v20 = sub_100114580(v11);
        queue = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10012127C;
        block[3] = &unk_1005CB2F8;
        void block[4] = self;
        dispatch_after(v20, queue, block);
        id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  v4));
        if (![v22 count]) {
          -[SDAirDropConnection releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
        }

        goto LABEL_22;
      }

      uint64_t v14 = airdrop_log(v8);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100124600();
      }
    }

    else
    {
      uint64_t v23 = airdrop_log(0LL);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1001245D4();
      }
    }

    -[SDAirDropConnection silentlyCancelRequestOnMainThread](self, "silentlyCancelRequestOnMainThread");
LABEL_22:

    goto LABEL_23;
  }

  uint64_t v12 = airdrop_log(0LL);
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1001245A8();
  }

  -[SDAirDropConnection silentlyCancelRequestOnMainThread](self, "silentlyCancelRequestOnMainThread");
LABEL_23:
}

- (void)cancelAndDecline
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:");
  if (self->_discoverRequest)
  {
    -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:](self, "sendDiscoverResponse:forKnownAlias:", 500LL, 0LL);
  }

  else
  {
    -[SDAirDropConnection sendAskResponse:](self, "sendAskResponse:", 500LL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
  }
}

- (void)processRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    connection = self->_connection;

    if (connection)
    {
      if (!self->_clientTrust) {
        self->_clientTrust = (__SecTrust *)_CFHTTPServerConnectionCopyProperty( self->_connection,  _kCFHTTPServerConnectionClientTrust);
      }
      if (self->_discoverRequest)
      {
        -[SDAirDropConnection parseDiscoverRequest](self, "parseDiscoverRequest");
        -[SDAirDropConnection handleDiscoverRequest](self, "handleDiscoverRequest");
        return;
      }

      -[SDAirDropConnection parseAskRequest](self, "parseAskRequest");
      -[SDAirDropConnection handleAskRequest](self, "handleAskRequest");
      goto LABEL_10;
    }
  }

  if (!self->_discoverRequest) {
LABEL_10:
  }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
}

- (void)handleReadStreamEvent:(__CFReadStream *)a3 event:(unint64_t)a4
{
  if (a4 == 16)
  {
    if (self->_endEncountered)
    {
      uint64_t v7 = airdrop_log(self);
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SDAirDropConnection: kCFStreamEventEndEncountered fired again",  v18,  2u);
      }
    }

    else
    {
      self->_endEncountered = 1;
      -[SDAirDropConnection processRequest](self, "processRequest", a3);
    }

    return;
  }

  if (a4 == 8)
  {
LABEL_6:
    -[SDAirDropConnection cancelAndDecline](self, "cancelAndDecline", a3);
    return;
  }

  if (a4 != 2)
  {
    uint64_t v9 = airdrop_log(self);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10012462C(a4, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_13;
  }

  CFIndex v6 = CFReadStreamRead(a3, (UInt8 *)self->_requestBuffer, 0x8000LL);
  if (v6 < 1)
  {
    if ((v6 & 0x8000000000000000LL) == 0) {
      return;
    }
    uint64_t v17 = airdrop_log(v6);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100124690();
    }
LABEL_13:

    -[SDAirDropConnection cancelAndDecline](self, "cancelAndDecline");
    return;
  }

  -[NSMutableData appendBytes:length:](self->_requestData, "appendBytes:length:", self->_requestBuffer, v6);
  if (-[NSMutableData length](self->_requestData, "length") > 0x100000) {
    goto LABEL_6;
  }
}

- (BOOL)startReceivingBody:(_CFHTTPServerRequest *)a3 error:(id *)a4
{
  CFIndex v6 = (__CFReadStream *)_CFHTTPServerRequestCopyBodyStream(a3, a2);
  self->_readStream = v6;
  if (!v6)
  {
    uint64_t v13 = airdrop_log(0LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001246F0();
    }

    if (!a4) {
      return 0;
    }
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    BOOL v9 = 0;
    goto LABEL_11;
  }

  uint64_t v7 = v6;
  self->_requestBuffer = (char *)malloc(0x8000uLL);
  clientContext.version = 0LL;
  clientContext.info = self;
  clientContext.retain = (void *(__cdecl *)(void *))&_CFRetain;
  clientContext.release = (void (__cdecl *)(void *))&_CFRelease;
  clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
  CFReadStreamSetClient(v7, 0x1AuLL, (CFReadStreamClientCallBack)sub_100121694, &clientContext);
  CFReadStreamSetDispatchQueue(self->_readStream, (dispatch_queue_t)self->_queue);
  uint64_t v8 = CFReadStreamOpen(self->_readStream);
  BOOL v9 = (_DWORD)v8 != 0;
  if (!(_DWORD)v8)
  {
    uint64_t v10 = airdrop_log(v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10012471C();
    }

    if (a4)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  12LL,  0LL));
LABEL_11:
      *a4 = v12;
    }
  }

  return v9;
}

- (id)compressionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  @"Content-Type"));
  if ([v2 isEqual:@"application/zip"])
  {
    id v3 = off_1005CEA18;
  }

  else if ([v2 isEqual:@"application/x-cpio"])
  {
    id v3 = off_1005CEA10;
  }

  else
  {
    if (![v2 isEqual:@"application/x-dvzip"])
    {
      uint64_t v4 = 0LL;
      goto LABEL_8;
    }

    id v3 = off_1005CEA20;
  }

  uint64_t v4 = *v3;
LABEL_8:

  return v4;
}

- (BOOL)startReceivingFile:(_CFHTTPServerRequest *)a3 error:(id *)a4
{
  uint64_t v6 = _CFHTTPServerRequestCopyBodyStream(a3, a2);
  if (v6)
  {
    uint64_t v7 = (const void *)v6;
    destination = self->_destination;
    BOOL v9 = destination != 0LL;
    if (destination)
    {
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___SDAirDropFileZipper);
      zipper = self->_zipper;
      self->_zipper = v10;

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropConnection whereFromInfo](self, "whereFromInfo"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      -[SDAirDropFileZipper setSenderName:](self->_zipper, "setSenderName:", v13);

      -[SDAirDropFileZipper setShouldExtractMediaFromPhotosBundles:]( self->_zipper,  "setShouldExtractMediaFromPhotosBundles:",  -[SDAirDropConnection shouldExtractMediaFromPhotosBundles](self, "shouldExtractMediaFromPhotosBundles"));
      id location = 0LL;
      objc_initWeak(&location, self);
      uint64_t v14 = self->_zipper;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFilesKey));
      uint64_t v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472LL;
      uint64_t v26 = sub_100121A18;
      uint64_t v27 = &unk_1005CE4C8;
      objc_copyWeak(&v28, &location);
      -[SDAirDropFileZipper setPlaceholderFiles:withCreationCompletionHandler:]( v14,  "setPlaceholderFiles:withCreationCompletionHandler:",  v15,  &v24);

      uint64_t v16 = self->_zipper;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey,  v24,  v25,  v26,  v27));
      -[SDAirDropFileZipper setTotalBytes:](v16, "setTotalBytes:", v17);

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropConnection compressionType](self, "compressionType"));
      -[SDAirDropFileZipper setUnzipCompressionType:](self->_zipper, "setUnzipCompressionType:", v18);

      -[SDAirDropFileZipper setDestination:](self->_zipper, "setDestination:", self->_destination);
      -[SDAirDropFileZipper setReadStream:](self->_zipper, "setReadStream:", v7);
      -[SDAirDropFileZipper setDelegate:](self->_zipper, "setDelegate:", self);
      -[SDAirDropFileZipper unzip](self->_zipper, "unzip");
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v21 = airdrop_log(v6);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100124748();
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
      }
    }

    CFRelease(v7);
  }

  else
  {
    uint64_t v19 = airdrop_log(0LL);
    dispatch_time_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1001246F0();
    }

    BOOL v9 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    }
  }

  return v9;
}

- (BOOL)thereIsEnoughFreeSpace
{
  if (-[SDStatusMonitor testDiskFull](self->_monitor, "testDiskFull")) {
    return 0;
  }
  propertyValueTypeRefPtr = 0LL;
  CFErrorRef error = 0LL;
  uint64_t v4 = CFURLCopyResourcePropertyForKey( (CFURLRef)self->_destination,  kCFURLVolumeAvailableCapacityKey,  &propertyValueTypeRefPtr,  &error);
  if (!(_DWORD)v4)
  {
    uint64_t v8 = airdrop_log(v4);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100124774();
    }

    CFRelease(error);
    return 1;
  }

  if (!propertyValueTypeRefPtr) {
    return 1;
  }
  uint64_t valuePtr = 0LL;
  if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 longLongValue];
      BOOL v3 = valuePtr > (uint64_t)v7 + 20971520;
    }

    else
    {
      BOOL v3 = 1;
    }
  }

  else
  {
    BOOL v3 = 1;
  }

  CFRelease(propertyValueTypeRefPtr);
  return v3;
}

- (BOOL)senderInfoAvailable
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIDKey));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderComputerNameKey));
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)silentlyCancelRequest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  89LL,  0LL));
  uint64_t v5 = kSFOperationErrorKey;
  uint64_t v6 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  -[SDAirDropConnection notifyClient:withResults:](self, "notifyClient:withResults:", 10LL, v4);
}

- (void)enqueueResponse:(_CFHTTPServerRequest *)a3 code:(int64_t)a4 body:(__CFData *)a5
{
  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage(a3, a4);
  BOOL v9 = ResponseMessage;
  if (a4 != 100) {
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Connection", @"close");
  }
  uint64_t v10 = (const void *)_CFHTTPServerResponseCreateWithData(a3, v9, a5);
  _CFHTTPServerResponseEnqueue();
  CFRelease(v10);
  CFRelease(v9);
}

- (BOOL)oneHundredContinue:(_CFHTTPServerRequest *)a3
{
  BOOL v3 = (const void *)_CFHTTPServerRequestCopyProperty(a3, @"Expect");
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  BOOL v5 = CFEqual(v3, @"100-continue") != 0;
  CFRelease(v4);
  return v5;
}

- (void)makeDestinationDirectory
{
  id v3 = sub_100115790();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:self->_sessionID isDirectory:1]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"Files" isDirectory:1]);

  NSFileAttributeKey v17 = NSFileProtectionKey;
  NSFileProtectionType v18 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v16 = 0LL;
  unsigned int v10 = [v9 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v8 error:&v16];
  id v11 = v16;

  if (v10)
  {
    uint64_t v13 = v7;
    destination = self->_destination;
    self->_destination = v13;
  }

  else
  {
    uint64_t v15 = airdrop_log(v12);
    destination = (NSURL *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)destination, OS_LOG_TYPE_ERROR)) {
      sub_1001247D4();
    }
  }
}

- (void)enqueueBadResponseForRequest:(_CFHTTPServerRequest *)a3
{
  if (!self->_discoverRequest)
  {
    if (self->_uploadRequest)
    {
      uint64_t v7 = airdrop_log(self);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10012488C();
      }
      goto LABEL_7;
    }

    uint64_t v8 = sub_100122038((uint64_t)a3);
    uint64_t v9 = CFEqual(v8, @"Upload");
    if ((_DWORD)v9)
    {
      uint64_t v10 = airdrop_log(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100124860();
      }
    }

    else
    {
      if (!self->_askRequest)
      {
LABEL_16:
        CFRelease(v8);
        goto LABEL_8;
      }

      uint64_t v12 = airdrop_log(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100124834();
      }
    }

    goto LABEL_16;
  }

  uint64_t v5 = airdrop_log(self);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1001248B8();
  }
LABEL_7:

LABEL_8:
  -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400LL, 0LL);
}

- (void)didReceiveRequest:(_CFHTTPServerRequest *)a3
{
  uint64_t v5 = (const void *)_CFHTTPServerRequestCopyProperty(a3, _kCFHTTPServerRequestMethod);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = CFEqual(v5, @"POST");
    if ((_DWORD)v7)
    {
      uint64_t v8 = sub_100122038((uint64_t)a3);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v37 = 0LL;
        v38 = &v37;
        uint64_t v39 = 0x3032000000LL;
        v40 = sub_100122520;
        v41 = sub_100122530;
        id v42 = 0LL;
        if (CFEqual(v8, @"Discover"))
        {
          self->_discover = 1;
          if (!self->_discoverRequest && !self->_askRequest && !self->_uploadRequest)
          {
            uint64_t v10 = (_CFHTTPServerRequest *)CFRetain(a3);
            self->_discoverRequest = v10;
            uint64_t v11 = airdrop_log(v10);
            uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received Discover request", buf, 2u);
            }

            uint64_t v13 = (id *)(v38 + 5);
            id obj = (id)v38[5];
            unsigned __int8 v14 = -[SDAirDropConnection startReceivingBody:error:](self, "startReceivingBody:error:", a3, &obj);
            objc_storeStrong(v13, obj);
            if ((v14 & 1) == 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v38[5],  kSFOperationErrorKey);
              -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:]( self,  "sendDiscoverResponse:forKnownAlias:",  500LL,  0LL);
            }

            goto LABEL_32;
          }
        }

        else if (CFEqual(v9, @"Ask"))
        {
          if (!self->_discoverRequest && !self->_askRequest && !self->_uploadRequest)
          {
            self->_transactionStarted = 1;
            -[SDAirDropConnection makeDestinationDirectory](self, "makeDestinationDirectory");
            -[SDStatusMonitor airDropTransactionBegin:](self->_monitor, "airDropTransactionBegin:", 0LL);
            dispatch_time_t v20 = (_CFHTTPServerRequest *)CFRetain(a3);
            self->_askRequest = v20;
            uint64_t v21 = airdrop_log(v20);
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received Ask request", buf, 2u);
            }

            uint64_t v23 = (id *)(v38 + 5);
            id v34 = (id)v38[5];
            unsigned __int8 v24 = -[SDAirDropConnection startReceivingBody:error:](self, "startReceivingBody:error:", a3, &v34);
            objc_storeStrong(v23, v34);
            if ((v24 & 1) == 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v38[5],  kSFOperationErrorKey);
              -[SDAirDropConnection sendAskResponse:](self, "sendAskResponse:", 500LL);
              dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
            }

            goto LABEL_32;
          }
        }

        else
        {
          uint64_t v25 = CFEqual(v9, @"Upload");
          if (!(_DWORD)v25)
          {
            uint64_t v26 = airdrop_log(v25);
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_100124968();
            }

            -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400LL, 0LL);
            goto LABEL_32;
          }

          if (!self->_discoverRequest && !self->_uploadRequest && (self->_askRequest || self->_userAccepted))
          {
            id v28 = (_CFHTTPServerRequest *)CFRetain(a3);
            self->_uploadRequest = v28;
            uint64_t v29 = airdrop_log(v28);
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received Upload request", buf, 2u);
            }

            dispatch_queue_global_t v31 = sub_100114658();
            id v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v31);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100122538;
            block[3] = &unk_1005CECA8;
            void block[4] = self;
            void block[5] = &v37;
            block[6] = a3;
            dispatch_async(v32, block);

            goto LABEL_32;
          }
        }

        -[SDAirDropConnection enqueueBadResponseForRequest:](self, "enqueueBadResponseForRequest:", a3);
LABEL_32:
        CFRelease(v9);
        _Block_object_dispose(&v37, 8);

        goto LABEL_33;
      }

      uint64_t v19 = airdrop_log(0LL);
      NSFileProtectionType v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10012493C();
      }
    }

    else
    {
      uint64_t v17 = airdrop_log(v7);
      NSFileProtectionType v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100124910();
      }
    }

    -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400LL, 0LL);
LABEL_33:
    CFRelease(v6);
    return;
  }

  uint64_t v15 = airdrop_log(0LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1001248E4();
  }

  -[SDAirDropConnection enqueueResponse:code:body:](self, "enqueueResponse:code:body:", a3, 400LL, 0LL);
}

- (int64_t)getStatusCode:(_CFHTTPServerResponse *)a3
{
  id v3 = (__CFHTTPMessage *)_CFHTTPServerResponseCopyProperty(a3, _kCFHTTPServerResponseMessage);
  if (!v3) {
    return -1LL;
  }
  uint64_t v4 = v3;
  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(v3);
  CFRelease(v4);
  return ResponseStatusCode;
}

- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  usleep(0x186A0u);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100122A24;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)finishOperation
{
  self->_delayedFinish = 1;
  dispatch_queue_global_t v3 = sub_100114658();
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100122AF0;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)didSendResponse:(_CFHTTPServerResponse *)a3 forRequest:(_CFHTTPServerRequest *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    int64_t v8 = -[SDAirDropConnection getStatusCode:](self, "getStatusCode:", a3);
    if (v8 == 400)
    {
      -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
      return;
    }

    int64_t v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationErrorKey));

    if (v10)
    {
      -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10LL);
      return;
    }

    uint64_t v11 = (const void *)_CFHTTPServerRequestCopyProperty(a4, _kCFHTTPServerRequestMethod);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = CFEqual(v11, @"POST");
      if ((_DWORD)v13)
      {
        unsigned __int8 v14 = sub_100122038((uint64_t)a4);
        if (v14)
        {
          uint64_t v15 = v14;
          if (CFEqual(v14, @"Ask"))
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFilesKey));
            if ([v16 count])
            {
              self->_startTime = CFAbsoluteTimeGetCurrent();
              -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 5LL);
              -[NSMutableDictionary removeObjectForKey:]( self->_properties,  "removeObjectForKey:",  kSFOperationSmallFileIconKey);
              -[NSMutableDictionary removeObjectForKey:]( self->_properties,  "removeObjectForKey:",  kSFOperationFileIconKey);
            }

            else
            {
              -[SDAirDropConnection finishOperation](self, "finishOperation");
            }
          }

          else if (CFEqual(v15, @"Upload"))
          {
            if (v9 != 100) {
              -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 9LL);
            }
          }

          else
          {
            uint64_t v22 = CFEqual(v15, @"Discover");
            if (!(_DWORD)v22)
            {
              uint64_t v23 = airdrop_log(v22);
              unsigned __int8 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                sub_100124A70();
              }
            }

            -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
          }

          CFRelease(v15);
          goto LABEL_28;
        }

        uint64_t v21 = airdrop_log(0LL);
        dispatch_time_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100124A44();
        }
      }

      else
      {
        uint64_t v19 = airdrop_log(v13);
        dispatch_time_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100124A18();
        }
      }

      -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
LABEL_28:
      CFRelease(v12);
      return;
    }

    uint64_t v17 = airdrop_log(0LL);
    NSFileProtectionType v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001249EC();
    }

    -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
  }

  else if (self->_stopDeferred)
  {
    -[SDAirDropConnection stop](self, "stop");
  }

- (void)didFailToSendResponse:(_CFHTTPServerResponse *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (a3)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationErrorKey));

      if (v6) {
        -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10LL);
      }
      else {
        -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
      }
    }
  }

  else if (self->_stopDeferred)
  {
    -[SDAirDropConnection stop](self, "stop");
  }

- (void)handleClosedConnection
{
  if (self->_delayedFinish)
  {
    dispatch_queue_global_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIDKey));
    uint64_t v4 = airdrop_log(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100124A9C();
    }
  }

  else
  {
    -[SDAirDropConnection stop](self, "stop");
    BOOL v6 = -[SDAirDropConnection senderInfoAvailable](self, "senderInfoAvailable");
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSenderIDKey));
      uint64_t v8 = airdrop_log(v7);
      int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Connection from %@ closed",  (uint8_t *)&v12,  0xCu);
      }

      -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 4LL);
    }

    else
    {
      uint64_t v10 = airdrop_log(v6);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Connection closed (cancel suppressed)",  (uint8_t *)&v12,  2u);
      }

      -[SDAirDropConnection silentlyCancelRequest](self, "silentlyCancelRequest");
    }
  }

- (id)whereFromInfo
{
  dispatch_queue_global_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)SFNodeCopyDisplayName(self->_person);
  uint64_t v5 = (void *)SFNodeCopyComputerName(self->_person);
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }

  return v3;
}

- (void)setCombinedFileURLsAndItems:(id)a3
{
  id v7 = a3;
  uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = kSFOperationItemsKey;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsKey));
  if (v6) {
    -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v6);
  }
  -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v4, v5);
}

- (BOOL)transferIsOverPrebufferLimit
{
  if (self->_userAccepted) {
    return 0;
  }
  dispatch_queue_global_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationBytesCopiedKey));
  BOOL v2 = (uint64_t)[v3 longLongValue] > 629145600;

  return v2;
}

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5
{
  id v8 = a3;
  switch(a4)
  {
    case 10LL:
      id v13 = v8;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  a5,  kSFOperationErrorKey);
      uint64_t v11 = self;
      uint64_t v12 = 500LL;
LABEL_8:
      -[SDAirDropConnection sendUploadResponse:](v11, "sendUploadResponse:", v12);
LABEL_9:
      id v8 = v13;
      break;
    case 9LL:
      id v13 = v8;
      -[SDAirDropConnection setSpotlightMetadata:](self, "setSpotlightMetadata:", a5);
      -[SDAirDropConnection setCombinedFileURLsAndItems:](self, "setCombinedFileURLsAndItems:", a5);
      uint64_t v11 = self;
      uint64_t v12 = 200LL;
      goto LABEL_8;
    case 7LL:
      id v13 = v8;
      sub_10003603C((__CFDictionary *)self->_properties, (CFDictionaryRef)a5);
      -[SDAirDropConnection storeNumberValue:forKey:](self, "storeNumberValue:forKey:", a5, kSFOperationBytesCopiedKey);
      -[SDAirDropConnection storeNumberValue:forKey:]( self,  "storeNumberValue:forKey:",  a5,  kSFOperationTimeRemainingKey);
      if (-[SDAirDropConnection transferIsOverPrebufferLimit](self, "transferIsOverPrebufferLimit"))
      {
        id v9 = sub_100036584(-2, 0LL);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_properties,  "setObject:forKeyedSubscript:",  v10,  kSFOperationErrorKey);
        -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 10LL);
      }

      else
      {
        id v8 = v13;
        if (self->_startTime == 0.0) {
          break;
        }
        -[SDAirDropConnection notifyClientForEvent:](self, "notifyClientForEvent:", 7LL);
      }

      goto LABEL_9;
  }
}

+ (id)disambiguatedModelName
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  dispatch_queue_global_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 modelName]);

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", @"Mac"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 modelCode]);

    if (([v5 isEqualToString:@"Mac13,1"] & 1) != 0
      || [v5 isEqualToString:@"Mac13,2"])
    {

      dispatch_queue_global_t v3 = @"Mac mini";
    }

    if ([v5 isEqualToString:@"Mac14,2"])
    {

      dispatch_queue_global_t v3 = @"MacBook Air";
    }

    if ([v5 isEqualToString:@"Mac14,7"])
    {

      dispatch_queue_global_t v3 = @"MacBook Pro";
    }
  }

  return v3;
}

- (void)schedule
{
  connection = self->_connection;
  CFRunLoopRef Main = CFRunLoopGetMain();
  _CFHTTPServerConnectionScheduleWithRunLoopAndMode(connection, Main, kCFRunLoopDefaultMode);
}

- (void)start
{
  dispatch_queue_global_t v3 = (OS_os_transaction *)os_transaction_create("SDAirDropConnection");
  transaction = self->_transaction;
  self->_transaction = v3;

  uint64_t v5 = sub_10003617C();
  self->_unsigned int powerAssertionID = v5;
  uint64_t v6 = airdrop_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int powerAssertionID = self->_powerAssertionID;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = powerAssertionID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Power assertion retained (%d)", buf, 8u);
  }

  v9[0] = 0LL;
  v9[1] = self;
  void v9[2] = &_CFRetain;
  v9[3] = &_CFRelease;
  v9[4] = 0LL;
  *(_OWORD *)buf = unk_1005CECC8;
  __int128 v11 = *(_OWORD *)off_1005CECD8;
  __int128 v12 = *(_OWORD *)&off_1005CECE8;
  sub_100034524(self->_connection, self);
  _CFHTTPServerConnectionSetClient(self->_connection, v9, buf);
  _CFHTTPServerConnectionSetProperty(self->_connection, _kCFHTTPServerConnectionMaxRequestBufferSize, &off_1005F7A08);
}

- (BOOL)accept
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001237C8;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (void)stop
{
  askRequest = self->_askRequest;
  if (!askRequest)
  {
    discoverRequest = self->_discoverRequest;
    if (!discoverRequest) {
      goto LABEL_8;
    }
    if (!self->_connectionClosed)
    {
      self->_stopDeferred = 1;
      -[SDAirDropConnection sendDiscoverResponse:forKnownAlias:]( self,  "sendDiscoverResponse:forKnownAlias:",  401LL,  0LL);
      goto LABEL_27;
    }

- (BOOL)contactsOnly
{
  return self->_contactsOnly;
}

- (void)setContactsOnly:(BOOL)a3
{
  self->_contactsOnly = a3;
}

- (NSURL)destination
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDestination:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3
{
  self->_shouldExtractMediaFromPhotosBundles = a3;
}

- (SDAirDropConnectionDelegate)delegate
{
  return (SDAirDropConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end