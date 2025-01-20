@interface SDNetworkOperation
- (NSMutableArray)activities;
- (NSString)description;
- (NSString)kind;
- (NSString)objectKey;
- (OS_xpc_object)boostMessage;
- (OS_xpc_object)connection;
- (SDNetworkOperation)initWithKind:(id)a3;
- (SDNetworkOperationDelegate)delegate;
- (void)airDropConnection:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropController:(id)a3 didChange:(id)a4;
- (void)airDropInformation:(id)a3 didChange:(id)a4;
- (void)airDropServer:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropSession:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropStatus:(id)a3 didChange:(id)a4;
- (void)copyPropertyForKey:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)networkEjecter:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)networkResolver:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)notifyClientWithPosixError:(int64_t)a3;
- (void)resume;
- (void)setActivities:(id)a3;
- (void)setBoostMessage:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObjectKey:(id)a3;
- (void)setProperty:(void *)a3 forKey:(id)a4;
@end

@implementation SDNetworkOperation

- (SDNetworkOperation)initWithKind:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SDNetworkOperation;
  v6 = -[SDNetworkOperation init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_kind, a3);
    id operation = v7->_operation;
    v7->_id operation = 0LL;

    connection = v7->_connection;
    v7->_connection = 0LL;

    v7->_connectionScheduled = 0;
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    activities = v7->_activities;
    v7->_activities = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v7->_properties;
    v7->_properties = v12;

    v7->_sandboxExtensionHandle = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDNetworkOperation;
  -[SDNetworkOperation dealloc](&v3, "dealloc");
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v7 = a4;
  if (([v7 isEqual:kSFOperationKindKey] & 1) == 0)
  {
    if ((-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindController) & 1) != 0
      || -[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindInformation))
    {
      [self->_operation setProperty:a3 forKey:v7];
    }

    properties = self->_properties;
    if (a3) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, v7);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", v7);
    }
  }
}

- (void)copyPropertyForKey:(id)a3
{
  id v4 = a3;
  else {
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  v4));
  }
  v6 = v5;

  return v6;
}

- (void)airDropStatus:(id)a3 didChange:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:12 withResults:v6];
}

- (void)airDropInformation:(id)a3 didChange:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:12 withResults:v6];
}

- (void)airDropController:(id)a3 didChange:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:12 withResults:v6];
}

- (void)airDropSession:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)airDropServer:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)networkEjecter:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)networkResolver:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)airDropConnection:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)notifyClientWithPosixError:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100096290;
  v3[3] = &unk_1005CC330;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(&_dispatch_main_q, v3);
}

- (void)resume
{
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindSender))
  {
    id operation = self->_operation;
    if (operation)
    {
      if (([operation send] & 1) == 0)
      {
        id v4 = self;
        uint64_t v5 = 37LL;
LABEL_5:
        -[SDNetworkOperation notifyClientWithPosixError:](v4, "notifyClientWithPosixError:", v5);
        return;
      }
    }

    else
    {
      uint64_t v12 = kSFOperationItemsKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsKey));
      v14 = v13;
      if (v13)
      {
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationNodeKey));

        if (v15) {
          BOOL v17 = v16 == 0LL;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          -[SDNetworkOperation notifyClientWithPosixError:](self, "notifyClientWithPosixError:", 22LL);
        }

        else
        {
          id v22 = [v14 mutableCopy];
          [v22 removeObjectForKey:v12];
          v23 = -[SDAirDropSession initWithPerson:items:sandboxExtensions:]( objc_alloc(&OBJC_CLASS___SDAirDropSession),  "initWithPerson:items:sandboxExtensions:",  v16,  v15,  v22);
          id v24 = self->_operation;
          self->_id operation = v23;

          id v25 = self->_operation;
          uint64_t v26 = kSFOperationFileIconKey;
          v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFileIconKey));
          [v25 setProperty:v27 forKey:v26];

          id v28 = self->_operation;
          uint64_t v29 = kSFOperationSessionIDKey;
          v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
          [v28 setProperty:v30 forKey:v29];

          id v31 = self->_operation;
          uint64_t v32 = kSFOperationSmallFileIconKey;
          v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSmallFileIconKey));
          [v31 setProperty:v33 forKey:v32];

          id v34 = self->_operation;
          uint64_t v35 = kSFOperationItemsDescriptionKey;
          v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsDescriptionKey));
          [v34 setProperty:v36 forKey:v35];

          v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationBundleIDKey));
          [self->_operation setClientBundleID:v37];

          id v38 = self->_operation;
          uint64_t v39 = kSFOperationFromShareSheet;
          v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFromShareSheet));
          [v38 setProperty:v40 forKey:v39];

          connection = self->_connection;
          if (connection)
          {
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            xpc_connection_get_audit_token(connection, &v80);
            v79[0] = v80;
            v79[1] = v81;
            [self->_operation setAuditToken:v79];
            [self->_operation setClientPid:xpc_connection_get_pid(self->_connection)];
            v42 = (void *)objc_claimAutoreleasedReturnValue([self->_operation clientBundleID]);

            if (!v42)
            {
              id v43 = sub_1001167C0(self->_connection);
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              [self->_operation setClientBundleID:v44];
            }
          }

          [self->_operation setDelegate:self];
          [self->_operation start];
        }
      }

      else
      {
        -[SDNetworkOperation notifyClientWithPosixError:](self, "notifyClientWithPosixError:", 22LL);
      }
    }

    return;
  }

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindListener))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SDAirDropServer);
    id v7 = self->_operation;
    self->_id operation = v6;

    id v8 = self->_connection;
    if (v8)
    {
      [self->_operation setClientPid:xpc_connection_get_pid(v8)];
      id v9 = sub_1001167C0(self->_connection);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      [self->_operation setClientBundleID:v10];
    }

    [self->_operation setDelegate:self];
    [self->_operation activate];
    return;
  }

  if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindReceiver))
  {
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindController))
    {
      v18 = objc_alloc_init(&OBJC_CLASS___SDAirDropController);
      id v19 = self->_operation;
      self->_id operation = v18;

      uint64_t v20 = kSFOperationDiscoverableModeKey;
      id v78 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationDiscoverableModeKey));
      if (v78) {
        [self->_operation setProperty:v78 forKey:v20];
      }
      [self->_operation setDelegate:self];
      [self->_operation start];
      goto LABEL_58;
    }

    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindInformation))
    {
      v21 = &OBJC_CLASS___SDAirDropInformation;
LABEL_41:
      id v52 = objc_alloc_init(v21);
      id v53 = self->_operation;
      self->_id operation = v52;

      [self->_operation setDelegate:self];
      [self->_operation start];
      return;
    }

    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindStatus))
    {
      ++dword_100669390;
      v21 = &OBJC_CLASS___SDAirDropStatus;
      goto LABEL_41;
    }

    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindLogger))
    {
      v63 = objc_alloc_init(&OBJC_CLASS___SDAirDropLogger);
      id v64 = self->_operation;
      self->_id operation = v63;

      id v78 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
      v65 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationProtocolKey));
      [self->_operation logActivityType:v65 sessionID:v78];

