@interface IDSUDPGlobalLink
- (BOOL)_processStunBindingRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunBindingResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunDataIndication:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8 packetBuffer:(id *)a9 fromDeviceUniqueID:(id)a10 cbuuid:(id)a11;
- (BOOL)_processStunEchoRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunEchoResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8;
- (BOOL)_processStunPacket:(id *)a3 fromDevice:(id)a4 arrivalTime:(double)a5 fromDeviceUniqueID:(id)a6 cbuuid:(id)a7;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (BOOL)remoteHostAwake;
- (IDSLinkDelegate)alternateDelegate;
- (IDSLinkDelegate)delegate;
- (IDSUDPGlobalLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4;
- (NSString)cbuuid;
- (NSString)deviceUniqueID;
- (NSString)linkTypeString;
- (NSString)localPartyID;
- (NSString)remotePartyID;
- (id)copyLinkStatsDict;
- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4;
- (unint64_t)headerOverhead;
- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (unint64_t)state;
- (void)_createSimpleConnectionData;
- (void)_forwardPacketBuffer:(id *)a3 fromDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)_handleEchoTimer;
- (void)_sendConnectionCheckRequest;
- (void)_sendNominateRequest;
- (void)_startConnectionEcho:(double)a3;
- (void)_startEchoTimer;
- (void)_stopEchoTimer;
- (void)_updateLinkTransportAddress:(unsigned int)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5;
- (void)createConnectionData:(id)a3 dataReadyHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)processRemoteConnectionData:(id)a3 completionHandler:(id)a4;
- (void)setAlternateDelegate:(id)a3;
- (void)setCbuuid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setLocalPartyID:(id)a3;
- (void)setRemotePartyID:(id)a3;
- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6;
@end

@implementation IDSUDPGlobalLink

- (IDSUDPGlobalLink)initWithDeviceUniqueID:(id)a3 cbuuid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSUDPGlobalLink;
  v9 = -[IDSUDPGlobalLink init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cbuuid, a4);
    objc_storeStrong((id *)&v10->_deviceUniqueID, a3);
    v11 = -[IDSUDPLink initWithDeviceUniqueID:cbuuid:]( objc_alloc(&OBJC_CLASS___IDSUDPLink),  "initWithDeviceUniqueID:cbuuid:",  v7,  v8);
    udpLink = v10->_udpLink;
    v10->_udpLink = v11;

    -[IDSUDPLink setDelegate:](v10->_udpLink, "setDelegate:", v10);
    v21[0] = 0xAAAAAAAAAAAAAAAALL;
    v21[1] = 0xAAAAAAAAAAAAAAAALL;
    v13 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10->_cbuuid);
    -[NSUUID getUUIDBytes:](v13, "getUUIDBytes:", v21);

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v21, 16LL));
    keyData = v10->_keyData;
    v10->_keyData = (NSData *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    remoteAddressArray = v10->_remoteAddressArray;
    v10->_remoteAddressArray = v16;

    sub_1000BAB18((uint64_t)&v10->_sockAddrPairTable, 16);
    v18 = sub_1000BCDA4( (char *)&v10->_sockAddrPairTable,  -[NSData bytes](v10->_keyData, "bytes"),  -[NSData length](v10->_keyData, "length"));
    v10->_state = 0LL;
    v10->_previousReportTime = ids_monotonic_time(v18);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForIDSCategory("UGL");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc UDPGlobalLink %@", buf, 0xCu);
  }

  sub_1000BAC10(&self->_sockAddrPairTable.iNumPair);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSUDPGlobalLink;
  -[IDSUDPGlobalLink dealloc](&v6, "dealloc");
}

- (void)invalidate
{
  uint64_t v3 = OSLogHandleForIDSCategory("UGL");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidate UDPGlobalLink", v7, 2u);
  }

  nominateBlocks = self->_nominateBlocks;
  self->_nominateBlocks = 0LL;

  -[IDSUDPGlobalLink _stopEchoTimer](self, "_stopEchoTimer");
  -[IDSUDPLink invalidate](self->_udpLink, "invalidate");
  self->_isInvalidated = 1;
}

- (void)createConnectionData:(id)a3 dataReadyHandler:(id)a4
{
  objc_super v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory("UGL");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "createConnectionData - localPartyID=%@",  buf,  0xCu);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      _IDSLogTransport(@"UGL", @"IDS", @"createConnectionData - localPartyID=%@");
    }
  }

  unint64_t state = self->_state;
  if (state)
  {
    if (state > 6) {
      v13 = "UnexpectedState";
    }
    else {
      v13 = (const char *)_IDSLinkStateStrings[state];
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid link state %s",  v13));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v16,  NSLocalizedDescriptionKey));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8002LL,  v17));

    uint64_t v19 = OSLogHandleForTransportCategory("UGL");
    objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = self->_state;
      if (v21 > 6) {
        v22 = "UnexpectedState";
      }
      else {
        v22 = (const char *)_IDSLinkStateStrings[v21];
      }
      *(_DWORD *)buf = 136315138;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "invalid link state %s", buf, 0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      uint64_t v24 = _IDSShouldLogTransport(v24);
      if ((_DWORD)v24)
      {
        _IDSLogTransport(@"UGL", @"IDS", @"invalid link state %s");
        uint64_t v24 = _IDSShouldLog(0LL, @"UGL");
        if ((_DWORD)v24) {
          uint64_t v24 = _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"invalid link state %s");
        }
      }
    }

    if (v7)
    {
      uint64_t v26 = im_primary_queue(v24, v25);
      v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10014F6F4;
      block[3] = &unk_1008F6358;
      id v30 = v7;
      id v29 = v18;
      dispatch_async(v27, block);
    }
  }

  else
  {
    -[IDSUDPGlobalLink setLocalPartyID:](self, "setLocalPartyID:", v6);
    id v14 = [v7 copy];
    id dataReadyHandler = self->_dataReadyHandler;
    self->_id dataReadyHandler = v14;

    -[IDSUDPGlobalLink _createSimpleConnectionData](self, "_createSimpleConnectionData");
    self->_unint64_t state = 2LL;
  }
}

