@interface IDSRemoteURLConnectionDaemonIDSInterface
+ (id)sharedInstance;
- (BOOL)isNearby;
- (BOOL)sendIDSMessage:(id)a3 forLoaderWithUniqueID:(id)a4;
- (IDSRemoteURLConnectionDaemonIDSInterface)init;
- (void)_handleCancelMessage:(id)a3;
- (void)_handleLoadRequestMessage:(id)a3;
- (void)_handleLoadRequestResponseMessage:(id)a3;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
@end

@implementation IDSRemoteURLConnectionDaemonIDSInterface

+ (id)sharedInstance
{
  if (qword_1000159A0 != -1) {
    dispatch_once(&qword_1000159A0, &stru_100010770);
  }
  return (id)qword_1000159A8;
}

- (IDSRemoteURLConnectionDaemonIDSInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSRemoteURLConnectionDaemonIDSInterface;
  v2 = -[IDSRemoteURLConnectionDaemonIDSInterface init](&v6, "init");
  if (v2)
  {
    v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.idsremoteurlconnection");
    idsService = v2->_idsService;
    v2->_idsService = v3;

    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, &_dispatch_main_q);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSRemoteURLConnectionDaemonIDSInterface;
  -[IDSRemoteURLConnectionDaemonIDSInterface dealloc](&v3, "dealloc");
}

- (BOOL)isNearby
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v6 isDefaultPairedDevice])
        {
          LOBYTE(v3) = [v6 isNearby];
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)sendIDSMessage:(id)a3 forLoaderWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = JWEncodeDictionary(v6);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 _CUTCopyGzippedData];
  __int128 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionarySetValue((CFMutableDictionaryRef)v11, IDSSendMessageOptionLocalDeliveryKey, &__kCFBooleanTrue);
  CFDictionarySetValue((CFMutableDictionaryRef)v11, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
  idsService = self->_idsService;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice));
  id v25 = 0LL;
  id v26 = 0LL;
  unsigned int v14 = -[IDSService sendData:toDestinations:priority:options:identifier:error:]( idsService,  "sendData:toDestinations:priority:options:identifier:error:",  v10,  v13,  300LL,  v11,  &v26,  &v25);
  id v15 = v26;
  id v16 = v25;

  uint64_t v17 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = @"NO";
    if (v14) {
      v19 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v28 = v6;
    __int16 v29 = 2112;
    v30 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Sending message to local account (messageDict %@) success: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v20)
    && _IDSShouldLog(1LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Sending message to local account (messageDict %@) success: %@");
  }

  char v21 = v14 ^ 1;
  if (!v7) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    if (!self->_messageIDToLoaderUniqueIDMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      messageIDToLoaderUniqueIDMap = self->_messageIDToLoaderUniqueIDMap;
      self->_messageIDToLoaderUniqueIDMap = Mutable;
    }

    CFDictionarySetValue((CFMutableDictionaryRef)self->_messageIDToLoaderUniqueIDMap, v15, v7);
  }

  return v14;
}

