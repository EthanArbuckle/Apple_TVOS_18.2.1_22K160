@interface MobileActivationDaemon
- (BOOL)handleSessionResponse:(id)a3 withError:(id *)a4;
- (BOOL)isEntitled:(id)a3;
- (BOOL)isHostConnection;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)validateActivationDataSignature:(id)a3 activationSignature:(id)a4 withError:(id *)a5;
- (DataArk)dark;
- (MobileActivationDaemon)initWithContext:(id)a3 Queue:(id)a4;
- (NSData)sessionHelloMessage;
- (NSString)activationNonce;
- (NSString)activationSessionClientName;
- (NSString)recertNonce;
- (OS_dispatch_queue)creationQueue;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_queue)xpcQueue;
- (PSCSessionInternal_)session;
- (id)callingProcessName;
- (id)copyUCRTVersionInfoWithError:(id *)a3;
- (id)valueForEntitlement:(id)a3;
- (unint64_t)currentSessionDuration;
- (unint64_t)sessionStartTime;
- (void)copyActivationRecordWithCompletionBlock:(id)a3;
- (void)copyAttestationDictionaryWithCompletionBlock:(id)a3 options:(id)a4 completion:(id)a5;
- (void)copyAutomaticTimeEnabledWithCompletion:(id)a3;
- (void)copyDCRTWithCompletionBlock:(id)a3 withCompletion:(id)a4;
- (void)copyLegacyDeviceIdentityWithCompletionBlock:(id)a3;
- (void)copyMonotonicClockWithCompletionBlock:(id)a3;
- (void)copyPCRTTokenWithCompletionBlock:(id)a3;
- (void)copyRTCResetCountWithCompletionBlock:(id)a3;
- (void)copyUCRTVersionInfoWithCompletionBlock:(id)a3;
- (void)copyUCRTWithCompletionBlock:(id)a3;
- (void)createActivationInfoWithCompletionBlock:(id)a3;
- (void)createTunnel1ActivationInfo:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (void)createTunnel1SessionInfoWithCompletionBlock:(id)a3;
- (void)deactivateDeviceWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(id)a3;
- (void)generateSession:(BOOL)a3;
- (void)getActivationBuildWithCompletionBlock:(id)a3;
- (void)getActivationStateWithCompletionBlock:(id)a3;
- (void)getDCRTStateWithCompletionBlock:(id)a3 withCompletion:(id)a4;
- (void)handleActivationInfo:(id)a3 withCompletionBlock:(id)a4;
- (void)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 completionBlock:(id)a5;
- (void)isDeviceBrickedWithCompletionBlock:(id)a3;
- (void)isInFieldCollectedWithCompletionBlock:(id)a3;
- (void)issueClientCertificateLegacy:(id)a3 WithCompletionBlock:(id)a4;
- (void)issueClientCertificateWithReferenceKey:(id)a3 options:(id)a4 completion:(id)a5;
- (void)issueCollection:(id)a3 withCompletionBlock:(id)a4;
- (void)issueDCRT:(id)a3 withCompletionBlock:(id)a4;
- (void)issueUCRT:(id)a3 withCompletionBlock:(id)a4;
- (void)performMigrationWithCompletion:(id)a3 completion:(id)a4;
- (void)recertifyDeviceWithCompletionBlock:(id)a3;
- (void)requestDeviceReactivationWithCompletionBlock:(id)a3;
- (void)setActivationNonce:(id)a3;
- (void)setActivationSessionClientName:(id)a3;
- (void)setDark:(id)a3;
- (void)setRecertNonce:(id)a3;
- (void)ucrtUpgradeRequiredWithCompletionBlock:(id)a3;
- (void)unbrickDeviceWithCompletionBlock:(id)a3;
- (void)updateBasebandTicket:(id)a3 baaCertData:(id)a4 baaIntermediateCert:(id)a5 options:(id)a6 withCompletionBlock:(id)a7;
@end

@implementation MobileActivationDaemon

- (MobileActivationDaemon)initWithContext:(id)a3 Queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MobileActivationDaemon;
  v9 = -[MobileActivationDaemon init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    if (!v7) {
      goto LABEL_6;
    }
    if (!v8) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_dark, a3);
    objc_storeStrong((id *)&v10->_xpcQueue, a4);
    v11 =  dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mobileactivationd.xpc.create", v11);
    creationQueue = v10->_creationQueue;
    v10->_creationQueue = (OS_dispatch_queue *)v12;

    if (!v10->_creationQueue
      || (v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
          dispatch_queue_t v15 = dispatch_queue_create("com.apple.mobileactivationd.xpc.session", v14),
          sessionQueue = v10->_sessionQueue,
          v10->_sessionQueue = (OS_dispatch_queue *)v15,
          sessionQueue,
          v14,
          !v10->_sessionQueue))
    {
LABEL_6:

      v10 = 0LL;
    }
  }

  return v10;
}

- (void)dealloc
{
  session = self->_session;
  if (session) {
    ZyNF2D9((uint64_t)session);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MobileActivationDaemon;
  -[MobileActivationDaemon dealloc](&v4, "dealloc");
}

- (unint64_t)currentSessionDuration
{
  v3 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (self->_sessionStartTime) {
    return (clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_sessionStartTime) / 0x3B9ACA00;
  }
  else {
    return 0LL;
  }
}

- (void)generateSession:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  uint64_t v12 = 0LL;
  unsigned int v11 = 0;
  v10 = 0LL;
  if (self->_session
    && -[MobileActivationDaemon currentSessionDuration](self, "currentSessionDuration") <= 0x12C
    && !v3)
  {
    goto LABEL_6;
  }

  self->_sessionStartTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v6 = TcswZQtsc8hw((uint64_t)&v10, (uint64_t)&v12, (uint64_t)&v11);
  if ((_DWORD)v6)
  {
    maLog( (uint64_t)"-[MobileActivationDaemon generateSession:]",  0LL,  @"Failed to create handshake request message: %d",  v6);
LABEL_6:
    id v7 = 0LL;
    goto LABEL_7;
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSData);
  id v7 = -[NSData initWithBytes:length:](v8, "initWithBytes:length:", v12, v11);
  if (v7)
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0LL, @"Generated new DRM session.");
    session = self->_session;
    if (session) {
      ZyNF2D9((uint64_t)session);
    }
    self->_session = v10;
    v10 = 0LL;
    objc_storeStrong((id *)&self->_sessionHelloMessage, v7);
  }

  else
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0LL, @"Failed to create data.");
  }

- (PSCSessionInternal_)session
{
  BOOL v3 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  -[MobileActivationDaemon generateSession:](self, "generateSession:", 0LL);
  return self->_session;
}

- (NSData)sessionHelloMessage
{
  BOOL v3 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  -[MobileActivationDaemon generateSession:](self, "generateSession:", 0LL);
  return self->_sessionHelloMessage;
}

- (id)callingProcessName
{
  BOOL v3 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_super v4 = -[MobileActivationDaemon dark](self, "dark");
  BOOL v5 = data_ark_exists(v4, 0LL, @"HostProcessName");

  if (v5)
  {
    uint64_t v6 = -[MobileActivationDaemon dark](self, "dark");
    id v7 = (NSString *)data_ark_copy(v6, 0LL, @"HostProcessName");
  }

  else
  {
    id v7 = copy_calling_process_name();
  }

  return v7;
}

- (BOOL)isHostConnection
{
  BOOL v3 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_super v4 = -[MobileActivationDaemon dark](self, "dark");
  LOBYTE(v3) = data_ark_exists(v4, 0LL, @"HostProcessName");

  return (char)v3;
}

- (BOOL)isEntitled:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection");
  uint64_t v6 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  id v7 = 0LL;
  LOBYTE(v8) = 0;
  if (v4)
  {
    if (v5)
    {
      id v7 = -[NSXPCConnection valueForEntitlement:](v5, "valueForEntitlement:", v4);
      id v8 = isNSNumber(v7);

      if (v8) {
        LOBYTE(v8) = [v7 BOOLValue];
      }
    }
  }

  return (char)v8;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection");
  uint64_t v6 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  id v7 = 0LL;
  if (v4 && v5) {
    id v7 = -[NSXPCConnection valueForEntitlement:](v5, "valueForEntitlement:", v4);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MobileActivationProtocol);
  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  id v7 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  [v5 _setQueue:v7];

  [v5 resume];
  return 1;
}

- (id)copyUCRTVersionInfoWithError:(id *)a3
{
  id v4 = -[MobileActivationDaemon dark](self, "dark");
  id v10 = 0LL;
  id v5 = copyUCRTVersionInformation(v4, &v10);
  uint64_t v6 = (NSError *)v10;

  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    id v8 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithError:]",  284LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v6,  @"Failed to copy UCRT version info.");

    if (a3)
    {
      uint64_t v6 = v8;
      *a3 = v6;
    }

    else
    {
      uint64_t v6 = v8;
    }
  }

  return v5;
}

- (BOOL)handleSessionResponse:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v65 = 0LL;
  v66 = (id *)&v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = __Block_byref_object_copy__7;
  v69 = __Block_byref_object_dispose__7;
  id v70 = 0LL;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  v62 = __Block_byref_object_copy__7;
  v63 = __Block_byref_object_dispose__7;
  id v64 = 0LL;
  v57[0] = 0LL;
  v57[1] = v57;
  v57[2] = 0x3032000000LL;
  v57[3] = __Block_byref_object_copy__7;
  v57[4] = __Block_byref_object_dispose__7;
  id v58 = 0LL;
  v55[0] = 0LL;
  v55[1] = v55;
  v55[2] = 0x2020000000LL;
  int v56 = 0;
  uint64_t v6 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v6);

  if (!v5)
  {
    v28 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]",  318LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input.");
LABEL_15:
    id v29 = v66[5];
    v66[5] = v28;

    id v18 = 0LL;
    id v19 = 0LL;
    id v11 = 0LL;
    BOOL v27 = 0;
    v9 = 0LL;
LABEL_16:
    id v17 = 0LL;
    id v14 = 0LL;
    goto LABEL_17;
  }

  id v7 = objc_alloc(&OBJC_CLASS___MACollectionInterface);
  id v8 = -[MobileActivationDaemon dark](self, "dark");
  v9 = -[MACollectionInterface initWithContext:](v7, "initWithContext:", v8);

  if (!v9)
  {
    v28 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]",  324LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create collection interface.");
    goto LABEL_15;
  }

  id v10 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v11 = [v10 copyAnswer:@"BuildVersion"];

  id v12 = isNSString(v11);
  if (!v12)
  {
    v31 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]",  330LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve %@.",  @"BuildVersion");
    id v32 = v66[5];
    v66[5] = v31;

    id v18 = 0LL;
    id v19 = 0LL;
    BOOL v27 = 0;
    goto LABEL_16;
  }

  v13 = v66;
  id obj = 0LL;
  id v14 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &obj);
  objc_storeStrong(v13 + 5, obj);
  id v15 = isNSDictionary(v14);

  if (!v15)
  {
    v33 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]",  339LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v66[5],  @"Failed to decode session data.");
    id v34 = v66[5];
    v66[5] = v33;

    id v18 = 0LL;
    id v19 = 0LL;
    BOOL v27 = 0;
    id v17 = 0LL;
    goto LABEL_17;
  }

  if (is_internal_build())
  {
    v16 = dictionary_to_xml((uint64_t)v14);
    maLog( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]",  0LL,  @"Session message:\n%@",  v16);
  }

  id v17 = [v14 objectForKeyedSubscript:@"HandshakeResponseMessage"];
  id v18 = [v14 objectForKeyedSubscript:@"serverKP"];
  id v19 = [v14 objectForKeyedSubscript:@"SUInfo"];
  id v20 = [v14 objectForKeyedSubscript:@"FDRBlob"];
  v21 = (void *)v60[5];
  v60[5] = (uint64_t)v20;

  id v22 = isNSData(v17);
  if (!v22) {
    goto LABEL_25;
  }
  id v23 = isNSData(v18);
  if (!v23) {
    goto LABEL_24;
  }
  id v24 = isNSData(v19);
  if (!v24)
  {

LABEL_24:
    goto LABEL_25;
  }

  id v38 = v24;
  id v37 = isNSData((void *)v60[5]);

  if (!v37)
  {
LABEL_25:
    v35 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]",  353LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid session response.");
    id v36 = v66[5];
    v66[5] = v35;

    goto LABEL_26;
  }

  v25 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke;
  block[3] = &__block_descriptor_96_e8_32s40s48s56s64r72r80r88r_e5_v8__0l;
  v50 = v57;
  v51 = &v59;
  v52 = &v65;
  v9 = v9;
  id v46 = v9;
  id v19 = v19;
  id v47 = v19;
  v48 = self;
  v53 = v55;
  id v11 = v11;
  id v49 = v11;
  dispatch_sync((dispatch_queue_t)v25, block);

  if (v66[5])
  {
LABEL_26:
    BOOL v27 = 0;
    goto LABEL_17;
  }

  v26 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3254779904LL;
  v40[2] = __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke_131;
  v40[3] = &__block_descriptor_72_e8_32s40s48s56r64r_e5_v8__0l;
  v40[4] = self;
  v43 = &v65;
  v44 = v55;
  id v17 = v17;
  id v41 = v17;
  id v18 = v18;
  id v42 = v18;
  dispatch_sync((dispatch_queue_t)v26, v40);

  BOOL v27 = v66[5] == 0LL;
LABEL_17:
  if (a4 && !v27) {
    *a4 = v66[5];
  }

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v27;
}

void __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) base64EncodedStringWithOptions:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8LL);
    id obj = *(id *)(v7 + 40);
    unsigned __int8 v8 = [v5 processSUInfo:v6 withError:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    id v9 = [*(id *)(a1 + 48) dark];
    id v10 = v9;
    if ((v8 & 1) != 0)
    {
      data_ark_set(v9, 0LL, @"PCRTToken", *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), 1);

      id v11 = [*(id *)(a1 + 48) dark];
      data_ark_set(v11, 0LL, @"CollectionLastPerformed", *(void **)(a1 + 56), 1);
      id v12 = v11;
    }

    else
    {
      data_ark_remove(v9, 0LL, @"PCRTToken");

      id v16 = [*(id *)(a1 + 48) dark];
      writeSplunkLog( v16,  8LL,  *(int *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL),  (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke",  371,  0LL,  0LL,  v17,  v21);

      id v18 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke",  372LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL),  @"Failed to process SUInfo.");
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8LL);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
      id v12 = v20;
    }
  }

  else
  {
    v13 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke",  363LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to decode PCRT receipt (%@).",  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8LL);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

void __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke_131(uint64_t a1)
{
  if (![*(id *)(a1 + 32) session])
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke",  396LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid session.");
    goto LABEL_9;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = xtiKg( (uint64_t)[*(id *)(a1 + 32) session], (uint64_t)objc_msgSend( *(id *)(a1 + 40), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)objc_msgSend( *(id *)(a1 + 48), "bytes"), (int)objc_msgSend(*(id *)(a1 + 48), "length"));
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  if (v2 != -42901 && v2 != 0)
  {
    id v4 = [*(id *)(a1 + 32) dark];
    writeSplunkLog( v4,  7LL,  *(int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL),  (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke",  407,  0LL,  0LL,  v5,  v10);

    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke",  408LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to process handshake response message: %d",  *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL));
LABEL_9:
    uint64_t v7 = MobileActivationError;
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

- (BOOL)validateActivationDataSignature:(id)a3 activationSignature:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = __Block_byref_object_copy__7;
  BOOL v27 = __Block_byref_object_dispose__7;
  id v28 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  int v22 = 0;
  if (v8 && v9)
  {
    id v11 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3254779904LL;
    block[2] = __88__MobileActivationDaemon_validateActivationDataSignature_activationSignature_withError___block_invoke;
    block[3] = &__block_descriptor_72_e8_32s40s48s56r64r_e5_v8__0l;
    void block[4] = self;
    uint64_t v19 = &v23;
    id v20 = v21;
    id v17 = v8;
    id v18 = v10;
    dispatch_sync((dispatch_queue_t)v11, block);

    BOOL v12 = v24[5] == 0;
    if (!a5) {
      goto LABEL_8;
    }
  }

  else
  {
    v13 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]",  440LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input(s).");
    uint64_t v14 = (void *)v24[5];
    v24[5] = (uint64_t)v13;

    BOOL v12 = 0;
    if (!a5) {
      goto LABEL_8;
    }
  }

  if (!v12) {
    *a5 = (id) v24[5];
  }
