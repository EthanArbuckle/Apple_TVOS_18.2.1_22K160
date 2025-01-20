@interface KCJoiningRequestSecretSession
+ (id)sessionWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5;
- (BOOL)isDone;
- (BOOL)setupSession:(id *)a3;
- (KCAESGCMDuplexSession)session;
- (KCJoiningRequestSecretDelegate)secretDelegate;
- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5;
- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 rng:(ccrng_state *)a5 error:(id *)a6;
- (KCSRPClientContext)context;
- (NSData)challenge;
- (NSData)salt;
- (NSMutableDictionary)defaults;
- (NSString)altDSID;
- (NSString)piggy_uuid;
- (NSString)sessionUUID;
- (id)copyResponseForChallenge:(id)a3 salt:(id)a4 secret:(id)a5 error:(id *)a6;
- (id)copyResponseForSecret:(id)a3 error:(id *)a4;
- (id)createUUID;
- (id)description;
- (id)handleChallenge:(id)a3 error:(id *)a4;
- (id)handleChallenge:(id)a3 secret:(id)a4 error:(id *)a5;
- (id)handleChallengeData:(id)a3 secret:(id)a4 error:(id *)a5;
- (id)handleVerification:(id)a3 error:(id *)a4;
- (id)initialMessage:(id *)a3;
- (id)processMessage:(id)a3 error:(id *)a4;
- (id)stateString;
- (int)state;
- (unint64_t)dsid;
- (unint64_t)epoch;
- (unint64_t)piggy_version;
- (void)setAltDSID:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setPiggy_uuid:(id)a3;
- (void)setPiggy_version:(unint64_t)a3;
- (void)setSalt:(id)a3;
- (void)setSecretDelegate:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation KCJoiningRequestSecretSession

- (id)createUUID
{
  v7[2] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189607AB8] UUID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  [v3 UUIDString];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession setPiggy_uuid:](self, "setPiggy_uuid:", v4);

  [v3 getUUIDBytes:v7];
  [MEMORY[0x189603F48] dataWithBytes:v7 length:16];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initialMessage:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = -[KCSRPClientContext copyStart:](self->_context, "copyStart:");
  if (v5)
  {
    secLogObjForScope("joining");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( &dword_187D59000,  v6,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestSecretSession initialMessage called",  (uint8_t *)&v17,  2u);
    }

    if (-[KCJoiningRequestSecretSession piggy_version](self, "piggy_version") == 2)
    {
      v7 = -[KCJoiningRequestSecretSession createUUID](self, "createUUID");
      [@"o" dataUsingEncoding:134217984];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", sizeof_initialmessage_version2(v5, 1, v7, v8));
      [v9 mutableBytes];
      id v10 = v9;
      [v10 mutableBytes];
      [v10 length];
      if (encode_initialmessage_version2(v5, v7, v8))
      {

LABEL_10:
LABEL_12:
        id v11 = v10;
        id v10 = v11;
LABEL_18:

        goto LABEL_19;
      }

      secLogObjForScope("SecError");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( &dword_187D59000,  v14,  OS_LOG_TYPE_DEFAULT,  "failed to create version 2 message",  (uint8_t *)&v17,  2u);
      }
    }

    else
    {
      if (-[KCJoiningRequestSecretSession piggy_version](self, "piggy_version") != 1)
      {
        id v13 = [MEMORY[0x189603FB8] dataWithLength:sizeof_initialmessage(v5)];
        [v13 mutableBytes];
        id v10 = v13;
        [v10 mutableBytes];
        [v10 length];
        if (encode_initialmessage(v5)) {
          goto LABEL_12;
        }
LABEL_17:
        id v11 = 0LL;
        goto LABEL_18;
      }
      v7 = -[KCJoiningRequestSecretSession createUUID](self, "createUUID");
      id v12 = objc_msgSend(MEMORY[0x189603FB8], "dataWithLength:", sizeof_initialmessage_version1(v5, 1, v7));
      [v12 mutableBytes];
      id v10 = v12;
      [v10 mutableBytes];
      [v10 length];
      if (encode_initialmessage_version1(v5, v7)) {
        goto LABEL_10;
      }
      secLogObjForScope("SecError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *a3;
        int v17 = 138412290;
        id v18 = v16;
        _os_log_impl( &dword_187D59000,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "failed to create version 1 message: %@",  (uint8_t *)&v17,  0xCu);
      }
    }

    goto LABEL_17;
  }

  id v11 = 0LL;
