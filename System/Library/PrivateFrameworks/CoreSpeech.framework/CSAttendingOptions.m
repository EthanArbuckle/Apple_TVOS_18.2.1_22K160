@interface CSAttendingOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionForFlexibleFollowupWithAudioRecordType:(int64_t)a3 deviceId:(id)a4;
+ (id)optionForJarvisAnnounceMessageWithDeviceId:(id)a3;
- (BOOL)useBoron;
- (BOOL)useOwnVoiceVAD;
- (BOOL)useVAD;
- (CSAttendingOptions)initWithAttendingType:(int64_t)a3;
- (CSAttendingOptions)initWithAttendingType:(int64_t)a3 startAttendingHostTime:(unint64_t)a4 useVAD:(BOOL)a5 useOwnVoiceVAD:(BOOL)a6 useBoron:(BOOL)a7 startOfSpeechThresholdInMs:(double)a8 prependAudioDuration:(double)a9 timeoutThresholdInSec:(double)a10 triggerType:(int64_t)a11 audioStreamHoldingDurationInSec:(double)a12 audioRecordType:(int64_t)a13 deviceId:(id)a14 attendingListeningType:(unint64_t)a15 pauseDurationThreshold:(double)a16 maxPauseDelay:(double)a17;
- (CSAttendingOptions)initWithCoder:(id)a3;
- (NSString)deviceId;
- (double)audioStreamHoldingDurationInSec;
- (double)maxPauseDelay;
- (double)pauseDurationThreshold;
- (double)prependAudioDuration;
- (double)startOfSpeechNearMissThresholdInMs;
- (double)startOfSpeechThresholdInMs;
- (double)timeoutThresholdInSec;
- (id)copyWithRecordType:(int64_t)a3;
- (id)description;
- (int64_t)attendingType;
- (int64_t)recordType;
- (int64_t)triggerType;
- (unint64_t)attendingListeningType;
- (unint64_t)startAttendingHostTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSAttendingOptions

- (CSAttendingOptions)initWithAttendingType:(int64_t)a3
{
  return -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:]( self,  "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prepen dAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:att endingListeningType:pauseDurationThreshold:maxPauseDelay:",  a3,  0LL,  1LL,  0LL,  0LL,  1LL,  300.0,  700.0,  10.0,  5.0,  3000.0,  7000.0,  1LL,  0LL,  2LL);
}

- (CSAttendingOptions)initWithAttendingType:(int64_t)a3 startAttendingHostTime:(unint64_t)a4 useVAD:(BOOL)a5 useOwnVoiceVAD:(BOOL)a6 useBoron:(BOOL)a7 startOfSpeechThresholdInMs:(double)a8 prependAudioDuration:(double)a9 timeoutThresholdInSec:(double)a10 triggerType:(int64_t)a11 audioStreamHoldingDurationInSec:(double)a12 audioRecordType:(int64_t)a13 deviceId:(id)a14 attendingListeningType:(unint64_t)a15 pauseDurationThreshold:(double)a16 maxPauseDelay:(double)a17
{
  id v29 = a14;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CSAttendingOptions;
  v30 = -[CSAttendingOptions init](&v39, "init");
  v31 = v30;
  if (v30)
  {
    v30->_attendingType = a3;
    v30->_startAttendingHostTime = a4;
    v30->_useVAD = a5;
    v30->_useOwnVoiceVAD = 0;
    v30->_useBoron = a7;
    double v32 = 300.0;
    if (a8 < 0.0) {
      double v33 = 300.0;
    }
    else {
      double v33 = a8;
    }
    v30->_startOfSpeechThresholdInMs = v33;
    v30->_startOfSpeechNearMissThresholdInMs = 120.0;
    if (a9 >= 0.0) {
      double v32 = a9;
    }
    double v34 = 10.0;
    if (a10 >= 0.0) {
      double v34 = a10;
    }
    v30->_prependAudioDuration = v32;
    v30->_timeoutThresholdInSec = v34;
    v30->_triggerType = a11;
    double v35 = 5.0;
    if (a12 >= 0.0) {
      double v35 = a12;
    }
    v30->_audioStreamHoldingDurationInSec = v35;
    v30->_recordType = a13;
    objc_storeStrong((id *)&v30->_deviceId, a14);
    v31->_attendingListeningType = a15;
    double v36 = 3000.0;
    if (a16 > 0.0) {
      double v36 = a16;
    }
    double v37 = 7000.0;
    if (a17 > 0.0) {
      double v37 = a17;
    }
    v31->_pauseDurationThreshold = v36;
    v31->_maxPauseDelay = v37;
  }

  return v31;
}

