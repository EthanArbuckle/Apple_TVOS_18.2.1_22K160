@interface CSAttendingStartHintInfo
- (CSAttendingStartHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4 recordContext:(id)a5 rootRequestId:(id)a6 mhUUID:(id)a7;
- (CSAudioRecordContext)recordContext;
- (NSString)mhUUID;
- (NSString)rootRequestId;
- (id)_reasonString;
- (id)description;
- (unint64_t)reason;
@end

@implementation CSAttendingStartHintInfo

- (CSAttendingStartHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4 recordContext:(id)a5 rootRequestId:(id)a6 mhUUID:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSAttendingStartHintInfo;
  v16 = -[CSAttendingHintInfo initWithOrigin:](&v19, "initWithOrigin:", a3);
  v17 = v16;
  if (v16)
  {
    v16->_reason = a4;
    objc_storeStrong((id *)&v16->_recordContext, a5);
    objc_storeStrong((id *)&v17->_rootRequestId, a6);
    objc_storeStrong((id *)&v17->_mhUUID, a7);
  }

  return v17;
}

- (id)_reasonString
{
  unint64_t reason = self->_reason;
  v3 = @"Unknown";
  if (reason == 2) {
    v3 = @"UI Requested";
  }
  if (reason == 1) {
    return @"ClientStoppedRecording";
  }
  else {
    return (id)v3;
  }
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAttendingStartHintInfo;
  id v4 = -[CSAttendingHintInfo description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendFormat:@"%@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttendingStartHintInfo _reasonString](self, "_reasonString"));
  [v3 appendFormat:@"[reason: %@]", v6];

  [v3 appendFormat:@"[recordContext: %@]", self->_recordContext];
  [v3 appendFormat:@"[rootRequestId: %@]", self->_rootRequestId];
  [v3 appendFormat:@"[mhUUID: %@]", self->_mhUUID];

  return v3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (NSString)rootRequestId
{
  return self->_rootRequestId;
}

- (NSString)mhUUID
{
  return self->_mhUUID;
}

- (void).cxx_destruct
{
}

@end