@interface SDNetworkEjecter
- (NSNumber)flags;
- (NSString)protocol;
- (SDNetworkEjecter)initWithNode:(__SFNode *)a3;
- (SDNetworkEjecterDelegate)delegate;
- (int)start;
- (void)dealloc;
- (void)eject;
- (void)notifyClientAboutEject:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFlags:(id)a3;
- (void)setProtocol:(id)a3;
- (void)stop;
@end

@implementation SDNetworkEjecter

- (SDNetworkEjecter)initWithNode:(__SFNode *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDNetworkEjecter;
  v4 = -[SDNetworkEjecter init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    flags = v4->_flags;
    v4->_flags = 0LL;

    protocol = v5->_protocol;
    v5->_protocol = 0LL;

    *(void *)&v5->_mountedCount = 0LL;
    v5->_node = (__SFNode *)CFRetain(a3);
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDNetworkEjecter;
  -[SDNetworkEjecter dealloc](&v3, "dealloc");
}

- (void)notifyClientAboutEject:(int)a3
{
  if (!a3)
  {
    int mountedCount = self->_mountedCount;
    if (mountedCount)
    {
      int v6 = self->_ejectedCount + 1;
      self->_ejectedCount = v6;
      if (v6 != mountedCount) {
        return;
      }
    }

    SFNodeSetMountPoint(self->_node, 0LL);
    SFNodeRemoveKind(self->_node, kSFNodeKindConnected);
    SFNodeSetConnectionState(self->_node, 0LL);
  }

  v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_node,  kSFOperationNodeKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_flags,  kSFOperationFlagsKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  self->_protocol,  kSFOperationProtocolKey);
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SFNodeError",  a3,  0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, kSFOperationErrorKey);

    uint64_t v8 = 10LL;
  }

  else
  {
    uint64_t v8 = 9LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained networkEjecter:self event:v8 withResults:v10];
}

- (void)eject
{
  if (SFNodeIsMounted(self->_node, a2))
  {
    unint64_t v3 = -[NSNumber longValue](self->_flags, "longValue");
    int IsSharePoint = SFNodeIsSharePoint(self->_node);
    node = self->_node;
    if (IsSharePoint)
    {
      uint64_t v6 = SFNodeCopyMountPoint(node);
      v7 = (void *)v6;
      if (v6)
      {
        uint64_t v14 = v6;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
        -[SDNetworkEjecter ejectMountPoints:useAssistant:](self, "ejectMountPoints:useAssistant:", v8, (v3 >> 1) & 1);
      }

      else
      {
        -[SDNetworkEjecter notifyClientAboutEject:](self, "notifyClientAboutEject:", 0xFFFFFFFFLL);
      }
    }

    else if (SFNodeIsServer(node))
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
      v11 = (void *)SFNodeCopyRealName(self->_node, v10);
      else {
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 mountPointsForServer:v11]);
      }
      id v13 = (id)v12;
      -[SDNetworkEjecter ejectMountPoints:useAssistant:](self, "ejectMountPoints:useAssistant:", v12, (v3 >> 1) & 1);
    }
  }

  else
  {
    -[SDNetworkEjecter notifyClientAboutEject:](self, "notifyClientAboutEject:", 0LL);
  }

- (int)start
{
  if (!self->_protocol)
  {
    id v3 = sub_100115100();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(v3);
    protocol = self->_protocol;
    self->_protocol = v4;

    if (!self->_protocol) {
      return -2;
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CA690;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  return 0;
}

- (void)stop
{
  uint64_t v2 = browser_log(self, a2);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000CA75C(v3);
  }
}

- (NSNumber)flags
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProtocol:(id)a3
{
}

- (SDNetworkEjecterDelegate)delegate
{
  return (SDNetworkEjecterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end