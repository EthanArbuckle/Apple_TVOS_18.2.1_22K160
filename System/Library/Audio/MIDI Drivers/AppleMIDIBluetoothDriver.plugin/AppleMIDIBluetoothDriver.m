void sub_27BC(std::exception *a1)
{
  void *v1;
  std::exception::~exception(a1);
  operator delete(v1);
}

const char *sub_27D0()
{
  return "CAException";
}

MIDIPacket *sub_27DC(uint64_t a1, MIDITimeStamp time, int a3, Byte *data)
{
  v7 = (MIDIPacketList *)(a1 + 48);
  size_t v8 = a3;
  result = MIDIPacketListAdd((MIDIPacketList *)(a1 + 48), 0x400uLL, *(MIDIPacket **)(a1 + 40), time, a3, data);
  if (!result)
  {
    if (!v7->numPackets
      || ((*(void (**)(uint64_t, MIDIPacketList *))(*(void *)a1 + 16LL))(a1, v7),
          v10 = MIDIPacketListInit(v7),
          (result = MIDIPacketListAdd(v7, 0x400uLL, v10, time, v8, data)) == 0LL))
    {
      v11 = sub_28C8(time, v8, data);
      (*(void (**)(uint64_t, char *))(*(void *)a1 + 16LL))(a1, v11);
      free(v11);
      *(void *)(a1 + 40) = MIDIPacketListInit(v7);
      result = MIDIPacketListInit(v7);
    }
  }

  *(void *)(a1 + 40) = result;
  return result;
}

char *sub_28C8(uint64_t a1, size_t a2, const void *a3)
{
  v6 = (char *)malloc(a2 + 14);
  *(_DWORD *)v6 = 1;
  *(void *)(v6 + 4) = a1;
  *((_WORD *)v6 + 6) = a2;
  memcpy(v6 + 14, a3, a2);
  return v6;
}

char *sub_2924(char *a1, unint64_t a2)
{
  unsigned int v2 = *a1 >> 4;
  if (v2 > 0xF) {
    goto LABEL_11;
  }
  if (((1 << v2) & 0x4F00) != 0)
  {
LABEL_3:
    v3 = a1 + 3;
    goto LABEL_6;
  }

  if (((1 << v2) & 0x3000) != 0)
  {
LABEL_5:
    v3 = a1 + 2;
    goto LABEL_6;
  }

  if (v2 == 15)
  {
    switch(*a1)
    {
      case -16:
        goto LABEL_11;
      case -15:
      case -13:
        goto LABEL_5;
      case -14:
        goto LABEL_3;
      default:
        v3 = a1 + 1;
        break;
    }
  }

  else
  {
LABEL_11:
    v5 = a1 + 1;
    do
    {
      v3 = v5;
      ++v5;
      int v6 = *v3;
    }

    while ((v6 & 0x80000000) == 0 || v6 == -9);
  }

LABEL_6:
  else {
    return v3;
  }
}

  if (v5 >= a4) {
    return a4;
  }
  else {
    return v5;
  }
}

void *sub_29C4()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DDB0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1DDB0))
  {
    sub_2B30((uint64_t)&unk_1DD48);
    __cxa_guard_release(&qword_1DDB0);
  }

  return &unk_1DD48;
}

void sub_2A20(_Unwind_Exception *a1)
{
}

uint64_t sub_2A38(const __CFString *a1, _BYTE *a2)
{
  int valuePtr = 0;
  *a2 = 0;
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFBooleanGetTypeID())
    {
      int valuePtr = CFBooleanGetValue((CFBooleanRef)a1);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }

    if (v4 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }

    if (v4 == CFStringGetTypeID())
    {
      CFStringGetCString(a1, buffer, 64LL, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }

  return valuePtr;
}

uint64_t sub_2B30(uint64_t a1)
{
  *(void *)a1 = 850045863LL;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 64) = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0LL, global_queue);
  *(void *)(a1 + 96) = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_2C18;
  handler[3] = &unk_18550;
  handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 96));
  return a1;
}

void sub_2C04(_Unwind_Exception *a1)
{
}

void sub_2C18(uint64_t a1)
{
}

void sub_2C20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  while (v2 != v3)
  {
    sub_2DE8(v2);
    v2 += 48LL;
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_2C7C(_Unwind_Exception *a1)
{
}

uint64_t sub_2C94(uint64_t a1, CFTypeRef cf1, const void *a3)
{
  uint64_t v3 = *(CFTypeRef **)(a1 + 72);
  CFTypeID v4 = *(CFTypeRef **)(a1 + 80);
  if (v3 == v4) {
    return 0LL;
  }
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4) {
      return 0LL;
    }
  }

  return 1LL;
}

void sub_2D00(uint64_t a1, const void *a2, void *a3, uint64_t a4)
{
  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((sub_2C94(a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = sub_2E68((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }

    else
    {
      sub_2F84(*(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }

    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    sub_2DE8(*(void *)(a1 + 80) - 48LL);
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_2DC8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

CFPropertyListRef sub_2DE8(uint64_t a1)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*(CFStringRef *)a1, *(CFStringRef *)(a1 + 8));
  if (result)
  {
    CFPropertyListRef v4 = result;
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      sub_34CC();
    }
    return (CFPropertyListRef)(*(uint64_t (**)(uint64_t, CFPropertyListRef *))(*(void *)v3 + 48LL))(v3, &v4);
  }

  return result;
}

uint64_t sub_2E3C(const __CFString *a1)
{
  return CFPreferencesSynchronize(a1, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

void sub_2E58(void *a1)
{
}

uint64_t sub_2E68(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x555555555555555LL) {
    sub_318C();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v5) >> 4);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v13 = 0x555555555555555LL;
  }
  else {
    unint64_t v13 = v7;
  }
  v21 = a1 + 2;
  if (v13) {
    v14 = (char *)sub_3214(v11, v13);
  }
  else {
    v14 = 0LL;
  }
  v17 = v14;
  v18 = &v14[48 * v6];
  v20 = &v14[48 * v13];
  sub_2F84(v18, a2, a3, a4);
  v19 = v18 + 48;
  sub_3118(a1, &v17);
  uint64_t v15 = a1[1];
  sub_3428(&v17);
  return v15;
}

void sub_2F70(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_2F84(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  sub_30B4((uint64_t)v10, a4);
  *a1 = v5;
  a1[1] = v6;
  if (v11)
  {
    if (v11 == v10)
    {
      a1[5] = a1 + 2;
      (*(void (**)(void *))(v10[0] + 24LL))(v10);
    }

    else
    {
      a1[5] = (*(uint64_t (**)(void))(*v11 + 16LL))();
    }

    unint64_t v7 = v11;
    if (v11 == v10)
    {
      uint64_t v8 = 4LL;
      unint64_t v7 = v10;
      goto LABEL_10;
    }

    if (v11)
    {
      uint64_t v8 = 5LL;
LABEL_10:
      (*(void (**)(void))(*v7 + 8 * v8))();
    }
  }

  else
  {
    a1[5] = 0LL;
  }

  return a1;
}

void sub_3070( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  v14 = a13;
  if (a13 == &a10)
  {
    uint64_t v15 = 4LL;
    v14 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v15 = 5LL;
  }

  (*(void (**)(void))(*(void *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_30B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

uint64_t sub_3118(uint64_t *a1, void *a2)
{
  uint64_t result = sub_3280((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void sub_318C()
{
}

void sub_31A0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_31F0(exception, a1);
}

void sub_31DC(_Unwind_Exception *a1)
{
}

std::logic_error *sub_31F0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_3214(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_3258();
  }
  return operator new(48 * a2);
}

void sub_3258()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_3280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    do
    {
      uint64_t v9 = a3 - 48;
      *(_OWORD *)(v7 - 48) = *(_OWORD *)(a3 - 48);
      sub_332C(v7 - 32, a3 - 32);
      uint64_t v7 = *((void *)&v15 + 1) - 48LL;
      *((void *)&v15 + 1) -= 48LL;
      a3 = v9;
    }

    while (v9 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_3390((uint64_t)v12);
  return v10;
}

uint64_t sub_332C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24LL))(*v3, a1);
      return a1;
    }

    *(void *)(a1 + 24) = v4;
  }

  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }

  void *v3 = 0LL;
  return a1;
}

uint64_t sub_3390(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_33C4((void *)a1);
  }
  return a1;
}

void *sub_33C4(void *result)
{
  uint64_t v1 = *(void *)(result[2] + 8LL);
  uint64_t v2 = *(void *)(result[1] + 8LL);
  while (v1 != v2)
  {
    uint64_t result = *(void **)(v1 + 40);
    if ((void *)(v1 + 16) == result)
    {
      uint64_t result = (void *)(v1 + 16);
      uint64_t v3 = 4LL;
    }

    else
    {
      if (!result) {
        goto LABEL_8;
      }
      uint64_t v3 = 5LL;
    }

    uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
LABEL_8:
    v1 += 48LL;
  }

  return result;
}

void **sub_3428(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *sub_3458(void *result)
{
  uint64_t v2 = result[1];
  uint64_t v1 = result[2];
  if (v1 != v2)
  {
    uint64_t v3 = result;
    do
    {
      v3[2] = v1 - 48;
      uint64_t result = *(void **)(v1 - 8);
      if (result == (void *)(v1 - 32))
      {
        uint64_t result = (void *)(v1 - 32);
        uint64_t v4 = 4LL;
      }

      else
      {
        if (!result)
        {
          v1 -= 48LL;
          continue;
        }

        uint64_t v4 = 5LL;
      }

      uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v4))();
      uint64_t v1 = v3[2];
    }

    while (v1 != v2);
  }

  return result;
}

void sub_34CC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_18608;
}

void sub_3504(std::exception *a1)
{
}

uint64_t sub_3518(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_18630;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0LL;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0LL);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_10B70(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_18538;
    exception[2] = v5;
  }

  return a1;
}

uint64_t sub_35A8(uint64_t a1)
{
  *(void *)a1 = off_18630;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_35DC(char *a1)
{
  *(void *)a1 = off_18630;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  operator delete(a1);
}

BOOL sub_3610(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  int v4 = pthread_equal(v2, v3);
  if (!v4)
  {
    int v5 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
    if (v5)
    {
      int v7 = v5;
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v8) {
        sub_10BA4(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18538;
      exception[2] = v7;
    }

    atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  }

  return v4 == 0;
}

void sub_36B8(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v2, v3))
  {
    atomic_store(0LL, (unint64_t *)(a1 + 16));
    int v4 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 24));
    if (v4)
    {
      int v5 = v4;
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6) {
        sub_10BD8(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18538;
      exception[2] = v5;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own",  v15,  2u);
  }
}

uint64_t sub_378C(uint64_t a1, char *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  int v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v4, v5))
  {
    char v6 = 0;
  }

  else
  {
    int v7 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 24));
    if (v7 == 16)
    {
      char v6 = 0;
      uint64_t result = 0LL;
      goto LABEL_7;
    }

    if (v7)
    {
      v11[0] = HIBYTE(v7);
      v11[1] = BYTE2(v7);
      v11[2] = BYTE1(v7);
      int v9 = v7;
      v11[3] = v7;
      v11[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10C0C((uint64_t)v11, v9);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18538;
      exception[2] = v9;
    }

    atomic_store((unint64_t)v4, (unint64_t *)(a1 + 16));
    char v6 = 1;
  }

  uint64_t result = 1LL;
LABEL_7:
  *a2 = v6;
  return result;
}

BOOL sub_3888(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 16));
  return v1 == 0;
}

BOOL sub_389C(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  return pthread_equal(v2, v3) != 0;
}

