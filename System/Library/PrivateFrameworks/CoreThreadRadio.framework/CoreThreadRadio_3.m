void sub_1001F41C4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  *(void *)(v2 - 160) = v2 - 128;
  sub_100006F6C((void ***)(v2 - 160));
  v4 = *(void *)(v1 + 152);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  _Unwind_Resume(a1);
}

void ControllerApple::~ControllerApple(ControllerApple *this)
{
  *(void *)this = &off_1002B5E20;
  v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "BA Wrapper: ControllerApple Dealloc start",  buf,  2u);
  }

  sub_1000B7514(*((void *)this + 4));
  v3 = (dispatch_queue_s *)*((void *)this + 6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_1001F44EC;
  block[3] = &unk_1002B5E68;
  block[4] = this;
  dispatch_sync(v3, block);
  v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "BA Wrapper: ControllerApple Dealloc Release the dispatch queue ",  buf,  2u);
  }

  dispatch_release(*((dispatch_object_t *)this + 6));
  *((void *)this + 6) = 0LL;
  v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BA Wrapper: ControllerApple Dealloc stop", buf, 2u);
  }

  sub_10000AB80((uint64_t)this + 32);
  sub_1001F48D4((uint64_t)this + 8);
}

{
  void *v1;
  ControllerApple::~ControllerApple(this);
  operator delete(v1);
}

void sub_1001F44EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v3) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "BA Wrapper: ControllerApple Dealloc remove the internal client ",  (uint8_t *)&v3,  2u);
  }

  sub_1000B71D8(*(void *)(v1 + 32));
  __int128 v3 = 0uLL;
  sub_10015921C(v1 + 32, &v3);
  if (*((void *)&v3 + 1)) {
    sub_10000ABAC(*((std::__shared_weak_count **)&v3 + 1));
  }
}

uint64_t ControllerApple::UdpForwardSend( ControllerApple *this, const unsigned __int8 *a2, unsigned int a3, int a4, const in6_addr *a5, int a6)
{
  size_t v11 = a3;
  sub_100035214(&__dst, a3 + 20LL);
  memcpy(__dst, a2, v11);
  *((_BYTE *)__dst + v11) = BYTE1(a4);
  *((_BYTE *)__dst + v11 + 1) = a4;
  *(in6_addr *)((char *)__dst + v11 + 2) = *a5;
  *((_BYTE *)__dst + v11 + 18) = BYTE1(a6);
  *((_BYTE *)__dst + v11 + 19) = a6;
  v13 = (unsigned __int8 *)__dst;
  v12 = v28;
  int64_t v14 = v28 - (_BYTE *)__dst;
  if (v28 - (_BYTE *)__dst < 0)
  {
LABEL_14:
    __break(0x550Cu);
LABEL_15:
    __break(1u);
  }

  uint64_t v15 = 2 * v14;
  v16 = (char *)malloc((2 * v14) | 1);
  if (v15 < 0) {
    goto LABEL_15;
  }
  v17 = v16;
  v16[v15] = 0;
  if (v12 != v13)
  {
    unint64_t v18 = 0LL;
    v19 = v16;
    while (v18 != 0x40000000)
    {
      sprintf(v19, "%02X", v13[v18++]);
      v13 = (unsigned __int8 *)__dst;
      v19 += 2;
      if (v28 - (_BYTE *)__dst <= v18) {
        goto LABEL_7;
      }
    }

    goto LABEL_14;
  }

void sub_1001F4808( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char *a28)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  a28 = &a21;
  sub_100006F6C((void ***)&a28);
  _Unwind_Resume(a1);
}

std::string *ControllerApple::dumpState@<X0>(ControllerApple *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  if (*((void *)this + 6)) {
    v4 = "\t Queue : YES,\n";
  }
  else {
    v4 = "\t Queue : NO,\n";
  }
  std::string::append(a2, v4);
  if (*((void *)this + 4)) {
    v5 = "\t Client : YES,\n";
  }
  else {
    v5 = "\t Client : NO,\n";
  }
  return std::string::append(a2, v5);
}

void sub_1001F48B8(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1001F48D4(uint64_t a1)
{
  return a1;
}

void sub_1001F48FC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1001F48FC(a1, *a2);
    sub_1001F48FC(a1, a2[1]);
    sub_1001F4944(a2 + 5);
    operator delete(a2);
  }

void sub_1001F4944(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    v2 = (uint64_t *)a1[1];
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0LL;
    while (v2 != a1)
    {
      v5 = (uint64_t *)v2[1];
      sub_100071518((int)a1, v2);
      v2 = v5;
    }
  }

void sub_1001F49A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001F4A08( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t *ot::BorderRouter::AgentInstance::AgentInstance(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  ot::BorderRouter::BorderAgent::BorderAgent((uint64_t)(a1 + 1), a2);
  return a1;
}

{
  *a1 = a2;
  ot::BorderRouter::BorderAgent::BorderAgent((uint64_t)(a1 + 1), a2);
  return a1;
}

uint64_t ot::BorderRouter::AgentInstance::Init(ot::BorderRouter::AgentInstance *this)
{
  uint64_t v2 = (***(uint64_t (****)(void))this)(*(void *)this);
  if (!(_DWORD)v2) {
    ot::BorderRouter::BorderAgent::Init((ot::BorderRouter::AgentInstance *)((char *)this + 8));
  }
  otbrLogResult((uint64_t)"BA Wrapper: Initialize OpenThread Border Router Agent", v2);
  return v2;
}

uint64_t ot::BorderRouter::AgentInstance::UpdateFdSet(void *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t)(a1 + 1);
  (*(void (**)(void))(*(void *)*a1 + 16LL))(*a1);
  return ot::BorderRouter::BorderAgent::UpdateFdSet( v3,  (fd_set *)a2,  (fd_set *)(a2 + 128),  (fd_set *)(a2 + 256),  (int *)(a2 + 384),  (timeval *)(a2 + 392));
}

uint64_t ot::BorderRouter::AgentInstance::Process(void *a1, const fd_set *a2)
{
  uint64_t v3 = (uint64_t)(a1 + 1);
  (*(void (**)(void))(*(void *)*a1 + 24LL))(*a1);
  return ot::BorderRouter::BorderAgent::Process(v3, a2, a2 + 1, a2 + 2);
}

void ot::BorderRouter::AgentInstance::~AgentInstance(ot::BorderRouter::AgentInstance *this)
{
  uint64_t v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "BA Wrapper: Enter AgentInstance Deallocator",  buf,  2u);
  }

  if (*(void *)this) {
    (*(void (**)(void))(**(void **)this + 48LL))(*(void *)this);
  }
  uint64_t v3 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "BA Wrapper: Exit AgentInstance Deallocator",  v4,  2u);
  }

  ot::BorderRouter::BorderAgent::~BorderAgent((ot::BorderRouter::AgentInstance *)((char *)this + 8));
}

void ot::BorderRouter::AgentInstance::dumpState( ot::BorderRouter::AgentInstance *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  (*(void (**)(std::string *__return_ptr))(**(void **)this + 56LL))(&v8);
  std::operator+<char>(&v9, "NCP : {\n", &v8);
  uint64_t v4 = std::string::append(&v9, "};\n");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  std::string::size_type cap = v4->__r_.__value_.__l.__cap_;
  *(_OWORD *)__p = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  sub_10000D650(a2, (const std::string::value_type *)__p);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  ot::BorderRouter::BorderAgent::dumpState((ot::BorderRouter::AgentInstance *)((char *)this + 8), &v8);
  std::operator+<char>(&v9, "BorderAgent : {\n", &v8);
  v6 = std::string::append(&v9, "};");
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  std::string::size_type cap = v6->__r_.__value_.__l.__cap_;
  *(_OWORD *)__p = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  sub_10000D650(a2, (const std::string::value_type *)__p);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1001F4DB8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ot::BorderRouter::AgentInstance::TurnEventsOn(ot::BorderRouter::AgentInstance *this)
{
  uint64_t result = *(void *)this;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 64LL))(result);
  }
  __break(0x5516u);
  return result;
}

uint64_t ot::BorderRouter::AgentInstance::ResetSocketClosedFlag(ot::BorderRouter::AgentInstance *this)
{
  uint64_t v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "BA Wrapper: Reset socket closed flag", v4, 2u);
  }

  return ot::BorderRouter::BorderAgent::ResetSocketClosedFlag((uint64_t)this + 8);
}

uint64_t ot::BorderRouter::AgentInstance::IsSocketClosedFlagSet(ot::BorderRouter::AgentInstance *this)
{
  return ot::BorderRouter::BorderAgent::IsSocketClosedFlagSet((ot::BorderRouter::AgentInstance *)((char *)this + 8));
}

BOOL ot::BorderRouter::AgentInstance::IsSocketValid(ot::BorderRouter::AgentInstance *this)
{
  return ot::BorderRouter::BorderAgent::IsSocketValid((ot::BorderRouter::AgentInstance *)((char *)this + 8));
}

uint64_t ot::BorderRouter::BorderAgent::BorderAgent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = ot::BorderRouter::Mdns::Publisher::Create( 0LL,  0LL,  0LL,  (uint64_t)ot::BorderRouter::BorderAgent::HandleMdnsState,  a1);
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = -1;
  *(_WORD *)(a1 + 47) = 0;
  return a1;
}

{
  *(void *)a1 = ot::BorderRouter::Mdns::Publisher::Create( 0LL,  0LL,  0LL,  (uint64_t)ot::BorderRouter::BorderAgent::HandleMdnsState,  a1);
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = -1;
  *(_WORD *)(a1 + 47) = 0;
  return a1;
}

void ot::BorderRouter::BorderAgent::Init(ot::BorderRouter::BorderAgent *this)
{
  *(void *)((char *)this + 38) = 0LL;
  *(void *)((char *)this + 30) = 0LL;
  *((_BYTE *)this + 46) = 0;
  *(void *)((char *)this + 20) = 0LL;
  *((void *)this + 7) = 0LL;
  *((_WORD *)this + 14) = 3;
  *((_BYTE *)this + 68) = 0;
  *((_DWORD *)this + 16) = 49;
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  5,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::SendToCommissioner,  this);
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  0,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::HandleExtPanId,  this);
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  1,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::HandleNetworkName,  this);
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  4,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::HandleThreadVersion,  this);
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  3,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::HandleThreadState,  this);
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  2,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::HandlePSKc,  this);
  ot::BorderRouter::EventEmitter::On( (uint64_t **)(*((void *)this + 1) + 8LL),  6,  (void (*)(void *, int, char *))ot::BorderRouter::BorderAgent::HandleExtendedAddress,  this);
  int v2 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 1) + 32LL))(*((void *)this + 1), 3LL);
  otbrLogResult((uint64_t)"Check if Thread is up", v2);
}

void ot::BorderRouter::BorderAgent::SendToCommissioner( ot::BorderRouter::BorderAgent *this, void *a2, uint64_t a3, char *a4)
{
  int v4 = (int)a2;
  uint64_t v13 = a3 + 8;
  __int128 v5 = *(const void **)a3;
  uint64_t v13 = a3 + 16;
  int v6 = *(_DWORD *)(a3 + 8);
  uint64_t v13 = a3 + 24;
  unsigned int v7 = *(_DWORD *)(a3 + 16);
  uint64_t v13 = a3 + 32;
  std::string v8 = *(_OWORD **)(a3 + 24);
  uint64_t v13 = a3 + 40;
  if (v4 != 5) {
    sub_1001F7D38();
  }
  if ((unsigned __int16)*(_DWORD *)(a3 + 32) == 49191)
  {
    int v9 = *((_DWORD *)this + 4);
    if (v9 != -1)
    {
      *(void *)size_t v11 = 7680LL;
      *(_OWORD *)&v11[8] = 0uLL;
      int v12 = 0;
      *(_OWORD *)&v11[8] = *v8;
      *(_DWORD *)&v11[2] = bswap32(v7) >> 16;
      if (sendto(v9, v5, (unsigned __int16)v6, 0, (const sockaddr *)v11, 0x1Cu) == (unsigned __int16)v6)
      {
        v10 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1001F7CF8(v10);
        }
      }

      else
      {
        perror("send to commissioner");
      }
    }
  }

void ot::BorderRouter::BorderAgent::HandleExtPanId( ot::BorderRouter::BorderAgent *this, void *a2, const unsigned __int8 **a3, char *a4)
{
  if ((_DWORD)a2) {
    sub_1001F7D60();
  }
  ot::BorderRouter::BorderAgent::SetExtPanId(this, *a3);
}

void ot::BorderRouter::BorderAgent::HandleNetworkName( ot::BorderRouter::BorderAgent *this, void *a2, char **a3, char *a4)
{
  if ((_DWORD)a2 != 1) {
    sub_1001F7D88();
  }
  ot::BorderRouter::BorderAgent::SetNetworkName(this, *a3);
}

void ot::BorderRouter::BorderAgent::HandleThreadVersion( ot::BorderRouter::BorderAgent *this, void *a2, __int16 *a3, char *a4)
{
  if ((_DWORD)a2 != 4) {
    sub_1001F7DB0();
  }
  ot::BorderRouter::BorderAgent::SetThreadVersion(this, *a3);
}

void ot::BorderRouter::BorderAgent::HandleThreadState( ot::BorderRouter::BorderAgent *this, void *a2, _DWORD *a3, char *a4)
{
  if ((_DWORD)a2 != 3) {
    sub_1001F7DD8();
  }
  ot::BorderRouter::BorderAgent::HandleThreadState(this, *a3 != 0);
}

void ot::BorderRouter::BorderAgent::HandlePSKc( ot::BorderRouter::BorderAgent *this, void *a2, const unsigned __int8 **a3, char *a4)
{
  if ((_DWORD)a2 != 2) {
    sub_1001F7E00();
  }
  ot::BorderRouter::BorderAgent::HandlePSKc(this, *a3);
}

void ot::BorderRouter::BorderAgent::HandleExtendedAddress( ot::BorderRouter::BorderAgent *this, void *a2, uint64_t *a3, char *a4)
{
  if ((_DWORD)a2 != 6) {
    sub_1001F7E28();
  }
  ot::BorderRouter::BorderAgent::HandleExtendedAddress(this, *a3);
}

uint64_t ot::BorderRouter::BorderAgent::Start(ot::BorderRouter::BorderAgent *this)
{
  int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *((unsigned __int8 *)this + 47);
    int v4 = *((unsigned __int8 *)this + 48);
    *(_DWORD *)buf = 67109376;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "BA: BorderAgent::Start mThreadStarted:%d mPSKcInitialized:%d",  buf,  0xEu);
  }

  if (*((_BYTE *)this + 47) && *((_BYTE *)this + 48))
  {
    ot::BorderRouter::BorderAgent::Stop(this);
    *(void *)&v10.sa_len = 666902016LL;
    *(void *)&v10.sa_data[6] = 0LL;
    int v12 = 0;
    uint64_t v11 = 0LL;
    int v5 = socket(30, 2, 17);
    *((_DWORD *)this + 4) = v5;
    if (v5 == -1 || bind(v5, &v10, 0x1Cu))
    {
      uint64_t v6 = 0xFFFFFFFFLL;
    }

    else
    {
      *((_BYTE *)this + 68) = 0;
      std::string v8 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        int v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BA: BorderAgent::Start mSocket:%d", buf, 8u);
      }

      uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**((void **)this + 1) + 32LL))(*((void *)this + 1), 1LL);
      if (!(_DWORD)v6)
      {
        uint64_t v6 = (*(uint64_t (**)(void, void))(**((void **)this + 1) + 32LL))(*((void *)this + 1), 0LL);
        if (!(_DWORD)v6) {
          ot::BorderRouter::BorderAgent::StartPublishService(this);
        }
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  otbrLogResult((uint64_t)"Start Thread Border Agent", v6);
  return v6;
}

void ot::BorderRouter::BorderAgent::Stop(ot::BorderRouter::BorderAgent *this)
{
  int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *((_DWORD *)this + 4);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "BA: Calling socket close() mSocket:%d",  (uint8_t *)v6,  8u);
  }

  int v4 = *((_DWORD *)this + 4);
  if (v4 != -1)
  {
    close(v4);
    *((_DWORD *)this + 4) = -1;
    *((_BYTE *)this + 68) = 1;
  }

  int v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BA: Calling StopPublishService", (uint8_t *)v6, 2u);
  }

  ot::BorderRouter::BorderAgent::StopPublishService(this);
}

void ot::BorderRouter::BorderAgent::StartPublishService(ot::BorderRouter::BorderAgent *this)
{
  int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Start publishing service Entry", buf, 2u);
  }

  if (*((_BYTE *)this + 30))
  {
    else {
      (***(void (****)(void))this)(*(void *)this);
    }
  }

  int v3 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Start publishing service Exit", v4, 2u);
  }

uint64_t ot::BorderRouter::BorderAgent::ResetSocketClosedFlag(uint64_t this)
{
  *(_BYTE *)(this + 68) = 0;
  return this;
}

uint64_t ot::BorderRouter::BorderAgent::IsSocketClosedFlagSet(ot::BorderRouter::BorderAgent *this)
{
  return *((unsigned __int8 *)this + 68);
}

BOOL ot::BorderRouter::BorderAgent::IsSocketValid(ot::BorderRouter::BorderAgent *this)
{
  return *((_DWORD *)this + 4) != -1;
}

void ot::BorderRouter::BorderAgent::StopPublishService(ot::BorderRouter::BorderAgent *this)
{
  int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "BA: Inside StopPublishService", buf, 2u);
  }

  int v3 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BA: Stop publishing service", v4, 2u);
  }

void ot::BorderRouter::BorderAgent::~BorderAgent(ot::BorderRouter::BorderAgent *this)
{
  int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "BA: Calling ~BorderAgent", v3, 2u);
  }

  ot::BorderRouter::BorderAgent::Stop(this);
  if (*(void *)this)
  {
    (*(void (**)(void))(**(void **)this + 64LL))(*(void *)this);
    *(void *)this = 0LL;
  }

void ot::BorderRouter::BorderAgent::HandleMdnsState(ot::BorderRouter::BorderAgent *a1, int a2)
{
  if (a2 == 1)
  {
    ot::BorderRouter::BorderAgent::PublishService(a1);
  }

  else
  {
    int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1001F7E50(v2);
    }
  }

void ot::BorderRouter::BorderAgent::PublishService(ot::BorderRouter::BorderAgent *this)
{
  unsigned int v19 = bswap32(*((_DWORD *)this + 16));
  sub_1001F5EB0(&__p, "rv", "1");
  uint64_t v16 = 0LL;
  unint64_t v17 = 0LL;
  unint64_t v18 = 0LL;
  v20 = (char *)&v16;
  char v21 = 0;
  sub_1001F7064(&v16, 1uLL);
  sub_1001F70B8((uint64_t)&v16, &__p, &v26);
  v20 = (char *)&v23;
  sub_100006F6C((void ***)&v20);
  v20 = (char *)this + 30;
  int v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *((void *)this + 7);
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315906;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)this + 30;
    WORD2(__p.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)"_meshcop._udp.";
    HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
    uint64_t v23 = v3;
    __int16 v24 = 1024;
    int v25 = 49191;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Publish meshcop service %s.%s.local. xa:0x%llx port:%d",  (uint8_t *)&__p,  0x26u);
  }

  unint64_t v4 = v17;
  if (v17 >= v18)
  {
    unint64_t v5 = sub_1001F73E8(&v16, "nn", &v20);
  }

  else
  {
    sub_1001F73A4((uint64_t)&v16, "nn", &v20);
    unint64_t v5 = v4 + 48;
  }

  unint64_t v17 = v5;
  uint64_t v6 = (char *)this + 20;
  __p.__r_.__value_.__r.__words[0] = 8LL;
  if (v5 >= v18)
  {
    unint64_t v7 = sub_1001F78BC(&v16, "xp", v6, (uint64_t *)&__p);
  }

  else
  {
    sub_1001F7874((uint64_t)&v16, "xp", v6, (uint64_t *)&__p);
    unint64_t v7 = v5 + 48;
  }

  unint64_t v17 = v7;
  std::string v8 = "0.0.0";
  int v9 = *((unsigned __int16 *)this + 14);
  if (v9 == 3) {
    std::string v8 = "1.2.0";
  }
  if (v9 == 2) {
    std::string v8 = "1.1.1";
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
  if (v7 >= v18)
  {
    unint64_t v10 = sub_1001F73E8(&v16, "tv", &__p.__r_.__value_.__l.__data_);
  }

  else
  {
    sub_1001F73A4((uint64_t)&v16, "tv", &__p.__r_.__value_.__l.__data_);
    unint64_t v10 = v7 + 48;
  }

  unint64_t v17 = v10;
  if (v10 >= v18)
  {
    unint64_t v11 = sub_1001F7A54(&v16, "vn", "Apple Inc.");
  }

  else
  {
    sub_1001F7A1C((uint64_t)&v16, "vn", "Apple Inc.");
    unint64_t v11 = v10 + 48;
  }

  unint64_t v17 = v11;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)this + 56;
  uint64_t v15 = 8LL;
  if (v11 >= v18)
  {
    unint64_t v12 = sub_1001F7B98(&v16, "xa", (const void **)&__p.__r_.__value_.__l.__data_, &v15);
  }

  else
  {
    sub_1001F7B50((uint64_t)&v16, "xa", (const void **)&__p.__r_.__value_.__l.__data_, &v15);
    unint64_t v12 = v11 + 48;
  }

  unint64_t v17 = v12;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)this + 56;
  uint64_t v15 = 8LL;
  if (v12 >= v18)
  {
    unint64_t v13 = sub_1001F7B98(&v16, "dd", (const void **)&__p.__r_.__value_.__l.__data_, &v15);
  }

  else
  {
    sub_1001F7B50((uint64_t)&v16, "dd", (const void **)&__p.__r_.__value_.__l.__data_, &v15);
    unint64_t v13 = v12 + 48;
  }

  unint64_t v17 = v13;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v19;
  uint64_t v15 = 4LL;
  if (v13 >= v18)
  {
    uint64_t v14 = sub_1001F7B98(&v16, "sb", (const void **)&__p.__r_.__value_.__l.__data_, &v15);
  }

  else
  {
    sub_1001F7B50((uint64_t)&v16, "sb", (const void **)&__p.__r_.__value_.__l.__data_, &v15);
    uint64_t v14 = v13 + 48;
  }

  unint64_t v17 = v14;
  (*(void (**)(void, uint64_t, char *, const char *, uint64_t *))(**(void **)this + 24LL))( *(void *)this,  49191LL,  (char *)this + 30,  "_meshcop._udp.",  &v16);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  sub_1001F72E0((void ***)&__p);
}

void sub_1001F5CF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void **a17)
{
  a17 = (void **)&a11;
  sub_1001F72E0(&a17);
  _Unwind_Resume(a1);
}

