@interface CKKSTLKShareRecord
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)allFor:(id)a3 contextID:(id)a4 keyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)allForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)ckrecordPrefix;
+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8;
+ (id)fromDatabaseRow:(id)a3;
+ (id)share:(id)a3 contextID:(id)a4 as:(id)a5 to:(id)a6 epoch:(int64_t)a7 poisoned:(int64_t)a8 error:(id *)a9;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8;
+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (BOOL)signatureVerifiesWithPeerSet:(id)a3 error:(id *)a4;
- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 error:(id *)a5;
- (CKKSTLKShare)share;
- (CKKSTLKShareRecord)initWithShare:(id)a3 contextID:(id)a4 zoneID:(id)a5 encodedCKRecord:(id)a6;
- (NSData)signature;
- (NSData)wrappedTLK;
- (NSString)senderPeerID;
- (NSString)tlkUUID;
- (id)CKRecordName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataForSigning;
- (id)description;
- (id)init:(id)a3 contextID:(id)a4 sender:(id)a5 receiver:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 zoneID:(id)a11 encodedCKRecord:(id)a12;
- (id)initForKey:(id)a3 contextID:(id)a4 senderPeerID:(id)a5 recieverPeerID:(id)a6 receiverEncPublicKeySPKI:(id)a7 curve:(int64_t)a8 version:(unint64_t)a9 epoch:(int64_t)a10 poisoned:(int64_t)a11 wrappedKey:(id)a12 signature:(id)a13 zoneID:(id)a14 encodedCKRecord:(id)a15;
- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 error:(id *)a5;
- (id)signRecord:(id)a3 error:(id *)a4;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (int64_t)epoch;
- (int64_t)poisoned;
- (void)setFromCKRecord:(id)a3;
- (void)setShare:(id)a3;
@end

@implementation CKKSTLKShareRecord

- (CKKSTLKShareRecord)initWithShare:(id)a3 contextID:(id)a4 zoneID:(id)a5 encodedCKRecord:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CKKSTLKShareRecord;
  v12 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v15,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"tlkshare",  a6,  a4,  a5);
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_share, a3);
  }

  return v13;
}

- (id)init:(id)a3 contextID:(id)a4 sender:(id)a5 receiver:(id)a6 curve:(int64_t)a7 version:(unint64_t)a8 epoch:(int64_t)a9 poisoned:(int64_t)a10 zoneID:(id)a11 encodedCKRecord:(id)a12
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a11;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CKKSTLKShareRecord;
  v22 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v26,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"tlkshare",  a12,  a4,  v21);
  if (v22)
  {
    v23 = -[CKKSTLKShare init:sender:receiver:curve:version:epoch:poisoned:zoneID:]( objc_alloc(&OBJC_CLASS___CKKSTLKShare),  "init:sender:receiver:curve:version:epoch:poisoned:zoneID:",  v18,  v19,  v20,  a7,  a8,  a9,  a10,  v21);
    share = v22->_share;
    v22->_share = v23;
  }

  return v22;
}

- (id)initForKey:(id)a3 contextID:(id)a4 senderPeerID:(id)a5 recieverPeerID:(id)a6 receiverEncPublicKeySPKI:(id)a7 curve:(int64_t)a8 version:(unint64_t)a9 epoch:(int64_t)a10 poisoned:(int64_t)a11 wrappedKey:(id)a12 signature:(id)a13 zoneID:(id)a14 encodedCKRecord:(id)a15
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v31 = a12;
  id v24 = a13;
  id v25 = a14;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CKKSTLKShareRecord;
  objc_super v26 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v32,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"tlkshare",  a15,  a4,  v25);
  if (v26)
  {
    v27 = -[CKKSTLKShare initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:]( objc_alloc(&OBJC_CLASS___CKKSTLKShare),  "initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:",  v20,  v21,  v22,  v23,  a8,  a9,  a10,  a11,  v31,  v24,  v25);
    share = v26->_share;
    v26->_share = v27;
  }

  return v26;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tlkUUID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 receiverPeerID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 senderPeerID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 modificationDate]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSTLKShare[%@](%@): recv:%@ send:%@ mod:%@>",  v3,  v5,  v7,  v9,  v11));

  return v12;
}

