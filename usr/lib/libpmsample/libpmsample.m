void sub_188EFF598(int a1, UInt8 *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFDataRef Value;
  CFDataRef v7;
  CFDataRef v8;
  void v9[5];
  int valuePtr;
  CFRange v11;
  valuePtr = a1;
  v5 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = sub_188EFF688;
  v9[3] = &unk_18A313D60;
  v9[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_18C4F9728, v9);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C4F9730, 0xFFFFFFFFFFFFFFFFLL);
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4F9738, v5);
  if (Value)
  {
    v7 = Value;
    CFRetain(Value);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C4F9730);
    CFRelease(v5);
    v11.location = 0LL;
    v11.length = 40LL;
    CFDataGetBytes(v7, v11, a2);
    v8 = v7;
  }

  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C4F9730);
    v8 = v5;
  }

  CFRelease(v8);
}

uint64_t sub_188EFF688(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    qword_18C759270 = *(void *)(result + 32);
  }

  NStatManagerQueryAllSources();
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C4F9740, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_188EFF6E8(uint64_t a1, int a2)
{
  if (a1)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C4F9730, 0xFFFFFFFFFFFFFFFFLL);
    size_t Count = CFDictionaryGetCount((CFDictionaryRef)qword_18C4F9738);
    v5 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_18C4F9738, 0LL, v5);
    qsort_b(v5, Count, 8uLL, &unk_18A313DA0);
    if (Count)
    {
      uint64_t v6 = 0LL;
      int v7 = 0;
      for (i = 0; i < Count; uint64_t v6 = i)
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v5[v6]);
        if (v7 < a2 && (int v10 = *(_DWORD *)(a1 + 440LL * v7), *(_DWORD *)BytePtr >= v10))
        {
          if (*(_DWORD *)BytePtr != v10)
          {
            ++v7;
            continue;
          }

          v12.location = 0LL;
          v12.length = 40LL;
          CFDataGetBytes((CFDataRef)v5[v6], v12, (UInt8 *)(a1 + 440LL * v7++ + 184));
        }

        else
        {
          CFNumberRef v11 = CFNumberCreate(0LL, kCFNumberIntType, BytePtr);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_18C4F9738, v11);
          CFRelease(v11);
        }

        ++i;
      }
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C4F9730);
    free(v5);
  }
}

uint64_t sub_188EFF870(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  int v4 = *(_DWORD *)CFDataGetBytePtr(*a2);
  return (v4 - *(_DWORD *)CFDataGetBytePtr(*a3));
}

uint64_t sub_188EFF8A8()
{
  qword_18C4F9740 = (uint64_t)dispatch_semaphore_create(0LL);
  qword_18C4F9730 = (uint64_t)dispatch_semaphore_create(1LL);
  qword_18C4F9748 = (uint64_t)dispatch_queue_create("netstats sample queue", 0LL);
  qword_18C4F9728 = (uint64_t)dispatch_queue_create("netstats update queue", 0LL);
  qword_18C4F9738 = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  qword_18C4F9750 = NStatManagerCreate();
  NStatManagerAddAllTCP();
  NStatManagerAddAllUDP();
  NStatManagerQueryAllSources();
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C4F9740, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_188EFF97C()
{
}

uint64_t sub_188EFF990()
{
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C4F9740);
}

uint64_t sub_188EFF99C(int a1, CFTypeRef cf)
{
  return NStatSourceSetDescriptionBlock();
}