- (void)processRemoteConnectionData:(id)a3 completionHandler:(id)a4
{
  v114 = self;
  id v113 = a3;
  id v112 = a4;
  uint64_t v5 = OSLogHandleForTransportCategory("UGL");
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v139 = v113;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "processRemoteConnectionData %@", buf, 0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v102 = v113;
      _IDSLogTransport(@"UGL", @"IDS", @"processRemoteConnectionData %@");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        id v102 = v113;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"processRemoteConnectionData %@");
      }
    }
  }

  id v9 = [v112 copy];
  id completionHandler = v114->_completionHandler;
  v114->_id completionHandler = v9;

  if (!v113)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"invalid remote connection data",  NSLocalizedDescriptionKey));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8003LL,  v24));

    uint64_t v25 = OSLogHandleForTransportCategory("UGL");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "invalid remote connection data", buf, 2u);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      uint64_t v28 = _IDSShouldLogTransport(v28);
      if ((_DWORD)v28)
      {
        _IDSLogTransport(@"UGL", @"IDS", @"invalid remote connection data");
        uint64_t v28 = _IDSShouldLog(0LL, @"UGL");
        if ((_DWORD)v28) {
          uint64_t v28 = _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"invalid remote connection data");
        }
      }
    }

    if (v114->_completionHandler)
    {
      uint64_t v30 = im_primary_queue(v28, v29);
      v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v30);
      v134[0] = _NSConcreteStackBlock;
      v134[1] = 3221225472LL;
      v134[2] = sub_100150814;
      v134[3] = &unk_1008F5F80;
      v134[4] = v114;
      id v16 = v16;
      id v135 = v16;
      dispatch_async(v31, v134);
    }

    id v14 = @"invalid remote connection data";
    goto LABEL_121;
  }

  unint64_t state = v114->_state;
  if (state != 2)
  {
    if (state > 6) {
      v32 = "UnexpectedState";
    }
    else {
      v32 = (const char *)_IDSLinkStateStrings[state];
    }
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid link state %s",  v32));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v14,  NSLocalizedDescriptionKey));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8002LL,  v33));

    uint64_t v34 = OSLogHandleForTransportCategory("UGL");
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v36 = v114->_state;
      if (v36 > 6) {
        v37 = "UnexpectedState";
      }
      else {
        v37 = (const char *)_IDSLinkStateStrings[v36];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)v139 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "invalid link state %s", buf, 0xCu);
    }

    uint64_t v86 = os_log_shim_legacy_logging_enabled(v85);
    if ((_DWORD)v86)
    {
      uint64_t v86 = _IDSShouldLogTransport(v86);
      if ((_DWORD)v86)
      {
        unint64_t v88 = v114->_state;
        v89 = v88 > 6 ? "UnexpectedState" : (char *)_IDSLinkStateStrings[v88];
        id v102 = v89;
        _IDSLogTransport(@"UGL", @"IDS", @"invalid link state %s");
        uint64_t v86 = _IDSShouldLog(0LL, @"UGL");
        if ((_DWORD)v86)
        {
          unint64_t v90 = v114->_state;
          if (v90 > 6) {
            v91 = "UnexpectedState";
          }
          else {
            v91 = (const char *)_IDSLinkStateStrings[v90];
          }
          id v102 = (id)v91;
          uint64_t v86 = _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"invalid link state %s");
        }
      }
    }

    if (v114->_completionHandler)
    {
      uint64_t v100 = im_primary_queue(v86, v87);
      v101 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v100);
      v132[0] = _NSConcreteStackBlock;
      v132[1] = 3221225472LL;
      v132[2] = sub_100150824;
      v132[3] = &unk_1008F5F80;
      v132[4] = v114;
      id v16 = v16;
      id v133 = v16;
      dispatch_async(v101, v132);
    }

    goto LABEL_121;
  }

  id v12 = v113;
  v111 = (unsigned __int8 *)[v12 bytes];
  id v13 = [v12 length];
  if ((unint64_t)v13 <= 1)
  {
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"invalid remote connection data, %uB",  v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v14,  NSLocalizedDescriptionKey));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8003LL,  v15));

    uint64_t v17 = OSLogHandleForTransportCategory("UGL");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v139 = (_DWORD)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "invalid remote connection data, %uB",  buf,  8u);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      uint64_t v20 = _IDSShouldLogTransport(v20);
      if ((_DWORD)v20)
      {
        id v102 = v13;
        _IDSLogTransport(@"UGL", @"IDS", @"invalid remote connection data, %uB");
        uint64_t v20 = _IDSShouldLog(0LL, @"UGL");
        if ((_DWORD)v20)
        {
          id v102 = v13;
          uint64_t v20 = _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"invalid remote connection data, %uB");
        }
      }
    }

    if (v114->_completionHandler)
    {
      uint64_t v22 = im_primary_queue(v20, v21);
      uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472LL;
      v130[2] = sub_100150834;
      v130[3] = &unk_1008F5F80;
      v130[4] = v114;
      id v16 = v16;
      id v131 = v16;
      dispatch_async(v23, v130);
    }

    goto LABEL_121;
  }

  v38 = (void *)*v111;
  if (v38 >= 2)
  {
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"connection data has unsupported version %d",  *v111));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v14,  NSLocalizedDescriptionKey));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8004LL,  v39));

    uint64_t v40 = OSLogHandleForTransportCategory("UGL");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v139 = (_DWORD)v38;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "connection data has unsupported version %d",  buf,  8u);
    }

    uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
    if ((_DWORD)v43)
    {
      uint64_t v43 = _IDSShouldLogTransport(v43);
      if ((_DWORD)v43)
      {
        id v102 = v38;
        _IDSLogTransport(@"UGL", @"IDS", @"connection data has unsupported version %d");
        uint64_t v43 = _IDSShouldLog(0LL, @"UGL");
        if ((_DWORD)v43)
        {
          id v102 = v38;
          uint64_t v43 = _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"connection data has unsupported version %d");
        }
      }
    }

    if (v114->_completionHandler)
    {
      uint64_t v45 = im_primary_queue(v43, v44);
      v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v45);
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472LL;
      v128[2] = sub_100150844;
      v128[3] = &unk_1008F5F80;
      v128[4] = v114;
      id v16 = v16;
      id v129 = v16;
      dispatch_async(v46, v128);
    }

    goto LABEL_121;
  }

  unsigned int v47 = v111[1];
  id v109 = -[IDSUDPLink copyCurrentNetworkInterfaces](v114->_udpLink, "copyCurrentNetworkInterfaces");
  v104[1] = v104;
  __chkstk_darwin(v48, v49);
  v107 = &v102;
  id v102 = (id)0xAAAAAAAAAAAAAAAALL;
  unint64_t v103 = 0xAAAAAAAAAAAAAAAALL;
  if (v47 < 0x10) {
    goto LABEL_107;
  }
  int v51 = 0;
  int v120 = 0;
  p_sockAddrPairTable = &v114->_sockAddrPairTable;
  uint64_t v106 = v47 >> 4;
  if (v47 >> 4 <= 1) {
    int v52 = 1;
  }
  else {
    int v52 = v47 >> 4;
  }
  int v108 = v52;
  *(void *)&__int128 v50 = 67109890LL;
  __int128 v105 = v50;
  *(void *)&__int128 v50 = 138412546LL;
  __int128 v117 = v50;
  do
  {
    unsigned int v53 = *((unsigned __int16 *)v111 + 3);
    v111 += 6;
    uint64_t v54 = bswap32(*((_DWORD *)v111 - 1));
    uint64_t v55 = bswap32(v53) >> 16;
    int v110 = v51;
    uint64_t v56 = OSLogHandleForTransportCategory("UGL");
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v58 = IPv4ToString(v107, 16LL, v54);
      *(_DWORD *)buf = v105;
      *(_DWORD *)v139 = v51 + 1;
      *(_WORD *)&v139[4] = 1024;
      *(_DWORD *)&v139[6] = v106;
      *(_WORD *)v140 = 2080;
      *(void *)&v140[2] = v58;
      __int16 v141 = 1024;
      int v142 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "connection data has IPv4 address (%d/%d) [%s:%u]",  buf,  0x1Eu);
    }

    uint64_t v60 = os_log_shim_legacy_logging_enabled(v59);
    if ((_DWORD)v60)
    {
      if (_IDSShouldLogTransport(v60))
      {
        IPv4ToString(v107, 16LL, v54);
        _IDSLogTransport(@"UGL", @"IDS", @"connection data has IPv4 address (%d/%d) [%s:%u]");
        if (_IDSShouldLog(0LL, @"UGL"))
        {
          IPv4ToString(v107, 16LL, v54);
          _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"connection data has IPv4 address (%d/%d) [%s:%u]");
        }
      }
    }

    v137[0] = 0xAAAAAAAAAAAAAAAALL;
    v137[1] = 0xAAAAAAAAAAAAAAAALL;
    int v127 = 16;
    IPPortToSA4(v54, v55, v137, &v127);
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  v137,  v102,  v103));
    -[NSMutableArray addObject:](v114->_remoteAddressArray, "addObject:", v61);
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    id v62 = v109;
    id v63 = [v62 countByEnumeratingWithState:&v123 objects:v136 count:16];
    if (v63)
    {
      uint64_t v64 = 0LL;
      uint64_t v65 = *(void *)v124;
      BOOL v67 = BYTE3(v54) == 10 || (v54 & 0xFFF00000) == -1408237568;
      int v115 = v54 & 0xFFFF0000;
      int v68 = (v54 & 0xFFFF0000) == 0xC0A80000 || v67;
      int v118 = v68;
      BOOL v119 = v67;
      for (uint64_t i = v65; ; uint64_t i = *(void *)v124)
      {
        if (i != v65) {
          objc_enumerationMutation(v62);
        }
        v70 = *(void **)(*((void *)&v123 + 1) + 8 * v64);
        v71 = (void *)objc_claimAutoreleasedReturnValue([v70 address]);
        v72 = (unsigned __int8 *)[v71 sa4];
        unsigned int v73 = bswap32(*((_DWORD *)v72 + 1));
        if (HIBYTE(v73) == 10 || (v73 & 0xFFF00000) == -1408237568)
        {
          if ((v118 & 1) == 0) {
            goto LABEL_83;
          }
        }

        else
        {
          unsigned int v80 = v73 & 0xFFFF0000;
          if (v119)
          {
            if (v80 != -1062731776) {
              goto LABEL_83;
            }
          }

          else if ((v115 == -1062731776) != (v80 == -1062731776))
          {
LABEL_83:
            uint64_t v81 = OSLogHandleForTransportCategory("UGL");
            v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v117;
              *(void *)v139 = v71;
              *(_WORD *)&v139[8] = 2112;
              *(void *)v140 = v61;
              _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "skip address pair [%@-%@].",  buf,  0x16u);
            }

            uint64_t v84 = os_log_shim_legacy_logging_enabled(v83);
            if ((_DWORD)v84)
            {
              if (_IDSShouldLogTransport(v84))
              {
                _IDSLogTransport(@"UGL", @"IDS", @"skip address pair [%@-%@].");
              }
            }

            goto LABEL_89;
          }
        }

        uint64_t v75 = OSLogHandleForTransportCategory("UGL");
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v117;
          *(void *)v139 = v71;
          *(_WORD *)&v139[8] = 2112;
          *(void *)v140 = v61;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "add address pair [%@-%@]", buf, 0x16u);
        }

        uint64_t v78 = os_log_shim_legacy_logging_enabled(v77);
        if ((_DWORD)v78)
        {
          if (_IDSShouldLogTransport(v78))
          {
            _IDSLogTransport(@"UGL", @"IDS", @"add address pair [%@-%@]");
          }
        }

        int v79 = [v70 index];
        sub_1000BACF4(&p_sockAddrPairTable->iNumPair, v79, v72, (unsigned __int8 *)v137, 1LL, 0LL, 0);
        ++v120;
LABEL_89:

        if (++v64 >= (unint64_t)v63)
        {
          id v63 = [v62 countByEnumeratingWithState:&v123 objects:v136 count:16];
          if (!v63) {
            break;
          }
          uint64_t v64 = 0LL;
        }
      }
    }

    int v51 = v110 + 1;
  }

  while (v110 + 1 != v108);
  if (v120)
  {
    -[IDSUDPGlobalLink _sendConnectionCheckRequest](v114, "_sendConnectionCheckRequest");
    id v14 = 0LL;
    id v16 = 0LL;
    goto LABEL_116;
  }

