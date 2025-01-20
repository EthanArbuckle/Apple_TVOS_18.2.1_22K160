uint64_t _pthread_globals_init(uint64_t result)
{
  uint64_t i;
  _WORD *v2;
  for (i = 0LL; i != 14; i += 2LL)
  {
    v2 = (_WORD *)(result + i);
    v2[136] = -1;
    v2[143] = -1;
    v2[150] = -1;
  }

  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  mach_port_name_t v2 = *(_DWORD *)&a1->__opaque[40];
  if (v2 + 1 < 2 || (int result = mach_port_mod_refs(*MEMORY[0x1895FFD48], v2, 0, -1)) == 0)
  {
    int result = 0;
    a1->__sig = 0LL;
  }

  return result;
}

int pthread_attr_getdetachstate(const pthread_attr_t *a1, int *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  *a2 = a1->__opaque[32];
  return result;
}

int pthread_attr_getinheritsched(const pthread_attr_t *a1, int *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  *a2 = a1->__opaque[33];
  return result;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  if ((a1->__opaque[35] & 1) != 0)
  {
    int result = 0;
    *a2 = *(sched_param *)&a1->__opaque[24];
  }

  else
  {
    int result = 0;
    a2->sched_priority = default_priority;
    *(_DWORD *)a2->__opaque = 10;
  }

  return result;
}

int pthread_attr_getschedpolicy(const pthread_attr_t *a1, int *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  *a2 = a1->__opaque[34];
  return result;
}

int pthread_attr_init(pthread_attr_t *a1)
{
  *a1 = *(pthread_attr_t *)_pthread_attr_default;
  return 0;
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  int result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1414022209)
  {
    int result = 0;
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFFFFFF00LL | a2;
  }

  return result;
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  int result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1414022209)
  {
    int result = 0;
    a1->__opaque[33] = a2;
  }

  return result;
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  uint64_t v4 = *(void *)&a1->__opaque[32] | 0x1000000LL;
  *(sched_param *)&a1->__opaque[24] = *a2;
  *(void *)&a1->__opaque[32] = v4;
  return result;
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  if (a2 == 4 || a2 == 2) {
    goto LABEL_6;
  }
  if (a2 != 1) {
    return 22;
  }
  *(void *)&a1->__opaque[32] &= ~0x8000000uLL;
LABEL_6:
  int v2 = 0;
  *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFF00FFFFLL | (a2 << 16) | 0x4000000u;
  return v2;
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  if (a2 == 2) {
    int v2 = 45;
  }
  else {
    int v2 = 22;
  }
  if (a2 == 1) {
    int v2 = 0;
  }
  if (a1->__sig == 1414022209) {
    return v2;
  }
  else {
    return 22;
  }
}

int pthread_attr_getscope(const pthread_attr_t *a1, int *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  *a2 = 1;
  return result;
}

int pthread_attr_getstackaddr(const pthread_attr_t *a1, void **a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  *a2 = *(void **)&a1->__opaque[8];
  return result;
}

int pthread_attr_setstackaddr(pthread_attr_t *a1, void *a2)
{
  int result = 0;
  *(void *)&a1->__opaque[32] &= ~0x10000000uLL;
  *(void *)a1->__opaque = 0LL;
  *(void *)&a1->__opaque[8] = a2;
  return result;
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  size_t v4 = *(void *)&a1->__opaque[16];
  if (!v4) {
    size_t v4 = 0x80000LL;
  }
  *a2 = v4;
  return result;
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 22;
  if (a2 >= 0x4000 && (*MEMORY[0x189600138] & a2) == 0)
  {
    int result = 0;
    *(void *)&a1->__opaque[16] = a2;
  }

  return result;
}

int pthread_attr_getstack(const pthread_attr_t *a1, void **a2, size_t *a3)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  uint64_t v6 = *(void *)&a1->__opaque[8];
  size_t v5 = *(void *)&a1->__opaque[16];
  *a2 = (void *)(v6 - v5);
  if (!v5) {
    size_t v5 = 0x80000LL;
  }
  *a3 = v5;
  return result;
}

int pthread_attr_setstack(pthread_attr_t *a1, void *a2, size_t a3)
{
  int result = 22;
  if (a3 >= 0x4000 && (*MEMORY[0x189600138] & a3) == 0)
  {
    int result = 0;
    *(void *)&a1->__opaque[8] = (char *)a2 + a3;
    *(void *)&a1->__opaque[16] = a3;
  }

  return result;
}

int pthread_attr_setguardsize(pthread_attr_t *a1, size_t a2)
{
  if (a1->__sig != 1414022209 || (*MEMORY[0x189600138] & a2) != 0) {
    return 22;
  }
  int result = 0;
  *(void *)&a1->__opaque[32] &= ~0x10000000uLL;
  *(void *)a1->__opaque = a2;
  return result;
}

int pthread_attr_getguardsize(const pthread_attr_t *a1, size_t *a2)
{
  if (a1->__sig != 1414022209) {
    return 22;
  }
  int result = 0;
  uint64_t v4 = *(void *)&a1->__opaque[32];
  opaque = a1->__opaque;
  if ((v4 & 0x10000000) != 0) {
    opaque = (char *)MEMORY[0x189600148];
  }
  *a2 = *(void *)opaque;
  return result;
}

uint64_t pthread_attr_setcpupercent_np(void *a1, int a2, unint64_t a3)
{
  uint64_t result = 22LL;
  if (a3 <= 0x1FFFFFE && a2 <= 254 && *a1 == 1414022209LL)
  {
    uint64_t v5 = a1[5];
    if ((v5 & 0x4000000) != 0 && (BYTE2(v5) == 4 || BYTE2(v5) == 2))
    {
      uint64_t result = 0LL;
      a1[5] = a1[5] | ((unint64_t)a2 << 32) | (a3 << 40) | 0x8000000;
    }
  }

  return result;
}

uint64_t pthread_attr_setworkinterval_np(uint64_t a1, mach_port_name_t a2)
{
  uint64_t result = 22LL;
  if (a2 - 1 <= 0xFFFFFFFD && *(void *)a1 == 1414022209LL)
  {
    uint64_t result = mach_port_mod_refs(*MEMORY[0x1895FFD48], a2, 0, 1);
    if (!(_DWORD)result) {
      *(_DWORD *)(a1 + 48) = a2;
    }
  }

  return result;
}

uint64_t _pthread_deallocate(uint64_t result, char a2)
{
  if (_main_thread_ptr != result)
  {
    uint64_t v2 = result;
    uint64_t result = mach_vm_deallocate(*MEMORY[0x1895FFD48], *(void *)(v2 + 192), *(void *)(v2 + 200));
    if ((_DWORD)result)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Unable to deallocate stack";
      qword_18C50BDC8 = (int)result;
      __break(1u);
    }
  }

  return result;
}

uint64_t _pthread_start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if ((a6 & 0x20000000) != 0)
  {
    qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: kernel without PTHREAD_START_SUSPENDED support";
    qword_18C50BDC8 = a6;
    __break(1u);
    goto LABEL_8;
  }

  if ((a6 & 0x10000000) == 0)
  {
LABEL_8:
    qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_18C50BDC8 = a6;
    __break(1u);
    goto LABEL_9;
  }

  if ((_pthread_ptr_munge_token ^ *(void *)a1) != a1)
  {
LABEL_9:
    uint64_t result = abort_with_reason();
    goto LABEL_10;
  }

  _pthread_markcancel_if_canceled(a1);
  uint64_t result = __thread_selfid();
  *(void *)(a1 + 216) = result;
  if (result == -1)
  {
LABEL_10:
    qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v8 = *(unsigned int *)(a1 + 248);
  if ((v8 + 1) > 1)
  {
    _pthread_introspection_thread_start((void *)a1);
    uint64_t v9 = (*(uint64_t (**)(void))(a1 + 144))(*(void *)(a1 + 152));
    _pthread_exit((_opaque_pthread_t *)a1, v9);
  }

LABEL_11:
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
  qword_18C50BDC8 = v8;
  __break(1u);
  return result;
}

void _pthread_exit(_opaque_pthread_t *a1, uint64_t a2)
{
  for (i = a1->__cleanup_stack; i; a1->__cleanup_stack = i)
  {
    ((void (*)(void *))i->__routine)(i->__arg);
    i = i->__next;
  }

  _pthread_tsd_cleanup((uint64_t)a1);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v6 = *(void *)(StatusReg + 72);
  *(void *)(StatusReg + 72) = 0LL;
  if (v6) {
    goto LABEL_5;
  }
  while (1)
  {
    _pthread_terminate_invoke(a1, a2);
LABEL_5:
    _os_semaphore_dispose();
  }
}

int pthread_is_threaded_np(void)
{
  return __is_threaded;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  pthread_t v1 = a1;
  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1)
  {
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
      pthread_mach_thread_np_cold_1();
    }
    LODWORD(v1) = *(_DWORD *)&a1->__opaque[232];
  }

  else if (a1)
  {
    os_unfair_lock_lock_with_options();
    pthread_t v2 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v2 != v1)
      {
        pthread_t v2 = *(pthread_t *)v2->__opaque;
        if (!v2) {
          goto LABEL_6;
        }
      }

      if ((pthread_t)(_pthread_ptr_munge_token ^ v1->__sig) != v1) {
        pthread_mach_thread_np_cold_1();
      }
      LODWORD(v1) = *(_DWORD *)&v1->__opaque[232];
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }

    else
    {
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      LODWORD(v1) = 0;
    }
  }

  return v1;
}

pthread_t pthread_from_mach_thread_np(mach_port_t a1)
{
  pthread_t v2 = (_opaque_pthread_t *)__pthread_head;
  if (__pthread_head)
  {
    do
    {
      if (*(_DWORD *)&v2->__opaque[232] == a1) {
        break;
      }
      pthread_t v2 = *(_opaque_pthread_t **)v2->__opaque;
    }

    while (v2);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v2;
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  if (!a1) {
    return 3LL;
  }
  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1 || _main_thread_ptr == (void)a1)
  {
    size_t v3 = *(void *)&a1->__opaque[160] - *(void *)&a1->__opaque[168];
    if (v3) {
      return v3;
    }
    return 0x80000LL;
  }

  os_unfair_lock_lock_with_options();
  pthread_t v4 = (pthread_t)__pthread_head;
  if (!__pthread_head)
  {
LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 0x80000LL;
  }

  while (v4 != a1)
  {
    pthread_t v4 = *(pthread_t *)v4->__opaque;
    if (!v4) {
      goto LABEL_13;
    }
  }

  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
    pthread_mach_thread_np_cold_1();
  }
  size_t v3 = *(void *)&a1->__opaque[160] - *(void *)&a1->__opaque[168];
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  if (!v3) {
    return 0x80000LL;
  }
  return v3;
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1 || _main_thread_ptr == (void)a1) {
    return *(void **)&a1->__opaque[160];
  }
  if (!a1) {
    return (void *)3;
  }
  os_unfair_lock_lock_with_options();
  pthread_t v4 = (pthread_t)__pthread_head;
  if (!__pthread_head)
  {
LABEL_11:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return (void *)3;
  }

  while (v4 != a1)
  {
    pthread_t v4 = *(pthread_t *)v4->__opaque;
    if (!v4) {
      goto LABEL_11;
    }
  }

  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
    pthread_mach_thread_np_cold_1();
  }
  size_t v3 = *(void **)&a1->__opaque[160];
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v3;
}

uint64_t pthread_main_thread_np()
{
  return _main_thread_ptr;
}

int pthread_main_np(void)
{
  unint64_t v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return _main_thread_ptr == v0;
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  if (!a2) {
    return 22;
  }
  unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if (!a1 || (pthread_t)v4 == a1)
  {
    int v6 = 0;
    *a2 = *(void *)(v4 + 216);
  }

  else
  {
    os_unfair_lock_lock_with_options();
    pthread_t v5 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v5 != a1)
      {
        pthread_t v5 = *(pthread_t *)v5->__opaque;
        if (!v5) {
          goto LABEL_7;
        }
      }

      if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
        pthread_mach_thread_np_cold_1();
      }
      __uint64_t v7 = *(void *)&a1->__opaque[200];
      *a2 = v7;
      if (v7) {
        int v6 = 0;
      }
      else {
        int v6 = _pthread_threadid_slow((uint64_t)a1, a2);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }

    else
    {
LABEL_7:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      return 3;
    }
  }

  return v6;
}

uint64_t _pthread_threadid_slow(uint64_t a1, void *a2)
{
  kern_return_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;
  integer_t v8[7];
  mach_msg_type_number_t thread_info_outCnt;
  thread_info_outCnt = 6;
  unint64_t v4 = thread_info(*(_DWORD *)(a1 + 248), 4u, v8, &thread_info_outCnt);
  pthread_t v5 = *(void *)v8;
  if (v4) {
    int v6 = 1;
  }
  else {
    int v6 = *(void *)v8 == 0LL;
  }
  if (v6) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(void *)v8;
  *(void *)(a1 + 216) = v5;
  return result;
}

int pthread_cpu_number_np(size_t *cpu_number_out)
{
  if (cpu_number_out)
  {
    int result = 0;
    *cpu_number_out = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }

  else
  {
    int result = 22;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
  }

  return result;
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  if ((pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) != a1)
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options();
      pthread_t v4 = (pthread_t)__pthread_head;
      if (__pthread_head)
      {
        while (v4 != a1)
        {
          pthread_t v4 = *(pthread_t *)v4->__opaque;
          if (!v4) {
            goto LABEL_6;
          }
        }

        if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
          pthread_mach_thread_np_cold_1();
        }
        _platform_strlcpy();
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        return 0;
      }

LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }

    return 3;
  }

  _platform_strlcpy();
  return 0;
}

int pthread_setname_np(const char *a1)
{
  pthread_t v1 = (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if (a1) {
    uint64_t v2 = _platform_strlen();
  }
  else {
    uint64_t v2 = 0LL;
  }
  if ((void *)(_pthread_ptr_munge_token ^ *v1) != v1) {
    pthread_mach_thread_np_cold_1();
  }
  getpid();
  int v3 = __proc_info();
  if (!v3)
  {
    if (v2) {
      _platform_strlcpy();
    }
    else {
      _platform_bzero();
    }
  }

  return v3;
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((uint64_t *)a1, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

uint64_t _pthread_create(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (!a2)
  {
    __uint64_t v7 = _pthread_attr_default;
LABEL_5:
    uint64_t v10 = *((void *)v7 + 4);
    uint64_t v9 = *((void *)v7 + 5);
    uint64_t v11 = *((void *)v7 + 3);
    if (v10) {
      int v12 = v10 & 0xFFFFFF | 0x9000000;
    }
    else {
      int v12 = 0x1000000;
    }
    if ((v9 & 0x1000000) != 0) {
      int v13 = v9 & 0xFF0000 | (unsigned __int16)*((void *)v7 + 4) | 0x3000000;
    }
    else {
      int v13 = v12;
    }
    __is_threaded = 1;
    mach_vm_address_t address = __pthread_stack_hint;
    uint64_t v14 = *((void *)v7 + 2);
    if ((*MEMORY[0x189600138] & v14) != 0) {
      _pthread_create_cold_3(v14);
    }
    v39 = a1;
    if (v14)
    {
      mach_vm_size_t v17 = 0LL;
      mach_vm_size_t v18 = 0LL;
      mach_vm_size_t v19 = ~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 4320LL);
    }

    else
    {
      if ((v9 & 0x10000000) != 0) {
        v20 = (mach_vm_size_t *)MEMORY[0x189600148];
      }
      else {
        v20 = (mach_vm_size_t *)(v7 + 8);
      }
      mach_vm_size_t v18 = *v20;
      if (v11) {
        v11 += 12288LL;
      }
      else {
        uint64_t v11 = 536576LL;
      }
      mach_vm_size_t v17 = v18 + v11;
      mach_vm_size_t v19 = ((~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 4320LL))
           + *MEMORY[0x189600138]
           + v18
           + v11) & ~*MEMORY[0x189600138];
    }

    v21 = (vm_map_t *)MEMORY[0x1895FFD48];
    uint64_t v22 = mach_vm_map(*MEMORY[0x1895FFD48], &address, v19, *MEMORY[0x189600148] - 1LL, 503316481, 0, 0LL, 0, 3, 7, 1u);
    if ((_DWORD)v22)
    {
      uint64_t v22 = mach_vm_allocate(*v21, &address, v19, 503316481);
      if ((_DWORD)v22) {
        return 35LL;
      }
    }

    else if ((a5 & 1) == 0 && *MEMORY[0x1895FF868])
    {
      uint64_t v22 = ((uint64_t (*)(uint64_t, void, mach_vm_size_t, void, mach_vm_address_t, void))*MEMORY[0x1895FF868])( 503316624LL,  *MEMORY[0x1895FFD48],  v19,  0LL,  address,  0LL);
    }

    if ((a5 & 1) == 0 && *MEMORY[0x1895FF868]) {
      uint64_t v22 = ((uint64_t (*)(uint64_t, void, mach_vm_size_t, void, mach_vm_address_t, void))*MEMORY[0x1895FF868])( 503316496LL,  *MEMORY[0x1895FFD48],  v19,  0LL,  address,  0LL);
    }
    if (v18) {
      uint64_t v22 = mach_vm_protect(*MEMORY[0x1895FFD48], address, v18, 0, 0);
    }
    mach_vm_address_t v23 = address;
    uint64_t v24 = address + v17;
    if (*((void *)v7 + 2)) {
      mach_vm_address_t v25 = *((void *)v7 + 2);
    }
    else {
      mach_vm_address_t v25 = address + v17;
    }
    *(void *)uint64_t v24 = _pthread_ptr_munge_token ^ v24;
    *(void *)(v24 + 224) = v24;
    *(void *)(v24 + 232) = v24 + 172;
    if ((v7[43] & 1) != 0) {
      uint64_t v26 = 0LL;
    }
    else {
      uint64_t v26 = *((void *)v7 + 4);
    }
    v27 = (void *)MEMORY[0x189600148];
    *(void *)(v24 + 256) = v26;
    *(void *)(v24 + 280) = _pthread_ptr_munge_token;
    char v28 = *(_BYTE *)(v24 + 49) & 0xFB | (4 * (*((void *)v7 + 2) != 0LL));
    *(_BYTE *)(v24 + 49) = v28;
    *(_DWORD *)(v24 + 72) = 0;
    *(void *)(v24 + 176) = v25;
    *(void *)(v24 + 184) = v25 - v11;
    *(void *)(v24 + 192) = v23;
    *(void *)(v24 + 200) = v19;
    if ((*((void *)v7 + 5) & 0x10000000LL) != 0) {
      v29 = v27;
    }
    else {
      v29 = v7 + 8;
    }
    *(void *)(v24 + 208) = *v29;
    *(_BYTE *)(v24 + 49) = v28 & 0xFE | (v7[40] == 1LL);
    __int16 v30 = v7[41] | (*(unsigned __int8 *)(v24 + 79) << 8);
    *(_WORD *)(v24 + 78) = v30;
    *(_BYTE *)(v24 + 48) = BYTE2(*((void *)v7 + 5));
    *(_WORD *)(v24 + 78) = (*((_DWORD *)v7 + 10) >> 15) & 0x200 | v30 & 0xFDFF;
    if ((v7[43] & 1) != 0)
    {
      *(void *)(v24 + 56) = *((void *)v7 + 4);
    }

    else
    {
      *(_DWORD *)(v24 + 56) = default_priority;
      *(_DWORD *)(v24 + 60) = 10;
    }

    uint64_t v31 = v13 & 0xDFFFFFFF | (((a5 >> 1) & 1) << 29);
    *(_WORD *)(v24 + 166) = 3;
    if ((a5 & 1) != 0) {
      mach_port_name_t v32 = MEMORY[0x186DF7618](v22);
    }
    else {
      mach_port_name_t v32 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    }
    *(void *)(v24 + 144) = a3;
    *(void *)(v24 + 152) = a4;
    os_unfair_lock_lock_no_tsd();
    *(void *)(v24 + 16) = 0LL;
    v33 = (uint64_t *)off_18C43CAD8;
    *(void *)(v24 + 24) = off_18C43CAD8;
    uint64_t *v33 = v24;
    off_18C43CAD8 = (_UNKNOWN **)(v24 + 16);
    ++_pthread_count;
    os_unfair_lock_unlock_no_tsd();
    if (__bsdthread_create(a3, a4, v25, v24, v31) == -1)
    {
      if (**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) == 24) {
        _pthread_create_cold_2();
      }
      os_unfair_lock_lock_no_tsd();
      uint64_t v37 = *(void *)(v24 + 16);
      v38 = *(void **)(v24 + 24);
      if (v37)
      {
        *(void *)(v37 + 24) = v38;
        v38 = *(void **)(v24 + 24);
      }

      else
      {
        off_18C43CAD8 = *(_UNKNOWN ***)(v24 + 24);
      }

      v34 = v39;
      v35 = (ipc_space_t *)MEMORY[0x1895FFD48];
      void *v38 = v37;
      --_pthread_count;
      os_unfair_lock_unlock_no_tsd();
      _pthread_deallocate(v24, a5 & 1);
      uint64_t v24 = 0LL;
      uint64_t v8 = 35LL;
      if ((a5 & 1) == 0) {
        goto LABEL_53;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
      v34 = v39;
      v35 = (ipc_space_t *)MEMORY[0x1895FFD48];
      if ((a5 & 1) == 0)
      {
LABEL_53:
        uint64_t *v34 = v24;
        return v8;
      }
    }

    mach_port_deallocate(*v35, v32);
    goto LABEL_53;
  }

  __uint64_t v7 = a2;
  if (*a2 == 1414022209LL) {
    goto LABEL_5;
  }
  return 22LL;
}

int pthread_create_from_mach_thread( pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((uint64_t *)a1, a2, (uint64_t)a3, (uint64_t)a4, 1u);
}

int pthread_create_suspended_np(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((uint64_t *)a1, a2, (uint64_t)a3, (uint64_t)a4, 2u);
}

uint64_t pthread_install_workgroup_functions_np(uint64_t a1)
{
  uint64_t result = _pthread_workgroup_functions;
  if (_pthread_workgroup_functions) {
    pthread_install_workgroup_functions_np_cold_1(_pthread_workgroup_functions);
  }
  _pthread_workgroup_functions = a1;
  return result;
}

uint64_t pthread_create_with_workgroup_np()
{
  if (!_pthread_workgroup_functions) {
    pthread_create_with_workgroup_np_cold_1();
  }
  return (*(uint64_t (**)(void))(_pthread_workgroup_functions + 8))();
}

int pthread_detach(pthread_t a1)
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    pthread_t v2 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v2 != a1)
      {
        pthread_t v2 = *(pthread_t *)v2->__opaque;
        if (!v2) {
          goto LABEL_5;
        }
      }

      if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
        pthread_mach_thread_np_cold_1();
      }
      if ((a1->__opaque[33] & 1) == 0)
      {
        int v3 = 22;
LABEL_11:
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        return v3;
      }

      if (*(_DWORD *)&a1->__opaque[36] == -1)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        pthread_join_NOCANCEL((uint64_t)a1, 0LL);
      }

      else
      {
        a1->__opaque[33] &= ~1u;
        if (!*(void *)&a1->__opaque[16])
        {
          int v3 = 0;
          goto LABEL_11;
        }

        _pthread_joiner_prepost_wake((uint64_t)a1);
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        _pthread_joiner_wake();
      }

      return 0;
    }

LABEL_5:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }

  return 3;
}

uint64_t _pthread_joiner_wake()
{
  do
    uint64_t result = __ulock_wake();
  while ((_DWORD)result == -4);
  if ((_DWORD)result != -2)
  {
    if ((_DWORD)result) {
      _pthread_joiner_wake_cold_1(result);
    }
  }

  return result;
}

int pthread_kill(pthread_t a1, int a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((pthread_t)(StatusReg - 224) != a1)
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options();
      pthread_t v5 = (pthread_t)__pthread_head;
      if (__pthread_head)
      {
        while (v5 != a1)
        {
          pthread_t v5 = *(pthread_t *)v5->__opaque;
          if (!v5) {
            goto LABEL_8;
          }
        }

        if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
          pthread_mach_thread_np_cold_1();
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
        goto LABEL_14;
      }

LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    }

    return 3;
  }

  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
    pthread_mach_thread_np_cold_1();
  }
LABEL_14:
  int result = __pthread_kill();
  if (result == -1) {
    return **(_DWORD **)(StatusReg + 8);
  }
  return result;
}

uint64_t __pthread_workqueue_setkill()
{
  return __bsdthread_ctl();
}

void pthread_exit(void *a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((*(_WORD *)(StatusReg - 146) & 0x400) != 0)
  {
    qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_exit() called from a thread not created by pthread_create()";
    __break(1u);
  }

  else if ((_pthread_ptr_munge_token ^ *(void *)(StatusReg - 224)) == StatusReg - 224)
  {
    _pthread_exit((_opaque_pthread_t *)(StatusReg - 224), (uint64_t)a1);
  }

  abort_with_reason();
  pthread_self_is_exiting_np();
}

