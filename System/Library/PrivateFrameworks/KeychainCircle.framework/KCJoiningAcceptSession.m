@interface KCJoiningAcceptSession
+ (id)sessionWithInitialMessage:(id)a3 secretDelegate:(id)a4 circleDelegate:(id)a5 dsid:(unint64_t)a6 error:(id *)a7;
- (BOOL)isDone;
- (BOOL)setupSession:(id *)a3;
- (BOOL)shouldAcceptOctagonRequests;
- (BOOL)shouldProcessSOSApplication:(id)a3 pairingMessage:(id)a4;
- (KCAESGCMDuplexSession)session;
- (KCJoiningAcceptCircleDelegate)circleDelegate;
- (KCJoiningAcceptSecretDelegate)secretDelegate;
- (KCJoiningAcceptSession)initWithSecretDelegate:(id)a3 circleDelegate:(id)a4 dsid:(unint64_t)a5 rng:(ccrng_state *)a6 error:(id *)a7;
- (KCSRPServerContext)context;
- (NSData)octagon;
- (NSData)startMessage;
- (NSMutableDictionary)defaults;
- (NSString)piggy_uuid;
- (OTControl)otControl;
- (OTControlArguments)controlArguments;
- (OTJoiningConfiguration)joiningConfiguration;
- (id)copyChallengeMessage:(id *)a3;
- (id)createPairingMessageFromJoiningMessage:(id)a3 error:(id *)a4;
- (id)createTLKRequestResponse:(id *)a3;
- (id)description;
- (id)processApplication:(id)a3 error:(id *)a4;
- (id)processInitialMessage:(id)a3 error:(id *)a4;
- (id)processMessage:(id)a3 error:(id *)a4;
- (id)processResponse:(id)a3 error:(id *)a4;
- (id)processSOSApplication:(id)a3 error:(id *)a4;
- (id)stateString;
- (int)piggy_version;
- (int)state;
- (unint64_t)dsid;
- (void)setCircleDelegate:(id)a3;
- (void)setControlArguments:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setJoiningConfiguration:(id)a3;
- (void)setOctagon:(id)a3;
- (void)setOtControl:(id)a3;
- (void)setPiggy_uuid:(id)a3;
- (void)setPiggy_version:(int)a3;
- (void)setSecretDelegate:(id)a3;
- (void)setStartMessage:(id)a3;
@end

@implementation KCJoiningAcceptSession