- (id)copyWithRecordType:(int64_t)a3
{
  v26 = objc_alloc(&OBJC_CLASS___CSAttendingOptions);
  int64_t v5 = -[CSAttendingOptions attendingType](self, "attendingType");
  unint64_t v6 = -[CSAttendingOptions startAttendingHostTime](self, "startAttendingHostTime");
  BOOL v7 = -[CSAttendingOptions useVAD](self, "useVAD");
  BOOL v8 = -[CSAttendingOptions useOwnVoiceVAD](self, "useOwnVoiceVAD");
  BOOL v9 = -[CSAttendingOptions useBoron](self, "useBoron");
  -[CSAttendingOptions startOfSpeechThresholdInMs](self, "startOfSpeechThresholdInMs");
  double v11 = v10;
  -[CSAttendingOptions prependAudioDuration](self, "prependAudioDuration");
  double v13 = v12;
  -[CSAttendingOptions timeoutThresholdInSec](self, "timeoutThresholdInSec");
  double v15 = v14;
  int64_t v16 = -[CSAttendingOptions triggerType](self, "triggerType");
  -[CSAttendingOptions audioStreamHoldingDurationInSec](self, "audioStreamHoldingDurationInSec");
  double v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttendingOptions deviceId](self, "deviceId"));
  unint64_t v20 = -[CSAttendingOptions attendingListeningType](self, "attendingListeningType");
  -[CSAttendingOptions pauseDurationThreshold](self, "pauseDurationThreshold");
  double v22 = v21;
  -[CSAttendingOptions maxPauseDelay](self, "maxPauseDelay");
  v24 = -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:]( v26,  "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prepend AudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:atten dingListeningType:pauseDurationThreshold:maxPauseDelay:",  v5,  v6,  v7,  v8,  v9,  v16,  v11,  v13,  v15,  v18,  v22,  v23,  a3,  v19,  v20);

  return v24;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  unint64_t v4 = self->_attendingType - 1;
  if (v4 > 6) {
    int64_t v5 = @"Default";
  }
  else {
    int64_t v5 = *(&off_10022C170 + v4);
  }
  unint64_t v6 = v5;
  [v3 appendFormat:@"[type = %@]", v6];

  objc_msgSend(v3, "appendFormat:", @"[startAttendingHostTime = %llu]", self->_startAttendingHostTime);
  if (self->_useVAD) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  [v3 appendFormat:@"[useVAD = %@]", v7];
  if (self->_useOwnVoiceVAD) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  [v3 appendFormat:@"[useOwnVoiceVAD = %@]", v8];
  if (self->_useBoron) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  [v3 appendFormat:@"[useBoron = %@]", v9];
  [v3 appendFormat:@"[startOfSpeechThresholdInMs = %.2f]", *(void *)&self->_startOfSpeechThresholdInMs];
  [v3 appendFormat:@"[startOfSpeechNearMissThresholdInMs = %.2f]", *(void *)&self->_startOfSpeechNearMissThresholdInMs];
  [v3 appendFormat:@"[prependAudioDuration = %.2f]", *(void *)&self->_prependAudioDuration];
  [v3 appendFormat:@"[timeoutThresholdInSec = %.2f]", *(void *)&self->_timeoutThresholdInSec];
  objc_msgSend(v3, "appendFormat:", @"[triggerType = %lu]", self->_triggerType);
  [v3 appendFormat:@"[audioStreamHoldingDurationInSec = %.2f]", *(void *)&self->_audioStreamHoldingDurationInSec];
  objc_msgSend(v3, "appendFormat:", @"[audioRecordType = %lld]", self->_recordType);
  [v3 appendFormat:@"[deviceId = %@]", self->_deviceId];
  objc_msgSend(v3, "appendFormat:", @"[attendingListeningType = %lu]", self->_attendingListeningType);
  [v3 appendFormat:@"[pauseDurationThreshold = %.2f]", *(void *)&self->_pauseDurationThreshold];
  [v3 appendFormat:@"[maxPauseDelay = %.2f]", *(void *)&self->_maxPauseDelay];
  return v3;
}

