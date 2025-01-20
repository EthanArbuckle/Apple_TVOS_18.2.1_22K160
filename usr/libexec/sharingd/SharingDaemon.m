@interface SharingDaemon
+ (id)sharedDaemon;
- (BOOL)canAccessAirDropSettings:(id)a3;
- (NSString)description;
- (SharingDaemon)init;
- (id)arrayFromXPCObject:(id)a3;
- (id)numberFromXPCObject:(id)a3;
- (id)stringFromXPCObject:(id)a3;
- (id)xpcArrayForSFNodeArray:(id)a3;
- (id)xpcObjectForSFOperationResults:(id)a3;
- (os_state_data_s)stateCapture;
- (void)dealloc;
- (void)handleBrowserMessage:(id)a3 forConnection:(id)a4;
- (void)handleNewConnection:(id)a3;
- (void)handleOperationMessage:(id)a3 forConnection:(id)a4;
- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6;
- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation SharingDaemon

+ (id)sharedDaemon
{
  if (qword_100657028 != -1) {
    dispatch_once(&qword_100657028, &stru_1005CDAC8);
  }
  return (id)qword_100657030;
}

- (SharingDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SharingDaemon;
  v2 = -[SharingDaemon init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    activeObjects = v2->_activeObjects;
    v2->_activeObjects = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    exportedOperations = v2->_exportedOperations;
    v2->_exportedOperations = v5;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SharingDaemon;
  -[SharingDaemon dealloc](&v3, "dealloc");
}

- (id)xpcObjectForSFOperationResults:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v37;
    uint64_t v8 = kSFOperationNodeKey;
    uint64_t v34 = kSFOperationSenderNodeKey;
    uint64_t v33 = kSFOperationFileIconKey;
    uint64_t v31 = kSFOperationSmallFileIconKey;
    uint64_t v30 = kSFOperationErrorKey;
    CFStringRef key = kCFErrorUnderlyingErrorKey;
    xpc_object_t v32 = v4;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10, key));

        v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v10);
        if (([v10 isEqual:v8] & 1) != 0
          || [v10 isEqual:v34])
        {
          uint64_t v13 = _SFNodeXPCObjectCreate(v11);
        }

        else
        {
          if (([v10 isEqual:v33] & 1) != 0
            || [v10 isEqual:v31])
          {
            v17 = sub_10008E058(v11, 0LL);
            if (!v17)
            {
              xpc_object_t v14 = 0LL;
              xpc_object_t v4 = v32;
              goto LABEL_15;
            }

            v18 = v17;
            xpc_object_t v14 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v17);
            CFRelease(v18);
            goto LABEL_30;
          }

          if ([v10 isEqual:v30])
          {
            xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
            int64_t Code = CFErrorGetCode((CFErrorRef)v11);
            CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)v11);
            v21 = (void *)_CFXPCCreateXPCObjectFromCFObject(Domain);
            xpc_dictionary_set_int64(v14, "Code", Code);
            if (v21) {
              xpc_dictionary_set_value(v14, "Domain", v21);
            }
            v22 = CFErrorCopyUserInfo((CFErrorRef)v11);
            if (v22)
            {
              v23 = v22;
              v29 = v21;
              MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v22);
              CFDictionaryRemoveValue(MutableCopy, key);
              v25 = (void *)_CFXPCCreateXPCObjectFromCFObject(MutableCopy);
              if (v25) {
                xpc_dictionary_set_value(v14, "UserInfo", v25);
              }
              CFRelease(MutableCopy);
              CFRelease(v23);

              v21 = v29;
            }

LABEL_30:
            xpc_object_t v4 = v32;
            goto LABEL_10;
          }

          uint64_t v13 = _CFXPCCreateXPCObjectFromCFObject(v11);
        }

        xpc_object_t v14 = (xpc_object_t)v13;
LABEL_10:
        if (v12) {
          BOOL v15 = v14 == 0LL;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15)
        {
          string_ptr = xpc_string_get_string_ptr(v12);
          xpc_dictionary_set_value(v4, string_ptr, v14);
        }

