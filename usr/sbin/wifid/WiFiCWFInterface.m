@interface WiFiCWFInterface
+ (id)sharedWiFiCWFInterfaceInstance;
- (CWFHomeManager)_homeManager;
- (NSMutableDictionary)_eventHandlers;
- (WiFiCWFInterface)init;
- (id)getServiceFor:(id)a3 withServiceKey:(id)a4;
- (id)performSensing;
- (id)startMonitoringSupportedEvents:(id)a3;
- (id)stopMonitoringSupportedEvents:(id)a3;
- (int)performSensingFor:(id)a3;
- (void)setPerformSensing:(id)a3;
- (void)set_eventHandlers:(id)a3;
- (void)set_homeManager:(id)a3;
@end

@implementation WiFiCWFInterface

+ (id)sharedWiFiCWFInterfaceInstance
{
  if (qword_100219820 != -1) {
    dispatch_once(&qword_100219820, &stru_1001E2B70);
  }
  return (id)qword_100219818;
}

- (WiFiCWFInterface)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiCWFInterface;
  v2 = -[WiFiCWFInterface init](&v5, "init");
  if (v2)
  {
    if ((MGGetBoolAnswer(@"InternalBuild") & 1) != 0)
    {
      if ((_os_feature_enabled_impl("WiFiManager", "Sensing") & 1) != 0)
      {
        -[WiFiCWFInterface set_eventHandlers:]( v2,  "set_eventHandlers:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        -[WiFiCWFInterface set_homeManager:]( v2,  "set_homeManager:",  +[CWFHomeManager cwfHomeManagerWithDelegate:](&OBJC_CLASS___CWFHomeManager, "cwfHomeManagerWithDelegate:", v2));
        v3 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s:CWFHomeManager instance %p" message:3, "-[WiFiCWFInterface init]", -[WiFiCWFInterface _homeManager](v2, "_homeManager")];
        }
        goto LABEL_6;
      }

      v3 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: OS does not support sensing, don't create this interface\n",  "-[WiFiCWFInterface init]");
      }
    }

    else
    {
      v3 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Non internal build, don't create this interface\n",  "-[WiFiCWFInterface init]");
      }
    }

    v2 = 0LL;
LABEL_6:
    objc_autoreleasePoolPop(v3);
  }

  return v2;
}

- (id)startMonitoringSupportedEvents:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (-[NSMutableDictionary objectForKey:]( -[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"),  "objectForKey:",  v9))
        {
          v11 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"event already exists in handler" message:3];
          }
          objc_autoreleasePoolPop(v11);
          return (id)-3900LL;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( -[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"),  "setObject:forKeyedSubscript:",  [a3 objectForKeyedSubscript:v9],  v9);
      }

      id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CWFHomeKitErrorDomain",  0LL,  0LL);
}

- (id)stopMonitoringSupportedEvents:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        -[NSMutableDictionary removeObjectForKey:]( -[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"),  "removeObjectForKey:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8));
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CWFHomeKitErrorDomain",  0LL,  0LL);
}

- (int)performSensingFor:(id)a3
{
  v4 = -[WiFiCWFInterface performSensing](self, "performSensing");
  return v4[2](v4, a3);
}

- (id)getServiceFor:(id)a3 withServiceKey:(id)a4
{
  if (-[NSMutableDictionary objectForKey:]( -[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"),  "objectForKey:",  a4))
  {
    uint64_t v7 = (uint64_t (**)(id, id))-[NSMutableDictionary objectForKeyedSubscript:]( -[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"),  "objectForKeyedSubscript:",  a4);
    v8 = (NSError *)v7[2](v7, a3);
    uint64_t v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s:Start data collect for sensing params %@ with erorr %@", "-[WiFiCWFInterface getServiceFor:withServiceKey:]", a3, v8 message];
    }
  }

  else
  {
    v8 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CWFManagerErrorDomain,  -3907LL,  0LL);
    uint64_t v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s:%@ service doesn't exist", "-[WiFiCWFInterface getServiceFor:withServiceKey:]", a4, v11 message];
    }
  }

  objc_autoreleasePoolPop(v9);
  return v8;
}

- (id)performSensing
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPerformSensing:(id)a3
{
}

- (CWFHomeManager)_homeManager
{
  return self->__homeManager;
}

- (void)set_homeManager:(id)a3
{
}

- (NSMutableDictionary)_eventHandlers
{
  return self->__eventHandlers;
}

- (void)set_eventHandlers:(id)a3
{
}

@end