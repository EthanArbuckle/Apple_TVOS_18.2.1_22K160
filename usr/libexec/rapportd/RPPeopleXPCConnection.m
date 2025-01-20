@interface RPPeopleXPCConnection
- (BOOL)_entitledAndReturnError:(id)a3 error:(id *)a4;
- (BOOL)entitledFriendAccount;
- (BOOL)entitledPeople;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPPeopleDaemon)daemon;
- (RPPeopleDiscovery)activatedDiscovery;
- (RPPeopleXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (void)clientDeviceChanged:(id)a3 changes:(unsigned int)a4;
- (void)clientDeviceFound:(id)a3 report:(BOOL)a4;
- (void)clientDeviceLost:(id)a3;
- (void)clientPeopleStatusChanged:(unsigned int)a3;
- (void)connectionInvalidated;
- (void)setDispatchQueue:(id)a3;
- (void)xpcPeopleAddAppleID:(id)a3 completion:(id)a4;
- (void)xpcPeopleDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)xpcPeopleDiscoveryUpdate:(id)a3;
- (void)xpcPeopleRemoveAppleID:(id)a3 completion:(id)a4;
@end

@implementation RPPeopleXPCConnection

- (RPPeopleXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPPeopleXPCConnection;
  v9 = -[RPPeopleXPCConnection init](&v13, "init");
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
  if (dword_100132930 <= 20 && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 20LL))) {
    LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection connectionInvalidated]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  v5 = self->_activatedDiscovery;
  if (v5) {
    -[NSMutableSet removeObject:](self->_daemon->_discoveryClients, "removeObject:", v5);
  }
  -[RPPeopleDiscovery invalidate](self->_activatedDiscovery, "invalidate");
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0LL;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0LL;
}

- (BOOL)_entitledAndReturnError:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", v6));
  unsigned __int8 v8 = [v7 isEqual:&__kCFBooleanTrue];

  if ((v8 & 1) == 0)
  {
    if (dword_100132930 <= 90
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection _entitledAndReturnError:error:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v6);
    }

    if (a4)
    {
      id v15 = RPErrorF(4294896128LL, (uint64_t)"Missing entitlement '%@'", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v15);
    }
  }

  return v8;
}

- (void)clientDeviceFound:(id)a3 report:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  id v6 = self->_activatedDiscovery;
  if (v6)
  {
    unsigned int v7 = [v27 flags];
    if ((self->_discoveryDeviceFlags & v7) != 0)
    {
      char v8 = v7;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
      if (!v9)
      {
LABEL_35:

        goto LABEL_36;
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v9));
      if (v10)
      {
        if ((v8 & 1) == 0) {
          goto LABEL_6;
        }
      }

      else
      {
        discoveredDevices = self->_discoveredDevices;
        if (!discoveredDevices)
        {
          uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v14 = self->_discoveredDevices;
          self->_discoveredDevices = v13;

          discoveredDevices = self->_discoveredDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v27, v9);
        if ((v8 & 1) == 0)
        {
LABEL_6:
          uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 accountID]);
          if (!v11)
          {
            if ((self->_discoveryDeviceFlags & 0x1000) == 0)
            {
              if (dword_100132930 <= 60
                && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
              {
                LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceFound:report:]",  60LL,  "### Device found without accountID: %@\n",  v27);
              }

              goto LABEL_34;
            }

            uint64_t v11 = v9;
          }

- (void)clientDeviceLost:(id)a3
{
  id v17 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v4));
    if (!v5)
    {
LABEL_31:

      goto LABEL_32;
    }

    if ([v17 flags])
    {
      id v6 = @"$icloud";
    }

    else
    {
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 accountID]);
      if (!v6)
      {
        if ((self->_discoveryDeviceFlags & 0x1000) == 0)
        {
          if (dword_100132930 <= 60
            && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
          {
            LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceLost:]",  60LL,  "### Device lost without accountID: %@\n",  v17);
          }

          goto LABEL_31;
        }

        id v6 = v4;
      }
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredPeople,  "objectForKeyedSubscript:",  v6));
    char v8 = v7;
    if (!v7)
    {
      if (dword_100132930 <= 60
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceLost:]",  60LL,  "### Device lost without person: %@\n",  v17);
      }

      goto LABEL_30;
    }

    id v9 = [v7 removeRPDevice:v17];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 devices]);
    id v11 = [v10 count];

    if (v11)
    {
      if ((-[RPPeopleDiscovery changeFlags](self->_activatedDiscovery, "changeFlags") & v9) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }

      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        uint64_t v12 = CUDescriptionWithLevel(v8, 30LL);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceLost:]",  30LL,  "Person changed: %@, %#{flags}\n",  v13,  v9,  &unk_10010AF5D);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v16 xpcPersonChanged:v8 changes:v9];
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoveredPeople,  "setObject:forKeyedSubscript:",  0LL,  v6);
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        uint64_t v14 = CUDescriptionWithLevel(v8, 30LL);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceLost:]",  30LL,  "Person lost: %@, %#{flags}\n",  v15,  v9,  &unk_10010AF5D);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v16 xpcPersonLost:v8];
    }

    goto LABEL_30;
  }

