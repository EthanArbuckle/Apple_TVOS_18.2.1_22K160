uint64_t __libplatform_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __pfz_setup(a3);
  return __libkernel_platform_init(&_platform_string_functions);
}

uint64_t _simple_getenv(uint64_t *a1, unsigned __int8 *a2)
{
  unint64_t v4 = _platform_strlen((uint64_t)a2);
  for (i = a1; ; ++i)
  {
    BOOL v3 = 0;
    if (i) {
      BOOL v3 = *i != 0;
    }
    if (!v3) {
      break;
    }
    if (_platform_strlen(*i) >= v4
      && !_simple_memcmp((unsigned __int8 *)*i, a2, v4)
      && *(_BYTE *)(*i + v4) == 61)
    {
      return *i + v4 + 1;
    }
  }

  return 0LL;
}

uint64_t _simple_memcmp(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v8 = a3;
  if (a3)
  {
    while (1)
    {
      BOOL v3 = a1++;
      unint64_t v4 = a2++;
      if (*v3 != *v4) {
        break;
      }
      if (!--v8) {
        return 0;
      }
    }

    return (*(a1 - 1) - *(a2 - 1));
  }

  else
  {
    return 0;
  }
}

vm_address_t *_simple_asl_msg_new()
{
  v7 = _simple_salloc();
  if (!v7) {
    return 0LL;
  }
  _simple_sfree(v8);
  return 0LL;
}

uint64_t _simple_asl_msg_set( uint64_t result, int8x16_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v23 = (uint64_t *)result;
  if (result)
  {
    if (a2)
    {
      result = _simple_sprintf(result, " [", a3, a4, a5, a6, a7, a8, v18);
      if (!(_DWORD)result)
      {
        result = _simple_esprintf( (uint64_t)v23,  (uint64_t (*)(void))_simple_asl_escape_key,  "%s",  v8,  v9,  v10,  v11,  v12,  (uint64_t)a2);
        if (!(_DWORD)result)
        {
          if (a3)
          {
            result = _simple_esprintf( (uint64_t)v23,  (uint64_t (*)(void))_simple_asl_escape_val,  " %s",  v13,  v14,  v15,  v16,  v17,  a3);
            if ((_DWORD)result) {
              return result;
            }
            if (!_platform_strcmp(a2, (int8x16_t *)"Message"))
            {
              uint64_t v19 = _simple_string((_BYTE **)v23);
              for (i = (int8x16_t *)(v19 + _platform_strlen(v19)); ; i->i8[0] = 0)
              {
                i = (int8x16_t *)((char *)i - 2);
              }

              _simple_sresize(v23);
            }
          }

          return _simple_sappend((uint64_t)v23, "]");
        }
      }
    }
  }

  return result;
}

const char *_simple_asl_escape_key(char a1)
{
  switch(a1)
  {
    case 10:
      return "\\n";
    case 32:
      return "\\s";
    case 91:
      return "\\[";
    case 92:
      return "\\\\"";
    case 93:
      return "\\]";
  }

  return 0LL;
}

const char *_simple_asl_escape_val(char a1)
{
  switch(a1)
  {
    case 10:
      return "\\n";
    case 91:
      return "\\[";
    case 92:
      return "\\\\"";
    case 93:
      return "\\]";
  }

  return 0LL;
}

uint64_t _simple_asl_send(_BYTE **a1)
{
  uint64_t v3 = _simple_string(a1);
  unint64_t v1 = _platform_strlen(v3);
  return log_data_as_kernel(0LL, 0LL, v3, v1 + 1);
}

vm_address_t *_simple_asl_log_prog(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result = _simple_asl_msg_new();
  uint64_t v18 = result;
  if (result)
  {
    if (a4) {
      _simple_asl_msg_set((uint64_t)result, (int8x16_t *)"Sender", a4, v5, v6, v7, v8, v9);
    }
    _simple_asl_msg_set((uint64_t)v18, (int8x16_t *)"Facility", a2, v5, v6, v7, v8, v9);
    _simple_asl_msg_set((uint64_t)v18, (int8x16_t *)"Message", a3, v10, v11, v12, v13, v14);
    if (a1 <= 6) {
      unsigned __int8 v17 = 2;
    }
    else {
      unsigned __int8 v17 = 0;
    }
    uint64_t v16 = _simple_string((_BYTE **)v18);
    unint64_t v15 = _platform_strlen(v16);
    log_data_as_kernel(0LL, v17, v16, v15 + 1);
    return _simple_sfree(v18);
  }

  return result;
}

vm_address_t *_simple_asl_log(int a1, uint64_t a2, uint64_t a3)
{
  return _simple_asl_log_prog(a1, a2, a3, 0LL);
}

uint64_t _simple_vdprintf(int a1, unsigned __int8 *a2, uint64_t a3)
{
  int v8 = a1;
  uint64_t v7 = a2;
  uint64_t v6 = a3;
  memset(__b, 0, sizeof(__b));
  __b[0] = v4;
  LODWORD(__b[3]) = v8;
  __b[1] = v4;
  __b[2] = __b;
  __b[4] = _flush_reset;
  __simple_bprintf((uint64_t)__b, 0LL, v7, v6);
  return _flush((uint64_t)__b);
}

uint64_t _flush_reset(void *a1)
{
  uint64_t result = _flush((uint64_t)a1);
  a1[1] = *a1;
  return result;
}

uint64_t __simple_bprintf(uint64_t result, uint64_t (*a2)(void), unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v15 = result;
  while (*a3)
  {
    int v8 = _platform_strchr((uint64_t)a3, 0x25u);
    if (!v8) {
      return put_s(v15, a2, a3);
    }
    put_n(v15, a2, a3, v8 - a3);
    uint64_t v13 = (int8x16_t *)(v8 + 1);
    if (v8[1] == 37)
    {
      uint64_t result = put_c(v15, a2, 0x25u);
      a3 = v8 + 2;
    }

    else
    {
      uint64_t result = _platform_strncmp(v13, (int8x16_t *)".*s", 3uLL);
      if ((_DWORD)result)
      {
        unint64_t v7 = (v13->i8[0] - 48);
        if (v7 <= 0x49) {
          __asm { BR              X8 }
        }

        uint64_t result = put_c(v15, a2, v13->i8[0]);
      }

      else
      {
        int v10 = *(_DWORD *)a4;
        uint64_t v4 = *(unsigned __int8 **)(a4 + 8);
        a4 += 16LL;
        for (i = v4; ; ++i)
        {
          int v5 = v10--;
          if (v5 <= 0) {
            break;
          }
          uint64_t v6 = i;
          uint64_t result = put_c(v15, a2, *v6);
        }

        uint64_t v13 = (int8x16_t *)((char *)v13 + 2);
      }

      a3 = &v13->u8[1];
    }
  }

  return result;
}

uint64_t _flush(uint64_t result)
{
  uint64_t v3 = result;
  __buf = *(char **)result;
  uint64_t __nbyte = *(void *)(result + 8) - *(void *)result;
  while (__nbyte > 0)
  {
    uint64_t result = write(*(_DWORD *)(v3 + 24), __buf, __nbyte);
    if (result >= 0)
    {
      __nbyte -= result;
      __buf += __nbyte;
    }

    else
    {
      uint64_t result = (uint64_t)__error();
      if (*(_DWORD *)result != 4)
      {
        uint64_t result = (uint64_t)__error();
        if (*(_DWORD *)result != 35) {
          return result;
        }
      }
    }
  }

  return result;
}

uint64_t _simple_dprintf( int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _simple_vdprintf(a1, a2, (uint64_t)&a9);
}

void *_simple_salloc()
{
  uint64_t v2 = 0LL;
  if (vm_allocate(mach_task_self_, (vm_address_t *)&v2, vm_page_size, 1)) {
    return 0LL;
  }
  uint64_t v0 = v2 + 5;
  *uint64_t v2 = v2 + 5;
  v2[1] = v0;
  v2[2] = (char *)v2 + vm_page_size - 1;
  v2[4] = _enlarge;
  return v2;
}

uint64_t *_enlarge(uint64_t a1)
{
  kern_return_t v2;
  vm_address_t v3;
  vm_size_t size;
  unint64_t v5;
  vm_address_t address;
  uint64_t v7;
  unint64_t v7 = a1;
  address = 0LL;
  address = *(void *)(a1 + 16) + 1LL;
  uint64_t result = (uint64_t *)vm_allocate(mach_task_self_, &address, vm_page_size, 0);
  if ((_DWORD)result)
  {
    int v5 = *(void *)(v7 + 16) - *(void *)v7 + 1LL;
    size = (v5 + vm_page_size) & -(uint64_t)vm_page_size;
    uint64_t v2 = vm_allocate(mach_task_self_, &address, size, 1);
    if (v2)
    {
      qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Failed to allocate memory for buffer";
      qword_10038 = v2;
      __break(1u);
      JUMPOUT(0x2928LL);
    }

    uint64_t v3 = address - *(void *)v7;
    uint64_t result = _platform_memmove((uint64_t *)address, *(uint64_t **)v7, v5);
    if ((*(void *)v7 & (vm_page_size - 1)) != 0)
    {
      v5 &= -(uint64_t)vm_page_size;
      *(void *)unint64_t v7 = (*(void *)v7 + vm_page_size) & -(uint64_t)vm_page_size;
      *(void *)(v7 + 16) = address + size - 1;
    }

    else
    {
      *(void *)(v7 + 16) += v3 + vm_page_size;
    }

    if (v5) {
      uint64_t result = (uint64_t *)vm_deallocate(mach_task_self_, *(void *)v7, v5);
    }
    *(void *)unint64_t v7 = address;
    *(void *)(v7 + 8) += v3;
  }

  else
  {
    *(void *)(v7 + 16) += vm_page_size;
  }

  return result;
}

uint64_t _simple_vsprintf(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  return _simple_vesprintf(a1, 0LL, a2, a3);
}

uint64_t _simple_vesprintf(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3, uint64_t a4)
{
  return 0LL;
}

uint64_t _simple_sprintf( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _simple_vesprintf(a1, 0LL, a2, (uint64_t)&a9);
}

uint64_t _simple_esprintf( uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _simple_vesprintf(a1, a2, a3, (uint64_t)&a9);
}

uint64_t _simple_string(_BYTE **a1)
{
  *a1[1] = 0;
  return (uint64_t)*a1;
}

unint64_t _simple_sresize(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t result = _platform_strlen(*a1);
  a1[1] = v2 + result;
  return result;
}

uint64_t _simple_sappend(uint64_t a1, unsigned __int8 *a2)
{
  return _simple_esappend(a1, 0LL, a2);
}

uint64_t _simple_esappend(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3)
{
  return 0LL;
}

uint64_t put_s(uint64_t result, uint64_t (*a2)(void), unsigned __int8 *a3)
{
  uint64_t v6 = result;
  while (*a3)
  {
    uint64_t v3 = a3++;
    unint64_t result = put_c(v6, a2, *v3);
  }

  return result;
}

uint64_t _simple_put(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 24) = a2;
  return _flush(a1);
}

uint64_t _simple_putline(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 24) = a2;
  uint64_t v2 = *(_BYTE **)(a1 + 8);
  *(void *)(a1 + 8) = v2 + 1;
  *uint64_t v2 = 10;
  uint64_t result = _flush(a1);
  --*(void *)(a1 + 8);
  return result;
}

vm_address_t *_simple_sfree(vm_address_t *result)
{
  vm_address_t address = (vm_address_t)result;
  if (result)
  {
    if ((*result & (vm_page_size - 1)) != 0)
    {
      return (vm_address_t *)vm_deallocate(mach_task_self_, (vm_address_t)result, result[2] - (void)result + 1);
    }

    else
    {
      vm_deallocate(mach_task_self_, *result, result[2] - *result + 1);
      return (vm_address_t *)vm_deallocate(mach_task_self_, address, vm_page_size);
    }
  }

  return result;
}

uint64_t put_n(uint64_t result, uint64_t (*a2)(void), unsigned __int8 *a3, uint64_t a4)
{
  for (i = result; ; uint64_t result = put_c(i, a2, *v5))
  {
    uint64_t v4 = a4--;
    if (v4 <= 0) {
      break;
    }
    int v5 = a3++;
  }

  return result;
}

