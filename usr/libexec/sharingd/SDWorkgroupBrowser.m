@interface SDWorkgroupBrowser
+ (id)sharedBrowser;
- (NSArray)nodes;
- (NSSet)workgroups;
- (SDWorkgroupBrowser)init;
- (void)bonjourNodesDidChange:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDWorkgroupBrowser

+ (id)sharedBrowser
{
  if (qword_100656F80 != -1) {
    dispatch_once(&qword_100656F80, &stru_1005CD080);
  }
  return (id)qword_100656F88;
}

- (SDWorkgroupBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDWorkgroupBrowser;
  v2 = -[SDWorkgroupBrowser init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    browser = v2->_browser;
    v2->_browser = 0LL;

    v3->_clientCount = 0;
  }

  return v3;
}

- (NSArray)nodes
{
  return -[SDBonjourBrowser nodes](self->_browser, "nodes");
}

- (NSSet)workgroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser nodes](self, "nodes"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v2 count]));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = (void *)SFNodeCopyRealName(*(void *)(*((void *)&v13 + 1) + 8LL * (void)i), v7);
          objc_msgSend(v4, "addObject:", v11, (void)v13);
        }

        id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

  else
  {
    v4 = 0LL;
  }

  return (NSSet *)v4;
}

- (void)bonjourNodesDidChange:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v3 postNotificationName:@"com.apple.sharingd.WorkgroupsChanged" object:0 userInfo:0];
}

- (void)start
{
  int clientCount = self->_clientCount;
  self->_int clientCount = clientCount + 1;
  if (!clientCount)
  {
    v4 = objc_alloc(&OBJC_CLASS___SDBonjourBrowser);
    id v8 = @"_workgroups._udp.";
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    id v6 = -[SDBonjourBrowser initWithDomain:types:](v4, "initWithDomain:types:", @"local", v5);
    browser = self->_browser;
    self->_browser = v6;

    -[SDBonjourBrowser setDelegate:](self->_browser, "setDelegate:", self);
    -[SDBonjourBrowser start](self->_browser, "start");
  }

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_int clientCount = v2;
  if (!v2)
  {
    -[SDBonjourBrowser setDelegate:](self->_browser, "setDelegate:", 0LL);
    -[SDBonjourBrowser invalidate](self->_browser, "invalidate");
    browser = self->_browser;
    self->_browser = 0LL;
  }

- (void).cxx_destruct
{
}

@end