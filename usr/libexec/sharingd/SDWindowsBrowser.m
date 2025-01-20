@interface SDWindowsBrowser
- (NSArray)nodes;
- (NSString)workgroup;
- (SDWindowsBrowser)initWithWorkgroup:(id)a3;
- (SDWindowsBrowserDelegate)delegate;
- (void)bonjourNodesDidChange:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDWindowsBrowser

- (SDWindowsBrowser)initWithWorkgroup:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDWindowsBrowser;
  v6 = -[SDWindowsBrowser init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    browser = v6->_browser;
    v6->_browser = 0LL;

    objc_storeStrong((id *)&v7->_workgroup, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDWindowsBrowser;
  -[SDWindowsBrowser dealloc](&v3, "dealloc");
}

- (NSArray)nodes
{
  return -[SDBonjourBrowser nodes](self->_browser, "nodes");
}

- (void)bonjourNodesDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained windowsNodesDidChange:self];
}

- (void)start
{
  if (!self->_browser)
  {
    objc_super v3 = objc_alloc(&OBJC_CLASS___SDBonjourBrowser);
    workgroup = self->_workgroup;
    v8 = @"_netbios._udp.";
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    v6 = -[SDBonjourBrowser initWithDomain:types:](v3, "initWithDomain:types:", workgroup, v5);
    browser = self->_browser;
    self->_browser = v6;

    -[SDBonjourBrowser setDelegate:](self->_browser, "setDelegate:", self);
    -[SDBonjourBrowser start](self->_browser, "start");
  }

- (void)stop
{
  browser = self->_browser;
  if (browser)
  {
    -[SDBonjourBrowser setDelegate:](browser, "setDelegate:", 0LL);
    -[SDBonjourBrowser invalidate](self->_browser, "invalidate");
    v4 = self->_browser;
    self->_browser = 0LL;
  }

- (NSString)workgroup
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (SDWindowsBrowserDelegate)delegate
{
  return (SDWindowsBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end