uint64_t ot::BorderRouter::BorderAgent::UpdateFdSet( uint64_t this, fd_set *a2, fd_set *a3, fd_set *a4, int *a5, timeval *a6)
{
  unint64_t v6 = *(int *)(this + 16);
  if ((_DWORD)v6 != -1)
  {
    uint64_t v9 = this;
    this = __darwin_check_fd_set_overflow(*(_DWORD *)(this + 16), a2, 0);
    if ((_DWORD)this) {
      *(__int32_t *)((char *)a2->fds_bits + ((v6 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v6;
    }
    int v10 = *(_DWORD *)(v9 + 16);
    if (v10 > *a5) {
      *a5 = v10;
    }
  }

  return this;
}

uint64_t ot::BorderRouter::BorderAgent::Process( uint64_t this, const fd_set *a2, const fd_set *a3, const fd_set *a4)
{
  socklen_t v7 = 28;
  unint64_t v4 = *(int *)(this + 16);
  if ((_DWORD)v4 != -1)
  {
    uint64_t v6 = this;
    this = __darwin_check_fd_set_overflow(*(_DWORD *)(this + 16), a2, 0);
    if ((_DWORD)this)
    {
      if (((*(unsigned int *)((char *)a2->fds_bits + ((v4 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v4) & 1) != 0)
      {
        this = recvfrom(*(_DWORD *)(v6 + 16), v9, 0x5DCuLL, 0, &v8, &v7);
        if (this >= 1) {
          return (*(uint64_t (**)(void, _BYTE *, void, void, char *, uint64_t))(**(void **)(v6 + 8)
        }
                                                                                             + 8LL))( *(void *)(v6 + 8),  v9,  (unsigned __int16)this,  bswap32(*(unsigned __int16 *)v8.sa_data) >> 16,  &v8.sa_data[6],  49191LL);
      }
    }
  }

  return this;
}

void *sub_1001F5EB0(void *a1, char *a2, char *__s)
{
  size_t v6 = strlen(__s);
  size_t v7 = strlen(a2);
  return sub_1001F6F64(a1, a2, v7, __s, v6);
}

uint64_t sub_1001F5F04(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 24);
  sub_100006F6C(&v3);
  return a1;
}

void ot::BorderRouter::BorderAgent::SetNetworkName(ot::BorderRouter::BorderAgent *this, char *a2)
{
  unint64_t v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SetNetworkName Entry", buf, 2u);
  }

  strcpy_safe((char *)this + 30, 0x11uLL, a2);
  if (*((_BYTE *)this + 47))
  {
    (*(void (**)(void))(**(void **)this + 8LL))(*(void *)this);
    ot::BorderRouter::BorderAgent::StartPublishService(this);
  }

  unint64_t v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)size_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SetNetworkName Exit", v6, 2u);
  }

void ot::BorderRouter::BorderAgent::SetExtPanId( ot::BorderRouter::BorderAgent *this, const unsigned __int8 *a2)
{
  unint64_t v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SetExtPanId Entry", buf, 2u);
  }

  *(void *)((char *)this + 20) = *(void *)a2;
  if (*((_BYTE *)this + 47)) {
    ot::BorderRouter::BorderAgent::StartPublishService(this);
  }
  unint64_t v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)size_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SetExtPanId Exit", v6, 2u);
  }

void ot::BorderRouter::BorderAgent::SetThreadVersion(ot::BorderRouter::BorderAgent *this, __int16 a2)
{
  unint64_t v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SetThreadVersion Entry", buf, 2u);
  }

  *((_WORD *)this + 14) = a2;
  if (*((_BYTE *)this + 47)) {
    ot::BorderRouter::BorderAgent::StartPublishService(this);
  }
  unint64_t v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)size_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SetThreadVersion Exit", v6, 2u);
  }

void ot::BorderRouter::BorderAgent::HandlePSKc( ot::BorderRouter::BorderAgent *this, const unsigned __int8 *a2)
{
  *((_BYTE *)this + 48) = 0;
  unint64_t v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "HandlePSKc Entry", (uint8_t *)&v8, 2u);
  }

  for (uint64_t i = 0LL; i != 16; ++i)
  {
    if (a2[i])
    {
      *((_BYTE *)this + 48) = 1;
      goto LABEL_9;
    }
  }

  if (!*((_BYTE *)this + 48))
  {
    ot::BorderRouter::BorderAgent::Stop(this);
    goto LABEL_10;
  }

void ot::BorderRouter::BorderAgent::HandleThreadState(ot::BorderRouter::BorderAgent *this, int a2)
{
  unint64_t v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *((unsigned __int8 *)this + 47);
    int v9 = 67109376;
    LODWORD(v10[0]) = v5;
    WORD2(v10[0]) = 1024;
    *(_DWORD *)((char *)v10 + 6) = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "BA: Inside HandleThreadState() mThreadStarted:%d aStarted:%d",  (uint8_t *)&v9,  0xEu);
  }

  if (*((unsigned __int8 *)this + 47) != a2)
  {
    *((_BYTE *)this + 47) = a2;
    if (a2)
    {
      if (!(*(unsigned int (**)(void, uint64_t))(**((void **)this + 1) + 32LL))( *((void *)this + 1),  2LL)
        && !(*(unsigned int (**)(void, uint64_t))(**((void **)this + 1) + 32LL))( *((void *)this + 1),  6LL))
      {
        ot::BorderRouter::BorderAgent::Start(this);
      }
    }

    else
    {
      size_t v6 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "BA: HandleThreadState Calling BorderAgent Stop()",  (uint8_t *)&v9,  2u);
      }

      ot::BorderRouter::BorderAgent::Stop(this);
    }
  }

  size_t v7 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = "down";
    if (a2) {
      int v8 = "up";
    }
    int v9 = 136315138;
    v10[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BA: Thread is %s", (uint8_t *)&v9, 0xCu);
  }

void ot::BorderRouter::BorderAgent::HandleExtendedAddress(ot::BorderRouter::BorderAgent *this, uint64_t a2)
{
  unint64_t v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "HandleExtendedAddress Entry", buf, 2u);
  }

  *((void *)this + 7) = a2;
  if (*((_BYTE *)this + 47)) {
    ot::BorderRouter::BorderAgent::StartPublishService(this);
  }
  int v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)size_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HandleExtendedAddress Exit", v6, 2u);
  }

void ot::BorderRouter::BorderAgent::dumpState( ot::BorderRouter::BorderAgent *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  (*(void (**)(std::string *__return_ptr))(**(void **)this + 32LL))(&v61);
  std::operator+<char>(&v62, "\t Publisher : {\n", &v61);
  unint64_t v4 = std::string::append(&v62, "\t},\n");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  std::string::size_type cap = v4->__r_.__value_.__l.__cap_;
  __int128 v63 = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  sub_10000D650(a2, (const std::string::value_type *)&v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  std::to_string(&v61, *((_DWORD *)this + 4));
  size_t v6 = std::string::insert(&v61, 0LL, "\t mSocket : ");
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v6->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  int v8 = std::string::append(&v62, ",\n");
  __int128 v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  std::string::size_type cap = v8->__r_.__value_.__l.__cap_;
  __int128 v63 = v9;
  v8->__r_.__value_.__l.__size_ = 0LL;
  v8->__r_.__value_.__l.__cap_ = 0LL;
  v8->__r_.__value_.__r.__words[0] = 0LL;
  sub_10000D650(a2, (const std::string::value_type *)&v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  std::to_string(&v54, *((unsigned __int8 *)this + 20));
  int v10 = std::string::insert(&v54, 0LL, "\t mExtPanId : ");
  __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v55.__r_.__value_.__l.__cap_ = v10->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v55.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0LL;
  v10->__r_.__value_.__l.__cap_ = 0LL;
  v10->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&v53, *((unsigned __int8 *)this + 21));
  unint64_t v12 = sub_10000D650(&v55, (const std::string::value_type *)&v53);
  __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v56.__r_.__value_.__l.__cap_ = v12->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v56.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0LL;
  v12->__r_.__value_.__l.__cap_ = 0LL;
  v12->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&v52, *((unsigned __int8 *)this + 22));
  uint64_t v14 = sub_10000D650(&v56, (const std::string::value_type *)&v52);
  __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v57.__r_.__value_.__l.__cap_ = v14->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v57.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0LL;
  v14->__r_.__value_.__l.__cap_ = 0LL;
  v14->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&v51, *((unsigned __int8 *)this + 23));
  uint64_t v16 = sub_10000D650(&v57, (const std::string::value_type *)&v51);
  __int128 v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v58.__r_.__value_.__l.__cap_ = v16->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v58.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0LL;
  v16->__r_.__value_.__l.__cap_ = 0LL;
  v16->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&v50, *((unsigned __int8 *)this + 24));
  unint64_t v18 = sub_10000D650(&v58, (const std::string::value_type *)&v50);
  __int128 v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v59.__r_.__value_.__l.__cap_ = v18->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v59.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0LL;
  v18->__r_.__value_.__l.__cap_ = 0LL;
  v18->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&v49, *((unsigned __int8 *)this + 25));
  v20 = sub_10000D650(&v59, (const std::string::value_type *)&v49);
  __int128 v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  v60.__r_.__value_.__l.__cap_ = v20->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v60.__r_.__value_.__l.__data_ = v21;
  v20->__r_.__value_.__l.__size_ = 0LL;
  v20->__r_.__value_.__l.__cap_ = 0LL;
  v20->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&v48, *((unsigned __int8 *)this + 26));
  v22 = sub_10000D650(&v60, (const std::string::value_type *)&v48);
  __int128 v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  v61.__r_.__value_.__l.__cap_ = v22->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v23;
  v22->__r_.__value_.__l.__size_ = 0LL;
  v22->__r_.__value_.__l.__cap_ = 0LL;
  v22->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&__p, *((unsigned __int8 *)this + 27));
  __int16 v24 = sub_10000D650(&v61, (const std::string::value_type *)&__p);
  __int128 v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v24->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0LL;
  v24->__r_.__value_.__l.__cap_ = 0LL;
  v24->__r_.__value_.__r.__words[0] = 0LL;
  std::string v26 = std::string::append(&v62, ",\n");
  __int128 v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  std::string::size_type cap = v26->__r_.__value_.__l.__cap_;
  __int128 v63 = v27;
  v26->__r_.__value_.__l.__size_ = 0LL;
  v26->__r_.__value_.__l.__cap_ = 0LL;
  v26->__r_.__value_.__r.__words[0] = 0LL;
  sub_10000D650(a2, (const std::string::value_type *)&v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  std::to_string(&v61, *((unsigned __int16 *)this + 14));
  v28 = std::string::insert(&v61, 0LL, "\t mThreadVersion : ");
  __int128 v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v28->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v29;
  v28->__r_.__value_.__l.__size_ = 0LL;
  v28->__r_.__value_.__l.__cap_ = 0LL;
  v28->__r_.__value_.__r.__words[0] = 0LL;
  int v30 = std::string::append(&v62, ",\n");
  __int128 v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
  std::string::size_type cap = v30->__r_.__value_.__l.__cap_;
  __int128 v63 = v31;
  v30->__r_.__value_.__l.__size_ = 0LL;
  v30->__r_.__value_.__l.__cap_ = 0LL;
  v30->__r_.__value_.__r.__words[0] = 0LL;
  sub_10000D650(a2, (const std::string::value_type *)&v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    size_t size = a2->__r_.__value_.__s.__size_;
  }
  else {
    size_t size = a2->__r_.__value_.__l.__size_;
  }
  if (size >= 0xFFFFFFFFFFFFFFEFLL)
  {
    __break(0x5500u);
  }

  else
  {
    __int16 v33 = &v61;
    sub_1000765F0((uint64_t)&v61, size + 17);
    if ((v61.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      __int16 v33 = (std::string *)v61.__r_.__value_.__r.__words[0];
    }
    if (size)
    {
      if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v34 = a2;
      }
      else {
        int v34 = (std::string *)a2->__r_.__value_.__r.__words[0];
      }
      memmove(v33, v34, size);
    }

    strcpy((char *)v33 + size, "\t mNetworkName : ");
    __int16 v35 = std::string::append(&v61, (const std::string::value_type *)this + 30);
    __int128 v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
    v62.__r_.__value_.__l.__cap_ = v35->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v36;
    v35->__r_.__value_.__l.__size_ = 0LL;
    v35->__r_.__value_.__l.__cap_ = 0LL;
    v35->__r_.__value_.__r.__words[0] = 0LL;
    v37 = std::string::append(&v62, ",\n");
    __int128 v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
    std::string::size_type cap = v37->__r_.__value_.__l.__cap_;
    __int128 v63 = v38;
    v37->__r_.__value_.__l.__size_ = 0LL;
    v37->__r_.__value_.__l.__cap_ = 0LL;
    v37->__r_.__value_.__r.__words[0] = 0LL;
    sub_100014D08((uint64_t)a2, &v63);
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v63);
    }
    std::to_string(&v61, *((unsigned __int8 *)this + 47));
    v39 = std::string::insert(&v61, 0LL, "\t mThreadStarted : ");
    __int128 v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
    v62.__r_.__value_.__l.__cap_ = v39->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v40;
    v39->__r_.__value_.__l.__size_ = 0LL;
    v39->__r_.__value_.__l.__cap_ = 0LL;
    v39->__r_.__value_.__r.__words[0] = 0LL;
    v41 = std::string::append(&v62, ",\n");
    __int128 v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
    std::string::size_type cap = v41->__r_.__value_.__l.__cap_;
    __int128 v63 = v42;
    v41->__r_.__value_.__l.__size_ = 0LL;
    v41->__r_.__value_.__l.__cap_ = 0LL;
    v41->__r_.__value_.__r.__words[0] = 0LL;
    sub_10000D650(a2, (const std::string::value_type *)&v63);
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v63);
    }
    std::to_string(&v61, *((unsigned __int8 *)this + 48));
    v43 = std::string::insert(&v61, 0LL, "\t mPSKcInitialized : ");
    __int128 v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
    v62.__r_.__value_.__l.__cap_ = v43->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v44;
    v43->__r_.__value_.__l.__size_ = 0LL;
    v43->__r_.__value_.__l.__cap_ = 0LL;
    v43->__r_.__value_.__r.__words[0] = 0LL;
    v45 = std::string::append(&v62, "\n");
    __int128 v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
    std::string::size_type cap = v45->__r_.__value_.__l.__cap_;
    __int128 v63 = v46;
    v45->__r_.__value_.__l.__size_ = 0LL;
    v45->__r_.__value_.__l.__cap_ = 0LL;
    v45->__r_.__value_.__r.__words[0] = 0LL;
    sub_10000D650(a2, (const std::string::value_type *)&v63);
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v63);
    }
  }

void sub_1001F6D1C(_Unwind_Exception *a1)
{
}

void *sub_1001F6F64(void *a1, void *a2, size_t a3, const void *a4, uint64_t a5)
{
  int v8 = sub_1001F6FC4(a1, a2, a3);
  sub_100018E5C(v8 + 3, a4, (uint64_t)a4 + a5);
  return a1;
}

void sub_1001F6FA8(_Unwind_Exception *exception_object)
{
}

void *sub_1001F6FC4(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000ACA8();
  }
  if (__len >= 0x17)
  {
    if ((__len | 7) == 0x17) {
      size_t v7 = 25LL;
    }
    else {
      size_t v7 = (__len | 7) + 1;
    }
    size_t v6 = operator new(v7);
    __dst[1] = __len;
    __dst[2] = v7 | 0x8000000000000000LL;
    void *__dst = v6;
  }

  else
  {
    *((_BYTE *)__dst + 23) = __len;
    size_t v6 = __dst;
    if (!__len) {
      goto LABEL_10;
    }
  }

  memmove(v6, __src, __len);
LABEL_10:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

char *sub_1001F7064(void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_10000CCF0();
  }
  uint64_t result = (char *)sub_1001F70F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * a2];
  return result;
}

std::string *sub_1001F70B8(uint64_t a1, std::string *a2, std::string *a3)
{
  uint64_t result = sub_1001F711C(a1 + 16, a2, a3, *(std::string **)(a1 + 8));
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_1001F70E8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *sub_1001F70F0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_10000F12C();
  }
  return operator new(48 * a2);
}

std::string *sub_1001F711C(uint64_t a1, std::string *__str, std::string *a3, std::string *this)
{
  unint64_t v4 = this;
  __int128 v11 = this;
  unint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (__str != a3)
  {
    size_t v6 = __str;
    int v7 = a1;
    do
    {
      sub_1001F71C4(v7, v4, v6);
      v6 += 2;
      unint64_t v4 = v12 + 2;
      v12 += 2;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  sub_1001F7218((uint64_t)v9);
  return v4;
}

void sub_1001F71B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_1001F71C4(int a1, std::string *this, std::string *__str)
{
  return sub_10000CBF8(this[1].__r_.__value_.__r.__words, (uint64_t)&__str[1]);
}

void sub_1001F71FC(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1001F7218(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_1001F724C((uint64_t *)a1);
  }
  return a1;
}

void sub_1001F724C(uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 48LL;
      sub_1001F729C(v5, v3);
    }

    while (v3 != v4);
  }

void sub_1001F729C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)(a2 + 24);
  sub_100006F6C(&v3);
}

void sub_1001F72E0(void ***a1)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    sub_1001F7350((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)(*a1)[2] - (_BYTE *)v3) >> 4) >= 0x555555555555556LL) {
      __break(0x550Cu);
    }
    else {
      operator delete(v3);
    }
  }

void sub_1001F7350(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; sub_1001F729C(a1 + 16, i))
    i -= 48LL;
  *(void *)(a1 + 8) = a2;
}

void *sub_1001F73A4(uint64_t a1, char *a2, char **a3)
{
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t result = sub_1001F74EC((int)a1 + 16, v4, a2, a3);
  *(void *)(a1 + 8) = v4 + 6;
  return result;
}

void sub_1001F73E0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1001F73E8(uint64_t *a1, char *a2, char **a3)
{
  uint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 == -1)
  {
    __break(0x5500u);
LABEL_10:
    sub_10000CCF0();
  }

  if (v5 > 0x555555555555555LL) {
    goto LABEL_10;
  }
  if (0x5555555555555556LL * ((a1[2] - *a1) >> 4) > v5) {
    unint64_t v5 = 0x5555555555555556LL * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v8 = 0x555555555555555LL;
  }
  else {
    unint64_t v8 = v5;
  }
  sub_1001F7574(v11, v8, v4, (uint64_t)(a1 + 2));
  sub_1001F74EC((_DWORD)a1 + 16, *(void **)v12, a2, a3);
  *(void *)v12 += 48LL;
  sub_1001F7500(a1, v11);
  uint64_t v9 = a1[1];
  sub_1001F77C8(v11);
  return v9;
}

void sub_1001F74D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_1001F74EC(int a1, void *a2, char *a3, char **a4)
{
  return sub_1001F5EB0(a2, a3, *a4);
}

uint64_t sub_1001F7500(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1001F75D4((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1001F7574(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[3] = 0LL;
  a1[4] = a4;
  if (a2) {
    uint64_t v7 = (char *)sub_1001F70F0(a4, a2);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = &v7[48 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[48 * a2];
  return a1;
}

uint64_t sub_1001F75D4( uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v16 = a6;
  *((void *)&v16 + 1) = a7;
  __int128 v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  char v14 = 0;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }

  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 3;
      sub_1001F7688(a1, v7 - 48, v9);
      uint64_t v7 = *((void *)&v16 + 1) - 48LL;
      *((void *)&v16 + 1) -= 48LL;
    }

    while (v9 != a5);
    uint64_t v11 = v16;
  }

  char v14 = 1;
  sub_1001F76C4((uint64_t)v13);
  return v11;
}

__n128 sub_1001F7688(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v3 = *a3;
  *(void *)(a2 + 16) = *((void *)a3 + 2);
  *(_OWORD *)a2 = v3;
  *((void *)a3 + 1) = 0LL;
  *((void *)a3 + 2) = 0LL;
  *(void *)a3 = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  __n128 result = *(__n128 *)((char *)a3 + 24);
  *(__n128 *)(a2 + 24) = result;
  *(void *)(a2 + 40) = *((void *)a3 + 5);
  *((void *)a3 + 3) = 0LL;
  *((void *)a3 + 4) = 0LL;
  *((void *)a3 + 5) = 0LL;
  return result;
}

uint64_t sub_1001F76C4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_1001F76F8((uint64_t *)a1);
  }
  return a1;
}

void sub_1001F76F8(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v10 = *(void *)a1[2];
  uint64_t v11 = v1;
  uint64_t v12 = v10;
  uint64_t v13 = v1;
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(a1[1] + 8);
  uint64_t v5 = *(void *)a1[1];
  uint64_t v6 = v3;
  uint64_t v7 = v5;
  uint64_t v8 = v3;
  sub_1001F776C(v2, (uint64_t)v9, (uint64_t)v4);
}

void sub_1001F776C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(void *)(a2 + 32); i != *(void *)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    sub_1001F729C(a1, i);
    uint64_t i = *(void *)(a2 + 32) + 48LL;
  }

void *sub_1001F77C8(void *a1)
{
  __n128 result = (void *)*a1;
  if (!*a1) {
    return a1;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[3] - (void)result) >> 4) < 0x555555555555556LL)
  {
    operator delete(result);
    return a1;
  }

  __break(0x550Cu);
  return result;
}

void sub_1001F782C(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(void *)(a1 + 16) = i - 48;
    sub_1001F729C(v5, i - 48);
  }

void *sub_1001F7874(uint64_t a1, char *__s, const void *a3, uint64_t *a4)
{
  uint64_t v5 = *(void **)(a1 + 8);
  __n128 result = sub_1001F79D0((int)a1 + 16, v5, __s, a3, a4);
  *(void *)(a1 + 8) = v5 + 6;
  return result;
}

void sub_1001F78B4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1001F78BC(uint64_t *a1, char *a2, const void *a3, uint64_t *a4)
{
  uint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 == -1)
  {
    __break(0x5500u);
LABEL_10:
    sub_10000CCF0();
  }

  if (v6 > 0x555555555555555LL) {
    goto LABEL_10;
  }
  if (0x5555555555555556LL * ((a1[2] - *a1) >> 4) > v6) {
    unint64_t v6 = 0x5555555555555556LL * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v10 = 0x555555555555555LL;
  }
  else {
    unint64_t v10 = v6;
  }
  sub_1001F7574(v13, v10, v5, (uint64_t)(a1 + 2));
  sub_1001F79D0((_DWORD)a1 + 16, *(void **)v14, a2, a3, a4);
  *(void *)v14 += 48LL;
  sub_1001F7500(a1, v13);
  uint64_t v11 = a1[1];
  sub_1001F77C8(v13);
  return v11;
}

void sub_1001F79BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_1001F79D0(int a1, void *a2, char *__s, const void *a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  size_t v9 = strlen(__s);
  return sub_1001F6F64(a2, __s, v9, a4, v8);
}

void *sub_1001F7A1C(uint64_t a1, char *a2, char *a3)
{
  uint64_t v4 = *(void **)(a1 + 8);
  __n128 result = sub_1001F5EB0(v4, a2, a3);
  *(void *)(a1 + 8) = v4 + 6;
  return result;
}

void sub_1001F7A4C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1001F7A54(uint64_t *a1, char *a2, char *a3)
{
  uint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 == -1)
  {
    __break(0x5500u);
LABEL_10:
    sub_10000CCF0();
  }

  if (v5 > 0x555555555555555LL) {
    goto LABEL_10;
  }
  if (0x5555555555555556LL * ((a1[2] - *a1) >> 4) > v5) {
    unint64_t v5 = 0x5555555555555556LL * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v8 = 0x555555555555555LL;
  }
  else {
    unint64_t v8 = v5;
  }
  sub_1001F7574(v11, v8, v4, (uint64_t)(a1 + 2));
  sub_1001F5EB0(*(void **)v12, a2, a3);
  *(void *)v12 += 48LL;
  sub_1001F7500(a1, v11);
  uint64_t v9 = a1[1];
  sub_1001F77C8(v11);
  return v9;
}

void sub_1001F7B3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_1001F7B50(uint64_t a1, char *__s, const void **a3, uint64_t *a4)
{
  unint64_t v5 = *(void **)(a1 + 8);
  __n128 result = sub_1001F7CAC((int)a1 + 16, v5, __s, a3, a4);
  *(void *)(a1 + 8) = v5 + 6;
  return result;
}

