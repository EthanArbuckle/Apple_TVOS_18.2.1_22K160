@interface IDSPeerMessage
- (BOOL)fireAndForget;
- (IDSPeerMessage)init;
- (IDSPeerMessage)initWithHighPriority:(BOOL)a3;
- (NSData)encryptedData;
- (NSData)targetSessionToken;
- (NSData)targetToken;
- (NSDate)expirationDate;
- (NSDictionary)additionalDictionary;
- (NSNumber)deliveryMinimumTime;
- (NSNumber)deliveryMinimumTimeDelay;
- (NSNumber)priority;
- (NSNumber)sendMode;
- (NSString)encryptionType;
- (NSString)messageID;
- (NSString)sourcePeerID;
- (NSString)sourceShortHandle;
- (NSString)targetPeerID;
- (NSString)targetShortHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setAdditionalDictionary:(id)a3;
- (void)setDeliveryMinimumTime:(id)a3;
- (void)setDeliveryMinimumTimeDelay:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setMessageID:(id)a3;
- (void)setPriority:(id)a3;
- (void)setSendMode:(id)a3;
- (void)setSourcePeerID:(id)a3;
- (void)setSourceShortHandle:(id)a3;
- (void)setTargetPeerID:(id)a3;
- (void)setTargetSessionToken:(id)a3;
- (void)setTargetShortHandle:(id)a3;
- (void)setTargetToken:(id)a3;
@end

@implementation IDSPeerMessage

- (IDSPeerMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSPeerMessage;
  v2 = -[IDSPeerMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSPeerMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }
  return v3;
}

- (IDSPeerMessage)initWithHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = -[IDSPeerMessage init](self, "init");
  objc_super v5 = v4;
  if (v4)
  {
    -[IDSPeerMessage setHighPriority:](v4, "setHighPriority:", v3);
    if (!v3) {
      -[IDSPeerMessage setTimeout:](v5, "setTimeout:", 1200.0);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSPeerMessage;
  id v4 = -[IDSPeerMessage copyWithZone:](&v21, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage priority](self, "priority"));
  [v4 setPriority:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage encryptionType](self, "encryptionType"));
  [v4 setEncryptionType:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage encryptedData](self, "encryptedData"));
  [v4 setEncryptedData:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetPeerID](self, "targetPeerID"));
  [v4 setTargetPeerID:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetShortHandle](self, "targetShortHandle"));
  [v4 setTargetShortHandle:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sourcePeerID](self, "sourcePeerID"));
  [v4 setSourcePeerID:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sourceShortHandle](self, "sourceShortHandle"));
  [v4 setSourceShortHandle:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetToken](self, "targetToken"));
  [v4 setTargetToken:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetSessionToken](self, "targetSessionToken"));
  [v4 setTargetSessionToken:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage expirationDate](self, "expirationDate"));
  [v4 setExpirationDate:v14];

  objc_msgSend(v4, "setFireAndForget:", -[IDSPeerMessage fireAndForget](self, "fireAndForget"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage additionalDictionary](self, "additionalDictionary"));
  [v4 setAdditionalDictionary:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage messageID](self, "messageID"));
  [v4 setMessageID:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage deliveryMinimumTimeDelay](self, "deliveryMinimumTimeDelay"));
  [v4 setDeliveryMinimumTimeDelay:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage deliveryMinimumTime](self, "deliveryMinimumTime"));
  [v4 setDeliveryMinimumTime:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sendMode](self, "sendMode"));
  [v4 setSendMode:v19];

  return v4;
}

- (id)requiredKeys
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSPeerMessage;
  id v2 = -[IDSPeerMessage requiredKeys](&v6, "requiredKeys");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (NSMutableArray *)[v3 mutableCopy];

  if (!v4) {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  -[NSMutableArray addObject:](v4, "addObject:", @"sP");
  -[NSMutableArray addObject:](v4, "addObject:", @"t");
  -[NSMutableArray addObject:](v4, "addObject:", @"sT");
  return v4;
}