LABEL_8:
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __88__MobileActivationDaemon_validateActivationDataSignature_activationSignature_withError___block_invoke( uint64_t a1)
{
  if ([*(id *)(a1 + 32) session])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = mbdz5ztWyQD( (uint64_t)[*(id *)(a1 + 32) session], (uint64_t)objc_msgSend( *(id *)(a1 + 40), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)objc_msgSend( *(id *)(a1 + 48), "bytes"), (int)objc_msgSend(*(id *)(a1 + 48), "length"));
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
    {
      id v2 = [*(id *)(a1 + 32) dark];
      writeSplunkLog( v2,  6LL,  *(int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL),  (uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke",  458,  0LL,  0LL,  v3,  v11);

      id v4 = [*(id *)(a1 + 48) base64EncodedStringWithOptions:0];
      uint64_t v5 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke",  459LL,  @"com.apple.MobileActivation.ErrorDomain",  -15LL,  0LL,  @"Failed to verify message signature (%@): %d",  v4,  *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL));
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }

  else
  {
    id v8 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke",  447LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid session.");
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

- (void)getActivationStateWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, NSDictionary *, void))a3;
  uint64_t v5 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    v13 = @"ActivationState";
    uint64_t v14 = @"Unavailable";
    uint64_t v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL);
    if (!v4) {
      goto LABEL_8;
    }
LABEL_7:
    v4[2](v4, v10, 0LL);
    goto LABEL_8;
  }

  uint64_t v7 = -[MobileActivationDaemon dark](self, "dark");
  id v8 = data_ark_copy(v7, 0LL, @"ActivationState");
  uint64_t v9 = (__CFString *)isNSString(v8);

  if (!v9) {
    uint64_t v9 = @"Unactivated";
  }
  uint64_t v11 = @"ActivationState";
  BOOL v12 = v9;
  uint64_t v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL);

  if (v4) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)performMigrationWithCompletion:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  uint64_t v7 = copySignpostLoggingHandle();
  BOOL v8 = os_signpost_enabled(v7);

  if (v8)
  {
    os_signpost_id_t v9 = 0xEEEEB0B5B2B2EEEELL;
    if (v5 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v10 = copySignpostLoggingHandle();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v10, v5);
    }

    uint64_t v11 = copySignpostLoggingHandle();
    BOOL v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "PerformMigrationXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3254779904LL;
    v24[2] = __68__MobileActivationDaemon_performMigrationWithCompletion_completion___block_invoke;
    v24[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v25 = v5;
    os_signpost_id_t v26 = v9;
    id v5 = objc_retainBlock(v24);
  }

  int v13 = is_erase_installed_build();
  uint64_t v14 = @"upgrade-install";
  if (v13) {
    uint64_t v14 = @"erase-install";
  }
  maLog( (uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]",  1LL,  @"Data migration requested by %@ (%@)",  v6,  v14);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v28 = @"com.apple.mobileactivationd.spi";
    id v29 = &__kCFBooleanTrue;
    id v17 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
    id v18 = createAndLogError( (uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]",  535LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v17);
    goto LABEL_17;
  }

  id v15 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v16 = preSydroDataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    uint64_t v19 = -[MobileActivationDaemon dark](self, "dark");
    id v23 = 0LL;
    char v20 = performMigration(v19, &v23);
    id v17 = (NSDictionary *)v23;

    if ((v20 & 1) != 0) {
      goto LABEL_18;
    }
    id v18 = createAndLogError( (uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]",  547LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v17,  @"Failed to perform migration.",  v22);
LABEL_17:
    uint64_t v21 = v18;

    id v17 = (NSDictionary *)v21;
    goto LABEL_18;
  }

void __68__MobileActivationDaemon_performMigrationWithCompletion_completion___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  BOOL v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformMigrationXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

- (void)copyAutomaticTimeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __65__MobileActivationDaemon_copyAutomaticTimeEnabledWithCompletion___block_invoke;
  block[3] = &__block_descriptor_40_e8_32bs_e5_v8__0l;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, block);
}

void __65__MobileActivationDaemon_copyAutomaticTimeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  id v5 = @"AutomaticTimeEnabled";
  id v2 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", isAutomaticTimeEnabled());
  id v6 = v2;
  uint64_t v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL);

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, NSDictionary *, void))(v4 + 16))(v4, v3, 0LL);
  }
}

- (void)copyRTCResetCountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)copyRTCResetSerialQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3254779904LL;
  v7[2] = __63__MobileActivationDaemon_copyRTCResetCountWithCompletionBlock___block_invoke;
  v7[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__MobileActivationDaemon_copyRTCResetCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  id v3 = data_ark_copy(v2, 0LL, @"TotalRTCResetCount");

  id v4 = (NSDictionary *)isNSNumber(v3);
  if (v4)
  {
    uint64_t v7 = @"TotalRTCResetCount";
    id v8 = v3;
    id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL);
    id v5 = 0LL;
  }

  else
  {
    id v5 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyRTCResetCountWithCompletionBlock:]_block_invoke",  581LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve RTC reset count.");
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v6 + 16))(v6, v4, v5);
  }
}

- (void)copyMonotonicClockWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __64__MobileActivationDaemon_copyMonotonicClockWithCompletionBlock___block_invoke;
  block[3] = &__block_descriptor_40_e8_32bs_e5_v8__0l;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, block);
}

void __64__MobileActivationDaemon_copyMonotonicClockWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v7 = 0LL;
  double v2 = copyMonotonicClockTimeInterval(&v7);
  id v3 = (NSError *)v7;
  if (v2 <= 0.0)
  {
    id v5 = 0LL;
    id v4 = (NSNumber *)v3;
    id v3 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyMonotonicClockWithCompletionBlock:]_block_invoke",  604LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v3,  @"Failed to retrieve monotonic clock interval.");
  }

  else
  {
    id v8 = @"MonotonicClockNow";
    id v4 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v2);
    os_signpost_id_t v9 = v4;
    id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v6 + 16))(v6, v5, v3);
  }
}

- (void)deactivateDeviceWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void, NSError *))a3;
  id v5 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon deactivateDeviceWithCompletionBlock:]",  1LL,  @"Deactivation requested by %@",  v5);

  uint64_t v6 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v7 = dataMigrationCompleted(v6);

  if ((v7 & 1) != 0)
  {
    id v8 = -[MobileActivationDaemon dark](self, "dark");
    handle_deactivate(v8, 1);

    os_signpost_id_t v9 = 0LL;
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  os_signpost_id_t v9 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon deactivateDeviceWithCompletionBlock:]",  625LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
  if (v4) {
LABEL_5:
  }
    v4[2](v4, 0LL, v9);
LABEL_6:
}

- (void)createTunnel1ActivationInfo:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x3032000000LL;
  v38[3] = __Block_byref_object_copy__7;
  v38[4] = __Block_byref_object_dispose__7;
  id v39 = 0LL;
  BOOL v12 = copySignpostLoggingHandle();
  BOOL v13 = os_signpost_enabled(v12);

  if (v13)
  {
    os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v15 = copySignpostLoggingHandle();
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v15, v8);
    }

    unsigned __int8 v16 = copySignpostLoggingHandle();
    id v17 = v16;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "CreateActivationInfoXPCV2",  " enableTelemetry=YES ",  buf,  2u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3254779904LL;
    v34[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke;
    v34[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v35 = v10;
    os_signpost_id_t v36 = v14;
    id v10 = objc_retainBlock(v34);
  }

  maLog( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]",  1LL,  @"Tunnel1 Activation info creation requested by %@",  v11);
  id v18 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  uint64_t v19 = -[NSUUID UUIDString](v18, "UUIDString");

  -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", v19);
  -[MobileActivationDaemon setActivationSessionClientName:](self, "setActivationSessionClientName:", v11);
  char v20 = -[MobileActivationDaemon dark](self, "dark");
  id v21 = copy_activation_record(v20);

  uint64_t v22 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_164;
  block[3] = &__block_descriptor_81_e8_32s40s48s56s64bs72r_e5_v8__0l;
  void block[4] = self;
  id v28 = v9;
  BOOL v33 = v21 != 0LL;
  id v29 = v19;
  id v30 = v8;
  id v31 = v10;
  id v32 = v38;
  id v23 = v10;
  id v24 = v8;
  id v25 = v19;
  id v26 = v9;
  dispatch_async((dispatch_queue_t)v22, block);

  _Block_object_dispose(v38, 8);
}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CreateActivationInfoXPCV2",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_164( uint64_t a1)
{
  uint64_t v89 = 0LL;
  v90 = &v89;
  uint64_t v91 = 0x2020000000LL;
  uint64_t v92 = 0LL;
  uint64_t v85 = 0LL;
  v86 = &v85;
  uint64_t v87 = 0x2020000000LL;
  int v88 = 0;
  uint64_t v81 = 0LL;
  v82 = &v81;
  uint64_t v83 = 0x2020000000LL;
  uint64_t v84 = 0LL;
  uint64_t v77 = 0LL;
  v78 = &v77;
  uint64_t v79 = 0x2020000000LL;
  int v80 = 0;
  v75[0] = 0LL;
  v75[1] = v75;
  v75[2] = 0x2020000000LL;
  int v76 = 0;
  id v2 = [*(id *)(a1 + 32) dark];
  unsigned __int8 v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    id v32 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  676LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
LABEL_22:
    id v31 = v32;
    id v5 = 0LL;
    id v6 = 0LL;
LABEL_28:
    id v25 = 0LL;
    unsigned __int8 v16 = 0LL;
    goto LABEL_29;
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = v4;
  if (!v4)
  {
    id v32 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  682LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate dictionary.");
    goto LABEL_22;
  }

  if (*(void *)(a1 + 40)) {
    -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:");
  }
  id v6 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"UseCommittedUIK");
  uint64_t v7 = *(void *)(a1 + 48);
  if (!v7)
  {
    BOOL v33 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  700LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL),  @"Failed to create activation nonce.");
LABEL_27:
    id v31 = v33;
    goto LABEL_28;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"ActivationRandomness");
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id obj = *(id *)(v10 + 40);
  unsigned __int8 v11 = [v8 handleSessionResponse:v9 withError:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    BOOL v33 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  707LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL),  @"Failed to establish session.");
    goto LABEL_27;
  }

  if (!-[NSNumber BOOLValue](v6, "BOOLValue"))
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v73 = *(id *)(v12 + 40);
    char v13 = libaks_system_key_operate(2LL, 1LL, (NSError **)&v73);
    objc_storeStrong((id *)(v12 + 40), v73);
    if ((v13 & 1) == 0)
    {
      BOOL v33 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  713LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL),  @"Failed to bump UIK.");
      goto LABEL_27;
    }
  }

  id v14 = [*(id *)(a1 + 32) dark];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v72 = *(id *)(v15 + 40);
  unsigned __int8 v16 = create_activation_info(v14, v5, &v72);
  objc_storeStrong((id *)(v15 + 40), v72);

  if (!v16)
  {
    id v34 = [*(id *)(a1 + 32) dark];
    writeSplunkLog( v34,  2LL,  -1LL,  (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  720,  0LL,  @"%@",  v35,  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));

    BOOL v33 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  721LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL),  @"Failed to create activation info.");
    goto LABEL_27;
  }

  id v17 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v18 = isNSData(v17);
  if (!v18)
  {
LABEL_41:

    goto LABEL_42;
  }

  id v19 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v20 = isNSData(v19);
  if (!v20)
  {
LABEL_40:

    goto LABEL_41;
  }

  id v60 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v59 = isNSData(v60);
  if (!v59)
  {
LABEL_39:

    goto LABEL_40;
  }

  id v58 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v57 = isNSData(v58);
  if (!v57)
  {

    goto LABEL_39;
  }

  id v21 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  id v22 = isNSData(v21);
  BOOL v56 = v22 == 0LL;

  if (v56)
  {
LABEL_42:
    v44 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  730LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid activation record.");
LABEL_43:
    id v31 = v44;
    id v25 = 0LL;
    goto LABEL_29;
  }

  if (!*(void *)(a1 + 40))
  {
    id v25 = 0LL;
    goto LABEL_47;
  }

  id v23 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", @"ActivationInfoXML");
  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v71 = 0LL;
  id v25 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v23,  0LL,  0LL,  &v71);
  objc_storeStrong((id *)(v24 + 40), v71);

  if (!v25)
  {
    v44 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  739LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to convert data to dictionary.");
    goto LABEL_43;
  }

  id v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ActivationLockInfo"];
  id v27 = isNSString(v26);
  if (v27)
  {
    id v28 = [v25 objectForKeyedSubscript:@"ActivationLockInfo"];
    id v29 = isNSString(v28);
    BOOL v30 = v29 == 0LL;

    if (v30)
    {
      id v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke",  744LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Missing activation lock data.");
LABEL_29:
      uint64_t v36 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v31;

      p_isa = 0LL;
      id v39 = 0LL;
LABEL_30:
      v40 = 0LL;
      goto LABEL_31;
    }
  }

  else
  {
  }

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_2( uint64_t a1)
{
  if ([*(id *)(a1 + 32) session])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = qSCskg( (uint64_t)[*(id *)(a1 + 32) session], (uint64_t)objc_msgSend( *(id *)(a1 + 40), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), *(void *)(*(void *)(a1 + 64) + 8) + 24, *(void *)(*(void *)(a1 + 72) + 8) + 24, *(void *)(*(void *)(a1 + 80) + 8) + 24, *(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
      return;
    }
    id v2 = [*(id *)(a1 + 32) dark];
    writeSplunkLog( v2,  9LL,  *(int *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL),  (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2",  777,  0LL,  0LL,  v3,  v8);

    id v4 = createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2",  778LL,  @"com.apple.MobileActivation.ErrorDomain",  -15LL,  0LL,  @"PSCSign failed: %d",  *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
  }

  else
  {
    id v4 = createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2",  764LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  @"Invalid session.");
  }

  id v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)createTunnel1SessionInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  uint64_t v6 = copySignpostLoggingHandle();
  BOOL v7 = os_signpost_enabled(v6);

  if (v7)
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v9 = copySignpostLoggingHandle();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v9, v4);
    }

    uint64_t v10 = copySignpostLoggingHandle();
    unsigned __int8 v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "CreateSessionInfoXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3254779904LL;
    v16[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke;
    v16[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v17 = v4;
    os_signpost_id_t v18 = v8;
    id v4 = objc_retainBlock(v16);
  }

  maLog( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]",  1LL,  @"Session creation requested by %@",  v5);
  uint64_t v12 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_190;
  block[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  void block[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async((dispatch_queue_t)v12, block);
}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  os_signpost_id_t v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)unsigned __int8 v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CreateSessionInfoXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_190(uint64_t a1)
{
  uint64_t v36 = 0LL;
  id v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000LL;
  id v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__7;
  id v41 = 0LL;
  id v2 = [*(id *)(a1 + 32) dark];
  unsigned __int8 v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  846LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    id v28 = 0LL;
LABEL_16:
    id v17 = 0LL;
    id v19 = 0LL;
    id v27 = 0LL;
    id v13 = 0LL;
    id v11 = 0LL;
    id v14 = 0LL;
    unsigned __int8 v16 = 0LL;
    os_signpost_id_t v8 = 0LL;
LABEL_17:
    id v22 = 0LL;
    uint64_t v24 = (NSString *)v37[5];
    v37[5] = v23;
LABEL_18:

    goto LABEL_19;
  }

  id v4 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
  id v28 = [v4 copyAnswer:@"UniqueDeviceID"];

  id v5 = isNSString(v28);
  LODWORD(v4) = v5 == 0LL;

  if ((_DWORD)v4)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  852LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve UDID.");
    goto LABEL_16;
  }

  id v6 = objc_alloc(&OBJC_CLASS___MACollectionInterface);
  id v7 = [*(id *)(a1 + 32) dark];
  os_signpost_id_t v8 = -[MACollectionInterface initWithContext:](v6, "initWithContext:", v7);

  if (!v8)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  860LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to initialize collection interface.");
    goto LABEL_16;
  }

  uint64_t v9 = v37 + 5;
  id obj = v37[5];
  id v27 = -[MACollectionInterface copyIngestData:](v8, "copyIngestData:", &obj);
  objc_storeStrong(v9, obj);
  if (!v27)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  866LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v37[5],  @"Failed to copy ingest data.");
    id v17 = 0LL;
    id v19 = 0LL;
    id v27 = 0LL;