- (void)_handleLoadRequestMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v66 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received load request message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    id v43 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Received load request message: %@");
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", IDSRemoteURLConnectionKeyRequest, v43));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeyTryForceCellular]);
  unsigned __int8 v48 = [v8 BOOLValue];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeyRequireIDSHost]);
  unsigned __int8 v10 = [v9 BOOLValue];

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeyVersion]);
  int v12 = [v11 intValue];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionShouldUsePipelining]);
  unsigned __int8 v47 = [v13 BOOLValue];

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionConcurrentConnections]);
  unsigned int v46 = [v14 intValue];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionDisableKeepAlive]);
  unsigned __int8 v45 = [v15 BOOLValue];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeepAliveWifi]);
  unsigned int v44 = [v16 intValue];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeepAliveCell]);
  unsigned int v18 = [v17 intValue];

  if (v12 <= 0)
  {
    uint64_t v19 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "We received a request from a local device which did not have a request version specified, we will not allow this to require IDS host",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v21)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"We received a request from a local device which did not have a request version specified, we will not allow this to require IDS host");
    }

    unsigned __int8 v10 = 0;
  }

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSURLRequest);
  uint64_t v23 = JWDecodeKeyedCodableObjectWithSecureCoding(v49, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  if (v24)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeyDataUsageBundleIdentifier]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSRemoteURLConnectionKeyUniqueID]);
    pendingResponseUniqueIDs = self->_pendingResponseUniqueIDs;
    if (!pendingResponseUniqueIDs)
    {
      id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int16 v29 = self->_pendingResponseUniqueIDs;
      self->_pendingResponseUniqueIDs = v28;

      pendingResponseUniqueIDs = self->_pendingResponseUniqueIDs;
    }

    -[NSMutableSet addObject:](pendingResponseUniqueIDs, "addObject:", v26);
    uint64_t v30 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_pendingResponseUniqueIDs;
      *(_DWORD *)buf = 138412546;
      id v66 = v26;
      __int16 v67 = 2112;
      v68 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Added uniqueID %@ to _pendingResponseUniqueIDs. New map: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v33)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Added uniqueID %@ to _pendingResponseUniqueIDs. New map: %@");
    }

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_100008BB0;
    v61[3] = &unk_100010798;
    v61[4] = self;
    id v62 = v26;
    id v34 = v24;
    id v63 = v34;
    id v35 = v25;
    id v64 = v35;
    id v36 = v26;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100009830;
    v50[3] = &unk_1000107C0;
    id v52 = v35;
    id v53 = [v61 copy];
    unsigned __int8 v57 = v48;
    id v51 = v34;
    unsigned __int8 v58 = v10;
    unsigned __int8 v59 = v47;
    unsigned __int8 v60 = v45;
    unsigned int v54 = v46;
    unsigned int v55 = v44;
    unsigned int v56 = v18;
    id v37 = v35;
    id v38 = v53;
    im_dispatch_after_primary_queue(v50, v39, 0.0);
  }

  else
  {
    uint64_t v40 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Unable to decode request -- ignoring! {message: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v42)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Unable to decode request -- ignoring! {message: %@}");
    }
  }
}

- (void)_handleLoadRequestResponseMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received load request response message: %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    id v28 = v3;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Received load request response message: %@");
  }

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", IDSRemoteURLConnectionKeyHeaders, v28));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSRemoteURLConnectionKeyURL]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSRemoteURLConnectionKeyHTTPVersion]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSRemoteURLConnectionKeyResponseStatusCode]);
  id v8 = [v7 integerValue];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSRemoteURLConnectionKeyResultData]);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSRemoteURLConnectionKeyResponseError]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v11 = JWDecodeKeyedCodableObjectWithSecureCoding(v33, v10);
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v13 = JWDecodeKeyedCodableObjectWithSecureCoding(v32, v12);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v16 = JWDecodeKeyedCodableObjectWithSecureCoding(v9, v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:IDSRemoteURLConnectionKeyUniqueID]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 urlLoaderForUniqueID:v18]);

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 block]);
    uint64_t v22 = (void (**)(id, id, id, void *, void *, void))[v21 copy];

    if (v22)
    {
      uint64_t v23 = -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( objc_alloc(&OBJC_CLASS___NSHTTPURLResponse),  "initWithURL:statusCode:HTTPVersion:headerFields:",  v14,  v8,  v31,  v29);
      v22[2](v22, v23, v8, v30, v17, 0LL);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
    [v24 removeURLLoaderForUniqueID:v18];
  }

  else
  {
    uint64_t v25 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v18;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No URLLoader for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v27)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"No URLLoader for uniqueID %@");
    }
  }
}

