@interface IDSOTRController
+ (IDSOTRController)sharedInstance;
- (BOOL)hasMessagableOTRSessionForToken:(id)a3;
- (BOOL)isSessionNegotiating:(id)a3;
- (BOOL)isSessionReady:(id)a3;
- (BOOL)serializeSession:(_SecOTRSession *)a3 token:(id)a4;
- (IDSOTRController)init;
- (_SecMPPublicIdentity)copyPairedDevicePublicIdentityWithDataProtectionClass:(unsigned int)a3;
- (_SecOTRSession)_cachedSessionForToken:(id)a3;
- (_SecOTRSession)copySessionForToken:(id)a3;
- (double)sessionStartTimeWithToken:(id)a3;
- (id)copyOTRTestBlock:(id)a3;
- (id)copySessionObjectForToken:(id)a3;
- (unsigned)sessionNegotiationCount:(id)a3;
- (void)_cacheSession:(_SecOTRSession *)a3 token:(id)a4;
- (void)_kickoffOTRNegotiationWithDevice:(id)a3 token:(id)a4 negotiationData:(id)a5;
- (void)_onQueueStartOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6;
- (void)_reportOTRTestResult:(id)a3 setupTime:(double)a4 result:(unsigned __int8)a5;
- (void)addOTRSessionBlock:(unsigned __int8)a3 sessionBlock:(id)a4 key:(id)a5;
- (void)performOTRSessionBlock:(unsigned __int8)a3 token:(id)a4;
- (void)processNegotiationData:(id)a3 deviceUniqueID:(id)a4 token:(id)a5 negotiationCount:(unsigned int)a6;
- (void)removeAllCachedSessionsFromMainQueue;
- (void)resetAllSessions;
- (void)resumeSessionNegotiation;
- (void)setOTRTestBlockFromCompletionBlock:(id)a3 token:(id)a4;
- (void)setSessionNegotiationComplete:(id)a3;
- (void)setSessionNegotiationStart:(id)a3;
- (void)setSessionReady:(id)a3;
- (void)setupNewSessionInfoWithToken:(id)a3;
- (void)startOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6;
- (void)suspendSessionNegotiation:(id)a3 askedByPairedDevice:(BOOL)a4;
@end

@implementation IDSOTRController

+ (IDSOTRController)sharedInstance
{
  if (qword_1009C07C8 != -1) {
    dispatch_once(&qword_1009C07C8, &stru_1008FF128);
  }
  return (IDSOTRController *)(id)qword_1009C07D0;
}

- (IDSOTRController)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSOTRController;
  v2 = -[IDSOTRController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0LL);
    v4 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    storageLock = v3->_storageLock;
    v3->_storageLock = v4;
  }

  return v3;
}

- (void)addOTRSessionBlock:(unsigned __int8)a3 sessionBlock:(id)a4 key:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    pthread_mutex_lock(&self->_lock);
    if (v6 == 2)
    {
      priorityToTimeoutBlocks = self->_priorityToTimeoutBlocks;
      if (!priorityToTimeoutBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v21 = self->_priorityToTimeoutBlocks;
        self->_priorityToTimeoutBlocks = Mutable;

        priorityToTimeoutBlocks = self->_priorityToTimeoutBlocks;
      }

      id v22 = [v8 copy];
      -[NSMutableDictionary setObject:forKey:](priorityToTimeoutBlocks, "setObject:forKey:", v22, v9);

      uint64_t v23 = OSLogHandleForTransportCategory("OTRController");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (NSMutableDictionary *)objc_retainBlock(v8);
        *(_DWORD *)buf = 134218242;
        v46 = v25;
        __int16 v47 = 2112;
        id v48 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "add OTR timeout block %p key %@.",  buf,  0x16u);
      }

      uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
      if ((_DWORD)v27)
      {
        if (_IDSShouldLogTransport(v27))
        {
          id v43 = objc_retainBlock(v8);
          _IDSLogTransport(@"OTRController", @"IDS", @"add OTR timeout block %p key %@.");

          if (_IDSShouldLog(0LL, @"OTRController"))
          {
            id v44 = objc_retainBlock(v8);
            _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"add OTR timeout block %p key %@.");
          }
        }
      }
    }

    else if (v6 == 1)
    {
      priorityToCompletionBlocks = self->_priorityToCompletionBlocks;
      if (!priorityToCompletionBlocks)
      {
        v11 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v12 = self->_priorityToCompletionBlocks;
        self->_priorityToCompletionBlocks = v11;

        priorityToCompletionBlocks = self->_priorityToCompletionBlocks;
      }

      id v13 = [v8 copy];
      -[NSMutableDictionary setObject:forKey:](priorityToCompletionBlocks, "setObject:forKey:", v13, v9);

      uint64_t v14 = OSLogHandleForTransportCategory("OTRController");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (NSMutableDictionary *)objc_retainBlock(v8);
        *(_DWORD *)buf = 134218242;
        v46 = v16;
        __int16 v47 = 2112;
        id v48 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "add OTR completion block %p key %@.",  buf,  0x16u);
      }

      uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
      if ((_DWORD)v18)
      {
        if (_IDSShouldLogTransport(v18))
        {
          id v41 = objc_retainBlock(v8);
          _IDSLogTransport(@"OTRController", @"IDS", @"add OTR completion block %p key %@.");

          if (_IDSShouldLog(0LL, @"OTRController"))
          {
            id v42 = objc_retainBlock(v8);
            _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"add OTR completion block %p key %@.");
          }
        }
      }
    }

    else
    {
      uint64_t v28 = OSLogHandleForIDSCategory("Warning");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "addOTRSessionBlock: invalid sessionBlock type %d.",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v30))
      {
        _IDSWarnV(@"IDSFoundation", @"addOTRSessionBlock: invalid sessionBlock type %d.");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"addOTRSessionBlock: invalid sessionBlock type %d.");
        _IDSLogTransport(@"Warning", @"IDS", @"addOTRSessionBlock: invalid sessionBlock type %d.");
      }
    }

    uint64_t v31 = OSLogHandleForTransportCategory("OTRController");
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self->_priorityToCompletionBlocks;
      *(_DWORD *)buf = 138412290;
      v46 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "_priorityToCompletionBlocks after ADD %@",  buf,  0xCu);
    }

    uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
    if ((_DWORD)v35)
    {
      if (_IDSShouldLogTransport(v35))
      {
        _IDSLogTransport(@"OTRController", @"IDS", @"_priorityToCompletionBlocks after ADD %@");
        if (_IDSShouldLog(0LL, @"OTRController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"_priorityToCompletionBlocks after ADD %@");
        }
      }
    }

    uint64_t v36 = OSLogHandleForTransportCategory("OTRController");
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = self->_priorityToTimeoutBlocks;
      *(_DWORD *)buf = 138412290;
      v46 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "_priorityToTimeoutBlocks after ADD %@",  buf,  0xCu);
    }

    uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
    if ((_DWORD)v40)
    {
      if (_IDSShouldLogTransport(v40))
      {
        _IDSLogTransport(@"OTRController", @"IDS", @"_priorityToTimeoutBlocks after ADD %@");
      }
    }

    pthread_mutex_unlock(&self->_lock);
  }
}