- (void)startConnectionForDevice:(id)a3 isInitiator:(BOOL)a4 remotePartyID:(id)a5 useStunMICheck:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  uint64_t v10 = (void (**)(void))a3;
  __int128 v50 = v10;
  id v51 = a5;
  if (v10)
  {
    __n128 v49 = self;
    uint64_t v11 = OSLogHandleForTransportCategory("UGL");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v10;
      if (v8) {
        id v14 = @"YES";
      }
      else {
        id v14 = @"NO";
      }
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[12] = 2112;
      if (v6) {
        id v13 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v51;
      LOWORD(v61) = 2112;
      *(void *)((char *)&v61 + 2) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@ stunMICheck=%@",  buf,  0x2Au);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16 && _IDSShouldLogTransport(v16))
    {
      uint64_t v17 = v8 ? @"YES" : @"NO";
      v18 = v6 ? @"YES" : @"NO";
      id v47 = v51;
      __n128 v48 = v18;
      uint64_t v45 = v50;
      v46 = v17;
      _IDSLogTransport( @"UGL",  @"IDS",  @"startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@ stunMICheck=%@");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        id v47 = v51;
        __n128 v48 = v18;
        uint64_t v45 = v50;
        v46 = v17;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"startConnectionForDevice - deviceID=%@ isInitiator=%@ remotePartyID=%@ stunMICheck=%@");
      }
    }

    self->_useStunMICheck = v6;
    if (v8)
    {
      if (v51)
      {
        -[IDSUDPGlobalLink setRemotePartyID:](self, "setRemotePartyID:");
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        uint64_t v19 = self->_nominateBlocks;
        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v53,  v67,  16LL);
        if (v20)
        {
          uint64_t v21 = *(void *)v54;
          do
          {
            for (uint64_t i = 0LL; i != v20; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v54 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void (***)(void))(*((void *)&v53 + 1) + 8LL * (void)i);
              uint64_t v24 = OSLogHandleForTransportCategory("UGL");
              uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v26 = objc_retainBlock(v23);
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "process delayed nomination request block %p.",  buf,  0xCu);
              }

              uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
              if ((_DWORD)v28)
              {
                if (_IDSShouldLogTransport(v28))
                {
                  uint64_t v45 = objc_retainBlock(v23);
                  _IDSLogTransport(@"UGL", @"IDS", @"process delayed nomination request block %p.");

                  if (_IDSShouldLog(0LL, @"UGL"))
                  {
                    uint64_t v45 = objc_retainBlock(v23);
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"process delayed nomination request block %p.");
                  }
                }
              }

              v23[2](v23);
            }

            id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v53,  v67,  16LL);
          }

          while (v20);
        }

        nominateBlocks = v49->_nominateBlocks;
        v49->_nominateBlocks = 0LL;

        *(void *)&__int128 v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v65 = v30;
        __int128 v66 = v30;
        __int128 v63 = v30;
        __int128 v64 = v30;
        __int128 v61 = v30;
        __int128 v62 = v30;
        *(_OWORD *)buf = v30;
        *(_OWORD *)&buf[16] = v30;
        v59[6] = v30;
        v59[7] = v30;
        v59[4] = v30;
        v59[5] = v30;
        v59[3] = v30;
        v59[1] = v30;
        v59[2] = v30;
        v59[0] = v30;
        unsigned int v52 = 0;
        v31 = (char *)[v51 UTF8String];
        int v32 = strlen(v31);
        if (sub_1000BBE24((uint64_t)&v49->_sockAddrPairTable, v31, v32, &v52, buf, v59))
        {
          uint64_t v33 = OSLogHandleForTransportCategory("UGL");
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v57 = 136315138;
            uint64_t v58 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Nominated connection matches remotePartyID %s.",  v57,  0xCu);
          }

          uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
          if ((_DWORD)v36)
          {
            if (_IDSShouldLogTransport(v36))
            {
              uint64_t v45 = (void (**)(void))v31;
              _IDSLogTransport(@"UGL", @"IDS", @"Nominated connection matches remotePartyID %s.");
              if (_IDSShouldLog(0LL, @"UGL"))
              {
                uint64_t v45 = (void (**)(void))v31;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"Nominated connection matches remotePartyID %s.");
              }
            }
          }

          -[IDSUDPGlobalLink _updateLinkTransportAddress:localAddress:remoteAddress:]( v49,  "_updateLinkTransportAddress:localAddress:remoteAddress:",  v52,  buf,  v59,  v45,  v46,  v47,  v48);
        }
      }

      else
      {
        uint64_t v41 = OSLogHandleForTransportCategory("UGL");
        uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "startConnectionForDevice failed due to invalid remotePartyID=%@",  buf,  0xCu);
        }

        uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
        if ((_DWORD)v44)
        {
          if (_IDSShouldLogTransport(v44))
          {
            _IDSLogTransport( @"UGL",  @"IDS",  @"startConnectionForDevice failed due to invalid remotePartyID=%@");
            if (_IDSShouldLog(0LL, @"UGL")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"startConnectionForDevice failed due to invalid remotePartyID=%@");
            }
          }
        }
      }
    }

    else
    {
      -[IDSUDPGlobalLink _sendNominateRequest](self, "_sendNominateRequest");
    }
  }

  else
  {
    uint64_t v37 = OSLogHandleForTransportCategory("UGL");
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "startConnectionForDevice failed due to invalid deviceID=%@",  buf,  0xCu);
    }

    uint64_t v40 = os_log_shim_legacy_logging_enabled(v39);
    if ((_DWORD)v40)
    {
      if (_IDSShouldLogTransport(v40))
      {
        _IDSLogTransport( @"UGL",  @"IDS",  @"startConnectionForDevice failed due to invalid deviceID=%@");
        if (_IDSShouldLog(0LL, @"UGL")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"startConnectionForDevice failed due to invalid deviceID=%@");
        }
      }
    }
  }
}

- (void)_createSimpleConnectionData
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v54[29] = v2;
  *(_OWORD *)__int128 v55 = v2;
  v54[27] = v2;
  v54[28] = v2;
  v54[25] = v2;
  v54[26] = v2;
  v54[23] = v2;
  v54[24] = v2;
  v54[21] = v2;
  v54[22] = v2;
  v54[19] = v2;
  v54[20] = v2;
  v54[17] = v2;
  v54[18] = v2;
  v54[16] = v2;
  *(_OWORD *)&v55[15] = v2;
  v54[15] = v2;
  v54[14] = v2;
  v54[13] = v2;
  v54[12] = v2;
  v54[11] = v2;
  v54[10] = v2;
  v54[9] = v2;
  v54[8] = v2;
  v54[7] = v2;
  v54[6] = v2;
  v54[5] = v2;
  v54[4] = v2;
  v54[3] = v2;
  v54[2] = v2;
  v54[1] = v2;
  v54[0] = v2;
  char v53 = 1;
  id v3 = -[IDSUDPLink newSocketWithIPVersion:wantsAWDL:wantsWiFi:wantsCellular:]( self->_udpLink,  "newSocketWithIPVersion:wantsAWDL:wantsWiFi:wantsCellular:",  0LL,  0LL,  1LL,  0LL);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v4)
  {
    unint64_t v5 = 0LL;
    BOOL v6 = (char *)v54 + 1;
    uint64_t v7 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v46 + 1) + 8 * (void)i) address]);
        if (v9)
        {
          uint64_t v10 = OSLogHandleForTransportCategory("UGL");
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)id v51 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "add local adress %@", buf, 0xCu);
          }

          uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
          if ((_DWORD)v13)
          {
            if (_IDSShouldLogTransport(v13))
            {
              uint64_t v39 = v9;
              _IDSLogTransport(@"UGL", @"IDS", @"add local adress %@");
              if (_IDSShouldLog(0LL, @"UGL"))
              {
                uint64_t v39 = v9;
                _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"add local adress %@");
              }
            }
          }

          id v14 = objc_msgSend(v9, "sa4", v39);
          if ((int)((_DWORD)v6 - &v53 - 513) >= -6)
          {
            uint64_t v15 = OSLogHandleForIDSCategory("UGL");
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)id v51 = (_DWORD)v6 - &v53;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "connection blob size (%dB) is too big, skip remaining.",  buf,  8u);
            }

            if (os_log_shim_legacy_logging_enabled(v17) && _IDSShouldLog(0LL, @"UGL"))
            {
              uint64_t v39 = (void *)(v6 - &v53);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"connection blob size (%dB) is too big, skip remaining.");
            }

            goto LABEL_30;
          }

          if ((int)v5 >= 15)
          {
            uint64_t v18 = OSLogHandleForIDSCategory("UGL");
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)id v51 = v5;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#IPv4 address (%d) reaches max allowed, skip remaining.",  buf,  8u);
            }

            if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"UGL"))
            {
              uint64_t v39 = (void *)v5;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"#IPv4 address (%d) reaches max allowed, skip remaining.");
            }

