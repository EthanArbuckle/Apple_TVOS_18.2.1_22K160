uint64_t _pthread_globals_init(uint64_t result)
{
  unsigned __int8 i;
  for (i = 0; i < 7u; ++i)
  {
    *(_WORD *)(result + 272 + 2LL * i) = -1;
    *(_WORD *)(result + 286 + 2LL * i) = -1;
    *(_WORD *)(result + 300 + 2LL * i) = -1;
  }

  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  kern_return_t v2;
  v2 = 22;
  if (a1->__sig == 1414022209)
  {
    if (!*(_DWORD *)&a1->__opaque[40] || *(_DWORD *)&a1->__opaque[40] == -1)
    {
      a1->__sig = 0LL;
      return 0;
    }

    else
    {
      v2 = mach_port_mod_refs(mach_task_self_, *(_DWORD *)&a1->__opaque[40], 0, -1);
      if (!v2) {
        a1->__sig = 0LL;
      }
    }
  }

  return v2;
}

int pthread_attr_getdetachstate(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = a1->__opaque[32];
    return 0;
  }

  return v3;
}

int pthread_attr_getinheritsched(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = BYTE1(*(void *)&a1->__opaque[32]);
    return 0;
  }

  return v3;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    if (((*(void *)&a1->__opaque[32] >> 24) & 1) != 0)
    {
      *a2 = *(sched_param *)&a1->__opaque[24];
    }

    else
    {
      a2->sched_priority = default_priority;
      *(_DWORD *)a2->__opaque = 10;
    }

    return 0;
  }

  return v3;
}

int pthread_attr_getschedpolicy(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = BYTE2(*(void *)&a1->__opaque[32]);
    return 0;
  }

  return v3;
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return 0;
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2))
  {
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFFFFFF00LL | a2;
    return 0;
  }

  return v3;
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2))
  {
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)a2 << 8);
    return 0;
  }

  return v3;
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *(sched_param *)&a1->__opaque[24] = *a2;
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFEFFFFFFLL | 0x1000000;
    return 0;
  }

  return v3;
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2 || a2 == 4))
  {
    if (a2 != 2 && a2 != 4) {
      *(void *)&a1->__opaque[32] &= ~0x8000000uLL;
    }
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)a2 << 16);
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFBFFFFFFLL | 0x4000000;
    return 0;
  }

  return v3;
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    if (a2 == 1)
    {
      return 0;
    }

    else if (a2 == 2)
    {
      return 45;
    }
  }

  return v3;
}

int pthread_attr_getscope(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = 1;
    return 0;
  }

  return v3;
}

int pthread_attr_getstackaddr(const pthread_attr_t *a1, void **a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = *(void **)&a1->__opaque[8];
    return 0;
  }

  return v3;
}

int pthread_attr_setstackaddr(pthread_attr_t *a1, void *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && ((unint64_t)a2 & vm_page_mask) == 0)
  {
    *(void *)&a1->__opaque[8] = a2;
    *(void *)&a1->__opaque[32] &= ~0x10000000uLL;
    *(void *)a1->__opaque = 0LL;
    return 0;
  }

  return v3;
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = _pthread_attr_stacksize((uint64_t)a1);
    return 0;
  }

  return v3;
}

uint64_t _pthread_attr_stacksize(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    return *(void *)(a1 + 24);
  }
  else {
    return 0x80000LL;
  }
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 & vm_page_mask) == 0 && a2 >= 0x4000)
  {
    *(void *)&a1->__opaque[16] = a2;
    return 0;
  }

  return v3;
}

int pthread_attr_getstack(const pthread_attr_t *a1, void **a2, size_t *a3)
{
  int v4 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = (void *)(*(void *)&a1->__opaque[8] - *(void *)&a1->__opaque[16]);
    *a3 = _pthread_attr_stacksize((uint64_t)a1);
    return 0;
  }

  return v4;
}

int pthread_attr_setstack(pthread_attr_t *a1, void *a2, size_t a3)
{
  int v4 = 22;
  if (a1->__sig == 1414022209 && ((unint64_t)a2 & vm_page_mask) == 0 && (a3 & vm_page_mask) == 0 && a3 >= 0x4000)
  {
    *(void *)&a1->__opaque[8] = (char *)a2 + a3;
    *(void *)&a1->__opaque[16] = a3;
    return 0;
  }

  return v4;
}

int pthread_attr_setguardsize(pthread_attr_t *a1, size_t a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 & vm_page_mask) == 0)
  {
    *(void *)&a1->__opaque[32] &= ~0x10000000uLL;
    *(void *)a1->__opaque = a2;
    return 0;
  }

  return v3;
}

int pthread_attr_getguardsize(const pthread_attr_t *a1, size_t *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = _pthread_attr_guardsize((uint64_t)a1);
    return 0;
  }

  return v3;
}

vm_size_t _pthread_attr_guardsize(uint64_t a1)
{
  if (((*(void *)(a1 + 40) >> 28) & 1) != 0) {
    return vm_page_size;
  }
  else {
    return *(void *)(a1 + 8);
  }
}

uint64_t pthread_attr_setcpupercent_np(void *a1, int a2, unint64_t a3)
{
  unsigned int v4 = 22;
  if (*a1 == 1414022209LL
    && a2 < 255
    && a3 < 0x1FFFFFF
    && ((a1[5] >> 26) & 1) != 0
    && (BYTE2(a1[5]) == 2 || BYTE2(a1[5]) == 4))
  {
    a1[5] = a1[5] & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)a2 << 32);
    a1[5] = a1[5] & 0xFFFFFFFFFFLL | ((a3 & 0xFFFFFF) << 40);
    a1[5] = a1[5] & 0xFFFFFFFFF7FFFFFFLL | 0x8000000;
    return 0;
  }

  return v4;
}

uint64_t pthread_attr_setworkinterval_np(uint64_t a1, mach_port_name_t a2)
{
  unsigned int v3 = 22;
  if (*(void *)a1 == 1414022209LL)
  {
    if (a2)
    {
      if (a2 != -1)
      {
        unsigned int v3 = mach_port_mod_refs(mach_task_self_, a2, 0, 1);
        if (!v3) {
          *(_DWORD *)(a1 + 48) = a2;
        }
      }
    }
  }

  return v3;
}

uint64_t _pthread_deallocate(uint64_t result, char a2)
{
  uint64_t v2 = result;
  if (result != _main_thread_ptr)
  {
    if ((a2 & 1) == 0) {
      _pthread_introspection_thread_destroy(result);
    }
    result = mach_vm_deallocate(mach_task_self_, *(void *)(v2 + 192), *(void *)(v2 + 200));
    if ((_DWORD)result)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Unable to deallocate stack";
      qword_24058 = (int)result;
      __break(1u);
      JUMPOUT(0x1E58LL);
    }
  }

  return result;
}

uint64_t _pthread_introspection_thread_destroy(uint64_t result)
{
  return result;
}

void _pthread_start( unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (((HIBYTE(a6) >> 5) & 1) != 0)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: kernel without PTHREAD_START_SUSPENDED support";
    qword_24058 = a6;
    __break(1u);
    JUMPOUT(0x1F2CLL);
  }

  if ((a6 & 0x10000000) == 0)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_24058 = a6;
    __break(1u);
    JUMPOUT(0x1F74LL);
  }

  BOOL v9 = 0;
  if (a2) {
    BOOL v9 = a2 != -1;
  }
  if (!v9)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: MACH_PORT_VALID(kport)";
    __break(1u);
    JUMPOUT(0x1FD0LL);
  }

  if (*(_DWORD *)(a1 + 248) != a2)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: _pthread_tsd_slot(self, MACH_THREAD_SELF) == kport";
    __break(1u);
    JUMPOUT(0x2014LL);
  }

  if ((*(void *)a1 ^ _pthread_ptr_munge_token) != a1) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  uint64_t v6 = _pthread_markcancel_if_canceled(a1, a2);
  *(void *)(a1 + 216) = __thread_selfid(v6);
  if (*(void *)(a1 + 216) == -1LL)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x20E8LL);
  }

  unsigned int v12 = *(_DWORD *)(a1 + 248);
  BOOL v8 = 0;
  if (v12) {
    BOOL v8 = v12 != -1;
  }
  if (!v8)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_24058 = v12;
    __break(1u);
    JUMPOUT(0x2170LL);
  }

  _pthread_introspection_thread_start((void *)a1);
  uint64_t v7 = (*(uint64_t (**)(void))(a1 + 144))(*(void *)(a1 + 152));
  _pthread_exit(a1, v7);
}

void _pthread_exit(unint64_t a1, uint64_t a2)
{
  while (1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (!v2) {
      break;
    }
    (*(void (**)(void))v2)(*(void *)(v2 + 8));
    *(void *)(a1 + 8) = *(void *)(v2 + 16);
  }

  _pthread_tsd_cleanup(a1);
  uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 72);
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 72) = 0LL;
  if (v5) {
    _os_semaphore_dispose(v5);
  }
  _pthread_terminate_invoke(a1, a2);
  pthread_is_threaded_np();
}

int pthread_is_threaded_np(void)
{
  return __is_threaded;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  pthread_t v3 = a1;
  mach_port_t v2 = 0;
  pthread_t v7 = a1;
  uint64_t v6 = &v2;
  mach_port_t v5 = 0;
  char v4 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v11 = StatusReg;
  if (a1 == (pthread_t)(StatusReg - 224))
  {
    pthread_t v9 = v7;
    uint64_t v8 = 0LL;
    uint64_t v8 = v7->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v8 != v7) {
      abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    char v4 = 1;
    mach_port_t v5 = *(_DWORD *)&v7->__opaque[232];
  }

  else
  {
    v13 = (int *)v7;
    i = 0LL;
    if (v7)
    {
      v17 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
      for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
      {
        if (!i)
        {
          v18 = &_pthread_list_lock;
          os_unfair_lock_unlock(&_pthread_list_lock);
          char v14 = 0;
          goto LABEL_15;
        }

        if (i == v13) {
          break;
        }
      }

      v16 = i;
      uint64_t v15 = 0LL;
      uint64_t v15 = *(void *)i ^ _pthread_ptr_munge_token;
      char v14 = 1;
    }

    else
    {
      char v14 = 0;
    }

LABEL_15:
    if ((v14 & 1) != 0)
    {
      mach_port_t v5 = *(_DWORD *)&v7->__opaque[232];
      char v4 = 1;
      os_unfair_lock_t lock = &_pthread_list_lock;
      os_unfair_lock_unlock(&_pthread_list_lock);
    }

    else
    {
      char v4 = 0;
    }
  }

  if (v6) {
    *uint64_t v6 = v5;
  }
  return v2;
}

pthread_t pthread_from_mach_thread_np(mach_port_t a1)
{
  return (pthread_t)i;
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  size_t v3 = 0LL;
  if (!a1) {
    return 3LL;
  }
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) || a1 == (pthread_t)_main_thread_ptr)
  {
    size_t v3 = *(void *)&a1->__opaque[160] - *(void *)&a1->__opaque[168];
  }

  else
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v7 = 0;
        goto LABEL_14;
      }
    }

    char v7 = 1;
LABEL_14:
    if ((v7 & 1) != 0)
    {
      size_t v3 = *(void *)&a1->__opaque[160] - *(void *)&a1->__opaque[168];
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
  }

  if (v3) {
    return v3;
  }
  else {
    return 0x80000LL;
  }
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) || a1 == (pthread_t)_main_thread_ptr) {
    return *(void **)&a1->__opaque[160];
  }
  if (a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v6 = 0;
        goto LABEL_14;
      }
    }

    char v6 = 1;
  }

  else
  {
    char v6 = 0;
  }

LABEL_14:
  if ((v6 & 1) == 0) {
    return &dword_0 + 3;
  }
  mach_port_t v2 = *(void **)&a1->__opaque[160];
  os_unfair_lock_unlock(&_pthread_list_lock);
  return v2;
}

uint64_t pthread_main_thread_np()
{
  return _main_thread_ptr;
}

int pthread_main_np(void)
{
  unint64_t v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return v0 == _main_thread_ptr;
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  int v4 = 0;
  unint64_t v3 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if (!a2) {
    return 22;
  }
  if (a1 && a1 != (pthread_t)v3)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v9 = 0;
        goto LABEL_14;
      }
    }

    char v9 = 1;
LABEL_14:
    if ((v9 & 1) != 0)
    {
      *a2 = *(void *)&a1->__opaque[200];
      if (!*a2) {
        int v4 = _pthread_threadid_slow((uint64_t)a1, a2);
      }
      os_unfair_lock_unlock(&_pthread_list_lock);
    }

    else
    {
      return 3;
    }
  }

  else
  {
    *a2 = *(void *)(v3 + 216);
  }

  return v4;
}

uint64_t _pthread_threadid_slow(uint64_t a1, void *a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  mach_msg_type_number_t thread_info_outCnt = 6;
  thread_inspect_t v6 = 0;
  thread_inspect_t v6 = *(_DWORD *)(a1 + 248);
  *(void *)thread_info_out = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  if (thread_info(v6, 4u, thread_info_out, &thread_info_outCnt) || !*(void *)thread_info_out)
  {
    return 22;
  }

  else
  {
    *uint64_t v8 = *(void *)thread_info_out;
    *(void *)(v9 + 216) = *(void *)thread_info_out;
    return 0;
  }
}

uint64_t pthread_cpu_number_np(unint64_t *a1)
{
  if (a1)
  {
    *a1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    return 0;
  }

  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    _platform_strlcpy(a2, &a1->__opaque[64], a3);
    return 0;
  }

  else
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
      for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
      {
        if (!i)
        {
          os_unfair_lock_unlock(&_pthread_list_lock);
          char v9 = 0;
          goto LABEL_13;
        }
      }

      char v9 = 1;
    }

    else
    {
      char v9 = 0;
    }

LABEL_13:
    if ((v9 & 1) != 0)
    {
      _platform_strlcpy(a2, &a1->__opaque[64], a3);
      os_unfair_lock_unlock(&_pthread_list_lock);
      return 0;
    }

    else
    {
      return 3;
    }
  }

int pthread_setname_np(const char *a1)
{
  uint64_t v4 = (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  uint64_t v3 = 0LL;
  if (a1) {
    uint64_t v3 = _platform_strlen(a1);
  }
  if ((void *)(*v4 ^ _pthread_ptr_munge_token) != v4) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  uint64_t v1 = getpid();
  int v5 = __proc_info(5LL, v1, 2LL, 0LL, a1, v3);
  if (!v5)
  {
    if (v3) {
      _platform_strlcpy(v4 + 10, a1, 64LL);
    }
    else {
      _platform_bzero(v4 + 10, 64LL);
    }
  }

  return v5;
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 0);
}

uint64_t _pthread_create(mach_vm_address_t *a1, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  v16 = a1;
  uint64_t v15 = a2;
  uint64_t v14 = a3;
  uint64_t v13 = a4;
  int v12 = a5;
  mach_vm_address_t v11 = 0LL;
  v10[8] = 0;
  *(void *)v10 = a5 & 1;
  mach_port_name_t name = 0;
  unsigned int v8 = 0;
  if (a2)
  {
    if (*(void *)v15 != 1414022209LL) {
      return 22;
    }
  }

  else
  {
    uint64_t v15 = "ADHT";
  }

  unsigned int v7 = 0x1000000;
  if ((*((_DWORD *)v15 + 10) & 0x1000000) != 0)
  {
    uint64_t v6 = 0LL;
    v19 = v15;
    v18 = &v6;
    if ((*((_DWORD *)v15 + 10) & 0x1000000) != 0)
    {
      uint64_t *v18 = *((void *)v19 + 4);
    }

    else
    {
      *(_DWORD *)v18 = default_priority;
      *((_DWORD *)v18 + 1) = 10;
    }

    v7 |= 0x2000000u;
    v7 |= *((unsigned __int8 *)v15 + 42) << 16;
    v7 |= (unsigned __int16)v6;
  }

  else if (*((void *)v15 + 4))
  {
    v7 |= 0x8000000 | *((_DWORD *)v15 + 8) & 0xFFFFFF;
  }

  if ((v12 & 2) != 0) {
    v7 |= 0x20000000u;
  }
  __is_threaded = 1;
  mach_vm_address_t v11 = _pthread_allocate((uint64_t)v15, (mach_vm_address_t *)&v10[1], v10[0] & 1);
  if (v11)
  {
    if ((v10[0] & 1) != 0)
    {
      mach_port_name_t name = mach_thread_self();
    }

    else
    {
      uint64_t v20 = 3LL;
      uint64_t v24 = 3LL;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      mach_port_name_t name = *(void *)(StatusReg + 24);
    }

    *(void *)(v11 + 152) = v13;
    *(void *)(v11 + 144) = v14;
    mach_vm_address_t v28 = v11;
    mach_port_name_t v27 = name;
    char v26 = v10[0] & 1;
    v34 = &_pthread_list_lock;
    mach_port_name_t v33 = name;
    os_unfair_lock_lock_no_tsd(&_pthread_list_lock, 327680LL, name);
    *(void *)(v28 + 16) = 0LL;
    *(void *)(v28 + 24) = off_28008;
    *off_28008 = (int *)v28;
    off_28008 = (int **)(v28 + 16);
    ++_pthread_count;
    v38 = &_pthread_list_lock;
    mach_port_name_t v37 = v27;
    os_unfair_lock_unlock_no_tsd(&_pthread_list_lock, v27);
    if ((v26 & 1) == 0) {
      _pthread_introspection_thread_create(v28);
    }
    if (__bsdthread_create(v14, v13, *(void *)&v10[1], v11, v7) == -1)
    {
      uint64_t v21 = 1LL;
      uint64_t v22 = 1LL;
      unint64_t v23 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      if (**(_DWORD **)(v23 + 8) == 24)
      {
        qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
        __break(1u);
        JUMPOUT(0x3568LL);
      }

      mach_vm_address_t v30 = v11;
      mach_port_name_t v29 = name;
      v32 = &_pthread_list_lock;
      mach_port_name_t v31 = name;
      os_unfair_lock_lock_no_tsd(&_pthread_list_lock, 327680LL, name);
      if (*(void *)(v30 + 16)) {
        *(void *)(*(void *)(v30 + 16) + 24LL) = *(void *)(v30 + 24);
      }
      else {
        off_28008 = *(int ***)(v30 + 24);
      }
      **(void **)(v30 + 24) = *(void *)(v30 + 16);
      --_pthread_count;
      v36 = &_pthread_list_lock;
      mach_port_name_t v35 = v29;
      os_unfair_lock_unlock_no_tsd(&_pthread_list_lock, v29);
      _pthread_deallocate(v11, v10[0] & 1);
      mach_vm_address_t v11 = 0LL;
      unsigned int v8 = 35;
    }

    if ((v10[0] & 1) != 0) {
      mach_port_deallocate(mach_task_self_, name);
    }
    mach_vm_address_t *v16 = v11;
    return v8;
  }

  else
  {
    return 35;
  }

int pthread_create_from_mach_thread( pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 1);
}

int pthread_create_suspended_np(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 2);
}

uint64_t pthread_install_workgroup_functions_np(uint64_t result)
{
  if (_pthread_workgroup_functions)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions already installed";
    qword_24058 = _pthread_workgroup_functions;
    __break(1u);
    JUMPOUT(0x3778LL);
  }

  _pthread_workgroup_functions = result;
  return result;
}

uint64_t pthread_create_with_workgroup_np(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!_pthread_workgroup_functions)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions not yet installed";
    __break(1u);
    JUMPOUT(0x37E0LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(_pthread_workgroup_functions + 8))( a1,  a2,  a3,  a4,  a5);
}

int pthread_detach(pthread_t a1)
{
  int v4 = 0;
  char v3 = 0;
  char v2 = 0;
  if (a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v9 = 0;
        goto LABEL_11;
      }
    }

    char v9 = 1;
  }

  else
  {
    char v9 = 0;
  }

LABEL_11:
  if ((v9 & 1) == 0) {
    return 3;
  }
  if ((a1->__opaque[33] & 1) != 0)
  {
    if (*(_DWORD *)&a1->__opaque[36] == -1)
    {
      char v3 = 1;
    }

    else
    {
      a1->__opaque[33] &= ~1u;
      if (*(void *)&a1->__opaque[16])
      {
        _pthread_joiner_prepost_wake((uint64_t)a1);
        char v2 = 1;
      }
    }
  }

  else
  {
    int v4 = 22;
  }

  os_unfair_lock_unlock(&_pthread_list_lock);
  if ((v3 & 1) != 0)
  {
    pthread_join_NOCANCEL((uint64_t)a1, 0LL);
  }

  else if ((v2 & 1) != 0)
  {
    _pthread_joiner_wake((uint64_t)a1);
  }

  return v4;
}

  if ((v10 & 1) == 0) {
    return 3;
  }
  if (a2) {
    *a2 = a1->__opaque[32];
  }
  if (a3) {
    *a3 = *(sched_param *)&a1->__opaque[40];
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  return 0;
}

  int v4 = HIBYTE(a2) << 24;
  if (v3 <= 6u) {
    v4 |= (1 << (v3 + 7)) | 0xFF;
  }
  return v4;
}

uint64_t _pthread_joiner_wake(uint64_t a1)
{
  uint64_t v2 = a1 + 52;
  while (1)
  {
    uint64_t result = __ulock_wake(16777218LL, v2, 0LL);
    if (!(_DWORD)result || (_DWORD)result == -2) {
      break;
    }
    if ((_DWORD)result != -4)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: pthread_join() wake failure";
      qword_24058 = -(int)result;
      __break(1u);
      JUMPOUT(0x3B44LL);
    }
  }

  return result;
}

int pthread_kill(pthread_t a1, int a2)
{
  pthread_t v6 = a1;
  int v5 = a2;
  if (a2 < 0 || v5 > 32) {
    return 22;
  }
  unsigned int v4 = 0;
  pthread_t v11 = v6;
  v10 = &v4;
  unsigned int v9 = 0;
  char v8 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v15 = StatusReg;
  if (v6 == (pthread_t)(StatusReg - 224))
  {
    pthread_t v13 = v11;
    uint64_t v12 = 0LL;
    uint64_t v12 = v11->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v12 != v11) {
      abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    char v8 = 1;
    unsigned int v9 = *(_DWORD *)&v11->__opaque[232];
  }

  else
  {
    v17 = (int *)v11;
    i = 0LL;
    if (v11)
    {
      uint64_t v21 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
      for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
      {
        if (!i)
        {
          uint64_t v22 = &_pthread_list_lock;
          os_unfair_lock_unlock(&_pthread_list_lock);
          char v18 = 0;
          goto LABEL_18;
        }

        if (i == v17) {
          break;
        }
      }

      uint64_t v20 = i;
      uint64_t v19 = 0LL;
      uint64_t v19 = *(void *)i ^ _pthread_ptr_munge_token;
      char v18 = 1;
    }

    else
    {
      char v18 = 0;
    }

LABEL_18:
    if ((v18 & 1) != 0)
    {
      unsigned int v9 = *(_DWORD *)&v11->__opaque[232];
      char v8 = 1;
      os_unfair_lock_t lock = &_pthread_list_lock;
      os_unfair_lock_unlock(&_pthread_list_lock);
    }

    else
    {
      char v8 = 0;
    }
  }

  if (v10) {
    unsigned int *v10 = v9;
  }
  if ((v8 & 1) == 0) {
    return 3;
  }
  int v3 = __pthread_kill(v4, v5);
  if (v3 == -1)
  {
    uint64_t v24 = 1LL;
    uint64_t v25 = 1LL;
    unint64_t v26 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    return **(_DWORD **)(v26 + 8);
  }

  return v3;
}

uint64_t __pthread_workqueue_setkill(int a1)
{
  return __bsdthread_ctl(4096LL, a1, 0LL);
}

void pthread_exit(void *a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v1 = (void *)(StatusReg - 224);
  if ((*(_WORD *)(StatusReg - 146) & 0x400) != 0)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_exit() called from a thread not created by pthread_create()";
    __break(1u);
    JUMPOUT(0x3F28LL);
  }

  if ((void *)(*v1 ^ _pthread_ptr_munge_token) != v1) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  _pthread_exit((unint64_t)v1, (uint64_t)a1);
}

BOOL pthread_self_is_exiting_np()
{
  return (*(_WORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 58) & 0x20) != 0;
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  if (a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v10 = 0;
        goto LABEL_11;
      }
    }

    char v10 = 1;
  }

  else
  {
    char v10 = 0;
  }

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  kern_return_t v38;
  mach_msg_type_number_t v39;
  policy_base_t v40;
  uint64_t v41;
  uint64_t v42;
  const sched_param *v43;
  policy_t v44;
  thread_act_t v45;
  pthread_t v46;
  int v47;
  unint64_t StatusReg;
  unint64_t v49;
  pthread_t v9 = a1;
  int v8 = a2;
  unsigned int v7 = a3;
  thread_act_t v6 = 0;
  int v5 = 1;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v23 = StatusReg;
  if (a1 == (pthread_t)(StatusReg - 224) || v9 == (pthread_t)_main_thread_ptr)
  {
    pthread_t v12 = v9;
    uint64_t v11 = 0LL;
    uint64_t v11 = v9->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v11 != v9) {
      abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    thread_act_t v6 = *(_DWORD *)&v9->__opaque[232];
  }

  else
  {
    int v5 = 0;
    pthread_t v16 = v9;
    unint64_t v15 = &v6;
    thread_act_t v14 = 0;
    char v13 = 0;
    v49 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v22 = v49;
    if (v9 == (pthread_t)(v49 - 224))
    {
      pthread_t v18 = v16;
      uint64_t v17 = 0LL;
      uint64_t v17 = v16->__sig ^ _pthread_ptr_munge_token;
      if ((pthread_t)v17 != v16) {
        abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
      }
      char v13 = 1;
      thread_act_t v14 = *(_DWORD *)&v16->__opaque[232];
    }

    else
    {
      uint64_t v25 = (int *)v16;
      i = 0LL;
      if (v16)
      {
        mach_port_name_t v29 = &_pthread_list_lock;
        os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
        for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
        {
          if (!i)
          {
            mach_vm_address_t v30 = &_pthread_list_lock;
            os_unfair_lock_unlock(&_pthread_list_lock);
            char v26 = 0;
            goto LABEL_20;
          }

          if (i == v25) {
            break;
          }
        }

        mach_vm_address_t v28 = i;
        uint64_t v27 = 0LL;
        uint64_t v27 = *(void *)i ^ _pthread_ptr_munge_token;
        char v26 = 1;
      }

      else
      {
        char v26 = 0;
      }

LABEL_20:
      if ((v26 & 1) != 0)
      {
        thread_act_t v14 = *(_DWORD *)&v16->__opaque[232];
        char v13 = 1;
        os_unfair_lock_t lock = &_pthread_list_lock;
        os_unfair_lock_unlock(&_pthread_list_lock);
      }

      else
      {
        char v13 = 0;
      }
    }

    if (v15) {
      *unint64_t v15 = v14;
    }
    if ((v13 & 1) == 0) {
      return 3;
    }
  }

  v46 = v9;
  v45 = v6;
  v44 = v8;
  v43 = v7;
  v41 = 0LL;
  v42 = 0LL;
  v40 = 0LL;
  v39 = 0;
  v38 = 0;
  if (((*(_WORD *)&v9->__opaque[62] >> 10) & 1) == 0)
  {
    switch(v44)
    {
      case 1:
        LODWORD(v41) = v43->sched_priority;
        v40 = (policy_base_t)&v41;
        v39 = 1;
        break;
      case 2:
        HIDWORD(v41) = v43->sched_priority;
        LODWORD(v42) = *(_DWORD *)v43->__opaque;
        v40 = (policy_base_t)&v41 + 1;
        v39 = 2;
        break;
      case 4:
        HIDWORD(v42) = v43->sched_priority;
        v40 = (policy_base_t)&v42 + 1;
        v39 = 1;
        break;
      default:
        v47 = 22;
        goto LABEL_40;
    }

    v38 = thread_policy(v45, v44, v40, v39, 1);
    if (v38) {
      int v3 = 22;
    }
    else {
      int v3 = 0;
    }
    v47 = v3;
    goto LABEL_40;
  }

  v47 = 45;
LABEL_40:
  if (!v47)
  {
    if (v5)
    {
      uint64_t v19 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    }

    else
    {
      v32 = (int *)v9;
      j = 0LL;
      if (v9)
      {
        v36 = &_pthread_list_lock;
        os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
        for (j = __pthread_head; ; j = (int *)*((void *)j + 2))
        {
          if (!j)
          {
            mach_port_name_t v37 = &_pthread_list_lock;
            os_unfair_lock_unlock(&_pthread_list_lock);
            char v33 = 0;
            goto LABEL_54;
          }

          if (j == v32) {
            break;
          }
        }

        mach_port_name_t v35 = j;
        uint64_t v34 = 0LL;
        uint64_t v34 = *(void *)j ^ _pthread_ptr_munge_token;
        char v33 = 1;
      }

      else
      {
        char v33 = 0;
      }

LABEL_54:
      if ((v33 & 1) == 0) {
        return 3;
      }
    }

    v9->__opaque[32] = v8;
    *(sched_param *)&v9->__opaque[40] = *v7;
    os_unfair_lock_t v21 = &_pthread_list_lock;
    os_unfair_lock_unlock(&_pthread_list_lock);
    return 0;
  }

  return v47;
}

int sched_get_priority_min(int a1)
{
  return default_priority - 16;
}

int sched_get_priority_max(int a1)
{
  return default_priority + 16;
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return a1 == a2;
}

uint64_t _pthread_set_self(uint64_t a1)
{
  *(void *)(a1 + 216) = __thread_selfid();
  if (*(void *)(a1 + 216) == -1LL)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x4998LL);
  }

  return _thread_set_tsd_base(a1 + 224);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  int v5 = a1;
  v4[2] = a2;
  v4[0] = a1;
  v4[1] = a2;
  do
  {
    opaque = v5->__opaque;
    char v10 = v4;
    pthread_t v9 = __pthread_once_handler;
    unint64_t v8 = 0LL;
    unint64_t v2 = atomic_load((unint64_t *)v5->__opaque);
    unint64_t v7 = v2;
    unint64_t v8 = v2;
    unint64_t v6 = v2;
    if (v2 != -1LL) {
      _os_once(opaque, v10, v9);
    }
  }

  while (v5->__sig == 816954554);
  return 0;
}

uint64_t __pthread_once_handler(void *a1)
{
  unint64_t v7 = a1;
  unint64_t v6 = a1;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v8 = StatusReg;
  unint64_t v2 = StatusReg - 224;
  int v3 = &__os_once_reset;
  uint64_t v4 = *a1 + 8LL;
  uint64_t v5 = *(void *)(StatusReg - 216);
  *(void *)(v2 + 8) = &v3;
  uint64_t result = ((uint64_t (*)(void))v6[1])();
  *(void *)(v2 + 8) = v5;
  *(void *)*unint64_t v6 = 1330529093LL;
  return result;
}

int pthread_getconcurrency(void)
{
  return pthread_concurrency;
}

int pthread_setconcurrency(int a1)
{
  if (a1 < 0) {
    return 22;
  }
  pthread_concurrency = a1;
  return 0;
}

uint64_t __pthread_init(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  kern_return_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  char v46;
  uint64_t v47;
  int v48;
  int v49;
  char v50;
  unint64_t StatusReg;
  char v26 = a1;
  uint64_t v25 = a2;
  uint64_t v24 = a3;
  unint64_t v23 = a4;
  if (a1)
  {
    exitf = (uint64_t (*)(void))v26[1];
    if (*v26 >= 2uLL)
    {
      _pthread_malloc = (uint64_t (*)(void))v26[2];
      _pthread_free = (uint64_t (*)(void))v26[3];
    }
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v27 = StatusReg;
  unint64_t v22 = StatusReg - 224;
  if (StatusReg == 224)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: PTHREAD_SELF TSD not initialized";
    __break(1u);
    JUMPOUT(0x4C68LL);
  }

  _main_thread_ptr = v22;
  mach_port_name_t v29 = v22;
  mach_vm_address_t v28 = v22;
  *(void *)unint64_t v22 = v22 ^ _pthread_ptr_munge_token;
  os_unfair_lock_t v21 = 0;
  host_flavor_t flavor = 5;
  mach_msg_type_number_t host_info_outCnt = 8;
  __int128 v18 = 0u;
  __int128 host_info_out = 0u;
  host_t host = mach_host_self();
  os_unfair_lock_t v21 = host_info(host, flavor, (host_info_t)&host_info_out, &host_info_outCnt);
  if (v21)
  {
    v15[1] = v21;
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: host_info() failed";
    qword_24058 = v21;
    __break(1u);
    JUMPOUT(0x4D40LL);
  }

  default_priority = BYTE12(host_info_out);
  min_priority = BYTE8(v18);
  max_priority = BYTE12(v18);
  mach_port_deallocate(mach_task_self_, host);
  v15[0] = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v12 = 0LL;
  if (!parse_main_stack_params(v24, v15, &v14, &v13, &v12) || !v15[0] || !v14)
  {
    uint64_t v11 = 8LL;
    uint64_t v10 = 0x3B00000001LL;
    uint64_t v14 = 1032192LL;
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
  }

  parse_ptr_munge_params(v25, v24);
  mach_vm_address_t v30 = 0LL;
  v50 = 4;
  v49 = 0;
  v48 = 0;
  v47 = 2303LL;
  v36 = v22;
  mach_port_name_t v35 = "ADHT";
  uint64_t v34 = v15[0];
  char v33 = v14;
  v32 = v13;
  mach_port_name_t v31 = v12;
  v40 = v22;
  v39 = v22;
  *(void *)unint64_t v22 = v22 ^ _pthread_ptr_munge_token;
  *(void *)(v36 + 224) = v36;
  *(void *)(v36 + 232) = v36 + 172;
  if ((*((_DWORD *)v35 + 10) & 0x1000000) != 0)
  {
    v46 = 0;
    v45 = 0;
    v44 = 0;
    v43 = 0LL;
    *(void *)(v36 + 256) = 0LL;
  }

  else
  {
    *(void *)(v36 + 256) = *((void *)v35 + 4);
  }

  *(void *)(v36 + 280) = _pthread_ptr_munge_token;
  *(_BYTE *)(v36 + 49) = *(_BYTE *)(v36 + 49) & 0xFB | (4 * (*((void *)v35 + 2) != 0LL));
  v42 = v36 + 72;
  v41 = 0;
  *(_DWORD *)(v36 + 72) = 0;
  *(void *)(v36 + 176) = v34;
  *(void *)(v36 + 184) = v34 - v33;
  *(void *)(v36 + 192) = v32;
  *(void *)(v36 + 200) = v31;
  vm_size_t v4 = _pthread_attr_guardsize((uint64_t)v35);
  *(void *)(v36 + 208) = v4;
  *(_BYTE *)(v36 + 49) = *(_BYTE *)(v36 + 49) & 0xFE | (v35[40] == 1);
  *(_BYTE *)(v36 + 78) = v35[41];
  *(_BYTE *)(v36 + 48) = BYTE2(*((void *)v35 + 5));
  *(_WORD *)(v36 + 78) = *(_WORD *)(v36 + 78) & 0xFDFF | ((v35[43] & 1) << 9);
  v38 = v35;
  mach_port_name_t v37 = v36 + 56;
  if ((*((_DWORD *)v35 + 10) & 0x1000000) != 0)
  {
    *(void *)mach_port_name_t v37 = *((void *)v38 + 4);
  }

  else
  {
    *(_DWORD *)mach_port_name_t v37 = default_priority;
    *(_DWORD *)(v37 + 4) = 10;
  }

  *(_WORD *)(v36 + 166) = 3;
  *(_BYTE *)(v22 + 49) |= 1u;
  int v9 = 0;
  parse_main_thread_port(v24, &v9);
  _pthread_main_thread_init(v22, v9);
  uint64_t v8 = 0LL;
  memset(v7, 0, sizeof(v7));
  _pthread_bsdthread_init((uint64_t)v7);
  _pthread_key_global_init();
  _pthread_mutex_global_init(v25, (uint64_t)v7);
  unint64_t v6 = (_BYTE *)_simple_getenv(v25, "PTHREAD_YIELD_TO_ZERO");
  if (v6) {
    pthread_yield_to_zero = *v6 == 49;
  }
  return 0LL;
}