- (void)performOTRSessionBlock:(unsigned __int8)a3 token:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  uint64_t v7 = sub_100265CB0(v6);
  id v8 = (NSMutableDictionary *)v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary componentsSeparatedByString:](v8, "componentsSeparatedByString:", @"-"));
  if ((unint64_t)[v9 count] > 3)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSString);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:3]);
    id v13 = -[NSString initWithString:](v14, "initWithString:", v15);

    if ((unint64_t)[v9 count] >= 5)
    {
      unint64_t v16 = 4LL;
      do
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", @"_"));

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v16]);
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:v18]);

        ++v16;
      }

      while ((unint64_t)[v9 count] > v16);
    }
  }

  else
  {
    uint64_t v10 = OSLogHandleForIDSCategory("Warning");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "_connectionIDFromToken: invalid OTR token %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12))
    {
      _IDSWarnV(@"IDSFoundation", @"_connectionIDFromToken: invalid OTR token %@");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"_connectionIDFromToken: invalid OTR token %@");
      v51 = v8;
      _IDSLogTransport(@"Warning", @"IDS", @"_connectionIDFromToken: invalid OTR token %@");
    }

    id v13 = &stru_100912B50;
  }

  if (-[__CFString length](v13, "length")) {
    v19 = v13;
  }
  else {
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7));
  }
  v20 = (NSMutableDictionary *)v19;
  uint64_t v21 = OSLogHandleForTransportCategory("OTRController");
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Key to find blocks %@", buf, 0xCu);
  }

  uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
  if ((_DWORD)v24)
  {
    if (_IDSShouldLogTransport(v24))
    {
      v51 = v20;
      _IDSLogTransport(@"OTRController", @"IDS", @"Key to find blocks %@");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        v51 = v20;
        _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Key to find blocks %@");
      }
    }
  }

  uint64_t v25 = OSLogHandleForTransportCategory("OTRController");
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    priorityToCompletionBlocks = self->_priorityToCompletionBlocks;
    *(_DWORD *)buf = 138412290;
    v62 = priorityToCompletionBlocks;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "_priorityToCompletionBlocks after PERFORM %@",  buf,  0xCu);
  }

  uint64_t v29 = os_log_shim_legacy_logging_enabled(v28);
  if ((_DWORD)v29)
  {
    if (_IDSShouldLogTransport(v29))
    {
      v51 = self->_priorityToCompletionBlocks;
      _IDSLogTransport(@"OTRController", @"IDS", @"_priorityToCompletionBlocks after PERFORM %@");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        v51 = self->_priorityToCompletionBlocks;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"_priorityToCompletionBlocks after PERFORM %@");
      }
    }
  }

  uint64_t v30 = OSLogHandleForTransportCategory("OTRController");
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    priorityToTimeoutBlocks = self->_priorityToTimeoutBlocks;
    *(_DWORD *)buf = 138412290;
    v62 = priorityToTimeoutBlocks;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "_priorityToTimeoutBlocks after PERFORM %@",  buf,  0xCu);
  }

  uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
  if ((_DWORD)v34)
  {
    if (_IDSShouldLogTransport(v34))
    {
      v51 = self->_priorityToTimeoutBlocks;
      _IDSLogTransport(@"OTRController", @"IDS", @"_priorityToTimeoutBlocks after PERFORM %@");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        v51 = self->_priorityToTimeoutBlocks;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"_priorityToTimeoutBlocks after PERFORM %@");
      }
    }
  }

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v4 == 1)
  {
    uint64_t v36 = 12LL;
  }

  else
  {
    if (v4 != 2) {
      goto LABEL_46;
    }
    uint64_t v36 = 13LL;
  }

  id v37 = (id)objc_claimAutoreleasedReturnValue(-[objc_class objectForKey:]((&self->super.isa)[v36], "objectForKey:", v20, v51));
  if (v37)
  {
    uint64_t v38 = OSLogHandleForTransportCategory("OTRController");
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v62 = v8;
      __int16 v63 = 1024;
      int v64 = v4;
      __int16 v65 = 2048;
      uint64_t v66 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "performOTRSessionBlock for %@ (blockType:%d priority:%ld).",  buf,  0x1Cu);
    }

    uint64_t v41 = os_log_shim_legacy_logging_enabled(v40);
    if ((_DWORD)v41)
    {
      if (_IDSShouldLogTransport(v41))
      {
        _IDSLogTransport( @"OTRController",  @"IDS",  @"performOTRSessionBlock for %@ (blockType:%d priority:%ld).");
        if (_IDSShouldLog(0LL, @"OTRController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"performOTRSessionBlock for %@ (blockType:%d priority:%ld).");
        }
      }
    }

    switch(v7)
    {
      case 100LL:
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_100267208;
        v52[3] = &unk_1008F6358;
        id v37 = v37;
        id v54 = v37;
        v53 = v8;
        [v46 performBlockSyncPriority:v52];

        break;
      case 200LL:
        __int16 v47 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_1002671F8;
        v55[3] = &unk_1008F6358;
        id v37 = v37;
        id v57 = v37;
        v56 = v8;
        [v47 performBlockDefaultPriority:v55];

        break;
      case 300LL:
        id v42 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472LL;
        v58[2] = sub_1002671E8;
        v58[3] = &unk_1008F6358;
        id v37 = v37;
        id v60 = v37;
        v59 = v8;
        [v42 performBlockUrgentPriority:v58];

        break;
      default:
        uint64_t v48 = OSLogHandleForIDSCategory("Warning");
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "performOTRSessionBlock found no block for %@ due to invalid priority.",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v50))
        {
          _IDSWarnV( @"IDSFoundation",  @"performOTRSessionBlock found no block for %@ due to invalid priority.");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"performOTRSessionBlock found no block for %@ due to invalid priority.");
          _IDSLogTransport( @"Warning",  @"IDS",  @"performOTRSessionBlock found no block for %@ due to invalid priority.");
        }

        break;
    }

    goto LABEL_51;
  }