void sub_38D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_18:
  *(_WORD *)&v11->nextBufferIndex = 0;
}

  if (lastGeneratedTimestamp >= self->lastGeneratedTimestamp)
  {
    if (lastGeneratedTimestamp < receivedTime - self->averageWaitTime_ns)
    {
      sub_C65C();
      v16 = (os_log_s *)qword_1DDD8;
      if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO))
      {
        v17 = self->receivedTime - lastGeneratedTimestamp;
        *(_DWORD *)buf = 136315906;
        v24 = "BTLEMIDITimeStamper.mm";
        v25 = 1024;
        v26 = 125;
        v27 = 2048;
        *(void *)v28 = lastGeneratedTimestamp;
        *(_WORD *)&v28[8] = 2048;
        v29 = v17;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d Late timestamp %llu being applied (%llu ms in the past)",  buf,  0x26u);
      }
    }
  }

  else
  {
    sub_C65C();
    uint64_t v14 = (os_log_s *)qword_1DDD8;
    if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = self->lastGeneratedTimestamp - lastGeneratedTimestamp;
      *(_DWORD *)buf = 136315650;
      v24 = "BTLEMIDITimeStamper.mm";
      v25 = 1024;
      v26 = 122;
      v27 = 2048;
      *(void *)v28 = v15;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "%25s:%-5d Timestamp not allowed to jump backwards %llu ms.",  buf,  0x1Cu);
    }

    lastGeneratedTimestamp = self->lastGeneratedTimestamp;
  }

  sub_C65C();
  v18 = (os_log_s *)qword_1DDD8;
  if (os_log_type_enabled((os_log_t)qword_1DDD8, OS_LOG_TYPE_DEBUG))
  {
    lastReceivedOffset = self->lastReceivedOffset;
    v20 = lastGeneratedTimestamp - self->lastReceivedOffsetTimestamp;
    *(_DWORD *)buf = 136316674;
    v24 = "BTLEMIDITimeStamper.mm";
    v25 = 1024;
    v26 = 128;
    v27 = 1024;
    *(_DWORD *)v28 = v3;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = lastReceivedOffset;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = v3 - lastReceivedOffset;
    HIWORD(v29) = 2048;
    v30 = lastGeneratedTimestamp;
    v31 = 2048;
    v32 = v20;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d Generated timestamp for offset %d (lastReceivedOffset = %d, delta = %d) => %llu (delta = %llu)",  buf,  0x38u);
  }

  self->lastGeneratedTimestamp = lastGeneratedTimestamp;
  return lastGeneratedTimestamp;
}

void sub_3A44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_3A58(char **a1, __int128 *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  int v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v12 = (v7 - *a1) >> 4;
    unint64_t v13 = v12 + 1;
    uint64_t v14 = v5 - (void)*a1;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v31 = result;
    v16 = (char *)sub_40B4(result, v15);
    v18 = &v16[16 * v12];
    __int128 v19 = *a2;
    *(_OWORD *)v18 = *a2;
    if (*((void *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    v23 = *a1;
    v22 = a1[1];
    if (v22 == *a1)
    {
      int64x2_t v26 = vdupq_n_s64((unint64_t)v22);
      v24 = &v16[16 * v12];
    }

    else
    {
      v24 = &v16[16 * v12];
      do
      {
        __int128 v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(void *)v22 = 0LL;
        *((void *)v22 + 1) = 0LL;
      }

      while (v22 != v23);
      int64x2_t v26 = *(int64x2_t *)a1;
    }

    uint64_t v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    int64x2_t v29 = v26;
    v27 = a1[2];
    a1[2] = &v16[16 * v17];
    v30 = v27;
    uint64_t v28 = v26.i64[0];
    uint64_t result = sub_40E8((uint64_t)&v28);
  }

  else
  {
    *(void *)int v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    *((void *)v7 + 1) = v8;
    if (v8)
    {
      int v9 = (unint64_t *)(v8 + 8);
      do
        unint64_t v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }

    uint64_t v11 = v7 + 16;
  }

  a1[1] = v11;
  return result;
}

uint64_t sub_3B98(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  int v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return a1;
}

void sub_3D5C(void *a1)
{
  unint64_t v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0LL;
  a1[1] = 0LL;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      unint64_t v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }

void sub_3F20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_3FD4(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3)
  {
    unint64_t v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  int v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return a1;
}

void *sub_40B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_3258();
  }
  return operator new(16 * a2);
}

uint64_t sub_40E8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    sub_4400(i - 16);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_4134()
{
}

void sub_4148(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_4198(exception, a1);
}

void sub_4184(_Unwind_Exception *a1)
{
}

std::logic_error *sub_4198(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_41BC(void ***a1)
{
  unint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_4400(v4 - 16);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_422C@<X0>(uint64_t *a1@<X1>, unsigned int *a2@<X2>, void *a3@<X8>)
{
  unint64_t v6 = operator new(0x48uLL);
  uint64_t result = sub_428C(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_4278(_Unwind_Exception *a1)
{
}

void *sub_428C(void *a1, uint64_t *a2, unsigned int *a3)
{
  a1[2] = 0LL;
  *a1 = off_186B8;
  a1[1] = 0LL;
  sub_4328((uint64_t)(a1 + 3), *a2, *a3);
  return a1;
}

void sub_42CC(_Unwind_Exception *a1)
{
}

void sub_42E0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_186B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_42F4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_186B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_4318(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_4328(uint64_t a1, uint64_t a2, size_t a3)
{
  unint64_t v6 = sub_10B00((void *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_186F0;
  sub_10B3C((uint64_t)v6, a2, a3);
  return a1;
}

void sub_4388(_Unwind_Exception *a1)
{
}

uint64_t sub_439C(uint64_t a1)
{
  return a1;
}

void sub_43C4(void *a1)
{
}

uint64_t sub_43EC(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_4400(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

uint64_t sub_4458(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  uint64_t v3 = (void *)(a1 + 48);
  *(void *)(a1 + 72) = 0LL;
  unint64_t v4 = (void *)(a1 + 72);
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  *(void *)a1 = off_18718;
  *(void *)(a1 + 8) = &unk_1DB00;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1LL;
  unint64_t v13 = off_187A8;
  v14[0] = a1;
  unint64_t v5 = operator new(0x340uLL);
  void *v5 = off_18788;
  v5[1] = off_187A8;
  v5[2] = a1;
  bzero(v5 + 8, 0x300uLL);
  unint64_t v10 = v5;
  sub_469C(v4, (uint64_t *)&v10);
  uint64_t v6 = (uint64_t)v10;
  unint64_t v10 = 0LL;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
  }
  ((void (*)(void *))v13[3])(v14);
  uint64_t v11 = off_18808;
  v12[0] = a1;
  int v7 = operator new(0x340uLL);
  void *v7 = off_18788;
  v7[1] = off_18808;
  v7[2] = a1;
  bzero(v7 + 8, 0x300uLL);
  unint64_t v10 = v7;
  sub_469C(v3, (uint64_t *)&v10);
  uint64_t v8 = (uint64_t)v10;
  unint64_t v10 = 0LL;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
  }
  ((void (*)(void *))v11[3])(v12);
  return a1;
}

void sub_45F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a2) {
    sub_2E58(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_469C(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    unint64_t v5 = operator new(0x20uLL);
    void *v5 = &off_187E0;
    v5[1] = 0LL;
    v5[2] = 0LL;
    v5[3] = v4;
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  *a2 = 0LL;
  uint64_t v6 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return a1;
}

void *sub_4734(void *a1)
{
  *a1 = off_18718;
  uint64_t v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  sub_4400((uint64_t)(a1 + 9));
  sub_4400((uint64_t)(a1 + 6));
  return a1;
}

void sub_4784(void *a1)
{
  uint64_t v1 = sub_4734(a1);
  operator delete(v1);
}

uint64_t sub_4798(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[6];
  if (!v5) {
    return 7LL;
  }
  a1[4] = a3;
  a1[5] = a4;
  (*(void (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
  return 0LL;
}

uint64_t sub_47D0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7LL;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16LL))(v4, a3);
  return 0LL;
}

uint64_t sub_480C()
{
  return 0LL;
}

uint64_t sub_4814()
{
  return 0LL;
}

uint64_t sub_481C()
{
  return 0LL;
}

uint64_t sub_4824()
{
  return 0LL;
}

uint64_t sub_482C()
{
  return 0LL;
}

uint64_t sub_4834()
{
  return 0LL;
}

uint64_t sub_483C()
{
  return 0LL;
}

uint64_t sub_4844()
{
  return 0LL;
}

uint64_t sub_484C(_DWORD *a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Fu,  0xD9u,  0x4Du,  0xFu,  0x8Cu,  0x2Au,  0x48u,  0x2Au,  0x8Au,  0xD8u,  0x7Du,  0x9Eu,  0xA3u,  0x81u,  0xC9u,  0xC1u);
  if (CFEqual(v5, v6))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0LL;
    int v8 = 3;
LABEL_5:
    a1[5] = v8;
    return result;
  }

  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x43u,  0xC9u,  0x8Cu,  0x3Cu,  0x30u,  0x6Cu,  0x11u,  0xD5u,  0xAFu,  0x73u,  0,  0x30u,  0x65u,  0xA8u,  0x30u,  0x1Eu);
  if (CFEqual(v5, v9))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0LL;
    int v8 = 2;
    goto LABEL_5;
  }

  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
  if (CFEqual(v5, v10))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    return 0LL;
  }

  else
  {
    *a3 = 0LL;
    CFRelease(v5);
    return 2147483652LL;
  }

uint64_t sub_4A00(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_4A14(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 == 1) {
    (*(void (**)(uint64_t))(*(void *)(a1 - 8) + 8LL))(a1 - 8);
  }
  return v2;
}

uint64_t sub_4A4C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 16LL))(a1 - 8);
}

uint64_t sub_4A58(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 24LL))(a1 - 8);
}

uint64_t sub_4A64(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 32LL))(a1 - 8);
}

uint64_t sub_4A70(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 40LL))(a1 - 8);
}

uint64_t sub_4A7C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 48LL))(a1 - 8);
}

uint64_t sub_4A88(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 56LL))(a1 - 8);
}

uint64_t sub_4A94(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 64LL))(a1 - 8);
}

uint64_t sub_4AA0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 72LL))(a1 - 8);
}

uint64_t sub_4AAC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 80LL))(a1 - 8);
}

uint64_t sub_4AB8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 88LL))(a1 - 8);
}

