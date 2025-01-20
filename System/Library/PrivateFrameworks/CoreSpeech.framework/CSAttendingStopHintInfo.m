@interface CSAttendingStopHintInfo
- (CSAttendingStopHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4;
- (id)_reasonString;
- (id)description;
- (unint64_t)reason;
@end

@implementation CSAttendingStopHintInfo

- (CSAttendingStopHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttendingStopHintInfo;
  result = -[CSAttendingHintInfo initWithOrigin:](&v6, "initWithOrigin:", a3);
  if (result) {
    result->_reason = a4;
  }
  return result;
}

- (id)_reasonString
{
  unint64_t v2 = self->_reason - 1;
  if (v2 > 5) {
    return @"Unknown";
  }
  else {
    return *(&off_10022D620 + v2);
  }
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAttendingStopHintInfo;
  id v4 = -[CSAttendingHintInfo description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendFormat:@"%@", v5];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttendingStopHintInfo _reasonString](self, "_reasonString"));
  [v3 appendFormat:@"[reason: %@]", v6];

  return v3;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end