LABEL_25:
    id v13 = 0LL;
    id v11 = 0LL;
LABEL_26:
    id v14 = 0LL;
    unsigned __int8 v16 = 0LL;
    goto LABEL_17;
  }

  os_signpost_id_t v10 = v37 + 5;
  id v34 = v37[5];
  id v11 = -[MACollectionInterface signatureForData:error:](v8, "signatureForData:error:", v27, &v34);
  objc_storeStrong(v10, v34);
  if (!v11)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  874LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v37[5],  @"Failed to compute data signature.");
    id v17 = 0LL;
    id v19 = 0LL;
    goto LABEL_25;
  }

  uint64_t v12 = v37 + 5;
  id v33 = v37[5];
  id v13 = -[MACollectionInterface signingKeyPublicKeyWithError:](v8, "signingKeyPublicKeyWithError:", &v33);
  objc_storeStrong(v12, v33);
  if (!v13)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  882LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v37[5],  @"Failed to retrieve signing key public key.");
    id v17 = 0LL;
    id v19 = 0LL;
    id v13 = 0LL;
    goto LABEL_26;
  }

  id v14 = [v11 base64EncodedStringWithOptions:0];
  id v15 = [v13 base64EncodedStringWithOptions:0];
  unsigned __int8 v16 = v15;
  if (!v14 || !v15)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  891LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to encode data as string.");
    id v17 = 0LL;
LABEL_30:
    id v19 = 0LL;
    goto LABEL_17;
  }

  v42[0] = @"X-Apple-Signature";
  v42[1] = @"X-Apple-Sig-Key";
  v43[0] = v14;
  v43[1] = v15;
  v42[2] = @"IngestBody";
  v43[2] = v27;
  id v17 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL);
  os_signpost_id_t v18 = v37;
  id v32 = 0LL;
  id v19 =  +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v17,  100LL,  0LL,  &v32);
  objc_storeStrong(v18 + 5, v32);
  if (!v19)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  904LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v37[5],  @"Failed to convert dictionary to data.");
    goto LABEL_30;
  }

  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v20)
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  910LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create dictionary.");
    goto LABEL_17;
  }

  queue = (dispatch_queue_s *)[*(id *)(a1 + 32) sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904LL;
  block[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_2;
  block[3] = &__block_descriptor_56_e8_32s40s48r_e5_v8__0l;
  void block[4] = *(void *)(a1 + 32);
  id v31 = &v36;
  id v21 = v20;
  BOOL v30 = v21;
  dispatch_sync(queue, block);

  if (v37[5])
  {
    id v22 = 0LL;
    goto LABEL_20;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v28, @"UniqueDeviceID");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v19, @"CollectionBlob");
  id v22 = v21;
  if (is_internal_build())
  {
    uint64_t v24 = dictionary_to_xml((uint64_t)v22);
    maLog( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke",  0LL,  @"Session info: \n%@",  v24);
    goto LABEL_18;
  }

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) currentSessionDuration] >= 0x97)
  {
    maLog( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke_2",  0,  @"Forcibly refreshing DRM session as more than half of the existing period (%llu secs of %u secs) has expired.",  [*(id *)(a1 + 32) currentSessionDuration],  300);
    [*(id *)(a1 + 32) generateSession:1];
  }

  id v2 = [*(id *)(a1 + 32) sessionHelloMessage];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) sessionHelloMessage];
    id v4 = [v3 copy];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:@"HandshakeRequestMessage"];
  }

  else
  {
    id v5 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke_2",  926LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid session hello message.");
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v3 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void)createActivationInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  uint64_t v6 = copySignpostLoggingHandle();
  BOOL v7 = os_signpost_enabled(v6);

  if (v7)
  {
    os_signpost_id_t v8 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v9 = copySignpostLoggingHandle();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v9, v4);
    }

    os_signpost_id_t v10 = copySignpostLoggingHandle();
    id v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "CreateActivationInfoLegacyXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3254779904LL;
    v23[2] = __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke;
    v23[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v24 = v4;
    os_signpost_id_t v25 = v8;
    id v4 = objc_retainBlock(v23);
  }

  uint64_t v12 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  id v13 = -[NSUUID UUIDString](v12, "UUIDString");

  -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", v13);
  -[MobileActivationDaemon setActivationSessionClientName:](self, "setActivationSessionClientName:", v5);
  id v14 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3254779904LL;
  v18[2] = __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke_215;
  v18[3] = &__block_descriptor_64_e8_32s40s48s56bs_e5_v8__0l;
  id v19 = v5;
  id v20 = self;
  id v21 = v13;
  id v22 = v4;
  id v15 = v4;
  unsigned __int8 v16 = v13;
  id v17 = v5;
  dispatch_async((dispatch_queue_t)v14, v18);
}

void __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  os_signpost_id_t v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CreateActivationInfoLegacyXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke_215(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) dark];
  unsigned __int8 v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    os_signpost_id_t v10 = createAndLogError( (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke",  984LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
LABEL_7:
    os_signpost_id_t v8 = v10;
    uint64_t v7 = 0LL;
    id v5 = 0LL;
    goto LABEL_8;
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4)
  {
    os_signpost_id_t v10 = createAndLogError( (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke",  989LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create activation nonce.");
    goto LABEL_7;
  }

  unsigned __int8 v16 = @"ActivationRandomness";
  uint64_t v17 = v4;
  id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL);
  id v6 = [*(id *)(a1 + 40) dark];
  id v15 = 0LL;
  uint64_t v7 = create_activation_info_legacy(v6, v5, &v15);
  os_signpost_id_t v8 = (NSError *)v15;

  if (v7)
  {
    uint64_t v9 = dictionary_to_xml((uint64_t)v7);
    maLog( (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke",  0LL,  @"Activation info: \n%@",  v9);
  }

  else
  {
    id v12 = [*(id *)(a1 + 40) dark];
    writeSplunkLog( v12,  1LL,  -1LL,  (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke",  997,  0LL,  @"%@",  v13,  (uint64_t)v8);

    id v14 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke",  998LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v8,  @"Failed to create activation info.");
    uint64_t v7 = 0LL;
    os_signpost_id_t v8 = v14;
  }

- (void)handleActivationInfo:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  uint64_t v9 = copySignpostLoggingHandle();
  BOOL v10 = os_signpost_enabled(v9);

  if (v10)
  {
    os_signpost_id_t v11 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v12 = copySignpostLoggingHandle();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v12, v7);
    }

    uint64_t v13 = copySignpostLoggingHandle();
    id v14 = v13;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "HandleActivationInfoLegacyXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3254779904LL;
    v35[2] = __67__MobileActivationDaemon_handleActivationInfo_withCompletionBlock___block_invoke;
    v35[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v36 = v7;
    os_signpost_id_t v37 = v11;
    id v7 = objc_retainBlock(v35);
  }

  maLog( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1LL,  @"Activation (legacy) requested by %@",  v8);
  if (!v6)
  {
    id v32 = createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1029LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input.");
LABEL_20:
    id v28 = v32;
    id v22 = 0LL;
    id v21 = 0LL;
    id v19 = 0LL;
    goto LABEL_21;
  }

  id v15 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    id v32 = createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1034LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_20;
  }

  uint64_t v17 = -[MobileActivationDaemon dark](self, "dark");
  id v18 = data_ark_copy(v17, 0LL, @"ActivationState");
  id v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    id v19 = @"Unactivated";
  }
  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", @"Unactivated") & 1) != 0)
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v21 = v20;
    if (v20)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"UseFactoryCertificates");
      id v22 = -[MobileActivationDaemon activationNonce](self, "activationNonce");
      if (v22)
      {
        -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", 0LL);
        id v23 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
        unsigned __int8 v24 = -[NSString isEqualToString:](v23, "isEqualToString:", v8);

        if ((v24 & 1) != 0)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v22,  @"ActivationRandomness");
          os_signpost_id_t v25 = dictionary_to_xml((uint64_t)v6);
          maLog( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  0LL,  @"Activation message:\n%@",  v25);

          id v26 = -[MobileActivationDaemon dark](self, "dark");
          id v34 = 0LL;
          char v27 = handle_activate(v26, v6, v21, (uint64_t)&v34);
          id v28 = (NSError *)v34;

          if ((v27 & 1) == 0)
          {
            id v29 = -[MobileActivationDaemon dark](self, "dark");
            writeSplunkLog( v29,  3LL,  -1LL,  (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1081,  0LL,  @"%@",  v30,  (uint64_t)v28);

            id v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1082LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  v28,  @"Failed to activate device.");
            id v28 = v31;
          }
        }

        else
        {
          id v33 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
          id v28 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1072LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid activation session (actual, expected): (%@, %@)",  v8,  v33);
        }
      }

      else
      {
        id v28 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1065LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid activation nonce.");
      }
    }

    else
    {
      id v28 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1050LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate dictionary.");
      id v22 = 0LL;
    }
  }

  else
  {
    id v28 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]",  1044LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Device is already activated (%@).",  v19);
    id v22 = 0LL;
    id v21 = 0LL;
  }

void __67__MobileActivationDaemon_handleActivationInfo_withCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "HandleActivationInfoLegacyXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

- (void)copyUCRTWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    uint64_t v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "CopyUCRTXPC",  "",  buf,  2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3254779904LL;
    v24[2] = __54__MobileActivationDaemon_copyUCRTWithCompletionBlock___block_invoke;
    v24[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v25 = v4;
    os_signpost_id_t v26 = v7;
    id v4 = objc_retainBlock(v24);
  }

  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    os_signpost_id_t v11 = -[MobileActivationDaemon dark](self, "dark");
    unsigned __int8 v12 = dataMigrationCompleted(v11);

    if ((v12 & 1) != 0)
    {
      uint64_t v13 = -[MobileActivationDaemon dark](self, "dark");
      id v23 = 0LL;
      id v14 = copyUCRT(v13, (NSError **)&v23);
      id v15 = (NSError *)v23;

      if (v14)
      {
        CFDataRef v16 = SecCertificateCopyData(v14);
        CFDataRef v17 = v16;
        if (v16)
        {
          id v28 = @"UCRTData";
          CFDataRef v29 = v16;
          id v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL);
        }

        else
        {
          id v22 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]",  1124LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy UCRT certificate data.");

          id v18 = 0LL;
          id v15 = v22;
        }

        CFRelease(v14);
      }

      else
      {
        id v21 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]",  1118LL,  @"com.apple.MobileActivation.ErrorDomain",  -4LL,  v15,  @"Failed to copy UCRT.");

        id v18 = 0LL;
        CFDataRef v17 = 0LL;
        id v15 = v21;
      }

      goto LABEL_16;
    }

    id v15 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]",  1112LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
  }

  else
  {
    id v19 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    uint64_t v30 = @"com.apple.mobileactivationd.spi";
    id v31 = &__kCFBooleanTrue;
    id v20 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
    id v15 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]",  1107LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"%@ is missing required entitlement: %@",  v19,  v20);
  }

  id v18 = 0LL;
  CFDataRef v17 = 0LL;
LABEL_16:
  if (v4) {
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v18, v15);
  }
}

void __54__MobileActivationDaemon_copyUCRTWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyUCRTXPC",  "",  v11,  2u);
  }
}

- (void)copyPCRTTokenWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    uint64_t v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "CopyPCRTXPC",  "",  buf,  2u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3254779904LL;
    v26[2] = __59__MobileActivationDaemon_copyPCRTTokenWithCompletionBlock___block_invoke;
    v26[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v27 = v4;
    os_signpost_id_t v28 = v7;
    id v4 = objc_retainBlock(v26);
  }

  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v23 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    id v32 = @"com.apple.mobileactivationd.spi";
    id v33 = &__kCFBooleanTrue;
    unsigned __int8 v24 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
    id v22 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]",  1153LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"%@ is missing required entitlement: %@",  v23,  v24);

LABEL_19:
    id v20 = 0LL;
    id v14 = 0LL;
    goto LABEL_23;
  }

  os_signpost_id_t v11 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v12 = dataMigrationCompleted(v11);

  if ((v12 & 1) == 0)
  {
    id v22 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]",  1158LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_19;
  }

  uint64_t v13 = -[MobileActivationDaemon dark](self, "dark");
  id v14 = (__CFString *)data_ark_copy(v13, 0LL, @"ActivationState");

  id v15 = isNSString(v14);
  if (!v15)
  {
    CFDataRef v16 = @"Unactivated";

    id v14 = v16;
  }

  if ((-[__CFString isEqualToString:](v14, "isEqualToString:", @"Activated") & 1) != 0)
  {
    CFDataRef v17 = -[MobileActivationDaemon dark](self, "dark");
    BOOL v18 = collectionAlreadyPerformed(v17);

    if (v18)
    {
      id v19 = -[MobileActivationDaemon dark](self, "dark");
      id v20 = data_ark_copy(v19, 0LL, @"PCRTToken");

      id v21 = (NSDictionary *)isNSString(v20);
      if (v21)
      {
        uint64_t v30 = @"PCRTToken";
        id v31 = v20;
        id v21 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL);
        id v22 = 0LL;
        if (!v4) {
          goto LABEL_25;
        }
      }

      else
      {
        id v22 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]",  1179LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy PCRT token.");
        if (!v4) {
          goto LABEL_25;
        }
      }

      goto LABEL_24;
    }

    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]",  1173LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Collection has not been performed for this build.");
  }

  else
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]",  1168LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated (%@).",  v14);
  }

  id v22 = MobileActivationError;
  id v20 = 0LL;
LABEL_23:
  id v21 = 0LL;
  if (v4) {
LABEL_24:
  }
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v21, v22);
LABEL_25:
}

void __59__MobileActivationDaemon_copyPCRTTokenWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyPCRTXPC",  "",  v11,  2u);
  }
}

- (void)isDeviceBrickedWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, NSDictionary *, NSError *))a3;
  id v5 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    os_signpost_id_t v11 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon isDeviceBrickedWithCompletionBlock:]",  1200LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    id v9 = 0LL;
    unsigned __int8 v12 = 0LL;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  uint64_t v7 = -[MobileActivationDaemon dark](self, "dark");
  id v8 = data_ark_copy(v7, 0LL, @"BrickState");
  id v9 = isNSNumber(v8);

  if (v9) {
    uint64_t v10 = (uint64_t)[v9 BOOLValue];
  }
  else {
    uint64_t v10 = 1LL;
  }
  id v14 = @"BrickState";
  uint64_t v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10);
  id v15 = v13;
  unsigned __int8 v12 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL);

  os_signpost_id_t v11 = 0LL;
  if (v4) {
LABEL_8:
  }
    v4[2](v4, v12, v11);
LABEL_9:
}

- (void)getActivationBuildWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, NSDictionary *, NSError *))a3;
  id v5 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    os_signpost_id_t v11 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon getActivationBuildWithCompletionBlock:]",  1226LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    uint64_t v10 = 0LL;
    id v9 = 0LL;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  uint64_t v7 = -[MobileActivationDaemon dark](self, "dark");
  id v8 = data_ark_copy(v7, 0LL, @"LastActivated");
  id v9 = isNSString(v8);

  if (v9)
  {
    unsigned __int8 v12 = @"LastActivated";
    id v13 = v9;
    uint64_t v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  os_signpost_id_t v11 = 0LL;
  if (v4) {
LABEL_8:
  }
    v4[2](v4, v10, v11);
LABEL_9:
}

