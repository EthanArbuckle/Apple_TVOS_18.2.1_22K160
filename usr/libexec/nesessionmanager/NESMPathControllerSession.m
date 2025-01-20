@interface NESMPathControllerSession
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (NESMPathControllerSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (int)type;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)handleChangeEventForFallbackInterfaces:(id)a3;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)install;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)uninstall;
@end

@implementation NESMPathControllerSession

- (NESMPathControllerSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NESMPathControllerSession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v17, "initWithConfiguration:andServer:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_level = 0LL;
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 pathController]);
    controllerConfiguration = v8->_controllerConfiguration;
    v8->_controllerConfiguration = (NEPathController *)v9;

    v8->_needsRoamingMonitor = sub_10008BE1C(v8, 0LL);
    v8->_needsFallbackNotifications = sub_10008C2E0(v8, v11);
    sub_10008C3D8(v8, v12);
    v13 = objc_alloc(&OBJC_CLASS___NESMPolicySession);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v15 = [v6 grade];
    if (v13) {
      v13 = (NESMPolicySession *)sub_10002E7FC((id *)&v13->super.isa, v14, 5, v15, (void *)1, (void *)1);
    }
    -[NESMSession setPolicySession:](v8, "setPolicySession:", v13);

    sub_10007AFD4(v8);
  }

  return v8;
}

- (int)type
{
  return 5;
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return !a3 || (a3 & 0xFFFFFFFD) == 1;
}

- (void)handleStartMessage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMPathControllerSession;
  -[NESMSession handleStartMessage:](&v5, "handleStartMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  [v4 requestInstallForSession:self withParentSession:0 exclusive:0];
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = ne_log_obj(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v3 == 36)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Resetting policies", buf, 0xCu);
    }

    -[NESMSession setRestartPending:](self, "setRestartPending:", 0LL);
    sub_1000877D4(self, 1, 0);
  }

  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Uninstalling", buf, 0xCu);
    }

    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NESMPathControllerSession;
    -[NESMSession handleStopMessageWithReason:](&v9, "handleStopMessageWithReason:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    [v8 requestUninstallForSession:self];
  }

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)&OBJC_CLASS___NESMPathControllerSession,
        -[NESMSession handleUpdateConfiguration:](&v13, "handleUpdateConfiguration:", v4)))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathController]);
    BOOL v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 368LL);

      self->_needsRoamingMonitor = sub_10008BE1C(self, 0LL);
      self->_needsFallbackNotifications = sub_10008C2E0(self, v8);
      sub_10008C3D8(self, v9);
    }

    else
    {
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    [v10 requestInstallForSession:self withParentSession:0 exclusive:0];

    BOOL v11 = 1;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 5)
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    if (((1 << a3) & 0x2A) != 0)
    {
      BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10008C1CC;
      v8[3] = &unk_1000BED80;
      v8[4] = self;
      int v9 = a3;
      dispatch_async(v7, v8);
    }
  }

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C18C;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleInstalledAppsChanged
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008BFE4;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "didStartTrackingNOI %@",  (uint8_t *)&v12,  0xCu);
  }

  if (self)
  {
    id v9 = objc_getProperty(self, v8, 512LL, 1);
    uint64_t v11 = v9;
    if (v9) {
      [v9 removeObserver:self forKeyPath:@"considerAlternateUpdate"];
    }
    objc_setProperty_atomic(self, v10, v4, 512LL);
  }

  [v4 addObserver:self forKeyPath:@"considerAlternateUpdate" options:5 context:0];
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "didStopTrackingNOI %@",  (uint8_t *)&v11,  0xCu);
  }

  if (self)
  {
    if (objc_getProperty(self, v8, 512LL, 1) == v4)
    {
      objc_msgSend( objc_getProperty(self, v9, 512, 1),  "removeObserver:forKeyPath:",  self,  @"considerAlternateUpdate");
      objc_setProperty_atomic(self, v10, 0LL, 512LL);
    }
  }

  else if (!v4)
  {
    [0 removeObserver:0 forKeyPath:@"considerAlternateUpdate"];
  }
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ne_log_large_obj(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "didStopTrackingAllNOIs %@",  (uint8_t *)&v11,  0xCu);
  }

  if (self)
  {
    if (objc_msgSend(v4, "containsObject:", objc_getProperty(self, v7, 512, 1)))
    {
      objc_msgSend( objc_getProperty(self, v8, 512, 1),  "removeObserver:forKeyPath:",  self,  @"considerAlternateUpdate");
      objc_setProperty_atomic(self, v9, 0LL, 512LL);
    }

    if (objc_getProperty(self, v8, 504LL, 1)) {
      objc_msgSend(objc_getProperty(self, v10, 504, 1), "trackNOIAnyForInterfaceType:options:", 1, 0);
    }
  }

  else if ([v4 containsObject:0])
  {
    [0 removeObserver:0 forKeyPath:@"considerAlternateUpdate"];
  }
}

