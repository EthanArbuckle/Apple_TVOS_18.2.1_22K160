@interface CKKSTLKShare
+ (BOOL)supportsSecureCoding;
+ (id)share:(id)a3 as:(id)a4 to:(id)a5 epoch:(int64_t)a6 poisoned:(int64_t)a7 error:(id *)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)signatureVerifiesWithPeerSet:(id)a3 ckrecord:(id)a4 error:(id *)a5;
- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 ckrecord:(id)a5 error:(id *)a6;
- (CKKSTLKShare)initWithCoder:(id)a3;
- (CKRecordZoneID)zoneID;
- (NSData)receiverPublicEncryptionKeySPKI;
- (NSData)signature;
- (NSData)wrappedTLK;
- (NSString)receiverPeerID;
- (NSString)senderPeerID;
- (NSString)tlkUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataForSigning:(id)a3;
- (id)description;
- (id)init:(id)a3 sender:(id)a4 receiver:(id)a5 curve:(int64_t)a6 version:(unint64_t)a7 epoch:(int64_t)a8 poisoned:(int64_t)a9 zoneID:(id)a10;
- (id)initForKey:(id)a3 senderPeerID:(id)a4 recieverPeerID:(id)a5 receiverEncPublicKeySPKI:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 wrappedKey:(id)a11 signature:(id)a12 zoneID:(id)a13;
- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 ckrecord:(id)a5 error:(id *)a6;
- (id)signRecord:(id)a3 ckrecord:(id)a4 error:(id *)a5;
- (id)unwrapUsing:(id)a3 error:(id *)a4;
- (id)wrap:(id)a3 publicKey:(id)a4 error:(id *)a5;
- (int64_t)curve;
- (int64_t)epoch;
- (int64_t)poisoned;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setCurve:(int64_t)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setPoisoned:(int64_t)a3;
- (void)setReceiverPeerID:(id)a3;
- (void)setReceiverPublicEncryptionKeySPKI:(id)a3;
- (void)setSenderPeerID:(id)a3;
- (void)setSignature:(id)a3;
- (void)setTlkUUID:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)setWrappedTLK:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSTLKShare

- (id)init:(id)a3 sender:(id)a4 receiver:(id)a5 curve:(int64_t)a6 version:(unint64_t)a7 epoch:(int64_t)a8 poisoned:(int64_t)a9 zoneID:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CKKSTLKShare;
  v20 = -[CKKSTLKShare init](&v32, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_zoneID, a10);
    v21->_curve = a6;
    v21->_version = a7;
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v16 uuid]);
    tlkUUID = v21->_tlkUUID;
    v21->_tlkUUID = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v18 peerID]);
    receiverPeerID = v21->_receiverPeerID;
    v21->_receiverPeerID = (NSString *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v18 publicEncryptionKey]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 keyData]);
    receiverPublicEncryptionKeySPKI = v21->_receiverPublicEncryptionKeySPKI;
    v21->_receiverPublicEncryptionKeySPKI = (NSData *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v17 peerID]);
    senderPeerID = v21->_senderPeerID;
    v21->_senderPeerID = (NSString *)v29;

    v21->_epoch = a8;
    v21->_poisoned = a9;
  }

  return v21;
}

- (id)initForKey:(id)a3 senderPeerID:(id)a4 recieverPeerID:(id)a5 receiverEncPublicKeySPKI:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 wrappedKey:(id)a11 signature:(id)a12 zoneID:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id obj = a5;
  id v20 = a5;
  id v27 = a6;
  id v31 = a6;
  id v21 = a11;
  id v22 = a12;
  id v30 = a13;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CKKSTLKShare;
  v23 = -[CKKSTLKShare init](&v32, "init");
  uint64_t v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_zoneID, a13);
    objc_storeStrong((id *)&v24->_tlkUUID, a3);
    objc_storeStrong((id *)&v24->_senderPeerID, a4);
    objc_storeStrong((id *)&v24->_receiverPeerID, obj);
    objc_storeStrong((id *)&v24->_receiverPublicEncryptionKeySPKI, v27);
    v24->_curve = a7;
    v24->_version = a8;
    v24->_epoch = a9;
    v24->_poisoned = a10;
    objc_storeStrong((id *)&v24->_wrappedTLK, a11);
    objc_storeStrong((id *)&v24->_signature, a12);
  }

  return v24;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSTLKShareCore(%@): recv:%@ send:%@>",  v3,  v4,  v5));

  return v6;
}

