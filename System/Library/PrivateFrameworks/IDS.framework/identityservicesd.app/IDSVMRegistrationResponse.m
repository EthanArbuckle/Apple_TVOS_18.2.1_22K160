@interface IDSVMRegistrationResponse
+ (BOOL)supportsSecureCoding;
- (IDSVMRegistrationResponse)init;
- (IDSVMRegistrationResponse)initWithCoder:(id)a3;
- (IDSVMRegistrationResponse)initWithDataRepresentation:(id)a3;
- (IDSVMRegistrationResponse)initWithVersion:(unint64_t)a3 language:(id)a4 hardwareVersion:(id)a5 osVersion:(id)a6 softwareVersion:(id)a7 deviceName:(id)a8;
- (NSData)dataRepresentation;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)language;
- (NSString)osVersion;
- (NSString)softwareVersion;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSVMRegistrationResponse

- (IDSVMRegistrationResponse)init
{
  uint64_t v3 = IMCurrentPreferredLanguage(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 productOSVersion]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 productBuildVersion]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceName]);
  v13 = -[IDSVMRegistrationResponse initWithVersion:language:hardwareVersion:osVersion:softwareVersion:deviceName:]( self,  "initWithVersion:language:hardwareVersion:osVersion:softwareVersion:deviceName:",  1LL,  v4,  v6,  v8,  v10,  v12);

  return v13;
}

- (IDSVMRegistrationResponse)initWithVersion:(unint64_t)a3 language:(id)a4 hardwareVersion:(id)a5 osVersion:(id)a6 softwareVersion:(id)a7 deviceName:(id)a8
{
  id v22 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSVMRegistrationResponse;
  v18 = -[IDSVMRegistrationResponse init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_language, a4);
    objc_storeStrong((id *)&v19->_hardwareVersion, a5);
    objc_storeStrong((id *)&v19->_osVersion, a6);
    objc_storeStrong((id *)&v19->_softwareVersion, a7);
    objc_storeStrong((id *)&v19->_deviceName, a8);
    v19->_version = a3;
  }

  return v19;
}

- (IDSVMRegistrationResponse)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___IDSVMRegistrationResponse, v5),  v4,  &v11);
  v7 = (IDSVMRegistrationResponse *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v11;
  if (!v7)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog vm](&OBJC_CLASS___IMRGLog, "vm"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10069AE80((uint64_t)v4, (uint64_t)v8, v9);
    }
  }

  return v7;
}

- (NSData)dataRepresentation
{
  id v6 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v6));
  id v3 = v6;
  if (!v2)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog vm](&OBJC_CLASS___IMRGLog, "vm"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10069AF04((uint64_t)v3, v4);
    }
  }

  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSVMRegistrationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"version"];
  id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), @"language");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v9),  @"hardwareVersion");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v12), @"osVersion");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v15),  @"softwareVersion");
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v18),  @"deviceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = -[IDSVMRegistrationResponse initWithVersion:language:hardwareVersion:osVersion:softwareVersion:deviceName:]( self,  "initWithVersion:language:hardwareVersion:osVersion:softwareVersion:deviceName:",  v5,  v8,  v11,  v14,  v17,  v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_language forKey:@"language"];
  [v5 encodeObject:self->_hardwareVersion forKey:@"hardwareVersion"];
  [v5 encodeObject:self->_osVersion forKey:@"osVersion"];
  [v5 encodeObject:self->_softwareVersion forKey:@"softwareVersion"];
  [v5 encodeObject:self->_deviceName forKey:@"deviceName"];
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
}

@end