void sub_188EFFA68(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v3 = NStatSourceCopyCounts();
  if (v3)
  {
    int v4 = (const __CFDictionary *)v3;
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x189611AC0]);
    if (Value)
    {
      uint64_t v6 = Value;
      int v7 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4F9738, Value);
      if (v7)
      {
        v17.location = 0LL;
        v17.length = 40LL;
        CFDataGetBytes(v7, v17, buffer);
      }

      else
      {
        unint64_t v16 = 0LL;
        *(_OWORD *)buffer = 0u;
        __int128 v15 = 0u;
      }

      CFNumberGetValue(v6, kCFNumberIntType, buffer);
      v8 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x189611AD0]);
      CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > *(void *)&buffer[8]) {
        *(void *)&buffer[8] = valuePtr;
      }
      v9 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x189611AC8]);
      CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > *((void *)&v15 + 1)) {
        *((void *)&v15 + 1) = valuePtr;
      }
      int v10 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x189611AE0]);
      CFNumberGetValue(v10, kCFNumberLongLongType, &valuePtr);
      CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x189611AD8]);
      CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
      if (valuePtr > v16) {
        unint64_t v16 = valuePtr;
      }
      CFDataRef v12 = CFDataCreate(0LL, buffer, 40LL);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_18C4F9730, 0xFFFFFFFFFFFFFFFFLL);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_18C4F9738, v6, v12);
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_18C4F9730);
      CFRelease(v12);
    }

    CFRelease(v4);
  }

void sub_188EFFC28(uint64_t a1)
{
  uint64_t v2 = NStatSourceCopyProperties();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    CFRelease(v3);
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_188EFFC70()
{
}

uint64_t pm_sample_pid_version()
{
  return sub_188EFFC98();
}

uint64_t sub_188EFFC98()
{
  v0 = (char *)MEMORY[0x1895F8858]();
  int v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  CFNumberRef v11 = v0;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  if (v1 == 1) {
    size_t v12 = 408LL;
  }
  else {
    size_t v12 = 440LL;
  }
  bzero(v0, v12);
  *(_DWORD *)CFNumberRef v11 = v6;
  if ((v8 & 1) != 0)
  {
    if ((_DWORD)v6)
    {
      v13 = (char *)proc_pidpath(v6, buffer, 0x1000u);
      if ((int)v13 <= 0)
      {
        v21 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v29 = v6;
        v30 = v13;
        v19 = "proc_pidpath %u failed(%u)\n";
        goto LABEL_30;
      }

      strrchr(buffer, 47);
    }

    __strlcpy_chk();
  }

  if ((v8 & 0x24) != 0)
  {
    p_mach_port_name_t tn = v4;
    if (!v4)
    {
      p_mach_port_name_t tn = &tn;
      uint64_t v22 = task_name_for_pid(*MEMORY[0x1895FBBE0], v6, &tn);
      if ((_DWORD)v22)
      {
        CFRange v17 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v29 = v22;
        v30 = mach_error_string(v22);
        v19 = "task_name_for_pid failed %u %s\n";
        goto LABEL_24;
      }
    }

    uint64_t v38 = 0LL;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    *(_OWORD *)task_info_out = 0u;
    __int128 v33 = 0u;
    mach_msg_type_number_t task_info_outCnt = 26;
    uint64_t v15 = task_info(*p_tn, 0x1Au, task_info_out, &task_info_outCnt);
    uint64_t v16 = v15;
    if (v4)
    {
      if ((_DWORD)v15)
      {
LABEL_13:
        CFRange v17 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v29 = v16;
        v30 = mach_error_string(v16);
LABEL_18:
        v19 = "task_info failed %u %s\n";
LABEL_24:
        v23 = v17;
LABEL_31:
        fprintf(v23, v19, v29, v30);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], *p_tn);
      if ((_DWORD)v16) {
        goto LABEL_13;
      }
    }

    if ((v8 & 4) != 0)
    {
      __int128 v25 = v33;
      *(_OWORD *)(v11 + 132) = *(_OWORD *)task_info_out;
      *(_OWORD *)(v11 + 148) = v25;
      __int128 v26 = v37;
      *(_OWORD *)(v11 + 164) = v34;
      *((_OWORD *)v11 + 23) = v26;
      *((void *)v11 + 48) = v38;
      if ((v8 & 0x20) != 0) {
LABEL_33:
      }
        *((void *)v11 + 42) = v35;
    }

    else if ((v8 & 0x20) != 0)
    {
      goto LABEL_33;
    }
  }

  else
  {
    p_mach_port_name_t tn = v4;
  }

  if (v8 < 0)
  {
    mach_msg_type_number_t task_info_outCnt = 8;
    uint64_t v18 = task_info(*p_tn, 0x19u, (task_info_t)v11 + 56, &task_info_outCnt);
    if ((_DWORD)v18)
    {
      CFRange v17 = (FILE *)*MEMORY[0x1895F89D0];
      uint64_t v29 = v18;
      v30 = mach_error_string(v18);
      goto LABEL_18;
    }
  }

  if ((v8 & 0x16) != 0)
  {
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v55 = 0u;
    memset(v54, 0, sizeof(v54));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    memset(v41, 0, sizeof(v41));
    v20 = (char *)proc_pid_rusage(v6, 6, v41);
    if ((_DWORD)v20)
    {
      v21 = (FILE *)*MEMORY[0x1895F89D0];
      uint64_t v29 = v6;
      v30 = v20;
      v19 = "proc_pid_rusage %u failed(%u)\n";
LABEL_30:
      v23 = v21;
      goto LABEL_31;
    }

    if ((v8 & 4) != 0)
    {
      __int128 v27 = v50;
      *((_OWORD *)v11 + 16) = v49;
      *((_OWORD *)v11 + 17) = v27;
      *((_OWORD *)v11 + 18) = v51;
      *((void *)v11 + 38) = v52;
      if (v2 >= 2)
      {
        __int128 v28 = v55;
        *(_OWORD *)(v11 + 408) = *(_OWORD *)((char *)v54 + 8);
        *(_OWORD *)(v11 + 424) = v28;
      }
    }

    if ((v8 & 0x10) != 0)
    {
      *(_OWORD *)(v11 + 312) = v48;
      *((void *)v11 + 41) = v42;
    }

    if ((v8 & 2) != 0)
    {
      if (!v10) {
        uint64_t v10 = mach_absolute_time();
      }
      *((void *)v11 + 49) = v10 - v44;
    }
  }

  if ((v8 & 8) != 0)
  {
    if (!v10) {
      uint64_t v10 = mach_absolute_time();
    }
    if (qword_18C4F9780 != -1) {
      dispatch_once(&qword_18C4F9780, &unk_18A313F28);
    }
    sub_188EFF598(v6, (UInt8 *)v11 + 184, v10);
  }

  return 0LL;
}