- (id)stringFromXPCObject:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = v3;
  if (!v3)
  {
LABEL_7:
    id v6 = 0LL;
    goto LABEL_8;
  }

  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  id v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    CFTypeID TypeID = CFStringGetTypeID();
    if (v7 != TypeID)
    {
      uint64_t v9 = daemon_log(TypeID);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CCB00();
      }

      CFRelease(v6);
      goto LABEL_7;
    }
  }

- (id)arrayFromXPCObject:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = v3;
  if (!v3)
  {
LABEL_7:
    id v6 = 0LL;
    goto LABEL_8;
  }

  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  id v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    CFTypeID TypeID = CFArrayGetTypeID();
    if (v7 != TypeID)
    {
      uint64_t v9 = daemon_log(TypeID);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CCB2C();
      }

      CFRelease(v6);
      goto LABEL_7;
    }
  }

- (id)numberFromXPCObject:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = v3;
  if (!v3)
  {
LABEL_8:
    id v6 = 0LL;
    goto LABEL_9;
  }

  id v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  id v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFNumberGetTypeID())
    {
      CFTypeID v8 = CFGetTypeID(v6);
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (v8 != TypeID)
      {
        uint64_t v10 = daemon_log(TypeID);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000CCB58();
        }

        CFRelease(v6);
        goto LABEL_8;
      }
    }
  }

- (id)xpcArrayForSFNodeArray:(id)a3
{
  id v3 = a3;
  xpc_object_t v4 = xpc_array_create(0LL, 0LL);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)_SFNodeXPCObjectCreate(*(void *)(*((void *)&v12 + 1) + 8LL * (void)v9));
        if (v10) {
          xpc_array_append_value(v4, v10);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = daemon_log(v12);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 kind]);
    int v34 = 134218754;
    id v35 = v11;
    __int16 v36 = 2112;
    __int128 v37 = v15;
    __int16 v38 = 2048;
    __int128 v39 = a4;
    __int16 v40 = 1024;
    int v41 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "SFBrowserCallBack (<%p>{kind = %@}, node = %p, error = %d)",  (uint8_t *)&v34,  0x26u);
  }

  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 isEntitled]);

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 kind]);
    unsigned int v19 = [v18 isEqual:kSFBrowserKindAirDrop];
    if (v19)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 connection]);
      uint64_t has_entitlement = xpc_connection_has_entitlement(v6, "com.apple.private.airdrop.discovery");
    }

    else
    {
      uint64_t has_entitlement = 1LL;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", has_entitlement));
    [v11 setIsEntitled:v21];

    if (v19) {
  }
    }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v11 isEntitled]);
  unsigned __int8 v23 = [v22 BOOLValue];

  if ((v23 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v11 childrenForNode:a4]);
    if (!v25) {
      goto LABEL_18;
    }
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon xpcArrayForSFNodeArray:](self, "xpcArrayForSFNodeArray:", v25));
    if (v26) {
      xpc_dictionary_set_value(v16, "Children", v26);
    }
  }

  else
  {
    uint64_t v27 = airdrop_log(v24);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
      sub_1000CCB84(v11, (os_log_s *)v26);
    }
    v25 = 0LL;
  }

LABEL_18:
  v28 = (void *)objc_claimAutoreleasedReturnValue([v11 kind]);
  if (![v28 isEqual:kSFBrowserKindNetwork])
  {
    uint64_t v30 = (uint64_t)v25;
LABEL_24:

    v25 = (void *)v30;
    goto LABEL_25;
  }

  int IsRoot = SFNodeIsRoot(a4);

  if (!IsRoot) {
    goto LABEL_25;
  }
  uint64_t v30 = objc_claimAutoreleasedReturnValue([v11 sidebarChildren]);

  if (v30)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon xpcArrayForSFNodeArray:](self, "xpcArrayForSFNodeArray:", v30));
    if (v28) {
      xpc_dictionary_set_value(v16, "Sidebar", v28);
    }
    goto LABEL_24;
  }

  v25 = 0LL;
