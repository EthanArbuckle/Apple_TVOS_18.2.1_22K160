@interface AgingController
+ (id)allocDefaults;
+ (id)log;
- (AgingController)initWithParams:(id)a3 currentWRa:(int)a4 currentUPOCount:(int)a5;
- (BOOL)shouldEnableAgeAwarenessForTableDrivenControllers;
- (NSUserDefaults)defaults;
- (id)currentBootSessionUUID;
- (int)UPOAgingMitigationsThreshold;
- (unint64_t)mitigationState;
- (void)dealloc;
- (void)migrateDefaultsPlist;
- (void)notifyPPMOfMitigationState:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setMitigationState:(unint64_t)a3;
- (void)setUPOAgingMitigationsThreshold:(int)a3;
- (void)takeActionOnUPO:(int)a3 forWRa:(int)a4;
- (void)updateMitigationStateAndNotify:(unint64_t)a3;
- (void)xpcNotifyForMitigationsUI;
@end

@implementation AgingController

+ (id)log
{
  if (qword_10007C448 != -1) {
    dispatch_once(&qword_10007C448, &stru_100061570);
  }
  return (id)qword_10007C450;
}

+ (id)allocDefaults
{
  v2 = (os_log_s *)objc_msgSend((id)objc_opt_class(a1, a2), "log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = @"/var/MobileSoftwareUpdate/Hardware/Battery";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Allocating defaults at %@",  (uint8_t *)&v5,  0xCu);
  }

  id v3 = -[NSUserDefaults _initWithSuiteName:container:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "_initWithSuiteName:container:",  @"com.apple.thermalmonitor.agingcontroller",  +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"/var/MobileSoftwareUpdate/Hardware/Battery"));
  [v3 synchronize];
  return v3;
}

- (void)migrateDefaultsPlist
{
  id v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.thermalmonitor.agingcontroller");
  v4 = -[NSUserDefaults dictionaryRepresentation](v3, "dictionaryRepresentation");
  int v5 = -[NSDictionary allKeys](v4, "allKeys");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSUserDefaults setObject:forKey:]( self->_defaults,  "setObject:forKey:",  -[NSDictionary objectForKey:](v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9)),  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1LL, @"DataMigrated");
}

