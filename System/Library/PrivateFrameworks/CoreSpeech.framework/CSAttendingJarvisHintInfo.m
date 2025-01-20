@interface CSAttendingJarvisHintInfo
- (CSAttendingJarvisHintInfo)initWithOrigin:(unint64_t)a3 deviceId:(id)a4;
- (NSString)deviceId;
- (id)description;
@end

@implementation CSAttendingJarvisHintInfo

- (CSAttendingJarvisHintInfo)initWithOrigin:(unint64_t)a3 deviceId:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSAttendingJarvisHintInfo;
  v8 = -[CSAttendingHintInfo initWithOrigin:](&v11, "initWithOrigin:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_deviceId, a4);
  }

  return v9;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAttendingJarvisHintInfo;
  id v4 = -[CSAttendingHintInfo description](&v7, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendFormat:@"%@", v5];
  [v3 appendFormat:@"[deviceId: %@]", self->_deviceId];

  return v3;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void).cxx_destruct
{
}

@end