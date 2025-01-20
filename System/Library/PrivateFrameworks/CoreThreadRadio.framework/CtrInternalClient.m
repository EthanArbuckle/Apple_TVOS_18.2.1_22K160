@interface CtrInternalClient
- (Result)form:(Result *__return_ptr)retstr;
- (Result)generatePSKc:(Result *__return_ptr)retstr output:;
- (Result)getNCPStatus:(Result *__return_ptr)retstr;
- (Result)getProperty:(Result *__return_ptr)retstr output:;
- (Result)get_device_data_diag:(Result *__return_ptr)retstr;
- (Result)join:(Result *__return_ptr)retstr;
- (Result)joiner:(Result *__return_ptr)retstr;
- (Result)leave;
- (Result)reset:(Result *__return_ptr)retstr;
- (Result)resume;
- (Result)scan:(Result *__return_ptr)retstr;
- (Result)sendData:(Result *__return_ptr)retstr data:data_length:;
- (Result)send_diagnostics_req:(Result *__return_ptr)retstr;
- (Result)send_ping_node:(Result *__return_ptr)retstr;
- (Result)setProperty:(Result *__return_ptr)retstr property_val:;
- (Result)updatePrimaryResident:(Result *__return_ptr)retstr;
- (id).cxx_construct;
- (id)init:(const char *)a3;
- (shared_ptr<InternalClient>)createClient:(const char *)a3;
- (void)setEventHandler:()basic_string<char InternalClientEventBlock:()std:(std::allocator<char>> *)a3 :char_traits<char> dqueue:;
- (void)signal_property_changed:()basic_string<char value:()std:(std::allocator<char>> *)a3 :char_traits<char>;
@end

@implementation CtrInternalClient

- (id)init:(const char *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CtrInternalClient;
  v4 = -[CtrInternalClient init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    -[CtrInternalClient createClient:](v4, "createClient:", a3);
    sub_10015921C((uint64_t)&v5->ctrInternalClientPtr, &v7);
    if (*((void *)&v7 + 1)) {
      sub_10000ABAC(*((std::__shared_weak_count **)&v7 + 1));
    }
  }

  return v5;
}

