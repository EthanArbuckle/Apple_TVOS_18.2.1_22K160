@interface NRLinkDirector
- (BOOL)preferWiFiP2PRequestUpdated;
- (BOOL)preferWiFiRequestAvailable;
- (BOOL)preferWiFiRequestUnavailable;
- (void)apsIsConnected:(BOOL)a3;
- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3;
- (void)directToCloudRequestAvailable;
- (void)directToCloudRequestUnavailable;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4;
- (void)localAWDLEndpointChanged:(id)a3;
- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4;
- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4;
@end

@implementation NRLinkDirector

- (void)linkIsAvailable:(id)a3
{
  id v18 = a3;
  v4 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0LL;
    }
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      [v8 linkIsAvailable:v18];
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      sub_1000A2084((uint64_t)self, 1014, @"linkAvailable %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0LL;
    }
  }

  else
  {
    id v15 = sub_1000A2100();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_8;
    }
    id v8 = sub_1000A2100();
    _NRLogWithArgs(v8, 17LL, "%s called with null link", "-[NRLinkDirector linkIsAvailable:]");
  }

LABEL_8:
}

- (void)linkIsReady:(id)a3
{
  id v18 = a3;
  v4 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0LL;
    }
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      [v8 linkIsReady:v18];
      sub_1000A2170((uint64_t)self);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      sub_1000A2084((uint64_t)self, 1014, @"linkReady %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0LL;
    }
  }

  else
  {
    id v15 = sub_1000A2100();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_8;
    }
    id v8 = sub_1000A2100();
    _NRLogWithArgs(v8, 17LL, "%s called with null link", "-[NRLinkDirector linkIsReady:]");
  }

LABEL_8:
}

- (void)linkIsSuspended:(id)a3
{
  id v18 = a3;
  v4 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0LL;
    }
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      [v8 linkIsSuspended:v18];
      sub_1000A2170((uint64_t)self);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      sub_1000A2084((uint64_t)self, 1014, @"linkSuspended %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0LL;
    }
  }

  else
  {
    id v15 = sub_1000A2100();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_8;
    }
    id v8 = sub_1000A2100();
    _NRLogWithArgs(v8, 17LL, "%s called with null link", "-[NRLinkDirector linkIsSuspended:]");
  }

LABEL_8:
}

- (void)linkIsUnavailable:(id)a3
{
  id v18 = a3;
  v4 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0LL;
    }
    v6 = conductors;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));

    if (v8)
    {
      [v8 linkIsUnavailable:v18];
      sub_1000A2170((uint64_t)self);
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v18 nrUUID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      sub_1000A2084((uint64_t)self, 1014, @"linkUnavailable %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0LL;
    }
  }

  else
  {
    id v15 = sub_1000A2100();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v15, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_8;
    }
    id v8 = sub_1000A2100();
    _NRLogWithArgs(v8, 17LL, "%s called with null link", "-[NRLinkDirector linkIsUnavailable:]");
  }

LABEL_8:
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  v7 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  if (v23)
  {
    if (v6)
    {
      if (self) {
        conductors = self->_conductors;
      }
      else {
        conductors = 0LL;
      }
      v9 = conductors;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v23 nrUUID]);
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));

      if (v11)
      {
        [v11 linkDidReceiveData:v23 data:v6];
      }

      else
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v23 nrUUID]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
        sub_1000A2084((uint64_t)self, 1014, @"linkDidReceiveData %@ %@", v13, v14, v15, v16, v17, (uint64_t)v23);

        id v11 = 0LL;
      }
    }

    else
    {
      id v20 = sub_1000A2100();
      int IsLevelEnabled = _NRLogIsLevelEnabled(v20, 17LL);

      if (!IsLevelEnabled) {
        goto LABEL_9;
      }
      id v11 = sub_1000A2100();
      _NRLogWithArgs(v11, 17LL, "%s called with null data");
    }
  }

  else
  {
    id v18 = sub_1000A2100();
    int v19 = _NRLogIsLevelEnabled(v18, 17LL);

    if (!v19) {
      goto LABEL_9;
    }
    id v11 = sub_1000A2100();
    _NRLogWithArgs(v11, 17LL, "%s called with null link");
  }

LABEL_9:
}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  id v6 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  if (v21)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0LL;
    }
    id v8 = conductors;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v21 nrUUID]);
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9));

    if (v10)
    {
      [v10 linkPeerIsAsleep:v21 isAsleep:v4];
    }

    else
    {
      if (v4) {
        id v11 = "";
      }
      else {
        id v11 = " not";
      }
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v21 nrUUID]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
      sub_1000A2084((uint64_t)self, 1014, @"peer%s asleep %@ %@", v13, v14, v15, v16, v17, (uint64_t)v11);

      id v10 = 0LL;
    }
  }

  else
  {
    id v18 = sub_1000A2100();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v18, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_11;
    }
    id v10 = sub_1000A2100();
    _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkDirector linkPeerIsAsleep:isAsleep:]");
  }

LABEL_11:
}

- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v17 = a4;
  id v6 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](conductors, "objectForKeyedSubscript:", v17));
  v9 = v8;
  if (v8)
  {
    [v8 pipeDidConnectForNRUUID:v4 nrUUID:v17];
  }

  else
  {
    if (v4) {
      id v10 = "";
    }
    else {
      id v10 = " not";
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    sub_1000A2084((uint64_t)self, 1014, @"peer%s nearby %@", v11, v12, v13, v14, v15, (uint64_t)v10);
  }
}

- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v17 = a4;
  id v6 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](conductors, "objectForKeyedSubscript:", v17));
  v9 = v8;
  if (v8)
  {
    [v8 peerDidUnpairBluetooth:v4 nrUUID:v17];
  }

  else
  {
    if (v4) {
      id v10 = "";
    }
    else {
      id v10 = "not ";
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    sub_1000A2084((uint64_t)self, 1014, @"peer did%s unregister %@", v11, v12, v13, v14, v15, (uint64_t)v10);
  }
}

- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  if (v3)
  {
    if (self)
    {
      bluetoothManager = self->_bluetoothManager;
      if (bluetoothManager)
      {
        v7 = bluetoothManager->super._queue;
        dispatch_assert_queue_V2(v7);

        if (bluetoothManager->_pipeManager)
        {
          if (bluetoothManager->_hasEnabledDevicesUsingClientServer)
          {
            id v8 = sub_10002B4A4((uint64_t)bluetoothManager, 3LL, 0);
            if (v8) {
              v8->_flags |= 4u;
            }
          }

          if (bluetoothManager->_hasEnabledDevicesUsingP2P)
          {
            v9 = sub_10002B4A4((uint64_t)bluetoothManager, 3LL, 1);
            if (v9) {
              v9->_flags |= 4u;
            }
          }

          sub_10002A260((uint64_t)bluetoothManager, 3LL, 0);
          sub_10002A260((uint64_t)bluetoothManager, 3LL, 1);
        }
      }

- (void)apsIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0LL;
  }
  v7 = conductors;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    if (self)
    {
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
          [v12 apsIsConnected:v3];

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v9);
    }

    else
    {
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v13),  (void)v15));
          [v14 apsIsConnected:v3];

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v9 != v13);
        id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v9);
    }
  }
}

- (BOOL)preferWiFiRequestAvailable
{
  BOOL v3 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0LL;
  }
  v5 = conductors;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i),  (void)v17));
          unsigned __int8 v12 = [v11 preferWiFiRequestAvailable];

          v9 &= v12;
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }

    else
    {
      do
      {
        for (j = 0LL; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)j),  (void)v17));
          unsigned __int8 v16 = [v15 preferWiFiRequestAvailable];

          v9 &= v16;
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }
  }

  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)preferWiFiRequestUnavailable
{
  BOOL v3 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0LL;
  }
  v5 = conductors;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i),  (void)v17));
          unsigned __int8 v12 = [v11 preferWiFiRequestUnavailable];

          v9 &= v12;
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }

    else
    {
      do
      {
        for (j = 0LL; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)j),  (void)v17));
          unsigned __int8 v16 = [v15 preferWiFiRequestUnavailable];

          v9 &= v16;
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }
  }

  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)preferWiFiP2PRequestUpdated
{
  BOOL v3 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0LL;
  }
  v5 = conductors;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)i),  (void)v17));
          unsigned __int8 v12 = [v11 preferWiFiP2PRequestUpdated];

          v9 &= v12;
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }

    else
    {
      do
      {
        for (j = 0LL; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)j),  (void)v17));
          unsigned __int8 v16 = [v15 preferWiFiP2PRequestUpdated];

          v9 &= v16;
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }
  }

  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)directToCloudRequestAvailable
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    conductors = self->_conductors;
  }

  else
  {
    dispatch_assert_queue_V2(0LL);
    conductors = 0LL;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
  }

  BOOL v4 = conductors;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    if (self)
    {
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i),  (void)v12));
          [v9 directToCloudRequestAvailable];
        }

        id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }

    else
    {
      do
      {
        for (j = 0LL; j != v6; j = (char *)j + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)j),  (void)v12));
          [v11 directToCloudRequestAvailable];
        }

        id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }
  }
}

- (void)directToCloudRequestUnavailable
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    conductors = self->_conductors;
  }

  else
  {
    dispatch_assert_queue_V2(0LL);
    conductors = 0LL;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
  }

  BOOL v4 = conductors;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    if (self)
    {
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i),  (void)v12));
          [v9 directToCloudRequestUnavailable];
        }

        id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }

    else
    {
      do
      {
        for (j = 0LL; j != v6; j = (char *)j + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)j),  (void)v12));
          [v11 directToCloudRequestUnavailable];
        }

        id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v6);
    }
  }
}

- (void)localAWDLEndpointChanged:(id)a3
{
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    conductors = self->_conductors;
  }

  else
  {
    dispatch_assert_queue_V2(0LL);
    conductors = 0LL;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
  }

  id v6 = conductors;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    if (self)
    {
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_conductors,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  (void)v14));
          [v11 localAWDLEndpointChanged:v4];

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }

    else
    {
      do
      {
        __int128 v12 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( 0,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8 * (void)v12),  (void)v14));
          [v13 localAWDLEndpointChanged:v4];

          __int128 v12 = (char *)v12 + 1;
        }

        while (v8 != v12);
        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }
  }
}

- (void).cxx_destruct
{
}

@end