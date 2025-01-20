@interface DTXConnection
+ (id)connectionToAddress:(id)a3;
+ (void)initialize;
+ (void)observeDecompressionExceptionLogging:(id)a3;
+ (void)registerTransport:(Class)a3 forScheme:(id)a4;
- (BOOL)_addHandler:(id)a3 forMessage:(unsigned int)a4 channel:(id)a5;
- (BOOL)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5 error:(id *)a6;
- (BOOL)remoteTracer;
- (BOOL)sendMessage:(id)a3 fromChannel:(id)a4 sendMode:(int)a5 syncWithReply:(BOOL)a6 replyHandler:(id)a7;
- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4;
- (BOOL)tracer;
- (DTXChannel)defaultChannel;
- (DTXConnection)initWithTransport:(id)a3;
- (NSString)description;
- (NSString)label;
- (double)preflightSynchronouslyWithTimeout:(double)a3;
- (id)_makeProxyChannelWithRemoteInterface:(id)a3 remoteInterfaceName:(id)a4 exportedInterface:(id)a5 exportedInterfaceName:(id)a6;
- (id)_sendHeartbeatAsyncWithTimeout:(double)a3;
- (id)_testing_remoteCapabilityVersions;
- (id)localCapabilities;
- (id)makeChannelWithIdentifier:(id)a3;
- (id)makeProxyChannelWithRemoteInterface:(id)a3 exportedInterface:(id)a4;
- (id)publishedAddresses;
- (id)remoteCapabilityVersions;
- (int)atomicConnectionNumber;
- (int)remoteCapabilityVersion:(id)a3;
- (unint64_t)maximumEnqueueSize;
- (void)_cancelInternal:(id)a3;
- (void)_channelCanceled:(unsigned int)a3;
- (void)_handleMessageParseException:(id)a3 forChannelCode:(unsigned int)a4 messageID:(unsigned int)a5 fragmentCount:(unsigned int)a6 withPayloadBytes:(const void *)a7 ofLength:(unint64_t)a8;
- (void)_handleMissingRemoteCapabilities;
- (void)_handleProxyRequestForInterface:(id)a3 interfaceName:(id)a4 peerInterface:(id)a5 peerInterfaceName:(id)a6 handler:(id)a7;
- (void)_notifyCompressionHint:(unsigned int)a3 forChannelCode:(unsigned int)a4;
- (void)_notifyOfPublishedCapabilities:(id)a3;
- (void)_receiveQueueSetCompressionHint:(unsigned int)a3 onChannel:(id)a4;
- (void)_requestChannelWithCode:(unsigned int)a3 identifier:(id)a4;
- (void)_routeMessage:(id)a3;
- (void)_scheduleMessage:(id)a3 toChannel:(id)a4;
- (void)_setTracerState:(unsigned int)a3;
- (void)_setupWireProtocols;
- (void)_unregisterChannel:(id)a3;
- (void)cancel;
- (void)cancelWithSerializedTransport:(id)a3;
- (void)dealloc;
- (void)handleProxyRequestForInterface:(id)a3 peerInterface:(id)a4 handler:(id)a5;
- (void)overridePermittedBlockCompressors:(id)a3;
- (void)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5;
- (void)publishServicesInImagePath:(id)a3;
- (void)registerCapabilityOverrideBlock:(id)a3;
- (void)registerDisconnectHandler:(id)a3;
- (void)replaceCompressorForCompression:(id)a3;
- (void)replaceCompressorForDecompression:(id)a3;
- (void)resume;
- (void)sendControlAsync:(id)a3 replyHandler:(id)a4;
- (void)sendControlSync:(id)a3 replyHandler:(id)a4;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageSync:(id)a3 replyHandler:(id)a4;
- (void)setChannelHandler:(id)a3;
- (void)setCompressionHint:(int)a3 forChannel:(id)a4;
- (void)setDispatchTarget:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaximumEnqueueSize:(unint64_t)a3;
- (void)setMessageHandler:(id)a3;
- (void)setRemoteTracer:(BOOL)a3;
- (void)setTracer:(BOOL)a3;
- (void)suspend;
@end

@implementation DTXConnection

+ (void)initialize
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    dispatch_queue_t v2 = dispatch_queue_create("connection transport registry guard", 0LL);
    v3 = (void *)qword_18C4FE7A8;
    qword_18C4FE7A8 = (uint64_t)v2;

    uint64_t v4 = objc_opt_new();
    v5 = (void *)qword_18C4FE7B0;
    qword_18C4FE7B0 = v4;

    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v6, v7);
    qword_18C4FE7B8 = v8;
    os_log_t v9 = os_log_create("com.apple.dt.DTXConnectionServices", "DTXConnection");
    v10 = (void *)qword_18C4FE7C0;
    qword_18C4FE7C0 = (uint64_t)v9;

    os_log_t v11 = os_log_create("com.apple.dt.DTXConnectionServices", "Capabilities");
    v12 = (void *)qword_18C4FE7C8;
    qword_18C4FE7C8 = (uint64_t)v11;

    uint64_t v13 = objc_opt_new();
    v14 = (void *)qword_18C4FE7A0;
    qword_18C4FE7A0 = v13;

    objc_msgSend_setErrorStatus_((void *)qword_18C4FE7A0, v15, 2);
    objc_msgSend__makeImmutable((void *)qword_18C4FE7A0, v16, v17);
    pthread_key_create((pthread_key_t *)&qword_18C4FE7D0, 0LL);
    objc_msgSend_standardUserDefaults(MEMORY[0x189604038], v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    byte_18C4FE7D8 = objc_msgSend_BOOLForKey_(v20, v21, (uint64_t)@"DTXConnectionTracer");

    if (byte_18C4FE7D8)
    {
      v22 = (void *)NSString;
      v23 = getprogname();
      uint64_t v24 = getpid();
      objc_msgSend_stringWithFormat_(v22, v25, (uint64_t)@"%s[%d].DTXConnection.XXXXXX.log", v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSTemporaryDirectory();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      id v29 = objc_msgSend_stringByAppendingPathComponent_(v27, v28, (uint64_t)v26);
      v32 = (const char *)objc_msgSend_fileSystemRepresentation(v29, v30, v31);

      v33 = strdup(v32);
      int v34 = mkstemps(v33, 4);
      qword_18C7403E0 = (uint64_t)fdopen(v34, "we");
      setlinebuf((FILE *)qword_18C7403E0);
      v35 = (void *)qword_18C4FE7C0;
      if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
      {
        v36 = v35;
        *(_DWORD *)buf = 136315650;
        v38 = getprogname();
        __int16 v39 = 1024;
        pid_t v40 = getpid();
        __int16 v41 = 2080;
        v42 = v33;
        _os_log_impl( &dword_188BBF000,  v36,  OS_LOG_TYPE_ERROR,  "%s[%d]: Global DTXConnection log enabled - also written to '%s'",  buf,  0x1Cu);
      }

      free(v33);
    }
  }

+ (void)registerTransport:(Class)a3 forScheme:(id)a4
{
  id v5 = a4;
  if (a3 && v5)
  {
    v6 = (dispatch_queue_s *)qword_18C4FE7A8;
    block[1] = 3221225472LL;
    block[2] = sub_188BC7648;
    block[3] = &unk_18A2ED8E0;
    Class v10 = a3;
    id v7 = v5;
    block[0] = MEMORY[0x1895F87A8];
    id v9 = v5;
    dispatch_sync(v6, block);

    id v5 = v7;
  }
}

- (void)publishServicesInImagePath:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (char *)a3;
  id v7 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6))
  {
    uint64_t v8 = (os_log_s *)qword_18C4FE7C8;
    if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v7;
      _os_log_impl(&dword_188BBF000, v8, OS_LOG_TYPE_INFO, "registering capabilities in image: %{public}@", buf, 0xCu);
    }

    id v9 = v7;
    v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = MEMORY[0x1895F87A8];
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = sub_188BC7CAC;
    v35[3] = &unk_18A2ED908;
    v35[4] = self;
    sub_188BC7A04(v12, sel_registerCapabilities_, v13, v35);
    v15 = v9;
    v18 = (const char *)objc_msgSend_UTF8String(v15, v16, v17);
    v31[0] = v14;
    v31[1] = 3221225472LL;
    v32 = sub_188BC7D94;
    v33 = &unk_18A2ED908;
    int v34 = self;
    uint64_t v19 = v31;
    objc_getProtocol("DTTapServiceDelegate");
    v20 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (!v20) {
      goto LABEL_25;
    }
    v21 = sub_188BCEAB4(v18);
    unsigned int outCount = 0;
    v22 = objc_copyClassNamesForImage(v21, &outCount);
    v23 = (os_log_s *)qword_18C4FE7C8;
    if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = "<nil image?>";
      if (v18) {
        uint64_t v24 = v18;
      }
      *(_DWORD *)buf = 136315394;
      v38 = v24;
      __int16 v39 = 1024;
      unsigned int v40 = outCount;
      _os_log_impl(&dword_188BBF000, v23, OS_LOG_TYPE_DEBUG, "scanning image %s (%u classes)", buf, 0x12u);
    }

    if (outCount)
    {
      for (unint64_t i = 0LL; i < outCount; ++i)
      {
        v26 = (os_log_s *)qword_18C4FE7C8;
        if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_DEBUG))
        {
          v27 = v22[i];
          if (!v27) {
            v27 = "<nil className>";
          }
          *(_DWORD *)buf = 136315138;
          v38 = v27;
          _os_log_impl(&dword_188BBF000, v26, OS_LOG_TYPE_DEBUG, "checking class %s", buf, 0xCu);
        }

        v28 = v22[i];
        if (v28)
        {
          Class = objc_getClass(v28);
          if (class_conformsToProtocol(Class, v20))
          {
            v30 = (os_log_s *)qword_18C4FE7C8;
            if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_188BBF000,  v30,  OS_LOG_TYPE_DEBUG,  "protocol matched for class, calling block",  buf,  2u);
            }

            v32((uint64_t)v19, Class);
          }
        }
      }
    }

    else if (!v22)
    {
LABEL_25:

      goto LABEL_26;
    }

    free(v22);
    goto LABEL_25;
  }