uint64_t pm_sample_pid()
{
  return sub_188EFFC98();
}

uint64_t pm_sample_task_and_pid_version()
{
  return sub_188EFFC98();
}

uint64_t pm_sample_task_and_pid()
{
  return sub_188EFFC98();
}

uint64_t pm_sample_task_version(mach_port_name_t a1)
{
  x[1] = a1;
  if (pid_for_task(a1, x)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return sub_188EFFC98();
  }
}

uint64_t pm_sample_task(mach_port_name_t a1)
{
  return pm_sample_task_version(a1);
}

void *pm_samples_init_version(uint64_t a1)
{
  if (geteuid())
  {
    fwrite("pm_samples_init: Must be run as root!\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    int v2 = __error();
    result = 0LL;
    *int v2 = 13;
  }

  else
  {
    result = malloc(0x20uLL);
    if (result)
    {
      void *result = 0LL;
      result[1] = a1;
      result[2] = 0LL;
      result[3] = 0LL;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = sub_188F00240;
      block[3] = &unk_18A313EE8;
      block[4] = a1;
      if (qword_18C759278 != -1)
      {
        int v4 = result;
        dispatch_once(&qword_18C759278, block);
        return v4;
      }
    }
  }

  return result;
}

uint64_t sub_188F00240(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 32) & 8) != 0 && qword_18C4F9780 != -1) {
    dispatch_once(&qword_18C4F9780, &unk_18A313F28);
  }
  host_priv_t v1 = MEMORY[0x1895D9B50]();
  dword_18C4F9758 = v1;
  if (!v1) {
    abort();
  }
  uint64_t result = host_processor_sets( v1,  (processor_set_name_array_t *)&qword_18C4F9760,  (mach_msg_type_number_t *)&dword_18C4F9768);
  if ((_DWORD)result) {
    sub_188F00320(result, v3, v4, v5, v6, v7, v8, v9, result);
  }
  if (dword_18C4F9768)
  {
    unint64_t v10 = 0LL;
    CFNumberRef v11 = (processor_set_t *)&unk_18C4F976C;
    do
    {
      uint64_t result = host_processor_set_priv(dword_18C4F9758, *(_DWORD *)(qword_18C4F9760 + 4 * v10), v11);
      if ((_DWORD)result) {
        sub_188F008CC(result);
      }
      ++v10;
      ++v11;
    }

    while (v10 < dword_18C4F9768);
  }

  return result;
}

