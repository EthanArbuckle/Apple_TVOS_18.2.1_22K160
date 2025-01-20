@interface NESMServer
- (BOOL)canSleep;
- (BOOL)handleSleep;
- (BOOL)requestInstallForSession:(id)a3 withParentSession:(id)a4 exclusive:(BOOL)a5;
- (NESMServer)init;
- (NWInterface)primaryCellularInterface;
- (NWInterface)primaryPhysicalInterface;
- (NWInterface)primaryWiFiInterface;
- (void)dealloc;
- (void)deregisterSession:(id)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleWakeup;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerSession:(id)a3 withCompletionHandler:(id)a4;
- (void)requestUninstallForSession:(id)a3;
- (void)satisfyCellularPathForSession:(id)a3;
- (void)satisfyPathForSession:(id)a3;
- (void)setPrimaryCellularInterface:(id)a3;
- (void)setPrimaryPhysicalInterface:(id)a3;
- (void)setPrimaryWiFiInterface:(id)a3;
@end

@implementation NESMServer

- (NESMServer)init
{
}

- (BOOL)canSleep
{
  v2 = self;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  if (self) {
    self = (NESMServer *)objc_getProperty(self, a2, 120LL, 1);
  }
  obj = self;
  id v24 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    char v4 = 1;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * v5);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        if (v2) {
          id Property = objc_getProperty(v2, v3, 120LL, 1);
        }
        else {
          id Property = 0LL;
        }
        uint64_t v25 = v5;
        v8 = (void *)objc_claimAutoreleasedReturnValue([Property objectForKeyedSubscript:v6]);
        id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          id v11 = v9;
          uint64_t v12 = *(void *)v27;
          do
          {
            v13 = 0LL;
            do
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v13);
              if (v2) {
                id v15 = objc_getProperty(v2, v10, 120LL, 1);
              }
              else {
                id v15 = 0LL;
              }
              v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v6]);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v14]);
              unsigned __int8 v18 = [v17 canSleep];

              v4 &= v18;
              v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v19 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
            id v11 = v19;
          }

          while (v19);
        }

        uint64_t v5 = v25 + 1;
      }

      while ((id)(v25 + 1) != v24);
      id v20 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      id v24 = v20;
    }

    while (v20);
  }

  else
  {
    char v4 = 1;
  }

  return v4 & 1;
}

- (BOOL)handleSleep
{
  v2 = self;
  if (self)
  {
    self->_sleepAckCount = 0;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    self = (NESMServer *)objc_getProperty(self, a2, 120LL, 1);
  }

  else
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
  }

  obj = self;
  id v23 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      char v4 = 0LL;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v4);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        if (v2) {
          id Property = objc_getProperty(v2, v3, 120LL, 1);
        }
        else {
          id Property = 0LL;
        }
        v7 = (void *)objc_claimAutoreleasedReturnValue([Property objectForKeyedSubscript:v5]);
        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          id v10 = v8;
          uint64_t v11 = *(void *)v25;
          do
          {
            uint64_t v12 = 0LL;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v12);
              if (v2) {
                id v14 = objc_getProperty(v2, v9, 120LL, 1);
              }
              else {
                id v14 = 0LL;
              }
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v5]);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
              unsigned int v17 = [v16 handleSleep];

              if (v2 && v17) {
                ++v2->_sleepAckCount;
              }
              uint64_t v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v18 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
            id v10 = v18;
          }

          while (v18);
        }

        char v4 = (char *)v4 + 1;
      }

      while (v4 != v23);
      id v19 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      id v23 = v19;
    }

    while (v19);
  }

  return v2 && v2->_sleepAckCount > 0;
}

- (void)handleSleepTime:(double)a3
{
  char v4 = self;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  if (self) {
    self = (NESMServer *)objc_getProperty(self, a2, 120LL, 1);
  }
  obj = self;
  id v5 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v24 = *(void *)v30;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v8);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        if (v4) {
          id Property = objc_getProperty(v4, v6, 120LL, 1);
        }
        else {
          id Property = 0LL;
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([Property objectForKeyedSubscript:v9]);
        id v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          id v14 = v12;
          uint64_t v15 = *(void *)v26;
          do
          {
            v16 = 0LL;
            do
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v16);
              if (v4) {
                id v18 = objc_getProperty(v4, v13, 120LL, 1);
              }
              else {
                id v18 = 0LL;
              }
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v9]);
              id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v17]);
              [v20 handleSleepTime:a3];

              v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v21 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            id v14 = v21;
          }

          while (v21);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v8 != v7);
      id v22 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
      id v7 = v22;
    }

    while (v22);
  }
}