- (AgingController)initWithParams:(id)a3 currentWRa:(int)a4 currentUPOCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v69.receiver = self;
  v69.super_class = (Class)&OBJC_CLASS___AgingController;
  v9 = -[AgingController init](&v69, "init");
  if (!v9)
  {
    v28 = (os_log_s *)objc_msgSend((id)objc_opt_class(0, v8), "log");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100039AF8(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    return 0LL;
  }

  uint64_t v10 = sub_100022470();
  id v11 = [a3 objectForKey:@"UPOMitigationsThresholdWRa"];
  id v12 = objc_msgSend( v11,  "objectForKey:",  -[NSNumber stringValue]( +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10),  "stringValue"));
  if (!v12)
  {
    v14 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v13), "log");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "<Warning> No upo mitigations start threshold found. Falling back to default value\n",  buf,  2u);
    }

    id v12 = objc_msgSend(v11, "objectForKey:", objc_msgSend(&off_100067C38, "stringValue"));
    if (!v12)
    {
      v61 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v15), "log");
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_100039B68();
      }

      return 0LL;
    }
  }

  v9->_int UPOAgingMitigationsThreshold = [v12 intValue];
  v17 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v16), "log");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int UPOAgingMitigationsThreshold = v9->_UPOAgingMitigationsThreshold;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = UPOAgingMitigationsThreshold;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s UpoAgingMitigationsThreshold %d\n",  buf,  0x12u);
  }

  v19 = +[AgingController allocDefaults](&OBJC_CLASS___AgingController, "allocDefaults");
  v9->_defaults = v19;
  if (!-[NSUserDefaults BOOLForKey:](v19, "BOOLForKey:", @"DataMigrated"))
  {
    v21 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v20), "log");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Need data migration to new persistent location. Initiating migration...\n",  buf,  0xCu);
    }

    -[AgingController migrateDefaultsPlist](v9, "migrateDefaultsPlist");
    v23 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v22), "log");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Migration complete\n", buf, 0xCu);
    }
  }

  v24 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v20), "log");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = -[NSUserDefaults dictionaryRepresentation](v9->_defaults, "dictionaryRepresentation");
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Current defaults %@\n", buf, 0x16u);
  }

  NSInteger v26 = -[NSUserDefaults integerForKey:](v9->_defaults, "integerForKey:", @"MitigationState");
  if (v26)
  {
    v9->_mitigationState = v26;
  }

  else
  {
    v9->_mitigationState = 2LL;
    v36 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v27), "log");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s Unknown previous mitigation state. Disabling mitigations\n",  buf,  0xCu);
    }
  }

  v37 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v27), "log");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_100039C74((uint64_t *)&v9->_mitigationState, v37);
  }
  v38 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerqueue", v38);
  v39 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9->_connQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerConQueue", v39);
  v40 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9->_notifyQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.thermalmonitor.agingcontrollerNotifyQueue",  v40);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000LL;
  v75 = sub_100012E68;
  v76 = sub_100012E78;
  v77 = v9;
  v41 = (const char *)[@"com.apple.thermalmonitor.ageAwareMitigationsDisabled" UTF8String];
  queue = (dispatch_queue_s *)v9->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100012E84;
  handler[3] = &unk_100061598;
  handler[4] = buf;
  if (notify_register_dispatch(v41, &v9->_mitigationsDisabledToken, queue, handler))
  {
    v44 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v43), "log");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100039C04(v44, v45, v46, v47, v48, v49, v50, v51);
    }
  }

  else
  {
    if (!notify_register_check( (const char *)[@"com.apple.thermalmonitor.ageAwareMitigationState" UTF8String],  &v9->_mitigationStateToken))
    {
      if (-[NSUserDefaults stringForKey:](v9->_defaults, "stringForKey:", @"BootUUID"))
      {
        -[AgingController notifyPPMOfMitigationState:]( v9,  "notifyPPMOfMitigationState:",  -[AgingController mitigationState](v9, "mitigationState"));
      }

      else
      {
        -[NSUserDefaults setInteger:forKey:](v9->_defaults, "setInteger:forKey:", (int)v5, @"UPOCount");
        -[NSUserDefaults setObject:forKey:]( v9->_defaults,  "setObject:forKey:",  -[AgingController currentBootSessionUUID](v9, "currentBootSessionUUID"),  @"BootUUID");
        -[NSUserDefaults setInteger:forKey:]( v9->_defaults,  "setInteger:forKey:",  -[AgingController mitigationState](v9, "mitigationState"),  @"MitigationState");
      }

      notify_set_state(v9->_mitigationStateToken, -[AgingController mitigationState](v9, "mitigationState"));
      notify_post((const char *)[@"com.apple.thermalmonitor.ageAwareMitigationState" UTF8String]);
      -[AgingController takeActionOnUPO:forWRa:](v9, "takeActionOnUPO:forWRa:", v5, v6);
      v64 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v63), "log");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v66 = (objc_class *)objc_opt_class(v9, v65);
        v67 = NSStringFromClass(v66);
        *(_DWORD *)v70 = 136315394;
        v71 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
        __int16 v72 = 2112;
        v73 = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%s %@ initialized successfully\n",  v70,  0x16u);
      }

      goto LABEL_30;
    }

    v53 = (os_log_s *)objc_msgSend((id)objc_opt_class(v9, v52), "log");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_100039B94(v53, v54, v55, v56, v57, v58, v59, v60);
    }
  }

  v9 = 0LL;
LABEL_30:
  _Block_object_dispose(buf, 8);
  return v9;
}

- (void)dealloc
{
  id v3 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, a2), "log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[AgingController dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc\n", buf, 0xCu);
  }

  io_object_t ppmService = self->_ppmService;
  if (ppmService) {
    IOObjectRelease(ppmService);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AgingController;
  -[AgingController dealloc](&v5, "dealloc");
}

- (void)takeActionOnUPO:(int)a3 forWRa:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", @"BootUUID");
  id v8 = -[AgingController currentBootSessionUUID](self, "currentBootSessionUUID");
  NSInteger v9 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", @"UPOCount");
  id v11 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v10), "log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v36 = 138413058;
    v37 = v7;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 1024;
    int v41 = v9;
    __int16 v42 = 1024;
    int v43 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "savedBootUUID %@ currentBootUUID %@ savedUPOCount %d currentUPOCount %d\n",  (uint8_t *)&v36,  0x22u);
  }

  if (a4 <= 0)
  {
    v21 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v12), "log");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100039E4C(a4, v21);
    }
  }

  else
  {
    if ([v8 isEqualToString:v7])
    {
      v14 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v13), "log");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100039ED0((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);
      }
      return;
    }

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v8, @"BootUUID");
    if (v9 < (int)v5)
    {
      -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", (int)v5, @"UPOCount");
      p_int UPOAgingMitigationsThreshold = &self->_UPOAgingMitigationsThreshold;
      v25 = self;
      if (self->_UPOAgingMitigationsThreshold > a4)
      {
        NSInteger v26 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v23), "log");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_100039F34(p_UPOAgingMitigationsThreshold, a4, v26);
        }
        return;
      }

      uint64_t v35 = 1LL;