uint64_t put_c(uint64_t result, uint64_t (*a2)(void), unsigned __int8 a3)
{
  uint64_t v5 = result;
  if (a2)
  {
    uint64_t result = a2(a3);
    if (result) {
      return put_s(v5, 0LL, result);
    }
  }

  if (*(void *)(v5 + 8) >= *(void *)(v5 + 16)) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v5 + 32))(v5);
  }
  uint64_t v3 = *(unsigned __int8 **)(v5 + 8);
  *(void *)(v5 + 8) = v3 + 1;
  *uint64_t v3 = a3;
  return result;
}

uint64_t dec(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, int a4, int a5)
{
  uint64_t v18 = a1;
  unsigned __int8 v17 = a2;
  uint64_t v16 = a3;
  int v15 = a4;
  int i = a5;
  uint64_t v13 = (unsigned __int8 *)&i;
  uint64_t v12 = 0LL;
  int v11 = 0;
  uint64_t v10 = a3;
  unint64_t v9 = 0LL;
  if (a3 < 0)
  {
    ++v11;
    --v15;
    uint64_t v10 = -v10;
  }

  *--uint64_t v13 = 0;
  if (v10)
  {
    while (v10)
    {
      uint64_t v10 = udiv10(v10, &v9);
      *--uint64_t v13 = v9 + 48;
    }
  }

  else
  {
    *--uint64_t v13 = 48;
  }

  if (v11 && i)
  {
    put_c(v18, v17, 0x2Du);
    int v11 = 0;
  }

  uint64_t v8 = v15;
  uint64_t v12 = v8 - _platform_strlen((uint64_t)v13);
  if (i) {
    int v5 = 48;
  }
  else {
    int v5 = 32;
  }
  for (int i = v5; ; put_c(v18, v17, i))
  {
    uint64_t v6 = v12--;
    if (v6 <= 0) {
      break;
    }
  }

  if (v11) {
    put_c(v18, v17, 0x2Du);
  }
  return put_s(v18, v17, v13);
}

uint64_t oct(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5)
{
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  unint64_t v15 = a3;
  int v14 = a4;
  int i = a5;
  uint64_t v10 = (unsigned __int8 *)&v12;
  char v12 = 0;
  if (a3)
  {
    while (v15)
    {
      *--uint64_t v10 = v15 % 8 + 48;
      v15 /= 8uLL;
    }
  }

  else
  {
    uint64_t v10 = (unsigned __int8 *)&v11;
    char v11 = 48;
  }

  uint64_t v8 = v14;
  uint64_t v9 = v8 - _platform_strlen((uint64_t)v10);
  if (i) {
    int v5 = 48;
  }
  else {
    int v5 = 32;
  }
  for (int i = v5; ; put_c(v17, v16, i))
  {
    uint64_t v6 = v9--;
    if (v6 <= 0) {
      break;
    }
  }

  return put_s(v17, v16, v10);
}

uint64_t hex( uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5, int a6, int a7)
{
  uint64_t v21 = a1;
  v20 = a2;
  unint64_t v19 = a3;
  int v18 = a4;
  int i = a5;
  int v16 = a6;
  int v15 = a7;
  unint64_t v7 = "0123456789ABCDEF";
  if (!a6) {
    unint64_t v7 = "0123456789abcdef";
  }
  char v12 = (unsigned __int8 *)&v14;
  char v14 = 0;
  if (v19)
  {
    while (v19)
    {
      *--char v12 = v7[v19 & 0xF];
      v19 >>= 4;
    }
  }

  else
  {
    char v12 = (unsigned __int8 *)&v13;
    char v13 = 48;
  }

  if (v15)
  {
    v18 -= 2;
    if (i)
    {
      put_s(v21, v20, "0x");
      int v15 = 0;
    }
  }

  int v8 = _platform_strlen((uint64_t)v12);
  v18 -= v8;
  if (i) {
    int v9 = 48;
  }
  else {
    int v9 = 32;
  }
  for (int i = v9; ; put_c(v21, v20, i))
  {
    int v10 = v18--;
    if (v10 <= 0) {
      break;
    }
  }

  if (v15) {
    put_s(v21, v20, "0x");
  }
  return put_s(v21, v20, v12);
}

uint64_t udec(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5)
{
  uint64_t v17 = a1;
  int v16 = a2;
  unint64_t v15 = a3;
  int v14 = a4;
  int i = a5;
  unint64_t v10 = 0LL;
  char v11 = (unsigned __int8 *)&v12;
  char v12 = 0;
  if (a3)
  {
    while (v15)
    {
      unint64_t v15 = udiv10(v15, &v10);
      *--char v11 = v10 + 48;
    }
  }

  else
  {
    *--char v11 = 48;
  }

  uint64_t v8 = v14;
  uint64_t v9 = v8 - _platform_strlen((uint64_t)v11);
  if (i) {
    int v5 = 48;
  }
  else {
    int v5 = 32;
  }
  for (int i = v5; ; put_c(v17, v16, i))
  {
    uint64_t v6 = v9--;
    if (v6 <= 0) {
      break;
    }
  }

  return put_s(v17, v16, v11);
}

uint64_t ydec(uint64_t a1, uint64_t (*a2)(void), unint64_t a3, int a4, int a5)
{
  if (a3 < 0xA00000)
  {
    if (a3 < 0x2800)
    {
      udec(a1, a2, a3, a4, a5);
      return put_s(a1, a2, "b");
    }

    else
    {
      udec(a1, a2, (a3 + 512) >> 10, a4, a5);
      return put_s(a1, a2, "KB");
    }
  }

  else
  {
    udec(a1, a2, (a3 + 0x80000) >> 20, a4, a5);
    return put_s(a1, a2, "MB");
  }

unint64_t udiv10(unint64_t a1, unint64_t *a2)
{
  *a2 = a1 % 0xA;
  return a1 / 0xA;
}

_BYTE *__pfz_setup(uint64_t *a1)
{
  uint64_t result = (_BYTE *)_simple_getenv(a1, "pfz");
  if (result)
  {
    if (*result == 48 && result[1] == 120 && (char v2 = result[2]) != 0)
    {
      uint64_t v3 = 0LL;
      uint64_t v4 = result + 3;
      do
      {
        int v5 = v2;
        if ((v2 - 48) >= 0xAu)
        {
          int v6 = -87;
          if ((v5 - 97) >= 6u)
          {
            int v6 = -55;
          }
        }

        else
        {
          int v6 = -48;
        }

        uint64_t v3 = (v6 + v5) + 16 * v3;
        int v7 = *v4++;
        char v2 = v7;
      }

      while (v7);
    }

    else
    {
LABEL_13:
      uint64_t v3 = 0LL;
    }

    uint64_t v8 = result - 4;
    unint64_t v9 = _platform_strlen((uint64_t)result);
    uint64_t result = _platform_bzero(v8, v9 + 4);
    if (v3) {
      commpage_pfz_base = (_UNKNOWN *)v3;
    }
  }

  return result;
}

void OSAtomicFifoEnqueue(OSFifoQueueHead *__list, void *__new, size_t a3)
{
  if (!commpage_pfz_base) {
    OSAtomicFifoEnqueue_cold_1();
  }
  commpage_pfz_base(__list, __new, a3);
}

void *__cdecl OSAtomicFifoDequeue(OSFifoQueueHead *__list, size_t a2)
{
  if (!commpage_pfz_base) {
    OSAtomicFifoEnqueue_cold_1();
  }
  return (void *)((uint64_t (*)(OSFifoQueueHead *, size_t))((char *)commpage_pfz_base + 4))(__list, a2);
}

uint64_t sys_cache_control(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 2)
  {
    sys_dcache_flush();
    return 0LL;
  }

  if (a1 == 1)
  {
    sys_icache_invalidate(a2, a3);
    return 0LL;
  }

  return 45LL;
}

uint64_t sys_icache_invalidate(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = result & 0xFFFFFFFFFFFFFFC0LL;
    unint64_t v3 = ~((a2 + (unint64_t)(result & 0x3F) - 1) >> 6);
    __dsb(0xBu);
    uint64_t v4 = 20LL;
    uint64_t v5 = 0LL;
    do
    {
      __asm { IC              IVAU, X9 }

      v2 += 64LL;
      if (!--v4)
      {
        if (v5)
        {
LABEL_5:
          __dsb(0xBu);
          uint64_t v4 = 20LL;
        }

        else
        {
          unint64_t v10 = &cpus_that_need_dsb_for_ic_ivau;
          while (1)
          {
            unsigned int v11 = *v10++;
            uint64_t v5 = v11;
            if (!v11) {
              break;
            }
            if ((_DWORD)v5 == MEMORY[0xFFFFFC080]) {
              goto LABEL_5;
            }
          }

          uint64_t v4 = 0LL;
          uint64_t v5 = 1LL;
        }
      }

      ++v3;
    }

    while (v3);
    __dsb(0xBu);
    __isb(0xFu);
  }

  return result;
}

void sys_dcache_flush()
{
}

uint64_t os_lock_lock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8LL))(a1);
}

uint64_t os_lock_trylock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
}

uint64_t os_lock_unlock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
}

unsigned int *_OSSpinLockLockSlow(unsigned int *result)
{
  for (int i = 100; ; --i)
  {
    while (1)
    {
      signed int v2 = __ldaxr(result);
      if (v2) {
        break;
      }
      if (!__stxr(0xFFFFFFFF, result)) {
        return result;
      }
    }

    if (v2 != -1)
    {
      __clrex();
      _os_lock_corruption_abort((uint64_t)result, v2);
    }

    if (!i) {
      break;
    }
    __wfe();
  }

  __clrex();
  return (unsigned int *)_OSSpinLockLockYield(result);
}

unint64_t _OSSpinLockLockYield(unsigned int *a1)
{
  mach_timebase_info info = 0LL;
  unint64_t result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    unint64_t v3 = -1LL;
  }

  else
  {
    unint64_t v4 = 1000000 * (unint64_t)info.denom / info.numer;
    unint64_t result = mach_absolute_time();
    unint64_t v3 = result + v4;
  }

  mach_msg_timeout_t v5 = 1;
  int v6 = 1;
  while (1)
  {
    signed int v7 = *a1;
    if (!*a1) {
      break;
    }
LABEL_10:
    if (v7 != -1) {
      _os_lock_corruption_abort(result, v7);
    }
    unint64_t result = thread_switch(0, v6, v5);
    if (v6 == 2)
    {
      ++v5;
    }

    else
    {
      unint64_t result = mach_absolute_time();
      if (result < v3) {
        int v6 = 1;
      }
      else {
        int v6 = 2;
      }
    }
  }

  do
  {
    signed int v7 = __ldaxr(a1);
    if (v7)
    {
      __clrex();
      goto LABEL_10;
    }
  }

  while (__stxr(0xFFFFFFFF, a1));
  return result;
}

void spin_lock(OSSpinLock *__lock)
{
  while (!__ldaxr((unsigned int *)__lock))
  {
  }

  __clrex();
  _OSSpinLockLockSlow((unsigned int *)__lock);
}

BOOL OSSpinLockTry(OSSpinLock *__lock)
{
  while (!__ldaxr((unsigned int *)__lock))
  {
  }

  BOOL result = 0;
  __clrex();
  return result;
}

