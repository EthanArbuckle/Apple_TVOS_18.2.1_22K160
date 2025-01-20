@interface KCJoiningRequestCircleSession
+ (id)sessionWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5;
- (BOOL)isDone;
- (BOOL)shouldJoinSOS:(id)a3 pairingMessage:(id)a4;
- (KCAESGCMDuplexSession)session;
- (KCJoiningRequestCircleDelegate)circleDelegate;
- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5;
- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 otcontrol:(id)a5 error:(id *)a6;
- (OTControl)otControl;
- (OTControlArguments)controlArguments;
- (OTJoiningConfiguration)joiningConfiguration;
- (id)encryptPeerInfo:(id *)a3;
- (id)encryptedInitialMessage:(id)a3 error:(id *)a4;
- (id)encryptedPeerInfo:(id *)a3;
- (id)handleCircleBlob:(id)a3 error:(id *)a4;
- (id)initialMessage:(id *)a3;
- (id)processMessage:(id)a3 error:(id *)a4;
- (int)state;
- (unint64_t)piggy_version;
- (void)setContextIDForSession:(id)a3;
- (void)setControlArguments:(id)a3;
- (void)setJoiningConfiguration:(id)a3;
- (void)setOtControl:(id)a3;
- (void)setPiggy_version:(unint64_t)a3;
- (void)setState:(int)a3;
- (void)waitForOctagonUpgrade;
@end

@implementation KCJoiningRequestCircleSession

- (void)setContextIDForSession:(id)a3
{
  v4 = (objc_class *)MEMORY[0x18960AFA0];
  id v5 = a3;
  id v6 = objc_alloc(v4);
  -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 containerName];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
  [v8 altDSID];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[v6 initWithContainerName:v7 contextID:v5 altDSID:v9];

  -[KCJoiningRequestCircleSession setControlArguments:](self, "setControlArguments:", v10);
}

- (id)encryptedPeerInfo:(id *)a3
{
  if (!self->_session)
  {
    KCJoiningErrorCreate(7LL, a3, @"Attempt to encrypt with no session", v3, v4, v5, v6, v7, v15);
    return 0LL;
  }
  v10 = -[KCJoiningRequestCircleSession circleDelegate](self, "circleDelegate");
  id v11 = (const void *)[v10 copyPeerInfoError:a3];

  if (!v11) {
    return 0LL;
  }
  v12 = (void *)SOSPeerInfoCopyEncodedData();
  CFRelease(v11);
  if (v12)
  {
    v13 = -[KCAESGCMDuplexSession encrypt:error:](self->_session, "encrypt:error:", v12, a3);
  }

  else
  {
    v13 = 0LL;
    if (a3) {
      *a3 = 0LL;
    }
  }

  return v13;
}

- (id)encryptedInitialMessage:(id)a3 error:(id *)a4
{
  id v11 = a3;
  if (self->_session)
  {
    v12 = objc_alloc_init(&OBJC_CLASS___KCInitialMessageData);
    -[KCInitialMessageData setPrepareMessage:](v12, "setPrepareMessage:", v11);
    session = self->_session;
    v14 = -[PBCodable data](v12, "data");
    -[KCAESGCMDuplexSession encrypt:error:](session, "encrypt:error:", v14, a4);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    KCJoiningErrorCreate(7LL, a4, @"Attempt to encrypt with no session", v6, v7, v8, v9, v10, v17);
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (id)encryptPeerInfo:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  secLogObjForScope("joining");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v5, OS_LOG_TYPE_DEFAULT, "doing SOS encryptedPeerInfo", buf, 2u);
  }

  id v18 = 0LL;
  -[KCJoiningRequestCircleSession encryptedPeerInfo:](self, "encryptedPeerInfo:", &v18);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v18;
  uint64_t v8 = v7;
  if (!v6 || v7)
  {
    secLogObjForScope("SecError");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "joining: failed to create encrypted peerInfo: %@",  buf,  0xCu);
    }

    if (v8)
    {
      if (a3)
      {
        id v9 = 0LL;
        *a3 = v8;
        goto LABEL_13;
      }
    }

    else
    {
      KCJoiningErrorCreate(13LL, a3, @"failed to encrypt the SOS peer info", v11, v12, v13, v14, v15, v17);
    }

    id v9 = 0LL;
    goto LABEL_13;
  }

  id v9 = v6;
LABEL_13:

  return v9;
}