- (NSString)tlkUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tlkUUID]);

  return (NSString *)v3;
}

- (NSString)senderPeerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 senderPeerID]);

  return (NSString *)v3;
}

- (int64_t)epoch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v3 = [v2 epoch];

  return (int64_t)v3;
}

- (int64_t)poisoned
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v3 = [v2 poisoned];

  return (int64_t)v3;
}

- (NSData)wrappedTLK
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 wrappedTLK]);

  return (NSData *)v3;
}

- (NSData)signature
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 signature]);

  return (NSData *)v3;
}

- (id)dataForSigning
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dataForSigning:v4]);

  return v5;
}

- (id)signRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 signRecord:v6 ckrecord:v8 error:a4]);

  return v9;
}

- (BOOL)verifySignature:(id)a3 verifyingPeer:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  LOBYTE(a5) = [v10 verifySignature:v9 verifyingPeer:v8 ckrecord:v11 error:a5];

  return (char)a5;
}

- (BOOL)signatureVerifiesWithPeerSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  LOBYTE(a4) = [v7 signatureVerifiesWithPeerSet:v6 ckrecord:v8 error:a4];

  return (char)a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class(self) allocWithZone:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v7 = [v6 copyWithZone:a3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  id v11 = [v5 initWithShare:v7 contextID:v8 zoneID:v9 encodedCKRecord:v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKKSTLKShareRecord);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 share]);

    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)recoverTLK:(id)a3 trustedPeers:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 recoverTLK:v9 trustedPeers:v8 ckrecord:v11 error:a5]);

  return v12;
}

