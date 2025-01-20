@interface CLPeripheralManagerDelegate
- (CLPeripheralManagerDelegate)initWithSilo:(id)a3 provider:(void *)a4;
- (CLSilo)silo;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)provider;
- (void)setProvider:(void *)a3;
- (void)setSilo:(id)a3;
@end

@implementation CLPeripheralManagerDelegate

- (CLPeripheralManagerDelegate)initWithSilo:(id)a3 provider:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLPeripheralManagerDelegate;
  v6 = -[CLPeripheralManagerDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLPeripheralManagerDelegate setSilo:](v6, "setSilo:", a3);
    -[CLPeripheralManagerDelegate setProvider:](v7, "setProvider:", a4);
  }

  return v7;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  if (qword_101934840 != -1) {
    dispatch_once(&qword_101934840, &stru_10188A778);
  }
  v5 = (os_log_s *)qword_101934848;
  if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v16 = [a3 state];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "iB: BT Peripheral manager state update: %{public}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_10188A778);
    }
    uint64_t v8 = qword_101934848;
    v14[0] = 67240192;
    v14[1] = [a3 state];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  2LL,  "iB: BT Peripheral manager state update: %{public}d",  v14,  8);
    v10 = (uint8_t *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPeripheralManagerDelegate peripheralManagerDidUpdateState:]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  if ([a3 state] == (id)5)
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_10188A778);
    }
    v6 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "iB: Attempt start", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_10188A778);
      }
      LOWORD(v14[0]) = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934848,  2LL,  "iB: Attempt start",  v14,  v13);
      v12 = (uint8_t *)v11;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPeripheralManagerDelegate peripheralManagerDidUpdateState:]",  "%s\n",  v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    -[CLSilo assertInside](-[CLPeripheralManagerDelegate silo](self, "silo"), "assertInside");
    v7 = -[CLPeripheralManagerDelegate provider](self, "provider");
    (*(void (**)(void *))(*(void *)v7 + 264LL))(v7);
  }

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  if (a4)
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_10188A778);
    }
    v5 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380675;
      v13[0] = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#Warning BT Peripheral manager error on advertising start attempt, %{private}s",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934840 != -1) {
        dispatch_once(&qword_101934840, &stru_10188A778);
      }
      uint64_t v6 = qword_101934848;
      int v10 = 136380675;
      id v11 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  0LL,  "#Warning BT Peripheral manager error on advertising start attempt, %{private}s",  &v10,  12);
      uint64_t v8 = (uint8_t *)v7;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPeripheralManagerDelegate peripheralManagerDidStartAdvertising:error:]",  "%s\n",  v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

  else
  {
    if (qword_101934840 != -1) {
      dispatch_once(&qword_101934840, &stru_10188A778);
    }
    objc_super v9 = (os_log_s *)qword_101934848;
    if (os_log_type_enabled((os_log_t)qword_101934848, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      LODWORD(v13[0]) = 0;
      WORD2(v13[0]) = 2082;
      *(void *)((char *)v13 + 6) = "";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:iB: BT Peripheral manager started advertising}",  buf,  0x12u);
    }
  }

- (CLSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

@end