@interface FudEvent
- (AUDAccessory)accessory;
- (BOOL)isConnectionEvent;
- (BOOL)isInternalEvent;
- (BOOL)sendResponse;
- (BOOL)synthesizedEvent;
- (FudEvent)initWithEventType:(int)a3 filter:(id)a4 client:(id)a5 data:(id)a6;
- (NSDictionary)clientOptions;
- (NSString)clientName;
- (NSString)filterName;
- (OS_xpc_object)data;
- (id)description;
- (int)type;
- (void)dealloc;
- (void)setAccessory:(id)a3;
- (void)setClientName:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setFilterName:(id)a3;
- (void)setIsConnectionEvent:(BOOL)a3;
- (void)setSendResponse:(BOOL)a3;
- (void)setSynthesizedEvent:(BOOL)a3;
@end

@implementation FudEvent

- (FudEvent)initWithEventType:(int)a3 filter:(id)a4 client:(id)a5 data:(id)a6
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___FudEvent;
  v10 = -[FudEvent init](&v21, "init");
  v10->type = a3;
  *(_OWORD *)&v10->filterName = 0u;
  *(_OWORD *)&v10->clientOptions = 0u;
  *(_WORD *)&v10->isConnectionEvent = 0;
  v10->sendResponse = 1;
  if (a4) {
    v10->filterName = (NSString *)a4;
  }
  if (a6)
  {
    v10->data = (OS_xpc_object *)a6;
    xpc_retain(a6);
    v11 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL);
    uint64_t uint64 = xpc_dictionary_get_uint64(a6, "IOMatchLaunchServiceID");
    if (uint64) {
      -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", uint64),  @"IOMatchLaunchServiceID");
    }
    uint64_t v13 = objectFromXpcDictionary(v10->data, "Options");
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v14);
      }
    }

    xpc_object_t value = xpc_dictionary_get_value(a6, "EAMatchingSerialNumber");
    if (value)
    {
      v17 = value;
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_string) {
        -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v17)),  @"SerialNumber");
      }
    }

    if (xpc_dictionary_get_BOOL(a6, "DeviceIdleLaunch")) {
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", &__kCFBooleanTrue, @"DeviceIdleLaunch");
    }
    if (xpc_dictionary_get_BOOL(a6, "MayRebootLaunch")) {
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", &__kCFBooleanTrue, @"MayRebootLaunch");
    }
    if (xpc_dictionary_get_BOOL(a6, "UseDropboxLocation")) {
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", &__kCFBooleanTrue, @"UseDropboxLocation");
    }
    clientOptions = v11;
    v10->clientOptions = &clientOptions->super;
  }

  else
  {
    clientOptions = (NSMutableDictionary *)v10->clientOptions;
  }

  v20 = clientOptions;
  FudLog(7LL, @"clientOptions = %@");
  -[FudEvent setClientName:](v10, "setClientName:", a5, v20);
  return v10;
}

- (BOOL)isInternalEvent
{
  data = self->data;
  if (data) {
    LOBYTE(data) = xpc_dictionary_get_BOOL(data, "InternalClient");
  }
  return (char)data;
}

- (id)description
{
  data = self->data;
  if (data) {
    v4 = xpc_copy_description(data);
  }
  else {
    v4 = strdup("none");
  }
  v5 = v4;
  v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FudEvent - Client:%@ Type:%d Filter:%@ Data:%s Options:%@",  self->clientName,  self->type,  self->filterName,  v4,  self->clientOptions);
  if (v5) {
    free(v5);
  }
  return v6;
}

- (void)dealloc
{
  filterName = self->filterName;
  if (filterName) {

  }
  clientName = self->clientName;
  if (clientName) {

  }
  clientOptions = self->clientOptions;
  if (clientOptions) {

  }
  data = self->data;
  if (data) {
    xpc_release(data);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FudEvent;
  -[FudEvent dealloc](&v7, "dealloc");
}

- (int)type
{
  return self->type;
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFilterName:(id)a3
{
}

- (OS_xpc_object)data
{
  return self->data;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClientName:(id)a3
{
}

- (NSDictionary)clientOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setClientOptions:(id)a3
{
}

- (BOOL)isConnectionEvent
{
  return self->isConnectionEvent;
}

- (void)setIsConnectionEvent:(BOOL)a3
{
  self->isConnectionEvent = a3;
}

- (BOOL)synthesizedEvent
{
  return self->synthesizedEvent;
}

- (void)setSynthesizedEvent:(BOOL)a3
{
  self->synthesizedEvent = a3;
}

- (BOOL)sendResponse
{
  return self->sendResponse;
}

- (void)setSendResponse:(BOOL)a3
{
  self->sendResponse = a3;
}

- (AUDAccessory)accessory
{
  return (AUDAccessory *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAccessory:(id)a3
{
}

@end