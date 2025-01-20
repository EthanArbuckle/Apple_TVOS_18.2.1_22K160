@interface NRLinkManagerWired
- (id)copyName;
- (id)copyStatusString;
- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)invalidateManager;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
@end

@implementation NRLinkManagerWired

- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4
{
  v6 = (dispatch_queue_s *)a3;
  id v7 = a4;
  if (!v6)
  {
    id v26 = sub_1000C58FC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v26, 17LL);

    if (IsLevelEnabled)
    {
      id v28 = sub_1000C58FC();
      _NRLogWithArgs(v28, 17LL, "%s called with null queue");
LABEL_12:

      v24 = 0LL;
      goto LABEL_7;
    }

- (void)cancel
{
  if (self)
  {
    self->super._state = 1004;
    -[NRLinkManager reportEvent:](self, "reportEvent:", 2003LL);
    -[NRLinkManagerWired invalidateManager](self, "invalidateManager");
    links = self->_links;
  }

  else
  {
    [0 reportEvent:2003];
    [0 invalidateManager];
    links = 0LL;
  }

  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = -[NSMutableSet copy](links, "copy");
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)i),  "cancelWithReason:",  @"Cancelling Wired link manager",  (void)v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  if (self) {
    uint64_t v9 = self->_links;
  }
  else {
    uint64_t v9 = 0LL;
  }
  -[NSMutableSet removeAllObjects](v9, "removeAllObjects", (void)v10);
}

- (void)invalidateManager
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkManagerWired;
  -[NRLinkManager invalidateManager](&v5, "invalidateManager");
  if (self)
  {
    scdynamicStoreRef = self->_scdynamicStoreRef;
    if (scdynamicStoreRef)
    {
      SCDynamicStoreSetDispatchQueue(scdynamicStoreRef, 0LL);
      id v4 = self->_scdynamicStoreRef;
      if (v4)
      {
        CFRelease(v4);
        self->_scdynamicStoreRef = 0LL;
      }
    }
  }

- (void)dealloc
{
  if (qword_1001DC8D0 != -1) {
    dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8C8, 1LL))
  {
    if (qword_1001DC8D0 != -1) {
      dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
    }
    id v3 = (id)qword_1001DC8C8;
    id v4 = -[NRLinkManagerWired copyName](self, "copyName");
    _NRLogWithArgs(v3, 1LL, "%s%.30s:%-4d %@", ", "-[NRLinkManagerWired dealloc]"", 119LL, v4);
  }

  -[NRLinkManagerWired invalidateManager](self, "invalidateManager");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NRLinkManagerWired;
  -[NRLinkManagerWired dealloc](&v5, "dealloc");
}