- (BOOL)setupSession:(id *)a3
{
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[KCAESGCMDuplexSession sessionAsReceiver:context:]( &OBJC_CLASS___KCAESGCMDuplexSession,  "sessionAsReceiver:context:",  v10,  -[KCJoiningAcceptSession dsid](self, "dsid"));
    v11 = (KCAESGCMDuplexSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v11;
    v13 = -[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration");
    [v13 pairingUUID];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[KCJoiningAcceptSession session](self, "session");
    [v15 setPairingUUID:v14];
    v16 = -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
    [v16 altDSID];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[KCJoiningAcceptSession session](self, "session");
    [v18 setAltDSID:v17];

    uint64_t v19 = -[KCJoiningAcceptSession piggy_version](self, "piggy_version");
    v20 = -[KCJoiningAcceptSession session](self, "session");
    [v20 setPiggybackingVersion:v19];
    v21 = -[KCJoiningAcceptSession session](self, "session");
    BOOL v22 = v21 != 0LL;
  }

  else
  {
    KCJoiningErrorCreate(7LL, a3, @"No session key available", v5, v6, v7, v8, v9, v24);
    BOOL v22 = 0;
  }

  return v22;
}

- (KCJoiningAcceptSession)initWithSecretDelegate:(id)a3 circleDelegate:(id)a4 dsid:(unint64_t)a5 rng:(ccrng_state *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___KCJoiningAcceptSession;
  v14 = -[KCJoiningAcceptSession init](&v36, sel_init);
  if (v14)
  {
    secLogObjForScope("accepting");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187D59000, v15, OS_LOG_TYPE_DEFAULT, "initWithSecretDelegate", buf, 2u);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(&OBJC_CLASS___KCSRPServerContext);
    [v12 secret];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = ccsha256_di();
    uint64_t v20 = -[KCSRPServerContext initWithUser:password:digestInfo:group:randomSource:]( v17,  "initWithUser:password:digestInfo:group:randomSource:",  v16,  v18,  v19,  ccsrp_gp_rfc5054_3072(),  a6);
    context = v14->_context;
    v14->_context = (KCSRPServerContext *)v20;

    -[KCJoiningAcceptSession setSecretDelegate:](v14, "setSecretDelegate:", v12);
    -[KCJoiningAcceptSession setCircleDelegate:](v14, "setCircleDelegate:", v13);
    v14->_state = 0;
    v14->_dsid = a5;
    piggy_uuid = v14->_piggy_uuid;
    v14->_piggy_uuid = 0LL;

    uint64_t v23 = [MEMORY[0x189603FC8] dictionary];
    defaults = v14->_defaults;
    v14->_defaults = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x18960AF98] controlObject:1 error:a7];
    otControl = v14->_otControl;
    v14->_otControl = (OTControl *)v25;

    v14->_piggy_version = 2;
    id v27 = objc_alloc(MEMORY[0x18960AFA8]);
    [MEMORY[0x189607AB8] UUID];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 UUIDString];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v27 initWithProtocolType:@"OctagonPiggybacking" uniqueDeviceID:@"acceptor-deviceid" uniqueClientID:@"requester-deviceid" pairingUUID:v29 epoch:0 isInitiator:0];
    joiningConfiguration = v14->_joiningConfiguration;
    v14->_joiningConfiguration = (OTJoiningConfiguration *)v30;

    v32 = (OTControlArguments *)objc_alloc_init(MEMORY[0x18960AFA0]);
    controlArguments = v14->_controlArguments;
    v14->_controlArguments = v32;
  }

  return v14;
}

- (id)stateString
{
  unsigned int v3 = -[KCJoiningAcceptSession state](self, "state");
  if (v3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", -[KCJoiningAcceptSession state](self, "state"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = off_18A135310[v3];
  }

  return v4;
}