uint64_t parse_main_stack_params(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v19 = a1;
  __int128 v18 = a2;
  uint64_t v17 = a3;
  pthread_t v16 = a4;
  unint64_t v15 = a5;
  uint64_t v14 = (char *)_simple_getenv(a1, "main_stack");
  if (v14)
  {
    unsigned int v13 = 0;
    uint64_t v12 = v14;
    uint64_t v5 = _pthread_strtoul(v14, &v12, 16);
    uint64_t *v18 = v5;
    if (*v12 == 44)
    {
      uint64_t v6 = _pthread_strtoul(v12 + 1, &v12, 16);
      uint64_t *v17 = v6;
      if (*v12 == 44)
      {
        uint64_t v7 = _pthread_strtoul(v12 + 1, &v12, 16);
        uint64_t *v16 = v7;
        if (*v12 == 44)
        {
          uint64_t v8 = _pthread_strtoul(v12 + 1, &v12, 16);
          *unint64_t v15 = v8;
          if (*v12 == 44 || !*v12) {
            unsigned int v13 = 1;
          }
        }
      }
    }

    uint64_t v11 = v14;
    uint64_t v9 = _platform_strlen(v14);
    _platform_bzero(v11, v9);
    return v13;
  }

  else
  {
    return 0;
  }

char *parse_ptr_munge_params(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v6 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v7 = (char *)_simple_getenv(a2, "ptr_munge");
  if (v7)
  {
    uint64_t v5 = _pthread_strtoul(v7, &v6, 16);
    vm_size_t v4 = v7;
    uint64_t v2 = _platform_strlen(v7);
    _platform_bzero(v4, v2);
  }

  uint64_t result = (char *)_simple_getenv(v9, "PTHREAD_PTR_MUNGE_TOKEN");
  uint64_t v7 = result;
  if (result)
  {
    uint64_t result = (char *)_pthread_strtoul(v7, &v6, 16);
    if (result) {
      uint64_t v5 = (uint64_t)result;
    }
  }

  _pthread_ptr_munge_token = v5;
  *(void *)_main_thread_ptr = _main_thread_ptr ^ v5;
  return result;
}

char *parse_main_thread_port(uint64_t a1, _DWORD *a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v6 = 0LL;
  uint64_t result = (char *)_simple_getenv(a1, "th_port");
  uint64_t v7 = result;
  if (result)
  {
    int v3 = _pthread_strtoul(v7, &v6, 16);
    *uint64_t v8 = v3;
    uint64_t v5 = v7;
    uint64_t v4 = _platform_strlen(v7);
    return (char *)_platform_bzero(v5, v4);
  }

  return result;
}

void *_pthread_main_thread_init(uint64_t a1, int a2)
{
  uint64_t v7 = (void *)a1;
  int v6 = a2;
  __pthread_head = 0LL;
  off_28008 = &__pthread_head;
  uint64_t v11 = &_pthread_list_lock;
  int v10 = 0;
  _pthread_list_lock._os_unfair_lock_opaque = 0;
  uint64_t v9 = a1 + 72;
  int v8 = 0;
  *(_DWORD *)(a1 + 72) = 0;
  v7[1] = 0LL;
  v7[4] = 0LL;
  *((_DWORD *)v7 + 13) = 0;
  if (v6) {
    *((_DWORD *)v7 + 62) = v6;
  }
  else {
    *((_DWORD *)v7 + 62) = mach_thread_self();
  }
  mach_port_name_t name = 0;
  *(_OWORD *)&v4.flags = xmmword_1F0F8;
  v4.reserved[1] = 0LL;
  mach_port_construct(mach_task_self_, &v4, 0LL, &name);
  *((_DWORD *)v7 + 60) = name;
  *((_DWORD *)v7 + 72) = 0;
  *((_DWORD *)v7 + 74) = 0;
  uint64_t v2 = __pthread_head;
  v7[2] = __pthread_head;
  if (v2) {
    *(void *)((char *)&dword_18 + (void)__pthread_head) = v7 + 2;
  }
  else {
    off_28008 = (int **)(v7 + 2);
  }
  __pthread_head = (int *)v7;
  _OWORD v7[3] = &__pthread_head;
  _pthread_count = 1;
  return _pthread_introspection_thread_start(v7);
}

uint64_t _pthread_bsdthread_init(uint64_t a1)
{
  *(void *)a1 = 56LL;
  *(void *)(a1 + 8) = 160LL;
  *(_DWORD *)(a1 + 28) = 40;
  *(_DWORD *)(a1 + 24) = 224;
  *(_DWORD *)(a1 + 32) = 24;
  *(_DWORD *)(a1 + 48) = 392;
  *(_DWORD *)(a1 + 52) = 960;
  uint64_t result = __bsdthread_register( thread_start,  start_wqthread,  ((_DWORD)vm_page_mask + 6368) & ~(_DWORD)vm_page_mask);
  if ((int)result >= 1)
  {
    if ((~(_DWORD)result & 0x4000001E) != 0)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Missing required kernel support";
      qword_24058 = (int)result;
      __break(1u);
      JUMPOUT(0x5888LL);
    }

    __pthread_supported_features = result;
  }

  uint64_t v6 = *(void *)(a1 + 16);
  BOOL v5 = 0;
  if ((v6 & 0x22000000) == 0) {
    BOOL v5 = (v6 & 0x3F00) != 0;
  }
  if (v5)
  {
    unsigned int v2 = (unint64_t)(v6 & 0x3F00) >> 8;
    char v3 = __clz(__rbit32(v2));
    if (v2) {
      char v4 = v3 + 1;
    }
    else {
      char v4 = 0;
    }
    char v8 = v4;
  }

  else
  {
    char v8 = 0;
  }

  if (v8)
  {
    uint64_t result = _pthread_set_main_qos(v6);
    *(void *)(_main_thread_ptr + 256) = v6;
  }

  if (*(void *)(a1 + 36)) {
    __pthread_stack_hint = *(void *)(a1 + 36);
  }
  if (__libdispatch_workerfunction) {
    return __workq_open();
  }
  return result;
}

  ;
}

void *_pthread_introspection_thread_start(void *result)
{
  return result;
}

uint64_t _pthread_main_thread_postfork_init(uint64_t a1)
{
  uint64_t v1 = _pthread_main_thread_init(a1, 0);
  uint64_t result = __thread_selfid(v1);
  *(void *)(a1 + 216) = result;
  if (*(void *)(a1 + 216) == -1LL)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x5AA4LL);
  }

  return result;
}

void sched_yield(void)
{
  if ((pthread_yield_to_zero & 1) != 0) {
    swtch_pri(0);
  }
  else {
    thread_switch(0, 0, 0);
  }
}

uint64_t _pthread_yield_to_enqueuer_4dispatch(uint64_t a1, uint64_t a2, mach_msg_timeout_t a3)
{
  thread_mach_port_name_t name = 0;
  os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
  for (i = __pthread_head; i; i = (int *)*((void *)i + 2))
  {
    if (a2)
    {
      if (*(void *)&i[2 * a1 + 56] == a2)
      {
        thread_mach_port_name_t name = i[62];
        break;
      }
    }

    else if (*(void *)&i[2 * a1 + 56])
    {
      thread_mach_port_name_t name = i[62];
      break;
    }
  }

  os_unfair_lock_unlock(&_pthread_list_lock);
  thread_switch(thread_name, 4, a3);
  return 0LL;
}

uint64_t pthread_current_stack_contains_np(unint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 40);
  unint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 48);
  if (v6 == v5)
  {
    return -45;
  }

  else if (__CFADD__(a1, a2))
  {
    return -22;
  }

  else
  {
    BOOL v4 = 0;
    if (v6 <= a1) {
      return a1 + a2 <= v5;
    }
    return v4;
  }

void _pthread_clear_qos_tsd(int a1)
{
  if (a1 && *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    for (i = __pthread_head; i; i = (int *)*((void *)i + 2))
    {
      if (a1 == i[62])
      {
        *((void *)i + 32) = 0LL;
        break;
      }
    }

    os_unfair_lock_unlock(&_pthread_list_lock);
  }

  else
  {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 0LL;
  }

uint64_t pthread_stack_frame_decode_np(void *a1, void *a2)
{
  if (a2) {
    *a2 = a1[1];
  }
  return *a1 & 0xFFFFFFFFFFFFFFLL;
}

uint64_t _pthread_wqthread(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  if ((a5 & 0x20000) == 0) {
    _pthread_wqthread_setup(a1, a2, a3, a5);
  }
  if ((a5 & 0x800000) != 0)
  {
    *(_BYTE *)(a1 + 164) = 1;
    uint64_t v9 = 67111167LL;
  }

  else
  {
    *(_BYTE *)(a1 + 164) = 0;
    uint64_t v14 = 0LL;
    if ((a5 & 0x80000) != 0) {
      uint64_t v14 = 0x1000000LL;
    }
    if ((a5 & 0x100000) != 0)
    {
      uint64_t v16 = v14 | 0x2000000;
    }

    else
    {
      if ((a5 & 0x10000) != 0) {
        v14 |= 0x80000000uLL;
      }
      if ((a5 & 0x4000) != 0)
      {
        unsigned int v17 = BYTE3(v14) << 24;
        uint64_t v15 = v17;
      }

      else
      {
        if ((a5 & 0x8000) == 0)
        {
          qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Missing priority";
          qword_24058 = a5;
          __break(1u);
          JUMPOUT(0x6208LL);
        }

        uint64_t v15 = v14 | 0xFFFF | a5 & 0xFFF;
      }

      uint64_t v16 = v15;
    }

    uint64_t v9 = v16;
  }

  *(void *)(a1 + 256) = v9;
  uint64_t v8 = v9;
  if ((a5 & 0x1000000) != 0) {
    uint64_t v8 = v9 | 0x8000000;
  }
  if (a6 == -1) {
    _pthread_wqthread_exit(a1);
  }
  if ((a5 & 0x400000) != 0)
  {
    *(void (**)())(a1 + 144) = __libdispatch_workloopfunction[0];
    *(void *)(a1 + 152) = a4;
    *(_DWORD *)(a1 + 160) = a6;
    __libdispatch_workloopfunction[0]();
  }

  if ((a5 & 0x80000) != 0)
  {
    *(void *)(a1 + 144) = __libdispatch_keventfunction;
    *(void *)(a1 + 152) = a4;
    *(_DWORD *)(a1 + 160) = a6;
    __libdispatch_keventfunction();
  }

  *(void *)(a1 + 144) = __libdispatch_workerfunction;
  *(void *)(a1 + 152) = v8;
  *(_DWORD *)(a1 + 160) = 0;
  if ((__workq_newapi & 1) != 0) {
    __libdispatch_workerfunction(v8);
  }
  else {
    _pthread_wqthread_legacy_worker_wrap(v8);
  }
  uint64_t result = __workq_kernreturn(4LL, 0LL, 0LL, 0LL);
  uint64_t v7 = *(int *)(a1 + 172);
  qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __workq_kernreturn returned";
  qword_24058 = v7;
  return result;
}

void *_pthread_wqthread_setup(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  vm_size_t v11 = a3 - vm_page_size;
  vm_size_t v10 = ((vm_page_size + a1 - 1) & -(uint64_t)vm_page_size)
      + ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask)
      - (a3
       - vm_page_size);
  *(void *)a1 = a1 ^ _pthread_ptr_munge_token;
  *(void *)(a1 + 224) = a1;
  *(void *)(a1 + 232) = a1 + 172;
  *(void *)(a1 + 256) = 2303LL;
  *(void *)(a1 + 280) = _pthread_ptr_munge_token;
  *(_BYTE *)(a1 + 49) &= ~4u;
  *(_DWORD *)(a1 + 72) = 0;
  *(void *)(a1 + 176) = a1;
  *(void *)(a1 + 184) = a3;
  *(void *)(a1 + 192) = v11;
  *(void *)(a1 + 200) = v10;
  *(void *)(a1 + 208) = _pthread_attr_guardsize((uint64_t)"ADHT");
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a1 + 49) & 0xFE | (unk_1F138 == 1);
  *(_BYTE *)(a1 + 78) = unk_1F139;
  *(_BYTE *)(a1 + 48) = 1;
  *(_WORD *)(a1 + 78) = *(_WORD *)(a1 + 78) & 0xFDFF | ((unk_1F13B & 1) << 9);
  *(_DWORD *)(a1 + 56) = default_priority;
  *(_DWORD *)(a1 + 60) = 10;
  *(_WORD *)(a1 + 166) = 3;
  *(_DWORD *)(a1 + 248) = a2;
  *(_WORD *)(a1 + 78) |= 0x400u;
  *(_WORD *)(a1 + 78) &= ~0x800u;
  *(_BYTE *)(a1 + 49) &= ~1u;
  if ((a4 & 0x200000) == 0)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_24058 = a4;
    __break(1u);
    JUMPOUT(0x67A8LL);
  }

  *(void *)(a1 + 216) = __thread_selfid();
  if (*(void *)(a1 + 216) == -1LL)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x6814LL);
  }

  os_unfair_lock_lock_no_tsd(&_pthread_list_lock, 327680LL, a2);
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = off_28008;
  *off_28008 = (int *)a1;
  off_28008 = (int **)(a1 + 16);
  ++_pthread_count;
  os_unfair_lock_unlock_no_tsd(&_pthread_list_lock, a2);
  _pthread_introspection_thread_create(a1);
  unsigned int v9 = *(_DWORD *)(a1 + 248);
  BOOL v5 = 0;
  if (v9) {
    BOOL v5 = v9 != -1;
  }
  if (!v5)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_24058 = v9;
    __break(1u);
    JUMPOUT(0x6954LL);
  }

  return _pthread_introspection_thread_start((void *)a1);
}

void _pthread_wqthread_exit(unint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 256);
  BOOL v4 = 0;
  if ((v5 & 0x22000000) == 0) {
    BOOL v4 = (v5 & 0x3F00) != 0;
  }
  if (v4)
  {
    unsigned int v1 = (unint64_t)(v5 & 0x3F00) >> 8;
    char v2 = __clz(__rbit32(v1));
    if (v1) {
      unsigned __int8 v3 = v2 + 1;
    }
    else {
      unsigned __int8 v3 = 0;
    }
    unsigned __int8 v6 = v3;
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  if (!v6 || v6 > 4u) {
    *(void *)(a1 + 256) = 2303LL;
  }
  _pthread_exit(a1, 0LL);
}

uint64_t _pthread_wqthread_legacy_worker_wrap(uint64_t a1)
{
  unsigned __int8 v6 = (uint64_t (*)(uint64_t, BOOL))__libdispatch_workerfunction;
  BOOL v5 = 0;
  if ((a1 & 0x22000000) == 0) {
    BOOL v5 = (a1 & 0x3F00) != 0;
  }
  if (v5)
  {
    unsigned int v1 = (unint64_t)(a1 & 0x3F00) >> 8;
    char v2 = __clz(__rbit32(v1));
    if (v1) {
      char v3 = v2 + 1;
    }
    else {
      char v3 = 0;
    }
    char v7 = v3;
  }

  else
  {
    char v7 = 0;
  }

  switch(v7)
  {
    case 2:
      uint64_t result = ((uint64_t (*)(uint64_t, BOOL, void))__libdispatch_workerfunction)(3LL, (int)a1 < 0, 0LL);
      break;
    case 3:
      uint64_t result = ((uint64_t (*)(uint64_t, BOOL, void))__libdispatch_workerfunction)(2LL, (int)a1 < 0, 0LL);
      break;
    case 4:
      *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 4351LL;
      uint64_t result = v6(1LL, (int)a1 < 0);
      break;
    case 5:
      uint64_t result = ((uint64_t (*)(void, BOOL, void))__libdispatch_workerfunction)(0LL, (int)a1 < 0, 0LL);
      break;
    default:
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Invalid pthread priority for the legacy interface";
      qword_24058 = a1;
      __break(1u);
      JUMPOUT(0x6D84LL);
  }

  return result;
}

uint64_t pthread_workqueue_setdispatchoffset_np(unsigned int a1)
{
  return __workq_kernreturn(16LL, 0LL, a1, 0LL);
}

uint64_t pthread_workqueue_setup(uint64_t a1, unint64_t a2)
{
  uint64_t v10 = a1;
  unint64_t v9 = a2;
  unsigned int v8 = 16;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  if (a2 >= 4)
  {
    int v3 = *(_DWORD *)(v10 + 4);
    if (v3 == 1)
    {
      unint64_t v4 = 40LL;
    }

    else
    {
      if (v3 != 2) {
        return 22;
      }
      unint64_t v4 = 48LL;
    }

    if (v10 && v9 >= v4)
    {
      if (!*(_DWORD *)v10 && *(_DWORD *)(v10 + 4))
      {
        if (__libdispatch_workerfunction)
        {
          return v8;
        }

        else
        {
          __workq_newapi = 1;
          uint64_t v5 = 2LL;
          uint64_t v6 = *(void *)(v10 + 32);
          uint64_t v7 = *(void *)(v10 + 40);
          unsigned int v8 = __workq_kernreturn(1024LL, &v5, 24LL, 0LL);
          if (v8 == -1)
          {
            uint64_t v12 = 1LL;
            uint64_t v13 = 1LL;
            unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            return **(_DWORD **)(StatusReg + 8);
          }

          else
          {
            __libdispatch_keventfunction = *(void (**)())(v10 + 8);
            __libdispatch_workloopfunction[0] = *(void (**)())(v10 + 16);
            __libdispatch_workerfunction = *(_UNKNOWN **)(v10 + 24);
            __workq_open();
            if (!__is_threaded) {
              __is_threaded = 1;
            }
            return 0;
          }
        }
      }

      else
      {
        return 45;
      }
    }

    else
    {
      return 22;
    }
  }

  else
  {
    return 22;
  }

uint64_t _pthread_workqueue_init_with_workloop(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  uint64_t v14 = a3;
  int v13 = a4;
  int v12 = a5;
  __b[0] = 0;
  __b[1] = 2;
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = a1;
  uint64_t v10 = a4;
  uint64_t v11 = 0LL;
  return pthread_workqueue_setup((uint64_t)__b, 0x30uLL);
}

uint64_t _pthread_workqueue_init_with_kevent(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return _pthread_workqueue_init_with_workloop(a1, a2, 0LL, a3, a4);
}

uint64_t _pthread_workqueue_init(uint64_t a1, int a2, int a3)
{
  return _pthread_workqueue_init_with_kevent(a1, 0LL, a2, a3);
}

uint64_t pthread_workqueue_setdispatch_np(uint64_t a1)
{
  uint64_t v3 = a1;
  memset(__b, 0, sizeof(__b));
  HIDWORD(__b[0]) = 2;
  __b[3] = v3;
  return pthread_workqueue_setup((uint64_t)__b, 0x30uLL);
}

uint64_t _pthread_workqueue_supported()
{
  if (!__pthread_supported_features)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: libpthread has not been initialized";
    __break(1u);
    JUMPOUT(0x7204LL);
  }

  return __pthread_supported_features;
}

