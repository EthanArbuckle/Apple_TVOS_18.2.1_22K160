void sub_2344(std::exception *a1)
{
  void *v1;
  std::exception::~exception(a1);
  operator delete(v1);
}

const char *sub_2358()
{
  return "CAException";
}

void *sub_2364()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28100);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_28100))
  {
    sub_2694((uint64_t)&unk_28098);
    __cxa_guard_release(&qword_28100);
  }

  return &unk_28098;
}

void sub_23C0(_Unwind_Exception *a1)
{
}

uint64_t sub_23D8(const __CFString *a1, _BYTE *a2)
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

BOOL sub_24D0(const __CFBoolean *a1, _BYTE *a2)
{
  int valuePtr = 0;
  *a2 = 0;
  if (a1)
  {
    v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFBooleanGetTypeID())
    {
      LODWORD(a1) = CFBooleanGetValue(v3);
LABEL_6:
      *a2 = 1;
      return (_DWORD)a1 != 0;
    }

    if (v4 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
      LODWORD(a1) = valuePtr != 0;
      goto LABEL_6;
    }

    if (v4 != CFStringGetTypeID())
    {
      LODWORD(a1) = 0;
      return (_DWORD)a1 != 0;
    }

    CFStringGetCString((CFStringRef)v3, buffer, 64LL, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(a1) = valuePtr != 0;
      return (_DWORD)a1 != 0;
    }

    char v6 = buffer[0];
    if (buffer[0])
    {
      v7 = &buffer[1];
      do
      {
        *(v7 - 1) = __tolower(v6);
        int v8 = *v7++;
        char v6 = v8;
      }

      while (v8);
    }

    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (BOOL v9 = v12 == 101) : (BOOL v9 = 0), v9))
    {
      LODWORD(a1) = 0;
      goto LABEL_6;
    }

    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v12))
    {
      LODWORD(a1) = 1;
      *a2 = 1;
    }

    else
    {
      LODWORD(a1) = valuePtr;
    }
  }

  return (_DWORD)a1 != 0;
}

uint64_t sub_2694(uint64_t a1)
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
  handler[2] = sub_277C;
  handler[3] = &unk_24548;
  handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 96));
  return a1;
}

void sub_2768(_Unwind_Exception *a1)
{
}

void sub_277C(uint64_t a1)
{
}

void sub_2784(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  while (v2 != v3)
  {
    sub_294C(v2);
    v2 += 48LL;
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_27E0(_Unwind_Exception *a1)
{
}

uint64_t sub_27F8(uint64_t a1, CFTypeRef cf1, const void *a3)
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

void sub_2864(uint64_t a1, const void *a2, void *a3, uint64_t a4)
{
  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((sub_27F8(a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = sub_29CC((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }

    else
    {
      sub_2AE8(*(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }

    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    sub_294C(*(void *)(a1 + 80) - 48LL);
  }

  std::mutex::unlock((std::mutex *)a1);
}

void sub_292C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

CFPropertyListRef sub_294C(uint64_t a1)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*(CFStringRef *)a1, *(CFStringRef *)(a1 + 8));
  if (result)
  {
    CFPropertyListRef v4 = result;
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      sub_3030();
    }
    return (CFPropertyListRef)(*(uint64_t (**)(uint64_t, CFPropertyListRef *))(*(void *)v3 + 48LL))(v3, &v4);
  }

  return result;
}

uint64_t sub_29A0(const __CFString *a1)
{
  return CFPreferencesSynchronize(a1, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

void sub_29BC(void *a1)
{
}

uint64_t sub_29CC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x555555555555555LL) {
    sub_2CF0();
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
    v14 = (char *)sub_2D78(v11, v13);
  }
  else {
    v14 = 0LL;
  }
  v17 = v14;
  v18 = &v14[48 * v6];
  v20 = &v14[48 * v13];
  sub_2AE8(v18, a2, a3, a4);
  v19 = v18 + 48;
  sub_2C7C(a1, &v17);
  uint64_t v15 = a1[1];
  sub_2F8C(&v17);
  return v15;
}

void sub_2AD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_2AE8(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  sub_2C18((uint64_t)v10, a4);
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

void sub_2BD4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
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

uint64_t sub_2C18(uint64_t a1, uint64_t a2)
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

uint64_t sub_2C7C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_2DE4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void sub_2CF0()
{
}

void sub_2D04(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2D54(exception, a1);
}

void sub_2D40(_Unwind_Exception *a1)
{
}

std::logic_error *sub_2D54(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_2D78(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_2DBC();
  }
  return operator new(48 * a2);
}

void sub_2DBC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_2DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      sub_2E90(v7 - 32, a3 - 32);
      uint64_t v7 = *((void *)&v15 + 1) - 48LL;
      *((void *)&v15 + 1) -= 48LL;
      a3 = v9;
    }

    while (v9 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_2EF4((uint64_t)v12);
  return v10;
}

uint64_t sub_2E90(uint64_t a1, uint64_t a2)
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

uint64_t sub_2EF4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_2F28((void *)a1);
  }
  return a1;
}

void *sub_2F28(void *result)
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

void **sub_2F8C(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *sub_2FBC(void *result)
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

void sub_3030()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_24600;
}

void sub_3068(std::exception *a1)
{
}

double sub_307C(uint64_t a1)
{
  *(_BYTE *)(a1 + 161) = 17;
  *(_DWORD *)(a1 + 164) = 2139062143;
  *(void *)&double result = 0x100000001LL;
  *(_DWORD *)(a1 + 168) = 1;
  return result;
}

uint64_t sub_3098( uint64_t a1, int a2, unsigned int a3, unsigned int a4, unsigned int a5, char *a6, uint64_t a7)
{
  unsigned int v13 = 0xFFFFFFF;
  if (a5 != 36 && a5 != 112 && a5 != 126)
  {
    if (a5 == 37) {
      unsigned int v13 = 0xFFFFFFF;
    }
    else {
      unsigned int v13 = a4;
    }
  }

  if (*(void *)(a1 + 16) == *(void *)(a1 + 8))
  {
    if ((a5 & 0xFE) == 0x70) {
      char v18 = 127;
    }
    else {
      char v18 = a2;
    }
    *(_BYTE *)(a1 + 185) = v18;
    *(_DWORD *)(a1 + 176) = a3;
    *(_DWORD *)(a1 + 180) = v13;
    *(_BYTE *)(a1 + 184) = a5;
    __int16 __src = 32496;
    char v54 = a2;
    char v55 = 13;
    char v56 = a5;
    char v57 = 1;
    uint64_t v58 = 0LL;
    if (!(a3 >> 28))
    {
      int16x8_t v19 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a3), (uint32x4_t)xmmword_1F9C0);
      *(int16x4_t *)v19.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v19),  (int8x8_t)0x7F007F007F007FLL));
      LODWORD(v58) = vmovn_s16(v19).u32[0];
    }

    if (!(v13 >> 28))
    {
      int16x8_t v20 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_1F9C0);
      *(int16x4_t *)v20.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v20),  (int8x8_t)0x7F007F007F007FLL));
      HIDWORD(v58) = vmovn_s16(v20).u32[0];
    }

    sub_363C();
    v21 = (os_log_s *)qword_28108;
    if (os_log_type_enabled((os_log_t)qword_28108, OS_LOG_TYPE_DEBUG))
    {
      sub_3D94(__p, 0x2AuLL, 0);
      uint64_t v22 = 0LL;
      if (v34 >= 0) {
        v23 = __p;
      }
      else {
        v23 = (void **)__p[0];
      }
      do
      {
        unint64_t v24 = *((unsigned __int8 *)&__src + v22);
        *(_BYTE *)v23 = a0123456789abcd[v24 >> 4];
        *((_BYTE *)v23 + 1) = a0123456789abcd[v24 & 0xF];
        *((_BYTE *)v23 + 2) = 32;
        v23 = (void **)((char *)v23 + 3);
        ++v22;
      }

      while (v22 != 14);
      v25 = __p;
      if (v34 < 0) {
        v25 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 46;
      __int16 v39 = 2080;
      *(void *)v40 = v25;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d      new message hdr: %s ...", buf, 0x1Cu);
      if (v34 < 0) {
        operator delete(__p[0]);
      }
    }

    sub_3E3C(a1 + 8, *(char **)(a1 + 16), (char *)&__src, (char *)&v59, 14LL);
  }

  else
  {
    sub_363C();
    __int128 v14 = (os_log_s *)qword_28108;
    if (os_log_type_enabled((os_log_t)qword_28108, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1 + 16) - *(void *)(a1 + 8);
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 49;
      __int16 v39 = 2048;
      *(void *)v40 = v15;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      Message already has %lu bytes. Checking continuation ...",  buf,  0x1Cu);
    }

    if (*(_DWORD *)(a1 + 176) != a3 || *(_DWORD *)(a1 + 180) != a4 || *(unsigned __int8 *)(a1 + 184) != a5)
    {
      sub_363C();
      v16 = (os_log_s *)qword_28108;
      if (os_log_type_enabled((os_log_t)qword_28108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "MIDICIMessageEmitter.cpp";
        __int16 v37 = 1024;
        int v38 = 52;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] MIDICIMessageEmitter::CreateCIMessage() can't continue message (kMIDINotPermitted)",  buf,  0x12u);
      }

      uint64_t v17 = 4294956452LL;
LABEL_47:
      *(void *)(a1 + 16) = *(void *)(a1 + 8);
      return v17;
    }
  }

  switch(a5 >> 4)
  {
    case 1u:
      uint64_t v26 = sub_3698(a1, a6, a7);
      goto LABEL_41;
    case 2u:
      uint64_t v26 = sub_37EC(a1, a6, a7);
      goto LABEL_41;
    case 3u:
      uint64_t v26 = sub_395C(a1, a6, a7);
      goto LABEL_41;
    case 7u:
      uint64_t v26 = sub_3A58(a1, (uint64_t)a6, a7);
LABEL_41:
      uint64_t v17 = v26;
      break;
    default:
      sub_363C();
      v27 = (os_log_s *)qword_28108;
      if (os_log_type_enabled((os_log_t)qword_28108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "MIDICIMessageEmitter.cpp";
        __int16 v37 = 1024;
        int v38 = 76;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = a5 >> 4;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unhandled message type: 0x%x", buf, 0x18u);
      }

      uint64_t v17 = 4294956452LL;
      break;
  }

  sub_363C();
  v28 = (os_log_s *)qword_28108;
  if (os_log_type_enabled((os_log_t)qword_28108, OS_LOG_TYPE_DEBUG))
  {
    v29 = sub_1CE90(a5);
    *(_DWORD *)buf = 136317442;
    v36 = "MIDICIMessageEmitter.cpp";
    __int16 v37 = 1024;
    int v38 = 80;
    __int16 v39 = 1024;
    *(_DWORD *)v40 = a2;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = a3;
    __int16 v41 = 1024;
    unsigned int v42 = a4;
    __int16 v43 = 1024;
    unsigned int v44 = a5;
    __int16 v45 = 2080;
    v46 = v29;
    __int16 v47 = 2048;
    v48 = a6;
    __int16 v49 = 2048;
    uint64_t v50 = a7;
    __int16 v51 = 1024;
    int v52 = v17;
    _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDICIMessageEmitter::CreateCIMessage(channel:0x%x, sourceMUID:0x%08x, destMUID:0x%08x, msgIndex:0x% x (%s), data:%p, length:%lu) = %d",  buf,  0x4Eu);
  }

  if ((_DWORD)v17)
  {
    sub_363C();
    v30 = (os_log_s *)qword_28108;
    if (os_log_type_enabled((os_log_t)qword_28108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "MIDICIMessageEmitter.cpp";
      __int16 v37 = 1024;
      int v38 = 83;
      __int16 v39 = 1024;
      *(_DWORD *)v40 = v17;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] MIDICIMessageEmitter::CreateCIMessage() failed with error %d (message will not be sent)",  buf,  0x18u);
    }

    goto LABEL_47;
  }

  return v17;
}

void sub_363C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28110);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28110))
    {
      qword_28108 = (uint64_t)os_log_create("com.apple.coremidi", "ciemit");
      __cxa_guard_release(&qword_28110);
    }
  }
}

uint64_t sub_3698(uint64_t a1, char *a2, unsigned int a3)
{
  char __src = 99;
  char v15 = 0;
  uint64_t v6 = a1 + 8;
  sub_3E3C(a1 + 8, *(char **)(a1 + 16), &__src, &v17, 1LL);
  int v7 = *(unsigned __int8 *)(a1 + 184);
  if ((v7 - 16) < 2)
  {
    if (a3 != 5 * (a3 / 5)) {
      goto LABEL_14;
    }
    char v15 = a3 / 5;
    sub_3E3C(v6, *(char **)(a1 + 16), &v15, &__src, 1LL);
    uint64_t v8 = 0LL;
    if (a2)
    {
      int64_t v9 = (unsigned __int16)a3;
      if ((_WORD)a3)
      {
        uint64_t v10 = *(char **)(a1 + 16);
        uint64_t v11 = &a2[(unsigned __int16)a3];
        uint64_t v12 = v6;
        unsigned int v13 = a2;
        goto LABEL_12;
      }
    }
  }

  else
  {
    if ((v7 - 19) < 2)
    {
      sub_3BE4(a1);
LABEL_13:
      uint64_t v8 = 0LL;
      goto LABEL_15;
    }

    uint64_t v8 = 0LL;
    if (v7 == 18)
    {
      if (a3 == 5)
      {
        if (!a2) {
          goto LABEL_13;
        }
        uint64_t v10 = *(char **)(a1 + 16);
        uint64_t v11 = a2 + 5;
        uint64_t v12 = v6;
        unsigned int v13 = a2;
        int64_t v9 = 5LL;
LABEL_12:
        sub_3E3C(v12, v10, v13, v11, v9);
        goto LABEL_13;
      }

LABEL_14:
      uint64_t v8 = 4294956452LL;
    }
  }

LABEL_15:
  char v17 = -9;
  sub_3E3C(v6, *(char **)(a1 + 16), &v17, (char *)&v18, 1LL);
  return v8;
}

uint64_t sub_37EC(uint64_t a1, char *__src, unsigned int a3)
{
  unsigned __int32 v15 = 0;
  uint64_t v6 = 0LL;
  switch(*(_BYTE *)(a1 + 184))
  {
    case ' ':
      break;
    case '!':
      uint64_t v6 = sub_3C68(a1, (unsigned __int16 *)__src, a3);
      break;
    case '""':
    case '#':
    case '$':
    case '%':
      if (a3 == 5)
      {
        if (!__src) {
          goto LABEL_6;
        }
        uint64_t v7 = a1 + 8;
        uint64_t v8 = *(char **)(a1 + 16);
        int64_t v9 = __src + 5;
        uint64_t v10 = __src;
        int64_t v11 = 5LL;
        goto LABEL_5;
      }

      uint64_t v6 = 4294956460LL;
      break;
    case '&':
      if (a3 < 6) {
        goto LABEL_10;
      }
      if (__src) {
        sub_3E3C(a1 + 8, *(char **)(a1 + 16), __src, __src + 5, 5LL);
      }
      unsigned int v13 = a3 - 5;
      if (!(v13 >> 28))
      {
        int16x8_t v14 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_1F9C0);
        *(int16x4_t *)v14.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v14),  (int8x8_t)0x7F007F007F007FLL));
        unsigned __int32 v15 = vmovn_s16(v14).u32[0];
      }

      sub_3E3C(a1 + 8, *(char **)(a1 + 16), (char *)&v15, v16, 4LL);
      int64_t v11 = (unsigned __int16)v13;
      if ((_WORD)v13)
      {
        uint64_t v10 = __src + 5;
        uint64_t v8 = *(char **)(a1 + 16);
        int64_t v9 = &__src[(unsigned __int16)v13 + 5];
        uint64_t v7 = a1 + 8;
LABEL_5:
        sub_3E3C(v7, v8, v10, v9, v11);
      }

LABEL_6:
      uint64_t v6 = 0LL;
      break;
    default:
LABEL_10:
      uint64_t v6 = 4294956452LL;
      break;
  }

  char __srca = -9;
  sub_3E3C(a1 + 8, *(char **)(a1 + 16), &__srca, (char *)&v18, 1LL);
  return v6;
}

uint64_t sub_395C(uint64_t a1, char *__src, unsigned __int16 a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 184);
  if ((v4 - 50) >= 8)
  {
    if ((v4 - 48) < 2)
    {
      if (__src) {
        sub_3E3C(a1 + 8, *(char **)(a1 + 16), __src, __src + 1, 1LL);
      }
      char v10 = -9;
      uint64_t v5 = a1 + 8;
      uint64_t v6 = *(char **)(a1 + 16);
      p_srca = &__srca;
      uint64_t v8 = &v10;
      goto LABEL_6;
    }

    if (v4 != 63)
    {
      char v12 = -9;
      sub_3E3C(a1 + 8, *(char **)(a1 + 16), &v12, (char *)&v13, 1LL);
      return 4294956452LL;
    }
  }

  if (__src)
  {
    if (a3) {
      sub_3E3C(a1 + 8, *(char **)(a1 + 16), __src, &__src[a3], a3);
    }
  }

  char __srca = -9;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = *(char **)(a1 + 16);
  p_srca = &v12;
  uint64_t v8 = &__srca;
LABEL_6:
  sub_3E3C(v5, v6, v8, p_srca, 1LL);
  return 0LL;
}

uint64_t sub_3A58(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    BOOL v6 = a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = *(unsigned __int8 *)(a1 + 184);
  if (v6 && (v7 & 0xFE) == 0x70) {
    return 4294956452LL;
  }
  char __src = 0;
  unsigned __int32 v15 = 0;
  if ((v7 - 112) < 2)
  {
    int64_t v9 = (char **)(a1 + 16);
    uint64_t v10 = a1 + 8;
    sub_3E3C(a1 + 8, *(char **)(a1 + 16), (char *)(a1 + 161), (char *)(a1 + 172), 11LL);
    if (a3 != 5) {
      return 4294956452LL;
    }
    char __src = *(_BYTE *)a2;
    unsigned int v11 = *(_DWORD *)(a2 + 1);
    if (!(v11 >> 28))
    {
      int16x8_t v12 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v11), (uint32x4_t)xmmword_1F9C0);
      *(int16x4_t *)v12.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v12),  (int8x8_t)0x7F007F007F007FLL));
      unsigned __int32 v15 = vmovn_s16(v12).u32[0];
    }

    sub_3E3C(a1 + 8, *v9, &__src, &v18, 1LL);
    goto LABEL_19;
  }

  if (v7 == 126)
  {
    unsigned int v13 = *(_DWORD *)(a1 + 176);
    if (!(v13 >> 28))
    {
      int16x8_t v14 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v13), (uint32x4_t)xmmword_1F9C0);
      *(int16x4_t *)v14.i8 = vrev64_s16((int16x4_t)vand_s8( (int8x8_t)vmovn_s32((int32x4_t)v14),  (int8x8_t)0x7F007F007F007FLL));
      unsigned __int32 v15 = vmovn_s16(v14).u32[0];
    }

    uint64_t v10 = a1 + 8;
    int64_t v9 = (char **)(a1 + 16);
LABEL_19:
    sub_3E3C(v10, *v9, (char *)&v15, v16, 4LL);
    goto LABEL_20;
  }

  if (v7 != 127) {
    return 4294956452LL;
  }
LABEL_20:
  char v18 = -9;
  sub_3E3C(a1 + 8, *(char **)(a1 + 16), &v18, (char *)&v19, 1LL);
  return 0LL;
}

char *sub_3BE4(uint64_t a1)
{
  v2[0] = xmmword_1F9D0;
  v2[1] = xmmword_1F9E0;
  v2[2] = xmmword_1F9F0;
  return sub_3E3C(a1 + 8, *(char **)(a1 + 16), (char *)v2, v3, 48LL);
}

uint64_t sub_3C68(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t result = 4294956452LL;
  if (a2 && a3)
  {
    uint64_t v6 = *a2;
    __src[0] = v6 & 0x7F;
    __src[1] = (v6 >> 7) & 0x7F;
    sub_3E3C(a1 + 8, *(char **)(a1 + 16), __src, (char *)&v15, 2LL);
    if (v6)
    {
      int v7 = (char *)a2 + 7;
      uint64_t v8 = v6;
      do
      {
        sub_3E3C(a1 + 8, *(char **)(a1 + 16), v7 - 5, v7, 5LL);
        v7 += 5;
        --v8;
      }

      while (v8);
    }

    __int16 v9 = 5 * v6;
    uint64_t v10 = *(unsigned __int16 *)((char *)a2 + (unsigned __int16)(v9 + 2));
    v13[0] = v10 & 0x7F;
    v13[1] = (v10 >> 7) & 0x7F;
    sub_3E3C(a1 + 8, *(char **)(a1 + 16), v13, __src, 2LL);
    if ((_DWORD)v10)
    {
      unsigned int v11 = (char *)a2 + (unsigned __int16)(v9 + 4);
      do
      {
        int16x8_t v12 = v11 + 5;
        sub_3E3C(a1 + 8, *(char **)(a1 + 16), v11, v11 + 5, 5LL);
        unsigned int v11 = v12;
        --v10;
      }

      while (v10);
    }

    return 0LL;
  }

  return result;
}

void sub_3D80()
{
}

void *sub_3D94(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_3D80();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

char *sub_3E3C(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unsigned int v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_2CF0();
    }
    unsigned int v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      char v17 = (char *)operator new(v15);
    }

    else
    {
      size_t v16 = 0LL;
      char v17 = 0LL;
    }

    v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }

      while (v13);
      uint64_t v10 = *(char **)(a1 + 8);
      v28 = v17;
    }

    v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }

  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    uint64_t v19 = &__src[a5];
    v21 = *(char **)(a1 + 8);
LABEL_17:
    uint64_t v22 = &v5[a5];
    v23 = &v21[-a5];
    unint64_t v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      unint64_t v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }

      while (v25);
    }

    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }

  uint64_t v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t sub_4024(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_24628;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0LL;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0LL);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_1DBFC(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_24530;
    exception[2] = v5;
  }

  return a1;
}

uint64_t sub_40B4(uint64_t a1)
{
  *(void *)a1 = off_24628;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_40E8(char *a1)
{
  *(void *)a1 = off_24628;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  operator delete(a1);
}

BOOL sub_411C(uint64_t a1)
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
        sub_1DC30(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_24530;
      exception[2] = v7;
    }

    atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  }

  return v4 == 0;
}

void sub_41C4(uint64_t a1)
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
        sub_1DC64(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_24530;
      exception[2] = v5;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own",  v15,  2u);
  }

uint64_t sub_4298(uint64_t a1, char *a2)
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
        sub_1DC98((uint64_t)v11, v9);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_24530;
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

BOOL sub_4394(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 16));
  return v1 == 0;
}

BOOL sub_43A8(uint64_t a1)
{
  uint64_t v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  return pthread_equal(v2, v3) != 0;
}

void sub_43DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_43F4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 20)) {
    (*(void (**)(void))(**(void **)(a1 + 8) + 72LL))(*(void *)(a1 + 8));
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  IOObjectRelease(*(_DWORD *)a1);
  int v3 = *(void **)(a1 + 32);
  if (v3) {
    operator delete[](v3);
  }
  return a1;
}

uint64_t sub_445C(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    io_service_t v4 = *(_DWORD *)a1;
    int v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Du,  0xC7u,  0xB7u,  0x80u,  0x9Eu,  0xC0u,  0x11u,  0xD4u,  0xA5u,  0x4Fu,  0,  0xAu,  0x27u,  5u,  0x28u,  0x61u);
    char v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v4, v5, v6, &theInterface, &theScore)
      || (usleep(0x186A0u),
          io_service_t v7 = *(_DWORD *)a1,
          uint64_t v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Du,  0xC7u,  0xB7u,  0x80u,  0x9Eu,  0xC0u,  0x11u,  0xD4u,  0xA5u,  0x4Fu,  0,  0xAu,  0x27u,  5u,  0x28u,  0x61u),  v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  !IOCreatePlugInInterfaceForService(v7, v8, v9, &theInterface, &theScore)))
    {
      uint64_t v10 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      uint64_t v12 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFEu,  0x2Fu,  0xD5u,  0x2Fu,  0x3Bu,  0x5Au,  0x47u,  0x3Bu,  0x97u,  0x7Bu,  0xADu,  0x99u,  0,  0x1Eu,  0xB3u,  0xEDu);
      CFUUIDBytes v13 = CFUUIDGetUUIDBytes(v12);
      int v14 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)( v10,  *(void *)&v13.byte0,  *(void *)&v13.byte8,  v3);
      uint64_t v15 = theInterface;
      size_t v16 = *theInterface;
      if (v14)
      {
        char v17 = v16->QueryInterface;
        uint64_t v18 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC8u,  9u,  0xB8u,  0xD8u,  8u,  0x84u,  0x11u,  0xD7u,  0xBBu,  0x96u,  0,  3u,  0x93u,  0x3Eu,  0x3Eu,  0x3Eu);
        CFUUIDBytes v19 = CFUUIDGetUUIDBytes(v18);
        int v20 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))v17)( v15,  *(void *)&v19.byte0,  *(void *)&v19.byte8,  v3);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0LL;
        if (v20)
        {
          sub_4788();
          v21 = (os_log_s *)qword_28118;
          if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            int64_t v25 = "USBDevice.cpp";
            __int16 v26 = 1024;
            int v27 = 123;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
          }

          *(void *)uint64_t v3 = 0LL;
          return *(void *)v3;
        }
      }

      else
      {
        ((void (*)(IOCFPlugInInterface **))v16->Release)(theInterface);
        theInterface = 0LL;
      }

      (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 160LL))(*(void *)(a1 + 8), a1 + 16);
    }

    return *(void *)v3;
  }

  return result;
}

void sub_4788()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28120);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28120))
    {
      qword_28118 = (uint64_t)os_log_create("com.apple.coremidi", "usbdev");
      __cxa_guard_release(&qword_28120);
    }
  }

_BYTE *sub_47E4(_BYTE *result)
{
  if (!result[21])
  {
    unint64_t v1 = result;
    result[21] = 1;
    uint64_t result = (_BYTE *)sub_48D0((uint64_t)result, 3, 0, 0, v8, 256);
    if ((int)result >= 3)
    {
      int v2 = v8[0];
      signed int v3 = v8[0] - 2 + (((v8[0] - 2) & 0x8000u) >> 15);
      int v4 = v3 >> 1;
      *((_WORD *)v1 + 12) = v3 >> 1;
      uint64_t result = operator new[](v3 & 0x1FFFE);
      *((void *)v1 + 4) = result;
      if ((v2 - 1) >= 3)
      {
        char v6 = (__int16 *)result;
        unsigned int v7 = (unsigned __int16)v4;
        if ((v4 & 0xFFFE) == 0) {
          unsigned int v7 = 1;
        }
        uint64_t result = memcpy(result, v9, 2LL * v7);
        __int16 v5 = *v6;
      }

      *((_WORD *)v1 + 11) = v5;
    }
  }

  return result;
}

uint64_t sub_48D0(uint64_t a1, int a2, __int16 a3, __int16 a4, _BYTE *a5, __int16 a6)
{
  uint64_t v12 = sub_445C(a1);
  if (v12)
  {
    uint64_t v13 = v12;
    __int16 v24 = 1664;
    __int16 v14 = a3 | ((_WORD)a2 << 8);
    __int16 v25 = v14;
    __int16 v26 = a4;
    v28 = a5;
    if (a2 == 3) {
      __int16 v15 = 2;
    }
    else {
      __int16 v15 = a6;
    }
    __int16 v27 = v15;
    unsigned int v16 = 0;
    do
    {
      usleep(0x1388u);
      int v17 = (*(uint64_t (**)(void))(*(void *)v13 + 64LL))(*(void *)(a1 + 8));
      int v18 = v17;
      if (v16 > 0x12) {
        break;
      }
      ++v16;
    }

    while (v17);
    if (!v17)
    {
LABEL_12:
      int v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v13 + 208LL))(v13, &v24);
      if (a2 == 3)
      {
        if (v20) {
          BOOL v21 = v20 == -536870168;
        }
        else {
          BOOL v21 = 1;
        }
        if (!v21) {
          return 0xFFFFFFFFLL;
        }
        __int16 v22 = *a5;
        if (!*a5) {
          return 0LL;
        }
        __int16 v24 = 1664;
        __int16 v25 = v14;
        __int16 v26 = a4;
        __int16 v27 = v22;
        v28 = a5;
        int v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v13 + 208LL))(v13, &v24);
      }

      if (!v20) {
        return v29;
      }
      return 0xFFFFFFFFLL;
    }

    sub_4788();
    CFUUIDBytes v19 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v31 = "USBDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 264;
      __int16 v34 = 1024;
      int v35 = v18;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d USBDevice::LoadDescriptor - Could not open device due to error 0x%x",  buf,  0x18u);
    }
  }

  return 0xFFFFFFFFLL;
}

CFStringRef sub_4AB8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  __int16 v2 = a2;
  sub_47E4((_BYTE *)a1);
  int v4 = sub_48D0(a1, 3, v2, *(_WORD *)(a1 + 22), v6, 256);
  if (v4 >= 3) {
    return CFStringCreateWithCharacters(0LL, v7, (v4 - 2) >> 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_4B3C(uint64_t a1, int a2, int a3, uint64_t a4, int a5, _DWORD *a6)
{
  uint64_t v12 = (os_log_s *)qword_28118;
  if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v47 = "USBDevice.cpp";
    __int16 v48 = 1024;
    int v49 = 309;
    __int16 v50 = 1024;
    *(_DWORD *)__int16 v51 = a2;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = a3;
    __int16 v52 = 2048;
    uint64_t v53 = a4;
    __int16 v54 = 1024;
    int v55 = a5;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBDevice::LoadGroupTerminalDescriptors(interface: %d, altSettingNumber: %d, buf:%p, len:%d)",  buf,  0x2Eu);
  }

  *a6 = 0;
  uint64_t v13 = sub_445C(a1);
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = (*(uint64_t (**)(void))(*(void *)v13 + 64LL))(*(void *)(a1 + 8));
    if (!v15) {
      goto LABEL_13;
    }
    int v16 = v15;
    sub_4788();
    int v17 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v47 = "USBDevice.cpp";
      __int16 v48 = 1024;
      int v49 = 320;
      __int16 v50 = 1024;
      *(_DWORD *)__int16 v51 = v16;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "%25s:%-5d      USBDeviceOpen failed with error 0x%x. Will retrying ...",  buf,  0x18u);
    }

    unsigned int v18 = 0;
    do
    {
      usleep(0x1388u);
      uint64_t v19 = (*(uint64_t (**)(void))(*(void *)v14 + 64LL))(*(void *)(a1 + 8));
      uint64_t v20 = v19;
      if (v18 > 3) {
        break;
      }
      ++v18;
    }

    while ((_DWORD)v19);
    if ((_DWORD)v19)
    {
      sub_4788();
      uint64_t v21 = qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 326;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v20;
        __int16 v22 = "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors() - Could not open device due to error 0x%x";
        v23 = (os_log_s *)v21;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        uint32_t v25 = 24;
LABEL_44:
        _os_log_impl(&dword_0, v23, v24, v22, buf, v25);
      }
    }

    else
    {
LABEL_13:
      __int16 v40 = 1665;
      unsigned __int16 v41 = a3 | 0x2600;
      unsigned __int16 v42 = a2;
      uint64_t v44 = a4;
      uint64_t v45 = 0LL;
      unsigned __int16 v43 = a5;
      uint64_t v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v14 + 208LL))(v14, &v40);
      sub_4788();
      __int16 v26 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 23;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] LogDeviceRequest()", buf, 0x12u);
      }

      sub_4788();
      __int16 v27 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 24;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v40;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, "%25s:%-5d      bmRequestType: 0x%00x", buf, 0x18u);
      }

      sub_4788();
      v28 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 25;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = HIBYTE(v40);
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d      bRequest:      0x%00x", buf, 0x18u);
      }

      sub_4788();
      unsigned int v29 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 26;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v41;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wValue:        0x%0000x", buf, 0x18u);
      }

      sub_4788();
      v30 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 27;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v42;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wIndex:        0x%0000x", buf, 0x18u);
      }

      sub_4788();
      v31 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 28;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v43;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wLength:       %u", buf, 0x18u);
      }

      sub_4788();
      __int16 v32 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 29;
        __int16 v50 = 2048;
        *(void *)__int16 v51 = v44;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d      pData:         %p", buf, 0x1Cu);
      }

      sub_4788();
      int v33 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 30;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v45;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d      wLenDone:      %u", buf, 0x18u);
      }

      sub_4788();
      __int16 v34 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 31;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] LogDeviceRequest()", buf, 0x12u);
      }

      if ((_DWORD)v20 == -536854449)
      {
        sub_4788();
        int v35 = (os_log_s *)qword_28118;
        if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v47 = "USBDevice.cpp";
          __int16 v48 = 1024;
          int v49 = 342;
          _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Pipe stall on DeviceRequest(). Will retry once only.",  buf,  0x12u);
        }

        uint64_t v20 = (*(uint64_t (**)(uint64_t, __int16 *))(*(void *)v14 + 208LL))(v14, &v40);
      }

      if ((_DWORD)v20)
      {
        sub_4788();
        v36 = (os_log_s *)qword_28118;
        if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v47 = "USBDevice.cpp";
          __int16 v48 = 1024;
          int v49 = 346;
          __int16 v50 = 1024;
          *(_DWORD *)__int16 v51 = v20;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      DeviceRequest() returned error 0x%x",  buf,  0x18u);
        }
      }

      else
      {
        *a6 = v45;
      }

      sub_4788();
      uint64_t v38 = qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v47 = "USBDevice.cpp";
        __int16 v48 = 1024;
        int v49 = 350;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v45;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v20;
        __int16 v22 = "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors(outLength: %u) = %d";
        v23 = (os_log_s *)v38;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        uint32_t v25 = 30;
        goto LABEL_44;
      }
    }
  }

  else
  {
    sub_4788();
    __int16 v37 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v47 = "USBDevice.cpp";
      __int16 v48 = 1024;
      int v49 = 313;
      _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [-] USBDevice::LoadGroupTerminalDescriptors() - Could not get plugin interface!",  buf,  0x12u);
    }

    return 4294956451LL;
  }

  return v20;
}

uint64_t sub_5388(uint64_t a1)
{
  uint64_t v3 = a1 + 16;
  uint64_t result = *(void *)(a1 + 16);
  if (!result)
  {
    io_service_t v4 = *(_DWORD *)(a1 + 8);
    __int16 v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Du,  0x97u,  0x86u,  0xC6u,  0x9Eu,  0xF3u,  0x11u,  0xD4u,  0xADu,  0x51u,  0,  0xAu,  0x27u,  5u,  0x28u,  0x61u);
    char v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v4, v5, v6, &theInterface, &theScore))
    {
      unsigned int v7 = theInterface;
      QueryInterface = (*theInterface)->QueryInterface;
      int v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x64u,  0xBAu,  0xBDu,  0xD2u,  0xFu,  0x6Bu,  0x4Bu,  0x4Fu,  0x8Eu,  0x3Eu,  0xDCu,  0x36u,  4u,  0x69u,  0x87u,  0xADu);
      CFUUIDBytes v10 = CFUUIDGetUUIDBytes(v9);
      int v11 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)( v7,  *(void *)&v10.byte0,  *(void *)&v10.byte8,  v3);
      uint64_t v12 = theInterface;
      uint64_t v13 = *theInterface;
      if (v11)
      {
        uint64_t v14 = v13->QueryInterface;
        int v15 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x8Fu,  0xDBu,  0x84u,  0x55u,  0x74u,  0xA6u,  0x11u,  0xD6u,  0x97u,  0xB1u,  0,  0x30u,  0x65u,  0xD3u,  0x60u,  0x8Eu);
        CFUUIDBytes v16 = CFUUIDGetUUIDBytes(v15);
        int v17 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t))v14)( v12,  *(void *)&v16.byte0,  *(void *)&v16.byte8,  v3);
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0LL;
        if (v17)
        {
          sub_4788();
          unsigned int v18 = (os_log_s *)qword_28118;
          if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v22 = "USBDevice.cpp";
            __int16 v23 = 1024;
            int v24 = 513;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
          }

          *(void *)uint64_t v3 = 0LL;
        }
      }

      else
      {
        ((void (*)(IOCFPlugInInterface **))v13->Release)(theInterface);
      }
    }

    return *(void *)v3;
  }

  return result;
}

uint64_t sub_5608(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25)) {
    (*(void (**)(void))(**(void **)(a1 + 16) + 72LL))(*(void *)(a1 + 16));
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  IOObjectRelease(*(_DWORD *)(a1 + 8));
  if (*(_BYTE *)(a1 + 24) && *(void *)a1)
  {
    uint64_t v3 = (void *)sub_43F4(*(void *)a1);
    operator delete(v3);
  }

  return a1;
}

uint64_t sub_5678(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25)) {
    return 1LL;
  }
  uint64_t v4 = sub_5388(a1);
  if (!v4) {
    return 0LL;
  }
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 64LL))(v4);
  if (v5)
  {
    int v7 = v5;
    sub_4788();
    uint64_t v8 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      CFUUIDBytes v10 = "USBDevice.cpp";
      __int16 v11 = 1024;
      int v12 = 487;
      __int16 v13 = 1024;
      LODWORD(v14) = v7;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBInterface::Open() - err = 0x%x",  (uint8_t *)&v9,  0x18u);
    }

    return 0LL;
  }

  uint64_t v1 = 1LL;
  *(_BYTE *)(a1 + 25) = 1;
  sub_4788();
  char v6 = (os_log_s *)qword_28118;
  if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    CFUUIDBytes v10 = "USBDevice.cpp";
    __int16 v11 = 1024;
    int v12 = 482;
    __int16 v13 = 2048;
    uint64_t v14 = a1;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [?] USBInterface(%p)::Open() - success",  (uint8_t *)&v9,  0x1Cu);
  }

  return v1;
}

uint64_t sub_57F4(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  *(_BYTE *)(a3 + 6) = a2;
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 16)
                                                                                                + 208LL))( *(void *)(a1 + 16),  a2,  a3 + 1,  a3,  a3 + 2,  a3 + 4,  a3 + 3);
}

uint64_t sub_5820(uint64_t a1, io_object_t object)
{
  *(_DWORD *)a1 = object;
  *(void *)(a1 + 8) = 0LL;
  *(_BYTE *)(a1 + 24) = 0;
  IOObjectRetain(object);
  if (!sub_5874(a1))
  {
    usleep(0x186A0u);
    sub_5874(a1);
  }

  return a1;
}

uint64_t sub_5874(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    uint64_t v4 = (void *)(a1 + 16);
    io_service_t v5 = *(_DWORD *)a1;
    char v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Eu,  0x72u,  0x21u,  0x7Eu,  0x8Au,  0x60u,  0x11u,  0xDBu,  0xBFu,  0x57u,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
    int v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v5, v6, v7, (IOCFPlugInInterface ***)(a1 + 16), &theScore))
    {
      uint64_t v8 = *v4;
      int v9 = *(unsigned int (**)(uint64_t, void, void, uint64_t))(*(void *)*v4 + 8LL);
      CFUUIDBytes v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xEAu,  0x33u,  0xBAu,  0x4Fu,  0x8Au,  0x60u,  0x11u,  0xDBu,  0x84u,  0xDBu,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
      CFUUIDBytes v11 = CFUUIDGetUUIDBytes(v10);
      if (v9(v8, *(void *)&v11.byte0, *(void *)&v11.byte8, v3))
      {
        sub_4788();
        int v12 = (os_log_s *)qword_28118;
        if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          int v15 = "USBDevice.cpp";
          __int16 v16 = 1024;
          int v17 = 653;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d QueryInterface failed", buf, 0x12u);
        }

        *(void *)uint64_t v3 = 0LL;
        (*(void (**)(void))(*(void *)*v4 + 24LL))(*v4);
      }

      else
      {
        sub_5EBC(a1);
      }
    }

    return *(void *)v3;
  }

  return result;
}

uint64_t sub_5A80(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_28118;
  if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    int v7 = "USBDevice.cpp";
    __int16 v8 = 1024;
    int v9 = 557;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Destroying USBIDAMInterface.", (uint8_t *)&v6, 0x12u);
  }

  sub_5B78(a1);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24LL))(v3);
  }
  uint64_t v4 = *(IOCFPlugInInterface ***)(a1 + 16);
  if (v4) {
    IODestroyPlugInInterface(v4);
  }
  IOObjectRelease(*(_DWORD *)a1);
  return a1;
}

void sub_5B6C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_29BC(a1);
}

uint64_t sub_5B78(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
  {
    sub_4788();
    int v9 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      int v15 = "USBDevice.cpp";
      __int16 v16 = 1024;
      int v17 = 605;
      CFUUIDBytes v10 = "%25s:%-5d Already closed.";
      goto LABEL_14;
    }

    return 1LL;
  }

  uint64_t result = sub_5874(a1);
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  CFRunLoopRef v4 = MIDIGetDriverIORunLoop();
  if (v4)
  {
    CFRunLoopRef v5 = v4;
    int v6 = (*(uint64_t (**)(uint64_t, CFRunLoopRef, const CFRunLoopMode))(*(void *)v3 + 56LL))( v3,  v4,  kCFRunLoopDefaultMode);
    if (!v6)
    {
      sub_4788();
      int v7 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315650;
        int v15 = "USBDevice.cpp";
        __int16 v16 = 1024;
        int v17 = 616;
        __int16 v18 = 2048;
        CFRunLoopRef v19 = v5;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Unscheduled from runloop %p", (uint8_t *)&v14, 0x1Cu);
      }

      sub_4788();
      __int16 v8 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        int v15 = "USBDevice.cpp";
        __int16 v16 = 1024;
        int v17 = 623;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Closing the interface ...", (uint8_t *)&v14, 0x12u);
      }

      int v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)v3 + 40LL))(v3, 0LL);
      if (!v6)
      {
        *(_BYTE *)(a1 + 24) = 0;
        sub_4788();
        int v9 = (os_log_s *)qword_28118;
        if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 136315394;
          int v15 = "USBDevice.cpp";
          __int16 v16 = 1024;
          int v17 = 626;
          CFUUIDBytes v10 = "%25s:%-5d Closed the interface.";
LABEL_14:
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0x12u);
          return 1LL;
        }

        return 1LL;
      }
    }

    int v11 = v6;
  }

  else
  {
    int v11 = -536870160;
    sub_4788();
    int v12 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      int v15 = "USBDevice.cpp";
      __int16 v16 = 1024;
      int v17 = 618;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Driver I/O runloop not found!", (uint8_t *)&v14, 0x12u);
    }
  }

  sub_4788();
  __int16 v13 = (os_log_s *)qword_28118;
  uint64_t result = os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)result)
  {
    int v14 = 136315650;
    int v15 = "USBDevice.cpp";
    __int16 v16 = 1024;
    int v17 = 630;
    __int16 v18 = 1024;
    LODWORD(v19) = v11;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d error 0x%x", (uint8_t *)&v14, 0x18u);
    return 0LL;
  }

  return result;
}

uint64_t sub_5EBC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24))
  {
    sub_4788();
    uint64_t v1 = qword_28118;
    if (!os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG)) {
      return 1LL;
    }
    int v17 = 136315394;
    __int16 v18 = "USBDevice.cpp";
    __int16 v19 = 1024;
    int v20 = 571;
    uint64_t v2 = "%25s:%-5d Already open.";
    uint64_t v3 = (os_log_s *)v1;
    uint32_t v4 = 18;
LABEL_4:
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, v2, (uint8_t *)&v17, v4);
    return 1LL;
  }

  uint64_t result = sub_5874();
  if (result)
  {
    uint64_t v7 = result;
    int v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)result + 32LL))(result, 0LL);
    int v9 = v8;
    if (v8)
    {
      if (v8 != -536870203)
      {
LABEL_19:
        sub_4788();
        __int16 v16 = (os_log_s *)qword_28118;
        uint64_t result = os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG);
        if ((_DWORD)result)
        {
          int v17 = 136315650;
          __int16 v18 = "USBDevice.cpp";
          __int16 v19 = 1024;
          int v20 = 598;
          __int16 v21 = 1024;
          LODWORD(v22) = v9;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d error 0x%x", (uint8_t *)&v17, 0x18u);
          return 0LL;
        }

        return result;
      }

      sub_4788();
      CFUUIDBytes v10 = (os_log_s *)qword_28118;
      if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315394;
        __int16 v18 = "USBDevice.cpp";
        __int16 v19 = 1024;
        int v20 = 582;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d kIOReturnExclusiveAccess encountered but continuing.",  (uint8_t *)&v17,  0x12u);
      }
    }

    *(_BYTE *)(a1 + 24) = 1;
    sub_4788();
    int v11 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315394;
      __int16 v18 = "USBDevice.cpp";
      __int16 v19 = 1024;
      int v20 = 586;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Opened the interface.", (uint8_t *)&v17, 0x12u);
    }

    CFRunLoopRef v12 = MIDIGetDriverIORunLoop();
    if (v12)
    {
      CFRunLoopRef v13 = v12;
      int v14 = (*(uint64_t (**)(uint64_t, CFRunLoopRef, const CFRunLoopMode))(*(void *)v7 + 48LL))( v7,  v12,  kCFRunLoopDefaultMode);
      if (!v14)
      {
        sub_4788();
        uint64_t v15 = qword_28118;
        if (!os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG)) {
          return 1LL;
        }
        int v17 = 136315650;
        __int16 v18 = "USBDevice.cpp";
        __int16 v19 = 1024;
        int v20 = 592;
        __int16 v21 = 2048;
        CFRunLoopRef v22 = v13;
        uint64_t v2 = "%25s:%-5d Scheduled onto runloop %p";
        uint64_t v3 = (os_log_s *)v15;
        uint32_t v4 = 28;
        goto LABEL_4;
      }

      int v9 = v14;
    }

    goto LABEL_19;
  }

  return result;
}

BOOL sub_61B0(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (sub_5874(a1)
    && !(*(unsigned int (**)(void, char *, uint64_t *))(**(void **)(a1 + 8) + 288LL))( *(void *)(a1 + 8),  (char *)&v5 + 4,  &v5))
  {
    sub_4788();
    uint32_t v4 = (os_log_s *)qword_28118;
    if (os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = "USBDevice.cpp";
      __int16 v8 = 1024;
      int v9 = 670;
      __int16 v10 = 1024;
      int v11 = HIDWORD(v5);
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d USBIDAMInterface::Usable() - active: %d speed: %d",  buf,  0x1Eu);
    }

    if (HIDWORD(v5)) {
      return 1LL;
    }
  }

  sub_4788();
  uint64_t v2 = (os_log_s *)qword_28118;
  BOOL result = os_log_type_enabled((os_log_t)qword_28118, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "USBDevice.cpp";
    __int16 v8 = 1024;
    int v9 = 674;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d USBIDAMInterface::Usable() - NOT active!", buf, 0x12u);
    return 0LL;
  }

  return result;
}

uint64_t sub_631C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v8 = 0LL;
  int v7 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, BOOL, void, uint64_t *))(**(void **)(a1 + 8) + 296LL))( *(void *)(a1 + 8),  2LL,  a2 != 1,  0LL,  &v8);
  if (!(_DWORD)result)
  {
    *(void *)(a3 + 8) = v8;
    *(_BYTE *)(a3 + 1) = a2 != 1;
    *(_WORD *)(a3 + 2) = 2;
    *(_BYTE *)a3 = 0;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 200LL))(*(void *)(a1 + 8));
    if (!(_DWORD)result) {
      *(_WORD *)(a3 + 4) = v7;
    }
  }

  return result;
}

uint64_t sub_63C0(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 8) = 0LL;
  }

  return a1;
}

uint64_t sub_63F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = sub_F104(a1, a2, 0LL, 0LL, a4);
  *(void *)uint64_t result = off_24698;
  *(void *)(result + 496) = a2;
  *(void *)(result + 504) = a3;
  *(void *)(result + 512) = 0LL;
  *(_WORD *)(result + 524) = 0;
  *(void *)(result + 528) = -1LL;
  *(_WORD *)(result + 540) = 0;
  uint64_t v7 = 552LL;
  *(void *)(result + 544) = -1LL;
  do
  {
    uint64_t v8 = (void *)(result + v7);
    *uint64_t v8 = 0LL;
    v8[1] = 0LL;
    *(void *)((char *)v8 + 13) = 0LL;
    v7 += 24LL;
  }

  while (v7 != 600);
  *(void *)(result + 600) = 0LL;
  *(void *)(result + 608) = 0LL;
  *(void *)(result + 613) = 0LL;
  *(_BYTE *)(result + 624) = 0;
  return result;
}

uint64_t sub_647C(void *a1)
{
  uint64_t v2 = (os_log_s *)qword_28128;
  if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
  {
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 87;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] IDAMMIDIDevice::Initialize()", (uint8_t *)&v26, 0x12u);
  }

  uint64_t v3 = a1[63];
  if (!v3)
  {
    sub_68E8();
    __int16 v23 = (os_log_s *)qword_28128;
    if (!os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 89;
    int v24 = "%25s:%-5d [!] Could not open interface! Returning false.";
LABEL_27:
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0x12u);
    return 0LL;
  }

  uint64_t v4 = sub_5874(v3);
  a1[64] = v4;
  if (!v4)
  {
    sub_68E8();
    __int16 v23 = (os_log_s *)qword_28128;
    if (!os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 95;
    int v24 = "%25s:%-5d [!] Could not get the plugin interface! Returning false.";
    goto LABEL_27;
  }

  (*(void (**)(void *))(*a1 + 56LL))(a1);
  if ((*(unsigned int (**)(void *))(*a1 + 112LL))(a1)
    && (*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
  {
    sub_68E8();
    uint64_t v5 = (os_log_s *)qword_28128;
    if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315394;
      __int16 v27 = "IDAMMIDIDevice.cpp";
      *(_WORD *)v28 = 1024;
      *(_DWORD *)&v28[2] = 105;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Allocating read and write buffers...",  (uint8_t *)&v26,  0x12u);
    }

    uint64_t v6 = 0LL;
    char v7 = 1;
    while (1)
    {
      char v8 = v7;
      int v9 = &a1[3 * v6];
      uint64_t v10 = a1[64];
      uint64_t v11 = *((unsigned __int16 *)a1 + 262);
      v9[69] = a1;
      int v12 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(*(void *)v10 + 208LL))(v10, v11, v9 + 70);
      int v13 = v12 ? 0 : v11;
      *((_DWORD *)v9 + 142) = v13;
      if (v12) {
        break;
      }
      char v7 = 0;
      uint64_t v6 = 1LL;
      if ((v8 & 1) == 0)
      {
        uint64_t v14 = a1[64];
        uint64_t v15 = *((unsigned __int16 *)a1 + 270);
        a1[75] = a1;
        int v16 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(*(void *)v14 + 208LL))(v14, v15, a1 + 76);
        if (v16) {
          int v17 = 0;
        }
        else {
          int v17 = v15;
        }
        *((_DWORD *)a1 + 154) = v17;
        if (v16) {
          break;
        }
        *((_BYTE *)a1 + 624) = 0;
        sub_68E8();
        __int16 v18 = (os_log_s *)qword_28128;
        uint64_t v19 = 1LL;
        if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = a1[68];
          uint64_t v21 = a1[66];
          int v26 = 136315906;
          __int16 v27 = "IDAMMIDIDevice.cpp";
          *(_WORD *)v28 = 1024;
          *(_DWORD *)&v28[2] = 114;
          __int16 v29 = 1024;
          int v30 = v20;
          __int16 v31 = 1024;
          int v32 = v21;
          _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Starting IDAM MIDI: mIDAMOutPipe=%d, mIDAMInPipe=%d",  (uint8_t *)&v26,  0x1Eu);
        }

        (*(void (**)(void *, uint64_t))(*a1 + 24LL))(a1, 1LL);
        a1[60] = MIDITimerTaskCreate(sub_11DDC, a1);
        sub_6944((uint64_t)a1, (uint64_t)(a1 + 69));
        sub_6944((uint64_t)a1, (uint64_t)(a1 + 72));
        int v26 = 1;
        __int16 v27 = 0LL;
        *(_DWORD *)v28 = -135266302;
        (*(void (**)(void *, int *, void))(*a1 + 88LL))(a1, &v26, 0LL);
        sub_68E8();
        CFRunLoopRef v22 = (os_log_s *)qword_28128;
        if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315394;
          __int16 v27 = "IDAMMIDIDevice.cpp";
          *(_WORD *)v28 = 1024;
          *(_DWORD *)&v28[2] = 137;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] IDAMMIDIDevice::Initialize() = true",  (uint8_t *)&v26,  0x12u);
        }

        return v19;
      }
    }
  }

  sub_68E8();
  __int16 v23 = (os_log_s *)qword_28128;
  if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_ERROR))
  {
    int v26 = 136315394;
    __int16 v27 = "IDAMMIDIDevice.cpp";
    *(_WORD *)v28 = 1024;
    *(_DWORD *)&v28[2] = 140;
    int v24 = "%25s:%-5d [!] IDAMMIDIDevice::Initialize() = false";
    goto LABEL_27;
  }

  return 0LL;
}

void sub_68E8()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28130);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28130))
    {
      qword_28128 = (uint64_t)os_log_create("com.apple.coremidi", "idamio");
      __cxa_guard_release(&qword_28130);
    }
  }

void sub_6944(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 20) = 1;
  int v4 = (*(uint64_t (**)(void, void, void, void, void (*)(uint64_t *, int, uint64_t), uint64_t))(**(void **)(a1 + 512) + 160LL))( *(void *)(a1 + 512),  *(void *)(a1 + 528),  *(void *)(a2 + 8),  *(unsigned __int16 *)(a1 + 524),  sub_70F4,  a2);
  if (v4 == -536854449 || v4 == -536870163) {
    int v4 = (*(uint64_t (**)(void, void, void, void, void (*)(uint64_t *, int, uint64_t), uint64_t))(**(void **)(a1 + 512) + 160LL))( *(void *)(a1 + 512),  *(void *)(a1 + 528),  *(void *)(a2 + 8),  *(unsigned __int16 *)(a1 + 524),  sub_70F4,  a2);
  }
  int v6 = v4;
  if (v4)
  {
    sub_68E8();
    char v7 = (os_log_s *)qword_28128;
    if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315650;
      int v9 = "IDAMMIDIDevice.cpp";
      __int16 v10 = 1024;
      int v11 = 282;
      __int16 v12 = 1024;
      int v13 = v6;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] IDAMMIDIDevice::DoRead() failed with error 0x%x",  (uint8_t *)&v8,  0x18u);
    }
  }

void *sub_6A8C(void *a1)
{
  *a1 = off_24698;
  sub_68E8();
  uint64_t v2 = (os_log_s *)qword_28128;
  if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "IDAMMIDIDevice.cpp";
    __int16 v17 = 1024;
    int v18 = 149;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d Destroying IDAMMIDIDevice.", (uint8_t *)&v15, 0x12u);
  }

  *((_BYTE *)a1 + 184) = 1;
  (*(void (**)(void *, void))(*a1 + 24LL))(a1, 0LL);
  if (((*(uint64_t (**)(void *))(*a1 + 112LL))(a1) & 1) != 0
    || (*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
  {
    (*(void (**)(void, void *))(*(void *)a1[10] + 160LL))(a1[10], a1);
  }

  if ((*(unsigned int (**)(void *))(*a1 + 112LL))(a1))
  {
    (*(void (**)(void, void))(*(void *)a1[64] + 192LL))(a1[64], a1[68]);
    a1[68] = -1LL;
  }

  if ((*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
  {
    (*(void (**)(void, void))(*(void *)a1[64] + 192LL))(a1[64], a1[66]);
    a1[66] = -1LL;
  }

  unsigned int v5 = 200;
  while (v5 >= 2)
  {
    uint64_t v6 = 0LL;
    --v5;
    char v7 = 1;
    while (!BYTE4(a1[3 * v6 + 71]))
    {
      char v8 = v7;
      char v7 = 0;
      uint64_t v6 = 1LL;
      if ((v8 & 1) == 0)
      {
        if (!*((_BYTE *)a1 + 620)) {
          goto LABEL_17;
        }
        break;
      }
    }

    usleep(0x2710u);
  }

LABEL_17:
  uint64_t v9 = a1[60];
  if (v9)
  {
    MIDITimerTaskDispose(v9, v3, v4);
    a1[60] = 0LL;
  }

  sub_68E8();
  __int16 v10 = (os_log_s *)qword_28128;
  if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    int v16 = "IDAMMIDIDevice.cpp";
    __int16 v17 = 1024;
    int v18 = 197;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%25s:%-5d IDAM driver stopped MIDI.\n", (uint8_t *)&v15, 0x12u);
  }

  sub_63C0((uint64_t)(a1 + 75));
  for (uint64_t i = 72LL; i != 66; i -= 3LL)
    sub_63C0((uint64_t)&a1[i]);
  sub_11E70(a1, v12, v13);
  return a1;
}

void sub_6CFC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_29BC(a1);
  }
  _Unwind_Resume(a1);
}

void sub_6D10(void *a1)
{
  uint64_t v1 = sub_6A8C(a1);
  operator delete(v1);
}

void sub_6D24(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_28128;
  if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    char v7 = "IDAMMIDIDevice.cpp";
    __int16 v8 = 1024;
    int v9 = 212;
    __int16 v10 = 1024;
    int v11 = 2;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_INFO,  "%25s:%-5d [?] IDAMMIDIDevice::FindPipes() - Finding %d endpoints",  buf,  0x18u);
  }

  for (int i = 1; i != 3; ++i)
  {
    WORD2(v5) = 0;
    *((void *)&v5 + 1) = -1LL;
    if (!sub_631C(*(void *)(a1 + 504), i, (uint64_t)&v5))
    {
      if (BYTE1(v5) == 1)
      {
        *(_OWORD *)(a1 + 536) = v5;
      }

      else if (BYTE1(v5))
      {
        sub_68E8();
        uint64_t v4 = (os_log_s *)qword_28128;
        if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          char v7 = "IDAMMIDIDevice.cpp";
          __int16 v8 = 1024;
          int v9 = 224;
          __int16 v10 = 1024;
          int v11 = i;
          __int16 v12 = 1024;
          int v13 = BYTE1(v5);
          _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Unknown direction for endpoint %d: %d",  buf,  0x1Eu);
        }
      }

      else
      {
        *(_OWORD *)(a1 + 520) = v5;
      }
    }
  }

char *sub_6EF4(uint64_t a1, int *a2, int a3)
{
  uint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 112LL))(a1);
  if ((_DWORD)result)
  {
    uint64_t v7 = a1 + 344;
    uint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16LL))(a1 + 344);
    int v8 = (int)result;
    if (*a2 >= 1)
    {
      unint64_t v9 = (unint64_t)(a2 + 1);
      unsigned int v10 = *a2 + 1;
      do
      {
        uint64_t v11 = *(void *)v9;
        size_t v12 = *(unsigned __int16 *)(v9 + 8);
        if (v12 > 0x40)
        {
          int v13 = malloc(*(unsigned __int16 *)(v9 + 8));
          memcpy(v13, (const void *)(v9 + 10), v12);
        }

        else
        {
          memcpy(v19, (const void *)(v9 + 10), *(unsigned __int16 *)(v9 + 8));
          int v13 = 0LL;
        }

        LODWORD(v20) = a3;
        *((void *)&v20 + 1) = 0LL;
        uint64_t result = (char *)operator new(0x80uLL);
        __int128 v14 = v19[0];
        *(_OWORD *)(result + 56) = v19[1];
        *(_OWORD *)(result + 40) = v14;
        *(_OWORD *)(result + 104) = v20;
        __int128 v15 = v19[2];
        *(_OWORD *)(result + 88) = v19[3];
        *((void *)result + 1) = a1 + 432;
        *((void *)result + 2) = v11;
        *((_DWORD *)result + 6) = v12;
        *((void *)result + 4) = v13;
        *((void *)result + 15) = v21;
        *(_OWORD *)(result + 72) = v15;
        uint64_t v16 = *(void *)(a1 + 432);
        *(void *)uint64_t result = v16;
        *(void *)(v16 + 8) = result;
        *(void *)(a1 + 432) = result;
        ++*(void *)(a1 + 448);
        unint64_t v9 = (v9 + *(unsigned __int16 *)(v9 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
        --v10;
      }

      while (v10 > 1);
    }

    if (!*(_BYTE *)(a1 + 24LL * *(unsigned __int8 *)(a1 + 624) + 620) && !*(_BYTE *)(a1 + 488))
    {
      *(_BYTE *)(a1 + 488) = 1;
      uint64_t v17 = *(void *)(a1 + 480);
      uint64_t v18 = mach_absolute_time();
      uint64_t result = (char *)MIDITimerTaskSetNextWakeTime(v17, v18 + 7200);
    }

    if (v8) {
      return (char *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 24LL))(v7);
    }
  }

  return result;
}

void sub_70B8(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_70F4(uint64_t *a1, int a2, uint64_t a3)
{
  if (a2 || !a3)
  {
    sub_68E8();
    uint64_t v6 = (os_log_s *)qword_28128;
    if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      uint64_t v11 = "IDAMMIDIDevice.cpp";
      __int16 v12 = 1024;
      int v13 = 296;
      __int16 v14 = 1024;
      int v15 = a2;
      __int16 v16 = 2048;
      uint64_t v17 = a3;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [?] IDAMMIDIDevice::ReadCallback(0x%x, %lu)",  (uint8_t *)&v10,  0x22u);
    }

    *((_BYTE *)a1 + 20) = 0;
    switch(a2)
    {
      case -536870186:
        uint64_t v8 = *a1;
        goto LABEL_15;
      case -536870165:
        return;
      case -536870163:
        uint64_t v7 = *a1;
        if ((*(unsigned int (**)(void, void))(**(void **)(*a1 + 512) + 192LL))( *(void *)(*a1 + 512),  *(void *)(*a1 + 528)))
        {
          return;
        }

        uint64_t v8 = v7;
        goto LABEL_15;
    }

    if (a2) {
      return;
    }
  }

  else
  {
    *((_BYTE *)a1 + 20) = 0;
  }

  uint64_t v9 = *a1;
  if (*(_BYTE *)(*a1 + 184)) {
    return;
  }
  sub_726C(*a1, (uint64_t)a1, a3);
  uint64_t v8 = v9;
LABEL_15:
  sub_6944(v8, a1);
}

uint64_t sub_726C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t BytePtr = IOUSBDeviceDataGetBytePtr(*(void *)(a2 + 8));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)v7 + 168LL))( v7,  a1,  v6,  BytePtr,  a3,  0LL,  0LL);
}

void sub_72D8(uint64_t a1)
{
  if (*(void *)(a1 + 448))
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + 624);
    uint64_t v3 = a1 + 24LL * *(unsigned __int8 *)(a1 + 624);
    if (!IOUSBDeviceDataGetBytePtr(*(void *)(v3 + 608)))
    {
      sub_68E8();
      uint64_t v16 = qword_28128;
      if (!os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v17 = 136315394;
      uint64_t v18 = "IDAMMIDIDevice.cpp";
      __int16 v19 = 1024;
      int v20 = 341;
      int v13 = "%25s:%-5d Buffer pointer is invalid!";
      __int16 v14 = (os_log_s *)v16;
      uint32_t v15 = 18;
      goto LABEL_15;
    }

    uint64_t v4 = (void *)(v3 + 608);
    uint64_t v5 = *(void *)(a1 + 496);
    uint64_t BytePtr = IOUSBDeviceDataGetBytePtr(*v4);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 208LL))( v5,  a1,  a1 + 432,  BytePtr,  1LL);
    if (v7)
    {
      uint64_t v8 = v7;
      *(_BYTE *)(a1 + 24LL * v2 + 620) = 1;
      int v9 = (*(uint64_t (**)(void, void, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 512) + 176LL))( *(void *)(a1 + 512),  *(void *)(a1 + 544),  *v4,  v7,  sub_74F0,  a1);
      if (v9 == -536854449 || v9 == -536870163) {
        int v9 = (*(uint64_t (**)(void, void, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 512) + 176LL))( *(void *)(a1 + 512),  *(void *)(a1 + 544),  *v4,  v8,  sub_74F0,  a1);
      }
      int v11 = v9;
      if (v9)
      {
        sub_68E8();
        uint64_t v12 = qword_28128;
        if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136315650;
          uint64_t v18 = "IDAMMIDIDevice.cpp";
          __int16 v19 = 1024;
          int v20 = 359;
          __int16 v21 = 1024;
          int v22 = v11;
          int v13 = "%25s:%-5d Failed with error 0x%x";
          __int16 v14 = (os_log_s *)v12;
          uint32_t v15 = 24;
LABEL_15:
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
        }
      }
    }
  }

void sub_74F0(uint64_t a1, int a2)
{
  uint64_t v4 = a1 + 344;
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16LL))(a1 + 344);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 624);
  *(_BYTE *)(a1 + 24 * v6 + 620) = 0;
  if (v6) {
    char v7 = v6 + 1;
  }
  else {
    char v7 = 0;
  }
  *(_BYTE *)(a1 + 624) = v7;
  if (a2)
  {
    sub_68E8();
    uint64_t v8 = (os_log_s *)qword_28128;
    if (os_log_type_enabled((os_log_t)qword_28128, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      int v10 = "IDAMMIDIDevice.cpp";
      __int16 v11 = 1024;
      int v12 = 381;
      __int16 v13 = 1024;
      int v14 = a2;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d IDAMMIDIDevice::WriteCallback() - Error: 0x%x",  (uint8_t *)&v9,  0x18u);
    }
  }

  else if (!*(_BYTE *)(a1 + 184))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
  }

  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
}

void sub_7624(_Unwind_Exception *exception_object)
{
  if ((v2 & 1) != 0) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_765C(uint64_t a1)
{
  return *(void *)(a1 + 528) != -1LL;
}

BOOL sub_766C(uint64_t a1)
{
  return *(void *)(a1 + 544) != -1LL;
}

uint64_t sub_767C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1844C(a1, a3, a4);
  *(void *)uint64_t v6 = off_24728;
  *(void *)(v6 + 72) = 0LL;
  *(void *)(v6 + 80) = 0LL;
  *(void *)(v6 + 64) = a2;
  *(_BYTE *)(v6 + 88) = 0;
  sub_18D08(v6);
  return a1;
}

void sub_76C8(_Unwind_Exception *a1)
{
}

uint64_t sub_76E0(void *a1)
{
  *a1 = off_24728;
  sub_7738(a1);
  uint64_t v2 = a1[9];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  uint64_t v3 = a1[10];
  if (v3)
  {
    uint64_t v4 = (void *)sub_5EB8(v3);
    operator delete(v4);
  }

  return sub_18AE8((uint64_t)a1);
}

void *sub_7738(void *result)
{
  uint64_t v1 = result[9];
  if (v1)
  {
    uint64_t v2 = result;
    MIDIObjectSetIntegerProperty(*(_DWORD *)(v1 + 8), kMIDIPropertyOffline, 1);
    uint64_t result = (void *)v2[9];
    if (result) {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8LL))(result);
    }
    v2[9] = 0LL;
  }

  return result;
}

void sub_7790(void *a1)
{
  uint64_t v1 = (void *)sub_76E0(a1);
  operator delete(v1);
}

void sub_77A4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == -469794543)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    if (global_queue)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_7844;
      block[3] = &unk_24758;
      block[4] = a4;
      dispatch_async(global_queue, block);
    }
  }

  else if (a2 == -469794544)
  {
    sub_18D08(a4);
  }

void *sub_7844(uint64_t a1)
{
  return sub_7738(*(void **)(a1 + 32));
}

uint64_t sub_784C(uint64_t a1, io_object_t a2)
{
  uint64_t v4 = *(void *)(a1 + 80);
  if (v4)
  {
    int v5 = (void *)sub_5EB8(v4);
    operator delete(v5);
    *(void *)(a1 + 80) = 0LL;
    *(_BYTE *)(a1 + 88) = 0;
  }

  uint64_t v6 = operator new(0x20uLL);
  sub_5A7C((int)v6, a2);
  *(void *)(a1 + 80) = v6;
  if (!*(_BYTE *)(a1 + 88))
  {
    uint64_t v7 = sub_5874((uint64_t)v6);
    *(_BYTE *)(a1 + 88) = (*(unsigned int (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)v7 + 72LL))( v7,  sub_77A4,  a1,  a1) == 0;
    uint64_t v6 = *(void **)(a1 + 80);
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 32LL))(a1, v6);
  if ((_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 40LL))(a1, *(void *)(a1 + 80));
  }
  return result;
}

void sub_7918(_Unwind_Exception *a1)
{
}

BOOL sub_7930(uint64_t a1, uint64_t a2)
{
  return sub_61B0(a2);
}

uint64_t sub_7938(uint64_t a1, uint64_t a2)
{
  MIDIDeviceListRef v4 = MIDIGetDriverDeviceList((MIDIDriverRef)(*(void *)(a1 + 64) + 8LL));
  int NumberOfDevices = MIDIDeviceListGetNumberOfDevices(v4);
  if (NumberOfDevices <= 0)
  {
    MIDIDeviceListDispose(v4);
    goto LABEL_13;
  }

  ItemCount v6 = 0LL;
  char v7 = 0;
  uint64_t v8 = NumberOfDevices;
  do
  {
    SInt32 outValue = 0;
    uint64_t Device = MIDIDeviceListGetDevice(v4, v6);
    uint64_t IntegerProperty = MIDIObjectGetIntegerProperty(Device, kMIDIPropertyOffline, &outValue);
    if ((_DWORD)IntegerProperty) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = outValue == 0;
    }
    char v12 = !v11;
    v7 |= v12;
    ++v6;
  }

  while (v8 != v6);
  uint64_t v13 = IntegerProperty;
  MIDIDeviceListDispose(v4);
  if ((v7 & 1) == 0)
  {
LABEL_13:
    uint64_t Device = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 64) + 224LL))(*(void *)(a1 + 64), a2);
    uint64_t v13 = MIDISetupAddDevice(Device);
    if ((_DWORD)v13) {
      return v13;
    }
  }

  MIDIObjectSetIntegerProperty(Device, @"USBVendorProduct", 95159724);
  uint64_t v14 = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)(a1 + 64) + 240LL))( *(void *)(a1 + 64),  *(void *)(a1 + 64),  a2,  Device);
  if (v14)
  {
    uint64_t v15 = v14;
    if (((*(uint64_t (**)(uint64_t))(*(void *)v14 + 16LL))(v14) & 1) != 0)
    {
      if (*(void *)(a1 + 72))
      {
        return 3758096385LL;
      }

      else
      {
        *(void *)(a1 + 72) = v15;
        MIDIObjectSetIntegerProperty(Device, kMIDIPropertyOffline, 0);
      }
    }

    else
    {
      (*(void (**)(uint64_t))(*(void *)v15 + 8LL))(v15);
    }
  }

  return v13;
}

CFStringRef sub_7AC4(uint64_t a1, const __CFString *a2)
{
  uint64_t v4 = sub_445C(a1);
  CFStringRef v5 = a2;
  if (v4)
  {
    int v6 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v4 + 272LL))(v4, &v14);
    if (v6)
    {
      int v7 = v6;
      sub_7CA8();
      uint64_t v8 = (os_log_s *)qword_28138;
      CFStringRef v5 = a2;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "USBMIDIDriverBase.cpp";
        __int16 v17 = 1024;
        int v18 = 79;
        __int16 v19 = 1024;
        int v20 = v7;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!]  USBGetManufacturerStringIndex() returned error 0x%x",  buf,  0x18u);
        CFStringRef v5 = a2;
      }
    }

    else
    {
      CFStringRef v5 = sub_4AB8(a1, v14);
    }

    int v9 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v4 + 280LL))(v4, &v14);
    if (v9)
    {
      int v10 = v9;
      sub_7CA8();
      BOOL v11 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "USBMIDIDriverBase.cpp";
        __int16 v17 = 1024;
        int v18 = 84;
        __int16 v19 = 1024;
        int v20 = v10;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!]  USBGetProductStringIndex() returned error 0x%x",  buf,  0x18u);
      }
    }

    else
    {
      sub_4AB8(a1, v14);
    }
  }

  if (v5) {
    return v5;
  }
  else {
    return a2;
  }
}

void sub_7CA8()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28140);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28140))
    {
      qword_28138 = (uint64_t)os_log_create("com.apple.coremidi", "usbmba");
      __cxa_guard_release(&qword_28140);
    }
  }

double sub_7D04@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, void, void))(*(void *)a1 + 448LL))(a1, 0LL, 0LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *v3;
    if (*v3)
    {
      sub_3D94(v11, 3 * v5, 0);
      if (v11[23] >= 0) {
        int v6 = v11;
      }
      else {
        int v6 = *(_BYTE **)v11;
      }
      int v7 = v4;
      do
      {
        unsigned int v8 = *v7++;
        *int v6 = a0123456789abcd_0[(unint64_t)v8 >> 4];
        v6[1] = a0123456789abcd_0[v8 & 0xF];
        _BYTE v6[2] = 32;
        v6 += 3;
        --v5;
      }

      while (v5);
    }

    else
    {
      sub_CFBC(v11, (char *)&unk_1E599);
    }

    *(void *)a2 = v4;
    double result = *(double *)v11;
    *(_OWORD *)(a2 + 8) = *(_OWORD *)v11;
    *(void *)(a2 + 24) = *(void *)&v11[16];
  }

  else
  {
    sub_7CA8();
    int v9 = (os_log_s *)qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)BOOL v11 = 136315394;
      *(void *)&v11[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 99;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] findDescriptors() - no interface descriptor found",  v11,  0x12u);
    }

    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }

  return result;
}

__n128 sub_7E80(uint64_t a1, unsigned __int8 *a2, void *a3, char **a4, char **a5, unsigned __int8 **a6)
{
  if (!a1) {
    return result;
  }
  int v6 = a2;
  if (!a2) {
    return result;
  }
  uint64_t v10 = a1;
  sub_7CA8();
  BOOL v11 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 108;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDriverBase::ParseDescriptors()", buf, 0x12u);
  }

  unsigned __int8 v166 = 0;
  int v173 = 0;
  v165 = a5;
  uint64_t v159 = (uint64_t)(a5 + 2);
  uint64_t v158 = (uint64_t)(a3 + 2);
  int v167 = -1;
  v168 = a3;
  uint64_t v160 = v10;
  do
  {
    uint64_t v12 = *v6;
    if (*v6)
    {
      sub_3D94(__p, 3 * v12, 0);
      uint64_t v13 = (void **)__p[0];
      if (v170 >= 0) {
        uint64_t v13 = __p;
      }
      unsigned __int8 v14 = v6;
      do
      {
        unsigned int v15 = *v14++;
        *(_BYTE *)uint64_t v13 = a0123456789abcd_0[(unint64_t)v15 >> 4];
        *((_BYTE *)v13 + 1) = a0123456789abcd_0[v15 & 0xF];
        *((_BYTE *)v13 + 2) = 32;
        uint64_t v13 = (void **)((char *)v13 + 3);
        --v12;
      }

      while (v12);
    }

    else
    {
      sub_CFBC(__p, (char *)&unk_1E599);
    }

    int v16 = v6[1];
    int v17 = v6[2];
    sub_7CA8();
    int v18 = (os_log_s *)qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = __p;
      if (v170 < 0) {
        __int16 v19 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      v175 = "USBMIDIDriverBase.cpp";
      __int16 v176 = 1024;
      int v177 = 139;
      __int16 v178 = 2080;
      *(void *)&__int128 v179 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Now @: %s", buf, 0x1Cu);
    }

    LOBYTE(v20) = 0;
    if (v16 > 35)
    {
      if (v16 != 36)
      {
        if (v16 != 37) {
          goto LABEL_198;
        }
        if (v17 == 1 && (v167 & 0x80000000) == 0)
        {
          sub_7CA8();
          v28 = (os_log_s *)qword_28138;
          if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v175 = "USBMIDIDriverBase.cpp";
            __int16 v176 = 1024;
            int v177 = 197;
            _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "%25s:%-5d      USB MIDI 1.0 CS endpoint descriptor",  buf,  0x12u);
          }

          uint64_t v29 = v6[3];
          sub_7CA8();
          int v30 = (os_log_s *)qword_28138;
          if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
          {
            unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v168[1] - *v168) >> 1);
            *(_DWORD *)buf = 136315906;
            v175 = "USBMIDIDriverBase.cpp";
            __int16 v176 = 1024;
            int v177 = 200;
            __int16 v178 = 1024;
            LODWORD(v179) = v29;
            WORD2(v179) = 2048;
            *(void *)((char *)&v179 + 6) = v31;
            _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "%25s:%-5d      %d embedded MIDI jack(s), searching %lu jack(s) for a match",  buf,  0x22u);
          }

          if ((_DWORD)v29)
          {
            for (uint64_t i = 0LL; i != v29; ++i)
            {
              __int16 v34 = (char *)*v168;
              int v33 = (char *)v168[1];
              if ((char *)*v168 != v33)
              {
                while (v34[2] != v6[i + 4])
                {
                  v34 += 6;
                  if (v34 == v33) {
                    goto LABEL_45;
                  }
                }
              }

              if (v34 == v33 || v34 == 0LL)
              {
LABEL_45:
                sub_7CA8();
                v36 = (os_log_s *)qword_28138;
                if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v175 = "USBMIDIDriverBase.cpp";
                  __int16 v176 = 1024;
                  int v177 = 206;
                  __int16 v178 = 1024;
                  LODWORD(v179) = v166;
                  _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Jack not found for endpoint 0x%x",  buf,  0x18u);
                }
              }

              else
              {
                sub_7CA8();
                __int16 v37 = (os_log_s *)qword_28138;
                if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
                {
                  int v39 = v34[2];
                  *(_DWORD *)buf = 136315906;
                  v175 = "USBMIDIDriverBase.cpp";
                  __int16 v176 = 1024;
                  int v177 = 204;
                  __int16 v178 = 1024;
                  LODWORD(v179) = v39;
                  WORD2(v179) = 1024;
                  *(_DWORD *)((char *)&v179 + 6) = v166;
                  _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found jack %d for endpoint 0x%x",  buf,  0x1Eu);
                }

                v34[5] = v166;
                if (v167)
                {
                  unint64_t v40 = (unint64_t)a4[1];
                  unint64_t v41 = (unint64_t)a4[2];
                  if (v40 >= v41)
                  {
                    unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (void)*a4) >> 1);
                    unint64_t v49 = v48 + 1;
                    if (v48 + 1 > 0x2AAAAAAAAAAAAAAALL) {
                      goto LABEL_221;
                    }
                    unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (void)*a4) >> 1);
                    if (2 * v50 > v49) {
                      unint64_t v49 = 2 * v50;
                    }
                    if (v50 >= 0x1555555555555555LL) {
                      unint64_t v51 = 0x2AAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v51 = v49;
                    }
                    if (v51) {
                      __int16 v52 = (char *)sub_D06C((uint64_t)(a4 + 2), v51);
                    }
                    else {
                      __int16 v52 = 0LL;
                    }
                    uint64_t v58 = &v52[6 * v48];
                    int v59 = *(_DWORD *)v34;
                    *((_WORD *)v58 + 2) = *((_WORD *)v34 + 2);
                    *(_DWORD *)uint64_t v58 = v59;
                    v61 = *a4;
                    v60 = a4[1];
                    v62 = v58;
                    if (v60 != *a4)
                    {
                      do
                      {
                        int v63 = *(_DWORD *)(v60 - 6);
                        v60 -= 6;
                        __int16 v64 = *((_WORD *)v60 + 2);
                        *(_DWORD *)(v62 - 6) = v63;
                        v62 -= 6;
                        *((_WORD *)v62 + 2) = v64;
                      }

                      while (v60 != v61);
                      v60 = *a4;
                    }

                    unsigned __int16 v43 = v58 + 6;
                    *a4 = v62;
                    a4[1] = v58 + 6;
                    a4[2] = &v52[6 * v51];
                    if (v60) {
                      operator delete(v60);
                    }
                  }

                  else
                  {
                    int v42 = *(_DWORD *)v34;
                    *(_WORD *)(v40 + 4) = *((_WORD *)v34 + 2);
                    *(_DWORD *)unint64_t v40 = v42;
                    unsigned __int16 v43 = (char *)(v40 + 6);
                  }

                  a4[1] = v43;
                }

                else
                {
                  unint64_t v44 = (unint64_t)v165[1];
                  unint64_t v45 = (unint64_t)v165[2];
                  if (v44 >= v45)
                  {
                    unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - (void)*v165) >> 1);
                    unint64_t v54 = v53 + 1;
                    if (v53 + 1 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_221:
                    }
                      sub_2CF0();
                    unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v45 - (void)*v165) >> 1);
                    if (2 * v55 > v54) {
                      unint64_t v54 = 2 * v55;
                    }
                    if (v55 >= 0x1555555555555555LL) {
                      unint64_t v56 = 0x2AAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v56 = v54;
                    }
                    if (v56) {
                      char v57 = (char *)sub_D06C(v159, v56);
                    }
                    else {
                      char v57 = 0LL;
                    }
                    v65 = &v57[6 * v53];
                    int v66 = *(_DWORD *)v34;
                    *((_WORD *)v65 + 2) = *((_WORD *)v34 + 2);
                    *(_DWORD *)v65 = v66;
                    v68 = *v165;
                    v67 = v165[1];
                    v69 = v65;
                    if (v67 == *v165)
                    {
                      v72 = v165;
                    }

                    else
                    {
                      do
                      {
                        int v70 = *(_DWORD *)(v67 - 6);
                        v67 -= 6;
                        __int16 v71 = *((_WORD *)v67 + 2);
                        *(_DWORD *)(v69 - 6) = v70;
                        v69 -= 6;
                        *((_WORD *)v69 + 2) = v71;
                      }

                      while (v67 != v68);
                      v72 = v165;
                      v67 = *v165;
                    }

                    __int16 v47 = v65 + 6;
                    *v72 = v69;
                    v72[1] = v65 + 6;
                    v72[2] = &v57[6 * v56];
                    if (v67) {
                      operator delete(v67);
                    }
                  }

                  else
                  {
                    int v46 = *(_DWORD *)v34;
                    *(_WORD *)(v44 + 4) = *((_WORD *)v34 + 2);
                    *(_DWORD *)unint64_t v44 = v46;
                    __int16 v47 = (char *)(v44 + 6);
                  }

                  v165[1] = v47;
                }
              }
            }
          }

          goto LABEL_86;
        }

        sub_7CA8();
        v83 = (os_log_s *)qword_28138;
        if (v17 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v175 = "USBMIDIDriverBase.cpp";
            __int16 v176 = 1024;
            int v177 = 216;
            _os_log_impl( &dword_0,  v83,  OS_LOG_TYPE_INFO,  "%25s:%-5d             (USB MIDI 2.0 CS endpoint descriptor)",  buf,  0x12u);
          }

          uint64_t v20 = v6[3];
          if (v6[3])
          {
            uint64_t v84 = 0LL;
            unsigned __int8 v85 = v166;
            if (v167) {
              unsigned __int8 v86 = v166;
            }
            else {
              unsigned __int8 v86 = 0;
            }
            char v163 = v86;
            if (v167) {
              unsigned __int8 v85 = 0;
            }
            char v162 = v85;
            do
            {
              int v87 = v6[v84 + 4];
              for (j = *a6; j != a6[1]; j += 12)
              {
                if (*j == v87)
                {
                  sub_7CA8();
                  v98 = (os_log_s *)qword_28138;
                  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
                  {
                    int v99 = *j;
                    *(_DWORD *)buf = 136315906;
                    v175 = "USBMIDIDriverBase.cpp";
                    __int16 v176 = 1024;
                    int v177 = 233;
                    __int16 v178 = 1024;
                    LODWORD(v179) = v99;
                    WORD2(v179) = 1024;
                    *(_DWORD *)((char *)&v179 + 6) = v166;
                    _os_log_impl( &dword_0,  v98,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Reusing group terminal blockID %d for endpoint 0x%x",  buf,  0x1Eu);
                  }

                  if (v167) {
                    j[6] = v166;
                  }
                  else {
                    j[7] = v166;
                  }
                  goto LABEL_144;
                }
              }

              sub_7CA8();
              v89 = (os_log_s *)qword_28138;
              if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315906;
                v175 = "USBMIDIDriverBase.cpp";
                __int16 v176 = 1024;
                int v177 = 226;
                __int16 v178 = 1024;
                LODWORD(v179) = v87;
                WORD2(v179) = 1024;
                *(_DWORD *)((char *)&v179 + 6) = v166;
                _os_log_impl( &dword_0,  v89,  OS_LOG_TYPE_INFO,  "%25s:%-5d      New group terminal blockID %d for endpoint 0x%x",  buf,  0x1Eu);
              }

              v90 = a6[1];
              v91 = a6[2];
              if (v90 >= v91)
              {
                unint64_t v93 = 0xAAAAAAAAAAAAAAABLL * ((v90 - *a6) >> 2);
                unint64_t v94 = v93 + 1;
                if (v93 + 1 > 0x1555555555555555LL) {
                  sub_2CF0();
                }
                unint64_t v95 = 0xAAAAAAAAAAAAAAABLL * ((v91 - *a6) >> 2);
                if (2 * v95 > v94) {
                  unint64_t v94 = 2 * v95;
                }
                if (v95 >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v96 = 0x1555555555555555LL;
                }
                else {
                  unint64_t v96 = v94;
                }
                if (v96) {
                  v97 = (char *)sub_D0B0((uint64_t)(a6 + 2), v96);
                }
                else {
                  v97 = 0LL;
                }
                v100 = &v97[12 * v93];
                char *v100 = v87;
                *(_DWORD *)(v100 + 1) = 0;
                v100[5] = 0;
                v100[6] = v163;
                v100[7] = v162;
                *((_DWORD *)v100 + 2) = 0;
                v102 = *a6;
                v101 = a6[1];
                v103 = v100;
                if (v101 != *a6)
                {
                  do
                  {
                    uint64_t v104 = *(void *)(v101 - 12);
                    v101 -= 12;
                    int v105 = *((_DWORD *)v101 + 2);
                    *(void *)(v103 - 12) = v104;
                    v103 -= 12;
                    *((_DWORD *)v103 + 2) = v105;
                  }

                  while (v101 != v102);
                  v101 = *a6;
                }

                v92 = (unsigned __int8 *)(v100 + 12);
                *a6 = (unsigned __int8 *)v103;
                a6[1] = (unsigned __int8 *)(v100 + 12);
                a6[2] = (unsigned __int8 *)&v97[12 * v96];
                if (v101) {
                  operator delete(v101);
                }
              }

              else
              {
                unsigned __int8 *v90 = v87;
                *(_DWORD *)(v90 + 1) = 0;
                v90[5] = 0;
                v90[6] = v163;
                v90[7] = v162;
                v92 = v90 + 12;
                *((_DWORD *)v90 + 2) = 0;
              }

              a6[1] = v92;
LABEL_144:
              ++v84;
            }

            while (v84 != v20);
LABEL_86:
            LOBYTE(v20) = 0;
          }

          uint64_t v10 = v160;
          goto LABEL_198;
        }

        if (!os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 241;
        __int16 v178 = 1024;
        LODWORD(v179) = 37;
        WORD2(v179) = 1024;
        *(_DWORD *)((char *)&v179 + 6) = v17;
        int v24 = v83;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        int v26 = "%25s:%-5d      Unrecognized type/subtype: 0x%x / 0x%x";
        uint32_t v27 = 30;
        goto LABEL_25;
      }

      if (v17 == 3)
      {
        int v112 = v6[6];
        int v113 = v6[3];
        int v114 = v6[4];
        unsigned __int8 v115 = v6[2 * v6[5] + 6];
        v116 = (_BYTE *)v168[1];
        unint64_t v117 = v168[2];
        if ((unint64_t)v116 >= v117)
        {
          int v164 = v6[3];
          int v125 = v6[6];
          unint64_t v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v116[-*v168] >> 1);
          unint64_t v127 = v126 + 1;
          if (v126 + 1 > 0x2AAAAAAAAAAAAAAALL) {
            sub_2CF0();
          }
          unint64_t v128 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v117 - *v168) >> 1);
          if (2 * v128 > v127) {
            unint64_t v127 = 2 * v128;
          }
          if (v128 >= 0x1555555555555555LL) {
            unint64_t v129 = 0x2AAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v129 = v127;
          }
          if (v129) {
            v130 = (char *)sub_D06C(v158, v129);
          }
          else {
            v130 = 0LL;
          }
          v138 = &v130[6 * v126];
          char *v138 = 3;
          v138[1] = v164;
          v138[2] = v114;
          int v112 = v125;
          v138[3] = v125;
          v138[4] = v115;
          v140 = (char *)*v168;
          v139 = (char *)v168[1];
          v141 = v138;
          if (v139 != (char *)*v168)
          {
            do
            {
              int v142 = *(_DWORD *)(v139 - 6);
              v139 -= 6;
              __int16 v143 = *((_WORD *)v139 + 2);
              *(_DWORD *)(v141 - 6) = v142;
              v141 -= 6;
              *((_WORD *)v141 + 2) = v143;
            }

            while (v139 != v140);
            v139 = (char *)*v168;
          }

          int v113 = v164;
          v118 = v138 + 6;
          void *v168 = v141;
          v168[1] = v138 + 6;
          v168[2] = &v130[6 * v129];
          if (v139) {
            operator delete(v139);
          }
        }

        else
        {
          _BYTE *v116 = 3;
          v116[1] = v113;
          v116[2] = v114;
          v116[3] = v112;
          v118 = v116 + 6;
          v116[4] = v115;
        }

        v168[1] = v118;
        sub_7CA8();
        uint64_t v144 = qword_28138;
        if (!os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        int v145 = v6[5];
        v146 = "external";
        if (v113 == 1) {
          v146 = "embedded";
        }
        *(_DWORD *)buf = 136316418;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 184;
        __int16 v178 = 2080;
        *(void *)&__int128 v179 = v146;
        WORD4(v179) = 1024;
        *(_DWORD *)((char *)&v179 + 10) = v114;
        HIWORD(v179) = 1024;
        *(_DWORD *)v180 = v112;
        *(_WORD *)&v180[4] = 1024;
        int v181 = v145;
        int v24 = (os_log_s *)v144;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        int v26 = "%25s:%-5d      Added %s MIDI output jack %d: source jack %d, %d input pin(s)";
        uint32_t v27 = 46;
        goto LABEL_25;
      }

      if (v17 == 2)
      {
        int v106 = v6[3];
        int v107 = v6[4];
        unsigned __int8 v108 = v6[5];
        v109 = (_BYTE *)v168[1];
        unint64_t v110 = v168[2];
        if ((unint64_t)v109 >= v110)
        {
          unint64_t v120 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v109[-*v168] >> 1);
          unint64_t v121 = v120 + 1;
          if (v120 + 1 > 0x2AAAAAAAAAAAAAAALL) {
            sub_2CF0();
          }
          unint64_t v122 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v110 - *v168) >> 1);
          if (2 * v122 > v121) {
            unint64_t v121 = 2 * v122;
          }
          if (v122 >= 0x1555555555555555LL) {
            unint64_t v123 = 0x2AAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v123 = v121;
          }
          if (v123) {
            v124 = (char *)sub_D06C(v158, v123);
          }
          else {
            v124 = 0LL;
          }
          v131 = &v124[6 * v120];
          char *v131 = 2;
          v131[1] = v106;
          v131[2] = v107;
          v131[3] = 0;
          v131[4] = v108;
          v133 = (char *)*v168;
          v132 = (char *)v168[1];
          v134 = v131;
          if (v132 == (char *)*v168)
          {
            v137 = (char **)v168;
          }

          else
          {
            do
            {
              int v135 = *(_DWORD *)(v132 - 6);
              v132 -= 6;
              __int16 v136 = *((_WORD *)v132 + 2);
              *(_DWORD *)(v134 - 6) = v135;
              v134 -= 6;
              *((_WORD *)v134 + 2) = v136;
            }

            while (v132 != v133);
            v137 = (char **)v168;
            v132 = (char *)*v168;
          }

          v111 = v131 + 6;
          *v137 = v134;
          v137[1] = v131 + 6;
          v137[2] = &v124[6 * v123];
          if (v132) {
            operator delete(v132);
          }
        }

        else
        {
          _BYTE *v109 = 2;
          v109[1] = v106;
          v109[2] = v107;
          v109[3] = 0;
          v111 = v109 + 6;
          v109[4] = v108;
        }

        v168[1] = v111;
        sub_7CA8();
        uint64_t v147 = qword_28138;
        if (!os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        v148 = "external";
        if (v106 == 1) {
          v148 = "embedded";
        }
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 173;
        __int16 v178 = 2080;
        *(void *)&__int128 v179 = v148;
        WORD4(v179) = 1024;
        *(_DWORD *)((char *)&v179 + 10) = v107;
        int v24 = (os_log_s *)v147;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        int v26 = "%25s:%-5d      Added %s MIDI input jack %d";
LABEL_24:
        uint32_t v27 = 34;
LABEL_25:
        _os_log_impl(&dword_0, v24, v25, v26, buf, v27);
        goto LABEL_197;
      }

      if (v17 != 1)
      {
        sub_7CA8();
        uint64_t v119 = qword_28138;
        if (!os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315650;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 186;
        __int16 v178 = 1024;
        LODWORD(v179) = v17;
        int v24 = (os_log_s *)v119;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        int v26 = "%25s:%-5d      Skipping unrecognized CS interface subtype %d...";
        uint32_t v27 = 24;
        goto LABEL_25;
      }

      sub_7CA8();
      v76 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
      {
        v77 = __p;
        if (v170 < 0) {
          v77 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315650;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 151;
        __int16 v178 = 2080;
        *(void *)&__int128 v179 = v77;
        _os_log_impl(&dword_0, v76, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Found CS descriptor: %s", buf, 0x1Cu);
      }

      int v78 = *(unsigned __int16 *)(v6 + 3);
      sub_7CA8();
      v79 = (os_log_s *)qword_28138;
      BOOL v80 = os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO);
      if (v78 != 512)
      {
        if (v80)
        {
          *(_DWORD *)buf = 136315394;
          v175 = "USBMIDIDriverBase.cpp";
          __int16 v176 = 1024;
          int v177 = 163;
          int v24 = v79;
          os_log_type_t v25 = OS_LOG_TYPE_INFO;
          int v26 = "%25s:%-5d      Skipping CS interface descriptor";
          goto LABEL_189;
        }

LABEL_197:
        LOBYTE(v20) = 0;
        goto LABEL_198;
      }

      if (v80)
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 155;
        _os_log_impl( &dword_0,  v79,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found a USB MIDI 2.0 alternate setting",  buf,  0x12u);
      }

      int v81 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 176LL))(v10, 1LL);
      sub_7CA8();
      v82 = (os_log_s *)qword_28138;
      if (!v81)
      {
        if (!os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 160;
        int v24 = v82;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        int v26 = "%25s:%-5d      Alternate interface now set for MIDI 2.0";
LABEL_189:
        uint32_t v27 = 18;
        goto LABEL_25;
      }

      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 157;
        _os_log_impl(&dword_0, v82, OS_LOG_TYPE_ERROR, "%25s:%-5d      Unable to set MIDI 2.0 alt setting!", buf, 0x12u);
      }

      LOBYTE(v20) = 1;
    }

    else
    {
      if (v16 != 4)
      {
        if (v16 != 5) {
          goto LABEL_198;
        }
        unsigned int v21 = v6[2];
        int v167 = v21 >> 7;
        sub_7CA8();
        uint64_t v22 = qword_28138;
        unsigned __int8 v166 = v21;
        if (!os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO)) {
          goto LABEL_197;
        }
        *(_DWORD *)buf = 136315906;
        __int16 v23 = "output";
        if ((v21 & 0x80u) != 0) {
          __int16 v23 = "input";
        }
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 192;
        __int16 v178 = 1024;
        LODWORD(v179) = v21;
        WORD2(v179) = 2080;
        *(void *)((char *)&v179 + 6) = v23;
        int v24 = (os_log_s *)v22;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        int v26 = "%25s:%-5d      Examining endpoint 0x%x (%s)";
        goto LABEL_24;
      }

      unsigned int v73 = v6[3];
      sub_7CA8();
      v74 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 143;
        __int16 v178 = 1024;
        LODWORD(v179) = v73;
        _os_log_impl(&dword_0, v74, OS_LOG_TYPE_INFO, "%25s:%-5d      Examining alt setting %d...", buf, 0x18u);
      }

      if (v73 < 2) {
        goto LABEL_197;
      }
      sub_7CA8();
      v75 = (os_log_s *)qword_28138;
      LOBYTE(v20) = 1;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 146;
        _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "%25s:%-5d      Done examining descriptors; halting", buf, 0x12u);
      }
    }

LABEL_198:
    uint64_t v149 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, void))(*(void *)v10 + 448LL))(v10, v6, 0LL);
    if (!v149)
    {
      sub_7CA8();
      v150 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v175 = "USBMIDIDriverBase.cpp";
        __int16 v176 = 1024;
        int v177 = 248;
        _os_log_impl( &dword_0,  v150,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      FindNextAssociatedDescriptor() returned nullptr for kUSBAnyDesc",  buf,  0x12u);
      }

      uint64_t v149 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)v10 + 448LL))(v10, v6, 4LL);
      if (!v149)
      {
        sub_7CA8();
        v151 = (os_log_s *)qword_28138;
        if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v175 = "USBMIDIDriverBase.cpp";
          __int16 v176 = 1024;
          int v177 = 252;
          _os_log_impl( &dword_0,  v151,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      FindNextAssociatedDescriptor() returned nullptr for kUSBInterfaceDesc; done",
            buf,
            0x12u);
        }

        uint64_t v149 = 0LL;
      }
    }

    if (v170 < 0) {
      operator delete(__p[0]);
    }
    if (v149) {
      char v152 = v20;
    }
    else {
      char v152 = 1;
    }
    int v6 = (unsigned __int8 *)v149;
  }

  while ((v152 & 1) == 0);
  sub_7CA8();
  v153 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 118;
    _os_log_impl(&dword_0, v153, OS_LOG_TYPE_DEBUG, "%25s:%-5d      Bailing out of loop...", buf, 0x12u);
  }

  LOBYTE(__p[0]) = 0;
  __int16 v172 = 0;
  __int16 v171 = 0;
  (*(void (**)(uint64_t, void **))(*(void *)v10 + 80LL))(v10, __p);
  (*(void (**)(uint64_t, char *))(*(void *)v10 + 88LL))(v10, (char *)&v172 + 1);
  (*(void (**)(uint64_t, char *))(*(void *)v10 + 104LL))(v10, (char *)&v173 + 2);
  (*(void (**)(uint64_t, int *))(*(void *)v10 + 112LL))(v10, &v173);
  (*(void (**)(uint64_t, __int16 *))(*(void *)v10 + 136LL))(v10, &v172);
  (*(void (**)(uint64_t, char *))(*(void *)v10 + 144LL))(v10, (char *)&v171 + 1);
  (*(void (**)(uint64_t, __int16 *))(*(void *)v10 + 152LL))(v10, &v171);
  sub_7CA8();
  v154 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 127;
    __int16 v178 = 1024;
    LODWORD(v179) = LOBYTE(__p[0]);
    WORD2(v179) = 1024;
    *(_DWORD *)((char *)&v179 + 6) = HIBYTE(v172);
    WORD5(v179) = 1024;
    HIDWORD(v179) = HIWORD(v173);
    *(_WORD *)v180 = 1024;
    *(_DWORD *)&v180[2] = (unsigned __int16)v173;
    _os_log_impl( &dword_0,  v154,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Interface class %d, subclass %d, for device 0x%04x /0x%04x",  buf,  0x2Au);
  }

  sub_7CA8();
  v155 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 128;
    __int16 v178 = 1024;
    LODWORD(v179) = v172;
    WORD2(v179) = 1024;
    *(_DWORD *)((char *)&v179 + 6) = HIBYTE(v171);
    WORD5(v179) = 1024;
    HIDWORD(v179) = v171;
    _os_log_impl( &dword_0,  v155,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Interface %d alternate setting %d : %d endpoints",  buf,  0x24u);
  }

  sub_7CA8();
  v156 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v175 = "USBMIDIDriverBase.cpp";
    __int16 v176 = 1024;
    int v177 = 255;
    _os_log_impl(&dword_0, v156, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::ParseDescriptors()", buf, 0x12u);
  }

  return result;
}

void sub_948C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *__p, uint64_t a32, int a33, __int16 a34, char a35, char a36)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_94D4(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  int v7 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 260;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = a2;
    *(_WORD *)&buf[34] = 2048;
    *(void *)&buf[36] = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDriverBase::CreatePortMapList(inUSBDevice:%p, interfaceNum:%d) - Constructing a USB MIDI 2.0 port map list for %lu group terminal block(s)",  buf,  0x2Cu);
  }

  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = 0LL;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v97 = 0u;
  memset(buf, 0, sizeof(buf));
  sub_7CA8();
  int v9 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__b = 136315394;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 265;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Issuing device request to load group terminal block descriptors...",  __b,  0x12u);
  }

  int v87 = 0;
  sub_4B3C(a1, a2, 1, (uint64_t)buf, 5, &v87);
  if (v87 != 5)
  {
    sub_7CA8();
    unsigned __int8 v14 = (os_log_s *)qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__b = 136316418;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 341;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = a2;
      *(_WORD *)&__b[24] = 1024;
      *(_DWORD *)&__b[26] = 1;
      *(_WORD *)&__b[30] = 1024;
      *(_DWORD *)&__b[32] = 5;
      *(_WORD *)v89 = 1024;
      *(_DWORD *)&v89[2] = v87;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!]  FATAL: Could not retrieve Group Terminal Descriptors for USB MIDI interface %d alternate setting %d. Expected header length %u but got %u",  __b,  0x2Au);
    }

    goto LABEL_99;
  }

  uint64_t v10 = buf[0];
  if (buf[0])
  {
    sub_3D94(__p, 3LL * buf[0], 0);
    if (v86 >= 0) {
      BOOL v11 = __p;
    }
    else {
      BOOL v11 = (void **)__p[0];
    }
    uint64_t v12 = buf;
    do
    {
      unsigned int v13 = *v12++;
      *(_BYTE *)BOOL v11 = a0123456789abcd_0[(unint64_t)v13 >> 4];
      *((_BYTE *)v11 + 1) = a0123456789abcd_0[v13 & 0xF];
      *((_BYTE *)v11 + 2) = 32;
      BOOL v11 = (void **)((char *)v11 + 3);
      --v10;
    }

    while (v10);
  }

  else
  {
    sub_CFBC(__p, (char *)&unk_1E599);
  }

  int v15 = *(unsigned __int16 *)&buf[3];
  unsigned int v84 = 0;
  sub_7CA8();
  int v16 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    int v17 = __p;
    if (v86 < 0) {
      int v17 = (void **)__p[0];
    }
    *(_DWORD *)__b = 136315906;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 276;
    *(_WORD *)&__b[18] = 1024;
    *(_DWORD *)&__b[20] = v15;
    *(_WORD *)&__b[24] = 2080;
    *(void *)&__b[26] = v17;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Got group terminal block descriptor header (totalLength = %d): %s",  __b,  0x22u);
  }

  sub_4B3C(a1, a2, 1, (uint64_t)buf, v15, &v84);
  unsigned int v18 = v84;
  if (-991146299 * (v84 - v87) >= 0x13B13B14)
  {
    sub_7CA8();
    __int16 v19 = (os_log_s *)qword_28138;
    BOOL v20 = os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR);
    unsigned int v18 = v84;
    if (v20)
    {
      *(_DWORD *)__b = 136315650;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 279;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v84;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      Unexpected group terminal descriptor length: %u",  __b,  0x18u);
      unsigned int v18 = v84;
    }
  }

  unsigned int v21 = v18 - v87;
  unsigned int v22 = (v18 - v87) / 0xD;
  if ((v18 - v87) % 0xD)
  {
    sub_7CA8();
    uint64_t v23 = qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__b = 136315650;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 283;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v84;
      int v24 = "%25s:%-5d      Unexpected total descriptor length: %u";
      os_log_type_t v25 = (os_log_s *)v23;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 24;
LABEL_33:
      _os_log_impl(&dword_0, v25, v26, v24, __b, v27);
    }
  }

  else
  {
    unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
    sub_7CA8();
    uint64_t v29 = qword_28138;
    if (v28 == v22)
    {
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
      {
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        int v30 = "s";
        *(_DWORD *)&__b[14] = 287;
        *(_DWORD *)__b = 136316162;
        *(_WORD *)&__b[12] = 1024;
        if (v21 - 13 < 0xD) {
          int v30 = (const char *)&unk_1E599;
        }
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v22;
        *(_WORD *)&__b[24] = 2080;
        *(void *)&__b[26] = v30;
        *(_WORD *)&__b[34] = 1024;
        *(_DWORD *)v89 = v84;
        int v24 = "%25s:%-5d      Got %d group terminal block descriptor%s (receivedLength = %u). ";
        os_log_type_t v25 = (os_log_s *)v29;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        uint32_t v27 = 40;
        goto LABEL_33;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
    {
      int v31 = -1431655765 * ((*(void *)(a3 + 8) - *(void *)a3) >> 2);
      *(_DWORD *)__b = 136315906;
      *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&__b[12] = 1024;
      *(_DWORD *)&__b[14] = 285;
      *(_WORD *)&__b[18] = 1024;
      *(_DWORD *)&__b[20] = v31;
      *(_WORD *)&__b[24] = 1024;
      *(_DWORD *)&__b[26] = v22;
      int v24 = "%25s:%-5d      Expected %d descriptors, not %d";
      os_log_type_t v25 = (os_log_s *)v29;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 30;
      goto LABEL_33;
    }
  }

  unsigned int v82 = v21 - 13;
  if (v21 >= 0xD)
  {
    int v32 = 0;
    int v33 = 0;
    do
    {
      __int16 v34 = &buf[13 * v32 + v87];
      uint64_t v35 = *v34;
      if (*v34)
      {
        sub_3D94(__b, 3 * v35, 0);
        v36 = __b;
        if (__b[23] < 0) {
          v36 = *(_BYTE **)__b;
        }
        do
        {
          unsigned int v37 = *v34++;
          _BYTE *v36 = a0123456789abcd_0[(unint64_t)v37 >> 4];
          v36[1] = a0123456789abcd_0[v37 & 0xF];
          v36[2] = 32;
          v36 += 3;
          --v35;
        }

        while (v35);
      }

      else
      {
        sub_CFBC(__b, (char *)&unk_1E599);
      }

      if (SHIBYTE(v86) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)__b;
      uint64_t v86 = *(void *)&__b[16];
      sub_7CA8();
      uint64_t v38 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
      {
        int v39 = __p;
        if (v86 < 0) {
          int v39 = (void **)__p[0];
        }
        *(_DWORD *)__b = 136315906;
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&__b[12] = 1024;
        *(_DWORD *)&__b[14] = 294;
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v32;
        *(_WORD *)&__b[24] = 2080;
        *(void *)&__b[26] = v39;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "%25s:%-5d      %00d: %s ", __b, 0x22u);
      }

      int v32 = ++v33;
    }

    while (v22 > v33);
  }

  sub_7CA8();
  unint64_t v40 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    unsigned __int16 v43 = "s";
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_DWORD *)__b = 136315650;
    if (v82 < 0xD) {
      unsigned __int16 v43 = (const char *)&unk_1E599;
    }
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 296;
    *(_WORD *)&__b[18] = 2080;
    *(void *)&__b[20] = v43;
    _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Parsing group terminal block descriptor%s ...",  __b,  0x1Cu);
  }

  sub_A1BC((unsigned __int8 **)a3, (unint64_t)&buf[5], v84, v41, v42);
  unint64_t v44 = *(void *)(a3 + 8);
  unint64_t v45 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - *(void *)a3) >> 2));
  if (v44 == *(void *)a3) {
    uint64_t v46 = 0LL;
  }
  else {
    uint64_t v46 = v45;
  }
  sub_D0F4(*(void *)a3, v44, v46, 1);
  unint64_t v48 = *(unsigned __int8 **)a3;
  __int16 v47 = *(unsigned __int8 **)(a3 + 8);
  if (*(unsigned __int8 **)a3 != v47)
  {
    char v49 = 0;
    unsigned __int8 v50 = 0;
    do
    {
      sub_7CA8();
      unint64_t v51 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
      {
        int v52 = *v48;
        int v53 = v48[1];
        int v54 = v48[2];
        int v55 = v48[3];
        int v56 = v48[6];
        int v57 = v48[7];
        int v58 = v48[4];
        *(_DWORD *)__b = 136317186;
        *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&__b[12] = 1024;
        *(_DWORD *)&__b[14] = 306;
        *(_WORD *)&__b[18] = 1024;
        *(_DWORD *)&__b[20] = v52;
        *(_WORD *)&__b[24] = 1024;
        *(_DWORD *)&__b[26] = v53;
        *(_WORD *)&__b[30] = 1024;
        *(_DWORD *)&__b[32] = v54;
        *(_WORD *)v89 = 1024;
        *(_DWORD *)&v89[2] = v55;
        __int16 v90 = 1024;
        int v91 = v56;
        __int16 v92 = 1024;
        int v93 = v57;
        __int16 v94 = 1024;
        int v95 = v58;
        _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_INFO,  "%25s:%-5d      blockID 0x%x blockType 0x%x first gt %u (%u total) inEP 0x%x outEP 0x%x gtb.midiProtocol 0x%x",  __b,  0x3Cu);
      }

      if (!v48[4])
      {
        int v61 = v48[6];
        int v62 = v48[7];
        sub_7CA8();
        int v63 = (os_log_s *)qword_28138;
        if (!v61 || !v62)
        {
          if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
          {
            int v78 = *v48;
            *(_DWORD *)__b = 136315650;
            *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
            *(_WORD *)&__b[12] = 1024;
            *(_DWORD *)&__b[14] = 319;
            *(_WORD *)&__b[18] = 1024;
            *(_DWORD *)&__b[20] = v78;
            _os_log_impl( &dword_0,  v63,  OS_LOG_TYPE_ERROR,  "%25s:%-5d      blockID 0x%x cannot use MIDI-CI without both a valid input and output endpoint. Skipping ...",  __b,  0x18u);
          }

          goto LABEL_91;
        }

        if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__b = 136315394;
          *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
          *(_WORD *)&__b[12] = 1024;
          *(_DWORD *)&__b[14] = 315;
          _os_log_impl( &dword_0,  v63,  OS_LOG_TYPE_INFO,  "%25s:%-5d           (MIDI-CI protocol negotiation will occur before going online)",  __b,  0x12u);
        }
      }

      unsigned int v59 = v48[1];
      if ((v59 | 2) == 2) {
        int v60 = v48[6];
      }
      else {
        int v60 = 0;
      }
      if (v59 >= 2) {
        unsigned __int8 v64 = 0;
      }
      else {
        unsigned __int8 v64 = v48[7];
      }
      if (v60 || v64)
      {
        unint64_t v65 = *a4;
        unsigned int v66 = v48[2];
        if (v48[4] < 5u) {
          char v67 = 1;
        }
        else {
          char v67 = 2;
        }
        if (v48[4]) {
          char v68 = v67;
        }
        else {
          char v68 = -1;
        }
        unsigned __int8 v69 = v48[3];
        unsigned __int8 v70 = *v48;
        __b[0] = v49;
        __b[1] = v50;
        __b[2] = v60;
        __b[3] = v64;
        __b[4] = v68;
        __b[5] = v66;
        __b[6] = v69;
        __b[7] = v70;
        sub_A234(a4, v65, (double *)__b);
        sub_7CA8();
        __int16 v71 = (os_log_s *)qword_28138;
        if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
        {
          int v72 = *v48;
          unsigned int v73 = v48[4];
          if (v73 < 5) {
            int v74 = 1;
          }
          else {
            int v74 = 2;
          }
          BOOL v75 = v73 == 0;
          int v76 = v48[2];
          if (v75) {
            int v74 = 255;
          }
          int v77 = v48[3];
          *(_DWORD *)__b = 136317186;
          *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
          *(_WORD *)&__b[12] = 1024;
          *(_DWORD *)&__b[14] = 332;
          *(_WORD *)&__b[18] = 1024;
          *(_DWORD *)&__b[20] = v72;
          *(_WORD *)&__b[24] = 1024;
          *(_DWORD *)&__b[26] = v50;
          *(_WORD *)&__b[30] = 1024;
          *(_DWORD *)&__b[32] = v60;
          *(_WORD *)v89 = 1024;
          *(_DWORD *)&v89[2] = v64;
          __int16 v90 = 1024;
          int v91 = v74;
          __int16 v92 = 1024;
          int v93 = v76;
          __int16 v94 = 1024;
          int v95 = v77;
          _os_log_impl( &dword_0,  v71,  OS_LOG_TYPE_INFO,  "%25s:%-5d      blockID 0x%x cable 0x%x, inEP 0x%x, outEP 0x%x, usbpipeprotocol 0x%00x, firstGroupTerminal %d , numGroups %d -> maplist",  __b,  0x3Cu);
        }

        ++v49;
        v50 += v48[3];
      }

LABEL_91:
      v48 += 12;
    }

    while (v48 != v47);
  }

  sub_7CA8();
  v79 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    uint64_t v80 = (a4[1] - *a4) >> 3;
    *(_DWORD *)__b = 136315650;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 337;
    *(_WORD *)&__b[18] = 2048;
    *(void *)&__b[20] = v80;
    _os_log_impl( &dword_0,  v79,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Maplist constructed with %lu group terminal block(s).",  __b,  0x1Cu);
  }

  if (SHIBYTE(v86) < 0) {
    operator delete(__p[0]);
  }
LABEL_99:
  sub_7CA8();
  int v81 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__b = 136315394;
    *(void *)&__b[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&__b[12] = 1024;
    *(_DWORD *)&__b[14] = 343;
    _os_log_impl(&dword_0, v81, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::CreatePortMapList()", __b, 0x12u);
  }

void sub_A174( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  uint64_t v23 = *(void **)a15;
  if (*(void *)a15)
  {
    *(void *)(a15 + 8) = v23;
    operator delete(v23);
  }

  _Unwind_Resume(exception_object);
}

unsigned __int8 **sub_A1BC( unsigned __int8 **result, unint64_t a2, unsigned int a3, uint8x8_t a4, int16x8_t a5)
{
  if (a3)
  {
    unint64_t v5 = a2 + a3;
    int v6 = *result;
    int v7 = result[1];
    do
    {
      if (v6 != v7)
      {
        unint64_t v8 = v6;
        while (*v8 != *(unsigned __int8 *)(a2 + 3))
        {
          v8 += 12;
          if (v8 == v7) {
            goto LABEL_9;
          }
        }

        v8[1] = *(_BYTE *)(a2 + 4);
        a4.i32[0] = *(_DWORD *)(a2 + 5);
        int16x4_t v9 = (int16x4_t)vmovl_u8(a4).u64[0];
        *(int16x4_t *)a5.i8 = vrev32_s16(v9);
        a5.i32[0] = v9.i32[0];
        a4 = (uint8x8_t)vmovn_s16(a5);
        *(_DWORD *)(v8 + 2) = a4.i32[0];
        *((_WORD *)v8 + 4) = *(_WORD *)(a2 + 9);
        *((_WORD *)v8 + 5) = *(_WORD *)(a2 + 11);
      }

LABEL_9:
      a2 += 13LL;
    }

    while (a2 < v5);
  }

  return result;
}

  if (!CFRunLoopContainsSource(v3, v4, kCFRunLoopDefaultMode)) {
    CFRunLoopAddSource(v3, source, kCFRunLoopDefaultMode);
  }
LABEL_12:
  sub_F9C8();
  int16x4_t v9 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = "failure";
    unsigned int v13 = "USBMIDIDevice.cpp";
    unsigned __int8 v14 = 1024;
    int v15 = 313;
    *(_DWORD *)buf = 136315906;
    if (v5) {
      uint64_t v10 = "success";
    }
    int v16 = 2048;
    int v17 = a1;
    unsigned int v18 = 2080;
    __int16 v19 = (CFRunLoopSourceRef)v10;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice(%p)::RegisterAsyncSource() = %s",  buf,  0x26u);
  }

uint64_t *sub_A234(uint64_t *a1, uint64_t a2, double *a3)
{
  uint64_t v4 = (uint64_t *)a2;
  unint64_t v6 = a1[1];
  unint64_t v9 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = v9;
  if (v6 >= v9)
  {
    uint64_t v10 = *a1;
    unint64_t v11 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    if (v11 >> 61) {
      sub_2CF0();
    }
    uint64_t v12 = (a2 - v10) >> 3;
    uint64_t v13 = v8 - v10;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= v11) {
      uint64_t v14 = ((uint64_t)(v6 - *a1) >> 3) + 1;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v22 = v7;
    if (v15) {
      int v16 = (char *)sub_E18C(v7, v15);
    }
    else {
      int v16 = 0LL;
    }
    __p = v16;
    __int16 v19 = &v16[8 * v12];
    BOOL v20 = v19;
    unsigned int v21 = &v16[8 * v15];
    sub_DF6C((uint64_t)&__p, a3);
    uint64_t v4 = (uint64_t *)sub_E0DC((uint64_t)a1, &__p, v4);
    if (v20 != v19) {
      v20 += (v19 - v20 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (a2 == v6)
  {
    *(double *)a2 = *a3;
    a1[1] = a2 + 8;
  }

  else
  {
    sub_DF18((uint64_t)a1, a2, v6, (char *)(a2 + 8));
    *uint64_t v4 = *(void *)a3;
  }

  return v4;
}

void sub_A36C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_A3A4(uint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = 0LL;
  a5[1] = 0LL;
  a5[2] = 0LL;
  sub_7CA8();
  uint64_t v10 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 1);
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 1);
    *(_DWORD *)uint8x8_t v41 = 136316418;
    *(void *)&v41[4] = "USBMIDIDriverBase.cpp";
    __int16 v42 = 1024;
    int v43 = 349;
    __int16 v44 = 2048;
    uint64_t v45 = a1;
    __int16 v46 = 1024;
    int v47 = a2;
    __int16 v48 = 2048;
    unint64_t v49 = v11;
    __int16 v50 = 2048;
    unint64_t v51 = v12;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDriverBase::CreatePortMapList(inUSBDevice:%p, interfaceNum:%d) - Constructing a USB MIDI 1.0 port map list for %lu inputs and %lu outputs...",  v41,  0x36u);
  }

  uint64_t v14 = *a3;
  uint64_t v13 = a3[1];
  if (v13 == *a3)
  {
    unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - *a3) >> 1);
  }

  else
  {
    unint64_t v15 = 0LL;
    unint64_t v16 = a5[1];
    do
    {
      int v17 = *(unsigned __int8 *)(v14 + 6 * v15 + 5);
      uint64_t v18 = *a5;
      if (*a5 == v16)
      {
        char v19 = 0;
      }

      else
      {
        char v19 = 0;
        do
        {
          char v20 = (v17 & 0x80) != 0 && *(unsigned __int8 *)(v18 + 2) == v17
             || (v17 & 0x80u) == 0 && *(unsigned __int8 *)(v18 + 3) == v17;
          v19 += v20;
          v18 += 8LL;
        }

        while (v18 != v16);
      }

      v41[0] = v15;
      v41[1] = v19;
      v41[2] = v17;
      *(_DWORD *)&v41[3] = 0;
      v41[7] = 0;
      if (v16 >= a5[2])
      {
        unint64_t v16 = sub_E2BC(a5, v41);
        uint64_t v14 = *a3;
        uint64_t v13 = a3[1];
      }

      else
      {
        *(_BYTE *)unint64_t v16 = v15;
        *(_BYTE *)(v16 + 1) = v19;
        *(_BYTE *)(v16 + 2) = v17;
        *(_DWORD *)(v16 + 3) = 0;
        *(_BYTE *)(v16 + 7) = 0;
        v16 += 8LL;
      }

      a5[1] = v16;
      ++v15;
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v14) >> 1);
    }

    while (v22 > v15);
  }

  uint64_t v24 = *a4;
  uint64_t v23 = a4[1];
  unint64_t v25 = (v23 - *a4) / 6;
  if (v25 >= v22) {
    LODWORD(v26) = v22;
  }
  else {
    uint64_t v26 = (v23 - *a4) / 6;
  }
  if ((int)v26 <= 0)
  {
    unint64_t v28 = a5[1];
  }

  else
  {
    uint64_t v27 = 0LL;
    uint64_t v29 = *a5;
    unint64_t v28 = a5[1];
    do
    {
      if (v27 == v25) {
        sub_E234();
      }
      if (v29 != v28)
      {
        int v30 = *(unsigned __int8 *)(v24 + 6 * v27 + 5);
        uint64_t v31 = v29;
        while (1)
        {
          int v32 = *(unsigned __int8 *)(v31 + 3);
          if ((v30 & 0x80) == 0 && v32 == v30)
          {
            int v32 = *(unsigned __int8 *)(v31 + 2);
            break;
          }

          v31 += 8LL;
          if (v31 == v28) {
            goto LABEL_45;
          }
        }

        uint64_t v33 = v29;
        if (v32)
        {
          while (*(unsigned __int8 *)(v33 + 2) != v32 || *(_BYTE *)(v33 + 3))
          {
            v33 += 8LL;
            if (v33 == v28) {
              goto LABEL_51;
            }
          }

          goto LABEL_50;
        }

LABEL_45:
        if (v29 == v28) {
          goto LABEL_51;
        }
        uint64_t v33 = v29;
        while (*(_BYTE *)(v33 + 3))
        {
          v33 += 8LL;
          if (v33 == v28) {
            goto LABEL_51;
          }
        }

LABEL_50:
        *(_BYTE *)(v33 + 3) = v30;
      }

LABEL_51:
      ++v27;
    }

    while (v27 != v26);
  }

  uint64_t v34 = v28 - *a5;
  if (v25 > v34 >> 3)
  {
    unint64_t v35 = v34 >> 3;
    unint64_t v36 = (unint64_t)v34 >> 3;
    int v37 = *(unsigned __int8 *)(v24 + 6 * v35 + 5);
    do
    {
      int v38 = v37;
      int v37 = *(unsigned __int8 *)(v24 + 6 * v35 + 5);
      if (v38 == v37) {
        int v39 = v36;
      }
      else {
        int v39 = 0;
      }
      v41[0] = v35;
      *(_WORD *)&v41[1] = v39;
      v41[3] = v37;
      *(_DWORD *)&v41[4] = 1;
      if (v28 >= a5[2])
      {
        unint64_t v28 = sub_E2BC(a5, v41);
        uint64_t v24 = *a4;
        uint64_t v23 = a4[1];
      }

      else
      {
        *(_BYTE *)unint64_t v28 = v35;
        *(_BYTE *)(v28 + 1) = v39;
        *(_BYTE *)(v28 + 2) = 0;
        *(_BYTE *)(v28 + 3) = v37;
        *(_DWORD *)(v28 + 4) = 1;
        v28 += 8LL;
      }

      LODWORD(v36) = v39 + 1;
      a5[1] = v28;
      unint64_t v35 = (uint64_t)(v28 - *a5) >> 3;
    }

    while (v35 < 0xAAAAAAAAAAAAAAABLL * ((v23 - v24) >> 1));
  }

  sub_7CA8();
  unint64_t v40 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8x8_t v41 = 136315394;
    *(void *)&v41[4] = "USBMIDIDriverBase.cpp";
    __int16 v42 = 1024;
    int v43 = 398;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDriverBase::CreatePortMapList()", v41, 0x12u);
  }

void sub_A7EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

CFStringRef sub_A810(uint64_t a1, int a2, const __CFString *a3)
{
  uint64_t v4 = sub_4AB8(a1, a2);
  if (!v4) {
    return v4;
  }
  int Length = CFStringGetLength(a3);
  int v6 = CFStringGetLength(v4);
  if (v6 < Length) {
    return v4;
  }
  CFIndex v7 = Length;
  v11.location = 0LL;
  v11.length = Length;
  if (CFStringCompareWithOptions(v4, a3, v11, 1uLL)) {
    return v4;
  }
  if (Length < v6)
  {
    while (1)
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v4, v7);
      if (CharacterAtIndex != 95 && CharacterAtIndex != 32) {
        break;
      }
      if (v6 == (_DWORD)++v7)
      {
        int Length = v6;
        goto LABEL_11;
      }
    }

    int Length = v7;
  }

LABEL_11:
  v12.location = Length;
  v12.length = v6 - Length;
  CFStringRef v10 = CFStringCreateWithSubstring(0LL, v4, v12);
  CFRelease(v4);
  return v10;
}

    unint64_t v5 = 0;
    goto LABEL_12;
  }

BOOL sub_A8FC( uint64_t a1, const __CFString *a2, MIDIDeviceRef a3, uint64_t *a4, uint64_t *a5, void *a6, void *a7, const __CFString *a8, char a9)
{
  MIDIEntityRef newEntity = 0;
  uint64_t v13 = a4[1];
  uint64_t v49 = *a4;
  sub_7CA8();
  uint64_t v14 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 559;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] configureDeviceUsingPortMap(using JackLists)",  buf,  0x12u);
  }

  sub_7CA8();
  unint64_t v15 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 560;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "%25s:%-5d      Constructing USB MIDI 1.0 entities...", buf, 0x12u);
  }

  uint64_t v48 = v13;
  if (v13 != v49)
  {
    unint64_t v16 = 0LL;
    unint64_t v17 = (v48 - v49) >> 3;
    if (v17 <= 1) {
      unint64_t v17 = 1LL;
    }
    unint64_t v51 = v17;
    int v52 = a8;
    do
    {
      int v56 = &off_248A0;
      CFTypeRef cf = 0LL;
      if (v16 >= (a4[1] - *a4) >> 3) {
        sub_E234();
      }
      uint64_t v18 = *a4 + 8 * v16;
      int v19 = *(unsigned __int8 *)(v18 + 2);
      int v20 = *(unsigned __int8 *)(v18 + 3);
      if (*(_BYTE *)(v18 + 2))
      {
        CFStringRef v21 = sub_A810(a1, *(unsigned __int8 *)(*a6 + 6 * v16 + 4), a8);
        uint64_t v22 = *a6;
        uint64_t v23 = *a5;
        uint64_t v24 = a5[1];
        if (*a5 != v24)
        {
          while (*(unsigned __int8 *)(v23 + 2) != *(unsigned __int8 *)(v22 + 6 * v16 + 3))
          {
            v23 += 6LL;
            if (v23 == v24) {
              goto LABEL_21;
            }
          }
        }

        if (v23 != v24)
        {
          if (v23)
          {
            int v25 = *(unsigned __int8 *)(v23 + 1);
            *(_BYTE *)(v22 + 6 * v16 + 1) = v25;
            if (v25 == 1)
            {
              sub_7CA8();
              uint64_t v26 = (os_log_s *)qword_28138;
              if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
              {
                int v27 = *(unsigned __int8 *)(*a6 + 6 * v16 + 2);
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 576;
                __int16 v60 = 1024;
                LODWORD(v61) = v27;
                _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found an embedded input at jack ID %d.",  buf,  0x18u);
              }
            }
          }
        }
      }

      else
      {
        CFStringRef v21 = 0LL;
      }

LABEL_21:
      if (v20)
      {
        CFStringRef v28 = sub_A810(a1, *(unsigned __int8 *)(*a7 + 6 * v16 + 4), a8);
        uint64_t v29 = *a7;
        uint64_t v30 = *a5;
        uint64_t v31 = a5[1];
        if (*a5 != v31)
        {
          while (*(unsigned __int8 *)(v30 + 3) != *(unsigned __int8 *)(v29 + 6 * v16 + 2))
          {
            v30 += 6LL;
            if (v30 == v31) {
              goto LABEL_31;
            }
          }
        }

        if (v30 != v31)
        {
          if (v30)
          {
            int v32 = *(unsigned __int8 *)(v30 + 1);
            *(_BYTE *)(v29 + 6 * v16 + 1) = v32;
            if (v32 == 1)
            {
              sub_7CA8();
              uint64_t v33 = (os_log_s *)qword_28138;
              if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
              {
                int v34 = *(unsigned __int8 *)(*a7 + 6 * v16 + 2);
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 586;
                __int16 v60 = 1024;
                LODWORD(v61) = v34;
                _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Found an embedded output at jack ID %d.",  buf,  0x18u);
              }
            }
          }
        }

LABEL_31:
        if (v21 && v28 && CFEqual(v21, v28))
        {
          CFRetain(v21);
          CFTypeRef v35 = cf;
          CFTypeRef cf = v21;
          if (v35) {
            CFRelease(v35);
          }
          CFRelease(v21);
          CFRelease(v28);
          CFStringRef v28 = 0LL;
          CFStringRef v21 = 0LL;
          goto LABEL_40;
        }
      }

      else
      {
        CFStringRef v28 = 0LL;
      }

      if ((unint64_t)(v48 - v49) >= 9)
      {
        CFStringRef v36 = CFStringCreateWithFormat(0LL, 0LL, a2, (v16 + 1));
        CFTypeRef v37 = cf;
        CFTypeRef cf = v36;
        *(void *)buf = &off_248A0;
        *(void *)&buf[8] = v37;
        sub_E444(buf);
      }

LABEL_40:
      if (!cf)
      {
        if (a8)
        {
          CFRetain(a8);
          CFTypeRef v41 = cf;
          CFTypeRef cf = a8;
          if (v41) {
            CFRelease(v41);
          }
        }

        else
        {
          CFTypeRef cf = 0LL;
        }
      }

      if (a9)
      {
        if (v19
          && v20
          && (int v38 = *(unsigned __int8 *)(*a6 + 6 * v16 + 1), v38 == *(unsigned __int8 *)(*a7 + 6 * v16 + 1)))
        {
          if (v38 == 1)
          {
            sub_7CA8();
            int v39 = (os_log_s *)qword_28138;
            Boolean v40 = 1;
            if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 611;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "%25s:%-5d      Creating an embedded entity.", buf, 0x12u);
            }

            goto LABEL_56;
          }
        }

        else if ((v19 != 0) != (v20 != 0))
        {
          __int16 v42 = a7;
          if (v19) {
            __int16 v42 = a6;
          }
          Boolean v40 = *(_BYTE *)(*v42 + 6 * v16 + 1) == 1;
          goto LABEL_56;
        }
      }

      Boolean v40 = 0;
LABEL_56:
      MIDIDeviceAddEntity(a3, (CFStringRef)cf, v40, v19 != 0, v20 != 0, &newEntity);
      if (v21)
      {
        MIDIObjectRef Source = MIDIEntityGetSource(newEntity, 0LL);
        MIDIObjectSetStringProperty(Source, kMIDIPropertyName, v21);
      }

      if (v28)
      {
        MIDIObjectRef Destination = MIDIEntityGetDestination(newEntity, 0LL);
        MIDIObjectSetStringProperty(Destination, kMIDIPropertyName, v28);
      }

      if (v16 >= (a4[1] - *a4) >> 3
        || (MIDIObjectSetIntegerProperty(newEntity, @"In Endpoint", *(unsigned __int8 *)(*a4 + 8 * v16 + 2)),
            v16 >= (a4[1] - *a4) >> 3)
        || (MIDIObjectSetIntegerProperty(newEntity, @"Out Endpoint", *(unsigned __int8 *)(*a4 + 8 * v16 + 3)),
            v16 >= (a4[1] - *a4) >> 3))
      {
        sub_E234();
      }

      MIDIObjectSetIntegerProperty(newEntity, @"Cable", *(unsigned __int8 *)(*a4 + 8 * v16 + 1));
      if (v21) {
        CFRelease(v21);
      }
      if (v28) {
        CFRelease(v28);
      }
      MIDIObjectSetIntegerProperty(a3, @"UMP Enabled", 0);
      sub_E444(&v56);
      ++v16;
      a8 = v52;
    }

    while (v16 != v51);
  }

  sub_7CA8();
  uint64_t v45 = (os_log_s *)qword_28138;
  if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    __int16 v46 = "false";
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDriverBase.cpp";
    if (v48 != v49) {
      __int16 v46 = "true";
    }
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 637;
    __int16 v60 = 2080;
    int v61 = v46;
    _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] configureDeviceUsingPortMap(using JackLists) = %s",  buf,  0x1Cu);
  }

  return v48 != v49;
}

void sub_B08C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
  if (a2) {
    sub_29BC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_B0CC(uint64_t a1, const __CFUUID *a2)
{
  *(void *)sub_194C8(a1, a2) = off_24788;
  v6[0] = &off_24950;
  CFIndex v7 = v6;
  sub_B1D4(@"usbmidiverbose", @"com.apple.coremidi", (uint64_t)sub_23D8, (uint64_t)v6);
  uint64_t v3 = v7;
  if (v7 == v6)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v6;
    goto LABEL_5;
  }

  if (v7)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_B190( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  unint64_t v15 = a13;
  if (a13 == &a10)
  {
    uint64_t v16 = 4LL;
    unint64_t v15 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v16 = 5LL;
  }

  (*(void (**)(void))(*(void *)v15 + 8 * v16))();
LABEL_6:
  sub_1970C(v13);
  _Unwind_Resume(a1);
}

void *sub_B1D4(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_2364();
  uint64_t v14 = a3;
  unint64_t v9 = v15;
  sub_2C18((uint64_t)v15, a4);
  uint64_t v18 = 0LL;
  CFStringRef v10 = operator new(0x30uLL);
  *CFStringRef v10 = &off_24908;
  v10[1] = v14;
  sub_EC8C((uint64_t)(v10 + 2), (uint64_t)v15);
  uint64_t v18 = v10;
  sub_2864((uint64_t)v8, a1, a2, (uint64_t)v17);
  __n128 result = v18;
  if (v18 == v17)
  {
    uint64_t v12 = 4LL;
    __n128 result = v17;
  }

  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    uint64_t v12 = 5LL;
  }

  __n128 result = (void *)(*(uint64_t (**)(void))(*result + 8 * v12))();
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
    unint64_t v9 = v16;
  }

  return (void *)(*(uint64_t (**)(void *))(*v9 + 8 * v13))(v9);
}

void sub_B300( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  int v20 = a17;
  if (a17 == v18)
  {
    uint64_t v21 = 4LL;
    int v20 = &a14;
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
    unint64_t v17 = a13;
  }

  (*(void (**)(void *))(*v17 + 8 * v22))(v17);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void sub_B378(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, void *a5@<X8>)
{
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  unsigned int v6 = a4;
  uint64_t v5 = a1;
  sub_EF30(&v5, &v8, &v7, &v6, a5);
}

uint64_t sub_B3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462LL;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 88LL))(a3, a2, a4);
  return 0LL;
}

uint64_t sub_B3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462LL;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 96LL))(a3, a2, a4);
  return 0LL;
}

void sub_B420(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a3 + 16) = 0;
  unsigned int v6 = (unsigned __int8 *)(a3 + 16);
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  uint64_t v7 = sub_445C(a1);
  uint64_t v8 = sub_5388(a2);
  if (!v7) {
    return;
  }
  uint64_t v9 = v8;
  if (!v8 || (sub_5678(a2) & 1) == 0) {
    return;
  }
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 136LL))(v9, a3 + 16);
  sub_7CA8();
  uint64_t v11 = qword_28138;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v16 = 136315650;
      *(void *)&v16[4] = "USBMIDIDriverBase.cpp";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 714;
      __int16 v17 = 1024;
      int v18 = v10;
      uint64_t v12 = "%25s:%-5d [!] USBMIDIClassDriver::ProbeDevice() - GetInterfaceNumber() returned error 0x%x";
      uint64_t v13 = (os_log_s *)v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_9:
      _os_log_impl(&dword_0, v13, v14, v12, v16, 0x18u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_INFO))
  {
    int v15 = *v6;
    *(_DWORD *)uint64_t v16 = 136315650;
    *(void *)&v16[4] = "USBMIDIDriverBase.cpp";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 716;
    __int16 v17 = 1024;
    int v18 = v15;
    uint64_t v12 = "%25s:%-5d [*] USBMIDIClassDriver::ProbeDevice() - inUSBInterface has interface number %d";
    uint64_t v13 = (os_log_s *)v11;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }

  sub_7D04(v9, (uint64_t)v16);
  if (*(void *)v16)
  {
    sub_7E80( v9,  *(unsigned __int8 **)v16,  (void *)(a3 + 24),  (char **)(a3 + 48),  (char **)(a3 + 72),  (unsigned __int8 **)(a3 + 96));
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
  }

  if (v19 < 0) {
    operator delete(*(void **)&v16[8]);
  }
}

void sub_B61C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_B650(v15);
  _Unwind_Resume(a1);
}

void *sub_B650(void *a1)
{
  uint64_t v2 = (void *)a1[12];
  if (v2)
  {
    a1[13] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[9];
  if (v3)
  {
    a1[10] = v3;
    operator delete(v3);
  }

  uint64_t v4 = (void *)a1[6];
  if (v4)
  {
    a1[7] = v4;
    operator delete(v4);
  }

  uint64_t v5 = (void *)a1[3];
  if (v5)
  {
    a1[4] = v5;
    operator delete(v5);
  }

  return a1;
}

BOOL sub_B6B0( uint64_t a1, uint64_t a2, const __CFString *a3, const __CFString *a4, const __CFString *a5, MIDIDeviceRef a6, uint64_t *a7, uint64_t *a8, void *a9, void *a10)
{
  uint64_t v16 = sub_5388(a2);
  CFStringRef v17 = sub_7AC4(a1, a4);
  char v19 = v18;
  __int16 v24 = 0;
  (*(void (**)(uint64_t, __int16 *))(*(void *)v16 + 104LL))(v16, &v24);
  BOOL v20 = sub_A8FC(a1, a3, a6, a7, a8, a9, a10, v19, v24 == 1452);
  if (a4 && v17 && CFStringCompare(v17, a4, 0LL)) {
    CFRelease(v17);
  }
  if (a5 && v19 && CFStringCompare(v19, a5, 0LL)) {
    CFRelease(v19);
  }
  return v20;
}

void sub_B7D0(int a1@<W0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *(void *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (a1) {
    sub_A3A4(v5, v6, (uint64_t *)(a2 + 48), (uint64_t *)(a2 + 72), a3);
  }
  else {
    sub_94D4(v5, v6, a2 + 96, a3);
  }
}

void sub_B7F8(uint64_t a1, MIDITimeStamp a2, char *a3, int64_t a4, uint64_t a5, MIDIProtocolID a6)
{
  uint64_t v7 = a3;
  if (a6)
  {
    if (*(_BYTE *)(a1 + 187))
    {
      sub_C168(a1, a2, a3, a4, 0, a6);
    }

    else
    {
      sub_7CA8();
      __int16 v71 = (os_log_s *)qword_28138;
      if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)evtlist = 136315394;
        *(void *)&evtlist[4] = "USBMIDIDriverBase.cpp";
        *(_WORD *)&evtlist[12] = 1024;
        *(_DWORD *)&evtlist[14] = 766;
        _os_log_impl( &dword_0,  v71,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDriverBase::USBMIDIHandleInput() - protocols newer than USB MIDI 1.0 need USB MIDI 2.0 dr iver support, which is disabled",  evtlist,  0x12u);
      }
    }

    return;
  }

  __int128 v109 = 0u;
  __int128 v110 = 0u;
  int v10 = &a3[a4];
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  memset(evtlist, 0, sizeof(evtlist));
  if (*(_BYTE *)(a1 + 187) && *(_BYTE *)(a1 + 490))
  {
    if (a4 < 1)
    {
      MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
      return;
    }

    unint64_t v11 = (unint64_t)a4 >> 2;
    uint64_t v12 = (unsigned int *)a3;
    do
    {
      *uint64_t v12 = bswap32(*v12);
      ++v12;
    }

    while (v12 < (unsigned int *)v10);
    MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
    if ((_DWORD)v11 && a4 >= 1)
    {
      unsigned __int8 v13 = 0;
      while (1)
      {
        if (!v7) {
          return;
        }
        int v89 = v11;
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = MIDIEventListInit((MIDIEventList *)evtlist, kMIDIProtocol_1_0);
        uint64_t v16 = v7;
        if (v15) {
          break;
        }
LABEL_113:
        unint64_t v69 = v16 - v7;
        if ((v69 >> 2))
        {
          LODWORD(v11) = v89 - (v69 >> 2);
          signed int v70 = *(_DWORD *)(a1 + 12);
          unsigned __int8 v13 = *(_DWORD *)v7 >> 28 >= v70 ? v70 - 1 : *(_DWORD *)v7 >> 28;
          MIDIReceivedEventList(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * v13), (const MIDIEventList *)evtlist);
          if ((_DWORD)v11)
          {
            v7 += v69 & 0x3FFFFFFFCLL;
            if (v7 < v10) {
              continue;
            }
          }
        }

        return;
      }

      CFStringRef v17 = v15;
      int v18 = (__int16 *)(v14 + 6LL * v13);
      unint64_t v19 = (unint64_t)*(unsigned int *)v7 >> 28;
      BOOL v20 = v18 + 2;
      unint64_t v90 = ((unint64_t)(HIBYTE(*(_DWORD *)v7) >> 4) << 24) | 0x30000000;
      uint64_t v16 = v7;
      while (1)
      {
        unint64_t v21 = *(unsigned int *)v16;
        unsigned int v23 = BYTE3(v21) & 0xF;
        if (v23 >= 2) {
          break;
        }
LABEL_81:
        v16 += 4;
        if (v16 >= v10) {
          goto LABEL_113;
        }
      }

      char v24 = BYTE2(*(_DWORD *)v16);
      if (v23 - 6 < 2)
      {
        uint64_t v25 = qword_1FAD8[(v21 >> 24) & 0xF];
        if (BYTE2(v21) == 240)
        {
          uint64_t v26 = v21 & 0x7F00;
          if (v25 == 2) {
            uint64_t v26 = 0LL;
          }
          unint64_t v27 = v26 & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)(v25 - 2) << 16) | v90;
          goto LABEL_48;
        }

LABEL_30:
        uint64_t v28 = v25 - 1;
        uint64_t v29 = *v20;
        if (!*v20 || *(_BYTE *)v18)
        {
          unsigned int v47 = WORD1(v21);
          char v48 = BYTE1(*(_DWORD *)v16);
          if (v28 == 1) {
            char v48 = 0;
          }
          else {
            char v24 = v47;
          }
          if (!v28)
          {
            char v24 = 0;
            char v48 = 0;
          }

          unint64_t v49 = ((_DWORD)v28 << 16) & 0xFF0000 | ((unint64_t)(v24 & 0x7F) << 8) | v48 & 0x7F | v90 | 0x300000;
        }

        else
        {
          char v95 = 0;
          int v94 = 0;
          unint64_t v30 = v28 + v29;
          if (v30)
          {
            uint64_t v31 = 0LL;
            __int16 v32 = 0;
            unsigned int v33 = v21 >> 8;
            do
            {
              if ((int)v29 <= v32)
              {
                if (v30 - v31 == 2) {
                  char v34 = v24;
                }
                else {
                  char v34 = v33;
                }
              }

              else
              {
                char v34 = *((_BYTE *)v18 + v31);
              }

              *((_BYTE *)&v94 + v31) = v34;
              uint64_t v31 = ++v32;
            }

            while (v30 > v32);
            char v35 = v94;
            char v36 = BYTE1(v94);
            char v37 = BYTE2(v94);
            char v38 = HIBYTE(v94);
            char v39 = v95;
          }

          else
          {
            char v39 = 0;
            char v38 = 0;
            char v37 = 0;
            char v36 = 0;
            char v35 = 0;
          }

          uint64_t v50 = v37 & 0x7F;
          unint64_t v51 = (unint64_t)(v35 & 0x7F) << 8;
          if (!v30) {
            unint64_t v51 = 0LL;
          }
          uint64_t v52 = v36 & 0x7F;
          if (v30 <= 1) {
            uint64_t v52 = 0LL;
          }
          uint64_t v53 = v50 << 56;
          if (v30 <= 2) {
            uint64_t v53 = 0LL;
          }
          unint64_t v54 = (unint64_t)(v38 & 0x7F) << 48;
          if (v30 <= 3) {
            unint64_t v54 = 0LL;
          }
          unint64_t v55 = (unint64_t)(v39 & 0x7F) << 40;
          if (v30 <= 4) {
            unint64_t v55 = 0LL;
          }
          unint64_t v49 = ((_DWORD)v30 << 16) & 0xCF0000LL | ((_DWORD)v19 << 24) | 0x30300000u | v55 | v54 | v52 | v53 | v51;
        }

        *(void *)words = v49;
        bzero(v18, 4uLL);
        __int16 *v20 = 0;
LABEL_79:
        int v56 = MIDIEventListAdd((MIDIEventList *)evtlist, 0x200uLL, v17, a2, 2uLL, words);
        if (!v56) {
          goto LABEL_113;
        }
        CFStringRef v17 = v56;
        bzero(v18, 4uLL);
        __int16 *v20 = 0;
        goto LABEL_81;
      }

      if (v23 == 5)
      {
        if (BYTE2(v21) == 240 || BYTE2(v21) == 247)
        {
          if (BYTE2(v21) == 247)
          {
            uint64_t v25 = qword_1FAD8[(v21 >> 24) & 0xF];
            goto LABEL_30;
          }

LABEL_42:
          unint64_t v40 = qword_1FAD8[(v21 >> 24) & 0xF] - 1LL;
          uint64_t v41 = v21 & 0x7F;
          uint64_t v42 = ((_DWORD)v40 << 16) & 0xEF0000LL;
          uint64_t v43 = v21 & 0x7F00;
          if (!v40) {
            uint64_t v43 = 0LL;
          }
          if (v40 >= 2) {
            uint64_t v44 = v41;
          }
          else {
            uint64_t v44 = 0LL;
          }
          unint64_t v27 = v42 | ((_DWORD)v19 << 24) | 0x30100000u | v43 | v44;
LABEL_48:
          *(void *)words = v27;
          goto LABEL_79;
        }
      }

      else if (BYTE2(v21) == 240)
      {
        goto LABEL_42;
      }

      if ((~(_DWORD)v21 & 0xF000000) == 0 && ((~(_DWORD)v21 & 0xF80000) != 0 || (v21 & 0xFB0000) == 0xF90000))
      {
        uint64_t v57 = *v20;
        __int16 *v20 = v57 + 1;
        *((_BYTE *)v18 + v57) = v24;
        int v58 = sub_E4B0((unsigned __int8 *)v18);
        if (!v58) {
          goto LABEL_81;
        }
        if (v58 == 4)
        {
          *(void *)words = ((unint64_t)*(unsigned int *)v16 >> 4) & 0xF000000 | ((unint64_t)(*(_BYTE *)v18 & 0x7F) << 8) | *((_BYTE *)v18 + 1) & 0x7F | 0x30220000;
          unsigned int v59 = v17;
          MIDITimeStamp v60 = a2;
          ByteCount v61 = 2LL;
          goto LABEL_95;
        }

        unsigned int v65 = *(unsigned __int8 *)v18;
        BOOL v67 = (v65 + 15) < 8u && ((0xA7u >> (v65 + 15)) & 1) != 0 || v65 > 0xF9 && v65 != 253;
        unint64_t v64 = 0LL;
        int v68 = 1 << (v58 & 0xF);
        if ((v68 & 0x7F00) == 0 && (v68 & 0xC) == 0)
        {
          if ((v68 & 0x8020) == 0) {
            goto LABEL_94;
          }
          if (!v67)
          {
            unint64_t v64 = 0LL;
            goto LABEL_94;
          }
        }

        unint64_t v64 = (unint64_t)(v18[1] & 0x7F) << 24;
        goto LABEL_94;
      }

      BOOL v46 = (BYTE2(v21) + 15) < 8u && ((0xA7u >> (BYTE2(v21) + 15)) & 1) != 0
         || BYTE2(v21) > 0xF9u && BYTE2(v21) != 253;
      unsigned int v62 = 0;
      int v63 = 1 << v23;
      if ((v63 & 0x7F00) == 0 && (v63 & 0xC) == 0)
      {
        if ((v63 & 0x8020) == 0)
        {
LABEL_93:
          unint64_t v64 = v62;
LABEL_94:
          *(void *)words = v64;
          uint64_t v93 = 0LL;
          ByteCount v61 = byte_1FB58[v64 >> 28];
          unsigned int v59 = v17;
          MIDITimeStamp v60 = a2;
LABEL_95:
          CFStringRef v17 = MIDIEventListAdd((MIDIEventList *)evtlist, 0x200uLL, v59, v60, v61, words);
          if (!v17) {
            goto LABEL_113;
          }
          goto LABEL_81;
        }

        if (!v46)
        {
          unsigned int v62 = 0;
          goto LABEL_93;
        }
      }

      unsigned int v62 = (*(_DWORD *)v16 & 0x7F) << 24;
      goto LABEL_93;
    }
  }

  else
  {
    int v72 = MIDIPacketListInit((MIDIPacketList *)evtlist);
    if (a4 >= 1)
    {
      unsigned int v73 = v72;
      uint64_t v74 = 0LL;
      char v75 = 0;
      unsigned int v91 = 0;
      do
      {
        unint64_t v76 = (unint64_t)v10;
        unsigned int v77 = *v7;
        unsigned int v78 = v77 & 0xF;
        if (v78 < 2)
        {
LABEL_151:
          uint64_t v83 = v74;
        }

        else
        {
          int v79 = *(_DWORD *)(a1 + 12);
          else {
            unsigned int v80 = v77 >> 4;
          }
          if (v75 && v80 != v91)
          {
            MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
            unsigned int v73 = MIDIPacketListInit((MIDIPacketList *)evtlist);
            uint64_t v74 = 0LL;
          }

          if ((v80 & 0x80000000) == 0)
          {
            int v81 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 2 <= (unint64_t)v80 ? v91 : v80;
            unsigned int v91 = v81;
          }

          unsigned int v82 = 1;
          switch(v78)
          {
            case 2u:
            case 0xCu:
            case 0xDu:
              unsigned int v82 = 2;
              goto LABEL_149;
            case 3u:
            case 8u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xEu:
              goto LABEL_138;
            case 4u:
              uint64_t v83 = 1LL;
              if ((v74 & 1) != 0)
              {
                unsigned int v82 = 3;
LABEL_144:
                unsigned int v84 = &v73->data[v73->length];
                if (&v84[v82] <= (Byte *)&v111)
                {
                  memcpy(v84, v7 + 1, v82);
                  v73->length += v82;
                  break;
                }

                if (v75) {
                  MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
                }
                unsigned int v73 = MIDIPacketListInit((MIDIPacketList *)evtlist);
                uint64_t v74 = 0LL;
              }

              else
              {
                uint64_t v74 = 1LL;
LABEL_138:
                unsigned int v82 = 3;
              }

      ++v19;
      BOOL v20 = v22;
      if (v19 == 7)
      {
        char v24 = bswap32(v30);
        *a3 = (v18 << 20) | (v21 << 16) | (v29[0] << 8) | v29[1] | 0x30000000;
        a3[1] = v24;
        *a2 = a1[2];
        return 1LL;
      }
    }
  }

  if (v6 == 247)
  {
    *(void *)a3 = 808452096LL;
    *a2 = a1[2];
    uint64_t v25 = v4 + 1;
    goto LABEL_53;
  }

  uint64_t v14 = byte_28070[v6 - 240];
  if (!byte_28070[v6 - 240])
  {
    int v15 = v4;
    while (1)
    {
      uint64_t v4 = v15 + 1;
      a1[3] = v15 + 1;
      if (v15 + 1 >= v3) {
        return 0LL;
      }
      uint64_t v16 = *(char *)(v5 + v15++ + 1);
      if (v16 < 0)
      {
        int v6 = *(unsigned __int8 *)(v5 + v4);
        goto LABEL_3;
      }
    }
  }

  uint64_t v25 = v4 + v14;
  if (v4 + v14 > v3)
  {
    int v10 = 0LL;
LABEL_19:
    a1[3] = v3;
    return v10;
  }

  if (v14 < 2)
  {
    unint64_t v27 = 0;
    goto LABEL_51;
  }

  uint64_t v26 = v4 + v5;
  unint64_t v27 = *(_BYTE *)(v4 + v5 + 1) & 0x7F;
  if ((_DWORD)v14 == 2)
  {
LABEL_51:
    uint64_t v28 = 0;
    goto LABEL_52;
  }

  uint64_t v28 = *(_BYTE *)(v26 + 2) & 0x7F;
LABEL_52:
  *a3 = (v6 << 16) | (v27 << 8) | v28 | 0x10000000;
  *a2 = a1[2];
LABEL_53:
  a1[3] = v25;
  return 1LL;
}

LABEL_149:
              unsigned __int8 v85 = MIDIPacketListAdd((MIDIPacketList *)evtlist, 0x200uLL, v73, a2, v82, (const Byte *)v7 + 1);
              if (v85)
              {
                unsigned int v73 = v85;
                goto LABEL_151;
              }

              do
              {
                if (v75) {
                  MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
                }
                uint64_t v86 = MIDIPacketListInit((MIDIPacketList *)evtlist);
                int v87 = MIDIPacketListAdd((MIDIPacketList *)evtlist, 0x200uLL, v86, a2, v82, (const Byte *)v7 + 1);
              }

              while (!v87);
              unsigned int v73 = v87;
              uint64_t v83 = 0LL;
              break;
            case 5u:
              goto LABEL_149;
            case 6u:
            case 7u:
LABEL_143:
              uint64_t v83 = 0LL;
              unsigned int v82 = v78 - 4;
              if ((v74 & 1) != 0) {
                goto LABEL_144;
              }
              uint64_t v74 = 0LL;
              goto LABEL_149;
            case 0xFu:
              goto LABEL_149;
            default:
              goto LABEL_151;
          }
        }

        v7 += 4;
        uint64_t v74 = v83;
        int v10 = (char *)v76;
      }

      while ((unint64_t)v7 < v76);
      if (*(_DWORD *)evtlist) {
        BOOL v88 = v75 == 0;
      }
      else {
        BOOL v88 = 1;
      }
      if (!v88) {
        MIDIReceived(*(_DWORD *)(*(void *)(a1 + 16) + 4LL * (int)v91), (const MIDIPacketList *)evtlist);
      }
    }
  }

uint64_t sub_C168(uint64_t result, MIDITimeStamp a2, char *a3, unint64_t a4, int a5, MIDIProtocolID a6)
{
  if (a6 <= kMIDIProtocol_2_0)
  {
    v22[10] = v6;
    v22[11] = v7;
    unint64_t v8 = a4 >> 2;
    memset(v21, 0, sizeof(v21));
    if ((a4 >> 2))
    {
      int v10 = a3;
      uint64_t v12 = result;
      unsigned __int8 v13 = &a3[a4];
      do
      {
        if (!v10) {
          break;
        }
        if (v13 <= v10) {
          break;
        }
        __n128 result = sub_E5A4(a6, a2, v10, (v13 - v10) >> 2, (MIDIEventList *)v21, (unint64_t)v22);
        if (!(_DWORD)result) {
          break;
        }
        unsigned int v14 = result;
        int v15 = *(_DWORD *)v10 >> 28;
        int v16 = HIBYTE(*(_DWORD *)v10) & 0xF;
        if (v15 == 15) {
          int v16 = 255;
        }
        if (v15) {
          unsigned int v17 = v16;
        }
        else {
          unsigned int v17 = 255;
        }
        int v18 = *(unsigned __int8 *)(v12 + 189);
        unsigned int v19 = *(_DWORD *)(v12 + 12) - v18;
        if (v19 <= v17) {
          unsigned int v20 = v19 - 1;
        }
        else {
          unsigned int v20 = v17;
        }
        if (v17 != 255 && v20 != 255)
        {
          __n128 result = MIDIReceivedEventList(*(_DWORD *)(*(void *)(v12 + 16) + 4LL * v20), (const MIDIEventList *)v21);
          int v18 = *(unsigned __int8 *)(v12 + 189);
        }

        if (v18) {
          __n128 result = MIDIReceivedEventList(*(_DWORD *)(*(void *)(v12 + 24) - 4LL), (const MIDIEventList *)v21);
        }
        if (&v10[4 * v14] <= v13) {
          v10 += 4 * v14;
        }
        else {
          int v10 = v13;
        }
        LODWORD(v8) = v8 - v14;
      }

      while ((_DWORD)v8);
    }
  }

  return result;
}

uint64_t sub_C2CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (*(void *)(a2 + 16)) {
    int v4 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 120LL);
  }
  else {
    int v4 = 0;
  }
  unint64_t v5 = a3 + a4 - 4;
LABEL_5:
  if (*(void *)(a2 + 16))
  {
    uint64_t v6 = a2;
    while (1)
    {
      uint64_t v6 = *(void *)(v6 + 8);
      if (v6 == a2) {
        break;
      }
      if (*(unsigned __int8 *)(v6 + 120) == v4)
      {
        if (*(void *)(v6 + 32)) {
          uint64_t v7 = *(void *)(v6 + 32);
        }
        else {
          uint64_t v7 = v6 + 40;
        }
        if (*(_DWORD *)(v6 + 24) - *(_DWORD *)(v6 + 112) >= 1 && a3 <= v5) {
          __asm { BR              X12 }
        }

        if (a3 <= v5) {
          goto LABEL_5;
        }
        return 0LL;
      }
    }
  }

  return 0LL;
}

_BYTE *sub_C5A4(uint64_t a1, uint64_t *a2, _BYTE *a3, uint64_t a4, int a5)
{
  int v5 = a5;
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v8 = *a2;
  if (*a2 == a2[1]) {
    int v9 = 0;
  }
  else {
    int v9 = *(unsigned __int8 *)(v8 + 292);
  }
  unint64_t v10 = (unint64_t)&a3[a4];
  int v79 = v9;
  unint64_t v87 = (unint64_t)&a3[a4];
  do
  {
    while (1)
    {
      if (v8 == v7[1]) {
        return (_BYTE *)(v6 - a3);
      }
      uint64_t v11 = sub_E740(v8);
      uint64_t v12 = *(int *)(v8 + 288);
      int v13 = *(_DWORD *)(sub_E740(v8) + 8);
      int v14 = *(_DWORD *)(v8 + 288);
      unsigned int v15 = v13 - v14;
      if (v13 == v14) {
        break;
      }
      unsigned int v16 = 0;
      uint64_t v17 = v11 + 4 * v12 + 12;
      unint64_t v18 = v17 + 4LL * v15;
      uint64_t v83 = v8;
      unsigned int v82 = v13 - v14;
      unint64_t v80 = v18;
      uint64_t v81 = v17;
      while (1)
      {
        unsigned int v19 = (unsigned int *)(v17 + 4LL * v16);
        if (v5) {
          break;
        }
        if (((v18 - (void)v19) & 0x3FFFFFFFCLL) == 0)
        {
          LODWORD(v26) = 0;
          goto LABEL_143;
        }

        LODWORD(v26) = 0;
        if (v6 && (unint64_t)v6 < v10)
        {
          unsigned int v85 = v16;
          unsigned int v27 = 0;
          int v28 = 0;
          uint64_t v29 = (char *)v19 + ((v18 - (void)v19) & 0x3FFFFFFFCLL);
          unsigned int v84 = (char *)(v17 + 4LL * v16);
          uint64_t v86 = v29;
          while (1)
          {
            if ((int)((unint64_t)(v29 - (char *)v19) >> 2) < 1)
            {
LABEL_141:
              unint64_t v67 = (char *)v19 - v84;
              unsigned int v19 = (unsigned int *)v84;
              unint64_t v26 = v67 >> 2;
              goto LABEL_142;
            }

            unsigned int v30 = *v19;
            unsigned int v31 = *v19 >> 28;
            switch(v31)
            {
              case 1u:
                if (BYTE2(v30) - 241 <= 0xE)
                {
                  if (((1 << (BYTE2(v30) + 15)) & 0x6EA0) != 0)
                  {
                    int v34 = (v30 >> 20) & 0xF0;
                    int v28 = v34 | 5;
                    *uint64_t v6 = v34 | 5;
                    v6[1] = *((_WORD *)v19 + 1);
                    unsigned int v27 = 1;
LABEL_48:
                    _BYTE v6[2] = 0;
                    goto LABEL_125;
                  }

                  if (((1 << (BYTE2(v30) + 15)) & 5) != 0)
                  {
                    unsigned int v27 = 2;
LABEL_122:
                    int v28 = v27 | (v30 >> 20) & 0xF0;
                    *uint64_t v6 = v27 | (v30 >> 20) & 0xF0;
                    v6[1] = *((_WORD *)v19 + 1);
                    goto LABEL_123;
                  }

                  if (BYTE2(v30) == 242)
                  {
                    unsigned int v27 = 3;
                    goto LABEL_122;
                  }
                }

                break;
              case 2u:
                int v35 = (v30 >> 20) & 0xF;
                int v28 = (v30 >> 20);
                if (v35 != 15)
                {
                  if (((1 << v35) & 0x3000) != 0) {
                    unsigned int v27 = 2;
                  }
                  if (((1 << v35) & 0x4F00) != 0) {
                    unsigned int v27 = 3;
                  }
                }

                break;
              case 3u:
                unsigned int v32 = (v30 >> 20) & 0xF;
                uint64_t v88 = 0LL;
                unsigned int v27 = HIWORD(v30) & 0xF;
                if (v32 < 2) {
                  ++v27;
                }
                if (v32) {
                  BOOL v33 = v32 == 3;
                }
                else {
                  BOOL v33 = 1;
                }
                if (v33) {
                  ++v27;
                }
                if (v27 > 8)
                {
                  unsigned int v27 = 0;
                  goto LABEL_73;
                }

                if (v32 == 3 || (LODWORD(v36) = v27, !v32))
                {
                  uint64_t v36 = (int)v27 - 1LL;
                  *((_BYTE *)&v88 + v36) = -9;
                }

                if (v32 > 1)
                {
                  char v37 = (char *)&v88;
                }

                else
                {
                  LOBYTE(v88) = -16;
                  LODWORD(v36) = v36 - 1;
                  char v37 = (char *)&v88 + 1;
                }

                if ((int)v36 >= 1)
                {
                  char v38 = 0;
                  uint64_t v39 = 0LL;
                  do
                  {
                    if (v39 <= 5)
                    {
                      else {
                        uint64_t v41 = v19;
                      }
                      else {
                        char v42 = 8;
                      }
                      char v40 = *v41 >> (v42 + v38);
                    }

                    else
                    {
                      char v40 = 0;
                    }

                    v37[v39] = v40;
                    v38 -= 8;
                    ++v39;
                  }

                  while (v36 != v39);
                }

                if (v27)
                {
                  if (*((unsigned __int8 *)&v88 + v27 - 1) == 247)
                  {
                    if (v27 >= 4)
                    {
                      unsigned int v43 = v27 / 3;
                      if (-1431655765 * v27 > 0x55555555) {
                        ++v43;
                      }
                    }

                    else
                    {
                      unsigned int v43 = 1;
                    }
                  }

                  else if (v27 >= 3)
                  {
                    unsigned int v43 = v27 / 3 + v27 % 3;
                  }

                  else
                  {
                    unsigned int v43 = v27;
                  }
                }

                else
                {
LABEL_73:
                  unsigned int v43 = 0;
                }

                if (v43 <= (v87 - (unint64_t)v6) >> 2)
                {
                  int v44 = 0;
                  while (v27 != 1)
                  {
                    if (!v27)
                    {
                      uint64_t v64 = byte_1FB58[(unint64_t)*v19 >> 28];
                      uint64_t v29 = v86;
                      goto LABEL_129;
                    }

                    BOOL v45 = v32 != 1;
                    unsigned int v46 = v27 - 3;
                    if (v27 != 3) {
                      BOOL v45 = 1;
                    }
                    if (v27 <= 3 && v45)
                    {
LABEL_95:
                      if (v32 && v32 != 3)
                      {
                        unsigned int v52 = *v19;
                        unsigned int v46 = v27;
                        goto LABEL_110;
                      }

                      unsigned int v46 = v27;
                      unint64_t v51 = v6;
LABEL_98:
                      unsigned int v54 = *v19 >> 28;
                      if (v54) {
                        BOOL v55 = v54 == 15;
                      }
                      else {
                        BOOL v55 = 1;
                      }
                      int v56 = HIBYTE(*v19) & 0xF;
                      if (v55) {
                        LOBYTE(v56) = -1;
                      }
                      int v57 = 16 * (v56 & 0xF);
                      int v28 = v57 | (v46 + 4);
                      *unint64_t v51 = v57 | (v46 + 4);
                      uint64_t v58 = v46;
                      memcpy(v51 + 1, (char *)&v88 + v44, v46);
                      unsigned int v27 = 0;
                      uint64_t v6 = &v51[v46 + 1];
                      if (v46 <= 2)
                      {
                        else {
                          int v59 = 3 - v46;
                        }
                        uint64_t v60 = 3 - v46 - v59;
                        bzero(v6, v60 + 1);
                        unsigned int v27 = 0;
                        uint64_t v6 = &v51[v58 + 2 + v60];
                      }
                    }

                    else
                    {
                      unsigned int v47 = *v19 >> 28;
                      if (v47) {
                        BOOL v48 = v47 == 15;
                      }
                      else {
                        BOOL v48 = 1;
                      }
                      int v49 = HIBYTE(*v19) & 0xF;
                      if (v48) {
                        LOBYTE(v49) = -1;
                      }
                      int v28 = (16 * (v49 & 0xF)) | 4;
                      *uint64_t v6 = (16 * (v49 & 0xF)) | 4;
                      uint64_t v50 = (char *)&v88 + v44;
                      v6[1] = *v50;
                      _BYTE v6[2] = v50[1];
                      v44 += 3;
                      unint64_t v51 = v6 + 4;
                      void v6[3] = v50[2];
                      LODWORD(v50) = v27 - 4;
                      v27 -= 3;
                      v6 += 4;
                      if (v50 <= 2)
                      {
                        unsigned int v52 = *v19;
                        if (*v19 >> 28 == 3) {
                          int v53 = (*v19 >> 20) & 0xF;
                        }
                        else {
                          int v53 = -1;
                        }
LABEL_111:
                        if (v52 >> 28) {
                          BOOL v61 = v52 >> 28 == 15;
                        }
                        else {
                          BOOL v61 = 1;
                        }
                        int v62 = HIBYTE(v52) & 0xF;
                        if (v61) {
                          LOBYTE(v62) = -1;
                        }
                        int v28 = (16 * (v62 & 0xF)) | 0xF;
                        *unint64_t v51 = (16 * (v62 & 0xF)) | 0xF;
                        char v63 = *((_BYTE *)&v88 + v44++);
                        v51[1] = v63;
                        *((_WORD *)v51 + 1) = 0;
                        uint64_t v6 = v51 + 4;
                        unsigned int v27 = v46 - 1;
                      }
                    }
                  }

                  unsigned int v52 = *v19;
                  if ((*v19 & 0xF0F00000) != 0x30300000)
                  {
                    unsigned int v46 = 1;
LABEL_110:
                    unint64_t v51 = v6;
                    goto LABEL_111;
                  }

                  goto LABEL_95;
                }

                unint64_t v69 = (char *)v19 - v84;
                unsigned int v19 = (unsigned int *)v84;
                unint64_t v26 = v69 >> 2;
LABEL_142:
                int v5 = a5;
                int v9 = v79;
                uint64_t v7 = a2;
                uint64_t v8 = v83;
                unint64_t v10 = v87;
                unsigned int v16 = v85;
                unsigned int v15 = v82;
                unint64_t v18 = v80;
                uint64_t v17 = v81;
                goto LABEL_143;
            }

            if (!v28) {
              goto LABEL_128;
            }
            *uint64_t v6 = v28;
            v6[1] = *((_WORD *)v19 + 1);
            if (v27 <= 1) {
              goto LABEL_48;
            }
LABEL_123:
            _BYTE v6[2] = BYTE1(*v19);
            if (v27 > 2)
            {
              void v6[3] = *v19;
              goto LABEL_127;
            }

            unsigned int v27 = 2;
LABEL_125:
            void v6[3] = 0;
LABEL_127:
            v6 += 4;
LABEL_128:
            uint64_t v64 = byte_1FB58[(unint64_t)*v19 >> 28];
LABEL_129:
            v19 += v64;
          }
        }

LABEL_143:
        int v68 = &v19[v26];
        v16 += v26;
        if (v10 - (unint64_t)v6 < 4 {
LABEL_145:
        }
        if (v16 >= v15) {
          goto LABEL_9;
        }
      }

      if (v10 <= (unint64_t)v6)
      {
        LODWORD(v65) = 0;
      }

      else
      {
        unint64_t v20 = (v18 - (unint64_t)v19) >> 2;
        unint64_t v21 = (unsigned int *)(v17 + 4LL * v16);
        uint64_t v22 = v6;
        while ((int)v20 >= 1)
        {
          unint64_t v23 = byte_1FB58[(unint64_t)*v21 >> 28];
          if (byte_1FB58[(unint64_t)*v21 >> 28])
          {
            char v24 = &v21[v23];
            do
            {
              int v25 = *v21++;
              *(_DWORD *)uint64_t v22 = v25;
              v22 += 4;
            }

            while (v21 < v24);
          }

          unint64_t v20 = (v18 - (unint64_t)v21) >> 2;
        }

        unint64_t v65 = (unint64_t)(v22 - v6) >> 2;
      }

      unsigned int v66 = &v19[(int)v65];
      v6 += 4 * (int)v65;
      if ((unint64_t)v66 < v18)
      {
        v16 += v65;
        goto LABEL_145;
      }

LABEL_148:
      sub_E840((uint64_t)&v88, v8 + 296, v7[1], v8);
      uint64_t v71 = v70;
      for (uint64_t i = v7[1]; i != v71; uint64_t i = sub_E7D0(i - 296))
        ;
      v7[1] = v71;
    }

    unsigned int v16 = 0;
LABEL_9:
    v8 += 296LL;
  }

  while (!v16);
  uint64_t v73 = *v7;
  uint64_t v74 = v7[1];
  while (v73 != v74)
  {
    if (*(unsigned __int8 *)(v73 + 292) == v9)
    {
      if (v73 != v74) {
        *(_DWORD *)(v73 + 288) += v16;
      }
      return (_BYTE *)(v6 - a3);
    }

    v73 += 296LL;
  }

  return (_BYTE *)(v6 - a3);
}

uint64_t sub_CD3C(int a1, MIDIObjectRef obj)
{
  CFStringRef v6 = 0LL;
  CFStringRef str = 0LL;
  CFStringRef v5 = 0LL;
  if (!obj) {
    return 0LL;
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyName, &str);
  if (str) {
    uint64_t v3 = CFEqual(str, @"USB MIDI Device") != 0;
  }
  else {
    uint64_t v3 = 0LL;
  }
  MIDIObjectGetStringProperty(obj, kMIDIPropertyModel, &v6);
  if (v6)
  {
    if (CFEqual(v6, @"USB MIDI Device")) {
      uint64_t v3 = 1LL;
    }
    else {
      uint64_t v3 = v3;
    }
  }

  MIDIObjectGetStringProperty(obj, kMIDIPropertyManufacturer, &v5);
  if (v5)
  {
    if (CFEqual(v5, @"Generic")) {
      uint64_t v3 = 1LL;
    }
    else {
      uint64_t v3 = v3;
    }
  }

  if (str) {
    CFRelease(str);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v3;
}

BOOL sub_CE40(int a1, MIDIDeviceRef device)
{
  CFStringRef str = 0LL;
  ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(device);
  if (NumberOfEntities)
  {
    ItemCount v4 = NumberOfEntities;
    ItemCount v5 = 0LL;
    BOOL v6 = 1;
    do
    {
      MIDIObjectRef Entity = MIDIDeviceGetEntity(device, v5);
      if (Entity)
      {
        MIDIObjectGetStringProperty(Entity, kMIDIPropertyName, &str);
        if (str)
        {
          int v8 = CFEqual(str, @"USB MIDI Device");
          CFStringRef v9 = str;
          if (v8) {
            goto LABEL_10;
          }
          if (str)
          {
            CFRelease(str);
            CFStringRef str = 0LL;
          }
        }
      }

      BOOL v6 = ++v5 < v4;
    }

    while (v4 != v5);
    BOOL v6 = 0;
    CFStringRef v9 = str;
LABEL_10:
    if (v9) {
      CFRelease(v9);
    }
  }

  else
  {
    return 0;
  }

  return v6;
}

uint64_t sub_CF18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = sub_CD3C(a1, a2);
  if ((v8 & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200LL))(a1, a3, a4, a2);
  }
  uint64_t result = sub_CE40(v8, a2);
  if ((_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200LL))(a1, a3, a4, a2);
  }
  return result;
}

uint64_t sub_CF84()
{
  return 0LL;
}

uint64_t sub_CF8C()
{
  return 0LL;
}

uint64_t sub_CF94()
{
  return 0LL;
}

uint64_t sub_CF9C()
{
  return 0LL;
}

uint64_t sub_CFA4()
{
  return 0LL;
}

uint64_t sub_CFAC()
{
  return 0LL;
}

uint64_t sub_CFB4()
{
  return 0LL;
}

void *sub_CFBC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_3D80();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    BOOL v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    BOOL v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void *sub_D06C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAAABLL) {
    sub_2DBC();
  }
  return operator new(6 * a2);
}

void *sub_D0B0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556LL) {
    sub_2DBC();
  }
  return operator new(12 * a2);
}

uint64_t sub_D0F4(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = result;
LABEL_2:
  unint64_t v8 = v7;
  while (2)
  {
    uint64_t v7 = v8;
    uint64_t v9 = a2 - v8;
    uint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - v8) >> 2);
    switch(v10)
    {
      case 0LL:
      case 1LL:
        return result;
      case 2LL:
        if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(v8 + 2))
        {
          int v123 = *(_DWORD *)(v8 + 8);
          uint64_t v114 = *(void *)v8;
          uint64_t v45 = *(void *)(a2 - 12);
          *(_DWORD *)(v8 + 8) = *(_DWORD *)(a2 - 4);
          *(void *)unint64_t v8 = v45;
          *(_DWORD *)(a2 - 4) = v123;
          *(void *)(a2 - 12) = v114;
        }

        return result;
      case 3LL:
        return (uint64_t)sub_DAA0((uint64_t *)v8, (uint64_t *)(v8 + 12), (uint64_t *)(a2 - 12));
      case 4LL:
        return (uint64_t)sub_DE4C(v8, v8 + 12, v8 + 24, a2 - 12);
      case 5LL:
        unsigned int v46 = (uint64_t *)(v8 + 12);
        unsigned int v47 = (uint64_t *)(v8 + 24);
        BOOL v48 = (uint64_t *)(v8 + 36);
        uint64_t result = (uint64_t)sub_DE4C(v8, v8 + 12, v8 + 24, v8 + 36);
        if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(v8 + 38))
        {
          uint64_t v49 = *v48;
          int v50 = *(_DWORD *)(v8 + 44);
          int v51 = *(_DWORD *)(a2 - 4);
          uint64_t *v48 = *(void *)(a2 - 12);
          *(_DWORD *)(v8 + 44) = v51;
          *(_DWORD *)(a2 - 4) = v50;
          *(void *)(a2 - 12) = v49;
          if (*(unsigned __int8 *)(v8 + 38) < *(unsigned __int8 *)(v8 + 26))
          {
            int v52 = *(_DWORD *)(v8 + 32);
            uint64_t v53 = *v47;
            *unsigned int v47 = *v48;
            *(_DWORD *)(v8 + 32) = *(_DWORD *)(v8 + 44);
            uint64_t *v48 = v53;
            *(_DWORD *)(v8 + 44) = v52;
            if (*(unsigned __int8 *)(v8 + 26) < *(unsigned __int8 *)(v8 + 14))
            {
              int v54 = *(_DWORD *)(v8 + 20);
              uint64_t v55 = *v46;
              uint64_t *v46 = *v47;
              *(_DWORD *)(v8 + 20) = *(_DWORD *)(v8 + 32);
              *unsigned int v47 = v55;
              *(_DWORD *)(v8 + 32) = v54;
              if (*(unsigned __int8 *)(v8 + 14) < *(unsigned __int8 *)(v8 + 2))
              {
                int v124 = *(_DWORD *)(v8 + 8);
                uint64_t v115 = *(void *)v8;
                *(void *)unint64_t v8 = *v46;
                *(_DWORD *)(v8 + 8) = *(_DWORD *)(v8 + 20);
                uint64_t *v46 = v115;
                *(_DWORD *)(v8 + 20) = v124;
              }
            }
          }
        }

        return result;
      default:
        if (v9 <= 287)
        {
          int v56 = (_WORD *)(v8 + 12);
          BOOL v58 = v8 == a2 || v56 == (_WORD *)a2;
          if ((a4 & 1) != 0)
          {
            if (!v58)
            {
              uint64_t v59 = 0LL;
              uint64_t v60 = (_WORD *)v8;
              do
              {
                BOOL v61 = v56;
                unsigned int v62 = *((unsigned __int8 *)v60 + 14);
                if (v62 < *((unsigned __int8 *)v60 + 2))
                {
                  __int16 v63 = *v61;
                  uint64_t v116 = *(void *)((char *)v60 + 15);
                  char v125 = *((_BYTE *)v60 + 23);
                  uint64_t v64 = v59;
                  while (1)
                  {
                    uint64_t v65 = v8 + v64;
                    *(void *)(v65 + 12) = *(void *)(v8 + v64);
                    *(_DWORD *)(v65 + 20) = *(_DWORD *)(v8 + v64 + 8);
                    if (!v64) {
                      break;
                    }
                    v64 -= 12LL;
                    if (v62 >= *(unsigned __int8 *)(v65 - 10))
                    {
                      uint64_t v66 = v8 + v64 + 12;
                      goto LABEL_79;
                    }
                  }

                  uint64_t v66 = v8;
LABEL_79:
                  *(_WORD *)uint64_t v66 = v63;
                  *(_BYTE *)(v66 + 2) = v62;
                  *(_BYTE *)(v66 + 11) = v125;
                  *(void *)(v66 + 3) = v116;
                }

                int v56 = v61 + 6;
                v59 += 12LL;
                uint64_t v60 = v61;
              }

              while (v61 + 6 != (_WORD *)a2);
            }
          }

          else if (!v58)
          {
            do
            {
              __int128 v99 = v56;
              unsigned int v100 = *(unsigned __int8 *)(v7 + 14);
              if (v100 < *(unsigned __int8 *)(v7 + 2))
              {
                __int16 v101 = *v56;
                uint64_t v119 = *(void *)(v7 + 15);
                char v128 = *(_BYTE *)(v7 + 23);
                __int128 v102 = v99;
                do
                {
                  __int128 v103 = v102;
                  uint64_t v104 = *(void *)(v102 - 6);
                  v102 -= 6;
                  *(void *)__int128 v103 = v104;
                  *((_DWORD *)v103 + 2) = *((_DWORD *)v103 - 1);
                }

                while (v100 < *((unsigned __int8 *)v103 - 22));
                _WORD *v102 = v101;
                *((_BYTE *)v102 + 2) = v100;
                *((_BYTE *)v102 + 11) = v128;
                *(void *)((char *)v102 + 3) = v119;
              }

              int v56 = v99 + 6;
              uint64_t v7 = (uint64_t)v99;
            }

            while (v99 + 6 != (_WORD *)a2);
          }

          return result;
        }

        if (!a3)
        {
          if (v8 != a2)
          {
            int64_t v67 = (unint64_t)(v10 - 2) >> 1;
            int64_t v68 = v67;
            do
            {
              int64_t v69 = v68;
              if (v67 >= v68)
              {
                uint64_t v70 = (2 * v68) | 1;
                unint64_t v71 = v8 + 12 * v70;
                if (2 * v69 + 2 < v10)
                {
                  unsigned int v72 = *(unsigned __int8 *)(v8 + 12 * v70 + 2);
                  unsigned int v73 = *(unsigned __int8 *)(v71 + 14);
                  v71 += 12LL * (v72 < v73);
                  if (v72 < v73) {
                    uint64_t v70 = 2 * v69 + 2;
                  }
                }

                unsigned int v74 = *(unsigned __int8 *)(v8 + 12 * v69 + 2);
                if (*(unsigned __int8 *)(v71 + 2) >= v74)
                {
                  uint64_t v75 = v8 + 12 * v69;
                  __int16 v76 = *(_WORD *)v75;
                  char v126 = *(_BYTE *)(v75 + 11);
                  uint64_t v117 = *(void *)(v75 + 3);
                  do
                  {
                    uint64_t result = v75;
                    uint64_t v75 = v71;
                    uint64_t v77 = *(void *)v71;
                    *(_DWORD *)(result + 8) = *(_DWORD *)(v75 + 8);
                    *(void *)uint64_t result = v77;
                    if (v67 < v70) {
                      break;
                    }
                    uint64_t result = (2 * v70) | 1;
                    unint64_t v71 = v8 + 12 * result;
                    uint64_t v78 = 2 * v70 + 2;
                    if (v78 < v10)
                    {
                      unsigned int v79 = *(unsigned __int8 *)(v8 + 12 * result + 2);
                      unsigned int v80 = *(unsigned __int8 *)(v71 + 14);
                      v71 += 12LL * (v79 < v80);
                      if (v79 < v80) {
                        uint64_t result = v78;
                      }
                    }

                    uint64_t v70 = result;
                  }

                  while (*(unsigned __int8 *)(v71 + 2) >= v74);
                  *(_WORD *)uint64_t v75 = v76;
                  *(_BYTE *)(v75 + 2) = v74;
                  *(_BYTE *)(v75 + 11) = v126;
                  *(void *)(v75 + 3) = v117;
                }
              }

              int64_t v68 = v69 - 1;
            }

            while (v69);
            int64_t v81 = v9 / 0xCuLL;
            do
            {
              uint64_t v82 = 0LL;
              int v127 = *(_DWORD *)(v8 + 8);
              uint64_t v118 = *(void *)v8;
              unint64_t v83 = v8;
              do
              {
                uint64_t v84 = v82 + 1;
                unint64_t v85 = v83 + 12 * (v82 + 1);
                uint64_t v86 = (2 * v82) | 1;
                uint64_t v87 = 2 * v82 + 2;
                if (v87 < v81)
                {
                  unsigned int v88 = *(unsigned __int8 *)(v83 + 12 * v84 + 2);
                  unsigned int v89 = *(unsigned __int8 *)(v85 + 14);
                  v85 += 12LL * (v88 < v89);
                  if (v88 < v89) {
                    uint64_t v86 = v87;
                  }
                }

                uint64_t v90 = *(void *)v85;
                *(_DWORD *)(v83 + 8) = *(_DWORD *)(v85 + 8);
                *(void *)unint64_t v83 = v90;
                unint64_t v83 = v85;
                uint64_t v82 = v86;
              }

              while (v86 <= (uint64_t)((unint64_t)(v81 - 2) >> 1));
              a2 -= 12LL;
              if (v85 == a2)
              {
                *(_DWORD *)(v85 + 8) = v127;
                *(void *)unint64_t v85 = v118;
              }

              else
              {
                uint64_t v91 = *(void *)a2;
                *(_DWORD *)(v85 + 8) = *(_DWORD *)(a2 + 8);
                *(void *)unint64_t v85 = v91;
                *(_DWORD *)(a2 + 8) = v127;
                *(void *)a2 = v118;
                uint64_t v92 = v85 - v8 + 12;
                if (v92 >= 13)
                {
                  unint64_t v93 = (v92 / 0xCuLL - 2) >> 1;
                  unsigned int v94 = *(unsigned __int8 *)(v85 + 2);
                  if (*(unsigned __int8 *)(v8 + 12 * v93 + 2) < v94)
                  {
                    __int16 v95 = *(_WORD *)v85;
                    char v110 = *(_BYTE *)(v85 + 11);
                    uint64_t v107 = *(void *)(v85 + 3);
                    do
                    {
                      unint64_t v96 = v85;
                      unint64_t v85 = v8 + 12 * v93;
                      uint64_t v97 = *(void *)v85;
                      *(_DWORD *)(v96 + 8) = *(_DWORD *)(v85 + 8);
                      *(void *)unint64_t v96 = v97;
                      if (!v93) {
                        break;
                      }
                      unint64_t v93 = (v93 - 1) >> 1;
                    }

                    while (*(unsigned __int8 *)(v8 + 12 * v93 + 2) < v94);
                    *(_WORD *)unint64_t v85 = v95;
                    *(_BYTE *)(v85 + 2) = v94;
                    *(_BYTE *)(v85 + 11) = v110;
                    *(void *)(v85 + 3) = v107;
                  }
                }
              }
            }

            while (v81-- > 2);
          }

          return result;
        }

        unint64_t v11 = (unint64_t)v10 >> 1;
        unint64_t v12 = v8 + 12 * ((unint64_t)v10 >> 1);
        if ((unint64_t)v9 < 0x601)
        {
          uint64_t result = (uint64_t)sub_DAA0((uint64_t *)(v7 + 12 * v11), (uint64_t *)v7, (uint64_t *)(a2 - 12));
        }

        else
        {
          sub_DAA0((uint64_t *)v7, (uint64_t *)(v7 + 12 * v11), (uint64_t *)(a2 - 12));
          uint64_t v13 = 3 * v11;
          int v14 = (uint64_t *)(v7 + 12 * v11 - 12);
          sub_DAA0((uint64_t *)(v7 + 12), v14, (uint64_t *)(a2 - 24));
          unsigned int v15 = (uint64_t *)(v7 + 12 + 4 * v13);
          sub_DAA0((uint64_t *)(v7 + 24), v15, (uint64_t *)(a2 - 36));
          uint64_t result = (uint64_t)sub_DAA0(v14, (uint64_t *)v12, v15);
          int v120 = *(_DWORD *)(v7 + 8);
          uint64_t v111 = *(void *)v7;
          int v16 = *(_DWORD *)(v12 + 8);
          *(void *)uint64_t v7 = *(void *)v12;
          *(_DWORD *)(v7 + 8) = v16;
          *(_DWORD *)(v12 + 8) = v120;
          *(void *)unint64_t v12 = v111;
        }

        --a3;
        if ((a4 & 1) == 0)
        {
          unsigned int v17 = *(unsigned __int8 *)(v7 + 2);
          __int16 v33 = *(_WORD *)v7;
          uint64_t v106 = *(void *)(v7 + 3);
          char v109 = *(_BYTE *)(v7 + 11);
          if (v17 >= *(unsigned __int8 *)(a2 - 10))
          {
            unint64_t v36 = v7 + 12;
            do
            {
              unint64_t v8 = v36;
              if (v36 >= a2) {
                break;
              }
              unsigned int v37 = *(unsigned __int8 *)(v36 + 2);
              v36 += 12LL;
            }

            while (v17 >= v37);
          }

          else
          {
            uint64_t v34 = v7;
            do
            {
              unint64_t v8 = v34 + 12;
              unsigned int v35 = *(unsigned __int8 *)(v34 + 14);
              v34 += 12LL;
            }

            while (v17 >= v35);
          }

          unint64_t v38 = a2;
          if (v8 < a2)
          {
            unint64_t v39 = a2;
            do
            {
              unint64_t v38 = v39 - 12;
              unsigned int v40 = *(unsigned __int8 *)(v39 - 10);
              v39 -= 12LL;
            }

            while (v17 < v40);
          }

          while (v8 < v38)
          {
            int v122 = *(_DWORD *)(v8 + 8);
            uint64_t v113 = *(void *)v8;
            uint64_t v41 = *(void *)v38;
            *(_DWORD *)(v8 + 8) = *(_DWORD *)(v38 + 8);
            *(void *)unint64_t v8 = v41;
            *(_DWORD *)(v38 + 8) = v122;
            *(void *)unint64_t v38 = v113;
            do
            {
              unsigned int v42 = *(unsigned __int8 *)(v8 + 14);
              v8 += 12LL;
            }

            while (v17 >= v42);
            do
            {
              unsigned int v43 = *(unsigned __int8 *)(v38 - 10);
              v38 -= 12LL;
            }

            while (v17 < v43);
          }

          if (v8 - 12 != v7)
          {
            uint64_t v44 = *(void *)(v8 - 12);
            *(_DWORD *)(v7 + 8) = *(_DWORD *)(v8 - 4);
            *(void *)uint64_t v7 = v44;
          }

          a4 = 0;
          *(_WORD *)(v8 - 12) = v33;
          *(_BYTE *)(v8 - 10) = v17;
          *(_BYTE *)(v8 - 1) = v109;
          *(void *)(v8 - 9) = v106;
          continue;
        }

        unsigned int v17 = *(unsigned __int8 *)(v7 + 2);
LABEL_12:
        uint64_t v18 = 0LL;
        __int16 v19 = *(_WORD *)v7;
        uint64_t v105 = *(void *)(v7 + 3);
        char v108 = *(_BYTE *)(v7 + 11);
        do
        {
          unsigned int v20 = *(unsigned __int8 *)(v7 + v18 + 14);
          v18 += 12LL;
        }

        while (v20 < v17);
        unint64_t v21 = v7 + v18;
        unint64_t v22 = a2;
        if (v18 == 12)
        {
          unint64_t v25 = a2;
          while (v21 < v25)
          {
            unint64_t v23 = v25 - 12;
            unsigned int v26 = *(unsigned __int8 *)(v25 - 10);
            v25 -= 12LL;
            if (v26 < v17) {
              goto LABEL_22;
            }
          }

          unint64_t v23 = v25;
        }

        else
        {
          do
          {
            unint64_t v23 = v22 - 12;
            unsigned int v24 = *(unsigned __int8 *)(v22 - 10);
            v22 -= 12LL;
          }

          while (v24 >= v17);
        }

LABEL_22:
        unint64_t v8 = v21;
        if (v21 < v23)
        {
          unint64_t v27 = v23;
          do
          {
            int v121 = *(_DWORD *)(v8 + 8);
            uint64_t v112 = *(void *)v8;
            uint64_t v28 = *(void *)v27;
            *(_DWORD *)(v8 + 8) = *(_DWORD *)(v27 + 8);
            *(void *)unint64_t v8 = v28;
            *(_DWORD *)(v27 + 8) = v121;
            *(void *)unint64_t v27 = v112;
            do
            {
              unsigned int v29 = *(unsigned __int8 *)(v8 + 14);
              v8 += 12LL;
            }

            while (v29 < v17);
            do
            {
              unsigned int v30 = *(unsigned __int8 *)(v27 - 10);
              v27 -= 12LL;
            }

            while (v30 >= v17);
          }

          while (v8 < v27);
        }

        if (v8 - 12 != v7)
        {
          uint64_t v31 = *(void *)(v8 - 12);
          *(_DWORD *)(v7 + 8) = *(_DWORD *)(v8 - 4);
          *(void *)uint64_t v7 = v31;
        }

        *(_WORD *)(v8 - 12) = v19;
        *(_BYTE *)(v8 - 10) = v17;
        *(_BYTE *)(v8 - 1) = v108;
        *(void *)(v8 - 9) = v105;
        if (v21 < v23)
        {
LABEL_33:
          uint64_t result = sub_D0F4(v7, v8 - 12, a3, a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v32 = sub_DB90(v7, v8 - 12);
        uint64_t result = sub_DB90(v8, a2);
        if (!(_DWORD)result)
        {
          if (v32) {
            continue;
          }
          goto LABEL_33;
        }

        a2 = v8 - 12;
        if (!v32) {
          goto LABEL_2;
        }
        return result;
    }
  }

        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v24 = v23 << 9;
        if (v23 >= 0x41)
        {
          unint64_t v25 = 8 * (v23 & 0x3F);
          if (v25)
          {
            do
            {
              v24 |= v25;
              int v14 = v25 > 0x3F;
              v25 >>= 6;
            }

            while (v14);
          }
        }

        unsigned int v26 = v24 << 16;
        goto LABEL_72;
      case 0xAu:
        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v26 = v4 << 25;
        if (v23 >= 0x41)
        {
          unint64_t v27 = (v4 & 0x3F) << 19;
          if (v27)
          {
            do
            {
              v26 |= v27;
              int v14 = v27 > 0x3F;
              v27 >>= 6;
            }

            while (v14);
          }
        }

        goto LABEL_72;
      case 0xBu:
        uint64_t v28 = a1 + (v7 << 7) + 33;
        unsigned int v29 = v21 & 0xF;
        if (((v4 >> 8) & 0x7F) > 0x25)
        {
          switch(v22)
          {
            case 'b':
              unint64_t v38 = v28 + 8 * v29;
              unint64_t v39 = 2;
              goto LABEL_65;
            case 'c':
              BOOL v48 = v28 + 8 * v29;
              uint64_t v49 = 2;
              goto LABEL_67;
            case 'd':
              unint64_t v38 = v28 + 8 * v29;
              unint64_t v39 = 1;
LABEL_65:
              *(_BYTE *)(v38 + 1) = v39;
              *(_BYTE *)(v38 + 5) = v23;
              break;
            case 'e':
              BOOL v48 = v28 + 8 * v29;
              uint64_t v49 = 1;
LABEL_67:
              *(_BYTE *)(v48 + 1) = v49;
              *(_BYTE *)(v48 + 4) = v23;
              break;
            default:
              if (v22 != 38) {
                goto LABEL_69;
              }
              unsigned int v40 = v4 & 0x7F;
              uint64_t v41 = v4 & 0x7F;
              goto LABEL_54;
          }

        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v24 = v23 << 9;
        if (v23 >= 0x41)
        {
          unint64_t v25 = 8 * (v23 & 0x3F);
          if (v25)
          {
            do
            {
              v24 |= v25;
              int v14 = v25 > 0x3F;
              v25 >>= 6;
            }

            while (v14);
          }
        }

        unsigned int v26 = v24 << 16;
        goto LABEL_72;
      case 0xAu:
        HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
        unsigned int v26 = v4 << 25;
        if (v23 >= 0x41)
        {
          unint64_t v27 = (v4 & 0x3F) << 19;
          if (v27)
          {
            do
            {
              v26 |= v27;
              int v14 = v27 > 0x3F;
              v27 >>= 6;
            }

            while (v14);
          }
        }

        goto LABEL_72;
      case 0xBu:
        uint64_t v28 = a1 + (v7 << 7) + 33;
        unsigned int v29 = v21 & 0xF;
        if (((v4 >> 8) & 0x7F) > 0x25)
        {
          switch(v22)
          {
            case 'b':
              unint64_t v38 = v28 + 8 * v29;
              unint64_t v39 = 2;
              goto LABEL_65;
            case 'c':
              BOOL v48 = v28 + 8 * v29;
              uint64_t v49 = 2;
              goto LABEL_67;
            case 'd':
              unint64_t v38 = v28 + 8 * v29;
              unint64_t v39 = 1;
LABEL_65:
              *(_BYTE *)(v38 + 1) = v39;
              *(_BYTE *)(v38 + 5) = v23;
              break;
            case 'e':
              BOOL v48 = v28 + 8 * v29;
              uint64_t v49 = 1;
LABEL_67:
              *(_BYTE *)(v48 + 1) = v49;
              *(_BYTE *)(v48 + 4) = v23;
              break;
            default:
              if (v22 != 38) {
                goto LABEL_69;
              }
              unsigned int v40 = v4 & 0x7F;
              uint64_t v41 = v4 & 0x7F;
              goto LABEL_54;
          }

uint64_t *sub_DAA0(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  unsigned int v3 = *((unsigned __int8 *)a2 + 2);
  unsigned int v4 = *((unsigned __int8 *)a3 + 2);
  if (v3 >= *((unsigned __int8 *)result + 2))
  {
    if (v4 < v3)
    {
      int v8 = *((_DWORD *)a2 + 2);
      uint64_t v9 = *a2;
      int v10 = *((_DWORD *)a3 + 2);
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = v10;
      *a3 = v9;
      *((_DWORD *)a3 + 2) = v8;
      if (*((unsigned __int8 *)a2 + 2) < *((unsigned __int8 *)result + 2))
      {
        int v11 = *((_DWORD *)result + 2);
        uint64_t v12 = *result;
        int v13 = *((_DWORD *)a2 + 2);
        *uint64_t result = *a2;
        *((_DWORD *)result + 2) = v13;
        *a2 = v12;
        *((_DWORD *)a2 + 2) = v11;
      }
    }
  }

  else
  {
    if (v4 >= v3)
    {
      int v14 = *((_DWORD *)result + 2);
      uint64_t v15 = *result;
      int v16 = *((_DWORD *)a2 + 2);
      *uint64_t result = *a2;
      *((_DWORD *)result + 2) = v16;
      *a2 = v15;
      *((_DWORD *)a2 + 2) = v14;
      int v5 = *((_DWORD *)a2 + 2);
      uint64_t v6 = *a2;
      int v17 = *((_DWORD *)a3 + 2);
      *a2 = *a3;
      *((_DWORD *)a2 + 2) = v17;
    }

    else
    {
      int v5 = *((_DWORD *)result + 2);
      uint64_t v6 = *result;
      int v7 = *((_DWORD *)a3 + 2);
      *uint64_t result = *a3;
      *((_DWORD *)result + 2) = v7;
    }

    *a3 = v6;
    *((_DWORD *)a3 + 2) = v5;
  }

  return result;
}

BOOL sub_DB90(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 2);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(a1 + 2))
      {
        int v6 = *(_DWORD *)(a1 + 8);
        uint64_t v7 = *(void *)a1;
        int v8 = *(_DWORD *)(a2 - 4);
        *(void *)a1 = *(void *)(a2 - 12);
        *(_DWORD *)(a1 + 8) = v8;
        *(void *)(a2 - 12) = v7;
        *(_DWORD *)(a2 - 4) = v6;
      }

      return result;
    case 3uLL:
      sub_DAA0((uint64_t *)a1, (uint64_t *)(a1 + 12), (uint64_t *)(a2 - 12));
      return 1LL;
    case 4uLL:
      sub_DE4C(a1, a1 + 12, a1 + 24, a2 - 12);
      return 1LL;
    case 5uLL:
      uint64_t v18 = (uint64_t *)(a1 + 12);
      __int16 v19 = (uint64_t *)(a1 + 24);
      unsigned int v20 = (uint64_t *)(a1 + 36);
      sub_DE4C(a1, a1 + 12, a1 + 24, a1 + 36);
      if (*(unsigned __int8 *)(a2 - 10) < *(unsigned __int8 *)(a1 + 38))
      {
        int v21 = *(_DWORD *)(a1 + 44);
        uint64_t v22 = *v20;
        int v23 = *(_DWORD *)(a2 - 4);
        uint64_t *v20 = *(void *)(a2 - 12);
        *(_DWORD *)(a1 + 44) = v23;
        *(void *)(a2 - 12) = v22;
        *(_DWORD *)(a2 - 4) = v21;
        if (*(unsigned __int8 *)(a1 + 38) < *(unsigned __int8 *)(a1 + 26))
        {
          int v24 = *(_DWORD *)(a1 + 32);
          uint64_t v25 = *v19;
          uint64_t *v19 = *v20;
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 44);
          uint64_t *v20 = v25;
          *(_DWORD *)(a1 + 44) = v24;
          if (*(unsigned __int8 *)(a1 + 26) < *(unsigned __int8 *)(a1 + 14))
          {
            int v26 = *(_DWORD *)(a1 + 20);
            uint64_t v27 = *v18;
            uint64_t *v18 = *v19;
            *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 32);
            uint64_t *v19 = v27;
            *(_DWORD *)(a1 + 32) = v26;
            if (*(unsigned __int8 *)(a1 + 14) < *(unsigned __int8 *)(a1 + 2))
            {
              int v28 = *(_DWORD *)(a1 + 8);
              uint64_t v29 = *(void *)a1;
              *(void *)a1 = *v18;
              *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 20);
              uint64_t *v18 = v29;
              *(_DWORD *)(a1 + 20) = v28;
            }
          }
        }
      }

      return 1LL;
    default:
      uint64_t v9 = a1 + 24;
      sub_DAA0((uint64_t *)a1, (uint64_t *)(a1 + 12), (uint64_t *)(a1 + 24));
      uint64_t v10 = a1 + 36;
      if (a1 + 36 == a2) {
        return 1LL;
      }
      uint64_t v11 = 0LL;
      int v12 = 0;
      break;
  }

  while (1)
  {
    unsigned int v13 = *(unsigned __int8 *)(v10 + 2);
    if (v13 < *(unsigned __int8 *)(v9 + 2))
    {
      __int16 v14 = *(_WORD *)v10;
      uint64_t v30 = *(void *)(v10 + 3);
      char v31 = *(_BYTE *)(v10 + 11);
      uint64_t v15 = v11;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(void *)(v16 + 36) = *(void *)(a1 + v15 + 24);
        *(_DWORD *)(v16 + 44) = *(_DWORD *)(a1 + v15 + 32);
        if (v15 == -24) {
          break;
        }
        v15 -= 12LL;
        if (v13 >= *(unsigned __int8 *)(v16 + 14))
        {
          uint64_t v17 = a1 + v15 + 36;
          goto LABEL_12;
        }
      }

      uint64_t v17 = a1;
LABEL_12:
      *(_WORD *)uint64_t v17 = v14;
      *(_BYTE *)(v17 + 2) = v13;
      *(void *)(v17 + 3) = v30;
      *(_BYTE *)(v17 + 11) = v31;
      if (++v12 == 8) {
        return v10 + 12 == a2;
      }
    }

    uint64_t v9 = v10;
    v11 += 12LL;
    v10 += 12LL;
    if (v10 == a2) {
      return 1LL;
    }
  }

uint64_t *sub_DE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL result = sub_DAA0((uint64_t *)a1, (uint64_t *)a2, (uint64_t *)a3);
  if (*(unsigned __int8 *)(a4 + 2) < *(unsigned __int8 *)(a3 + 2))
  {
    int v9 = *(_DWORD *)(a3 + 8);
    uint64_t v10 = *(void *)a3;
    int v11 = *(_DWORD *)(a4 + 8);
    *(void *)a3 = *(void *)a4;
    *(_DWORD *)(a3 + 8) = v11;
    *(void *)a4 = v10;
    *(_DWORD *)(a4 + 8) = v9;
    if (*(unsigned __int8 *)(a3 + 2) < *(unsigned __int8 *)(a2 + 2))
    {
      int v12 = *(_DWORD *)(a2 + 8);
      uint64_t v13 = *(void *)a2;
      int v14 = *(_DWORD *)(a3 + 8);
      *(void *)a2 = *(void *)a3;
      *(_DWORD *)(a2 + 8) = v14;
      *(void *)a3 = v13;
      *(_DWORD *)(a3 + 8) = v12;
      if (*(unsigned __int8 *)(a2 + 2) < *(unsigned __int8 *)(a1 + 2))
      {
        int v15 = *(_DWORD *)(a1 + 8);
        uint64_t v16 = *(void *)a1;
        int v17 = *(_DWORD *)(a2 + 8);
        *(void *)a1 = *(void *)a2;
        *(_DWORD *)(a1 + 8) = v17;
        *(void *)a2 = v16;
        *(_DWORD *)(a2 + 8) = v15;
      }
    }
  }

  return result;
}

uint64_t sub_DF18(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  unint64_t v4 = *(char **)(result + 8);
  uint64_t v5 = v4 - a4;
  int v6 = (uint64_t *)(a2 + v4 - a4);
  uint64_t v7 = v4;
  while ((unint64_t)v6 < a3)
  {
    uint64_t v8 = *v6++;
    *(void *)uint64_t v7 = v8;
    v7 += 8;
  }

  *(void *)(result + 8) = v7;
  if (v4 != a4)
  {
    int v9 = v4 - 8;
    uint64_t v10 = 8 * (v5 >> 3);
    do
    {
      *(void *)int v9 = *(void *)(a2 - 8 + v10);
      v9 -= 8;
      v10 -= 8LL;
    }

    while (v10);
  }

  return result;
}

double sub_DF6C(uint64_t a1, double *a2)
{
  unint64_t v4 = *(void **)(a1 + 16);
  if (v4 == *(void **)(a1 + 24))
  {
    uint64_t v5 = *(void **)(a1 + 8);
    uint64_t v6 = (uint64_t)v5 - *(void *)a1;
    if ((unint64_t)v5 <= *(void *)a1)
    {
      uint64_t v12 = (uint64_t)v4 - *(void *)a1;
      BOOL v11 = v12 == 0;
      uint64_t v13 = v12 >> 2;
      if (v11) {
        unint64_t v14 = 1LL;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 32);
      *(void *)&__int128 v23 = sub_E18C(v15, v14);
      *((void *)&v23 + 1) = v23 + 8 * (v14 >> 2);
      *(void *)&__int128 v24 = *((void *)&v23 + 1);
      *((void *)&v24 + 1) = v23 + 8 * v16;
      sub_E1C0((uint64_t)&v23, *(uint64_t **)(a1 + 8), (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3);
      int v17 = *(void **)a1;
      uint64_t v18 = *(void *)(a1 + 8);
      __int128 v20 = v23;
      __int128 v19 = v24;
      *(void *)&__int128 v23 = *(void *)a1;
      *((void *)&v23 + 1) = v18;
      __int128 v21 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)a1 = v20;
      *(_OWORD *)(a1 + 16) = v19;
      __int128 v24 = v21;
      if ((void)v21 != v18) {
        *(void *)&__int128 v24 = v21 + ((v18 - v21 + 7) & 0xFFFFFFFFFFFFFFF8LL);
      }
      if (v17)
      {
        operator delete(v17);
        unint64_t v4 = *(void **)(a1 + 16);
      }

      else
      {
        unint64_t v4 = (void *)v19;
      }
    }

    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (!v8) {
        uint64_t v9 = v7 + 1;
      }
      if (v5 == v4)
      {
        uint64_t v10 = &v5[-(v9 >> 1)];
      }

      else
      {
        do
        {
          v5[-(v9 >> 1)] = *v5;
          ++v5;
        }

        while (v5 != v4);
        unint64_t v4 = *(void **)(a1 + 8);
        uint64_t v10 = &v5[-(v9 >> 1)];
      }

      *(void *)(a1 + 8) = &v4[-(v9 >> 1)];
      *(void *)(a1 + 16) = v10;
      unint64_t v4 = v10;
    }
  }

  double result = *a2;
  *unint64_t v4 = *(void *)a2;
  *(void *)(a1 + 16) = v4 + 1;
  return result;
}

void sub_E0A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_E0DC(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  sub_E1EC(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(void *)a1, *(void *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_E218(v7, a3, *(uint64_t **)(a1 + 8), (void *)a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *sub_E18C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2DBC();
  }
  return operator new(8 * a2);
}

uint64_t sub_E1C0(uint64_t result, uint64_t *a2, uint64_t a3)
{
  unsigned int v3 = *(void **)(result + 16);
  if (a3)
  {
    uint64_t v4 = 8 * a3;
    uint64_t v5 = &v3[a3];
    do
    {
      uint64_t v6 = *a2++;
      *v3++ = v6;
      v4 -= 8LL;
    }

    while (v4);
    unsigned int v3 = v5;
  }

  *(void *)(result + 16) = v3;
  return result;
}

double sub_E1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  if (a3 != a5)
  {
    uint64_t v8 = (double *)(a7 - 8);
    do
    {
      double v9 = *(double *)(a3 - 8);
      a3 -= 8LL;
      double result = v9;
      *v8-- = v9;
      v7 -= 8LL;
    }

    while (a3 != a5);
  }

  return result;
}

void *sub_E218(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  double result = a4;
  while (a2 != a3)
  {
    uint64_t v5 = *a2++;
    *result++ = v5;
  }

  return result;
}

void sub_E234()
{
}

void sub_E248(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_E298(exception, a1);
}

void sub_E284(_Unwind_Exception *a1)
{
}

std::logic_error *sub_E298(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_E2BC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 3;
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 2 > v5) {
    unint64_t v5 = v8 >> 2;
  }
  else {
    unint64_t v9 = v5;
  }
  __int128 v19 = a1 + 2;
  uint64_t v10 = (char *)sub_E18C(v7, v9);
  uint64_t v11 = &v10[8 * v4];
  __p = v10;
  uint64_t v16 = v11;
  uint64_t v18 = &v10[8 * v12];
  *(void *)uint64_t v11 = *a2;
  int v17 = v11 + 8;
  sub_E3D0(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    v17 += (v16 - v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_E398( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_E3D0(uint64_t *a1, void *a2)
{
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *sub_E444(void *a1)
{
  *a1 = off_24880;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_E488(void *a1)
{
  uint64_t v1 = sub_E444(a1);
  operator delete(v1);
}

void sub_E49C(void *a1)
{
  uint64_t v1 = sub_E444(a1);
  operator delete(v1);
}

uint64_t sub_E4B0(unsigned __int8 *a1)
{
  uint64_t result = sub_E528(a1);
  if ((_DWORD)result)
  {
    unsigned int v3 = *a1;
    if (v3 >= 0x10)
    {
      uint64_t result = v3 >> 4;
      if ((result - 8) >= 7)
      {
        if ((_DWORD)result == 15 && v3 > 0xF0) {
          return byte_1FB83[(char)(v3 + 15)];
        }
        else {
          return 0LL;
        }
      }
    }

    else
    {
      return 4LL;
    }
  }

  return result;
}

uint64_t sub_E528(unsigned __int8 *a1)
{
  int v1 = *((unsigned __int16 *)a1 + 2);
  if (!*((_WORD *)a1 + 2)) {
    return 0LL;
  }
  unsigned int v3 = *a1;
  if ((v3 >> 4) - 12 < 2) {
    return (__int16)v1 == 2;
  }
  if (v3 >> 4 != 15) {
    return 0LL;
  }
  if (v3 == 241) {
    return (__int16)v1 == 2;
  }
  if (v3 != 246)
  {
    if (v3 != 243) {
      return 0LL;
    }
    return (__int16)v1 == 2;
  }

  return (__int16)v1 == 1;
}

uint64_t sub_E5A4( MIDIProtocolID a1, MIDITimeStamp a2, char *a3, uint64_t a4, MIDIEventList *a5, unint64_t a6)
{
  uint64_t result = 0LL;
  ByteCount v8 = a6 - (void)a5;
  bzero(a5, a6 - (void)a5);
  unint64_t v14 = MIDIEventListInit(a5, a1);
  if (a4 < 1)
  {
    uint64_t v16 = a3;
    return (unint64_t)(v16 - a3) >> 2;
  }

  int64_t v15 = byte_1FB58[(unint64_t)*(unsigned int *)a3 >> 28];
  uint64_t v16 = a3;
  if (a4 < v15) {
    return (unint64_t)(v16 - a3) >> 2;
  }
  int v17 = v14;
  char v18 = 0;
  int v19 = -1;
  __int128 v20 = (const UInt32 *)a3;
  __int128 v21 = (unsigned int *)&a3[4 * a4];
  uint64_t v22 = (unsigned int *)&a3[4 * v15];
  while (1)
  {
    uint64_t v16 = (char *)v22;
    unsigned int v23 = *v20 >> 28;
    BOOL v24 = !v23 || v23 == 15;
    int v25 = v24 ? 255 : HIBYTE(*v20) & 0xF;
    if (v19 != -1 && v19 != v25) {
      break;
    }
    if (v23 >= 2)
    {
      if (v23 == 5 || v23 == 3)
      {
        char v18 = 1;
      }

      else
      {
        if ((v18 & 1) != 0) {
          return (unint64_t)((char *)v20 - a3) >> 2;
        }
        char v18 = 0;
      }
    }

    uint64_t v27 = MIDIEventListAdd(a5, v8, v17, a2, v15, v20);
    if (!v27) {
      return (unint64_t)((char *)v20 - a3) >> 2;
    }
    if (v16 < (char *)v21)
    {
      int v17 = v27;
      int64_t v15 = byte_1FB58[(unint64_t)*(unsigned int *)v16 >> 28];
      uint64_t v22 = (unsigned int *)&v16[4 * v15];
      __int128 v20 = (const UInt32 *)v16;
      int v19 = v25;
      if (v22 <= v21) {
        continue;
      }
    }

    return (unint64_t)(v16 - a3) >> 2;
  }

  return (unint64_t)((char *)v20 - a3) >> 2;
}

uint64_t sub_E740(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v1 == -1) {
    sub_E788();
  }
  uint64_t v4 = &v3;
  return ((uint64_t (*)(char **, uint64_t))off_248C8[v1])(&v4, a1);
}

void sub_E788()
{
  exception = __cxa_allocate_exception(8uLL);
}

uint64_t sub_E7C0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_E7C8(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

uint64_t sub_E7D0(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v2 != -1) {
    ((void (*)(char *, uint64_t))off_248D8[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 272) = -1;
  return a1;
}

void sub_E82C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v2;
    operator delete(v2);
  }

uint64_t sub_E840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    sub_E8BC((unsigned int *)a4, (unsigned int *)v5);
    uint64_t v7 = *(void *)(v5 + 280);
    *(void *)(a4 + 285) = *(void *)(v5 + 285);
    *(void *)(a4 + 280) = v7;
    a4 += 296LL;
    v5 += 296LL;
  }

  while (v5 != v6);
  return v6;
}

unsigned int *sub_E8BC(unsigned int *result, unsigned int *a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[68];
  uint64_t v4 = a2[68];
  if ((_DWORD)v3 == -1)
  {
    if ((_DWORD)v4 == -1) {
      return result;
    }
  }

  else if ((_DWORD)v4 == -1)
  {
    uint64_t result = (unsigned int *)((uint64_t (*)(char *, unsigned int *, unsigned int *))off_248D8[v3])( &v6,  result,  a2);
    v2[68] = -1;
    return result;
  }

  uint64_t v5 = result;
  return (unsigned int *)(*(&off_248E8 + v4))((int)&v5, result, a2);
}

_DWORD *sub_E948(_DWORD **a1, void *__dst, void *__src)
{
  uint64_t v3 = *a1;
  if (v3[68]) {
    return sub_E974(v3, __src);
  }
  else {
    return memcpy(__dst, __src, 0x10CuLL);
  }
}

void sub_E96C(uint64_t *a1, uint64_t a2, __n128 *a3)
{
}

_DWORD *sub_E974(_DWORD *__dst, void *__src)
{
  uint64_t v4 = __dst[68];
  if ((_DWORD)v4 != -1) {
    ((void (*)(char *, _DWORD *))off_248D8[v4])(&v6, __dst);
  }
  __dst[68] = -1;
  memcpy(__dst, __src, 0x10CuLL);
  __dst[68] = 0;
  return __dst;
}

void sub_E9E4(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (*(_DWORD *)(a1 + 272) == 1) {
    sub_EA04(a2, a3);
  }
  else {
    sub_EA54(a1, (uint64_t)a3);
  }
}

__n128 sub_EA04(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  return result;
}

uint64_t sub_EA54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v4 != -1) {
    ((void (*)(char *, uint64_t))off_248D8[v4])(&v6, a1);
  }
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(_DWORD *)(a1 + 272) = 1;
  return a1;
}

void *sub_EAD0(void *a1)
{
  *a1 = &off_24908;
  uint64_t v2 = a1 + 2;
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

void sub_EB2C(char *__p)
{
  *(void *)__p = &off_24908;
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

void *sub_EB88(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t v2 = &off_24908;
  v2[1] = v3;
  sub_2C18((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_EBCC(_Unwind_Exception *a1)
{
}

uint64_t sub_EBE0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &off_24908;
  a2[1] = v2;
  return sub_2C18((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_EC00(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  __n128 result = *(void **)(a1 + 40);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    __n128 result = v1;
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

void sub_EC34(char *__p)
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

BOOL sub_EC84(uint64_t a1, void *a2)
{
  return sub_ECF0(a1 + 8, a2);
}

uint64_t sub_EC8C(uint64_t a1, uint64_t a2)
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

BOOL sub_ECF0(uint64_t a1, void *a2)
{
  uint64_t v3 = (*(uint64_t (**)(void, char *))a1)(*a2, &v6);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    sub_3030();
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 48LL))(v4, &v7);
  return v6 != 0;
}

void *sub_ED68()
{
  __n128 result = operator new(0x10uLL);
  *__n128 result = &off_24950;
  return result;
}

void sub_ED8C(uint64_t a1, void *a2)
{
  *a2 = &off_24950;
}

void sub_EDA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_7CA8();
  if (v2)
  {
    sub_7CA8();
    uint64_t v3 = (os_log_s *)qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 654;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d ==========================================================================================================",  (uint8_t *)&v6,  0x12u);
    }

    sub_7CA8();
    uint64_t v4 = (os_log_s *)qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315650;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 655;
      __int16 v10 = 1024;
      int v11 = v2;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d NOTICE: USB MIDI Driver destructive tracing at level %d",  (uint8_t *)&v6,  0x18u);
    }

    sub_7CA8();
    uint64_t v5 = (os_log_s *)qword_28138;
    if (os_log_type_enabled((os_log_t)qword_28138, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "USBMIDIDriverBase.cpp";
      __int16 v8 = 1024;
      int v9 = 656;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d ==========================================================================================================",  (uint8_t *)&v6,  0x12u);
    }
  }

void sub_EF30(void *a1@<X1>, void *a2@<X2>, void *a3@<X3>, unsigned int *a4@<X4>, void *a5@<X8>)
{
  __int16 v10 = operator new(0x208uLL);
  sub_EFB0(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  sub_F054((uint64_t)a5, v10 + 11, (uint64_t)(v10 + 3));
}

void sub_EF9C(_Unwind_Exception *a1)
{
}

void *sub_EFB0(void *a1, void *a2, void *a3, void *a4, unsigned int *a5)
{
  a1[2] = 0LL;
  *a1 = off_24998;
  a1[1] = 0LL;
  sub_FABC(a1 + 3, *a2, *a3, *a4, *a5);
  return a1;
}

void sub_EFF8(_Unwind_Exception *a1)
{
}

void sub_F00C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24998;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_F020(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24998;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_F044(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void sub_F054(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }

      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        __int16 v10 = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }

uint64_t sub_F104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(v10 + 64) = 0LL;
  *(void *)(v10 + 72) = 0LL;
  *(void *)uint64_t v10 = off_249D0;
  *(void *)(v10 + 80) = a2;
  *(void *)(v10 + 88) = a3;
  *(void *)(v10 + 96) = a4;
  *(_OWORD *)(v10 + 104) = 0u;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(_OWORD *)(v10 + 168) = 0u;
  *(_DWORD *)(v10 + 183) = 0;
  *(_WORD *)(v10 + 187) = 1;
  *(_BYTE *)(v10 + 189) = 0;
  *(void *)(v10 + 200) = 0LL;
  *(void *)(v10 + 208) = 0LL;
  *(void *)(v10 + 192) = 0LL;
  *(_OWORD *)(v10 + 240) = 0u;
  unint64_t v11 = (void *)(v10 + 240);
  *(_DWORD *)(v10 + 216) = 1;
  *(_OWORD *)(v10 + 224) = 0u;
  uint64_t v12 = (void *)(v10 + 224);
  uint64_t v13 = (void *)(v10 + 256);
  *(_OWORD *)(v10 + 256) = 0u;
  *(_OWORD *)(v10 + 272) = 0u;
  *(_OWORD *)(v10 + 288) = 0u;
  *(_OWORD *)(v10 + 304) = 0u;
  *(_OWORD *)(v10 + 320) = 0u;
  *(void *)(v10 + 336) = 0LL;
  sub_40B0(v10 + 344, (uint64_t)"USBMIDIDevice.mWriteQueueMutex");
  *(void *)(a1 + 432) = a1 + 432;
  *(void *)(a1 + 440) = a1 + 432;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 478) = 0u;
  v60[0] = &off_24B58;
  BOOL v61 = v60;
  sub_B1D4(@"usbioresults", @"com.apple.coremidi", (uint64_t)sub_23D8, (uint64_t)v60);
  unint64_t v14 = v61;
  if (v61 == v60)
  {
    uint64_t v15 = 4LL;
    unint64_t v14 = v60;
  }

  else
  {
    if (!v61) {
      goto LABEL_6;
    }
    uint64_t v15 = 5LL;
  }

  (*(void (**)(void *))(*v14 + 8 * v15))(v14);
LABEL_6:
  v58[0] = &off_24BA0;
  v58[1] = a1;
  uint64_t v59 = v58;
  sub_F824(@"usbmidi2", @"com.apple.coremidi", (uint64_t)sub_24D0, (uint64_t)v58);
  uint64_t v16 = v59;
  if (v59 == v58)
  {
    uint64_t v17 = 4LL;
    uint64_t v16 = v58;
  }

  else
  {
    if (!v59) {
      goto LABEL_11;
    }
    uint64_t v17 = 5LL;
  }

  (*(void (**)(void *))(*v16 + 8 * v17))(v16);
LABEL_11:
  v56[0] = &off_24BE8;
  v56[1] = a1;
  int v57 = v56;
  sub_F824(@"umpoutput", @"com.apple.coremidi", (uint64_t)sub_24D0, (uint64_t)v56);
  char v18 = v57;
  if (v57 == v56)
  {
    uint64_t v19 = 4LL;
    char v18 = v56;
  }

  else
  {
    if (!v57) {
      goto LABEL_16;
    }
    uint64_t v19 = 5LL;
  }

  (*(void (**)(void *))(*v18 + 8 * v19))(v18);
LABEL_16:
  v54[0] = &off_24C30;
  v54[1] = a1;
  uint64_t v55 = v54;
  sub_F824(@"umpinput", @"com.apple.coremidi", (uint64_t)sub_24D0, (uint64_t)v54);
  __int128 v20 = v55;
  if (v55 == v54)
  {
    uint64_t v21 = 4LL;
    __int128 v20 = v54;
  }

  else
  {
    if (!v55) {
      goto LABEL_21;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void *))(*v20 + 8 * v21))(v20);
LABEL_21:
  sub_F9C8();
  uint64_t v22 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    unsigned int v23 = "(MIDI 2.0 enabled)";
    int v24 = *(unsigned __int8 *)(a1 + 490);
    int v25 = *(unsigned __int8 *)(a1 + 489);
    BOOL v26 = *(_BYTE *)(a1 + 187) == 0;
    *(_DWORD *)buf = 136316674;
    if (v26) {
      unsigned int v23 = "(Legacy MIDI 1.0 re-enabled by defaults)";
    }
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    uint64_t v27 = "UMP for Legacy Input";
    int v43 = 119;
    __int16 v44 = 2048;
    __int16 v42 = 1024;
    if (!v24) {
      uint64_t v27 = "Legacy Input Passthrough";
    }
    uint64_t v45 = a1;
    __int16 v46 = 1024;
    int v28 = "Legacy Output Passthrough";
    int v47 = a5;
    __int16 v48 = 2080;
    if (v25) {
      int v28 = "UMP for Legacy Output";
    }
    uint64_t v49 = v23;
    __int16 v50 = 2080;
    int v51 = v27;
    __int16 v52 = 2080;
    uint64_t v53 = v28;
    _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice(%p)::USBMIDIDevice() with MIDIDeviceRef %u %s (%s / %s)",  buf,  0x40u);
  }

  unint64_t v39 = off_24C68;
  v40[0] = a1;
  uint64_t v29 = operator new(0x340uLL);
  void *v29 = off_24A60;
  v29[1] = off_24C68;
  v29[2] = a1;
  bzero(v29 + 8, 0x300uLL);
  *(void *)buf = v29;
  sub_FA24(v12, (uint64_t *)buf);
  uint64_t v30 = *(void *)buf;
  *(void *)buf = 0LL;
  if (v30) {
    (*(void (**)(uint64_t))(*(void *)v30 + 8LL))(v30);
  }
  ((void (*)(uint64_t *))v39[3])(v40);
  unsigned int v37 = off_24CC8;
  v38[0] = a1;
  char v31 = operator new(0x340uLL);
  void *v31 = off_24A90;
  v31[1] = off_24CC8;
  v31[2] = a1;
  bzero(v31 + 8, 0x300uLL);
  *(void *)buf = v31;
  sub_FA24(v11, (uint64_t *)buf);
  uint64_t v32 = *(void *)buf;
  *(void *)buf = 0LL;
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
  }
  ((void (*)(uint64_t *))v37[3])(v38);
  v36[0] = a1;
  __int16 v33 = operator new(0x868uLL);
  *__int16 v33 = off_24AC0;
  v33[1] = off_24CC8;
  v33[2] = a1;
  bzero(v33 + 8, 0x821uLL);
  *(void *)buf = v33;
  sub_FA24(v13, (uint64_t *)buf);
  uint64_t v34 = *(void *)buf;
  *(void *)buf = 0LL;
  if (v34) {
    (*(void (**)(uint64_t))(*(void *)v34 + 8LL))(v34);
  }
  ((void (*)(uint64_t *))nullsub_13)(v36);
  if (a4) {
    *(_BYTE *)(a4 + 24) = 0;
  }
  return a1;
}

void sub_F608( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31)
{
  if (a2) {
    sub_29BC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_F81C()
{
}

void *sub_F824(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  __int16 v8 = sub_2364();
  uint64_t v14 = a3;
  unint64_t v9 = v15;
  sub_2C18((uint64_t)v15, a4);
  char v18 = 0LL;
  uint64_t v10 = operator new(0x30uLL);
  *uint64_t v10 = &off_24B10;
  v10[1] = v14;
  sub_17BC4((uint64_t)(v10 + 2), (uint64_t)v15);
  char v18 = v10;
  sub_2864((uint64_t)v8, a1, a2, (uint64_t)v17);
  __n128 result = v18;
  if (v18 == v17)
  {
    uint64_t v12 = 4LL;
    __n128 result = v17;
  }

  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    uint64_t v12 = 5LL;
  }

  __n128 result = (void *)(*(uint64_t (**)(void))(*result + 8 * v12))();
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
    unint64_t v9 = v16;
  }

  return (void *)(*(uint64_t (**)(void *))(*v9 + 8 * v13))(v9);
}

void sub_F950( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  __int128 v20 = a17;
  if (a17 == v18)
  {
    uint64_t v21 = 4LL;
    __int128 v20 = &a14;
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
    uint64_t v17 = a13;
  }

  (*(void (**)(void *))(*v17 + 8 * v22))(v17);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void sub_F9C8()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28150);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28150))
    {
      qword_28148 = (uint64_t)os_log_create("com.apple.coremidi", "usbmio");
      __cxa_guard_release(&qword_28150);
    }
  }

void *sub_FA24(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    uint64_t v5 = operator new(0x20uLL);
    *uint64_t v5 = &off_24CA0;
    v5[1] = 0LL;
    v5[2] = 0LL;
    v5[3] = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *a2 = 0LL;
  int v6 = (std::__shared_weak_count *)a1[1];
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

uint64_t sub_FAC0(void *a1)
{
  uint64_t v2 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 136;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::Initialize()", buf, 0x1Cu);
  }

  uint64_t v3 = (*(uint64_t (**)(void, void *))(*(void *)a1[10] + 144LL))(a1[10], a1);
  a1[12] = v3;
  if (!v3 || (sub_5678(v3) & 1) == 0)
  {
    sub_F9C8();
    uint64_t v80 = qword_28148;
    if (!os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    uint64_t v81 = a1[12];
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_DWORD *)buf = 136315906;
    *(_WORD *)&_BYTE buf[12] = 1024;
    if (v81) {
      uint64_t v82 = "mUSBInterface->Open() failed";
    }
    else {
      uint64_t v82 = "mUSBInterface = NULL";
    }
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v82;
    unint64_t v83 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() - Failed: %s";
    uint64_t v84 = (os_log_s *)v80;
    uint32_t v85 = 38;
LABEL_104:
    _os_log_impl(&dword_0, v84, OS_LOG_TYPE_ERROR, v83, buf, v85);
    return 0LL;
  }

  uint64_t v4 = sub_5388(a1[12]);
  a1[13] = v4;
  if (!v4)
  {
    sub_F9C8();
    uint64_t v88 = qword_28148;
    if (!os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 144;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    unint64_t v83 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() - Failed: GetPluginInterface() failed";
    goto LABEL_109;
  }

  *(_WORD *)((char *)a1 + 185) = 0;
  int v5 = sub_10B14((uint64_t)a1);
  *((_BYTE *)a1 + 189) = v5;
  if (v5)
  {
    sub_F9C8();
    int v6 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 152;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d      phantom entity detected and will be excluded from portmap list",  buf,  0x12u);
    }
  }

  (*(void (**)(void *, void))(*a1 + 120LL))(a1, *((unsigned __int8 *)a1 + 491));
  (*(void (**)(void *))(*a1 + 56LL))(a1);
  if (((*(uint64_t (**)(void *))(*a1 + 112LL))(a1) & 1) == 0
    && !(*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
  {
    sub_F9C8();
    uint64_t v88 = qword_28148;
    if (!os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 240;
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    unint64_t v83 = "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() encountered an error and is exiting prematurely.";
LABEL_109:
    uint64_t v84 = (os_log_s *)v88;
    uint32_t v85 = 28;
    goto LABEL_104;
  }

  if (*(_DWORD *)(a1[10] + 28LL) == 3)
  {
    sub_F9C8();
    unint64_t v7 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 159;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d      Using USB MIDI Driver v3.", buf, 0x12u);
    }
  }

  (*(void (**)(void *))(*a1 + 32LL))(a1);
  uint64_t v8 = a1[17];
  uint64_t v131 = a1[18];
  if (v8 != v131)
  {
    unint64_t v9 = (int64x2_t *)(a1 + 34);
    do
    {
      uint64_t v132 = v8;
      uint64_t v10 = (unsigned __int16 *)(v8 + 4);
      char v11 = 1;
      do
      {
        char v12 = v11;
        sub_17F78(buf, a1 + 8);
        uint64_t v13 = *(std::__shared_weak_count **)&buf[8];
        *(void *)v134 = *(void *)buf;
        *(void *)&v134[8] = *(void *)&buf[8];
        if (*(void *)&buf[8])
        {
          uint64_t v14 = (unint64_t *)(*(void *)&buf[8] + 16LL);
          do
            unint64_t v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
          p_shared_owners = (unint64_t *)&v13->__shared_owners_;
          do
            unint64_t v17 = __ldaxr(p_shared_owners);
          while (__stlxr(v17 - 1, p_shared_owners));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
          }
        }

        *(void *)buf = a1;
        sub_17FEC((uint64_t *)buf, (uint64_t *)v134, v10, &v133);
        uint64_t v19 = (_OWORD *)a1[35];
        unint64_t v18 = a1[36];
        if ((unint64_t)v19 >= v18)
        {
          uint64_t v20 = ((uint64_t)v19 - v9->i64[0]) >> 4;
          unint64_t v21 = v20 + 1;
          uint64_t v22 = v18 - v9->i64[0];
          if (v22 >> 3 > v21) {
            unint64_t v21 = v22 >> 3;
          }
          else {
            unint64_t v23 = v21;
          }
          *(void *)&buf[32] = a1 + 36;
          int v24 = (char *)sub_172B4((uint64_t)(a1 + 36), v23);
          BOOL v26 = &v24[16 * v20];
          *(_OWORD *)BOOL v26 = v133;
          __int128 v133 = 0uLL;
          int v28 = (void *)a1[34];
          uint64_t v27 = (void *)a1[35];
          if (v27 == v28)
          {
            int64x2_t v31 = vdupq_n_s64((unint64_t)v27);
            uint64_t v29 = &v24[16 * v20];
          }

          else
          {
            uint64_t v29 = &v24[16 * v20];
            do
            {
              __int128 v30 = *((_OWORD *)v27 - 1);
              v27 -= 2;
              *((_OWORD *)v29 - 1) = v30;
              v29 -= 16;
              void *v27 = 0LL;
              v27[1] = 0LL;
            }

            while (v27 != v28);
            int64x2_t v31 = *v9;
          }

          uint64_t v32 = v26 + 16;
          a1[34] = v29;
          a1[35] = v26 + 16;
          *(int64x2_t *)&buf[8] = v31;
          uint64_t v33 = a1[36];
          a1[36] = &v24[16 * v25];
          *(void *)&buf[24] = v33;
          *(void *)buf = v31.i64[0];
          sub_172E8((uint64_t)buf);
          uint64_t v34 = (std::__shared_weak_count *)*((void *)&v133 + 1);
          a1[35] = v32;
          if (v34)
          {
            unsigned int v35 = (unint64_t *)&v34->__shared_owners_;
            do
              unint64_t v36 = __ldaxr(v35);
            while (__stlxr(v36 - 1, v35));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
              std::__shared_weak_count::__release_weak(v34);
            }
          }
        }

        else
        {
          _OWORD *v19 = v133;
          a1[35] = v19 + 1;
        }

        if (*(void *)&v134[8]) {
          std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v134[8]);
        }
        char v11 = 0;
      }

      while ((v12 & 1) != 0);
      uint64_t v8 = v132 + 8;
    }

    while (v132 + 8 != v131);
  }

  uint64_t v37 = a1[20];
  uint64_t v38 = a1[21];
  if (v37 != v38)
  {
    unint64_t v39 = (int64x2_t *)(a1 + 37);
    do
    {
      sub_17F78(buf, a1 + 8);
      unsigned int v40 = *(std::__shared_weak_count **)&buf[8];
      *(void *)v134 = *(void *)buf;
      *(void *)&v134[8] = *(void *)&buf[8];
      if (*(void *)&buf[8])
      {
        uint64_t v41 = (unint64_t *)(*(void *)&buf[8] + 16LL);
        do
          unint64_t v42 = __ldxr(v41);
        while (__stxr(v42 + 1, v41));
        int v43 = (unint64_t *)&v40->__shared_owners_;
        do
          unint64_t v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }

      *(void *)buf = a1;
      sub_17FEC((uint64_t *)buf, (uint64_t *)v134, (unsigned __int16 *)(v37 + 4), &v133);
      uint64_t v45 = v133;
      *(_BYTE *)(v133 + 64) = *(_BYTE *)(v37 + 6);
      __int16 v46 = (void *)a1[38];
      unint64_t v47 = a1[39];
      if ((unint64_t)v46 >= v47)
      {
        uint64_t v49 = ((uint64_t)v46 - v39->i64[0]) >> 4;
        unint64_t v50 = v49 + 1;
        uint64_t v51 = v47 - v39->i64[0];
        if (v51 >> 3 > v50) {
          unint64_t v50 = v51 >> 3;
        }
        else {
          unint64_t v52 = v50;
        }
        *(void *)&buf[32] = a1 + 39;
        uint64_t v53 = (char *)sub_172B4((uint64_t)(a1 + 39), v52);
        uint64_t v55 = &v53[16 * v49];
        *(_OWORD *)uint64_t v55 = v133;
        __int128 v133 = 0uLL;
        int v57 = (void *)a1[37];
        int v56 = (void *)a1[38];
        if (v56 == v57)
        {
          int64x2_t v60 = vdupq_n_s64((unint64_t)v56);
          BOOL v58 = &v53[16 * v49];
        }

        else
        {
          BOOL v58 = &v53[16 * v49];
          do
          {
            __int128 v59 = *((_OWORD *)v56 - 1);
            v56 -= 2;
            *((_OWORD *)v58 - 1) = v59;
            v58 -= 16;
            *int v56 = 0LL;
            v56[1] = 0LL;
          }

          while (v56 != v57);
          int64x2_t v60 = *v39;
        }

        __int16 v48 = (__int128 *)(v55 + 16);
        a1[37] = v58;
        a1[38] = v55 + 16;
        *(int64x2_t *)&buf[8] = v60;
        uint64_t v61 = a1[39];
        a1[39] = &v53[16 * v54];
        *(void *)&buf[24] = v61;
        *(void *)buf = v60.i64[0];
        sub_172E8((uint64_t)buf);
      }

      else
      {
        void *v46 = v45;
        v46[1] = *((void *)&v133 + 1);
        __int128 v133 = 0uLL;
        __int16 v48 = (__int128 *)(v46 + 2);
      }

      a1[38] = v48;
      sub_10B90((char **)a1 + 40, v48 - 1);
      unsigned int v62 = (std::__shared_weak_count *)*((void *)&v133 + 1);
      if (*((void *)&v133 + 1))
      {
        __int16 v63 = (unint64_t *)(*((void *)&v133 + 1) + 8LL);
        do
          unint64_t v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
          std::__shared_weak_count::__release_weak(v62);
        }
      }

      if (*(void *)&v134[8]) {
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v134[8]);
      }
      v37 += 8LL;
    }

    while (v37 != v38);
  }

  uint64_t v65 = (unsigned __int8 *)a1[17];
  for (uint64_t i = (unsigned __int8 *)a1[18]; v65 != i; v65 += 8)
  {
    sub_F9C8();
    int64_t v67 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      if (v65[1]) {
        unsigned __int8 v68 = *v65 | 0x80;
      }
      else {
        unsigned __int8 v68 = *v65;
      }
      int v69 = v65[6];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 184;
      *(_WORD *)&_BYTE buf[18] = 1024;
      *(_DWORD *)&buf[20] = v68;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v69;
      _os_log_impl( &dword_0,  v67,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Configuring USB In Endpoint: 0x%0x, pipeIndex:%d",  buf,  0x1Eu);
    }
  }

  uint64_t v70 = (unsigned __int8 *)a1[20];
  for (j = (unsigned __int8 *)a1[21]; v70 != j; v70 += 8)
  {
    sub_F9C8();
    unsigned int v72 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      if (v70[1]) {
        unsigned __int8 v73 = *v70 | 0x80;
      }
      else {
        unsigned __int8 v73 = *v70;
      }
      int v74 = v70[6];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 187;
      *(_WORD *)&_BYTE buf[18] = 1024;
      *(_DWORD *)&buf[20] = v73;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v74;
      _os_log_impl( &dword_0,  v72,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Configuring USB Out Endpoint: 0x%0x, pipeIndex:%d",  buf,  0x1Eu);
    }
  }

  uint64_t v75 = a1[17];
  uint64_t v76 = a1[18];
  if (v75 == v76)
  {
    BOOL v78 = 0;
  }

  else
  {
    uint64_t v77 = v75 + 8;
    do
    {
      BOOL v78 = *(unsigned __int8 *)(v77 - 1) == 255;
      BOOL v79 = *(unsigned __int8 *)(v77 - 1) == 255 || v77 == v76;
      v77 += 8LL;
    }

    while (!v79);
  }

  for (uint64_t k = a1[20]; k != a1[21]; k += 8LL)
  {
  }

  if (!v78) {
    goto LABEL_164;
  }
LABEL_116:
  sub_F9C8();
  uint64_t v90 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 191;
    _os_log_impl( &dword_0,  v90,  OS_LOG_TYPE_INFO,  "%25s:%-5d      MIDI-CI negotiation is necessary to determine initial protocol(s).",  buf,  0x12u);
  }

  *((_BYTE *)a1 + 188) = 1;
  memset(buf, 0, 24);
  sub_17334((char *)buf, (uint64_t *)a1[20], (uint64_t *)a1[21], (uint64_t)(a1[21] - a1[20]) >> 3);
  uint64_t v91 = *(unsigned __int8 **)buf;
  if (*(void *)buf != *(void *)&buf[8])
  {
    while (v91[7] == 255)
    {
      v91 += 8;
    }
  }

  if (v91 != *(unsigned __int8 **)&buf[8])
  {
    sub_F9C8();
    uint64_t v92 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v134 = 136315394;
      *(void *)&v134[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&v134[12] = 1024;
      *(_DWORD *)&v134[14] = 197;
      _os_log_impl( &dword_0,  v92,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Culling endpoints with known protocols.",  v134,  0x12u);
    }

    if (v91 + 8 != *(unsigned __int8 **)&buf[8])
    {
      uint64_t v93 = *(void *)buf;
      unsigned int v94 = &v91[-*(void *)buf];
      unint64_t v95 = (*(void *)&buf[8] - (void)v91) & 0xFFFFFFFFFFFFFFF8LL;
      memmove(v91, v91 + 8, v95 - 8);
      uint64_t v91 = &v94[v93 - 8 + v95];
    }

    *(void *)&buf[8] = v91;
  }

LABEL_128:
  sub_F9C8();
  unint64_t v96 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v134 = 136315650;
    *(void *)&v134[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&v134[12] = 1024;
    *(_DWORD *)&v134[14] = 202;
    __int16 v135 = 1024;
    int v136 = (*(void *)&buf[8] - *(void *)buf) >> 3;
    _os_log_impl( &dword_0,  v96,  OS_LOG_TYPE_INFO,  "%25s:%-5d      Negotiating protocol for %u endpoint(s)...",  v134,  0x18u);
  }

  __int128 v98 = *(unsigned __int8 **)buf;
  uint64_t v97 = *(unsigned __int8 **)&buf[8];
  if (*(void *)buf != *(void *)&buf[8])
  {
    do
    {
      uint64_t v99 = a1[24];
      uint64_t v100 = a1[25];
      if (v99 != v100)
      {
        if (v98[1]) {
          unsigned __int8 v101 = *v98 | 0x80;
        }
        else {
          unsigned __int8 v101 = *v98;
        }
        while (*(unsigned __int8 *)(v99 + 3) != v101)
        {
          v99 += 8LL;
          if (v99 == v100) {
            goto LABEL_140;
          }
        }
      }

      if (v99 == v100) {
LABEL_140:
      }
        int v102 = 0;
      else {
        int v102 = *(unsigned __int8 *)(v99 + 2);
      }
      __int128 v103 = (_BYTE *)a1[17];
      uint64_t v104 = (_BYTE *)a1[18];
      if (v103 != v104)
      {
        while (1)
        {
          unsigned __int8 v105 = v103[1] ? *v103 | 0x80 : *v103;
          if (v102 == v105) {
            break;
          }
          v103 += 8;
          if (v103 == v104) {
            goto LABEL_160;
          }
        }
      }

      if (v103 != v104 && (~*(void *)v103 & 0xFF000000000000LL) != 0)
      {
        sub_17F78(&v133, a1 + 8);
        sub_182BC(&v133, v134);
        uint64_t v106 = (std::__shared_weak_count *)*((void *)&v133 + 1);
        if (*((void *)&v133 + 1))
        {
          uint64_t v107 = (unint64_t *)(*((void *)&v133 + 1) + 8LL);
          do
            unint64_t v108 = __ldaxr(v107);
          while (__stlxr(v108 - 1, v107));
          if (!v108)
          {
            ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
            std::__shared_weak_count::__release_weak(v106);
          }
        }

        sub_10B90((char **)a1 + 14, (__int128 *)v134);
        char v109 = *(std::__shared_weak_count **)&v134[8];
        if (*(void *)&v134[8])
        {
          char v110 = (unint64_t *)(*(void *)&v134[8] + 8LL);
          do
            unint64_t v111 = __ldaxr(v110);
          while (__stlxr(v111 - 1, v110));
          if (!v111)
          {
            ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
            std::__shared_weak_count::__release_weak(v109);
          }
        }
      }

LABEL_160:
      v98 += 8;
    }

    while (v98 != v97);
    __int128 v98 = *(unsigned __int8 **)buf;
  }

  if (v98)
  {
    *(void *)&buf[8] = v98;
    operator delete(v98);
  }

LABEL_164:
  sub_F9C8();
  uint64_t v112 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    uint64_t v113 = (a1[18] - a1[17]) >> 3;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 213;
    *(_WORD *)&_BYTE buf[18] = 1024;
    *(_DWORD *)&buf[20] = v113;
    _os_log_impl(&dword_0, v112, OS_LOG_TYPE_INFO, "%25s:%-5d      Priming %d input pipe(s)", buf, 0x18u);
  }

  if (a1[18] != a1[17])
  {
    unint64_t v114 = 0LL;
    do
    {
      uint64_t v115 = 0LL;
      char v116 = 1;
      do
      {
        char v117 = v116;
        unint64_t v118 = v115 | (2 * v114);
        uint64_t v119 = a1[34];
        if (v118 >= (a1[35] - v119) >> 4) {
          sub_E234();
        }
        uint64_t v120 = a1[17];
        if (v114 >= (a1[18] - v120) >> 3) {
          sub_E234();
        }
        *(_BYTE *)(*(void *)(v119 + 16 * v118) + 64LL) = *(_BYTE *)(v120 + 8 * v114 + 6);
        (*(void (**)(void *))(*a1 + 64LL))(a1);
        char v116 = 0;
        uint64_t v115 = 1LL;
      }

      while ((v117 & 1) != 0);
      ++v114;
    }

    while (v114 < (uint64_t)(a1[18] - a1[17]) >> 3);
  }

  (*(void (**)(void, void *))(*(void *)a1[10] + 152LL))(a1[10], a1);
  int v121 = (uint64_t *)a1[14];
  int v122 = (uint64_t *)a1[15];
  if (v121 == v122) {
    goto LABEL_191;
  }
  do
  {
    if (*((_BYTE *)a1 + 492) || *((_BYTE *)a1 + 493))
    {
      sub_F9C8();
      int v123 = (os_log_s *)qword_28148;
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
      {
        int v124 = "forcemidi1fallback";
        if (!*((_BYTE *)a1 + 492)) {
          int v124 = "forcemidi1upfallback";
        }
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = 226;
        *(_WORD *)&_BYTE buf[18] = 2080;
        *(void *)&buf[20] = v124;
        _os_log_impl( &dword_0,  v123,  OS_LOG_TYPE_INFO,  "%25s:%-5d [AQAMIDI] %s is set in defaults, so negotiation will be skipped.",  buf,  0x1Cu);
      }

      uint64_t v125 = *v121;
      if (*(_BYTE *)(*v121 + 41)) {
        unsigned __int8 v126 = *(_BYTE *)(*v121 + 40) | 0x80;
      }
      else {
        unsigned __int8 v126 = *(_BYTE *)(*v121 + 40);
      }
      int v127 = *(unsigned __int8 *)(v125 + 49);
      unsigned __int8 v128 = *(_BYTE *)(v125 + 48);
      if (v127) {
        v128 |= 0x80u;
      }
      sub_10CD0((uint64_t)a1, v126, v128, 255);
    }

    else
    {
      sub_1A1A4(*v121);
    }

    v121 += 2;
  }

  while (v121 != v122);
  if (a1[14] != a1[15]) {
    return 1LL;
  }
LABEL_191:
  uint64_t v86 = (*(uint64_t (**)(void *))(*a1 + 48LL))(a1);
  sub_F9C8();
  unint64_t v129 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    v130 = "false";
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 236;
    *(_DWORD *)buf = 136315906;
    if ((_DWORD)v86) {
      v130 = "true";
    }
    *(_WORD *)&_BYTE buf[18] = 2048;
    *(void *)&buf[20] = a1;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v130;
    _os_log_impl(&dword_0, v129, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::Initialize() = %s", buf, 0x26u);
  }

  return v86;
}

void sub_10A9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, std::__shared_weak_count *a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24)
{
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

ItemCount sub_10B14(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 491)) {
    return 0LL;
  }
  ItemCount result = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  if ((_DWORD)result)
  {
    SInt32 outValue = 0;
    ItemCount result = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), (int)result - 1);
    if ((_DWORD)result)
    {
      MIDIObjectGetIntegerProperty(result, kMIDIPropertyUMPCanTransmitGroupless, &outValue);
      return outValue != 0;
    }
  }

  return result;
}

uint64_t sub_10B90(char **a1, __int128 *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(char **)(result - 8);
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
    uint64_t v16 = (char *)sub_172B4(result, v15);
    unint64_t v18 = &v16[16 * v12];
    __int128 v19 = *a2;
    *(_OWORD *)unint64_t v18 = *a2;
    if (*((void *)&v19 + 1))
    {
      uint64_t v20 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    unint64_t v23 = *a1;
    uint64_t v22 = a1[1];
    if (v22 == *a1)
    {
      int64x2_t v26 = vdupq_n_s64((unint64_t)v22);
      int v24 = &v16[16 * v12];
    }

    else
    {
      int v24 = &v16[16 * v12];
      do
      {
        __int128 v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(void *)uint64_t v22 = 0LL;
        *((void *)v22 + 1) = 0LL;
      }

      while (v22 != v23);
      int64x2_t v26 = *(int64x2_t *)a1;
    }

    char v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    int64x2_t v29 = v26;
    uint64_t v27 = a1[2];
    a1[2] = &v16[16 * v17];
    __int128 v30 = v27;
    uint64_t v28 = v26.i64[0];
    uint64_t result = sub_172E8((uint64_t)&v28);
  }

  else
  {
    *(void *)unint64_t v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    *((void *)v7 + 1) = v8;
    if (v8)
    {
      unint64_t v9 = (unint64_t *)(v8 + 8);
      do
        unint64_t v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }

    char v11 = v7 + 16;
  }

  a1[1] = v11;
  return result;
}

void sub_10CD0(uint64_t a1, int a2, int a3, int a4)
{
  if (*(_BYTE *)(a1 + 492))
  {
    *(_BYTE *)(a1 + 188) = 0;
    sub_F9C8();
    unint64_t v7 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = "[AQAMIDI] defaults value midi1fallback is set";
      int v9 = *(unsigned __int8 *)(a1 + 492);
      uint64_t v38 = "USBMIDIDevice.cpp";
      int v37 = 136316162;
      __int16 v39 = 1024;
      if (!v9) {
        uint64_t v8 = (const char *)&unk_1E599;
      }
      int v40 = 989;
      __int16 v41 = 1024;
      *(_DWORD *)unint64_t v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      __int16 v43 = 2080;
      unint64_t v44 = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoint(inEP: 0x%x, outEP: 0x%x) failed %s",  (uint8_t *)&v37,  0x28u);
    }

    int v10 = sub_112CC(a1);
    sub_F9C8();
    uint64_t v11 = qword_28148;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v12) {
        return;
      }
      int v37 = 136315906;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 991;
      __int16 v41 = 1024;
      *(_DWORD *)unint64_t v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      unint64_t v13 = "%25s:%-5d [-] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x) - Successfully fell ba"
            "ck to MIDI 1.0 after failure.";
    }

    else
    {
      if (!v12) {
        return;
      }
      int v37 = 136315906;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 993;
      __int16 v41 = 1024;
      *(_DWORD *)unint64_t v42 = a2;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = a3;
      unint64_t v13 = "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x) - MIDI 1.0 fallback failed.";
    }

    uint64_t v17 = (os_log_s *)v11;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 30;
    goto LABEL_16;
  }

  int v14 = a4;
  if (a4 == 255)
  {
    int v15 = *(unsigned __int8 *)(a1 + 493);
    sub_F9C8();
    uint64_t v16 = (os_log_s *)qword_28148;
    if (v15)
    {
      int v14 = 1;
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 999;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%25s:%-5d * * * [AQAMIDI] Protocol negotiation skipped because of defaults. Forcing MIDI-1UP as default protocol. * * *",  (uint8_t *)&v37,  0x12u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 1001;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "%25s:%-5d * * * [AQAMIDI] Protocol negotiation timed out. Using MIDI-1UP as default protocol. * * *",  (uint8_t *)&v37,  0x12u);
      }

      int v14 = 1;
    }
  }

  sub_F9C8();
  uint64_t v20 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    int v37 = 136315906;
    uint64_t v38 = "USBMIDIDevice.cpp";
    __int16 v39 = 1024;
    int v40 = 1004;
    __int16 v41 = 1024;
    *(_DWORD *)unint64_t v42 = a2;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = a3;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice::NegotiationCompleteForEndpoints(inEP: 0x%x, outEP: 0x%x)",  (uint8_t *)&v37,  0x1Eu);
  }

  unint64_t v21 = *(_BYTE **)(a1 + 136);
  uint64_t v22 = *(_BYTE **)(a1 + 144);
  unint64_t v23 = v21;
  if (v21 != v22)
  {
    unint64_t v23 = *(_BYTE **)(a1 + 136);
    while (1)
    {
      unsigned __int8 v24 = v23[1] ? *v23 | 0x80 : *v23;
      if (a2 == v24) {
        break;
      }
      v23 += 8;
      if (v23 == v22) {
        goto LABEL_54;
      }
    }
  }

  if (v22 != v23)
  {
    v23[7] = v14;
    int64x2_t v26 = *(_BYTE **)(a1 + 160);
    __int128 v25 = *(_BYTE **)(a1 + 168);
    uint64_t v27 = v26;
    if (v26 != v25)
    {
      while (1)
      {
        unsigned __int8 v28 = v27[1] ? *v27 | 0x80 : *v27;
        if (a3 == v28) {
          break;
        }
        v27 += 8;
        if (v27 == v25) {
          goto LABEL_54;
        }
      }
    }

    if (v25 != v27)
    {
      v27[7] = v14;
      while (v21 != v22)
      {
        if (v21[7] == 255)
        {
          BOOL v30 = 1;
          goto LABEL_53;
        }

        v21 += 8;
      }

      if (v26 == v25)
      {
        BOOL v30 = 0;
      }

      else
      {
        int64x2_t v29 = v26 + 8;
        do
        {
          BOOL v30 = *(v29 - 1) == 255;
          BOOL v31 = *(v29 - 1) == 255 || v29 == v25;
          v29 += 8;
        }

        while (!v31);
      }

LABEL_53:
      *(_BYTE *)(a1 + 188) = v30;
    }
  }

LABEL_54:
  if (!*(_BYTE *)(a1 + 188))
  {
    sub_F9C8();
    uint64_t v32 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 1019;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "%25s:%-5d ============================================",  (uint8_t *)&v37,  0x12u);
    }

    sub_F9C8();
    uint64_t v33 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = "MIDI-1UP";
      uint64_t v38 = "USBMIDIDevice.cpp";
      int v37 = 136315650;
      if (v14 == 2) {
        uint64_t v34 = "MIDI 2.0";
      }
      __int16 v39 = 1024;
      int v40 = 1020;
      __int16 v41 = 2080;
      *(void *)unint64_t v42 = v34;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "%25s:%-5d == [AQAMIDI] Protocol changed to %s ==",  (uint8_t *)&v37,  0x1Cu);
    }

    sub_F9C8();
    unsigned int v35 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      int v37 = 136315394;
      uint64_t v38 = "USBMIDIDevice.cpp";
      __int16 v39 = 1024;
      int v40 = 1021;
      _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "%25s:%-5d ============================================",  (uint8_t *)&v37,  0x12u);
    }

    if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1) & 1) == 0)
    {
      sub_F9C8();
      uint64_t v36 = qword_28148;
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315394;
        uint64_t v38 = "USBMIDIDevice.cpp";
        __int16 v39 = 1024;
        int v40 = 1024;
        unint64_t v13 = "%25s:%-5d [!] USBMIDIDevice::NegotiationCompleteForEndpoint() - unable to start I/O";
        uint64_t v17 = (os_log_s *)v36;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 18;
LABEL_16:
        _os_log_impl(&dword_0, v17, v18, v13, (uint8_t *)&v37, v19);
      }
    }
  }

uint64_t sub_112CC(uint64_t a1)
{
  *(_BYTE *)(a1 + 491) = 0;
  sub_F9C8();
  uint64_t v2 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 248;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_INFO,  "%25s:%-5d * * * [AQAMIDI] MIDI protocol negotiation failed. Falling back to USB MIDI 1.0 configuration * * *",  buf,  0x12u);
  }

  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  ItemCount v4 = (NumberOfEntities - 1);
  if (NumberOfEntities - 1 >= 0)
  {
    do
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), v4);
      MIDIDeviceRemoveEntity(*(_DWORD *)(a1 + 8), Entity);
      --v4;
      --NumberOfEntities;
    }

    while (NumberOfEntities);
  }

  sub_F9C8();
  unint64_t v6 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "USBMIDIDevice.cpp";
    __int16 v38 = 1024;
    int v39 = 256;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDevice::InitializeFallback() - probing device",  buf,  0x12u);
  }

  sub_B420(*(void *)(a1 + 88), *(void *)(a1 + 96), (uint64_t)buf);
  if (*(void *)buf)
  {
    sub_F9C8();
    unint64_t v7 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v36 = 136315394;
      *(void *)&v36[4] = "USBMIDIDevice.cpp";
      *(_WORD *)&v36[12] = 1024;
      *(_DWORD *)&v36[14] = 260;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%25s:%-5d      Creating fallback port map list", v36, 0x12u);
    }

    sub_B7D0(1, (uint64_t)buf, (uint64_t *)v36);
    sub_F9C8();
    uint64_t v8 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)BOOL v30 = 136315394;
      BOOL v31 = "USBMIDIDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 264;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%25s:%-5d      Setting alternate interface to 0", v30, 0x12u);
    }

    (*(void (**)(void, void))(**(void **)(a1 + 104) + 176LL))(*(void *)(a1 + 104), 0LL);
    uint64_t v9 = *(void *)(a1 + 160);
    uint64_t v10 = *(void *)(a1 + 168);
    while (v9 != v10)
    {
      *(_BYTE *)(v9 + 7) = 0;
      (*(void (**)(void, void))(**(void **)(a1 + 104) + 224LL))( *(void *)(a1 + 104),  *(unsigned __int8 *)(v9 + 6));
      v9 += 8LL;
    }

    sub_F9C8();
    uint64_t v11 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3;
      *(_DWORD *)BOOL v30 = 136315650;
      BOOL v31 = "USBMIDIDevice.cpp";
      __int16 v32 = 1024;
      int v33 = 271;
      __int16 v34 = 1024;
      int v35 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%25s:%-5d      Priming %d input pipe(s)", v30, 0x18u);
    }

    uint64_t v13 = *(void *)(a1 + 136);
    uint64_t v14 = *(void *)(a1 + 144);
    if (v13 != v14)
    {
      uint64_t v15 = 0LL;
      do
      {
        uint64_t v16 = 0LL;
        *(_BYTE *)(v13 + 7) = 0;
        char v17 = 1;
        do
        {
          char v18 = v17;
          unint64_t v19 = v16 | (2 * v15);
          uint64_t v20 = *(void *)(a1 + 272);
          if (v19 >= (*(void *)(a1 + 280) - v20) >> 4) {
            sub_E234();
          }
          uint64_t v21 = *(void *)(v20 + 16 * v19);
          *(_BYTE *)(v21 + 64) = *(_BYTE *)(v13 + 6);
          (*(void (**)(void))(**(void **)(a1 + 104) + 224LL))(*(void *)(a1 + 104));
          (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 64LL))(a1, v21);
          char v17 = 0;
          uint64_t v16 = 1LL;
        }

        while ((v18 & 1) != 0);
        ++v15;
        v13 += 8LL;
      }

      while (v13 != v14);
    }

    uint64_t v23 = *(void *)(a1 + 88);
    uint64_t v22 = *(void *)(a1 + 96);
    unsigned __int8 v24 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 112LL))(*(void *)(a1 + 80));
    __int128 v25 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 96LL))(*(void *)(a1 + 80));
    int64x2_t v26 = (const __CFString *)(*(uint64_t (**)(void))(**(void **)(a1 + 80) + 104LL))(*(void *)(a1 + 80));
    LODWORD(v23) = sub_B6B0(v23, v22, v24, v25, v26, *(_DWORD *)(a1 + 8), (uint64_t *)v36, (uint64_t *)v40, v41, v42);
    sub_F9C8();
    uint64_t v27 = (os_log_s *)qword_28148;
    if ((_DWORD)v23)
    {
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)BOOL v30 = 136315394;
        BOOL v31 = "USBMIDIDevice.cpp";
        __int16 v32 = 1024;
        int v33 = 287;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] USBMIDIDevice::InitializeFallback() - device configured. Starting I/O.",  v30,  0x12u);
      }

      uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)BOOL v30 = 136315394;
        BOOL v31 = "USBMIDIDevice.cpp";
        __int16 v32 = 1024;
        int v33 = 290;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::InitializeFallback() - could not configure device",  v30,  0x12u);
      }

      uint64_t v28 = 0LL;
    }

    if (*(void *)v36)
    {
      *(void *)&v36[8] = *(void *)v36;
      operator delete(*(void **)v36);
    }
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  if (__p)
  {
    unint64_t v44 = __p;
    operator delete(__p);
  }

  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }

  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }

  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }

  return v28;
}

void sub_11830( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  sub_B650(&a19);
  _Unwind_Resume(a1);
}

void sub_11874(uint64_t a1)
{
  CFRunLoopRef v2 = MIDIGetDriverIORunLoop();
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  ItemCount v4 = (__CFRunLoopSource *)(*(uint64_t (**)(void))(**(void **)(a1 + 104) + 40LL))(*(void *)(a1 + 104));
  CFRunLoopSourceRef source = v4;
  BOOL v5 = v4 == 0LL;
  if (!v4)
  {
    if ((*(unsigned int (**)(void, CFRunLoopSourceRef *))(**(void **)(a1 + 104) + 32LL))( *(void *)(a1 + 104),  &source))
    {
      BOOL v6 = 1;
    }

    else
    {
      BOOL v6 = source == 0LL;
    }

    if (!v6)
    {
      sub_F9C8();
      unint64_t v7 = (os_log_s *)qword_28148;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_DEBUG);
      ItemCount v4 = source;
      if (v8)
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v13 = "USBMIDIDevice.cpp";
        __int16 v14 = 1024;
        int v15 = 307;
        __int16 v16 = 2048;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        CFRunLoopSourceRef v19 = source;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] USBMIDIDevice(%p)::RegisterAsyncSource() created CFRunLoopSource %p",  buf,  0x26u);
        ItemCount v4 = source;
      }

      goto LABEL_9;
    }

void sub_11A74(uint64_t a1)
{
  CFRunLoopRef v2 = MIDIGetDriverIORunLoop();
  uint64_t v3 = *(void *)(a1 + 104);
  if (v3) {
    BOOL v4 = v2 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    BOOL v5 = (__CFRunLoopSource *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40LL))(v3);
    if (v5)
    {
      BOOL v6 = v5;
      if (CFRunLoopContainsSource(v2, v5, kCFRunLoopDefaultMode)) {
        CFRunLoopRemoveSource(v2, v6, kCFRunLoopDefaultMode);
      }
    }
  }

  sub_F9C8();
  unint64_t v7 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    uint64_t v9 = "USBMIDIDevice.cpp";
    __int16 v10 = 1024;
    int v11 = 326;
    __int16 v12 = 2048;
    uint64_t v13 = a1;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice(%p)::UnregisterAsyncSource()",  (uint8_t *)&v8,  0x1Cu);
  }

uint64_t sub_11B9C(uint64_t a1)
{
  CFRunLoopRef v2 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315650;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 331;
    HIWORD(v7.packet[0].wordCount) = 2048;
    *(void *)v7.packet[0].words = a1;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [+] USBMIDIDevice(%p)::StartIO()", (uint8_t *)&v7, 0x1Cu);
  }

  *(void *)(a1 + 480) = MIDITimerTaskCreate(sub_11DDC, a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, 1LL);
  if (*(_BYTE *)(a1 + 491))
  {
    uint64_t v3 = MIDIEventListInit(&v7, kMIDIProtocol_2_0);
    v7.numPackets = 1;
    v3->timeStamp = 0LL;
    *(void *)&v3->wordCount = 0x3000000000000002LL;
    v3->words[1] = 0;
    (*(void (**)(uint64_t, MIDIEventList *, void))(*(void *)a1 + 96LL))(a1, &v7, 0LL);
  }

  else
  {
    v7.protocol = kMIDIProtocol_1_0;
    *(void *)&v7.numPackets = 0LL;
    HIDWORD(v7.packet[0].timeStamp) = -135266302;
    (*(void (**)(uint64_t, MIDIEventList *, void))(*(void *)a1 + 88LL))(a1, &v7, 0LL);
  }

  sub_F9C8();
  BOOL v4 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315394;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 357;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d      bringing initialized device online...",  (uint8_t *)&v7,  0x12u);
  }

  MIDIObjectSetIntegerProperty(*(_DWORD *)(a1 + 8), kMIDIPropertyOffline, 0);
  sub_F9C8();
  BOOL v5 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    v7.protocol = 136315650;
    *(void *)&v7.numPackets = "USBMIDIDevice.cpp";
    WORD2(v7.packet[0].timeStamp) = 1024;
    *(_DWORD *)((char *)&v7.packet[0].timeStamp + 6) = 360;
    HIWORD(v7.packet[0].wordCount) = 2048;
    *(void *)v7.packet[0].words = a1;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_INFO,  "%25s:%-5d [-] USBMIDIDevice(%p)::StartIO() = true",  (uint8_t *)&v7,  0x1Cu);
  }

  return 1LL;
}

uint64_t sub_11DDC(uint64_t a1)
{
  uint64_t v2 = a1 + 344;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16LL))(a1 + 344);
  int v4 = result;
  *(_BYTE *)(a1 + 488) = 0;
  if (!*(_BYTE *)(a1 + 184)) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
  }
  if (v4) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  return result;
}

void sub_11E48(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_11E70(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = off_249D0;
  if (!*((_BYTE *)a1 + 184))
  {
    sub_F9C8();
    int v4 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
    {
      int v5 = *((unsigned __int8 *)a1 + 185);
      BOOL v6 = "Input";
      *(void *)&v41[4] = "USBMIDIDevice.cpp";
      int v7 = *((unsigned __int8 *)a1 + 186);
      BOOL v18 = v5 == 0;
      __int16 v42 = 1024;
      int v43 = 369;
      int v8 = "Output";
      if (v18) {
        BOOL v6 = "N/A";
      }
      *(_DWORD *)__int16 v41 = 136316162;
      __int16 v44 = 2048;
      if (!v7) {
        int v8 = "N/A";
      }
      uint64_t v45 = a1;
      __int16 v46 = 2080;
      unint64_t v47 = v6;
      __int16 v48 = 2080;
      uint64_t v49 = v8;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d [+] USBMIDIDevice(%p)::~USBMIDIDevice() - Halting I/O chain for: %s and %s",  v41,  0x30u);
    }

    (*(void (**)(void *, void))(*a1 + 24LL))(a1, 0LL);
    if (((*(uint64_t (**)(void *))(*a1 + 112LL))(a1) & 1) != 0
      || (*(unsigned int (**)(void *))(*a1 + 104LL))(a1))
    {
      (*(void (**)(void, void *))(*(void *)a1[10] + 160LL))(a1[10], a1);
    }

    *((_BYTE *)a1 + 184) = 1;
    uint64_t v9 = a1[20];
    uint64_t v10 = a1[21];
    while (v9 != v10)
    {
      (*(void (**)(void, void))(*(void *)a1[13] + 224LL))(a1[13], *(unsigned __int8 *)(v9 + 6));
      v9 += 8LL;
    }

    uint64_t v11 = a1[17];
    uint64_t v12 = a1[18];
    while (v11 != v12)
    {
      (*(void (**)(void, void))(*(void *)a1[13] + 224LL))(a1[13], *(unsigned __int8 *)(v11 + 6));
      v11 += 8LL;
    }

    unsigned int v13 = 199;
    do
    {
      uint64_t v15 = a1[34];
      uint64_t v14 = a1[35];
      if (v15 == v14)
      {
        BOOL v17 = 0;
      }

      else
      {
        uint64_t v16 = v15 + 16;
        do
        {
          BOOL v17 = *(_BYTE *)(*(void *)(v16 - 16) + 44LL) != 0;
          if (*(_BYTE *)(*(void *)(v16 - 16) + 44LL)) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = v16 == v14;
          }
          v16 += 16LL;
        }

        while (!v18);
      }

      for (uint64_t i = a1[37]; i != a1[38]; i += 16LL)
      {
        if (*(_BYTE *)(*(void *)i + 44LL))
        {
          int v20 = 1;
          goto LABEL_34;
        }
      }

      int v20 = 0;
      BOOL v21 = 0;
      if (!v17) {
        break;
      }
LABEL_34:
      usleep(0x2710u);
      BOOL v21 = v17;
    }

    while (v13-- >= 2);
    if ((v20 & 1) != 0 || v21)
    {
      sub_F9C8();
      uint64_t v23 = (os_log_s *)qword_28148;
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v24 = "complete";
        *(void *)&v41[4] = "USBMIDIDevice.cpp";
        __int16 v42 = 1024;
        int v43 = 407;
        __int16 v44 = 2048;
        if (v21) {
          __int128 v25 = "pending";
        }
        else {
          __int128 v25 = "complete";
        }
        *(_DWORD *)__int16 v41 = 136316162;
        uint64_t v45 = a1;
        if (v20) {
          unsigned __int8 v24 = "pending";
        }
        __int16 v46 = 2080;
        unint64_t v47 = v25;
        __int16 v48 = 2080;
        uint64_t v49 = v24;
        _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice(%p)::~USBMIDIDevice() Input:%s Output:%s",  v41,  0x30u);
      }
    }

    uint64_t v27 = a1[34];
    for (uint64_t j = a1[35]; j != v27; uint64_t j = sub_179B0(j - 16))
      ;
    a1[35] = v27;
    uint64_t v29 = a1[37];
    for (uint64_t k = a1[38]; k != v29; uint64_t k = sub_179B0(k - 16))
      ;
    a1[38] = v29;
    (*(void (**)(void *))(*a1 + 40LL))(a1);
    uint64_t v30 = a1[60];
    if (v30) {
      MIDITimerTaskDispose(v30, a2, a3);
    }
  }

  if (a1[13])
  {
    uint64_t v31 = a1[12];
    if (v31)
    {
      __int16 v32 = (void *)sub_5604(v31, a2, a3);
      operator delete(v32);
    }
  }

  uint64_t v33 = a1[11];
  if (v33)
  {
    __int16 v34 = (void *)sub_4458(v33);
    operator delete(v34);
  }

  sub_F9C8();
  int v35 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v41 = 136315650;
    *(void *)&v41[4] = "USBMIDIDevice.cpp";
    __int16 v42 = 1024;
    int v43 = 431;
    __int16 v44 = 2048;
    uint64_t v45 = a1;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%25s:%-5d [-] USBMIDIDevice(%p)::~USBMIDIDevice()", v41, 0x1Cu);
  }

  *(void *)__int16 v41 = a1 + 57;
  sub_17128((void ***)v41);
  sub_17198(a1 + 54);
  sub_40B4((uint64_t)(a1 + 43));
  *(void *)__int16 v41 = a1 + 40;
  sub_17244((void ***)v41);
  *(void *)__int16 v41 = a1 + 37;
  sub_17244((void ***)v41);
  *(void *)__int16 v41 = a1 + 34;
  sub_17244((void ***)v41);
  sub_179B0((uint64_t)(a1 + 32));
  sub_179B0((uint64_t)(a1 + 30));
  sub_179B0((uint64_t)(a1 + 28));
  uint64_t v36 = (void *)a1[24];
  if (v36)
  {
    a1[25] = v36;
    operator delete(v36);
  }

  int v37 = (void *)a1[20];
  if (v37)
  {
    a1[21] = v37;
    operator delete(v37);
  }

  __int16 v38 = (void *)a1[17];
  if (v38)
  {
    a1[18] = v38;
    operator delete(v38);
  }

  *(void *)__int16 v41 = a1 + 14;
  sub_17244((void ***)v41);
  int v39 = (std::__shared_weak_count *)a1[9];
  if (v39) {
    std::__shared_weak_count::__release_weak(v39);
  }
  sub_1D064(a1);
  return a1;
}

void sub_12324(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_29BC(a1);
}

void sub_12348(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_11E70(a1, a2, a3);
  operator delete(v3);
}

void sub_1235C(uint64_t a1, int a2)
{
  if (*(_BYTE *)(a1 + 491))
  {
    *(_DWORD *)(a1 + 12) = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
    sub_18F30(a2, (void *)a1, *(_DWORD *)(a1 + 8), (void *)(a1 + 192), a1 + 16, (char **)(a1 + 40));
  }

  else
  {
    sub_1D0B8(a1, a2);
  }

void sub_123BC(uint64_t a1)
{
}

void sub_123D4(uint64_t a1, uint64_t a2, unsigned __int8 **a3, void **a4, void **a5)
{
  unsigned __int8 v57 = 0;
  if (a1 && a2)
  {
    int v9 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)a2 + 152LL))(a2, &v57);
    sub_F9C8();
    uint64_t v10 = (os_log_s *)qword_28148;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 496;
        __int16 v62 = 1024;
        int v63 = v9;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::FindPipes: failed (0x%x)",  buf,  0x18u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 464;
        __int16 v62 = 1024;
        int v63 = v57;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] USBMIDIDevice::FindPipes() -- interface has %d endpoints",  buf,  0x18u);
      }

      if (v57)
      {
        int v11 = 1;
        int v12 = 1;
        while (1)
        {
          WORD2(v56) = 0;
          BYTE6(v56) = -1;
          int v13 = sub_57F4(a1, v11, (uint64_t)&v56);
          sub_F9C8();
          uint64_t v14 = (os_log_s *)qword_28148;
          BOOL v15 = os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO);
          if (v13) {
            break;
          }
          if (v15)
          {
            *(_DWORD *)buf = 136315906;
            __int128 v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 469;
            __int16 v62 = 1024;
            int v63 = v56;
            __int16 v64 = 1024;
            int v65 = BYTE1(v56);
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%25s:%-5d      Got pipe 0x%x direction %d", buf, 0x1Eu);
          }

          unsigned __int8 v16 = v56;
          if (BYTE1(v56)) {
            unsigned __int8 v16 = v56 | 0x80;
          }
          for (uint64_t i = *a3; ; i += 8)
          {
            if (i == a3[1])
            {
              HIBYTE(v56) = 0;
              goto LABEL_19;
            }

            if (i[2] == v16 || i[3] == v16) {
              break;
            }
          }

          int v31 = i[4];
          HIBYTE(v56) = v31;
          if (v31 <= 1)
          {
            if (v31)
            {
              sub_F9C8();
              uint64_t v32 = qword_28148;
              if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
              {
                if (BYTE1(v56)) {
                  int v33 = v56 | 0x80;
                }
                else {
                  int v33 = v56;
                }
                *(_DWORD *)buf = 136316162;
                __int128 v59 = "USBMIDIDevice.cpp";
                __int16 v60 = 1024;
                int v61 = 474;
                __int16 v62 = 1024;
                int v63 = v11;
                __int16 v64 = 1024;
                int v65 = v56;
                __int16 v66 = 1024;
                int v67 = v33;
                int v20 = (os_log_s *)v32;
                BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (MIDI-1UP)";
LABEL_24:
                _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, v21, buf, 0x24u);
                goto LABEL_25;
              }

              goto LABEL_25;
            }

LABEL_19:
            sub_F9C8();
            uint64_t v18 = qword_28148;
            if (!os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
            if (BYTE1(v56)) {
              int v19 = v56 | 0x80;
            }
            else {
              int v19 = v56;
            }
            *(_DWORD *)buf = 136316162;
            __int128 v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 472;
            __int16 v62 = 1024;
            int v63 = v11;
            __int16 v64 = 1024;
            int v65 = v56;
            __int16 v66 = 1024;
            int v67 = v19;
            int v20 = (os_log_s *)v18;
            BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (legacy MIDI 1.0)";
            goto LABEL_24;
          }

          if (v31 == 2)
          {
            sub_F9C8();
            uint64_t v46 = qword_28148;
            if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
            {
              if (BYTE1(v56)) {
                int v47 = v56 | 0x80;
              }
              else {
                int v47 = v56;
              }
              *(_DWORD *)buf = 136316162;
              __int128 v59 = "USBMIDIDevice.cpp";
              __int16 v60 = 1024;
              int v61 = 476;
              __int16 v62 = 1024;
              int v63 = v11;
              __int16 v64 = 1024;
              int v65 = v56;
              __int16 v66 = 1024;
              int v67 = v47;
              int v20 = (os_log_s *)v46;
              BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (MIDI 2.0)";
              goto LABEL_24;
            }
          }

          else if (v31 == 255)
          {
            sub_F9C8();
            uint64_t v44 = qword_28148;
            if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
            {
              if (BYTE1(v56)) {
                int v45 = v56 | 0x80;
              }
              else {
                int v45 = v56;
              }
              *(_DWORD *)buf = 136316162;
              __int128 v59 = "USBMIDIDevice.cpp";
              __int16 v60 = 1024;
              int v61 = 478;
              __int16 v62 = 1024;
              int v63 = v11;
              __int16 v64 = 1024;
              int v65 = v56;
              __int16 v66 = 1024;
              int v67 = v45;
              int v20 = (os_log_s *)v44;
              BOOL v21 = "%25s:%-5d      Found pipeIndex %d, pipeNum %d [ep 0x%00x] (Use MIDI-CI to discover protocol)";
              goto LABEL_24;
            }
          }

LABEL_25:
          if (BYTE1(v56) == 1)
          {
            int64x2_t v26 = a4[1];
            unint64_t v25 = (unint64_t)a4[2];
            if ((unint64_t)v26 >= v25)
            {
              uint64_t v39 = ((char *)v26 - (_BYTE *)*a4) >> 3;
              uint64_t v40 = v25 - (void)*a4;
              uint64_t v41 = v40 >> 2;
              else {
                unint64_t v42 = v41;
              }
              if (v42) {
                int v43 = (char *)sub_E18C((uint64_t)(a4 + 2), v42);
              }
              else {
                int v43 = 0LL;
              }
              unint64_t v52 = &v43[8 * v39];
              *(void *)unint64_t v52 = v56;
              uint64_t v27 = v52 + 8;
              uint64_t v54 = (char *)*a4;
              uint64_t v53 = (char *)a4[1];
              if (v53 != *a4)
              {
                do
                {
                  uint64_t v55 = *((void *)v53 - 1);
                  v53 -= 8;
                  *((void *)v52 - 1) = v55;
                  v52 -= 8;
                }

                while (v53 != v54);
                uint64_t v53 = (char *)*a4;
              }

              *a4 = v52;
              a4[1] = v27;
              a4[2] = &v43[8 * v42];
              if (v53) {
                operator delete(v53);
              }
            }

            else
            {
              *int64x2_t v26 = v56;
              uint64_t v27 = v26 + 1;
            }

            a4[1] = v27;
            goto LABEL_83;
          }

          if (!BYTE1(v56))
          {
            uint64_t v23 = a5[1];
            unint64_t v22 = (unint64_t)a5[2];
            if ((unint64_t)v23 >= v22)
            {
              uint64_t v34 = ((char *)v23 - (_BYTE *)*a5) >> 3;
              uint64_t v35 = v22 - (void)*a5;
              uint64_t v36 = v35 >> 2;
              else {
                unint64_t v37 = v36;
              }
              if (v37) {
                __int16 v38 = (char *)sub_E18C((uint64_t)(a5 + 2), v37);
              }
              else {
                __int16 v38 = 0LL;
              }
              __int16 v48 = &v38[8 * v34];
              *(void *)__int16 v48 = v56;
              unsigned __int8 v24 = v48 + 8;
              unint64_t v50 = (char *)*a5;
              uint64_t v49 = (char *)a5[1];
              if (v49 != *a5)
              {
                do
                {
                  uint64_t v51 = *((void *)v49 - 1);
                  v49 -= 8;
                  *((void *)v48 - 1) = v51;
                  v48 -= 8;
                }

                while (v49 != v50);
                uint64_t v49 = (char *)*a5;
              }

              *a5 = v48;
              a5[1] = v24;
              a5[2] = &v38[8 * v37];
              if (v49) {
                operator delete(v49);
              }
            }

            else
            {
              void *v23 = v56;
              unsigned __int8 v24 = v23 + 1;
            }

            a5[1] = v24;
            goto LABEL_83;
          }

          sub_F9C8();
          uint64_t v28 = qword_28148;
          if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            __int128 v59 = "USBMIDIDevice.cpp";
            __int16 v60 = 1024;
            int v61 = 487;
            __int16 v62 = 1024;
            int v63 = v11;
            __int16 v64 = 1024;
            int v65 = BYTE1(v56);
            uint64_t v29 = (os_log_s *)v28;
            uint64_t v30 = "%25s:%-5d [?]  Unknown direction for endpoint %d: %d";
LABEL_33:
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, v30, buf, 0x1Eu);
          }

LABEL_83:
          int v11 = ++v12;
        }

        if (!v15) {
          goto LABEL_83;
        }
        *(_DWORD *)buf = 136315906;
        __int128 v59 = "USBMIDIDevice.cpp";
        __int16 v60 = 1024;
        int v61 = 491;
        __int16 v62 = 1024;
        int v63 = v11;
        __int16 v64 = 1024;
        int v65 = v13;
        uint64_t v29 = v14;
        uint64_t v30 = "%25s:%-5d [?]  Couldn't get pipe for endpoint %d (0x%x)";
        goto LABEL_33;
      }
    }
  }

uint64_t sub_12B14(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = a1[10];
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(unsigned __int8 *)(a2 + 64);
  unsigned __int8 v10 = sub_12B8C(a1, v9);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)v7 + 168LL))( v7,  a1,  v6,  v8,  a3,  v9,  v10);
}

uint64_t sub_12B8C(void *a1, int a2)
{
  for (uint64_t i = (void *)a1[17]; i != (void *)a1[18]; ++i)
  {
  }

  for (uint64_t j = (void *)a1[20]; ; ++j)
  {
    if (j == (void *)a1[21]) {
      return 1LL;
    }
  }

  return HIBYTE(*j);
}

char *sub_12BEC(void *a1, int *a2, int a3)
{
  uint64_t result = (char *)(*(uint64_t (**)(void *))(*a1 + 112LL))(a1);
  if ((_DWORD)result)
  {
    uint64_t v29 = a1 + 43;
    int v30 = (*(uint64_t (**)(void))(a1[43] + 16LL))();
    uint64_t result = (char *)sub_12EC8(a1, a3);
    uint64_t v7 = result;
    uint64_t v8 = a1[24];
    int v9 = a3;
    if (*a2 >= 1)
    {
      unint64_t v10 = (unint64_t)(a2 + 1);
      unsigned int v11 = *a2 + 1;
      do
      {
        uint64_t v36 = 0LL;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 __dst = 0u;
        uint64_t v12 = *(void *)v10;
        size_t v13 = *(unsigned __int16 *)(v10 + 8);
        if (v13 > 0x40)
        {
          uint64_t v14 = malloc(*(unsigned __int16 *)(v10 + 8));
          memcpy(v14, (const void *)(v10 + 10), v13);
        }

        else
        {
          memcpy(&__dst, (const void *)(v10 + 10), *(unsigned __int16 *)(v10 + 8));
          uint64_t v14 = 0LL;
        }

        __int128 v35 = __PAIR64__(v9, a3);
        LOBYTE(v36) = v7[6];
        uint64_t result = (char *)operator new(0x80uLL);
        *(_OWORD *)(result + 104) = v35;
        __int128 v15 = v33;
        *(_OWORD *)(result + 88) = v34;
        *(_OWORD *)(result + 72) = v15;
        __int128 v16 = v32;
        *(_OWORD *)(result + 40) = __dst;
        *((void *)result + 1) = a1 + 54;
        *((void *)result + 2) = v12;
        *((_DWORD *)result + 6) = v13;
        *((_DWORD *)result + 7) = 0;
        *((void *)result + 4) = v14;
        *((void *)result + 15) = v36;
        *(_OWORD *)(result + 56) = v16;
        uint64_t v17 = a1[54];
        *(void *)uint64_t result = v17;
        *(void *)(v17 + 8) = result;
        a1[54] = result;
        ++a1[56];
        unint64_t v10 = (v10 + *(unsigned __int16 *)(v10 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
        --v11;
      }

      while (v11 > 1);
    }

    uint64_t v19 = a1[20];
    uint64_t v18 = a1[21];
    uint64_t v20 = v18 - v19;
    if (v18 == v19) {
      goto LABEL_16;
    }
    uint64_t v21 = 0LL;
    unint64_t v22 = v20 >> 3;
    if (v22 <= 1) {
      unint64_t v22 = 1LL;
    }
    uint64_t v23 = (unsigned __int8 *)(v19 + 6);
    while (1)
    {
      int v24 = *v23;
      v23 += 8;
      if (v22 == ++v21) {
        goto LABEL_16;
      }
    }

    if ((v21 & 0x80000000) != 0) {
LABEL_16:
    }
      __assert_rtn("Send", "USBMIDIDevice.cpp", 555, "currentBufferIndex >= 0");
    uint64_t v25 = a1[40];
    uint64_t v26 = *(void *)(v25 + 16LL * v21);
    if (v26 && !*(_BYTE *)(v26 + 44) && !*((_BYTE *)a1 + 488))
    {
      *((_BYTE *)a1 + 488) = 1;
      uint64_t v27 = a1[60];
      uint64_t v28 = mach_absolute_time();
      uint64_t result = (char *)MIDITimerTaskSetNextWakeTime(v27, v28 + 7200);
    }

    if (v30) {
      return (char *)(*(uint64_t (**)(void *))(*v29 + 24LL))(v29);
    }
  }

  return result;
}

void sub_12E84( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_29BC(exception_object);
}

unsigned __int8 *sub_12EC8(void *a1, int a2)
{
  uint64_t v2 = a1[24];
  if ((int)((unint64_t)(a1[25] - v2) >> 3) > a2
    && (v3 = v2 + 8LL * a2, int v4 = *(unsigned __int8 *)(v3 + 3), *(_BYTE *)(v3 + 3))
    && (v5 = (unsigned __int8 *)a1[20], (uint64_t v6 = a1[21] - (void)v5) != 0))
  {
    unint64_t v7 = v6 >> 3;
    if (v7 <= 1) {
      unint64_t v7 = 1LL;
    }
    while (*v5 != v4)
    {
      v5 += 8;
      if (!--v7) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    int v5 = (unsigned __int8 *)a1[20];
  }

  return v5;
}

void sub_12F3C(uint64_t a1, int *a2, int a3)
{
  uint64_t v6 = sub_12EC8((void *)a1, a3);
  int v7 = v6[7];
  if (!v6[7])
  {
    if (a3 == 255) {
      return;
    }
    uint64_t v41 = *(void *)(a1 + 224);
    if (!v41) {
      return;
    }
LABEL_48:
    *(_DWORD *)(a1 + 220) = a3;
    (*(void (**)(uint64_t, int *))(*(void *)v41 + 16LL))(v41, a2);
    return;
  }

  int v8 = *a2;
  if (v7 != 2 && v8 == 2)
  {
    uint64_t v41 = *(void *)(a1 + 240);
    if (!v41) {
      return;
    }
    goto LABEL_48;
  }

  if (v7 == 2 && v8 == 1)
  {
    uint64_t v41 = *(void *)(a1 + 256);
    if (!v41) {
      return;
    }
    goto LABEL_48;
  }

  unsigned int v11 = v6;
  if (a3 != 255)
  {
    int v12 = a2[1];
    if (v12)
    {
      size_t v13 = a2 + 2;
      do
      {
        uint64_t v14 = v13[2];
        if ((_DWORD)v14)
        {
          __int128 v15 = v13 + 3;
          uint64_t v16 = (uint64_t)&v13[v14 + 3];
          do
          {
            unint64_t v17 = *v15;
            unint64_t v18 = v17 >> 28;
            if (*v15 >> 28) {
              BOOL v19 = (_DWORD)v18 == 15;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19) {
              *__int128 v15 = v17 & 0xF0FFFFFF | ((a3 & 0xF) << 24);
            }
            v15 += byte_1FC15[v18];
          }

          while (v15 != (_DWORD *)v16);
          uint64_t v20 = v13[2];
        }

        else
        {
          uint64_t v20 = 0LL;
        }

        v13 += v20 + 3;
        --v12;
      }

      while (v12);
    }
  }

  uint64_t v21 = a1 + 344;
  int v22 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 344) + 16LL))(a1 + 344);
  int v23 = v22;
  uint64_t v24 = *(void *)(a1 + 192);
  int v25 = a3;
  int v26 = v11[6];
  int v27 = a2[1];
  if (v27)
  {
    int v28 = v22;
    uint64_t v29 = (unsigned int *)(a2 + 2);
    do
    {
      if (!v29[2]) {
        break;
      }
      sub_173E4((uint64_t)buf, v29, a3, v25, v26);
      unint64_t v30 = *(void *)(a1 + 464);
      if (v30 >= *(void *)(a1 + 472))
      {
        uint64_t v33 = sub_17648((uint64_t *)(a1 + 456), (uint64_t)buf);
      }

      else
      {
        uint64_t v31 = sub_17778(v30, (unsigned int *)buf);
        uint64_t v32 = v51[0];
        *(void *)(v31 + 285) = *(void *)((char *)v51 + 5);
        *(void *)(v31 + 280) = v32;
        uint64_t v33 = v31 + 296;
      }

      *(void *)(a1 + 464) = v33;
      sub_E740(v33 - 296);
      sub_E7D0((uint64_t)buf);
      v29 += v29[2] + 3;
      --v27;
    }

    while (v27);
    int v26 = v11[6];
    int v23 = v28;
    uint64_t v21 = a1 + 344;
  }

  uint64_t v35 = *(void *)(a1 + 160);
  uint64_t v34 = *(void *)(a1 + 168);
  uint64_t v36 = v34 - v35;
  if (v34 == v35) {
    goto LABEL_41;
  }
  uint64_t v37 = 0LL;
  unint64_t v38 = v36 >> 3;
  if (v38 <= 1) {
    unint64_t v38 = 1LL;
  }
  uint64_t v39 = (unsigned __int8 *)(v35 + 6);
  while (1)
  {
    int v40 = *v39;
    v39 += 8;
    if (v40 == v26) {
      break;
    }
    if (v38 == ++v37) {
      goto LABEL_41;
    }
  }

  if ((v37 & 0x80000000) != 0) {
LABEL_41:
  }
    __assert_rtn("SendPackets", "USBMIDIDevice.cpp", 626, "currentBufferIndex >= 0");
  uint64_t v42 = *(void *)(a1 + 320);
  uint64_t v43 = *(void *)(v42 + 16LL * v37);
  if (v43)
  {
    if (!*(_BYTE *)(v43 + 44) && !*(_BYTE *)(a1 + 488))
    {
      *(_BYTE *)(a1 + 488) = 1;
      uint64_t v44 = *(void *)(a1 + 480);
      uint64_t v45 = mach_absolute_time();
      MIDITimerTaskSetNextWakeTime(v44, v45 + 7200);
    }
  }

  else
  {
    sub_F9C8();
    uint64_t v46 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v48 = "USBMIDIDevice.cpp";
      __int16 v49 = 1024;
      int v50 = 629;
      _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] USBMIDIDevice::SendPackets() - buffer not found",  buf,  0x12u);
    }
  }

  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v21 + 24LL))(v21);
  }
}

void sub_1330C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_29BC(exception_object);
}

uint64_t sub_13360(uint64_t a1, uint64_t a2)
{
  int v4 = (unsigned int *)(a2 + 8);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  *(_BYTE *)(a2 + 44) = 1;
  uint64_t v6 = *(unsigned __int8 *)(a2 + 64);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void, void, void (*)(uint64_t, int, unint64_t), uint64_t))(**(void **)(a1 + 104) + 264LL))( *(void *)(a1 + 104),  v6,  *(void *)(a2 + 24),  *(unsigned int *)(a2 + 40),  sub_13420,  a2);
  if ((_DWORD)result == -536854449 || (_DWORD)result == -536870163) {
    return (*(uint64_t (**)(void, uint64_t, void, void, void (*)(uint64_t, int, unint64_t), uint64_t))(**(void **)(a1 + 104) + 264LL))( *(void *)(a1 + 104),  v6,  *(void *)(a2 + 24),  *(unsigned int *)(a2 + 40),  sub_13420,  a2);
  }
  return result;
}

void sub_13420(uint64_t a1, int a2, unint64_t a3)
{
  *(_BYTE *)(a1 + 44) = 0;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  unint64_t v18 = 0LL;
  unsigned int v5 = *(std::__shared_weak_count **)(a1 + 56);
  if (!v5) {
    goto LABEL_23;
  }
  unint64_t v18 = std::__shared_weak_count::lock(v5);
  if (!v18) {
    goto LABEL_23;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v8 || a2 == -536870165 || *(_BYTE *)(v8 + 184)) {
    goto LABEL_23;
  }
  if (!a2)
  {
    *(_BYTE *)(v8 + 185) = 1;
    if (a3 < 5)
    {
      if (*(_BYTE *)(v8 + 188))
      {
LABEL_22:
        (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 64LL))(v8, a1);
        goto LABEL_23;
      }
    }

    else if (*(_BYTE *)(v8 + 188))
    {
      int v9 = *(unsigned __int8 *)(a1 + 64);
      unint64_t v10 = *(uint64_t **)(v8 + 112);
      unsigned int v11 = *(uint64_t **)(v8 + 120);
      if (v10 != v11)
      {
        while (*(unsigned __int8 *)(*v10 + 46) != v9)
        {
          v10 += 2;
          if (v10 == v11) {
            goto LABEL_20;
          }
        }
      }

      if (v11 == v10)
      {
LABEL_20:
        sub_F9C8();
        int v12 = (os_log_s *)qword_28148;
        if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = "USBMIDIDevice.cpp";
          __int16 v21 = 1024;
          int v22 = 694;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d [!] No negotiator for pipeIndex %d", buf, 0x18u);
        }
      }

      else
      {
        sub_1A82C(*v10, a1, a3);
      }

      goto LABEL_22;
    }

    (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v8 + 80LL))(v8, a1, a3);
    goto LABEL_22;
  }

  if (a2 == -536870163
    && !(*(unsigned int (**)(void, uint64_t))(**(void **)(v8 + 104) + 224LL))(*(void *)(v8 + 104), v4))
  {
    goto LABEL_22;
  }

LABEL_23:
  size_t v13 = (unsigned int *)(a1 + 8);
  do
  {
    unsigned int v14 = __ldaxr(v13);
    unsigned int v15 = v14 - 1;
  }

  while (__stlxr(v15, v13));
  if (!v15) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  }
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

void sub_13664( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v11 = v9 + 2;
  do
  {
    unsigned int v12 = __ldaxr(v11);
    unsigned int v13 = v12 - 1;
  }

  while (__stlxr(v13, v11));
  if (!v13) {
    (*(void (**)(unsigned int *))(*(void *)v9 + 16LL))(v9);
  }
  sub_179B0((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_136BC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 491) || (uint64_t v2 = *(void *)(a1 + 456), v2 == *(void *)(a1 + 464)))
  {
    if (!*(void *)(a1 + 448)) {
      return;
    }
    int v4 = 0;
    uint64_t v3 = (unsigned __int8 *)(*(void *)(a1 + 440) + 120LL);
  }

  else
  {
    uint64_t v3 = (unsigned __int8 *)(v2 + 292);
    int v4 = 1;
  }

  uint64_t v5 = *v3;
  unsigned __int8 v6 = sub_12B8C((void *)a1, *v3);
  uint64_t v8 = *(void *)(a1 + 160);
  uint64_t v7 = *(void *)(a1 + 168);
  uint64_t v9 = v7 - v8;
  if (v7 == v8) {
    goto LABEL_12;
  }
  uint64_t v10 = 0LL;
  unint64_t v11 = v9 >> 3;
  if (v11 <= 1) {
    unint64_t v11 = 1LL;
  }
  unsigned int v12 = (unsigned __int8 *)(v8 + 6);
  while (1)
  {
    int v13 = *v12;
    v12 += 8;
    if (v13 == (_DWORD)v5) {
      break;
    }
    if (v11 == ++v10) {
      goto LABEL_12;
    }
  }

  if ((v10 & 0x80000000) != 0) {
LABEL_12:
  }
    sub_1DD78();
  uint64_t v14 = *(void *)(a1 + 320);
  uint64_t v15 = *(void *)(v14 + 16LL * v10);
  if (!v15)
  {
    sub_F9C8();
    uint64_t v22 = qword_28148;
    if (!os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v31 = 136315650;
    uint64_t v32 = "USBMIDIDevice.cpp";
    __int16 v33 = 1024;
    int v34 = 723;
    __int16 v35 = 1024;
    int v36 = v5;
    __int16 v23 = "%25s:%-5d [!] USBMIDIDevice::DoWrite() - Buffer not found for pipeIndex = %d";
    int v24 = (os_log_s *)v22;
    uint32_t v25 = 24;
    goto LABEL_37;
  }

  uint64_t v16 = 176LL;
  if (v4)
  {
    uint64_t v16 = 184LL;
    uint64_t v17 = a1 + 456;
  }

  else
  {
    uint64_t v17 = a1 + 432;
  }

  uint64_t v18 = (*(uint64_t (**)(void, uint64_t, uint64_t, void, void, void))(**(void **)(a1 + 80) + v16))( *(void *)(a1 + 80),  a1,  v17,  *(void *)(v15 + 24),  *(unsigned int *)(v15 + 40),  v6);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)(a1 + 160);
    uint64_t v21 = *(void *)(a1 + 168);
    if (v20 != v21)
    {
      while (*(unsigned __int8 *)(v20 + 6) != (_DWORD)v5)
      {
        v20 += 8LL;
        if (v20 == v21) {
          goto LABEL_35;
        }
      }
    }

    if (v20 != v21)
    {
      int v26 = (unsigned int *)(v15 + 8);
      do
        unsigned int v27 = __ldaxr(v26);
      while (__stlxr(v27 + 1, v26));
      *(_BYTE *)(v15 + 44) = 1;
      int v28 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 104) + 272LL))( *(void *)(a1 + 104),  v5,  *(void *)(v15 + 24),  v18,  sub_139C0,  v15);
      if (v28 == -536854449 || v28 == -536870163) {
        (*(void (**)(void, uint64_t, void, uint64_t, void (*)(uint64_t, int), uint64_t))(**(void **)(a1 + 104) + 272LL))( *(void *)(a1 + 104),  v5,  *(void *)(v15 + 24),  v19,  sub_139C0,  v15);
      }
      return;
    }

LABEL_35:
    sub_F9C8();
    uint64_t v30 = qword_28148;
    if (!os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v31 = 136315394;
    uint64_t v32 = "USBMIDIDevice.cpp";
    __int16 v33 = 1024;
    int v34 = 758;
    __int16 v23 = "%25s:%-5d [!] USBMIDIDevice::DoWrite() - Missing pipe for queued element";
    int v24 = (os_log_s *)v30;
    uint32_t v25 = 18;
LABEL_37:
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v31, v25);
  }

void sub_139C0(uint64_t a1, int a2)
{
  uint64_t v15 = 0LL;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3 && (uint64_t v15 = std::__shared_weak_count::lock(v3)) != 0LL)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    *(_BYTE *)(a1 + 44) = 0;
    if (v14)
    {
      int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(v14 + 344) + 16LL))(v14 + 344);
      if (a2) {
        (*(void (**)(void, void))(**(void **)(v14 + 104) + 360LL))( *(void *)(v14 + 104),  *(unsigned __int8 *)(a1 + 64));
      }
      else {
        *(_BYTE *)(v14 + 186) = 1;
      }
      uint64_t v9 = (unsigned int *)(a1 + 8);
      do
      {
        unsigned int v10 = __ldaxr(v9);
        unsigned int v11 = v10 - 1;
      }

      while (__stlxr(v11, v9));
      if (!v11) {
        (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
      }
      if (!a2 && !*(_BYTE *)(v14 + 184)) {
        (*(void (**)(uint64_t))(*(void *)v14 + 72LL))(v14);
      }
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)(v14 + 344) + 24LL))(v14 + 344);
      }
      goto LABEL_21;
    }
  }

  else
  {
    *(_BYTE *)(a1 + 44) = 0;
  }

  unsigned __int8 v6 = (unsigned int *)(a1 + 8);
  do
  {
    unsigned int v7 = __ldaxr(v6);
    unsigned int v8 = v7 - 1;
  }

  while (__stlxr(v8, v6));
  if (!v8) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  }
LABEL_21:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

void sub_13B30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_13B68(uint64_t a1, int a2)
{
  uint64_t v3 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_DEBUG))
  {
    int v4 = "false";
    *(_DWORD *)buf = 136315650;
    int v24 = "USBMIDIDevice.cpp";
    if (a2) {
      int v4 = "true";
    }
    __int16 v25 = 1024;
    int v26 = 897;
    __int16 v27 = 2080;
    *(void *)int v28 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] USBMIDIDevice::ReconstructPortMapList(forUMP = %s)",  buf,  0x1Cu);
  }

  *(void *)(a1 + 200) = *(void *)(a1 + 192);
  int v5 = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8)) - *(unsigned __int8 *)(a1 + 189);
  if (v5 >= 1)
  {
    ItemCount v6 = 0LL;
    uint64_t v20 = v5;
    do
    {
      SInt32 outValue = 0;
      MIDIObjectRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), v6);
      if (MIDIObjectGetIntegerProperty(Entity, @"Cable", &outValue)) {
        uint8_t v8 = v6;
      }
      else {
        uint8_t v8 = outValue;
      }
      else {
        uint8_t v9 = outValue;
      }
      else {
        uint8_t v10 = outValue;
      }
      else {
        unsigned __int8 v11 = 0;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Group Terminal Block ID", &outValue)) {
        unsigned __int8 v12 = 0;
      }
      else {
        unsigned __int8 v12 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"First Group", &outValue)) {
        char v13 = 0;
      }
      else {
        char v13 = outValue;
      }
      if (MIDIObjectGetIntegerProperty(Entity, @"Number of Groups", &outValue)) {
        unsigned __int8 v14 = 0;
      }
      else {
        unsigned __int8 v14 = outValue;
      }
      sub_F9C8();
      uint64_t v15 = (os_log_s *)qword_28148;
      if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136317186;
        int v24 = "USBMIDIDevice.cpp";
        __int16 v25 = 1024;
        int v26 = 923;
        __int16 v27 = 1024;
        *(_DWORD *)int v28 = v6;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&_BYTE v28[6] = v8;
        __int16 v29 = 1024;
        int v30 = v9;
        __int16 v31 = 1024;
        int v32 = v10;
        __int16 v33 = 1024;
        int v34 = v11;
        __int16 v35 = 1024;
        int v36 = v12;
        __int16 v37 = 1024;
        int v38 = v14;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      MIDIPortMap(entity %d, cable %d, inEP 0x%x, outEP 0x%x, protocol %d, gtbID %d, numGroups %d => mMapList",  buf,  0x3Cu);
      }

      buf[0] = v6;
      buf[1] = v8;
      buf[2] = v9;
      buf[3] = v10;
      LOBYTE(v24) = v11;
      BYTE1(v24) = v13;
      BYTE2(v24) = v14;
      BYTE3(v24) = v12;
      uint64_t v16 = *(_BYTE **)(a1 + 200);
      if ((unint64_t)v16 >= *(void *)(a1 + 208))
      {
        uint64_t v17 = sub_E2BC((uint64_t *)(a1 + 192), buf);
      }

      else
      {
        _BYTE *v16 = v6;
        v16[1] = v8;
        char v16[2] = v9;
        char v16[3] = v10;
        v16[4] = v11;
        v16[5] = v13;
        v16[6] = v14;
        uint64_t v17 = (uint64_t)(v16 + 8);
        v16[7] = v12;
      }

      *(void *)(a1 + 200) = v17;
      ++v6;
    }

    while (v20 != v6);
  }

  sub_F9C8();
  uint64_t v18 = (os_log_s *)qword_28148;
  if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = (uint64_t)(*(void *)(a1 + 200) - *(void *)(a1 + 192)) >> 3;
    *(_DWORD *)buf = 136315650;
    int v24 = "USBMIDIDevice.cpp";
    __int16 v25 = 1024;
    int v26 = 926;
    __int16 v27 = 2048;
    *(void *)int v28 = v19;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [-] USBMIDIDevice::ReconstructPortMapList() - %lu port map(s) created",  buf,  0x1Cu);
  }

BOOL sub_13F54(uint64_t a1)
{
  return *(void *)(a1 + 136) != *(void *)(a1 + 144);
}

BOOL sub_13F64(uint64_t a1)
{
  return *(void *)(a1 + 160) != *(void *)(a1 + 168);
}

void *sub_13F74(void *a1)
{
  *a1 = off_24A60;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_13FB8(void *a1)
{
  *a1 = off_24A60;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_13FFC(uint64_t *a1, _DWORD *a2)
{
  uint64_t v7 = a1[1];
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v8, a1 + 2);
  int v9 = 0;
  v8[6] = &v10;
  if (*a2 == 2)
  {
    v5[0] = a1;
    v5[1] = &v7;
    ItemCount v6 = v5;
    sub_14880((uint64_t)a2, (uint64_t **)&v6);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    ItemCount v6 = (uint64_t **)&v7;
    v5[0] = (uint64_t *)&v6;
    sub_1412C((uint64_t)a2, v5);
  }

  return sub_1509C((uint64_t)&v7);
}

void sub_140DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_140FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

uint64_t sub_1412C(uint64_t result, uint64_t **a2)
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
      uint64_t result = sub_141F8(v11, &v10, &v8);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v13 = v10;
          v12[0] = *v7;
          v12[1] = (uint64_t)&v13;
          sub_142A4((unsigned __int16 *)&v8, v12);
          uint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
          uint64_t result = sub_141F8(v11, &v10, &v8);
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

uint64_t sub_141F8(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_1FB58[v7 >> 28];
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

unsigned __int16 *sub_142A4(unsigned __int16 *result, uint64_t *a2)
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
        uint64_t result = (unsigned __int16 *)sub_146E0(v7, v25, (char *)&__src, v6);
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
      __int16 v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        int v24 = &__src;
      }

      else
      {
        int v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        __int16 v23 = (unsigned __int8 *)result + v22 + 11;
      }

      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }

        uint64_t result = (unsigned __int16 *)sub_146E0(v7, v25, (char *)&__src, v6);
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
      __int16 v23 = (unsigned __int8 *)result + v22 + 10;
      if (v16 == 12582912)
      {
        int v24 = &__src;
      }

      else
      {
        int v24 = (unsigned __int8 *)&v34;
        unsigned __int8 *v23 = __src;
        __int16 v23 = (unsigned __int8 *)result + v22 + 11;
      }

      unsigned __int8 *v23 = *v24;
      v23[1] = v24[1];
      result[4] += v17;
      goto LABEL_49;
    }

LABEL_33:
    uint64_t result = (unsigned __int16 *)sub_146E0(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_28070[v5];
      if (byte_28070[v5])
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
            uint64_t result = (unsigned __int16 *)sub_146E0(v7, v8, (char *)&__src, v6);
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

    uint64_t result = (unsigned __int16 *)sub_146E0(*a2, v19, (char *)&__src, v17);
LABEL_49:
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_28070[v5];
      if (byte_28070[v5])
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
            uint64_t result = (unsigned __int16 *)sub_146E0(v7, v8, (char *)&__src, v6);
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

            uint64_t result = *(__n128 *)v9;
            *((_OWORD *)v1 + 1) = *(_OWORD *)v9;
            return result;
        }
      }
    }

    else if (v3 == 11)
    {
      int v5 = (__n128 *)a1[2];
      if ((v5->n128_u32[0] & 0xF00000) == 0xB00000)
      {
        size_t v6 = BYTE1(v5->n128_u32[0]);
        if ((v6 - 98) < 4 || (v6 != 32 ? (uint64_t v7 = v6 == 0) : (uint64_t v7 = 1), v7))
        {
          uint64_t result = *v5;
          *(__n128 *)uint64_t v1 = *v5;
        }
      }
    }
  }

  return result;
}

            uint64_t result = *(__n128 *)v9;
            *((_OWORD *)v1 + 1) = *(_OWORD *)v9;
            return result;
        }
      }
    }

    else if (v3 == 11)
    {
      int v5 = (__n128 *)a1[2];
      if ((v5->n128_u32[0] & 0xF00000) == 0xB00000)
      {
        size_t v6 = BYTE1(v5->n128_u32[0]);
        if ((v6 - 98) < 4 || (v6 != 32 ? (uint64_t v7 = v6 == 0) : (uint64_t v7 = 1), v7))
        {
          uint64_t result = *v5;
          *(__n128 *)uint64_t v1 = *v5;
        }
      }
    }
  }

  return result;
}

uint64_t sub_146E0(uint64_t a1, uint64_t a2, char *a3, size_t a4)
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
    sub_14858(&v15, 0LL);
    uint64_t v8 = a1 + 68;
    *(void *)(a1 + 56) = a1 + 68;
    *(_DWORD *)(a1 + 64) = 0;
    sub_14858(&v15, 0LL);
  }

  return v8;
}

void sub_14840( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_14858(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  *uint64_t result = a2;
  if (v3) {
    return (uint64_t *)MIDI::LegacyPacketListDeleter::operator()();
  }
  return result;
}

uint64_t sub_14880(uint64_t result, uint64_t **a2)
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
      uint64_t result = sub_141F8(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          *(void *)&__int128 v13 = v7[1];
          *((void *)&v13 + 1) = &v14;
          sub_14950((unsigned __int16 *)(v8 + 64), (unsigned __int16 *)&v9, &v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t result = sub_141F8(v12, &v11, &v9);
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

unsigned __int16 *sub_14950(unsigned __int16 *result, unsigned __int16 *a2, __int128 *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    __int128 v29 = *a3;
    uint64_t v5 = a2;
    return sub_14C60(v5, (uint64_t *)&v29);
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
        sub_14C60((unsigned __int16 *)v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = (v20 | v14) - 256;
        __int128 v29 = *a3;
        sub_14C60((unsigned __int16 *)v27, (uint64_t *)&v29);
        *char v12 = v16;
        int v21 = (char *)v10 + 3 * v11;
        v21[1] = v26;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)int v27 = v18 | (v7 >> 25) | 0x600;
        __int128 v29 = *a3;
        uint64_t result = sub_14C60((unsigned __int16 *)v27, (uint64_t *)&v29);
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
          sub_14C60((unsigned __int16 *)v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)int v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          __int128 v29 = *a3;
          sub_14C60((unsigned __int16 *)v27, (uint64_t *)&v29);
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
        return sub_14C60(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }

  return result;
}

unsigned __int16 *sub_14C60(unsigned __int16 *result, uint64_t *a2)
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

uint64_t sub_1509C(uint64_t a1)
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

void *sub_1510C(void *a1)
{
  *a1 = off_24A90;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_15150(void *a1)
{
  *a1 = off_24A90;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_15194(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 2)
  {
    uint64_t v7 = *(_DWORD **)(a1 + 8);
    (*((void (**)(void *, uint64_t))v7 + 1))(v8, a1 + 16);
    void v8[7] = 1LL;
    v8[6] = &v9;
    v5[0] = a1;
    v5[1] = &v7;
    size_t v6 = v5;
    sub_153A8((uint64_t)a2, &v6);
    return sub_15B08((uint64_t)&v7);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    uint64_t v7 = a2;
    return (**(uint64_t (***)(uint64_t, _DWORD **))(a1 + 8))(a1 + 16, &v7);
  }

void sub_15274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_15290(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 8);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v6, a1 + 16);
  uint64_t v7 = v5;
  (*(void (**)(void *, _BYTE *))(v5 + 8))(v8, v6);
  void v8[7] = 1LL;
  v8[6] = &v9;
  unsigned int v4 = (unsigned int *)&v7;
  sub_15B78(a2, &v4);
  sub_15B08((uint64_t)&v7);
  return (*(uint64_t (**)(_BYTE *))(v5 + 24))(v6);
}

void sub_15360( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    sub_29BC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_153A8(uint64_t result, uint64_t **a2)
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
      uint64_t result = sub_141F8(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          uint64_t v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          v13[0] = v7[1];
          v13[1] = &v14;
          sub_15478((unsigned int *)(v8 + 64), (int *)&v9, (uint64_t)v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          uint64_t result = sub_141F8(v12, &v11, &v9);
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

unsigned int *sub_15478(unsigned int *result, int *__src, uint64_t a3)
{
  unint64_t v3 = *__src;
  if (v3 >> 28 == 4)
  {
    unsigned int v5 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v6 = __src[1];
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        uint64_t v9 = &result[12 * (BYTE3(v3) & 0xF)];
        uint64_t v10 = (v3 >> 16) & 0xF;
        uint64_t v11 = (unsigned __int8 *)v9 + 3 * v10;
        unsigned int v12 = (v3 >> 8) & 0x7F;
        int v13 = *__src & 0x7F;
        int v14 = (v6 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v15 = 2;
        }
        else {
          int v15 = 1;
        }
        if (v15 == *v11 && v12 == v11[1])
        {
          int v16 = v10 | 0xB0;
          if (v13 == *((unsigned __int8 *)v9 + 3 * v10 + 2))
          {
            int v17 = (v5 << 24) | (v16 << 16);
            goto LABEL_20;
          }
        }

        else
        {
          int v16 = v10 | 0xB0;
        }

        if ((v3 & 0x100000) != 0) {
          int v18 = 25344;
        }
        else {
          int v18 = 25856;
        }
        int v26 = 0;
        *(_DWORD *)&__srca[8] = 0;
        int v17 = (v5 << 24) | (v16 << 16);
        int v19 = v17 | v18;
        char v24 = v12;
        *(void *)char __srca = v17 | v18 | v12;
        sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        int v26 = 0;
        *(_DWORD *)&__srca[8] = 0;
        *(void *)char __srca = (v19 | v13) - 256;
        sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        unsigned __int8 *v11 = v15;
        unint64_t v20 = (char *)v9 + 3 * v10;
        v20[1] = v24;
        v20[2] = v13;
LABEL_20:
        int v26 = 0;
        *(_DWORD *)&__srca[8] = 0;
        *(void *)char __srca = v17 | (v6 >> 25) | 0x600;
        uint64_t result = sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        if (v14)
        {
          int v26 = 0;
          *(void *)&__srca[4] = 0LL;
          int v8 = v14 | v17 | 0x2600;
          goto LABEL_28;
        }

        break;
      case 8:
      case 9:
      case 10:
      case 11:
        unsigned int v7 = BYTE2(v3) >> 4 == 9;
        if (v6 >> 25) {
          unsigned int v7 = v6 >> 25;
        }
        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = v7 | (BYTE2(v3) << 16) | (v5 << 24) | v3 & 0x7F00;
        goto LABEL_28;
      case 12:
        if ((v3 & 1) != 0)
        {
          int v26 = 0;
          *(_DWORD *)&__srca[8] = 0;
          unsigned int v21 = v5 << 24;
          int v22 = BYTE2(v3) << 16;
          int v23 = (v22 - 0x100000) | (v5 << 24);
          *(void *)char __srca = (v22 - 0x100000) & 0xFFFFFF80 | (v5 << 24) | (v6 >> 8) & 0x7F;
          sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
          int v26 = 0;
          *(_DWORD *)&__srca[8] = 0;
          *(void *)char __srca = v23 & 0xFFFFFF80 | v6 & 0x7F | 0x2000;
          sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
        }

        else
        {
          unsigned int v21 = v5 << 24;
          int v22 = BYTE2(v3) << 16;
        }

        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = HIWORD(v6) & 0x7F00 | v21 | v22;
        goto LABEL_28;
      case 13:
        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = (BYTE2(v3) << 16) | (v5 << 24) | (v6 >> 25 << 8);
        goto LABEL_28;
      case 14:
        int v26 = 0;
        *(void *)&__srca[4] = 0LL;
        int v8 = (v6 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v5 << 24) | (v6 >> 25);
LABEL_28:
        *(_DWORD *)char __srca = v8;
        return sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__srca);
      default:
        return result;
    }
  }

  return result;
}

unsigned int *sub_15788(unsigned int *result, uint64_t a2, int *__src)
{
  unint64_t v3 = result;
  unint64_t v4 = *__src;
  uint64_t v5 = byte_1FB58[v4 >> 28];
  unsigned int v6 = (unsigned int *)*((void *)result + 7);
  if (!byte_1FB58[v4 >> 28])
  {
    if (v6) {
      goto LABEL_47;
    }
    goto LABEL_38;
  }

  unint64_t v7 = (unint64_t)(result + 272);
  int v8 = v4 & 0xF0000000;
  unsigned int v9 = result[17];
  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    unsigned int v11 = v6[2];
    BOOL v12 = v11 >= 2;
    unsigned int v13 = v11 - 2;
    if (v12 && v6[3] >> 28 == 3)
    {
      unsigned int v14 = v6[v13 + 3];
      if (v14 >> 28 == 3) {
        int v15 = (v14 >> 20) & 0xF;
      }
      else {
        int v15 = 255;
      }
      if (v15) {
        BOOL v16 = v15 == 3;
      }
      else {
        BOOL v16 = 1;
      }
      char v17 = v16;
      int v18 = 1;
LABEL_27:
      if ((v4 & 0xF0E00000) != 0x30000000)
      {
        BOOL v19 = (v8 != 805306368) != v18 && *(void *)v6 == a2;
        if (v19 && (v17 & 1) == 0)
        {
LABEL_34:
          uint64_t v20 = v6[2];
LABEL_38:
          uint64_t result = (unsigned int *)sub_15958((uint64_t)result, a2, __src, v5);
          unsigned int v6 = result;
          goto LABEL_47;
        }
      }

      goto LABEL_36;
    }

LABEL_26:
    int v18 = 0;
    char v17 = 0;
    goto LABEL_27;
  }

  if (!v9) {
    goto LABEL_37;
  }
  if (v6) {
    goto LABEL_26;
  }
  if (v8 != 805306368) {
    goto LABEL_34;
  }
LABEL_36:
  v6 += v6[2] + 3;
LABEL_37:
  LODWORD(v20) = 0;
  result[17] = v9 + 1;
  *(void *)unsigned int v6 = a2;
  _BYTE v6[2] = 0;
LABEL_40:
  uint64_t result = &v6[v20 + 3];
  switch((int)v5)
  {
    case 1:
      goto LABEL_44;
    case 2:
      goto LABEL_43;
    case 3:
      goto LABEL_42;
    case 4:
      int v21 = *__src++;
      *uint64_t result = v21;
      uint64_t result = &v6[v20 + 4];
LABEL_42:
      int v22 = *__src++;
      *result++ = v22;
LABEL_43:
      int v23 = *__src++;
      *result++ = v23;
LABEL_44:
      *uint64_t result = *__src;
      break;
    default:
      uint64_t result = (unsigned int *)memmove(result, __src, 4 * v5);
      break;
  }

  v6[2] += v5;
LABEL_47:
  *((void *)v3 + 7) = v6;
  return result;
}

uint64_t sub_15958(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 68)) {
    goto LABEL_4;
  }
  uint64_t v17 = a1 + 64;
  (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v17);
  *(_DWORD *)(a1 + 68) = 0;
  uint64_t v8 = a1 + 72;
  if (!a4) {
    return v8;
  }
  if (v8 + 4 * a4 + 12 <= (unint64_t)(a1 + 1088))
  {
    *(_DWORD *)(a1 + 68) = 1;
    *(void *)(a1 + 72) = a2;
    *(_DWORD *)(a1 + 80) = 0;
    unsigned int v11 = (int *)(a1 + 84);
    int v12 = 0;
    switch((4 * a4) >> 2)
    {
      case 0LL:
        break;
      case 1LL:
        goto LABEL_12;
      case 2LL:
        goto LABEL_11;
      case 3LL:
        goto LABEL_10;
      case 4LL:
        int v13 = *a3++;
        unsigned int v11 = (int *)(a1 + 88);
        *(_DWORD *)(a1 + 84) = v13;
LABEL_10:
        int v14 = *a3++;
        *v11++ = v14;
LABEL_11:
        int v15 = *a3++;
        *v11++ = v15;
LABEL_12:
        int *v11 = *a3;
        int v12 = *(_DWORD *)(a1 + 80);
        break;
      default:
        memmove(v11, a3, 4 * a4);
        int v12 = 0;
        break;
    }

    *(_DWORD *)(a1 + 80) = v12 + a4;
  }

  else
  {
LABEL_4:
    MIDI::EventList::create(&v17, *(unsigned int *)(a1 + 64), a2, a3, a4);
    uint64_t v19 = v17;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v19);
    uint64_t v9 = v17;
    uint64_t v17 = 0LL;
    if (v9)
    {
      v18();
      uint64_t v10 = v17;
      uint64_t v8 = a1 + 72;
      *(void *)(a1 + 56) = a1 + 72;
      *(_DWORD *)(a1 + 68) = 0;
      uint64_t v17 = 0LL;
      if (v10) {
        v18();
      }
    }

    else
    {
      uint64_t v8 = a1 + 72;
      *(void *)(a1 + 56) = a1 + 72;
      *(_DWORD *)(a1 + 68) = 0;
    }
  }

  return v8;
}

void sub_15AE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void (*a11)(void))
{
  if (a10) {
    a11();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_15B08(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 68))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }

  *(_DWORD *)(a1 + 68) = 0;
  *(void *)(a1 + 56) = a1 + 72;
  (*(void (**)(uint64_t))(*(void *)a1 + 24LL))(a1 + 8);
  return a1;
}

uint64_t sub_15B78(uint64_t result, unsigned int **a2)
{
  if (*(_DWORD *)result)
  {
    uint64_t v3 = (unsigned int *)result;
    unsigned int v4 = 0;
    unint64_t v5 = result + 4;
    do
    {
      uint64_t v6 = *(unsigned __int16 *)(v5 + 8);
      v10[0] = v5 + 10;
      v10[1] = v6;
      v10[2] = *(void *)v5;
      void v10[3] = 0LL;
      uint64_t __src = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = sub_15C2C(v10, v9, &__src);
      if ((_DWORD)result)
      {
        do
        {
          sub_15788(*a2, *(uint64_t *)v9, (int *)&__src);
          uint64_t __src = 0LL;
          uint64_t v8 = 0LL;
          uint64_t result = sub_15C2C(v10, v9, &__src);
        }

        while ((result & 1) != 0);
      }

      unint64_t v5 = (v5 + *(unsigned __int16 *)(v5 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      ++v4;
    }

    while (v4 < *v3);
  }

  return result;
}

uint64_t sub_15C2C(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  unsigned int v6 = *(unsigned __int8 *)(*a1 + v4);
  if (*(char *)(*a1 + v4) < -16)
  {
LABEL_3:
    uint64_t v7 = 2LL;
    if ((v6 & 0xE0) != 0xC0) {
      uint64_t v7 = 3LL;
    }
    unint64_t v8 = v7 + v4;
    BOOL v9 = v7 + v4 > v3;
    BOOL v10 = v7 + v4 <= v3;
    if (!v9)
    {
      uint64_t v11 = v4 + v5;
      int v12 = *(_BYTE *)(v4 + v5 + 1) & 0x7F;
      if ((v6 & 0xE0) == 0xC0) {
        int v13 = 0;
      }
      else {
        int v13 = *(_BYTE *)(v11 + 2) & 0x7F;
      }
      *a3 = v13 | (v6 << 16) | (v12 << 8) | 0x20000000;
      *a2 = a1[2];
      unint64_t v3 = v8;
    }

    goto LABEL_19;
  }

LABEL_8:
  if (v6 < 0xF1)
  {
    if (v6 == 240) {
      int v18 = 1;
    }
    else {
      int v18 = 2;
    }
    if (v6 == 240) {
      a1[3] = ++v4;
    }
    unint64_t v19 = 0LL;
    int v20 = 0;
    int v21 = 0;
    while (1)
    {
      int v22 = (v4 < v3) | v20;
      if (v4 < v3 && (v20 & 1) == 0)
      {
        int v23 = *(char *)(v5 + v4);
        if ((v23 & 0x80000000) == 0)
        {
          if (v19 > 5)
          {
            int v22 = 0;
            goto LABEL_42;
          }

          int v22 = 0;
          a1[3] = ++v4;
          ++v21;
          goto LABEL_40;
        }

        if (v23 == -9) {
          a1[3] = ++v4;
        }
        if (v18 == 1) {
          int v18 = 0;
        }
        else {
          int v18 = 3;
        }
        int v22 = 1;
      }

      if (v19 <= 5)
      {
        LOBYTE(v23) = 0;
LABEL_40:
        v29[v19] = v23;
      }

void *sub_15E90(void *a1)
{
  *a1 = off_24AC0;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_15ED4(void *a1)
{
  *a1 = off_24AC0;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_15F18(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 2)
  {
    BOOL v10 = a2;
    return (**(uint64_t (***)(uint64_t, _DWORD **))(a1 + 8))(a1 + 16, &v10);
  }

  else
  {
    if (*a2 != 1) {
      std::terminate();
    }
    uint64_t v8 = 0LL;
    BOOL v10 = *(_DWORD **)(a1 + 8);
    (*((void (**)(void *, uint64_t))v10 + 1))(v11, a1 + 16);
    v11[7] = 2LL;
    v11[6] = &v12;
    uint64_t v5 = &v8;
    unsigned int v6 = (uint64_t *)a1;
    uint64_t v7 = &v10;
    BOOL v9 = &v5;
    sub_16284((uint64_t)a2, &v9);
    uint64_t v5 = (uint64_t *)&v10;
    unsigned int v6 = &v8;
    sub_16108((unsigned int *)(a1 + 64), (uint64_t)&v5);
    return sub_15B08((uint64_t)&v10);
  }

void sub_16020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

uint64_t sub_16040(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a1 + 8);
  (*(void (**)(void *, uint64_t))(v7 + 8))(v8, a1 + 16);
  void v8[7] = 2LL;
  v8[6] = &v9;
  v5[0] = a1;
  v5[1] = &v7;
  unsigned int v6 = v5;
  sub_169D0(a2, &v6);
  return sub_15B08((uint64_t)&v7);
}

void sub_160EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

unsigned int *sub_16108(unsigned int *result, uint64_t a2)
{
  unint64_t v3 = result;
  unint64_t v4 = *result;
  unsigned int v5 = v4 >> 28;
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v6 || (v4 & 0xFF0000) == 0;
  if (!v7 && (BYTE1(v4) | 0x20) == 0x26)
  {
    LODWORD(v20) = BYTE3(v4) & 0xF;
    if (v5 == 15) {
      uint64_t v20 = 255LL;
    }
    else {
      uint64_t v20 = v20;
    }
    *(void *)((char *)&result[32 * v20 + 8 + 2 * ((v4 >> 16) & 0xF)] + 1) = 0LL;
    *((_BYTE *)result + 32) = 1;
  }

  if (BYTE2(v4))
  {
    uint64_t v23 = 0LL;
    if (v5) {
      BOOL v8 = v5 == 15;
    }
    else {
      BOOL v8 = 1;
    }
    int v9 = v4 & 0xF000000 | 0x40000000;
    if (v8) {
      int v9 = -16777216;
    }
    int v21 = v9 | v4 & 0xFF00 | (BYTE2(v4) << 16);
    unsigned int v10 = v4;
    unsigned int v11 = (_DWORD)v4 << 25;
    if (v10 >= 0x41)
    {
      unsigned int v12 = (v10 & 0x3F) << 19;
      if (v12)
      {
        do
        {
          v11 |= v12;
          BOOL v13 = v12 > 0x3F;
          v12 >>= 6;
        }

        while (v13);
      }
    }

    unsigned int v22 = v11;
    uint64_t result = sub_15788(*(unsigned int **)a2, **(void **)(a2 + 8), &v21);
    unsigned int *v3 = 0;
  }

  unsigned int v14 = v3[4];
  if (BYTE2(v14))
  {
    uint64_t v23 = 0LL;
    if (v14 >> 28) {
      BOOL v15 = v14 >> 28 == 15;
    }
    else {
      BOOL v15 = 1;
    }
    int v16 = v14 & 0xF000000 | 0x40000000;
    if (v15) {
      int v16 = -16777216;
    }
    int v21 = v16 | v14 & 0xFF00 | (BYTE2(v14) << 16);
    unsigned int v17 = v14;
    unsigned int v18 = v14 << 25;
    if (v17 >= 0x41)
    {
      unsigned int v19 = (v17 & 0x3F) << 19;
      if (v19)
      {
        do
        {
          v18 |= v19;
          BOOL v13 = v19 > 0x3F;
          v19 >>= 6;
        }

        while (v13);
      }
    }

    unsigned int v22 = v18;
    uint64_t result = sub_15788(*(unsigned int **)a2, **(void **)(a2 + 8), &v21);
    v3[4] = 0;
  }

  return result;
}

uint64_t sub_16284(uint64_t result, void **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      uint64_t v6 = *(unsigned int *)(v5 + 8);
      v13[0] = v5 + 12;
      v13[1] = v6;
      void v13[2] = *(void *)v5;
      v13[3] = 0LL;
      uint64_t __src = 0LL;
      uint64_t v11 = 0LL;
      uint64_t result = sub_141F8(v13, &v12, &__src);
      if ((_DWORD)result)
      {
        do
        {
          BOOL v7 = (void **)*a2;
          int v9 = (void *)**a2;
          uint64_t v8 = (*a2)[1];
          *int v9 = v12;
          v14[0] = v7[2];
          v14[1] = v9;
          sub_1634C(v8 + 64, (unsigned int *)&__src, (uint64_t)v14);
          uint64_t __src = 0LL;
          uint64_t v11 = 0LL;
          uint64_t result = sub_141F8(v13, &v12, &__src);
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

void sub_1634C(uint64_t a1, unsigned int *__src, uint64_t a3)
{
  unsigned int v4 = *__src;
  if (*__src >> 28 == 2)
  {
    int v55 = 0;
    uint64_t v56 = 0LL;
    uint64_t v54 = BYTE2(v4);
    v51[0] = (unsigned int *)a1;
    v51[1] = (unsigned int *)&v54;
    v51[2] = __src;
    void v51[3] = (unsigned int *)&v53;
    v51[4] = (unsigned int *)&v52;
    int v6 = *(unsigned __int8 *)(a1 + 32);
    if (!v6) {
      sub_16814(v51);
    }
    uint64_t v7 = HIBYTE(v4) & 0xF;
    int v8 = HIBYTE(v4) & 0xF | 0x40;
    unsigned int v9 = *(_DWORD *)a1;
    int v10 = BYTE2(*(_DWORD *)a1);
    if (BYTE2(*(_DWORD *)a1) && v6)
    {
      *(_BYTE *)(a1 + 32) = 1;
      uint64_t v59 = 0LL;
      unsigned int __srca = v9 & 0xFF00 | (v10 << 16) & 0x80FFFFFF | ((HIBYTE(v4) & 0xF | 0x40) << 24);
      unsigned int v11 = v9;
      unsigned int v12 = v9 << 25;
      if (v11 >= 0x41)
      {
        unsigned int v13 = (v11 & 0x3F) << 19;
        if (v13)
        {
          do
          {
            v12 |= v13;
            BOOL v14 = v13 > 0x3F;
            v13 >>= 6;
          }

          while (v14);
        }
      }

      unsigned int v58 = v12;
      sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
      *(_DWORD *)a1 = 0;
      uint64_t v59 = 0LL;
      int v15 = *(_DWORD *)(a1 + 16);
      if (BYTE2(v15))
      {
        unsigned int __srca = *(_DWORD *)(a1 + 16) & 0xFF00 | (BYTE2(*(_DWORD *)(a1 + 16)) << 16) | (v8 << 24);
        unsigned int v16 = v15;
        unsigned int v17 = v15 << 25;
        BOOL v18 = v16 >= 0x41;
        unsigned int v19 = (v16 & 0x3F) << 19;
        if (v18 && v19 != 0)
        {
          do
          {
            v17 |= v19;
            BOOL v14 = v19 > 0x3F;
            v19 >>= 6;
          }

          while (v14);
        }

        unsigned int v58 = v17;
        sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
        *(_DWORD *)(a1 + 16) = 0;
      }

      unsigned int v21 = v54;
      *(void *)(a1 + (v7 << 7) + 8 * (v54 & 0xF) + 33) = 0LL;
    }

    else
    {
      unsigned int v21 = v54;
    }

    unsigned int v22 = (v4 >> 8) & 0x7F;
    unsigned int v23 = v4 & 0x7F;
    switch(v21 >> 4)
    {
      case 8u:
        goto LABEL_22;
      case 9u:
        if ((v4 & 0x7F) == 0)
        {
          v21 -= 16;
          LODWORD(v54) = v21;
          unsigned int v23 = 64;
        }

LABEL_68:
          if (!*(_BYTE *)(a1 + 32)) {
            return;
          }
          goto LABEL_69;
        }

        if (!v22)
        {
          *(_BYTE *)(v28 + 8 * v29 + 2) = v23;
          goto LABEL_50;
        }

        if (v22 != 6)
        {
          if (v22 == 32)
          {
            *(_BYTE *)(v28 + 8 * v29 + 3) = v23;
LABEL_50:
            *(_BYTE *)(v28 + 8LL * (v21 & 0xF)) = 1;
            goto LABEL_68;
          }

          if (!*(_BYTE *)(a1 + 32)) {
            return;
          }
          goto LABEL_69;
        }

        if (!v22)
        {
          *(_BYTE *)(v28 + 8 * v29 + 2) = v23;
          goto LABEL_50;
        }

        if (v22 != 6)
        {
          if (v22 == 32)
          {
            *(_BYTE *)(v28 + 8 * v29 + 3) = v23;
LABEL_50:
            *(_BYTE *)(v28 + 8LL * (v21 & 0xF)) = 1;
            goto LABEL_68;
          }

LABEL_69:
          HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
          unsigned int v26 = v4 << 25;
          if (v23 >= 0x41)
          {
            unsigned int v50 = (v4 & 0x3F) << 19;
            if (v50)
            {
              do
              {
                v26 |= v50;
                BOOL v14 = v50 > 0x3F;
                v50 >>= 6;
              }

              while (v14);
            }
          }

          HIDWORD(v54) = (v8 << 24) | (v21 << 16) | (v22 << 8);
          unsigned int v26 = v4 << 25;
          if (v23 >= 0x41)
          {
            unsigned int v50 = (v4 & 0x3F) << 19;
            if (v50)
            {
              do
              {
                v26 |= v50;
                BOOL v14 = v50 > 0x3F;
                v50 >>= 6;
              }

              while (v14);
            }
          }

LABEL_72:
          int v55 = v26;
          goto LABEL_73;
        }

        char v40 = 0;
        int v41 = 0;
        *(_BYTE *)(v28 + 8 * v29 + 6) = v23;
LABEL_54:
        uint64_t v42 = v28 + 8 * v29;
        *(_BYTE *)(v42 + 7) = v40;
        if (*(_BYTE *)(a1 + 32) || !*(_BYTE *)(v42 + 1)) {
          goto LABEL_69;
        }
        if (*(_BYTE *)(v42 + 1) == 1) {
          int v43 = 32;
        }
        else {
          int v43 = 48;
        }
        uint64_t v44 = (unsigned __int8 *)(v28 + 8 * v29);
        HIDWORD(v54) = (v8 << 24) | ((v43 | v29) << 16) | (v44[4] << 8) | v44[5];
        unsigned int v45 = v41 | (v44[6] << 7);
        unsigned int v46 = v45 << 18;
        if (v45 > 0x2000)
        {
          for (unsigned int i = 32 * (v45 & 0x1FFF); i; i >>= 13)
            v46 |= i;
        }

        int v55 = v46;
LABEL_38:
        *(void *)a1 = 0LL;
        *(void *)(a1 + 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        *(void *)(a1 + 24) = 0LL;
LABEL_73:
        sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&v54 + 1);
        break;
      case 0xCu:
        uint64_t v30 = a1 + (v7 << 7) + 33;
        int v31 = *(unsigned __int8 *)(v30 + 8LL * (v21 & 0xF));
        if (*(_BYTE *)(v30 + 8LL * (v21 & 0xF))) {
          int v31 = *(unsigned __int8 *)(a1 + 32) ^ 1;
        }
        uint64_t v32 = v30 + 8LL * (v21 & 0xF);
        int v33 = (v22 << 24) | (*(unsigned __int8 *)(v32 + 2) << 8) | *(unsigned __int8 *)(v32 + 3);
        HIDWORD(v54) = (v21 << 16) | (v8 << 24) | v31;
        int v55 = v33;
        *(void *)uint64_t v32 = 0LL;
        goto LABEL_38;
      case 0xDu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v34 = v4 >> 8 << 25;
        if (v22 >= 0x41)
        {
          unsigned int v35 = ((v4 >> 8) & 0x3F) << 19;
          if (v35)
          {
            do
            {
              v34 |= v35;
              BOOL v14 = v35 > 0x3F;
              v35 >>= 6;
            }

            while (v14);
          }
        }

        int v55 = v34;
        goto LABEL_73;
      case 0xEu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v36 = v22 | (v23 << 7);
        unsigned int v26 = v36 << 18;
        if (v36 > 0x2000)
        {
          for (unsigned int j = 32 * (v36 & 0x1FFF); j; j >>= 13)
            v26 |= j;
        }

        goto LABEL_72;
      default:
        goto LABEL_73;
    }
  }

  else
  {
    sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__src);
  }

          int v55 = v26;
          goto LABEL_73;
        }

        char v40 = 0;
        int v41 = 0;
        *(_BYTE *)(v28 + 8 * v29 + 6) = v23;
LABEL_54:
        uint64_t v42 = v28 + 8 * v29;
        *(_BYTE *)(v42 + 7) = v40;
        if (*(_BYTE *)(a1 + 32) || !*(_BYTE *)(v42 + 1)) {
          goto LABEL_69;
        }
        if (*(_BYTE *)(v42 + 1) == 1) {
          int v43 = 32;
        }
        else {
          int v43 = 48;
        }
        uint64_t v44 = (unsigned __int8 *)(v28 + 8 * v29);
        HIDWORD(v54) = (v8 << 24) | ((v43 | v29) << 16) | (v44[4] << 8) | v44[5];
        unsigned int v45 = v41 | (v44[6] << 7);
        unsigned int v46 = v45 << 18;
        if (v45 > 0x2000)
        {
          for (unsigned int i = 32 * (v45 & 0x1FFF); i; i >>= 13)
            v46 |= i;
        }

        int v55 = v46;
LABEL_38:
        *(void *)a1 = 0LL;
        *(void *)(a1 + 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        *(void *)(a1 + 24) = 0LL;
LABEL_73:
        sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&v54 + 1);
        break;
      case 0xCu:
        uint64_t v30 = a1 + (v7 << 7) + 33;
        int v31 = *(unsigned __int8 *)(v30 + 8LL * (v21 & 0xF));
        if (*(_BYTE *)(v30 + 8LL * (v21 & 0xF))) {
          int v31 = *(unsigned __int8 *)(a1 + 32) ^ 1;
        }
        uint64_t v32 = v30 + 8LL * (v21 & 0xF);
        int v33 = (v22 << 24) | (*(unsigned __int8 *)(v32 + 2) << 8) | *(unsigned __int8 *)(v32 + 3);
        HIDWORD(v54) = (v21 << 16) | (v8 << 24) | v31;
        int v55 = v33;
        *(void *)uint64_t v32 = 0LL;
        goto LABEL_38;
      case 0xDu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v34 = v4 >> 8 << 25;
        if (v22 >= 0x41)
        {
          unsigned int v35 = ((v4 >> 8) & 0x3F) << 19;
          if (v35)
          {
            do
            {
              v34 |= v35;
              BOOL v14 = v35 > 0x3F;
              v35 >>= 6;
            }

            while (v14);
          }
        }

        int v55 = v34;
        goto LABEL_73;
      case 0xEu:
        HIDWORD(v54) = (v21 << 16) | (v8 << 24);
        unsigned int v36 = v22 | (v23 << 7);
        unsigned int v26 = v36 << 18;
        if (v36 > 0x2000)
        {
          for (unsigned int j = 32 * (v36 & 0x1FFF); j; j >>= 13)
            v26 |= j;
        }

        goto LABEL_72;
      default:
        goto LABEL_73;
    }
  }

  else
  {
    sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)__src);
  }

__n128 sub_16814(unsigned int **a1)
{
  uint64_t v1 = *a1;
  if (!*((_BYTE *)*a1 + 32))
  {
    unsigned int v2 = *a1[1];
    unsigned int v3 = v2 >> 4;
    unsigned int v4 = *v1;
    if ((*v1 & 0xFF0000) != 0)
    {
      if (((v2 ^ HIWORD(v4)) & 0xF) != 0)
      {
        *((_BYTE *)v1 + 32) = 1;
        return result;
      }

      if (v3 == 11)
      {
        switch(BYTE1(v4))
        {
          case 'b':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25344;
            goto LABEL_28;
          case 'c':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25088;
            goto LABEL_28;
          case 'd':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25856;
            goto LABEL_28;
          case 'e':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25600;
LABEL_28:
            if (v10 != v12 && v11 != 11535872) {
              return result;
            }
            goto LABEL_33;
          default:
            if (BYTE1(v4) == 32)
            {
              unsigned int v9 = a1[2];
              if (*((_BYTE *)v9 + 1)) {
                return result;
              }
            }

            else
            {
              if (BYTE1(v4)) {
                return result;
              }
              unsigned int v9 = a1[2];
            }

uint64_t sub_169D0(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)result)
  {
    unsigned int v3 = (unsigned int *)result;
    unsigned int v4 = 0;
    unint64_t v5 = result + 4;
    do
    {
      uint64_t v6 = *(unsigned __int16 *)(v5 + 8);
      v12[0] = v5 + 10;
      v12[1] = v6;
      uint64_t v12[2] = *(void *)v5;
      void v12[3] = 0LL;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      __n128 result = sub_15C2C(v12, &v11, &v9);
      if ((_DWORD)result)
      {
        do
        {
          BOOL v7 = *a2;
          uint64_t v14 = v11;
          uint64_t v8 = *v7;
          v13[0] = v7[1];
          v13[1] = &v14;
          sub_16AA4(v8 + 64, (unsigned int *)&v9, (uint64_t)v13);
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          __n128 result = sub_15C2C(v12, &v11, &v9);
        }

        while ((result & 1) != 0);
      }

      unint64_t v5 = (v5 + *(unsigned __int16 *)(v5 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      ++v4;
    }

    while (v4 < *v3);
  }

  return result;
}

void sub_16AA4(uint64_t a1, unsigned int *__src, uint64_t a3)
{
  unsigned int v4 = *__src;
  if (*__src >> 28 == 2)
  {
    int v55 = 0;
    uint64_t v56 = 0LL;
    uint64_t v54 = BYTE2(v4);
    v51[0] = (unsigned int *)a1;
    v51[1] = (unsigned int *)&v54;
    v51[2] = __src;
    void v51[3] = (unsigned int *)&v53;
    v51[4] = (unsigned int *)&v52;
    int v6 = *(unsigned __int8 *)(a1 + 32);
    if (!v6) {
      sub_16F6C(v51);
    }
    uint64_t v7 = HIBYTE(v4) & 0xF;
    int v8 = HIBYTE(v4) & 0xF | 0x40;
    unsigned int v9 = *(_DWORD *)a1;
    int v10 = BYTE2(*(_DWORD *)a1);
    if (BYTE2(*(_DWORD *)a1) && v6)
    {
      *(_BYTE *)(a1 + 32) = 1;
      uint64_t v59 = 0LL;
      unsigned int __srca = v9 & 0xFF00 | (v10 << 16) & 0x80FFFFFF | ((HIBYTE(v4) & 0xF | 0x40) << 24);
      unsigned int v11 = v9;
      unsigned int v12 = v9 << 25;
      if (v11 >= 0x41)
      {
        unsigned int v13 = (v11 & 0x3F) << 19;
        if (v13)
        {
          do
          {
            v12 |= v13;
            BOOL v14 = v13 > 0x3F;
            v13 >>= 6;
          }

          while (v14);
        }
      }

      unsigned int v58 = v12;
      sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
      *(_DWORD *)a1 = 0;
      uint64_t v59 = 0LL;
      int v15 = *(_DWORD *)(a1 + 16);
      if (BYTE2(v15))
      {
        unsigned int __srca = *(_DWORD *)(a1 + 16) & 0xFF00 | (BYTE2(*(_DWORD *)(a1 + 16)) << 16) | (v8 << 24);
        unsigned int v16 = v15;
        unsigned int v17 = v15 << 25;
        BOOL v18 = v16 >= 0x41;
        unsigned int v19 = (v16 & 0x3F) << 19;
        if (v18 && v19 != 0)
        {
          do
          {
            v17 |= v19;
            BOOL v14 = v19 > 0x3F;
            v19 >>= 6;
          }

          while (v14);
        }

        unsigned int v58 = v17;
        sub_15788(*(unsigned int **)a3, **(void **)(a3 + 8), (int *)&__srca);
        *(_DWORD *)(a1 + 16) = 0;
      }

      unsigned int v21 = v54;
      *(void *)(a1 + (v7 << 7) + 8 * (v54 & 0xF) + 33) = 0LL;
    }

    else
    {
      unsigned int v21 = v54;
    }

    unsigned int v22 = (v4 >> 8) & 0x7F;
    unsigned int v23 = v4 & 0x7F;
    switch(v21 >> 4)
    {
      case 8u:
        goto LABEL_22;
      case 9u:
        if ((v4 & 0x7F) == 0)
        {
          v21 -= 16;
          LODWORD(v54) = v21;
          unsigned int v23 = 64;
        }

__n128 sub_16F6C(unsigned int **a1)
{
  uint64_t v1 = *a1;
  if (!*((_BYTE *)*a1 + 32))
  {
    unsigned int v2 = *a1[1];
    unsigned int v3 = v2 >> 4;
    unsigned int v4 = *v1;
    if ((*v1 & 0xFF0000) != 0)
    {
      if (((v2 ^ HIWORD(v4)) & 0xF) != 0)
      {
        *((_BYTE *)v1 + 32) = 1;
        return result;
      }

      if (v3 == 11)
      {
        switch(BYTE1(v4))
        {
          case 'b':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25344;
            goto LABEL_28;
          case 'c':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25088;
            goto LABEL_28;
          case 'd':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25856;
            goto LABEL_28;
          case 'e':
            unsigned int v9 = a1[2];
            int v10 = *v9 & 0xFF00;
            int v11 = *v9 & 0xF0DF00;
            int v12 = 25600;
LABEL_28:
            if (v10 != v12 && v11 != 11535872) {
              return result;
            }
            goto LABEL_33;
          default:
            if (BYTE1(v4) == 32)
            {
              unsigned int v9 = a1[2];
              if (*((_BYTE *)v9 + 1)) {
                return result;
              }
            }

            else
            {
              if (BYTE1(v4)) {
                return result;
              }
              unsigned int v9 = a1[2];
            }

void sub_17128(void ***a1)
{
  uint64_t v1 = *a1;
  unsigned int v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_E7D0(v4 - 296);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_17198(void *a1)
{
  for (unsigned int i = (void *)a1[1]; i != a1; unsigned int i = (void *)i[1])
  {
    unsigned int v3 = (void *)i[4];
    if (v3) {
      free(v3);
    }
  }

  sub_171E4(a1);
  return a1;
}

void *sub_171E4(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    __n128 result = (void *)result[1];
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
        __n128 result = v4;
      }

      while (v4 != v1);
    }
  }

  return result;
}

void sub_17244(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_179B0(v4 - 16);
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_172B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_2DBC();
  }
  return operator new(16 * a2);
}

uint64_t sub_172E8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    sub_179B0(i - 16);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *sub_17334(char *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    __n128 result = sub_173A4(result, a4);
    BOOL v7 = (void *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      uint64_t v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_17388(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_173A4(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2CF0();
  }
  __n128 result = (char *)sub_E18C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t sub_173E4(uint64_t a1, unsigned int *a2, int a3, int a4, char a5)
{
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 272) = 0;
  *(_DWORD *)(a1 + 280) = a3;
  *(_DWORD *)(a1 + 284) = a4;
  *(_DWORD *)(a1 + 288) = 0;
  *(_BYTE *)(a1 + 292) = a5;
  uint64_t v7 = a2[2];
  size_t v8 = 4 * v7 + 12;
  size_t v12 = v8;
  if (v7 <= 0x40)
  {
    unsigned int v9 = (void *)sub_174B0(a1);
LABEL_5:
    memmove(v9, a2, v8);
    return a1;
  }

  int v10 = (void **)sub_1752C(a1, &v12);
  size_t v8 = v12;
  if (v12)
  {
    unsigned int v9 = *v10;
    goto LABEL_5;
  }

  return a1;
}

void sub_1749C(_Unwind_Exception *a1)
{
}

uint64_t sub_174B0(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v2 != -1) {
    ((void (*)(char *, uint64_t))off_24AE0[v2])(&v4, a1);
  }
  *(_OWORD *)(a1 + 252) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 272) = 0;
  return a1;
}

void *sub_1752C(uint64_t a1, size_t *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 272);
  if ((_DWORD)v4 != -1) {
    ((void (*)(char *, uint64_t))off_24AE0[v4])(&v6, a1);
  }
  *(_DWORD *)(a1 + 272) = -1;
  __n128 result = sub_17598((void *)a1, *a2);
  *(_DWORD *)(a1 + 272) = 1;
  return result;
}

void *sub_17598(void *a1, size_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_17608(a1, a2);
    uint64_t v4 = (char *)a1[1];
    unint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }

  return a1;
}

void sub_175EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_17608(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000LL) != 0) {
    sub_2CF0();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t sub_17648(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x14C1BACF914C1BADLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x14C1BACF914C1BADLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x6EB3E45306EB3ELL) {
    unint64_t v9 = 0xDD67C8A60DD67CLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v15[4] = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_1791C(v7, v9);
  }
  else {
    int v10 = 0LL;
  }
  uint64_t v11 = (uint64_t)&v10[296 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[296 * v9];
  sub_17778(v11, (unsigned int *)a2);
  uint64_t v12 = *(void *)(a2 + 280);
  *(void *)(v11 + 285) = *(void *)(a2 + 285);
  *(void *)(v11 + 280) = v12;
  v15[2] = v11 + 296;
  sub_1786C(a1, v15);
  uint64_t v13 = a1[1];
  sub_17964((uint64_t)v15);
  return v13;
}

void sub_17764(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_17778(uint64_t a1, unsigned int *a2)
{
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 272) = -1;
  sub_177AC(a1, a2);
  return a1;
}

uint64_t sub_177AC(uint64_t result, unsigned int *a2)
{
  uint64_t v3 = (_DWORD *)result;
  uint64_t v4 = *(unsigned int *)(result + 272);
  if ((_DWORD)v4 != -1) {
    __n128 result = ((uint64_t (*)(char *, uint64_t))off_24AE0[v4])(&v7, result);
  }
  v3[68] = -1;
  uint64_t v5 = a2[68];
  if ((_DWORD)v5 != -1)
  {
    __n128 result = (*(&off_24AF0 + v5))((int)&v6, v3, a2);
    v3[68] = v5;
  }

  return result;
}

void *sub_17838(int a1, void *__dst, void *__src)
{
  return memcpy(__dst, __src, 0x10CuLL);
}

__n128 sub_17848(uint64_t a1, __n128 *a2, __n128 *a3)
{
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  __n128 result = *a3;
  *a2 = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  a3->n128_u64[0] = 0LL;
  a3->n128_u64[1] = 0LL;
  a3[1].n128_u64[0] = 0LL;
  return result;
}

uint64_t sub_1786C(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a2[1];
  if (v5 == *a1)
  {
    uint64_t result = a2[1];
  }

  else
  {
    do
    {
      uint64_t result = sub_17778(v6 - 296, (unsigned int *)(v5 - 296));
      uint64_t v8 = *(void *)(v5 - 16);
      *(void *)(v6 - 11) = *(void *)(v5 - 11);
      *(void *)(v6 - 16) = v8;
      v5 -= 296LL;
      uint64_t v6 = result;
    }

    while (v5 != v4);
  }

  a2[1] = result;
  uint64_t v9 = *a1;
  *a1 = result;
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *sub_1791C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xDD67C8A60DD67DLL) {
    sub_2DBC();
  }
  return operator new(296 * a2);
}

uint64_t sub_17964(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 296;
    sub_E7D0(i - 296);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_179B0(uint64_t a1)
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

void *sub_17A08(void *a1)
{
  *a1 = &off_24B10;
  uint64_t v2 = a1 + 2;
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

void sub_17A64(char *__p)
{
  *(void *)__p = &off_24B10;
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

void *sub_17AC0(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t v2 = &off_24B10;
  v2[1] = v3;
  sub_2C18((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_17B04(_Unwind_Exception *a1)
{
}

uint64_t sub_17B18(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &off_24B10;
  a2[1] = v2;
  return sub_2C18((uint64_t)(a2 + 2), a1 + 16);
}

void *sub_17B38(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 16);
  uint64_t result = *(void **)(a1 + 40);
  if (result == v1)
  {
    uint64_t v3 = 4LL;
    uint64_t result = v1;
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

void sub_17B6C(char *__p)
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

BOOL sub_17BBC(uint64_t a1, void *a2)
{
  return sub_17C28(a1 + 8, a2);
}

uint64_t sub_17BC4(uint64_t a1, uint64_t a2)
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

BOOL sub_17C28(uint64_t a1, void *a2)
{
  char v3 = (*(uint64_t (**)(void, char *))a1)(*a2, &v6);
  if (!v6) {
    return 0LL;
  }
  char v7 = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    sub_3030();
  }
  (*(void (**)(uint64_t, char *))(*(void *)v4 + 48LL))(v4, &v7);
  return v6 != 0;
}

void *sub_17CA0()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &off_24B58;
  return result;
}

void sub_17CC4(uint64_t a1, void *a2)
{
  *a2 = &off_24B58;
}

void sub_17CDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_F9C8();
  if (v2)
  {
    sub_F9C8();
    char v3 = (os_log_s *)qword_28148;
    if (os_log_type_enabled((os_log_t)qword_28148, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315650;
      uint64_t v5 = "USBMIDIDevice.cpp";
      __int16 v6 = 1024;
      int v7 = 100;
      __int16 v8 = 1024;
      int v9 = v2;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d =====> NOTICE: USB I/O destructive tracing at level %d <=====",  (uint8_t *)&v4,  0x18u);
    }
  }

void *sub_17DAC(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_24BA0;
  result[1] = v3;
  return result;
}

uint64_t sub_17DE0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_24BA0;
  a2[1] = v2;
  return result;
}

uint64_t sub_17DFC(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 187LL) = *a2;
  return result;
}

void *sub_17E14(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_24BE8;
  result[1] = v3;
  return result;
}

uint64_t sub_17E48(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_24BE8;
  a2[1] = v2;
  return result;
}

uint64_t sub_17E64(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 489LL) = *a2;
  return result;
}

void *sub_17E7C(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_24C30;
  result[1] = v3;
  return result;
}

uint64_t sub_17EB0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_24C30;
  a2[1] = v2;
  return result;
}

uint64_t sub_17ECC(uint64_t result, _BYTE *a2)
{
  *(_BYTE *)(*(void *)(result + 8) + 49sub_14858(&a9, 0LL) = *a2;
  return result;
}

uint64_t sub_17EDC(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 88LL))( *a1,  *a2,  *(unsigned int *)(*a1 + 220LL));
}

void *sub_17EF4(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_17F00(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void sub_17F14(std::__shared_weak_count *a1)
{
}

uint64_t sub_17F28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_17F44(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 96LL))( *a1,  *a2,  *(unsigned int *)(*a1 + 220LL));
}

void *sub_17F5C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_17F68(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_17F78(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0LL;
LABEL_5:
    sub_17FB8();
  }

  int v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void sub_17FB8()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *sub_17FEC@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X2>, unsigned __int16 *a3@<X3>, void *a4@<X8>)
{
  __int16 v8 = operator new(0x60uLL);
  uint64_t result = sub_1805C(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_18048(_Unwind_Exception *a1)
{
}

void *sub_1805C(void *a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  a1[2] = 0LL;
  *a1 = off_24D18;
  a1[1] = 0LL;
  sub_180F0((uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_18094(_Unwind_Exception *a1)
{
}

void sub_180A8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24D18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_180BC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24D18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_180E0(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_180F0(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  __int16 v6 = (std::__shared_weak_count *)a3[1];
  uint64_t v10 = *a3;
  uint64_t v11 = v6;
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
  }

  sub_18170(a1, v5, &v10, *a4);
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  return a1;
}

void sub_18158( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_18170(uint64_t a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v8 = a1 + 16;
  sub_1DB8C((void *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_24D50;
  uint64_t v9 = a3[1];
  *(void *)(a1 + 48) = *a3;
  *(void *)(a1 + 56) = v9;
  if (v9)
  {
    uint64_t v10 = (unint64_t *)(v9 + 16);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  sub_1DBC8(v8, a2, a4);
  return a1;
}

void sub_18200(_Unwind_Exception *a1)
{
  int v4 = *(std::__shared_weak_count **)(v2 + 56);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  sub_1DB9C(v1);
  _Unwind_Resume(a1);
}

void *sub_18220(void *a1)
{
  *a1 = off_24D50;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  sub_1DB9C((uint64_t)(a1 + 2));
  return a1;
}

void sub_18264(void *a1)
{
  *a1 = off_24D50;
  uint64_t v2 = (std::__shared_weak_count *)a1[7];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  sub_1DB9C((uint64_t)(a1 + 2));
  operator delete(a1);
}

uint64_t sub_182A8(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_182BC(__int128 *a1@<X1>, void *a2@<X8>)
{
  int v4 = operator new(0x168uLL);
  sub_18334(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  sub_F054((uint64_t)a2, v4 + 3, (uint64_t)(v4 + 3));
}

void sub_18320(_Unwind_Exception *a1)
{
}

void *sub_18334(void *a1, __int128 *a2)
{
  a1[2] = 0LL;
  *a1 = off_24D78;
  a1[1] = 0LL;
  sub_183C4((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1836C(_Unwind_Exception *a1)
{
}

void sub_18380(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24D78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_18394(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24D78;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183B8(uint64_t a1)
{
  return sub_1A1A0(a1 + 24);
}

uint64_t sub_183C4(uint64_t a1, __int128 *a2)
{
  __int128 v7 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  sub_19FFC(a1, &v7);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  if (*((void *)&v7 + 1))
  {
    int v4 = (unint64_t *)(*((void *)&v7 + 1) + 8LL);
    do
      unint64_t v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  return a1;
}

void sub_18438( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1844C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = off_24DB0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  __int16 v6 = (mach_port_t *)(a1 + 24);
  *(void *)(a1 + 32) = 0LL;
  __int128 v7 = (IONotificationPort **)(a1 + 32);
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  uint64_t v8 = (io_iterator_t *)(a1 + 40);
  *(_BYTE *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = a3;
  sub_188C4();
  uint64_t v9 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136316162;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 37;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    __int16 v32 = 2048;
    uint64_t v33 = a2;
    __int16 v34 = 2048;
    uint64_t v35 = a3;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] IOServiceClient(%p)::IOServiceClient(notifyRunLoop %p, matchingDict %p",  (uint8_t *)&v26,  0x30u);
  }

  if (IOMainPort(0, v6)) {
    goto LABEL_21;
  }
  uint64_t v10 = *(const void **)(a1 + 8);
  if (!v10) {
    return a1;
  }
  CFRetain(v10);
  unint64_t v11 = IONotificationPortCreate(*v6);
  void *v7 = v11;
  if (!v11) {
    goto LABEL_21;
  }
  RunLoopMIDIObjectRef Source = IONotificationPortGetRunLoopSource(v11);
  *(void *)(a1 + 16) = RunLoopSource;
  if (!RunLoopSource) {
    goto LABEL_21;
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 8), RunLoopSource, kCFRunLoopDefaultMode);
  sub_188C4();
  uint64_t v13 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    int v26 = 136315906;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 50;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = v15;
    _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      added runloop source %p to runloop %p",  (uint8_t *)&v26,  0x26u);
  }

  CFRetain(*(CFTypeRef *)(a1 + 56));
  sub_188C4();
  unsigned int v16 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 56);
    int v26 = 136315650;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 53;
    __int16 v30 = 2112;
    uint64_t v31 = v17;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d      mMatchingDict: %@", (uint8_t *)&v26, 0x1Cu);
  }

  if (IOServiceAddMatchingNotification( *(IONotificationPortRef *)(a1 + 32),  "IOServiceMatched",  *(CFDictionaryRef *)(a1 + 56),  (IOServiceMatchingCallback)sub_18920,  (void *)a1,  v8))
  {
    goto LABEL_21;
  }

  sub_188C4();
  BOOL v18 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 55;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      signed up for matched notifications",  (uint8_t *)&v26,  0x12u);
  }

  CFRetain(*(CFTypeRef *)(a1 + 56));
  if (IOServiceAddMatchingNotification( *(IONotificationPortRef *)(a1 + 32),  "IOServiceTerminate",  *(CFDictionaryRef *)(a1 + 56),  (IOServiceMatchingCallback)sub_18A04,  (void *)a1,  (io_iterator_t *)(a1 + 44)))
  {
LABEL_21:
    sub_188C4();
    uint64_t v25 = qword_28158;
    if (!os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_ERROR)) {
      return a1;
    }
    int v26 = 136315650;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 68;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    unsigned int v21 = "%25s:%-5d [!] IOServiceClient(%p)::IOServiceClient() - failure";
    unsigned int v22 = (os_log_s *)v25;
    os_log_type_t v23 = OS_LOG_TYPE_ERROR;
    goto LABEL_19;
  }

  sub_188C4();
  unsigned int v19 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315394;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 59;
    _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      signed up for terminated notifications",  (uint8_t *)&v26,  0x12u);
  }

  *(_BYTE *)(a1 + 48) = 1;
  sub_188C4();
  uint64_t v20 = qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136315650;
    unsigned int v27 = "IOServiceClient.cpp";
    __int16 v28 = 1024;
    int v29 = 63;
    __int16 v30 = 2048;
    uint64_t v31 = a1;
    unsigned int v21 = "%25s:%-5d [-] IOServiceClient(%p)::IOServiceClient() - success";
    unsigned int v22 = (os_log_s *)v20;
    os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
LABEL_19:
    _os_log_impl(&dword_0, v22, v23, v21, (uint8_t *)&v26, 0x1Cu);
  }

  return a1;
}

void sub_188C4()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28160);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28160))
    {
      qword_28158 = (uint64_t)os_log_create("com.apple.coremidi", "ioserv");
      __cxa_guard_release(&qword_28160);
    }
  }

uint64_t sub_18920(uint64_t a1, io_iterator_t a2)
{
  int v4 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    __int128 v7 = "IOServiceClient.cpp";
    __int16 v8 = 1024;
    int v9 = 106;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    io_iterator_t v13 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient::ServicePublishCallback(refcon %p, it %u)",  (uint8_t *)&v6,  0x22u);
  }

  return sub_18C40(a1, a2);
}

uint64_t sub_18A04(uint64_t a1, io_iterator_t a2)
{
  int v4 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    __int128 v7 = "IOServiceClient.cpp";
    __int16 v8 = 1024;
    int v9 = 115;
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    io_iterator_t v13 = a2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient::ServiceTerminateCallback(refcon %p, it %u)",  (uint8_t *)&v6,  0x22u);
  }

  return sub_18CA4(a1, a2);
}

uint64_t sub_18AE8(uint64_t a1)
{
  *(void *)a1 = off_24DB0;
  sub_188C4();
  uint64_t v2 = (os_log_s *)qword_28158;
  if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315650;
    __int16 v12 = "IOServiceClient.cpp";
    __int16 v13 = 1024;
    int v14 = 76;
    __int16 v15 = 2048;
    uint64_t v16 = a1;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient(%p)::~IOServiceClient()",  (uint8_t *)&v11,  0x1Cu);
  }

  uint64_t v3 = *(__CFRunLoop **)(a1 + 8);
  if (v3)
  {
    int v4 = *(__CFRunLoopSource **)(a1 + 16);
    if (v4)
    {
      CFRunLoopRemoveSource(v3, v4, kCFRunLoopDefaultMode);
      CFRelease(*(CFTypeRef *)(a1 + 8));
    }
  }

  unint64_t v5 = *(const void **)(a1 + 16);
  if (v5) {
    CFRelease(v5);
  }
  io_object_t v6 = *(_DWORD *)(a1 + 40);
  if (v6) {
    IOObjectRelease(v6);
  }
  io_object_t v7 = *(_DWORD *)(a1 + 44);
  if (v7) {
    IOObjectRelease(v7);
  }
  mach_port_name_t v8 = *(_DWORD *)(a1 + 24);
  if (v8) {
    mach_port_deallocate(mach_task_self_, v8);
  }
  int v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  return a1;
}

void sub_18C2C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_29BC(a1);
}

uint64_t sub_18C40(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 16LL))(a1, v5);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

uint64_t sub_18CA4(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v5 = result;
    do
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, v5);
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

void sub_18D08(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      sub_188C4();
      uint64_t v2 = (os_log_s *)qword_28158;
      if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        mach_port_name_t v8 = "IOServiceClient.cpp";
        __int16 v9 = 1024;
        int v10 = 130;
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient(%p)ScanServices() - emptying iterators ...",  buf,  0x1Cu);
      }

      *(_BYTE *)(a1 + 48) = 0;
      sub_18C40(a1, *(_DWORD *)(a1 + 40));
      sub_18CA4(a1, *(_DWORD *)(a1 + 44));
    }

    else
    {
      io_iterator_t existing = 0;
      CFRetain(*(CFTypeRef *)(a1 + 56));
      sub_188C4();
      int v4 = (os_log_s *)qword_28158;
      if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        mach_port_name_t v8 = "IOServiceClient.cpp";
        __int16 v9 = 1024;
        int v10 = 140;
        __int16 v11 = 2048;
        uint64_t v12 = a1;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] IOServiceClient(%p)ScanServices() - getting matching services for dictionary: %@",  buf,  0x26u);
      }

      if (!IOServiceGetMatchingServices(*(_DWORD *)(a1 + 24), *(CFDictionaryRef *)(a1 + 56), &existing)) {
        sub_18C40(a1, existing);
      }
      if (existing) {
        IOObjectRelease(existing);
      }
    }
  }

  else
  {
    sub_188C4();
    uint64_t v3 = (os_log_s *)qword_28158;
    if (os_log_type_enabled((os_log_t)qword_28158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      mach_port_name_t v8 = "IOServiceClient.cpp";
      __int16 v9 = 1024;
      int v10 = 125;
      __int16 v11 = 2048;
      uint64_t v12 = a1;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] IOServiceClient(%p)::ScanServices() - mMainDevicePort == 0",  buf,  0x1Cu);
    }
  }

void sub_18F30(int a1, void *a2, MIDIDeviceRef device, void *a4, uint64_t a5, char **a6)
{
  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(device);
  SInt32 outValue = 0;
  if (NumberOfEntities >= 1)
  {
    ItemCount v11 = 0LL;
    SInt32 v87 = 0;
    uint64_t v83 = (NumberOfEntities - 1);
    uint64_t v12 = (void *)(a5 + 16);
    uint64_t v90 = (uint64_t)(a6 + 2);
    if (a1) {
      __int16 v13 = a2;
    }
    else {
      __int16 v13 = 0LL;
    }
    uint64_t v81 = NumberOfEntities;
    int v78 = a1 ^ 1;
    int v82 = a1;
    uint64_t v79 = NumberOfEntities - 1LL;
    uint64_t v80 = v13;
    do
    {
      uint64_t Entity = MIDIDeviceGetEntity(device, v11);
      uint64_t v15 = Entity;
      else {
        SInt32 outValue = *(unsigned __int8 *)(*a4 + 8 * v11 + 5);
      }
      if (v83 == v11)
      {
        SInt32 v92 = 0;
        OSStatus IntegerProperty = MIDIObjectGetIntegerProperty(v15, kMIDIPropertyUMPCanTransmitGroupless, &v92);
        SInt32 v17 = v92;
        if (IntegerProperty) {
          SInt32 v17 = IntegerProperty;
        }
        SInt32 v87 = v17;
      }

      ItemCount v86 = v11;
      ItemCount NumberOfSources = MIDIEntityGetNumberOfSources(v15);
      ItemCount NumberOfDestinations = MIDIEntityGetNumberOfDestinations(v15);
      if (a1 && NumberOfSources)
      {
        for (ItemCount i = 0LL; i != NumberOfSources; ++i)
        {
          uint64_t v19 = v15;
          MIDIEndpointRef Source = MIDIEntityGetSource(v15, i);
          unsigned int v21 = *(MIDIEndpointRef **)(a5 + 8);
          if (!v87)
          {
            unint64_t v29 = i + outValue;
            while (1)
            {
              __int16 v30 = *(MIDIEndpointRef **)a5;
              unint64_t v31 = ((uint64_t)v21 - *(void *)a5) >> 2;
              if (v31 >= v29) {
                break;
              }
              if ((unint64_t)v21 >= *v12)
              {
                unint64_t v33 = v31 + 1;
                if ((v31 + 1) >> 62) {
                  goto LABEL_102;
                }
                uint64_t v34 = *v12 - (void)v30;
                if (v34 >> 1 > v33) {
                  unint64_t v33 = v34 >> 1;
                }
                else {
                  unint64_t v35 = v33;
                }
                if (v35)
                {
                  unsigned int v36 = (char *)sub_19494(a5 + 16, v35);
                  __int16 v30 = *(MIDIEndpointRef **)a5;
                  unsigned int v21 = *(MIDIEndpointRef **)(a5 + 8);
                }

                else
                {
                  unsigned int v36 = 0LL;
                }

                __int16 v37 = &v36[4 * v31];
                *(_DWORD *)__int16 v37 = 0;
                __int16 v32 = v37 + 4;
                while (v21 != v30)
                {
                  int v38 = *--v21;
                  *((_DWORD *)v37 - 1) = v38;
                  v37 -= 4;
                }

                *(void *)a5 = v37;
                *(void *)(a5 + 8) = v32;
                *(void *)(a5 + 16) = &v36[4 * v35];
                if (v30) {
                  operator delete(v30);
                }
              }

              else
              {
                MIDIEndpointRef *v21 = 0;
                __int16 v32 = v21 + 1;
              }

              *(void *)(a5 + 8) = v32;
              unint64_t v40 = (unint64_t)a6[1];
              unint64_t v39 = (unint64_t)a6[2];
              if (v40 >= v39)
              {
                unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (void)*a6) >> 1);
                unint64_t v43 = v42 + 1;
                if (v42 + 1 > 0x2AAAAAAAAAAAAAAALL) {
                  goto LABEL_103;
                }
                unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (void)*a6) >> 1);
                if (2 * v44 > v43) {
                  unint64_t v43 = 2 * v44;
                }
                if (v44 >= 0x1555555555555555LL) {
                  unint64_t v45 = 0x2AAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v45 = v43;
                }
                if (v45) {
                  unsigned int v46 = (char *)sub_D06C(v90, v45);
                }
                else {
                  unsigned int v46 = 0LL;
                }
                int v47 = &v46[6 * v42];
                *((_WORD *)v47 + 2) = 0;
                *(_DWORD *)int v47 = 0;
                char v49 = *a6;
                uint64_t v48 = a6[1];
                unsigned int v50 = v47;
                if (v48 != *a6)
                {
                  do
                  {
                    int v51 = *(_DWORD *)(v48 - 6);
                    v48 -= 6;
                    __int16 v52 = *((_WORD *)v48 + 2);
                    *(_DWORD *)(v50 - 6) = v51;
                    v50 -= 6;
                    *((_WORD *)v50 + 2) = v52;
                  }

                  while (v48 != v49);
                  uint64_t v48 = *a6;
                }

                int v41 = v47 + 6;
                *a6 = v50;
                a6[1] = v47 + 6;
                a6[2] = &v46[6 * v45];
                if (v48) {
                  operator delete(v48);
                }
              }

              else
              {
                *(_WORD *)(v40 + 4) = 0;
                *(_DWORD *)unint64_t v40 = 0;
                int v41 = (char *)(v40 + 6);
              }

              a6[1] = v41;
              unsigned int v21 = *(MIDIEndpointRef **)(a5 + 8);
            }
          }

          if ((unint64_t)v21 >= *v12)
          {
            os_log_type_t v23 = *(MIDIEndpointRef **)a5;
            uint64_t v24 = ((uint64_t)v21 - *(void *)a5) >> 2;
            unint64_t v25 = v24 + 1;
            if ((unint64_t)(v24 + 1) >> 62) {
LABEL_102:
            }
              sub_2CF0();
            uint64_t v26 = *v12 - (void)v23;
            if (v26 >> 1 > v25) {
              unint64_t v25 = v26 >> 1;
            }
            else {
              unint64_t v27 = v25;
            }
            if (v27)
            {
              __int16 v28 = (char *)sub_19494(a5 + 16, v27);
              os_log_type_t v23 = *(MIDIEndpointRef **)a5;
              unsigned int v21 = *(MIDIEndpointRef **)(a5 + 8);
            }

            else
            {
              __int16 v28 = 0LL;
            }

            char v53 = (MIDIEndpointRef *)&v28[4 * v24];
            *char v53 = Source;
            unsigned int v22 = v53 + 1;
            while (v21 != v23)
            {
              MIDIEndpointRef v54 = *--v21;
              *--char v53 = v54;
            }

            *(void *)a5 = v53;
            *(void *)(a5 + 8) = v22;
            *(void *)(a5 + 16) = &v28[4 * v27];
            if (v23) {
              operator delete(v23);
            }
          }

          else
          {
            MIDIEndpointRef *v21 = Source;
            unsigned int v22 = v21 + 1;
          }

          *(void *)(a5 + 8) = v22;
          unint64_t v56 = (unint64_t)a6[1];
          unint64_t v55 = (unint64_t)a6[2];
          if (v56 >= v55)
          {
            unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v56 - (void)*a6) >> 1);
            unint64_t v59 = v58 + 1;
            if (v58 + 1 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_103:
            }
              sub_2CF0();
            unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (void)*a6) >> 1);
            if (2 * v60 > v59) {
              unint64_t v59 = 2 * v60;
            }
            if (v60 >= 0x1555555555555555LL) {
              unint64_t v61 = 0x2AAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v61 = v59;
            }
            if (v61) {
              __int16 v62 = (char *)sub_D06C(v90, v61);
            }
            else {
              __int16 v62 = 0LL;
            }
            int v63 = &v62[6 * v58];
            *((_WORD *)v63 + 2) = 0;
            *(_DWORD *)int v63 = 0;
            int v65 = *a6;
            __int16 v64 = a6[1];
            __int16 v66 = v63;
            if (v64 != *a6)
            {
              do
              {
                int v67 = *(_DWORD *)(v64 - 6);
                v64 -= 6;
                __int16 v68 = *((_WORD *)v64 + 2);
                *(_DWORD *)(v66 - 6) = v67;
                v66 -= 6;
                *((_WORD *)v66 + 2) = v68;
              }

              while (v64 != v65);
              __int16 v64 = *a6;
            }

            unsigned __int8 v57 = v63 + 6;
            *a6 = v66;
            a6[1] = v63 + 6;
            a6[2] = &v62[6 * v61];
            if (v64) {
              operator delete(v64);
            }
          }

          else
          {
            *(_WORD *)(v56 + 4) = 0;
            *(_DWORD *)unint64_t v56 = 0;
            unsigned __int8 v57 = (char *)(v56 + 6);
          }

          a6[1] = v57;
          uint64_t v15 = v19;
        }
      }

      if (NumberOfDestinations)
      {
        MIDIEntityRef v69 = v15;
        ItemCount v70 = 0LL;
        int v71 = v78;
        if (!v87) {
          int v71 = 1;
        }
        if (v79 == v86) {
          int v72 = v71;
        }
        else {
          int v72 = 1;
        }
        do
        {
          ItemCount v73 = v70 + outValue;
          MIDIEndpointRef Destination = MIDIEntityGetDestination(v69, v70);
          if (v82) {
            uint64_t v75 = (void *)v73;
          }
          else {
            uint64_t v75 = 0LL;
          }
          uint64_t v76 = 255LL;
          if (NumberOfDestinations - 1 != v70) {
            uint64_t v76 = (uint64_t)v75;
          }
          if (v72) {
            uint64_t v77 = v75;
          }
          else {
            uint64_t v77 = (void *)v76;
          }
          MIDIEndpointSetRefCons(Destination, v80, v77);
          ++v70;
        }

        while (NumberOfDestinations != v70);
      }

      ItemCount v11 = v86 + 1;
      a1 = v82;
    }

    while (v86 + 1 != v81);
  }

void *sub_19494(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_2DBC();
  }
  return operator new(4 * a2);
}

uint64_t sub_194C8(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  uint64_t v3 = (void *)(a1 + 48);
  *(void *)(a1 + 72) = 0LL;
  int v4 = (void *)(a1 + 72);
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  *(void *)a1 = off_24DE0;
  *(void *)(a1 + 8) = &unk_28000;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1LL;
  __int16 v13 = off_24E40;
  v14[0] = a1;
  uint64_t v5 = operator new(0x340uLL);
  *uint64_t v5 = off_24A60;
  v5[1] = off_24E40;
  void v5[2] = a1;
  bzero(v5 + 8, 0x300uLL);
  int v10 = v5;
  sub_FA24(v4, (uint64_t *)&v10);
  uint64_t v6 = (uint64_t)v10;
  int v10 = 0LL;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
  }
  ((void (*)(void *))v13[3])(v14);
  ItemCount v11 = off_24E68;
  v12[0] = a1;
  io_object_t v7 = operator new(0x340uLL);
  void *v7 = off_24A60;
  v7[1] = off_24E68;
  v7[2] = a1;
  bzero(v7 + 8, 0x300uLL);
  int v10 = v7;
  sub_FA24(v3, (uint64_t *)&v10);
  uint64_t v8 = (uint64_t)v10;
  int v10 = 0LL;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
  }
  ((void (*)(void *))v11[3])(v12);
  return a1;
}

void sub_19664( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a2) {
    sub_29BC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1970C(void *a1)
{
  *a1 = off_24DE0;
  uint64_t v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  sub_179B0((uint64_t)(a1 + 9));
  sub_179B0((uint64_t)(a1 + 6));
  return a1;
}

void sub_1975C(void *a1)
{
  uint64_t v1 = sub_1970C(a1);
  operator delete(v1);
}

uint64_t sub_19770(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_197A8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7LL;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16LL))(v4, a3);
  return 0LL;
}

uint64_t sub_197E4()
{
  return 0LL;
}

uint64_t sub_197EC(_DWORD *a1, CFUUIDBytes a2, void *a3)
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

uint64_t sub_199A0(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_199B4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 == 1) {
    (*(void (**)(uint64_t))(*(void *)(a1 - 8) + 8LL))(a1 - 8);
  }
  return v2;
}

uint64_t sub_199EC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 16LL))(a1 - 8);
}

uint64_t sub_199F8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 24LL))(a1 - 8);
}

uint64_t sub_19A04(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 32LL))(a1 - 8);
}

uint64_t sub_19A10(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 40LL))(a1 - 8);
}

uint64_t sub_19A1C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 48LL))(a1 - 8);
}

uint64_t sub_19A28(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 56LL))(a1 - 8);
}

uint64_t sub_19A34(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 64LL))(a1 - 8);
}

uint64_t sub_19A40(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 72LL))(a1 - 8);
}

uint64_t sub_19A4C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 80LL))(a1 - 8);
}

uint64_t sub_19A58(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 88LL))(a1 - 8);
}

uint64_t sub_19A64(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72LL))( *a1,  *(unsigned int *)(*a1 + 64LL),  *a2);
}

void *sub_19A7C(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_19A88(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_19A98(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48LL))( *a1,  *a2,  *(void *)(*a1 + 32LL),  *(void *)(*a1 + 40LL));
}

void *sub_19AB0(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_19ABC(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_19ACC(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, uint64_t *a4)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 32) = v8;
  if (v8)
  {
    CFUUIDRef v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  *(void *)(a1 + 40) = *(void *)a3;
  uint64_t v11 = *a4;
  *(_OWORD *)(a1 + 224) = 0u;
  *(void *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 56) = -1;
  *(void *)(a1 + 64) = 850045863LL;
  *(_OWORD *)(a1 + 136) = 0u;
  *(void *)(a1 + 192) = 0LL;
  *(void *)(a1 + 212) = 0LL;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(void *)(a1 + 152) = 0LL;
  *(void *)(a1 + 200) = 0LL;
  *(_BYTE *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(void *)(a1 + 320) = 0LL;
  *(_DWORD *)(a1 + 328) = -1;
  *(_BYTE *)(a1 + 332) = 0;
  sub_19ECC((void *)(a1 + 224));
  sub_19ECC((void *)(a1 + 192));
  *(_DWORD *)(a1 + 320) = MIDICapabilityGetDiscoveryMUID();
  sub_19F28();
  uint64_t v12 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
  {
    if (a3[1]) {
      unsigned __int8 v13 = *a3 | 0x80;
    }
    else {
      unsigned __int8 v13 = *a3;
    }
    int v14 = a3[6];
    int v15 = *((unsigned __int16 *)a3 + 2);
    if (*((_BYTE *)a4 + 1)) {
      unsigned __int8 v16 = *(_BYTE *)a4 | 0x80;
    }
    else {
      unsigned __int8 v16 = *(_BYTE *)a4;
    }
    int v17 = *((unsigned __int8 *)a4 + 6);
    int v18 = *((unsigned __int16 *)a4 + 2);
    int v19 = *(_DWORD *)(a1 + 320);
    *(_DWORD *)buf = 136317186;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 141;
    __int16 v28 = 1024;
    int v29 = v13;
    __int16 v30 = 1024;
    int v31 = v14;
    __int16 v32 = 1024;
    int v33 = v15;
    __int16 v34 = 1024;
    int v35 = v16;
    __int16 v36 = 1024;
    int v37 = v17;
    __int16 v38 = 1024;
    int v39 = v18;
    __int16 v40 = 1024;
    int v41 = v19;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] MIDIProtocolNegotiatior(inEP: 0x%x (pipeIndex %u, mps %u), outEP: 0x%x (pipeIndex %u, mps %u) - Nego tiating with MUID 0x%x",  buf,  0x3Cu);
  }

  for (int i = 0; i != 4; ++i)
  {
    unint64_t v42 = (uint64_t (**)())a1;
    sub_1C114((uint64_t *)&v42, a2, (unsigned __int16 *)(a1 + 52), buf);
    *(_BYTE *)(*(void *)buf + 64LL) = *(_BYTE *)(a1 + 54);
    sub_10B90((char **)(a1 + 136), (__int128 *)buf);
    unsigned int v21 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      unsigned int v22 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  sub_19F84((void *)(a1 + 192), (uint64_t *)(*(void *)(a1 + 136) + 16LL * *(unsigned int *)(a1 + 212)));
  uint64_t v24 = operator new(0xC0uLL);
  *(void *)buf = off_24E90;
  *(void *)&buf[8] = a1;
  unint64_t v42 = off_24E90;
  v43[0] = a1;
  sub_1C974((uint64_t)v24, (uint64_t *)buf, (uint64_t *)&v42);
  ((void (*)(uint64_t *))v42[3])(v43);
  (*(void (**)(_BYTE *))(*(void *)buf + 24LL))(&buf[8]);
  uint64_t v25 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v24;
  if (v25)
  {
    (*(void (**)(uint64_t))(*(void *)v25 + 8LL))(v25);
    uint64_t v24 = *(_DWORD **)(a1 + 16);
  }

  v24[18] = 1;
  return a1;
}

void sub_19E0C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (a2) {
    sub_29BC(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_19ECC(void *a1)
{
  int v1 = (std::__shared_weak_count *)a1[1];
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

void sub_19F28()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28170);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28170))
    {
      qword_28168 = (uint64_t)os_log_create("com.apple.coremidi", "proton");
      __cxa_guard_release(&qword_28170);
    }
  }

void *sub_19F84(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3)
  {
    CFUUIDRef v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  io_object_t v7 = (std::__shared_weak_count *)a1[1];
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

uint64_t sub_1A000(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)unint64_t v10 = 136315394;
    *(void *)&uint64_t v10[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 193;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] ~MIDIProtocolNegotiatior()", v10, 0x12u);
  }

  uint64_t v5 = *(void *)(a1 + 128);
  if (v5)
  {
    MIDITimerTaskDispose(v5, v3, v4);
    *(void *)(a1 + 128) = 0LL;
  }

  *(_BYTE *)(a1 + 332) = 1;
  sub_19F28();
  unint64_t v6 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)unint64_t v10 = 136315394;
    *(void *)&uint64_t v10[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 196;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d [-] ~MIDIProtocolNegotiatior()", v10, 0x12u);
  }

  sub_179B0(a1 + 224);
  sub_179B0(a1 + 192);
  *(void *)unint64_t v10 = a1 + 136;
  sub_17244((void ***)v10);
  std::mutex::~mutex((std::mutex *)(a1 + 64));
  sub_179B0(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0LL;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  }
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 8);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  return a1;
}

void sub_1A194(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_29BC(a1);
}

void sub_1A1A4(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 201;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [+] MIDIProtocolNegotiatior::negotiateProtocol()",  buf,  0x12u);
  }

  char v5 = 2;
  int v6 = 512;
  sub_3098(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), 0xFFFFFFFu, 0x70u, &v5, 5LL);
  sub_19F28();
  uint64_t v3 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 209;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d [Negotiating] Send Discovery message", buf, 0x12u);
  }

  *(_DWORD *)(a1 + 328) = 1;
  else {
    sub_1A394(a1);
  }
  sub_19F28();
  uint64_t v4 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "MIDIProtocolNegotiator.cpp";
    __int16 v9 = 1024;
    int v10 = 220;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [-] MIDIProtocolNegotiatior::negotiateProtocol()",  buf,  0x12u);
  }

void sub_1A394(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 332))
  {
    sub_19F28();
    uint64_t v2 = (os_log_s *)qword_28168;
    if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      uint64_t v7 = "MIDIProtocolNegotiator.cpp";
      __int16 v8 = 1024;
      int v9 = 460;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%25s:%-5d [timeout]", (uint8_t *)&v6, 0x12u);
    }

    uint64_t v5 = *(void *)(a1 + 128);
    if (v5)
    {
      MIDITimerTaskDispose(v5, v3, v4);
      *(void *)(a1 + 128) = 0LL;
    }

    *(_BYTE *)(a1 + 332) = 1;
    sub_1B964(a1, 0);
  }

uint64_t sub_1A478(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = 3758096385LL;
  if (a2 <= 3)
  {
    uint64_t v6 = *(void *)(a1 + 8LL * a2 + 160);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 136) + 16LL * a2);
      int v8 = *(unsigned __int8 *)(a1 + 208);
      if (*(_BYTE *)(v7 + 44))
      {
        if (!*(_BYTE *)(a1 + 208))
        {
          uint64_t v3 = 3758097109LL;
          sub_19F28();
          unint64_t v23 = (os_log_s *)qword_28168;
          if (!os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG)) {
            return v3;
          }
          *(_DWORD *)buf = 136315650;
          int v29 = "MIDIProtocolNegotiator.cpp";
          __int16 v30 = 1024;
          int v31 = 229;
          __int16 v32 = 1024;
          LODWORD(v33) = a2;
          uint64_t v24 = "%25s:%-5d [!] I/O pending on buffer %u";
LABEL_30:
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0x18u);
          return v3;
        }

        int v8 = 1;
      }

      *(_BYTE *)(v7 + 44) = 1;
      if (v8 && !a3) {
        return 0LL;
      }
      *(_BYTE *)(a1 + 208) = 1;
      uint64_t v9 = *(void *)(a1 + 24);
      sub_19F28();
      int v10 = (os_log_s *)qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
      {
        __int16 v11 = *(unsigned __int8 **)(v7 + 24);
        sub_3D94(__p, 3 * v6, 0);
        if (v27 >= 0) {
          int v12 = __p;
        }
        else {
          int v12 = (void **)__p[0];
        }
        uint64_t v13 = v6;
        do
        {
          unsigned int v14 = *v11++;
          *(_BYTE *)int v12 = a0123456789abcd_1[(unint64_t)v14 >> 4];
          *((_BYTE *)v12 + 1) = a0123456789abcd_1[v14 & 0xF];
          *((_BYTE *)v12 + 2) = 32;
          int v12 = (void **)((char *)v12 + 3);
          --v13;
        }

        while (v13);
        int v15 = __p;
        if (v27 < 0) {
          int v15 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315650;
        int v29 = "MIDIProtocolNegotiator.cpp";
        __int16 v30 = 1024;
        int v31 = 21;
        __int16 v32 = 2080;
        int v33 = v15;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] writeAsyncWithBuffer: %s", buf, 0x1Cu);
        if (v27 < 0) {
          operator delete(__p[0]);
        }
      }

      unsigned __int8 v16 = *(void ***)(v9 + 104);
      int v17 = (unsigned int *)(v7 + 8);
      do
        unsigned int v18 = __ldaxr(v17);
      while (__stlxr(v18 + 1, v17));
      int v19 = (*((uint64_t (**)(void **, void, void, uint64_t, void (*)(void *, int), uint64_t))*v16
             + 34))( v16,  *(unsigned __int8 *)(v7 + 64),  *(void *)(v7 + 24),  v6,  sub_1BA90,  a1);
      if (v19)
      {
        sub_19F28();
        uint64_t v20 = (os_log_s *)qword_28168;
        if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR))
        {
          int v21 = *(unsigned __int8 *)(v7 + 64);
          uint64_t v22 = *(void *)(v7 + 24);
          *(_DWORD *)buf = 136316674;
          int v29 = "MIDIProtocolNegotiator.cpp";
          __int16 v30 = 1024;
          int v31 = 26;
          __int16 v32 = 2048;
          int v33 = v16;
          __int16 v34 = 1024;
          int v35 = v21;
          __int16 v36 = 2048;
          uint64_t v37 = v22;
          __int16 v38 = 2048;
          uint64_t v39 = v6;
          __int16 v40 = 1024;
          int v41 = v19;
          _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] writePipeAsync(%p, %u, %p, %lu, ...) = 0x%x",  buf,  0x3Cu);
        }

        uint64_t v3 = (*((uint64_t (**)(void **, void, void, uint64_t, void (*)(void *, int), uint64_t))*v16
              + 34))( v16,  *(unsigned __int8 *)(v7 + 64),  *(void *)(v7 + 24),  v6,  sub_1BA90,  a1);
      }

      else
      {
        uint64_t v3 = 0LL;
      }

      sub_19F28();
      unint64_t v23 = (os_log_s *)qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v29 = "MIDIProtocolNegotiator.cpp";
        __int16 v30 = 1024;
        int v31 = 31;
        __int16 v32 = 1024;
        LODWORD(v33) = v3;
        uint64_t v24 = "%25s:%-5d [-] writeAsyncWithBuffer() = 0x%x";
        goto LABEL_30;
      }
    }
  }

  return v3;
}

void sub_1A82C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(_BYTE *)(a1 + 332)) {
    return;
  }
  uint64_t v5 = *(std::__shared_weak_count **)(a2 + 56);
  if (!v5)
  {
    uint64_t v7 = 0LL;
LABEL_16:
    sub_19F28();
    uint64_t v15 = qword_28168;
    if (!os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 255;
    unsigned __int8 v16 = "%25s:%-5d [readCallback: owning USBMIDIDevice destroyed]";
    int v17 = (os_log_s *)v15;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 18;
LABEL_23:
    _os_log_impl(&dword_0, v17, v18, v16, buf, v19);
    goto LABEL_24;
  }

  uint64_t v7 = std::__shared_weak_count::lock(v5);
  if (!v7 || !*(void *)(a2 + 48)) {
    goto LABEL_16;
  }
  *(_BYTE *)(a2 + 44) = 0;
  if (a3 < 5)
  {
    int v11 = 0;
LABEL_21:
    sub_19F28();
    uint64_t v20 = qword_28168;
    if (!os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    uint64_t v21 = *(void *)(a1 + 312);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 269;
    __int16 v25 = 1024;
    int v26 = v11;
    __int16 v27 = 1024;
    int v28 = v21;
    unsigned __int8 v16 = "%25s:%-5d [Negotiating] Read %u bytes (%u total), reading more ...";
    int v17 = (os_log_s *)v20;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 30;
    goto LABEL_23;
  }

  sub_19F28();
  int v8 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 261;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDIProtocolNegotiatior::handleCIInput() - %u bytes received",  buf,  0x18u);
  }

  *(void *)buf = *(void *)(a2 + 24);
  *(void *)&buf[8] = a3 >> 2;
  uint64_t v9 = a1 + 248;
  uint64_t v10 = sub_1AB04((uint64_t *)buf, a1 + 248 + *(void *)(a1 + 312), a1 + 312);
  int v11 = v10;
  int v12 = (unsigned __int8 *)(*(void *)(a1 + 312) + v10);
  *(void *)(a1 + 312) = v12;
  if (!v10) {
    goto LABEL_21;
  }
  if (v12)
  {
    uint64_t v13 = v12;
    unsigned int v14 = (unsigned __int8 *)(a1 + 248);
    while (*v14 != 247)
    {
      ++v14;
      if (!--v13)
      {
        unsigned int v14 = &v12[v9];
        break;
      }
    }
  }

  else
  {
    unsigned int v14 = (unsigned __int8 *)(a1 + 248);
  }

  if (v12 == &v14[-v9]) {
    goto LABEL_21;
  }
  sub_1AFA4(a1);
LABEL_24:
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

void sub_1AAEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1AB04(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  if (a2 >= a3) {
    return 0LL;
  }
  int v3 = a3;
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  sub_19F28();
  uint64_t v7 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v43 = "MIDIProtocolNegotiator.cpp";
    __int16 v44 = 1024;
    int v45 = 45;
    __int16 v46 = 1024;
    int v47 = v6;
    __int16 v48 = 1024;
    unsigned int v49 = v3 - a2;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] appendSysExToBuffer() - wordCount %u, %u bytes available",  buf,  0x1Eu);
  }

  if (v6)
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    unint64_t v10 = v5 + 4 * v6;
    unint64_t v40 = v6;
    while (1)
    {
      int v11 = (unsigned int *)(*a1 + 4 * v8);
      unsigned int v12 = *v11;
      unsigned int v13 = *v11 >> 28;
      if (v13 == 1)
      {
        sub_19F28();
        uint64_t v19 = qword_28168;
        if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
        {
          int v20 = *v11;
          *(_DWORD *)buf = 136315650;
          unint64_t v43 = "MIDIProtocolNegotiator.cpp";
          __int16 v44 = 1024;
          int v45 = 54;
          __int16 v46 = 1024;
          int v47 = v20;
          uint64_t v21 = (os_log_s *)v19;
          os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
          unint64_t v23 = "%25s:%-5d      skipping msg: 0x%08x";
LABEL_19:
          _os_log_impl(&dword_0, v21, v22, v23, buf, 0x18u);
        }
      }

      else
      {
        if (v13 == 3)
        {
          uint64_t __src = 0LL;
          unsigned int v14 = (v12 >> 20) & 0xF;
          BOOL v15 = v14 == 0;
          BOOL v16 = v14 == 3;
          if (v14 == 3) {
            BOOL v15 = 1;
          }
          int v17 = HIWORD(v12) & 0xF;
          if (v14 < 2) {
            ++v17;
          }
          unsigned int v18 = v17 + v15;
          if ((v17 + v15) <= 8)
          {
            BOOL v26 = v14 == 3 || v14 == 0;
            LODWORD(v27) = v17 + v15;
            if (v26)
            {
              uint64_t v27 = (int)v18 - 1LL;
              *((_BYTE *)&__src + v27) = -9;
            }

            if (v14 > 1)
            {
              p_src = (char *)&__src;
            }

            else
            {
              LOBYTE(__src) = -16;
              LODWORD(v27) = v27 - 1;
              p_src = (char *)&__src + 1;
            }

            if ((int)v27 >= 1)
            {
              char v29 = 0;
              uint64_t v30 = 0LL;
              do
              {
                if (v30 <= 5)
                {
                  else {
                    char v32 = 8;
                  }
                  char v31 = v11[v30 > 1] >> (v32 + v29);
                }

                else
                {
                  char v31 = 0;
                }

                p_src[v30] = v31;
                v29 -= 8;
                ++v30;
              }

              while (v27 != v30);
            }
          }

          else
          {
            unsigned int v18 = 0;
          }

          sub_19F28();
          int v33 = (os_log_s *)qword_28168;
          if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
          {
            int v34 = *v11;
            unsigned int v35 = v11[1];
            __int16 v36 = (const char *)&unk_1E599;
            if (v14 == 3) {
              __int16 v36 = "[END]";
            }
            *(_DWORD *)buf = 136316418;
            unint64_t v43 = "MIDIProtocolNegotiator.cpp";
            __int16 v44 = 1024;
            int v45 = 60;
            __int16 v46 = 1024;
            int v47 = v34;
            __int16 v48 = 1024;
            unsigned int v49 = v35;
            __int16 v50 = 1024;
            unsigned int v51 = v18;
            __int16 v52 = 2080;
            char v53 = v36;
            _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d      sysex 0x%08x 0x%08x (%u bytes converted) %s",  buf,  0x2Eu);
          }

          memcpy((void *)(a2 + v9), &__src, v18);
          v9 += v18;
          unint64_t v6 = v40;
          goto LABEL_44;
        }

        sub_19F28();
        uint64_t v24 = qword_28168;
        if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR))
        {
          int v25 = *v11;
          *(_DWORD *)buf = 136315650;
          unint64_t v43 = "MIDIProtocolNegotiator.cpp";
          __int16 v44 = 1024;
          int v45 = 51;
          __int16 v46 = 1024;
          int v47 = v25;
          uint64_t v21 = (os_log_s *)v24;
          os_log_type_t v22 = OS_LOG_TYPE_ERROR;
          unint64_t v23 = "%25s:%-5d [!] appendSysExToBuffer() - sysex message cannot be interrupted with message with first word 0x%x";
          goto LABEL_19;
        }
      }

      BOOL v16 = 0;
LABEL_44:
      unint64_t v8 = v8 + byte_1FB58[(unint64_t)*v11 >> 28];
      if (v8 >= v6 || v16) {
        goto LABEL_51;
      }
    }
  }

  uint64_t v9 = 0LL;
LABEL_51:
  sub_19F28();
  __int16 v38 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v43 = "MIDIProtocolNegotiator.cpp";
    __int16 v44 = 1024;
    int v45 = 66;
    __int16 v46 = 1024;
    int v47 = v9;
    _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] appendSysExToBuffer() - %u total bytes copied",  buf,  0x18u);
  }

  return v9;
}

void sub_1AFA4(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 312);
    if (v3)
    {
      sub_3D94(__p, 3 * v3, 0);
      uint64_t v4 = (unsigned __int8 *)(a1 + 248);
      if (v55 >= 0) {
        uint64_t v5 = __p;
      }
      else {
        uint64_t v5 = (void **)__p[0];
      }
      do
      {
        unsigned int v6 = *v4++;
        *(_BYTE *)uint64_t v5 = a0123456789abcd_1[(unint64_t)v6 >> 4];
        *((_BYTE *)v5 + 1) = a0123456789abcd_1[v6 & 0xF];
        *((_BYTE *)v5 + 2) = 32;
        uint64_t v5 = (void **)((char *)v5 + 3);
        --v3;
      }

      while (v3);
    }

    else
    {
      sub_CFBC(__p, (char *)&unk_1E599);
    }

    uint64_t v7 = __p;
    if (v55 < 0) {
      uint64_t v7 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 278;
    __int16 v59 = 2080;
    *(void *)unint64_t v60 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [handleMessage] RCV: %s", buf, 0x1Cu);
    if (v55 < 0) {
      operator delete(__p[0]);
    }
  }

  int v8 = *(_DWORD *)(a1 + 328);
  if (v8 == 1)
  {
    if (sub_1BF80(a1 + 248, *(void *)(a1 + 312), 113, 31LL))
    {
      uint64_t v11 = *(void *)(a1 + 128);
      if (v11)
      {
        MIDITimerTaskDispose(v11, v9, v10);
        *(void *)(a1 + 128) = 0LL;
      }

      *(_DWORD *)(a1 + 324) = *(_BYTE *)(a1 + 254) & 0x7F | ((*(_BYTE *)(a1 + 255) & 0x7F) << 7) & 0x3FFF | ((*(_BYTE *)(a1 + 256) & 0x7F) << 14) & 0xF01FFFFF | ((*(_BYTE *)(a1 + 257) & 0x7F) << 21);
      sub_19F28();
      unsigned int v12 = (os_log_s *)qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
      {
        int v13 = *(_DWORD *)(a1 + 324);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v57 = 1024;
        int v58 = 283;
        __int16 v59 = 1024;
        *(_DWORD *)unint64_t v60 = v13;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v13;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "%25s:%-5d [handleMessage: Discovery Reply] Discovered MUID 0x%x (%u)",  buf,  0x1Eu);
      }

      *(_WORD *)&buf[8] = 0;
      *(void *)buf = 0x20000000001LL;
      sub_3098(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x10u, buf, 10LL);
      *(_DWORD *)(a1 + 328) = 2;
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
      {
        sub_1BE54(a1, dbl_1FC50[*(_DWORD *)(a1 + 328) == 1]);
LABEL_86:
        bzero((void *)(a1 + 248), 0x40uLL);
        *(void *)(a1 + 312) = 0LL;
        return;
      }

      int v50 = -536870163;
      goto LABEL_83;
    }

    int v8 = *(_DWORD *)(a1 + 328);
  }

  if (v8 != 2)
  {
LABEL_43:
    if (v8 == 4 && sub_1BF80(a1 + 248, *(void *)(a1 + 312), 20, 64LL))
    {
      uint64_t v32 = 0LL;
      while (v32 == *(unsigned __int8 *)(a1 + v32 + 263))
      {
        if (++v32 == 48)
        {
          uint64_t v33 = *(void *)(a1 + 128);
          if (v33)
          {
            MIDITimerTaskDispose(v33, v30, v31);
            *(void *)(a1 + 128) = 0LL;
          }

          sub_19F28();
          int v34 = (os_log_s *)qword_28168;
          if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
            __int16 v57 = 1024;
            int v58 = 343;
            _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "%25s:%-5d [Negotiating] Protocol Test: confirming new protocol established...",  buf,  0x12u);
          }

          sub_3098(*(void *)(a1 + 16), 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x15u, 0LL, 0LL);
          if (!(*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
          {
            int v50 = -536870163;
            goto LABEL_83;
          }

          sub_19F28();
          unsigned int v35 = (os_log_s *)qword_28168;
          if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
            __int16 v57 = 1024;
            int v58 = 349;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "%25s:%-5d [Negotiating] Done with negotiation.", buf, 0x12u);
          }

          sub_1B964(a1, 8);
          goto LABEL_86;
        }
      }
    }

    if (*(void *)(a1 + 312) >= 5uLL && *(_BYTE *)(a1 + 252) == 127)
    {
      sub_19F28();
      uint64_t v36 = qword_28168;
      if (!os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      __int16 v57 = 1024;
      int v58 = 353;
      uint64_t v37 = "%25s:%-5d [Negotiating] NAK received";
      __int16 v38 = (os_log_s *)v36;
      uint32_t v39 = 18;
    }

    else
    {
      sub_19F28();
      uint64_t v40 = qword_28168;
      if (!os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR)) {
        goto LABEL_86;
      }
      int v41 = *(unsigned __int8 *)(a1 + 248);
      int v42 = *(_DWORD *)(a1 + 328);
      uint64_t v43 = *(void *)(a1 + 312);
      uint64_t v44 = v43 - 1;
      if (!v43) {
        uint64_t v44 = 0LL;
      }
      int v45 = *(unsigned __int8 *)(a1 + 248 + v44);
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      __int16 v57 = 1024;
      int v58 = 355;
      __int16 v59 = 1024;
      *(_DWORD *)unint64_t v60 = v42;
      *(_WORD *)&v60[4] = 1024;
      *(_DWORD *)&v60[6] = v43;
      __int16 v61 = 1024;
      int v62 = v41;
      __int16 v63 = 1024;
      int v64 = v45;
      uint64_t v37 = "%25s:%-5d [!]  status = %d, msgSize = %u (%02x ... %02x)";
      __int16 v38 = (os_log_s *)v40;
      uint32_t v39 = 42;
    }

LABEL_85:
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_86;
  }

  unint64_t v14 = *(void *)(a1 + 312);
  BOOL v15 = sub_1BF80(a1 + 248, v14, 17, v14);
  if (v14 <= 0x11 || !v15)
  {
    int v8 = *(_DWORD *)(a1 + 328);
    goto LABEL_43;
  }

  uint64_t v19 = *(void *)(a1 + 128);
  if (v19)
  {
    MIDITimerTaskDispose(v19, v16, v17);
    *(void *)(a1 + 128) = 0LL;
  }

  sub_19F28();
  int v20 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 296;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [Negotiating: Protocol Discovery] Examining protocols ...",  buf,  0x12u);
  }

  unsigned int v21 = *(unsigned __int8 *)(a1 + 263);
  if (*(_BYTE *)(a1 + 263))
  {
    int v22 = 0;
    char v23 = 0;
    unsigned int v24 = 0;
    int v25 = (unsigned __int8 *)(a1 + 264);
    do
    {
      int v26 = *v25;
      int v27 = v25[2];
      sub_19F28();
      int v28 = (os_log_s *)qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v57 = 1024;
        int v58 = 309;
        __int16 v59 = 1024;
        *(_DWORD *)unint64_t v60 = v26;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v27;
        _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [Negotiating: Protocol Discovery] Found protocol: 0x%x, extension bitmap 0x%x",  buf,  0x1Eu);
      }

      int v29 = ((v27 & 3) == 0) | v22;
      if (v26 != 1) {
        int v29 = v22;
      }
      if (v26 == 2) {
        v23 |= (v27 & 1) == 0;
      }
      else {
        int v22 = v29;
      }
      v25 += 5;
      ++v24;
    }

    while (v24 < v21);
  }

  else
  {
    char v23 = 0;
    LOBYTE(v22) = 0;
  }

  sub_19F28();
  __int16 v46 = (os_log_s *)qword_28168;
  if ((v22 & 1) != 0 || (v23 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
    {
      int v47 = "MIDI-1UP";
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      *(_DWORD *)buf = 136315650;
      if ((v23 & 1) != 0) {
        int v47 = "MIDI 2.0";
      }
      __int16 v57 = 1024;
      int v58 = 324;
      __int16 v59 = 2080;
      *(void *)unint64_t v60 = v47;
      _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_INFO,  "%25s:%-5d [Negotiating: Protocol Discovery] Setting %s protocol...",  buf,  0x1Cu);
    }

    if ((v23 & 1) != 0) {
      char v48 = 2;
    }
    else {
      char v48 = 1;
    }
    LOBYTE(__p[0]) = v48;
    uint64_t v49 = *(void *)(a1 + 16);
    *(_DWORD *)((char *)__p + 1) = 0;
    sub_3098(v49, 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x12u, (char *)__p, 5LL);
    *(_DWORD *)(a1 + 328) = 3;
    int v50 = -536870163;
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
    {
      sub_19F28();
      unsigned int v51 = (os_log_s *)qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
        __int16 v57 = 1024;
        int v58 = 332;
        _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_INFO,  "%25s:%-5d [Negotiating: Test Protocol] Sending protocol test data ...",  buf,  0x12u);
      }

      uint64_t v52 = *(void *)(a1 + 16);
      *(_DWORD *)(a1 + 328) = 4;
      sub_3098(v52, 127, *(_DWORD *)(a1 + 320), *(_DWORD *)(a1 + 324), 0x13u, 0LL, 0LL);
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16)))
      {
        sub_1BE54(a1, dbl_1FC50[*(_DWORD *)(a1 + 328) == 1]);
        int v50 = 0;
        *(_BYTE *)(a1 + 56) = v48;
      }
    }

    if (!v50) {
      goto LABEL_86;
    }
LABEL_83:
    sub_19F28();
    uint64_t v53 = qword_28168;
    if (!os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR)) {
      goto LABEL_86;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 360;
    __int16 v59 = 1024;
    *(_DWORD *)unint64_t v60 = v50;
    uint64_t v37 = "%25s:%-5d [!] handleMessage failed with 0x%x";
    __int16 v38 = (os_log_s *)v53;
    uint32_t v39 = 24;
    goto LABEL_85;
  }

  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
    __int16 v57 = 1024;
    int v58 = 317;
    _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [Negotiation Failure] No usable protocols discovered",  buf,  0x12u);
  }

  sub_1A394(a1);
}

void sub_1B964(uint64_t a1, int a2)
{
  uint64_t v4 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = "success";
    uint64_t v9 = "MIDIProtocolNegotiator.cpp";
    int v8 = 136315650;
    if (!a2) {
      uint64_t v5 = "failure";
    }
    __int16 v10 = 1024;
    int v11 = 433;
    __int16 v12 = 2080;
    int v13 = v5;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "%25s:%-5d [*] MIDIProtocolNegotiator::finished(%s)",  (uint8_t *)&v8,  0x1Cu);
  }

  *(_BYTE *)(a1 + 332) = 1;
  *(_DWORD *)(a1 + 328) = a2;
  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && !*(_BYTE *)(v6 + 184))
  {
    else {
      char v7 = 0x2010201u >> (8 * (a2 - 5));
    }
    *(_BYTE *)(a1 + 56) = v7;
    sub_1BD08(a1);
  }

void sub_1BA90(void *a1, int a2)
{
  if (a2 == -536870165)
  {
    sub_19F28();
    uint64_t v2 = (os_log_s *)qword_28168;
    if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "MIDIProtocolNegotiator.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 367;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d [write aborted]", buf, 0x12u);
    }
  }

  else if (a1)
  {
    sub_17F78(buf, a1);
    if (*(void *)buf && !*(_BYTE *)(*(void *)buf + 332LL))
    {
      uint64_t v3 = (std::mutex *)(*(void *)buf + 64LL);
      std::mutex::lock((std::mutex *)(*(void *)buf + 64LL));
      uint64_t v4 = *(void *)buf;
      uint64_t v5 = (void *)(*(void *)buf + 224LL);
      uint64_t v6 = *(void *)(*(void *)buf + 224LL);
      uint64_t v16 = (unsigned int *)v6;
      if (v6)
      {
        *(_BYTE *)(v6 + 44) = 0;
        int v7 = *(_DWORD *)(v4 + 216);
        *(_DWORD *)(v4 + 216) = v7 + 1;
        if (v7 == 3) {
          unsigned int v8 = 0;
        }
        else {
          unsigned int v8 = v7 + 1;
        }
        uint64_t v9 = (uint64_t *)(*(void *)(v4 + 136) + 16LL * v8);
        if (*(_BYTE *)(*v9 + 44))
        {
          *(_DWORD *)(v4 + 216) = v8;
          sub_19F84(v5, v9);
        }

        else
        {
          sub_19ECC(v5);
        }

        if (*(void *)(*(void *)buf + 24LL))
        {
          if (*(void *)(*(void *)buf + 224LL)) {
            sub_1A478(*(void *)buf, *(unsigned int *)(*(void *)buf + 216LL), 1LL);
          }
          else {
            *(_BYTE *)(*(void *)buf + 208LL) = 0;
          }
        }

        __int16 v10 = v16 + 2;
        do
        {
          unsigned int v11 = __ldaxr(v10);
          unsigned int v12 = v11 - 1;
        }

        while (__stlxr(v12, v10));
        if (!v12) {
          (*(void (**)(unsigned int *))(*(void *)v16 + 16LL))(v16);
        }
      }

      std::mutex::unlock(v3);
    }

    int v13 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      unint64_t v14 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

void sub_1BC70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int **a9, uint64_t a10, char a11)
{
}

unsigned int ***sub_1BCB4(unsigned int ***a1)
{
  uint64_t v2 = **a1;
  uint64_t v3 = v2 + 2;
  do
  {
    unsigned int v4 = __ldaxr(v3);
    unsigned int v5 = v4 - 1;
  }

  while (__stlxr(v5, v3));
  if (!v5) {
    (*(void (**)(unsigned int *))(*(void *)v2 + 16LL))(v2);
  }
  return a1;
}

void sub_1BD08(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 41)) {
      unsigned __int8 v4 = *(_BYTE *)(a1 + 40) | 0x80;
    }
    else {
      unsigned __int8 v4 = *(_BYTE *)(a1 + 40);
    }
    if (*(_BYTE *)(a1 + 49)) {
      unsigned __int8 v5 = *(_BYTE *)(a1 + 48) | 0x80;
    }
    else {
      unsigned __int8 v5 = *(_BYTE *)(a1 + 48);
    }
    int v9 = 136316162;
    __int16 v10 = "MIDIProtocolNegotiator.cpp";
    __int16 v11 = 1024;
    int v12 = 424;
    __int16 v13 = 1024;
    int v14 = v3;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDIProtocolNegotiator::completeNegotiation(selectedProtocol:%x) - inEP: 0x%x, outEP: 0x%x",  (uint8_t *)&v9,  0x24u);
  }

  uint64_t v6 = *(void *)(a1 + 24);
  if (v6 && !*(_BYTE *)(v6 + 184))
  {
    if (*(_BYTE *)(a1 + 41)) {
      unsigned __int8 v7 = *(_BYTE *)(a1 + 40) | 0x80;
    }
    else {
      unsigned __int8 v7 = *(_BYTE *)(a1 + 40);
    }
    if (*(_BYTE *)(a1 + 49)) {
      unsigned __int8 v8 = *(_BYTE *)(a1 + 48) | 0x80;
    }
    else {
      unsigned __int8 v8 = *(_BYTE *)(a1 + 48);
    }
    sub_10CD0(v6, v7, v8, *(unsigned __int8 *)(a1 + 56));
  }

void sub_1BE54(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 128);
  if (!v3)
  {
    uint64_t v3 = MIDITimerTaskCreate(sub_1BD04, a1);
    *(void *)(a1 + 128) = v3;
  }

  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = __udivti3( 3 * (unint64_t)(a2 * 1000000.0),  ((unint64_t)(a2 * 1000000.0) * (unsigned __int128)3uLL) >> 64,  125LL,  0LL);
  MIDITimerTaskSetNextWakeTime(v3, v5 + v6);
  sub_19F28();
  unsigned __int8 v7 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    int v9 = "MIDIProtocolNegotiator.cpp";
    __int16 v10 = 1024;
    int v11 = 473;
    __int16 v12 = 2048;
    double v13 = a2;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [Negotiating] Timeout %f ms from now",  (uint8_t *)&v8,  0x1Cu);
  }

BOOL sub_1BF80(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  if (a2 < 5) {
    return 0LL;
  }
  int v9 = *(unsigned __int8 *)(a1 + 4);
  if (a2 != a4)
  {
    sub_19F28();
    __int16 v10 = (os_log_s *)qword_28168;
    if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      __int16 v15 = "MIDIProtocolNegotiator.cpp";
      __int16 v16 = 1024;
      int v17 = 75;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 1024;
      int v21 = a4;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] spanMatchesTypeAndLength() - msgSize %u does not match supplied length %u",  (uint8_t *)&v14,  0x1Eu);
    }
  }

  if (v9 != a3)
  {
    sub_19F28();
    int v11 = (os_log_s *)qword_28168;
    if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
    {
      int v12 = *(unsigned __int8 *)(a1 + 4);
      int v14 = 136315906;
      __int16 v15 = "MIDIProtocolNegotiator.cpp";
      __int16 v16 = 1024;
      int v17 = 77;
      __int16 v18 = 1024;
      int v19 = v12;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] spanMatchesTypeAndLength() - subID2 %u does not match supplied type %u",  (uint8_t *)&v14,  0x1Eu);
    }
  }

  return a2 == a4 && v9 == a3;
}

void *sub_1C114@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X2>, unsigned __int16 *a3@<X3>, void *a4@<X8>)
{
  int v8 = operator new(0x60uLL);
  uint64_t result = sub_1C184(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_1C170(_Unwind_Exception *a1)
{
}

void *sub_1C184(void *a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  a1[2] = 0LL;
  *a1 = off_24D18;
  a1[1] = 0LL;
  sub_1C1D0((uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_1C1BC(_Unwind_Exception *a1)
{
}

uint64_t sub_1C1D0(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned __int16 *a4)
{
  uint64_t v5 = *a2;
  uint64_t v6 = (std::__shared_weak_count *)a3[1];
  uint64_t v10 = *a3;
  int v11 = v6;
  if (v6)
  {
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
  }

  sub_18170(a1, v5, &v10, *a4);
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  return a1;
}

void sub_1C238( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C250(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v3 = *a1;
  int v65 = (std::mutex *)(*a1 + 64);
  std::mutex::lock(v65);
  sub_19F28();
  unsigned __int8 v4 = (os_log_s *)qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *a2;
    uint64_t v5 = a2[1];
    int64_t v7 = v5 - *a2;
    if (v5 == *a2)
    {
      sub_CFBC(__p, (char *)&unk_1E599);
    }

    else
    {
      sub_3D94(__p, 3 * v7, 0);
      if (v70 >= 0) {
        unint64_t v8 = __p;
      }
      else {
        unint64_t v8 = (void **)__p[0];
      }
      int64_t v9 = v7;
      do
      {
        unsigned int v10 = *v6++;
        *(_BYTE *)unint64_t v8 = a0123456789abcd_1[(unint64_t)v10 >> 4];
        *((_BYTE *)v8 + 1) = a0123456789abcd_1[v10 & 0xF];
        *((_BYTE *)v8 + 2) = 32;
        unint64_t v8 = (void **)((char *)v8 + 3);
        --v9;
      }

      while (v9);
    }

    int v11 = __p;
    if (v70 < 0) {
      int v11 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315906;
    int v72 = "MIDIProtocolNegotiator.cpp";
    __int16 v73 = 1024;
    int v74 = 154;
    __int16 v75 = 1024;
    int v76 = v7;
    __int16 v77 = 2080;
    int v78 = v11;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d [+] MIDICIMessageEmitter %u bytes: %s", buf, 0x22u);
    if (v70 < 0) {
      operator delete(__p[0]);
    }
  }

  if (!*(void *)(v3 + 24)) {
    goto LABEL_105;
  }
  int64_t v12 = a2[1] - *a2;
  if (*((_DWORD *)a2 + 2) == *(_DWORD *)a2) {
    goto LABEL_105;
  }
  unsigned int v13 = v12 - (**a2 == 240) - ((*a2)[*((_DWORD *)a2 + 2) - *(_DWORD *)a2 - 1] == 247);
  if (v13)
  {
    if (v13 % 6) {
      unsigned int v14 = v13 / 6 + 1;
    }
    else {
      unsigned int v14 = v13 / 6;
    }
    int v15 = 8 * v14;
  }

  else
  {
    int v15 = 8;
  }

  unsigned int v66 = v15;
  unsigned int v16 = 0;
  if (!(_DWORD)v12 || !v15)
  {
LABEL_96:
    if (v66 != v16)
    {
      sub_19F28();
      __int16 v57 = (os_log_s *)qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v72 = "MIDIProtocolNegotiator.cpp";
        __int16 v73 = 1024;
        int v74 = 184;
        __int16 v75 = 1024;
        int v76 = v16;
        _os_log_impl( &dword_0,  v57,  OS_LOG_TYPE_ERROR,  "%25s:%-5d [!] MIDICIMessageEmitter did not copy %u bytes",  buf,  0x18u);
      }
    }

    goto LABEL_105;
  }

  unsigned int v16 = 0;
  unsigned int v17 = 0;
  __int16 v18 = (uint64_t *)(v3 + 192);
  int v19 = (void *)(v3 + 224);
  __int16 v63 = a2;
  uint64_t v64 = v3;
  __int16 v68 = (uint64_t *)(v3 + 192);
  while (1)
  {
    unsigned int v67 = v16;
    uint64_t v20 = *v18;
    int v21 = *a2;
    uint64_t v22 = *(unsigned int *)(v20 + 40);
    if ((_DWORD)v22)
    {
      uint64_t v23 = 0LL;
      unsigned int v24 = 0LL;
      LODWORD(v25) = 0;
      int v26 = &v21[v17];
      uint64_t v27 = *(void *)(v20 + 24);
      unint64_t v28 = v27 + v22;
      while (1)
      {
        if ((_DWORD)v25)
        {
          int v29 = 2;
        }

        else
        {
          LODWORD(v25) = v26[v23] == 240;
          if (v26[v23] == 240) {
            int v29 = 1;
          }
          else {
            int v29 = 2;
          }
        }

        unsigned int v30 = (unsigned __int16)(v12 - v25);
        uint64_t v31 = (char *)&v26[v25];
        if (v30 >= 6) {
          uint64_t v32 = 6LL;
        }
        else {
          uint64_t v32 = (unsigned __int16)(v12 - v25);
        }
        uint64_t v33 = (char *)&v26[v25];
        if ((_DWORD)v32)
        {
          uint64_t v34 = v32;
          uint64_t v33 = (char *)&v26[v25];
          while (*v33 != 247)
          {
            ++v33;
            if (!--v34)
            {
              uint64_t v33 = &v31[v32];
              break;
            }
          }
        }

        uint64_t v35 = v33 - v31;
        BOOL v36 = v30 == 7;
        if (v30 == 7) {
          int v37 = v25 + 7;
        }
        else {
          int v37 = v25;
        }
        if (v36) {
          int v38 = 3;
        }
        else {
          int v38 = v29;
        }
        if (v35 == v32) {
          LODWORD(v25) = v37;
        }
        else {
          LODWORD(v25) = v25 + v32;
        }
        if (v35 == v32) {
          uint64_t v39 = v32;
        }
        else {
          uint64_t v39 = (v32 - 1);
        }
        if (v35 == v32) {
          int v40 = v38;
        }
        else {
          int v40 = 3;
        }
        unint64_t v41 = 6LL;
        if (v39 < 6) {
          unint64_t v41 = v39;
        }
        if (!v41) {
          break;
        }
        char v42 = *v31;
        if (v41 == 1)
        {
          char v43 = 0;
          char v44 = 0;
LABEL_61:
          char v45 = 0;
LABEL_62:
          char v46 = 0;
LABEL_63:
          char v47 = 0;
          goto LABEL_64;
        }

        char v45 = v31[1];
        if (v41 < 3)
        {
          char v43 = 0;
          char v44 = 0;
          goto LABEL_62;
        }

        char v44 = v31[2];
        if (v41 == 3)
        {
          char v43 = 0;
          goto LABEL_62;
        }

        char v46 = v31[3];
        if (v41 < 5)
        {
          char v43 = 0;
          goto LABEL_63;
        }

        char v43 = v31[4];
        if (v41 == 5) {
          goto LABEL_63;
        }
        char v47 = v31[5];
LABEL_64:
        if ((unint64_t)v24 + v27 + 8 <= v28)
        {
          *(void **)((char *)v24 + v27) = (void *)((v40 << 20) | (v41 << 16) | ((unint64_t)(v42 & 0x7F) << 8) | v45 & 0x7F | ((unint64_t)(((v44 & 0x7F) << 24) | ((v46 & 0x7F) << 16) | ((v43 & 0x7F) << 8) | v47 & 0x7Fu) << 32) | 0x30000000);
          if (v40 == 3) {
            int v48 = 0;
          }
          else {
            int v48 = v39;
          }
          unsigned __int8 v49 = atomic_load((unsigned __int8 *)&qword_28180);
          if ((v49 & 1) == 0 && __cxa_guard_acquire(&qword_28180))
          {
            qword_28178 = (uint64_t)os_log_create("com.apple.coremidi", "umptrs");
            __cxa_guard_release(&qword_28180);
          }

          ++v24;
          uint64_t v25 = (v48 + v25);
          int v50 = (os_log_s *)qword_28178;
          if (os_log_type_enabled((os_log_t)qword_28178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            int v72 = "USBMIDIUMPTranslation.h";
            __int16 v73 = 1024;
            int v74 = 450;
            __int16 v75 = 1024;
            int v76 = v25;
            __int16 v77 = 2048;
            int v78 = v24;
            __int16 v79 = 1024;
            int v80 = v12 - v25;
            _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d [*] MIDI1SysExToUMPSysEx() - @ index %u: %lu UMP bytes written so far, %u legacy MIDI bytes remain",  buf,  0x28u);
          }

          if (v40 != 3)
          {
            uint64_t v23 = v25;
          }
        }

        LODWORD(v12) = v12 - v25;
        a2 = v63;
        uint64_t v3 = v64;
        int v21 = *v63;
        goto LABEL_86;
      }

      char v43 = 0;
      char v44 = 0;
      char v42 = 0;
      goto LABEL_61;
    }

    LODWORD(v12) = 0;
    LODWORD(v24) = 0;
LABEL_86:
    uint64_t v51 = *(unsigned int *)(v3 + 212);
    *(void *)(v3 + 8 * v51 + 160) = v24;
    if (!(_DWORD)v24) {
      break;
    }
    uint64_t v52 = a2[1];
    int v53 = sub_1A478(v3, v51, 0);
    if (v53)
    {
      sub_19F28();
      uint64_t v62 = qword_28168;
      if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v72 = "MIDIProtocolNegotiator.cpp";
        __int16 v73 = 1024;
        int v74 = 174;
        __int16 v75 = 1024;
        int v76 = v53;
        __int16 v59 = "%25s:%-5d [!] copyEmitter: write failed with err 0x%x";
        unint64_t v60 = (os_log_s *)v62;
        uint32_t v61 = 24;
LABEL_103:
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
      }

      goto LABEL_104;
    }

    if (*v19)
    {
      int v54 = *(_DWORD *)(v3 + 212);
      char v55 = v68;
    }

    else
    {
      char v55 = v68;
      sub_19F84(v19, v68);
      int v54 = *(_DWORD *)(v3 + 212);
      *(_DWORD *)(v3 + 216) = v54;
    }

    unsigned int v16 = (_DWORD)v24 + v67;
    if (v54 == 3) {
      unsigned int v56 = 0;
    }
    else {
      unsigned int v56 = v54 + 1;
    }
    *(_DWORD *)(v3 + 212) = v56;
    sub_19F84(v55, (uint64_t *)(*(void *)(v3 + 136) + 16LL * v56));
    if (v16 < v66)
    {
      unsigned int v17 = (_DWORD)v52 - ((_DWORD)v21 + v12);
      __int16 v18 = v68;
      if ((_DWORD)v12) {
        continue;
      }
    }

    goto LABEL_96;
  }

  sub_19F28();
  uint64_t v58 = qword_28168;
  if (os_log_type_enabled((os_log_t)qword_28168, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v72 = "MIDIProtocolNegotiator.cpp";
    __int16 v73 = 1024;
    int v74 = 169;
    __int16 v59 = "%25s:%-5d [!] copyEmitter: no bytes copied";
    unint64_t v60 = (os_log_s *)v58;
    uint32_t v61 = 18;
    goto LABEL_103;
  }

LABEL_104:
  sub_1A394(v3);
LABEL_105:
  std::mutex::unlock(v65);
}

void sub_1C93C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12)
{
}

void *sub_1C958(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_1C964(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_1C974(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_1CBEC((void *)a1, 0x200uLL);
  *uint64_t v6 = off_24EC8;
  *((_DWORD *)v6 + 18) = 0;
  uint64_t v7 = *a2;
  v6[10] = *a2;
  (*(void (**)(void *, uint64_t *))(v7 + 8))(v6 + 11, a2 + 1);
  uint64_t v8 = *a3;
  *(void *)(a1 + 120) = *a3;
  (*(void (**)(uint64_t, uint64_t *))(v8 + 8))(a1 + 128, a3 + 1);
  *(void *)(a1 + 165) = 0LL;
  *(void *)(a1 + 160) = 0LL;
  *(void *)(a1 + 176) = 0LL;
  *(_BYTE *)(a1 + 184) = 0;
  sub_307C(a1);
  return a1;
}

void sub_1CA10(_Unwind_Exception *a1)
{
}

void *sub_1CA5C(void *a1)
{
  *a1 = off_24EF8;
  sub_1CD38((uint64_t)a1);
  (*(void (**)(void *))(a1[4] + 24LL))(a1 + 5);
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }

  return a1;
}

void sub_1CABC(void *a1)
{
  int v1 = sub_1CE30(a1);
  operator delete(v1);
}

uint64_t sub_1CAD0(void *a1, uint64_t a2)
{
  uint64_t v3 = a1 + 1;
  if (a1[2] == a1[1]) {
    return 0LL;
  }
  if (*(_BYTE *)(*(void *)a2 + 32LL))
  {
    (**(void (***)(uint64_t, void *))a2)(a2 + 8, v3);
  }

  else
  {
    uint64_t v6 = a1[4];
    if (*(_BYTE *)(v6 + 32)) {
      (*(void (**)(void *, void *))v6)(a1 + 5, v3);
    }
  }

  uint64_t v7 = a1[1];
  uint64_t result = (*((_DWORD *)a1 + 4) - v7);
  a1[2] = v7;
  return result;
}

uint64_t sub_1CB4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v1 = a1 + 8;
  if (v2 == v3) {
    return 0LL;
  }
  uint64_t v5 = v3 - v2;
  int v6 = *(_DWORD *)(a1 + 72);
  if (v6 == 2)
  {
    uint64_t v8 = *(void *)(a1 + 120);
    if (*(_BYTE *)(v8 + 32)) {
      (*(void (**)(uint64_t, uint64_t))v8)(a1 + 128, v1);
    }
  }

  else if (v6 == 1)
  {
    uint64_t v7 = *(void *)(a1 + 80);
    if (*(_BYTE *)(v7 + 32)) {
      (*(void (**)(uint64_t, uint64_t))v7)(a1 + 88, v1);
    }
  }

  if (*(_BYTE *)(a1 + 160))
  {
    *(_BYTE *)(a1 + 160) = 0;
  }

  else
  {
    *(void *)(a1 + 16) = *(void *)(a1 + 8);
    *(void *)(a1 + 176) = 0LL;
    *(_BYTE *)(a1 + 184) = 0;
  }

  return v5;
}

void *sub_1CBEC(void *a1, size_t __sz)
{
  *a1 = off_24EF8;
  a1[1] = 0LL;
  a1[2] = 0LL;
  a1[3] = 0LL;
  a1[4] = &off_24F18;
  sub_1CC78(a1 + 1, __sz);
  return a1;
}

void sub_1CC48(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_1CC78(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000LL) != 0) {
      sub_2CF0();
    }
    uint64_t v5 = (char *)a1[1];
    int v6 = operator new(__sz);
    uint64_t v7 = &v5[(void)v6 - v2];
    uint64_t v8 = v7;
    if (v5 != (char *)v2)
    {
      int64_t v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }

      while (v5 != (char *)v2);
      uint64_t v8 = v6;
    }

    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2) {
      operator delete((void *)v2);
    }
  }

void sub_1CD24(void *a1)
{
  uint64_t v1 = sub_1CA5C(a1);
  operator delete(v1);
}

uint64_t sub_1CD38(uint64_t a1)
{
  uint64_t v3 = &off_24F18;
  uint64_t v1 = (*(uint64_t (**)(uint64_t, void (***)()))(*(void *)a1 + 16LL))(a1, &v3);
  ((void (*)(uint64_t *))v3[3])(&v4);
  return v1;
}

void sub_1CDBC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_29BC(exception_object);
}

void sub_1CDF0()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_24600;
}

void *sub_1CE30(void *a1)
{
  *a1 = off_24EC8;
  sub_1CB4C((uint64_t)a1);
  (*(void (**)(void *))(a1[15] + 24LL))(a1 + 16);
  (*(void (**)(void *))(a1[10] + 24LL))(a1 + 11);
  return sub_1CA5C(a1);
}

const char *sub_1CE90(int a1)
{
  if (a1 > 111)
  {
    if (a1 > 125)
    {
      if (a1 == 126) {
        return "Invalidate MUID";
      }
      if (a1 == 127) {
        return "NAK";
      }
    }

    else
    {
      if (a1 == 112) {
        return "Discovery";
      }
      if (a1 == 113) {
        return "DiscoveryReply";
      }
    }

    return "Unknown Message Type";
  }

  else
  {
    int v1 = a1 - 16;
    uint64_t result = "Protocol Negotiation Inquiry";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "Protocol Negotiation Inquiry Response";
        break;
      case 2:
        uint64_t result = "Protocol Negotiation Set";
        break;
      case 3:
        uint64_t result = "Protocol Negotiation Test";
        break;
      case 4:
        uint64_t result = "Protocol Negotiation Test Response";
        break;
      case 5:
        uint64_t result = "Protocol Negotiation Confirmation";
        break;
      case 16:
        uint64_t result = "Profile Inquiry";
        break;
      case 17:
        uint64_t result = "Profile Inquiry Reply";
        break;
      case 18:
        uint64_t result = "Set Profile On";
        break;
      case 19:
        uint64_t result = "Set Profile Off";
        break;
      case 20:
        uint64_t result = "Profile Enabled";
        break;
      case 21:
        uint64_t result = "Profile Disabled";
        break;
      case 22:
        uint64_t result = "Profile-Specific Data";
        break;
      case 32:
        uint64_t result = "Property Inquiry";
        break;
      case 33:
        uint64_t result = "Property Inquiry Reply";
        break;
      case 34:
        uint64_t result = "Has Property";
        break;
      case 35:
        uint64_t result = "Has Property Reply";
        break;
      case 36:
        uint64_t result = "Get Property";
        break;
      case 37:
        uint64_t result = "Get Property Reply";
        break;
      case 38:
        uint64_t result = "Set Property";
        break;
      case 39:
        uint64_t result = "Set Property Reply";
        break;
      case 40:
        uint64_t result = "Property Subscription";
        break;
      case 41:
        uint64_t result = "Property Subscription Reply";
        break;
      case 47:
        uint64_t result = "Property Notify";
        break;
      default:
        return "Unknown Message Type";
    }
  }

  return result;
}

double sub_1D03C(uint64_t a1, int a2)
{
  *(void *)a1 = off_24F50;
  *(_DWORD *)(a1 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 12) = 0u;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  return result;
}

void *sub_1D064(void *a1)
{
  *a1 = off_24F50;
  unint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }

  return a1;
}

void sub_1D0B8(uint64_t a1, int a2)
{
  int NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 8));
  *(_DWORD *)(a1 + 12) = NumberOfEntities;
  uint64_t v5 = (void **)(a1 + 16);
  sub_1D358((void **)(a1 + 16), NumberOfEntities);
  int v6 = (void *)(a1 + 40);
  sub_1D3EC((char **)(a1 + 40), *(int *)(a1 + 12));
  if (*(_DWORD *)(a1 + 12))
  {
    for (int i = 0LL; (unint64_t)i < *(int *)(a1 + 12); ++i)
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 8), (ItemCount)i);
      if (MIDIEntityGetNumberOfDestinations(Entity))
      {
        MIDIEndpointRef Destination = MIDIEntityGetDestination(Entity, 0LL);
        if (a2)
        {
          MIDIEndpointSetRefCons(Destination, (void *)a1, i);
LABEL_7:
          if (MIDIEntityGetNumberOfSources(Entity)) {
            MIDIEndpointRef Source = MIDIEntityGetSource(Entity, 0LL);
          }
          else {
            MIDIEndpointRef Source = 0;
          }
          int64_t v12 = *(char **)(a1 + 24);
          unint64_t v11 = *(void *)(a1 + 32);
          if ((unint64_t)v12 >= v11)
          {
            unsigned int v14 = (char *)*v5;
            uint64_t v15 = (v12 - (_BYTE *)*v5) >> 2;
            unint64_t v16 = v15 + 1;
            uint64_t v17 = v11 - (void)v14;
            if (v17 >> 1 > v16) {
              unint64_t v16 = v17 >> 1;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              int v19 = (char *)sub_19494(a1 + 32, v18);
              unsigned int v14 = *(char **)(a1 + 16);
              int64_t v12 = *(char **)(a1 + 24);
            }

            else
            {
              int v19 = 0LL;
            }

            uint64_t v20 = (MIDIEndpointRef *)&v19[4 * v15];
            MIDIEndpointRef *v20 = Source;
            unsigned int v13 = v20 + 1;
            while (v12 != v14)
            {
              MIDIEndpointRef v21 = *((_DWORD *)v12 - 1);
              v12 -= 4;
              *--uint64_t v20 = v21;
            }

            *(void *)(a1 + 16) = v20;
            *(void *)(a1 + 24) = v13;
            *(void *)(a1 + 32) = &v19[4 * v18];
            if (v14) {
              operator delete(v14);
            }
          }

          else
          {
            *(_DWORD *)int64_t v12 = Source;
            unsigned int v13 = v12 + 4;
          }

          *(void *)(a1 + 24) = v13;
          unint64_t v23 = *(void *)(a1 + 48);
          unint64_t v22 = *(void *)(a1 + 56);
          if (v23 >= v22)
          {
            unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *v6) >> 1);
            unint64_t v26 = v25 + 1;
            if (v25 + 1 > 0x2AAAAAAAAAAAAAAALL) {
              sub_2CF0();
            }
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *v6) >> 1);
            if (2 * v27 > v26) {
              unint64_t v26 = 2 * v27;
            }
            if (v27 >= 0x1555555555555555LL) {
              unint64_t v28 = 0x2AAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28) {
              int v29 = (char *)sub_D06C(a1 + 56, v28);
            }
            else {
              int v29 = 0LL;
            }
            unsigned int v30 = &v29[6 * v25];
            *((_WORD *)v30 + 2) = 0;
            *(_DWORD *)unsigned int v30 = 0;
            uint64_t v32 = *(_WORD **)(a1 + 40);
            uint64_t v31 = *(_WORD **)(a1 + 48);
            uint64_t v33 = v30;
            if (v31 != v32)
            {
              do
              {
                int v34 = *(_DWORD *)(v31 - 3);
                v31 -= 3;
                __int16 v35 = v31[2];
                *(_DWORD *)(v33 - 6) = v34;
                v33 -= 6;
                *((_WORD *)v33 + 2) = v35;
              }

              while (v31 != v32);
              uint64_t v31 = (_WORD *)*v6;
            }

            unsigned int v24 = v30 + 6;
            *(void *)(a1 + (*(void (**)(uint64_t))(*(void *)(v1 + 32) + 24LL))(v1 + 40) = v33;
            *(void *)(a1 + 48) = v30 + 6;
            *(void *)(a1 + 56) = &v29[6 * v28];
            if (v31) {
              operator delete(v31);
            }
          }

          else
          {
            *(_WORD *)(v23 + 4) = 0;
            *(_DWORD *)unint64_t v23 = 0;
            unsigned int v24 = (char *)(v23 + 6);
          }

          *(void *)(a1 + 48) = v24;
          continue;
        }

        MIDIEndpointSetRefCons(Destination, 0LL, 0LL);
      }

      else if (a2)
      {
        goto LABEL_7;
      }
    }
  }

void sub_1D358(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_2CF0();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    int v6 = (char *)sub_19494(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int64_t v9 = &v6[4 * v8];
    char v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    int64_t v12 = v7;
    if (v11 != *a1)
    {
      int64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_1D3EC(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 1) < a2)
  {
    if (a2 >= 0x2AAAAAAAAAAAAAABLL) {
      sub_2CF0();
    }
    uint64_t v5 = (a1[1] - *a1) / 6;
    int v6 = (char *)sub_D06C(v3, a2);
    uint64_t v7 = &v6[6 * v5];
    int64_t v9 = &v6[6 * v8];
    unint64_t v11 = *a1;
    char v10 = a1[1];
    int64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        int v13 = *(_DWORD *)(v10 - 6);
        v10 -= 6;
        __int16 v14 = *((_WORD *)v10 + 2);
        *(_DWORD *)(v12 - 6) = v13;
        v12 -= 6;
        *((_WORD *)v12 + 2) = v14;
      }

      while (v10 != v11);
      char v10 = *a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void *NewAppleIDAMDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xECu,  0xDEu,  0x95u,  0x74u,  0xFu,  0xE4u,  0x11u,  0xD4u,  0xBBu,  0x1Au,  0,  0x50u,  0xE4u,  0xCEu,  0xA5u,  0x26u);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  uint64_t v4 = operator new(0x68uLL);
  sub_1D550(v4);
  return v4 + 1;
}

void sub_1D53C(_Unwind_Exception *a1)
{
}

void *sub_1D550(void *a1)
{
  unint64_t v2 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  4u,  0xB0u,  0x79u,  0x38u,  0xC1u,  0xDAu,  0x43u,  4u,  0x82u,  0xBAu,  0x10u,  0xB8u,  0x44u,  0x27u,  0x29u,  0x46u);
  sub_B0CC((uint64_t)a1, v2);
  *a1 = &off_24F80;
  a1[12] = 0LL;
  if ((byte_28188 & 1) == 0) {
    sub_1D600();
  }
  return a1;
}

void sub_1D5EC(_Unwind_Exception *a1)
{
}

void sub_1D600()
{
  if ((byte_28188 & 1) == 0)
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AppleIDAMDriver");
    if (BundleWithIdentifier)
    {
      int v1 = BundleWithIdentifier;
      CFRetain(BundleWithIdentifier);
      off_28080 = (__CFString *)CFBundleCopyLocalizedString(v1, off_28080, off_28080, @"IDAMMIDILocalizable");
      off_28088 = (__CFString *)CFBundleCopyLocalizedString(v1, off_28088, off_28088, @"IDAMMIDILocalizable");
      off_28090 = (__CFString *)CFBundleCopyLocalizedString(v1, off_28090, off_28090, @"IDAMMIDILocalizable");
      CFRelease(v1);
      byte_28188 = 1;
    }
  }

void sub_1D6B4(void *a1)
{
  int v1 = sub_1970C(a1);
  operator delete(v1);
}

uint64_t sub_1D6C8(uint64_t a1, MIDIDeviceListRef devList)
{
  ItemCount NumberOfDevices = MIDIDeviceListGetNumberOfDevices(devList);
  if (NumberOfDevices)
  {
    ItemCount v5 = NumberOfDevices;
    sub_1D900();
    int v6 = (os_log_s *)qword_28190;
    if (os_log_type_enabled((os_log_t)qword_28190, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315650;
      uint64_t v17 = "AppleIDAMDriver.cpp";
      __int16 v18 = 1024;
      int v19 = 79;
      __int16 v20 = 2048;
      ItemCount v21 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Deleting all (%lu) IDAM devices.", (uint8_t *)&v16, 0x1Cu);
    }

    for (ItemCount i = 0LL; i != v5; ++i)
    {
      MIDIDeviceRef Device = MIDIDeviceListGetDevice(devList, i);
      MIDISetupRemoveDevice(Device);
    }
  }

  sub_1D900();
  int64_t v9 = (os_log_s *)qword_28190;
  if (os_log_type_enabled((os_log_t)qword_28190, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    uint64_t v17 = "AppleIDAMDriver.cpp";
    __int16 v18 = 1024;
    int v19 = 86;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%25s:%-5d Done deleting IDAM devices.", (uint8_t *)&v16, 0x12u);
  }

  char v10 = IOServiceMatching("IOUSBDeviceInterface");
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  int64_t v12 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, @"USBDeviceFunction", @"IDAMInterface");
    CFDictionarySetValue(v10, @"IOPropertyMatch", v12);
    CFRelease(v12);
    int v13 = operator new(0x60uLL);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    sub_76DC((uint64_t)v13, a1, (uint64_t)Current, (uint64_t)v10);
    uint64_t result = 0LL;
    *(void *)(a1 + 96) = v13;
  }

  else
  {
    CFRelease(v10);
    return 3758097085LL;
  }

  return result;
}

void sub_1D8E4(_Unwind_Exception *a1)
{
}

void sub_1D900()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_28198);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_28198))
    {
      qword_28190 = (uint64_t)os_log_create("com.apple.coremidi", "idamdv");
      __cxa_guard_release(&qword_28198);
    }
  }

uint64_t sub_1D95C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *(void *)(a1 + 96) = 0LL;
  return 0LL;
}

__CFString *sub_1D994()
{
  return off_28080;
}

__CFString *sub_1D9A0()
{
  return off_28088;
}

__CFString *sub_1D9AC()
{
  return off_28090;
}

uint64_t sub_1D9B8(uint64_t a1)
{
  outMIDIDeviceRef Device = 0;
  MIDIEntityRef newEntity = 0;
  int v1 = off_28088;
  MIDIDeviceCreate((MIDIDriverRef)(a1 + 8), off_28088, off_28080, off_28088, &outDevice);
  CFUUIDRef v3 = &off_248A0;
  uint64_t v4 = 0LL;
  if (v1) {
    CFRetain(v1);
  }
  uint64_t v4 = v1;
  MIDIDeviceAddEntity(outDevice, v1, 1u, 1uLL, 1uLL, &newEntity);
  sub_E444(&v3);
  return outDevice;
}

void sub_1DA50(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1DA64(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 504);
}

void *sub_1DA6C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = operator new(0x278uLL);
  sub_6478((uint64_t)v7, a2, a3, a4);
  return v7;
}

void sub_1DAB8(_Unwind_Exception *a1)
{
}

uint64_t sub_1DACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 4294956462LL;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 88LL))(a3, a2, a4);
  return 0LL;
}

uint64_t sub_1DB00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[4] = a3;
  a1[5] = a4;
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
  }
  return 0LL;
}

void sub_1DB34( int a1, uint64_t a2, MIDITimeStamp a3, char *a4, int64_t a5, uint64_t a6, MIDIProtocolID a7)
{
}

uint64_t sub_1DB50(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_C2CC(a2, a3, a4, *(unsigned __int16 *)(a2 + 540));
}

_BYTE *sub_1DB68(uint64_t a1, uint64_t a2, uint64_t *a3, _BYTE *a4, int a5)
{
  return sub_C5A4(a2, a3, a4, *(unsigned __int16 *)(a2 + 540), a5);
}

uint64_t sub_1DB80()
{
  return 0LL;
}

void *sub_1DB8C(void *result)
{
  *uint64_t result = 0LL;
  result[1] = 0LL;
  *(void *)((char *)result + 21) = 0LL;
  result[2] = 0LL;
  return result;
}

uint64_t sub_1DB9C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {
    operator delete[](v2);
  }
  return a1;
}

void *sub_1DBC8(uint64_t a1, uint64_t a2, size_t __sz)
{
  int v3 = __sz;
  *(void *)a1 = a2;
  uint64_t result = operator new[](__sz);
  *(void *)(a1 + 8) = result;
  *(void *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

void sub_1DBFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DC30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DC64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1DC98(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)",  (uint8_t *)v2,  0x12u);
}

void sub_1DD20()
{
}

void sub_1DD48()
{
}

void sub_1DD78()
{
  __assert_rtn("DoWrite", "USBMIDIDevice.cpp", 720, "currentBufferIndex >= 0");
}

void sub_1DDA0()
{
}

void sub_1DDC8()
{
}

void sub_1DDF0()
{
}

void sub_1DE18()
{
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