- (void)requestDeviceReactivationWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void, NSError *))a3;
  id v5 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    id v15 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon requestDeviceReactivationWithCompletionBlock:]",  1247LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    if (!v4) {
      goto LABEL_15;
    }
LABEL_14:
    v4[2](v4, 0LL, v15);
    goto LABEL_15;
  }

  uint64_t v7 = copySignpostLoggingHandle();
  BOOL v8 = os_signpost_enabled(v7);

  if (v8)
  {
    os_signpost_id_t v9 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (void (**)(id, void, NSError *))0xEEEEB0B5B2B2EEEELL)
    {
      uint64_t v10 = copySignpostLoggingHandle();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v10, v4);
    }

    os_signpost_id_t v11 = copySignpostLoggingHandle();
    unsigned __int8 v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "RequestReactivationXPC",  "",  buf,  2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3254779904LL;
    v16[2] = __71__MobileActivationDaemon_requestDeviceReactivationWithCompletionBlock___block_invoke;
    v16[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v17 = v4;
    os_signpost_id_t v18 = v9;
    id v4 = objc_retainBlock(v16);
  }

  if (!use_hactivation())
  {
    id v13 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    maLog( (uint64_t)"-[MobileActivationDaemon requestDeviceReactivationWithCompletionBlock:]",  1LL,  @"Reactivation requested by %@",  v13);

    id v14 = -[MobileActivationDaemon dark](self, "dark");
    handle_deactivate(v14, 0);
  }

  id v15 = 0LL;
  if (v4) {
    goto LABEL_14;
  }
LABEL_15:
}

void __71__MobileActivationDaemon_requestDeviceReactivationWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  BOOL v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "RequestReactivationXPC",  "",  v11,  2u);
  }
}

- (void)copyActivationRecordWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, NSMutableDictionary *, NSError *))a3;
  id v5 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    id v17 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]",  1279LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    id v11 = 0LL;
    unsigned __int8 v12 = 0LL;
    os_signpost_id_t v9 = 0LL;
    if (!v4) {
      goto LABEL_14;
    }
LABEL_13:
    v4[2](v4, v12, v17);
    goto LABEL_14;
  }

  uint64_t v7 = -[MobileActivationDaemon dark](self, "dark");
  id v8 = data_ark_copy(v7, 0LL, @"ActivationState");
  os_signpost_id_t v9 = (__CFString *)isNSString(v8);

  if (!v9) {
    os_signpost_id_t v9 = @"Unactivated";
  }
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", @"Activated") & 1) == 0)
  {
    id v17 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]",  1289LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated: %@",  v9);
    id v11 = 0LL;
    goto LABEL_17;
  }

  os_signpost_id_t v10 = -[MobileActivationDaemon dark](self, "dark");
  id v11 = copy_activation_record(v10);

  if (!v11)
  {
    id v17 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]",  1295LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy activation record.");
LABEL_17:
    unsigned __int8 v12 = 0LL;
    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  unsigned __int8 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = [v11 objectForKeyedSubscript:@"DeviceConfigurationFlags"];

  if (v13)
  {
    id v14 = [v11 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v14,  @"DeviceConfigurationFlags");
  }

  id v15 = [v11 objectForKeyedSubscript:@"SoftwareUpdate"];

  if (v15)
  {
    id v16 = [v11 objectForKeyedSubscript:@"SoftwareUpdate"];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v16,  @"SoftwareUpdate");
  }

  id v17 = 0LL;
  if (v4) {
    goto LABEL_13;
  }
LABEL_14:
}

- (void)unbrickDeviceWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    os_signpost_id_t v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "UnbrickDeviceXPC",  "",  buf,  2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3254779904LL;
    v22[2] = __59__MobileActivationDaemon_unbrickDeviceWithCompletionBlock___block_invoke;
    v22[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v23 = v4;
    os_signpost_id_t v24 = v7;
    id v4 = objc_retainBlock(v22);
  }

  id v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]",  1LL,  @"Unbrick requested by %@",  v11);

  unsigned __int8 v12 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v13 = dataMigrationCompleted(v12);

  if ((v13 & 1) != 0)
  {
    id v14 = -[MobileActivationDaemon dark](self, "dark");
    id v15 = data_ark_copy(v14, 0LL, @"ActivationState");
    id v16 = (__CFString *)isNSString(v15);

    if (!v16) {
      id v16 = @"Unactivated";
    }
    if (!-[__CFString isEqualToString:](v16, "isEqualToString:", @"Unactivated"))
    {
      id v19 = 0LL;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }

    id v17 = -[MobileActivationDaemon dark](self, "dark");
    id v21 = 0LL;
    char v18 = handle_unbrick(v17, &v21);
    id v19 = (NSError *)v21;

    if ((v18 & 1) == 0)
    {
      id v20 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]",  1341LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v19,  @"Unbrick failed.");

      id v19 = v20;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  else
  {
    id v19 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]",  1330LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    id v16 = 0LL;
  }

  if (v4) {
LABEL_17:
  }
    (*((void (**)(id, void, NSError *))v4 + 2))(v4, 0LL, v19);
LABEL_18:
}

void __59__MobileActivationDaemon_unbrickDeviceWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "UnbrickDeviceXPC",  "",  v11,  2u);
  }
}

- (void)recertifyDeviceWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = __Block_byref_object_copy__7;
  id v39 = __Block_byref_object_dispose__7;
  id v40 = 0LL;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    os_signpost_id_t v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "RecerityDeviceXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3254779904LL;
    v31[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke;
    v31[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v32 = v4;
    os_signpost_id_t v33 = v7;
    id v4 = objc_retainBlock(v31);
  }

  id v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]",  1LL,  @"Recertification (SB) requested by %@",  v11);

  unsigned __int8 v12 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v13 = dataMigrationCompleted(v12);

  if ((v13 & 1) != 0)
  {
    id v14 = -[MobileActivationDaemon dark](self, "dark");
    id v15 = data_ark_copy(v14, 0LL, @"ActivationState");
    id v16 = (__CFString *)isNSString(v15);

    if (!v16) {
      id v16 = @"Unactivated";
    }
    if ((-[__CFString isEqualToString:](v16, "isEqualToString:", @"Activated") & 1) != 0)
    {
      id v17 = objc_alloc(&OBJC_CLASS___MobileRecertifyEngine);
      char v18 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
      id v19 = -[MobileActivationDaemon dark](self, "dark");
      id v20 = -[MobileRecertifyEngine initWithQueue:dark:](v17, "initWithQueue:dark:", v18, v19);

      if (v20)
      {
        id v21 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
        block[0] = _NSConcreteStackBlock;
        block[1] = 3254779904LL;
        block[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_257;
        block[3] = &__block_descriptor_64_e8_32s40s48bs56r_e5_v8__0l;
        id v22 = v20;
        id v27 = v22;
        os_signpost_id_t v28 = self;
        uint64_t v30 = &v35;
        id v29 = v4;
        dispatch_async((dispatch_queue_t)v21, block);

        goto LABEL_22;
      }

      os_signpost_id_t v24 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]",  1385LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Failed to allocate recert engine.");
    }

    else
    {
      os_signpost_id_t v24 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]",  1379LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated: %@",  v16);
    }

    id v23 = v24;
  }

  else
  {
    id v23 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]",  1369LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    id v16 = 0LL;
  }

  id v25 = (void *)v36[5];
  v36[5] = (uint64_t)v23;

  if (v4) {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0LL, v36[5]);
  }
  id v22 = 0LL;
LABEL_22:

  _Block_object_dispose(&v35, 8);
}

void __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  os_signpost_id_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "RecerityDeviceXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_257(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3254779904LL;
  v4[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_2;
  v4[3] = &__block_descriptor_56_e8_32s40bs48r_e17_v16__0__NSError_8l;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  __int128 v3 = *(_OWORD *)(a1 + 48);
  id v2 = (id)v3;
  *(_OWORD *)id v5 = v3;
  [v1 recertifyDevice:v4];
}

uint64_t __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_2(void *a1, id a2)
{
  if (a2)
  {
    __int128 v3 = (void *)a1[4];
    id v4 = a2;
    id v5 = [v3 dark];
    writeSplunkLog( v5,  12LL,  -1LL,  (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]_block_invoke_2",  1395,  0LL,  @"%@",  v6,  (uint64_t)v4);

    uint64_t v7 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]_block_invoke_2",  1396LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v4,  @"Recertification failed.");
    uint64_t v8 = *(void *)(a1[6] + 8LL);
    os_signpost_id_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  return (*(uint64_t (**)(void))(a1[5] + 16LL))();
}

- (void)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  unsigned __int8 v12 = copySignpostLoggingHandle();
  BOOL v13 = os_signpost_enabled(v12);

  if (v13)
  {
    os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v15 = copySignpostLoggingHandle();
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v15, v8);
    }

    id v16 = copySignpostLoggingHandle();
    id v17 = v16;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "HandleActivationInfoXPCV2",  " enableTelemetry=YES ",  buf,  2u);
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3254779904LL;
    v53[2] = __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke;
    v53[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v54 = v10;
    os_signpost_id_t v55 = v14;
    id v10 = objc_retainBlock(v53);
  }

  maLog( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1LL,  @"Activation (session) requested by %@",  v11);
  id v49 = v9;
  if (!v8)
  {
    uint64_t v38 = createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1430LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input.");
LABEL_23:
    id v36 = v38;
    id v32 = 0LL;
    os_signpost_id_t v28 = 0LL;
    id v22 = 0LL;
LABEL_28:
    id v34 = 0LL;
    id v26 = 0LL;
    goto LABEL_29;
  }

  char v18 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v19 = dataMigrationCompleted(v18);

  if ((v19 & 1) == 0)
  {
    uint64_t v38 = createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1435LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_23;
  }

  id v20 = -[MobileActivationDaemon dark](self, "dark");
  id v21 = data_ark_copy(v20, 0LL, @"ActivationState");
  id v22 = (__CFString *)isNSString(v21);

  if (!v22) {
    id v22 = @"Unactivated";
  }
  if ((-[__CFString isEqualToString:](v22, "isEqualToString:", @"Unactivated") & 1) == 0)
  {
    id v36 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1445LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Device is already activated (%@).",  v22);
LABEL_27:
    id v32 = 0LL;
    os_signpost_id_t v28 = 0LL;
    goto LABEL_28;
  }

  if (!v9)
  {
    id v25 = 0LL;
    goto LABEL_26;
  }

  id v52 = 0LL;
  unsigned __int8 v23 = -[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]( self,  "validateActivationDataSignature:activationSignature:withError:",  v8,  v9,  &v52);
  id v24 = v52;
  id v25 = v24;
  if ((v23 & 1) == 0)
  {
LABEL_26:
    id v36 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1450LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v25,  @"Invalid activation signature.");

    goto LABEL_27;
  }

  id v51 = v24;
  id v26 = getSessionActivationRecordFromData(v8, &v51);
  id v27 = v51;

  if (!v26)
  {
    id v36 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1456LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  v27,  @"Failed to extract activation record.");

    id v32 = 0LL;
    os_signpost_id_t v28 = 0LL;
LABEL_36:
    id v34 = 0LL;
    goto LABEL_29;
  }

  os_signpost_id_t v28 = -[MobileActivationDaemon activationNonce](self, "activationNonce");
  if (!v28)
  {
    id v36 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1462LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid activation nonce.");
    id v39 = (NSString *)v27;
LABEL_35:

    id v32 = 0LL;
    goto LABEL_36;
  }

  id v47 = v27;
  -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", 0LL);
  id v29 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
  unsigned __int8 v30 = -[NSString isEqualToString:](v29, "isEqualToString:", v11);

  if ((v30 & 1) == 0)
  {
    id v40 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
    id v36 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1469LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid activation session (actual, expected): (%@, %@)",  v11,  v40);

    id v39 = v40;
    goto LABEL_35;
  }

  id v59 = @"ActivationRandomness";
  id v60 = v28;
  id v31 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL);
  id v32 = -[NSDictionary mutableCopy](v31, "mutableCopy");

  id v46 = -[MobileActivationDaemon dark](self, "dark");
  id v33 = copy_activation_record(v46);
  id v34 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v33 != 0LL);

  [v32 setObject:v34 forKeyedSubscript:@"UseCommittedUIK"];
  uint64_t v35 = dictionary_to_xml((uint64_t)v26);
  maLog( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  0LL,  @"Activation message:\n%@",  v35);

  v45 = -[MobileActivationDaemon dark](self, "dark");
  id v57 = @"ActivationRecord";
  id v58 = v26;
  v44 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL);
  id v50 = v47;
  LOBYTE(v46) = handle_activate(v45, v44, v32, (uint64_t)&v50);
  id v36 = (NSError *)v50;

  if ((v46 & 1) != 0)
  {
    if (device_supports_dcrt_oob())
    {
      id v48 = -[MobileActivationDaemon dark](self, "dark");
      scheduleXPCActivity( v48,  (const char *)[@"com.apple.mobileactivationd.DCRT.OOB" UTF8String],  5u,  1,  0x4000u,  0x1000u,  &__block_literal_global_9);

      uint64_t v37 = -[MobileActivationDaemon dark](self, "dark");
      scheduleXPCActivity( v37,  (const char *)[@"com.apple.mobileactivationd.SDCRT.OOB" UTF8String],  5u,  1,  0x4000u,  0x1000u,  &__block_literal_global_269);
    }
  }

  else
  {
    id v41 = -[MobileActivationDaemon dark](self, "dark");
    writeSplunkLog( v41,  4LL,  -1LL,  (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1487,  0LL,  @"%@",  v42,  (uint64_t)v36);

    uint64_t v43 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]",  1488LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v36,  @"Failed to activate device.");
    id v36 = v43;
  }

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "HandleActivationInfoXPCV2",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke_267( id a1,  DataArk *a2)
{
}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke_2( id a1,  DataArk *a2)
{
}

- (void)issueClientCertificateLegacy:(id)a3 WithCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3032000000LL;
  v40[3] = __Block_byref_object_copy__7;
  v40[4] = __Block_byref_object_dispose__7;
  id v41 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = __Block_byref_object_copy__7;
  uint64_t v38 = __Block_byref_object_dispose__7;
  id v39 = 0LL;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v6 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v6);
    }

    unsigned __int8 v12 = copySignpostLoggingHandle();
    BOOL v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "IssueClientCertificateLegacyXPC",  "",  buf,  2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3254779904LL;
    v30[2] = __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke;
    v30[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v31 = v7;
    os_signpost_id_t v32 = v10;
    id v7 = objc_retainBlock(v30);
  }

  id v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]",  1LL,  @"Client certification (legacy) requested by %@",  v14);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    uint64_t v42 = @"com.apple.mobileactivationd.spi";
    uint64_t v43 = &__kCFBooleanTrue;
    id v21 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL);
    id v22 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]",  1530LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v21);
    unsigned __int8 v23 = (void *)v35[5];
    v35[5] = (uint64_t)v22;

    unsigned __int8 v19 = 0LL;
    goto LABEL_20;
  }

  if (v6)
  {
    id v15 = -[MobileActivationDaemon dark](self, "dark");
    unsigned __int8 v16 = dataMigrationCompleted(v15);

    if ((v16 & 1) != 0)
    {
      id v17 = -[MobileActivationDaemon dark](self, "dark");
      id v18 = data_ark_copy(v17, 0LL, @"ActivationState");
      unsigned __int8 v19 = (__CFString *)isNSString(v18);

      if (!v19) {
        unsigned __int8 v19 = @"Unactivated";
      }
      if ((-[__CFString isEqualToString:](v19, "isEqualToString:", @"Activated") & 1) != 0)
      {
        id v20 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
        block[0] = _NSConcreteStackBlock;
        block[1] = 3254779904LL;
        block[2] = __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke_272;
        block[3] = &__block_descriptor_64_e8_32s40bs48r56r_e5_v8__0l;
        os_signpost_id_t v28 = &v34;
        id v26 = v6;
        id v29 = v40;
        id v27 = v7;
        dispatch_async((dispatch_queue_t)v20, block);

        goto LABEL_22;
      }

      id v24 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]",  1550LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated: %@",  v19);
      goto LABEL_19;
    }

    id v24 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]",  1540LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
  }

  else
  {
    id v24 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]",  1535LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input.");
  }

  unsigned __int8 v19 = 0LL;