- (void)setCompressionHint:(int)a3 forChannel:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC7F60;
  block[3] = &unk_18A2ED930;
  void block[4] = self;
  int v16 = v4;
  id v13 = v6;
  id v15 = v13;
  dispatch_sync((dispatch_queue_t)handler_queue, block);
  uint64_t v10 = (uint64_t)v13;
  if (v13) {
    uint64_t v10 = objc_msgSend_channelCode(v13, v8, v9);
  }
  objc_msgSend_messageWithSelector_typesAndArguments_( DTXMessage,  v8,  (uint64_t)sel__notifyCompressionHint_forChannelCode_,  3,  v4,  3,  v10,  0);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v12, (uint64_t)v11, 0, 2, 0, 0);
}

+ (id)connectionToAddress:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = v4;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2050000000LL;
  uint64_t v27 = 0LL;
  objc_msgSend_scheme(v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (dispatch_queue_s *)qword_18C4FE7A8;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  v20 = sub_188BCEBC4;
  v21 = &unk_18A2ED7C8;
  v23 = &v24;
  id v11 = v9;
  id v22 = v11;
  dispatch_sync(v10, &v18);
  id v12 = objc_alloc((Class)v25[3]);
  uint64_t v14 = (void *)objc_msgSend_initWithRemoteAddress_(v12, v13, (uint64_t)v6, v18, v19, v20, v21);

  _Block_object_dispose(&v24, 8);
  int v16 = (void *)objc_msgSend_initWithTransport_(v5, v15, (uint64_t)v14);

  return v16;
}

- (void)_handleMessageParseException:(id)a3 forChannelCode:(unsigned int)a4 messageID:(unsigned int)a5 fragmentCount:(unsigned int)a6 withPayloadBytes:(const void *)a7 ofLength:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  v94[6] = *MEMORY[0x1895F89C0];
  id v13 = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    LODWORD(v92[0]) = v12;
    WORD2(v92[0]) = 2048;
    *(void *)((char *)v92 + 6) = a8;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "exception handler called for message parsing: channel code:%u, payload length:%llu",  buf,  0x12u);
  }

  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    while (1)
    {
LABEL_38:
      objc_exception_throw(v13);
LABEL_39:
      id v59 = objc_msgSend_localizedDescription((void *)v11, v77, v78);
      v79 = (const char *)objc_msgSend_UTF8String(v59, v82, v83);
LABEL_40:
      *(_DWORD *)buf = 136315138;
      v92[0] = v79;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failed to create DTXConnection log dir, nowhere to write to failure log: %s",  buf,  0xCu);
      if (v11) {
LABEL_36:
      }

LABEL_37:
    }
  }

  v94[0] = &unk_18A2F2F58;
  v93[0] = @"Version";
  v93[1] = @"ChannelCode";
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v14, v12);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v15;
  v93[2] = @"MessageID";
  uint64_t v11 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v16, v11);
  v94[2] = v11;
  v93[3] = @"FragmentCount";
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v17, v10);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v18;
  v93[4] = @"SerializedDataRawLength";
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v19, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v20;
  v93[5] = @"SerializedDataBase64";
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x189603F48], v21, (uint64_t)a7, a8, 0);
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v22, v23, 0);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v94[5] = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v25, (uint64_t)v94, v93, 6);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  id v86 = 0LL;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1896078D8], v27, (uint64_t)v26, 1, &v86);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = v86;
  v32 = v29;
  if (!v28 || v29)
  {
    id v59 = (id)MEMORY[0x1895F8DA0];
    id v60 = MEMORY[0x1895F8DA0];
    if (!os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    if (v32)
    {
      id v59 = objc_msgSend_localizedDescription(v32, v61, v62);
      v65 = (const char *)objc_msgSend_UTF8String(v59, v63, v64);
    }

    else
    {
      v65 = "{no error available}";
    }

    *(_DWORD *)buf = 136315138;
    v92[0] = v65;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failed to serialize log content to JSON: %s",  buf,  0xCu);
    if (!v32) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x1896078A8], v30, v31);
  id v85 = 0LL;
  objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_((void *)v11, v33, 5, 1, 0, 0, &v85);
  int v34 = (void *)objc_claimAutoreleasedReturnValue();
  id v35 = v85;

  if (v35)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v68 = objc_msgSend_localizedDescription(v35, v66, v67);
      uint64_t v71 = objc_msgSend_UTF8String(v68, v69, v70);
      *(_DWORD *)buf = 136315138;
      v92[0] = v71;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failed to get ~/Library NSURL, nowhere to write to failure log: %s",  buf,  0xCu);
    }

    goto LABEL_38;
  }

  uint64_t v37 = objc_msgSend_URLWithString_relativeToURL_(MEMORY[0x189604030], v36, (uint64_t)@"Logs/DTXConnection", v34);
  if (!v37)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    v72 = (os_log_s *)MEMORY[0x1895F8DA0];
    v73 = "failed to build DTXConnection log dir URL, nowhere to write to failure log";
    v74 = buf;
    uint32_t v75 = 2;
