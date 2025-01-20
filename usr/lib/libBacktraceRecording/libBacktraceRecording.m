uint64_t __introspection_dispatch_get_queues(int a1, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  int *v3;
  mach_vm_size_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  mach_vm_address_t v16;
  int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  size_t v28;
  int v29;
  size_t v30;
  int v31;
  size_t v32;
  char *v33;
  int v34;
  uint64_t v35;
  int v38;
  _DWORD *v39;
  mach_vm_address_t address;
  *a2 = 0LL;
  *a3 = 0LL;
  v3 = off_C090;
  if (!off_C090) {
    return 0LL;
  }
  v4 = 0LL;
  v5 = 0LL;
  v6 = a1 - 1;
  do
  {
    switch(v6)
    {
      case 0:
        goto LABEL_10;
      case 1:
        v7 = atomic_load((unsigned int *)v3 + 11);
        v8 = atomic_load((unsigned int *)v3 + 12);
        break;
      case 2:
        v9 = (unsigned int *)(v3 + 12);
        goto LABEL_9;
      case 3:
        v9 = (unsigned int *)(v3 + 11);
LABEL_9:
        v10 = atomic_load(v9);
        if (v10 > 0) {
          goto LABEL_10;
        }
        break;
      case 4:
        v13 = atomic_load((unsigned int *)v3 + 11);
        v14 = atomic_load((unsigned int *)v3 + 12);
        if (v13 + v14) {
          break;
        }
LABEL_10:
        v11 = strlen((const char *)v3 + 52) + 33;
        v12 = 8 - (v11 & 7);
        ++v5;
        if ((v11 & 7) == 0) {
          v12 = 0;
        }
        v4 += (v12 + v11);
        break;
      default:
        break;
    }

    v3 = *(int **)v3;
  }

  while (v3);
  if (v5)
  {
    address = 0LL;
    if (mach_vm_allocate(mach_task_self_, &address, v4, 1))
    {
      fwrite("libBacktraceRecording: can't allocate VM for dispatch queues list\n", 0x42uLL, 1uLL, __stderrp);
      return 0LL;
    }

    v16 = address;
    v17 = off_C090;
    if (off_C090)
    {
      do
      {
        switch(v6)
        {
          case 0:
            goto LABEL_32;
          case 1:
            v18 = atomic_load((unsigned int *)v17 + 11);
            v19 = atomic_load((unsigned int *)v17 + 12);
            break;
          case 2:
            v20 = (unsigned int *)(v17 + 12);
            goto LABEL_29;
          case 3:
            v20 = (unsigned int *)(v17 + 11);
LABEL_29:
            v21 = atomic_load(v20);
            if (v21 <= 0) {
              break;
            }
            goto LABEL_32;
          case 4:
            v22 = atomic_load((unsigned int *)v17 + 11);
            v23 = atomic_load((unsigned int *)v17 + 12);
            if (!(v22 + v23))
            {
LABEL_32:
              v24 = *((void *)v17 + 4);
              *(void *)(v16 + 8) = *((void *)v17 + 3);
              *(void *)(v16 + 16) = v24;
              LODWORD(v24) = atomic_load((unsigned int *)v17 + 11);
              if ((v24 & 0x80000000) != 0) {
                v25 = 0;
              }
              else {
                v25 = atomic_load((unsigned int *)v17 + 11);
              }
              *(_DWORD *)(v16 + 24) = v25;
              v26 = atomic_load((unsigned int *)v17 + 12);
              if ((v26 & 0x80000000) != 0) {
                v27 = 0;
              }
              else {
                v27 = atomic_load((unsigned int *)v17 + 12);
              }
              *(_DWORD *)(v16 + 28) = v27;
              v28 = strlen((const char *)v17 + 52);
              v29 = v28 + 33;
              v30 = 8 - (((_DWORD)v28 + 33) & 7u);
              v31 = (v28 + 33) & 7;
              v32 = v28 + 1;
              v39 = (_DWORD *)v16;
              v33 = (char *)(v16 + 32);
              if (v31) {
                v34 = 8 - ((v28 + 33) & 7);
              }
              else {
                v34 = 0;
              }
              v38 = v34;
              memcpy(v33, v17 + 13, v32);
              if (v31) {
                bzero(&v33[v32], v30);
              }
              v35 = (v38 + v29);
              *v39 = v35;
              v16 = (mach_vm_address_t)v39 + v35;
            }

            break;
          default:
            break;
        }

        v17 = *(int **)v17;
      }

      while (v17);
      v16 = address;
    }

    *a2 = v16;
    *a3 = v4;
  }

  return v5;
}

uint64_t __introspection_dispatch_queue_get_pending_items(uint64_t a1, mach_vm_address_t *a2, uint64_t *a3)
{
  *a2 = 0LL;
  *a3 = 0LL;
  uint64_t v5 = dispatch_queue_serialnum(a1);
  v6 = off_C0F8;
  if (!off_C0F8) {
    return 0LL;
  }
  uint64_t v7 = v5;
  uint64_t v8 = 0LL;
  do
  {
    if (*(void *)(*((void *)v6 + 15) + 32LL) == v5) {
      ++v8;
    }
    v6 = *(int **)v6;
  }

  while (v6);
  if (v8)
  {
    mach_vm_address_t address = 0LL;
    if (mach_vm_allocate(mach_task_self_, &address, (16 * v8) | 8, 1))
    {
      fwrite("libBacktraceRecording: can't allocate VM for work items list\n", 0x3DuLL, 1uLL, __stderrp);
      return 0LL;
    }

    mach_vm_address_t v10 = address;
    *(void *)mach_vm_address_t address = 0x1000000001LL;
    v11 = off_C0F8;
    if (off_C0F8)
    {
      v12 = (int **)(v10 + 8);
      do
      {
        if (*(void *)(*((void *)v11 + 15) + 32LL) == v7)
        {
          *v12 = v11;
          v12[1] = (int *)*((void *)v11 + 7);
          v12 += 2;
        }

        v11 = *(int **)v11;
      }

      while (v11);
    }

    *a2 = v10;
    *a3 = (16 * v8) | 8;
  }

  return v8;
}

void *__introspection_dispatch_queue_item_get_info( void *result, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  *a2 = 0LL;
  *a3 = 0LL;
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *((unsigned int *)result + 23);
    size_t v7 = strlen((const char *)(result[13] + 40LL)) + 1;
    size_t v8 = strlen((const char *)(v5[14] + 52LL)) + 1;
    size_t v9 = strlen((const char *)(v5[15] + 52LL)) + 1;
    mach_vm_size_t v10 = v7 + 8 * v6 + v8 + v9 + 56;
    mach_vm_address_t address = 0LL;
    if (mach_vm_allocate(mach_task_self_, &address, v10, 1))
    {
      return (void *)fwrite("libBacktraceRecording: can't allocate VM for item info\n", 0x37uLL, 1uLL, __stderrp);
    }

    else
    {
      mach_vm_address_t v11 = address;
      *(void *)mach_vm_address_t address = v5[16];
      *(void *)(v11 + 8) = v5[7];
      *(_DWORD *)(v11 + 44) = *((_DWORD *)v5 + 36);
      uint64_t v12 = v5[14];
      *(void *)(v11 + 16) = *(void *)(v5[13] + 24LL);
      *(void *)(v11 + 24) = *(void *)(v12 + 32);
      *(void *)(v11 + 32) = *(void *)(v5[15] + 32LL);
      *(_DWORD *)(v11 + 40) = *((_DWORD *)v5 + 23);
      *(_DWORD *)(v11 + 48) = *((_DWORD *)v5 + 34);
      *(_DWORD *)(v11 + 52) = *((_DWORD *)v5 + 35);
      ptrSized_stack_frames_for_uniqued_stack(backtrace_uniquing_table, v5[12], v11 + 56, *((unsigned int *)v5 + 23));
      memcpy((void *)(v11 + 56 + 8 * v6), (const void *)(v5[13] + 40LL), v7);
      v13 = (char *)(v11 + 56 + 8 * v6 + v7);
      memcpy(v13, (const void *)(v5[14] + 52LL), v8);
      result = memcpy(&v13[v8], (const void *)(v5[15] + 52LL), v9);
      *a2 = v11;
      *a3 = v10;
    }
  }

  return result;
}

void *__introspection_dispatch_thread_get_item_info( void *result, mach_vm_address_t *a2, mach_vm_size_t *a3)
{
  *a2 = 0LL;
  *a3 = 0LL;
  v3 = &qword_C028;
  while (1)
  {
    v3 = (uint64_t *)*v3;
    if (!v3) {
      break;
    }
    if ((void *)v3[3] == result)
    {
      result = (void *)v3[14];
      if (result) {
        return __introspection_dispatch_queue_item_get_info(result, a2, a3);
      }
      return result;
    }
  }

  return result;
}

uint64_t active_work_item()
{
  return *((void *)current_thread_info() + 14);
}

unsigned int *current_thread_info()
{
  result = (unsigned int *)pthread_getspecific(thread_info_key);
  if (!result) {
    return add_thread_info_to_list();
  }
  return result;
}

void *dispatch_queue_label()
{
  result = (void *)dispatch_queue_get_label_ptr();
  if (!result) {
    return &unk_66C2;
  }
  return result;
}