uint64_t pthread_workqueue_addthreads_np(__int16 a1, char a2, unsigned int a3)
{
  if (__libdispatch_workerfunction)
  {
    int v4 = 0;
    if ((a2 & 1) != 0) {
      int v4 = 0x80000000;
    }
    uint64_t v5 = _pthread_qos_class_encode_workqueue(a1 & 0xFFF, v4);
    unsigned int v6 = __workq_kernreturn(32LL, 0LL, a3, v5);
    if (v6 == -1) {
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    return v6;
  }

  else
  {
    return 1;
  }

BOOL _pthread_workqueue_should_narrow(uint64_t a1)
{
  int v2 = __workq_kernreturn(512LL, 0LL, a1, 0LL);
  return v2 != -1 && v2 != 0;
}

uint64_t _pthread_workqueue_addthreads(unsigned int a1, uint64_t a2)
{
  if (__libdispatch_workerfunction)
  {
    unsigned int v3 = __workq_kernreturn(32LL, 0LL, a1, a2);
    if (v3 == -1) {
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    return v3;
  }

  else
  {
    return 1;
  }

uint64_t _pthread_workqueue_add_cooperativethreads(unsigned int a1, uint64_t a2)
{
  if (__libdispatch_workerfunction)
  {
    unsigned int v3 = __workq_kernreturn(48LL, 0LL, a1, a2);
    if (v3 == -1) {
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    return v3;
  }

  else
  {
    return 1;
  }

uint64_t _pthread_workqueue_set_event_manager_priority(uint64_t a1)
{
  unsigned int v2 = __workq_kernreturn(128LL, 0LL, a1, 0LL);
  if (v2 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v2;
}

uint64_t _pthread_workqueue_allow_send_signals(char a1)
{
  return __bsdthread_ctl(0x4000LL, (1 << (a1 - 1)), 0LL);
}

uint64_t _pthread_workloop_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = a3;
  int __b = 36;
  int v6 = 0;
  uint64_t v7 = a1;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  int v12 = 0;
  if (a3 && (v14 & 0xFFFFFFFFFFFFFFFELL) == 0)
  {
    if (((*(void *)(v13 + 40) >> 24) & 1) != 0)
    {
      v6 |= 1u;
      int v8 = *(_DWORD *)(v13 + 32);
    }

    if (((*(void *)(v13 + 40) >> 26) & 1) != 0)
    {
      v6 |= 2u;
      int v9 = BYTE2(*(void *)(v13 + 40));
    }

    if (((*(void *)(v13 + 40) >> 27) & 1) != 0)
    {
      v6 |= 4u;
      int v10 = BYTE4(*(void *)(v13 + 40));
      int v11 = *(void *)(v13 + 40) >> 40;
    }

    if (*(_DWORD *)(v13 + 48) && *(_DWORD *)(v13 + 48) != -1)
    {
      v6 |= 8u;
      int v12 = *(_DWORD *)(v13 + 48);
    }

    if ((v14 & 1) != 0) {
      v6 |= 0x10u;
    }
    unsigned int v4 = __kqueue_workloop_ctl(1LL, 0LL, &__b, 36LL);
    if (v4 == -1)
    {
      uint64_t v17 = 1LL;
      uint64_t v18 = 1LL;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      return **(_DWORD **)(StatusReg + 8);
    }

    return v4;
  }

  else
  {
    return 22;
  }

uint64_t _pthread_workloop_destroy(uint64_t a1)
{
  uint64_t v10 = a1;
  __b[0] = 36;
  __b[1] = 0;
  uint64_t v4 = a1;
  int v5 = 0;
  int v6 = 0;
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  unsigned int v2 = __kqueue_workloop_ctl(2LL, 0LL, __b, 36LL);
  if (v2 == -1)
  {
    uint64_t v11 = 1LL;
    uint64_t v12 = 1LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    return **(unsigned int **)(StatusReg + 8);
  }

  return v2;
}

pthread_introspection_hook_t pthread_introspection_hook_install(pthread_introspection_hook_t hook)
{
  return (pthread_introspection_hook_t)_pthread_atomic_xchg_ptr( (unint64_t *)&_pthread_introspection_hook,  (unint64_t)hook);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)_platform_memset(__b, __c, __len);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)_platform_memmove(__dst, __src, __n);
}

mach_vm_address_t _pthread_allocate(uint64_t a1, mach_vm_address_t *a2, char a3)
{
  kern_return_t v5;
  mach_vm_address_t v6;
  vm_size_t v7;
  BOOL v9;
  mach_vm_address_t v10;
  kern_return_t v11;
  vm_size_t v12;
  uint64_t v13;
  vm_size_t v14;
  vm_size_t size;
  mach_vm_address_t address;
  char v17;
  mach_vm_address_t *v18;
  uint64_t v19;
  vm_size_t v21;
  mach_vm_address_t v22;
  uint64_t v23;
  mach_vm_address_t v24;
  uint64_t v25;
  mach_vm_address_t v26;
  mach_vm_address_t v27;
  uint64_t v28;
  mach_vm_address_t v29;
  mach_vm_address_t v30;
  int v31;
  mach_vm_address_t v32;
  uint64_t v33;
  int v34;
  int v35;
  char v36;
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  address = __pthread_stack_hint;
  int v9 = 0;
  if (*(void *)(a1 + 24)) {
    int v9 = *(void *)(v19 + 24) < 0x4000uLL;
  }
  if (v9)
  {
    uint64_t v3 = *(void *)(v19 + 24);
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Stack size in attrs is too small";
    qword_24058 = v3;
    __break(1u);
    JUMPOUT(0x7A9CLL);
  }

  if ((*(void *)(v19 + 16) & vm_page_mask) != 0)
  {
    uint64_t v4 = *(void *)(v19 + 16);
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unaligned stack addr in attrs";
    qword_24058 = v4;
    __break(1u);
    JUMPOUT(0x7AFCLL);
  }

  if (*(void *)(v19 + 16))
  {
    size = (vm_page_mask + 6368) & ~(_DWORD)vm_page_mask;
    uint64_t v14 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)(v19 + 24);
    int v5 = mach_vm_map(mach_task_self_, &address, size, vm_page_size - 1, 503316481, 0, 0LL, 0, 3, 7, 1u);
  }

  else
  {
    uint64_t v14 = _pthread_attr_guardsize(v19);
    uint64_t v13 = _pthread_attr_stacksize(v19) + 12288;
    uint64_t v12 = v13 + v14;
    size = (v13 + v14 + ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask) + vm_page_mask) & ~(_DWORD)vm_page_mask;
    int v5 = mach_vm_map(mach_task_self_, &address, size, vm_page_size - 1, 503316481, 0, 0LL, 0, 3, 7, 1u);
  }

  uint64_t v11 = v5;
  if (v5)
  {
    uint64_t v11 = mach_vm_allocate(mach_task_self_, &address, size, 503316481);
  }

  else if (__syscall_logger && (v17 & 1) == 0)
  {
    __syscall_logger(503316624LL, mach_task_self_, size, 0LL, address);
  }

  if (v11)
  {
    uint64_t *v18 = 0LL;
    return 0LL;
  }

  else
  {
    if (__syscall_logger && (v17 & 1) == 0) {
      __syscall_logger(503316496LL, mach_task_self_, size, 0LL, address);
    }
    if (v14) {
      mach_vm_protect(mach_task_self_, address, v14, 0, 0);
    }
    uint64_t v10 = address + v12;
    if (*(void *)(v19 + 16)) {
      uint64_t *v18 = *(void *)(v19 + 16);
    }
    else {
      uint64_t *v18 = v10;
    }
    int v6 = *v18;
    char v26 = v10;
    uint64_t v25 = v19;
    uint64_t v24 = v6;
    unint64_t v23 = v13;
    unint64_t v22 = address;
    os_unfair_lock_t v21 = size;
    mach_vm_address_t v30 = v10;
    mach_port_name_t v29 = v10;
    *(void *)uint64_t v10 = v10 ^ _pthread_ptr_munge_token;
    *(void *)(v26 + 224) = v26;
    *(void *)(v26 + 232) = v26 + 172;
    if ((*(_DWORD *)(v25 + 40) & 0x1000000) != 0)
    {
      v36 = 0;
      mach_port_name_t v35 = 0;
      uint64_t v34 = 0;
      char v33 = 0LL;
      *(void *)(v26 + 256) = 0LL;
    }

    else
    {
      *(void *)(v26 + 256) = *(void *)(v25 + 32);
    }

    *(void *)(v26 + 280) = _pthread_ptr_munge_token;
    *(_BYTE *)(v26 + 49) = *(_BYTE *)(v26 + 49) & 0xFB | (4 * (*(void *)(v25 + 16) != 0LL));
    v32 = v26 + 72;
    mach_port_name_t v31 = 0;
    *(_DWORD *)(v26 + 72) = 0;
    *(void *)(v26 + 176) = v24;
    *(void *)(v26 + 184) = v24 - v23;
    *(void *)(v26 + 192) = v22;
    *(void *)(v26 + 200) = v21;
    int v7 = _pthread_attr_guardsize(v25);
    *(void *)(v26 + 208) = v7;
    *(_BYTE *)(v26 + 49) = *(_BYTE *)(v26 + 49) & 0xFE | (*(_BYTE *)(v25 + 40) == 1);
    *(_BYTE *)(v26 + 78) = *(_BYTE *)(v25 + 41);
    *(_BYTE *)(v26 + 48) = BYTE2(*(void *)(v25 + 40));
    *(_WORD *)(v26 + 78) = *(_WORD *)(v26 + 78) & 0xFDFF | ((*(_BYTE *)(v25 + 43) & 1) << 9);
    mach_vm_address_t v28 = v25;
    uint64_t v27 = v26 + 56;
    if ((*(_DWORD *)(v25 + 40) & 0x1000000) != 0)
    {
      *(void *)uint64_t v27 = *(void *)(v28 + 32);
    }

    else
    {
      *(_DWORD *)uint64_t v27 = default_priority;
      *(_DWORD *)(v27 + 4) = 10;
    }

    *(_WORD *)(v26 + 166) = 3;
    return v10;
  }

uint64_t _pthread_introspection_thread_create(uint64_t result)
{
  return result;
}

uint64_t _pthread_introspection_hook_callout_thread_create(uint64_t a1)
{
  return _pthread_introspection_call_hook(1u, a1, a1, (vm_page_mask + 6368) & ~(_DWORD)vm_page_mask);
}

uint64_t _pthread_introspection_call_hook(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v6 = StatusReg - 224;
  __int16 v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(v6 + 50) = a1;
  uint64_t result = _pthread_introspection_hook(a1, a2, a3, a4);
  *(_WORD *)(v6 + 50) = v5;
  return result;
}

uint64_t _pthread_terminate_invoke(unint64_t a1, uint64_t a2)
{
  unint64_t v9 = a1;
  uint64_t v8 = a2;
  int v7 = 0LL;
  if (((unint64_t)&vars0 & ~(vm_page_size - 1)) == (a1 & ~(vm_page_size - 1)))
  {
    unint64_t v6 = v5;
    bzero(v5, 0x3000uLL);
    int v7 = v6;
  }

  unint64_t v2 = _pthread_terminate(v9, v8);
  return _pthread_terminate(v2, v3);
}

uint64_t _pthread_terminate(unint64_t a1, uint64_t a2)
{
  size_t v11 = *(void *)(a1 + 192);
  uint64_t v10 = *(void *)(a1 + 200);
  if (a1 <= v11 || a1 >= *(void *)(a1 + 192) + *(void *)(a1 + 200))
  {
    if (a1 == _main_thread_ptr)
    {
      uint64_t v3 = *(void *)(a1 + 176);
      size_t v11 = v3 - pthread_get_stacksize_np((pthread_t)a1);
      uint64_t v8 = ((unint64_t)_pthread_current_stack_address() & -(uint64_t)vm_page_size) - v11;
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = (a1 - v11) & -(uint64_t)vm_page_size;
    *(void *)(a1 + 192) += v8;
    *(void *)(a1 + 200) -= v8;
  }

  unsigned int v7 = *(_DWORD *)(a1 + 248);
  char v6 = 0;
  char v5 = 0;
  unsigned int v4 = 0;
  _pthread_dealloc_special_reply_port(a1);
  _pthread_dealloc_reply_port(a1);
  os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
  *(_DWORD *)(a1 + 52) = -1;
  *(void *)(a1 + 40) = a2;
  BOOL v9 = --_pthread_count < 1;
  if (*(void *)(a1 + 32))
  {
    unsigned int v4 = _pthread_joiner_prepost_wake(a1);
    char v5 = 1;
  }

  if ((*(_BYTE *)(a1 + 49) & 1) != 0)
  {
    char v6 = 1;
    *(_BYTE *)(a1 + 49) |= 2u;
  }

  else
  {
    if (*(void *)(a1 + 16)) {
      *(void *)(*(void *)(a1 + 16) + 24LL) = *(void *)(a1 + 24);
    }
    else {
      off_28008 = *(int ***)(a1 + 24);
    }
    **(void **)(a1 + 24) = *(void *)(a1 + 16);
  }

  os_unfair_lock_unlock(&_pthread_list_lock);
  if ((v5 & 1) != 0)
  {
    _pthread_joiner_wake(a1);
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    if (*(void *)(a1 + 32))
    {
      *(_BYTE *)(a1 + 49) |= 2u;
      char v6 = 1;
    }

    os_unfair_lock_unlock(&_pthread_list_lock);
  }

  if ((v6 & 1) != 0 || a1 == _main_thread_ptr) {
    uint64_t v10 = v8;
  }
  else {
    _pthread_introspection_thread_destroy(a1);
  }
  if (!v10) {
    size_t v11 = 0LL;
  }
  if (v9) {
    exitf(0LL);
  }
  uint64_t result = __bsdthread_terminate(v11, v10, v7, v4);
  qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: thread didn't terminate";
  qword_24058 = a1;
  __break(1u);
  return result;
}

void *_pthread_introspection_thread_terminate(void *result)
{
  return result;
}

int *_pthread_current_stack_address()
{
  uint64_t result = &v1;
  int v1 = 0;
  return result;
}

uint64_t _pthread_dealloc_special_reply_port(uint64_t result)
{
  unsigned int v1 = *(_DWORD *)(result + 288);
  if (v1)
  {
    *(_DWORD *)(result + 288) = 0;
    return thread_destruct_special_reply_port(v1, 0LL);
  }

  return result;
}

void _pthread_dealloc_reply_port(uint64_t a1)
{
  mach_port_t reply_port = *(_DWORD *)(a1 + 240);
  if (reply_port) {
    mig_dealloc_reply_port(reply_port);
  }
}

uint64_t _pthread_introspection_hook_callout_thread_terminate(void *a1)
{
  if (a1 == (void *)_main_thread_ptr) {
    return _pthread_introspection_call_hook(3u, (uint64_t)a1, a1[23] - a1[26], a1[22] - a1[23] + a1[26]);
  }
  else {
    return _pthread_introspection_call_hook( 3u,  (uint64_t)a1,  a1[24],  a1[25] - ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask));
  }
}

uint64_t _pthread_strtoul(char *a1, void *a2, int a3)
{
  i = a1;
  uint64_t v5 = 0LL;
  if ((a3 == 16 || !a3) && a1 && *a1 == 48 && a1[1] == 120)
  {
    for (i = a1 + 2; ; ++i)
    {
      char v4 = *i;
      if (*i < 48 || v4 > 57)
      {
        if (v4 < 97 || v4 > 102)
        {
          if (v4 < 65 || v4 > 70) {
            break;
          }
          uint64_t v5 = 16 * v5 + v4 - 55;
        }

        else
        {
          uint64_t v5 = 16 * v5 + v4 - 87;
        }
      }

      else
      {
        uint64_t v5 = 16 * v5 + v4 - 48;
      }
    }
  }

  *a2 = i;
  return v5;
}

uint64_t _pthread_introspection_hook_callout_thread_start(void *a1)
{
  if (a1 == (void *)_main_thread_ptr) {
    return _pthread_introspection_call_hook(2u, (uint64_t)a1, a1[23] - a1[26], a1[22] - a1[23] + a1[26]);
  }
  else {
    return _pthread_introspection_call_hook( 2u,  (uint64_t)a1,  a1[24],  a1[25] - ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask));
  }
}

uint64_t _pthread_introspection_hook_callout_thread_destroy(uint64_t a1)
{
  return _pthread_introspection_call_hook(4u, a1, a1, (vm_page_mask + 6368) & ~(_DWORD)vm_page_mask);
}

BOOL _pthread_setcancelstate_exit(uint64_t a1)
{
  uint64_t v3 = (unsigned __int16 *)(a1 + 166);
  do
  {
    if (_os_atomic_mo_has_acquire(0)) {
      unsigned __int16 v1 = __ldaxr(v3);
    }
    else {
      unsigned __int16 v1 = __ldxr(v3);
    }
    unsigned __int16 v5 = v1 & 0xFFDC | 0x22;
    BOOL result = _os_atomic_mo_has_release(0);
    if (result) {
      BOOL v4 = __stlxr(v5, v3) == 0;
    }
    else {
      BOOL v4 = __stxr(v5, v3) == 0;
    }
  }

  while (!v4);
  return result;
}

int pthread_cancel(pthread_t a1)
{
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    if ((pthread_t)(a1->__sig ^ _pthread_ptr_munge_token) != a1) {
      abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    char v15 = 1;
  }

  else
  {
    if (a1)
    {
      unsigned int v1 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
        unsigned int v2 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
      while (!v2 && __stlxr(v1, &_pthread_list_lock._os_unfair_lock_opaque));
      if (v2) {
        os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
      }
      for (i = __pthread_head; i; i = (int *)*((void *)i + 2))
      {
        if (i == (int *)a1)
        {
          char v18 = 1;
          goto LABEL_25;
        }
      }

      int v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
        unsigned int v4 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
      while (v4 == v3 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
      if (v4 != v3) {
        os_unfair_lock_unlock(&_pthread_list_lock);
      }
      char v18 = 0;
    }

    else
    {
      char v18 = 0;
    }

LABEL_25:
    if ((v18 & 1) != 0)
    {
      char v15 = 1;
      int v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
        unsigned int v6 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
      while (v6 == v5 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
      if (v6 != v5) {
        os_unfair_lock_unlock(&_pthread_list_lock);
      }
    }

    else
    {
      char v15 = 0;
    }
  }

  if ((v15 & 1) == 0) {
    return 3;
  }
  if (((*(_WORD *)&a1->__opaque[62] >> 10) & 1) != 0) {
    return 45;
  }
  uint64_t v10 = (unsigned __int16 *)&a1->__opaque[150];
  unsigned __int16 v11 = *(_WORD *)&a1->__opaque[150];
  do
  {
    unsigned __int16 v7 = v11;
    do
      int v8 = __ldaxr(v10);
    while (v8 == v11 && __stlxr(v11 | 0x10, v10));
    unsigned __int16 v11 = v8;
  }

  while (v7 != (unsigned __int16)v8);
  if ((v8 & 1) != 0)
  {
    unsigned int v12 = *(_DWORD *)&a1->__opaque[232];
    if (v12) {
      __pthread_markcancel(v12);
    }
  }

  return 0;
}

  if ((v30 & 1) != 0)
  {
    uint64_t v19 = v12;
    char v18 = 0LL;
    char v18 = *v12 ^ _pthread_ptr_munge_token;
    if ((void *)v18 != v12) {
      a1 = abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    if ((*(_BYTE *)(v15 + 49) & 1) != 0 && !*(void *)(v15 + 32))
    {
      if ((void *)v15 == v12 || v12[4] && *(void *)v12[4] == v15)
      {
        BOOL v9 = 11;
      }

      else if (*(_DWORD *)(v15 + 52) == -1)
      {
        if (*(void *)(v15 + 16)) {
          *(void *)(*(void *)(v15 + 16) + 24LL) = *(void *)(v15 + 24);
        }
        else {
          off_28008 = *(int ***)(v15 + 24);
        }
        **(void **)(v15 + 24) = *(void *)(v15 + 16);
        if ((*(_BYTE *)(v15 + 49) & 2) == 0)
        {
          qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_joiner_cleans_up";
          __break(1u);
          JUMPOUT(0x9F98LL);
        }

        *(_BYTE *)(v15 + 49) &= ~1u;
        if (v14)
        {
          uint64_t v20 = v15;
          uint64_t v27 = v15;
          char v26 = 17;
          int v5 = atomic_load((unsigned __int16 *)(v15 + 166));
          unint64_t v23 = v5;
          uint64_t v24 = v5;
          unint64_t v22 = v5;
          uint64_t v25 = v5;
          if ((v26 & ~v5) != 0) {
            os_unfair_lock_t v21 = *(void *)(v20 + 40);
          }
          else {
            os_unfair_lock_t v21 = 1LL;
          }
          *uint64_t v14 = v21;
        }
      }

      else
      {
        LODWORD(v11) = *(_DWORD *)(v15 + 248);
        *(_DWORD *)(v15 + 52) = v11;
        *(void *)(v15 + 32) = v10;
        if ((*(_BYTE *)(v15 + 49) & 4) != 0)
        {
          char v33 = 0LL;
          v42 = 9LL;
          v43 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          char v33 = *(void *)(v43 + 72);
          if (v33)
          {
            v59 = 9LL;
            v58 = 0LL;
            v60 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            *(void *)(v60 + 72) = 0LL;
            uint64_t v34 = v33;
          }

          else
          {
            uint64_t v34 = _os_semaphore_create(a1);
          }

          DWORD1(v11) = v34;
        }
      }
    }

    else
    {
      BOOL v9 = 22;
    }

    v36 = &_pthread_list_lock;
    v66 = &_pthread_list_lock;
    v65 = 0;
    v67 = 3LL;
    v68 = 3LL;
    v69 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v65 = *(void *)(v69 + 24);
    v64 = 0;
    v63 = v65;
    v62 = 0;
    unsigned int v6 = v65;
    do
      unsigned __int16 v7 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
    while (v7 == v6 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
    if (v7 != v6) {
      v63 = v7;
    }
    v61 = v7 == v6;
    if (v7 != v6) {
      os_unfair_lock_unlock(v66);
    }
    if (!v9)
    {
      if ((_DWORD)v11) {
        BOOL v9 = _pthread_joiner_wait(v15, v10, v13);
      }
      else {
        _pthread_deallocate(v15, 0);
      }
    }

    if (!v9 && DWORD1(v11) && (BYTE8(v11) & 1) == 0)
    {
    }

    if (DWORD1(v11))
    {
      v38 = DWORD1(v11);
      mach_port_name_t v37 = 0LL;
      v40 = 9LL;
      v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      mach_port_name_t v37 = *(void *)(v41 + 72);
      v56 = 9LL;
      v55 = DWORD1(v11);
      v57 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *(void *)(v57 + 72) = DWORD1(v11);
      if (v37) {
        _os_semaphore_dispose(v37);
      }
    }

    return v9;
  }

  else
  {
    return 3;
  }

int pthread_setcancelstate(int a1, int *a2)
{
  unsigned int v4 = (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((void *)(*v4 ^ _pthread_ptr_munge_token) != v4) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  if (a1)
  {
    if (a1 != 1) {
      return 22;
    }
    __pthread_canceled(1LL);
  }

  else
  {
    __pthread_canceled(2LL);
  }

  int v8 = (unsigned __int16 *)v4 + 83;
  do
  {
    if (_os_atomic_mo_has_acquire(0)) {
      unsigned __int16 v2 = __ldaxr(v8);
    }
    else {
      unsigned __int16 v2 = __ldxr(v8);
    }
    char v11 = v2;
    unsigned __int16 v10 = v2 & 0xFFFE | a1;
    if (_os_atomic_mo_has_release(0)) {
      BOOL v9 = __stlxr(v10, v8) == 0;
    }
    else {
      BOOL v9 = __stxr(v10, v8) == 0;
    }
  }

  while (!v9);
  if (a2) {
    *a2 = v11 & 1;
  }
  return 0;
}

int pthread_setcanceltype(int a1, int *a2)
{
  unsigned int v4 = (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((void *)(*v4 ^ _pthread_ptr_munge_token) != v4) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  if (a1 != 2 && a1) {
    return 22;
  }
  int v8 = (unsigned __int16 *)v4 + 83;
  do
  {
    if (_os_atomic_mo_has_acquire(0)) {
      unsigned __int16 v2 = __ldaxr(v8);
    }
    else {
      unsigned __int16 v2 = __ldxr(v8);
    }
    char v11 = v2;
    unsigned __int16 v10 = v2 & 0xFFFD | a1;
    if (_os_atomic_mo_has_release(0)) {
      BOOL v9 = __stlxr(v10, v8) == 0;
    }
    else {
      BOOL v9 = __stxr(v10, v8) == 0;
    }
  }

  while (!v9);
  if (a2) {
    *a2 = v11 & 2;
  }
  return 0;
}

void pthread_testcancel(void)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  char v0 = atomic_load((unsigned __int16 *)(StatusReg - 58));
  if ((v0 & 0x11) == 0x11)
  {
    if ((*(void *)(StatusReg - 224) ^ _pthread_ptr_munge_token) != StatusReg - 224) {
      abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    *(_BYTE *)(StatusReg - 59) = 1;
    pthread_exit((char *)&dword_0 + 1);
  }

uint64_t _pthread_markcancel_if_canceled(uint64_t result, unsigned int a2)
{
  char v2 = atomic_load((unsigned __int16 *)(result + 166));
  if ((v2 & 0x11) == 0x11) {
    return __pthread_markcancel(a2);
  }
  return result;
}

uint64_t _pthread_exit_if_canceled(uint64_t result)
{
  int v2 = result;
  if (result == 4)
  {
    BOOL result = __pthread_canceled(0LL);
    if (!(_DWORD)result)
    {
      unint64_t v1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
      if ((*(void *)v1 ^ _pthread_ptr_munge_token) != v1) {
        abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
      }
      *(_DWORD *)(v1 + 168) = v2;
      *(_BYTE *)(v1 + 165) = 1;
      pthread_exit((char *)&dword_0 + 1);
    }
  }

  return result;
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  int v4 = 0;
  return v4;
}

uint64_t _pthread_joiner_prepost_wake(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v3 = 0;
  if ((*(_BYTE *)(a1 + 49) & 1) != 0)
  {
    unsigned int v3 = *(_DWORD *)(v4 + 20);
    *(_BYTE *)(a1 + 49) &= ~1u;
  }

  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    *(void *)(a1 + 32) = 0LL;
  }

  if (*(void *)(v4 + 8))
  {
    __int16 v6 = 17;
    unsigned __int16 v1 = atomic_load((unsigned __int16 *)(a1 + 166));
    else {
      uint64_t v5 = *(void *)(a1 + 40);
    }
    **(void **)(v4 + 8) = v5;
  }

  return v3;
}

uint64_t _pthread_join(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  int v13 = a3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v17 = StatusReg;
  unsigned int v12 = (void *)(StatusReg - 224);
  v10[0] = StatusReg - 224;
  v10[1] = a2;
  __int128 v11 = 0uLL;
  unsigned int v9 = 0;
  mach_port_name_t v29 = (int *)a1;
  i = 0LL;
  if (a1)
  {
    v44 = &_pthread_list_lock;
    v51 = &_pthread_list_lock;
    unsigned int v50 = 327680;
    unsigned int v49 = 0;
    uint64_t v52 = 3LL;
    uint64_t v53 = 3LL;
    unint64_t v54 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v49 = *(void *)(v54 + 24);
    unsigned int v48 = 0;
    unsigned int v47 = v49;
    unsigned int v46 = v49;
    do
      unsigned int v3 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
    while (!v3 && __stlxr(v49, &_pthread_list_lock._os_unfair_lock_opaque));
    if (v3) {
      unsigned int v48 = v3;
    }
    BOOL v45 = v3 == 0;
    if (v3) {
      a1 = os_unfair_lock_lock_with_options(v51, v50);
    }
    for (i = __pthread_head; i; i = (int *)*((void *)i + 2))
    {
      if (i == v29)
      {
        v32 = i;
        uint64_t v31 = 0LL;
        uint64_t v31 = *(void *)i ^ _pthread_ptr_munge_token;
        char v30 = 1;
        goto LABEL_25;
      }
    }

    mach_port_name_t v35 = &_pthread_list_lock;
    os_unfair_lock_t v75 = &_pthread_list_lock;
    unsigned int v74 = 0;
    uint64_t v76 = 3LL;
    uint64_t v77 = 3LL;
    unint64_t v78 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v74 = *(void *)(v78 + 24);
    int v73 = 0;
    unsigned int v72 = v74;
    int v71 = 0;
    do
      unsigned int v4 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
    while (v4 == v74 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
    if (v4 != v74) {
      unsigned int v72 = v4;
    }
    BOOL v70 = v4 == v74;
    if (v4 != v74) {
      os_unfair_lock_unlock(v75);
    }
    char v30 = 0;
  }

  else
  {
    char v30 = 0;
  }

uint64_t _pthread_joiner_wait(uint64_t a1, _DWORD *a2, int a3)
{
  int v13 = (unsigned int *)(a1 + 52);
  unsigned int v12 = 16777218;
  if (a3 == 2) {
    unsigned int v12 = 16908290;
  }
  while (1)
  {
    unsigned int v3 = atomic_load(v13);
    if (v3 == -1) {
      break;
    }
    if (v3 != a2[4])
    {
      qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_join() state corruption";
      qword_24058 = v3;
      __break(1u);
      JUMPOUT(0xA430LL);
    }

    if (-(int)__ulock_wait(v12, v13, a2[4]) == 4)
    {
      BOOL v10 = 0;
      if (a3 == 2)
      {
        int v17 = 17;
        unsigned __int16 v4 = atomic_load((unsigned __int16 *)(*(void *)a2 + 166LL));
        BOOL v10 = (v17 & ~v4) == 0;
      }

      if (v10 && _pthread_joiner_abort_wait(a1, (uint64_t)a2))
      {
        *(_BYTE *)(*(void *)a2 + 165LL) = &dword_0 + 1;
        pthread_exit((char *)&dword_0 + 1);
      }
    }
  }

  BOOL v11 = 0;
  unsigned int v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v6 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (!v6 && __stlxr(v5, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v6) {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
  }
  if ((a2[6] & 1) == 0)
  {
    if (*(void *)(a1 + 32) != (void)a2)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_join_ctx == ctx";
      __break(1u);
      JUMPOUT(0xA6B8LL);
    }

    *(void *)(a1 + 32) = 0LL;
    BOOL v11 = (*(_BYTE *)(a1 + 49) & 2) != 0;
  }

  int v7 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v8 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (v8 == v7 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v8 != v7) {
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  if (v11) {
    _pthread_deallocate(a1, 0);
  }
  return 0LL;
}

uint64_t pthread_join_NOCANCEL(uint64_t a1, uint64_t *a2)
{
  int v2 = _pthread_conformance();
  return _pthread_join(a1, a2, v2);
}

uint64_t _pthread_conformance()
{
  return 1LL;
}

uint64_t pthread_cond_wait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2)
{
  int v2 = _pthread_conformance();
  return _pthread_cond_wait(a1, a2, 0LL, 0, v2);
}

uint64_t pthread_cond_timedwait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2, uint64_t *a3)
{
  int v3 = _pthread_conformance();
  return _pthread_cond_wait(a1, a2, a3, 0, v3);
}

uint64_t sigwait_NOCANCEL(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = 0;
  _pthread_testcancel_if_cancelable_variant();
  if (__sigwait(a1, a2) == -1)
  {
    unsigned int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    _pthread_testcancel_if_cancelable_variant();
    if (v3 == 4) {
      return 0;
    }
  }

  return v3;
}

BOOL _os_atomic_mo_has_acquire(int a1)
{
  BOOL v1 = a1 == 2 || a1 == 1;
  BOOL v4 = 1;
  if (!v1 && a1 != 5 && a1 != 4) {
    return 0;
  }
  return v4;
}

BOOL _os_atomic_mo_has_release(int a1)
{
  return (a1 - 3) <= 2;
}

uint64_t _pthread_joiner_abort_wait(uint64_t a1, uint64_t a2)
{
  char v7 = 0;
  unsigned int v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v3 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (!v3 && __stlxr(v2, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v3) {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
  }
  if ((*(_BYTE *)(a2 + 24) & 1) == 0 && *(_DWORD *)(a1 + 52) != -1)
  {
    if (*(void *)(a1 + 32) != a2)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_join_ctx == ctx";
      __break(1u);
      JUMPOUT(0xABA0LL);
    }

    *(void *)(a1 + 32) = 0LL;
    *(_DWORD *)(a1 + 52) = 0;
    char v7 = 1;
  }

  int v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v5 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (v5 == v4 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v5 != v4) {
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  return v7 & 1;
}

int pthread_condattr_init(pthread_condattr_t *a1)
{
  a1->__sig = 1129202753LL;
  *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | 2;
  return 0;
}

int pthread_condattr_destroy(pthread_condattr_t *a1)
{
  a1->__sig = 0LL;
  return 0;
}

int pthread_condattr_getpshared(const pthread_condattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1129202753)
  {
    *a2 = *(_DWORD *)a1->__opaque & 3;
    return 0;
  }

  return v3;
}

int pthread_condattr_setpshared(pthread_condattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1129202753 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | a2 & 3;
    return 0;
  }

  return v3;
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_wait((uint64_t)a1, a2, &a3->tv_sec, 1, 1);
}

uint64_t _pthread_cond_wait(uint64_t a1, pthread_mutex_t *a2, uint64_t *a3, int a4, int a5)
{
  uint64_t v21 = (unsigned int *)a1;
  uint64_t v20 = a2;
  uint64_t v19 = a3;
  int v18 = a4;
  int v17 = a5;
  unsigned int v16 = 0;
  uint64_t v15 = 0LL;
  uint64_t v14 = 0LL;
  char v13 = 0;
  unsigned __int16 v23 = a2;
  if ((a2->__sig & 0xFFFFFFFDLL) != 0x4D555458)
  {
    unsigned __int16 v24 = v20;
    if ((v20->__sig & 0xFFFFFFF0LL) != 0x32AAABA0) {
      return 22;
    }
  }

  BOOL v12 = 0;
  int v25 = v20;
  BOOL v12 = (*(_DWORD *)&v20->__opaque[4] & 0x4000) != 0;
  int v11 = 0;
  if (v12) {
    int v5 = 1129270854;
  }
  else {
    int v5 = 1129270853;
  }
  int v11 = v5;
  uint64_t v31 = v21;
  char v30 = (unsigned int *)&v11;
  unsigned int v29 = 0;
  unsigned int v28 = 0;
  unsigned int v27 = *v21;
  unsigned int v28 = v27;
  unsigned int v26 = v27;
  unsigned int v29 = v27;
  if (v27 == 1018212795)
  {
    unsigned int v32 = _pthread_cond_check_init_slow((uint64_t)v31, v30);
  }

  else
  {
    v39 = v31;
    unsigned int v38 = v29;
    uint64_t v37 = v30;
    int v36 = 0;
    if (v29 == 1129270852)
    {
      if (*v37 != 1129270852)
      {
        unsigned int v35 = 0;
        unsigned int v35 = *v37;
        unsigned int v34 = v35;
        unsigned int *v39 = v35;
        unsigned int v33 = v35;
      }
    }

    else if (v29 - 1129270853 < 2)
    {
      if (*v37 == 1129270852)
      {
        *uint64_t v37 = v38;
      }

      else if (*v37 != v38)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xB0ACLL);
      }
    }

    else
    {
      int v36 = 22;
    }

    unsigned int v32 = v36;
  }

  unsigned int v16 = v32;
  if (v32) {
    return v16;
  }
  if (v17 == 2) {
    pthread_testcancel();
  }
  if (v19)
  {
    if (v18)
    {
      uint64_t v14 = *v19;
      uint64_t v15 = v19[1];
      if (!v14 && !v15) {
        char v13 = 1;
      }
      goto LABEL_40;
    }

    uint64_t v10 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
    __gettimeofday(&v7);
    uint64_t v9 = v7;
    uint64_t v10 = 1000 * (int)v8;
    if (*v19 == v7)
    {
      if (v19[1] > v10)
      {
LABEL_34:
        uint64_t v15 = v19[1] - v10;
        uint64_t v14 = *v19 - v9;
        if (v15 < 0)
        {
          v15 += 1000000000LL;
          --v14;
        }

        goto LABEL_40;
      }
    }

    else if (*v19 >= v9)
    {
      goto LABEL_34;
    }

    char v13 = 1;
  }

LABEL_40:
  if (v12 || !*((void *)v21 + 2) || *((void *)v21 + 2) == (void)v20)
  {
    if ((v13 & 1) != 0)
    {
      unsigned int v16 = pthread_mutex_unlock(v20);
      if (v16)
      {
        return v16;
      }

      else
      {
        unsigned int v16 = pthread_mutex_lock(v20);
        if (v16) {
          return v16;
        }
        else {
          return 60;
        }
      }
    }

    else if (v12)
    {
      return _pthread_ulock_cond_wait((uint64_t)v21, (uint64_t)v20, &v14, v17);
    }

    else
    {
      return _pthread_psynch_cond_wait((uint64_t)v21, v20, &v14, v17);
    }
  }

  else
  {
    return 22;
  }

int pthread_cond_destroy(pthread_cond_t *a1)
{
  unsigned __int16 v24 = (os_unfair_lock_s *)a1;
  int v23 = 22;
  int v22 = 0;
  int v21 = 0;
  int sig = a1->__sig;
  int v21 = sig;
  int v19 = sig;
  int v22 = sig;
  if (sig == 1018212795 || sig == 1129270852)
  {
LABEL_28:
    v24->_os_unfair_lock_opaque = 0;
    return 0;
  }

  if (sig != 1129270853)
  {
    if (sig != 1129270854) {
      return v23;
    }
    goto LABEL_28;
  }

  int v25 = v24 + 2;
  unsigned int v33 = v24 + 2;
  int v32 = 327680;
  os_unfair_lock_lock_with_options(&v24[2], 327680LL);
  unint64_t v18 = 0LL;
  unint64_t v17 = 0LL;
  unsigned int v16 = 0;
  unsigned int v15 = 0;
  unsigned int v14 = 0;
  char v13 = 0LL;
  BOOL v12 = 0LL;
  int v11 = 0LL;
  uint64_t v10 = 0LL;
  char v30 = v24;
  unsigned int v29 = &v13;
  unsigned int v28 = (unint64_t **)&v12;
  unsigned int v27 = &v11;
  unsigned int v26 = &v10;
  if (((v24[3]._os_unfair_lock_opaque >> 29) & 1) != 0)
  {
    *unsigned int v28 = (unint64_t *)&v30[7]._os_unfair_lock_opaque;
    *unsigned int v26 = &v30[8]._os_unfair_lock_opaque;
    *unsigned int v27 = &v30[6]._os_unfair_lock_opaque;
  }

  else
  {
    *unsigned int v28 = (unint64_t *)&v30[6]._os_unfair_lock_opaque;
    *unsigned int v26 = &v30[7]._os_unfair_lock_opaque;
    *unsigned int v27 = &v30[8]._os_unfair_lock_opaque;
  }

  *unsigned int v29 = *v28;
  do
  {
    unsigned int v16 = *v12;
    unsigned int v15 = *v11;
    unsigned int v14 = *v10;
    if ((v16 & 0xFFFFFF00) != (v14 & 0xFFFFFF00)) {
      break;
    }
    unint64_t v18 = ((unint64_t)v14 << 32) | v16;
    unint64_t v17 = v18;
    BOOL v1 = v13;
    unint64_t v2 = v18;
    unint64_t v3 = v18;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
  }

  while (v4 != v2);
  v9[4] = 0;
  *(_DWORD *)uint64_t v9 = (v14 & 2) != 0;
  if ((v14 & 2) != 0 && v24[3]._os_unfair_lock_opaque >> 30 == 1) {
    *(_DWORD *)&v9[1] |= 0x10u;
  }
  v24->_os_unfair_lock_opaque = 0;
  int v23 = 0;
  uint64_t v31 = v24 + 2;
  os_unfair_lock_t v39 = v24 + 2;
  unsigned int v38 = 0;
  uint64_t v40 = 3LL;
  uint64_t v41 = 3LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v38 = *(void *)(StatusReg + 24);
  int v37 = 0;
  unsigned int v36 = v38;
  p_os_unfair_lock_opaque = &v24[2]._os_unfair_lock_opaque;
  int v35 = 0;
  unsigned int v6 = v38;
  do
    unsigned int v7 = __ldaxr(p_os_unfair_lock_opaque);
  while (v7 == v6 && __stlxr(0, p_os_unfair_lock_opaque));
  if (v7 != v6) {
    unsigned int v36 = v7;
  }
  BOOL v34 = v7 == v6;
  if (v7 != v6) {
    os_unfair_lock_unlock(v39);
  }
  if ((v9[0] & 1) != 0) {
    __psynch_cvclrprepost(v24, v16, v15, v14, 0LL, v16, *(unsigned int *)&v9[1]);
  }
  return v23;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  int v22 = a1;
  char v21 = 1;
  unsigned int v20 = 0;
  unsigned int v19 = 1129270852;
  unsigned int v29 = a1;
  unsigned int v28 = &v19;
  unsigned int v27 = 0;
  unsigned int v26 = 0;
  unsigned int sig = a1->__sig;
  unsigned int v26 = sig;
  unsigned int v24 = sig;
  unsigned int v27 = sig;
  if (sig == 1018212795)
  {
    int v30 = _pthread_cond_check_init_slow((uint64_t)v29, v28);
  }

  else
  {
    v101 = v29;
    unsigned int v100 = v27;
    v99 = v28;
    int v98 = 0;
    if (v27 == 1129270852)
    {
      if (*v99 != 1129270852)
      {
        unsigned int v97 = 0;
        unsigned int v97 = *v99;
        unsigned int v96 = v97;
        LODWORD(v101->__sig) = v97;
        unsigned int v95 = v97;
      }
    }

    else if (v27 - 1129270853 < 2)
    {
      if (*v99 == 1129270852)
      {
        unsigned int *v99 = v100;
      }

      else if (*v99 != v100)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xBAD8LL);
      }
    }

    else
    {
      int v98 = 22;
    }

    int v30 = v98;
  }

  if (v30 || v19 == 1129270852) {
    return v30;
  }
  if (v19 != 1129270853)
  {
    if (v19 != 1129270854)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_24058 = v19;
      __break(1u);
      JUMPOUT(0xC544LL);
    }

    v92 = v22;
    char v91 = v21 & 1;
    unsigned int v90 = v20;
    v89 = 0LL;
    v94 = v22;
    v89 = (unint64_t *)&v94->__opaque[4 * ((*(_DWORD *)&v94->__opaque[4] >> 29) & 1) + 16];
    unint64_t v88 = 0LL;
    unint64_t v87 = 0LL;
    BOOL v86 = 0;
    v85 = v89;
    do
    {
      if (_os_atomic_mo_has_acquire(3)) {
        unint64_t v13 = __ldaxr(v85);
      }
      else {
        unint64_t v13 = __ldxr(v85);
      }
      unint64_t v88 = v13;
      if (!WORD2(v13) || WORD2(v88) == HIWORD(v88))
      {
        __clrex();
        return 0;
      }

      LODWORD(v84) = v88 + 1;
      WORD2(v84) = WORD2(v88);
      if ((v91 & 1) != 0)
      {
        __int16 v17 = WORD2(v88);
      }

      else
      {
        if (HIWORD(v88) + 1 < WORD2(v88)) {
          __int16 v16 = HIWORD(v88) + 1;
        }
        else {
          __int16 v16 = WORD2(v88);
        }
        __int16 v17 = v16;
      }

      HIWORD(v84) = v17;
      unint64_t v87 = v84;
      if (_os_atomic_mo_has_release(3)) {
        BOOL v86 = __stlxr(v87, v85) == 0;
      }
      else {
        BOOL v86 = __stxr(v87, v85) == 0;
      }
    }

    while (!v86);
    BOOL v83 = v86;
    if (HIWORD(v88) < (int)WORD2(v88))
    {
      unsigned int v82 = 16777217;
      if ((v91 & 1) != 0)
      {
        v82 |= 0x100u;
      }

      else if (v90)
      {
        v82 |= 0x200u;
      }

      while (1)
      {
        int v81 = 0;
        int v81 = __ulock_wake(v82, v89, v90);
        if ((v81 & 0x80000000) == 0) {
          break;
        }
        int v15 = -v81;
        if (v81 == -2) {
          break;
        }
        if (v15 != 4)
        {
          if (v15 != 37)
          {
            uint64_t v80 = -v81;
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_24058 = v80;
            __break(1u);
            JUMPOUT(0xC4E8LL);
          }

          if (!v90)
          {
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xC48CLL);
          }

          return pthread_cond_broadcast(v92);
        }
      }
    }

    return 0;
  }

  int v73 = v22;
  char v72 = v21 & 1;
  unsigned int v71 = v20;
  int v70 = 0;
  unsigned int v69 = 0;
  unsigned int v68 = 0;
  unint64_t v67 = 0LL;
  unint64_t v66 = 0LL;
  unsigned int v65 = 0;
  unsigned int v64 = 0;
  unsigned int v63 = 0;
  int v62 = 0LL;
  BOOL v61 = 0LL;
  unint64_t v60 = 0LL;
  uint64_t v59 = 0LL;
  int v58 = 0;
  int v57 = 0;
  int v56 = 0;
  v79 = v22;
  unint64_t v78 = (unsigned int **)&v62;
  uint64_t v77 = &v61;
  uint64_t v76 = &v60;
  os_unfair_lock_t v75 = &v59;
  if ((*(_DWORD *)&v22->__opaque[4] & 0x20000000) != 0)
  {
    *uint64_t v77 = (unsigned int *)&v79->__opaque[20];
    *os_unfair_lock_t v75 = (unsigned int *)&v79->__opaque[24];
    *uint64_t v76 = (unsigned int *)&v79->__opaque[16];
  }

  else
  {
    *uint64_t v77 = (unsigned int *)&v79->__opaque[16];
    *os_unfair_lock_t v75 = (unsigned int *)&v79->__opaque[20];
    *uint64_t v76 = (unsigned int *)&v79->__opaque[24];
  }

  *unint64_t v78 = *v77;
  char v55 = 0;
  do
  {
    char v55 = 0;
    unsigned int v65 = *v61;
    unsigned int v64 = *v60;
    unsigned int v63 = *v59;
    unsigned int v69 = 0;
    unsigned int v68 = 0;
    if ((v65 & 0xFFFFFF00) == (v63 & 0xFFFFFF00) || !v71 && (v65 & 0xFFFFFF00) == (v64 & 0xFFFFFF00))
    {
      unint64_t v67 = (unint64_t)v63 << 32;
      v67 |= v65;
      unint64_t v66 = v67;
      unint64_t v54 = v67;
      BOOL v53 = 0;
      BOOL v1 = v62;
      unint64_t v51 = v67;
      unint64_t v50 = v67;
      unint64_t v52 = v67;
      unint64_t v2 = v67;
      unint64_t v3 = v67;
      do
        unint64_t v4 = __ldaxr(v1);
      while (v4 == v2 && __stlxr(v3, v1));
      if (v4 != v2) {
        unint64_t v54 = v4;
      }
      BOOL v49 = v4 == v2;
      BOOL v53 = v4 == v2;
      BOOL v48 = v53;
      if (v4 == v2) {
        return 0;
      }
      char v55 = 1;
    }

    else
    {
      if (v71) {
        break;
      }
      if (is_seqhigher(v63 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v58 > 0x2000) {
          return 35;
        }
LABEL_51:
        sched_yield();
        char v55 = 1;
        goto LABEL_58;
      }

      if (is_seqhigher(v64 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v57 > 0x2000)
        {
          if (v56) {
            return 35;
          }
          unsigned int v47 = v64;
          BOOL v46 = 0;
          int v5 = v60;
          unsigned int v44 = v63 & 0xFFFFFF00;
          unsigned int v43 = v63 & 0xFFFFFF00;
          unsigned int v45 = v63 & 0xFFFFFF00;
          unsigned int v6 = v64;
          unsigned int v7 = v63 & 0xFFFFFF00;
          do
            unsigned int v8 = __ldaxr(v5);
          while (v8 == v6 && __stlxr(v7, v5));
          if (v8 != v6) {
            unsigned int v47 = v8;
          }
          BOOL v42 = v8 == v6;
          BOOL v46 = v8 == v6;
          BOOL v41 = v46;
          if (v8 == v6)
          {
            int v56 = 1;
            int v57 = 0;
          }
        }

        goto LABEL_51;
      }

      if (is_seqlower(v64 & 0xFFFFFF00, v63 & 0xFFFFFF00)) {
        unsigned int v68 = v63 & 0xFFFFFF00;
      }
      else {
        unsigned int v68 = v64 & 0xFFFFFF00;
      }
      if ((v72 & 1) != 0)
      {
        unsigned int v69 = diff_genseq(v65, v68);
        unsigned int v68 = v65 & 0xFFFFFF00;
      }

      else
      {
        v68 += 256;
      }
    }

LABEL_58:
    BOOL v18 = 1;
    if ((v55 & 1) == 0)
    {
      unsigned int v40 = v64;
      BOOL v39 = 0;
      uint64_t v9 = v60;
      unsigned int v37 = v68;
      unsigned int v36 = v68;
      unsigned int v38 = v68;
      unsigned int v10 = v64;
      unsigned int v11 = v68;
      do
        unsigned int v12 = __ldaxr(v9);
      while (v12 == v10 && __stlxr(v11, v9));
      if (v12 != v10) {
        unsigned int v40 = v12;
      }
      BOOL v35 = v12 == v10;
      BOOL v39 = v12 == v10;
      BOOL v34 = v39;
      BOOL v18 = v12 != v10;
    }
  }

  while (v18);
  unsigned int v33 = 0;
  if (*(_DWORD *)&v73->__opaque[4] >> 30 == 1) {
    v33 |= 0x10u;
  }
  unint64_t v32 = v65 | ((unint64_t)v63 << 32);
  if ((v72 & 1) != 0)
  {
    unint64_t v31 = v69 | ((unint64_t)v64 << 32);
    int v70 = __psynch_cvbroad(v73, v32, v31, v33, 0LL, 0LL);
  }

  else
  {
    int v70 = __psynch_cvsignal(v73, v32, v64, v71, 0LL, 0LL, 0LL, v33);
  }

  if (v70 != -1 && v70) {
    _pthread_cond_updateval((uint64_t)v73, 0LL, 0, v70);
  }
  return 0;
}

    BOOL v18 = 1;
    if ((v55 & 1) == 0)
    {
      unsigned int v40 = v64;
      BOOL v39 = 0;
      uint64_t v9 = v60;
      unsigned int v37 = v68;
      unsigned int v36 = v68;
      unsigned int v38 = v68;
      unsigned int v10 = v64;
      unsigned int v11 = v68;
      do
        unsigned int v12 = __ldaxr(v9);
      while (v12 == v10 && __stlxr(v11, v9));
      if (v12 != v10) {
        unsigned int v40 = v12;
      }
      BOOL v35 = v12 == v10;
      BOOL v39 = v12 == v10;
      BOOL v34 = v39;
      BOOL v18 = v12 != v10;
    }
  }

  while (v18);
  unsigned int v33 = 0;
  if (*(_DWORD *)&v73->__opaque[4] >> 30 == 1) {
    v33 |= 0x10u;
  }
  unint64_t v32 = v65 | ((unint64_t)v63 << 32);
  if ((v72 & 1) != 0)
  {
    unint64_t v31 = v69 | ((unint64_t)v64 << 32);
    int v70 = __psynch_cvbroad(v73, v32, v31, v33, 0LL, 0LL);
  }

  else
  {
    int v70 = __psynch_cvsignal(v73, v32, v64, v71, 0LL, 0LL, 0LL, v33);
  }

  if (v70 != -1 && v70) {
    _pthread_cond_updateval((uint64_t)v73, 0LL, 0, v70);
  }
  return 0;
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  mach_port_t v20 = 0;
  if (a2) {
    mach_port_t v20 = pthread_mach_thread_np(a2);
  }
  int v25 = a1;
  char v24 = 0;
  mach_port_t v23 = v20;
  unsigned int v22 = 1129270852;
  unint64_t v32 = a1;
  unint64_t v31 = &v22;
  unsigned int v30 = 0;
  unsigned int v29 = 0;
  unsigned int sig = a1->__sig;
  unsigned int v29 = sig;
  unsigned int v27 = sig;
  unsigned int v30 = sig;
  if (sig == 1018212795)
  {
    int v33 = _pthread_cond_check_init_slow((uint64_t)v32, v31);
  }

  else
  {
    v104 = v32;
    unsigned int v103 = v30;
    v102 = v31;
    int v101 = 0;
    if (v30 == 1129270852)
    {
      if (*v102 != 1129270852)
      {
        unsigned int v100 = 0;
        unsigned int v100 = *v102;
        unsigned int v99 = v100;
        LODWORD(v104->__sig) = v100;
        unsigned int v98 = v100;
      }
    }

    else if (v103 - 1129270853 < 2)
    {
      if (*v102 == 1129270852)
      {
        unsigned int *v102 = v103;
      }

      else if (*v102 != v103)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xC784LL);
      }
    }

    else
    {
      int v101 = 22;
    }

    int v33 = v101;
  }

  if (v33 || v22 == 1129270852) {
    return v33;
  }
  if (v22 != 1129270853)
  {
    if (v22 != 1129270854)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_24058 = v22;
      __break(1u);
      JUMPOUT(0xD248LL);
    }

    unsigned int v95 = v25;
    char v94 = v24 & 1;
    mach_port_t v93 = v23;
    v92 = 0LL;
    unsigned int v97 = v25;
    v92 = (unint64_t *)&v97->__opaque[4 * ((*(_DWORD *)&v97->__opaque[4] >> 29) & 1) + 16];
    unint64_t v91 = 0LL;
    unint64_t v90 = 0LL;
    BOOL v89 = 0;
    unint64_t v88 = v92;
    do
    {
      if (_os_atomic_mo_has_acquire(3)) {
        unint64_t v14 = __ldaxr(v88);
      }
      else {
        unint64_t v14 = __ldxr(v88);
      }
      unint64_t v91 = v14;
      if (!WORD2(v14) || WORD2(v91) == HIWORD(v91))
      {
        __clrex();
        return 0;
      }

      LODWORD(v87) = v91 + 1;
      WORD2(v87) = WORD2(v91);
      if ((v94 & 1) != 0)
      {
        __int16 v18 = WORD2(v91);
      }

      else
      {
        if (HIWORD(v91) + 1 < WORD2(v91)) {
          __int16 v17 = HIWORD(v91) + 1;
        }
        else {
          __int16 v17 = WORD2(v91);
        }
        __int16 v18 = v17;
      }

      HIWORD(v87) = v18;
      unint64_t v90 = v87;
      if (_os_atomic_mo_has_release(3)) {
        BOOL v89 = __stlxr(v90, v88) == 0;
      }
      else {
        BOOL v89 = __stxr(v90, v88) == 0;
      }
    }

    while (!v89);
    BOOL v86 = v89;
    if (HIWORD(v91) < (int)WORD2(v91))
    {
      unsigned int v85 = 16777217;
      if ((v94 & 1) != 0)
      {
        v85 |= 0x100u;
      }

      else if (v93)
      {
        v85 |= 0x200u;
      }

      while (1)
      {
        int v84 = 0;
        int v84 = __ulock_wake(v85, v92, v93);
        if ((v84 & 0x80000000) == 0) {
          break;
        }
        int v16 = -v84;
        if (v84 == -2) {
          break;
        }
        if (v16 != 4)
        {
          if (v16 != 37)
          {
            uint64_t v83 = -v84;
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_24058 = v83;
            __break(1u);
            JUMPOUT(0xD1ECLL);
          }

          if (!v93)
          {
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xD188LL);
          }

          return pthread_cond_broadcast(v95);
        }
      }
    }

    return 0;
  }

  uint64_t v76 = v25;
  char v75 = v24 & 1;
  mach_port_t v74 = v23;
  int v73 = 0;
  unsigned int v72 = 0;
  unsigned int v71 = 0;
  unint64_t v70 = 0LL;
  unint64_t v69 = 0LL;
  unsigned int v68 = 0;
  unsigned int v67 = 0;
  unsigned int v66 = 0;
  unsigned int v65 = 0LL;
  unsigned int v64 = 0LL;
  unsigned int v63 = 0LL;
  int v62 = 0LL;
  int v61 = 0;
  int v60 = 0;
  int v59 = 0;
  unsigned int v82 = v25;
  int v81 = (unsigned int **)&v65;
  uint64_t v80 = &v64;
  v79 = &v63;
  unint64_t v78 = &v62;
  if ((*(_DWORD *)&v25->__opaque[4] & 0x20000000) != 0)
  {
    *uint64_t v80 = (unsigned int *)&v82->__opaque[20];
    *unint64_t v78 = (unsigned int *)&v82->__opaque[24];
    pthread_cond_t *v79 = (unsigned int *)&v82->__opaque[16];
  }

  else
  {
    *uint64_t v80 = (unsigned int *)&v82->__opaque[16];
    *unint64_t v78 = (unsigned int *)&v82->__opaque[20];
    pthread_cond_t *v79 = (unsigned int *)&v82->__opaque[24];
  }

  *int v81 = *v80;
  char v58 = 0;
  do
  {
    char v58 = 0;
    unsigned int v68 = *v64;
    unsigned int v67 = *v63;
    unsigned int v66 = *v62;
    unsigned int v72 = 0;
    unsigned int v71 = 0;
    if ((v68 & 0xFFFFFF00) == (v66 & 0xFFFFFF00) || !v74 && (v68 & 0xFFFFFF00) == (v67 & 0xFFFFFF00))
    {
      unint64_t v70 = (unint64_t)v66 << 32;
      v70 |= v68;
      unint64_t v69 = v70;
      unint64_t v57 = v70;
      BOOL v56 = 0;
      unint64_t v2 = v65;
      unint64_t v54 = v70;
      unint64_t v53 = v70;
      unint64_t v55 = v70;
      unint64_t v3 = v70;
      unint64_t v4 = v70;
      do
        unint64_t v5 = __ldaxr(v2);
      while (v5 == v3 && __stlxr(v4, v2));
      if (v5 != v3) {
        unint64_t v57 = v5;
      }
      BOOL v52 = v5 == v3;
      BOOL v56 = v5 == v3;
      BOOL v51 = v56;
      if (v5 == v3) {
        return 0;
      }
      char v58 = 1;
    }

    else
    {
      if (v74) {
        break;
      }
      if (is_seqhigher(v66 & 0xFFFFFF00, v68 & 0xFFFFFF00))
      {
        if (++v61 > 0x2000) {
          return 35;
        }
LABEL_53:
        sched_yield();
        char v58 = 1;
        goto LABEL_60;
      }

      if (is_seqhigher(v67 & 0xFFFFFF00, v68 & 0xFFFFFF00))
      {
        if (++v60 > 0x2000)
        {
          if (v59) {
            return 35;
          }
          unsigned int v50 = v67;
          BOOL v49 = 0;
          unsigned int v6 = v63;
          unsigned int v47 = v66 & 0xFFFFFF00;
          unsigned int v46 = v66 & 0xFFFFFF00;
          unsigned int v48 = v66 & 0xFFFFFF00;
          unsigned int v7 = v67;
          unsigned int v8 = v66 & 0xFFFFFF00;
          do
            unsigned int v9 = __ldaxr(v6);
          while (v9 == v7 && __stlxr(v8, v6));
          if (v9 != v7) {
            unsigned int v50 = v9;
          }
          BOOL v45 = v9 == v7;
          BOOL v49 = v9 == v7;
          BOOL v44 = v49;
          if (v9 == v7)
          {
            int v59 = 1;
            int v60 = 0;
          }
        }

        goto LABEL_53;
      }

      if (is_seqlower(v67 & 0xFFFFFF00, v66 & 0xFFFFFF00)) {
        unsigned int v71 = v66 & 0xFFFFFF00;
      }
      else {
        unsigned int v71 = v67 & 0xFFFFFF00;
      }
      if ((v75 & 1) != 0)
      {
        unsigned int v72 = diff_genseq(v68, v71);
        unsigned int v71 = v68 & 0xFFFFFF00;
      }

      else
      {
        v71 += 256;
      }
    }

LABEL_60:
    BOOL v19 = 1;
    if ((v58 & 1) == 0)
    {
      unsigned int v43 = v67;
      BOOL v42 = 0;
      unsigned int v10 = v63;
      unsigned int v40 = v71;
      unsigned int v39 = v71;
      unsigned int v41 = v71;
      unsigned int v11 = v67;
      unsigned int v12 = v71;
      do
        unsigned int v13 = __ldaxr(v10);
      while (v13 == v11 && __stlxr(v12, v10));
      if (v13 != v11) {
        unsigned int v43 = v13;
      }
      BOOL v38 = v13 == v11;
      BOOL v42 = v13 == v11;
      BOOL v37 = v42;
      BOOL v19 = v13 != v11;
    }
  }

  while (v19);
  unsigned int v36 = 0;
  if (*(_DWORD *)&v76->__opaque[4] >> 30 == 1) {
    v36 |= 0x10u;
  }
  unint64_t v35 = v68 | ((unint64_t)v66 << 32);
  if ((v75 & 1) != 0)
  {
    unint64_t v34 = v72 | ((unint64_t)v67 << 32);
    int v73 = __psynch_cvbroad(v76, v35, v34, v36, 0LL, 0LL);
  }

  else
  {
    int v73 = __psynch_cvsignal(v76, v35, v67, v74, 0LL, 0LL, 0LL, v36);
  }

  if (v73 != -1 && v73) {
    _pthread_cond_updateval((uint64_t)v76, 0LL, 0, v73);
  }
  return 0;
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  unsigned int v22 = a1;
  char v21 = 0;
  unsigned int v20 = 0;
  unsigned int v19 = 1129270852;
  unsigned int v29 = a1;
  unsigned int v28 = &v19;
  unsigned int v27 = 0;
  unsigned int v26 = 0;
  unsigned int sig = a1->__sig;
  unsigned int v26 = sig;
  unsigned int v24 = sig;
  unsigned int v27 = sig;
  if (sig == 1018212795)
  {
    int v30 = _pthread_cond_check_init_slow((uint64_t)v29, v28);
  }

  else
  {
    int v101 = v29;
    unsigned int v100 = v27;
    unsigned int v99 = v28;
    int v98 = 0;
    if (v27 == 1129270852)
    {
      if (*v99 != 1129270852)
      {
        unsigned int v97 = 0;
        unsigned int v97 = *v99;
        unsigned int v96 = v97;
        LODWORD(v101->__sig) = v97;
        unsigned int v95 = v97;
      }
    }

    else if (v27 - 1129270853 < 2)
    {
      if (*v99 == 1129270852)
      {
        unsigned int *v99 = v100;
      }

      else if (*v99 != v100)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xD438LL);
      }
    }

    else
    {
      int v98 = 22;
    }

    int v30 = v98;
  }

  if (v30 || v19 == 1129270852) {
    return v30;
  }
  if (v19 != 1129270853)
  {
    if (v19 != 1129270854)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_24058 = v19;
      __break(1u);
      JUMPOUT(0xDEA4LL);
    }

    v92 = v22;
    char v91 = v21 & 1;
    unsigned int v90 = v20;
    BOOL v89 = 0LL;
    char v94 = v22;
    BOOL v89 = (unint64_t *)&v94->__opaque[4 * ((*(_DWORD *)&v94->__opaque[4] >> 29) & 1) + 16];
    unint64_t v88 = 0LL;
    unint64_t v87 = 0LL;
    BOOL v86 = 0;
    unsigned int v85 = v89;
    do
    {
      if (_os_atomic_mo_has_acquire(3)) {
        unint64_t v13 = __ldaxr(v85);
      }
      else {
        unint64_t v13 = __ldxr(v85);
      }
      unint64_t v88 = v13;
      if (!WORD2(v13) || WORD2(v88) == HIWORD(v88))
      {
        __clrex();
        return 0;
      }

      LODWORD(v84) = v88 + 1;
      WORD2(v84) = WORD2(v88);
      if ((v91 & 1) != 0)
      {
        __int16 v17 = WORD2(v88);
      }

      else
      {
        if (HIWORD(v88) + 1 < WORD2(v88)) {
          __int16 v16 = HIWORD(v88) + 1;
        }
        else {
          __int16 v16 = WORD2(v88);
        }
        __int16 v17 = v16;
      }

      HIWORD(v84) = v17;
      unint64_t v87 = v84;
      if (_os_atomic_mo_has_release(3)) {
        BOOL v86 = __stlxr(v87, v85) == 0;
      }
      else {
        BOOL v86 = __stxr(v87, v85) == 0;
      }
    }

    while (!v86);
    BOOL v83 = v86;
    if (HIWORD(v88) < (int)WORD2(v88))
    {
      unsigned int v82 = 16777217;
      if ((v91 & 1) != 0)
      {
        v82 |= 0x100u;
      }

      else if (v90)
      {
        v82 |= 0x200u;
      }

      while (1)
      {
        int v81 = 0;
        int v81 = __ulock_wake(v82, v89, v90);
        if ((v81 & 0x80000000) == 0) {
          break;
        }
        int v15 = -v81;
        if (v81 == -2) {
          break;
        }
        if (v15 != 4)
        {
          if (v15 != 37)
          {
            uint64_t v80 = -v81;
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_24058 = v80;
            __break(1u);
            JUMPOUT(0xDE48LL);
          }

          if (!v90)
          {
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xDDECLL);
          }

          return pthread_cond_broadcast(v92);
        }
      }
    }

    return 0;
  }

  int v73 = v22;
  char v72 = v21 & 1;
  unsigned int v71 = v20;
  int v70 = 0;
  unsigned int v69 = 0;
  unsigned int v68 = 0;
  unint64_t v67 = 0LL;
  unint64_t v66 = 0LL;
  unsigned int v65 = 0;
  unsigned int v64 = 0;
  unsigned int v63 = 0;
  int v62 = 0LL;
  int v61 = 0LL;
  int v60 = 0LL;
  int v59 = 0LL;
  int v58 = 0;
  int v57 = 0;
  int v56 = 0;
  v79 = v22;
  unint64_t v78 = (unsigned int **)&v62;
  uint64_t v77 = &v61;
  uint64_t v76 = &v60;
  char v75 = &v59;
  if ((*(_DWORD *)&v22->__opaque[4] & 0x20000000) != 0)
  {
    *uint64_t v77 = (unsigned int *)&v79->__opaque[20];
    *char v75 = (unsigned int *)&v79->__opaque[24];
    *uint64_t v76 = (unsigned int *)&v79->__opaque[16];
  }

  else
  {
    *uint64_t v77 = (unsigned int *)&v79->__opaque[16];
    *char v75 = (unsigned int *)&v79->__opaque[20];
    *uint64_t v76 = (unsigned int *)&v79->__opaque[24];
  }

  *unint64_t v78 = *v77;
  char v55 = 0;
  do
  {
    char v55 = 0;
    unsigned int v65 = *v61;
    unsigned int v64 = *v60;
    unsigned int v63 = *v59;
    unsigned int v69 = 0;
    unsigned int v68 = 0;
    if ((v65 & 0xFFFFFF00) == (v63 & 0xFFFFFF00) || !v71 && (v65 & 0xFFFFFF00) == (v64 & 0xFFFFFF00))
    {
      unint64_t v67 = (unint64_t)v63 << 32;
      v67 |= v65;
      unint64_t v66 = v67;
      unint64_t v54 = v67;
      BOOL v53 = 0;
      BOOL v1 = v62;
      unint64_t v51 = v67;
      unint64_t v50 = v67;
      unint64_t v52 = v67;
      unint64_t v2 = v67;
      unint64_t v3 = v67;
      do
        unint64_t v4 = __ldaxr(v1);
      while (v4 == v2 && __stlxr(v3, v1));
      if (v4 != v2) {
        unint64_t v54 = v4;
      }
      BOOL v49 = v4 == v2;
      BOOL v53 = v4 == v2;
      BOOL v48 = v53;
      if (v4 == v2) {
        return 0;
      }
      char v55 = 1;
    }

    else
    {
      if (v71) {
        break;
      }
      if (is_seqhigher(v63 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v58 > 0x2000) {
          return 35;
        }
LABEL_51:
        sched_yield();
        char v55 = 1;
        goto LABEL_58;
      }

      if (is_seqhigher(v64 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v57 > 0x2000)
        {
          if (v56) {
            return 35;
          }
          unsigned int v47 = v64;
          BOOL v46 = 0;
          unint64_t v5 = v60;
          unsigned int v44 = v63 & 0xFFFFFF00;
          unsigned int v43 = v63 & 0xFFFFFF00;
          unsigned int v45 = v63 & 0xFFFFFF00;
          unsigned int v6 = v64;
          unsigned int v7 = v63 & 0xFFFFFF00;
          do
            unsigned int v8 = __ldaxr(v5);
          while (v8 == v6 && __stlxr(v7, v5));
          if (v8 != v6) {
            unsigned int v47 = v8;
          }
          BOOL v42 = v8 == v6;
          BOOL v46 = v8 == v6;
          BOOL v41 = v46;
          if (v8 == v6)
          {
            int v56 = 1;
            int v57 = 0;
          }
        }

        goto LABEL_51;
      }

      if (is_seqlower(v64 & 0xFFFFFF00, v63 & 0xFFFFFF00)) {
        unsigned int v68 = v63 & 0xFFFFFF00;
      }
      else {
        unsigned int v68 = v64 & 0xFFFFFF00;
      }
      if ((v72 & 1) != 0)
      {
        unsigned int v69 = diff_genseq(v65, v68);
        unsigned int v68 = v65 & 0xFFFFFF00;
      }

      else
      {
        v68 += 256;
      }
    }

uint64_t _pthread_ulock_cond_wait(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t v45 = a1;
  uint64_t v44 = a2;
  unsigned int v43 = a3;
  int v42 = a4;
  BOOL v41 = a4 == 2;
  uint64_t v40 = 0LL;
  if (*a3 || v43[1])
  {
    uint64_t v39 = 0LL;
    uint64_t v39 = v43[1] & 0x3FFFFFFF;
    uint64_t v38 = 0LL;
    BOOL v37 = 0;
    char v36 = 0;
    uint64_t v4 = *v43;
    BOOL v5 = *v43 < 0;
    if (*v43 < 0) {
      uint64_t v4 = -v4;
    }
    uint64_t v6 = ((unint64_t)v4 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
    uint64_t v7 = 1000000000 * v4;
    if (*v43 >= 0) {
      uint64_t v8 = 1000000000 * v4;
    }
    else {
      uint64_t v8 = -1000000000 * v4;
    }
    if (!v7) {
      BOOL v5 = 0;
    }
    if (v6) {
      BOOL v5 = 1;
    }
    uint64_t v38 = v8;
    BOOL v50 = v5;
    BOOL v37 = v5;
    BOOL v9 = __CFADD__(v39, v8);
    uint64_t v10 = v39 + v8;
    char v11 = v9;
    uint64_t v40 = v10;
    char v49 = v11;
    char v36 = v11 & 1;
    int v35 = v37 | v11 & 1;
    BOOL v48 = v35 != 0;
    if (v37 | v11 & 1) {
      uint64_t v40 = -1LL;
    }
  }

  BOOL v34 = 0LL;
  uint64_t v47 = v45;
  BOOL v34 = (unint64_t *)(v47 + 4LL * ((*(_DWORD *)(v47 + 12) >> 29) & 1) + 24);
  unint64_t v33 = 0LL;
  uint64_t v31 = 0x100000000LL;
  uint64_t v30 = 0x100000000LL;
  uint64_t v32 = 0x100000000LL;
  unint64_t v28 = 0LL;
  uint64_t v26 = 0x100000000LL;
  uint64_t v25 = 0x100000000LL;
  uint64_t v27 = 0x100000000LL;
  unint64_t v16 = *v34;
  do
  {
    unint64_t v12 = v16;
    do
      unint64_t v13 = __ldaxr(v34);
    while (v13 == v16 && __stlxr(v16 + v26, v34));
    unint64_t v16 = v13;
  }

  while (v13 != v12);
  unint64_t v24 = v13;
  unint64_t v28 = v13;
  unint64_t v23 = v13;
  unint64_t v29 = v13 + v32;
  unint64_t v33 = v13 + v32;
  unsigned int v22 = _pthread_mutex_ulock_unlock(v44);
  if (v22) {
    return _pthread_ulock_cond_wait_complete(v34, 0LL, v22);
  }
  while (1)
  {
    int v21 = 16777217;
    if (v41)
    {
      v20[0] = v45;
      v20[1] = v44;
      uint64_t v19 = 0LL;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unint64_t v51 = StatusReg;
      unint64_t v17 = StatusReg - 224;
      v18[0] = _pthread_ulock_cond_cleanup;
      v18[1] = v20;
      uint64_t v19 = *(void *)(StatusReg - 216);
      *(void *)(v17 + 8) = v18;
      unsigned int v22 = __ulock_wait2(16908289LL, v34, v33, v40, 0LL);
      pthread_testcancel();
      *(void *)(v17 + 8) = v19;
    }

    else
    {
      unsigned int v22 = __ulock_wait2(16777217LL, v34, v33, v40, 0LL);
    }

    if ((v22 & 0x80000000) == 0)
    {
      unsigned int v22 = 0;
      goto LABEL_36;
    }

    unsigned int v15 = -v22;
    if (v22 == -4)
    {
      unsigned int v22 = 0;
      return _pthread_ulock_cond_wait_complete(v34, v44, v22);
    }

    if (v15 != 14) {
      break;
    }
LABEL_36:
    if (*(_DWORD *)v34 != (_DWORD)v33) {
      return _pthread_ulock_cond_wait_complete(v34, v44, v22);
    }
  }

  if (v15 != 60)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
    qword_24058 = -v22;
    __break(1u);
    JUMPOUT(0xE30CLL);
  }

  unsigned int v22 = 60;
  return _pthread_ulock_cond_wait_complete(v34, v44, v22);
}

uint64_t _pthread_psynch_cond_wait(uint64_t a1, pthread_mutex_t *a2, void *a3, int a4)
{
  uint64_t v41 = a1;
  uint64_t v40 = a2;
  uint64_t v39 = a3;
  int v38 = a4;
  unsigned int v37 = 0;
  unsigned int v36 = 0;
  unsigned int v35 = 0;
  int v34 = 0;
  unsigned int v33 = 0;
  unsigned int v32 = 0;
  unsigned int v31 = 0;
  unsigned int v30 = 0;
  unsigned int v29 = 0;
  int v28 = 0;
  uint64_t v27 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v25 = 0LL;
  unint64_t v24 = 0LL;
  unint64_t v23 = 0LL;
  unint64_t v22 = 0LL;
  unint64_t v21 = 0LL;
  unint64_t v20 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v47 = a1;
  BOOL v46 = &v27;
  uint64_t v45 = (unint64_t **)&v26;
  uint64_t v44 = &v25;
  unsigned int v43 = &v24;
  if (((*(_DWORD *)(a1 + 12) >> 29) & 1) != 0)
  {
    *uint64_t v45 = (unint64_t *)(v47 + 28);
    *unsigned int v43 = (unsigned int *)(v47 + 32);
    os_unfair_lock_s *v44 = (unsigned int *)(v47 + 24);
  }

  else
  {
    *uint64_t v45 = (unint64_t *)(v47 + 24);
    *unsigned int v43 = (unsigned int *)(v47 + 28);
    os_unfair_lock_s *v44 = (unsigned int *)(v47 + 32);
  }

  *BOOL v46 = *v45;
  do
  {
    unsigned int v33 = *v26;
    unsigned int v32 = *v25;
    unsigned int v31 = *v24;
    unint64_t v23 = ((unint64_t)v31 << 32) | v33;
    int v28 = v31 & 3;
    unsigned int v29 = v31 & 0xFFFFFF00;
    unsigned int v30 = v33 + 256;
    unint64_t v22 = ((unint64_t)(v31 & 0xFFFFFF00) << 32) | (v33 + 256);
    unint64_t v18 = v23;
    BOOL v17 = 0;
    uint64_t v4 = v27;
    unint64_t v15 = v22;
    unint64_t v14 = v22;
    unint64_t v16 = v22;
    do
      unint64_t v5 = __ldaxr(v4);
    while (v5 == v23 && __stlxr(v22, v4));
    if (v5 != v23) {
      unint64_t v18 = v5;
    }
    BOOL v13 = v5 == v23;
    BOOL v17 = v5 == v23;
    BOOL v12 = v17;
  }

  while (v5 != v23);
  *(void *)(v41 + 16) = v40;
  unsigned int v11 = _pthread_mutex_droplock((uint64_t)v40, &v35, &v19, &v37, &v36);
  if (v11)
  {
    return 22;
  }

  else
  {
    if ((v35 & 0x1000) != 0)
    {
      unint64_t v21 = v37 | ((unint64_t)v36 << 32);
    }

    else
    {
      uint64_t v19 = 0LL;
      unint64_t v21 = 0LL;
    }

    v35 &= ~0x2000u;
    unint64_t v20 = v30 | ((unint64_t)(v29 | v28) << 32);
    if (v38 == 2)
    {
      uint64_t v10 = 0LL;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unint64_t v48 = StatusReg;
      unint64_t v8 = StatusReg - 224;
      v9[0] = _pthread_psynch_cond_cleanup;
      v9[1] = v41;
      uint64_t v10 = *(void *)(StatusReg - 216);
      *(void *)(v8 + 8) = v9;
      int v34 = __psynch_cvwait(v41, v20, v32, v19, v21, v35, *v39, v39[1]);
      pthread_testcancel();
      *(void *)(v8 + 8) = v10;
    }

    else
    {
      int v34 = __psynch_cvwait(v41, v20, v32, v19, v21, v35, *v39, v39[1]);
    }

    if (v34 == -1)
    {
      uint64_t v50 = 1LL;
      uint64_t v51 = 1LL;
      unint64_t v52 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v7 = **(_DWORD **)(v52 + 8);
      if (v7 == 4)
      {
        unsigned int v11 = 0;
      }

      else if (v7 == 60)
      {
        unsigned int v11 = 60;
      }

      else
      {
        unsigned int v11 = 22;
      }

      _pthread_cond_updateval(v41, (uint64_t)v40, v7, 0);
    }

    else if (v34)
    {
      _pthread_cond_updateval(v41, (uint64_t)v40, 0, v34);
    }

    pthread_mutex_lock(v40);
    return v11;
  }

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  *(_DWORD *)a1->__opaque = 0;
  BOOL v9 = (unsigned int *)a1;
  unint64_t v8 = a2;
  unsigned int v7 = 1129270852;
  uint64_t v6 = 0LL;
  uint64_t v5 = 0LL;
  uint64_t v4 = 0LL;
  unint64_t v3 = 0LL;
  *(void *)&a1->__opaque[8] = 0LL;
  v9[6] = 0;
  v9[7] = 0;
  v9[8] = 0;
  v9[3] &= 0xE0000000;
  v9[3] = v9[3] & 0xDFFFFFFF | (((((_BYTE)v9 + 24) & 7) != 0) << 29);
  unint64_t v14 = v9;
  BOOL v13 = &v6;
  BOOL v12 = &v5;
  unsigned int v11 = &v4;
  uint64_t v10 = &v3;
  if (((v9[3] >> 29) & 1) != 0)
  {
    *BOOL v12 = (uint64_t)(v14 + 7);
    void *v10 = v14 + 8;
    *unsigned int v11 = (uint64_t)(v14 + 6);
  }

  else
  {
    *BOOL v12 = (uint64_t)(v14 + 6);
    void *v10 = v14 + 7;
    *unsigned int v11 = (uint64_t)(v14 + 8);
  }

  uint64_t *v13 = *v12;
  *unint64_t v3 = 1;
  if (v8) {
    v9[3] = v9[3] & 0x3FFFFFFF | (*(_DWORD *)v8->__opaque << 30);
  }
  else {
    v9[3] = v9[3] & 0x3FFFFFFF | 0x80000000;
  }
  int result = 0;
  v9[1] = 0;
  atomic_store(v7, v9);
  return result;
}

BOOL is_seqhigher(int a1, int a2)
{
  unsigned int v4 = a1 & 0xFFFFFF00;
  unsigned int v3 = a2 & 0xFFFFFF00;
  if ((a1 & 0xFFFFFF00) <= (a2 & 0xFFFFFF00)) {
    return v3 - v4 > 0x7FFFFF80;
  }
  else {
    return v4 - v3 < 0x7FFFFF80;
  }
}

BOOL is_seqlower(int a1, int a2)
{
  unsigned int v4 = a1 & 0xFFFFFF00;
  unsigned int v3 = a2 & 0xFFFFFF00;
  if ((a1 & 0xFFFFFF00) >= (a2 & 0xFFFFFF00)) {
    return v4 - v3 > 0x7FFFFF80;
  }
  else {
    return v3 - v4 < 0x7FFFFF80;
  }
}

uint64_t diff_genseq(int a1, int a2)
{
  if ((a1 & 0xFFFFFF00) == (a2 & 0xFFFFFF00)) {
    return 0;
  }
  else {
    return (a1 & 0xFFFFFF00) - (a2 & 0xFFFFFF00);
  }
}

uint64_t _pthread_cond_updateval(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  int v23 = a3;
  int v22 = a4;
  int v21 = 0;
  int v20 = 0;
  unsigned int v19 = 0;
  unint64_t v18 = 0LL;
  unint64_t v17 = 0LL;
  unsigned int v16 = 0;
  unsigned int v15 = 0;
  unsigned int v14 = 0;
  BOOL v13 = 0LL;
  BOOL v12 = 0LL;
  unsigned int v11 = 0LL;
  uint64_t v10 = 0LL;
  if (a3)
  {
    int v22 = 256;
    if ((v23 & 0x100) != 0) {
      v22 |= 1u;
    }
    if ((v23 & 0x200) != 0) {
      v22 |= 2u;
    }
  }

  unsigned int v30 = (unsigned int *)v25;
  unsigned int v29 = (unsigned int **)&v13;
  int v28 = &v12;
  uint64_t v27 = &v11;
  uint64_t v26 = &v10;
  if (((*(_DWORD *)(v25 + 12) >> 29) & 1) != 0)
  {
    *int v28 = v30 + 7;
    *uint64_t v26 = v30 + 8;
    *uint64_t v27 = v30 + 6;
  }

  else
  {
    *int v28 = v30 + 6;
    *uint64_t v26 = v30 + 7;
    *uint64_t v27 = v30 + 8;
  }

  *unsigned int v29 = *v28;
  do
  {
    unsigned int v16 = *v12;
    unsigned int v15 = *v11;
    unsigned int v14 = *v10;
    unsigned int v19 = 0;
    int v21 = 0;
    uint64_t result = diff_genseq(v16, v14);
    int v20 = result;
    unint64_t v18 = (unint64_t)v14 << 32;
    v18 |= v16;
    if ((_DWORD)result || (v22 & 2) != 0)
    {
      unsigned int v19 = (v14 & 0xFFFFFF00) + (v22 & 0xFFFFFF00);
      v19 |= v14 & 3 | v22 & 3;
      if ((v19 & 0xFFFFFF00) == (v16 & 0xFFFFFF00) && (v19 & 3) == 3)
      {
        v19 &= ~2u;
        int v21 = 1;
      }

      unint64_t v17 = (unint64_t)v19 << 32;
      v17 |= v16;
    }

    else
    {
      unint64_t v17 = v18;
    }

    uint64_t v5 = v13;
    unint64_t v6 = v18;
    unint64_t v7 = v17;
    do
      unint64_t v8 = __ldaxr(v5);
    while (v8 == v6 && __stlxr(v7, v5));
  }

  while (v8 != v6);
  if (v20 && (v19 & 0xFFFFFF00) == (v16 & 0xFFFFFF00)) {
    *(void *)(v25 + 16) = 0LL;
  }
  if (v21)
  {
    unsigned int v9 = 0;
    if (*(_DWORD *)(v25 + 12) >> 30 == 1) {
      unsigned int v9 = 16;
    }
    return __psynch_cvclrprepost(v25, v16, v15, v19, 0LL, v16, v9);
  }

  return result;
}

uint64_t _pthread_cond_check_init_slow(uint64_t a1, unsigned int *a2)
{
  uint64_t v31 = a1 + 8;
  unsigned int v30 = 327680;
  unsigned int v29 = 0;
  uint64_t v32 = 3LL;
  uint64_t v33 = 3LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v29 = *(void *)(StatusReg + 24);
  unsigned int v28 = 0;
  unsigned int v27 = v29;
  unint64_t v2 = (unsigned int *)(a1 + 8);
  unsigned int v26 = v29;
  do
    unsigned int v3 = __ldaxr(v2);
  while (!v3 && __stlxr(v29, v2));
  if (v3) {
    unsigned int v28 = v3;
  }
  BOOL v25 = v3 == 0;
  if (v3) {
    os_unfair_lock_lock_with_options(v31, v30);
  }
  unsigned int v9 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 1018212795)
  {
    unsigned int v4 = *a2;
    unsigned int v19 = (unsigned int *)a1;
    uint64_t v18 = 0LL;
    unsigned int v17 = v4;
    uint64_t v16 = 0LL;
    uint64_t v15 = 0LL;
    uint64_t v14 = 0LL;
    BOOL v13 = 0LL;
    *(void *)(a1 + 16) = 0LL;
    v19[6] = 0;
    v19[7] = 0;
    v19[8] = 0;
    v19[3] &= 0xE0000000;
    v19[3] = v19[3] & 0xDFFFFFFF | (((((_BYTE)v19 + 24) & 7) != 0) << 29);
    uint64_t v24 = v19;
    int v23 = &v16;
    int v22 = &v15;
    int v21 = &v14;
    int v20 = &v13;
    if ((v19[3] & 0x20000000) != 0)
    {
      *int v22 = (uint64_t)(v24 + 7);
      *int v20 = v24 + 8;
      *int v21 = (uint64_t)(v24 + 6);
    }

    else
    {
      *int v22 = (uint64_t)(v24 + 6);
      *int v20 = v24 + 7;
      *int v21 = (uint64_t)(v24 + 8);
    }

    *int v23 = *v22;
    _DWORD *v13 = 1;
    if (v18) {
      v19[3] = v19[3] & 0x3FFFFFFF | (*(_DWORD *)(v18 + 8) << 30);
    }
    else {
      v19[3] = v19[3] & 0x3FFFFFFF | 0x80000000;
    }
    v19[1] = 0;
    atomic_store(v17, v19);
    unsigned int v10 = 0;
  }

  else
  {
    uint64_t v50 = (unsigned int *)a1;
    unsigned int v49 = v9;
    unint64_t v48 = a2;
    int v47 = 0;
    if (v9 == 1129270852)
    {
      if (*v48 != 1129270852)
      {
        unsigned int v46 = 0;
        unsigned int v46 = *v48;
        unsigned int v45 = v46;
        *uint64_t v50 = v46;
        unsigned int v44 = v46;
      }
    }

    else if (v49 - 1129270853 < 2)
    {
      if (*v48 == 1129270852)
      {
        *unint64_t v48 = v49;
      }

      else if (*v48 != v49)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xF570LL);
      }
    }

    else
    {
      int v47 = 22;
    }

    unsigned int v10 = v47;
  }

  os_unfair_lock_t v40 = (os_unfair_lock_t)(a1 + 8);
  unsigned int v39 = 0;
  uint64_t v41 = 3LL;
  uint64_t v42 = 3LL;
  unint64_t v43 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v39 = *(void *)(v43 + 24);
  int v38 = 0;
  unsigned int v37 = v39;
  uint64_t v5 = (unsigned int *)(a1 + 8);
  int v36 = 0;
  unsigned int v6 = v39;
  do
    unsigned int v7 = __ldaxr(v5);
  while (v7 == v6 && __stlxr(0, v5));
  if (v7 != v6) {
    unsigned int v37 = v7;
  }
  BOOL v35 = v7 == v6;
  if (v7 != v6) {
    os_unfair_lock_unlock(v40);
  }
  return v10;
}