LABEL_33:
    _os_log_impl(&dword_188BBF000, v72, OS_LOG_TYPE_ERROR, v73, v74, v75);
    goto LABEL_38;
  }

  unsigned int v40 = (void *)v37;
  objc_msgSend_defaultManager(MEMORY[0x1896078A8], v38, v39);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  id v84 = 0LL;
  int v43 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_( v41,  v42,  (uint64_t)v40,  1,  0,  &v84);
  uint64_t v11 = (uint64_t)v84;

  if (!v43 || v11)
  {
    id v59 = (id)MEMORY[0x1895F8DA0];
    id v76 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
    {
      if (!v11)
      {
        v79 = "<no error returned>";
        goto LABEL_40;
      }

      goto LABEL_39;
    }

    goto LABEL_37;
  }

  objc_msgSend_path(v40, v44, v45);
  uint64_t v11 = (uint64_t) objc_claimAutoreleasedReturnValue();
  v48 = (const char *)objc_msgSend_UTF8String((void *)v11, v46, v47);
  pid_t v49 = getpid();
  snprintf((char *)buf, 0x400uLL, "%s/FailedDecompression-%d-XXXXXX.log", v48, v49);

  uint64_t v50 = mkstemps((char *)buf, 4);
  if ((_DWORD)v50 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    v80 = __error();
    v81 = strerror(*v80);
    *(_DWORD *)v87 = 136315394;
    v88 = buf;
    __int16 v89 = 2080;
    v90 = v81;
    v72 = (os_log_s *)MEMORY[0x1895F8DA0];
    v73 = "failed to create file '%s': %s";
    v74 = v87;
    uint32_t v75 = 22;
    goto LABEL_33;
  }

  uint64_t v11 = v50;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v87 = 136315138;
    v88 = buf;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "writing failed decompression log to '%s'",  v87,  0xCu);
  }

  id v51 = objc_alloc(NSString);
  id v53 = objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v28, 4);
  v56 = (const char *)objc_msgSend_UTF8String(v53, v54, v55);
  dprintf(v11, "%s", v56);

  if ((v11 & 0x80000000) == 0 && close(v11) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    v57 = __error();
    v58 = strerror(*v57);
    *(_DWORD *)v87 = 136315394;
    v88 = buf;
    __int16 v89 = 2080;
    v90 = v58;
    _os_log_impl(&dword_188BBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "failed to close file '%s': %s", v87, 0x16u);
  }
}

- (void)_setupWireProtocols
{
  p_incomingParser = (id *)&self->_incomingParser;
  id v5 = (id)objc_msgSend_parsingComplete(self->_incomingParser, a2, v2);
  id v6 = *p_incomingParser;
  id *p_incomingParser = 0LL;

  outgoingTransmitter = self->_outgoingTransmitter;
  self->_outgoingTransmitter = 0LL;

  objc_msgSend_resourceTracker(self->_controlTransport, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_188BC8900;
  id v29 = sub_188BC8910;
  id v30 = 0LL;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___DTXMessageParser);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = sub_188BC8918;
  v21[3] = &unk_18A2ED980;
  id v13 = v10;
  id v22 = v13;
  v23 = self;
  uint64_t v24 = &v25;
  v20[0] = v12;
  v20[1] = 3221225472LL;
  v20[2] = sub_188BC8A28;
  v20[3] = &unk_18A2ED9A8;
  v20[4] = self;
  uint64_t v15 = objc_msgSend_initWithMessageHandler_andParseExceptionHandler_(v11, v14, (uint64_t)v21, v20);
  int v16 = (void *)v26[5];
  v26[5] = v15;

  objc_storeStrong(p_incomingParser, (id)v26[5]);
  uint64_t v17 = (DTXMessageTransmitter *)objc_opt_new();
  uint64_t v18 = self->_outgoingTransmitter;
  self->_outgoingTransmitter = v17;

  objc_msgSend_setSuggestedFragmentSize_(self->_outgoingTransmitter, v19, 0x10000);
  _Block_object_dispose(&v25, 8);
}

- (DTXConnection)initWithTransport:(id)a3
{
  id v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)&OBJC_CLASS___DTXConnection;
  id v6 = -[DTXConnection init](&v69, sel_init);
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_controlTransport, a3);
      uint64_t v10 = objc_msgSend_permittedBlockCompressionTypes(v5, v8, v9);
      uint64_t v11 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v10;

      uint64_t v14 = objc_msgSend_resourceTracker(*(void **)(v7 + 32), v12, v13);
      uint64_t v15 = *(void **)(v7 + 144);
      *(void *)(v7 + 144) = v14;

      uint64_t v16 = objc_opt_new();
      uint64_t v17 = *(void **)(v7 + 88);
      *(void *)(v7 + 88) = v16;

      uint64_t v18 = objc_opt_new();
      uint64_t v19 = *(void **)(v7 + 96);
      *(void *)(v7 + 96) = v18;

      uint64_t v20 = objc_opt_new();
      v21 = *(void **)(v7 + 72);
      *(void *)(v7 + 72) = v20;

      uint64_t v22 = objc_opt_new();
      v23 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v22;

      uint64_t v24 = objc_opt_new();
      uint64_t v25 = *(void **)(v7 + 136);
      *(void *)(v7 + 136) = v24;

      dispatch_queue_t v26 = dispatch_queue_create("connection control queue", 0LL);
      uint64_t v27 = *(void **)(v7 + 24);
      *(void *)(v7 + 24) = v26;

      dispatch_queue_t v28 = dispatch_queue_create_with_target_V2("connection data queue", 0LL, *(dispatch_queue_t *)(v7 + 24));
      id v29 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v28;

      dispatch_queue_t v30 = dispatch_queue_create("connection handler queue", 0LL);
      uint64_t v31 = *(void **)(v7 + 56);
      *(void *)(v7 + 56) = v30;

      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v32 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v33 = dispatch_queue_create_with_target_V2("connection receive queue", v32, *(dispatch_queue_t *)(v7 + 56));
      int v34 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v33;

      dispatch_semaphore_t v35 = dispatch_semaphore_create(0LL);
      v36 = *(void **)(v7 + 152);
      *(void *)(v7 + 152) = v35;

      uint64_t v37 = objc_opt_new();
      v38 = *(void **)(v7 + 104);
      *(void *)(v7 + 104) = v37;

      uint64_t v39 = objc_opt_new();
      unsigned int v40 = *(void **)(v7 + 112);
      *(void *)(v7 + 112) = v39;

      do
      {
        unsigned int v43 = __ldaxr((unsigned int *)&unk_18C4FE7E0);
        unsigned int v44 = v43 + 1;
      }

      while (__stlxr(v44, (unsigned int *)&unk_18C4FE7E0));
      *(_DWORD *)(v7 + 188) = v44;
      objc_msgSend_suspend((void *)v7, v41, v42);
      int v47 = byte_18C4FE7D8;
      *(_BYTE *)(v7 + 184) = byte_18C4FE7D8;
      if (v47) {
        *(void *)(v7 + 200) = 0x80000LL;
      }
      objc_msgSend_standardUserDefaults(MEMORY[0x189604038], v45, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      int v50 = objc_msgSend_integerForKey_(v48, v49, (uint64_t)@"DefaultBlockCompressionType");
      if (v50) {
        int v52 = v50;
      }
      else {
        int v52 = 3;
      }
      *(_DWORD *)(v7 + 216) = v52;
      uint64_t v53 = objc_msgSend_integerForKey_(v48, v51, (uint64_t)@"CompressionMinSizeThreshold");
      uint64_t v54 = 0x4000LL;
      if (v53) {
        uint64_t v54 = v53;
      }
      *(void *)(v7 + 224) = v54;
      *(_DWORD *)(v7 + 212) = 1;
      *(_DWORD *)(v7 + 64) = 1;
      uint64_t v55 = objc_alloc(&OBJC_CLASS___DTXChannel);
      uint64_t v57 = objc_msgSend_initWithConnection_channelIdentifier_label_(v55, v56, v7, 0, 0);
      v58 = *(void **)(v7 + 176);
      *(void *)(v7 + 176) = v57;

      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(v7 + 72), v59, *(void *)(v7 + 176), &unk_18A2F2F70);
      uint64_t BlockCompressor = objc_msgSend_createBlockCompressor(DTXBlockCompressorFactory, v60, v61);
      v63 = *(void **)(v7 + 232);
      *(void *)(v7 + 232) = BlockCompressor;

      objc_msgSend__setupWireProtocols((void *)v7, v66, v67);
    }

    else
    {
      v48 = v6;
      uint64_t v7 = 0LL;
    }
  }

  return (DTXConnection *)v7;
}

