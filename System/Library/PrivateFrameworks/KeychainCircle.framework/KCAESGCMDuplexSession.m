@interface KCAESGCMDuplexSession
+ (BOOL)supportsSecureCoding;
+ (id)sessionAsReceiver:(id)a3 context:(unint64_t)a4;
+ (id)sessionAsSender:(id)a3 context:(unint64_t)a4;
- ($0DD201535F598B6025D84F9AACEC468E)receive;
- ($0DD201535F598B6025D84F9AACEC468E)send;
- (BOOL)GCM:(const ccmode_gcm *)a3 context:(id *)a4 iv:(id)a5 size:(unint64_t)a6 data:(const char *)a7 processed:(char *)a8 tag:(char *)a9 error:(id *)a10;
- (BOOL)asSender;
- (KCAESGCMDuplexSession)initWithCoder:(id)a3;
- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5;
- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5 altDSID:(id)a6 pairingUUID:(id)a7 piggybackingVersion:(unint64_t)a8 epoch:(unint64_t)a9;
- (NSData)secret;
- (NSString)altDSID;
- (NSString)pairingUUID;
- (id)decryptAndVerify:(id)a3 error:(id *)a4;
- (id)encrypt:(id)a3 error:(id *)a4;
- (id)initAsReceiver:(id)a3 context:(unint64_t)a4;
- (id)initAsSender:(id)a3 context:(unint64_t)a4;
- (unint64_t)context;
- (unint64_t)encryptCapsuleSize:(id)a3 IV:(id)a4;
- (unint64_t)epoch;
- (unint64_t)piggybackingVersion;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAsSender:(BOOL)a3;
- (void)setContext:(unint64_t)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setPairingUUID:(id)a3;
- (void)setPiggybackingVersion:(unint64_t)a3;
- (void)setReceive:(id *)a3;
- (void)setSecret:(id)a3;
- (void)setSend:(id *)a3;
@end

@implementation KCAESGCMDuplexSession

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[KCAESGCMDuplexSession asSender](self, "asSender"), @"asSender");
  v4 = -[KCAESGCMDuplexSession secret](self, "secret");
  [v7 encodeObject:v4 forKey:@"secret"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession context](self, "context"), @"context");
  v5 = -[KCAESGCMDuplexSession altDSID](self, "altDSID");
  [v7 encodeObject:v5 forKey:@"altDSID"];
  v6 = -[KCAESGCMDuplexSession pairingUUID](self, "pairingUUID");
  [v7 encodeObject:v6 forKey:@"uuid"];

  objc_msgSend( v7,  "encodeInt64:forKey:",  -[KCAESGCMDuplexSession piggybackingVersion](self, "piggybackingVersion"),  @"piggy");
  objc_msgSend(v7, "encodeInt64:forKey:", -[KCAESGCMDuplexSession epoch](self, "epoch"), @"epoch");
}

- (KCAESGCMDuplexSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"asSender"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secret"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 decodeInt64ForKey:@"context"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v4 decodeInt64ForKey:@"piggy"];
  uint64_t v11 = [v4 decodeInt64ForKey:@"epoch"];

  v12 = -[KCAESGCMDuplexSession initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:]( self,  "initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:",  v6,  v7,  v5,  v8,  v9,  v10,  v11);
  return v12;
}

- (id)initAsSender:(id)a3 context:(unint64_t)a4
{
  return -[KCAESGCMDuplexSession initWithSecret:context:as:](self, "initWithSecret:context:as:", a3, a4, 1LL);
}

- (id)initAsReceiver:(id)a3 context:(unint64_t)a4
{
  return -[KCAESGCMDuplexSession initWithSecret:context:as:](self, "initWithSecret:context:as:", a3, a4, 0LL);
}

- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5
{
  return -[KCAESGCMDuplexSession initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:]( self,  "initWithSecret:context:as:altDSID:pairingUUID:piggybackingVersion:epoch:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  1LL);
}

- (KCAESGCMDuplexSession)initWithSecret:(id)a3 context:(unint64_t)a4 as:(BOOL)a5 altDSID:(id)a6 pairingUUID:(id)a7 piggybackingVersion:(unint64_t)a8 epoch:(unint64_t)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  if (initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch__onceToken != -1) {
    dispatch_once( &initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch__onceToken,  &__block_literal_global_264);
  }
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___KCAESGCMDuplexSession;
  v18 = -[KCAESGCMDuplexSession init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    -[KCAESGCMDuplexSession setAsSender:](v18, "setAsSender:", v12);
    -[KCAESGCMDuplexSession setSecret:](v19, "setSecret:", v15);
    ccaes_gcm_encrypt_mode();
    size_t v20 = ccgcm_context_size();
    -[KCAESGCMDuplexSession setSend:](v19, "setSend:", malloc(v20));
    ccaes_gcm_decrypt_mode();
    size_t v21 = ccgcm_context_size();
    -[KCAESGCMDuplexSession setReceive:](v19, "setReceive:", malloc(v21));
    -[KCAESGCMDuplexSession setContext:](v19, "setContext:", a4);
    objc_storeStrong((id *)&v19->_pairingUUID, a7);
    v19->_piggybackingVersion = a8;
    v19->_epoch = a9;
    objc_storeStrong((id *)&v19->_altDSID, a6);
    if (!-[KCAESGCMDuplexSession send](v19, "send") || !-[KCAESGCMDuplexSession receive](v19, "receive"))
    {
      v30 = 0LL;
      goto LABEL_15;
    }

    uint64_t v22 = ccaes_gcm_encrypt_mode();
    uint64_t v23 = -[KCAESGCMDuplexSession send](v19, "send");
    v24 = -[KCAESGCMDuplexSession secret](v19, "secret");
    if (v12) {
      v25 = &kdfInfoSendToReceive;
    }
    else {
      v25 = &kdfInfoReceiveToSend;
    }
    if (v12) {
      v26 = &kdfInfoReceiveToSend;
    }
    else {
      v26 = &kdfInfoSendToReceive;
    }
    derive_and_init(v22, v23, v24, (void *)*v25);

    uint64_t v27 = ccaes_gcm_decrypt_mode();
    uint64_t v28 = -[KCAESGCMDuplexSession receive](v19, "receive");
    v29 = -[KCAESGCMDuplexSession secret](v19, "secret");
    derive_and_init(v27, v28, v29, (void *)*v26);
  }

  v30 = v19;
LABEL_15:

  return v30;
}

- (unint64_t)encryptCapsuleSize:(id)a3 IV:(id)a4
{
  id v5 = a3;
  [a4 length];
  unint64_t v6 = ccder_sizeof_raw_octet_string();
  if (v6)
  {
    [v5 length];
    if (ccder_sizeof_raw_octet_string()
      && ([MEMORY[0x189603FB8] dataWithLength:16],
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
          [v7 length],
          uint64_t v8 = ccder_sizeof_raw_octet_string(),
          v7,
          v8))
    {
      unint64_t v6 = ccder_sizeof();
    }

    else
    {
      unint64_t v6 = 0LL;
    }
  }

  return v6;
}

- (BOOL)GCM:(const ccmode_gcm *)a3 context:(id *)a4 iv:(id)a5 size:(unint64_t)a6 data:(const char *)a7 processed:(char *)a8 tag:(char *)a9 error:(id *)a10
{
  id v10 = a5;
  uint64_t v11 = ccgcm_reset();
  if (CoreCryptoError(v11, a10, @"ccgcm_reset failed: %d", v12, v13, v14, v15, v16, v11)
    && ([v10 length],
        [v10 bytes],
        uint64_t v17 = ccgcm_set_iv(),
        CoreCryptoError(v17, a10, @"ccgcm_set_iv failed: %d", v18, v19, v20, v21, v22, v17))
    && (uint64_t v23 = ccgcm_update(), CoreCryptoError(v23, a10, @"ccgcm_update failed: %d", v24, v25, v26, v27, v28, v23)))
  {
    uint64_t v29 = ccgcm_finalize();
    BOOL v35 = CoreCryptoError(v29, a10, @"ccgcm_finalize failed: %d", v30, v31, v32, v33, v34, v29);
  }

  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

- (id)encrypt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [MEMORY[0x189603FB8] dataWithRandomBytes:16];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = objc_msgSend( MEMORY[0x189603FB8],  "dataWithLength:",  -[KCAESGCMDuplexSession encryptCapsuleSize:IV:](self, "encryptCapsuleSize:IV:", v6, v7));
  [v8 mutableBytes];
  [v8 length];
  id v9 = v8;
  uint64_t v10 = [v9 bytes];
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v11 = [v6 length];
  kcder_encode_raw_octet_space(16LL, &v26);
  kcder_encode_raw_octet_space(v11, &v25);
  kcder_encode_data(v7);
  if (ccder_encode_constructed_tl() == v10)
  {
    uint64_t v18 = ccaes_gcm_encrypt_mode();
    uint64_t v19 = -[KCAESGCMDuplexSession send](self, "send");
    uint64_t v20 = [v6 length];
    uint64_t v21 = [v6 bytes];
    if (-[KCAESGCMDuplexSession GCM:context:iv:size:data:processed:tag:error:]( self,  "GCM:context:iv:size:data:processed:tag:error:",  v18,  v19,  v7,  v20,  v21,  v25,  v26,  a4))
    {
      uint64_t v22 = v9;
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    id v17 = v22;
  }

  else
  {
    KCJoiningErrorCreate(0LL, a4, @"Failed to allocate space for der", v12, v13, v14, v15, v16, v24);
    id v17 = 0LL;
  }

  return v17;
}

- (id)decryptAndVerify:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  unint64_t v9 = v7 + v8;
  uint64_t v39 = 0LL;
  uint64_t v10 = ccder_decode_constructed_tl();
  if (v10) {
    BOOL v16 = v39 == v9;
  }
  else {
    BOOL v16 = 0;
  }
  if (!v16)
  {
    KCJoiningErrorCreate(1LL, a4, @"decode failed", v11, v12, v13, v14, v15, v37);
    return 0LL;
  }

  id v38 = 0LL;
  unint64_t v18 = kcder_decode_data_internal(&v38, 1, a4, v10, v9);
  id v19 = v38;
  unint64_t v40 = v18;
  if (v18)
  {
    uint64_t v20 = ccder_decode_constructed_tl();
    unint64_t v21 = v40;
    uint64_t v22 = ccder_decode_constructed_tl();
    if (v40)
    {
      if (v40 == v9)
      {
        uint64_t v29 = (__int128 *)v22;
        if (v9 - v22 == 16)
        {
          unint64_t v30 = v21 - v20;
          [MEMORY[0x189603FB8] dataWithLength:v21 - v20];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v41 = *v29;
          uint64_t v32 = ccaes_gcm_decrypt_mode();
          uint64_t v33 = -[KCAESGCMDuplexSession receive](self, "receive");
          id v34 = v31;
          if (-[KCAESGCMDuplexSession GCM:context:iv:size:data:processed:tag:error:]( self,  "GCM:context:iv:size:data:processed:tag:error:",  v32,  v33,  v19,  v30,  v20,  [v34 mutableBytes],  &v41,  a4))
          {
            BOOL v35 = v34;
          }

          else
          {
            BOOL v35 = 0LL;
          }

          id v36 = v35;

          goto LABEL_19;
        }

        uint64_t v37 = v9 - v22;
        uint64_t v28 = @"Unexpected tag size: %ld";
      }

      else
      {
        uint64_t v28 = @"Extra space";
      }
    }

    else
    {
      uint64_t v28 = @"Decode failure";
    }

    KCJoiningErrorCreate(1LL, a4, v28, v23, v24, v25, v26, v27, v37);
  }

  id v36 = 0LL;
LABEL_19:

  return v36;
}