- (void)setupNewSessionInfoWithToken:(id)a3
{
  id v9 = a3;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v6 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  uint64_t v7 = (IDSOTRSessionInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v9));
  if (v7)
  {
    id v8 = v7;
    -[IDSOTRSessionInfo setIsNegotiating:](v7, "setIsNegotiating:", 0LL);
    -[IDSOTRSessionInfo setIsReady:](v8, "setIsReady:", 0LL);
    -[IDSOTRSessionInfo setLastStartTime:](v8, "setLastStartTime:", 0.0);
    -[IDSOTRSessionInfo removeNegotiationTimer](v8, "removeNegotiationTimer");
  }

  else
  {
    id v8 = -[IDSOTRSessionInfo initWithToken:](objc_alloc(&OBJC_CLASS___IDSOTRSessionInfo), "initWithToken:", v9);
    -[NSMutableDictionary setObject:forKey:](self->_sessionInfoToToken, "setObject:forKey:", v8, v9);
  }

  pthread_mutex_unlock(&self->_lock);
}

- (void)setSessionReady:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  id v9 = (IDSOTRSessionInfo *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  uint64_t v10 = v9;
  if (v9)
  {
    if (!-[IDSOTRSessionInfo isNegotiating](v9, "isNegotiating") && !-[IDSOTRSessionInfo isReady](v10, "isReady"))
    {
      -[IDSOTRSessionInfo setIsReady:](v10, "setIsReady:", 1LL);
      uint64_t v11 = OSLogHandleForTransportCategory("OTRController");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Enable OTR session for %@.", buf, 0xCu);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
LABEL_15:
          _IDSLogTransport(@"OTRController", @"IDS", @"Enable OTR session for %@.");
          if ((_IDSShouldLog(0LL, @"OTRController") & 1) != 0) {
            _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Enable OTR session for %@.");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v10 = -[IDSOTRSessionInfo initWithToken:](objc_alloc(&OBJC_CLASS___IDSOTRSessionInfo), "initWithToken:", v4);
    -[IDSOTRSessionInfo setIsReady:](v10, "setIsReady:", 1LL);
    -[NSMutableDictionary setObject:forKey:](self->_sessionInfoToToken, "setObject:forKey:", v10, v4);
    uint64_t v15 = OSLogHandleForTransportCategory("OTRController");
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Enable OTR session for %@.", buf, 0xCu);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  }

  pthread_mutex_unlock(p_lock);
}

- (double)sessionStartTimeWithToken:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 lastStartTime];
    double v12 = v11;
  }

  else
  {
    double v12 = 0.0;
  }

  pthread_mutex_unlock(p_lock);

  return v12;
}

