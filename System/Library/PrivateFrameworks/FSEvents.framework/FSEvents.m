uint64_t fsevent_default_log()
{
  if (fsevent_default_log_once != -1) {
    dispatch_once(&fsevent_default_log_once, &__block_literal_global);
  }
  return fsevent_default_log_logger;
}

os_log_t __fsevent_default_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.fsevents", "client");
  fsevent_default_log_logger = (uint64_t)result;
  return result;
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  if (!streamRef)
  {
    v4 = (os_log_s *)fsevent_default_log();
    BOOL v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    FSEventStreamStart_cold_1();
    goto LABEL_20;
  }

  if (*((_BYTE *)streamRef + 188))
  {
    v2 = (os_log_s *)fsevent_default_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    FSEventStreamStart_cold_3();
    goto LABEL_20;
  }

  if (!*((void *)streamRef + 27) && !*((void *)streamRef + 45))
  {
    v8 = (os_log_s *)fsevent_default_log();
    BOOL v3 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    FSEventStreamStart_cold_2();
    goto LABEL_20;
  }

  int v5 = *((_DWORD *)streamRef + 46);
  if ((v5 & 4) != 0 && !*((void *)streamRef + 54) && !*((void *)streamRef + 52) && !*((void *)streamRef + 53))
  {
LABEL_20:
    LOBYTE(v3) = 0;
    return v3;
  }

  if (!*((_DWORD *)streamRef + 49))
  {
    if (!register_with_server( (uint64_t)streamRef,  (uint64_t)"FSEventStreamStart",  *((_DWORD *)streamRef + 48),  *((_DWORD *)streamRef + 16),  *((_DWORD *)streamRef + 18),  *((const void ***)streamRef + 10),  *((void *)streamRef + 21),  *((void *)streamRef + 22),  v5,  (_DWORD *)streamRef + 49))
    {
      *((_BYTE *)streamRef + 188) = 1;
      if (*((void *)streamRef + 27))
      {
        context.version = 0LL;
        context.info = streamRef;
        context.retain = (const void *(__cdecl *)(const void *))_FSEventStreamRetainAndReturnSelf;
        context.release = (void (__cdecl *)(const void *))FSEventStreamRelease;
        context.copyDescription = (CFStringRef (__cdecl *)(const void *))FSEventStreamCopyDescription;
        v9 = CFMachPortCreateWithPort( 0LL,  *((_DWORD *)streamRef + 49),  (CFMachPortCallBack)FSEventsClientPortCallback,  &context,  0LL);
        *((void *)streamRef + 26) = v9;
        CFMachPortSetInvalidationCallBack(v9, (CFMachPortInvalidationCallBack)server_gone_callback);
      }

      else
      {
        v10 = (dispatch_object_s *)*((void *)streamRef + 45);
        if (v10)
        {
          resume_source(v10, (int *)streamRef + 92);
        }
      }

      goto LABEL_14;
    }

    goto LABEL_20;
  }

LABEL_14:
  v6 = (__CFFileDescriptor *)*((void *)streamRef + 52);
  if (v6) {
    CFFileDescriptorEnableCallBacks(v6, 1uLL);
  }
  v7 = (dispatch_object_s *)*((void *)streamRef + 54);
  if (v7) {
    resume_source(v7, (int *)streamRef + 110);
  }
  LOBYTE(v3) = 1;
  return v3;
}

        free(v10);
      }
    }

    syslog(2, "dev %d (%s) : purging events up to event id %lld", dev, v17, eventId);
    if (f2d_purge_events_for_device_up_to_event_id_rpc(FSEvents_f2d_public_port, dev, eventId, &v16))
    {
      v14 = (os_log_s *)fsevent_default_log();
      int v5 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        FSEventsPurgeEventsForDeviceUpToEventId_cold_1();
        LOBYTE(v5) = 0;
      }
    }

    else
    {
      LOBYTE(v5) = v16 == 0;
    }
  }

  return v5;
}

uint64_t register_with_server( uint64_t a1, uint64_t a2, int a3, int a4, int a5, const void **a6, uint64_t a7, uint64_t a8, int a9, _DWORD *a10)
{
  uint64_t v17 = FSEvents_connect();
  if ((_DWORD)v17) {
    return v17;
  }
  uint64_t v70 = a7;
  v19 = (int *)malloc(4LL * a5);
  if (v19)
  {
    v20 = v19;
    v21 = malloc(4LL * a5);
    if (v21)
    {
      uint64_t v68 = a8;
      int v65 = a3;
      int v66 = a4;
      uint64_t v69 = (uint64_t)v21;
      uint64_t v22 = a5;
      if (a5 < 1)
      {
        int v23 = 0;
      }

      else
      {
        int v23 = 0;
        uint64_t v24 = a5;
        v25 = (const char **)a6;
        v26 = v20;
        do
        {
          v27 = *v25++;
          int v28 = strlen(v27);
          *v26++ = v28;
          v23 += v28;
          --v24;
        }

        while (v24);
      }

      int v31 = v23 + a5;
      v32 = (char *)malloc(v23 + a5);
      v33 = (_DWORD *)v69;
      if (!v32)
      {
        v47 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          register_with_server_cold_3();
        }
        v48 = 0LL;
        v49 = 0LL;
        uint64_t v17 = 4294967293LL;
        goto LABEL_48;
      }

      int v67 = v31;
      v64 = v20;
      int v34 = 0;
      if (a5 >= 1)
      {
        do
        {
          *v33++ = v34;
          int v35 = *v20++;
          int v36 = v35 + 1;
          v37 = *a6++;
          memcpy(&v32[v34], v37, v36);
          v34 += v36;
          --v22;
        }

        while (v22);
      }

      BOOL v38 = v34 == v67;
      int v39 = v67;
      if (!v38)
      {
        v40 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          register_with_server_cold_7();
        }
      }

      uint64_t v41 = *(void *)(a1 + 96);
      v20 = v64;
      uint64_t v42 = v68;
      if (v41)
      {
        if (v41 < 1)
        {
          size_t v43 = 0LL;
        }

        else
        {
          size_t v43 = 0LL;
          v44 = (const char **)(a1 + 104);
          uint64_t v45 = *(void *)(a1 + 96);
          do
          {
            v46 = *v44++;
            v43 += strlen(v46) + 1;
            --v45;
          }

          while (v45);
        }

        v50 = malloc(4 * v41);
        if (!v50)
        {
          v58 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            register_with_server_cold_5();
          }
          v48 = 0LL;
          v49 = 0LL;
          uint64_t v17 = 4294967292LL;
          v33 = (_DWORD *)v69;
          goto LABEL_48;
        }

        v48 = v50;
        int v63 = a5;
        v51 = (char *)malloc(v43);
        if (!v51)
        {
          v59 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            register_with_server_cold_6();
          }
          v49 = 0LL;
          uint64_t v17 = 4294967291LL;
          v33 = (_DWORD *)v69;
          goto LABEL_48;
        }

        v49 = v51;
        if (v41 < 1)
        {
          int v39 = v67;
        }

        else
        {
          uint64_t v52 = 0LL;
          int v53 = 0;
          v54 = v48;
          uint64_t v55 = a1 + 104;
          do
          {
            v54[v52] = v53;
            size_t v56 = strlen(*(const char **)(v55 + 8 * v52));
            int v57 = v56 + 1;
            memcpy(&v49[v53], *(const void **)(v55 + 8 * v52), v56 + 1);
            v53 += v57;
            ++v52;
          }

          while (v41 != v52);
          v20 = v64;
          uint64_t v42 = v68;
          int v39 = v67;
          v48 = v54;
        }
      }

      else
      {
        int v63 = a5;
        v49 = 0LL;
        v48 = 0LL;
        LODWORD(v43) = 0;
      }

      int v62 = v41;
      int v61 = v41;
      v33 = (_DWORD *)v69;
      uint64_t v17 = f2d_register_rpc( FSEvents_f2d_public_port,  v65,  v66,  v63,  v69,  v63,  (uint64_t)v32,  v39,  v61,  (uint64_t)v48,  v62,  (uint64_t)v49,  v43,  v42,  a9,  v70,  a10);
      if ((_DWORD)v17)
      {
        v60 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          register_with_server_cold_4();
        }
      }

LABEL_48:
      free(v20);
      free(v33);
      if (v32) {
        free(v32);
      }
      if (v48) {
        free(v48);
      }
      if (v49) {
        free(v49);
      }
      return v17;
    }

    v30 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      register_with_server_cold_2();
    }
    free(v20);
    return 4294967294LL;
  }

  else
  {
    v29 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      register_with_server_cold_1();
    }
    return 0xFFFFFFFFLL;
  }
}

unsigned int *_FSEventStreamRetainAndReturnSelf(unsigned int *a1)
{
  if (a1)
  {
    do
      unsigned int v2 = __ldaxr(a1);
    while (__stlxr(v2 + 1, a1));
  }

  else
  {
    BOOL v3 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamRetainAndReturnSelf_cold_1();
    }
  }

  return a1;
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    do
    {
      unsigned int v1 = __ldaxr((unsigned int *)streamRef);
      BOOL v2 = __OFSUB__(v1, 1);
      signed int v3 = v1 - 1;
    }

    while (__stlxr(v3, (unsigned int *)streamRef));
    if ((v3 < 0) ^ v2 | (v3 == 0))
    {
      if ((*(_DWORD *)streamRef & 0x80000000) != 0)
      {
        int v5 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          FSEventStreamRelease_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
        }
      }

      else
      {
        _FSEventStreamDeallocate((char *)streamRef);
      }
    }
  }

  else
  {
    v4 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      FSEventStreamRelease_cold_1();
    }
  }

CFStringRef FSEventStreamCopyDescription(ConstFSEventStreamRef streamRef)
{
  if (!streamRef)
  {
    uint64_t v17 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyDescription_cold_1();
    }
    return 0LL;
  }

  BOOL v2 = (char *)malloc((*((_DWORD *)streamRef + 18) << 10) + 1024);
  if (!v2)
  {
    v18 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyDescription_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0LL;
  }

  signed int v3 = v2;
  v4 = &v2[sprintf(v2, "FSEventStreamRef @ %p:\n", streamRef)];
  int v5 = &v4[sprintf(v4, "   allocator = %p\n", *((const void **)streamRef + 1))];
  uint64_t v6 = &v5[sprintf(v5, "   callback = %p\n", *((const void **)streamRef + 2))];
  v7 = &v6[sprintf( v6,  "   CFMachPortContext context = {%lu, %p, %p, %p, %p}\n",  *((void *)streamRef + 3),  *((const void **)streamRef + 4),  *((const void **)streamRef + 5),  *((const void **)streamRef + 6),  *((const void **)streamRef + 7))];
  uint64_t v8 = &v7[sprintf(v7, "   numPathsToWatch = %lu\n", *((void *)streamRef + 9))];
  uint64_t v9 = &v8[sprintf(v8, "   pathsToWatch = %p\n", *((const void **)streamRef + 10))];
  if (*((uint64_t *)streamRef + 9) >= 1)
  {
    uint64_t v10 = 0LL;
    do
    {
      v9 += sprintf( v9,  "        pathsToWatch[%d] = '%s'\n",  v10,  *(const char **)(*((void *)streamRef + 10) + 8 * v10));
      ++v10;
    }

    while (*((void *)streamRef + 9) > v10);
  }

  uint64_t v11 = &v9[sprintf(v9, "   latestEventId = %lld\n", *((void *)streamRef + 21))];
  uint64_t v12 = &v11[sprintf(v11, "   latency = %llu (microseconds)\n", *((void *)streamRef + 22))];
  v13 = &v12[sprintf(v12, "   flags = 0x%08x\n", *((_DWORD *)streamRef + 46))];
  int v14 = sprintf(v13, "\trunLoop = %p\n", *((const void **)streamRef + 28));
  sprintf(&v13[v14], "\trunLoopMode = %p\n", *((const void **)streamRef + 29));
  v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v3, 0x8000100u);
  free(v3);
  return v15;
}

void FSEventsClientPortCallback()
{
  v0 = (os_log_s *)fsevent_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    FSEventsClientPortCallback_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void server_gone_callback(uint64_t a1, uint64_t a2)
{
}

BOOL create_f2d_private_port_source(uint64_t a1)
{
  uintptr_t v2 = *(unsigned int *)(a1 + 196);
  uint64_t v3 = dispatch_source_create(MEMORY[0x1895F8B48], v2, 1uLL, *(dispatch_queue_t *)(a1 + 352));
  if (v3)
  {
    FSEventStreamRetain((FSEventStreamRef)a1);
    dispatch_set_qos_class_fallback();
    uint64_t v4 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __create_f2d_private_port_source_block_invoke;
    handler[3] = &__block_descriptor_tmp_52;
    handler[4] = a1;
    dispatch_source_set_event_handler(v3, handler);
    v6[0] = v4;
    v6[1] = 0x40000000LL;
    v6[2] = __create_f2d_private_port_source_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_53;
    int v7 = v2;
    v6[4] = v3;
    v6[5] = a1;
    dispatch_source_set_cancel_handler(v3, v6);
    *(void *)(a1 + 376) = v3;
    *(_DWORD *)(a1 + 384) = 1;
  }

  return v3 != 0LL;
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    if (*((_BYTE *)streamRef + 188))
    {
      if (*((_DWORD *)streamRef + 49))
      {
        uintptr_t v2 = (dispatch_object_s *)*((void *)streamRef + 45);
        if (v2 && *((_DWORD *)streamRef + 92) == 3)
        {
          dispatch_suspend(v2);
          *((_DWORD *)streamRef + 92) = 2;
        }

        uint64_t v3 = *((void *)streamRef + 47);
        if (v3)
        {
          cancel_source((dispatch_object_s **)streamRef + 47, (int *)streamRef + 96);
          *((_DWORD *)streamRef + 49) = 0;
        }

        uint64_t v4 = (__CFMachPort *)*((void *)streamRef + 26);
        if (v4)
        {
          CFMachPortSetInvalidationCallBack(v4, 0LL);
          CFMachPortInvalidate(*((CFMachPortRef *)streamRef + 26));
          CFRelease(*((CFTypeRef *)streamRef + 26));
          *((void *)streamRef + 26) = 0LL;
        }

        if (!v3)
        {
          dispose_f2d_private_port(*((_DWORD *)streamRef + 49));
          *((_DWORD *)streamRef + 49) = 0;
        }

        uint64_t v5 = (__CFFileDescriptor *)*((void *)streamRef + 52);
        if (v5) {
          CFFileDescriptorDisableCallBacks(v5, 1uLL);
        }
        uint64_t v6 = (dispatch_object_s *)*((void *)streamRef + 54);
        if (v6)
        {
          if (*((_DWORD *)streamRef + 110) == 3)
          {
            dispatch_suspend(v6);
            *((_DWORD *)streamRef + 110) = 2;
          }
        }

        *((_BYTE *)streamRef + 188) = 0;
      }

      else
      {
        uint64_t v8 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          FSEventStreamStop_cold_2();
        }
      }
    }
  }

  else
  {
    int v7 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FSEventStreamStop_cold_1();
    }
  }

void dispose_f2d_private_port(mach_port_name_t a1)
{
  kern_return_t v3;
  mach_error_t v4;
  os_log_s *v5;
  if (a1)
  {
    if (f2d_unregister_rpc(a1))
    {
      uintptr_t v2 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        dispose_f2d_private_port_cold_2();
      }
    }

    else
    {
      uint64_t v3 = mach_port_deallocate(*MEMORY[0x1895FBBE0], a1);
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          dispose_f2d_private_port_cold_1(v4);
        }
      }
    }
  }

uint64_t implementation_callback_rpc( int a1, uint64_t a2, uint64_t a3, int a4, _BYTE *a5, int a6, __CFArray *a7, int a8, char *a9, int a10)
{
  uint64_t v15 = a2;
  uint64_t v239 = *MEMORY[0x1895F89C0];
  int valuePtr = a1;
  if ((_DWORD)a2 != a4)
  {
    v16 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_18();
    }
  }

  if ((_DWORD)v15 != a6)
  {
    uint64_t v17 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_17();
    }
  }

  if ((_DWORD)v15 == a8 || (v18 = (os_log_s *)fsevent_default_log(), !os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)))
  {
    if ((_DWORD)v15) {
      goto LABEL_10;
    }
LABEL_89:
    v105 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_1(v105, v106, v107, v108, v109, v110, v111, v112);
    }
    return 4294967278LL;
  }

  implementation_callback_rpc_cold_16();
  if (!(_DWORD)v15) {
    goto LABEL_89;
  }