LABEL_19:

  return v11;
}

- (BOOL)isDone
{
  return self->_state == 2;
}

- (BOOL)setupSession:(id *)a3
{
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[KCAESGCMDuplexSession sessionAsSender:context:]( &OBJC_CLASS___KCAESGCMDuplexSession,  "sessionAsSender:context:",  v10,  -[KCJoiningRequestSecretSession dsid](self, "dsid"));
    id v11 = (KCAESGCMDuplexSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v11;

    -[KCJoiningRequestSecretSession sessionUUID](self, "sessionUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[KCJoiningRequestSecretSession session](self, "session");
    [v14 setPairingUUID:v13];
    v15 = -[KCJoiningRequestSecretSession altDSID](self, "altDSID");
    -[KCJoiningRequestSecretSession session](self, "session");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setAltDSID:v15];

    unint64_t v17 = -[KCJoiningRequestSecretSession piggy_version](self, "piggy_version");
    -[KCJoiningRequestSecretSession session](self, "session");
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setPiggybackingVersion:v17];

    -[KCJoiningRequestSecretSession session](self, "session");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v20 = v19 != 0LL;
  }

  else
  {
    KCJoiningErrorCreate(7LL, a3, @"No session key available", v5, v6, v7, v8, v9, v22);
    BOOL v20 = 0;
  }

  return v20;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  id v5 = a3;
  -[KCJoiningRequestSecretSession session](self, "session");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setAltDSID:v5];
}

- (id)copyResponseForChallenge:(id)a3 salt:(id)a4 secret:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  secLogObjForScope("joining");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestSecretSession copyResponseForChallenge called",  v18,  2u);
  }

  id v14 = -[KCSRPClientContext copyResposeToChallenge:password:salt:error:]( self->_context,  "copyResposeToChallenge:password:salt:error:",  v10,  v12,  v11,  a6);
  if (v14 && -[KCJoiningRequestSecretSession setupSession:](self, "setupSession:", a6))
  {
    -[KCJoiningRequestSecretSession setChallenge:](self, "setChallenge:", v10);
    -[KCJoiningRequestSecretSession setSalt:](self, "setSalt:", v11);
    self->_state = 1;
    v15 = +[KCJoiningMessage messageWithType:data:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:error:",  2LL,  v14,  a6);
    [v15 der];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (id)copyResponseForSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[KCJoiningRequestSecretSession challenge](self, "challenge");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession salt](self, "salt");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[KCJoiningRequestSecretSession copyResponseForChallenge:salt:secret:error:]( self,  "copyResponseForChallenge:salt:secret:error:",  v7,  v8,  v6,  a4);

  return v9;
}

- (id)handleChallengeData:(id)a3 secret:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  secLogObjForScope("joining");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestSecretSession handleChallengeData called",  buf,  2u);
  }

  id v16 = 0LL;
  id v17 = 0LL;
  int v11 = [v9 decodeSequenceData:&v17 data:&v16 error:a5];

  id v12 = v17;
  id v13 = v16;
  id v14 = 0LL;
  if (v11) {
    id v14 = -[KCJoiningRequestSecretSession copyResponseForChallenge:salt:secret:error:]( self,  "copyResponseForChallenge:salt:secret:error:",  v13,  v12,  v8,  a5);
  }

  return v14;
}