- (id)initialMessage:(id *)a3
{
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187D59000,  v5,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestCircleSession initialMessage called",  buf,  2u);
  }

  if (-[KCJoiningRequestCircleSession piggy_version](self, "piggy_version") == 2)
  {
    *(void *)buf = 0LL;
    v41 = buf;
    uint64_t v42 = 0x3032000000LL;
    v43 = __Block_byref_object_copy__388;
    v44 = __Block_byref_object_dispose__389;
    id v45 = 0LL;
    uint64_t v34 = 0LL;
    v35 = &v34;
    uint64_t v36 = 0x3032000000LL;
    v37 = __Block_byref_object_copy__388;
    v38 = __Block_byref_object_dispose__389;
    id v39 = 0LL;
    -[KCJoiningRequestCircleSession joiningConfiguration](self, "joiningConfiguration");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 epoch];

    if (!v7)
    {
      secLogObjForScope("SecError");
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl( &dword_187D59000,  v22,  OS_LOG_TYPE_DEFAULT,  "joining: expected acceptor epoch! returning nil.",  v33,  2u);
      }

      KCJoiningErrorCreate(11LL, a3, @"expected acceptor epoch", v23, v24, v25, v26, v27, v32[0]);
      goto LABEL_17;
    }

    -[KCJoiningRequestCircleSession otControl](self, "otControl");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCJoiningRequestCircleSession joiningConfiguration](self, "joiningConfiguration");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = (uint64_t)__48__KCJoiningRequestCircleSession_initialMessage___block_invoke;
    v32[3] = (uint64_t)&unk_18A134E08;
    v32[4] = (uint64_t)&v34;
    v32[5] = (uint64_t)buf;
    [v8 rpcPrepareIdentityAsApplicantWithArguments:v9 configuration:v10 reply:v32];

    uint64_t v11 = (void *)v35[5];
    if (v11)
    {
      if (a3)
      {
        uint64_t v12 = 0LL;
        *a3 = v11;
LABEL_27:
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(buf, 8);
        return v12;
      }

- (void)waitForOctagonUpgrade
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 waitForOctagonUpgrade:v3 reply:&__block_literal_global_415];
}

- (BOOL)shouldJoinSOS:(id)a3 pairingMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    secLogObjForScope("joining");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      uint64_t v11 = "platform does not support SOS";
      uint64_t v12 = (uint8_t *)&v17;
      goto LABEL_12;
    }

- (id)handleCircleBlob:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope("joining");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187D59000,  v7,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestCircleSession handleCircleBlob called",  buf,  2u);
  }

  if ([v6 type] == 5)
  {
    if (-[KCJoiningRequestCircleSession piggy_version](self, "piggy_version") == 2)
    {
      [v6 firstData];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = v13 == 0LL;

      if (!v14)
      {
        *(void *)buf = 0LL;
        v64 = buf;
        uint64_t v65 = 0x3032000000LL;
        v66 = __Block_byref_object_copy__388;
        v67 = __Block_byref_object_dispose__389;
        id v68 = 0LL;
        __int16 v15 = objc_alloc(&OBJC_CLASS___OTPairingMessage);
        [v6 firstData];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        __int16 v17 = -[PBCodable initWithData:](v15, "initWithData:", v16);

        if (!-[OTPairingMessage hasVoucher](v17, "hasVoucher"))
        {
          secLogObjForScope("SecError");
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v69 = 0;
            _os_log_impl( &dword_187D59000,  v38,  OS_LOG_TYPE_DEFAULT,  "octagon: expected voucher! returning from piggybacking.",  v69,  2u);
          }

          KCJoiningErrorCreate(15LL, a4, @"Missing voucher from acceptor", v39, v40, v41, v42, v43, v61);
          v30 = 0LL;
          goto LABEL_50;
        }

        -[OTPairingMessage voucher](v17, "voucher");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestCircleSession otControl](self, "otControl");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestCircleSession controlArguments](self, "controlArguments");
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCJoiningRequestCircleSession joiningConfiguration](self, "joiningConfiguration");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 voucher];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 voucherSignature];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1895F87A8];
        v62[1] = 3221225472LL;
        v62[2] = __56__KCJoiningRequestCircleSession_handleCircleBlob_error___block_invoke;
        v62[3] = &unk_18A134E70;
        v62[4] = buf;
        [v19 rpcJoinWithArguments:v20 configuration:v21 vouchData:v22 vouchSig:v23 reply:v62];

        if (!-[KCJoiningRequestCircleSession shouldJoinSOS:pairingMessage:]( self,  "shouldJoinSOS:pairingMessage:",  v6,  v17)) {
          goto LABEL_13;
        }
        secLogObjForScope("joining");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_187D59000, v24, OS_LOG_TYPE_DEFAULT, "doing SOS processCircleJoinData", v69, 2u);
        }

        -[KCJoiningRequestCircleSession session](self, "session");
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 secondData];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 decryptAndVerify:v26 error:a4];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = -[KCJoiningRequestCircleSession circleDelegate](self, "circleDelegate");
          char v29 = [v28 processCircleJoinData:v27 version:1 error:a4];

          if ((v29 & 1) != 0)
          {

LABEL_13:
            self->_state = 1;
            [MEMORY[0x189603F48] data];
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            self->_state = 1;
LABEL_49:

LABEL_50:
            _Block_object_dispose(buf, 8);

            goto LABEL_51;
          }

          secLogObjForScope("SecError");
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            if (a4) {
              id v58 = *a4;
            }
            else {
              id v58 = 0LL;
            }
            *(_DWORD *)v69 = 138412290;
            id v70 = v58;
            v59 = "joining: processCircleJoinData failed %@";
