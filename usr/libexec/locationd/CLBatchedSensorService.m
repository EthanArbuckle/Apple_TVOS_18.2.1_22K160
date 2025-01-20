@interface CLBatchedSensorService
+ (BOOL)isSupported;
- (CLBatchedSensorService)initWithClientProtocol:(id)a3;
- (ConnectionInfo)info;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)dealloc;
- (void)disableProvider;
- (void)enableProvider;
- (void)endService;
- (void)registerForData:(id)a3;
- (void)setClients:(id)a3;
- (void)setInfo:(ConnectionInfo *)a3;
- (void)unregisterForData:(id)a3;
@end

@implementation CLBatchedSensorService

+ (BOOL)isSupported
{
  if (qword_101997850 != -1) {
    dispatch_once(&qword_101997850, &stru_101843A40);
  }
  return byte_101997848;
}

- (CLBatchedSensorService)initWithClientProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLBatchedSensorService;
  result = -[CLBatchedSensorService initWithInboundProtocol:outboundProtocol:]( &v4,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBatchedSensorServiceProtocol,  a3);
  if (result) {
    result->_clients = 0LL;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBatchedSensorService;
  -[CLBatchedSensorService dealloc](&v3, "dealloc");
}

- (void)beginService
{
  if (qword_1019347C0 != -1) {
    dispatch_once(&qword_1019347C0, &stru_101843A60);
  }
  objc_super v3 = (os_log_s *)qword_1019347C8;
  if (os_log_type_enabled((os_log_t)qword_1019347C8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    *(_DWORD *)buf = 136446210;
    v11 = p_info;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[service-base-%{public}s] beginning service",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347C0 != -1) {
      dispatch_once(&qword_1019347C0, &stru_101843A60);
    }
    data = &self->_info;
    int v8 = 136446210;
    v9 = data;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347C8,  0LL,  "[service-base-%{public}s] beginning service",  &v8,  12);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBatchedSensorService beginService]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  self->_clients = objc_opt_new(&OBJC_CLASS___NSMutableSet);
}

- (void)endService
{
  if (qword_1019347C0 != -1) {
    dispatch_once(&qword_1019347C0, &stru_101843A60);
  }
  objc_super v3 = (os_log_s *)qword_1019347C8;
  if (os_log_type_enabled((os_log_t)qword_1019347C8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    *(_DWORD *)buf = 136446210;
    v11 = p_info;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[service-base-%{public}s] ending service",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347C0 != -1) {
      dispatch_once(&qword_1019347C0, &stru_101843A60);
    }
    data = &self->_info;
    int v8 = 136446210;
    v9 = data;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347C8,  0LL,  "[service-base-%{public}s] ending service",  &v8,  12);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBatchedSensorService endService]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  self->_clients = 0LL;
}

- (void)registerForData:(id)a3
{
  if (qword_1019347C0 != -1) {
    dispatch_once(&qword_1019347C0, &stru_101843A60);
  }
  v5 = (os_log_s *)qword_1019347C8;
  if (os_log_type_enabled((os_log_t)qword_1019347C8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    unsigned int v7 = -[NSMutableSet count](self->_clients, "count");
    *(_DWORD *)buf = 136446722;
    v25 = p_info;
    __int16 v26 = 2050;
    id v27 = a3;
    __int16 v28 = 1026;
    unsigned int v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[service-base-%{public}s] added client %{public}p, num clients %{public}d",  buf,  0x1Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347C0 != -1) {
      dispatch_once(&qword_1019347C0, &stru_101843A60);
    }
    data = &self->_info;
    uint64_t v11 = qword_1019347C8;
    unsigned int v12 = -[NSMutableSet count](self->_clients, "count");
    int v18 = 136446722;
    v19 = data;
    __int16 v20 = 2050;
    id v21 = a3;
    __int16 v22 = 1026;
    unsigned int v23 = v12;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  0LL,  "[service-base-%{public}s] added client %{public}p, num clients %{public}d",  &v18,  28);
    v14 = (uint8_t *)v13;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBatchedSensorService registerForData:]", "%s\n", v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  int v8 = (dispatch_queue_s **)sub_100B354EC();
  v9 = &self->_info;
  if (*((char *)&v9->name.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1010DD48C(__p, v9->name.__r_.__value_.var0.var1.__data_, v9->name.__r_.__value_.var0.var1.__size_);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v9->name.__r_.__value_.var0.var0.__data_;
    uint64_t v16 = *((void *)&v9->name.__r_.__value_.var0.var1 + 2);
  }

  int var0 = v9->name.__r_.var0;
  sub_100B371A0(v8, (__int128 *)__p);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[0]);
  }
}

