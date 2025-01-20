@interface IDSOTREncrypter
- (IDSOTRController)OTRController;
- (IDSOTREncrypter)initWithOTRController:(id)a3 OTRToken:(id)a4;
- (NSString)OTRToken;
- (id)decryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5;
- (id)encryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5;
@end

@implementation IDSOTREncrypter

- (IDSOTREncrypter)initWithOTRController:(id)a3 OTRToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSOTREncrypter;
  v9 = -[IDSOTREncrypter init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_OTRController, a3);
    objc_storeStrong((id *)&v10->_OTRToken, a4);
  }

  return v10;
}

- (id)encryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 length];
  if (v9 && v10 && self->_OTRToken)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v34 = sub_1002B4D68;
    v35 = sub_1002B4D78;
    id v36 = 0LL;
    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x2020000000LL;
    char v32 = 1;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1002B4D80;
    v25[3] = &unk_1008FFA68;
    v25[4] = self;
    v27 = buf;
    id v26 = v8;
    v28 = &v29;
    [v9 performSyncBlock:v25];
    if (a5 || *((_BYTE *)v30 + 24))
    {
      if (*((_BYTE *)v30 + 24)) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = a5 == 0LL;
      }
      int64_t v12 = 101LL;
      if (v11) {
        int64_t v12 = 0LL;
      }
      *a5 = v12;
    }

    id v13 = *(id *)(*(void *)&buf[8] + 40LL);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 length];
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v18))
    {
      id v19 = [v8 length];
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      _IDSWarnV( @"IDSFoundation",  @"Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}");

      id v20 = objc_msgSend(v8, "length", v19, v9, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}");

      objc_msgSend(v8, "length", v20, v9, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}");
    }

    id v13 = 0LL;
    if (a5) {
      *a5 = 101LL;
    }
  }

  return v13;
}

- (id)decryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 length];
  if (v9 && v10 && self->_OTRToken)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v34 = sub_1002B4D68;
    v35 = sub_1002B4D78;
    id v36 = 0LL;
    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x2020000000LL;
    char v32 = 1;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1002B53B8;
    v25[3] = &unk_1008FFA68;
    v25[4] = self;
    v27 = buf;
    id v26 = v8;
    v28 = &v29;
    [v9 performSyncBlock:v25];
    if (a5 || *((_BYTE *)v30 + 24))
    {
      if (*((_BYTE *)v30 + 24)) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = a5 == 0LL;
      }
      int64_t v12 = 100LL;
      if (v11) {
        int64_t v12 = 0LL;
      }
      *a5 = v12;
    }

    id v13 = *(id *)(*(void *)&buf[8] + 40LL);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v8 length];
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v18))
    {
      id v19 = [v8 length];
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      _IDSWarnV( @"IDSFoundation",  @"Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}");

      id v20 = objc_msgSend(v8, "length", v19, v9, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}");

      objc_msgSend(v8, "length", v20, v9, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSOTREncrypter OTRToken](self, "OTRToken"));
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}");
    }

    id v13 = 0LL;
    if (a5) {
      *a5 = 100LL;
    }
  }

  return v13;
}

- (IDSOTRController)OTRController
{
  return self->_OTRController;
}

- (NSString)OTRToken
{
  return self->_OTRToken;
}

- (void).cxx_destruct
{
}

@end