LABEL_47:
            _os_log_impl(&dword_187D59000, v56, OS_LOG_TYPE_DEFAULT, v59, v69, 0xCu);
          }
        }

        else
        {
          secLogObjForScope("joining");
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            if (a4) {
              id v57 = *a4;
            }
            else {
              id v57 = 0LL;
            }
            *(_DWORD *)v69 = 138412290;
            id v70 = v57;
            v59 = "decryptAndVerify failed: %@";
            goto LABEL_47;
          }
        }

        v30 = 0LL;
        goto LABEL_49;
      }
    }

    if (!SOSCCIsSOSTrustAndSyncingEnabled())
    {
      secLogObjForScope("joining");
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_187D59000, v33, OS_LOG_TYPE_DEFAULT, "SOS not enabled for this platform", buf, 2u);
      }

      goto LABEL_26;
    }
    v31 = -[KCJoiningRequestCircleSession session](self, "session");
    [v6 firstData];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 decryptAndVerify:v32 error:a4];
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      -[KCJoiningRequestCircleSession circleDelegate](self, "circleDelegate");
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      char v35 = [v34 processCircleJoinData:v33 version:1 error:a4];

      if ((v35 & 1) != 0)
      {
        secLogObjForScope("joining");
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_187D59000, v36, OS_LOG_TYPE_DEFAULT, "joined the SOS circle!", buf, 2u);
        }

        secLogObjForScope("joining");
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_187D59000, v37, OS_LOG_TYPE_DEFAULT, "kicking off SOS Upgrade into Octagon!", buf, 2u);
        }

        -[KCJoiningRequestCircleSession waitForOctagonUpgrade](self, "waitForOctagonUpgrade");
LABEL_26:

        self->_state = 1;
        [MEMORY[0x189603F48] data];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }

      secLogObjForScope("SecError");
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_187D59000, v50, OS_LOG_TYPE_DEFAULT, "joining: failed to process SOS circle", buf, 2u);
      }

      KCJoiningErrorCreate(18LL, a4, @"Failed to process circleBlob", v51, v52, v53, v54, v55, v61);
    }

    else
    {
      secLogObjForScope("SecError");
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_187D59000, v44, OS_LOG_TYPE_DEFAULT, "joining: circleBlob is nil", buf, 2u);
      }

      KCJoiningErrorCreate(17LL, a4, @"Failed to decrypt circleBlob", v45, v46, v47, v48, v49, v61);
    }
  }

  else
  {
    KCJoiningErrorCreate(6LL, a4, @"Expected CircleBlob!", v8, v9, v10, v11, v12, v61);
  }

  v30 = 0LL;
LABEL_51:

  return v30;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  secLogObjForScope("joining");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl( &dword_187D59000,  v7,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestCircleSession processMessage called",  (uint8_t *)&v17,  2u);
  }

  +[KCJoiningMessage messageWithDER:error:](&OBJC_CLASS___KCJoiningMessage, "messageWithDER:error:", v6, a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    goto LABEL_8;
  }
  int v9 = -[KCJoiningRequestCircleSession state](self, "state");
  if (v9 == 1)
  {
    KCJoiningErrorCreate(6LL, a4, @"Done, no messages expected.", v10, v11, v12, v13, v14, v17);
    goto LABEL_8;
  }

  if (v9)
  {
LABEL_8:
    __int16 v15 = 0LL;
    goto LABEL_9;
  }

  -[KCJoiningRequestCircleSession handleCircleBlob:error:](self, "handleCircleBlob:error:", v8, a4);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v15;
}

- (BOOL)isDone
{
  return 1;
}

- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)MEMORY[0x18960AF98];
  id v9 = a4;
  id v10 = a3;
  [v8 controlObject:1 error:a5];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[KCJoiningRequestCircleSession initWithCircleDelegate:session:otcontrol:error:]( self,  "initWithCircleDelegate:session:otcontrol:error:",  v10,  v9,  v11,  a5);

  return v12;
}