- (void)clientDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  __int16 v4 = a4;
  id v16 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredDevices,  "objectForKeyedSubscript:",  v6));
    if (v7)
    {
      unsigned int v8 = [v16 flags];
      if ((v8 & 1) != 0)
      {
        id v9 = @"$icloud";
      }

      else
      {
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 accountID]);
        if (!v9)
        {
          if ((self->_discoveryDeviceFlags & 0x1000) == 0)
          {
            if (dword_100132930 <= 60
              && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 60LL)))
            {
              LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceChanged:changes:]",  60LL,  "### Device changed without accountID: %@\n",  v16);
            }

            goto LABEL_23;
          }

          id v9 = v6;
        }
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveredPeople,  "objectForKeyedSubscript:",  v9));
      id v11 = v10;
      if (v10)
      {
        if ((self->_discoveryDeviceFlags & v8) != 0)
        {
          uint64_t v12 = [v10 updateWithRPDevice:v16] | ((v4 & 0x25B) != 0);
          if ((-[RPPeopleDiscovery changeFlags](self->_activatedDiscovery, "changeFlags") & v12) != 0)
          {
            if (dword_100132930 <= 30
              && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
            {
              uint64_t v13 = CUDescriptionWithLevel(v11, 30LL);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
              LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection clientDeviceChanged:changes:]",  30LL,  "Person changed: %@, %#{flags}\n",  v14,  v12,  &unk_10010AF5D);
            }

            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
            [v15 xpcPersonChanged:v11 changes:v12];
          }
        }

        else
        {
          -[RPPeopleXPCConnection clientDeviceLost:](self, "clientDeviceLost:", v16);
        }
      }

      else
      {
        -[RPPeopleXPCConnection clientDeviceFound:report:](self, "clientDeviceFound:report:", v16, 1LL);
      }

      goto LABEL_23;
    }

    -[RPPeopleXPCConnection clientDeviceFound:report:](self, "clientDeviceFound:report:", v16, 1LL);
LABEL_23:
  }
}

- (void)clientPeopleStatusChanged:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v4 xpcPeopleStatusChanged:v3];
}

- (void)xpcPeopleAddAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void))a4;
  if (self->_entitledFriendAccount)
  {
    id v8 = 0LL;
    goto LABEL_4;
  }

  id v14 = 0LL;
  BOOL v9 = -[RPPeopleXPCConnection _entitledAndReturnError:error:]( self,  "_entitledAndReturnError:error:",  @"com.apple.rapport.FriendAccount",  &v14);
  id v8 = v14;
  self->_entitledFriendAccount = v9;
  if (v9)
  {
LABEL_4:
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100132930 <= 40
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 40LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleAddAppleID:completion:]",  40LL,  "AddAppleID: '%{mask}'\n",  v6);
    }

    -[RPPeopleDaemon _updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:]( self->_daemon,  "_updateFriendIdentityWithAppleID:contactID:sendersKnownAlias:userAdded:updateDateRequested:suggestedContactIDs:",  v6,  0LL,  0LL,  1LL,  0LL,  0LL);
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleAddAppleID:completion:]",  30LL,  "Friend identity has been manually added. Sending friend request immediately.");
    }

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___RPCloudMessageContext);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_daemon->_friendAccountIdentityMap,  "objectForKeyedSubscript:",  v6));
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 sendersKnownAlias]);
      -[RPCloudMessageContext setSendersKnownAlias:](v10, "setSendersKnownAlias:", v13);
    }

    -[RPPeopleDaemon _sendCloudIdentityFrameType:destinationID:flags:msgCtx:]( self->_daemon,  "_sendCloudIdentityFrameType:destinationID:flags:msgCtx:",  64LL,  v6,  1LL,  v10);
    if (v7) {
      v7[2](v7, 0LL);
    }

    goto LABEL_19;
  }

  if (v7) {
    ((void (**)(id, id))v7)[2](v7, v8);
  }