LABEL_19:
  id v21 = (NSDictionary *)v35[5];
  v35[5] = (uint64_t)v24;
LABEL_20:

  if (v7) {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0LL, v35[5]);
  }
LABEL_22:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);
}

void __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "IssueClientCertificateLegacyXPC",  "",  v11,  2u);
  }
}

void __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke_272( void *a1)
{
  CFErrorRef error = 0LL;
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (v2)
  {
    SecAccessControlRef v3 = v2;
    v24[0] = kSecAttrIsPermanent;
    v24[1] = kSecAttrTokenID;
    v25[0] = &__kCFBooleanFalse;
    v25[1] = kSecAttrTokenIDAppleKeyStore;
    uint64_t v4 = a1[4];
    v24[2] = kSecAttrTokenOID;
    v24[3] = kSecAttrAccessControl;
    v25[2] = v4;
    v25[3] = v2;
    id v5 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL);
    SecKeyRef v6 = SecKeyCreateWithData((CFDataRef)+[NSData data](&OBJC_CLASS___NSData, "data"), (CFDictionaryRef)v5, &error);
    if (v6)
    {
      SecKeyRef v7 = v6;
      uint64_t v8 = *(void *)(a1[6] + 8LL);
      id obj = *(id *)(v8 + 40);
      id v9 = security_create_system_key_attestation((uint64_t)v6, 2LL, 0LL, &obj);
      objc_storeStrong((id *)(v8 + 40), obj);
      if (v9)
      {
        id v22 = @"RKCertification";
        id v23 = v9;
        os_signpost_id_t v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL);
        uint64_t v11 = a1[7];
      }

      else
      {
        os_signpost_id_t v10 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke",  1583LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(a1[6] + 8LL) + 40LL),  @"Failed to create reference key attestation.");
        uint64_t v11 = a1[6];
      }

      uint64_t v17 = *(void *)(v11 + 8);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v10;

      CFRelease(v7);
    }

    else
    {
      id v14 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke",  1577LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  error,  @"Failed to convert legacy RK.");
      uint64_t v15 = *(void *)(a1[6] + 8LL);
      unsigned __int8 v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      id v9 = 0LL;
    }

    CFRelease(v3);
  }

  else
  {
    unsigned __int8 v12 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke",  1566LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to create access control.");
    id v9 = 0LL;
    uint64_t v13 = *(void *)(a1[6] + 8LL);
    id v5 = *(NSDictionary **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }

  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0LL;
  uint64_t v19 = a1[5];
  if (v19) {
    (*(void (**)(uint64_t, void, void))(v19 + 16))( v19,  *(void *)(*(void *)(a1[7] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  }
}

- (void)issueClientCertificateWithReferenceKey:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = copySignpostLoggingHandle();
  BOOL v12 = os_signpost_enabled(v11);

  if (v12)
  {
    os_signpost_id_t v13 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v14 = copySignpostLoggingHandle();
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v14, v8);
    }

    uint64_t v15 = copySignpostLoggingHandle();
    unsigned __int8 v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "IssueClientCertificateXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3254779904LL;
    v34[2] = __84__MobileActivationDaemon_issueClientCertificateWithReferenceKey_options_completion___block_invoke;
    v34[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v35 = v10;
    os_signpost_id_t v36 = v13;
    id v10 = objc_retainBlock(v34);
  }

  id v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]",  1LL,  @"Client certification requested by %@",  v17);
  id v33 = 0LL;
  char v18 = isSupportedDeviceIdentityClient(1, (NSError **)&v33);
  uint64_t v19 = (NSDictionary *)v33;
  if ((v18 & 1) == 0)
  {
    os_signpost_id_t v28 = createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]",  1625LL,  @"com.apple.MobileActivation.ErrorDomain",  -25LL,  v19,  @"Client is not supported.");
LABEL_23:
    id v29 = v28;
    goto LABEL_24;
  }

  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v40 = @"com.apple.mobileactivationd.spi";
    id v41 = &__kCFBooleanTrue;
    id v26 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL);
    id v27 = createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]",  1630LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v26);
    goto LABEL_21;
  }

  id v20 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v21 = dataMigrationCompleted(v20);

  if ((v21 & 1) == 0)
  {
    os_signpost_id_t v28 = createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]",  1635LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_23;
  }

  if (!v9) {
    goto LABEL_29;
  }
  id v22 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  id v23 = isNSArray(v22);

  if (!v23) {
    goto LABEL_29;
  }
  id v24 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  id v25 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  if ([v25 containsObject:@"1.2.840.113635.100.8.1"])
  {

LABEL_16:
    goto LABEL_17;
  }

  id v30 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  unsigned __int8 v31 = [v30 containsObject:@"1.2.840.113635.100.8.3"];

  if ((v31 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_17:
  if (-[MobileActivationDaemon isEntitled:]( self,  "isEntitled:",  @"com.apple.mobileactivationd.device-identifiers"))
  {
LABEL_29:
    os_signpost_id_t v32 = -[MobileActivationDaemon dark](self, "dark");
    issueClientCertificateWithReferenceKey(v32, v17, v8, 0, v9, v10);

    goto LABEL_27;
  }

  uint64_t v38 = @"com.apple.mobileactivationd.device-identifiers";
  id v39 = &__kCFBooleanTrue;
  id v26 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL);
  id v27 = createAndLogError( (uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]",  1645LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v26);
LABEL_21:
  id v29 = v27;

  uint64_t v19 = v26;
LABEL_24:

  if (v10) {
    (*((void (**)(id, void, NSError *))v10 + 2))(v10, 0LL, v29);
  }
  uint64_t v19 = (NSDictionary *)v29;
LABEL_27:
}

void __84__MobileActivationDaemon_issueClientCertificateWithReferenceKey_options_completion___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "IssueClientCertificateXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

- (void)copyAttestationDictionaryWithCompletionBlock:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = __Block_byref_object_copy__7;
  v69 = __Block_byref_object_dispose__7;
  id v70 = 0LL;
  uint64_t v11 = copySignpostLoggingHandle();
  BOOL v12 = os_signpost_enabled(v11);

  if (v12)
  {
    os_signpost_id_t v13 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v14 = copySignpostLoggingHandle();
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v14, v8);
    }

    uint64_t v15 = copySignpostLoggingHandle();
    unsigned __int8 v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "CopyAttestationDictionaryXPC",  "",  buf,  2u);
    }

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3254779904LL;
    v61[2] = __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke;
    v61[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v62 = v10;
    os_signpost_id_t v63 = v13;
    id v10 = objc_retainBlock(v61);
  }

  id v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]",  1LL,  @"Client attestation requested by %@",  v17);
  if (!v8 || !v17)
  {
    id v27 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]",  1685LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid input(s).");
LABEL_21:
    id v28 = 0LL;
    id v29 = 0LL;
    id v30 = 0LL;
LABEL_22:
    id v24 = (NSDictionary *)v66[5];
    v66[5] = (uint64_t)v27;
    goto LABEL_25;
  }

  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v73 = @"com.apple.mobileactivationd.spi";
    v74 = &__kCFBooleanTrue;
    id v24 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL);
    unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]",  1690LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v24);
    os_signpost_id_t v32 = (void *)v66[5];
    v66[5] = (uint64_t)v31;

    goto LABEL_24;
  }

  char v18 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v19 = dataMigrationCompleted(v18);

  if ((v19 & 1) == 0)
  {
    id v27 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]",  1695LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_21;
  }

  if (!v9) {
    goto LABEL_32;
  }
  id v20 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
  id v21 = isNSArray(v20);

  if (v21)
  {
    id v22 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
    if (([v22 containsObject:@"1.2.840.113635.100.10.1"] & 1) == 0)
    {
      id v23 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
      if (![v23 containsObject:@"1.2.840.113635.100.8.1"])
      {
        id v33 = [v9 objectForKeyedSubscript:@"OIDSToInclude"];
        unsigned __int8 v34 = [v33 containsObject:@"1.2.840.113635.100.8.3"];

        if ((v34 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_18;
      }
    }

LABEL_18:
    if (!-[MobileActivationDaemon isEntitled:]( self,  "isEntitled:",  @"com.apple.mobileactivationd.device-identifiers"))
    {
      id v71 = @"com.apple.mobileactivationd.device-identifiers";
      id v72 = &__kCFBooleanTrue;
      id v24 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL);
      id v25 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]",  1705LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v24);
      id v26 = (void *)v66[5];
      v66[5] = (uint64_t)v25;

LABEL_24:
      id v28 = 0LL;
      id v29 = 0LL;
      id v30 = 0LL;
LABEL_25:

      if (v10) {
        (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0LL, v66[5]);
      }
      goto LABEL_27;
    }
  }

void __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyAttestationDictionaryXPC",  "",  v11,  2u);
  }
}

void __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke_293( void *a1)
{
  CFErrorRef error = 0LL;
  SecAccessControlRef v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  SecAccessControlRef v3 = v2;
  if (!v2)
  {
    id v14 = createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke",  1785LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate dictionary.");
LABEL_8:
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)(a1[8] + 8LL);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    os_signpost_id_t v13 = 0LL;
    BOOL v12 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_13;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", a1[4], @"clientName");
  SecAccessControlRef v4 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (!v4)
  {
    id v14 = createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke",  1799LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to create access control.");
    goto LABEL_8;
  }

  SecAccessControlRef v5 = v4;
  v29[0] = kSecAttrIsPermanent;
  v29[1] = kSecAttrTokenID;
  v30[0] = &__kCFBooleanFalse;
  v30[1] = kSecAttrTokenIDAppleKeyStore;
  uint64_t v6 = a1[5];
  v29[2] = kSecAttrTokenOID;
  v29[3] = kSecAttrAccessControl;
  v30[2] = v6;
  v30[3] = v4;
  uint64_t v7 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  4LL);
  id v8 = SecKeyCreateWithData((CFDataRef)+[NSData data](&OBJC_CLASS___NSData, "data"), (CFDictionaryRef)v7, &error);
  if (v8)
  {
    id v9 = v8;
    os_signpost_id_t v10 = (void *)a1[6];
    uint64_t v11 = *(void *)(a1[8] + 8LL);
    id obj = *(id *)(v11 + 40);
    BOOL v12 = create_baa_info(v8, v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    if (v12)
    {
      id v27 = @"RKCertification";
      id v28 = v12;
      os_signpost_id_t v13 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL);
    }

    else
    {
      id v21 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke",  1820LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(id *)(*(void *)(a1[8] + 8LL) + 40LL),  @"Failed to create BAA info.");
      uint64_t v22 = *(void *)(a1[8] + 8LL);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      os_signpost_id_t v13 = 0LL;
    }

    CFRelease(v9);
  }

  else
  {
    char v18 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke",  1814LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  error,  @"Failed to convert RK data blob.");
    uint64_t v19 = *(void *)(a1[8] + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    os_signpost_id_t v13 = 0LL;
    BOOL v12 = 0LL;
  }

  CFRelease(v5);
LABEL_13:
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0LL;
  uint64_t v24 = a1[7];
  if (v24) {
    (*(void (**)(uint64_t, NSDictionary *, void))(v24 + 16))( v24,  v13,  *(void *)(*(void *)(a1[8] + 8LL) + 40LL));
  }
}

- (void)isInFieldCollectedWithCompletionBlock:(id)a3
{
  id v4 = a3;
  SecAccessControlRef v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    id v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "CollectionPerformedXPC",  "",  buf,  2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3254779904LL;
    v20[2] = __64__MobileActivationDaemon_isInFieldCollectedWithCompletionBlock___block_invoke;
    v20[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v21 = v4;
    os_signpost_id_t v22 = v7;
    id v4 = objc_retainBlock(v20);
  }

  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    uint64_t v11 = -[MobileActivationDaemon dark](self, "dark");
    unsigned __int8 v12 = dataMigrationCompleted(v11);

    if ((v12 & 1) != 0)
    {
      os_signpost_id_t v13 = -[MobileActivationDaemon dark](self, "dark");
      BOOL v14 = collectionAlreadyPerformed(v13);

      if (v14)
      {
        uint64_t v24 = @"CollectionLastPerformed";
        id v25 = &__kCFBooleanTrue;
        uint64_t v15 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL);
        uint64_t v16 = 0LL;
        if (!v4) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }

      MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]",  1869LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Collection has not been performed for this build.");
    }

    else
    {
      MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]",  1864LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    }

    uint64_t v16 = MobileActivationError;
  }

  else
  {
    id v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    id v26 = @"com.apple.mobileactivationd.spi";
    id v27 = &__kCFBooleanTrue;
    char v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL);
    uint64_t v16 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]",  1859LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"%@ is missing required entitlement: %@",  v17,  v18);
  }

  uint64_t v15 = 0LL;
  if (v4) {
LABEL_18:
  }
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v15, v16);
LABEL_19:
}

void __64__MobileActivationDaemon_isInFieldCollectedWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CollectionPerformedXPC",  "",  v11,  2u);
  }
}

- (void)updateBasebandTicket:(id)a3 baaCertData:(id)a4 baaIntermediateCert:(id)a5 options:(id)a6 withCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  uint64_t v61 = 0LL;
  id v62 = &v61;
  uint64_t v63 = 0x3032000000LL;
  id v64 = __Block_byref_object_copy__7;
  uint64_t v65 = __Block_byref_object_dispose__7;
  id v66 = 0LL;
  uint64_t v55 = 0LL;
  id v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000LL;
  id v58 = __Block_byref_object_copy__7;
  id v59 = __Block_byref_object_dispose__7;
  id v60 = 0LL;
  char v18 = copySignpostLoggingHandle();
  BOOL v19 = os_signpost_enabled(v18);

  if (v19)
  {
    os_signpost_id_t v20 = 0xEEEEB0B5B2B2EEEELL;
    if (v12 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v21 = copySignpostLoggingHandle();
      os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v21, v12);
    }

    os_signpost_id_t v22 = copySignpostLoggingHandle();
    id v23 = v22;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "UpdateBasebandTicketXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3254779904LL;
    v51[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke;
    v51[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v52 = v16;
    os_signpost_id_t v53 = v20;
    id v16 = objc_retainBlock(v51);
  }

  maLog( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]",  1LL,  @"Baseband ticket update requested by %@ (%@)",  v17,  v15);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    uint64_t v67 = @"com.apple.mobileactivationd.spi";
    v68 = &__kCFBooleanTrue;
    os_signpost_id_t v32 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL);
    id v33 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]",  1899LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v32);
    unsigned __int8 v34 = (void *)v62[5];
    v62[5] = (uint64_t)v33;

    id v35 = 0LL;
    goto LABEL_24;
  }

  if (v12 && v13 && v14)
  {
    uint64_t v24 = -[MobileActivationDaemon dark](self, "dark");
    unsigned __int8 v25 = dataMigrationCompleted(v24);

    if ((v25 & 1) != 0)
    {
      id v26 = -[MobileActivationDaemon dark](self, "dark");
      id v27 = data_ark_copy(v26, 0LL, @"ActivationState");
      id v28 = isNSString(v27);
      id v29 = v56[5];
      v56[5] = v28;

      id v30 = v56[5];
      if (!v30)
      {
        objc_storeStrong(v56 + 5, @"Unactivated");
        id v30 = v56[5];
      }

      if ([v30 isEqualToString:@"Activated"])
      {
        if (use_hactivation())
        {
          unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withC ompletionBlock:]",  1924LL,  @"com.apple.MobileActivation.ErrorDomain",  -3LL,  0LL,  @"Device is hactivated (not supported).");
        }

        else
        {
          if (is_product_cellular())
          {
            id v36 = [v15 objectForKeyedSubscript:@"NetworkTimeoutInterval"];
            id v37 = isNSNumber(v36);

            if (v37)
            {
              id v35 = [v15 objectForKeyedSubscript:@"NetworkTimeoutInterval"];
              [v35 doubleValue];
              if (v38 <= 0.0)
              {
                unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options :withCompletionBlock:]",  1936LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid network timeout requested: %@",  v35);
                goto LABEL_23;
              }
            }

            else
            {
              id v35 = 0LL;
            }

            id v39 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
            block[0] = _NSConcreteStackBlock;
            block[1] = 3254779904LL;
            block[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_306;
            block[3] = &__block_descriptor_112_e8_32s40s48s56s64s72s80s88bs96r104r_e5_v8__0l;
            id v49 = &v61;
            id v41 = v17;
            id v42 = v15;
            id v43 = v12;
            id v44 = v13;
            id v45 = v14;
            id v46 = self;
            id v35 = v35;
            id v47 = v35;
            id v50 = &v55;
            id v48 = v16;
            dispatch_async((dispatch_queue_t)v39, block);

            goto LABEL_26;
          }

          unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withC ompletionBlock:]",  1929LL,  @"com.apple.MobileActivation.ErrorDomain",  -3LL,  0LL,  @"Device doesn't support telephony.");
        }
      }

      else
      {
        unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]",  1919LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated: %@",  v56[5]);
      }
    }

    else
    {
      unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]",  1909LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    }
  }

  else
  {
    unsigned __int8 v31 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]",  1904LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input(s).");
  }

  id v35 = 0LL;
