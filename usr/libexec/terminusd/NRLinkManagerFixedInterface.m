@interface NRLinkManagerFixedInterface
- (id)copyName;
- (id)copyStatusString;
- (void)cancel;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerFixedInterface

- (void)cancel
{
  if (self)
  {
    v3 = self->super._queue;
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003LL);
    if (self->super._state == 1004)
    {
      if (qword_1001DC950 != -1) {
        dispatch_once(&qword_1001DC950, &stru_1001AF898);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
      {
        if (qword_1001DC950 != -1) {
          dispatch_once(&qword_1001DC950, &stru_1001AF898);
        }
        _NRLogWithArgs( qword_1001DC948,  1LL,  "%s%.30s:%-4d Already cancelled",  ",  "-[NRLinkManagerFixedInterface cancel]"",  71);
      }

      return;
    }

    self->super._state = 1004;
    dynamicStoreRef = self->_dynamicStoreRef;
    if (dynamicStoreRef)
    {
      CFRelease(dynamicStoreRef);
      self->_dynamicStoreRef = 0LL;
    }

    -[NRLinkManagerFixedInterface invalidateManager](self, "invalidateManager");
    links = self->_links;
  }

  else
  {
    dispatch_assert_queue_V2(0LL);
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0LL;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = -[NSMutableSet copy](links, "copy");
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) cancelWithReason:@"Cancelling all links"];
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  if (self) {
    v11 = self->_links;
  }
  else {
    v11 = 0LL;
  }
  -[NSMutableSet removeAllObjects](v11, "removeAllObjects");
}

- (void)invalidateManager
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NRLinkManagerFixedInterface;
  -[NRLinkManager invalidateManager](&v2, "invalidateManager");
}