uint64_t dispatch_queue_serialnum(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(dispatch_queue_offsets + 12);
  if (v1 == 8) {
    return *(void *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  if (v1 == 4) {
    return *(unsigned int *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }
  return 0LL;
}

unsigned int *add_thread_info_to_list()
{
  kern_return_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  void *v7;
  const void *v8;
  FILE *v9;
  pid_t v10;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[6];
  _BYTE __src[24];
  uint64_t v15;
  _opaque_pthread_t *v16;
  char v17[64];
  uint64_t v18;
  uint64_t v19;
  entry_from_free_list = (unsigned int *)pthread_getspecific(thread_info_key);
  if (!entry_from_free_list)
  {
    int v1 = pthread_self();
    v16 = v1;
    v17[0] = 0;
    pthread_getname_np(v1, v17, 0x40uLL);
    thread_info_outCnt = 6;
    thread_inspect_t v2 = pthread_mach_thread_np(v1);
    v3 = thread_info(v2, 4u, thread_info_out, &thread_info_outCnt);
    v4 = *(void *)thread_info_out;
    if (v3) {
      v4 = 0LL;
    }
    v15 = v4;
    v18 = 0LL;
    v19 = 0LL;
    entry_from_free_list = get_entry_from_free_list((uint64_t)&thread_lists, __src, 1);
    uint64_t v5 = entry_from_free_list + 5;
    do
      uint64_t v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    if (debug_printing)
    {
      size_t v7 = pthread_getspecific(thread_info_key);
      if (v7)
      {
        size_t v8 = v7;
        size_t v9 = __stderrp;
        mach_vm_size_t v10 = getpid();
        fprintf( v9,  "pid %d add_thread_info_to_list() called for thread %p;  thread_info should be NULL but is %p\n",
          v10,
          v1,
          v8);
      }
    }

    pthread_setspecific(thread_info_key, entry_from_free_list);
    if (debug_trace_threads) {
      print_thread_summary((uint64_t)entry_from_free_list, "thread added to list: ", (const char *)&unk_66C2);
    }
  }

  return entry_from_free_list;
}

unsigned int *get_entry_from_free_list(uint64_t a1, void *__src, int a3)
{
  if (a3) {
    os_unfair_lock_lock_with_options(a1 + 24, 0x10000LL);
  }
  uint64_t v6 = *(unsigned int **)(a1 + 80);
  if (!v6)
  {
    mach_vm_address_t address = 0LL;
    unint64_t v7 = *(void *)(a1 + 8);
    vm_size_t v8 = (vm_page_size + (v7 << 7) - 1) & -(uint64_t)vm_page_size;
    if (mach_vm_allocate(mach_task_self_, &address, v8, 167772161)) {
      get_entry_from_free_list_cold_1();
    }
    vm_size_t v9 = v8 / v7;
    *(void *)(a1 + 16) += v8;
    mach_vm_address_t v10 = address;
    *(_DWORD *)(a1 + 96) += v8 / v7;
    if ((v8 / v7))
    {
      uint64_t v11 = *(void *)(a1 + 8);
      uint64_t v12 = *(void **)(a1 + 88);
      do
      {
        *(_DWORD *)(v10 + 16) = 0;
        *(void *)mach_vm_address_t v10 = 0LL;
        *(void *)(v10 + 8) = v12;
        *uint64_t v12 = v10;
        uint64_t v12 = (void *)v10;
        *(void *)(a1 + 88) = v10;
        v10 += v11;
        LODWORD(v9) = v9 - 1;
      }

      while ((_DWORD)v9);
    }

    uint64_t v6 = *(unsigned int **)(a1 + 80);
  }

  uint64_t v13 = *(void *)v6;
  v14 = (void *)*((void *)v6 + 1);
  if (*(void *)v6)
  {
    *(void *)(v13 + 8) = v14;
    v14 = (void *)*((void *)v6 + 1);
  }

  else
  {
    *(void *)(a1 + 88) = v14;
  }

  void *v14 = v13;
  --*(_DWORD *)(a1 + 96);
  memcpy(v6, __src, *(void *)(a1 + 8));
  v6[4] = 1;
  atomic_store(0, v6 + 5);
  v15 = *(unsigned int ***)(a1 + 40);
  *(void *)uint64_t v6 = 0LL;
  *((void *)v6 + 1) = v15;
  *v15 = v6;
  *(void *)(a1 + 40) = v6;
  ++*(_DWORD *)(a1 + 48);
  if (a3) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  return v6;
}

size_t __library_initializer()
{
  kern_return_t v7;
  void *dli_saddr;
  mach_vm_address_t v9;
  char *v10;
  int v11;
  Dl_info v12;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  int info[9];
  mach_vm_size_t size;
  mach_vm_address_t address;
  v0 = dlopen("/usr/lib/system/introspection/libdispatch.dylib", 16);
  if (v0)
  {
    int v1 = v0;
    thread_inspect_t v2 = dlsym(v0, "dispatch_introspection_versions");
    if (v2 && v2[1] > 1uLL)
    {
      gcd_hook_install_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_introspection_hooks_install");
      if (gcd_hook_install_ptr)
      {
        dispatch_get_current_queue_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_get_current_queue");
        dispatch_queue_get_label_ptr = (uint64_t (*)(void))dlsym(v1, "dispatch_queue_get_label");
        dispatch_queue_offsets = (uint64_t)dlsym(v1, "dispatch_queue_offsets");
        size = 0LL;
        mach_vm_address_t address = (mach_vm_address_t)dispatch_get_current_queue_ptr;
        infoCnt = 9;
        unint64_t v7 = mach_vm_region(mach_task_self_, &address, &size, 9, info, &infoCnt, &object_name);
        dli_saddr = 0LL;
        if (!v7)
        {
          vm_size_t v9 = address;
          mach_vm_address_t v10 = (char *)(address + size - 1);
          if ((unint64_t)v10 >= address)
          {
            do
            {
              if (dladdr(v10, &v12))
              {
                if (!v12.dli_sname) {
                  break;
                }
                uint64_t v11 = strcmp(v12.dli_sname, "_dispatch_queue_override_invoke_owning");
                dli_saddr = v12.dli_saddr;
                if (!v11) {
                  goto LABEL_18;
                }
                mach_vm_address_t v10 = (char *)v12.dli_saddr - 2;
              }

              else
              {
                --v10;
              }
            }

            while ((unint64_t)v10 >= v9);
          }

          dli_saddr = 0LL;
        }

LABEL_18:
        _dispatch_queue_override_invoke_owning_ptr = (uint64_t)dli_saddr;
        pthread_atfork((void (*)(void))fork_prepare_handler, fork_parent_process_handler, fork_child_process_handler);
        enable_hooks = 1;
        dispatch_introspection_hooks = (uint64_t (*)(void))gcd_queue_create_hook;
        off_C1A8 = (uint64_t (*)(void))gcd_queue_dispose_hook;
        off_C1B0 = (uint64_t (*)(void, void))gcd_queue_item_enqueue_hook;
        off_C1B8 = (uint64_t (*)(void, void))gcd_queue_item_dequeue_hook;
        off_C1C0 = (uint64_t (*)(void))gcd_queue_item_complete_hook;
        gcd_hook_install_ptr();
        previous_pthread_hook = (uint64_t (*)(void, void, void, void))pthread_introspection_hook_install((pthread_introspection_hook_t)pthread_introspection_hook);
        pthread_key_create((pthread_key_t *)&thread_info_key, (void (__cdecl *)(void *))thread_terminating);
        resetDyldInsertLibraries("libBacktraceRecording.dylib");
        backtrace_uniquing_table = (uint64_t)create_backtrace_uniquing_table(0x4000u, 4);
        return dlclose(v1);
      }

      fwrite( "dlsym did not find dispatch_introspection_hooks_install() in /usr/lib/system/introspection/libdispatch.dylib\n",  0x6DuLL,  1uLL,  __stderrp);
      v3 = __stderrp;
      v4 = "Process must be launched with DYLD_LIBRARY_PATH=/usr/lib/system/introspection to get libdispatch introspection\n";
      size_t v5 = 111LL;
    }

    else
    {
      v3 = __stderrp;
      v4 = "Need a more recent version of /usr/lib/system/introspection/libdispatch.dylib -- missing suppport for the que"
           "ue_item_complete hook function.\n";
      size_t v5 = 141LL;
    }

    fwrite(v4, v5, 1uLL, v3);
    return dlclose(v1);
  }

  return fwrite( "Process must be launched with DYLD_LIBRARY_PATH=/usr/lib/system/introspection to get libdispatch introspection\n",  0x6FuLL,  1uLL,  __stderrp);
}

uint64_t fork_prepare_handler()
{
  uint64_t result = os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000LL);
  enable_hooks = 0;
  return result;
}

void fork_parent_process_handler()
{
  enable_hooks = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
}

void fork_child_process_handler()
{
  enable_hooks = 0;
  dword_C020 = 0;
  dword_C088 = 0;
  dword_C0F0 = 0;
}

unsigned int *pthread_introspection_hook(unsigned int *result, unsigned int *a2, char *a3, uint64_t a4)
{
  uint64_t v7 = (uint64_t)result;
  if (previous_pthread_hook) {
    uint64_t result = (unsigned int *)previous_pthread_hook(result, a2, a3, a4);
  }
  if (enable_hooks == 1)
  {
    switch((_DWORD)v7)
    {
      case 4:
        uint64_t result = (unsigned int *)pthread_self();
        if (result == a2) {
          return (unsigned int *)pthread_getspecific(thread_info_key);
        }
        break;
      case 3:
        uint64_t result = (unsigned int *)pthread_getspecific(thread_info_key);
        if (result)
        {
          vm_size_t v8 = result;
          if (debug_trace_threads)
          {
            vm_size_t v9 = __stderrp;
            pid_t v10 = getpid();
            fprintf( v9,  "pid %d PTHREAD_INTROSPECTION_THREAD_TERMINATE event received for thread %p;  thread_info would normally be"
              " NULL but is %p  thread_id %llu\n",
              v10,
              a2,
              v8,
              *((void *)v8 + 3));
          }

          thread_terminating((uint64_t)v8);
          return (unsigned int *)pthread_setspecific(thread_info_key, 0LL);
        }

        break;
      case 2:
        return add_thread_info_to_list();
    }
  }

  return result;
}

void thread_terminating(uint64_t a1)
{
  int v2 = decrement_entry_refcount((uint64_t)&thread_lists, (uint64_t *)a1);
  if (debug_trace_threads)
  {
    if (v2)
    {
      strcpy(__str, "  removed from list");
      print_thread_summary(a1, "thread terminating ", __str);
    }

    else
    {
      unsigned int v3 = atomic_load((unsigned int *)(a1 + 20));
      snprintf(__str, 0x100uLL, "  NOT removed from list - refcount %d", v3);
      print_thread_summary(a1, "thread terminating ", __str);
      if (dword_C050 > thread_terminating_max_remaining)
      {
        thread_terminating_max_remaining = dword_C050;
        fprintf(__stderrp, "    %u threads completed but still referenced:\n", dword_C050);
        print_list(0LL, &qword_C040, (uint64_t)&__block_literal_global_58);
      }
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
}

unsigned int *gcd_queue_create_hook(unsigned int *result)
{
  uint64_t v1 = (uint64_t)result;
  if (enable_hooks == 1)
  {
    int v2 = *(char **)(v1 + 16);
    if (!v2) {
      return add_queue_info_to_list(*(void *)v1, *(void *)(v1 + 24), v2, 1);
    }
    uint64_t result = (unsigned int *)strcmp(*(const char **)(v1 + 16), "source");
    if ((_DWORD)result) {
      return add_queue_info_to_list(*(void *)v1, *(void *)(v1 + 24), v2, 1);
    }
  }

  return result;
}

void gcd_queue_dispose_hook(uint64_t a1)
{
  if (off_C1A8) {
    off_C1A8(a1);
  }
  if (enable_hooks == 1)
  {
    os_unfair_lock_lock_with_options(&dword_C088, 0x10000LL);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000LL;
    uint64_t v6 = __gcd_queue_dispose_hook_block_invoke;
    uint64_t v7 = &__block_descriptor_tmp;
    uint64_t v8 = a1;
    int v2 = &off_C090;
    while (1)
    {
      int v2 = (int **)*v2;
      if (!v2) {
        break;
      }
      if (((unsigned int (*)(void *, int **))v6)(v5, v2))
      {
        move_entry_to_completed_list((uint64_t)&queue_lists, (uint64_t *)v2);
        int v3 = decrement_entry_refcount((uint64_t)&queue_lists, (uint64_t *)v2);
        if (debug_trace_queues)
        {
          if (v3)
          {
            strcpy(__str, "  removed from list");
            print_queue_summary((uint64_t)v2, "queue disposed: ", __str);
          }

          else
          {
            unsigned int v4 = atomic_load((unsigned int *)v2 + 5);
            snprintf(__str, 0x100uLL, "  NOT removed from list - refcount %d", v4);
            print_queue_summary((uint64_t)v2, "queue disposed: ", __str);
            if (dword_C0B8 > gcd_queue_dispose_hook_max_remaining)
            {
              gcd_queue_dispose_hook_max_remaining = dword_C0B8;
              fprintf(__stderrp, "    %u queues completed but still referenced:\n", dword_C0B8);
              print_list(0LL, &qword_C0A8, (uint64_t)&__block_literal_global);
            }
          }
        }

        break;
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  }
}

void gcd_queue_item_enqueue_hook(const void *a1, uint64_t a2)
{
  if (off_C1B0) {
    off_C1B0(a1, a2);
  }
  if (enable_hooks == 1)
  {
    if (is_interesting_event((uint64_t)a1, a2))
    {
      os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000LL);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 0x40000000LL;
      v54 = __gcd_queue_item_enqueue_hook_block_invoke;
      v55 = &__block_descriptor_tmp_39;
      uint64_t v56 = a2;
      unsigned int v4 = &off_C0F8;
      do
      {
        unsigned int v4 = (int **)*v4;
        BOOL v5 = v4 != 0LL;
      }

      while (v4 && !((unsigned int (*)(void *, int **))v54)(v53, v4));
      BOOL v6 = v4 == 0LL;
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
    }

    else
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
    }

    if (v6)
    {
      uint64_t v7 = os_unfair_lock_lock_with_options(&dword_C088, 0x10000LL);
      uint64_t current_queue_ptr = dispatch_get_current_queue_ptr(v7);
      queue_info = (unsigned int *)*((void *)current_thread_info() + 13);
      if (!queue_info || *((void *)queue_info + 3) != current_queue_ptr) {
        queue_info = find_or_create_queue_info(current_queue_ptr, 0);
      }
      pid_t v10 = queue_info + 5;
      do
        unsigned int v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      uint64_t v12 = *(void *)(a2 + 16);
      uint64_t v13 = queue_info;
      if (v12 != current_queue_ptr) {
        uint64_t v13 = find_or_create_queue_info(v12, 0);
      }
      v14 = v13 + 5;
      do
        unsigned int v15 = __ldaxr(v14);
      while (__stlxr(v15 + 1, v14));
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
      __int128 v16 = *(_OWORD *)(a2 + 16);
      __int128 v39 = *(_OWORD *)a2;
      __int128 v40 = v16;
      __int128 v17 = *(_OWORD *)(a2 + 48);
      __int128 v41 = *(_OWORD *)(a2 + 32);
      __int128 v42 = v17;
      char v43 = 0;
      BOOL v18 = *((_BYTE *)queue_info + 40) && (*((_BYTE *)v13 + 40) || *((_BYTE *)v13 + 41))
         || *((_BYTE *)queue_info + 41) && *((_BYTE *)v13 + 40);
      BOOL v44 = v18;
      int v19 = backtrace(v58, 512);
      uint64_t v20 = v19 - 1LL;
      int v21 = v20 - 2;
      enter_ptrSized_stack_in_backtrace_uniquing_table(backtrace_uniquing_table, &v37, &v59, (v20 - 2));
      int v45 = v21;
      uint64_t v46 = v37;
      v47 = current_thread_info();
      v22 = v47 + 5;
      do
        unsigned int v23 = __ldaxr(v22);
      while (__stlxr(v23 + 1, v22));
      v48 = queue_info;
      v49 = v13;
      uint64_t v50 = 0LL;
      uint64_t v51 = 0LL;
      int v52 = 0;
      v24 = current_thread_info();
      uint64_t v25 = *((void *)v24 + 14);
      if (v25)
      {
        unsigned int v26 = 0;
        uint64_t v27 = *((void *)v24 + 14);
        do
        {
          ++v26;
          uint64_t v27 = *(void *)(v27 + 128);
        }

        while (v27);
        int v28 = debug_maxlevels;
        if (debug_maxlevels) {
          BOOL v29 = v26 > gcd_queue_item_enqueue_hook_max_levels;
        }
        else {
          BOOL v29 = 0;
        }
        if (v29)
        {
          gcd_queue_item_enqueue_hook_max_levels = v26;
          print_logical_backtrace((const char *)&unk_66C2);
          int v28 = debug_maxlevels;
        }

        if (v26 < 0x33 || v28)
        {
          uint64_t v50 = v25;
          v31 = (unsigned int *)(v25 + 20);
          do
            unsigned int v32 = __ldaxr(v31);
          while (__stlxr(v32 + 1, v31));
        }

        else
        {
          int v30 = 0;
          uint64_t v50 = 0LL;
          do
          {
            v30 += *(_DWORD *)(v25 + 136) + *(_DWORD *)(v25 + 140) + 1;
            uint64_t v25 = *(void *)(v25 + 128);
          }

          while (v25);
          HIDWORD(v51) = v30;
          if (debug_printing && (gcd_queue_item_enqueue_hook_printed & 1) == 0)
          {
            gcd_queue_item_enqueue_hook_printed = 1;
            fwrite( "PLEASE FILE A BUG REPORT AGAINST libBacktraceRecording / X WITH THE FOLLOWING BACKTRACE OUTPUT\n",  0x5FuLL,  1uLL,  __stderrp);
            snprintf( __str,  0x400uLL,  "Cutting long chain of %u unique enqueuings (non-repeating, non-looping), %u total elided\n",  v26,  v30);
            print_logical_backtrace(__str);
          }
        }
      }

      v33 = get_entry_from_free_list((uint64_t)&work_item_lists, __src, 1) + 5;
      do
        unsigned int v34 = __ldaxr(v33);
      while (__stlxr(v34 + 1, v33));
      v35 = v13 + 12;
      do
        unsigned int v36 = __ldaxr(v35);
      while (__stlxr(v36 + 1, v35));
      if (debug_printing)
      {
        if (dword_C108 > gcd_queue_item_enqueue_hook_max_enqueued)
        {
          gcd_queue_item_enqueue_hook_max_enqueued = dword_C108;
          locked_print_dispatch_info();
        }
      }
    }
  }

void gcd_queue_item_dequeue_hook(const void *a1, uint64_t *a2)
{
  if (off_C1B8) {
    off_C1B8(a1, a2);
  }
  if (enable_hooks == 1)
  {
    if (is_interesting_event((uint64_t)a1, (uint64_t)a2))
    {
      uint64_t v4 = *((void *)current_thread_info() + 14);
      if (v4)
      {
        uint64_t v5 = *(void *)(v4 + 32);
        uint64_t v6 = a2[1];
        BOOL v7 = v5 == v6;
        BOOL v8 = v5 != v6;
      }

      else
      {
        BOOL v7 = 0;
        BOOL v8 = 1;
      }
    }

    else
    {
      uint64_t v4 = 0LL;
      BOOL v7 = 0;
      BOOL v8 = 0;
    }

    if (v8)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 0x40000000LL;
      int v19 = __gcd_queue_item_dequeue_hook_block_invoke;
      uint64_t v20 = &__block_descriptor_tmp_46;
      int v21 = a2;
      os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000LL);
      vm_size_t v9 = &off_C0F8;
      while (1)
      {
        vm_size_t v9 = (int **)*v9;
        if (!v9) {
          break;
        }
        if ((((uint64_t (*)(void *, int **))v19)(v18, v9) & 1) != 0)
        {
          move_entry_to_completed_list((uint64_t)&work_item_lists, (uint64_t *)v9);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
          if (v4)
          {
            gcd_queue_item_complete_hook(*(const void **)(v4 + 32));
          }

          *((_DWORD *)v9 + 4) = 2;
          unsigned int v11 = (unsigned int *)(v9[15] + 12);
          do
            unsigned int v12 = __ldaxr(v11);
          while (__stlxr(v12 - 1, v11));
          uint64_t v13 = (unsigned int *)(v9[15] + 11);
          do
            unsigned int v14 = __ldaxr(v13);
          while (__stlxr(v14 + 1, v13));
          uint64_t current_queue_ptr = dispatch_get_current_queue_ptr(v10);
          queue_info = (unsigned int *)v9[15];
          if (*((void *)queue_info + 3) != current_queue_ptr) {
            queue_info = find_or_create_queue_info(current_queue_ptr, 1);
          }
          __int128 v17 = current_thread_info();
          *((void *)v17 + 13) = queue_info;
          *((void *)v17 + 14) = v9;
          collapse_enqueuing_recursion((uint64_t)v9);
          return;
        }
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      if (showEnqueueDequeue) {
        fprintf(__stderrp, "LOGICAL ERROR!! dequeued continuation %p that was not enqueued\n", (const void *)a2[1]);
      }
    }
  }

void gcd_queue_item_complete_hook(const void *a1)
{
  if (off_C1C0) {
    off_C1C0(a1);
  }
  if (enable_hooks == 1)
  {
    uint64_t v2 = *((void *)current_thread_info() + 14);
    if (v2)
    {
      if ((unint64_t)(*(void *)(v2 + 24) - 17LL) <= 1)
      {
        int v3 = (unsigned int *)(*(void *)(v2 + 120) + 44LL);
        do
          unsigned int v4 = __ldaxr(v3);
        while (__stlxr(v4 - 1, v3));
        uint64_t v5 = current_thread_info();
        *((void *)v5 + 13) = 0LL;
        *((void *)v5 + 14) = 0LL;
        *(_DWORD *)(v2 + 16) = 3;
        int v6 = atomic_load((unsigned int *)(v2 + 20));
        if (v6 >= 2)
        {
          if (*(_BYTE *)(v2 + 89)) {
            collapse_enqueuing_recursion(v2);
          }
        }

        os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000LL);
        decrement_work_item_refcount(v2);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      }
    }
  }

unsigned int *add_queue_info_to_list(uint64_t a1, uint64_t a2, char *__s1, int a4)
{
  v13[3] = a1;
  v13[4] = a2;
  atomic_store(0, &v15);
  atomic_store(0, &v16);
  if (*(unsigned __int16 *)dispatch_queue_offsets <= 4u)
  {
    if (is_root_dispatch_queue_prefix_length) {
      size_t v6 = 22LL;
    }
    else {
      size_t v6 = 0LL;
    }
    if ((is_root_dispatch_queue_prefix_length & 1) == 0)
    {
      is_root_dispatch_queue_prefix_length = 1;
      size_t v6 = 22LL;
    }

    if (!__s1)
    {
      __int16 v14 = 0;
LABEL_19:
      v17[0] = 0;
      goto LABEL_20;
    }

    HIBYTE(v14) = strncmp(__s1, "com.apple.root.", v6) == 0;
    LOBYTE(v14) = 0;
  }

  else
  {
    HIBYTE(v14) = *(void *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 26)) == 0LL;
    LOBYTE(v14) = 0;
    if (!__s1) {
      goto LABEL_19;
    }
  }

  __strlcpy_chk(v17, __s1, 128LL, 128LL);
  if (add_queue_info_to_list_prefix_length) {
    size_t v7 = 22LL;
  }
  else {
    size_t v7 = 0LL;
  }
  if ((add_queue_info_to_list_prefix_length & 1) == 0)
  {
    add_queue_info_to_list_prefix_length = 1;
    size_t v7 = 22LL;
  }

  if (!strncmp(v17, "com.apple.libdispatch-", v7)) {
    LOBYTE(v14) = 1;
  }
LABEL_20:
  entry_from_free_list = get_entry_from_free_list((uint64_t)&queue_lists, v13, a4);
  vm_size_t v9 = entry_from_free_list;
  uint64_t v10 = entry_from_free_list + 5;
  do
    unsigned int v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  if (debug_trace_queues) {
    print_queue_summary((uint64_t)entry_from_free_list, "queue added to list: ", (const char *)&unk_66C2);
  }
  return v9;
}

BOOL __gcd_queue_dispose_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24) == **(void **)(a1 + 32);
}

uint64_t move_entry_to_completed_list(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = (void *)a2[1];
  if (*a2)
  {
    *(void *)(v2 + 8) = v3;
    int v3 = (void *)a2[1];
  }

  else
  {
    *(void *)(result + 40) = v3;
  }

  void *v3 = v2;
  --*(_DWORD *)(result + 48);
  *((_DWORD *)a2 + 4) = 3;
  unsigned int v4 = *(void **)(result + 64);
  *a2 = 0LL;
  a2[1] = (uint64_t)v4;
  void *v4 = a2;
  *(void *)(result + 64) = a2;
  ++*(_DWORD *)(result + 72);
  return result;
}

uint64_t decrement_entry_refcount(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (unsigned int *)a2 + 5;
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3 - 1, v2));
  if (v3 != 1 || *((_DWORD *)a2 + 4) != 3) {
    return 0LL;
  }
  uint64_t v4 = *a2;
  uint64_t v5 = (void *)a2[1];
  if (*a2)
  {
    *(void *)(v4 + 8) = v5;
    uint64_t v5 = (void *)a2[1];
  }

  else
  {
    *(void *)(a1 + 64) = v5;
  }

  *uint64_t v5 = v4;
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v7 = a1 + 80;
  --*(_DWORD *)(v7 - 8);
  *((_DWORD *)a2 + 4) = 0;
  *a2 = v8;
  vm_size_t v9 = (void *)(v8 + 8);
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = (void *)(v7 + 8);
  }
  *uint64_t v10 = a2;
  *(void *)uint64_t v7 = a2;
  a2[1] = v7;
  ++*(_DWORD *)(v7 + 16);
  return 1LL;
}