- (void)install
{
  if (self)
  {
    if (self->_needsRoamingMonitor)
    {
      if (!objc_getProperty(self, a2, 392LL, 1))
      {
        id v3 = objc_alloc_init(&OBJC_CLASS___NWNetworkDescription);
        [v3 setRoamingPreference:1];
        id v4 = objc_alloc_init(&OBJC_CLASS___NWParameters);
        [v4 setRequiredInterfaceType:2];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]( &OBJC_CLASS___NWMonitor,  "monitorWithNetworkDescription:endpoint:parameters:",  v3,  0LL,  v4));
        objc_setProperty_atomic(self, v6, v5, 392LL);

        if (objc_getProperty(self, v7, 392LL, 1))
        {
          id v9 = objc_getProperty(self, v8, 416LL, 1);
          if (v9)
          {
          }

          else
          {
            uint64_t v13 = sub_10008BE1C(self, (const char *)1);
            if ((_DWORD)v13)
            {
              uint64_t v14 = ne_log_obj(v13, v10);
              id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(handler) = 0;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Begin roaming monitor transaction",  (uint8_t *)&handler,  2u);
              }

              v16 = objc_alloc(&OBJC_CLASS___NSString);
              objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
              v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
              v19 = -[NSString initWithFormat:]( v16,  "initWithFormat:",  @"com.apple.nesessionmanager.RoamingMonitor.%@",  v18);

              v20 = (void *)os_transaction_create(-[NSString UTF8String](v19, "UTF8String"));
              objc_setProperty_atomic(self, v21, v20, 416LL);
            }
          }

          objc_msgSend( objc_getProperty(self, v10, 392, 1),  "addObserver:forKeyPath:options:context:",  self,  @"status",  5,  0);
        }

        else
        {
          uint64_t v11 = ne_log_obj(0LL, v8);
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Roaming monitor creation failed",  (uint8_t *)&handler,  2u);
          }
        }
      }
    }

    else
    {
      sub_10008B730(self, a2);
    }

    if (self->_needsFallbackNotifications)
    {
      if (!self->_watchingFallbackNotifications)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        objc_setProperty_atomic(self, v23, v22, 456LL);

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        objc_setProperty_atomic(self, v25, v24, 464LL);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        objc_setProperty_atomic(self, v27, v26, 472LL);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        objc_setProperty_atomic(self, v29, v28, 480LL);

        self->_fallbackInUseToken = -1;
        v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
        v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v30);

        dispatch_time_t v32 = dispatch_time(0LL, -1LL);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
        *(void *)&__int128 handler = _NSConcreteStackBlock;
        *((void *)&handler + 1) = 3221225472LL;
        v53 = sub_10008BE14;
        v54 = &unk_1000BEC08;
        v55 = self;
        dispatch_source_set_event_handler(v31, &handler);
        dispatch_resume(v31);
        objc_setProperty_atomic(self, v33, v31, 488LL);

        id v34 = objc_alloc_init(off_1000CF8D0());
        objc_setProperty_atomic(self, v35, v34, 504LL);

        if (objc_getProperty(self, v36, 504LL, 1))
        {
          id v38 = objc_getProperty(self, v37, 504LL, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
          [v38 setQueue:v39];

          objc_msgSend(objc_getProperty(self, v40, 504, 1), "setDelegate:", self);
          objc_msgSend(objc_getProperty(self, v41, 504, 1), "trackNOIAnyForInterfaceType:options:", 1, 0);
        }

        else
        {
          uint64_t v42 = ne_log_obj(0LL, v37);
          v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            LOWORD(handler) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "NWNetworkOfInterestManager alloc failed",  (uint8_t *)&handler,  2u);
          }
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
        [v44 addObserver:self forKeyPath:@"primaryCellularInterface" options:5 context:0];

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
        [v45 addObserver:self forKeyPath:@"primaryPhysicalInterface" options:5 context:0];

        self->_watchingFallbackNotifications = 1;
      }
    }

    else if (self->_watchingFallbackNotifications)
    {
      sub_10008B814((uint64_t)self, a2);
    }
  }

  uint64_t v46 = sub_10008B9A0(self, a2);
  uint64_t v48 = ne_log_obj(v46, v47);
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = self;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%@: Updating policies and agent on install",  (uint8_t *)&handler,  0xCu);
  }

  sub_1000877D4(self, 1, 1);
  if (self) {
    id Property = objc_getProperty(self, v50, 368LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (([Property hasNonDefaultRules] & 1) != 0
    || ne_session_fallback_advisory())
  {
    -[NESMSession setStatus:](self, "setStatus:", 3LL);
  }

  -[NESMSession sendConfigurationChangeHandledNotification](self, "sendConfigurationChangeHandledNotification");
}

- (void)uninstall
{
  if (self && self->_watchingFallbackNotifications) {
    sub_10008B814((uint64_t)self, v3);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002BC80((uint64_t)v4);

  -[NESMSession setStatus:](self, "setStatus:", 1LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMPathControllerSession;
  -[NESMSession dealloc](&v3, "dealloc");
}

- (void)handleChangeEventForFallbackInterfaces:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008B474;
  v7[3] = &unk_1000BEBE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 392LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = Property;
  if (v14 != v10)
  {

LABEL_8:
    int v21 = 0;
    goto LABEL_9;
  }

  unsigned int v15 = [v9 isEqualToString:@"status"];

  if (!v15) {
    goto LABEL_8;
  }
  uint64_t v18 = ne_log_obj(v16, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      id v101 = objc_getProperty(self, v20, 392LL, 1);
    }
    else {
      id v101 = 0LL;
    }
    id v102 = [v101 status];
    v103 = @"Invalid";
    if (v102 == (id)2) {
      v103 = @"Not Available";
    }
    if (v102 == (id)1) {
      v103 = @"Available";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v219 = v103;
    v104 = v103;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Roaming status changed to %@", buf, 0xCu);
  }

  int v21 = 1;
LABEL_9:
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  if ((id)v22 == v10)
  {
    if ([v9 isEqualToString:@"primaryCellularInterface"])
    {
    }

    else
    {
      unsigned __int8 v25 = [v9 isEqualToString:@"primaryPhysicalInterface"];

      if ((v25 & 1) == 0)
      {
        int v24 = 0;
        goto LABEL_72;
      }
    }

    id v27 = [v9 isEqualToString:@"primaryCellularInterface"];
    int v28 = (int)v27;
    uint64_t v30 = ne_log_obj(v27, v29);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
    if (v28)
    {
      if (!v32) {
        goto LABEL_18;
      }
      SEL v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      id v34 = v12;
      SEL v35 = (void *)objc_claimAutoreleasedReturnValue([v33 primaryCellularInterface]);
      *(_DWORD *)buf = 138412290;
      *(void *)v219 = v35;
      SEL v36 = "Primary cellular interface changed to %@";
    }

    else
    {
      if (!v32) {
        goto LABEL_18;
      }
      SEL v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      id v34 = v12;
      SEL v35 = (void *)objc_claimAutoreleasedReturnValue([v33 primaryPhysicalInterface]);
      *(_DWORD *)buf = 138412290;
      *(void *)v219 = v35;
      SEL v36 = "Primary physical interface changed to %@";
    }

    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, v36, buf, 0xCu);

    id v12 = v34;
LABEL_18:
    int v208 = v21;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v37 primaryCellularInterface]);
    id v206 = v12;
    if (v38)
    {
      v39 = (void *)v38;
      SEL v40 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      SEL v41 = (void *)objc_claimAutoreleasedReturnValue([v40 primaryCellularInterface]);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 interfaceName]);
      id v201 = v9;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
      id v198 = v10;
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 primaryPhysicalInterface]);
      v45 = self;
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v44 interfaceName]);
      unsigned __int8 v47 = [v42 isEqualToString:v46];

      self = v45;
      id v10 = v198;

      id v9 = v201;
      id v12 = v206;

      if ((v47 & 1) == 0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v45, "server"));
        id v23 = (id)objc_claimAutoreleasedReturnValue([v49 primaryCellularInterface]);

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](v45, "server"));
        id v51 = (id)objc_claimAutoreleasedReturnValue([v50 primaryPhysicalInterface]);

        if (v23)
        {
          if (v45)
          {
            v53 = &selRef_setName_;
            int v24 = 1;
            id v54 = objc_getProperty(self, v48, 432LL, 1);
            int v21 = v208;
            if (v54)
            {
              id v55 = v54;
              int v204 = 0;
              goto LABEL_32;
            }

- (void).cxx_destruct
{
}

@end