uint64_t _pthread_ulock_cond_wait_complete(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  if (a2) {
    _pthread_mutex_ulock_lock(a2, 0);
  }
  do
  {
    if (_os_atomic_mo_has_acquire(2)) {
      unint64_t v3 = __ldaxr(a1);
    }
    else {
      unint64_t v3 = __ldxr(a1);
    }
    LODWORD(v6) = v3;
    WORD2(v6) = WORD2(v3) - 1;
    if (HIWORD(v3)) {
      __int16 v5 = HIWORD(v3) - 1;
    }
    else {
      __int16 v5 = 0;
    }
    HIWORD(v6) = v5;
    if (_os_atomic_mo_has_release(2)) {
      BOOL v7 = __stlxr(v6, a1) == 0;
    }
    else {
      BOOL v7 = __stxr(v6, a1) == 0;
    }
  }

  while (!v7);
  return a3;
}

uint64_t _pthread_ulock_cond_cleanup(uint64_t *a1)
{
  return pthread_cond_signal((pthread_cond_t *)*a1);
}

uint64_t _pthread_psynch_cond_cleanup(uint64_t result)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (*(_BYTE *)(StatusReg - 59))
  {
    BOOL v1 = *(pthread_mutex_t **)(result + 16);
    uint64_t result = _pthread_cond_updateval(result, (uint64_t)v1, *(_DWORD *)(StatusReg - 56), 0);
    if (v1) {
      return pthread_mutex_lock(v1);
    }
  }

  return result;
}