void *sub_4AC4(void *a1)
{
  *a1 = off_18788;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_4B08(void *a1)
{
  *a1 = off_18788;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_4B4C(uint64_t *a1, _DWORD *a2)
{
  uint64_t v7 = a1[1];
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v8, a1 + 2);
  int v9 = 0;
  v8[6] = &v10;
  if (*a2 == 2)
  {
    v5[0] = a1;
    v5[1] = &v7;
    CFUUIDRef v6 = v5;
    sub_53D0((uint64_t)a2, (uint64_t **)&v6);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    CFUUIDRef v6 = (uint64_t **)&v7;
    v5[0] = (uint64_t *)&v6;
    sub_4C7C((uint64_t)a2, v5);
  }

  return sub_5BEC((uint64_t)&v7);
}

void sub_4C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_4C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

uint64_t sub_4C7C(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v11[0] = v5 + 12;
      v11[1] = v6;
      v11[2] = *(void *)v5;
      v11[3] = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t result = sub_4D48(v11, &v10, &v8);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v13 = v10;
          v12[0] = *v7;
          v12[1] = (uint64_t)&v13;
          sub_4DF4((unsigned __int16 *)&v8, v12);
          uint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
          uint64_t result = sub_4D48(v11, &v10, &v8);
        }

        while ((result & 1) != 0);
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

uint64_t sub_4D48(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_13009[v7 >> 28];
  if (v8 > v3) {
    return 0LL;
  }
  *a2 = a1[2];
  switch((uint64_t)(v5 + 4 * v8 - (void)v6) >> 2)
  {
    case 0LL:
      goto LABEL_9;
    case 1LL:
      goto LABEL_8;
    case 2LL:
      goto LABEL_7;
    case 3LL:
      goto LABEL_6;
    case 4LL:
      *a3++ = v7;
      unsigned int v10 = v6[1];
      ++v6;
      LODWORD(v7) = v10;
LABEL_6:
      *a3++ = v7;
      unsigned int v11 = v6[1];
      ++v6;
      LODWORD(v7) = v11;
LABEL_7:
      *a3++ = v7;
      LODWORD(v7) = v6[1];
LABEL_8:
      *a3 = v7;
LABEL_9:
      a1[3] = v8;
      uint64_t result = 1LL;
      break;
    default:
      std::terminate();
      return result;
  }

  return result;
}

unsigned __int16 *sub_4DF4(unsigned __int16 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v32[0] = bswap32(v3);
    v32[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0LL;
      if (!(_DWORD)v13) {
        goto LABEL_39;
      }
    }

    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1LL;
      if (!(_DWORD)v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v25 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v26 = v7 + 1088;
        int v27 = *(_DWORD *)(v7 + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v25 && *(unsigned __int8 *)(v28 + v9 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v28 + 10 <= v26) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }

          unint64_t v9 = (v9 + v28 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v26)
        {
          LODWORD(v28) = 0;
          *(_DWORD *)(v7 + 64) = v27 + 1;
          *(void *)unint64_t v9 = v25;
          *(_WORD *)(v9 + 8) = 0;
LABEL_54:
          uint64_t result = (unsigned __int16 *)(v9 + v28 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_64;
            case 2uLL:
              goto LABEL_63;
            case 3uLL:
              goto LABEL_62;
            case 4uLL:
LABEL_61:
              p_src = (unsigned __int8 *)&v34;
              *(_BYTE *)uint64_t result = __src;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_62:
              char v30 = *p_src++;
              *(_BYTE *)uint64_t result = v30;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_63:
              char v31 = *p_src++;
              *(_BYTE *)uint64_t result = v31;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_64:
              *(_BYTE *)uint64_t result = *p_src;
              break;
            default:
LABEL_68:
              uint64_t result = (unsigned __int16 *)memmove(result, &__src, v6);
              break;
          }

          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_66;
        }

LABEL_52:
        uint64_t result = (unsigned __int16 *)sub_5230(v7, v25, (char *)&__src, v6);
LABEL_58:
        unint64_t v9 = (unint64_t)result;
LABEL_66:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }

    memcpy(&__src + v6, (char *)v32 + 2, v13);
    v6 += (v13 - 1) + 1LL;
    goto LABEL_39;
  }

  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v34 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2LL;
    }
    else {
      size_t v17 = 3LL;
    }
    if (v16 != 12582912) {
      char v35 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    uint64_t result = *(unsigned __int16 **)(*a2 + 56);
    unint64_t v20 = *a2 + 1088;
    int v21 = *(_DWORD *)(*a2 + 64);
    if (v21)
    {
      uint64_t v22 = result[4];
      if (*(void *)result == v19 && BYTE2(v3) != 240 && *((unsigned __int8 *)result + v22 + 9) != 247)
      {
        goto LABEL_33;
      }

      uint64_t result = (unsigned __int16 *)(((unint64_t)result + v22 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    }

    if ((unint64_t)result + v17 + 10 <= v20)
    {
      LODWORD(v22) = 0;
      *(_DWORD *)(v18 + 64) = v21 + 1;
      *(void *)uint64_t result = v19;
      result[4] = 0;
LABEL_35:
      v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        v24 = &__src;
      }

      else
      {
        v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        v23 = (unsigned __int8 *)result + v22 + 11;
      }

      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }

        uint64_t result = (unsigned __int16 *)sub_5230(v7, v25, (char *)&__src, v6);
LABEL_58:
        unint64_t v9 = (unint64_t)result;
LABEL_66:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }

    memcpy(&__src + v6, (char *)v32 + 2, v13);
    v6 += (v13 - 1) + 1LL;
    goto LABEL_39;
  }

  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v34 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2LL;
    }
    else {
      size_t v17 = 3LL;
    }
    if (v16 != 12582912) {
      char v35 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    uint64_t result = *(unsigned __int16 **)(*a2 + 56);
    unint64_t v20 = *a2 + 1088;
    int v21 = *(_DWORD *)(*a2 + 64);
    if (v21)
    {
      uint64_t v22 = result[4];
      if (*(void *)result == v19 && BYTE2(v3) != 240 && *((unsigned __int8 *)result + v22 + 9) != 247)
      {
        goto LABEL_33;
      }

      uint64_t result = (unsigned __int16 *)(((unint64_t)result + v22 + 13) & 0xFFFFFFFFFFFFFFFCLL);
    }

    if ((unint64_t)result + v17 + 10 <= v20)
    {
      LODWORD(v22) = 0;
      *(_DWORD *)(v18 + 64) = v21 + 1;
      *(void *)uint64_t result = v19;
      result[4] = 0;
LABEL_35:
      v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        v24 = &__src;
      }

      else
      {
        v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        v23 = (unsigned __int8 *)result + v22 + 11;
      }

      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }

LABEL_33:
    uint64_t result = (unsigned __int16 *)sub_5230(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    unsigned int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_1DB70[v5];
      if (byte_1DB70[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if ((_DWORD)v6 != 1)
        {
          char v34 = BYTE1(v3) & 0x7F;
        }

        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v12 + v9 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_60;
            }
LABEL_57:
            uint64_t result = (unsigned __int16 *)sub_5230(v7, v8, (char *)&__src, v6);
            goto LABEL_58;
          }

          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_60:
          uint64_t result = (unsigned __int16 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_64;
            case 2:
              goto LABEL_63;
            case 3:
              goto LABEL_62;
            case 4:
              goto LABEL_61;
            default:
              goto LABEL_68;
          }
        }

        goto LABEL_57;
      }
    }
  }

  return result;
}

    uint64_t result = (unsigned __int16 *)sub_5230(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    unsigned int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_1DB70[v5];
      if (byte_1DB70[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if ((_DWORD)v6 != 1)
        {
          char v34 = BYTE1(v3) & 0x7F;
        }

        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v12 + v9 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_60;
            }
LABEL_57:
            uint64_t result = (unsigned __int16 *)sub_5230(v7, v8, (char *)&__src, v6);
            goto LABEL_58;
          }

          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_60:
          uint64_t result = (unsigned __int16 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_64;
            case 2:
              goto LABEL_63;
            case 3:
              goto LABEL_62;
            case 4:
              goto LABEL_61;
            default:
              goto LABEL_68;
          }
        }

        goto LABEL_57;
      }
    }
  }

  return result;
}

uint64_t sub_5230(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  if (*(_DWORD *)(a1 + 64)
    && (uint64_t v16 = a1 + 64,
        (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16),
        *(_DWORD *)(a1 + 64) = 0,
        uint64_t v8 = a1 + 68,
        a1 + 68 + a4 + 10 <= a1 + 1088))
  {
    *(_DWORD *)(a1 + 64) = 1;
    *(void *)(a1 + 68) = a2;
    *(_WORD *)(a1 + 76) = 0;
    unint64_t v9 = (char *)(a1 + 78);
    __int16 v10 = 0;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_8;
      case 2uLL:
        goto LABEL_7;
      case 3uLL:
        goto LABEL_6;
      case 4uLL:
        char v11 = *a3++;
        unint64_t v9 = (char *)(a1 + 79);
        *(_BYTE *)(a1 + 78) = v11;
LABEL_6:
        char v12 = *a3++;
        *v9++ = v12;
LABEL_7:
        char v13 = *a3++;
        *v9++ = v13;
LABEL_8:
        *unint64_t v9 = *a3;
        __int16 v10 = *(_WORD *)(a1 + 76);
        break;
      default:
        if (a4) {
          memmove(v9, a3, a4);
        }
        __int16 v10 = 0;
        break;
    }

    *(_WORD *)(a1 + 76) = v10 + a4;
  }

  else
  {
    MIDI::LegacyPacketList::create(&v15, 1LL, a2, a3, a4);
    uint64_t v16 = v15;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16);
    sub_53A8(&v15, 0LL);
    uint64_t v8 = a1 + 68;
    *(void *)(a1 + 56) = a1 + 68;
    *(_DWORD *)(a1 + 64) = 0;
    sub_53A8(&v15, 0LL);
  }

  return v8;
}

void sub_5390( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_53A8(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  void *result = a2;
  if (v3) {
    return (uint64_t *)MIDI::LegacyPacketListDeleter::operator()();
  }
  return result;
}

uint64_t sub_53D0(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v12[0] = v5 + 12;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t result = sub_4D48(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          *(void *)&__int128 v13 = v7[1];
          *((void *)&v13 + 1) = &v14;
          sub_54A0((unsigned __int16 *)(v8 + 64), (unsigned __int16 *)&v9, &v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t result = sub_4D48(v12, &v11, &v9);
        }

        while ((result & 1) != 0);
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

unsigned __int16 *sub_54A0(unsigned __int16 *result, unsigned __int16 *a2, __int128 *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    __int128 v29 = *a3;
    uint64_t v5 = a2;
    return sub_57B0(v5, (uint64_t *)&v29);
  }

  else if (v3 >> 28 == 4)
  {
    unsigned int v6 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v7 = *((_DWORD *)a2 + 1);
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        uint64_t v10 = &result[24 * (BYTE3(v3) & 0xF)];
        uint64_t v11 = (v3 >> 16) & 0xF;
        char v12 = (unsigned __int8 *)v10 + 3 * v11;
        unsigned int v13 = (v3 >> 8) & 0x7F;
        int v14 = *(_DWORD *)a2 & 0x7F;
        int v15 = (v7 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        if (v16 == *v12 && v13 == v12[1])
        {
          int v17 = v11 | 0xB0;
          if (v14 == *((unsigned __int8 *)v10 + 3 * v11 + 2))
          {
            int v18 = (v6 << 24) | (v17 << 16);
            goto LABEL_22;
          }
        }

        else
        {
          int v17 = v11 | 0xB0;
        }

        if ((v3 & 0x100000) != 0) {
          int v19 = 25344;
        }
        else {
          int v19 = 25856;
        }
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        int v18 = (v6 << 24) | (v17 << 16);
        int v20 = v18 | v19;
        char v26 = v13;
        *(void *)int v27 = v18 | v19 | v13;
        __int128 v29 = *a3;
        sub_57B0((unsigned __int16 *)v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = (v20 | v14) - 256;
        __int128 v29 = *a3;
        sub_57B0((unsigned __int16 *)v27, (uint64_t *)&v29);
        *char v12 = v16;
        int v21 = (char *)v10 + 3 * v11;
        v21[1] = v26;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = v18 | (v7 >> 25) | 0x600;
        __int128 v29 = *a3;
        uint64_t result = sub_57B0((unsigned __int16 *)v27, (uint64_t *)&v29);
        if (v15)
        {
          int v28 = 0;
          *(void *)&v27[4] = 0LL;
          int v8 = v15 | v18;
          int v9 = 9728;
          goto LABEL_24;
        }

        break;
      case 8:
      case 9:
      case 10:
      case 11:
        int v8 = v7 >> 25;
        if (!(v7 >> 25)) {
          int v8 = BYTE2(v3) >> 4 == 9;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v9 = (BYTE2(v3) << 16) | (v6 << 24) | v3 & 0x7F00;
LABEL_24:
        int v22 = v8 | v9;
        goto LABEL_25;
      case 12:
        if ((v3 & 1) != 0)
        {
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
          int v25 = (v24 - 0x100000) | (v6 << 24);
          *(void *)int v27 = (v24 - 0x100000) & 0xFFFFFF80 | (v6 << 24) | (v7 >> 8) & 0x7F;
          __int128 v29 = *a3;
          sub_57B0((unsigned __int16 *)v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)int v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          __int128 v29 = *a3;
          sub_57B0((unsigned __int16 *)v27, (uint64_t *)&v29);
        }

        else
        {
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
        }

        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = HIWORD(v7) & 0x7F00 | v23 | v24;
        goto LABEL_25;
      case 13:
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25 << 8);
        goto LABEL_25;
      case 14:
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = (v7 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25);
LABEL_25:
        *(_DWORD *)int v27 = v22;
        __int128 v29 = *a3;
        uint64_t v5 = (unsigned __int16 *)v27;
        return sub_57B0(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }

  return result;
}

unsigned __int16 *sub_57B0(unsigned __int16 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v32[0] = bswap32(v3);
    v32[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0LL;
      if (!(_DWORD)v13) {
        goto LABEL_39;
      }
    }

    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1LL;
      if (!(_DWORD)v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v25 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v26 = v7 + 1088;
        int v27 = *(_DWORD *)(v7 + 64);
        if (v27)
        {
          uint64_t v28 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v25 && *(unsigned __int8 *)(v28 + v9 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v28 + 10 <= v26) {
              goto LABEL_54;
            }
            goto LABEL_52;
          }

          unint64_t v9 = (v9 + v28 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v26)
        {
          LODWORD(v28) = 0;
          *(_DWORD *)(v7 + 64) = v27 + 1;
          *(void *)unint64_t v9 = v25;
          *(_WORD *)(v9 + 8) = 0;
LABEL_54:
          uint64_t result = (unsigned __int16 *)(v9 + v28 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_64;
            case 2uLL:
              goto LABEL_63;
            case 3uLL:
              goto LABEL_62;
            case 4uLL:
LABEL_61:
              p_src = (unsigned __int8 *)&v34;
              *(_BYTE *)uint64_t result = __src;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_62:
              char v30 = *p_src++;
              *(_BYTE *)uint64_t result = v30;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_63:
              char v31 = *p_src++;
              *(_BYTE *)uint64_t result = v31;
              uint64_t result = (unsigned __int16 *)((char *)result + 1);
LABEL_64:
              *(_BYTE *)uint64_t result = *p_src;
              break;
            default:
LABEL_68:
              uint64_t result = (unsigned __int16 *)memmove(result, &__src, v6);
              break;
          }

          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_66;
        }

uint64_t sub_5BEC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }

  *(_DWORD *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a1 + 68;
  (*(void (**)(uint64_t))(*(void *)a1 + 24LL))(a1 + 8);
  return a1;
}

uint64_t sub_5C5C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72LL))( *a1,  *(unsigned int *)(*a1 + 64LL),  *a2);
}

void *sub_5C74(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *sub_5C80(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void sub_5C94(std::__shared_weak_count *a1)
{
}

uint64_t sub_5CA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_5CC4(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48LL))( *a1,  *a2,  *(void *)(*a1 + 32LL),  *(void *)(*a1 + 40LL));
}

void *sub_5CDC(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void *sub_5CE8(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

void sub_5DB0()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DDC0);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_1DDC0))
    {
      qword_1DDB8 = (uint64_t)os_log_create("com.apple.coremidi", "blecen");
      __cxa_guard_release(&qword_1DDC0);
    }
  }

LABEL_38:
    uint64_t v28 = -[BLEMIDIDriverCentral peripheralWithUUID:](self, "peripheralWithUUID:", a3);
    if (!v28)
    {
LABEL_46:
      sub_5DB0();
      char v31 = qword_1DDB8;
      if (!os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      v43 = 1024;
      v44 = 207;
      v45 = 2112;
      v46 = a3;
      v32 = "%25s:%-5d ERROR: Found the device, but couldn't locate a peripheral with UUID %@";
      v33 = (os_log_s *)v31;
      char v34 = OS_LOG_TYPE_ERROR;
LABEL_50:
      _os_log_impl(&dword_0, v33, v34, v32, buf, 0x1Cu);
      return;
    }

LABEL_39:
    -[NSMutableArray addObject:](self->peripheralsToConnect, "addObject:", v28);
    sub_5DB0();
    __int128 v29 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      v43 = 1024;
      v44 = 204;
      v45 = 2112;
      v46 = a3;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "%25s:%-5d connectPeripheral: UUID %@", buf, 0x1Cu);
    }

    centralManager = self->centralManager;
    unint64_t v26 = v28;
