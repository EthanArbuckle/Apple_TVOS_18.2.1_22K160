@interface IDSSIMDeactivationInfoMessage
- (NSArray)events;
- (NSString)homePlmn;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)deviceTime;
- (void)setDeviceTime:(int64_t)a3;
- (void)setEvents:(id)a3;
- (void)setHomePlmn:(id)a3;
@end

@implementation IDSSIMDeactivationInfoMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSSIMDeactivationInfoMessage;
  id v4 = -[IDSSIMDeactivationInfoMessage copyWithZone:](&v8, "copyWithZone:", a3);
  objc_msgSend(v4, "setDeviceTime:", -[IDSSIMDeactivationInfoMessage deviceTime](self, "deviceTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMDeactivationInfoMessage homePlmn](self, "homePlmn"));
  [v4 setHomePlmn:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMDeactivationInfoMessage events](self, "events"));
  [v4 setEvents:v6];

  return v4;
}

- (id)bagKey
{
  return @"id-sim-deactivation";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"device-time");
  return v2;
}

- (id)messageBody
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___IDSSIMDeactivationInfoMessage;
  id v3 = -[IDSSIMDeactivationInfoMessage messageBody](&v29, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[IDSSIMDeactivationInfoMessage deviceTime](self, "deviceTime")));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"device-time", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100693F50();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMDeactivationInfoMessage homePlmn](self, "homePlmn"));
  if (v7) {
    CFDictionarySetValue(Mutable, @"home-plmn", v7);
  }
  theDict = Mutable;

  objc_super v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSSIMDeactivationInfoMessage events](self, "events"));
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v13);
        v15 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v14 sourceType]));
        if (v16) {
          CFDictionarySetValue(v15, @"source", v16);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v14 reasonCode]);
        if (v17) {
          CFDictionarySetValue(v15, @"code", v17);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 timeOfEvent]));
        if (v18) {
          CFDictionarySetValue(v15, @"event-time", v18);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v14 isNetworkInitiated]));
        if (v19)
        {
          CFDictionarySetValue(v15, @"network-initiated", v19);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v31 = @"network-initiated";
          __int16 v32 = 2080;
          v33 = "dict";
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s",  buf,  0x16u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v14 networkPlmn]);
        if (v20) {
          CFDictionarySetValue(v15, @"network-plmn", v20);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v14 isRoaming]));
        if (v21) {
          CFDictionarySetValue(v15, @"roaming", v21);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue([v14 rat]);
        if (v22) {
          CFDictionarySetValue(v15, @"rat", v22);
        }

        -[NSMutableArray addObject:](v8, "addObject:", v15);
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }

    while (v11);
  }

  if (v8) {
    CFDictionarySetValue(theDict, @"events", v8);
  }

  return theDict;
}

- (int64_t)deviceTime
{
  return self->_deviceTime;
}

- (void)setDeviceTime:(int64_t)a3
{
  self->_deviceTime = a3;
}

- (NSString)homePlmn
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setHomePlmn:(id)a3
{
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end