- (void)dealloc
{
  firstMessageSem = self->_firstMessageSem;
  if (firstMessageSem && self->_remoteCapabilityVersions) {
    dispatch_semaphore_wait((dispatch_semaphore_t)firstMessageSem, 0xFFFFFFFFFFFFFFFFLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXConnection;
  -[DTXConnection dealloc](&v4, sel_dealloc);
}

- (id)publishedAddresses
{
  return (id)((uint64_t (*)(DTXTransport *, char *))MEMORY[0x189616718])( self->_controlTransport,  sel_localAddresses);
}

- (NSString)description
{
  v3 = (void *)NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  return (NSString *)objc_msgSend_stringWithFormat_( v3,  v6,  (uint64_t)@"<%s %p : x%d>",  Name,  self,  self->_connectionIndex);
}

- (void)setMaximumEnqueueSize:(unint64_t)a3
{
  if (*MEMORY[0x1895FD590] <= a3)
  {
    unint64_t v4 = a3;
    objc_msgSend_setTotalSize_(self->_resourceTracker, a2, a3);
  }

  else
  {
    unint64_t v4 = *MEMORY[0x1895FD590];
    objc_msgSend_setTotalSize_(self->_resourceTracker, a2, *MEMORY[0x1895FD590]);
  }

  objc_msgSend_setMaxChunkSize_(self->_resourceTracker, v5, v4 >> 3);
  objc_msgSend_resourceTracker(self->_controlTransport, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTotalSize_(v9, v8, v4);
}

- (unint64_t)maximumEnqueueSize
{
  return ((uint64_t (*)(DTXResourceTracker *, char *))MEMORY[0x189616718])( self->_resourceTracker,  sel_totalSize);
}

- (void)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v13 = 0LL;
  char v5 = objc_msgSend_publishCapability_withVersion_forClass_error_(self, a2, (uint64_t)a3, *(void *)&a4, a5, &v13);
  id v6 = v13;
  uint64_t v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      uint64_t v8 = (void *)qword_18C4FE7C0;
      if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
      {
        id v9 = v8;
        objc_msgSend_localizedDescription(v7, v10, v11);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v12;
        _os_log_impl(&dword_188BBF000, v9, OS_LOG_TYPE_ERROR, "Failed to publish capability: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)publishCapability:(id)a3 withVersion:(int)a4 forClass:(Class)a5 error:(id *)a6
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  uint64_t v29 = 0LL;
  dispatch_queue_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_188BC8900;
  dispatch_queue_t v33 = sub_188BC8910;
  id v34 = 0LL;
  handler_queue = self->_handler_queue;
  uint64_t v20 = MEMORY[0x1895F87A8];
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = sub_188BC9108;
  v23 = &unk_18A2ED9D0;
  uint64_t v24 = self;
  dispatch_queue_t v26 = &v29;
  int v28 = a4;
  id v12 = v10;
  id v25 = v12;
  Class v27 = a5;
  dispatch_sync((dispatch_queue_t)handler_queue, &v20);
  uint64_t v14 = v30[5];
  if (a6 && v14)
  {
    uint64_t v15 = (void *)MEMORY[0x189607870];
    uint64_t v35 = *MEMORY[0x1896075E0];
    v36[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_( MEMORY[0x189603F68],  v13,  (uint64_t)v36,  &v35,  1,  v20,  v21,  v22,  v23,  v24);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, (uint64_t)@"DTXConnection", 2, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = v30[5];
  }

  BOOL v18 = v14 == 0;

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (id)localCapabilities
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_188BC8900;
  id v10 = sub_188BC8910;
  id v11 = 0LL;
  handler_queue = self->_handler_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BC94CC;
  v5[3] = &unk_18A2ED7C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)handler_queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_sendHeartbeatAsyncWithTimeout:(double)a3
{
  char v5 = (void *)objc_opt_new();
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  v17[3] = 0LL;
  uint64_t v6 = kDTXHeartbeatMessage;
  defaultChannel = self->_defaultChannel;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = sub_188BC960C;
  v13[3] = &unk_18A2ED9F8;
  double v16 = a3;
  uint64_t v15 = v17;
  v13[4] = self;
  id v8 = v5;
  id v14 = v8;
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v9, v6, defaultChannel, 2, 0, v13);
  id v10 = v14;
  id v11 = v8;

  _Block_object_dispose(v17, 8);
  return v11;
}

- (double)preflightSynchronouslyWithTimeout:(double)a3
{
  uint64_t v16 = 0LL;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  objc_msgSend__sendHeartbeatAsyncWithTimeout_(self, v6, v7, a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = sub_188BC98A0;
  v13[3] = &unk_18A2EDA20;
  uint64_t v15 = &v16;
  id v9 = v5;
  id v14 = v9;
  objc_msgSend_handleCompletion_(v8, v10, (uint64_t)v13);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  double v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (void)_handleMissingRemoteCapabilities
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  receive_queue = self->_receive_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BC99B4;
  v5[3] = &unk_18A2ED578;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)receive_queue, v5);
  if (*((_BYTE *)v7 + 24))
  {
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self,  v4,  kDTXAckBarrierMessage,  self->_defaultChannel,  2,  0,  0);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_firstMessageSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_firstMessageSem);
  }

  _Block_object_dispose(&v6, 8);
}

- (int)remoteCapabilityVersion:(id)a3
{
  id v6 = a3;
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  if (!remoteCapabilityVersions)
  {
    objc_msgSend__handleMissingRemoteCapabilities(self, v4, v5);
    remoteCapabilityVersions = self->_remoteCapabilityVersions;
  }

  objc_msgSend_null(MEMORY[0x189603FE8], v4, v5);
  uint64_t v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (remoteCapabilityVersions == v8
    || (objc_msgSend_objectForKey_(self->_remoteCapabilityVersions, v9, (uint64_t)v6),
        (id v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    int v14 = 0x80000000;
  }

  else
  {
    id v13 = v10;
    int v14 = objc_msgSend_intValue(v10, v11, v12);
  }

  return v14;
}

- (void)registerCapabilityOverrideBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    handler_queue = self->_handler_queue;
    block[1] = 3221225472LL;
    block[2] = sub_188BC9B44;
    block[3] = &unk_18A2ED500;
    void block[4] = self;
    id v6 = v4;
    block[0] = MEMORY[0x1895F87A8];
    id v8 = v4;
    dispatch_sync((dispatch_queue_t)handler_queue, block);

    id v4 = v6;
  }
}

- (id)remoteCapabilityVersions
{
  if (!self->_remoteCapabilityVersions) {
    objc_msgSend__handleMissingRemoteCapabilities(self, a2, v2);
  }
  id v4 = (void *)objc_opt_new();
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  objc_msgSend_null(MEMORY[0x189603FE8], v6, v7);
  id v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (remoteCapabilityVersions != v8) {
    objc_msgSend_addEntriesFromDictionary_(v4, v9, (uint64_t)self->_remoteCapabilityVersions);
  }
  id v10 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = sub_188BC9CD4;
  v15[3] = &unk_18A2EDA48;
  id v16 = v10;
  id v11 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v12, (uint64_t)v15);
  objc_msgSend_removeObjectsForKeys_(v4, v13, (uint64_t)v11);

  return v4;
}

- (void)suspend
{
}

- (void)resume
{
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC9DA8;
  block[3] = &unk_18A2ED618;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)handler_queue, block);
}

- (void)setMessageHandler:(id)a3
{
}

- (void)setDispatchTarget:(id)a3
{
}

- (void)setChannelHandler:(id)a3
{
  id v4 = a3;
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BCA244;
  block[3] = &unk_18A2ED500;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)handler_queue, block);
}

