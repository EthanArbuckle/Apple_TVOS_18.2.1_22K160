@interface IDSPeerAggregatableMessage
- (BOOL)wantsCertifiedDelivery;
- (IDSPeerAggregatableMessage)initWithTargetToken:(id)a3 sessionToken:(id)a4 targetPeerID:(id)a5 encryptedData:(id)a6 wantsDeliveryStatus:(BOOL)a7 wantsCertifiedDelivery:(BOOL)a8 ackBlock:(id)a9 completionBlock:(id)a10;
- (IDSPushToken)targetToken;
- (IDSURI)targetPeerID;
- (NSData)encryptedData;
- (NSData)payloadMetadata;
- (NSData)targetSessionToken;
- (NSDate)expirationDate;
- (NSNumber)command;
- (NSNumber)dataLength;
- (NSNumber)wantsDeliveryStatus;
- (NSString)anonymizedSenderID;
- (NSString)encryptionType;
- (NSString)senderShortHandle;
- (NSString)targetShortHandle;
- (id)ackBlock;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)sizeOfKeysWithValues;
- (void)setAckBlock:(id)a3;
- (void)setAnonymizedSenderID:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDataLength:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setPayloadMetadata:(id)a3;
- (void)setSenderShortHandle:(id)a3;
- (void)setTargetPeerID:(id)a3;
- (void)setTargetSessionToken:(id)a3;
- (void)setTargetShortHandle:(id)a3;
- (void)setTargetToken:(id)a3;
- (void)setWantsCertifiedDelivery:(BOOL)a3;
- (void)setWantsDeliveryStatus:(id)a3;
@end

@implementation IDSPeerAggregatableMessage

- (IDSPeerAggregatableMessage)initWithTargetToken:(id)a3 sessionToken:(id)a4 targetPeerID:(id)a5 encryptedData:(id)a6 wantsDeliveryStatus:(BOOL)a7 wantsCertifiedDelivery:(BOOL)a8 ackBlock:(id)a9 completionBlock:(id)a10
{
  BOOL v29 = a7;
  id v31 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = a10;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___IDSPeerAggregatableMessage;
  v20 = -[IDSPeerAggregatableMessage init](&v32, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_targetToken, a3);
    objc_storeStrong((id *)&v21->_targetSessionToken, a4);
    objc_storeStrong((id *)&v21->_targetPeerID, a5);
    objc_storeStrong((id *)&v21->_encryptedData, a6);
    id v22 = objc_retainBlock(v18);
    id ackBlock = v21->_ackBlock;
    v21->_id ackBlock = v22;

    id v24 = objc_retainBlock(v19);
    id completionBlock = v21->_completionBlock;
    v21->_id completionBlock = v24;

    if (v29)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      wantsDeliveryStatus = v21->_wantsDeliveryStatus;
      v21->_wantsDeliveryStatus = (NSNumber *)v26;
    }

    v21->_wantsCertifiedDelivery = a8;
  }

  return v21;
}

- (id)dictionaryRepresentation
{
  Mutable = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!Mutable) {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetToken](self, "targetToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rawToken]);

  if (v5)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"t", v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069C7AC();
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetSessionToken](self, "targetSessionToken"));
  if (v6)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"sT", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069C72C();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetPeerID](self, "targetPeerID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);

  if (v8)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"tP", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069C6AC();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetShortHandle](self, "targetShortHandle"));
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"tPs", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage senderShortHandle](self, "senderShortHandle"));
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"sTs", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage encryptedData](self, "encryptedData"));
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"P", v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069C62C();
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage wantsDeliveryStatus](self, "wantsDeliveryStatus"));
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"D", v12);
  }

  if (-[IDSPeerAggregatableMessage wantsCertifiedDelivery](self, "wantsCertifiedDelivery"))
  {
    v13 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", _IDSCertifiedDeliveryVersion());
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, IDSCertifiedDeliveryVersionKey, v14);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage anonymizedSenderID](self, "anonymizedSenderID"));
  if (v15) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"sI", v15);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage encryptionType](self, "encryptionType"));
  if (v16) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"E", v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage payloadMetadata](self, "payloadMetadata"));
  if (v17) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"Pm", v17);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage dataLength](self, "dataLength"));
  if (v18) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"mT", v18);
  }

  return Mutable;
}

- (unint64_t)sizeOfKeysWithValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage encryptedData](self, "encryptedData"));
  id v4 = [v3 length];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetToken](self, "targetToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rawToken]);
  id v7 = [v6 length];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetSessionToken](self, "targetSessionToken"));
  id v9 = [v8 length];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetPeerID](self, "targetPeerID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 prefixedURI]);
  id v12 = [v11 lengthOfBytesUsingEncoding:4];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage payloadMetadata](self, "payloadMetadata"));
  id v14 = [v13 length];

  return (unint64_t)v7 + (unint64_t)v9 + (void)v4 + (unint64_t)v14 + (void)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class(self, a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage encryptedData](self, "encryptedData"));
  [v4 setEncryptedData:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetPeerID](self, "targetPeerID"));
  [v4 setTargetPeerID:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetToken](self, "targetToken"));
  [v4 setTargetToken:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetSessionToken](self, "targetSessionToken"));
  [v4 setTargetSessionToken:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage targetShortHandle](self, "targetShortHandle"));
  [v4 setTargetShortHandle:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage senderShortHandle](self, "senderShortHandle"));
  [v4 setSenderShortHandle:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage completionBlock](self, "completionBlock"));
  [v4 setCompletionBlock:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage ackBlock](self, "ackBlock"));
  [v4 setAckBlock:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage wantsDeliveryStatus](self, "wantsDeliveryStatus"));
  [v4 setWantsDeliveryStatus:v13];

  objc_msgSend( v4,  "setWantsCertifiedDelivery:",  -[IDSPeerAggregatableMessage wantsCertifiedDelivery](self, "wantsCertifiedDelivery"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage anonymizedSenderID](self, "anonymizedSenderID"));
  [v4 setAnonymizedSenderID:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage encryptionType](self, "encryptionType"));
  [v4 setEncryptionType:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregatableMessage payloadMetadata](self, "payloadMetadata"));
  [v4 setPayloadMetadata:v16];

  [v4 setCommand:self->_command];
  [v4 setDataLength:self->_dataLength];
  [v4 setExpirationDate:self->_expirationDate];
  return v4;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (IDSPushToken)targetToken
{
  return (IDSPushToken *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTargetToken:(id)a3
{
}

- (IDSURI)targetPeerID
{
  return (IDSURI *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTargetPeerID:(id)a3
{
}

- (NSString)anonymizedSenderID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAnonymizedSenderID:(id)a3
{
}

- (NSData)targetSessionToken
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTargetSessionToken:(id)a3
{
}

- (NSNumber)wantsDeliveryStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setWantsDeliveryStatus:(id)a3
{
}

- (BOOL)wantsCertifiedDelivery
{
  return self->_wantsCertifiedDelivery;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  self->_wantsCertifiedDelivery = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)ackBlock
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAckBlock:(id)a3
{
}

- (NSString)targetShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setTargetShortHandle:(id)a3
{
}

- (NSString)senderShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setSenderShortHandle:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setEncryptionType:(id)a3
{
}

- (NSData)payloadMetadata
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setPayloadMetadata:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSNumber)dataLength
{
  return (NSNumber *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDataLength:(id)a3
{
}

- (NSNumber)command
{
  return (NSNumber *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end