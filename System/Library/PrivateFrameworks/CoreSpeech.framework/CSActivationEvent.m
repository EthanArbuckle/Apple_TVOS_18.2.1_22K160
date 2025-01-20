@interface CSActivationEvent
+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4;
+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
+ (id)mediaserverdLaunchedEvent:(unint64_t)a3;
+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4;
+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5;
+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6;
- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7;
- (CSActivationEvent)initWithXPCObject:(id)a3;
- (CSDeviceActivationEvent)deviceActivationEvent;
- (NSDictionary)activationInfo;
- (NSString)UUID;
- (NSString)deviceId;
- (NSString)localizedDescription;
- (float)vadScore;
- (id)xpcObject;
- (unint64_t)hosttime;
- (unint64_t)type;
@end

@implementation CSActivationEvent

- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CSActivationEvent;
  v14 = -[CSActivationEvent init](&v20, "init");
  if (v14)
  {
    v15 = objc_alloc(&OBJC_CLASS___CSDeviceActivationEvent);
    *(float *)&double v16 = a6;
    v17 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:]( v15,  "initWithType:deviceId:activationInfo:vadScore:hosttime:",  a3,  v12,  v13,  a7,  v16);
    deviceActivationEvent = v14->_deviceActivationEvent;
    v14->_deviceActivationEvent = v17;
  }

  return v14;
}

- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6
{
  LODWORD(v6) = 0;
  return -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:]( self,  "initWithType:deviceId:activationInfo:vadScore:hosttime:",  a3,  a4,  a5,  a6,  v6);
}

- (CSActivationEvent)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSActivationEvent;
  v5 = -[CSActivationEvent init](&v11, "init");
  if (!v5) {
    goto LABEL_4;
  }
  xpc_object_t value = xpc_dictionary_get_value(v4, "deviceActivationEvent");
  v7 = (CSActivationEvent *)objc_claimAutoreleasedReturnValue(value);
  if (v7)
  {
    v8 = -[CSDeviceActivationEvent initWithXPCObject:]( objc_alloc(&OBJC_CLASS___CSDeviceActivationEvent),  "initWithXPCObject:",  v7);
    deviceActivationEvent = v5->_deviceActivationEvent;
    v5->_deviceActivationEvent = v8;

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (id)xpcObject
{
  keys = "deviceActivationEvent";
  xpc_object_t values = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[CSDeviceActivationEvent xpcObject](self->_deviceActivationEvent, "xpcObject"));
  xpc_object_t v2 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);

  return v2;
}

- (NSString)UUID
{
  return (NSString *)-[CSDeviceActivationEvent UUID](self->_deviceActivationEvent, "UUID");
}

- (unint64_t)type
{
  return (unint64_t)-[CSDeviceActivationEvent type](self->_deviceActivationEvent, "type");
}

- (NSString)deviceId
{
  return (NSString *)-[CSDeviceActivationEvent deviceId](self->_deviceActivationEvent, "deviceId");
}

- (NSDictionary)activationInfo
{
  return (NSDictionary *)-[CSDeviceActivationEvent activationInfo](self->_deviceActivationEvent, "activationInfo");
}

- (unint64_t)hosttime
{
  return (unint64_t)-[CSDeviceActivationEvent hosttime](self->_deviceActivationEvent, "hosttime");
}

- (float)vadScore
{
  return result;
}

- (NSString)localizedDescription
{
  return (NSString *)-[CSDeviceActivationEvent localizedDescription]( self->_deviceActivationEvent,  "localizedDescription");
}

- (CSDeviceActivationEvent)deviceActivationEvent
{
  return self->_deviceActivationEvent;
}

- (void).cxx_destruct
{
}

+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc(&OBJC_CLASS___CSActivationEvent);
  LODWORD(v10) = 0;
  objc_super v11 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:]( v9,  "initWithType:deviceId:activationInfo:vadScore:hosttime:",  2LL,  v8,  v7,  a5,  v10);

  return v11;
}

+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5
{
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___CSActivationEvent);
  *(float *)&double v9 = a4;
  double v10 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:]( v8,  "initWithType:deviceId:activationInfo:vadScore:hosttime:",  3LL,  v7,  0LL,  a5,  v9);

  return v10;
}

+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5 = a3;
  double v6 = objc_alloc(&OBJC_CLASS___CSActivationEvent);
  LODWORD(v7) = 0;
  id v8 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:]( v6,  "initWithType:deviceId:activationInfo:vadScore:hosttime:",  1LL,  0LL,  v5,  a4,  v7);

  return v8;
}

+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = objc_alloc(&OBJC_CLASS___CSActivationEvent);
  LODWORD(v10) = 0;
  objc_super v11 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:]( v9,  "initWithType:deviceId:activationInfo:vadScore:hosttime:",  6LL,  v8,  v7,  a5,  v10);

  return v11;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5 = a3;
  double v6 = -[CSActivationEvent initWithType:deviceId:activationInfo:hosttime:]( objc_alloc(&OBJC_CLASS___CSActivationEvent),  "initWithType:deviceId:activationInfo:hosttime:",  8LL,  v5,  0LL,  a4);

  return v6;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = -[CSActivationEvent initWithType:deviceId:activationInfo:hosttime:]( objc_alloc(&OBJC_CLASS___CSActivationEvent),  "initWithType:deviceId:activationInfo:hosttime:",  8LL,  v8,  v7,  a5);

  return v9;
}

+ (id)mediaserverdLaunchedEvent:(unint64_t)a3
{
  return  -[CSActivationEvent initWithType:deviceId:activationInfo:hosttime:]( objc_alloc(&OBJC_CLASS___CSActivationEvent),  "initWithType:deviceId:activationInfo:hosttime:",  7LL,  0LL,  0LL,  a3);
}

@end