LABEL_19:
}

- (void)xpcPeopleRemoveAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, id))a4;
  if (self->_entitledFriendAccount)
  {
    id v8 = 0LL;
    goto LABEL_4;
  }

  id v38 = 0LL;
  BOOL v9 = -[RPPeopleXPCConnection _entitledAndReturnError:error:]( self,  "_entitledAndReturnError:error:",  @"com.apple.rapport.FriendAccount",  &v38);
  id v8 = v38;
  self->_entitledFriendAccount = v9;
  if (v9)
  {
LABEL_4:
    if (dword_100132930 <= 40
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 40LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleRemoveAppleID:completion:]",  40LL,  "RemoveAppleID: '%{mask}'\n",  v6);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_daemon->_friendAccountIdentityMap,  "objectForKeyedSubscript:",  v6));
    BOOL v11 = v10 != 0;
    if (v10)
    {
      if (dword_100132930 <= 40
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 40LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleRemoveAppleID:completion:]",  40LL,  "RemoveAppleID account: %@\n",  v10);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_daemon->_friendAccountIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v6);
      self->_daemon->_needsFriendAccountUpdate = 1;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
      [v12 removeIdentity:v10 error:0];
    }

    v31 = (void *)v10;
    id v32 = v8;
    v33 = v7;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_daemon->_friendDeviceIdentityMap, "allKeys"));
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_daemon->_friendDeviceIdentityMap,  "objectForKeyedSubscript:",  v18));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
          if ([v20 isEqual:v6])
          {
            if (dword_100132930 <= 40
              && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 40LL)))
            {
              LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleRemoveAppleID:completion:]",  40LL,  "RemoveAppleID device: %@\n",  v19);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_daemon->_friendDeviceIdentityMap,  "setObject:forKeyedSubscript:",  0LL,  v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[RPIdentityDaemon sharedIdentityDaemon]( &OBJC_CLASS___RPIdentityDaemon,  "sharedIdentityDaemon"));
            [v21 removeIdentity:v19 error:0];

            BOOL v11 = 1;
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v15);
    }

    id v8 = v32;
    unsigned int v7 = v33;
    if (v33)
    {
      if (v11)
      {
        v33[2](v33, 0LL);
      }

      else
      {
        id v28 = RPErrorF(4294960569LL, (uint64_t)"No account or device found to remove", v22, v23, v24, v25, v26, v27, v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v33[2](v33, v29);
      }
    }

    goto LABEL_34;
  }

  if (v7) {
    v7[2](v7, v8);
  }
LABEL_34:
}