uint64_t spin_lock_try(unsigned int *a1)
{
  while (!__ldaxr(a1))
  {
    if (!__stxr(0xFFFFFFFF, a1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

void spin_unlock(OSSpinLock *__lock)
{
}

unsigned int *_os_lock_spin_lock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  while (!__ldaxr(result))
  {
    if (!__stxr(0xFFFFFFFF, result)) {
      return result;
    }
  }

  __clrex();
  return _OSSpinLockLockSlow(result);
}

uint64_t _os_lock_spin_trylock(uint64_t a1)
{
  unint64_t v1 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v1))
  {
    if (!__stxr(0xFFFFFFFF, v1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

uint64_t _os_lock_spin_unlock(uint64_t result)
{
  return result;
}

uint64_t _os_lock_handoff_lock(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  signed int v2 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v2))
  {
    if (!__stxr(v1, v2)) {
      return a1;
    }
  }

  __clrex();
  return _os_lock_handoff_lock_slow(a1);
}

uint64_t _os_lock_handoff_trylock(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  signed int v2 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v2))
  {
    if (!__stxr(v1, v2)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

uint64_t _os_lock_handoff_unlock(uint64_t result)
{
  return result;
}

uint64_t _os_lock_handoff_lock_slow(uint64_t a1)
{
  char v1 = 0;
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unint64_t v3 = (unsigned int *)(a1 + 8);
  int v4 = 4;
  mach_msg_timeout_t v5 = 1;
  int v6 = 100;
LABEL_2:
  int v7 = v6;
  while (1)
  {
    LODWORD(result) = *v3;
    if (!*v3) {
      break;
    }
LABEL_8:
    if ((_DWORD)result == v2) {
      _os_lock_recursive_abort(v2);
    }
    int v6 = v7 - 1;
    if (!v7)
    {
      thread_switch(result, 5, v5);
LABEL_11:
      ++v5;
      int v4 = 5;
      char v1 = 1;
      goto LABEL_2;
    }

    thread_switch(result, v4, v5);
    int v7 = v6;
    if ((v1 & 1) != 0) {
      goto LABEL_11;
    }
  }

  do
  {
    uint64_t result = __ldaxr(v3);
    if ((_DWORD)result)
    {
      __clrex();
      goto LABEL_8;
    }
  }

  while (__stxr(v2, v3));
  return result;
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(&lock->_os_unfair_lock_opaque))
  {
    if (!__stxr(v1, &lock->_os_unfair_lock_opaque)) {
      return;
    }
  }

  __clrex();
  _os_unfair_lock_lock_slow(&lock->_os_unfair_lock_opaque, 0, 0LL, v1);
}

uint64_t _os_unfair_lock_lock_slow(unsigned int *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0xFCFAFFFF) != 0)
  {
    qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Invalid options";
    qword_10038 = a2 & 0xFEFFFFFF;
    __break(1u);
LABEL_34:
    _os_unfair_lock_recursive_abort(v4);
  }

  unsigned int v4 = a4;
  int v8 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
LABEL_3:
        unsigned int v9 = *a1;
        if (!*a1)
        {
          while (1)
          {
            unsigned int v9 = __ldaxr(a1);
            if (v9) {
              break;
            }
            if (!__stxr(v4 & ~v8, a1)) {
              return 1LL;
            }
          }

          __clrex();
        }

        int v10 = v9 | 1;
        BOOL v12 = (a2 & 0x1000000) == 0 || v10 != -1;
        if (v10 == v4 && v12) {
          goto LABEL_34;
        }
        if (v9 == (v9 & 0xFFFFFFFE)) {
          goto LABEL_23;
        }
        do
        {
          unsigned int v14 = __ldxr(a1);
          if (v14 != v9)
          {
            __clrex();
            goto LABEL_3;
          }
        }

        while (__stxr(v9 & 0xFFFFFFFE, a1));
        v9 &= ~1u;
LABEL_23:
        uint64_t result = __ulock_wait2(a2 | 0x1000002u, a1, v9, a3, 0LL);
        if ((result & 0x80000000) != 0) {
          break;
        }
        if ((_DWORD)result) {
          int v8 = 1;
        }
      }

      uint64_t v15 = -(int)result;
      if ((_DWORD)v15 != 4) {
        goto LABEL_38;
      }
    }
  }

  while ((_DWORD)v15 == 14);
  uint64_t result = 0LL;
  if ((_DWORD)v15 != 60)
  {
    if ((_DWORD)v15 == 105) {
      _os_unfair_lock_corruption_abort(v9);
    }
LABEL_38:
    qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait2 failure";
    qword_10038 = v15;
    __break(1u);
  }

  return result;
}

unsigned int *os_unfair_lock_lock_with_options(unsigned int *result, int a2)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, v2);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(&lock->_os_unfair_lock_opaque))
  {
    if (!__stxr(v1, &lock->_os_unfair_lock_opaque)) {
      return 1;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

uint64_t os_unfair_lock_trylock_with_options(unsigned int *a1, int a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v3, a1)) {
      return 1LL;
    }
  }

  __clrex();
  return _os_unfair_lock_trylock_with_options_slow(a1, a2, a3, v3);
}

uint64_t _os_unfair_lock_trylock_with_options_slow(unsigned int *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0x2000000) != 0)
  {
    if (mach_absolute_time() <= a3) {
      return _os_unfair_lock_lock_slow(a1, a2, a3, a4);
    }
  }

  else if (a3)
  {
    mach_timebase_info info = 0LL;
    mach_timebase_info(&info);
    unint64_t v8 = info.denom * a3 / info.numer;
    uint64_t v9 = mach_absolute_time();
    return _os_unfair_lock_lock_slow(a1, a2 | 0x2000000u, v9 + v8, a4);
  }

  return 0LL;
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v2 = __ldxr(&lock->_os_unfair_lock_opaque);
  while (__stlxr(0, &lock->_os_unfair_lock_opaque));
  if (v2 != v1) {
    _os_unfair_lock_unlock_slow((uint64_t)lock, v1, v2);
  }
}

uint64_t _os_unfair_lock_unlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result = a3 | 1;
  if ((_DWORD)result != a2) {
    _os_unfair_lock_unowned_abort(result);
  }
  if ((a3 & 1) != 0)
  {
    uint64_t v5 = a3;
    qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_10038 = a3;
    __break(1u);
LABEL_9:
    qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_10038 = v5;
    __break(1u);
  }

  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake(16777218LL, a1, 0LL);
      if ((result & 0x80000000) == 0) {
        break;
      }
      if ((_DWORD)result != -4)
      {
        uint64_t v5 = -(int)result;
        if ((_DWORD)v5 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }

  return result;
}

unsigned int *os_unfair_lock_lock_no_tsd(unsigned int *result, int a2, unsigned int a3)
{
  while (!__ldaxr(result))
  {
    if (!__stxr(a3, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, a3);
}

unsigned int *os_unfair_lock_unlock_no_tsd(unsigned int *result, int a2)
{
  do
    unsigned int v2 = __ldxr(result);
  while (__stlxr(0, result));
  if (v2 != a2) {
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, a2, v2);
  }
  return result;
}

unsigned int *os_unfair_lock_lock_with_flags(unsigned int *result, int a2)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, v2);
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) != v1) {
    os_unfair_lock_assert_owner_cold_1(os_unfair_lock_opaque);
  }
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) == v1) {
    os_unfair_lock_assert_not_owner_cold_1(os_unfair_lock_opaque);
  }
}

BOOL os_unfair_recursive_lock_owned(_DWORD *a1)
{
  int v1 = *a1 | 1;
  return v1 == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
}

unsigned int *os_unfair_recursive_lock_lock_with_options(unsigned int *result, int a2)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v3 = __ldaxr(result);
    if (v3) {
      break;
    }
    if (!__stxr(v2, result))
    {
      char v4 = 1;
      goto LABEL_6;
    }
  }

  char v4 = 0;
  __clrex();
LABEL_6:
  if ((v4 & 1) == 0)
  {
    if ((v3 | 1) == v2) {
      ++result[1];
    }
    else {
      return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, v2);
    }
  }

  return result;
}

uint64_t os_unfair_recursive_lock_trylock(unsigned int *a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v2 = __ldaxr(a1);
    if (v2) {
      break;
    }
    if (!__stxr(v1, a1))
    {
      char v3 = 1;
      goto LABEL_6;
    }
  }

  char v3 = 0;
  __clrex();
LABEL_6:
  if ((v3 & 1) != 0) {
    return 1LL;
  }
  if ((v2 | 1) == v1)
  {
    ++a1[1];
    return 1LL;
  }

  return 0LL;
}

unsigned int *os_unfair_recursive_lock_unlock(unsigned int *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = result[1];
  if (v2)
  {
    if ((*result | 1) != v1) {
      _os_unfair_lock_unowned_abort(*result | 1);
    }
    result[1] = v2 - 1;
  }

  else
  {
    do
      unsigned int v3 = __ldxr(result);
    while (__stlxr(0, result));
    if (v3 != v1) {
      return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v3);
    }
  }

  return result;
}

BOOL os_unfair_recursive_lock_tryunlock4objc(unsigned int *a1)
{
  int v1 = *a1 | 1;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  if (v1 == v2)
  {
    unsigned int v3 = a1[1];
    if (v3)
    {
      if ((*a1 | 1) != v1) {
        _os_unfair_lock_unowned_abort(*a1 | 1);
      }
      a1[1] = v3 - 1;
    }

    else
    {
      do
        unsigned int v4 = __ldxr(a1);
      while (__stlxr(0, a1));
      if (v4 != v1) {
        _os_unfair_lock_unlock_slow((uint64_t)a1, v1, v4);
      }
    }
  }

  return v1 == v2;
}

_DWORD *os_unfair_recursive_lock_unlock_forked_child(_DWORD *result)
{
  if (!*result) {
    os_unfair_recursive_lock_unlock_forked_child_cold_1();
  }
  int v1 = result[1];
  if (v1)
  {
    int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    result[1] = v1 - 1;
  }

  else
  {
    int v2 = 0;
  }

  unsigned int *result = v2;
  return result;
}

unsigned int *_os_lock_unfair_lock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, 0, 0LL, v2);
}

uint64_t _os_lock_unfair_trylock(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stxr(v2, v1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

unsigned int *_os_lock_unfair_unlock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v3 = __ldxr(result);
  while (__stlxr(0, result));
  if (v3 != v2) {
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v2, v3);
  }
  return result;
}

uint64_t _os_nospin_lock_lock(uint64_t result)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr((unsigned int *)result))
  {
  }

  __clrex();
  return _os_nospin_lock_lock_slow(result);
}

uint64_t _os_nospin_lock_lock_slow(uint64_t result)
{
  unsigned int v1 = (unsigned int *)result;
  int v2 = 0;
  int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  for (int i = 1; ; ++i)
  {
    do
    {
      while (1)
      {
        while (1)
        {
          uint64_t v5 = *v1;
          if (!(_DWORD)v5)
          {
            while (1)
            {
              uint64_t v5 = __ldaxr(v1);
              if ((_DWORD)v5) {
                break;
              }
              if (!__stxr(v3 & ~v2, v1)) {
                return result;
              }
            }

            __clrex();
          }

          uint64_t v6 = v5 & 0xFFFFFFFE;
          if (v5 == v6 || v6 == 0) {
            break;
          }
          while (1)
          {
            uint64_t v8 = __ldxr(v1);
            if (v8 != v5) {
              break;
            }
            if (!__stxr(v6, v1))
            {
              uint64_t v5 = v5 & 0xFFFFFFFE;
              goto LABEL_14;
            }
          }

          __clrex();
        }

LABEL_14:
        uint64_t result = __ulock_wait(16777217LL, v1, v5, (1000 * i));
        if ((result & 0x80000000) != 0) {
          break;
        }
        if ((_DWORD)result) {
          int v2 = 1;
        }
      }

      int v9 = -(int)result;
    }

    while ((_DWORD)result == -4 || v9 == 14);
    if (v9 != 60) {
      break;
    }
  }

  qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
  qword_10038 = -(int)result;
  __break(1u);
  return result;
}

uint64_t _os_nospin_lock_trylock(unsigned int *a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v1, a1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

unsigned int *_os_nospin_lock_unlock(unsigned int *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v2 = __ldxr(result);
  while (__stlxr(0, result));
  if (v2 != v1) {
    return (unsigned int *)_os_nospin_lock_unlock_slow((uint64_t)result, v2);
  }
  return result;
}

uint64_t _os_nospin_lock_unlock_slow(uint64_t result, unsigned int a2)
{
  if ((a2 | 1) == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    if ((a2 & 1) != 0)
    {
      uint64_t v3 = a2;
      qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
      qword_10038 = a2;
      __break(1u);
LABEL_9:
      qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
      qword_10038 = v3;
      __break(1u);
    }

    else
    {
      uint64_t v2 = result;
      while (1)
      {
        uint64_t result = __ulock_wake(16777217LL, v2, 0LL);
        if ((result & 0x80000000) == 0) {
          break;
        }
        if ((_DWORD)result != -4)
        {
          uint64_t v3 = -(int)result;
          if ((_DWORD)v3 != 2) {
            goto LABEL_9;
          }
          return result;
        }
      }
    }
  }

  return result;
}

unsigned int *_os_lock_nospin_lock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_nospin_lock_lock_slow((uint64_t)result);
}

