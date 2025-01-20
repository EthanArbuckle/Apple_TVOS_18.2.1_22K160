@interface AuthenticationService
+ (id)UUID;
+ (void)initialize;
- (AuthenticationService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (BOOL)verifyCertificateIsUnique;
- (CBCharacteristic)certificate1Characteristic;
- (CBCharacteristic)certificate2Characteristic;
- (CBCharacteristic)challengeResponseCharacteristic;
- (CBCharacteristic)versionCharacteristic;
- (NSTimer)authTimer;
- (__CFDictionary)authInfo;
- (id)authStateString;
- (id)certificateSerialNumber;
- (int64_t)authState;
- (void)authTimeout;
- (void)authenticationDidFail;
- (void)authenticationDidSucceed;
- (void)dealloc;
- (void)issueChallenge;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setAuthInfo:(__CFDictionary *)a3;
- (void)setAuthState:(int64_t)a3;
- (void)setAuthTimer:(id)a3;
- (void)setCertificate1Characteristic:(id)a3;
- (void)setCertificate2Characteristic:(id)a3;
- (void)setChallengeResponseCharacteristic:(id)a3;
- (void)setVersionCharacteristic:(id)a3;
- (void)start;
- (void)stop;
- (void)verifyChallenge;
@end

@implementation AuthenticationService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"8341F2B4-C013-4F04-8197-C4CDB42E26DC");
}

- (AuthenticationService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AuthenticationService;
  v5 = -[ClientService initWithManager:peripheral:service:](&v8, "initWithManager:peripheral:service:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ClientService setIsPrimary:](v5, "setIsPrimary:", 1LL);
    -[ClientService setPriority:](v6, "setPriority:", 4LL);
    -[ClientService setStartTimeout:](v6, "setStartTimeout:", 0.0);
    v6->_authState = 0LL;
    v6->_authInfo = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }

  return v6;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AuthenticationService;
  -[ClientService start](&v12, "start");
  [(id)qword_100070CB8 addObject:self];
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"9FBF120D-6301-42D9-8C58-25E699A21DBD"));
  v13[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"0188BF66-463A-405D-91FD-0B8940B92254"));
  v13[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"2BDCAEBE-8746-45DF-A841-96B840980FB7"));
  v13[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"2BDCAEBE-8746-45DF-A841-96B840980FB8"));
  v13[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"30E69638-3752-4FEB-A3AA-3226BCD05ACE"));
  v13[4] = v7;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 5LL));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService service](self, "service"));
  [v9 discoverCharacteristics:v8 forService:v10];

  -[AuthenticationService setAuthState:](self, "setAuthState:", 1LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "authTimeout",  0LL,  0LL,  90.0));
  -[AuthenticationService setAuthTimer:](self, "setAuthTimer:", v11);
}

- (void)stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService authTimer](self, "authTimer"));
  [v3 invalidate];

  [(id)qword_100070CB8 removeObject:self];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AuthenticationService;
  -[ClientService stop](&v4, "stop");
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___AuthenticationService, a2) == a1)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v3 = (void *)qword_100070CB8;
    qword_100070CB8 = (uint64_t)v2;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AuthenticationService;
  -[AuthenticationService dealloc](&v3, "dealloc");
}