- (id)copyName
{
  return @"Link Manager - Wired";
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
  id v6 = -[NRLinkManagerWired copyName](self, "copyName");
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
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"\nLocal state: %@",  self->_interfaceToLocalAddressDictionary);
    nrUUIDToPeerDictionary = self->_nrUUIDToPeerDictionary;
  }

  else
  {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLinks: %@", 0LL);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nLocal state: %@", 0LL);
    nrUUIDToPeerDictionary = 0LL;
  }

  -[NSMutableString appendFormat:](v5, "appendFormat:", @"\nPeer state: %@", nrUUIDToPeerDictionary);
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
    id v10 = sub_1000C58FC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1000C58FC();
    _NRLogWithArgs(v9, 17LL, "%s called with null link", "-[NRLinkManagerWired linkIsAvailable:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2004LL);
  if (!self)
  {
    [0 addObject:v4];
    uint64_t v7 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    -[NSMutableSet addObject:](self->_links, "addObject:", v4);
    uint64_t v7 = self->super._queue;
LABEL_13:
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C8104;
    block[3] = &unk_1001B0720;
    id v13 = v4;
    v14 = self;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC8D0 != -1) {
    dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8C8, 1LL))
  {
    if (qword_1001DC8D0 != -1) {
      dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
    }
    _NRLogWithArgs( qword_1001DC8C8,  1LL,  "%s%.30s:%-4d Ignoring link availability event as manager is cancelled: %@",  ",  "-[NRLinkManagerWired linkIsAvailable:]"",  605LL,  self);
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
    id v11 = sub_1000C58FC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1000C58FC();
    _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerWired linkIsReady:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2005LL);
  if (!self)
  {
    id v13 = v4;
    v8 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    id v7 = v4;
    v8 = self->super._queue;
LABEL_13:
    id v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C7FF4;
    block[3] = &unk_1001B0720;
    id v15 = v4;
    v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC8D0 != -1) {
    dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8C8, 1LL))
  {
    if (qword_1001DC8D0 != -1) {
      dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
    }
    _NRLogWithArgs( qword_1001DC8C8,  1LL,  "%s%.30s:%-4d Ignoring link ready event as manager is cancelled: %@",  ",  "-[NRLinkManagerWired linkIsReady:]"",  630LL,  self);
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
    id v11 = sub_1000C58FC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v11, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v10 = sub_1000C58FC();
    _NRLogWithArgs(v10, 17LL, "%s called with null link", "-[NRLinkManagerWired linkIsSuspended:]");
    goto LABEL_14;
  }

  -[NRLinkManager reportEvent:](self, "reportEvent:", 2006LL);
  if (!self)
  {
    id v13 = v4;
    v8 = 0LL;
    goto LABEL_13;
  }

  if (self->super._state != 1004)
  {
    id v7 = v4;
    v8 = self->super._queue;
LABEL_13:
    id v9 = v8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C7EE4;
    block[3] = &unk_1001B0720;
    id v15 = v4;
    v16 = self;
    id v10 = v4;
    dispatch_async(v9, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC8D0 != -1) {
    dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8C8, 1LL))
  {
    if (qword_1001DC8D0 != -1) {
      dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
    }
    _NRLogWithArgs( qword_1001DC8C8,  1LL,  "%s%.30s:%-4d Ignoring link suspended event as manager is cancelled: %@",  ",  "-[NRLinkManagerWired linkIsSuspended:]"",  653LL,  self);
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
    id v10 = sub_1000C58FC();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v10, 17LL);

    if (!IsLevelEnabled) {
      goto LABEL_15;
    }
    id v9 = sub_1000C58FC();
    _NRLogWithArgs(v9, 17LL, "%s called with null link", "-[NRLinkManagerWired linkIsUnavailable:]");
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
    v8 = v7;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C6B28;
    block[3] = &unk_1001B0720;
    void block[4] = self;
    id v13 = v4;
    id v9 = v4;
    dispatch_async(v8, block);

LABEL_14:
    goto LABEL_15;
  }

  if (qword_1001DC8D0 != -1) {
    dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8C8, 1LL))
  {
    if (qword_1001DC8D0 != -1) {
      dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
    }
    _NRLogWithArgs( qword_1001DC8C8,  1LL,  "%s%.30s:%-4d Ignoring link unavailability event as manager is cancelled: %@",  ",  "-[NRLinkManagerWired linkIsUnavailable:]"",  676LL,  self);
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

  v8 = self->super._queue;
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
    block[2] = sub_1000C6A18;
    block[3] = &unk_1001B0748;
    id v15 = v6;
    v16 = self;
    id v17 = v7;
    id v12 = v6;
    dispatch_async(v11, block);

    goto LABEL_11;
  }

  if (qword_1001DC8D0 != -1) {
    dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8C8, 1LL))
  {
    if (qword_1001DC8D0 != -1) {
      dispatch_once(&qword_1001DC8D0, &stru_1001AF408);
    }
    _NRLogWithArgs( qword_1001DC8C8,  1LL,  "%s%.30s:%-4d Ignoring link received data event as manager is cancelled: %@",  ",  "-[NRLinkManagerWired linkDidReceiveData:data:]"",  695LL,  self);
  }

- (void).cxx_destruct
{
}

@end