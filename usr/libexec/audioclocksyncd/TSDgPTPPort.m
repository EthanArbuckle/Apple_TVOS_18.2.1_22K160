@interface TSDgPTPPort
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4;
+ (id)gPTPPortWithService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5;
- (BOOL)startAutomaticPropertyUpdates;
- (BOOL)stopAutomaticPropertyUpdates;
- (IODConnection)connection;
- (IOKService)service;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSDgPTPPort)init;
- (TSDgPTPPort)initWithService:(id)a3;
- (TSDgPTPPort)initWithService:(id)a3 pid:(int)a4;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)propertiesForXPC;
- (int)_portRole;
- (int)portRole;
- (int)portType;
- (unint64_t)_clockIdentifier;
- (unint64_t)clockIdentifier;
- (unsigned)_portNumber;
- (unsigned)portNumber;
- (void)finalizeNotifications;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setPortNumber:(unsigned __int16)a3;
- (void)setPortRole:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
- (void)updateProperties;
@end

@implementation TSDgPTPPort

+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  v15[0] = @"IOProviderClass";
  v15[1] = @"IOPropertyMatch";
  v16[0] = a3;
  v13[0] = @"PortNumber";
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v5));
  v13[1] = @"ClockIdentifier";
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  v14[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  v16[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

  return v11;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return [a1 iokitMatchingDictionaryForPortClass:@"IOTimeSyncPort" clockIdentifier:a3 andPortNumber:a4];
}

- (TSDgPTPPort)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[TSDgPTPPort init]"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Do not call %@",  v3);

  return 0LL;
}