void sub_188F00320( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(__str, 0x400uLL, "host_processor_sets returned %u", &a9);
  qword_18C759238 = (uint64_t)__str;
  abort();
}

void pm_samples_destroy_version(int *a1)
{
  int v2 = (void *)*((void *)a1 + 2);
  if (v2) {
    free(v2);
  }
  if (a1[1] >= 1)
  {
    uint64_t v3 = (void *)*((void *)a1 + 3);
    if (v3) {
      free(v3);
    }
  }

  free(a1);
}

uint64_t pm_samples_num_tasks_version(unsigned int *a1)
{
  return *a1;
}

uint64_t pm_samples_num_tasks(unsigned int *a1)
{
  return *a1;
}

uint64_t pm_samples_get_version(uint64_t a1, unsigned int a2)
{
  else {
    return *(void *)(a1 + 16) + 440LL * a2;
  }
}

uint64_t pm_samples_get(uint64_t a1, unsigned int a2)
{
  else {
    return *(void *)(a1 + 16) + 440LL * a2;
  }
}

void *pm_samples_to_array_version(unsigned int *a1, void *__dst)
{
  return memcpy(__dst, *((const void **)a1 + 2), 440LL * *a1);
}

void *pm_samples_to_array(unsigned int *a1, void *__dst)
{
  return memcpy(__dst, *((const void **)a1 + 2), 440LL * *a1);
}