void sub_1001F7B90(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1001F7B98(uint64_t *a1, char *a2, const void **a3, uint64_t *a4)
{
  uint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 == -1)
  {
    __break(0x5500u);
LABEL_10:
    sub_10000CCF0();
  }

  if (v6 > 0x555555555555555LL) {
    goto LABEL_10;
  }
  if (0x5555555555555556LL * ((a1[2] - *a1) >> 4) > v6) {
    unint64_t v6 = 0x5555555555555556LL * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v10 = 0x555555555555555LL;
  }
  else {
    unint64_t v10 = v6;
  }
  sub_1001F7574(v13, v10, v5, (uint64_t)(a1 + 2));
  sub_1001F7CAC((_DWORD)a1 + 16, *(void **)v14, a2, a3, a4);
  *(void *)v14 += 48LL;
  sub_1001F7500(a1, v13);
  uint64_t v11 = a1[1];
  sub_1001F77C8(v13);
  return v11;
}

void sub_1001F7C98(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_1001F7CAC(int a1, void *a2, char *__s, const void **a4, uint64_t *a5)
{
  uint64_t v7 = *a4;
  uint64_t v8 = *a5;
  size_t v9 = strlen(__s);
  return sub_1001F6F64(a2, __s, v9, v7, v8);
}

void sub_1001F7CF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Sent to commissioner", v1, 2u);
}

void sub_1001F7D38()
{
  __assert_rtn("SendToCommissioner", "border_agent.cpp", 268, "aEvent == Ncp::kEventUdpForwardStream");
}

void sub_1001F7D60()
{
  __assert_rtn("HandleExtPanId", "border_agent.cpp", 589, "aEvent == Ncp::kEventExtPanId");
}

void sub_1001F7D88()
{
  __assert_rtn("HandleNetworkName", "border_agent.cpp", 581, "aEvent == Ncp::kEventNetworkName");
}

void sub_1001F7DB0()
{
  __assert_rtn("HandleThreadVersion", "border_agent.cpp", 597, "aEvent == Ncp::kEventThreadVersion");
}

void sub_1001F7DD8()
{
  __assert_rtn("HandleThreadState", "border_agent.cpp", 573, "aEvent == Ncp::kEventThreadState");
}

void sub_1001F7E00()
{
  __assert_rtn("HandlePSKc", "border_agent.cpp", 493, "aEvent == Ncp::kEventPSKc");
}

void sub_1001F7E28()
{
  __assert_rtn("HandleExtendedAddress", "border_agent.cpp", 607, "aEvent == Ncp::kEventExtendedAddress");
}

void sub_1001F7E50(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MDNS service not available!", v1, 2u);
}

uint64_t ot::BorderRouter::Mdns::PublisherMDnsSd::PublisherMDnsSd( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)__n128 result = off_1002B5F60;
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = 0LL;
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = a4;
  *(_DWORD *)(result + 48) = 0;
  *(void *)(result + 56) = a5;
  *(void *)(result + 64) = a6;
  return result;
}

{
  *(void *)__n128 result = off_1002B5F60;
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = 0LL;
  *(void *)(result + 32) = a3;
  *(void *)(result + 40) = a4;
  *(_DWORD *)(result + 48) = 0;
  *(void *)(result + 56) = a5;
  *(void *)(result + 64) = a6;
  return result;
}

void ot::BorderRouter::Mdns::PublisherMDnsSd::~PublisherMDnsSd(dispatch_source_t *this)
{
  *this = (dispatch_source_t)off_1002B5F60;
  ot::BorderRouter::Mdns::PublisherMDnsSd::Stop(this);
  uint64_t v2 = (void **)(this + 1);
  sub_1001F9E68(&v2);
}

{
  void *v1;
  ot::BorderRouter::Mdns::PublisherMDnsSd::~PublisherMDnsSd(this);
  operator delete(v1);
}

uint64_t ot::BorderRouter::Mdns::PublisherMDnsSd::Start(ot::BorderRouter::Mdns::PublisherMDnsSd *this)
{
  uint64_t v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "PublisherMDnsSd::Start Entry", v4, 2u);
  }

  *((_DWORD *)this + 12) = 1;
  (*((void (**)(void, uint64_t))this + 7))(*((void *)this + 8), 1LL);
  return 0LL;
}

BOOL ot::BorderRouter::Mdns::PublisherMDnsSd::IsStarted(ot::BorderRouter::Mdns::PublisherMDnsSd *this)
{
  return *((_DWORD *)this + 12) == 1;
}

void ot::BorderRouter::Mdns::PublisherMDnsSd::Stop(dispatch_source_t *this)
{
  if (*((_DWORD *)this + 12) == 1)
  {
    if (this[9])
    {
      uint64_t v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Clean up mDNSRetryRegisterTimer", buf, 2u);
      }

      dispatch_source_cancel(this[9]);
      this[9] = 0LL;
    }

    uint64_t v3 = this[1];
    if (v3 != this[2])
    {
      dispatch_source_t v4 = this[1];
      do
      {
        uint64_t v5 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          unint64_t v9 = (unint64_t)v3;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "MDNS remove service %s", buf, 0xCu);
        }

        DNSServiceRefDeallocate(*((DNSServiceRef *)v4 + 16));
        *((void *)v4 + 16) = 0LL;
        dispatch_source_t v4 = (dispatch_source_t)((char *)v4 + 136);
        uint64_t v3 = (dispatch_source_s *)((char *)v3 + 136);
      }

      while (v4 != this[2]);
    }

    this[2] = this[1];
    unint64_t v6 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v7 = 0xF0F0F0F0F0F0F0F1LL * ((this[2] - this[1]) >> 3);
      *(_DWORD *)buf = 134217984;
      unint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "mServices size PublisherMDnsSd::Stop %lu",  buf,  0xCu);
    }
  }

uint64_t ot::BorderRouter::Mdns::PublisherMDnsSd::UpdateFdSet( uint64_t this, fd_set *a2, fd_set *a3, fd_set *a4, int *a5, timeval *a6)
{
  uint64_t v6 = *(void *)(this + 8);
  if (v6 != *(void *)(this + 16))
  {
    uint64_t v9 = this;
    do
    {
      dnssd_sock_t v10 = DNSServiceRefSockFD(*(DNSServiceRef *)(v6 + 128));
      if (v10 == -1) {
        sub_1001FA5F0();
      }
      int v11 = v10;
      this = __darwin_check_fd_set_overflow(v10, a2, 0);
      if ((_DWORD)this) {
        *(__int32_t *)((char *)a2->fds_bits + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v11;
      }
      if (v11 > *a5) {
        *a5 = v11;
      }
      v6 += 136LL;
    }

    while (v6 != *(void *)(v9 + 16));
  }

  return this;
}

void ot::BorderRouter::Mdns::PublisherMDnsSd::Process( ot::BorderRouter::Mdns::PublisherMDnsSd *this, const fd_set *a2, const fd_set *a3, const fd_set *a4)
{
  __int128 v16 = 0LL;
  __int128 v17 = 0LL;
  unint64_t v18 = 0LL;
  uint64_t v4 = *((void *)this + 1);
  if (v4 != *((void *)this + 2))
  {
    unint64_t v7 = (DNSServiceRef *)(v4 + 128);
    do
    {
      dnssd_sock_t v8 = DNSServiceRefSockFD(*v7);
      if (__darwin_check_fd_set_overflow(v8, a2, 0)
        && ((*(unsigned int *)((char *)a2->fds_bits + (((unint64_t)v8 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v8) & 1) != 0)
      {
        uint64_t v9 = v17;
        if ((unint64_t)v17 >= v18)
        {
          uint64_t v10 = sub_1001F9EB0((uint64_t *)&v16, v7);
        }

        else
        {
          DNSServiceRef *v17 = *v7;
          uint64_t v10 = (uint64_t)(v9 + 1);
        }

        __int128 v17 = (DNSServiceRef *)v10;
      }

      int v11 = v7 + 1;
      v7 += 17;
    }

    while (v11 != *((DNSServiceRef **)this + 2));
  }

  for (uint64_t i = v16; i != v17; ++i)
  {
    DNSServiceErrorType v13 = DNSServiceProcessResult(*i);
    if (v13)
    {
      char v14 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int128 v15 = sub_1001F8448(v13);
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "DNSServiceProcessResult failed: %s",  buf,  0xCu);
      }
    }
  }

  *(void *)buf = &v16;
  sub_1000336E4((void ***)buf);
}

void sub_1001F8420( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, void **a15)
{
  a15 = (void **)&a12;
  sub_1000336E4(&a15);
  _Unwind_Resume(a1);
}

const char *sub_1001F8448(int a1)
{
  switch(a1)
  {
    case -65568:
      return "Timeout";
    case -65567:
      return "Polling Mode";
    case -65566:
      return "No Router";
    case -65565:
      return "NAT Port Mapping Disabled";
    case -65564:
      return "NAT Port Mapping Unsupported";
    case -65563:
      return "Service Not Running";
    case -65562:
      return "Transient";
    case -65561:
      return "Bad Key";
    case -65560:
      return "Bad Sig";
    case -65559:
      return "Bad Time";
    case -65558:
      return "Double NAT";
    case -65557:
      return "NAT Traversal";
    case -65556:
      return "No Such Key";
    case -65555:
      return "No Auth";
    case -65554:
      return "No Such Record";
    case -65553:
      return "Refused";
    case -65552:
      return "Bad Interface Index";
    case -65551:
      return "Incompatible";
    case -65550:
      return "Firewall";
    case -65549:
      return "Invalid";
    case -65548:
      return "Name Conflict";
    case -65547:
      return "Already Registered";
    case -65546:
      goto LABEL_35;
    case -65545:
      return "Not Initialized";
    case -65544:
      return "Unsupported";
    case -65543:
      return "Bad Flags";
    case -65542:
      return "Bad State";
    case -65541:
      return "Bad Reference";
    case -65540:
      return "Bad Param";
    case -65539:
      return "No Memory";
    case -65538:
      return "No Such Name";
    case -65537:
      return "Unknown";
    default:
      if (a1) {
LABEL_35:
      }
        sub_1001FA618();
      return "OK";
  }

void ot::BorderRouter::Mdns::PublisherMDnsSd::HandleServiceRegisterResult( ot::BorderRouter::Mdns::PublisherMDnsSd *this, _DNSServiceRef_t *a2, int a3, char *a4, const char *a5, const char *a6, ot::BorderRouter::Mdns::PublisherMDnsSd *a7, void *a8)
{
}

void ot::BorderRouter::Mdns::PublisherMDnsSd::HandleServiceRegisterResult( ot::BorderRouter::Mdns::PublisherMDnsSd *this, _DNSServiceRef_t *a2, int a3, int a4, const char *a5, const char *a6, const char *a7)
{
  char v14 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315650;
    v22 = a5;
    __int16 v23 = 2080;
    __int16 v24 = a6;
    __int16 v25 = 2080;
    std::string v26 = a7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Got a reply for service %s.%s%s",  (uint8_t *)&v21,  0x20u);
  }

  if (a4)
  {
    __int128 v15 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001FA640((uint64_t)a5, a4, v15);
    }
    ot::BorderRouter::Mdns::PublisherMDnsSd::DiscardService(this, a5, a6, a2);
    (*(void (**)(ot::BorderRouter::Mdns::PublisherMDnsSd *))(*(void *)this + 8LL))(this);
    (**(void (***)(ot::BorderRouter::Mdns::PublisherMDnsSd *))this)(this);
  }

  else
  {
    __int128 v16 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if ((a3 & 2) != 0)
    {
      if (!v17) {
        return;
      }
      int v21 = 136315138;
      v22 = a5;
      unint64_t v18 = "MDNS added service %s";
      __int128 v19 = v16;
      uint32_t v20 = 12;
    }

    else
    {
      if (!v17) {
        return;
      }
      int v21 = 136315906;
      v22 = a5;
      __int16 v23 = 2080;
      __int16 v24 = a6;
      __int16 v25 = 2080;
      std::string v26 = "OK";
      __int16 v27 = 1024;
      int v28 = a3;
      unint64_t v18 = "Name conflict detected service %s.%s, Error: %s, Flags: 0x%x";
      __int128 v19 = v16;
      uint32_t v20 = 38;
    }

    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, v20);
  }

void ot::BorderRouter::Mdns::PublisherMDnsSd::DiscardService( ot::BorderRouter::Mdns::PublisherMDnsSd *this, const char *a2, const char *a3, _DNSServiceRef_t *a4)
{
  dnssd_sock_t v8 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (a2 && a3 && a4)
  {
    if (v9)
    {
      unint64_t v10 = 0xF0F0F0F0F0F0F0F1LL * ((uint64_t)(*((void *)this + 2) - *((void *)this + 1)) >> 3);
      int v19 = 134217984;
      uint32_t v20 = (const char *)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "mServices size DiscardService before %lu",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v12 = *((void *)this + 1);
    uint64_t v11 = *((void *)this + 2);
    if (v12 != v11)
    {
      uint64_t v13 = 0LL;
      while (strncmp((const char *)(v12 + v13), a2, 0x40uLL) || strncmp((const char *)(v12 + v13 + 64), a3, 0x40uLL))
      {
        v13 += 136LL;
        if (v12 + v13 == v11) {
          goto LABEL_19;
        }
      }

      uint64_t v15 = v12 + v13;
      if (*(_DNSServiceRef_t **)(v12 + v13 + 128) != a4) {
        sub_1001FA704();
      }
      unint64_t v16 = 0xF0F0F0F0F0F0F0F1LL * ((v11 - (v15 + 136)) >> 3);
      if (v11 != v15 + 136)
      {
        if (!is_mul_ok(v16 - 1, 0x88uLL))
        {
          __break(0x550Cu);
          return;
        }

        memmove((void *)(v12 + v13), (const void *)(v15 + 136), 136 * (v16 - 1) + 136);
      }

      *((void *)this + 2) = v15 + 8 * ((v11 - (v15 + 136)) >> 3);
      DNSServiceRefDeallocate(a4);
      a4 = 0LL;
    }

void ot::BorderRouter::Mdns::PublisherMDnsSd::RecordService( ot::BorderRouter::Mdns::PublisherMDnsSd *this, char *a2, char *a3, _DNSServiceRef_t *a4)
{
  dnssd_sock_t v8 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = 0xF0F0F0F0F0F0F0F1LL * ((uint64_t)(*((void *)this + 2) - *((void *)this + 1)) >> 3);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "mServices size RecordService before push %lu",  buf,  0xCu);
  }

  uint64_t v10 = *((void *)this + 1);
  uint64_t v11 = *((void *)this + 2);
  if (v10 == v11)
  {
LABEL_8:
    strcpy_safe((char *)buf, 0x40uLL, a2);
    strcpy_safe((char *)v32, 0x40uLL, a3);
    __int16 v33 = a4;
    unint64_t v14 = *((void *)this + 2);
    if (v14 >= *((void *)this + 3))
    {
      uint64_t v21 = sub_1001FA0B0((uint64_t *)this + 1, (uint64_t)buf);
    }

    else
    {
      *(_OWORD *)unint64_t v14 = *(_OWORD *)buf;
      __int128 v15 = v29;
      __int128 v16 = v30;
      __int128 v17 = v32[0];
      *(_OWORD *)(v14 + 48) = v31;
      *(_OWORD *)(v14 + 64) = v17;
      *(_OWORD *)(v14 + 16) = v15;
      *(_OWORD *)(v14 + 32) = v16;
      __int128 v18 = v32[1];
      __int128 v19 = v32[2];
      __int128 v20 = v32[3];
      *(void *)(v14 + 128) = v33;
      *(_OWORD *)(v14 + 96) = v19;
      *(_OWORD *)(v14 + 112) = v20;
      *(_OWORD *)(v14 + 80) = v18;
      uint64_t v21 = v14 + 136;
    }

    *((void *)this + 2) = v21;
    int v22 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      unint64_t v23 = 0xF0F0F0F0F0F0F0F1LL * ((uint64_t)(*((void *)this + 2) - *((void *)this + 1)) >> 3);
      *(_DWORD *)std::string v26 = 134217984;
      unint64_t v27 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "mServices size RecordService after push %lu",  v26,  0xCu);
    }
  }

  else
  {
    uint64_t v12 = v10 + 64;
    while (strncmp((const char *)(v12 - 64), a2, 0x40uLL) || strncmp((const char *)v12, a3, 0x40uLL))
    {
      uint64_t v13 = v12 + 72;
      v12 += 136LL;
      if (v13 == v11) {
        goto LABEL_8;
      }
    }

    (*(void (**)(void **__return_ptr, ot::BorderRouter::Mdns::PublisherMDnsSd *))(*(void *)this + 32LL))( &__p,  this);
    if (v25 < 0) {
      operator delete(__p);
    }
    if (*(_DNSServiceRef_t **)(v12 + 64) != a4) {
      sub_1001FA72C();
    }
  }

uint64_t ot::BorderRouter::Mdns::PublisherMDnsSd::PublishService( dispatch_source_t *a1, unsigned int a2, char *a3, char *a4, uint64_t a5)
{
  uint64_t v35 = 0LL;
  DNSServiceRef sdRef = 0LL;
  rdata = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v9 = (*((uint64_t (**)(dispatch_source_t *, uint64_t, void **))*a1 + 9))(a1, a5, &rdata);
  if (!(_DWORD)v9)
  {
    dispatch_source_t v10 = a1[1];
    dispatch_source_t v11 = a1[2];
    if (v10 != v11)
    {
      uint64_t v12 = (char *)v10 + 64;
      while (strncmp(v12 - 64, a3, 0x40uLL) || strncmp(v12, a4, 0x40uLL))
      {
        uint64_t v13 = (dispatch_source_s *)(v12 + 72);
        v12 += 136;
        if (v13 == v11) {
          goto LABEL_7;
        }
      }

      unint64_t v27 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v40 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "PublisherMDnsSd::PublishService: MDNS update current service %s",  buf,  0xCu);
      }

      DNSServiceUpdateRecord(*((DNSServiceRef *)v12 + 8), 0LL, 0, v34 - (_WORD)rdata, rdata, 0);
      int v28 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        unint64_t v29 = 0xF0F0F0F0F0F0F0F1LL * ((a1[2] - a1[1]) >> 3);
        *(_DWORD *)buf = 134217984;
        __int128 v40 = (const char *)v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "PublisherMDnsSd::PublishService: mServices size PublishService after service update %lu",  buf,  0xCu);
      }

      goto LABEL_32;
    }

void sub_1001F9294( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void **a23)
{
  a23 = (void **)&a18;
  sub_100006F6C(&a23);
  _Unwind_Resume(a1);
}

uint64_t sub_1001F92EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "virtual otbrError ot::BorderRouter::Mdns::PublisherMDnsSd::PublishService(uint16_t, const char *, const char *,"
         " const TxtList &)_block_invoke";
    __int16 v6 = 1024;
    int v7 = 489;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s:%d: Retrying PublishService - DNSServiceRegister function",  (uint8_t *)&v4,  0x12u);
  }

  (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  return (**(uint64_t (***)(uint64_t))v1)(v1);
}