LABEL_10:
  uint64_t v19 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  if (!v20)
  {
    int v36 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_2(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    return 4294967279LL;
  }

  CFNumberRef v21 = v20;
  pthread_mutex_lock(&FSEvents_streamDict_mutex);
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)FSEvents_streamDict, v21);
  pthread_mutex_unlock(&FSEvents_streamDict_mutex);
  CFRelease(v21);
  if (!Value)
  {
    uint64_t v45 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_3(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    return 4294967286LL;
  }

  *(void *)&__int128 v224 = a3;
  uint64_t v23 = 0LL;
  int v24 = 0;
  LODWORD(v25) = 0;
  LODWORD(v229) = a10;
  v228 = a9;
  do
  {
    unsigned int v26 = *(_DWORD *)&a5[v23];
    int v27 = (v26 >> 29) | 4;
    if ((v26 & 0x80000000) == 0) {
      int v27 = (v26 >> 29) & 3;
    }
    int v28 = (v26 << 8) & 0x1000;
    if ((v26 & 0x20) != 0) {
      int v28 = 4096;
    }
    int8x16_t v29 = vandq_s8( (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v26), (uint32x4_t)xmmword_1874E22D0),  (int8x16_t)xmmword_1874E22E0);
    int8x8_t v30 = vorr_s8(*(int8x8_t *)v29.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
    unsigned __int32 v31 = v30.i32[0] | v26 & 0x100000 | v30.i32[1] | (v26 >> 4) & 0x40000 | (((v26 >> 19) & 1) << 21) | (v26 << 8) & 0x400F00 | v28 | v27;
    if ((v26 & 0x40) != 0) {
      v31 |= 0xA000u;
    }
    int v32 = (v26 << 6) & 0x8000;
    if ((v26 & 0x400) != 0) {
      int v32 = 0x8000;
    }
    *(_DWORD *)&a5[v23] = (v26 >> 2) & 0x80000 | (((v26 >> 8) & 1) << 14) | (((v26 >> 7) & 1) << 8) | v32 | v31;
    if ((v31 & 6) != 0)
    {
      int v33 = *((_DWORD *)Value + 18);
      int v24 = 1;
    }

    else
    {
      int v33 = 1;
    }

    size_t v25 = (v33 + v25);
    v23 += 4LL;
  }

  while (4LL * v15 != v23);
  int v34 = *((_DWORD *)Value + 46);
  if ((v34 & 0x40) != 0)
  {
    int v35 = calloc(v25, 8uLL);
    if ((*((_DWORD *)Value + 46) & 0x100) != 0) {
      goto LABEL_27;
    }
LABEL_35:
    v227 = 0LL;
    goto LABEL_36;
  }

  int v35 = 0LL;
  if ((v34 & 0x100) == 0) {
    goto LABEL_35;
  }
LABEL_27:
  v227 = calloc(v25, 4uLL);
LABEL_36:
  if ((_DWORD)v15 == 1 && (*a5 & 0x10) != 0)
  {
    if (!Value[190]) {
      return 0LL;
    }
    Value[190] = 0;
  }

  if (!Value[188]) {
    return 4294966297LL;
  }
  v226 = (const char **)malloc(8LL * v25);
  if (!v226)
  {
    v85 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_4(v85, v86, v87, v88, v89, v90, v91, v92);
    }
    v93 = 0LL;
    uint64_t v44 = 4294967285LL;
    goto LABEL_222;
  }

  int64_t v218 = v15;
  int v53 = calloc(v25, 4uLL);
  v222 = v53;
  if (!v53)
  {
    v94 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_5(v94, v95, v96, v97, v98, v99, v100, v101);
    }
    v102 = 0LL;
    CFArrayRef v103 = 0LL;
    v104 = 0LL;
    int v57 = 0LL;
    v60 = 0LL;
    uint64_t v44 = 4294967285LL;
    goto LABEL_205;
  }

  uint64_t v55 = v53;
  if (!v24)
  {
    if (!(_DWORD)v25)
    {
      v60 = a7;
      int v57 = a5;
      goto LABEL_133;
    }

    v223 = a7;
    uint64_t v216 = v15;
    CFAllocatorRef v220 = v19;
    LODWORD(v217) = 0;
    v113 = v35;
    v114 = (int *)(v224 + 4);
    *(void *)&__int128 v54 = 136315394LL;
    __int128 v224 = v54;
    v115 = v226;
    v116 = v227;
    size_t v117 = v25;
    v225 = v113;
    unsigned int v118 = v229;
    while (1)
    {
      if (*(v114 - 1) >= v118)
      {
        v119 = (os_log_s *)fsevent_default_log();
        BOOL v120 = os_log_type_enabled(v119, OS_LOG_TYPE_ERROR);
        unsigned int v118 = v229;
        if (v120)
        {
          *(_DWORD *)buf = v224;
          v236 = "implementation_callback_rpc";
          __int16 v237 = 2080;
          v238 = "path_offsets[i] < paths_blobCnt";
          _os_log_error_impl(&dword_1874D7000, v119, OS_LOG_TYPE_ERROR, "%s(): failed assertion '%s'\n", buf, 0x16u);
          unsigned int v118 = v229;
        }
      }

      uint64_t v121 = *(v114 - 1);
      else {
        v122 = &v228[v121];
      }
      *v115 = v122;
      if (v225)
      {
        int v123 = strlen(v122);
        unsigned int v118 = v229;
        int v124 = (int)v229;
        if ((_DWORD)v25 != 1)
        {
          int v124 = (int)v229;
          if ((_DWORD)v117 != 1) {
            int v124 = *v114;
          }
        }

        int v125 = v121 + v123 + 1;
        if (v125 == v124)
        {
          uint64_t v126 = 0LL;
        }

        else
        {
          uint64_t v126 = *(void *)&v228[v125];
        }

        void *v113 = v126;
      }

LABEL_110:
      if (v227)
      {
        int v127 = strlen(v122);
        unsigned int v118 = v229;
        int v128 = (int)v229;
        if ((_DWORD)v25 != 1)
        {
          int v128 = (int)v229;
          if ((_DWORD)v117 != 1) {
            int v128 = *v114;
          }
        }

        int v129 = v121 + v127 + 9;
        if (v129 == v128)
        {
          int v130 = 0;
LABEL_118:
          _DWORD *v116 = v130;
          goto LABEL_119;
        }

        if (v129 + 4LL <= (unint64_t)v128)
        {
          int v130 = *(_DWORD *)&v228[v129];
          goto LABEL_118;
        }
      }

LABEL_119:
      ++v116;
      ++v113;
      ++v114;
      ++v115;
      if (!--v117)
      {
        uint64_t v55 = v222;
        v60 = v223;
        int v57 = a5;
LABEL_128:
        int v24 = (int)v217;
        int v35 = v225;
        uint64_t v19 = v220;
        LODWORD(v15) = v216;
        goto LABEL_133;
      }
    }
  }

  v223 = a7;
  size_t v56 = malloc(4 * v25);
  if (!v56)
  {
    v132 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_13(v132, v133, v134, v135, v136, v137, v138, v139);
    }
    v102 = 0LL;
    CFArrayRef v103 = 0LL;
    v104 = 0LL;
    int v57 = 0LL;
    v60 = 0LL;
    uint64_t v44 = 4294967281LL;
    goto LABEL_205;
  }

  int v57 = v56;
  v58 = (__CFArray *)malloc(8LL * v25);
  if (!v58)
  {
    v140 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_14(v140, v141, v142, v143, v144, v145, v146, v147);
    }
    v102 = 0LL;
    CFArrayRef v103 = 0LL;
    v104 = 0LL;
    v60 = 0LL;
    uint64_t v44 = 4294967280LL;
    goto LABEL_205;
  }

  v60 = v58;
  CFAllocatorRef v220 = v19;
  v225 = v35;
  LODWORD(v217) = v24;
  uint64_t v61 = v15;
  uint64_t v62 = 0LL;
  unsigned int v63 = 0;
  uint64_t v216 = v61;
  else {
    uint64_t v64 = v61;
  }
  *(void *)&__int128 v59 = 136315394LL;
  __int128 v215 = v59;
  unsigned int v65 = v229;
  *(void *)&__int128 v219 = v64;
  do
  {
    int v66 = *(_DWORD *)&a5[4 * v62];
    uint64_t v67 = *((void *)v223 + v62);
    if ((v66 & 6) == 0)
    {
      unsigned int v71 = *(_DWORD *)(v224 + 4 * v62);
      LODWORD(v221) = v63;
      if (v71 >= v65)
      {
        v72 = (os_log_s *)fsevent_default_log();
        BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
        unsigned int v63 = v221;
        unsigned int v65 = v229;
        if (v73)
        {
          *(_DWORD *)buf = v215;
          v236 = "implementation_callback_rpc";
          __int16 v237 = 2080;
          v238 = "path_offsets[i] < paths_blobCnt";
          _os_log_error_impl(&dword_1874D7000, v72, OS_LOG_TYPE_ERROR, "%s(): failed assertion '%s'\n", buf, 0x16u);
          unsigned int v63 = v221;
          unsigned int v65 = v229;
        }
      }

      uint64_t v74 = *(unsigned int *)(v224 + 4 * v62);
      v75 = &v228[v74];
      uint64_t v76 = v63;
      v226[v63] = v75;
      if (v225)
      {
        int v77 = strlen(v226[v62]);
        unsigned int v65 = v229;
        int v78 = (int)v229;
        if ((_DWORD)v25 != 1)
        {
          int v78 = (int)v229;
          if (v62 != v25) {
            int v78 = *(_DWORD *)(v224 + 4 * v62 + 4);
          }
        }

        int v79 = v74 + v77 + 1;
        unsigned int v63 = v221;
        if (v79 == v78)
        {
          uint64_t v80 = 0LL;
        }

        else
        {
          uint64_t v80 = *(void *)&v228[v79];
        }

        v225[v76] = v80;
      }

LABEL_69:
      if (v227)
      {
        int v81 = strlen(v226[v62]);
        unsigned int v65 = v229;
        int v82 = (int)v229;
        if ((_DWORD)v25 != 1)
        {
          int v82 = (int)v229;
          if (v62 != v25) {
            int v82 = *(_DWORD *)(v224 + 4 * v62 + 4);
          }
        }

        int v83 = v74 + v81 + 9;
        unsigned int v63 = v221;
        if (v83 == v82)
        {
          int v84 = 0;
LABEL_77:
          v227[v76] = v84;
          goto LABEL_78;
        }

        if (v83 + 4LL <= (unint64_t)v82)
        {
          int v84 = *(_DWORD *)&v228[v83];
          goto LABEL_77;
        }
      }

LABEL_78:
      v57[v76] = v66;
      *((void *)v60 + v76) = v67;
      ++v63;
      uint64_t v55 = v222;
      uint64_t v64 = v219;
      goto LABEL_79;
    }

    if (*((uint64_t *)Value + 9) >= 1)
    {
      uint64_t v68 = 0LL;
      uint64_t v69 = v226;
      do
      {
        uint64_t v70 = *((void *)Value + 11);
        (&v69[v63])[v68] = *(const char **)(*((void *)Value + 10) + 8 * v68);
        v55[v63 + v68] = *(_DWORD *)(v70 + 4 * v68);
        v57[v63 + v68] = v66 | 1;
        *((void *)v60 + v63 + v68++) = v67;
      }

      while (*((void *)Value + 9) > v68);
      v63 += v68;
    }

LABEL_79:
    ++v62;
  }

  while (v62 != v64);
  if (v63 == (_DWORD)v25) {
    goto LABEL_128;
  }
  v131 = (os_log_s *)fsevent_default_log();
  int v24 = (int)v217;
  int v35 = v225;
  LODWORD(v15) = v216;
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
    implementation_callback_rpc_cold_15();
  }
  uint64_t v55 = v222;
  uint64_t v19 = v220;
LABEL_133:
  uint64_t v148 = 0LL;
  unint64_t v149 = *((void *)Value + 21);
  if (v149 == -1LL) {
    unint64_t v149 = 0LL;
  }
  else {
    unsigned int v150 = v15;
  }
  uint64_t v151 = 8LL * v150;
  do
  {
    v148 += 8LL;
  }

  while (v151 != v148);
  *((void *)Value + 21) = v149;
  int v152 = *((_DWORD *)Value + 46);
  if ((v152 & 0x40) == 0)
  {
    if ((v152 & 1) == 0)
    {
      v104 = 0LL;
      goto LABEL_167;
    }

    v175 = (const void **)calloc(v25, 8uLL);
    if (!v175)
    {
      v196 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR)) {
        implementation_callback_rpc_cold_6(v196, v197, v198, v199, v200, v201, v202, v203);
      }
      v102 = 0LL;
      CFArrayRef v103 = 0LL;
      v104 = 0LL;
      uint64_t v44 = 4294967284LL;
      goto LABEL_205;
    }

    v102 = v175;
    v225 = v35;
    if ((_DWORD)v25)
    {
      uint64_t v176 = 0LL;
      while (1)
      {
        v177 = caller_path(v226[v176], v55[v176]);
        CFStringRef v178 = CFStringCreateWithFileSystemRepresentation(v19, v177);
        if (!v178) {
          break;
        }
        v102[v176++] = v178;
        if (v25 == v176) {
          goto LABEL_182;
        }
      }

      v204 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR)) {
        implementation_callback_rpc_cold_8();
      }
      CFArrayRef v103 = 0LL;
      v104 = 0LL;
      uint64_t v44 = 4294967283LL;
      int v35 = v225;
      goto LABEL_205;
    }

LABEL_182:
    CFArrayRef v179 = CFArrayCreate(v19, v102, v25, MEMORY[0x189605228]);
    if (v179)
    {
      CFArrayRef v103 = v179;
      v104 = 0LL;
      int v35 = v225;
LABEL_168:
      if (*((void *)Value + 2) && Value[188] && !Value[189])
      {
        FSEventStreamRetain((FSEventStreamRef)Value);
        int v167 = *((_DWORD *)Value + 46);
        if ((v167 & 0x40) != 0)
        {
          (*((void (**)(char *, void, size_t, __CFArray *, _DWORD *, __CFArray *))Value + 2))( Value,  *((void *)Value + 4),  v25,  v104,  v57,  v60);
        }

        else if ((v167 & 1) != 0)
        {
          (*((void (**)(char *, void, size_t, CFArrayRef, _DWORD *, __CFArray *))Value + 2))( Value,  *((void *)Value + 4),  v25,  v103,  v57,  v60);
        }

        else
        {
          v223 = v104;
          v225 = v35;
          LODWORD(v217) = v24;
          v228 = (char *)&v215;
          MEMORY[0x1895F8858]();
          v229 = (__CFDictionary *)((char *)&v215 - ((v168 + 15) & 0xFFFFFFFF0LL));
          if ((_DWORD)v25)
          {
            size_t v169 = v25;
            v170 = v229;
            v171 = v222;
            v172 = v226;
            do
            {
              v174 = *v172++;
              v173 = v174;
              LODWORD(v174) = *v171++;
              *(void *)v170 = caller_path(v173, (char)v174);
              v170 = (__CFDictionary *)((char *)v170 + 8);
              --v169;
            }

            while (v169);
          }

          (*((void (**)(char *, void, size_t, __CFDictionary *, _DWORD *, __CFArray *))Value + 2))( Value,  *((void *)Value + 4),  v25,  v229,  v57,  v60);
          int v24 = (int)v217;
          int v35 = v225;
          v104 = v223;
        }

        if (*((void *)Value + 45))
        {
          pthread_mutex_lock((pthread_mutex_t *)(Value + 240));
          pthread_cond_signal((pthread_cond_t *)(Value + 304));
          pthread_mutex_unlock((pthread_mutex_t *)(Value + 240));
        }

        FSEventStreamRelease((FSEventStreamRef)Value);
      }

      uint64_t v44 = 0LL;
      goto LABEL_205;
    }

    v205 = (os_log_s *)fsevent_default_log();
    int v35 = v225;
    if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_7(v205, v206, v207, v208, v209, v210, v211, v212);
    }