- (void)setSessionNegotiationStart:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  uint64_t v10 = v9;
  if (v9)
  {
    if (([v9 isNegotiating] & 1) == 0)
    {
      [v10 lastStartTime];
      if (v11 == 0.0)
      {
        unsigned int v12 = [v10 negotiationCount];
        if (v12 == 0x7FFFFFFF) {
          uint64_t v13 = 1LL;
        }
        else {
          uint64_t v13 = v12 + 1;
        }
        uint64_t v14 = OSLogHandleForTransportCategory("OTRController");
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v4;
          __int16 v27 = 1024;
          int v28 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "### OTR session negotiation started for %@, count:%08x.",  buf,  0x12u);
        }

        uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
        if ((_DWORD)v17)
        {
          if (_IDSShouldLogTransport(v17))
          {
            id v22 = v4;
            uint64_t v24 = v13;
            _IDSLogTransport( @"OTRController",  @"IDS",  @"### OTR session negotiation started for %@, count:%08x.");
            if (_IDSShouldLog(0LL, @"OTRController"))
            {
              id v22 = v4;
              uint64_t v24 = v13;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"### OTR session negotiation started for %@, count:%08x.");
            }
          }
        }

        objc_msgSend(v10, "setIsNegotiating:", 1, v22, v24);
        if ([v10 isReady])
        {
          [v10 setIsReady:0];
          uint64_t v18 = OSLogHandleForTransportCategory("OTRController");
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Disable OTR session for %@.",  buf,  0xCu);
          }

          uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
          if ((_DWORD)v21)
          {
            if (_IDSShouldLogTransport(v21))
            {
              id v23 = v4;
              _IDSLogTransport(@"OTRController", @"IDS", @"Disable OTR session for %@.");
              if (_IDSShouldLog(0LL, @"OTRController"))
              {
                id v23 = v4;
                _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Disable OTR session for %@.");
              }
            }
          }
        }

        objc_msgSend(v10, "setLastStartTime:", ids_monotonic_time(objc_msgSend(v10, "setIsSuspended:", 0, v23)));
        [v10 setNegotiationTimer];
        [v10 setNegotiationCount:v13];
      }
    }
  }

  pthread_mutex_unlock(p_lock);
}

- (void)setSessionNegotiationComplete:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v7 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  id v9 = v8;
  if (!v8)
  {
    uint64_t v15 = OSLogHandleForTransportCategory("OTRController");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "### Resume OTR session for %@.", buf, 0xCu);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        id v19 = v4;
        _IDSLogTransport(@"OTRController", @"IDS", @"### Resume OTR session for %@.");
        if (_IDSShouldLog(0LL, @"OTRController"))
        {
          id v19 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"### Resume OTR session for %@.");
        }
      }
    }

    pthread_mutex_unlock(&self->_lock);
    goto LABEL_19;
  }

  [v8 setIsNegotiating:0];
  unsigned __int8 v10 = [v9 isReady];
  [v9 setIsSuspended:0];
  [v9 setLastStartTime:0.0];
  [v9 removeNegotiationTimer];
  uint64_t v11 = OSLogHandleForTransportCategory("OTRController");
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "### OTR session negotiation finished for %@.",  buf,  0xCu);
  }

  uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
  if ((_DWORD)v14)
  {
    if (_IDSShouldLogTransport(v14))
    {
      id v19 = v4;
      _IDSLogTransport(@"OTRController", @"IDS", @"### OTR session negotiation finished for %@.");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        id v19 = v4;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"### OTR session negotiation finished for %@.");
      }
    }
  }

  pthread_mutex_unlock(&self->_lock);
  if ((v10 & 1) == 0) {
LABEL_19:
  }
    -[IDSOTRController performOTRSessionBlock:token:](self, "performOTRSessionBlock:token:", 1LL, v4, v19);
}

- (void)suspendSessionNegotiation:(id)a3 askedByPairedDevice:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = OSLogHandleForTransportCategory("OTRController");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Suspend OTR session negotiation", buf, 2u);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      _IDSLogTransport(@"OTRController", @"IDS", @"Suspend OTR session negotiation");
    }
  }

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v15 = self->_sessionInfoToToken;
    p_sessionInfoToToken = &self->_sessionInfoToToken;
    *p_sessionInfoToToken = (NSMutableDictionary *)Mutable;

    sessionInfoToToken = *p_sessionInfoToToken;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v6));
  uint64_t v17 = v16;
  if (v16)
  {
    [v16 setIsNegotiating:0];
    [v17 setIsReady:0];
    [v17 setIsSuspended:1];
    [v17 setLastStartTime:0.0];
    [v17 removeNegotiationTimer];
    uint64_t v18 = OSLogHandleForTransportCategory("OTRController");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "### OTR session negotiation suspended for %@.",  buf,  0xCu);
    }

    uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
    if ((_DWORD)v21)
    {
      if (_IDSShouldLogTransport(v21))
      {
        _IDSLogTransport(@"OTRController", @"IDS", @"### OTR session negotiation suspended for %@.");
        if (_IDSShouldLog(0LL, @"OTRController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"### OTR session negotiation suspended for %@.");
        }
      }
    }
  }

  pthread_mutex_unlock(p_lock);
  if (!a4)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
    [v22 sendSuspendOTRNegotiationMessage:v6];
  }
}

- (void)resumeSessionNegotiation
{
  uint64_t v3 = OSLogHandleForTransportCategory("OTRController");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Resume suspended OTR session negotiation",  buf,  2u);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      _IDSLogTransport(@"OTRController", @"IDS", @"Resume suspended OTR session negotiation");
    }
  }

  pthread_mutex_lock(&self->_lock);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sessionInfoToToken, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100268028;
  v8[3] = &unk_1008F7970;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
  pthread_mutex_unlock(&self->_lock);
}

- (void)resetAllSessions
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  uint64_t v4 = OSLogHandleForTransportCategory("OTRController");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=== Reset All OTR Sessions === ", v9, 2u);
  }

  uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
  if ((_DWORD)v7)
  {
    if (_IDSShouldLogTransport(v7))
    {
      _IDSLogTransport(@"OTRController", @"IDS", @"=== Reset All OTR Sessions === ");
    }
  }

  sessionInfoToToken = self->_sessionInfoToToken;
  self->_sessionInfoToToken = 0LL;

  pthread_mutex_unlock(p_lock);
}