void ot::BorderRouter::Mdns::PublisherMDnsSd::dumpState( ot::BorderRouter::Mdns::PublisherMDnsSd *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  sub_1000765F0((uint64_t)&__p, 0x15uLL);
  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  strcpy((char *)p_p, "\t\t mServices count : ");
  std::to_string(&v60, 0xF0F0F0F0F0F0F0F1LL * ((uint64_t)(*((void *)this + 2) - *((void *)this + 1)) >> 3));
  uint64_t v5 = sub_10000D650(&__p, (const std::string::value_type *)&v60);
  __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v5->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0LL;
  v5->__r_.__value_.__l.__cap_ = 0LL;
  v5->__r_.__value_.__r.__words[0] = 0LL;
  int v7 = std::string::append(&v62, ",\n");
  __int128 v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  int64_t cap = v7->__r_.__value_.__l.__cap_;
  __int128 v63 = v8;
  v7->__r_.__value_.__l.__size_ = 0LL;
  v7->__r_.__value_.__l.__cap_ = 0LL;
  v7->__r_.__value_.__r.__words[0] = 0LL;
  sub_100014D08(a2, &v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  else {
    size_t v9 = *(void *)(a2 + 8);
  }
  if (v9 >= 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_132;
  }
  sub_1000765F0((uint64_t)&v63, v9 + 17);
  if (cap >= 0) {
    dispatch_source_t v10 = &v63;
  }
  else {
    dispatch_source_t v10 = (__int128 *)v63;
  }
  if (v9)
  {
    else {
      dispatch_source_t v11 = *(const void **)a2;
    }
    memmove(v10, v11, v9);
  }

  strcpy((char *)v10 + v9, "\t\t mServices : {\n");
  sub_100014D08(a2, &v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  uint64_t v12 = (const std::string::value_type *)*((void *)this + 1);
  if (v12 != *((const std::string::value_type **)this + 2))
  {
    do
    {
      size_t v13 = *(char *)(a2 + 23) >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
      if (v13 >= 0xFFFFFFFFFFFFFFF6LL) {
        goto LABEL_132;
      }
      unint64_t v14 = this;
      sub_1000765F0((uint64_t)&v57, v13 + 10);
      if ((v57.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        DNSServiceErrorType v15 = &v57;
      }
      else {
        DNSServiceErrorType v15 = (std::string *)v57.__r_.__value_.__r.__words[0];
      }
      if (v13)
      {
        else {
          __int128 v16 = *(const void **)a2;
        }
        memmove(v15, v16, v13);
      }

      strcpy((char *)v15 + v13, "\t\t\t Name :");
      __int128 v17 = std::string::append(&v57, v12);
      __int128 v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      v58.__r_.__value_.__l.__cap_ = v17->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v58.__r_.__value_.__l.__data_ = v18;
      v17->__r_.__value_.__l.__size_ = 0LL;
      v17->__r_.__value_.__l.__cap_ = 0LL;
      v17->__r_.__value_.__r.__words[0] = 0LL;
      dispatch_source_t v19 = std::string::append(&v58, ", Type :");
      this = v14;
      __int128 v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
      v59.__r_.__value_.__l.__cap_ = v19->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v59.__r_.__value_.__l.__data_ = v20;
      v19->__r_.__value_.__l.__size_ = 0LL;
      v19->__r_.__value_.__l.__cap_ = 0LL;
      v19->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v21 = v12 + 64;
      int v22 = std::string::append(&v59, v21);
      __int128 v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
      v60.__r_.__value_.__l.__cap_ = v22->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v60.__r_.__value_.__l.__data_ = v23;
      v22->__r_.__value_.__l.__size_ = 0LL;
      v22->__r_.__value_.__l.__cap_ = 0LL;
      v22->__r_.__value_.__r.__words[0] = 0LL;
      __int16 v24 = std::string::append(&v60, ", Service :");
      __int128 v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__l.__cap_ = v24->__r_.__value_.__l.__cap_;
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0LL;
      v24->__r_.__value_.__l.__cap_ = 0LL;
      v24->__r_.__value_.__r.__words[0] = 0LL;
      if (*((void *)v21 + 8)) {
        std::string v26 = "Yes";
      }
      else {
        std::string v26 = "NULL";
      }
      unint64_t v27 = std::string::append(&__p, v26);
      __int128 v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
      v62.__r_.__value_.__l.__cap_ = v27->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v28;
      v27->__r_.__value_.__l.__size_ = 0LL;
      v27->__r_.__value_.__l.__cap_ = 0LL;
      v27->__r_.__value_.__r.__words[0] = 0LL;
      unint64_t v29 = std::string::append(&v62, "\n");
      __int128 v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
      int64_t cap = v29->__r_.__value_.__l.__cap_;
      __int128 v63 = v30;
      v29->__r_.__value_.__l.__size_ = 0LL;
      v29->__r_.__value_.__l.__cap_ = 0LL;
      v29->__r_.__value_.__r.__words[0] = 0LL;
      sub_100014D08(a2, &v63);
      if (SHIBYTE(cap) < 0) {
        operator delete((void *)v63);
      }
      uint64_t v12 = v21 + 72;
    }

    while (v12 != *((const std::string::value_type **)v14 + 2));
  }

  size_t v31 = *(char *)(a2 + 23) >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
  if (v31 >= 0xFFFFFFFFFFFFFFFBLL) {
    goto LABEL_132;
  }
  sub_1000765F0((uint64_t)&v63, v31 + 5);
  if (cap >= 0) {
    v32 = &v63;
  }
  else {
    v32 = (__int128 *)v63;
  }
  if (v31)
  {
    else {
      __int16 v33 = *(const void **)a2;
    }
    memmove(v32, v33, v31);
  }

  strcpy((char *)v32 + v31, "\t\t }\n");
  sub_100014D08(a2, &v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  size_t v34 = *(char *)(a2 + 23) >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
  if (v34 >= 0xFFFFFFFFFFFFFFF5LL) {
    goto LABEL_132;
  }
  sub_1000765F0((uint64_t)&__p, v34 + 11);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v35 = &__p;
  }
  else {
    uint64_t v35 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (v34)
  {
    else {
      __int128 v36 = *(const void **)a2;
    }
    memmove(v35, v36, v34);
  }

  strcpy((char *)v35 + v34, "\t\t mHost : ");
  if (*((void *)this + 4)) {
    v37 = (const std::string::value_type *)*((void *)this + 4);
  }
  else {
    v37 = "NULL";
  }
  __int128 v38 = std::string::append(&__p, v37);
  __int128 v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v38->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v39;
  v38->__r_.__value_.__l.__size_ = 0LL;
  v38->__r_.__value_.__l.__cap_ = 0LL;
  v38->__r_.__value_.__r.__words[0] = 0LL;
  __int128 v40 = std::string::append(&v62, ",\n");
  __int128 v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  int64_t cap = v40->__r_.__value_.__l.__cap_;
  __int128 v63 = v41;
  v40->__r_.__value_.__l.__size_ = 0LL;
  v40->__r_.__value_.__l.__cap_ = 0LL;
  v40->__r_.__value_.__r.__words[0] = 0LL;
  sub_100014D08(a2, &v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  size_t v42 = *(char *)(a2 + 23) >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
  if (v42 >= 0xFFFFFFFFFFFFFFF3LL) {
    goto LABEL_132;
  }
  __int16 v43 = &__p;
  sub_1000765F0((uint64_t)&__p, v42 + 13);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    __int16 v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (v42)
  {
    else {
      int v44 = *(const void **)a2;
    }
    memmove(v43, v44, v42);
  }

  strcpy((char *)v43 + v42, "\t\t mDomain : ");
  if (*((void *)this + 5)) {
    v45 = (const std::string::value_type *)*((void *)this + 5);
  }
  else {
    v45 = "NULL";
  }
  __int128 v46 = std::string::append(&__p, v45);
  __int128 v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v46->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v47;
  v46->__r_.__value_.__l.__size_ = 0LL;
  v46->__r_.__value_.__l.__cap_ = 0LL;
  v46->__r_.__value_.__r.__words[0] = 0LL;
  std::string v48 = std::string::append(&v62, ",\n");
  __int128 v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
  int64_t cap = v48->__r_.__value_.__l.__cap_;
  __int128 v63 = v49;
  v48->__r_.__value_.__l.__size_ = 0LL;
  v48->__r_.__value_.__l.__cap_ = 0LL;
  v48->__r_.__value_.__r.__words[0] = 0LL;
  sub_100014D08(a2, &v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
  size_t v50 = *(char *)(a2 + 23) >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
  if (v50 >= 0xFFFFFFFFFFFFFFF4LL)
  {
LABEL_132:
    __break(0x5500u);
    return;
  }

  sub_1000765F0((uint64_t)&__p, v50 + 12);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string v51 = &__p;
  }
  else {
    std::string v51 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (v50)
  {
    else {
      std::string v52 = *(const void **)a2;
    }
    memmove(v51, v52, v50);
  }

  strcpy((char *)v51 + v50, "\t\t mState : ");
  std::to_string(&v60, *((_DWORD *)this + 12));
  std::string v53 = sub_10000D650(&__p, (const std::string::value_type *)&v60);
  __int128 v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__l.__cap_ = v53->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v54;
  v53->__r_.__value_.__l.__size_ = 0LL;
  v53->__r_.__value_.__l.__cap_ = 0LL;
  v53->__r_.__value_.__r.__words[0] = 0LL;
  std::string v55 = std::string::append(&v62, ",\n");
  __int128 v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
  int64_t cap = v55->__r_.__value_.__l.__cap_;
  __int128 v63 = v56;
  v55->__r_.__value_.__l.__size_ = 0LL;
  v55->__r_.__value_.__l.__cap_ = 0LL;
  v55->__r_.__value_.__r.__words[0] = 0LL;
  sub_100014D08(a2, &v63);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v63);
  }
}

void sub_1001F9BB4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35, uint64_t a36, void *a37, uint64_t a38, int a39, __int16 a40, char a41, char a42, uint64_t a43, void *__p, uint64_t a45, int a46, __int16 a47, char a48, char a49)
{
  if (a49 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  _Unwind_Resume(exception_object);
}

void ot::BorderRouter::Mdns::PublisherMDnsSd::EncodeTxtData(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    while (1)
    {
      uint64_t v6 = *(char *)(v3 + 23) < 0 ? *(void *)(v3 + 8) : *(unsigned __int8 *)(v3 + 23);
      BOOL v7 = __CFADD__(v6, 1LL);
      uint64_t v8 = v6 + 1;
      if (v7) {
        break;
      }
      uint64_t v9 = *(void *)(v3 + 32) - *(void *)(v3 + 24);
      BOOL v7 = __CFADD__(v8, v9);
      unint64_t v10 = v8 + v9;
      if (v7) {
        break;
      }
      if (v10 <= 0xFF)
      {
        char v18 = v10;
        dispatch_source_t v11 = (_BYTE *)a3[1];
        if ((unint64_t)v11 >= a3[2])
        {
          uint64_t v12 = (char *)sub_10007781C(a3, &v18);
        }

        else
        {
          *dispatch_source_t v11 = v10;
          uint64_t v12 = v11 + 1;
        }

        a3[1] = (uint64_t)v12;
        if (*(char *)(v3 + 23) < 0)
        {
          unint64_t v14 = *(char **)v3;
          uint64_t v13 = *(void *)(v3 + 8);
        }

        else
        {
          uint64_t v13 = *(unsigned __int8 *)(v3 + 23);
          unint64_t v14 = (char *)v3;
        }

        sub_1001FA3A0((char *)a3, v12, v14, &v14[v13], v13);
        char v17 = 61;
        DNSServiceErrorType v15 = (_BYTE *)a3[1];
        if ((unint64_t)v15 >= a3[2])
        {
          __int128 v16 = (char *)sub_10007781C(a3, &v17);
        }

        else
        {
          *DNSServiceErrorType v15 = 61;
          __int128 v16 = v15 + 1;
        }

        a3[1] = (uint64_t)v16;
        sub_1000352A0( (char *)a3,  v16,  *(char **)(v3 + 24),  *(char **)(v3 + 32),  *(void *)(v3 + 32) - *(void *)(v3 + 24));
        v3 += 48LL;
        if (v3 != v4) {
          continue;
        }
      }

      return;
    }

    __break(0x5500u);
  }

void *ot::BorderRouter::Mdns::Publisher::Create( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __n128 result = operator new(0x50uLL);
  *__n128 result = off_1002B5F60;
  result[1] = 0LL;
  result[2] = 0LL;
  result[3] = 0LL;
  result[4] = a2;
  result[5] = a3;
  *((_DWORD *)result + 12) = 0;
  result[7] = a4;
  result[8] = a5;
  return result;
}

uint64_t ot::BorderRouter::Mdns::Publisher::Destroy(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 64LL))(result);
  }
  return result;
}

void sub_1001F9E68(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    v1[1] = v2;
    if (0xF0F0F0F0F0F0F0F1LL * (((_BYTE *)v1[2] - (_BYTE *)v2) >> 3) >= 0x1E1E1E1E1E1E1E2LL) {
      __break(0x550Cu);
    }
    else {
      operator delete(v2);
    }
  }

uint64_t sub_1001F9EB0(uint64_t *a1, void *a2)
{
  uint64_t v2 = (a1[1] - *a1) >> 3;
  unint64_t v3 = v2 + 1;
  if (v2 == -1)
  {
    __break(0x5500u);
LABEL_10:
    sub_10000CCF0();
  }

  if (v3 >> 61) {
    goto LABEL_10;
  }
  unint64_t v6 = a1[2] - *a1;
  if (v6 >> 2 > v3) {
    unint64_t v3 = v6 >> 2;
  }
  if (v6 >= 0x7FFFFFFFFFFFFFF8LL) {
    unint64_t v7 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = v3;
  }
  sub_1001F9FD0(v10, v7, v2, (uint64_t)(a1 + 2));
  *v11++ = *a2;
  sub_1001F9F78(a1, v10);
  uint64_t v8 = a1[1];
  sub_1001FA048(v10);
  return v8;
}

void sub_1001F9F64(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t *sub_1001F9F78(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  while (v3 != v2)
  {
    uint64_t v5 = *(void *)(v3 - 8);
    v3 -= 8LL;
    *(void *)(v4 - 8) = v5;
    v4 -= 8LL;
  }

  a2[1] = v4;
  uint64_t v6 = *result;
  *__n128 result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1001F9FD0(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[3] = 0LL;
  a1[4] = a4;
  if (a2) {
    uint64_t v7 = (char *)sub_1001FA02C(a4, a2);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = &v7[8 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[8 * a2];
  return a1;
}

void *sub_1001FA02C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_10000F12C();
  }
  return operator new(8 * a2);
}

void *sub_1001FA048(void *a1)
{
  __n128 result = (void *)*a1;
  if (!*a1) {
    return a1;
  }
  if ((uint64_t)(a1[3] - (void)result) >= 0)
  {
    operator delete(result);
    return a1;
  }

  __break(0x550Cu);
  return result;
}

uint64_t sub_1001FA08C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 != a2) {
    *(void *)(result + 16) = v2 + ((a2 - v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  }
  return result;
}

uint64_t sub_1001FA0B0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = 0xF0F0F0F0F0F0F0F1LL * ((a1[1] - *a1) >> 3);
  unint64_t v3 = v2 + 1;
  if (v2 == -1)
  {
    __break(0x5500u);
LABEL_10:
    sub_10000CCF0();
  }

  if (v3 > 0x1E1E1E1E1E1E1E1LL) {
    goto LABEL_10;
  }
  if (0xE1E1E1E1E1E1E1E2LL * ((a1[2] - *a1) >> 3) > v3) {
    unint64_t v3 = 0xE1E1E1E1E1E1E1E2LL * ((a1[2] - *a1) >> 3);
  }
  if (0xF0F0F0F0F0F0F0F1LL * ((a1[2] - *a1) >> 3) >= 0xF0F0F0F0F0F0F0LL) {
    unint64_t v6 = 0x1E1E1E1E1E1E1E1LL;
  }
  else {
    unint64_t v6 = v3;
  }
  sub_1001FA274(v16, v6, v2, (uint64_t)(a1 + 2));
  uint64_t v7 = v17;
  _OWORD *v17 = *(_OWORD *)a2;
  __int128 v8 = *(_OWORD *)(a2 + 64);
  __int128 v10 = *(_OWORD *)(a2 + 16);
  __int128 v9 = *(_OWORD *)(a2 + 32);
  v7[3] = *(_OWORD *)(a2 + 48);
  v7[4] = v8;
  v7[1] = v10;
  v7[2] = v9;
  __int128 v12 = *(_OWORD *)(a2 + 96);
  __int128 v11 = *(_OWORD *)(a2 + 112);
  __int128 v13 = *(_OWORD *)(a2 + 80);
  *((void *)v7 + 16) = *(void *)(a2 + 128);
  v7[6] = v12;
  v7[7] = v11;
  v7[5] = v13;
  char v17 = (_OWORD *)((char *)v7 + 136);
  sub_1001FA1C0(a1, v16);
  uint64_t v14 = a1[1];
  sub_1001FA300(v16);
  return v14;
}

void sub_1001FA1AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t *sub_1001FA1C0(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 == *result)
  {
    uint64_t v11 = a2[1];
  }

  else
  {
    do
    {
      *(_OWORD *)(v4 - 136) = *(_OWORD *)(v3 - 136);
      __int128 v5 = *(_OWORD *)(v3 - 120);
      __int128 v6 = *(_OWORD *)(v3 - 104);
      __int128 v7 = *(_OWORD *)(v3 - 88);
      *(_OWORD *)(v4 - 72) = *(_OWORD *)(v3 - 72);
      *(_OWORD *)(v4 - 88) = v7;
      *(_OWORD *)(v4 - 104) = v6;
      *(_OWORD *)(v4 - 120) = v5;
      __int128 v8 = *(_OWORD *)(v3 - 56);
      __int128 v9 = *(_OWORD *)(v3 - 40);
      __int128 v10 = *(_OWORD *)(v3 - 24);
      uint64_t v11 = v4 - 136;
      *(void *)(v4 - 8) = *(void *)(v3 - 8);
      *(_OWORD *)(v4 - 24) = v10;
      *(_OWORD *)(v4 - 40) = v9;
      *(_OWORD *)(v4 - 56) = v8;
      v4 -= 136LL;
      v3 -= 136LL;
    }

    while (v3 != v2);
  }

  a2[1] = v11;
  uint64_t v12 = *result;
  *__n128 result = v11;
  a2[1] = v12;
  uint64_t v13 = result[1];
  result[1] = a2[2];
  a2[2] = v13;
  uint64_t v14 = result[2];
  result[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

void *sub_1001FA274(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[3] = 0LL;
  a1[4] = a4;
  if (a2) {
    __int128 v7 = (char *)sub_1001FA2D4(a4, a2);
  }
  else {
    __int128 v7 = 0LL;
  }
  __int128 v8 = &v7[136 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[136 * a2];
  return a1;
}

void *sub_1001FA2D4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1E1E1E1E1E1E1E2LL) {
    sub_10000F12C();
  }
  return operator new(136 * a2);
}

void *sub_1001FA300(void *a1)
{
  __n128 result = (void *)*a1;
  if (!*a1) {
    return a1;
  }
  if (0xF0F0F0F0F0F0F0F1LL * ((uint64_t)(a1[3] - (void)result) >> 3) < 0x1E1E1E1E1E1E1E2LL)
  {
    operator delete(result);
    return a1;
  }

  __break(0x550Cu);
  return result;
}

uint64_t sub_1001FA364(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 != a2) {
    *(void *)(result + 16) = (v2 - a2 - 136) % 0x88uLL + a2;
  }
  return result;
}

char *sub_1001FA3A0(char *result, char *a2, char *a3, char *a4, uint64_t a5)
{
  __int128 v5 = a2;
  if (a5 < 1) {
    return v5;
  }
  __int128 v8 = (void **)result;
  uint64_t v9 = *((void *)result + 2);
  unint64_t v10 = *((void *)result + 1);
  if ((uint64_t)(v9 - v10) < a5)
  {
    uint64_t v11 = *(_BYTE **)result;
    unint64_t v12 = v10 - *(void *)result;
    BOOL v13 = __CFADD__(v12, a5);
    unint64_t v14 = v12 + a5;
    if (v13)
    {
      __break(0x5500u);
    }

    else if ((v14 & 0x8000000000000000LL) == 0)
    {
      uint64_t v15 = a2 - v11;
      unint64_t v16 = v9 - (void)v11;
      if (2 * v16 > v14) {
        unint64_t v14 = 2 * v16;
      }
      if (v16 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v17 = v14;
      }
      sub_100035540(v20, v17, v15, (uint64_t)(result + 16));
      sub_100035454((uint64_t)v20, a3, a5);
      __int128 v5 = (char *)sub_10003547C(v8, (uint64_t)v20, v5);
      sub_100035598((uint64_t)v20);
      return v5;
    }

    sub_10000CCF0();
  }

  uint64_t v18 = v10 - (void)a2;
  if ((uint64_t)(v10 - (void)a2) >= a5)
  {
    dispatch_source_t v19 = &a3[a5];
    goto LABEL_16;
  }

  if (!__OFSUB__(a5, v18))
  {
    dispatch_source_t v19 = &a3[v18];
    sub_1001FA504((uint64_t)result, &a3[v18], a4);
    if (v18 < 1) {
      return v5;
    }
LABEL_16:
    sub_100035414(v8, v5, v10, &v5[a5]);
    if (v19 != a3) {
      memmove(v5, a3, v19 - a3);
    }
    return v5;
  }

  __break(0x5515u);
  return result;
}

void sub_1001FA4F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

_BYTE *sub_1001FA504(uint64_t a1, char *a2, char *a3)
{
  __n128 result = sub_1001FA53C(a1 + 16, a2, a3, *(_BYTE **)(a1 + 8));
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_1001FA534(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_BYTE *sub_1001FA53C(uint64_t a1, char *a2, char *a3, _BYTE *a4)
{
  uint64_t v4 = a4;
  unint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  while (a2 != a3)
  {
    char v5 = *a2++;
    _BYTE *v4 = v5;
    uint64_t v4 = ++v10;
  }

  char v8 = 1;
  sub_1001FA5AC((uint64_t)v7);
  return v4;
}

uint64_t sub_1001FA5AC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    nullsub_2(a1);
  }
  return a1;
}

void sub_1001FA5E0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

void sub_1001FA5F0()
{
  __assert_rtn("UpdateFdSet", "mdns_mdnssd.cpp", 241, "fd != -1");
}

void sub_1001FA618()
{
}

void sub_1001FA640(uint64_t a1, int a2, os_log_s *a3)
{
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  __int128 v7 = sub_1001F8448(a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to register service %s: %s",  (uint8_t *)&v4,  0x16u);
}

void sub_1001FA6DC()
{
  __assert_rtn("DiscardService", "mdns_mdnssd.cpp", 345, "aServiceRef == NULL");
}

void sub_1001FA704()
{
  __assert_rtn("DiscardService", "mdns_mdnssd.cpp", 336, "aServiceRef == it->mService");
}

void sub_1001FA72C()
{
  __assert_rtn("RecordService", "mdns_mdnssd.cpp", 356, "aServiceRef == it->mService");
}

void sub_1001FA754(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001FA5E0((void *)&_mh_execute_header, a2, a3, "Failed to publish service for mdnssd error: %s!", (uint8_t *)a2);
}

void sub_1001FA78C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001FA5E0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to register service for mdnssd error: %s!, ",  (uint8_t *)a2);
}

void sub_1001FA7C4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001FA5E0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to register service for mdnssd error: %s!, scheduling retry block",  (uint8_t *)a2);
}

void *ot::BorderRouter::EventEmitter::On( uint64_t **this, int a2, void (*a3)(void *, int, char *), void *a4)
{
  int v9 = a2;
  if (!a3) {
    sub_1001FAD04();
  }
  __int16 v6 = sub_1001FA844(this, &v9);
  *(void *)&__int128 v8 = a3;
  *((void *)&v8 + 1) = a4;
  return sub_10007EE24(v6, &v8);
}

uint64_t *sub_1001FA844(uint64_t **a1, _DWORD *a2)
{
  uint64_t v3 = a2;
  return sub_1001FA9E8(a1, a2, (uint64_t)&unk_10022C19A, &v3) + 5;
}

uint64_t ot::BorderRouter::EventEmitter::Off( uint64_t **this, int a2, void (*a3)(void *, int, char *), void *a4)
{
  int v10 = a2;
  if (!a3) {
    sub_1001FAD2C();
  }
  uint64_t result = sub_1001FABDC((uint64_t)this, &v10);
  if (result)
  {
    uint64_t result = (uint64_t)sub_1001FA844(this, &v10);
    uint64_t v8 = *(void *)(result + 8);
    if (v8 != result)
    {
      uint64_t v9 = result;
      while (*(void (**)(void *, int, char *))(v8 + 16) != a3 || *(void **)(v8 + 24) != a4)
      {
        uint64_t v8 = *(void *)(v8 + 8);
        if (v8 == result) {
          return result;
        }
      }

      uint64_t result = sub_1001FA924(result, (uint64_t *)v8);
      if (!*(void *)(v9 + 16)) {
        return sub_1001FAC14((uint64_t)this, &v10);
      }
    }
  }

  return result;
}

uint64_t sub_1001FA924(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  *(void *)(v2 + 8) = v3;
  *(void *)a2[1] = v2;
  uint64_t v4 = *(void *)(result + 16);
  BOOL v5 = v4 != 0;
  uint64_t v6 = v4 - 1;
  if (v5)
  {
    *(void *)(result + 16) = v6;
    sub_100071518(result, a2);
    return v3;
  }

  else
  {
    __break(0x5515u);
  }

  return result;
}

uint64_t ot::BorderRouter::EventEmitter::Emit(uint64_t **this, unsigned int a2, uint64_t a3, ...)
{
  unsigned int v7 = a2;
  uint64_t result = sub_1001FABDC((uint64_t)this, (int *)&v7);
  if (result)
  {
    uint64_t result = (uint64_t)sub_1001FA844(this, &v7);
    if (!*(void *)(result + 16)) {
      sub_1001FAD54();
    }
    uint64_t v5 = result;
    for (uint64_t i = *(void *)(result + 8); i != v5; uint64_t i = *(void *)(i + 8))
      uint64_t result = (*(uint64_t (**)(void, void))(i + 16))(*(void *)(i + 24), v7);
  }

  return result;
}

uint64_t *sub_1001FA9E8(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unsigned int v7 = (uint64_t **)sub_1001FAA90((uint64_t)a1, &v12, a2);
  uint64_t v8 = *v7;
  if (!*v7)
  {
    uint64_t v9 = v7;
    sub_1001FAAE0((uint64_t)a1, a3, a4, (uint64_t)v11);
    sub_10000AF70(a1, v12, v9, v11[0]);
    uint64_t v8 = v11[0];
    v11[0] = 0LL;
    sub_1001FAB80(v11, 0LL);
  }

  return v8;
}