uint64_t _os_lock_nospin_trylock(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stxr(v2, v1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

unsigned int *_os_lock_nospin_unlock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v3 = __ldxr(result);
  while (__stlxr(0, result));
  if (v3 != v2) {
    return (unsigned int *)_os_nospin_lock_unlock_slow((uint64_t)result, v3);
  }
  return result;
}

unint64_t *__os_once_reset(unint64_t *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v2 = __ldxr(result);
  while (__stlxr(0LL, result));
  if (v1 != v2) {
    return (unint64_t *)_os_once_gate_broadcast((uint64_t)result, v2, v1);
  }
  return result;
}

uint64_t _os_once_gate_broadcast(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = a2 | 1;
  if ((_DWORD)result != a3) {
    _os_once_gate_unowned_abort(result);
  }
  if ((a2 & 1) != 0)
  {
    uint64_t v5 = a2;
    qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_10038 = a2;
    __break(1u);
LABEL_9:
    qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_10038 = v5;
    __break(1u);
  }

  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake(16777474LL, a1, 0LL);
      if ((result & 0x80000000) == 0) {
        break;
      }
      if ((_DWORD)result != -4)
      {
        uint64_t v5 = -(int)result;
        if ((_DWORD)v5 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }

  return result;
}

unint64_t *_os_once(unint64_t *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t v3 = atomic_load(result);
  if ((v3 & 3) == 1)
  {
    if (4LL * MEMORY[0xFFFFFC180] - v3 - 15 <= 0xFFFFFFFFFFFFFFEFLL) {
      unsigned int *result = -1LL;
    }
  }

  else
  {
    uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr(result))
    {
    }

    __clrex();
    return (unint64_t *)_os_once_gate_wait((uint64_t)result, a2, a3, v4);
  }

  return result;
}

uint64_t _os_once_callout(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), int a4)
{
  uint64_t result = a3(a2);
  unint64_t v7 = (4LL * MEMORY[0xFFFFFC180]) | 1;
  do
    unsigned int v8 = __ldxr(a1);
  while (__stlxr(v7, a1));
  if (v8 != a4) {
    return _os_once_gate_broadcast((uint64_t)a1, v8, a4);
  }
  return result;
}

uint64_t _os_once_gate_wait(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t), unsigned int a4)
{
  unint64_t v4 = __ldxr((unint64_t *)result);
  if (v4 == -1LL)
  {
LABEL_19:
    __clrex();
    return result;
  }

  unsigned int v8 = (unint64_t *)result;
  unint64_t v9 = a4;
  while ((v4 & 3) != 1)
  {
    if (v4)
    {
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) == v4)
      {
        __clrex();
      }

      else if (__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v8))
      {
        goto LABEL_12;
      }

      uint64_t result = __ulock_wait(16777218LL, v8, v4 & 0xFFFFFFFE, 0LL);
      if ((result & 0x80000000) != 0 && (_DWORD)result != -4 && -(int)result != 14)
      {
        qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
        qword_10038 = -(int)result;
        __break(1u);
        return result;
      }
    }

    else if (!__stxr(v9, v8))
    {
      __dmb(9u);
      return _os_once_callout(v8, a2, a3, a4);
    }

LABEL_12:
    unint64_t v4 = __ldxr(v8);
    if (v4 == -1LL) {
      goto LABEL_19;
    }
  }

  __clrex();
  __dmb(9u);
  if (4LL * MEMORY[0xFFFFFC180] - v4 - 15 <= 0xFFFFFFFFFFFFFFEFLL) {
    *unsigned int v8 = -1LL;
  }
  return result;
}

uint64_t os_sync_wait_on_address_with_deadline( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 > 1 || a3 != 8 && a3 != 4)
  {
    int v6 = 22;
    goto LABEL_19;
  }

  int v6 = 22;
  if (!a6 || a5 != 32) {
    goto LABEL_19;
  }
  if (a4) {
    int v7 = 6;
  }
  else {
    int v7 = 5;
  }
  if (a4) {
    int v8 = 3;
  }
  else {
    int v8 = 1;
  }
  if (a3 != 4) {
    int v8 = 0;
  }
  if (a3 != 8) {
    int v7 = v8;
  }
  uint64_t result = __ulock_wait2(v7 | 0x3000000u, a1, a2, a6, 0LL);
  if ((result & 0x80000000) != 0)
  {
    int v6 = -(int)result;
LABEL_19:
    *__error() = v6;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t os_sync_wait_on_address_with_timeout( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 > 1 || a3 != 8 && a3 != 4)
  {
    int v6 = 22;
    goto LABEL_19;
  }

  int v6 = 22;
  if (!a6 || a5 != 32) {
    goto LABEL_19;
  }
  if (a4) {
    int v7 = 6;
  }
  else {
    int v7 = 5;
  }
  if (a4) {
    int v8 = 3;
  }
  else {
    int v8 = 1;
  }
  if (a3 != 4) {
    int v8 = 0;
  }
  if (a3 != 8) {
    int v7 = v8;
  }
  uint64_t result = __ulock_wait2(v7 | 0x1000000u, a1, a2, a6, 0LL);
  if ((result & 0x80000000) != 0)
  {
    int v6 = -(int)result;
LABEL_19:
    *__error() = v6;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t os_sync_wait_on_address(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 > 1 || a3 != 8 && a3 != 4)
  {
    int v7 = 22;
    goto LABEL_17;
  }

  if (a4) {
    int v4 = 6;
  }
  else {
    int v4 = 5;
  }
  if (a4) {
    int v5 = 3;
  }
  else {
    int v5 = 1;
  }
  if (a3 != 4) {
    int v5 = 0;
  }
  if (a3 != 8) {
    int v4 = v5;
  }
  uint64_t result = __ulock_wait2(v4 | 0x1000000u, a1, a2, 0LL, 0LL);
  if ((result & 0x80000000) != 0)
  {
    int v7 = -(int)result;
LABEL_17:
    *__error() = v7;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t os_sync_wake_by_address_any(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 1 || a2 != 8 && a2 != 4)
  {
    int v6 = 22;
    goto LABEL_17;
  }

  if (a3) {
    int v3 = 6;
  }
  else {
    int v3 = 5;
  }
  if (a3) {
    int v4 = 3;
  }
  else {
    int v4 = 1;
  }
  if (a2 != 4) {
    int v4 = 0;
  }
  if (a2 != 8) {
    int v3 = v4;
  }
  uint64_t result = __ulock_wake(v3 | 0x1000000u, a1, 0LL);
  if ((result & 0x80000000) != 0)
  {
    int v6 = -(int)result;
LABEL_17:
    *__error() = v6;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t os_sync_wake_by_address_all(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 > 1 || a2 != 8 && a2 != 4)
  {
    int v6 = 22;
    goto LABEL_17;
  }

  if (a3) {
    int v3 = 6;
  }
  else {
    int v3 = 5;
  }
  if (a3) {
    int v4 = 3;
  }
  else {
    int v4 = 1;
  }
  if (a2 != 4) {
    int v4 = 0;
  }
  if (a2 != 8) {
    int v3 = v4;
  }
  uint64_t result = __ulock_wake(v3 | 0x1000100u, a1, 0LL);
  if ((result & 0x80000000) != 0)
  {
    int v6 = -(int)result;
LABEL_17:
    *__error() = v6;
    return 0xFFFFFFFFLL;
  }

  return result;
}

unint64_t _os_alloc_once(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  _os_once(a1, (uint64_t)v5, _os_alloc);
  return a1[1];
}

uint64_t _os_alloc(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0;
  if (v1 - 1 >= 2 * vm_page_size - 16) {
    _os_alloc_cold_1((*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0);
  }
  int v3 = (unint64_t *)_os_alloc_heap;
  if (!_os_alloc_heap) {
    goto LABEL_5;
  }
  do
    unint64_t v4 = __ldxr(v3);
  while (__stxr(v4 + v1, v3));
  if (v4 + v1 <= 2 * vm_page_size - 16) {
    uint64_t result = (uint64_t)v3 + v4 + 16;
  }
  else {
LABEL_5:
  }
    uint64_t result = _os_alloc_slow(v3, v1);
  *(void *)(*(void *)a1 + 8LL) = result;
  int v6 = *(uint64_t (**)(void))(a1 + 16);
  if (v6) {
    return v6();
  }
  return result;
}

uint64_t _os_alloc_slow(unint64_t *a1, uint64_t a2)
{
  mach_vm_address_t v4 = vm_page_size;
  while (1)
  {
    mach_vm_address_t address = v4;
    uint64_t result = mach_vm_map(mach_task_self_, &address, 2 * v4, 0LL, 1224736769, 0, 0LL, 0, 3, 7, 1u);
    if ((_DWORD)result) {
      break;
    }
    mach_vm_address_t v6 = address;
    while (1)
    {
      unint64_t v7 = __ldxr((unint64_t *)&_os_alloc_heap);
      if (!__stxr(v6, (unint64_t *)&_os_alloc_heap))
      {
        *(void *)(v6 + 8) = a1;
        a1 = (unint64_t *)v6;
        goto LABEL_8;
      }
    }

    __clrex();
    mach_vm_deallocate(mach_task_self_, v6, 2 * vm_page_size);
    a1 = (unint64_t *)_os_alloc_heap;
    if (!_os_alloc_heap)
    {
      mach_vm_address_t v4 = vm_page_size;
      continue;
    }

    do
LABEL_8:
      unint64_t v8 = __ldxr(a1);
    while (__stxr(v8 + a2, a1));
    mach_vm_address_t v4 = vm_page_size;
    if (v8 + a2 <= 2 * vm_page_size - 16) {
      return (uint64_t)a1 + v8 + 16;
    }
  }

  qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: Failed to allocate in os_alloc_once";
  qword_10038 = (int)result;
  __break(1u);
  return result;
}

uint64_t _os_semaphore_create()
{
  kern_return_t v0;
  semaphore_t semaphore;
  semaphore = 0;
  uint64_t v0 = semaphore_create(mach_task_self_, &semaphore, 0, 0);
  if (v0)
  {
    if (v0 == -301) {
      _os_semaphore_create_cold_2();
    }
    _os_semaphore_create_cold_1(v0);
  }

  return semaphore;
}

uint64_t _os_semaphore_dispose(semaphore_t semaphore)
{
  uint64_t result = semaphore_destroy(mach_task_self_, semaphore);
  if ((_DWORD)result) {
    _os_semaphore_dispose_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_signal(semaphore_t a1)
{
  uint64_t result = semaphore_signal(a1);
  if ((_DWORD)result) {
    _os_semaphore_signal_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_wait(semaphore_t semaphore)
{
  while (1)
  {
    uint64_t result = semaphore_wait(semaphore);
    if (!(_DWORD)result) {
      break;
    }
    if ((_DWORD)result != 14) {
      _os_semaphore_wait_cold_1(result);
    }
  }

  return result;
}

int32_t OSAtomicAdd32(int32_t __theAmount, int32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr((unsigned int *)__theValue);
    unsigned int v3 = v2 + __theAmount;
  }

  while (__stxr(v3, (unsigned int *)__theValue));
  return v3;
}

int32_t OSAtomicAdd32Barrier(int32_t __theAmount, int32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr((unsigned int *)__theValue);
    unsigned int v3 = v2 + __theAmount;
  }

  while (__stlxr(v3, (unsigned int *)__theValue));
  return v3;
}

int32_t OSAtomicIncrement32(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldxr((unsigned int *)__theValue);
    unsigned int v2 = v1 + 1;
  }

  while (__stxr(v2, (unsigned int *)__theValue));
  return v2;
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldaxr((unsigned int *)__theValue);
    unsigned int v2 = v1 + 1;
  }

  while (__stlxr(v2, (unsigned int *)__theValue));
  return v2;
}

int32_t OSAtomicDecrement32(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldxr((unsigned int *)__theValue);
    unsigned int v2 = v1 - 1;
  }

  while (__stxr(v2, (unsigned int *)__theValue));
  return v2;
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldaxr((unsigned int *)__theValue);
    unsigned int v2 = v1 - 1;
  }

  while (__stlxr(v2, (unsigned int *)__theValue));
  return v2;
}

int64_t OSAtomicAdd64(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v2 = __ldxr((unint64_t *)__theValue);
    unint64_t v3 = v2 + __theAmount;
  }

  while (__stxr(v3, (unint64_t *)__theValue));
  return v3;
}

int64_t OSAtomicAdd64Barrier(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v2 = __ldaxr((unint64_t *)__theValue);
    unint64_t v3 = v2 + __theAmount;
  }

  while (__stlxr(v3, (unint64_t *)__theValue));
  return v3;
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldxr((unint64_t *)__theValue);
    unint64_t v2 = v1 + 1;
  }

  while (__stxr(v2, (unint64_t *)__theValue));
  return v2;
}