- (void)_sendConnectionCheckRequest
{
  if (self->_isInvalidated)
  {
    uint64_t v2 = OSLogHandleForIDSCategory("UGL");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Link is invalidated, stop sending connection check request",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v4) && _IDSShouldLog(0LL, @"UGL"))
    {
      unint64_t v5 = @"Link is invalidated, stop sending connection check request";
LABEL_7:
      _IDSLogV(0LL, @"IDSFoundation", @"UGL", v5);
    }
  }

  else
  {
    double v7 = ids_monotonic_time(self);
    if (self->_connectionRequestStartTime == 0.0)
    {
      self->_connectionRequestStartTime = v7;
      uint64_t v8 = OSLogHandleForTransportCategory("UGL");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Start connection check.", buf, 2u);
      }

      uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
      if ((_DWORD)v11)
      {
        if (_IDSShouldLogTransport(v11))
        {
          _IDSLogTransport(@"UGL", @"IDS", @"Start connection check.");
        }
      }
    }

    BOOL v12 = sub_1000BBD5C((unsigned int *)&self->_sockAddrPairTable);
    if (v12)
    {
      uint64_t v13 = OSLogHandleForTransportCategory("UGL");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Connection check is done.", buf, 2u);
      }

      uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
      if ((_DWORD)v16)
      {
        if (_IDSShouldLogTransport(v16))
        {
          _IDSLogTransport(@"UGL", @"IDS", @"Connection check is done.");
          if (_IDSShouldLog(0LL, @"UGL"))
          {
            unint64_t v5 = @"Connection check is done.";
            goto LABEL_7;
          }
        }
      }
    }

    else if (v7 - self->_connectionRequestStartTime >= 5.0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Connection check is timed out, cannot connect to remote party.",  NSLocalizedDescriptionKey));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"UDPGlobalLink",  8005LL,  v18));

      uint64_t v20 = OSLogHandleForTransportCategory("UGL");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Connection check is timed out, cannot connect to remote party.",  buf,  2u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        uint64_t v23 = _IDSShouldLogTransport(v23);
        if ((_DWORD)v23)
        {
          _IDSLogTransport( @"UGL",  @"IDS",  @"Connection check is timed out, cannot connect to remote party.");
          uint64_t v23 = _IDSShouldLog(0LL, @"UGL");
          if ((_DWORD)v23) {
            uint64_t v23 = _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"Connection check is timed out, cannot connect to remote party.");
          }
        }
      }

      if (self->_completionHandler && !self->_notifyReachableDone)
      {
        self->_notifyReachableDone = 1;
        uint64_t v25 = im_primary_queue(v23, v24);
        uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v25);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100151B88;
        block[3] = &unk_1008F5F80;
        void block[4] = self;
        id v29 = v19;
        dispatch_async(v26, block);
      }
    }

    else
    {
      double v17 = ids_monotonic_time(v12);
      if (qword_1009BEBB0 != -1) {
        dispatch_once(&qword_1009BEBB0, &stru_1008FBA88);
      }
      sub_1000BB5F0( (uint64_t)&self->_sockAddrPairTable,  self->_udpLink,  self->_cbuuid,  (unint64_t)((double)(unint64_t)qword_1009BEBA8 + v17 * 4294967300.0) >> 22);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100151B98;
      v27[3] = &unk_1008F7948;
      v27[4] = self;
      IDSTransportThreadAddBlockAfter(v27, 0.5);
    }
  }

- (void)_sendNominateRequest
{
  if (self->_isInvalidated)
  {
    uint64_t v2 = OSLogHandleForIDSCategory("UGL");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Link is invalidated, stop sending nominate request",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v4))
    {
    }
  }

  else if (self->_localPartyID)
  {
    double v6 = ids_monotonic_time(self);
    if (self->_nominateRequestStartTime == 0.0)
    {
      self->_nominateRequestStartTime = v6;
      uint64_t v7 = OSLogHandleForTransportCategory("UGL");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Start nominate request.", buf, 2u);
      }

      uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
      if ((_DWORD)v10)
      {
        if (_IDSShouldLogTransport(v10))
        {
          _IDSLogTransport(@"UGL", @"IDS", @"Start nominate request.");
        }
      }
    }

    if (sub_1000BBDA4((unint64_t)&self->_sockAddrPairTable))
    {
      uint64_t v11 = OSLogHandleForTransportCategory("UGL");
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Nominate request is done.", buf, 2u);
      }

      uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
      if ((_DWORD)v14)
      {
        if (_IDSShouldLogTransport(v14))
        {
          _IDSLogTransport(@"UGL", @"IDS", @"Nominate request is done.");
        }
      }
    }

    else if (v6 - self->_nominateRequestStartTime >= 5.0)
    {
      uint64_t v23 = OSLogHandleForTransportCategory("UGL");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Nominate request timed out, cannot connect to remote party.",  buf,  2u);
      }

      uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
      if ((_DWORD)v26)
      {
        if (_IDSShouldLogTransport(v26))
        {
          _IDSLogTransport( @"UGL",  @"IDS",  @"Nominate request timed out, cannot connect to remote party.");
          if (_IDSShouldLog(0LL, @"UGL")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"Nominate request timed out, cannot connect to remote party.");
          }
        }
      }
    }

    else
    {
      uint64_t v20 = -[NSString UTF8String](self->_localPartyID, "UTF8String");
      size_t v21 = strlen(v20);
      double v22 = ids_monotonic_time(v21);
      if (qword_1009BEBB0 != -1) {
        dispatch_once(&qword_1009BEBB0, &stru_1008FBA88);
      }
      sub_1000BBEEC( (uint64_t)&self->_sockAddrPairTable,  self->_udpLink,  self->_cbuuid,  (uint64_t)v20,  v21,  (unint64_t)((double)(unint64_t)qword_1009BEBA8 + v22 * 4294967300.0) >> 22);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1001520D4;
      v27[3] = &unk_1008F7948;
      v27[4] = self;
      IDSTransportThreadAddBlockAfter(v27, 0.5);
    }
  }

  else
  {
    uint64_t v15 = OSLogHandleForTransportCategory("UGL");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      localPartyID = self->_localPartyID;
      *(_DWORD *)buf = 138412290;
      id v29 = localPartyID;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_sendNominateRequest failed due to invalid localPartyID %@",  buf,  0xCu);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport( @"UGL",  @"IDS",  @"_sendNominateRequest failed due to invalid localPartyID %@");
        if (_IDSShouldLog(0LL, @"UGL")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"_sendNominateRequest failed due to invalid localPartyID %@");
        }
      }
    }
  }

- (void)_startConnectionEcho:(double)a3
{
  p_sockAddrPairTable = &self->_sockAddrPairTable;
  unint64_t v6 = sub_1000BBDE4((unint64_t)&self->_sockAddrPairTable);
  if ((_DWORD)v6)
  {
    uint64_t v7 = OSLogHandleForTransportCategory("UGL");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection echo is done.", buf, 2u);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        _IDSLogTransport(@"UGL", @"IDS", @"Connection echo is done.");
        if (_IDSShouldLog(0LL, @"UGL"))
        {
          uint64_t v11 = @"Connection echo is done.";
LABEL_18:
          _IDSLogV(0LL, @"IDSFoundation", @"UGL", v11);
        }
      }
    }
  }

  else if (ids_monotonic_time(v6) - a3 >= 5.0)
  {
    uint64_t v14 = OSLogHandleForTransportCategory("UGL");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Connection echo timed out.", buf, 2u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        _IDSLogTransport(@"UGL", @"IDS", @"Connection echo timed out.");
        if (_IDSShouldLog(0LL, @"UGL"))
        {
          uint64_t v11 = @"Connection echo timed out.";
          goto LABEL_18;
        }
      }
    }
  }

  else
  {
    double v13 = ids_monotonic_time(v12);
    if (qword_1009BEBB0 != -1)
    {
      double v18 = v13;
      dispatch_once(&qword_1009BEBB0, &stru_1008FBA88);
      double v13 = v18;
    }

    sub_1000BC5A8( &p_sockAddrPairTable->iNumPair,  self->_udpLink,  self->_cbuuid,  (uint64_t)&self->_sourceAddress,  (uint64_t)&self->_destinationAddress,  (unint64_t)((double)(unint64_t)qword_1009BEBA8 + v13 * 4294967300.0) >> 22);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100152360;
    v19[3] = &unk_1008F8BA8;
    v19[4] = self;
    *(double *)&v19[5] = a3;
    IDSTransportThreadAddBlockAfter(v19, 1.0);
  }

- (unint64_t)headerOverhead
{
  int ss_family = self->_sourceAddress.ss_family;
  unint64_t v3 = 255LL;
  if (ss_family == 30) {
    unint64_t v3 = 48LL;
  }
  if (ss_family == 2) {
    return 28LL;
  }
  else {
    return v3;
  }
}

- (NSString)linkTypeString
{
  return (NSString *)@"UDPGlobal";
}

- (id)copyLinkStatsDict
{
  unint64_t v3 = objc_alloc(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesReceived));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalBytesSent));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsReceived));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_totalPacketsSent));
  uint64_t v8 = -[NSDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  v4,  @"bytesReceived",  v5,  @"bytesSent",  v6,  @"packetsReceived",  v7,  @"packetsSent",  0LL);

  return v8;
}

- (void)_handleEchoTimer
{
  double v3 = ids_monotonic_time(self);
  uint64_t v4 = OSLogHandleForTransportCategory("UGL");
  unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    echoTimer = self->_echoTimer;
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = echoTimer;
    __int16 v17 = 2048;
    double v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "echo timer %p fired (%.6f).", buf, 0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      double v14 = v3;
      double v13 = self->_echoTimer;
      _IDSLogTransport(@"UGL", @"IDS", @"echo timer %p fired (%.6f).");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        double v14 = v3;
        double v13 = self->_echoTimer;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"echo timer %p fired (%.6f).");
      }
    }
  }

  if (self->_isInvalidated)
  {
    uint64_t v9 = OSLogHandleForTransportCategory("UGL");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "link is invalidated, stop echo timer.",  buf,  2u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        _IDSLogTransport(@"UGL", @"IDS", @"link is invalidated, stop echo timer.");
      }
    }

    -[IDSUDPGlobalLink _stopEchoTimer](self, "_stopEchoTimer", v13, *(void *)&v14);
  }

  sub_1000BCDF4((unsigned int *)&self->_sockAddrPairTable);
  -[IDSUDPGlobalLink _startConnectionEcho:](self, "_startConnectionEcho:", v3);
}