void *sub_1001FAA90(uint64_t a1, void *a2, int *a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t result = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (v5)
  {
    int v6 = *a3;
    do
    {
      while (1)
      {
        unsigned int v7 = (void *)v4;
        int v8 = *(_DWORD *)(v4 + 32);
        if (v6 >= v8) {
          break;
        }
        uint64_t v4 = *v7;
        uint64_t result = v7;
        if (!*v7) {
          goto LABEL_10;
        }
      }

      if (v8 >= v6) {
        break;
      }
      uint64_t result = v7 + 1;
      uint64_t v4 = v7[1];
    }

    while (v4);
  }

  else
  {
    unsigned int v7 = result;
  }

void sub_1001FAAE0(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 8;
  int v8 = operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  sub_1001FAB64(v7, (uint64_t)v8 + 32, a2, a3);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1001FAB4C(_Unwind_Exception *a1)
{
}

void sub_1001FAB64(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD **a4)
{
  *(_DWORD *)a2 = **a4;
  *(void *)(a2 + 8) = a2 + 8;
  *(void *)(a2 + 16) = a2 + 8;
  *(void *)(a2 + 24) = 0LL;
}

void sub_1001FAB80(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3) {
    sub_1001FAB9C((uint64_t)(a1 + 1), v3);
  }
}

void sub_1001FAB9C(uint64_t a1, uint64_t *__p)
{
  if (*(_BYTE *)(a1 + 8)) {
    sub_1001F4944(__p + 5);
  }
  if (__p) {
    operator delete(__p);
  }
}

uint64_t sub_1001FABDC(uint64_t a1, int *a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  if (v2)
  {
    int v3 = *a2;
    uint64_t result = 1LL;
    do
    {
      int v5 = *((_DWORD *)v2 + 8);
      if (v3 >= v5)
      {
        if (v5 >= v3) {
          return result;
        }
        ++v2;
      }

      uint64_t v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  return 0LL;
}

uint64_t sub_1001FAC14(uint64_t a1, int *a2)
{
  int v3 = (uint64_t *)sub_1001FAC58(a1, a2);
  sub_1001FACA0(a1, v3);
  return 1LL;
}

uint64_t sub_1001FAC58(uint64_t a1, int *a2)
{
  uint64_t v3 = a1 + 8;
  uint64_t result = sub_1001FACD8(a1, a2, *(void *)(a1 + 8), a1 + 8);
  if (v3 == result || *a2 < *(_DWORD *)(result + 32)) {
    return v3;
  }
  return result;
}

uint64_t sub_1001FACA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100011598(a1, a2);
  sub_1001F4944(a2 + 5);
  operator delete(a2);
  return v3;
}

uint64_t sub_1001FACD8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = a4;
  if (a3)
  {
    int v5 = *a2;
    do
    {
      int v6 = *(_DWORD *)(a3 + 32);
      BOOL v7 = v6 < v5;
      if (v6 >= v5) {
        int v8 = (uint64_t *)a3;
      }
      else {
        int v8 = (uint64_t *)(a3 + 8);
      }
      if (!v7) {
        uint64_t result = a3;
      }
      a3 = *v8;
    }

    while (*v8);
  }

  return result;
}

void sub_1001FAD04()
{
}

void sub_1001FAD2C()
{
}

void sub_1001FAD54()
{
}

uint64_t otbrLogEnableSyslog(uint64_t result)
{
  byte_1002C964C = result;
  return result;
}

FILE *otbrLogSetFilename(const char *__filename)
{
  if (qword_1002D1A60)
  {
    fclose((FILE *)qword_1002D1A60);
    qword_1002D1A60 = 0LL;
  }

  uint64_t result = fopen(__filename, "w");
  qword_1002D1A60 = (uint64_t)result;
  if (!result) {
    sub_1001FB2D4(__filename);
  }
  return result;
}

uint64_t otbrLogGetLevel(void)
{
  return dword_1002C9650;
}

uint64_t otbrLogSetLevel(uint64_t result)
{
  dword_1002C9650 = result;
  return result;
}

uint64_t otbrLogInit(const char *a1, unsigned int a2)
{
  if (!a1) {
    sub_1001FB33C();
  }
  if (a2 >= 8) {
    sub_1001FB364();
  }
  uint64_t result = gettimeofday(&v8, 0LL);
  __darwin_time_t v5 = 1000 * v8.tv_sec;
  if ((unsigned __int128)(v8.tv_sec * (__int128)1000LL) >> 64 != (1000 * v8.tv_sec) >> 63)
  {
    __break(0x550Cu);
    goto LABEL_11;
  }

  BOOL v6 = __OFADD__(v5, v8.tv_usec / 1000);
  uint64_t v7 = v5 + v8.tv_usec / 1000;
  if (v6)
  {
LABEL_11:
    __break(0x5500u);
    return result;
  }

  qword_1002D1A68 = v7;
  if ((byte_1002D1A70 & 1) == 0)
  {
    byte_1002D1A70 = 1;
    uint64_t result = nullsub_2(a1);
  }

  dword_1002C9650 = a2;
  return result;
}

void otbrLogv(unsigned int a1, const char *a2, char *a3)
{
  if (!a2) {
    sub_1001FB38C();
  }
  unsigned int v5 = sub_1001FAFA4(a1);
  char v6 = v5;
  if (v5 >= 2)
  {
    if (qword_1002D1A60)
    {
      vsnprintf(__str, 0x400uLL, a2, a3);
      sub_1001FAFFC(__str);
    }

    sub_1001FAFFC("\n");
  }

  if ((v6 & 1) != 0) {
    vsyslog(a1, a2, a3);
  }
}

uint64_t sub_1001FAFA4(unsigned int a1)
{
  if (a1 >= 8) {
    sub_1001FB3B4();
  }
  unsigned int v1 = byte_1002D1A70;
  if (!byte_1002C964C) {
    unsigned int v1 = 0;
  }
  if (qword_1002D1A60) {
    return v1 | 2;
  }
  else {
    return v1;
  }
}

_BYTE *sub_1001FAFFC(_BYTE *result)
{
  char v1 = *result;
  if (!*result) {
    return result;
  }
  uint64_t v2 = result + 1;
  while (1)
  {
    if ((byte_1002D1A71 & 1) != 0) {
      goto LABEL_9;
    }
    byte_1002D1A71 = 1;
    uint64_t result = (_BYTE *)gettimeofday(&v9, 0LL);
    __darwin_time_t v3 = 1000 * v9.tv_sec;
    BOOL v4 = __OFADD__(v3, v9.tv_usec / 1000);
    unint64_t v5 = v3 + v9.tv_usec / 1000;
    if (v4) {
      goto LABEL_15;
    }
    BOOL v6 = v5 >= qword_1002D1A68;
    unint64_t v7 = v5 - qword_1002D1A68;
    if (!v6) {
      goto LABEL_16;
    }
    fprintf((FILE *)qword_1002D1A60, "%4lu.%03lu | ", v7 / 0x3E8, v7 % 0x3E8);
LABEL_9:
    if (v1 == 10)
    {
      byte_1002D1A71 = 0;
      fputc(10, (FILE *)qword_1002D1A60);
      uint64_t result = (_BYTE *)fflush((FILE *)qword_1002D1A60);
    }

    else
    {
      uint64_t result = (_BYTE *)fputc(v1, (FILE *)qword_1002D1A60);
    }

    int v8 = *v2++;
    char v1 = v8;
    if (!v8) {
      return result;
    }
  }

  __break(0x550Cu);
LABEL_15:
  __break(0x5500u);
LABEL_16:
  __break(0x5515u);
  return result;
}

uint64_t otbrDump(unsigned int a1, const char *a2, const void *a3, uint64_t a4)
{
  if (!a2 || !a3 && a4) {
    sub_1001FB3DC();
  }
  uint64_t result = sub_1001FAFA4(a1);
  if (a4)
  {
    if ((_DWORD)result) {
      __break(0x5512u);
    }
  }

  return result;
}

char *otbrErrorString(int a1)
{
  int v1 = a1 + 4;
  uint64_t result = "OK";
  switch(v1)
  {
    case 0:
      uint64_t result = "MDNS error";
      break;
    case 1:
      uint64_t result = "DBUS error";
      break;
    case 2:
      uint64_t result = "DTLS error";
      break;
    case 3:
      __darwin_time_t v3 = __error();
      uint64_t result = strerror(*v3);
      break;
    case 4:
      return result;
    default:
      sub_1001FB404();
  }

  return result;
}

void otbrLogResult(uint64_t a1, int a2)
{
  BOOL v4 = (os_log_s *)sub_1000160F4("com.apple.wpantund.commissioning", "commissioning");
  unint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1001FB42C(a1, a2, v5);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = a1;
    __int16 v8 = 2080;
    timeval v9 = otbrErrorString(0);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: %s", (uint8_t *)&v6, 0x16u);
  }

void otbrLogDeinit(void)
{
  byte_1002D1A70 = 0;
  closelog();
}

void sub_1001FB2D4(const char *a1)
{
}

void sub_1001FB314()
{
  __assert_rtn("otbrLogSetLevel", "logging.cpp", 87, "aLevel >= LOG_EMERG && aLevel <= LOG_DEBUG");
}

void sub_1001FB33C()
{
}

void sub_1001FB364()
{
  __assert_rtn("otbrLogInit", "logging.cpp", 181, "aLevel >= LOG_EMERG && aLevel <= LOG_DEBUG");
}

void sub_1001FB38C()
{
}

void sub_1001FB3B4()
{
  __assert_rtn("LogCheck", "logging.cpp", 96, "aLevel >= LOG_EMERG && aLevel <= LOG_DEBUG");
}

void sub_1001FB3DC()
{
  __assert_rtn("otbrDump", "logging.cpp", 235, "aPrefix && (aMemory || aSize == 0)");
}

void sub_1001FB404()
{
}

void sub_1001FB42C(uint64_t a1, int a2, os_log_s *a3)
{
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = otbrErrorString(a2);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
}

uint64_t strcpy_safe(char *a1, size_t a2, char *__s1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (__s1 && strnlen(__s1, a2) < a2)
  {
    strncpy(a1, __s1, a2);
    return 0LL;
  }

  else
  {
    *a1 = 0;
    return 0xFFFFFFFFLL;
  }

void sub_1001FB53C()
{
}

void sub_1001FB5BC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Wake failed: %d", (uint8_t *)v2, 8u);
}

void sub_1001FB630()
{
}

void sub_1001FB6A0()
{
}

void sub_1001FB718()
{
}

void sub_1001FB788()
{
}

void sub_1001FB7F8()
{
}

void sub_1001FB868()
{
}

void sub_1001FB8E0()
{
}

void sub_1001FB958(const char *a1, const char *a2, os_log_s *a3)
{
  v5[0] = 67109376;
  v5[1] = strcmp(a1, "com.nestlabs.WPANTunnelDriver");
  __int16 v6 = 1024;
  int v7 = strcmp(a2, "/com/nestlabs/WPANTunnelDriver");
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "WPANTUND:XPCServer - Not a Valid Interface/Path, int_check = %d, path_check = %d",  (uint8_t *)v5,  0xEu);
}

void sub_1001FBA14(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Message is not a Dictionary", v1, 2u);
}

void sub_1001FBA54(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "xpc_message_handler";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: This functionality is disabled...",  (uint8_t *)&v1,  0xCu);
  sub_100008188();
}

void sub_1001FBAD0(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "WPANTUND XPCServer->MH: Error - Not a valid method that is handled %s from %s",  (uint8_t *)&v3,  0x16u);
  sub_100008188();
}

void sub_1001FBB64(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "Enable";
  sub_100012A20( (void *)&_mh_execute_header,  a1,  a3,  "MulticastRoutingManager: %s backbone routing already enabled.Return here",  (uint8_t *)&v3);
  sub_100008188();
}

void sub_1001FBBD8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "Disable";
  sub_100012A20( (void *)&_mh_execute_header,  a1,  a3,  "MulticastRoutingManager: %s backbone routing already disabled.Return here",  (uint8_t *)&v3);
  sub_100008188();
}

void sub_1001FBC4C(void *a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100012A40(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_1000129F4();
}

void sub_1001FBCD8(void *a1, os_log_s *a2)
{
  int v16 = 136315138;
  uint64_t v17 = v3;
  sub_100012A20( (void *)&_mh_execute_header,  a2,  v4,  "MulticastRoutingManager:Failed to subscribe large scope multicast %s on backbone interface",  (uint8_t *)&v16);
  if (v15 < 0) {
    sub_100012A40(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  }
  sub_1000129F4();
}

void sub_1001FBD64(void *a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100012A40(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_1000129F4();
}

void sub_1001FBDF0(void *a1, uint64_t a2)
{
  if (v22 < 0) {
    sub_100012A40(v8, v9, v10, v11, v12, v13, v14, v15, v17, v19);
  }
  sub_1000129F4();
}

void sub_1001FBE7C(void *a1, os_log_s *a2)
{
  int v16 = 136315138;
  uint64_t v17 = v3;
  sub_100012A20( (void *)&_mh_execute_header,  a2,  v4,  "MulticastRoutingManager:Failed to unsubscribe large scope multicast %s on backbone interface",  (uint8_t *)&v16);
  if (v15 < 0) {
    sub_100012A40(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  }
  sub_1000129F4();
}

void sub_1001FBF08( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008168( (void *)&_mh_execute_header,  a2,  a3,  "%s MulticastRoutingManager is not enabled. Return here for packet len=%zu",  a5,  a6,  a7,  a8,  2u);
  sub_100008188();
}

void sub_1001FBF80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012A48( (void *)&_mh_execute_header,  a1,  a3,  "MulticastRoutingManager: =====================================================",  a5,  a6,  a7,  a8,  0);
  sub_100012A58();
}

void sub_1001FBFB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012A48( (void *)&_mh_execute_header,  a1,  a3,  "MulticastRoutingManager: ==================== MFC ENTRIES ====================",  a5,  a6,  a7,  a8,  0);
  sub_100012A58();
}

void sub_1001FBFE0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "MulticastRoutingManager::BackboneRouterMulticastListnerEvent changed %d Failed to get address",  (uint8_t *)v2,  8u);
  sub_100012A58();
}

void sub_1001FC050()
{
  __assert_rtn("lock", "lwm_pthreads.hpp", 60, "pthread_mutex_lock(&m_) == 0");
}

void sub_1001FC078()
{
  __assert_rtn("unlock", "lwm_pthreads.hpp", 70, "pthread_mutex_unlock(&m_) == 0");
}

void sub_1001FC0A0()
{
}

void sub_1001FC0C8()
{
}

void sub_1001FC0F0()
{
}

void sub_1001FC118()
{
  __assert_rtn("dec_slot_refcount", "connection.hpp", 124, "m_slot_refcount != 0");
}

void sub_1001FC140()
{
}

void sub_1001FC168()
{
  __assert_rtn("reserve", "auto_buffer.hpp", 793, "members_.capacity_ >= N");
}

void sub_1001FC190()
{
  __assert_rtn("reserve", "auto_buffer.hpp", 799, "members_.capacity_ >= n");
}

void sub_1001FC1B8()
{
  __assert_rtn("reserve_impl", "auto_buffer.hpp", 316, "size_ <= members_.capacity_");
}

void sub_1001FC1E0()
{
}

void sub_1001FC208()
{
  __assert_rtn("reset", "shared_ptr.hpp", 734, "p == 0 || p != px");
}

void sub_1001FC230()
{
}

void sub_1001FC258()
{
}

void sub_1001FC280()
{
}

void sub_1001FC2A8()
{
  __assert_rtn("erase", "slot_groups.hpp", 148, "it != _list.end()");
}

void sub_1001FC2D0()
{
  __assert_rtn("erase", "slot_groups.hpp", 150, "map_it != _group_map.end()");
}

void sub_1001FC2F8()
{
}

void sub_1001FC320(uint8_t *a1, int *a2, os_log_s *a3)
{
  int v6 = *__error();
  *(_DWORD *)a1 = 67109120;
  *a2 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "BackboneIPv6Interface bpf_new errno=%d",  a1,  8u);
}

void sub_1001FC388()
{
}

void sub_1001FC3B4(int a1, int *a2, os_log_s *a3)
{
  int v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = v3;
  sub_10001570C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "BackboneIPv6Interface get_read failed as len(%d) < mReadBufferLen(%d)",  (uint8_t *)v4);
  sub_100008188();
}

void sub_1001FC430()
{
  sub_100015624( (void *)&_mh_execute_header,  v0,  v1,  "BackboneIPv6Interface get_read mReadBuffer is NULL while mReadBufferLen=%d",  v2);
  sub_100012A58();
}

void sub_1001FC494()
{
}

void sub_1001FC4C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015614( (void *)&_mh_execute_header,  a2,  a3,  "BackboneIPv6Interface get_read copied len=(%d) to output buffer",  a5,  a6,  a7,  a8,  0);
  sub_100012A58();
}

void sub_1001FC524()
{
}

void sub_1001FC550()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 4);
  int v2 = *(unsigned __int8 *)(v0 + 5);
  LODWORD(v0) = *(unsigned __int16 *)(v0 + 12);
  v14[0] = 67112192;
  v14[1] = v3;
  __int16 v15 = 1024;
  int v16 = v4;
  __int16 v17 = 1024;
  int v18 = v5;
  __int16 v19 = 1024;
  int v20 = v6;
  __int16 v21 = 1024;
  int v22 = v7;
  __int16 v23 = 1024;
  int v24 = v8;
  __int16 v25 = 1024;
  int v26 = v9;
  __int16 v27 = 1024;
  int v28 = v10;
  __int16 v29 = 1024;
  int v30 = v11;
  __int16 v31 = 1024;
  int v32 = v12;
  __int16 v33 = 1024;
  int v34 = v1;
  __int16 v35 = 1024;
  int v36 = v2;
  __int16 v37 = 1024;
  int v38 = v0;
  sub_1000156F8( (void *)&_mh_execute_header,  v13,  v1,  "BackboneIPv6Interface: get_read ethernet hdr %02x:%02x:%02x:%02x:%02x:%02x -> %02x:%02x:%02x:%02x:%02x:%02x [type=%u]\n",  (uint8_t *)v14);
  sub_100015704();
}

void sub_1001FC628()
{
}

void sub_1001FC654(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  else {
    uint64_t v3 = (uint64_t *)*a1;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  sub_100012A20( (void *)&_mh_execute_header,  a2,  a3,  "BackboneIPv6Interface: check_valid_read do not forward as it is not larger than realm scope IP dst:%s",  (uint8_t *)&v4);
  sub_100008188();
}

void sub_1001FC6CC()
{
  int v1 = *(unsigned __int8 *)(v0 + 4);
  LODWORD(v0) = *(unsigned __int8 *)(v0 + 5);
  LODWORD(v2) = *v2;
  v14[0] = 67112192;
  v14[1] = v3;
  __int16 v15 = 1024;
  int v16 = v4;
  __int16 v17 = 1024;
  int v18 = v5;
  __int16 v19 = 1024;
  int v20 = v6;
  __int16 v21 = 1024;
  int v22 = v7;
  __int16 v23 = 1024;
  int v24 = v8;
  __int16 v25 = 1024;
  int v26 = v9;
  __int16 v27 = 1024;
  int v28 = v10;
  __int16 v29 = 1024;
  int v30 = v11;
  __int16 v31 = 1024;
  int v32 = v12;
  __int16 v33 = 1024;
  int v34 = v1;
  __int16 v35 = 1024;
  int v36 = v0;
  __int16 v37 = 1024;
  int v38 = (int)v2;
  sub_1000156F8( (void *)&_mh_execute_header,  v13,  (uint64_t)v13,  "BackboneIPv6Interface: check_valid_read ethernet hdr %02x:%02x:%02x:%02x:%02x:%02x -> %02x:%02x:%02x:%02x:%02x:%02x [type=%u]\n",  (uint8_t *)v14);
  sub_100015704();
}

void sub_1001FC7A8()
{
}

void sub_1001FC7D4()
{
  sub_100012A48( (void *)&_mh_execute_header,  v0,  v1,  "BackboneInterface can_read return here as backbone interface name is not initialized yet",  v2,  v3,  v4,  v5,  v6);
  sub_100012A58();
}

void sub_1001FC800()
{
  sub_100012A48( (void *)&_mh_execute_header,  v0,  v1,  "BackboneInterface can_read return here as backbone interface is not connected yet",  v2,  v3,  v4,  v5,  v6);
  sub_100012A58();
}

void sub_1001FC82C()
{
  sub_100015614( (void *)&_mh_execute_header,  v0,  v1,  "BackboneInterface can_read return here as blen(%d) < 0",  v2,  v3,  v4,  v5,  v6);
  sub_100012A58();
}

void sub_1001FC88C()
{
  sub_100015614( (void *)&_mh_execute_header,  v0,  v1,  "BackbineInterface can_read return here as mReadBufferLen(%d) already",  v2,  v3,  v4,  v5,  v6);
  sub_100012A58();
}

void sub_1001FC8F0()
{
}

void sub_1001FC950()
{
}

void sub_1001FC9B0()
{
}

void sub_1001FCA14()
{
}

void sub_1001FCA40(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100015624( (void *)&_mh_execute_header,  a2,  a3,  "BackboneIPv6Interface is not connected, cannot send_packet len:%d",  (uint8_t *)v3);
  sub_100012A58();
}

void sub_1001FCAA8()
{
  sub_10001569C( (void *)&_mh_execute_header,  v0,  v1,  "BackboneInterface drop the packet as Hop limit in the ipv6 header=%d len=%d",  v2,  v3);
  sub_100008188();
}

void sub_1001FCB0C()
{
  sub_100012A48( (void *)&_mh_execute_header,  v0,  v1,  "BackboneInterface send_packet failed as mBackboneInterfaceNdrvFd = -1",  v2,  v3,  v4,  v5,  v6);
  sub_100012A58();
}

void sub_1001FCB38()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "BackboneInterface send_packet sent packet sendSize=%zu len=%zu",  v2,  0x16u);
  sub_100008188();
}

void sub_1001FCBB4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint8_t v6 = __error();
  sub_100015630(v6);
  sub_1000156E0();
  __int16 v8 = 2048;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  __int16 v12 = 2048;
  uint64_t v13 = 2048LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "BackboneInterface send_packet return here as sendto failed %s sendSize=%zu len=%zu sizeof(buf)=%zu",  v7,  0x2Au);
  sub_100015704();
}

void sub_1001FCC64()
{
  sub_10001569C( (void *)&_mh_execute_header,  v0,  v1,  "BackboneInterface send_packet Hop limit in the ipv6 header=%d len=%d",  v2,  v3);
  sub_100008188();
}

void sub_1001FCCC8()
{
}

void sub_1001FCCF4(os_log_s *a1)
{
  uint64_t v2 = sub_100015668();
  sub_100015630(v2);
  sub_1000156E0();
  sub_100012A20((void *)&_mh_execute_header, a1, v3, "BackboneIPv6Interface ndrv socket() failed %s", v4);
  sub_1000155F0();
}

void sub_1001FCD68(os_log_s *a1)
{
  uint64_t v2 = sub_100015668();
  sub_100015630(v2);
  sub_1000156E0();
  sub_100012A20((void *)&_mh_execute_header, a1, v3, "BackboneIPv6Interface ndrv  bind() failed %s", v4);
  sub_1000155F0();
}

void sub_1001FCDDC()
{
}

void sub_1001FCE08()
{
}

void sub_1001FCE34()
{
}

void sub_1001FCE60(os_log_s *a1)
{
}

void sub_1001FCEDC(int *a1, os_log_s *a2)
{
  int v3 = *a1;
  int v4 = *__error();
  v6[0] = 67109376;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  sub_10001570C( (void *)&_mh_execute_header,  a2,  v5,  "BackboneIPv6Interface no bpf devices mBackboneInterfaceBpfFd(%d) errno(%d)",  (uint8_t *)v6);
  sub_1000155F0();
}

void sub_1001FCF68()
{
}

void sub_1001FCF94()
{
  uint64_t v1 = sub_100015668();
  sub_100015630(v1);
  sub_1000155FC();
  sub_1000155C8( (void *)&_mh_execute_header,  v0,  v2,  "BackboneIPv6Interface:bpf_set_options BIOCSETIF failed interface=%s err:%s",  v3);
  sub_1000155F0();
}

void sub_1001FD008()
{
  uint64_t v1 = sub_100015668();
  sub_100015630(v1);
  sub_1000155FC();
  sub_1000155C8( (void *)&_mh_execute_header,  v0,  v2,  "BackboneIPv6Interface:bpf_set_options BIOCSHDRCMPLT failed interface=%s err:%s",  v3);
  sub_1000155F0();
}

void sub_1001FD07C()
{
  uint64_t v1 = sub_100015668();
  sub_100015630(v1);
  sub_1000155FC();
  sub_1000155C8( (void *)&_mh_execute_header,  v0,  v2,  "BackboneIPv6Interface:bpf_set_options BIOCSSEESENT failed interface=%s err:%s",  v3);
  sub_1000155F0();
}

