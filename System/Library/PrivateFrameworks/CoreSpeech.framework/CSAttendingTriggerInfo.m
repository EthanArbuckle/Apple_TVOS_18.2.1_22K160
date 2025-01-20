@interface CSAttendingTriggerInfo
+ (BOOL)supportsSecureCoding;
+ (id)triggerInfoForServerInvoke;
- (CSAttendingTriggerInfo)initWithAttendingType:(int64_t)a3 detectedToken:(id)a4 triggerMachTime:(unint64_t)a5 triggerAbsStartSampleId:(unint64_t)a6 audioRecordType:(int64_t)a7 audioRecordDeviceId:(id)a8 amountOfSpeechDetectedInMs:(float)a9 triggerThresholdInMs:(float)a10;
- (CSAttendingTriggerInfo)initWithCoder:(id)a3;
- (NSString)detectedToken;
- (NSString)deviceId;
- (float)amountOfSpeechDetectedInMs;
- (float)triggerThresholdInMs;
- (id)description;
- (int64_t)attendingType;
- (int64_t)audioRecordType;
- (unint64_t)triggerAbsStartSampleId;
- (unint64_t)triggerMachTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSAttendingTriggerInfo

- (CSAttendingTriggerInfo)initWithAttendingType:(int64_t)a3 detectedToken:(id)a4 triggerMachTime:(unint64_t)a5 triggerAbsStartSampleId:(unint64_t)a6 audioRecordType:(int64_t)a7 audioRecordDeviceId:(id)a8 amountOfSpeechDetectedInMs:(float)a9 triggerThresholdInMs:(float)a10
{
  id v19 = a4;
  id v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSAttendingTriggerInfo;
  v21 = -[CSAttendingTriggerInfo init](&v24, "init");
  v22 = v21;
  if (v21)
  {
    v21->_attendingType = a3;
    objc_storeStrong((id *)&v21->_detectedToken, a4);
    v22->_triggerMachTime = a5;
    v22->_triggerAbsStartSampleId = a6;
    v22->_audioRecordType = a7;
    objc_storeStrong((id *)&v22->_deviceId, a8);
    v22->_amountOfSpeechDetectedInMs = a9;
    v22->_triggerThresholdInMs = a10;
  }

  return v22;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  unint64_t v4 = self->_attendingType - 1;
  if (v4 > 6) {
    v5 = @"Default";
  }
  else {
    v5 = *(&off_10022C170 + v4);
  }
  v6 = v5;
  [v3 appendFormat:@"[type = %@]", v6];

  [v3 appendFormat:@"[detectedToken = %@]", self->_detectedToken];
  objc_msgSend(v3, "appendFormat:", @"[triggerMachTime = %llu]", self->_triggerMachTime);
  objc_msgSend(v3, "appendFormat:", @"[triggerAbsStartSampleId = %llu]", self->_triggerAbsStartSampleId);
  objc_msgSend(v3, "appendFormat:", @"[recordType = %llu]", self->_audioRecordType);
  [v3 appendFormat:@"[deviceId = %@]", self->_deviceId];
  objc_msgSend(v3, "appendFormat:", @"[amountOfSpeechDetectedInMs = %f]", self->_amountOfSpeechDetectedInMs);
  objc_msgSend(v3, "appendFormat:", @"[detectionThresholdInMs = %f]", self->_triggerThresholdInMs);
  return v3;
}

- (CSAttendingTriggerInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v5),  @"CSAttendingTriggerInfo:::attendingType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 unsignedIntegerValue];

  id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v9),  @"CSAttendingTriggerInfo:::detectedToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v13 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v12),  @"CSAttendingTriggerInfo:::triggerMachTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = [v14 unsignedLongLongValue];

  id v17 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v16),  @"CSAttendingTriggerInfo:::triggerAbsStartSampleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v18 unsignedLongLongValue];

  id v21 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v20),  @"CSAttendingTriggerInfo:::audioRecordType");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = [v22 longLongValue];

  id v25 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v24),  @"CSAttendingTriggerInfo:::deviceId");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v4 decodeFloatForKey:@"CSAttendingTriggerInfo:::amountOfSpeechDetectedInMs"];
  int v28 = v27;
  [v4 decodeFloatForKey:@"CSAttendingTriggerInfo:::detectionThresholdInMs"];
  int v30 = v29;

  LODWORD(v31) = v28;
  LODWORD(v32) = v30;
  v33 = -[CSAttendingTriggerInfo initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:]( self,  "initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceI d:amountOfSpeechDetectedInMs:triggerThresholdInMs:",  v8,  v11,  v15,  v19,  v23,  v26,  v31,  v32);

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t attendingType = self->_attendingType;
  id v11 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", attendingType));
  [v11 encodeObject:v5 forKey:@"CSAttendingTriggerInfo:::attendingType"];

  [v11 encodeObject:self->_detectedToken forKey:@"CSAttendingTriggerInfo:::detectedToken"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_triggerMachTime));
  [v11 encodeObject:v6 forKey:@"CSAttendingTriggerInfo:::triggerMachTime"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_triggerAbsStartSampleId));
  [v11 encodeObject:v7 forKey:@"CSAttendingTriggerInfo:::triggerAbsStartSampleId"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_audioRecordType));
  [v11 encodeObject:v8 forKey:@"CSAttendingTriggerInfo:::audioRecordType"];

  [v11 encodeObject:self->_deviceId forKey:@"CSAttendingTriggerInfo:::deviceId"];
  *(float *)&double v9 = self->_amountOfSpeechDetectedInMs;
  [v11 encodeFloat:@"CSAttendingTriggerInfo:::amountOfSpeechDetectedInMs" forKey:v9];
  *(float *)&double v10 = self->_triggerThresholdInMs;
  [v11 encodeFloat:@"CSAttendingTriggerInfo:::detectionThresholdInMs" forKey:v10];
}

- (int64_t)attendingType
{
  return self->_attendingType;
}

- (NSString)detectedToken
{
  return self->_detectedToken;
}

- (unint64_t)triggerMachTime
{
  return self->_triggerMachTime;
}

- (unint64_t)triggerAbsStartSampleId
{
  return self->_triggerAbsStartSampleId;
}

- (int64_t)audioRecordType
{
  return self->_audioRecordType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (float)amountOfSpeechDetectedInMs
{
  return self->_amountOfSpeechDetectedInMs;
}

- (float)triggerThresholdInMs
{
  return self->_triggerThresholdInMs;
}

- (void).cxx_destruct
{
}

+ (id)triggerInfoForServerInvoke
{
  v2 = objc_alloc(&OBJC_CLASS___CSAttendingTriggerInfo);
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  return  -[CSAttendingTriggerInfo initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:]( v2,  "initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDevi ceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:",  0LL,  0LL,  0LL,  0LL,  5LL,  0LL,  v3,  v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end