- (void)_startEchoTimer
{
  echoTimer = self->_echoTimer;
  if (echoTimer) {
    dispatch_source_cancel((dispatch_source_t)echoTimer);
  }
  uint64_t v4 = im_primary_queue(echoTimer, a2);
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
  uint64_t v7 = self->_echoTimer;
  self->_echoTimer = v6;

  uint64_t v8 = self->_echoTimer;
  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0x2540BE400uLL, 0x5F5E100uLL);
  uint64_t v10 = self->_echoTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1001528B8;
  handler[3] = &unk_1008F6010;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
  dispatch_resume((dispatch_object_t)self->_echoTimer);
  uint64_t v11 = OSLogHandleForTransportCategory("UGL");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = self->_echoTimer;
    *(_DWORD *)buf = 134217984;
    double v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "start echo timer %p.", buf, 0xCu);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15 && _IDSShouldLogTransport(v15))
  {
    _IDSLogTransport(@"UGL", @"IDS", @"start echo timer %p.");
  }

- (void)_stopEchoTimer
{
  echoTimer = self->_echoTimer;
  if (echoTimer)
  {
    dispatch_source_cancel((dispatch_source_t)echoTimer);
    uint64_t v4 = OSLogHandleForTransportCategory("UGL");
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = self->_echoTimer;
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stop echo timer %p.", buf, 0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8 && _IDSShouldLogTransport(v8))
    {
      _IDSLogTransport(@"UGL", @"IDS", @"stop echo timer %p.");
    }

    dispatch_time_t v9 = self->_echoTimer;
    self->_echoTimer = 0LL;
  }

- (void)_updateLinkTransportAddress:(unsigned int)a3 localAddress:(sockaddr *)a4 remoteAddress:(sockaddr *)a5
{
  uint64_t v7 = *(void *)&a3;
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35[0] = v9;
  v35[1] = v9;
  v35[2] = v9;
  v35[3] = v9;
  v35[4] = v9;
  v35[5] = v9;
  v35[6] = v9;
  v35[7] = v9;
  v34[0] = v9;
  v34[1] = v9;
  v34[2] = v9;
  v34[3] = v9;
  v34[4] = v9;
  v34[5] = v9;
  p_sourceAddress = &self->_sourceAddress;
  v34[6] = v9;
  v34[7] = v9;
  if (!IsValidSA(&self->_sourceAddress, a2) || !IsValidSA(&self->_destinationAddress, v11))
  {
    self->_sourceInterfaceIndex = v7;
    memcpy(p_sourceAddress, a4, a4->sa_len);
    memcpy(&self->_destinationAddress, a5, a5->sa_len);
    self->_unint64_t state = 4LL;
    uint64_t v19 = OSLogHandleForTransportCategory("UGL");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = SAToIPPortString(v35, 128LL, p_sourceAddress);
      uint64_t v22 = SAToIPPortString(v34, 128LL, &self->_destinationAddress);
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = v21;
      __int16 v38 = 2080;
      uint64_t v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "add result: src[%s], dst[%s].", buf, 0x16u);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        uint64_t v32 = SAToIPPortString(v35, 128LL, p_sourceAddress);
        uint64_t v33 = SAToIPPortString(v34, 128LL, &self->_destinationAddress);
        _IDSLogTransport(@"UGL", @"IDS", @"add result: src[%s], dst[%s].");
        if (_IDSShouldLog(0LL, @"UGL"))
        {
          uint64_t v32 = SAToIPPortString(v35, 128LL, p_sourceAddress);
          uint64_t v33 = SAToIPPortString(v34, 128LL, &self->_destinationAddress);
          _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"add result: src[%s], dst[%s].");
        }
      }
    }

    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  &self->_destinationAddress,  v32,  v33));
    -[IDSUDPLink setDestinationAddress:localIfIndex:isFixedDestination:fromAddress:]( self->_udpLink,  "setDestinationAddress:localIfIndex:isFixedDestination:fromAddress:",  v18,  v7,  0LL,  0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained link:self didConnectForDeviceUniqueID:self->_deviceUniqueID cbuuid:self->_cbuuid];

    uint64_t v26 = IMGetDomainValueForKey(@"com.apple.ids", @"phone_traffic_class");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v28 = v27;
    if (v27) {
      uint64_t v29 = (uint64_t)[v27 unsignedIntValue];
    }
    else {
      uint64_t v29 = 800LL;
    }
    -[IDSUDPLink setTrafficClass:](self->_udpLink, "setTrafficClass:", v29);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v31 = [v30 isInternalInstall];

    if (v31) {
      -[IDSUDPGlobalLink _startEchoTimer](self, "_startEchoTimer");
    }

    goto LABEL_24;
  }

  if (sub_100152F30((uint64_t)p_sourceAddress, (uint64_t)a4)
    || sub_100152F30((uint64_t)&self->_destinationAddress, (uint64_t)a5))
  {
    self->_sourceInterfaceIndex = v7;
    memcpy(p_sourceAddress, a4, a4->sa_len);
    memcpy(&self->_destinationAddress, a5, a5->sa_len);
    uint64_t v12 = OSLogHandleForTransportCategory("UGL");
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = SAToIPPortString(v35, 128LL, p_sourceAddress);
      uint64_t v15 = SAToIPPortString(v34, 128LL, &self->_destinationAddress);
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = v14;
      __int16 v38 = 2080;
      uint64_t v39 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "update result: src[%s], dst[%s].",  buf,  0x16u);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17 && _IDSShouldLogTransport(v17))
    {
      uint64_t v32 = SAToIPPortString(v35, 128LL, p_sourceAddress);
      uint64_t v33 = SAToIPPortString(v34, 128LL, &self->_destinationAddress);
      _IDSLogTransport(@"UGL", @"IDS", @"update result: src[%s], dst[%s].");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        uint64_t v32 = SAToIPPortString(v35, 128LL, p_sourceAddress);
        uint64_t v33 = SAToIPPortString(v34, 128LL, &self->_destinationAddress);
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"update result: src[%s], dst[%s].");
      }
    }

    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSockAddrWrapper wrapperWithSockAddr:]( &OBJC_CLASS___IDSSockAddrWrapper,  "wrapperWithSockAddr:",  &self->_destinationAddress,  v32,  v33));
    -[IDSUDPLink setDestinationAddress:localIfIndex:isFixedDestination:fromAddress:]( self->_udpLink,  "setDestinationAddress:localIfIndex:isFixedDestination:fromAddress:",  v18,  v7,  0LL,  0LL);
LABEL_24:
  }

- (BOOL)_processStunBindingRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  __src = a6;
  uint64_t v10 = *(void *)&a5;
  double v13 = (NSData *)a3;
  v104 = &keyData;
  id v105 = a4;
  *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v108[6] = v14;
  v108[7] = v14;
  v108[4] = v14;
  v108[5] = v14;
  v108[2] = v14;
  v108[3] = v14;
  v108[0] = v14;
  v108[1] = v14;
  v107[0] = v14;
  v107[1] = v14;
  v107[2] = v14;
  v107[3] = v14;
  v107[4] = v14;
  v107[5] = v14;
  v107[6] = v14;
  v107[7] = v14;
  uint64_t v15 = OSLogHandleForTransportCategory("UGL");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = SAToIPPortString(v108, 128LL, __src);
    uint64_t v18 = SAToIPPortString(v107, 128LL, a7);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v10;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "receive binding request %@ for [%s(%u)-%s].",  buf,  0x26u);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      uint64_t v21 = SAToIPPortString(v108, 128LL, __src);
      uint64_t v22 = SAToIPPortString(v107, 128LL, a7);
      uint64_t v100 = v10;
      uint64_t v101 = v22;
      keyData = v13;
      uint64_t v99 = v21;
      _IDSLogTransport(@"UGL", @"IDS", @"receive binding request %@ for [%s(%u)-%s].");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        uint64_t v23 = SAToIPPortString(v108, 128LL, __src);
        uint64_t v24 = SAToIPPortString(v107, 128LL, a7);
        uint64_t v100 = v10;
        uint64_t v101 = v24;
        keyData = v13;
        uint64_t v99 = v23;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"receive binding request %@ for [%s(%u)-%s].");
      }
    }
  }

  memset(buf, 170, 0x5D0uLL);
  memset(__b, 170, sizeof(__b));
  if (!-[NSData getAttribute:attribute:](v13, "getAttribute:attribute:", 37LL, buf)
    || !-[NSData getAttribute:attribute:](v13, "getAttribute:attribute:", 6LL, __b))
  {
    unint64_t v103 = 0LL;
    goto LABEL_21;
  }

  remotePartyID = self->_remotePartyID;
  if (remotePartyID)
  {
    unint64_t v103 = (NSData *)*(unsigned int *)&buf[8];
    uint64_t v26 = __b[2];
    uint64_t v27 = -[NSString UTF8String](remotePartyID, "UTF8String");
    size_t v28 = strlen(v27);
    if ((int)v103 < 1 || (int)v26 < 1 || v28 != v26 || memcmp(&__b[3], v27, v28))
    {
      uint64_t v29 = OSLogHandleForTransportCategory("UGL");
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v117 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "receive nomination request with invalid remotePartyID, ignore.",  v117,  2u);
      }

      uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
      if ((_DWORD)v32)
      {
        if (_IDSShouldLogTransport(v32))
        {
          _IDSLogTransport( @"UGL",  @"IDS",  @"receive nomination request with invalid remotePartyID, ignore.");
          if (_IDSShouldLog(0LL, @"UGL")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"receive nomination request with invalid remotePartyID, ignore.");
          }
        }
      }

      goto LABEL_94;
    }

    uint64_t v87 = OSLogHandleForTransportCategory("UGL");
    unint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 v117 = 136315138;
      *(void *)&v117[4] = &__b[3];
      _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "receive nominate binding request with remotePartyID %s.",  v117,  0xCu);
    }

    uint64_t v90 = os_log_shim_legacy_logging_enabled(v89);
    if ((_DWORD)v90)
    {
      if (_IDSShouldLogTransport(v90))
      {
        keyData = (NSData *)&__b[3];
        _IDSLogTransport(@"UGL", @"IDS", @"receive nominate binding request with remotePartyID %s.");
        if (_IDSShouldLog(0LL, @"UGL"))
        {
          keyData = (NSData *)&__b[3];
          _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"receive nominate binding request with remotePartyID %s.");
        }
      }
    }

    sub_1000BACF4(&self->_sockAddrPairTable.iNumPair, v10, (unsigned __int8 *)__src, &a7->sa_len, 5LL, &__b[3], v26);
    v91 = -[NSString UTF8String](self->_remotePartyID, "UTF8String");
    int v92 = strlen(v91);
    if (!memcmp(&__b[3], v91, v92))
    {
      uint64_t v93 = OSLogHandleForTransportCategory("UGL");
      v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v117 = 67109378;
        *(_DWORD *)&v117[4] = (_DWORD)v103;
        *(_WORD *)&v117[8] = 2080;
        *(void *)&v117[10] = v91;
        _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "nominate request with count(%d) matches remoteID %s",  v117,  0x12u);
      }

      uint64_t v96 = os_log_shim_legacy_logging_enabled(v95);
      if ((_DWORD)v96)
      {
        if (_IDSShouldLogTransport(v96))
        {
          keyData = v103;
          uint64_t v99 = (uint64_t)v91;
          _IDSLogTransport(@"UGL", @"IDS", @"nominate request with count(%d) matches remoteID %s");
          if (_IDSShouldLog(0LL, @"UGL"))
          {
            keyData = v103;
            uint64_t v99 = (uint64_t)v91;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"nominate request with count(%d) matches remoteID %s");
          }
        }
      }

      -[IDSUDPGlobalLink _updateLinkTransportAddress:localAddress:remoteAddress:]( self,  "_updateLinkTransportAddress:localAddress:remoteAddress:",  v10,  __src,  a7);
    }