uint64_t pthread_self_is_exiting_np()
{
  return (*(unsigned __int16 *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 58) >> 5) & 1;
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  if (!a1) {
    return 3;
  }
  os_unfair_lock_lock_with_options();
  pthread_t v6 = (pthread_t)__pthread_head;
  if (__pthread_head)
  {
    while (v6 != a1)
    {
      pthread_t v6 = *(pthread_t *)v6->__opaque;
      if (!v6) {
        goto LABEL_5;
      }
    }

    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
      pthread_mach_thread_np_cold_1();
    }
    if (a2) {
      *a2 = a1->__opaque[32];
    }
    int v7 = 0;
    if (a3) {
      *a3 = *(sched_param *)&a1->__opaque[40];
    }
  }

  else
  {
LABEL_5:
    int v7 = 3;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v7;
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  BOOL v6 = (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) == a1 || _main_thread_ptr == (void)a1;
  int v7 = !v6;
  if (v6)
  {
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
      pthread_mach_thread_np_cold_1();
    }
    thread_act_t v9 = *(_DWORD *)&a1->__opaque[232];
  }

  else
  {
    if (!a1) {
      return 3;
    }
    os_unfair_lock_lock_with_options();
    pthread_t v8 = (pthread_t)__pthread_head;
    if (!__pthread_head)
    {
LABEL_28:
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      return 3;
    }

    while (v8 != a1)
    {
      pthread_t v8 = *(pthread_t *)v8->__opaque;
      if (!v8) {
        goto LABEL_28;
      }
    }

    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
      pthread_mach_thread_np_cold_1();
    }
    thread_act_t v9 = *(_DWORD *)&a1->__opaque[232];
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }

  if ((*(_WORD *)&a1->__opaque[62] & 0x400) == 0)
  {
    switch(a2)
    {
      case 4:
        uint64_t v11 = (sched_param *)&sched_priority;
        int sched_priority = a3->sched_priority;
        mach_msg_type_number_t v10 = 1;
        break;
      case 2:
        uint64_t v11 = &v15;
        sched_param v15 = *a3;
        mach_msg_type_number_t v10 = 2;
        break;
      case 1:
        int v14 = a3->sched_priority;
        mach_msg_type_number_t v10 = 1;
        uint64_t v11 = (sched_param *)&v14;
        break;
      default:
        return 22;
    }

    if (thread_policy(v9, a2, (policy_base_t)v11, v10, 1)) {
      return 22;
    }
    os_unfair_lock_lock_with_options();
    if (!v7) {
      goto LABEL_33;
    }
    pthread_t v13 = (pthread_t)__pthread_head;
    if (__pthread_head)
    {
      while (v13 != a1)
      {
        pthread_t v13 = *(pthread_t *)v13->__opaque;
        if (!v13) {
          goto LABEL_28;
        }
      }

      if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
        pthread_mach_thread_np_cold_1();
      }
LABEL_33:
      a1->__opaque[32] = a2;
      *(sched_param *)&a1->__opaque[40] = *a3;
      os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
      return 0;
    }

    goto LABEL_28;
  }

  return 45;
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
  uint64_t result = __thread_selfid();
  *(void *)(a1 + 216) = result;
  if (result != -1) {
    return _thread_set_tsd_base();
  }
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
  __break(1u);
  return result;
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  opaque = (unint64_t *)a1->__opaque;
  do
  {
    unint64_t v4 = atomic_load(opaque);
    if (v4 != -1LL) {
      _os_once();
    }
  }

  while (a1->__sig == 816954554);
  return 0;
}

uint64_t __pthread_once_handler(uint64_t a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v3 = *(void *)a1 + 8LL;
  v5[0] = MEMORY[0x1896003F0];
  v5[1] = v3;
  uint64_t v6 = *(void *)(StatusReg - 216);
  *(void *)(StatusReg - 216) = v5;
  uint64_t result = (*(uint64_t (**)(void))(a1 + 8))();
  *(void *)(StatusReg - 216) = v6;
  **(void **)a1 = 1330529093LL;
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
  int result = 0;
  pthread_concurrency = a1;
  return result;
}

uint64_t __pthread_init(void *a1, uint64_t a2)
{
  kern_return_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char v20;
  __int16 v21;
  char *v22;
  int v23;
  _BYTE *v24;
  void v26[8];
  uint64_t v27;
  integer_t host_info_out[3];
  int v29;
  mach_msg_type_number_t host_info_outCnt;
  if (a1)
  {
    exitf = (uint64_t (*)(void))a1[1];
    if (*a1 >= 2uLL)
    {
      uint64_t v3 = (void *)a1[3];
      _pthread_malloc = (_UNKNOWN *)a1[2];
      _pthread_free = v3;
    }
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = StatusReg - 224;
  if (StatusReg == 224) {
    __pthread_init_cold_1();
  }
  _main_thread_ptr = StatusReg - 224;
  *(void *)uint64_t v5 = _pthread_ptr_munge_token ^ v5;
  host_info_outCnt = 8;
  host_t v6 = MEMORY[0x186DF75E8]();
  int v7 = host_info(v6, 5, host_info_out, &host_info_outCnt);
  if (v7) {
    __pthread_init_cold_3(v7);
  }
  default_priority = v29;
  mach_port_deallocate(*MEMORY[0x1895FFD48], v6);
  v27 = 0LL;
  pthread_t v8 = (char *)_simple_getenv();
  if (v8)
  {
    v26[0] = v8;
    thread_act_t v9 = _pthread_strtoul(v8, v26);
    v27 = v9;
    if (*(_BYTE *)v26[0] == 44)
    {
      mach_msg_type_number_t v10 = _pthread_strtoul((char *)(v26[0] + 1LL), v26);
      if (*(_BYTE *)v26[0] == 44)
      {
        uint64_t v11 = _pthread_strtoul((char *)(v26[0] + 1LL), v26);
        if (*(_BYTE *)v26[0] == 44)
        {
          int v12 = _pthread_strtoul((char *)(v26[0] + 1LL), v26);
          pthread_t v13 = *(unsigned __int8 *)v26[0];
          sched_param v15 = v13 != 44 && v13 != 0;
LABEL_19:
          _platform_strlen();
          _platform_bzero();
          if (!v15 && v9 && v10) {
            goto LABEL_25;
          }
          goto LABEL_22;
        }

LABEL_18:
        int v12 = 0LL;
        sched_param v15 = 1;
        goto LABEL_19;
      }
    }

    else
    {
      mach_msg_type_number_t v10 = 0LL;
    }

    uint64_t v11 = 0LL;
    goto LABEL_18;
  }

LABEL_22:
  v26[0] = 8LL;
  v26[7] = 0x3B00000001LL;
  uint64_t v11 = 0LL;
  int v12 = 0LL;
  mach_msg_type_number_t v10 = 1032192LL;
LABEL_25:
  v16 = (char *)_simple_getenv();
  if (!v16 || (mach_vm_size_t v17 = _pthread_strtoul(v16, v26), _platform_strlen(), _platform_bzero(), !v17))
  {
    mach_vm_size_t v18 = (char *)_simple_getenv();
    if (!v18 || (mach_vm_size_t v17 = _pthread_strtoul(v18, v26)) == 0) {
      __pthread_init_cold_2();
    }
  }

  _pthread_ptr_munge_token = v17;
  *(void *)_main_thread_ptr = v17 ^ _main_thread_ptr;
  mach_vm_size_t v19 = v27;
  *(void *)uint64_t v5 = _pthread_ptr_munge_token ^ v5;
  *(void *)(v5 + 224) = v5;
  *(void *)(v5 + 232) = v5 + 172;
  *(void *)(v5 + 256) = 2303LL;
  *(void *)(v5 + 280) = _pthread_ptr_munge_token;
  v20 = *(_BYTE *)(v5 + 49);
  *(_DWORD *)(v5 + 72) = 0;
  *(void *)(v5 + 176) = v19;
  *(void *)(v5 + 184) = v19 - v10;
  *(void *)(v5 + 192) = v11;
  *(void *)(v5 + 200) = v12;
  *(void *)(v5 + 208) = *MEMORY[0x189600148];
  LOBYTE(v19) = v20 & 0xFA | 1;
  v21 = *(_WORD *)(v5 + 78);
  *(_BYTE *)(v5 + 48) = 1;
  *(_WORD *)(v5 + 78) = v21 & 0xFD00 | 1;
  *(_DWORD *)(v5 + 56) = default_priority;
  *(_DWORD *)(v5 + 60) = 10;
  *(_WORD *)(v5 + 166) = 3;
  *(_BYTE *)(v5 + 49) = v19;
  uint64_t v22 = (char *)_simple_getenv();
  if (v22)
  {
    mach_vm_address_t v23 = _pthread_strtoul(v22, v26);
    _platform_strlen();
    _platform_bzero();
  }

  else
  {
    mach_vm_address_t v23 = 0;
  }

  _pthread_main_thread_init(v5, v23);
  _pthread_bsdthread_init((uint64_t)v26);
  _pthread_key_global_init();
  _pthread_mutex_global_init(a2, (uint64_t)v26);
  uint64_t v24 = (_BYTE *)_simple_getenv();
  if (v24) {
    pthread_yield_to_zero = *v24 == 49;
  }
  return 0LL;
}

  pthread_t v13 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    int v14 = __ldxr(&v4->_os_unfair_lock_opaque);
    if (v14 != v13) {
      break;
    }
    if (!__stlxr(0, &v4->_os_unfair_lock_opaque)) {
      return v9;
    }
  }

  __clrex();
  os_unfair_lock_unlock(v4);
  return v9;
}

uint64_t _pthread_main_thread_init(uint64_t a1, int a2)
{
  __pthread_head = 0LL;
  off_18C43CAD8 = &__pthread_head;
  _pthread_list_lock = 0;
  *(_DWORD *)(a1 + 72) = 0;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(_DWORD *)(a1 + 52) = 0;
  if (!a2) {
    a2 = MEMORY[0x186DF7618]();
  }
  *(_DWORD *)(a1 + 248) = a2;
  mach_port_name_t name = 0;
  *(_OWORD *)&v8.flags = xmmword_18019E0E8;
  v8.reserved[1] = 0LL;
  uint64_t result = mach_port_construct(*MEMORY[0x1895FFD48], &v8, 0LL, &name);
  *(_DWORD *)(a1 + 240) = name;
  *(_DWORD *)(a1 + 288) = 0;
  *(_DWORD *)(a1 + 296) = 0;
  unint64_t v4 = (char *)__pthread_head;
  *(void *)(a1 + 16) = __pthread_head;
  uint64_t v5 = v4 + 24;
  BOOL v6 = v4 == 0LL;
  __pthread_head = (_UNKNOWN *)a1;
  int v7 = &off_18C43CAD8;
  if (!v6) {
    int v7 = v5;
  }
  *int v7 = a1 + 16;
  *(void *)(a1 + 24) = &__pthread_head;
  _pthread_count = 1;
  return result;
}

uint64_t _pthread_bsdthread_init(uint64_t a1)
{
  *(_OWORD *)a1 = xmmword_18019E0A0;
  *(void *)(a1 + 24) = 0x28000000E0LL;
  *(_DWORD *)(a1 + 32) = 24;
  *(void *)(a1 + 48) = 0x3C000000188LL;
  uint64_t result = __bsdthread_register();
  if ((int)result >= 1)
  {
    if ((~(_DWORD)result & 0x4000001E) != 0) {
      _pthread_bsdthread_init_cold_1(result);
    }
    __pthread_supported_features = result;
  }

  uint64_t v3 = *(void *)(a1 + 16);
  if ((v3 & 0x22000000) == 0 && (v3 & 0x3F00) != 0)
  {
    uint64_t result = _pthread_set_main_qos(*(void *)(a1 + 16));
    *(void *)(_main_thread_ptr + 256) = v3;
  }

  if (*(void *)(a1 + 36)) {
    __pthread_stack_hint = *(void *)(a1 + 36);
  }
  if (__libdispatch_workerfunction) {
    return __workq_open();
  }
  return result;
}

void *_pthread_introspection_thread_start(void *a1)
{
  return a1;
}

uint64_t _pthread_main_thread_postfork_init(uint64_t a1)
{
  uint64_t result = __thread_selfid();
  *(void *)(a1 + 216) = result;
  if (result == -1) {
    _pthread_main_thread_postfork_init_cold_1();
  }
  return result;
}

void sched_yield(void)
{
  if (pthread_yield_to_zero) {
    swtch_pri(0);
  }
  else {
    MEMORY[0x186DF76D8](0LL, 0LL, 0LL);
  }
}

uint64_t _pthread_yield_to_enqueuer_4dispatch(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = __pthread_head;
  if (__pthread_head)
  {
    do
    {
      uint64_t v7 = v6[a1 + 28];
      if (a2)
      {
        if (v7 == a2) {
          goto LABEL_8;
        }
      }

      else if (v7)
      {
LABEL_8:
        uint64_t v8 = *((unsigned int *)v6 + 62);
        goto LABEL_9;
      }

      BOOL v6 = (void *)v6[2];
    }

    while (v6);
  }

  uint64_t v8 = 0LL;
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  MEMORY[0x186DF76D8](v8, 4LL, a3);
  return 0LL;
}

uint64_t pthread_current_stack_contains_np(unint64_t a1, uint64_t a2)
{
  unint64_t v4 = (unint64_t *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 48);
  unint64_t v3 = *v4;
  unint64_t v2 = v4[1];
  if (v2 == *v4) {
    return 4294967251LL;
  }
  BOOL v5 = __CFADD__(a1, a2);
  BOOL v7 = v2 <= a1 && a1 + a2 <= v3;
  if (v5) {
    return 4294967274LL;
  }
  else {
    return v7;
  }
}