- (void)handleWakeup
{
  v2 = self;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  if (self) {
    self = (NESMServer *)objc_getProperty(self, a2, 120LL, 1);
  }
  obj = self;
  id v3 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
  if (v3)
  {
    id v5 = v3;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v6);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        if (v2) {
          id Property = objc_getProperty(v2, v4, 120LL, 1);
        }
        else {
          id Property = 0LL;
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([Property objectForKeyedSubscript:v7]);
        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          id v12 = v10;
          uint64_t v13 = *(void *)v24;
          do
          {
            id v14 = 0LL;
            do
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v14);
              if (v2) {
                id v16 = objc_getProperty(v2, v11, 120LL, 1);
              }
              else {
                id v16 = 0LL;
              }
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v7]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v15]);
              [v18 handleWakeup];

              id v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v19 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            id v12 = v19;
          }

          while (v19);
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v6 != v5);
      id v20 = -[NESMServer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      id v5 = v20;
    }

    while (v20);
  }
}

- (void)satisfyPathForSession:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004CE84;
  v8[3] = &unk_1000BEBE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)satisfyCellularPathForSession:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004CD3C;
  v8[3] = &unk_1000BEBE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v10 = a4;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v9, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004B6AC;
  block[3] = &unk_1000BE900;
  id v15 = v8;
  id v16 = v10;
  uint64_t v17 = self;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(Property, block);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMServer;
  -[NESMServer dealloc](&v3, "dealloc");
}

- (void)registerSession:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = ne_log_obj(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registering session %@", buf, 0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  if (self) {
    id Property = objc_getProperty(self, v15, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000499C0;
  v21[3] = &unk_1000BE210;
  v21[4] = self;
  id v22 = v12;
  id v23 = v6;
  id v24 = v7;
  id v18 = v7;
  id v19 = v6;
  id v20 = v12;
  [v13 loadConfigurationWithID:v16 withCompletionQueue:Property handler:v21];
}

- (void)deregisterSession:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 type];
  if ((_DWORD)v6 == 3)
  {
    if (!v5)
    {
      if (v4) {
        goto LABEL_52;
      }
LABEL_5:
      uint64_t v9 = ne_log_obj(v6, v7);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v50 = 138412546;
        v51 = v5;
        __int16 v52 = 2112;
        id v53 = v4;
        uint64_t v11 = "%@: Deregister Always-On VPN Session: %@";
LABEL_50:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v50, 0x16u);
        goto LABEL_51;
      }

      goto LABEL_51;
    }

    if (objc_getProperty(v5, v7, 176LL, 1) == v4)
    {
      objc_setProperty_atomic(v5, v8, 0LL, 176LL);
      goto LABEL_5;
    }

    goto LABEL_52;
  }

  id v12 = [v4 type];
  if ((_DWORD)v12 == 4)
  {
    if (v5)
    {
      if (objc_getProperty(v5, v13, 224LL, 1) != v4) {
        goto LABEL_14;
      }
      objc_setProperty_atomic(v5, v14, 0LL, 224LL);
    }

    else if (v4)
    {
      id v49 = v4;
      goto LABEL_15;
    }

    uint64_t v15 = ne_log_obj(v12, v13);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v50 = 138412546;
      v51 = v5;
      __int16 v52 = 2112;
      id v53 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: Deregister Filter Session: %@",  (uint8_t *)&v50,  0x16u);
    }

LABEL_14:
    if (!v4)
    {
      id v10 = 0LL;
      goto LABEL_51;
    }

