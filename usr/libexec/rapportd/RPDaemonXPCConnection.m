@interface RPDaemonXPCConnection
- (BOOL)_entitledForLabel:(id)a3 error:(id *)a4;
- (NSMutableSet)assertions;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPDaemonXPCConnection)initWithDaemon:(id)a3 xpcConnection:(id)a4;
- (void)_invalidateAssertions;
- (void)activateAssertionWithIdentifier:(id)a3;
- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4;
- (void)connectionInvalidated;
- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5;
- (void)diagnosticLogControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5;
- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)primaryAccountSignedInWithCompletion:(id)a3;
- (void)primaryAccountSignedOutWithCompletion:(id)a3;
- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3;
- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4;
- (void)serverCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7;
- (void)serverSetAutoMappingInternal:(BOOL)a3 completion:(id)a4;
- (void)setAssertions:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setXpcCnx:(id)a3;
@end

@implementation RPDaemonXPCConnection

- (RPDaemonXPCConnection)initWithDaemon:(id)a3 xpcConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPDaemonXPCConnection;
  v9 = -[RPDaemonXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  if (dword_100131820 <= 20 && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 20LL))) {
    LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection connectionInvalidated]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  -[RPDaemonXPCConnection _invalidateAssertions](self, "_invalidateAssertions");
}

- (BOOL)_entitledForLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_entitledClient)
  {
    BOOL v7 = 1;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.Client"));
    unsigned int v9 = [v8 isEqual:&__kCFBooleanTrue];

    if (v9)
    {
      BOOL v7 = 1;
      self->_entitledClient = 1;
    }

    else
    {
      id v16 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@' for %@",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)@"com.apple.rapport.Client");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (dword_100131820 <= 60
        && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 60LL)))
      {
        LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection _entitledForLabel:error:]",  60LL,  "### %#{pid} %{error}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v17);
      }

      if (a4) {
        *a4 = v17;
      }

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v4 = -[RPDaemonXPCConnection _entitledForLabel:error:]( self,  "_entitledForLabel:error:",  @"ActivateAssertion",  0LL);
  v5 = v15;
  if (v4)
  {
    id v6 = v15;
    if (v6)
    {
      if (-[NSMutableSet containsObject:](self->_assertions, "containsObject:", v6))
      {
        if (dword_100131820 <= 30
          && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
        {
          LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection activateAssertionWithIdentifier:]",  30LL,  "Ignoring duplicate assertion '%@'\n",  v6);
        }
      }

      else
      {
        assertions = self->_assertions;
        if (!assertions)
        {
          id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          unsigned int v9 = self->_assertions;
          self->_assertions = v8;

          assertions = self->_assertions;
        }

        -[NSMutableSet addObject:](assertions, "addObject:", v6);
        NSUInteger v10 = -[NSCountedSet countForObject:](self->_daemon->_assertions, "countForObject:", v6);
        uint64_t v11 = self->_daemon->_assertions;
        if (!v11)
        {
          uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
          daemon = self->_daemon;
          uint64_t v14 = daemon->_assertions;
          daemon->_assertions = v12;

          uint64_t v11 = self->_daemon->_assertions;
        }

        -[NSCountedSet addObject:](v11, "addObject:", v6);
        if (dword_100131820 <= 30
          && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
        {
          LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection activateAssertionWithIdentifier:]",  30LL,  "Activate assertion '%@': %d -> %d\n",  v6,  v10,  (v10 + 1));
        }

        if (!v10
          && ([v6 isEqual:@"com.apple.rapport.KeepAlive"] & 1) == 0
          && dword_100131820 <= 30
          && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
        {
          LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection activateAssertionWithIdentifier:]",  30LL,  "Ignoring add unknown assertion '%@'\n",  v6);
        }
      }
    }

    v5 = v15;
  }
}

- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v13 = 0LL;
  unsigned __int8 v8 = -[RPDaemonXPCConnection _entitledForLabel:error:]( self,  "_entitledForLabel:error:",  @"AddOrUpdateIdentity",  &v13);
  id v9 = v13;
  if ((v8 & 1) != 0)
  {
    NSUInteger v10 = (void *)objc_claimAutoreleasedReturnValue(+[RPPeopleDaemon sharedPeopleDaemon](&OBJC_CLASS___RPPeopleDaemon, "sharedPeopleDaemon"));
    id v12 = v9;
    [v10 addOrUpdateIdentity:v6 error:&v12];
    id v11 = v12;

    id v9 = v11;
  }

  if (v7) {
    v7[2](v7, v9);
  }
}

- (void)_invalidateAssertions
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v3 = self->_assertions;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        NSUInteger v9 = -[NSCountedSet countForObject:](self->_daemon->_assertions, "countForObject:", v8);
        -[NSCountedSet removeObject:](self->_daemon->_assertions, "removeObject:", v8);
        if (dword_100131820 <= 30
          && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
        {
          LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection _invalidateAssertions]",  30LL,  "Invalidate assertion '%@': %d -> %d\n",  v8,  v9,  (v9 - 1));
        }

        if (v9 == 1
          && ([v8 isEqual:@"com.apple.rapport.KeepAlive"] & 1) == 0
          && dword_100131820 <= 30
          && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
        {
          LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection _invalidateAssertions]",  30LL,  "Ignoring remove unknown assertion '%@'\n",  v8);
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_assertions, "removeAllObjects");
}

- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v10 = (void (**)(id, void, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v36 = 0LL;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", @"DiagnosticCommand", &v36);
  id v17 = v36;
  if (v17)
  {
    if (v10) {
      v10[2](v10, 0LL, v17);
    }
    goto LABEL_19;
  }

  if (!v8)
  {
    if (!v10) {
      goto LABEL_19;
    }
    id v29 = RPErrorF(4294960589LL, (uint64_t)"Null command", v11, v12, v13, v14, v15, v16, v31);
    goto LABEL_22;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v18 = self->_daemon->_subDaemons;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    while (2)
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        if ([*(id *)(*((void *)&v32 + 1) + 8 * (void)i) diagnosticCommand:v8 params:v9])
        {

          goto LABEL_17;
        }
      }

      id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
      if (v20) {
        continue;
      }
      break;
    }
  }

  if (!-[RPDaemon diagnosticCommand:params:](self->_daemon, "diagnosticCommand:params:", v8, v9))
  {
    if (!v10) {
      goto LABEL_19;
    }
    id v29 = RPErrorF(4294960561LL, (uint64_t)"Unsupported command '%@'", v23, v24, v25, v26, v27, v28, (uint64_t)v8);
LABEL_22:
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v10[2](v10, 0LL, v30);

    goto LABEL_19;
  }

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v17 = 0LL;
  -[RPDaemonXPCConnection _entitledForLabel:error:]( self,  "_entitledForLabel:error:",  @"DiagnosticLogControl",  &v17);
  id v8 = v17;
  id v9 = v8;
  if (v8)
  {
    if (v7)
    {
      uint64_t v10 = NSPrintF("### Error: %{error}\n", v8);
LABEL_4:
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v7[2](v7, v11);
    }
  }

  else
  {
    if (v6)
    {
      uint64_t v12 = LogControl([v6 UTF8String]);
      if ((_DWORD)v12)
      {
        if (!v7) {
          goto LABEL_5;
        }
        uint64_t v10 = NSPrintF("### Control error: %#m\n", v12);
        goto LABEL_4;
      }
    }

    uint64_t v16 = 0LL;
    uint64_t v13 = LogShow(&v16);
    uint64_t v14 = v16;
    if (!v16)
    {
      if (!v7) {
        goto LABEL_5;
      }
      uint64_t v10 = NSPrintF("### Show error: %#m\n", v13);
      goto LABEL_4;
    }

    if (!v7
      || (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:")),
          v7[2](v7, v15),
          v15,
          (uint64_t v14 = v16) != 0LL))
    {
      free(v14);
    }
  }

- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v22 = 0LL;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", @"DiagnosticShow", &v22);
  id v10 = v22;
  uint64_t v11 = v10;
  if (!v10)
  {
    if (v8 && [v8 rangeOfString:@"ident" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      uint64_t v19 = CUDescriptionWithLevel(v18, 0x800000LL);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (!v9)
      {
LABEL_14:

        goto LABEL_15;
      }
    }

    else
    {
      unsigned int v14 = [v8 isEqual:@"kc"];
      daemon = self->_daemon;
      if (v14)
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue(-[RPDaemon keychainStateString](daemon, "keychainStateString"));
      }

      else
      {
        uint64_t v17 = CUDescriptionWithLevel(daemon, a4 | 0x800000u);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v17);
      }

      uint64_t v13 = (void *)v16;
      if (!v9) {
        goto LABEL_14;
      }
    }

    if (!v13)
    {
      uint64_t v20 = NSPrintF("### Generate output failed\n");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v9[2](v9, v21);

      goto LABEL_14;
    }

- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4
{
  __int16 v4 = a3;
  id v6 = (void (**)(id, NSMutableArray *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v35 = 0LL;
  -[RPDaemonXPCConnection _entitledForLabel:error:](self, "_entitledForLabel:error:", @"GetIdentities", &v35);
  id v7 = v35;
  if (!v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ((v4 & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identityOfSelfAndReturnError:0]);

      if (v10) {
        -[NSMutableArray addObject:](v8, "addObject:", v10);
      }

      if ((v4 & 2) == 0)
      {
LABEL_5:
        if ((v4 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_23;
      }
    }

    else if ((v4 & 2) == 0)
    {
      goto LABEL_5;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identitiesOfType:2 error:0]);

    if (v12) {
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v12);
    }

    if ((v4 & 4) == 0)
    {
LABEL_6:
      if ((v4 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_26;
    }

- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3
{
  uint64_t v15 = (void (**)(id, void))a3;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.RegenerateIdentity"));
  unsigned __int8 v5 = [v4 isEqual:&__kCFBooleanTrue];

  if ((v5 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    [v12 regenerateTemporarySelfIdentity];

    v15[2](v15, 0LL);
  }

  else
  {
    id v13 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@' for %@",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)@"com.apple.rapport.RegenerateIdentity");
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100131820 <= 60
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 60LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection regenerateTemporarySelfIdentityWithCompletion:]",  60LL,  "### %#{pid} %{error}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v14);
    }

    ((void (**)(id, void *))v15)[2](v15, v14);
  }
}

- (void)primaryAccountSignedInWithCompletion:(id)a3
{
  uint64_t v15 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.Client"));
  unsigned __int8 v5 = [v4 isEqual:&__kCFBooleanTrue];

  if ((v5 & 1) != 0)
  {
    if (dword_100131820 <= 30
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedInWithCompletion:]",  30LL,  "Primary account signed in from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v14 postDaemonInfoChanges:64];

    v15[2](v15, 0LL);
  }

  else
  {
    id v12 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@' for %@",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)@"com.apple.rapport.Client");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (dword_100131820 <= 60
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 60LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedInWithCompletion:]",  60LL,  "### %#{pid} %{error}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v13);
    }

    ((void (**)(id, void *))v15)[2](v15, v13);
  }
}

- (void)primaryAccountSignedOutWithCompletion:(id)a3
{
  __int16 v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.Client"));
  unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];

  if ((v6 & 1) != 0)
  {
    if (dword_100131820 <= 30
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]",  30LL,  "Primary account signed out from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    id v15 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v15 setAccessGroup:@"com.apple.rapport"];
    [v15 setSyncType:3];
    id v16 = objc_alloc_init(&OBJC_CLASS___CUKeychainManager);
    id v36 = 0LL;
    id v29 = v15;
    id v17 = [v16 copyItemsMatchingItem:v15 flags:10 error:&v36];
    id v18 = v36;
    if (v18
      && dword_100131820 <= 90
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 90LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]",  90LL,  "### Get keychain items to delete failed: %{error}\n",  v18);
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
    v30 = v4;
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          if (dword_100131820 <= 30
            && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 30LL)))
          {
            LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]",  30LL,  "Removing %@\n",  v24);
          }

          id v31 = 0LL;
          unsigned int v25 = [v16 removeItemMatchingItem:v24 error:&v31];
          id v26 = v31;
          id v18 = v26;
          if (v25) {
            BOOL v27 = v26 == 0LL;
          }
          else {
            BOOL v27 = 0;
          }
          if (!v27
            && dword_100131820 <= 90
            && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 90LL)))
          {
            LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]",  90LL,  "### Remove failed: %@, %{error}\n",  v24,  v18);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v21);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    [v28 postDaemonInfoChanges:16];

    __int16 v4 = v30;
    v30[2](v30, 0LL);
  }

  else
  {
    id v13 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@' for %@",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)@"com.apple.rapport.Client");
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100131820 <= 60
      && (dword_100131820 != -1 || _LogCategory_Initialize(&dword_100131820, 60LL)))
    {
      LogPrintF( &dword_100131820,  "-[RPDaemonXPCConnection primaryAccountSignedOutWithCompletion:]",  60LL,  "### %#{pid} %{error}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v14);
    }

    v4[2](v4, v14);
  }
}