void sub_1001FD0F0()
{
  uint64_t v1 = sub_100015668();
  sub_100015630(v1);
  sub_1000155FC();
  sub_1000155C8( (void *)&_mh_execute_header,  v0,  v2,  "BackboneIPv6Interface:bpf_set_options BIOCIMMEDIATE failed interface=%s err:%s",  v3);
  sub_1000155F0();
}

void sub_1001FD164()
{
  uint64_t v1 = sub_100015668();
  sub_100015630(v1);
  sub_1000155FC();
  sub_1000155C8( (void *)&_mh_execute_header,  v0,  v2,  "BackboneIPv6Interface:bpf_set_options BIOCSRTIMEOUT failed interface=%s err:%s",  v3);
  sub_1000155F0();
}

void sub_1001FD1D8()
{
  sub_100012A20( (void *)&_mh_execute_header,  v0,  v1,  "BackboneIPv6Interface:bpf_set_options Non-Blocking failed interface=%s",  v2);
  sub_100008188();
}

void sub_1001FD23C()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1000156B0();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "BackboneIPv6Interface:set_nonblocking F_GETFL failed fd=%d err:%s",  v3,  v4,  v5,  v6,  v7);
  sub_1000155F0();
}

void sub_1001FD2AC()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1000156B0();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "BackboneIPv6Interface:set_nonblocking O_NONBLOCK failed fd=%d err:%s",  v3,  v4,  v5,  v6,  v7);
  sub_1000155F0();
}

void sub_1001FD31C()
{
}

void sub_1001FD348(os_log_s *a1)
{
}

void sub_1001FD3C4()
{
}

void sub_1001FD3F0()
{
}

void sub_1001FD41C()
{
}

void sub_1001FD448()
{
}

void sub_1001FD4AC()
{
}

void sub_1001FD4D8()
{
}

void sub_1001FD504( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001FD578( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000169DC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "%s: Input is null, return",  a5,  a6,  a7,  a8,  2u);
  sub_100008188();
}

void sub_1001FD5EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000169DC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "%s: Input is null, return default logObj",  a5,  a6,  a7,  a8,  2u);
  sub_100008188();
}

void sub_1001FD660( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000169DC( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "%s: Input memory is corrupt, return default logObj",  a5,  a6,  a7,  a8,  2u);
  sub_100008188();
}

void sub_1001FD6D4(uint64_t a1, uint64_t a2)
{
  int v2 = 136315394;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Logging Module is not defined for SubSystem: %s, Category: %s, using default logObj",  (uint8_t *)&v2,  0x16u);
  sub_100008188();
}

void sub_1001FD758(uint64_t a1)
{
}

void sub_1001FD778()
{
}

void sub_1001FD7A4(void *a1, uint64_t *a2, os_log_s *a3)
{
  int v3 = *a1 - *a2;
  if (*a2 == *a1) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = *a2;
  }
  v5[0] = 67109378;
  v5[1] = v3;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  sub_10003390C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "ERROR received_network_diagnostics_response got empty data in response length=%d data=%s",  (uint8_t *)v5);
  sub_100008188();
}

void sub_1001FD830()
{
}

void sub_1001FD8A8()
{
}

void sub_1001FD914()
{
}

void sub_1001FD980(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "WPANTUND_v1 Handling %s method handler failed duplicating FD \n",  (uint8_t *)&v2,  0xCu);
  sub_100008188();
}

void sub_1001FD9F0()
{
}

void sub_1001FDA68()
{
}

void sub_1001FDAE0()
{
}

void sub_1001FDB58()
{
}

void sub_1001FDBC4()
{
}

void sub_1001FDC30(uint64_t *a1, int a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  sub_10003390C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "sec_debug XPCIPCAPI_v1::interface_prop_remove_handler data_len(%zu) != length(%d)",  (uint8_t *)&v4);
  sub_100008188();
}

void sub_1001FDCAC()
{
}

void sub_1001FDCD8()
{
}

void sub_1001FDD04()
{
}

void sub_1001FDD7C()
{
}

void sub_1001FDDF4()
{
}

void sub_1001FDE6C()
{
}

void sub_1001FDEE4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "interface_config_gateway_handler: preferred_lifetime = %d",  (uint8_t *)v2,  8u);
  sub_100012A58();
}

void sub_1001FDF54()
{
}

void sub_1001FDFCC()
{
}

void sub_1001FE044()
{
}

void sub_1001FE0BC()
{
}

void sub_1001FE134()
{
}

void sub_1001FE1AC()
{
}

void sub_1001FE224()
{
}

void sub_1001FE29C()
{
}

void sub_1001FE314()
{
}

void sub_1001FE38C()
{
}

void sub_1001FE3B8(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 16;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "WPANTUND_v1 Error dest_addr_len=%d does not match sizeof(dest)=%d\n",  (uint8_t *)v3,  0xEu);
  sub_100008188();
}

void sub_1001FE43C()
{
}

void sub_1001FE4B4()
{
}

void sub_1001FE52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003396C("reset", "shared_ptr.hpp", a3, "p == 0 || p != px");
}

void sub_1001FE550(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1001FE574(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1001FE598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100033954("erase", "slot_groups.hpp", a3, "it != _list.end()");
}

void sub_1001FE5BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003394C("erase", "slot_groups.hpp", a3, "map_it != _group_map.end()");
}

void sub_1001FE5E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1001FE604()
{
}

void sub_1001FE67C()
{
}

void sub_1001FE6F4()
{
}

void sub_1001FE76C()
{
}

void sub_1001FE7E4()
{
}

void sub_1001FE85C()
{
}

void sub_1001FE8D4()
{
}

void sub_1001FE94C()
{
}

void sub_1001FE9C4(uint64_t a1, unsigned int a2, os_log_s *a3)
{
  if (*(_BYTE *)(a1 + 136)) {
    uint64_t v4 = "Starting";
  }
  else {
    uint64_t v4 = "Stopping";
  }
  int v5 = 136315650;
  uint8_t v6 = v4;
  __int16 v7 = 1024;
  unsigned int v8 = a2;
  __int16 v9 = 2080;
  __int16 v10 = sub_1001020A8(a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s Joiner Commissioning failed: %d (%s)",  (uint8_t *)&v5,  0x1Cu);
}

void sub_1001FEA94()
{
}

void sub_1001FEB0C()
{
}

void sub_1001FEB84()
{
}

void sub_1001FEBFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Starting Joiner Commissioning failed. Missing PSKd",  v1,  2u);
}

void sub_1001FEC3C()
{
}

void sub_1001FECB4()
{
}

void sub_1001FED2C()
{
}

void sub_1001FEDA4(int a1, os_log_s *a2)
{
  v2[0] = 67109376;
  v2[1] = 188;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/ncp-spinel/SpinelNCPTaskJoinerCommissioning.cpp:% d: Check Failed (error %d)",  (uint8_t *)v2,  0xEu);
  sub_100008188();
}