LABEL_23:
  os_signpost_id_t v32 = (NSDictionary *)v62[5];
  v62[5] = (uint64_t)v31;
LABEL_24:

  if (v16) {
    (*((void (**)(id, void, uint64_t))v16 + 2))(v16, 0LL, v62[5]);
  }
LABEL_26:
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "UpdateBasebandTicketXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_306( uint64_t a1)
{
  CFErrorRef error = 0LL;
  v164 = 0LL;
  SecAccessControlRef v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v146 = v2;
  if (!v2)
  {
    char v18 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComplet ionBlock:]_block_invoke",  1972LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to allocate dictionary.");
    uint64_t v19 = *(void *)(*(void *)(a1 + 96) + 8LL);
    os_signpost_id_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    v141 = 0LL;
    id v144 = 0LL;
    v145 = 0LL;
    id v143 = 0LL;
LABEL_69:
    SecAccessControlRef cf = 0LL;
    v140 = 0LL;
    uint64_t v11 = 0LL;
    id v12 = 0LL;
    id v13 = 0LL;
LABEL_73:
    v137 = 0LL;
    v138 = 0LL;
    id v14 = 0LL;
LABEL_74:
    id v15 = 0LL;
    id v16 = 0LL;
    goto LABEL_75;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 32),  @"clientName");
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularBootstrapProxy"];
  id v4 = isNSNumber(v3);

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularBootstrapProxy"];
    id v144 = v5;
    if (is_product_cellular() && [v5 BOOLValue])
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 96) + 8LL);
      v162 = *(NSError **)(v6 + 40);
      uint64_t v7 = copyCellularProxyDictionary(1, &v162);
      objc_storeStrong((id *)(v6 + 40), v162);
      if (!v7)
      {
        id v8 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComp letionBlock:]_block_invoke",  1983LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL),  @"Failed to query cellular network proxy info.");
        uint64_t v9 = *(void *)(*(void *)(a1 + 96) + 8LL);
        os_signpost_id_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        v140 = 0LL;
        v141 = 0LL;
        v145 = 0LL;
        id v142 = 0LL;
        id v143 = 0LL;
        v138 = 0LL;
        SecAccessControlRef cf = 0LL;
        uint64_t v11 = 0LL;
        id v12 = 0LL;
        id v13 = 0LL;
        v137 = 0LL;
        id v14 = 0LL;
        id v15 = 0LL;
        id v16 = 0LL;
        id v17 = 0LL;
        goto LABEL_76;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    id v144 = 0LL;
  }

  id v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularOTAProxy"];
  id v22 = isNSNumber(v21);

  if (v22)
  {
    id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"UseCellularOTAProxy"];
    id v143 = v23;
    if (is_product_cellular() && [v23 BOOLValue])
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 96) + 8LL);
      v161 = *(NSError **)(v24 + 40);
      id v16 = copyCellularProxyDictionary(0, &v161);
      objc_storeStrong((id *)(v24 + 40), v161);

      if (!v16)
      {
        id v40 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCom pletionBlock:]_block_invoke",  1996LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  *(id *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL),  @"Failed to query cellular network proxy info.");
        uint64_t v41 = *(void *)(*(void *)(a1 + 96) + 8LL);
        id v42 = *(void **)(v41 + 40);
        *(void *)(v41 + 40) = v40;

        v140 = 0LL;
        v141 = 0LL;
        v145 = 0LL;
        v138 = 0LL;
        SecAccessControlRef cf = 0LL;
        uint64_t v11 = 0LL;
        id v12 = 0LL;
        id v13 = 0LL;
        v137 = 0LL;
        id v14 = 0LL;
        id v15 = 0LL;
LABEL_75:
        id v142 = 0LL;
        id v17 = 0LL;
        uint64_t v7 = 0LL;
        goto LABEL_76;
      }

      LODWORD(v22) = 1;
      uint64_t v7 = v16;
    }

    else
    {
      LODWORD(v22) = 0;
    }
  }

  else
  {
    id v143 = 0LL;
  }

  id v25 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyHost"];
  id v26 = isNSString(v25);
  v145 = v7;
  if (v26)
  {
    id v27 = v26;
    id v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyPort"];
    id v29 = isNSNumber(v28);

    if (!v29) {
      goto LABEL_21;
    }
    v167[0] = @"SOCKSProxyHost";
    id v25 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyHost"];
    v168[0] = v25;
    v167[1] = @"SOCKSProxyPort";
    id v30 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SOCKSProxyPort"];
    v168[1] = v30;
    unsigned __int8 v31 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v168,  v167,  2LL);

    v145 = (NSMutableDictionary *)v31;
  }

LABEL_21:
  if (is_internal_build())
  {
    os_signpost_id_t v32 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    id v33 =  -[NSUserDefaults persistentDomainForName:]( v32,  "persistentDomainForName:",  @"com.apple.mobileactivationd");

    id v34 = -[NSDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", @"UseReverseProxy");
    id v35 = isNSNumber(v34);
    if (v35)
    {
      id v36 = v35;
      id v37 = -[NSDictionary objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", @"UseReverseProxy");
      unsigned int v38 = [v37 BOOLValue];

      if (v38)
      {
        if (v145)
        {
          v141 = v33;
          id v39 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withC ompletionBlock:]_block_invoke",  2012LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Cannot set both '%@' override and '%@'/'%@' option.",  @"UseReverseProxy",  @"UseCellularBootstrapProxy",  @"UseCellularOTAProxy");
LABEL_68:
          uint64_t v88 = *(void *)(*(void *)(a1 + 96) + 8LL);
          uint64_t v89 = *(void **)(v88 + 40);
          *(void *)(v88 + 40) = v39;

          goto LABEL_69;
        }

        v145 = copyReverseProxyDictionary(0LL, 0LL, 0LL);
      }
    }

    else
    {
    }
  }

  else
  {
    id v33 = 0LL;
  }

  SecAccessControlRef v43 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  v141 = v33;
  if (!v43)
  {
    id v39 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComplet ionBlock:]_block_invoke",  2028LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to create access control.");
    goto LABEL_68;
  }

  v165[0] = kSecAttrIsPermanent;
  v165[1] = kSecAttrTokenID;
  v166[0] = &__kCFBooleanFalse;
  v166[1] = kSecAttrTokenIDAppleKeyStore;
  v165[2] = kSecAttrTokenOID;
  v165[3] = kSecAttrAccessControl;
  v166[2] = *(void *)(a1 + 48);
  v166[3] = v43;
  SecAccessControlRef cf = v43;
  id v44 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v166,  v165,  4LL);
  id v13 = SecKeyCreateWithData((CFDataRef)+[NSData data](&OBJC_CLASS___NSData, "data"), (CFDictionaryRef)v44, &error);
  v140 = v44;
  if (!v13)
  {
    v90 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComplet ionBlock:]_block_invoke",  2043LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  error,  @"Failed to convert RK data blob.");
    uint64_t v91 = *(void *)(*(void *)(a1 + 96) + 8LL);
    uint64_t v92 = *(void **)(v91 + 40);
    *(void *)(v91 + 40) = v90;

    uint64_t v11 = 0LL;
LABEL_72:
    id v12 = 0LL;
    goto LABEL_73;
  }

  uint64_t v11 = SecCertificateCreateWithData(kCFAllocatorDefault, *(CFDataRef *)(a1 + 56));
  if (!v11)
  {
    v93 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComplet ionBlock:]_block_invoke",  2049LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create certificate.");
    uint64_t v94 = *(void *)(*(void *)(a1 + 96) + 8LL);
    v95 = *(void **)(v94 + 40);
    *(void *)(v94 + 40) = v93;

    goto LABEL_72;
  }

  id v14 = (NSDictionary *)SecCertificateCreateWithData(kCFAllocatorDefault, *(CFDataRef *)(a1 + 64));
  if (!v14)
  {
    v103 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComple tionBlock:]_block_invoke",  2055LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create certificate.");
    uint64_t v104 = *(void *)(*(void *)(a1 + 96) + 8LL);
    v105 = *(void **)(v104 + 40);
    *(void *)(v104 + 40) = v103;

    id v12 = 0LL;
    v137 = 0LL;
    v138 = 0LL;
    goto LABEL_74;
  }

  id v45 = [*(id *)(a1 + 72) dark];
  uint64_t v46 = a1 + 96;
  id v47 = *(void **)(a1 + 40);
  uint64_t v48 = *(void *)(*(void *)(a1 + 96) + 8LL);
  id v160 = *(id *)(v48 + 40);
  v136 = v14;
  id v14 = create_baseband_info(v45, v13, v11, (__SecCertificate *)v14, v47, &v160);
  objc_storeStrong((id *)(v48 + 40), v160);

  if (v14)
  {
    v159 = 0LL;
    uint64_t v49 = *(void *)(*(void *)v46 + 8LL);
    id obj = *(id *)(v49 + 40);
    char v50 = createXMLRequest(v14, &v159, (NSError **)&obj);
    uint64_t v7 = v159;
    objc_storeStrong((id *)(v49 + 40), obj);
    v138 = v14;
    if ((v50 & 1) != 0)
    {
      id v51 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %@",  @"iOS Device Activator (MobileActivation-1015.60.1)",  *(void *)(a1 + 32));
      if (v51)
      {
        v137 = v51;
        -[NSMutableDictionary setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:");
        id v52 =  +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://albert.apple.com/deviceservices/baseband");
        -[NSMutableDictionary setURL:](v7, "setURL:", v52);

        os_signpost_id_t v53 = *(void **)(a1 + 80);
        if (v53)
        {
          [v53 doubleValue];
          -[NSMutableDictionary setTimeoutInterval:](v7, "setTimeoutInterval:");
        }

        uint64_t v54 = a1 + 96;
        if (is_internal_build())
        {
          id v55 =  -[NSDictionary objectForKeyedSubscript:]( v141,  "objectForKeyedSubscript:",  @"BasebandOverrideURL");
          id v56 = isNSString(v55);

          if (v56)
          {
            id v57 =  -[NSDictionary objectForKeyedSubscript:]( v141,  "objectForKeyedSubscript:",  @"BasebandOverrideURL");
            id v58 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v57);
            -[NSMutableDictionary setURL:](v7, "setURL:", v58);
          }
        }

        id v59 = formatURLRequest(v7);
        id v60 = copy_log_directory_path();
        uint64_t v61 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_baseband_request.txt",  *(void *)(a1 + 32));
        id v62 = [v60 stringByAppendingPathComponent:v61];
        -[NSMutableString writeToFile:atomically:encoding:error:]( v59,  "writeToFile:atomically:encoding:error:",  v62,  0LL,  4LL,  0LL);

        uint64_t v63 = a1 + 96;
        if (is_product_cellular())
        {
          if ([v144 BOOLValue])
          {
            id v64 = +[MATelephonyInfo sharedInstance](&OBJC_CLASS___MATelephonyInfo, "sharedInstance");
            uint64_t v65 = *(void *)(*(void *)v54 + 8LL);
            id v157 = *(id *)(v65 + 40);
            unsigned __int8 v66 = -[MATelephonyInfo setCellularBootstrapAssertion:withError:]( v64,  "setCellularBootstrapAssertion:withError:",  1LL,  &v157);
            objc_storeStrong((id *)(v65 + 40), v157);

            if ((v66 & 1) == 0)
            {
              uint64_t v67 = copyLoggingHandle();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_4();
              }
            }
          }

          if ([v143 BOOLValue])
          {
            v68 = +[MATelephonyInfo sharedInstance](&OBJC_CLASS___MATelephonyInfo, "sharedInstance");
            uint64_t v69 = *(void *)(*(void *)v54 + 8LL);
            id v156 = *(id *)(v69 + 40);
            unsigned __int8 v70 = -[MATelephonyInfo setOTAActivationAssertion:withError:]( v68,  "setOTAActivationAssertion:withError:",  1LL,  &v156);
            objc_storeStrong((id *)(v69 + 40), v156);

            if ((v70 & 1) == 0)
            {
              id v71 = copyLoggingHandle();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_3();
              }
            }
          }
        }

        uint64_t v72 = *(void *)(*(void *)v54 + 8LL);
        id v154 = *(id *)(v72 + 40);
        id v155 = 0LL;
        id v17 = talkToServerWithError(v7, 0LL, (int)v22, v145, &v155, &v164, &v154);
        id v142 = v155;
        objc_storeStrong((id *)(v72 + 40), v154);
        if (is_product_cellular())
        {
          if ([v144 BOOLValue])
          {
            id v73 = +[MATelephonyInfo sharedInstance](&OBJC_CLASS___MATelephonyInfo, "sharedInstance");
            uint64_t v74 = *(void *)(*(void *)v63 + 8LL);
            id v153 = *(id *)(v74 + 40);
            unsigned __int8 v75 = -[MATelephonyInfo setCellularBootstrapAssertion:withError:]( v73,  "setCellularBootstrapAssertion:withError:",  0LL,  &v153);
            objc_storeStrong((id *)(v74 + 40), v153);

            if ((v75 & 1) == 0)
            {
              int v76 = copyLoggingHandle();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_2();
              }
            }
          }

          if ([v143 BOOLValue])
          {
            uint64_t v77 = +[MATelephonyInfo sharedInstance](&OBJC_CLASS___MATelephonyInfo, "sharedInstance");
            uint64_t v78 = *(void *)(*(void *)v63 + 8LL);
            id v152 = *(id *)(v78 + 40);
            unsigned __int8 v79 = -[MATelephonyInfo setOTAActivationAssertion:withError:]( v77,  "setOTAActivationAssertion:withError:",  0LL,  &v152);
            objc_storeStrong((id *)(v78 + 40), v152);

            if ((v79 & 1) == 0)
            {
              int v80 = copyLoggingHandle();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT)) {
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_1();
              }
            }
          }
        }

        uint64_t v81 = formatURLResponse(v17, (uint64_t)v164, v142);
        id v82 = copy_log_directory_path();
        uint64_t v83 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_baseband_response.txt",  *(void *)(a1 + 32));
        id v84 = [v82 stringByAppendingPathComponent:v83];
        -[NSMutableString writeToFile:atomically:encoding:error:]( v81,  "writeToFile:atomically:encoding:error:",  v84,  0LL,  4LL,  0LL);

        id v15 = v164;
        if (v164 != (void *)200)
        {
          if (!v164)
          {
            uint64_t v85 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:wit hCompletionBlock:]_block_invoke",  2118LL,  @"com.apple.MobileActivation.ErrorDomain",  -6LL,  *(void **)(*(void *)(*(void *)v63 + 8LL) + 40LL),  @"Network communication error.");
            uint64_t v86 = *(void *)(*(void *)v63 + 8LL);
            uint64_t v87 = *(void **)(v86 + 40);
            *(void *)(v86 + 40) = v85;

            id v14 = 0LL;
LABEL_102:
            id v16 = 0LL;
            goto LABEL_103;
          }

          v118 = *(void **)(*(void *)(*(void *)v63 + 8LL) + 40LL);
          v119 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v164);
          v120 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:with CompletionBlock:]_block_invoke",  2123LL,  @"com.apple.MobileActivation.ServerErrorDomain",  (uint64_t)v15,  v118,  @"Server error: %ld (%@)",  v15,  v119);

          uint64_t v121 = (uint64_t)v164;
          v122 =  +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v164);
          v123 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:with CompletionBlock:]_block_invoke",  2123LL,  @"com.apple.MobileActivation.ErrorDomain",  -5LL,  v120,  @"Server error: %ld (%@)",  v121,  v122);

          uint64_t v124 = *(void *)(*(void *)v63 + 8LL);
          v125 = *(void **)(v124 + 40);
          *(void *)(v124 + 40) = v123;