LABEL_42:
    -[CBCentralManager connectPeripheral:options:](centralManager, "connectPeripheral:options:", v26, 0LL);
    return;
  }

  if (v12)
  {
    *(_DWORD *)buf = 136315650;
    v42 = "BTLEMIDIDriverCentral.mm";
    v43 = 1024;
    v44 = 219;
    v45 = 2112;
    v46 = a3;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%25s:%-5d Creating a new MIDI device for peripheral with UUID %@.",  buf,  0x1Cu);
  }

  int v21 = -[BLEMIDIDriverCentral createDevice:](self, "createDevice:", a3);
  if ((_DWORD)v21)
  {
    -[BLEMIDIDriverCentral checkChangeDeviceName:withName:](self, "checkChangeDeviceName:withName:", v21, a4);
    uint64_t v22 = -[BLEMIDIDriverCentral peripheralWithUUID:](self, "peripheralWithUUID:", a3);
    if (!v22)
    {
      sub_5DB0();
      char v35 = qword_1DDB8;
      if (!os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      v43 = 1024;
      v44 = 232;
      v45 = 2112;
      v46 = a3;
      v32 = "%25s:%-5d WARNING: Created a device, but couldn't locate a peripheral with UUID %@";
      v33 = (os_log_s *)v35;
      char v34 = OS_LOG_TYPE_INFO;
      goto LABEL_50;
    }

    unsigned int v23 = v22;
    -[NSMutableArray addObject:](self->peripheralsToConnect, "addObject:", v22);

    sub_5DB0();
    int v24 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "BTLEMIDIDriverCentral.mm";
      v43 = 1024;
      v44 = 229;
      v45 = 2112;
      v46 = a3;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%25s:%-5d connectPeripheral: UUID %@", buf, 0x1Cu);
    }

    centralManager = self->centralManager;
    unint64_t v26 = v23;
    goto LABEL_42;
  }

void sub_6BF4( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    sub_5DB0();
    size_t v17 = (os_log_s *)qword_1DDB8;
    if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "BTLEMIDIDriverCentral.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 245;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: retrieveConnectedPeripheralsWithServices threw an exception.",  (uint8_t *)&buf,  0x12u);
    }

    __cxa_end_catch();
    JUMPOUT(0x6BC0LL);
  }

  _Unwind_Resume(a1);
}

LABEL_26:
      if (v17 == (id)++v19)
      {
        size_t v17 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (!v17) {
          return;
        }
        goto LABEL_16;
      }
    }

    if (!objc_msgSend( objc_msgSend(v20, "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"2A24"))) {
      goto LABEL_26;
    }
    [a3 readValueForCharacteristic:v20];
    sub_5DB0();
    int v24 = qword_1DDB8;
    if (!os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = v31;
    v42 = "BTLEMIDIDriverCentral.mm";
    v43 = 1024;
    v44 = 734;
    v45 = 2112;
    *(void *)v46 = a3;
    uint64_t v22 = (os_log_s *)v24;
    unsigned int v23 = "%25s:%-5d Discovered model number for %@";
    goto LABEL_25;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  uint64_t v8 = [a4 characteristics];
  unint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (!v9) {
    goto LABEL_10;
  }
  unint64_t v10 = v9;
  int v11 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v8);
      }
      if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)i), "UUID"),  "isEqual:",  +[CBUUID UUIDWithString:]( CBUUID,  "UUIDWithString:",  @"7772E5DB-3868-4112-A1A9-F2669D106BF3")))
      {
        -[CBCentralManager setDesiredConnectionLatency:forPeripheral:]( self->centralManager,  "setDesiredConnectionLatency:forPeripheral:",  -1LL,  a3);
        uint64_t v25 = [a3 mtuLength] - 3;
        sub_5DB0();
        unint64_t v26 = (os_log_s *)qword_1DDB8;
        int v27 = os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO);
        if ((int)v25 < 21)
        {
          uint64_t v25 = 20LL;
          if (!v27) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136315906;
          v42 = "BTLEMIDIDriverCentral.mm";
          v43 = 1024;
          v44 = 703;
          v45 = 1024;
          *(_DWORD *)v46 = 20;
          *(_WORD *)&v46[4] = 2112;
          *(void *)&v46[6] = a3;
          uint64_t v28 = "%25s:%-5d Keeping mtu value of %d bytes for peripheral: %@";
        }

        else
        {
          if (!v27) {
            goto LABEL_35;
          }
          *(_DWORD *)buf = 136315906;
          v42 = "BTLEMIDIDriverCentral.mm";
          v43 = 1024;
          v44 = 701;
          v45 = 1024;
          *(_DWORD *)v46 = v25;
          *(_WORD *)&v46[4] = 2112;
          *(void *)&v46[6] = a3;
          uint64_t v28 = "%25s:%-5d Updating packet size to mtu value of %d bytes for peripheral: %@";
        }

        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, v28, buf, 0x22u);
LABEL_35:
        __int128 v29 = +[BLEMIDIAccessor midiDeviceForUUID:]( BLEMIDIAccessor,  "midiDeviceForUUID:",  objc_msgSend(objc_msgSend(a3, "identifier"), "UUIDString"));
        if ((_DWORD)v29)
        {
          -[BLEMIDIDriverCentral connectDevice:withMTU:](self, "connectDevice:withMTU:", v29, v25);
        }

        else
        {
          sub_5DB0();
          char v30 = (os_log_s *)qword_1DDB8;
          if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v42 = "BTLEMIDIDriverCentral.mm";
            v43 = 1024;
            v44 = 719;
            v45 = 2112;
            *(void *)v46 = a3;
            _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "%25s:%-5d Can't find a MIDI device for %@. Was activateUUID called?",  buf,  0x1Cu);
          }
        }

        return;
      }
    }

    unint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v10) {
      continue;
    }
    break;
  }

LABEL_10:
  sub_5DB0();
  size_t v13 = (os_log_s *)qword_1DDB8;
  if (os_log_type_enabled((os_log_t)qword_1DDB8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v42 = "BTLEMIDIDriverCentral.mm";
    v43 = 1024;
    v44 = 710;
    v45 = 2112;
    *(void *)v46 = a3;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "%25s:%-5d MIDI Service not discovered on %@. Disconnecting ...",  buf,  0x1Cu);
  }

  -[CBCentralManager cancelPeripheralConnection:](self->centralManager, "cancelPeripheralConnection:", a3);
}

void sub_A030()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DDD0);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_1DDD0))
    {
      qword_1DDC8 = (uint64_t)os_log_create("com.apple.coremidi", "blelcp");
      __cxa_guard_release(&qword_1DDD0);
    }
  }

id sub_B9C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendIfReady];
}

id sub_C2B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendIfReady];
}

void sub_C65C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DDE0);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_1DDE0))
    {
      qword_1DDD8 = (uint64_t)os_log_create("com.apple.coremidi", "btlets");
      __cxa_guard_release(&qword_1DDE0);
    }
  }

void sub_CE2C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DDF0);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_1DDF0))
    {
      qword_1DDE8 = (uint64_t)os_log_create("com.apple.coremidi", "btdrcv");
      __cxa_guard_release(&qword_1DDF0);
    }
  }

LABEL_59:
  self->packetEmitter.mCurPacket = MIDIPacketListInit((MIDIPacketList *)self->packetEmitter.mBuf);
}

uint64_t sub_D768(MIDIPacketList *pktlist)
{
  *(void *)&pktlist->numPackets = &off_18890;
  uint64_t v2 = (MIDIPacketList *)&pktlist->packet[0].data[34];
  if (*(_DWORD *)&pktlist->packet[0].data[34])
  {
    MIDIEndpointRef v3 = *(_DWORD *)&pktlist[3].packet[0].data[242];
    if (v3) {
      MIDIReceived(v3, v2);
    }
    pktlist[3].packet[0].data[246] = 0;
  }

  *(void *)&pktlist->packet[0].data[26] = MIDIPacketListInit(v2);
  return sub_D7C8((uint64_t)pktlist);
}

uint64_t sub_D7C8(uint64_t a1)
{
  *(void *)a1 = off_188B8;
  if (*(_DWORD *)(a1 + 48)) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  uint64_t v2 = (void *)(a1 + 8);
  MIDIEndpointRef v3 = *(void **)(a1 + 32);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    MIDIEndpointRef v3 = v2;
    goto LABEL_6;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_6:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_D858(MIDIPacketList *a1)
{
  int v1 = (void *)sub_D768(a1);
  operator delete(v1);
}

uint64_t sub_D86C(uint64_t a1, const MIDIPacketList *a2)
{
  uint64_t result = *(unsigned int *)(a1 + 1072);
  if ((_DWORD)result) {
    uint64_t result = MIDIReceived(result, a2);
  }
  *(_BYTE *)(a1 + 1076) = 0;
  return result;
}

void sub_D89C(uint64_t a1)
{
  int v1 = (void *)sub_D7C8(a1);
  operator delete(v1);
}

uint64_t sub_D8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    sub_34CC();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48LL))(v2, &v4);
}

