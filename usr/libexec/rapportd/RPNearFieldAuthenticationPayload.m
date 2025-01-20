@interface RPNearFieldAuthenticationPayload
+ (id)_authTagWithSelfIdentity:(id)a3 data:(id)a4;
+ (id)_signatureWithSelfIdentity:(id)a3 data:(id)a4;
- (BOOL)isValidTimeStamp;
- (BOOL)isValidTimeStampSince:(id)a3;
- (BOOL)verifyWithIdentity:(id)a3;
- (NSData)authTag;
- (NSData)pkData;
- (NSData)signatureData;
- (NSDate)timeStamp;
- (NSUUID)bonjourListenerUUID;
- (RPNearFieldAuthenticationPayload)initWithDictionary:(id)a3;
- (RPNearFieldAuthenticationPayload)initWithTimeStamp:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5 selfIdentity:(id)a6;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
@end

@implementation RPNearFieldAuthenticationPayload

- (RPNearFieldAuthenticationPayload)initWithTimeStamp:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5 selfIdentity:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___RPNearFieldAuthenticationPayload;
  v15 = -[RPNearFieldMessagePayload initWithType:](&v40, "initWithType:", 1LL);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeStamp, a3);
    v17 = (NSData *)[v12 copy];
    pkData = v16->_pkData;
    v16->_pkData = v17;

    objc_storeStrong((id *)&v16->_bonjourListenerUUID, a5);
    id v21 = objc_msgSend((id)objc_opt_class(v16, v19, v20), "_authTagWithSelfIdentity:data:", v14, v16->_pkData);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    authTag = v16->_authTag;
    v16->_authTag = (NSData *)v22;

    v24 = v16->_authTag;
    v25 = v16->_pkData;
    v26 = v16->_timeStamp;
    v27 = v24;
    v28 = v25;
    v29 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 42LL);
    -[NSDate timeIntervalSinceReferenceDate](v26, "timeIntervalSinceReferenceDate");
    double v31 = v30;

    int v41 = (int)v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v41, 4LL));
    -[NSMutableData appendData:](v29, "appendData:", v27);

    -[NSMutableData appendData:](v29, "appendData:", v28);
    -[NSMutableData appendData:](v29, "appendData:", v32);

    id v35 = objc_msgSend((id)objc_opt_class(v16, v33, v34), "_signatureWithSelfIdentity:data:", v14, v29);
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    signatureData = v16->_signatureData;
    v16->_signatureData = (NSData *)v36;

    v38 = v16;
  }

  return v16;
}

- (RPNearFieldAuthenticationPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ((uint64_t (*)(void))CFDictionaryGetCFDataOfLength)();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (!v6)
  {
    double v30 = 0LL;
    goto LABEL_21;
  }

  id v8 = v6;
  if ([v8 length] != (id)4)
  {

    goto LABEL_12;
  }

  id v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)*(int *)[v9 bytes]));

  if (!v10)
  {
    while (1)
LABEL_12:
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"CUGuardLetNoReturn",  @"CUGuardLet with no return");
  }

  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, &off_10011AE80, TypeID, 0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v13)
  {
    uint64_t CFDataOfLength = CFDictionaryGetCFDataOfLength(v4, &off_10011AE98, 16LL, 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(CFDataOfLength);
    if (v15)
    {
      v16 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v15 bytes]);
      CFTypeID v17 = CFDataGetTypeID();
      uint64_t v18 = CFDictionaryGetTypedValue(v4, &off_10011AEB0, v17, 0LL);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (v19)
      {
        CFTypeID v20 = CFDataGetTypeID();
        uint64_t v21 = CFDictionaryGetTypedValue(v4, &off_10011AEC8, v20, 0LL);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if (v22
          && (v32.receiver = self,
              v32.super_class = (Class)&OBJC_CLASS___RPNearFieldAuthenticationPayload,
              v23 = -[RPNearFieldMessagePayload initWithDictionary:](&v32, "initWithDictionary:", v4),
              (self = v23) != 0LL))
        {
          objc_storeStrong((id *)&v23->_timeStamp, v10);
          v24 = (NSData *)[v13 copy];
          pkData = self->_pkData;
          self->_pkData = v24;

          objc_storeStrong((id *)&self->_bonjourListenerUUID, v16);
          v26 = (NSData *)[v22 copy];
          authTag = self->_authTag;
          self->_authTag = v26;

          v28 = (NSData *)[v19 copy];
          signatureData = self->_signatureData;
          self->_signatureData = v28;

          self = self;
          double v30 = self;
        }

        else
        {
          double v30 = 0LL;
        }
      }

      else
      {
        double v30 = 0LL;
      }
    }

    else
    {
      double v30 = 0LL;
    }
  }

  else
  {
    double v30 = 0LL;
  }