void _pthread_clear_qos_tsd(int a1)
{
  if (a1 && *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    os_unfair_lock_lock_with_options();
    unint64_t v2 = __pthread_head;
    if (__pthread_head)
    {
      while (*((_DWORD *)v2 + 62) != a1)
      {
        unint64_t v2 = (void *)v2[2];
        if (!v2) {
          goto LABEL_9;
        }
      }

      v2[32] = 0LL;
    }

LABEL_9:
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }

  else
  {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 0LL;
  }

uintptr_t pthread_stack_frame_decode_np(uintptr_t frame_addr, uintptr_t *return_addr)
{
  if (return_addr) {
    *return_addr = *(void *)(frame_addr + 8);
  }
  return *(void *)frame_addr & 0xFFFFFFFFFFFFFFLL;
}

uint64_t _pthread_wqthread(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  if ((a5 & 0x20000) == 0) {
    _pthread_wqthread_setup(a1, a2, a3, a5);
  }
  if ((a5 & 0x800000) != 0)
  {
    *(_BYTE *)(a1 + 164) = 1;
    unsigned int v10 = 67111167;
  }

  else
  {
    *(_BYTE *)(a1 + 164) = 0;
    if ((a5 & 0x100000) != 0)
    {
      unsigned int v10 = (32 * a5) & 0x1000000 | 0x2000000;
    }

    else
    {
      unsigned int v10 = (32 * a5) & 0x1000000 | (BYTE2(a5) << 31);
      if ((a5 & 0x4000) != 0)
      {
      }

      else
      {
        if ((a5 & 0x8000) == 0) {
          _pthread_wqthread_cold_1(a5);
        }
        v10 |= 0xFFFFu;
      }
    }
  }

  *(void *)(a1 + 256) = v10;
  if (a6 == -1) {
    _pthread_wqthread_exit(a1);
  }
  if ((a5 & 0x400000) != 0)
  {
    pthread_t v13 = __libdispatch_workloopfunction;
    *(void *)(a1 + 152) = a4;
    *(void *)(a1 + 144) = v13;
    *(_DWORD *)(a1 + 160) = a6;
    ((void (*)(uint64_t, uint64_t, uint64_t))v13)(a4 - 8, a1 + 152, a1 + 160);
  }

  if ((a5 & 0x80000) != 0)
  {
    int v14 = __libdispatch_keventfunction[0];
    *(void *)(a1 + 152) = a4;
    *(void *)(a1 + 144) = v14;
    *(_DWORD *)(a1 + 160) = a6;
    ((void (*)(uint64_t, uint64_t))v14)(a1 + 152, a1 + 160);
  }

  unint64_t v11 = v10 | (8 * a5) & 0x8000000;
  int v12 = (void (*)(void))__libdispatch_workerfunction;
  *(void *)(a1 + 144) = __libdispatch_workerfunction;
  *(void *)(a1 + 152) = v11;
  *(_DWORD *)(a1 + 160) = 0;
  if (__workq_newapi == 1) {
    v12();
  }
  else {
    _pthread_wqthread_legacy_worker_wrap(v11);
  }
  uint64_t result = __workq_kernreturn();
  uint64_t v16 = *(int *)(a1 + 172);
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: __workq_kernreturn returned";
  qword_18C50BDC8 = v16;
  return result;
}

uint64_t _pthread_wqthread_setup(uint64_t result, int a2, uint64_t a3, int a4)
{
  unint64_t v4 = (void *)MEMORY[0x189600148];
  uint64_t v5 = *MEMORY[0x189600148];
  uint64_t v6 = -*MEMORY[0x189600148];
  uint64_t v7 = *MEMORY[0x189600138];
  *(void *)uint64_t result = _pthread_ptr_munge_token ^ result;
  uint64_t v8 = (result + v5 - 1) & v6;
  *(void *)(result + 224) = result;
  *(void *)(result + 232) = result + 172;
  *(void *)(result + 256) = 2303LL;
  uint64_t v9 = a3 - v5;
  *(void *)(result + 280) = _pthread_ptr_munge_token;
  unint64_t v10 = v8 - v9 + (~(_DWORD)v7 & (unint64_t)(v7 + 4320));
  LOBYTE(v8) = *(_BYTE *)(result + 49);
  *(_DWORD *)(result + 72) = 0;
  *(void *)(result + 176) = result;
  *(void *)(result + 184) = a3;
  *(void *)(result + 192) = v9;
  *(void *)(result + 200) = v10;
  *(void *)(result + 208) = *v4;
  LOWORD(v9) = *(_WORD *)(result + 78);
  *(_BYTE *)(result + 48) = 1;
  *(_DWORD *)(result + 56) = default_priority;
  *(_DWORD *)(result + 60) = 10;
  *(_WORD *)(result + 166) = 3;
  *(_DWORD *)(result + 248) = a2;
  *(_WORD *)(result + 78) = v9 & 0xF100 | 0x401;
  *(_BYTE *)(result + 49) = v8 & 0xFA;
  if ((a4 & 0x200000) == 0)
  {
    uint64_t v12 = a4;
    qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_18C50BDC8 = a4;
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v11 = result;
  uint64_t result = __thread_selfid();
  *(void *)(v11 + 216) = result;
  if (result == -1)
  {
LABEL_10:
    qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
LABEL_11:
    qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_18C50BDC8 = v12;
    __break(1u);
    return result;
  }

  os_unfair_lock_lock_no_tsd();
  *(void *)(v11 + 16) = 0LL;
  pthread_t v13 = (uint64_t *)off_18C43CAD8;
  *(void *)(v11 + 24) = off_18C43CAD8;
  *pthread_t v13 = v11;
  off_18C43CAD8 = (_UNKNOWN **)(v11 + 16);
  ++_pthread_count;
  uint64_t result = os_unfair_lock_unlock_no_tsd();
  uint64_t v12 = *(unsigned int *)(v11 + 248);
  return result;
}

void _pthread_wqthread_exit(uint64_t a1)
{
  if ((*(void *)(a1 + 256) & 0x22000000LL) != 0 || (*(void *)(a1 + 256) & 0xF00LL) == 0) {
    *(void *)(a1 + 256) = 2303LL;
  }
  _pthread_exit((_opaque_pthread_t *)a1, 0LL);
}

uint64_t _pthread_wqthread_legacy_worker_wrap(unint64_t a1)
{
  BOOL v1 = (a1 & 0x22000000) != 0 || (a1 & 0x3F00) == 0;
  unsigned int v2 = (a1 >> 8) & 0x3F;
  if (!v1 && v2 != 0)
  {
    unsigned int v4 = __clz(__rbit32(v2)) - 1;
    uint64_t v5 = 0LL;
    uint64_t v6 = (uint64_t (*)(uint64_t, unint64_t, void))__libdispatch_workerfunction;
    switch(v4)
    {
      case 0u:
        uint64_t v5 = 3LL;
        return v6(v5, (a1 >> 31) & 1, 0LL);
      case 1u:
        uint64_t v5 = 2LL;
        return v6(v5, (a1 >> 31) & 1, 0LL);
      case 2u:
        *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 4351LL;
        uint64_t v5 = 1LL;
        return v6(v5, (a1 >> 31) & 1, 0LL);
      case 3u:
        return v6(v5, (a1 >> 31) & 1, 0LL);
      default:
        break;
    }
  }

  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Invalid pthread priority for the legacy interface";
  qword_18C50BDC8 = a1;
  __break(1u);
  JUMPOUT(0x1801968ECLL);
}

uint64_t pthread_workqueue_setdispatchoffset_np()
{
  return __workq_kernreturn();
}

uint64_t pthread_workqueue_setup(uint64_t a1, unint64_t a2)
{
  if (a2 < 4) {
    return 22LL;
  }
  int v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 1)
  {
    unint64_t v5 = 40LL;
  }

  else
  {
    if (v4 != 2) {
      return 22LL;
    }
    unint64_t v5 = 48LL;
  }

  if (v5 > a2) {
    return 22LL;
  }
  if (*(_DWORD *)a1) {
    return 45LL;
  }
  if (__libdispatch_workerfunction) {
    return 16LL;
  }
  __workq_newapi = 1;
  uint64_t v6 = *(void (**)())(a1 + 16);
  __libdispatch_keventfunction[0] = *(void (**)())(a1 + 8);
  __libdispatch_workloopfunction = v6;
  __libdispatch_workerfunction = *(_UNKNOWN **)(a1 + 24);
  __workq_open();
  uint64_t result = 0LL;
  if (!__is_threaded) {
    __is_threaded = 1;
  }
  return result;
}

uint64_t _pthread_workqueue_init_with_workloop(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v5[0] = 0x200000000LL;
  v5[1] = a2;
  void v5[2] = a3;
  v5[3] = a1;
  v5[4] = a4;
  v5[5] = 0LL;
  return pthread_workqueue_setup((uint64_t)v5, 0x30uLL);
}

uint64_t _pthread_workqueue_init_with_kevent(uint64_t a1, uint64_t a2, int a3)
{
  v4[0] = 0x200000000LL;
  v4[1] = a2;
  v4[2] = 0LL;
  v4[3] = a1;
  v4[4] = a3;
  v4[5] = 0LL;
  return pthread_workqueue_setup((uint64_t)v4, 0x30uLL);
}

uint64_t _pthread_workqueue_init(uint64_t a1, int a2)
{
  v3[0] = 0x200000000LL;
  v3[1] = 0LL;
  v3[2] = 0LL;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = 0LL;
  return pthread_workqueue_setup((uint64_t)v3, 0x30uLL);
}

uint64_t pthread_workqueue_setdispatch_np(uint64_t a1)
{
  __int128 v2 = 0u;
  uint64_t v3 = 0LL;
  __int128 v5 = 0u;
  DWORD1(v2) = 2;
  uint64_t v4 = a1;
  return pthread_workqueue_setup((uint64_t)&v2, 0x30uLL);
}

uint64_t _pthread_workqueue_supported()
{
  uint64_t result = __pthread_supported_features;
  if (!__pthread_supported_features) {
    _pthread_workqueue_supported_cold_1();
  }
  return result;
}

uint64_t pthread_workqueue_addthreads_np(__int16 a1, int a2)
{
  if (!__libdispatch_workerfunction) {
    return 1LL;
  }
  _pthread_qos_class_encode_workqueue(a1 & 0xFFF, a2 << 31);
  uint64_t result = __workq_kernreturn();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

BOOL _pthread_workqueue_should_narrow()
{
  return __workq_kernreturn() - 1 < 0xFFFFFFFE;
}

uint64_t _pthread_workqueue_addthreads()
{
  if (!__libdispatch_workerfunction) {
    return 1LL;
  }
  uint64_t result = __workq_kernreturn();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_add_cooperativethreads()
{
  if (!__libdispatch_workerfunction) {
    return 1LL;
  }
  uint64_t result = __workq_kernreturn();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_set_event_manager_priority()
{
  uint64_t result = __workq_kernreturn();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_allow_send_signals()
{
  return __bsdthread_ctl();
}

uint64_t _pthread_workloop_create(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 22LL;
  if (a2 <= 1 && a3)
  {
    uint64_t result = __kqueue_workloop_ctl();
    if ((_DWORD)result == -1) {
      return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
  }

  return result;
}

uint64_t _pthread_workloop_destroy()
{
  uint64_t result = __kqueue_workloop_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

pthread_introspection_hook_t pthread_introspection_hook_install(pthread_introspection_hook_t hook)
{
  return (pthread_introspection_hook_t)_pthread_atomic_xchg_ptr(&_pthread_introspection_hook, (unint64_t)hook);
}

uint64_t _pthread_introspection_hook_callout_thread_create(uint64_t a1)
{
  unint64_t v1 = ~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 4320LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  __int16 v3 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 1;
  uint64_t result = _pthread_introspection_hook(1LL, a1, a1, v1);
  *(_WORD *)(StatusReg - 174) = v3;
  return result;
}

uint64_t _pthread_terminate_invoke(_opaque_pthread_t *a1, uint64_t a2)
{
  __int128 v2 = (_opaque_pthread_t *)_pthread_terminate(a1, a2);
  return _pthread_terminate(v2, v3);
}

uint64_t _pthread_terminate(pthread_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)&a1->__opaque[176];
  uint64_t v5 = *(void *)&a1->__opaque[184];
  if (v4 < (unint64_t)a1 && v4 + v5 > (unint64_t)a1)
  {
    unint64_t v7 = ((unint64_t)a1 - v4) & -*MEMORY[0x189600148];
    *(void *)&a1->__opaque[176] = v4 + v7;
    *(void *)&a1->__opaque[184] = v5 - v7;
  }

  else if ((pthread_t)_main_thread_ptr == a1)
  {
    pthread_get_stacksize_np(a1);
    _pthread_current_stack_address();
  }

  if (*(_DWORD *)&a1->__opaque[272])
  {
    *(_DWORD *)&a1->__opaque[272] = 0;
    thread_destruct_special_reply_port();
  }

  mach_port_t v8 = *(_DWORD *)&a1->__opaque[224];
  if (v8) {
    mig_dealloc_reply_port(v8);
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&a1->__opaque[36] = -1;
  *(void *)&a1->__opaque[24] = a2;
  int v9 = _pthread_count--;
  uint64_t v10 = *(void *)&a1->__opaque[16];
  if (v10) {
    _pthread_joiner_prepost_wake((uint64_t)a1);
  }
  char v11 = a1->__opaque[33];
  char v12 = v11 & 1;
  if ((v11 & 1) != 0)
  {
    a1->__opaque[33] = v11 | 2;
  }

  else
  {
    uint64_t v13 = *(void *)a1->__opaque;
    int v14 = *(void **)&a1->__opaque[8];
    if (v13)
    {
      *(void *)(v13 + 24) = v14;
      int v14 = *(void **)&a1->__opaque[8];
    }

    else
    {
      off_18C43CAD8 = *(_UNKNOWN ***)&a1->__opaque[8];
    }

    *int v14 = v13;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  if (v10)
  {
    _pthread_joiner_wake();
    os_unfair_lock_lock_with_options();
    if (*(void *)&a1->__opaque[16])
    {
      a1->__opaque[33] |= 2u;
      char v12 = 1;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  }

  if (v9 <= 1) {
    exitf(0LL);
  }
  uint64_t result = __bsdthread_terminate();
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: thread didn't terminate";
  qword_18C50BDC8 = (uint64_t)a1;
  __break(1u);
  return result;
}

char *_pthread_current_stack_address()
{
  return &v1;
}

uint64_t _pthread_introspection_hook_callout_thread_terminate(void *a1)
{
  if ((void *)_main_thread_ptr == a1)
  {
    uint64_t v3 = a1[26];
    unint64_t v2 = a1[22] - a1[23] + v3;
    uint64_t v1 = a1[23] - v3;
  }

  else
  {
    uint64_t v1 = a1[24];
    unint64_t v2 = a1[25] - (~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 4320LL));
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  __int16 v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 3;
  uint64_t result = _pthread_introspection_hook(3LL, a1, v1, v2);
  *(_WORD *)(StatusReg - 174) = v5;
  return result;
}

uint64_t _pthread_strtoul(char *a1, void *a2)
{
  if (a1 && *a1 == 48 && a1[1] == 120)
  {
    uint64_t v2 = 0LL;
    for (a1 += 2; ; ++a1)
    {
      int v3 = *a1;
      if ((v3 - 48) >= 0xAu)
      {
        int v4 = -87;
        if ((v3 - 97) >= 6u)
        {
          int v4 = -55;
        }
      }

      else
      {
        int v4 = -48;
      }

      uint64_t v2 = (v4 + v3) + 16 * v2;
    }
  }

  uint64_t v2 = 0LL;
LABEL_12:
  *a2 = a1;
  return v2;
}

uint64_t _pthread_introspection_hook_callout_thread_start(void *a1)
{
  if ((void *)_main_thread_ptr == a1)
  {
    uint64_t v3 = a1[26];
    unint64_t v2 = a1[22] - a1[23] + v3;
    uint64_t v1 = a1[23] - v3;
  }

  else
  {
    uint64_t v1 = a1[24];
    unint64_t v2 = a1[25] - (~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 4320LL));
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  __int16 v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 2;
  uint64_t result = _pthread_introspection_hook(2LL, a1, v1, v2);
  *(_WORD *)(StatusReg - 174) = v5;
  return result;
}

uint64_t _pthread_introspection_hook_callout_thread_destroy(uint64_t a1)
{
  unint64_t v1 = ~*MEMORY[0x189600138] & (unint64_t)(*MEMORY[0x189600138] + 4320LL);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  __int16 v3 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(StatusReg - 174) = 4;
  uint64_t result = _pthread_introspection_hook(4LL, a1, a1, v1);
  *(_WORD *)(StatusReg - 174) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return abort_with_reason();
}

uint64_t _pthread_setcancelstate_exit(uint64_t result)
{
  unint64_t v1 = (unsigned __int16 *)(result + 166);
  do
    unsigned __int16 v2 = __ldxr(v1);
  while (__stxr(v2 & 0xFFDC | 0x22, v1));
  return result;
}

int pthread_cancel(pthread_t a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((pthread_t)(StatusReg - 224) == a1)
  {
    if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
      pthread_mach_thread_np_cold_1();
    }
    goto LABEL_8;
  }

  if (!a1) {
    return 3;
  }
  unsigned int v3 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&_pthread_list_lock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_17:
  pthread_t v8 = (pthread_t)__pthread_head;
  if (!__pthread_head)
  {
LABEL_20:
    int v9 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v10 = __ldxr((unsigned int *)&_pthread_list_lock);
      if (v10 != v9) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 3;
  }

  while (v8 != a1)
  {
    pthread_t v8 = *(pthread_t *)v8->__opaque;
    if (!v8) {
      goto LABEL_20;
    }
  }

  if ((pthread_t)(_pthread_ptr_munge_token ^ a1->__sig) != a1) {
    pthread_mach_thread_np_cold_1();
  }
  int v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v12 = __ldxr((unsigned int *)&_pthread_list_lock);
    if (v12 != v11) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
LABEL_8:
  if ((*(_WORD *)&a1->__opaque[62] & 0x400) != 0) {
    return 45;
  }
  __int16 v5 = (unsigned __int16 *)&a1->__opaque[150];
  do
    unsigned __int16 v6 = __ldxr(v5);
  while (__stxr(v6 | 0x10, v5));
  if ((v6 & 1) == 0) {
    return 0;
  }
  int result = *(_DWORD *)&a1->__opaque[232];
  if (result)
  {
    __pthread_markcancel();
    return 0;
  }

  return result;
}

int pthread_setcancelstate(int a1, int *a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg - 224);
  unint64_t v3 = StatusReg - 224;
  if ((_pthread_ptr_munge_token ^ v4) != v3) {
    pthread_mach_thread_np_cold_1();
  }
  __int16 v6 = a1;
  __pthread_canceled();
  unint64_t v7 = (unsigned __int16 *)(v3 + 166);
  do
    unsigned __int16 v8 = __ldxr(v7);
  while (__stxr(v8 & 0xFFFE | v6, v7));
  int result = 0;
  if (a2) {
    *a2 = v8 & 1;
  }
  return result;
}

int pthread_setcanceltype(int a1, int *a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg - 224);
  unint64_t v3 = StatusReg - 224;
  if ((_pthread_ptr_munge_token ^ v4) != v3) {
    pthread_mach_thread_np_cold_1();
  }
  if ((a1 & 0xFFFFFFFD) != 0) {
    return 22;
  }
  __int16 v6 = (unsigned __int16 *)(v3 + 166);
  do
    unsigned __int16 v7 = __ldxr(v6);
  while (__stxr(v7 & 0xFFFD | a1, v6));
  int result = 0;
  if (a2) {
    *a2 = v7 & 2;
  }
  return result;
}

void pthread_testcancel(void)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v1 = atomic_load((unsigned __int16 *)(StatusReg - 58));
  if ((~v1 & 0x11) == 0)
  {
    uint64_t v3 = *(void *)(StatusReg - 224);
    unint64_t v2 = StatusReg - 224;
    if ((_pthread_ptr_munge_token ^ v3) == v2)
    {
      *(_BYTE *)(v2 + 165) = 1;
      pthread_exit((void *)1);
    }

    pthread_mach_thread_np_cold_1();
  }

uint64_t _pthread_markcancel_if_canceled(uint64_t result)
{
  int v1 = atomic_load((unsigned __int16 *)(result + 166));
  if ((~v1 & 0x11) == 0) {
    return __pthread_markcancel();
  }
  return result;
}

uint64_t _pthread_exit_if_canceled(uint64_t result)
{
  if (result == 4)
  {
    int v1 = result;
    int result = __pthread_canceled();
    if (!(_DWORD)result)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v4 = *(void *)(StatusReg - 224);
      unint64_t v3 = StatusReg - 224;
      if ((_pthread_ptr_munge_token ^ v4) == v3)
      {
        *(_DWORD *)(v3 + 168) = v1;
        *(_BYTE *)(v3 + 165) = 1;
        pthread_exit((void *)1);
      }

      pthread_mach_thread_np_cold_1();
    }
  }

  return result;
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  else {
    return 0;
  }
}

uint64_t _pthread_joiner_prepost_wake(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(_BYTE *)(a1 + 49);
  if ((v3 & 1) != 0)
  {
    uint64_t result = *(unsigned int *)(v2 + 20);
    *(_BYTE *)(a1 + 49) = v3 & 0xFE;
  }

  else
  {
    uint64_t result = 0LL;
    *(_BYTE *)(v2 + 24) = 1;
    *(void *)(a1 + 32) = 0LL;
  }

  if (*(void *)(v2 + 8))
  {
    int v5 = atomic_load((unsigned __int16 *)(a1 + 166));
    if ((~v5 & 0x11) != 0) {
      uint64_t v6 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v6 = 1LL;
    }
    **(void **)(v2 + 8) = v6;
  }

  return result;
}

uint64_t _pthread_join(uint64_t a1, uint64_t *a2, int a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = (void *)(StatusReg - 224);
  v37[0] = StatusReg - 224;
  v37[1] = a2;
  uint64_t v38 = 0LL;
  char v39 = 0;
  if (!a1) {
    return 3LL;
  }
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&_pthread_list_lock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_7:
  unsigned int v10 = __pthread_head;
  if (!__pthread_head)
  {
LABEL_10:
    int v11 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v12 = __ldxr((unsigned int *)&_pthread_list_lock);
      if (v12 != v11) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    return 3LL;
  }

  while (v10 != (void *)a1)
  {
    unsigned int v10 = (void *)v10[2];
    if (!v10) {
      goto LABEL_10;
    }
  }

  if ((_pthread_ptr_munge_token ^ *(void *)a1) != a1 || (void *)(_pthread_ptr_munge_token ^ *v4) != v4)
  {
LABEL_84:
    abort_with_reason();
    goto LABEL_85;
  }

  char v15 = *(_BYTE *)(a1 + 49);
  if ((v15 & 1) == 0 || *(void *)(a1 + 32))
  {
    int v16 = 0;
    uint64_t v13 = 22LL;
    goto LABEL_22;
  }

  if (v4 == (void *)a1 || (uint64_t v22 = *(void **)(StatusReg - 192)) != 0LL && *v22 == a1)
  {
    int v16 = 0;
    uint64_t v13 = 11LL;
    goto LABEL_22;
  }

  if (*(_DWORD *)(a1 + 52) == -1)
  {
    uint64_t v33 = *(void *)(a1 + 16);
    v34 = *(void **)(a1 + 24);
    if (v33)
    {
      *(void *)(v33 + 24) = v34;
      v34 = *(void **)(a1 + 24);
    }

    else
    {
      off_18C43CAD8 = *(_UNKNOWN ***)(a1 + 24);
    }

    void *v34 = v33;
    *(_BYTE *)(a1 + 49) &= ~1u;
    if (a2)
    {
      int v35 = atomic_load((unsigned __int16 *)(a1 + 166));
      if ((~v35 & 0x11) != 0) {
        uint64_t v36 = *(void *)(a1 + 40);
      }
      else {
        uint64_t v36 = 1LL;
      }
      uint64_t v13 = 0LL;
      *a2 = v36;
      goto LABEL_82;
    }

    goto LABEL_81;
  }

  LODWORD(v38) = *(_DWORD *)(a1 + 248);
  *(_DWORD *)(a1 + 52) = v38;
  *(void *)(a1 + 32) = v37;
  if ((v15 & 4) == 0)
  {
LABEL_81:
    uint64_t v13 = 0LL;
    goto LABEL_82;
  }

  uint64_t v23 = *(void *)(StatusReg + 72);
  if (!v23)
  {
LABEL_85:
    LODWORD(v23) = _os_semaphore_create();
    goto LABEL_41;
  }

  *(void *)(StatusReg + 72) = 0LL;
LABEL_41:
  uint64_t v13 = 0LL;
  HIDWORD(v38) = v23;
LABEL_82:
  int v16 = 1;
LABEL_22:
  int v17 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v18 = __ldxr((unsigned int *)&_pthread_list_lock);
    if (v18 != v17) {
      break;
    }
    if (!__stlxr(0, (unsigned int *)&_pthread_list_lock))
    {
      if (!v16) {
        goto LABEL_66;
      }
      goto LABEL_28;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  if (!v16) {
    goto LABEL_66;
  }
LABEL_28:
  if (!(_DWORD)v38) {
    goto LABEL_64;
  }
  uint64_t v19 = atomic_load((unsigned int *)(a1 + 52));
  if ((_DWORD)v19 != -1)
  {
    while (v19 == v38)
    {
      int v26 = __ulock_wait();
      if (a3 == 2 && v26 == -4)
      {
        int v27 = atomic_load((unsigned __int16 *)(v37[0] + 166LL));
        if ((~v27 & 0x11) == 0)
        {
          if (_pthread_joiner_abort_wait(a1, (uint64_t)v37))
          {
            *(_BYTE *)(v37[0] + 165LL) = 1;
            pthread_exit((void *)1);
          }
        }
      }

      uint64_t v19 = atomic_load((unsigned int *)(a1 + 52));
      if ((_DWORD)v19 == -1) {
        goto LABEL_30;
      }
    }

    qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_join() state corruption";
    qword_18C50BDC8 = v19;
    __break(1u);
    goto LABEL_84;
  }

LABEL_30:
  unsigned int v20 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&_pthread_list_lock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_43:
  if (v39)
  {
    int v24 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v25 = __ldxr((unsigned int *)&_pthread_list_lock);
      if (v25 != v24) {
        break;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    goto LABEL_65;
  }

  *(void *)(a1 + 32) = 0LL;
  char v28 = *(_BYTE *)(a1 + 49);
  int v29 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v30 = __ldxr((unsigned int *)&_pthread_list_lock);
    if (v30 != v29) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
LABEL_63:
  if ((v28 & 2) != 0) {
LABEL_64:
  }
    _pthread_deallocate(a1, 0);
LABEL_65:
  uint64_t v13 = 0LL;
LABEL_66:
  unsigned int v31 = HIDWORD(v38);
  if (!(_DWORD)v13 && HIDWORD(v38) && !v39)
  {
    unsigned int v31 = HIDWORD(v38);
  }

  if (v31)
  {
    uint64_t v32 = *(void *)(StatusReg + 72);
    *(void *)(StatusReg + 72) = v31;
    if (v32) {
      _os_semaphore_dispose();
    }
  }

  return v13;
}

uint64_t pthread_join_NOCANCEL(uint64_t a1, uint64_t *a2)
{
  return _pthread_join(a1, a2, 1);
}

void pthread_cond_wait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2)
{
}

void pthread_cond_timedwait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2, void **a3)
{
}

uint64_t sigwait_NOCANCEL()
{
  unsigned int v1 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (v1 == 4) {
    return 0LL;
  }
  else {
    return v1;
  }
}

uint64_t _pthread_joiner_abort_wait(uint64_t a1, uint64_t a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v5 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr((unsigned int *)&_pthread_list_lock))
  {
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (*(_BYTE *)(a2 + 24) || *(_DWORD *)(a1 + 52) == -1)
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    *(void *)(a1 + 32) = 0LL;
    *(_DWORD *)(a1 + 52) = 0;
    uint64_t v7 = 1LL;
  }

  int v8 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v9 = __ldxr((unsigned int *)&_pthread_list_lock);
    if (v9 != v8) {
      break;
    }
  }

  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
  return v7;
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
  if (a1->__sig != 1129202753) {
    return 22;
  }
  int result = 0;
  *a2 = *(_DWORD *)a1->__opaque & 3;
  return result;
}

int pthread_condattr_setpshared(pthread_condattr_t *a1, int a2)
{
  int result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1129202753)
  {
    int result = 0;
    *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | a2;
  }

  return result;
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return result;
}

void _pthread_cond_wait(uint64_t a1, pthread_mutex_t *a2, void **a3, int a4, int a5)
{
  if ((a2->__sig & 0xFFFFFFFDLL) != 0x4D555458 && (a2->__sig & 0xFFFFFFF0LL) != 850045856) {
    return;
  }
  int v11 = *(_DWORD *)&a2->__opaque[4];
  if ((v11 & 0x4000) != 0) {
    uint64_t v12 = 1129270854LL;
  }
  else {
    uint64_t v12 = 1129270853LL;
  }
  unsigned int v37 = v12;
  int v13 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1129270853) < 2)
  {
    if ((_DWORD)v12 != v13)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
      __break(1u);
      goto LABEL_83;
    }
  }

  else if (v13 == 1018212795)
  {
  }

  else
  {
    if (v13 != 1129270852) {
      return;
    }
    *(_DWORD *)a1 = v12;
  }

  if (a5 == 2) {
    pthread_testcancel();
  }
  if (a3)
  {
    unint64_t v14 = (unint64_t)a3[1];
    if (v14 > 0x3B9AC9FF) {
      return;
    }
    if (a4)
    {
      unint64_t v15 = (unint64_t)*a3;
      BOOL v16 = (v15 | v14) == 0;
LABEL_34:
      if ((v11 & 0x4000) == 0)
      {
        unsigned int v18 = *(pthread_mutex_t **)(a1 + 16);
        if (v18 && v18 != a2) {
          return;
        }
        if (!v16)
        {
LABEL_38:
          unsigned int v42 = 0;
          v38[0] = 0LL;
          int v19 = *(_DWORD *)(a1 + 12);
          unsigned int v20 = (unsigned int *)(a1 + 28);
          BOOL v21 = (v19 & 0x20000000) == 0;
          if ((v19 & 0x20000000) != 0) {
            uint64_t v22 = (unint64_t *)(a1 + 28);
          }
          else {
            uint64_t v22 = (unint64_t *)(a1 + 24);
          }
          if (!v21) {
            unsigned int v20 = (unsigned int *)(a1 + 32);
          }
LABEL_43:
          uint64_t v23 = *(unsigned int *)v22;
          uint64_t v24 = *v20;
          uint64_t v25 = v23 | (v24 << 32);
          unint64_t v26 = (v23 + 256) | ((unint64_t)((v24 & 0xFFFFFF00) >> 8) << 40);
          do
          {
            unint64_t v27 = __ldaxr(v22);
            if (v27 != v25)
            {
              __clrex();
              goto LABEL_43;
            }
          }

          while (__stlxr(v26, v22));
          *(void *)(a1 + 16) = a2;
          if (!_pthread_mutex_droplock((uint64_t)a2, &v42, v38, &v44, &v43))
          {
            if ((v42 & 0x1000) == 0) {
              v38[0] = 0LL;
            }
            v42 &= ~0x2000u;
            if (a5 == 2)
            {
              unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              char v39 = _pthread_psynch_cond_cleanup;
              v40 = (void *)a1;
              uint64_t v41 = *(void *)(StatusReg - 216);
              *(void *)(StatusReg - 216) = &v39;
              int v36 = __psynch_cvwait();
              pthread_testcancel();
              *(void *)(StatusReg - 216) = v41;
            }

            else
            {
              int v36 = __psynch_cvwait();
            }

            if (v36)
            {
              if (v36 == -1) {
                _pthread_cond_updateval(a1, **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8), 0);
              }
              else {
                _pthread_cond_updateval(a1, 0, v36);
              }
            }

            pthread_mutex_lock(a2);
          }

          return;
        }

LABEL_49:
        if (!pthread_mutex_unlock(a2)) {
          pthread_mutex_lock(a2);
        }
        return;
      }

      if (v16) {
        goto LABEL_49;
      }
      goto LABEL_51;
    }

    __gettimeofday();
    if (*a3 == v39)
    {
    }

    else if ((uint64_t)*a3 >= (uint64_t)v39)
    {
LABEL_33:
      BOOL v16 = 0;
      goto LABEL_34;
    }

    BOOL v16 = 1;
    goto LABEL_34;
  }

  if ((v11 & 0x4000) == 0)
  {
    int v17 = *(pthread_mutex_t **)(a1 + 16);
    if (v17 && v17 != a2) {
      return;
    }
    goto LABEL_38;
  }

LABEL_51:
  char v28 = (unint64_t *)(a1 + 4 * (((unint64_t)*(unsigned int *)(a1 + 12) >> 29) & 1) + 24);
  do
    unint64_t v29 = __ldxr(v28);
  while (__stxr(v29 + 0x100000000LL, v28));
  if (_pthread_mutex_ulock_unlock((uint64_t)a2))
  {
    do
    {
      unint64_t v30 = __ldaxr(v28);
      LODWORD(v31) = HIWORD(v30) - 1;
      if (HIWORD(v30)) {
        uint64_t v31 = v31;
      }
      else {
        uint64_t v31 = 0LL;
      }
    }

    while (__stxr((v30 + 0xFFFF00000000LL) & 0xFFFF00000000LL | (v31 << 48) | v30, v28));
    return;
  }

  unint64_t v33 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    if (a5 == 2)
    {
      v38[0] = a1;
      v38[1] = a2;
      char v39 = _pthread_ulock_cond_cleanup;
      v40 = v38;
      uint64_t v41 = *(void *)(v33 - 216);
      *(void *)(v33 - 216) = &v39;
      int v34 = __ulock_wait2();
      pthread_testcancel();
      *(void *)(v33 - 216) = v41;
      if ((v34 & 0x80000000) == 0) {
        goto LABEL_67;
      }
    }

    else
    {
      int v34 = __ulock_wait2();
      if ((v34 & 0x80000000) == 0) {
        goto LABEL_67;
      }
    }

    if (v34 != -14) {
      break;
    }
LABEL_67:
    if (*(_DWORD *)v28 != (_DWORD)v29) {
      goto LABEL_73;
    }
  }

  uint64_t v12 = -v34;
  if ((_DWORD)v12 == 4 || (_DWORD)v12 == 60)
  {
LABEL_73:
    _pthread_ulock_cond_wait_complete((uint64_t)v28, (uint64_t)a2);
    return;
  }