- (void)dealloc
{
  if (qword_1001DC950 != -1) {
    dispatch_once(&qword_1001DC950, &stru_1001AF898);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
  {
    if (qword_1001DC950 != -1) {
      dispatch_once(&qword_1001DC950, &stru_1001AF898);
    }
    id v3 = (id)qword_1001DC948;
    id v4 = -[NRLinkManagerFixedInterface copyName](self, "copyName");
    _NRLogWithArgs(v3, 1LL, "%s%.30s:%-4d %@", ", "-[NRLinkManagerFixedInterface dealloc]"", 97LL, v4);
  }

  -[NRLinkManagerFixedInterface invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkManagerFixedInterface;
  -[NRLinkManagerFixedInterface dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return @"Link Manager - FixedInterface";
}

- (id)copyStatusString
{
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v4 = queue;
  dispatch_assert_queue_V2(v4);

  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v6 = -[NRLinkManagerFixedInterface copyName](self, "copyName");
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nName: %@", v6);

  if (self)
  {
    StringFromNRLinkType = (void *)createStringFromNRLinkType(self->super._type);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinkManager type: %@", StringFromNRLinkType);

    uint64_t state = self->super._state;
  }

  else
  {
    __int128 v12 = (void *)createStringFromNRLinkType(0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinkManager type: %@", v12);

    uint64_t state = 0LL;
  }

  uint64_t v9 = sub_1000A2B20(state);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nState: %@", v9);

  if (self)
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinks: %@", self->_links);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nFixed Interface: %@", self->_fixedInterfaceName);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLocal Endpoint: %@", self->_localEndpoint);
    peerEndpoint = self->_peerEndpoint;
  }

  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinks: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nFixed Interface: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLocal Endpoint: %@", 0LL);
    peerEndpoint = 0LL;
  }

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nRemote Endpoint: %@", peerEndpoint);
  return v5;
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v10 = sub_1000F84A8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1000F84A8();
    _NRLogWithArgs(v9, 17LL, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsAvailable:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2004LL);
  if (!self)
  {
    [0 addObject:v4];
    id v7 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    -[NSMutableSet addObject:](self->_links, "addObject:", v4);
    id v7 = self->super._queue;
LABEL_13:
    id v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F8E30;
    block[3] = &unk_1001B0720;
    id v13 = v4;
    __int128 v14 = self;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC950 != -1) {
    dispatch_once(&qword_1001DC950, &stru_1001AF898);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
  {
    if (qword_1001DC950 != -1) {
      dispatch_once(&qword_1001DC950, &stru_1001AF898);
    }
    _NRLogWithArgs( qword_1001DC948,  1LL,  "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@",  ",  "-[NRLinkManagerFixedInterface linkIsAvailable:]"",  251LL,  self);
  }

- (void)linkIsReady:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v11 = sub_1000F84A8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1000F84A8();
    _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsReady:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2005LL);
  if (!self)
  {
    id v13 = v4;
    id v8 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    id v7 = v4;
    id v8 = self->super._queue;
LABEL_13:
    id v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F8D20;
    block[3] = &unk_1001B0720;
    id v15 = v4;
    v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC950 != -1) {
    dispatch_once(&qword_1001DC950, &stru_1001AF898);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
  {
    if (qword_1001DC950 != -1) {
      dispatch_once(&qword_1001DC950, &stru_1001AF898);
    }
    _NRLogWithArgs( qword_1001DC948,  1LL,  "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@",  ",  "-[NRLinkManagerFixedInterface linkIsReady:]"",  276LL,  self);
  }

- (void)linkIsSuspended:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v11 = sub_1000F84A8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1000F84A8();
    _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsSuspended:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2006LL);
  if (!self)
  {
    id v13 = v4;
    id v8 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    id v7 = v4;
    id v8 = self->super._queue;
LABEL_13:
    id v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F8C10;
    block[3] = &unk_1001B0720;
    id v15 = v4;
    v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC950 != -1) {
    dispatch_once(&qword_1001DC950, &stru_1001AF898);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
  {
    if (qword_1001DC950 != -1) {
      dispatch_once(&qword_1001DC950, &stru_1001AF898);
    }
    _NRLogWithArgs( qword_1001DC948,  1LL,  "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@",  ",  "-[NRLinkManagerFixedInterface linkIsSuspended:]"",  299LL,  self);
  }

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0LL;
  }
  id v6 = queue;
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    id v10 = sub_1000F84A8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1000F84A8();
    _NRLogWithArgs(v9, 17LL, "%s called with null link", "-[NRLinkManagerFixedInterface linkIsUnavailable:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2007LL);
  if (!self)
  {
    [0 removeObject:v4];
    id v7 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    -[NSMutableSet removeObject:](self->_links, "removeObject:", v4);
    id v7 = self->super._queue;
LABEL_13:
    id v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F84E8;
    block[3] = &unk_1001B0720;
    id v13 = v4;
    __int128 v14 = self;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC950 != -1) {
    dispatch_once(&qword_1001DC950, &stru_1001AF898);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
  {
    if (qword_1001DC950 != -1) {
      dispatch_once(&qword_1001DC950, &stru_1001AF898);
    }
    _NRLogWithArgs( qword_1001DC948,  1LL,  "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@",  ",  "-[NRLinkManagerFixedInterface linkIsUnavailable:]"",  322LL,  self);
  }

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self)
  {
    dispatch_assert_queue_V2(0LL);
    [0 reportEvent:2008];
    id v13 = v6;
    queue = 0LL;
    goto LABEL_10;
  }

  id v8 = self->super._queue;
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2008LL);
  if (self->super._state != 1004)
  {
    id v9 = v6;
    queue = self->super._queue;
LABEL_10:
    id v11 = queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F842C;
    block[3] = &unk_1001B0748;
    void block[4] = self;
    id v15 = v6;
    id v16 = v7;
    id v12 = v6;
    dispatch_async(v11, block);

    goto LABEL_11;
  }

  if (qword_1001DC950 != -1) {
    dispatch_once(&qword_1001DC950, &stru_1001AF898);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC948, 1LL))
  {
    if (qword_1001DC950 != -1) {
      dispatch_once(&qword_1001DC950, &stru_1001AF898);
    }
    _NRLogWithArgs( qword_1001DC948,  1LL,  "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@",  ",  "-[NRLinkManagerFixedInterface linkDidReceiveData:data:]"",  345LL,  self);
  }

- (void).cxx_destruct
{
}

@end