- (BOOL)requestInstallForSession:(id)a3 withParentSession:(id)a4 exclusive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = ne_log_obj(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = &stru_1000BF3D0;
    *(_DWORD *)buf = 138412802;
    v89 = self;
    __int16 v90 = 2112;
    if (v5) {
      id v13 = @"(exclusive)";
    }
    id v91 = v8;
    __int16 v92 = 2112;
    id v93 = (id)v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@: Request to install session: %@ %@",  buf,  0x20u);
  }

  id v14 = self;
  objc_sync_enter(v14);
  if (v9)
  {
    id Property = [v9 type];
    BOOL v17 = 0;
    if ((_DWORD)Property != 3 || !v14) {
      goto LABEL_10;
    }
    id Property = objc_getProperty(v14, v16, 176LL, 1);
    if (Property != v9) {
      goto LABEL_9;
    }
    id v24 = 0LL;
    v14->_alwaysOnVPNSessionInstallState = 3LL;
LABEL_43:
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472LL;
    v86[2] = sub_1000499B8;
    v86[3] = &unk_1000BEC08;
    id v47 = v24;
    id v87 = v47;
    [v8 installWithCompletionHandler:v86];

    BOOL v20 = 1;
    goto LABEL_44;
  }

  if ([v8 type] == 4)
  {
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 externalIdentifier]);
    if (v22)
    {

      goto LABEL_42;
    }

    if (v14) {
      id v25 = objc_getProperty(v14, v23, 224LL, 1);
    }
    else {
      id v25 = 0LL;
    }
    BOOL v26 = v25 == v8;

    if (v26) {
      goto LABEL_42;
    }
  }

  if ([v8 type] != 1)
  {
    if ([v8 type] == 6)
    {
      if (v14)
      {
        id v24 = 0LL;
        v14->_dnsProxySessionInstallState = 3LL;
        goto LABEL_43;
      }

      goto LABEL_42;
    }

    if ([v8 type] == 7)
    {
LABEL_42:
      id v24 = 0LL;
      goto LABEL_43;
    }

    id v63 = [v8 type];
    if ((_DWORD)v63 != 8)
    {
      id Property = [v8 type];
      if ((_DWORD)Property == 9) {
        goto LABEL_42;
      }
      goto LABEL_9;
    }

    uint64_t v65 = ne_log_obj(v63, v64);
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
      v68 = (void *)objc_claimAutoreleasedReturnValue([v67 appPush]);
      v69 = (void *)objc_claimAutoreleasedReturnValue([v68 pluginType]);
      *(_DWORD *)buf = 138412546;
      v89 = v14;
      __int16 v90 = 2112;
      id v91 = v69;
      _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "%@ Received request to install for NESessionTypeAppPush session type, plugin type [%@]",  buf,  0x16u);
    }

    if (!v14 || !objc_getProperty(v14, v70, 336LL, 1))
    {
      v72 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
      v74 = v72;
      if (!v14)
      {

        id v75 = 0LL;
        goto LABEL_72;
      }

      objc_setProperty_atomic(v14, v73, v72, 336LL);
    }

    id v75 = objc_getProperty(v14, v71, 336LL, 1);