- (void)xpcPeopleDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_entitledPeople)
  {
    id v9 = 0LL;
    goto LABEL_4;
  }

  id v23 = 0LL;
  BOOL v10 = -[RPPeopleXPCConnection _entitledAndReturnError:error:]( self,  "_entitledAndReturnError:error:",  @"com.apple.rapport.people",  &v23);
  id v9 = v23;
  self->_entitledPeople = v10;
  if (v10)
  {
LABEL_4:
    if (self->_activatedDiscovery)
    {
      if (dword_100132930 <= 30
        && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
      {
        LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleDiscoveryActivate:completion:]",  30LL,  "RPPeopleDiscovery activate when already activated\n");
      }

      if (v8) {
        v8[2](v8, &__NSArray0__struct, 0LL);
      }
      goto LABEL_31;
    }

    unsigned int v11 = [v7 discoveryMode];
    if (v11 == 200)
    {
      int v12 = 2;
    }

    else
    {
      if (v11 != 400) {
        goto LABEL_15;
      }
      int v12 = 16;
    }

    objc_msgSend(v7, "setDiscoveryFlags:", objc_msgSend(v7, "discoveryFlags") | v12);
LABEL_15:
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleDiscoveryActivate:completion:]",  30LL,  "RPPeopleDiscovery activate from %#{pid}, %@\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v7);
    }

    [v7 setDispatchQueue:self->_dispatchQueue];
    unsigned int v13 = [v7 discoveryFlags];
    self->_discoveryDeviceFlags = (v13 >> 1) & 0x10 | v13 & 0xA | (v13 >> 2) & 4 | (v13 >> 1) & 0x20 | (v13 >> 2) & 1 | (v13 >> 1) & 0xC0 | (((v13 >> 10) & 1) << 12);
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    discoveryClients = self->_daemon->_discoveryClients;
    if (!discoveryClients)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      daemon = self->_daemon;
      id v17 = daemon->_discoveryClients;
      daemon->_discoveryClients = v15;

      discoveryClients = self->_daemon->_discoveryClients;
    }

    -[NSMutableSet addObject:](discoveryClients, "addObject:", v7);
    discoveredDevices = self->_daemon->_discoveredDevices;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100090D64;
    v22[3] = &unk_1001146F8;
    v22[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveredDevices,  "enumerateKeysAndObjectsUsingBlock:",  v22);
    if (v8)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveredPeople, "allValues"));
      id v20 = (void *)v19;
      if (v19) {
        v21 = (void *)v19;
      }
      else {
        v21 = &__NSArray0__struct;
      }
      v8[2](v8, v21, 0LL);
    }

    -[RPPeopleDaemon _update](self->_daemon, "_update");
    goto LABEL_31;
  }

  if (v8) {
    ((void (**)(id, void *, id))v8)[2](v8, 0LL, v9);
  }
LABEL_31:
}

- (void)xpcPeopleDiscoveryUpdate:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activatedDiscovery)
  {
    if (dword_100132930 <= 90
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 90LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleDiscoveryUpdate:]",  90LL,  "### RPPeopleDiscovery update when not in use\n");
    }

    goto LABEL_23;
  }

  unsigned int v4 = [v9 discoveryMode];
  if (v4 == 200)
  {
    int v5 = 2;
    goto LABEL_9;
  }

  if (v4 == 400)
  {
    int v5 = 16;
LABEL_9:
    objc_msgSend(v9, "setDiscoveryFlags:", objc_msgSend(v9, "discoveryFlags") | v5);
  }

  id v6 = -[RPPeopleDiscovery discoveryFlags](self->_activatedDiscovery, "discoveryFlags");
  id v7 = [v9 discoveryFlags];
  if ((_DWORD)v7 != (_DWORD)v6)
  {
    if (dword_100132930 <= 30
      && (dword_100132930 != -1 || _LogCategory_Initialize(&dword_100132930, 30LL)))
    {
      LogPrintF( &dword_100132930,  "-[RPPeopleXPCConnection xpcPeopleDiscoveryUpdate:]",  30LL,  "RPPeopleDiscovery discoveryFlags changed: %#{flags} -> %#{flags}\n",  v6,  &unk_10010AF87,  v7,  &unk_10010AF87);
    }

    -[RPPeopleDiscovery setDiscoveryFlags:](self->_activatedDiscovery, "setDiscoveryFlags:", v7);
  }

  unsigned int v8 = (v7 >> 1) & 0x10 | v7 & 0xA | (v7 >> 2) & 4 | (v7 >> 1) & 0x20 | (v7 >> 2) & 1 | (v7 >> 1) & 0xC0 | (((v7 >> 10) & 1) << 12);
  if (v8 == self->_discoveryDeviceFlags)
  {
    if ((_DWORD)v7 == (_DWORD)v6) {
      goto LABEL_23;
    }
  }

  else
  {
    self->_discoveryDeviceFlags = v8;
  }

  -[RPPeopleDaemon _update](self->_daemon, "_update");
LABEL_23:
}

- (RPPeopleDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPPeopleDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitledFriendAccount
{
  return self->_entitledFriendAccount;
}

- (BOOL)entitledPeople
{
  return self->_entitledPeople;
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

- (void).cxx_destruct
{
}

@end