LABEL_83:
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
  qword_18C50BDC8 = v12;
  __break(1u);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  int sig = a1->__sig;
  int result = 22;
  if (sig <= 1129270852)
  {
    if (sig != 1018212795 && sig != 1129270852) {
      return result;
    }
LABEL_13:
    int result = 0;
    LODWORD(a1->__sig) = 0;
    return result;
  }

  if (sig == 1129270854) {
    goto LABEL_13;
  }
  if (sig == 1129270853)
  {
    opaque = (unsigned int *)a1->__opaque;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v7 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(opaque))
    {
      if (!__stxr(v7, opaque)) {
        goto LABEL_15;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_15:
    int v9 = *(_DWORD *)&a1->__opaque[4];
    unsigned int v10 = &a1->__opaque[20];
    BOOL v11 = (v9 & 0x20000000) == 0;
    if ((v9 & 0x20000000) != 0) {
      uint64_t v12 = &a1->__opaque[20];
    }
    else {
      uint64_t v12 = &a1->__opaque[16];
    }
    if (!v11) {
      unsigned int v10 = &a1->__opaque[24];
    }
    while (1)
    {
      uint64_t v13 = *(unsigned int *)v12;
      uint64_t v14 = *(unsigned int *)v10;
      unint64_t v15 = v13 | (v14 << 32);
      while (1)
      {
        unint64_t v16 = __ldaxr((unint64_t *)v12);
        if (v16 != v15) {
          break;
        }
      }

      __clrex();
    }

LABEL_26:
    LODWORD(a1->__sig) = 0;
    int v17 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v18 = __ldxr(opaque);
      if (v18 != v17) {
        break;
      }
      if (!__stlxr(0, opaque))
      {
        if ((v14 & 2) == 0) {
          return 0;
        }
        goto LABEL_30;
      }
    }

    __clrex();
    os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
    if ((v14 & 2) != 0) {
LABEL_30:
    }
      __psynch_cvclrprepost();
    return 0;
  }

  return result;
}

          *(_DWORD *)(a1 + 12) = v9;
          if ((v9 & 0x4000) != 0)
          {
            *(void *)(a1 + 32) = -1LL;
            *(void *)(a1 + 40) = -1LL;
            *(void *)(a1 + 24) = -1LL;
            *(_DWORD *)(a1 + 24) = 0;
          }

          else
          {
            uint64_t v12 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
            if ((void *)(a1 + 24) != v12)
            {
              *(_DWORD *)(a1 + 12) = v9 | 0x800;
              *(void *)(a1 + 24) = -1LL;
            }

            *(void *)(a1 + 40) = -1LL;
            *uint64_t v12 = 0LL;
            *(void *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL) = 0LL;
          }

          uint64_t v6 = 0LL;
          *(void *)(a1 + 48) = ~a1;
          *(_DWORD *)(a1 + 56) = v10;
          *(_DWORD *)(a1 + 60) = v10;
          *(_DWORD *)(a1 + 20) = v10;
          *(_DWORD *)(a1 + 4) = 0;
          atomic_store(v10, (unsigned int *)a1);
          break;
        default:
          break;
      }
    }

    else if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      uint64_t v6 = 22LL;
    }

    uint64_t v13 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      uint64_t v14 = __ldxr(&v2->_os_unfair_lock_opaque);
      if (v14 != v13) {
        break;
      }
      if (!__stlxr(0, &v2->_os_unfair_lock_opaque)) {
        return v6;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v2);
  }

  else if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
  {
    return 0LL;
  }

  else
  {
    return 22LL;
  }

  return v6;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  unsigned int v32 = 1129270852;
  unsigned int sig = a1->__sig;
  if ((LODWORD(a1->__sig) - 1129270853) < 2)
  {
    int result = 0;
    unsigned int v32 = sig;
  }

  else
  {
    if (sig != 1018212795)
    {
      if (sig == 1129270852) {
        return 0;
      }
      else {
        return 22;
      }
    }

    int result = _pthread_cond_check_init_slow((uint64_t)a1, &v32);
    unsigned int sig = v32;
    if (result) {
      return result;
    }
  }

  if (sig == 1129270852) {
    return result;
  }
  if (sig != 1129270854)
  {
    if (sig != 1129270853) {
      pthread_cond_broadcast_cold_1(sig);
    }
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = *(_DWORD *)&a1->__opaque[4];
    if ((v7 & 0x20000000) != 0) {
      int v8 = &a1->__opaque[20];
    }
    else {
      int v8 = &a1->__opaque[16];
    }
    if ((v7 & 0x20000000) != 0) {
      int v9 = &a1->__opaque[24];
    }
    else {
      int v9 = &a1->__opaque[20];
    }
    if ((v7 & 0x20000000) != 0) {
      unsigned int v10 = &a1->__opaque[16];
    }
    else {
      unsigned int v10 = &a1->__opaque[24];
    }
    while (1)
    {
      while (1)
      {
        uint64_t v11 = *(unsigned int *)v8;
        unsigned int v12 = *(_DWORD *)v10;
        uint64_t v13 = *(unsigned int *)v9;
        unsigned int v14 = v11 & 0xFFFFFF00;
        unsigned int v15 = v13 & 0xFFFFFF00;
        unsigned int v16 = *(_DWORD *)v10 & 0xFFFFFF00;
        if ((v11 & 0xFFFFFF00) != (v13 & 0xFFFFFF00) && v14 != v16) {
          break;
        }
        unint64_t v18 = v11 | (v13 << 32);
        while (1)
        {
          unint64_t v19 = __ldaxr((unint64_t *)v8);
          if (v19 != v18) {
            break;
          }
        }

LABEL_38:
        __clrex();
      }

      BOOL v20 = (unint64_t)((v11 & 0xFFFFFF00) - (v13 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v15 > v14) {
        BOOL v20 = v15 - v14 > 0x7FFFFF7F;
      }
      if (v20)
      {
        BOOL v21 = v14 - v16 < 0x7FFFFF81;
        if (v16 > v14) {
          BOOL v21 = v16 - v14 > 0x7FFFFF7F;
        }
        if (v21)
        {
          while (1)
          {
            unsigned int v22 = __ldaxr((unsigned int *)v10);
            if (v22 != v12) {
              break;
            }
            if (!__stlxr(v14, (unsigned int *)v10))
            {
              int v31 = __psynch_cvbroad();
              return 0;
            }
          }

          goto LABEL_38;
        }

        if (v5 < 0x2000)
        {
          ++v5;
        }

        else
        {
          if (v4) {
            return 35;
          }
          while (1)
          {
            unsigned int v23 = __ldaxr((unsigned int *)v10);
            if (v23 != v12) {
              break;
            }
            if (!__stlxr(v15, (unsigned int *)v10))
            {
              int v4 = 1;
              goto LABEL_48;
            }
          }

          int v4 = 0;
          __clrex();
LABEL_48:
          if (v4) {
            int v5 = 0;
          }
          else {
            ++v5;
          }
        }
      }

      else
      {
        if (v6 >= 0x2000) {
          return 35;
        }
        ++v6;
      }

      sched_yield();
    }
  }

  uint64_t v24 = (unint64_t *)&a1->__opaque[4 * (((unint64_t)*(unsigned int *)&a1->__opaque[4] >> 29) & 1) + 16];
  do
  {
    unint64_t v25 = __ldxr(v24);
    unint64_t v26 = HIWORD(v25);
    if ((v25 & 0xFFFF00000000LL) == 0 || WORD2(v25) == (_DWORD)v26)
    {
      int result = 0;
      __clrex();
      return result;
    }
  }

  while (__stlxr((v25 + 1) | (HIDWORD(v25) << 48) | v25 & 0xFFFF00000000LL, v24));
  if (WORD2(v25) > v26)
  {
    while (1)
    {
      int v28 = __ulock_wake();
      if ((v28 & 0x80000000) == 0) {
        break;
      }
      int v29 = v28;
      if (v28 != -4)
      {
        int result = 0;
        unsigned int v30 = -v29;
        if (v30 != 2)
        {
          if (v30 == 37) {
            pthread_cond_broadcast_cold_3();
          }
          pthread_cond_broadcast_cold_2(v30);
        }

        return result;
      }
    }
  }

  return 0;
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  if (a2) {
    mach_port_t v3 = pthread_mach_thread_np(a2);
  }
  else {
    mach_port_t v3 = 0;
  }
  unsigned int v39 = 1129270852;
  unsigned int sig = a1->__sig;
  if ((LODWORD(a1->__sig) - 1129270853) < 2)
  {
    int result = 0;
    unsigned int v39 = a1->__sig;
  }

  else
  {
    if (sig != 1018212795)
    {
      if (sig == 1129270852) {
        return 0;
      }
      else {
        return 22;
      }
    }

    int result = _pthread_cond_check_init_slow((uint64_t)a1, &v39);
    unsigned int sig = v39;
    if (result) {
      return result;
    }
  }

  if (sig == 1129270852) {
    return result;
  }
  if (sig != 1129270854)
  {
    if (sig != 1129270853) {
      pthread_cond_broadcast_cold_1(sig);
    }
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = *(_DWORD *)&a1->__opaque[4];
    if ((v9 & 0x20000000) != 0) {
      unsigned int v10 = &a1->__opaque[20];
    }
    else {
      unsigned int v10 = &a1->__opaque[16];
    }
    if ((v9 & 0x20000000) != 0) {
      uint64_t v11 = &a1->__opaque[24];
    }
    else {
      uint64_t v11 = &a1->__opaque[20];
    }
    if ((v9 & 0x20000000) != 0) {
      unsigned int v12 = &a1->__opaque[16];
    }
    else {
      unsigned int v12 = &a1->__opaque[24];
    }
    while (1)
    {
      uint64_t v13 = *(unsigned int *)v10;
      unsigned int v14 = *(_DWORD *)v12;
      uint64_t v15 = *(unsigned int *)v11;
      unsigned int v16 = v13 & 0xFFFFFF00;
      unsigned int v17 = v15 & 0xFFFFFF00;
      if ((v13 & 0xFFFFFF00) == (v15 & 0xFFFFFF00) || (unsigned int v18 = v14 & 0xFFFFFF00, !v3) && v16 == v18)
      {
        unint64_t v19 = v13 | (v15 << 32);
        while (1)
        {
          unint64_t v20 = __ldaxr((unint64_t *)v10);
          if (v20 != v19) {
            break;
          }
        }

        goto LABEL_46;
      }

      if (v3)
      {
LABEL_76:
        int v38 = __psynch_cvsignal();
        return 0;
      }

      BOOL v21 = (unint64_t)((v13 & 0xFFFFFF00) - (v15 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v17 > v16) {
        BOOL v21 = v17 - v16 > 0x7FFFFF7F;
      }
      if (!v21) {
        break;
      }
      if (v18 <= v16) {
        BOOL v22 = v16 - v18 < 0x7FFFFF81;
      }
      else {
        BOOL v22 = v18 - v16 > 0x7FFFFF7F;
      }
      if (v22)
      {
        BOOL v23 = v17 - v18 > 0x7FFFFF7F;
        if (v18 >= v17) {
          BOOL v23 = v18 - v17 < 0x7FFFFF81;
        }
        if (v23) {
          unsigned int v17 = v14 & 0xFFFFFF00;
        }
        unsigned int v24 = v17 + 256;
        while (1)
        {
          unsigned int v25 = __ldaxr((unsigned int *)v12);
          if (v25 != v14) {
            break;
          }
        }

LABEL_46:
        __clrex();
      }

      else
      {
        if (v7 < 0x2000)
        {
          ++v7;
        }

        else
        {
          if (v6) {
            return 35;
          }
          while (1)
          {
            unsigned int v26 = __ldaxr((unsigned int *)v12);
            if (v26 != v14) {
              break;
            }
            if (!__stlxr(v17, (unsigned int *)v12))
            {
              int v6 = 1;
              goto LABEL_56;
            }
          }

          int v6 = 0;
          __clrex();
LABEL_56:
          if (v6) {
            int v7 = 0;
          }
          else {
            ++v7;
          }
        }

LABEL_59:
        sched_yield();
      }
    }

    if (v8 >= 0x2000) {
      return 35;
    }
    ++v8;
    goto LABEL_59;
  }

  unint64_t v27 = (unint64_t *)&a1->__opaque[4 * (((unint64_t)*(unsigned int *)&a1->__opaque[4] >> 29) & 1) + 16];
  do
  {
    unint64_t v28 = __ldxr(v27);
    uint64_t v29 = v28 & 0xFFFF00000000LL;
    unint64_t v30 = HIWORD(v28);
    unsigned int v31 = WORD2(v28);
    if ((v28 & 0xFFFF00000000LL) == 0 || WORD2(v28) == (_DWORD)v30)
    {
      int result = 0;
      __clrex();
      return result;
    }

    uint64_t v33 = (v28 + 1);
    else {
      uint64_t v34 = v31;
    }
  }

  while (__stlxr(v33 | (v34 << 48) | v29, v27));
  do
  {
    int v35 = __ulock_wake();
    if ((v35 & 0x80000000) == 0) {
      return 0;
    }
    int v36 = v35;
  }

  while (v35 == -4);
  int result = 0;
  unsigned int v37 = -v36;
  if (v37 != 2)
  {
    if (v37 != 37) {
      pthread_cond_broadcast_cold_2(v37);
    }
    if (!v3) {
      pthread_cond_broadcast_cold_3();
    }
    return pthread_cond_broadcast(a1);
  }

  return result;
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  unsigned int v39 = 1129270852;
  unsigned int sig = a1->__sig;
  if ((LODWORD(a1->__sig) - 1129270853) < 2)
  {
    int result = 0;
    unsigned int v39 = sig;
  }

  else
  {
    if (sig != 1018212795)
    {
      if (sig == 1129270852) {
        return 0;
      }
      else {
        return 22;
      }
    }

    int result = _pthread_cond_check_init_slow((uint64_t)a1, &v39);
    unsigned int sig = v39;
    if (result) {
      return result;
    }
  }

  if (sig == 1129270852) {
    return result;
  }
  if (sig != 1129270854)
  {
    if (sig != 1129270853) {
      pthread_cond_broadcast_cold_1(sig);
    }
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = *(_DWORD *)&a1->__opaque[4];
    if ((v7 & 0x20000000) != 0) {
      int v8 = &a1->__opaque[20];
    }
    else {
      int v8 = &a1->__opaque[16];
    }
    if ((v7 & 0x20000000) != 0) {
      int v9 = &a1->__opaque[24];
    }
    else {
      int v9 = &a1->__opaque[20];
    }
    if ((v7 & 0x20000000) != 0) {
      unsigned int v10 = &a1->__opaque[16];
    }
    else {
      unsigned int v10 = &a1->__opaque[24];
    }
    while (1)
    {
      while (1)
      {
        uint64_t v11 = *(unsigned int *)v8;
        unsigned int v12 = *(_DWORD *)v10;
        uint64_t v13 = *(unsigned int *)v9;
        unsigned int v14 = v11 & 0xFFFFFF00;
        unsigned int v15 = v13 & 0xFFFFFF00;
        unsigned int v16 = *(_DWORD *)v10 & 0xFFFFFF00;
        if ((v11 & 0xFFFFFF00) != (v13 & 0xFFFFFF00) && v14 != v16) {
          break;
        }
        unint64_t v18 = v11 | (v13 << 32);
        while (1)
        {
          unint64_t v19 = __ldaxr((unint64_t *)v8);
          if (v19 != v18) {
            break;
          }
        }

LABEL_44:
        __clrex();
      }

      BOOL v20 = (unint64_t)((v11 & 0xFFFFFF00) - (v13 & 0xFFFFFF00)) < 0x7FFFFF81;
      if (v15 > v14) {
        BOOL v20 = v15 - v14 > 0x7FFFFF7F;
      }
      if (v20)
      {
        if (v16 <= v14) {
          BOOL v21 = v14 - v16 < 0x7FFFFF81;
        }
        else {
          BOOL v21 = v16 - v14 > 0x7FFFFF7F;
        }
        if (v21)
        {
          BOOL v22 = v15 - v16 > 0x7FFFFF7F;
          if (v16 >= v15) {
            BOOL v22 = v16 - v15 < 0x7FFFFF81;
          }
          if (v22) {
            unsigned int v15 = *(_DWORD *)v10 & 0xFFFFFF00;
          }
          unsigned int v23 = v15 + 256;
          while (1)
          {
            unsigned int v24 = __ldaxr((unsigned int *)v10);
            if (v24 != v12) {
              break;
            }
            if (!__stlxr(v23, (unsigned int *)v10))
            {
              int v37 = __psynch_cvsignal();
              int v38 = v37;
              int result = 0;
              if ((v38 - 1) <= 0xFFFFFFFD)
              {
                _pthread_cond_updateval((uint64_t)a1, 0, v38);
                return 0;
              }

              return result;
            }
          }

          goto LABEL_44;
        }

        if (v5 < 0x2000)
        {
          ++v5;
        }

        else
        {
          if (v4) {
            return 35;
          }
          while (1)
          {
            unsigned int v25 = __ldaxr((unsigned int *)v10);
            if (v25 != v12) {
              break;
            }
            if (!__stlxr(v15, (unsigned int *)v10))
            {
              int v4 = 1;
              goto LABEL_54;
            }
          }

          int v4 = 0;
          __clrex();
LABEL_54:
          if (v4) {
            int v5 = 0;
          }
          else {
            ++v5;
          }
        }
      }

      else
      {
        if (v6 >= 0x2000) {
          return 35;
        }
        ++v6;
      }

      sched_yield();
    }
  }

  unsigned int v26 = (unint64_t *)&a1->__opaque[4 * (((unint64_t)*(unsigned int *)&a1->__opaque[4] >> 29) & 1) + 16];
  do
  {
    unint64_t v27 = __ldxr(v26);
    uint64_t v28 = v27 & 0xFFFF00000000LL;
    unint64_t v29 = HIWORD(v27);
    unsigned int v30 = WORD2(v27);
    if ((v27 & 0xFFFF00000000LL) == 0 || WORD2(v27) == (_DWORD)v29)
    {
      int result = 0;
      __clrex();
      return result;
    }

    uint64_t v32 = (v27 + 1);
    else {
      uint64_t v33 = v30;
    }
  }

  while (__stlxr(v32 | (v33 << 48) | v28, v26));
  if (v30 > v29)
  {
    while (1)
    {
      int v34 = __ulock_wake();
      if ((v34 & 0x80000000) == 0) {
        break;
      }
      int v35 = v34;
      if (v34 != -4)
      {
        int result = 0;
        unsigned int v36 = -v35;
        if (v36 != 2)
        {
          if (v36 == 37) {
            pthread_cond_broadcast_cold_3();
          }
          pthread_cond_broadcast_cold_2(v36);
        }

        return result;
      }
    }
  }

  return 0;
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  *(void *)&a1->__opaque[8] = 0LL;
  *(_DWORD *)&a1->__opaque[16] = 0;
  *(_DWORD *)&a1->__opaque[20] = 0;
  *(_DWORD *)&a1->__opaque[24] = 0;
  int v2 = *(_DWORD *)&a1->__opaque[4];
  int v3 = (((unint64_t)&a1->__opaque[16] & 7) != 0) << 29;
  *(_DWORD *)a1->__opaque = 0;
  *(_DWORD *)&a1->__opaque[4] = v2 & 0xC0000000 | v3;
  uint64_t v4 = 32LL;
  *(_DWORD *)((char *)&a1->__sig + v4) = 1;
  if (a2) {
    unsigned int v5 = v3 | (*(_DWORD *)a2->__opaque << 30);
  }
  else {
    unsigned int v5 = v3 | 0x80000000;
  }
  *(_DWORD *)&a1->__opaque[4] = v5;
  HIDWORD(a1->__sig) = 0;
  atomic_store(0x434F4E44u, (unsigned int *)a1);
  return 0;
}

uint64_t _pthread_cond_updateval(uint64_t result, unsigned int a2, int a3)
{
  if ((a2 & 0x100) != 0) {
    int v3 = 257;
  }
  else {
    int v3 = 256;
  }
  int v4 = v3 | (a2 >> 8) & 2;
  if (!a2) {
    int v4 = a3;
  }
  int v5 = *(_DWORD *)(result + 12);
  int v6 = (unsigned int *)(result + 28);
  BOOL v7 = (v5 & 0x20000000) == 0;
  if ((v5 & 0x20000000) != 0) {
    int v8 = (unint64_t *)(result + 28);
  }
  else {
    int v8 = (unint64_t *)(result + 24);
  }
  if (!v7) {
    int v6 = (unsigned int *)(result + 32);
  }
  unsigned int v9 = v4 & 0xFFFFFF00;
LABEL_12:
  uint64_t v10 = *(unsigned int *)v8;
  uint64_t v11 = *v6;
  int v12 = v10 & 0xFFFFFF00;
  int v13 = v11 & 0xFFFFFF00;
  unint64_t v14 = v10 | (v11 << 32);
  if ((v4 & 2) != 0 || v12 != v13)
  {
    int v18 = (v11 | v4) & 3;
    LODWORD(v15) = (v13 + v9) | v18;
    BOOL v16 = v13 + v9 == v12 && v18 == 3;
    if (v16) {
      uint64_t v15 = v15 & 0xFFFFFF01;
    }
    else {
      uint64_t v15 = v15;
    }
    unint64_t v17 = v10 | (v15 << 32);
  }

  else
  {
    LODWORD(v15) = 0;
    BOOL v16 = 0;
    unint64_t v17 = v14;
  }

  do
  {
    unint64_t v19 = __ldaxr(v8);
    if (v19 != v14)
    {
      __clrex();
      goto LABEL_12;
    }
  }

  while (__stlxr(v17, v8));
  if (v16) {
    return __psynch_cvclrprepost();
  }
  return result;
}

uint64_t _pthread_cond_check_init_slow(uint64_t result, unsigned int *a2)
{
  uint64_t v3 = result;
  int v4 = (os_unfair_lock_s *)(result + 8);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&v4->_os_unfair_lock_opaque))
  {
    if (!__stxr(v6, &v4->_os_unfair_lock_opaque)) {
      goto LABEL_6;
    }
  }

  __clrex();
  int result = os_unfair_lock_lock_with_options();
LABEL_6:
  unsigned int v8 = *(_DWORD *)v3;
  if ((*(_DWORD *)v3 - 1129270853) < 2)
  {
    if (*a2 == 1129270852)
    {
      uint64_t v9 = 0LL;
      *a2 = v8;
      goto LABEL_22;
    }

    if (*a2 != v8)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
      __break(1u);
      return result;
    }

LABEL_21:
    uint64_t v9 = 0LL;
    goto LABEL_22;
  }

  if (v8 == 1129270852)
  {
    if (*a2 != 1129270852)
    {
      uint64_t v9 = 0LL;
      *(_DWORD *)uint64_t v3 = *a2;
      goto LABEL_22;
    }

    goto LABEL_21;
  }

  if (v8 == 1018212795)
  {
    uint64_t v9 = 0LL;
    unsigned int v10 = *a2;
    *(void *)(v3 + 16) = 0LL;
    *(_DWORD *)(v3 + 24) = 0;
    *(_DWORD *)(v3 + 28) = 0;
    *(_DWORD *)(v3 + 32) = 0;
    uint64_t v11 = 32LL;
    if ((((_BYTE)v3 + 24) & 7) == 0) {
      uint64_t v11 = 28LL;
    }
    *(_DWORD *)(v3 + v11) = 1;
    if ((((_BYTE)v3 + 24) & 7) != 0) {
      unsigned int v12 = -1610612736;
    }
    else {
      unsigned int v12 = 0x80000000;
    }
    *(_DWORD *)(v3 + 12) = v12;
    *(_DWORD *)(v3 + 4) = 0;
    atomic_store(v10, (unsigned int *)v3);
  }

  else
  {
    uint64_t v9 = 22LL;
  }

          while (1)
          {
            BOOL v20 = __ldxr(v7);
            if (v20 != v8) {
              break;
            }
            if (!__stlxr(v17 | (v11 << 32), v7))
            {
              BOOL v21 = 1;
              goto LABEL_30;
            }
          }

          BOOL v21 = 0;
          __clrex();
LABEL_30:
          unsigned int v8 = v20;
          if (v21)
          {
            if (a4) {
              *a4 = v17;
            }
            if (a5) {
              *a5 = v11;
            }
            goto LABEL_55;
          }
        }
      }

      goto LABEL_57;
    }

    return 1LL;
  }

  if ((v5 & 0xC) == 0) {
    goto LABEL_64;
  }
  if (*v9 != *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8)) {
    return 1LL;
  }
  if (v10 != 8
    || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v5 | ((unsigned __int16)(HIWORD(v5) - 1) << 16), HIWORD(v5) == 1))
  {
LABEL_64:
    do
    {
      BOOL v22 = v8;
      unsigned int v23 = *v9;
      unsigned int v24 = (v8 & 0xFFFFFF00) - (HIDWORD(v8) & 0xFFFFFF00);
      if (v24 <= 0) {
        unsigned int v25 = HIDWORD(v8);
      }
      else {
        unsigned int v25 = (HIDWORD(v8) + 256);
      }
      if (v23)
      {
        do
        {
          unsigned int v26 = __ldxr(v9);
          if (v26 != v23) {
            goto LABEL_61;
          }
        }

        while (__stxr(0LL, v9));
      }

      while (1)
      {
        unint64_t v27 = __ldxr(v7);
        if (v27 != v8) {
          break;
        }
        if (!__stlxr(v8 & 0xFFFFFFFD | (unint64_t)(v25 << 32), v7))
        {
          uint64_t v28 = 1;
          goto LABEL_49;
        }
      }

      uint64_t v28 = 0;
      __clrex();
LABEL_49:
      unsigned int v8 = v27;
    }

    while (!v28);
    if (a4) {
      *a4 = v22 & 0xFFFFFFFD;
    }
    if (a5) {
      *a5 = v25;
    }
    v6 |= (v24 > 0) << 12;
LABEL_55:
    if (a3) {
      *a3 = a1;
    }
  }

uint64_t _pthread_ulock_cond_wait_complete(uint64_t result, uint64_t a2)
{
  int v2 = (unint64_t *)result;
  if (a2) {
    int result = _pthread_mutex_ulock_lock(a2, 0);
  }
  do
  {
    unint64_t v3 = __ldaxr(v2);
    LODWORD(v4) = HIWORD(v3) - 1;
    if (HIWORD(v3)) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  while (__stxr((v3 + 0xFFFF00000000LL) & 0xFFFF00000000LL | (v4 << 48) | v3, v2));
  return result;
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
    int v2 = *(pthread_mutex_t **)(result + 16);
    int result = _pthread_cond_updateval(result, *(_DWORD *)(StatusReg - 56), 0);
    if (v2) {
      return pthread_mutex_lock(v2);
    }
  }

  return result;
}

