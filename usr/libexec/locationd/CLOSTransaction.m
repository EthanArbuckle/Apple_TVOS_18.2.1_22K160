@interface CLOSTransaction
- (CLOSTransaction)initWithDescription:(const char *)a3;
- (void)dealloc;
@end

@implementation CLOSTransaction

- (CLOSTransaction)initWithDescription:(const char *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLOSTransaction;
  v4 = -[CLOSTransaction init](&v11, "init");
  if (v4)
  {
    v4->_description = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3);
    v4->_transaction = (OS_os_transaction *)os_transaction_create(a3);
    if (qword_101934A50 != -1) {
      dispatch_once(&qword_101934A50, &stru_1018495C0);
    }
    v5 = (os_log_s *)qword_101934A58;
    if (os_log_type_enabled((os_log_t)qword_101934A58, OS_LOG_TYPE_DEFAULT))
    {
      description = v4->_description;
      *(_DWORD *)buf = 134218242;
      p_transaction = &v4->_transaction;
      __int16 v18 = 2112;
      v19 = description;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_transaction created: (%p) %@", buf, 0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A50 != -1) {
        dispatch_once(&qword_101934A50, &stru_1018495C0);
      }
      v8 = v4->_description;
      int v12 = 134218242;
      v13 = &v4->_transaction;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A58,  0LL,  "os_transaction created: (%p) %@",  &v12,  22);
      v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOSTransaction initWithDescription:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  return v4;
}

- (void)dealloc
{
  if (qword_101934A50 != -1) {
    dispatch_once(&qword_101934A50, &stru_1018495C0);
  }
  v3 = (os_log_s *)qword_101934A58;
  if (os_log_type_enabled((os_log_t)qword_101934A58, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 134218242;
    p_transaction = &self->_transaction;
    __int16 v15 = 2112;
    v16 = description;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "os_transaction released: (%p) %@", buf, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A50 != -1) {
      dispatch_once(&qword_101934A50, &stru_1018495C0);
    }
    v5 = self->_description;
    int v9 = 134218242;
    v10 = &self->_transaction;
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A58,  0LL,  "os_transaction released: (%p) %@",  &v9,  22);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOSTransaction dealloc]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  self->_transaction = 0LL;
  self->_description = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLOSTransaction;
  -[CLOSTransaction dealloc](&v8, "dealloc");
}

@end