void __gcd_queue_dispose_hook_block_invoke_2(id a1, generic_introspection_info_s *a2)
{
}

uint64_t is_interesting_event(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if ((*(_BYTE *)(a2 + 56) & 4) != 0 || *(void *)(a2 + 48)) {
    return result;
  }
  uint64_t v5 = libdispatchManagerQueue;
  if (!libdispatchManagerQueue)
  {
    label_ptr = (const char *)dispatch_queue_get_label_ptr(a1);
    if (!label_ptr) {
      label_ptr = (const char *)&unk_66C2;
    }
    uint64_t result = strcmp(label_ptr, "com.apple.libdispatch-manager");
    if (!(_DWORD)result)
    {
      libdispatchManagerQueue = a1;
      return result;
    }

    uint64_t v8 = (const char *)dispatch_queue_get_label_ptr(*(void *)(a2 + 16));
    if (!v8) {
      uint64_t v8 = (const char *)&unk_66C2;
    }
    if (!strcmp(v8, "com.apple.libdispatch-manager"))
    {
      uint64_t v5 = *(void *)(a2 + 16);
      libdispatchManagerQueue = v5;
    }

    else
    {
      uint64_t v5 = libdispatchManagerQueue;
    }
  }

  if (v5 == a1
    || *(void *)(a2 + 16) == v5
    || *(void *)a2 == 18LL
    && _dispatch_queue_override_invoke_owning_ptr
    && *(void *)(a2 + 32) == _dispatch_queue_override_invoke_owning_ptr)
  {
    return 0LL;
  }

  size_t v6 = (const char *)dispatch_queue_get_label_ptr(a1);
  if (!v6) {
    size_t v6 = (const char *)&unk_66C2;
  }
  return strcmp(v6, "source") != 0;
}

BOOL __gcd_queue_item_enqueue_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32) == *(void *)(*(void *)(a1 + 32) + 8LL);
}