LABEL_25:
  uint64_t v31 = (void *)_SFNodeXPCObjectCreate(a4);
  if (v31) {
    xpc_dictionary_set_value(v16, "Node", v31);
  }
  if (v12)
  {
    xpc_object_t v32 = (void *)_CFXPCCreateXPCObjectFromCFObject(v12);
    if (v32) {
      xpc_dictionary_set_value(v16, "Protocol", v32);
    }
  }

  xpc_dictionary_set_int64(v16, "Error", a6);
  uint64_t v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v11 connection]);
  xpc_connection_send_message(v33, v16);
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = daemon_log(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 kind]);
    uint64_t v13 = (void *)v12;
    else {
      __int128 v14 = off_1005CDB38[a4 - 1];
    }
    *(_DWORD *)buf = 134218754;
    id v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v12;
    __int16 v41 = 2112;
    v42 = v14;
    __int16 v43 = 2048;
    id v44 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "SFOperationCallBack (<%p>{kind = %@}, event = %@, results = %p)",  buf,  0x2Au);
  }

  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon xpcObjectForSFOperationResults:](self, "xpcObjectForSFOperationResults:", v9));
  xpc_dictionary_set_uint64(v15, "Events", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
  if (v16)
  {
    if (a4 == 1)
    {
      uint64_t v18 = kSFOperationHTTPServerConnectionKey;
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSFOperationHTTPServerConnectionKey]);

      if (v19)
      {
        uint64_t v34 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);

        uint64_t v33 = kSFOperationContactsOnlyKey;
        uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:"));
        id v35 = v21;
        xpc_dictionary_set_string(v16, "Operation", (const char *)[v35 UTF8String]);
        unsigned __int8 v23 = objc_alloc(&OBJC_CLASS___SDNetworkOperation);
        uint64_t v24 = -[SDNetworkOperation initWithKind:](v23, "initWithKind:", kSFOperationKindReceiver);
        v25 = v24;
        __int16 v36 = (void *)v22;
        if (v22) {
          -[SDNetworkOperation setProperty:forKey:](v24, "setProperty:forKey:", v22, v33);
        }
        uint64_t v26 = kSFOperationBundleIDKey;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSFOperationBundleIDKey]);
        -[SDNetworkOperation setProperty:forKey:](v25, "setProperty:forKey:", v27, v26);

        -[SDNetworkOperation setProperty:forKey:](v25, "setProperty:forKey:", v19, v34);
        -[SDNetworkOperation setProperty:forKey:](v25, "setProperty:forKey:", v35, kSFOperationSessionIDKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_exportedOperations,  "setObject:forKeyedSubscript:",  v25,  v35);
        -[NSMutableSet addObject:](self->_activeObjects, "addObject:", v25);
        -[SDNetworkOperation setObjectKey:](v25, "setObjectKey:", v35);
        -[SDNetworkOperation setDelegate:](v25, "setDelegate:", self);
        -[SDNetworkOperation resume](v25, "resume");
      }
    }

    xpc_dictionary_set_value(v15, "Results", v16);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 kind]);
  unsigned int v29 = [v28 isEqualToString:kSFOperationKindController];

  if (v29 && !(BOOL v30 = -[SharingDaemon canAccessAirDropSettings:](self, "canAccessAirDropSettings:", v17)))
  {
    uint64_t v31 = airdrop_log(v30);
    xpc_object_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000CCC74(v17, v32);
    }
  }

  else
  {
    xpc_connection_send_message((xpc_connection_t)v17, v15);
  }
}