uint64_t pm_samples_sample_version(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!dword_18C4F9768) {
    sub_188F00904();
  }
  unint64_t v2 = 0LL;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = task_listCnt;
  uint64_t v5 = task_list;
  do
  {
    mach_error_t v6 = processor_set_tasks_with_flavor(dword_18C4F976C[v2], 2u, v5, v4);
    if (v6) {
      sub_188F00950(v6);
    }
    ++v2;
    uint64_t v7 = dword_18C4F9768;
    ++v4;
    ++v5;
  }

  while (v2 < dword_18C4F9768);
  uint64_t v8 = 0LL;
  if (dword_18C4F9768)
  {
    uint64_t v9 = task_listCnt;
    do
    {
      int v10 = *v9++;
      uint64_t v8 = (v10 + v8);
      --v7;
    }

    while (v7);
  }

  if (*(_DWORD *)(a1 + 4) < (int)v8)
  {
    CFNumberRef v11 = *(void **)(a1 + 16);
    if (v11) {
      free(v11);
    }
    size_t v12 = *(void **)(a1 + 24);
    if (v12 && *(_DWORD *)(a1 + 4)) {
      free(v12);
    }
    v13 = malloc(440LL * (int)v8);
    *(void *)(a1 + 16) = v13;
    if (!v13) {
      sub_188F0092C(0LL, v14, v15);
    }
    if (*(void *)(a1 + 24))
    {
      uint64_t v16 = malloc(4LL * (int)v8);
      *(void *)(a1 + 24) = v16;
      if (!v16) {
        sub_188F0092C(0LL, v17, v18);
      }
    }

    *(_DWORD *)(a1 + 4) = v8;
  }

  mach_absolute_time();
  if (dword_18C4F9768)
  {
    unint64_t v19 = 0LL;
    int v20 = 0;
    do
    {
      if (task_listCnt[v19])
      {
        unint64_t v21 = 0LL;
        do
        {
          if ((pm_sample_task_version(task_list[v19][v21]) & 0x80000000) != 0)
          {
            *(_DWORD *)(*(void *)(a1 + 16) + 440LL * v20) = -1;
            uint64_t v8 = (v8 - 1);
            mach_port_deallocate(*MEMORY[0x1895FBBE0], task_list[v19][v21]);
          }

          else
          {
            uint64_t v22 = *(void *)(a1 + 24);
            if (v22)
            {
              *(_DWORD *)(v22 + 4LL * v20) = task_list[v19][v21];
              *(void *)(*(void *)(a1 + 16) + 440LL * v20 + 400) = v22 + 4LL * v20;
            }

            else
            {
              mach_port_deallocate(*MEMORY[0x1895FBBE0], task_list[v19][v21]);
            }

            ++v20;
          }

          ++v21;
          unint64_t v23 = task_listCnt[v19];
        }

        while (v21 < v23);
      }

      else
      {
        unint64_t v23 = 0LL;
      }

      mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)task_list[v19++], 4 * v23);
    }

    while (v19 < dword_18C4F9768);
  }

  qsort_b(*(void **)(a1 + 16), (int)v8, 0x1B8uLL, &unk_18A313F68);
  if ((v3 & 8) != 0) {
    sub_188EFF6E8(*(void *)(a1 + 16), v8);
  }
  *(_DWORD *)a1 = v8;
  return v8;
}

uint64_t pm_samples_sample(uint64_t a1)
{
  return pm_samples_sample_version(a1);
}

void *pm_samples_copy_version(uint64_t a1, const void **a2)
{
  int v4 = *(_DWORD *)a2;
  int v5 = *(_DWORD *)(a1 + 4);
  mach_error_t v6 = *(void **)(a1 + 16);
  if (*(_DWORD *)a2 > v5)
  {
    mach_error_t v6 = realloc(v6, 440LL * v4);
    *(void *)(a1 + 16) = v6;
    if (!v6) {
      sub_188F00988();
    }
    int v4 = *(_DWORD *)a2;
    *(_DWORD *)(a1 + 4) = *(_DWORD *)a2;
  }

  uint64_t result = memcpy(v6, a2[2], 440LL * v4);
  *(_DWORD *)a1 = *(_DWORD *)a2;
  return result;
}

int *pm_samples_delta_version(int *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  int v4 = *(_DWORD *)(a3 + 4);
  if (v4 < 0) {
    sub_188F009B0();
  }
  uint64_t v7 = result;
  int v8 = *result;
  if (v3 > v4)
  {
    uint64_t result = (int *)realloc(*(void **)(a3 + 16), 440LL * v3);
    *(void *)(a3 + 16) = result;
    if (!result) {
      sub_188F009D8();
    }
    *(_DWORD *)(a3 + 4) = v3;
    int v8 = *v7;
  }

  if (v8 >= 1)
  {
    int v9 = 0;
    int v10 = 0;
    do
    {
      uint64_t v11 = *((void *)v7 + 2);
      if (v9 < *(_DWORD *)a2
        && (result = (int *)(v11 + 440LL * v10), int v12 = *(_DWORD *)(*(void *)(a2 + 16) + 440LL * v9), *result >= v12))
      {
        if (*result == v12)
        {
          uint64_t result = (int *)pm_task_subtract_version();
          ++v10;
        }

        ++v9;
      }

      else
      {
        uint64_t result = (int *)memcpy( (void *)(*(void *)(a3 + 16) + 440LL * v10),  (const void *)(v11 + 440LL * v10),  0x1B8uLL);
        ++v10;
      }
    }

    while (v10 < *v7);
  }

  *(_DWORD *)a3 = v3;
  return result;
}