LABEL_101:

          id v14 = 0LL;
          id v15 = 0LL;
          goto LABEL_102;
        }

        v113 = (void **)(*(void *)(*(void *)v63 + 8LL) + 40LL);
        if (!v17)
        {
          v126 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:with CompletionBlock:]_block_invoke",  2128LL,  @"com.apple.MobileActivation.ErrorDomain",  -5LL,  *v113,  @"Failed to retrieve client certificate.");
          uint64_t v127 = *(void *)(*(void *)v63 + 8LL);
          v128 = *(void **)(v127 + 40);
          *(void *)(v127 + 40) = v126;
          v125 = v128;
          goto LABEL_101;
        }

        id v151 = 0LL;
        id v14 = (NSDictionary *) +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v17,  0LL,  0LL,  &v151);
        objc_storeStrong(v113, v151);
        id v15 = isNSDictionary(v14);

        if (!v15)
        {
          v129 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:with CompletionBlock:]_block_invoke",  2134LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)v63 + 8LL) + 40LL),  @"Failed to convert data to XML.");
          uint64_t v130 = *(void *)(*(void *)v63 + 8LL);
          v131 = *(void **)(v130 + 40);
          *(void *)(v130 + 40) = v129;

          goto LABEL_102;
        }

        id v16 = (NSMutableDictionary *) -[NSDictionary objectForKeyedSubscript:]( v14,  "objectForKeyedSubscript:",  @"AccountToken");
        id v15 = isNSData(v16);

        if (v15)
        {
          v114 = (id *)(*(void *)(*(void *)v63 + 8LL) + 40LL);
          id v150 = 0LL;
          id v15 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v16,  0LL,  0LL,  &v150);
          objc_storeStrong(v114, v150);
          id v115 = isNSDictionary(v15);

          if (v115)
          {
            v116 = (dispatch_queue_s *)[*(id *)(a1 + 72) xpcQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3254779904LL;
            block[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_2;
            block[3] = &__block_descriptor_64_e8_32s40s48r56r_e5_v8__0l;
            void block[4] = *(void *)(a1 + 72);
            int8x16_t v149 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
            id v15 = v15;
            id v148 = v15;
            dispatch_sync(v116, block);

            v117 = v148;
LABEL_108:

            goto LABEL_103;
          }

          MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCe rt:options:withCompletionBlock:]_block_invoke",  2146LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)v63 + 8LL) + 40LL),  @"Failed to convert data to XML.");
        }

        else
        {
          MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCe rt:options:withCompletionBlock:]_block_invoke",  2140LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Invalid account token.");
        }

        v133 = MobileActivationError;
        uint64_t v134 = *(void *)(*(void *)v63 + 8LL);
        v135 = *(void **)(v134 + 40);
        *(void *)(v134 + 40) = v133;
        v117 = v135;
        goto LABEL_108;
      }

      v109 = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComple tionBlock:]_block_invoke",  2074LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create user agent string.");
    }

    else
    {
      v109 = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComple tionBlock:]_block_invoke",  2068LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)v46 + 8LL) + 40LL),  @"Failed to create XML request.");
    }

    v110 = v109;
    uint64_t v111 = *(void *)(*(void *)v46 + 8LL);
    v112 = *(void **)(v111 + 40);
    *(void *)(v111 + 40) = v110;

    v137 = 0LL;
    id v14 = 0LL;
    id v15 = 0LL;
    id v16 = 0LL;
    id v142 = 0LL;
    id v17 = 0LL;
  }

  else
  {
    v106 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComple tionBlock:]_block_invoke",  2063LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)v46 + 8LL) + 40LL),  @"Failed to verify baa cert.");
    uint64_t v107 = *(void *)(*(void *)v46 + 8LL);
    v108 = *(void **)(v107 + 40);
    *(void *)(v107 + 40) = v106;

    v137 = 0LL;
    v138 = 0LL;
    id v15 = 0LL;
    id v16 = 0LL;
    id v142 = 0LL;
    id v17 = 0LL;
    uint64_t v7 = 0LL;
  }

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_2( uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dark];
  id v3 = data_ark_copy(v2, 0LL, @"ActivationState");
  id v4 = isNSString(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  os_signpost_id_t v10 = *(void **)(v7 + 40);
  uint64_t v9 = (id *)(v7 + 40);
  id v8 = v10;
  if (!v10)
  {
    objc_storeStrong(v9, @"Unactivated");
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  }

  if ([v8 isEqualToString:@"Activated"])
  {
    id v11 = [*(id *)(a1 + 32) dark];
    id v12 = *(void **)(a1 + 40);
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id obj = *(id *)(v14 + 40);
    char v15 = deliver_baseband_ticket((int)v11, v12, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if ((v15 & 1) == 0)
    {
      id v16 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompl etionBlock:]_block_invoke_2",  2163LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL),  @"Failed to deliver baseband ticket.");
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8LL);
      char v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }

  else
  {
    uint64_t v19 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withComplet ionBlock:]_block_invoke_2",  2158LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated: %@",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }

- (void)copyDCRTWithCompletionBlock:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }

    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "CopyDCRTXPC",  "",  buf,  2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3254779904LL;
    v29[2] = __69__MobileActivationDaemon_copyDCRTWithCompletionBlock_withCompletion___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v30 = v7;
    os_signpost_id_t v31 = v10;
    id v7 = objc_retainBlock(v29);
  }

  uint64_t v14 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v15 = dataMigrationCompleted(v14);

  if ((v15 & 1) != 0)
  {
    if (platform_supports_activation())
    {
      id v16 = -[MobileActivationDaemon dark](self, "dark");
      id v17 = data_ark_copy(v16, 0LL, @"ActivationState");
      char v18 = (__CFString *)isNSString(v17);

      if (!v18) {
        char v18 = @"Unactivated";
      }
      if ((-[__CFString isEqualToString:](v18, "isEqualToString:", @"Activated") & 1) == 0)
      {
        uint64_t v19 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]",  2222LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated (%@).",  v18);
        uint64_t v20 = 0LL;
        id v21 = 0LL;
        goto LABEL_23;
      }
    }

    else
    {
      char v18 = 0LL;
    }

    id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v21 = v22;
    if (v22)
    {
      if (v6) {
        -[NSMutableDictionary addEntriesFromDictionary:](v22, "addEntriesFromDictionary:", v6);
      }
      id v23 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
      uint64_t v24 =  +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  client_requires_critical_dcrt_oids((uint64_t)v23));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v24,  @"ValidateCriticalDcrtOIDs");

      id v25 = -[MobileActivationDaemon dark](self, "dark");
      id v28 = 0LL;
      uint64_t v20 = copyDCRT(v25, 0LL, 0LL, v21, &v28);
      uint64_t v19 = (NSError *)v28;

      if (v20)
      {
        id v33 = @"DCRTData";
        id v34 = v20;
        id v26 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL);
        if (!v7) {
          goto LABEL_25;
        }
      }

      else
      {
        id v27 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]",  2241LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy DCRT.");

        id v26 = 0LL;
        uint64_t v19 = v27;
        if (!v7) {
          goto LABEL_25;
        }
      }

      goto LABEL_24;
    }

    uint64_t v19 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]",  2229LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create mutable dictionary.");
    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v19 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]",  2211LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    uint64_t v20 = 0LL;
    id v21 = 0LL;
    char v18 = 0LL;
  }

void __69__MobileActivationDaemon_copyDCRTWithCompletionBlock_withCompletion___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyDCRTXPC",  "",  v11,  2u);
  }
}

- (void)getDCRTStateWithCompletionBlock:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }

    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "CopyDCRTStateXPC",  "",  buf,  2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3254779904LL;
    v30[2] = __73__MobileActivationDaemon_getDCRTStateWithCompletionBlock_withCompletion___block_invoke;
    v30[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v31 = v7;
    os_signpost_id_t v32 = v10;
    id v7 = objc_retainBlock(v30);
  }

  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v40 = @"com.apple.mobileactivationd.spi";
    uint64_t v41 = &__kCFBooleanTrue;
    id v22 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL);
    id v23 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]",  2269LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v22);

LABEL_17:
    uint64_t v20 = 0LL;
    char v18 = 0LL;
    id v21 = 0LL;
LABEL_18:
    uint64_t v19 = 0LL;
    goto LABEL_19;
  }

  uint64_t v14 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v15 = dataMigrationCompleted(v14);

  if ((v15 & 1) == 0)
  {
    id v23 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]",  2274LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_17;
  }

  if (platform_supports_activation())
  {
    id v16 = -[MobileActivationDaemon dark](self, "dark");
    id v17 = data_ark_copy(v16, 0LL, @"ActivationState");
    char v18 = (__CFString *)isNSString(v17);

    if (!v18) {
      char v18 = @"Unactivated";
    }
    if ((-[__CFString isEqualToString:](v18, "isEqualToString:", @"Activated") & 1) == 0)
    {
      unsigned int v38 = @"DCRTState";
      id v39 = @"DCRTUnavailable";
      uint64_t v19 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL);
      uint64_t v20 = 0LL;
      id v21 = 0LL;
LABEL_31:
      id v23 = 0LL;
      goto LABEL_19;
    }
  }

  else
  {
    char v18 = 0LL;
  }

  uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v21 = v24;
  if (!v24)
  {
    id v23 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]",  2292LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create mutable dictionary.");
    uint64_t v20 = 0LL;
    goto LABEL_18;
  }

  if (v6) {
    -[NSMutableDictionary addEntriesFromDictionary:](v24, "addEntriesFromDictionary:", v6);
  }
  id v25 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  id v26 =  +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  client_requires_critical_dcrt_oids((uint64_t)v25));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v26,  @"ValidateCriticalDcrtOIDs");

  id v27 = -[MobileActivationDaemon dark](self, "dark");
  id v29 = 0LL;
  uint64_t v20 = copyDCRT(v27, 0LL, 0LL, v21, &v29);
  id v23 = (NSError *)v29;

  if (v20)
  {
    id v34 = @"DCRTState";
    id v35 = @"DCRTAvailable";
    uint64_t v19 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL);
    goto LABEL_19;
  }

  if (mobileactivationErrorHasDomainAndErrorCode( v23,  @"com.apple.MobileActivation.ErrorDomain",  (id)0xFFFFFFFFFFFFFFF6LL))
  {

    id v36 = @"DCRTState";
    id v37 = @"DCRTUnavailable";
    uint64_t v19 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL);
    uint64_t v20 = 0LL;
    goto LABEL_31;
  }

  id v28 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]",  2310LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v23,  @"Failed to copy DCRT");

  uint64_t v20 = 0LL;
  uint64_t v19 = 0LL;
  id v23 = v28;
LABEL_19:
  if (v7) {
    (*((void (**)(id, NSDictionary *, NSError *))v7 + 2))(v7, v19, v23);
  }
}

void __73__MobileActivationDaemon_getDCRTStateWithCompletionBlock_withCompletion___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyDCRTStateXPC",  "",  v11,  2u);
  }
}

- (void)issueDCRT:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }

    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "IssueDCRTXPC",  "",  buf,  2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3254779904LL;
    v29[2] = __56__MobileActivationDaemon_issueDCRT_withCompletionBlock___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v30 = v7;
    os_signpost_id_t v31 = v10;
    id v7 = objc_retainBlock(v29);
  }

  id v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]",  1LL,  @"DCRT reissue requested by %@ (%@)",  v14,  v6);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v33 = @"com.apple.mobileactivationd.spi";
    id v34 = &__kCFBooleanTrue;
    id v26 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL);
    id v25 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]",  2342LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v26);

    goto LABEL_20;
  }

  unsigned __int8 v15 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    id v25 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]",  2347LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
LABEL_20:
    uint64_t v19 = 0LL;
    if (!v7) {
      goto LABEL_22;
    }
LABEL_21:
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0LL, v25);
    goto LABEL_22;
  }

  id v17 = -[MobileActivationDaemon dark](self, "dark");
  id v18 = data_ark_copy(v17, 0LL, @"ActivationState");
  uint64_t v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    uint64_t v19 = @"Unactivated";
  }
  if (platform_supports_activation()
    && (-[__CFString isEqualToString:](v19, "isEqualToString:", @"Activated") & 1) == 0)
  {
    id v27 = createAndLogError( (uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]",  2358LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Device is not activated (%@).",  v19);
LABEL_25:
    id v25 = v27;
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v20)
  {
    id v27 = createAndLogError( (uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]",  2365LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create mutable dictionary.",  v28);
    goto LABEL_25;
  }

  id v21 = v20;
  if (v6) {
    -[NSMutableDictionary addEntriesFromDictionary:](v20, "addEntriesFromDictionary:", v6);
  }
  id v22 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  id v23 =  +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  client_requires_critical_dcrt_oids((uint64_t)v22));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v23,  @"ValidateCriticalDcrtOIDs");

  uint64_t v24 = -[MobileActivationDaemon dark](self, "dark");
  issueDCRT(v24, v14, v21, v7);

  id v25 = 0LL;
LABEL_22:
}

void __56__MobileActivationDaemon_issueDCRT_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "IssueDCRTXPC",  "",  v11,  2u);
  }
}

- (void)issueUCRT:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }

    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "IssueUCRTXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3254779904LL;
    v23[2] = __56__MobileActivationDaemon_issueUCRT_withCompletionBlock___block_invoke;
    v23[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v24 = v7;
    os_signpost_id_t v25 = v10;
    id v7 = objc_retainBlock(v23);
  }

  id v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]",  1LL,  @"UCRT reissue requested by %@ (%@)",  v14,  v6);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v27 = @"com.apple.mobileactivationd.spi";
    uint64_t v28 = &__kCFBooleanTrue;
    id v22 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL);
    id v21 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]",  2403LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v22);

    goto LABEL_16;
  }

  unsigned __int8 v15 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    id v21 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]",  2408LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
LABEL_16:
    uint64_t v19 = 0LL;
    if (!v7) {
      goto LABEL_18;
    }
LABEL_17:
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0LL, v21);
    goto LABEL_18;
  }

  id v17 = -[MobileActivationDaemon dark](self, "dark");
  id v18 = data_ark_copy(v17, 0LL, @"ActivationState");
  uint64_t v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    uint64_t v19 = @"Unactivated";
  }
  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", @"Activated") & 1) == 0)
  {
    id v21 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]",  2418LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Device is not activated (%@).",  v19);
    if (!v7) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  uint64_t v20 = -[MobileActivationDaemon dark](self, "dark");
  issueUCRT(v20, v14, v6, v7);

  id v21 = 0LL;
LABEL_18:
}

void __56__MobileActivationDaemon_issueUCRT_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "IssueUCRTXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

- (void)issueCollection:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = os_signpost_enabled(v8);

  if (v9)
  {
    os_signpost_id_t v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v11 = copySignpostLoggingHandle();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v11, v7);
    }

    id v12 = copySignpostLoggingHandle();
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "IssueCollectionXPC",  " enableTelemetry=YES ",  buf,  2u);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3254779904LL;
    v38[2] = __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke;
    v38[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v39 = v7;
    os_signpost_id_t v40 = v10;
    id v7 = objc_retainBlock(v38);
  }

  id v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]",  1LL,  @"Collection requested by %@ (%@)",  v14,  v6);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    SecAccessControlRef v43 = @"com.apple.mobileactivationd.spi";
    id v44 = &__kCFBooleanTrue;
    id v33 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL);
    os_signpost_id_t v32 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]",  2455LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v33);

