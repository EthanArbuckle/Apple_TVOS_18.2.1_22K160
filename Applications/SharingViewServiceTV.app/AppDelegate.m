@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v4 = airdrop_log(self, a2, a3, a4);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[AppDelegate application:didFinishLaunchingWithOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v3 = airdrop_log(self, a2, a3);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[AppDelegate applicationWillTerminate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end