_BYTE *_pthread_mutex_global_init(uint64_t a1, uint64_t a2)
{
  int v9 = 2;
  if (*(_DWORD *)(a2 + 44))
  {
    int v8 = *(unsigned __int8 *)(a2 + 44);
    if (_pthread_mutex_policy_validate(v8)) {
      int v9 = _pthread_mutex_policy_to_opt(v8);
    }
  }

  unint64_t v6 = (char *)_simple_getenv(a1, "PTHREAD_MUTEX_DEFAULT_POLICY");
  if (v6)
  {
    int v5 = *v6 - 48;
    if (_pthread_mutex_policy_validate(v5)) {
      int v9 = _pthread_mutex_policy_to_opt(v5);
    }
  }

  if (v9 != __pthread_mutex_default_opt_policy) {
    __pthread_mutex_default_opt_policy = v9;
  }
  BOOL v4 = 0;
  BOOL v7 = (_BYTE *)_simple_getenv(a1, "PTHREAD_MUTEX_USE_ULOCK");
  if (v7)
  {
    BOOL v4 = *v7 == 49;
  }

  else if (*(_DWORD *)(a2 + 44))
  {
    BOOL v4 = (*(_DWORD *)(a2 + 44) & 0x100) != 0;
  }

  if (v4 != (__pthread_mutex_use_ulock & 1)) {
    __pthread_mutex_use_uos_unfair_lock_t lock = v4;
  }
  BOOL v3 = 0;
  uint64_t result = (_BYTE *)_simple_getenv(a1, "PTHREAD_MUTEX_ADAPTIVE_SPIN");
  if (result)
  {
    BOOL v3 = *result == 49;
  }

  else if (*(_DWORD *)(a2 + 44))
  {
    BOOL v3 = (*(_DWORD *)(a2 + 44) & 0x200) != 0;
  }

  if (v3 != (__pthread_mutex_ulock_adaptive_spin & 1)) {
    __pthread_mutex_ulock_adaptive_spin = v3;
  }
  return result;
}

BOOL _pthread_mutex_policy_validate(int a1)
{
  BOOL v2 = 0;
  if (a1 >= 0) {
    return a1 < 4;
  }
  return v2;
}

uint64_t _pthread_mutex_policy_to_opt(int a1)
{
  if (a1 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

BOOL mutex_seq_atomic_cmpxchgv_relaxed(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v7 = *a2;
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  do
    unint64_t v5 = __ldaxr(a1);
  while (v5 == v3 && __stlxr(v4, a1));
  if (v5 != v3) {
    unint64_t v7 = v5;
  }
  *a2 = v7;
  return v5 == v3;
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  *(_DWORD *)a1->__opaque = 0;
  BOOL v13 = a1;
  BOOL v12 = a2;
  int v11 = 7;
  *(_DWORD *)&a1->__opaque[4] = 0;
  *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFDFFF | 0x2000;
  if (v12)
  {
    if (v12->__sig == 1297373249)
    {
      *(_WORD *)&v13->__opaque[8] = *(_DWORD *)v12->__opaque;
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFFFC | *(_DWORD *)&v12->__opaque[4] & 3;
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFE3F | (((*(_DWORD *)&v12->__opaque[4] >> 6) & 7) << 6);
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFFF3 | (4
                                                                                * ((*(_DWORD *)&v12->__opaque[4] >> 2) & 3));
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFFCF | (16
                                                                                * ((*(_DWORD *)&v12->__opaque[4] >> 4) & 3));
      *(_WORD *)&v13->__opaque[10] = 0;
      uint64_t v10 = 1297437784LL;
      if (((*(_DWORD *)&v13->__opaque[4] >> 2) & 3) == 0)
      {
        unsigned int v19 = v13;
        if (((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) == 1
          || (int v20 = v13, ((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) == 2))
        {
          uint64_t v10 = _pthread_mutex_sig_fast;
        }
      }

      if (((*(_DWORD *)&v13->__opaque[4] >> 2) & 3) == 0
        && ((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) == 2
        && ((*(_DWORD *)&v13->__opaque[4] >> 4) & 3) == 2
        && v10 == _pthread_mutex_sig_fast)
      {
        *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFBFFF | ((__pthread_mutex_use_ulock & 1) << 14);
      }

      else
      {
        *(_DWORD *)&v13->__opaque[4] &= ~0x4000u;
      }

      if (((*(_DWORD *)&v13->__opaque[4] >> 14) & 1) != 0)
      {
        BOOL v2 = v13;
        *(void *)&v13->__opaque[16] = -1LL;
        *(void *)&v2->__opaque[24] = -1LL;
        *(void *)&v2->__opaque[32] = -1LL;
        int v9 = 0;
        *(_DWORD *)&v13->__opaque[16] = 0;
      }

      else
      {
        uint64_t v16 = v13;
        uint64_t v15 = &v8;
        int v8 = (void *)((unint64_t)&v13->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
        uint64_t v18 = v13;
        unsigned int v17 = &v7;
        unint64_t v7 = (char *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
        if (v7 != &v13->__opaque[16])
        {
          *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFF7FF | 0x800;
          *(void *)&v13->__opaque[16] = -1LL;
        }

        *(void *)&v13->__opaque[32] = -1LL;
        *(void *)unint64_t v7 = 0LL;
        *int v8 = 0LL;
      }

      int v6 = v10;
      *(void *)&v13->__opaque[40] = ~(unint64_t)v13;
      *(_DWORD *)&v13->__opaque[48] = v6;
      *(_DWORD *)&v13->__opaque[52] = v6;
      *(_DWORD *)&v13->__opaque[12] = v6;
      unint64_t v5 = (unsigned int *)v13;
      HIDWORD(v13->__sig) = HIDWORD(v10);
      atomic_store(v10, v5);
      return 0;
    }

    else
    {
      return 22;
    }
  }

  else
  {
    unint64_t v4 = (v11 - 1);
    if (v4 <= 6) {
      __asm { BR              X8 }
    }

    return 22;
  }

int pthread_mutex_getprioceiling(const pthread_mutex_t *a1, int *a2)
{
  int v7 = 22;
  if ((a1->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    os_unfair_lock_lock_with_options(a1->__opaque, 327680LL);
    *a2 = *(__int16 *)&a1->__opaque[8];
    int v7 = 0;
    opaque = (unsigned int *)a1->__opaque;
    int v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    do
      unsigned int v4 = __ldaxr(opaque);
    while (v4 == v3 && __stlxr(0, opaque));
    if (v4 != v3) {
      os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
    }
  }

  return v7;
}

int pthread_mutex_setprioceiling(pthread_mutex_t *a1, int a2, int *a3)
{
  int v7 = 22;
  if ((a1->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    os_unfair_lock_lock_with_options(a1->__opaque, 327680LL);
    if (a2 >= -999 && a2 <= 999)
    {
      *a3 = *(__int16 *)&a1->__opaque[8];
      *(_WORD *)&a1->__opaque[8] = a2;
      int v7 = 0;
    }

    opaque = (unsigned int *)a1->__opaque;
    int v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    do
      unsigned int v5 = __ldaxr(opaque);
    while (v5 == v4 && __stlxr(0, opaque));
    if (v5 != v4) {
      os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
    }
  }

  return v7;
}

int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = *(_DWORD *)a1->__opaque;
    return 0;
  }

  return v3;
}

int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = *(_DWORD *)&a1->__opaque[4] & 3;
    return 0;
  }

  return v3;
}

int pthread_mutexattr_getpolicy_np(const pthread_mutexattr_t *a1, int *a2)
{
  int v4 = 22;
  if (a1->__sig == 1297373249)
  {
    int v3 = (*(_DWORD *)&a1->__opaque[4] >> 6) & 7;
    if (v3 == 1)
    {
      *a2 = 1;
      return 0;
    }

    else if (v3 == 2)
    {
      *a2 = 3;
      return 0;
    }
  }

  return v4;
}

int pthread_mutexattr_gettype(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = (*(_DWORD *)&a1->__opaque[4] >> 2) & 3;
    return 0;
  }

  return v3;
}

int pthread_mutexattr_getpshared(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = (*(_DWORD *)&a1->__opaque[4] >> 4) & 3;
    return 0;
  }

  return v3;
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  int result = 0;
  *(_DWORD *)a1->__opaque = 0;
  *(_DWORD *)&a1->__opaque[4] &= 0xFFFFFFFC;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | ((__pthread_mutex_default_opt_policy & 7) << 6);
  *(_DWORD *)&a1->__opaque[4] &= 0xFFFFFFF3;
  a1->__unsigned int sig = 1297373249LL;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | 0x20;
  return result;
}

int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && a2 >= -999 && a2 <= 999)
  {
    *(_DWORD *)a1->__opaque = a2;
    return 0;
  }

  return v3;
}

int pthread_mutexattr_setprotocol(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && a2 <= 2)
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFFC | a2 & 3;
    return 0;
  }

  return v3;
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    if (a2 == 1)
    {
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | 0x40;
      return 0;
    }

    else if (a2 == 3)
    {
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | 0x80;
      return 0;
    }
  }

  return v3;
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && a2 <= 2)
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFF3 | (4 * (a2 & 3));
    return 0;
  }

  return v3;
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | (16 * (a2 & 3));
    return 0;
  }

  return v3;
}

uint64_t _pthread_mutex_fairshare_lock_slow(uint64_t a1, char a2)
{
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  int v15 = 0;
  int v14 = 0;
  uint64_t v29 = a1;
  unsigned int v28 = &v13;
  BOOL v13 = (uint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v12 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v31 = v13;
  unsigned int v30 = &v12;
  uint64_t v12 = *v13;
  uint64_t v33 = a1;
  uint64_t v32 = &v10;
  uint64_t v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg - 8);
  uint64_t v40 = a1;
  char v39 = a2 & 1;
  int v38 = v10;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v37 = 0LL;
    unint64_t v44 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v37 = *(void *)(v44 - 8);
    uint64_t v36 = 0LL;
    uint64_t v35 = *v38;
    uint64_t v36 = v35;
    uint64_t v34 = v35;
    if (v35 == v37)
    {
      uint64_t v42 = v40;
      if (((*(_DWORD *)(v40 + 12) >> 2) & 3) == 2)
      {
        if (HIWORD(*(_DWORD *)(v40 + 12)) == 0xFFFF)
        {
          int v41 = -35;
        }

        else
        {
          *(_DWORD *)(v40 + 12) = *(unsigned __int16 *)(v40 + 12) | ((unsigned __int16)(HIWORD(*(_DWORD *)(v40 + 12)) + 1) << 16);
          int v41 = HIWORD(*(_DWORD *)(v40 + 12));
        }
      }

      else if ((v39 & 1) != 0)
      {
        int v41 = -16;
      }

      else
      {
        int v41 = -11;
      }
    }

    else
    {
      int v41 = 0;
    }
  }

  else
  {
    int v41 = 0;
  }

  int v15 = v41;
  if (v41 <= 0)
  {
    if (v15 >= 0)
    {
      do
      {
        uint64_t v11 = v12;
        uint64_t v9 = *v10;
        BOOL v7 = (v12 & 2) == 0;
        if ((v16 & 1) == 0 || (v12 & 2) == 0)
        {
          LODWORD(v11) = v11 + 256;
          LODWORD(v11) = v11 | 3;
        }

        unsigned int v27 = v13;
        unsigned int v26 = &v12;
        BOOL v25 = &v11;
        uint64_t v24 = v12;
        BOOL v23 = 0;
        BOOL v2 = (unint64_t *)v13;
        uint64_t v21 = v11;
        uint64_t v20 = v11;
        uint64_t v22 = v11;
        uint64_t v3 = v12;
        unint64_t v4 = v11;
        do
          unint64_t v5 = __ldaxr(v2);
        while (v5 == v3 && __stlxr(v4, v2));
        if (v5 != v3) {
          uint64_t v24 = v5;
        }
        BOOL v19 = v5 == v3;
        BOOL v23 = v5 == v3;
        *unsigned int v26 = v24;
        BOOL v18 = v23;
      }

      while (!v23);
      if (v7)
      {
        uint64_t *v10 = v8;
        int v15 = 0;
      }

      else if ((v16 & 1) != 0)
      {
        int v15 = 16;
      }

      else
      {
        int v15 = _pthread_mutex_fairshare_lock_wait(v17, v11, v9);
      }

      if (!v15)
      {
        uint64_t v43 = v17;
        if (((*(_DWORD *)(v17 + 12) >> 2) & 3) == 2) {
          *(_DWORD *)(v17 + 12) = *(unsigned __int16 *)(v17 + 12) | 0x10000;
        }
      }
    }

    else
    {
      return -v15;
    }
  }

  else
  {
    int v14 = 1;
    return 0;
  }

  return v15;
}

uint64_t _pthread_mutex_fairshare_lock_wait(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a2;
  uint64_t v12 = a1;
  uint64_t v11 = a3;
  uint64_t v15 = a1;
  int v14 = &v10;
  uint64_t v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v9 = *(void *)(StatusReg - 8);
  do
  {
    do
    {
      int v8 = __psynch_mutexwait(v12, v13, HIDWORD(v13), v11, *(unsigned int *)(v12 + 12));
      uint64_t v11 = *v10;
    }

    while (v8 == -1);
    uint64_t v27 = v12;
    uint64_t v26 = v9;
    BOOL v25 = 0;
    uint64_t v44 = v12;
    BOOL v25 = ((*(_DWORD *)(v12 + 12) >> 6) & 7) == 2;
    BOOL v24 = 1;
    uint64_t v39 = v12;
    int v38 = &v23;
    BOOL v23 = (unint64_t *)((v12 + 39) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v22 = 0LL;
    unint64_t v21 = 0LL;
    int v41 = v23;
    uint64_t v40 = &v22;
    unint64_t v22 = *v23;
    uint64_t v43 = v12;
    uint64_t v42 = &v20;
    uint64_t v20 = (void *)((v12 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    do
    {
      unint64_t v21 = v22;
      if (v25)
      {
        BOOL v24 = (v22 & 2) == 0;
      }

      else if ((v22 & 3) == 3)
      {
        break;
      }

      LODWORD(v21) = v21 | 3;
      uint64_t v37 = v23;
      uint64_t v36 = &v22;
      uint64_t v35 = &v21;
      unint64_t v34 = v22;
      BOOL v33 = 0;
      uint64_t v3 = v23;
      unint64_t v31 = v21;
      unint64_t v30 = v21;
      unint64_t v32 = v21;
      unint64_t v4 = v22;
      unint64_t v5 = v21;
      do
        unint64_t v6 = __ldaxr(v3);
      while (v6 == v4 && __stlxr(v5, v3));
      if (v6 != v4) {
        unint64_t v34 = v6;
      }
      BOOL v29 = v6 == v4;
      BOOL v33 = v6 == v4;
      unint64_t *v36 = v34;
      BOOL v28 = v33;
    }

    while (!v33);
    if (v24)
    {
      uint64_t v19 = v26;
      uint64_t v18 = v26;
      *uint64_t v20 = v26;
      uint64_t v17 = v19;
    }
  }

  while (!v24);
  return 0LL;
}

uint64_t _pthread_mutex_fairshare_unlock_slow(uint64_t a1)
{
  uint64_t v15 = a1;
  unsigned int v14 = 0;
  uint64_t v13 = 0LL;
  unsigned int v12 = 0;
  uint64_t v44 = a1;
  uint64_t v43 = &v12;
  uint64_t v42 = 0LL;
  int v41 = &v13;
  uint64_t v40 = (_DWORD *)&v13 + 1;
  unsigned int v39 = 0;
  unsigned int v39 = *(_DWORD *)(a1 + 12);
  v39 &= ~0x1000u;
  uint64_t v57 = a1;
  int v56 = &v38;
  int v38 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v37 = 0LL;
  unint64_t v36 = 0LL;
  int v59 = v38;
  int v58 = &v37;
  unint64_t v37 = *v38;
  uint64_t v61 = a1;
  int v60 = &v35;
  uint64_t v35 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v34 = 0LL;
  uint64_t v33 = 0LL;
  int v32 = 0;
  uint64_t v67 = a1;
  unint64_t v66 = v35;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v65 = 0LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v65 = *(void *)(StatusReg - 8);
    uint64_t v64 = 0LL;
    uint64_t v63 = *v66;
    uint64_t v64 = v63;
    uint64_t v62 = v63;
    if (v63 == v65)
    {
      uint64_t v69 = v67;
      int v68 = ((*(_DWORD *)(v67 + 12) >> 2) & 3) == 2
         && (int v1 = HIWORD(*(_DWORD *)(v67 + 12)),
             *(_DWORD *)(v67 + 12) = *(unsigned __int16 *)(v67 + 12) | ((unsigned __int16)(v1 - 1) << 16),
             (_WORD)v1 != 1);
    }

    else
    {
      int v68 = -1;
    }
  }

  else
  {
    int v68 = 0;
  }

  int v32 = v68;
  if (v68 <= 0)
  {
    if (v32 >= 0)
    {
      char v31 = 0;
      char v30 = 0;
      do
      {
        unint64_t v36 = v37;
        unint64_t v29 = 0LL;
        unint64_t v28 = *v35;
        unint64_t v29 = v28;
        unint64_t v27 = v28;
        unint64_t v34 = v28;
        char v31 = 0;
        char v30 = 0;
        int v26 = 0;
        int v26 = diff_genseq(v37, SHIDWORD(v37));
        if (v26)
        {
          HIDWORD(v36) += 256;
          if ((v37 & 0xFFFFFF00) == (HIDWORD(v36) & 0xFFFFFF00))
          {
            LODWORD(v36) = v36 & 0xFFFFFFFC;
            char v31 = 1;
            uint64_t v33 = 0LL;
          }

          else
          {
            uint64_t v33 = -1LL;
            v39 |= 0x1000u;
          }

          if (v33 != v34)
          {
            unint64_t v25 = v34;
            BOOL v24 = 0;
            BOOL v2 = (unint64_t *)v35;
            uint64_t v22 = v33;
            uint64_t v21 = v33;
            uint64_t v23 = v33;
            unint64_t v3 = v34;
            unint64_t v4 = v33;
            do
              unint64_t v5 = __ldaxr(v2);
            while (v5 == v3 && __stlxr(v4, v2));
            if (v5 != v3) {
              unint64_t v25 = v5;
            }
            BOOL v20 = v5 == v3;
            BOOL v24 = v5 == v3;
            BOOL v19 = v24;
            if (v5 != v3) {
              _pthread_mutex_corruption_abort();
            }
          }
        }

        else
        {
          char v30 = 1;
        }

        if ((v31 & 1) != 0 || (v30 & 1) != 0) {
          v39 &= ~0x1000u;
        }
        char v55 = v38;
        unint64_t v54 = &v37;
        BOOL v53 = &v36;
        unint64_t v52 = v37;
        BOOL v51 = 0;
        unint64_t v6 = v38;
        unint64_t v49 = v36;
        unint64_t v48 = v36;
        unint64_t v50 = v36;
        unint64_t v7 = v37;
        unint64_t v8 = v36;
        do
          unint64_t v9 = __ldaxr(v6);
        while (v9 == v7 && __stlxr(v8, v6));
        if (v9 != v7) {
          unint64_t v52 = v9;
        }
        BOOL v47 = v9 == v7;
        BOOL v51 = v9 == v7;
        *unint64_t v54 = v52;
        BOOL v46 = v51;
      }

      while (!v51);
      if (v41) {
        *(_DWORD *)int v41 = v36;
      }
      if (v40) {
        *uint64_t v40 = HIDWORD(v36);
      }
      if (v42) {
        *uint64_t v42 = v44;
      }
      if (v43) {
        *uint64_t v43 = v39;
      }
      int v45 = 0;
    }

    else
    {
      int v45 = -v32;
    }
  }

  else
  {
    if (v43) {
      *uint64_t v43 = v39;
    }
    int v45 = 0;
  }

  unsigned int v14 = v45;
  if (v45)
  {
    return v14;
  }

  else if ((v12 & 0x1000) != 0)
  {
    return _pthread_mutex_fairshare_unlock_drop(v15, v13, v12);
  }

  else
  {
    uint64_t v18 = v15;
    uint64_t v17 = &v11;
    unint64_t v11 = (v15 + 31) & 0xFFFFFFFFFFFFFFF8LL;
    return 0;
  }

uint64_t _pthread_mutex_fairshare_unlock_drop(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v9 = a2;
  uint64_t v8 = a1;
  unsigned int v7 = a3;
  int v6 = 0;
  int v5 = 0;
  uint64_t v12 = a1;
  unint64_t v11 = &v4;
  unint64_t v4 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  int v5 = __psynch_mutexdrop(a1, a2, HIDWORD(a2), *v4, a3);
  if (v5 == -1)
  {
    uint64_t v13 = 1LL;
    uint64_t v14 = 1LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v6 = **(_DWORD **)(StatusReg + 8);
    if (v6 == 4) {
      int v6 = 0;
    }
    if (v6)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_24058 = v6;
      __break(1u);
      JUMPOUT(0x11C18LL);
    }

    return 0;
  }

  else
  {
    return 0;
  }

uint64_t _pthread_mutex_ulock_lock(uint64_t a1, char a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(void *)(StatusReg + 24) & 0xFFFFFFFC;
  unsigned int v7 = 0;
  BOOL v2 = (unsigned int *)(a1 + 24);
  uint64_t v3 = *(void *)(StatusReg + 24) & 0xFFFFFFFCLL;
  do
    unsigned int v4 = __ldaxr(v2);
  while (!v4 && __stlxr(v3, v2));
  if (v4) {
    unsigned int v7 = v4;
  }
  unsigned int v6 = 0;
  if (v4)
  {
    if ((a2 & 1) != 0) {
      return 16;
    }
    else {
      return _pthread_mutex_ulock_lock_slow(a1, v8, v7);
    }
  }

  return v6;
}

uint64_t _pthread_mutex_ulock_lock_slow(uint64_t a1, unsigned int a2, unsigned int a3)
{
  char v18 = 0;
  unsigned int v17 = 16777218;
  if ((__pthread_mutex_ulock_adaptive_spin & 1) != 0) {
    unsigned int v17 = 17039362;
  }
  do
  {
    char v16 = 0;
    do
    {
      unsigned int v15 = a3 & 0xFFFFFFFC;
      if ((v16 & 1) != 0)
      {
        unsigned int v15 = -4;
        char v16 = 0;
      }

      unsigned int v14 = a3;
      uint64_t v3 = (unsigned int *)(a1 + 24);
      do
        unsigned int v4 = __ldaxr(v3);
      while (v4 == a3 && __stlxr(v15 | 1, v3));
      BOOL v10 = v4 == a3;
      if (v4 != a3) {
        unsigned int v14 = v4;
      }
      a3 = v14;
      if (v10)
      {
        int v13 = __ulock_wait(v17, a1 + 24, v15 | 1);
        if ((v13 & 0x80000000) == 0)
        {
          if (v13 >= 1) {
            char v18 = 1;
          }
LABEL_21:
          a3 = *(_DWORD *)(a1 + 24);
          continue;
        }

        int v9 = -v13;
        if (v13 == -4 || v9 == 14) {
          goto LABEL_21;
        }
        if (v9 != 105)
        {
          qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
          qword_24058 = v13;
          __break(1u);
          JUMPOUT(0x12030LL);
        }

        char v16 = 1;
      }
    }

    while (a3);
    unsigned int v12 = a2;
    if ((v18 & 1) != 0) {
      unsigned int v12 = a2 | 1;
    }
    unsigned int v11 = 0;
    int v5 = (unsigned int *)(a1 + 24);
    do
      unsigned int v6 = __ldaxr(v5);
    while (v6 == a3 && __stlxr(v12, v5));
    BOOL v8 = v6 == a3;
    if (v6 != a3) {
      unsigned int v11 = v6;
    }
    a3 = v11;
  }

  while (!v8);
  return 0LL;
}

uint64_t _pthread_mutex_ulock_unlock(uint64_t a1)
{
  int v7 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  int v5 = *(_DWORD *)(a1 + 24);
  do
  {
    int v1 = v5;
    unsigned int v4 = (unsigned int *)(a1 + 24);
    do
      int v2 = __ldaxr(v4);
    while (v2 == v5 && __stlxr(0, v4));
    int v5 = v2;
  }

  while (v2 != v1);
  unsigned int v6 = 0;
  if (v2 != v7) {
    return _pthread_mutex_ulock_unlock_slow(a1, v7, v2);
  }
  return v6;
}

uint64_t _pthread_mutex_ulock_unlock_slow(uint64_t a1, int a2, int a3)
{
  if (a3)
  {
    int v5 = 0;
    if ((a3 & 0xFFFFFFFC) == a2)
    {
      if ((a3 & 1) == 0)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: unlock_slow without orig_waiters";
        __break(1u);
        JUMPOUT(0x123B8LL);
      }
    }

    else
    {
      if ((a3 & 1) == 0) {
        return 0LL;
      }
      int v5 = 1024;
    }

    while (1)
    {
      int v4 = __ulock_wake(v5 | 0x1000002u, a1 + 24, 0LL);
      if ((v4 & 0x80000000) == 0 || v4 == -2) {
        break;
      }
      if (-v4 != 4)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
        qword_24058 = -v4;
        __break(1u);
        JUMPOUT(0x12480LL);
      }
    }
  }

  return 0LL;
}

uint64_t _pthread_mutex_firstfit_unlock_slow(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = 0LL;
  unsigned int v10 = 0;
  uint64_t v36 = a1;
  uint64_t v35 = &v10;
  unint64_t v34 = 0LL;
  uint64_t v33 = &v11;
  int v32 = (_DWORD *)&v11 + 1;
  unsigned int v31 = 0;
  unsigned int v31 = *(_DWORD *)(a1 + 12) & 0xFFFFEFFF;
  BOOL v30 = 0;
  uint64_t v49 = a1;
  unint64_t v48 = &v29;
  unint64_t v29 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v28 = 0LL;
  unint64_t v27 = 0LL;
  BOOL v51 = v29;
  unint64_t v50 = &v28;
  unint64_t v28 = *v29;
  uint64_t v53 = a1;
  unint64_t v52 = &v26;
  int v26 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v25 = 0LL;
  int v24 = 0;
  uint64_t v59 = a1;
  int v58 = v26;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v57 = 0LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v57 = *(void *)(StatusReg - 8);
    uint64_t v56 = 0LL;
    uint64_t v55 = *v58;
    uint64_t v56 = v55;
    uint64_t v54 = v55;
    if (v55 == v57)
    {
      uint64_t v61 = v59;
      int v60 = ((*(_DWORD *)(v59 + 12) >> 2) & 3) == 2
         && (int v1 = HIWORD(*(_DWORD *)(v59 + 12)),
             *(_DWORD *)(v59 + 12) = *(unsigned __int16 *)(v59 + 12) | ((unsigned __int16)(v1 - 1) << 16),
             (_WORD)v1 != 1);
    }

    else
    {
      int v60 = -1;
    }
  }

  else
  {
    int v60 = 0;
  }

  int v24 = v60;
  if (v60 <= 0)
  {
    if (v24 >= 0)
    {
      do
      {
        unint64_t v27 = v28;
        unint64_t v23 = 0LL;
        unint64_t v22 = *v26;
        unint64_t v23 = v22;
        unint64_t v21 = v22;
        unint64_t v25 = v22;
        BOOL v30 = (int)diff_genseq(v28, SHIDWORD(v28)) > 0;
        LODWORD(v27) = v27 & 0xFFFFFFFD;
        if (v30) {
          HIDWORD(v27) += 256;
        }
        if (v25)
        {
          unint64_t v20 = v25;
          BOOL v19 = 0;
          int v2 = (unint64_t *)v26;
          uint64_t v17 = 0LL;
          uint64_t v16 = 0LL;
          uint64_t v18 = 0LL;
          unint64_t v3 = v25;
          do
            unint64_t v4 = __ldaxr(v2);
          while (v4 == v3 && __stlxr(0LL, v2));
          if (v4 != v3) {
            unint64_t v20 = v4;
          }
          BOOL v15 = v4 == v3;
          BOOL v19 = v4 == v3;
          BOOL v14 = v19;
          if (v4 != v3) {
            _pthread_mutex_corruption_abort();
          }
        }

        BOOL v47 = v29;
        BOOL v46 = &v28;
        int v45 = &v27;
        unint64_t v44 = v28;
        BOOL v43 = 0;
        int v5 = v29;
        unint64_t v41 = v27;
        unint64_t v40 = v27;
        unint64_t v42 = v27;
        unint64_t v6 = v28;
        unint64_t v7 = v27;
        do
          unint64_t v8 = __ldaxr(v5);
        while (v8 == v6 && __stlxr(v7, v5));
        if (v8 != v6) {
          unint64_t v44 = v8;
        }
        BOOL v39 = v8 == v6;
        BOOL v43 = v8 == v6;
        *BOOL v46 = v44;
        BOOL v38 = v43;
      }

      while (!v43);
      if (v30) {
        v31 |= 0x1000u;
      }
      if (v33) {
        *(_DWORD *)uint64_t v33 = v27;
      }
      if (v32) {
        _DWORD *v32 = HIDWORD(v27);
      }
      if (v34) {
        uint64_t *v34 = v36;
      }
      if (v35) {
        *uint64_t v35 = v31;
      }
      unsigned int v37 = 0;
    }

    else
    {
      unsigned int v37 = -v24;
    }
  }

  else
  {
    if (v35) {
      *uint64_t v35 = v31;
    }
    unsigned int v37 = 0;
  }

  if (v37)
  {
    return v37;
  }

  else if ((v10 & 0x1000) != 0)
  {
    return _pthread_mutex_firstfit_wake(v12, v11, v10);
  }

  else
  {
    return 0;
  }

uint64_t _pthread_mutex_firstfit_wake(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (__psynch_mutexdrop(a1, a2, HIDWORD(a2), 0LL, a3) == -1)
  {
    int v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v4 == 4) {
      int v4 = 0;
    }
    if (v4)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_24058 = v4;
      __break(1u);
      JUMPOUT(0x12B18LL);
    }
  }

  return 0LL;
}

