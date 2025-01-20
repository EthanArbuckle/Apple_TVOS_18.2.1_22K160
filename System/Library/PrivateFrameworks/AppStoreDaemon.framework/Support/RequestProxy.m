@interface RequestProxy
- (RequestProxy)init;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)cancelWithErrorHandler:(id)a3;
- (void)startWithErrorHandler:(id)a3;
@end

@implementation RequestProxy

- (RequestProxy)init
{
  return (RequestProxy *)sub_1001DAFB8((id *)&self->super.isa, 0LL, 0LL, 0LL);
}

- (void)cancelWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = (id)objc_opt_class(self, v5);
    id v6 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%@]: Cancelling ... ",  buf,  0xCu);
  }

  if (self) {
    request = self->_request;
  }
  else {
    request = 0LL;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001DB18C;
  v9[3] = &unk_1003E9C30;
  id v10 = v4;
  id v8 = v4;
  -[RequestController cancelUsingProxy:withErrorHandler:](request, "cancelUsingProxy:withErrorHandler:", self, v9);
}

- (void)startWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = (id)objc_opt_class(self, v5);
    id v6 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[%@]: Starting ... ",  buf,  0xCu);
  }

  if (self) {
    request = self->_request;
  }
  else {
    request = 0LL;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001DB2C4;
  v9[3] = &unk_1003E9C30;
  id v10 = v4;
  id v8 = v4;
  -[RequestController startUsingProxy:withErrorHandler:](request, "startUsingProxy:withErrorHandler:", self, v9);
}

- (id)remoteObjectProxy
{
  return +[NSNull null](&OBJC_CLASS___NSNull, "null");
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return +[NSNull null](&OBJC_CLASS___NSNull, "null", a3);
}

- (void).cxx_destruct
{
}

@end