- (id)CKRecordName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tlkUUID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 receiverPeerID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 senderPeerID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"tlkshare-%@::%@::%@",  v4,  v6,  v8));

  return v9;
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord CKRecordName](self, "CKRecordName"));
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    unsigned __int8 v13 = [v12 isEqualToString:@"tlkshare"];

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 senderPeerID]);
      [v6 setObject:v15 forKeyedSubscript:@"sender"];

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 receiverPeerID]);
      [v6 setObject:v17 forKeyedSubscript:@"receiver"];

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 receiverPublicEncryptionKeySPKI]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 base64EncodedStringWithOptions:0]);
      [v6 setObject:v20 forKeyedSubscript:@"receiverPublicEncryptionKey"];

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 curve]));
      [v6 setObject:v22 forKeyedSubscript:@"curve"];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v23 version]));
      [v6 setObject:v24 forKeyedSubscript:@"version"];

      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v25 epoch]));
      [v6 setObject:v26 forKeyedSubscript:@"epoch"];

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v27 poisoned]));
      [v6 setObject:v28 forKeyedSubscript:@"poisoned"];

      v29 = objc_alloc(&OBJC_CLASS___CKReference);
      v30 = objc_alloc(&OBJC_CLASS___CKRecordID);
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      objc_super v32 = (void *)objc_claimAutoreleasedReturnValue([v31 tlkUUID]);
      v33 = -[CKRecordID initWithRecordName:zoneID:](v30, "initWithRecordName:zoneID:", v32, v7);
      v34 = -[CKReference initWithRecordID:action:](v29, "initWithRecordID:action:", v33, CKReferenceActionValidate);
      [v6 setObject:v34 forKeyedSubscript:@"parentkeyref"];

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 wrappedTLK]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 base64EncodedStringWithOptions:0]);
      [v6 setObject:v37 forKeyedSubscript:@"wrappedkey"];

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 signature]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 base64EncodedStringWithOptions:0]);
      [v6 setObject:v40 forKeyedSubscript:@"signature"];

      return v6;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v42,  @"tlkshare"));
    id v46 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v47,  0LL));
  }

  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 recordName]);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord CKRecordName](self, "CKRecordName"));
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecord name (%@) was not %@",  v43,  v44));
    id v46 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordNameException",  v45,  0LL));
  }

  objc_exception_throw(v46);
  return (id)-[CKKSTLKShareRecord matchesCKRecord:](v48, v49, v50);
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"tlkshare"];

  if (v6
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]),
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord CKRecordName](self, "CKRecordName")),
        unsigned int v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        v7,
        v10))
  {
    unsigned __int8 v11 = objc_alloc(&OBJC_CLASS___CKKSTLKShareRecord);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
    unsigned __int8 v13 = -[CKKSCKRecordHolder initWithCKRecord:contextID:](v11, "initWithCKRecord:contextID:", v4, v12);

    BOOL v14 = -[CKKSTLKShareRecord isEqual:](self, "isEqual:", v13);
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setFromCKRecord:(id)a3
{
  id v42 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v42 recordType]);
  unsigned __int8 v5 = [v4 isEqualToString:@"tlkshare"];

  if ((v5 & 1) != 0)
  {
    -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v42);
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"receiverPublicEncryptionKey"]);
    v41 = self;
    if (v6
      && (id v7 = (void *)v6,
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
          unsigned __int8 v9 = [v7 isEqual:v8],
          v8,
          v7,
          (v9 & 1) == 0))
    {
      unsigned int v10 = objc_alloc(&OBJC_CLASS___NSData);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"receiverPublicEncryptionKey"]);
      v30 = -[NSData initWithBase64EncodedString:options:](v10, "initWithBase64EncodedString:options:", v11, 0LL);
    }

    else
    {
      v30 = 0LL;
    }

    v12 = objc_alloc(&OBJC_CLASS___CKKSTLKShare);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"parentkeyref"]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v40 recordID]);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v39 recordName]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"sender"]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"receiver"]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"curve"]);
    id v33 = [v38 longValue];
    v37 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"version"]);
    id v32 = [v37 longValue];
    v36 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"epoch"]);
    id v15 = [v36 longValue];
    v34 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"poisoned"]);
    id v16 = [v34 longValue];
    v17 = objc_alloc(&OBJC_CLASS___NSData);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"wrappedkey"]);
    id v18 = -[NSData initWithBase64EncodedString:options:](v17, "initWithBase64EncodedString:options:", v31, 0LL);
    id v19 = objc_alloc(&OBJC_CLASS___NSData);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"signature"]);
    id v21 = -[NSData initWithBase64EncodedString:options:](v19, "initWithBase64EncodedString:options:", v20, 0LL);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v42 recordID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneID]);
    id v24 = -[CKKSTLKShare initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:]( v12,  "initForKey:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:",  v13,  v14,  v35,  v30,  v33,  v32,  v15,  v16,  v18,  v21,  v23);
    -[CKKSTLKShareRecord setShare:](v41, "setShare:", v24);
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v42 recordType]);
    objc_super v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v25,  @"devicestate"));
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v26,  0LL));

    objc_exception_throw(v27);
    -[CKKSTLKShareRecord whereClauseToFindSelf](v28, v29);
  }

- (id)whereClauseToFindSelf
{
  v14[0] = @"uuid";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tlkUUID]);
  v15[0] = v4;
  v14[1] = @"contextID";
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v15[1] = v5;
  v14[2] = @"senderpeerid";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 senderPeerID]);
  v15[2] = v7;
  v14[3] = @"recvpeerid";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 receiverPeerID]);
  v15[3] = v9;
  v14[4] = @"ckzone";
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  v15[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  5LL));

  return v12;
}