- (id)wrap:(id)a3 publicKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_autoreleasePoolPush();
  id v19 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 serializeAsProtobuf:&v19]);
  id v12 = v19;
  objc_autoreleasePoolPop(v10);
  if (v11)
  {
    id v13 = objc_msgSend( [_SFIESOperation alloc],  "initWithCurve:",  -[CKKSTLKShare curve](self, "curve"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encrypt:v11 withKey:v9 error:a5]);
    v15 = objc_autoreleasePoolPush();
    id v16 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    [v14 encodeWithCoder:v16];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v16, "encodedData"));

    objc_autoreleasePoolPop(v15);
  }

  else
  {
    id v17 = 0LL;
    if (a5) {
      *a5 = v12;
    }
  }

  return v17;
}

- (id)unwrapUsing:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  id v9 = -[NSKeyedUnarchiver initForReadingFromData:error:](v7, "initForReadingFromData:error:", v8, 0LL);

  id v10 = [[_SFIESCiphertext alloc] initWithCoder:v9];
  -[NSKeyedUnarchiver finishDecoding](v9, "finishDecoding");
  id v11 = objc_msgSend([_SFIESOperation alloc], "initWithCurve:", -[CKKSTLKShare curve](self, "curve"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionKey]);

  id v17 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 decrypt:v10 withKey:v12 error:&v17]);
  id v14 = v17;

  if (!v13 || v14)
  {
    v15 = 0LL;
    if (a4) {
      *a4 = v14;
    }
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey loadFromProtobuf:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "loadFromProtobuf:error:",  v13,  a4));
  }

  return v15;
}