unsigned int *find_or_create_queue_info(uint64_t a1, int a2)
{
  if (a2) {
    os_unfair_lock_lock_with_options(&dword_C088, 0x10000LL);
  }
  int v4 = *(unsigned __int16 *)(dispatch_queue_offsets + 12);
  if (v4 == 8)
  {
    uint64_t v5 = *(void *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }

  else if (v4 == 4)
  {
    uint64_t v5 = *(unsigned int *)(a1 + *(unsigned __int16 *)(dispatch_queue_offsets + 10));
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  unsigned int v11 = __find_or_create_queue_info_block_invoke;
  unsigned int v12 = &__block_descriptor_tmp_44;
  uint64_t v13 = v5;
  size_t v6 = (unsigned int *)&off_C090;
  while (1)
  {
    size_t v6 = *(unsigned int **)v6;
    if (!v6) {
      break;
    }
    if ((((uint64_t (*)(void *, unsigned int *))v11)(v10, v6) & 1) != 0)
    {
      if (!a2) {
        return v6;
      }
      goto LABEL_12;
    }
  }

  uint64_t label_ptr = dispatch_queue_get_label_ptr(a1);
  if (label_ptr) {
    vm_size_t v9 = (char *)label_ptr;
  }
  else {
    vm_size_t v9 = (char *)&unk_66C2;
  }
  size_t v6 = add_queue_info_to_list(a1, v5, v9, 0);
  if (a2) {
LABEL_12:
  }
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
  return v6;
}

BOOL __find_or_create_queue_info_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32) == *(void *)(a1 + 32);
}

BOOL __gcd_queue_item_dequeue_hook_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 32) == *(void *)(*(void *)(a1 + 32) + 8LL);
}

