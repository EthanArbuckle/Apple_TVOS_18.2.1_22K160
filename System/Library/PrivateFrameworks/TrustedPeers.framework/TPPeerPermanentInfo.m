@interface TPPeerPermanentInfo
+ (id)mungeModelID:(id)a3;
+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5;
+ (id)permanentInfoWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingKeyPair:(id)a6 encryptionKeyPair:(id)a7 creationTime:(unint64_t)a8 peerIDHashAlgo:(int64_t)a9 error:(id *)a10;
+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6;
+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6 checkSig:(BOOL)a7;
- (NSData)data;
- (NSData)sig;
- (NSString)machineID;
- (NSString)modelID;
- (NSString)peerID;
- (TPPeerPermanentInfo)initWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingPubKey:(id)a6 encryptionPubKey:(id)a7 creationTime:(unint64_t)a8 data:(id)a9 sig:(id)a10 peerID:(id)a11;
- (TPPublicKey)encryptionPubKey;
- (TPPublicKey)signingPubKey;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)creationTime;
- (unint64_t)epoch;
@end

@implementation TPPeerPermanentInfo

- (TPPeerPermanentInfo)initWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingPubKey:(id)a6 encryptionPubKey:(id)a7 creationTime:(unint64_t)a8 data:(id)a9 sig:(id)a10 peerID:(id)a11
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a6;
  id v27 = a7;
  id v26 = a9;
  id v17 = a10;
  id v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TPPeerPermanentInfo;
  v19 = -[TPPeerPermanentInfo init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_machineID, a3);
    objc_storeStrong((id *)&v20->_modelID, a4);
    v20->_epoch = a5;
    objc_storeStrong((id *)&v20->_signingPubKey, a6);
    objc_storeStrong((id *)&v20->_encryptionPubKey, a7);
    v20->_creationTime = a8;
    objc_storeStrong((id *)&v20->_data, a9);
    objc_storeStrong((id *)&v20->_sig, a10);
    v21 = +[TPStringTable defaultTable](&OBJC_CLASS___TPStringTable, "defaultTable");
    uint64_t v22 = [v21 stringWithString:v18];
    peerID = v20->_peerID;
    v20->_peerID = (NSString *)v22;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc(&OBJC_CLASS___TPPBPeerPermanentInfo);
  v4 = -[TPPeerPermanentInfo data](self, "data");
  v5 = -[PBCodable initWithData:](v3, "initWithData:", v4);
  v6 = -[TPPBPeerPermanentInfo dictionaryRepresentation](v5, "dictionaryRepresentation");
  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = -[TPPeerPermanentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  [v4 description];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (TPPublicKey)signingPubKey
{
  return self->_signingPubKey;
}

- (TPPublicKey)encryptionPubKey
{
  return self->_encryptionPubKey;
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)sig
{
  return self->_sig;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void).cxx_destruct
{
}

+ (id)mungeModelID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (!TPBecomeAppleTVOverride())
  {
LABEL_7:
    id v6 = v3;
    goto LABEL_8;
  }

  id v9 = 0LL;
  [MEMORY[0x189607A00] regularExpressionWithPattern:@"^[^0-9,]*" options:0 error:&v9];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  if (!v4)
  {
    TPModelLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl( &dword_188398000,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to make regex; cannot change modelID: %{public}@",
        buf,
        0xCu);
    }

    goto LABEL_7;
  }

  objc_msgSend( v4,  "stringByReplacingMatchesInString:options:range:withTemplate:",  v3,  0,  0,  objc_msgSend(v3, "length"),  @"AppleTV");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)permanentInfoWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingKeyPair:(id)a6 encryptionKeyPair:(id)a7 creationTime:(unint64_t)a8 peerIDHashAlgo:(int64_t)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  [v17 publicKey];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 publicKey];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[TPPeerPermanentInfo mungeModelID:](&OBJC_CLASS___TPPeerPermanentInfo, "mungeModelID:", v18);
  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___TPPBPeerPermanentInfo);
  -[TPPBPeerPermanentInfo setMachineId:](v22, "setMachineId:", v15);
  -[TPPBPeerPermanentInfo setModelId:](v22, "setModelId:", v21);
  -[TPPBPeerPermanentInfo setEpoch:](v22, "setEpoch:", a5);
  [v19 spki];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerPermanentInfo setSigningPubKey:](v22, "setSigningPubKey:", v23);

  [v20 spki];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerPermanentInfo setEncryptionPubKey:](v22, "setEncryptionPubKey:", v24);

  -[TPPBPeerPermanentInfo setCreationTime:](v22, "setCreationTime:", a8);
  v25 = -[PBCodable data](v22, "data");
  typesafeSignature(v17, v25, @"TPPB.PeerPermanentInfo", a10);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[TPPeerPermanentInfo peerIDForData:sig:peerIDHashAlgo:]( &OBJC_CLASS___TPPeerPermanentInfo,  "peerIDForData:sig:peerIDHashAlgo:",  v25,  v26,  a9);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = -[TPPeerPermanentInfo initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:]( objc_alloc(&OBJC_CLASS___TPPeerPermanentInfo),  "initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:",  v15,  v21,  a5,  v19,  v20,  a8,  v25,  v26,  v27);
  }

  else
  {
    id v28 = 0LL;
  }

  return v28;
}