- (void)serverCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void *, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v41 = 0LL;
  unsigned __int8 v16 = -[RPDaemonXPCConnection _entitledForLabel:error:]( self,  "_entitledForLabel:error:",  @"createDeviceMapping",  &v41);
  id v17 = v41;
  if ((v16 & 1) != 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[RPCompanionLinkDaemon sharedCompanionLinkDaemon]( &OBJC_CLASS___RPCompanionLinkDaemon,  "sharedCompanionLinkDaemon"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 findDeviceFromID:v13]);

    if (v19)
    {
      switch(a3)
      {
        case 2:
          +[RPNWListener queryDeviceToApplicationServiceMapping:device:completion:]( &OBJC_CLASS___RPNWListener,  "queryDeviceToApplicationServiceMapping:device:completion:",  v12,  v19,  v15);
          break;
        case 1:
          id v36 =  +[RPNWListener addDeviceToApplicationServiceMapping:device:completion:]( &OBJC_CLASS___RPNWListener,  "addDeviceToApplicationServiceMapping:device:completion:",  v12,  v19,  v15);
          break;
        case 0:
          if (!+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]( &OBJC_CLASS___RPNWEndpoint,  "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:",  v19,  v14,  v12,  0LL,  0LL))
          {
            id v32 = RPErrorF(4294960569LL, (uint64_t)"Failed to add endpoint mapping", v26, v27, v28, v29, v30, v31, v40);
            uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);

            id v17 = (id)v33;
          }

          if (v15)
          {
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
            __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 networkAgentID]);
            v15[2](v15, v35, v17);
          }

          break;
        default:
          v37 = "Invalid mapping type";
          goto LABEL_21;
      }

- (void)serverSetAutoMappingInternal:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  +[RPNWListener setAutoMapping:](&OBJC_CLASS___RPNWListener, "setAutoMapping:", v4);
  unsigned __int8 v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    unsigned __int8 v5 = v6;
  }
}

- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v10 = 0LL;
  -[RPDaemonXPCConnection _entitledForLabel:error:]( self,  "_entitledForLabel:error:",  @"removeSessionPairedIdentity",  &v10);
  id v8 = v10;
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    [v9 removeSessionPairedIdentityWithIdentifier:v6];

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (NSMutableSet)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end