- (id)handleChallenge:(id)a3 secret:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  secLogObjForScope("joining");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestSecretSession handleChallenge called",  v33,  2u);
  }

  if ([v8 type] == 1)
  {
    [v8 secondData];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16) {
      uint64_t v17 = 2LL;
    }
    else {
      uint64_t v17 = 1LL;
    }
    -[KCJoiningRequestSecretSession setPiggy_version:](self, "setPiggy_version:", v17);

    unint64_t v18 = -[KCJoiningRequestSecretSession piggy_version](self, "piggy_version");
    -[KCJoiningRequestSecretSession session](self, "session");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setPiggybackingVersion:v18];

    -[KCJoiningRequestSecretSession altDSID](self, "altDSID");
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[KCJoiningRequestSecretSession session](self, "session");
    [v21 setAltDSID:v20];

    if (-[KCJoiningRequestSecretSession piggy_version](self, "piggy_version") == 2)
    {
      uint64_t v22 = objc_alloc(&OBJC_CLASS___OTPairingMessage);
      [v8 secondData];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PBCodable initWithData:](v22, "initWithData:", v23);

      if (-[OTPairingMessage hasEpoch](v24, "hasEpoch"))
      {
        secLogObjForScope("octagon");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = -[OTPairingMessage epoch](v24, "epoch");
          [v26 dictionaryRepresentation];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v33 = 138412290;
          *(void *)&v33[4] = v27;
          _os_log_impl(&dword_187D59000, v25, OS_LOG_TYPE_DEFAULT, "received epoch message: %@", v33, 0xCu);
        }
        v28 = -[OTPairingMessage epoch](v24, "epoch");
        -[KCJoiningRequestSecretSession setEpoch:](self, "setEpoch:", [v28 epoch]);
      }

      else
      {
        secLogObjForScope("SecError");
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl( &dword_187D59000,  v30,  OS_LOG_TYPE_DEFAULT,  "octagon: acceptor did not send its epoch. discontinuing octagon protocol. downgrading to verison 1",  v33,  2u);
        }

        -[KCJoiningRequestSecretSession setPiggy_version:](self, "setPiggy_version:", 1LL);
      }
    }

    [v8 firstData];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[KCJoiningRequestSecretSession handleChallengeData:secret:error:]( self,  "handleChallengeData:secret:error:",  v31,  v9,  a5);
  }

  else
  {
    KCJoiningErrorCreate(6LL, a5, @"Expected challenge!", v11, v12, v13, v14, v15, *(uint64_t *)v33);
    v29 = 0LL;
  }

  return v29;
}

- (id)handleChallenge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[KCJoiningRequestSecretSession secretDelegate](self, "secretDelegate");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 secret];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession handleChallenge:secret:error:](self, "handleChallenge:secret:error:", v6, v8, a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleVerification:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope("joining");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187D59000,  v7,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestSecretSession handleVerification called",  buf,  2u);
  }

  -[KCJoiningRequestSecretSession secretDelegate](self, "secretDelegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 type])
  {
    if ([v6 type] == 3)
    {
      -[KCJoiningRequestSecretSession context](self, "context");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 firstData];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      char v16 = [v14 verifyConfirmation:v15 error:a4];

      if ((v16 & 1) != 0)
      {
        -[KCJoiningRequestSecretSession session](self, "session");
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 secondData];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 decryptAndVerify:v23 error:a4];
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          [NSString decodeFromDER:v24 error:a4];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 && ([v8 processAccountCode:v25 error:a4] & 1) != 0)
          {

            self->_state = 2;
            [MEMORY[0x189603F48] data];
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
      }

      else
      {
        KCJoiningErrorCreate( 7LL,  a4,  @"Got verification but  acceptor doesn't have matching secret: %@",  v17,  v18,  v19,  v20,  v21,  (uint64_t)self);
        secLogObjForScope("request-session");
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_impl(&dword_187D59000, v31, OS_LOG_TYPE_DEFAULT, "Verification failed: %@", buf, 0xCu);
        }
      }
    }

    else
    {
      KCJoiningErrorCreate(6LL, a4, @"Expected verification!", v9, v10, v11, v12, v13, v33);
    }

    id v26 = 0LL;
    goto LABEL_22;
  }

  [v6 firstData];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 length];

  [v8 verificationFailed:v28 == 0];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (v28)
    {
      [v6 firstData];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCJoiningRequestSecretSession handleChallengeData:secret:error:]( self,  "handleChallengeData:secret:error:",  v30,  v29,  a4);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v26 = -[KCJoiningRequestSecretSession copyResponseForSecret:error:](self, "copyResponseForSecret:error:", v29, a4);
    }
  }

  else
  {
    id v26 = 0LL;
  }

LABEL_22:
  return v26;
}

- (id)processMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  secLogObjForScope("joining");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl( &dword_187D59000,  v7,  OS_LOG_TYPE_DEFAULT,  "joining: KCJoiningRequestSecretSession processMessage called",  (uint8_t *)&v18,  2u);
  }

  +[KCJoiningMessage messageWithDER:error:](&OBJC_CLASS___KCJoiningMessage, "messageWithDER:error:", v6, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    int state = self->_state;
    switch(state)
    {
      case 2:
        KCJoiningErrorCreate(6LL, a4, @"Done, no messages expected.", v9, v10, v11, v12, v13, v18);
        break;
      case 1:
        uint64_t v15 = -[KCJoiningRequestSecretSession handleVerification:error:](self, "handleVerification:error:", v8, a4);
        goto LABEL_11;
      case 0:
        uint64_t v15 = -[KCJoiningRequestSecretSession handleChallenge:error:](self, "handleChallenge:error:", v8, a4);
LABEL_11:
        char v16 = (void *)v15;
        goto LABEL_12;
    }
  }

  char v16 = 0LL;
