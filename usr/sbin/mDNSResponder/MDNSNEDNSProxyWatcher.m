@interface MDNSNEDNSProxyWatcher
- (void)configurationChanged:(id)a3;
- (void)dnsProxyStatusDidChange:(id)a3;
@end

@implementation MDNSNEDNSProxyWatcher

- (void)configurationChanged:(id)a3
{
  id v3 = _mdns_ne_dns_proxy_state_watch_log();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuration changed", v5, 2u);
  }

  if (configurationChanged__s_once != -1) {
    dispatch_once(&configurationChanged__s_once, &__block_literal_global_2136);
  }
  dispatch_source_merge_data((dispatch_source_t)configurationChanged__s_loader, 1uLL);
}

- (void)dnsProxyStatusDidChange:(id)a3
{
  id v3 = a3;
  id v4 = _mdns_ne_dns_proxy_state_watch_log();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DNS proxy status changed for manager -- address: %p",  buf,  0xCu);
  }

  id v6 = _mdns_ne_dns_proxy_state_watch_queue();
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke;
  block[3] = &unk_10013CBA0;
  id v10 = v3;
  id v8 = v3;
  dispatch_async(v7, block);
}

void __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke(uint64_t a1)
{
}

void __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke(id a1)
{
  id v1 = _mdns_ne_dns_proxy_state_watch_queue();
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, v2);
  id v4 = (void *)configurationChanged__s_loader;
  configurationChanged__s_loader = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)configurationChanged__s_loader, &__block_literal_global_1);
  dispatch_activate((dispatch_object_t)configurationChanged__s_loader);
}

@end