- (BOOL)isSessionNegotiating:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  unsigned __int8 v10 = [v9 isNegotiating];
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (BOOL)isSessionReady:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  unsigned __int8 v10 = [v9 isReady];
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (unsigned)sessionNegotiationCount:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  sessionInfoToToken = self->_sessionInfoToToken;
  if (!sessionInfoToToken)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    id v8 = self->_sessionInfoToToken;
    self->_sessionInfoToToken = Mutable;

    sessionInfoToToken = self->_sessionInfoToToken;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sessionInfoToToken, "objectForKey:", v4));
  unsigned int v10 = [v9 negotiationCount];
  pthread_mutex_unlock(p_lock);

  return v10;
}

- (_SecOTRSession)copySessionForToken:(id)a3
{
  id v4 = (_SecOTRSession *)a3;
  if (v4)
  {
    -[NSRecursiveLock lock](self->_storageLock, "lock");
    uint64_t v5 = -[IDSOTRController _cachedSessionForToken:](self, "_cachedSessionForToken:", v4);
    if (v5)
    {
      uint64_t v6 = v5;
      CFRetain(v5);
      -[NSRecursiveLock unlock](self->_storageLock, "unlock");
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionKeyForToken:v4]);

      if (v8)
      {
        uint64_t v6 = (_SecOTRSession *)SecOTRSessionCreateFromData(kCFAllocatorDefault, v8);
        if (v6)
        {
          uint64_t v9 = OSLogHandleForTransportCategory("OTRController");
          unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            id v22 = v6;
            __int16 v23 = 2112;
            id v24 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Created new session %p using cached key for %@.",  buf,  0x16u);
          }

          uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
          if ((_DWORD)v12)
          {
            if (_IDSShouldLogTransport(v12))
            {
              id v19 = v6;
              uint64_t v20 = v4;
              _IDSLogTransport( @"OTRController",  @"IDS",  @"Created new session %p using cached key for %@.");
              if (_IDSShouldLog(0LL, @"OTRController"))
              {
                id v19 = v6;
                uint64_t v20 = v4;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"Created new session %p using cached key for %@.");
              }
            }
          }

          -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v4, v19, v20);
        }

        else
        {
          uint64_t v13 = OSLogHandleForTransportCategory("OTRController");
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SecOTRSessionCreateFromData failed, remove session key for %@.",  buf,  0xCu);
          }

          uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
          if ((_DWORD)v16)
          {
            if (_IDSShouldLogTransport(v16))
            {
              id v19 = v4;
              _IDSLogTransport( @"OTRController",  @"IDS",  @"SecOTRSessionCreateFromData failed, remove session key for %@.");
              if (_IDSShouldLog(0LL, @"OTRController"))
              {
                id v19 = v4;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"SecOTRSessionCreateFromData failed, remove session key for %@.");
              }
            }
          }

          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance", v19));
          [v17 removeSessionKeyForToken:v4];
        }

        -[IDSOTRController _cacheSession:token:](self, "_cacheSession:token:", v6, v4);
        -[NSRecursiveLock unlock](self->_storageLock, "unlock");
      }

      else
      {
        -[NSRecursiveLock unlock](self->_storageLock, "unlock");
        uint64_t v6 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (_SecOTRSession)_cachedSessionForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (_SecOTRSession *)-[NSMutableDictionary objectForKey:](self->_sessionStorage, "objectForKey:", v4);
    if (v5)
    {
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog OTRController](&OBJC_CLASS___IDSFoundationLog, "OTRController"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218498;
        uint64_t v9 = v5;
        __int16 v10 = 2112;
        uint64_t v11 = v5;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Found cached session %p: %@ for %@",  (uint8_t *)&v8,  0x20u);
      }
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)_cacheSession:(_SecOTRSession *)a3 token:(id)a4
{
  uint64_t v6 = (_SecOTRSession *)a4;
  if (v6)
  {
    -[NSRecursiveLock lock](self->_storageLock, "lock");
    if (!self->_sessionStorage)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      sessionStorage = self->_sessionStorage;
      self->_sessionStorage = Mutable;
    }

    uint64_t v9 = self->_sessionStorage;
    if (a3)
    {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", a3, v6);
      uint64_t v10 = OSLogHandleForIDSCategory("OTRController");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v20 = a3;
        __int16 v21 = 2112;
        id v22 = a3;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Storing cached session %p (%@) for %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v12)
        && _IDSShouldLog(0LL, @"OTRController"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Storing cached session %p (%@) for %@");
        -[NSRecursiveLock unlock](self->_storageLock, "unlock", a3, a3, v6);
        goto LABEL_16;
      }
    }

    else
    {
      -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);
      uint64_t v13 = OSLogHandleForIDSCategory("OTRController");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = 0LL;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removing cached session %p for %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v15)
        && _IDSShouldLog(0LL, @"OTRController"))
      {
        uint64_t v16 = 0LL;
        uint64_t v17 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Removing cached session %p for %@");
      }
    }

    -[NSRecursiveLock unlock](self->_storageLock, "unlock", v16, v17, v18);
  }

