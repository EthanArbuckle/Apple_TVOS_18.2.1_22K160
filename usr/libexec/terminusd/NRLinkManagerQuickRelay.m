@interface NRLinkManagerQuickRelay
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerQuickRelay

- (void)cancel
{
  if (self) {
    self->super._state = 1004;
  }
}

- (void)invalidateManager
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NRLinkManagerQuickRelay;
  -[NRLinkManager invalidateManager](&v8, "invalidateManager");
  if (self)
  {
    pathEvaluator = self->_pathEvaluator;
    if (pathEvaluator)
    {
      nw_path_evaluator_cancel(pathEvaluator, v3);
      v5 = self->_pathEvaluator;
      self->_pathEvaluator = 0LL;
    }

    apsConnection = self->_apsConnection;
    if (apsConnection)
    {
      -[APSConnection setDelegate:](apsConnection, "setDelegate:", 0LL);
      v7 = self->_apsConnection;
      self->_apsConnection = 0LL;
    }
  }

- (void)dealloc
{
  if (qword_1001DC960 != -1) {
    dispatch_once(&qword_1001DC960, &stru_1001AF8E0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC958, 1LL))
  {
    if (qword_1001DC960 != -1) {
      dispatch_once(&qword_1001DC960, &stru_1001AF8E0);
    }
    _NRLogWithArgs( qword_1001DC958,  1LL,  "%s%.30s:%-4d Dealloc: %@",  ",  "-[NRLinkManagerQuickRelay dealloc]"",  89LL,  self);
  }

  -[NRLinkManagerQuickRelay invalidateManager](self, "invalidateManager");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRLinkManagerQuickRelay;
  -[NRLinkManagerQuickRelay dealloc](&v3, "dealloc");
}

- (id)copyName
{
  return @"Link Manager - QuickRelay";
}

- (id)copyStatusString
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  v4 = queue;
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v6 = -[NRLinkManagerQuickRelay copyName](self, "copyName");
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nName: %@", v6);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinkManager type: %@", StringFromNRLinkType);

    uint64_t state = self->super._state;
  }

  else
  {
    v11 = (void *)createStringFromNRLinkType(0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinkManager type: %@", v11);

    uint64_t state = 0LL;
  }

  v9 = sub_1000A2B20(state);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nState: %@", v9);

  return v5;
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      -[NSMutableSet addObject:](self->_links, "addObject:", v4);
      queue = self->super._queue;
    }

    else
    {
      dispatch_assert_queue_V2(0LL);
      [0 addObject:v4];
      queue = 0LL;
    }

    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FA198;
    block[3] = &unk_1001B0720;
    id v12 = v4;
    v13 = self;
    dispatch_async(v7, block);
  }

  else
  {
    id v8 = sub_1000F9A88();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17LL);

    if (IsLevelEnabled)
    {
      id v10 = sub_1000F9A88();
      _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsAvailable:]");
    }
  }
}

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      queue = self->super._queue;
    }

    else
    {
      dispatch_assert_queue_V2(0LL);
      queue = 0LL;
    }

    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FA088;
    block[3] = &unk_1001B0720;
    id v12 = v4;
    v13 = self;
    dispatch_async(v7, block);
  }

  else
  {
    id v8 = sub_1000F9A88();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17LL);

    if (IsLevelEnabled)
    {
      id v10 = sub_1000F9A88();
      _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsSuspended:]");
    }
  }
}

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      queue = self->super._queue;
    }

    else
    {
      dispatch_assert_queue_V2(0LL);
      queue = 0LL;
    }

    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F9F78;
    block[3] = &unk_1001B0720;
    id v12 = v4;
    v13 = self;
    dispatch_async(v7, block);
  }

  else
  {
    id v8 = sub_1000F9A88();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17LL);

    if (IsLevelEnabled)
    {
      id v10 = sub_1000F9A88();
      _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsReady:]");
    }
  }
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v5 = self->super._queue;
      dispatch_assert_queue_V2((dispatch_queue_t)v5);

      -[NSMutableSet removeObject:](self->_links, "removeObject:", v4);
      queue = self->super._queue;
    }

    else
    {
      dispatch_assert_queue_V2(0LL);
      [0 removeObject:v4];
      queue = 0LL;
    }

    v7 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F9B14;
    block[3] = &unk_1001B0720;
    void block[4] = self;
    id v12 = v4;
    dispatch_async(v7, block);

    sub_1000F9B60((uint64_t)self);
  }

  else
  {
    id v8 = sub_1000F9A88();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v8, 17LL);

    if (IsLevelEnabled)
    {
      id v10 = sub_1000F9A88();
      _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerQuickRelay linkIsUnavailable:]");
    }
  }
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v12 = sub_1000F9A88();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v12, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_6;
    }
    id v14 = sub_1000F9A88();
    _NRLogWithArgs(v14, 17LL, "%s called with null link");
LABEL_11:

    goto LABEL_6;
  }

  if (!v7)
  {
    id v15 = sub_1000F9A88();
    int v16 = _NRLogIsLevelEnabled(v15, 17LL);

    if (!v16) {
      goto LABEL_6;
    }
    id v14 = sub_1000F9A88();
    _NRLogWithArgs(v14, 17LL, "%s called with null data");
    goto LABEL_11;
  }

  if (self)
  {
    v9 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

    queue = self->super._queue;
  }

  else
  {
    dispatch_assert_queue_V2(0LL);
    queue = 0LL;
  }

  v11 = queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F9AC8;
  block[3] = &unk_1001B0748;
  void block[4] = self;
  id v18 = v6;
  id v19 = v8;
  dispatch_async(v11, block);

LABEL_6:
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (qword_1001DC960 != -1) {
    dispatch_once(&qword_1001DC960, &stru_1001AF8E0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC958, 1LL))
  {
    if (qword_1001DC960 != -1) {
      dispatch_once(&qword_1001DC960, &stru_1001AF8E0);
    }
    _NRLogWithArgs( qword_1001DC958,  1LL,  "%s%.30s:%-4d APSConnection: %@, token: %@",  ",  "-[NRLinkManagerQuickRelay connection:didReceivePublicToken:]"",  294LL,  v7,  v6);
  }

  -[NRLinkManagerQuickRelay connection:didChangeConnectedStatus:]( self,  "connection:didChangeConnectedStatus:",  v7,  [v7 isConnected]);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v7 = queue;
  dispatch_assert_queue_V2(v7);

  if (qword_1001DC960 != -1) {
    dispatch_once(&qword_1001DC960, &stru_1001AF8E0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC958, 1LL))
  {
    if (qword_1001DC960 != -1) {
      dispatch_once(&qword_1001DC960, &stru_1001AF8E0);
    }
    if (v4) {
      id v8 = "YES";
    }
    else {
      id v8 = "NO";
    }
    _NRLogWithArgs( qword_1001DC958,  1LL,  "%s%.30s:%-4d APSConnection: %@, connected: %s",  ",  "-[NRLinkManagerQuickRelay connection:didChangeConnectedStatus:]"",  301LL,  v9,  v8);
  }

  if (self)
  {
    self->_apsConnected = v4;
    self = (NRLinkManagerQuickRelay *)objc_loadWeakRetained((id *)&self->_quickRelayManagerDelegate);
  }

  -[NRLinkManagerQuickRelay apsIsConnected:](self, "apsIsConnected:", v4);
}

- (void).cxx_destruct
{
}

@end