LABEL_32:
    id v24 = 0LL;
    id v23 = 0LL;
    id v28 = 0LL;
    id v30 = 0LL;
    id v20 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_33;
  }

  unsigned __int8 v15 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    os_signpost_id_t v32 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]",  2460LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    goto LABEL_32;
  }

  id v17 = -[MobileActivationDaemon dark](self, "dark");
  id v18 = data_ark_copy(v17, 0LL, @"ActivationState");
  uint64_t v19 = (__CFString *)isNSString(v18);

  if (!v19) {
    uint64_t v19 = @"Unactivated";
  }
  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", @"Activated") & 1) != 0)
  {
    id v20 = [v6 objectForKeyedSubscript:@"scheduleCollectionForCurrentBuild"];
    id v21 = isNSNumber(v20);

    if (!v21)
    {

      id v20 = &__kCFBooleanFalse;
    }

    if (![v20 BOOLValue])
    {
      id v34 = -[MobileActivationDaemon dark](self, "dark");
      issueCollection(v34, v14, v6, v7);

      os_signpost_id_t v32 = 0LL;
      id v30 = 0LL;
      id v28 = 0LL;
      id v23 = 0LL;
      id v24 = 0LL;
      goto LABEL_35;
    }

    id v22 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
    id v23 = [v22 copyAnswer:@"BuildVersion"];

    id v24 = isNSString(v23);
    if (v24)
    {
      os_signpost_id_t v25 = -[MobileActivationDaemon dark](self, "dark");
      id v24 = data_ark_copy(v25, 0LL, @"CollectionLastPerformed");

      id v26 = isNSString(v24);
      if (!v26)
      {

        id v24 = 0LL;
      }

      id v27 = -[MobileActivationDaemon dark](self, "dark");
      id v28 = data_ark_copy(v27, 0LL, @"InFieldCollectionInFlight");

      id v29 = isNSNumber(v28);
      if (!v29)
      {

        id v28 = &__kCFBooleanFalse;
      }

      id v30 = [v6 objectForKeyedSubscript:@"IgnoreExistingCollection"];
      id v35 = isNSNumber(v30);

      if (!v35)
      {

        id v30 = &__kCFBooleanFalse;
      }

      if ((([v30 BOOLValue] & 1) != 0
         || ([v24 isEqualToString:v23] & 1) == 0)
        && ([v28 BOOLValue] & 1) == 0)
      {
        id v36 = -[MobileActivationDaemon dark](self, "dark");
        data_ark_remove(v36, 0LL, @"CollectionLastPerformed");

        id v37 = copyLoggingHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Scheduling collection as requested by %@.",  buf,  0xCu);
        }

        os_signpost_id_t v31 = -[MobileActivationDaemon dark](self, "dark");
        scheduleXPCActivity( v31,  (const char *)[@"com.apple.mobileactivationd.collection" UTF8String],  5u,  1,  0x5000u,  0x1000u,  &__block_literal_global_359);
      }

      os_signpost_id_t v32 = 0LL;
    }

    else
    {
      os_signpost_id_t v32 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]",  2487LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve build version.");
      id v28 = 0LL;
      id v30 = 0LL;
    }
  }

  else
  {
    os_signpost_id_t v32 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]",  2470LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Device is not activated (%@).",  v19);
    id v24 = 0LL;
    id v23 = 0LL;
    id v28 = 0LL;
    id v30 = 0LL;
    id v20 = 0LL;
  }

void __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "IssueCollectionXPC",  " enableTelemetry=YES ",  v11,  2u);
  }
}

void __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke_358(id a1, DataArk *a2)
{
}

- (void)ucrtUpgradeRequiredWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "UCRTUpgradeRequiredXPC",  "",  buf,  2u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3254779904LL;
    v31[2] = __65__MobileActivationDaemon_ucrtUpgradeRequiredWithCompletionBlock___block_invoke;
    v31[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v32 = v4;
    os_signpost_id_t v33 = v7;
    id v4 = objc_retainBlock(v31);
  }

  id v11 = -[MobileActivationDaemon dark](self, "dark");
  unsigned __int8 v12 = dataMigrationCompleted(v11);

  if ((v12 & 1) == 0)
  {
    id v18 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]",  2545LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Data Migration not complete.");
    id v22 = 0LL;
    id v24 = 0LL;
    id v27 = 0LL;
    unsigned __int8 v15 = 0LL;
    goto LABEL_24;
  }

  id v13 = -[MobileActivationDaemon dark](self, "dark");
  id v14 = data_ark_copy(v13, 0LL, @"ActivationState");
  unsigned __int8 v15 = (__CFString *)isNSString(v14);

  if (!v15) {
    unsigned __int8 v15 = @"Unactivated";
  }
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", @"Activated") & 1) == 0)
  {
    id v18 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]",  2555LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Device is not activated (%@).",  v15);
    id v22 = 0LL;
    id v24 = 0LL;
    id v27 = 0LL;
LABEL_24:
    SecCertificateRef v17 = 0LL;
    if (!v4) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  unsigned __int8 v16 = -[MobileActivationDaemon dark](self, "dark");
  id v30 = 0LL;
  SecCertificateRef v17 = copyUCRT(v16, (NSError **)&v30);
  id v18 = (NSError *)v30;

  if (!v17
    && (mobileactivationErrorHasDomainAndErrorCode( v18,  @"com.apple.MobileActivation.ErrorDomain",  (id)0xFFFFFFFFFFFFFFFCLL) & 1) == 0)
  {
    id v29 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]",  2561LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v18,  @"Failed to copy UCRT.");

    id v22 = 0LL;
    id v24 = 0LL;
    id v27 = 0LL;
    SecCertificateRef v17 = 0LL;
    id v18 = v29;
    if (!v4) {
      goto LABEL_26;
    }
LABEL_25:
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v27, v18);
    goto LABEL_26;
  }

  uint64_t v19 = -[MobileActivationDaemon dark](self, "dark");
  id v20 = data_ark_copy(v19, 0LL, @"UCRTHealingRequired");
  id v21 = isNSNumber(v20);

  if (v21) {
    id v22 = v21;
  }
  else {
    id v22 = &__kCFBooleanFalse;
  }
  id v23 = -[MobileActivationDaemon dark](self, "dark");
  id v24 = data_ark_copy(v23, 0LL, @"UIKUpgradeRequired");

  id v25 = isNSNumber(v24);
  if (!v25)
  {

    id v24 = &__kCFBooleanFalse;
  }

  id v35 = @"UCRTUpgradeRequired";
  else {
    uint64_t v26 = 1LL;
  }
  id v28 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v26);
  id v36 = v28;
  id v27 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL);

  if (v4) {
    goto LABEL_25;
  }
LABEL_26:
  if (v17) {
    CFRelease(v17);
  }
}

void __65__MobileActivationDaemon_ucrtUpgradeRequiredWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "UCRTUpgradeRequiredXPC",  "",  v11,  2u);
  }
}

- (void)copyLegacyDeviceIdentityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__7;
  id v30 = __Block_byref_object_dispose__7;
  id v31 = 0LL;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "CopyLegacyIdentityXPC",  "",  buf,  2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3254779904LL;
    v22[2] = __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke;
    v22[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v23 = v4;
    os_signpost_id_t v24 = v7;
    id v4 = objc_retainBlock(v22);
  }

  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v11 = -[MobileActivationDaemon dark](self, "dark");
    id v12 = data_ark_copy(v11, 0LL, @"ActivationState");
    id v13 = (__CFString *)isNSString(v12);

    if (!v13) {
      id v13 = @"Unactivated";
    }
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", @"Activated") & 1) != 0)
    {
      id v14 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3254779904LL;
      block[2] = __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke_360;
      block[3] = &__block_descriptor_48_e8_32bs40r_e5_v8__0l;
      id v21 = &v26;
      id v20 = v4;
      dispatch_async((dispatch_queue_t)v14, block);

      goto LABEL_17;
    }

    id v18 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]",  2609LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated (%@).",  v13);
    unsigned __int8 v15 = (NSDictionary *)v27[5];
    v27[5] = (uint64_t)v18;
  }

  else
  {
    id v32 = @"com.apple.mobileactivationd.spi";
    os_signpost_id_t v33 = &__kCFBooleanTrue;
    unsigned __int8 v15 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
    unsigned __int8 v16 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]",  2599LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v15);
    SecCertificateRef v17 = (void *)v27[5];
    v27[5] = (uint64_t)v16;

    id v13 = 0LL;
  }

  if (v4) {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0LL, v27[5]);
  }
LABEL_17:
  _Block_object_dispose(&v26, 8);
}

void __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyLegacyIdentityXPC",  "",  v11,  2u);
  }
}

void __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke_360(uint64_t a1)
{
  SecKeyRef privateKeyRef = 0LL;
  SecCertificateRef certificateRef = 0LL;
  CFErrorRef error = 0LL;
  SecIdentityRef identityRef = 0LL;
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v2 + 40);
  copy_keys_and_certs( @"lockdown-identities",  @"com.apple.lockdown.identity.activation",  0LL,  0LL,  0LL,  &identityRef,  (NSError **)&obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  if (!identityRef)
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke",  2636LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  @"Failed to copy legacy device identity.");
LABEL_11:
    os_signpost_id_t v10 = MobileActivationError;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    CFDataRef v4 = 0LL;
LABEL_15:
    CFDataRef v7 = 0LL;
    goto LABEL_16;
  }

  uint64_t v3 = SecIdentityCopyCertificate(identityRef, &certificateRef);
  if ((_DWORD)v3 || !certificateRef)
  {
    MobileActivationError = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke",  2642LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to decode certificate: %d",  v3);
    goto LABEL_11;
  }

  CFDataRef v4 = SecCertificateCopyData(certificateRef);
  if (!v4)
  {
    id v13 = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke",  2648LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy certificate data.");
LABEL_14:
    id v14 = v13;
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unsigned __int8 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    goto LABEL_15;
  }

  uint64_t v5 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
  if ((_DWORD)v5 || !privateKeyRef)
  {
    id v13 = createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke",  2654LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to decode private key: %d",  v5);
    goto LABEL_14;
  }

  CFDataRef v6 = SecKeyCopyExternalRepresentation(privateKeyRef, &error);
  CFDataRef v7 = v6;
  if (v6)
  {
    v26[0] = @"LegacyDeviceIdentityCertificateDataBlob";
    v26[1] = @"LegacyDeviceIdentityPrivateKeyDataBlob";
    v27[0] = v4;
    v27[1] = v6;
    id v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL);
    goto LABEL_17;
  }

  id v18 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke",  2660LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to copy private key data.");
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

LABEL_16:
  id v8 = 0LL;
LABEL_17:
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, NSDictionary *, void))(v17 + 16))( v17,  v8,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  if (error) {
    CFRelease(error);
  }
  CFErrorRef error = 0LL;
  if (identityRef) {
    CFRelease(identityRef);
  }
  SecIdentityRef identityRef = 0LL;
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  SecCertificateRef certificateRef = 0LL;
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  SecKeyRef privateKeyRef = 0LL;
}

- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "DeleteLegacyIdentityXPC",  "",  buf,  2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3254779904LL;
    v21[2] = __72__MobileActivationDaemon_deleteLegacyDeviceIdentityWithCompletionBlock___block_invoke;
    void v21[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v22 = v4;
    os_signpost_id_t v23 = v7;
    id v4 = objc_retainBlock(v21);
  }

  id v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog( (uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]",  1LL,  @"Legacy Identity (delete) requested by %@",  v11);

  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v12 = -[MobileActivationDaemon dark](self, "dark");
    id v13 = data_ark_copy(v12, 0LL, @"ActivationState");
    id v14 = (__CFString *)isNSString(v13);

    if (!v14) {
      id v14 = @"Unactivated";
    }
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", @"Activated") & 1) == 0)
    {
      uint64_t v17 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]",  2718LL,  @"com.apple.MobileActivation.ErrorDomain",  -8LL,  0LL,  @"Device is not activated (%@).",  v14);
      uint64_t v15 = 0LL;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }

    id v25 = @"UseSystemKeychainSharediPadOnly";
    uint64_t v26 = &__kCFBooleanTrue;
    uint64_t v15 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL);
    id v20 = 0LL;
    char v16 = delete_identity( @"lockdown-identities",  @"com.apple.lockdown.identity.activation",  v15,  (NSError **)&v20);
    uint64_t v17 = (NSError *)v20;
    if ((v16 & 1) == 0)
    {
      id v18 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]",  2727LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v17,  @"Failed to delete existing identity.");

      uint64_t v17 = v18;
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  else
  {
    id v27 = @"com.apple.mobileactivationd.spi";
    uint64_t v28 = &__kCFBooleanTrue;
    uint64_t v19 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL);
    uint64_t v17 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]",  2708LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v19);

    uint64_t v15 = 0LL;
    id v14 = 0LL;
  }

  if (v4) {
LABEL_17:
  }
    (*((void (**)(id, void, NSError *))v4 + 2))(v4, 0LL, v17);
LABEL_18:
}

void __72__MobileActivationDaemon_deleteLegacyDeviceIdentityWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "DeleteLegacyIdentityXPC",  "",  v11,  2u);
  }
}

- (void)copyUCRTVersionInfoWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = copySignpostLoggingHandle();
  BOOL v6 = os_signpost_enabled(v5);

  if (v6)
  {
    os_signpost_id_t v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      id v8 = copySignpostLoggingHandle();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v8, v4);
    }

    BOOL v9 = copySignpostLoggingHandle();
    os_signpost_id_t v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "CopyUCRTVersionInfoXPC",  "",  buf,  2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3254779904LL;
    v17[2] = __65__MobileActivationDaemon_copyUCRTVersionInfoWithCompletionBlock___block_invoke;
    v17[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    id v18 = v4;
    os_signpost_id_t v19 = v7;
    id v4 = objc_retainBlock(v17);
  }

  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", @"com.apple.mobileactivationd.spi"))
  {
    id v16 = 0LL;
    id v11 = -[MobileActivationDaemon copyUCRTVersionInfoWithError:](self, "copyUCRTVersionInfoWithError:", &v16);
    id v12 = (NSError *)v16;
    if (v11)
    {
      id v21 = @"UCRTVersionInfo";
      id v22 = v11;
      id v13 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL);
      if (!v4) {
        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v15 =  createMobileActivationError( (uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithCompletionBlock:]",  2757LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  v12,  @"Failed to copy UCRT version info.");

      id v13 = 0LL;
      id v12 = v15;
      if (!v4) {
        goto LABEL_14;
      }
    }

    goto LABEL_13;
  }

  os_signpost_id_t v23 = @"com.apple.mobileactivationd.spi";
  os_signpost_id_t v24 = &__kCFBooleanTrue;
  id v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL);
  id v12 =  createAndLogError( (uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithCompletionBlock:]",  2751LL,  @"com.apple.MobileActivation.ErrorDomain",  -7LL,  0LL,  @"Client is missing required entitlement: %@",  v14);

  id v11 = 0LL;
  id v13 = 0LL;
  if (v4) {
LABEL_13:
  }
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v13, v12);
LABEL_14:
}

void __65__MobileActivationDaemon_copyUCRTVersionInfoWithCompletionBlock___block_invoke( uint64_t a1,  id a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  id v8 = copySignpostLoggingHandle();
  BOOL v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "CopyUCRTVersionInfoXPC",  "",  v11,  2u);
  }
}

- (DataArk)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (OS_dispatch_queue)creationQueue
{
  return self->_creationQueue;
}

- (NSString)activationNonce
{
  return self->_activationNonce;
}

- (void)setActivationNonce:(id)a3
{
}

- (NSString)activationSessionClientName
{
  return self->_activationSessionClientName;
}

- (void)setActivationSessionClientName:(id)a3
{
}

- (NSString)recertNonce
{
  return self->_recertNonce;
}

- (void)setRecertNonce:(id)a3
{
}

- (void).cxx_destruct
{
}

@end