- (id)dataForSigning:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  unint64_t v59 = -[CKKSTLKShare version](self, "version");
  -[NSMutableData appendBytes:length:](v6, "appendBytes:length:", &v59, 8LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);
  -[NSMutableData appendData:](v6, "appendData:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
  -[NSMutableData appendData:](v6, "appendData:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  -[NSMutableData appendData:](v6, "appendData:", v11);

  int64_t v58 = -[CKKSTLKShare curve](self, "curve");
  -[NSMutableData appendBytes:length:](v6, "appendBytes:length:", &v58, 8LL);
  int64_t v57 = -[CKKSTLKShare epoch](self, "epoch");
  -[NSMutableData appendBytes:length:](v6, "appendBytes:length:", &v57, 8LL);
  int64_t v56 = -[CKKSTLKShare poisoned](self, "poisoned");
  -[NSMutableData appendBytes:length:](v6, "appendBytes:length:", &v56, 8LL);
  if (v4)
  {
    v42 = v5;
    v46 = v6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    v43 = v4;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    id v14 = [v13 countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          if (([v18 isEqualToString:@"sender"] & 1) == 0
            && ([v18 isEqualToString:@"receiver"] & 1) == 0
            && ([v18 isEqualToString:@"receiverPublicEncryptionKey"] & 1) == 0
            && ([v18 isEqualToString:@"curve"] & 1) == 0
            && ([v18 isEqualToString:@"epoch"] & 1) == 0
            && ([v18 isEqualToString:@"poisoned"] & 1) == 0
            && ([v18 isEqualToString:@"signature"] & 1) == 0
            && ([v18 isEqualToString:@"version"] & 1) == 0
            && ([v18 isEqualToString:@"parentkeyref"] & 1) == 0
            && ([v18 isEqualToString:@"wrappedkey"] & 1) == 0
            && ([v18 hasPrefix:@"server_"] & 1) == 0)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v18]);
            [v12 setObject:v44 forKeyedSubscript:v18];
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v52 objects:v61 count:16];
      }

      while (v15);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sortedArrayUsingSelector:"compare:"]);

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v48 objects:v60 count:16];
    id v6 = v46;
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = &_s10Foundation13__DataStorageC5bytes6length4copy11deallocator6offsetACSvSg_SiSbySv_SitcSgSitcfc_ptr;
      v25 = &_s10Foundation13__DataStorageC5bytes6length4copy11deallocator6offsetACSvSg_SiSbySv_SitcSgSitcfc_ptr;
      uint64_t v26 = *(void *)v49;
      do
      {
        id v27 = 0LL;
        id v45 = v23;
        do
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v21);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:*(void *)(*((void *)&v48 + 1) + 8 * (void)v27)]);
          uint64_t v29 = objc_opt_class(v24[505]);
          if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
          {
            id v30 = (NSISO8601DateFormatter *)objc_claimAutoreleasedReturnValue([v28 dataUsingEncoding:4]);
            -[NSMutableData appendData:](v6, "appendData:", v30);
LABEL_28:

            goto LABEL_35;
          }

          uint64_t v31 = objc_opt_class(v25[482]);
          if ((objc_opt_isKindOfClass(v28, v31) & 1) != 0)
          {
            -[NSMutableData appendData:](v6, "appendData:", v28);
          }

          else
          {
            uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDate);
            if ((objc_opt_isKindOfClass(v28, v32) & 1) != 0)
            {
              id v30 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringForObjectValue:](v30, "stringForObjectValue:", v28));
              uint64_t v34 = v26;
              v35 = v24;
              id v36 = v21;
              v37 = v12;
              v38 = v25;
              v39 = (void *)objc_claimAutoreleasedReturnValue([v33 dataUsingEncoding:4]);
              -[NSMutableData appendData:](v46, "appendData:", v39);

              v25 = v38;
              id v12 = v37;
              id v21 = v36;
              uint64_t v24 = v35;
              uint64_t v26 = v34;
              id v23 = v45;

              id v6 = v46;
              goto LABEL_28;
            }

            uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v28, v40) & 1) != 0)
            {
              id v47 = (id)0xAAAAAAAAAAAAAAAALL;
              id v47 = [v28 unsignedLongLongValue];
              -[NSMutableData appendBytes:length:](v6, "appendBytes:length:", &v47, 8LL);
            }
          }

- (id)signRecord:(id)a3 ckrecord:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc(&OBJC_CLASS____SFEC_X962SigningOperation);
  id v11 = objc_msgSend( [_SFECKeySpecifier alloc],  "initWithCurve:",  -[CKKSTLKShare curve](self, "curve"));
  id v12 = objc_alloc_init(&OBJC_CLASS____SFSHA256DigestOperation);
  id v13 = [v10 initWithKeySpecifier:v11 digestOperation:v12];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare dataForSigning:](self, "dataForSigning:", v8));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 sign:v14 withKey:v9 error:a5]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 signature]);
  return v16;
}

- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 ckrecord:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 publicSigningKey]);

  if (v13)
  {
    id v14 = objc_alloc(&OBJC_CLASS____SFEC_X962SigningOperation);
    id v15 = objc_msgSend( [_SFECKeySpecifier alloc],  "initWithCurve:",  -[CKKSTLKShare curve](self, "curve"));
    id v16 = objc_alloc_init(&OBJC_CLASS____SFSHA256DigestOperation);
    id v17 = [v14 initWithKeySpecifier:v15 digestOperation:v16];

    id v18 = objc_alloc(&OBJC_CLASS____SFSignedData);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare dataForSigning:](self, "dataForSigning:", v12));
    id v20 = [v18 initWithData:v19 signature:v10];

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 publicSigningKey]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 verify:v20 withKey:v21 error:a6]);
    LOBYTE(a6) = v22 != 0LL;
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneName]);
    id v25 = sub_1001CF4C0(@"ckksshare", v24);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "no signing key for peer: %@", buf, 0xCu);
    }

    if (a6)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Peer(%@) has no signing key",  v11));
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  37LL,  v27));

      LOBYTE(a6) = 0;
    }
  }

  return (char)a6;
}