LABEL_187:
    CFArrayRef v103 = 0LL;
    v104 = 0LL;
    uint64_t v44 = 4294967282LL;
    goto LABEL_205;
  }

  CFMutableArrayRef Mutable = CFArrayCreateMutable(v19, v218, MEMORY[0x189605228]);
  if (!Mutable)
  {
    v180 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR)) {
      implementation_callback_rpc_cold_9(v180, v181, v182, v183, v184, v185, v186, v187);
    }
    v102 = 0LL;
    goto LABEL_187;
  }

  v104 = Mutable;
  if (!(_DWORD)v25)
  {
LABEL_167:
    CFArrayRef v103 = 0LL;
    v102 = 0LL;
    goto LABEL_168;
  }

  CFAllocatorRef v220 = v19;
  CFIndex v155 = 0LL;
  int64_t v218 = (int64_t)&v234;
  v217 = &v232;
  *(void *)&__int128 v154 = 136315394LL;
  __int128 v219 = v154;
  v228 = (char *)v35;
  v223 = Mutable;
  *(void *)&__int128 v224 = v227;
  v225 = v35;
  while (1)
  {
    v156 = v226[v155];
    int v157 = v222[v155];
    v229 = CFDictionaryCreateMutable(v220, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    if (!v229) {
      break;
    }
    v158 = caller_path(v156, v157);
    CFStringRef v159 = CFStringCreateWithFileSystemRepresentation(v220, v158);
    if (v159)
    {
      CFStringRef v160 = v159;
      CFDictionaryAddValue(v229, @"path", v159);
      CFRelease(v160);
      int v35 = v225;
      v104 = v223;
    }

    else
    {
      os_log_t v221 = (os_log_t)fsevent_default_log();
      int v35 = v225;
      v104 = v223;
      if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v219;
        v236 = "implementation_callback_rpc";
        __int16 v237 = 2080;
        v238 = v158;
        _os_log_error_impl( &dword_1874D7000,  v221,  OS_LOG_TYPE_ERROR,  "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed",  buf,  0x16u);
      }
    }

    if ((*(_DWORD *)&a5[4 * v155] & 0x77FF00) != 0)
    {
      if (v35 && *(void *)v228)
      {
        CFNumberRef v161 = CFNumberCreate(v220, kCFNumberSInt64Type, v228);
        if (v161)
        {
          CFNumberRef v162 = v161;
          CFDictionaryAddValue(v229, @"fileID", v161);
          CFRelease(v162);
        }

        else
        {
          v163 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
            implementation_callback_rpc_cold_11(v233, (void *)v218, v163);
          }
        }
      }

      if (v227 && *(_DWORD *)v224)
      {
        CFNumberRef v164 = CFNumberCreate(v220, kCFNumberSInt32Type, (const void *)v224);
        if (v164)
        {
          CFNumberRef v165 = v164;
          CFDictionaryAddValue(v229, @"docID", v164);
          CFRelease(v165);
        }

        else
        {
          v166 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR)) {
            implementation_callback_rpc_cold_11(v231, v217, v166);
          }
        }
      }
    }

    CFArraySetValueAtIndex(v104, v155, v229);
    CFRelease(v229);
    ++v155;
    *(void *)&__int128 v224 = v224 + 4;
    v228 += 8;
    if (v25 == v155) {
      goto LABEL_167;
    }
  }

  v188 = (os_log_s *)fsevent_default_log();
  if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR)) {
    implementation_callback_rpc_cold_10(v188, v189, v190, v191, v192, v193, v194, v195);
  }
  v102 = 0LL;
  CFArrayRef v103 = 0LL;
  uint64_t v44 = 4294967281LL;
  int v35 = v225;
  v104 = v223;
LABEL_205:
  free(v226);
  if (v57 && v24) {
    free(v57);
  }
  if (v60 && v24) {
    free(v60);
  }
  if (v102)
  {
    if ((_DWORD)v25)
    {
      v213 = v102;
      do
      {
        if (!*v213) {
          break;
        }
        CFRelease(*v213++);
        --v25;
      }

      while (v25);
    }

    free(v102);
  }

  if (v103) {
    CFRelease(v103);
  }
  if (v104) {
    CFRelease(v104);
  }
  v93 = v222;
LABEL_222:
  if (v35) {
    free(v35);
  }
  free(v93);
  return v44;
}

const char *caller_path(const char *a1, char a2)
{
  uintptr_t v2 = a1;
  if (!(a2 & 3 | strncmp(a1, "/System/Volumes/Data/", 0x15uLL)))
  {
    if (!strncmp(v2 + 20, "/Device/", 8uLL)) {
      v2 += 27;
    }
    else {
      v2 += 20;
    }
  }

  return v2;
}

void FSEventStreamRetain(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    do
      unsigned int v1 = __ldaxr((unsigned int *)streamRef);
    while (__stlxr(v1 + 1, (unsigned int *)streamRef));
  }

  else
  {
    uintptr_t v2 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      FSEventStreamRetain_cold_1();
    }
  }

FSEventStreamEventId FSEventStreamGetLatestEventId(ConstFSEventStreamRef streamRef)
{
  if (streamRef) {
    return *((void *)streamRef + 21);
  }
  uintptr_t v2 = (os_log_s *)fsevent_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    FSEventStreamGetLatestEventId_cold_1();
  }
  return 0LL;
}

dev_t FSEventStreamGetDeviceBeingWatched(ConstFSEventStreamRef streamRef)
{
  if (streamRef) {
    return *((_DWORD *)streamRef + 16);
  }
  uintptr_t v2 = (os_log_s *)fsevent_default_log();
  dev_t result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if (result)
  {
    FSEventStreamGetDeviceBeingWatched_cold_1();
    return 0;
  }

  return result;
}

CFArrayRef FSEventStreamCopyPathsBeingWatched(ConstFSEventStreamRef streamRef)
{
  if (!streamRef)
  {
    uint64_t v11 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_1();
    }
    return 0LL;
  }

  uintptr_t v2 = (const void **)calloc(*((void *)streamRef + 9), 8uLL);
  if (!v2)
  {
    uint64_t v12 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 0LL;
  }

  uint64_t v3 = v2;
  CFIndex v4 = *((void *)streamRef + 9);
  uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v4 >= 1)
  {
    uint64_t v6 = 0LL;
    while (1)
    {
      CFStringRef v7 = CFStringCreateWithFileSystemRepresentation(v5, *(const char **)(*((void *)streamRef + 10) + 8 * v6));
      if (!v7) {
        break;
      }
      v3[v6++] = v7;
      CFIndex v4 = *((void *)streamRef + 9);
      if (v4 <= v6) {
        goto LABEL_7;
      }
    }

    CFNumberRef v20 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_3((void *)streamRef + 10, v6, v20);
    }
    goto LABEL_20;
  }

LABEL_7:
  CFArrayRef v8 = CFArrayCreate(v5, v3, v4, MEMORY[0x189605228]);
  if (!v8)
  {
    CFNumberRef v21 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      FSEventStreamCopyPathsBeingWatched_cold_4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_20:
    if (*((uint64_t *)streamRef + 9) >= 1)
    {
      uint64_t v29 = 0LL;
      do
      {
        int8x8_t v30 = v3[v29];
        if (!v30) {
          break;
        }
        CFRelease(v30);
        ++v29;
      }

      while (*((void *)streamRef + 9) > v29);
    }

    free(v3);
    return 0LL;
  }

  uint64_t v9 = v8;
  if (*((uint64_t *)streamRef + 9) >= 1)
  {
    uint64_t v10 = 0LL;
    do
      CFRelease(v3[v10++]);
    while (*((void *)streamRef + 9) > v10);
  }

  free(v3);
  return v9;
}

FSEventStreamRef FSEventStreamCreate( CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)_FSEventStreamCreate( "FSEventStreamCreate",  allocator,  (uint64_t)callback,  (__int128 *)&context->version,  0,  pathsToWatch,  sinceWhen,  (unint64_t)(latency * 1000000.0),  flags);
}

uint64_t _FSEventStreamCreate( const char *a1, CFAllocatorRef Default, uint64_t a3, __int128 *a4, int a5, CFArrayRef theArray, uint64_t a7, uint64_t a8, int a9)
{
  v81[127] = *MEMORY[0x1895F89C0];
  if ((a9 & 0x41) == 0x40)
  {
    uint64_t v9 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_1();
    }
    return 0LL;
  }

  CFIndex Count = CFArrayGetCount(theArray);
  if ((CFAllocatorRef)*MEMORY[0x189604DB0] == Default) {
    Default = CFAllocatorGetDefault();
  }
  uint64_t v16 = MEMORY[0x1895A6A00](Default, 456LL, 0LL);
  if (!v16)
  {
    uint64_t v49 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_2((uint64_t)a1, v49);
    }
    return 0LL;
  }

  uint64_t v17 = v16;
  *(void *)(v16 + 448) = 0LL;
  *(_OWORD *)(v16 + 416) = 0u;
  *(_OWORD *)(v16 + 432) = 0u;
  *(_OWORD *)(v16 + 384) = 0u;
  *(_OWORD *)(v16 + 400) = 0u;
  *(_OWORD *)(v16 + 352) = 0u;
  *(_OWORD *)(v16 + 368) = 0u;
  *(_OWORD *)(v16 + 320) = 0u;
  *(_OWORD *)(v16 + 336) = 0u;
  *(_OWORD *)(v16 + 288) = 0u;
  *(_OWORD *)(v16 + 304) = 0u;
  *(_OWORD *)(v16 + 256) = 0u;
  *(_OWORD *)(v16 + 272) = 0u;
  *(_OWORD *)(v16 + 224) = 0u;
  *(_OWORD *)(v16 + 240) = 0u;
  *(_OWORD *)(v16 + 192) = 0u;
  *(_OWORD *)(v16 + 208) = 0u;
  *(_OWORD *)(v16 + 160) = 0u;
  *(_OWORD *)(v16 + 176) = 0u;
  *(_OWORD *)(v16 + 128) = 0u;
  *(_OWORD *)(v16 + 144) = 0u;
  *(_OWORD *)(v16 + 96) = 0u;
  *(_OWORD *)(v16 + 112) = 0u;
  *(_OWORD *)(v16 + 64) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 32) = 0u;
  *(_OWORD *)(v16 + 48) = 0u;
  *(_OWORD *)uint64_t v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  *(void *)(v16 + 8) = Default;
  CFRetain(Default);
  *(void *)(v17 + 16) = a3;
  if (a4)
  {
    __int128 v18 = *a4;
    __int128 v19 = a4[1];
    *(void *)(v17 + 56) = *((void *)a4 + 4);
    *(_OWORD *)(v17 + 40) = v19;
    *(_OWORD *)(v17 + 24) = v18;
  }

  CFNumberRef v20 = *(void (**)(void))(v17 + 40);
  if (v20) {
    v20(*(void *)(v17 + 32));
  }
  *(_DWORD *)(v17 + 64) = a5;
  *(void *)(v17 + 72) = Count;
  *(void *)(v17 + 80) = MEMORY[0x1895A6A00](Default, 8 * Count, 0LL);
  *(void *)(v17 + 88) = MEMORY[0x1895A6A00](Default, 4 * Count, 0LL);
  CFNumberRef v21 = *(void **)(v17 + 80);
  if (!v21)
  {
    uint64_t v50 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_3((uint64_t)a1);
    }
    goto LABEL_89;
  }

  bzero(v21, 8 * Count);
  bzero(*(void **)(v17 + 88), 4 * Count);
  if ((a9 & 4) == 0)
  {
    *(_DWORD *)(v17 + 408) = -1;
    goto LABEL_14;
  }

  int v51 = kqueue();
  *(_DWORD *)(v17 + 408) = v51;
  if (v51 < 0)
  {
    __int128 v54 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_7();
    }
    goto LABEL_89;
  }

  uint64_t v52 = (void *)MEMORY[0x1895A6A00](Default, 32 * Count, 0LL);
  *(void *)(v17 + 392) = v52;
  if (!v52)
  {
    uint64_t v55 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_8((uint64_t)a1);
    }
    goto LABEL_89;
  }

  bzero(v52, 32 * Count);
  int v53 = (void *)MEMORY[0x1895A6A00](Default, 32 * Count, 0LL);
  *(void *)(v17 + 400) = v53;
  if (!v53)
  {
    __int128 v59 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamCreate_cold_9((uint64_t)a1);
    }
LABEL_89:
    _FSEventStreamDeallocate((char *)v17);
    return 0LL;
  }

  bzero(v53, 32 * Count);
LABEL_14:
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID != CFGetTypeID(ValueAtIndex))
      {
        size_t v56 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamCreate_cold_6(i, (uint64_t)a1);
        }
        goto LABEL_89;
      }

      if (!CFStringGetFileSystemRepresentation(ValueAtIndex, buffer, 1024LL))
      {
        int v57 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamCreate_cold_4();
        }
        goto LABEL_89;
      }

      if (a5)
      {
        int v25 = 1000;
        while (1)
        {
          int v26 = getfsstat(0LL, 0, 2);
          if (v26 < 0) {
            goto LABEL_33;
          }
          int v27 = 2168 * (v26 + 1);
          uint64_t v28 = (statfs *)malloc(2168LL * (v26 + 1));
          if (!v28) {
            goto LABEL_33;
          }
          uint64_t v29 = v28;
          unsigned int v30 = getfsstat(v28, v27, 2);
          if ((v30 & 0x80000000) == 0) {
            break;
          }
          free(v29);
          if (!--v25) {
            goto LABEL_33;
          }
        }

        if (!v30)
        {
LABEL_33:
          unsigned __int32 v31 = buffer;
          __strlcpy_chk();
LABEL_34:
          *(_DWORD *)(*(void *)(v17 + 88) + 4 * i) |= 2u;
          goto LABEL_35;
        }

        uint64_t v32 = 0LL;
        while (1)
        {
          int v33 = &v29[v32];
          if (v29[v32].f_fsid.val[0] == a5) {
            break;
          }
          if (v30 == ++v32)
          {
            unsigned __int32 v31 = buffer;
            __strlcpy_chk();
LABEL_64:
            free(v29);
            goto LABEL_34;
          }
        }

        f_mntonname = v33->f_mntonname;
        snprintf(__s, 0x400uLL, "%s/%s", v33->f_mntonname, buffer);
        if (realpath_DARWIN_EXTSN(__s, __s1))
        {
          size_t v47 = strlen(f_mntonname);
          if (__s1[v47] == 47) {
            unsigned __int32 v31 = &__s1[v47 + 1];
          }
          else {
            unsigned __int32 v31 = &__s1[v47];
          }
          goto LABEL_64;
        }

        free(v29);
      }

      else
      {
        unsigned __int32 v31 = __s1;
        if (fsevent_realpath(buffer, __s1)) {
          goto LABEL_35;
        }
      }

      if (buffer[0] == 47)
      {
        unsigned __int32 v31 = buffer;
        __strlcpy_chk();
      }

      else
      {
        unsigned __int32 v31 = __s1;
        getcwd(__s1, 0x400uLL);
        __strlcat_chk();
        __strlcat_chk();
      }

LABEL_35:
      size_t v34 = (int)(strlen(v31) + 1);
      *(void *)(*(void *)(v17 + 80) + 8 * i) = MEMORY[0x1895A6A00](Default, v34, 0LL);
      int v35 = *(char **)(*(void *)(v17 + 80) + 8 * i);
      if (!v35)
      {
        v58 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamCreate_cold_5((uint64_t)a1);
        }
        goto LABEL_89;
      }

      strlcpy(v35, v31, v34);
      if (*(void *)buffer == 0x2F6D65747379532FLL
        && v81[0] == 0x2F73656D756C6F56LL
        && *(void *)((char *)v81 + 5) == 0x2F617461442F7365LL)
      {
        *(_DWORD *)(*(void *)(v17 + 88) + 4 * i) |= 1u;
        if ((a9 & 4) == 0) {
          continue;
        }
      }

      else if ((a9 & 4) == 0)
      {
        continue;
      }

      uint64_t v38 = *(void *)(v17 + 392);
      CFIndex v39 = v38 + 32 * i;
      *(_DWORD *)(v39 + 4) = -1;
      if (!*(_DWORD *)(v17 + 64) || __s1[0] == 47)
      {
        *(void *)(v39 + 24) = strdup(__s1);
      }

      else
      {
        if (!realpath_DARWIN_EXTSN(*(const char **)(*(void *)(v17 + 80) + 8 * i), __s))
        {
          getcwd(__s, 0x400uLL);
          int v40 = strlen(__s);
          __s[v40] = 47;
          strlcpy(&__s[v40 + 1], *(const char **)(*(void *)(v17 + 80) + 8 * i), 1024LL - (v40 + 1));
        }

        *(void *)(*(void *)(v17 + 392) + 32 * i + 24) = strdup(__s);
        uint64_t v38 = *(void *)(v17 + 392);
      }

      uint64_t v41 = (_DWORD *)(v38 + 32 * i);
      *uint64_t v41 = 8;
      int v42 = watch_path(a1, *(_DWORD *)(v17 + 408), __s1, *(void *)(v17 + 400) + 32 * i, (uint64_t)v41, i);
      if (v42)
      {
        int v43 = v42;
        uint64_t v44 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = strerror(v43);
          *(_DWORD *)__s = 136316674;
          uint64_t v68 = a1;
          __int16 v69 = 2080;
          uint64_t v70 = "_FSEventStreamCreate";
          __int16 v71 = 2080;
          v72 = v31;
          __int16 v73 = 2080;
          *(void *)uint64_t v74 = __s1;
          *(_WORD *)&v74[8] = 1024;
          *(_DWORD *)&v74[10] = i;
          __int16 v75 = 1024;
          int v76 = v43;
          __int16 v77 = 2080;
          int v78 = v48;
          _os_log_error_impl( &dword_1874D7000,  v44,  OS_LOG_TYPE_ERROR,  "%s: %s: ERROR: watch_path() failed for srcPath='%s' resolvedPath='%s' index=%d (%d):(%s)",  (uint8_t *)__s,  0x40u);
        }
      }

      int v45 = watch_all_parents((uint64_t)a1, *(_DWORD *)(v17 + 408), __s1, *(void *)(v17 + 392) + 32 * i, i);
      if (v45)
      {
        int v60 = v45;
        uint64_t v61 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          unsigned int v63 = strerror(v60);
          *(_DWORD *)__s = 136316162;
          uint64_t v68 = a1;
          __int16 v69 = 2080;
          uint64_t v70 = "_FSEventStreamCreate";
          __int16 v71 = 2080;
          v72 = v31;
          __int16 v73 = 1024;
          *(_DWORD *)uint64_t v74 = v60;
          *(_WORD *)&v74[4] = 2080;
          *(void *)&v74[6] = v63;
          _os_log_error_impl( &dword_1874D7000,  v61,  OS_LOG_TYPE_ERROR,  "%s: %s: ERROR: watch_all_parents() failed for '%s' (%d):(%s)",  (uint8_t *)__s,  0x30u);
        }

        goto LABEL_89;
      }
    }
  }

  *(void *)(v17 + 168) = a7;
  *(void *)(v17 + 176) = a8;
  *(_DWORD *)(v17 + 184) = a9;
  *(_BYTE *)(v17 + 188) = 0;
  *(_BYTE *)(v17 + 190) = a7 != -1;
  *(void *)(v17 + 216) = 0LL;
  *(void *)(v17 + 360) = 0LL;
  *(void *)(v17 + 432) = 0LL;
  *(void *)(v17 + 192) = 0LL;
  *(void *)(v17 + 200) = 0LL;
  *(_DWORD *)uint64_t v17 = 1;
  return v17;
}