unsigned __int8 *_pthread_mutex_global_init(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a2 + 44);
  if (v3 == 1) {
    int v4 = 1;
  }
  else {
    int v4 = 2;
  }
  if (v3 <= 3) {
    int v5 = v4;
  }
  else {
    int v5 = 2;
  }
  if (*(_DWORD *)(a2 + 44)) {
    int v6 = v5;
  }
  else {
    int v6 = 2;
  }
  BOOL v7 = (_BYTE *)_simple_getenv();
  if (v7)
  {
    int v8 = *v7 == 49 ? 1 : 2;
  }

  if (v6 != __pthread_mutex_default_opt_policy) {
    __pthread_mutex_default_opt_policy = v6;
  }
  uint64_t v9 = (unsigned __int8 *)_simple_getenv();
  if (v9)
  {
    int v10 = *v9 == 49;
  }

  else
  {
    unsigned int v11 = *(_DWORD *)(a2 + 44);
    if (v11) {
      int v10 = (v11 >> 8) & 1;
    }
    else {
      int v10 = 0;
    }
  }

  int result = (unsigned __int8 *)_simple_getenv();
  if (result)
  {
    int v13 = *result == 49;
  }

  else
  {
    unsigned int v14 = *(_DWORD *)(a2 + 44);
    if (v14) {
      int v13 = (v14 >> 9) & 1;
    }
    else {
      int v13 = 0;
    }
  }

  return result;
}

uint64_t mutex_seq_atomic_cmpxchgv_relaxed(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  while (1)
  {
    unint64_t v5 = __ldxr(a1);
    if (v5 != v3) {
      break;
    }
    if (!__stxr(v4, a1))
    {
      uint64_t result = 1LL;
      goto LABEL_6;
    }
  }

  uint64_t result = 0LL;
  __clrex();
LABEL_6:
  *a2 = v5;
  return result;
}

uint64_t mutex_seq_atomic_cmpxchgv_acquire(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  while (1)
  {
    unint64_t v5 = __ldaxr(a1);
    if (v5 != v3) {
      break;
    }
    if (!__stxr(v4, a1))
    {
      uint64_t result = 1LL;
      goto LABEL_6;
    }
  }

  uint64_t result = 0LL;
  __clrex();
LABEL_6:
  *a2 = v5;
  return result;
}

uint64_t mutex_seq_atomic_cmpxchgv_release(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  while (1)
  {
    unint64_t v5 = __ldxr(a1);
    if (v5 != v3) {
      break;
    }
    if (!__stlxr(v4, a1))
    {
      uint64_t result = 1LL;
      goto LABEL_6;
    }
  }

  uint64_t result = 0LL;
  __clrex();
LABEL_6:
  *a2 = v5;
  return result;
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  *(void *)a1->__opaque = 0x200000000000LL;
  if (a2)
  {
    if (a2->__sig != 1297373249) {
      return 22;
    }
    *(_WORD *)&a1->__opaque[8] = *(_DWORD *)a2->__opaque;
    int v2 = *(_DWORD *)&a2->__opaque[4] & 3 | 0x2000;
    *(_DWORD *)&a1->__opaque[4] = v2;
    int v3 = *(_DWORD *)&a2->__opaque[4] & 0x1C0 | v2;
    *(_DWORD *)&a1->__opaque[4] = v3;
    int v4 = *(_DWORD *)&a2->__opaque[4] & 0xC | v3;
    *(_DWORD *)&a1->__opaque[4] = v4;
    int v5 = *(_DWORD *)&a2->__opaque[4] & 0x30 | v4;
  }

  else
  {
    *(_WORD *)&a1->__opaque[8] = 0;
    int v5 = ((__pthread_mutex_default_opt_policy & 7) << 6) | 0x2020;
  }

  unsigned int v6 = 1297437784;
  *(_WORD *)&a1->__opaque[10] = 0;
  if ((v5 & 0xC) == 0)
  {
    if ((v5 & 0x1C0) == 0x80 || (v5 & 0x1C0) == 0x40)
    {
      unsigned int v6 = 1297437786;
      char v7 = 1;
    }

    else
    {
      char v7 = 0;
    }

    if ((v5 & 0x1CC) == 0x80)
    {
      char v9 = v7 ^ 1;
      if ((v5 & 0x30) != 0x20) {
        char v9 = 1;
      }
      if ((v9 & 1) == 0) {
        v5 |= __pthread_mutex_use_ulock << 14;
      }
    }
  }

  *(_DWORD *)&a1->__opaque[4] = v5;
  if ((v5 & 0x4000) != 0)
  {
    *(void *)&a1->__opaque[24] = -1LL;
    *(void *)&a1->__opaque[32] = -1LL;
    *(void *)&a1->__opaque[16] = -1LL;
    *(_DWORD *)&a1->__opaque[16] = 0;
  }

  else
  {
    int v10 = (pthread_mutex_t *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
    if (&a1->__opaque[16] != (char *)v10)
    {
      *(_DWORD *)&a1->__opaque[4] = v5 | 0x800;
      *(void *)&a1->__opaque[16] = -1LL;
    }

    *(void *)&a1->__opaque[32] = -1LL;
    v10->__unsigned int sig = 0LL;
    *(void *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL) = 0LL;
  }

  int v8 = 0;
  *(void *)&a1->__opaque[40] = ~(unint64_t)a1;
  *(_DWORD *)&a1->__opaque[48] = v6;
  *(_DWORD *)&a1->__opaque[52] = v6;
  *(_DWORD *)&a1->__opaque[12] = v6;
  HIDWORD(a1->__sig) = 0;
  atomic_store(v6, (unsigned int *)a1);
  return v8;
}

int pthread_mutex_getprioceiling(const pthread_mutex_t *a1, int *a2)
{
  if ((a1->__sig & 0xFFFFFFFDLL) != 0x4D555458) {
    return 22;
  }
  opaque = (os_unfair_lock_s *)a1->__opaque;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v6 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&opaque->_os_unfair_lock_opaque))
  {
    if (!__stxr(v6, &opaque->_os_unfair_lock_opaque)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  *a2 = *(__int16 *)&a1->__opaque[8];
  int v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v10 = __ldxr(&opaque->_os_unfair_lock_opaque);
    if (v10 != v9) {
      break;
    }
    if (!__stlxr(0, &opaque->_os_unfair_lock_opaque)) {
      return 0;
    }
  }

  __clrex();
  os_unfair_lock_unlock(opaque);
  return 0;
}

int pthread_mutex_setprioceiling(pthread_mutex_t *a1, int a2, int *a3)
{
  if ((a1->__sig & 0xFFFFFFFDLL) != 0x4D555458) {
    return 22;
  }
  opaque = (os_unfair_lock_s *)a1->__opaque;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v8 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&opaque->_os_unfair_lock_opaque))
  {
    if (!__stxr(v8, &opaque->_os_unfair_lock_opaque)) {
      goto LABEL_8;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_8:
  if ((a2 + 999) > 0x7CE)
  {
    int v10 = 22;
  }

  else
  {
    int v10 = 0;
    *a3 = *(__int16 *)&a1->__opaque[8];
    *(_WORD *)&a1->__opaque[8] = a2;
  }

  int v11 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v12 = __ldxr(&opaque->_os_unfair_lock_opaque);
    if (v12 != v11) {
      break;
    }
    if (!__stlxr(0, &opaque->_os_unfair_lock_opaque)) {
      return v10;
    }
  }

  __clrex();
  os_unfair_lock_unlock(opaque);
  return v10;
}

int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *a1, int *a2)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  int result = 0;
  *a2 = *(_DWORD *)a1->__opaque;
  return result;
}

int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *a1, int *a2)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  int result = 0;
  *a2 = *(_DWORD *)&a1->__opaque[4] & 3;
  return result;
}

int pthread_mutexattr_getpolicy_np(const pthread_mutexattr_t *a1, int *a2)
{
  if (a1->__sig == 1297373249)
  {
    int v2 = (*(_DWORD *)&a1->__opaque[4] >> 6) & 7;
    if (v2 == 1)
    {
LABEL_5:
      int result = 0;
      *a2 = v2;
      return result;
    }

    if (v2 == 2)
    {
      int v2 = 3;
      goto LABEL_5;
    }
  }

  return 22;
}

int pthread_mutexattr_gettype(const pthread_mutexattr_t *a1, int *a2)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  int result = 0;
  *a2 = (*(_DWORD *)&a1->__opaque[4] >> 2) & 3;
  return result;
}

int pthread_mutexattr_getpshared(const pthread_mutexattr_t *a1, int *a2)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  int result = 0;
  *a2 = (*(_DWORD *)&a1->__opaque[4] >> 4) & 3;
  return result;
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  unsigned int v1 = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE00 | ((__pthread_mutex_default_opt_policy & 7) << 6);
  a1->__unsigned int sig = 1297373249LL;
  *(_DWORD *)a1->__opaque = 0;
  *(_DWORD *)&a1->__opaque[4] = v1 | 0x20;
  return 0;
}

int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *a1, int a2)
{
  int result = 22;
  if ((a2 + 999) <= 0x7CE && a1->__sig == 1297373249)
  {
    int result = 0;
    *(_DWORD *)a1->__opaque = a2;
  }

  return result;
}

int pthread_mutexattr_setprotocol(pthread_mutexattr_t *a1, int a2)
{
  int result = 22;
  if (a2 <= 2 && a1->__sig == 1297373249)
  {
    int result = 0;
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFFC | a2;
  }

  return result;
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  if (a1->__sig == 1297373249)
  {
    if (a2 == 1)
    {
      int v2 = 64;
      goto LABEL_7;
    }

    if (a2 == 3)
    {
      int v2 = 128;
LABEL_7:
      int v3 = 0;
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | v2;
      return v3;
    }
  }

  return 22;
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  int result = 22;
  if (a2 <= 2 && a1->__sig == 1297373249)
  {
    int result = 0;
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFF3 | (4 * (a2 & 3));
  }

  return result;
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  int result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1297373249)
  {
    int result = 0;
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | (16 * (a2 & 3));
  }

  return result;
}

uint64_t _pthread_mutex_fairshare_lock_slow(uint64_t a1, int a2)
{
  int v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v4 = *v3;
  int v5 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v6 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  unsigned int v7 = *(_DWORD *)(a1 + 12);
  if ((v7 & 0xC) == 0 || *v5 != v6)
  {
LABEL_6:
    unint64_t v9 = v4;
    uint64_t v10 = (v4 >> 1) & 1;
    unsigned int v11 = (v4 | 3) + 256;
    unint64_t v12 = v9 & 0xFFFFFFFF00000000LL | v11;
    do
    {
      unint64_t v4 = __ldaxr(v3);
      if (v4 != v9)
      {
        __clrex();
        goto LABEL_6;
      }
    }

    while (__stxr(v12, v3));
    if ((v9 & 2) != 0)
    {
      if ((a2 & 1) != 0) {
        return 16LL;
      }
      _pthread_mutex_fairshare_lock_wait(a1);
    }

    else
    {
      *int v5 = v6;
    }

    if ((*(_DWORD *)(a1 + 12) & 0xC) != 8) {
      return 0LL;
    }
    uint64_t result = 0LL;
    int v13 = (unsigned __int16)*(_DWORD *)(a1 + 12) | 0x10000;
    goto LABEL_25;
  }

  if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
  {
    if (v7 > 0xFFFEFFFF) {
      return 35LL;
    }
    uint64_t result = 0LL;
    int v13 = v7 + 0x10000;
LABEL_25:
    *(_DWORD *)(a1 + 12) = v13;
    return result;
  }

  if (a2) {
    return 16LL;
  }
  else {
    return 11LL;
  }
}

uint64_t _pthread_mutex_fairshare_lock_wait(uint64_t a1)
{
  int v2 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  unint64_t v4 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  do
  {
    do
      uint64_t result = __psynch_mutexwait();
    while ((_DWORD)result == -1);
    int v6 = *(_DWORD *)(a1 + 12) & 0x1C0;
    unint64_t v7 = *v4;
    BOOL v8 = 1;
    do
    {
      if (v6 == 128)
      {
        BOOL v8 = (v7 & 2) == 0;
        goto LABEL_7;
      }

      if ((~(_DWORD)v7 & 3) == 0) {
        break;
      }
LABEL_7:
      while (1)
      {
        unint64_t v9 = __ldaxr(v4);
        if (v9 != v7) {
          break;
        }
        if (!__stxr(v7 | 3, v4))
        {
          int v10 = 1;
          goto LABEL_11;
        }
      }

      int v10 = 0;
      __clrex();
LABEL_11:
      unint64_t v7 = v9;
    }

    while (!v10);
  }

  while (!v8);
  *int v2 = v3;
  return result;
}

uint64_t _pthread_mutex_fairshare_unlock_slow(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12);
  unsigned int v2 = v1 & 0xFFFFEFFF;
  uint64_t v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v4 = *v3;
  int v5 = (unint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  if ((v1 & 0xC) == 0) {
    goto LABEL_37;
  }
  if (*v5 != *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8)) {
    return 1LL;
  }
  if ((v1 & 0xC) != 8
    || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v1 | ((unsigned __int16)(HIWORD(v1) - 1) << 16), HIWORD(v1) == 1))
  {
LABEL_37:
    do
    {
      unint64_t v6 = HIDWORD(v4);
      unint64_t v7 = *v5;
      if (((HIDWORD(v4) ^ v4) & 0xFFFFFF00) != 0)
      {
        unint64_t v6 = (HIDWORD(v4) + 256);
        unsigned int v8 = v6 ^ v4;
        else {
          unint64_t v9 = -1LL;
        }
        BOOL v10 = v8 >= 0x100;
        BOOL v11 = v8 < 0x100;
        unsigned int v12 = v4 & 0xFFFFFFFC;
        if (v10) {
          unsigned int v12 = v4;
        }
        if (v10) {
          v2 |= 0x1000u;
        }
        if (v7 != v9)
        {
          do
          {
            unint64_t v13 = __ldxr(v5);
            if (v13 != v7)
            {
              __clrex();
              _pthread_mutex_corruption_abort();
            }
          }

          while (__stxr(v9, v5));
        }
      }

      else
      {
        BOOL v11 = 0;
        unsigned int v12 = v4;
      }

      while (1)
      {
        unint64_t v15 = __ldxr(v3);
        if (v15 != v4) {
          break;
        }
        if (!__stlxr(v12 | (v6 << 32), v3))
        {
          int v16 = 1;
          goto LABEL_29;
        }
      }

      int v16 = 0;
      __clrex();
LABEL_29:
      unint64_t v4 = v15;
    }

    while (!v16);
  }

  if ((v2 & 0x1000) != 0) {
    _pthread_mutex_fairshare_unlock_drop();
  }
  return 0LL;
}

uint64_t _pthread_mutex_fairshare_unlock_drop()
{
  uint64_t result = __psynch_mutexdrop();
  if ((_DWORD)result == -1)
  {
    uint64_t v1 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if ((v1 & 0xFFFFFFFB) != 0)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_18C50BDC8 = v1;
      __break(1u);
    }
  }

  return result;
}

uint64_t _pthread_mutex_ulock_lock(uint64_t a1, char a2)
{
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  unint64_t v4 = (unsigned int *)(a1 + 24);
  while (1)
  {
    uint64_t v5 = __ldaxr(v4);
    if ((_DWORD)v5) {
      break;
    }
    if (!__stxr(v3, v4))
    {
      int v6 = 1;
      goto LABEL_6;
    }
  }

  int v6 = 0;
  __clrex();
LABEL_6:
  if (v6) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = 16LL;
  }
  if ((v6 & 1) == 0 && (a2 & 1) == 0)
  {
    _pthread_mutex_ulock_lock_slow(a1, v3, v5);
    return 0LL;
  }

  return v7;
}

uint64_t _pthread_mutex_ulock_lock_slow(uint64_t result, int a2, uint64_t a3)
{
  char v5 = 0;
  char v6 = 0;
  uint64_t v7 = (unsigned int *)(result + 24);
  while (1)
  {
    if ((v5 & 1) != 0) {
      int v8 = -4;
    }
    else {
      int v8 = a3 & 0xFFFFFFFC;
    }
    do
    {
      uint64_t v9 = __ldxr(v7);
      if ((_DWORD)v9 != (_DWORD)a3)
      {
        char v5 = 0;
        __clrex();
        goto LABEL_12;
      }
    }

    while (__stxr(v8 | 1, v7));
    uint64_t result = __ulock_wait();
    if ((result & 0x80000000) == 0)
    {
      v6 |= (_DWORD)result != 0;
LABEL_11:
      char v5 = 0;
      uint64_t v9 = *v7;
      goto LABEL_12;
    }

    if (-(int)result != 105)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
      qword_18C50BDC8 = (int)result;
      __break(1u);
      return result;
    }

    char v5 = 1;
    uint64_t v9 = a3;
LABEL_12:
    a3 = v9;
    if (!(_DWORD)v9)
    {
      while (1)
      {
        a3 = __ldaxr(v7);
        if ((_DWORD)a3) {
          break;
        }
        if (!__stxr(v6 & 1 | a2, v7))
        {
          int v10 = 1;
          goto LABEL_17;
        }
      }

      int v10 = 0;
      __clrex();
LABEL_17:
      char v5 = 0;
      if (v10) {
        return result;
      }
    }
  }

uint64_t _pthread_mutex_ulock_unlock(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  unsigned int v2 = (unsigned int *)(a1 + 24);
  do
    int v3 = __ldxr(v2);
  while (__stlxr(0, v2));
  if (v3 != v1) {
    _pthread_mutex_ulock_unlock_slow(a1, v1, v3);
  }
  return 0LL;
}

uint64_t _pthread_mutex_ulock_unlock_slow(uint64_t result, int a2, int a3)
{
  if (a3)
  {
    if ((a3 & 0xFFFFFFFC) != a2) {
      goto LABEL_8;
    }
    if ((a3 & 1) == 0)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: unlock_slow without orig_waiters";
      __break(1u);
    }

    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if ((_DWORD)result != -4)
      {
        qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
        qword_18C50BDC8 = -(int)result;
        __break(1u);
LABEL_8:
        if ((a3 & 1) == 0) {
          break;
        }
      }
    }
  }

  return result;
}