- (id)description
{
  unsigned int v3 = (void *)NSString;
  unint64_t v4 = -[KCJoiningAcceptSession dsid](self, "dsid");
  -[KCJoiningAcceptSession stateString](self, "stateString");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession context](self, "context");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession piggy_uuid](self, "piggy_uuid");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<KCJoiningAcceptSession: %lld %@ %@ uuid: %@>", v4, v5, v6, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyChallengeMessage:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession startMessage](self, "startMessage");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v5 copyChallengeFor:v6 error:a3];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x189603F48];
    -[KCJoiningAcceptSession context](self, "context");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 salt];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 dataWithEncodedSequenceData:v10 data:v7 error:a3];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[KCJoiningAcceptSession setupSession:](self, "setupSession:", a3)) {
      id v12 = v11;
    }
    else {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)shouldAcceptOctagonRequests
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v3 = objc_alloc_init(MEMORY[0x18960AFB0]);
  [v3 setDiscretionaryNetwork:1];
  -[KCJoiningAcceptSession otControl](self, "otControl");
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __53__KCJoiningAcceptSession_shouldAcceptOctagonRequests__block_invoke;
  v7[3] = &unk_18A135298;
  v7[4] = &v8;
  [v4 fetchTrustStatus:v5 configuration:v3 reply:v7];

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (id)processInitialMessage:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v53 = 0LL;
  uint64_t v54 = 0LL;
  id v52 = 0LL;
  extractStartFromInitialMessage(v6, &v54, &v53, &v52, a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v53;
  id v9 = v52;
  -[KCJoiningAcceptSession setStartMessage:](self, "setStartMessage:", v7);

  -[KCJoiningAcceptSession startMessage](self, "startMessage");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    secLogObjForScope("SecError");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0LL;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl( &dword_187D59000,  v12,  OS_LOG_TYPE_DEFAULT,  "joining: failed to extract startMessage: %@",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_31;
  }

  uint64_t v11 = v54;
  if (v54 == 2)
  {
    if (-[KCJoiningAcceptSession shouldAcceptOctagonRequests](self, "shouldAcceptOctagonRequests"))
    {
      -[KCJoiningAcceptSession setOctagon:](self, "setOctagon:", v9);
      uint64_t v11 = 2LL;
      goto LABEL_15;
    }

    secLogObjForScope("SecError");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_187D59000,  v14,  OS_LOG_TYPE_DEFAULT,  "joining: octagon refusing octagon acceptor since we don't have a selfEgo",  (uint8_t *)&buf,  2u);
    }

    if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) != 0
      || (-[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 testsEnabled],
          v15,
          (v16 & 1) != 0))
    {
      secLogObjForScope("joining");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_187D59000,  v17,  OS_LOG_TYPE_DEFAULT,  "device supports SOS, continuing flow with piggyV1",  (uint8_t *)&buf,  2u);
      }

      uint64_t v11 = 1LL;
      goto LABEL_15;
    }

    secLogObjForScope("SecError");
    objc_super v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( &dword_187D59000,  v36,  OS_LOG_TYPE_DEFAULT,  "joining: device does not support SOS, failing flow",  (uint8_t *)&buf,  2u);
    }

    KCJoiningErrorCreate( 20LL,  a4,  @"Unable to piggyback with device due to lack of trust system support",  v37,  v38,  v39,  v40,  v41,  v44);
LABEL_31:
    v26 = 0LL;
    goto LABEL_43;
  }

- (id)processResponse:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([v6 type] == 2)
  {
    -[KCJoiningAcceptSession secretDelegate](self, "secretDelegate");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningAcceptSession context](self, "context");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 firstData];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)[v13 copyConfirmationFor:v14 error:0];

    if (v15)
    {
      char v16 = (void *)MEMORY[0x189603F48];
      [v12 accountCode];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 dataWithEncodedString:v17 error:a4];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[KCJoiningAcceptSession session](self, "session");
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 encrypt:v18 error:a4];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          self->_state = 2;
          v21 = +[KCJoiningMessage messageWithType:data:payload:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:payload:error:",  3LL,  v15,  v20,  a4);
          [v21 der];
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          BOOL v22 = 0LL;
        }
      }

      else
      {
        BOOL v22 = 0LL;
      }

      goto LABEL_23;
    }

    int v23 = [v12 verificationFailed:a4];
    secLogObjForScope("SecError");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v39 = v23;
      _os_log_impl(&dword_187D59000, v24, OS_LOG_TYPE_DEFAULT, "processResponse: handle error: %d", buf, 8u);
    }

    if (v23 == 2)
    {
      -[KCJoiningAcceptSession context](self, "context");
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 secret];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      int v32 = [v30 resetWithPassword:v31 error:a4];

      if (!v32) {
        goto LABEL_22;
      }
      id v33 = -[KCJoiningAcceptSession copyChallengeMessage:](self, "copyChallengeMessage:", a4);
    }

    else
    {
      if (v23 != 1)
      {
        if (!v23) {
          KCJoiningErrorCreate( 7LL,  a4,  @"Delegate returned error without filling in error: %@",  v25,  v26,  v27,  v28,  v29,  (uint64_t)v12);
        }
        goto LABEL_22;
      }

      [MEMORY[0x189603F48] data];
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }

    v34 = v33;
    if (v33)
    {
      +[KCJoiningMessage messageWithType:data:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:error:",  0LL,  v33,  a4);
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 der];
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      goto LABEL_24;
    }