uint64_t sub_D8E8(uint64_t a1)
{
  uint64_t v2 = sub_D944(a1);
  *(void *)uint64_t v2 = &off_18890;
  *(_DWORD *)(v2 + 1072) = 0;
  *(_BYTE *)(v2 + 1076) = 0;
  *(void *)(a1 + 40) = MIDIPacketListInit((MIDIPacketList *)(v2 + 48));
  return a1;
}

void sub_D930(_Unwind_Exception *a1)
{
}

uint64_t sub_D944(uint64_t a1)
{
  *(void *)a1 = off_188B8;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = MIDIPacketListInit((MIDIPacketList *)(a1 + 48));
  return a1;
}

void sub_D984(_Unwind_Exception *exception_object)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)(v2 + 8);
  int v5 = *(void **)(v2 + 32);
  if (v5 == (void *)(v2 + 8))
  {
    uint64_t v6 = 4LL;
    int v5 = v4;
  }

  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v6 = 5LL;
  }

  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t sub_D9C4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_188E0;
  *(void *)(a1 + 8) = a2;
  sub_35A4(a1 + 16, "BLEMIDIDataSender.mWriteQueueMutex");
  *(void *)(a1 + 104) = a1 + 104;
  *(void *)(a1 + 112) = a1 + 104;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 128) = 0LL;
  *(void *)(a1 + 136) = 11250000LL;
  *(_BYTE *)(a1 + 2144) = 0;
  *(_BYTE *)(a1 + 144) = 0;
  return a1;
}

void *sub_DA1C(void *a1)
{
  *a1 = off_188E0;
  if (a1[16]) {
    MIDITimerTaskDispose();
  }
  sub_E894(a1 + 13);
  sub_35A8((uint64_t)(a1 + 2));
  return a1;
}

uint64_t sub_DA6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    return *(void *)(v1 + 112);
  }
  else {
    return 0LL;
  }
}

BOOL sub_DA84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  return !v1 || *(_BYTE *)(v1 + 88) != 0;
}

void sub_DAA4(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 16LL))(a1 + 16);
  *(void *)(a1 + 128) = MIDITimerTaskCreate(sub_DBEC, a1);
  sub_DC84();
  uint64_t v4 = (os_log_s *)qword_1DDF8;
  if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 128);
    int v6 = 136315650;
    uint64_t v7 = "BTLEMIDIDataSender.mm";
    __int16 v8 = 1024;
    int v9 = 67;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Created mWriteSignalTimer = %p", (uint8_t *)&v6, 0x1Cu);
  }

  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
}

void sub_DBB4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_2E58(exception_object);
}

void sub_DBEC(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 16LL))(a1 + 16);
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 8LL))(a1) & 1) == 0)
  {
    sub_E4A4((uint64_t *)a1);
    *(_BYTE *)(a1 + 2144) = 0;
  }

  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
}

void sub_DC60(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_DC84()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DE00);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_1DE00))
    {
      qword_1DDF8 = (uint64_t)os_log_create("com.apple.coremidi", "btdsnd");
      __cxa_guard_release(&qword_1DE00);
    }
  }

void *sub_DCE0(void *a1)
{
  int v2 = a1 + 2;
  int v3 = (*(uint64_t (**)(void *))(a1[2] + 16LL))(a1 + 2);
  if (v2[14])
  {
    sub_DC84();
    uint64_t v4 = (os_log_s *)qword_1DDF8;
    if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = a1[16];
      int v7 = 136315650;
      __int16 v8 = "BTLEMIDIDataSender.mm";
      __int16 v9 = 1024;
      int v10 = 76;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d Disposing of mWriteSignalTimer %p",  (uint8_t *)&v7,  0x1Cu);
    }

    MIDITimerTaskDispose(a1[16]);
    a1[16] = 0LL;
  }

  uint64_t result = sub_E8E0(a1 + 13);
  if (v3) {
    return (void *)(*(uint64_t (**)(void *))(*v2 + 24LL))(v2);
  }
  return result;
}

void sub_DDF8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_2E58(exception_object);
}

uint64_t sub_DE30(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 4294956463LL;
  }
  uint64_t v24 = a1 + 16;
  int v25 = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16LL))();
  int v8 = *a2;
  if (*a2 >= 1)
  {
    unint64_t v9 = (unint64_t)(a2 + 1);
    int v10 = (uint64_t *)(a1 + 104);
    do
    {
      uint64_t v11 = *(void *)v9;
      size_t v12 = *(unsigned __int16 *)(v9 + 8);
      if (v12 > 0x40)
      {
        size_t v13 = malloc(*(unsigned __int16 *)(v9 + 8));
        memcpy(v13, (const void *)(v9 + 10), v12);
      }

      else
      {
        memcpy(__dst, (const void *)(v9 + 10), *(unsigned __int16 *)(v9 + 8));
        size_t v13 = 0LL;
      }

      *((void *)&v27 + 1) = a4;
      uint64_t v28 = 0LL;
      *(void *)&__int128 v27 = a3;
      if (!v11) {
        uint64_t v11 = mach_absolute_time();
      }
      unsigned int v14 = (uint64_t *)(a1 + 104);
      if (*(uint64_t **)(a1 + 112) != v10)
      {
        unsigned int v14 = *(uint64_t **)(a1 + 112);
        while (v14[2] <= v11)
        {
          unsigned int v14 = (uint64_t *)v14[1];
          if (v14 == v10)
          {
            unsigned int v14 = (uint64_t *)(a1 + 104);
            break;
          }
        }
      }

      unsigned int v15 = (char *)operator new(0x80uLL);
      __int128 v16 = __dst[3];
      *(_OWORD *)(v15 + 72) = __dst[2];
      *(_OWORD *)(v15 + 88) = v16;
      *(_OWORD *)(v15 + 104) = v27;
      __int128 v17 = __dst[1];
      *(_OWORD *)(v15 + 40) = __dst[0];
      *((void *)v15 + 2) = v11;
      *((_DWORD *)v15 + 6) = v12;
      *((void *)v15 + 4) = v13;
      *((void *)v15 + 15) = v28;
      *(_OWORD *)(v15 + 56) = v17;
      uint64_t v18 = *v14;
      *(void *)(v18 + 8) = v15;
      *(void *)unsigned int v15 = v18;
      uint64_t *v14 = (uint64_t)v15;
      *((void *)v15 + 1) = v14;
      ++*(void *)(a1 + 120);
      unint64_t v9 = (v9 + *(unsigned __int16 *)(v9 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
    }

    while (v8-- > 1);
  }

  if (!*(_BYTE *)(a1 + 2144))
  {
    *(_BYTE *)(a1 + 2144) = 1;
    uint64_t v20 = *(void *)(a1 + 128);
    uint64_t v21 = mach_absolute_time();
    uint64_t v22 = __udivti3( 3LL * *(void *)(a1 + 136),  (*(unint64_t *)(a1 + 136) * (unsigned __int128)3uLL) >> 64,  125LL,  0LL);
    MIDITimerTaskSetNextWakeTime(v20, v21 + v22);
  }

  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v24 + 24LL))(v24);
  }
  return 0LL;
}

void sub_E040( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_2E58(exception_object);
}

void sub_E084(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  uint64_t v6 = *(unsigned int *)(a2 + 40);
  int v7 = *(_BYTE **)(a2 + 24);
  __int16 v54 = 0;
  if (v7 == *(_BYTE **)(a2 + 24))
  {
    *(_OWORD *)a3 = *(_OWORD *)(a1[14] + 104);
    if ((_DWORD)v6) {
      goto LABEL_5;
    }
LABEL_65:
    LODWORD(v6) = 0;
    goto LABEL_66;
  }

  if (!(_DWORD)v6) {
    goto LABEL_65;
  }
LABEL_5:
  BOOL v8 = 0;
  uint64_t v9 = 0LL;
  int v10 = 0;
  uint64_t v11 = a1 + 13;
  size_t v12 = &CBCentralManagerOptionReceiveSystemEvents_ptr;
  while (1)
  {
    size_t v13 = (uint64_t *)a1[14];
    if (v13 == v11) {
      goto LABEL_66;
    }
    while (v13[13] != *a3 || v13[14] != a3[1])
    {
      size_t v13 = (uint64_t *)v13[1];
      if (v13 == v11) {
        goto LABEL_66;
      }
    }

    if (v13 == v11) {
      goto LABEL_66;
    }
    unsigned int v14 = (uint64_t *)v13[4];
    if (v14) {
      unsigned int v15 = (uint64_t *)v13[4];
    }
    else {
      unsigned int v15 = v13 + 5;
    }
    uint64_t v16 = v13[15];
    int v52 = v10;
    BOOL v53 = v8;
    v50 = v15;
    uint64_t v51 = v9;
    uint64_t v17 = v16;
    if (v7 == *(_BYTE **)(a2 + 24))
    {
      objc_msgSend( v12[50],  "splitOffset:intoHeaderByte:timeStampByte:",  objc_msgSend(v12[50], "timeStampOffset:", v13[2]),  (char *)&v54 + 1,  &v54);
      uint64_t v16 = v17;
      unsigned int v15 = v50;
      *v7++ = HIBYTE(v54);
      --v6;
      unsigned int v14 = (uint64_t *)v13[4];
      uint64_t v17 = v13[15];
    }

    uint64_t v48 = v16;
    int v46 = *((char *)v15 + v16);
    if (!v14) {
      unsigned int v14 = v13 + 5;
    }
    int v18 = (_DWORD)v14 + v17;
    uint64_t v19 = *((int *)v13 + 6);
    uint64_t v20 = sub_2924((char *)v14 + v17, (unint64_t)v14 + v19);
    int v21 = (_DWORD)v20 - v18;
    if (v17 == v19) {
      int v21 = 0;
    }
    BOOL v23 = *(v20 - 1) == 247 && v21 > 1;
    LODWORD(v24) = v21 - v23;
    uint64_t v25 = (int)v24;
    if (v24 < 2)
    {
      BOOL v27 = 0LL;
      BOOL v26 = 0;
LABEL_34:
      unint64_t v24 = (int)v24;
      size_t v12 = &CBCentralManagerOptionReceiveSystemEvents_ptr;
      uint64_t v28 = v48;
      int v29 = v46;
      goto LABEL_35;
    }

    BOOL v26 = 0;
    BOOL v27 = 0LL;
    if (v51 != v13[2]) {
      goto LABEL_34;
    }
    unint64_t v24 = (int)v24;
    size_t v12 = &CBCentralManagerOptionReceiveSystemEvents_ptr;
    uint64_t v28 = v48;
    int v29 = v46;
    if (v46 < 0)
    {
      BOOL v27 = v52 == *((unsigned __int8 *)v50 + v48);
      BOOL v26 = v52 == *((unsigned __int8 *)v50 + v48);
      else {
        unint64_t v24 = (int)v24;
      }
    }

LABEL_35:
    LODWORD(v30) = !v26;
    uint64_t v30 = v29 < 0 ? v30 : 0LL;
    if (v24 > v6 - v30) {
      break;
    }
    int v31 = v29 >= 0 || v26;
    BOOL v49 = v27;
    if (v31 != 1)
    {
LABEL_45:
      uint64_t v47 = v25;
      objc_msgSend( v12[50],  "splitOffset:intoHeaderByte:timeStampByte:",  objc_msgSend(v12[50], "timeStampOffset:", v13[2]),  (char *)&v54 + 1,  &v54);
      *v7++ = v54;
      --v6;
      uint64_t v51 = v13[2];
      unsigned int v32 = *((unsigned __int8 *)v50 + v28);
      if (*((char *)v50 + v28) >= -16)
      {
        int v33 = v32 & 0xF8;
        BOOL v34 = v32 > 0xF7;
        BOOL v35 = v33 == 240;
        int v36 = v52;
        if (v35) {
          int v36 = 0;
        }
        if (v35) {
          BOOL v34 = 0;
        }
        int v52 = v36;
        BOOL v53 = v34;
      }

      else
      {
        int v52 = *((unsigned __int8 *)v50 + v28);
        BOOL v53 = 0;
      }

      uint64_t v25 = v47;
      goto LABEL_54;
    }

    if (v26)
    {
      if (v53) {
        goto LABEL_45;
      }
      BOOL v53 = 0;
    }

LABEL_54:
    size_t v37 = v25 - v26;
    v38 = (uint64_t *)v13[4];
    if (!v38) {
      v38 = v13 + 5;
    }
    memcpy(v7, (char *)v38 + v13[15] + v49, v37);
    size_t v39 = v37 + v49 + v13[15];
    v13[15] = v39;
    if (v39 == *((_DWORD *)v13 + 6))
    {
      v40 = (void *)v13[4];
      if (v40) {
        free(v40);
      }
      uint64_t v41 = *v13;
      *(void *)(v41 + 8) = v13[1];
      *(void *)v13[1] = v41;
      --a1[15];
      operator delete(v13);
    }

    v6 -= v37;
    if (a1[15])
    {
      v7 += v37;
      int v10 = v52;
      BOOL v8 = v53;
      uint64_t v9 = v51;
      if (v6) {
        continue;
      }
    }

    goto LABEL_66;
  }

  size_t v42 = v6 - ((v29 >> 7) & 1);
  if ((v29 & 0x80000000) == 0)
  {
    v43 = v13 + 5;
    if (!v42) {
      goto LABEL_66;
    }
    goto LABEL_76;
  }

  v44 = (uint64_t *)v13[4];
  v43 = v13 + 5;
  if (!v44) {
    v44 = v13 + 5;
  }
  if (*((unsigned __int8 *)v44 + v13[15]) == 240 && v42)
  {
    objc_msgSend( v12[50],  "splitOffset:intoHeaderByte:timeStampByte:",  objc_msgSend(v12[50], "timeStampOffset:", v13[2]),  (char *)&v54 + 1,  &v54);
    *v7++ = v54;
    LODWORD(v6) = v6 - 1;
LABEL_76:
    v45 = (uint64_t *)v13[4];
    if (!v45) {
      v45 = v43;
    }
    memcpy(v7, (char *)v45 + v13[15], v42);
    v13[15] += v42;
    LODWORD(v6) = v6 - v42;
  }

LABEL_66:
  *((_DWORD *)a3 + 4) = *(_DWORD *)(a2 + 40) - v6;
}