uint64_t _pthread_mutex_firstfit_unlock_slow(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12);
  unsigned int v2 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v3 = *v2;
  unint64_t v4 = (unint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  if ((v1 & 0xC) == 0) {
    goto LABEL_5;
  }
  if (*v4 == *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
  {
    if ((v1 & 0xC) == 8)
    {
      *(_DWORD *)(a1 + 12) = (unsigned __int16)v1 | ((unsigned __int16)(HIWORD(v1) - 1) << 16);
      if (HIWORD(v1) != 1) {
        return 0LL;
      }
    }

    do
    {
LABEL_5:
      unint64_t v5 = *v4;
      if (*v4)
      {
        do
        {
          unint64_t v6 = __ldxr(v4);
          if (v6 != v5)
          {
            __clrex();
            _pthread_mutex_corruption_abort();
          }
        }

        while (__stxr(0LL, v4));
      }

      int v7 = (v3 & 0xFFFFFF00) - (HIDWORD(v3) & 0xFFFFFF00);
      unint64_t v8 = v3 + 0x10000000000LL;
      if (v7 <= 0) {
        unint64_t v8 = v3;
      }
      unint64_t v9 = v8 & 0xFFFFFFFF00000000LL;
      while (1)
      {
        unint64_t v10 = __ldxr(v2);
        if (v10 != v3) {
          break;
        }
        if (!__stlxr(v9 | v3 & 0xFFFFFFFD, v2))
        {
          int v11 = 1;
          goto LABEL_15;
        }
      }

      int v11 = 0;
      __clrex();
LABEL_15:
      unint64_t v3 = v10;
    }

    while (!v11);
    if ((((v7 > 0) << 12) & 0x1000) != 0) {
      _pthread_mutex_firstfit_wake();
    }
    return 0LL;
  }

  return 1LL;
}

uint64_t _pthread_mutex_firstfit_wake()
{
  uint64_t result = __psynch_mutexdrop();
  if ((_DWORD)result == -1)
  {
    uint64_t v1 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if ((v1 & 0xFFFFFFFB) != 0)
    {
      qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_18C50BDC8 = v1;
      __break(1u);
    }
  }

  return result;
}

uint64_t _pthread_mutex_firstfit_lock_slow(uint64_t a1, int a2)
{
  unint64_t v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v4 = *v3;
  unint64_t v5 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v6 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  unsigned int v7 = *(_DWORD *)(a1 + 12);
  if ((v7 & 0xC) != 0 && *v5 == v6)
  {
    if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
    {
      if (v7 > 0xFFFEFFFF) {
        return 35LL;
      }
      uint64_t result = 0LL;
      int v12 = v7 + 0x10000;
LABEL_35:
      *(_DWORD *)(a1 + 12) = v12;
    }

    else if (a2)
    {
      return 16LL;
    }

    else
    {
      return 11LL;
    }

    return result;
  }

  while (a2 && (v4 & 2) != 0)
  {
    while (1)
    {
      unint64_t v9 = __ldaxr(v3);
      if (v9 != v4) {
        break;
      }
      if (!__stxr(v4, v3))
      {
        char v11 = 1;
        goto LABEL_24;
      }
    }

    char v11 = 0;
    __clrex();
LABEL_24:
    if ((v11 & 1) != 0) {
      goto LABEL_25;
    }
LABEL_13:
    unint64_t v4 = v9;
  }

  if ((v4 & 2) == 0)
  {
    while (1)
    {
      unint64_t v9 = __ldaxr(v3);
      if (v9 != v4) {
        break;
      }
      if (!__stxr(v4 | 2, v3))
      {
        *unint64_t v5 = v6;
        goto LABEL_28;
      }
    }

    __clrex();
    goto LABEL_13;
  }

  do
  {
    unint64_t v9 = __ldaxr(v3);
    if (v9 != v4)
    {
      char v10 = 0;
      __clrex();
      goto LABEL_10;
    }
  }

  while (__stxr((v4 + 256) | v4 & 0xFFFFFFFF00000000LL, v3));
  char v10 = 1;
LABEL_10:
  if ((v10 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_25:
  if ((a2 & 1) != 0) {
    return 16LL;
  }
  _pthread_mutex_firstfit_lock_wait(a1);
LABEL_28:
  if ((*(_DWORD *)(a1 + 12) & 0xC) == 8)
  {
    uint64_t result = 0LL;
    int v12 = (unsigned __int16)*(_DWORD *)(a1 + 12) | 0x10000;
    goto LABEL_35;
  }

  return 0LL;
}

uint64_t _pthread_mutex_firstfit_lock_wait(uint64_t a1)
{
  uint64_t v1 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  unint64_t v3 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  do
  {
    do
      uint64_t result = __psynch_mutexwait();
    while ((_DWORD)result == -1);
    unint64_t v5 = *v3;
LABEL_4:
    unint64_t v6 = v5;
    unsigned int v7 = v5 + 256;
    if ((v6 & 2) == 0) {
      unsigned int v7 = v6 | 2;
    }
    unint64_t v8 = v6 & 0xFFFFFFFF00000000LL | v7;
    do
    {
      unint64_t v5 = __ldaxr(v3);
      if (v5 != v6)
      {
        __clrex();
        goto LABEL_4;
      }
    }

    while (__stxr(v8, v3));
  }

  while ((v6 & 2) != 0);
  *uint64_t v1 = v2;
  return result;
}

uint64_t _pthread_mutex_droplock(uint64_t a1, unsigned int *a2, void *a3, unsigned int *a4, _DWORD *a5)
{
  int v5 = *(_DWORD *)(a1 + 12);
  unsigned int v6 = v5 & 0xFFFFEFFF;
  unsigned int v7 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v8 = *v7;
  unint64_t v9 = (unint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
  int v10 = v5 & 0xC;
  if ((v5 & 0x1C0) == 0x40)
  {
    if ((v5 & 0xC) == 0) {
      goto LABEL_6;
    }
    if (*v9 == *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8))
    {
      if (v10 != 8
        || (*(_DWORD *)(a1 + 12) = (unsigned __int16)v5 | ((unsigned __int16)(HIWORD(v5) - 1) << 16), HIWORD(v5) == 1))
      {
        while (1)
        {
LABEL_6:
          unint64_t v11 = HIDWORD(v8);
          unint64_t v12 = *v9;
          if (((HIDWORD(v8) ^ v8) & 0xFFFFFF00) != 0)
          {
            unint64_t v11 = (HIDWORD(v8) + 256);
            unsigned int v13 = v11 ^ v8;
            else {
              unint64_t v14 = -1LL;
            }
            BOOL v15 = v13 >= 0x100;
            BOOL v16 = v13 < 0x100;
            unsigned int v17 = v8 & 0xFFFFFFFC;
            if (v15) {
              unsigned int v17 = v8;
            }
            if (v15) {
              v6 |= 0x1000u;
            }
            if (v12 != v14)
            {
              while (1)
              {
                unint64_t v18 = __ldxr(v9);
                if (v18 != v12) {
                  break;
                }
                if (!__stxr(v14, v9)) {
                  goto LABEL_21;
                }
              }

LABEL_61:
              __clrex();
              _pthread_mutex_corruption_abort();
            }
          }

          else
          {
            BOOL v16 = 0;
            unsigned int v17 = v8;
          }

LABEL_57:
  uint64_t result = 0LL;
  if (a2) {
    *a2 = v6;
  }
  return result;
}

uint64_t _pthread_mutex_lock_init_slow(uint64_t a1, int a2)
{
  if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458 || (uint64_t result = _pthread_mutex_check_init_slow(a1), !(_DWORD)result))
  {
    int v5 = *(_DWORD *)(a1 + 12);
    if ((v5 & 0x1C0) == 0x40)
    {
      return _pthread_mutex_fairshare_lock_slow(a1, a2);
    }

    else if ((v5 & 0x4000) != 0)
    {
      return _pthread_mutex_ulock_lock(a1, a2);
    }

    else
    {
      return _pthread_mutex_firstfit_lock_slow(a1, a2);
    }
  }

  return result;
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_unlock_init_slow((uint64_t)a1);
  }
  int v1 = *(_DWORD *)&a1->__opaque[4];
  if ((v1 & 0x1C0) == 0x40) {
    return _pthread_mutex_fairshare_unlock((uint64_t)a1);
  }
  if ((v1 & 0x4000) != 0)
  {
    _pthread_mutex_ulock_unlock((uint64_t)a1);
    return 0;
  }

  else
  {
    uint64_t v2 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v3 = *v2;
    *(void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL) = 0LL;
    while (((HIDWORD(v3) ^ v3) & 0xFFFFFF00) == 0)
    {
      while (1)
      {
        unint64_t v4 = __ldxr(v2);
        if (v4 != v3) {
          break;
        }
        if (!__stlxr(v3 & 0xFFFFFFFFFFFFFFFDLL, v2))
        {
          char v5 = 1;
          goto LABEL_10;
        }
      }

      char v5 = 0;
      __clrex();
LABEL_10:
      unint64_t v3 = v4;
      if ((v5 & 1) != 0) {
        return 0;
      }
    }

    return _pthread_mutex_firstfit_unlock_slow((uint64_t)a1);
  }

uint64_t _pthread_mutex_unlock_init_slow(uint64_t a1)
{
  if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458 || (uint64_t result = _pthread_mutex_check_init_slow(a1), !(_DWORD)result))
  {
    int v3 = *(_DWORD *)(a1 + 12);
    if ((v3 & 0x1C0) == 0x40)
    {
      return _pthread_mutex_fairshare_unlock_slow(a1);
    }

    else if ((v3 & 0x4000) != 0)
    {
      _pthread_mutex_ulock_unlock(a1);
      return 0LL;
    }

    else
    {
      return _pthread_mutex_firstfit_unlock_slow(a1);
    }
  }

  return result;
}

uint64_t _pthread_mutex_fairshare_unlock(uint64_t a1)
{
  int v1 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v2 = *v1;
  unint64_t v3 = HIDWORD(*v1);
  *(void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL) = 0LL;
  while (1)
  {
    uint64_t v4 = (v3 + 256);
    uint64_t v5 = v2 & 0xFFFFFFFC;
    unint64_t v6 = v2 | ((unint64_t)v3 << 32);
    unint64_t v7 = v5 | (v4 << 32);
    while (1)
    {
      unint64_t v8 = __ldxr(v1);
      if (v8 != v6) {
        break;
      }
      if (!__stlxr(v7, v1))
      {
        char v9 = 1;
        goto LABEL_9;
      }
    }

    char v9 = 0;
    __clrex();
LABEL_9:
    unint64_t v3 = HIDWORD(v8);
    LODWORD(v2) = v8;
    if ((v9 & 1) != 0) {
      return 0LL;
    }
  }

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 0);
  }
  int v1 = *(_DWORD *)&a1->__opaque[4];
  if ((v1 & 0x1C0) == 0x40) {
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 0);
  }
  if ((v1 & 0x4000) != 0)
  {
    unsigned int v9 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
    int v10 = (unsigned int *)&a1->__opaque[16];
    while (1)
    {
      uint64_t v11 = __ldaxr(v10);
      if ((_DWORD)v11) {
        break;
      }
      if (!__stxr(v9, v10))
      {
        char v12 = 1;
        goto LABEL_23;
      }
    }

    char v12 = 0;
    __clrex();
LABEL_23:
    if ((v12 & 1) == 0) {
      _pthread_mutex_ulock_lock_slow((uint64_t)a1, v9, v11);
    }
    return 0;
  }

  else
  {
    unint64_t v2 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v3 = *v2;
    if ((*v2 & 2) == 0)
    {
      uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
      uint64_t v5 = v3;
      while ((v5 & 2) == 0)
      {
        unint64_t v6 = v3 & 0xFFFFFFFF00000000LL | v5;
        while (1)
        {
          unint64_t v3 = __ldaxr(v2);
          if (v3 != v6) {
            break;
          }
          if (!__stxr(v6 | 2, v2))
          {
            char v7 = 1;
            goto LABEL_12;
          }
        }

        char v7 = 0;
        __clrex();
LABEL_12:
        uint64_t v5 = v3;
        if ((v7 & 1) != 0)
        {
          *(void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL) = v4;
          return 0;
        }
      }
    }

    return _pthread_mutex_firstfit_lock_slow((uint64_t)a1, 0);
  }

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 1);
  }
  int v1 = *(_DWORD *)&a1->__opaque[4];
  if ((v1 & 0x1C0) == 0x40) {
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 1);
  }
  if ((v1 & 0x4000) != 0)
  {
    unsigned int v9 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
    int v10 = (unsigned int *)&a1->__opaque[16];
    while (!__ldaxr(v10))
    {
      if (!__stxr(v9, v10))
      {
        int v12 = 1;
        goto LABEL_20;
      }
    }

    int v12 = 0;
    __clrex();
LABEL_20:
    if (v12) {
      return 0;
    }
    else {
      return 16;
    }
  }

  else
  {
    unint64_t v2 = (void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    uint64_t v4 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL);
    unint64_t v5 = *v4;
    while ((v5 & 2) == 0)
    {
      while (1)
      {
        unint64_t v6 = __ldaxr(v4);
        if (v6 != v5) {
          break;
        }
        if (!__stxr(v5 | 2, v4))
        {
          int v7 = 1;
          goto LABEL_10;
        }
      }

      int v7 = 0;
      __clrex();
LABEL_10:
      unint64_t v5 = v6;
      if (v7)
      {
        int result = 0;
        *unint64_t v2 = v3;
        return result;
      }
    }

    __dmb(9u);
    return 16;
  }

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  opaque = (os_unfair_lock_s *)a1->__opaque;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&opaque->_os_unfair_lock_opaque))
  {
    if (!__stxr(v4, &opaque->_os_unfair_lock_opaque)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if ((a1->__sig & 0xFFFFFFFDLL) != 0x4D555458)
  {
    if ((a1->__sig & 0xFFFFFFF0LL) != 0x32AAABA0)
    {
      int v6 = 22;
      goto LABEL_14;
    }

    goto LABEL_12;
  }

  if ((a1->__opaque[5] & 0x40) != 0 && !*(_DWORD *)&a1->__opaque[16]
    || !(*(void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL) | (*(_DWORD *)(((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL)
                                                                                              + 4) ^ *(_DWORD *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8LL)) & 0xFFFFFF00))
  {
LABEL_12:
    int v6 = 0;
    a1->__unsigned int sig = 0LL;
    goto LABEL_14;
  }

  int v6 = 16;
LABEL_14:
  int v7 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v8 = __ldxr(&opaque->_os_unfair_lock_opaque);
    if (v8 != v7) {
      break;
    }
    if (!__stlxr(0, &opaque->_os_unfair_lock_opaque)) {
      return v6;
    }
  }

  __clrex();
  os_unfair_lock_unlock(opaque);
  return v6;
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  int result = 0;
  a1->__unsigned int sig = 0LL;
  return result;
}

uint64_t _pthread_mutex_check_init_slow(uint64_t a1)
{
  if ((*(void *)a1 & 0xFFFFFFF0LL) == 0x32AAABA0)
  {
    unint64_t v2 = (os_unfair_lock_s *)(a1 + 8);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v4 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(&v2->_os_unfair_lock_opaque))
    {
      if (!__stxr(v4, &v2->_os_unfair_lock_opaque)) {
        goto LABEL_10;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    if ((*(void *)a1 & 0xFFFFFFF0LL) == 0x32AAABA0)
    {
      int v7 = *(void *)a1 & 0xF;
      *(_DWORD *)(a1 + 12) = 0x2000;
      uint64_t v6 = 22LL;
      int v8 = 8196;
      switch(v7)
      {
        case 1:
          goto LABEL_18;
        case 2:
          int v8 = 8200;
LABEL_18:
          *(_WORD *)(a1 + 16) = 0;
          goto LABEL_20;
        case 3:
        case 7:
          *(_WORD *)(a1 + 16) = 0;
          if (v7 == 3)
          {
            *(_WORD *)(a1 + 18) = 0;
            int v9 = 8352;
LABEL_24:
            v9 |= __pthread_mutex_use_ulock << 14;
            unsigned int v10 = 1297437786;
            goto LABEL_26;
          }

          int v8 = 0x2000;
LABEL_20:
          unsigned int v10 = 1297437784;
          int v11 = (__pthread_mutex_default_opt_policy & 7) << 6;
          int v9 = v8 | v11 | 0x20;
          *(_WORD *)(a1 + 18) = 0;
          if ((v8 & 0xC) == 0 && (v11 == 128 || v11 == 64))
          {
            unsigned int v10 = 1297437786;
          }

uint64_t _pthread_mutex_fairshare_lock(uint64_t a1, int a2)
{
  unint64_t v2 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v3 = *v2;
  if ((*v2 & 2) == 0)
  {
    unsigned int v4 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    while (1)
    {
      unint64_t v6 = v3;
      if (a2 && (v3 & 2) != 0)
      {
        while (1)
        {
          unint64_t v3 = __ldaxr(v2);
          if (v3 != v6) {
            break;
          }
          if (!__stxr(v6, v2)) {
            return 16LL;
          }
        }
      }

      else
      {
        if ((v3 & 2) != 0) {
          return _pthread_mutex_fairshare_lock_slow(a1, a2);
        }
        unint64_t v7 = v3 & 0xFFFFFFFF00000000LL | ((v3 | 3) + 256);
        while (1)
        {
          unint64_t v3 = __ldaxr(v2);
          if (v3 != v6) {
            break;
          }
          if (!__stxr(v7, v2))
          {
            uint64_t result = 0LL;
            *unsigned int v4 = v5;
            return result;
          }
        }
      }

      __clrex();
    }
  }

  return _pthread_mutex_fairshare_lock_slow(a1, a2);
}

uint64_t _pthread_set_main_qos(uint64_t result)
{
  _main_qos = result;
  return result;
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  HIDWORD(v3) = __qos_class - 5;
  LODWORD(v3) = __qos_class - 5;
  unint64_t v4 = (0x600050403000201uLL >> (8 * (v3 >> 2))) & 7;
  else {
    int v5 = 0;
  }
  if (__attr->__sig != 1414022209) {
    return 22;
  }
  uint64_t v6 = *(void *)&__attr->__opaque[32];
  if ((v6 & 0x1000000) != 0) {
    return 22;
  }
  int v7 = 0;
  uint64_t v8 = (128 << v5) | (__relative_priority - 1);
  *(void *)&__attr->__opaque[24] = v8;
  *(void *)&__attr->__opaque[32] = v6 & 0xFFFFFFFFFCFFFFFFLL | 0x2000000;
  return v7;
}

int pthread_attr_get_qos_class_np(pthread_attr_t *__attr, qos_class_t *__qos_class, int *__relative_priority)
{
  if (__attr->__sig != 1414022209) {
    return 22;
  }
  if ((__attr->__opaque[35] & 2) != 0)
  {
    uint64_t v3 = *(void *)&__attr->__opaque[24];
    if (!__qos_class) {
      goto LABEL_14;
    }
LABEL_7:
    unsigned int v5 = 0;
    if ((v3 & 0x22000000) == 0 && (v3 & 0x3F00) != 0)
    {
      unsigned int v5 = (v3 >> 8) & 0x3F;
      if (v5)
      {
        unsigned int v6 = __clz(__rbit32(v5));
        if (v6 > 5)
        {
          qos_class_t v7 = QOS_CLASS_UNSPECIFIED;
          goto LABEL_13;
        }

        unsigned int v5 = v6 + 1;
      }
    }

    qos_class_t v7 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v5];
LABEL_13:
    *__qos_class = v7;
    goto LABEL_14;
  }

  LODWORD(v3) = 0;
  if (__qos_class) {
    goto LABEL_7;
  }
LABEL_14:
  int result = 0;
  if (__relative_priority)
  {
    BOOL v8 = (v3 & 0x3F00) != 0 && (v3 & 0x22000000) == 0;
    LODWORD(v3) = (char)v3;
    if (v8) {
      int v9 = v3 + 1;
    }
    else {
      int v9 = 0;
    }
    *__relative_priority = v9;
  }

  return result;
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  if ((__relative_priority - 1) >= 0xFFFFFFF0
    && (HIDWORD(v3) = __qos_class - 5, LODWORD(v3) = __qos_class - 5, unsigned int v2 = v3 >> 2, v2 <= 7)
    && ((0xBBu >> v2) & 1) != 0)
  {
    return _pthread_set_properties_self(1, (128 << dword_18019E170[v2]) | (__relative_priority + 255));
  }

  else
  {
    return 22;
  }

uint64_t _pthread_set_properties_self(int a1, int a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((_pthread_ptr_munge_token ^ *(void *)(StatusReg - 224)) != StatusReg - 224) {
    pthread_mach_thread_np_cold_1();
  }
  char v4 = a1;
  if ((a1 & 0x2D) != 0 && *(_BYTE *)(StatusReg - 60) && (a1 & 0xFFFFFFD2) == 0)
  {
    int v5 = 0;
    uint64_t v6 = 0LL;
    if ((v4 & 1) == 0) {
      return v6;
    }
    goto LABEL_10;
  }

  int v5 = __bsdthread_ctl();
  if ((v4 & 1) == 0) {
    goto LABEL_11;
  }
  if (!v5 || (uint64_t v6 = **(unsigned int **)(StatusReg + 8), (_DWORD)v6 == 2))
  {
LABEL_10:
    *(void *)(StatusReg + 32) = a2 & 0xFF403FFF;
LABEL_11:
    if (v5) {
      return **(unsigned int **)(StatusReg + 8);
    }
    else {
      return 0LL;
    }
  }

  return v6;
}

uint64_t pthread_set_qos_class_np(void *a1, qos_class_t __qos_class, int __relative_priority)
{
  if ((void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) != a1) {
    return 1LL;
  }
  if ((void *)(_pthread_ptr_munge_token ^ *a1) != a1) {
    pthread_mach_thread_np_cold_1();
  }
  return pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  uint64_t v3 = *(void *)&__pthread->__opaque[240];
  if (__qos_class)
  {
    if ((v3 & 0x22000000) != 0 || (*(void *)&__pthread->__opaque[240] & 0x3F00LL) == 0)
    {
      unsigned int v5 = 0;
    }

    else
    {
      unsigned int v5 = (v3 >> 8) & 0x3F;
      if (v5)
      {
        unsigned int v6 = __clz(__rbit32(v5));
        if (v6 > 5)
        {
          qos_class_t v7 = QOS_CLASS_UNSPECIFIED;
          goto LABEL_12;
        }

        unsigned int v5 = v6 + 1;
      }
    }

    qos_class_t v7 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v5];
LABEL_12:
    *__qos_class = v7;
  }

  if (__relative_priority)
  {
    BOOL v8 = (v3 & 0x3F00) != 0 && (v3 & 0x22000000) == 0;
    LODWORD(v3) = (char)v3;
    if (v8) {
      int v9 = v3 + 1;
    }
    else {
      int v9 = 0;
    }
    *__relative_priority = v9;
  }

  return 0;
}

qos_class_t qos_class_self(void)
{
  uint64_t v0 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32);
  if ((v0 & 0x22000000) != 0 || (v0 & 0x3F00) == 0)
  {
    unsigned int v2 = 0;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v2];
  }

  unsigned int v2 = (v0 >> 8) & 0x3F;
  if (!v2) {
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v2];
  }
  unsigned int v3 = __clz(__rbit32(v2));
  if (v3 <= 5)
  {
    unsigned int v2 = v3 + 1;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v2];
  }

  return 0;
}

qos_class_t qos_class_main(void)
{
  if ((_main_qos & 0x22000000) != 0 || (_main_qos & 0x3F00) == 0LL)
  {
    unsigned int v1 = 0;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v1];
  }

  unsigned int v1 = (_main_qos >> 8) & 0x3F;
  if (!v1) {
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v1];
  }
  unsigned int v2 = __clz(__rbit32(v1));
  if (v2 <= 5)
  {
    unsigned int v1 = v2 + 1;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v1];
  }

  return 0;
}

uint64_t _pthread_qos_class_encode(int a1, char a2, int a3)
{
  HIDWORD(v4) = a1 - 5;
  LODWORD(v4) = a1 - 5;
  unsigned int v3 = v4 >> 2;
  if (v3 < 8 && ((0xBBu >> v3) & 1) != 0) {
    return (128 << dword_18019E170[v3]) | (a2 - 1) | a3 & 0xFF000000;
  }
  else {
    return a3 & 0xFF000000;
  }
}

uint64_t _pthread_qos_class_decode(unsigned int a1, int *a2, void *a3)
{
  BOOL v3 = (a1 & 0x3F00) != 0 && (a1 & 0x22000000) == 0LL;
  if (v3)
  {
    unsigned int v4 = (a1 >> 8) & 0x3F;
    if (v4)
    {
      unsigned int v5 = __clz(__rbit32(v4));
      if (v5 > 5)
      {
        uint64_t v6 = 0LL;
        if (a2) {
          goto LABEL_10;
        }
        goto LABEL_14;
      }

      unsigned int v4 = v5 + 1;
    }
  }

  else
  {
    unsigned int v4 = 0;
  }

  uint64_t v6 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v4];
  if (a2)
  {
LABEL_10:
    if (v3) {
      int v7 = (char)a1 + 1;
    }
    else {
      int v7 = 0;
    }
    *a2 = v7;
  }

LABEL_14:
  if (a3) {
    *a3 = a1 & 0xFF000000;
  }
  return v6;
}

uint64_t _pthread_qos_class_and_override_encode(int a1, char a2, int a3, int a4)
{
  HIDWORD(v4) = a1 - 5;
  LODWORD(v4) = a1 - 5;
  unint64_t v5 = 0x600050403000201uLL >> (8 * (v4 >> 2));
  else {
    char v6 = v5;
  }
  HIDWORD(v8) = a4 - 5;
  LODWORD(v8) = a4 - 5;
  int v7 = v8 >> 2;
  int v9 = 0;
  char v10 = 6;
  switch(v7)
  {
    case 0:
      int v9 = 0;
      char v10 = 1;
      break;
    case 1:
      int v9 = 0;
      char v10 = 2;
      break;
    case 3:
    case 4:
    case 5:
      int v9 = 0;
      char v10 = v7;
      break;
    case 7:
      break;
    default:
      char v10 = 0;
      int v9 = 1;
      break;
  }

  unsigned int v11 = (v6 - 1);
  unsigned int v12 = (a2 - 1) | a3 & 0xFF000000 | (128 << v6);
  if (v11 > 5) {
    unsigned int v12 = a3 & 0xFF000000;
  }
  unsigned int v13 = (0x2000 << v10) | v12 | 0x800000;
  if (v9) {
    return v12;
  }
  else {
    return v13;
  }
}

uint64_t _pthread_qos_class_and_override_decode(unsigned int a1, int *a2, void *a3, _DWORD *a4)
{
  if (a4)
  {
    if ((a1 & 0x22800000) != 0x800000LL || (*(void *)&a1 & 0x3FC000LL) == 0)
    {
      unsigned int v5 = 0;
    }

    else
    {
      unsigned int v5 = (a1 >> 14);
      if ((a1 >> 14))
      {
        unsigned int v6 = __clz(__rbit32(v5));
        if (v6 > 5)
        {
          int v7 = 0;
          goto LABEL_12;
        }

        unsigned int v5 = v6 + 1;
      }
    }

    int v7 = _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v5];
LABEL_12:
    *a4 = v7;
  }

  if (a3) {
    *a3 = a1 & 0xFF000000;
  }
  if (a2)
  {
    uint64_t v8 = a1 & 0x3F00;
    if ((a1 & 0x3F00) != 0 && (a1 & 0x22000000) == 0LL) {
      int v10 = (char)a1 + 1;
    }
    else {
      int v10 = 0;
    }
    *a2 = v10;
  }

  else
  {
    uint64_t v8 = a1 & 0x3F00;
  }

  unsigned int v11 = 0;
  if ((a1 & 0x22000000) != 0 || !v8) {
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v11];
  }
  unsigned int v12 = (a1 >> 8) & 0x3F;
  if (!v12)
  {
    unsigned int v11 = 0;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v11];
  }

  unsigned int v13 = __clz(__rbit32(v12));
  if (v13 <= 5)
  {
    unsigned int v11 = v13 + 1;
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[v11];
  }

  return 0LL;
}

uint64_t _pthread_sched_pri_encode(int a1, int a2)
{
  return a2 & 0xFF000000 | a1 | 0x20000000;
}

uint64_t _pthread_sched_pri_decode(uint64_t result, void *a2)
{
  if (a2) {
    *a2 = result & 0xDF000000;
  }
  if ((result & 0x20000000) != 0) {
    return (unsigned __int16)result;
  }
  else {
    return 0LL;
  }
}

uint64_t _pthread_qos_class_encode_workqueue(int a1, int a2)
{
  char v2 = 6;
  switch(a1)
  {
    case 0:
      return (128 << v2) | a2 & 0xFF000000 | 0xFF;
    case 1:
      char v2 = 4;
      break;
    case 2:
      goto LABEL_4;
    case 3:
      char v2 = 2;
      break;
    default:
      if (a1 != 128) {
        _pthread_qos_class_encode_workqueue_cold_1(a1);
      }
LABEL_4:
      char v2 = 3;
      break;
  }

  return (128 << v2) | a2 & 0xFF000000 | 0xFF;
}

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_properties_self(4, 0);
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_properties_self(8, 0);
}

uint64_t pthread_prefer_alternate_cluster_self()
{
  return _pthread_set_properties_self(32, 0);
}