- (void)handleBrowserMessage:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v6, "Function");
  if (string)
  {
    id v9 = string;
    if (!strcmp(string, "Create"))
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, "Kind");
      id v11 = (void *)objc_claimAutoreleasedReturnValue(value);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v11));
      if (v13)
      {
        xpc_object_t v17 = xpc_dictionary_get_value(v6, "Node");
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
        unsigned int v19 = (os_log_s *)v18;
        if (v18 && (uint64_t v18 = _SFNodeCreateWithXPCObject(0LL, v18)) != 0)
        {
          v20 = (const void *)v18;
          v21 = -[SDNetworkBrowser initWithKind:rootNode:]( objc_alloc(&OBJC_CLASS___SDNetworkBrowser),  "initWithKind:rootNode:",  v13,  v18);
          xpc_connection_set_context(v7, v21);
          -[NSMutableSet addObject:](self->_activeObjects, "addObject:", v21);
          -[SDNetworkBrowser setConnection:](v21, "setConnection:", v7);
          -[SDNetworkBrowser setBoostMessage:](v21, "setBoostMessage:", v6);
          -[SDNetworkBrowser setDelegate:](v21, "setDelegate:", self);
          CFRelease(v20);
        }

        else
        {
          uint64_t v32 = daemon_log(v18);
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_1000CCD4C();
          }
        }
      }

      else
      {
        uint64_t v34 = daemon_log(0LL);
        unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000CCD20();
        }
      }

      goto LABEL_45;
    }

    context = xpc_connection_get_context(v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(context);
    if (!v11)
    {
      uint64_t v22 = daemon_log(0LL);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000CCD78();
      }
      goto LABEL_45;
    }

    xpc_object_t v12 = xpc_dictionary_get_value(v6, "Node");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (v13) {
      __int128 v14 = (const void *)_SFNodeCreateWithXPCObject(0LL, v13);
    }
    else {
      __int128 v14 = 0LL;
    }
    if (!strcmp(v9, "OpenNode"))
    {
      xpc_object_t v26 = xpc_dictionary_get_value(v6, "Protocol");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Flags");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v25));
      id v29 = [v11 openNode:v14 forProtocol:v28 flags:uint64];
      if ((_DWORD)v29)
      {
        uint64_t v30 = daemon_log(v29);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_1000CCDA4();
        }
      }
    }

    else if (!strcmp(v9, "CloseNode"))
    {
      id v35 = [v11 closeNode:v14];
      if (!(_DWORD)v35) {
        goto LABEL_43;
      }
      uint64_t v36 = daemon_log(v35);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000CCE04();
      }
    }

    else if (!strcmp(v9, "AddNode"))
    {
      id v37 = [v11 addNode:v14];
      if (!(_DWORD)v37) {
        goto LABEL_43;
      }
      uint64_t v38 = daemon_log(v37);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000CCE64();
      }
    }

    else if (!strcmp(v9, "RemoveNode"))
    {
      id v39 = [v11 removeNode:v14];
      if (!(_DWORD)v39) {
        goto LABEL_43;
      }
      uint64_t v40 = daemon_log(v39);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000CCEC4();
      }
    }

    else
    {
      if (!strcmp(v9, "SetMode"))
      {
        objc_msgSend(v11, "setMode:", xpc_dictionary_get_uint64(v6, "Mode"));
        if (!v14) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }

      if (strcmp(v9, "SetOptions"))
      {
LABEL_43:
        if (!v14)
        {
LABEL_45:

          goto LABEL_46;
        }

- (void)handleOperationMessage:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v6, "Function");
  if (!string)
  {
    uint64_t v20 = daemon_log(0LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CCF24();
    }
    goto LABEL_54;
  }

  id v9 = string;
  if (!strcmp(string, "Create"))
  {
    v21 = xpc_dictionary_get_string(v6, "Operation");
    if (!v21)
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, "Kind");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(value);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v11));
      if (!v13)
      {
        uint64_t v29 = daemon_log(0LL);
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000CCF50();
        }

        goto LABEL_53;
      }

      xpc_object_t v17 = -[SDNetworkOperation initWithKind:](objc_alloc(&OBJC_CLASS___SDNetworkOperation), "initWithKind:", v13);
      xpc_connection_set_context(v7, v17);
      -[NSMutableSet addObject:](self->_activeObjects, "addObject:", v17);
      -[SDNetworkOperation setConnection:](v17, "setConnection:", v7);
      -[SDNetworkOperation setBoostMessage:](v17, "setBoostMessage:", v6);
      -[SDNetworkOperation setDelegate:](v17, "setDelegate:", self);
LABEL_52:

LABEL_53:
      goto LABEL_54;
    }

    exportedOperations = self->_exportedOperations;
    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v21));
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( exportedOperations,  "objectForKeyedSubscript:",  v23));

    if (v11)
    {
      xpc_connection_set_context(v7, v11);
      -[os_log_s setBoostMessage:](v11, "setBoostMessage:", v6);
      -[os_log_s setConnection:](v11, "setConnection:", v7);
      goto LABEL_54;
    }

    uint64_t v28 = daemon_log(v24);
    xpc_object_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000CCF7C();
    }
LABEL_23:

    goto LABEL_54;
  }

  context = xpc_connection_get_context(v7);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(context);
  if (!v11)
  {
    uint64_t v25 = daemon_log(0LL);
    xpc_object_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000CCFA8();
    }
    goto LABEL_23;
  }

  if (!strcmp(v9, "Resume"))
  {
    -[os_log_s resume](v11, "resume");
  }

  else if (!strcmp(v9, "SetProperty"))
  {
    xpc_object_t v12 = xpc_dictionary_get_value(v6, "Name");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = -[SharingDaemon stringFromXPCObject:](self, "stringFromXPCObject:", v13);
    if (!v14)
    {
      uint64_t v31 = daemon_log(0LL);
      xpc_object_t v17 = (SDNetworkOperation *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
        sub_1000CCFD4();
      }
      goto LABEL_52;
    }

    uint64_t v15 = v14;
    xpc_object_t v16 = xpc_dictionary_get_value(v6, "Value");
    xpc_object_t v17 = (SDNetworkOperation *)objc_claimAutoreleasedReturnValue(v16);
    if (v17)
    {
      if (CFEqual(v15, kSFOperationNodeKey))
      {
        uint64_t v18 = _SFNodeCreateWithXPCObject(0LL, v17);
LABEL_10:
        CGImageRef v19 = (CGImageRef)v18;
LABEL_39:
        if ((CFEqual(v15, kSFOperationDiscoverableModeKey)
           || CFEqual(v15, kSFOperationLegacyModeEnabledKey)
           || CFEqual(v15, kSFOperationWirelessEnabledKey)
           || CFEqual(v15, kSFOperationBluetoothEnabledKey)
           || CFEqual(v15, kSFOperationWirelessAccessPointKey)
           || CFEqual(v15, kSFOperationAirplaneModeEnabledKey))
          && !(BOOL v38 = -[SharingDaemon canAccessAirDropSettings:](self, "canAccessAirDropSettings:", v7)))
        {
          uint64_t v39 = airdrop_log(v38);
          uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_1000CD000(v7, v40);
          }
        }

        else
        {
          -[os_log_s setProperty:forKey:](v11, "setProperty:forKey:", v19, v15);
        }

        if (v19) {
          CFRelease(v19);
        }
        goto LABEL_52;
      }

      if (!CFEqual(v15, kSFOperationFileIconKey) && !CFEqual(v15, kSFOperationSmallFileIconKey))
      {
        uint64_t v18 = _CFXPCCreateCFObjectFromXPCObject(v17);
        goto LABEL_10;
      }

      uint64_t v32 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject(v17);
      if (v32)
      {
        uint64_t v33 = v32;
        CFTypeID v34 = CFGetTypeID(v32);
        CFTypeID TypeID = CFDataGetTypeID();
        if (v34 == TypeID)
        {
          CGImageRef v19 = sub_10008DDB8(v33);
        }

        else
        {
          uint64_t v36 = daemon_log(TypeID);
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_1000CD080();
          }

          CGImageRef v19 = 0LL;
        }

        CFRelease(v33);
        goto LABEL_39;
      }
    }

    CGImageRef v19 = 0LL;
    goto LABEL_39;
  }