- (id)sqlValues
{
  v44[0] = @"uuid";
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v43 tlkUUID]);
  v45[0] = v42;
  v44[1] = @"contextID";
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v45[1] = v41;
  v44[2] = @"senderpeerid";
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v40 senderPeerID]);
  v45[2] = v39;
  v44[3] = @"recvpeerid";
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v38 receiverPeerID]);
  v45[3] = v37;
  v44[4] = @"recvpubenckey";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 receiverPublicEncryptionKeySPKI]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v7 = v6;

  v36 = v7;
  v45[4] = v7;
  v44[5] = @"poisoned";
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v35 poisoned]));
  v45[5] = v34;
  v44[6] = @"epoch";
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v33 epoch]));
  v45[6] = v32;
  v44[7] = @"curve";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v8 curve]));
  v45[7] = v9;
  v44[8] = @"version";
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v10 version]));
  v45[8] = v11;
  v44[9] = @"wrappedkey";
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 wrappedTLK]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);

  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v45[9] = v16;
  v44[10] = @"signature";
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSTLKShareRecord share](self, "share"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 signature]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 base64EncodedStringWithOptions:0]);

  if (v19) {
    id v20 = v19;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v21 = v20;

  v45[10] = v21;
  v44[11] = @"ckzone";
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneName]);

  if (v23) {
    id v24 = v23;
  }
  else {
    id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v25 = v24;

  v45[11] = v25;
  v44[12] = @"ckrecord";
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 base64EncodedStringWithOptions:0]);

  if (v27) {
    id v28 = v27;
  }
  else {
    id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  SEL v29 = v28;

  v45[12] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  13LL));

  return v30;
}

- (CKKSTLKShare)share
{
  return (CKKSTLKShare *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setShare:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)share:(id)a3 contextID:(id)a4 as:(id)a5 to:(id)a6 epoch:(int64_t)a7 poisoned:(int64_t)a8 error:(id *)a9
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 peerID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 peerID]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
  id v35 = 0LL;
  id v20 = v13;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSTLKShareRecord tryFromDatabase:contextID:receiverPeerID:senderPeerID:zoneID:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "tryFromDatabase:contextID:receiverPeerID:senderPeerID:zoneID:error:",  v16,  v13,  v17,  v18,  v19,  &v35));
  id v21 = v35;

  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneName]);
    id v24 = sub_1000AA6AC(@"ckksshare", v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v12;
      __int16 v38 = 2112;
      id v39 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "couldn't load old share for %@: %@",  buf,  0x16u);
    }

    objc_super v26 = 0LL;
    if (a9) {
      *a9 = v21;
    }
  }

  else
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSTLKShare share:as:to:epoch:poisoned:error:]( &OBJC_CLASS___CKKSTLKShare,  "share:as:to:epoch:poisoned:error:",  v12,  v14,  v15,  a7,  a8,  a9));
    if (v27)
    {
      id v28 = objc_alloc(&OBJC_CLASS___CKKSTLKShareRecord);
      SEL v29 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v34 encodedCKRecord]);
      objc_super v26 = -[CKKSTLKShareRecord initWithShare:contextID:zoneID:encodedCKRecord:]( v28,  "initWithShare:contextID:zoneID:encodedCKRecord:",  v27,  v20,  v29,  v30);
    }

    else
    {
      objc_super v26 = 0LL;
    }
  }

  return v26;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v45[0] = @"uuid";
  id v17 = v12;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v46[0] = v20;
  v45[1] = @"contextID";
  id v21 = v13;
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v46[1] = v24;
  v45[2] = @"recvpeerid";
  id v25 = v14;
  objc_super v26 = v25;
  if (v25) {
    id v27 = v25;
  }
  else {
    id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v28 = v27;
  v41 = v24;

  v46[2] = v28;
  v45[3] = @"senderpeerid";
  id v29 = v15;
  v30 = v29;
  id v42 = v20;
  if (v29) {
    id v31 = v29;
  }
  else {
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v32 = v31;

  v46[3] = v32;
  v45[4] = @"ckzone";
  id v33 = v16;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
  id v35 = v34;
  if (v34) {
    id v36 = v34;
  }
  else {
    id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v37 = v36;

  v46[4] = v37;
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  5LL));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v38 error:a8]);

  return v39;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 zoneID:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v45[0] = @"uuid";
  id v17 = v12;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v46[0] = v20;
  v45[1] = @"contextID";
  id v21 = v13;
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v46[1] = v24;
  v45[2] = @"recvpeerid";
  id v25 = v14;
  objc_super v26 = v25;
  if (v25) {
    id v27 = v25;
  }
  else {
    id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v28 = v27;
  v41 = v24;

  v46[2] = v28;
  v45[3] = @"senderpeerid";
  id v29 = v15;
  v30 = v29;
  id v42 = v20;
  if (v29) {
    id v31 = v29;
  }
  else {
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v32 = v31;

  v46[3] = v32;
  v45[4] = @"ckzone";
  id v33 = v16;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
  id v35 = v34;
  if (v34) {
    id v36 = v34;
  }
  else {
    id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v37 = v36;

  v46[4] = v37;
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  5LL));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v38 error:a8]);

  return v39;
}