- (BOOL)_processStunBindingResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[6] = v16;
  v47[7] = v16;
  v47[4] = v16;
  v47[5] = v16;
  v47[2] = v16;
  v47[3] = v16;
  v47[0] = v16;
  v47[1] = v16;
  v46[0] = v16;
  v46[1] = v16;
  v46[2] = v16;
  v46[3] = v16;
  v46[4] = v16;
  v46[5] = v16;
  v46[6] = v16;
  v46[7] = v16;
  memset(__b, 170, sizeof(__b));
  double v17 = 0.0;
  if ([v14 getAttribute:32773 attribute:__b])
  {
    __int16 v18 = -256 * LOBYTE(__b[3]) - BYTE1(__b[3]);
    __int16 v19 = -256 * BYTE2(__b[3]) - HIBYTE(__b[3]);
    if (qword_1009BEBB0 != -1) {
      dispatch_once(&qword_1009BEBB0, &stru_1008FBA88);
    }
    double v17 = (double)(unsigned __int16)(v19
                                   + v18
  }

  SAToIPPortString(v47, 128LL, a6);
  SAToIPPortString(v46, 128LL, a7);
  uint64_t v20 = OSLogHandleForTransportCategory("UGL");
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v49 = v14;
    __int16 v50 = 2080;
    uint64_t v51 = v47;
    __int16 v52 = 1024;
    int v53 = v11;
    __int16 v54 = 2080;
    uint64_t v55 = v46;
    __int16 v56 = 2048;
    double v57 = v17 * 1000.0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "receive binding response %@ for [%s(%u)-%s], RTT(%.3f ms)",  buf,  0x30u);
  }

  uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
  if ((_DWORD)v23)
  {
    if (_IDSShouldLogTransport(v23))
    {
      double v44 = v17 * 1000.0;
      uint64_t v42 = v11;
      uint64_t v43 = v46;
      id v39 = v14;
      unsigned __int16 v41 = v47;
      _IDSLogTransport(@"UGL", @"IDS", @"receive binding response %@ for [%s(%u)-%s], RTT(%.3f ms)");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        double v44 = v17 * 1000.0;
        uint64_t v42 = v11;
        uint64_t v43 = v46;
        id v39 = v14;
        unsigned __int16 v41 = v47;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"receive binding response %@ for [%s(%u)-%s], RTT(%.3f ms)");
      }
    }
  }

  id v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transactionID", v39, v41, v42, v43, *(void *)&v44));
  id v25 = [v24 bytes];

  if ([v14 getAttribute:37 attribute:__b])
  {
    uint64_t v26 = __b[2];
    if (__b[2] >= 1)
    {
      sub_1000BB270((unsigned int *)&self->_sockAddrPairTable, (uint64_t)v25, 5LL);
      uint64_t v27 = OSLogHandleForTransportCategory("UGL");
      size_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Nominated connection(%d) is accepted by remoteParty.",  buf,  8u);
      }

      uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
      if ((_DWORD)v30)
      {
        if (_IDSShouldLogTransport(v30))
        {
          uint64_t v40 = v26;
          _IDSLogTransport(@"UGL", @"IDS", @"Nominated connection(%d) is accepted by remoteParty.");
          if (_IDSShouldLog(0LL, @"UGL"))
          {
            uint64_t v40 = v26;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"Nominated connection(%d) is accepted by remoteParty.");
          }
        }
      }

      -[IDSUDPGlobalLink _updateLinkTransportAddress:localAddress:remoteAddress:]( self,  "_updateLinkTransportAddress:localAddress:remoteAddress:",  v11,  a6,  a7,  v40);
    }
  }

  else if (sub_1000BB270((unsigned int *)&self->_sockAddrPairTable, (uint64_t)v25, 3LL) {
         && self->_completionHandler
  }
         && !self->_notifyReachableDone)
  {
    self->_notifyReachableDone = 1;
    uint64_t v31 = OSLogHandleForTransportCategory("UGL");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Notifying remote party is reachable for ACCEPT.",  buf,  2u);
    }

    uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
    if ((_DWORD)v34)
    {
      uint64_t v34 = _IDSShouldLogTransport(v34);
      if ((_DWORD)v34)
      {
        _IDSLogTransport(@"UGL", @"IDS", @"Notifying remote party is reachable for ACCEPT.");
        uint64_t v34 = _IDSShouldLog(0LL, @"UGL");
        if ((_DWORD)v34) {
          uint64_t v34 = _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"Notifying remote party is reachable for ACCEPT.");
        }
      }
    }

    uint64_t v36 = im_primary_queue(v34, v35);
    id v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v36);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100154218;
    block[3] = &unk_1008F6010;
    void block[4] = self;
    dispatch_async(v37, block);
  }

  return 1;
}