- (BOOL)signatureVerifiesWithPeerSet:(id)a3 ckrecord:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v35 = a4;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v32 = a5;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v38;
    uint64_t v33 = *(void *)v38;
    while (2)
    {
      id v14 = 0LL;
      id v34 = v11;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 peerID]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
        unsigned int v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
          id v36 = 0LL;
          unsigned int v20 = -[CKKSTLKShare verifySignature:verifyingPeer:ckrecord:error:]( self,  "verifySignature:verifyingPeer:ckrecord:error:",  v19,  v15,  v35,  &v36);
          id v21 = v36;

          if (v21)
          {
            id v22 = v12;
            id v23 = v9;
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
            id v26 = sub_1001CF4C0(@"ckksshare", v25);
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v42 = self;
              __int16 v43 = 2112;
              v44 = v15;
              __int16 v45 = 2112;
              id v46 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "signature didn't verify for %@ %@: %@",  buf,  0x20u);
            }

            id v12 = v21;
            id v9 = v23;
            uint64_t v13 = v33;
            id v11 = v34;
          }

          if (v20)
          {

            BOOL v28 = 1;
            goto LABEL_21;
          }
        }

        id v14 = (char *)v14 + 1;
      }

      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    a5 = v32;
    if (v32)
    {
      if (!v12) {
        goto LABEL_19;
      }
      id v12 = v12;
      BOOL v28 = 0;
      *uint64_t v32 = v12;
    }

    else
    {
      BOOL v28 = 0;
    }
  }

  else
  {

    if (a5)
    {
LABEL_19:
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No TLK share from %@",  v29));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  35LL,  v30));
    }

    BOOL v28 = 0;
    id v12 = 0LL;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCurve:", -[CKKSTLKShare curve](self, "curve"));
  objc_msgSend(v4, "setVersion:", -[CKKSTLKShare version](self, "version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
  id v6 = [v5 copy];
  [v4 setTlkUUID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  id v8 = [v7 copy];
  [v4 setSenderPeerID:v8];

  objc_msgSend(v4, "setEpoch:", -[CKKSTLKShare epoch](self, "epoch"));
  objc_msgSend(v4, "setPoisoned:", -[CKKSTLKShare poisoned](self, "poisoned"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  id v10 = [v9 copy];
  [v4 setWrappedTLK:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
  id v12 = [v11 copy];
  [v4 setSignature:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  id v14 = [v13 copy];
  [v4 setReceiverPeerID:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
  id v16 = [v15 copy];
  [v4 setReceiverPublicEncryptionKeySPKI:v16];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
  [v4 encodeObject:v5 forKey:@"zoneID"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare curve](self, "curve"), @"curve");
  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare version](self, "version"), @"version");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
  [v4 encodeObject:v6 forKey:@"tlkUUID"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
  [v4 encodeObject:v7 forKey:@"senderPeerID"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare epoch](self, "epoch"), @"epoch");
  objc_msgSend(v4, "encodeInt64:forKey:", -[CKKSTLKShare poisoned](self, "poisoned"), @"poisoned");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
  [v4 encodeObject:v8 forKey:@"wrappedTLK"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
  [v4 encodeObject:v9 forKey:@"signature"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
  [v4 encodeObject:v10 forKey:@"receiverPeerID"];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
  [v4 encodeObject:v11 forKey:@"receiverSPKI"];
}

- (CKKSTLKShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CKKSTLKShare;
  v5 = -[CKKSTLKShare init](&v28, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(CKRecordZoneID) forKey:@"zoneID"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v7;

    v5->_curve = (int64_t)[v4 decodeInt64ForKey:@"curve"];
    v5->_version = (unint64_t)[v4 decodeInt64ForKey:@"version"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"tlkUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    tlkUUID = v5->_tlkUUID;
    v5->_tlkUUID = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"senderPeerID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    senderPeerID = v5->_senderPeerID;
    v5->_senderPeerID = (NSString *)v13;

    v5->_epoch = (int64_t)[v4 decodeInt64ForKey:@"epoch"];
    v5->_poisoned = (int64_t)[v4 decodeInt64ForKey:@"poisoned"];
    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"wrappedTLK"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    wrappedTLK = v5->_wrappedTLK;
    v5->_wrappedTLK = (NSData *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"signature"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    signature = v5->_signature;
    v5->_signature = (NSData *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"receiverPeerID"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    receiverPeerID = v5->_receiverPeerID;
    v5->_receiverPeerID = (NSString *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"receiverSPKI"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    receiverPublicEncryptionKeySPKI = v5->_receiverPublicEncryptionKeySPKI;
    v5->_receiverPublicEncryptionKeySPKI = (NSData *)v25;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKKSTLKShare);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 tlkUUID]);
    if (![v7 isEqualToString:v8])
    {
      unsigned __int8 v13 = 0;
LABEL_37:

      goto LABEL_38;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare zoneID](self, "zoneID"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    if (![v9 isEqual:v10])
    {
      unsigned __int8 v13 = 0;
LABEL_36:

      goto LABEL_37;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 senderPeerID]);
    id v46 = v11;
    if (![v11 isEqualToString:v12])
    {
      unsigned __int8 v13 = 0;
LABEL_35:

      goto LABEL_36;
    }

    uint64_t v45 = objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
    if (v45 || (__int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v6 receiverPeerID])) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPeerID](self, "receiverPeerID"));
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v6 receiverPeerID]);
      if (!objc_msgSend(v44, "isEqual:"))
      {
        unsigned __int8 v13 = 0;
        goto LABEL_32;
      }

      int v42 = 1;
    }

    else
    {
      __int128 v39 = 0LL;
      int v42 = 0;
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
    if (v14
      || (__int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v6 receiverPublicEncryptionKeySPKI])) != 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare receiverPublicEncryptionKeySPKI](self, "receiverPublicEncryptionKeySPKI"));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v6 receiverPublicEncryptionKeySPKI]);
      v41 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        unsigned __int8 v13 = 0;
        id v17 = (void *)v14;
        goto LABEL_29;
      }

      __int128 v38 = (void *)v14;
      int v16 = 1;
    }

    else
    {
      __int128 v37 = 0LL;
      __int128 v38 = 0LL;
      int v16 = 0;
    }

    id v18 = -[CKKSTLKShare epoch](self, "epoch");
    if (v18 != [v6 epoch]
      || (id v19 = -[CKKSTLKShare curve](self, "curve"), v19 != [v6 curve])
      || (id v20 = -[CKKSTLKShare poisoned](self, "poisoned"), v20 != [v6 poisoned]))
    {
      unsigned __int8 v13 = 0;
      id v17 = v38;
      if (!v16) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }

    id v17 = v38;
    uint64_t v36 = objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
    if (v36 || (uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappedTLK])) != 0)
    {
      char v34 = v16;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare wrappedTLK](self, "wrappedTLK"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappedTLK]);
      uint64_t v33 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        unsigned __int8 v13 = 0;
        LOBYTE(v16) = v34;
        goto LABEL_48;
      }

      int v31 = 1;
      LOBYTE(v16) = v34;
    }

    else
    {
      uint64_t v29 = 0LL;
      int v31 = 0;
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
    if (v35 || (uint64_t v27 = objc_claimAutoreleasedReturnValue([v6 signature])) != 0)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature", v27, v29));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 signature]);
      unsigned __int8 v13 = [v30 isEqual:v24];

      if (v35)
      {

        id v17 = v38;
        if (!v31) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }

      id v17 = v38;
      id v26 = v28;
    }

    else
    {
      id v26 = 0LL;
      unsigned __int8 v13 = 1;
    }

    if ((v31 & 1) == 0)
    {
LABEL_49:
      uint64_t v25 = (void *)v36;
      if (!v36)
      {

        uint64_t v25 = 0LL;
      }

      if ((v16 & 1) == 0)
      {
LABEL_30:
        if (v17)
        {

          if (v42) {
            goto LABEL_32;
          }
        }

        else
        {

          if ((v42 & 1) != 0)
          {
LABEL_32:
            uint64_t v22 = (void *)v45;

            if (v45)
            {
LABEL_34:

              goto LABEL_35;
            }

- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 ckrecord:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    id v33 = v11;
    id v34 = v9;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 peerID]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare senderPeerID](self, "senderPeerID"));
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          id v21 = v17;

          uint64_t v14 = v21;
        }
      }

      id v13 = [v10 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v13);
    id v11 = v33;
    id v9 = v34;
    if (v14)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare signature](self, "signature"));
      unsigned int v23 = -[CKKSTLKShare verifySignature:verifyingPeer:ckrecord:error:]( self,  "verifySignature:verifyingPeer:ckrecord:error:",  v22,  v14,  v33,  a6);

      if (v23)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare unwrapUsing:error:](self, "unwrapUsing:error:", v34, a6));
        if (v24)
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShare tlkUUID](self, "tlkUUID"));
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 uuid]);
          unsigned __int8 v27 = [v25 isEqualToString:v26];

          if ((v27 & 1) != 0)
          {
            id v28 = v24;
            id v29 = 0LL;
LABEL_24:

            goto LABEL_25;
          }

          int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Signed UUID doesn't match unsigned UUID for %@",  self));
          id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  20LL,  v31));

          if (a6)
          {
            id v29 = v29;
            id v28 = 0LL;
            *a6 = v29;
            goto LABEL_24;
          }
        }

        else
        {
          id v29 = 0LL;
        }

        id v28 = 0LL;
        goto LABEL_24;
      }

      id v29 = 0LL;
      goto LABEL_19;
    }
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No trusted peer signed %@",  self));
  id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  19LL,  v30));

  if (!a6)
  {
    uint64_t v14 = 0LL;
LABEL_19:
    id v28 = 0LL;
    goto LABEL_25;
  }

  id v29 = v29;
  uint64_t v14 = 0LL;
  id v28 = 0LL;
  *a6 = v29;
