@interface NSPServerODoH
- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5;
@end

@implementation NSPServerODoH

- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  __int128 buffer = 0u;
  memset(v49, 0, sizeof(v49));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  v13 = v10;
  if (!v10)
  {
    v14 = 0LL;
    goto LABEL_7;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v10));
  v14 = v10;
  if (!v10)
  {
LABEL_7:
    v22 = 0LL;
    v15 = 0LL;
    goto LABEL_13;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 interface]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 parameters]);
  int v17 = [v16 pid];
  if (!v17)
  {
LABEL_11:
    v22 = 0LL;
    goto LABEL_12;
  }

  int v18 = v17;
  uint64_t v19 = proc_pidinfo(v17, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v19 != 64)
  {
    uint64_t v23 = nplog_obj(v19, v20, v21);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to process name",  (uint8_t *)&buf,  8u);
    }

    goto LABEL_11;
  }

  v22 = (const char *)v49;
LABEL_12:

LABEL_13:
  uint64_t v25 = nplog_obj(v10, v11, v12);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (v22) {
      v27 = v22;
    }
    else {
      v27 = "none";
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue([v15 interfaceName]);
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v6;
    __int16 v44 = 2080;
    v45 = v27;
    __int16 v46 = 2112;
    v47 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Received DNS error (%d) from %s on interface %@",  (uint8_t *)&buf,  0x1Cu);
  }

  id inited = objc_initWeak(&buf, self);
  uint64_t v30 = NPGetInternalQueue(inited);
  v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v30);
  v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472LL;
  v37 = sub_100050CF8;
  v38 = &unk_1000F9EE0;
  objc_copyWeak(&v41, &buf);
  int v42 = v6;
  id v32 = v15;
  id v39 = v32;
  v40 = self;
  dispatch_async(v31, &v35);

  if ((_DWORD)v6)
  {
    if (self) {
      self = (NSPServerODoH *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resolver", v35, v36, v37, v38));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 dohURL]);
    -[NSPServerODoH handleDNSAgentErrorReport:error:](self, "handleDNSAgentErrorReport:error:", v34, v6);
  }

  objc_destroyWeak(&v41);
  objc_destroyWeak(&buf);
}

- (void).cxx_destruct
{
}

@end