- (BOOL)_processStunEchoRequest:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v66 = a7;
  uint64_t v67 = a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v68 = a4;
  uint64_t v65 = &keyData;
  *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v70[6] = v13;
  v70[7] = v13;
  v70[4] = v13;
  v70[5] = v13;
  v70[2] = v13;
  v70[3] = v13;
  v70[0] = v13;
  v70[1] = v13;
  v69[0] = v13;
  v69[1] = v13;
  v69[2] = v13;
  v69[3] = v13;
  v69[4] = v13;
  v69[5] = v13;
  v69[6] = v13;
  v69[7] = v13;
  memset(__b, 170, sizeof(__b));
  if ([v12 getAttribute:37 attribute:__b])
  {
    id v14 = (NSData *)__b[2];
    if ((__b[2] & 0x80000000) != 0)
    {
      uint64_t v15 = OSLogHandleForTransportCategory("UGL");
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = (_DWORD)v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "receive echo request with invalid count(%d), ignore.",  buf,  8u);
      }

      uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
      if ((_DWORD)v18)
      {
        if (_IDSShouldLogTransport(v18))
        {
          keyData = v14;
          _IDSLogTransport(@"UGL", @"IDS", @"receive echo request with invalid count(%d), ignore.");
          if (_IDSShouldLog(0LL, @"UGL"))
          {
            keyData = v14;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"receive echo request with invalid count(%d), ignore.");
          }
        }
      }

      goto LABEL_44;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  uint64_t v19 = OSLogHandleForTransportCategory("UGL");
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = SAToIPPortString(v70, 128LL, v67);
    uint64_t v22 = SAToIPPortString(v69, 128LL, v66);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = (_DWORD)v14;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v21;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v9;
    *(_WORD *)&buf[24] = 2080;
    *(void *)&buf[26] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "receive echo request (count:%04x) for %s(%u)-%s.",  buf,  0x22u);
  }

  uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
  if ((_DWORD)v24)
  {
    if (_IDSShouldLogTransport(v24))
    {
      uint64_t v25 = SAToIPPortString(v70, 128LL, v67);
      uint64_t v26 = SAToIPPortString(v69, 128LL, v66);
      uint64_t v63 = v9;
      uint64_t v64 = v26;
      keyData = v14;
      uint64_t v62 = v25;
      _IDSLogTransport(@"UGL", @"IDS", @"receive echo request (count:%04x) for %s(%u)-%s.");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        uint64_t v27 = SAToIPPortString(v70, 128LL, v67);
        uint64_t v28 = SAToIPPortString(v69, 128LL, v66);
        uint64_t v63 = v9;
        uint64_t v64 = v28;
        keyData = v14;
        uint64_t v62 = v27;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"receive echo request (count:%04x) for %s(%u)-%s.");
      }
    }
  }

  uint64_t v29 = _IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUDPGlobalLink.m",  736LL);
  memset(buf, 170, 0x5D0uLL);
  id v30 = [v12 getAttribute:32773 attribute:buf];
  if ((_DWORD)v30)
  {
    unsigned int v31 = *(unsigned __int16 *)&buf[12];
    double v32 = ids_monotonic_time(v30);
    uint64_t v33 = bswap32(v31) >> 16;
    if (qword_1009BEBB0 != -1) {
      dispatch_once(&qword_1009BEBB0, &stru_1008FBA88);
    }
  }

  else
  {
    unsigned __int16 v34 = 0;
    uint64_t v33 = 0LL;
  }

  id v35 = [[IDSStunMessage alloc] initWithType:4067];
  uint64_t v36 = *(void *)v29;
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v12 transactionID]);
  uint64_t v38 = *(void *)(v29 + 8);
  keyData = self->_keyData;
  [v35 stunResponseToBuffer:v36 outputLength:v29 + 16 transactionID:v37 reqCount:v14 echoTime:v33 delay:v34 keyData:keyData remainingLength:v38];

  uint64_t v39 = OSLogHandleForTransportCategory("UGL");
  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = SAToIPPortString(v70, 128LL, v67);
    int v42 = *(_DWORD *)(v29 + 48);
    uint64_t v43 = SAToIPPortString(v69, 128LL, v66);
    *(_DWORD *)v71 = 67109890;
    *(_DWORD *)v72 = (_DWORD)v14;
    *(_WORD *)&v72[4] = 2080;
    *(void *)&v72[6] = v41;
    __int16 v73 = 1024;
    int v74 = v42;
    __int16 v75 = 2080;
    uint64_t v76 = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "send echo response (count:%04x) for %s(%u)-%s.",  v71,  0x22u);
  }

  uint64_t v45 = os_log_shim_legacy_logging_enabled(v44);
  if ((_DWORD)v45)
  {
    if (_IDSShouldLogTransport(v45))
    {
      uint64_t v46 = SAToIPPortString(v70, 128LL, v67);
      uint64_t v47 = *(unsigned int *)(v29 + 48);
      uint64_t v48 = SAToIPPortString(v69, 128LL, v66);
      uint64_t v63 = v47;
      uint64_t v64 = v48;
      keyData = v14;
      uint64_t v62 = v46;
      _IDSLogTransport(@"UGL", @"IDS", @"send echo response (count:%04x) for %s(%u)-%s.");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        uint64_t v49 = SAToIPPortString(v70, 128LL, v67);
        uint64_t v50 = *(unsigned int *)(v29 + 48);
        uint64_t v51 = SAToIPPortString(v69, 128LL, v66);
        uint64_t v63 = v50;
        uint64_t v64 = v51;
        keyData = v14;
        uint64_t v62 = v49;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"send echo response (count:%04x) for %s(%u)-%s.");
      }
    }
  }

  unint64_t v52 = (unint64_t)-[IDSUDPLink sendPacketBuffer:toDeviceUniqueID:cbuuid:]( self->_udpLink,  "sendPacketBuffer:toDeviceUniqueID:cbuuid:",  v29,  self->_deviceUniqueID,  v68);
  if (v52)
  {
    uint64_t v53 = OSLogHandleForTransportCategory("UGL");
    __int16 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      if (v52 > 0xF) {
        uint64_t v55 = "UnexpectedSendResult";
      }
      else {
        uint64_t v55 = (const char *)_IDSLinkSendResultStrings[v52];
      }
      *(_DWORD *)v71 = 136315138;
      *(void *)v72 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "send echo response failed with %s",  v71,  0xCu);
    }

    uint64_t v57 = os_log_shim_legacy_logging_enabled(v56);
    if ((_DWORD)v57 && _IDSShouldLogTransport(v57))
    {
      uint64_t v58 = v52 > 0xF ? "UnexpectedSendResult" : (char *)_IDSLinkSendResultStrings[v52];
      keyData = (NSData *)v58;
      _IDSLogTransport(@"UGL", @"IDS", @"send echo response failed with %s");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        if (v52 > 0xF) {
          unint64_t v59 = "UnexpectedSendResult";
        }
        else {
          unint64_t v59 = (const char *)_IDSLinkSendResultStrings[v52];
        }
        keyData = (NSData *)v59;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"send echo response failed with %s");
      }
    }
  }

LABEL_44:
  return 1;
}

- (BOOL)_processStunEchoResponse:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45[6] = v16;
  v45[7] = v16;
  v45[4] = v16;
  v45[5] = v16;
  v45[2] = v16;
  v45[3] = v16;
  v45[0] = v16;
  v45[1] = v16;
  v44[0] = v16;
  v44[1] = v16;
  v44[2] = v16;
  v44[3] = v16;
  v44[4] = v16;
  v44[5] = v16;
  v44[6] = v16;
  v44[7] = v16;
  memset(__b, 170, sizeof(__b));
  if ([v14 getAttribute:37 attribute:__b])
  {
    uint64_t v17 = __b[2];
    p_sockAddrPairTable = &self->_sockAddrPairTable;
    int v19 = sub_1000BCDE8((uint64_t)p_sockAddrPairTable);
    if ((int)v17 < 1 || (int)v17 < v19)
    {
      uint64_t v27 = OSLogHandleForTransportCategory("UGL");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v47 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "receive old echo response (%d), ignore.",  buf,  8u);
      }

      uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
      if ((_DWORD)v30)
      {
        if (_IDSShouldLogTransport(v30))
        {
          _IDSLogTransport(@"UGL", @"IDS", @"receive old echo response (%d), ignore.");
        }
      }
    }

    else
    {
      if ([v14 getAttribute:32773 attribute:__b])
      {
        __int16 v20 = -256 * LOBYTE(__b[3]) - BYTE1(__b[3]);
        __int16 v21 = -256 * BYTE2(__b[3]) - HIBYTE(__b[3]);
        if (qword_1009BEBB0 != -1)
        {
          __int16 v43 = -256 * BYTE2(__b[3]) - HIBYTE(__b[3]);
          dispatch_once(&qword_1009BEBB0, &stru_1008FBA88);
          __int16 v21 = v43;
        }

        uint64_t v22 = (int)((double)(unsigned __int16)(v21
                                                           + v20
                                                           + ((unint64_t)((double)(unint64_t)qword_1009BEBA8
                                                                               + a8 * 4294967300.0) >> 22))
                                * 0.0009765625
                                * 1000.0);
      }

      else
      {
        uint64_t v22 = 0LL;
      }

      SAToIPPortString(v45, 128LL, a6);
      SAToIPPortString(v44, 128LL, a7);
      uint64_t v31 = OSLogHandleForTransportCategory("UGL");
      double v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110146;
        int v47 = v17;
        __int16 v48 = 1024;
        int v49 = v22;
        __int16 v50 = 2080;
        uint64_t v51 = v45;
        __int16 v52 = 1024;
        int v53 = v11;
        __int16 v54 = 2080;
        uint64_t v55 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "receive echo response (count:%04x, rtt:%4d ms) for %s(%u)-%s.",  buf,  0x28u);
      }

      uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
      if ((_DWORD)v34)
      {
        if (_IDSShouldLogTransport(v34))
        {
          uint64_t v41 = v11;
          int v42 = v44;
          uint64_t v39 = v22;
          uint64_t v40 = v45;
          uint64_t v38 = v17;
          _IDSLogTransport( @"UGL",  @"IDS",  @"receive echo response (count:%04x, rtt:%4d ms) for %s(%u)-%s.");
          if (_IDSShouldLog(0LL, @"UGL"))
          {
            int v42 = v44;
            uint64_t v40 = v45;
            uint64_t v41 = v11;
            uint64_t v38 = v17;
            uint64_t v39 = v22;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"UGL",  @"receive echo response (count:%04x, rtt:%4d ms) for %s(%u)-%s.");
          }
        }
      }

      id v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transactionID", v38, v39, v40, v41, v42));
      id v36 = [v35 bytes];

      sub_1000BB270((unsigned int *)p_sockAddrPairTable, (uint64_t)v36, 7LL);
    }
  }

  else
  {
    uint64_t v23 = OSLogHandleForTransportCategory("UGL");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "receive invalid echo resopnse.", buf, 2u);
    }

    uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
    if ((_DWORD)v26)
    {
      if (_IDSShouldLogTransport(v26))
      {
        _IDSLogTransport(@"UGL", @"IDS", @"receive invalid echo resopnse.");
      }
    }
  }

  return 1;
}

- (BOOL)_processStunDataIndication:(id)a3 fromDevice:(id)a4 localIfIndex:(unsigned int)a5 localAddress:(sockaddr *)a6 remmoteAddress:(sockaddr *)a7 arrivalTime:(double)a8 packetBuffer:(id *)a9 fromDeviceUniqueID:(id)a10 cbuuid:(id)a11
{
  uint64_t v14 = *(void *)&a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  id v20 = a11;
  *(void *)&__int128 v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v52[6] = v21;
  v52[7] = v21;
  v52[4] = v21;
  v52[5] = v21;
  v52[2] = v21;
  v52[3] = v21;
  v52[0] = v21;
  v52[1] = v21;
  v51[7] = v21;
  v51[6] = v21;
  v51[5] = v21;
  v51[4] = v21;
  v51[3] = v21;
  v51[2] = v21;
  v51[1] = v21;
  v51[0] = v21;
  bzero(v49, 0x5D0uLL);
  if (([v17 getAttribute:19 attribute:v49] & 1) == 0)
  {
    uint64_t v28 = OSLogHandleForTransportCategory("UGL");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "receive invalid data indication.", buf, 2u);
    }

    uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
    if ((_DWORD)v31)
    {
      if (_IDSShouldLogTransport(v31))
      {
        _IDSLogTransport(@"UGL", @"IDS", @"receive invalid data indication.");
      }
    }

    goto LABEL_22;
  }

  if (v50 <= 0)
  {
    uint64_t v32 = OSLogHandleForTransportCategory("UGL");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v50;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "invalid data attr length (%dB).", buf, 8u);
    }

    uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
    if ((_DWORD)v35)
    {
      if (_IDSShouldLogTransport(v35))
      {
        _IDSLogTransport(@"UGL", @"IDS", @"invalid data attr length (%dB).");
      }
    }