LABEL_12:

  return v16;
}

- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = ccrng();
  if (v9)
  {
    self =  -[KCJoiningRequestSecretSession initWithSecretDelegate:dsid:rng:error:]( self,  "initWithSecretDelegate:dsid:rng:error:",  v8,  a4,  v9,  a5);
    uint64_t v15 = self;
  }

  else
  {
    CoreCryptoError(0LL, a5, @"RNG fetch failed", v10, v11, v12, v13, v14, v17);
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (KCJoiningRequestSecretSession)initWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 rng:(ccrng_state *)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  secLogObjForScope("joining");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v10, OS_LOG_TYPE_DEFAULT, "joining: initWithSecretDelegate called", buf, 2u);
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___KCJoiningRequestSecretSession;
  uint64_t v11 = -[KCJoiningRequestSecretSession init](&v26, sel_init);
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_secretDelegate, v9);
    v12->_int state = 0;
    v12->_dsid = a4;
    uint64_t v13 = [MEMORY[0x189603FC8] dictionary];
    defaults = v12->_defaults;
    v12->_defaults = (NSMutableDictionary *)v13;

    v12->_piggy_version = 2LL;
    [MEMORY[0x189607AB8] UUID];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 UUIDString];
    sessionUUID = v12->_sessionUUID;
    v12->_sessionUUID = (NSString *)v16;

    secLogObjForScope("joining");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[KCJoiningRequestSecretSession sessionUUID](v12, "sessionUUID");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v19;
      _os_log_impl( &dword_187D59000,  v18,  OS_LOG_TYPE_DEFAULT,  "joining: initWithSecretDelegate called, uuid=%@",  buf,  0xCu);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = objc_alloc(&OBJC_CLASS___KCSRPClientContext);
    uint64_t v22 = ccsha256_di();
    uint64_t v23 = -[KCSRPContext initWithUser:digestInfo:group:randomSource:]( v21,  "initWithUser:digestInfo:group:randomSource:",  v20,  v22,  ccsrp_gp_rfc5054_3072(),  a5);
    context = v12->_context;
    v12->_context = (KCSRPClientContext *)v23;
  }

  return v12;
}

- (id)stateString
{
  unsigned int v3 = -[KCJoiningRequestSecretSession state](self, "state");
  if (v3 >= 3)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%d",  -[KCJoiningRequestSecretSession state](self, "state"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = off_18A134D68[v3];
  }

  return v4;
}

- (id)description
{
  unsigned int v3 = (void *)NSString;
  unint64_t v4 = -[KCJoiningRequestSecretSession dsid](self, "dsid");
  -[KCJoiningRequestSecretSession stateString](self, "stateString");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningRequestSecretSession context](self, "context");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<KCJoiningAcceptSession@%p %lld %@ %@>", self, v4, v5, v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (KCAESGCMDuplexSession)session
{
  return (KCAESGCMDuplexSession *)objc_getProperty(self, a2, 24LL, 1);
}

- (KCJoiningRequestSecretDelegate)secretDelegate
{
  return (KCJoiningRequestSecretDelegate *)objc_loadWeakRetained((id *)&self->_secretDelegate);
}

- (void)setSecretDelegate:(id)a3
{
}

- (KCSRPClientContext)context
{
  return (KCSRPClientContext *)objc_getProperty(self, a2, 40LL, 1);
}

- (unint64_t)dsid
{
  return self->_dsid;
}

- (int)state
{
  return self->_state;
}

- (NSString)piggy_uuid
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPiggy_uuid:(id)a3
{
}

- (unint64_t)piggy_version
{
  return self->_piggy_version;
}

- (void)setPiggy_version:(unint64_t)a3
{
  self->_piggy_version = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (NSData)challenge
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setChallenge:(id)a3
{
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (NSString)sessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setSessionUUID:(id)a3
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

+ (id)sessionWithSecretDelegate:(id)a3 dsid:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = -[KCJoiningRequestSecretSession initWithSecretDelegate:dsid:error:]( objc_alloc(&OBJC_CLASS___KCJoiningRequestSecretSession),  "initWithSecretDelegate:dsid:error:",  v7,  a4,  a5);

  return v8;
}

@end