FSEventStreamRef FSEventStreamCreateRelativeToDevice( CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, dev_t deviceToWatch, CFArrayRef pathsToWatchRelativeToDevice, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  if (deviceToWatch > 0) {
    return (FSEventStreamRef)_FSEventStreamCreate( "FSEventStreamCreateRelativeToDevice",  allocator,  (uint64_t)callback,  (__int128 *)&context->version,  deviceToWatch,  pathsToWatchRelativeToDevice,  sinceWhen,  (unint64_t)(latency * 1000000.0),  flags);
  }
  uint64_t v9 = (os_log_s *)fsevent_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    FSEventStreamCreateRelativeToDevice_cold_1();
  }
  return 0LL;
}

void _FSEventStreamDeallocate(char *ptr)
{
  if (ptr)
  {
    if (*(_DWORD *)ptr)
    {
      uintptr_t v2 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        _FSEventStreamDeallocate_cold_4();
      }
    }

    else
    {
      if (ptr[188])
      {
        CFIndex v4 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamDeallocate_cold_3();
        }
      }

      if (*((void *)ptr + 27) || *((void *)ptr + 45))
      {
        uint64_t v5 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          _FSEventStreamDeallocate_cold_2();
        }
      }

      uint64_t v6 = (const __CFAllocator *)*((void *)ptr + 1);
      if (v6)
      {
        CFStringRef v7 = (void *)*((void *)ptr + 10);
        if (v7)
        {
          uint64_t v8 = *((void *)ptr + 9);
          *((void *)ptr + 9) = 0LL;
          if ((int)v8 >= 1)
          {
            uint64_t v9 = 0LL;
            uint64_t v10 = v8;
            do
            {
              uint64_t v11 = *(void **)(*((void *)ptr + 10) + 8 * v9);
              if (v11) {
                CFAllocatorDeallocate(v6, v11);
              }
              uint64_t v12 = *((void *)ptr + 49);
              if (v12)
              {
                uint64_t v13 = *(void **)(v12 + 32 * v9 + 24);
                if (v13)
                {
                  free(v13);
                  uint64_t v12 = *((void *)ptr + 49);
                }

                uint64_t v14 = v12 + 32 * v9;
                uint64_t v15 = *(void **)(v14 + 16);
                if (v15)
                {
                  if (*(int *)(v14 + 8) >= 1)
                  {
                    uint64_t v16 = 0LL;
                    do
                    {
                      close(*(_DWORD *)(*(void *)(v12 + 32 * v9 + 16) + 4 * v16++));
                      uint64_t v12 = *((void *)ptr + 49);
                      uint64_t v17 = v12 + 32 * v9;
                    }

                    while (v16 < *(int *)(v17 + 8));
                    uint64_t v15 = *(void **)(v17 + 16);
                  }

                  free(v15);
                  uint64_t v12 = *((void *)ptr + 49);
                }

                close(*(_DWORD *)(v12 + 32 * v9 + 4));
              }

              ++v9;
            }

            while (v9 != v10);
            CFStringRef v7 = (void *)*((void *)ptr + 10);
          }

          CFAllocatorDeallocate(v6, v7);
          CFAllocatorDeallocate(v6, *((void **)ptr + 11));
          __int128 v18 = (void *)*((void *)ptr + 49);
          if (v18) {
            CFAllocatorDeallocate(v6, v18);
          }
          __int128 v19 = (void *)*((void *)ptr + 50);
          if (v19) {
            CFAllocatorDeallocate(v6, v19);
          }
        }

        for (uint64_t i = 104LL; i != 168; i += 8LL)
        {
          CFNumberRef v21 = *(void **)&ptr[i];
          if (v21)
          {
            free(v21);
            *(void *)&ptr[i] = 0LL;
          }
        }

        *((void *)ptr + 12) = 0LL;
        uint64_t v22 = (dispatch_object_s *)*((void *)ptr + 44);
        if (v22) {
          dispatch_release(v22);
        }
        uint64_t v23 = (void (*)(void))*((void *)ptr + 6);
        if (v23) {
          v23(*((void *)ptr + 4));
        }
        *((void *)ptr + 56) = 0LL;
        *((_OWORD *)ptr + 26) = 0u;
        *((_OWORD *)ptr + 27) = 0u;
        *((_OWORD *)ptr + 24) = 0u;
        *((_OWORD *)ptr + 25) = 0u;
        *((_OWORD *)ptr + 22) = 0u;
        *((_OWORD *)ptr + 23) = 0u;
        *((_OWORD *)ptr + 20) = 0u;
        *((_OWORD *)ptr + 21) = 0u;
        *((_OWORD *)ptr + 18) = 0u;
        *((_OWORD *)ptr + 19) = 0u;
        *((_OWORD *)ptr + 16) = 0u;
        *((_OWORD *)ptr + 17) = 0u;
        *((_OWORD *)ptr + 14) = 0u;
        *((_OWORD *)ptr + 15) = 0u;
        *((_OWORD *)ptr + 12) = 0u;
        *((_OWORD *)ptr + 13) = 0u;
        *((_OWORD *)ptr + 10) = 0u;
        *((_OWORD *)ptr + 11) = 0u;
        *((_OWORD *)ptr + 8) = 0u;
        *((_OWORD *)ptr + 9) = 0u;
        *((_OWORD *)ptr + 6) = 0u;
        *((_OWORD *)ptr + 7) = 0u;
        *((_OWORD *)ptr + 4) = 0u;
        *((_OWORD *)ptr + 5) = 0u;
        *((_OWORD *)ptr + 2) = 0u;
        *((_OWORD *)ptr + 3) = 0u;
        *(_OWORD *)ptr = 0u;
        *((_OWORD *)ptr + 1) = 0u;
        CFAllocatorDeallocate(v6, ptr);
        CFRelease(v6);
      }
    }
  }

  else
  {
    uint64_t v3 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _FSEventStreamDeallocate_cold_1();
    }
  }

void FSEventStreamScheduleWithRunLoop( FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  if (streamRef)
  {
    if (runLoop)
    {
      uint64_t v6 = (mach_port_name_t *)((char *)streamRef + 192);
      if (*((_DWORD *)streamRef + 48))
      {
LABEL_4:
        if (_createAndAddRunLoopSource( (int)"FSEventStreamScheduleWithRunLoop",  (uint64_t)streamRef,  runLoop,  runLoopMode))
        {
          CFStringRef v7 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            FSEventStreamScheduleWithRunLoop_cold_5();
          }
          mach_port_deallocate(*MEMORY[0x1895FBBE0], *v6);
          mach_port_name_t *v6 = 0;
        }

        else
        {
          *((void *)streamRef + 28) = CFRetain(runLoop);
          *((void *)streamRef + 29) = CFStringCreateCopy(0LL, runLoopMode);
          if ((*((_BYTE *)streamRef + 184) & 4) != 0)
          {
            context.version = 0LL;
            context.info = streamRef;
            context.retain = (void *(__cdecl *)(void *))_FSEventStreamRetainAndReturnSelf;
            context.release = (void (__cdecl *)(void *))FSEventStreamRelease;
            context.copyDescription = (CFStringRef (__cdecl *)(void *))FSEventStreamCopyDescription;
            uint64_t v11 = CFFileDescriptorCreate( 0LL,  *((_DWORD *)streamRef + 102),  1u,  (CFFileDescriptorCallBack)cffd_callback,  &context);
            *((void *)streamRef + 52) = v11;
            if (v11)
            {
              RunLoopSource = CFFileDescriptorCreateRunLoopSource(0LL, v11, 0LL);
              *((void *)streamRef + 53) = RunLoopSource;
              if (RunLoopSource)
              {
                CFRunLoopAddSource(runLoop, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1896051B0]);
              }

              else
              {
                uint64_t v23 = (os_log_s *)fsevent_default_log();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  FSEventStreamScheduleWithRunLoop_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
                }
                CFFileDescriptorInvalidate(*((CFFileDescriptorRef *)streamRef + 52));
                CFRelease(*((CFTypeRef *)streamRef + 52));
                *((void *)streamRef + 52) = 0LL;
              }
            }

            else
            {
              uint64_t v15 = (os_log_s *)fsevent_default_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                FSEventStreamScheduleWithRunLoop_cold_3(v15, v16, v17, v18, v19, v20, v21, v22);
              }
            }
          }
        }

        return;
      }

      if (!allocate_d2f_port((uint64_t)"FSEventStreamScheduleWithRunLoop", (uint64_t)streamRef))
      {
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        if (!FSEvents_streamDict) {
          FSEvents_streamDict = (uint64_t)CFDictionaryCreateMutable(v13, 0LL, MEMORY[0x189605240], 0LL);
        }
        CFNumberRef v14 = CFNumberCreate(v13, kCFNumberIntType, v6);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v14, streamRef);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v14);
        goto LABEL_4;
      }

      uint64_t v10 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        FSEventStreamScheduleWithRunLoop_cold_6();
      }
    }

    else
    {
      uint64_t v9 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        FSEventStreamScheduleWithRunLoop_cold_2();
      }
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      FSEventStreamScheduleWithRunLoop_cold_1();
    }
  }

uint64_t allocate_d2f_port(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, (mach_port_name_t *)(a2 + 192));
  if ((_DWORD)v2)
  {
    uint64_t v3 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      allocate_d2f_port_cold_1();
    }
  }

  return v2;
}

uint64_t _createAndAddRunLoopSource(int a1, uint64_t a2, CFRunLoopRef rl, CFRunLoopMode mode)
{
  mach_port_t v5 = *(_DWORD *)(a2 + 192);
  if (!v5)
  {
    uint64_t v10 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      _createAndAddRunLoopSource_cold_1();
    }
    return 5LL;
  }

  if (*(void *)(a2 + 200))
  {
    uint64_t v8 = *(__CFRunLoopSource **)(a2 + 216);
    if (!v8)
    {
      uint64_t v9 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        _createAndAddRunLoopSource_cold_4();
      }
      return 5LL;
    }

LABEL_11:
    CFRunLoopAddSource(rl, v8, mode);
    return 0LL;
  }

  memset(&v16, 0, sizeof(v16));
  uint64_t v11 = CFMachPortCreateWithPort(0LL, v5, (CFMachPortCallBack)FSEventsClientProcessMessageCallback, &v16, 0LL);
  *(void *)(a2 + 200) = v11;
  if (v11)
  {
    CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x189604DB0], v11, 0LL);
    *(void *)(a2 + 216) = RunLoopSource;
    if (RunLoopSource)
    {
      uint64_t v8 = RunLoopSource;
      goto LABEL_11;
    }

    uint64_t v15 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _createAndAddRunLoopSource_cold_3();
    }
    CFMachPortInvalidate(*(CFMachPortRef *)(a2 + 200));
    CFRelease(*(CFTypeRef *)(a2 + 200));
    *(void *)(a2 + 200) = 0LL;
  }

  else
  {
    CFNumberRef v14 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      _createAndAddRunLoopSource_cold_2();
    }
  }

  mach_port_deallocate(*MEMORY[0x1895FBBE0], *(_DWORD *)(a2 + 196));
  *(_DWORD *)(a2 + 196) = 0;
  return 5LL;
}

void cffd_callback(__CFFileDescriptor *a1, int a2, FSEventStreamRef streamRef)
{
  CFFileDescriptorNativeDescriptor NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  process_dir_events(NativeDescriptor, streamRef);
  FSEventStreamRelease(streamRef);
}

void FSEventStreamUnscheduleFromRunLoop( FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  if (streamRef)
  {
    if (runLoop)
    {
      mach_port_t v5 = (__CFRunLoopSource *)*((void *)streamRef + 27);
      if (v5)
      {
        CFRunLoopRemoveSource(runLoop, v5, runLoopMode);
        CFStringRef v7 = (__CFRunLoopSource *)*((void *)streamRef + 53);
        if (v7) {
          CFRunLoopRemoveSource(runLoop, v7, runLoopMode);
        }
        _FSEventStreamUnscheduleFromRunLoops((uint64_t)streamRef);
      }

      else
      {
        uint64_t v10 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          FSEventStreamUnscheduleFromRunLoop_cold_3();
        }
      }
    }

    else
    {
      uint64_t v9 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        FSEventStreamUnscheduleFromRunLoop_cold_2();
      }
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      FSEventStreamUnscheduleFromRunLoop_cold_1();
    }
  }

void _FSEventStreamUnscheduleFromRunLoops(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 224);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 224) = 0LL;
  }

  uint64_t v3 = *(const void **)(a1 + 232);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 232) = 0LL;
  }

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  if (streamRef)
  {
    if (q)
    {
      if (!*((_DWORD *)streamRef + 48))
      {
        if (allocate_d2f_port((uint64_t)"FSEventStreamSetDispatchQueue", (uint64_t)streamRef))
        {
          uint64_t v18 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            FSEventStreamSetDispatchQueue_cold_4();
          }
          return;
        }

        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        uint64_t v19 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        if (!FSEvents_streamDict) {
          FSEvents_streamDict = (uint64_t)CFDictionaryCreateMutable(v19, 0LL, MEMORY[0x189605240], 0LL);
        }
        CFNumberRef v20 = CFNumberCreate(v19, kCFNumberIntType, (char *)streamRef + 192);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v20, streamRef);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v20);
      }

      pthread_mutex_init((pthread_mutex_t *)((char *)streamRef + 240), 0LL);
      pthread_cond_init((pthread_cond_t *)((char *)streamRef + 304), 0LL);
      dispatch_retain(q);
      *((void *)streamRef + 44) = q;
      if (create_d2f_port_source((uint64_t)streamRef))
      {
        if ((*((_BYTE *)streamRef + 184) & 4) == 0) {
          return;
        }
        int v4 = *((_DWORD *)streamRef + 102);
        dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895F8B60], v4, 0LL, *((dispatch_queue_t *)streamRef + 44));
        if (v5)
        {
          uint64_t v6 = v5;
          dispatch_set_qos_class_fallback();
          FSEventStreamRetain(streamRef);
          uint64_t v7 = MEMORY[0x1895F87A8];
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 0x40000000LL;
          handler[2] = __FSEventStreamSetDispatchQueue_block_invoke;
          handler[3] = &__block_descriptor_tmp_0;
          handler[4] = streamRef;
          int v32 = v4;
          dispatch_source_set_event_handler(v6, handler);
          v29[0] = v7;
          v29[1] = 0x40000000LL;
          v29[2] = __FSEventStreamSetDispatchQueue_block_invoke_2;
          v29[3] = &__block_descriptor_tmp_22;
          int v30 = v4;
          v29[4] = v6;
          v29[5] = streamRef;
          dispatch_source_set_cancel_handler(v6, v29);
          *((void *)streamRef + 54) = v6;
          *((_DWORD *)streamRef + 110) = 1;
          return;
        }

        uint64_t v21 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          FSEventStreamSetDispatchQueue_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }

      else
      {
        uint64_t v10 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          FSEventStreamSetDispatchQueue_cold_3(v10, v11, v12, v13, v14, v15, v16, v17);
        }
      }

      if (*((void *)streamRef + 54))
      {
        cancel_source((dispatch_object_s **)streamRef + 54, (int *)streamRef + 110);
        *((_DWORD *)streamRef + 102) = -1;
      }

      if (*((void *)streamRef + 45))
      {
        cancel_source((dispatch_object_s **)streamRef + 45, (int *)streamRef + 92);
        *((_DWORD *)streamRef + 48) = 0;
      }
    }

    else
    {
      if (*((void *)streamRef + 45))
      {
        cancel_source((dispatch_object_s **)streamRef + 45, (int *)streamRef + 92);
        *((_DWORD *)streamRef + 48) = 0;
      }

      if (*((void *)streamRef + 47))
      {
        cancel_source((dispatch_object_s **)streamRef + 47, (int *)streamRef + 96);
        *((_DWORD *)streamRef + 49) = 0;
      }

      if ((*((_BYTE *)streamRef + 184) & 4) != 0 && *((void *)streamRef + 54))
      {
        cancel_source((dispatch_object_s **)streamRef + 54, (int *)streamRef + 110);
        *((_DWORD *)streamRef + 102) = -1;
      }

      uint64_t v9 = (dispatch_object_s *)*((void *)streamRef + 44);
      if (v9)
      {
        dispatch_release(v9);
        *((void *)streamRef + 44) = 0LL;
      }
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      FSEventStreamSetDispatchQueue_cold_1();
    }
  }