- (void)registerDisconnectHandler:(id)a3
{
}

- (void)cancel
{
}

- (void)cancelWithSerializedTransport:(id)a3
{
  uint64_t v5 = (const char *)a3;
  char v9 = (char *)v5;
  if (v5)
  {
    objc_msgSend__cancelInternal_(self, v5, (uint64_t)v5);
  }

  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], 0, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v7,  v8,  (uint64_t)a2,  self,  @"DTXConnection.m",  881,  @"Invalid parameter not satisfying: %@",  @"transportCallback != nil");

    objc_msgSend__cancelInternal_(self, 0, 0);
  }
}

- (void)_cancelInternal:(id)a3
{
  id v4 = a3;
  receive_queue = self->_receive_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_188BCA39C;
  v7[3] = &unk_18A2ED500;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)receive_queue, v7);
}

- (void)sendControlAsync:(id)a3 replyHandler:(id)a4
{
}

- (void)sendControlSync:(id)a3 replyHandler:(id)a4
{
}

- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4
{
  return MEMORY[0x189616718](self->_defaultChannel, sel_sendMessageAsync_replyHandler_, a3);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
}

- (void)sendMessageSync:(id)a3 replyHandler:(id)a4
{
}

- (BOOL)sendMessage:(id)a3 fromChannel:(id)a4 sendMode:(int)a5 syncWithReply:(BOOL)a6 replyHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v16 = a7;
  BOOL v17 = 0;
  if (v12 && (id)kDTXInterruptionMessage != v12)
  {
    unint64_t v18 = objc_msgSend_serializedLength(v12, v14, v15);
    unint64_t v21 = v18;
    unint64_t logMessageCallstackSizeThreshold = self->_logMessageCallstackSizeThreshold;
    if (logMessageCallstackSizeThreshold
      && v18 > logMessageCallstackSizeThreshold
      && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      objc_msgSend_callStackSymbols(MEMORY[0x189607A40], v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = objc_msgSend_componentsJoinedByString_(v23, v24, (uint64_t)@"\n");
      *(_DWORD *)buf = 134218242;
      double v93 = (double)v21 * 0.000000953674316;
      __int16 v94 = 2080;
      uint64_t v95 = objc_msgSend_UTF8String(v25, v26, v27);
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "large message (%.2lf MB) from:\n%s",  buf,  0x16u);
    }

    if (v21 >= self->_compressionMinSizeThreshold && self->_remoteCompressionCapabilityVersion >= 1)
    {
      uint64_t compressionTypeForUnspecified = objc_msgSend_compressionTypeHint(v13, v19, v20);
      if ((_DWORD)compressionTypeForUnspecified != 2)
      {
        permittedBlockCompressors = self->_permittedBlockCompressors;
        if (permittedBlockCompressors)
        {
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v19, compressionTypeForUnspecified);
          dispatch_queue_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          int v32 = objc_msgSend_containsObject_(permittedBlockCompressors, v31, (uint64_t)v30);

          if (v32)
          {
            int remoteCompressionCapabilityVersion = self->_remoteCompressionCapabilityVersion;
            if (remoteCompressionCapabilityVersion >= 2) {
              int remoteCompressionCapabilityVersion = 2;
            }
            objc_msgSend_compressWithCompressor_usingType_forCompatibilityWithVersion_( v12,  v19,  (uint64_t)self->_compressor,  compressionTypeForUnspecified,  remoteCompressionCapabilityVersion);
          }
        }
      }
    }

    BOOL v81 = v8;
    if ((id)kDTXAckBarrierMessage == v12)
    {
      objc_msgSend_message(DTXMessage, v19, v20);
      id v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__makeBarrier(v34, v35, v36);
      id v12 = v34;
    }

    objc_msgSend__makeImmutable(v12, v19, v20);
    uint64_t v39 = objc_msgSend_serializedLength(v12, v37, v38);
    uint64_t v41 = v39;
    if (v12 == (id)kDTXBarrierMessage) {
      uint64_t v42 = 0LL;
    }
    else {
      uint64_t v42 = v39;
    }
    if (a5)
    {
      uint64_t v43 = 0LL;
      unsigned int v44 = objc_msgSend_acquireSize_(self->_resourceTracker, v40, 0);
    }

    else
    {
      uint64_t v43 = v42;
      unsigned int v44 = objc_msgSend_acquireSize_(self->_resourceTracker, v40, v42);
    }

    if (v44)
    {
      unsigned int v47 = v44;
      v80 = v13;
      if (objc_msgSend_conversationIndex(v12, v45, v46))
      {
        if (objc_msgSend_deserialized(v12, v48, v49))
        {
          uint64_t v52 = 0LL;
          unsigned int v53 = objc_msgSend_channelCode(v80, v50, v51);
        }

        else
        {
          unsigned int v47 = objc_msgSend_identifier(v12, v50, v51);
          uint64_t v52 = objc_msgSend_conversationIndex(v12, v57, v58) << 32;
          unsigned int v53 = objc_msgSend_channelCode(v12, v59, v60);
        }
      }

      else
      {
        v56 = v13;
        uint64_t v52 = 0LL;
        unsigned int v53 = objc_msgSend_channelCode(v56, v48, v49);
      }

      uint64_t v61 = v53;
      uint64_t v62 = 0x100000000LL;
      v79 = v16;
      uint64_t v63 = v62 | v61;
      if (a5 == 1) {
        dispatch_semaphore_t v64 = dispatch_semaphore_create(0LL);
      }
      else {
        dispatch_semaphore_t v64 = 0LL;
      }
      BOOL v66 = v12 == (id)kDTXBarrierMessage || v12 == (id)kDTXHeartbeatMessage;
      v82[0] = MEMORY[0x1895F87A8];
      v82[1] = 3221225472LL;
      v82[2] = sub_188BCAD3C;
      v82[3] = &unk_18A2EDB88;
      v82[4] = self;
      uint64_t v86 = v41;
      BOOL v90 = a5 == 2;
      BOOL v91 = v66;
      id v12 = v12;
      uint64_t v67 = v52 | v47;
      id v83 = v12;
      uint64_t v88 = v67;
      uint64_t v89 = v63;
      id v13 = v80;
      id v68 = v80;
      id v84 = v68;
      uint64_t v87 = v43;
      objc_super v69 = v64;
      id v85 = v69;
      uint64_t v71 = (void (**)(void, void))MEMORY[0x1895D398C](v82);
      if (self->_tracer)
      {
        objc_msgSend_descriptionWithRoutingInformation_(v12, v70, v67, v63);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        sub_188BC9F54("  sent  ", self, v68, v72);
      }

      if (v81 && v62)
      {
        pthread_getspecific(qword_18C4FE7D0);
        id v75 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = v79;
        if (v75 == v68 && v12 != (id)kDTXBarrierMessage) {
          objc_msgSend_raise_format_( MEMORY[0x189603F70],  v73,  (uint64_t)@"DTXConnectionException",  @"API misuse: client attempted to synchronously send a message and wait for response while already executing in channel's asynchronous handler context.");
        }
        if (v75)
        {
          objc_msgSend_suspendLimits(self->_incomingResourceTracker, v73, v74);
          sub_188BCB1EC(v79, v71);
          objc_msgSend_resumeLimits(self->_incomingResourceTracker, v76, v77);
        }

        else
        {
          sub_188BCB1EC(v79, v71);
        }

        if (!v69) {
          goto LABEL_55;
        }
      }

      else
      {
        id v16 = v79;
        ((void (**)(void, void *))v71)[2](v71, v79);
        if (!v69)
        {
LABEL_55:

          BOOL v17 = 0;
          goto LABEL_56;
        }
      }

      dispatch_semaphore_wait(v69, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_55;
    }

    BOOL v17 = 1;
  }