void sub_1001FEE24(unsigned int a1, os_log_s *a2)
{
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2080;
  uint64_t v5 = sub_1001020A8(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Joiner Attach failed: %d (%s)",  (uint8_t *)v3,  0x12u);
}

void sub_1001FEEC0()
{
}

void sub_1001FEF38()
{
}

void sub_1001FEFB0()
{
}

void sub_1001FF028()
{
}

void sub_1001FF0A8()
{
}

void sub_1001FF120()
{
}

void sub_1001FF198()
{
}

void sub_1001FF210()
{
}

void sub_1001FF288()
{
}

void sub_1001FF300()
{
}

void sub_1001FF378()
{
}

void sub_1001FF3F0()
{
}

void sub_1001FF41C()
{
}

void sub_1001FF494()
{
}

void sub_1001FF4C0()
{
}

void sub_1001FF538()
{
}

void sub_1001FF5B0()
{
}

void sub_1001FF628()
{
}

void sub_1001FF6A0()
{
}

void sub_1001FF718()
{
}

void sub_1001FF790()
{
}

void sub_1001FF808()
{
}

void sub_1001FF880()
{
}

void sub_1001FF8F8()
{
}

void sub_1001FF970()
{
}

void sub_1001FF9E8()
{
}

void sub_1001FFA60()
{
}

void sub_1001FFAD8()
{
}

void sub_1001FFB50()
{
}

void sub_1001FFBC8()
{
}

void sub_1001FFC40()
{
}

void sub_1001FFCB8()
{
}

void sub_1001FFD30()
{
}

void sub_1001FFDA8()
{
}

void sub_1001FFE20()
{
}

void sub_1001FFE98()
{
}

void sub_1001FFF10()
{
}

void sub_1001FFF88()
{
}

void sub_100200000()
{
}

void sub_100200078()
{
}

void sub_1002000F0()
{
}

void sub_100200168()
{
}

void sub_1002001E0()
{
  sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Was waiting for a reset, but we never got one. FailureCount = %d/%d",  v2,  v3);
  sub_100008188();
}

void sub_100200240()
{
  v1[0] = 136315650;
  sub_100043890();
  sub_1000438AC( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: Changing NCP state to FAULT, FailureCount = %d/%d",  (uint8_t *)v1);
  sub_100008188();
}

void sub_1002002BC()
{
  LODWORD(sub_100015624((void *)&_mh_execute_header, v0, v1, "BackboneIPv6Interface tmp->h_length [%d] is invalid \n", v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "vprocess_init";
  sub_1000438E0();
  sub_1000438CC( (void *)&_mh_execute_header,  v0,  v1,  "%s: %d NCP FailureCount = %d/%d",  (const char *)v2,  (unint64_t)"vprocess_init" >> 32,  v3,  v4);
}

void sub_10020033C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002003A0()
{
  v1[0] = 136315650;
  sub_100043890();
  sub_1000438AC( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s: The NCP is misbehaving: Repeatedly unable to initialize NCP. Entering fault state. FailureCount = %d/%d",  (uint8_t *)v1);
  sub_100008188();
}

void sub_10020041C()
{
}

void sub_100200494()
{
}

void sub_10020050C()
{
}

void sub_100200584()
{
}

void sub_1002005FC()
{
}

void sub_100200674()
{
}

void sub_1002006EC()
{
}

void sub_100200764()
{
}

void sub_1002007DC()
{
}

void sub_100200854()
{
}

void sub_1002008CC()
{
}

void sub_100200944()
{
}

void sub_1002009BC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100200A24()
{
}

void sub_100200A50()
{
}

void sub_100200AC8()
{
}

void sub_100200B40()
{
}

void sub_100200BB8()
{
}

void sub_100200C30()
{
}

void sub_100200CA8()
{
}

void sub_100200D20()
{
}

void sub_100200D98()
{
}

void sub_100200E10()
{
}

void sub_100200E88()
{
}

void sub_100200F00()
{
}

void sub_100200F78()
{
}

void sub_100200FF0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100201054()
{
}

void sub_1002010CC()
{
}

void sub_100201144()
{
}

void sub_1002011BC()
{
}

void sub_100201234()
{
}

void sub_100201260(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  else {
    uint64_t v3 = (uint64_t *)*a1;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  sub_100012A20((void *)&_mh_execute_header, a2, a3, "vendor:assigned:hw:mac := %s", (uint8_t *)&v4);
  sub_100008188();
}

void sub_1002012D8()
{
}

void sub_100201304()
{
}

void sub_100201330()
{
}

void sub_10020135C()
{
}

void sub_1002013D4()
{
}

void sub_10020144C()
{
}

void sub_1002014C4()
{
}

void sub_10020153C()
{
}

void sub_1002015B4()
{
}

void sub_10020162C(uint64_t a1, os_log_s *a2)
{
  unsigned int v3 = sub_1000D8DE8(a1);
  sub_100043918(v3, v4);
  sub_1000129E0();
  int v18 = 136315138;
  uint64_t v19 = v5;
  sub_100012A20( (void *)&_mh_execute_header,  a2,  v6,  "NCP state is %s, read the Active DataSet as Daemon is getting initialized",  (uint8_t *)&v18);
  if (v17 < 0) {
    sub_100012A40(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  }
  sub_100043910();
}

void sub_1002016C4(uint64_t a1, os_log_s *a2)
{
  unsigned int v3 = sub_1000D8DE8(a1);
  sub_100043918(v3, v4);
  sub_1000129E0();
  int v18 = 136315138;
  uint64_t v19 = v5;
  sub_100012A20( (void *)&_mh_execute_header,  a2,  v6,  "NCP state is %s, read the Pending DataSet as Daemon is getting initialized",  (uint8_t *)&v18);
  if (v17 < 0) {
    sub_100012A40(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  }
  sub_100043910();
}

void sub_10020175C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  unsigned int v3 = (void *)(*(void *)a1 + 32LL);
  int v4 = *(_DWORD *)(*(void *)a1 + 64LL) - *(_DWORD *)(*(void *)a1 + 56LL);
  int v5 = 136315650;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 1024;
  int v10 = 1300;
  sub_1000438AC( (void *)&_mh_execute_header,  a2,  a3,  "Spinel command for restoring property %s does not fit in outbound buffer (require %d bytes but only %u bytes available)",  (uint8_t *)&v5);
  sub_100008188();
}

void sub_1002017FC()
{
}

void sub_100201874()
{
}

void sub_1002018EC()
{
}

void sub_100201964()
{
}

void sub_1002019DC()
{
}

void sub_100201A54()
{
}

void sub_100201ACC()
{
}

void sub_100201B44()
{
}

void sub_100201BBC()
{
}

void sub_100201C34()
{
}

void sub_100201CAC()
{
}

void sub_100201D24()
{
}

void sub_100201D9C(int a1, int a2, uint64_t a3, os_log_s *a4)
{
  __int16 v7 = spinel_prop_key_to_cstr(dword_100224A58[2 * a1]);
  int v8 = spinel_status_to_cstr(a2);
  *(_DWORD *)a3 = 136315650;
  *(void *)(a3 + 4) = v7;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = v8;
  *(_WORD *)(a3 + 22) = 1024;
  *(_DWORD *)(a3 + 24) = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Unsuccessful fetching property %s from NCP: %s (%d)",  (uint8_t *)a3,  0x1Cu);
}

void sub_100201E34(uint64_t a1, int a2, os_log_s *a3)
{
  uint64_t v5 = *(void *)(a1 + 73672);
  uint64_t v6 = (void *)(v5 + 32);
  int v7 = 136315650;
  int v8 = v6;
  __int16 v9 = 2080;
  int v10 = spinel_status_to_cstr(a2);
  __int16 v11 = 1024;
  int v12 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Unsuccessful in restoring property %s on NCP: %s (%d)",  (uint8_t *)&v7,  0x1Cu);
  sub_100043910();
}

void sub_100201F00()
{
  LODWORD(sub_100015624((void *)&_mh_execute_header, v0, v1, "BackboneIPv6Interface tmp->h_length [%d] is invalid \n", v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "vprocess_init";
  sub_1000438E0();
  sub_1000438CC( (void *)&_mh_execute_header,  v0,  v1,  "%s: %d NCP FailureCount = %d/%d",  (const char *)v2,  (unint64_t)"vprocess_init" >> 32,  v3,  v4);
}

void sub_100201F80()
{
}

void sub_100201FE0()
{
}

void sub_10020200C()
{
}

void sub_100202038()
{
}

void sub_100202064()
{
}

void sub_100202090()
{
}

void sub_1002020BC(uint64_t a1, os_log_s *a2)
{
  int v4 = sub_1000D8DE8(a1);
  unsigned int v5 = sub_1000D8DE8(a1);
  sub_100043918(v5, v6);
  if (v18 >= 0) {
    int v7 = (void **)&v17;
  }
  else {
    int v7 = v17;
  }
  *(_DWORD *)buf = 67109378;
  int v20 = v4;
  __int16 v21 = 2080;
  int v22 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected NCP state %d (%s)", buf, 0x12u);
  if (v18 < 0) {
    sub_100012A40(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void sub_100202190(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Getting msg buffer counter failed: %d",  (uint8_t *)v2,  8u);
}

void sub_100202204()
{
}

void sub_10020227C()
{
}

void sub_1002022F4()
{
}

void sub_10020236C()
{
}

void sub_1002023E4()
{
}

void sub_10020245C()
{
}

void sub_1002024D4()
{
}

void sub_10020254C()
{
}

void sub_1002025C4()
{
}

void sub_10020263C()
{
}

void sub_1002026B4()
{
}

void sub_10020272C()
{
}

void sub_1002027A4()
{
}

void sub_10020281C()
{
}

void sub_100202894()
{
}

void sub_10020290C()
{
}

void sub_100202984()
{
}

void sub_1002029FC()
{
}

void sub_100202A74()
{
}

void sub_100202AEC()
{
}

void sub_100202B64()
{
}

void sub_100202BDC()
{
}

void sub_100202C54()
{
}

void sub_100202CCC()
{
}

void sub_100202D44()
{
}

void sub_100202DBC()
{
}

void sub_100202E34(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "PermitJoin: failed with error %d",  (uint8_t *)v2,  8u);
}

void sub_100202EA8()
{
}

void sub_100202F20(os_log_s *a1)
{
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "pcap_to_fd: Failed: %s (%d)",  (uint8_t *)&v5,  0x12u);
}

void sub_100202FC8(uint64_t *a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "SNIFFER_TLF::set_pcap_header_setting Pcap:pcapEnabled = %s ",  (uint8_t *)&v2,  0xCu);
  sub_100008188();
}

void sub_100203044( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100203074( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002030A4()
{
}

void sub_10020311C()
{
}

void sub_100203194()
{
}

void sub_10020320C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020323C(uint64_t a1, unsigned int a2)
{
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  unsigned int v5 = a2;
  __int16 v6 = 2080;
  __int16 v7 = sub_1001020A8(a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s failed with error %d. %s\n",  (uint8_t *)&v2,  0x1Cu);
}

void sub_1002032E8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Reply is not a dictionary \n",  v0,  2u);
}

void sub_10020332C(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = &unk_1002C9E10;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "NCP => %s\n", buf, 0xCu);
}

void sub_100203378()
{
}

void sub_1002033F0(char *a1, os_log_s *a2, uint64_t a3)
{
  unint64_t v3 = *a1;
  if (v3 > 7) {
    uint64_t v4 = "----";
  }
  else {
    uint64_t v4 = off_1002B0658[v3];
  }
  int v5 = 136315138;
  __int16 v6 = v4;
  sub_100012A20((void *)&_mh_execute_header, a2, a3, "NCP Log EMERG/ALERT/CRIT log_level[%s]", (uint8_t *)&v5);
  sub_100008188();
}

void sub_10020347C()
{
}

void sub_1002034E8()
{
  sub_1000155C8((void *)&_mh_execute_header, v0, (uint64_t)v0, "NCP => %s%s\n", v1);
  sub_100008188();
}

void sub_100203554()
{
}

void sub_1002035CC()
{
}

void sub_100203644()
{
}

void sub_1002036BC()
{
}

void sub_100203734()
{
}

void sub_1002037AC()
{
}

void sub_1002037D8()
{
}

void sub_100203850()
{
}

void sub_1002038C8()
{
}

void sub_100203940()
{
}

void sub_1002039B8()
{
}

void sub_100203A30()
{
}

void sub_100203AA8()
{
}

void sub_100203B20()
{
}

void sub_100203B98()
{
}

void sub_100203C10()
{
}

void sub_100203C88()
{
}

void sub_100203D00()
{
}

void sub_100203D78()
{
}

void sub_100203DF0()
{
}

void sub_100203E68()
{
}

void sub_100203EE0()
{
}

void sub_100203F58()
{
}

void sub_100203FD0()
{
}

void sub_100204048()
{
}

void sub_1002040C0()
{
}

void sub_100204138()
{
}

void sub_1002041B0()
{
}

void sub_100204228()
{
}

void sub_1002042A0()
{
}

void sub_100204318()
{
}

void sub_100204390()
{
}

void sub_100204408()
{
}

void sub_100204480()
{
}

void sub_1002044F8()
{
}

void sub_100204570()
{
}

void sub_1002045E8()
{
}

void sub_100204660()
{
}

void sub_1002046D8()
{
}

void sub_100204750()
{
}

void sub_1002047C8()
{
}

void sub_100204840()
{
}

void sub_1002048B8()
{
}

void sub_100204930()
{
}

void sub_1002049A8()
{
}

void sub_100204A20()
{
}

void sub_100204A98()
{
}

void sub_100204B10()
{
}

void sub_100204B88(uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void sub_100204BF8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void sub_100204C68(uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void sub_100204CD8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void sub_100204D48(uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void sub_100204DB8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void sub_100204E28( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100204E8C(const __CFString *a1, int a2, os_log_t log)
{
  int v6 = xmmword_1002C98A8;
  int v5 = DWORD1(xmmword_1002C98A8);
  uint64_t v7 = *((void *)&xmmword_1002C98A8 + 1);
  if (a1)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr(a1, SystemEncoding);
  }

  else
  {
    CStringPtr = " ";
  }

  v11[0] = 67110914;
  v11[1] = v6;
  __int16 v12 = 1024;
  int v13 = v5;
  __int16 v14 = 2048;
  uint64_t v15 = v7;
  __int16 v16 = 2080;
  char v17 = CStringPtr;
  __int16 v18 = 1024;
  int v19 = a2;
  __int16 v20 = 1024;
  int v21 = qword_1002C98B8;
  __int16 v22 = 1024;
  int v23 = HIDWORD(qword_1002C98B8);
  __int16 v24 = 1024;
  int v25 = (unsigned __int16)word_1002C98C0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "\n Fault Block Random Id: %u \n Crash Type: %d \n Timestamp(ms): %llu \n Timestamp(format): [%s.%03d]\n Address: 0x%0x \n Line: %d \n Crash Count: %d",  (uint8_t *)v11,  0x3Au);
}

void sub_100204FB0()
{
}

void sub_100204FDC(uint64_t *a1, os_log_s *a2)
{
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  int v6 = 136315138;
  uint64_t v7 = p_p;
  sub_100012A20((void *)&_mh_execute_header, a2, v3, "peek_logs_filing_cb: INVALID VALUE TYPE: [%s]", (uint8_t *)&v6);
}

void sub_100205088()
{
}

void sub_100205100()
{
}

void sub_10020512C()
{
}

void sub_100205158()
{
}

void sub_100205184()
{
}

void sub_1002051FC()
{
}

void sub_100205274()
{
}

void sub_1002052E4()
{
}

void sub_10020535C()
{
}

void sub_1002053D0()
{
}

void sub_100205448()
{
}

void sub_1002054C0()
{
}

void sub_100205538()
{
}

void sub_1002055B0()
{
}

void sub_100205614()
{
}

void sub_100205640()
{
}

void sub_10020566C()
{
}

void sub_1002056D0()
{
}

void sub_10020573C()
{
}

void sub_1002057A8()
{
}

void sub_1002057D4()
{
}

void sub_100205800()
{
}

void sub_100205878()
{
}

void sub_1002058F0()
{
}

void sub_100205968()
{
}

void sub_1002059E0()
{
}

void sub_100205A58()
{
}

void sub_100205AD0()
{
}

void sub_100205B48()
{
}

void sub_100205BC0()
{
}

void sub_100205C38()
{
}

void sub_100205CB0()
{
}

void sub_100205D28()
{
}

void sub_100205D54()
{
}

void sub_100205DCC()
{
}

void sub_100205E44()
{
}

void sub_100205EBC()
{
}

void sub_100205EE8()
{
}

void sub_100205F74()
{
}

void sub_100205FEC()
{
}

void sub_100206064()
{
}

void sub_1002060DC(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_100012A20((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s capability not supported", (uint8_t *)a2);
}

void sub_100206118(uint64_t *a1, uint64_t *a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  sub_1000155C8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "DoneTime[%llu msec] less than StartTime[%llu msec]",  (uint8_t *)&v5);
  sub_100008188();
}

void sub_100206198(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Join failed: %d", (uint8_t *)v2, 8u);
}

void sub_10020620C()
{
}

void sub_100206284()
{
}

void sub_1002062FC()
{
}

void sub_100206374()
{
}

void sub_1002063EC()
{
}

void sub_100206454()
{
}

void sub_1002064CC()
{
}

void sub_100206544()
{
}

void sub_1002065BC()
{
}

void sub_100206634()
{
}

void sub_1002066AC()
{
}

void sub_100206724()
{
}

void sub_10020679C()
{
}

void sub_100206814()
{
}

void sub_10020687C()
{
}

void sub_1002068F4()
{
}

void sub_10020696C()
{
}

void sub_1002069D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Starting Join Network Task", v1, 2u);
}

void sub_100206A14(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "WPANTUND InternalClientsInterface Server - Started",  v1,  2u);
}

void sub_100206A54()
{
}

void sub_100206ACC()
{
}

void sub_100206B44()
{
}

void sub_100206BBC()
{
}

void sub_100206C34()
{
}

void sub_100206CAC()
{
}

void sub_100206D24()
{
}

void sub_100206D9C()
{
}

void sub_100206E14()
{
}

void sub_100206E8C()
{
}

void sub_100206F04()
{
}

void sub_100206F7C()
{
}

void sub_100206FF4()
{
}

void sub_10020706C()
{
}

void sub_1002070E4()
{
}

void sub_10020715C(uint64_t a1, os_log_s *a2)
{
  int v2 = *(_DWORD *)(a1 + 244);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "SendCommand task finish: mRetVal: %u mReturnValue",  (uint8_t *)v3,  8u);
}

void sub_1002071D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100207248( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002072BC()
{
}

void sub_100207334()
{
}

void sub_1002073AC()
{
}

void sub_100207424()
{
}

void sub_10020749C()
{
}

void sub_100207514()
{
}

void sub_10020758C()
{
}

void sub_100207604()
{
}

void sub_10020767C()
{
}

void sub_1002076F4()
{
}

void sub_10020776C()
{
}

void sub_1002077E4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Getting child/neighbor table failed: %d",  (uint8_t *)v2,  8u);
}

void sub_100207858()
{
}

void sub_1002078D0()
{
}

void sub_100207948()
{
}

void sub_1002079C0()
{
}

void sub_100207A38()
{
}

void sub_100207AB0()
{
}

void sub_100207B28()
{
}

void sub_100207BA0()
{
}

void sub_100207C18(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Scan failed: %d", (uint8_t *)v2, 8u);
  sub_100012A58();
}

void sub_100207C88()
{
}

void sub_100207D00()
{
}

void sub_100207D78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100207DA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100207DD8()
{
}

void sub_100207E50()
{
}

void sub_100207EC8()
{
}

void sub_100207F40()
{
}

void sub_100207FB8()
{
}

void sub_100208030()
{
}

void sub_1002080A8()
{
}

void sub_100208120()
{
}

void sub_100208198()
{
}

void sub_100208210()
{
}

void sub_100208288(int *a1, os_log_s *a2)
{
  uint64_t v4 = spinel_prop_key_to_cstr(*a1);
  int v5 = *a1;
  int v6 = 136315394;
  __int16 v7 = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unsupported/unknown property key in a Thread Operational Dataset: %s (%d)",  (uint8_t *)&v6,  0x12u);
}

void sub_10020832C()
{
}

void sub_1002083A4()
{
}

void sub_10020841C()
{
}

void sub_100208494()
{
}

void sub_10020850C()
{
}

void sub_100208584()
{
}

void sub_1002085FC()
{
}

void sub_100208674()
{
}

void sub_1002086EC()
{
}

void sub_100208764()
{
}

void sub_1002087DC()
{
}

void sub_100208854()
{
}

void sub_1002088CC()
{
}

void sub_100208944()
{
}

void sub_1002089BC()
{
}

void sub_100208A34()
{
}

void sub_100208AAC()
{
  LODWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = 136315138;
  HIDWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = v0;
  sub_1000A6F7C( (void *)&_mh_execute_header,  v1,  v2,  "Vendor Custom property_get_value: Unsupported property %s",  v3);
  sub_100008188();
}

void sub_100208B10()
{
}

void sub_100208B88()
{
}

void sub_100208C00()
{
}

void sub_100208C78()
{
}

void sub_100208CF0()
{
}

void sub_100208D68()
{
}

void sub_100208DE0()
{
}

void sub_100208E58()
{
}

void sub_100208ED0()
{
}

void sub_100208F48()
{
}

void sub_100208FC0()
{
}

void sub_100209038()
{
}

void sub_1002090B0()
{
}

void sub_100209128()
{
}

void sub_1002091A0()
{
}

void sub_100209218()
{
}

void sub_100209290()
{
}

void sub_100209308()
{
}

void sub_100209380()
{
}

void sub_1002093F8()
{
}

void sub_100209470()
{
}

void sub_1002094E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100209564()
{
}

void sub_1002095DC()
{
}

void sub_100209654()
{
}

void sub_1002096CC()
{
}

void sub_100209744()
{
}

void sub_1002097BC()
{
}

void sub_100209834()
{
}

void sub_1002098AC()
{
}

void sub_100209924()
{
}

void sub_10020999C()
{
}

void sub_100209A14()
{
}

void sub_100209A8C()
{
}

void sub_100209B04()
{
}

void sub_100209B7C()
{
}

void sub_100209BF4()
{
}

void sub_100209C6C()
{
}

void sub_100209CE4()
{
}

void sub_100209D5C()
{
}

void sub_100209DD4()
{
}

void sub_100209E4C()
{
}

void sub_100209EC4()
{
}

void sub_100209F3C()
{
}

void sub_100209FB4()
{
}

void sub_10020A02C()
{
}

void sub_10020A0A4()
{
}

void sub_10020A11C()
{
}

void sub_10020A194()
{
}

void sub_10020A20C()
{
}

void sub_10020A284()
{
}

void sub_10020A2FC()
{
}

void sub_10020A374()
{
}

void sub_10020A3EC()
{
}

void sub_10020A464()
{
}

void sub_10020A4DC()
{
}

void sub_10020A554()
{
}

void sub_10020A5CC()
{
}

void sub_10020A644()
{
}

void sub_10020A6BC()
{
}

void sub_10020A734()
{
}

void sub_10020A7AC()
{
}

void sub_10020A824()
{
}

void sub_10020A89C()
{
}

void sub_10020A914()
{
}

void sub_10020A98C()
{
}

void sub_10020AA04()
{
}

void sub_10020AA7C()
{
}

void sub_10020AAF4()
{
}

void sub_10020AB6C()
{
}

void sub_10020ABE4()
{
}

void sub_10020AC5C()
{
}

void sub_10020ACD4()
{
}

void sub_10020AD4C()
{
}

void sub_10020ADC4()
{
}

void sub_10020AE3C()
{
}

void sub_10020AEB4()
{
}

void sub_10020AF2C()
{
}

void sub_10020AFA4()
{
}

void sub_10020B01C()
{
}

void sub_10020B094()
{
}

void sub_10020B10C()
{
}

void sub_10020B184()
{
}

void sub_10020B1FC()
{
}

void sub_10020B274()
{
}

void sub_10020B2EC()
{
}

void sub_10020B364()
{
}

void sub_10020B3DC()
{
}

void sub_10020B454()
{
}

void sub_10020B4CC()
{
}

void sub_10020B544()
{
}

void sub_10020B5BC()
{
}

void sub_10020B634()
{
}

void sub_10020B6AC()
{
}

void sub_10020B724()
{
}

void sub_10020B79C()
{
}

void sub_10020B814()
{
}

void sub_10020B88C()
{
  LODWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = 136315138;
  HIDWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = v0;
  sub_1000A6F7C( (void *)&_mh_execute_header,  v1,  v2,  "Vendor Custom property_set_value: Unsupported property %s",  v3);
  sub_100008188();
}

void sub_10020B8F0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Saved Vendor Settings is empty", v1, 2u);
}

void sub_10020B930(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  LODWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = 136315138;
  HIDWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = (_DWORD)a2;
  sub_1000A6F7C( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "Illegal NCP Vendor version change! (Previously %s)",  v3);
  sub_100008188();
}

void sub_10020B9A0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Form failed: %d", (uint8_t *)v2, 8u);
}

void sub_10020BA14()
{
}

void sub_10020BA8C(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = *(_DWORD *)(*(void *)a1 + 73748LL);
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  sub_10001570C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Invalid channel mask 0x%08x. Supported channels mask is 0x%08x",  (uint8_t *)v4);
  sub_100008188();
}

void sub_10020BB14()
{
}

void sub_10020BB8C()
{
}

void sub_10020BC04()
{
}

void sub_10020BC7C()
{
}

void sub_10020BCF4()
{
}

void sub_10020BD6C()
{
}

void sub_10020BDE4()
{
}

void sub_10020BE5C()
{
}

void sub_10020BED4()
{
}

void sub_10020BF4C()
{
}

void sub_10020BFC4()
{
}

void sub_10020C03C()
{
  v2[0] = 67109376;
  sub_100079508();
  sub_10001570C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/ncp-spinel/SpinelNCPTaskForm.cpp:%d: Check Failed (error %d)",  (uint8_t *)v2);
  sub_100008188();
}

void sub_10020C0A8()
{
}

void sub_10020C120(unsigned __int8 *a1, uint64_t a2, os_log_s *a3)
{
  int v3 = *a1;
  int v4 = *(_DWORD *)(*(void *)a2 + 73748LL);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  sub_10001570C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Channel %d is not supported by NCP. Supported channels mask is %08x",  (uint8_t *)v5);
  sub_100008188();
}

void sub_10020C1AC()
{
  v2[0] = 67109376;
  sub_100079508();
  sub_10001570C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/ncp-spinel/SpinelNCPTaskForm.cpp:%d: Check Failed (error %d)",  (uint8_t *)v2);
  sub_100008188();
}

void sub_10020C218(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Starting Form Network Task", v1, 2u);
}

void sub_10020C258(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Peek failed: %d", (uint8_t *)v2, 8u);
}

void sub_10020C2CC()
{
}

void sub_10020C344()
{
}

void sub_10020C3BC()
{
}

void sub_10020C434()
{
}

void sub_10020C4AC(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "SPINEL_CMD_PEEK_RET: prop_key: %d",  (uint8_t *)v2,  8u);
}

void sub_10020C520()
{
}

void sub_10020C598(xpc_object_t *a1, uint64_t *a2)
{
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)buf = 136315394;
  int v7 = v3;
  __int16 v8 = 2080;
  int v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Connection %s not allowed for: %s \n",  buf,  0x16u);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10020C668(uint64_t a1, uint64_t a2)
{
  do
  {
    a1 -= 48LL;
  }

  while (a1 != a2);
}

void sub_10020C6B4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "HostDidWake tickle failed: %d",  (uint8_t *)v2,  8u);
}

void sub_10020C728( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020C7A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020C828(int a1)
{
  uint64_t v1 = sub_1000AD6C8(a1);
  sub_1000AD6D8((uint64_t)v1, 4.8151e-34);
  sub_1000AD6B4((void *)&_mh_execute_header, v2, v3, "[-NCP-]: Socket error on read: %s %d");
  sub_1000AD6F0();
}

void sub_10020C864( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020C8E4(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[-NCP-]: Unrecognized frame (0x%02X)",  (uint8_t *)v3,  8u);
}

void sub_10020C95C(int *a1)
{
}

void sub_10020C9D0(unsigned __int8 *a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = 1024;
  HIWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = *a1;
  sub_1000438B8((void *)&_mh_execute_header, a2, a3, "[NCP->]: Garbage is not ASCII ([%d]=%d)", 67109376, v3);
  sub_100008188();
}

void sub_10020CA44()
{
  HIWORD(sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "Unexpected reset during NCP initialization. FaiureCount: %d/%d",  v2, v3) = v0;
  sub_1000438B8( (void *)&_mh_execute_header,  v0,  v1,  "[NCP->]: Frame CRC Mismatch: Calc:0x%04X != Frame:0x%04X, Garbage on line?",  v2,  v3);
  sub_100008188();
}

void sub_10020CAAC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020CB2C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000AD6A0((void *)&_mh_execute_header, v1, v2, "driver_to_ncp_pump: Socket error on read: %s", v3, v4, v5, v6, 2u);
  sub_1000155F0();
}

void sub_10020CBA4()
{
  int v3 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "BackboneInterface::mOutBuffLen[%d] mNcpBuffAvail[%d]:: MCAST FRAME",  v2,  0xEu);
  sub_100008188();
}

void sub_10020CC20()
{
  int v0 = 136315394;
  os_log_t v1 = "com.apple.wpantund.ncp";
  __int16 v2 = 2080;
  int v3 = "default";
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Logging Module is not defined for SubSystem: %s, Category: %s",  (uint8_t *)&v0,  0x16u);
}

void sub_10020CCB8()
{
}

void sub_10020CCE0()
{
}

void sub_10020CD08(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Leave failed: %d", (uint8_t *)v2, 8u);
}

void sub_10020CD7C()
{
}

void sub_10020CDF4()
{
}

void sub_10020CE6C()
{
}

void sub_10020CEE4()
{
}

void sub_10020CF5C()
{
}

void sub_10020CFD4()
{
}

void sub_10020D04C()
{
}

void sub_10020D0C4(char *a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = a2;
  if (*a1 < 0) {
    uint64_t v4 = (void *)*a2;
  }
  uint64_t v5 = __error();
  uint64_t v6 = strerror(*v5);
  int v7 = *__error();
  int v8 = 136315650;
  int v9 = v4;
  __int16 v10 = 2080;
  int v11 = v6;
  __int16 v12 = 1024;
  int v13 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "SNIFFER_TLF::start_pcap_capture: ERR Opening file[%s]: %s (%d)",  (uint8_t *)&v8,  0x1Cu);
}

void sub_10020D194( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020D1C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020D1F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020D224(int a1, os_log_s *a2)
{
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = *__error();
  v7[0] = 67109634;
  v7[1] = a1;
  __int16 v8 = 2080;
  int v9 = v5;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "PcapManager::insert_fd: Call to send() on fd %d failed: %s (%d)",  (uint8_t *)v7,  0x18u);
}

void sub_10020D2E4(os_log_s *a1)
{
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = *__error();
  int v6 = 136315394;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v5,  "PcapManager::new_fd: Call to socketpair() failed: %s (%d)",  (uint8_t *)&v6);
}

void sub_10020D384(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 67109378;
  v3[1] = 323;
  __int16 v4 = 2080;
  uint64_t v5 = "(packet.get_status()) == 0";
  sub_10003390C( (void *)&_mh_execute_header,  a1,  a3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/Pcap.cpp:%d: Requirement Failed (%s)",  (uint8_t *)v3);
  sub_100008188();
}

void sub_10020D408(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 67109378;
  v3[1] = 377;
  __int16 v4 = 2080;
  uint64_t v5 = "(packet.get_status()) == 0";
  sub_10003390C( (void *)&_mh_execute_header,  a1,  a3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/Pcap.cpp:%d: Requirement Failed (%s)",  (uint8_t *)v3);
  sub_100008188();
}

void sub_10020D48C()
{
}

void sub_10020D4B8()
{
}

void sub_10020D4E4()
{
}

void sub_10020D510()
{
}

void sub_10020D53C()
{
}

void sub_10020D568()
{
}

void sub_10020D594()
{
}

void sub_10020D5C0()
{
}

void sub_10020D5EC()
{
}

void sub_10020D618()
{
}

void sub_10020D644()
{
}

void sub_10020D670()
{
}

void sub_10020D69C()
{
}

void sub_10020D6C8()
{
}

void sub_10020D6F4()
{
}

void sub_10020D720()
{
}

void sub_10020D74C()
{
}

void sub_10020D778()
{
}

void sub_10020D7A4()
{
}

void sub_10020D7D0()
{
}

void sub_10020D7FC()
{
}

void sub_10020D828()
{
}

void sub_10020D854()
{
}

void sub_10020D8CC()
{
}

void sub_10020D944()
{
}

void sub_10020D970( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020D9A4(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Illegal NCP version change! (Previously %s)",  (uint8_t *)&v3,  0xCu);
  sub_100008188();
}

void sub_10020DA24()
{
}

void sub_10020DA84( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020DAB8()
{
}

void sub_10020DB18()
{
}

void sub_10020DB78()
{
}

void sub_10020DBD8(os_log_t log)
{
  v1[0] = 67109378;
  v1[1] = 1441;
  __int16 v2 = 2080;
  uint64_t v3 = "new_ncp_state == UNINITIALIZED";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/NCPInstanceBase.cpp:%d: Check Failed (%s)",  (uint8_t *)v1,  0x12u);
  sub_100008188();
}

void sub_10020DC64(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  sub_1000155C8( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Experiencing extended insomnia. Resetting internal state. current_time = %lldms, mLastChangedBusy = %lldms",  (uint8_t *)&v4);
  sub_100008188();
}

void sub_10020DCE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020DD50()
{
}

void sub_10020DD7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020DDEC()
{
  *uint64_t v1 = 136315394;
  sub_1000EA72C(v2, (uint64_t)v1, (uint64_t)"AWDMetricsClient_TriggerAutoBugCaptures_block_invoke");
  sub_1000EA71C((void *)&_mh_execute_header, v3, v4, "%s : SDR rejected snapshotWithSignature. Reason %@", v5);

  sub_1000EA740();
}

void sub_10020DE34( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020DEA4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020DF14()
{
  *uint64_t v1 = 136315394;
  sub_1000EA72C(v2, (uint64_t)v1, (uint64_t)"AWDMetricsClient_TriggerAutoBugCaptures_internal_block_invoke");
  sub_1000EA71C((void *)&_mh_execute_header, v3, v4, "%s : SDR rejected snapshotWithSignature. Reason %@", v5);

  sub_1000EA740();
}

void sub_10020DF5C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020DFCC()
{
}

void sub_10020DFF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020E068()
{
  *uint64_t v1 = 136315394;
  sub_1000EA72C(v2, (uint64_t)v1, (uint64_t)"AWDMetricsClient_TriggerGroupAutoBugCapture_block_invoke");
  sub_1000EA71C((void *)&_mh_execute_header, v3, v4, "%s : SDR rejected snapshotWithSignature. Reason %@", v5);

  sub_1000EA740();
}

void sub_10020E0B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020E120( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020E190()
{
  *uint64_t v1 = 136315394;
  sub_1000EA72C(v2, (uint64_t)v1, (uint64_t)"AWDMetricsClient_GroupAutoBugCapture_Rx_block_invoke");
  sub_1000EA71C((void *)&_mh_execute_header, v3, v4, "%s : SDR rejected snapshotWithSignature. Reason %@", v5);

  sub_1000EA740();
}

void sub_10020E1D8()
{
}

void sub_10020E204()
{
}

void sub_10020E23C()
{
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "AWDMetricsClient_TriggerAutoBugCapture : SDR rejected snapshotWithSignature. Reason %@",  v4,  0xCu);

  sub_1000EA740();
}

void sub_10020E288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020E314(os_log_s *a1)
{
  int v2 = *__error();
  os_log_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "NCPInstance: errno %d %s\n",  (uint8_t *)v5,  0x12u);
}

void sub_10020E3B8(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NCPInstance: error %d\n", (uint8_t *)v2, 8u);
}

void sub_10020E42C(unsigned int a1, uint64_t *a2, os_log_s *a3)
{
  unsigned int v7 = a1;
  __int16 v8 = 2080;
  int v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Error %s (%d) while performing %s on NCP - Resetting NCP.",  v6,  0x1Cu);
}

void sub_10020E4DC(unsigned int a1, os_log_s *a2)
{
  unsigned int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error %s (%d) adding user-added multicast address on NCP, removing the address ",  v4,  0x12u);
}

void sub_10020E568(os_log_s *a1)
{
  int v2 = __error();
  strerror(*v2);
  int v4 = 67109378;
  sub_1000081B8();
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/NCPInstanceBase-AsyncIO.cpp:%d: Requirement Failed (%s)",  (uint8_t *)&v4,  0x12u);
}

void sub_10020E600(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "fillmoreController hard reset failure",  v1,  2u);
}

void sub_10020E640()
{
}

void sub_10020E6B8()
{
}

void sub_10020E730()
{
}

void sub_10020E7A8()
{
}

void sub_10020E820()
{
}

void sub_10020E898()
{
}

void sub_10020E910()
{
}

void sub_10020E988()
{
  LODWORD(sub_100015624((void *)&_mh_execute_header, v0, v1, "BackboneIPv6Interface tmp->h_length [%d] is invalid \n", v2) = 136315650;
  sub_100043890();
  sub_1000F3D28( (void *)&_mh_execute_header,  v0,  v1,  "%s: Changing NCP state to FAULT, FailureCount = %d/%d",  v2,  v3,  v4);
  sub_100008188();
}

void sub_10020E9FC()
{
  LODWORD(sub_100015624((void *)&_mh_execute_header, v0, v1, "BackboneIPv6Interface tmp->h_length [%d] is invalid \n", v2) = 136315650;
  sub_100043890();
  sub_1000F3D28((void *)&_mh_execute_header, v0, v1, "%s: NCP FailureCount = %d/%d", v2, v3, v4);
  sub_100008188();
}

void sub_10020EA70()
{
}

void sub_10020EA9C()
{
}

void sub_10020EAC8()
{
}

void sub_10020EAF4(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2080;
  *(void *)(a2 + 1sub_100077944( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/ncp-spinel/SpinelNCPTaskJoin.cpp:%d: Check Failed (error %d)",  v2,  v3,  v4,  v5, 0) = a1;
  sub_10003390C((void *)&_mh_execute_header, a4, a3, "Call to sec_random_init() failed, errno=%d %s", (uint8_t *)a2);
}

void sub_10020EB40(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = qword_1002D13F0;
  sub_100012A20( (void *)&_mh_execute_header,  a1,  a3,  "getpwnam: Unable to lookup user %s, cannot drop privileges.",  (uint8_t *)&v3);
  sub_100008188();
}

void sub_10020EBB4(uint64_t a1, uint64_t a2)
{
}

void sub_10020EBEC(uint64_t a1, uint64_t a2)
{
}

void sub_10020EC24(uint64_t a1, uint64_t a2)
{
}

void sub_10020EC5C(uint64_t a1, uint64_t a2)
{
}

void sub_10020EC94()
{
}

void sub_10020ECC0(const std::runtime_error *a1, os_log_s *a2)
{
}

void sub_10020ED34(const std::exception *a1, os_log_s *a2)
{
}

void sub_10020EDA4(uint8_t *a1, uint64_t *a2, os_log_s *a3)
{
  uint64_t v3 = qword_1002D13F8;
  *(_DWORD *)a1 = 136315138;
  *a2 = v3;
  sub_100012A20((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to open PID file %s.", a1);
}

void sub_10020EDE8(uint8_t *a1, uint64_t a2, void *a3, os_log_s *a4)
{
  uint64_t v4 = (void *)(*(void *)a2 + 32LL);
  *(_DWORD *)a1 = 136315138;
  *a3 = v4;
  sub_100012A20( (void *)&_mh_execute_header,  a4,  (uint64_t)a3,  "Configuration property %s is no longer supported. Please remove it from your configuration.",  a1);
}

void sub_10020EE3C()
{
  int v3 = 20;
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "Flash contains Tx power value(%s) which is invalid. Restoring to new default(%d)",  v2);
  sub_100008188();
}

void sub_10020EEA8()
{
  sub_1000155D4((void *)&_mh_execute_header, v0, v1, "FillmoreHasEPA() returned error.", v2, v3, v4, v5, v6);
  sub_100012A58();
}

void sub_10020EED4()
{
}

void sub_10020EF00()
{
}

void sub_10020EF2C()
{
}

void sub_10020EF58()
{
}

void sub_10020EF84()
{
}

void sub_10020EFB0()
{
}

void sub_10020EFDC(const std::exception *a1, os_log_s *a2)
{
}

void sub_10020F04C(const std::exception *a1, os_log_s *a2)
{
}

void sub_10020F0BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10020F12C()
{
}

void sub_10020F158( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100043870( (void *)&_mh_execute_header,  a2,  a3,  "MainLoop:addInterfaceBeforeExit mInterfaceAdded=%d",  a5,  a6,  a7,  a8,  0);
  sub_100012A58();
}

void sub_10020F1C0(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *a2;
  int v4 = *(unsigned __int8 *)(a1 + 60);
  v5[0] = 67109632;
  v5[1] = 1024;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "BUG: Too many file descriptors: %d (max %d) mInterfaceAdded (%d)",  (uint8_t *)v5,  0x14u);
  sub_100008188();
}

void sub_10020F250()
{
}

void sub_10020F2C0()
{
  int v3 = v0;
  sub_10003390C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Time out (Before Select) %ld sec, %d usec", v2);
  sub_100008188();
}

void sub_10020F32C(os_log_s *a1)
{
  uint64_t v2 = __error();
  int v3 = strerror(*v2);
  int v4 = *__error();
  int v6 = 136315394;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  sub_10003390C((void *)&_mh_execute_header, a1, v5, "select() errno=%s (%d)", (uint8_t *)&v6);
  sub_1000155F0();
}

void sub_10020F3C8()
{
}

void sub_10020F438()
{
}

void sub_10020F49C()
{
}

void sub_10020F500()
{
}

void sub_10020F578(int *a1, uint64_t *a2, os_log_s *a3)
{
  int v3 = *a1;
  uint64_t v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  sub_10003390C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Number of cmstimeouts = %d in 24 hours with first one at time = %ld",  (uint8_t *)v5);
  sub_100008188();
}

void sub_10020F5F8(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_100012A20((void *)&_mh_execute_header, a2, a3, "First cmstimeout in 24 hours at time = %ld", (uint8_t *)&v4);
  sub_100008188();
}

void sub_10020F664()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "!version.empty()";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_10020F6E0()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020F754()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020F7C8()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020F83C()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "mUpgradeStatus != EINPROGRESS";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_10020F8B8()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020F92C()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "mFirmwareUpgradeFD >= 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/FirmwareUpgrade.cpp:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_10020F9A8()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to fork() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10020FA1C(uint64_t a1)
{
}

void sub_10020FA94()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to waitpid() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10020FB08(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "FirmwareCheck: Prohibited character (%d) in version string",  (uint8_t *)v2,  8u);
}

void sub_10020FB7C(uint64_t a1)
{
}

void sub_10020FBF8()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to waitpid() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10020FC78()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/NetworkRetain.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020FCEC()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/NetworkRetain.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020FD60()
{
  os_log_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016E4();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/wpantund/NetworkRetain.cpp:%d: Requirement Failed (%s)",  v3,  v4,  v5,  v6,  2u);
  sub_1000155F0();
}

void sub_10020FDD4()
{
  os_log_t v0 = __error();
  strerror(*v0);
  __error();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to fork() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10020FE58(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: stdout_copy", v1, 2u);
}

void sub_10020FE98(uint64_t a1)
{
}

void sub_10020FF24()
{
  os_log_t v0 = __error();
  strerror(*v0);
  __error();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to waitpid() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10020FFA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100210018(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "postFollowUpNotification";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: FAULT detected, Failed Post Followup Notification : %d, asserting !!! ",  (uint8_t *)&v1,  0x12u);
  sub_100008188();
}

void sub_1002100A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100210110()
{
}

void sub_10021013C()
{
}

void sub_100210168()
{
}

void sub_100210194()
{
}

void sub_1002101C0()
{
}

void sub_1002101EC()
{
}

void sub_100210218()
{
}

void sub_100210244()
{
}

void sub_100210270()
{
}

void sub_10021029C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100210300( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100210364( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1002103C8()
{
}

void sub_100210404()
{
}

void sub_100210440()
{
}

void sub_10021047C()
{
}

void sub_1002104B8()
{
}

void sub_1002104E4()
{
}

void sub_100210510(char *a1, void *a2, os_log_s *a3)
{
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  sub_100012A20((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to join multicast group %s", (uint8_t *)&v4);
  sub_100008188();
}

void sub_10021058C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10021060C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10021068C()
{
}

void sub_1002106B8(uint64_t a1, os_log_s *a2)
{
  unsigned int v3 = sub_1000D8DE8(a1);
  sub_1001144B4(v3, v4);
  sub_1000129E0();
  int v9 = 136315138;
  uint64_t v10 = v5;
  sub_100012A20((void *)&_mh_execute_header, a2, v6, "Got IPv6 traffic when we should be asleep! (%s)", (uint8_t *)&v9);
  if (v8 < 0) {
    operator delete(__p);
  }
  sub_1000129F4();
}

void sub_10021074C(uint64_t a1, os_log_s *a2)
{
  unsigned int v3 = sub_1000D8DE8(a1);
  sub_1001144B4(v3, v4);
  sub_1000129E0();
  int v9 = 136315138;
  uint64_t v10 = v5;
  sub_100012A20((void *)&_mh_execute_header, a2, v6, "Ignoring IPv6 traffic while in %s state.", (uint8_t *)&v9);
  if (v8 < 0) {
    operator delete(__p);
  }
  sub_1000129F4();
}

void sub_1002107E0(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Dropping non-IPv6 outbound packet (first byte was 0x%02X)",  (uint8_t *)v3,  8u);
  sub_100012A58();
}

void sub_100210854()
{
}

void sub_100210880(int *a1, os_log_s *a2, float a3)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "RunawayResetBackoffManager: mWindowedResetCount = %d, will delay for %f seconds",  (uint8_t *)v4,  0x12u);
}

void sub_100210908(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2080;
  *(void *)(buf + 1sub_100077944( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/ncp-spinel/SpinelNCPTaskJoin.cpp:%d: Check Failed (error %d)",  v2,  v3,  v4,  v5, 0) = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "TunnelIPv6Interface: Couldn't get tunnel name! errno=%d, %s",  buf,  0x12u);
}

void sub_10021095C(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "TunnelIPv6Interface::TunnelIPv6Interface socket read buffer size set to %d bytes",  (uint8_t *)v3,  8u);
}

void sub_1002109D4(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "TunnelIPv6Interface::TunnelIPv6Interface socket read buffer size could not be set to %d bytes",  (uint8_t *)v3,  8u);
}

void sub_100210A4C()
{
}

void sub_100210AC4()
{
}

void sub_100210B3C()
{
}

void sub_100210BB4()
{
}

void sub_100210C2C()
{
}

void sub_100210CA4()
{
}

void sub_100210D1C()
{
}

void sub_100210D94(char *a1, void *a2, os_log_t log)
{
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Socket %s is locked by another process",  (uint8_t *)&v4,  0xCu);
  sub_100008188();
}

void sub_100210E18(char *a1, void *a2, os_log_s *a3)
{
  int v4 = a2;
  if (*a1 < 0) {
    int v4 = (void *)*a2;
  }
  int v5 = *__error();
  double v6 = __error();
  uint8_t v7 = strerror(*v6);
  int v8 = 136315650;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  __int16 v12 = 2080;
  int v13 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "SuperSocket::Reset: Unable to reopen socket <%s>, errno=%d (%s)",  (uint8_t *)&v8,  0x1Cu);
}

void sub_100210EE4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Socket is locked by another process", v1, 2u);
}

void sub_100210F24(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "SuperSocket::reset()", v1, 2u);
}

void sub_100210F64()
{
  uint64_t v0 = __error();
  uint64_t v1 = sub_100015630(v0);
  perror(v1);
}

void sub_100210F80(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "close_super_socket: PID %d didn't respond to SIGHUP, trying SIGTERM",  (uint8_t *)v3,  8u);
  sub_100012A58();
}

void sub_100210FF4(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 67109378;
  v3[1] = 348;
  __int16 v4 = 2080;
  int v5 = "NULL != iter";
  sub_10003390C( (void *)&_mh_execute_header,  a1,  a3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/socket-utils.c:%d: Requirement Failed (%s)",  (uint8_t *)v3);
  sub_100008188();
}

void sub_100211078(int a1)
{
}

void sub_1002110F8()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to socketpair() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10021116C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100128364((void *)&_mh_execute_header, a1, a3, "Forked!", v3);
  sub_100012A58();
}

void sub_1002111A0()
{
  if (sub_1000160F4("com.apple.wpantund", "default"))
  {
    if (sub_1001283D0() && sub_100128390(v0))
    {
      uint64_t v1 = __error();
      sub_100015630(v1);
      sub_1001283B4();
      int v8 = 136315394;
      int v9 = "default";
      sub_10012830C();
      sub_1001283BC();
LABEL_8:
      _os_log_error_impl(v2, v3, v4, v5, v6, v7);
    }
  }

  else if (sub_100128390((os_log_s *)&_os_log_default))
  {
    int v8 = 136315394;
    sub_1001283E4();
    uint64_t v2 = (mach_header_64 *)&_mh_execute_header;
    uint64_t v3 = (os_log_s *)&_os_log_default;
    uint64_t v5 = "Logging Module is not defined for SubSystem: %s, Category: %s";
    uint64_t v6 = (uint8_t *)&v8;
    os_log_type_t v4 = OS_LOG_TYPE_ERROR;
    uint32_t v7 = 22;
    goto LABEL_8;
  }

  sub_1001283A0();
  sub_100128380();
}

void sub_1002112BC()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Unable to open socket. %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_100211330(_BYTE *a1, _BYTE *a2)
{
}

void sub_10021135C(_BYTE *a1, _BYTE *a2)
{
}

void sub_100211388(_BYTE *a1, _BYTE *a2)
{
}

void sub_1002113B4()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to connect() failed. %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_100211428(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to lookup %s",  (uint8_t *)&v2,  0xCu);
  sub_100008188();
}

void sub_100211498(uint64_t a1, int a2, os_log_s *a3)
{
  uint8_t v7 = sub_100128398();
  sub_100015630(v7);
  sub_1001283B4();
  int v9 = 136315906;
  uint64_t v10 = v3;
  sub_10012830C();
  __int16 v11 = 2080;
  uint64_t v12 = a1;
  __int16 v13 = v8;
  int v14 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Unable to open socket. %s (%d) (filename = %s, type = %d)",  (uint8_t *)&v9,  0x22u);
  sub_100128340();
}

void sub_100211544(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  sub_10003390C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "I don't know how to open %s (socket type %d)",  (uint8_t *)&v3);
  sub_100008188();
}

void sub_1002115BC()
{
  if (sub_1000160F4("com.apple.wpantund", "default"))
  {
    if (sub_1001283D0() && sub_100128390(v0))
    {
      uint64_t v1 = __error();
      sub_100015630(v1);
      sub_1001283B4();
      int v8 = 136315394;
      int v9 = "default";
      sub_10012830C();
      sub_1001283BC();
LABEL_8:
      _os_log_error_impl(v2, v3, v4, v5, v6, v7);
    }
  }

  else if (sub_100128390((os_log_s *)&_os_log_default))
  {
    int v8 = 136315394;
    sub_1001283E4();
    int v2 = (mach_header_64 *)&_mh_execute_header;
    int v3 = (os_log_s *)&_os_log_default;
    __int16 v5 = "Logging Module is not defined for SubSystem: %s, Category: %s";
    int v6 = (uint8_t *)&v8;
    os_log_type_t v4 = OS_LOG_TYPE_ERROR;
    uint32_t v7 = 22;
    goto LABEL_8;
  }

  sub_1001283A0();
  sub_100128380();
}

void sub_1002116D8()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to dup() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_10021174C()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to posix_openpt() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_1002117C0()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to ptsname() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_100211834(int a1)
{
  uint64_t v1 = sub_1001016F8();
  sub_100015630(v1);
  sub_1001283DC();
  sub_10012831C();
  sub_100128350( (void *)&_mh_execute_header,  v2,  v3,  "Call to open(%s,O_RDWR|O_NOCTTY) failed: %s (%d)",  v4,  v5,  v6,  v7,  v8);
  sub_100128340();
}

void sub_1002118B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "FORKPTY() FAILED BUT NOTHING WAS OBVIOUSLY WRONG!!!",  v1,  2u);
  sub_100012A58();
}

void sub_1002118F0()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to unlockpt() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_100211964()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to grantpt() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_1002119D8()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "Call to access(/dev/ptmx,R_OK|W_OK) failed: %s (%d)",  v3,  v4,  v5,  v6,  v7);
  sub_1000155F0();
}

void sub_100211A4C()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688( (void *)&_mh_execute_header,  v1,  v2,  "Call to access(/dev/ptmx,F_OK) failed: %s (%d)",  v3,  v4,  v5,  v6,  v7);
  sub_1000155F0();
}

void sub_100211AC0()
{
  uint64_t v0 = sub_100015668();
  sub_100015630(v0);
  sub_1001016F8();
  sub_1001016CC();
  sub_100015688((void *)&_mh_execute_header, v1, v2, "Call to forkpty() failed: %s (%d)", v3, v4, v5, v6, v7);
  sub_1000155F0();
}

void sub_100211B34()
{
  uint64_t v0 = sub_100128398();
  sub_100015630(v0);
  sub_1001283DC();
  sub_10012831C();
  sub_100128350((void *)&_mh_execute_header, v1, v2, "Failed for fork and exec of %s: %s (%d)", v3, v4, v5, v6, v7);
  sub_100128340();
}

void sub_100211BB0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "PowerEventHandler: NCP control Interface not set",  v1,  2u);
}

void sub_100211BF0(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "lastHostWakeReason_get_cb: INVALID VALUE TYPE: [%s]",  buf,  0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100211C60()
{
}

void sub_100211C8C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100211CF0()
{
}

void sub_100211D1C()
{
}

void sub_100211D48()
{
}

void sub_100211D74( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100211DD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100211E48(void *a1, uint64_t *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  if (*a2 == *a1) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = *a2;
  }
  int v5 = 136315650;
  uint8_t v6 = "received_network_diagnostics_response";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 2080;
  uint64_t v10 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "ERROR %s got empty data in response length=%d data=%s",  (uint8_t *)&v5,  0x1Cu);
}

void sub_100211EF4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100211F68(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = 16;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "TDM: WPANTUND_v1 Error dest_addr_len=%d does not match sizeof(dest)=%d\n",  (uint8_t *)v4,  0xEu);
  sub_100008188();
}

void sub_100211FF8(os_log_t log)
{
  v1[0] = 67109378;
  v1[1] = 1238;
  __int16 v2 = 2080;
  int v3 = "xpan_id_data.size() == sizeof(xpan_id)";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/ipc-xpc/InternalIPCAPI.cpp:%d: Requirement Failed (%s)",  (uint8_t *)v1,  0x12u);
  sub_100008188();
}

void sub_100212084()
{
}

void sub_1002120AC()
{
  __assert_rtn("pop_back_n", "auto_buffer.hpp", 910, "n <= size_");
}

void sub_1002120D4()
{
  __assert_rtn("inc_slot_refcount", "connection.hpp", 114, "m_slot_refcount != 0");
}

void sub_1002120FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100212184( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100212204( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100212284(os_log_s *a1)
{
  __int16 v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_100212300(os_log_s *a1)
{
  __int16 v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_10021237C(os_log_s *a1)
{
  __int16 v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_1002123F8(os_log_s *a1)
{
  __int16 v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_100212474(os_log_s *a1)
{
  __int16 v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_1002124F0()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "(ret) == 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_10021256C(os_log_s *a1)
{
  int v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_1002125E8()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "(ret) == 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_100212664()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "reqfd >= 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_1002126E0()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "(ret) == 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_10021275C(os_log_s *a1)
{
  int v2 = sub_100015668();
  sub_100015630(v2);
  v4[0] = 67109378;
  sub_1001016E4();
  sub_10003390C( (void *)&_mh_execute_header,  a1,  v3,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)v4);
  sub_1000155F0();
}

void sub_1002127D8()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "(ret) == 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_100212854()
{
  int v2 = 67109378;
  sub_1000081B8();
  uint64_t v3 = "reqfd >= 0";
  sub_10003390C( (void *)&_mh_execute_header,  v0,  v1,  "/Library/Caches/com.apple.xbs/Sources/CoreThreadRadio/wpantund/src/util/netif-mgmt.c:%d: Requirement Failed (%s)",  (uint8_t *)&v2);
  sub_100008188();
}

void sub_1002128D0()
{
}

void sub_1002128FC()
{
}

void sub_100212968()
{
}

void sub_1002129C8()
{
}

void sub_1002129F4()
{
}

void sub_100212A20()
{
}

void sub_100212A80()
{
}

void sub_100212AE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100043870((void *)&_mh_execute_header, a1, a3, "dskeychain::AddDataSet: Empty data, len = %d", a5, a6, a7, a8, 0);
  sub_100012A58();
}

void sub_100212B48()
{
}

void sub_100212B74()
{
}

void sub_100212BA0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100212C04()
{
}

void sub_100212C30( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100212C94()
{
}

void sub_100212CC0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100212D24()
{
}

void sub_100212D50()
{
}

void sub_100212D7C()
{
}

void sub_100212DA8()
{
}

void sub_100212DD4()
{
}

void sub_100212E00()
{
}

void sub_100212E2C()
{
}

void sub_100212E58()
{
}

void sub_100212E84()
{
}

void sub_100212EB0()
{
}

void sub_100212EDC()
{
}

void sub_100212F08()
{
}

void sub_100212F34()
{
}

void sub_100212F60()
{
}

void sub_100212F8C()
{
}

void sub_100212FB8()
{
}

void sub_100212FE4()
{
}

void sub_100213010()
{
}

void sub_10021303C()
{
}

void sub_100213068()
{
}

void sub_100213094()
{
}

void sub_1002130C0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not create CtrXPCServer, verify parameters\n",  v1,  2u);
}

void sub_100213100(xpc_object_t *a1, os_log_s *a2)
{
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)buf = 136315138;
  __int16 v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Server error: %s", buf, 0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

uint64_t (***sub_1002131B4(void *a1, uint64_t *a2))()
{
  uint64_t result = &boost::system::detail::generic_cat_holder<void>::instance;
  if ((unint64_t)qword_1002C9390 >> 1 == 0x595588BD12BF6FE8LL
    || (uint64_t result = (uint64_t (***)())((BOOL (*)(uint64_t, int))boost::system::detail::generic_cat_holder<void>::instance[6])( (uint64_t)&boost::system::detail::generic_cat_holder<void>::instance,  12),  (result & 1) != 0))
  {
    uint64_t v4 = 3LL;
  }

  else
  {
    uint64_t v4 = 2LL;
  }

  *a2 = v4;
  return result;
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

id objc_msgSend_addPreferredNetworkWithCompletionInternally_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addPreferredNetworkWithCompletionInternally:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:");
}

id objc_msgSend_checkAndUpdateNetworkParamsFromMdnsScan_borderAgentID_leaderBorderAgentID_isNwFound_numAppleBRs_numThirdPartyBRs_isLeaderAppleDevice_numThreadNwsFound_shouldRunPeriodicTdm_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdParty BRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:");
}

id objc_msgSend_checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork_nwSignature_signaturePrefEntries_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "checkIfNetworkSignatureUpdateIsRequiredForPreferredNetwork:nwSignature:signaturePrefEntries:");
}

id objc_msgSend_deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deleteActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:keychainAccessGroup:completion:");
}

id objc_msgSend_deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_keychainAccessGroup_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deleteActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:keychainAccessGroup:completion:");
}

id objc_msgSend_deletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "deletePreferredNetworkForNetworkSignatureInternallyWithCompletion:ipv6NwSignature:wifiSSID:completion:");
}