- (KCJoiningRequestCircleSession)initWithCircleDelegate:(id)a3 session:(id)a4 otcontrol:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  secLogObjForScope("joining");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v11 pairingUUID];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestCircleSession initWithCircleDelegate called, uuid=%@",  buf,  0xCu);
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___KCJoiningRequestCircleSession;
  __int16 v15 = -[KCJoiningRequestCircleSession init](&v26, sel_init);
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_circleDelegate, a3);
    objc_storeStrong((id *)&v16->_session, a4);
    -[KCJoiningRequestCircleSession setState:](v16, "setState:", 0LL);
    objc_storeStrong((id *)&v16->_otControl, a5);
    id v17 = objc_alloc(MEMORY[0x18960AFA8]);
    [v11 pairingUUID];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend( v17,  "initWithProtocolType:uniqueDeviceID:uniqueClientID:pairingUUID:epoch:isInitiator:",  @"OctagonPiggybacking",  @"requester-id",  @"requester-id",  v18,  objc_msgSend(v11, "epoch"),  1);
    joiningConfiguration = v16->_joiningConfiguration;
    v16->_joiningConfiguration = (OTJoiningConfiguration *)v19;

    id v21 = objc_alloc(MEMORY[0x18960AFA0]);
    [v11 altDSID];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v21 initWithAltDSID:v22];
    controlArguments = v16->_controlArguments;
    v16->_controlArguments = (OTControlArguments *)v23;

    v16->_piggy_version = [v11 piggybackingVersion];
  }

  return v16;
}

- (KCJoiningRequestCircleDelegate)circleDelegate
{
  return (KCJoiningRequestCircleDelegate *)objc_getProperty(self, a2, 16LL, 1);
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 24LL, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (unint64_t)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_version:(unint64_t)a3
{
  self->_piggy_version = a3;
}

- (OTControl)otControl
{
  return self->_otControl;
}

- (void)setOtControl:(id)a3
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

- (void).cxx_destruct
{
}

void __56__KCJoiningRequestCircleSession_handleCircleBlob_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( &dword_187D59000,  v4,  OS_LOG_TYPE_DEFAULT,  "octagon: error joining octagon: %@",  (uint8_t *)&v8,  0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = v3;
    uint64_t v7 = *(os_log_s **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }

  else
  {
    secLogObjForScope("octagon");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "successfully joined octagon", (uint8_t *)&v8, 2u);
    }
  }
}

void __54__KCJoiningRequestCircleSession_waitForOctagonUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  if (v2)
  {
    secLogObjForScope("SecError");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl( &dword_187D59000,  v3,  OS_LOG_TYPE_DEFAULT,  "pairing: failed to upgrade initiator into Octagon: %@",  (uint8_t *)&v4,  0xCu);
    }
  }
}

void __48__KCJoiningRequestCircleSession_initialMessage___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5,  void *a6,  void *a7)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v18)
  {
    secLogObjForScope("SecError");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v18;
      _os_log_impl(&dword_187D59000, v19, OS_LOG_TYPE_DEFAULT, "octagon: error preparing identity: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a7);
  }

  else
  {
    uint64_t v20 = objc_alloc_init(&OBJC_CLASS___OTPairingMessage);
    id v21 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v20, "setSupportsSOS:", v21);

    v22 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v20, "setSupportsOctagon:", v22);

    uint64_t v23 = objc_alloc_init(&OBJC_CLASS___OTApplicantToSponsorRound2M1);
    -[OTApplicantToSponsorRound2M1 setPeerID:](v23, "setPeerID:", v13);
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](v23, "setPermanentInfo:", v14);
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](v23, "setPermanentInfoSig:", v15);
    -[OTApplicantToSponsorRound2M1 setStableInfo:](v23, "setStableInfo:", v16);
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](v23, "setStableInfoSig:", v17);
    -[OTPairingMessage setPrepare:](v20, "setPrepare:", v23);
    else {
      uint64_t v24 = 2LL;
    }
    -[OTPairingMessage supportsSOS](v20, "supportsSOS");
    id v36 = v17;
    id v25 = v16;
    id v26 = v15;
    id v27 = v14;
    id v28 = v13;
    uint64_t v29 = a1;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 setSupported:v24];
    v31 = -[OTPairingMessage supportsOctagon](v20, "supportsOctagon");
    [v31 setSupported:1];

    uint64_t v32 = -[PBCodable data](v20, "data");
    uint64_t v33 = *(void *)(v29 + 40);
    id v13 = v28;
    id v14 = v27;
    id v15 = v26;
    id v16 = v25;
    id v17 = v36;
    uint64_t v34 = *(void *)(v33 + 8);
    char v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v32;
  }
}

+ (id)sessionWithCircleDelegate:(id)a3 session:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[KCJoiningRequestCircleSession initWithCircleDelegate:session:error:]( objc_alloc(&OBJC_CLASS___KCJoiningRequestCircleSession),  "initWithCircleDelegate:session:error:",  v8,  v7,  a5);

  return v9;
}

@end