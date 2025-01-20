@interface CSRemoteDeviceProtocolInfo
+ (id)defaultProtocolInfo;
+ (id)localDeviceProtocolInfo;
- (CSRemoteDeviceProtocolInfo)initWithProtocolVersion:(unint64_t)a3 buildVersion:(id)a4 deviceProductVersion:(id)a5 deviceProductType:(id)a6 deviceCategory:(unint64_t)a7;
- (CSRemoteDeviceProtocolInfo)initWithXPCObject:(id)a3;
- (NSString)buildVersion;
- (NSString)deviceProductType;
- (NSString)deviceProductVersion;
- (OS_xpc_object)xpcObject;
- (id)description;
- (unint64_t)deviceCategory;
- (unint64_t)protocolVersion;
@end

@implementation CSRemoteDeviceProtocolInfo

- (CSRemoteDeviceProtocolInfo)initWithProtocolVersion:(unint64_t)a3 buildVersion:(id)a4 deviceProductVersion:(id)a5 deviceProductType:(id)a6 deviceCategory:(unint64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSRemoteDeviceProtocolInfo;
  v16 = -[CSRemoteDeviceProtocolInfo init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    v16->_protocolVersion = a3;
    objc_storeStrong((id *)&v16->_buildVersion, a4);
    objc_storeStrong((id *)&v17->_deviceProductVersion, a5);
    objc_storeStrong((id *)&v17->_deviceProductType, a6);
    v17->_deviceCategory = a7;
  }

  return v17;
}

- (CSRemoteDeviceProtocolInfo)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSRemoteDeviceProtocolInfo;
  v5 = -[CSRemoteDeviceProtocolInfo init](&v22, "init");
  if (v5)
  {
    v5->_protocolVersion = xpc_dictionary_get_uint64(v4, "protocolVersion");
    v5->_deviceCategory = xpc_dictionary_get_uint64(v4, "deviceCategory");
    xpc_object_t value = xpc_dictionary_get_value(v4, "buildVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v7)
    {
      v8 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v4, "buildVersion"));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
      buildVersion = v5->_buildVersion;
      v5->_buildVersion = (NSString *)v9;
    }

    xpc_object_t v11 = xpc_dictionary_get_value(v4, "deviceProductVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      id v13 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v4, "deviceProductVersion"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      deviceProductVersion = v5->_deviceProductVersion;
      v5->_deviceProductVersion = (NSString *)v14;
    }

    xpc_object_t v16 = xpc_dictionary_get_value(v4, "deviceProductType");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    if (v17)
    {
      v18 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v4, "deviceProductType"));
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      deviceProductType = v5->_deviceProductType;
      v5->_deviceProductType = (NSString *)v19;
    }
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  keys[0] = "protocolVersion";
  keys[1] = "deviceCategory";
  values[0] = xpc_uint64_create(self->_protocolVersion);
  values[1] = xpc_uint64_create(self->_deviceCategory);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    xpc_dictionary_set_string(v3, "buildVersion", -[NSString UTF8String](buildVersion, "UTF8String"));
  }
  deviceProductVersion = self->_deviceProductVersion;
  if (deviceProductVersion) {
    xpc_dictionary_set_string(v3, "deviceProductVersion", -[NSString UTF8String](deviceProductVersion, "UTF8String"));
  }
  deviceProductType = self->_deviceProductType;
  if (deviceProductType) {
    xpc_dictionary_set_string(v3, "deviceProductType", -[NSString UTF8String](deviceProductType, "UTF8String"));
  }
  for (uint64_t i = 1LL; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"protocolVersion=%lu, deviceCategory=%lu, buildVersion=%@, deviceProductVersion=%@, deviceProductType=%@",  self->_protocolVersion,  self->_deviceCategory,  self->_buildVersion,  self->_deviceProductVersion,  self->_deviceProductType);
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)deviceProductVersion
{
  return self->_deviceProductVersion;
}

- (NSString)deviceProductType
{
  return self->_deviceProductType;
}

- (unint64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (void).cxx_destruct
{
}

+ (id)defaultProtocolInfo
{
  return  -[CSRemoteDeviceProtocolInfo initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:]( objc_alloc(&OBJC_CLASS___CSRemoteDeviceProtocolInfo),  "initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:",  1LL,  @"Unknown",  @"Unknown",  @"Unknown",  0LL);
}

+ (id)localDeviceProtocolInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceBuildVersion](&OBJC_CLASS___CSUtils, "deviceBuildVersion"));
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceProductVersion](&OBJC_CLASS___CSUtils, "deviceProductVersion"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceProductType](&OBJC_CLASS___CSUtils, "deviceProductType"));
  LODWORD(v5) = +[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS");
  uint64_t v6 = CSIsIPad();
  if ((v6 & 1) != 0)
  {
    uint64_t v5 = 5LL;
  }

  else if (CSIsOSX(v6, v7))
  {
    id v8 = +[CSUtils hasRemoteBuiltInMic](&OBJC_CLASS___CSUtils, "hasRemoteBuiltInMic");
    if ((v8 & 1) != 0)
    {
      uint64_t v5 = 2LL;
    }

    else if (CSIsASMacWithAOP(v8, v9))
    {
      uint64_t v5 = 3LL;
    }

    else
    {
      uint64_t v5 = 4LL;
    }
  }

  else
  {
    uint64_t v5 = v5;
    v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      uint64_t v14 = "+[CSRemoteDeviceProtocolInfo localDeviceProtocolInfo]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Unsupported protocol for this device",  (uint8_t *)&v13,  0xCu);
    }
  }

  xpc_object_t v11 = -[CSRemoteDeviceProtocolInfo initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:]( objc_alloc(&OBJC_CLASS___CSRemoteDeviceProtocolInfo),  "initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:",  4LL,  v2,  v3,  v4,  v5);

  return v11;
}

@end