- (CSAttendingOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  id v5 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v4),  @"CSAttendingOptions:::attendingType");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v70 = [v6 unsignedIntegerValue];

  id v8 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v7),  @"CSAttendingOptions:::startAttendingHostTime");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v69 = [v9 unsignedLongLongValue];

  id v11 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v10),  @"CSAttendingOptions:::useVAD");
  double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v12 BOOLValue];

  id v15 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v14),  @"CSAttendingOptions:::useOwnVoiceVAD");
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = [v16 BOOLValue];

  id v19 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v18),  @"CSAttendingOptions:::useBoron");
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = [v20 BOOLValue];

  id v23 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v22),  @"CSAttendingOptions:::startOfSpeechThresholdInMs");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v24 doubleValue];
  double v26 = v25;

  id v28 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v27),  @"CSAttendingOptions:::prependAudioDuration");
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v29 doubleValue];
  double v31 = v30;

  id v33 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v32),  @"CSAttendingOptions:::timeoutThresholdInSec");
  double v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  [v34 doubleValue];
  double v36 = v35;

  id v38 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v37),  @"CSAttendingOptions:::triggerType");
  objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  id v40 = [v39 unsignedIntegerValue];

  id v42 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v41),  @"CSAttendingOptions:::audioStreamHoldingDurationInSec");
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  [v43 doubleValue];
  double v45 = v44;

  id v47 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v46),  @"CSAttendingOptions:::audioRecordType");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  id v49 = [v48 longLongValue];

  id v51 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v50),  @"CSAttendingOptions:::deviceId");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  id v54 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v53),  @"CSAttendingOptions:::attendingListeningType");
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  id v56 = [v55 unsignedIntegerValue];

  id v58 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v57),  @"CSAttendingOptions:::pauseDurationThreshold");
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  [v59 doubleValue];
  double v61 = v60;

  id v63 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v62),  @"CSAttendingOptions:::maxPauseDelay");
  v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

  [v64 doubleValue];
  double v66 = v65;

  v67 = -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:]( self,  "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prepend AudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:atten dingListeningType:pauseDurationThreshold:maxPauseDelay:",  v70,  v69,  v13,  v17,  v21,  v40,  v26,  v31,  v36,  v45,  v61,  v66,  v49,  v52,  v56);
  return v67;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t attendingType = self->_attendingType;
  id v5 = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", attendingType));
  [v5 encodeObject:v6 forKey:@"CSAttendingOptions:::attendingType"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_startAttendingHostTime));
  [v5 encodeObject:v7 forKey:@"CSAttendingOptions:::startAttendingHostTime"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_useVAD));
  [v5 encodeObject:v8 forKey:@"CSAttendingOptions:::useVAD"];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_useOwnVoiceVAD));
  [v5 encodeObject:v9 forKey:@"CSAttendingOptions:::useOwnVoiceVAD"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_useBoron));
  [v5 encodeObject:v10 forKey:@"CSAttendingOptions:::useBoron"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_startOfSpeechThresholdInMs));
  [v5 encodeObject:v11 forKey:@"CSAttendingOptions:::startOfSpeechThresholdInMs"];

  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_startOfSpeechNearMissThresholdInMs));
  [v5 encodeObject:v12 forKey:@"CSAttendingOptions:::startOfSpeechNearMissThresholdInMs"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_prependAudioDuration));
  [v5 encodeObject:v13 forKey:@"CSAttendingOptions:::prependAudioDuration"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_timeoutThresholdInSec));
  [v5 encodeObject:v14 forKey:@"CSAttendingOptions:::timeoutThresholdInSec"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_triggerType));
  [v5 encodeObject:v15 forKey:@"CSAttendingOptions:::triggerType"];

  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_audioStreamHoldingDurationInSec));
  [v5 encodeObject:v16 forKey:@"CSAttendingOptions:::audioStreamHoldingDurationInSec"];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_recordType));
  [v5 encodeObject:v17 forKey:@"CSAttendingOptions:::audioRecordType"];

  [v5 encodeObject:self->_deviceId forKey:@"CSAttendingOptions:::deviceId"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_attendingListeningType));
  [v5 encodeObject:v18 forKey:@"CSAttendingOptions:::attendingListeningType"];

  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_pauseDurationThreshold));
  [v5 encodeObject:v19 forKey:@"CSAttendingOptions:::pauseDurationThreshold"];

  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_maxPauseDelay));
  [v5 encodeObject:v20 forKey:@"CSAttendingOptions:::maxPauseDelay"];
}

- (int64_t)attendingType
{
  return self->_attendingType;
}

- (unint64_t)startAttendingHostTime
{
  return self->_startAttendingHostTime;
}

- (BOOL)useVAD
{
  return self->_useVAD;
}

- (BOOL)useOwnVoiceVAD
{
  return self->_useOwnVoiceVAD;
}

- (BOOL)useBoron
{
  return self->_useBoron;
}

- (double)startOfSpeechThresholdInMs
{
  return self->_startOfSpeechThresholdInMs;
}

- (double)startOfSpeechNearMissThresholdInMs
{
  return self->_startOfSpeechNearMissThresholdInMs;
}

- (double)prependAudioDuration
{
  return self->_prependAudioDuration;
}

- (double)timeoutThresholdInSec
{
  return self->_timeoutThresholdInSec;
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (double)audioStreamHoldingDurationInSec
{
  return self->_audioStreamHoldingDurationInSec;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unint64_t)attendingListeningType
{
  return self->_attendingListeningType;
}

- (double)pauseDurationThreshold
{
  return self->_pauseDurationThreshold;
}

- (double)maxPauseDelay
{
  return self->_maxPauseDelay;
}

- (void).cxx_destruct
{
}

+ (id)optionForFlexibleFollowupWithAudioRecordType:(int64_t)a3 deviceId:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:]( objc_alloc(&OBJC_CLASS___CSAttendingOptions),  "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependA udioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendi ngListeningType:pauseDurationThreshold:maxPauseDelay:",  1LL,  0LL,  1LL,  0LL,  1LL,  1LL,  300.0,  500.0,  0.0,  5.0,  3000.0,  7000.0,  a3,  v5,  2LL);

  return v6;
}

+ (id)optionForJarvisAnnounceMessageWithDeviceId:(id)a3
{
  return 0LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end