- (void)handleNewConnection:(id)a3
{
  xpc_object_t v4 = (_xpc_connection_s *)a3;
  xpc_connection_set_target_queue(v4, &_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000CBF9C;
  v6[3] = &unk_1005CDAF0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  xpc_connection_set_event_handler(v5, v6);
  xpc_connection_resume(v5);
}

- (NSString)description
{
  id v19 = 0LL;
  NSAppendPrintF(&v19, "\n");
  id v3 = v19;
  id v18 = v3;
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInformation]);
  NSAppendPrintF(&v18, "Device Information: %@\n", v5);
  id v6 = v18;

  id v17 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  NSAppendPrintF(&v17, "%@\n", v8);
  id v9 = v17;

  airDropService = self->_airDropService;
  if (airDropService)
  {
    id v16 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropService_objc description](airDropService, "description"));
    NSAppendPrintF(&v16, "%@\n", v11);
    id v12 = v16;

    id v9 = v12;
  }

  id v15 = v9;
  NSAppendPrintF(&v15, "SharingDaemon State End\n");
  id v13 = v15;

  return (NSString *)v13;
}

- (os_state_data_s)stateCapture
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharingDaemon description](self, "description"));
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v2,  200LL,  0LL,  0LL));
    xpc_object_t v4 = v3;
    if (v3)
    {
      id v5 = [v3 length];
      id v6 = (os_state_data_s *)calloc(1uLL, (size_t)v5 + 200);
      id v7 = v6;
      if (v6)
      {
        v6->var0 = 1;
        v6->var1.var1 = v5;
        __strlcpy_chk(v6->var3, "SharingDaemon State", 64LL, 64LL);
        memcpy(v7->var4, [v4 bytes], (size_t)v5);
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)start
{
  gSFRunningInSharingD = 1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDXPCSession sharedSession](&OBJC_CLASS___SDXPCSession, "sharedSession"));
  [v3 start];

  if (!self->_listener)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.sharingd", &_dispatch_main_q, 1uLL);
    listener = self->_listener;
    self->_listener = mach_service;

    id v6 = self->_listener;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000CC868;
    handler[3] = &unk_1005CDB18;
    handler[4] = self;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(self->_listener);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  uint64_t v8 = SFIsDeviceAudioAccessory(v7);
  char v9 = v8;
  uint64_t v10 = daemon_log(v8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInformation]);
    *(_DWORD *)buf = 138412290;
    v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device Information: %@", buf, 0xCu);
  }

  if ((v9 & 1) == 0)
  {
    if (!self->_unlockKeyManager)
    {
      id v15 = (SDUnlockKeyManager *)objc_claimAutoreleasedReturnValue( +[SDUnlockKeyManager sharedKeyManager]( &OBJC_CLASS___SDUnlockKeyManager,  "sharedKeyManager"));
      unlockKeyManager = self->_unlockKeyManager;
      self->_unlockKeyManager = v15;
    }

    if (!self->_activityAdvertiser)
    {
      id v17 = (SDActivityAdvertiser *)objc_claimAutoreleasedReturnValue( +[SDActivityAdvertiser sharedAdvertiser]( &OBJC_CLASS___SDActivityAdvertiser,  "sharedAdvertiser"));
      activityAdvertiser = self->_activityAdvertiser;
      self->_activityAdvertiser = v17;

      id v13 = -[SDActivityAdvertiser start](self->_activityAdvertiser, "start");
    }

    if (!self->_activityScanner)
    {
      id v19 = (SDActivityScanner *)objc_claimAutoreleasedReturnValue(+[SDActivityScanner sharedScanner](&OBJC_CLASS___SDActivityScanner, "sharedScanner"));
      activityScanner = self->_activityScanner;
      self->_activityScanner = v19;

      id v13 = -[SDActivityScanner start](self->_activityScanner, "start");
    }

    if (!self->_encryptionManager)
    {
      v21 = (SDActivityEncryptionManager *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
      encryptionManager = self->_encryptionManager;
      self->_encryptionManager = v21;
    }

    if (!self->_payloadManager)
    {
      unsigned __int8 v23 = (SDActivityPayloadManager *)objc_claimAutoreleasedReturnValue( +[SDActivityPayloadManager sharedPayloadManager]( &OBJC_CLASS___SDActivityPayloadManager,  "sharedPayloadManager"));
      payloadManager = self->_payloadManager;
      self->_payloadManager = v23;
    }

    else {
      char v25 = 0;
    }
    if (!self->_airDropService && (v25 & 1) == 0)
    {
      xpc_object_t v26 = objc_alloc_init(&OBJC_CLASS___SDAirDropService_objc);
      airDropService = self->_airDropService;
      self->_airDropService = v26;

      -[SDAirDropService_objc start](self->_airDropService, "start");
    }

    if (!self->_autoUnlockSessionManager)
    {
      uint64_t v28 = (SDAutoUnlockSessionManager *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
      autoUnlockSessionManager = self->_autoUnlockSessionManager;
      self->_autoUnlockSessionManager = v28;

      -[SDAutoUnlockSessionManager start](self->_autoUnlockSessionManager, "start");
    }
  }

  if (!self->_xpcServer)
  {
    uint64_t v30 = objc_alloc_init(&OBJC_CLASS___SDXPCServer);
    xpcServer = self->_xpcServer;
    self->_xpcServer = v30;

    *(_DWORD *)buf = 0;
    uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"highPriorityQueue", buf);
    uint64_t v34 = Int64;
    if (*(_DWORD *)buf && (uint64_t Int64 = GestaltGetDeviceClass(Int64, v33), (_DWORD)Int64 == 6) || v34)
    {
      uint64_t v35 = daemon_log(Int64);
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v43 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "SharingServices using high priority queue",  v43,  2u);
      }

      uint64_t v39 = SFHighPriorityQueue(v37, v38);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      -[SDXPCServer setDispatchQueue:](self->_xpcServer, "setDispatchQueue:", v40);
    }

    -[SDXPCServer activate](self->_xpcServer, "activate");
  }

  if (!self->_stateHandle)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000CC938;
    v42[3] = &unk_1005CC510;
    v42[4] = self;
    self->_stateHandle = os_state_add_handler(&_dispatch_main_q, v42);
  }

  -[SharingDaemon _performMigrations](self, "_performMigrations");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sharingd.daemon.started", 0LL, 0LL, 1u);
}

