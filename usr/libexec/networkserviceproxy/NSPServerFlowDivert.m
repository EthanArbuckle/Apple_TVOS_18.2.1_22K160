@interface NSPServerFlowDivert
- (NSPServerFlowDivert)init;
- (void)dealloc;
@end

@implementation NSPServerFlowDivert

- (NSPServerFlowDivert)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSPServerFlowDivert;
  v4 = -[NSPServerFlowDivert init](&v19, "init");
  if (v4)
  {
    uint64_t v5 = nw_context_create("com.apple.networksrviceproxy.flow-divert");
    context = v4->_context;
    v4->_context = (OS_nw_context *)v5;

    v7 = v4->_context;
    uint64_t v9 = NPGetInternalQueue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10009D528;
    v16[3] = &unk_1000F9720;
    v11 = v4;
    v17 = (os_log_s *)v11;
    nw_context_set_idle_handler(v7, v10, v16);

    nw_context_set_isolate_protocol_cache(v4->_context, 1LL);
    nw_context_activate(v4->_context);
    v12 = v11;
    v13 = v17;
  }

  else
  {
    uint64_t v15 = nplog_obj(0LL, v2, v3);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPServerFlowDivert;
  -[NSPServerFlowDivert dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end