uint64_t _pthread_mutex_firstfit_lock_slow(uint64_t a1, char a2)
{
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  int v15 = 0;
  int v14 = 0;
  uint64_t v29 = a1;
  unint64_t v28 = &v13;
  int v13 = (uint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v12 = 0LL;
  uint64_t v11 = 0LL;
  unsigned int v31 = v13;
  BOOL v30 = &v12;
  uint64_t v12 = *v13;
  uint64_t v33 = a1;
  int v32 = &v10;
  unsigned int v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg - 8);
  uint64_t v40 = a1;
  char v39 = a2 & 1;
  BOOL v38 = v10;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v37 = 0LL;
    unint64_t v44 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v37 = *(void *)(v44 - 8);
    uint64_t v36 = 0LL;
    uint64_t v35 = *v38;
    uint64_t v36 = v35;
    uint64_t v34 = v35;
    if (v35 == v37)
    {
      uint64_t v42 = v40;
      if (((*(_DWORD *)(v40 + 12) >> 2) & 3) == 2)
      {
        if (HIWORD(*(_DWORD *)(v40 + 12)) == 0xFFFF)
        {
          int v41 = -35;
        }

        else
        {
          *(_DWORD *)(v40 + 12) = *(unsigned __int16 *)(v40 + 12) | ((unsigned __int16)(HIWORD(*(_DWORD *)(v40 + 12)) + 1) << 16);
          int v41 = HIWORD(*(_DWORD *)(v40 + 12));
        }
      }

      else if ((v39 & 1) != 0)
      {
        int v41 = -16;
      }

      else
      {
        int v41 = -11;
      }
    }

    else
    {
      int v41 = 0;
    }
  }

  else
  {
    int v41 = 0;
  }

  int v15 = v41;
  if (v41 <= 0)
  {
    if (v15 >= 0)
    {
      do
      {
        uint64_t v11 = v12;
        uint64_t v9 = *v10;
        BOOL v7 = (v12 & 2) == 0;
        if ((v16 & 1) == 0 || (v12 & 2) == 0)
        {
          if ((v12 & 2) != 0) {
            LODWORD(v11) = v11 + 256;
          }
          else {
            LODWORD(v11) = v11 | 2;
          }
        }

        unint64_t v27 = v13;
        int v26 = &v12;
        unint64_t v25 = &v11;
        uint64_t v24 = v12;
        BOOL v23 = 0;
        int v2 = (unint64_t *)v13;
        uint64_t v21 = v11;
        uint64_t v20 = v11;
        uint64_t v22 = v11;
        uint64_t v3 = v12;
        unint64_t v4 = v11;
        do
          unint64_t v5 = __ldaxr(v2);
        while (v5 == v3 && __stlxr(v4, v2));
        if (v5 != v3) {
          uint64_t v24 = v5;
        }
        BOOL v19 = v5 == v3;
        BOOL v23 = v5 == v3;
        *int v26 = v24;
        BOOL v18 = v23;
      }

      while (!v23);
      if (v7)
      {
        uint64_t *v10 = v8;
        int v15 = 0;
      }

      else if ((v16 & 1) != 0)
      {
        int v15 = 16;
      }

      else
      {
        int v15 = _pthread_mutex_firstfit_lock_wait(v17, v11, v9);
      }

      if (!v15)
      {
        uint64_t v43 = v17;
        if (((*(_DWORD *)(v17 + 12) >> 2) & 3) == 2) {
          *(_DWORD *)(v17 + 12) = *(unsigned __int16 *)(v17 + 12) | 0x10000;
        }
      }
    }

    else
    {
      return -v15;
    }
  }

  else
  {
    int v14 = 1;
    return 0;
  }

  return v15;
}

uint64_t _pthread_mutex_firstfit_lock_wait(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v13[0] = a2;
  uint64_t v12 = a1;
  uint64_t v11 = a3;
  v13[2] = a1;
  v13[1] = &v10;
  unsigned int v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v9 = *(void *)(StatusReg - 8);
  do
  {
    do
    {
      int v8 = __psynch_mutexwait(v12, LODWORD(v13[0]), HIDWORD(v13[0]), v11, *(unsigned int *)(v12 + 12));
      uint64_t v11 = *v10;
    }

    while (v8 == -1);
    uint64_t v25 = v12;
    uint64_t v24 = v9;
    BOOL v23 = v13;
    BOOL v22 = 0;
    uint64_t v37 = v12;
    uint64_t v36 = &v21;
    uint64_t v21 = (unint64_t *)((v12 + 39) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v20 = 0LL;
    unint64_t v19 = 0LL;
    char v39 = v21;
    BOOL v38 = &v20;
    unint64_t v20 = *v21;
    uint64_t v41 = v12;
    uint64_t v40 = &v18;
    BOOL v18 = (void *)((v12 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    do
    {
      unint64_t v19 = v20;
      BOOL v22 = (v20 & 2) == 0;
      if ((v20 & 2) != 0) {
        LODWORD(v19) = v19 + 256;
      }
      else {
        LODWORD(v19) = v19 | 2;
      }
      uint64_t v35 = v21;
      uint64_t v34 = &v20;
      uint64_t v33 = &v19;
      unint64_t v32 = v20;
      BOOL v31 = 0;
      uint64_t v3 = v21;
      unint64_t v29 = v19;
      unint64_t v28 = v19;
      unint64_t v30 = v19;
      unint64_t v4 = v20;
      unint64_t v5 = v19;
      do
        unint64_t v6 = __ldaxr(v3);
      while (v6 == v4 && __stlxr(v5, v3));
      if (v6 != v4) {
        unint64_t v32 = v6;
      }
      BOOL v27 = v6 == v4;
      BOOL v31 = v6 == v4;
      unint64_t *v34 = v32;
      BOOL v26 = v31;
    }

    while (!v31);
    if (v22)
    {
      uint64_t v17 = v24;
      uint64_t v16 = v24;
      void *v18 = v24;
      uint64_t v15 = v17;
    }

    if (v23) {
      *BOOL v23 = v19;
    }
  }

  while (!v22);
  return 0LL;
}

uint64_t _pthread_mutex_droplock(uint64_t a1, _DWORD *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v92 = a1;
  if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    uint64_t v34 = a1;
    uint64_t v33 = a2;
    unint64_t v32 = a3;
    BOOL v31 = a4;
    unint64_t v30 = a5;
    int v29 = 0;
    int v29 = *(_DWORD *)(a1 + 12);
    v29 &= ~0x1000u;
    uint64_t v47 = a1;
    BOOL v46 = &v28;
    unint64_t v28 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v27 = 0LL;
    unint64_t v26 = 0LL;
    uint64_t v49 = v28;
    unint64_t v48 = &v27;
    unint64_t v27 = *v28;
    uint64_t v51 = a1;
    unint64_t v50 = &v25;
    uint64_t v25 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v107 = a1;
    v106 = v25;
    if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
    {
      uint64_t v105 = 0LL;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v105 = *(void *)(StatusReg - 8);
      uint64_t v104 = 0LL;
      uint64_t v103 = *v106;
      uint64_t v104 = v103;
      uint64_t v102 = v103;
      if (v103 == v105)
      {
        uint64_t v109 = v107;
        int v108 = ((*(_DWORD *)(v107 + 12) >> 2) & 3) == 2
            && (int v5 = HIWORD(*(_DWORD *)(v107 + 12)),
                *(_DWORD *)(v107 + 12) = *(unsigned __int16 *)(v107 + 12) | ((unsigned __int16)(v5 - 1) << 16),
                (_WORD)v5 != 1);
      }

      else
      {
        int v108 = -1;
      }
    }

    else
    {
      int v108 = 0;
    }

    if (v108 <= 0)
    {
      if (v108 >= 0)
      {
        do
        {
          unint64_t v26 = v27;
          uint64_t v24 = *v25;
          char v22 = 0;
          char v21 = 0;
          if (diff_genseq(v27, SHIDWORD(v27)))
          {
            HIDWORD(v26) += 256;
            if ((v27 & 0xFFFFFF00) == (HIDWORD(v26) & 0xFFFFFF00))
            {
              LODWORD(v26) = v26 & 0xFFFFFFFC;
              char v22 = 1;
              unint64_t v23 = 0LL;
            }

            else
            {
              unint64_t v23 = -1LL;
              v29 |= 0x1000u;
            }

            if (v23 != v24)
            {
              unint64_t v6 = (unint64_t *)v25;
              do
                unint64_t v7 = __ldaxr(v6);
              while (v7 == v24 && __stlxr(v23, v6));
              if (v7 != v24) {
                _pthread_mutex_corruption_abort();
              }
            }
          }

          else
          {
            char v21 = 1;
          }

          if ((v22 & 1) != 0 || (v21 & 1) != 0) {
            v29 &= ~0x1000u;
          }
          int v45 = v28;
          unint64_t v44 = &v27;
          uint64_t v43 = &v26;
          unint64_t v42 = v27;
          BOOL v41 = 0;
          int v8 = v28;
          unint64_t v39 = v26;
          unint64_t v38 = v26;
          unint64_t v40 = v26;
          unint64_t v9 = v27;
          unint64_t v10 = v26;
          do
            unint64_t v11 = __ldaxr(v8);
          while (v11 == v9 && __stlxr(v10, v8));
          if (v11 != v9) {
            unint64_t v42 = v11;
          }
          BOOL v37 = v11 == v9;
          BOOL v41 = v11 == v9;
          unint64_t *v44 = v42;
          BOOL v36 = v41;
        }

        while (!v41);
        if (v31) {
          *BOOL v31 = v26;
        }
        if (v30) {
          *unint64_t v30 = HIDWORD(v26);
        }
        if (v32) {
          void *v32 = v34;
        }
        if (v33) {
          *uint64_t v33 = v29;
        }
        return 0;
      }

      else
      {
        return -v108;
      }
    }

    else
    {
      if (v33) {
        *uint64_t v33 = v29;
      }
      return 0;
    }
  }

  else
  {
    uint64_t v74 = a1;
    int v73 = a2;
    char v72 = a3;
    unsigned int v71 = a4;
    int v70 = a5;
    unsigned int v69 = 0;
    unsigned int v69 = *(_DWORD *)(a1 + 12) & 0xFFFFEFFF;
    BOOL v68 = 0;
    uint64_t v87 = a1;
    BOOL v86 = &v67;
    uint64_t v67 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v66 = 0LL;
    unint64_t v65 = 0LL;
    BOOL v89 = v67;
    unint64_t v88 = &v66;
    unint64_t v66 = *v67;
    uint64_t v91 = a1;
    unsigned int v90 = &v64;
    uint64_t v64 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v63 = 0LL;
    int v62 = 0;
    uint64_t v98 = a1;
    unsigned int v97 = v64;
    if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
    {
      uint64_t v96 = 0LL;
      unint64_t v101 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v96 = *(void *)(v101 - 8);
      uint64_t v95 = 0LL;
      uint64_t v94 = *v97;
      uint64_t v95 = v94;
      uint64_t v93 = v94;
      if (v94 == v96)
      {
        uint64_t v100 = v98;
        int v99 = ((*(_DWORD *)(v98 + 12) >> 2) & 3) == 2
           && (int v12 = HIWORD(*(_DWORD *)(v98 + 12)),
               *(_DWORD *)(v98 + 12) = *(unsigned __int16 *)(v98 + 12) | ((unsigned __int16)(v12 - 1) << 16),
               (_WORD)v12 != 1);
      }

      else
      {
        int v99 = -1;
      }
    }

    else
    {
      int v99 = 0;
    }

    int v62 = v99;
    if (v99 <= 0)
    {
      if (v62 >= 0)
      {
        do
        {
          unint64_t v65 = v66;
          unint64_t v61 = 0LL;
          unint64_t v60 = *v64;
          unint64_t v61 = v60;
          unint64_t v59 = v60;
          unint64_t v63 = v60;
          BOOL v68 = (int)diff_genseq(v66, SHIDWORD(v66)) > 0;
          LODWORD(v65) = v65 & 0xFFFFFFFD;
          if (v68) {
            HIDWORD(v65) += 256;
          }
          if (v63)
          {
            unint64_t v58 = v63;
            BOOL v57 = 0;
            int v13 = (unint64_t *)v64;
            uint64_t v55 = 0LL;
            uint64_t v54 = 0LL;
            uint64_t v56 = 0LL;
            do
              unint64_t v14 = __ldaxr(v13);
            while (v14 == v63 && __stlxr(0LL, v13));
            if (v14 != v63) {
              unint64_t v58 = v14;
            }
            BOOL v53 = v14 == v63;
            BOOL v57 = v14 == v63;
            BOOL v52 = v57;
            if (v14 != v63) {
              _pthread_mutex_corruption_abort();
            }
          }

          unsigned int v85 = v67;
          unint64_t v84 = &v66;
          BOOL v83 = &v65;
          unint64_t v82 = v66;
          BOOL v81 = 0;
          uint64_t v15 = v67;
          unint64_t v79 = v65;
          unint64_t v78 = v65;
          unint64_t v80 = v65;
          unint64_t v16 = v66;
          unint64_t v17 = v65;
          do
            unint64_t v18 = __ldaxr(v15);
          while (v18 == v16 && __stlxr(v17, v15));
          if (v18 != v16) {
            unint64_t v82 = v18;
          }
          BOOL v77 = v18 == v16;
          BOOL v81 = v18 == v16;
          *unint64_t v84 = v82;
          BOOL v76 = v81;
        }

        while (!v81);
        if (v68) {
          v69 |= 0x1000u;
        }
        if (v71) {
          *unsigned int v71 = v65;
        }
        if (v70) {
          *int v70 = HIDWORD(v65);
        }
        if (v72) {
          *char v72 = v74;
        }
        if (v73) {
          *int v73 = v69;
        }
        return 0;
      }

      else
      {
        return -v62;
      }
    }

    else
    {
      if (v73) {
        *int v73 = v69;
      }
      return 0;
    }
  }

uint64_t _pthread_mutex_lock_init_slow(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = _pthread_mutex_check_init_slow(a1);
  }
  if (v6)
  {
    return v6;
  }

  else if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    return _pthread_mutex_fairshare_lock_slow(a1, v3 & 1);
  }

  else if (((*(_DWORD *)(a1 + 12) >> 14) & 1) != 0)
  {
    return _pthread_mutex_ulock_lock(a1, v3 & 1);
  }

  else
  {
    return _pthread_mutex_firstfit_lock_slow(a1, v3 & 1);
  }

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  unint64_t v10 = a1;
  unint64_t v30 = a1;
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_unlock_init_slow((uint64_t)v10);
  }
  unint64_t v28 = v10;
  if (((*(_DWORD *)&v10->__opaque[4] >> 6) & 7) == 1) {
    return _pthread_mutex_fairshare_unlock((uint64_t)v10);
  }
  int v29 = v10;
  if (((*(_DWORD *)&v10->__opaque[4] >> 14) & 1) != 0) {
    return _pthread_mutex_ulock_unlock((uint64_t)v10);
  }
  unint64_t v27 = v10;
  unint64_t v26 = &v9;
  unint64_t v9 = (void *)((unint64_t)&v10->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v23 = v10;
  char v22 = &v8;
  int v8 = (unint64_t *)((unint64_t)&v10->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v7 = 0LL;
  unint64_t v6 = 0LL;
  uint64_t v25 = v8;
  uint64_t v24 = &v7;
  unint64_t v7 = *v8;
  *unint64_t v9 = 0LL;
  do
  {
    unint64_t v6 = v7;
    LODWORD(v6) = v6 & 0xFFFFFFFD;
    char v21 = v8;
    unint64_t v20 = &v7;
    unint64_t v19 = &v6;
    unint64_t v18 = v7;
    BOOL v17 = 0;
    int v1 = v8;
    unint64_t v15 = v6;
    unint64_t v14 = v6;
    unint64_t v16 = v6;
    unint64_t v2 = v7;
    unint64_t v3 = v6;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v18 = v4;
    }
    BOOL v13 = v4 == v2;
    BOOL v17 = v4 == v2;
    *unint64_t v20 = v18;
    BOOL v12 = v17;
  }

  while (!v17);
  return 0;
}

uint64_t _pthread_mutex_unlock_init_slow(uint64_t a1)
{
  if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = _pthread_mutex_check_init_slow(a1);
  }
  if (v4)
  {
    return v4;
  }

  else if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    return _pthread_mutex_fairshare_unlock_slow(a1);
  }

  else if (((*(_DWORD *)(a1 + 12) >> 14) & 1) != 0)
  {
    return _pthread_mutex_ulock_unlock(a1);
  }

  else
  {
    return _pthread_mutex_firstfit_unlock_slow(a1);
  }

uint64_t _pthread_mutex_fairshare_unlock(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v27 = a1;
  unint64_t v26 = &v9;
  unint64_t v9 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v23 = a1;
  char v22 = &v8;
  int v8 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v7 = 0LL;
  *(void *)&v6[4] = 0LL;
  uint64_t v25 = v8;
  uint64_t v24 = &v7;
  unint64_t v7 = *v8;
  *(void *)unint64_t v6 = diff_genseq(v7, SHIDWORD(v7));
  if (*(_DWORD *)v6)
  {
    *unint64_t v9 = 0LL;
    do
    {
      *(_DWORD *)&v6[4] = v7;
      *(_DWORD *)&v6[8] = HIDWORD(v7) + 256;
      if ((v7 & 0xFFFFFF00) != ((HIDWORD(v7) + 256) & 0xFFFFFF00)) {
        return _pthread_mutex_fairshare_unlock_slow(v10);
      }
      *(_DWORD *)&v6[4] &= 0xFFFFFFFC;
      char v21 = v8;
      unint64_t v20 = &v7;
      unint64_t v19 = &v6[4];
      unint64_t v18 = v7;
      BOOL v17 = 0;
      int v1 = v8;
      uint64_t v15 = *(void *)&v6[4];
      uint64_t v14 = *(void *)&v6[4];
      uint64_t v16 = *(void *)&v6[4];
      unint64_t v2 = v7;
      unint64_t v3 = *(void *)&v6[4];
      do
        unint64_t v4 = __ldaxr(v1);
      while (v4 == v2 && __stlxr(v3, v1));
      if (v4 != v2) {
        unint64_t v18 = v4;
      }
      BOOL v13 = v4 == v2;
      BOOL v17 = v4 == v2;
      *unint64_t v20 = v18;
      BOOL v12 = v17;
    }

    while (!v17);
    return 0;
  }

  else
  {
    return 0;
  }

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 0);
  }
  if (((*(_DWORD *)&a1->__opaque[4] >> 6) & 7) == 1) {
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 0);
  }
  if (((*(_DWORD *)&a1->__opaque[4] >> 14) & 1) != 0) {
    return _pthread_mutex_ulock_lock((uint64_t)a1, 0);
  }
  uint64_t v14 = a1;
  char v13 = 0;
  BOOL v31 = a1;
  unint64_t v30 = &v12;
  BOOL v12 = (void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v11 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v11 = *(void *)(StatusReg - 8);
  uint64_t v27 = a1;
  unint64_t v26 = &v10;
  uint64_t v10 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v9 = 0LL;
  unint64_t v8 = 0LL;
  int v29 = v10;
  unint64_t v28 = &v9;
  unint64_t v9 = *v10;
  if ((v9 & 2) != 0) {
    return _pthread_mutex_firstfit_lock_slow((uint64_t)v14, v13 & 1);
  }
  do
  {
    unint64_t v8 = v9;
    BOOL v7 = (v9 & 2) == 0;
    if ((v13 & 1) != 0 && (v9 & 2) != 0)
    {
      __dmb(9u);
      return 16;
    }

    if ((v9 & 2) != 0) {
      return _pthread_mutex_firstfit_lock_slow((uint64_t)v14, v13 & 1);
    }
    LODWORD(v8) = v8 | 2;
    uint64_t v25 = v10;
    uint64_t v24 = &v9;
    uint64_t v23 = &v8;
    unint64_t v22 = v9;
    BOOL v21 = 0;
    int v1 = v10;
    unint64_t v19 = v8;
    unint64_t v18 = v8;
    unint64_t v20 = v8;
    unint64_t v2 = v9;
    unint64_t v3 = v8;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v22 = v4;
    }
    BOOL v17 = v4 == v2;
    BOOL v21 = v4 == v2;
    *uint64_t v24 = v22;
    BOOL v16 = v21;
  }

  while (!v21);
  if (v7)
  {
    *BOOL v12 = v11;
    return 0;
  }

  else
  {
    if ((v13 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x14970LL);
    }

    return 16;
  }

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 1);
  }
  if (((*(_DWORD *)&a1->__opaque[4] >> 6) & 7) == 1) {
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 1);
  }
  if (((*(_DWORD *)&a1->__opaque[4] >> 14) & 1) != 0) {
    return _pthread_mutex_ulock_lock((uint64_t)a1, 1);
  }
  uint64_t v14 = a1;
  char v13 = 1;
  BOOL v31 = a1;
  unint64_t v30 = &v12;
  BOOL v12 = (void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v11 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v11 = *(void *)(StatusReg - 8);
  uint64_t v27 = a1;
  unint64_t v26 = &v10;
  uint64_t v10 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v9 = 0LL;
  unint64_t v8 = 0LL;
  int v29 = v10;
  unint64_t v28 = &v9;
  unint64_t v9 = *v10;
  do
  {
    unint64_t v8 = v9;
    BOOL v7 = (v9 & 2) == 0;
    if ((v13 & 1) != 0 && (v9 & 2) != 0)
    {
      __dmb(9u);
      return 16;
    }

    if ((v9 & 2) != 0) {
      return _pthread_mutex_firstfit_lock_slow((uint64_t)v14, v13 & 1);
    }
    LODWORD(v8) = v8 | 2;
    uint64_t v25 = v10;
    uint64_t v24 = &v9;
    uint64_t v23 = &v8;
    unint64_t v22 = v9;
    BOOL v21 = 0;
    int v1 = v10;
    unint64_t v19 = v8;
    unint64_t v18 = v8;
    unint64_t v20 = v8;
    unint64_t v2 = v9;
    unint64_t v3 = v8;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v22 = v4;
    }
    BOOL v17 = v4 == v2;
    BOOL v21 = v4 == v2;
    *uint64_t v24 = v22;
    BOOL v16 = v21;
  }

  while (!v21);
  if (v7)
  {
    *BOOL v12 = v11;
    return 0;
  }

  else
  {
    if ((v13 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x14D18LL);
    }

    return 16;
  }

void _pthread_mutex_enable_legacy_mode(void)
{
  _pthread_mutex_sig_fast = 1297437784LL;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  BOOL v12 = a1;
  int v11 = 22;
  opaque = a1->__opaque;
  unint64_t v30 = (unsigned int *)a1->__opaque;
  unsigned int v29 = 327680;
  if (v1) {
    char v2 = 0;
  }
  else {
    char v2 = 1;
  }
  if ((v2 & 1) == 0) {
    goto LABEL_11;
  }
  unsigned int v28 = 0;
  uint64_t v31 = 3LL;
  uint64_t v32 = 3LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v28 = *(void *)(StatusReg + 24);
  unsigned int v27 = 0;
  unsigned int v26 = v28;
  unsigned int v25 = v28;
  do
    unsigned int v3 = __ldaxr(v30);
  while (!v3 && __stlxr(v28, v30));
  if (v3) {
    unsigned int v27 = v3;
  }
  BOOL v24 = v3 == 0;
  if (v3) {
LABEL_11:
  }
    os_unfair_lock_lock_with_options(v30, v29);
  char v13 = v12;
  if ((v12->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    int v11 = 16;
    unint64_t v22 = v12;
    if (((*(_DWORD *)&v12->__opaque[4] >> 14) & 1) == 0 || *(_DWORD *)&v12->__opaque[16])
    {
      BOOL v17 = v12;
      BOOL v16 = &v10;
      uint64_t v10 = (void *)((unint64_t)&v12->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
      uint64_t v9 = 0LL;
      unint64_t v19 = v10;
      unint64_t v18 = &v9;
      uint64_t v9 = *v10;
      BOOL v21 = v12;
      unint64_t v20 = &v8;
      unint64_t v8 = (void *)((unint64_t)&v12->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
      if (!*v8 && (v9 & 0xFFFFFF00) == (HIDWORD(v9) & 0xFFFFFF00)) {
        int v11 = 0;
      }
    }

    else
    {
      int v11 = 0;
    }
  }

  else
  {
    uint64_t v23 = v12;
    if ((v12->__sig & 0xFFFFFFF0LL) == 0x32AAABA0) {
      int v11 = 0;
    }
  }

  if (!v11) {
    v12->__unsigned int sig = 0LL;
  }
  uint64_t v15 = v12->__opaque;
  unint64_t v39 = v12->__opaque;
  unsigned int v38 = 0;
  uint64_t v40 = 3LL;
  uint64_t v41 = 3LL;
  unint64_t v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v38 = *(void *)(v42 + 24);
  int v37 = 0;
  unsigned int v36 = v38;
  unint64_t v4 = (unsigned int *)v12->__opaque;
  int v35 = 0;
  unsigned int v5 = v38;
  do
    unsigned int v6 = __ldaxr(v4);
  while (v6 == v5 && __stlxr(0, v4));
  if (v6 != v5) {
    unsigned int v36 = v6;
  }
  BOOL v34 = v6 == v5;
  if (v6 != v5) {
    os_unfair_lock_unlock((os_unfair_lock_t)v39);
  }
  return v11;
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  a1->__unsigned int sig = 0LL;
  return 0;
}

uint64_t _pthread_mutex_check_init_slow(uint64_t a1)
{
  unsigned int v11 = 22;
  uint64_t v33 = a1;
  BOOL v1 = (*(void *)a1 & 0xFFFFFFF0LL) == 850045856;
  if ((*(void *)a1 & 0xFFFFFFF0LL) == 0x32AAABA0)
  {
    uint64_t v25 = a1 + 8;
    uint64_t v40 = (unsigned int *)(a1 + 8);
    unsigned int v39 = 327680;
    char v2 = !v1;
    if ((v2 & 1) == 0) {
      goto LABEL_12;
    }
    unsigned int v38 = 0;
    uint64_t v41 = 3LL;
    uint64_t v42 = 3LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v38 = *(void *)(StatusReg + 24);
    unsigned int v37 = 0;
    unsigned int v36 = v38;
    unsigned int v35 = v38;
    do
      unsigned int v3 = __ldaxr(v40);
    while (!v3 && __stlxr(v38, v40));
    if (v3) {
      unsigned int v37 = v3;
    }
    BOOL v34 = v3 == 0;
    if (v3) {
LABEL_12:
    }
      os_unfair_lock_lock_with_options(v40, v39);
    uint64_t v32 = a1;
    if ((*(void *)a1 & 0xFFFFFFF0LL) == 0x32AAABA0)
    {
      int v4 = *(void *)a1 & 0xF;
      uint64_t v21 = a1;
      uint64_t v20 = 0LL;
      int v19 = v4;
      *(_DWORD *)(a1 + 12) = 0;
      *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFDFFF | 0x2000;
      if (v20)
      {
        if (*(void *)v20 == 1297373249LL)
        {
          *(_WORD *)(v21 + 16) = *(_DWORD *)(v20 + 8);
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFFC | *(_DWORD *)(v20 + 12) & 3;
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFE3F | (((*(_DWORD *)(v20 + 12) >> 6) & 7) << 6);
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFF3 | (4 * ((*(_DWORD *)(v20 + 12) >> 2) & 3));
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFCF | (16 * ((*(_DWORD *)(v20 + 12) >> 4) & 3));
          *(_WORD *)(v21 + 18) = 0;
          uint64_t v18 = 1297437784LL;
          if (((*(_DWORD *)(v21 + 12) >> 2) & 3) == 0)
          {
            uint64_t v31 = v21;
            if (((*(_DWORD *)(v21 + 12) >> 6) & 7) == 1 || (uint64_t v53 = v21, ((*(_DWORD *)(v21 + 12) >> 6) & 7) == 2)) {
              uint64_t v18 = _pthread_mutex_sig_fast;
            }
          }

          if (((*(_DWORD *)(v21 + 12) >> 2) & 3) == 0
            && ((*(_DWORD *)(v21 + 12) >> 6) & 7) == 2
            && ((*(_DWORD *)(v21 + 12) >> 4) & 3) == 2
            && v18 == _pthread_mutex_sig_fast)
          {
            *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFBFFF | ((__pthread_mutex_use_ulock & 1) << 14);
          }

          else
          {
            *(_DWORD *)(v21 + 12) &= ~0x4000u;
          }

          if (((*(_DWORD *)(v21 + 12) >> 14) & 1) != 0)
          {
            uint64_t v5 = v21;
            *(void *)(v21 + 24) = -1LL;
            *(void *)(v5 + 32) = -1LL;
            *(void *)(v5 + 40) = -1LL;
            int v17 = 0;
            *(_DWORD *)(v21 + 24) = 0;
          }

          else
          {
            uint64_t v28 = v21;
            unsigned int v27 = &v16;
            BOOL v16 = (void *)((v21 + 39) & 0xFFFFFFFFFFFFFFF8LL);
            uint64_t v30 = v21;
            unsigned int v29 = &v15;
            uint64_t v15 = (void *)((v21 + 31) & 0xFFFFFFFFFFFFFFF8LL);
            if (v15 != (void *)(v21 + 24))
            {
              *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFF7FF | 0x800;
              *(void *)(v21 + 24) = -1LL;
            }

            *(void *)(v21 + 40) = -1LL;
            *uint64_t v15 = 0LL;
            void *v16 = 0LL;
          }

          int v14 = v18;
          *(void *)(v21 + 48) = ~v21;
          *(_DWORD *)(v21 + 56) = v14;
          *(_DWORD *)(v21 + 60) = v14;
          *(_DWORD *)(v21 + 20) = v14;
          char v13 = (unsigned int *)v21;
          *(_DWORD *)(v21 + 4) = HIDWORD(v18);
          atomic_store(v18, v13);
          int v22 = 0;
        }

        else
        {
          int v22 = 22;
        }
      }

      else
      {
        unint64_t v10 = (v19 - 1);
        if (v10 <= 6) {
          __asm { BR              X8 }
        }

        int v22 = 22;
      }

      unsigned int v11 = v22;
    }

    else
    {
      uint64_t v24 = a1;
      if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
        unsigned int v11 = 0;
      }
    }

    uint64_t v26 = a1 + 8;
    os_unfair_lock_t v49 = (os_unfair_lock_t)(a1 + 8);
    unsigned int v48 = 0;
    uint64_t v50 = 3LL;
    uint64_t v51 = 3LL;
    unint64_t v52 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v48 = *(void *)(v52 + 24);
    int v47 = 0;
    unsigned int v46 = v48;
    unsigned int v6 = (unsigned int *)(a1 + 8);
    int v45 = 0;
    unsigned int v7 = v48;
    do
      unsigned int v8 = __ldaxr(v6);
    while (v8 == v7 && __stlxr(0, v6));
    if (v8 != v7) {
      unsigned int v46 = v8;
    }
    BOOL v44 = v8 == v7;
    if (v8 != v7) {
      os_unfair_lock_unlock(v49);
    }
  }

  else
  {
    uint64_t v23 = a1;
    if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
      return 0;
    }
  }

  return v11;
}

uint64_t _pthread_mutex_fairshare_lock(uint64_t a1, char a2)
{
  uint64_t v14 = a1;
  char v13 = a2 & 1;
  uint64_t v31 = a1;
  uint64_t v30 = &v12;
  BOOL v12 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v11 = 0LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v11 = *(void *)(StatusReg - 8);
  uint64_t v27 = a1;
  uint64_t v26 = &v10;
  unint64_t v10 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v9 = 0LL;
  unint64_t v8 = 0LL;
  unsigned int v29 = v10;
  uint64_t v28 = &v9;
  unint64_t v9 = *v10;
  if ((v9 & 2) != 0)
  {
    return _pthread_mutex_fairshare_lock_slow(v14, v13 & 1);
  }

  else
  {
    do
    {
      unint64_t v8 = v9;
      BOOL v7 = (v9 & 2) == 0;
      if ((v13 & 1) == 0 || (v9 & 2) == 0)
      {
        if ((v9 & 2) != 0) {
          return _pthread_mutex_fairshare_lock_slow(v14, v13 & 1);
        }
        LODWORD(v8) = v8 + 256;
        LODWORD(v8) = v8 | 3;
      }

      uint64_t v25 = v10;
      uint64_t v24 = &v9;
      uint64_t v23 = &v8;
      unint64_t v22 = v9;
      BOOL v21 = 0;
      char v2 = v10;
      unint64_t v19 = v8;
      unint64_t v18 = v8;
      unint64_t v20 = v8;
      unint64_t v3 = v9;
      unint64_t v4 = v8;
      do
        unint64_t v5 = __ldaxr(v2);
      while (v5 == v3 && __stlxr(v4, v2));
      if (v5 != v3) {
        unint64_t v22 = v5;
      }
      BOOL v17 = v5 == v3;
      BOOL v21 = v5 == v3;
      *uint64_t v24 = v22;
      BOOL v16 = v21;
    }

    while (!v21);
    if (v7)
    {
      *BOOL v12 = v11;
      return 0;
    }

    else
    {
      if ((v13 & 1) == 0)
      {
        __break(1u);
        JUMPOUT(0x15C78LL);
      }

      return 16;
    }
  }

void *__cdecl malloc(size_t __size)
{
  if (_pthread_malloc) {
    return (void *)_pthread_malloc(__size);
  }
  else {
    return 0LL;
  }
}

void free(void *a1)
{
  if (_pthread_free) {
    _pthread_free(a1);
  }
}

uint64_t _pthread_qos_class_to_thread_qos(int a1)
{
  unint64_t v2 = (a1 - 5);
  if (v2 <= 0x1C) {
    __asm { BR              X8 }
  }

  return 0LL;
}

uint64_t _pthread_set_main_qos(uint64_t result)
{
  _main_qos = result;
  return result;
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  char v5 = __relative_priority;
  unsigned __int8 v4 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (__attr->__sig != 1414022209 || ((*(void *)&__attr->__opaque[32] >> 24) & 1) != 0) {
    return 22;
  }
  unsigned int v8 = 0;
  if (v4 && v4 < 7u) {
    unsigned int v8 = (1 << (v4 + 7)) | (v5 - 1);
  }
  *(void *)&__attr->__opaque[24] = v8;
  *(void *)&__attr->__opaque[32] = *(void *)&__attr->__opaque[32] & 0xFFFFFFFFFDFFFFFFLL | 0x2000000;
  *(void *)&__attr->__opaque[32] &= ~0x1000000uLL;
  return 0;
}

uint64_t _pthread_validate_qos_class_and_relpri(int a1, int a2)
{
  if (a2 <= 0 && a2 >= -15) {
    return _pthread_qos_class_to_thread_qos(a1);
  }
  else {
    return 0;
  }
}

int pthread_attr_get_qos_class_np(pthread_attr_t *__attr, qos_class_t *__qos_class, int *__relative_priority)
{
  if (__attr->__sig != 1414022209) {
    return 22;
  }
  if (((*(void *)&__attr->__opaque[32] >> 25) & 1) != 0) {
    _pthread_priority_split(*(void *)&__attr->__opaque[24], __qos_class, __relative_priority);
  }
  else {
    _pthread_priority_split(0LL, __qos_class, __relative_priority);
  }
  return 0;
}

uint64_t _pthread_priority_split(uint64_t result, _DWORD *a2, int *a3)
{
  int v10 = result;
  BOOL v7 = 0;
  if ((result & 0x22000000) == 0) {
    BOOL v7 = (result & 0x3F00) != 0;
  }
  if (v7)
  {
    unsigned int v3 = (unint64_t)(result & 0x3F00) >> 8;
    char v4 = __clz(__rbit32(v3));
    if (v3) {
      unsigned __int8 v5 = v4 + 1;
    }
    else {
      unsigned __int8 v5 = 0;
    }
    unsigned __int8 v11 = v5;
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  if (a2)
  {
    int result = _pthread_qos_class_from_thread_qos(v11);
    *a2 = result;
  }

  if (a3)
  {
    BOOL v6 = 0;
    if ((v10 & 0x22000000) == 0) {
      BOOL v6 = (v10 & 0x3F00) != 0LL;
    }
    if (v6) {
      int v12 = (char)v10 + 1;
    }
    else {
      int v12 = 0;
    }
    *a3 = v12;
  }

  return result;
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  char v4 = __relative_priority;
  unsigned __int8 v3 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (!v3) {
    return 22;
  }
  uint64_t v6 = 0LL;
  if (v3 < 7u) {
    LODWORD(v6) = (1 << (v3 + 7)) | (v4 - 1);
  }
  return _pthread_set_properties_self(1, v6, 0);
}

uint64_t _pthread_set_properties_self(int a1, uint64_t a2, unsigned int a3)
{
  char v9 = a1;
  unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  unsigned int v4 = 0;
  if ((*(void *)v6 ^ _pthread_ptr_munge_token) != v6) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  if ((*(_BYTE *)(v6 + 164) & 1) == 0 || (v9 & 0x2D) == 0 || (a1 & 0xFFFFFFD2) != 0) {
    unsigned int v4 = __bsdthread_ctl(256LL, a2, a3);
  }
  if ((v9 & 1) != 0 && (!v4 || **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) == 2)) {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = a2 & 0xFF403FFF;
  }
  if (v4) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v4;
}

uint64_t pthread_set_qos_class_np(void *a1, qos_class_t a2, int a3)
{
  if (a1 == (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    if ((void *)(*a1 ^ _pthread_ptr_munge_token) != a1) {
      abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
    }
    return pthread_set_qos_class_self_np(a2, a3);
  }

  else
  {
    return 1;
  }

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return 0;
}

qos_class_t qos_class_self(void)
{
  uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32);
  BOOL v4 = 0;
  if ((v5 & 0x22000000) == 0) {
    BOOL v4 = (v5 & 0x3F00) != 0;
  }
  if (!v4) {
    return _pthread_qos_class_from_thread_qos(0);
  }
  unsigned int v0 = (unint64_t)(v5 & 0x3F00) >> 8;
  char v1 = __clz(__rbit32(v0));
  if (v0) {
    unsigned __int8 v2 = v1 + 1;
  }
  else {
    unsigned __int8 v2 = 0;
  }
  return _pthread_qos_class_from_thread_qos(v2);
}

uint64_t _pthread_qos_class_from_thread_qos(unsigned __int8 a1)
{
  if (a1 < 7u) {
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[a1];
  }
  else {
    return 0;
  }
}

qos_class_t qos_class_main(void)
{
  BOOL v4 = 0;
  if ((_main_qos & 0x22000000) == 0) {
    BOOL v4 = (_main_qos & 0x3F00) != 0LL;
  }
  if (!v4) {
    return _pthread_qos_class_from_thread_qos(0);
  }
  unsigned int v0 = (unint64_t)(_main_qos & 0x3F00) >> 8;
  char v1 = __clz(__rbit32(v0));
  if (v0) {
    unsigned __int8 v2 = v1 + 1;
  }
  else {
    unsigned __int8 v2 = 0;
  }
  return _pthread_qos_class_from_thread_qos(v2);
}

uint64_t _pthread_qos_class_encode(int a1, char a2, int a3)
{
  unsigned __int8 v7 = _pthread_qos_class_to_thread_qos(a1);
  unsigned int v6 = a3 & 0xFF000000;
  if (v7 && v7 < 7u) {
    v6 |= (1 << (v7 + 7)) | (a2 - 1);
  }
  return v6;
}

uint64_t _pthread_qos_class_decode(uint64_t a1, int *a2, void *a3)
{
  uint64_t v7 = a1;
  unsigned int v6 = a2;
  uint64_t v5 = a3;
  unsigned int v4 = 0;
  _pthread_priority_split(a1, &v4, a2);
  if (v5) {
    *uint64_t v5 = v7 & 0xFF000000;
  }
  return v4;
}

uint64_t _pthread_qos_class_and_override_encode(int a1, char a2, int a3, int a4)
{
  unsigned __int8 v5 = _pthread_qos_class_to_thread_qos(a1);
  unsigned __int8 v10 = _pthread_qos_class_to_thread_qos(a4);
  unsigned int v11 = a3 & 0xFF000000;
  if (v5 && v5 < 7u) {
    v11 |= (1 << (v5 + 7)) | (a2 - 1);
  }
  unsigned int v9 = v11;
  if (v10 && v10 < 7u) {
    return v11 | (1 << (v10 + 13)) | 0x800000;
  }
  return v9;
}

uint64_t _pthread_qos_class_and_override_decode(int a1, int *a2, void *a3, _DWORD *a4)
{
  BOOL v13 = 0;
  if ((a1 & 0x22000000) == 0) {
    BOOL v13 = (a1 & 0x3F00) != 0LL;
  }
  if (v13)
  {
    unsigned int v4 = (unint64_t)(a1 & 0x3F00) >> 8;
    char v5 = __clz(__rbit32(v4));
    if (v4) {
      unsigned __int8 v6 = v5 + 1;
    }
    else {
      unsigned __int8 v6 = 0;
    }
    unsigned __int8 v17 = v6;
  }

  else
  {
    unsigned __int8 v17 = 0;
  }

  BOOL v12 = 0;
  if ((a1 & 0x22000000) == 0)
  {
    BOOL v12 = 0;
    if ((a1 & 0x800000) != 0) {
      BOOL v12 = (a1 & 0x3FC000) != 0LL;
    }
  }

  if (v12)
  {
    unsigned int v7 = (a1 & 0x3FC000u) >> 14;
    char v8 = __clz(__rbit32(v7));
    if (v7) {
      unsigned __int8 v9 = v8 + 1;
    }
    else {
      unsigned __int8 v9 = 0;
    }
    unsigned __int8 v18 = v9;
  }

  else
  {
    unsigned __int8 v18 = 0;
  }

  if (a4) {
    *a4 = _pthread_qos_class_from_thread_qos(v18);
  }
  if (a3) {
    *a3 = a1 & 0xFF000000;
  }
  if (a2)
  {
    BOOL v11 = 0;
    if ((a1 & 0x22000000) == 0) {
      BOOL v11 = (a1 & 0x3F00) != 0LL;
    }
    if (v11) {
      int v19 = (char)a1 + 1;
    }
    else {
      int v19 = 0;
    }
    *a2 = v19;
  }

  return _pthread_qos_class_from_thread_qos(v17);
}

uint64_t _pthread_sched_pri_encode(int a1, int a2)
{
  return a2 & 0xDF000000 | 0x20000000 | a1;
}

uint64_t _pthread_sched_pri_decode(int a1, void *a2)
{
  if (a2) {
    *a2 = a1 & 0xDF000000;
  }
  if ((a1 & 0x20000000) != 0) {
    return (unsigned __int16)a1;
  }
  else {
    return 0;
  }
}

uint64_t _pthread_qos_class_encode_workqueue(int a1, int a2)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned __int8 v3 = 4;
    }

    else
    {
      if (a1 != 2)
      {
        if (a1 == 3)
        {
          unsigned __int8 v3 = 2;
          goto LABEL_11;
        }

        if (a1 != 128)
        {
          qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid priority";
          qword_24058 = a1;
          __break(1u);
          JUMPOUT(0x16FF0LL);
        }
      }

      unsigned __int8 v3 = 3;
    }
  }

  else
  {
    unsigned __int8 v3 = 6;
  }

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_properties_self(4, 0LL, 0);
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_properties_self(8, 0LL, 0);
}