BOOL create_d2f_port_source(uint64_t a1)
{
  uintptr_t v2 = *(unsigned int *)(a1 + 192);
  uint64_t v3 = dispatch_source_create(MEMORY[0x1895F8B40], v2, 0LL, *(dispatch_queue_t *)(a1 + 352));
  if (v3)
  {
    FSEventStreamRetain((FSEventStreamRef)a1);
    dispatch_set_qos_class_fallback();
    uint64_t v4 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __create_d2f_port_source_block_invoke;
    handler[3] = &__block_descriptor_tmp_64;
    int v9 = v2;
    dispatch_source_set_event_handler(v3, handler);
    v6[0] = v4;
    v6[1] = 0x40000000LL;
    v6[2] = __create_d2f_port_source_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_65;
    int v7 = v2;
    v6[4] = v3;
    v6[5] = a1;
    dispatch_source_set_cancel_handler(v3, v6);
    *(void *)(a1 + 360) = v3;
    *(_DWORD *)(a1 + 368) = 1;
  }

  return v3 != 0LL;
}

void __FSEventStreamSetDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 188))
  {
    if (!*(_BYTE *)(v1 + 189)) {
      process_dir_events(*(_DWORD *)(a1 + 40), (void *)v1);
    }
  }

void process_dir_events(int a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a2[49];
  uint64_t v4 = (kevent *)a2[50];
  uint64_t v6 = a2[9];
  timeout.tv_sec = 0LL;
  timeout.tv_nsec = 0LL;
  dev_t v40 = v6;
  unsigned int v7 = kevent(a1, 0LL, 0, v4, v6, &timeout);
  if ((v7 & 0x80000000) != 0)
  {
    int v38 = *__error();
    CFIndex v39 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      process_dir_events_cold_1(v38);
    }
  }

  else if (v7)
  {
    for (uint64_t i = v7; i; --i)
    {
      else {
        int64_t udata = (int64_t)v4->udata;
      }
      if (udata < 0
        || udata >= v40
        || (uint64_t v10 = v5 + 32 * udata, v12 = (int *)(v10 + 4), v11 = *(_DWORD *)(v10 + 4), v11 < 0)
        || (uint64_t v14 = (char **)(v10 + 24), (v13 = *(const char **)(v10 + 24)) == 0LL))
      {
        uint64_t v22 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          if (udata >= v40)
          {
            __darwin_time_t v28 = 0LL;
            dev_t v27 = -1;
          }

          else
          {
            uint64_t v26 = v5 + 32 * udata;
            dev_t v27 = *(_DWORD *)(v26 + 4);
            __darwin_time_t v28 = *(void *)(v26 + 24);
          }

          buf.st_dev = 136316162;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = udata;
          HIWORD(buf.st_gid) = 1024;
          buf.st_rdev = v40;
          *((_WORD *)&buf.st_rdev + 2) = 1024;
          *(dev_t *)((char *)&buf.st_rdev + 6) = v27;
          WORD1(buf.st_atimespec.tv_sec) = 2048;
          *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 4) = v28;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v22;
          CFNumberRef v20 = "%s: index in event (%ld) not valid (%d max; fdtbl %d name %p)";
          uint32_t v21 = 44;
          goto LABEL_39;
        }
      }

      else
      {
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          if (watch_path("process_dir_events", a1, v13, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            uint64_t v23 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              int v36 = *v14;
              buf.st_dev = 136315394;
              *(void *)&buf.st_mode = "process_dir_events";
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v36;
              _os_log_error_impl( &dword_1874D7000,  v23,  OS_LOG_TYPE_ERROR,  "%s: creation: watch_path() failed for '%s'",  (uint8_t *)&buf,  0x16u);
            }
          }

          if ((*(_BYTE *)v10 & 1) != 0) {
            goto LABEL_17;
          }
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if ((*(_BYTE *)v10 & 8) == 0) {
            goto LABEL_17;
          }
          uint64_t v24 = (os_log_s *)fsevent_default_log();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          uint64_t v25 = *v14;
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v25;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v24;
          CFNumberRef v20 = "%s: creation: watch_all_parents() failed for '%s'";
LABEL_51:
          uint32_t v21 = 22;
          goto LABEL_39;
        }

        uint32_t fflags = v4->fflags;
        if ((fflags & 0x22) == 0)
        {
          if ((fflags & 1) == 0) {
            goto LABEL_17;
          }
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if (watch_path("process_dir_events", a1, *v14, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            uint64_t v29 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              uint64_t v37 = *v14;
              buf.st_dev = 136315394;
              *(void *)&buf.st_mode = "process_dir_events";
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v37;
              _os_log_error_impl( &dword_1874D7000,  v29,  OS_LOG_TYPE_ERROR,  "%s: delete: watch_path() failed for '%s'",  (uint8_t *)&buf,  0x16u);
            }
          }

          if ((*(_BYTE *)v10 & 8) == 0) {
            goto LABEL_17;
          }
          int v30 = (os_log_s *)fsevent_default_log();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          unsigned __int32 v31 = *v14;
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v31;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v30;
          CFNumberRef v20 = "%s: delete: watch_all_parents() failed for '%s'";
          goto LABEL_51;
        }

        if (!fcntl(v11, 50, __s1))
        {
          if (!strcmp(__s1, *v14) && !lstat(__s1, &buf)) {
            goto LABEL_17;
          }
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if ((*(_BYTE *)v10 & 4) != 0)
          {
            free(*v14);
            *uint64_t v14 = strdup(__s1);
          }

          else if (watch_path("process_dir_events", a1, *v14, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            int v32 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              int v33 = *v14;
              *(_DWORD *)int v42 = 136315394;
              int v43 = "process_dir_events";
              __int16 v44 = 2080;
              int v45 = v33;
              _os_log_error_impl( &dword_1874D7000,  v32,  OS_LOG_TYPE_ERROR,  "%s: rename: watch_path() failed for '%s'",  v42,  0x16u);
            }
          }

          if ((*(_BYTE *)v10 & 8) == 0) {
            goto LABEL_17;
          }
          size_t v34 = (os_log_s *)fsevent_default_log();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          int v35 = *v14;
          *(_DWORD *)int v42 = 136315394;
          int v43 = "process_dir_events";
          __int16 v44 = 2080;
          int v45 = v35;
          p_stat buf = v42;
          uint64_t v19 = v34;
          CFNumberRef v20 = "%s: rename: watch_all_parents() failed for '%s'";
          goto LABEL_51;
        }

        uint64_t v16 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = *v12;
          buf.st_dev = 136315394;
          *(void *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 1024;
          *(_DWORD *)((char *)&buf.st_ino + 6) = v17;
          p_stat buf = (uint8_t *)&buf;
          uint64_t v19 = v16;
          CFNumberRef v20 = "%s: failed to get the new path for fd %d";
          uint32_t v21 = 18;
LABEL_39:
          _os_log_error_impl(&dword_1874D7000, v19, OS_LOG_TYPE_ERROR, v20, p_buf, v21);
        }
      }

LABEL_17:
      ++v4;
    }
  }

void __FSEventStreamSetDispatchQueue_block_invoke_2(uint64_t a1)
{
}

FSEventStreamEventId FSEventStreamFlushAsync(FSEventStreamRef streamRef)
{
  FSEventStreamEventId v5 = 0LL;
  if (streamRef)
  {
    if (*((_BYTE *)streamRef + 188))
    {
      if (*((void *)streamRef + 25))
      {
        if (f2d_flush_rpc(*((_DWORD *)streamRef + 49), &v5))
        {
          uint64_t v1 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
            FSEventStreamFlushAsync_cold_3();
          }
        }
      }
    }

    else
    {
      uint64_t v3 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        FSEventStreamFlushAsync_cold_2();
      }
    }
  }

  else
  {
    uintptr_t v2 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      FSEventStreamFlushAsync_cold_1();
    }
  }

  return v5;
}

void FSEventStreamFlushSync(FSEventStreamRef streamRef)
{
  uint64_t v14 = 0LL;
  if (streamRef)
  {
    if (*((_BYTE *)streamRef + 188))
    {
      if (*((void *)streamRef + 25) || *((void *)streamRef + 45))
      {
        uintptr_t v2 = (__CFRunLoop *)*((void *)streamRef + 28);
        if (v2 || *((void *)streamRef + 45))
        {
          uint64_t v3 = (__CFRunLoopSource *)*((void *)streamRef + 27);
          if (v3 || *((void *)streamRef + 45))
          {
            if (v2)
            {
              CFRunLoopAddSource(v2, v3, @"com.apple.FSEvents");
              uint64_t v13 = 0LL;
              while (*((_BYTE *)streamRef + 190)
                   && !_runRunLoopOnceForFlushSync( (uint64_t)"FSEventStreamFlushSync:1",  (uint64_t)streamRef,  (int *)&v13 + 1,  &v13))
                ;
            }

            else
            {
              pthread_mutex_lock((pthread_mutex_t *)((char *)streamRef + 240));
              while (*((_BYTE *)streamRef + 190))
              {
                if (pthread_cond_wait( (pthread_cond_t *)((char *)streamRef + 304),  (pthread_mutex_t *)((char *)streamRef + 240)))
                {
                  uint64_t v6 = (os_log_s *)fsevent_default_log();
                  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
                    FSEventStreamFlushSync_cold_8();
                  }
                  break;
                }
              }

              pthread_mutex_unlock((pthread_mutex_t *)((char *)streamRef + 240));
            }

            if (f2d_flush_rpc(*((_DWORD *)streamRef + 49), &v14))
            {
              unsigned int v7 = (os_log_s *)fsevent_default_log();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                FSEventStreamFlushSync_cold_7();
              }
            }

            if (!v14) {
              goto LABEL_46;
            }
            if (v14 > 0)
            {
              *((void *)streamRef + 56) = v14;
              uint64_t v13 = 0LL;
              if (*((void *)streamRef + 28))
              {
                while (*((void *)streamRef + 21) < *((void *)streamRef + 56)
                     && !_runRunLoopOnceForFlushSync( (uint64_t)"FSEventStreamFlushSync:2",  (uint64_t)streamRef,  (int *)&v13 + 1,  &v13))
                  ;
              }

              else
              {
                pthread_mutex_lock((pthread_mutex_t *)((char *)streamRef + 240));
                while (*((void *)streamRef + 21) < *((void *)streamRef + 56))
                {
                  if (pthread_cond_wait( (pthread_cond_t *)((char *)streamRef + 304),  (pthread_mutex_t *)((char *)streamRef + 240)))
                  {
                    int v11 = (os_log_s *)fsevent_default_log();
                    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                      FSEventStreamFlushSync_cold_5();
                    }
                    break;
                  }
                }

                pthread_mutex_unlock((pthread_mutex_t *)((char *)streamRef + 240));
              }

              *((void *)streamRef + 56) = 0LL;
LABEL_46:
              uint64_t v12 = (__CFRunLoop *)*((void *)streamRef + 28);
              if (v12) {
                CFRunLoopRemoveSource(v12, *((CFRunLoopSourceRef *)streamRef + 27), @"com.apple.FSEvents");
              }
              return;
            }

            uint64_t v8 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              FSEventStreamFlushSync_cold_6();
            }
          }

          else
          {
            uint64_t v10 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              FSEventStreamFlushSync_cold_4();
            }
          }
        }

        else
        {
          int v9 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            FSEventStreamFlushSync_cold_3();
          }
        }
      }
    }

    else
    {
      FSEventStreamEventId v5 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        FSEventStreamFlushAsync_cold_2();
      }
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      FSEventStreamFlushSync_cold_1();
    }
  }

uint64_t _runRunLoopOnceForFlushSync(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int32 v8 = CFRunLoopRunInMode(@"com.apple.FSEvents", 5.0, 1u) - 1;
  uint64_t result = 0LL;
  switch(v8)
  {
    case 0:
      uint64_t v10 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        _runRunLoopOnceForFlushSync_cold_1();
      }
      return 1LL;
    case 1:
      uint64_t v12 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        _runRunLoopOnceForFlushSync_cold_2();
      }
      return 1LL;
    case 2:
      int v13 = *a3;
      if ((*a3 & ~(-1 << *a4)) == 0)
      {
        uint64_t v14 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          double v15 = (double)(*a3 + 1) * 5.0;
          int v16 = 136316162;
          uint64_t v17 = a1;
          __int16 v18 = 2048;
          uint64_t v19 = a2;
          __int16 v20 = 2080;
          uint32_t v21 = "The run loop timed out.";
          __int16 v22 = 1024;
          int v23 = 3;
          __int16 v24 = 2048;
          double v25 = v15;
          _os_log_error_impl( &dword_1874D7000,  v14,  OS_LOG_TYPE_ERROR,  "%s(streamRef = %p): WARNING: CFRunLoopRunInMode() => %s (%d) (%.2f seconds)",  (uint8_t *)&v16,  0x30u);
        }

        ++*a4;
        int v13 = *a3;
      }

      uint64_t result = 0LL;
      *a3 = v13 + 1;
      return result;
    case 3:
      return result;
    default:
      int v11 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315906;
        uint64_t v17 = a1;
        __int16 v18 = 2048;
        uint64_t v19 = a2;
        __int16 v20 = 2080;
        uint32_t v21 = "UNKNOWN";
        __int16 v22 = 1024;
        int v23 = 0;
        _os_log_error_impl( &dword_1874D7000,  v11,  OS_LOG_TYPE_ERROR,  "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)",  (uint8_t *)&v16,  0x26u);
      }

      return 1LL;
  }

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  if (streamRef)
  {
    if (*((void *)streamRef + 27) || *((void *)streamRef + 45))
    {
      if (*((_BYTE *)streamRef + 188))
      {
        uintptr_t v2 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
          FSEventStreamInvalidate_cold_3();
        }
      }

      *((_BYTE *)streamRef + 189) = 1;
      _FSEventStreamUnscheduleFromRunLoops((uint64_t)streamRef);
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, (char *)streamRef + 192);
      pthread_mutex_lock(&FSEvents_streamDict_mutex);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)FSEvents_streamDict, v3);
      pthread_mutex_unlock(&FSEvents_streamDict_mutex);
      CFRelease(v3);
      uint64_t v4 = (__CFMachPort *)*((void *)streamRef + 25);
      if (v4)
      {
        CFMachPortInvalidate(v4);
        CFRelease(*((CFTypeRef *)streamRef + 25));
        *((void *)streamRef + 25) = 0LL;
        FSEventStreamEventId v5 = (__CFMachPort *)*((void *)streamRef + 26);
        if (v5)
        {
          CFMachPortSetInvalidationCallBack(v5, 0LL);
          CFRelease(*((CFTypeRef *)streamRef + 26));
          *((void *)streamRef + 26) = 0LL;
        }

        uint64_t v6 = (const void *)*((void *)streamRef + 27);
        if (v6)
        {
          CFRelease(v6);
          *((void *)streamRef + 27) = 0LL;
        }
      }

      if (*((void *)streamRef + 45)) {
        cancel_source((dispatch_object_s **)streamRef + 45, (int *)streamRef + 92);
      }
      else {
        dispose_d2f_port(*((_DWORD *)streamRef + 48));
      }
      *((_DWORD *)streamRef + 48) = 0;
      if (*((void *)streamRef + 47))
      {
        cancel_source((dispatch_object_s **)streamRef + 47, (int *)streamRef + 96);
        *((_DWORD *)streamRef + 49) = 0;
      }

      if ((*((_BYTE *)streamRef + 184) & 4) != 0)
      {
        __int32 v8 = (__CFFileDescriptor *)*((void *)streamRef + 52);
        if (v8)
        {
          CFFileDescriptorInvalidate(v8);
          CFRelease(*((CFTypeRef *)streamRef + 52));
          *((void *)streamRef + 52) = 0LL;
          int v9 = (const void *)*((void *)streamRef + 53);
          if (v9)
          {
            CFRelease(v9);
            *((void *)streamRef + 53) = 0LL;
          }
        }

        if (*((void *)streamRef + 54))
        {
          cancel_source((dispatch_object_s **)streamRef + 54, (int *)streamRef + 110);
          *((_DWORD *)streamRef + 102) = -1;
        }
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        FSEventStreamInvalidate_cold_2();
      }
    }
  }

  else
  {
    unsigned int v7 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FSEventStreamInvalidate_cold_1();
    }
  }