- (BOOL)serializeSession:(_SecOTRSession *)a3 token:(id)a4
{
  uint64_t v6 = (_SecOTRSession *)a4;
  if (v6)
  {
    if (a3)
    {
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      int v8 = SecOTRSAppendSerialization(a3, v7);
      BOOL v9 = v8 == 0;
      if (v8)
      {
        -[IDSOTRController _cacheSession:token:](self, "_cacheSession:token:", 0LL, v6);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
        [v10 removeSessionKeyForToken:v6];

        uint64_t v11 = OSLogHandleForIDSCategory("Warning");
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "serializeSession - failed to serialize data for session",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v13))
        {
          _IDSWarnV(@"IDSFoundation", @"serializeSession - failed to serialize data for session");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"serializeSession - failed to serialize data for session");
          _IDSLogTransport( @"Warning",  @"IDS",  @"serializeSession - failed to serialize data for session");
        }
      }

      else
      {
        uint64_t v22 = OSLogHandleForIDSCategory("OTRController");
        __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "serializeSession - updating session key in store",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v24)
          && _IDSShouldLog(0LL, @"OTRController"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"serializeSession - updating session key in store");
        }

        -[IDSOTRController _cacheSession:token:](self, "_cacheSession:token:", a3, v6);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
        [v25 storeSessionKey:v7 token:v6];
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("Warning");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "serializeSession - NULL session for token %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19))
      {
        _IDSWarnV(@"IDSFoundation", @"serializeSession - NULL session for token %@");
        _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"serializeSession - NULL session for token %@");
        __int16 v27 = v6;
        *(void *)&double v20 = _IDSLogTransport( @"Warning",  @"IDS",  @"serializeSession - NULL session for token %@").n128_u64[0];
      }

      -[IDSOTRController _cacheSession:token:](self, "_cacheSession:token:", 0LL, v6, v20, v27);
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
      [v21 removeSessionKeyForToken:v6];

      BOOL v9 = 1;
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "serializeSession - token nil for session %p.",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v16))
    {
      _IDSWarnV(@"IDSFoundation", @"serializeSession - token nil for session %p.");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"serializeSession - token nil for session %p.");
      _IDSLogTransport(@"Warning", @"IDS", @"serializeSession - token nil for session %p.");
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (id)copySessionObjectForToken:(id)a3
{
  uint64_t v3 = -[IDSOTRController copySessionForToken:](self, "copySessionForToken:", a3);
  id v4 = -[IDSSecOTRSession initWithSecOTRSessionRef:]( objc_alloc(&OBJC_CLASS___IDSSecOTRSession),  "initWithSecOTRSessionRef:",  v3);
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)removeAllCachedSessionsFromMainQueue
{
}

- (void)setOTRTestBlockFromCompletionBlock:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100269054;
  v11[3] = &unk_1008F7BD8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performAsyncBlock:v11 priority:sub_100265CB0(v10)];
}

- (id)copyOTRTestBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionInfoToToken, "objectForKey:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 otrTestBlock]);
  id v8 = [v7 copy];

  pthread_mutex_unlock(p_lock);
  id v9 = objc_retainBlock(v8);

  return v9;
}

- (void)_reportOTRTestResult:(id)a3 setupTime:(double)a4 result:(unsigned __int8)a5
{
  int v5 = a5;
  id v12 = a3;
  id v8 = (void (**)(void, void, void, double))objc_claimAutoreleasedReturnValue( -[IDSOTRController copyOTRTestBlock:]( self,  "copyOTRTestBlock:"));
  if (v8)
  {
    if (v5 == 3)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"No public key found for remote device",  NSLocalizedDescriptionKey));
      uint64_t v10 = 1LL;
    }

    else
    {
      if (v5 != 2)
      {
        uint64_t v11 = 0LL;
        goto LABEL_8;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Unable to create session from session data",  NSLocalizedDescriptionKey));
      uint64_t v10 = 0LL;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSOTR",  v10,  v9));

LABEL_8:
    ((void (**)(void, id, void *, double))v8)[2](v8, v12, v11, a4);
  }
}

- (void)processNegotiationData:(id)a3 deviceUniqueID:(id)a4 token:(id)a5 negotiationCount:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002693D4;
  v17[3] = &unk_1008FDFE0;
  v17[4] = self;
  id v18 = v12;
  unsigned int v21 = a6;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v13 performAsyncBlock:v17 priority:sub_100265CB0(v16)];
}

- (BOOL)hasMessagableOTRSessionForToken:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10026ADC8;
  v8[3] = &unk_1008FF150;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 performSyncBlock:v8 priority:sub_100265CB0(v6)];

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (_SecMPPublicIdentity)copyPairedDevicePublicIdentityWithDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 pairedDevicePublicClassAKey]);
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 pairedDevicePublicKey]);
    }
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 pairedDevicePublicClassCKey]);
  }

  id v6 = (void *)v5;

  if (!v6)
  {
    uint64_t v17 = OSLogHandleForTransportCategory("OTRController");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "copyPairedDevicePublicIdentityWithDataProtectionClass failed to get public key for data protection class %@",  buf,  0xCu);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        uint64_t v23 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(v23);
        _IDSLogTransport( @"OTRController",  @"IDS",  @"copyPairedDevicePublicIdentityWithDataProtectionClass failed to get public key for data protection class %@");

        if (_IDSShouldLog(0LL, @"OTRController"))
        {
          uint64_t v24 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(v24);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"copyPairedDevicePublicIdentityWithDataProtectionClass failed to get public key for data protection class %@");
        }
      }
    }

    goto LABEL_25;
  }

  CFTypeRef cf = 0LL;
  if (qword_1009C07E0 != -1) {
    dispatch_once(&qword_1009C07E0, &stru_1008FF170);
  }
  if (!off_1009C07D8)
  {
LABEL_25:
    id v7 = 0LL;
    goto LABEL_26;
  }

  id v7 = (_SecMPPublicIdentity *)off_1009C07D8(0LL, v6, &cf);
  if (cf)
  {
    uint64_t v8 = OSLogHandleForTransportCategory("OTRController");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFTypeRef v10 = cf;
      uint64_t v11 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412802;
      v32 = v6;
      __int16 v33 = 2112;
      CFTypeRef v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed creating public identity from data: %@  (Error: %@) (DataProtectionClass: %@)",  buf,  0x20u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        uint64_t v15 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
        int v28 = (void *)objc_claimAutoreleasedReturnValue(v15);
        _IDSLogTransport( @"OTRController",  @"IDS",  @"Failed creating public identity from data: %@  (Error: %@) (DataProtectionClass: %@)");

        if (_IDSShouldLog(0LL, @"OTRController"))
        {
          uint64_t v16 = IDSDataProtectionClassStringFromDataProtectionClass(v3);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v16);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"Failed creating public identity from data: %@  (Error: %@) (DataProtectionClass: %@)");
        }
      }
    }

    if (cf) {
      CFRelease(cf);
    }
  }