LABEL_20:
      -[AgingController updateMitigationStateAndNotify:](v25, "updateMitigationStateAndNotify:", v35);
      return;
    }

    uint64_t v27 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v22), "log");
    v28 = v27;
    if (v9 != (int)v5)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10003A01C(v9, v5, v28);
      }
      -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", (int)v5, @"UPOCount");
      v25 = self;
      uint64_t v35 = 2LL;
      goto LABEL_20;
    }

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100039FB8(v5, v28, v29, v30, v31, v32, v33, v34);
    }
  }

- (BOOL)shouldEnableAgeAwarenessForTableDrivenControllers
{
  return (id)-[AgingController mitigationState](self, "mitigationState") == (id)1;
}

- (void)updateMitigationStateAndNotify:(unint64_t)a3
{
  unint64_t v5 = -[AgingController mitigationState](self, "mitigationState");
  id v7 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v6), "log");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5 == a3)
  {
    if (v8) {
      sub_10003A09C(self);
    }
  }

  else
  {
    if (v8) {
      sub_10003A18C(self);
    }
    -[AgingController setMitigationState:](self, "setMitigationState:", a3);
    -[NSUserDefaults setInteger:forKey:]( self->_defaults,  "setInteger:forKey:",  -[AgingController mitigationState](self, "mitigationState"),  @"MitigationState");
    notify_set_state(self->_mitigationStateToken, -[AgingController mitigationState](self, "mitigationState"));
    notify_post((const char *)[@"com.apple.thermalmonitor.ageAwareMitigationState" UTF8String]);
    uint64_t v10 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v9), "log");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      v21 = "-[AgingController updateMitigationStateAndNotify:]";
      __int16 v22 = 1024;
      unsigned int v23 = -[AgingController mitigationState](self, "mitigationState");
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Notification posted for state %d\n",  (uint8_t *)&v20,  0x12u);
    }

    -[AgingController notifyPPMOfMitigationState:]( self,  "notifyPPMOfMitigationState:",  -[AgingController mitigationState](self, "mitigationState"));
    if ((id)-[AgingController mitigationState](self, "mitigationState") == (id)1)
    {
      uint64_t v12 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v11), "log");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10003A11C(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      -[AgingController xpcNotifyForMitigationsUI](self, "xpcNotifyForMitigationsUI");
    }
  }

- (void)notifyPPMOfMitigationState:(unint64_t)a3
{
  kern_return_t v15;
  uint64_t v16;
  os_log_s *v17;
  BOOL valuePtr;
  void block[5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000136C4;
  block[3] = &unk_1000614D0;
  block[4] = self;
  if (qword_10007C458 != -1) {
    dispatch_once(&qword_10007C458, block);
  }
  if (self->_ppmService)
  {
    valuePtr = a3 == 1;
    CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v7 = v5;
      BOOL v8 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v6), "log");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10003A270((uint64_t)&valuePtr, v8, v9, v10, v11, v12, v13, v14);
      }
      uint64_t v15 = IORegistryEntrySetCFProperty(self->_ppmService, @"EnableBatteryAgingModel", v7);
      uint64_t v17 = (os_log_s *)objc_msgSend((id)objc_opt_class(self, v16), "log");
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10003A244();
        }
      }

      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        sub_10003A218();
      }

      CFRelease(v7);
    }
  }

- (void)xpcNotifyForMitigationsUI
{
  notifyQueue = (dispatch_queue_s *)self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013794;
  block[3] = &unk_1000614D0;
  block[4] = self;
  dispatch_async(notifyQueue, block);
}

- (id)currentBootSessionUUID
{
  v2 = 0LL;
  if (!sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL))
  {
    id v3 = (char *)malloc(__size);
    if (sysctlbyname("kern.bootsessionuuid", v3, &__size, 0LL, 0LL))
    {
      v2 = 0LL;
    }

    else
    {
      v2 = (NSString *)strdup(v3);
      qword_10007C460 = (uint64_t)v2;
      free(v3);
      if (v2)
      {
        v2 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2);
        id v3 = (char *)qword_10007C460;
      }

      else
      {
        id v3 = 0LL;
      }
    }

    free(v3);
  }

  return v2;
}

- (int)UPOAgingMitigationsThreshold
{
  return self->_UPOAgingMitigationsThreshold;
}

- (void)setUPOAgingMitigationsThreshold:(int)a3
{
  self->_int UPOAgingMitigationsThreshold = a3;
}

- (unint64_t)mitigationState
{
  return self->_mitigationState;
}

- (void)setMitigationState:(unint64_t)a3
{
  self->_mitigationState = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

@end