- (void)unregisterForData:(id)a3
{
  if (qword_1019347C0 != -1) {
    dispatch_once(&qword_1019347C0, &stru_101843A60);
  }
  v5 = (os_log_s *)qword_1019347C8;
  if (os_log_type_enabled((os_log_t)qword_1019347C8, OS_LOG_TYPE_DEFAULT))
  {
    p_info = &self->_info;
    unsigned int v7 = -[NSMutableSet count](self->_clients, "count");
    *(_DWORD *)buf = 136446722;
    __int16 v20 = p_info;
    __int16 v21 = 2050;
    id v22 = a3;
    __int16 v23 = 1026;
    unsigned int v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[service-base-%{public}s] removed client %{public}p, num clients left %{public}d",  buf,  0x1Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347C0 != -1) {
      dispatch_once(&qword_1019347C0, &stru_101843A60);
    }
    uint64_t v8 = qword_1019347C8;
    data = &self->_info;
    unsigned int v10 = -[NSMutableSet count](self->_clients, "count");
    int v13 = 136446722;
    v14 = data;
    __int16 v15 = 2050;
    id v16 = a3;
    __int16 v17 = 1026;
    unsigned int v18 = v10;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "[service-base-%{public}s] removed client %{public}p, num clients left %{public}d",  &v13,  28);
    unsigned int v12 = (uint8_t *)v11;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBatchedSensorService unregisterForData:]", "%s\n", v11);
    if (v12 != buf) {
      free(v12);
    }
  }

- (void)enableProvider
{
  p_info = &self->_info;
  uint64_t v3 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  size_t size = self->_info.name.__r_.__value_.var0.var1.__size_;
  if ((v3 & 0x80u) == 0LL) {
    unint64_t v5 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  }
  else {
    unint64_t v5 = self->_info.name.__r_.__value_.var0.var1.__size_;
  }
  uint64_t v6 = qword_101997810;
  if (byte_10199781F >= 0) {
    uint64_t v6 = byte_10199781F;
  }
  if (v5 == v6)
  {
    if (byte_10199781F >= 0) {
      unsigned int v7 = &qword_101997808;
    }
    else {
      unsigned int v7 = (uint64_t *)qword_101997808;
    }
    if ((v3 & 0x80) != 0)
    {
      if (!memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v7, size)) {
        goto LABEL_31;
      }
    }

    else
    {
      if (!*((_BYTE *)&self->_info.name.__r_.__value_.var0.var1 + 23)) {
        goto LABEL_31;
      }
      uint64_t v8 = &self->_info;
      uint64_t v9 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
      while (v8->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v7)
      {
        uint64_t v8 = (ConnectionInfo *)((char *)v8 + 1);
        unsigned int v7 = (uint64_t *)((char *)v7 + 1);
        if (!--v9) {
          goto LABEL_31;
        }
      }
    }
  }

  uint64_t v10 = qword_101997830;
  if (byte_10199783F >= 0) {
    uint64_t v10 = byte_10199783F;
  }
  if (v5 != v10) {
    return;
  }
  if (byte_10199783F >= 0) {
    uint64_t v11 = &qword_101997828;
  }
  else {
    uint64_t v11 = (uint64_t *)qword_101997828;
  }
  if ((v3 & 0x80) != 0)
  {
    if (memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v11, size)) {
      return;
    }