void dispose_d2f_port(mach_port_name_t name)
{
  kern_return_t v1;
  mach_error_t v2;
  os_log_s *v3;
  if (name)
  {
    uint64_t v1 = mach_port_mod_refs(*MEMORY[0x1895FBBE0], name, 1u, -1);
    if (v1)
    {
      uintptr_t v2 = v1;
      CFNumberRef v3 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        dispose_d2f_port_cold_1(v2);
      }
    }
  }

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  FSEventStreamEventId v2 = 0LL;
  int v0 = FSEvents_connect();
  FSEventStreamEventId result = 0LL;
  if (!v0)
  {
    f2d_get_current_event_id_rpc(FSEvents_f2d_public_port, &v2);
    return v2;
  }

  return result;
}

uint64_t FSEvents_connect()
{
  if (FSEvents_f2d_public_port)
  {
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    return 0LL;
  }

  else
  {
    uint64_t v0 = bootstrap_look_up2();
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    if ((_DWORD)v0)
    {
      uint64_t v1 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        FSEvents_connect_cold_1();
      }
    }
  }

  return v0;
}

CFUUIDRef FSEventsCopyUUIDForDevice(dev_t dev)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (dev <= 0)
  {
    FSEventStreamEventId v2 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      FSEventsCopyUUIDForDevice_cold_1();
    }
  }

  int v9 = 0;
  memset(v8, 0, sizeof(v8));
  f2d_get_server_uuid_rpc(FSEvents_f2d_public_port, dev, (uint64_t)v8);
  uint64_t v6 = CFStringCreateWithBytes(0LL, (const UInt8 *)v8, 36LL, 0x600u, 0);
  if (!v6) {
    return 0LL;
  }
  unsigned int v7 = v6;
  CFNumberRef v3 = CFUUIDCreateFromString(0LL, v6);
  CFRelease(v7);
  return v3;
}

FSEventStreamEventId FSEventsGetLastEventIdForDeviceBeforeTime(dev_t dev, CFAbsoluteTime time)
{
  FSEventStreamEventId v6 = 0LL;
  int v4 = FSEvents_connect();
  FSEventStreamEventId result = 0LL;
  if (!v4)
  {
    f2d_get_last_event_for_device_before_time_rpc(FSEvents_f2d_public_port, dev, (unint64_t)time, &v6);
    return v6;
  }

  return result;
}

Boolean FSEventStreamSetExclusionPaths(FSEventStreamRef streamRef, CFArrayRef pathsToExclude)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (*((_BYTE *)streamRef + 188)) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(pathsToExclude);
  *((void *)streamRef + 12) = Count;
  if (Count && Count <= 8)
  {
    if (Count >= 1)
    {
      CFIndex v6 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(pathsToExclude, v6);
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID != CFGetTypeID(ValueAtIndex) || !CFStringGetFileSystemRepresentation(ValueAtIndex, buffer, 1024LL)) {
          break;
        }
        if (*((_DWORD *)streamRef + 16) || !fsevent_realpath(buffer, __s1)) {
          __strlcpy_chk();
        }
        *((void *)streamRef + v6++ + 13) = strdup(__s1);
        if (*((void *)streamRef + 12) <= v6) {
          return 1;
        }
      }

      return 0;
    }

    return 1;
  }

  else
  {
    Boolean result = 0;
    *((void *)streamRef + 12) = 0LL;
  }

  return result;
}

char *fsevent_realpath(const char *a1, char *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  __int128 v4 = xmmword_1874E22F4;
  uint64_t v5 = 0x2000000000LL;
  DWORD1(v4) = 0x80000000;
  if (getattrlist(a1, &v4, v6, 0x420uLL, 0x20u) == -1) {
    return 0LL;
  }
  if (!a2) {
    return (char *)v7 + v7[0];
  }
  strlcpy(a2, (const char *)v7 + v7[0], 0x400uLL);
  return a2;
}

Boolean FSEventsPurgeEventsForDeviceUpToEventId(dev_t dev, FSEventStreamEventId eventId)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v16 = 0;
  int v4 = FSEvents_connect();
  LOBYTE(v5) = 0;
  if (!v4)
  {
    v17[0] = 0;
    int v6 = getfsstat(0LL, 0, 2);
    if ((v6 & 0x80000000) == 0)
    {
      unsigned int v7 = v6;
      int v8 = 2168 * v6;
      int v9 = (statfs *)malloc(2168 * v6);
      if (v9)
      {
        uint64_t v10 = v9;
        unsigned int v11 = getfsstat(v9, v8, 2);
        if ((v11 & 0x80000000) == 0)
        {
          uint64_t v12 = v11 >= v7 ? v7 : v11;
          if ((_DWORD)v12)
          {
            f_mntonname = v10->f_mntonname;
            while (*((_DWORD *)f_mntonname - 10) != dev)
            {
              f_mntonname += 2168;
              if (!--v12) {
                goto LABEL_14;
              }
            }

            __strlcpy_chk();
          }
        }

void FSEventStreamShow(ConstFSEventStreamRef streamRef)
{
  FSEventStreamEventId v2 = (FILE **)MEMORY[0x1895F89D0];
  fprintf((FILE *)*MEMORY[0x1895F89D0], "FSEventStreamRef @ %p:\n", streamRef);
  if (streamRef)
  {
    fprintf(*v2, "   allocator = %p\n", *((const void **)streamRef + 1));
    fprintf(*v2, "   callback = %p\n", *((const void **)streamRef + 2));
    fprintf(*v2, "   f2d_private_port = 0x%x\n", *((_DWORD *)streamRef + 49));
    fprintf( *v2,  "   CFFileDescriptorContext context = {%lu, %p, %p, %p, %p}\n",  *((void *)streamRef + 3),  *((const void **)streamRef + 4),  *((const void **)streamRef + 5),  *((const void **)streamRef + 6),  *((const void **)streamRef + 7));
    fprintf(*v2, "   numPathsToWatch = %lu\n", *((void *)streamRef + 9));
    fprintf(*v2, "   pathsToWatch = %p\n", *((const void **)streamRef + 10));
    if (*((uint64_t *)streamRef + 9) >= 1)
    {
      uint64_t v3 = 0LL;
      do
      {
        fprintf(*v2, "        pathsToWatch[%d] = '%s'\n", v3, *(const char **)(*((void *)streamRef + 10) + 8 * v3));
        ++v3;
      }

      while (*((void *)streamRef + 9) > v3);
    }

    fprintf(*v2, "   numPathsToExclude = %lu\n", *((void *)streamRef + 12));
    if (*((uint64_t *)streamRef + 12) >= 1)
    {
      uint64_t v4 = 0LL;
      do
      {
        fprintf(*v2, "        pathsToExclude[%d] = '%s'\n", v4, *((const char **)streamRef + v4 + 13));
        ++v4;
      }

      while (*((void *)streamRef + 12) > v4);
    }

    fprintf(*v2, "   latestEventId = %lld\n", *((void *)streamRef + 21));
    fprintf(*v2, "   latency = %llu (microseconds)\n", *((void *)streamRef + 22));
    fprintf(*v2, "   flags = 0x%08x\n", *((_DWORD *)streamRef + 46));
    fprintf(*v2, "   runLoop = %p\n", *((const void **)streamRef + 28));
    fprintf(*v2, "   runLoopMode = %p\n", *((const void **)streamRef + 29));
  }

void server_gone_StreamRef_callback(uint64_t a1)
{
  if (a1 && !*(_BYTE *)(a1 + 189) && (*(void *)(a1 + 360) || *(void *)(a1 + 224)))
  {
    FSEventStreamEventId v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v3 = (mach_port_name_t *)(a1 + 192);
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, (const void *)(a1 + 192));
    pthread_mutex_lock(&FSEvents_streamDict_mutex);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)FSEvents_streamDict, v4);
    pthread_mutex_unlock(&FSEvents_streamDict_mutex);
    CFRelease(v4);
    pthread_mutex_lock(&FSEvents_f2d_public_port_mutex);
    BOOL v5 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    mach_port_deallocate(*MEMORY[0x1895FBBE0], FSEvents_f2d_public_port);
    FSEvents_f2d_public_port = 0;
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    uint64_t v6 = *(void *)(a1 + 360);
    if (v6)
    {
      cancel_source((dispatch_object_s **)(a1 + 360), (int *)(a1 + 368));
      *(_DWORD *)(a1 + 192) = 0;
    }

    uint64_t v7 = *(void *)(a1 + 376);
    if (v7)
    {
      cancel_source((dispatch_object_s **)(a1 + 376), (int *)(a1 + 384));
      *(_DWORD *)(a1 + 196) = 0;
    }

    int v8 = *(__CFRunLoopSource **)(a1 + 216);
    if (v8)
    {
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 224), v8, *(CFRunLoopMode *)(a1 + 232));
      CFRelease(*(CFTypeRef *)(a1 + 216));
      *(void *)(a1 + 216) = 0LL;
    }

    int v9 = *(__CFMachPort **)(a1 + 208);
    if (v9)
    {
      CFMachPortSetInvalidationCallBack(v9, 0LL);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 208));
      CFRelease(*(CFTypeRef *)(a1 + 208));
      *(void *)(a1 + 208) = 0LL;
    }

    if (!v7)
    {
      mach_port_deallocate(*v5, *(_DWORD *)(a1 + 196));
      *(_DWORD *)(a1 + 196) = 0;
    }

    uint64_t v10 = *(__CFMachPort **)(a1 + 200);
    if (v10)
    {
      CFMachPortInvalidate(v10);
      CFRelease(*(CFTypeRef *)(a1 + 200));
      *(void *)(a1 + 200) = 0LL;
    }

    if (!v6)
    {
      dispose_d2f_port(*v3);
      *uint64_t v3 = 0;
    }

    if (FSEvents_connect())
    {
      unsigned int v11 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        server_gone_StreamRef_callback_cold_4();
      }
    }

    else if (allocate_d2f_port((uint64_t)"server_gone_StreamRef_callback", a1))
    {
      uint64_t v12 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        server_gone_StreamRef_callback_cold_3();
      }
    }

    else
    {
      int v13 = (int *)(a1 + 196);
      int v14 = register_with_server( a1,  (uint64_t)"server_gone_StreamRef_callback",  *(_DWORD *)(a1 + 192),  *(_DWORD *)(a1 + 64),  *(_DWORD *)(a1 + 72),  *(const void ***)(a1 + 80),  -1LL,  *(void *)(a1 + 176),  *(_DWORD *)(a1 + 184),  (_DWORD *)(a1 + 196));
      if (v14)
      {
        int v15 = v14;
        int v16 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          server_gone_StreamRef_callback_cold_2(v13, v15, v16);
        }
      }

      else
      {
        CFNumberRef v17 = CFNumberCreate(v2, kCFNumberIntType, (const void *)(a1 + 192));
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v17, (const void *)a1);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v17);
        if (v6)
        {
          if (create_d2f_port_source(a1)) {
            resume_source(*(dispatch_object_s **)(a1 + 360), (int *)(a1 + 368));
          }
          if (create_f2d_private_port_source(a1)) {
            resume_source(*(dispatch_object_s **)(a1 + 376), (int *)(a1 + 384));
          }
        }

        else if (*(void *)(a1 + 224))
        {
          context.version = 0LL;
          context.info = (void *)a1;
          context.retain = (const void *(__cdecl *)(const void *))_FSEventStreamRetainAndReturnSelf;
          context.release = (void (__cdecl *)(const void *))FSEventStreamRelease;
          context.copyDescription = (CFStringRef (__cdecl *)(const void *))FSEventStreamCopyDescription;
          uint64_t v18 = CFMachPortCreateWithPort( 0LL,  *(_DWORD *)(a1 + 196),  (CFMachPortCallBack)FSEventsClientPortCallback,  &context,  0LL);
          *(void *)(a1 + 208) = v18;
          if (v18)
          {
            CFMachPortSetInvalidationCallBack(v18, (CFMachPortInvalidationCallBack)server_gone_callback);
            _createAndAddRunLoopSource( (int)"server_gone_StreamRef_callback",  a1,  *(CFRunLoopRef *)(a1 + 224),  *(CFRunLoopMode *)(a1 + 232));
          }

          else
          {
            uint64_t v19 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              server_gone_StreamRef_callback_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
            }
          }
        }

        FSEventStreamRetain((FSEventStreamRef)a1);
        if (*(uint64_t *)(a1 + 72) >= 1)
        {
          uint64_t v27 = 0LL;
          do
            root_dir_event_callback(a1, v27++, 5);
          while (*(void *)(a1 + 72) > v27);
        }

        FSEventStreamRelease((FSEventStreamRef)a1);
      }
    }
  }

void root_dir_event_callback(uint64_t a1, int a2, int a3)
{
  v41[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void (**)(uint64_t, void, uint64_t, const char **, int *, void *))(a1 + 16);
  if (!v3) {
    return;
  }
  uint64_t v6 = caller_path(*(const char **)(*(void *)(a1 + 80) + 8LL * a2), *(_DWORD *)(*(void *)(a1 + 88) + 4LL * a2));
  int v38 = v6;
  int v37 = a3;
  v41[0] = 0LL;
  int v7 = *(_DWORD *)(a1 + 184);
  if ((v7 & 0x40) != 0)
  {
    int v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    int v9 = (__CFString *)CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], v6);
    if (v9)
    {
      uint64_t v10 = v9;
      values = v9;
      keys = @"path";
      CFTypeRef cf = CFDictionaryCreate( v8,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      if (cf)
      {
        CFArrayRef v11 = CFArrayCreate(v8, &cf, 1LL, MEMORY[0x189605228]);
        if (v11)
        {
          CFArrayRef v12 = v11;
          (*(void (**)(uint64_t, void, uint64_t, CFArrayRef, int *, void *))(a1 + 16))( a1,  *(void *)(a1 + 32),  1LL,  v11,  &v37,  v41);
          CFRelease(v12);
        }

        else
        {
          uint64_t v20 = (os_log_s *)fsevent_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            root_dir_event_callback_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
          }
        }

        CFRelease(cf);
      }

      else
      {
        uint64_t v18 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          root_dir_event_callback_cold_4();
        }
      }

      CFTypeRef v16 = v10;
      goto LABEL_22;
    }

    CFNumberRef v17 = (os_log_s *)fsevent_default_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return;
    }
LABEL_13:
    root_dir_event_callback_cold_1();
    return;
  }

  if ((v7 & 1) == 0)
  {
    v3(a1, *(void *)(a1 + 32), 1LL, &v38, &v37, v41);
    return;
  }

  int v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef cf = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], v6);
  if (!cf)
  {
    uint64_t v19 = (os_log_s *)fsevent_default_log();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      return;
    }
    goto LABEL_13;
  }

  CFArrayRef v14 = CFArrayCreate(v13, &cf, 1LL, MEMORY[0x189605228]);
  if (v14)
  {
    CFArrayRef v15 = v14;
    (*(void (**)(uint64_t, void, uint64_t, CFArrayRef, int *, void *))(a1 + 16))( a1,  *(void *)(a1 + 32),  1LL,  v14,  &v37,  v41);
    CFRelease(v15);
    CFTypeRef v16 = cf;
LABEL_22:
    CFRelease(v16);
    return;
  }

  __darwin_time_t v28 = (os_log_s *)fsevent_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    root_dir_event_callback_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
  }
}