void collapse_enqueuing_recursion(uint64_t a1)
{
  *(_BYTE *)(a1 + 89) = 0;
  uint64_t v1 = *(void *)(a1 + 128);
  if (v1)
  {
    int v3 = 0;
    for (int i = 1; ; ++i)
    {
      if (*(_DWORD *)(v1 + 16) != 3 && !*(_BYTE *)(v1 + 90))
      {
        *(_BYTE *)(a1 + 89) = 1;
        return;
      }

      v3 += *(_DWORD *)(v1 + 140) + *(_DWORD *)(v1 + 136) + 1;
      if (i == 1)
      {
        if (*(_BYTE *)(v1 + 90)) {
          break;
        }
      }

      if (*(void *)(a1 + 56) == *(void *)(v1 + 56) && *(void *)(a1 + 96) == *(void *)(v1 + 96)) {
        break;
      }
      uint64_t v1 = *(void *)(v1 + 128);
      if (!v1) {
        return;
      }
    }

    os_unfair_lock_lock_with_options(&dword_C0F0, 0x10000LL);
    if (debug_recursion)
    {
      fputc(10, __stderrp);
      if (*(_BYTE *)(v1 + 90)) {
        uint64_t v5 = "INTERNAL ITEM";
      }
      else {
        uint64_t v5 = (const char *)&unk_66C2;
      }
      snprintf(__str, 0x80uLL, "RECURSION COLLAPSING -- WILL REPARENT %u LEVELS  %s\n", i, v5);
      print_logical_backtrace(__str);
    }

    if (i == 1 && !*(_BYTE *)(v1 + 90))
    {
      int v6 = *(_DWORD *)(v1 + 136) + 1;
      v3 -= v6;
      *(_DWORD *)(a1 + 136) += v6;
    }

    *(_DWORD *)(a1 + 140) += v3;
    uint64_t v7 = *(void *)(a1 + 128);
    uint64_t v8 = *(void *)(v1 + 128);
    *(void *)(a1 + 128) = v8;
    if (v8)
    {
      vm_size_t v9 = (unsigned int *)(v8 + 20);
      do
        unsigned int v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }

    decrement_work_item_refcount(v7);
    if (debug_recursion)
    {
      *(_BYTE *)(a1 + 88) = 0;
      snprintf(__str, 0x80uLL, "RECURSION COLLAPSING -- DID REPARENT %u LEVELS\n", i);
      print_logical_backtrace(__str);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
  }

void decrement_work_item_refcount(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      remove_stack_from_backtrace_uniquing_table(backtrace_uniquing_table, *(void *)(v1 + 96));
      os_unfair_lock_lock_with_options(&dword_C020, 0x10000LL);
      uint64_t v2 = *(uint64_t **)(v1 + 104);
      int v3 = decrement_entry_refcount((uint64_t)&thread_lists, v2);
      if (debug_trace_threads) {
        BOOL v4 = v3 == 0;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        print_thread_summary((uint64_t)v2, "thread became unreferenced, moved to free list: ", (const char *)&unk_66C2);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
      os_unfair_lock_lock_with_options(&dword_C088, 0x10000LL);
      uint64_t v5 = *(uint64_t **)(v1 + 112);
      if (v5)
      {
        int v6 = decrement_entry_refcount((uint64_t)&queue_lists, v5);
        if (debug_trace_queues)
        {
          if (v6) {
            print_queue_summary( *(void *)(v1 + 112),  "queue became unreferenced, moved to free list: ",  (const char *)&unk_66C2);
          }
        }
      }

      int v7 = decrement_entry_refcount((uint64_t)&queue_lists, *(uint64_t **)(v1 + 120));
      if (debug_trace_queues)
      {
        if (v7) {
          print_queue_summary( *(void *)(v1 + 120),  "queue became unreferenced, moved to free list: ",  (const char *)&unk_66C2);
        }
      }

      uint64_t v8 = *(void *)(v1 + 128);
      *(void *)(v1 + 128) = 0LL;
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
      uint64_t v1 = v8;
    }

    while (v8);
  }

void __thread_terminating_block_invoke(id a1, generic_introspection_info_s *a2)
{
}

char *resetDyldInsertLibraries(const char *a1)
{
  uint64_t result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    int v3 = result;
    strlen(result);
    uint64_t v4 = __chkstk_darwin();
    uint64_t v5 = (char *)&v17 - ((v4 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    int v6 = *(unsigned __int8 *)v3;
    if (!*v3) {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
    int v7 = (char *)&v17 - ((v4 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    do
    {
      size_t v8 = 0LL;
      for (int i = v6; i; int i = v3[++v8])
      {
        if (i == 58) {
          break;
        }
      }

      if (v8)
      {
        size_t v10 = v8;
        while (v3[v10] != 47)
        {
          if (!--v10) {
            goto LABEL_11;
          }
        }

        unsigned int v11 = &v3[v10];
        int v6 = 47;
      }

      else
      {
LABEL_11:
        unsigned int v11 = v3;
      }

      BOOL v12 = v6 == 47;
      BOOL v13 = v6 == 47;
      if (v12) {
        __int16 v14 = v11 + 1;
      }
      else {
        __int16 v14 = v11;
      }
      if (&v3[v8] != v14 && strncmp(v14, a1, v3 - v11 - v13 + v8))
      {
        unsigned int v15 = (char *)v5;
        if (v7 != v5)
        {
          *int v7 = 58;
          unsigned int v15 = v7 + 1;
        }

        int v7 = stpncpy(v15, v3, v8);
        int i = v3[v8];
      }

      if (i == 58) {
        unsigned int v16 = v3 + 1;
      }
      else {
        unsigned int v16 = v3;
      }
      int v3 = &v16[v8];
      int v6 = v16[v8];
    }

    while (v6);
    if (v7 > v5)
    {
      *int v7 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v5, 1);
    }

    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }

  return result;
}

uint64_t print_thread_summary(uint64_t a1, const char *a2, const char *a3)
{
  __str[0] = 0;
  int v6 = atomic_load((unsigned int *)(a1 + 20));
  if (v6 >= 1)
  {
    unsigned int v7 = atomic_load((unsigned int *)(a1 + 20));
    snprintf(__str, 0x100uLL, " refcount %d", v7);
  }

  size_t v8 = __stderrp;
  pid_t v9 = getpid();
  size_t v10 = (const char *)&unk_66C2;
  if (a2) {
    unsigned int v11 = a2;
  }
  else {
    unsigned int v11 = (const char *)&unk_66C2;
  }
  if (a3) {
    size_t v10 = a3;
  }
  return fprintf( v8,  "pid %d %sthread %p thread_id %llu;  thread_info %p  %s%s%s\n",
           v9,
           v11,
           *(const void **)(a1 + 32),
           *(void *)(a1 + 24),
           (const void *)a1,
           (const char *)(a1 + 40),
           __str,
           v10);
}

uint64_t print_queue_summary(uint64_t a1, const char *a2, const char *a3)
{
  __str[0] = 0;
  int v6 = atomic_load((unsigned int *)(a1 + 20));
  if (v6 >= 1)
  {
    unsigned int v7 = atomic_load((unsigned int *)(a1 + 20));
    snprintf(__str, 0x100uLL, " refcount %d", v7);
  }

  size_t v8 = (const char *)&unk_66C2;
  if (a2) {
    pid_t v9 = a2;
  }
  else {
    pid_t v9 = (const char *)&unk_66C2;
  }
  if (a3) {
    size_t v8 = a3;
  }
  return fprintf( __stderrp,  "%squeue_info %p  queue %p serialnum %llu %s%s%s\n",  v9,  (const void *)a1,  *(const void **)(a1 + 24),  *(void *)(a1 + 32),  (const char *)(a1 + 52),  __str,  v8);
}

uint64_t print_logical_backtrace(const char *a1)
{
  uint64_t result = active_work_item();
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if ((unint64_t)(*(void *)(result + 24) - 17LL) > 1
    || (showAll & 1) == 0 && *(void *)(result + 40) == libdispatchManagerQueue)
  {
    return result;
  }

  if (*(_BYTE *)(result + 88)) {
    return result;
  }
  uint64_t v4 = &__introspection_dispatch_queue_info_version;
  pthread_setspecific(allow_malloc_logging_key, 0LL);
  uint64_t v5 = backtrace_contains_function("_os_trace", (void *)print_logical_backtrace_address_of_os_trace_function);
  if (v5)
  {
    print_logical_backtrace_address_of_os_trace_function = (uint64_t)v5;
    return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
  }

  LODWORD(v6) = 0;
  uint64_t v7 = 0LL;
  *(_BYTE *)(v3 + 88) = 1;
  uint64_t v8 = v3;
  do
  {
    uint64_t v8 = *(void *)(v8 + 128);
    ++v7;
    size_t v6 = (v6 + 0x8000);
  }

  while (v8);
  do
    unsigned int v9 = __ldxr((unsigned int *)&print_logical_backtrace_logical_backtrace_count);
  while (__stxr(v9 + 1, (unsigned int *)&print_logical_backtrace_logical_backtrace_count));
  do
    unint64_t v10 = __ldxr(&print_logical_backtrace_total_enqueuing_levels);
  while (__stxr(v7 + v10, &print_logical_backtrace_total_enqueuing_levels));
  unsigned int v11 = (char *)malloc(v6);
  unsigned int v12 = atomic_load((unsigned int *)&print_logical_backtrace_logical_backtrace_count);
  uint64_t v13 = atomic_load(&print_logical_backtrace_total_enqueuing_levels);
  float v14 = (float)v13;
  size_t v15 = v6 - 1;
  LODWORD(v13) = atomic_load((unsigned int *)&print_logical_backtrace_logical_backtrace_count);
  unsigned int v16 = snprintf( v11,  v15,  "logical backtrace %d  depth %d  average depth %.1f\n",  v12,  v7,  (float)(v14 / (float)(int)v13));
  uint64_t v17 = &__stderrp;
  if ((v16 & 0x80000000) != 0 || v15 <= v16)
  {
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v16);
    BOOL v18 = v11;
  }

  else
  {
    BOOL v18 = &v11[v16];
    v15 -= v16;
  }

  if ((int)v7 - 1 >= print_logical_backtrace_max_levels)
  {
    print_logical_backtrace_max_levels = v7;
    unsigned int v19 = snprintf(v18, v15, "NEW MAX ENQUEUING LEVEL: %d\n", v7);
    if ((v19 & 0x80000000) != 0 || v15 <= v19)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v19);
    }

    else
    {
      v18 += v19;
      v15 -= v19;
    }
  }

  v45[0] = 0;
  uint64_t v20 = pthread_self();
  pthread_getname_np(v20, v45, 0x40uLL);
  int v21 = (const char *)dispatch_queue_label();
  if (v21) {
    v22 = v21;
  }
  else {
    v22 = (const char *)&unk_66C2;
  }
  uint64_t v23 = *(void *)(v3 + 24);
  if (v23 <= 65)
  {
    if (v23 == 17)
    {
      v24 = "block";
      goto LABEL_37;
    }

    if (v23 == 18)
    {
      v24 = "function";
      goto LABEL_37;
    }
  }

  else
  {
    switch(v23)
    {
      case 66LL:
        v24 = "source";
        goto LABEL_37;
      case 256LL:
        v24 = "object";
        goto LABEL_37;
      case 257LL:
        v24 = "queue";
        goto LABEL_37;
    }
  }

  v24 = "unknown-type";
LABEL_37:
  pthread_t v25 = pthread_self();
  unsigned int v26 = snprintf(v18, v15, "%s  %s on pthread %p %s  queue %p %s\n", a1, v24, v25, v45, *(const void **)(v3 + 40), v22);
  if ((v26 & 0x80000000) != 0
    || v15 <= v26
    || (v18 += v26, v15 -= v26, unsigned int v26 = get_and_print_backtrace(v18, v15, 3, 1), (v26 & 0x80000000) != 0)
    || v15 <= v26)
  {
LABEL_70:
    fprintf(*v17, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v26);
  }

  else
  {
    v18 += v26;
    v15 -= v26;
    int v27 = 1;
    while (1)
    {
      int v28 = v17;
      __str[0] = 0;
      snprintf(__str, 0x40uLL, "  (LEVEL %d)", v27);
      BOOL v29 = (const char *)&unk_66C2;
      if (v27 == 1) {
        int v30 = (const char *)&unk_66C2;
      }
      else {
        int v30 = "----\n";
      }
      uint64_t v31 = *(int *)(v3 + 16);
      unsigned int v32 = *(const void **)(v3 + 56);
      int v33 = dladdr(v32, &v43);
      dli_sname = v43.dli_sname;
      if (!v33) {
        dli_sname = 0LL;
      }
      if (!dli_sname) {
        dli_sname = (const char *)&unk_66C2;
      }
      unsigned int v35 = atomic_load((unsigned int *)(v3 + 20));
      uint64_t v37 = *(void *)(v3 + 112);
      uint64_t v36 = *(void *)(v3 + 120);
      v38 = *(const void **)(v36 + 24);
      __int128 v39 = (const char *)(v36 + 52);
      LODWORD(v36) = atomic_load((unsigned int *)(v36 + 20));
      __int128 v40 = *(const void **)(v37 + 24);
      __int128 v41 = (const char *)(v37 + 52);
      LODWORD(v37) = atomic_load((unsigned int *)(v37 + 20));
      unsigned int v42 = snprintf( v18,  v15,  "%sITEM_INFO %p %s block/function %p %s refcount %d  %s\n TARGET QUEUE %p %s refcount %d\n FROM QUEUE %p %s refcount %d\n",  v30,  (const void *)v3,  v29,  v32,  dli_sname,  v35,  __str,  v38,  v39,  v36,  v40,  v41,  v37);
      if ((v42 & 0x80000000) != 0 || v15 <= v42) {
        break;
      }
      v18 += v42;
      v15 -= v42;
      uint64_t v17 = v28;
      if (*(_DWORD *)(v3 + 136))
      {
        unsigned int v26 = snprintf(v18, v15, "    repeated_enqueuings_count: %u\n", *(_DWORD *)(v3 + 136));
        uint64_t v4 = (void *)&__introspection_dispatch_queue_info_version;
        if ((v26 & 0x80000000) != 0 || v15 <= v26) {
          goto LABEL_70;
        }
        v18 += v26;
        v15 -= v26;
      }

      else
      {
        uint64_t v4 = (void *)&__introspection_dispatch_queue_info_version;
      }

      if (*(_DWORD *)(v3 + 140))
      {
        unsigned int v26 = snprintf(v18, v15, "    elided_enqueuings_count: %u\n", *(_DWORD *)(v3 + 140));
        if ((v26 & 0x80000000) != 0 || v15 <= v26) {
          goto LABEL_70;
        }
        v18 += v26;
        v15 -= v26;
      }

      if (showAll == 1)
      {
        unsigned int v26 = print_queue_item(v18, v15, v3 + 24, (const char *)(*(void *)(v3 + 120) + 52LL));
        if ((v26 & 0x80000000) != 0 || v15 <= v26) {
          goto LABEL_70;
        }
        v18 += v26;
        v15 -= v26;
      }

      unsigned int v26 = print_item_backtrace(v18, v15, v3);
      if ((v26 & 0x80000000) != 0 || v15 <= v26) {
        goto LABEL_70;
      }
      v18 += v26;
      v15 -= v26;
      uint64_t v3 = *(void *)(v3 + 128);
      ++v27;
      if (!v3) {
        goto LABEL_71;
      }
    }

    uint64_t v17 = v28;
    fprintf(*v28, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v15, v42);
    uint64_t v4 = (void *)&__introspection_dispatch_queue_info_version;
  }

LABEL_71:
  snprintf(v18, v15 + 1, "\n");
  fputs(v11, *v17);
  free(v11);
  return pthread_setspecific(v4[71], (char *)&dword_0 + 1);
}

void *backtrace_contains_function(const char *a1, void *a2)
{
  int v4 = backtrace(v13, 512);
  LODWORD(v5) = v4;
  if (a2)
  {
    if (v4 >= 1)
    {
      uint64_t v6 = v4;
      for (int i = v13; *i != a2; ++i)
      {
        if (!--v6) {
          return 0LL;
        }
      }

      return a2;
    }

    return 0LL;
  }

  snprintf(__str, 0x400uLL, " %s + ", a1);
  uint64_t v8 = backtrace_symbols(v13, v5);
  unsigned int v9 = (const char **)v8;
  uint64_t v5 = v5;
  unint64_t v10 = v13;
  while (!strstr(*v9, __str))
  {
    ++v10;
    ++v9;
    if (!--v5) {
      return 0LL;
    }
  }

  return *v10;
}

uint64_t get_and_print_backtrace(char *a1, size_t a2, int a3, char a4)
{
  int v8 = backtrace(v10, 512);
  if (v8 <= a3) {
    return snprintf(a1, a2, "NO BACKTRACE (%d frames after skipping %d)\n", v8 - a3, a3);
  }
  else {
    return print_backtrace(a1, a2, &v10[a3], v8 - a3, a4);
  }
}

uint64_t print_queue_item(char *__str, size_t __size, uint64_t a3, const char *a4)
{
  uint64_t v8 = *(void *)a3;
  if (*(uint64_t *)a3 <= 65)
  {
    if (v8 == 17)
    {
      int v30 = *(const void **)(a3 + 8);
      uint64_t v31 = *(const void **)(a3 + 16);
      unsigned int v32 = *(const void **)(a3 + 24);
      int v33 = dladdr(v32, &v64);
      dli_sname = v64.dli_sname;
      if (!v33) {
        dli_sname = 0LL;
      }
      if (dli_sname) {
        unsigned int v35 = dli_sname;
      }
      else {
        unsigned int v35 = (const char *)&unk_66C2;
      }
      uint64_t v36 = *(const void **)(a3 + 32);
      int v37 = dladdr(v36, &v64);
      v38 = v64.dli_sname;
      if (!v37) {
        v38 = 0LL;
      }
      if (!v38) {
        v38 = (const char *)&unk_66C2;
      }
      uint64_t v39 = snprintf( __str,  __size,  "    BLOCK continuation %p\n    target_queue %p %s\n    block %p %s\n    block_invoke %p %s\n",  v30,  v31,  a4,  v32,  v35,  v36,  v38);
      uint64_t v10 = v39;
      if ((v39 & 0x80000000) != 0 || __size <= v39)
      {
        BOOL v44 = __stderrp;
LABEL_54:
        fprintf(v44, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n");
        return v10;
      }

      __int128 v40 = &__str[v39];
      size_t v41 = __size - v39;
      if (*(void *)(a3 + 40))
      {
        unsigned int v42 = snprintf(v40, v41, "    group %p\n", *(const void **)(a3 + 40));
        uint64_t v10 = v42 + v10;
        if ((v42 & 0x80000000) != 0) {
          goto LABEL_90;
        }
      }

      else
      {
        unsigned int v42 = 0;
      }

      if (v41 > v42)
      {
        v54 = &v40[v42];
        size_t v55 = v41 - v42;
        if (*(void *)(a3 + 48))
        {
          unsigned int v56 = snprintf(v54, v55, "    waiter %p\n", *(const void **)(a3 + 48));
          uint64_t v10 = v56 + v10;
          if ((v56 & 0x80000000) != 0) {
            goto LABEL_90;
          }
        }

        else
        {
          unsigned int v56 = 0;
        }

        if (v55 > v56)
        {
          size_t v57 = v55 - v56;
          if ((*(_BYTE *)(a3 + 56) & 7) != 0)
          {
            v58 = &v54[v56];
            uint64_t v59 = "BARRIER   ";
            if ((*(_BYTE *)(a3 + 56) & 1) == 0) {
              uint64_t v59 = (const char *)&unk_66C2;
            }
            v60 = "SYNC   ";
            if ((*(_BYTE *)(a3 + 56) & 2) == 0) {
              v60 = (const char *)&unk_66C2;
            }
            if ((*(_BYTE *)(a3 + 56) & 4) != 0) {
              v61 = "APPLY   ";
            }
            else {
              v61 = (const char *)&unk_66C2;
            }
LABEL_86:
            unsigned int v62 = snprintf(v58, v57, "    %s%s%s\n", v59, v60, v61);
            uint64_t v10 = v62 + v10;
            if ((v62 & 0x80000000) != 0) {
              goto LABEL_90;
            }
            goto LABEL_89;
          }

LABEL_88:
          unsigned int v62 = 0;
LABEL_89:
          if (v57 > v62) {
            return v10;
          }
        }
      }
    }

    else
    {
      if (v8 != 18) {
        return snprintf(__str, __size, "    unknown dispatch introspection item!!!\n");
      }
      unsigned int v12 = *(const void **)(a3 + 8);
      uint64_t v13 = *(const void **)(a3 + 16);
      size_t v15 = *(const void **)(a3 + 24);
      float v14 = *(const void **)(a3 + 32);
      int v16 = dladdr(v14, &v64);
      uint64_t v17 = v64.dli_sname;
      if (!v16) {
        uint64_t v17 = 0LL;
      }
      if (!v17) {
        uint64_t v17 = (const char *)&unk_66C2;
      }
      uint64_t v18 = snprintf( __str,  __size,  "    FUNCTION continuation %p\n    target_queue %p %s\n    context %p\n    function %p %s\n",  v12,  v13,  a4,  v15,  v14,  v17);
      uint64_t v10 = v18;
      unsigned int v19 = &__str[v18];
      size_t v20 = __size - v18;
      if (*(void *)(a3 + 40))
      {
        unsigned int v21 = snprintf(v19, v20, "    group %p\n", *(const void **)(a3 + 40));
        uint64_t v10 = v21 + v10;
        if ((v21 & 0x80000000) != 0) {
          goto LABEL_90;
        }
      }

      else
      {
        unsigned int v21 = 0;
      }

      if (v20 > v21)
      {
        uint64_t v51 = &v19[v21];
        size_t v52 = v20 - v21;
        if (*(void *)(a3 + 48))
        {
          unsigned int v53 = snprintf(v51, v52, "    waiter %p\n", *(const void **)(a3 + 48));
          uint64_t v10 = v53 + v10;
          if ((v53 & 0x80000000) != 0) {
            goto LABEL_90;
          }
        }

        else
        {
          unsigned int v53 = 0;
        }

        if (v52 > v53)
        {
          size_t v57 = v52 - v53;
          if ((*(_BYTE *)(a3 + 56) & 7) != 0)
          {
            v58 = &v51[v53];
            uint64_t v59 = "BARRIER   ";
            if ((*(_BYTE *)(a3 + 56) & 1) == 0) {
              uint64_t v59 = (const char *)&unk_66C2;
            }
            v60 = "SYNC   ";
            if ((*(_BYTE *)(a3 + 56) & 2) == 0) {
              v60 = (const char *)&unk_66C2;
            }
            if ((*(_BYTE *)(a3 + 56) & 4) != 0) {
              v61 = "APPLY   ";
            }
            else {
              v61 = (const char *)&unk_66C2;
            }
            goto LABEL_86;
          }

          goto LABEL_88;
        }
      }
    }

LABEL_90:
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n");
    return v10;
  }

  if (v8 != 66)
  {
    if (v8 == 256)
    {
      pthread_t v25 = *(const void **)(a3 + 8);
      unsigned int v26 = *(const void **)(a3 + 16);
      int v27 = *(const void **)(a3 + 24);
      int v28 = dladdr(v27, &v64);
      BOOL v29 = v64.dli_sname;
      if (!v28) {
        BOOL v29 = 0LL;
      }
      if (!v29) {
        BOOL v29 = (const char *)&unk_66C2;
      }
      return snprintf( __str,  __size,  "    OBJECT %p\n    target_queue %p %s\n    type %p %s\n    kind %s\n",  v25,  v26,  a4,  v27,  v29,  *(const char **)(a3 + 32));
    }

    if (v8 == 257)
    {
      uint64_t v9 = snprintf( __str,  __size,  "    QUEUE %p %s\n    target_queue %p %s\n    serialnum %lu\n    width %u\n    suspend_count %u\n",  *(const void **)(a3 + 8),  (const char *)&unk_66C2,  *(const void **)(a3 + 16),  a4,  *(void *)(a3 + 32),  *(_DWORD *)(a3 + 40),  *(_DWORD *)(a3 + 44));
      uint64_t v10 = v9;
      if ((v9 & 0x80000000) == 0 && __size > v9)
      {
        if ((*(_BYTE *)(a3 + 48) & 0x1F) != 0)
        {
          int v11 = snprintf(&__str[v9], __size - v9, "    %s%s%s%s%s\n");
          return (v11 + v10);
        }

        return v10;
      }

      goto LABEL_53;
    }

    return snprintf(__str, __size, "    unknown dispatch introspection item!!!\n");
  }

  v22 = *(const void **)(a3 + 8);
  uint64_t v23 = *(void *)(a3 + 24);
  v63 = *(const void **)(a3 + 16);
  else {
    v24 = off_8310[v23 + 22];
  }
  uint64_t v45 = *(void *)(a3 + 32);
  uint64_t v46 = *(const void **)(a3 + 40);
  v47 = *(const void **)(a3 + 48);
  int v48 = dladdr(v47, &v64);
  v49 = v64.dli_sname;
  if (!v48) {
    v49 = 0LL;
  }
  if (!v49) {
    v49 = (const char *)&unk_66C2;
  }
  uint64_t v50 = snprintf( __str,  __size,  "    SOURCE %p\n target_queue %p %s\n type (kevent filter) %ld  %s\n handle %lu\n context %p\n handler %p %s\n suspend_count %u\n",  v22,  v63,  a4,  v23,  v24,  v45,  v46,  v47,  v49,  *(_DWORD *)(a3 + 56));
  uint64_t v10 = v50;
  if ((v50 & 0x80000000) != 0 || __size <= v50)
  {
LABEL_53:
    BOOL v44 = __stderrp;
    goto LABEL_54;
  }

  if ((*(_BYTE *)(a3 + 60) & 0xF) != 0)
  {
    int v11 = snprintf(&__str[v50], __size - v50, "    %s%s%s%s\n");
    return (v11 + v10);
  }

  return v10;
}

uint64_t print_item_backtrace(char *a1, size_t a2, uint64_t a3)
{
  unsigned int v5 = *(_DWORD *)(a3 + 92);
  if (v5 >= 0x200) {
    uint64_t v6 = 512LL;
  }
  else {
    uint64_t v6 = v5;
  }
  int v7 = ptrSized_stack_frames_for_uniqued_stack(backtrace_uniquing_table, *(void *)(a3 + 96), v9, v6);
  return print_backtrace(a1, a2, v9, v7, 1);
}

uint64_t print_queue_item_and_current_backtrace( char *__str, size_t __size, uint64_t a3, const char *a4, int a5, char a6)
{
  if (!a4) {
    a4 = (const char *)dispatch_queue_label();
  }
  uint64_t v11 = print_queue_item(__str, __size, a3, a4);
  uint64_t v12 = v11;
  if ((v11 & 0x80000000) == 0 && __size > v11) {
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", __size, v11);
  }
  return v12;
}

uint64_t print_gcd_queue_create_dispose(uint64_t result, uint64_t a2)
{
  if (showLogicalBacktraces == 1)
  {
    uint64_t v3 = (const char *)result;
    if (*(void *)(a2 + 16)) {
      int v4 = *(const char **)(a2 + 16);
    }
    else {
      int v4 = (const char *)&unk_66C2;
    }
    if ((showAll & 1) != 0)
    {
      pthread_setspecific(allow_malloc_logging_key, 0LL);
      unsigned int v5 = *(const void **)a2;
      pthread_t v6 = pthread_self();
      unsigned int v7 = snprintf(__str, 0x3FFFuLL, "%s queue %p %s  (on pthread %p)\n", v3, v5, v4, v6);
      if (v7 >= 0x3FFF)
      {
        size_t v9 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v7);
        uint64_t v8 = __str;
      }

      else
      {
        uint64_t v8 = &__str[v7];
        size_t v9 = 0x3FFFLL - v7;
        unsigned int v10 = get_and_print_backtrace(v8, v9, 3, 0);
        if ((v10 & 0x80000000) != 0 || v9 <= v10)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v9, v10);
        }

        else
        {
          v8 += v10;
          v9 -= v10;
        }
      }

      snprintf(v8, v9 + 1, "\n");
      fputs(__str, __stderrp);
      return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }

    else
    {
      uint64_t result = active_work_item();
      if (result)
      {
        snprintf(__str, 0x4000uLL, "%s queue %p %s", v3, *(const void **)a2, v4);
        return print_logical_backtrace(__str);
      }
    }
  }

  return result;
}