- (void)issueChallenge
{
  id v37 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v37 value]);
  if (!v3) {
    goto LABEL_9;
  }
  objc_super v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 value]);
  if (!v6)
  {

LABEL_9:
    return;
  }

  v7 = (void *)v6;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);

  if (!v9) {
    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[DataInputStream inputStreamWithData:byteOrder:]( &OBJC_CLASS___DataInputStream,  "inputStreamWithData:byteOrder:",  v11,  1LL));

  __int16 v40 = 0;
  if (([v12 readUint16:&v40] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003D494();
    }
    goto LABEL_25;
  }

  if (v40 == 512)
  {
    int v13 = 2;
    uint64_t v14 = 20LL;
  }

  else
  {
    if (v40 != 768)
    {
      v36 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003D1E8(v36, self);
      }
      goto LABEL_25;
    }

    int v13 = 3;
    uint64_t v14 = 32LL;
  }

  int valuePtr = v13;
  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  id v17 = objc_claimAutoreleasedReturnValue([v16 value]);
  v18 = (const UInt8 *)[v17 bytes];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
  CFDataAppendBytes(Mutable, v18, (CFIndex)[v20 length]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
  id v22 = objc_claimAutoreleasedReturnValue([v21 value]);
  v23 = (const UInt8 *)[v22 bytes];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 value]);
  CFDataAppendBytes(Mutable, v23, (CFIndex)[v25 length]);

  v26 = -[AuthenticationService authInfo](self, "authInfo");
  CFDictionarySetValue(v26, kAuthCertBufferKey, Mutable);
  CFRelease(Mutable);
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003D3F0();
  }
  if (VerifyCertSerialNumber(Mutable)
    && VerifyCertAuthority(Mutable)
    && -[AuthenticationService verifyCertificateIsUnique](self, "verifyCertificateIsUnique"))
  {
    value = 0LL;
    GetRandomDigest(v14, &value);
    v27 = -[AuthenticationService authInfo](self, "authInfo");
    CFDictionarySetValue(v27, kAuthNonceBufferKey, value);
    CFRelease(value);
    CFNumberRef v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
    v29 = -[AuthenticationService authInfo](self, "authInfo");
    CFDictionarySetValue(v29, kAuthVersionKey, v28);
    CFRelease(v28);
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003D2B8();
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    [v30 setNotifyValue:1 forCharacteristic:v31];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v33 = value;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    [v32 writeValue:v33 forCharacteristic:v34 type:0];

    -[AuthenticationService setAuthState:](self, "setAuthState:", 2LL);
    -[ClientService notifyDidStart](self, "notifyDidStart");
    goto LABEL_26;
  }

  v35 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003D35C(v35);
  }
LABEL_25:
  -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
LABEL_26:
}

- (void)verifyChallenge
{
  if ((id)-[AuthenticationService authState](self, "authState") == (id)2)
  {
    uint64_t v3 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003D4C0(v3);
    }
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    [v4 readValueForCharacteristic:v5];

    -[AuthenticationService setAuthState:](self, "setAuthState:", 3LL);
  }

  else if ((id)-[AuthenticationService authState](self, "authState") == (id)3)
  {
    uint64_t v6 = -[AuthenticationService authInfo](self, "authInfo");
    v7 = (const void *)kAuthResponseBufferKey;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
    CFDictionarySetValue(v6, v7, v9);

    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
      sub_10003D5F8();
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService authTimer](self, "authTimer"));
    [v10 invalidate];

    -[AuthenticationService setAuthState:](self, "setAuthState:", 4LL);
    v11 = (void *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = v11;
      int v18 = 138412290;
      v19 = -[AuthenticationService authInfo](self, "authInfo");
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "About to verify nonce with dictionary %@",  (uint8_t *)&v18,  0xCu);
    }

    int v13 = VerifyNonceSigned(-[AuthenticationService authInfo](self, "authInfo"));
    uint64_t v14 = (void *)qword_100070CC8;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
        id v17 = (__CFDictionary *)objc_claimAutoreleasedReturnValue([v16 name]);
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Authentication has succeeded on peripheral \"%@\"",  (uint8_t *)&v18,  0xCu);
      }

      -[AuthenticationService authenticationDidSucceed](self, "authenticationDidSucceed");
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003D564(v14);
      }
      -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
    }
  }

