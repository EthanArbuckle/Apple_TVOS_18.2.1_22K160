@interface PushConnection
- (NSString)description;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
@end

@implementation PushConnection

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  v6 = sub_1002986E0(objc_alloc(&OBJC_CLASS___PushRawMessage), v5);

  uint64_t v7 = ASDLogHandleForCategory(26LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v14 = 138543618;
    *(void *)&v14[4] = objc_opt_class(self, v9);
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v6;
    id v10 = *(id *)&v14[4];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Received incoming message: %{public}@",  v14,  0x16u);
  }

  if (v6)
  {
    uint64_t v11 = v6[1];
    if (v11 == 2)
    {
      uint64_t v12 = 7LL;
      goto LABEL_10;
    }

    if (v11 == 1)
    {
      uint64_t v12 = 6LL;
LABEL_10:
      sub_1001E08D0((uint64_t)(&self->super.isa)[v12], v6);
      goto LABEL_11;
    }
  }

  if (self)
  {
LABEL_11:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    goto LABEL_12;
  }

  id WeakRetained = 0LL;
LABEL_12:
  objc_msgSend(WeakRetained, "pushConnection:didReceiveRawMessage:", self, v6, *(_OWORD *)v14, *(void *)&v14[16]);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v6 = (NSData *)a4;
  appStoreMessageHistory = self->_appStoreMessageHistory;
  if (appStoreMessageHistory) {
    objc_setProperty_atomic_copy(appStoreMessageHistory, v5, v6, 32LL);
  }
  v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  currentToken = self->_currentToken;
  uint64_t v10 = ASDLogHandleForCategory(26LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (currentToken && currentToken == v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_opt_class(self, v13);
      id v15 = v14;
      id v16 = sub_1001D4008(v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      environment = self->_environment;
      int v25 = 138544130;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v8;
      __int16 v29 = 2114;
      v30 = v17;
      __int16 v31 = 2114;
      v32 = environment;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[%{public}@] [%@] Skipping re-registering of active token: %{public}@ for environment: %{public}@",  (uint8_t *)&v25,  0x2Au);
    }
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class(self, v19);
      id v21 = v20;
      id v22 = sub_1001D4008(v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = self->_environment;
      int v25 = 138544130;
      v26 = v20;
      __int16 v27 = 2112;
      v28 = v8;
      __int16 v29 = 2114;
      v30 = v23;
      __int16 v31 = 2114;
      v32 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%@] Received new public token: %{public}@ for environment: %{public}@",  (uint8_t *)&v25,  0x2Au);
    }

    sub_100190138((uint64_t)self, 0LL, 0LL, self->_environment, 0, v8);
    sub_100190138((uint64_t)self, 0LL, 0LL, self->_environment, 1, v8);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = ASDLogHandleForCategory(26LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = (void *)objc_opt_class(self, v12);
    id v14 = v13;
    id v15 = sub_1001D4008(v8);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    environment = self->_environment;
    int v22 = 138544130;
    v23 = v13;
    __int16 v24 = 2114;
    int v25 = v16;
    __int16 v26 = 2114;
    id v27 = v9;
    __int16 v28 = 2114;
    __int16 v29 = environment;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[%{public}@] Received new token: %{public}@ for topic: %{public}@ environment: %{public}@",  (uint8_t *)&v22,  0x2Au);
  }

  uint64_t v19 = sub_1002987B8((uint64_t)&OBJC_CLASS___PushRawMessage, v9);
  if (v19 == 2)
  {
    testFlightMessageHistory = self->_testFlightMessageHistory;
    if (testFlightMessageHistory) {
      objc_setProperty_atomic_copy(testFlightMessageHistory, v18, v8, 32LL);
    }
  }

  else if (!self)
  {
    id WeakRetained = 0LL;
    goto LABEL_8;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_8:
  [WeakRetained pushConnection:self didReceiveToken:v8 forTopic:v19];
}

- (NSString)description
{
  environment = self->_environment;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](self->_connection, "publicToken"));
  id v4 = sub_1001D40EC(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  environment,  v5));

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end