void resume_source(dispatch_object_s *a1, int *a2)
{
  if (a1)
  {
    int v3 = *a2;
    if (*a2)
    {
      if (v3 == 2)
      {
        dispatch_resume(a1);
      }

      else if (v3 == 1)
      {
        dispatch_activate(a1);
      }

      *a2 = 3;
    }
  }

uint64_t __create_f2d_private_port_source_block_invoke(uint64_t a1)
{
  return server_gone_StreamRef_callback(*(void *)(a1 + 32));
}

void __create_f2d_private_port_source_block_invoke_2(uint64_t a1)
{
}

void cancel_source(dispatch_object_s **a1, int *a2)
{
  CFNumberRef v4 = (dispatch_source_s *)*a1;
  if (v4)
  {
    dispatch_source_cancel(v4);
    resume_source(*a1, a2);
    *a1 = 0LL;
  }

  *a2 = 0;
}

uint64_t watch_path(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v10 = 0;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  int v11 = -1;
  int v12 = 1;
  uint64_t v13 = 0xFFFFFFFFLL;
  BOOL v14 = 1;
  while (1)
  {
    unsigned int v15 = v10;
    int v10 = v12;
    realpath_DARWIN_EXTSN(a3, &__s);
    if (v53)
    {
      int v16 = 0;
      while (1)
      {
        int v17 = open(&__s, 0x8000);
        if ((v17 & 0x80000000) == 0) {
          break;
        }
        __error();
        my_dirname(&__s, v54);
        realpath_DARWIN_EXTSN(v54, &__s);
        ++v16;
        if (!v53) {
          goto LABEL_8;
        }
      }

      int v11 = v17;
LABEL_11:
      uint64_t v13 = 0LL;
      goto LABEL_12;
    }

    int v16 = 0;
    if (v11 < 0)
    {
LABEL_8:
      int v11 = open(&__s, 0x8000);
      if (v11 < 0)
      {
        uint64_t v30 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          watch_path_cold_2();
        }
        __error();
        uint64_t v32 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          watch_path_cold_1();
        }
        uint64_t v13 = *__error();
        goto LABEL_45;
      }

      goto LABEL_11;
    }

LABEL_12:
    fcntl(v11, 2, 1LL);
    if (v14 || (int v18 = open(&__s, 0), v18 < 0))
    {
      unsigned int v20 = v15;
    }

    else
    {
      int v19 = v18;
      fstat(v11, &v42);
      fstat(v19, &v41);
      close(v19);
      close(v11);
      if (v42.st_ino == v41.st_ino)
      {
        uint64_t v33 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          watch_path_cold_3();
        }
        int v11 = -1;
        goto LABEL_45;
      }

      unsigned int v20 = v15;
      int v11 = -1;
    }

    *(void *)a4 = v11;
    *(void *)(a4 + 8) = 0x270021FFFCLL;
    *(void *)(a4 + 16) = 0LL;
    *(void *)(a4 + 24) = a6;
    uint64_t v13 = kevent(a2, (const kevent *)a4, 1, 0LL, 0, 0LL);
    if ((v13 & 0x80000000) != 0)
    {
      uint64_t v21 = (os_log_s *)fsevent_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *(void *)(a5 + 24);
        uint64_t v26 = __error();
        uint64_t v27 = strerror(*v26);
        *(_DWORD *)stat buf = 136316162;
        __int16 v44 = a1;
        __int16 v45 = 2080;
        p_s = "watch_path";
        __int16 v47 = 1024;
        int v48 = v11;
        __int16 v49 = 2080;
        *(void *)uint64_t v50 = v37;
        *(_WORD *)&v50[8] = 2080;
        v51[0] = v27;
        _os_log_error_impl( &dword_1874D7000,  v21,  OS_LOG_TYPE_ERROR,  "%s: %s: error trying to add kqueue for fd %d (%s; %s)",
          buf,
          0x30u);
      }
    }

    uint64_t v22 = *(unsigned int *)(a5 + 4);
    if ((v22 & 0x80000000) == 0)
    {
      *(void *)a4 = v22;
      *(void *)(a4 + 8) = 0x270002FFFCLL;
      *(void *)(a4 + 16) = 0LL;
      *(void *)(a4 + 24) = a6;
      uint64_t v13 = kevent(a2, (const kevent *)a4, 1, 0LL, 0, 0LL);
      if ((v13 & 0x80000000) != 0)
      {
        uint64_t v23 = (os_log_s *)fsevent_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v38 = *(_DWORD *)(a5 + 4);
          __darwin_time_t v28 = __error();
          uint64_t v29 = strerror(*v28);
          *(_DWORD *)stat buf = 136315906;
          __int16 v44 = a1;
          __int16 v45 = 2080;
          p_s = "watch_path";
          __int16 v47 = 1024;
          int v48 = v38;
          __int16 v49 = 2080;
          *(void *)uint64_t v50 = v29;
          _os_log_error_impl( &dword_1874D7000,  v23,  OS_LOG_TYPE_ERROR,  "%s: %s: error removing fd %d from kqueue (%s)",  buf,  0x26u);
        }
      }

      close(*(_DWORD *)(a5 + 4));
    }

    *(_DWORD *)a5 = *(_DWORD *)a5 & 0xFFFFFFFE | (v16 != 0);
    *(_DWORD *)(a5 + 4) = v11;
    int v24 = open(&__s, 0);
    if (v24 < 0) {
      break;
    }
    fstat(v11, &v42);
    fstat(v24, &v41);
    close(v24);
    if (v42.st_ino == v41.st_ino) {
      goto LABEL_39;
    }
    uint64_t v25 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 136315394;
      __int16 v44 = "watch_path";
      __int16 v45 = 2080;
      p_s = &__s;
      _os_log_error_impl( &dword_1874D7000,  v25,  OS_LOG_TYPE_ERROR,  "%s: watching path(%s) renamed while registering watchroot",  buf,  0x16u);
    }

LABEL_30:
    BOOL v14 = v24 >= 0;
    int v12 = v10 + 1;
    if (v10 == 1000)
    {
      int v10 = 1001;
      goto LABEL_45;
    }
  }

  if ((*(_DWORD *)a5 & 5) != 4) {
    goto LABEL_30;
  }
  if (!fcntl(*(_DWORD *)(a5 + 4), 50, buf))
  {
    free(*(void **)(a5 + 24));
    *(void *)(a5 + 24) = strdup((const char *)buf);
  }

LABEL_39:
  if (v20 <= 0x3E6 && (v11 & 0x80000000) == 0) {
    return 0LL;
  }
LABEL_45:
  uint64_t v34 = (os_log_s *)fsevent_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    int v36 = strerror(v13);
    *(_DWORD *)stat buf = 136316418;
    __int16 v44 = "watch_path";
    __int16 v45 = 2080;
    p_s = (char *)a3;
    __int16 v47 = 1024;
    int v48 = v11;
    __int16 v49 = 1024;
    *(_DWORD *)uint64_t v50 = v10;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v13;
    LOWORD(v51[0]) = 2080;
    *(void *)((char *)v51 + 2) = v36;
    _os_log_error_impl( &dword_1874D7000,  v34,  OS_LOG_TYPE_ERROR,  "%s: watching path (%s) fd(%d) retry (%d) failed (%d):(%s)",  buf,  0x32u);
  }

  return v13;
}

uint64_t watch_all_parents(uint64_t a1, int kq, char *__s, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  int v10 = *(void **)(a4 + 16);
  if (v10)
  {
    int v11 = *(_DWORD *)(a4 + 8);
    if (v11 >= 1)
    {
      for (uint64_t i = 0LL; i < v11; ++i)
      {
        if ((*(_DWORD *)(*(void *)(a4 + 16) + 4 * i) & 0x80000000) == 0)
        {
          changelist.ident = *(unsigned int *)(*(void *)(a4 + 16) + 4 * i);
          *(void *)&changelist.filter = 0x200002FFFCLL;
          changelist.data = 0LL;
          changelist.int64_t udata = (void *)(a5 | 0x80000000LL);
          kevent(kq, &changelist, 1, 0LL, 0, 0LL);
          close(*(_DWORD *)(*(void *)(a4 + 16) + 4 * i));
          int v11 = *(_DWORD *)(a4 + 8);
        }
      }

      int v10 = *(void **)(a4 + 16);
    }

    free(v10);
    *(void *)(a4 + 16) = 0LL;
    *(_DWORD *)(a4 + 8) = 0;
  }

  if (__s && *__s)
  {
    my_dirname(__s, __sa);
    uint64_t v13 = v39;
    realpath_DARWIN_EXTSN(__sa, v39);
    int v14 = 0;
    do
    {
      while (1)
      {
        int v16 = *v13++;
        int v15 = v16;
        if (v16 != 47) {
          break;
        }
        ++v14;
      }
    }

    while (v15);
    int v19 = malloc(4LL * v14);
    *(void *)(a4 + 16) = v19;
    if (v19)
    {
      uint64_t v20 = 0LL;
      uint64_t v21 = v14;
      *(_DWORD *)(a4 + 8) = v14;
      do
      {
        int v22 = open(v39, 0x8000);
        *(_DWORD *)(*(void *)(a4 + 16) + 4 * v20) = v22;
        if ((v22 & 0x80000000) == 0)
        {
          fcntl(v22, 2, 1LL);
          changelist.ident = *(int *)(*(void *)(a4 + 16) + 4 * v20);
          *(void *)&changelist.filter = 0x200021FFFCLL;
          changelist.data = 0LL;
          changelist.int64_t udata = (void *)(a5 | 0x80000000LL);
          if (kevent(kq, &changelist, 1, 0LL, 0, 0LL) < 0)
          {
            uint64_t v23 = (os_log_s *)fsevent_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              int v24 = *(_DWORD *)(*(void *)(a4 + 16) + 4 * v20);
              uint64_t v25 = __error();
              uint64_t v26 = strerror(*v25);
              *(_DWORD *)stat buf = 136316162;
              uint64_t v29 = a1;
              __int16 v30 = 2080;
              uint64_t v31 = "watch_all_parents";
              __int16 v32 = 1024;
              int v33 = v24;
              __int16 v34 = 2080;
              uint64_t v35 = v39;
              __int16 v36 = 2080;
              uint64_t v37 = v26;
              _os_log_error_impl( &dword_1874D7000,  v23,  OS_LOG_TYPE_ERROR,  "%s: %s: error trying to add kqueue for fd %d (%s; %s)",
                buf,
                0x30u);
            }
          }
        }

        __strcpy_chk();
        my_dirname(__sa, v39);
        uint64_t result = 0LL;
        ++v20;
      }

      while (v20 < v21 && v39[1]);
    }

    else
    {
      return 12LL;
    }
  }

  else
  {
    int v17 = (os_log_s *)fsevent_default_log();
    uint64_t result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      watch_all_parents_cold_1();
      return 0LL;
    }
  }

  return result;
}

char *my_dirname(char *__s, char *a2)
{
  if (__s && *__s && (CFNumberRef v4 = strrchr(__s, 47)) != 0LL)
  {
    if (v4 > __s)
    {
      while (*v4 == 47)
      {
        if (--v4 <= __s)
        {
          CFNumberRef v4 = __s;
          break;
        }
      }
    }

    uint64_t v5 = v4 - __s;
    if (v4 - __s > 1023)
    {
      strncpy(a2, __s, 0x3FFuLL);
      a2[1023] = 0;
    }

    else
    {
      uint64_t v6 = v5 + 1;
      strncpy(a2, __s, v5 + 1);
      a2[v6] = 0;
    }
  }

  else
  {
    strcpy(a2, "./");
  }

  return a2;
}

uint64_t FSEventsClientProcessMessageCallback()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  return FSEventsD2F_server(v0, (uint64_t)v2);
}

void __create_d2f_port_source_block_invoke(uint64_t a1)
{
}

void receive_and_dispatch_rcv_msg(mach_port_name_t a1)
{
  mach_msg_return_t v7;
  mach_msg_size_t v8;
  mach_msg_header_t *v9;
  os_log_s *v10;
  os_log_s *v11;
  void v12[2];
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *MEMORY[0x1895FD590];
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  CFNumberRef v4 = (mach_msg_header_t *)((char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (_DWORD *)((char *)v12 - v5);
  int v7 = mach_msg(v4, 50331910, 0, v2, a1, 0, 0);
  if (!v7)
  {
LABEL_8:
    int v9 = (mach_msg_header_t *)((char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    goto LABEL_9;
  }

  if (v7 != 268451844)
  {
    int v11 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      receive_and_dispatch_rcv_msg_cold_1();
    }
    goto LABEL_8;
  }

  int v8 = v4->msgh_size + 68;
  int v9 = (mach_msg_header_t *)malloc(v8);
  if (mach_msg(v9, 262, 0, v8, a1, 0, 0))
  {
    int v10 = (os_log_s *)fsevent_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      receive_and_dispatch_rcv_msg_cold_2();
    }
  }

LABEL_9:
  _DWORD *v6 = 0;
  v6[1] = v2;
  FSEventsD2F_server(v9, (uint64_t)v6);
  if (v9 != v4) {
    free(v9);
  }
}

void __create_d2f_port_source_block_invoke_2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_5(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_6( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_9(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_14(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_20( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

char *OUTLINED_FUNCTION_24( int a1, mach_error_t error_value, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return mach_error_string(error_value);
}

char *OUTLINED_FUNCTION_25@<X0>(mach_error_t error_value@<W0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return mach_error_string(error_value);
}

void OUTLINED_FUNCTION_26(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_27( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_28( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void _Xcallback_rpc(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 120)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && *(_BYTE *)(a1 + 55) == 1 && *(_BYTE *)(a1 + 71) == 1 && *(_BYTE *)(a1 + 87) == 1)
    {
      int v3 = *(_DWORD *)(a1 + 40) >> 2;
      if (v3 == *(_DWORD *)(a1 + 104))
      {
        int v4 = *(_DWORD *)(a1 + 56) >> 2;
        if (v4 == *(_DWORD *)(a1 + 108))
        {
          int v5 = *(_DWORD *)(a1 + 72) >> 3;
          if (v5 == *(_DWORD *)(a1 + 112) && *(_DWORD *)(a1 + 88) == *(_DWORD *)(a1 + 116))
          {
            *(_DWORD *)(a2 + 32) = implementation_callback_rpc( *(_DWORD *)(a1 + 12),  *(unsigned int *)(a1 + 100),  *(void *)(a1 + 28),  v3,  *(_BYTE **)(a1 + 44),  v4,  *(__CFArray **)(a1 + 60),  v5,  *(char **)(a1 + 76),  *(_DWORD *)(a1 + 88));
            mig_deallocate(*(void *)(a1 + 76), *(unsigned int *)(a1 + 88));
            *(void *)(a1 + 76) = 0LL;
            *(_DWORD *)(a1 + 88) = 0;
            mig_deallocate(*(void *)(a1 + 60), *(unsigned int *)(a1 + 72));
            *(void *)(a1 + 60) = 0LL;
            *(_DWORD *)(a1 + 72) = 0;
            mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
            *(void *)(a1 + 44) = 0LL;
            *(_DWORD *)(a1 + 56) = 0;
            mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
            *(void *)(a1 + 28) = 0LL;
            *(_DWORD *)(a1 + 40) = 0;
            return;
          }
        }
      }
    }

    int v6 = -300;
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
}

uint64_t FSEventsD2F_server(_DWORD *a1, uint64_t a2)
{
  unsigned int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 67000)
  {
    _Xcallback_rpc((uint64_t)a1, a2);
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t f2d_register_rpc( mach_port_t a1, int a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, int a9, uint64_t a10, int a11, uint64_t a12, int a13, uint64_t a14, int a15, uint64_t a16, _DWORD *a17)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  int v23 = 5;
  int v24 = a2;
  int v26 = 1310720;
  uint64_t v27 = a5;
  int v28 = 16777472;
  int v29 = 4 * a6;
  uint64_t v30 = a7;
  int v31 = 16777472;
  int v32 = a8;
  uint64_t v33 = a10;
  int v34 = 16777472;
  int v35 = 4 * a11;
  uint64_t v36 = a12;
  int v37 = 16777472;
  int v38 = a13;
  uint64_t v39 = *MEMORY[0x1895F8468];
  int v40 = a3;
  int v41 = a4;
  int v42 = a6;
  int v43 = a8;
  int v44 = a9;
  int v45 = a11;
  int v46 = a13;
  uint64_t v47 = a14;
  int v48 = a15;
  uint64_t v49 = a16;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x101D000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v19 = mach_msg(&msg, 3162115, 0xA0u, 0x30u, special_reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) > 0xE || ((1 << (v19 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v20 = 4294966988LL;
      }

      else if (msg.msgh_id == 66100)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v20 = 4294966996LL;
            if (v25)
            {
              if (msg.msgh_remote_port) {
                uint64_t v20 = 4294966996LL;
              }
              else {
                uint64_t v20 = v25;
              }
            }
          }

          else
          {
            uint64_t v20 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v20 = 4294966996LL;
        if (v23 == 1 && msg.msgh_size == 40 && !msg.msgh_remote_port && HIWORD(v26) << 16 == 1114112)
        {
          uint64_t v20 = 0LL;
          *a17 = v24;
          return v20;
        }
      }

      else
      {
        uint64_t v20 = 4294966995LL;
      }

LABEL_23:
      mach_msg_destroy(&msg);
      return v20;
    }

    mig_dealloc_special_reply_port();
  }

  return v20;
}

uint64_t f2d_flush_rpc(mach_port_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x101D100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v6 = 4294966988LL;
      }

      else if (msg.msgh_id == 66101)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v6 = v10;
              if (!v10)
              {
                *a2 = v11;
                return v6;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = v10 == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996LL;
            }
            else {
              uint64_t v6 = v10;
            }
            goto LABEL_22;
          }
        }

        uint64_t v6 = 4294966996LL;
      }

      else
      {
        uint64_t v6 = 4294966995LL;
      }

LABEL_22:
      mach_msg_destroy(&msg);
      return v6;
    }

    mig_dealloc_special_reply_port();
  }

  return v6;
}

      mach_msg_destroy(&msg);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&msg);
      return v6;
    }

    mig_dealloc_special_reply_port();
  }

  return v6;
}

      mach_msg_destroy(&msg);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