- (void)authTimeout
{
  int64_t v3 = -[AuthenticationService authState](self, "authState");
  objc_super v4 = (void *)qword_100070CC8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR);
  if (v3 == 2)
  {
    if (v5) {
      sub_10003D69C(v4);
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));
    [v6 readValueForCharacteristic:v7];

    -[AuthenticationService setAuthState:](self, "setAuthState:", 3LL);
  }

  else
  {
    if (v5) {
      sub_10003D730(v4, self);
    }
    -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
  }

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v39 = a3;
  if (!a5)
  {
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([a4 characteristics]);
    id v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v42;
      v38 = self;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v11);
          int v13 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
          if (v13)
          {
          }

          else
          {
            id v15 = v9;
            v16 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"9FBF120D-6301-42D9-8C58-25E699A21DBD"));
            if ([v16 isEqual:v17])
            {

              id v9 = v15;
LABEL_22:
              -[AuthenticationService setVersionCharacteristic:](self, "setVersionCharacteristic:", v12);
              goto LABEL_23;
            }

            v26 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
            v27 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"0188BF66-463A-405D-91FD-0B8940B92254"));
            unsigned int v28 = [v26 isEqual:v27];

            self = v38;
            id v9 = v15;
            if (v28) {
              goto LABEL_22;
            }
          }

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
          if (v14)
          {
          }

          else
          {
            int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
            v19 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"2BDCAEBE-8746-45DF-A841-96B840980FB7"));
            unsigned int v20 = [v18 isEqual:v19];

            if (v20)
            {
              -[AuthenticationService setCertificate1Characteristic:](self, "setCertificate1Characteristic:", v12);
              goto LABEL_23;
            }
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));
          if (v21)
          {

LABEL_19:
            v25 = (void *)objc_claimAutoreleasedReturnValue( -[AuthenticationService challengeResponseCharacteristic]( self,  "challengeResponseCharacteristic"));
            if (v25)
            {
            }

            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
              v31 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"30E69638-3752-4FEB-A3AA-3226BCD05ACE"));
              unsigned int v32 = [v30 isEqual:v31];

              if (v32) {
                -[AuthenticationService setChallengeResponseCharacteristic:]( self,  "setChallengeResponseCharacteristic:",  v12);
              }
            }

            goto LABEL_27;
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[CBUUID UUIDWithString:]( &OBJC_CLASS___CBUUID,  "UUIDWithString:",  @"2BDCAEBE-8746-45DF-A841-96B840980FB8"));
          unsigned int v24 = [v22 isEqual:v23];

          if (!v24) {
            goto LABEL_19;
          }
          -[AuthenticationService setCertificate2Characteristic:](self, "setCertificate2Characteristic:", v12);
LABEL_23:
          v29 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);

          if (!v29) {
            [v39 readValueForCharacteristic:v12];
          }
LABEL_27:
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }

      while (v9);
    }

    -[AuthenticationService issueChallenge](self, "issueChallenge");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));

    if (!v33 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003D840();
    }
    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
    if (!v34
      || (v35 = (void *)v34,
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic")),
          v36,
          v35,
          !v36))
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003D814();
      }
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));

    if (!v37 && os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
      sub_10003D7E8();
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));

    if (v11 == v9)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003D86C();
      }
      -[AuthenticationService authenticationDidFail](self, "authenticationDidFail");
    }

    goto LABEL_14;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[AuthenticationService versionCharacteristic](self, "versionCharacteristic"));
  int v13 = v9;
  if ((id)v12 == v9) {
    goto LABEL_12;
  }
  uint64_t v14 = (void *)v12;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate1Characteristic](self, "certificate1Characteristic"));
  if ((id)v15 == v9)
  {

    int v13 = v14;
LABEL_12:

    goto LABEL_13;
  }

  v16 = (void *)v15;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificate2Characteristic](self, "certificate2Characteristic"));

  if (v17 == v9)
  {
LABEL_13:
    -[AuthenticationService issueChallenge](self, "issueChallenge");
    goto LABEL_14;
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue(-[AuthenticationService challengeResponseCharacteristic](self, "challengeResponseCharacteristic"));

  if (v18 == v9) {
    -[AuthenticationService verifyChallenge](self, "verifyChallenge");
  }
LABEL_14:
}