- (BOOL)_addHandler:(id)a3 forMessage:(unsigned int)a4 channel:(id)a5
{
  id v8 = a3;
  char v9 = (DTXChannel *)a5;
  id v12 = v9;
  if (v8)
  {
    if (!v9) {
      id v12 = self->_defaultChannel;
    }
    uint64_t v27 = 0LL;
    int v28 = &v27;
    uint64_t v29 = 0x2020000000LL;
    char v30 = 1;
    uint64_t v13 = objc_msgSend_channelCode(v12, v10, v11);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x189607968], v14, a4 | (unint64_t)(v13 << 32));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    handler_queue = self->_handler_queue;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = sub_188BCB4A4;
    v20[3] = &unk_18A2EDBB0;
    v20[4] = self;
    uint64_t v24 = &v27;
    int v25 = v13;
    id v12 = v12;
    unint64_t v21 = v12;
    id v22 = v15;
    id v23 = v8;
    unsigned int v26 = a4;
    id v17 = v15;
    dispatch_sync((dispatch_queue_t)handler_queue, v20);
    BOOL v18 = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
  }

  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (void)_routeMessage:(id)a3
{
  id v4 = a3;
  id v26 = v4;
  if ((id)kDTXInterruptionMessage == v4)
  {
    objc_msgSend_cancel(self, v5, v6);
  }

  else
  {
    char v7 = objc_msgSend_conversationIndex(v4, v5, v6);
    unsigned int v10 = objc_msgSend_channelCode(v26, v8, v9);
    if ((v7 & 1) != 0)
    {
      LODWORD(v12) = v10;
      objc_msgSend_numberWithInt_(MEMORY[0x189607968], v11, v10);
    }

    else
    {
      uint64_t v12 = -v10;
      objc_msgSend_numberWithInt_(MEMORY[0x189607968], v11, v12);
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v12)
    {
      objc_msgSend_objectForKey_(self->_channelsByCode, v13, (uint64_t)v14);
      uint64_t v15 = (DTXChannel *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v15 = self->_defaultChannel;
    }

    id v17 = v15;
    if (!v15)
    {
      objc_msgSend_objectForKey_(self->_unconfiguredChannelsByCode, v16, (uint64_t)v14);
      BOOL v18 = (DTXChannel *)objc_claimAutoreleasedReturnValue();
      id v17 = v18;
      if (v18)
      {
        objc_msgSend_resume(v18, v16, v19);
        objc_msgSend_removeObjectForKey_(self->_unconfiguredChannelsByCode, v20, (uint64_t)v14);
        objc_msgSend_setObject_forKey_(self->_channelsByCode, v21, (uint64_t)v17, v14);
      }
    }

    objc_msgSend__scheduleMessage_toChannel_(self, v16, (uint64_t)v26, v17);
    if (!self->_remoteCapabilityVersions)
    {
      objc_msgSend_dictionary(MEMORY[0x189603F68], v22, v23);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyOfPublishedCapabilities_(self, v25, (uint64_t)v24);
    }
  }
}

- (void)_scheduleMessage:(id)a3 toChannel:(id)a4
{
  v97[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v9 = (DTXChannel *)a4;
  if (self->_tracer)
  {
    objc_msgSend_description(v6, v7, v8);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188BC9F54("received", self, v9, v10);
  }

  if (v9)
  {
    if (objc_msgSend_isBarrier(v6, v7, v8))
    {
      incomingResourceTracker = self->_incomingResourceTracker;
      v92[0] = MEMORY[0x1895F87A8];
      v92[1] = 3221225472LL;
      v92[2] = sub_188BCBC64;
      v92[3] = &unk_18A2ED5F0;
      v92[4] = self;
      double v93 = v9;
      objc_msgSend__scheduleMessage_tracker_withHandler_(v93, v14, (uint64_t)v6, incomingResourceTracker, v92);
    }

    else if (objc_msgSend_isDispatch(v6, v11, v12))
    {
      uint64_t v35 = (void *)MEMORY[0x1895D37B8]();
      if (self->_defaultChannel == v9 && objc_msgSend_shouldInvokeWithTarget_(v6, v34, (uint64_t)self))
      {
        uint64_t v36 = pthread_getspecific(qword_18C4FE7D0);
        pthread_setspecific(qword_18C4FE7D0, self->_defaultChannel);
        objc_msgSend_invokeWithTarget_replyChannel_validator_(v6, v37, (uint64_t)self, v9, 0);
        pthread_setspecific(qword_18C4FE7D0, v36);
        uint64_t v38 = self->_incomingResourceTracker;
        uint64_t v41 = objc_msgSend_cost(v6, v39, v40);
        objc_msgSend_releaseSize_(v38, v42, v41);
      }

      else
      {
        objc_msgSend__scheduleMessage_tracker_withHandler_(v9, v34, (uint64_t)v6, self->_incomingResourceTracker, 0);
      }

      objc_autoreleasePoolPop(v35);
    }

    else if (objc_msgSend_conversationIndex(v6, v32, v33))
    {
      char v45 = objc_msgSend_conversationIndex(v6, v43, v44);
      unsigned int v48 = objc_msgSend_channelCode(v6, v46, v47);
      if ((v45 & 1) != 0) {
        uint64_t v51 = v48;
      }
      else {
        uint64_t v51 = -v48;
      }
      uint64_t v52 = (void *)MEMORY[0x189607968];
      unsigned int v53 = objc_msgSend_identifier(v6, v49, v50);
      objc_msgSend_numberWithUnsignedLongLong_(v52, v54, v53 | (unint64_t)(v51 << 32));
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(self->_handlersByIdentifier, v56, (uint64_t)v55);
      id v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_msgSend__scheduleMessage_tracker_withHandler_(v9, v57, (uint64_t)v6, self->_incomingResourceTracker, v59);
        objc_msgSend_removeObjectForKey_(self->_handlersByIdentifier, v60, (uint64_t)v55);
      }

      else
      {
        if (objc_msgSend_expectsReply(v6, v57, v58))
        {
          objc_msgSend_exceptionWithName_reason_userInfo_( MEMORY[0x189603F70],  v67,  (uint64_t)@"DTXMissingReplyBlockException",  @"Peer was not expecting a reply for the provided message and dropped it",  0);
          objc_super v69 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v70 = (void *)MEMORY[0x189607870];
          uint64_t v94 = *MEMORY[0x1896075E0];
          objc_msgSend_description(v69, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v95 = v73;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v74, (uint64_t)&v95, &v94, 1);
          id v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v70, v76, (uint64_t)@"DTXConnection", 1, v75);
          uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (void *)objc_msgSend_newReplyWithError_(v6, v78, (uint64_t)v77);

          objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self,  v80,  (uint64_t)v79,  v9,  2,  0,  0);
        }

        BOOL v81 = self->_incomingResourceTracker;
        uint64_t v82 = objc_msgSend_cost(v6, v67, v68);
        objc_msgSend_releaseSize_(v81, v83, v82);
      }
    }

    else
    {
      if (!v6)
      {
        uint64_t v61 = (void *)objc_msgSend_mutableCopy(self->_handlersByIdentifier, v43, v44);
        handlersByIdentifier = self->_handlersByIdentifier;
        uint64_t v84 = MEMORY[0x1895F87A8];
        uint64_t v85 = 3221225472LL;
        uint64_t v86 = sub_188BCBCB0;
        uint64_t v87 = &unk_18A2EDBD8;
        uint64_t v88 = v9;
        uint64_t v63 = v61;
        uint64_t v89 = v63;
        BOOL v90 = self;
        id v91 = 0LL;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(handlersByIdentifier, v64, (uint64_t)&v84);
        uint64_t v65 = self->_handlersByIdentifier;
        self->_handlersByIdentifier = v63;
        BOOL v66 = v63;
      }

      objc_msgSend__scheduleMessage_tracker_withHandler_( v9,  v43,  (uint64_t)v6,  self->_incomingResourceTracker,  0,  v84,  v85,  v86,  v87);
    }
  }

  else
  {
    if (objc_msgSend_expectsReply(v6, v7, v8))
    {
      objc_msgSend_exceptionWithName_reason_userInfo_( MEMORY[0x189603F70],  v15,  (uint64_t)@"DTXMissingChannelException",  @"Unable to invoke message sent to invalid channel",  0);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v18 = (void *)MEMORY[0x189607870];
      uint64_t v96 = *MEMORY[0x1896075E0];
      objc_msgSend_description(v17, v19, v20);
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v21;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v22, (uint64_t)v97, &v96, 1);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v24, (uint64_t)@"DTXConnection", 1, v23);
      int v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = (void *)objc_msgSend_newReplyWithError_(v6, v26, (uint64_t)v25);

      objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self,  v28,  (uint64_t)v27,  0,  2,  0,  0);
    }

    uint64_t v29 = self->_incomingResourceTracker;
    uint64_t v30 = objc_msgSend_cost(v6, v15, v16);
    objc_msgSend_releaseSize_(v29, v31, v30);
  }
}