uint64_t pthread_prefer_alternate_cluster_self()
{
  return _pthread_set_properties_self(32, 0LL, 0);
}

pthread_override_t pthread_override_qos_class_start_np( pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  pthread_t v12 = __pthread;
  qos_class_t v11 = __qos_class;
  int v10 = __relative_priority;
  unsigned __int8 v9 = 0LL;
  v8[4] = 0;
  int v7 = 0;
  char v6 = 1;
  *(_DWORD *)char v8 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (!v8[0]) {
    return 0LL;
  }
  mach_vm_address_t address = (mach_vm_address_t)malloc(0x20uLL);
  if (address
    || (mach_vm_address_t address = vm_page_size,
        char v6 = 0,
        (*(_DWORD *)&v8[1] = mach_vm_allocate( mach_task_self_,  &address,  (vm_page_size + 31) & ~(vm_page_size - 1),  1241513985)) == 0))
  {
    unsigned __int8 v9 = (void *)address;
    *(_DWORD *)mach_vm_address_t address = 1870030194;
    *((void *)v9 + 1) = v12;
    mach_port_t v3 = pthread_mach_thread_np(v12);
    *((_DWORD *)v9 + 1) = v3;
    unsigned __int8 v17 = v8[0];
    int v16 = v10;
    int v15 = 0;
    uint64_t v14 = 0LL;
    if (v8[0] && v17 < 7u)
    {
      LODWORD(v14) = v14 | (1 << (v17 + 7));
      LODWORD(v14) = v14 | (v16 - 1);
    }

    *((void *)v9 + 2) = v14;
    *((_BYTE *)v9 + 24) = v6 & 1;
    *(_DWORD *)&v8[1] = mach_port_mod_refs(mach_task_self_, *((_DWORD *)v9 + 1), 0, 1);
    if (*(_DWORD *)&v8[1]) {
      int v7 = 22;
    }
    if (!v7)
    {
      int v7 = __bsdthread_ctl(64LL, *((unsigned int *)v9 + 1), *((void *)v9 + 2));
      if (v7) {
        mach_port_mod_refs(mach_task_self_, *((_DWORD *)v9 + 1), 0, -1);
      }
    }

    if (v7)
    {
      if ((v6 & 1) != 0) {
        free(v9);
      }
      else {
        mach_vm_deallocate(mach_task_self_, address, (vm_page_size + 31) & ~(vm_page_size - 1));
      }
      return 0LL;
    }

    return (pthread_override_t)v9;
  }

  else
  {
    uint64_t v18 = 1LL;
    uint64_t v19 = 1LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    **(_DWORD **)(StatusReg + 8) = 12;
    return 0LL;
  }

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  if (_pthread_atomic_xchg_uint32_relaxed((unsigned int *)__override, 0x7265766Fu) != 1870030194)
  {
    __break(1u);
    JUMPOUT(0x1746CLL);
  }

  int v2 = __bsdthread_ctl(128LL, *((unsigned int *)__override + 1), __override);
  if (v2 == -1) {
    int v2 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  if (v2 == 14) {
    int v2 = 0;
  }
  if (mach_port_mod_refs(mach_task_self_, *((_DWORD *)__override + 1), 0, -1)) {
    int v2 = 22;
  }
  if ((*((_BYTE *)__override + 24) & 1) != 0)
  {
    free(__override);
  }

  else if (mach_vm_deallocate( mach_task_self_,  (mach_vm_address_t)__override,  (vm_page_size + 31) & ~(vm_page_size - 1)))
  {
    return 22;
  }

  return v2;
}

uint64_t _pthread_qos_override_start_direct(unsigned int a1, uint64_t a2)
{
  unsigned int v3 = __bsdthread_ctl(64LL, a1, a2);
  if (v3 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v3;
}

uint64_t _pthread_qos_override_end_direct(unsigned int a1, uint64_t a2)
{
  unsigned int v3 = __bsdthread_ctl(128LL, a1, a2);
  if (v3 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v3;
}

uint64_t _pthread_override_qos_class_start_direct(unsigned int a1, uint64_t a2)
{
  return _pthread_qos_override_start_direct(a1, a2);
}

uint64_t _pthread_override_qos_class_end_direct(unsigned int a1)
{
  return _pthread_qos_override_end_direct(a1, _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
}

uint64_t _pthread_workqueue_override_start_direct(unsigned int a1, uint64_t a2)
{
  unsigned int v3 = __bsdthread_ctl(1024LL, a1, a2);
  if (v3 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v3;
}

uint64_t _pthread_workqueue_override_start_direct_check_owner(unsigned int a1, uint64_t a2, int *a3)
{
  if (!_pthread_workqueue_override_start_direct_check_owner_kernel_supports_owner_check) {
    a3 = 0LL;
  }
  while (1)
  {
    while (1)
    {
      unsigned int v4 = __bsdthread_ctl(1024LL, a1, a2);
      if (v4 == -1) {
        unsigned int v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      }
      if (!a3 || v4 != 22) {
        break;
      }
      _pthread_workqueue_override_start_direct_check_owner_kernel_supports_owner_check = 0;
      a3 = 0LL;
    }

    if (!a3 || v4 != 14) {
      break;
    }
  }

  return v4;
}

uint64_t ulock_owner_value_to_port_name(int a1)
{
  return a1 | 3u;
}

uint64_t _pthread_workqueue_override_reset()
{
  unsigned int v1 = __bsdthread_ctl(512LL, 0LL, 0LL);
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_workqueue_asynchronous_override_add(unsigned int a1, uint64_t a2)
{
  unsigned int v3 = __bsdthread_ctl(1025LL, a1, a2);
  if (v3 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v3;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_self(uint64_t a1)
{
  unsigned int v2 = __bsdthread_ctl(1026LL, 0LL, a1);
  if (v2 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v2;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_all_self()
{
  unsigned int v1 = __bsdthread_ctl(1026LL, 1LL, 0LL);
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t pthread_qos_max_parallelism(int a1, uint64_t a2)
{
  int v7 = a1;
  if (!a1) {
    int v7 = 21;
  }
  unsigned __int8 v5 = _pthread_qos_class_to_thread_qos(v7);
  if (!v5 || (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return -1;
  }

  else
  {
    uint64_t v4 = 1LL;
    if (_os_alloc_once_table[32] == -1LL) {
      uint64_t v9 = _os_alloc_once_table[33];
    }
    else {
      uint64_t v9 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
    }
    unsigned int v3 = (unsigned __int16 *)(v9 + 272 + 2LL * v5);
    if ((a2 & 1) != 0)
    {
      uint64_t v4 = 0LL;
      if (_os_alloc_once_table[32] == -1LL) {
        uint64_t v10 = _os_alloc_once_table[33];
      }
      else {
        uint64_t v10 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
      }
      unsigned int v3 = (unsigned __int16 *)(v10 + 286 + 2LL * v5);
    }

    else if ((a2 & 2) != 0)
    {
      uint64_t v4 = 4LL;
      if (_os_alloc_once_table[32] == -1LL) {
        uint64_t v11 = _os_alloc_once_table[33];
      }
      else {
        uint64_t v11 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
      }
      unsigned int v3 = (unsigned __int16 *)(v11 + 300 + 2LL * v5);
    }

    if (*v3 == 0xFFFF) {
      *unsigned int v3 = _pthread_workqueue_parallelism_for_priority(v5, v4);
    }
    return *v3;
  }

uint64_t _pthread_workqueue_parallelism_for_priority(int a1, uint64_t a2)
{
  char v5 = a2;
  int v3 = __bsdthread_ctl(2048LL, a1, a2);
  if (v3 == -1)
  {
    int v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v4 != 22 && v4 != 45)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: qos_max_parallelism failed";
      qword_24058 = v4;
      __break(1u);
      JUMPOUT(0x17FD0LL);
    }

    if ((v5 & 1) != 0)
    {
      return MEMORY[0xFFFFFC036];
    }

    else if ((v5 & 4) != 0)
    {
      if (v4 != 45)
      {
        __break(1u);
        JUMPOUT(0x18020LL);
      }

      return 0;
    }

    else
    {
      return MEMORY[0xFFFFFC035];
    }
  }

  else
  {
    return (unsigned __int16)v3;
  }

uint64_t pthread_time_constraint_max_parallelism(char a1)
{
  uint64_t v3 = 1LL;
  if (_os_alloc_once_table[32] == -1LL) {
    uint64_t v6 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v6 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
  }
  unsigned int v2 = (unsigned __int16 *)(v6 + 272);
  if ((a1 & 1) != 0)
  {
    uint64_t v3 = 0LL;
    if (_os_alloc_once_table[32] == -1LL) {
      uint64_t v7 = _os_alloc_once_table[33];
    }
    else {
      uint64_t v7 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
    }
    unsigned int v2 = (unsigned __int16 *)(v7 + 286);
  }

  else if ((a1 & 2) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return -1;
  }

  if (*v2 == 0xFFFF) {
    *unsigned int v2 = _pthread_workqueue_parallelism_for_priority(0, v3 | 2);
  }
  return *v2;
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  switch(__qos_class)
  {
    case 5u:
      return posix_spawnattr_set_qos_clamp_np(__attr, 3LL);
    case 9u:
      return posix_spawnattr_set_qos_clamp_np(__attr, 2LL);
    case 0x11u:
      return posix_spawnattr_set_qos_clamp_np(__attr, 1LL);
  }

  return 22;
}

int posix_spawnattr_get_qos_class_np(const posix_spawnattr_t *__attr, qos_class_t *__qos_class)
{
  uint64_t v6 = __attr;
  char v5 = __qos_class;
  uint64_t v4 = 0LL;
  if (!__qos_class) {
    return 22;
  }
  int qos_clamp_np = posix_spawnattr_get_qos_clamp_np(v6, &v4);
  if (qos_clamp_np) {
    return qos_clamp_np;
  }
  switch(v4)
  {
    case 1LL:
      *char v5 = QOS_CLASS_UTILITY;
      break;
    case 2LL:
      *char v5 = QOS_CLASS_BACKGROUND;
      break;
    case 3LL:
      *char v5 = 5;
      break;
    default:
      *char v5 = QOS_CLASS_UNSPECIFIED;
      break;
  }

  return 0;
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *a1)
{
  a1->__unsigned int sig = 1381452865LL;
  *(_DWORD *)a1->__opaque = 2;
  return 0;
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *a1)
{
  a1->__unsigned int sig = 0LL;
  int result = 0;
  *(_DWORD *)a1->__opaque = 0;
  return result;
}

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1381452865)
  {
    *a2 = *(_DWORD *)a1->__opaque;
    return 0;
  }

  return v3;
}

int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1381452865 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)a1->__opaque = a2;
    return 0;
  }

  return v3;
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  int v11 = 0;
  opaque = (unsigned int *)a1->__opaque;
  unsigned int v33 = 327680;
  if (v1) {
    char v2 = 0;
  }
  else {
    char v2 = 1;
  }
  if ((v2 & 1) == 0) {
    goto LABEL_11;
  }
  unsigned int v32 = 0;
  uint64_t v35 = 3LL;
  uint64_t v36 = 3LL;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v32 = *(void *)(StatusReg + 24);
  unsigned int v31 = 0;
  unsigned int v30 = v32;
  unsigned int v29 = v32;
  do
    unsigned int v3 = __ldaxr(opaque);
  while (!v3 && __stlxr(v32, opaque));
  if (v3) {
    unsigned int v31 = v3;
  }
  BOOL v28 = v3 == 0;
  if (v3) {
LABEL_11:
  }
    os_unfair_lock_lock_with_options(opaque, v33);
  if (a1->__sig == 1381452875)
  {
    unsigned __int8 v17 = a1;
    int v16 = 0;
    BOOL v21 = a1;
    unint64_t v20 = &v15;
    unint64_t v15 = (unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    unint64_t v27 = v15;
    uint64_t v26 = (unsigned __int128 *)&v13;
    int v25 = 3;
    unsigned __int128 v24 = 0u;
    uint64_t v4 = (unsigned __int128 *)v15;
    do
    {
      while (1)
      {
        unsigned __int128 v5 = __ldxp(v4);
        int v6 = (void)v5 != 0LL;
        if (*((void *)&v5 + 1)) {
          ++v6;
        }
        if (v6) {
          break;
        }
        if (!__stxp(0LL, v4)) {
          goto LABEL_20;
        }
      }
    }

    while (__stxp(v5, v4));
LABEL_20:
    unsigned __int128 v23 = v5;
    unsigned __int128 v24 = v5;
    unsigned __int128 v22 = v5;
    *uint64_t v26 = v5;
    if ((v13 & 0xFFFFFF00) != (_DWORD)v14) {
      int v16 = 16;
    }
    int v11 = v16;
  }

  else
  {
    uint64_t v18 = a1;
    if (a1->__sig != 766030772) {
      int v11 = 22;
    }
  }

  if (!v11) {
    a1->__unsigned int sig = 0LL;
  }
  uint64_t v19 = a1->__opaque;
  uint64_t v43 = a1->__opaque;
  unsigned int v42 = 0;
  uint64_t v44 = 3LL;
  uint64_t v45 = 3LL;
  unint64_t v46 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v42 = *(void *)(v46 + 24);
  int v41 = 0;
  unsigned int v40 = v42;
  uint64_t v7 = (unsigned int *)a1->__opaque;
  int v39 = 0;
  unsigned int v8 = v42;
  do
    unsigned int v9 = __ldaxr(v7);
  while (v9 == v8 && __stlxr(0, v7));
  if (v9 != v8) {
    unsigned int v40 = v9;
  }
  BOOL v38 = v9 == v8;
  if (v9 != v8) {
    os_unfair_lock_unlock((os_unfair_lock_t)v43);
  }
  return v11;
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  int v8 = 0;
  if (a2 && a2->__sig != 1381452865) {
    int v8 = 22;
  }
  if (!v8 && a1->__sig == 1381452875)
  {
    uint64_t v13 = a1;
    int v12 = 0;
    unsigned int v32 = a1;
    unsigned int v31 = &v11;
    unint64_t v11 = (unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    unint64_t v38 = v11;
    unsigned int v37 = (unsigned __int128 *)&v9;
    int v36 = 3;
    unsigned __int128 v35 = 0u;
    char v2 = (unsigned __int128 *)v11;
    do
    {
      while (1)
      {
        unsigned __int128 v3 = __ldxp(v2);
        int v4 = (void)v3 != 0LL;
        if (*((void *)&v3 + 1)) {
          ++v4;
        }
        if (v4) {
          break;
        }
        if (!__stxp(0LL, v2)) {
          goto LABEL_13;
        }
      }
    }

    while (__stxp(v3, v2));
LABEL_13:
    unsigned __int128 v34 = v3;
    unsigned __int128 v35 = v3;
    unsigned __int128 v33 = v3;
    *unsigned int v37 = v3;
    if ((v9 & 0xFFFFFF00) != (_DWORD)v10) {
      int v12 = 16;
    }
    int v8 = v12;
  }

  if (!v8)
  {
    opaque = a1->__opaque;
    int v14 = 0;
    *(_DWORD *)a1->__opaque = 0;
    BOOL v28 = a1;
    unint64_t v27 = a2;
    unsigned int v40 = a1;
    int v39 = &v26;
    uint64_t v26 = (pthread_rwlock_t *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
    unsigned int v30 = a1;
    unsigned int v29 = &v25;
    int v25 = (char *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
    if (v26 != (pthread_rwlock_t *)&a1->__opaque[16])
    {
      *(_DWORD *)&v28->__opaque[4] = *(_DWORD *)&v28->__opaque[4] & 0xDFFFFFFF | 0x20000000;
      *(void *)&v28->__opaque[16] = -1LL;
    }

    if (v25 != &v28->__opaque[24])
    {
      unsigned __int128 v5 = v28;
      *(void *)&v28->__opaque[24] = -1LL;
      *(void *)&v5->__opaque[32] = -1LL;
    }

    int v6 = v28;
    *(void *)&v28->__opaque[40] = -1LL;
    *(void *)&v6->__opaque[48] = -1LL;
    v26->__unsigned int sig = 0LL;
    *(void *)&__int128 v24 = 0x1000000C0LL;
    DWORD2(v24) = 0;
    *(_OWORD *)int v25 = v24;
    if (v27 && *(_DWORD *)v27->__opaque == 1)
    {
      *(_DWORD *)&v28->__opaque[4] = *(_DWORD *)&v28->__opaque[4] & 0x3FFFFFFF | 0x40000000;
      *(_DWORD *)&v28->__opaque[8] = 16;
    }

    else
    {
      *(_DWORD *)&v28->__opaque[4] = *(_DWORD *)&v28->__opaque[4] & 0x3FFFFFFF | 0x80000000;
      *(_DWORD *)&v28->__opaque[8] = 32;
    }

    uint64_t v23 = 1381452875LL;
    _platform_bzero(&v28->__opaque[56], 136LL);
    int v22 = v23;
    unint64_t v21 = ~(unint64_t)v28;
    *(void *)&v28->__opaque[56] = ~(unint64_t)v28;
    *(_DWORD *)&v28->__opaque[188] = v22;
    *(_DWORD *)&v28->__opaque[12] = v22;
    unint64_t v20 = (unsigned int *)v28;
    uint64_t v19 = (unsigned int *)&v23;
    HIDWORD(v28->__sig) = HIDWORD(v23);
    unsigned int v18 = 0;
    unsigned int v18 = *v19;
    unsigned int v17 = v18;
    atomic_store(v18, v20);
    unsigned int v16 = v18;
    return 0;
  }

  return v8;
}

uint64_t _pthread_rwlock_lock_slow(void *a1, char a2, char a3)
{
  __int128 v24 = a1;
  char v23 = a2 & 1;
  char v22 = a3 & 1;
  unsigned int v21 = 0;
  unint64_t v27 = a1;
  unsigned int v26 = 0;
  unsigned int v29 = a1;
  if (*a1 == 1381452875LL) {
    unsigned int v28 = v26;
  }
  else {
    unsigned int v28 = _pthread_rwlock_check_init_slow((uint64_t)v27);
  }
  unsigned int v21 = v28;
  if (v28)
  {
    return v21;
  }

  else
  {
    uint64_t v31 = (uint64_t)v24;
    unsigned int v30 = &v20;
    unint64_t v20 = ((unint64_t)v24 + 47) & 0xFFFFFFFFFFFFFFF0LL;
    __int128 v19 = 0uLL;
    __int128 v18 = 0uLL;
    unint64_t v43 = v20;
    unsigned int v42 = (unsigned __int128 *)&v19;
    int v41 = 3;
    unsigned __int128 v40 = 0u;
    unsigned __int128 v3 = (unsigned __int128 *)v20;
    do
    {
      while (1)
      {
        unsigned __int128 v4 = __ldxp(v3);
        int v5 = (void)v4 != 0LL;
        if (*((void *)&v4 + 1)) {
          ++v5;
        }
        if (v5) {
          break;
        }
        if (!__stxp(0LL, v3)) {
          goto LABEL_13;
        }
      }
    }

    while (__stxp(v4, v3));
LABEL_13:
    unsigned __int128 v39 = v4;
    unsigned __int128 v40 = v4;
    unsigned __int128 v38 = v4;
    *unsigned int v42 = v4;
    uint64_t v45 = (uint64_t)v24;
    uint64_t v44 = &v17;
    unsigned int v17 = (void *)(((unint64_t)v24 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v16 = *(void *)(StatusReg - 8);
    if ((v19 & 2) != 0 && *v17 == v16)
    {
      return 11;
    }

    else
    {
      do
      {
        int v15 = 0;
        while (1)
        {
          __int128 v18 = v19;
          if ((v23 & 1) != 0) {
            BOOL v14 = (v19 & 5) == 0;
          }
          else {
            BOOL v14 = (v19 & 0x40) != 0;
          }
          if ((v22 & 1) != 0 && !v14) {
            goto LABEL_43;
          }
          if (!v14) {
            break;
          }
          if ((v23 & 1) == 0)
          {
            LODWORD(v18) = v18 & 0xFFFFFF00;
            LODWORD(v18) = v18 | 0x83;
            goto LABEL_37;
          }

          if (diff_genseq(v19, SDWORD2(v19)) < 0xFFFFFF00)
          {
            LODWORD(v18) = v18 & 0xFFFFFFBF;
LABEL_37:
            LODWORD(v18) = v18 + 256;
            DWORD1(v18) += 256;
            goto LABEL_43;
          }

          if (++v15 > 1024) {
            return 35;
          }
          sched_yield();
          unint64_t v37 = v20;
          int v36 = (unsigned __int128 *)&v19;
          int v35 = 3;
          unsigned __int128 v34 = 0u;
          int v6 = (unsigned __int128 *)v20;
          do
          {
            while (1)
            {
              unsigned __int128 v7 = __ldxp(v6);
              int v8 = (void)v7 != 0LL;
              if (*((void *)&v7 + 1)) {
                ++v8;
              }
              if (v8) {
                break;
              }
              if (!__stxp(0LL, v6)) {
                goto LABEL_34;
              }
            }
          }

          while (__stxp(v7, v6));
LABEL_34:
          unsigned __int128 v33 = v7;
          unsigned __int128 v34 = v7;
          unsigned __int128 v32 = v7;
          unsigned __int128 *v36 = v7;
        }

        if ((v23 & 1) != 0) {
          LODWORD(v18) = v18 & 0xFFFFFFBF;
        }
        else {
          LODWORD(v18) = v18 | 5;
        }
        LODWORD(v18) = v18 + 256;
        if ((BYTE4(v19) & 1) != 0)
        {
          DWORD1(v18) = BYTE4(v18) & 0xFE;
          DWORD1(v18) |= v19 & 0xFFFFFF00;
        }

LABEL_43:
        unint64_t v58 = v20;
        BOOL v57 = (unint64_t *)&v19;
        uint64_t v56 = &v18;
        int v55 = 1;
        BOOL v54 = 0;
        int v53 = 0;
        unint64_t v52 = v19;
        BOOL v51 = 0;
        uint64_t v9 = (unint64_t *)v20;
        uint64_t v49 = v18;
        uint64_t v48 = v18;
        uint64_t v50 = v18;
        uint64_t v10 = v19;
        unint64_t v11 = v18;
        do
          unint64_t v12 = __ldaxr(v9);
        while (v12 == v10 && __stlxr(v11, v9));
        if (v12 != v10) {
          unint64_t v52 = v12;
        }
        BOOL v47 = v12 == v10;
        BOOL v51 = v12 == v10;
        *BOOL v57 = v52;
        BOOL v46 = v51;
        BOOL v54 = v51;
        if (v51) {
          int v53 = 1;
        }
      }

      while (!v53);
      if (v14)
      {
        if ((v23 & 1) == 0) {
          void *v17 = v16;
        }
        return 0;
      }

      else if ((v22 & 1) != 0)
      {
        return 16;
      }

      else
      {
        return _pthread_rwlock_lock_wait((uint64_t)v24, v23 & 1, v18, DWORD2(v18));
      }
    }
  }

uint64_t _pthread_rwlock_lock_wait(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  do
  {
    if ((a2 & 1) != 0) {
      int v9 = __psynch_rw_rdlock(a1, a3, a4, HIDWORD(a3), *(unsigned int *)(a1 + 16));
    }
    else {
      int v9 = __psynch_rw_wrlock(a1, a3, a4, HIDWORD(a3), *(unsigned int *)(a1 + 16));
    }
    if (v9 == -1) {
      int v10 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    else {
      int v10 = 0;
    }
  }

  while (v10 == 4);
  if (v10)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwlock returned unknown error";
    qword_24058 = v10;
    __break(1u);
    JUMPOUT(0x19E90LL);
  }

  uint64_t v20 = a1;
  int v19 = v9;
  BOOL v18 = (v9 & 0x40) != 0;
  uint64_t v22 = a1;
  unsigned int v21 = &v17;
  unsigned int v17 = (unint64_t *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v16 = 0uLL;
  __int128 v15 = 0uLL;
  int v25 = v17;
  __int128 v24 = &v16;
  int v23 = 1;
  *(void *)&__int128 v16 = *v17;
  do
  {
    __int128 v15 = v16;
    if (v18 || (BYTE4(v16) & 2) != 0)
    {
      LODWORD(v15) = _pthread_rwlock_modbits(v16, v19, BYTE4(v16) & 4);
      DWORD1(v15) += v19 & 0xFFFFFF00;
      if (!v18) {
        DWORD1(v15) &= 0xFFFFFF00;
      }
      DWORD1(v15) &= ~4u;
    }

    unsigned __int128 v38 = v17;
    unint64_t v37 = (unint64_t *)&v16;
    int v36 = &v15;
    int v35 = 1;
    BOOL v34 = 0;
    int v33 = 0;
    unint64_t v32 = v16;
    BOOL v31 = 0;
    unsigned __int128 v4 = v17;
    uint64_t v29 = v15;
    uint64_t v28 = v15;
    uint64_t v30 = v15;
    uint64_t v5 = v16;
    unint64_t v6 = v15;
    do
      unint64_t v7 = __ldaxr(v4);
    while (v7 == v5 && __stlxr(v6, v4));
    if (v7 != v5) {
      unint64_t v32 = v7;
    }
    BOOL v27 = v7 == v5;
    BOOL v31 = v7 == v5;
    *unint64_t v37 = v32;
    BOOL v26 = v31;
    BOOL v34 = v31;
    if (v31) {
      int v33 = 1;
    }
  }

  while (!v33);
  return 0LL;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  uint64_t v13 = a1;
  char v12 = 1;
  char v11 = 0;
  __int128 v15 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  unsigned int v17 = v13;
  __int128 v16 = &v10;
  int v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v9 = 0uLL;
  __int128 v8 = 0uLL;
  int v35 = v10;
  BOOL v34 = &v9;
  int v33 = 3;
  __int128 v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  BOOL v7 = 0;
  do
  {
    __int128 v8 = v9;
    if ((v12 & 1) != 0) {
      BOOL v7 = (v9 & 5) == 0;
    }
    else {
      BOOL v7 = (v9 & 0x40) != 0;
    }
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7) {
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      }
      if ((v12 & 1) != 0)
      {
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }

      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }

      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }

    unint64_t v32 = v10;
    BOOL v31 = (unint64_t *)&v9;
    uint64_t v30 = &v8;
    int v29 = 1;
    BOOL v28 = 0;
    int v27 = 0;
    unint64_t v26 = v9;
    BOOL v25 = 0;
    char v1 = v10;
    uint64_t v23 = v8;
    uint64_t v22 = v8;
    uint64_t v24 = v8;
    uint64_t v2 = v9;
    unint64_t v3 = v8;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v26 = v4;
    }
    BOOL v21 = v4 == v2;
    BOOL v25 = v4 == v2;
    *BOOL v31 = v26;
    BOOL v20 = v25;
    BOOL v28 = v25;
    if (v25) {
      int v27 = 1;
    }
  }

  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      int v19 = v13;
      BOOL v18 = &v6;
      unint64_t v6 = (void *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *unint64_t v6 = *(void *)(StatusReg - 8);
    }

    return 0;
  }

  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1A588LL);
    }

    return 16;
  }

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  uint64_t v13 = a1;
  char v12 = 1;
  char v11 = 1;
  __int128 v15 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  unsigned int v17 = v13;
  __int128 v16 = &v10;
  int v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v9 = 0uLL;
  __int128 v8 = 0uLL;
  int v35 = v10;
  BOOL v34 = &v9;
  int v33 = 3;
  __int128 v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  BOOL v7 = 0;
  do
  {
    __int128 v8 = v9;
    if ((v12 & 1) != 0) {
      BOOL v7 = (v9 & 5) == 0;
    }
    else {
      BOOL v7 = (v9 & 0x40) != 0;
    }
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7) {
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      }
      if ((v12 & 1) != 0)
      {
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }

      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }

      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }

    unint64_t v32 = v10;
    BOOL v31 = (unint64_t *)&v9;
    uint64_t v30 = &v8;
    int v29 = 1;
    BOOL v28 = 0;
    int v27 = 0;
    unint64_t v26 = v9;
    BOOL v25 = 0;
    char v1 = v10;
    uint64_t v23 = v8;
    uint64_t v22 = v8;
    uint64_t v24 = v8;
    uint64_t v2 = v9;
    unint64_t v3 = v8;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v26 = v4;
    }
    BOOL v21 = v4 == v2;
    BOOL v25 = v4 == v2;
    *BOOL v31 = v26;
    BOOL v20 = v25;
    BOOL v28 = v25;
    if (v25) {
      int v27 = 1;
    }
  }

  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      int v19 = v13;
      BOOL v18 = &v6;
      unint64_t v6 = (void *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *unint64_t v6 = *(void *)(StatusReg - 8);
    }

    return 0;
  }

  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1AC80LL);
    }

    return 16;
  }

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  uint64_t v13 = a1;
  char v12 = 0;
  char v11 = 0;
  __int128 v15 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  unsigned int v17 = v13;
  __int128 v16 = &v10;
  int v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v9 = 0uLL;
  __int128 v8 = 0uLL;
  int v35 = v10;
  BOOL v34 = &v9;
  int v33 = 3;
  __int128 v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  BOOL v7 = 0;
  do
  {
    __int128 v8 = v9;
    if ((v12 & 1) != 0) {
      BOOL v7 = (v9 & 5) == 0;
    }
    else {
      BOOL v7 = (v9 & 0x40) != 0;
    }
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7) {
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      }
      if ((v12 & 1) != 0)
      {
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }

      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }

      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }

    unint64_t v32 = v10;
    BOOL v31 = (unint64_t *)&v9;
    uint64_t v30 = &v8;
    int v29 = 1;
    BOOL v28 = 0;
    int v27 = 0;
    unint64_t v26 = v9;
    BOOL v25 = 0;
    char v1 = v10;
    uint64_t v23 = v8;
    uint64_t v22 = v8;
    uint64_t v24 = v8;
    uint64_t v2 = v9;
    unint64_t v3 = v8;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v26 = v4;
    }
    BOOL v21 = v4 == v2;
    BOOL v25 = v4 == v2;
    *BOOL v31 = v26;
    BOOL v20 = v25;
    BOOL v28 = v25;
    if (v25) {
      int v27 = 1;
    }
  }

  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      int v19 = v13;
      BOOL v18 = &v6;
      unint64_t v6 = (void *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *unint64_t v6 = *(void *)(StatusReg - 8);
    }

    return 0;
  }

  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1B374LL);
    }

    return 16;
  }

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  uint64_t v13 = a1;
  char v12 = 0;
  char v11 = 1;
  __int128 v15 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  unsigned int v17 = v13;
  __int128 v16 = &v10;
  int v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v9 = 0uLL;
  __int128 v8 = 0uLL;
  int v35 = v10;
  BOOL v34 = &v9;
  int v33 = 3;
  __int128 v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  }
  BOOL v7 = 0;
  do
  {
    __int128 v8 = v9;
    if ((v12 & 1) != 0) {
      BOOL v7 = (v9 & 5) == 0;
    }
    else {
      BOOL v7 = (v9 & 0x40) != 0;
    }
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7) {
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      }
      if ((v12 & 1) != 0)
      {
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }

      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }

      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }

    unint64_t v32 = v10;
    BOOL v31 = (unint64_t *)&v9;
    uint64_t v30 = &v8;
    int v29 = 1;
    BOOL v28 = 0;
    int v27 = 0;
    unint64_t v26 = v9;
    BOOL v25 = 0;
    char v1 = v10;
    uint64_t v23 = v8;
    uint64_t v22 = v8;
    uint64_t v24 = v8;
    uint64_t v2 = v9;
    unint64_t v3 = v8;
    do
      unint64_t v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2) {
      unint64_t v26 = v4;
    }
    BOOL v21 = v4 == v2;
    BOOL v25 = v4 == v2;
    *BOOL v31 = v26;
    BOOL v20 = v25;
    BOOL v28 = v25;
    if (v25) {
      int v27 = 1;
    }
  }

  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      int v19 = v13;
      BOOL v18 = &v6;
      unint64_t v6 = (void *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *unint64_t v6 = *(void *)(StatusReg - 8);
    }

    return 0;
  }

  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1BA6CLL);
    }

    return 16;
  }