int64_t OSAtomicIncrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldaxr((unint64_t *)__theValue);
    unint64_t v2 = v1 + 1;
  }

  while (__stlxr(v2, (unint64_t *)__theValue));
  return v2;
}

int64_t OSAtomicDecrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldxr((unint64_t *)__theValue);
    unint64_t v2 = v1 - 1;
  }

  while (__stxr(v2, (unint64_t *)__theValue));
  return v2;
}

int64_t OSAtomicDecrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldaxr((unint64_t *)__theValue);
    unint64_t v2 = v1 - 1;
  }

  while (__stlxr(v2, (unint64_t *)__theValue));
  return v2;
}

int32_t OSAtomicAnd32(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr(__theValue);
    uint32_t v3 = v2 & __theMask;
  }

  while (__stxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicAnd32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr(__theValue);
    uint32_t v3 = v2 & __theMask;
  }

  while (__stlxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicAnd32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldxr(__theValue);
  while (__stxr(v2 & __theMask, __theValue));
  return v2;
}

int32_t OSAtomicAnd32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldaxr(__theValue);
  while (__stlxr(v2 & __theMask, __theValue));
  return v2;
}

int32_t OSAtomicOr32(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr(__theValue);
    uint32_t v3 = v2 | __theMask;
  }

  while (__stxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicOr32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr(__theValue);
    uint32_t v3 = v2 | __theMask;
  }

  while (__stlxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicOr32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldxr(__theValue);
  while (__stxr(v2 | __theMask, __theValue));
  return v2;
}

int32_t OSAtomicOr32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldaxr(__theValue);
  while (__stlxr(v2 | __theMask, __theValue));
  return v2;
}

int32_t OSAtomicXor32(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr(__theValue);
    uint32_t v3 = v2 ^ __theMask;
  }

  while (__stxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicXor32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr(__theValue);
    uint32_t v3 = v2 ^ __theMask;
  }

  while (__stlxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicXor32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldxr(__theValue);
  while (__stxr(v2 ^ __theMask, __theValue));
  return v2;
}

int32_t OSAtomicXor32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldaxr(__theValue);
  while (__stlxr(v2 ^ __theMask, __theValue));
  return v2;
}

