@interface _LSStartupJournalledInstallNotification
- (BOOL)plugins;
- (NSArray)proxies;
- (_LSStartupJournalledInstallNotification)initWithNotification:(int)a3 appProxies:(id)a4 plugins:(BOOL)a5;
- (int)notification;
- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4;
@end

@implementation _LSStartupJournalledInstallNotification

- (_LSStartupJournalledInstallNotification)initWithNotification:(int)a3 appProxies:(id)a4 plugins:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____LSStartupJournalledInstallNotification;
  v9 = -[_LSStartupJournalledInstallNotification init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_notification = a3;
    uint64_t v11 = [v8 copy];
    proxies = v10->_proxies;
    v10->_proxies = (NSArray *)v11;

    v10->_plugins = a5;
  }

  return v10;
}

- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = a3;
  _LSProgressLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = -[_LSStartupJournalledInstallNotification notification](self, "notification");
    v10 = -[_LSStartupJournalledInstallNotification proxies](self, "proxies");
    int v13 = 134218242;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_INFO,  "Sending notification %lu for proxies %@ to observer.",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v11 = -[_LSStartupJournalledInstallNotification notification](self, "notification");
  v12 = -[_LSStartupJournalledInstallNotification proxies](self, "proxies");
  [v6 directlySendNotification:v11 withProxies:v12 toObserver:v7];
}

- (int)notification
{
  return self->_notification;
}

- (NSArray)proxies
{
  return self->_proxies;
}

- (BOOL)plugins
{
  return self->_plugins;
}

- (void).cxx_destruct
{
}

@end