id objc_msgSend_initSignaturesWithArrays_ipv4BytesLen_ipv6Bytes_ipv6BytesLen_wifSSID_wifiPassword_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initSignaturesWithArrays:ipv4BytesLen:ipv6Bytes:ipv6BytesLen:wifSSID:wifiPassword:");
}

id objc_msgSend_initWithBorderAgent_credentialsDataSet_network_credentials_uniqueIdentifier_keychainAccessGroup_creationDate_lastModificationDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithBorderAgent:credentialsDataSet:network:credentials:uniqueIdentifier:keychainAccessGroup:creationDate: lastModificationDate:");
}

id objc_msgSend_initWithMasterKey_passPhrase_PSKc_channel_PANID_userInfo_credentialDataSet_isActiveDevice_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMasterKey:passPhrase:PSKc:channel:PANID:userInfo:credentialDataSet:isActiveDevice:");
}

id objc_msgSend_initWithNetwork_credentials_uniqueIdentifier_keychainAccessGroup_creationDate_lastModificationDate_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithNetwork:credentials:uniqueIdentifier:keychainAccessGroup:creationDate:lastModificationDate:");
}

id objc_msgSend_initWithThreadNetwork_networkSignature_credentialsDataSetRecord_creationDate_lastModificationDate_userInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:");
}

id objc_msgSend_isMatchingNetworkSignature_preferredNwSignature_preferred_signaturePrefEntries_updatedPreferred_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "isMatchingNetworkSignature:preferredNwSignature:preferred:signaturePrefEntries:updatedPreferred:");
}

id objc_msgSend_keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup_count_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:count:");
}

id objc_msgSend_keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent_borderAgent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:borderAgent:");
}

id objc_msgSend_keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup_clientKeychainAccessGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:clientKeychainAccessGroup:");
}

id objc_msgSend_keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup_clientKeychainAccessGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:clientKeychainAccessGroup:");
}

id objc_msgSend_keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup_clientKeychainAccessGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:clientKeychainAccessGroup:");
}

id objc_msgSend_keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent_borderAgent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:borderAgent:");
}

id objc_msgSend_keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:");
}

id objc_msgSend_keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup_clientKeychainAccessGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:clientKeychainAccessGroup:");
}

id objc_msgSend_keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:");
}

id objc_msgSend_retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup_keychainAccessGroup_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "retrieveActiveDataSetRecordForThreadBorderAgentWithKeychainAccessGroup:keychainAccessGroup:completion:");
}

id objc_msgSend_retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup_keychainAccessGroup_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "retrieveActiveDataSetRecordWithUniqueIdentifierWithKeychainAccessGroup:keychainAccessGroup:completion:");
}

id objc_msgSend_retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup_activeFlag_compleiton_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveAllActiveDataSetRecordsWithFlagForClientKeychainAccessGroup:activeFlag:compleiton:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_snapshotWithSignature_duration_events_payload_actions_wantsRemoteCase_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithSignature:duration:events:payload:actions:wantsRemoteCase:reply:");
}

id objc_msgSend_storeThreadNetworkCredentialActiveDataSet_network_credentials_credentialsDataSet_waitForSync_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "storeThreadNetworkCredentialActiveDataSet:network:credentials:credentialsDataSet:waitForSync:completion:");
}

id objc_msgSend_updateInternalDBForTriggerBasedMetrics_isTriggerBased_triggerType_triggerId_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateInternalDBForTriggerBasedMetrics:isTriggerBased:triggerType:triggerId:");
}

id objc_msgSend_updateMeshcopRelatedParams_numAppleBRs_numThirdPartyBRs_isLeaderAppleDevice_numThreadNwsFound_shouldRunPeriodicTdm_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:");
}

id objc_msgSend_updatePreferredNetworkWithNewDataset_network_credentialsDataSet_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePreferredNetworkWithNewDataset:network:credentialsDataSet:completion:");
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return [a1 wifiSSID];
}