LABEL_58:
      return;
    }

    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindResolver))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationNodeKey));

      if (v74)
      {
        id v78 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFlagsKey));
        v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationProtocolKey));
        v75 = &OBJC_CLASS___SDNetworkResolver;
LABEL_56:
        id v76 = [[v75 alloc] initWithNode:v74];
        id v77 = self->_operation;
        self->_id operation = v76;

        [self->_operation setProtocol:v49];
        [self->_operation setDelegate:self];
        [self->_operation setFlags:v78];
        [self->_operation start];
        goto LABEL_57;
      }
    }

    else if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindEjecter))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationNodeKey));

      if (v74)
      {
        id v78 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFlagsKey));
        v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationProtocolKey));
        v75 = &OBJC_CLASS___SDNetworkEjecter;
        goto LABEL_56;
      }
    }

    id v4 = self;
    uint64_t v5 = 22LL;
    goto LABEL_5;
  }

  id v11 = self->_operation;
  if (!v11)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)self->_properties, kSFOperationHTTPServerConnectionKey);
    if (Value)
    {
      v46 = Value;
      CFTypeID v47 = CFGetTypeID(Value);
      uint64_t TypeID = _CFHTTPServerConnectionGetTypeID();
      if (v47 == TypeID)
      {
        id v78 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
        v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationContactsOnlyKey));
        v50 = -[SDAirDropConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___SDAirDropConnection),  "initWithConnection:",  v46);
        id v51 = self->_operation;
        self->_id operation = v50;

        objc_msgSend(self->_operation, "setContactsOnly:", objc_msgSend(v49, "BOOLValue"));
        [self->_operation setSessionID:v78];
        [self->_operation setDelegate:self];
        [self->_operation start];
LABEL_57:

        goto LABEL_58;
      }

      uint64_t v66 = airdrop_log(TypeID);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_100096EB4(v55, v67, v68, v69, v70, v71, v72, v73);
      }
    }

    else
    {
      uint64_t v54 = airdrop_log(0LL);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_100096E80(v55, v56, v57, v58, v59, v60, v61, v62);
      }
    }

    return;
  }

  if (self->_connectionScheduled)
  {
    if (([v11 accept] & 1) == 0)
    {
      id v4 = self;
      uint64_t v5 = 1LL;
      goto LABEL_5;
    }
  }

  else
  {
    self->_connectionScheduled = 1;
    _[v11 schedule];
  }

- (void)invalidate
{
  if (!self->_operation) {
    goto LABEL_15;
  }
  if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindListener))
  {
    if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindReceiver)
      && !-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindController))
    {
      if (-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindStatus))
      {
        [self->_operation setDelegate:0];
        [self->_operation stop];
        --dword_100669390;
        goto LABEL_14;
      }

      if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindInformation))
      {
        if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindEjecter)
          && !-[NSString isEqual:](self->_kind, "isEqual:", kSFOperationKindResolver))
        {
          goto LABEL_15;
        }
      }
    }

- (NSString)description
{
  id operation = self->_operation;
  if (!operation) {
    return (NSString *)0LL;
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SDAirDropServer, a2);
  if ((objc_opt_isKindOfClass(operation, v4) & 1) == 0) {
    return (NSString *)0LL;
  }
  id v8 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([self->_operation description]);
  NSAppendPrintF(&v8, "%@\n", v5);
  id v6 = v8;

  return (NSString *)v6;
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)objectKey
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setObjectKey:(id)a3
{
}

- (OS_xpc_object)boostMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setBoostMessage:(id)a3
{
}

- (NSMutableArray)activities
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setActivities:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (SDNetworkOperationDelegate)delegate
{
  return (SDNetworkOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end