+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[TPHashBuilder initWithAlgo:](objc_alloc(&OBJC_CLASS___TPHashBuilder), "initWithAlgo:", a5);
  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v8);

  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v7);
  v10 = -[TPHashBuilder finalHash](v9, "finalHash");
  return v10;
}

+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6
{
  return +[TPPeerPermanentInfo permanentInfoWithPeerID:data:sig:keyFactory:checkSig:]( &OBJC_CLASS___TPPeerPermanentInfo,  "permanentInfoWithPeerID:data:sig:keyFactory:checkSig:",  a3,  a4,  a5,  a6,  1LL);
}

+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6 checkSig:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBPeerPermanentInfo), "initWithData:", v12);
  id v16 = v15;
  if (v15)
  {
    -[TPPBPeerPermanentInfo signingPubKey](v15, "signingPubKey");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = (TPPeerPermanentInfo *)[v17 length];

    if (v18)
    {
      v19 = -[TPPBPeerPermanentInfo encryptionPubKey](v16, "encryptionPubKey");
      id v18 = (TPPeerPermanentInfo *)[v19 length];

      if (v18)
      {
        v20 = -[TPPBPeerPermanentInfo signingPubKey](v16, "signingPubKey");
        [v14 keyFromSPKI:v20];
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21
          || v7 && !checkTypesafeSignature(v21, v13, v12, @"TPPB.PeerPermanentInfo")
          || (int64_t v22 = +[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v11), v22 == -1))
        {
          id v18 = 0LL;
        }

        else
        {
          v23 = +[TPPeerPermanentInfo peerIDForData:sig:peerIDHashAlgo:]( &OBJC_CLASS___TPPeerPermanentInfo,  "peerIDForData:sig:peerIDHashAlgo:",  v12,  v13,  v22);
          if ([v23 isEqualToString:v11])
          {
            v24 = -[TPPBPeerPermanentInfo encryptionPubKey](v16, "encryptionPubKey");
            [v14 keyFromSPKI:v24];
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              id v29 = objc_alloc(&OBJC_CLASS___TPPeerPermanentInfo);
              -[TPPBPeerPermanentInfo machineId](v16, "machineId");
              id v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBPeerPermanentInfo modelId](v16, "modelId");
              id v26 = (void *)objc_claimAutoreleasedReturnValue();
              id v18 = -[TPPeerPermanentInfo initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:]( v29,  "initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:",  v28,  v26,  -[TPPBPeerPermanentInfo epoch](v16, "epoch"),  v21,  v25,  -[TPPBPeerPermanentInfo creationTime](v16, "creationTime"),  v12,  v13,  v11);
            }

            else
            {
              id v18 = 0LL;
            }
          }

          else
          {
            id v18 = 0LL;
          }
        }
      }
    }
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

@end