void sub_E4A4(uint64_t *a1)
{
  while (a1[15] && ((*(uint64_t (**)(uint64_t *))(*a1 + 8))(a1) & 1) == 0)
  {
    sub_106CC(a1[1] - 8, *(void *)(a1[14] + 104));
    if (!v18) {
      __assert_rtn("_DoWrite", "BTLEMIDIDataSender.mm", 432, "writeBuffer != nullptr");
    }
    if (*(_BYTE *)(v18 + 44))
    {
      sub_DC84();
      uint64_t v2 = qword_1DDF8;
      if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unint64_t v24 = 136315394;
        *(void *)&v24[4] = "BTLEMIDIDataSender.mm";
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = 436;
        int v3 = v24;
        uint64_t v4 = (os_log_s *)v2;
        uint64_t v5 = "%25s:%-5d ERROR: All BLE MIDI data buffers are in use. Is Bluetooth backed up?";
LABEL_14:
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, v5, v3, 0x12u);
      }
    }

    else
    {
      uint64_t v6 = (unsigned int *)(v18 + 8);
      do
        unsigned int v7 = __ldaxr(v6);
      while (__stlxr(v7 + 1, v6));
      sub_E084(a1, v18, v24);
      uint64_t v8 = *(void *)&v24[8];
      if (*(void *)&v24[8])
      {
        id v9 = *(id *)v24;
        if (!*(void *)v24 || v9 == [*(id *)(a1[1] + 104) validatePeripheral:*(void *)v24])
        {
          id v11 = (id)*(int *)&v24[16];
          if (*(_DWORD *)&v24[16])
          {
            unsigned int v14 = objc_autoreleasePoolPush();
            *(_BYTE *)(v18 + 44) = 1;
            id v11 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  *(void *)(v18 + 24),  v11,  0LL);
            if (v9)
            {
              [v9 writeValue:v11 forCharacteristic:v8 type:1];
              *(_BYTE *)(v18 + 44) = 0;
              unsigned int v15 = (unsigned int *)(v18 + 8);
              do
              {
                unsigned int v16 = __ldaxr(v15);
                unsigned int v17 = v16 - 1;
              }

              while (__stlxr(v17, v15));
              if (!v17) {
                (*(void (**)())(*(void *)v18 + 16LL))();
              }
              bzero(*(void **)(v18 + 24), *(unsigned int *)(v18 + 40));
            }

            else
            {
              objc_msgSend(objc_msgSend(*(id *)(a1[1] + 112), "bleDevice"), "advanceBuffer");
              [(id)(*(uint64_t (**)(uint64_t *))*a1)(a1) enqueue:v11];
            }

            objc_autoreleasePoolPop(v14);
            LODWORD(v11) = 0;
          }

          goto LABEL_16;
        }
      }

      sub_DC84();
      uint64_t v10 = qword_1DDF8;
      if (os_log_type_enabled((os_log_t)qword_1DDF8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v21 = "BTLEMIDIDataSender.mm";
        __int16 v22 = 1024;
        int v23 = 449;
        int v3 = buf;
        uint64_t v4 = (os_log_s *)v10;
        uint64_t v5 = "%25s:%-5d [!] BLEMIDIDataSender::_DoWrite() not doing any work";
        goto LABEL_14;
      }
    }

    LODWORD(v11) = 1;
    if (!v19) {
      goto LABEL_20;
    }
LABEL_16:
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
      if ((_DWORD)v11) {
        return;
      }
    }

    else
    {
LABEL_20:
      if ((_DWORD)v11) {
        return;
      }
    }
  }

void sub_E7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_E7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(a1 + 16);
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 16LL))(a1 + 16);
  uint64_t v6 = (uint64_t *)v4[12];
  while (v6 != v4 + 11)
  {
    if (v6[13] == a2)
    {
      unsigned int v7 = (void *)v6[4];
      if (v7) {
        free(v7);
      }
      uint64_t v8 = *v6;
      id v9 = (uint64_t *)v6[1];
      *(void *)(v8 + 8) = v9;
      *(void *)v6[1] = v8;
      --*(void *)(a1 + 120);
      operator delete(v6);
      uint64_t v6 = v9;
    }

    else
    {
      uint64_t v6 = (uint64_t *)v6[1];
    }
  }

  if (v5) {
    (*(void (**)(void *))(*v4 + 24LL))(v4);
  }
}

void *sub_E894(void *a1)
{
  for (uint64_t i = (void *)a1[1]; i != a1; uint64_t i = (void *)i[1])
  {
    int v3 = (void *)i[4];
    if (v3) {
      free(v3);
    }
  }

  sub_E8E0(a1);
  return a1;
}

void *sub_E8E0(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8LL);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0LL;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }

      while (v4 != v1);
    }
  }

  return result;
}

char *NewBLEMIDIDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xECu,  0xDEu,  0x95u,  0x74u,  0xFu,  0xE4u,  0x11u,  0xD4u,  0xBBu,  0x1Au,  0,  0x50u,  0xE4u,  0xCEu,  0xA5u,  0x26u);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  uint64_t v4 = (char *)operator new(0x8F0uLL);
  sub_E9E4((uint64_t)v4);
  return v4 + 8;
}

void sub_E9D0(_Unwind_Exception *a1)
{
}

uint64_t sub_E9E4(uint64_t a1)
{
  uint64_t v2 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0xDBu,  0x11u,  0xE5u,  0x92u,  6u,  0x6Fu,  0x4Fu,  0xDCu,  0xB7u,  0x3Cu,  0x1Au,  0x8Cu,  0xF6u,  0xFCu,  0x6Fu,  0x8Du);
  sub_4458(a1, v2);
  *(void *)a1 = off_18900;
  *(_DWORD *)(a1 + 100) = 0;
  uint64_t v3 = a1;
  sub_D9C4(a1 + 128, a1 + 8);
  *(_BYTE *)(a1 + 2280) = 0;
  if ((byte_1DE08 & 1) == 0)
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AppleMIDIBluetoothDriver");
    qword_1DE10 = (uint64_t)BundleWithIdentifier;
    if (BundleWithIdentifier) {
      CFRetain(BundleWithIdentifier);
    }
  }

  char v15 = 0;
  *(void *)(a1 + 112) = -[BLEMIDIDriverCentral initWithDriver:]( objc_alloc(&OBJC_CLASS___BLEMIDIDriverCentral),  "initWithDriver:",  a1 + 8);
  *(void *)(a1 + 120) = -[BLEMIDILocalPeripheral initWithDriver:]( objc_alloc(&OBJC_CLASS___BLEMIDILocalPeripheral),  "initWithDriver:",  a1 + 8);
  v22[0] = &off_189D8;
  v22[1] = &v15;
  int v23 = v22;
  sub_EDB4(@"clearbledevices", @"com.apple.coremidi", (uint64_t)sub_2A38, (uint64_t)v22);
  int v5 = v23;
  if (v23 == v22)
  {
    uint64_t v6 = 4LL;
    int v5 = v22;
  }

  else
  {
    if (!v23) {
      goto LABEL_9;
    }
    uint64_t v6 = 5LL;
  }

  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_9:
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_EF58;
  handler[3] = &unk_18960;
  handler[4] = a1;
  xpc_set_event_stream_handler("com.apple.bluetooth.connections", &_dispatch_main_q, handler);
  if (v15)
  {
    ItemCount NumberOfDevices = MIDIDeviceListGetNumberOfDevices(0);
    sub_F104();
    uint64_t v8 = (os_log_s *)qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v17 = "BTLEMIDIDriver.mm";
      __int16 v18 = 1024;
      int v19 = 189;
      __int16 v20 = 2048;
      CFStringRef v21 = (CFStringRef)NumberOfDevices;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "%25s:%-5d      NOTICE: Now deleting all (%lu) Bluetooth devices.",  buf,  0x1Cu);
    }

    CFStringRef str = 0LL;
    if (NumberOfDevices)
    {
      for (ItemCount i = NumberOfDevices - 1; i != -1LL; --i)
      {
        MIDIObjectRef Device = MIDIDeviceListGetDevice(0, i);
        MIDIObjectGetStringProperty(Device, kMIDIPropertyName, &str);
        sub_F104();
        id v11 = (os_log_s *)qword_1DE18;
        if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          unsigned int v17 = "BTLEMIDIDriver.mm";
          __int16 v18 = 1024;
          int v19 = 197;
          __int16 v20 = 2112;
          CFStringRef v21 = str;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Deleting %@...", buf, 0x1Cu);
        }

        a1 = v3;
        CFRelease(str);
        CFStringRef str = 0LL;
        MIDISetupRemoveDevice(Device);
      }
    }
  }

  return a1;
}

void sub_ED48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

void *sub_EDB4(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_29C4();
  uint64_t v14 = a3;
  id v9 = v15;
  sub_30B4((uint64_t)v15, a4);
  __int16 v18 = 0LL;
  uint64_t v10 = operator new(0x30uLL);
  void *v10 = &off_18990;
  v10[1] = v14;
  sub_10900((uint64_t)(v10 + 2), (uint64_t)v15);
  __int16 v18 = v10;
  sub_2D00((uint64_t)v8, a1, a2, (uint64_t)v17);
  uint64_t result = v18;
  if (v18 == v17)
  {
    uint64_t v12 = 4LL;
    uint64_t result = v17;
  }

  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    uint64_t v12 = 5LL;
  }

  uint64_t result = (void *)(*(uint64_t (**)(void))(*result + 8 * v12))();