BOOL OSAtomicCompareAndSwap32(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldaxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapPtr(void *__oldValue, void *__newValue, void **__theValue)
{
  while (1)
  {
    unsigned int v3 = (void *)__ldxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapPtrBarrier(void *__oldValue, void *__newValue, void **__theValue)
{
  while (1)
  {
    unsigned int v3 = (void *)__ldaxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapInt(int __oldValue, int __newValue, int *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapIntBarrier(int __oldValue, int __newValue, int *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldaxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapLongBarrier(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldaxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwap64(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwap64Barrier( int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldaxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicTestAndSet(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  int v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldxr(v5);
  while (__stxr(v6 | v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndSetBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  int v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6 | v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndClear(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  int v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldxr(v5);
  while (__stxr(v6 & ~v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndClearBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  int v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6 & ~v4, v5));
  return (v6 & v4) != 0;
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  opaque1 = __list->opaque1;
  do
  {
    do
    {
      *(void *)((char *)__new + a3) = opaque1;
      unint64_t v4 = __ldxr((unint64_t *)__list);
      BOOL v5 = opaque1 == (void *)v4;
      opaque1 = (void *)v4;
    }

    while (!v5);
    opaque1 = (void *)v4;
  }

  while (__stlxr((unint64_t)__new, (unint64_t *)__list));
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  while (1)
  {
    BOOL result = (void *)__ldaxr((unint64_t *)__list);
    if (!result) {
      break;
    }
  }

  __clrex();
  return result;
}

void OSMemoryBarrier(void)
{
}

uint64_t _sigunaltstack(char a1)
{
  if ((a1 & 1) != 0) {
    uint64_t v1 = 0x40000000LL;
  }
  else {
    uint64_t v1 = 0x80000000LL;
  }
  return __sigreturn(0LL, v1, 0LL);
}

void _sigtramp( void (*a1)(void, uint64_t, uint64_t), uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __in_sigtramp = a3;
  a1(a3, a4, a5);
  __in_sigtramp = 0;
  __sigreturn(a5, 30LL, a6);
  __break(1u);
}

  ;
}

uint64_t __platform_sigaction(int a1, uint64_t *a2, uint64_t a3)
{
  int v10 = a1;
  unint64_t v9 = a2;
  uint64_t v8 = a3;
  uint64_t v5 = 0LL;
  unsigned int v6 = 0LL;
  uint64_t v7 = 0LL;
  if (a1 <= 0 || v10 >= 32 || v10 == 9 || v10 == 17)
  {
    *__error() = 22;
    return -1;
  }

  else
  {
    unint64_t v4 = 0LL;
    if (v9)
    {
      uint64_t v5 = *v9;
      unsigned int v6 = _sigtramp;
      LODWORD(v7) = *((_DWORD *)v9 + 2);
      HIDWORD(v7) = *((_DWORD *)v9 + 3) | 0x400;
      unint64_t v4 = &v5;
    }

    return __sigaction(v10, v4, v8);
  }

int _setjmp(jmp_buf a1)
{
  uint64_t v21 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  *((void *)a1 + 2) = v3;
  *((void *)a1 + 3) = v4;
  *((void *)a1 + 4) = v5;
  *((void *)a1 + 5) = v6;
  *((void *)a1 + 6) = v7;
  *((void *)a1 + 7) = v8;
  *((void *)a1 + 8) = v9;
  *((void *)a1 + 9) = v10;
  *((void *)a1 + 10) = v11 ^ v21;
  *((void *)a1 + 11) = v12 ^ v21;
  *((void *)a1 + 12) = (unint64_t)&v23 ^ v21;
  *((void *)a1 + 14) = v13;
  *((void *)a1 + 15) = v14;
  *((void *)a1 + 16) = v15;
  *((void *)a1 + 17) = v16;
  *((void *)a1 + 18) = v17;
  *((void *)a1 + 19) = v18;
  *((void *)a1 + 20) = v19;
  *((void *)a1 + 21) = v20;
  return 0;
}

void _longjmp(jmp_buf a1, int a2)
{
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  a1[46] = a2;
  if (a2) {
    return setjmp(a1);
  }
  else {
    return _setjmp(a1);
  }
}

int setjmp(jmp_buf a1)
{
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  sigprocmask(1, 0LL, (sigset_t *)a1 + 44);
  __sigaltstack(0LL, v5);
  a1[47] = *(_DWORD *)&v5[16];
  return _setjmp(a1);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
  if (!a1[46]) {
    _longjmp(a1, a2);
  }
  longjmp(a1, a2);
}

void longjmp(jmp_buf a1, int a2)
{
  *(void *)uint64_t v4 = *((void *)a1 + 22);
  sigprocmask(3, v4, 0LL);
  _sigunaltstack(*(void *)(a1 + 47));
  _longjmp(a1, a2);
}

int8x16_t *_platform_strstr(int8x16_t *a1, _BYTE *a2)
{
  uint64_t v7 = (int8x16_t *)(a2 + 1);
  char v6 = *a2;
  if (*a2)
  {
    unint64_t v5 = _platform_strlen((uint64_t)v7);
    do
    {
      uint64_t v2 = a1;
      a1 = (int8x16_t *)((char *)a1 + 1);
      int v3 = v2->i8[0];
      if (!v3) {
        return 0LL;
      }
    }

    while ((char)v3 != v6 || _platform_strncmp(a1, v7, v5));
    return (int8x16_t *)((char *)a1 - 1);
  }

  return a1;
}

uint64_t *_platform_strcpy(uint64_t *a1, uint64_t *a2)
{
  unint64_t v3 = _platform_strlen((uint64_t)a2);
  _platform_memmove(a1, a2, v3 + 1);
  return a1;
}

unint64_t _platform_strlcpy(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v4 = _platform_strlen((uint64_t)a2);
  if (v4 >= a3)
  {
    if (a3)
    {
      _platform_memmove(a1, a2, a3 - 1);
      *((_BYTE *)a1 + a3 - 1) = 0;
    }
  }

  else
  {
    _platform_memmove(a1, a2, v4 + 1);
  }

  return v4;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _platform_memset((uint64_t *)__b, __c, __len);
}

char *_platform_memccpy(uint64_t *a1, uint64_t *a2, unsigned int a3, unint64_t a4)
{
  if (!a4) {
    return 0LL;
  }
  unint64_t v5 = _platform_memchr((uint64_t)a2, a3, a4);
  if (v5)
  {
    _platform_memmove(a1, a2, v5 - (void)a2 + 1);
    return (char *)a1 + v5 - (void)a2 + 1;
  }

  else
  {
    _platform_memmove(a1, a2, a4);
    return 0LL;
  }

uint64_t *_platform_strncpy(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v4 = _platform_strnlen((uint64_t)a2, a3);
  if (v4 >= a3)
  {
    _platform_memmove(a1, a2, a3);
  }

  else
  {
    _platform_memmove(a1, a2, v4);
    _platform_memset((uint64_t *)((char *)a1 + v4), 0, a3 - v4);
  }

  return a1;
}

unint64_t _platform_strlcat(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v5 = _platform_strlen((uint64_t)a2);
  unint64_t v4 = _platform_strnlen(a1, a3);
  if (v4 == a3) {
    return a3 + v5;
  }
  if (v5 >= a3 - v4)
  {
    _platform_memmove((uint64_t *)(a1 + v4), a2, a3 - v4 - 1);
    *(_BYTE *)(a1 + a3 - 1) = 0;
  }

  else
  {
    _platform_memmove((uint64_t *)(a1 + v4), a2, v5 + 1);
  }

  return v4 + v5;
}

uint64_t *_platform_memmove(uint64_t *result, uint64_t *a2, unint64_t a3)
{
  if ((char *)result - (char *)a2 < a3)
  {
    if (result != a2)
    {
      v46 = (char *)result + a3;
      v47 = (char *)a2 + a3;
      if (a3 < 0x40)
      {
        while (1)
        {
          BOOL v43 = a3 >= 8;
          a3 -= 8LL;
          if (!v43) {
            break;
          }
          uint64_t v70 = *((void *)v47 - 1);
          v47 -= 8;
          *((void *)v46 - 1) = v70;
          v46 -= 8;
        }

        for (unint64_t i = a3 + 8; i; --i)
        {
          char v72 = *--v47;
          *--v46 = v72;
        }
      }

      else
      {
        if (a3 < 0x4000)
        {
          uint64_t v65 = *((void *)v47 - 2);
          uint64_t v66 = *((void *)v47 - 1);
          uint64_t v67 = *((void *)v47 - 4);
          uint64_t v68 = *((void *)v47 - 3);
          unint64_t v52 = (unint64_t)(v46 - 1) & 0xFFFFFFFFFFFFFFE0LL;
          uint64_t v69 = v47 - &v46[-v52];
          uint64_t v54 = *(void *)(v69 - 16);
          uint64_t v55 = *(void *)(v69 - 8);
          uint64_t v56 = *(void *)(v69 - 32);
          uint64_t v57 = *(void *)(v69 - 24);
          *((void *)v46 - 2) = v65;
          *((void *)v46 - 1) = v66;
          *((void *)v46 - 4) = v67;
          *((void *)v46 - 3) = v68;
          uint64_t v58 = v69 - 32;
          unint64_t v59 = v52 - (void)result - 64;
          if (v52 - (unint64_t)result > 0x40)
          {
            do
            {
              *(void *)(v52 - 16) = v54;
              *(void *)(v52 - 8) = v55;
              *(void *)(v52 - 32) = v56;
              *(void *)(v52 - 24) = v57;
              v52 -= 32LL;
              uint64_t v54 = *(void *)(v58 - 16);
              uint64_t v55 = *(void *)(v58 - 8);
              uint64_t v56 = *(void *)(v58 - 32);
              uint64_t v57 = *(void *)(v58 - 24);
              v58 -= 32LL;
              BOOL v16 = v59 > 0x20;
              v59 -= 32LL;
            }

            while (v16);
          }
        }

        else
        {
          uint64_t v48 = *((void *)v47 - 2);
          uint64_t v49 = *((void *)v47 - 1);
          uint64_t v50 = *((void *)v47 - 4);
          uint64_t v51 = *((void *)v47 - 3);
          unint64_t v52 = (unint64_t)(v46 - 1) & 0xFFFFFFFFFFFFFFE0LL;
          uint64_t v53 = v47 - &v46[-v52];
          uint64_t v54 = *(void *)(v53 - 16);
          uint64_t v55 = *(void *)(v53 - 8);
          uint64_t v56 = *(void *)(v53 - 32);
          uint64_t v57 = *(void *)(v53 - 24);
          *((void *)v46 - 2) = v48;
          *((void *)v46 - 1) = v49;
          *((void *)v46 - 4) = v50;
          *((void *)v46 - 3) = v51;
          uint64_t v58 = v53 - 32;
          unint64_t v59 = v52 - (void)result - 64;
          if (v52 - (unint64_t)result > 0x40)
          {
            do
            {
              *(void *)(v52 - 16) = v54;
              *(void *)(v52 - 8) = v55;
              *(void *)(v52 - 32) = v56;
              *(void *)(v52 - 24) = v57;
              v52 -= 32LL;
              uint64_t v54 = *(void *)(v58 - 16);
              uint64_t v55 = *(void *)(v58 - 8);
              uint64_t v56 = *(void *)(v58 - 32);
              uint64_t v57 = *(void *)(v58 - 24);
              v58 -= 32LL;
              BOOL v16 = v59 > 0x20;
              v59 -= 32LL;
            }

            while (v16);
          }
        }

        uint64_t v60 = v58 - v59;
        uint64_t v61 = *(void *)(v60 - 16);
        uint64_t v62 = *(void *)(v60 - 8);
        uint64_t v63 = *(void *)(v60 - 32);
        uint64_t v64 = *(void *)(v60 - 24);
        *(void *)(v52 - 16) = v54;
        *(void *)(v52 - 8) = v55;
        *(void *)(v52 - 32) = v56;
        *(void *)(v52 - 24) = v57;
        result[2] = v61;
        result[3] = v62;
        void *result = v63;
        result[1] = v64;
      }
    }
  }

  else
  {
    unint64_t v3 = result;
    if (a3 < 0x40)
    {
      while (1)
      {
        BOOL v43 = a3 >= 8;
        a3 -= 8LL;
        if (!v43) {
          break;
        }
        uint64_t v42 = *a2++;
        *v3++ = v42;
      }

      for (unint64_t j = a3 + 8; j; --j)
      {
        char v45 = *(_BYTE *)a2;
        a2 = (uint64_t *)((char *)a2 + 1);
        *(_BYTE *)unint64_t v3 = v45;
        unint64_t v3 = (uint64_t *)((char *)v3 + 1);
      }
    }

    else
    {
      if ((char *)a2 - (char *)result < a3)
      {
        if (a3 < 0x4000)
        {
          unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
          uint64_t v30 = *a2;
          uint64_t v31 = a2[1];
          uint64_t v32 = a2[2];
          uint64_t v33 = a2[3];
          v34 = (uint64_t *)((char *)a2 + v4 - (char *)result);
          uint64_t v10 = *v34;
          uint64_t v11 = v34[1];
          uint64_t v12 = v34[2];
          uint64_t v13 = v34[3];
          uint64_t v14 = v34 + 4;
          unint64_t v35 = a3 - (v4 - (char *)result);
          void *result = v30;
          result[1] = v31;
          result[2] = v32;
          result[3] = v33;
          BOOL v16 = v35 > 0x40;
          for (unint64_t k = v35 - 64; v16; k -= 32LL)
          {
            *(void *)unint64_t v4 = v10;
            *((void *)v4 + 1) = v11;
            *((void *)v4 + 2) = v12;
            *((void *)v4 + 3) = v13;
            v4 += 32;
            uint64_t v10 = *v14;
            uint64_t v11 = v14[1];
            uint64_t v12 = v14[2];
            uint64_t v13 = v14[3];
            v14 += 4;
            BOOL v16 = k > 0x20;
          }
        }

        else
        {
          unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
          uint64_t v24 = *a2;
          uint64_t v25 = a2[1];
          uint64_t v26 = a2[2];
          uint64_t v27 = a2[3];
          v28 = (uint64_t *)((char *)a2 + v4 - (char *)result);
          uint64_t v10 = *v28;
          uint64_t v11 = v28[1];
          uint64_t v12 = v28[2];
          uint64_t v13 = v28[3];
          uint64_t v14 = v28 + 4;
          unint64_t v29 = a3 - (v4 - (char *)result);
          void *result = v24;
          result[1] = v25;
          result[2] = v26;
          result[3] = v27;
          BOOL v16 = v29 > 0x40;
          for (unint64_t k = v29 - 64; v16; k -= 32LL)
          {
            *(void *)unint64_t v4 = v10;
            *((void *)v4 + 1) = v11;
            *((void *)v4 + 2) = v12;
            *((void *)v4 + 3) = v13;
            v4 += 32;
            uint64_t v10 = *v14;
            uint64_t v11 = v14[1];
            uint64_t v12 = v14[2];
            uint64_t v13 = v14[3];
            v14 += 4;
            BOOL v16 = k > 0x20;
          }
        }
      }

      else if (a3 < 0x4000)
      {
        unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
        uint64_t v18 = *a2;
        uint64_t v19 = a2[1];
        uint64_t v20 = a2[2];
        uint64_t v21 = a2[3];
        v22 = (uint64_t *)((char *)a2 + v4 - (char *)result);
        uint64_t v10 = *v22;
        uint64_t v11 = v22[1];
        uint64_t v12 = v22[2];
        uint64_t v13 = v22[3];
        uint64_t v14 = v22 + 4;
        unint64_t v23 = a3 - (v4 - (char *)result);
        void *result = v18;
        result[1] = v19;
        result[2] = v20;
        result[3] = v21;
        BOOL v16 = v23 > 0x40;
        for (unint64_t k = v23 - 64; v16; k -= 32LL)
        {
          *(void *)unint64_t v4 = v10;
          *((void *)v4 + 1) = v11;
          *((void *)v4 + 2) = v12;
          *((void *)v4 + 3) = v13;
          v4 += 32;
          uint64_t v10 = *v14;
          uint64_t v11 = v14[1];
          uint64_t v12 = v14[2];
          uint64_t v13 = v14[3];
          v14 += 4;
          BOOL v16 = k > 0x20;
        }
      }

      else
      {
        unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
        uint64_t v5 = *a2;
        uint64_t v6 = a2[1];
        uint64_t v7 = a2[2];
        uint64_t v8 = a2[3];
        uint64_t v9 = (uint64_t *)((char *)a2 + v4 - (char *)result);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        uint64_t v12 = v9[2];
        uint64_t v13 = v9[3];
        uint64_t v14 = v9 + 4;
        unint64_t v15 = a3 - (v4 - (char *)result);
        void *result = v5;
        result[1] = v6;
        result[2] = v7;
        result[3] = v8;
        BOOL v16 = v15 > 0x40;
        for (unint64_t k = v15 - 64; v16; k -= 32LL)
        {
          *(void *)unint64_t v4 = v10;
          *((void *)v4 + 1) = v11;
          *((void *)v4 + 2) = v12;
          *((void *)v4 + 3) = v13;
          v4 += 32;
          uint64_t v10 = *v14;
          uint64_t v11 = v14[1];
          uint64_t v12 = v14[2];
          uint64_t v13 = v14[3];
          v14 += 4;
          BOOL v16 = k > 0x20;
        }
      }

      v36 = (uint64_t *)((char *)v14 + k);
      uint64_t v37 = *v36;
      uint64_t v38 = v36[1];
      uint64_t v39 = v36[2];
      uint64_t v40 = v36[3];
      *(void *)unint64_t v4 = v10;
      *((void *)v4 + 1) = v11;
      *((void *)v4 + 2) = v12;
      *((void *)v4 + 3) = v13;
      v41 = &v4[k];
      *((void *)v41 + 4) = v37;
      *((void *)v41 + 5) = v38;
      *((void *)v41 + 6) = v39;
      *((void *)v41 + 7) = v40;
    }
  }

  return result;
}

unint64_t _platform_strcmp(int8x16_t *a1, int8x16_t *a2)
{
  while ((a1 & 0xF) != 0)
  {
    unsigned int v3 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v2 = v3;
    unsigned int v4 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v5 = v2 - v4;
    if (v2 != v4 || (_DWORD)v2 == 0) {
      return v5;
    }
  }

  if ((a2 & 0xF) != 0)
  {
    uint64_t v8 = -(uint64_t)a2 & 0xFF0;
    if (!v8) {
      goto LABEL_12;
    }
LABEL_10:
    while (1)
    {
      int8x16_t v9 = *a1++;
      int8x16_t v10 = v9;
      int8x16_t v11 = *a2++;
      int8x16_t v13 = vceqq_s8(v10, v11);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v10, v13);
      v13.i8[0] = vminvq_u8(v12);
      if (!v13.i32[0]) {
        break;
      }
      v8 -= 16LL;
      if (!v8)
      {
LABEL_12:
        while (1)
        {
          unsigned int v15 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v14 = v15;
          unsigned int v16 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v5 = v14 - v16;
          if (v14 != v16 || (_DWORD)v14 == 0) {
            return v5;
          }
          if ((a1 & 0xF) == 0)
          {
            uint64_t v8 = 4080LL;
            goto LABEL_10;
          }
        }
      }
    }
  }

  else
  {
    do
    {
      int8x16_t v18 = *a1++;
      int8x16_t v19 = v18;
      int8x16_t v20 = *a2++;
      int8x16_t v13 = vceqq_s8(v19, v20);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v19, v13);
      v13.i8[0] = vminvq_u8(v12);
    }

    while (v13.i32[0]);
  }

  uint8x16_t v21 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v12, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_6CE0);
  v21.i8[0] = vminvq_u8(v21);
  return a1[-1].u8[v21.u32[0]] - (unint64_t)a2[-1].u8[v21.u32[0]];
}

int ffs(int a1)
{
  return 32 - __clz(a1 & -a1);
}

int ffsll(uint64_t a1)
{
  return 64 - __clz(a1 & -a1);
}

int fls(int a1)
{
  return 32 - __clz(a1);
}

int flsll(uint64_t a1)
{
  return 64 - __clz(a1);
}

unint64_t _platform_memchr(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  if (a3 < 0)
  {
    int8x16_t v13 = vdupq_n_s8(a2);
    uint64_t v14 = a1 & 0xF;
    unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFF0LL;
    int8x16_t v16 = *(int8x16_t *)&algn_6E30[-v14];
    for (uint8x16_t i = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v15, v13), v16); ; uint8x16_t i = (uint8x16_t)vsubq_s8(v18, v13))
    {
      v16.i8[0] = vminvq_u8(i);
      if (!v16.i32[0]) {
        break;
      }
      int8x16_t v18 = *(int8x16_t *)(v15 + 16);
      v15 += 16LL;
    }

    uint8x16_t v19 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_6E20);
    v19.i8[0] = vminvq_u8(v19);
    return v15 + v19.u32[0];
  }

  else
  {
    int8x16_t v3 = vdupq_n_s8(a2);
    uint64_t v4 = a1 & 0xF;
    unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF0LL;
    int8x16_t v6 = *(int8x16_t *)&algn_6E30[-v4];
    uint8x16_t v7 = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v5, v3), v6);
    unint64_t v8 = a3 + v4;
    while (1)
    {
      v6.i8[0] = vminvq_u8(v7);
      if (!v6.i32[0]) {
        break;
      }
      BOOL v10 = v8 > 0x10;
      v8 -= 16LL;
      if (!v10) {
        return 0LL;
      }
      int8x16_t v9 = *(int8x16_t *)(v5 + 16);
      v5 += 16LL;
      uint8x16_t v7 = (uint8x16_t)vsubq_s8(v9, v3);
    }

    uint8x16_t v12 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)veorq_s8(v3, v3)), (int8x16_t)xmmword_6E20);
    v12.i8[0] = vminvq_u8(v12);
    unint64_t result = v5 + v12.u32[0];
    if (v12.u32[0] >= v8) {
      return 0LL;
    }
  }

  return result;
}

unint64_t _platform_memcmp(unint64_t *a1, unint64_t *a2, unint64_t a3)
{
  BOOL v3 = a3 >= 0x10;
  unint64_t v4 = a3 - 16;
  if (!v3)
  {
    BOOL v3 = __CFADD__(v4, 8LL);
    unint64_t v17 = v4 + 8;
    if (v3)
    {
      unint64_t v19 = *a1++;
      unint64_t v18 = v19;
      unint64_t v21 = *a2++;
      unint64_t v20 = v21;
      unint64_t v22 = v18 - v21;
      if (v18 != v21) {
        goto LABEL_18;
      }
      v17 -= 8LL;
    }

    BOOL v3 = __CFADD__(v17, 4LL);
    unint64_t v23 = v17 + 4;
    if (!v3)
    {
      v23 += 4LL;
      unint64_t v22 = 0LL;
      goto LABEL_20;
    }

    unsigned int v24 = *(_DWORD *)a1;
    a1 = (unint64_t *)((char *)a1 + 4);
    unint64_t v18 = v24;
    unsigned int v25 = *(_DWORD *)a2;
    a2 = (unint64_t *)((char *)a2 + 4);
    unint64_t v20 = v25;
    unint64_t v22 = v18 - v25;
    if (v18 == v25)
    {
      do
      {
LABEL_20:
        BOOL v3 = v23-- != 0;
        if (!v3) {
          break;
        }
        unsigned int v28 = *(unsigned __int8 *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        uint64_t v27 = v28;
        unsigned int v29 = *(unsigned __int8 *)a2;
        a2 = (unint64_t *)((char *)a2 + 1);
        unint64_t v22 = v27 - v29;
      }

      while (v27 == v29);
      return v22;
    }

LABEL_18:
    unint64_t v26 = __clz(bswap64(v22)) & 0xFFFFFFFFFFFFFFF8LL;
    return (v18 >> v26) - (unint64_t)(v20 >> v26);
  }

  if (v4)
  {
    unint64_t v5 = (unint64_t *)((char *)a1 + v4);
    int8x16_t v6 = (unint64_t *)((char *)a2 + v4);
    while (1)
    {
      int8x16_t v7 = *(int8x16_t *)a1;
      a1 += 2;
      int8x16_t v8 = v7;
      int8x16_t v9 = *(int8x16_t *)a2;
      a2 += 2;
      int8x16_t v10 = vceqq_s8(v8, v9);
      v8.i8[0] = vminvq_u8((uint8x16_t)v10);
      if (!v8.i32[0]) {
        break;
      }
      BOOL v11 = v4 > 0x10;
      v4 -= 16LL;
      if (!v11)
      {
        a1 = v5;
        a2 = v6;
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    int8x16_t v12 = *(int8x16_t *)a1;
    a1 += 2;
    int8x16_t v13 = v12;
    int8x16_t v14 = *(int8x16_t *)a2;
    a2 += 2;
    int8x16_t v10 = vceqq_s8(v13, v14);
    v13.i8[0] = vminvq_u8((uint8x16_t)v10);
    if (v13.i32[0]) {
      return 0LL;
    }
  }

  uint8x16_t v16 = (uint8x16_t)vorrq_s8(v10, (int8x16_t)xmmword_6F40);
  v16.i8[0] = vminvq_u8(v16);
  return *((unsigned __int8 *)a1 + v16.u32[0] - 16) - (unint64_t)*((unsigned __int8 *)a2 + v16.u32[0] - 16);
}

unint64_t _platform_strnlen(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    return _platform_strlen(a1);
  }
  if (!a2) {
    return 0LL;
  }
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v4 = (int8x16_t *)&algn_7090[-(a1 & 0xF)];
  int8x16_t v5 = *v4;
  uint8x16_t v6 = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0LL), *v4);
  unint64_t v7 = a2 + (a1 & 0xF);
  while (1)
  {
    v5.i8[0] = vminvq_u8(v6);
    if (!v5.i32[0]) {
      break;
    }
    BOOL v9 = v7 > 0x10;
    v7 -= 16LL;
    if (!v9) {
      return v3 - a1 + v7 + 16;
    }
    uint8x16_t v8 = *(uint8x16_t *)(v3 + 16);
    v3 += 16LL;
    uint8x16_t v6 = v8;
  }

  uint8x16_t v10 = (uint8x16_t)veorq_s8(v5, v5);
  v10.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v6, v10), (int8x16_t)xmmword_7080));
  unint64_t v11 = v3 - a1;
  if (v7 >= v10.u32[0]) {
    unint64_t v7 = v10.u32[0];
  }
  return v11 + v7;
}