- (id)processSOSApplication:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[KCJoiningAcceptSession session](self, "session");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 decryptAndVerify:v6 error:a4];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[KCJoiningAcceptSession circleDelegate](self, "circleDelegate");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = 0LL;
    uint64_t v10 = SOSPeerInfoCreateFromData();
    if (v10)
    {
      uint64_t v11 = (const void *)v10;
      [v9 circleJoinDataFor:v10 error:a4];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v11);
      if (v12)
      {
        int v13 = -[KCJoiningAcceptSession piggy_version](self, "piggy_version");
        if (v13 == 2)
        {
          secLogObjForScope("acceptor");
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            uint64_t v15 = 2LL;
            _os_log_impl(&dword_187D59000, v14, OS_LOG_TYPE_DEFAULT, "piggy version is 2", buf, 2u);
          }

          else
          {
            uint64_t v15 = 2LL;
          }
        }

        else
        {
          if (v13 != 1)
          {
            v17 = v12;
LABEL_23:
            -[KCJoiningAcceptSession session](self, "session");
            BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 encrypt:v17 error:a4];
            char v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16) {
              id v23 = v16;
            }

            goto LABEL_26;
          }

          secLogObjForScope("acceptor");
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl(&dword_187D59000, v14, OS_LOG_TYPE_DEFAULT, "piggy version is 1", buf, 2u);
          }

          uint64_t v15 = 3LL;
        }

        id v25 = 0LL;
        [v9 circleGetInitialSyncViews:v15 error:&v25];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v19 = v25;
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithData:v12];
        v17 = v20;
        if (v18)
        {
          [v20 appendData:v18];
        }

        else
        {
          secLogObjForScope("piggy");
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            id v28 = v19;
            _os_log_impl(&dword_187D59000, v21, OS_LOG_TYPE_DEFAULT, "PB threw an error: %@", buf, 0xCu);
          }
        }

        goto LABEL_23;
      }
    }

    else if (a4)
    {
      char v16 = 0LL;
      *a4 = v26;
LABEL_26:

      goto LABEL_27;
    }

    char v16 = 0LL;
    goto LABEL_26;
  }

  char v16 = 0LL;
LABEL_27:

  return v16;
}

- (id)createPairingMessageFromJoiningMessage:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[KCJoiningAcceptSession session](self, "session");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 firstData];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 decryptAndVerify:v8 error:a4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    uint64_t v10 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___KCInitialMessageData), "initWithData:", v9);
    if (v10)
    {
      uint64_t v11 = v10;
      if (-[KCInitialMessageData hasPrepareMessage](v10, "hasPrepareMessage"))
      {
        id v12 = objc_alloc(&OBJC_CLASS___OTPairingMessage);
        [v11 prepareMessage];
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[PBCodable initWithData:](v12, "initWithData:", v13);

        goto LABEL_14;
      }

      secLogObjForScope("SecError");
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl( &dword_187D59000,  v23,  OS_LOG_TYPE_DEFAULT,  "InitialMessageData does not contain prepare message",  v31,  2u);
      }

      KCJoiningErrorCreate( 6LL,  a4,  @"Expected prepare message inside InitialMessageData",  v24,  v25,  v26,  v27,  v28,  *(uint64_t *)v31);
    }

    else
    {
      secLogObjForScope("SecError");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl( &dword_187D59000,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to parse InitialMessageData from decrypted message data",  v31,  2u);
      }

      KCJoiningErrorCreate( 6LL,  a4,  @"Failed to parse InitialMessageData from decrypted message data",  v18,  v19,  v20,  v21,  v22,  *(uint64_t *)v31);
      uint64_t v11 = 0LL;
    }

    v14 = 0LL;
    goto LABEL_14;
  }

  secLogObjForScope("KeychainCircle");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      uint64_t v30 = (const __CFString *)*a4;
    }
    else {
      uint64_t v30 = &stru_18A137758;
    }
    *(_DWORD *)uint64_t v31 = 138412290;
    *(void *)&v31[4] = v30;
    _os_log_debug_impl( &dword_187D59000,  v15,  OS_LOG_TYPE_DEBUG,  "Failed to decrypt message first data: %@. Trying legacy OTPairingMessage construction.",  v31,  0xCu);
  }

  char v16 = objc_alloc(&OBJC_CLASS___OTPairingMessage);
  [v6 firstData];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PBCodable initWithData:](v16, "initWithData:", v11);