- (void)stop
{
  xpcServer = self->_xpcServer;
  if (xpcServer)
  {
    -[SDXPCServer invalidate](xpcServer, "invalidate");
    xpc_object_t v4 = self->_xpcServer;
    self->_xpcServer = 0LL;
  }

  activityScanner = self->_activityScanner;
  if (activityScanner)
  {
    -[SDActivityScanner stop](activityScanner, "stop");
    id v6 = self->_activityScanner;
    self->_activityScanner = 0LL;
  }

  activityAdvertiser = self->_activityAdvertiser;
  if (activityAdvertiser)
  {
    -[SDActivityAdvertiser stop](activityAdvertiser, "stop");
    uint64_t v8 = self->_activityAdvertiser;
    self->_activityAdvertiser = 0LL;
  }

  encryptionManager = self->_encryptionManager;
  if (encryptionManager)
  {
    self->_encryptionManager = 0LL;
  }

  payloadManager = self->_payloadManager;
  if (payloadManager)
  {
    self->_payloadManager = 0LL;
  }

  airDropService = self->_airDropService;
  if (airDropService)
  {
    -[SDAirDropService_objc stop](airDropService, "stop");
    id v12 = self->_airDropService;
    self->_airDropService = 0LL;
  }

  sharesheetManager = self->_sharesheetManager;
  if (sharesheetManager)
  {
    -[SDShareSheetSlotManager invalidate](sharesheetManager, "invalidate");
    uint64_t v14 = self->_sharesheetManager;
    self->_sharesheetManager = 0LL;
  }

  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);
    id v16 = self->_listener;
    self->_listener = 0LL;
  }

  unint64_t stateHandle = self->_stateHandle;
  if (stateHandle)
  {
    os_state_remove_handler(stateHandle, a2);
    self->_unint64_t stateHandle = 0LL;
  }

  -[NSMutableSet removeAllObjects](self->_activeObjects, "removeAllObjects");
}

- (BOOL)canAccessAirDropSettings:(id)a3
{
  return xpc_connection_has_entitlement(a3, "com.apple.private.airdrop.settings");
}

- (void).cxx_destruct
{
}

@end