pthread_override_t pthread_override_qos_class_start_np( pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  HIDWORD(v4) = __qos_class - 5;
  LODWORD(v4) = __qos_class - 5;
  unsigned int v3 = v4 >> 2;
  if (v3 > 7 || ((0xBBu >> v3) & 1) == 0) {
    return 0LL;
  }
  int v7 = dword_18019E170[v3];
  uint64_t v8 = (vm_map_t *)MEMORY[0x1895FFD48];
  if (_pthread_malloc && (mach_vm_address_t v9 = _pthread_malloc(32LL), (address = v9) != 0))
  {
    mach_vm_address_t v10 = v9;
    int v11 = 1;
  }

  else
  {
    mach_vm_address_t address = *MEMORY[0x189600148];
    if (mach_vm_allocate(*v8, &address, (address + 31) & -(uint64_t)address, 1241513985))
    {
      mach_vm_address_t v10 = 0LL;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return (pthread_override_t)v10;
    }

    int v11 = 0;
    mach_vm_address_t v10 = address;
  }

  *(_DWORD *)mach_vm_address_t v10 = 1870030194;
  *(void *)(v10 + 8) = __pthread;
  mach_port_t v12 = pthread_mach_thread_np(__pthread);
  *(_DWORD *)(v10 + 4) = v12;
  *(void *)(v10 + 16) = (128 << v7) | (__relative_priority + 255);
  *(_BYTE *)(v10 + 24) = v11;
  if (mach_port_mod_refs(*v8, v12, 0, 1))
  {
    if (v11) {
      goto LABEL_9;
    }
LABEL_15:
    mach_vm_deallocate(*v8, address, (*MEMORY[0x189600148] + 31LL) & -*MEMORY[0x189600148]);
    return 0LL;
  }

  if (__bsdthread_ctl())
  {
    mach_port_mod_refs(*v8, *(_DWORD *)(v10 + 4), 0, -1);
    if (v11)
    {
LABEL_9:
      if (_pthread_free) {
        _pthread_free(v10);
      }
      return 0LL;
    }

    goto LABEL_15;
  }

  return (pthread_override_t)v10;
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  int result = _pthread_atomic_xchg_uint32_relaxed((unsigned int *)__override, 0x7265766Fu);
  if (result == 1870030194)
  {
    int v3 = __bsdthread_ctl();
    if (v3 == -1) {
      int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    if (v3 == 14) {
      int v4 = 0;
    }
    else {
      int v4 = v3;
    }
    unsigned int v5 = (vm_map_t *)MEMORY[0x1895FFD48];
    if (mach_port_mod_refs(*MEMORY[0x1895FFD48], *((_DWORD *)__override + 1), 0, -1)) {
      int v4 = 22;
    }
    if (*((_BYTE *)__override + 24))
    {
      if (_pthread_free) {
        _pthread_free(__override);
      }
    }

    else if (mach_vm_deallocate( *v5,  (mach_vm_address_t)__override,  (*MEMORY[0x189600148] + 31LL) & -*MEMORY[0x189600148]))
    {
      return 22;
    }

    return v4;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t _pthread_qos_override_start_direct()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_qos_override_end_direct()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_override_qos_class_start_direct()
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(StatusReg + 8);
  }
  return result;
}

uint64_t _pthread_override_qos_class_end_direct()
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(StatusReg + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_override_start_direct()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_override_start_direct_check_owner(int a1, uint64_t a2, _DWORD *a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    uint64_t result = __bsdthread_ctl();
    if ((_DWORD)result == -1) {
      uint64_t result = **(unsigned int **)(StatusReg + 8);
    }
    if (!a3 || (_DWORD)result != 14) {
      break;
    }
    if ((*a3 | 3) != a1) {
      return 70LL;
    }
  }

  return result;
}

uint64_t _pthread_workqueue_override_reset()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_asynchronous_override_add()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_self()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_all_self()
{
  uint64_t result = __bsdthread_ctl();
  if ((_DWORD)result == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return result;
}

uint64_t pthread_qos_max_parallelism(int a1, unint64_t a2)
{
  int v2 = a1 - 5;
  if (!a1) {
    int v2 = 16;
  }
  HIDWORD(v4) = v2;
  LODWORD(v4) = v2;
  unsigned int v3 = v4 >> 2;
  if (v3 < 8 && ((0xBBu >> v3) & 1) != 0 && a2 < 4)
  {
    uint64_t v6 = qword_18019E190[v3];
    if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL)
    {
      uint64_t v7 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
    }

    else
    {
      char v14 = a2;
      uint64_t v15 = v6;
      uint64_t v7 = _os_alloc_once();
      uint64_t v6 = v15;
      LOBYTE(a2) = v14;
    }

    uint64_t v8 = v7 + 2 * v6;
    mach_vm_address_t v9 = (_WORD *)(v8 + 272);
    uint64_t v10 = 4LL;
    if ((a2 & 2) != 0) {
      mach_vm_address_t v9 = (_WORD *)(v8 + 300);
    }
    else {
      uint64_t v10 = 1LL;
    }
    int v11 = (_WORD *)(v8 + 286);
    if ((a2 & 1) != 0) {
      unint64_t v12 = 0LL;
    }
    else {
      unint64_t v12 = v10;
    }
    if ((a2 & 1) != 0) {
      unsigned int v13 = v11;
    }
    else {
      unsigned int v13 = v9;
    }
    uint64_t result = (unsigned __int16)*v13;
    if ((_DWORD)result == 0xFFFF)
    {
      LODWORD(result) = __bsdthread_ctl();
      if ((_DWORD)result != -1)
      {
        uint64_t result = (unsigned __int16)result;
LABEL_22:
        *unsigned int v13 = result;
        return result;
      }

      uint64_t result = **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      if ((_DWORD)result != 22 && (_DWORD)result != 45) {
        pthread_qos_max_parallelism_cold_1(result);
      }
      if ((v12 & 1) != 0)
      {
        uint64_t result = MEMORY[0xFFFFFC036];
        goto LABEL_22;
      }

      if (v12 < 4)
      {
        uint64_t result = MEMORY[0xFFFFFC035];
        goto LABEL_22;
      }

      if ((_DWORD)result == 45)
      {
        uint64_t result = 0LL;
        goto LABEL_22;
      }

      __break(1u);
    }
  }

  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t pthread_time_constraint_max_parallelism(char a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) != -1LL)
  {
    uint64_t v2 = _os_alloc_once();
    if ((a1 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    unsigned int v3 = (_WORD *)(v2 + 286);
    char v4 = 2;
    goto LABEL_8;
  }

  uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  if ((a1 & 1) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((a1 & 2) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return 0xFFFFFFFFLL;
  }

  unsigned int v3 = (_WORD *)(v2 + 272);
  char v4 = 3;
LABEL_8:
  uint64_t result = (unsigned __int16)*v3;
  if ((_DWORD)result == 0xFFFF)
  {
    LODWORD(result) = __bsdthread_ctl();
    if ((_DWORD)result == -1)
    {
      int v6 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      if (v6 != 22 && v6 != 45) {
        pthread_qos_max_parallelism_cold_1(v6);
      }
      if ((v4 & 1) != 0) {
        uint64_t result = MEMORY[0xFFFFFC036];
      }
      else {
        uint64_t result = MEMORY[0xFFFFFC035];
      }
    }

    else
    {
      uint64_t result = (unsigned __int16)result;
    }

    *unsigned int v3 = result;
  }

  return result;
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  if (__qos_class == 5 || __qos_class == QOS_CLASS_UTILITY || __qos_class == QOS_CLASS_BACKGROUND) {
    return posix_spawnattr_set_qos_clamp_np();
  }
  else {
    return 22;
  }
}

int posix_spawnattr_get_qos_class_np(const posix_spawnattr_t *__attr, qos_class_t *__qos_class)
{
  if (!__qos_class) {
    return 22;
  }
  int result = posix_spawnattr_get_qos_clamp_np();
  if (!result)
  {
    else {
      qos_class_t v4 = dword_18019E1D0[v5 - 1];
    }
    int result = 0;
    *__qos_class = v4;
  }

  return result;
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
  *(_DWORD *)a1->__opaque = 0;
  return 0;
}

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *a1, int *a2)
{
  if (a1->__sig != 1381452865) {
    return 22;
  }
  int result = 0;
  *a2 = *(_DWORD *)a1->__opaque;
  return result;
}

int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *a1, int a2)
{
  int result = 22;
  if ((a2 - 1) <= 1 && a1->__sig == 1381452865)
  {
    int result = 0;
    *(_DWORD *)a1->__opaque = a2;
  }

  return result;
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  opaque = (os_unfair_lock_s *)a1->__opaque;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v4 = *(_DWORD *)(StatusReg + 24);
  while (!__ldaxr(&opaque->_os_unfair_lock_opaque))
  {
    if (!__stxr(v4, &opaque->_os_unfair_lock_opaque)) {
      goto LABEL_6;
    }
  }

  __clrex();
  os_unfair_lock_lock_with_options();
LABEL_6:
  if (a1->__sig != 766030772)
  {
    if (a1->__sig != 1381452875)
    {
      int v8 = 22;
      goto LABEL_14;
    }

    int v6 = (unsigned __int128 *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
    do
      unsigned __int128 v7 = __ldxp(v6);
    while (__stxp(v7, v6));
    if ((v7 & 0xFFFFFF00) != DWORD2(v7))
    {
      int v8 = 16;
      goto LABEL_14;
    }
  }

  int v8 = 0;
  a1->__unsigned int sig = 0LL;
LABEL_14:
  int v9 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    unsigned int v10 = __ldxr(&opaque->_os_unfair_lock_opaque);
    if (v10 != v9) {
      break;
    }
    if (!__stlxr(0, &opaque->_os_unfair_lock_opaque)) {
      return v8;
    }
  }

  __clrex();
  os_unfair_lock_unlock(opaque);
  return v8;
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  if (a2 && a2->__sig != 1381452865) {
    return 22;
  }
  if (a1->__sig != 1381452875) {
    goto LABEL_7;
  }
  uint64_t v2 = (unsigned __int128 *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  do
    unsigned __int128 v3 = __ldxp(v2);
  while (__stxp(v3, v2));
  if ((v3 & 0xFFFFFF00) != DWORD2(v3)) {
    return 16;
  }
LABEL_7:
  *(_DWORD *)a1->__opaque = 0;
  unsigned int v4 = (pthread_rwlock_t *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL);
  uint64_t v5 = &a1->__opaque[24];
  int v6 = (char *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  if (&a1->__opaque[16] != (char *)v4)
  {
    *(_DWORD *)&a1->__opaque[4] |= 0x20000000u;
    *(void *)&a1->__opaque[16] = -1LL;
  }

  if (v5 != v6)
  {
    *(void *)uint64_t v5 = -1LL;
    *(void *)&a1->__opaque[32] = -1LL;
  }

  *(void *)&a1->__opaque[40] = -1LL;
  *(void *)&a1->__opaque[48] = -1LL;
  v4->__unsigned int sig = 0LL;
  *(void *)int v6 = 0x1000000C0LL;
  *(_DWORD *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 8) = 0;
  if (a2 && *(_DWORD *)a2->__opaque == 1)
  {
    int v7 = 16;
    unsigned int v8 = 0x40000000;
  }

  else
  {
    int v7 = 32;
    unsigned int v8 = 0x80000000;
  }

  int v9 = 0;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0x3FFFFFFF | v8;
  *(_DWORD *)&a1->__opaque[8] = v7;
  *(void *)&a1->__opaque[56] = ~(unint64_t)a1;
  *(_DWORD *)&a1->__opaque[188] = 1381452875;
  *(_DWORD *)&a1->__opaque[12] = 1381452875;
  HIDWORD(a1->__sig) = 0;
  atomic_store(0x52574C4Bu, (unsigned int *)a1);
  return v9;
}

uint64_t _pthread_rwlock_lock_slow(void *a1, int a2, int a3)
{
  if (*a1 == 1381452875LL || (uint64_t result = _pthread_rwlock_check_init_slow((uint64_t)a1), !(_DWORD)result))
  {
    int v7 = (unsigned __int128 *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0LL);
    do
    {
      unsigned __int128 v9 = __ldxp(v7);
      uint64_t v8 = *((void *)&v9 + 1);
    }

    while (__stxp(v9, v7));
    LODWORD(v10) = v9;
    uint64_t v11 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
    uint64_t v32 = v11;
    uint64_t v33 = (void *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
    uint64_t v34 = (uint64_t)a1;
    uint64_t v12 = HIDWORD(*((void *)&v9 + 1));
    unint64_t v13 = DWORD1(v9);
    char v35 = a3;
    int v14 = a3 ^ 1;
    do
    {
      unsigned int v15 = (v10 >> 6) & 1;
      if (a2) {
        unsigned int v16 = (v10 & 5) == 0;
      }
      else {
        unsigned int v16 = (v10 >> 6) & 1;
      }
      if ((v14 | v16) != 1)
      {
        unint64_t v18 = v13;
        unsigned int v19 = v10;
        uint64_t v21 = v12;
        uint64_t v20 = v8;
LABEL_26:
        unsigned int v15 = 0;
        unint64_t v24 = v19 | (v18 << 32);
        uint64_t v12 = v21;
        uint64_t v8 = v20;
        goto LABEL_36;
      }

      int v17 = 0;
      unint64_t v18 = v13;
      unsigned int v19 = v10;
      uint64_t v20 = v8;
      uint64_t v21 = v12;
      while ((v16 & 1) != 0)
      {
        if (!a2)
        {
          unint64_t v24 = v10 | (v13 << 32);
          unsigned int v30 = v10 & 0xFFFFFF00 | 0x83;
          LODWORD(v18) = v13;
          uint64_t v20 = v8;
LABEL_35:
          unsigned int v19 = v30 + 256;
          unint64_t v18 = (v18 + 256);
          uint64_t v8 = v20;
          goto LABEL_36;
        }

        if ((unint64_t)(v19 - (v20 & 0xFFFFFF00)) < 0xFFFFFF00)
        {
          unint64_t v24 = v19 | (v18 << 32);
          unsigned int v30 = v19 & 0xFFFFFFBF;
          unsigned int v15 = 1;
          uint64_t v12 = v21;
          goto LABEL_35;
        }

        if (v17 == 1024) {
          return 35LL;
        }
        ++v17;
        sched_yield();
        do
        {
          unsigned __int128 v22 = __ldxp(v7);
          uint64_t v20 = *((void *)&v22 + 1);
          unsigned int v19 = v22;
        }

        while (__stxp(v22, v7));
        uint64_t v21 = HIDWORD(*((void *)&v22 + 1));
        unint64_t v18 = DWORD1(v22);
        LOBYTE(v16) = (v22 & 5) == 0;
        if ((v22 & 5) != 0) {
          char v23 = v14;
        }
        else {
          char v23 = 1;
        }
        if ((v23 & 1) == 0) {
          goto LABEL_26;
        }
      }

      uint64_t v25 = v19;
      unint64_t v26 = v18;
      unsigned int v27 = v19 | 5;
      if (a2) {
        unsigned int v27 = v19 & 0xFFFFFFBF;
      }
      unsigned int v28 = v27 + 256;
      unsigned int v29 = v18 & 0xFE | v19 & 0xFFFFFF00;
      unsigned int v15 = 0;
      if ((v18 & 1) != 0) {
        unint64_t v18 = v29;
      }
      else {
        unint64_t v18 = v18;
      }
      uint64_t v12 = v21;
      unint64_t v24 = v25 | (v26 << 32);
      uint64_t v8 = v20;
      unsigned int v19 = v28;
LABEL_36:
      while (1)
      {
        unint64_t v10 = __ldaxr((unint64_t *)v7);
        if (v10 != v24) {
          break;
        }
        if (!__stxr(v19 | (v18 << 32), (unint64_t *)v7))
        {
          int v31 = 1;
          goto LABEL_40;
        }
      }

      int v31 = 0;
      __clrex();
LABEL_40:
      unint64_t v13 = HIDWORD(v10);
    }

    while (!v31);
    if (v15)
    {
      if ((a2 & 1) == 0)
      {
        uint64_t result = 0LL;
        void *v33 = v32;
        return result;
      }
    }

    else
    {
      if ((v35 & 1) != 0) {
        return 16LL;
      }
      _pthread_rwlock_lock_wait(v34, a2);
    }

    return 0LL;
  }

  return result;
}

uint64_t _pthread_rwlock_lock_wait(uint64_t a1, int a2)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    uint64_t result = a2 ? __psynch_rw_rdlock() : __psynch_rw_wrlock();
    if ((_DWORD)result != -1) {
      break;
    }
    int v6 = **(_DWORD **)(StatusReg + 8);
    if (v6 != 4)
    {
      if (v6)
      {
        qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwlock returned unknown error";
        qword_18C50BDC8 = v6;
        __break(1u);
        return result;
      }

      break;
    }
  }

  int v7 = (unint64_t *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v8 = *v7;
  do
  {
    unint64_t v9 = HIDWORD(v8);
    if (result & 0x40 | BYTE4(v8) & 2)
    {
      int v11 = result | v8;
      if (v8 & 4 | result & 1) {
        int v12 = 191;
      }
      else {
        int v12 = 190;
      }
      int v13 = v12 & v11;
      if ((((v11 & 6) == 0) & (HIDWORD(v8) >> 2)) != 0) {
        int v14 = v13 | 5;
      }
      else {
        int v14 = v13;
      }
      unsigned int v10 = v14 | v8 & 0xFFFFFF00;
      int v15 = (result & 0xFFFFFF00) + HIDWORD(v8);
      if ((result & 0x40) == 0) {
        v15 &= 0xFFFFFF00;
      }
      unint64_t v9 = v15 & 0xFFFFFFFB;
    }

    else
    {
      unsigned int v10 = v8;
    }

    unint64_t v16 = v10 | (v9 << 32);
    while (1)
    {
      unint64_t v17 = __ldxr(v7);
      if (v17 != v8) {
        break;
      }
      if (!__stxr(v16, v7))
      {
        int v18 = 1;
        goto LABEL_25;
      }
    }

    int v18 = 0;
    __clrex();
LABEL_25:
    unint64_t v8 = v17;
  }

  while (!v18);
  return result;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  if (a1->__sig == 1381452875)
  {
    unsigned int v1 = (unint64_t *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
    unint64_t v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((void *)&v4 + 1) = *(void *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 8);
      *(void *)&__int128 v4 = *v1;
      uint64_t v3 = v4 >> 32;
      unsigned int v5 = DWORD2(v4) & 0xFFFFFF00;
      while ((v2 & 5) == 0 && v2 - v5 <= 0xFFFFFEFF)
      {
        unint64_t v6 = v2 | (unint64_t)(v3 << 32);
        unint64_t v7 = (((v2 & 0xFFFFFFBF) + 256) | ((unint64_t)v3 << 32)) + 0x10000000000LL;
        while (1)
        {
          unint64_t v2 = __ldaxr(v1);
          if (v2 != v6) {
            break;
          }
          if (!__stxr(v7, v1))
          {
            char v8 = 1;
            goto LABEL_11;
          }
        }

        char v8 = 0;
        __clrex();
LABEL_11:
        uint64_t v3 = HIDWORD(v2);
        if ((v8 & 1) != 0) {
          return 0;
        }
      }
    }
  }

  return _pthread_rwlock_lock_slow(a1, 1, 0);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  if (a1->__sig == 1381452875)
  {
    unsigned int v1 = (unint64_t *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
    unint64_t v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((void *)&v4 + 1) = *(void *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 8);
      *(void *)&__int128 v4 = *v1;
      uint64_t v3 = v4 >> 32;
      unsigned int v5 = DWORD2(v4) & 0xFFFFFF00;
      while (1)
      {
        unint64_t v6 = v2 | ((unint64_t)v3 << 32);
        if ((v2 & 5) != 0)
        {
          while (1)
          {
            unint64_t v2 = __ldaxr(v1);
            if (v2 != v6) {
              break;
            }
            if (!__stxr(v6, v1)) {
              return 16;
            }
          }
        }

        else
        {
          unint64_t v7 = ((v3 << 32) + 0x10000000000LL) | ((v2 & 0xFFFFFFBF) + 256);
          while (1)
          {
            unint64_t v2 = __ldaxr(v1);
            if (v2 != v6) {
              break;
            }
            if (!__stxr(v7, v1)) {
              return 0;
            }
          }
        }

        __clrex();
        uint64_t v3 = HIDWORD(v2);
      }
    }
  }

  return _pthread_rwlock_lock_slow(a1, 1, 1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  if (a1->__sig == 1381452875)
  {
    unsigned int v1 = (unint64_t *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
    unint64_t v2 = *v1;
    if ((*v1 & 2) == 0)
    {
      *((void *)&v4 + 1) = *(void *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 8);
      *(void *)&__int128 v4 = *v1;
      uint64_t v3 = v4 >> 32;
      while ((v2 & 0x40) != 0)
      {
        unint64_t v5 = v2 | (unint64_t)(v3 << 32);
        unint64_t v6 = (((v2 & 0xFFFFFF00) + 387) | ((unint64_t)v3 << 32)) + 0x10000000000LL;
        while (1)
        {
          unint64_t v2 = __ldaxr(v1);
          if (v2 != v5) {
            break;
          }
          if (!__stxr(v6, v1))
          {
            char v7 = 1;
            goto LABEL_10;
          }
        }

        char v7 = 0;
        __clrex();
LABEL_10:
        uint64_t v3 = HIDWORD(v2);
        if ((v7 & 1) != 0)
        {
          *(void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL) = *(void *)(_ReadStatusReg( ARM64_SYSREG( 3,  3,  13,  0,  3))
                                                                                              - 8);
          return 0;
        }
      }
    }
  }

  return _pthread_rwlock_lock_slow(a1, 0, 0);
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(a1, 0, 1);
  }
  unsigned int v1 = (unint64_t *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v2 = *v1;
  if ((*v1 & 2) != 0) {
    return _pthread_rwlock_lock_slow(a1, 0, 1);
  }
  *((void *)&v4 + 1) = *(void *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 8);
  *(void *)&__int128 v4 = *v1;
  uint64_t v3 = v4 >> 32;
  do
  {
    unsigned int v5 = v2;
    uint64_t v6 = v3 << 32;
    unint64_t v7 = v5 | ((unint64_t)v3 << 32);
    LODWORD(v8) = (v5 & 0xFFFFFF00) + 387;
    if ((v5 & 0x40) != 0) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = v5;
    }
    uint64_t v9 = (v3 << 32) + 0x10000000000LL;
    if ((v5 & 0x40) != 0) {
      uint64_t v6 = v9;
    }
    unint64_t v10 = v6 | v8;
    while (1)
    {
      unint64_t v2 = __ldaxr(v1);
      if (v2 != v7) {
        break;
      }
      if (!__stxr(v10, v1))
      {
        int v11 = 1;
        goto LABEL_14;
      }
    }

    int v11 = 0;
    __clrex();
LABEL_14:
    uint64_t v3 = HIDWORD(v2);
  }

  while (!v11);
  if ((v5 & 0x40) == 0) {
    return 16;
  }
  int v12 = 0;
  return v12;
}

uint64_t _pthread_rwlock_unlock_slow(void *a1, int a2)
{
  if (*a1 == 1381452875LL || (uint64_t result = _pthread_rwlock_check_init_slow((uint64_t)a1), !(_DWORD)result))
  {
    unsigned int v5 = (unint64_t *)(((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0LL);
    LODWORD(v6) = *(_DWORD *)v5;
    if ((*(_DWORD *)v5 & 0x40) == 0)
    {
      unint64_t v7 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0LL) + 4);
      unsigned int v8 = *(_DWORD *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0LL) + 8);
      uint64_t v9 = *(unsigned int *)((((unint64_t)a1 + 47) & 0xFFFFFFFFFFFFFFF0LL) + 0xC);
      if ((v6 & 2) != 0) {
        *(void *)(((unint64_t)a1 + 31) & 0xFFFFFFFFFFFFFFF8LL) = 0LL;
      }
      int v10 = 3;
      do
      {
        uint64_t v11 = v9;
        v10 &= ~a2;
        LODWORD(v12) = v8 + 256;
        if ((v10 & 2) != 0) {
          uint64_t v12 = v12;
        }
        else {
          uint64_t v12 = v8;
        }
        if ((_DWORD)v12 == (v6 & 0xFFFFFF00))
        {
          int v13 = 0;
          unsigned int v14 = v12 | 0xC0;
          unint64_t v15 = v12 | 1;
        }

        else if ((v6 & 7) != 0)
        {
          unsigned int v14 = v6 & 0xFFFFFF00 | 1;
          LODWORD(v15) = v6 & 4 | v7 | 2;
          if ((_DWORD)v12 == (v7 & 0xFFFFFF00)) {
            unint64_t v15 = v15;
          }
          else {
            unint64_t v15 = v7;
          }
          if ((_DWORD)v12 == (v7 & 0xFFFFFF00))
          {
            int v13 = 1;
          }

          else
          {
            unsigned int v14 = v6;
            int v13 = 0;
          }
        }

        else
        {
          int v13 = 0;
          unint64_t v15 = v7;
          unsigned int v14 = v6;
        }

        uint64_t result = v6 | (v7 << 32);
        if (v10 == 1)
        {
          while (1)
          {
            unint64_t v6 = __ldxr(v5);
            if (v6 != result) {
              break;
            }
            if (!__stlxr(v14 | (v15 << 32), v5))
            {
              a2 = 1;
              goto LABEL_39;
            }
          }

          a2 = 0;
          __clrex();
        }

        else
        {
          if (v10 != 3)
          {
            __break(1u);
            return result;
          }

          unint64_t v16 = v8 | ((unint64_t)v9 << 32);
          do
          {
            while (1)
            {
              unsigned __int128 v17 = __ldxp((unsigned __int128 *)v5);
              unsigned int v8 = DWORD2(v17);
              unint64_t v6 = v17;
              int v18 = (void)v17 != result;
              if (*((void *)&v17 + 1) != v16) {
                ++v18;
              }
              if (!v18) {
                break;
              }
            }
          }

          while (__stlxp(__PAIR128__(v12 | (unint64_t)(v11 << 32), v14 | (v15 << 32)), (unsigned __int128 *)v5));
LABEL_29:
          BOOL v19 = *((void *)&v17 + 1) == v16 && (void)v17 == result;
          uint64_t v9 = HIDWORD(*((void *)&v17 + 1));
          if (v19) {
            a2 = 3;
          }
          else {
            a2 = 0;
          }
        }

LABEL_39:
        unint64_t v7 = HIDWORD(v6);
      }

      while (v10 != a2);
      if (v13) {
        _pthread_rwlock_unlock_drop();
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t _pthread_rwlock_unlock_drop()
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    uint64_t result = __psynch_rw_unlock();
    if ((_DWORD)result != -1) {
      break;
    }
    int v2 = **(_DWORD **)(StatusReg + 8);
    if (v2 != 4)
    {
      if (v2)
      {
        qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwunlock returned unknown error";
        qword_18C50BDC8 = v2;
        __break(1u);
      }

      return result;
    }
  }

  return result;
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_unlock_slow(a1, 0);
  }
  unsigned int v1 = (unsigned __int128 *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL);
  unsigned int v2 = *(_DWORD *)v1;
  if ((*(_DWORD *)v1 & 0x40) == 0)
  {
    unint64_t v4 = *(unsigned int *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 4);
    unsigned int v3 = *(_DWORD *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 8);
    uint64_t v5 = *(unsigned int *)(((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0LL) + 0xC);
    if ((v2 & 2) != 0) {
      *(void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8LL) = 0LL;
    }
    do
    {
      uint64_t v6 = v3 + 256;
      if ((_DWORD)v6 == (v2 & 0xFFFFFF00))
      {
        unsigned int v7 = v6 | 0xC0;
        unint64_t v8 = v6 | 1;
      }

      else
      {
        unint64_t v8 = v4;
        unsigned int v7 = v2;
        if ((v2 & 7) != 0)
        {
          unint64_t v8 = v4;
          unsigned int v7 = v2;
          if ((_DWORD)v6 == (v4 & 0xFFFFFF00)) {
            return _pthread_rwlock_unlock_slow(a1, 0);
          }
        }
      }

      unint64_t v9 = v2 | (v4 << 32);
      unint64_t v10 = v3 | ((unint64_t)v5 << 32);
      unint64_t v11 = v7 | (v8 << 32);
      unint64_t v12 = v6 | (v5 << 32);
      do
      {
        while (1)
        {
          unsigned __int128 v13 = __ldxp(v1);
          unsigned int v3 = DWORD2(v13);
          unsigned int v2 = v13;
          int v14 = (void)v13 != v9;
          if (*((void *)&v13 + 1) != v10) {
            ++v14;
          }
          if (!v14) {
            break;
          }
          if (!__stlxp(v13, v1)) {
            goto LABEL_14;
          }
        }
      }

      while (__stlxp(__PAIR128__(v12, v11), v1));
LABEL_14:
      BOOL v15 = *((void *)&v13 + 1) == v10 && (void)v13 == v9;
      uint64_t v5 = HIDWORD(*((void *)&v13 + 1));
      unint64_t v4 = DWORD1(v13);
    }

    while (!v15);
  }

  return 0;
}

uint64_t _pthread_rwlock_check_init_slow(uint64_t a1)
{
  if (*(void *)a1 == 766030772LL)
  {
    unsigned int v2 = (os_unfair_lock_s *)(a1 + 8);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v4 = *(_DWORD *)(StatusReg + 24);
    while (!__ldaxr(&v2->_os_unfair_lock_opaque))
    {
      if (!__stxr(v4, &v2->_os_unfair_lock_opaque)) {
        goto LABEL_10;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    if (*(void *)a1 == 766030772LL)
    {
      unsigned int v7 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8LL);
      unint64_t v8 = (void *)(a1 + 32);
      unint64_t v9 = (void *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0LL);
      if ((void *)(a1 + 24) != v7)
      {
        *(_DWORD *)(a1 + 12) |= 0x20000000u;
        *(void *)(a1 + 24) = -1LL;
      }

      if (v8 != v9)
      {
        *unint64_t v8 = -1LL;
        *(void *)(a1 + 40) = -1LL;
      }

      uint64_t v6 = 0LL;
      *(void *)(a1 + 48) = -1LL;
      *(void *)(a1 + 56) = -1LL;
      *unsigned int v7 = 0LL;
      *unint64_t v9 = 0x1000000C0LL;
      *(_DWORD *)(((a1 + 47) & 0xFFFFFFFFFFFFFFF0LL) + 8) = 0;
      *(_DWORD *)(a1 + 12) = *(_DWORD *)(a1 + 12) & 0x3FFFFFFF | 0x80000000;
      *(void *)(a1 + 64) = ~a1;
      *(_DWORD *)(a1 + 196) = 1381452875;
      *(void *)(a1 + 16) = 0x52574C4B00000020LL;
      *(_DWORD *)(a1 + 4) = 0;
      atomic_store(0x52574C4Bu, (unsigned int *)a1);
    }

    else if (*(void *)a1 == 1381452875LL)
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      uint64_t v6 = 22LL;
    }

    int v10 = *(_DWORD *)(StatusReg + 24);
    while (1)
    {
      unsigned int v11 = __ldxr(&v2->_os_unfair_lock_opaque);
      if (v11 != v10) {
        break;
      }
      if (!__stlxr(0, &v2->_os_unfair_lock_opaque)) {
        return v6;
      }
    }

    __clrex();
    os_unfair_lock_unlock(v2);
  }

  else if (*(void *)a1 == 1381452875LL)
  {
    return 0LL;
  }

  else
  {
    return 22LL;
  }

  return v6;
}

uint64_t _pthread_key_global_init()
{
  if (_simple_getenv()) {
    __pthread_key_legacy_behaviour = 1;
  }
  uint64_t result = _simple_getenv();
  if (result) {
    __pthread_key_legacy_behaviour_log = 1;
  }
  return result;
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  pthread_key_t v4 = 256LL;
  while (_pthread_keys[v4])
  {
    if (++v4 == 512)
    {
      int v5 = 35;
      goto LABEL_6;
    }
  }

  int v5 = 0;
  _pthread_keys[v4] = ~(unint64_t)a2;
  *a1 = v4;
LABEL_6:
  os_unfair_lock_unlock(&__pthread_tsd_lock);
  return v5;
}

int pthread_key_delete(pthread_key_t a1)
{
  if ((a1 & 0xFFFFFFFFFFFFFF00LL) == 0x100 && _pthread_keys[a1])
  {
    _pthread_keys[a1] = 0LL;
    os_unfair_lock_lock_with_options();
    unsigned int v2 = __pthread_head;
    if (__pthread_head)
    {
      do
      {
        v2[a1 + 28] = 0LL;
        unsigned int v2 = (void *)v2[2];
      }

      while (v2);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_pthread_list_lock);
    int v3 = 0;
  }

  else
  {
    int v3 = 22;
  }

  os_unfair_lock_unlock(&__pthread_tsd_lock);
  return v3;
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  if (a1 - 10 > 0x1F5) {
    return 22;
  }
  uint64_t v2 = _pthread_keys[a1];
  if (a1 >= 0x100 && !v2) {
    return 22;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(StatusReg + 8 * a1) = a2;
  if (a1 <= 0xFF && !v2) {
    _pthread_keys[a1] = -1LL;
  }
  int v3 = 0;
  return v3;
}

uint64_t _pthread_setspecific_static(unint64_t a1, uint64_t a2)
{
  if (a1 > 0xFF) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1) = a2;
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1);
}

int pthread_introspection_setspecific_np(pthread_t thread, pthread_key_t key, const void *value)
{
  if (*(_WORD *)&pthread_self()->__opaque[34] != 1) {
    pthread_introspection_setspecific_np_cold_1();
  }
  if (key - 10 > 0x1F5) {
    return 22;
  }
  uint64_t v6 = _pthread_keys[key];
  if (key >= 0x100 && !v6) {
    return 22;
  }
  *(void *)&thread->__opaque[8 * key + 208] = value;
  if (key <= 0xFF && !v6) {
    _pthread_keys[key] = -1LL;
  }
  int result = 0;
  return result;
}

void *__cdecl pthread_introspection_getspecific_np(pthread_t thread, pthread_key_t key)
{
  if (*(_WORD *)&pthread_self()->__opaque[34] != 4) {
    pthread_introspection_getspecific_np_cold_1();
  }
  return *(void **)&thread->__opaque[8 * key + 208];
}

uint64_t _pthread_tsd_cleanup(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = 0;
  uint64_t v3 = result + 2272;
  uint64_t v4 = result + 1224;
  if ((__pthread_key_legacy_behaviour & 1) != 0)
  {
    do
    {
      unsigned int v5 = *(unsigned __int16 *)(v1 + 76);
      if (v5 >= 0x100)
      {
        uint64_t v6 = 0LL;
        do
        {
          uint64_t v7 = _pthread_keys[v6 + 256];
          if (v7)
          {
            int result = *(void *)(v3 + 8 * v6);
            if (result)
            {
              *(void *)(v3 + 8 * v6) = 0LL;
              if (v7 != -1)
              {
                int result = ((uint64_t (*)(void))~v7)();
                LOWORD(v5) = *(_WORD *)(v1 + 76);
              }
            }
          }

          unint64_t v8 = v6 + 256;
          ++v6;
        }

        while (v8 < (unsigned __int16)v5);
      }

      for (uint64_t i = 0LL; i != 85; ++i)
      {
        uint64_t v10 = _pthread_keys[i + 125];
        if (v10)
        {
          int result = *(void *)(v4 + i * 8);
          if (result)
          {
            *(void *)(v4 + i * 8) = 0LL;
            if (v10 != -1) {
              int result = ((uint64_t (*)(void))~v10)();
            }
          }
        }
      }

      ++v2;
    }

    while (v2 != 4);
    int v11 = 0;
    *(_WORD *)(v1 + 76) = 0;
    uint64_t v12 = v1 + 304;
    do
    {
      unint64_t v13 = __pthread_tsd_max;
      if (__pthread_tsd_max >= 0xA)
      {
        uint64_t v14 = 0LL;
        do
        {
          uint64_t v15 = _pthread_keys[v14 + 10];
          if (v15)
          {
            int result = *(void *)(v12 + 8 * v14);
            if (result)
            {
              *(void *)(v12 + 8 * v14) = 0LL;
              if (v15 != -1)
              {
                int result = ((uint64_t (*)(void))~v15)();
                unint64_t v13 = __pthread_tsd_max;
              }
            }
          }

          unint64_t v16 = v14 + 10;
          ++v14;
        }

        while (v16 < v13);
      }

      if (__pthread_key_legacy_behaviour_log == 1 && *(_WORD *)(v1 + 76))
      {
        for (uint64_t j = 0LL; j != 256; ++j)
        {
          uint64_t v18 = _pthread_keys[j + 256];
          if (v18)
          {
            if (v18 != -1 && *(void *)(v1 + 2272 + j * 8) != 0LL) {
              int result = _simple_asl_log();
            }
          }
        }
      }

      ++v11;
    }

    while (v11 != 4);
  }

  else
  {
    uint64_t v20 = result + 304;
    do
    {
      unsigned int v21 = *(unsigned __int16 *)(v1 + 76);
      if (v21 >= 0x100)
      {
        uint64_t v22 = 0LL;
        do
        {
          uint64_t v23 = _pthread_keys[v22 + 256];
          if (v23)
          {
            int result = *(void *)(v3 + 8 * v22);
            if (result)
            {
              *(void *)(v3 + 8 * v22) = 0LL;
              if (v23 != -1)
              {
                int result = ((uint64_t (*)(void))~v23)();
                LOWORD(v21) = *(_WORD *)(v1 + 76);
              }
            }
          }

          unint64_t v24 = v22 + 256;
          ++v22;
        }

        while (v24 < (unsigned __int16)v21);
      }

      for (uint64_t k = 0LL; k != 85; ++k)
      {
        uint64_t v26 = _pthread_keys[k + 125];
        if (v26)
        {
          int result = *(void *)(v4 + k * 8);
          if (result)
          {
            *(void *)(v4 + k * 8) = 0LL;
            if (v26 != -1) {
              int result = ((uint64_t (*)(void))~v26)();
            }
          }
        }
      }

      unint64_t v27 = __pthread_tsd_max;
      if (__pthread_tsd_max >= 0xA)
      {
        uint64_t v28 = 0LL;
        do
        {
          uint64_t v29 = _pthread_keys[v28 + 10];
          if (v29)
          {
            int result = *(void *)(v20 + 8 * v28);
            if (result)
            {
              *(void *)(v20 + 8 * v28) = 0LL;
              if (v29 != -1)
              {
                int result = ((uint64_t (*)(void))~v29)();
                unint64_t v27 = __pthread_tsd_max;
              }
            }
          }

          unint64_t v30 = v28 + 10;
          ++v28;
        }

        while (v30 < v27);
      }

      ++v2;
    }

    while (v2 != 4);
    *(_WORD *)(v1 + 76) = 0;
  }

  return result;
}

uint64_t pthread_key_init_np(int a1, uint64_t a2)
{
  if (!_pthread_keys[a1]) {
    _pthread_keys[a1] = ~a2;
  }
  if (__pthread_tsd_max < a1) {
    __pthread_tsd_max = a1;
  }
  os_unfair_lock_unlock(&__pthread_tsd_lock);
  return 0LL;
}

pthread_t pthread_self(void)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v2 = *(void *)(StatusReg - 224);
  pthread_t result = (pthread_t)(StatusReg - 224);
  if ((pthread_t)(_pthread_ptr_munge_token ^ v2) != result) {
    pthread_self_cold_1();
  }
  return result;
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join((uint64_t)a1, (uint64_t *)a2, 2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return result;
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return result;
}

int sigwait(const sigset_t *a1, int *a2)
{
  int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  pthread_testcancel();
  if (v3 == 4) {
    return 0;
  }
  else {
    return v3;
  }
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v6 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v6 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  unint64_t v7 = *(void *)(v6 + 16);
  *(void *)(v6 + 16) = v7 + 1;
  if (v7 == 10)
  {
    mach_vm_address_t address = 0LL;
    unint64_t v8 = (void *)MEMORY[0x189600148];
    mach_vm_size_t v9 = 24 * (*MEMORY[0x189600148] / 0x18uLL);
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 12));
    uint64_t v10 = (vm_map_t *)MEMORY[0x1895FFD48];
    LODWORD(v8) = mach_vm_map(*MEMORY[0x1895FFD48], &address, v9, *v8 - 1LL, 1224736769, 0, 0LL, 0, 3, 7, 1u);
    os_unfair_lock_lock_with_options();
    if (!(_DWORD)v8)
    {
      if (*(void *)(v6 + 264) == v6 + 24)
      {
        *(void *)(v6 + 264) = address;
        _platform_memmove();
        _platform_bzero();
      }

      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 12));
        mach_vm_deallocate(*v10, address, v9);
        os_unfair_lock_lock_with_options();
      }

      goto LABEL_12;
    }
  }

  else
  {
    if (!v7)
    {
      *(void *)(v6 + 264) = v6 + 24;
LABEL_12:
      int v11 = 0;
      uint64_t v12 = (void (**)(void))(*(void *)(v6 + 264) + 24 * v7);
      *uint64_t v12 = a1;
      v12[1] = a2;
      v12[2] = a3;
      goto LABEL_13;
    }

    if (v7 < *MEMORY[0x189600148] / 0x18uLL) {
      goto LABEL_12;
    }
  }

  int v11 = 12;
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 12));
  return v11;
}