const char *print_gcd_queue_item_enqueue_dequeue( const char *result, const void *a2, uint64_t *a3, int a4, int a5)
{
  size_t v9 = result;
  if ((showAll & 1) == 0 && (!showEnqueueDequeue || a4 == 0)) {
    return result;
  }
  pthread_setspecific(allow_malloc_logging_key, 0LL);
  uint64_t v11 = (char *)malloc(0x20000uLL);
  uint64_t v12 = "IGNORING ";
  if (a5) {
    uint64_t v12 = "IGNORING BECAUSE ALREADY HAPPENED ";
  }
  if (a4) {
    uint64_t v13 = (const char *)&unk_66C2;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = *a3;
  if (*a3 <= 65)
  {
    if (v14 == 17)
    {
      size_t v15 = "block";
      goto LABEL_25;
    }

    if (v14 == 18)
    {
      size_t v15 = "function";
      goto LABEL_25;
    }

LABEL_24:
    size_t v15 = "unknown-type";
    goto LABEL_25;
  }

  if (v14 == 66)
  {
    size_t v15 = "source";
    goto LABEL_25;
  }

  if (v14 == 256)
  {
    size_t v15 = "object";
    goto LABEL_25;
  }

  if (v14 != 257) {
    goto LABEL_24;
  }
  size_t v15 = "queue";
LABEL_25:
  int v16 = (const char *)dispatch_queue_label();
  pthread_t v17 = pthread_self();
  unsigned int v18 = snprintf(v11, 0x1FFFFuLL, "%s%s %s %p on queue %p %s  (on pthread %p)\n", v13, v9, v15, a3, a2, v16, v17);
  if (v18 >= 0x1FFFF)
  {
    size_t v20 = 0x1FFFFLL;
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x1FFFFuLL, v18);
    unsigned int v19 = v11;
  }

  else
  {
    unsigned int v19 = &v11[v18];
    size_t v20 = 0x1FFFFLL - v18;
    uint64_t active = active_work_item();
    if (active)
    {
      uint64_t v22 = active;
      if (*(void *)(active + 32) != a3[1]
        && ((showAll & 1) != 0 || *(void *)(active + 40) != libdispatchManagerQueue))
      {
        unsigned int v23 = snprintf(v19, v20, "EVENT OCCURRED WHILE AN ASYNC OPERATION IS EXECUTING;  DETAILS OF THAT OPERATION:\n");
        if ((v23 & 0x80000000) != 0
          || v20 <= v23
          || (v19 += v23,
              v20 -= v23,
              unsigned int v23 = print_queue_item(v19, v20, v22 + 24, (const char *)(*(void *)(v22 + 120) + 52LL)),
              (v23 & 0x80000000) != 0)
          || v20 <= v23
          || (v19 += v23, v20 -= v23, unsigned int v23 = snprintf(v19, v20, "DETAILS FOR NEW EVENT:\n"), (v23 & 0x80000000) != 0)
          || v20 <= v23)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v20, v23);
        }

        else
        {
          v19 += v23;
          v20 -= v23;
        }
      }
    }

    unsigned int v24 = print_queue_item_and_current_backtrace(v19, v20, (uint64_t)a3, 0LL, 4, 0);
    if ((v24 & 0x80000000) != 0 || v20 <= v24)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v20, v24);
    }

    else
    {
      v19 += v24;
      v20 -= v24;
    }
  }

  snprintf(v19, v20 + 1, "\n");
  fputs(v11, __stderrp);
  free(v11);
  return (const char *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
}

uint64_t print_gcd_item_conflict(void *a1, void *a2)
{
  v11[0] = 0;
  int v4 = pthread_self();
  pthread_getname_np(v4, v11, 0x40uLL);
  pthread_t v5 = pthread_self();
  unsigned int v6 = snprintf( __str,  0x7FFFuLL,  "LOGICAL ERROR! new work item %p conflicts with currently-running %p on pthread %p %s\n",  a1,  a2,  v5,  v11);
  if (v6 >= 0x7FFF)
  {
    size_t v8 = 0x7FFFLL;
    fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x7FFFuLL, v6);
    unsigned int v7 = __str;
  }

  else
  {
    unsigned int v7 = &__str[v6];
    size_t v8 = 0x7FFFLL - v6;
    unsigned int v9 = snprintf(v7, v8, "NEW WORK ITEM %p:\n", a1);
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    if (v8 <= v9) {
      goto LABEL_16;
    }
    v7 += v9;
    v8 -= v9;
    unsigned int v9 = print_queue_item(v7, v8, (uint64_t)(a1 + 3), (const char *)(a1[15] + 52LL));
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    if (v8 <= v9) {
      goto LABEL_16;
    }
    v7 += v9;
    v8 -= v9;
    unsigned int v9 = print_item_backtrace(v7, v8, (uint64_t)a1);
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    if (v8 <= v9) {
      goto LABEL_16;
    }
    v7 += v9;
    v8 -= v9;
    unsigned int v9 = snprintf(v7, v8, "PREVIOUS (CURRENTLY RUNNING) ITEM %p:\n", a2);
    if ((v9 & 0x80000000) != 0
      || v8 <= v9
      || (v7 += v9,
          v8 -= v9,
          unsigned int v9 = print_queue_item(v7, v8, (uint64_t)(a2 + 3), (const char *)(a2[15] + 52LL)),
          (v9 & 0x80000000) != 0)
      || v8 <= v9
      || (v7 += v9, v8 -= v9, unsigned int v9 = print_item_backtrace(v7, v8, (uint64_t)a2), (v9 & 0x80000000) != 0)
      || v8 <= v9)
    {
LABEL_16:
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v8, v9);
    }

    else
    {
      v7 += v9;
      v8 -= v9;
    }
  }

  snprintf(v7, v8 + 1, "\n");
  return fputs(__str, __stderrp);
}

uint64_t print_gcd_queue_item_complete(const void *a1, uint64_t a2)
{
  if (showLogicalBacktraces == 1)
  {
    int v4 = *(const void **)(a2 + 32);
    if (v4 != a1)
    {
      uint64_t v5 = *(int *)(a2 + 16);
      else {
        unsigned int v6 = off_8478[v5];
      }
      uint64_t v13 = *(const void **)(a2 + 48);
      uint64_t v14 = *(const void **)(a2 + 56);
      pthread_t v15 = pthread_self();
      unsigned int v16 = snprintf( __str,  0x3FFFuLL,  "LOGICAL ERROR!! irrelevant(?) continuation %p complete;  item_info %p  state %s, continuation %p, context "
              "%p function %p  NO MATCH (on pthread %p)\n",
              a1,
              (const void *)a2,
              v6,
              v4,
              v13,
              v14,
              v15);
      int v9 = v16;
      if (v16 >= 0x3FFF)
      {
        size_t v11 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v16);
        unsigned int v10 = __str;
      }

      else
      {
        unsigned int v10 = &__str[v16];
        size_t v11 = 0x3FFFLL - v16;
        unsigned int v17 = print_queue_item_and_current_backtrace( v10,  v11,  a2 + 24,  (const char *)(*(void *)(a2 + 120) + 52LL),  0,  0);
        int v9 = v17;
        if ((v17 & 0x80000000) != 0 || v11 <= v17)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v11, v17);
        }

        else
        {
          v10 += v17;
          v11 -= v17;
        }
      }

      if (*(_DWORD *)(a2 + 16) != 2) {
        goto LABEL_22;
      }
      unsigned int v12 = snprintf(v10, v11, "    marking item_info %p as complete\n", (const void *)a2);
      goto LABEL_18;
    }
  }

  if (!showEnqueueDequeue) {
    return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
  }
  pthread_t v7 = pthread_self();
  unsigned int v8 = snprintf( __str,  0x3FFFuLL,  "queue item %p complete;  completed_continuation %p  MATCHED, SO CLEARING  (on pthread %p)\n",
         (const void *)a2,
         a1,
         v7);
  int v9 = v8;
  if (v8 < 0x3FFF)
  {
    unsigned int v10 = &__str[v8];
    size_t v11 = 0x3FFFLL - v8;
    unsigned int v12 = get_and_print_backtrace(v10, v11, 2, 0);
LABEL_18:
    int v9 = v12;
    if ((v12 & 0x80000000) != 0 || v11 <= v12)
    {
      fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v11, v12);
    }

    else
    {
      v10 += v12;
      v11 -= v12;
    }

    goto LABEL_22;
  }

  size_t v11 = 0x3FFFLL;
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v8);
  unsigned int v10 = __str;