+ (id)gPTPPortWithService:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    v4 = off_10003C0F8;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
  {
    v4 = off_10003C120;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
  {
    v4 = off_10003C130;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
  {
    v4 = &off_10003C140;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
  {
    v4 = off_10003C118;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
  {
    v4 = off_10003C128;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
  {
    v4 = off_10003C138;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
  {
    v4 = off_10003C100;
  }

  else if ([v3 conformsToIOClassName:@"IOTimeSyncNetworkPort"])
  {
    v4 = off_10003C108;
  }

  else
  {
    if (![v3 conformsToIOClassName:@"IOTimeSyncPort"])
    {
      id v5 = 0LL;
      goto LABEL_22;
    }

    v4 = off_10003C110;
  }

  id v5 = [objc_alloc(*v4) initWithService:v3];
LABEL_22:

  return v5;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 iokitMatchingDictionaryForClockIdentifier:a3 andPortNumber:a4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 gPTPPortWithService:v6]);
  return v7;
}

- (TSDgPTPPort)initWithService:(id)a3
{
  return -[TSDgPTPPort initWithService:pid:](self, "initWithService:pid:", a3, 0LL);
}

- (TSDgPTPPort)initWithService:(id)a3 pid:(int)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TSDgPTPPort;
  id v7 = -[TSDgPTPPort init](&v19, "init");
  if (v7)
  {
    objc_initWeak(&location, v7);
    objc_storeStrong((id *)&v7->_service, a3);
    if (v7->_service)
    {
      v7->_portNumber = -[TSDgPTPPort _portNumber](v7, "_portNumber");
      v7->_clockIdentifier = -[TSDgPTPPort _clockIdentifier](v7, "_clockIdentifier");
      if (qword_100047C40 != -1) {
        dispatch_once(&qword_100047C40, &stru_10003C630);
      }
      if (qword_100047C38)
      {
        objc_storeStrong((id *)&v7->_propertyUpdateQueue, (id)qword_100047C38);
        v7->_portRole = -[TSDgPTPPort _portRole](v7, "_portRole");
        v8 = objc_alloc(&OBJC_CLASS___IOKNotificationPort);
        v9 = (IOKNotificationPort *)-[IOKNotificationPort initOnDispatchQueue:]( v8,  "initOnDispatchQueue:",  qword_100047C38);
        notificationPort = v7->_notificationPort;
        v7->_notificationPort = v9;

        v11 = v7->_notificationPort;
        if (v11)
        {
          service = v7->_service;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          void v16[2] = sub_100009328;
          v16[3] = &unk_10003C658;
          objc_copyWeak(&v17, &location);
          uint64_t v13 = objc_claimAutoreleasedReturnValue( -[IOKService addInterestNotifcationOfType:usingNotificationPort:error:withHandler:]( service,  "addInterestNotifcationOfType:usingNotificationPort:error:withHandler:",  IOKGeneralInterest,  v11,  0LL,  v16));
          generalInterestNotification = v7->_generalInterestNotification;
          v7->_generalInterestNotification = (IOKInterestNotification *)v13;

          objc_destroyWeak(&v17);
          if (v7->_generalInterestNotification)
          {
LABEL_8:
            objc_destroyWeak(&location);
            goto LABEL_9;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v21 = "_generalInterestNotification != nil";
            __int16 v22 = 2048;
            uint64_t v23 = 0LL;
            __int16 v24 = 2048;
            uint64_t v25 = 0LL;
            __int16 v26 = 2080;
            v27 = &unk_100030E57;
            __int16 v28 = 2080;
            v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
            __int16 v30 = 1024;
            int v31 = 280;
            goto LABEL_18;
          }

- (IOKService)service
{
  return self->_service;
}

- (void)updateProperties
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000945C;
  block[3] = &unk_10003C680;
  unsigned int v5 = -[TSDgPTPPort _portRole](self, "_portRole");
  block[4] = self;
  block[5] = -[TSDgPTPPort _clockIdentifier](self, "_clockIdentifier");
  dispatch_async(v3, block);
}

- (BOOL)startAutomaticPropertyUpdates
{
  BOOL v2 = self->_generalInterestNotification != 0LL;
  self->_updatePropertiesOnPropertyChange = 1;
  return v2;
}

- (BOOL)stopAutomaticPropertyUpdates
{
  self->_updatePropertiesOnPropertyChange = 0;
  dispatch_sync((dispatch_queue_t)qword_100047C38, &stru_10003C6A0);
  return 1;
}

- (unsigned)_portNumber
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"PortNumber"]);

  if (v3) {
    unsigned __int16 v4 = (unsigned __int16)[v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (int)_portRole
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"PortRole"]);

  if (v3)
  {
    unsigned int v4 = [v3 intValue];
    if (v4 < 4) {
      int v5 = v4 + 1;
    }
    else {
      int v5 = 0;
    }
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (unint64_t)_clockIdentifier
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iodPropertyForKey:@"ClockIdentifier"]);

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (int)portType
{
  return 0;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  if (!v4) {
    id v4 = (OS_dispatch_queue *)(id)qword_100047C38;
  }
  propertyUpdateQueue = self->_propertyUpdateQueue;
  self->_propertyUpdateQueue = v4;
}

- (void)finalizeNotifications
{
  self->_updatePropertiesOnPropertyChange = 0;
  generalInterestNotification = self->_generalInterestNotification;
  self->_generalInterestNotification = 0LL;

  notificationPort = self->_notificationPort;
  self->_notificationPort = 0LL;
}

- (id)propertiesForXPC
{
  id v3 = (void *)objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 diagnosticInfoForService:v4]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PortRole"]);
  if (v6)
  {
    id v7 = v6;
    switch([v6 intValue])
    {
      case 0u:
        uint64_t v8 = 1LL;
        goto LABEL_8;
      case 1u:
        uint64_t v8 = 2LL;
        goto LABEL_8;
      case 2u:
        uint64_t v8 = 3LL;
        goto LABEL_8;
      case 3u:
        uint64_t v8 = 4LL;
LABEL_8:
        uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));

        id v7 = (void *)v9;
        break;
      default:
        break;
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  }

  [v5 setObject:v7 forKeyedSubscript:@"PortRole"];

  return v5;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ioClassName]);
  [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 iodProperties]);
  [v4 addEntriesFromDictionary:v6];

  [v4 removeObjectForKey:@"IOUserClientClass"];
  [v4 removeObjectForKey:@"IOGeneralInterest"];
  [v4 removeObjectForKey:@"SourceMACAddress"];
  [v4 removeObjectForKey:@"DestinationMACAddress"];
  [v4 removeObjectForKey:@"SourceIPAddress"];
  [v4 removeObjectForKey:@"SourceIPMask"];
  [v4 removeObjectForKey:@"DestinationIPAddress"];
  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 iokitMatchingDictionaryForClockIdentifier:a3 andPortNumber:a4]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](&OBJC_CLASS___IOKService, "matchingService:", v4));

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      v10 = "service != nil";
      __int16 v11 = 2048;
      uint64_t v12 = 0LL;
      __int16 v13 = 2048;
      uint64_t v14 = 0LL;
      __int16 v15 = 2080;
      v16 = &unk_100030E57;
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
      __int16 v19 = 1024;
      int v20 = 470;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  (uint8_t *)&v9,  0x3Au);
    }

    goto LABEL_24;
  }

  if (![v5 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPUnicastLinkLayerPtPPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPUnicastLinkLayerEtEPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPUnicastUDPv4PtPPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPUnicastUDPv6PtPPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPUnicastUDPv4EtEPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPUnicastUDPv6EtEPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPLocalClockPort;
      goto LABEL_20;
    }

    if ([v5 conformsToIOClassName:@"IOTimeSyncPort"])
    {
      id v6 = &OBJC_CLASS___TSDgPTPPort;
      goto LABEL_20;
    }

- (id)getMetrics
{
  return -[TSDPortMetrics initWithPort:](objc_alloc(&OBJC_CLASS___TSDPortMetrics), "initWithPort:", self);
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort getMetrics](self, "getMetrics"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getDelta:v4]);

  return v6;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned __int16)a3
{
  self->_portNumber = a3;
}

- (int)portRole
{
  return self->_portRole;
}

- (void)setPortRole:(int)a3
{
  self->_portRole = a3;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (IODConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end