LABEL_14:

  return v14;
}

- (id)createTLKRequestResponse:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[KCJoiningAcceptSession circleDelegate](self, "circleDelegate");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = 0LL;
  [v5 circleGetInitialSyncViews:4 error:&v18];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v18;

  if (v6)
  {
    -[KCJoiningAcceptSession session](self, "session");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = v7;
    [v8 encrypt:v6 error:&v17];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v17;

    if (v9)
    {
      self->_state = 3;
      secLogObjForScope("joining");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_187D59000, v11, OS_LOG_TYPE_DEFAULT, "TLKRequest done.", buf, 2u);
      }

      +[KCJoiningMessage messageWithType:data:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:error:",  6LL,  v9,  a3);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 der];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      secLogObjForScope("joining");
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_187D59000, v15, OS_LOG_TYPE_DEFAULT, "TLK request failed to encrypt: %@", buf, 0xCu);
      }

      int v13 = 0LL;
      if (a3 && v10)
      {
        int v13 = 0LL;
        *a3 = v10;
      }
    }
  }

  else
  {
    secLogObjForScope("joining");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_187D59000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get initial sync view: %@", buf, 0xCu);
    }

    int v13 = 0LL;
    if (a3 && v7)
    {
      id v10 = v7;
      int v13 = 0LL;
      *a3 = v10;
    }

    else
    {
      id v10 = v7;
    }
  }

  return v13;
}

- (BOOL)shouldProcessSOSApplication:(id)a3 pairingMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    secLogObjForScope("joining");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      uint64_t v11 = "platform does not support SOS";
      id v12 = (uint8_t *)&v17;
      goto LABEL_12;
    }

- (id)processApplication:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if ([v6 type] == 6)
  {
    -[KCJoiningAcceptSession createTLKRequestResponse:](self, "createTLKRequestResponse:", a4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }

  if ([v6 type] != 4)
  {
    KCJoiningErrorCreate(6LL, a4, @"Expected peerInfo!", v8, v9, v10, v11, v12, v48);
LABEL_16:
    id v7 = 0LL;
    goto LABEL_44;
  }

  if (-[KCJoiningAcceptSession piggy_version](self, "piggy_version") == 2)
  {
    *(void *)&__int128 v62 = 0LL;
    *((void *)&v62 + 1) = &v62;
    uint64_t v63 = 0x3032000000LL;
    v64 = __Block_byref_object_copy__870;
    v65 = __Block_byref_object_dispose__871;
    id v66 = 0LL;
    uint64_t v54 = 0LL;
    v55 = &v54;
    uint64_t v56 = 0x3032000000LL;
    v57 = __Block_byref_object_copy__870;
    v58 = __Block_byref_object_dispose__871;
    id v59 = 0LL;
    -[KCJoiningAcceptSession createPairingMessageFromJoiningMessage:error:]( self,  "createPairingMessageFromJoiningMessage:error:",  v6,  a4);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ([v13 hasPrepare])
      {
        [v14 prepare];
        id v52 = (void *)objc_claimAutoreleasedReturnValue();
        __int16 v15 = @"full";
        -[KCJoiningAcceptSession otControl](self, "otControl");
        id v51 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
        v49 = -[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration");
        [v52 peerID];
        char v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v52 permanentInfo];
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v52 permanentInfoSig];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v52 stableInfo];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v52 stableInfoSig];
        id v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v21 = v14;
        id v53 = v21;
        objc_msgSend( v51,  "rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:",  v50,  v49,  v16,  v17,  v18,  v19);

        if (*(void *)(*((void *)&v62 + 1) + 40LL))
        {
          if (-[KCJoiningAcceptSession shouldProcessSOSApplication:pairingMessage:]( self,  "shouldProcessSOSApplication:pairingMessage:",  v6,  v21))
          {
            secLogObjForScope("joining");
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl(&dword_187D59000, v22, OS_LOG_TYPE_DEFAULT, "doing SOS processSOSApplication", buf, 2u);
            }

            [v6 secondData];
            id v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[KCJoiningAcceptSession processSOSApplication:error:](self, "processSOSApplication:error:", v23, a4);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
            {
              secLogObjForScope("SecError");
              uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                if (a4) {
                  id v26 = *a4;
                }
                else {
                  id v26 = 0LL;
                }
                *(_DWORD *)__int128 buf = 138412290;
                id v61 = v26;
                _os_log_impl( &dword_187D59000,  v25,  OS_LOG_TYPE_DEFAULT,  "joining: failed to process SOS application: %@",  buf,  0xCu);
              }

              KCJoiningErrorCreate( 9LL,  a4,  @"message failed to process application",  v42,  v43,  v44,  v45,  v46,  (uint64_t)v20);
              goto LABEL_41;
            }
          }

          else
          {
            uint64_t v24 = 0LL;
          }

          self->_state = 3;
          +[KCJoiningMessage messageWithType:data:payload:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:payload:error:",  5LL,  *(void *)(*((void *)&v62 + 1) + 40LL),  v24,  a4);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          [v41 der];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          if (!a4 || (uint64_t v40 = (void *)v55[5]) == 0LL)
          {
LABEL_41:
            id v7 = 0LL;
            goto LABEL_42;
          }

          id v7 = 0LL;
          *a4 = v40;
        }