- (id)certificateSerialNumber
{
  v2 = -[AuthenticationService authInfo](self, "authInfo");
  Value = (const __CFData *)CFDictionaryGetValue(v2, kAuthCertBufferKey);
  if (Value)
  {
    objc_super v4 = Value;
    v11[0] = 0LL;
    v11[1] = 0LL;
    id v10 = v11;
    uint64_t v9 = 16LL;
    BytePtr = CFDataGetBytePtr(Value);
    CFIndex Length = CFDataGetLength(v4);
    int v7 = IapAuthCertSerial(BytePtr, Length, &v10, &v9);
    Value = 0LL;
    if (v7) {
      Value = (const __CFData *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v11,  v9));
    }
  }

  return Value;
}

- (BOOL)verifyCertificateIsUnique
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AuthenticationService certificateSerialNumber](self, "certificateSerialNumber"));
  char v4 = v3 != 0LL;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (id)qword_100070CB8;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(AuthenticationService **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (v10 != self)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue(-[AuthenticationService certificateSerialNumber](v10, "certificateSerialNumber", (void)v14));
          uint64_t v12 = (void *)v11;
          if (v11) {
            LOBYTE(v11) = [v3 isEqualToData:v11];
          }
          v4 &= v11 ^ 1;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4 & 1;
}

- (void)authenticationDidSucceed
{
  int64_t v3 = -[AuthenticationService authInfo](self, "authInfo");
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", kAuthVersionKey));
  int v5 = [v4 intValue];
  uint64_t CertClass = 0x7FFFFFFFLL;
  if (v5 <= 2
    && (id v7 = -[AuthenticationService authInfo](self, "authInfo", 0x7FFFFFFFLL),
        Value = CFDictionaryGetValue(v7, kAuthCertBufferKey),
        uint64_t CertClass = GetCertClass(Value),
        (_DWORD)CertClass == 0x7FFFFFFF))
  {
    -[AuthenticationService authenticationDidFail](self, "authenticationDidFail", CertClass);
  }

  else
  {
    v13[0] = @"AuthenticationServiceCertClassUserInfoKey";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", CertClass));
    v13[1] = @"AuthenticationServiceAuthVersionKey";
    v14[0] = v9;
    v14[1] = v4;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
    [v11 postNotificationName:@"AuthenticationServiceAuthDidSucceedNotification" object:v12 userInfo:v10];
  }
}

- (void)authenticationDidFail
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService peripheral](self, "peripheral"));
  [v4 postNotificationName:@"AuthenticationServiceAuthDidFailNotification" object:v3];
}

- (id)authStateString
{
  int64_t v2 = -[AuthenticationService authState](self, "authState");
  else {
    return off_10005D718[v2 - 1];
  }
}

- (CBCharacteristic)versionCharacteristic
{
  return self->_versionCharacteristic;
}

- (void)setVersionCharacteristic:(id)a3
{
}

- (CBCharacteristic)certificate1Characteristic
{
  return self->_certificate1Characteristic;
}

- (void)setCertificate1Characteristic:(id)a3
{
}

- (CBCharacteristic)certificate2Characteristic
{
  return self->_certificate2Characteristic;
}

- (void)setCertificate2Characteristic:(id)a3
{
}

- (CBCharacteristic)challengeResponseCharacteristic
{
  return self->_challengeResponseCharacteristic;
}

- (void)setChallengeResponseCharacteristic:(id)a3
{
}

- (int64_t)authState
{
  return self->_authState;
}

- (void)setAuthState:(int64_t)a3
{
  self->_authState = a3;
}

- (__CFDictionary)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(__CFDictionary *)a3
{
  self->_authInfo = a3;
}

- (NSTimer)authTimer
{
  return self->_authTimer;
}

- (void)setAuthTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end