- (id)messageBody
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___IDSPeerMessage;
  id v3 = -[IDSPeerMessage messageBody](&v45, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage messageID](self, "messageID"));
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)[v6 UTF8String];
    if (v8)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v8, uu);
      id v44 = 0LL;
      jw_uuid_to_data(uu, &v44);
      id v9 = v44;
      if (v9) {
        CFDictionarySetValue(Mutable, @"U", v9);
      }
    }
  }

  additionalDictionary = self->_additionalDictionary;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000F8074;
  v42[3] = &unk_1008F8418;
  v11 = Mutable;
  v43 = v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](additionalDictionary, "enumerateKeysAndObjectsUsingBlock:", v42);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sourcePeerID](self, "sourcePeerID"));
  if (v12)
  {
    CFDictionarySetValue(v11, @"sP", v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069B090();
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sourceShortHandle](self, "sourceShortHandle"));
  if (v13) {
    CFDictionarySetValue(v11, @"sPs", v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetPeerID](self, "targetPeerID"));
  if (v14) {
    CFDictionarySetValue(v11, @"tP", v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetShortHandle](self, "targetShortHandle"));
  if (v15) {
    CFDictionarySetValue(v11, @"tPs", v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetSessionToken](self, "targetSessionToken"));
  if (v16) {
    CFDictionarySetValue(v11, @"sT", v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage targetToken](self, "targetToken"));
  if (v17) {
    CFDictionarySetValue(v11, @"t", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage encryptedData](self, "encryptedData"));
  if (v18) {
    CFDictionarySetValue(v11, @"P", v18);
  }

  if (-[IDSPeerMessage fireAndForget](self, "fireAndForget"))
  {
    CFDictionarySetValue(v11, IDSExpirationDateKey, &off_100946C78);
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage expirationDate](self, "expirationDate"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage expirationDate](self, "expirationDate"));
      [v20 timeIntervalSince1970];
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v21));

      if (v22) {
        CFDictionarySetValue(v11, IDSExpirationDateKey, v22);
      }
    }
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[IDSPeerMessage encryptionType](self, "encryptionType"));
  if (v23)
  {
    v24 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage encryptionType](self, "encryptionType"));
    uint64_t v26 = IDSEncryptionTypeStringFromEncryptionType(2LL);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unsigned __int8 v28 = [v25 isEqualToIgnoringCase:v27];

    if ((v28 & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage encryptionType](self, "encryptionType"));
      if (v29) {
        CFDictionarySetValue(v11, @"E", v29);
      }
    }
  }

  uint64_t v30 = objc_claimAutoreleasedReturnValue(-[IDSPeerMessage priority](self, "priority"));
  if (v30)
  {
    v31 = (void *)v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage priority](self, "priority"));
    unsigned int v33 = [v32 intValue];

    if (v33 != 10)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage priority](self, "priority"));
      if (v34) {
        CFDictionarySetValue(v11, @"pri", v34);
      }
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage deliveryMinimumTimeDelay](self, "deliveryMinimumTimeDelay"));

  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage deliveryMinimumTimeDelay](self, "deliveryMinimumTimeDelay"));
    if (v36) {
      CFDictionarySetValue(v11, IDSDeliveryMinimumTimeDelayKey, v36);
    }
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage deliveryMinimumTime](self, "deliveryMinimumTime"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage deliveryMinimumTime](self, "deliveryMinimumTime"));
    if (v38) {
      CFDictionarySetValue(v11, IDSDeliveryMinimumTimeKey, v38);
    }
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sendMode](self, "sendMode"));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerMessage sendMode](self, "sendMode"));
    if (v40) {
      CFDictionarySetValue(v11, IDSDeliverySendModeKey, v40);
    }
  }

  return v11;
}

- (NSNumber)priority
{
  return (NSNumber *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setPriority:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setEncryptionType:(id)a3
{
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setEncryptedData:(id)a3
{
}

- (NSData)targetToken
{
  return (NSData *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setTargetToken:(id)a3
{
}

- (NSString)targetPeerID
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setTargetPeerID:(id)a3
{
}

- (NSString)sourcePeerID
{
  return (NSString *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setSourcePeerID:(id)a3
{
}

- (NSData)targetSessionToken
{
  return (NSData *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setTargetSessionToken:(id)a3
{
}

- (NSString)messageID
{
  return (NSString *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setMessageID:(id)a3
{
}

- (NSDictionary)additionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setAdditionalDictionary:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (NSNumber)deliveryMinimumTimeDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
}

- (NSNumber)deliveryMinimumTime
{
  return (NSNumber *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setDeliveryMinimumTime:(id)a3
{
}

- (NSNumber)sendMode
{
  return (NSNumber *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setSendMode:(id)a3
{
}

- (NSString)targetShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setTargetShortHandle:(id)a3
{
}

- (NSString)sourceShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 376LL, 1);
}

- (void)setSourceShortHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end