- (id)processMessage:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope("acceptor");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[KCJoiningAcceptSession description](self, "description");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)id v18 = 138412290;
    *(void *)&v18[4] = v8;
    _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "processMessages: %@", v18, 0xCu);
  }

  if (-[KCJoiningAcceptSession state](self, "state"))
  {
    +[KCJoiningMessage messageWithDER:error:](&OBJC_CLASS___KCJoiningMessage, "messageWithDER:error:", v6, a4);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  switch(-[KCJoiningAcceptSession state](self, "state"))
  {
    case 0:
      uint64_t v15 = -[KCJoiningAcceptSession processInitialMessage:error:](self, "processInitialMessage:error:", v6, a4);
      goto LABEL_12;
    case 1:
      if (!v9) {
        goto LABEL_14;
      }
      uint64_t v15 = -[KCJoiningAcceptSession processResponse:error:](self, "processResponse:error:", v9, a4);
      goto LABEL_12;
    case 2:
      if (!v9) {
        goto LABEL_14;
      }
      uint64_t v15 = -[KCJoiningAcceptSession processApplication:error:](self, "processApplication:error:", v9, a4);
LABEL_12:
      char v16 = (void *)v15;
      break;
    case 3:
      KCJoiningErrorCreate(6LL, a4, @"Unexpected message while done", v10, v11, v12, v13, v14, *(uint64_t *)v18);
      goto LABEL_14;
    default:
LABEL_14:
      char v16 = 0LL;
      break;
  }

  return v16;
}

- (BOOL)isDone
{
  return -[KCJoiningAcceptSession state](self, "state") == 3;
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (KCJoiningAcceptSecretDelegate)secretDelegate
{
  return (KCJoiningAcceptSecretDelegate *)objc_loadWeakRetained((id *)&self->_secretDelegate);
}

- (void)setSecretDelegate:(id)a3
{
}

- (KCJoiningAcceptCircleDelegate)circleDelegate
{
  return (KCJoiningAcceptCircleDelegate *)objc_loadWeakRetained((id *)&self->_circleDelegate);
}

- (void)setCircleDelegate:(id)a3
{
}

- (KCSRPServerContext)context
{
  return (KCSRPServerContext *)objc_getProperty(self, a2, 40LL, 1);
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 48LL, 1);
}