+ (id)allFor:(id)a3 contextID:(id)a4 keyUUID:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v31[0] = @"recvpeerid";
  id v16 = v12;
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v19 = v18;

  v32[0] = v19;
  v31[1] = @"contextID";
  id v20 = v13;
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v23 = v22;

  v32[1] = v23;
  v32[2] = v14;
  v31[2] = @"uuid";
  v31[3] = @"ckzone";
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
  id v25 = v24;
  if (v24) {
    id v26 = v24;
  }
  else {
    id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v27 = v26;

  v32[3] = v27;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  4LL));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v28 error:a7]);

  return v29;
}

+ (id)allForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = @"uuid";
  id v13 = v10;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v29[0] = v16;
  v28[1] = @"contextID";
  id v17 = v11;
  id v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v20 = v19;

  v29[1] = v20;
  v28[2] = @"ckzone";
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v24 = v23;

  v29[2] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v25 error:a6]);

  return v26;
}

+ (id)allInZone:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v20[0] = @"contextID";
  id v9 = a4;
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v12 = v11;

  v20[1] = @"ckzone";
  v21[0] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v21[1] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v17 error:a5]);

  return v18;
}

+ (id)tryFromDatabaseFromCKRecordID:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v59 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"^tlkshare-(?<uuid>[0-9A-Fa-f-]*)::(?<receiver>.*)::(?<sender>.*)$",  1LL,  &v59));
  id v11 = v59;
  id v12 = v11;
  if (!v11)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v15, "length")));

    if (v16)
    {
      id v56 = a1;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
      id v18 = [v16 rangeWithName:@"uuid"];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringWithRange:", v18, v19));

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
      id v22 = [v16 rangeWithName:@"receiver"];
      id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringWithRange:", v22, v23));

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
      v57 = v16;
      id v26 = [v16 rangeWithName:@"sender"];
      id v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringWithRange:", v26, v27));

      v60[0] = @"uuid";
      id v29 = v20;
      v30 = v29;
      if (v29) {
        id v31 = v29;
      }
      else {
        id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      }
      id v34 = v31;

      v54 = v34;
      v61[0] = v34;
      v60[1] = @"contextID";
      id v35 = v9;
      id v36 = v35;
      id v58 = v9;
      if (v35) {
        id v37 = v35;
      }
      else {
        id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      }
      id v38 = v37;

      v61[1] = v38;
      v60[2] = @"recvpeerid";
      id v39 = v24;
      id v33 = v39;
      if (v39) {
        id v40 = v39;
      }
      else {
        id v40 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      }
      id v41 = v40;
      v53 = v38;
      v55 = v30;

      v61[2] = v41;
      v60[3] = @"senderpeerid";
      id v42 = v28;
      v43 = v42;
      v52 = v41;
      if (v42) {
        id v44 = v42;
      }
      else {
        id v44 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      }
      v45 = v44;

      v61[3] = v45;
      v60[4] = @"ckzone";
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 zoneName]);

      if (v47) {
        id v48 = v47;
      }
      else {
        id v48 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      }
      SEL v49 = v48;

      v61[4] = v49;
      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  5LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v56 tryFromDatabaseWhere:v50 error:a5]);

      id v16 = v57;
      id v32 = v55;
    }

    else
    {
      if (!a5)
      {
        id v13 = 0LL;
        goto LABEL_25;
      }

      id v58 = v9;
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't parse '%@' as a TLKShare ID",  v32));
      id v13 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  22LL,  v33));
    }

    id v9 = v58;