- (shared_ptr<InternalClient>)createClient:(const char *)a3
{
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (void)setEventHandler:()basic_string<char InternalClientEventBlock:()std:(std::allocator<char>> *)a3 :char_traits<char> dqueue:
{
  v5 = v4;
  id v8 = v3;
  ptr = self->ctrInternalClientPtr.__ptr_;
  std::string::basic_string(&v12, (const std::string *)a3);
  v11 = (dispatch_object_s *)*v5;
  sub_1000B8470((uint64_t)ptr, &v12, v8, &v11);
  v10 = v11;
  v11 = 0LL;
}

- (Result)getProperty:(Result *__return_ptr)retstr output:
{
  uint64_t v4 = v3;
  v6 = *(void **)(v1 + 8);
  std::string::basic_string(&v8, v2);
  sub_1000B77C0(v6, &v8, v4, (uint64_t)retstr);
  return result;
}

- (Result)setProperty:(Result *__return_ptr)retstr property_val:
{
  uint64_t v4 = v3;
  v6 = *(void **)(v1 + 8);
  std::string::basic_string(&v8, v2);
  sub_1000B7DD0(v6, &v8, v4, (uint64_t)retstr);
  return result;
}

- (Result)scan:(Result *__return_ptr)retstr
{
  uint64_t v3 = *(void **)(v1 + 8);
  __int128 v5 = *v2;
  uint64_t v6 = *((void *)v2 + 2);
  sub_1000BAC78(v3, (uint64_t)&v5, (uint64_t)retstr);
  return result;
}

- (Result)updatePrimaryResident:(Result *__return_ptr)retstr
{
  uint64_t v2 = v1;
  *(id *)(v1 + 16);
  sub_1000BA890((uint64_t)retstr);

  return result;
}

- (Result)form:(Result *__return_ptr)retstr
{
  uint64_t v3 = *(void **)(v1 + 8);
  __int128 v4 = *(_OWORD *)(v2 + 80);
  v8[4] = *(_OWORD *)(v2 + 64);
  v8[5] = v4;
  uint64_t v9 = *(void *)(v2 + 96);
  __int128 v5 = *(_OWORD *)(v2 + 16);
  v8[0] = *(_OWORD *)v2;
  v8[1] = v5;
  __int128 v6 = *(_OWORD *)(v2 + 48);
  v8[2] = *(_OWORD *)(v2 + 32);
  v8[3] = v6;
  sub_1000B9B64(v3, (uint64_t)v8, (uint64_t)retstr);
  return result;
}

- (Result)leave
{
  return result;
}

- (Result)join:(Result *__return_ptr)retstr
{
  uint64_t v3 = *(void **)(v1 + 8);
  __int128 v4 = *(_OWORD *)(v2 + 16);
  v6[0] = *(_OWORD *)v2;
  v6[1] = v4;
  v6[2] = *(_OWORD *)(v2 + 32);
  uint64_t v7 = *(void *)(v2 + 48);
  sub_1000BB6CC(v3, (uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)joiner:(Result *__return_ptr)retstr
{
  uint64_t v3 = *(void **)(v1 + 8);
  __int128 v4 = *(_OWORD *)(v2 + 48);
  v7[2] = *(_OWORD *)(v2 + 32);
  v7[3] = v4;
  uint64_t v8 = *(void *)(v2 + 64);
  __int128 v5 = *(_OWORD *)(v2 + 16);
  v7[0] = *(_OWORD *)v2;
  v7[1] = v5;
  sub_1000BBE34(v3, (uint64_t)v7, (uint64_t)retstr);
  return result;
}

- (Result)resume
{
  return result;
}

- (Result)reset:(Result *__return_ptr)retstr
{
  return result;
}

- (Result)send_diagnostics_req:(Result *__return_ptr)retstr
{
  uint64_t v3 = *(void **)(v1 + 8);
  __int128 v4 = *(_OWORD *)(v2 + 16);
  v6[0] = *(_OWORD *)v2;
  v6[1] = v4;
  int v7 = *(_DWORD *)(v2 + 32);
  sub_1000B91C8(v3, (unsigned __int16 *)v6, (uint64_t)retstr);
  return result;
}

- (Result)send_ping_node:(Result *__return_ptr)retstr
{
  uint64_t v2 = v1;
  std::string::basic_string(&__p, v1);
  __int16 data = (__int16)v2[1].__r_.__value_.__l.__data_;
  sub_1000B9754((uint64_t)retstr);
  return result;
}

- (Result)get_device_data_diag:(Result *__return_ptr)retstr
{
  uint64_t v2 = v1;
  std::string::basic_string(&v5, v1);
  __int128 v6 = *(_OWORD *)&v2[1].__r_.__value_.__l.__data_;
  __int16 v7 = v2[1].__r_.__value_.__r.__words[2];
  sub_1000B995C((uint64_t)retstr);
  return result;
}

- (Result)sendData:(Result *__return_ptr)retstr data:data_length:
{
  return result;
}

- (Result)generatePSKc:(Result *__return_ptr)retstr output:
{
  uint64_t v4 = v3;
  std::string v5 = v2;
  __int16 v7 = *(void **)(v1 + 8);
  uint64_t v8 = (void *)v2[1];
  v10[0] = *v2;
  v10[1] = v8;
  __int128 v11 = *((_OWORD *)v5 + 1);
  sub_1000BD4C8(v7, (uint64_t)v10, v4, (uint64_t)retstr);

  return result;
}

- (Result)getNCPStatus:(Result *__return_ptr)retstr
{
  return result;
}

- (void)signal_property_changed:()basic_string<char value:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  uint64_t v4 = v3;
  ptr = self->ctrInternalClientPtr.__ptr_;
  std::string::basic_string(&v6, (const std::string *)a3);
  sub_1000BDC64((uint64_t)ptr, &v6, v4);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end