LABEL_22:
  if (v9 >= 1)
  {
    snprintf(v10, v11 + 1, "\n");
    fputs(__str, __stderrp);
  }

  return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
}

uint64_t print_pthread_event(uint64_t result, const void *a2, char *a3, uint64_t a4)
{
  if (showLogicalBacktraces == 1)
  {
    int v7 = result;
    if ((showAll & 1) != 0)
    {
      pthread_setspecific(allow_malloc_logging_key, 0LL);
      unsigned int v8 = v7 - 1;
      if (v8 > 3) {
        int v9 = "pthread unknown event";
      }
      else {
        int v9 = off_8458[v8];
      }
      pthread_t v11 = pthread_self();
      unsigned int v12 = snprintf( __str,  0x3FFFuLL,  "%s: pthread %p, stack %p-%p[%zx]  (on pthread %p)\n",  v9,  a2,  a3,  &a3[a4],  a4,  v11);
      if (v12 >= 0x3FFF)
      {
        size_t v14 = 0x3FFFLL;
        fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", 0x3FFFuLL, v12);
        uint64_t v13 = __str;
      }

      else
      {
        uint64_t v13 = &__str[v12];
        size_t v14 = 0x3FFFLL - v12;
        if (v8 > 3) {
          int v15 = 0;
        }
        else {
          int v15 = dword_65D0[v8];
        }
        unsigned int v16 = get_and_print_backtrace(&__str[v12], v14, v15, 0);
        if ((v16 & 0x80000000) != 0 || v14 <= v16)
        {
          fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v14, v16);
        }

        else
        {
          v13 += v16;
          v14 -= v16;
        }
      }

      snprintf(v13, v14 + 1, "\n");
      fputs(__str, __stderrp);
      return pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }

    else
    {
      uint64_t result = (uint64_t)pthread_self();
      if ((const void *)result != a2)
      {
        uint64_t result = active_work_item();
        if (result)
        {
          else {
            unsigned int v10 = off_8458[v7 - 1];
          }
          snprintf(__str, 0x4000uLL, "%s: pthread %p, stack %p-%p[%zx]", v10, a2, a3, &a3[a4], a4);
          return print_logical_backtrace(__str);
        }
      }
    }
  }

  return result;
}

uint64_t print_list(const char *a1, void **a2, uint64_t a3)
{
  if (a1) {
    fprintf(__stderrp, "%s:\n", a1);
  }
  uint64_t v5 = *a2;
  if (v5)
  {
    int v6 = 0;
    do
    {
      int v7 = v6 + 1;
      fprintf(__stderrp, "%4u  ", v6);
      (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
      uint64_t v5 = (void *)*v5;
      int v6 = v7;
    }

    while (v5);
  }

  return fputc(10, __stderrp);
}

void locked_print_dispatch_info()
{
  if (exerciseAPI == 1 && os_unfair_lock_trylock((os_unfair_lock_t)&dword_C020))
  {
    if (os_unfair_lock_trylock((os_unfair_lock_t)&dword_C088))
    {
      if (os_unfair_lock_trylock((os_unfair_lock_t)&dword_C0F0))
      {
        print_dispatch_info();
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_C0F0);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&dword_C088);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&dword_C020);
  }

const char *initialize_debug_printing()
{
  uint64_t result = getenv("BacktraceRecordingOptions");
  if (result)
  {
    uint64_t v1 = result;
    if (strcasestr(result, "api")) {
      exerciseAPI = 1;
    }
    if (strcasestr(v1, "logical")) {
      showLogicalBacktraces = 1;
    }
    if (strcasestr(v1, "all")) {
      showAll = 1;
    }
    if (strcasestr(v1, "nocompress")) {
      nocompress = 1;
    }
    if (strcasestr(v1, "enqueue")) {
      showEnqueueDequeue = 1;
    }
    if (strcasestr(v1, "threads")) {
      debug_trace_threads = 1;
    }
    if (strcasestr(v1, "queues")) {
      debug_trace_queues = 1;
    }
    if (strcasestr(v1, "recursion")) {
      debug_recursion = 1;
    }
    if (strcasestr(v1, "maxlevels")) {
      debug_maxlevels = 1;
    }
    uint64_t result = strcasestr(v1, "none");
    if (result) {
      debug_printing = 0;
    }
    if (showAll == 1) {
      showEnqueueDequeue = 1;
    }
  }

  if (showLogicalBacktraces == 1)
  {
    pthread_key_create((pthread_key_t *)&allow_malloc_logging_key, 0LL);
    uint64_t result = (const char *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    previous_malloc_logger = (uint64_t (*)(void))malloc_logger;
    malloc_logger = my_malloc_logger;
  }

  return result;
}

void *my_malloc_logger(void *result)
{
  int v1 = (int)result;
  if (previous_malloc_logger) {
    uint64_t result = (void *)previous_malloc_logger(result);
  }
  if (v1 == 10)
  {
    uint64_t result = pthread_getspecific(allow_malloc_logging_key);
    if (result)
    {
      pthread_setspecific(allow_malloc_logging_key, 0LL);
      if ((my_malloc_logger_finished_setlocale & 1) != 0)
      {
LABEL_6:
        snprintf(__str, 0x80uLL, "malloc_logger event type %u", 10);
        print_logical_backtrace(__str);
        return (void *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
      }

      uint64_t v2 = backtrace_contains_function("setlocale", (void *)my_malloc_logger_address_of_setlocale_function);
      if (!v2)
      {
        int v3 = my_malloc_logger_malloc_count;
        int v4 = ++my_malloc_logger_malloc_count;
        if (v3 >= 1000)
        {
          fprintf(__stderrp, "setting finished_setlocale, malloc_count %d\n", v4);
          my_malloc_logger_finished_setlocale = 1;
        }

        goto LABEL_6;
      }

      my_malloc_logger_address_of_setlocale_function = (uint64_t)v2;
      return (void *)pthread_setspecific(allow_malloc_logging_key, (char *)&dword_0 + 1);
    }
  }

  return result;
}

uint64_t print_backtrace(char *__str, size_t __size, void **a3, int a4, char a5)
{
  size_t v5 = __size;
  int v6 = __str;
  if (a4 <= 0) {
    return snprintf(__str, __size, "NO BACKTRACE (%d frames)\n", a4);
  }
  char v7 = a5 & ~nocompress;
  else {
    int v8 = a4 - 1;
  }
  int v9 = backtrace_symbols(a3, v8);
  uint64_t v10 = (v8 - 3);
  char v11 = v7 ^ 1;
  if ((v11 & 1) != 0)
  {
LABEL_12:
    int v12 = v8;
  }

  else
  {
    int v12 = v8 - 2;
    while (strstr(v9[v10], " libdispatch.dylib "))
    {
      --v12;
      if (v10-- <= 0) {
        goto LABEL_12;
      }
    }
  }

  if (v8 < 1)
  {
    uint64_t v15 = 0LL;
    goto LABEL_36;
  }

  int v14 = 0;
  uint64_t v15 = 0LL;
  while (1)
  {
    if ((v7 & 1) != 0)
    {
      if (strstr(v9[v14], " libdispatch.dylib "))
      {
        char v7 = 1;
        goto LABEL_31;
      }

      if (v14 >= 1) {
        break;
      }
    }

LABEL_22:
    unsigned int v16 = snprintf(v6, v5, "%s\n", v9[v14]);
    if ((v16 & 0x80000000) != 0 || v5 <= v16) {
      goto LABEL_35;
    }
    v6 += v16;
    v5 -= v16;
    uint64_t v15 = v16 + v15;
    if (v14 == v12)
    {
      if (v12 >= v8 - 2)
      {
        char v7 = 0;
        int v14 = v12;
      }

      else
      {
        unsigned int v16 = snprintf(v6, v5, "...");
        if ((v16 & 0x80000000) != 0 || v5 <= v16) {
          goto LABEL_35;
        }
        char v7 = 0;
        v6 += v16;
        v5 -= v16;
        uint64_t v15 = v16 + v15;
        int v14 = v8 - 2;
      }
    }

    else
    {
      char v7 = 0;
    }

LABEL_31:
    if (++v14 >= v8) {
      goto LABEL_36;
    }
  }

  unsigned int v16 = snprintf(v6, v5, "%s\n", v9[v14 - 1]);
  if ((v16 & 0x80000000) == 0 && v5 > v16)
  {
    v6 += v16;
    v5 -= v16;
    uint64_t v15 = v16 + v15;
    goto LABEL_22;
  }

LABEL_35:
  fprintf(__stderrp, "BUFSIZ CHECK FAILED bufsiz %zu printed_count %d\n\n\n", v5, v16);
LABEL_36:
  free(v9);
  return v15;
}

_DWORD *create_backtrace_uniquing_table(unsigned int a1, int a2)
{
  int v4 = calloc(1uLL, 0x108uLL);
  size_t v5 = v4;
  if ((a2 & 2) != 0) {
    unint64_t v6 = 24LL;
  }
  else {
    unint64_t v6 = 16LL;
  }
  v4[10] = v6;
  if (a1)
  {
    if (a1 <= 0x400) {
      int v7 = 1024;
    }
    else {
      int v7 = a1;
    }
    uint64_t v8 = (v6 * v7);
    vm_size_t v9 = vm_page_size;
    uint64_t v10 = (((v8 + vm_page_size - 1) & -(uint64_t)vm_page_size) / vm_page_size);
  }

  else
  {
    vm_size_t v9 = vm_page_size;
    uint64_t v10 = 512LL;
  }

  *((void *)v4 + 1) = v10;
  *((void *)v4 + 2) = (v9 * v10 / v6) & 0xFFFFFFFFFFFFFFELL;
  *((void *)v4 + 3) = v9 * v10;
  if (mach_vm_allocate(mach_task_self_, &address, v9 * v10, 167772161)) {
    create_backtrace_uniquing_table_cold_1();
  }
  *(void *)size_t v5 = address;
  *((void *)v5 + 4) = 0LL;
  v5[14] = ((a2 & 6) == 0) | a2;
  v5[11] = 10;
  unint64_t v11 = *((void *)v5 + 2);
  if (v11 >= 0x401)
  {
    int v12 = 10;
    do
    {
      v11 >>= 2;
      v12 += 3;
    }

    while (v11 > 0x400);
    v5[11] = v12;
  }

  pthread_rwlock_init((pthread_rwlock_t *)(v5 + 16), 0LL);
  return v5;
}

uint64_t enter_stack_in_backtrace_uniquing_table(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  int v9 = _enter_frames_in_table_while_locked(a1, &v32, a3, a4);
  pthread_rwlock_unlock(v8);
  if (v9)
  {
    uint64_t result = 1LL;
  }

  else
  {
    uint64_t v30 = a3;
    unsigned int v31 = a4;
    while (1)
    {
      uint64_t v11 = 4LL * *(void *)(a1 + 8);
      int v12 = *(_DWORD *)(a1 + 44);
      pthread_rwlock_wrlock(v8);
      uint64_t v13 = *(void *)(a1 + 16);
      vm_size_t v14 = vm_page_size * v11;
      vm_size_t v15 = vm_page_size * v11 / *(unsigned int *)(a1 + 40);
      unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
      if (HIDWORD(v15))
      {
        fprintf( __stderrp,  "can't expand backtrace uniquing table from %llu nodes to %llu nodes (exceeds maximum %u)\n",  v13,  v16,  -1);
        goto LABEL_32;
      }

      unsigned int v17 = v8;
      mach_vm_address_t v18 = *(void *)a1;
      mach_vm_size_t v19 = *(void *)(a1 + 24);
      if (mach_vm_allocate(mach_task_self_, address, vm_page_size * v11, 167772161)) {
        create_backtrace_uniquing_table_cold_1();
      }
      mach_vm_address_t v20 = address[0];
      if (!address[0]) {
        break;
      }
      *(void *)a1 = address[0];
      *(void *)(a1 + 8) = v11;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = v14;
      *(void *)(a1 + 32) = v13;
      *(_DWORD *)(a1 + 44) = v12 + 3;
      int v21 = *(_DWORD *)(a1 + 56);
      if ((v21 & 1) != 0)
      {
        *(void *)(a1 + 48) = 0LL;
      }

      else if ((v21 & 4) != 0)
      {
        if (mach_vm_copy(mach_task_self_, v18, v19, v20)) {
          printf("(BacktraceUniquing) expandUniquingTable(): VMCopyFailed");
        }
      }

      else if ((v21 & 2) != 0)
      {
        *(void *)(a1 + 48) = 0LL;
        if (v13)
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            uint64_t v23 = *(unsigned int *)(a1 + 40);
            mach_vm_address_t v24 = v18 + i * v23;
            uint64_t v25 = *(void *)(v24 + 16);
            if (v25)
            {
              int v26 = *(_DWORD *)(v24 + 8);
              if (v26 == -1)
              {
                int v28 = 0;
              }

              else
              {
                int v27 = 0;
                do
                {
                  address[v27] = *(void *)v24;
                  int v28 = v27 + 1;
                  mach_vm_address_t v24 = v18 + (v26 * v23);
                  int v26 = *(_DWORD *)(v24 + 8);
                  ++v27;
                }

                while (v26 != -1);
              }

              address[v28] = *(void *)v24;
              uint64_t v33 = 0LL;
              else {
                fwrite( "unable to reinsert node when expanding backtrace uniquing table - bad hashing function?\n",  0x58uLL,  1uLL,  __stderrp);
              }
            }
          }
        }
      }

      if (mach_vm_deallocate(mach_task_self_, v18, v19)) {
        printf("(BacktraceUniquing) expandUniquingTable(): mach_vm_deallocate failed. [%p]\n", *(const void **)a1);
      }
      uint64_t v8 = v17;
      pthread_rwlock_unlock(v17);
      pthread_rwlock_wrlock(v17);
      int v29 = _enter_frames_in_table_while_locked(a1, &v32, v30, v31);
      pthread_rwlock_unlock(v17);
      if (v29)
      {
        uint64_t result = 1LL;
        goto LABEL_33;
      }
    }

    fprintf(__stderrp, "failed to expand uniquing table to %llu bytes\n", v14);
    uint64_t v8 = v17;
LABEL_32:
    pthread_rwlock_unlock(v8);
    uint64_t result = 0LL;
    uint64_t v32 = -1LL;
  }

LABEL_33:
  *a2 = v32;
  return result;
}

uint64_t remove_stack_from_backtrace_uniquing_table(uint64_t a1, uint64_t a2)
{
  int v4 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  if ((_DWORD)a2 != -1)
  {
    int v5 = a2;
    do
    {
      size_t v6 = *(unsigned int *)(a1 + 40);
      int v7 = (_DWORD *)(*(void *)a1 + (v6 * v5));
      int v8 = v7[2];
      if (*(void *)v7) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      if (v9) {
        break;
      }
      int v10 = v7[3];
      if (v10 != -1)
      {
        int v11 = v10 - 1;
        v7[3] = v11;
        if (!v11)
        {
          bzero(v7, v6);
          --*(_DWORD *)(a1 + 48);
          if (v5 == a2) {
            --*(_DWORD *)(a1 + 52);
          }
        }
      }

      int v5 = v8;
    }

    while (v8 != -1);
  }

  return pthread_rwlock_unlock(v4);
}

uint64_t stack_frames_for_uniqued_stack(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 64));
  uint64_t v9 = 0LL;
  if (a4 && a2 != -1)
  {
    uint64_t v9 = 0LL;
    int v10 = *(_DWORD *)(a1 + 40);
    vm_size_t v11 = vm_page_size;
    while (1)
    {
      if (v11 * *(void *)(a1 + 8) <= (v10 + v10 * a2))
      {
        fprintf(__stderrp, "(BacktraceUniquing): Invalid parent node %#x\n");
        goto LABEL_14;
      }

      uint64_t v12 = *(void *)a1 + (v10 * a2);
      a2 = *(_DWORD *)(v12 + 8);
      if (!*(void *)v12 && a2 == 0) {
        break;
      }
      *(void *)(a3 + 8 * v9) = *(void *)v12;
      int v14 = v9++;
      if (a4 - 1 == v14 || a2 == -1) {
        goto LABEL_14;
      }
    }

    fprintf(__stderrp, "(BacktraceUniquing): Invalid PC 0x%llx\n");
  }