- (void)_handleCancelMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received cancel message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    id v15 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Received cancel message: %@");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", IDSRemoteURLConnectionKeyUniqueID, v15));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 urlLoaderForUniqueID:v8]);

  if (v10)
  {
    [v10 cancel];
  }

  else
  {
    uint64_t v11 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No URLLoader for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v16 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"No URLLoader for uniqueID %@");
    }
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance",  v16));
  [v14 removeURLLoaderForUniqueID:v8];

  -[NSMutableSet removeObject:](self->_pendingResponseUniqueIDs, "removeObject:", v8);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    id v40 = v15;
    __int16 v41 = 2112;
    id v42 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "incomingData on service %@, account %@ data %@ fromID %@ context %@",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v19)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    id v31 = v15;
    id v32 = v16;
    id v29 = v13;
    id v30 = v14;
    id v28 = v12;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"incomingData on service %@, account %@ data %@ fromID %@ context %@");
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_CUTOptionallyDecompressData", v28, v29, v30, v31, v32));
  uint64_t v21 = JWDecodeDictionary();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:IDSRemoteURLConnectionKeyCommand]);
  unsigned int v24 = [v23 unsignedIntValue];

  switch(v24)
  {
    case 3u:
      -[IDSRemoteURLConnectionDaemonIDSInterface _handleCancelMessage:](self, "_handleCancelMessage:", v22);
      break;
    case 2u:
      -[IDSRemoteURLConnectionDaemonIDSInterface _handleLoadRequestResponseMessage:]( self,  "_handleLoadRequestResponseMessage:",  v22);
      break;
    case 1u:
      -[IDSRemoteURLConnectionDaemonIDSInterface _handleLoadRequestMessage:](self, "_handleLoadRequestMessage:", v22);
      break;
    default:
      uint64_t v25 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v34) = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Unknown command %d, ignoring...", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled(v27)
        && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Unknown command %d, ignoring...");
      }

      break;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = a7;
  uint64_t v16 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = @"NO";
    if (v8) {
      id v18 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v41 = v14;
    __int16 v42 = 2112;
    id v43 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "didSendWithSuccess %@ success %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v19)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    uint64_t v20 = @"NO";
    if (v8) {
      uint64_t v20 = @"YES";
    }
    __int16 v35 = v14;
    id v36 = v20;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"didSendWithSuccess %@ success %@");
  }

  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_messageIDToLoaderUniqueIDMap,  "objectForKey:",  v14,  v35,  v36));
  -[NSMutableDictionary removeObjectForKey:](self->_messageIDToLoaderUniqueIDMap, "removeObjectForKey:", v14);
  if (-[__CFString length](v21, "length"))
  {
    if (v8)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_10000A674;
      v37[3] = &unk_1000107E8;
      id v38 = v21;
      __int16 v39 = v14;
      im_dispatch_after_primary_queue(v37, v22, 20.0);
    }

    else
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 urlLoaderForUniqueID:v21]);

      if (v27)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 block]);
        id v29 = [v28 copy];

        if (v29)
        {
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSRemoteURLConnectionErrorDomain,  1LL,  0LL));
          (*((void (**)(id, void, void, void, void *, void))v29 + 2))(v29, 0LL, 0LL, 0LL, v30, 0LL);
        }

        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance"));
        [v31 removeURLLoaderForUniqueID:v21];
      }

      else
      {
        uint64_t v32 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v41 = v21;
          __int16 v42 = 2112;
          id v43 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "No URLLoader for uniqueID %@ message ID %@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v34)
          && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"No URLLoader for uniqueID %@ message ID %@");
        }
      }
    }
  }

  else
  {
    uint64_t v23 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v41 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Did not find loader ID for identifier %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v25)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Did not find loader ID for identifier %@");
    }
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = a3;
  __int128 v9 = (NSMutableSet *)a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didSwitchActivePairedDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v13)
    && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
  {
    uint64_t v19 = v9;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"didSwitchActivePairedDevice %@");
  }

  if (-[NSMutableSet count](self->_pendingResponseUniqueIDs, "count", v19))
  {
    uint64_t v14 = OSLogHandleForIDSCategory("IDSRemoteURLConnectionDaemonIDSInterface");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      pendingResponseUniqueIDs = self->_pendingResponseUniqueIDs;
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = pendingResponseUniqueIDs;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Dropping all pending responses for previously active watch. _pendingResponseUniqueIDs: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v17)
      && _IDSShouldLog(0LL, @"IDSRemoteURLConnectionDaemonIDSInterface"))
    {
      uint64_t v20 = self->_pendingResponseUniqueIDs;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonIDSInterface",  @"Dropping all pending responses for previously active watch. _pendingResponseUniqueIDs: %@");
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRemoteURLConnectionDaemon sharedInstance]( &OBJC_CLASS___IDSRemoteURLConnectionDaemon,  "sharedInstance",  v20));
    [v18 removeURLLoadersForUniqueIDs:self->_pendingResponseUniqueIDs];

    -[NSMutableSet removeAllObjects](self->_pendingResponseUniqueIDs, "removeAllObjects");
  }

  v10[2](v10);
}

- (void).cxx_destruct
{
}

@end