- (id)makeChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_188BC8900;
  int v32 = sub_188BC8910;
  id v33 = 0LL;
  uint64_t v24 = 0LL;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 0;
  handler_queue = self->_handler_queue;
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BCBF78;
  block[3] = &unk_18A2EDC00;
  id v22 = &v24;
  uint64_t v23 = &v28;
  void block[4] = self;
  id v7 = v4;
  id v21 = v7;
  dispatch_sync((dispatch_queue_t)handler_queue, block);
  objc_msgSend_messageWithSelector_typesAndArguments_( DTXMessage,  v8,  (uint64_t)sel__requestChannelWithCode_identifier_,  3,  *((unsigned int *)v25 + 6),  11,  v7,  0);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (id)v29[5];
  v17[0] = v6;
  v17[1] = 3221225472LL;
  v17[2] = sub_188BCC02C;
  v17[3] = &unk_18A2ED5F0;
  id v11 = v7;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v13, (uint64_t)v9, 0, 2, 0, v17);
  objc_msgSend_setCompressionTypeHint_((void *)v29[5], v14, self->_newChannelCompressionHint);
  id v15 = (id)v29[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

- (void)setRemoteTracer:(BOOL)a3
{
  self->_remoteTracer = a3;
  objc_msgSend_messageWithSelector_typesAndArguments_( DTXMessage,  a2,  (uint64_t)sel__setTracerState_,  3,  a3,  0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(self, v4, (uint64_t)v5, 0, 2, 0, 0);
}

- (void)_unregisterChannel:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_channelCode(v4, v5, v6);
    objc_msgSend_messageWithSelector_typesAndArguments_( DTXMessage,  v9,  (uint64_t)sel__channelCanceled_,  3,  v8,  0);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self,  v11,  (uint64_t)v10,  0,  2,  0,  0);
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self,  v12,  kDTXBarrierMessage,  0,  2,  0,  0);
    receive_queue = self->_receive_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_188BCC270;
    block[3] = &unk_18A2EDC28;
    id v15 = v7;
    uint64_t v16 = self;
    dispatch_async((dispatch_queue_t)receive_queue, block);
  }
}

- (void)_requestChannelWithCode:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1895D37B8]();
  uint64_t v8 = -a3;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___DTXChannel);
  id v11 = (void *)objc_msgSend_initWithConnection_channelIdentifier_label_(v9, v10, (uint64_t)self, v8, v6);
  objc_msgSend_suspend(v11, v12, v13);
  objc_msgSend_setCompressionTypeHint_(v11, v14, self->_newChannelCompressionHint);
  objc_msgSend_numberWithInt_(MEMORY[0x189607968], v15, v8);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_unconfiguredChannelsByCode, v17, (uint64_t)v11, v16);
  uint64_t v52 = (void *)MEMORY[0x1895D398C](self->_channelHandler);
  objc_msgSend_componentsSeparatedByString_(v6, v18, (uint64_t)@":");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v19, v20, v21) == 3
    && (objc_msgSend_objectAtIndex_(v19, v22, 0),
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)@"dtxproxy"),
        v23,
        isEqualToString))
  {
    objc_msgSend_objectAtIndex_(v19, v26, 1);
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188BCEC90(v27);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndex_(v19, v29, 2);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188BCEC90(v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    int v32 = 1;
  }

  else
  {
    id v28 = 0LL;
    id v31 = 0LL;
    int v32 = 0;
  }

  id v33 = v28;
  id v34 = v31;
  if (v32)
  {
    uint64_t v51 = v16;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v69 = 0x3032000000LL;
    uint64_t v70 = sub_188BC8900;
    uint64_t v71 = sub_188BC8910;
    id v72 = 0LL;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    uint64_t v35 = self->_protocolHandlers;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v61, v67, 16);
    if (v38)
    {
      uint64_t v39 = *(void *)v62;
      while (2)
      {
        uint64_t v40 = v7;
        for (uint64_t i = 0LL; i != v38; ++i)
        {
          if (*(void *)v62 != v39) {
            objc_enumerationMutation(v35);
          }
          uint64_t v42 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          if (objc_msgSend_matchesPublishedProtocolName_peerProtocolName_( v42,  v37,  (uint64_t)v34,  v33,  v51))
          {
            objc_storeStrong((id *)(*((void *)&buf + 1) + 40LL), v42);
            id v7 = v40;
            goto LABEL_18;
          }
        }

        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v37, (uint64_t)&v61, v67, 16);
        id v7 = v40;
        if (v38) {
          continue;
        }
        break;
      }
    }

- (void)_notifyOfPublishedCapabilities:(id)a3
{
  p_remoteCapabilityVersions = &self->_remoteCapabilityVersions;
  remoteCapabilityVersions = self->_remoteCapabilityVersions;
  id v6 = (void *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3);
  id v7 = p_remoteCapabilityVersions[1];
  id obj = v6;
  if (v7)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = sub_188BCC9B8;
    v17[3] = &unk_18A2EDC78;
    id v18 = v6;
    objc_msgSend_enumerateObjectsUsingBlock_(v7, v8, (uint64_t)v17);
    capabilityOverrideBlocks = self->_capabilityOverrideBlocks;
    self->_capabilityOverrideBlocks = 0LL;

    id v6 = obj;
  }

  objc_storeStrong((id *)p_remoteCapabilityVersions, v6);
  objc_msgSend_objectForKeyedSubscript_( *p_remoteCapabilityVersions,  v10,  (uint64_t)@"com.apple.private.DTXBlockCompression");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = v11;
  if (v11) {
    int v15 = objc_msgSend_intValue(v11, v12, v13);
  }
  else {
    int v15 = 0x80000000;
  }
  self->_int remoteCompressionCapabilityVersion = v15;
  if (!remoteCapabilityVersions) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_firstMessageSem);
  }
}

- (void)_channelCanceled:(unsigned int)a3
{
  p_channelsByCode = (void **)&self->_channelsByCode;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_objectForKey_(self->_channelsByCode, v5, (uint64_t)v14);
  if (v6)
  {
    uint64_t v8 = (void *)v6;
    objc_msgSend__scheduleMessage_toChannel_(self, v7, 0, v6);
LABEL_5:
    objc_msgSend_removeObjectForKey_(*p_channelsByCode, v9, (uint64_t)v14);

    goto LABEL_6;
  }

  p_channelsByCode = (void **)&self->_unconfiguredChannelsByCode;
  objc_msgSend_objectForKey_(self->_unconfiguredChannelsByCode, v7, (uint64_t)v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v8 = v10;
    objc_msgSend_resume(v10, v11, v12);
    objc_msgSend__scheduleMessage_toChannel_(self, v13, 0, v8);
    goto LABEL_5;
  }

- (void)_setTracerState:(unsigned int)a3
{
  self->_tracer = a3 != 0;
}

- (void)_receiveQueueSetCompressionHint:(unsigned int)a3 onChannel:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (a4)
  {
    sub_188BCCB54(a4, *(uint64_t *)&a3);
  }

  else
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    channelsByCode = self->_channelsByCode;
    uint64_t v10 = MEMORY[0x1895F87A8];
    uint64_t v11 = 3221225472LL;
    uint64_t v12 = sub_188BCECE4;
    uint64_t v13 = &unk_18A2EDE78;
    unsigned int v14 = a3;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(channelsByCode, a2, (uint64_t)&v10);
    unconfiguredChannelsByCode = self->_unconfiguredChannelsByCode;
    uint64_t v10 = v6;
    uint64_t v11 = 3221225472LL;
    uint64_t v12 = sub_188BCECE4;
    uint64_t v13 = &unk_18A2EDE78;
    unsigned int v14 = v4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(unconfiguredChannelsByCode, v9, (uint64_t)&v10);
    sub_188BCCB54(self->_defaultChannel, v4);
    self->_newChannelCompressionHint = v4;
  }