LABEL_25:

    goto LABEL_26;
  }

  id v13 = 0LL;
  if (a5) {
    *a5 = v11;
  }
LABEL_26:

  return v13;
}

+ (id)ckrecordPrefix
{
  return @"tlkshare";
}

+ (id)sqlTable
{
  return @"tlkshare";
}

+ (id)sqlColumns
{
  return &off_1002AE718;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 asString]);
  id v34 = -[CKRecordZoneID initWithZoneName:ownerName:](v4, "initWithZoneName:ownerName:", v6, CKCurrentUserDefaultName);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"curve"]);
  id v29 = [v7 asNSInteger];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"version"]);
  id v9 = [v8 asNSInteger];

  id v10 = objc_alloc(&OBJC_CLASS___CKKSTLKShareRecord);
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"uuid"]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 asString]);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v31 asString]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"senderpeerid"]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v28 asString]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"recvpeerid"]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v27 asString]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"recvpubenckey"]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v26 asBase64DecodedData]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"epoch"]);
  id v11 = [v24 asNSInteger];
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"poisoned"]);
  id v12 = [v21 asNSInteger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"wrappedkey"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 asBase64DecodedData]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"signature"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 asBase64DecodedData]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckrecord"]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 asBase64DecodedData]);
  id v30 = -[CKKSTLKShareRecord initForKey:contextID:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrappedKey:signature:zoneID:encodedCKRecord:]( v10,  "initForKey:contextID:senderPeerID:recieverPeerID:receiverEncPublicKeySPKI:curve:version:epoch:poisoned:wrapped Key:signature:zoneID:encodedCKRecord:",  v33,  v25,  v23,  v22,  v20,  v29,  v9,  v11,  v12,  v14,  v16,  v34,  v18);

  return v30;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSTLKShareRecord),  "initWithCKRecord:contextID:",  v8,  v9);

  id v19 = 0LL;
  unsigned __int8 v11 = -[CKKSSQLDatabaseObject saveToDatabase:](v10, "saveToDatabase:", &v19);
  id v12 = v19;
  if (v12) {
    unsigned __int8 v11 = 0;
  }
  if ((v11 & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
    id v16 = sub_1000AA6AC(@"ckksshare", v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Couldn't save new TLK share to database: %@ %@",  buf,  0x16u);
    }

    if (a6) {
      *a6 = v12;
    }
  }

  return v11;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"ckksshare", v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = @"tlkshare";
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CloudKit notification: deleted tlk share record(%@): %@",  buf,  0x16u);
  }

  id v23 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSTLKShareRecord tryFromDatabaseFromCKRecordID:contextID:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "tryFromDatabaseFromCKRecordID:contextID:error:",  v8,  v9,  &v23));

  id v15 = v23;
  id v22 = v15;
  [v14 deleteFromDatabase:&v22];
  id v16 = (__CFString *)v22;

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
    id v19 = sub_1000AA6AC(@"ckksshare", v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CK notification: Couldn't delete deleted TLKShare: %@ %@",  buf,  0x16u);
    }

    if (a6) {
      *a6 = v16;
    }
  }

  return v16 == 0LL;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10015E8E4;
  id v24 = sub_10015E8F4;
  id v25 = 0LL;
  id v10 = [(id)objc_opt_class(a1) sqlTable];
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v27[0] = v8;
  v26[0] = @"contextID";
  v26[1] = @"ckzone";
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v15 = v14;

  v27[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  v19[1] = 3221225472LL;
  v19[2] = sub_10015E8FC;
  v19[3] = &unk_100290E08;
  v19[4] = &v20;
  v19[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v11,  v16,  &off_1002AE730,  0LL,  0LL,  -1LL,  v19,  a5);

  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

@end