LABEL_6:
  if (v16 == v15)
  {
    uint64_t v13 = 4LL;
  }

  else
  {
    if (!v16) {
      return result;
    }
    uint64_t v13 = 5LL;
    id v9 = v16;
  }

  return (void *)(*(uint64_t (**)(void *))(*v9 + 8 * v13))(v9);
}

void sub_EEE0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  __int16 v20 = a17;
  if (a17 == v18)
  {
    uint64_t v21 = 4LL;
    __int16 v20 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_6;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void))(*(void *)v20 + 8 * v21))();
LABEL_6:
  if (a13 == v17)
  {
    uint64_t v22 = 4LL;
  }

  else
  {
    if (!a13) {
      goto LABEL_11;
    }
    uint64_t v22 = 5LL;
    unsigned int v17 = a13;
  }

  (*(void (**)(void *))(*v17 + 8 * v22))(v17);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void sub_EF58(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = *(void *)(a1 + 32);
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string && !strcmp(string, "MyMIDIService"))
  {
    int v5 = xpc_dictionary_get_string(xdict, "deviceID");
    uint64_t v6 = xpc_dictionary_get_string(xdict, "name");
    unsigned int v7 = v6;
    if (v5 && v6)
    {
      sub_F160( v3,  (uint64_t)+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5),  (uint64_t)+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    }

    else
    {
      sub_F104();
      uint64_t v8 = (os_log_s *)qword_1DE18;
      if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
      {
        id v9 = "(null deviceID)";
        if (v5) {
          id v9 = v5;
        }
        uint64_t v12 = "BTLEMIDIDriver.mm";
        __int16 v13 = 1024;
        int v14 = 176;
        uint64_t v10 = "null name";
        int v11 = 136315906;
        unsigned int v16 = v9;
        __int16 v15 = 2080;
        if (v7) {
          uint64_t v10 = v7;
        }
        __int16 v17 = 2080;
        __int16 v18 = v10;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d AppleMIDIBluetoothDriver received an invalid XPC event: %s, %s",  (uint8_t *)&v11,  0x26u);
      }
    }
  }

void sub_F104()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1DE20);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_1DE20))
    {
      qword_1DE18 = (uint64_t)os_log_create("com.apple.coremidi", "bledrv");
      __cxa_guard_release(&qword_1DE20);
    }
  }

id sub_F160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315906;
    id v9 = "BTLEMIDIDriver.mm";
    __int16 v10 = 1024;
    int v11 = 552;
    __int16 v12 = 2112;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    uint64_t v15 = a3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] BLEMIDIDriver::ReceiveXPCConnection(%@, %@)",  (uint8_t *)&v8,  0x26u);
  }

  [*(id *)(a1 + 112) xpcReceiveUUID:a2 withName:a3];
  return sub_FB30(a1);
}

void *sub_F254(uint64_t a1)
{
  *(void *)a1 = off_18900;
  [*(id *)(a1 + 112) cancelAllConnections];
  [*(id *)(a1 + 120) removeMIDIService];

  *(void *)(a1 + 112) = 0LL;
  *(void *)(a1 + 120) = 0LL;
  sub_DA68((void *)(a1 + 128));
  return sub_4734((void *)a1);
}

void sub_F2B8(uint64_t a1)
{
  uint64_t v1 = sub_F254(a1);
  operator delete(v1);
}

uint64_t sub_F2CC(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 229;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::Start()", buf, 0x12u);
  }

  uint64_t v3 = off_1DD00;
  sub_F83C(a1);
  if (*(_BYTE *)(a1 + 2280)) {
    [*(id *)(a1 + 120) checkAddMIDIService];
  }
  else {
    *(_BYTE *)(a1 + 2280) = 1;
  }
  if ((byte_1DE08 & 1) == 0) {
    sub_F8B0();
  }
  unsigned int v4 = +[BLEMIDIAccessor nullDevice](&OBJC_CLASS___BLEMIDIAccessor, "nullDevice");
  *(_DWORD *)(a1 + 100) = v4;
  int v5 = (MIDIObjectRef *)(a1 + 100);
  if (v4)
  {
    uint64_t v6 = kMIDIPropertyOffline;
    goto LABEL_10;
  }

  sub_F104();
  unsigned int v7 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 244;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Creating null device ...", buf, 0x12u);
  }

  OSStatus v8 = MIDIDeviceCreate((MIDIDriverRef)(a1 + 8), off_1DD08, off_1DD10, off_1DD18, (MIDIDeviceRef *)(a1 + 100));
  sub_F104();
  id v9 = (os_log_s *)qword_1DE18;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 247;
      __int16 v29 = 1024;
      MIDIObjectRef v30 = v8;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] Error %d creating BLE MIDI null device. No new Bluetooth connections are possible.",  buf,  0x18u);
    }

    return 4294956463LL;
  }

  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
  {
    MIDIObjectRef v17 = *v5;
    *(_DWORD *)buf = 136315650;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 250;
    __int16 v29 = 1024;
    MIDIObjectRef v30 = v17;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      Null device created with MIDIDeviceRef %u",  buf,  0x18u);
  }

  MIDIObjectSetIntegerProperty(*v5, @"is BLE MIDI null device", 1);
  uint64_t v6 = kMIDIPropertyOffline;
  MIDIObjectSetIntegerProperty(*v5, kMIDIPropertyOffline, 1);
  OSStatus v18 = MIDISetupAddDevice(*v5);
  sub_F104();
  uint64_t v19 = qword_1DE18;
  if (v18)
  {
    if (!os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315650;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 260;
    __int16 v29 = 1024;
    MIDIObjectRef v30 = v18;
    __int16 v20 = "%25s:%-5d [!] MIDISetupAddDevice = %d";
    uint64_t v21 = (os_log_s *)v19;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
  }

  else
  {
    if (!os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    MIDIObjectRef v23 = *v5;
    *(_DWORD *)buf = 136315650;
    BOOL v26 = "BTLEMIDIDriver.mm";
    __int16 v27 = 1024;
    int v28 = 262;
    __int16 v29 = 1024;
    MIDIObjectRef v30 = v23;
    __int16 v20 = "%25s:%-5d      Successfully added null device = %u";
    uint64_t v21 = (os_log_s *)v19;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
  }

  _os_log_impl(&dword_0, v21, v22, v20, buf, 0x18u);
LABEL_10:
  MIDIObjectSetIntegerProperty(*v5, v6, 0);
  CFStringRef str = 0LL;
  MIDIObjectGetStringProperty(*v5, @"Bluetooth Advertising Name", &str);
  if (str) {
    CFRelease(str);
  }
  else {
    MIDIObjectSetStringProperty(*v5, @"Bluetooth Advertising Name", v3);
  }
  if (qword_1DE10)
  {
    CFRelease((CFTypeRef)qword_1DE10);
    qword_1DE10 = 0LL;
  }

  uint64_t v10 = MIDIClientCreate(@"BLE MIDI Client", (MIDINotifyProc)sub_F9F0, (void *)a1, (MIDIClientRef *)(a1 + 104));
  sub_F104();
  int v11 = (os_log_s *)qword_1DE18;
  if ((_DWORD)v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 287;
      __int16 v29 = 1024;
      MIDIObjectRef v30 = v10;
      __int16 v12 = "%25s:%-5d [!]] MIDIClientCreate = %d, no notifications can be received.";
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_28:
      _os_log_impl(&dword_0, v13, v14, v12, buf, 0x18u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 291;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "%25s:%-5d      BLE MIDI client process created and awaiting notifications.",  buf,  0x12u);
    }

    sub_FB30(a1);
    sub_DAA4(a1 + 128);
    *(_BYTE *)(a1 + 96) = 0;
    sub_F104();
    uint64_t v15 = qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v26 = "BTLEMIDIDriver.mm";
      __int16 v27 = 1024;
      int v28 = 301;
      __int16 v29 = 1024;
      MIDIObjectRef v30 = 0;
      __int16 v12 = "%25s:%-5d [-] BLEMIDIDriver::Start() = %d";
      uint64_t v13 = (os_log_s *)v15;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      goto LABEL_28;
    }
  }

  return v10;
}

ItemCount sub_F83C(uint64_t a1)
{
  ItemCount result = MIDIGetDriverDeviceList((MIDIDriverRef)(a1 + 8));
  if ((_DWORD)result)
  {
    MIDIDeviceListRef v2 = result;
    ItemCount result = MIDIDeviceListGetNumberOfDevices(result);
    if (result)
    {
      for (ItemCount i = 0LL; i < result; ++i)
      {
        MIDIObjectRef Device = MIDIDeviceListGetDevice(v2, i);
        MIDIObjectSetIntegerProperty(Device, kMIDIPropertyOffline, 1);
        ItemCount result = MIDIDeviceListGetNumberOfDevices(v2);
      }
    }
  }

  return result;
}

void sub_F8B0()
{
  if ((byte_1DE08 & 1) == 0)
  {
    if (qword_1DE10)
    {
      off_1DD10 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD10,  off_1DD10,  @"BTLEMIDILocalizable");
      off_1DD40 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD40,  off_1DD40,  @"BTLEMIDILocalizable");
      off_1DD18 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD18,  off_1DD18,  @"BTLEMIDILocalizable");
      off_1DD08 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD08,  off_1DD08,  @"BTLEMIDILocalizable");
      off_1DD00 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD00,  off_1DD00,  @"BTLEMIDILocalizable");
      off_1DD20 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD20,  off_1DD20,  @"BTLEMIDILocalizable");
      off_1DD28 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD28,  off_1DD28,  @"BTLEMIDILocalizable");
      off_1DD30 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD30,  off_1DD30,  @"BTLEMIDILocalizable");
      off_1DD38 = (__CFString *)CFBundleCopyLocalizedString( (CFBundleRef)qword_1DE10,  off_1DD38,  off_1DD38,  @"BTLEMIDILocalizable");
      byte_1DE08 = 1;
    }
  }

void sub_F9F0(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == 4
    && !*(_DWORD *)(a1 + 12)
    && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 100)
    && (CFEqual(*(CFTypeRef *)(a1 + 16), @"BLE MIDI Local Peripheral")
     || CFEqual(*(CFTypeRef *)(a1 + 16), @"BLE MIDI Remote Peripheral")
     || CFEqual(*(CFTypeRef *)(a1 + 16), @"disconnect device")))
  {
    sub_F104();
    unsigned int v4 = (os_log_s *)qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 16);
      int v6 = 136315650;
      unsigned int v7 = "BTLEMIDIDriver.mm";
      __int16 v8 = 1024;
      int v9 = 357;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [?] Property set on null device: %@",  (uint8_t *)&v6,  0x1Cu);
    }

    sub_FD70(a2, a1);
  }

id sub_FB30(uint64_t a1)
{
  id result = [*(id *)(a1 + 112) isLECapableHardware];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 112) activateConnectedUUIDs];
  }
  return result;
}

uint64_t sub_FB7C(uint64_t a1)
{
  MIDIDeviceListRef v2 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "BTLEMIDIDriver.mm";
    __int16 v7 = 1024;
    int v8 = 307;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::Stop()", (uint8_t *)&v5, 0x12u);
  }

  *(_BYTE *)(a1 + 96) = 1;
  sub_DCE0((void *)(a1 + 128));
  MIDIClientDispose(*(_DWORD *)(a1 + 104));
  *(_DWORD *)(a1 + 104) = 0;
  sub_F83C(a1);
  sub_F104();
  uint64_t v3 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "BTLEMIDIDriver.mm";
    __int16 v7 = 1024;
    int v8 = 317;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%25s:%-5d [-] BLEMIDIDriver::Stop()", (uint8_t *)&v5, 0x12u);
  }

  return 0LL;
}

uint64_t sub_FCC4(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    id v7 = objc_msgSend(*(id *)(a1 + 112), "validatePeripheral:");
    if (!v7) {
      return 4294956454LL;
    }
    uint64_t v8 = (uint64_t)v7;
    id v9 = [*(id *)(a1 + 112) deviceForPeripheral:v7];
    if (!v9) {
      return 4294956454LL;
    }
  }

  else
  {
    id v9 = [*(id *)(a1 + 120) bleDevice];
    uint64_t v8 = 0LL;
    if (!v9) {
      return 4294956454LL;
    }
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___CBCharacteristic);
  if ((objc_opt_isKindOfClass(a4, v10) & 1) != 0) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = 0LL;
  }
  return sub_DE30(a1 + 128, a2, v8, v11);
}

