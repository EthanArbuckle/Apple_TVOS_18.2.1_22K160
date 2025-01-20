@interface NEPrivateLTEMonitor
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
@end

@implementation NEPrivateLTEMonitor

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = ne_log_obj(v9, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%@ connection state changed for context: %@",  (uint8_t *)&v13,  0x16u);
  }

  if (!a4) {
    sub_10008CDFC((uint64_t)self, v8, v9);
  }
}

- (void).cxx_destruct
{
}

@end