- (void)dealloc
{
  if (-[KCAESGCMDuplexSession send](self, "send"))
  {
    ccaes_gcm_encrypt_mode();
    ccgcm_context_size();
    -[KCAESGCMDuplexSession send](self, "send");
    cc_clear();
    free(-[KCAESGCMDuplexSession send](self, "send"));
  }

  if (-[KCAESGCMDuplexSession receive](self, "receive"))
  {
    ccaes_gcm_decrypt_mode();
    ccgcm_context_size();
    -[KCAESGCMDuplexSession receive](self, "receive");
    cc_clear();
    free(-[KCAESGCMDuplexSession receive](self, "receive"));
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KCAESGCMDuplexSession;
  -[KCAESGCMDuplexSession dealloc](&v3, sel_dealloc);
}

- (NSString)pairingUUID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPairingUUID:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)piggybackingVersion
{
  return self->_piggybackingVersion;
}

- (void)setPiggybackingVersion:(unint64_t)a3
{
  self->_piggybackingVersion = a3;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(unint64_t)a3
{
  self->_epoch = a3;
}

- (BOOL)asSender
{
  return self->_asSender;
}

- (void)setAsSender:(BOOL)a3
{
  self->_asSender = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (NSData)secret
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSecret:(id)a3
{
}

- ($0DD201535F598B6025D84F9AACEC468E)send
{
  return self->_send;
}

- (void)setSend:(id *)a3
{
  self->_send = a3;
}

- ($0DD201535F598B6025D84F9AACEC468E)receive
{
  return self->_receive;
}

- (void)setReceive:(id *)a3
{
  self->_receive = a3;
}

- (void).cxx_destruct
{
}

void __97__KCAESGCMDuplexSession_initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603F48] dataWithBytesNoCopy:"send->recv" length:10 freeWhenDone:0];
  v1 = (void *)kdfInfoSendToReceive;
  kdfInfoSendToReceive = v0;

  uint64_t v2 = [MEMORY[0x189603F48] dataWithBytesNoCopy:"recv->send" length:10 freeWhenDone:0];
  objc_super v3 = (void *)kdfInfoReceiveToSend;
  kdfInfoReceiveToSend = v2;
}

+ (id)sessionAsSender:(id)a3 context:(unint64_t)a4
{
  id v5 = a3;
  id v6 = -[KCAESGCMDuplexSession initAsSender:context:]( objc_alloc(&OBJC_CLASS___KCAESGCMDuplexSession),  "initAsSender:context:",  v5,  a4);

  return v6;
}

+ (id)sessionAsReceiver:(id)a3 context:(unint64_t)a4
{
  id v5 = a3;
  id v6 = -[KCAESGCMDuplexSession initAsReceiver:context:]( objc_alloc(&OBJC_CLASS___KCAESGCMDuplexSession),  "initAsReceiver:context:",  v5,  a4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end