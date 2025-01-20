@interface _ProtocolHandler
- (void)didCreateTask:(id)a3 fromRequest:(id)a4 error:(id *)a5;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
@end

@implementation _ProtocolHandler

- (void)didCreateTask:(id)a3 fromRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____ProtocolHandler;
  -[_ProtocolHandler didCreateTask:fromRequest:error:](&v12, "didCreateTask:fromRequest:error:", v8, a4, a5);
  WeakRetained = (void **)objc_loadWeakRetained((id *)&self->_protocolDelegate);
  v10 = sub_100279068(WeakRetained, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11) {
    sub_1001E3DE8(v8, v11);
  }
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = ASDLogHandleForCategory(14LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v26 = self;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 1024;
    BOOL v32 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "(ProtocolHandler) [%p] Reconfiguring request: %@ for task: %@ redirect: %d",  buf,  0x26u);
  }

  WeakRetained = (void **)objc_loadWeakRetained((id *)&self->_protocolDelegate);
  v15 = sub_100279068(WeakRetained, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!v16)
  {
    uint64_t v23 = ASDLogHandleForCategory(14LL);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v26 = self;
      __int16 v27 = 2114;
      id v28 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "(ProtocolHandler) [%p] Environment not found for task: %{public}@",  buf,  0x16u);
    }

    goto LABEL_10;
  }

  v18 = (os_log_s *)objc_getProperty(v16, v17, 24LL, 1);
  uint64_t v19 = ASDLogHandleForCategory(14LL);
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (_ProtocolHandler *)objc_getProperty(v16, v21, 16LL, 1);
    *(_DWORD *)buf = 138412802;
    v26 = v22;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 1024;
    LODWORD(v30) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] Reconfiguring request for task: %@ redirect: %d",  buf,  0x1Cu);
  }

  if (v18)
  {
    (*((void (**)(os_log_s *, id))v18 + 2))(v18, v10);
LABEL_10:
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____ProtocolHandler;
  -[_ProtocolHandler reconfigureNewRequest:originalTask:redirect:error:]( &v24,  "reconfigureNewRequest:originalTask:redirect:error:",  v10,  v11,  v7,  a6);
}

- (void).cxx_destruct
{
}

@end