- (int)state
{
  return self->_state;
}

- (NSData)startMessage
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setStartMessage:(id)a3
{
}

- (NSString)piggy_uuid
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPiggy_uuid:(id)a3
{
}

- (int)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_version:(int)a3
{
  self->_piggy_version = a3;
}

- (NSData)octagon
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setOctagon:(id)a3
{
}

- (OTJoiningConfiguration)joiningConfiguration
{
  return self->_joiningConfiguration;
}

- (void)setJoiningConfiguration:(id)a3
{
}

- (OTControlArguments)controlArguments
{
  return self->_controlArguments;
}

- (void)setControlArguments:(id)a3
{
}

- (OTControl)otControl
{
  return self->_otControl;
}

- (void)setOtControl:(id)a3
{
}

- (NSMutableDictionary)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

void __51__KCJoiningAcceptSession_processApplication_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    secLogObjForScope("SecError");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v9;
      _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "error producing octagon voucher: %@",  (uint8_t *)&v23,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a4);
  }

  else
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___OTPairingMessage);
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v11, "setSupportsSOS:", v12);

    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v11, "setSupportsOctagon:", v13);

    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___OTSponsorToApplicantRound2M2);
    -[OTPairingMessage setVoucher:](v11, "setVoucher:", v14);

    -[OTPairingMessage voucher](v11, "voucher");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setVoucher:v7];

    -[OTPairingMessage voucher](v11, "voucher");
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setVoucherSignature:v8];

    else {
      uint64_t v17 = 2LL;
    }
    [*(id *)(a1 + 32) supportsSOS];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setSupported:v17];

    [*(id *)(a1 + 32) supportsOctagon];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setSupported:1];

    uint64_t v20 = -[PBCodable data](v11, "data");
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

void __54__KCJoiningAcceptSession_processInitialMessage_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl( &dword_187D59000,  v7,  OS_LOG_TYPE_DEFAULT,  "error retrieving next message! :%@",  (uint8_t *)&v19,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___OTPairingMessage);
    id v9 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v8, "setSupportsSOS:", v9);

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v8, "setSupportsOctagon:", v10);

    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___OTSponsorToApplicantRound1M2);
    -[OTPairingMessage setEpoch:](v8, "setEpoch:", v11);

    -[OTPairingMessage epoch](v8, "epoch");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setEpoch:a2];

    else {
      uint64_t v13 = 2LL;
    }
    -[OTPairingMessage supportsSOS](v8, "supportsSOS");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setSupported:v13];

    -[OTPairingMessage supportsOctagon](v8, "supportsOctagon");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setSupported:1];

    uint64_t v16 = -[PBCodable data](v8, "data");
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

void __53__KCJoiningAcceptSession_shouldAcceptOctagonRequests__block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4,  int a5,  void *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  secLogObjForScope("SecError");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67110146;
    v15[1] = a2;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v12;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl( &dword_187D59000,  v14,  OS_LOG_TYPE_DEFAULT,  "octagon haveSelfEgo: status %d: %@ %@ %d: %@",  (uint8_t *)v15,  0x2Cu);
  }

  if (!a2) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
}

+ (id)sessionWithInitialMessage:(id)a3 secretDelegate:(id)a4 circleDelegate:(id)a5 dsid:(unint64_t)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = ccrng();
  if (v12)
  {
    __int16 v18 = -[KCJoiningAcceptSession initWithSecretDelegate:circleDelegate:dsid:rng:error:]( objc_alloc(&OBJC_CLASS___KCJoiningAcceptSession),  "initWithSecretDelegate:circleDelegate:dsid:rng:error:",  v10,  v11,  a6,  v12,  a7);
  }

  else
  {
    CoreCryptoError(0LL, a7, @"RNG fetch failed", v13, v14, v15, v16, v17, v20);
    __int16 v18 = 0LL;
  }

  return v18;
}

@end