- (void)_notifyCompressionHint:(unsigned int)a3 forChannelCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3 - 11 > 0xFFFFFFF5)
  {
    if (a4)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x189607968], a2, -a4);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = objc_msgSend_objectForKey_(self->_channelsByCode, v7, (uint64_t)v6);
      if (!v8)
      {
        uint64_t v8 = objc_msgSend_objectForKey_(self->_unconfiguredChannelsByCode, v9, (uint64_t)v6);
      }

      uint64_t v11 = (const char *)v8;

      uint64_t v10 = v11;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    uint64_t v12 = (char *)v10;
    objc_msgSend__receiveQueueSetCompressionHint_onChannel_(self, v10, v4, v10);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 67109376;
    int v14 = v4;
    __int16 v15 = 1024;
    int v16 = 10;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "attempted to set the compression type hint to an unknown compression method: specified=%u, max valid=%u",  buf,  0xEu);
  }

- (void)setTracer:(BOOL)a3
{
  if (byte_18C4FE7D8) {
    a3 = 1;
  }
  self->_tracer = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)tracer
{
  return self->_tracer;
}

- (BOOL)remoteTracer
{
  return self->_remoteTracer;
}

- (int)atomicConnectionNumber
{
  return self->_connectionIndex;
}

- (void).cxx_destruct
{
}

- (void)handleProxyRequestForInterface:(id)a3 peerInterface:(id)a4 handler:(id)a5
{
  proto = (Protocol *)a3;
  uint64_t v8 = (Protocol *)a4;
  id v9 = a5;
  NSStringFromProtocol(proto);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSStringFromProtocol(v8);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__handleProxyRequestForInterface_interfaceName_peerInterface_peerInterfaceName_handler_( self,  v13,  (uint64_t)proto,  v11,  v8,  v12,  v9);
  }

  else
  {
    objc_msgSend__handleProxyRequestForInterface_interfaceName_peerInterface_peerInterfaceName_handler_( self,  v10,  (uint64_t)proto,  v11,  0,  0,  v9);
  }
}

- (void)_handleProxyRequestForInterface:(id)a3 interfaceName:(id)a4 peerInterface:(id)a5 peerInterfaceName:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v19 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }

  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v17, v18);
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v25,  v26,  (uint64_t)a2,  self,  @"DTXConnection.m",  1597,  @"Invalid parameter not satisfying: %@",  @"publishedProtocol != NULL");

    if (v14) {
      goto LABEL_3;
    }
  }

  objc_msgSend_currentHandler(MEMORY[0x1896077D8], v17, v18);
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v27,  v28,  (uint64_t)a2,  self,  @"DTXConnection.m",  1598,  @"Invalid parameter not satisfying: %@",  @"publishedProtocolName != nil");

LABEL_3:
  if ((v15 == 0LL) != (v16 == 0LL))
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v17, v18);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v29,  v30,  (uint64_t)a2,  self,  @"DTXConnection.m",  1599,  @"Invalid parameter not satisfying: %@",  @"(peerProtocol == NULL) == (peerProtocolName == nil)");

    if (v19) {
      goto LABEL_5;
    }
LABEL_9:
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v17, v18);
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v31,  v32,  (uint64_t)a2,  self,  @"DTXConnection.m",  1600,  @"Invalid parameter not satisfying: %@",  @"handler != NULL");

    goto LABEL_5;
  }

  if (!v19) {
    goto LABEL_9;
  }
LABEL_5:
  handler_queue = self->_handler_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BCD198;
  block[3] = &unk_18A2EDCA0;
  id v35 = v13;
  id v36 = v14;
  id v37 = v15;
  id v38 = v16;
  uint64_t v39 = self;
  id v40 = v19;
  id v21 = v19;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v33 = v13;
  dispatch_sync((dispatch_queue_t)handler_queue, block);
}

- (id)makeProxyChannelWithRemoteInterface:(id)a3 exportedInterface:(id)a4
{
  uint64_t v6 = (Protocol *)a3;
  id v7 = (Protocol *)a4;
  NSStringFromProtocol(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    NSStringFromProtocol(v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__makeProxyChannelWithRemoteInterface_remoteInterfaceName_exportedInterface_exportedInterfaceName_( self,  v11,  (uint64_t)v6,  v9,  v7,  v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend__makeProxyChannelWithRemoteInterface_remoteInterfaceName_exportedInterface_exportedInterfaceName_( self,  v8,  (uint64_t)v6,  v9,  0,  0);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_makeProxyChannelWithRemoteInterface:(id)a3 remoteInterfaceName:(id)a4 exportedInterface:(id)a5 exportedInterfaceName:(id)a6
{
  id v11 = a3;
  uint64_t v12 = (__CFString *)a4;
  id v13 = a5;
  id v16 = (__CFString *)a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }

  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v26,  v27,  (uint64_t)a2,  self,  @"DTXConnection.m",  1628,  @"Invalid parameter not satisfying: %@",  @"remoteProtocol != NULL");

    if (v12) {
      goto LABEL_3;
    }
  }

  objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15);
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v28,  v29,  (uint64_t)a2,  self,  @"DTXConnection.m",  1629,  @"Invalid parameter not satisfying: %@",  @"remoteProtocolName != nil");

LABEL_3:
  if ((v13 == 0LL) != (v16 == 0LL))
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v30,  v31,  (uint64_t)a2,  self,  @"DTXConnection.m",  1630,  @"Invalid parameter not satisfying: %@",  @"(exportedInterface == NULL) == (exportedInterfaceName == nil)");
  }

  uint64_t v17 = @"*";
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = @"*";
  }
  if (v12) {
    uint64_t v17 = v12;
  }
  objc_msgSend_stringWithFormat_(NSString, v14, (uint64_t)@"%@:%@:%@", @"dtxproxy", v18, v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeChannelWithIdentifier_(self, v20, (uint64_t)v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = objc_alloc(&OBJC_CLASS___DTXProxyChannel);
  id v24 = (void *)objc_msgSend_initWithChannel_remoteProtocol_localProtocol_(v22, v23, (uint64_t)v21, v11, v13);

  return v24;
}

+ (void)observeDecompressionExceptionLogging:(id)a3
{
  uint64_t v3 = MEMORY[0x1895D398C](a3, a2);
  uint64_t v4 = (void *)qword_18C7403E8;
  qword_18C7403E8 = v3;
}

- (id)_testing_remoteCapabilityVersions
{
  return self->_remoteCapabilityVersions;
}

- (void)overridePermittedBlockCompressors:(id)a3
{
}

- (void)replaceCompressorForCompression:(id)a3
{
}

- (void)replaceCompressorForDecompression:(id)a3
{
  incomingParser = self->_incomingParser;
  if (incomingParser) {
    MEMORY[0x189616718](incomingParser, sel_replaceCompressor_, a3);
  }
}

- (DTXChannel)defaultChannel
{
  return self->_defaultChannel;
}

@end