LABEL_72:
    id v76 = v75;
    v77 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 appPush]);
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 pluginType]);
    unsigned __int8 v80 = [v76 containsObject:v79];

    if ((v80 & 1) != 0)
    {
      BOOL v17 = 1;
      goto LABEL_10;
    }

    if (v14) {
      id v81 = objc_getProperty(v14, v16, 336LL, 1);
    }
    else {
      id v81 = 0LL;
    }
    id v82 = v81;
    v83 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v83 appPush]);
    v85 = (void *)objc_claimAutoreleasedReturnValue([v84 pluginType]);
    [v82 addObject:v85];

    goto LABEL_42;
  }

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 VPN]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 protocol]);
  unsigned int v30 = [v29 includeAllNetworks];

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
  LODWORD(v29) = [v31 grade] == (id)1;

  int v34 = v30 | v5;
  if (!(_DWORD)v29)
  {
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
    id v50 = [v49 grade];
    BOOL v17 = v50 == (id)2;
    if (v50 == (id)2)
    {
      if (v14) {
        id v52 = objc_getProperty(v14, v51, 208LL, 1);
      }
      else {
        id v52 = 0LL;
      }
      BOOL v53 = v52 == v8;

      if (!v53) {
        goto LABEL_9;
      }
      uint64_t v54 = ne_log_obj(Property, v16);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = "";
        v57 = " Exclusive";
        if (!v34) {
          v57 = "";
        }
        *(_DWORD *)buf = 138413058;
        __int16 v90 = 2112;
        v89 = v14;
        id v91 = v8;
        __int16 v92 = 2080;
        if (v30) {
          v56 = " IncludeAllNetworks";
        }
        id v93 = (id)v57;
        __int16 v94 = 2080;
        v95 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%@: Request to install Session %@ is Personal -%s%s",  buf,  0x2Au);
      }

      if (!v14) {
        goto LABEL_42;
      }
      if (v14->_enterpriseVPNSessionInstallState != 4)
      {
        id v24 = 0LL;
        v14->_personalVPNSessionInstallState = 3LL;
        goto LABEL_43;
      }

      v14->_personalVPNSessionInstallState = 2LL;
      uint64_t v60 = ne_log_obj(v58, v59);
      id v49 = (void *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
      {
        id v62 = objc_getProperty(v14, v61, 192LL, 1);
        *(_DWORD *)buf = 138412802;
        v89 = v14;
        __int16 v90 = 2112;
        id v91 = v8;
        __int16 v92 = 2112;
        id v93 = v62;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v49,  OS_LOG_TYPE_DEFAULT,  "%@: Request to install personal session (%@) delayed due to exclusive enterprise session (%@)",  buf,  0x20u);
      }
    }

    goto LABEL_10;
  }

  uint64_t v35 = ne_log_obj(v32, v33);
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = "";
    uint64_t v38 = " Exclusive";
    if (!v34) {
      uint64_t v38 = "";
    }
    *(_DWORD *)buf = 138413058;
    __int16 v90 = 2112;
    v89 = v14;
    id v91 = v8;
    __int16 v92 = 2080;
    if (v30) {
      v37 = " IncludeAllNetworks";
    }
    id v93 = (id)v38;
    __int16 v94 = 2080;
    v95 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@: Request to install Session %@ is Enterprise -%s%s",  buf,  0x2Au);
  }

  if (v14) {
    id Property = objc_getProperty(v14, v16, 192LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (Property == v8)
  {
    if (v34)
    {
      if (v14)
      {
        v14->_enterpriseVPNSessionInstallState = 4LL;
        id v24 = objc_getProperty(v14, v16, 208LL, 1);
        if (!v24) {
          goto LABEL_43;
        }
        BOOL v39 = v14->_personalVPNSessionInstallState == 3;

        if (v39)
        {
          v14->_personalVPNSessionInstallState = 2LL;
          uint64_t v42 = ne_log_obj(v40, v41);
          id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            id v45 = objc_getProperty(v14, v44, 208LL, 1);
            *(_DWORD *)buf = 138412802;
            v89 = v14;
            __int16 v90 = 2112;
            id v91 = v45;
            __int16 v92 = 2112;
            id v93 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%@: Personal session %@ superceded by exclusive enterprise session %@, will uninstall personal session",  buf,  0x20u);
          }

          id v24 = objc_getProperty(v14, v46, 208LL, 1);
          goto LABEL_43;
        }
      }
    }

    else if (v14)
    {
      id v24 = 0LL;
      v14->_enterpriseVPNSessionInstallState = 3LL;
      goto LABEL_43;
    }

    goto LABEL_42;
  }

- (void)requestUninstallForSession:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = self;
    __int16 v50 = 2112;
    id v51 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Request to uninstall session: %@",  buf,  0x16u);
  }

  id v8 = self;
  objc_sync_enter(v8);
  if ([v4 type] != 1)
  {
    if ([v4 type] == 6)
    {
      if (v8) {
        v8->_dnsProxySessionInstallState = 1LL;
      }
    }

    else
    {
      id v22 = [v4 type];
      if ((_DWORD)v22 == 8)
      {
        uint64_t v24 = ne_log_obj(v22, v23);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 appPush]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pluginType]);
          *(_DWORD *)buf = 138412546;
          id v49 = v8;
          __int16 v50 = 2112;
          id v51 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: Received request to uninstall session for plugin type [%@]",  buf,  0x16u);
        }

        if (v8)
        {
          id v30 = objc_getProperty(v8, v29, 336LL, 1);
          if (v30)
          {
            uint64_t v32 = v30;
            id v33 = objc_getProperty(v8, v31, 336LL, 1);
            int v34 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 appPush]);
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 pluginType]);
            unsigned int v37 = [v33 containsObject:v36];

            if (v37)
            {
              id v39 = objc_getProperty(v8, v38, 336LL, 1);
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 appPush]);
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 pluginType]);
              [v39 removeObject:v42];
            }
          }
        }
      }
    }

    goto LABEL_33;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
  BOOL v10 = [v9 grade] == (id)1;

  if (!v10)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);
    if ([v43 grade] == (id)2 && v8)
    {
      BOOL v45 = objc_getProperty(v8, v44, 208LL, 1) == v4;

      if (v45) {
        v8->_personalVPNSessionInstallState = 1LL;
      }
    }

    else
    {
    }

    goto LABEL_33;
  }

  if (v8) {
    id Property = objc_getProperty(v8, v11, 192LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (v8) {
    v8->_enterpriseVPNSessionInstallState = 1LL;
  }
  [v4 setIsDeregisteredEnterpriseVPNSession:0];
  if (!v8
    || (id v14 = objc_getProperty(v8, v13, 208LL, 1)) == 0LL
    || (BOOL v15 = v8->_personalVPNSessionInstallState == 2, v14, !v15)
    || (v8->_personalVPNSessionInstallState = 3LL, (id v17 = objc_getProperty(v8, v16, 208LL, 1)) == 0LL))
  {
LABEL_33:
    [v4 uninstallOnQueue];
    goto LABEL_34;
  }

  uint64_t v19 = v17;
  uint64_t v20 = ne_log_obj(v17, v18);
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = v8;
    __int16 v50 = 2112;
    id v51 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@: Installing personal session because enterprise session is being uninstalled: %@",  buf,  0x16u);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000499B0;
  v46[3] = &unk_1000BEC08;
  id v47 = v4;
  [v19 installWithCompletionHandler:v46];

LABEL_34:
  objc_sync_exit(v8);
}

- (NWInterface)primaryWiFiInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setPrimaryWiFiInterface:(id)a3
{
}

- (NWInterface)primaryPhysicalInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setPrimaryPhysicalInterface:(id)a3
{
}

- (NWInterface)primaryCellularInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setPrimaryCellularInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end