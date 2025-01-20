@interface SDManagedBrowser
+ (id)sharedBrowser;
- (NSArray)nodes;
- (SDManagedBrowser)init;
- (void)setServers:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDManagedBrowser

+ (id)sharedBrowser
{
  if (qword_100657178 != -1) {
    dispatch_once(&qword_100657178, &stru_1005CEB70);
  }
  return (id)qword_100657180;
}

- (SDManagedBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDManagedBrowser;
  v2 = -[SDManagedBrowser init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    servers = v2->_servers;
    v2->_servers = 0LL;

    v3->_clientCount = 0;
    v3->_sendNotification = 0;
  }

  return v3;
}

- (void)setServers:(id)a3
{
  id v5 = a3;
  if (sub_10008E314(self->_servers, v5))
  {
    objc_storeStrong((id *)&self->_servers, a3);
    self->_sendNotification = 1;
  }
}

- (NSArray)nodes
{
  return -[NSDictionary allValues](self->_servers, "allValues");
}

- (void)start
{
  int clientCount = self->_clientCount;
  self->_int clientCount = clientCount + 1;
  if (!clientCount)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011906C;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_int clientCount = v2;
  if (!v2)
  {
    servers = self->_servers;
    self->_servers = 0LL;
  }

- (void).cxx_destruct
{
}

@end