LABEL_31:
    unsigned int v12 = *(void (**)(void))(*(void *)sub_1008FA854(0) + 176LL);
    v12();
    return;
  }

  if (!(_DWORD)v3) {
    goto LABEL_31;
  }
  while (p_info->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_info = (ConnectionInfo *)((char *)p_info + 1);
    uint64_t v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v3) {
      goto LABEL_31;
    }
  }

- (void)disableProvider
{
  p_info = &self->_info;
  uint64_t v3 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  size_t size = self->_info.name.__r_.__value_.var0.var1.__size_;
  if ((v3 & 0x80u) == 0LL) {
    unint64_t v5 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
  }
  else {
    unint64_t v5 = self->_info.name.__r_.__value_.var0.var1.__size_;
  }
  uint64_t v6 = qword_101997810;
  if (byte_10199781F >= 0) {
    uint64_t v6 = byte_10199781F;
  }
  if (v5 == v6)
  {
    if (byte_10199781F >= 0) {
      unsigned int v7 = &qword_101997808;
    }
    else {
      unsigned int v7 = (uint64_t *)qword_101997808;
    }
    if ((v3 & 0x80) != 0)
    {
      if (!memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v7, size)) {
        goto LABEL_31;
      }
    }

    else
    {
      if (!*((_BYTE *)&self->_info.name.__r_.__value_.var0.var1 + 23)) {
        goto LABEL_31;
      }
      uint64_t v8 = &self->_info;
      uint64_t v9 = *((unsigned __int8 *)&self->_info.name.__r_.__value_.var0.var1 + 23);
      while (v8->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v7)
      {
        uint64_t v8 = (ConnectionInfo *)((char *)v8 + 1);
        unsigned int v7 = (uint64_t *)((char *)v7 + 1);
        if (!--v9) {
          goto LABEL_31;
        }
      }
    }
  }

  uint64_t v10 = qword_101997830;
  if (byte_10199783F >= 0) {
    uint64_t v10 = byte_10199783F;
  }
  if (v5 != v10) {
    return;
  }
  if (byte_10199783F >= 0) {
    uint64_t v11 = &qword_101997828;
  }
  else {
    uint64_t v11 = (uint64_t *)qword_101997828;
  }
  if ((v3 & 0x80) != 0)
  {
    if (memcmp(p_info->name.__r_.__value_.var0.var1.__data_, v11, size)) {
      return;
    }
LABEL_31:
    unsigned int v12 = *(void (**)(void))(*(void *)sub_1008FA854(0) + 176LL);
    v12();
    return;
  }

  if (!(_DWORD)v3) {
    goto LABEL_31;
  }
  while (p_info->name.__r_.__value_.var0.var0.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_info = (ConnectionInfo *)((char *)p_info + 1);
    uint64_t v11 = (uint64_t *)((char *)v11 + 1);
    if (!--v3) {
      goto LABEL_31;
    }
  }

- (ConnectionInfo)info
{
  uint64_t v3 = &result->name.__r_.__value_.var0.var1 + 1;
  if (SHIBYTE(result->name.var0) < 0)
  {
    result = (ConnectionInfo *)sub_1010DD48C(retstr, v3->__data_, *(void *)&result->name.__r_.var0);
  }

  else
  {
    retstr->name.__r_.__value_.var0.var1 = *v3;
    *((void *)&retstr->name.__r_.__value_.var0.var1 + 2) = result->name.var0;
  }

  retstr->name.__r_.int var0 = v3[1].__size_;
  return result;
}

- (void)setInfo:(ConnectionInfo *)a3
{
  p_info = &self->_info;
  std::string::operator=((std::string *)&self->_info, (const std::string *)a3);
  p_info->name.__r_.int var0 = a3->name.__r_.var0;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end