@interface NEHelperTrackerManager
- (NEHelperTrackerManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperTrackerManager

- (NEHelperTrackerManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  objc_opt_self(&OBJC_CLASS___NEHelperTrackerManager);
  if (qword_10003E9E0 != -1) {
    dispatch_once(&qword_10003E9E0, &stru_100034BB8);
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEHelperTrackerManager;
  v5 = -[NEHelperTrackerManager init](&v15, "init");
  if (v5)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(remote_connection);
    connection = v5->_connection;
    v5->_connection = (OS_xpc_object *)v7;

    uint64_t v9 = ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_opt_class(v5);
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      id v12 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@ Created new NEHelperTrackerManager",  buf,  0xCu);
    }

    v13 = v5;
  }

  return v5;
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)(id)qword_10003E9C8;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v73 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ processing Tracker Manager request", buf, 0xCu);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (reply)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "tracker-command");
    if (uint64 != 2)
    {
      if (uint64 == 1)
      {
        xpc_object_t value = xpc_dictionary_get_value(v4, "test-domains");
        v11 = (void *)objc_claimAutoreleasedReturnValue(value);
        os_unfair_lock_lock(&stru_10003EB00);
        if (!v11 && qword_10003E9D8
          || (sub_100006AB8((uint64_t)&OBJC_CLASS___NEHelperTrackerManager, v11, 0), qword_10003E9D8))
        {
          uint64_t v14 = ne_log_obj(v12, v13);
          objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            size_t count = xpc_array_get_count((xpc_object_t)qword_10003E9D8);
            *(_DWORD *)buf = 138412546;
            v73 = self;
            __int16 v74 = 2048;
            size_t v75 = count;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%@ sending back domain list of %zu items",  buf,  0x16u);
          }

          xpc_dictionary_set_int64(reply, "result-code", 0LL);
          xpc_dictionary_set_value(reply, "domain-dictionary", (xpc_object_t)qword_10003E9D0);
          xpc_dictionary_set_value(reply, "sorted-domains", (xpc_object_t)qword_10003E9D8);
          xpc_dictionary_set_int64(reply, "unique-prefix-count", qword_10003EAF0);
          int64_t v17 = qword_10003EAF8;
          v18 = "total-byte-count";
          v19 = reply;
        }

        else
        {
          v18 = "result-code";
          v19 = reply;
          int64_t v17 = 2LL;
        }

        xpc_dictionary_set_int64(v19, v18, v17);
        os_unfair_lock_unlock(&stru_10003EB00);

        goto LABEL_54;
      }

- (void).cxx_destruct
{
}

@end