LABEL_21:
  return v30;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v17, 16LL));
  v15[0] = &off_10011AE68;
  -[NSDate timeIntervalSinceReferenceDate](self->_timeStamp, "timeIntervalSinceReferenceDate");
  int v14 = (int)v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v14, 4LL));
  pkData = self->_pkData;
  v16[0] = v5;
  v16[1] = pkData;
  v15[1] = &off_10011AE80;
  v15[2] = &off_10011AE98;
  authTag = self->_authTag;
  v16[2] = v3;
  v16[3] = authTag;
  v15[3] = &off_10011AEC8;
  v15[4] = &off_10011AEB0;
  v16[4] = self->_signatureData;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  5LL));

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPNearFieldAuthenticationPayload;
  id v9 = -[RPNearFieldMessagePayload dictionaryRepresentation](&v13, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

  [v11 addEntriesFromDictionary:v8];
  return v11;
}

- (BOOL)isValidTimeStamp
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  LOBYTE(self) = -[RPNearFieldAuthenticationPayload isValidTimeStampSince:](self, "isValidTimeStampSince:", v3);

  return (char)self;
}

- (BOOL)isValidTimeStampSince:(id)a3
{
  return v3 < 30.0 && v3 > -30.0;
}

- (BOOL)verifyWithIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 edPKData]);
  if (v5)
  {
    authTag = self->_authTag;
    pkData = self->_pkData;
    id v25 = 0LL;
    unsigned int v8 = [v4 verifyAuthTag:authTag data:pkData type:4 error:&v25];
    id v9 = v25;
    v10 = v9;
    if (v8)
    {
      id v11 = self->_authTag;
      id v12 = self->_pkData;
      objc_super v13 = self->_timeStamp;
      int v14 = v11;
      v15 = v12;
      v16 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 42LL);
      -[NSDate timeIntervalSinceReferenceDate](v13, "timeIntervalSinceReferenceDate");
      double v18 = v17;

      int v26 = (int)v18;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v26, 4LL));
      -[NSMutableData appendData:](v16, "appendData:", v14);

      -[NSMutableData appendData:](v16, "appendData:", v15);
      -[NSMutableData appendData:](v16, "appendData:", v19);

      signatureData = self->_signatureData;
      id v24 = v10;
      unsigned __int8 v21 = [v4 verifySignature:signatureData data:v16 error:&v24];
      id v22 = v24;

      if ((v21 & 1) == 0
        && dword_1001319C8 <= 90
        && (dword_1001319C8 != -1 || _LogCategory_Initialize(&dword_1001319C8, 90LL)))
      {
        LogPrintF( &dword_1001319C8,  "-[RPNearFieldAuthenticationPayload verifyWithIdentity:]",  90LL,  "Fail to verify signature of payload: %@",  v22);
      }
    }

    else
    {
      unsigned __int8 v21 = 0;
      id v22 = v9;
    }
  }

  else
  {
    unsigned __int8 v21 = 0;
  }

  return v21;
}

+ (id)_authTagWithSelfIdentity:(id)a3 data:(id)a4
{
  id v9 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 authTagForData:a4 type:4 error:&v9]);
  id v5 = v9;
  if (v5
    && dword_1001319C8 < 91
    && (dword_1001319C8 != -1 || _LogCategory_Initialize(&dword_1001319C8, 90LL)))
  {
    LogPrintF( &dword_1001319C8,  "+[RPNearFieldAuthenticationPayload _authTagWithSelfIdentity:data:]",  90LL,  "Fail generating authTag with error: %@",  v5);
  }

  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v7 = v6;

  return v7;
}

+ (id)_signatureWithSelfIdentity:(id)a3 data:(id)a4
{
  id v9 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 signData:a4 error:&v9]);
  id v5 = v9;
  if (v5
    && dword_1001319C8 <= 90
    && (dword_1001319C8 != -1 || _LogCategory_Initialize(&dword_1001319C8, 90LL)))
  {
    LogPrintF( &dword_1001319C8,  "+[RPNearFieldAuthenticationPayload _signatureWithSelfIdentity:data:]",  90LL,  "Failed to generate signature: %@",  v5);
  }

  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  v7 = v6;

  return v7;
}

- (id)description
{
  return -[RPNearFieldAuthenticationPayload descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v18 = 0LL;
  NSAppendPrintF(&v18, ", pkData <%.3@> %d B", self->_pkData, -[NSData length](self->_pkData, "length", *(void *)&a3));
  id v4 = v18;
  id v17 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_bonjourListenerUUID, "UUIDString"));
  NSAppendPrintF(&v17, ", bonjourUUID '%{mask}'", v5);
  id v6 = v17;

  id v16 = v6;
  NSAppendPrintF(&v16, ", authTag '%{mask}'", self->_authTag);
  id v7 = v16;

  id v15 = v7;
  NSAppendPrintF( &v15,  ", signature <%.3@> %d B",  self->_signatureData,  -[NSData length](self->_signatureData, "length"));
  id v8 = v15;

  id v14 = v8;
  if (qword_100133310 != -1) {
    dispatch_once(&qword_100133310, &stru_100112B10);
  }
  timeStamp = self->_timeStamp;
  id v10 = (id)qword_100133308;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringFromDate:timeStamp]);
  NSAppendPrintF( &v14,  ", timeStamp:%@ isValid:%d",  v11,  -[RPNearFieldAuthenticationPayload isValidTimeStamp](self, "isValidTimeStamp"));
  id v12 = v14;

  return v12;
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void).cxx_destruct
{
}

@end