void sub_FD70(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0LL;
  CFDictionaryRef outDict = 0LL;
  if (!*(_DWORD *)(a1 + 100)) {
    return;
  }
  sub_F104();
  unsigned int v4 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "BTLEMIDIDriver.mm";
    __int16 v26 = 1024;
    int v27 = 392;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%25s:%-5d [+] BLEMIDIDriver::NullDevicePropertyChanged()", buf, 0x12u);
  }

  if (CFEqual(*(CFTypeRef *)(a2 + 16), @"activate all devices"))
  {
    sub_FB30(a1);
    return;
  }

  int v5 = CFEqual(*(CFTypeRef *)(a2 + 16), @"disconnect device");
  MIDIObjectRef v6 = *(_DWORD *)(a1 + 100);
  if (v5)
  {
    if (!MIDIObjectGetStringProperty(v6, @"disconnect device", (CFStringRef *)&cf))
    {
      MIDIObjectRemoveProperty(*(_DWORD *)(a1 + 100), @"disconnect device");
      id v7 = +[BLEMIDIAccessor midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:]( &OBJC_CLASS___BLEMIDIAccessor,  "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:",  cf,  0LL,  1LL);
      sub_F104();
      uint64_t v8 = (os_log_s *)qword_1DE18;
      if ((_DWORD)v7)
      {
        if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = "BTLEMIDIDriver.mm";
          __int16 v26 = 1024;
          int v27 = 402;
          __int16 v28 = 2112;
          v29[0] = cf;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d      Request to deactivate UUID: %@", buf, 0x1Cu);
        }

        sub_10188(a1, (uint64_t)v7);
      }

      else if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = "BTLEMIDIDriver.mm";
        __int16 v26 = 1024;
        int v27 = 405;
        __int16 v28 = 2112;
        v29[0] = cf;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] Couldn't find any connected peripherals with UUID %@.",  buf,  0x1Cu);
      }

      if (cf) {
        CFRelease(cf);
      }
    }

    return;
  }

  OSStatus DictionaryProperty = MIDIObjectGetDictionaryProperty(v6, *(CFStringRef *)(a2 + 16), &outDict);
  if (DictionaryProperty == -10835) {
    return;
  }
  OSStatus v10 = DictionaryProperty;
  if (DictionaryProperty)
  {
    sub_F104();
    uint64_t v20 = qword_1DE18;
    if (!os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v21 = *(void *)(a2 + 16);
    *(_DWORD *)buf = 136315906;
    uint64_t v25 = "BTLEMIDIDriver.mm";
    __int16 v26 = 1024;
    int v27 = 424;
    __int16 v28 = 1024;
    LODWORD(v29[0]) = v10;
    WORD2(v29[0]) = 2112;
    *(void *)((char *)v29 + 6) = v21;
    unsigned int v16 = "%25s:%-5d [!] BLEMIDIDriver::NullDevicePropertyChanged() - Error %d encountered for property %@.";
    MIDIObjectRef v17 = (os_log_s *)v20;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 34;
LABEL_23:
    _os_log_impl(&dword_0, v17, v18, v16, buf, v19);
    return;
  }

  MIDIObjectRemoveProperty(*(_DWORD *)(a1 + 100), *(CFStringRef *)(a2 + 16));
  id v11 = -[__CFDictionary objectForKey:](outDict, "objectForKey:", @"BLE MIDI Device UUID");
  id v12 = -[__CFDictionary objectForKey:](outDict, "objectForKey:", kMIDIPropertyName);
  if (v11)
  {
    id v13 = v12;
    sub_F104();
    os_log_type_t v14 = (os_log_s *)qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "BTLEMIDIDriver.mm";
      __int16 v26 = 1024;
      int v27 = 432;
      __int16 v28 = 2112;
      v29[0] = v11;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%25s:%-5d      Request to activate UUID: %@", buf, 0x1Cu);
    }

    objc_msgSend(*(id *)(a1 + 112), "activateUUID:withName:", v11, v13, cf);
  }

  CFRelease(outDict);
  sub_F104();
  uint64_t v15 = qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "BTLEMIDIDriver.mm";
    __int16 v26 = 1024;
    int v27 = 436;
    unsigned int v16 = "%25s:%-5d [-] BLEMIDIDriver::NullDevicePropertyChanged()";
    MIDIObjectRef v17 = (os_log_s *)v15;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 18;
    goto LABEL_23;
  }

uint64_t sub_10188(uint64_t a1, uint64_t obj)
{
  if (!(_DWORD)obj || *(_DWORD *)(a1 + 100) == (_DWORD)obj) {
    return 0LL;
  }
  MIDIObjectSetIntegerProperty(obj, kMIDIPropertyOffline, 1);
  CFStringRef str = 0LL;
  OSStatus StringProperty = MIDIObjectGetStringProperty(obj, @"BLE MIDI Device UUID", &str);
  if (!str || StringProperty)
  {
    sub_F104();
    id v7 = (os_log_s *)qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "BTLEMIDIDriver.mm";
      __int16 v12 = 1024;
      int v13 = 456;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: Device has no UUID. Returing kMIDINotPermitted.",  buf,  0x12u);
    }

    return 4294956452LL;
  }

  else
  {
    if (+[BLEMIDIAccessor deviceIsRemotePeripheral:]( &OBJC_CLASS___BLEMIDIAccessor,  "deviceIsRemotePeripheral:",  obj))
    {
      uint64_t v4 = sub_10340(a1, (uint64_t)str);
    }

    else
    {
      sub_F104();
      uint64_t v8 = (os_log_s *)qword_1DE18;
      if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "BTLEMIDIDriver.mm";
        __int16 v12 = 1024;
        int v13 = 463;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "%25s:%-5d WARNING: Can't disconnect remote central, but the device was set to offline.",  buf,  0x12u);
      }

      uint64_t v4 = 0LL;
    }

    CFRelease(str);
  }

  return v4;
}

uint64_t sub_10340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "BTLEMIDIDriver.mm";
    __int16 v12 = 1024;
    int v13 = 471;
    __int16 v14 = 2112;
    uint64_t v15 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] BLEMIDIDriver::DisconnectDeviceWithUUID(%@)",  (uint8_t *)&v10,  0x1Cu);
  }

  id v5 = [*(id *)(a1 + 112) peripheralWithUUID:a2];
  if (v5)
  {
    [*(id *)(a1 + 112) cancelConnectionForPeripheral:v5];
    sub_F104();
    MIDIObjectRef v6 = (os_log_s *)qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "BTLEMIDIDriver.mm";
      __int16 v12 = 1024;
      int v13 = 483;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] BLEMIDIDriver::DisconnectDeviceWithUUID = noErr",  (uint8_t *)&v10,  0x12u);
    }

    return 0LL;
  }

  else
  {
    sub_F104();
    uint64_t v8 = (os_log_s *)qword_1DE18;
    uint64_t v7 = 4294956454LL;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315906;
      id v11 = "BTLEMIDIDriver.mm";
      __int16 v12 = 1024;
      int v13 = 478;
      __int16 v14 = 2112;
      uint64_t v15 = a2;
      __int16 v16 = 1024;
      int v17 = -10842;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] BLEMIDIDriver::DisconnectDevice() - No peripheral found with uuid %@, returning %d",  (uint8_t *)&v10,  0x22u);
    }
  }

  return v7;
}

__CFString *sub_10518()
{
  return off_1DD20;
}

__CFString *sub_10524()
{
  return off_1DD28;
}

__CFString *sub_10530()
{
  return off_1DD30;
}

__CFString *sub_1053C()
{
  return off_1DD38;
}

__CFString *sub_10548()
{
  return off_1DD40;
}

id sub_10554(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 112) peripheralWithUUID:a2];
  if (result) {
    return [result setDelegate:0];
  }
  return result;
}

id sub_10580(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 112) peripheralWithUUID:a2];
  uint64_t v3 = v2;
  if (v2 && [v2 name]) {
    return +[NSString stringWithString:](NSString, "stringWithString:", [v3 name]);
  }
  uint64_t v4 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"peripheral = %@, peripheral.name = %@. Returning nil",  v3,  [v3 name]);
  sub_F104();
  id v5 = (os_log_s *)qword_1DE18;
  if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v8 = "BTLEMIDIDriver.mm";
    __int16 v9 = 1024;
    int v10 = 545;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@", buf, 0x1Cu);
  }

  return 0LL;
}

id sub_106CC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = [*(id *)(a1 + 112) deviceForPeripheral:a2];
  }
  else {
    id v2 = [*(id *)(a1 + 120) bleDevice];
  }
  uint64_t v3 = v2;
  if (!v2) {
    sub_10C94();
  }
  else {
    return objc_msgSend(v3, "centralBuffer", v4);
  }
}

void *sub_10744(void *a1)
{
  *a1 = &off_18990;
  id v2 = a1 + 2;
  uint64_t v3 = (void *)a1[5];
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_107A0(char *__p)
{
  *(void *)__p = &off_18990;
  id v2 = __p + 16;
  uint64_t v3 = (char *)*((void *)__p + 5);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

void *sub_107FC(uint64_t a1)
{
  id v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id v2 = &off_18990;
  v2[1] = v3;
  sub_30B4((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_10840(_Unwind_Exception *a1)
{
}

uint64_t sub_10854(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &off_18990;
  a2[1] = v2;
  return sub_30B4((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_10874(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  id result = *(void **)(a1 + 40);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    id result = v1;
  }

  else
  {
    if (!result) {
      return result;
    }
    uint64_t v3 = 5LL;
  }

  return (void *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_108A8(char *__p)
{
  uint64_t v2 = __p + 16;
  uint64_t v3 = (char *)*((void *)__p + 5);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

BOOL sub_108F8(uint64_t a1, void *a2)
{
  return sub_10964(a1 + 8, a2);
}

uint64_t sub_10900(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24LL))(*v3, a1);
      return a1;
    }

    *(void *)(a1 + 24) = v4;
  }

  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }

  void *v3 = 0LL;
  return a1;
}

BOOL sub_10964(uint64_t a1, void *a2)
{
  uint64_t v3 = (*(uint64_t (**)(void, char *))a1)(*a2, &v6);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    sub_34CC();
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 48LL))(v4, &v7);
  return v6 != 0;
}

void *sub_109DC(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_189D8;
  result[1] = v3;
  return result;
}

uint64_t sub_10A10(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_189D8;
  a2[1] = v2;
  return result;
}

void sub_10A2C(uint64_t a1, void *a2)
{
  if (*a2)
  {
    sub_F104();
    uint64_t v3 = (os_log_s *)qword_1DE18;
    if (os_log_type_enabled((os_log_t)qword_1DE18, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315394;
      id v5 = "BTLEMIDIDriver.mm";
      __int16 v6 = 1024;
      int v7 = 162;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_INFO,  "%25s:%-5d =====> NOTICE: All cached BLE devices being deleted, including the Null Device <=====",  (uint8_t *)&v4,  0x12u);
    }

    **(_BYTE **)(a1 + 8) = 1;
  }

void *sub_10B00(void *result)
{
  void *result = 0LL;
  result[1] = 0LL;
  *(void *)((char *)result + 21) = 0LL;
  result[2] = 0LL;
  return result;
}

uint64_t sub_10B10(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {
    operator delete[](v2);
  }
  return a1;
}

void *sub_10B3C(uint64_t a1, uint64_t a2, size_t __sz)
{
  int v3 = __sz;
  *(void *)a1 = a2;
  id result = operator new[](__sz);
  *(void *)(a1 + 8) = result;
  *(void *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

void sub_10B70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10BA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10BD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10C0C(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)",  (uint8_t *)v2,  0x12u);
}

void sub_10C94()
{
  __assert_rtn("NextBufferForPeripheral", "BTLEMIDIDriver.mm", 607, "device != nullptr");
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_xpcReceiveUUID_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcReceiveUUID:withName:");
}