- (void)_kickoffOTRNegotiationWithDevice:(id)a3 token:(id)a4 negotiationData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[IDSOTRController setSessionNegotiationStart:](self, "setSessionNegotiationStart:", v9);
  uint64_t v11 = -[IDSOTRController sessionNegotiationCount:](self, "sessionNegotiationCount:", v9) | 0x80000000;
  uint64_t v12 = OSLogHandleForTransportCategory("OTRController");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v22 = [v10 length];
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 1024;
    int v26 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "  => will, send out OTR negotiation data %luB for %@, count:%08x.",  buf,  0x1Cu);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15)
  {
    if (_IDSShouldLogTransport(v15))
    {
      id v19 = v9;
      uint64_t v20 = v11;
      id v18 = [v10 length];
      _IDSLogTransport( @"OTRController",  @"IDS",  @"  => will, send out OTR negotiation data %luB for %@, count:%08x.");
      if (_IDSShouldLog(0LL, @"OTRController"))
      {
        id v16 = objc_msgSend(v10, "length", v18, v9, v11);
        id v19 = v9;
        uint64_t v20 = v11;
        id v18 = v16;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"  => will, send out OTR negotiation data %luB for %@, count:%08x.");
      }
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance", v18, v19, v20));
  [v17 sendOTRNegotiationMessage:v9 negotiationCount:v11 negotiationData:v10];
}

- (void)startOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSEncryptionController sharedInstance](&OBJC_CLASS___IDSEncryptionController, "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10026B748;
  v17[3] = &unk_1008F8788;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performAsyncBlock:v17 priority:sub_100265CB0(v15)];
}