uint64_t f2d_get_server_uuid_rpc(mach_port_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v12 = *MEMORY[0x1895F8468];
  unsigned int v13 = a2;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x101D200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&msg, 3162115, 0x24u, 0x50u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (msg.msgh_id == 66102)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 72)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v7 = v13;
              if (!v13)
              {
                __int128 v10 = v15;
                *(_OWORD *)a3 = v14;
                *(_OWORD *)(a3 + 16) = v10;
                *(_DWORD *)(a3 + 32) = v16;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = v13 == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = v13;
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t f2d_get_current_event_id_rpc(mach_port_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x101D300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v6 = 4294966988LL;
      }

      else if (msg.msgh_id == 66103)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v6 = v10;
              if (!v10)
              {
                *a2 = v11;
                return v6;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = v10 == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996LL;
            }
            else {
              uint64_t v6 = v10;
            }
            goto LABEL_22;
          }
        }

        uint64_t v6 = 4294966996LL;
      }

      else
      {
        uint64_t v6 = 4294966995LL;
      }

uint64_t f2d_get_last_event_for_device_before_time_rpc( mach_port_t a1, unsigned int a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1895F8468];
  unsigned int v13 = a2;
  uint64_t v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x101D400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x2Cu, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 66104)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v8 = v13;
              if (!v13)
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v13 == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = v13;
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t f2d_purge_events_for_device_up_to_event_id_rpc( mach_port_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v12 = *MEMORY[0x1895F8468];
  unsigned int v13 = a2;
  uint64_t v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  v11.msgh_bits = 5395;
  *(void *)&v11.msgh_voucher_port = 0x101D500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x2Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 66105)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = v13;
              if (!v13)
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v13 == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = v13;
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t f2d_unregister_rpc(mach_port_t a1)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x101D600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v3 = mach_msg(&msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_special_reply_port();
      return v4;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v4 = 4294966988LL;
    }

    else if (msg.msgh_id == 66106)
    {
      uint64_t v4 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v4 = v7;
        if (!v7) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v4;
}

void FSEventStreamStart_cold_1()
{
}

void FSEventStreamStart_cold_2()
{
}

void FSEventStreamStart_cold_3()
{
}

void register_with_server_cold_1()
{
  OUTLINED_FUNCTION_0( &dword_1874D7000,  v0,  v1,  "%s: %s: ERROR: array_of_path_lengths = malloc() failed",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_2()
{
  OUTLINED_FUNCTION_0( &dword_1874D7000,  v0,  v1,  "%s: %s: ERROR: array_of_path_offsets = malloc() failed",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_3()
{
  OUTLINED_FUNCTION_0(&dword_1874D7000, v0, v1, "%s: %s: ERROR: paths_blob = malloc() failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_4()
{
  *(_DWORD *)mach_msg_header_t v11 = 136315906;
  *(void *)&v11[4] = v1;
  OUTLINED_FUNCTION_4();
  *(void *)&v11[14] = "register_with_server";
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(&dword_1874D7000, v0, v10, "%s: %s: ERROR: f2d_register_rpc() => %s (%d)", v11);
  OUTLINED_FUNCTION_10();
}

void register_with_server_cold_5()
{
}

void register_with_server_cold_6()
{
}

void register_with_server_cold_7()
{
}

void _FSEventStreamRetainAndReturnSelf_cold_1()
{
}

void FSEventStreamRelease_cold_1()
{
}

void FSEventStreamRelease_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamCopyDescription_cold_1()
{
}

void FSEventStreamCopyDescription_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: cStr = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventsClientPortCallback_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamStop_cold_1()
{
}

void FSEventStreamStop_cold_2()
{
}

void dispose_f2d_private_port_cold_1(mach_error_t a1)
{
  OUTLINED_FUNCTION_28( &dword_1874D7000,  v1,  v2,  "%s: ERROR: mach_port_deallocate(port = 0x%x) => %s (%d)",  v3,  v4,  v5,  v6,  2u);
  OUTLINED_FUNCTION_10();
}

void dispose_f2d_private_port_cold_2()
{
  OUTLINED_FUNCTION_6(&dword_1874D7000, v1, v2, "%s: ERROR: f2d_unregister_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void implementation_callback_rpc_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "FSEvents: %s: WARNING: num_paths == 0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: CFNumberCreate() => NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3( &dword_1874D7000,  a1,  a3,  "%s: ERROR: CFDictionaryGetValue(FSEvents_streamDict, cfPortNumber) => NULL",  a5,  a6,  a7,  a8,  2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: eventPaths = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: pathFlags = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_6( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3( &dword_1874D7000,  a1,  a3,  "%s: ERROR: cfStringRef_eventPaths = calloc() failed",  a5,  a6,  a7,  a8,  2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void implementation_callback_rpc_cold_8()
{
}

void implementation_callback_rpc_cold_9( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: CFArrayCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_10( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: CFDictionaryCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_11(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "implementation_callback_rpc";
  OUTLINED_FUNCTION_5(&dword_1874D7000, a3, (uint64_t)a3, "%s: ERROR: CFNumberCreate() => NULL\n", a1);
}

void implementation_callback_rpc_cold_13( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: eventFlags = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1874D7000, a1, a3, "%s: ERROR: eventIds = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_15()
{
}

void implementation_callback_rpc_cold_16()
{
}

void implementation_callback_rpc_cold_17()
{
}

void implementation_callback_rpc_cold_18()
{
}

void FSEventStreamRetain_cold_1()
{
}

void FSEventStreamGetLatestEventId_cold_1()
{
}

void FSEventStreamGetDeviceBeingWatched_cold_1()
{
}

void FSEventStreamCopyPathsBeingWatched_cold_1()
{
}

void FSEventStreamCopyPathsBeingWatched_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamCopyPathsBeingWatched_cold_3(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*a1 + 8 * a2);
  int v4 = 136315394;
  uint64_t v5 = "FSEventStreamCopyPathsBeingWatched";
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_1874D7000,  log,  OS_LOG_TYPE_ERROR,  "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyPathsBeingWatched_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _FSEventStreamCreate_cold_1()
{
}

void _FSEventStreamCreate_cold_2(uint64_t a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "_FSEventStreamCreate";
  __int16 v6 = 2048;
  uint64_t v7 = 456LL;
  _os_log_error_impl( &dword_1874D7000,  a2,  OS_LOG_TYPE_ERROR,  "%s: %s: ERROR: could not allocate %lu bytes for FSEventStream",  (uint8_t *)&v2,  0x20u);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_3(uint64_t a1)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15( &dword_1874D7000,  v1,  v2,  "%s: %s: ERROR: could not allocate %lu bytes for array of path strings",  (const char *)v3,  DWORD2(v3),  v4);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_4()
{
}

void _FSEventStreamCreate_cold_5(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v3 = 136315650;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4();
  uint64_t v5 = "_FSEventStreamCreate";
  __int16 v6 = 1024;
  int v7 = v1;
  OUTLINED_FUNCTION_9( &dword_1874D7000,  v2,  (uint64_t)v2,  "%s: %s: ERROR: could not allocate %d bytes for path string (2)",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_6(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v4 = 136315650;
  uint64_t v5 = a2;
  OUTLINED_FUNCTION_4();
  __int16 v6 = "_FSEventStreamCreate";
  __int16 v7 = 1024;
  int v8 = v2;
  OUTLINED_FUNCTION_9( &dword_1874D7000,  v3,  (uint64_t)v3,  "%s: %s: ERROR: (CFStringGetTypeID() != CFGetTypeID(cfStringRef)) (uint64_t i = %d)\n",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_7()
{
}

void _FSEventStreamCreate_cold_8(uint64_t a1)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15( &dword_1874D7000,  v1,  v2,  "%s: %s: ERROR: could not allocate %lu bytes for array of dir_info structs",  (const char *)v3,  DWORD2(v3),  v4);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_9(uint64_t a1)
{
  LODWORD(v3) = 136315650;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15( &dword_1874D7000,  v1,  v2,  "%s: %s: ERROR: could not allocate %lu bytes for array of kevents",  (const char *)v3,  DWORD2(v3),  v4);
  OUTLINED_FUNCTION_16();
}

void FSEventStreamCreateRelativeToDevice_cold_1()
{
}

void _FSEventStreamDeallocate_cold_1()
{
}

void _FSEventStreamDeallocate_cold_2()
{
}

void _FSEventStreamDeallocate_cold_3()
{
}

void _FSEventStreamDeallocate_cold_4()
{
}

void FSEventStreamScheduleWithRunLoop_cold_1()
{
}

void FSEventStreamScheduleWithRunLoop_cold_2()
{
}

void FSEventStreamScheduleWithRunLoop_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamScheduleWithRunLoop_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamScheduleWithRunLoop_cold_5()
{
  OUTLINED_FUNCTION_6( &dword_1874D7000,  v1,  v2,  "%s: ERROR: _createAndAddRunLoopSource(...) => %s (%d)",  v3,  v4,  v5,  v6,  2u);
  OUTLINED_FUNCTION_13();
}

void FSEventStreamScheduleWithRunLoop_cold_6()
{
  OUTLINED_FUNCTION_6(&dword_1874D7000, v1, v2, "%s: ERROR: allocate_d2f_port(...) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void allocate_d2f_port_cold_1()
{
  *(_DWORD *)mach_msg_header_t v11 = 136315906;
  *(void *)&v11[4] = v1;
  OUTLINED_FUNCTION_4();
  *(void *)&v11[14] = "allocate_d2f_port";
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(&dword_1874D7000, v0, v10, "%s: %s: ERROR: mach_port_allocate() => %s (%d)", v11);
  OUTLINED_FUNCTION_10();
}

void _createAndAddRunLoopSource_cold_1()
{
}

void _createAndAddRunLoopSource_cold_2()
{
  OUTLINED_FUNCTION_0(&dword_1874D7000, v0, v1, "%s: %s: ERROR: CFMachPortCreateWithPort() => NULL", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _createAndAddRunLoopSource_cold_3()
{
  OUTLINED_FUNCTION_0( &dword_1874D7000,  v0,  v1,  "%s: %s: ERROR: CFMachPortCreateRunLoopSource() => NULL",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_1();
}

void _createAndAddRunLoopSource_cold_4()
{
}

void FSEventStreamUnscheduleFromRunLoop_cold_1()
{
}

void FSEventStreamUnscheduleFromRunLoop_cold_2()
{
}

void FSEventStreamUnscheduleFromRunLoop_cold_3()
{
}

void FSEventStreamSetDispatchQueue_cold_1()
{
}

void FSEventStreamSetDispatchQueue_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamSetDispatchQueue_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FSEventStreamSetDispatchQueue_cold_4()
{
  OUTLINED_FUNCTION_6(&dword_1874D7000, v1, v2, "%s: ERROR: allocate_d2f_port(...) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void process_dir_events_cold_1(int a1)
{
  OUTLINED_FUNCTION_6(&dword_1874D7000, v1, v2, "%s: kevent returned %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void FSEventStreamFlushAsync_cold_1()
{
}

void FSEventStreamFlushAsync_cold_2()
{
}

void FSEventStreamFlushAsync_cold_3()
{
  OUTLINED_FUNCTION_6(&dword_1874D7000, v1, v2, "%s: ERROR: f2d_flush_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void FSEventStreamFlushSync_cold_1()
{
}

void FSEventStreamFlushSync_cold_3()
{
}

void FSEventStreamFlushSync_cold_4()
{
}

void FSEventStreamFlushSync_cold_5()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(_DWORD *)uint64_t v4 = 136315650;
  OUTLINED_FUNCTION_23();
  *(_DWORD *)&v4[7] = 3370;
  v4[9] = v0;
  int v5 = v1;
  OUTLINED_FUNCTION_26(&dword_1874D7000, v2, v3, "%s:%d: error waiting on the dispatch_cond (%d)\n", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushSync_cold_6()
{
}

void FSEventStreamFlushSync_cold_7()
{
  *(_DWORD *)mach_msg_header_t v11 = 136315906;
  *(void *)&v11[4] = "FSEventStreamFlushSync";
  *(_WORD *)&v11[12] = 2048;
  *(void *)&v11[14] = v1;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(&dword_1874D7000, v0, v10, "%s(streamRef = %p): ERROR: f2d_flush_rpc() => %s (%d)", v11);
  OUTLINED_FUNCTION_10();
}

void FSEventStreamFlushSync_cold_8()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(_DWORD *)int v4 = 136315650;
  OUTLINED_FUNCTION_23();
  *(_DWORD *)&v4[7] = 3329;
  v4[9] = v0;
  int v5 = v1;
  OUTLINED_FUNCTION_26(&dword_1874D7000, v2, v3, "%s:%d: error waiting on the dispatch_cond (%d)\n", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void _runRunLoopOnceForFlushSync_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_32();
  int v2 = 1;
  OUTLINED_FUNCTION_14( &dword_1874D7000,  v0,  (uint64_t)v0,  "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)",  v1);
  OUTLINED_FUNCTION_16();
}

void _runRunLoopOnceForFlushSync_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_32();
  int v2 = 2;
  OUTLINED_FUNCTION_14( &dword_1874D7000,  v0,  (uint64_t)v0,  "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)",  v1);
  OUTLINED_FUNCTION_16();
}

void FSEventStreamInvalidate_cold_1()
{
}

void FSEventStreamInvalidate_cold_2()
{
}

void FSEventStreamInvalidate_cold_3()
{
}

void dispose_d2f_port_cold_1(mach_error_t a1)
{
  OUTLINED_FUNCTION_28( &dword_1874D7000,  v1,  v2,  "%s: ERROR: mach_port_mod_refs(port = 0x%x, MACH_PORT_RIGHT_RECEIVE, -1) => %s (%d)",  v3,  v4,  v5,  v6,  2u);
  OUTLINED_FUNCTION_10();
}

void FSEvents_connect_cold_1()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  OUTLINED_FUNCTION_21();
  bootstrap_strerror(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1874D7000, v1, v2, "%s: ERROR: FSEvents_connect() => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

void FSEventsCopyUUIDForDevice_cold_1()
{
}

void FSEventsPurgeEventsForDeviceUpToEventId_cold_1()
{
}

void server_gone_StreamRef_callback_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void server_gone_StreamRef_callback_cold_2(int *a1, int a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "server_gone_StreamRef_callback";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  OUTLINED_FUNCTION_26( &dword_1874D7000,  a3,  (uint64_t)a3,  "%s: re-registering with server failed and returned %d (f2d port %u)",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void server_gone_StreamRef_callback_cold_3()
{
  OUTLINED_FUNCTION_8(&dword_1874D7000, v0, v1, "%s: re-allocating d2f port failed and returned %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void server_gone_StreamRef_callback_cold_4()
{
}

void root_dir_event_callback_cold_1()
{
}

void root_dir_event_callback_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void root_dir_event_callback_cold_4()
{
}

void watch_path_cold_1()
{
  __int16 v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_27( &dword_1874D7000,  v1,  v2,  "%s: %s:2: open('%s', O_RDONLY) failed <3>, errno = %d (%s)",  v3,  v4,  v5,  v6,  2u);
  OUTLINED_FUNCTION_30();
}

void watch_path_cold_2()
{
  __int16 v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_27( &dword_1874D7000,  v1,  v2,  "%s: %s:2: open('%s', O_RDONLY) failed <2>, errno = %d (%s)",  v3,  v4,  v5,  v6,  2u);
  OUTLINED_FUNCTION_30();
}

void watch_path_cold_3()
{
}

void watch_all_parents_cold_1()
{
}

void receive_and_dispatch_rcv_msg_cold_1()
{
}

void receive_and_dispatch_rcv_msg_cold_2()
{
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

CFFileDescriptorRef CFFileDescriptorCreate( CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x189602C90](allocator, *(void *)&fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource( CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602C98](allocator, f, order);
}

void CFFileDescriptorDisableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return MEMORY[0x189602CB0](f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode( CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x189603198](mode, returnAfterSourceHandled, seconds);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1895F89F8]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1895F9620]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1895F9648](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1895FAE30]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1895FB520](a1, a2);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1895FB548](a1, *(void *)&a2, *(void *)&a3);
}

int kevent( int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1895FB8D8](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x1895FB910]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1895FBE88]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1895FBEA0]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFB0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

void syslog(int a1, const char *a2, ...)
{
}