uint64_t _pthread_rwlock_unlock_slow(void *a1, int a2)
{
  int v29 = a1;
  int v28 = a2;
  unsigned int v27 = 0;
  int v26 = 3;
  unint64_t v32 = a1;
  unsigned int v31 = 0;
  BOOL v34 = a1;
  if (*a1 == 1381452875LL) {
    unsigned int v33 = v31;
  }
  else {
    unsigned int v33 = _pthread_rwlock_check_init_slow((uint64_t)v32);
  }
  unsigned int v27 = v33;
  if (v33)
  {
    return v27;
  }

  else
  {
    uint64_t v36 = (uint64_t)v29;
    int v35 = &v25;
    BOOL v25 = (_OWORD *)(((unint64_t)v29 + 47) & 0xFFFFFFFFFFFFFFF0LL);
    __int128 v24 = 0uLL;
    __int128 v23 = 0uLL;
    int v41 = v25;
    unsigned __int128 v40 = &v24;
    int v39 = v26;
    __int128 v24 = *v25;
    if ((v24 & 0x40) != 0)
    {
      return 0;
    }

    else
    {
      if ((v24 & 2) != 0)
      {
        uint64_t v38 = (uint64_t)v29;
        unint64_t v37 = &v22;
        uint64_t v22 = (void *)(((unint64_t)v29 + 31) & 0xFFFFFFFFFFFFFFF8LL);
        *uint64_t v22 = 0LL;
      }

      do
      {
        v26 &= ~v28;
        __int128 v23 = v24;
        if ((v26 & 2) != 0) {
          DWORD2(v23) += 256;
        }
        char v21 = 0;
        int v20 = v24 & 0xFFFFFF00;
        if (DWORD2(v23) == (v24 & 0xFFFFFF00))
        {
          LODWORD(v23) = v20 | 0xC0;
          DWORD1(v23) = v20 | 1;
        }

        else if ((v24 & 7) != 0 && DWORD2(v23) == (DWORD1(v24) & 0xFFFFFF00))
        {
          char v21 = 1;
          LODWORD(v23) = v20 | 1;
          DWORD1(v23) |= 2u;
          if ((v24 & 4) != 0) {
            DWORD1(v23) |= 4u;
          }
        }

        int v19 = v26;
        BOOL v68 = v25;
        uint64_t v67 = (unsigned __int128 *)&v24;
        unint64_t v66 = &v23;
        int v65 = v26;
        BOOL v64 = 0;
        int v63 = 0;
        switch(v26)
        {
          case 1:
            unint64_t v55 = 0LL;
            unint64_t v55 = *(void *)v67;
            BOOL v54 = 0;
            int v10 = (unint64_t *)v68;
            unint64_t v52 = 0LL;
            unint64_t v52 = *(void *)v66;
            unint64_t v51 = v52;
            unint64_t v53 = v52;
            unint64_t v11 = v55;
            unint64_t v12 = v52;
            do
              unint64_t v13 = __ldaxr(v10);
            while (v13 == v11 && __stlxr(v12, v10));
            if (v13 != v11) {
              unint64_t v55 = v13;
            }
            BOOL v50 = v13 == v11;
            BOOL v54 = v13 == v11;
            *(void *)uint64_t v67 = v55;
            BOOL v49 = v54;
            BOOL v64 = v54;
            if (v54) {
              int v63 = 1;
            }
            break;
          case 2:
            unsigned int v48 = 0;
            unsigned int v48 = *((_DWORD *)v67 + 2);
            BOOL v47 = 0;
            BOOL v14 = (unsigned int *)v68 + 2;
            unsigned int v45 = 0;
            unsigned int v45 = *((_DWORD *)v66 + 2);
            unsigned int v44 = v45;
            unsigned int v46 = v45;
            unsigned int v15 = v48;
            unsigned int v16 = v45;
            do
              unsigned int v17 = __ldaxr(v14);
            while (v17 == v15 && __stlxr(v16, v14));
            if (v17 != v15) {
              unsigned int v48 = v17;
            }
            BOOL v43 = v17 == v15;
            BOOL v47 = v17 == v15;
            *((_DWORD *)v67 + 2) = v48;
            BOOL v42 = v47;
            BOOL v64 = v47;
            if (v47) {
              int v63 = 2;
            }
            break;
          case 3:
            unsigned __int128 v62 = 0u;
            unsigned __int128 v62 = *v67;
            BOOL v61 = 0;
            uint64_t v2 = v68;
            __int128 v59 = 0u;
            __int128 v59 = *v66;
            __int128 v58 = v59;
            __int128 v60 = v59;
            unsigned __int128 v3 = v62;
            uint64_t v4 = *((void *)&v62 + 1);
            uint64_t v5 = v62;
            unint64_t v6 = *((void *)&v59 + 1);
            unint64_t v7 = v59;
            do
            {
              while (1)
              {
                unsigned __int128 v8 = __ldxp(v2);
                int v9 = (void)v8 != v5;
                if (*((void *)&v8 + 1) != v4) {
                  ++v9;
                }
                if (v9) {
                  break;
                }
                if (!__stlxp(__PAIR128__(v6, v7), v2)) {
                  goto LABEL_28;
                }
              }
            }

            while (__stlxp(v8, v2));
LABEL_28:
            if (v8 != v3) {
              unsigned __int128 v62 = v8;
            }
            BOOL v57 = v8 == v3;
            BOOL v61 = v57;
            *uint64_t v67 = v62;
            BOOL v56 = v61;
            BOOL v64 = v61;
            if (v61) {
              int v63 = 3;
            }
            break;
          default:
            __break(1u);
            JUMPOUT(0x1C138LL);
        }

        int v28 = v63;
      }

      while (v19 != v63);
      if ((v21 & 1) != 0) {
        return _pthread_rwlock_unlock_drop((uint64_t)v29, v24, *((uint64_t *)&v24 + 1), v23, DWORD2(v23));
      }
      return v27;
    }
  }

uint64_t _pthread_rwlock_unlock_drop(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  unsigned int v8 = HIDWORD(a4);
  do
  {
    else {
      int v6 = 0;
    }
  }

  while (v6 == 4);
  if (v6)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwunlock returned unknown error";
    qword_24058 = v6;
    __break(1u);
    JUMPOUT(0x1C2B4LL);
  }

  return 0LL;
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  unsigned int v27 = a1;
  int v26 = 3;
  int v25 = 0;
  int v29 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_unlock_slow(v27, v25);
  }
  unsigned int v31 = v27;
  uint64_t v30 = &v24;
  __int128 v24 = (_OWORD *)((unint64_t)&v27->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  __int128 v23 = 0uLL;
  __int128 v22 = 0uLL;
  uint64_t v36 = v24;
  int v35 = &v23;
  int v34 = v26;
  __int128 v23 = *v24;
  if ((v23 & 0x40) != 0) {
    return 0;
  }
  if ((v23 & 2) != 0)
  {
    unsigned int v33 = v27;
    unint64_t v32 = &v21;
    char v21 = (void *)((unint64_t)&v27->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
    *char v21 = 0LL;
  }

  do
  {
    if (v25) {
      return _pthread_rwlock_unlock_slow(v27, v25);
    }
    __int128 v22 = v23;
    if ((v26 & 2) != 0) {
      DWORD2(v22) += 256;
    }
    int v20 = v23 & 0xFFFFFF00;
    if (DWORD2(v22) == (v23 & 0xFFFFFF00))
    {
      LODWORD(v22) = v20 | 0xC0;
      DWORD1(v22) = v20 | 1;
    }

    else
    {
      BOOL v19 = 1;
      if ((v23 & 7) != 0) {
        BOOL v19 = DWORD2(v22) != (DWORD1(v23) & 0xFFFFFF00);
      }
      if (!v19) {
        return _pthread_rwlock_unlock_slow(v27, v25);
      }
    }

    int v18 = v26;
    int v63 = v24;
    unsigned __int128 v62 = (unsigned __int128 *)&v23;
    BOOL v61 = &v22;
    int v60 = v26;
    BOOL v59 = 0;
    int v58 = 0;
    switch(v26)
    {
      case 1:
        unint64_t v50 = 0LL;
        unint64_t v50 = *(void *)v62;
        BOOL v49 = 0;
        int v9 = (unint64_t *)v63;
        unint64_t v47 = 0LL;
        unint64_t v47 = *(void *)v61;
        unint64_t v46 = v47;
        unint64_t v48 = v47;
        unint64_t v10 = v50;
        unint64_t v11 = v47;
        do
          unint64_t v12 = __ldaxr(v9);
        while (v12 == v10 && __stlxr(v11, v9));
        if (v12 != v10) {
          unint64_t v50 = v12;
        }
        BOOL v45 = v12 == v10;
        BOOL v49 = v12 == v10;
        *(void *)unsigned __int128 v62 = v50;
        BOOL v44 = v49;
        BOOL v59 = v49;
        if (v49) {
          int v58 = 1;
        }
        break;
      case 2:
        unsigned int v43 = 0;
        unsigned int v43 = *((_DWORD *)v62 + 2);
        BOOL v42 = 0;
        unint64_t v13 = (unsigned int *)v63 + 2;
        unsigned int v40 = 0;
        unsigned int v40 = *((_DWORD *)v61 + 2);
        unsigned int v39 = v40;
        unsigned int v41 = v40;
        unsigned int v14 = v43;
        unsigned int v15 = v40;
        do
          unsigned int v16 = __ldaxr(v13);
        while (v16 == v14 && __stlxr(v15, v13));
        if (v16 != v14) {
          unsigned int v43 = v16;
        }
        BOOL v38 = v16 == v14;
        BOOL v42 = v16 == v14;
        *((_DWORD *)v62 + 2) = v43;
        BOOL v37 = v42;
        BOOL v59 = v42;
        if (v42) {
          int v58 = 2;
        }
        break;
      case 3:
        unsigned __int128 v57 = 0u;
        unsigned __int128 v57 = *v62;
        BOOL v56 = 0;
        char v1 = v63;
        __int128 v54 = 0u;
        __int128 v54 = *v61;
        __int128 v53 = v54;
        __int128 v55 = v54;
        unsigned __int128 v2 = v57;
        uint64_t v3 = *((void *)&v57 + 1);
        uint64_t v4 = v57;
        unint64_t v5 = *((void *)&v54 + 1);
        unint64_t v6 = v54;
        do
        {
          while (1)
          {
            unsigned __int128 v7 = __ldxp(v1);
            int v8 = (void)v7 != v4;
            if (*((void *)&v7 + 1) != v3) {
              ++v8;
            }
            if (v8) {
              break;
            }
            if (!__stlxp(__PAIR128__(v5, v6), v1)) {
              goto LABEL_26;
            }
          }
        }

        while (__stlxp(v7, v1));
LABEL_26:
        if (v7 != v2) {
          unsigned __int128 v57 = v7;
        }
        BOOL v52 = v7 == v2;
        BOOL v56 = v52;
        *unsigned __int128 v62 = v57;
        BOOL v51 = v56;
        BOOL v59 = v56;
        if (v56) {
          int v58 = 3;
        }
        break;
      default:
        __break(1u);
        JUMPOUT(0x1C928LL);
    }

    int v25 = v58;
  }

  while (v18 != v58);
  return 0;
}

uint64_t _pthread_rwlock_check_init_slow(uint64_t a1)
{
  unsigned int v10 = 22;
  BOOL v1 = *(void *)a1 == 766030772LL;
  if (*(void *)a1 == 766030772LL)
  {
    int v29 = (unsigned int *)(a1 + 8);
    unsigned int v28 = 327680;
    char v2 = !v1;
    if ((v2 & 1) == 0) {
      goto LABEL_12;
    }
    unsigned int v27 = 0;
    uint64_t v30 = 3LL;
    uint64_t v31 = 3LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v27 = *(void *)(StatusReg + 24);
    unsigned int v26 = 0;
    unsigned int v25 = v27;
    unsigned int v24 = v27;
    do
      unsigned int v3 = __ldaxr(v29);
    while (!v3 && __stlxr(v27, v29));
    if (v3) {
      unsigned int v26 = v3;
    }
    BOOL v23 = v3 == 0;
    if (v3) {
LABEL_12:
    }
      os_unfair_lock_lock_with_options(v29, v28);
    if (*(void *)a1 == 766030772LL)
    {
      uint64_t v18 = a1;
      uint64_t v17 = 0LL;
      uint64_t v22 = a1;
      char v21 = &v16;
      unsigned int v16 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
      uint64_t v20 = a1;
      BOOL v19 = &v15;
      unsigned int v15 = (_OWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0LL);
      if (v16 != (void *)(a1 + 24))
      {
        *(_DWORD *)(v18 + 12) = *(_DWORD *)(v18 + 12) & 0xDFFFFFFF | 0x20000000;
        *(void *)(v18 + 24) = -1LL;
      }

      if (v15 != (_OWORD *)(v18 + 32))
      {
        uint64_t v4 = v18;
        *(void *)(v18 + 32) = -1LL;
        *(void *)(v4 + 40) = -1LL;
      }

      uint64_t v5 = v18;
      *(void *)(v18 + 48) = -1LL;
      *(void *)(v5 + 56) = -1LL;
      void *v16 = 0LL;
      *(void *)&__int128 v14 = 0x1000000C0LL;
      DWORD2(v14) = 0;
      *unsigned int v15 = v14;
      if (v17 && *(_DWORD *)(v17 + 8) == 1)
      {
        *(_DWORD *)(v18 + 12) = *(_DWORD *)(v18 + 12) & 0x3FFFFFFF | 0x40000000;
        *(_DWORD *)(v18 + 16) = 16;
      }

      else
      {
        *(_DWORD *)(v18 + 12) = *(_DWORD *)(v18 + 12) & 0x3FFFFFFF | 0x80000000;
        *(_DWORD *)(v18 + 16) = 32;
      }

      BYTE1(v13[2]) = 0;
      HIWORD(v13[2]) = 0;
      _platform_bzero(v18 + 64, 136LL);
      strcpy((char *)v13, "KLWRKLWR");
      *(void *)(v18 + 64) = ~v18;
      *(_DWORD *)(v18 + 196) = v13[0];
      *(_DWORD *)(v18 + 20) = v13[0];
      unint64_t v12 = (unsigned int *)v18;
      *(_DWORD *)(v18 + 4) = v13[2];
      atomic_store(v13[1], v12);
      unsigned int v10 = 0;
    }

    else if (*(void *)a1 == 1381452875LL)
    {
      unsigned int v10 = 0;
    }

    os_unfair_lock_t v38 = (os_unfair_lock_t)(a1 + 8);
    unsigned int v37 = 0;
    uint64_t v39 = 3LL;
    uint64_t v40 = 3LL;
    unint64_t v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v37 = *(void *)(v41 + 24);
    int v36 = 0;
    unsigned int v35 = v37;
    unint64_t v6 = (unsigned int *)(a1 + 8);
    int v34 = 0;
    unsigned int v7 = v37;
    do
      unsigned int v8 = __ldaxr(v6);
    while (v8 == v7 && __stlxr(0, v6));
    if (v8 != v7) {
      unsigned int v35 = v8;
    }
    BOOL v33 = v8 == v7;
    if (v8 != v7) {
      os_unfair_lock_unlock(v38);
    }
  }

  else if (*(void *)a1 == 1381452875LL)
  {
    return 0;
  }

  return v10;
}

uint64_t _pthread_rwlock_modbits(int a1, unsigned __int8 a2, int a3)
{
  int v4 = (a1 | a2) & 0xBF;
  if ((a2 & 1) == 0 && (a1 & 4) == 0) {
    int v4 = (a1 | a2) & 0xBE;
  }
  if (a3 && (a3 & 4) != 0 && (v4 & 4) == 0 && (v4 & 2) == 0) {
    v4 |= 5u;
  }
  return a1 & 0xFFFFFF00 | v4;
}

uint64_t pthread_chdir_np(uint64_t a1)
{
  return __pthread_chdir(a1);
}

uint64_t pthread_fchdir_np(unsigned int a1)
{
  return __pthread_fchdir(a1);
}

  ;
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  int v4 = 35;
  os_unfair_lock_lock_with_options(&__pthread_tsd_lock, 327680LL);
  for (pthread_key_t i = 256LL; i < 0x300; ++i)
  {
    if ((_pthread_key_set_destructor(i, (uint64_t)a2) & 1) != 0)
    {
      *a1 = i;
      int v4 = 0;
      break;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
  return v4;
}

uint64_t _pthread_key_set_destructor(uint64_t a1, uint64_t a2)
{
  if (_pthread_keys[a1])
  {
    char v3 = 0;
  }

  else
  {
    _pthread_keys[a1] = ~a2;
    char v3 = 1;
  }

  return v3 & 1;
}

int pthread_key_delete(pthread_key_t a1)
{
  int v3 = 22;
  os_unfair_lock_lock_with_options(&__pthread_tsd_lock, 327680LL);
  if (a1 >= 0x100 && a1 < 0x300 && (_pthread_key_unset_destructor(a1) & 1) != 0)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680LL);
    os_unfair_lock_unlock(&_pthread_list_lock);
    int v3 = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
  return v3;
}

uint64_t _pthread_key_unset_destructor(uint64_t a1)
{
  if (_pthread_keys[a1])
  {
    _pthread_keys[a1] = 0LL;
    char v2 = 1;
  }

  else
  {
    char v2 = 0;
  }

  return v2 & 1;
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224, a1, (uint64_t)a2);
}

uint64_t _pthread_setspecific(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unsigned int v5 = 22;
  if (a2 >= 0xA && a2 < 0x300)
  {
    char v4 = _pthread_key_get_destructor(a2, 0LL) & 1;
    if (a2 < 0x100 || (v4 & 1) != 0)
    {
      *(void *)(a1 + 224 + 8 * a2) = a3;
      unsigned int v5 = 0;
      if (a2 < 0x100) {
        _pthread_key_set_destructor(a2, 0LL);
      }
    }
  }

  return v5;
}

uint64_t _pthread_setspecific_static(unint64_t a1, uint64_t a2)
{
  unsigned int v3 = 22;
  if (a1 < 0x100)
  {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1) = a2;
    return 0;
  }

  return v3;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1);
}

int pthread_introspection_setspecific_np(pthread_t thread, pthread_key_t key, const void *value)
{
  if (*(_WORD *)&_pthread_self()->__opaque[34] != 1)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_setspecific_np outside of a CREATE"
                           " introspection hook";
    __break(1u);
    JUMPOUT(0x1D558LL);
  }

  return _pthread_setspecific((uint64_t)thread, key, (uint64_t)value);
}

pthread_t _pthread_self()
{
  return pthread_self();
}

void *__cdecl pthread_introspection_getspecific_np(pthread_t thread, pthread_key_t key)
{
  if (*(_WORD *)&_pthread_self()->__opaque[34] != 4)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_getspecific_np outside of a DESTRO"
                           "Y introspection hook";
    __break(1u);
    JUMPOUT(0x1D5E4LL);
  }

  return *(void **)&thread->__opaque[8 * key + 208];
}

uint64_t _pthread_tsd_cleanup(uint64_t a1)
{
  return _pthread_tsd_cleanup_new(a1);
}

uint64_t _pthread_tsd_cleanup_new(uint64_t result)
{
  uint64_t v5 = result;
  for (int i = 0; i < 4; ++i)
  {
    for (unint64_t k = 125LL; k <= 0xD1; ++k)
      int result = _pthread_tsd_cleanup_key(v5, k);
    for (unint64_t m = 10LL; m <= __pthread_tsd_max; ++m)
      int result = _pthread_tsd_cleanup_key(v5, m);
  }

  *(_WORD *)(v5 + 76) = 0;
  return result;
}

uint64_t pthread_key_init_np(int a1, uint64_t a2)
{
  unsigned int v3 = 22;
  if (a1 >= 10 && a1 < 256)
  {
    os_unfair_lock_lock_with_options(&__pthread_tsd_lock, 327680LL);
    _pthread_key_set_destructor(a1, a2);
    if (a1 > __pthread_tsd_max) {
      __pthread_tsd_max = a1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
    return 0;
  }

  return v3;
}

pthread_t pthread_self(void)
{
  BOOL v1 = (_opaque_pthread_t *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((_opaque_pthread_t *)(v1->__sig ^ _pthread_ptr_munge_token) != v1) {
    abort_with_reason(18LL, 4LL, "pthread_t was corrupted", 0LL);
  }
  return v1;
}

uint64_t _pthread_key_get_destructor(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = _pthread_keys[a1];
  if (v3)
  {
    if (a2) {
      *a2 = ~v3;
    }
    char v4 = 1;
  }

  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

uint64_t _pthread_tsd_cleanup_key(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  uint64_t v5 = 0LL;
  uint64_t result = _pthread_key_get_destructor(a2, (uint64_t *)&v5);
  if ((result & 1) != 0)
  {
    char v4 = (uint64_t *)(v7 + 224 + 8 * v6);
    uint64_t v3 = *v4;
    if (*v4)
    {
      *char v4 = 0LL;
      if (v5) {
        return v5(v3);
      }
    }
  }

  return result;
}

int pthread_join(pthread_t a1, void **a2)
{
  int v2 = _pthread_conformance_0();
  return _pthread_join((uint64_t)a1, (uint64_t *)a2, v2);
}

void _pthread_testcancel_if_cancelable_variant_0()
{
}

uint64_t _pthread_conformance_0()
{
  return 2LL;
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  int v2 = _pthread_conformance_0();
  return _pthread_cond_wait((uint64_t)a1, a2, 0LL, 0, v2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  int v3 = _pthread_conformance_0();
  return _pthread_cond_wait((uint64_t)a1, a2, &a3->tv_sec, 0, v3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  int v3 = 0;
  _pthread_testcancel_if_cancelable_variant_0();
  if (__sigwait(a1, a2) == -1)
  {
    int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    _pthread_testcancel_if_cancelable_variant_0();
    if (v3 == 4) {
      return 0;
    }
  }

  return v3;
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  kern_return_t v8;
  uint64_t v9;
  vm_size_t v10;
  int v11;
  void (*v12)(void);
  void (*v13)(void);
  void (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v14 = a1;
  unint64_t v13 = a2;
  unint64_t v12 = a3;
  unint64_t v11 = 0;
  unsigned int v10 = 0LL;
  int v9 = 0LL;
  unsigned int v25 = 16LL;
  unsigned int v24 = 320LL;
  BOOL v23 = _pthread_globals_init;
  uint64_t v22 = &_os_alloc_once_table[32];
  if (_os_alloc_once_table[32] == -1LL)
  {
    unsigned int v26 = v22[1];
  }

  else
  {
    char v21 = _os_alloc_once(v22, v24, v23);
    unsigned int v26 = v21;
  }

  int v9 = v26;
  uint64_t v17 = v26 + 12;
  os_unfair_lock_lock_with_options(v26 + 12, 327680LL);
  vm_size_t v3 = *(void *)(v26 + 16);
  *(void *)(v26 + 16) = v3 + 1;
  unsigned int v10 = v3;
  if (v3)
  {
    if (v10 == 10)
    {
      unsigned int v8 = 0;
      mach_vm_address_t v7 = 0LL;
      vm_size_t size = 24 * (vm_page_size / 0x18);
      uint64_t v20 = v9 + 12;
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
      unsigned int v8 = mach_vm_map(mach_task_self_, &v7, size, vm_page_size - 1, 1224736769, 0, 0LL, 0, 3, 7, 1u);
      unsigned int v16 = v9 + 12;
      os_unfair_lock_lock_with_options(v9 + 12, 327680LL);
      if (v8)
      {
        unint64_t v11 = 12;
      }

      else if (*(void *)(v9 + 264) == v9 + 24)
      {
        *(void *)(v9 + 264) = v7;
        _platform_memmove(*(void *)(v9 + 264), v9 + 24, 240LL);
        _platform_bzero(v9 + 24, 240LL);
      }

      else
      {
        BOOL v19 = v9 + 12;
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
        mach_vm_deallocate(mach_task_self_, v7, size);
        unsigned int v15 = v9 + 12;
        os_unfair_lock_lock_with_options(v9 + 12, 327680LL);
      }
    }

    else if (v10 >= vm_page_size / 0x18)
    {
      unint64_t v11 = 12;
    }
  }

  else
  {
    *(void *)(v9 + 264) = v9 + 24;
  }

  if (!v11)
  {
    uint64_t v5 = (void (**)(void))(*(void *)(v9 + 264) + 24 * v10);
    *uint64_t v5 = v14;
    v5[1] = v13;
    v5[2] = v12;
  }

  uint64_t v18 = v9 + 12;
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
  return v11;
}

uint64_t _pthread_atfork_prepare_handlers()
{
  if (_os_alloc_once_table[32] == -1LL) {
    uint64_t v3 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v3 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
  }
  uint64_t result = os_unfair_lock_lock_with_options(v3 + 12, 327680LL);
  for (uint64_t i = *(void *)(v3 + 16); i; --i)
  {
    BOOL v1 = (uint64_t (**)(uint64_t))(*(void *)(v3 + 264) + 24 * (i - 1));
    if (*v1) {
      uint64_t result = (*v1)(result);
    }
  }

  return result;
}

uint64_t _pthread_atfork_prepare()
{
  if (_os_alloc_once_table[32] == -1LL) {
    BOOL v1 = (void *)_os_alloc_once_table[33];
  }
  else {
    BOOL v1 = (void *)_os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
  }
  os_unfair_lock_lock_with_options(v1 + 1, 327680LL);
  *BOOL v1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return os_unfair_lock_lock_with_options(*v1 + 72LL, 327680LL);
}

void _pthread_atfork_parent()
{
  if (_os_alloc_once_table[32] == -1LL) {
    uint64_t v0 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v0 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)v0 + 72LL));
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 8));
}

void _pthread_atfork_parent_handlers()
{
  if (_os_alloc_once_table[32] == -1LL) {
    uint64_t v2 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v2 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
  }
  for (unint64_t i = 0LL; i < *(void *)(v2 + 16); ++i)
  {
    uint64_t v0 = *(void *)(v2 + 264) + 24 * i;
    if (*(void *)(v0 + 8)) {
      (*(void (**)(void))(v0 + 8))();
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 12));
}

uint64_t _pthread_atfork_child()
{
  uint64_t v2 = 0LL;
  uint64_t v9 = 16LL;
  uint64_t v8 = 320LL;
  mach_vm_address_t v7 = _pthread_globals_init;
  uint64_t v6 = &_os_alloc_once_table[32];
  if (_os_alloc_once_table[32] == -1LL)
  {
    uint64_t v10 = v6[1];
  }

  else
  {
    uint64_t v5 = _os_alloc_once(v6, v8, v7);
    uint64_t v10 = v5;
  }

  uint64_t v2 = (uint64_t *)v10;
  uint64_t v4 = v10 + 8;
  int v3 = 0;
  *(_DWORD *)(v10 + 8) = 0;
  __is_threaded = 0;
  _pthread_main_thread_postfork_init(*v2);
  memset(__b, 0, sizeof(__b));
  return _pthread_bsdthread_init((uint64_t)__b);
}

void _pthread_atfork_child_handlers()
{
  if (_os_alloc_once_table[32] == -1LL) {
    uint64_t v2 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v2 = _os_alloc_once(&_os_alloc_once_table[32], 320LL, _pthread_globals_init);
  }
  for (unint64_t i = 0LL; i < *(void *)(v2 + 16); ++i)
  {
    uint64_t v0 = *(void *)(v2 + 264) + 24 * i;
    if (*(void *)(v0 + 16)) {
      (*(void (**)(void))(v0 + 16))();
    }
  }

  *(_DWORD *)(v2 + 12) = 0;
}

uint64_t _pthread_fork_prepare()
{
  return _pthread_atfork_prepare();
}

void _pthread_fork_parent()
{
}

uint64_t _pthread_fork_child()
{
  return _pthread_atfork_child();
}

void _pthread_fork_child_postinit()
{
}

float pthread_dependency_init_np(_OWORD *a1, _opaque_pthread_t *a2)
{
  float result = COERCE_FLOAT(pthread_mach_thread_np(a2));
  *a1 = LODWORD(result);
  return result;
}

uint64_t _pthread_dependency_fulfill_slow(uint64_t a1, unsigned int a2)
{
  if (a2 == -1)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fufilling pthread_dependency_t twice";
    __break(1u);
    JUMPOUT(0x1E6A8LL);
  }

  if (a2 != *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fulfilled a dependency not owned by current thread";
    qword_24058 = a2;
    __break(1u);
    JUMPOUT(0x1E720LL);
  }

  uint64_t result = __ulock_wake(16777218LL, a1 + 4, 0LL);
  if ((-(int)result | 2) != 2)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __ulock_wake() failed";
    qword_24058 = -(int)result;
    __break(1u);
    JUMPOUT(0x1E7B4LL);
  }

  return result;
}

uint64_t pthread_dependency_fulfill_np(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  unsigned int v5 = *(_DWORD *)(result + 4);
  do
  {
    unsigned int v2 = v5;
    uint64_t v4 = (unsigned int *)(result + 4);
    do
      unsigned int v3 = __ldaxr(v4);
    while (v3 == v5 && __stlxr(0xFFFFFFFF, v4));
    unsigned int v5 = v3;
  }

  while (v3 != v2);
  if (v3) {
    return _pthread_dependency_fulfill_slow(result, v3);
  }
  return result;
}

uint64_t pthread_dependency_wait_np(unsigned int *a1)
{
  BOOL v1 = a1 + 1;
  unsigned int v2 = *a1;
  do
    unsigned int v3 = __ldaxr(v1);
  while (!v3 && __stlxr(v2, v1));
  if (!v3)
  {
    do
    {
      int v8 = __ulock_wait(16777218LL, a1 + 1, *a1);
      int v7 = -v8;
      if (v8 && v7 != 4 && v7 != 14)
      {
        if (v7 != 105)
        {
          qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: __ulock_wait() failed";
          qword_24058 = -v8;
          __break(1u);
          JUMPOUT(0x1EA8CLL);
        }

        uint64_t v4 = *a1;
        qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Waiting on orphaned dependency";
        qword_24058 = v4;
        __break(1u);
        JUMPOUT(0x1EA40LL);
      }
    }

    while (a1[1] == *a1);
  }

  unsigned int v5 = atomic_load(a1 + 1);
  if (v5 != -1)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Corrupted pthread_dependency_t";
    qword_24058 = v5;
    __break(1u);
    JUMPOUT(0x1EB20LL);
  }

  return *((void *)a1 + 1);
}

unint64_t _pthread_atomic_xchg_ptr(unint64_t *a1, unint64_t a2)
{
  unint64_t v5 = *a1;
  do
  {
    unint64_t v2 = v5;
    do
      unint64_t v3 = __ldaxr(a1);
    while (v3 == v5 && __stlxr(a2, a1));
    unint64_t v5 = v3;
  }

  while (v3 != v2);
  return v3;
}

uint64_t _pthread_atomic_xchg_uint32_relaxed(unsigned int *a1, unsigned int a2)
{
  unsigned int v5 = *a1;
  do
  {
    unsigned int v2 = v5;
    do
      unsigned int v3 = __ldaxr(a1);
    while (v3 == v5 && __stlxr(a2, a1));
    unsigned int v5 = v3;
  }

  while (v3 != v2);
  return v3;
}

void start_wqthread(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
}

void thread_start( unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void thread_chkstk_darwin( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((unint64_t)&a9 >= *(void *)(StatusReg - 48)
    || (unint64_t v11 = *(void *)(StatusReg - 40), (unint64_t)&a9 <= v11)
    || (unint64_t)&a9 < v9
    || (unint64_t)&a9 - v9 < v11)
  {
    uint64_t v12 = &a9;
    if (v9 >= 0x1000)
    {
      do
      {
        v12 -= 512;
        v9 -= 4096LL;
      }

      while (v9 > 0x1000);
    }
  }

void __pthread_invalid_workloopfunction()
{
  qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqwl setup";
  __break(1u);
}

void __pthread_invalid_keventfunction()
{
  qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqworkq setup";
  __break(1u);
}

void _pthread_mutex_corruption_abort()
{
  qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_mutex corruption: mutex owner changed in the middle of lock/unlock";
  __break(1u);
  __bsdthread_create();
}