- (void)_onQueueStartOTRNegotiationWithDeviceIfNeeded:(id)a3 token:(id)a4 reset:(BOOL)a5 errorHandler:(id)a6
{
  id v10 = (_SecOTRSession *)a3;
  id v11 = (_SecOTRSession *)a4;
  v121 = (void (**)(id, uint64_t))a6;
  id v12 = sub_100265B38(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ([v13 isEqualToString:@"idsotr"])
  {
    id v14 = (id)sub_10026AB54(v11);
    if (v14 >= 3)
    {
      uint64_t v15 = OSLogHandleForTransportCategory("OTRController");
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v124 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Invalid data protection class for token %@",  buf,  0xCu);
      }

      uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
      if ((_DWORD)v18)
      {
        if (_IDSShouldLogTransport(v18))
        {
          _IDSLogTransport(@"OTRController", @"IDS", @"Invalid data protection class for token %@");
          if (_IDSShouldLog(0LL, @"OTRController")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"Invalid data protection class for token %@");
          }
        }
      }

      goto LABEL_129;
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceWithPushTopic:v13]);

    if (!v20)
    {
      uint64_t v33 = OSLogHandleForTransportCategory("OTRController");
      CFTypeRef v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v124 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Failed to find service for token %@",  buf,  0xCu);
      }

      uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
      if ((_DWORD)v36)
      {
        if (_IDSShouldLogTransport(v36))
        {
          _IDSLogTransport(@"OTRController", @"IDS", @"Failed to find service for token %@");
        }
      }

      goto LABEL_129;
    }

    id v14 = [v20 dataProtectionClass];
  }

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  id v22 = [v21 latestCopyMessageProtectionIdentityForDataProtectionClass:v14];

  CFTypeRef cf = v22;
  if (!v22)
  {
    uint64_t v25 = OSLogHandleForTransportCategory("OTRController");
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = IDSDataProtectionClassStringFromDataProtectionClass(v14);
      int v28 = (_SecOTRSession *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138412290;
      v124 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Failed to get MP Identity for data protection class %@",  buf,  0xCu);
    }

    uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
    if ((_DWORD)v30)
    {
      if (_IDSShouldLogTransport(v30))
      {
        uint64_t v31 = IDSDataProtectionClassStringFromDataProtectionClass(v14);
        v114 = (_SecOTRSession *)objc_claimAutoreleasedReturnValue(v31);
        _IDSLogTransport( @"OTRController",  @"IDS",  @"Failed to get MP Identity for data protection class %@");

        if (_IDSShouldLog(0LL, @"OTRController"))
        {
          uint64_t v32 = IDSDataProtectionClassStringFromDataProtectionClass(v14);
          v114 = (_SecOTRSession *)objc_claimAutoreleasedReturnValue(v32);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"Failed to get MP Identity for data protection class %@");
        }
      }
    }

    -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v11, v114);
    -[IDSOTRController suspendSessionNegotiation:askedByPairedDevice:]( self,  "suspendSessionNegotiation:askedByPairedDevice:",  v11,  0LL);
    goto LABEL_129;
  }

  v119 = -[IDSOTRController copyPairedDevicePublicIdentityWithDataProtectionClass:]( self,  "copyPairedDevicePublicIdentityWithDataProtectionClass:",  v14);
  if (!v119)
  {
    uint64_t v37 = OSLogHandleForTransportCategory("OTRController");
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "We have no public key for remote device %@, can't start OTR negotiation!",  buf,  0xCu);
    }

    uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
    if ((_DWORD)v40)
    {
      if (_IDSShouldLogTransport(v40))
      {
        v114 = v10;
        _IDSLogTransport( @"OTRController",  @"IDS",  @"We have no public key for remote device %@, can't start OTR negotiation!");
        if (_IDSShouldLog(0LL, @"OTRController"))
        {
          v114 = v10;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"We have no public key for remote device %@, can't start OTR negotiation!");
        }
      }
    }

    -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v11, v114);
    -[IDSOTRController suspendSessionNegotiation:askedByPairedDevice:]( self,  "suspendSessionNegotiation:askedByPairedDevice:",  v11,  0LL);
    CFRelease(v22);
    goto LABEL_129;
  }

  __int16 v23 = -[IDSOTRController copySessionForToken:](self, "copySessionForToken:", v11);
  v118 = v23;
  if (v23) {
    int IsReadyForMessages = SecOTRSGetIsReadyForMessages(v23);
  }
  else {
    int IsReadyForMessages = 0;
  }
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[IDSOTRKeyStorage sharedInstance](&OBJC_CLASS___IDSOTRKeyStorage, "sharedInstance"));
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 sessionKeyForToken:v11]);

  uint64_t v43 = OSLogHandleForTransportCategory("OTRController");
  id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = @"NO";
    *(_DWORD *)buf = 138413058;
    v124 = v10;
    if (IsReadyForMessages) {
      v46 = @"YES";
    }
    else {
      v46 = @"NO";
    }
    if (v42) {
      uint64_t v45 = @"YES";
    }
    __int16 v125 = 2112;
    CFErrorRef v126 = (CFErrorRef)v119;
    __int16 v127 = 2112;
    v128 = v46;
    __int16 v129 = 2112;
    v130 = v45;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Peer: %@    public key: %@    has OTR session: %@    has session key: %@",  buf,  0x2Au);
  }

  uint64_t v48 = os_log_shim_legacy_logging_enabled(v47);
  if ((_DWORD)v48 && _IDSShouldLogTransport(v48))
  {
    v49 = IsReadyForMessages ? @"YES" : @"NO";
    uint64_t v50 = v42 ? @"YES" : @"NO";
    v116 = v49;
    v117 = v50;
    v114 = v10;
    CFErrorRef v115 = (CFErrorRef)v119;
    _IDSLogTransport( @"OTRController",  @"IDS",  @"Peer: %@    public key: %@    has OTR session: %@    has session key: %@");
    if (_IDSShouldLog(0LL, @"OTRController"))
    {
      v116 = v49;
      v117 = v50;
      v114 = v10;
      CFErrorRef v115 = (CFErrorRef)v119;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"OTRController",  @"Peer: %@    public key: %@    has OTR session: %@    has session key: %@");
    }
  }

  if (v42) {
    char v51 = 1;
  }
  else {
    char v51 = IsReadyForMessages;
  }
  if ((v51 & 1) == 0)
  {
    CFErrorRef err = 0LL;
    v56 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    uint64_t v57 = SecMPFullIdentityCreateOTRSessionWithFlags(cf, v119, 2LL, &err);
    v58 = (_SecOTRSession *)v57;
    if (v57)
    {
      uint64_t started = SecOTRSAppendStartPacket(v57, v56);
      if (!(_DWORD)started)
      {
        uint64_t v86 = OSLogHandleForTransportCategory("OTRController");
        v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v124 = v58;
          __int16 v125 = 2112;
          CFErrorRef v126 = (CFErrorRef)v11;
          _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "Created new OTR session %p for %@.",  buf,  0x16u);
        }

        uint64_t v89 = os_log_shim_legacy_logging_enabled(v88);
        if ((_DWORD)v89)
        {
          if (_IDSShouldLogTransport(v89))
          {
            v114 = v58;
            CFErrorRef v115 = (CFErrorRef)v11;
            _IDSLogTransport(@"OTRController", @"IDS", @"Created new OTR session %p for %@.");
            if (_IDSShouldLog(0LL, @"OTRController"))
            {
              v114 = v58;
              CFErrorRef v115 = (CFErrorRef)v11;
              _IDSLogV(0LL, @"IDSFoundation", @"OTRController", @"Created new OTR session %p for %@.");
            }
          }
        }

        -[IDSOTRController serializeSession:token:](self, "serializeSession:token:", v58, v11, v114, v115, v116, v117);
        -[IDSOTRController setupNewSessionInfoWithToken:](self, "setupNewSessionInfoWithToken:", v11);
        -[IDSOTRController _kickoffOTRNegotiationWithDevice:token:negotiationData:]( self,  "_kickoffOTRNegotiationWithDevice:token:negotiationData:",  v10,  v11,  v56);
        int v74 = 0;
LABEL_118:
        if (err)
        {
          CFRelease(err);
          CFErrorRef err = 0LL;
        }

        if (v58)
        {
          CFRelease(v58);

          if ((v74 & 1) == 0) {
            goto LABEL_127;
          }
        }

        else
        {

          if (!v74)
          {
LABEL_127:
            CFRelease(cf);
            CFRelease(v119);
            if (v118) {
              CFRelease(v118);
            }
            goto LABEL_129;
          }
        }

- (void).cxx_destruct
{
}

@end