unint64_t _platform_strlen(uint64_t a1)
{
  unint64_t v1 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = (int8x16_t *)&algn_7090[-(a1 & 0xF)];
  int8x16_t v3 = *v2;
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0LL), *v2); ; uint8x16_t i = v5)
  {
    v3.i8[0] = vminvq_u8(i);
    if (!v3.i32[0]) {
      break;
    }
    uint8x16_t v5 = *(uint8x16_t *)(v1 + 16);
    v1 += 16LL;
  }

  uint8x16_t v6 = (uint8x16_t)veorq_s8(v3, v3);
  v6.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, v6), (int8x16_t)xmmword_7080));
  return v1 - a1 + v6.u32[0];
}

unint64_t _platform_strncmp(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  uint64_t v3 = 0LL;
  if (!a3) {
    return v3;
  }
  while ((a1 & 0xF) != 0)
  {
    unsigned int v5 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v4 = v5;
    unsigned int v6 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v3 = v4 - v6;
    if (v4 == v6 && (_DWORD)v4 != 0)
    {
      if (--a3) {
        continue;
      }
    }

    return v3;
  }

  unint64_t v9 = -(uint64_t)a2 & 0xFF0;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_11:
  if (a3 > v9)
  {
    unint64_t v10 = a3 - v9;
    while (1)
    {
      int8x16_t v11 = *a1++;
      int8x16_t v12 = v11;
      int8x16_t v13 = *a2++;
      int8x16_t v15 = vceqq_s8(v12, v13);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v12, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      v9 -= 16LL;
      if (!v9)
      {
        a3 = v10;
LABEL_16:
        while (1)
        {
          unsigned int v17 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v16 = v17;
          unsigned int v18 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v3 = v16 - v18;
          if (v16 != v18 || (_DWORD)v16 == 0) {
            return v3;
          }
          if (!--a3) {
            return v3;
          }
          if ((a1 & 0xF) == 0)
          {
            unint64_t v9 = 4080LL;
            goto LABEL_11;
          }
        }
      }
    }
  }

  else
  {
LABEL_30:
    while (1)
    {
      int8x16_t v20 = *a1++;
      int8x16_t v21 = v20;
      int8x16_t v22 = *a2++;
      int8x16_t v15 = vceqq_s8(v21, v22);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v21, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      BOOL v23 = a3 > 0x10;
      a3 -= 16LL;
      if (!v23) {
        return 0LL;
      }
    }
  }

  uint8x16_t v24 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v14, (uint8x16_t)veorq_s8(v15, v15)), (int8x16_t)xmmword_71A0);
  v24.i8[0] = vminvq_u8(v24);
  if (v24.u32[0] >= a3) {
    return 0LL;
  }
  else {
    return a1[-1].u8[v24.u32[0]] - (unint64_t)a2[-1].u8[v24.u32[0]];
  }
}

void *_platform_bzero(void *result, unint64_t a2)
{
  if (a2 < 0x40) {
    JUMPOUT(0x7410LL);
  }
  if (a2 < 0x8000) {
    JUMPOUT(0x73B0LL);
  }
  void *result = 0LL;
  result[1] = 0LL;
  result[2] = 0LL;
  result[3] = 0LL;
  result[4] = 0LL;
  result[5] = 0LL;
  result[6] = 0LL;
  result[7] = 0LL;
  unint64_t v2 = (unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0LL;
  unint64_t v3 = (unint64_t)result + a2 - v2 - 64;
  if ((unint64_t)result + a2 > v2 + 64)
  {
    do
    {
      __asm { DC              ZVA, X3 }

      v2 += 64LL;
      BOOL v8 = v3 > 0x40;
      v3 -= 64LL;
    }

    while (v8);
  }

  unint64_t v9 = (void *)(v2 + v3);
  *unint64_t v9 = 0LL;
  v9[1] = 0LL;
  v9[2] = 0LL;
  v9[3] = 0LL;
  v9[4] = 0LL;
  v9[5] = 0LL;
  v9[6] = 0LL;
  v9[7] = 0LL;
  return result;
}

uint64_t *_platform_memset(uint64_t *result, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3 = 0x101010101010101LL * a2;
  uint64_t v4 = result;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v11 = a3 >= 8;
      a3 -= 8LL;
      if (!v11) {
        break;
      }
      *v4++ = v3;
    }

    for (unint64_t i = a3 + 8; i; --i)
    {
      *(_BYTE *)uint64_t v4 = v3;
      uint64_t v4 = (uint64_t *)((char *)v4 + 1);
    }
  }

  else
  {
    if (a3 < 0x8000)
    {
      void *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      result[4] = v3;
      result[5] = v3;
      result[6] = v3;
      result[7] = v3;
      unsigned int v5 = (void *)((unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v10 = (unint64_t)result + a3;
      BOOL v7 = v10 > (unint64_t)(v5 + 8);
      for (unint64_t j = v10 - (void)(v5 + 8); v7; j -= 64LL)
      {
        *unsigned int v5 = v3;
        v5[1] = v3;
        v5[2] = v3;
        void v5[3] = v3;
        v5[4] = v3;
        v5[5] = v3;
        v5[6] = v3;
        v5[7] = v3;
        v5 += 8;
        BOOL v7 = j > 0x40;
      }
    }

    else
    {
      if (!v3) {
        JUMPOUT(0x72DCLL);
      }
      void *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      result[4] = v3;
      result[5] = v3;
      result[6] = v3;
      result[7] = v3;
      unsigned int v5 = (void *)((unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v6 = (unint64_t)result + a3;
      BOOL v7 = v6 > (unint64_t)(v5 + 8);
      for (unint64_t j = v6 - (void)(v5 + 8); v7; j -= 64LL)
      {
        *unsigned int v5 = v3;
        v5[1] = v3;
        v5[2] = v3;
        void v5[3] = v3;
        v5[4] = v3;
        v5[5] = v3;
        v5[6] = v3;
        v5[7] = v3;
        v5 += 8;
        BOOL v7 = j > 0x40;
      }
    }

    unint64_t v9 = (void *)((char *)v5 + j);
    *unint64_t v9 = v3;
    v9[1] = v3;
    v9[2] = v3;
    v9[3] = v3;
    v9[4] = v3;
    v9[5] = v3;
    v9[6] = v3;
    v9[7] = v3;
  }

  return result;
}

BOOL _platform_memcmp_zero_aligned8(int8x16_t *a1, unint64_t a2)
{
  if (a2 < 0x40)
  {
    if (a2)
    {
      uint64_t v12 = 0LL;
      do
      {
        uint64_t v13 = a1->i64[0];
        a1 = (int8x16_t *)((char *)a1 + 8);
        v12 |= v13;
        BOOL v9 = a2 > 8;
        a2 -= 8LL;
      }

      while (v9);
      return v12 != 0;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    unint64_t v2 = a1;
    uint64_t v3 = (int8x16_t *)((unint64_t)&a1[4] & 0xFFFFFFFFFFFFFFC0LL);
    int8x16_t v4 = *v2;
    int8x16_t v5 = v2[1];
    int8x16_t v6 = v2[2];
    int8x16_t v7 = v2[3];
    unint64_t v8 = a2 - ((char *)v3 - (char *)v2);
    BOOL v9 = v8 > 0x40;
    for (unint64_t i = v8 - 64; v9; i -= 64LL)
    {
      int8x16_t v4 = vorrq_s8(v4, *v3);
      int8x16_t v5 = vorrq_s8(v5, v3[1]);
      int8x16_t v6 = vorrq_s8(v6, v3[2]);
      int8x16_t v7 = vorrq_s8(v7, v3[3]);
      v3 += 4;
      BOOL v9 = i > 0x40;
    }

    return vmaxvq_u8((uint8x16_t)vorrq_s8( vorrq_s8( vorrq_s8(v4, *(int8x16_t *)((char *)v3 + i)),  vorrq_s8(v5, *(int8x16_t *)((char *)&v3[1] + i))),  vorrq_s8( vorrq_s8(v6, *(int8x16_t *)((char *)&v3[2] + i)),  vorrq_s8(v7, *(int8x16_t *)((char *)&v3[3] + i))))) != 0;
  }

void _platform_memset_pattern4(uint64_t a1, const float *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x7554LL);
    }
    JUMPOUT(0x75D0LL);
  }

  JUMPOUT(0x7650LL);
}

void _platform_memset_pattern8(uint64_t a1, const double *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x7554LL);
    }
    JUMPOUT(0x75D0LL);
  }

  JUMPOUT(0x7650LL);
}