LABEL_14:
  pthread_rwlock_unlock(v8);
  return v9;
}

uint64_t _enter_frames_in_table_while_locked(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(int *)(a1 + 44);
  unint64_t v7 = (v4 - v5) / ((2 * v6) | 1uLL);
  uint64_t v8 = a4;
  unsigned int v9 = -1;
  while (1)
  {
    unsigned int v10 = v9;
    if ((_DWORD)v6)
    {
      --v8;
      unint64_t v11 = *(void *)(a3 + 8 * v8);
      unsigned int v9 = ((16 * v9) ^ (v11 >> 2)) % (v4 - v5 - 1) + v5;
      int v12 = (v6 - 1) * v7 + 1;
      int v13 = v6;
      while (1)
      {
        uint64_t v14 = *(void *)a1 + *(_DWORD *)(a1 + 40) * v9;
        if (!*(void *)v14 && !*(_DWORD *)(v14 + 8)) {
          break;
        }
        if (*(void *)v14 == v11 && *(_DWORD *)(v14 + 8) == v10)
        {
          int v19 = *(_DWORD *)(v14 + 12);
          mach_vm_address_t v18 = (_DWORD *)(v14 + 12);
          int v17 = v19;
          if (v19 == -1) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }

        unint64_t v15 = v9 + v12;
        if (v4 <= v15) {
          int v16 = v5 - v4;
        }
        else {
          int v16 = 0;
        }
        v12 -= v7;
        unsigned int v9 = v15 + v16;
        if (!--v13) {
          return 0LL;
        }
      }

      *(void *)uint64_t v14 = v11;
      *(_DWORD *)(v14 + 8) = v10;
      *(_DWORD *)(v14 + 12) = 1;
      ++*(_DWORD *)(a1 + 48);
      if (v8) {
        goto LABEL_19;
      }
      int v17 = *(_DWORD *)(a1 + 52);
      mach_vm_address_t v18 = (_DWORD *)(a1 + 52);
LABEL_18:
      *mach_vm_address_t v18 = v17 + 1;
LABEL_19:
      if (v13 >= 1) {
        continue;
      }
    }

    return 0LL;
  }

  *a2 = v9;
  return 1LL;
}

uint64_t print_dispatch_info()
{
  thread_act_array_t act_list = 0LL;
  if (!task_threads(mach_task_self_, &act_list, act_listCnt))
  {
    if (act_listCnt[0])
    {
      unint64_t v0 = 0LL;
      do
      {
        int v1 = pthread_from_mach_thread_np(act_list[v0]);
        print_logical_backtrace_0(0LL, v1);
        ++v0;
      }

      while (v0 < act_listCnt[0]);
      if (act_listCnt[0])
      {
        unint64_t v2 = 0LL;
        do
          mach_port_deallocate(mach_task_self_, act_list[v2++]);
        while (v2 < act_listCnt[0]);
        mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)act_list, 4LL * act_listCnt[0]);
      }
    }

    fflush(__stdoutp);
  }

  *(void *)act_listCnt = 0LL;
  thread_act_array_t act_list = 0LL;
  uint64_t result = __introspection_dispatch_get_queues(3, (mach_vm_address_t *)&act_list, (mach_vm_size_t *)act_listCnt);
  if (result)
  {
    uint64_t v4 = result;
    puts("--------------------------------------------------------------------------------");
    printf("NUMBER OF QUEUES WITH PENDING ITEMS:  %llu\n", v4);
    putchar(10);
    uint64_t v5 = 0LL;
    thread_act_array_t v6 = act_list;
    do
    {
      mach_vm_size_t size = 0LL;
      mach_vm_address_t address = 0LL;
      uint64_t pending_items = __introspection_dispatch_queue_get_pending_items(*((void *)v6 + 1), &address, (uint64_t *)&size);
      printf("QUEUE %p SERIALNUM %llu %s\n", *((const void **)v6 + 1), *((void *)v6 + 2), (const char *)v6 + 32);
      printf( "number of pending items in list: %llu   recorded pending count: %d  running count: %d\n",  pending_items,  v6[7],  v6[6]);
      if (address)
      {
        printf( "pending items array version %u  pending items array entry size %u\n",  *(_DWORD *)address,  *(_DWORD *)(address + 4));
        mach_vm_address_t v8 = address;
        if (pending_items)
        {
          uint64_t v9 = 0LL;
          unsigned int v10 = (const void **)(address + 8);
          do
          {
            printf( "QUEUE %p PENDING ITEM %zu:  item_ref %p  function_or_block %p\n",  *((const void **)v6 + 1),  v9,  *v10,  v10[1]);
            unint64_t v11 = (unint64_t)*v10;
            v10 += 2;
            print_logical_backtrace_0(v11, 0LL);
            ++v9;
          }

          while (pending_items != v9);
          mach_vm_address_t v8 = address;
        }

        mach_vm_deallocate(mach_task_self_, v8, size);
      }

      thread_act_array_t v6 = (thread_act_array_t)((char *)v6 + *v6);
      ++v5;
    }

    while (v5 != v4);
    mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)act_list, *(mach_vm_size_t *)act_listCnt);
    return fflush(__stdoutp);
  }

  return result;
}

void *print_logical_backtrace_0(unint64_t a1, pthread_t a2)
{
  mach_vm_address_t v2 = (mach_vm_address_t)a2;
  mach_vm_size_t v22 = 0LL;
  mach_vm_address_t v23 = 0LL;
  if (a2)
  {
    pthread_threadid_np(a2, &v21);
    uint64_t result = __introspection_dispatch_thread_get_item_info((void *)v21, &v23, &v22);
    if (!v23) {
      return result;
    }
    LOBYTE(v24.dli_fname) = 0;
    pthread_getname_np((pthread_t)v2, (char *)&v24, 0x40uLL);
    puts("================================================================================");
    printf("THREAD WITH ACTIVE ITEM:  ID %llu %s\n", v21, (const char *)&v24);
    mach_vm_address_t v2 = v23;
  }

  BOOL v5 = a1 != 0;
  if (a1 | v2)
  {
    int v6 = 0;
    do
    {
      if (v5)
      {
        __introspection_dispatch_queue_item_get_info((void *)a1, &v23, &v22);
        mach_vm_address_t v2 = v23;
      }

      printf("  LEVEL %d:\n", v6);
      unint64_t v7 = *(const void **)(v2 + 8);
      int v8 = dladdr(v7, &v24);
      dli_sname = v24.dli_sname;
      if (!v8) {
        dli_sname = 0LL;
      }
      if (!dli_sname) {
        dli_sname = (const char *)&unk_66C2;
      }
      printf("    Target function/block %p %s\n", v7, dli_sname);
      mach_vm_address_t v10 = v2 + (unsigned __int16)__introspection_dispatch_item_info_data_offset;
      unint64_t v11 = (const char *)(v10 + 8LL * *(unsigned int *)(v2 + 40));
      int v12 = &v11[strlen(v11) + 1];
      size_t v13 = strlen(v12);
      printf("    Target queue serialnum %llu %s\n", *(void *)(v2 + 32), &v12[v13 + 1]);
      printf("    Enqueuing thread id %llu %s\n", *(void *)(v2 + 16), v11);
      printf("    Enqueuing queue serialnum %llu %s\n", *(void *)(v2 + 24), v12);
      printf("    stop_id %u\n", *(_DWORD *)(v2 + 44));
      if (*(_DWORD *)(v2 + 48)) {
        printf("    repeated_enqueuings_count %u\n", *(_DWORD *)(v2 + 48));
      }
      if (*(_DWORD *)(v2 + 52)) {
        printf("    elided_enqueuings_count %u\n", *(_DWORD *)(v2 + 52));
      }
      if (*(_DWORD *)(v2 + 40))
      {
        unint64_t v14 = 0LL;
        do
        {
          unint64_t v15 = *(const void **)(v10 + 8 * v14);
          int v16 = dladdr(v15, &v24);
          int v17 = v24.dli_sname;
          if (!v16) {
            int v17 = 0LL;
          }
          if (v17) {
            mach_vm_address_t v18 = v17;
          }
          else {
            mach_vm_address_t v18 = (const char *)&unk_66C2;
          }
          else {
            BOOL v19 = 1;
          }
          mach_vm_address_t v20 = (const char *)&unk_66C2;
          if (!v19) {
            mach_vm_address_t v20 = strrchr(v24.dli_fname, 47) + 1;
          }
          printf("    %3d  %p %s (in %s)\n", v14++, v15, v18, v20);
        }

        while (v14 < *(unsigned int *)(v2 + 40));
      }

      a1 = *(void *)v2;
      ++v6;
      mach_vm_deallocate(mach_task_self_, v23, v22);
      mach_vm_address_t v2 = 0LL;
      mach_vm_address_t v23 = 0LL;
      BOOL v5 = 1;
    }

    while (a1);
  }

  return (void *)putchar(10);
}

void get_entry_from_free_list_cold_1()
{
}

void create_backtrace_uniquing_table_cold_1()
{
}