- (BOOL)_processStunPacket:(id *)a3 fromDevice:(id)a4 arrivalTime:(double)a5 fromDeviceUniqueID:(id)a6 cbuuid:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [[IDSStunMessage alloc] initWithType:0];
  if ([v15 read:a3->var0 inputLength:SLODWORD(a3->var2)])
  {
    unsigned __int16 v16 = (unsigned __int16)[v15 type];
    if (!self->_useStunMICheck) {
      goto LABEL_9;
    }
    if ([v15 verifyMessageIntegrityWithKey:self->_keyData inputBuffer:a3->var0 inputLength:LODWORD(a3->var2)])
    {
      uint64_t v17 = OSLogHandleForIDSCategory("UGL");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "### stun packet type %04x passed MI check.",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(1LL, @"UGL"))
      {
        uint64_t v55 = v16;
        _IDSLogV(1LL, @"IDSFoundation", @"UGL", @"### stun packet type %04x passed MI check.");
      }

- (BOOL)remoteHostAwake
{
  return 1;
}

- (unint64_t)sendPacketBuffer:(id *)a3 toDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (__rev16(*(unsigned __int16 *)a3->var0) == 57344 || !self->_useStunMICheck)
  {
    int64_t var2 = a3->var2;
    unint64_t v20 = (unint64_t)-[IDSUDPLink sendPacketBuffer:toDeviceUniqueID:cbuuid:]( self->_udpLink,  "sendPacketBuffer:toDeviceUniqueID:cbuuid:",  a3,  v8,  v9);
    if (v20) {
      goto LABEL_10;
    }
    goto LABEL_14;
  }

  uint64_t v10 = (void *)_IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUDPGlobalLink.m",  954LL);
  id v11 = [[IDSStunMessage alloc] initWithType:23];
  id v12 = (const char **)(v10 + 2);
  [v11 dataIndicationToBuffer:*v10 outputLength:v10 + 2 data:a3->var0 dataLen:LODWORD(a3->var2) keyData:self->_keyData remainingLength:v10[1]];
  uint64_t v13 = OSLogHandleForTransportCategory("UGL");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v15 = a3->var2;
    unsigned __int16 v16 = *v12;
    *(_DWORD *)buf = 134218240;
    int64_t v31 = v15;
    __int16 v32 = 2048;
    __int128 v33 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "send stun data indication (new:%zdB old:%zdB).",  buf,  0x16u);
  }

  uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
  if ((_DWORD)v18)
  {
    if (_IDSShouldLogTransport(v18))
    {
      int64_t v28 = a3->var2;
      __int128 v29 = *v12;
      _IDSLogTransport(@"UGL", @"IDS", @"send stun data indication (new:%zdB old:%zdB).");
      if (_IDSShouldLog(0LL, @"UGL"))
      {
        int64_t v28 = a3->var2;
        __int128 v29 = *v12;
        _IDSLogV(0LL, @"IDSFoundation", @"UGL", @"send stun data indication (new:%zdB old:%zdB).");
      }
    }
  }

  int64_t var2 = v10[2];
  unint64_t v20 = (unint64_t)-[IDSUDPLink sendPacketBuffer:toDeviceUniqueID:cbuuid:]( self->_udpLink,  "sendPacketBuffer:toDeviceUniqueID:cbuuid:",  v10,  v8,  v9,  v28,  v29);
  _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUDPGlobalLink.m",  965LL,  a3);

  if (!v20)
  {
LABEL_14:
    int64x2_t v24 = vdupq_n_s64(1uLL);
    v24.i64[0] = var2;
    *(int64x2_t *)&self->_totalBytesSent = vaddq_s64(*(int64x2_t *)&self->_totalBytesSent, v24);
  }

- (unint64_t)sendPacketBufferArray:(id *)a3 arraySize:(int)a4 toDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  return 12LL;
}

- (id)generateLinkReport:(double)a3 isCurrentLink:(BOOL)a4
{
  double previousReportTime = self->_previousReportTime;
  if (previousReportTime == 0.0)
  {
    uint64_t v13 = 0LL;
  }

  else
  {
    double v7 = a3 - previousReportTime;
    unint64_t v8 = self->_totalBytesSent - self->_previousBytesSent;
    unint64_t v9 = self->_totalBytesReceived - self->_previousBytesReceived;
    if (a4) {
      uint64_t v10 = 42LL;
    }
    else {
      uint64_t v10 = 32LL;
    }
    uint64_t v35 = v10;
    unint64_t state = self->_state;
    if (state > 6) {
      id v12 = "UnexpectedState";
    }
    else {
      id v12 = (const char *)_IDSLinkStateStrings[state];
    }
    __int128 v34 = v12;
    unint64_t v33 = self->_totalPacketsSent - self->_previousPacketsSent;
    uint64_t v14 = formattedBytes(v8, a2);
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = formattedSpeed((unint64_t)((double)(8 * v8) / v7 + 0.5));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    unint64_t totalPacketsSent = self->_totalPacketsSent;
    uint64_t v20 = formattedBytes(self->_totalBytesSent, v19);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    unint64_t v22 = self->_totalPacketsReceived - self->_previousPacketsReceived;
    uint64_t v24 = formattedBytes(v9, v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = formattedSpeed((unint64_t)((double)(8 * v9) / v7 + 0.5));
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unint64_t totalPacketsReceived = self->_totalPacketsReceived;
    uint64_t v30 = formattedBytes(self->_totalBytesReceived, v29);
    int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c Global    (%s) Tx %6llu pkts %@B %@bps     %6llu pkts %@B\n                        Rx %6llu pkts %@B %@bps     %6llu pkts %@B\n",  v35,  v34,  v33,  v15,  v17,  totalPacketsSent,  v21,  v22,  v25,  v27,  totalPacketsReceived,  v31));
  }

  self->_double previousReportTime = a3;
  self->_previousBytesSent = self->_totalBytesSent;
  *(_OWORD *)&self->_previousPacketsSent = *(_OWORD *)&self->_totalPacketsSent;
  self->_previousPacketsReceived = self->_totalPacketsReceived;
  return v13;
}

- (void)_forwardPacketBuffer:(id *)a3 fromDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained link:self didReceivePacket:a3 fromDeviceUniqueID:v10 cbuuid:v9];
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (a4)
  {
    if (a4->var2)
    {
      double v14 = ids_monotonic_time(v12);
      int64_t var2 = a4->var2;
      int64x2_t v16 = vdupq_n_s64(1uLL);
      v16.i64[0] = var2;
      *(int64x2_t *)&self->_totalBytesReceived = vaddq_s64(*(int64x2_t *)&self->_totalBytesReceived, v16);
      if (*a4->var0 == 15)
      {
        if (var2 < 21)
        {
          uint64_t v24 = OSLogHandleForIDSCategory("UGL");
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v26 = a4->var2;
            *(_DWORD *)buf = 134217984;
            int64_t v32 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "didReceivePacket - unknown packet (%zdB)",  buf,  0xCu);
          }
        }

        else
        {
          uint64_t v17 = bswap32(*(unsigned __int16 *)(a4->var0 + 1)) >> 16;
          if ((v17 & 0xC000) == 0)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
            uint64_t v19 = OSLogHandleForIDSCategory("UGL");
            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              int64_t v21 = a4->var2;
              *(_DWORD *)buf = 134218498;
              int64_t v32 = v21;
              __int16 v33 = 1024;
              int v34 = v17;
              __int16 v35 = 2112;
              __int128 v36 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "didReceivePacket - STUN packet (%zdB) [type:%04X %@]",  buf,  0x1Cu);
            }

            if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(1LL, @"UGL"))
            {
              uint64_t v29 = v17;
              uint64_t v30 = v18;
              int64_t v28 = a4->var2;
              _IDSLogV( 1LL,  @"IDSFoundation",  @"UGL",  @"didReceivePacket - STUN packet (%zdB) [type:%04X %@]");
            }

            -[IDSUDPGlobalLink _processStunPacket:fromDevice:arrivalTime:fromDeviceUniqueID:cbuuid:]( self,  "_processStunPacket:fromDevice:arrivalTime:fromDeviceUniqueID:cbuuid:",  a4,  v13,  v11,  v13,  v14,  v28,  v29,  v30);
          }
        }
      }

      else
      {
        -[IDSUDPGlobalLink _forwardPacketBuffer:fromDeviceUniqueID:cbuuid:]( self,  "_forwardPacketBuffer:fromDeviceUniqueID:cbuuid:",  a4,  v11,  v13);
      }

      LOBYTE(a4) = 1;
    }

    else
    {
      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (NSString)cbuuid
{
  return (NSString *)objc_getProperty(self, a2, 1880LL, 1);
}

- (void)setCbuuid:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 1888LL, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (IDSLinkDelegate)delegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSLinkDelegate)alternateDelegate
{
  return (IDSLinkDelegate *)objc_loadWeakRetained((id *)&self->_alternateDelegate);
}

- (void)setAlternateDelegate:(id)a3
{
}

- (NSString)localPartyID
{
  return self->_localPartyID;
}

- (void)setLocalPartyID:(id)a3
{
}

- (NSString)remotePartyID
{
  return self->_remotePartyID;
}

- (void)setRemotePartyID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end