int8x16_t *_platform_memset_pattern16(int8x16_t *result, int8x16_t *a2, unint64_t a3)
{
  int8x16_t v3 = *a2;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v14 = a3 >= 0x10;
      a3 -= 16LL;
      if (!v14) {
        break;
      }
      *result++ = v3;
    }

    unint64_t v15 = a3 + 16;
    if (v15)
    {
      unint64_t v17 = v3.u64[1];
      unint64_t v16 = v3.i64[0];
      do
      {
        result->i8[0] = v16;
        unint64_t result = (int8x16_t *)((char *)result + 1);
        unint64_t v16 = (v16 >> 8) | (v17 << 56);
        v17 >>= 8;
        --v15;
      }

      while (v15);
    }
  }

  else
  {
    if (a3 < 0x8000)
    {
      void *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      int8x16_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v12 = (unint64_t)result->u64 + a3;
      BOOL v6 = v12 > (unint64_t)(v4 + 4);
      unint64_t v7 = v12 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v13 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_76A0 + v8));
        do
        {
          *int8x16_t v4 = v13;
          v4[1] = v13;
          sigset_t v4[2] = v13;
          v4[3] = v13;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64LL;
        }

        while (v6);
      }
    }

    else
    {
      void *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      int8x16_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v5 = (unint64_t)result->u64 + a3;
      BOOL v6 = v5 > (unint64_t)(v4 + 4);
      unint64_t v7 = v5 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v9 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_76A0 + v8));
        do
        {
          *int8x16_t v4 = v9;
          v4[1] = v9;
          sigset_t v4[2] = v9;
          v4[3] = v9;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64LL;
        }

        while (v6);
      }
    }

    int8x16_t v10 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_76A0 + (((_BYTE)v8 + (_BYTE)v7) & 0xF)));
    BOOL v11 = (int8x16_t *)((char *)v4 + v7);
    *BOOL v11 = v10;
    v11[1] = v10;
    v11[2] = v10;
    v11[3] = v10;
  }

  return result;
}

unsigned __int8 *_platform_strchr(uint64_t a1, unsigned __int8 a2)
{
  int8x16_t v2 = vdupq_n_s8(a2);
  uint64_t v3 = a1 & 0xF;
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  int8x16_t v5 = *(int8x16_t *)&algn_79F0[-v3];
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(vbicq_s8(*(int8x16_t *)v4, vceqq_s8(*(int8x16_t *)v4, v2)), v5);
        ;
        uint8x16_t i = (uint8x16_t)vbicq_s8(v7, v5))
  {
    v5.i8[0] = vminvq_u8(i);
    if (!v5.i32[0]) {
      break;
    }
    int8x16_t v7 = *(int8x16_t *)(v4 + 16);
    v4 += 16LL;
    int8x16_t v5 = vceqq_s8(v7, v2);
  }

  uint8x16_t v8 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v5, v5)), (int8x16_t)xmmword_79E0);
  v8.i8[0] = vminvq_u8(v8);
  unint64_t result = (unsigned __int8 *)(v4 + v8.u32[0]);
  return result;
}

uint64_t swapcontext( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a2)
  {
    *(_DWORD *)a1 &= ~0x80000000;
    uint64_t v10 = *(void *)(a1 + 32);
    unsigned int v11 = getcontext(a1, a2, a3, a4, a5, a6, a7, a8, v9);
    *(void *)(a1 + 32) = v10;
    if (!v11 && *(int *)a1 >= 0)
    {
      *(_DWORD *)a1 |= 0x80000000;
      return setcontext(a2);
    }

    return v11;
  }

  else
  {
    *__error() = 22;
    return -1;
  }

uint64_t _ctx_done(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    _exit(0);
  }
  *(void *)(a1 + 40) = 0LL;
  uint64_t result = setcontext(*(void *)(a1 + 32));
  __break(1u);
  return result;
}

  ;
}

void *makecontext( void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v18 = result;
  if (result)
  {
    if (result[1] && a3 <= 0x40000)
    {
      result[6] = result + 8;
      uint64_t result = _platform_bzero((void *)result[1], result[2]);
      unint64_t v15 = (v18[1] + v18[2]) & 0xFFFFFFFFFFFFFFF0LL;
      if (a3 >= 8) {
        int v10 = a3;
      }
      else {
        int v10 = 8;
      }
      BOOL v14 = (_DWORD *)((v15 - 4LL * v10) & 0xFFFFFFFFFFFFFFF0LL);
      int8x16_t v13 = (int *)&a9;
      for (int i = 0; i < a3; ++i)
      {
        int v9 = *v13;
        v13 += 2;
        *v14++ = v9;
      }

      unsigned int v11 = (void *)v18[6];
      v11[31] = v15;
      v11[33] = (v15 - 4LL * v10) & 0xFFFFFFFFFFFFFFF0LL;
      v11[32] = _ctx_start;
      v11[21] = v18;
      v11[22] = a2 ^ *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
    }

    else
    {
      result[5] = 0LL;
    }
  }

  return result;
}

uint64_t populate_signal_stack_context(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  __int128 v6 = 0uLL;
  uint64_t v7 = 0LL;
  if (__sigaltstack(0LL, &v6) || (v7 & 1) == 0)
  {
    *(void *)&__int128 v6 = v8;
    v5.rlim_cur = 0LL;
    v5.rlim_max = 0LL;
    if (!getrlimit(3, &v5)) {
      *((void *)&v6 + 1) = v5.rlim_cur;
    }
  }

  uint64_t v2 = v9;
  *(_OWORD *)(v9 + 8) = v6;
  *(void *)(v2 + 24) = v7;
  sigprocmask(2, 0LL, (sigset_t *)(v9 + 4));
  uint64_t v4 = v9 + 64;
  *(void *)(v9 + 48) = v9 + 64;
  *(void *)(v9 + 40) = 816LL;
  *(void *)(v9 + 32) = __in_sigtramp;
  return v4;
}

uint64_t setcontext(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    sigprocmask(3, (const sigset_t *)(a1 + 4), 0LL);
    return _setcontext();
  }

  else
  {
    *__error() = 22;
    return -1;
  }

uint64_t _setcontext()
{
  return 0LL;
}

void _ctx_start()
{
}

uint64_t getcontext( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v27 = (void *)populate_signal_stack_context(a1, (uint64_t)vars0);
  uint64_t v28 = vars0[1];
  v27[31] = vars0[0];
  v27[32] = v28;
  v27[33] = &a9;
  v27[21] = v9;
  v27[22] = v10;
  v27[23] = v11;
  v27[24] = v12;
  v27[25] = v13;
  v27[26] = v14;
  v27[27] = v15;
  v27[28] = v16;
  v27[29] = v17;
  v27[30] = v18;
  v27[2] = 0LL;
  v27[53] = v19;
  v27[55] = v20;
  v27[57] = v21;
  v27[59] = v22;
  v27[61] = v23;
  v27[63] = v24;
  v27[65] = v25;
  v27[67] = v26;
  return 0LL;
}

BOOL timingsafe_enable_if_supported()
{
  BOOL v7 = 0LL;
  uint64_t v6 = MEMORY[0xFFFFFC010] & 0x200200000000000LL;
  if ((MEMORY[0xFFFFFC010] & 0x200200000000000LL & 0x200000000000000LL) != 0)
  {
    BOOL v7 = is_dit_enabled() != 0;
    __asm { MSR             DIT, #1 }
  }

  speculation_barrier(v6);
  return v7;
}

unint64_t is_dit_enabled()
{
  return (_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) >> 24) & 1;
}

void speculation_barrier(uint64_t a1)
{
  if ((a1 & 0x200000000000LL) != 0)
  {
    sb();
  }

  else
  {
    __dsb(0xFu);
    __isb(0xFu);
  }

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((MEMORY[0xFFFFFC010] & 0x200200000000000LL & 0x200000000000000LL) != 0 && (result & 1) == 0) {
    __asm { MSR             DIT, #0 }
  }

  return result;
}

void sb()
{
  __asm { SB }

void OSAtomicFifoEnqueue_cold_1()
{
  qword_10008 = (uint64_t)"BUG IN LIBPLATFORM: Invalid commpage pfz base.";
  qword_10038 = 0LL;
  __break(1u);
}

void _os_lock_corruption_abort(uint64_t a1, uint64_t a2)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_lock is corrupt";
  qword_10038 = a2;
  __break(1u);
}

void _os_unfair_lock_recursive_abort(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_unfair_lock";
  qword_10038 = a1;
  __break(1u);
}

void _os_unfair_lock_unowned_abort(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_unfair_lock not owned by current thread";
  qword_10038 = a1;
  __break(1u);
}

void _os_unfair_lock_corruption_abort(unsigned int a1)
{
  if (a1 - 512 <= 0x3FE00)
  {
    qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt, or owner thread exited without unlocking";
    qword_10038 = a1;
    __break(1u);
  }

  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt";
  qword_10038 = a1;
  __break(1u);
}

void _os_once_gate_recursive_abort(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_once_t";
  qword_10038 = a1;
  __break(1u);
}

void _os_once_gate_unowned_abort(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_once_t not owned by current thread";
  qword_10038 = a1;
  __break(1u);
}

void _os_once_gate_corruption_abort(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_once_t is corrupt";
  qword_10038 = a1;
  __break(1u);
}

void _os_lock_recursive_abort(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_lock";
  qword_10038 = a1;
  __break(1u);
}

void os_unfair_lock_assert_owner_cold_1(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly not owned by current thread";
  qword_10038 = a1;
  __break(1u);
}

void os_unfair_lock_assert_not_owner_cold_1(unsigned int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly owned by current thread";
  qword_10038 = a1;
  __break(1u);
}

void os_unfair_recursive_lock_unlock_forked_child_cold_1()
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Lock was not held";
  __break(1u);
}

void _os_alloc_cold_1(uint64_t a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Requested allocation size is invalid";
  qword_10038 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_1(int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Creating semaphore failed, possible port leak";
  qword_10038 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_2()
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Allocating semaphore failed with MIG_REPLY_MISMATCH";
  qword_10038 = -301LL;
  __break(1u);
}

void _os_semaphore_dispose_cold_1(int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Destroying semaphore failed";
  qword_10038 = a1;
  __break(1u);
}

void _os_semaphore_signal_cold_1(int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Signaling semaphore failed";
  qword_10038 = a1;
  __break(1u);
}

void _os_semaphore_wait_cold_1(int a1)
{
  qword_10008 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Waiting on semaphore failed";
  qword_10038 = a1;
  __break(1u);
  __error();
}