int *pm_samples_delta(int *result, uint64_t a2, uint64_t a3)
{
  return pm_samples_delta_version(result, a2, a3);
}

uint64_t sub_188F00894(uint64_t a1, int *a2, _DWORD *a3)
{
  int v3 = *a2;
  int v4 = *a2 - *a3;
  if (*a3 == -1) {
    int v4 = -1;
  }
  if (v3 == -1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (v3 == *a3) {
    return 0LL;
  }
  else {
    return v5;
  }
}

size_t sub_188F008C0(const void *a1, uint64_t a2, uint64_t a3, FILE *a4)
{
  return fwrite(a1, 0xDuLL, 1uLL, a4);
}

void sub_188F008CC(mach_error_t a1)
{
  host_priv_t v1 = (FILE *)*MEMORY[0x1895F89D0];
  unint64_t v2 = mach_error_string(a1);
  fprintf(v1, "Error in host_processor_set_priv(): %s", v2);
  abort();
}

void sub_188F00904()
{
}

void sub_188F0092C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_188F00950(mach_error_t a1)
{
  host_priv_t v1 = (FILE *)*MEMORY[0x1895F89D0];
  unint64_t v2 = mach_error_string(a1);
  fprintf(v1, "Error in processor_set_tasks_with_flavor(): %s", v2);
  abort();
}

void sub_188F00988()
{
}

void sub_188F009B0()
{
  __assert_rtn("pm_samples_delta_version", "pmsample.c", 469, "delta_samp->max_tasks>=0");
}

void sub_188F009D8()
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

uint64_t NStatManagerAddAllTCP()
{
  return MEMORY[0x189611A70]();
}

uint64_t NStatManagerAddAllUDP()
{
  return MEMORY[0x189611A78]();
}

uint64_t NStatManagerCreate()
{
  return MEMORY[0x189611A80]();
}

uint64_t NStatManagerQueryAllSources()
{
  return MEMORY[0x189611A88]();
}

uint64_t NStatSourceCopyCounts()
{
  return MEMORY[0x189611A90]();
}

uint64_t NStatSourceCopyProperties()
{
  return MEMORY[0x189611A98]();
}

uint64_t NStatSourceQueryDescription()
{
  return MEMORY[0x189611AA0]();
}

uint64_t NStatSourceSetCountsBlock()
{
  return MEMORY[0x189611AA8]();
}

uint64_t NStatSourceSetDescriptionBlock()
{
  return MEMORY[0x189611AB0]();
}

uint64_t NStatSourceSetRemovedBlock()
{
  return MEMORY[0x189611AB8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

kern_return_t host_processor_set_priv( host_priv_t host_priv, processor_set_name_t set_name, processor_set_t *set)
{
  return MEMORY[0x1895FB788](*(void *)&host_priv, *(void *)&set_name, set);
}

kern_return_t host_processor_sets( host_priv_t host_priv, processor_set_name_array_t *processor_sets, mach_msg_type_number_t *processor_setsCnt)
{
  return MEMORY[0x1895FB790](*(void *)&host_priv, processor_sets, processor_setsCnt);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1895FC788](*(void *)&t, x);
}

uint64_t pm_task_subtract_version()
{
  return MEMORY[0x189616B08]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1895FC8D0](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

kern_return_t processor_set_tasks_with_flavor( processor_set_t processor_set, mach_task_flavor_t flavor, task_array_t *task_list, mach_msg_type_number_t *task_listCnt)
{
  return MEMORY[0x1895FC928](*(void *)&processor_set, *(void *)&flavor, task_list, task_listCnt);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1895FD338](*(void *)&target_tport, *(void *)&pid, tn);
}