LABEL_25:

  return v28;
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)tlkUUID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTlkUUID:(id)a3
{
}

- (NSString)receiverPeerID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setReceiverPeerID:(id)a3
{
}

- (NSData)receiverPublicEncryptionKeySPKI
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setReceiverPublicEncryptionKeySPKI:(id)a3
{
}

- (NSString)senderPeerID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSenderPeerID:(id)a3
{
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

- (int64_t)poisoned
{
  return self->_poisoned;
}

- (void)setPoisoned:(int64_t)a3
{
  self->_poisoned = a3;
}

- (NSData)wrappedTLK
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setWrappedTLK:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSignature:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)share:(id)a3 as:(id)a4 to:(id)a5 epoch:(int64_t)a6 poisoned:(int64_t)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  int v16 = objc_alloc(&OBJC_CLASS___CKKSTLKShare);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
  id v18 = -[CKKSTLKShare init:sender:receiver:curve:version:epoch:poisoned:zoneID:]( v16,  "init:sender:receiver:curve:version:epoch:poisoned:zoneID:",  v13,  v14,  v15,  4LL,  0LL,  a6,  a7,  v17);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 publicEncryptionKey]);
  id v35 = 0LL;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 wrap:v13 publicKey:v19 error:&v35]);
  id v21 = v35;
  [v18 setWrappedTLK:v20];

  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneName]);
    id v24 = sub_1001CF4C0(@"ckksshare", v23);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412546;
    id v37 = v13;
    __int16 v38 = 2112;
    id v39 = v21;
    id v26 = "couldn't share %@ (wrap failed): %@";
    goto LABEL_7;
  }

  unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v14 signingKey]);
  id v34 = 0LL;
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v18 signRecord:v27 ckrecord:0 error:&v34]);
  id v21 = v34;
  [v18 setSignature:v28];

  if (!v21)
  {
    id v32 = v18;
    goto LABEL_12;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
  id v31 = sub_1001CF4C0(@"ckksshare", v30);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v13;
    __int16 v38 = 2112;
    id v39 = v21;
    id v26 = "couldn't share %@ (signing failed): %@";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
  }

@end