uint64_t _pthread_atfork_prepare_handlers()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  uint64_t result = os_unfair_lock_lock_with_options();
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2)
  {
    uint64_t v3 = 24 * v2 - 24;
    do
    {
      uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 264) + v3);
      if (v4) {
        uint64_t result = v4(result);
      }
      v3 -= 24LL;
      --v2;
    }

    while (v2);
  }

  return result;
}

uint64_t _pthread_atfork_prepare()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v0 = *(void **)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v0 = (void *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  *uint64_t v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return os_unfair_lock_lock_with_options();
}

void _pthread_atfork_parent()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)v0 + 72LL));
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 8));
}

void _pthread_atfork_parent_handlers()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  unint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = 8LL;
    do
    {
      uint64_t v4 = *(void (**)(void))(*(void *)(v0 + 264) + v3);
      if (v4)
      {
        v4();
        unint64_t v1 = *(void *)(v0 + 16);
      }

      ++v2;
      v3 += 24LL;
    }

    while (v2 < v1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 12));
}

uint64_t _pthread_atfork_child()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  *(_DWORD *)(v0 + 8) = 0;
  __is_threaded = 0;
  _pthread_main_thread_postfork_init(*(void *)v0);
  return _pthread_bsdthread_init((uint64_t)v2);
}

void _pthread_atfork_child_handlers()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 256LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 264LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  unint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = 16LL;
    do
    {
      uint64_t v4 = *(void (**)(void))(*(void *)(v0 + 264) + v3);
      if (v4)
      {
        v4();
        unint64_t v1 = *(void *)(v0 + 16);
      }

      ++v2;
      v3 += 24LL;
    }

    while (v2 < v1);
  }

  *(_DWORD *)(v0 + 12) = 0;
}

uint64_t _pthread_fork_prepare()
{
  return _pthread_atfork_prepare();
}

void _pthread_fork_parent()
{
}

uint64_t pthread_dependency_init_np(void *a1, pthread_t a2)
{
  uint64_t result = pthread_mach_thread_np(a2);
  *a1 = result;
  a1[1] = 0LL;
  return result;
}

void _pthread_dependency_fulfill_slow(unsigned int a1@<W1>, int a2@<W8>)
{
  if (a1 == -1) {
    goto LABEL_6;
  }
  if (*(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    a2 = a1;
    qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fulfilled a dependency not owned by current thread";
    qword_18C50BDC8 = a1;
    __break(1u);
LABEL_6:
    qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fufilling pthread_dependency_t twice";
    __break(1u);
    goto LABEL_7;
  }

  a2 = -(int)__ulock_wake();
  if ((a2 | 2) != 2)
  {
LABEL_7:
    qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: __ulock_wake() failed";
    qword_18C50BDC8 = a2;
    __break(1u);
  }

void pthread_dependency_fulfill_np(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = a2;
  unint64_t v2 = (unsigned int *)(a1 + 4);
  do
    unsigned int v3 = __ldxr(v2);
  while (__stlxr(0xFFFFFFFF, v2));
  if (v3) {
    _pthread_dependency_fulfill_slow(v3, (int)v2);
  }
}

uint64_t pthread_dependency_wait_np(unsigned int *a1)
{
  unsigned int v3 = a1 + 1;
  unsigned int v2 = *a1;
  do
  {
    if (__ldxr(v3))
    {
      __clrex();
      goto LABEL_11;
    }
  }

  while (__stxr(v2, v3));
  do
  {
    unsigned int v5 = -(int)__ulock_wait();
    if (v5 > 0xE || ((1 << v5) & 0x4011) == 0)
    {
      if (v5 == 105) {
        pthread_dependency_wait_np_cold_3(a1);
      }
      pthread_dependency_wait_np_cold_1(v5);
    }
  }

  while (a1[1] == (unint64_t)*a1);
LABEL_11:
  unsigned int v7 = atomic_load(v3);
  if (v7 != -1) {
    pthread_dependency_wait_np_cold_2(v7);
  }
  return *((void *)a1 + 1);
}

unint64_t _pthread_atomic_xchg_ptr(unint64_t *a1, unint64_t a2)
{
  do
    unint64_t result = __ldaxr(a1);
  while (__stlxr(a2, a1));
  return result;
}

uint64_t _pthread_atomic_xchg_uint32_relaxed(unsigned int *a1, unsigned int a2)
{
  do
    uint64_t result = __ldxr(a1);
  while (__stxr(a2, a1));
  return result;
}

void start_wqthread(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
}

void thread_start( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = _pthread_start(a1, a2, a3, a4, a5, a6);
  thread_chkstk_darwin(v9, v10, v11, v12, v13, v14, v15, v16, a9);
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
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqwl setup";
  __break(1u);
}

void __pthread_invalid_keventfunction()
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqworkq setup";
  __break(1u);
}

void pthread_mach_thread_np_cold_1()
{
  uint64_t v0 = OUTLINED_FUNCTION_0();
  _pthread_create_cold_1(v0);
}

void _pthread_create_cold_1(uint64_t a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Stack size in attrs is too small";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void _pthread_create_cold_2()
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
  __break(1u);
}

void _pthread_create_cold_3(uint64_t a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unaligned stack addr in attrs";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_install_workgroup_functions_np_cold_1(uint64_t a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions already installed";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_create_with_workgroup_np_cold_1()
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions not yet installed";
  __break(1u);
}

void _pthread_joiner_wake_cold_1(int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: pthread_join() wake failure";
  qword_18C50BDC8 = -a1;
  __break(1u);
}

void __pthread_init_cold_1()
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: PTHREAD_SELF TSD not initialized";
  __break(1u);
}

void __pthread_init_cold_2()
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Token from the kernel is 0";
  qword_18C50BDC8 = 0LL;
  __break(1u);
}

void __pthread_init_cold_3(int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: host_info() failed";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void _pthread_bsdthread_init_cold_1(unsigned int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Missing required kernel support";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void _pthread_main_thread_postfork_init_cold_1()
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
  __break(1u);
}

void _pthread_wqthread_cold_1(int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: Missing priority";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void _pthread_workqueue_supported_cold_1()
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: libpthread has not been initialized";
  __break(1u);
}

void pthread_cond_broadcast_cold_1(unsigned int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_cond_broadcast_cold_2(unsigned int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_cond_broadcast_cold_3()
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
  __break(1u);
}

void _pthread_mutex_corruption_abort()
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_mutex corruption: mutex owner changed in the middle of lock/unlock";
  __break(1u);
}

void _pthread_qos_class_encode_workqueue_cold_1(int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid priority";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_qos_max_parallelism_cold_1(int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN LIBPTHREAD: qos_max_parallelism failed";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_introspection_setspecific_np_cold_1()
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_setspecific_np outside of a CREA"
                             "TE introspection hook";
  __break(1u);
}

void pthread_introspection_getspecific_np_cold_1()
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_getspecific_np outside of a DEST"
                             "ROY introspection hook";
  __break(1u);
}

void pthread_self_cold_1()
{
  int v0 = abort_with_reason();
  pthread_dependency_wait_np_cold_1(v0);
}

void pthread_dependency_wait_np_cold_1(int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: __ulock_wait() failed";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_dependency_wait_np_cold_2(unsigned int a1)
{
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Corrupted pthread_dependency_t";
  qword_18C50BDC8 = a1;
  __break(1u);
}

void pthread_dependency_wait_np_cold_3(unsigned int *a1)
{
  uint64_t v1 = *a1;
  qword_18C50BD98 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Waiting on orphaned dependency";
  qword_18C50BDC8 = v1;
  __break(1u);
  __bsdthread_create();
}

uint64_t __bsdthread_create(void)
{
  return MEMORY[0x1895FF690]();
}

uint64_t __bsdthread_ctl()
{
  return MEMORY[0x1895FF698]();
}

uint64_t __bsdthread_register()
{
  return MEMORY[0x1895FF6A0]();
}

uint64_t __bsdthread_terminate()
{
  return MEMORY[0x1895FF6A8]();
}

uint64_t __disable_threadsignal()
{
  return MEMORY[0x1895FF6C8]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1895FF718]();
}

uint64_t __kqueue_workloop_ctl()
{
  return MEMORY[0x1895FF730]();
}

uint64_t __proc_info()
{
  return MEMORY[0x1895FF778]();
}

uint64_t __psynch_cvbroad()
{
  return MEMORY[0x1895FF780]();
}

uint64_t __psynch_cvclrprepost()
{
  return MEMORY[0x1895FF788]();
}

uint64_t __psynch_cvsignal()
{
  return MEMORY[0x1895FF790]();
}

uint64_t __psynch_cvwait()
{
  return MEMORY[0x1895FF798]();
}

uint64_t __psynch_mutexdrop()
{
  return MEMORY[0x1895FF7A0]();
}

uint64_t __psynch_mutexwait()
{
  return MEMORY[0x1895FF7A8]();
}

uint64_t __psynch_rw_rdlock()
{
  return MEMORY[0x1895FF7B0]();
}

uint64_t __psynch_rw_unlock()
{
  return MEMORY[0x1895FF7B8]();
}

uint64_t __psynch_rw_wrlock()
{
  return MEMORY[0x1895FF7C0]();
}

uint64_t __pthread_canceled()
{
  return MEMORY[0x1895FF7C8]();
}

uint64_t __pthread_chdir()
{
  return MEMORY[0x1895FF7D0]();
}

uint64_t __pthread_fchdir()
{
  return MEMORY[0x1895FF7D8]();
}

uint64_t __pthread_kill()
{
  return MEMORY[0x1895FF7E0]();
}

uint64_t __pthread_markcancel()
{
  return MEMORY[0x1895FF7E8]();
}

uint64_t __pthread_sigmask()
{
  return MEMORY[0x1895FF7F0]();
}

uint64_t __semwait_signal_nocancel()
{
  return MEMORY[0x1895FF818]();
}

uint64_t __sigwait()
{
  return MEMORY[0x1895FF858]();
}

uint64_t __sysctl()
{
  return MEMORY[0x1895FF870]();
}

uint64_t __thread_selfid()
{
  return MEMORY[0x1895FF878]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1895FF888]();
}

uint64_t __ulock_wait2()
{
  return MEMORY[0x1895FF890]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1895FF898]();
}

uint64_t __workq_kernreturn()
{
  return MEMORY[0x1895FF8C0]();
}

uint64_t __workq_open()
{
  return MEMORY[0x1895FF8C8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x189600400]();
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

uint64_t _os_semaphore_create()
{
  return MEMORY[0x189600428]();
}

uint64_t _os_semaphore_dispose()
{
  return MEMORY[0x189600430]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x189600438]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x189600460]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x189600490]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x189600498]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1896004C0]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1896004E0]();
}

uint64_t _thread_set_tsd_base()
{
  return MEMORY[0x1895FF8E8]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1895FF8F8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1895FFB58](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FFC78]();
}

kern_return_t mach_port_construct( ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1895FFCB8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FFD10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1895FFD50]();
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FFD60](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FFD70](*(void *)&target, address, size);
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFD78]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

kern_return_t mach_vm_protect( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1895FFD88]( *(void *)&target_task,  address,  size,  *(void *)&set_maximum,  *(void *)&new_protection);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

uint64_t os_unfair_lock_lock_no_tsd()
{
  return MEMORY[0x189600560]();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_unlock_no_tsd()
{
  return MEMORY[0x189600580]();
}

uint64_t posix_spawnattr_get_qos_clamp_np()
{
  return MEMORY[0x1895FFED0]();
}

uint64_t posix_spawnattr_set_qos_clamp_np()
{
  return MEMORY[0x1895FFED8]();
}

BOOLean_t swtch_pri(int pri)
{
  return MEMORY[0x189600050](*(void *)&pri);
}

uint64_t thread_destruct_special_reply_port()
{
  return MEMORY[0x1896000B8]();
}

kern_return_t thread_info( thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1896000C8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy( thread_act_t thr_act, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, BOOLean_t set_limit)
{
  return MEMORY[0x1896000D0](*(void *)&thr_act, *(void *)&policy, base, *(void *)&baseCnt, *(void *)&set_limit);
}