uint64_t cLogInternalErrorTrackerFailedtoReadMMAPFile()
{
  return +[NEDiagnosticReport logInternalError:subType:context:]( &OBJC_CLASS___NEDiagnosticReport,  "logInternalError:subType:context:",  @"Tracker",  @"FailedtoReadMMAPFile",  0LL);
}

uint64_t NEFlowGetTypeID()
{
  if (runtime_inited != -1) {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
  }
  return __kNEFlowTypeID;
}

uint64_t __NEFlowGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kNEFlowTypeID = result;
  return result;
}

void __NEFlowDeallocate(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 248);
    uint64_t v5 = *(void *)(a1 + 256);
    uint64_t v6 = *(void *)(a1 + 232);
    uint64_t v7 = *(void *)(a1 + 240);
    v30[0] = 67110144;
    v30[1] = v3;
    __int16 v31 = 2048;
    uint64_t v32 = v4;
    __int16 v33 = 2048;
    uint64_t v34 = v5;
    __int16 v35 = 2048;
    uint64_t v36 = v6;
    __int16 v37 = 2048;
    uint64_t v38 = v7;
    _os_log_impl( &dword_187528000,  v2,  OS_LOG_TYPE_DEFAULT,  "(%u): Destroying, client tx %llu, client rx %llu, kernel rx %llu, kernel tx %llu",  (uint8_t *)v30,  0x30u);
  }

  flow_cancel_bridged_connection(a1, 0LL);
  v8 = *(const void **)(a1 + 48);
  if (v8) {
    CFRelease(v8);
  }
  v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  v10 = *(const void **)(a1 + 64);
  if (v10) {
    CFRelease(v10);
  }
  v11 = *(const void **)(a1 + 72);
  if (v11) {
    CFRelease(v11);
  }
  v12 = *(const void **)(a1 + 80);
  if (v12) {
    CFRelease(v12);
  }
  v13 = *(const void **)(a1 + 88);
  if (v13) {
    CFRelease(v13);
  }
  v14 = *(const void **)(a1 + 32);
  if (v14) {
    CFRelease(v14);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  v15 = *(dispatch_object_s **)(a1 + 136);
  if (v15) {
    dispatch_release(v15);
  }
  v16 = *(void **)(a1 + 200);
  v17 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (v16)
  {
    v18 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      *(void *)(a1 + 200) = v16[1];
      CFAllocatorDeallocate(v18, v16);
      v16 = *(void **)(a1 + 200);
    }

    while (v16);
  }

  flow_clear_datagram_queue(*(void **)(a1 + 264), *(void **)(a1 + 272));
  *(void *)(a1 + 264) = 0LL;
  *(void *)(a1 + 272) = a1 + 264;
  v19 = *(void **)(a1 + 296);
  if (v19)
  {
    v20 = (dispatch_object_s *)v19[16];
    if (v20)
    {
      dispatch_release(v20);
      v19 = *(void **)(a1 + 296);
    }

    CFAllocatorDeallocate(*v17, v19);
  }

  flow_handle_pending_write_requests(a1, 0LL);
  uint64_t v21 = 0LL;
  uint64_t v22 = a1 + 144;
  do
  {
    v23 = *(const void **)(v22 + v21);
    if (v23)
    {
      _Block_release(v23);
      *(void *)(v22 + v21) = 0LL;
    }

    v21 += 8LL;
  }

  while (v21 != 56);
  v24 = *(const void **)(a1 + 352);
  if (v24) {
    CFRelease(v24);
  }
  v25 = *(const void **)(a1 + 360);
  if (v25) {
    CFRelease(v25);
  }
  v26 = *(const void **)(a1 + 368);
  if (v26) {
    CFRelease(v26);
  }
  v27 = *(const void **)(a1 + 376);
  if (v27) {
    CFRelease(v27);
  }
  v28 = *(const void **)(a1 + 384);
  if (v28) {
    CFRelease(v28);
  }
  v29 = *(const void **)(a1 + 392);
  if (v29) {
    CFRelease(v29);
  }
}

BOOL __NEFlowEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t __NEFlowHashCode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFStringRef __NEFlowCopyDescription(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  *(_OWORD *)v20 = *(_OWORD *)"<none>";
  v2 = *(const __CFData **)(a1 + 48);
  if (v2)
  {
    BytePtr = CFDataGetBytePtr(v2);
    uint64_t v4 = NECreateAddressStringWithPort((uint64_t)BytePtr);
  }

  else
  {
    uint64_t v4 = @"<unknown>";
  }

  uint64_t v5 = *(const __CFData **)(a1 + 56);
  if (v5)
  {
    uint64_t v6 = CFDataGetBytePtr(v5);
    uint64_t v7 = NECreateAddressStringWithPort((uint64_t)v6);
  }

  else
  {
    uint64_t v7 = @"<unknown>";
  }

  v8 = *(const __CFData **)(a1 + 392);
  if (v8)
  {
    v9 = CFDataGetBytePtr(v8);
    v10 = out;
    uuid_unparse(v9, out);
  }

  else
  {
    v10 = 0LL;
  }

  unsigned int v11 = *(_DWORD *)(a1 + 400);
  if (v11) {
    if_indextoname(v11, v20);
  }
  v12 = "unknown";
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 == 2) {
    v12 = "datagram";
  }
  if (v13 == 1) {
    v12 = "stream";
  }
  v14 = *(const __CFString **)(a1 + 80);
  v15 = &stru_18A06F2C8;
  if (!v14) {
    v14 = &stru_18A06F2C8;
  }
  if (*(void *)(a1 + 64)) {
    v15 = *(const __CFString **)(a1 + 64);
  }
  v16 = "";
  if (v10) {
    v17 = v10;
  }
  else {
    v17 = "";
  }
  if ((*(_DWORD *)(a1 + 344) & 8) != 0) {
    v16 = "(bound)";
  }
  CFStringRef v18 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"NEFlow type = %s, app = %@, name = %@, %@ <-> %@, filter_id = %s, interface = %s%s",  v12,  v14,  v15,  v7,  v4,  v17,  v20,  v16);
  if (v4) {
    CFRelease(v4);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v18;
}

void flow_cancel_bridged_connection(uint64_t a1, CFTypeRef cf)
{
  if (cf)
  {
    uint64_t v4 = *(const void **)(a1 + 32);
    if (v4) {
      CFRelease(v4);
    }
    *(void *)(a1 + 32) = CFRetain(cf);
  }

  flow_read_close(a1, 1);
  flow_write_close(a1, 1);
  if ((~*(_DWORD *)(a1 + 100) & 3) == 0 && !*(_BYTE *)(a1 + 320)) {
    flow_drop_director((void *)a1);
  }
  flow_cancel_connection_waiting_timer(a1);
  uint64_t v5 = *(nw_connection **)(a1 + 408);
  if (v5)
  {
    nw_connection_cancel(v5);
    nw_release(*(void **)(a1 + 408));
    *(void *)(a1 + 408) = 0LL;
  }

  uint64_t v6 = *(nw_connection_group **)(a1 + 416);
  if (v6)
  {
    nw_connection_group_cancel(v6);
    nw_release(*(void **)(a1 + 416));
    *(void *)(a1 + 416) = 0LL;
  }

  uint64_t v7 = *(void **)(a1 + 128);
  if (v7)
  {
    os_release(v7);
    *(void *)(a1 + 128) = 0LL;
  }
}

void flow_clear_datagram_queue(void *ptr, void *a2)
{
  uint64_t v6 = a2;
  if (ptr)
  {
    v2 = ptr;
    int v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      uint64_t v5 = (void *)v2[18];
      if (!v5) {
        uint64_t v6 = &v5;
      }
      uint64_t v4 = (dispatch_object_s *)v2[16];
      if (v4) {
        dispatch_release(v4);
      }
      CFAllocatorDeallocate(v3, v2);
      v2 = v5;
    }

    while (v5);
  }

void flow_handle_pending_write_requests(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v3 = *(void **)(a1 + 304);
  if (!v3) {
    goto LABEL_12;
  }
  uint64_t v5 = (void *)(a1 + 304);
  uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  while (1)
  {
    uint64_t v7 = v3;
    if (a2)
    {
      int v8 = (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v3);
      uint64_t v7 = (void *)*v5;
      if (!v8) {
        break;
      }
    }

    uint64_t v9 = v7[20];
    *uint64_t v5 = v9;
    if (!v9) {
      *(void *)(a1 + 312) = v5;
    }
    v10 = (const void *)v3[16];
    if (v10) {
      CFRelease(v10);
    }
    unsigned int v11 = (const void *)v3[19];
    if (v11) {
      _Block_release(v11);
    }
    CFAllocatorDeallocate(v6, v3);
    int v3 = (void *)*v5;
    if (!*v5) {
      goto LABEL_12;
    }
  }

  if (!v7)
  {
LABEL_12:
    if (*(_BYTE *)(a1 + 320))
    {
      v12 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v16 = *(_DWORD *)(a1 + 24);
        v17[0] = 67109378;
        v17[1] = v16;
        __int16 v18 = 2080;
        v19 = "All data written to the kernel, sending close";
        _os_log_debug_impl(&dword_187528000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v17, 0x12u);
      }

      *(_BYTE *)(a1 + 320) = 0;
      uint64_t v13 = *(unsigned int *)(a1 + 24);
      uint64_t v14 = *(void *)(a1 + 40);
      CFIndex v15 = flow_error_to_errno(*(void *)(a1 + 32));
      flow_director_send_close(v14, v13, v15, 0LL, *(_DWORD *)(a1 + 100) & 4);
      if ((~*(_DWORD *)(a1 + 100) & 3) == 0 && !*(_BYTE *)(a1 + 320)) {
        flow_drop_director((void *)a1);
      }
    }
  }

CFIndex flow_error_to_errno(CFIndex result)
{
  if (result)
  {
    v1 = (__CFError *)result;
    Domain = (__CFString *)CFErrorGetDomain((CFErrorRef)result);
    if (Domain == @"com.apple.VPNTunnel")
    {
      CFIndex Code = CFErrorGetCode(v1);
    }

    else if (Domain == (__CFString *)*MEMORY[0x189604F58] || Domain == (__CFString *)*MEMORY[0x189608F30])
    {
      return CFErrorGetCode(v1);
    }

    return 50LL;
  }

  return result;
}

void flow_director_send_close(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v9 = bswap32(a3);
  v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  unsigned int v11 = (_DWORD *)MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 26LL, 0LL);
  *(_BYTE *)unsigned int v11 = 4;
  v11[1] = bswap32(a2);
  *((_BYTE *)v11 + 8) = 5;
  *(_DWORD *)((char *)v11 + 9) = 0x4000000;
  *(_DWORD *)((char *)v11 + 13) = v9;
  *((_BYTE *)v11 + 17) = 7;
  *(_DWORD *)((char *)v11 + 18) = 0x4000000;
  *(_DWORD *)((char *)v11 + 22) = bswap32(a4);
  flow_director_msg_send(a1, (uint64_t)v11, 0x1AuLL, a5 == 0);
  CFAllocatorDeallocate(v10, v11);
}

void flow_drop_director(void *a1)
{
  uint64_t v1 = a1[5];
  if (v1)
  {
    CFRetain(a1);
    int v3 = *(dispatch_queue_s **)(v1 + 16);
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 0x40000000LL;
    v4[2] = __flow_drop_director_block_invoke;
    v4[3] = &__block_descriptor_tmp_102;
    v4[4] = a1;
    v4[5] = v1;
    dispatch_async(v3, v4);
  }

void __flow_drop_director_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    int v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 24LL);
      v6[0] = 67109378;
      v6[1] = v5;
      __int16 v7 = 2080;
      int v8 = "Dropping the director";
      _os_log_debug_impl(&dword_187528000, v3, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v6, 0x12u);
    }

    *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[25] & 0x10) != 0)
    {
      rb_tree_remove_node((rb_tree_t *)(*(void *)(a1 + 40) + 56LL), v4);
      uint64_t v4 = *(_DWORD **)(a1 + 32);
      v4[25] &= ~0x10u;
    }

    CFRelease(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void *NEFlowTLVAdd(uint64_t a1, char a2, unsigned int a3, void *__src)
{
  uint64_t v4 = a3;
  unint64_t v5 = a3 + 5LL;
  if (*(void *)(a1 + 8) < v5) {
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }
  **(_BYTE **)a1 = a2;
  __int16 v7 = *(_BYTE **)a1;
  *(_DWORD *)(v7 + 1) = bswap32(a3);
  *(void *)a1 = v7 + 5;
  uint64_t result = memcpy(v7 + 5, __src, a3);
  unint64_t v9 = *(void *)(a1 + 8) - v5;
  *(void *)a1 += v4;
  *(void *)(a1 + 8) = v9;
  return result;
}

void flow_director_msg_send(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1)
  {
    if (a4 || (uint64_t v6 = *(dispatch_source_s **)(a1 + 40)) == 0LL)
    {
      unint64_t v5 = *(dispatch_source_s **)(a1 + 24);
      uint64_t v6 = v5;
    }

    else
    {
      unint64_t v5 = *(dispatch_source_s **)(a1 + 24);
    }

    if (v6 == v5) {
      __int16 v7 = "control";
    }
    else {
      __int16 v7 = "data";
    }
  }

uint64_t flow_director_ctl_write( dispatch_source_s *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v28[4] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v28[0] = a2;
  v28[1] = a3;
  v28[2] = a4;
  v28[3] = a5;
  if (a4) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = 1;
  }
  *(_OWORD *)&v19.msg_control = 0u;
  *(_OWORD *)&v19.msg_name = 0u;
  v19.msg_iov = (iovec *)v28;
  *(void *)&v19.msg_iovlen = v8;
  int handle = dispatch_source_get_handle(a1);
  unint64_t v10 = sendmsg(handle, &v19, 0);
  if ((v10 & 0x8000000000000000LL) == 0)
  {
    unint64_t v11 = v10;
    if (v10 < a3)
    {
      v12 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        int v21 = dword_18C6D76C8;
        __int16 v22 = 2080;
        uint64_t v23 = a6;
        __int16 v24 = 2048;
        v25 = (char *)v11;
        __int16 v26 = 2048;
        unint64_t v27 = a3;
        _os_log_error_impl( &dword_187528000,  v12,  OS_LOG_TYPE_ERROR,  "(%u): %s: failed to write an entire message (%zd < %zu)",  buf,  0x26u);
      }

      return 40LL;
    }

    return 0LL;
  }

  uint64_t v13 = *__error();
  CFIndex v15 = (os_log_s *)ne_log_obj();
  int v16 = v15;
  if ((_DWORD)v13 == 55)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v21 = dword_18C6D76C8;
      __int16 v22 = 2080;
      uint64_t v23 = a6;
      _os_log_impl( &dword_187528000,  v16,  OS_LOG_TYPE_DEFAULT,  "(%u): %s: failed to write a message: no buffer space available",  buf,  0x12u);
    }

    return 55LL;
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v17 = dword_18C6D76C8;
    __int16 v18 = strerror(v13);
    *(_DWORD *)buf = 67109634;
    int v21 = v17;
    __int16 v22 = 2080;
    uint64_t v23 = a6;
    __int16 v24 = 2080;
    v25 = v18;
    _os_log_error_impl(&dword_187528000, v16, OS_LOG_TYPE_ERROR, "(%u): %s: write error: %s", buf, 0x1Cu);
  }

  return v13;
}

void flow_director_abort(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = dword_18C6D76C8;
    _os_log_impl(&dword_187528000, v4, OS_LOG_TYPE_DEFAULT, "(%u): Aborting the director", buf, 8u);
  }

  unint64_t v5 = *(dispatch_queue_s **)(a1 + 16);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  _DWORD v6[2] = __flow_director_abort_block_invoke;
  v6[3] = &unk_18A06D950;
  v6[4] = a2;
  v6[5] = a1;
  dispatch_async(v5, v6);
}

uint64_t __flow_director_abort_block_invoke(uint64_t a1)
{
  while (1)
  {
    uint64_t v2 = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(*(void *)(a1 + 40) + 56LL), 0LL, 1u);
    if (!v2) {
      break;
    }
    uint64_t v3 = (uint64_t)v2;
    uint64_t v4 = v2 + 30;
    os_unfair_lock_lock(v2 + 30);
    flow_read_close(v3, 1LL);
    flow_write_close(v3, 1);
    *(void *)(v3 + 40) = 0LL;
    if ((*(_BYTE *)(v3 + 100) & 0x10) != 0)
    {
      rb_tree_remove_node((rb_tree_t *)(*(void *)(a1 + 40) + 56LL), (void *)v3);
      *(_DWORD *)(v3 + 100) &= ~0x10u;
    }

    os_unfair_lock_unlock(v4);
    CFRelease((CFTypeRef)v3);
  }

  unint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = (dispatch_source_s *)v5[3];
  if (v6)
  {
    dispatch_source_cancel(v6);
    *(void *)(*(void *)(a1 + 40) + 24LL) = 0LL;
    unint64_t v5 = *(void **)(a1 + 40);
  }

  __int16 v7 = (dispatch_source_s *)v5[5];
  if (v7)
  {
    dispatch_source_cancel(v7);
    *(void *)(*(void *)(a1 + 40) + 40LL) = 0LL;
    unint64_t v5 = *(void **)(a1 + 40);
  }

  int v8 = (void *)v5[20];
  if (v8)
  {
    free(v8);
    *(void *)(*(void *)(a1 + 40) + 160LL) = 0LL;
    unint64_t v5 = *(void **)(a1 + 40);
  }

  uint64_t v9 = (void *)v5[21];
  if (v9)
  {
    free(v9);
    *(void *)(*(void *)(a1 + 40) + 168LL) = 0LL;
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void flow_read_close(uint64_t a1, int a2)
{
  *(void *)&v26[5] = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    __int16 v24 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      *(void *)__int16 v26 = "flow_read_close";
      _os_log_fault_impl(&dword_187528000, v24, OS_LOG_TYPE_FAULT, "%s called with null flow", (uint8_t *)&v25, 0xCu);
    }

    return;
  }

  int v3 = *(_DWORD *)(a1 + 100);
  if ((v3 & 2) != 0) {
    return;
  }
  *(_DWORD *)(a1 + 100) = v3 | 2;
  if (!a2)
  {
    unint64_t v11 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(_DWORD *)(a1 + 24);
      int v25 = 67109120;
      v26[0] = v12;
      _os_log_impl( &dword_187528000,  v11,  OS_LOG_TYPE_DEFAULT,  "(%u): Closing reads, not closed by plugin",  (uint8_t *)&v25,  8u);
    }

    uint64_t v13 = *(__CFError **)(a1 + 32);
    if (v13) {
      CFIndex Code = CFErrorGetCode(v13);
    }
    else {
      CFIndex Code = 0LL;
    }
    int v21 = *(nw_connection **)(a1 + 408);
    if (v21 && *(void *)(a1 + 16) != 2LL) {
      nw_connection_send( v21,  0LL,  (nw_content_context_t)*MEMORY[0x189608E90],  1,  (nw_connection_send_completion_t)*MEMORY[0x189608E80]);
    }
    flow_notify_client_of_closure(a1);
    uint64_t v22 = *(void *)(a1 + 16);
    if (v22 == 2)
    {
      flow_call_dgram_read_handler(a1, Code);
    }

    else if (v22 == 1)
    {
      flow_call_stream_read_handler(a1, Code);
    }

    return;
  }

  uint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)(v4 - 1) > 1)
  {
    CFIndex v15 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *(_DWORD *)(a1 + 24);
      int v25 = 67109120;
      v26[0] = v16;
      int v17 = "(%u): Closing reads (other), closed by plugin";
LABEL_17:
      _os_log_impl(&dword_187528000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 8u);
    }
  }

  else
  {
    if ((v3 & 4) == 0 || v4 == 2 || flow_error_to_errno(*(void *)(a1 + 32)))
    {
      unint64_t v5 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(a1 + 24);
        int v7 = flow_error_to_errno(*(void *)(a1 + 32));
        int v25 = 67109376;
        v26[0] = v6;
        LOWORD(v26[1]) = 1024;
        *(_DWORD *)((char *)&v26[1] + 2) = v7;
        _os_log_impl( &dword_187528000,  v5,  OS_LOG_TYPE_DEFAULT,  "(%u): Closing reads (sending SHUT_WR), closed by plugin (flow error: %d)",  (uint8_t *)&v25,  0xEu);
      }

      unsigned int v8 = *(_DWORD *)(a1 + 24);
      uint64_t v9 = *(void *)(a1 + 40);
      unsigned int v10 = flow_error_to_errno(*(void *)(a1 + 32));
      flow_director_send_close(v9, v8, v10, 1u, *(_DWORD *)(a1 + 100) & 4);
      goto LABEL_18;
    }

    CFIndex v15 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *(_DWORD *)(a1 + 24);
      int v25 = 67109120;
      v26[0] = v23;
      int v17 = "(%u): Closing reads (suppressing SHUT_WR), closed by plugin";
      goto LABEL_17;
    }
  }

LABEL_18:
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18 == 1)
  {
    msghdr v19 = *(const void **)(a1 + 328);
    if (!v19) {
      return;
    }
    _Block_release(v19);
    *(void *)(a1 + 328) = 0LL;
    uint64_t v18 = *(void *)(a1 + 16);
  }

  if (v18 == 2)
  {
    uint64_t v20 = *(const void **)(a1 + 336);
    if (v20)
    {
      _Block_release(v20);
      *(void *)(a1 + 336) = 0LL;
    }
  }

void flow_write_close(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v3 = *(_DWORD *)(a1 + 100);
    if ((v3 & 1) != 0)
    {
      if (a2) {
        return;
      }
      CFIndex Code = 2LL;
    }

    else
    {
      *(_DWORD *)(a1 + 100) = v3 | 1;
      if (a2)
      {
        if ((unint64_t)(*(void *)(a1 + 16) - 1LL) > 1)
        {
          int v12 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = *(_DWORD *)(a1 + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v21) = v13;
            _os_log_impl( &dword_187528000,  v12,  OS_LOG_TYPE_DEFAULT,  "(%u): Closing writes (other), sending close",  buf,  8u);
          }
        }

        else
        {
          uint64_t v4 = *(void *)(a1 + 304);
          unint64_t v5 = (os_log_s *)ne_log_obj();
          BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          if (v4)
          {
            if (v6)
            {
              int v7 = *(_DWORD *)(a1 + 24);
              *(_DWORD *)buf = 67109120;
              LODWORD(v21) = v7;
              _os_log_impl( &dword_187528000,  v5,  OS_LOG_TYPE_DEFAULT,  "(%u): writes are still pending, delaying sending close until all data is sent to the kernel",  buf,  8u);
            }

            *(_BYTE *)(a1 + 320) = 1;
          }

          else
          {
            if (v6)
            {
              int v14 = *(_DWORD *)(a1 + 24);
              *(_DWORD *)buf = 67109120;
              LODWORD(v21) = v14;
              _os_log_impl(&dword_187528000, v5, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes, sending SHUT_RD", buf, 8u);
            }

            uint64_t v15 = *(unsigned int *)(a1 + 24);
            uint64_t v16 = *(void *)(a1 + 40);
            CFIndex v17 = flow_error_to_errno(*(void *)(a1 + 32));
            flow_director_send_close(v16, v15, v17, 0LL, *(_DWORD *)(a1 + 100) & 4);
          }
        }

        return;
      }

      uint64_t v9 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v10;
        _os_log_impl(&dword_187528000, v9, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes, not sending close", buf, 8u);
      }

      unint64_t v11 = *(__CFError **)(a1 + 32);
      if (v11) {
        CFIndex Code = CFErrorGetCode(v11);
      }
      else {
        CFIndex Code = 2LL;
      }
      flow_notify_client_of_closure(a1);
    }

    *(_BYTE *)(a1 + 320) = 0;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 0x40000000LL;
    v19[2] = __flow_write_close_block_invoke;
    v19[3] = &__block_descriptor_tmp_100;
    v19[4] = a1;
    v19[5] = Code;
    flow_handle_pending_write_requests(a1, (uint64_t)v19);
    return;
  }

  uint64_t v18 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v21 = "flow_write_close";
    _os_log_fault_impl(&dword_187528000, v18, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
  }

void flow_notify_client_of_closure(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 100);
  if ((v2 & 2) == 0 || flow_has_bytes(a1))
  {
    if ((v2 & 1) == 0) {
      return;
    }
LABEL_6:
    flow_notify_client((void *)a1, 3LL);
    return;
  }

  flow_notify_client((void *)a1, 2LL);
  if ((*(_DWORD *)(a1 + 100) & 1) != 0) {
    goto LABEL_6;
  }
}

uint64_t __flow_write_close_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a2 + 152);
  if (v2) {
    flow_call_write_completion(*(void *)(a1 + 32), *(void *)(a1 + 40), v2);
  }
  return 1LL;
}

void flow_call_write_completion(uint64_t a1, uint64_t a2, void *aBlock)
{
  if (*(void *)(a1 + 136))
  {
    unint64_t v5 = _Block_copy(aBlock);
    BOOL v6 = *(dispatch_queue_s **)(a1 + 136);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __flow_call_write_completion_block_invoke;
    v7[3] = &unk_18A06D7A0;
    v7[4] = v5;
    v7[5] = a2;
    dispatch_async(v6, v7);
  }

void __flow_call_write_completion_block_invoke(uint64_t a1)
{
}

BOOL flow_has_bytes(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1 == 2)
  {
    BOOL v2 = *(void *)(a1 + 264) == 0LL;
  }

  else
  {
    if (v1 != 1) {
      return 0LL;
    }
    BOOL v2 = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 112)) == 0;
  }

  return !v2;
}

void flow_notify_client(void *a1, uint64_t a2)
{
  if (a1[17] && a1[a2 + 18])
  {
    uint64_t v4 = (void *)a1[25];
    if (v4)
    {
      while (1)
      {
        unint64_t v5 = v4;
        if (*v4 == a2) {
          break;
        }
        uint64_t v4 = (void *)v4[1];
        if (!v4) {
          goto LABEL_8;
        }
      }
    }

    else
    {
      unint64_t v5 = 0LL;
LABEL_8:
      BOOL v6 = (void *)MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 16LL, 0LL);
      *BOOL v6 = a2;
      if (v5)
      {
        v6[1] = v5[1];
        v5[1] = v6;
      }

      else
      {
        v6[1] = a1[25];
        a1[25] = v6;
        if (a1[17])
        {
          CFRetain(a1);
          int v7 = (dispatch_queue_s *)a1[17];
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 0x40000000LL;
          block[2] = __flow_notify_client_block_invoke;
          block[3] = &__block_descriptor_tmp_90;
          block[4] = a1;
          dispatch_async(v7, block);
        }
      }
    }
  }

void __flow_notify_client_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  while (1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 120));
    uint64_t v4 = *(void **)(v2 + 200);
    if (!v4) {
      break;
    }
    uint64_t v5 = v4[1];
    *(void *)(v2 + 200) = v5;
    BOOL v6 = *(const void **)(v2 + 8LL * *v4 + 144);
    if (v6)
    {
      int v7 = (void (**)(void *, void))_Block_copy(v6);
      uint64_t v8 = *(void *)(v2 + 200);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
      if (v7)
      {
        uint64_t v9 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v10 = "unknown";
          if (*v4 <= 6uLL) {
            int v10 = off_18A06DB08[*v4];
          }
          int v11 = *(_DWORD *)(v2 + 24);
          *(_DWORD *)buf = 67109378;
          int v13 = v11;
          __int16 v14 = 2080;
          uint64_t v15 = v10;
          _os_log_debug_impl(&dword_187528000, v9, OS_LOG_TYPE_DEBUG, "(%u): invoking %s event handler", buf, 0x12u);
        }

        v7[2](v7, 0LL);
        _Block_release(v7);
      }

      CFAllocatorDeallocate(v3, v4);
      if (!v8) {
        goto LABEL_15;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
      CFAllocatorDeallocate(v3, v4);
      if (!v5) {
        goto LABEL_15;
      }
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
LABEL_15:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void flow_call_stream_read_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 120));
  if (*(void *)(a1 + 136))
  {
    uint64_t v4 = *(const void **)(a1 + 328);
    if (v4)
    {
      uint64_t v5 = _Block_copy(v4);
      BOOL v6 = *(dispatch_object_s **)(a1 + 112);
      if (v6)
      {
        size_t size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 112));
        dispatch_retain(v6);
      }

      else
      {
        size_t size = 0LL;
      }

      uint64_t v8 = *(dispatch_queue_s **)(a1 + 136);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __flow_call_stream_read_handler_block_invoke;
      block[3] = &unk_18A06D750;
      block[4] = v5;
      void block[5] = v6;
      block[6] = a2;
      dispatch_async(v8, block);
      _Block_release(*(const void **)(a1 + 328));
      *(void *)(a1 + 328) = 0LL;
      if (size)
      {
        flow_director_send_read_notification(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), size);
        *(void *)(a1 + 256) += size;
        uint64_t v9 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v11 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 67109376;
          int v14 = v11;
          __int16 v15 = 2048;
          size_t v16 = size;
          _os_log_debug_impl(&dword_187528000, v9, OS_LOG_TYPE_DEBUG, "(%u): plugin read %lu bytes", buf, 0x12u);
        }

        int v10 = *(dispatch_object_s **)(a1 + 112);
        if (v10) {
          dispatch_release(v10);
        }
        *(void *)(a1 + 112) = MEMORY[0x1895F8AA8];
      }
    }
  }

void flow_call_dgram_read_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 120));
  if (*(void *)(a1 + 136))
  {
    uint64_t v4 = *(const void **)(a1 + 336);
    if (v4)
    {
      uint64_t v5 = _Block_copy(v4);
      __int128 v11 = *(_OWORD *)(a1 + 264);
      BOOL v6 = *(dispatch_queue_s **)(a1 + 136);
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 0x40000000LL;
      v10[2] = __flow_call_dgram_read_handler_block_invoke;
      v10[3] = &unk_18A06D778;
      v10[4] = v5;
      uint64_t v12 = a2;
      dispatch_async(v6, v10);
      _Block_release(*(const void **)(a1 + 336));
      *(void *)(a1 + 336) = 0LL;
      flow_director_send_read_notification(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 280));
      *(void *)(a1 + 256) += *(unsigned int *)(a1 + 280);
      int v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = *(_DWORD *)(a1 + 24);
        int v9 = *(_DWORD *)(a1 + 280);
        *(_DWORD *)buf = 67109376;
        int v14 = v8;
        __int16 v15 = 1024;
        int v16 = v9;
        _os_log_debug_impl(&dword_187528000, v7, OS_LOG_TYPE_DEBUG, "(%u): plugin read %u bytes", buf, 0xEu);
      }

      *(void *)(a1 + 264) = 0LL;
      *(void *)(a1 + 272) = a1 + 264;
      *(_DWORD *)(a1 + 280) = 0;
    }
  }

void __flow_call_dgram_read_handler_block_invoke(uint64_t a1)
{
}

void flow_director_send_read_notification(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v5 = bswap32(a3);
  BOOL v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  int v7 = (_DWORD *)MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 17LL, 0LL);
  *(_BYTE *)int v7 = 5;
  v7[1] = bswap32(a2);
  *((_BYTE *)v7 + 8) = 8;
  *(_DWORD *)((char *)v7 + 9) = 0x4000000;
  *(_DWORD *)((char *)v7 + 13) = v5;
  flow_director_msg_send(a1, (uint64_t)v7, 0x11uLL, 0);
  CFAllocatorDeallocate(v6, v7);
}

void __flow_call_stream_read_handler_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 40);
  if (v2) {
    dispatch_release(v2);
  }
}

void flow_cancel_connection_waiting_timer(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 424))
  {
    uint64_t v2 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v3 = *(_DWORD *)(a1 + 24);
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_debug_impl(&dword_187528000, v2, OS_LOG_TYPE_DEBUG, "(%u): Cancelling waiting timer", (uint8_t *)v4, 8u);
    }

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 424));
    *(void *)(a1 + 424) = 0LL;
  }

uint64_t NEFlowGetFlowType(void *cf)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 0LL;
    }
  }

  uint64_t v2 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) == v2) {
    return cf[2];
  }
  return 0LL;
}

uint64_t NEFlowOpen(os_unfair_lock_s *cf)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 0LL;
    }
  }

  uint64_t v2 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) == v2)
  {
    int v3 = cf + 30;
    os_unfair_lock_lock(cf + 30);
    uint64_t v4 = flow_open((uint64_t)cf);
    os_unfair_lock_unlock(v3);
    return v4;
  }

  return 0LL;
}

uint64_t flow_open(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 120));
  int v2 = *(_DWORD *)(a1 + 100);
  if ((v2 & 4) != 0)
  {
    uint64_t v4 = a1;
    CFIndex v5 = 4LL;
    goto LABEL_9;
  }

  if ((v2 & 3) != 0 || *(void *)(a1 + 40) == 0LL)
  {
    uint64_t v4 = a1;
    CFIndex v5 = 2LL;
LABEL_9:
    __NEFlowSetError(v4, v5);
    return 0LL;
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  *(_OWORD *)bytes = 0u;
  __int128 v19 = 0u;
  int v7 = *(_DWORD *)(a1 + 400);
  int v8 = *(const __CFData **)(a1 + 56);
  if (!v8
    || (CFDataGetBytePtr(v8),
        CFDataGetLength(*(CFDataRef *)(a1 + 56)),
        __memcpy_chk(),
        CFRelease(*(CFTypeRef *)(a1 + 56)),
        bytes[1] != 30)
    && bytes[1] != 2
    || !*(_WORD *)&bytes[2])
  {
    unsigned int v9 = arc4random_uniform(0x3FFFu) - 0x4000;
    if (bytes[1] == 30 || bytes[1] == 2) {
      *(_WORD *)&bytes[2] = bswap32(v9) >> 16;
    }
  }

  *(void *)(a1 + 56) = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, bytes[0]);
  int v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x40) == 0)
  {
    if (bytes[1] == 30)
    {
      *(void *)&bytes[8] = 0LL;
      *(void *)&__int128 v19 = 0LL;
    }

    else if (bytes[1] == 2)
    {
      *(_DWORD *)&bytes[4] = 0;
    }
  }

  *(_DWORD *)(a1 + 100) = v10 | 4;
  if ((unint64_t)(*(void *)(a1 + 16) - 1LL) <= 1)
  {
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109378;
      int v15 = v13;
      __int16 v16 = 2080;
      uint64_t v17 = "Open, sending successful connect result";
      _os_log_debug_impl(&dword_187528000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
    }

    flow_director_send_connect_result( *(void *)(a1 + 40),  *(_DWORD *)(a1 + 24),  0,  0x40000u,  *(_DWORD *)(*(void *)(a1 + 40) + 48LL),  bytes,  BytePtr,  v7,  *(CFDataRef *)(a1 + 352));
  }

  return 1LL;
}

CFErrorRef __NEFlowSetError(uint64_t a1, CFIndex code)
{
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0LL;
  }

  CFErrorRef result = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"com.apple.VPNTunnel", code, 0LL);
  *(void *)(a1 + 32) = result;
  return result;
}

void flow_director_send_connect_result( uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned __int8 *a6, unsigned __int8 *a7, int a8, CFDataRef theData)
{
  if (a6)
  {
    uint64_t v14 = *a6 + 16LL;
    uint64_t v15 = 5LL;
  }

  else
  {
    uint64_t v15 = 4LL;
    uint64_t v14 = 16LL;
  }

  if (a7)
  {
    v14 += *a7;
    ++v15;
  }

  if (theData)
  {
    v14 += CFDataGetLength(theData);
    ++v15;
  }

  unint64_t v16 = 5 * v15 + v14;
  uint64_t v17 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  unint64_t v18 = v16 + 8;
  uint64_t v19 = MEMORY[0x1895A7868](*MEMORY[0x189604DB0], v16 + 8, 0LL);
  *(_BYTE *)uint64_t v19 = 2;
  *(_DWORD *)(v19 + 4) = bswap32(a2);
  if (v16 <= 8) {
    goto LABEL_25;
  }
  __int128 v20 = (char *)v19;
  *(_BYTE *)(v19 + 8) = 5;
  *(_DWORD *)(v19 + 9) = 0x4000000;
  *(_DWORD *)(v19 + 13) = bswap32(a3);
  if (v16 - 9 <= 8) {
    goto LABEL_25;
  }
  *(_BYTE *)(v19 + 17) = 9;
  *(_DWORD *)(v19 + 18) = 0x4000000;
  *(_DWORD *)(v19 + 22) = bswap32(a4);
  if (v16 - 18 <= 8) {
    goto LABEL_25;
  }
  *(_BYTE *)(v19 + 26) = 10;
  *(_DWORD *)(v19 + 27) = 0x4000000;
  *(_DWORD *)(v19 + 31) = bswap32(a5);
  unint64_t v21 = v16 - 27;
  if (!a6)
  {
    __int128 v24 = (char *)(v19 + 35);
    if (!a7) {
      goto LABEL_20;
    }
LABEL_17:
    size_t v25 = *a7;
    BOOL v23 = v21 >= v25 + 5;
    v21 -= v25 + 5;
    if (v23)
    {
      char *v24 = 12;
      *(_DWORD *)(v24 + 1) = (_DWORD)v25 << 24;
      uint64_t v26 = v24 + 5;
      memcpy(v26, a7, v25);
      __int128 v24 = &v26[v25];
      goto LABEL_20;
    }

LABEL_25:
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }

  size_t v22 = *a6;
  BOOL v23 = v21 >= v22 + 5;
  v21 -= v22 + 5;
  if (!v23) {
    goto LABEL_25;
  }
  *(_BYTE *)(v19 + 35) = 11;
  *(_DWORD *)(v19 + 36) = (_DWORD)v22 << 24;
  memcpy((void *)(v19 + 40), a6, v22);
  __int128 v24 = &v20[v22 + 40];
  if (a7) {
    goto LABEL_17;
  }
LABEL_20:
  if (v21 <= 8) {
    goto LABEL_25;
  }
  char *v24 = 13;
  *(_DWORD *)(v24 + 1) = 0x4000000;
  *(_DWORD *)(v24 + 5) = a8;
  if (theData)
  {
    unsigned int Length = CFDataGetLength(theData);
    BytePtr = CFDataGetBytePtr(theData);
    v24[9] = 31;
    *(_DWORD *)(v24 + 10) = bswap32(Length);
    memcpy(v24 + 14, BytePtr, Length);
  }

  flow_director_msg_send(a1, (uint64_t)v20, v18, 1);
  CFAllocatorDeallocate(v17, v20);
}

    if ((*(_DWORD *)(v1 + 120) & 0x30) != 0x10) {
      return;
    }
    *(_DWORD *)(v1 + 120) |= 0x20u;
    uuid_unparse((const unsigned __int8 *)v1, out);
    uint64_t v26 = *(_DWORD *)(v1 + 176);
    unint64_t v27 = (os_log_s *)ne_log_obj();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v26 == 3)
    {
      if (!v28) {
        goto LABEL_33;
      }
      v29 = *(void *)(v1 + 80);
      if (v29) {
        LODWORD(v29) = nw_parameters_get_ip_protocol();
      }
      v30 = *(void **)(v1 + 160);
      if (v30)
      {
        uint64_t v32 = v30[6];
        __int16 v33 = v30[7];
        __int16 v31 = v30[8];
        uint64_t v34 = v30[9];
      }

      else
      {
        __int16 v31 = -1LL;
        uint64_t v32 = -1LL;
        __int16 v33 = -1LL;
        uint64_t v34 = -1LL;
      }

      v47 = *(void **)(v1 + 168);
      if (v47)
      {
        v49 = v47[6];
        v50 = v47[7];
        v48 = v47[8];
        v51 = v47[9];
      }

      else
      {
        v48 = -1LL;
        v49 = -1LL;
        v50 = -1LL;
        v51 = -1LL;
      }

      *(_DWORD *)v58 = 136317442;
      *(void *)&v58[4] = out;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v29;
      *(_WORD *)&v58[18] = 2048;
      *(void *)&v58[20] = v32;
      *(_WORD *)&v58[28] = 2048;
      *(void *)&v58[30] = v33;
      *(_WORD *)&v58[38] = 2048;
      v59 = v31;
      v60 = 2048;
      v61 = v34;
      v62 = 2048;
      v63 = v49;
      v64 = 2048;
      v65 = v50;
      v66 = 2048;
      v67 = v48;
      v68 = 2048;
      v69 = v51;
      v55 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling disconn"
            "ect on output protocol";
      v56 = v27;
      v57 = 98;
    }

    else
    {
      if (!v28) {
        goto LABEL_33;
      }
      uint64_t v39 = *(void *)(v1 + 80);
      if (v39) {
        LODWORD(v39) = nw_parameters_get_ip_protocol();
      }
      v40 = *(unsigned int *)(v1 + 176);
      else {
        v41 = (&off_18A06EDE8)[v40];
      }
      *(_DWORD *)v58 = 136315650;
      *(void *)&v58[4] = out;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v39;
      *(_WORD *)&v58[18] = 2080;
      *(void *)&v58[20] = v41;
      v55 = "[filter %s %d %s] calling disconnect on output protocol";
      v56 = v27;
      v57 = 28;
    }

    _os_log_debug_impl(&dword_187528000, v56, OS_LOG_TYPE_DEBUG, v55, v58, v57);
LABEL_33:
    __int16 v35 = *(void *)(v1 + 32);
    if (v35)
    {
      if (*(void *)(*(void *)(v35 + 24) + 32LL)) {
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 32LL))();
      }
    }

    return;
  }

  while (1)
  {
    if (*(_DWORD *)(v6 + 40) == 3 && *(void *)(v6 + 64) != -1LL)
    {
      int v7 = *(_WORD *)(v6 + 144);
      if ((v7 & 0x40) == 0) {
        break;
      }
    }

    BOOL v6 = *(void *)(v6 + 152);
    if (!v6) {
      goto LABEL_12;
    }
  }

  *(_WORD *)(v6 + 144) = v7 | 4;
  ne_filter_send_approved_frames(v1, 0LL);
}

    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v2, (uint64_t)bytes, &length, 0))
    {
      xpc_dictionary_set_data(v8, "crypto-signature", bytes, length);
    }

    else
    {
      BOOL v23 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(length_4) = 0;
        _os_log_error_impl( &dword_187528000,  v23,  OS_LOG_TYPE_ERROR,  "Failed to generate signature for new flow message",  (uint8_t *)&length_4,  2u);
      }
    }

    uuid_unparse((const unsigned __int8 *)v2, v64);
    __int128 v24 = *(_DWORD *)(v2 + 176);
    size_t v25 = (os_log_s *)ne_log_obj();
    uint64_t v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24 == 3)
    {
      if (v26)
      {
        unint64_t v27 = *(void *)(v2 + 80);
        if (v27) {
          LODWORD(v27) = nw_parameters_get_ip_protocol();
        }
        v28 = *(void **)(v2 + 160);
        if (v28)
        {
          v30 = v28[6];
          __int16 v31 = v28[7];
          v29 = v28[8];
          uint64_t v32 = v28[9];
        }

        else
        {
          v29 = -1LL;
          v30 = -1LL;
          __int16 v31 = -1LL;
          uint64_t v32 = -1LL;
        }

        v42 = *(void **)(v2 + 168);
        if (v42)
        {
          v44 = v42[6];
          v45 = v42[7];
          v43 = v42[8];
          v46 = v42[9];
        }

        else
        {
          v43 = -1LL;
          v44 = -1LL;
          v45 = -1LL;
          v46 = -1LL;
        }

        length_4 = 136317442;
        *(void *)v54 = v64;
        *(_WORD *)&v54[8] = 1024;
        *(_DWORD *)v55 = v27;
        *(_WORD *)&v55[4] = 2048;
        *(void *)&v55[6] = v30;
        *(_WORD *)&v55[14] = 2048;
        *(void *)&v55[16] = v31;
        *(_WORD *)&v55[24] = 2048;
        *(void *)&v55[26] = v29;
        *(_WORD *)&v55[34] = 2048;
        *(void *)&v55[36] = v32;
        v56 = 2048;
        v57 = v44;
        v58 = 2048;
        v59 = v45;
        v60 = 2048;
        v61 = v43;
        v62 = 2048;
        v63 = v46;
        v47 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending new flow message";
        v48 = v25;
        v49 = 98;
LABEL_55:
        _os_log_debug_impl(&dword_187528000, v48, OS_LOG_TYPE_DEBUG, v47, (uint8_t *)&length_4, v49);
        goto LABEL_36;
      }
    }

    else if (v26)
    {
      uint64_t v39 = *(void *)(v2 + 80);
      if (v39) {
        LODWORD(v39) = nw_parameters_get_ip_protocol();
      }
      v40 = *(unsigned int *)(v2 + 176);
      else {
        v41 = (&off_18A06EDE8)[v40];
      }
      length_4 = 136315650;
      *(void *)v54 = v64;
      *(_WORD *)&v54[8] = 1024;
      *(_DWORD *)v55 = v39;
      *(_WORD *)&v55[4] = 2080;
      *(void *)&v55[6] = v41;
      v47 = "[filter %s %d %s] sending new flow message";
      v48 = v25;
      v49 = 28;
      goto LABEL_55;
    }

    do
LABEL_36:
      __int16 v33 = __ldaxr(v5);
    while (__stlxr(v33 + 1, v5));
    uint64_t v34 = *(os_unfair_lock_s **)(v2 + 96);
    __int16 v35 = *(_DWORD *)(a2 + 4);
    v51[0] = MEMORY[0x1895F87A8];
    v51[1] = 0x40000000LL;
    v51[2] = __ne_filter_data_protocol_send_new_flow_block_invoke;
    v51[3] = &__block_descriptor_tmp_63;
    v51[4] = v2;
    v51[5] = a1;
    v51[6] = a2;
    ne_filter_send_message(v34, v35, v8, v51);
    xpc_release(v8);
    return;
  }

  size_t v22 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    LOWORD(length_4) = 0;
    _os_log_impl(&dword_187528000, v22, OS_LOG_TYPE_INFO, "filter is null", (uint8_t *)&length_4, 2u);
  }

uint64_t NEFlowReadClose(os_unfair_lock_s *a1, const void *a2)
{
  return flow_close(a1, a2, 1);
}

uint64_t flow_close(os_unfair_lock_s *cf, const void *a2, int a3)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 0LL;
    }
  }

  uint64_t v6 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v6) {
    return 0LL;
  }
  if (a2)
  {
    CFTypeID TypeID = CFErrorGetTypeID();
    if (CFGetTypeID(a2) == TypeID)
    {
      int v8 = cf + 30;
      os_unfair_lock_lock(cf + 30);
      unsigned int v9 = *(const void **)&cf[8]._os_unfair_lock_opaque;
      if (v9) {
        CFRelease(v9);
      }
      *(void *)&cf[8]._os_unfair_lock_opaque = CFRetain(a2);
      goto LABEL_10;
    }

    return 0LL;
  }

  int v8 = cf + 30;
  os_unfair_lock_lock(cf + 30);
LABEL_10:
  if (a3) {
    flow_read_close((uint64_t)cf, 1);
  }
  else {
    flow_write_close((uint64_t)cf, 1);
  }
  if ((~cf[25]._os_unfair_lock_opaque & 3) == 0 && !LOBYTE(cf[80]._os_unfair_lock_opaque)) {
    flow_drop_director(cf);
  }
  os_unfair_lock_unlock(v8);
  return 1LL;
}

uint64_t NEFlowWriteClose(os_unfair_lock_s *a1, const void *a2)
{
  return flow_close(a1, a2, 0);
}

uint64_t NEFlowSetEventHandler(os_unfair_lock_s *cf, uint64_t a2, const void *a3)
{
  if (runtime_inited != -1)
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (cf) {
      goto LABEL_3;
    }
    return 0LL;
  }

  if (!cf) {
    return 0LL;
  }
LABEL_3:
  uint64_t v6 = __kNEFlowTypeID;
  CFTypeID v7 = CFGetTypeID(cf);
  uint64_t result = 0LL;
  if (a2 <= 6 && v7 == v6)
  {
    os_unfair_lock_lock(cf + 30);
    unsigned int v9 = &cf[2 * a2];
    uint64_t v12 = *(const void **)&v9[36]._os_unfair_lock_opaque;
    __int128 v11 = (void **)&v9[36];
    int v10 = v12;
    if (v12)
    {
      _Block_release(v10);
      __CFError *v11 = 0LL;
    }

    if (a3) {
      __CFError *v11 = _Block_copy(a3);
    }
    os_unfair_lock_unlock(cf + 30);
    return 1LL;
  }

  return result;
}

uint64_t NEFlowSetDispatchQueue(os_unfair_lock_s *cf, dispatch_object_s *a2)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 0LL;
    }
  }

  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4) {
    return 0LL;
  }
  CFIndex v5 = cf + 30;
  os_unfair_lock_lock(cf + 30);
  uint64_t v6 = *(dispatch_object_s **)&cf[34]._os_unfair_lock_opaque;
  if (v6)
  {
    dispatch_release(v6);
    *(void *)&cf[34]._os_unfair_lock_opaque = 0LL;
  }

  if (a2)
  {
    *(void *)&cf[34]._os_unfair_lock_opaque = a2;
    dispatch_retain(a2);
  }

  else
  {
    CFTypeID v7 = cf + 36;
    do
    {
      int v8 = *(const void **)((char *)a2 + (void)v7);
      if (v8)
      {
        _Block_release(v8);
        *(void *)((char *)a2 + (void)v7) = 0LL;
      }

      a2 = (dispatch_object_s *)((char *)a2 + 8);
    }

    while (a2 != (dispatch_object_s *)56);
  }

  os_unfair_lock_unlock(v5);
  return 1LL;
}

os_unfair_lock_s *NEFlowCopyError(os_unfair_lock_s *cf)
{
  uint64_t v1 = cf;
  if (runtime_inited == -1)
  {
    if (!cf) {
      return v1;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!v1) {
      return v1;
    }
  }

  uint64_t v2 = __kNEFlowTypeID;
  if (CFGetTypeID(v1) != v2) {
    return 0LL;
  }
  int v3 = v1 + 30;
  os_unfair_lock_lock(v1 + 30);
  uint64_t v4 = *(const void **)&v1[8]._os_unfair_lock_opaque;
  if (v4) {
    uint64_t v1 = (os_unfair_lock_s *)CFRetain(v4);
  }
  else {
    uint64_t v1 = 0LL;
  }
  os_unfair_lock_unlock(v3);
  return v1;
}

uint64_t NEFlowAsyncRead(os_unfair_lock_s *cf, const void *a2)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 4LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 4LL;
    }
  }

  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4) {
    return 4LL;
  }
  uint64_t v5 = 4LL;
  if (a2 && *(void *)&cf[4]._os_unfair_lock_opaque == 1LL)
  {
    os_unfair_lock_lock(cf + 30);
    if (*(void *)&cf[82]._os_unfair_lock_opaque)
    {
      uint64_t v5 = 101LL;
    }

    else
    {
      *(void *)&cf[82]._os_unfair_lock_opaque = _Block_copy(a2);
      uint64_t v5 = 0LL;
    }

    os_unfair_lock_unlock(cf + 30);
  }

  return v5;
}

uint64_t NEFlowAsyncDatagramsCopyNext(os_unfair_lock_s *cf, const void *a2)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 4LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 4LL;
    }
  }

  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4) {
    return 4LL;
  }
  uint64_t v5 = 4LL;
  if (a2 && *(void *)&cf[4]._os_unfair_lock_opaque == 2LL)
  {
    os_unfair_lock_lock(cf + 30);
    if (*(void *)&cf[84]._os_unfair_lock_opaque)
    {
      uint64_t v5 = 101LL;
    }

    else
    {
      *(void *)&cf[84]._os_unfair_lock_opaque = _Block_copy(a2);
      uint64_t v5 = 0LL;
    }

    os_unfair_lock_unlock(cf + 30);
  }

  return v5;
}

uint64_t NEFlowWrite(os_unfair_lock_s *cf, const void *a2, unsigned __int8 *a3, void *a4)
{
  *(void *)&v43[7] = *MEMORY[0x1895F89C0];
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 4LL;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf) {
      return 4LL;
    }
  }

  uint64_t v8 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v8) {
    return 4LL;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint32_t os_unfair_lock_opaque = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109378;
      uint32_t v41 = os_unfair_lock_opaque;
      __int16 v42 = 2080;
      *(void *)v43 = "invalid data object";
      _os_log_debug_impl(&dword_187528000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)&v40, 0x12u);
    }

    return 4LL;
  }

  if (CFDataGetLength((CFDataRef)a2) <= 0)
  {
    uint64_t v15 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint32_t v16 = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109376;
      uint32_t v41 = v16;
      __int16 v42 = 2048;
      *(void *)v43 = CFDataGetLength((CFDataRef)a2);
      uint64_t v17 = "(%u): data length %ld <= 0";
      unint64_t v18 = v15;
      uint32_t v19 = 18;
LABEL_30:
      _os_log_error_impl(&dword_187528000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v40, v19);
    }

    return 4LL;
  }

  if (a3)
  {
    int v10 = a3[1];
    if (v10 == 2)
    {
      unsigned int v11 = *a3;
      if (v11 < 0x10) {
        goto LABEL_20;
      }
    }

    else
    {
      if (v10 != 30)
      {
        v29 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint32_t v30 = cf[6]._os_unfair_lock_opaque;
          int v31 = a3[1];
          int v40 = 67109376;
          uint32_t v41 = v30;
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v31;
          uint64_t v17 = "(%u): address has an invalid family %d";
          unint64_t v18 = v29;
          uint32_t v19 = 14;
          goto LABEL_30;
        }

        return 4LL;
      }

      unsigned int v11 = *a3;
      if (v11 < 0x1C) {
        goto LABEL_20;
      }
    }

    if (v11 >= 0x1D)
    {
LABEL_20:
      __int128 v20 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint32_t v21 = cf[6]._os_unfair_lock_opaque;
        int v22 = a3[1];
        int v23 = *a3;
        int v40 = 67109632;
        uint32_t v41 = v21;
        __int16 v42 = 1024;
        *(_DWORD *)v43 = v22;
        v43[2] = 1024;
        *(_DWORD *)&v43[3] = v23;
        uint64_t v17 = "(%u): address with family %d has an invalid length %d";
        unint64_t v18 = v20;
        uint32_t v19 = 20;
        goto LABEL_30;
      }

      return 4LL;
    }
  }

  if (*(void *)&cf[4]._os_unfair_lock_opaque == 2LL
    && cf[72]._os_unfair_lock_opaque < CFDataGetLength((CFDataRef)a2))
  {
    return 100LL;
  }

  __int128 v24 = cf + 30;
  os_unfair_lock_lock(cf + 30);
  if ((cf[25]._os_unfair_lock_opaque & 1) != 0)
  {
    __int16 v33 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint32_t v38 = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109376;
      uint32_t v41 = v38;
      __int16 v42 = 2048;
      *(void *)v43 = CFDataGetLength((CFDataRef)a2);
      _os_log_error_impl( &dword_187528000,  v33,  OS_LOG_TYPE_ERROR,  "(%u): flow is closed for writes, cannot write %ld bytes of data",  (uint8_t *)&v40,  0x12u);
    }

    uint64_t v13 = 1LL;
  }

  else
  {
    CFIndex Length = CFDataGetLength((CFDataRef)a2);
    CFIndex v26 = Length;
    if (*(void *)&cf[76]._os_unfair_lock_opaque)
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = Length;
    }

    else
    {
      uint64_t v27 = flow_write_range_of_cfdata((uint64_t)cf, (const __CFData *)a2, 0LL, Length, a3);
      uint64_t v28 = v34;
    }

    if (v28 < 1)
    {
      if (a4) {
        flow_call_write_completion((uint64_t)cf, 0LL, a4);
      }
    }

    else
    {
      __int16 v35 = (void *)MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 168LL, 0LL);
      uint64_t v36 = v35;
      *(_OWORD *)__int16 v35 = 0u;
      *((_OWORD *)v35 + 1) = 0u;
      *((_OWORD *)v35 + 2) = 0u;
      *((_OWORD *)v35 + 3) = 0u;
      *((_OWORD *)v35 + 4) = 0u;
      *((_OWORD *)v35 + 5) = 0u;
      *((_OWORD *)v35 + 6) = 0u;
      *((_OWORD *)v35 + 7) = 0u;
      *((_OWORD *)v35 + 8) = 0u;
      *((_OWORD *)v35 + 9) = 0u;
      v35[20] = 0LL;
      if (a3) {
        memcpy(v35, a3, *a3);
      }
      v36[16] = CFRetain(a2);
      v36[17] = v27;
      v36[18] = v28;
      if (a4) {
        v36[19] = _Block_copy(a4);
      }
      v36[20] = 0LL;
      **(void **)&cf[78]._uint32_t os_unfair_lock_opaque = v36;
      *(void *)&cf[78]._uint32_t os_unfair_lock_opaque = v36 + 20;
    }

    __int16 v37 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v39 = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109376;
      uint32_t v41 = v39;
      __int16 v42 = 2048;
      *(void *)v43 = v26;
      _os_log_debug_impl( &dword_187528000,  v37,  OS_LOG_TYPE_DEBUG,  "(%u): plugin wrote %ld bytes",  (uint8_t *)&v40,  0x12u);
    }

    uint64_t v13 = 0LL;
    *(void *)&cf[62]._os_unfair_lock_opaque += v26;
  }

  os_unfair_lock_unlock(v24);
  return v13;
}

uint64_t flow_write_range_of_cfdata( uint64_t a1, const __CFData *a2, uint64_t a3, uint64_t a4, unsigned __int8 *__src)
{
  uint64_t v5 = a4;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return a3;
  }
  unint64_t v8 = *(unsigned int *)(a1 + 104);
  if (!*(_DWORD *)(a1 + 104) || a4 < 1) {
    return a3;
  }
  while (*(void *)(a1 + 16) == 2LL)
  {
    int v12 = flow_director_send_cfdata(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), a2, a3, v5, __src);
    uint64_t v13 = v5;
    if (v12) {
      goto LABEL_20;
    }
LABEL_15:
    *(void *)(a1 + 240) += v13;
    uint64_t v15 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = *(_DWORD *)(a1 + 24);
      uint64_t v17 = *(char **)(a1 + 240);
      *(_DWORD *)buf = 67109632;
      int v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2048;
      v29 = v17;
      _os_log_debug_impl( &dword_187528000,  v15,  OS_LOG_TYPE_DEBUG,  "(%u): Wrote %ld bytes to the kernel (total bytes written = %llu)",  buf,  0x1Cu);
    }

    a3 += v13;
    v5 -= v13;
    unint64_t v8 = *(unsigned int *)(a1 + 104);
    if (!(_DWORD)v8 || v5 <= 0) {
      return a3;
    }
  }

  uint64_t v14 = *(void *)(a1 + 40);
  else {
    uint64_t v13 = *(void *)(v14 + 184);
  }
  int v12 = flow_director_send_cfdata(v14, *(_DWORD *)(a1 + 24), a2, a3, v13, 0LL);
  if (!v12) {
    goto LABEL_15;
  }
LABEL_20:
  if (v12 == 55)
  {
    unint64_t v18 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109376;
      int v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      _os_log_impl( &dword_187528000,  v18,  OS_LOG_TYPE_DEFAULT,  "(%u): app receive buffer is full, queueing %lu bytes",  buf,  0x12u);
    }
  }

  else
  {
    __int128 v20 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = *(_DWORD *)(a1 + 24);
      int v23 = strerror(v12);
      *(_DWORD *)buf = 67109634;
      int v25 = v22;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2080;
      v29 = v23;
      _os_log_error_impl( &dword_187528000,  v20,  OS_LOG_TYPE_ERROR,  "(%u): Got an error when sending %lu bytes to the kernel: %s",  buf,  0x1Cu);
    }
  }

  return a3;
}

uint64_t flow_director_send_cfdata( uint64_t a1, unsigned int a2, const __CFData *a3, uint64_t a4, uint64_t a5, unsigned __int8 *__src)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v10 = *(dispatch_source_s **)(a1 + 40);
    if (!v10) {
      int v10 = *(dispatch_source_s **)(a1 + 24);
    }
    int v19 = 0;
    memset(v18, 0, sizeof(v18));
    LOBYTE(v18[0]) = 3;
    DWORD1(v18[0]) = bswap32(a2);
    if (__src)
    {
      size_t v11 = *__src;
      if (v11 >= 0x28) {
        __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
      }
      BYTE8(v18[0]) = 12;
      *(_DWORD *)((char *)v18 + 9) = (_DWORD)v11 << 24;
      memcpy((void *)((unint64_t)v18 | 0xD), __src, v11);
      unint64_t v12 = v11 + 13;
    }

    else
    {
      unint64_t v12 = 8LL;
    }

    BytePtr = CFDataGetBytePtr(a3);
    uint64_t v16 = flow_director_ctl_write(v10, (uint64_t)v18, v12, (uint64_t)&BytePtr[a4], a5, (uint64_t)"data");
    uint64_t v14 = v16;
    if ((_DWORD)v16 && (_DWORD)v16 != 55) {
      flow_director_abort(a1, 0LL);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18[0]) = 67109120;
      DWORD1(v18[0]) = dword_18C6D76C8;
      _os_log_impl( &dword_187528000,  v13,  OS_LOG_TYPE_DEFAULT,  "(%u): Director is NULL, dropping data",  (uint8_t *)v18,  8u);
    }

    return 22LL;
  }

  return v14;
}

os_unfair_lock_s *NEFlowCopyProperty(os_unfair_lock_s *cf, const void *a2)
{
  int v3 = cf;
  if (runtime_inited == -1)
  {
    if (!cf) {
      return v3;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!v3) {
      return v3;
    }
  }

  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(v3) == v4)
  {
    uint64_t v5 = v3 + 30;
    os_unfair_lock_lock(v3 + 30);
    if (CFEqual(a2, @"Type"))
    {
      uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFTypeID v7 = v3 + 4;
      CFNumberType v8 = kCFNumberCFIndexType;
LABEL_6:
      unsigned int v9 = (os_unfair_lock_s *)CFNumberCreate(v6, v8, v7);
LABEL_7:
      int v3 = v9;
LABEL_36:
      os_unfair_lock_unlock(v5);
      return v3;
    }

    if (CFEqual(a2, @"DestinationName"))
    {
      if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1LL) <= 1)
      {
        int v10 = *(const void **)&v3[16]._os_unfair_lock_opaque;
        if (!v10) {
          goto LABEL_35;
        }
LABEL_16:
        unsigned int v9 = (os_unfair_lock_s *)CFRetain(v10);
        goto LABEL_7;
      }
    }

    else
    {
      if (CFEqual(a2, @"DestinationEndpoint"))
      {
        if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1LL) <= 1)
        {
          int v10 = *(const void **)&v3[12]._os_unfair_lock_opaque;
          goto LABEL_16;
        }

        goto LABEL_34;
      }

      if (CFEqual(a2, @"AppRuleIdentifier"))
      {
        if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1LL) <= 1)
        {
          int v10 = *(const void **)&v3[18]._os_unfair_lock_opaque;
          if (!v10)
          {
            int v10 = *(const void **)&v3[20]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
          }

          goto LABEL_16;
        }

        goto LABEL_34;
      }

      if (!CFEqual(a2, @"AppUnique"))
      {
        if (CFEqual(a2, @"ServiceType"))
        {
          uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFTypeID v7 = v3 + 24;
        }

        else
        {
          if (CFEqual(a2, @"LocalEndpoint"))
          {
            if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1LL) <= 1)
            {
              int v10 = *(const void **)&v3[14]._os_unfair_lock_opaque;
              if (!v10) {
                goto LABEL_35;
              }
              goto LABEL_16;
            }

            goto LABEL_34;
          }

          if (CFEqual(a2, @"Flags"))
          {
            uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
            CFTypeID v7 = v3 + 86;
            CFNumberType v8 = kCFNumberSInt32Type;
            goto LABEL_6;
          }

          if (CFEqual(a2, @"AppData"))
          {
            int v10 = *(const void **)&v3[88]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
            goto LABEL_16;
          }

          if (CFEqual(a2, @"AppAuditToken"))
          {
            int v10 = *(const void **)&v3[90]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
            goto LABEL_16;
          }

          if (CFEqual(a2, @"FilterFlowID"))
          {
            int v10 = *(const void **)&v3[98]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
            goto LABEL_16;
          }

          if (!CFEqual(a2, @"OutboundInterfaceIndex") || !v3[100]._os_unfair_lock_opaque) {
            goto LABEL_35;
          }
          CFTypeID v7 = v3 + 100;
          uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        }

        CFNumberType v8 = kCFNumberIntType;
        goto LABEL_6;
      }

      if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1LL) <= 1)
      {
        int v10 = *(const void **)&v3[22]._os_unfair_lock_opaque;
        if (!v10) {
          goto LABEL_35;
        }
        goto LABEL_16;
      }
    }

LABEL_34:
    __NEFlowSetError((uint64_t)v3, 4LL);
LABEL_35:
    int v3 = 0LL;
    goto LABEL_36;
  }

  return 0LL;
}

uint64_t NEFlowSetProperty(uint64_t cf, const void *a2, const __CFData *a3)
{
  uint64_t v5 = cf;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (runtime_inited == -1)
  {
    if (!cf) {
      return v5;
    }
  }

  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!v5) {
      return v5;
    }
  }

  uint64_t v6 = __kNEFlowTypeID;
  if (CFGetTypeID((CFTypeRef)v5) == v6)
  {
    CFTypeID v7 = (os_unfair_lock_s *)(v5 + 120);
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 120));
    if (CFEqual(a2, @"LocalEndpoint"))
    {
      CFTypeID TypeID = CFDataGetTypeID();
      if (a3 && CFGetTypeID(a3) == TypeID)
      {
        uint64_t v9 = NEFlowResetLocalEndpoint(v5, a3);
        if (v9)
        {
          CFIndex v10 = v9;
          uint64_t v11 = v5;
LABEL_28:
          __NEFlowSetError(v11, v10);
          goto LABEL_29;
        }

LABEL_26:
        uint64_t v5 = 1LL;
LABEL_30:
        os_unfair_lock_unlock(v7);
        return v5;
      }
    }

    else if (CFEqual(a2, @"AppData"))
    {
      CFTypeID v12 = CFDataGetTypeID();
      if (a3 && CFGetTypeID(a3) == v12)
      {
        uint64_t v13 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v19 = *(_DWORD *)(v5 + 24);
          *(_DWORD *)buf = 67109378;
          int v24 = v19;
          __int16 v25 = 2080;
          __int16 v26 = "Sending a properties update with app data";
          _os_log_debug_impl(&dword_187528000, v13, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
        }

        if ((*(_BYTE *)(v5 + 100) & 4) != 0) {
          flow_director_send_properties_update(*(void *)(v5 + 40), *(_DWORD *)(v5 + 24), 0, a3);
        }
        uint64_t v14 = *(const void **)(v5 + 352);
        if (v14)
        {
          CFRelease(v14);
          *(void *)(v5 + 352) = 0LL;
        }

        *(void *)(v5 + 352) = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
        goto LABEL_26;
      }
    }

    else
    {
      if (!CFEqual(a2, @"OutboundInterfaceIndex"))
      {
LABEL_29:
        uint64_t v5 = 0LL;
        goto LABEL_30;
      }

      CFTypeID v15 = CFNumberGetTypeID();
      if (a3 && CFGetTypeID(a3) == v15)
      {
        unsigned int valuePtr = 0;
        CFNumberGetValue(a3, kCFNumberIntType, &valuePtr);
        unsigned int v16 = valuePtr;
        *(_DWORD *)(v5 + 400) = valuePtr;
        *(_OWORD *)int v22 = *(_OWORD *)"<none>";
        if_indextoname(v16, v22);
        uint64_t v17 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v20 = *(_DWORD *)(v5 + 24);
          *(_DWORD *)buf = 67109378;
          int v24 = v20;
          __int16 v25 = 2080;
          __int16 v26 = v22;
          _os_log_debug_impl( &dword_187528000,  v17,  OS_LOG_TYPE_DEBUG,  "(%u): Setting outbound interface to %s",  buf,  0x12u);
        }

        flow_director_send_properties_update(*(void *)(v5 + 40), *(_DWORD *)(v5 + 24), valuePtr, 0LL);
        goto LABEL_26;
      }
    }

    uint64_t v11 = v5;
    CFIndex v10 = 4LL;
    goto LABEL_28;
  }

  return 0LL;
}

uint64_t NEFlowResetLocalEndpoint(uint64_t a1, CFDataRef theData)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  BytePtr = (UInt8 *)CFDataGetBytePtr(theData);
  CFIndex length = 0LL;
  __int128 v31 = 0uLL;
  int v32 = 0;
  int v5 = *(_DWORD *)(a1 + 400);
  CFStringRef v6 = NECreateAddressString((CFStringRef)BytePtr);
  if (v6)
  {
    CFTypeID v7 = (const char *)v6;
    if (!NEIsWildcardAddress(BytePtr))
    {
      int v8 = NEGetInterfaceForAddress(BytePtr);
      if (v8) {
        goto LABEL_7;
      }
      uint64_t v9 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v29 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)buf = 67109378;
        int v34 = v29;
        __int16 v35 = 2112;
        uint64_t v36 = v7;
        _os_log_error_impl( &dword_187528000,  v9,  OS_LOG_TYPE_ERROR,  "(%u): No interface found for %@, not re-setting the interface",  buf,  0x12u);
      }
    }

    int v8 = v5;
LABEL_7:
    CFRelease(v7);
    CFIndex v10 = *(const __CFData **)(a1 + 56);
    if (v10)
    {
      uint64_t v11 = CFDataGetBytePtr(v10);
      CFTypeID v12 = v11;
      int v13 = BytePtr[1];
      if (v13 == 2)
      {
        LOWORD(length) = 528;
        WORD1(length) = *((_WORD *)BytePtr + 1);
        int v14 = v11[1];
        if (v14 == 2) {
          HIDWORD(length) = *((_DWORD *)v11 + 1);
        }
      }

      else
      {
        LOWORD(length) = 7708;
        WORD1(length) = *((_WORD *)BytePtr + 1);
        int v14 = v11[1];
        if (v14 == 30) {
          __int128 v31 = *(_OWORD *)(v11 + 8);
        }
      }

      BOOL v18 = NEIsWildcardAddress(BytePtr);
      if (v13 != v14 || v18)
      {
        int v20 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v28 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 67109378;
          int v34 = v28;
          __int16 v35 = 2080;
          uint64_t v36 = "New local address is unspecified or has a different address family, only re-setting the local port";
          _os_log_debug_impl(&dword_187528000, v20, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
        }

        CFRelease(*(CFTypeRef *)(a1 + 56));
        CFDataRef v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)&length, length);
        uint64_t result = 0LL;
        *(void *)(a1 + 56) = v21;
        return result;
      }

      if (v13 == 30)
      {
        uint64_t v22 = *((void *)BytePtr + 1);
        uint64_t v23 = *((void *)BytePtr + 2);
        int v24 = (__int128 *)(BytePtr + 8);
        if (*((void *)v12 + 1) != v22 || *((void *)v12 + 2) != v23)
        {
          *(_DWORD *)(a1 + 100) |= 0x40u;
          __int128 v31 = *v24;
        }
      }

      else if (v13 == 2 && *((_DWORD *)v12 + 1) != *((_DWORD *)BytePtr + 1))
      {
        *(_DWORD *)(a1 + 100) |= 0x40u;
        HIDWORD(length) = *((_DWORD *)BytePtr + 1);
      }

      CFRelease(*(CFTypeRef *)(a1 + 56));
      uint64_t v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)&length, length);
    }

    else
    {
      uint64_t v17 = (void *)CFRetain(theData);
    }

    __int16 v26 = v17;
    uint64_t result = 0LL;
    *(void *)(a1 + 56) = v26;
    *(_DWORD *)(a1 + 400) = v8;
    return result;
  }

  CFTypeID v15 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v27 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)buf = 67109378;
    int v34 = v27;
    __int16 v35 = 2080;
    uint64_t v36 = "Cannot reset the local endpoint, given address is invalid";
    _os_log_error_impl(&dword_187528000, v15, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
  }

  return 4LL;
}

void flow_director_send_properties_update(uint64_t a1, unsigned int a2, int a3, const __CFData *a4)
{
  CFTypeID TypeID = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == TypeID)
  {
    CFIndex v9 = CFDataGetLength(a4) + 4;
    uint64_t v10 = 10LL;
  }

  else
  {
    uint64_t v10 = 5LL;
    CFIndex v9 = 4LL;
  }

  unint64_t v11 = v10 + v9;
  CFTypeID v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v13 = MEMORY[0x1895A7868](*MEMORY[0x189604DB0], v10 + v9 + 8, 0LL);
  *(_BYTE *)uint64_t v13 = 7;
  *(_DWORD *)(v13 + 4) = bswap32(a2);
  if (v11 <= 8) {
    goto LABEL_11;
  }
  uint64_t v14 = v13;
  *(_BYTE *)(v13 + 8) = 13;
  *(_DWORD *)(v13 + 9) = 0x4000000;
  *(_DWORD *)(v13 + 13) = a3;
  CFTypeID v15 = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == v15)
  {
    unsigned int Length = CFDataGetLength(a4);
    BytePtr = CFDataGetBytePtr(a4);
    if (v11 - 9 >= (unint64_t)Length + 5)
    {
      *(_BYTE *)(v14 + 17) = 31;
      *(_DWORD *)(v14 + 18) = bswap32(Length);
      memcpy((void *)(v14 + 22), BytePtr, Length);
      goto LABEL_10;
    }

LABEL_11:
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }

    address = 0LL;
    goto LABEL_12;
  }

  address = (sockaddr *)CFDataGetBytePtr(*(CFDataRef *)(v7 + 48));
  a3 = 0LL;
LABEL_12:
  uint64_t v10 = *(os_unfair_lock_s **)(a1 + 32);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __flow_bridge_read_data_from_connection_group_block_invoke_2;
  v11[3] = &__block_descriptor_tmp_168;
  v11[4] = v10;
  NEFlowWrite(v10, a2, &address->sa_len, v11);
  nw_release(a3);
}

  CFTypeID v7 = bswap32(*((_DWORD *)v5 + 1));
  if (v4 >= v7)
  {
    v5[v7] = 0;
    int v8 = xpc_string_create(v5 + 8);
  }

  else
  {
    int v8 = 0LL;
  }

  uint64_t v13 = 1;
LABEL_21:
  if (v13 && v5 != v17) {
    free(v5);
  }
  return v8;
}

LABEL_10:
  flow_director_msg_send(a1, v14, v11 + 8, 0);
  CFAllocatorDeallocate(v12, (void *)v14);
}

    flow_director_abort(*(void *)(a1 + 32), 0LL);
    return;
  }

  if (a3)
  {
    uint64_t v10 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = dword_18C6D76C8;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v7;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = strerror(a3);
      unint64_t v11 = "(%u): %s: aborting director due to read error: %s";
      CFTypeID v12 = v10;
      uint64_t v13 = 28;
LABEL_26:
      _os_log_error_impl(&dword_187528000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_10;
    }

    goto LABEL_10;
  }

  if (a5 <= 7)
  {
    CFTypeID v15 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = dword_18C6D76C8;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a5;
    unsigned int v16 = "(%u): %s: received a message that is too short (%zu)";
    uint64_t v17 = v15;
    BOOL v18 = 28;
    goto LABEL_15;
  }

  v114 = bswap32(*((_DWORD *)a4 + 1));
  if (*a4 == 11)
  {
    int v20 = *(void *)(v6 + 152);
    *(void *)(v6 + 152) = 0LL;
    if (v20)
    {
      CFDataRef v21 = a5 - 8;
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
      if (v21 < 5)
      {
LABEL_19:
        uint64_t v23 = *(dispatch_queue_s **)(v6 + 8);
        *(void *)buf = MEMORY[0x1895F87A8];
        *(void *)&buf[8] = 0x40000000LL;
        *(void *)&buf[16] = __flow_director_handle_flow_states_block_invoke;
        *(void *)&buf[24] = &unk_18A06D828;
        *(void *)&buf[32] = v20;
        *(void *)&buf[40] = Mutable;
        dispatch_async(v23, buf);
        return;
      }

      __int128 v31 = a4 + 8;
      while (1)
      {
        int v32 = *v31;
        __int16 v33 = *(_DWORD *)(v31 + 1);
        int v34 = bswap32(v33);
        if (v33)
        {
          __int16 v35 = v34 + 5;
          if (v34 + 5 > v21) {
            goto LABEL_19;
          }
          uint64_t v36 = v31 + 5;
        }

        else
        {
          uint64_t v36 = 0LL;
          __int16 v35 = 5LL;
        }

        if (v32 == 39)
        {
          memset(buf, 0, 40);
          if (v34 > 0x27)
          {
            __int16 v42 = *((_OWORD *)v36 + 1);
            *(_OWORD *)buf = *(_OWORD *)v36;
            *(_OWORD *)&buf[16] = v42;
            *(void *)&buf[32] = *((void *)v36 + 4);
            node = rb_tree_find_node((rb_tree_t *)(v6 + 56), buf);
            if (node)
            {
              v44 = NEFlowCopyStateDictionary((uint64_t)node, (uint64_t)buf);
              CFArrayAppendValue(Mutable, v44);
              CFRelease(v44);
              goto LABEL_47;
            }

            v45 = (os_log_s *)ne_log_obj();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              goto LABEL_47;
            }
            *(_DWORD *)bytes = 67109376;
            *(_DWORD *)&bytes[4] = dword_18C6D76C8;
            *(_WORD *)&bytes[8] = 1024;
            *(_DWORD *)&bytes[10] = *(_DWORD *)buf;
            uint32_t v38 = bytes;
            uint32_t v39 = v45;
            int v40 = "(%u): Cannot find flow with ID from flow state (%u)";
            goto LABEL_43;
          }

          uint64_t v37 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)bytes = 67109376;
            *(_DWORD *)&bytes[4] = dword_18C6D76C8;
            *(_WORD *)&bytes[8] = 1024;
            *(_DWORD *)&bytes[10] = v34;
            uint32_t v38 = bytes;
            uint32_t v39 = v37;
            int v40 = "(%u): Got a flow state TLV with an invalid length: %u";
LABEL_43:
            _os_log_error_impl(&dword_187528000, v39, OS_LOG_TYPE_ERROR, v40, v38, 0xEu);
          }
        }

        else
        {
          uint32_t v41 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = dword_18C6D76C8;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v32;
            uint32_t v38 = buf;
            uint32_t v39 = v41;
            int v40 = "(%u): Got a non-state TLV: %u";
            goto LABEL_43;
          }
        }

  uint64_t v14 = *(nw_endpoint **)(a2 + 72);
  if (!v14) {
    goto LABEL_18;
  }
  type = nw_endpoint_get_type(v14);
  unsigned int v16 = *(nw_endpoint **)(a2 + 72);
  if (type == nw_endpoint_type_address)
  {
    uint64_t v17 = nw_endpoint_get_address(v16);
    if (v17)
    {
      BOOL v18 = v17->sa_family;
      if (v18 == 30)
      {
        int v19 = *v17;
        *(sockaddr *)((char *)&v36[1] + 8) = *(sockaddr *)&v17->sa_data[10];
        goto LABEL_20;
      }

      if (v18 == 2)
      {
        int v19 = *v17;
LABEL_20:
        *(sockaddr *)((char *)v36 + 12) = v19;
      }
    }

    parent_endpoint_domain = nw_endpoint_get_parent_endpoint_domain();
    goto LABEL_22;
  }

  if (nw_endpoint_get_type(v16) != nw_endpoint_type_host)
  {
LABEL_18:
    CFDataRef v21 = 0LL;
    goto LABEL_23;
  }

  ne_filter_create_wildcard_remote_sockaddr((uint64_t)buf, a2);
  *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)buf;
  *(_OWORD *)((char *)&v36[1] + 8) = *(_OWORD *)&buf[12];
  parent_endpoint_domain = (uint64_t)nw_endpoint_get_hostname(*(nw_endpoint_t *)(a2 + 72));
LABEL_22:
  CFDataRef v21 = (const char *)parent_endpoint_domain;
LABEL_23:
  DWORD1(v36[4]) = nw_parameters_get_ip_protocol();
  DWORD2(v36[4]) = getpid();
  HIDWORD(v36[4]) = nw_parameters_get_pid();
  nw_parameters_get_proc_uuid();
  nw_parameters_get_e_proc_uuid();
  if (a5)
  {
    uint64_t v22 = atomic_load((unint64_t *)(a2 + 104));
    uint64_t v23 = atomic_load((unint64_t *)(a2 + 112));
    *((void *)&v37 + 1) = v22;
    uint32_t v38 = v23;
  }

  effective_bundle_id = (const char *)nw_parameters_get_effective_bundle_id();
  url = nw_parameters_get_url();
  __int16 v26 = (const char *)url;
  *a4 = 32;
  int v27 = *(os_unfair_lock_s **)(a2 + 96);
  if (effective_bundle_id)
  {
    int v28 = strlen(effective_bundle_id);
    if (v26) {
      goto LABEL_27;
    }
LABEL_30:
    int v29 = 0;
    if (v21) {
      goto LABEL_28;
    }
    goto LABEL_31;
  }

  int v28 = 0;
  if (!url) {
    goto LABEL_30;
  }
LABEL_27:
  int v29 = strlen(v26);
  if (v21)
  {
LABEL_28:
    uint64_t v30 = strlen(v21);
    __int128 v31 = ne_filter_sign_data( v27,  a1,  (uint64_t)dst,  (uint64_t)effective_bundle_id,  v28,  (uint64_t)v26,  v29,  (uint64_t)v21,  v30,  a3,  a4);
    goto LABEL_32;
  }

CFDictionaryRef NEFlowCopyStateDictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  *(_OWORD *)v43 = xmmword_18A06D458;
  __int128 v44 = *(_OWORD *)&off_18A06D468;
  __int128 v45 = xmmword_18A06D478;
  __int128 v46 = *(_OWORD *)&off_18A06D488;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v40 = 0u;
  *(_OWORD *)keys = xmmword_18A06D498;
  __int128 v37 = *(_OWORD *)&off_18A06D4A8;
  __int128 v38 = xmmword_18A06D4B8;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  *(_OWORD *)values = 0u;
  *(_OWORD *)uint64_t v30 = xmmword_18A06D4C8;
  __int128 v31 = off_18A06D4D8;
  int v32 = @"SendBufferSize";
  CFNumberRef v29 = 0LL;
  *(_OWORD *)int v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v4 = *(const __CFData **)(a1 + 48);
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(v4);
    CFStringRef v6 = NECreateAddressStringWithPort((uint64_t)BytePtr);
  }

  else
  {
    CFStringRef v6 = @"<unknown>";
  }

  CFTypeID v7 = *(const __CFData **)(a1 + 56);
  if (v7)
  {
    int v8 = CFDataGetBytePtr(v7);
    CFIndex v9 = NECreateAddressStringWithPort((uint64_t)v8);
  }

  else
  {
    CFIndex v9 = @"<unknown>";
  }

  uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberLongType, (const void *)(a1 + 24));
  CFTypeID v12 = @"TCP";
  if (*(void *)(a1 + 16) == 2LL) {
    CFTypeID v12 = @"UDP";
  }
  v39[0] = v11;
  v39[1] = (void *)v12;
  uint64_t v13 = *(const void **)(a1 + 80);
  if (v13) {
    uint64_t v14 = (const __CFString *)CFRetain(v13);
  }
  else {
    uint64_t v14 = @"<unknown>";
  }
  *(void *)&__int128 v40 = v14;
  *((void *)&v40 + 1) = v6;
  *(void *)&__int128 v41 = v9;
  CFTypeID v15 = *(const void **)(a1 + 64);
  if (v15) {
    unsigned int v16 = (const __CFString *)CFRetain(v15);
  }
  else {
    unsigned int v16 = @"<unknown>";
  }
  *((void *)&v41 + 1) = v16;
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v18 = 328LL;
  if (v17 == 2) {
    uint64_t v18 = 336LL;
  }
  BOOL valuePtr = *(void *)(a1 + v18) != 0LL;
  if (v17 == 2)
  {
    size_t size = *(unsigned int *)(a1 + 280);
  }

  else
  {
    size_t size = *(void *)(a1 + 112);
    if (size) {
      size_t size = dispatch_data_get_size((dispatch_data_t)size);
    }
  }

  size_t v25 = size;
  values[0] = CFNumberCreate(v10, kCFNumberLongType, &v25);
  values[1] = CFNumberCreate(v10, kCFNumberIntType, &valuePtr);
  *(void *)&__int128 v34 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 232));
  *((void *)&v34 + 1) = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 240));
  *(void *)&__int128 v35 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 248));
  *((void *)&v35 + 1) = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 256));
  uint64_t v20 = 0LL;
  *(void *)&__int128 v42 = CFDictionaryCreate( v10,  (const void **)keys,  (const void **)values,  6LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  do
    CFRelease(values[v20++]);
  while (v20 != 6);
  v27[0] = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 8));
  v27[1] = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 16));
  *(void *)&__int128 v28 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 24));
  *((void *)&v28 + 1) = CFNumberCreate(v10, kCFNumberIntType, (const void *)(a2 + 32));
  CFNumberRef v29 = CFNumberCreate(v10, kCFNumberIntType, (const void *)(a2 + 36));
  uint64_t v21 = 0LL;
  *((void *)&v42 + 1) = CFDictionaryCreate( v10,  (const void **)v30,  (const void **)v27,  5LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  do
    CFRelease(v27[v21++]);
  while (v21 != 5);
  CFDictionaryRef v22 = CFDictionaryCreate(v10, (const void **)v43, (const void **)v39, 8LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  for (uint64_t i = 0LL; i != 8; ++i)
    CFRelease(v39[i]);
  return v22;
}

uint64_t NEFlowTLVNext(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 5) {
    return 0LL;
  }
  int v3 = *(_BYTE **)a1;
  *(_BYTE *)a2 = **(_BYTE **)a1;
  unsigned int v4 = *(_DWORD *)(v3 + 1);
  uint64_t v5 = bswap32(v4);
  *(_DWORD *)(a2 + 4) = v5;
  if (v4)
  {
    unint64_t v6 = v5 + 5;
    if (v6 > v2) {
      return 0LL;
    }
    int v8 = v3 + 5;
  }

  else
  {
    int v8 = 0LL;
    unint64_t v6 = 5LL;
  }

  *(void *)(a2 + 8) = v8;
  *(void *)a1 = &v3[v6];
  *(void *)(a1 + 8) = v2 - v6;
  return 1LL;
}

uint64_t NEFlowTLVMsgCreate(unsigned int a1, char a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10 = 5 * a3 + a4;
  uint64_t result = MEMORY[0x1895A7868](*MEMORY[0x189604DB0], v10 + 8, 0LL);
  *(_BYTE *)uint64_t result = a2;
  *(_DWORD *)(result + 4) = bswap32(a1);
  if (a6)
  {
    *a6 = result + 8;
    a6[1] = v10;
  }

  *a5 = v10 + 8;
  return result;
}

uint64_t NEFlowDirectorCreateInternal(int a1, dispatch_object_s *a2, unint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (a1 < 0)
  {
    CFTypeID v15 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    *(_DWORD *)&buf[0].sa_len = 136315138;
    *(void *)&buf[0].sa_data[2] = "NEFlowDirectorCreateInternal";
    unsigned int v16 = "%s called with null (control_socket >= 0)";
LABEL_20:
    _os_log_fault_impl(&dword_187528000, v15, OS_LOG_TYPE_FAULT, v16, &buf[0].sa_len, 0xCu);
    return 0LL;
  }

  if (!((unint64_t)a2 | a3))
  {
    CFTypeID v15 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    *(_DWORD *)&buf[0].sa_len = 136315138;
    *(void *)&buf[0].sa_data[2] = "NEFlowDirectorCreateInternal";
    unsigned int v16 = "%s called with null (callback_queue != ((void *)0) || bridge_context != ((void *)0))";
    goto LABEL_20;
  }

  if (NEFlowDirectorCreateInternal_init_predicate != -1) {
    dispatch_once(&NEFlowDirectorCreateInternal_init_predicate, &__block_literal_global_71);
  }
  unint64_t v6 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109378;
    *(_DWORD *)&buf[0].sa_data[2] = dword_18C6D76C8;
    *(_WORD *)&buf[0].sa_data[6] = 2080;
    *(void *)&buf[0].sa_data[8] = "Creating a new flow director";
    _os_log_impl(&dword_187528000, v6, OS_LOG_TYPE_DEFAULT, "(%u): %s", &buf[0].sa_len, 0x12u);
  }

  uint64_t v7 = MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 200LL, 0LL);
  *(_OWORD *)uint64_t v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_OWORD *)(v7 + 32) = 0u;
  *(_OWORD *)(v7 + 48) = 0u;
  *(_OWORD *)(v7 + 64) = 0u;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(_OWORD *)(v7 + 128) = 0u;
  *(_OWORD *)(v7 + 144) = 0u;
  *(_OWORD *)(v7 + 160) = 0u;
  *(_OWORD *)(v7 + 176) = 0u;
  *(void *)(v7 + 192) = 0LL;
  rb_tree_init((rb_tree_t *)(v7 + 56), (const rb_tree_ops_t *)NEFlowDirectorCreateInternal_rb_ops);
  if (a2)
  {
    *(void *)(v7 + 8) = a2;
    dispatch_retain(a2);
  }

  int v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(v8);
  uint64_t v10 = dispatch_queue_attr_make_with_qos_class(initially_inactive, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v11 = dispatch_queue_create("flow director queue", v10);
  *(void *)(v7 + 16) = v11;
  if (a3)
  {
    nw_queue_context_target_dispatch_queue();
    *(void *)uint64_t v7 = nw_retain((void *)a3);
    dispatch_queue_t v11 = *(dispatch_queue_t *)(v7 + 16);
  }

  dispatch_set_context(v11, (void *)v7);
  dispatch_set_finalizer_f(*(dispatch_object_t *)(v7 + 16), (dispatch_function_t)flow_director_deallocate);
  dispatch_activate(*(dispatch_object_t *)(v7 + 16));
  *(void *)(v7 + 24) = flow_director_create_io_handler(v7, a1);
  socklen_t v17 = 32;
  memset(buf, 0, sizeof(buf));
  int v12 = getpeername(a1, buf, &v17);
  int v13 = *(_DWORD *)&buf[0].sa_data[6];
  if (v12) {
    int v13 = 0;
  }
  *(_DWORD *)(v7 + 32) = v13;
  flow_director_reset_default_interface_info(v7, "lo0");
  NEFlowDirectorSetMaxSendSize(v7, 0x100000uLL);
  NEFlowDirectorSetMaxReceiveSize(v7, 0x200000uLL);
  return v7;
}

void flow_director_deallocate(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  unint64_t v2 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 67109378;
    v3[1] = dword_18C6D76C8;
    __int16 v4 = 2080;
    uint64_t v5 = "Deallocated flow director";
    _os_log_debug_impl(&dword_187528000, v2, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v3, 0x12u);
  }

  CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DB0], a1);
}

dispatch_source_t flow_director_create_io_handler(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = MEMORY[0x1895F87A8];
  __int16 v4 = *(dispatch_queue_s **)(a1 + 16);
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 0x40000000LL;
  aBlock[2] = __flow_director_create_io_handler_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_122;
  aBlock[4] = a1;
  uint64_t v5 = _Block_copy(aBlock);
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895F8B60], a2, 0LL, v4);
  int v7 = fcntl(a2, 3);
  LODWORD(v8) = v7 | 4;
  if (v7 >= 0) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = 4LL;
  }
  fcntl(a2, 4, v8);
  unint64_t v15 = v4 | 0xBAACCAAB00000000LL;
  int v9 = change_fdguard_np();
  if (v9)
  {
    int v10 = v9;
    dispatch_queue_t v11 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(handler) = 67109376;
      HIDWORD(handler) = a2;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v10;
      _os_log_error_impl( &dword_187528000,  v11,  OS_LOG_TYPE_ERROR,  "Unable to guard control socket fd %d (%d)",  (uint8_t *)&handler,  0xEu);
    }
  }

  dispatch_set_context(v6, v5);
  uint64_t handler = v3;
  uint64_t v17 = 0x40000000LL;
  uint64_t v18 = __flow_director_create_ctl_source_block_invoke;
  uint64_t v19 = &__block_descriptor_tmp_123;
  int v22 = a2;
  dispatch_source_t v20 = v6;
  unint64_t v21 = v15;
  dispatch_source_set_cancel_handler(v6, &handler);
  v14[0] = v3;
  v14[1] = 0x40000000LL;
  v14[2] = __flow_director_create_ctl_source_block_invoke_2;
  v14[3] = &__block_descriptor_tmp_124;
  v14[4] = v6;
  dispatch_source_set_event_handler(v6, v14);
  return v6;
}

uint64_t flow_director_reset_default_interface_info(uint64_t a1, const char *a2)
{
  __int16 v4 = (const __CFString *)NECopyInterfaceAddress(a2, 2);
  if (v4)
  {
    uint64_t v5 = v4;
    dispatch_source_t v6 = NECreateAddressStructFromString(v4, 0LL, 0LL);
    CFRelease(v5);
    int v7 = *(void **)(a1 + 160);
    if (v7) {
      free(v7);
    }
    *(void *)(a1 + 160) = v6;
  }

  uint64_t v8 = (const __CFString *)NECopyInterfaceAddress(a2, 30);
  if (v8)
  {
    int v9 = v8;
    int v10 = NECreateAddressStructFromString(v8, 0LL, 0LL);
    CFRelease(v9);
    dispatch_queue_t v11 = *(void **)(a1 + 168);
    if (v11) {
      free(v11);
    }
    *(void *)(a1 + 168) = v10;
  }

  uint64_t result = if_nametoindex(a2);
  *(_DWORD *)(a1 + 176) = result;
  return result;
}

void NEFlowDirectorSetMaxSendSize(uint64_t a1, unint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  int v18 = a2;
  unint64_t v3 = a2 - 8;
  if (a2 <= 8)
  {
    __int16 v4 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109632;
    int v20 = dword_18C6D76C8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    __int16 v23 = 2048;
    uint64_t v24 = 8LL;
    uint64_t v5 = "(%u): Cannot set the maximum send size (%lu) to less than %lu";
    dispatch_source_t v6 = v4;
    uint32_t v7 = 28;
LABEL_10:
    _os_log_error_impl(&dword_187528000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    return;
  }

  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 24));
  int v10 = handle;
  if (handle <= 0)
  {
    uint64_t v17 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109376;
    int v20 = dword_18C6D76C8;
    __int16 v21 = 1024;
    LODWORD(v22) = v10;
    uint64_t v5 = "(%u): Did not get a valid control socket from the dispatch source: %d";
    dispatch_source_t v6 = v17;
    uint32_t v7 = 14;
    goto LABEL_10;
  }

  int v11 = setsockopt(handle, 0xFFFF, 4097, &v18, 4u);
  int v12 = (os_log_s *)ne_log_obj();
  int v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = dword_18C6D76C8;
    unint64_t v15 = __error();
    unsigned int v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    int v20 = v14;
    __int16 v21 = 2080;
    unint64_t v22 = (unint64_t)v16;
    uint64_t v5 = "(%u): Failed to set SO_SNDBUF on the control socket: %s";
    dispatch_source_t v6 = v13;
    uint32_t v7 = 18;
    goto LABEL_10;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v20 = dword_18C6D76C8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    _os_log_impl( &dword_187528000,  v13,  OS_LOG_TYPE_DEFAULT,  "(%u): Set SO_SNDBUF on the control socket to %lu",  buf,  0x12u);
  }

  *(void *)(a1 + 184) = v3;
}

void NEFlowDirectorSetMaxReceiveSize(uint64_t a1, unint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  int v18 = a2;
  unint64_t v3 = a2 - 8;
  if (a2 <= 8)
  {
    __int16 v4 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109632;
    int v20 = dword_18C6D76C8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    __int16 v23 = 2048;
    uint64_t v24 = 8LL;
    uint64_t v5 = "(%u): Cannot set the maximum receive size (%lu) to less than %lu";
    dispatch_source_t v6 = v4;
    uint32_t v7 = 28;
LABEL_10:
    _os_log_error_impl(&dword_187528000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    return;
  }

  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 24));
  int v10 = handle;
  if (handle <= 0)
  {
    uint64_t v17 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109376;
    int v20 = dword_18C6D76C8;
    __int16 v21 = 1024;
    LODWORD(v22) = v10;
    uint64_t v5 = "(%u): Did not get a valid control socket from the dispatch source: %d";
    dispatch_source_t v6 = v17;
    uint32_t v7 = 14;
    goto LABEL_10;
  }

  int v11 = setsockopt(handle, 0xFFFF, 4098, &v18, 4u);
  int v12 = (os_log_s *)ne_log_obj();
  int v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = dword_18C6D76C8;
    unint64_t v15 = __error();
    unsigned int v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    int v20 = v14;
    __int16 v21 = 2080;
    unint64_t v22 = (unint64_t)v16;
    uint64_t v5 = "(%u): Failed to set SO_RCVBUF on the control socket: %s";
    dispatch_source_t v6 = v13;
    uint32_t v7 = 18;
    goto LABEL_10;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v20 = dword_18C6D76C8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    _os_log_impl( &dword_187528000,  v13,  OS_LOG_TYPE_DEFAULT,  "(%u): Set SO_RCVBUF on the control socket to %lu",  buf,  0x12u);
  }

  *(void *)(a1 + 192) = v3;
}

void __flow_director_create_io_handler_block_invoke( uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4, unint64_t a5)
{
  uint64_t v139 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 40) == a2) {
    uint32_t v7 = "data";
  }
  else {
    uint32_t v7 = "control";
  }
  if (!a4 || !a5)
  {
    int v14 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = dword_18C6D76C8;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v7;
      int v11 = "(%u): %s: aborting director due to EOF";
      int v12 = v14;
      uint32_t v13 = 18;
      goto LABEL_26;
    }

LABEL_47:
        v31 += v35;
        v21 -= v35;
        if (v21 <= 4) {
          goto LABEL_19;
        }
      }
    }

    uint64_t v30 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = dword_18C6D76C8;
    unsigned int v16 = "(%u): Got flow states, but no callback is available";
    uint64_t v17 = v30;
    uint32_t v18 = 8;
LABEL_15:
    _os_log_error_impl(&dword_187528000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    return;
  }

  uint64_t v24 = (os_unfair_lock_s *)rb_tree_find_node((rb_tree_t *)(v6 + 56), &v114);
  uint64_t v25 = v24;
  int v26 = *a4;
  if (v26 != 1)
  {
    if (v24)
    {
      switch(*a4)
      {
        case 2u:
          flow_director_handle_connect_result(*(void *)(a1 + 32), (uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 3u:
          flow_director_handle_data(*(void *)(a1 + 32), (uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 4u:
          flow_director_handle_close((uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 5u:
          flow_director_handle_read_notification(v24);
          break;
        default:
          return;
      }

      return;
    }

    if ((v26 & 0xFE) != 2) {
      return;
    }
    v54 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      return;
    }
    else {
      v55 = off_18A06DB40[(*a4 - 1)];
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = dword_18C6D76C8;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v55;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v114;
    unsigned int v16 = "(%u): %s: Recevied a %s message for flow %u, but the flow cannot be found";
    uint64_t v17 = v54;
    uint32_t v18 = 34;
    goto LABEL_15;
  }

  uint64_t v27 = *(void *)(a1 + 32);
  unsigned int v28 = v114;
  unsigned int v115 = 0;
  if (v24)
  {
    CFNumberRef v29 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint32_t os_unfair_lock_opaque = v25[6]._os_unfair_lock_opaque;
      v80 = strerror(37);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = os_unfair_lock_opaque;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v80;
      _os_log_error_impl(&dword_187528000, v29, OS_LOG_TYPE_ERROR, "(%u): Sending error connect result: %s", buf, 0x12u);
    }

    flow_director_send_connect_result(v27, v28, 0x25u, 0, 0, 0LL, 0LL, 0, 0LL);
    return;
  }

  __int128 v137 = 0u;
  __int128 v138 = 0u;
  unint64_t v46 = a5 - 8;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v134 = 0u;
  memset(buf, 0, sizeof(buf));
  memset(bytes, 0, sizeof(bytes));
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  uint64_t v47 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)dst = 67109376;
    int v117 = dword_18C6D76C8;
    __int16 v118 = 1024;
    *(_DWORD *)v119 = v28;
    _os_log_impl(&dword_187528000, v47, OS_LOG_TYPE_DEFAULT, "(%u): Flow %u is connecting", dst, 0xEu);
  }

  v48 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v46 < 5)
  {
    CFStringRef v49 = 0LL;
    CFStringRef v50 = 0LL;
    int v102 = 0;
    CFDataRef v110 = 0LL;
    CFDataRef cf = 0LL;
    CFDataRef v51 = 0LL;
    CFStringRef v52 = 0LL;
    CFDataRef v53 = 0LL;
    CFDataRef v109 = 0LL;
    int v104 = 0;
    unsigned __int16 v100 = 0;
    UInt8 v101 = 5;
    uint64_t v103 = 1LL;
    goto LABEL_130;
  }

  uint64_t v96 = v27;
  CFDataRef v98 = 0LL;
  CFDataRef v112 = 0LL;
  CFStringRef v49 = 0LL;
  CFStringRef v50 = 0LL;
  int v102 = 0;
  CFDataRef v110 = 0LL;
  CFDataRef cf = 0LL;
  CFStringRef v105 = 0LL;
  CFDataRef v107 = 0LL;
  CFDataRef v109 = 0LL;
  int v104 = 0;
  unsigned __int16 v100 = 0;
  v56 = a4 + 8;
  UInt8 v101 = 5;
  uint64_t v103 = 1LL;
  do
  {
    int v57 = *v56;
    unsigned int v58 = *(_DWORD *)(v56 + 1);
    size_t v59 = bswap32(v58);
    if (v58)
    {
      uint64_t v60 = v59 + 5;
      if (v59 + 5 > v46) {
        break;
      }
      v61 = v56 + 5;
    }

    else
    {
      v61 = 0LL;
      uint64_t v60 = 5LL;
    }

    BOOL v62 = v57 == 21 && v50 == 0LL;
    if (v62)
    {
      CFStringRef v50 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
      goto LABEL_73;
    }

    if (v57 == 11 || v57 == 23 || v57 == 22)
    {
      __memcpy_chk();
      goto LABEL_73;
    }

    if (v57 == 24 && !v112)
    {
      CFDataRef v112 = CFDataCreate(v48, v61, v59);
      goto LABEL_73;
    }

    if (v57 == 25 && !v49)
    {
      CFStringRef v49 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
      goto LABEL_73;
    }

    switch(*v56)
    {
      case 0x1Du:
        if (v58 == 0x4000000)
        {
          *(_DWORD *)dst = 0;
          __memcpy_chk();
          v102 |= *(_DWORD *)dst;
        }

        break;
      case 0x1Eu:
        if (v58 != 0x4000000) {
          break;
        }
        *(_DWORD *)dst = 0;
        __memcpy_chk();
        uint64_t v63 = *(unsigned int *)dst;
        if (*(_DWORD *)dst != 1)
        {
          if (*(_DWORD *)dst != 3) {
            break;
          }
          uint64_t v63 = 2LL;
        }

        uint64_t v103 = v63;
        break;
      case 0x1Fu:
        if (cf) {
          CFRelease(cf);
        }
        CFDataRef cf = CFDataCreate(v48, v61, v59);
        break;
      case 0x20u:
        if (v107) {
          CFRelease(v107);
        }
        if (v58 == 0x20000000)
        {
          CFDataRef v107 = CFDataCreate(v48, v61, 32LL);
        }

        else
        {
          v64 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)dst = 67109376;
            int v117 = MEMORY[0x18];
            __int16 v118 = 1024;
            *(_DWORD *)v119 = v59;
            _os_log_error_impl( &dword_187528000,  v64,  OS_LOG_TYPE_ERROR,  "(%u): Invalid App audit token tlv length: %d",  dst,  0xEu);
          }
        }

        break;
      default:
        if (v57 == 20)
        {
          if (v58 == 0x1000000) {
            UInt8 v101 = *v61;
          }
        }

        else if (v57 == 14)
        {
          if (v58 == 0x2000000) {
            unsigned __int16 v100 = *(_WORD *)v61;
          }
        }

        else if (v57 != 33 || v105)
        {
          if (v57 != 34 || v98)
          {
            if (v57 != 35 || v110)
            {
              if (v57 != 36 || v109)
              {
                if (v57 == 13 && !v104 && v58 == 0x4000000) {
                  int v104 = *(_DWORD *)v61;
                }
              }

              else if (v59 > 0x10)
              {
                CFDataRef v109 = 0LL;
              }

              else
              {
                if (v58 == 0x10000000)
                {
                  uuid_copy(dst, v61);
                }

                else
                {
                  uuid_copy(dst, g_cfil_flow_uuid_template);
                  memcpy(&dst[-v59 + 16], v61, v59);
                }

                CFDataRef v109 = CFDataCreate(v48, dst, 16LL);
              }
            }

            else if (v58 == 0x20000000)
            {
              CFDataRef v110 = CFDataCreate(v48, v61, 32LL);
            }

            else
            {
              v65 = (os_log_s *)ne_log_obj();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)dst = 67109376;
                int v117 = MEMORY[0x18];
                __int16 v118 = 1024;
                *(_DWORD *)v119 = v59;
                _os_log_error_impl( &dword_187528000,  v65,  OS_LOG_TYPE_ERROR,  "(%u): Invalid real audit token tlv length: %d",  dst,  0xEu);
              }

              CFDataRef v110 = 0LL;
            }
          }

          else
          {
            CFDataRef v98 = CFDataCreate(v48, v61, v59);
          }
        }

        else
        {
          CFStringRef v105 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
        }

        break;
    }

LABEL_73:
    v56 += v60;
    v46 -= v60;
  }

  while (v46 > 4);
  uint64_t v27 = v96;
  CFDataRef v53 = v98;
  CFStringRef v52 = v105;
  CFDataRef v51 = v107;
  CFDataRef v66 = v112;
  if (!v112) {
LABEL_130:
  }
    CFDataRef v66 = CFDataCreate(v48, 0LL, 0LL);
  CFDataRef v113 = v66;
  if (!v49) {
    CFStringRef v49 = &stru_18A06F2C8;
  }
  if (!v115
    || ((CFTypeID TypeID = CFStringGetTypeID(), !v50) ? (v68 = 0LL) : CFGetTypeID(v50) != TypeID ? (v68 = 0LL) : (v68 = v50),
        !v68 && !buf[1] || (CFTypeID v69 = CFStringGetTypeID(), CFGetTypeID(v49) != v69)))
  {
    v76 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)dst = 67110402;
      int v117 = dword_18C6D76C8;
      __int16 v118 = 1024;
      *(_DWORD *)v119 = v28;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v115;
      __int16 v120 = 2112;
      CFStringRef v121 = v50;
      __int16 v122 = 1024;
      int v123 = buf[1];
      __int16 v124 = 2112;
      CFStringRef v125 = v49;
      _os_log_error_impl( &dword_187528000,  v76,  OS_LOG_TYPE_ERROR,  "(%u): Flow properties are incomplete for flow %u, port = %d, dest_name = %@, target_addr family = %d, app_signing_id = %@",  dst,  0x2Eu);
    }

    flow_director_send_connect_result(v27, v28, 0x16u, 0, 0, 0LL, 0LL, 0, 0LL);
    CFDataRef v78 = v110;
    CFDataRef v77 = cf;
    goto LABEL_161;
  }

  CFStringRef v106 = v52;
  v70 = v53;
  if (!buf[1])
  {
    buf[1] = 2;
    unsigned int v71 = v115;
    if (*(_BYTE *)(v27 + 122)) {
      BOOL v81 = v115 == 53;
    }
    else {
      BOOL v81 = 0;
    }
    char v74 = v81 && v103 == 2;
LABEL_186:
    char v97 = v74;
    *(_WORD *)&sockaddr buf[2] = bswap32(v71) >> 16;
    unsigned int v75 = 16;
LABEL_187:
    buf[0] = v75;
    goto LABEL_189;
  }

  unsigned int v71 = v115;
  if (*(_BYTE *)(v27 + 122)) {
    BOOL v72 = v115 == 53;
  }
  else {
    BOOL v72 = 0;
  }
  char v74 = v72 && v103 == 2;
  if (buf[1] == 2) {
    goto LABEL_186;
  }
  char v97 = v74;
  if (buf[1] == 30)
  {
    *(_WORD *)&sockaddr buf[2] = bswap32(v115) >> 16;
    unsigned int v75 = 28;
    goto LABEL_187;
  }

  unsigned int v75 = buf[0];
LABEL_189:
  CFDataRef v83 = CFDataCreate(v48, buf, v75);
  int v84 = bytes[1];
  if (!bytes[1])
  {
    int v84 = buf[1];
    bytes[1] = buf[1];
    bytes[0] = buf[0];
  }

  CFDataRef v108 = v51;
  BOOL v85 = NEIsWildcardAddress(bytes);
  int v86 = 16;
  if (!v85)
  {
    if (v84)
    {
LABEL_199:
      CFDataRef v53 = v70;
      goto LABEL_200;
    }

LABEL_201:
    int v99 = 16;
    CFDataRef v88 = 0LL;
    CFDataRef v53 = v70;
    goto LABEL_202;
  }

  if (!v84) {
    goto LABEL_201;
  }
  if (v84 == 30)
  {
    uint64_t v95 = *(void *)(v27 + 168);
    if (v95)
    {
      *(_OWORD *)&bytes[8] = *(_OWORD *)(v95 + 8);
      int v86 = 80;
    }

    else
    {
      int v86 = 16;
    }

    goto LABEL_199;
  }

  BOOL v62 = v84 == 2;
  CFDataRef v53 = v70;
  if (v62)
  {
    uint64_t v87 = *(void *)(v27 + 160);
    if (v87)
    {
      *(_DWORD *)&bytes[4] = *(_DWORD *)(v87 + 4);
      int v86 = 80;
    }

    else
    {
      int v86 = 16;
    }
  }

LABEL_200:
  int v99 = v86;
  CFDataRef v88 = CFDataCreate(v48, bytes, bytes[0]);
LABEL_202:
  if (v104)
  {
    v89 = v83;
    v90 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)dst = 67109632;
      int v117 = dword_18C6D76C8;
      __int16 v118 = 1024;
      *(_DWORD *)v119 = v28;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v104;
      _os_log_debug_impl( &dword_187528000,  v90,  OS_LOG_TYPE_DEBUG,  "(%u): Kernel set interface index for flow %u to %u",  dst,  0x14u);
    }

    CFDataRef v83 = v89;
  }

  else
  {
    int v104 = *(_DWORD *)(v27 + 176);
  }

  if (runtime_inited != -1) {
    dispatch_once(&runtime_inited, &__block_literal_global_129);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v92 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = v103;
    *(_DWORD *)(Instance + 24) = v28;
    *(void *)(Instance + 40) = v27;
    *(void *)(Instance + 48) = v83;
    if (v83) {
      CFRetain(v83);
    }
    *(void *)(v92 + 64) = v50;
    if (v50) {
      CFRetain(v50);
    }
    *(void *)(v92 + 56) = v88;
    if (v88) {
      CFRetain(v88);
    }
    *(void *)(v92 + 280) = 0x4000000000000LL;
    *(void *)(v92 + 32) = 0LL;
    *(_DWORD *)(v92 + 100) = 0;
    *(_DWORD *)(v92 + 104) = 0;
    *(void *)(v92 + 112) = MEMORY[0x1895F8AA8];
    *(_DWORD *)(v92 + 120) = 0;
    *(void *)(v92 + 80) = v49;
    CFRetain(v49);
    *(void *)(v92 + 88) = v113;
    if (v113) {
      CFRetain(v113);
    }
    *(_OWORD *)(v92 + 176) = 0u;
    *(_OWORD *)(v92 + 192) = 0u;
    *(_OWORD *)(v92 + 144) = 0u;
    *(_OWORD *)(v92 + 160) = 0u;
    *(_DWORD *)(v92 + 96) = v100;
    *(_BYTE *)(v92 + 108) = v101;
    *(_BYTE *)(v92 + 320) = 0;
    *(void *)(v92 + 264) = 0LL;
    *(void *)(v92 + 272) = v92 + 264;
    *(void *)(v92 + 304) = 0LL;
    *(void *)(v92 + 312) = v92 + 304;
    *(_DWORD *)(v92 + 344) = v102;
    *(void *)(v92 + 352) = cf;
    if (cf) {
      CFRetain(cf);
    }
    *(void *)(v92 + 360) = v108;
    CFDataRef v53 = v70;
    if (v108) {
      CFRetain(v108);
    }
    *(void *)(v92 + 368) = v106;
    if (v106) {
      CFRetain(v106);
    }
    *(void *)(v92 + 376) = v70;
    if (v70) {
      CFRetain(v70);
    }
    *(void *)(v92 + 384) = v110;
    if (v110) {
      CFRetain(v110);
    }
    *(void *)(v92 + 392) = v109;
    if (v109) {
      CFRetain(v109);
    }
    *(_DWORD *)(v92 + 400) = v104;
    *(_BYTE *)(v92 + 432) = v97;
  }

  CFRelease(v83);
  if (v88) {
    CFRelease(v88);
  }
  CFDataRef v77 = cf;
  if (!v92) {
    __assert_rtn("flow_director_handle_connect", "NEFlow.c", 3014, "new_flow != NULL");
  }
  CFStringRef v52 = v106;
  if (rb_tree_insert_node((rb_tree_t *)(v27 + 56), (void *)v92) != (void *)v92) {
    __assert_rtn( "flow_director_handle_connect",  "NEFlow.c",  3015,  "rb_tree_insert_node(&director->flow_tree, new_flow) == new_flow");
  }
  *(_DWORD *)(v92 + 100) = v99;
  v93 = (os_log_s *)ne_log_obj();
  CFDataRef v78 = v110;
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    int v94 = *(_DWORD *)(v92 + 24);
    *(_DWORD *)dst = 67109378;
    int v117 = v94;
    __int16 v118 = 2112;
    *(void *)v119 = v92;
    _os_log_impl(&dword_187528000, v93, OS_LOG_TYPE_DEFAULT, "(%u): New flow: %@", dst, 0x12u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(v92 + 120));
  flow_startup(v92, v27, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(v92 + 120));
  CFDataRef v51 = v108;
LABEL_161:
  if (v50) {
    CFRelease(v50);
  }
  if (v113) {
    CFRelease(v113);
  }
  CFRelease(v49);
  if (v77) {
    CFRelease(v77);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (v52) {
    CFRelease(v52);
  }
  if (v53) {
    CFRelease(v53);
  }
  if (v78) {
    CFRelease(v78);
  }
  if (v109) {
    CFRelease(v109);
  }
}

void __flow_director_create_ctl_source_block_invoke(uint64_t a1)
{
  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  if (context)
  {
    _Block_release(context);
    dispatch_set_context(*(dispatch_object_t *)(a1 + 32), 0LL);
  }

  guarded_close_np();
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

int *__flow_director_create_ctl_source_block_invoke_2()
{
  return flow_director_ctl_source_do_read();
}

int *flow_director_ctl_source_do_read()
{
  v0 = (dispatch_source_s *)MEMORY[0x1895F8858]();
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v13[0] = v14;
  v13[1] = 66624LL;
  *(_OWORD *)&v8.msg_control = 0u;
  *(_OWORD *)&v8.msg_name = 0u;
  v8.msg_iov = (iovec *)v13;
  *(void *)&v8.msg_iovlen = 1LL;
  int handle = dispatch_source_get_handle(v0);
  context = dispatch_get_context(v0);
  if (!context) {
    __assert_rtn("flow_director_ctl_source_do_read", "NEFlow.c", 3438, "saved_handler != NULL");
  }
  for (uint64_t i = context;
        ;
        (*((void (**)(void *, dispatch_source_s *, void, _BYTE *, ssize_t))i + 2))(i, v0, 0LL, v14, v4))
  {
    bzero(v14, 0x10440uLL);
    ssize_t v4 = recvmsg(handle, &v8, 0);
    if (!v4)
    {
      uint64_t v5 = 0LL;
      return (int *)(*((uint64_t (**)(void *, dispatch_source_s *, uint64_t, void, void))i + 2))( i,  v0,  v5,  0LL,  0LL);
    }

    if (v4 < 0) {
      break;
    }
    if ((v8.msg_flags & 8) == 0)
    {
      uint32_t v7 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_14:
        uint64_t v5 = 22LL;
        return (int *)(*((uint64_t (**)(void *, dispatch_source_s *, uint64_t, void, void))i + 2))( i,  v0,  v5,  0LL,  0LL);
      }

      *(_DWORD *)buf = 67109378;
      int v10 = dword_18C6D76C8;
      __int16 v11 = 2080;
      int v12 = "Failed to read an entire packet";
LABEL_18:
      _os_log_error_impl(&dword_187528000, v7, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
      goto LABEL_14;
    }

    if ((v8.msg_flags & 0x10) != 0)
    {
      uint32_t v7 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 67109378;
      int v10 = dword_18C6D76C8;
      __int16 v11 = 2080;
      int v12 = "Message was too big for the read buffer";
      goto LABEL_18;
    }
  }

  uint64_t result = __error();
  if (*result == 35) {
    return result;
  }
  uint64_t v5 = *__error();
  return (int *)(*((uint64_t (**)(void *, dispatch_source_s *, uint64_t, void, void))i + 2))( i,  v0,  v5,  0LL,  0LL);
}

void __flow_director_handle_flow_states_block_invoke(uint64_t a1)
{
}

void flow_startup(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 120);
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 120));
  if (a3) {
    goto LABEL_2;
  }
  if (!*(void *)a2)
  {
    if ((*(_BYTE *)(a1 + 100) & 0x20) != 0 || !*(void *)(a2 + 136))
    {
      CFRetain((CFTypeRef)a1);
      dispatch_retain(*(dispatch_object_t *)(a2 + 16));
      unint64_t v21 = *(dispatch_queue_s **)(a2 + 8);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __flow_startup_block_invoke_154;
      block[3] = &__block_descriptor_tmp_161;
      block[4] = a2;
      void block[5] = a1;
      unint64_t v22 = block;
    }

    else
    {
      uint64_t v15 = *(void *)(a1 + 80);
      unsigned int v16 = *(const void **)(a1 + 360);
      if (!v15)
      {
        uint64_t v36 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)state_changed_uint64_t handler = 134218240;
          *(void *)&state_changed_handler[4] = 0LL;
          *(_WORD *)&state_changed_handler[12] = 2048;
          *(void *)&state_changed_handler[14] = v16;
          uint64_t v35 = "Signing identifier (%p) and/or audit token (%p) not available, rejecting flow";
          p_receive_uint64_t handler = state_changed_handler;
          __int128 v38 = v36;
          uint32_t v39 = 22;
LABEL_62:
          _os_log_error_impl(&dword_187528000, v38, OS_LOG_TYPE_ERROR, v35, p_receive_handler, v39);
          goto LABEL_2;
        }

        goto LABEL_2;
      }

      int v17 = *(_DWORD *)(a1 + 24);
      uint32_t v18 = *(const void **)(a1 + 368);
      uint64_t v19 = *(const void **)(a1 + 384);
      CFRetain(*(CFTypeRef *)(a1 + 80));
      if (v16) {
        CFRetain(v16);
      }
      if (v18) {
        CFRetain(v18);
      }
      if (v19) {
        CFRetain(v19);
      }
      uint64_t v20 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v46 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)state_changed_uint64_t handler = 67109378;
        *(_DWORD *)&state_changed_handler[4] = v46;
        *(_WORD *)&state_changed_handler[8] = 2112;
        *(void *)&state_changed_handler[10] = v15;
        _os_log_debug_impl( &dword_187528000,  v20,  OS_LOG_TYPE_DEBUG,  "(%u): Requesting rule matching for %@",  state_changed_handler,  0x12u);
      }

      dispatch_retain(*(dispatch_object_t *)(a2 + 16));
      unint64_t v21 = *(dispatch_queue_s **)(a2 + 8);
      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 0x40000000LL;
      v48[2] = __flow_startup_block_invoke;
      v48[3] = &__block_descriptor_tmp_153;
      int v49 = v17;
      v48[4] = a2;
      v48[5] = v16;
      v48[6] = v15;
      v48[7] = v18;
      v48[8] = v19;
      unint64_t v22 = v48;
    }

    dispatch_async(v21, v22);
    return;
  }

  if (*(void *)(a1 + 16) != 2LL) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(v6);
  uint32_t v7 = *(const __CFData **)(a1 + 48);
  if (!v7) {
    goto LABEL_36;
  }
  if (*(void *)(a1 + 64)) {
    goto LABEL_8;
  }
  BytePtr = CFDataGetBytePtr(v7);
  if (!BytePtr)
  {
LABEL_36:
    os_unfair_lock_assert_owner(v6);
    uint64_t v25 = *(void *)a2;
    int v26 = *(unsigned __int8 *)(a2 + 121);
    os_unfair_lock_assert_owner(v6);
    bridged_parameters = flow_create_bridged_parameters(a1, v25, v26);
    if (bridged_parameters)
    {
      unsigned int v28 = bridged_parameters;
      CFNumberRef v29 = (nw_connection_group *)nw_connection_group_create_with_parameters();
      nw_release(v28);
      if (v29)
      {
        *(void *)(a1 + 416) = v29;
        if (!*(void *)(a1 + 136))
        {
          uint64_t v30 = *(dispatch_object_s **)(a2 + 16);
          *(void *)(a1 + 136) = v30;
          dispatch_retain(v30);
        }

        nw_connection_group_set_queue(v29, *(dispatch_queue_t *)(a2 + 16));
        v50[0] = 0LL;
        v50[1] = v50;
        v50[2] = 0x2000000000LL;
        v50[3] = CFRetain((CFTypeRef)a1);
        uint64_t v31 = MEMORY[0x1895F87A8];
        *(void *)state_changed_uint64_t handler = MEMORY[0x1895F87A8];
        *(void *)&state_changed_handler[8] = 0x40000000LL;
        *(void *)&state_changed_handler[16] = __flow_setup_bridged_connection_group_block_invoke;
        unsigned int v58 = &unk_18A06D9F8;
        size_t v59 = v50;
        uint64_t v60 = a1;
        uint64_t v61 = a2;
        nw_connection_group_set_state_changed_handler(v29, state_changed_handler);
        os_unfair_lock_assert_owner(v6);
        if ((*(_BYTE *)(a1 + 100) & 1) == 0)
        {
          int v32 = *(nw_connection_group **)(a1 + 416);
          if (v32)
          {
            receive_uint64_t handler = v31;
            uint64_t v52 = 0x40000000LL;
            uint64_t v53 = (uint64_t)__flow_bridge_read_data_from_connection_group_block_invoke;
            CFTypeRef v54 = &__block_descriptor_tmp_170;
            uint64_t v55 = a1;
            v56 = v32;
            nw_connection_group_set_receive_handler(v32, 0xFFFFFFFF, 0, &receive_handler);
          }
        }

        nw_connection_group_start(v29);
        unsigned int v33 = v50;
        goto LABEL_56;
      }
    }

    uint64_t v34 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(receive_handler) = 0;
      uint64_t v35 = "Failed to create bridged connection group, rejecting flow";
LABEL_61:
      p_receive_uint64_t handler = (uint8_t *)&receive_handler;
      __int128 v38 = v34;
      uint32_t v39 = 2;
      goto LABEL_62;
    }

LABEL_2:
    flow_director_send_connect_result(a2, *(_DWORD *)(a1 + 24), 0x3Du, 0, 0, 0LL, 0LL, 0, 0LL);
    flow_drop_director((void *)a1);
    flow_cancel_bridged_connection(a1, 0LL);
    return;
  }

  int v24 = BytePtr[1];
  if (v24 == 30)
  {
    if (*((_DWORD *)BytePtr + 2) || *((_DWORD *)BytePtr + 3) || *((_DWORD *)BytePtr + 4) || *((_DWORD *)BytePtr + 5)) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }

  if (v24 != 2 || !*((_DWORD *)BytePtr + 1)) {
    goto LABEL_36;
  }
LABEL_8:
  os_unfair_lock_assert_owner(v6);
  uint64_t v8 = *(void *)a2;
  int v9 = *(unsigned __int8 *)(a2 + 121);
  os_unfair_lock_assert_owner(v6);
  int v10 = flow_create_bridged_parameters(a1, v8, v9);
  if (!v10) {
    goto LABEL_59;
  }
  __int16 v11 = v10;
  os_unfair_lock_assert_owner(v6);
  int v12 = *(const __CFData **)(a1 + 48);
  if (!v12) {
    goto LABEL_50;
  }
  uint32_t v13 = CFDataGetBytePtr(v12);
  if (!v13) {
    goto LABEL_50;
  }
  int v14 = v13[1];
  if (v14 != 30 && v14 != 2) {
    goto LABEL_50;
  }
  if (*(void *)(a1 + 64) && (*(void *)(a1 + 16) != 2LL || *((_WORD *)v13 + 1) != 13568))
  {
    __int128 v40 = NECreateCStringFromCFString(*(const __CFString **)(a1 + 64));
    if (v40)
    {
      __int128 v41 = v40;
      host_with_numeric_port = (nw_endpoint *)nw_endpoint_create_host_with_numeric_port();
      free(v41);
      goto LABEL_65;
    }

LABEL_50:
    host_with_numeric_port = 0LL;
LABEL_51:
    v43 = 0LL;
    goto LABEL_52;
  }

  if (*(_BYTE *)(a1 + 432)) {
    uint64_t address = nw_endpoint_create_host_with_numeric_port();
  }
  else {
    uint64_t address = (uint64_t)nw_endpoint_create_address((const sockaddr *)v13);
  }
  host_with_numeric_port = (nw_endpoint *)address;
LABEL_65:
  if (!host_with_numeric_port) {
    goto LABEL_51;
  }
  v43 = nw_connection_create(host_with_numeric_port, v11);
LABEL_52:
  nw_release(host_with_numeric_port);
  nw_release(v11);
  if (!v43)
  {
LABEL_59:
    uint64_t v34 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(receive_handler) = 0;
      uint64_t v35 = "Failed to create bridged connection, rejecting flow";
      goto LABEL_61;
    }

    goto LABEL_2;
  }

  *(void *)(a1 + 408) = v43;
  if (!*(void *)(a1 + 136))
  {
    CFDictionaryRef v44 = *(dispatch_object_s **)(a2 + 16);
    *(void *)(a1 + 136) = v44;
    dispatch_retain(v44);
  }

  nw_connection_set_queue(v43, *(dispatch_queue_t *)(a2 + 16));
  receive_uint64_t handler = 0LL;
  uint64_t v52 = (uint64_t)&receive_handler;
  uint64_t v53 = 0x2000000000LL;
  CFTypeRef v54 = CFRetain((CFTypeRef)a1);
  *(void *)state_changed_uint64_t handler = MEMORY[0x1895F87A8];
  *(void *)&state_changed_handler[8] = 0x40000000LL;
  *(void *)&state_changed_handler[16] = __flow_setup_bridged_connection_block_invoke;
  unsigned int v58 = &unk_18A06DAA8;
  size_t v59 = &receive_handler;
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  nw_connection_set_state_changed_handler(v43, state_changed_handler);
  nw_connection_start(v43);
  unsigned int v33 = &receive_handler;
LABEL_56:
  _Block_object_dispose(v33, 8);
  if (*(_BYTE *)(a2 + 121))
  {
    if (!*(void *)(a1 + 128)) {
      *(void *)(a1 + 128) = os_transaction_create();
    }
  }

        uint64_t v1 = (void *)g_uuid_cache;
        if (!g_uuid_cache) {
          return v1;
        }
LABEL_51:
        xpc_retain(v1);
        return v1;
      }

      uint64_t v15 = v14;
      if (fstat(v14, &v47))
      {
        unsigned int v16 = *__error();
        int v17 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t v53 = 136315650;
          *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 1024;
          *(_DWORD *)&v53[14] = v16;
          *(_WORD *)&v53[18] = 2080;
          *(void *)&v53[20] = buf;
          _os_log_fault_impl(&dword_187528000, v17, OS_LOG_TYPE_FAULT, "Failed to fstat %s: [%d] %s", v53, 0x1Cu);
        }

        goto LABEL_49;
      }

      st_size_t size = v47.st_size;
      if ((unint64_t)(v47.st_size - 131073) <= 0xFFFFFFFFFFFDFFFFLL)
      {
        int v24 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = st_size;
          uint64_t v25 = "%s size is 0 or is too big: %lu";
          int v26 = v24;
          uint64_t v27 = 22;
LABEL_67:
          _os_log_error_impl(&dword_187528000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
          goto LABEL_49;
        }

        goto LABEL_49;
      }

      unsigned int v28 = malloc(v47.st_size);
      if (!v28)
      {
        unsigned int v33 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = st_size;
          uint64_t v25 = "Failed to allocate %lu bytes";
          int v26 = v33;
          uint64_t v27 = 12;
          goto LABEL_67;
        }

void flow_director_handle_connect_result(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v23 = 0LL;
  memset(length, 0, sizeof(length));
  if (a3 >= 5)
  {
    for (unint64_t i = a3; i > 4; i -= v11)
    {
      int v8 = *a4;
      unsigned int v9 = *(_DWORD *)(a4 + 1);
      uint64_t v10 = bswap32(v9);
      if (v9)
      {
        uint64_t v11 = v10 + 5;
        if (v10 + 5 > i) {
          break;
        }
      }

      else
      {
        uint64_t v11 = 5LL;
      }

      if (v8 == 9)
      {
        __memcpy_chk();
        HIDWORD(v23) = bswap32(HIDWORD(v23));
      }

      else if (v8 == 11 && v10 <= 0x1C)
      {
        __memcpy_chk();
      }

      a4 += v11;
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 120));
  uint32_t v13 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v21 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)buf = 67109376;
    int v25 = v21;
    __int16 v26 = 1024;
    LODWORD(v27) = HIDWORD(v23);
    _os_log_debug_impl( &dword_187528000,  v13,  OS_LOG_TYPE_DEBUG,  "(%u): Got a connect result with window size %u",  buf,  0xEu);
  }

  if ((*(_BYTE *)(a2 + 100) & 3) != 0)
  {
    int v14 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109378;
      int v25 = v15;
      __int16 v26 = 2080;
      uint64_t v27 = "Flow is closed, sending close while handling connect result";
      _os_log_impl(&dword_187528000, v14, OS_LOG_TYPE_DEFAULT, "(%u): %s", buf, 0x12u);
    }

    unsigned int v16 = *(_DWORD *)(a2 + 24);
    unsigned int v17 = flow_error_to_errno(*(void *)(a2 + 32));
    flow_director_send_close(a1, v16, v17, 2u, *(_DWORD *)(a2 + 100) & 4);
    goto LABEL_22;
  }

  if (*(_DWORD *)(a2 + 104))
  {
LABEL_22:
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 120));
    return;
  }

  int v18 = HIDWORD(v23);
  if (!HIDWORD(v23))
  {
    flow_read_close(a2, 0);
    flow_write_close(a2, 0);
    flow_drop_director((void *)a2);
    goto LABEL_22;
  }

  *(_DWORD *)(a2 + 104) = HIDWORD(v23);
  *(_DWORD *)(a2 + 288) = v18;
  if (BYTE1(length[0]))
  {
    CFDataRef v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)length, LOBYTE(length[0]));
    uint64_t v20 = *(const void **)(a2 + 56);
    if (v20) {
      CFRelease(v20);
    }
    *(void *)(a2 + 56) = v19;
  }

  flow_notify_client((void *)a2, 5LL);
  os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 120));
  flow_director_handle_read_notification((os_unfair_lock_s *)a2);
}

void flow_director_handle_data(uint64_t a1, uint64_t a2, size_t a3, unsigned __int8 *a4)
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  int v8 = (os_unfair_lock_s *)(a2 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 120));
  if ((*(_BYTE *)(a2 + 100) & 2) != 0)
  {
    int v18 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "received bytes, but flow is closed";
      _os_log_impl(&dword_187528000, v18, OS_LOG_TYPE_DEFAULT, "(%u): %s", buf, 0x12u);
    }

    goto LABEL_70;
  }

  uint64_t v9 = *(void *)(a2 + 16);
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      uint64_t v10 = dispatch_data_create(a4, a3, *(dispatch_queue_t *)(a1 + 16), 0LL);
      *(void *)(a2 + 232) += dispatch_data_get_size(v10);
      uint64_t v11 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v60 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = dispatch_data_get_size(v10);
        _os_log_debug_impl( &dword_187528000,  v11,  OS_LOG_TYPE_DEBUG,  "(%u): received %zu tcp bytes from app",  buf,  0x12u);
      }

      int v12 = *(dispatch_data_s **)(a2 + 112);
      if (dispatch_data_get_size(v12))
      {
        dispatch_data_t concat = dispatch_data_create_concat(v12, v10);
        dispatch_release(*(dispatch_object_t *)(a2 + 112));
        dispatch_release(v10);
        uint64_t v10 = concat;
      }

      *(void *)(a2 + 112) = v10;
      if (*(void *)(a2 + 408))
      {
        if (v10 && dispatch_data_get_size(v10))
        {
          *(void *)(a2 + 112) = MEMORY[0x1895F8AA8];
          size_t size = dispatch_data_get_size(v10);
          CFTypeRef v15 = CFRetain((CFTypeRef)a2);
          unsigned int v16 = *(nw_connection **)(a2 + 408);
          unsigned int v17 = (nw_content_context *)*MEMORY[0x189608E88];
          completion[0] = MEMORY[0x1895F87A8];
          completion[1] = 0x40000000LL;
          completion[2] = __flow_director_handle_data_block_invoke;
          completion[3] = &__block_descriptor_tmp_132;
          completion[4] = a2;
          completion[5] = size;
          completion[6] = v15;
          nw_connection_send(v16, v10, v17, 1, completion);
          dispatch_release(v10);
        }
      }

      else
      {
        flow_call_stream_read_handler(a2, 0LL);
      }
    }

    goto LABEL_70;
  }

  uint64_t v20 = 0LL;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v67 = 0LL;
  unsigned __int8 v66 = 0;
  buf[1] = 0;
  if (a3 < 5) {
    goto LABEL_15;
  }
  uint64_t v20 = 0LL;
  unint64_t v32 = a3;
  unsigned int v33 = a4;
  while (1)
  {
    int v34 = *v33;
    unsigned int v35 = *(_DWORD *)(v33 + 1);
    uint64_t v36 = bswap32(v35);
    if (v35)
    {
      uint64_t v37 = v36 + 5;
      if (v36 + 5 > v32) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v37 = 5LL;
    }

    if (*v33 > 0x1Au) {
      break;
    }
    if (v34 == 22)
    {
      goto LABEL_34;
    }

    if (v34 == 23)
    {
      goto LABEL_34;
    }

LABEL_35:
    v33 += v37;
    v32 -= v37;
    if (v32 <= 4) {
      goto LABEL_15;
    }
  }

  if (v34 == 27)
  {
    if (v36 <= 1) {
LABEL_33:
    }
      __memcpy_chk();
LABEL_34:
    v20 += v36 + 5;
    goto LABEL_35;
  }

  if (v34 != 37) {
    goto LABEL_35;
  }
  v20 += v36 + 5;
LABEL_15:
  size_t v21 = a3 - v20;
  unint64_t v22 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v61 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)CFTypeID v69 = 67109888;
    int v70 = v61;
    __int16 v71 = 2048;
    BOOL v72 = (const char *)v21;
    __int16 v73 = 2048;
    uint64_t v74 = v67;
    __int16 v75 = 1024;
    int v76 = v66;
    _os_log_debug_impl( &dword_187528000,  v22,  OS_LOG_TYPE_DEBUG,  "(%u): received %zu datagram bytes from app, total_size_t size = %lu, is_fragment = %d",  v69,  0x22u);
  }

  uint64_t v23 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v24 = MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 152LL, 0LL);
  uint64_t v25 = v24;
  *(_OWORD *)(v24 + 96) = 0u;
  *(_OWORD *)(v24 + 112) = 0u;
  *(_OWORD *)(v24 + 64) = 0u;
  *(_OWORD *)(v24 + 80) = 0u;
  *(_OWORD *)(v24 + 32) = 0u;
  *(_OWORD *)(v24 + 48) = 0u;
  *(_OWORD *)uint64_t v24 = 0u;
  *(_OWORD *)(v24 + 16) = 0u;
  *(_OWORD *)(v24 + 128) = 0u;
  *(void *)(v24 + 144) = 0LL;
  if (buf[1])
  {
    __int128 v26 = *(_OWORD *)buf;
    __int128 v27 = *(_OWORD *)&buf[16];
    __int128 v28 = v79;
    *(_OWORD *)(v24 + 32) = v78;
    *(_OWORD *)(v24 + 48) = v28;
    *(_OWORD *)uint64_t v24 = v26;
    *(_OWORD *)(v24 + 16) = v27;
    __int128 v29 = v80;
    __int128 v30 = v81;
    __int128 v31 = v83;
    *(_OWORD *)(v24 + 96) = v82;
    *(_OWORD *)(v24 + 112) = v31;
    *(_OWORD *)(v24 + 64) = v29;
    *(_OWORD *)(v24 + 80) = v30;
  }

  else
  {
    __int128 v38 = *(const __CFData **)(a2 + 48);
    if (v38)
    {
      BytePtr = CFDataGetBytePtr(v38);
      size_t Length = CFDataGetLength(*(CFDataRef *)(a2 + 48));
      memcpy((void *)v25, BytePtr, Length);
    }
  }

  uint64_t v41 = v67;
  if (v67)
  {
    *(void *)(v25 + 128) = MEMORY[0x1895F8AA8];
    *(void *)(v25 + 136) = v41;
    if (*(void *)(a2 + 296))
    {
      __int128 v42 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        int v63 = *(_DWORD *)(a2 + 24);
        v64 = *(const char **)(*(void *)(a2 + 296) + 136LL);
        *(_DWORD *)CFTypeID v69 = 67109376;
        int v70 = v63;
        __int16 v71 = 2048;
        BOOL v72 = v64;
        _os_log_error_impl( &dword_187528000,  v42,  OS_LOG_TYPE_ERROR,  "(%u): previous fragmented datagram was never completed (%lu bytes remaining), dropping it",  v69,  0x12u);
      }

      dispatch_release(*(dispatch_object_t *)(*(void *)(a2 + 296) + 128LL));
      CFAllocatorDeallocate(v23, *(void **)(a2 + 296));
    }

    *(void *)(a2 + 296) = v25;
  }

  else
  {
    *(void *)(v25 + 128) = dispatch_data_create(&a4[v20], v21, 0LL, 0LL);
    *(void *)(v25 + 144) = 0LL;
    **(void **)(a2 + 272) = v25;
    *(void *)(a2 + 272) = v25 + 144;
    *(_DWORD *)(a2 + 280) += dispatch_data_get_size(*(dispatch_data_t *)(v25 + 128));
  }

  if (v66)
  {
    uint64_t v43 = *(void *)(a2 + 296);
    if (v43 && *(void *)(v43 + 128))
    {
      if (*(void *)(v43 + 136) >= v21)
      {
        int v57 = dispatch_data_create(&a4[v20], v21, 0LL, 0LL);
        unsigned int v58 = *(dispatch_data_s **)(v43 + 128);
        *(void *)(v43 + 128) = dispatch_data_create_concat(v58, v57);
        dispatch_release(v58);
        dispatch_release(v57);
        size_t v59 = *(void *)(v43 + 136) - v21;
        *(void *)(v43 + 136) = v59;
        if (!v59)
        {
          *(void *)(v43 + 144) = 0LL;
          **(void **)(a2 + 272) = v43;
          *(void *)(a2 + 272) = v43 + 144;
          *(_DWORD *)(a2 + 280) += dispatch_data_get_size(*(dispatch_data_t *)(v43 + 128));
          *(void *)(a2 + 296) = 0LL;
        }
      }

      else
      {
        CFDictionaryRef v44 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          int v45 = *(_DWORD *)(a2 + 24);
          uint64_t v46 = *(void *)(v43 + 136);
          *(_DWORD *)CFTypeID v69 = 67109632;
          int v70 = v45;
          __int16 v71 = 2048;
          BOOL v72 = (const char *)v21;
          __int16 v73 = 2048;
          uint64_t v74 = v46;
          uint64_t v47 = "(%u): Received a datagram fragment with more data than expected (%lu vs. %lu)";
          v48 = v44;
          uint32_t v49 = 28;
          goto LABEL_72;
        }
      }
    }

    else
    {
      CFStringRef v50 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        int v62 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)CFTypeID v69 = 67109378;
        int v70 = v62;
        __int16 v71 = 2080;
        BOOL v72 = "Received a datagram fragment but no previous datagram was found";
        uint64_t v47 = "(%u): %s";
        v48 = v50;
        uint32_t v49 = 18;
LABEL_72:
        _os_log_error_impl(&dword_187528000, v48, OS_LOG_TYPE_ERROR, v47, v69, v49);
      }
    }
  }

  unsigned int v51 = *(_DWORD *)(a2 + 280);
  if (v51)
  {
    uint64_t v52 = *(nw_connection **)(a2 + 408);
    if (v52)
    {
      v65[0] = MEMORY[0x1895F87A8];
      v65[1] = 0x40000000LL;
      v65[2] = __flow_director_handle_data_block_invoke_134;
      v65[3] = &__block_descriptor_tmp_136;
      v65[4] = a2;
      nw_connection_batch(v52, v65);
    }

    else if (*(void *)(a2 + 416))
    {
      uint64_t v53 = *(void *)(a2 + 264);
      if (v53)
      {
        CFTypeRef v54 = (nw_content_context *)*MEMORY[0x189608E88];
        do
        {
          uint64_t v55 = *(dispatch_data_s **)(v53 + 128);
          uint64_t address = nw_endpoint_create_address((const sockaddr *)v53);
          nw_connection_group_send_message( *(nw_connection_group_t *)(a2 + 416),  v55,  address,  v54,  &__block_literal_global_138);
          nw_release(address);
          uint64_t v53 = *(void *)(v53 + 144);
        }

        while (v53);
        unsigned int v51 = *(_DWORD *)(a2 + 280);
      }

      flow_director_send_read_notification(*(void *)(a2 + 40), *(_DWORD *)(a2 + 24), v51);
      flow_clear_datagram_queue(*(void **)(a2 + 264), *(void **)(a2 + 272));
      *(void *)(a2 + 264) = 0LL;
      *(void *)(a2 + 272) = a2 + 264;
    }

    else
    {
      flow_call_dgram_read_handler(a2, 0LL);
    }
  }

  CFRelease(v3);
  if (v7) {
LABEL_21:
  }
    CFRelease(v7);
LABEL_22:
  if (v10) {
    CFRelease(v10);
  }
  return v4;
}

        v169 = 0;
        int v18 = ne_filter_protocol_fulfill_frame_request( v7,  v7 + 128,  a6,  (*(_DWORD *)(v7 + 120) & 0x8000) == 0,  a4,  a5,  &v169);
        uuid_unparse((const unsigned __int8 *)v7, out);
        __int128 v40 = *(_DWORD *)(v7 + 176);
        uint64_t v41 = (os_log_s *)ne_log_obj();
        __int128 v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG);
        if (v40 == 3)
        {
          if (!v42) {
            goto LABEL_40;
          }
          if (*(void *)(v7 + 80)) {
            ip_protocol = nw_parameters_get_ip_protocol();
          }
          else {
            ip_protocol = 0;
          }
          UInt8 v101 = *(void **)(v7 + 160);
          if (v101)
          {
            v165 = v101[7];
            v166 = v101[6];
            CFDataRef v108 = v101[8];
            int v102 = v101[9];
            v167 = v108;
          }

          else
          {
            int v102 = -1LL;
            v166 = -1LL;
            v167 = -1LL;
            v165 = -1LL;
          }

          v164 = v102;
          CFDataRef v109 = *(void **)(v7 + 168);
          if (v109)
          {
            v161 = v109[7];
            v162 = v109[6];
            unsigned int v115 = v109[8];
            CFDataRef v110 = v109[9];
            v163 = v115;
          }

          else
          {
            CFDataRef v110 = -1LL;
            v162 = -1LL;
            v163 = -1LL;
            v161 = -1LL;
          }

          v160 = v110;
          v116 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136317698;
          v171 = out;
          v172 = 1024;
          v173 = ip_protocol;
          v174 = 2048;
          v175 = v166;
          v176 = 2048;
          *(void *)v177 = v165;
          *(_WORD *)&v177[8] = 2048;
          *(void *)v178 = v167;
          *(_WORD *)&v178[8] = 2048;
          v179 = v164;
          v180 = 2048;
          v181 = v162;
          v182 = 2048;
          v183 = v161;
          v184 = 2048;
          v185 = v163;
          v186 = 2048;
          v187 = v160;
          v188 = 1024;
          v189 = v116;
          CFDataRef v112 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]return arr"
                 "ay has %u bytes from acceptedInputFrames";
          CFDataRef v113 = v41;
          unsigned int v114 = 104;
        }

        else
        {
          if (!v42) {
            goto LABEL_40;
          }
          if (*(void *)(v7 + 80)) {
            uint64_t v95 = nw_parameters_get_ip_protocol();
          }
          else {
            uint64_t v95 = 0;
          }
          CFStringRef v106 = *(unsigned int *)(v7 + 176);
          else {
            CFDataRef v107 = (&off_18A06EDE8)[v106];
          }
          v168 = v107;
          v111 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136315906;
          v171 = out;
          v172 = 1024;
          v173 = v95;
          v174 = 2080;
          v175 = (uint64_t)v168;
          v176 = 1024;
          *(_DWORD *)v177 = v111;
          CFDataRef v112 = "[filter %s %d %s] return array has %u bytes from acceptedInputFrames";
          CFDataRef v113 = v41;
          unsigned int v114 = 34;
        }

        _os_log_debug_impl(&dword_187528000, v113, OS_LOG_TYPE_DEBUG, v112, buf, v114);
LABEL_40:
        if (v169)
        {
          CFDictionaryRef v44 = a4 >= v169;
          a4 = a4 - v169;
          if ((_DWORD)a4 == 0 || !v44) {
            goto LABEL_85;
          }
          else {
            int v45 = 0LL;
          }
        }

        else
        {
          int v45 = a3;
        }

        if ((_DWORD)v18)
        {
          CFDictionaryRef v44 = a5 >= v18;
          a5 = (a5 - v18);
          if ((_DWORD)a5 == 0 || !v44)
          {
LABEL_85:
            if ((*(_BYTE *)(v7 + 121) & 8) != 0 && nw_frame_array_is_empty())
            {
              do
                __int16 v75 = __ldaxr(v12);
              while (__stlxr(v75 + 1, v12));
              nw_queue_context_async();
            }

            int v76 = nw_frame_array_unclaimed_length();
            CFDataRef v77 = v76;
            __int128 v78 = (unint64_t *)(v7 + 104);
            do
              __int128 v79 = __ldaxr(v78);
            while (__stlxr(v79 + v76, v78));
            uuid_unparse((const unsigned __int8 *)v7, out);
            __int128 v80 = *(_DWORD *)(v7 + 176);
            __int128 v81 = (os_log_s *)ne_log_obj();
            __int128 v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG);
            if (v80 == 3)
            {
              if (!v82) {
                return v18;
              }
              __int128 v83 = *(void *)(v7 + 80);
              if (v83) {
                LODWORD(v83) = nw_parameters_get_ip_protocol();
              }
              uint64_t v84 = *(void **)(v7 + 160);
              if (v84)
              {
                int v86 = v84[6];
                uint64_t v87 = v84[7];
                BOOL v85 = v84[8];
                CFDataRef v88 = v84[9];
              }

              else
              {
                BOOL v85 = -1LL;
                int v86 = -1LL;
                uint64_t v87 = -1LL;
                CFDataRef v88 = -1LL;
              }

              int v117 = *(void **)(v7 + 168);
              if (v117)
              {
                v119 = v117[6];
                __int16 v120 = v117[7];
                __int16 v118 = v117[8];
                CFStringRef v121 = v117[9];
              }

              else
              {
                __int16 v118 = -1LL;
                v119 = -1LL;
                __int16 v120 = -1LL;
                CFStringRef v121 = -1LL;
              }

              v126 = atomic_load(v78);
              *(_DWORD *)buf = 136318210;
              v171 = out;
              v172 = 1024;
              v173 = v83;
              v174 = 2048;
              v175 = v86;
              v176 = 2048;
              *(void *)v177 = v87;
              *(_WORD *)&v177[8] = 2048;
              *(void *)v178 = v85;
              *(_WORD *)&v178[8] = 2048;
              v179 = v88;
              v180 = 2048;
              v181 = v119;
              v182 = 2048;
              v183 = v120;
              v184 = 2048;
              v185 = v118;
              v186 = 2048;
              v187 = v121;
              v188 = 1024;
              v189 = v77;
              v190 = 1024;
              v191 = v18;
              v192 = 2048;
              v193 = v126;
              int v123 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]INPUT:"
                     " returning %u bytes in %u framesu (total %llu)";
              __int16 v124 = v81;
              CFStringRef v125 = 120;
            }

            else
            {
              if (!v82) {
                return v18;
              }
              v89 = *(void *)(v7 + 80);
              if (v89) {
                LODWORD(v89) = nw_parameters_get_ip_protocol();
              }
              v90 = *(unsigned int *)(v7 + 176);
              else {
                v91 = (&off_18A06EDE8)[v90];
              }
              __int16 v122 = atomic_load(v78);
              *(_DWORD *)buf = 136316418;
              v171 = out;
              v172 = 1024;
              v173 = v89;
              v174 = 2080;
              v175 = (uint64_t)v91;
              v176 = 1024;
              *(_DWORD *)v177 = v77;
              *(_WORD *)&v177[4] = 1024;
              *(_DWORD *)&v177[6] = v18;
              *(_WORD *)v178 = 2048;
              *(void *)&v178[2] = v122;
              int v123 = "[filter %s %d %s] INPUT: returning %u bytes in %u framesu (total %llu)";
              __int16 v124 = v81;
              CFStringRef v125 = 50;
            }

            _os_log_debug_impl(&dword_187528000, v124, OS_LOG_TYPE_DEBUG, v123, buf, v125);
            return v18;
          }
        }

        uint64_t v46 = *(_DWORD *)(v7 + 176);
        if (v46 != 1)
        {
          if (v46 == 3)
          {
LABEL_61:
            nw_frame_array_init();
            ne_filter_read_from_network(*(void *)(a1 + 40), (uint64_t)buf, 0);
            ne_filter_read_approved_frames(v7, (uint64_t)buf);
            *(_DWORD *)uuid_string_t out = 0;
            uint64_t v55 = ne_filter_protocol_fulfill_frame_request( v7,  v7 + 128,  a6,  (*(_DWORD *)(v7 + 120) & 0x8000) == 0,  a4,  a5,  out);
            v169 += *(_DWORD *)out;
            int v18 = (v55 + v18);
            goto LABEL_73;
          }

          uint64_t v47 = *(_DWORD *)(v7 + 120);
LABEL_57:
          if ((v47 & 0x1000) == 0)
          {
            uint64_t v52 = (os_log_s *)ne_log_obj();
            if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
              return 0LL;
            }
            uint64_t v53 = *(unsigned int *)(v7 + 176);
            else {
              CFTypeRef v54 = (&off_18A06EDE8)[v53];
            }
            *(_DWORD *)buf = 136315138;
            v171 = (char *)v54;
            unsigned int v17 = "reached end of get_input_frames with disallowed verdict type %s";
            uint32_t v39 = v52;
            goto LABEL_33;
          }

          goto LABEL_61;
        }

        uint64_t v47 = *(_DWORD *)(v7 + 120);
        if ((v47 & 0x1000) != 0) {
          goto LABEL_57;
        }
        v48 = *(void *)(v7 + 32);
        *(void *)uuid_string_t out = 0LL;
        *(void *)&out[8] = out;
        *(void *)&out[16] = 0x2800000000LL;
        nw_frame_array_init();
        uint32_t v49 = *(_DWORD *)(v7 + 120) | 0x4000;
        *(_DWORD *)(v7 + 120) = v49;
        if (v48
          && (CFStringRef v50 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 + 24) + 80LL)) != 0LL)
        {
          unsigned int v51 = v50(v48, a1, v45, a4, a5, *(void *)&out[8] + 24LL);
          uint32_t v49 = *(_DWORD *)(v7 + 120);
        }

        else
        {
          unsigned int v51 = 0;
        }

        *(_DWORD *)(v7 + 120) = v49 & 0xFFFFBFFF;
        v56 = nw_frame_array_unclaimed_length();
        uuid_unparse((const unsigned __int8 *)v7, v194);
        int v57 = *(_DWORD *)(v7 + 176);
        unsigned int v58 = (os_log_s *)ne_log_obj();
        size_t v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);
        if (v57 == 3)
        {
          if (v59)
          {
            int v60 = *(void *)(v7 + 80);
            if (v60) {
              LODWORD(v60) = nw_parameters_get_ip_protocol();
            }
            int v61 = *(void **)(v7 + 160);
            if (v61)
            {
              int v63 = v61[6];
              v64 = v61[7];
              int v62 = v61[8];
              v65 = v61[9];
            }

            else
            {
              int v62 = -1LL;
              int v63 = -1LL;
              v64 = -1LL;
              v65 = -1LL;
            }

            v152 = *(void **)(v7 + 168);
            if (v152)
            {
              v154 = v152[6];
              v155 = v152[7];
              v153 = v152[8];
              v156 = v152[9];
            }

            else
            {
              v153 = -1LL;
              v154 = -1LL;
              v155 = -1LL;
              v156 = -1LL;
            }

            *(_DWORD *)buf = 136317954;
            v171 = v194;
            v172 = 1024;
            v173 = v60;
            v174 = 2048;
            v175 = v63;
            v176 = 2048;
            *(void *)v177 = v64;
            *(_WORD *)&v177[8] = 2048;
            *(void *)v178 = v62;
            *(_WORD *)&v178[8] = 2048;
            v179 = v65;
            v180 = 2048;
            v181 = v154;
            v182 = 2048;
            v183 = v155;
            v184 = 2048;
            v185 = v153;
            v186 = 2048;
            v187 = v156;
            v188 = 1024;
            v189 = v56;
            v190 = 1024;
            v191 = v51;
            v157 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]passing "
                   "through %u input bytes in %u frames";
            v158 = v58;
            v159 = 110;
            goto LABEL_175;
          }
        }

        else if (v59)
        {
          v141 = *(void *)(v7 + 80);
          if (v141) {
            LODWORD(v141) = nw_parameters_get_ip_protocol();
          }
          v142 = *(unsigned int *)(v7 + 176);
          else {
            v143 = (&off_18A06EDE8)[v142];
          }
          *(_DWORD *)buf = 136316162;
          v171 = v194;
          v172 = 1024;
          v173 = v141;
          v174 = 2080;
          v175 = (uint64_t)v143;
          v176 = 1024;
          *(_DWORD *)v177 = v56;
          *(_WORD *)&v177[4] = 1024;
          *(_DWORD *)&v177[6] = v51;
          v157 = "[filter %s %d %s] passing through %u input bytes in %u frames";
          v158 = v58;
          v159 = 40;
LABEL_175:
          _os_log_debug_impl(&dword_187528000, v158, OS_LOG_TYPE_DEBUG, v157, buf, v159);
          if (!v51) {
            goto LABEL_72;
          }
          goto LABEL_71;
        }

        if (!v51)
        {
LABEL_72:
          _Block_object_dispose(out, 8);
LABEL_73:
          if ((nw_frame_array_is_empty() & 1) == 0)
          {
            nw_frame_array_last();
            if ((nw_frame_is_metadata_complete() & 1) != 0 || (nw_frame_is_connection_complete() & 1) != 0) {
              goto LABEL_85;
            }
          }

          uuid_unparse((const unsigned __int8 *)v7, out);
          unsigned __int8 v66 = *(_DWORD *)(v7 + 176);
          uint64_t v67 = (os_log_s *)ne_log_obj();
          CFStringRef v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG);
          if (v66 == 3)
          {
            if (v68)
            {
              CFTypeID v69 = *(void *)(v7 + 80);
              if (v69) {
                LODWORD(v69) = nw_parameters_get_ip_protocol();
              }
              int v70 = *(void **)(v7 + 160);
              if (v70)
              {
                BOOL v72 = v70[6];
                __int16 v73 = v70[7];
                __int16 v71 = v70[8];
                uint64_t v74 = v70[9];
              }

              else
              {
                __int16 v71 = -1LL;
                BOOL v72 = -1LL;
                __int16 v73 = -1LL;
                uint64_t v74 = -1LL;
              }

              v144 = *(void **)(v7 + 168);
              if (v144)
              {
                v146 = v144[6];
                v147 = v144[7];
                v145 = v144[8];
                v148 = v144[9];
              }

              else
              {
                v145 = -1LL;
                v146 = -1LL;
                v147 = -1LL;
                v148 = -1LL;
              }

              *(_DWORD *)buf = 136317954;
              v171 = out;
              v172 = 1024;
              v173 = v69;
              v174 = 2048;
              v175 = v72;
              v176 = 2048;
              *(void *)v177 = v73;
              *(_WORD *)&v177[8] = 2048;
              *(void *)v178 = v71;
              *(_WORD *)&v178[8] = 2048;
              v179 = v74;
              v180 = 2048;
              v181 = v146;
              v182 = 2048;
              v183 = v147;
              v184 = 2048;
              v185 = v145;
              v186 = 2048;
              v187 = v148;
              v188 = 1024;
              v189 = v169;
              v190 = 1024;
              v191 = a3;
              v149 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]pass t"
                     "hrough failed to fulfill minimum bytes requested (%u < %u), moving all to acceptedInputFrames";
              v150 = v67;
              v151 = 110;
LABEL_167:
              _os_log_debug_impl(&dword_187528000, v150, OS_LOG_TYPE_DEBUG, v149, buf, v151);
            }
          }

          else if (v68)
          {
            __int128 v130 = *(void *)(v7 + 80);
            if (v130) {
              LODWORD(v130) = nw_parameters_get_ip_protocol();
            }
            __int128 v131 = *(unsigned int *)(v7 + 176);
            else {
              __int128 v132 = (&off_18A06EDE8)[v131];
            }
            *(_DWORD *)buf = 136316162;
            v171 = out;
            v172 = 1024;
            v173 = v130;
            v174 = 2080;
            v175 = (uint64_t)v132;
            v176 = 1024;
            *(_DWORD *)v177 = v169;
            *(_WORD *)&v177[4] = 1024;
            *(_DWORD *)&v177[6] = a3;
            v149 = "[filter %s %d %s] pass through failed to fulfill minimum bytes requested (%u < %u), moving all to acc"
                   "eptedInputFrames";
            v150 = v67;
            v151 = 40;
            goto LABEL_167;
          }

          nw_frame_array_foreach();
          int v18 = 0LL;
          v169 = 0;
          goto LABEL_85;
        }

LABEL_70:
  os_unfair_lock_unlock(v8);
}

void flow_director_handle_close(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  while (a2 >= 5)
  {
    int v4 = *a3;
    unsigned int v5 = *(_DWORD *)(a3 + 1);
    uint64_t v6 = bswap32(v5);
    if (v5)
    {
      uint64_t v7 = v6 + 5;
      if (v6 + 5 > a2) {
        return;
      }
    }

    else
    {
      uint64_t v7 = 5LL;
    }

    a3 += v7;
    a2 -= v7;
    if (v4 == 7)
    {
      __memcpy_chk();
      unsigned int v9 = bswap32(0);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
      if (!v9 || (flow_read_close(a1, 0), v9 != 1)) {
        flow_write_close(a1, 0);
      }
      int v8 = *(_DWORD *)(a1 + 100);
      if ((v8 & 3) != 0)
      {
        flow_cancel_bridged_connection(a1, 0LL);
        int v8 = *(_DWORD *)(a1 + 100);
      }

      if ((~v8 & 3) == 0 && !*(_BYTE *)(a1 + 320)) {
        flow_drop_director((void *)a1);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
      return;
    }
  }

void flow_director_handle_read_notification(os_unfair_lock_s *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  unint64_t v2 = a1 + 30;
  os_unfair_lock_lock(a1 + 30);
  unint64_t v3 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint32_t os_unfair_lock_opaque = a1[6]._os_unfair_lock_opaque;
    *(_DWORD *)buf = 67109120;
    uint32_t v7 = os_unfair_lock_opaque;
    _os_log_debug_impl(&dword_187528000, v3, OS_LOG_TYPE_DEBUG, "(%u): Received a read notification", buf, 8u);
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __flow_director_handle_read_notification_block_invoke;
  v5[3] = &__block_descriptor_tmp_140;
  v5[4] = a1;
  flow_handle_pending_write_requests((uint64_t)a1, (uint64_t)v5);
  os_unfair_lock_unlock(v2);
}

uint64_t __flow_director_handle_read_notification_block_invoke(uint64_t a1, void *__src)
{
  uint64_t v4 = flow_write_range_of_cfdata( *(void *)(a1 + 32),  *((const __CFData **)__src + 16),  *((void *)__src + 17),  *((void *)__src + 18),  (unsigned __int8 *)__src);
  if (v5 < 1)
  {
    uint64_t v8 = (void *)*((void *)__src + 19);
    if (v8) {
      flow_call_write_completion(*(void *)(a1 + 32), 0LL, v8);
    }
    return 1LL;
  }

  else
  {
    uint64_t v6 = v4;
    uint64_t result = 0LL;
    *((void *)__src + 17) = v6;
    *((void *)__src + 18) = v5;
  }

  return result;
}

void __flow_director_handle_data_block_invoke(uint64_t a1, nw_error_t error)
{
  if (error)
  {
    CFErrorRef v3 = nw_error_copy_cf_error(error);
    flow_close(*(os_unfair_lock_s **)(a1 + 32), v3, 1);
    if (v3) {
      CFRelease(v3);
    }
  }

  else
  {
    flow_director_send_read_notification( *(void *)(*(void *)(a1 + 32) + 40LL),  *(_DWORD *)(*(void *)(a1 + 32) + 24LL),  *(_DWORD *)(a1 + 40));
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __flow_director_handle_data_block_invoke_134(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 264);
  if (v3)
  {
    uint64_t v4 = (nw_content_context *)*MEMORY[0x189608E88];
    uint64_t v5 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v6 = *(dispatch_data_s **)(v3 + 128);
      CFTypeRef v7 = CFRetain(*(CFTypeRef *)(a1 + 32));
      uint64_t v8 = *(void *)(a1 + 32);
      unsigned int v9 = *(nw_connection **)(v8 + 408);
      v10[0] = v5;
      v10[1] = 0x40000000LL;
      v10[2] = __flow_director_handle_data_block_invoke_2;
      v10[3] = &__block_descriptor_tmp_135;
      v10[4] = v8;
      void v10[5] = v7;
      nw_connection_send(v9, v6, v4, 1, v10);
      uint64_t v3 = *(void *)(v3 + 144);
    }

    while (v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  flow_director_send_read_notification(*(void *)(v2 + 40), *(_DWORD *)(v2 + 24), *(_DWORD *)(v2 + 280));
  flow_clear_datagram_queue(*(void **)(*(void *)(a1 + 32) + 264LL), *(void **)(*(void *)(a1 + 32) + 272LL));
  *(void *)(*(void *)(a1 + 32) + 264LL) = 0LL;
  *(void *)(*(void *)(a1 + 32) + 272LL) = *(void *)(a1 + 32) + 264LL;
}

void __flow_director_handle_data_block_invoke_2(uint64_t a1, nw_error_t error)
{
  if (error)
  {
    CFErrorRef v3 = nw_error_copy_cf_error(error);
    flow_close(*(os_unfair_lock_s **)(a1 + 32), v3, 1);
    if (v3) {
      CFRelease(v3);
    }
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

nw_parameters *flow_create_bridged_parameters(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 == 2)
  {
    nw_parameters_t secure_udp = nw_parameters_create_secure_udp( (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EB0],  (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EA8]);
  }

  else
  {
    if (v5 != 1) {
      return 0LL;
    }
    nw_parameters_t secure_udp = nw_parameters_create_secure_tcp( (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EB0],  (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EA8]);
  }

  CFTypeRef v7 = secure_udp;
  if ((*(_BYTE *)(a1 + 344) & 8) != 0)
  {
    if (*(_DWORD *)(a1 + 400))
    {
      uint64_t v8 = (nw_interface *)nw_interface_create_with_index();
      if (v8)
      {
        unsigned int v9 = v8;
        nw_parameters_require_interface(v7, v8);
        nw_release(v9);
      }
    }
  }

  if (*(_DWORD *)(a1 + 96)) {
    nw_parameters_set_traffic_class();
  }
  *(_OWORD *)buffer = 0u;
  __int128 v14 = 0u;
  uint64_t v10 = *(const __CFData **)(a1 + 360);
  if (v10)
  {
    CFIndex Length = CFDataGetLength(v10);
    if (a3)
    {
      if (Length == 32)
      {
        v15.location = 0LL;
        v15.CFIndex length = 32LL;
        CFDataGetBytes(*(CFDataRef *)(a1 + 360), v15, buffer);
        nw_parameters_set_source_application();
      }
    }
  }

  nw_parameters_set_context();
  nw_parameters_set_indefinite();
  return v7;
}

void __flow_setup_bridged_connection_group_block_invoke(void *a1, int a2, nw_error *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 24LL)) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 120LL));
  uint64_t v6 = a1[5];
  if (!*(void *)(v6 + 416))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
LABEL_15:
    uint64_t v15 = *(void *)(a1[4] + 8LL);
    unsigned int v16 = *(const void **)(v15 + 24);
    if (v16)
    {
      CFRelease(v16);
      *(void *)(v15 + 24) = 0LL;
    }

    return;
  }

  if ((a2 - 3) >= 2)
  {
    if (a2 == 1)
    {
      flow_start_connection_waiting_timer(v6, *(dispatch_queue_s **)(a1[6] + 16LL));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120LL));
      return;
    }

    if (a2 != 2) {
      goto LABEL_23;
    }
    unsigned int port = nw_connection_group_get_port();
    uint64_t v8 = a1[5];
    os_unfair_lock_assert_owner((os_unfair_lock_t)(v8 + 120));
    unsigned int v9 = *(const __CFData **)(v8 + 48);
    if (v9)
    {
      BytePtr = CFDataGetBytePtr(v9);
      if (BytePtr)
      {
        int v11 = BytePtr[1];
        if (v11 == 30)
        {
          uint64_t v21 = 0LL;
          uint64_t v22 = 0LL;
          uint64_t v23 = 0LL;
          *(_WORD *)bytes = 7708;
          __int16 v20 = __rev16(port);
          int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFIndex v13 = 28LL;
LABEL_19:
          unsigned int v17 = CFDataCreate(v12, bytes, v13);
          NEFlowResetLocalEndpoint(a1[5], v17);
          if (v17) {
            CFRelease(v17);
          }
          goto LABEL_21;
        }

        if (v11 == 2)
        {
          LODWORD(v22) = 0;
          uint64_t v21 = 0LL;
          *(_WORD *)bytes = 528;
          __int16 v20 = __rev16(port);
          int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFIndex v13 = 16LL;
          goto LABEL_19;
        }
      }
    }

LABEL_21:
    int v18 = flow_open(a1[5]);
    uint64_t v6 = a1[5];
    if (!v18)
    {
      flow_cancel_bridged_connection(v6, 0LL);
      uint64_t v6 = a1[5];
    }

LABEL_23:
    flow_cancel_connection_waiting_timer(v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120LL));
    return;
  }

  CFErrorRef v14 = nw_error_copy_cf_error(a3);
  flow_cancel_bridged_connection(a1[5], v14);
  if (v14) {
    CFRelease(v14);
  }
  flow_cancel_connection_waiting_timer(a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120LL));
  if (a2 == 4) {
    goto LABEL_15;
  }
}

                  uint64_t v2 = v2 | 4;
                  goto LABEL_27;
                }

      if (*(void *)(v13 + 104) < *(void *)(v13 + 64) && (nw_frame_array_is_empty() & 1) == 0)
      {
        uuid_unparse((const unsigned __int8 *)a1, out);
        unsigned int v17 = *(_DWORD *)(a1 + 176);
        int v18 = (os_log_s *)ne_log_obj();
        int v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v17 == 3)
        {
          if (v19)
          {
            if (*(void *)(a1 + 80)) {
              ip_protocol = nw_parameters_get_ip_protocol();
            }
            else {
              ip_protocol = 0;
            }
            uint64_t v22 = *(void **)(a1 + 160);
            if (v22)
            {
              CFDataRef v110 = v22[7];
              CFDataRef v112 = v22[6];
              __int128 v30 = v22[8];
              uint64_t v23 = v22[9];
              unsigned int v114 = v30;
            }

            else
            {
              uint64_t v23 = -1LL;
              CFDataRef v112 = -1LL;
              unsigned int v114 = -1LL;
              CFDataRef v110 = -1LL;
            }

            CFDataRef v108 = v23;
            __int128 v31 = *(void **)(a1 + 168);
            if (v31)
            {
              unint64_t v32 = v31[7];
              unsigned int v33 = v31[9];
              CFStringRef v105 = v31[6];
              CFStringRef v106 = v31[8];
            }

            else
            {
              CFStringRef v105 = -1LL;
              CFStringRef v106 = -1LL;
              unint64_t v32 = -1LL;
              unsigned int v33 = -1LL;
            }

            int v34 = nw_frame_array_unclaimed_length();
            *(_DWORD *)buf = 136317698;
            CFStringRef v121 = out;
            __int16 v122 = 1024;
            int v123 = ip_protocol;
            __int16 v124 = 2048;
            CFStringRef v125 = v112;
            v126 = 2048;
            __int128 v127 = v110;
            __int128 v128 = 2048;
            __int128 v129 = v114;
            __int128 v130 = 2048;
            __int128 v131 = v108;
            __int128 v132 = 2048;
            v133 = v105;
            __int128 v134 = 2048;
            __int128 v135 = v32;
            __int128 v136 = 2048;
            __int128 v137 = v106;
            __int128 v138 = 2048;
            uint64_t v139 = v33;
            v140 = 1024;
            v141 = v34;
            __int128 v27 = v18;
            __int128 v28 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]have %u p"
                  "ending output bytes";
            __int128 v29 = 104;
            goto LABEL_52;
          }
        }

        else if (v19)
        {
          if (*(void *)(a1 + 80)) {
            __int16 v20 = nw_parameters_get_ip_protocol();
          }
          else {
            __int16 v20 = 0;
          }
          uint64_t v24 = *(unsigned int *)(a1 + 176);
          uint64_t v25 = "unknown";
          __int128 v26 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136315906;
          CFStringRef v121 = out;
          __int16 v122 = 1024;
          int v123 = v20;
          __int16 v124 = 2080;
          CFStringRef v125 = (uint64_t)v25;
          v126 = 1024;
          LODWORD(v127) = v26;
          __int128 v27 = v18;
          __int128 v28 = "[filter %s %d %s] have %u pending output bytes";
          __int128 v29 = 34;
LABEL_52:
          _os_log_debug_impl(&dword_187528000, v27, OS_LOG_TYPE_DEBUG, v28, buf, v29);
        }

        nw_frame_array_init();
        nw_frame_array_foreach();
        if ((nw_frame_array_is_empty() & 1) == 0) {
          nw_frame_array_prepend_array();
        }
      }

      if ((nw_frame_array_is_empty() & 1) == 0) {
        *(_DWORD *)(a1 + 120) |= 0x2000u;
      }
      CFIndex v13 = *(void *)(v13 + 152);
      if (!v13) {
        goto LABEL_66;
      }
    }

    uuid_unparse((const unsigned __int8 *)a1, out);
    CFErrorRef v14 = *(_DWORD *)(a1 + 176);
    uint64_t v15 = (os_log_s *)ne_log_obj();
    unsigned int v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14 == 3)
    {
      if (v16)
      {
        if (*(void *)(a1 + 80)) {
          v116 = nw_parameters_get_ip_protocol();
        }
        else {
          v116 = 0;
        }
        unsigned int v35 = *(void **)(a1 + 160);
        if (v35)
        {
          v111 = v35[7];
          CFDataRef v113 = v35[6];
          uint64_t v43 = v35[8];
          uint64_t v36 = v35[9];
          unsigned int v115 = v43;
        }

        else
        {
          uint64_t v36 = -1LL;
          CFDataRef v113 = -1LL;
          unsigned int v115 = -1LL;
          v111 = -1LL;
        }

        CFDataRef v109 = v36;
        CFDictionaryRef v44 = *(void **)(a1 + 168);
        if (v44)
        {
          int v45 = v44[6];
          uint64_t v46 = v44[7];
          uint64_t v47 = v44[9];
          CFDataRef v107 = v44[8];
        }

        else
        {
          CFDataRef v107 = -1LL;
          int v45 = -1LL;
          uint64_t v46 = -1LL;
          uint64_t v47 = -1LL;
        }

        v48 = nw_frame_array_unclaimed_length();
        *(_DWORD *)buf = 136317698;
        CFStringRef v121 = out;
        __int16 v122 = 1024;
        int v123 = v116;
        __int16 v124 = 2048;
        CFStringRef v125 = v113;
        v126 = 2048;
        __int128 v127 = v111;
        __int128 v128 = 2048;
        __int128 v129 = v115;
        __int128 v130 = 2048;
        __int128 v131 = v109;
        __int128 v132 = 2048;
        v133 = v45;
        __int128 v134 = 2048;
        __int128 v135 = v46;
        __int128 v136 = 2048;
        __int128 v137 = v107;
        __int128 v138 = 2048;
        uint64_t v139 = v47;
        v140 = 1024;
        v141 = v48;
        __int128 v40 = v15;
        uint64_t v41 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending %u by"
              "tes to the next filter";
        __int128 v42 = 104;
LABEL_65:
        _os_log_debug_impl(&dword_187528000, v40, OS_LOG_TYPE_DEBUG, v41, buf, v42);
      }
    }

    else if (v16)
    {
      if (*(void *)(a1 + 80)) {
        uint64_t v21 = nw_parameters_get_ip_protocol();
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v37 = *(unsigned int *)(a1 + 176);
      __int128 v38 = "unknown";
      uint32_t v39 = nw_frame_array_unclaimed_length();
      *(_DWORD *)buf = 136315906;
      CFStringRef v121 = out;
      __int16 v122 = 1024;
      int v123 = v21;
      __int16 v124 = 2080;
      CFStringRef v125 = (uint64_t)v38;
      v126 = 1024;
      LODWORD(v127) = v39;
      __int128 v40 = v15;
      uint64_t v41 = "[filter %s %d %s] sending %u bytes to the next filter";
      __int128 v42 = 34;
      goto LABEL_65;
    }

    nw_frame_array_append_array();
    goto LABEL_20;
  }

void __flow_bridge_read_data_from_connection_group_block_invoke( uint64_t a1, const void *a2, nw_content_context *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v6 + 100) & 1) != 0 || !*(void *)(v6 + 416))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
    return;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
  if (!a2) {
    return;
  }
  if (!a3) {
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 432))
  {
    unsigned int v9 = nw_connection_group_copy_remote_endpoint_for_message(*(nw_connection_group_t *)(a1 + 40), a3);
    a3 = v9;
    if (v9 && nw_endpoint_get_type(v9) == nw_endpoint_type_address)
    {
      uint64_t address = (sockaddr *)nw_endpoint_get_address(a3);
      goto LABEL_12;
    }

void __flow_setup_bridged_connection_block_invoke(void *a1, int a2, nw_error *a3)
{
  if (!*(void *)(*(void *)(a1[4] + 8LL) + 24LL)) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 120LL));
  uint64_t v6 = a1[5];
  if (!*(void *)(v6 + 408))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
LABEL_21:
    uint64_t v18 = *(void *)(a1[4] + 8LL);
    int v19 = *(const void **)(v18 + 24);
    if (v19)
    {
      CFRelease(v19);
      *(void *)(v18 + 24) = 0LL;
    }

    return;
  }

  if ((a2 - 4) >= 2)
  {
    if (a2 == 1)
    {
      flow_start_connection_waiting_timer(v6, *(dispatch_queue_s **)(a1[6] + 16LL));
    }

    else
    {
      if (a2 == 3)
      {
        uint64_t v7 = (nw_endpoint *)nw_connection_copy_connected_local_endpoint();
        if (v7)
        {
          uint64_t v8 = v7;
          if (nw_endpoint_get_type(v7) == nw_endpoint_type_address)
          {
            uint64_t address = nw_endpoint_get_address(v8);
            uint64_t v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], &address->sa_len, address->sa_len);
            NEFlowResetLocalEndpoint(a1[5], v10);
            if (v10) {
              CFRelease(v10);
            }
          }

          nw_release(v8);
        }

        uint64_t v11 = nw_connection_copy_connected_path();
        if (v11)
        {
          int v12 = (void *)v11;
          int interface_index = nw_path_get_interface_index();
          if (interface_index)
          {
            uint64_t v14 = a1[5];
            *(_DWORD *)(v14 + 400) = interface_index;
            flow_director_send_properties_update(*(void *)(v14 + 40), *(_DWORD *)(v14 + 24), interface_index, 0LL);
          }

          nw_release(v12);
        }

        int v15 = flow_open(a1[5]);
        uint64_t v16 = a1[5];
        if (v15) {
          flow_bridge_read_data_from_connection(v16);
        }
        else {
          flow_cancel_bridged_connection(v16, 0LL);
        }
      }

      flow_cancel_connection_waiting_timer(a1[5]);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120LL));
    return;
  }

  CFErrorRef v17 = nw_error_copy_cf_error(a3);
  flow_cancel_bridged_connection(a1[5], v17);
  if (v17) {
    CFRelease(v17);
  }
  flow_cancel_connection_waiting_timer(a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120LL));
  if (a2 == 5) {
    goto LABEL_21;
  }
}

void __flow_startup_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 136);
  if (v3)
  {
    (*(void (**)(uint64_t, void, void, void, void, void))(v3 + 16))( v3,  *(unsigned int *)(a1 + 72),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  }

  else
  {
    int v4 = *(_DWORD *)(a1 + 72);
    uint64_t v5 = *(dispatch_queue_s **)(v2 + 16);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __NEFlowDirectorHandleMatchRulesResult_block_invoke;
    block[3] = &__block_descriptor_tmp_83;
    int v10 = v4;
    block[4] = v2;
    void block[5] = 0LL;
    dispatch_async(v5, block);
  }

  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  uint64_t v6 = *(const void **)(a1 + 40);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = *(const void **)(a1 + 56);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = *(const void **)(a1 + 64);
  if (v8) {
    CFRelease(v8);
  }
}

void __flow_startup_block_invoke_154(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 144LL);
  uint64_t v3 = (os_log_s *)ne_log_obj();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v11 = *(_DWORD *)(*(void *)(a1 + 40) + 24LL);
      *(_DWORD *)buf = 67109378;
      int v15 = v11;
      __int16 v16 = 2080;
      CFErrorRef v17 = "Delivering to client";
      _os_log_debug_impl(&dword_187528000, v4, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
    }

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(v9 + 144);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    void v13[2] = __flow_startup_block_invoke_156;
    v13[3] = &__block_descriptor_tmp_159;
    v13[4] = v9;
    v13[5] = v8;
    (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v8, v13, v5, v6, v7);
  }

  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v12 = *(_DWORD *)(*(void *)(a1 + 40) + 24LL);
      *(_DWORD *)buf = 67109378;
      int v15 = v12;
      __int16 v16 = 2080;
      CFErrorRef v17 = "No new flow callback registered, dropping the flow";
      _os_log_error_impl(&dword_187528000, v4, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 120LL));
    flow_startup(*(void *)(a1 + 40), *(void *)(a1 + 32), 1LL);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 120LL));
    CFRelease(*(CFTypeRef *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  }

void __flow_startup_block_invoke_156(int8x16_t *a1, char a2)
{
  block[1] = 0x40000000LL;
  int8x16_t v3 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v4 = a1[2].i64[0];
  block[0] = MEMORY[0x1895F87A8];
  uint64_t v5 = *(dispatch_queue_s **)(v4 + 16);
  block[2] = __flow_startup_block_invoke_2;
  block[3] = &__block_descriptor_tmp_157;
  char v8 = a2;
  int8x16_t v7 = v3;
  dispatch_async(v5, block);
  dispatch_release(*(dispatch_object_t *)(a1[2].i64[0] + 16));
}

void __flow_startup_block_invoke_2(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
    flow_startup(*(void *)(a1 + 32), *(void *)(a1 + 40), 1LL);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __NEFlowDirectorHandleMatchRulesResult_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  node = (os_unfair_lock_s *)rb_tree_find_node((rb_tree_t *)(*(void *)(a1 + 32) + 56LL), (const void *)(a1 + 48));
  if (node)
  {
    int8x16_t v3 = node;
    uint64_t v4 = node + 30;
    os_unfair_lock_lock(node + 30);
    uint64_t v5 = *(const void **)(a1 + 40);
    if (!v5)
    {
      int v11 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint32_t os_unfair_lock_opaque = v3[6]._os_unfair_lock_opaque;
        v17[0] = 67109378;
        v17[1] = os_unfair_lock_opaque;
        __int16 v18 = 2080;
        int v19 = "Failed validation, aborting";
        _os_log_error_impl(&dword_187528000, v11, OS_LOG_TYPE_ERROR, "(%u): %s", (uint8_t *)v17, 0x12u);
      }

      goto LABEL_22;
    }

    *(void *)&v3[18]._uint32_t os_unfair_lock_opaque = CFRetain(v5);
    uint64_t v6 = *(const __CFString **)&v3[92]._os_unfair_lock_opaque;
    if (v6)
    {
      if (CFStringCompare(v6, *(CFStringRef *)(a1 + 40), 0LL) == kCFCompareEqualTo)
      {
        CFIndex v13 = *(const void **)&v3[20]._os_unfair_lock_opaque;
        if (v13) {
          CFRelease(v13);
        }
        *(void *)&v3[20]._uint32_t os_unfair_lock_opaque = *(void *)&v3[92]._os_unfair_lock_opaque;
        *(void *)&v3[92]._uint32_t os_unfair_lock_opaque = 0LL;
        uint64_t v14 = *(const void **)&v3[22]._os_unfair_lock_opaque;
        if (v14) {
          CFRelease(v14);
        }
        *(void *)&v3[22]._uint32_t os_unfair_lock_opaque = *(void *)&v3[94]._os_unfair_lock_opaque;
        *(void *)&v3[94]._uint32_t os_unfair_lock_opaque = 0LL;
        int v15 = *(const void **)&v3[90]._os_unfair_lock_opaque;
        if (v15) {
          CFRelease(v15);
        }
        uint64_t v10 = v3 + 96;
        *(void *)&v3[90]._uint32_t os_unfair_lock_opaque = *(void *)&v3[96]._os_unfair_lock_opaque;
        goto LABEL_20;
      }

      int8x16_t v7 = *(const void **)&v3[92]._os_unfair_lock_opaque;
      if (v7)
      {
        CFRelease(v7);
        *(void *)&v3[92]._uint32_t os_unfair_lock_opaque = 0LL;
      }
    }

    char v8 = *(const void **)&v3[94]._os_unfair_lock_opaque;
    if (v8)
    {
      CFRelease(v8);
      *(void *)&v3[94]._uint32_t os_unfair_lock_opaque = 0LL;
    }

    uint64_t v9 = *(const void **)&v3[96]._os_unfair_lock_opaque;
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v10 = v3 + 96;
    CFRelease(v9);
LABEL_20:
    *(void *)&v10->_uint32_t os_unfair_lock_opaque = 0LL;
LABEL_21:
    v3[25]._os_unfair_lock_opaque |= 0x20u;
LABEL_22:
    flow_startup(v3, *(void *)(a1 + 32), (v3[25]._os_unfair_lock_opaque & 0x20) == 0);
    os_unfair_lock_unlock(v4);
    __int16 v16 = *(const void **)(a1 + 40);
    if (v16) {
      CFRelease(v16);
    }
  }

void flow_bridge_read_data_from_connection(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 100) & 1) == 0)
    {
      uint64_t v2 = *(nw_connection **)(a1 + 408);
      if (v2)
      {
        CFTypeRef v3 = CFRetain((CFTypeRef)a1);
        v5[0] = MEMORY[0x1895F87A8];
        v5[1] = 0x40000000LL;
        v5[2] = __flow_bridge_read_data_from_connection_block_invoke;
        v5[3] = &__block_descriptor_tmp_176;
        v5[4] = a1;
        void v5[5] = v3;
        nw_connection_receive(v2, 0, 0xFFFFFFFF, v5);
      }
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      int8x16_t v7 = "flow_bridge_read_data_from_connection";
      _os_log_fault_impl(&dword_187528000, v4, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
    }
  }

void flow_start_connection_waiting_timer(uint64_t a1, dispatch_queue_s *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 120));
  if (!*(void *)(a1 + 424) && (*(void *)(a1 + 408) || *(void *)(a1 + 416)))
  {
    uint64_t v4 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, a2);
    dispatch_time_t v5 = dispatch_time(0LL, 15000000000LL);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    uint64_t v6 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __flow_start_connection_waiting_timer_block_invoke;
    handler[3] = &__block_descriptor_tmp_164;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x2000000000LL;
    v10[3] = CFRetain((CFTypeRef)a1);
    v9[0] = v6;
    v9[1] = 0x40000000LL;
    v9[2] = __flow_start_connection_waiting_timer_block_invoke_165;
    v9[3] = &unk_18A06DA40;
    v9[4] = v10;
    dispatch_source_set_cancel_handler(v4, v9);
    dispatch_activate(v4);
    *(void *)(a1 + 424) = v4;
    int8x16_t v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109120;
      int v13 = v8;
      _os_log_debug_impl(&dword_187528000, v7, OS_LOG_TYPE_DEBUG, "(%u): Starting waiting timer", buf, 8u);
    }

    _Block_object_dispose(v10, 8);
  }

void __flow_start_connection_waiting_timer_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 424LL);
  CFTypeRef v3 = (os_log_s *)ne_log_obj();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 24LL);
      int v7 = 67109120;
      int v8 = v5;
      _os_log_debug_impl( &dword_187528000,  v3,  OS_LOG_TYPE_DEBUG,  "(%u): Waiting timer fired, cancelling flow",  (uint8_t *)&v7,  8u);
    }

    flow_cancel_bridged_connection(*(void *)(a1 + 32), 0LL);
  }

  else if (v4)
  {
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 24LL);
    int v7 = 67109120;
    int v8 = v6;
    _os_log_debug_impl( &dword_187528000,  v3,  OS_LOG_TYPE_DEBUG,  "(%u): Waiting timer fired, ignoring stale event",  (uint8_t *)&v7,  8u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
}

void __flow_start_connection_waiting_timer_block_invoke_165(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v2 = *(const void **)(v1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(v1 + 24) = 0LL;
  }

void __flow_bridge_read_data_from_connection_block_invoke( uint64_t a1, const void *a2, int a3, char a4, nw_error_t error)
{
  if (a2)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 16) == 2LL)
    {
      if (!*(_BYTE *)(v9 + 432))
      {
        int v15 = nw_connection_copy_endpoint(*(nw_connection_t *)(v9 + 408));
        int v11 = v15;
        else {
          uint64_t address = 0LL;
        }
        goto LABEL_7;
      }

      uint64_t address = (sockaddr *)CFDataGetBytePtr(*(CFDataRef *)(v9 + 48));
    }

    else
    {
      uint64_t address = 0LL;
    }

    int v11 = 0LL;
LABEL_7:
    int v12 = *(os_unfair_lock_s **)(a1 + 32);
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 0x40000000LL;
    v16[2] = __flow_bridge_read_data_from_connection_block_invoke_2;
    v16[3] = &__block_descriptor_tmp_174;
    v16[4] = v12;
    NEFlowWrite(v12, a2, &address->sa_len, v16);
    nw_release(v11);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (*(void *)(v13 + 16) == 1LL)
  {
    if (!error && (a4 & 1) == 0) {
      goto LABEL_16;
    }
    if (!error)
    {
      flow_close((os_unfair_lock_s *)v13, 0LL, 0);
      goto LABEL_16;
    }
  }

  else if (!error)
  {
    goto LABEL_16;
  }

  CFErrorRef v14 = nw_error_copy_cf_error(error);
  flow_close(*(os_unfair_lock_s **)(a1 + 32), v14, 0);
  if (v14) {
    CFRelease(v14);
  }
LABEL_16:
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __flow_bridge_read_data_from_connection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    flow_cancel_bridged_connection(v4, 0LL);
  }
  else {
    flow_bridge_read_data_from_connection(v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
}

void __flow_bridge_read_data_from_connection_group_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    flow_cancel_bridged_connection(*(void *)(a1 + 32), 0LL);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120LL));
}

uint64_t flow_divert_compare_flows(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = bswap32(*(_DWORD *)(a2 + 24));
  unsigned int v4 = bswap32(*(_DWORD *)(a3 + 24));
  BOOL v5 = v3 >= v4;
  BOOL v6 = v3 > v4;
  int v7 = !v5;
  return (v6 - v7);
}

uint64_t flow_divert_compare_id(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v3 = bswap32(*(_DWORD *)(a2 + 24));
  unsigned int v4 = bswap32(*a3);
  BOOL v5 = v3 >= v4;
  BOOL v6 = v3 > v4;
  int v7 = !v5;
  return (v6 - v7);
}

double __NEFlowDirectorCreateInternal_block_invoke()
{
  qword_18C6D7860 = 0LL;
  double result = 0.0;
  xmmword_18C6D7840 = 0u;
  unk_18C6D7850 = 0u;
  xmmword_18C6D7820 = 0u;
  unk_18C6D7830 = 0u;
  xmmword_18C6D7800 = 0u;
  unk_18C6D7810 = 0u;
  xmmword_18C6D77E0 = 0u;
  unk_18C6D77F0 = 0u;
  xmmword_18C6D77C0 = 0u;
  unk_18C6D77D0 = 0u;
  xmmword_18C6D77A0 = 0u;
  unk_18C6D77B0 = 0u;
  xmmword_18C6D7780 = 0u;
  unk_18C6D7790 = 0u;
  xmmword_18C6D7760 = 0u;
  unk_18C6D7770 = 0u;
  xmmword_18C6D7740 = 0u;
  unk_18C6D7750 = 0u;
  xmmword_18C6D7720 = 0u;
  unk_18C6D7730 = 0u;
  xmmword_18C6D7700 = 0u;
  unk_18C6D7710 = 0u;
  xmmword_18C6D76E0 = 0u;
  unk_18C6D76F0 = 0u;
  unk_18C6D76C0 = 0u;
  unk_18C6D76D0 = 0u;
  nil_flow = 0u;
  byte_18C6D771C = 5;
  return result;
}

uint64_t NEFlowDirectorCreate(int a1, dispatch_object_s *a2)
{
  return NEFlowDirectorCreateInternal(a1, a2, 0LL);
}

uint64_t NEFlowDirectorCreateBridge(int a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t Internal = NEFlowDirectorCreateInternal(a1, 0LL, a2);
    if (Internal)
    {
      arc4random_buf(__buf, 0x100uLL);
      int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      BOOL v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      BOOL v6 = (char *)MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 284LL, 0LL);
      int v7 = v6;
      *BOOL v6 = 6;
      *((_DWORD *)v6 + 1) = 0;
      v6[8] = 17;
      *(_DWORD *)(v6 + 9) = 0x10000;
      __int128 v8 = __buf[2];
      __int128 v9 = __buf[3];
      __int128 v10 = __buf[1];
      *(_OWORD *)(v6 + 13) = __buf[0];
      *(_OWORD *)(v6 + 61) = v9;
      *(_OWORD *)(v6 + 45) = v8;
      *(_OWORD *)(v6 + 29) = v10;
      __int128 v11 = __buf[6];
      __int128 v12 = __buf[7];
      __int128 v13 = __buf[5];
      *(_OWORD *)(v6 + 77) = __buf[4];
      *(_OWORD *)(v6 + 125) = v12;
      *(_OWORD *)(v6 + 109) = v11;
      *(_OWORD *)(v6 + 93) = v13;
      __int128 v14 = __buf[10];
      __int128 v15 = __buf[11];
      __int128 v16 = __buf[9];
      *(_OWORD *)(v6 + 141) = __buf[8];
      *(_OWORD *)(v6 + 189) = v15;
      *(_OWORD *)(v6 + 173) = v14;
      *(_OWORD *)(v6 + 157) = v16;
      __int128 v17 = __buf[14];
      __int128 v18 = __buf[15];
      __int128 v19 = __buf[13];
      *(_OWORD *)(v6 + 205) = __buf[12];
      *(_OWORD *)(v6 + 253) = v18;
      *(_OWORD *)(v6 + 237) = v17;
      *(_OWORD *)(v6 + 221) = v19;
      if (is_debug_logging_enabled) {
        char v20 = 7;
      }
      else {
        char v20 = 5;
      }
      v6[269] = 20;
      *(_DWORD *)(v6 + 270) = 0x1000000;
      v6[274] = v20;
      v6[275] = 29;
      *(void *)(v6 + 276) = 0x104000000LL;
      ssize_t v21 = send(a1, v6, 0x11CuLL, 0);
      CFAllocatorDeallocate(v5, v7);
      if (v21 < 0)
      {
        uint64_t v22 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = __error();
          uint64_t v25 = strerror(*v24);
          int v27 = 136315138;
          __int128 v28 = v25;
          _os_log_error_impl( &dword_187528000,  v22,  OS_LOG_TYPE_ERROR,  "Failed to send the FLOW_DIVERT_PKT_GROUP_INIT message: %s",  (uint8_t *)&v27,  0xCu);
        }
      }
    }
  }

  else
  {
    __int128 v26 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      LODWORD(__buf[0]) = 136315138;
      *(void *)((char *)__buf + 4) = "NEFlowDirectorCreateBridge";
      _os_log_fault_impl( &dword_187528000,  v26,  OS_LOG_TYPE_FAULT,  "%s called with null context",  (uint8_t *)__buf,  0xCu);
    }

    return 0LL;
  }

  return Internal;
}

void NEFlowDirectorAllowProcessDelegation(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    *(_BYTE *)(a1 + 121) = 1;
  }

  else
  {
    uint64_t v1 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      int v2 = 136315138;
      unsigned int v3 = "NEFlowDirectorAllowProcessDelegation";
      _os_log_fault_impl(&dword_187528000, v1, OS_LOG_TYPE_FAULT, "%s called with null director", (uint8_t *)&v2, 0xCu);
    }
  }

void NEFlowDirectorRedirectDNSToLoopback(uint64_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    *(_BYTE *)(a1 + 122) = a2;
  }

  else
  {
    int v2 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "NEFlowDirectorRedirectDNSToLoopback";
      _os_log_fault_impl(&dword_187528000, v2, OS_LOG_TYPE_FAULT, "%s called with null director", (uint8_t *)&v3, 0xCu);
    }
  }

void NEFlowDirectorStart(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __NEFlowDirectorStart_block_invoke;
    block[3] = &__block_descriptor_tmp_75;
    void block[4] = a1;
    dispatch_async(v1, block);
  }

void __NEFlowDirectorStart_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24LL))
  {
    flow_director_ctl_source_do_read();
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  }

void NEFlowDirectorDestroy(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    int v7 = dword_18C6D76C8;
    __int16 v8 = 2080;
    __int128 v9 = "Destroying flow director";
    _os_log_debug_impl(&dword_187528000, v4, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
  }

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __NEFlowDirectorDestroy_block_invoke;
  v5[3] = &unk_18A06D5C8;
  v5[4] = a2;
  void v5[5] = a1;
  flow_director_abort(a1, (uint64_t)v5);
}

void __NEFlowDirectorDestroy_block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  int v3 = (const void *)v2[16];
  if (v3)
  {
    _Block_release(v3);
    int v2 = *(void **)(a1 + 40);
  }

  uint64_t v4 = (const void *)v2[17];
  if (v4)
  {
    _Block_release(v4);
    int v2 = *(void **)(a1 + 40);
  }

  uint64_t v5 = (const void *)v2[18];
  if (v5)
  {
    _Block_release(v5);
    int v2 = *(void **)(a1 + 40);
  }

  BOOL v6 = (const void *)v2[19];
  if (v6)
  {
    _Block_release(v6);
    int v2 = *(void **)(a1 + 40);
  }

  *((_OWORD *)v2 + 8) = 0u;
  *((_OWORD *)v2 + 9) = 0u;
  uint64_t v7 = *(void *)(a1 + 40);
  if (!*(void *)(a1 + 32)) {
    goto LABEL_14;
  }
  __int16 v8 = *(dispatch_queue_s **)(v7 + 8);
  uint64_t v9 = MEMORY[0x1895F87A8];
  if (v8)
  {
    dispatch_retain(*(dispatch_object_t *)(v7 + 8));
    block[0] = v9;
    block[1] = 0x40000000LL;
    block[2] = __NEFlowDirectorDestroy_block_invoke_2;
    block[3] = &unk_18A06D578;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v8;
    dispatch_async(v8, block);
    uint64_t v7 = *(void *)(a1 + 40);
  }

  if (*(void *)v7)
  {
    nw_queue_context_async_if_needed();
    uint64_t v7 = *(void *)(a1 + 40);
LABEL_14:
    if (*(void *)v7)
    {
      nw_release(*(void **)v7);
      **(void **)(a1 + 40) = 0LL;
      uint64_t v7 = *(void *)(a1 + 40);
    }
  }

  uint64_t v10 = *(dispatch_object_s **)(v7 + 8);
  if (v10)
  {
    dispatch_release(v10);
    *(void *)(*(void *)(a1 + 40) + 8LL) = 0LL;
    uint64_t v7 = *(void *)(a1 + 40);
  }

  dispatch_release(*(dispatch_object_t *)(v7 + 16));
}

void __NEFlowDirectorDestroy_block_invoke_2(uint64_t a1)
{
}

uint64_t __NEFlowDirectorDestroy_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t NEFlowDirectorGetMaxSendSize(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

void NEFlowDirectorHandleNewControlSocket(uint64_t a1, int a2)
{
  int v2 = *(dispatch_queue_s **)(a1 + 16);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  _DWORD v3[2] = __NEFlowDirectorHandleNewControlSocket_block_invoke;
  v3[3] = &__block_descriptor_tmp_81;
  v3[4] = a1;
  int v4 = a2;
  dispatch_async(v2, v3);
}

os_unfair_lock_s *__NEFlowDirectorHandleNewControlSocket_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40)) {
    __assert_rtn("NEFlowDirectorHandleNewControlSocket_block_invoke", "NEFlow.c", 3866, "director->data_source == NULL");
  }
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 0x80000000) == 0)
  {
    int v20 = 0x100000;
    if (setsockopt(v3, 0xFFFF, 4097, &v20, 4u))
    {
      int v4 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      int v17 = dword_18C6D76C8;
      __int128 v18 = __error();
      __int128 v19 = strerror(*v18);
      *(_DWORD *)&v22[0].sa_len = 67109378;
      *(_DWORD *)&v22[0].sa_data[2] = v17;
      *(_WORD *)&v22[0].sa_data[6] = 2080;
      *(void *)&v22[0].sa_data[8] = v19;
      __int128 v16 = "(%u): Failed to set SO_SNDBUF on the data control socket: %s";
    }

    else
    {
      int v8 = *(_DWORD *)(a1 + 40);
      socklen_t v21 = 32;
      memset(v22, 0, sizeof(v22));
      int v9 = getpeername(v8, v22, &v21);
      int v10 = *(_DWORD *)&v22[0].sa_data[6];
      if (v9) {
        int v10 = 0;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)(v11 + 48) = v10;
      if (v10)
      {
        *(void *)(*(void *)(a1 + 32) + 40LL) = flow_director_create_io_handler(v11, *(_DWORD *)(a1 + 40));
        __int128 v12 = *(dispatch_object_s **)(*(void *)(a1 + 32) + 40LL);
        if (v12) {
          dispatch_resume(v12);
        }
        goto LABEL_6;
      }

      int v4 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        close(*(_DWORD *)(a1 + 40));
LABEL_6:
        uint64_t v1 = *(void *)(a1 + 32);
        goto LABEL_7;
      }

      int v13 = dword_18C6D76C8;
      __int128 v14 = __error();
      __int128 v15 = strerror(*v14);
      *(_DWORD *)&v22[0].sa_len = 67109378;
      *(_DWORD *)&v22[0].sa_data[2] = v13;
      *(_WORD *)&v22[0].sa_data[6] = 2080;
      *(void *)&v22[0].sa_data[8] = v15;
      __int128 v16 = "(%u): getpeername failed on the data control socket: %s";
    }

    _os_log_error_impl(&dword_187528000, v4, OS_LOG_TYPE_ERROR, v16, &v22[0].sa_len, 0x12u);
    goto LABEL_5;
  }

LABEL_7:
  double result = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(v1 + 56), 0LL, 1u);
  if (result)
  {
    BOOL v6 = result;
    do
    {
      os_unfair_lock_lock(v6 + 30);
      uint32_t os_unfair_lock_opaque = v6[25]._os_unfair_lock_opaque;
      if ((os_unfair_lock_opaque & 8) != 0)
      {
        v6[25]._uint32_t os_unfair_lock_opaque = os_unfair_lock_opaque & 0xFFFFFFF7;
        flow_startup((uint64_t)v6, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 40LL) == 0LL);
      }

      os_unfair_lock_unlock(v6 + 30);
      double result = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(*(void *)(a1 + 32) + 56LL), v6, 1u);
      BOOL v6 = result;
    }

    while (result);
  }

  return result;
}

  int v10 = 0LL;
LABEL_8:
  if (v7) {
    free(v7);
  }
  if (v9) {
    free(v9);
  }
  return v10;
}

  close(v0);
  return 0LL;
}

  int v2 = 0LL;
LABEL_8:
  ne_filter_process_verdict(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), v2, **(unsigned int **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  int v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    __int128 v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v17) = 0;
    __int128 v15 = "protocol is null";
LABEL_20:
    _os_log_impl(&dword_187528000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 2u);
    return;
  }

  int v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    __int128 v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v17) = 0;
    __int128 v15 = "filter is null";
    goto LABEL_20;
  }

  int v10 = (unsigned int *)(v9 + 180);
  do
    uint64_t v11 = __ldaxr(v10);
  while (__stlxr(v11, v10));
  if (v11)
  {
    do
    {
      __int128 v12 = __ldaxr(v10);
      int v13 = v12 - 1;
    }

    while (__stlxr(v13, v10));
    if (!v13) {
      ne_filter_protocol_destroy(*(void *)(a1 + 40));
    }
  }

  int v2 = 0LL;
LABEL_8:
  ne_filter_process_verdict(*(void *)(a1 + 40), 6LL, v2, **(unsigned int **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  int v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    __int128 v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v17) = 0;
    __int128 v15 = "protocol is null";
LABEL_20:
    _os_log_impl(&dword_187528000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 2u);
    return;
  }

  int v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    __int128 v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v17) = 0;
    __int128 v15 = "filter is null";
    goto LABEL_20;
  }

  int v10 = (unsigned int *)(v9 + 180);
  do
    uint64_t v11 = __ldaxr(v10);
  while (__stlxr(v11, v10));
  if (v11)
  {
    do
    {
      __int128 v12 = __ldaxr(v10);
      int v13 = v12 - 1;
    }

    while (__stlxr(v13, v10));
    if (!v13) {
      ne_filter_protocol_destroy(*(void *)(a1 + 40));
    }
  }

void NEFlowDirectorHandleMatchRulesResult(uint64_t a1, int a2, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  BOOL v6 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __NEFlowDirectorHandleMatchRulesResult_block_invoke;
  block[3] = &__block_descriptor_tmp_83;
  int v8 = a2;
  void block[4] = a1;
  void block[5] = cf;
  dispatch_async(v6, block);
}

void NEFlowDirectorSetDelegateInterface(uint64_t a1, int a2)
{
  int v2 = *(dispatch_queue_s **)(a1 + 16);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  _DWORD v3[2] = __NEFlowDirectorSetDelegateInterface_block_invoke;
  v3[3] = &__block_descriptor_tmp_84;
  int v4 = a2;
  v3[4] = a1;
  dispatch_async(v2, v3);
}

char *__NEFlowDirectorSetDelegateInterface_block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  double result = if_indextoname(*(_DWORD *)(a1 + 40), v3);
  if (result) {
    return (char *)flow_director_reset_default_interface_info(*(void *)(a1 + 32), v3);
  }
  return result;
}

void NEFlowDirectorSetOpenControlSocketCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    int v3 = _Block_copy(aBlock);
  }
  else {
    int v3 = 0LL;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __NEFlowDirectorSetOpenControlSocketCallback_block_invoke;
  v5[3] = &unk_18A06D650;
  v5[4] = v3;
  void v5[5] = a1;
  dispatch_async(v4, v5);
}

void __NEFlowDirectorSetOpenControlSocketCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(const void **)(v2 + 128);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }

  *(void *)(v2 + 128) = *(void *)(a1 + 32);
}

void NEFlowDirectorSetMatchRulesCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    int v3 = _Block_copy(aBlock);
  }
  else {
    int v3 = 0LL;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __NEFlowDirectorSetMatchRulesCallback_block_invoke;
  v5[3] = &unk_18A06D678;
  v5[4] = v3;
  void v5[5] = a1;
  dispatch_async(v4, v5);
}

void __NEFlowDirectorSetMatchRulesCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(const void **)(v2 + 136);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }

  *(void *)(v2 + 136) = *(void *)(a1 + 32);
}

void NEFlowDirectorSetNewFlowCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    int v3 = _Block_copy(aBlock);
  }
  else {
    int v3 = 0LL;
  }
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __NEFlowDirectorSetNewFlowCallback_block_invoke;
  v5[3] = &unk_18A06D6A0;
  v5[4] = v3;
  void v5[5] = a1;
  dispatch_async(v4, v5);
}

void __NEFlowDirectorSetNewFlowCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(const void **)(v2 + 144);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }

  *(void *)(v2 + 144) = *(void *)(a1 + 32);
}

void NEFlowDirectorFetchFlowStates(uint64_t a1, void *aBlock)
{
  if (aBlock)
  {
    int v3 = _Block_copy(aBlock);
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = __NEFlowDirectorFetchFlowStates_block_invoke;
    v5[3] = &unk_18A06D6C8;
    v5[4] = v3;
    void v5[5] = a1;
    dispatch_async(v4, v5);
  }

void __NEFlowDirectorFetchFlowStates_block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  uint64_t v2 = *(const void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (*(void *)(v3 + 152))
  {
    _Block_release(v2);
  }

  else
  {
    *(void *)(v3 + 152) = v2;
    uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    BOOL v6 = (_DWORD *)MEMORY[0x1895A7868](*MEMORY[0x189604DB0], 8LL, 0LL);
    *(_BYTE *)BOOL v6 = 10;
    v6[1] = 0;
    flow_director_msg_send(*(void *)(a1 + 40), (uint64_t)v6, 8uLL, 1);
    CFAllocatorDeallocate(v5, v6);
  }

uint64_t NEPunyCodeString(const char *a1, int32_t a2, char *a3, int32_t a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  pErrorCFIndex Code = U_ZERO_ERROR;
  UIDNAInfo v13 = (UIDNAInfo)xmmword_187556220;
  int v8 = (const UIDNA *)MEMORY[0x1895A8714](34LL, &pErrorCode);
  uint64_t v9 = uidna_nameToASCII_UTF8(v8, a1, a2, a3, a4, &v13, &pErrorCode);
  uidna_close(v8);
  if (pErrorCode)
  {
    int v10 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v16 = a1;
      __int16 v17 = 1024;
      unsigned __int32 errors = pErrorCode;
      uint64_t v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed errorCode %d";
LABEL_9:
      _os_log_error_impl(&dword_187528000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      return 0LL;
    }

    return 0LL;
  }

  if (v13.errors)
  {
    int v10 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v16 = a1;
      __int16 v17 = 1024;
      unsigned __int32 errors = v13.errors;
      uint64_t v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed info.errors 0x%08X";
      goto LABEL_9;
    }

    return 0LL;
  }

  return v9;
}

double NEHelperTrackerGetAppInfo()
{
  v0 = malloc(0x80uLL);
  if (v0)
  {
    double result = 0.0;
    v0[6] = 0u;
    v0[7] = 0u;
    v0[4] = 0u;
    v0[5] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    _OWORD *v0 = 0u;
    v0[1] = 0u;
  }

  return result;
}

void NEHelperTrackerFreeAppInfo(void *a1)
{
  if (a1) {
    free(a1);
  }
}

BOOL NEHelperTrackerAppInfoSetSigningIdentifier(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    *a1 = a2;
    a1[8] = a3;
  }

  return a1 != 0LL;
}

BOOL NEHelperTrackerAppInfoSetAuditToken(uint64_t a1, __int128 *a2, __int128 *a3)
{
  if (a1)
  {
    __int128 v3 = *a2;
    *(_OWORD *)(a1 + 24) = a2[1];
    *(_OWORD *)(a1 + 8) = v3;
    __int128 v4 = *a3;
    *(_OWORD *)(a1 + 88) = a3[1];
    *(_OWORD *)(a1 + 72) = v4;
  }

  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetUUID(uint64_t a1, const unsigned __int8 *a2, const unsigned __int8 *a3)
{
  if (a1)
  {
    uuid_copy((unsigned __int8 *)(a1 + 40), a2);
    uuid_copy((unsigned __int8 *)(a1 + 104), a3);
  }

  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetPID(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 56) = a2;
    *(_DWORD *)(a1 + 120) = a3;
  }

  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetIsBrowser(uint64_t a1)
{
  if (a1) {
    *(_DWORD *)(a1 + 124) |= 1u;
  }
  return a1 != 0;
}

uint64_t NEHelperTrackerAppInfoIsBrowser(uint64_t result)
{
  if (result) {
    return *(_BYTE *)(result + 124) & 1;
  }
  return result;
}

uint64_t NEHelperTrackerGetAppUUID(uint64_t result, unsigned __int8 *a2)
{
  v10[7] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    __int128 v4 = (const unsigned __int8 *)(result + 40);
    if (uuid_is_null((const unsigned __int8 *)(result + 40)))
    {
      int v5 = *(_DWORD *)(v3 + 56);
      if (v5 && proc_pidinfo(v5, 17, 1uLL, v10, 56) == 56
        || (int v6 = *(_DWORD *)(v3 + 28)) != 0 && proc_pidinfo(v6, 17, 1uLL, v10, 56) == 56)
      {
LABEL_12:
        int v8 = (const unsigned __int8 *)v10;
        uint64_t v9 = a2;
LABEL_14:
        uuid_copy(v9, v8);
        return 1LL;
      }

      __int128 v4 = (const unsigned __int8 *)(v3 + 104);
      if (uuid_is_null((const unsigned __int8 *)(v3 + 104)))
      {
        int v7 = *(_DWORD *)(v3 + 120);
        if (!v7 || proc_pidinfo(v7, 17, 1uLL, v10, 56) != 56)
        {
          double result = *(unsigned int *)(v3 + 92);
          if (!(_DWORD)result) {
            return result;
          }
          if (proc_pidinfo(result, 17, 1uLL, v10, 56) != 56) {
            return 0LL;
          }
        }

        goto LABEL_12;
      }
    }

    uint64_t v9 = a2;
    int v8 = v4;
    goto LABEL_14;
  }

  return result;
}

uint64_t NEHelperPidFromAuditToken(_OWORD *a1)
{
  __int128 v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3);
}

char *NETrackerGenerateTCCCacheKey(char *result, char *__dst, size_t __size)
{
  if (!result) {
    return strncpy(__dst, (const char *)TCC_CACHE_INTHEAPP_KEY, __size);
  }
  audit_token_t v3 = (_DWORD *)*((void *)result + 1);
  if (v3) {
    return (char *)snprintf( __dst,  __size,  "%x-%x-%x-%x-%x-%x-%x-%x",  *v3,  v3[1],  v3[2],  v3[3],  v3[4],  v3[5],  v3[6],  v3[7]);
  }
  return result;
}

void NETrackerInsertTCCCache(char *a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  *(_OWORD *)key = 0u;
  __int128 v10 = 0u;
  NETrackerGenerateTCCCacheKey(a1, key, 0x80uLL);
  if (a2) {
    int64_t v3 = 1LL;
  }
  else {
    int64_t v3 = 2LL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&g_tcc_cache_lock);
  uint64_t v4 = MEMORY[0x1895F9250];
  if (g_tcc_cache && MEMORY[0x1895A89D8]() == v4)
  {
    if (!g_tcc_cache) {
      goto LABEL_12;
    }
  }

  else
  {
    g_tcc_cache = (uint64_t)xpc_dictionary_create(0LL, 0LL, 0LL);
    if (!g_tcc_cache) {
      goto LABEL_12;
    }
  }

LABEL_12:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_tcc_cache_lock);
  int v5 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2080;
    int v8 = key;
    _os_log_debug_impl( &dword_187528000,  v5,  OS_LOG_TYPE_DEBUG,  "NETrackerInsertTCCCache(): (%d) for bundle: (%s)",  (uint8_t *)v6,  0x12u);
  }

  data = 0LL;
  int v6 = 0LL;
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4LL));
  __int128 v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(unsigned int *)(a1 + 52);
  *(void *)(v16 + 32 * v17 + 8) = v6;
  if (v6)
  {
    __int128 v18 = *(unsigned int **)(a1 + 40);
    do
      uint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 + 1, v18));
    if (ne_filter_connection_queue_onceToken != -1) {
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
    }
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)ne_filter_connection_queue_filter_queue);
    xpc_connection_set_context(v6, *(void **)(a1 + 40));
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __ne_filter_request_xpc_connection_block_invoke_28;
    handler[3] = &__block_descriptor_tmp_29;
    handler[4] = v6;
    void handler[5] = *(void *)(a1 + 48);
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
  }

  if (data && length == 32)
  {
    inited = ne_filter_crypto_init_client(data);
    *(void *)(v16 + 32 * v17 + 32) = inited;
    if (!inited)
    {
      socklen_t v21 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v22 = "Filter failed to init client crypto";
LABEL_27:
        _os_log_error_impl(&dword_187528000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
      }
    }
  }

  else
  {
    socklen_t v21 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v22 = "Filter failed to retrieve client crypto key";
      goto LABEL_27;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4LL));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  _Block_release(*(const void **)(a1 + 32));
}

uint64_t NETrackerCheckTCCCache(char *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)key = 0u;
  __int128 v9 = 0u;
  NETrackerGenerateTCCCacheKey(a1, key, 0x80uLL);
  os_unfair_lock_lock((os_unfair_lock_t)&g_tcc_cache_lock);
  if (g_tcc_cache && MEMORY[0x1895A89D8]() == MEMORY[0x1895F9250]) {

  }
    int64_t int64 = xpc_dictionary_get_int64((xpc_object_t)g_tcc_cache, key);
  else {
    int64_t int64 = 0LL;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&g_tcc_cache_lock);
  uint64_t v2 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 134218242;
    int64_t v5 = int64;
    __int16 v6 = 2080;
    __int16 v7 = key;
    _os_log_debug_impl( &dword_187528000,  v2,  OS_LOG_TYPE_DEBUG,  "NETrackerCheckTCCCache(): (%lld) for bundle: (%s)",  (uint8_t *)&v4,  0x16u);
  }

  else {
    return int64;
  }
}

uint64_t NEHelperIsTCCTrackingAllowed(uint64_t a1)
{
  int v2 = NETrackerCheckTCCCache((char *)a1);
  if (v2 == 1) {
    return 1LL;
  }
  if (v2 == 2) {
    return 0LL;
  }
  if (a1)
  {
    if (*(void *)(a1 + 8))
    {
      int v3 = TCCAccessPreflightWithAuditToken();
      goto LABEL_8;
    }

    NETrackerInsertTCCCache((char *)a1, 0);
    return 0LL;
  }

  int v3 = TCCAccessPreflight();
LABEL_8:
  BOOL v4 = v3 == 0;
  if (v3 != 2) {
    NETrackerInsertTCCCache((char *)a1, v3 == 0);
  }
  return v4;
}

__CFBundle *NEHelperIsHostnameDesignatedTracker(__CFBundle *result)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v1 = (const char *)result;
    double result = CFBundleGetMainBundle();
    if (result)
    {
      double result = (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(result, @"NSPrivacyTrackingDomains");
      if (result)
      {
        int v2 = result;
        CFIndex Count = CFArrayGetCount(result);
        if (Count < 1)
        {
          return 0LL;
        }

        else
        {
          CFIndex v4 = Count;
          CFIndex v5 = 0LL;
          while (1)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, v5);
            memset(v17, 0, 255);
            CFStringGetCString(ValueAtIndex, (char *)v17, 255LL, 0x8000100u);
            size_t v7 = strlen(v1);
            if (v7) {
              uint64_t v8 = v1[v7 - 1] == 46 ? v7 - 1 : v7;
            }
            else {
              uint64_t v8 = 0LL;
            }
            size_t v9 = strlen((const char *)v17);
            if (v9)
            {
              uint64_t v10 = *((_BYTE *)v17 + v9 - 1) == 46 ? v9 - 1 : v9;
              BOOL v11 = !v10 || v8 == 0;
              if (!v11 && v8 >= v10)
              {
                while (1)
                {
                  uint64_t v13 = v8 - 1;
                  if (v8 < 1) {
                    break;
                  }
                  uint64_t v14 = v10 - 1;
                  if (v10 < 1) {
                    break;
                  }
                  int v15 = v1[v8 - 1];
                  int v16 = *((unsigned __int8 *)v17 + v10 - 1);
                  --v8;
                  --v10;
                  if (v15 != v16)
                  {
                    uint64_t v8 = v13;
                    uint64_t v10 = v14;
                    if ((v16 ^ v15) != 0x20) {
                      goto LABEL_30;
                    }
                  }
                }

                if (v8 == v10 || v8 >= 1 && v1[v13] == 46) {
                  return (__CFBundle *)1;
                }
              }
            }

LABEL_30:
            if (++v5 == v4) {
              return 0LL;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t NEHelperIsHostnameDesignatedTrackerExternal(const char *a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  uint64_t v106 = *MEMORY[0x1895F89C0];
  if (!a1 || !a2) {
    return v2;
  }
  if (NEHelperIsHostnameDesignatedTrackerExternal_onceToken != -1) {
    dispatch_once(&NEHelperIsHostnameDesignatedTrackerExternal_onceToken, &__block_literal_global_23);
  }
  if (NEHelperIsHostnameDesignatedTrackerExternal_skip_daemon)
  {
    CFIndex v5 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      return 0LL;
    }
    *(_WORD *)buf = 0;
    __int16 v6 = "Skipping external tracker check from system daemon";
    size_t v7 = buf;
    goto LABEL_8;
  }

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  *(_OWORD *)buf = 0u;
  __int128 v91 = 0u;
  uint64_t v10 = *(const char **)a2;
  if (!*(void *)a2)
  {
    BOOL v11 = (const __CFString *)NECopySigningIdentifierForPIDwithAuditToken(*(_DWORD *)(a2 + 24), *(void *)(a2 + 8));
    if (!v11)
    {
      CFIndex v5 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        return 0LL;
      }
      *(_WORD *)buffer = 0;
      __int16 v6 = "NEHelperIsHostnameDesignatedTrackerExternal(): cannot obtain signing identifier. returning ne_tracker_status_none.";
      size_t v7 = (uint8_t *)buffer;
LABEL_8:
      uint64_t v8 = v5;
      uint32_t v9 = 2;
LABEL_9:
      _os_log_debug_impl(&dword_187528000, v8, OS_LOG_TYPE_DEBUG, v6, v7, v9);
      return 0LL;
    }

    __int128 v12 = v11;
    CFStringGetCString(v11, NEHelperIsHostnameDesignatedTrackerExternal_buffer, 254LL, 0x600u);
    CFRelease(v12);
    int v13 = *(_DWORD *)(a2 + 24);
    if (!v13)
    {
      uint64_t v14 = *(void *)(a2 + 8);
      if (v14) {
        int v13 = *(_DWORD *)(v14 + 20);
      }
      else {
        int v13 = 0;
      }
    }

    proc_name(v13, buf, 0x100u);
    uint64_t v10 = NEHelperIsHostnameDesignatedTrackerExternal_buffer;
  }

  int v15 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buffer = 136315138;
    *(void *)&buffer[4] = v10;
    _os_log_debug_impl( &dword_187528000,  v15,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): obtained signing identifier: (%s)",  (uint8_t *)buffer,  0xCu);
  }

  int v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v10, 0x600u);
  uint64_t v18 = NEHelperTrackerCacheGet((os_unfair_lock_s *)&g_tracker_cache, v17);
  if (v18)
  {
    uint64_t v19 = (const __CFArray *)v18;
    CFIndex Count = CFArrayGetCount((CFArrayRef)v18);
    if (Count < 1)
    {
      int v34 = 0;
    }

    else
    {
      CFIndex v21 = Count;
      CFIndex v22 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v22);
        __int128 v88 = 0u;
        memset(v89, 0, sizeof(v89));
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v77 = 0u;
        memset(buffer, 0, sizeof(buffer));
        CFStringGetCString(ValueAtIndex, buffer, 253LL, 0x8000100u);
        size_t v24 = strlen(a1);
        if (v24) {
          uint64_t v25 = a1[v24 - 1] == 46 ? v24 - 1 : v24;
        }
        else {
          uint64_t v25 = 0LL;
        }
        size_t v26 = strlen(buffer);
        if (v26)
        {
          uint64_t v27 = buffer[v26 - 1] == 46 ? v26 - 1 : v26;
          BOOL v28 = !v27 || v25 == 0;
          if (!v28 && v25 >= v27)
          {
            while (1)
            {
              uint64_t v30 = v25 - 1;
              if (v25 < 1) {
                break;
              }
              uint64_t v31 = v27 - 1;
              if (v27 < 1) {
                break;
              }
              int v32 = a1[v25 - 1];
              int v33 = buffer[v27 - 1];
              --v25;
              --v27;
              if (v32 != v33)
              {
                uint64_t v25 = v30;
                uint64_t v27 = v31;
                if ((v33 ^ v32) != 0x20) {
                  goto LABEL_48;
                }
              }
            }

            if (v25 == v27 || v25 >= 1 && a1[v30] == 46) {
              break;
            }
          }
        }

LABEL_48:
        if (++v22 == v21)
        {
          int v34 = 0;
          goto LABEL_93;
        }
      }

      CFTypeID v69 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)BOOL v72 = 136380931;
        __int16 v73 = a1;
        __int16 v74 = 2081;
        __int16 v75 = buffer;
        _os_log_debug_impl( &dword_187528000,  v69,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): found subdomain in cache. (%{private}s) is a subdomain of track er domain (%{private}s)",  v72,  0x16u);
      }

      int v34 = 1;
    }
  }

  else
  {
    theArray = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
    AppTrackerDomains = (void *)NEHelperGetAppTrackerDomains();
    if (AppTrackerDomains)
    {
      uint64_t v36 = AppTrackerDomains;
      int v70 = v10;
      size_t v37 = xpc_array_get_count(AppTrackerDomains);
      if (v37)
      {
        size_t v38 = v37;
        char v39 = 0;
        for (size_t i = 0LL; i != v38; ++i)
        {
          xpc_object_t value = xpc_array_get_value(v36, i);
          string_ptr = xpc_string_get_string_ptr(value);
          if (string_ptr)
          {
            uint64_t v43 = string_ptr;
            if ((v39 & 1) == 0)
            {
              size_t v44 = strlen(a1);
              if (v44) {
                uint64_t v45 = a1[v44 - 1] == 46 ? v44 - 1 : v44;
              }
              else {
                uint64_t v45 = 0LL;
              }
              size_t v46 = strlen(v43);
              if (v46)
              {
                uint64_t v47 = v43[v46 - 1] == 46 ? v46 - 1 : v46;
                BOOL v48 = !v47 || v45 == 0;
                if (!v48 && v45 >= v47)
                {
                  while (1)
                  {
                    uint64_t v50 = v45 - 1;
                    if (v45 < 1) {
                      break;
                    }
                    uint64_t v51 = v47 - 1;
                    if (v47 < 1) {
                      break;
                    }
                    int v52 = a1[v45 - 1];
                    int v53 = v43[v47 - 1];
                    --v45;
                    --v47;
                    if (v52 != v53)
                    {
                      uint64_t v45 = v50;
                      uint64_t v47 = v51;
                      if ((v53 ^ v52) != 0x20) {
                        goto LABEL_82;
                      }
                    }
                  }

                  if (v45 == v47 || v45 >= 1 && a1[v50] == 46)
                  {
                    CFTypeRef v54 = (os_log_s *)ne_log_obj();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buffer = 136380931;
                      *(void *)&buffer[4] = a1;
                      *(_WORD *)&buffer[12] = 2081;
                      *(void *)&buffer[14] = v43;
                      _os_log_debug_impl( &dword_187528000,  v54,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): found subdomain. (%{private}s) is a subdomain of tracker domain (%{private}s)",  (uint8_t *)buffer,  0x16u);
                    }

                    char v39 = 1;
                  }
                }
              }
            }

LABEL_82:
            CFStringRef v55 = CFStringCreateWithCString(v16, v43, 0x600u);
            if (v55)
            {
              CFStringRef v56 = v55;
              CFArrayAppendValue(theArray, v55);
              CFRelease(v56);
            }

            else
            {
              int v57 = (os_log_s *)ne_log_obj();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buffer = 136315138;
                *(void *)&buffer[4] = v70;
                _os_log_debug_impl( &dword_187528000,  v57,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): unable to cache domain for bundle (%s)",  (uint8_t *)buffer,  0xCu);
              }
            }
          }
        }
      }

      else
      {
        char v39 = 0;
      }

      xpc_release(v36);
      uint64_t v10 = v70;
    }

    else
    {
      char v39 = 0;
    }

    NEHelperTrackerCachePut((uint64_t)&g_tracker_cache, v17, (uint64_t)theArray);
    int v34 = v39 & 1;
  }

LABEL_93:
  CFRelease(v17);
  int v58 = *(_DWORD *)(a2 + 28);
  if (v58 == 2)
  {
    int v60 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buffer = 0;
      _os_log_debug_impl( &dword_187528000,  v60,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): previous_tcc_check_result is ne_tcc_result_denied",  (uint8_t *)buffer,  2u);
    }

    int IsTCCTrackingAllowed = 0;
    goto LABEL_108;
  }

  if (!v58)
  {
    if (*(void *)(a2 + 8))
    {
      if (v34) {
        int IsTCCTrackingAllowed = NEHelperIsTCCTrackingAllowed(a2);
      }
      else {
        int IsTCCTrackingAllowed = 1;
      }
      int v62 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buffer = 0;
        _os_log_debug_impl( &dword_187528000,  v62,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): previous_tcc_check_result is ne_tcc_result_not_performed and au dit_token is set",  (uint8_t *)buffer,  2u);
      }

      goto LABEL_108;
    }

    goto LABEL_102;
  }

  if (!*(void *)(a2 + 8))
  {
LABEL_102:
    int v61 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buffer = 0;
      _os_log_debug_impl( &dword_187528000,  v61,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): context->audit_token is not set.",  (uint8_t *)buffer,  2u);
    }
  }

  int IsTCCTrackingAllowed = 1;
LABEL_108:
  int v63 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buffer = 67109376;
    *(_DWORD *)&buffer[4] = v34;
    *(_WORD *)&buffer[8] = 1024;
    *(_DWORD *)&buffer[10] = IsTCCTrackingAllowed;
    _os_log_debug_impl( &dword_187528000,  v63,  OS_LOG_TYPE_DEBUG,  "NEHelperIsHostnameDesignatedTrackerExternal(): is_hostname_found: (%d), is_tcc_allowed: (%d)",  (uint8_t *)buffer,  0xEu);
  }

  v64 = (os_log_s *)ne_log_obj();
  v65 = v64;
  if (!v34)
  {
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
      return 0LL;
    }
    *(_DWORD *)buffer = 136380675;
    *(void *)&buffer[4] = a1;
    __int16 v6 = "External check: hostname %{private}s is not a tracker. Returning: ne_tracker_status_none";
    size_t v7 = (uint8_t *)buffer;
    uint64_t v8 = v65;
    uint32_t v9 = 12;
    goto LABEL_9;
  }

  if (IsTCCTrackingAllowed)
  {
    uint64_t v2 = 2LL;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buffer = 136380675;
      *(void *)&buffer[4] = a1;
      _os_log_debug_impl( &dword_187528000,  v65,  OS_LOG_TYPE_DEBUG,  "External check: Tracking is allowed by the user, hostname %{private}s is a declared tracker. Returning: ne_track er_status_declared",  (uint8_t *)buffer,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = "";
      if (v10) {
        uint64_t v67 = v10;
      }
      CFStringRef v68 = buf;
      if (!buf[0]) {
        CFStringRef v68 = (uint8_t *)v67;
      }
      *(_DWORD *)buffer = 136315394;
      *(void *)&buffer[4] = a1;
      *(_WORD *)&buffer[12] = 2080;
      *(void *)&buffer[14] = v68;
      _os_log_impl( &dword_187528000,  v65,  OS_LOG_TYPE_DEFAULT,  "Denied access to %s because it matches a domain in the NSTrackingDomains of %s, which does not have permission to track.",  (uint8_t *)buffer,  0x16u);
    }

    return 1LL;
  }

  return v2;
}

CFMutableDictionaryRef __NEHelperIsHostnameDesignatedTrackerExternal_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  pid_t v0 = getpid();
  xpc_object_t v1 = ne_copy_signing_identifier_for_pid_with_audit_token(v0, 0LL);
  if (v1 && (uint64_t v2 = v1, MEMORY[0x1895A89D8]() == MEMORY[0x1895F92E8]))
  {
    string_ptr = xpc_string_get_string_ptr(v2);
    if (string_ptr)
    {
      NEHelperIsHostnameDesignatedTrackerExternal_skip_daemon = strcmp(string_ptr, "com.apple.cloudd") == 0;
    }

    else
    {
      CFIndex v5 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7[0]) = 0;
        _os_log_error_impl( &dword_187528000,  v5,  OS_LOG_TYPE_ERROR,  "Failed to get a string pointer from the current signing identifier",  (uint8_t *)v7,  2u);
      }
    }

    xpc_release(v2);
  }

  else
  {
    int v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = getpid();
      _os_log_error_impl( &dword_187528000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to get the signing identifier for %d",  (uint8_t *)v7,  8u);
    }
  }

  g_tracker_cache = 128;
  CFMutableDictionaryRef result = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  128LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  qword_18C4C4518 = 0LL;
  unk_18C4C4508 = result;
  unk_18C4C4510 = 0;
  qword_18C4C4520 = (uint64_t)&qword_18C4C4518;
  return result;
}

BOOL NEHelperIsBundle()
{
  MainBundle = CFBundleGetMainBundle();
  return CFBundleGetIdentifier(MainBundle) != 0LL;
}

uint64_t NEHelperIsOSFeatureEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t NEHelperTrackerAppInfoGetPID(unsigned int *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t result = a1[14];
  if (!(_DWORD)result)
  {
    uint64_t result = a1[7];
    if (!(_DWORD)result)
    {
      uint64_t result = a1[30];
      if (!(_DWORD)result)
      {
        uint64_t result = a1[23];
        if (!(_DWORD)result) {
          return 0LL;
        }
      }
    }
  }

  return result;
}

unint64_t NEHelperTrackerContextGetDomain(unint64_t a1)
{
  unint64_t domain = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v2
      && (qword_18C4C43A0 <= domain
        ? (BOOL v3 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= domain)
        : (BOOL v3 = 0),
          v3))
    {
      unint64_t domain = ne_tracker_context_get_domain();
    }

    else
    {
      unint64_t domain = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return domain;
}

unint64_t NEHelperTrackerContextGetDomainOwner(unint64_t a1)
{
  unint64_t domain_owner = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v2
      && (qword_18C4C43A0 <= domain_owner
        ? (BOOL v3 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= domain_owner)
        : (BOOL v3 = 0),
          v3))
    {
      unint64_t domain_owner = ne_tracker_context_get_domain_owner();
    }

    else
    {
      unint64_t domain_owner = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return domain_owner;
}

unint64_t NEHelperTrackerContextCanBlockRequest(unint64_t a1)
{
  unint64_t can_block_request = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v2
      && (qword_18C4C43A0 <= can_block_request
        ? (BOOL v3 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= can_block_request)
        : (BOOL v3 = 0),
          v3))
    {
      unint64_t can_block_request = ne_tracker_context_can_block_request();
    }

    else
    {
      unint64_t can_block_request = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return can_block_request;
}

unint64_t NEHelperTrackerContextCopyDomain( unint64_t a1, char *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v8 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v8
      && (qword_18C4C43A0 <= v4
        ? (BOOL v9 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= v4)
        : (BOOL v9 = 0),
          v9 && (unint64_t domain = (const char *)ne_tracker_context_get_domain()) != 0LL))
    {
      BOOL v11 = domain;
      unint64_t v12 = strlen(domain);
      unint64_t v13 = v12;
      unint64_t v4 = 0LL;
      if (a2 && v12 <= a3 - 1)
      {
        strncpy(a2, v11, v12);
        a2[v13] = 0;
        unint64_t v4 = (unint64_t)a2;
      }

      if (a4) {
        *a4 = v13;
      }
    }

    else
    {
      unint64_t v4 = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return v4;
}

unint64_t NEHelperTrackerContextCopyDomainOwner( unint64_t a1, char *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v8 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v8
      && (qword_18C4C43A0 <= v4
        ? (BOOL v9 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= v4)
        : (BOOL v9 = 0),
          v9 && (unint64_t domain_owner = (const char *)ne_tracker_context_get_domain_owner()) != 0LL))
    {
      BOOL v11 = domain_owner;
      unint64_t v12 = strlen(domain_owner);
      unint64_t v13 = v12;
      unint64_t v4 = 0LL;
      if (a2 && v12 <= a3 - 1)
      {
        strncpy(a2, v11, v12);
        a2[v13] = 0;
        unint64_t v4 = (unint64_t)a2;
      }

      if (a4) {
        *a4 = v13;
      }
    }

    else
    {
      unint64_t v4 = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return v4;
}

CFStringRef NEHelperTrackerContextDupDomain(const __CFString *a1)
{
  CFStringRef v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v2
      && (qword_18C4C43A0 <= (unint64_t)v1
        ? (BOOL v3 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= (unint64_t)v1)
        : (BOOL v3 = 0),
          v3 && (unint64_t domain = (const char *)ne_tracker_context_get_domain()) != 0LL))
    {
      CFStringRef v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], domain, 0x8000100u);
    }

    else
    {
      CFStringRef v1 = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return v1;
}

CFStringRef NEHelperTrackerContextDupDomainOwner(const __CFString *a1)
{
  CFStringRef v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961LL && *(void *)algn_18C4C4388 == 2LL;
    if (v2
      && (qword_18C4C43A0 <= (unint64_t)v1
        ? (BOOL v3 = qword_18C4C43A0 + (unint64_t)(unsigned __int16)word_18C4C43B4 - 1 >= (unint64_t)v1)
        : (BOOL v3 = 0),
          v3 && (unint64_t domain_owner = (const char *)ne_tracker_context_get_domain_owner()) != 0LL))
    {
      CFStringRef v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], domain_owner, 0x8000100u);
    }

    else
    {
      CFStringRef v1 = 0LL;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }

  return v1;
}

BOOL NEHelperTrackerMatchDomain(_DWORD *a1, char *__s, uint64_t a3, void *a4, _BYTE *a5, int a6)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (!__s) {
    return 0LL;
  }
  int v11 = strlen(__s);
  int v12 = v11;
  if (!v11)
  {
    uint64_t v19 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    if (!a1 || (int v21 = a1[14]) == 0 && (int v21 = a1[7]) == 0 && (int v21 = a1[30]) == 0 && (int v21 = a1[23]) == 0) {
      int v21 = 0;
    }
LABEL_64:
    *(_DWORD *)buf = 136315650;
    char v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 1024;
    *(_DWORD *)uint64_t v41 = (_DWORD)a1;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v21;
    _os_log_debug_impl( &dword_187528000,  v19,  OS_LOG_TYPE_DEBUG,  "%s: Invalid lookup for zero-length domain (app info ref %X pid %d)",  buf,  0x18u);
    return 0LL;
  }

  if (__s[v11 - 1] == 46)
  {
    int v12 = v11 - 1;
    if (v11 == 1)
    {
      uint64_t v19 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      if (!a1 || (int v21 = a1[14]) == 0 && (int v21 = a1[7]) == 0 && (int v21 = a1[30]) == 0 && (int v21 = a1[23]) == 0) {
        int v21 = 0;
      }
      goto LABEL_64;
    }
  }

  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    uint64_t v14 = __s;
    do
    {
      char *v14 = __tolower(*v14);
      ++v14;
      --v13;
    }

    while (v13);
  }

  __s[v12] = 0;
  int v15 = (os_log_s *)ne_log_obj();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if ((a6 & 1) != 0)
  {
    if (!v16) {
      goto LABEL_16;
    }
    CFStringRef v17 = "App";
    if (a1)
    {
      int v18 = a1[14];
      if (!v18)
      {
        int v18 = a1[7];
        if (!v18)
        {
          int v18 = a1[30];
          if (!v18) {
            int v18 = a1[23];
          }
        }
      }

      if ((a1[31] & 1) != 0) {
        CFStringRef v17 = "Web";
      }
    }

    else
    {
      int v18 = 0;
    }

    *(_DWORD *)buf = 136317187;
    char v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 2160;
    *(void *)uint64_t v41 = 1752392040LL;
    *(_WORD *)&v41[8] = 1040;
    *(_DWORD *)&v41[10] = v12;
    __int16 v42 = 2101;
    *(void *)uint64_t v43 = __s;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)&v43[10] = (_DWORD)a1;
    *(_WORD *)&v43[14] = 1024;
    *(_DWORD *)&v43[16] = v18;
    *(_WORD *)size_t v44 = 2080;
    *(void *)&v44[2] = "n/a";
    *(_WORD *)&v44[10] = 2080;
    *(void *)&v44[12] = "n/a";
    *(_WORD *)&v44[20] = 2080;
    *(void *)&v44[22] = v17;
    BOOL v28 = "%s domain lookup for%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
    __int128 v29 = v15;
    uint32_t v30 = 80;
  }

  else
  {
    if (!v16) {
      goto LABEL_16;
    }
    uint64_t v25 = "App";
    if (a1)
    {
      int v26 = a1[14];
      if (!v26)
      {
        int v26 = a1[7];
        if (!v26)
        {
          int v26 = a1[30];
          if (!v26) {
            int v26 = a1[23];
          }
        }
      }

      if ((a1[31] & 1) != 0) {
        uint64_t v25 = "Web";
      }
    }

    else
    {
      int v26 = 0;
    }

    *(_DWORD *)buf = 136316931;
    char v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 1024;
    *(_DWORD *)uint64_t v41 = v12;
    *(_WORD *)&v41[4] = 2081;
    *(void *)&v41[6] = __s;
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = (_DWORD)a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    *(_WORD *)&v43[10] = 2080;
    *(void *)&v43[12] = "n/a";
    *(_WORD *)size_t v44 = 2080;
    *(void *)&v44[2] = "n/a";
    *(_WORD *)&v44[10] = 2080;
    *(void *)&v44[12] = v25;
    BOOL v28 = "%s: domain lookup for<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    __int128 v29 = v15;
    uint32_t v30 = 70;
  }

  _os_log_debug_impl(&dword_187528000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
LABEL_16:
  CFIndex v22 = (os_log_s *)ne_log_obj();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (a6)
  {
    if (v23)
    {
      int v24 = strlen(__s);
      uint64_t v36 = "App";
      if (a1)
      {
        int v37 = a1[14];
        if (!v37)
        {
          int v37 = a1[7];
          if (!v37)
          {
            int v37 = a1[30];
            if (!v37) {
              int v37 = a1[23];
            }
          }
        }

        if ((a1[31] & 1) != 0) {
          uint64_t v36 = "Web";
        }
      }

      else
      {
        int v37 = 0;
      }

      *(_DWORD *)buf = 136318723;
      char v39 = "NEHelperTrackerMatchDomain";
      __int16 v40 = 2160;
      *(void *)uint64_t v41 = 1752392040LL;
      *(_WORD *)&v41[8] = 1040;
      *(_DWORD *)&v41[10] = v24;
      __int16 v42 = 2101;
      *(void *)uint64_t v43 = __s;
      *(_WORD *)&v43[8] = 2160;
      *(void *)&v43[10] = 1752392040LL;
      *(_WORD *)&v43[18] = 1040;
      *(_DWORD *)size_t v44 = 4;
      *(_WORD *)&v44[4] = 2101;
      *(void *)&v44[6] = "null";
      *(_WORD *)&v44[14] = 2160;
      *(void *)&v44[16] = 1752392040LL;
      *(_WORD *)&v44[24] = 1040;
      *(_DWORD *)&v44[26] = 4;
      *(_WORD *)&v44[30] = 2101;
      *(void *)uint64_t v45 = "null";
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)size_t v46 = (_DWORD)a1;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v37;
      __int16 v47 = 2080;
      BOOL v48 = "n/a";
      __int16 v49 = 2080;
      uint64_t v50 = "n/a";
      __int16 v51 = 2080;
      int v52 = v36;
      int v33 = "%s: domain lookup result for%{sensitive, mask.hash, networkextension:string}.*P --> metadata %{sensitive, ma"
            "sk.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pi"
            "d %d %s) %s - %s";
      int v34 = v22;
      uint32_t v35 = 132;
LABEL_76:
      _os_log_debug_impl(&dword_187528000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
    }
  }

  else if (v23)
  {
    int v27 = strlen(__s);
    uint64_t v31 = "App";
    if (a1)
    {
      int v32 = a1[14];
      if (!v32)
      {
        int v32 = a1[7];
        if (!v32)
        {
          int v32 = a1[30];
          if (!v32) {
            int v32 = a1[23];
          }
        }
      }

      if ((a1[31] & 1) != 0) {
        uint64_t v31 = "Web";
      }
    }

    else
    {
      int v32 = 0;
    }

    *(_DWORD *)buf = 136317955;
    char v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 1024;
    *(_DWORD *)uint64_t v41 = v27;
    *(_WORD *)&v41[4] = 2081;
    *(void *)&v41[6] = __s;
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = 4;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = "null";
    *(_WORD *)&v43[14] = 1024;
    *(_DWORD *)&v43[16] = 4;
    *(_WORD *)size_t v44 = 2081;
    *(void *)&v44[2] = "null";
    *(_WORD *)&v44[10] = 1024;
    *(_DWORD *)&v44[12] = (_DWORD)a1;
    *(_WORD *)&v44[16] = 1024;
    *(_DWORD *)&v44[18] = v32;
    *(_WORD *)&v44[22] = 2080;
    *(void *)&v44[24] = "n/a";
    *(_WORD *)uint64_t v45 = 2080;
    *(void *)&v45[2] = "n/a";
    *(_WORD *)size_t v46 = 2080;
    *(void *)&v46[2] = v31;
    int v33 = "%s: domain lookup result for<%d : %{private}s> --> metadata <%d : %{private}s> <%d : %{private}s> (app info re"
          "f %X pid %d %s) %s - %s";
    int v34 = v22;
    uint32_t v35 = 102;
    goto LABEL_76;
  }

  NEHelperTrackerProcessMatch(__s, 0LL, (uint64_t)a1, a5, a6);
  if (a4) {
    *a4 = 0LL;
  }
  return 1LL;
}

void NEHelperTrackerProcessMatch(const char *a1, uint64_t a2, uint64_t a3, _BYTE *a4, int a5)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 buffer = 0u;
    __int128 v62 = 0u;
    if (!*a4)
    {
      int v10 = 0;
      goto LABEL_39;
    }

    goto LABEL_25;
  }

  int v10 = *(_DWORD *)(a3 + 56);
  if (v10
    || (int v10 = *(_DWORD *)(a3 + 28)) != 0
    || (int v10 = *(_DWORD *)(a3 + 120)) != 0
    || (int v10 = *(_DWORD *)(a3 + 92)) != 0)
  {
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 buffer = 0u;
    __int128 v62 = 0u;
    proc_name(v10, &buffer, 0x100u);
    if (*a4) {
      goto LABEL_40;
    }
    int v11 = *(_DWORD *)(a3 + 56);
    if (!v11) {
      int v11 = *(_DWORD *)(a3 + 28);
    }
    int v12 = *(const char **)a3;
    if (*(void *)a3) {
      goto LABEL_10;
    }
    if (v11)
    {
      BOOL v16 = (const __CFString *)NECopySigningIdentifierForPIDwithAuditToken(v11, 0LL);
      if (!v16) {
        goto LABEL_39;
      }
      CFStringRef v17 = v16;
      int v12 = NEHelperTrackerDomainIsApproved_buffer;
      CFStringGetCString(v16, NEHelperTrackerDomainIsApproved_buffer, 254LL, 0x600u);
      CFRelease(v17);
      goto LABEL_10;
    }

LABEL_38:
    *(void *)uu = 0LL;
    __int128 v78 = 0LL;
    NEHelperTrackerGetAppUUID(a3, uu);
    if (uuid_is_null(uu)) {
      goto LABEL_39;
    }
    __int16 v47 = (void *)NEHelperCacheCopySigningIdentifierMapping();
    if (!v47) {
      goto LABEL_39;
    }
    BOOL v48 = v47;
    xpc_string_get_string_ptr(v47);
    int v12 = NEHelperTrackerDomainIsApproved_buffer;
    __strlcpy_chk();
    xpc_release(v48);
    goto LABEL_10;
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 buffer = 0u;
  __int128 v62 = 0u;
  if (*a4)
  {
LABEL_25:
    int v10 = 0;
    goto LABEL_40;
  }

  int v10 = 0;
  int v12 = *(const char **)a3;
  if (!*(void *)a3) {
    goto LABEL_38;
  }
LABEL_10:
  if (!ne_helper_skip_associated_domain_bundles
    || !xpc_dictionary_get_BOOL((xpc_object_t)ne_helper_skip_associated_domain_bundles, v12))
  {
    if (ne_helper_last_approved_bundle)
    {
      uint64_t v13 = (void *)ne_helper_last_approved_associated_domains;
      if (ne_helper_last_approved_associated_domains)
      {
      }
    }

    uint64_t v14 = (void *)ne_tracker_lookup_app_domains();
    if (v14)
    {
      uint64_t v13 = v14;
      if (xpc_array_get_count(v14))
      {
        if (ne_helper_last_approved_bundle)
        {
          free((void *)ne_helper_last_approved_bundle);
          ne_helper_last_approved_bundle = 0LL;
        }

        if (ne_helper_last_approved_associated_domains) {
          xpc_release((xpc_object_t)ne_helper_last_approved_associated_domains);
        }
        ne_helper_last_approved_bundle = (uint64_t)strdup(v12);
        ne_helper_last_approved_associated_domains = (uint64_t)v13;
LABEL_22:
        *(void *)uu = 0LL;
        __int128 v78 = uu;
        uint64_t v79 = 0x2000000000LL;
        char v80 = 0;
        *(void *)__int16 v49 = MEMORY[0x1895F87A8];
        *(void *)&v49[8] = 0x40000000LL;
        *(void *)&v49[16] = __NEHelperTrackerDomainIsApproved_block_invoke;
        *(void *)&v49[24] = &unk_18A06DBC0;
        *(void *)&v49[32] = uu;
        *(void *)&v49[40] = a1;
        xpc_array_apply(v13, v49);
        int v15 = v78[24];
        _Block_object_dispose(uu, 8);
        if (v15) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }

      xpc_object_t v18 = (xpc_object_t)ne_helper_skip_associated_domain_bundles;
      if (!ne_helper_skip_associated_domain_bundles)
      {
        xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
        ne_helper_skip_associated_domain_bundles = (uint64_t)v18;
      }

      if (xpc_dictionary_get_count(v18) <= 0x7F) {
        xpc_dictionary_set_BOOL((xpc_object_t)ne_helper_skip_associated_domain_bundles, v12, 1);
      }
      xpc_release(v13);
    }
  }

LABEL_39:
  *a4 = 1;
LABEL_40:
  uint64_t v19 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = "";
    if (!*a4) {
      int v20 = ", approved domain";
    }
    int v21 = "App";
    if (a3 && (*(_DWORD *)(a3 + 124) & 1) != 0) {
      int v21 = "Web";
    }
    *(_DWORD *)__int16 v49 = 136316162;
    *(void *)&v49[4] = "NEHelperTrackerProcessMatch";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = v10;
    *(_WORD *)&v49[18] = 2080;
    *(void *)&v49[20] = &buffer;
    *(_WORD *)&v49[28] = 2080;
    *(void *)&v49[30] = v20;
    *(_WORD *)&v49[38] = 2080;
    *(void *)&v49[40] = v21;
    _os_log_impl( &dword_187528000,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: domain lookup - found match for tracker domain (pid %d %s)%s for %s",  v49,  0x30u);
  }

  CFIndex v22 = (os_log_s *)ne_log_obj();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (a5)
  {
    if (v23)
    {
      int v24 = strlen(a1);
      if (a2)
      {
        unint64_t domain = (const char *)ne_tracker_context_get_domain();
        int v27 = strlen(domain);
        uint64_t v25 = (const char *)ne_tracker_context_get_domain();
        unint64_t domain_owner = (const char *)ne_tracker_context_get_domain_owner();
        int v26 = strlen(domain_owner);
        BOOL v28 = (const char *)ne_tracker_context_get_domain_owner();
      }

      else
      {
        uint64_t v25 = "null";
        int v26 = 4;
        int v27 = 4;
        BOOL v28 = "null";
      }

      if (a3)
      {
        int v36 = *(_DWORD *)(a3 + 56);
        if (!v36)
        {
          int v36 = *(_DWORD *)(a3 + 28);
          if (!v36)
          {
            int v36 = *(_DWORD *)(a3 + 120);
            if (!v36) {
              int v36 = *(_DWORD *)(a3 + 92);
            }
          }
        }

        int v37 = "";
        if (!*a4) {
          int v37 = ", approved domain";
        }
        if ((*(_DWORD *)(a3 + 124) & 1) != 0) {
          size_t v38 = "Web";
        }
        else {
          size_t v38 = "App";
        }
      }

      else
      {
        int v36 = 0;
        if (*a4) {
          int v37 = "";
        }
        else {
          int v37 = ", approved domain";
        }
        size_t v38 = "App";
      }

      *(_DWORD *)__int16 v49 = 136318723;
      *(void *)&v49[4] = "NEHelperTrackerProcessMatch";
      *(_WORD *)&v49[12] = 2160;
      *(void *)&v49[14] = 1752392040LL;
      *(_WORD *)&v49[22] = 1040;
      *(_DWORD *)&v49[24] = v24;
      *(_WORD *)&v49[28] = 2101;
      *(void *)&v49[30] = a1;
      *(_WORD *)&v49[38] = 2160;
      *(void *)&v49[40] = 1752392040LL;
      *(_WORD *)&v49[48] = 1040;
      LODWORD(v50) = v27;
      WORD2(v50) = 2101;
      *(void *)((char *)&v50 + 6) = v25;
      HIWORD(v50) = 2160;
      uint64_t v51 = 1752392040LL;
      LOWORD(v52) = 1040;
      *(_DWORD *)((char *)&v52 + 2) = v26;
      HIWORD(v52) = 2101;
      *(void *)uint64_t v53 = v28;
      *(_WORD *)&v53[8] = 1024;
      *(_DWORD *)CFTypeRef v54 = a3;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v36;
      __int16 v55 = 2080;
      p___int128 buffer = &buffer;
      __int16 v57 = 2080;
      int v58 = v37;
      __int16 v59 = 2080;
      int v60 = v38;
      size_t v44 = "%s: domain lookup - found match for tracker%{sensitive, mask.hash, networkextension:string}.*P --> metadata "
            "%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:string}.*P (app"
            " info ref %X pid %d %s) %s - %s";
      uint64_t v45 = v22;
      uint32_t v46 = 132;
LABEL_87:
      _os_log_debug_impl(&dword_187528000, v45, OS_LOG_TYPE_DEBUG, v44, v49, v46);
    }
  }

  else if (v23)
  {
    int v29 = strlen(a1);
    if (a2)
    {
      char v39 = (const char *)ne_tracker_context_get_domain();
      int v32 = strlen(v39);
      uint32_t v30 = (const char *)ne_tracker_context_get_domain();
      __int16 v40 = (const char *)ne_tracker_context_get_domain_owner();
      int v31 = strlen(v40);
      int v33 = (const char *)ne_tracker_context_get_domain_owner();
    }

    else
    {
      uint32_t v30 = "null";
      int v31 = 4;
      int v32 = 4;
      int v33 = "null";
    }

    if (a3)
    {
      int v41 = *(_DWORD *)(a3 + 56);
      if (!v41)
      {
        int v41 = *(_DWORD *)(a3 + 28);
        if (!v41)
        {
          int v41 = *(_DWORD *)(a3 + 120);
          if (!v41) {
            int v41 = *(_DWORD *)(a3 + 92);
          }
        }
      }

      __int16 v42 = "";
      if (!*a4) {
        __int16 v42 = ", approved domain";
      }
      if ((*(_DWORD *)(a3 + 124) & 1) != 0) {
        uint64_t v43 = "Web";
      }
      else {
        uint64_t v43 = "App";
      }
    }

    else
    {
      int v41 = 0;
      if (*a4) {
        __int16 v42 = "";
      }
      else {
        __int16 v42 = ", approved domain";
      }
      uint64_t v43 = "App";
    }

    *(_DWORD *)__int16 v49 = 136317955;
    *(void *)&v49[4] = "NEHelperTrackerProcessMatch";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = v29;
    *(_WORD *)&v49[18] = 2081;
    *(void *)&v49[20] = a1;
    *(_WORD *)&v49[28] = 1024;
    *(_DWORD *)&v49[30] = v32;
    *(_WORD *)&v49[34] = 2081;
    *(void *)&v49[36] = v30;
    *(_WORD *)&v49[44] = 1024;
    *(_DWORD *)&v49[46] = v31;
    LOWORD(v50) = 2081;
    *(void *)((char *)&v50 + 2) = v33;
    WORD5(v50) = 1024;
    HIDWORD(v50) = a3;
    LOWORD(v51) = 1024;
    *(_DWORD *)((char *)&v51 + 2) = v41;
    HIWORD(v51) = 2080;
    int v52 = &buffer;
    *(_WORD *)uint64_t v53 = 2080;
    *(void *)&v53[2] = v42;
    *(_WORD *)CFTypeRef v54 = 2080;
    *(void *)&v54[2] = v43;
    size_t v44 = "%s: domain lookup - found match for tracker<%d : %{private}s> --> metadata <%d : %{private}s> <%d : %{private}"
          "s> (app info ref %X pid %d %s) %s - %s";
    uint64_t v45 = v22;
    uint32_t v46 = 102;
    goto LABEL_87;
  }

      if (a5 && v32)
      {
        int v27 = 0LL;
        BOOL v28 = 0;
        while (1)
        {
          int v29 = &v33[v27];
          uint32_t v30 = *(unsigned int *)&v33[v27 + 1];
          if (v33[v27] == 13) {
            break;
          }
          int v27 = (v28 + v30 + 5);
          int v10 = 1LL;
          BOOL v28 = v27;
        }

        if (!(_DWORD)v30)
        {
          int v10 = 1LL;
          *a5 = calloc(1uLL, 1uLL);
          return v10;
        }

        int v31 = calloc(v30 + 1, 1uLL);
        *a5 = v31;
        if (!v31) {
          return 1LL;
        }
        memcpy(v31, v29 + 5, v30);
      }

      return 1LL;
    }

    return 0LL;
  }

  return 1LL;
}

BOOL __NEHelperTrackerDomainIsApproved_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  int v5 = strcasecmp(*(const char **)(a1 + 40), string_ptr);
  if (!v5) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  return v5 != 0;
}

uint64_t NEHelperTrackerGetDispositionRedactLogs( uint64_t a1, CFArrayRef theArray, void *a3, CFIndex *a4, int a5)
{
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0LL;
  }
  char v15 = 0;
  if (!a1) {
    return 0LL;
  }
  int v11 = (*(_BYTE *)(a1 + 124) & 1) != 0 ? NEHelperTrackerCheckMetadataForWeb : NEHelperTrackerCheckMetadataForApp;
  if (!Count) {
    return 0LL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (!ne_tracker_build_cache() || Count < 1)
  {
LABEL_15:
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
    return 0LL;
  }

  CFIndex v12 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v12);
    if (CFStringGetCString(ValueAtIndex, NEHelperTrackerGetDispositionRedactLogs_buffer, 254LL, 0x8000100u))
    {
      if (NEHelperTrackerMatchDomain( (_DWORD *)a1,  NEHelperTrackerGetDispositionRedactLogs_buffer,  (uint64_t)v11,  a3,  &v15,  a5))
      {
        break;
      }
    }

    if (Count == ++v12) {
      goto LABEL_15;
    }
  }

  if (a4) {
    *a4 = v12;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (v15) {
    return 1LL;
  }
  else {
    return 3LL;
  }
}

uint64_t NEHelperTrackerCheckMetadataForApp(uint64_t result)
{
  if (result) {
    return ne_tracker_context_is_from_app_list();
  }
  return result;
}

uint64_t NEHelperTrackerCheckMetadataForWeb(uint64_t result)
{
  if (result) {
    return ne_tracker_context_is_from_web_list();
  }
  return result;
}

uint64_t NEHelperTrackerGetDisposition(uint64_t a1, const __CFArray *a2, void *a3, CFIndex *a4)
{
  return NEHelperTrackerGetDispositionRedactLogs(a1, a2, a3, a4, 0);
}

uint64_t NEHelperTrackerGetDispositionForDomain(_DWORD *a1, char *__s, void *a3, int a4)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  char v39 = 0;
  if (__s)
  {
    size_t v8 = strlen(__s);
    if (a1) {
      goto LABEL_3;
    }
LABEL_18:
    CFStringRef v17 = (os_log_s *)ne_log_obj();
    uint64_t result = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (a4)
    {
      if (!(_DWORD)result) {
        return result;
      }
      *(_DWORD *)buf = 136317187;
      int v41 = "NEHelperTrackerGetDispositionForDomain";
      __int16 v42 = 2160;
      if (__s) {
        xpc_object_t v18 = __s;
      }
      else {
        xpc_object_t v18 = "n/a";
      }
      *(void *)uint64_t v43 = 1752392040LL;
      *(_WORD *)&v43[8] = 1040;
      *(_DWORD *)&v43[10] = v8;
      __int16 v44 = 2101;
      *(void *)uint64_t v45 = v18;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)uint32_t v46 = 0;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = 0;
      __int16 v47 = 2080;
      BOOL v48 = "n/a";
      __int16 v49 = 2080;
      __int128 v50 = "n/a";
      __int16 v51 = 2080;
      int v52 = "App";
      char v15 = "%s Invalid app info for domain%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
      BOOL v16 = v17;
      goto LABEL_24;
    }

    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)buf = 136316931;
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    __int16 v42 = 1024;
    if (__s) {
      int v27 = __s;
    }
    else {
      int v27 = "n/a";
    }
    *(_DWORD *)uint64_t v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = v27;
    __int16 v44 = 1024;
    *(_DWORD *)uint64_t v45 = 0;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = 0;
    *(_WORD *)uint32_t v46 = 2080;
    *(void *)&v46[2] = "n/a";
    __int16 v47 = 2080;
    BOOL v48 = "n/a";
    __int16 v49 = 2080;
    __int128 v50 = "App";
    char v15 = "%s: Invalid app info for domain<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    BOOL v16 = v17;
LABEL_54:
    uint32_t v19 = 70;
    goto LABEL_55;
  }

  size_t v8 = 0LL;
  if (!a1) {
    goto LABEL_18;
  }
LABEL_3:
  BOOL v9 = (os_log_s *)ne_log_obj();
  uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8 - 254 <= 0xFFFFFFFFFFFFFF02LL)
  {
    if (a4)
    {
      if (!(_DWORD)result) {
        return result;
      }
      if (__s) {
        int v11 = __s;
      }
      else {
        int v11 = "n/a";
      }
      int v12 = a1[14];
      if (!v12)
      {
        int v12 = a1[7];
        if (!v12)
        {
          int v12 = a1[30];
          if (!v12) {
            int v12 = a1[23];
          }
        }
      }

      char v13 = a1[31];
      int v41 = "NEHelperTrackerGetDispositionForDomain";
      *(_DWORD *)buf = 136317187;
      __int16 v42 = 2160;
      if ((v13 & 1) != 0) {
        uint64_t v14 = "Web";
      }
      else {
        uint64_t v14 = "App";
      }
      *(void *)uint64_t v43 = 1752392040LL;
      *(_WORD *)&v43[8] = 1040;
      *(_DWORD *)&v43[10] = v8;
      __int16 v44 = 2101;
      *(void *)uint64_t v45 = v11;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)uint32_t v46 = (_DWORD)a1;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v12;
      __int16 v47 = 2080;
      BOOL v48 = "n/a";
      __int16 v49 = 2080;
      __int128 v50 = "n/a";
      __int16 v51 = 2080;
      int v52 = v14;
      char v15 = "%s Invalid domain length%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
      BOOL v16 = v9;
LABEL_24:
      uint32_t v19 = 80;
LABEL_55:
      _os_log_debug_impl(&dword_187528000, v16, OS_LOG_TYPE_DEBUG, v15, buf, v19);
      return 0LL;
    }

    if (!(_DWORD)result) {
      return result;
    }
    if (__s) {
      BOOL v28 = __s;
    }
    else {
      BOOL v28 = "n/a";
    }
    int v29 = a1[14];
    if (!v29)
    {
      int v29 = a1[7];
      if (!v29)
      {
        int v29 = a1[30];
        if (!v29) {
          int v29 = a1[23];
        }
      }
    }

    uint32_t v30 = "Web";
    char v31 = a1[31];
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136316931;
    __int16 v42 = 1024;
    if ((v31 & 1) == 0) {
      uint32_t v30 = "App";
    }
    *(_DWORD *)uint64_t v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = v28;
    __int16 v44 = 1024;
    *(_DWORD *)uint64_t v45 = (_DWORD)a1;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v29;
    *(_WORD *)uint32_t v46 = 2080;
    *(void *)&v46[2] = "n/a";
    __int16 v47 = 2080;
    BOOL v48 = "n/a";
    __int16 v49 = 2080;
    __int128 v50 = v30;
    char v15 = "%s: Invalid domain length<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    BOOL v16 = v9;
    goto LABEL_54;
  }

  if (a4)
  {
    if (!(_DWORD)result) {
      goto LABEL_57;
    }
    if (__s) {
      int v20 = __s;
    }
    else {
      int v20 = "n/a";
    }
    int v21 = a1[14];
    if (!v21)
    {
      int v21 = a1[7];
      if (!v21)
      {
        int v21 = a1[30];
        if (!v21) {
          int v21 = a1[23];
        }
      }
    }

    char v22 = a1[31];
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136317187;
    __int16 v42 = 2160;
    if ((v22 & 1) != 0) {
      BOOL v23 = "Web";
    }
    else {
      BOOL v23 = "App";
    }
    *(void *)uint64_t v43 = 1752392040LL;
    *(_WORD *)&v43[8] = 1040;
    *(_DWORD *)&v43[10] = v8;
    __int16 v44 = 2101;
    *(void *)uint64_t v45 = v20;
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)uint32_t v46 = (_DWORD)a1;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v21;
    __int16 v47 = 2080;
    BOOL v48 = "n/a";
    __int16 v49 = 2080;
    __int128 v50 = "n/a";
    __int16 v51 = 2080;
    int v52 = v23;
    int v24 = "%s domain lookup for%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
    uint64_t v25 = v9;
    uint32_t v26 = 80;
  }

  else
  {
    if (!(_DWORD)result) {
      goto LABEL_57;
    }
    if (__s) {
      uint32_t v35 = __s;
    }
    else {
      uint32_t v35 = "n/a";
    }
    int v36 = a1[14];
    if (!v36)
    {
      int v36 = a1[7];
      if (!v36)
      {
        int v36 = a1[30];
        if (!v36) {
          int v36 = a1[23];
        }
      }
    }

    int v37 = "Web";
    char v38 = a1[31];
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136316931;
    __int16 v42 = 1024;
    if ((v38 & 1) == 0) {
      int v37 = "App";
    }
    *(_DWORD *)uint64_t v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = v35;
    __int16 v44 = 1024;
    *(_DWORD *)uint64_t v45 = (_DWORD)a1;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v36;
    *(_WORD *)uint32_t v46 = 2080;
    *(void *)&v46[2] = "n/a";
    __int16 v47 = 2080;
    BOOL v48 = "n/a";
    __int16 v49 = 2080;
    __int128 v50 = v37;
    int v24 = "%s: domain lookup for<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    uint64_t v25 = v9;
    uint32_t v26 = 70;
  }

  _os_log_debug_impl(&dword_187528000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
LABEL_57:
  if ((a1[31] & 1) != 0) {
    int v32 = NEHelperTrackerCheckMetadataForWeb;
  }
  else {
    int v32 = NEHelperTrackerCheckMetadataForApp;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  buf[0] = 0;
  char v33 = ne_tracker_build_cache();
  if (buf[0]) {
    +[NEDiagnosticReport logInternalError:subType:context:]( &OBJC_CLASS___NEDiagnosticReport,  "logInternalError:subType:context:",  @"Tracker",  @"FailedtoReadMMAPFile",  0LL);
  }
  if ((v33 & 1) == 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
    return 0LL;
  }

  strncpy(NEHelperTrackerGetDispositionForDomain_buffer, __s, 0xFDuLL);
  NEHelperTrackerGetDispositionForDomain_buffer[v8] = 0;
  BOOL matched = NEHelperTrackerMatchDomain(a1, NEHelperTrackerGetDispositionForDomain_buffer, (uint64_t)v32, a3, &v39, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (!matched) {
    return 0LL;
  }
  if (v39) {
    return 1LL;
  }
  else {
    return 3LL;
  }
}

void NEHelperTrackerClearCache()
{
  if (qword_18C4C43A8) {
    ne_tracker_clear_cache();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
}

uint64_t NEHelperTrackerAppendTLV(uint64_t a1, char a2, size_t __n, void *__src)
{
  *(_BYTE *)a1 = a2;
  *(_DWORD *)(a1 + 1) = __n;
  if ((_DWORD)__n)
  {
    uint64_t v5 = __n;
    memcpy((void *)(a1 + 5), __src, __n);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return a1 + v5 + 5;
}

_BYTE *NEHelperTrackerParseTLV(uint64_t a1, _BYTE *a2, _DWORD *a3, void *a4)
{
  uint64_t result = 0LL;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a1 && a2 && a3 && a4)
  {
    *a2 = *(_BYTE *)a1;
    uint64_t v7 = *(unsigned int *)(a1 + 1);
    *a3 = v7;
    size_t v8 = (_BYTE *)(a1 + 5);
    *a4 = a1 + 5;
    int v9 = *a2;
    switch((int)v7)
    {
      case 0:
        int v10 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 136315650;
          xpc_object_t v18 = "NEHelperTrackerTLVLog";
          __int16 v19 = 1024;
          int v20 = v9;
          __int16 v21 = 1024;
          int v22 = 0;
          int v11 = "%s: Parsed TLV - type %d length %d";
          goto LABEL_19;
        }

        goto LABEL_24;
      case 1:
        unint64_t v12 = *v8;
        if (*v8) {
          goto LABEL_13;
        }
        goto LABEL_16;
      case 2:
        unint64_t v12 = *(unsigned __int16 *)v8;
        if (!*(_WORD *)v8) {
          goto LABEL_16;
        }
        goto LABEL_13;
      case 4:
        unint64_t v12 = *(unsigned int *)v8;
        if (*(_DWORD *)v8) {
          goto LABEL_13;
        }
        goto LABEL_16;
      case 8:
        unint64_t v12 = *(void *)v8;
        if (!*(void *)v8) {
          goto LABEL_16;
        }
LABEL_13:
        int v10 = (os_log_s *)ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_24;
        }
        int v17 = 136315906;
        xpc_object_t v18 = "NEHelperTrackerTLVLog";
        __int16 v19 = 1024;
        int v20 = v9;
        __int16 v21 = 1024;
        int v22 = v7;
        __int16 v23 = 2048;
        int v24 = (_BYTE *)v12;
        int v11 = "%s: Parsed TLV - type %d length %d value %llu";
        goto LABEL_22;
      default:
LABEL_16:
        int v13 = v8[v7 - 1];
        int v10 = (os_log_s *)ne_log_obj();
        BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (!v14) {
            goto LABEL_24;
          }
          int v17 = 136315650;
          xpc_object_t v18 = "NEHelperTrackerTLVLog";
          __int16 v19 = 1024;
          int v20 = v9;
          __int16 v21 = 1024;
          int v22 = v7;
          int v11 = "%s: Parsed TLV - type %d length %d";
LABEL_19:
          char v15 = v10;
          uint32_t v16 = 24;
        }

        else
        {
          if (!v14) {
            goto LABEL_24;
          }
          int v17 = 136315906;
          xpc_object_t v18 = "NEHelperTrackerTLVLog";
          __int16 v19 = 1024;
          int v20 = v9;
          __int16 v21 = 1024;
          int v22 = v7;
          __int16 v23 = 2080;
          int v24 = v8;
          int v11 = "%s: Parsed TLV - type %d length %d value <%s>";
LABEL_22:
          char v15 = v10;
          uint32_t v16 = 34;
        }

        _os_log_debug_impl(&dword_187528000, v15, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v17, v16);
LABEL_24:
        uint64_t result = &v8[*a3];
        break;
    }
  }

  return result;
}

uint64_t NEHelperTrackerCalculateParameterLen( int a1, int a2, unsigned __int8 *uu, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  if (a1) {
    int v13 = 6;
  }
  else {
    int v13 = 0;
  }
  int v14 = a2 + 5;
  if (!a2) {
    int v14 = 0;
  }
  int v15 = v14 + v13;
  int is_null = uuid_is_null(uu);
  int v17 = v15 + 21;
  if (is_null) {
    int v17 = v15;
  }
  if (a5) {
    BOOL v18 = a4 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = a5 + 5;
  if (v18) {
    int v19 = 0;
  }
  if (a7) {
    BOOL v20 = a6 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = a7 + 5;
  if (v20) {
    int v21 = 0;
  }
  unsigned int v22 = v21 + v19 + v17;
  if (a8) {
    return v22 + 9;
  }
  else {
    return v22;
  }
}

uint64_t NEHelperTrackerFillParameters( char *a1, size_t a2, int a3, _BYTE *a4, const unsigned __int8 *a5, const void *a6, uint64_t a7, const void *a8, uint64_t a9, int a10)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    bzero(a1, a2);
    BOOL v18 = a1;
    if (a3)
    {
      *a1 = 1;
      *(_DWORD *)(a1 + 1) = 1;
      a1[5] = a3;
      BOOL v18 = a1 + 6;
    }

    if (a4)
    {
      size_t v19 = *a4;
      if (*a4)
      {
        char *v18 = 2;
        *(_DWORD *)(v18 + 1) = v19;
        BOOL v20 = v18 + 5;
        memcpy(v20, a4, v19);
        BOOL v18 = &v20[v19];
      }
    }

    if (!uuid_is_null(a5))
    {
      char *v18 = 3;
      *(_DWORD *)(v18 + 1) = 16;
      *(_OWORD *)(v18 + 5) = *(_OWORD *)a5;
      v18 += 21;
    }

    if (a6 && a7)
    {
      char *v18 = 4;
      *(_DWORD *)(v18 + 1) = a7;
      if ((_DWORD)a7)
      {
        a7 = a7;
        memcpy(v18 + 5, a6, a7);
      }

      else
      {
        a7 = 0LL;
      }

      v18 += a7 + 5;
    }

    if (a8 && a9)
    {
      char *v18 = 5;
      *(_DWORD *)(v18 + 1) = a9;
      if ((_DWORD)a9)
      {
        uint64_t v21 = a9;
        memcpy(v18 + 5, a8, a9);
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      v18 += v21 + 5;
    }

    if (a10)
    {
      char *v18 = 6;
      *(_DWORD *)(v18 + 1) = 4;
      *(_DWORD *)(v18 + 5) = a10;
      LODWORD(v18) = (_DWORD)v18 + 9;
    }

    return ((_DWORD)v18 - (_DWORD)a1);
  }

  return result;
}

BOOL NEHelperTrackerAddIPForAllFlowsRedactLogs( int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6, CFStringRef theString, int a8)
{
  int v9 = a3;
  uint64_t v107 = *MEMORY[0x1895F89C0];
  uint64_t v106 = 0LL;
  memset(v105, 0, sizeof(v105));
  memset(v104, 0, 254);
  memset(v103, 0, 254);
  memset(out, 0, 37);
  *(void *)uu = 0LL;
  uint64_t v101 = 0LL;
  if (!a3 || !a4)
  {
    uint64_t v21 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    __int16 v23 = "is not";
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    *(_DWORD *)buf = 136315650;
    if (!v9) {
      __int16 v23 = "is";
    }
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = a4;
    int v24 = "%s: Invalid parameters - addresses %s null, count %d";
    uint64_t v25 = v21;
    uint32_t v26 = 28;
    goto LABEL_47;
  }

  if (a2 != 2 && a2 != 30)
  {
    int v27 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    int v24 = "%s: Invalid parameters - address family must be IPv4 / IPv6 (%d)";
    uint64_t v25 = v27;
    uint32_t v26 = 18;
    goto LABEL_47;
  }

  if (!a5)
  {
    BOOL v28 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    int v24 = "%s: Invalid parameters - app_info_ref is null";
    goto LABEL_46;
  }

  if (a1)
  {
    if (!a6)
    {
      BOOL v28 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result) {
        return result;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      int v24 = "%s: Invalid parameters - trackerDomainContextRef is null";
      goto LABEL_46;
    }

    int v15 = (const char *)NEHelperTrackerContextCopyDomain(a6, (char *)v104, 254LL, 0LL);
    __s = (char *)NEHelperTrackerContextCopyDomainOwner(a6, (char *)v103, 254LL, 0LL);
    if (!v15 || !__s)
    {
      BOOL v28 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result) {
        return result;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      int v24 = "%s: Failed to get domain/owner from context";
      goto LABEL_46;
    }

    size_t v16 = strlen(v15);
    if (v16 >= 2)
    {
      size_t v17 = v16 - 1;
      if (v15[v16 - 1] == 46)
      {
        __strncpy_chk();
        ne_session_trim_domain_domain_buffer[v17] = 0;
        int v15 = ne_session_trim_domain_domain_buffer;
      }
    }

    size_t v18 = strlen(v15);
    size_t v19 = strlen(__s) + 1;
    int v20 = (a1 == 3) | 2;
  }

  else
  {
    if (!theString
      || !CFStringGetCString(theString, NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer, 254LL, 0x8000100u))
    {
      BOOL v28 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result) {
        return result;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      int v24 = "%s: Invalid parameters - original domain NULL / invalid for NEHelperTrackerDispositionNotTracker";
      goto LABEL_46;
    }

    int v15 = NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer;
    size_t v29 = strlen(NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer);
    if (v29 >= 2)
    {
      size_t v30 = v29 - 1;
      if (NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer[v29 - 1] == 46)
      {
        int v15 = ne_session_trim_domain_domain_buffer;
        __strncpy_chk();
        ne_session_trim_domain_domain_buffer[v30] = 0;
      }
    }

    size_t v18 = strlen(v15);
    int v20 = 0;
    size_t v19 = 0LL;
    __s = 0LL;
  }

  uint64_t v68 = v18 + 1;
  uint64_t v69 = v19;
  if (v19 >= 0x40 || v18 + 1 >= 0x40) {
    int v32 = v20;
  }
  else {
    int v32 = v20 | 4;
  }
  if ((NEHelperTrackerGetAppUUID((uint64_t)a5, uu) & 1) == 0)
  {
    BOOL v28 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    int v24 = "%s: Failed to get app UUID from app_info_ref";
    goto LABEL_46;
  }

  if (uuid_is_null(uu))
  {
    BOOL v28 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    int v24 = "%s: NULL app UUID";
    goto LABEL_46;
  }

  if (a2 == 2) {
    int v33 = 16;
  }
  else {
    int v33 = 28;
  }
  int v34 = NEHelperTrackerCalculateParameterLen(a2, v33, uu, (uint64_t)v15, v68, (uint64_t)__s, v69, v32);
  if (v34)
  {
    int v67 = v34;
    if (v34 < 201)
    {
      __int128 v66 = v105;
    }

    else
    {
      __int128 v66 = malloc(v34);
      if (!v66)
      {
        BOOL v28 = (os_log_s *)ne_log_obj();
        BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          int v24 = "%s: Failed to allocate parameter buffer";
LABEL_46:
          uint64_t v25 = v28;
          uint32_t v26 = 12;
LABEL_47:
          _os_log_error_impl(&dword_187528000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
          return 0LL;
        }

        return result;
      }
    }

    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    memset(buf, 0, sizeof(buf));
    buf[1] = a2;
    if (a4 < 1)
    {
      int v35 = 0;
LABEL_115:
      int v37 = v66;
LABEL_116:
      if (v37 != v105) {
        free(v37);
      }
      return v35 == 0;
    }

    int v35 = 0;
    int v65 = v32;
    int v63 = v32 & 2;
    int v64 = v32 & 1;
    uint64_t v36 = a4;
    int v37 = v66;
    while (1)
    {
      if (a2 == 30)
      {
        buf[0] = 28;
        *(_OWORD *)&buf[8] = *(_OWORD *)*v9;
        uint64_t v38 = v69;
      }

      else
      {
        uint64_t v38 = v69;
        if (a2 != 2)
        {
          __int128 v62 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 v71 = 136315394;
            __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
            __int16 v73 = 1024;
            *(_DWORD *)__int128 v74 = a2;
            _os_log_error_impl( &dword_187528000,  v62,  OS_LOG_TYPE_ERROR,  "%s: Address with invalid family %d",  v71,  0x12u);
          }

          int v35 = 0;
          goto LABEL_116;
        }

        buf[0] = 16;
        *(_DWORD *)&uint8_t buf[4] = **v9;
      }

      int v39 = NEHelperTrackerFillParameters((char *)v37, v67, a2, buf, uu, v15, v68, __s, v38, v65);
      if (v39 != v67)
      {
        int v60 = v39;
        int v61 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 v71 = 136315650;
          __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v73 = 1024;
          *(_DWORD *)__int128 v74 = v67;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v60;
          _os_log_error_impl( &dword_187528000,  v61,  OS_LOG_TYPE_ERROR,  "%s: Failed to fill parameters <calculated len %d result len %d>",  v71,  0x18u);
        }

        goto LABEL_115;
      }

      int v35 = tracker_action(1, (char *)v37, v67);
      if (v35) {
        break;
      }
      if (nelog_is_debug_logging_enabled())
      {
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        *(_OWORD *)v89 = 0u;
        __int128 v90 = 0u;
        if (a2 == 2)
        {
          int v42 = 2;
          uint64_t v43 = &buf[4];
        }

        else
        {
          int v42 = 30;
          uint64_t v43 = &buf[8];
        }

        inet_ntop(v42, v43, v89, 0x40u);
        uuid_unparse_lower(uu, out);
        __int16 v51 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          int v52 = a5[14];
          if (!v52)
          {
            int v52 = a5[7];
            if (!v52)
            {
              int v52 = a5[30];
              if (!v52) {
                int v52 = a5[23];
              }
            }
          }

          *(_DWORD *)__int128 v71 = 136316162;
          __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v73 = 1024;
          *(_DWORD *)__int128 v74 = v52;
          *(_WORD *)&v74[4] = 2080;
          *(void *)&v74[6] = out;
          __int16 v75 = 1024;
          *(_DWORD *)__int128 v76 = v64;
          *(_WORD *)&v76[4] = 1024;
          *(_DWORD *)&v76[6] = v63;
          _os_log_impl( &dword_187528000,  v51,  OS_LOG_TYPE_DEFAULT,  "%s: completed for app <%d : %s> <app approved %d> <is_tracker %d>",  v71,  0x28u);
        }

        uint64_t v53 = (os_log_s *)ne_log_obj();
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
        if (a8)
        {
          if (v54)
          {
            int v55 = a5[14];
            if (!v55)
            {
              int v55 = a5[7];
              if (!v55)
              {
                int v55 = a5[30];
                if (!v55) {
                  int v55 = a5[23];
                }
              }
            }

            *(_DWORD *)__int128 v71 = 136318723;
            __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
            __int16 v73 = 2160;
            *(void *)__int128 v74 = 1752392040LL;
            *(_WORD *)&v74[8] = 1040;
            *(_DWORD *)&v74[10] = v68;
            __int16 v75 = 2101;
            *(void *)__int128 v76 = v15;
            *(_WORD *)&v76[8] = 2160;
            *(void *)&v76[10] = 1752392040LL;
            *(_WORD *)&v76[18] = 1040;
            LODWORD(v77) = v69;
            WORD2(v77) = 2101;
            *(void *)((char *)&v77 + 6) = __s;
            HIWORD(v77) = 1024;
            LODWORD(v78) = v55;
            WORD2(v78) = 2080;
            *(void *)((char *)&v78 + 6) = out;
            HIWORD(v78) = 2160;
            uint64_t v79 = 1752392040LL;
            *(_WORD *)char v80 = 1040;
            *(_DWORD *)&v80[2] = 64;
            __int16 v81 = 2101;
            __int128 v82 = v89;
            __int16 v83 = 1024;
            int v84 = v64;
            __int16 v85 = 1024;
            int v86 = v63;
            __int16 v87 = 1024;
            int v88 = 0;
            CFStringRef v56 = v53;
            __int16 v57 = "%s: completed for%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkex"
                  "tension:string}.*P app <%d : %s> %{sensitive, mask.hash, networkextension:string}.*P <app approved %d>"
                  " <is_tracker %d> (error = %d)";
            uint32_t v58 = 124;
            goto LABEL_111;
          }
        }

        else if (v54)
        {
          int v59 = a5[14];
          if (!v59)
          {
            int v59 = a5[7];
            if (!v59)
            {
              int v59 = a5[30];
              if (!v59) {
                int v59 = a5[23];
              }
            }
          }

          *(_DWORD *)__int128 v71 = 136317955;
          __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v73 = 1024;
          *(_DWORD *)__int128 v74 = v68;
          *(_WORD *)&v74[4] = 2081;
          *(void *)&v74[6] = v15;
          __int16 v75 = 1024;
          *(_DWORD *)__int128 v76 = v69;
          *(_WORD *)&v76[4] = 2081;
          *(void *)&v76[6] = __s;
          *(_WORD *)&v76[14] = 1024;
          *(_DWORD *)&v76[16] = v59;
          LOWORD(v77) = 2080;
          *(void *)((char *)&v77 + 2) = out;
          WORD5(v77) = 1024;
          HIDWORD(v77) = 64;
          LOWORD(v78) = 2081;
          *(void *)((char *)&v78 + 2) = v89;
          WORD5(v78) = 1024;
          HIDWORD(v78) = v64;
          LOWORD(v79) = 1024;
          *(_DWORD *)((char *)&v79 + 2) = v63;
          HIWORD(v79) = 1024;
          *(_DWORD *)char v80 = 0;
          CFStringRef v56 = v53;
          __int16 v57 = "%s: completed for<%d : %{private}s> <%d : %{private}s> app <%d : %s> <%d : %{private}s> <app approved %d"
                "> <is_tracker %d> (error = %d)";
          uint32_t v58 = 94;
LABEL_111:
          _os_log_debug_impl(&dword_187528000, v56, OS_LOG_TYPE_DEBUG, v57, v71, v58);
        }

LABEL_103:
        int v37 = v66;
      }

      ++v9;
      if (!--v36) {
        goto LABEL_116;
      }
    }

    __int128 v91 = 0u;
    __int128 v92 = 0u;
    *(_OWORD *)v89 = 0u;
    __int128 v90 = 0u;
    if (a2 == 2)
    {
      int v40 = 2;
      int v41 = &buf[4];
    }

    else
    {
      int v40 = 30;
      int v41 = &buf[8];
    }

    inet_ntop(v40, v41, v89, 0x40u);
    uuid_unparse_lower(uu, out);
    __int16 v44 = (os_log_s *)ne_log_obj();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (a8)
    {
      if (!v45) {
        goto LABEL_103;
      }
      int v46 = a5[14];
      if (!v46)
      {
        int v46 = a5[7];
        if (!v46)
        {
          int v46 = a5[30];
          if (!v46) {
            int v46 = a5[23];
          }
        }
      }

      *(_DWORD *)__int128 v71 = 136318723;
      __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v73 = 2160;
      *(void *)__int128 v74 = 1752392040LL;
      *(_WORD *)&v74[8] = 1040;
      *(_DWORD *)&v74[10] = v68;
      __int16 v75 = 2101;
      *(void *)__int128 v76 = v15;
      *(_WORD *)&v76[8] = 2160;
      *(void *)&v76[10] = 1752392040LL;
      *(_WORD *)&v76[18] = 1040;
      LODWORD(v77) = v69;
      WORD2(v77) = 2101;
      *(void *)((char *)&v77 + 6) = __s;
      HIWORD(v77) = 1024;
      LODWORD(v78) = v46;
      WORD2(v78) = 2080;
      *(void *)((char *)&v78 + 6) = out;
      HIWORD(v78) = 2160;
      uint64_t v79 = 1752392040LL;
      *(_WORD *)char v80 = 1040;
      *(_DWORD *)&v80[2] = 64;
      __int16 v81 = 2101;
      __int128 v82 = v89;
      __int16 v83 = 1024;
      int v84 = v64;
      __int16 v85 = 1024;
      int v86 = v63;
      __int16 v87 = 1024;
      int v88 = v35;
      __int16 v47 = v44;
      BOOL v48 = "%s: failed for%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:s"
            "tring}.*P app <%d : %s> %{sensitive, mask.hash, networkextension:string}.*P <app approved %d> <is_tracker %d> (error = %d)";
      uint32_t v49 = 124;
    }

    else
    {
      if (!v45) {
        goto LABEL_103;
      }
      int v50 = a5[14];
      if (!v50)
      {
        int v50 = a5[7];
        if (!v50)
        {
          int v50 = a5[30];
          if (!v50) {
            int v50 = a5[23];
          }
        }
      }

      *(_DWORD *)__int128 v71 = 136317955;
      __int128 v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v73 = 1024;
      *(_DWORD *)__int128 v74 = v68;
      *(_WORD *)&v74[4] = 2081;
      *(void *)&v74[6] = v15;
      __int16 v75 = 1024;
      *(_DWORD *)__int128 v76 = v69;
      *(_WORD *)&v76[4] = 2081;
      *(void *)&v76[6] = __s;
      *(_WORD *)&v76[14] = 1024;
      *(_DWORD *)&v76[16] = v50;
      LOWORD(v77) = 2080;
      *(void *)((char *)&v77 + 2) = out;
      WORD5(v77) = 1024;
      HIDWORD(v77) = 64;
      LOWORD(v78) = 2081;
      *(void *)((char *)&v78 + 2) = v89;
      WORD5(v78) = 1024;
      HIDWORD(v78) = v64;
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)char v80 = v35;
      __int16 v47 = v44;
      BOOL v48 = "%s: failed for<%d : %{private}s> <%d : %{private}s> app <%d : %s> <%d : %{private}s> <app approved %d> <is_t"
            "racker %d> (error = %d)";
      uint32_t v49 = 94;
    }

    _os_log_error_impl(&dword_187528000, v47, OS_LOG_TYPE_ERROR, v48, v71, v49);
    goto LABEL_103;
  }

  BOOL v28 = (os_log_s *)ne_log_obj();
  BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    int v24 = "%s: Failed to get calculate parameter size";
    goto LABEL_46;
  }

  return result;
}

BOOL NEHelperTrackerAddIPForAllFlows( int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6, const __CFString *a7)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(a1, a2, a3, a4, a5, a6, a7, 0);
}

BOOL NEHelperTrackerAddIPWithDisposition( int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(a1, a2, a3, a4, a5, a6, 0LL, 0);
}

BOOL NEHelperTrackerAddIP(int a1, _DWORD **a2, int a3, _DWORD *a4, unint64_t a5)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(1, a1, a2, a3, a4, a5, 0LL, 0);
}

BOOL NEHelperTrackerDumpIPEntries(int a1, char *buffer, size_t buffer_size, char *a4, size_t a5)
{
  BOOL result = 0LL;
  uint64_t v66 = *MEMORY[0x1895F89C0];
  char v53 = 0;
  unsigned int v52 = 0;
  __int16 v51 = 0LL;
  if (buffer)
  {
    if (buffer_size)
    {
      BOOL result = 0LL;
      if (a4)
      {
        if (a5 >= 0xFA)
        {
          int v11 = 0;
          int v12 = 3;
          if (a1 && (int)buffer_size >= 21)
          {
            int v13 = malloc(0x80uLL);
            if (v13)
            {
              int v14 = v13;
              void v13[6] = 0u;
              v13[7] = 0u;
              v13[4] = 0u;
              v13[5] = 0u;
              void v13[2] = 0u;
              v13[3] = 0u;
              _OWORD *v13 = 0u;
              v13[1] = 0u;
              *((_DWORD *)v13 + 30) = a1;
              if (NEHelperTrackerGetAppUUID((uint64_t)v13, uu) && !uuid_is_null(uu))
              {
                *__int128 buffer = 3;
                *(_DWORD *)(buffer + 1) = 16;
                *(_OWORD *)(buffer + 5) = *(_OWORD *)uu;
                uuid_unparse_lower(uu, out);
                int v11 = snprintf(a4, a5, "\n* Filter by pid %d (%s)\n\n", a1, out);
                uuid_clear(uu);
                memset(out, 0, 37);
                int v12 = 2;
              }

              else
              {
                int v11 = 0;
              }

              free(v14);
            }

            else
            {
              int v11 = 0;
            }
          }

          int v15 = tracker_action(v12, buffer, buffer_size);
          if (v15)
          {
            int v16 = v15;
            size_t v17 = (os_log_s *)ne_log_obj();
            BOOL result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
            if (!result) {
              return result;
            }
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v16;
            size_t v18 = "%s: Failed to dump tracker IP table entries <error %d>";
LABEL_16:
            size_t v19 = buf;
            goto LABEL_17;
          }

          uint64_t v22 = *(unsigned int *)buffer;
          __int16 v23 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v22;
            _os_log_debug_impl( &dword_187528000,  v23,  OS_LOG_TYPE_DEBUG,  "%s: received tlv buffer size is %d",  buf,  0x12u);
          }

          int v24 = snprintf( &a4[v11],  a5 - v11,  "%5s %36s %6s %40s %11s %s\n%5s %36s %6s %40s %11s %s\n",  "Count",  "App UUID",  "Family",  "Address",  "Flags",  "Domain - Owner",  "=====",  "========",  "======",  "=======",  "=====",  "==============");
          if ((_DWORD)v22)
          {
            int v25 = 0;
            int v49 = 0;
            int v50 = 0;
            uint8_t v48 = 0;
            uint32_t v26 = &buffer[v22 + 4];
            int v27 = v24 + v11;
            BOOL v28 = buffer + 4;
            int v46 = v26;
            uint64_t v45 = 0LL;
            do
            {
              size_t v29 = NEHelperTrackerParseTLV((uint64_t)v28, &v53, &v52, &v51);
              if (!v29) {
                break;
              }
              size_t v30 = a5 - v27;
              if (v30 <= 0xF9)
              {
                __int16 v44 = (os_log_s *)ne_log_obj();
                BOOL result = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
                if (!result) {
                  return result;
                }
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
                size_t v18 = "%s: Failed to dump tracker IP table entries - exceeded dump_buffer_size size";
                size_t v19 = buf;
                int v20 = v44;
                uint32_t v21 = 12;
                goto LABEL_18;
              }

              BOOL v28 = v29;
              if (v53 == 7)
              {
                char v31 = v51;
                int v32 = &v51[v52];
                int v47 = v25 + 1;
                int v33 = snprintf(&a4[v27], v30, "%5d ", v25 + 1) + v27;
                if (v31 < v32)
                {
                  while (1)
                  {
                    char v31 = NEHelperTrackerParseTLV((uint64_t)v31, &v53, &v52, &v51);
                    switch(v53)
                    {
                      case 1:
                        if (v52 != 1) {
                          goto LABEL_54;
                        }
                        uint8_t v48 = *v51;
                        int v34 = snprintf(&a4[v33], a5 - v33, "%6d ");
                        goto LABEL_53;
                      case 2:
                        __int128 v62 = 0u;
                        __int128 v63 = 0u;
                        __int128 v60 = 0u;
                        __int128 v61 = 0u;
                        __int128 v58 = 0u;
                        __int128 v59 = 0u;
                        memset(buf, 0, sizeof(buf));
                        buf[1] = v48;
                        if (v48 == 30)
                        {
                          if (v52 != 16)
                          {
                            size_t v17 = (os_log_s *)ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                              return 0LL;
                            }
LABEL_75:
                            *(_DWORD *)BOOL v54 = 136315394;
                            *(void *)&v54[4] = "NEHelperTrackerDumpIPEntries";
                            *(_WORD *)&v54[12] = 1024;
                            *(_DWORD *)&v54[14] = v52;
                            size_t v18 = "%s: IPv4 Address got invalid length %d";
LABEL_76:
                            size_t v19 = (uint8_t *)v54;
LABEL_17:
                            int v20 = v17;
                            uint32_t v21 = 18;
LABEL_18:
                            _os_log_error_impl(&dword_187528000, v20, OS_LOG_TYPE_ERROR, v18, v19, v21);
                            return 0LL;
                          }

                          buf[0] = 28;
                          uint64_t v36 = &buf[8];
                          *(_OWORD *)&buf[8] = *(_OWORD *)v51;
                          __int128 v55 = 0u;
                          __int128 v56 = 0u;
                          memset(v54, 0, sizeof(v54));
                          int v35 = 30;
                        }

                        else
                        {
                          if (v48 != 2)
                          {
                            size_t v17 = (os_log_s *)ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                              return 0LL;
                            }
                            *(_DWORD *)BOOL v54 = 136315394;
                            *(void *)&v54[4] = "NEHelperTrackerDumpIPEntries";
                            *(_WORD *)&v54[12] = 1024;
                            *(_DWORD *)&v54[14] = v48;
                            size_t v18 = "%s: Address with invalid family %d";
                            goto LABEL_76;
                          }

                          if (v52 != 4)
                          {
                            size_t v17 = (os_log_s *)ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                              return 0LL;
                            }
                            goto LABEL_75;
                          }

                          buf[0] = 16;
                          *(_DWORD *)&uint8_t buf[4] = *(_DWORD *)v51;
                          __int128 v55 = 0uLL;
                          __int128 v56 = 0uLL;
                          memset(v54, 0, sizeof(v54));
                          int v35 = 2;
                          uint64_t v36 = &buf[4];
                        }

                        inet_ntop(v35, v36, v54, 0x40u);
                        int v34 = snprintf(&a4[v33], a5 - v33, "%40s ");
LABEL_53:
                        v33 += v34;
                        goto LABEL_54;
                      case 3:
                        if (v52 != 16) {
                          goto LABEL_54;
                        }
                        *(_OWORD *)uu = *(_OWORD *)v51;
                        uuid_unparse_lower(uu, out);
                        int v34 = snprintf(&a4[v33], a5 - v33, "%s ");
                        goto LABEL_53;
                      case 4:
                        if (v52 < 2 || v51[v52 - 1]) {
                          goto LABEL_54;
                        }
                        int v34 = snprintf(&a4[v33], a5 - v33, "%s%-20s ");
                        goto LABEL_53;
                      case 5:
                        if (v52 < 2 || v51[v52 - 1]) {
                          goto LABEL_54;
                        }
                        int v34 = snprintf(&a4[v33], a5 - v33, "- %s");
                        goto LABEL_53;
                      case 6:
                        if (v52 != 4)
                        {
                          size_t v17 = (os_log_s *)ne_log_obj();
                          BOOL result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
                          if (!result) {
                            return result;
                          }
                          *(_DWORD *)buf = 136315394;
                          *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = v52;
                          size_t v18 = "%s: Flags with invalid size %d";
                          goto LABEL_16;
                        }

                        int v37 = *(_DWORD *)v51;
                        uint64_t v38 = snprintf(&a4[v33], a5 - v33, "<%2X: ", *(_DWORD *)v51) + (uint64_t)v33;
                        int v39 = "S";
                        if ((v37 & 4) == 0) {
                          int v39 = " ";
                        }
                        v50 += (v37 & 4) >> 2;
                        int v40 = v38 + snprintf(&a4[v38], a5 - v38, "%s", v39);
                        int v41 = "|T";
                        if ((v37 & 2) == 0) {
                          int v41 = "| ";
                        }
                        v49 += (v37 & 2) >> 1;
                        int v42 = v40 + snprintf(&a4[v40], a5 - v40, "%s", v41);
                        uint64_t v43 = "|A> ";
                        if ((v37 & 1) == 0) {
                          uint64_t v43 = "| > ";
                        }
                        int v33 = v42 + snprintf(&a4[v42], a5 - v42, "%s", v43);
LABEL_54:
                        if (v31 >= v32) {
                          goto LABEL_55;
                        }
                        break;
                      default:
                        goto LABEL_54;
                    }
                  }
                }

LABEL_55:
                int v27 = snprintf(&a4[v33], a5 - v33, "\n") + v33;
                uint32_t v26 = v46;
                int v25 = v47;
              }

              else if (v53 == 8 && v52 == 8)
              {
                uint64_t v45 = *(void *)v51;
              }
            }

            while (v28 < v26);
            if (v25 >= 1) {
              snprintf( &a4[v27],  a5 - v27,  "\n * Total count %d (short count %d) (total memory used %zu) (trackers %d non-trackers %d) (S=short T=track er A=app-approved)\n \n",  v25,  v50,  v45,  v49,  v25 - v49);
            }
          }

          return 1LL;
        }
      }
    }
  }

  return result;
}

uint64_t NEHelperTrackerGetDispositionWrapper(uint64_t a1, char *__s, char **a3, unint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  memset(v16, 0, sizeof(v16));
  if (*(void *)a1) {
    *(void *)&v16[0] = *(void *)a1;
  }
  size_t v8 = *(__int128 **)(a1 + 8);
  if (v8)
  {
    __int128 v9 = *v8;
    *(_OWORD *)((char *)&v16[1] + 8) = v8[1];
    *(_OWORD *)((char *)v16 + 8) = v9;
    *(_OWORD *)((char *)&v16[4] + 8) = 0u;
    *(_OWORD *)((char *)&v16[5] + 8) = 0u;
  }

  int v10 = *(const unsigned __int8 **)(a1 + 16);
  if (v10)
  {
    uuid_copy((unsigned __int8 *)&v16[2] + 8, v10);
    uuid_copy((unsigned __int8 *)&v16[6] + 8, UUID_NULL);
  }

  if (*(_BYTE *)(a1 + 32)) {
    HIDWORD(v17) |= 1u;
  }
  unint64_t v14 = 0LL;
  int DispositionForDomain = NEHelperTrackerGetDispositionForDomain(v16, __s, &v14, 1);
  if ((unint64_t)a3 | a4 && v14)
  {
    if (a3)
    {
      int v12 = (const char *)NEHelperTrackerContextCopyDomainOwner(v14, v15, 254LL, 0LL);
      if (v12) {
        *a3 = strndup(v12, 0xFDuLL);
      }
    }

    if (a4) {
      *(_BYTE *)a4 = NEHelperTrackerContextCanBlockRequest(v14);
    }
  }

  return dword_187556230[DispositionForDomain];
}

BOOL ne_session_manager_is_running()
{
  return get_current_notify_pid() != 0;
}

uint64_t get_current_notify_pid()
{
  if (get_current_notify_pid_sm_token < 0)
  {
    if (globals_init_sess_init != -1) {
      dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
    }
    if (!notify_register_dispatch( "com.apple.nesessionmanager",  &get_current_notify_pid_sm_token,  (dispatch_queue_t)g_queue,  &__block_literal_global_167)
      && notify_get_state(get_current_notify_pid_sm_token, (uint64_t *)&get_current_notify_pid_current_pid))
    {
      get_current_notify_pid_current_pid = 0LL;
    }
  }

  return get_current_notify_pid_current_pid;
}

void __get_current_notify_pid_block_invoke(int a1, int token)
{
  get_current_notify_pid_sm_token = token;
  if (notify_get_state(token, (uint64_t *)&get_current_notify_pid_current_pid))
  {
    get_current_notify_pid_current_pid = 0LL;
  }

  else if (get_current_notify_pid_current_pid)
  {
    update_all_session_clients();
  }

void update_all_session_clients()
{
  for (uint64_t i = g_sessions; i; uint64_t i = *(void *)(i + 48))
    fetch_status(i, 0LL, 0LL, 0LL);
}

void fetch_status(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
{
  uint64_t connection = get_connection(a1);
  if (connection)
  {
    __int128 v9 = (_xpc_connection_s *)connection;
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    int v11 = *(_DWORD *)(a1 + 32);
    xpc_dictionary_set_int64(v10, "SessionCommandType", 1LL);
    if (a4) {
      a4 = _Block_copy(a4);
    }
    if (a3) {
      dispatch_retain(a3);
    }
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __fetch_status_block_invoke_2;
    handler[3] = &unk_18A06E188;
    int v13 = v11;
    handler[4] = a4;
    void handler[5] = a1;
    handler[6] = a2;
    handler[7] = a3;
    xpc_connection_send_message_with_reply(v9, v10, (dispatch_queue_t)g_queue, handler);
    xpc_release(v10);
  }

  else if (a3 && a4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __fetch_status_block_invoke;
    block[3] = &unk_18A06E138;
    void block[4] = a4;
    int v15 = 0;
    dispatch_async(a3, block);
  }

uint64_t get_connection(uint64_t a1)
{
  uint64_t result = 0LL;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = g_sessions;
    if (g_sessions)
    {
      while (v3 != a1)
      {
        uint64_t v3 = *(void *)(v3 + 48);
        if (!v3) {
          return 0LL;
        }
      }

      if (*(_BYTE *)(a1 + 64)) {
        return 0LL;
      }
      uint64_t result = *(void *)(a1 + 40);
      if (!result)
      {
        xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
        getpid();
        uint64_t v5 = "com.apple.nesessionmanager";
        if (sandbox_check())
        {
          __int16 v6 = (os_log_s *)ne_log_obj();
          uint64_t v5 = "com.apple.nesessionmanager.flow-divert-token";
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            int v11 = "com.apple.nesessionmanager.flow-divert-token";
            _os_log_impl(&dword_187528000, v6, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
          }
        }

        mach_service = xpc_connection_create_mach_service(v5, (dispatch_queue_t)g_queue, 2uLL);
        uint64_t v8 = MEMORY[0x1895F87A8];
        *(void *)(a1 + 40) = mach_service;
        handler[0] = v8;
        handler[1] = 0x40000000LL;
        handler[2] = __get_connection_block_invoke;
        handler[3] = &__block_descriptor_tmp_179;
        handler[4] = a1;
        xpc_connection_set_event_handler(mach_service, handler);
        xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
        xpc_dictionary_set_int64(v4, "SessionClientType", 1LL);
        xpc_dictionary_set_uuid(v4, "SessionIdentifier", (const unsigned __int8 *)a1);
        xpc_dictionary_set_int64(v4, "SessionConfigType", *(int *)(a1 + 16));
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v4);
        xpc_release(v4);
        return *(void *)(a1 + 40);
      }
    }
  }

  return result;
}

uint64_t __fetch_status_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40));
}

void __fetch_status_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250])
  {
    int64_t int64 = xpc_dictionary_get_int64(a2, "SessionStatus");
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = g_sessions;
      if (g_sessions)
      {
        while (v8 != v7)
        {
          uint64_t v8 = *(void *)(v8 + 48);
          if (!v8) {
            goto LABEL_4;
          }
        }
      }
    }
  }

  else
  {
    int64_t int64 = 1LL;
  }

LABEL_4:
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    __int16 v6 = *(dispatch_queue_s **)(a1 + 56);
    if (v6)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __fetch_status_block_invoke_3;
      block[3] = &unk_18A06E160;
      void block[4] = v5;
      void block[5] = int64;
      void block[6] = v6;
      dispatch_async(v6, block);
    }
  }

  notify_cancel(ne_get_configuration_generation_configuration_changed_token);
  ne_get_configuration_generation_configuration_changed_token = -1;
  ne_get_configuration_generation_current_generation = 0LL;
  return ne_get_configuration_generation_current_generation;
}

  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __ne_session_establish_ipc_block_invoke_4;
  v5[3] = &unk_18A06DEE8;
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = v2;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v5);
}

  _Block_object_dispose(&v18, 8);
  return v8;
}

void set_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 32) != a3)
  {
    *(_DWORD *)(a1 + 32) = a3;
    for (uint64_t i = *(void *)(a1 + 24); i; uint64_t i = *(void *)(i + 8))
    {
      if (i != a2) {
        notify_client(i, 1);
      }
    }
  }

void __fetch_status_block_invoke_3(uint64_t a1)
{
}

void notify_client(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v3 = *(dispatch_queue_s **)(a1 + 32);
    if (v3)
    {
      xpc_object_t v4 = (unsigned int *)(a1 + 40);
      do
        unsigned int v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __notify_client_block_invoke;
      block[3] = &__block_descriptor_tmp_184;
      int v7 = a2;
      void block[4] = a1;
      void block[5] = 0LL;
      dispatch_async(v3, block);
    }
  }

void __notify_client_block_invoke(uint64_t a1)
{
  uint64_t v5 = 0LL;
  __int16 v6 = &v5;
  uint64_t v7 = 0x3002000000LL;
  uint64_t v8 = __Block_byref_object_copy_;
  __int128 v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  _DWORD v4[2] = __notify_client_block_invoke_182;
  v4[3] = &unk_18A06E1D0;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = &v5;
  v4[5] = v2;
  dispatch_sync((dispatch_queue_t)g_queue, v4);
  uint64_t v3 = v6[5];
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
    _Block_release((const void *)v6[5]);
  }

  ne_session_release(*(void *)(a1 + 32));
  _Block_object_dispose(&v5, 8);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void *__notify_client_block_invoke_182(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 40) + 24LL);
  if (result)
  {
    uint64_t result = _Block_copy(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  }

  return result;
}

void ne_session_release(uint64_t a1)
{
  CFStringRef v1 = (unsigned int *)(a1 + 40);
  do
  {
    unsigned int v2 = __ldxr(v1);
    unsigned int v3 = v2 - 1;
  }

  while (__stxr(v3, v1));
  if (!v3)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ne_session_release_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    void block[4] = a1;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }

void __ne_session_release_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2) {
    *(void *)(v2 + 16) = *(void *)(v1 + 16);
  }
  **(void **)(v1 + 16) = v2;
  unsigned int v3 = *(void **)v1;
  if (!*(void *)(*(void *)v1 + 24LL))
  {
    *((_BYTE *)v3 + 64) = 1;
    xpc_object_t v4 = (_xpc_connection_s *)*((void *)v3 + 5);
    if (v4)
    {
      xpc_connection_cancel(v4);
    }

    else
    {
      uint64_t v5 = *((void *)v3 + 6);
      if (v5) {
        *(void *)(v5 + 56) = *((void *)v3 + 7);
      }
      **((void **)v3 + 7) = v5;
      free(*(void **)v1);
      *(void *)uint64_t v1 = 0LL;
    }
  }

  ne_session_clear_event_handler(v1, 0);
  free((void *)v1);
}

void ne_session_clear_event_handler(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  unsigned int v3 = *(dispatch_queue_s **)(a1 + 32);
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  if (v3)
  {
    if (v4)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = __ne_session_clear_event_handler_block_invoke;
      block[3] = &unk_18A06E110;
      char v6 = a2;
      void block[4] = v4;
      void block[5] = v3;
      dispatch_async(v3, block);
    }

    else
    {
      dispatch_release(v3);
    }
  }

void __ne_session_clear_event_handler_block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __get_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = g_sessions;
  if (v2) {
    BOOL v4 = g_sessions == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    while (v3 != v2)
    {
      uint64_t v3 = *(void *)(v3 + 48);
      if (!v3) {
        return;
      }
    }

    if (a2)
    {
      if (MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9268])
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (*(void *)(v7 + 40))
        {
          xpc_connection_cancel(*(xpc_connection_t *)(v7 + 40));
          xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 40LL));
          *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
          uint64_t v7 = *(void *)(a1 + 32);
        }

        if (*(void *)(v7 + 24))
        {
          set_status(v7, 0LL, 1LL);
        }

        else
        {
          uint64_t v9 = *(void *)(v7 + 48);
          if (v9)
          {
            *(void *)(v9 + 56) = *(void *)(v7 + 56);
            uint64_t v7 = *(void *)(a1 + 32);
            uint64_t v9 = *(void *)(v7 + 48);
          }

          **(void **)(v7 + 56) = v9;
          free(*(void **)(a1 + 32));
        }
      }

      else if (MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250])
      {
        int64_t int64 = xpc_dictionary_get_int64(a2, "SessionNotificationType");
        switch(int64)
        {
          case 3LL:
            for (uint64_t i = *(void *)(*(void *)(a1 + 32) + 24LL); i; uint64_t i = *(void *)(i + 8))
              notify_client(i, 3);
            break;
          case 2LL:
            for (uint64_t j = *(void *)(*(void *)(a1 + 32) + 24LL); j; uint64_t j = *(void *)(j + 8))
              notify_client(j, 1);
            break;
          case 1LL:
            fetch_status(*(void *)(a1 + 32), 0LL, 0LL, 0LL);
            break;
        }
      }
    }
  }

dispatch_queue_t __globals_init_block_invoke()
{
  pid_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("ne_session queue", v0);
  g_queue = (uint64_t)result;
  g_sessions = 0LL;
  return result;
}

uint64_t ne_session_manager_get_pid()
{
  return get_current_notify_pid();
}

uint64_t ne_session_manager_has_active_sessions()
{
  int check = 0;
  int v0 = ne_session_manager_get_info_current_info_token;
  if (ne_session_manager_get_info_current_info_token < 0)
  {
    if (notify_register_check("com.apple.nesessionmanager.info", &ne_session_manager_get_info_current_info_token))
    {
      ne_session_manager_get_info_current_info_token = -1;
      return ne_session_manager_get_info_current_info & 1;
    }

    int v0 = ne_session_manager_get_info_current_info_token;
    if (ne_session_manager_get_info_current_info_token < 0) {
      return ne_session_manager_get_info_current_info & 1;
    }
  }

  if (notify_check(v0, &check)
    || check
    && notify_get_state( ne_session_manager_get_info_current_info_token,  (uint64_t *)&ne_session_manager_get_info_current_info))
  {
    notify_cancel(ne_session_manager_get_info_current_info_token);
    ne_session_manager_get_info_current_info_token = -1;
    ne_session_manager_get_info_current_info = 0LL;
  }

  return ne_session_manager_get_info_current_info & 1;
}

BOOL ne_session_should_disable_nexus()
{
  int check = 0;
  int v0 = ne_session_should_disable_nexus_disable_nexus_token;
  if (ne_session_should_disable_nexus_disable_nexus_token < 0)
  {
    if (notify_register_check( "com.apple.networkextension.disable-nexus",  &ne_session_should_disable_nexus_disable_nexus_token))
    {
      ne_session_should_disable_nexus_disable_nexus_token = -1;
      return ne_session_should_disable_nexus_current_state != 0;
    }

    int v0 = ne_session_should_disable_nexus_disable_nexus_token;
    if (ne_session_should_disable_nexus_disable_nexus_token < 0) {
      return ne_session_should_disable_nexus_current_state != 0;
    }
  }

  if (notify_check(v0, &check)
    || check
    && notify_get_state( ne_session_should_disable_nexus_disable_nexus_token,  (uint64_t *)&ne_session_should_disable_nexus_current_state))
  {
    notify_cancel(ne_session_should_disable_nexus_disable_nexus_token);
    ne_session_should_disable_nexus_disable_nexus_token = -1;
    ne_session_should_disable_nexus_current_state = 0LL;
  }

  return ne_session_should_disable_nexus_current_state != 0;
}

BOOL ne_session_disable_restrictions()
{
  int check = 0;
  int v0 = ne_session_disable_restrictions_disable_restrictions_token;
  if (ne_session_disable_restrictions_disable_restrictions_token < 0)
  {
    if (notify_register_check( "com.apple.networkextension.disable-restrictions",  &ne_session_disable_restrictions_disable_restrictions_token))
    {
      ne_session_disable_restrictions_disable_restrictions_token = -1;
      return ne_session_disable_restrictions_current_state != 0;
    }

    int v0 = ne_session_disable_restrictions_disable_restrictions_token;
    if (ne_session_disable_restrictions_disable_restrictions_token < 0) {
      return ne_session_disable_restrictions_current_state != 0;
    }
  }

  if (notify_check(v0, &check)
    || check
    && notify_get_state( ne_session_disable_restrictions_disable_restrictions_token,  (uint64_t *)&ne_session_disable_restrictions_current_state))
  {
    notify_cancel(ne_session_disable_restrictions_disable_restrictions_token);
    ne_session_disable_restrictions_disable_restrictions_token = -1;
    ne_session_disable_restrictions_current_state = 0LL;
  }

  return ne_session_disable_restrictions_current_state != 0;
}

BOOL ne_session_fallback_advisory()
{
  int check = 0;
  int v0 = ne_session_fallback_advisory_fallback_advisory_token;
  if (ne_session_fallback_advisory_fallback_advisory_token < 0)
  {
    if (notify_register_check( "com.apple.symptoms.hasAlternateAdvice",  &ne_session_fallback_advisory_fallback_advisory_token))
    {
      ne_session_fallback_advisory_fallback_advisory_token = -1;
      return ne_session_fallback_advisory_current_state != 0;
    }

    int v0 = ne_session_fallback_advisory_fallback_advisory_token;
    if (ne_session_fallback_advisory_fallback_advisory_token < 0) {
      return ne_session_fallback_advisory_current_state != 0;
    }
  }

  if (notify_check(v0, &check)
    || check
    && notify_get_state( ne_session_fallback_advisory_fallback_advisory_token,  (uint64_t *)&ne_session_fallback_advisory_current_state))
  {
    notify_cancel(ne_session_fallback_advisory_fallback_advisory_token);
    ne_session_fallback_advisory_fallback_advisory_token = -1;
    ne_session_fallback_advisory_current_state = 0LL;
  }

  return ne_session_fallback_advisory_current_state != 0;
}

uint64_t ne_session_fallback_default()
{
  int check = 0;
  int v0 = ne_session_fallback_default_fallback_default_token;
  if (ne_session_fallback_default_fallback_default_token < 0)
  {
    if (notify_register_check( "com.apple.networkextension.fallback-default",  &ne_session_fallback_default_fallback_default_token))
    {
      ne_session_fallback_default_fallback_default_token = -1;
      return ne_session_fallback_default_current_state;
    }

    int v0 = ne_session_fallback_default_fallback_default_token;
    if (ne_session_fallback_default_fallback_default_token < 0) {
      return ne_session_fallback_default_current_state;
    }
  }

  if (notify_check(v0, &check)
    || check
    && notify_get_state( ne_session_fallback_default_fallback_default_token,  (uint64_t *)&ne_session_fallback_default_current_state))
  {
    notify_cancel(ne_session_fallback_default_fallback_default_token);
    ne_session_fallback_default_fallback_default_token = -1;
    ne_session_fallback_default_current_state = 0LL;
  }

  return ne_session_fallback_default_current_state;
}

uint64_t ne_get_configuration_generation()
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v0 = ne_get_configuration_generation_configuration_changed_token;
  if (ne_get_configuration_generation_configuration_changed_token < 0)
  {
    if (notify_register_check( "com.apple.neconfigurationchanged",  &ne_get_configuration_generation_configuration_changed_token))
    {
      ne_get_configuration_generation_configuration_changed_token = -1;
      return ne_get_configuration_generation_current_generation;
    }

    int v0 = ne_get_configuration_generation_configuration_changed_token;
    if (ne_get_configuration_generation_configuration_changed_token < 0) {
      return ne_get_configuration_generation_current_generation;
    }
  }

  int check = 0;
  uint32_t v1 = notify_check(v0, &check);
  if (!v1)
  {
    if (!check) {
      return ne_get_configuration_generation_current_generation;
    }
    uint64_t v8 = 0LL;
    uint32_t state = notify_get_state(ne_get_configuration_generation_configuration_changed_token, &v8);
    if (!state)
    {
      ne_get_configuration_generation_current_generation = v8 & 0x1FFFFFFFFFFFFFLL;
      return ne_get_configuration_generation_current_generation;
    }

    uint32_t v5 = state;
    uint64_t v3 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315650;
    int v11 = "com.apple.neconfigurationchanged";
    __int16 v12 = 1024;
    int v13 = ne_get_configuration_generation_configuration_changed_token;
    __int16 v14 = 1024;
    uint32_t v15 = v5;
    char v6 = "notify_get_state failed for %s, token = %d: %u";
    goto LABEL_16;
  }

  uint32_t v2 = v1;
  uint64_t v3 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    int v11 = "com.apple.neconfigurationchanged";
    __int16 v12 = 1024;
    int v13 = ne_get_configuration_generation_configuration_changed_token;
    __int16 v14 = 1024;
    uint32_t v15 = v2;
    char v6 = "notify_check failed for %s, token = %d: %u";
LABEL_16:
    _os_log_error_impl(&dword_187528000, v3, OS_LOG_TYPE_ERROR, v6, buf, 0x18u);
  }

uint64_t ne_session_use_as_system_vpn()
{
  return 1LL;
}

unint64_t ne_session_on_demand_configs_present()
{
  return (unint64_t)get_current_config_state() >> 63;
}

uint64_t get_current_config_state()
{
  int check = 0;
  int v0 = get_current_config_state_config_token;
  if (get_current_config_state_config_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &get_current_config_state_config_token))
    {
      get_current_config_state_config_token = -1;
      return get_current_config_state_current_state;
    }

    int v0 = get_current_config_state_config_token;
    if (get_current_config_state_config_token < 0) {
      return get_current_config_state_current_state;
    }
  }

  if (notify_check(v0, &check)
    || check
    && notify_get_state(get_current_config_state_config_token, (uint64_t *)&get_current_config_state_current_state))
  {
    notify_cancel(get_current_config_state_config_token);
    get_current_config_state_config_token = -1;
    get_current_config_state_current_uint32_t state = 0LL;
  }

  return get_current_config_state_current_state;
}

unint64_t ne_session_vod_evaluate_connection_present()
{
  return ((unint64_t)get_current_config_state() >> 54) & 1;
}

unint64_t ne_session_app_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 62) & 1;
}

unint64_t ne_session_always_on_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 61) & 1;
}

uint64_t ne_session_always_on_vpn_configs_present_at_boot()
{
  if ((get_current_config_state() & 0x2000000000000000LL) != 0) {
    return 1LL;
  }
  int v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1) {
    return 0LL;
  }
  int v1 = v0;
  memset(&v9, 0, sizeof(v9));
  if (fstat(v0, &v9)) {
    st_size_t size = 0LL;
  }
  else {
    st_size_t size = v9.st_size;
  }
  if ((unint64_t)(st_size - 1) <= 0x27FE && (uint64_t v3 = malloc(st_size)) != 0LL)
  {
    BOOL v4 = v3;
    if (pread(v1, v3, st_size, 0LL) == st_size && (uint32_t v5 = (void *)xpc_create_from_plist()) != 0LL)
    {
      char v6 = v5;
      BOOL v7 = xpc_dictionary_get_int64(v5, "drop_all_feature_always_on_vpn") != 0;
      xpc_release(v6);
    }

    else
    {
      BOOL v7 = 0LL;
    }

    free(v4);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  close(v1);
  return v7;
}

uint64_t ne_session_is_always_on_vpn_enabled(dispatch_object_s *a1, const void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  ne_session_is_always_on_vpn_enabled_enabled = ne_session_always_on_vpn_configs_present_at_boot();
  BOOL v4 = (dispatch_object_s *)ne_session_is_always_on_vpn_enabled_queue;
  if ((dispatch_object_s *)ne_session_is_always_on_vpn_enabled_queue != a1
    || ne_session_is_always_on_vpn_enabled_handler != (void)a2)
  {
    if (ne_session_is_always_on_vpn_enabled_notify_token != -1)
    {
      notify_cancel(ne_session_is_always_on_vpn_enabled_notify_token);
      ne_session_is_always_on_vpn_enabled_notify_token = -1;
      BOOL v4 = (dispatch_object_s *)ne_session_is_always_on_vpn_enabled_queue;
    }

    if (v4)
    {
      dispatch_release(v4);
      ne_session_is_always_on_vpn_enabled_queue = 0LL;
    }

    if (ne_session_is_always_on_vpn_enabled_handler)
    {
      _Block_release((const void *)ne_session_is_always_on_vpn_enabled_handler);
      ne_session_is_always_on_vpn_enabled_uint64_t handler = 0LL;
    }
  }

  if (a1)
  {
    if (a2)
    {
      ne_session_is_always_on_vpn_enabled_queue = (uint64_t)a1;
      dispatch_retain(a1);
      ne_session_is_always_on_vpn_enabled_uint64_t handler = (uint64_t)_Block_copy(a2);
      uint32_t v6 = notify_register_dispatch( "com.apple.neconfigurationchanged",  &ne_session_is_always_on_vpn_enabled_notify_token,  (dispatch_queue_t)ne_session_is_always_on_vpn_enabled_queue,  &__block_literal_global_137);
      if (v6)
      {
        uint32_t v7 = v6;
        uint64_t v8 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315394;
          int v11 = "com.apple.neconfigurationchanged";
          __int16 v12 = 1024;
          uint32_t v13 = v7;
          _os_log_error_impl( &dword_187528000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to register for %s notifications in ne_session_is_always_on_vpn_enabled: %u",  (uint8_t *)&v10,  0x12u);
        }
      }
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  return ne_session_is_always_on_vpn_enabled_enabled;
}

void __ne_session_is_always_on_vpn_enabled_block_invoke(uint64_t a1, int a2)
{
  current_config_uint32_t state = get_current_config_state();
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  if (ne_session_is_always_on_vpn_enabled_notify_token != a2
    || ((uint64_t v4 = current_config_state & 0x2000000000000000LL,
         ne_session_is_always_on_vpn_enabled_enabled != (current_config_state & 0x2000000000000000uLL) >> 61)
      ? (BOOL v5 = ne_session_is_always_on_vpn_enabled_handler == 0)
      : (BOOL v5 = 1),
        v5))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  }

  else
  {
    ne_session_is_always_on_vpn_enabled_enabled = (current_config_state & 0x2000000000000000uLL) >> 61;
    uint32_t v6 = (void (**)(void *, BOOL))_Block_copy((const void *)ne_session_is_always_on_vpn_enabled_handler);
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
    if (v6)
    {
      v6[2](v6, v4 != 0);
      _Block_release(v6);
    }
  }

unint64_t ne_session_vpn_include_all_networks_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 55) & 1;
}

unint64_t ne_session_content_filter_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 60) & 1;
}

unint64_t ne_session_dns_proxy_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 59) & 1;
}

unint64_t ne_session_path_controller_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 58) & 1;
}

unint64_t ne_session_dns_settings_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 57) & 1;
}

unint64_t ne_session_local_communication_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 56) & 1;
}

unint64_t ne_session_relay_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 53) & 1;
}

uint64_t ne_session_create(uint64_t a1, int a2)
{
  uint64_t v8 = 0LL;
  stat v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  uint64_t v11 = 0LL;
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_create_block_invoke;
  block[3] = &unk_18A06DC28;
  int v7 = a2;
  void block[4] = &v8;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  uint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__ne_session_create_block_invoke(uint64_t a1)
{
  uint64_t v2 = g_sessions;
  if (g_sessions)
  {
    while (uuid_compare(*(const unsigned __int8 **)(a1 + 40), (const unsigned __int8 *)v2)
         || *(_DWORD *)(v2 + 16) != *(_DWORD *)(a1 + 48)
         || *(_BYTE *)(v2 + 64))
    {
      uint64_t v2 = *(void *)(v2 + 48);
      if (!v2) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_6:
    dispatch_queue_t result = malloc(0x48uLL);
    if (!result) {
      return result;
    }
    uint64_t v2 = (uint64_t)result;
    result[8] = 0LL;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)dispatch_queue_t result = 0u;
    *((_OWORD *)result + 3) = 0u;
    uint64_t v4 = result + 6;
    uuid_copy((unsigned __int8 *)result, *(const unsigned __int8 **)(a1 + 40));
    *(_DWORD *)(v2 + 16) = *(_DWORD *)(a1 + 48);
    *(void *)(v2 + 24) = 0LL;
    *(_DWORD *)(v2 + 32) = 1;
    uint64_t v5 = g_sessions;
    *uint64_t v4 = g_sessions;
    if (v5) {
      *(void *)(v5 + 56) = v4;
    }
    g_sessions = v2;
    *(void *)(v2 + 56) = &g_sessions;
  }

  dispatch_queue_t result = malloc(0x30uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  uint32_t v6 = *(_OWORD **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  *uint32_t v6 = 0u;
  v6[1] = 0u;
  _DWORD v6[2] = 0u;
  **(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v2;
  int v7 = (unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 40LL);
  do
    unsigned int v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  uint64_t v11 = *(void *)(v2 + 24);
  uint64_t v10 = (void *)(v2 + 24);
  uint64_t v9 = v11;
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 8LL) = v11;
  if (v11) {
    *(void *)(v9 + 16) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 8LL;
  }
  void *v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 16LL) = v10;
  return result;
}

uint64_t ne_session_retain(uint64_t result)
{
  int v1 = (unsigned int *)(result + 40);
  do
    unsigned int v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

void ne_session_set_event_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_set_event_handler_block_invoke;
  block[3] = &unk_18A06DC70;
  void block[4] = a3;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_set_event_handler_block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (v1)
  {
    ne_session_clear_event_handler(a1[5], 0);
    uint64_t v3 = (void *)a1[4];
    if (v3) {
      uint64_t v3 = _Block_copy(v3);
    }
    *(void *)(v1 + 24) = v3;
    uint64_t v4 = (dispatch_object_s *)a1[6];
    *(void *)(v1 + 32) = v4;
    if (v4) {
      dispatch_retain(v4);
    }
  }

  if (get_current_notify_pid()) {
    update_all_session_clients();
  }
}

void ne_session_cancel(uint64_t a1)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_cancel_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  void block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_cancel_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    ne_session_clear_event_handler(v1, 1);
  }
}

void ne_session_get_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_get_status_block_invoke;
  block[3] = &unk_18A06DD08;
  void block[5] = a1;
  void block[6] = a2;
  void block[4] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_status_block_invoke(uint64_t a1)
{
  unsigned int v2 = *(uint64_t **)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 32));
  uint64_t v4 = (unsigned int *)(*(void *)(a1 + 40) + 40LL);
  do
    unsigned int v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  uint64_t v6 = *v2;
  uint64_t v7 = g_sessions;
  if (*v2) {
    BOOL v8 = g_sessions == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_11;
  }
  while (v7 != v6)
  {
    uint64_t v7 = *(void *)(v7 + 48);
    if (!v7) {
      goto LABEL_11;
    }
  }

  if (*(_BYTE *)(v6 + 64) || !*(void *)(v6 + 40))
  {
LABEL_11:
    if (get_current_notify_pid())
    {
      uint64_t v9 = *v2;
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 0x40000000LL;
      _DWORD v17[2] = __ne_session_get_status_block_invoke_2;
      v17[3] = &unk_18A06DCB8;
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(dispatch_queue_s **)(a1 + 48);
      v17[4] = v3;
      v17[5] = v10;
      v17[6] = v11;
      fetch_status(v9, (uint64_t)v2, v10, v17);
      return;
    }

    int v12 = 1;
  }

  else
  {
    int v12 = *(_DWORD *)(v6 + 32);
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_get_status_block_invoke_3;
  block[3] = &unk_18A06DCE0;
  int v16 = v12;
  uint64_t v14 = *(void *)(a1 + 40);
  uint32_t v13 = *(dispatch_queue_s **)(a1 + 48);
  void block[4] = v3;
  void block[5] = v13;
  void block[6] = v14;
  dispatch_async(v13, block);
}

void __ne_session_get_status_block_invoke_2(uint64_t a1)
{
}

void __ne_session_get_status_block_invoke_3(uint64_t a1)
{
}

const char *ne_session_info_type_to_string(int a1)
{
  else {
    return off_18A06E640[a1 - 1];
  }
}

void ne_session_local_communication_send_info( uint64_t a1, int a2, uint64_t a3, dispatch_object_t object, const void *a5)
{
  uint64_t v10 = _Block_copy(a5);
  uint64_t v11 = (unsigned int *)(a1 + 40);
  do
    unsigned int v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_local_communication_send_info_block_invoke;
  block[3] = &unk_18A06DDD0;
  void block[4] = v10;
  void block[5] = a1;
  int v14 = a2;
  void block[6] = object;
  void block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_local_communication_send_info_block_invoke(uint64_t a1)
{
  if (!get_current_notify_pid())
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __ne_session_local_communication_send_info_block_invoke_2_29;
    v10[3] = &unk_18A06DDA8;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 48);
    void v10[4] = *(void *)(a1 + 32);
    void v10[5] = v6;
    void v10[6] = v7;
    BOOL v8 = v10;
LABEL_8:
    dispatch_async(v6, v8);
    return;
  }

  uint64_t connection = get_connection(**(void **)(a1 + 40));
  if (!connection)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ne_session_local_communication_send_info_block_invoke_2;
    block[3] = &unk_18A06DD30;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 48);
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v6;
    void block[6] = v9;
    BOOL v8 = block;
    goto LABEL_8;
  }

  uint64_t v3 = (_xpc_connection_s *)connection;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 7LL);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  unsigned int v5 = *(void **)(a1 + 56);
  if (v5) {
    xpc_dictionary_set_value(v4, "SessionAppPushCallInfo", v5);
  }
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 0x40000000LL;
  handler[2] = __ne_session_local_communication_send_info_block_invoke_3;
  handler[3] = &unk_18A06DD80;
  int v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(void *)(a1 + 32);
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_local_communication_send_info_block_invoke_2(uint64_t a1)
{
}

void __ne_session_local_communication_send_info_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a2 && (uint64_t v4 = MEMORY[0x1895A89D8](a2), v5 = MEMORY[0x1895F9250], v4 == MEMORY[0x1895F9250]))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "SessionAppPushSendMessageResult");
    uint64_t v7 = value;
    if (!value) {
      goto LABEL_6;
    }
    if (MEMORY[0x1895A89D8](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
      *(_DWORD *)buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2080;
      uint32_t v15 = string;
      _os_log_error_impl(&dword_187528000, v6, OS_LOG_TYPE_ERROR, "Failed to send info with type %d: %s", buf, 0x12u);
    }
  }

  uint64_t v7 = 0LL;
LABEL_6:
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __ne_session_local_communication_send_info_block_invoke_25;
  v11[3] = &unk_18A06DD58;
  v11[4] = *(void *)(a1 + 32);
  void v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_local_communication_send_info_block_invoke_2_29(uint64_t a1)
{
}

void __ne_session_local_communication_send_info_block_invoke_25(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(void *)(a1 + 56));
}

uint64_t ne_session_map_interface_to_provider_uuid(const char *a1, uuid_t uu)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uuid_clear(uu);
  if (a1)
  {
    getpid();
    uint64_t v4 = "com.apple.nesessionmanager";
    if (sandbox_check())
    {
      uint64_t v5 = (os_log_s *)ne_log_obj();
      uint64_t v4 = "com.apple.nesessionmanager.flow-divert-token";
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v17 = "com.apple.nesessionmanager.flow-divert-token";
        _os_log_impl(&dword_187528000, v5, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
      }
    }

    mach_service = xpc_connection_create_mach_service(v4, (dispatch_queue_t)g_queue, 2uLL);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_36);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 3LL);
    xpc_dictionary_set_string(empty, "InterfaceMapInfo", a1);
    xpc_connection_resume(mach_service);
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (!v8)
    {
      uint64_t v11 = 0LL;
LABEL_19:
      xpc_release(empty);
      xpc_connection_cancel(mach_service);
      xpc_release(mach_service);
      return v11;
    }

    int v9 = v8;
    if (MEMORY[0x1895A89D8](v8) == MEMORY[0x1895F9250])
    {
      uuid = xpc_dictionary_get_uuid(v9, "MachOUUID");
      if (uuid)
      {
        *(_OWORD *)uu = *(_OWORD *)uuid;
        int v13 = (os_log_s *)ne_log_obj();
        uint64_t v11 = 1LL;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          __int128 v17 = a1;
          __int16 v18 = 1040;
          int v19 = 16;
          __int16 v20 = 2096;
          unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v21 = uu;
          _os_log_impl( &dword_187528000,  v13,  OS_LOG_TYPE_INFO,  "Mapped interface %s to provider UUID: %{uuid_t}.16P",  buf,  0x1Cu);
        }

        goto LABEL_18;
      }

      __int16 v14 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl( &dword_187528000,  v14,  OS_LOG_TYPE_DEBUG,  "Error mapping interface to provider UUID: malformed response from nesessionmanager.",  buf,  2u);
      }
    }

    else if (MEMORY[0x1895A89D8](v9) == MEMORY[0x1895F9268])
    {
      uint64_t v10 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_187528000,  v10,  OS_LOG_TYPE_ERROR,  "Error sending a map interface message to nesessionmanager.",  buf,  2u);
      }
    }

    uint64_t v11 = 0LL;
LABEL_18:
    xpc_release(v9);
    goto LABEL_19;
  }

  return 0LL;
}

void __ne_session_map_interface_to_provider_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9268])
  {
    unsigned int v2 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl( &dword_187528000,  v2,  OS_LOG_TYPE_ERROR,  "Error sending a map interface message to nesessionmanager.",  v3,  2u);
    }
  }

uint64_t ne_session_set_device_communication_exception(BOOL a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  getpid();
  unsigned int v2 = "com.apple.nesessionmanager";
  if (sandbox_check())
  {
    uint64_t v3 = (os_log_s *)ne_log_obj();
    unsigned int v2 = "com.apple.nesessionmanager.flow-divert-token";
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "ne_session_set_device_communication_exception";
      __int16 v21 = 2080;
      uint64_t v22 = "com.apple.nesessionmanager.flow-divert-token";
      _os_log_impl(&dword_187528000, v3, OS_LOG_TYPE_INFO, "%s: Falling back to %s", buf, 0x16u);
    }
  }

  mach_service = xpc_connection_create_mach_service(v2, (dispatch_queue_t)g_queue, 2uLL);
  if (mach_service)
  {
    uint64_t v5 = mach_service;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __ne_session_set_device_communication_exception_block_invoke;
    handler[3] = &__block_descriptor_tmp_40;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 4LL);
    xpc_dictionary_set_BOOL(empty, "DeviceCommunicationExceptionEnable", a1);
    xpc_connection_resume(v5);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, empty);
    if (!v7)
    {
      uint64_t v11 = 0LL;
LABEL_25:
      xpc_release(empty);
      xpc_release(v5);
      return v11;
    }

    xpc_object_t v8 = v7;
    if (MEMORY[0x1895A89D8](v7) == MEMORY[0x1895F9250])
    {
      BOOL v12 = xpc_dictionary_get_BOOL(v8, "DeviceCommunicationExceptionResult");
      int v13 = (os_log_s *)ne_log_obj();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          uint32_t v15 = "disabled";
          if (a1) {
            uint32_t v15 = "enabled";
          }
          *(_DWORD *)buf = 136315138;
          __int16 v20 = v15;
          uint64_t v11 = 1LL;
          _os_log_impl(&dword_187528000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException succeeded: %s", buf, 0xCu);
        }

        else
        {
          uint64_t v11 = 1LL;
        }

        goto LABEL_24;
      }

      if (v14)
      {
        uint64_t v16 = "disabled";
        if (a1) {
          uint64_t v16 = "enabled";
        }
        *(_DWORD *)buf = 136315138;
        __int16 v20 = v16;
        _os_log_impl(&dword_187528000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException failed: %s", buf, 0xCu);
      }
    }

    else if (MEMORY[0x1895A89D8](v8) == MEMORY[0x1895F9268])
    {
      int v9 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v20 = v2;
        _os_log_error_impl( &dword_187528000,  v9,  OS_LOG_TYPE_ERROR,  "Error sending a DeviceCommunicationException message to %s",  buf,  0xCu);
      }
    }

    uint64_t v11 = 0LL;
LABEL_24:
    xpc_release(v8);
    goto LABEL_25;
  }

  uint64_t v10 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "ne_session_set_device_communication_exception";
    __int16 v21 = 2080;
    uint64_t v22 = v2;
    _os_log_error_impl( &dword_187528000,  v10,  OS_LOG_TYPE_ERROR,  "%s: Error failed to create connection to %s",  buf,  0x16u);
  }

  return 0LL;
}

void __ne_session_set_device_communication_exception_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9268])
  {
    uint64_t v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315138;
      uint64_t v6 = v4;
      _os_log_error_impl( &dword_187528000,  v3,  OS_LOG_TYPE_ERROR,  "XPC Event - Error sending a DeviceCommunicationException message to %s",  (uint8_t *)&v5,  0xCu);
    }
  }

void ne_session_get_info(uint64_t a1, int a2, dispatch_object_t object, const void *a4)
{
}

void ne_session_get_info_with_parameters( uint64_t a1, int a2, uint64_t a3, char a4, dispatch_object_t object, const void *a6)
{
  BOOL v12 = _Block_copy(a6);
  int v13 = (unsigned int *)(a1 + 40);
  do
    unsigned int v14 = __ldxr(v13);
  while (__stxr(v14 + 1, v13));
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_get_info_with_parameters_block_invoke;
  block[3] = &unk_18A06E2B8;
  char v17 = a4;
  void block[4] = v12;
  void block[5] = a1;
  int v16 = a2;
  void block[6] = object;
  void block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_info_with_parameters_block_invoke(uint64_t a1)
{
  if (!get_current_notify_pid() && !*(_BYTE *)(a1 + 68))
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = __ne_session_get_info_with_parameters_block_invoke_2_190;
    v10[3] = &unk_18A06E290;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 48);
    void v10[4] = *(void *)(a1 + 32);
    void v10[5] = v6;
    void v10[6] = v9;
    xpc_object_t v8 = v10;
    goto LABEL_9;
  }

  uint64_t connection = get_connection(**(void **)(a1 + 40));
  if (!connection)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 0x40000000LL;
    v14[2] = __ne_session_get_info_with_parameters_block_invoke_2;
    v14[3] = &unk_18A06E218;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(dispatch_queue_s **)(a1 + 48);
    v14[4] = *(void *)(a1 + 32);
    void v14[5] = v6;
    v14[6] = v7;
    xpc_object_t v8 = v14;
LABEL_9:
    dispatch_async(v6, v8);
    return;
  }

  uint64_t v3 = (_xpc_connection_s *)connection;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 6LL);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  int v5 = *(void **)(a1 + 56);
  if (v5) {
    xpc_dictionary_set_value(v4, "SessionOptions", v5);
  }
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 0x40000000LL;
  handler[2] = __ne_session_get_info_with_parameters_block_invoke_3;
  handler[3] = &unk_18A06E268;
  int v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(void *)(a1 + 32);
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_get_info_with_parameters_block_invoke_2(uint64_t a1)
{
}

void __ne_session_get_info_with_parameters_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a2 && (uint64_t v4 = MEMORY[0x1895A89D8](a2), v5 = MEMORY[0x1895F9250], v4 == MEMORY[0x1895F9250]))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "SessionInfo");
    uint64_t v7 = value;
    if (!value) {
      goto LABEL_6;
    }
    if (MEMORY[0x1895A89D8](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
      *(_DWORD *)buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2080;
      uint32_t v15 = string;
      _os_log_error_impl(&dword_187528000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch info with type %d: %s", buf, 0x12u);
    }
  }

  uint64_t v7 = 0LL;
LABEL_6:
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __ne_session_get_info_with_parameters_block_invoke_187;
  v11[3] = &unk_18A06E240;
  v11[4] = *(void *)(a1 + 32);
  void v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_get_info_with_parameters_block_invoke_2_190(uint64_t a1)
{
}

void __ne_session_get_info_with_parameters_block_invoke_187(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(void *)(a1 + 56));
}

void ne_session_get_info2(uint64_t a1, int a2, char a3, dispatch_object_t object, const void *a5)
{
}

void ne_session_send_barrier(uint64_t a1)
{
  uint64_t v7 = 0LL;
  xpc_object_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 0LL;
  uint64_t v1 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_send_barrier_block_invoke;
  block[3] = &unk_18A06DE58;
  void block[4] = &v7;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  if (v8[3])
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
    dispatch_time_t v3 = dispatch_time(0LL, 1000000000LL);
    dispatch_retain(v2);
    uint64_t v4 = (_xpc_connection_s *)v8[3];
    barrier[0] = v1;
    barrier[1] = 0x40000000LL;
    barrier[2] = __ne_session_send_barrier_block_invoke_2;
    barrier[3] = &__block_descriptor_tmp_46;
    barrier[4] = v2;
    xpc_connection_send_barrier(v4, barrier);
    dispatch_semaphore_wait(v2, v3);
    dispatch_release(v2);
    xpc_release((xpc_object_t)v8[3]);
  }

  _Block_object_dispose(&v7, 8);
}

xpc_object_t __ne_session_send_barrier_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = get_connection(**(void **)(a1 + 40));
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result) {
    return xpc_retain(result);
  }
  return result;
}

void __ne_session_send_barrier_block_invoke_2(uint64_t a1)
{
}

void ne_session_start_on_behalf_of(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_53;
  int v8 = a3;
  int v9 = a4;
  int v10 = a6;
  int v11 = a5;
  int v12 = a7;
  void block[4] = a1;
  void block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_start_on_behalf_of_block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = *(uint64_t **)(a1 + 32);
  uint64_t connection = get_connection(*v2);
  if (connection)
  {
    uint64_t v4 = (_xpc_connection_s *)connection;
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 2LL);
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_int64(v5, "SessionGroupID", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_int64(v5, "SessionUserID", *(unsigned int *)(a1 + 60));
    xpc_dictionary_set_int64(v5, "SessionPID", *(int *)(a1 + 64));
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6) {
      xpc_dictionary_set_value(v5, "SessionOptions", v6);
    }
    xpc_connection_send_message(v4, v5);
    xpc_release(v5);
    uint64_t v7 = 2LL;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  set_status(*v2, 0LL, v7);
}

void ne_session_start_with_options(uint64_t a1, uint64_t a2)
{
  int v4 = *MEMORY[0x1895F9630];
  mach_port_name_t v5 = audit_session_self();
  uid_t v6 = geteuid();
  gid_t v7 = getegid();
  pid_t v8 = getpid();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_53;
  int v10 = v4;
  mach_port_name_t v11 = v5;
  gid_t v12 = v7;
  uid_t v13 = v6;
  pid_t v14 = v8;
  void block[4] = a1;
  void block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void ne_session_start(uint64_t a1)
{
}

void ne_session_stop(uint64_t a1)
{
  v1[0] = MEMORY[0x1895F87A8];
  v1[1] = 0x40000000LL;
  v1[2] = __ne_session_stop_with_reason_block_invoke;
  v1[3] = &__block_descriptor_tmp_194;
  v1[4] = a1;
  int v2 = 1;
  dispatch_sync((dispatch_queue_t)g_queue, v1);
}

void __ne_session_stop_with_reason_block_invoke(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 32);
  if (get_current_notify_pid())
  {
    uint64_t connection = get_connection(*v2);
    if (connection)
    {
      int v4 = (_xpc_connection_s *)connection;
      xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v5, "SessionCommandType", 3LL);
      xpc_dictionary_set_int64(v5, "SessionStopReason", *(int *)(a1 + 40));
      xpc_connection_send_message(v4, v5);
      xpc_release(v5);
      uint64_t v6 = 5LL;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    set_status(*v2, 0LL, v6);
  }

void ne_session_get_configuration_id( const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a1, uuid_t dst)
{
}

void ne_session_establish_ipc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __ne_session_establish_ipc_block_invoke;
  block[3] = &unk_18A06DF38;
  void block[4] = a3;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_establish_ipc_block_invoke(uint64_t a1)
{
  uint64_t connection = (_xpc_connection_s *)get_connection(**(void **)(a1 + 40));
  dispatch_time_t v3 = _Block_copy(*(const void **)(a1 + 32));
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  int v4 = (unsigned int *)(*(void *)(a1 + 40) + 40LL);
  do
    unsigned int v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  if (connection)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v6, "SessionCommandType", 4LL);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __ne_session_establish_ipc_block_invoke_3;
    v9[3] = &unk_18A06DF10;
    v9[4] = v3;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    xpc_connection_send_message_with_reply(connection, v6, (dispatch_queue_t)g_queue, v9);
    xpc_release(v6);
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ne_session_establish_ipc_block_invoke_2;
    block[3] = &unk_18A06DEC0;
    uint64_t v8 = *(void *)(a1 + 40);
    gid_t v7 = *(dispatch_queue_s **)(a1 + 48);
    void block[4] = v3;
    void block[5] = v7;
    void block[6] = v8;
    dispatch_async(v7, block);
  }

void __ne_session_establish_ipc_block_invoke_2(uint64_t a1)
{
}

void __ne_session_establish_ipc_block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = a2;
  if (a2)
  {
    if (MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250])
    {
      xpc_object_t value = xpc_dictionary_get_value(v2, "SessionPrimaryPluginEndpoint");
      int v2 = value;
      if (!value) {
        goto LABEL_4;
      }
      if (MEMORY[0x1895A89D8](value) == MEMORY[0x1895F9260])
      {
        xpc_retain(v2);
        goto LABEL_4;
      }
    }

    int v2 = 0LL;
  }

void __ne_session_establish_ipc_block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v2 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_debug_impl( &dword_187528000,  v2,  OS_LOG_TYPE_DEBUG,  "Establish IPC returning primary = %p",  (uint8_t *)&v5,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  dispatch_time_t v3 = *(void **)(a1 + 40);
  if (v3) {
    xpc_release(v3);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(void *)(a1 + 56));
}

uint64_t ne_session_add_necp_drop_dest_from_path(const char *a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v20 = 0;
  memset(v19, 0, sizeof(v19));
  size_t v18 = 324LL;
  if (sysctlbyname("net.necp.drop_dest_level", 0LL, &v18, 0LL, 0LL))
  {
    uint64_t v2 = *__error();
    dispatch_time_t v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = strerror(v2);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v4;
      int v5 = "%s: get len sysctlbyname(net.necp.drop_dest_level) failed %s";
LABEL_7:
      _os_log_error_impl(&dword_187528000, v3, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&buf, 0x16u);
    }
  }

  else if (sysctlbyname("net.necp.drop_dest_level", v19, &v18, 0LL, 0LL))
  {
    uint64_t v2 = *__error();
    dispatch_time_t v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = strerror(v2);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v6;
      int v5 = "%s: get sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_7;
    }
  }

  else
  {
    int v7 = open(a1, 0);
    if (v7 == -1)
    {
      uint64_t v2 = *__error();
      pid_t v14 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint32_t v15 = strerror(v2);
        buf.st_dev = 136315650;
        *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)a1;
        HIWORD(buf.st_gid) = 2080;
        *(void *)&buf.st_rdev = v15;
        _os_log_error_impl(&dword_187528000, v14, OS_LOG_TYPE_ERROR, "%s: open(%s) failed %s", (uint8_t *)&buf, 0x20u);
      }
    }

    else
    {
      int v8 = v7;
      if (fstat(v7, &buf)) {
        st_size_t size = 0LL;
      }
      else {
        st_size_t size = buf.st_size;
      }
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0) {
          uint64_t v2 = 0LL;
        }
        else {
          uint64_t v2 = 27LL;
        }
      }

      else
      {
        int8x16_t v10 = malloc(st_size);
        if (v10)
        {
          mach_port_name_t v11 = v10;
          if (pread(v8, v10, st_size, 0LL) == st_size)
          {
            uint64_t v12 = xpc_create_from_plist();
            if (v12)
            {
              uid_t v13 = (void *)v12;
              if (MEMORY[0x1895A89D8]() == MEMORY[0x1895F9220]) {
                uint64_t v2 = ne_session_parse_necp_drop_dest_array(v13, (uint64_t)v19);
              }
              else {
                uint64_t v2 = 22LL;
              }
              xpc_release(v13);
            }

            else
            {
              uint64_t v2 = 22LL;
            }
          }

          else
          {
            uint64_t v2 = 0LL;
          }

          free(v11);
        }

        else
        {
          uint64_t v2 = 55LL;
        }
      }

      close(v8);
    }

    if (!(_DWORD)v2)
    {
      if (!sysctlbyname("net.necp.drop_dest_level", 0LL, 0LL, v19, 0x144uLL)) {
        return 0LL;
      }
      uint64_t v2 = *__error();
      dispatch_time_t v3 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = strerror(v2);
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v16;
        int v5 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
        goto LABEL_7;
      }
    }
  }

  return v2;
}

uint64_t ne_session_parse_necp_drop_dest_array(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (xpc_array_get_count(a1))
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v9 = 0x2000000000LL;
    char v10 = 1;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    _DWORD v7[2] = __ne_session_parse_necp_drop_dest_array_block_invoke;
    v7[3] = &unk_18A06E300;
    v7[4] = &buf;
    v7[5] = a2;
    xpc_array_apply(a1, v7);
    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
      uint64_t v4 = 0LL;
    }
    else {
      uint64_t v4 = 22LL;
    }
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    int v5 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array";
      _os_log_error_impl(&dword_187528000, v5, OS_LOG_TYPE_ERROR, "%s: empty array", (uint8_t *)&buf, 0xCu);
    }

    return 0LL;
  }

  return v4;
}

BOOL __ne_session_parse_necp_drop_dest_array_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if (**(_DWORD **)(a1 + 40) == 8)
  {
    dispatch_time_t v3 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (result)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
      _os_log_error_impl(&dword_187528000, v3, OS_LOG_TYPE_ERROR, "%s: too many entries", (uint8_t *)&buf, 0xCu);
      return 0LL;
    }

    return result;
  }

  if (!a3 || MEMORY[0x1895A89D8](a3) != MEMORY[0x1895F9250])
  {
    int v7 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v51 = 136315138;
      *(void *)&v51[4] = "ne_parse_necp_drop_dest_dictionary";
      _os_log_error_impl(&dword_187528000, v7, OS_LOG_TYPE_ERROR, "%s: item is not a dictionary", v51, 0xCu);
    }

    goto LABEL_47;
  }

  uint64_t v46 = 0LL;
  int v47 = &v46;
  uint64_t v48 = 0x2000000000LL;
  int v49 = -1;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2000000000LL;
  uint64_t v45 = 0LL;
  uint64_t v38 = 0LL;
  int v39 = &v38;
  uint64_t v40 = 0x2000000000LL;
  int v41 = -1;
  uint64_t v34 = 0LL;
  int v35 = &v34;
  uint64_t v36 = 0x2000000000LL;
  char v37 = 1;
  *(void *)&__int128 buf = MEMORY[0x1895F87A8];
  *((void *)&buf + 1) = 0x40000000LL;
  char v53 = __ne_parse_necp_drop_dest_dictionary_block_invoke;
  BOOL v54 = &unk_18A06E328;
  __int128 v58 = &v34;
  __int128 v59 = a3;
  __int128 v55 = &v46;
  __int128 v56 = &v42;
  __int16 v57 = &v38;
  xpc_dictionary_apply(a3, &buf);
  if (!*((_BYTE *)v35 + 24)) {
    goto LABEL_46;
  }
  unsigned int v8 = *((_DWORD *)v47 + 6);
  uint64_t v9 = (const char *)v43[3];
  int v10 = *((_DWORD *)v39 + 6);
  *(_OWORD *)int v50 = 0uLL;
  *(void *)&v50[21] = 0LL;
  *(void *)&v50[16] = 0LL;
  if (v9)
  {
    if (v8 > 0xB || ((1 << v8) & 0xC1A) == 0)
    {
      int v24 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)__int16 v51 = 136315394;
      *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
      *(_WORD *)&v51[12] = 1024;
      *(_DWORD *)&v51[14] = v8;
      uint32_t v15 = "%s: bad priority level %d";
LABEL_35:
      uint64_t v16 = v24;
      uint32_t v17 = 18;
      goto LABEL_36;
    }

    int v11 = inet_pton(30, v9, &v50[9]);
    if (v11 == 1)
    {
      __int16 v19 = 7708;
    }

    else
    {
      if (v11 == -1)
      {
        uint64_t v12 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uid_t v13 = __error();
          pid_t v14 = strerror(*v13);
          *(_DWORD *)__int16 v51 = 136315650;
          *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
          *(_WORD *)&v51[12] = 2080;
          *(void *)&v51[14] = v9;
          *(_WORD *)&v51[22] = 2080;
          *(void *)&v51[24] = v14;
          uint32_t v15 = "%s: inet_pton(AF_INET6, %s) failed %s";
          uint64_t v16 = v12;
          uint32_t v17 = 32;
LABEL_36:
          _os_log_error_impl(&dword_187528000, v16, OS_LOG_TYPE_ERROR, v15, v51, v17);
          goto LABEL_46;
        }

        goto LABEL_46;
      }

      int v20 = inet_pton(2, v9, &v50[5]);
      if (v20 != 1)
      {
        if (v20 != -1)
        {
          char v31 = (os_log_s *)ne_log_obj();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)__int16 v51 = 136315394;
          *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
          *(_WORD *)&v51[12] = 2080;
          *(void *)&v51[14] = v9;
          uint32_t v15 = "%s: bad address %s";
          uint64_t v16 = v31;
          uint32_t v17 = 22;
          goto LABEL_36;
        }

        __int16 v21 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = __error();
          uint64_t v23 = strerror(*v22);
          *(_DWORD *)__int16 v51 = 136315650;
          *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
          *(_WORD *)&v51[12] = 2080;
          *(void *)&v51[14] = v9;
          *(_WORD *)&v51[22] = 2080;
          *(void *)&v51[24] = v23;
          _os_log_error_impl( &dword_187528000,  v21,  OS_LOG_TYPE_ERROR,  "%s: inet_pton(AF_INET, %s) failed %s",  v51,  0x20u);
        }

LABEL_27:
        v50[0] = v10;
        if ((v10 - 129) <= 0xFFFFFF7F && v50[2] == 30)
        {
          int v24 = (os_log_s *)ne_log_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)__int16 v51 = 136315394;
          *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
          *(_WORD *)&v51[12] = 1024;
          *(_DWORD *)&v51[14] = v50[0];
          uint32_t v15 = "%s: bad IPv6 prefix %d";
          goto LABEL_35;
        }

        if ((v10 - 33) <= 0xFFFFFFDF && v50[2] == 2)
        {
          int v24 = (os_log_s *)ne_log_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)__int16 v51 = 136315394;
          *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
          *(_WORD *)&v51[12] = 1024;
          *(_DWORD *)&v51[14] = v50[0];
          uint32_t v15 = "%s: bad IPv4 prefix %d";
          goto LABEL_35;
        }

        *(_DWORD *)__int16 v51 = v8;
        *(_OWORD *)&v51[8] = *(_OWORD *)v50;
        *(_OWORD *)&v51[21] = *(_OWORD *)&v50[13];
        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        int v25 = *(unsigned int **)(a1 + 40);
        unint64_t v26 = *v25;
        if ((_DWORD)v26)
        {
          uint64_t v27 = 0LL;
          int v28 = v51[8];
          size_t v29 = (unsigned __int8 *)v25 + 13;
          BOOL v30 = 1;
          do
          {
            if (*(_DWORD *)(v29 - 9) == v8 && *(v29 - 1) == v28 && !memcmp(v29, &v51[9], *v29)) {
              break;
            }
            BOOL v30 = ++v27 < v26;
            v29 += 40;
          }

          while (v26 != v27);
          if (v30) {
            return 1LL;
          }
        }

        else
        {
          LODWORD(v26) = 0;
        }

        int v33 = &v25[10 * v26];
        *(_OWORD *)(v33 + 1) = *(_OWORD *)v51;
        *(_OWORD *)(v33 + 5) = *(_OWORD *)&v51[16];
        *(void *)(v33 + 9) = *(void *)&v51[32];
        ++**(_DWORD **)(a1 + 40);
        return 1LL;
      }

      __int16 v19 = 528;
    }

    *(_WORD *)&v50[1] = v19;
    goto LABEL_27;
  }

  size_t v18 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int16 v51 = 136315138;
    *(void *)&v51[4] = "ne_parse_necp_drop_dest_entry";
    uint32_t v15 = "%s: address_str is NULL";
    uint64_t v16 = v18;
    uint32_t v17 = 12;
    goto LABEL_36;
  }

  unsigned int v8 = (os_log_s *)ne_log_obj();
  BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: invalid port";
LABEL_31:
    pid_t v14 = (uint8_t *)v15;
LABEL_32:
    _os_log_impl(&dword_187528000, v8, OS_LOG_TYPE_INFO, v9, v14, 2u);
    return 0LL;
  }

  return result;
}

          if (v5 == ++v6) {
            return v2;
          }
        }
      }
    }
  }

  return 0LL;
}

LABEL_46:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
LABEL_47:
  int v32 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
    _os_log_error_impl(&dword_187528000, v32, OS_LOG_TYPE_ERROR, "%s: not valid", (uint8_t *)&buf, 0xCu);
  }

  BOOL result = 0LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  return result;
}

uint64_t __ne_parse_necp_drop_dest_dictionary_block_invoke(uint64_t a1, char *__s1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!strcmp(__s1, "Level"))
  {
    xpc_object_t value = (char *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 64), "Level");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = ne_session_get_necp_level_from_xpc_value(value);
    return 1LL;
  }

  if (!strcmp(__s1, "Address"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = xpc_dictionary_get_string( *(xpc_object_t *)(a1 + 64),  "Address");
    return 1LL;
  }

  if (!strcmp(__s1, "Prefix"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = xpc_dictionary_get_int64( *(xpc_object_t *)(a1 + 64),  "Prefix");
    return 1LL;
  }

  uint64_t v4 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    unsigned int v8 = "ne_parse_necp_drop_dest_dictionary_block_invoke";
    __int16 v9 = 2080;
    int v10 = __s1;
    _os_log_error_impl(&dword_187528000, v4, OS_LOG_TYPE_ERROR, "%s: unexpected key %s", (uint8_t *)&v7, 0x16u);
  }

  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  return result;
}

char *ne_session_get_necp_level_from_xpc_value(char *result)
{
  if (result)
  {
    uint64_t v1 = result;
    string_ptr = (char *)xpc_string_get_string_ptr(result);
    if (!string_ptr)
    {
      unint64_t value = xpc_int64_get_value(v1);
      if (value > 0xA) {
        return 0LL;
      }
      string_ptr = ne_necp_legacy_level_to_string_mapping[value];
    }

    uint64_t v4 = &ne_necp_policy_string_to_level_mapping;
    uint64_t result = "Unknown";
    while (strcasecmp(result, string_ptr))
    {
      int v5 = v4[2];
      v4 += 2;
      uint64_t result = v5;
      if (!v5) {
        return result;
      }
    }

    return (char *)*((unsigned int *)v4 + 2);
  }

  return result;
}

uint64_t ne_session_add_necp_drop_dest_from_dest_list( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  int v37 = 0;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (!a1
    || MEMORY[0x1895A89D8]( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v17,  *((void *)&v17 + 1),  v18,  *((void *)&v18 + 1),  v19,  *((void *)&v19 + 1),  v20,  *((void *)&v20 + 1),  v21,  *((void *)&v21 + 1),  v22,  *((void *)&v22 + 1),  v23,  *((void *)&v23 + 1),  v24,  *((void *)&v24 + 1),  v25,  *((void *)&v25 + 1),  v26,  *((void *)&v26 + 1),  v27,  *((void *)&v27 + 1),  v28,  *((void *)&v28 + 1),  v29,  *((void *)&v29 + 1),  v30,  *((void *)&v30 + 1),  v31,  *((void *)&v31 + 1),  v32,  *((void *)&v32 + 1),  v33) != MEMORY[0x1895F9220])
  {
    uint64_t v9 = 22LL;
LABEL_4:
    int v10 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return v9;
    }
    uint32_t v15 = __error();
    uint64_t v16 = strerror(*v15);
    *(_DWORD *)__int128 buf = 136315394;
    int v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    __int16 v40 = 2080;
    int v41 = v16;
    pid_t v14 = "%s: failed %s";
LABEL_11:
    _os_log_error_impl(&dword_187528000, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    return v9;
  }

  uint64_t v9 = ne_session_parse_necp_drop_dest_array(a1, (uint64_t)&v17);
  if ((_DWORD)v9) {
    goto LABEL_4;
  }
  if (!sysctlbyname("net.necp.drop_dest_level", 0LL, 0LL, &v17, 0x144uLL)) {
    return 0LL;
  }
  uint64_t v9 = *__error();
  int v10 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = __error();
    uid_t v13 = strerror(*v12);
    *(_DWORD *)__int128 buf = 136315394;
    int v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    __int16 v40 = 2080;
    int v41 = v13;
    pid_t v14 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
    goto LABEL_11;
  }

  return v9;
}

uint64_t ne_session_initialize_necp_drop_dest()
{
  uint64_t v0 = 0LL;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  LODWORD(v39) = 0;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v1 = "/var/mobile/Library/terminus/com.apple.necp_drop_dest.plist";
  uint64_t v2 = &off_18A06DF60;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v3 = MEMORY[0x1895F9220];
  do
  {
    int v4 = open( v1,  0,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39);
    if (v4 != -1)
    {
      int v5 = v4;
      if (fstat(v4, &v40)) {
        st_size_t size = 0LL;
      }
      else {
        st_size_t size = v40.st_size;
      }
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0) {
          uint64_t v0 = v0;
        }
        else {
          uint64_t v0 = 27LL;
        }
      }

      else
      {
        int v7 = malloc(st_size);
        if (v7)
        {
          unsigned int v8 = v7;
          if (pread(v5, v7, st_size, 0LL) == st_size)
          {
            uint64_t v9 = xpc_create_from_plist();
            if (v9)
            {
              int v10 = (void *)v9;
              if (MEMORY[0x1895A89D8]() == v3) {
                uint64_t v0 = ne_session_parse_necp_drop_dest_array(v10, (uint64_t)&v19);
              }
              else {
                uint64_t v0 = 22LL;
              }
              xpc_release(v10);
            }

            else
            {
              uint64_t v0 = 22LL;
            }
          }

          free(v8);
        }

        else
        {
          uint64_t v0 = 55LL;
        }
      }

      close(v5);
    }

    uint64_t v11 = *v2++;
    uint64_t v1 = v11;
  }

  while (v11);
  if ((_DWORD)v0)
  {
    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uid_t v13 = __error();
      pid_t v14 = strerror(*v13);
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v14;
      uint32_t v15 = "%s: failed %s";
LABEL_28:
      _os_log_error_impl(&dword_187528000, v12, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v40, 0x16u);
    }
  }

  else
  {
    if (!sysctlbyname("net.necp.drop_dest_level", 0LL, 0LL, &v19, 0x144uLL)) {
      return 0LL;
    }
    uint64_t v0 = *__error();
    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = __error();
      __int128 v17 = strerror(*v16);
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v17;
      uint32_t v15 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_28;
    }
  }

  return v0;
}

void *necp_drop_dest_copy_dest_entry_list()
{
  *(void *)((char *)&v39[40] + 2) = *MEMORY[0x1895F89C0];
  size_t v25 = 0LL;
  if (!sysctlbyname("net.necp.drop_dest_level", 0LL, &v25, 0LL, 0LL))
  {
    size_t v25 = 324LL;
    if (sysctlbyname("net.necp.drop_dest_level", &v36, &v25, 0LL, 0LL))
    {
      uint64_t v0 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
        return 0LL;
      }
      __int128 v21 = __error();
      __int128 v22 = strerror(*v21);
      *(_DWORD *)string = 136315394;
      __int128 v33 = "necp_drop_dest_copy_dest_entry_list";
      __int16 v34 = 2080;
      __int128 v35 = v22;
      uint64_t v3 = "%s: sysctlbyname(net.necp.drop_dest_level) failed %s";
LABEL_29:
      int v4 = string;
      goto LABEL_30;
    }

    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    if (!v7)
    {
      uint64_t v0 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
        return 0LL;
      }
      __int128 v18 = __error();
      __int128 v19 = strerror(*v18);
      *(_DWORD *)string = 136315394;
      __int128 v33 = "necp_drop_dest_copy_dest_entry_list";
      __int16 v34 = 2080;
      __int128 v35 = v19;
      uint64_t v3 = "%s: xpc_array_create() failed %s";
      goto LABEL_29;
    }

    int v5 = v7;
    uint64_t v8 = 0LL;
    while (1)
    {
      xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v9)
      {
        __int128 v20 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          __int128 v23 = __error();
          __int128 v24 = strerror(*v23);
          *(_DWORD *)__int128 buf = 136315394;
          __int128 v27 = "necp_drop_dest_copy_dest_entry_list";
          __int16 v28 = 2080;
          *(void *)__int128 v29 = v24;
          _os_log_error_impl( &dword_187528000,  v20,  OS_LOG_TYPE_ERROR,  "%s: xpc_dictionary_create() failed %s",  buf,  0x16u);
        }

        xpc_release(v5);
        return 0LL;
      }

      int v10 = v9;
      uint64_t v11 = (char *)&v36 + v8 * 8;
      int v12 = LOBYTE(v39[v8]);
      if (v12 == 30)
      {
        if (v11[13] != 28) {
          goto LABEL_19;
        }
        inet_ntop(30, (char *)&v39[v8] + 7, string, 0x2Eu);
        xpc_object_t xpc_string_from_necp_level = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v11 + 1));
        xpc_dictionary_set_value(v10, "Level", xpc_string_from_necp_level);
        xpc_release(xpc_string_from_necp_level);
        xpc_dictionary_set_int64(v10, "Prefix", v11[12]);
        xpc_dictionary_set_string(v10, "Address", string);
        pid_t v14 = (os_log_s *)ne_log_obj();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
      }

      else
      {
        if (v12 != 2) {
          goto LABEL_19;
        }
        if (v11[13] != 16) {
          goto LABEL_19;
        }
        inet_ntop(2, (char *)&v39[v8] + 3, string, 0x2Eu);
        xpc_object_t v13 = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v11 + 1));
        xpc_dictionary_set_value(v10, "Level", v13);
        xpc_release(v13);
        xpc_dictionary_set_int64(v10, "Prefix", v11[12]);
        xpc_dictionary_set_string(v10, "Address", string);
        pid_t v14 = (os_log_s *)ne_log_obj();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
      }

      int v16 = *((_DWORD *)v11 + 1);
      int v17 = v11[12];
      *(_DWORD *)__int128 buf = 136315906;
      __int128 v27 = "necp_drop_dest_copy_dest_entry_list";
      __int16 v28 = 1024;
      *(_DWORD *)__int128 v29 = v16;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v17;
      __int16 v30 = 2080;
      __int128 v31 = string;
      _os_log_impl(&dword_187528000, v14, OS_LOG_TYPE_INFO, "%s: level %u prefix %u address %s", buf, 0x22u);
LABEL_19:
      if (xpc_dictionary_get_count(v10)) {
        xpc_array_append_value(v5, v10);
      }
      xpc_release(v10);
      v8 += 5LL;
      if (v8 == 40) {
        return v5;
      }
    }
  }

  uint64_t v0 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v1 = __error();
    uint64_t v2 = strerror(*v1);
    int v36 = 136315394;
    __int128 v37 = "necp_drop_dest_copy_dest_entry_list";
    __int16 v38 = 2080;
    v39[0] = v2;
    uint64_t v3 = "%s: sysctlbyname(net.necp.drop_dest_level) failed %s";
    int v4 = (char *)&v36;
LABEL_30:
    _os_log_error_impl(&dword_187528000, v0, OS_LOG_TYPE_ERROR, v3, (uint8_t *)v4, 0x16u);
  }

  return 0LL;
}

xpc_object_t ne_session_create_xpc_string_from_necp_level(unsigned int a1)
{
  if (a1 > 0xB) {
    return xpc_string_create("Unknown");
  }
  if (LODWORD((&ne_necp_policy_string_to_level_mapping)[2 * a1 + 1]) != a1)
  {
    if (a1)
    {
      for (uint64_t i = &dword_18A06E360; ; i += 4)
      {
        uint64_t v1 = (const char *)*((void *)i - 1);
        if (!v1) {
          break;
        }
        int v4 = *i;
        if (v4 == a1) {
          return xpc_string_create(v1);
        }
      }
    }

    return xpc_string_create("Unknown");
  }

  uint64_t v1 = (&ne_necp_policy_string_to_level_mapping)[2 * a1];
  return xpc_string_create(v1);
}

BOOL check_alf_plist_if_enabled()
{
  int v0 = open("/Library/Preferences/com.apple.alf.plist", 0);
  if (v0 == -1) {
    return 0LL;
  }
  int v1 = v0;
  if (fstat(v0, &v11)) {
    st_size_t size = 0LL;
  }
  else {
    st_size_t size = v11.st_size;
  }
  if ((unint64_t)(st_size - 1) <= 0x18FFE && (uint64_t v3 = malloc(st_size)) != 0LL)
  {
    int v4 = v3;
    if (pread(v1, v3, st_size, 0LL) == st_size && (int v5 = (void *)xpc_create_from_plist()) != 0LL)
    {
      uint64_t v6 = v5;
      xpc_object_t value = xpc_dictionary_get_value(v5, "enable_drop_all");
      BOOL v9 = value
        && xpc_int64_get_value(value)
        && (xpc_object_t v8 = xpc_dictionary_get_value(v6, "globalstate")) != 0LL
        && xpc_int64_get_value(v8) != 0;
      xpc_release(v6);
    }

    else
    {
      BOOL v9 = 0LL;
    }

    free(v4);
  }

  else
  {
    BOOL v9 = 0LL;
  }

  close(v1);
  return v9;
}

uint64_t ne_session_initialize_necp_drop_all()
{
  int v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1) {
    return ne_session_initialize_necp_drop_dest();
  }
  int v1 = v0;
  if (fstat(v0, &v12)) {
    st_size_t size = 0LL;
  }
  else {
    st_size_t size = v12.st_size;
  }
  if ((unint64_t)(st_size - 1) > 0x27FE)
  {
    if (st_size <= 0) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 = 27LL;
    }
  }

  else
  {
    uint64_t v3 = malloc(st_size);
    if (v3)
    {
      int v4 = v3;
      if (pread(v1, v3, st_size, 0LL) == st_size)
      {
        int v5 = (void *)xpc_create_from_plist();
        if (v5)
        {
          uint64_t v6 = v5;
          xpc_object_t value = (char *)xpc_dictionary_get_value(v5, "drop_all_level");
          if (value)
          {
            necp_level_from_xpc_xpc_object_t value = ne_session_get_necp_level_from_xpc_value(value);
            if (!necp_level_from_xpc_value) {
              necp_level_from_xpc_xpc_object_t value = check_alf_plist_if_enabled();
            }
            uint64_t v8 = sysctlbyname("net.necp.drop_all_level", 0LL, 0LL, &necp_level_from_xpc_value, 4uLL);
          }

          else
          {
            uint64_t v8 = 22LL;
          }

          xpc_release(v6);
        }

        else
        {
          uint64_t v8 = 22LL;
        }
      }

      else
      {
        uint64_t v8 = 0LL;
      }

      free(v4);
    }

    else
    {
      uint64_t v8 = 55LL;
    }
  }

  close(v1);
  uint64_t v9 = ne_session_initialize_necp_drop_dest();
  if (!(_DWORD)v8) {
    return v9;
  }
  return v8;
}

unsigned __int8 *ne_session_copy_policy_match( const char *a1, char *__s, const char *a3, const unsigned __int8 *a4, _OWORD *a5, int a6, int a7, int a8, int a9)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (__s)
  {
    size_t v15 = strlen(__s) + 48;
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  size_t v15 = 42LL;
  if (a1) {
LABEL_3:
  }
    v15 += strlen(a1) + 6;
LABEL_4:
  if (a3) {
    v15 += strlen(a3) + 6;
  }
  size_t v16 = v15 + 9;
  if (!a6) {
    size_t v16 = v15;
  }
  if (a7) {
    v16 += 9LL;
  }
  if (a8) {
    v16 += 7LL;
  }
  if (a9) {
    size_t v17 = v16 + 9;
  }
  else {
    size_t v17 = v16;
  }
  __int128 v18 = (char *)malloc(v17);
  if (!v18) {
    return 0LL;
  }
  __int128 v19 = v18;
  bzero(v18, v17);
  char *v19 = 1;
  *(_DWORD *)(v19 + 1) = 16;
  *(_OWORD *)(v19 + 5) = *(_OWORD *)a4;
  v19[21] = 2;
  *(_DWORD *)(v19 + 22) = 16;
  *(_OWORD *)(v19 + 26) = *a5;
  if (!__s)
  {
    uint64_t v22 = (uint64_t)(v19 + 42);
    if (!a1) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }

  int v20 = strlen(__s);
  v19[42] = 4;
  size_t v21 = (v20 + 1);
  *(_DWORD *)(v19 + 43) = v21;
  if (v20 == -1) {
    size_t v21 = 0LL;
  }
  else {
    memcpy(v19 + 47, __s, v21);
  }
  uint64_t v22 = (uint64_t)&v19[v21 + 47];
  if (a1)
  {
LABEL_25:
    int v23 = strlen(a1);
    *(_BYTE *)uint64_t v22 = 3;
    size_t v24 = (v23 + 1);
    *(_DWORD *)(v22 + 1) = v24;
    if (v23 == -1) {
      size_t v24 = 0LL;
    }
    else {
      memcpy((void *)(v22 + 5), a1, v24);
    }
    v22 += v24 + 5;
  }

LABEL_29:
  if (a3)
  {
    int v25 = strlen(a3);
    *(_BYTE *)uint64_t v22 = 9;
    size_t v26 = (v25 + 1);
    *(_DWORD *)(v22 + 1) = v26;
    if (v25 == -1) {
      size_t v26 = 0LL;
    }
    else {
      memcpy((void *)(v22 + 5), a3, v26);
    }
    v22 += v26 + 5;
  }

  if (a6)
  {
    *(_BYTE *)uint64_t v22 = 6;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a6;
    v22 += 9LL;
  }

  if (a7)
  {
    *(_BYTE *)uint64_t v22 = 7;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a7;
    v22 += 9LL;
  }

  if (a8)
  {
    *(_BYTE *)uint64_t v22 = 11;
    *(_DWORD *)(v22 + 1) = 2;
    *(_WORD *)(v22 + 5) = a8;
    v22 += 7LL;
  }

  if (a9)
  {
    *(_BYTE *)uint64_t v22 = 10;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a9;
  }

  __int128 v27 = (unsigned __int8 *)calloc(1uLL, 0x1CCuLL);
  int matched = necp_match_policy();
  free(v19);
  if (matched || !*(_DWORD *)v27 && !*((_DWORD *)v27 + 2) && !*((_DWORD *)v27 + 4))
  {
    free(v27);
    nelog_is_info_logging_enabled();
    return 0LL;
  }

  if (nelog_is_info_logging_enabled())
  {
    if (*((_DWORD *)v27 + 10) == 2)
    {
      uuid_clear(uu);
      uuid_copy(uu, v27 + 20);
      uuid_unparse(uu, out);
      uuid_unparse(a4, v43);
      __int16 v30 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __int128 v31 = "";
        *(_DWORD *)__int128 buf = 136315906;
        if (a1) {
          __int128 v32 = a1;
        }
        else {
          __int128 v32 = "";
        }
        int v36 = v43;
        __int16 v37 = 2080;
        if (__s) {
          __int128 v31 = __s;
        }
        __int16 v38 = v32;
        __int16 v39 = 2080;
        stat v40 = v31;
        __int16 v41 = 2080;
        uint64_t v42 = out;
        _os_log_impl( &dword_187528000,  v30,  OS_LOG_TYPE_INFO,  "App %s, domain=%s, account=%s matched policy for service %s",  buf,  0x2Au);
      }
    }
  }

  return v27;
}

      if (a4 && v32)
      {
        uint64_t v22 = 0LL;
        int v23 = 0;
        while (1)
        {
          size_t v24 = &v33[v22];
          int v25 = *(unsigned int *)&v33[v22 + 1];
          if (v33[v22] == 12) {
            break;
          }
          uint64_t v22 = (v23 + v25 + 5);
          int v23 = v22;
        }

        if ((_DWORD)v25)
        {
          size_t v26 = calloc(v25 + 1, 1uLL);
          *a4 = v26;
          if (v26) {
            memcpy(v26, v24 + 5, v25);
          }
        }

        else
        {
          *a4 = calloc(1uLL, 1uLL);
        }
      }

uint64_t ne_session_policy_match_get_service_type(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 40);
  }
  return result;
}

uint64_t ne_session_policy_match_get_service(uint64_t a1, uuid_t dst)
{
  if (a1) {
    BOOL v2 = dst == 0LL;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;
  if (!v2) {
    uuid_copy(dst, (const unsigned __int8 *)(a1 + 20));
  }
  return v3;
}

_DWORD *ne_session_policy_match_is_flow_divert(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result == 4);
  }
  return result;
}

_DWORD *ne_session_policy_match_get_flow_divert_unit(_DWORD *result)
{
  if (result)
  {
    if (*result == 4) {
      return (_DWORD *)result[1];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

_DWORD *ne_session_policy_match_is_drop(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result == 3);
  }
  return result;
}

uint64_t ne_session_policy_match_get_filter_unit(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t ne_session_policy_match_get_service_action()
{
  return 0LL;
}

uint64_t ne_session_policy_match_service_is_registered(uint64_t result)
{
  if (result) {
    return *(_BYTE *)(result + 36) & 1;
  }
  return result;
}

_DWORD *ne_session_policy_match_get_scoped_interface_index(_DWORD *result)
{
  if (result)
  {
    if (*result == 12 || *result == 6) {
      return (_DWORD *)result[1];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t nehelper_queue()
{
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  }
  return g_queue;
}

_xpc_connection_s *nehelper_copy_connection_for_delegate_class(unint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  }
  if (a1 < 0xF)
  {
    os_unfair_lock_lock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    uint64_t v3 = (_xpc_connection_s *)nehelper_copy_connection_for_delegate_class_g_connection_cache[a1];
    int v4 = (os_log_s *)ne_log_obj();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)__int128 buf = 134217984;
        stat v11 = (const char *)a1;
        _os_log_debug_impl( &dword_187528000,  v4,  OS_LOG_TYPE_DEBUG,  "Re-using existing nehelper connection for delegate class %llu",  buf,  0xCu);
      }
    }

    else
    {
      if (v5)
      {
        *(_DWORD *)__int128 buf = 134217984;
        stat v11 = (const char *)a1;
        _os_log_debug_impl( &dword_187528000,  v4,  OS_LOG_TYPE_DEBUG,  "Creating a new nehelper connection for delegate class %llu",  buf,  0xCu);
      }

      mach_service = xpc_connection_create_mach_service("com.apple.nehelper", (dispatch_queue_t)g_queue, 2uLL);
      if (!mach_service)
      {
        uint64_t v8 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315394;
          stat v11 = "com.apple.nehelper";
          __int16 v12 = 2048;
          unint64_t v13 = a1;
          _os_log_error_impl( &dword_187528000,  v8,  OS_LOG_TYPE_ERROR,  "xpc_connection_create_mach_service(%s, XPC_CONNECTION_MACH_SERVICE_PRIVILEGED) failed for delegate class %llu",  buf,  0x16u);
        }

        uint64_t v3 = 0LL;
        goto LABEL_15;
      }

      uint64_t v3 = mach_service;
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 0x40000000LL;
      v9[2] = __nehelper_copy_connection_for_delegate_class_block_invoke;
      v9[3] = &__block_descriptor_tmp_71;
      v9[4] = a1;
      void v9[5] = mach_service;
      xpc_connection_set_event_handler(mach_service, v9);
      xpc_connection_resume(v3);
      nehelper_copy_connection_for_delegate_class_g_connection_cache[a1] = v3;
    }

    xpc_retain(v3);
LABEL_15:
    os_unfair_lock_unlock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    return v3;
  }

  BOOL v2 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 134217984;
    stat v11 = (const char *)a1;
    _os_log_error_impl(&dword_187528000, v2, OS_LOG_TYPE_ERROR, "Invalid delegate class id: %llu", buf, 0xCu);
  }

  return 0LL;
}

void __nehelper_copy_connection_for_delegate_class_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    if (MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9268])
    {
      if (a2 == MEMORY[0x1895F9198])
      {
        stat v11 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v14 = 134217984;
          uint64_t v15 = v12;
          _os_log_impl( &dword_187528000,  v11,  OS_LOG_TYPE_DEFAULT,  "nehelper connection for delegate class %llu was interrupted",  (uint8_t *)&v14,  0xCu);
        }
      }

      else
      {
        os_unfair_lock_lock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
        uint64_t v8 = (void *)nehelper_copy_connection_for_delegate_class_g_connection_cache[*(void *)(a1 + 32)];
        if (*(void **)(a1 + 40) == v8)
        {
          uint64_t v9 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            int v14 = 134217984;
            uint64_t v15 = v10;
            _os_log_impl( &dword_187528000,  v9,  OS_LOG_TYPE_DEFAULT,  "nehelper connection for delegate class %llu received XPC_ERROR_CONNECTION_INVALID",  (uint8_t *)&v14,  0xCu);
          }

          nehelper_copy_connection_for_delegate_class_g_connection_cache[*(void *)(a1 + 32)] = 0LL;
          xpc_release(v8);
        }

        os_unfair_lock_unlock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
      }
    }

    else
    {
      int v4 = (void *)MEMORY[0x1895A887C](a2);
      BOOL v5 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 134218242;
        uint64_t v15 = v13;
        __int16 v16 = 2080;
        size_t v17 = v4;
        _os_log_error_impl( &dword_187528000,  v5,  OS_LOG_TYPE_ERROR,  "nehelper connection for delegate class %llu received unknown message: %s",  (uint8_t *)&v14,  0x16u);
      }

      free(v4);
    }
  }

  else
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 134217984;
      uint64_t v15 = v7;
      _os_log_error_impl( &dword_187528000,  v6,  OS_LOG_TYPE_ERROR,  "nehelper connection for delegate class %llu received a NULL message",  (uint8_t *)&v14,  0xCu);
    }
  }

uint64_t ne_session_address_matches_subnets(uint64_t a1, void *a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v5 = MEMORY[0x1895A89D8](a2);
    uint64_t v6 = MEMORY[0x1895F9250];
    if (v5 != MEMORY[0x1895F9250]) {
      return 0LL;
    }
    int v7 = *(unsigned __int8 *)(a1 + 1);
    if (v7 == 2)
    {
      uint64_t v8 = "ipv4-subnets";
    }

    else
    {
      if (v7 != 30) {
        return 0LL;
      }
      uint64_t v8 = "ipv6-subnets";
    }

    uint64_t result = (uint64_t)xpc_dictionary_get_value(a2, v8);
    if (result)
    {
      uint64_t v9 = (void *)result;
      if (MEMORY[0x1895A89D8]() != v6) {
        return 0LL;
      }
      xpc_object_t value = xpc_dictionary_get_value(v9, "subnet-addresses");
      xpc_object_t v11 = xpc_dictionary_get_value(v9, "subnet-masks");
      if (!value) {
        return 0LL;
      }
      uint64_t v12 = v11;
      uint64_t v13 = MEMORY[0x1895A89D8](value);
      uint64_t v14 = MEMORY[0x1895F9220];
      if (v13 != MEMORY[0x1895F9220]) {
        return 0LL;
      }
      if (v12)
      {
        if (MEMORY[0x1895A89D8](v12) != v14) {
          return 0LL;
        }
        size_t count = xpc_array_get_count(value);
        if (count != xpc_array_get_count(v12)) {
          return 0LL;
        }
      }

      else
      {
        size_t count = xpc_array_get_count(value);
      }

      if (!count) {
        return 0LL;
      }
      size_t v16 = 0LL;
      size_t v17 = (int8x16_t *)(a1 + 8);
      do
      {
        size_t length = 0LL;
        int v18 = *(unsigned __int8 *)(a1 + 1);
        if (v18 == 30)
        {
          data = (int8x16_t *)xpc_array_get_data(value, v16, &length);
          if (!data || length < 0x10) {
            goto LABEL_43;
          }
          int v23 = data;
          if (v12)
          {
            size_t v24 = (int8x16_t *)xpc_array_get_data(v12, v16, &length);
            if (!v24 || length <= 0xF) {
              goto LABEL_43;
            }
            int8x16_t v27 = vandq_s8(*v23, *v24);
            uint64_t v26 = v27.i64[1];
            uint64_t v25 = v27.i64[0];
            int8x16_t v30 = vandq_s8(*v17, *v24);
            uint64_t v29 = v30.i64[1];
            uint64_t v28 = v30.i64[0];
          }

          else
          {
            uint64_t v25 = data->i64[0];
            uint64_t v26 = data->i64[1];
            uint64_t v28 = v17->i64[0];
            uint64_t v29 = *(void *)(a1 + 16);
          }

          if (v25 == v28 && v26 == v29) {
            return 1LL;
          }
        }

        else if (v18 == 2)
        {
          __int128 v19 = xpc_array_get_data(value, v16, &length);
          if (v19)
          {
            if (length >= 4)
            {
              int v20 = v19;
              if (v12)
              {
                size_t v21 = xpc_array_get_data(v12, v16, &length);
                if (v21 && length >= 4 && ((*(_DWORD *)(a1 + 4) ^ *v20) & *v21) == 0) {
                  return 1LL;
                }
              }

              else if (*v19 == *(_DWORD *)(a1 + 4))
              {
                return 1LL;
              }
            }
          }
        }

LABEL_43:
        uint64_t result = 0LL;
        ++v16;
      }

      while (count != v16);
    }
  }

  return result;
}

BOOL ne_session_service_matches_address_for_interface( const unsigned __int8 *a1, int a2, uint64_t a3, const char *a4, const char *a5, _BYTE *a6)
{
  if (a6) {
    *a6 = 0;
  }
  BOOL v12 = 0LL;
  if (a3 && a4)
  {
    int v13 = *(unsigned __int8 *)(a3 + 1);
    BOOL v14 = v13 == 30 || v13 == 2;
    if (v14 && (a2 - 3) >= 0xFFFFFFFE)
    {
      os_unfair_lock_lock(&_ne_session_cache_lock);
      xpc_object_t v15 = ne_session_copy_cached_values_locked();
      if (v15)
      {
        size_t v16 = v15;
        xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v15, a1, a2);
        domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a5, a4);
        uint64_t v19 = MEMORY[0x1895F9250];
        if (domain_dict_from_session_dict
          && (int v20 = domain_dict_from_session_dict, MEMORY[0x1895A89D8]() == v19)
          && xpc_dictionary_get_BOOL(v20, "service-probe-failed")
          || (xpc_object_t v21 = xpc_dictionary_get_value(v16, "redirected-addresses")) != 0LL
          && (uint64_t v22 = v21, MEMORY[0x1895A89D8]() == v19)
          && (xpc_object_t v23 = xpc_dictionary_get_value(v22, a4), ne_session_address_matches_subnets(a3, v23)))
        {
          BOOL v12 = 1LL;
          if (a6) {
            *a6 = 1;
          }
        }

        else
        {
          BOOL v12 = 0;
          if (a2 == 1)
          {
            if (session_dict_from_cache)
            {
              if (MEMORY[0x1895A89D8](session_dict_from_cache) == v19)
              {
                xpc_object_t value = xpc_dictionary_get_value(session_dict_from_cache, "included-routes");
                if (ne_session_address_matches_subnets(a3, value))
                {
                  xpc_object_t v25 = xpc_dictionary_get_value(session_dict_from_cache, "excluded-routes");
                }
              }
            }
          }
        }

        xpc_release(v16);
      }

      else
      {
        BOOL v12 = 0LL;
      }

      os_unfair_lock_unlock(&_ne_session_cache_lock);
    }

    else
    {
      return 0LL;
    }
  }

  return v12;
}

xpc_object_t ne_session_copy_cached_values_locked()
{
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  }
  os_unfair_lock_assert_owner(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token == -1) {
    notify_register_dispatch( "com.apple.networkextension.ondemandcachechanged",  &_ne_session_cache_notify_token,  (dispatch_queue_t)g_queue,  &__block_literal_global_214);
  }
  int v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache) {
    return xpc_retain(v0);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  uint64_t v3 = dispatch_semaphore_create(0LL);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  _DWORD v4[2] = __ne_session_copy_cached_values_locked_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_217;
  v4[4] = v3;
  ne_session_update_cached_values((uint64_t)v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  os_unfair_lock_lock(&_ne_session_cache_lock);
  uint64_t v1 = 0LL;
  int v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache) {
    return xpc_retain(v0);
  }
  return (xpc_object_t)v1;
}

xpc_object_t ne_session_get_session_dict_from_cache(void *a1, const unsigned __int8 *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v6 = MEMORY[0x1895A89D8]();
  uint64_t v7 = MEMORY[0x1895F9250];
  if (v6 != MEMORY[0x1895F9250]) {
    return 0LL;
  }
  xpc_object_t result = xpc_dictionary_get_value(a1, "services");
  if (result)
  {
    uint64_t v9 = result;
    if (MEMORY[0x1895A89D8]() != v7) {
      return 0LL;
    }
    uuid_unparse(a2, out);
    xpc_object_t value = xpc_dictionary_get_value(v9, out);
    if (!value) {
      return 0LL;
    }
    xpc_object_t v11 = value;
    if (MEMORY[0x1895A89D8]() != v7) {
      return 0LL;
    }
    else {
      BOOL v12 = off_18A06E690[a3 - 1];
    }
    return xpc_dictionary_get_value(v11, v12);
  }

  return result;
}

void *ne_session_get_domain_dict_from_session_dict(void *a1, const char *a2, const char *a3)
{
  if (!a2) {
    return 0LL;
  }
  int v4 = 0LL;
  if (!a1 || !*a2) {
    return v4;
  }
  uint64_t v7 = MEMORY[0x1895A89D8](a1);
  uint64_t v8 = MEMORY[0x1895F9250];
  if (v7 != MEMORY[0x1895F9250]) {
    return 0LL;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, a3);
  if (!value) {
    return 0LL;
  }
  xpc_object_t v11 = value;
  if (MEMORY[0x1895A89D8]() != v8) {
    return 0LL;
  }
  xpc_object_t v12 = xpc_dictionary_get_value(v11, "service-domain-info");
  if (!v12) {
    return 0LL;
  }
  int v13 = v12;
  uint64_t v14 = MEMORY[0x1895A89D8]();
  uint64_t v15 = MEMORY[0x1895F9220];
  if (v14 != MEMORY[0x1895F9220]) {
    return 0LL;
  }
  size_t count = xpc_array_get_count(v13);
  if (!count) {
    return 0LL;
  }
  size_t v17 = count;
  size_t v18 = 0LL;
  while (1)
  {
    xpc_object_t v19 = xpc_array_get_value(v13, v18);
    if (v19)
    {
      int v4 = v19;
      if (MEMORY[0x1895A89D8]() == v8)
      {
        xpc_object_t v20 = xpc_dictionary_get_value(v4, "service-domains");
        if (v20)
        {
          xpc_object_t v21 = v20;
          if (MEMORY[0x1895A89D8]() == v15)
          {
            size_t v22 = xpc_array_get_count(v21);
            if (v22) {
              break;
            }
          }
        }
      }
    }

LABEL_15:
    int v4 = 0LL;
    if (++v18 == v17) {
      return v4;
    }
  }

  size_t v23 = v22;
  size_t v24 = 0LL;
  while (1)
  {
    string = xpc_array_get_string(v21, v24);
    if (string)
    {
      if (strstr(a2, string)) {
        return v4;
      }
    }

    if (v23 == ++v24) {
      goto LABEL_15;
    }
  }

    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  uint64_t v7 = (os_log_s *)ne_log_obj();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    goto LABEL_15;
  }
  LOWORD(bytes[0]) = 0;
  _os_log_fault_impl(&dword_187528000, v7, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", (uint8_t *)bytes, 2u);
  if (v4) {
    goto LABEL_16;
  }
LABEL_17:
  if (v2) {
    xpc_release((xpc_object_t)v2);
  }
  return v6;
}

uint64_t __ne_session_copy_cached_values_locked_block_invoke_3(uint64_t a1, void *a2)
{
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0LL;
  }

  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250]) {
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ne_session_update_cached_values(uint64_t a1)
{
  BOOL v2 = nehelper_copy_connection_for_delegate_class(1uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
      xpc_dictionary_set_uint64(v5, "cache-command", 1uLL);
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 0x40000000LL;
      handler[2] = __ne_session_update_cached_values_block_invoke;
      handler[3] = &unk_18A06E528;
      handler[4] = a1;
      xpc_connection_send_message_with_reply(v3, v5, (dispatch_queue_t)g_queue, handler);
      xpc_release(v5);
    }

    xpc_release(v3);
  }

uint64_t __ne_session_update_cached_values_block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250]) {
    xpc_dictionary_get_value(a2, "result-data");
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __ne_session_copy_cached_values_locked_block_invoke(uint64_t a1, int a2)
{
  int v3 = _ne_session_cache_notify_token;
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  if (v3 == a2) {
    ne_session_update_cached_values((uint64_t)&__block_literal_global_216);
  }
}

void __ne_session_copy_cached_values_locked_block_invoke_2(uint64_t a1, void *a2)
{
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0LL;
  }

  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250]) {
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

uint64_t ne_session_service_matches_address(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a5) {
    *a5 = 0;
  }
  return 0LL;
}

int64_t ne_session_service_get_dns_service_id_for_interface( const unsigned __int8 *a1, int a2, const char *a3, const char *a4)
{
  int64_t int64 = 0LL;
  if (a2 == 1 && a4)
  {
    os_unfair_lock_lock(&_ne_session_cache_lock);
    xpc_object_t v8 = ne_session_copy_cached_values_locked();
    if (v8)
    {
      uint64_t v9 = v8;
      xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v8, a1, 1);
      domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a3, a4);
      if (domain_dict_from_session_dict
        && (xpc_object_t v12 = domain_dict_from_session_dict, MEMORY[0x1895A89D8]() == MEMORY[0x1895F9250]))
      {
        int64_t int64 = xpc_dictionary_get_int64(v12, "service-dns-service");
      }

      else
      {
        int64_t int64 = 0LL;
      }

      os_unfair_lock_unlock(&_ne_session_cache_lock);
      xpc_release(v9);
    }

    else
    {
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      return 0LL;
    }
  }

  return int64;
}

xpc_object_t ne_session_service_copy_cached_match_domains(const unsigned __int8 *a1, int a2)
{
  if (a2 != 1) {
    return 0LL;
  }
  os_unfair_lock_lock(&_ne_session_cache_lock);
  xpc_object_t v3 = ne_session_copy_cached_values_locked();
  if (!v3)
  {
    os_unfair_lock_unlock(&_ne_session_cache_lock);
    return 0LL;
  }

  xpc_object_t v4 = v3;
  xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v3, a1, 1);
  xpc_object_t v6 = session_dict_from_cache;
  if (session_dict_from_cache)
  {
    if (MEMORY[0x1895A89D8](session_dict_from_cache) == MEMORY[0x1895F9250])
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, "match-domains");
      xpc_object_t v6 = value;
      if (!value) {
        goto LABEL_6;
      }
      if (MEMORY[0x1895A89D8](value) == MEMORY[0x1895F9220])
      {
        xpc_object_t v6 = xpc_retain(v6);
        goto LABEL_6;
      }
    }

    xpc_object_t v6 = 0LL;
  }

LABEL_6:
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  xpc_release(v4);
  return v6;
}

uint64_t ne_session_service_get_dns_service_id()
{
  return 0LL;
}

uint64_t ne_session_set_socket_attributes(int a1, char *__s, const char *a3)
{
  if (a1 == -1) {
    return 0LL;
  }
  xpc_object_t v4 = __s;
  if (__s)
  {
    size_t v7 = strlen(__s) + 6;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  size_t v7 = 0LL;
  if (a3) {
LABEL_7:
  }
    v7 += strlen(a3) + 6;
LABEL_8:
  uint64_t result = (uint64_t)malloc(v7);
  if (result)
  {
    xpc_object_t v8 = (char *)result;
    bzero((void *)result, v7);
    uint64_t v9 = (uint64_t)v8;
    if (v4)
    {
      size_t v10 = strlen(v4);
      if (v10 >= 2)
      {
        size_t v11 = v10 - 1;
        if (v4[v10 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_227[v11] = 0;
          xpc_object_t v4 = ne_session_trim_domain_domain_buffer_227;
        }
      }

      int v12 = strlen(v4);
      char *v8 = 7;
      size_t v13 = (v12 + 1);
      *(_DWORD *)(v8 + 1) = v13;
      if (v12 == -1) {
        size_t v13 = 0LL;
      }
      else {
        memcpy(v8 + 5, v4, v13);
      }
      uint64_t v9 = (uint64_t)&v8[v13 + 5];
    }

    if (a3)
    {
      int v14 = strlen(a3);
      *(_BYTE *)uint64_t v9 = 8;
      size_t v15 = (v14 + 1);
      *(_DWORD *)(v9 + 1) = v15;
      if (v14 != -1) {
        memcpy((void *)(v9 + 5), a3, v15);
      }
    }

    int v16 = setsockopt(a1, 0xFFFF, 4361, v8, v7);
    free(v8);
    return v16 == 0;
  }

  return result;
}

uint64_t ne_session_copy_socket_attributes(int a1, void **a2, void **a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  socklen_t v17 = 256;
  if (a1 == -1) {
    return 0LL;
  }
  if ((unint64_t)a2 | (unint64_t)a3)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v18, &v17))
    {
      if (a2 && v17)
      {
        uint64_t v7 = 0LL;
        int v8 = 0;
        while (1)
        {
          uint64_t v9 = &v18[v7];
          size_t v10 = *(unsigned int *)&v18[v7 + 1];
          if (v18[v7] == 7) {
            break;
          }
          uint64_t v7 = (v8 + v10 + 5);
          int v8 = v7;
        }

        if ((_DWORD)v10)
        {
          size_t v11 = calloc(v10 + 1, 1uLL);
          *a2 = v11;
          if (v11) {
            memcpy(v11, v9 + 5, v10);
          }
        }

        else
        {
          *a2 = calloc(1uLL, 1uLL);
        }
      }

LABEL_17:
      if (a3 && v17)
      {
        uint64_t v12 = 0LL;
        int v13 = 0;
        while (1)
        {
          int v14 = &v18[v12];
          size_t v15 = *(unsigned int *)&v18[v12 + 1];
          if (v18[v12] == 8) {
            break;
          }
          uint64_t v12 = (v13 + v15 + 5);
          uint64_t v5 = 1LL;
          int v13 = v12;
        }

        if (!(_DWORD)v15)
        {
          uint64_t v5 = 1LL;
          *a3 = calloc(1uLL, 1uLL);
          return v5;
        }

        int v16 = calloc(v15 + 1, 1uLL);
        *a3 = v16;
        if (!v16) {
          return 1LL;
        }
        memcpy(v16, v14 + 5, v15);
      }

      return 1LL;
    }

    return 0LL;
  }

  return 1LL;
}

      ne_uuid_cache_changed_cache_generation = v7;
      uint64_t v1 = (void *)g_uuid_cache;
      if (g_uuid_cache) {
        goto LABEL_51;
      }
      g_ne_read_uuid_cache = 1;
LABEL_23:
      int v14 = open( "/Library/Preferences/com.apple.networkextension.uuidcache.plist",  0,  "/Library/Preferences/com.apple.networkextension.uuidcache.plist");
      if (v14 < 0)
      {
        if (*__error() != 2 && *__error() != 1)
        {
          xpc_object_t v21 = *__error();
          size_t v22 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)char v53 = 136315650;
            *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
            *(_WORD *)&v53[12] = 1024;
            *(_DWORD *)&v53[14] = v21;
            *(_WORD *)&v53[18] = 2080;
            *(void *)&v53[20] = buf;
            _os_log_fault_impl(&dword_187528000, v22, OS_LOG_TYPE_FAULT, "Failed to open %s: [%d] %s", v53, 0x1Cu);
          }
        }

    uint64_t v9 = 0LL;
  }

  if (v17) {
    MEMORY[0x1895A7EC8]();
  }
  return v9;
}

const char *ne_session_status_to_string(int a1)
{
  else {
    return off_18A06E668[a1 - 1];
  }
}

const char *ne_session_type_to_string(int a1)
{
  else {
    return off_18A06E690[a1 - 1];
  }
}

uint64_t ne_session_copy_security_session_info(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  *a2 = 0;
  *a3 = 0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 0x40000000LL;
  v12[2] = __ne_session_copy_security_session_info_block_invoke;
  v12[3] = &unk_18A06DF98;
  v12[4] = &v13;
  v12[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, v12);
  if (v14[3])
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 5LL);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v14[3], v5);
    uint64_t v7 = v6;
    if (v6)
    {
      if (MEMORY[0x1895A89D8](v6) == MEMORY[0x1895F9250])
      {
        *a2 = xpc_dictionary_copy_mach_send();
        *a3 = xpc_dictionary_copy_mach_send();
      }

      else if (MEMORY[0x1895A89D8](v7) == MEMORY[0x1895F9268])
      {
        int v8 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x1895F91B0]);
          *(_DWORD *)__int128 buf = 136315138;
          size_t v18 = string;
          _os_log_error_impl( &dword_187528000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to fetch security session info: %s",  buf,  0xCu);
        }

        uint64_t v9 = 0LL;
        goto LABEL_11;
      }
    }

    uint64_t v9 = 1LL;
LABEL_11:
    xpc_release(v5);
    xpc_release(v7);
    xpc_release((xpc_object_t)v14[3]);
    goto LABEL_12;
  }

  uint64_t v9 = 0LL;
LABEL_12:
  _Block_object_dispose(&v13, 8);
  return v9;
}

xpc_object_t __ne_session_copy_security_session_info_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = get_connection(**(void **)(a1 + 40));
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result)
  {
    xpc_object_t result = xpc_retain(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

void ne_session_stop_all_with_plugin_type(int a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (queue)
  {
    if (block) {
      dispatch_async(queue, block);
    }
  }

xpc_object_t ne_session_policy_copy_flow_divert_token( const unsigned __int8 *a1, unsigned int a2, xpc_object_t xdict, const char *a4)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  if (!a4 || uuid_is_null(a1))
  {
    xpc_object_t v8 = ne_session_policy_copy_flow_divert_token_with_key(a2, xdict, 0LL, 0LL);
    goto LABEL_4;
  }

  if (!ne_session_validate_flow_properties(xdict))
  {
LABEL_17:
    xpc_object_t v8 = 0LL;
    goto LABEL_4;
  }

  size_t v10 = dispatch_semaphore_create(0LL);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 0x40000000LL;
  _DWORD v17[2] = __ne_session_policy_copy_flow_divert_token_block_invoke;
  v17[3] = &unk_18A06DFC0;
  v17[4] = &v18;
  v17[5] = v10;
  uint64_t v12 = ne_session_create((uint64_t)a1, 2);
  uint64_t v23 = 0LL;
  size_t v24 = &v23;
  uint64_t v25 = 0x2000000000LL;
  char v26 = 0;
  if (get_flow_divert_token_from_session_manager_token_init != -1) {
    dispatch_once(&get_flow_divert_token_from_session_manager_token_init, &__block_literal_global_226);
  }
  *(void *)&__int128 block = v11;
  *((void *)&block + 1) = 0x40000000LL;
  uint64_t v28 = __get_flow_divert_token_from_session_manager_block_invoke_2;
  uint64_t v29 = &unk_18A06E590;
  int8x16_t v30 = &v23;
  uint64_t v31 = v12;
  dispatch_sync((dispatch_queue_t)g_queue, &block);
  if (*((_BYTE *)v24 + 24))
  {
    uint64_t v13 = (unsigned int *)(v12 + 40);
    do
      unsigned int v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
    v22[0] = v11;
    v22[1] = 0x40000000LL;
    sockaddr v22[2] = __get_flow_divert_token_from_session_manager_block_invoke_3;
    v22[3] = &__block_descriptor_tmp_231;
    v22[4] = v12;
    out[0] = v11;
    out[1] = 0x40000000LL;
    out[2] = __ne_session_set_event_handler_block_invoke;
    out[3] = &unk_18A06DC70;
    out[4] = v22;
    uint64_t v33 = v12;
    uint64_t v34 = get_flow_divert_token_from_session_manager_token_queue;
    dispatch_sync((dispatch_queue_t)g_queue, out);
  }

  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v15, "SessionFlowDivertTokenControlUnit", a2);
  if (xdict) {
    xpc_dictionary_set_value(v15, "SessionFlowDivertTokenProperties", xdict);
  }
  xpc_dictionary_set_string(v15, "SessionFlowDivertTokenSigningIdentifier", a4);
  out[0] = v11;
  out[1] = 0x40000000LL;
  out[2] = __get_flow_divert_token_from_session_manager_block_invoke_235;
  out[3] = &unk_18A06E5F8;
  out[4] = v17;
  uint64_t v33 = v12;
  ne_session_get_info_with_parameters( v12,  4,  (uint64_t)v15,  0,  (dispatch_object_t)get_flow_divert_token_from_session_manager_token_queue,  out);
  _Block_object_dispose(&v23, 8);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  xpc_object_t v8 = (xpc_object_t)v19[3];
  if (!v8)
  {
    uuid_unparse(a1, (char *)out);
    uint64_t v16 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 136315138;
      *(void *)((char *)&block + 4) = out;
      _os_log_error_impl( &dword_187528000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to obtain the flow divert token for configuration %s",  (uint8_t *)&block,  0xCu);
    }

    goto LABEL_17;
  }

xpc_object_t ne_session_policy_copy_flow_divert_token_with_key( unsigned int a1, xpc_object_t xdict, const char *a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  string = xpc_dictionary_get_string(xdict, "flow-host-name");
  data = xpc_dictionary_get_data(xdict, "flow-host-address", &length);
  int int64 = xpc_dictionary_get_int64(xdict, "flow-host-port");
  BOOL v11 = xpc_dictionary_get_BOOL(xdict, "flow-multipath-requested");
  size_t v57 = 0LL;
  uint64_t v12 = xpc_dictionary_get_data(xdict, "app-data", &v57);
  uint int64 = xpc_dictionary_get_uint64(xdict, "aggregate_unit");
  BOOL v14 = ne_session_validate_flow_properties(xdict);
  xpc_object_t v15 = 0LL;
  if (!v14) {
    return v15;
  }
  if (v11) {
    int v16 = 4;
  }
  else {
    int v16 = 0;
  }
  int v54 = v16;
  if (string) {
    size_t v17 = strlen(string) + 5;
  }
  else {
    size_t v17 = 0LL;
  }
  int v55 = int64;
  if (data && *data) {
    v17 += *data + 5LL;
  }
  uint64_t v18 = 61LL;
  if (!a4) {
    uint64_t v18 = 36LL;
  }
  size_t v19 = v17 + v18;
  if (a3) {
    v19 += strlen(a3) + 5;
  }
  if (v57) {
    BOOL v20 = v12 == 0LL;
  }
  else {
    BOOL v20 = 1;
  }
  size_t v21 = v57 + 5;
  if (v20) {
    size_t v21 = 0LL;
  }
  size_t v22 = v21 + v19;
  unsigned int v56 = uint64;
  else {
    size_t v23 = v22;
  }
  size_t v24 = (char *)malloc(v23);
  uint64_t v25 = v24;
  if (string)
  {
    char v53 = a3;
    char v26 = v12;
    unsigned int v27 = a1;
    uint64_t v28 = a4;
    unsigned int v29 = strlen(string);
    uint64_t v30 = v29;
    unint64_t v31 = v29 + 5LL;
    unint64_t v32 = v23 - v31;
    if (v23 < v31) {
      goto LABEL_58;
    }
    char *v25 = 21;
    *(_DWORD *)(v25 + 1) = bswap32(v29);
    memcpy(v25 + 5, string, v29);
    uint64_t v33 = &v25[v30 + 5];
    a4 = v28;
    a1 = v27;
    uint64_t v12 = v26;
    a3 = v53;
    if (!data) {
      goto LABEL_33;
    }
LABEL_29:
    size_t v34 = *data;
    if (*data)
    {
      BOOL v35 = v32 >= v34 + 5;
      v32 -= v34 + 5;
      if (!v35) {
        goto LABEL_58;
      }
      *uint64_t v33 = 22;
      *(_DWORD *)(v33 + 1) = (_DWORD)v34 << 24;
      int v36 = v33 + 5;
      memcpy(v36, data, v34);
      uint64_t v33 = &v36[v34];
    }

    goto LABEL_33;
  }

  uint64_t v33 = v24;
  unint64_t v32 = v23;
  if (data) {
    goto LABEL_29;
  }
LABEL_33:
  if (v32 <= 8) {
    goto LABEL_58;
  }
  *uint64_t v33 = 23;
  *(_DWORD *)(v33 + 1) = 0x4000000;
  *(_DWORD *)(v33 + 5) = v55;
  if (v32 - 9 <= 8) {
    goto LABEL_58;
  }
  __int16 v37 = a4;
  v33[9] = 10;
  *(_DWORD *)(v33 + 10) = 0x4000000;
  *(_DWORD *)(v33 + 14) = bswap32(a1);
  int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  if (v32 - 18 <= 8) {
    goto LABEL_58;
  }
  int v39 = is_debug_logging_enabled ? 7 : 5;
  v33[18] = 20;
  *(_DWORD *)(v33 + 19) = 0x4000000;
  *(_DWORD *)(v33 + 23) = v39;
  if (v32 - 27 <= 8) {
LABEL_58:
  }
    __assert_rtn("ne_tlv_add", "ne_session.c", 2995, "tlv_iter->remaining >= add_size");
  v33[27] = 29;
  *((_DWORD *)v33 + 7) = 0x4000000;
  *((_DWORD *)v33 + 8) = v54;
  unint64_t v40 = v32 - 36;
  if (a3)
  {
    unsigned int v41 = strlen(a3);
    uint64_t v42 = v41;
    unint64_t v43 = v41 + 5LL;
    BOOL v35 = v40 >= v43;
    v40 -= v43;
    if (!v35) {
      goto LABEL_58;
    }
    v33[36] = 25;
    *(_DWORD *)(v33 + 37) = bswap32(v41);
    uint64_t v44 = v33 + 41;
    memcpy(v44, a3, v41);
    uint64_t v45 = &v44[v42];
  }

  else
  {
    uint64_t v45 = v33 + 36;
  }

  if (v12)
  {
    unsigned int v46 = v57;
    if (v57)
    {
      size_t v47 = v57;
      unint64_t v48 = v57 + 5LL;
      BOOL v35 = v40 >= v48;
      v40 -= v48;
      if (!v35) {
        goto LABEL_58;
      }
      *uint64_t v45 = 31;
      *(_DWORD *)(v45 + 1) = bswap32(v46);
      memcpy(v45 + 5, v12, v47);
      v45 += v47 + 5;
    }
  }

  if (v56)
  {
    if (v40 <= 8) {
      goto LABEL_58;
    }
    *uint64_t v45 = 26;
    *(_DWORD *)(v45 + 1) = 0x4000000;
    *(_DWORD *)(v45 + 5) = bswap32(v56);
    v45 += 9;
    v40 -= 9LL;
  }

  if (v37)
  {
    __int128 macOut = 0uLL;
    int v60 = 0;
    bytes_ptr = xpc_data_get_bytes_ptr(v37);
    size_t v50 = xpc_data_get_length(v37);
    CCHmac(0, bytes_ptr, v50, v25, v23 - v40, &macOut);
    if (v40 <= 0x18) {
      goto LABEL_58;
    }
    *uint64_t v45 = 18;
    *(_DWORD *)(v45 + 1) = 335544320;
    __int128 v51 = macOut;
    *(_DWORD *)(v45 + 21) = v60;
    *(_OWORD *)(v45 + 5) = v51;
    v40 -= 25LL;
  }

  xpc_object_t v15 = xpc_data_create(v25, v23 - v40);
  free(v25);
  return v15;
}

BOOL ne_session_validate_flow_properties(void *a1)
{
  string = xpc_dictionary_get_string(a1, "flow-host-name");
  data = (unsigned __int8 *)xpc_dictionary_get_data(a1, "flow-host-address", &length);
  int int64 = xpc_dictionary_get_int64(a1, "flow-host-port");
  if (!string)
  {
    if (!data)
    {
      xpc_object_t v8 = (os_log_s *)ne_log_obj();
      BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v9 = "Invalid flow properties: missing hostname and address";
      goto LABEL_31;
    }

    goto LABEL_6;
  }

  if (!*string)
  {
    xpc_object_t v8 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: hostname is empty";
    goto LABEL_31;
  }

  if (data)
  {
LABEL_6:
    int v5 = data[1];
    if (v5 == 30)
    {
      size_t v11 = *data;
      if (v11 < 0x1C || length < v11) {
        goto LABEL_22;
      }
      v15[0] = 0LL;
      v15[1] = 0LL;
      if (*(_OWORD *)(data + 8) != 0LL) {
        goto LABEL_27;
      }
      xpc_object_t v8 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        return 0LL;
      }
      __int16 v16 = 0;
      uint64_t v9 = "Invalid flow properties: address is IN6ADDR_ANY_INIT";
    }

    else
    {
      if (v5 != 2 || ((size_t v6 = *data, v6 >= 0x10) ? (v7 = length >= v6) : (v7 = 0), !v7))
      {
LABEL_22:
        uint64_t v13 = (os_log_s *)ne_log_obj();
        BOOL result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
        LOWORD(v15[0]) = 0;
        _os_log_error_impl(&dword_187528000, v13, OS_LOG_TYPE_ERROR, "Invalid host address", (uint8_t *)v15, 2u);
        return 0LL;
      }

      LODWORD(v15[0]) = 0;
      if (*((_DWORD *)data + 1)) {
        goto LABEL_27;
      }
      xpc_object_t v8 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        return 0LL;
      }
      __int16 v16 = 0;
      uint64_t v9 = "Invalid flow properties: address is INADDR_ANY";
    }

    BOOL v14 = (uint8_t *)&v16;
    goto LABEL_32;
  }

uint64_t __ne_session_policy_copy_flow_divert_token_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_retain(object);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __get_flow_divert_token_from_session_manager_block_invoke_2(uint64_t result)
{
  char v1 = 0;
  BOOL v2 = (uint64_t *)(**(void **)(result + 40) + 24LL);
  do
  {
    char v3 = v1;
    uint64_t v4 = *v2;
    if ((v1 & 1) != 0) {
      break;
    }
    BOOL v2 = (uint64_t *)(v4 + 8);
    char v1 = 1;
  }

  while (v4);
  if (v4 == 0 && (v3 & 1) != 0) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

void __get_flow_divert_token_from_session_manager_block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    ne_session_release(*(void *)(a1 + 32));
  }

  else if (a2 == 1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 0x40000000LL;
    _DWORD v3[2] = __get_flow_divert_token_from_session_manager_block_invoke_4;
    v3[3] = &__block_descriptor_tmp_229;
    v3[4] = v2;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __ne_session_get_status_block_invoke;
    block[3] = &unk_18A06DD08;
    void block[5] = v2;
    void block[6] = get_flow_divert_token_from_session_manager_token_queue;
    void block[4] = v3;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }

void __get_flow_divert_token_from_session_manager_block_invoke_235(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9250] && xpc_dictionary_get_value(a2, "SessionFlowDivertTokenKey")) {
    MEMORY[0x1895A89D8]();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  ne_session_release(*(void *)(a1 + 40));
}

void __get_flow_divert_token_from_session_manager_block_invoke_4(uint64_t a1, unsigned int a2)
{
  v6[5] = *MEMORY[0x1895F89C0];
  if (a2 <= 1)
  {
    uint64_t v4 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 67109120;
      HIDWORD(v6[0]) = a2;
      _os_log_impl( &dword_187528000,  v4,  OS_LOG_TYPE_INFO,  "Flow divert token session status changed to %d, cleaning up",  (uint8_t *)v6,  8u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    _DWORD v6[2] = __ne_session_cancel_block_invoke;
    v6[3] = &__block_descriptor_tmp_10;
    v6[4] = v5;
    dispatch_sync((dispatch_queue_t)g_queue, v6);
  }

dispatch_queue_t __get_flow_divert_token_from_session_manager_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("flow divert token queue", v0);
  get_flow_divert_token_from_session_manager_token_queue = (uint64_t)result;
  return result;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_socket(int a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  socklen_t v21 = 0;
  xpc_object_t v2 = 0LL;
  if (getsockopt(a1, 0xFFFF, 4358, 0LL, &v21)) {
    return v2;
  }
  if (!v21)
  {
    BOOL v7 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_WORD *)__int128 buf = 0;
    xpc_object_t v8 = "flow divert token size is 0";
    uint64_t v9 = v7;
    uint32_t v10 = 2;
LABEL_24:
    _os_log_error_impl(&dword_187528000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    return 0LL;
  }

  char v3 = (unsigned __int8 *)malloc(v21);
  if (!v3)
  {
    size_t v11 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v23) = v21;
    xpc_object_t v8 = "Failed to allocate %u bytes for the flow divert token";
    uint64_t v9 = v11;
    uint32_t v10 = 8;
    goto LABEL_24;
  }

  uint64_t v4 = v3;
  if (getsockopt(a1, 0xFFFF, 4358, v3, &v21))
  {
    int v5 = *__error();
    size_t v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = strerror(v5);
      *(_DWORD *)__int128 buf = 136315138;
      size_t v23 = v20;
      _os_log_error_impl( &dword_187528000,  v6,  OS_LOG_TYPE_ERROR,  "getsockopt(SO_FLOW_DIVERT_TOKEN) failed: %s",  buf,  0xCu);
    }

    free(v4);
    return 0LL;
  }

  unint64_t v13 = v21;
  BOOL v14 = v4;
  while (v13 >= 5)
  {
    int v15 = *v14;
    unsigned int v16 = *(_DWORD *)(v14 + 1);
    size_t v17 = bswap32(v16);
    if (v16)
    {
      uint64_t v18 = v17 + 5;
      if (v17 + 5 > v13) {
        break;
      }
      size_t v19 = v14 + 5;
    }

    else
    {
      size_t v19 = 0LL;
      uint64_t v18 = 5LL;
    }

    v14 += v18;
    v13 -= v18;
    if (v15 == 31)
    {
      xpc_object_t v2 = xpc_data_create(v19, v17);
      goto LABEL_22;
    }
  }

  xpc_object_t v2 = 0LL;
LABEL_22:
  free(v4);
  return v2;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_token(void *a1)
{
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  while (length >= 5)
  {
    int v4 = *bytes_ptr;
    unsigned int v5 = *(_DWORD *)(bytes_ptr + 1);
    size_t v6 = bswap32(v5);
    if (v5)
    {
      uint64_t v7 = v6 + 5;
      if (v6 + 5 > length) {
        return 0LL;
      }
      xpc_object_t v8 = bytes_ptr + 5;
    }

    else
    {
      xpc_object_t v8 = 0LL;
      uint64_t v7 = 5LL;
    }

    bytes_ptr += v7;
    length -= v7;
    if (v4 == 31) {
      return xpc_data_create(v8, v6);
    }
  }

  return 0LL;
}

uint64_t ne_session_get_config_id_from_network_agent(uint64_t result, unsigned __int8 *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension") && *(_DWORD *)(v5 + 212) == 40)
    {
      if (a2) {
        uuid_copy(a2, (const unsigned __int8 *)(v5 + 216));
      }
      if (a3) {
        *a3 = *(_DWORD *)(v5 + 232);
      }
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t ne_session_agent_get_advisory_interface_index(uint64_t result, int a2, _BYTE *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v5 + 48), "PathController")
      && *(_DWORD *)(v5 + 212) == 140)
    {
      uint64_t v6 = 0LL;
      while (1)
      {
        int v7 = *(_DWORD *)(v5 + 272 + 4 * v6);
        if (!v7 || v7 == a2) {
          break;
        }
        dispatch_queue_t result = 0LL;
        if (++v6 == 4) {
          return result;
        }
      }

      if (a3) {
        *a3 = *(_BYTE *)(v5 + 288) & 1;
      }
      return *(unsigned int *)(v5 + 4 * v6 + 256);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t ne_session_agent_get_advisory( uint64_t result, int a2, _BYTE *a3, BOOL *a4, BOOL *a5, BOOL *a6, _DWORD *a7, void *a8, void *a9)
{
  if (result)
  {
    uint64_t v16 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v16 + 48), "PathController")
      && *(_DWORD *)(v16 + 212) == 140)
    {
      uint64_t v17 = 0LL;
      while (1)
      {
        int v18 = *(_DWORD *)(v16 + 272 + 4 * v17);
        if (!v18 || v18 == a2) {
          break;
        }
        dispatch_queue_t result = 0LL;
        if (++v17 == 4) {
          return result;
        }
      }

      if (a3) {
        *a3 = *(_BYTE *)(v16 + 288) & 1;
      }
      if (a4) {
        *a4 = (*(_BYTE *)(v16 + 288) & 2) != 0;
      }
      if (a5) {
        *a5 = (*(_BYTE *)(v16 + 288) & 4) != 0;
      }
      if (a6) {
        *a6 = (*(_BYTE *)(v16 + 288) & 8) != 0;
      }
      if (a7) {
        *a7 = *(_DWORD *)(v16 + 4 * v17 + 256);
      }
      if (a8) {
        *a8 = v16 + 289;
      }
      if (a9) {
        *a9 = v16 + 321;
      }
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

const char *ne_session_stop_reason_to_string(int a1)
{
  else {
    return off_18A06E6D8[a1 - 1];
  }
}

xpc_object_t ne_copy_signing_identifier_for_pid(int a1)
{
  return ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0LL);
}

xpc_object_t ne_copy_signing_identifier_for_pid_with_audit_token(int a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  bzero(v17, 0x400uLL);
  unint64_t v4 = 1023LL;
  uint64_t v5 = v17;
  while (a2)
  {
LABEL_6:
    uint64_t v6 = __error();
    if (v5 != v17 || *v6 != 34)
    {
      uint64_t v9 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint32_t v10 = __error();
        size_t v11 = strerror(*v10);
        int v15 = 67109378;
        LODWORD(v16[0]) = a1;
        WORD2(v16[0]) = 2080;
        *(void *)((char *)v16 + 6) = v11;
        _os_log_error_impl( &dword_187528000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to get the signing identifier for %d: %s",  (uint8_t *)&v15,  0x12u);
      }

      goto LABEL_18;
    }

    unint64_t v4 = bswap32(v18);
    if ((v4 - 1048577) <= 0xFFF00006)
    {
      uint64_t v12 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134217984;
        v16[0] = v4;
        _os_log_error_impl( &dword_187528000,  v12,  OS_LOG_TYPE_ERROR,  "signing identifier length is invalid: %lu",  (uint8_t *)&v15,  0xCu);
      }

      uint64_t v5 = 0LL;
LABEL_18:
      xpc_object_t v8 = 0LL;
      BOOL v13 = v5 != 0LL;
      goto LABEL_21;
    }

    uint64_t v5 = malloc(v4 + 1);
    if (!v5) {
      goto LABEL_18;
    }
  }

void *ne_copy_signature_info_for_pid(int a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  unint64_t v2 = (unint64_t)ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0LL);
  bytes[0] = 0LL;
  bytes[1] = 0LL;
  int v15 = 0;
  if (csops())
  {
    char v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = __error();
      uint32_t v10 = strerror(*v9);
      v11[0] = 67109378;
      v11[1] = a1;
      __int16 v12 = 2080;
      BOOL v13 = v10;
      _os_log_error_impl( &dword_187528000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to get the code directory hash for %d: %s",  (uint8_t *)v11,  0x12u);
    }

    unint64_t v4 = 0LL;
  }

  else
  {
    unint64_t v4 = (unint64_t)xpc_data_create(bytes, 0x14uLL);
  }

  if (!(v4 | v2)) {
    return 0LL;
  }
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4) {
      xpc_dictionary_set_value(v5, "SourceAppUniqueIdentifier", (xpc_object_t)v4);
    }
    if (v2)
    {
      xpc_dictionary_set_value(v6, "SourceAppSigningIdentifier", (xpc_object_t)v2);
      if (!v4) {
        goto LABEL_17;
      }
LABEL_16:
      xpc_release((xpc_object_t)v4);
      goto LABEL_17;
    }

void ne_force_reset_uuid_cache()
{
  if (g_uuid_cache)
  {
    xpc_release((xpc_object_t)g_uuid_cache);
    g_uuid_cache = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
}

void *ne_copy_uuid_cache_locked()
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  getpid();
  if (!sandbox_check())
  {
    getpid();
    if (!sandbox_check())
    {
      int v3 = ne_uuid_cache_changed_cache_change_token;
      if (ne_uuid_cache_changed_cache_change_token == -1)
      {
        uint32_t v4 = notify_register_check("com.apple.networkextension.uuidcache", &ne_uuid_cache_changed_cache_change_token);
        if (v4)
        {
          uint32_t v5 = v4;
          ne_uuid_cache_changed_cache_change_token = -1;
          uint64_t v6 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136315394;
            *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v5;
            _os_log_error_impl( &dword_187528000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to register for %s notifications: %u",  buf,  0x12u);
          }
        }

        int v3 = ne_uuid_cache_changed_cache_change_token;
      }

      uint64_t v7 = ne_uuid_cache_changed_cache_generation;
      *(void *)char v53 = ne_uuid_cache_changed_cache_generation;
      if (v3 < 0) {
        goto LABEL_17;
      }
      int check = 0;
      uint32_t v8 = notify_check(v3, &check);
      if (v8)
      {
        uint32_t v9 = v8;
        uint32_t v10 = (os_log_s *)ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
LABEL_15:
          notify_cancel(ne_uuid_cache_changed_cache_change_token);
          uint64_t v7 = 0LL;
          ne_uuid_cache_changed_cache_change_token = -1;
          *(void *)char v53 = 0LL;
          goto LABEL_16;
        }

        *(_DWORD *)__int128 buf = 136315650;
        *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        BOOL v20 = "Failed to check for changes to notification %s, token %d: %u";
LABEL_53:
        _os_log_error_impl(&dword_187528000, v10, OS_LOG_TYPE_ERROR, v20, buf, 0x18u);
        goto LABEL_15;
      }

      if (check)
      {
        uint32_t state = notify_get_state(ne_uuid_cache_changed_cache_change_token, (uint64_t *)v53);
        if (state)
        {
          uint32_t v19 = state;
          uint32_t v10 = (os_log_s *)ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          *(_DWORD *)__int128 buf = 136315650;
          *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v19;
          BOOL v20 = "Failed to get the state of notification %s, token %d: %u";
          goto LABEL_53;
        }

        uint64_t v7 = *(void *)v53;
      }

LABEL_16:
      if (v7 != ne_uuid_cache_changed_cache_generation)
      {
        size_t v11 = (os_log_s *)ne_log_obj();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        uint64_t v13 = *(void *)v53;
        if (v12)
        {
          *(_DWORD *)__int128 buf = 134218240;
          *(void *)&uint8_t buf[4] = ne_uuid_cache_changed_cache_generation;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = *(void *)v53;
          _os_log_debug_impl( &dword_187528000,  v11,  OS_LOG_TYPE_DEBUG,  "UUID cache generation changed from %llu to %llu",  buf,  0x16u);
          uint64_t v13 = *(void *)v53;
        }

        ne_uuid_cache_changed_cache_generation = v13;
        g_ne_read_uuid_cache = 1;
        if (g_uuid_cache)
        {
          xpc_release((xpc_object_t)g_uuid_cache);
          g_uuid_cache = 0LL;
        }

        goto LABEL_23;
      }

LABEL_49:
        close(v15);
        goto LABEL_50;
      }

      unsigned int v29 = v28;
      ssize_t v30 = pread(v15, v28, st_size, 0LL);
      if (v30 != st_size)
      {
        ssize_t v34 = v30;
        int v35 = *__error();
        int v36 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)char v53 = 136316162;
          *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 2048;
          *(void *)&v53[14] = v34;
          *(_WORD *)&v53[22] = 2048;
          *(void *)&v53[24] = st_size;
          *(_WORD *)&v53[32] = 1024;
          *(_DWORD *)&v53[34] = v35;
          __int16 v54 = 2080;
          int v55 = buf;
          _os_log_fault_impl( &dword_187528000,  v36,  OS_LOG_TYPE_FAULT,  "Failed to read entire contents of %s, %ld != %lu: [%d] %s",  v53,  0x30u);
        }

        goto LABEL_58;
      }

      uint64_t v31 = xpc_create_from_plist();
      if (!v31)
      {
LABEL_58:
        close(v15);
        free(v29);
        goto LABEL_50;
      }

      unint64_t v32 = (void *)v31;
      if (MEMORY[0x1895A89D8]() != MEMORY[0x1895F9250])
      {
LABEL_46:
        xpc_release(v32);
        goto LABEL_58;
      }

      if (ne_copy_uuid_cache_locked_once_token != -1) {
        dispatch_once(&ne_copy_uuid_cache_locked_once_token, &__block_literal_global_155);
      }
      string = xpc_dictionary_get_string(v32, "os-version");
      if (string)
      {
        if (ne_copy_uuid_cache_locked_g_my_os_version)
        {
          __int16 v38 = string;
          if (strcmp(string, (const char *)ne_copy_uuid_cache_locked_g_my_os_version))
          {
            int v39 = (os_log_s *)ne_log_obj();
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_77;
            }
            *(_DWORD *)__int128 buf = 136315394;
            *(void *)&uint8_t buf[4] = ne_copy_uuid_cache_locked_g_my_os_version;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v38;
            unint64_t v40 = "Not using the UUID cache because the current OS version (%s) does not equal the cache OS version (%s)";
            p_int check = buf;
            uint64_t v42 = v39;
LABEL_76:
            _os_log_impl(&dword_187528000, v42, OS_LOG_TYPE_DEFAULT, v40, p_check, 0x16u);
LABEL_77:
            if (g_uuid_cache) {
              goto LABEL_58;
            }
            goto LABEL_46;
          }
        }

        else
        {
          unint64_t v43 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_error_impl( &dword_187528000,  v43,  OS_LOG_TYPE_ERROR,  "Failed to get the current OS version",  buf,  2u);
          }
        }
      }

      memset(dst, 0, sizeof(dst));
      size_t length = 0LL;
      data = (const unsigned __int8 *)xpc_dictionary_get_data(v32, "boot-uuid", &length);
      if (length != 16
        || (uuid_copy(dst, data), uuid_is_null(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
        || !uuid_compare(dst, ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
      {
        g_uuid_cache = (uint64_t)v32;
        goto LABEL_58;
      }

      memset(buf, 0, 37);
      memset(v53, 0, 37);
      uuid_unparse(ne_copy_uuid_cache_locked_g_my_boot_session_uuid, (char *)buf);
      uuid_unparse(dst, v53);
      uint64_t v45 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_77;
      }
      int check = 136315394;
      int v49 = buf;
      __int16 v50 = 2080;
      __int128 v51 = v53;
      unint64_t v40 = "Not using the UUID cache because the current boot session UUID (%s) does not equal the cache boot session UUID (%s)";
      p_int check = (uint8_t *)&check;
      uint64_t v42 = v45;
      goto LABEL_76;
    }
  }

  int v0 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187528000, v0, OS_LOG_TYPE_DEFAULT, "UUID cache sandbox check failed", buf, 2u);
  }

  return 0LL;
}

void __ne_copy_uuid_cache_locked_block_invoke()
{
  ne_copy_uuid_cache_locked_g_my_os_version = (uint64_t)ne_session_copy_os_version_string();
  if (!ne_copy_uuid_cache_locked_g_my_os_version)
  {
    int v0 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_187528000, v0, OS_LOG_TYPE_FAULT, "Failed to get the current OS version", buf, 2u);
    }
  }

  if (!ne_session_get_boot_session_uuid(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
  {
    char v1 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v2 = 0;
      _os_log_fault_impl(&dword_187528000, v1, OS_LOG_TYPE_FAULT, "Failed to get the boot session uuid", v2, 2u);
    }
  }

void *ne_session_copy_os_version_string()
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  size_t v9 = 0LL;
  if (sysctlbyname("kern.osversion", 0LL, &v9, 0LL, 0LL))
  {
    int v0 = *__error();
    if (strerror_r(v0, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    char v1 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)size_t v11 = v0;
      *(_WORD *)&v11[4] = 2080;
      *(void *)&void v11[6] = __strerrbuf;
      _os_log_fault_impl( &dword_187528000,  v1,  OS_LOG_TYPE_FAULT,  "Failed to get the size of the kern.osversion sysctl value: [%d] %s",  buf,  0x12u);
    }
  }

  else
  {
    size_t v4 = v9 + 1;
    uint32_t v5 = malloc(v9 + 1);
    if (v5)
    {
      unint64_t v2 = v5;
      bzero(v5, v4);
      if (!sysctlbyname("kern.osversion", v2, &v9, 0LL, 0LL)) {
        return v2;
      }
      int v6 = *__error();
      if (strerror_r(v6, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      uint64_t v7 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 134218498;
        *(void *)size_t v11 = v9;
        *(_WORD *)&v11[8] = 1024;
        *(_DWORD *)&v11[10] = v6;
        __int16 v12 = 2080;
        uint64_t v13 = __strerrbuf;
        _os_log_fault_impl( &dword_187528000,  v7,  OS_LOG_TYPE_FAULT,  "Failed to get the kern.osversion sysctl value (%lu bytes): [%d] %s",  buf,  0x1Cu);
      }

      free(v2);
    }

    else
    {
      uint32_t v8 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerr__int128 buf = 134217984;
        size_t v15 = v9 + 1;
        _os_log_error_impl( &dword_187528000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to allocate %lu bytes for the version string",  (uint8_t *)__strerrbuf,  0xCu);
      }
    }
  }

  return 0LL;
}

BOOL ne_session_get_boot_session_uuid(unsigned __int8 *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  memset(in, 0, sizeof(in));
  size_t v6 = 37LL;
  int v2 = sysctlbyname("kern.bootsessionuuid", in, &v6, 0LL, 0LL);
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    size_t v4 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 67109378;
      int v8 = v3;
      __int16 v9 = 2080;
      uint32_t v10 = __strerrbuf;
      _os_log_fault_impl( &dword_187528000,  v4,  OS_LOG_TYPE_FAULT,  "Failed to get kern.bootsessionuuid: [%d] %s",  buf,  0x12u);
    }
  }

  else
  {
    uuid_parse(in, a1);
  }

  return v2 == 0;
}

void *ne_copy_uuid_cache()
{
  int v0 = ne_copy_uuid_cache_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v0;
}

xpc_object_t ne_copy_cached_uuids_for_bundle_identifier(const char *a1, int a2)
{
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  size_t v4 = ne_copy_uuid_cache_locked();
  if (!v4)
  {
    xpc_object_t v8 = 0LL;
    goto LABEL_6;
  }

  uint32_t v5 = v4;
  uint64_t v6 = MEMORY[0x1895A89D8]();
  uint64_t v7 = MEMORY[0x1895F9250];
  if (v6 != MEMORY[0x1895F9250]) {
    goto LABEL_3;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "uuid-mappings");
  if (dictionary && (size_t v11 = dictionary, MEMORY[0x1895A89D8]() == v7))
  {
    xpc_object_t value = xpc_dictionary_get_value(v11, a1);
    if (value)
    {
      uint64_t v13 = value;
      uint64_t v14 = MEMORY[0x1895A89D8]();
      uint64_t v15 = MEMORY[0x1895F9220];
      if (v14 == MEMORY[0x1895F9220])
      {
        if (!xpc_array_get_count(v13) && (a2 & 1) != 0) {
          goto LABEL_10;
        }
      }

      else if (a2)
      {
        goto LABEL_10;
      }

      if (MEMORY[0x1895A89D8](v13) == v15)
      {
        xpc_object_t v8 = xpc_array_create(0LL, 0LL);
        applier[0] = MEMORY[0x1895F87A8];
        applier[1] = 0x40000000LL;
        applier[2] = __ne_copy_cached_uuids_for_bundle_identifier_block_invoke;
        applier[3] = &__block_descriptor_tmp_160;
        applier[4] = v8;
        xpc_array_apply(v13, applier);
        g_ne_uuid_cache_hit = 1;
        goto LABEL_4;
      }

      goto LABEL_3;
    }

    if ((a2 & 1) != 0) {
      goto LABEL_10;
    }
  }

  else if (a2)
  {
LABEL_10:
    xpc_object_t v8 = ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(a1, v5);
    goto LABEL_4;
  }

LABEL_3:
  xpc_object_t v8 = 0LL;
LABEL_4:
  xpc_release(v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v8;
}

xpc_object_t ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(const char *a1, void *a2)
{
  buffer[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = MEMORY[0x1895A89D8](a2);
  uint64_t v5 = MEMORY[0x1895F9250];
  if (v4 == MEMORY[0x1895F9250])
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(a2, "synthesized-uuid-mappings");
    if (dictionary)
    {
      __int16 v9 = dictionary;
      if (MEMORY[0x1895A89D8]() == v5)
      {
        xpc_object_t value = xpc_dictionary_get_value(v9, a1);
        xpc_object_t v6 = value;
        if (!value) {
          return v6;
        }
        if (MEMORY[0x1895A89D8](value) == MEMORY[0x1895F9240])
        {
          buffer[0] = 0LL;
          buffer[1] = 0LL;
          size_t bytes = xpc_data_get_bytes(v6, buffer, 0LL, 0x10uLL);
          size_t length = xpc_data_get_length(v6);
          xpc_object_t v6 = 0LL;
          if (bytes != length) {
            return v6;
          }
          xpc_object_t v13 = xpc_uuid_create((const unsigned __int8 *)buffer);
          if (v13)
          {
            uint64_t v14 = v13;
            xpc_object_t v6 = xpc_array_create(0LL, 0LL);
            xpc_array_append_value(v6, v14);
            xpc_release(v14);
            g_ne_uuid_cache_hit = 1;
            return v6;
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t __ne_copy_cached_uuids_for_bundle_identifier_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (MEMORY[0x1895A89D8](a3) == MEMORY[0x1895F9240])
    {
      size_t bytes = xpc_data_get_bytes(a3, buffer, 0LL, 0x10uLL);
      if (bytes == xpc_data_get_length(a3))
      {
        xpc_object_t v6 = xpc_uuid_create(buffer);
        if (v6)
        {
          uint64_t v7 = v6;
          xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
          xpc_release(v7);
        }
      }
    }
  }

  return 1LL;
}

uint64_t ne_copy_cached_bundle_identifier_for_uuid(uint64_t a1)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  int v2 = ne_copy_uuid_cache_locked();
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = MEMORY[0x1895A89D8]();
    uint64_t v5 = MEMORY[0x1895F9250];
    if (v4 == MEMORY[0x1895F9250])
    {
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "uuid-mappings");
      if (!dictionary) {
        goto LABEL_17;
      }
      uint64_t v7 = dictionary;
      if (MEMORY[0x1895A89D8]() != v5
        || (v13[0] = MEMORY[0x1895F87A8],
            v13[1] = 0x40000000LL,
            void v13[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke,
            v13[3] = &unk_18A06E068,
            v13[4] = &v14,
            v13[5] = a1,
            xpc_dictionary_apply(v7, v13),
            !v15[3]))
      {
LABEL_17:
        if (MEMORY[0x1895A89D8](v3) == v5
          && (xpc_object_t v11 = xpc_dictionary_get_dictionary(v3, "synthesized-uuid-mappings")) != 0LL
          && (__int16 v12 = v11, MEMORY[0x1895A89D8]() == v5))
        {
          uint64_t v19 = 0LL;
          BOOL v20 = &v19;
          uint64_t v21 = 0x2000000000LL;
          uint64_t v22 = 0LL;
          applier[0] = MEMORY[0x1895F87A8];
          applier[1] = 0x40000000LL;
          applier[2] = __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke;
          applier[3] = &unk_18A06E620;
          applier[4] = &v19;
          void applier[5] = a1;
          xpc_dictionary_apply(v12, applier);
          uint64_t v8 = v20[3];
          _Block_object_dispose(&v19, 8);
        }

        else
        {
          uint64_t v8 = 0LL;
        }

        v15[3] = v8;
      }
    }

    xpc_release(v3);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  uint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __ne_copy_cached_bundle_identifier_for_uuid_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  if (a3)
  {
    if (MEMORY[0x1895A89D8](a3) == MEMORY[0x1895F9220])
    {
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 0x40000000LL;
      applier[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2;
      applier[3] = &__block_descriptor_tmp_161_301;
      applier[4] = *(void *)(a1 + 40);
      if (!xpc_array_apply(a3, applier))
      {
        xpc_object_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
        if (!v6)
        {
LABEL_7:
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_string_create(a2);
          return 1LL;
        }

        size_t length = xpc_string_get_length(v6);
        if (strlen(a2) < length)
        {
          xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
          goto LABEL_7;
        }
      }
    }
  }

  return 1LL;
}

uint64_t __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke( uint64_t a1, const char *a2, void *a3)
{
  buffer[2] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 1LL;
  }
  if (MEMORY[0x1895A89D8](a3) != MEMORY[0x1895F9240]) {
    return 1LL;
  }
  buffer[0] = 0LL;
  buffer[1] = 0LL;
  size_t bytes = xpc_data_get_bytes(a3, buffer, 0LL, 0x10uLL);
  if (bytes != xpc_data_get_length(a3)
    || uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 40)))
  {
    return 1LL;
  }

  xpc_object_t v8 = xpc_string_create(a2);
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v8;
  return result;
}

BOOL __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3
    && MEMORY[0x1895A89D8](a3) == MEMORY[0x1895F9240]
    && (size_t bytes = xpc_data_get_bytes(a3, buffer, 0LL, 0x10uLL), bytes == xpc_data_get_length(a3)))
  {
    return uuid_compare(buffer, *(const unsigned __int8 **)(a1 + 32)) != 0;
  }

  else
  {
    return 1LL;
  }

BOOL ne_session_is_safeboot()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  *(void *)uint64_t v4 = 0x4200000001LL;
  int v3 = 0;
  size_t v2 = 4LL;
  if (sysctl(v4, 2u, &v3, &v2, 0LL, 0LL)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = v3 == 0;
  }
  return !v0;
}

unsigned __int8 *ne_is_sockaddr_valid(unsigned __int8 *result, unint64_t a2)
{
  if (result)
  {
    int v2 = result[1];
    if (v2 == 30)
    {
      unint64_t v3 = *result;
      BOOL v4 = v3 > 0x1B;
    }

    else
    {
      if (v2 != 2) {
        return 0LL;
      }
      unint64_t v3 = *result;
      BOOL v4 = v3 > 0xF;
    }

    return (unsigned __int8 *)(v4 && v3 <= a2);
  }

  return result;
}

uint64_t ne_session_set_socket_tracker_attributes(int a1, char *__s, const char *a3, const char *a4)
{
  if (a1 == -1) {
    return 0LL;
  }
  BOOL v4 = a4;
  xpc_object_t v6 = __s;
  if (!__s && !a3 && !a4) {
    return 1LL;
  }
  if (!__s)
  {
    size_t v9 = 0LL;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  size_t v9 = strlen(__s) + 6;
  if (a3) {
LABEL_9:
  }
    v9 += strlen(a3) + 6;
LABEL_10:
  if (v4) {
    v9 += strlen(v4) + 6;
  }
  uint64_t result = (uint64_t)malloc(v9);
  if (result)
  {
    uint64_t v10 = (char *)result;
    bzero((void *)result, v9);
    uint64_t v11 = (uint64_t)v10;
    if (v6)
    {
      size_t v12 = strlen(v6);
      if (v12 >= 2)
      {
        size_t v13 = v12 - 1;
        if (v6[v12 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_227[v13] = 0;
          xpc_object_t v6 = ne_session_trim_domain_domain_buffer_227;
        }
      }

      int v14 = strlen(v6);
      char *v10 = 7;
      size_t v15 = (v14 + 1);
      *(_DWORD *)(v10 + 1) = v15;
      if (v14 == -1) {
        size_t v15 = 0LL;
      }
      else {
        memcpy(v10 + 5, v6, v15);
      }
      uint64_t v11 = (uint64_t)&v10[v15 + 5];
    }

    if (a3)
    {
      int v16 = strlen(a3);
      *(_BYTE *)uint64_t v11 = 11;
      size_t v17 = (v16 + 1);
      *(_DWORD *)(v11 + 1) = v17;
      if (v16 == -1) {
        size_t v17 = 0LL;
      }
      else {
        memcpy((void *)(v11 + 5), a3, v17);
      }
      v11 += v17 + 5;
    }

    if (v4)
    {
      size_t v18 = strlen(v4);
      if (v18 >= 2)
      {
        size_t v19 = v18 - 1;
        if (v4[v18 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_227[v19] = 0;
          BOOL v4 = ne_session_trim_domain_domain_buffer_227;
        }
      }

      int v20 = strlen(v4);
      *(_BYTE *)uint64_t v11 = 12;
      size_t v21 = (v20 + 1);
      *(_DWORD *)(v11 + 1) = v21;
      if (v20 != -1) {
        memcpy((void *)(v11 + 5), v4, v21);
      }
    }

    int v22 = setsockopt(a1, 0xFFFF, 4361, v10, v9);
    free(v10);
    return v22 == 0;
  }

  return result;
}

char *ne_session_set_socket_context_attribute(int a1, char *__s)
{
  if (a1 == -1) {
    return 0LL;
  }
  if (__s) {
    size_t v4 = strlen(__s) + 6;
  }
  else {
    size_t v4 = 5LL;
  }
  uint64_t result = (char *)malloc(v4);
  if (result)
  {
    xpc_object_t v6 = result;
    bzero(result, v4);
    if (__s)
    {
      int v7 = strlen(__s);
      *xpc_object_t v6 = 13;
      size_t v8 = (v7 + 1);
      *(_DWORD *)(v6 + 1) = v8;
      if (v7 != -1) {
        memcpy(v6 + 5, __s, v8);
      }
    }

    else
    {
      *xpc_object_t v6 = 13;
      *(_DWORD *)(v6 + 1) = 0;
    }

    int v9 = setsockopt(a1, 0xFFFF, 4361, v6, v4);
    free(v6);
    return (char *)(v9 == 0);
  }

  return result;
}

uint64_t ne_session_copy_socket_domain_attributes(int a1, void **a2, void **a3, void **a4, void **a5)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  bzero(v33, 0x300uLL);
  socklen_t v32 = 768;
  if (a1 == -1) {
    return 0LL;
  }
  if (a2 || a3 || a4)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v33, &v32))
    {
      if (a2 && v32)
      {
        uint64_t v12 = 0LL;
        int v13 = 0;
        while (1)
        {
          int v14 = &v33[v12];
          size_t v15 = *(unsigned int *)&v33[v12 + 1];
          if (v33[v12] == 7) {
            break;
          }
          uint64_t v12 = (v13 + v15 + 5);
          int v13 = v12;
        }

        if ((_DWORD)v15)
        {
          int v16 = calloc(v15 + 1, 1uLL);
          *a2 = v16;
          if (v16) {
            memcpy(v16, v14 + 5, v15);
          }
        }

        else
        {
          *a2 = calloc(1uLL, 1uLL);
        }
      }

LABEL_19:
      if (a3 && v32)
      {
        uint64_t v17 = 0LL;
        int v18 = 0;
        while (1)
        {
          size_t v19 = &v33[v17];
          size_t v20 = *(unsigned int *)&v33[v17 + 1];
          if (v33[v17] == 11) {
            break;
          }
          uint64_t v17 = (v18 + v20 + 5);
          int v18 = v17;
        }

        if ((_DWORD)v20)
        {
          size_t v21 = calloc(v20 + 1, 1uLL);
          *a3 = v21;
          if (v21) {
            memcpy(v21, v19 + 5, v20);
          }
        }

        else
        {
          *a3 = calloc(1uLL, 1uLL);
        }
      }

void ne_session_clear_caches()
{
  if (_ne_session_cache_notify_token != -1)
  {
    notify_cancel(_ne_session_cache_notify_token);
    _ne_session_cache_notify_token = -1;
  }

  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0LL;
  }

  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

CFMutableDictionaryRef init_app_cache(CFMutableDictionaryRef result, CFIndex capacity)
{
  if (result)
  {
    CFMutableDictionaryRef v2 = result;
    *(_DWORD *)uint64_t result = capacity;
    uint64_t result = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  capacity,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    *((void *)v2 + 3) = 0LL;
    CFMutableDictionaryRef v2 = (CFMutableDictionaryRef)((char *)v2 + 24);
    *((void *)v2 - 2) = result;
    *((_DWORD *)v2 - 2) = 0;
    *((void *)v2 + 1) = v2;
  }

  return result;
}

void dealloc_app_cache(uint64_t a1)
{
  if (a1)
  {
    while (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8)))
      dealloc_appdata_node(a1, **(uint64_t ***)(*(void *)(a1 + 32) + 8LL));
    CFRelease(*(CFTypeRef *)(a1 + 8));
  }

void dealloc_appdata_node(uint64_t a1, uint64_t *a2)
{
  if (a1 && a2)
  {
    uint64_t v3 = *a2;
    size_t v4 = (void *)a2[1];
    if (*a2)
    {
      *(void *)(v3 + 8) = v4;
      size_t v4 = (void *)a2[1];
    }

    else
    {
      *(void *)(a1 + 32) = v4;
    }

    *size_t v4 = v3;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), (const void *)a2[2]);
    CFRelease((CFTypeRef)a2[3]);
    free(a2);
  }

void *add_appdata_node(void *result, void *a2)
{
  if (result && a2)
  {
    uint64_t v2 = result[3];
    result += 3;
    *a2 = v2;
    uint64_t v3 = (void *)(v2 + 8);
    if (v2) {
      size_t v4 = v3;
    }
    else {
      size_t v4 = result + 1;
    }
    *size_t v4 = a2;
    *uint64_t result = a2;
    a2[1] = result;
  }

  return result;
}

uint64_t remove_appdata_node(uint64_t result, uint64_t *a2)
{
  if (result && a2)
  {
    uint64_t v2 = *a2;
    uint64_t v3 = (void *)a2[1];
    if (*a2)
    {
      *(void *)(v2 + 8) = v3;
      uint64_t v3 = (void *)a2[1];
    }

    else
    {
      *(void *)(result + 32) = v3;
    }

    *uint64_t v3 = v2;
  }

  return result;
}

uint64_t **move_node_to_front(uint64_t **result, uint64_t *a2)
{
  if (result && a2)
  {
    uint64_t v2 = *a2;
    uint64_t v3 = (uint64_t *)a2[1];
    if (*a2)
    {
      *(void *)(v2 + 8) = v3;
      uint64_t v3 = (uint64_t *)a2[1];
    }

    else
    {
      result[4] = v3;
    }

    *uint64_t v3 = v2;
    size_t v4 = result[3];
    result += 3;
    *a2 = (uint64_t)v4;
    uint64_t v5 = (uint64_t **)(v4 + 1);
    if (v4) {
      xpc_object_t v6 = v5;
    }
    else {
      xpc_object_t v6 = result + 1;
    }
    *xpc_object_t v6 = a2;
    *uint64_t result = a2;
    a2[1] = (uint64_t)result;
  }

  return result;
}

void *alloc_appdata_node(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t result = malloc(0x20uLL);
    if (result)
    {
      result[2] = a1;
      result[3] = a2;
    }
  }

  return result;
}

os_unfair_lock_s *NEHelperTrackerCacheGet(os_unfair_lock_s *a1, const void *a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    size_t v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)&v2[2]._os_unfair_lock_opaque, a2);
    if (Value && (BytePtr = CFDataGetBytePtr(Value), (int v7 = *(uint64_t **)BytePtr) != 0LL))
    {
      uint64_t v8 = *v7;
      int v9 = (void *)v7[1];
      if (*v7)
      {
        *(void *)(v8 + 8) = v9;
        int v9 = (void *)v7[1];
      }

      else
      {
        *(void *)&v2[8]._uint32_t os_unfair_lock_opaque = v9;
      }

      void *v9 = v8;
      uint64_t v11 = *(os_unfair_lock_s **)&v2[6]._os_unfair_lock_opaque;
      uint64_t v10 = v2 + 6;
      *int v7 = (uint64_t)v11;
      uint64_t v12 = v11 + 2;
      if (v11) {
        int v13 = v12;
      }
      else {
        int v13 = v10 + 2;
      }
      *(void *)&v13->_uint32_t os_unfair_lock_opaque = v7;
      *(void *)&v10->_uint32_t os_unfair_lock_opaque = v7;
      v7[1] = (uint64_t)v10;
      uint64_t v2 = *(os_unfair_lock_s **)(*(void *)BytePtr + 24LL);
    }

    else
    {
      uint64_t v2 = 0LL;
    }

    os_unfair_lock_unlock(v4);
  }

  return v2;
}

void NEHelperTrackerCachePut(uint64_t a1, const void *a2, uint64_t a3)
{
  if (a1 && a2 && a3)
  {
    xpc_object_t v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    int v7 = *(const __CFDictionary **)(a1 + 8);
    if (v7)
    {
      Value = (const __CFData *)CFDictionaryGetValue(v7, a2);
      if (Value)
      {
        BytePtr = CFDataGetBytePtr(Value);
        uint64_t v10 = *(uint64_t **)BytePtr;
        if (*(void *)BytePtr)
        {
          uint64_t v11 = *v10;
          uint64_t v12 = (void *)v10[1];
          if (*v10)
          {
            *(void *)(v11 + 8) = v12;
            uint64_t v12 = (void *)v10[1];
          }

          else
          {
            *(void *)(a1 + 32) = v12;
          }

          void *v12 = v11;
          uint64_t v22 = *(void *)(a1 + 24);
          size_t v21 = (uint64_t **)(a1 + 24);
          uint64_t *v10 = v22;
          int v23 = (uint64_t **)(v22 + 8);
          if (v22) {
            uint64_t v24 = v23;
          }
          else {
            uint64_t v24 = v21 + 1;
          }
          _BYTE *v24 = v10;
          *size_t v21 = v10;
          v10[1] = (uint64_t)v21;
          *(void *)(*(void *)BytePtr + 24LL) = a3;
        }
      }

      else
      {
        int v13 = malloc(0x20uLL);
        if (v13)
        {
          void v13[2] = a2;
          v13[3] = a3;
        }

        *(void *)size_t bytes = v13;
        CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 8LL);
        if (v14)
        {
          CFDataRef v15 = v14;
          CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, v14);
          CFRelease(v15);
        }

        uint64_t v16 = *(void *)bytes;
        if (*(void *)bytes)
        {
          uint64_t v18 = *(void *)(a1 + 24);
          uint64_t v17 = (void *)(a1 + 24);
          **(void **)size_t bytes = v18;
          size_t v19 = (void *)(v18 + 8);
          if (v18) {
            size_t v20 = v19;
          }
          else {
            size_t v20 = v17 + 1;
          }
          void *v20 = v16;
          void *v17 = v16;
          *(void *)(v16 + 8) = v17;
        }
      }

      os_unfair_lock_unlock(v6);
    }

    else
    {
      os_unfair_lock_unlock(v6);
    }
  }

void myCFRelease(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0LL;
    }
  }

CFTypeRef myCFRetain(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void myCFReplace(CFTypeRef *a1, CFTypeRef cf)
{
  if (a1)
  {
    if (cf) {
      CFTypeRef v3 = CFRetain(cf);
    }
    else {
      CFTypeRef v3 = 0LL;
    }
    if (*a1) {
      CFRelease(*a1);
    }
    *a1 = v3;
  }

uint64_t myCFEqual(unint64_t cf1, unint64_t a2)
{
  if (!(cf1 | a2)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if (cf1)
  {
    if (a2) {
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
    }
  }

  return result;
}

void myCFDataReleaseReset(CFDataRef *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(v2);
      if (MutableBytePtr)
      {
        size_t v4 = MutableBytePtr;
        rsize_t Length = CFDataGetLength(*a1);
        rsize_t v6 = CFDataGetLength(*a1);
        memset_s(v4, Length, 0, v6);
      }

      CFRelease(*a1);
      *a1 = 0LL;
    }
  }

__CFData *myCFDataCreateMutableCopy(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  CFTypeRef v3 = 0LL;
  if (a2)
  {
    if (a3)
    {
      Mutable = CFDataCreateMutable(a1, 0LL);
      CFTypeRef v3 = Mutable;
      if (Mutable) {
        CFDataAppendBytes(Mutable, a2, a3);
      }
    }
  }

  return v3;
}

CFDataRef myCFDataCreateMutableCopyOfData(const __CFData *theData)
{
  if (theData)
  {
    theData = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theData);
    if (!theData)
    {
      char v1 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v2 = 0;
        _os_log_fault_impl(&dword_187528000, v1, OS_LOG_TYPE_FAULT, "CFDataCreateMutableCopy failed", v2, 2u);
      }

      return 0LL;
    }
  }

  return theData;
}

void myCFDataResetReplace(CFDataRef *a1, CFDataRef theData)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    MutableCopyOfData = myCFDataCreateMutableCopyOfData(theData);
    myCFDataReleaseReset(a1);
    *a1 = MutableCopyOfData;
  }

  else
  {
    size_t v4 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      rsize_t v6 = "myCFDataResetReplace";
      _os_log_fault_impl(&dword_187528000, v4, OS_LOG_TYPE_FAULT, "%s called with null oldP", (uint8_t *)&v5, 0xCu);
    }
  }

__CFData *myCFDataCreateMutableFromString(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  if (!CFStringGetLength(a1)) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  size_t v4 = (char *)malloc(v3);
  if (!v4) {
    return 0LL;
  }
  int v5 = (UInt8 *)v4;
  CFStringGetCString(a1, v4, v3, 0x8000100u);
  rsize_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFIndex v7 = CFStringGetLength(a1);
  MutableCopy = myCFDataCreateMutableCopy(v6, v5, v7);
  memset_s(v5, v3, 0, v3);
  free(v5);
  return MutableCopy;
}

void myCFDataResetReplaceFromString(CFDataRef *a1, CFStringRef theString)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    MutableCopy = theString;
    if (theString)
    {
      if (CFStringGetLength(theString) >= 1)
      {
        CFIndex Length = CFStringGetLength(MutableCopy);
        CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
        rsize_t v6 = (char *)malloc(v5);
        if (v6)
        {
          CFIndex v7 = (UInt8 *)v6;
          CFStringGetCString(MutableCopy, v6, v5, 0x8000100u);
          uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFIndex v9 = CFStringGetLength(MutableCopy);
          MutableCopy = (const __CFString *)myCFDataCreateMutableCopy(v8, v7, v9);
          memset_s(v7, v5, 0, v5);
          free(v7);
          goto LABEL_9;
        }

        uint64_t v10 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          int v12 = 67109120;
          LODWORD(v13) = v5;
          _os_log_fault_impl(&dword_187528000, v10, OS_LOG_TYPE_FAULT, "malloc(%u) failed", (uint8_t *)&v12, 8u);
        }
      }

      MutableCopy = 0LL;
    }

LABEL_9:
    myCFDataReleaseReset(a1);
    *a1 = (CFDataRef)MutableCopy;
    return;
  }

  uint64_t v11 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v12 = 136315138;
    int v13 = "myCFDataResetReplaceFromString";
    _os_log_fault_impl(&dword_187528000, v11, OS_LOG_TYPE_FAULT, "%s called with null oldP", (uint8_t *)&v12, 0xCu);
  }

    MEMORY[0x1895A7EC8](v13);
  }

  return p_ifa_next;
}

const void *NEIsValidCFType(const void *result, uint64_t a2)
{
  if (result) {
    return (const void *)(CFGetTypeID(result) == a2);
  }
  return result;
}

const void *NEGetValueWithType(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFIndex v3 = 0LL;
  if (a1)
  {
    if (a2)
    {
      Value = CFDictionaryGetValue(a1, a2);
      if (!Value) {
        return 0LL;
      }
      CFIndex v3 = Value;
      if (CFGetTypeID(Value) != a3) {
        return 0LL;
      }
    }
  }

  return v3;
}

void NEInitCFTypes()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_318);
  }
}

CFTypeID __NEInitCFTypes_block_invoke()
{
  CFSTRING_TYPE = CFStringGetTypeID();
  CFNUMBER_TYPE = CFNumberGetTypeID();
  CFBOOLEAN_TYPE = CFBooleanGetTypeID();
  CFARRAY_TYPE = CFArrayGetTypeID();
  CFDICTIONARY_TYPE = CFDictionaryGetTypeID();
  CFTypeID result = CFDataGetTypeID();
  CFDATA_TYPE = result;
  return result;
}

void *NEMapIntegerToString(void *result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    CFTypeID result = (void *)*result;
    if (result)
    {
      CFIndex v3 = v2 + 2;
      do
      {
        if (*((_DWORD *)v3 - 2) == a2) {
          break;
        }
        size_t v4 = (void *)*v3;
        v3 += 2;
        CFTypeID result = v4;
      }

      while (v4);
    }
  }

  return result;
}

const void **NEMapStringToInteger(const void **result, CFTypeRef cf1)
{
  if (result)
  {
    CFIndex v3 = result;
    size_t v4 = *result;
    if (*result)
    {
      while (!cf1 || !CFEqual(cf1, v4))
      {
        CFIndex v5 = v3[2];
        v3 += 2;
        size_t v4 = v5;
        if (!v5) {
          return 0LL;
        }
      }

      return (const void **)*((unsigned int *)v3 + 2);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t NEInChecksum(unsigned __int16 *a1, int a2)
{
  if (a2 < 2)
  {
    unsigned int v2 = 0;
  }

  else
  {
    unsigned int v2 = 0;
    unsigned int v3 = a2;
    do
    {
      int v4 = *a1++;
      v2 += v4;
      a2 = v3 - 2;
      BOOL v5 = v3 > 3;
      v3 -= 2;
    }

    while (v5);
  }

  if (a2 == 1) {
    v2 += *(unsigned __int8 *)a1;
  }
  return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
}

void *NECreateAddressStructFromString(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = 0LL;
  if (!a1) {
    return 0LL;
  }
  CFIndex v6 = CFStringGetLength(a1) + 1;
  CFIndex v7 = (char *)malloc(v6);
  CFStringGetCString(a1, v7, v6, 0x600u);
  uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (a2) {
    CFIndex v9 = CFStringCreateWithFormat(v8, 0LL, @"%@", a2);
  }
  else {
    CFIndex v9 = CFStringCreateWithFormat(v8, 0LL, @"%d", a3);
  }
  uint64_t v11 = v9;
  CFIndex v12 = CFStringGetLength(v9) + 1;
  int v13 = (char *)malloc(v12);
  CFStringGetCString(v11, v13, v12, 0x600u);
  CFRelease(v11);
  memset(&v17, 0, sizeof(v17));
  v17.ai_socktype = 2;
  v17.ai_flags = 4;
  if (getaddrinfo(v7, v13, &v17, &v16))
  {
    uint64_t v10 = 0LL;
    if (!v7) {
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v10 = malloc(0x80uLL);
    CFDataRef v15 = v16;
    if (v10) {
      __memcpy_chk();
    }
    freeaddrinfo(v15);
    if (!v7) {
      goto LABEL_9;
    }
  }

  free(v7);
LABEL_9:
  if (v13) {
    free(v13);
  }
  return v10;
}

CFStringRef NEGetAddressFamilyFromString(CFStringRef theString)
{
  char v1 = theString;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  CFIndex v6 = 0LL;
  if (theString)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v13 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v8 = 0u;
    CFIndex v2 = CFStringGetLength(theString) + 1;
    unsigned int v3 = (char *)malloc(v2);
    CFStringGetCString(v1, v3, v2, 0x600u);
    memset(&v7, 0, sizeof(v7));
    v7.ai_socktype = 2;
    v7.ai_flags = 4;
    if (!getaddrinfo(v3, 0LL, &v7, &v6))
    {
      BOOL v5 = v6;
      __memcpy_chk();
      freeaddrinfo(v5);
      char v1 = (const __CFString *)BYTE1(v8);
      if (!v3) {
        return v1;
      }
      goto LABEL_4;
    }

    char v1 = 0LL;
    if (v3) {
LABEL_4:
    }
      free(v3);
  }

  return v1;
}

CFDataRef NECreateAddressDataFromString(const __CFString *a1, const __CFString *a2, int *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0LL;
  if (!a1) {
    return 0LL;
  }
  memset(v16, 0, sizeof(v16));
  CFIndex v6 = CFStringGetLength(a1) + 1;
  addrinfo v7 = (char *)malloc(v6);
  CFStringGetCString(a1, v7, v6, 0x600u);
  if (a2)
  {
    CFIndex v8 = CFStringGetLength(a2) + 1;
    __int128 v9 = (char *)malloc(v8);
    CFStringGetCString(a2, v9, v8, 0x600u);
  }

  else
  {
    __int128 v9 = 0LL;
  }

  memset(&v15, 0, sizeof(v15));
  v15.ai_socktype = 2;
  v15.ai_flags = 4;
  if (getaddrinfo(v7, v9, &v15, &v14)) {
    goto LABEL_7;
  }
  __int128 v12 = v14;
  __memcpy_chk();
  freeaddrinfo(v12);
  if (BYTE1(v16[0]) == 30)
  {
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)v16 + 8, 16LL);
    if (!a3) {
      goto LABEL_8;
    }
    int v13 = 30;
    goto LABEL_19;
  }

  if (BYTE1(v16[0]) == 2)
  {
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)v16 + 4, 4LL);
    if (!a3) {
      goto LABEL_8;
    }
    int v13 = 2;
LABEL_19:
    *a3 = v13;
    goto LABEL_8;
  }

CFDataRef NECreateAddressStructDataFromString(const __CFString *a1, const __CFString *a2, int *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0LL;
  if (!a1) {
    return 0LL;
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v21 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  *(_OWORD *)size_t bytes = 0u;
  CFIndex v6 = CFStringGetLength(a1) + 1;
  addrinfo v7 = (char *)malloc(v6);
  CFStringGetCString(a1, v7, v6, 0x600u);
  if (a2)
  {
    CFIndex v8 = CFStringGetLength(a2) + 1;
    __int128 v9 = (char *)malloc(v8);
    CFStringGetCString(a2, v9, v8, 0x600u);
  }

  else
  {
    __int128 v9 = 0LL;
  }

  memset(&v15, 0, sizeof(v15));
  v15.ai_socktype = 2;
  v15.ai_flags = 4;
  if (!getaddrinfo(v7, v9, &v15, &v14))
  {
    __int128 v11 = v14;
    __memcpy_chk();
    freeaddrinfo(v11);
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 128LL);
    int v12 = bytes[1];
    if (bytes[1] == 2)
    {
      if (!a3) {
        goto LABEL_14;
      }
      int v12 = 2;
    }

    else if (!a3 || bytes[1] != 30)
    {
      goto LABEL_14;
    }

    *a3 = v12;
    goto LABEL_14;
  }

  CFDataRef v10 = 0LL;
LABEL_14:
  if (v7) {
    free(v7);
  }
  if (v9) {
    free(v9);
  }
  return v10;
}

CFStringRef NECreateAddressString(CFStringRef result)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (result)
  {
    int v1 = BYTE1(result->isa);
    if (v1 == 30)
    {
      if (LOBYTE(result->isa) >= 0x1Cu)
      {
        p_info = &result->info;
        int v3 = 30;
        goto LABEL_8;
      }
    }

    else if (v1 == 2 && LOBYTE(result->isa) >= 0x10u)
    {
      p_info = (uint64_t *)((char *)&result->isa + 4);
      int v3 = 2;
LABEL_8:
      inet_ntop(v3, p_info, cStr, 0x40u);
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x600u);
    }

    return 0LL;
  }

  return result;
}

__CFString *NECreateAddressStringWithPort(uint64_t a1)
{
  CFIndex v2 = NECreateAddressString((CFStringRef)a1);
  if (!v2) {
    return 0LL;
  }
  int v3 = v2;
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v2);
  CFRelease(v3);
  int v5 = *(unsigned __int8 *)(a1 + 1);
  if (v5 == 30)
  {
    CFIndex v6 = @".%u";
    goto LABEL_7;
  }

  if (v5 == 2)
  {
    CFIndex v6 = @":%u";
LABEL_7:
    CFStringAppendFormat(MutableCopy, 0LL, v6, bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16);
  }

  return MutableCopy;
}

uint64_t NEGetPortFromAddress(uint64_t result)
{
  if (result)
  {
    int v1 = *(unsigned __int8 *)(result + 1);
    if (v1 == 30 || v1 == 2) {
      unsigned int v2 = *(unsigned __int16 *)(result + 2);
    }
    else {
      unsigned int v2 = 0;
    }
    return __rev16(v2);
  }

  return result;
}

CFStringRef NECreateAddressStringFromBuffer(CFStringRef result, unint64_t a2, int a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (result)
  {
    CFStringRef v3 = result;
    if (a2 >= 4 && a3 == 2)
    {
      int v4 = 2;
LABEL_8:
      inet_ntop(v4, v3, cStr, 0x40u);
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x600u);
    }

    CFTypeID result = 0LL;
    if (a2 >= 0x10 && a3 == 30)
    {
      int v4 = 30;
      goto LABEL_8;
    }
  }

  return result;
}

CFStringRef NECreateIPv4AddressMaskStringFromPrefix(int a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1 > 32) {
    return 0LL;
  }
  int __b = 0;
  if (a1 < 8)
  {
    size_t v3 = 0LL;
  }

  else
  {
    size_t v3 = (a1 >> 3) - 1 + 1LL;
    memset(&__b, 255, v3);
  }

  if (a1 <= 0) {
    int v4 = -(-a1 & 7);
  }
  else {
    int v4 = a1 & 7;
  }
  if (v4) {
    cStr[v3 - 4] = 0xFF00u >> v4;
  }
  inet_ntop(2, &__b, cStr, 0x40u);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x600u);
}

CFStringRef NECreateIPv6AddressMaskStringFromPrefix(int a1)
{
  size_t v2 = 0LL;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  __b[0] = 0LL;
  __b[1] = 0LL;
  if (a1 >= 8)
  {
    size_t v2 = (a1 >> 3) - 1 + 1LL;
    memset(__b, 255, v2);
  }

  if (a1 <= 0) {
    int v3 = -(-a1 & 7);
  }
  else {
    int v3 = a1 & 7;
  }
  if (v3) {
    *((_BYTE *)__b + v2) = 0xFF00u >> v3;
  }
  inet_ntop(30, __b, cStr, 0x40u);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x600u);
}

CFStringRef NECreateIPv6SubnetAddressWithPrefix(const __CFString *a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v3 = NECreateIPv6AddressMaskStringFromPrefix(a2);
  int v4 = NECreateAddressStructFromString(v3, 0LL, 0LL);
  int v5 = NECreateAddressStructFromString(a1, 0LL, 0LL);
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    if (v4[1] == 30 && *((_BYTE *)v5 + 1) == 30)
    {
      uint64_t v7 = 0LL;
      v10[0] = 0LL;
      v10[1] = 0LL;
      do
      {
        *((_BYTE *)v10 + v7) = v4[v7 + 8] & *((_BYTE *)v5 + v7 + 8);
        ++v7;
      }

      while (v7 != 16);
      inet_ntop(30, v10, cStr, 0x40u);
      CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x600u);
    }

    else
    {
      CFStringRef v8 = 0LL;
    }
  }

  else
  {
    CFStringRef v8 = 0LL;
    if (!v4)
    {
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }

  free(v4);
  if (v6) {
LABEL_10:
  }
    free(v6);
LABEL_11:
  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

void NESetValueIfPresent(const __CFDictionary *a1, __CFDictionary *a2, void *key)
{
  if (a1 && a2 && key)
  {
    if (CFDictionaryContainsKey(a1, key))
    {
      Value = CFDictionaryGetValue(a1, key);
      CFDictionarySetValue(a2, key, Value);
    }
  }

void NEAddDateToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    CFDateRef v5 = CFDateCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (double)a3 - *MEMORY[0x189604DA8]);
    if (v5)
    {
      CFDateRef v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }

void NEAddIntToDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  if (a1 && a2)
  {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }

void NEAddInt64ToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (a1 && a2)
  {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }

void NEAddIntToArray(__CFArray *a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFArrayAppendValue(a1, v3);
      CFRelease(v4);
    }
  }

uint64_t NEGetIntFromDictionary(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  if (a1)
  {
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }
    }
  }

  return v3;
}

uint64_t NEGetIntFromArray(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  if (a1)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2);
    if (ValueAtIndex)
    {
      CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
  }

  return v3;
}

void NEAddAddressToDictionary(__CFDictionary *a1, const void *a2, unsigned __int8 *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a1 && a2 && a3)
  {
    int v5 = a3[1];
    if (v5 == 30)
    {
      CFNumberRef v6 = a3 + 8;
      int v7 = 30;
    }

    else
    {
      if (v5 != 2) {
        return;
      }
      CFNumberRef v6 = a3 + 4;
      int v7 = 2;
    }

    inet_ntop(v7, v6, cStr, 0x40u);
    CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], cStr, 0x600u);
    if (v8)
    {
      CFStringRef v9 = v8;
      CFDictionaryAddValue(a1, a2, v8);
      CFRelease(v9);
    }
  }

void NEAddPortToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        int v3 = *(unsigned __int8 *)(a3 + 1);
        if (v3 == 30 || v3 == 2) {
          NEAddIntToDictionary(a1, a2, bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16);
        }
      }
    }
  }

uint64_t NEGetPrefixForAddressRange(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || !a2) {
    return result;
  }
  int v4 = *(unsigned __int8 *)(a1 + 1);
  if (v4 == 30)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = (__int128 *)(a1 + 8);
    __int128 v13 = *(_OWORD *)(a1 + 8);
    __int128 v53 = *(_OWORD *)(a2 + 8);
    __int128 v54 = v13;
    uint64_t result = 32LL;
    while (1)
    {
      unsigned int v14 = *(_DWORD *)((char *)&v54 + v11);
      unsigned int v15 = *(_DWORD *)((char *)&v53 + v11);
      if (v14 != v15) {
        break;
      }
      v11 += 4LL;
      result += 32LL;
      if (v11 == 16)
      {
        uint64_t result = 128LL;
        goto LABEL_20;
      }
    }

    unsigned int v21 = bswap32(v15);
    unsigned int v22 = bswap32(v14);
    do
    {
      v22 >>= 1;
      BOOL v20 = v22 == v21 >> 1;
      v21 >>= 1;
      --result;
    }

    while (!v20);
LABEL_20:
    uint64_t v23 = 0LL;
    __int128 v24 = *v12;
    __int128 v53 = *(_OWORD *)(a2 + 8);
    __int128 v54 = v24;
    unint64_t v25 = 32 - result;
    for (unint64_t i = result; ; i -= 32LL)
    {
      if (!i)
      {
        return result;
      }

      if (i <= 0x1F) {
        break;
      }
      ++v23;
      v25 += 32LL;
      if (v23 == 4) {
        return result;
      }
    }

    if (v25 <= 1) {
      unint64_t v25 = 1LL;
    }
    uint64_t v27 = v25 - 1;
    unint64_t v28 = (v25 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int64x2_t v29 = (int64x2_t)xmmword_1875561E0;
    int64x2_t v30 = (int64x2_t)xmmword_1875561F0;
    int32x4_t v31 = (int32x4_t)xmmword_187556200;
    int32x4_t v32 = 0uLL;
    v33.i64[0] = 0x100000001LL;
    v33.i64[1] = 0x100000001LL;
    int64x2_t v34 = vdupq_n_s64(4uLL);
    v35.i64[0] = 0x400000004LL;
    v35.i64[1] = 0x400000004LL;
    do
    {
      int8x16_t v36 = (int8x16_t)v32;
      uint64x2_t v37 = (uint64x2_t)v29;
      uint64x2_t v38 = (uint64x2_t)v30;
      int32x4_t v32 = vaddq_s32((int32x4_t)vshlq_u32(v33, (uint32x4_t)v31), v32);
      int64x2_t v29 = vaddq_s64(v29, v34);
      int64x2_t v30 = vaddq_s64(v30, v34);
      int32x4_t v31 = vaddq_s32(v31, v35);
      v28 -= 4LL;
    }

    while (v28);
    uint64x2_t v39 = (uint64x2_t)vdupq_lane_s64(v27, 0);
    int v40 = vaddvq_s32((int32x4_t)vbslq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v38, v39), (int32x4_t)vcgtq_u64(v37, v39)),  v36,  (int8x16_t)v32));
    if ((bswap32(*((_DWORD *)&v54 + v23)) & v40) == 0
      && (v40 & ~bswap32(*((_DWORD *)&v53 + v23))) == 0)
    {
      return result;
    }

    return 0xFFFFFFFFLL;
  }

  if (v4 != 2) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 4);
  unsigned int v6 = bswap32(v5);
  unsigned int v7 = *(_DWORD *)(a2 + 4);
  unsigned int v8 = bswap32(v7);
  if (v5 == v7)
  {
    int v9 = 0;
    unsigned int v10 = 32;
  }

  else
  {
    uint64_t v16 = -3LL;
    unsigned int v17 = v8;
    unsigned int v18 = v6;
    do
    {
      uint64_t v19 = v16;
      v18 >>= 1;
      BOOL v20 = v18 == v17 >> 1;
      v17 >>= 1;
      --v16;
    }

    while (!v20);
    unsigned int v10 = v19 + 34;
    if (v19 == -2)
    {
      int v9 = 0;
    }

    else
    {
      int64x2_t v41 = (int64x2_t)xmmword_1875561E0;
      int64x2_t v42 = (int64x2_t)xmmword_1875561F0;
      int32x4_t v43 = (int32x4_t)xmmword_187556200;
      unint64_t v44 = -v16 & 0xFFFFFFFFFFFFFFFCLL;
      int32x4_t v45 = 0uLL;
      v46.i64[0] = 0x100000001LL;
      v46.i64[1] = 0x100000001LL;
      int64x2_t v47 = vdupq_n_s64(4uLL);
      v48.i64[0] = 0x400000004LL;
      v48.i64[1] = 0x400000004LL;
      do
      {
        int8x16_t v49 = (int8x16_t)v45;
        uint64x2_t v50 = (uint64x2_t)v41;
        uint64x2_t v51 = (uint64x2_t)v42;
        int32x4_t v45 = vaddq_s32((int32x4_t)vshlq_u32(v46, (uint32x4_t)v43), v45);
        int64x2_t v41 = vaddq_s64(v41, v47);
        int64x2_t v42 = vaddq_s64(v42, v47);
        int32x4_t v43 = vaddq_s32(v43, v48);
        v44 -= 4LL;
      }

      while (v44);
      uint64x2_t v52 = (uint64x2_t)vdupq_lane_s64(-3 - v19, 0);
      int v9 = vaddvq_s32((int32x4_t)vbslq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v51, v52), (int32x4_t)vcgtq_u64(v50, v52)),  v49,  (int8x16_t)v45));
    }
  }

  if (((v6 | ~v8) & v9) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v10;
  }
}

uint64_t NEGetPrefixForAddressRangeStrings(const __CFString *a1, const __CFString *a2)
{
  int v3 = NECreateAddressStructFromString(a1, 0LL, 0LL);
  int v4 = NECreateAddressStructFromString(a2, 0LL, 0LL);
  uint64_t v5 = NEGetPrefixForAddressRange((uint64_t)v3, (uint64_t)v4);
  if (v3) {
    free(v3);
  }
  if (v4) {
    free(v4);
  }
  return v5;
}

uint64_t NEGetPrefixForIPv4NetmaskString(const __CFString *a1)
{
  int v1 = NECreateAddressStructFromString(a1, 0LL, 0LL);
  size_t v2 = NECreateAddressStructFromString(@"255.255.255.255", 0LL, 0LL);
  uint64_t v3 = NEGetPrefixForAddressRange((uint64_t)v1, (uint64_t)v2);
  if (v1) {
    free(v1);
  }
  if (v2) {
    free(v2);
  }
  return v3;
}

uint64_t NEGetPrefixForIPv6NetmaskString(const __CFString *a1)
{
  int v1 = NECreateAddressStructFromString(a1, 0LL, 0LL);
  size_t v2 = NECreateAddressStructFromString(@"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 0LL, 0LL);
  uint64_t v3 = NEGetPrefixForAddressRange((uint64_t)v1, (uint64_t)v2);
  if (v1) {
    free(v1);
  }
  if (v2) {
    free(v2);
  }
  return v3;
}

uint64_t NECompareAddresses(const __CFString *a1, const __CFString *a2)
{
  uint64_t v2 = 4294967294LL;
  if (a1 && a2)
  {
    uint64_t v13 = 0LL;
    CFDataRef v4 = NECreateAddressDataFromString(a1, 0LL, (int *)&v13 + 1);
    uint64_t v5 = v4;
    if (v4 && HIDWORD(v13))
    {
      CFDataRef v6 = NECreateAddressDataFromString(a2, 0LL, (int *)&v13);
      if (v6)
      {
        unsigned int v7 = v6;
        if ((_DWORD)v13 == HIDWORD(v13))
        {
          BytePtr = CFDataGetBytePtr(v5);
          int v9 = CFDataGetBytePtr(v7);
          size_t Length = CFDataGetLength(v5);
          int v11 = memcmp(BytePtr, v9, Length);
          if (v11 >= 0) {
            uint64_t v2 = v11 != 0;
          }
          else {
            uint64_t v2 = 0xFFFFFFFFLL;
          }
        }

        CFRelease(v5);
        uint64_t v5 = v7;
      }

      goto LABEL_12;
    }

    if (v4) {
LABEL_12:
    }
      CFRelease(v5);
  }

  return v2;
}

BOOL NEAddressRangeIsContainedInAddressRange( const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  int v6 = NECompareAddresses(a1, a3);
  unsigned int v7 = NECompareAddresses(a2, a4);
  return (v6 + 1) < 2 && v7 < 2;
}

void NEAddDataToDictionary(__CFDictionary *a1, const void *a2, UInt8 *bytes, int a4)
{
  if (a1 && a2 && bytes)
  {
    CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, a4);
    if (v6)
    {
      CFDataRef v7 = v6;
      CFDictionaryAddValue(a1, a2, v6);
      CFRelease(v7);
    }
  }

void NEAppendIntToArray(__CFArray *a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFArrayAppendValue(a1, v3);
      CFRelease(v4);
    }
  }

CFNumberRef NEGetValueFromIntArray(const __CFNumber *result, CFIndex a2)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberRef v3 = result;
    if (CFArrayGetCount(result) <= a2)
    {
      return 0LL;
    }

    else
    {
      uint64_t result = (const __CFNumber *)CFArrayGetValueAtIndex(v3, a2);
      if (result)
      {
        CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
        return (const __CFNumber *)valuePtr;
      }
    }
  }

  return result;
}

CFDataRef NECreateDataFromString(const __CFString *a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0LL;
  }
  CFIndex v5 = Length;
  CFIndex v6 = Length + 1;
  CFDataRef v7 = (char *)malloc(Length + 1);
  if (!v7) {
    return 0LL;
  }
  unsigned int v8 = (UInt8 *)v7;
  if (CFStringGetCString(a1, v7, v6, 0x600u))
  {
    if (a2) {
      CFIndex v9 = v5 + 1;
    }
    else {
      CFIndex v9 = v5;
    }
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v8, v9);
  }

  else
  {
    CFDataRef v10 = 0LL;
  }

  free(v8);
  return v10;
}

CFStringRef NECreateStringFromData(CFStringRef result)
{
  if (result)
  {
    int v1 = (const __CFData *)result;
    CFIndex Length = CFDataGetLength((CFDataRef)result);
    BytePtr = CFDataGetBytePtr(v1);
    UInt8 bytes = 0;
    CFNumberRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFIndex v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], &bytes, 1LL);
    if (!v5
      || (CFIndex v6 = v5,
          v10.CFIndex location = 0LL,
          v10.size_t length = Length,
          CFIndex location = CFDataFind(v1, v5, v10, 0LL).location,
          CFRelease(v6),
          location == -1))
    {
      CFIndex v8 = CFDataGetLength(v1);
      return CFStringCreateWithBytes(v4, BytePtr, v8, 0x600u, 0);
    }

    else
    {
      return CFStringCreateWithCString(v4, (const char *)BytePtr, 0x600u);
    }
  }

  return result;
}

void *NECreateCStringFromCFString(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0LL;
  }
  CFIndex v3 = Length + 1;
  CFNumberRef v4 = calloc(1uLL, Length + 1);
  if (v4 && !CFStringGetCString(a1, (char *)v4, v3, 0x600u))
  {
    free(v4);
    return 0LL;
  }

  return v4;
}

void NEAddValueToIntKeyedDictionary(__CFDictionary *a1, int a2, const void *a3)
{
  int valuePtr = a2;
  if (a1 && a3)
  {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionaryAddValue(a1, v5, a3);
      CFRelease(v6);
    }
  }

CFDictionaryRef NEGetValueFromIntKeyedDictionary(const __CFDictionary *a1, int a2)
{
  Value = a1;
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v3);
      CFRelease(v4);
    }

    else
    {
      return 0LL;
    }
  }

  return Value;
}

void NERemoveValueFromIntKeyedDictionary(__CFDictionary *a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFDictionaryRemoveValue(a1, v3);
      CFRelease(v4);
    }
  }

dispatch_source_s *NERepeatingEventCreate( dispatch_queue_s *a1, dispatch_time_t a2, unint64_t a3, uint64_t a4, uint64_t a5, int a6, const void *a7, const void *a8)
{
  uint64_t v16 = calloc(1uLL, 0x20uLL);
  *(void *)uint64_t v16 = a4;
  void v16[2] = a6;
  if (a7) {
    *((void *)v16 + 2) = _Block_copy(a7);
  }
  if (a8) {
    *((void *)v16 + 3) = _Block_copy(a8);
  }
  v16[3] = 0;
  dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, a3, a1);
  unsigned int v18 = v17;
  if (v17)
  {
    dispatch_set_context(v17, v16);
    dispatch_set_finalizer_f(v18, (dispatch_function_t)repeatingEventFinalizer);
    dispatch_source_set_timer(v18, a2, 1000000 * a4, 1000000 * a5);
    uint64_t v19 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __NERepeatingEventCreate_block_invoke;
    handler[3] = &__block_descriptor_tmp_12_339;
    handler[4] = v18;
    dispatch_source_set_event_handler(v18, handler);
    v21[0] = v19;
    v21[1] = 0x40000000LL;
    v21[2] = __NERepeatingEventCreate_block_invoke_2;
    v21[3] = &__block_descriptor_tmp_13_340;
    v21[4] = v18;
    dispatch_source_set_cancel_handler(v18, v21);
    dispatch_resume(v18);
  }

  else
  {
    free(v16);
  }

  return v18;
}

void repeatingEventFinalizer(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (const void *)a1[2];
    if (v2) {
      _Block_release(v2);
    }
    CFNumberRef v3 = (const void *)a1[3];
    if (v3) {
      _Block_release(v3);
    }
    free(a1);
  }

uint64_t __NERepeatingEventCreate_block_invoke(uint64_t a1)
{
  int v1 = *(dispatch_source_s **)(a1 + 32);
  context = (uint64_t *)dispatch_get_context(v1);
  CFNumberRef v3 = context;
  int v5 = *((_DWORD *)context + 2);
  int v4 = *((_DWORD *)context + 3);
  *((_DWORD *)context + 3) = v4 + 1;
  if (v5) {
    BOOL v6 = v4 < v5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t result = context[2];
    if (!result) {
      return result;
    }
    return (*(uint64_t (**)(void))(result + 16))();
  }

  dispatch_source_cancel(v1);
  uint64_t result = v3[3];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __NERepeatingEventCreate_block_invoke_2(uint64_t a1)
{
  int v1 = *(dispatch_object_s **)(a1 + 32);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t NERepeatingEventGetTimesFired(dispatch_object_s *a1)
{
  if (a1) {
    return *((unsigned int *)dispatch_get_context(a1) + 3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

dispatch_object_s *NERepeatingEventGetIntervalInMilliseconds(dispatch_object_s *result)
{
  if (result) {
    return *(dispatch_object_s **)dispatch_get_context(result);
  }
  return result;
}

void NERepeatingEventRelease(dispatch_source_s *a1)
{
  if (a1)
  {
    if (!dispatch_source_testcancel(a1)) {
      dispatch_source_cancel(a1);
    }
  }

dispatch_source_s *NECreateTimerSource(dispatch_queue_t queue, uint64_t a2, void *a3)
{
  int v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, queue);
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0LL, 1000000000 * a2);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_source_set_event_handler(v5, a3);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = __NECreateTimerSource_block_invoke;
    handler[3] = &__block_descriptor_tmp_14;
    handler[4] = v5;
    dispatch_source_set_cancel_handler(v5, handler);
    dispatch_resume(v5);
  }

  return v5;
}

void __NECreateTimerSource_block_invoke(uint64_t a1)
{
  int v1 = *(dispatch_object_s **)(a1 + 32);
  if (v1) {
    dispatch_release(v1);
  }
}

CFDataRef NECreateDataWithEncodedCString(_BYTE *a1, int a2)
{
  LOBYTE(v2) = *a1;
  if (!*a1) {
    return 0LL;
  }
  unint64_t v5 = 0LL;
  uint64_t v6 = 1LL;
  uint64_t v7 = MEMORY[0x1895F8770];
  do
  {
    if ((v2 & 0x80) != 0)
    {
    }

    else
    {
      int v8 = *(_DWORD *)(v7 + 4LL * (char)v2 + 60);
      if ((v8 & 0x10000) != 0)
      {
        ++v5;
      }

      else if ((v8 & 0x4000) == 0)
      {
        return 0LL;
      }
    }

    int v2 = a1[v6++];
  }

  while (v2);
  if (!v5) {
    return 0LL;
  }
  if ((v5 & 1) != 0) {
    return 0LL;
  }
  CFIndex v9 = (UInt8 *)malloc(v5 >> 1);
  if (!v9) {
    return 0LL;
  }
  CFRange v10 = v9;
  unsigned int v11 = *a1;
  if (*a1)
  {
    int v12 = 0;
    CFIndex v13 = 0LL;
    unsigned int v14 = a1 + 1;
    unsigned int v15 = v9;
    do
    {
      if ((v11 & 0x80) == 0 && (*(_DWORD *)(v7 + 4LL * v11 + 60) & 0x10000) != 0)
      {
        if (v12)
        {
          __str[1] = v11;
          __str[2] = 0;
          UInt8 v16 = strtol(__str, 0LL, a2);
          int v12 = 0;
          *v15++ = v16;
          ++v13;
        }

        else
        {
          __str[0] = v11;
          int v12 = 1;
        }
      }

      unsigned int v17 = *v14++;
      unsigned int v11 = v17;
    }

    while (v17);
  }

  else
  {
    CFIndex v13 = 0LL;
  }

  CFDataRef v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v10, v13);
  free(v10);
  return v19;
}

const char *NECertificateStatusToString(int a1)
{
  else {
    return off_18A06E8C0[a1 - 1];
  }
}

uint64_t NECertificateDateIsValid(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 4LL;
  }
  SecCertificateNotValidBefore();
  CFAbsoluteTime v2 = v1;
  if (v1 == 0.0) {
    CFNumberRef v3 = 0LL;
  }
  else {
    CFNumberRef v3 = CFDateCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v1);
  }
  SecCertificateNotValidAfter();
  CFAbsoluteTime v6 = v5;
  if (v5 == 0.0) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = CFDateCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v5);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current == 0.0)
  {
    CFRange v10 = 0LL;
    goto LABEL_19;
  }

  CFIndex v9 = CFDateCreate(0LL, Current);
  CFRange v10 = v9;
  if (!v3 || !v9)
  {
LABEL_19:
    uint64_t v4 = 1LL;
    if (!v3)
    {
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }

    goto LABEL_35;
  }

  if (CFDateCompare(v9, v3, 0LL) == kCFCompareLessThan)
  {
    CFIndex v13 = (os_log_s *)ne_log_obj();
    uint64_t v4 = 2LL;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl(&dword_187528000, v13, OS_LOG_TYPE_DEBUG, "Current time before valid time", buf, 2u);
    }
  }

  else
  {
    if (!v7 || CFDateCompare(v10, v7, 0LL) != kCFCompareGreaterThan)
    {
      uint64_t v4 = 1LL;
      goto LABEL_35;
    }

    unsigned int v11 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl(&dword_187528000, v11, OS_LOG_TYPE_DEBUG, "Current time after valid time", buf, 2u);
    }

    uint64_t v4 = 3LL;
  }

  if (nelog_is_info_logging_enabled())
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    int v18 = 0;
    unsigned int v14 = CFCalendarCreateWithIdentifier( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFCalendarIdentifier)*MEMORY[0x189604F90]);
    if (v14)
    {
      unsigned int v15 = v14;
      CFCalendarDecomposeAbsoluteTime(v14, v2, "yMdHm", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, &v18);
      UInt8 v16 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 67110144;
        int v22 = HIDWORD(v20);
        __int16 v23 = 1024;
        int v24 = v20;
        __int16 v25 = 1024;
        int v26 = HIDWORD(v19);
        __int16 v27 = 1024;
        int v28 = v19;
        __int16 v29 = 1024;
        int v30 = v18;
        _os_log_impl( &dword_187528000,  v16,  OS_LOG_TYPE_INFO,  "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n",  buf,  0x20u);
      }

      CFCalendarDecomposeAbsoluteTime(v15, v6, "yMdHm", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, &v18);
      unsigned int v17 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 67110144;
        int v22 = HIDWORD(v20);
        __int16 v23 = 1024;
        int v24 = v20;
        __int16 v25 = 1024;
        int v26 = HIDWORD(v19);
        __int16 v27 = 1024;
        int v28 = v19;
        __int16 v29 = 1024;
        int v30 = v18;
        _os_log_impl( &dword_187528000,  v17,  OS_LOG_TYPE_INFO,  "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n",  buf,  0x20u);
      }

      CFRelease(v15);
    }
  }

BOOL NEIsInterfaceWIFI()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v0 = socket(2, 2, 0);
  if (v0 < 0)
  {
    CFAbsoluteTime v2 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    LODWORD(v7[0]) = 136315138;
    *(void *)((char *)v7 + 4) = "NEIsInterfaceWIFI";
    CFNumberRef v3 = "%s: Failed to open socket";
    uint64_t v4 = (uint8_t *)v7;
LABEL_10:
    _os_log_error_impl(&dword_187528000, v2, OS_LOG_TYPE_ERROR, v3, v4, 0xCu);
    goto LABEL_7;
  }

  memset(v7, 0, 44);
  __strlcpy_chk();
  if (ioctl(v0, 0xC02C6938uLL, v7) != -1)
  {
    close(v0);
    return (v7[1] & 0xE0) == 128;
  }

  CFAbsoluteTime v2 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    CFAbsoluteTime v6 = "NEIsInterfaceWIFI";
    CFNumberRef v3 = "%s: Failed to get media";
    uint64_t v4 = buf;
    goto LABEL_10;
  }

ifaddrs *NEGetInterfaceType(const char *a1, _BYTE *a2, BOOL *a3)
{
  CFRange v10 = 0LL;
  *a2 = 0;
  *a3 = 0;
  CFAbsoluteTime v6 = 0LL;
  if (!getifaddrs(&v10))
  {
    uint64_t v7 = v10;
    if (v10)
    {
      CFAbsoluteTime v6 = v10;
      while (1)
      {
        ifa_name = v6->ifa_name;
        if (ifa_name)
        {
          if (!strcmp(ifa_name, a1)) {
            break;
          }
        }

        CFAbsoluteTime v6 = v6->ifa_next;
        if (!v6) {
          goto LABEL_13;
        }
      }

      CFAbsoluteTime v6 = (ifaddrs *)v6->ifa_addr->sa_data[2];
      if ((_DWORD)v6 == 255)
      {
        *a2 = 0;
      }

      else if ((_DWORD)v6 == 6)
      {
        *a2 = 1;
        *a3 = NEIsInterfaceWIFI();
        uint64_t v7 = v10;
      }
    }

    else
    {
      CFAbsoluteTime v6 = 0LL;
    }

LABEL_13:
    MEMORY[0x1895A7EC8](v7);
  }

  return v6;
}

BOOL NEIsInterfaceCellular(const char *a1)
{
  return NEGetInterfaceType(a1, &v3, &v2) == 255;
}

void *NECopyInterfaceAddress(const char *a1, int a2)
{
  CFIndex v13 = 0LL;
  p_ifa_next = 0LL;
  if (!getifaddrs(&v13))
  {
    p_ifa_next = &v13->ifa_next;
    if (v13)
    {
      while (1)
      {
        CFAbsoluteTime v5 = (const char *)p_ifa_next[1];
        if (v5)
        {
          if (!strcmp(v5, a1))
          {
            CFAbsoluteTime v6 = (unsigned __int8 *)p_ifa_next[3];
            if (v6[1] == a2)
            {
              if (a2 == 30)
              {
                unsigned int v10 = *v6;
                uint64_t v8 = (const __CFString *)(v6 + 8);
                unint64_t v9 = v10;
                int v11 = 30;
                goto LABEL_13;
              }

              if (a2 == 2) {
                break;
              }
            }
          }
        }

        p_ifa_next = (void *)*p_ifa_next;
        if (!p_ifa_next) {
          goto LABEL_9;
        }
      }

      unsigned int v12 = *v6;
      uint64_t v8 = (const __CFString *)(v6 + 4);
      unint64_t v9 = v12;
      int v11 = 2;
LABEL_13:
      p_ifa_next = NECreateAddressStringFromBuffer(v8, v9, v11);
    }

uint64_t NEGetInterfaceForAddress(unsigned __int8 *a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  int v2 = a1[1];
  if (v2 == 30)
  {
    if (*a1 > 0x1Bu) {
      goto LABEL_4;
    }
LABEL_21:
    unsigned int v10 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_187528000,  v10,  OS_LOG_TYPE_ERROR,  "Address passed to NEGetInterfaceForAddress is too short",  buf,  2u);
    }

    return 0LL;
  }

  if (v2 == 2 && *a1 < 0x10u) {
    goto LABEL_21;
  }
LABEL_4:
  unsigned int v17 = 0LL;
  if (getifaddrs(&v17) < 0)
  {
    int v11 = *__error();
    unsigned int v12 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int v18 = 67109378;
      *(_DWORD *)uint64_t v19 = v11;
      *(_WORD *)&v19[4] = 2080;
      *(void *)&void v19[6] = buf;
      _os_log_fault_impl(&dword_187528000, v12, OS_LOG_TYPE_FAULT, "getifaddrs failed: [%d] %s", v18, 0x12u);
    }

    return 0LL;
  }

  char v3 = v17;
  if (!v17) {
    return 0LL;
  }
  int v4 = a1[1];
  while (1)
  {
    ifa_addr = v3->ifa_addr;
    if (v4 != ifa_addr->sa_family) {
      goto LABEL_16;
    }
    if (v4 == 30) {
      break;
    }
    if (v4 == 2 && *((_DWORD *)a1 + 1) == *(_DWORD *)&ifa_addr->sa_data[2]) {
      goto LABEL_29;
    }
LABEL_16:
    char v3 = v3->ifa_next;
    if (!v3) {
      goto LABEL_17;
    }
  }

  uint64_t v7 = *(void *)&ifa_addr->sa_data[6];
  uint64_t v6 = *(void *)&ifa_addr[1].sa_len;
  if (*((void *)a1 + 1) != v7 || *((void *)a1 + 2) != v6) {
    goto LABEL_16;
  }
LABEL_29:
  uint64_t v9 = if_nametoindex(v3->ifa_name);
  if (!(_DWORD)v9)
  {
    int v14 = *__error();
    unsigned int v15 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      ifa_name = v3->ifa_name;
      *(_DWORD *)int v18 = 136315650;
      *(void *)uint64_t v19 = ifa_name;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v14;
      __int16 v20 = 2080;
      unsigned int v21 = buf;
      _os_log_fault_impl( &dword_187528000,  v15,  OS_LOG_TYPE_FAULT,  "Failed to get an interface index for interface %s: [%d] %s",  v18,  0x1Cu);
    }

uint64_t NEIsValidInterface(const char *a1)
{
  uint64_t v7 = 0LL;
  if (getifaddrs(&v7)) {
    return 0LL;
  }
  char v3 = v7;
  if (v7)
  {
    int v4 = v7;
    while (1)
    {
      ifa_name = v4->ifa_name;
      if (ifa_name)
      {
        if (!strcmp(ifa_name, a1)) {
          break;
        }
      }

      int v4 = v4->ifa_next;
      if (!v4) {
        goto LABEL_8;
      }
    }

    uint64_t v2 = 1LL;
  }

  else
  {
LABEL_8:
    uint64_t v2 = 0LL;
  }

  MEMORY[0x1895A7EC8](v3);
  return v2;
}

BOOL NEIsWildcardAddress(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (v1 == 30)
  {
    if (*a1 >= 0x1Cu && !*((_DWORD *)a1 + 2) && !*((_DWORD *)a1 + 3) && !*((_DWORD *)a1 + 4))
    {
      uint64_t v2 = a1 + 20;
      return *v2 == 0;
    }
  }

  else if (v1 == 2 && *a1 >= 0x10u)
  {
    uint64_t v2 = a1 + 4;
    return *v2 == 0;
  }

  return 0LL;
}

BOOL NEIsLoopbackAddress(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (v1 == 30)
  {
    if (*a1 >= 0x1Cu && !*((_DWORD *)a1 + 2) && !*((_DWORD *)a1 + 3) && !*((_DWORD *)a1 + 4))
    {
      uint64_t v2 = a1 + 20;
      int v3 = 0x1000000;
      return *v2 == v3;
    }
  }

  else if (v1 == 2 && *a1 >= 0x10u)
  {
    uint64_t v2 = a1 + 4;
    int v3 = 16777343;
    return *v2 == v3;
  }

  return 0LL;
}

uint64_t NEGetEntitlement(void *a1)
{
  if (a1)
  {
    if (MEMORY[0x1895A89D8]() == MEMORY[0x1895F9220])
    {
      size_t count = xpc_array_get_count(a1);
      if (count)
      {
        size_t v5 = count;
        uint64_t v2 = 0LL;
        size_t v6 = 0LL;
        while (1)
        {
          string = xpc_array_get_string(a1, v6);
          if (string)
          {
            uint64_t v8 = string;
            size_t v9 = strlen(string);
            if (strncmp(v8, "packet-tunnel-provider", v9))
            {
              if (!strncmp(v8, "app-proxy-provider", v9)) {
                goto LABEL_22;
              }
              if (!strncmp(v8, "content-filter-provider", v9)) {
                goto LABEL_23;
              }
              if (!strncmp(v8, "dns-proxy", v9)) {
                goto LABEL_24;
              }
              if (!strncmp(v8, "dns-settings", v9))
              {
                uint64_t v2 = v2 | 0x40;
                goto LABEL_27;
              }

              if (!strncmp(v8, "relay", v9))
              {
                uint64_t v2 = v2 | 0x80;
                goto LABEL_27;
              }

              if (strncmp(v8, "packet-tunnel-provider-systemextension", v9))
              {
                if (strncmp(v8, "app-proxy-provider-systemextension", v9))
                {
                  if (strncmp(v8, "content-filter-provider-systemextension", v9))
                  {
                    if (strncmp(v8, "dns-proxy-systemextension", v9))
                    {
                      if (!strncmp(v8, "app-push-provider", v9)) {
                        uint64_t v2 = v2 | 0x20;
                      }
                      else {
                        uint64_t v2 = v2;
                      }
                      goto LABEL_27;
                    }

LABEL_24:
                    uint64_t v2 = v2 | 0x10;
                    goto LABEL_27;
                  }

LABEL_22:
                uint64_t v2 = v2 | 2;
                goto LABEL_27;
              }
            }

            uint64_t v2 = v2 | 1;
          }

CFStringRef NECopySynthesizedIPv6Address(const __CFString *a1, int a2)
{
  CFIndex v13 = 0LL;
  CFStringRef v4 = 0LL;
  if (NEGetAddressFamilyFromString(a1) != 30)
  {
    int v12 = a2;
    int v5 = nw_nat64_copy_prefixes();
    if (v5 < 1)
    {
      CFStringRef v4 = 0LL;
      uint64_t v7 = 0LL;
    }

    else
    {
      unsigned int v6 = v5;
      uint64_t v7 = NECreateAddressStructFromString(a1, 0LL, 0LL);
      if (v7)
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = 16LL * v6;
        while (1)
        {
          *(_OWORD *)&v11.isa = xmmword_1875561C0;
          *(_OWORD *)((char *)&v11.info + 4) = *(__int128 *)((char *)&xmmword_1875561C0 + 12);
          v8 += 16LL;
          if (v9 == v8) {
            goto LABEL_7;
          }
        }

        CFStringRef v4 = NECreateAddressString(&v11);
      }

      else
      {
LABEL_7:
        CFStringRef v4 = 0LL;
      }
    }

    if (v13)
    {
      free(v13);
      CFIndex v13 = 0LL;
    }

    if (v7) {
      free(v7);
    }
  }

  return v4;
}

const char *inputNotification2String(int a1)
{
  else {
    return off_18A06E8E8[a1 - 1];
  }
}

void ne_filter_request_connection( os_unfair_lock_s *a1, unsigned int a2, int a3, void (**a4)(void, void))
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    if (a2 < 8)
    {
      uint64_t v8 = a1 + 1;
      os_unfair_lock_lock(a1 + 1);
      uint64_t v9 = _Block_copy(a4);
      unsigned int v10 = &a1[8 * a2];
      CFIndex v13 = *(dispatch_object_s **)&v10[6]._os_unfair_lock_opaque;
      int v12 = (dispatch_queue_t *)&v10[6];
      __CFString v11 = v13;
      if (v13)
      {
        do
          unsigned int v14 = __ldaxr(&a1->_os_unfair_lock_opaque);
        while (__stlxr(v14 + 1, &a1->_os_unfair_lock_opaque));
        dispatch_retain(v11);
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 0x40000000LL;
        v26[2] = __ne_filter_request_connection_block_invoke;
        v26[3] = &unk_18A06E920;
        v26[4] = v9;
        v26[5] = a1;
        v26[6] = v12 - 2;
        _DWORD v26[7] = v11;
        unsigned int v15 = v26;
        UInt8 v16 = (dispatch_queue_s *)v11;
      }

      else
      {
        unsigned int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v18 = dispatch_queue_create("Filter provider connection waiter queue", v17);
        dispatch_queue_t *v12 = v18;
        dispatch_suspend(v18);
        do
          unsigned int v19 = __ldaxr(&a1->_os_unfair_lock_opaque);
        while (__stlxr(v19 + 1, &a1->_os_unfair_lock_opaque));
        uint64_t v20 = MEMORY[0x1895F87A8];
        v25[0] = MEMORY[0x1895F87A8];
        v25[1] = 0x40000000LL;
        v25[2] = __ne_filter_request_connection_block_invoke_2;
        v25[3] = &unk_18A06E948;
        v25[5] = a1;
        v25[6] = v12 - 2;
        v25[4] = v9;
        if (ne_filter_connection_queue_onceToken != -1) {
          dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
        }
        UInt8 v16 = (dispatch_queue_s *)ne_filter_connection_queue_filter_queue;
        block[0] = v20;
        block[1] = 0x40000000LL;
        block[2] = __ne_filter_request_connection_block_invoke_3;
        block[3] = &unk_18A06E970;
        unsigned int v23 = a2;
        int v24 = a3;
        void block[4] = v25;
        void block[5] = a1;
        unsigned int v15 = block;
      }

      dispatch_async(v16, v15);
      os_unfair_lock_unlock(v8);
    }

    else
    {
      a4[2](a4, 0LL);
    }
  }

  else
  {
    unsigned int v21 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      int v28 = "ne_filter_request_connection";
      _os_log_fault_impl(&dword_187528000, v21, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", buf, 0xCu);
    }
  }

void __ne_filter_request_connection_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int **)(a1 + 40);
  do
  {
    unsigned int v3 = __ldaxr(v2);
    unsigned int v4 = v3 - 1;
  }

  while (__stlxr(v4, v2));
  if (!v4) {
    free(*(void **)(a1 + 40));
  }
}

void __ne_filter_request_connection_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 48) + 16LL) = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4LL));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(unsigned int **)(a1 + 40);
  do
  {
    unsigned int v3 = __ldaxr(v2);
    unsigned int v4 = v3 - 1;
  }

  while (__stlxr(v4, v2));
  if (!v4) {
    free(*(void **)(a1 + 40));
  }
}

void __ne_filter_request_connection_block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  unsigned int v1 = *(_DWORD *)(a1 + 48);
  uint64_t v2 = *(void (***)(void, void))(a1 + 32);
  if (v1 >= 8)
  {
    v2[2](*(void *)(a1 + 32), 0LL);
    return;
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned int *)(a1 + 52);
  int v5 = (os_unfair_lock_s *)(v3 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 4));
  uint64_t v6 = MEMORY[0x1895F87A8];
  if (*(void *)(v3 + 264)) {
    goto LABEL_12;
  }
  if (get_current_notify_pid())
  {
    getpid();
    uint64_t v7 = "com.apple.nesessionmanager.content-filter";
    if (sandbox_check())
    {
      uint64_t v8 = (os_log_s *)ne_log_obj();
      uint64_t v7 = "com.apple.nesessionmanager";
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "com.apple.nesessionmanager";
        _os_log_impl( &dword_187528000,  v8,  OS_LOG_TYPE_INFO,  "Filter falling back to Mach service %s",  (uint8_t *)&buf,  0xCu);
      }
    }

    do
      unsigned int v9 = __ldaxr((unsigned int *)v3);
    while (__stlxr(v9 + 1, (unsigned int *)v3));
    if (ne_filter_connection_queue_onceToken != -1) {
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
    }
    mach_service = xpc_connection_create_mach_service( v7,  (dispatch_queue_t)ne_filter_connection_queue_filter_queue,  2uLL);
    xpc_connection_set_context(mach_service, (void *)v3);
    handler[0] = v6;
    handler[1] = 0x40000000LL;
    handler[2] = __ne_filter_request_xpc_connection_block_invoke;
    handler[3] = &__block_descriptor_tmp_20_391;
    handler[4] = mach_service;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    *(void *)(v3 + 264) = mach_service;
LABEL_12:
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v11, "SessionClientType", 2LL);
    xpc_dictionary_set_int64(v11, "SessionConfigType", 4LL);
    xpc_dictionary_set_int64(v11, "command", 1LL);
    xpc_dictionary_set_uint64(v11, "control-unit", v4);
    int v12 = _Block_copy(v2);
    CFIndex v13 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v4;
      _os_log_debug_impl( &dword_187528000,  v13,  OS_LOG_TYPE_DEBUG,  "Filter requesting xpc connection to control unit %u",  (uint8_t *)&buf,  8u);
    }

    unsigned int v14 = *(_xpc_connection_s **)(v3 + 264);
    if (ne_filter_connection_queue_onceToken != -1) {
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
    }
    *(void *)&__int128 buf = v6;
    *((void *)&buf + 1) = 0x40000000LL;
    dispatch_queue_t v18 = __ne_filter_request_xpc_connection_block_invoke_24;
    unsigned int v19 = &unk_18A06EA58;
    int v22 = v4;
    unsigned int v23 = v1;
    uint64_t v20 = v12;
    uint64_t v21 = v3;
    xpc_connection_send_message_with_reply(v14, v11, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, &buf);
    xpc_release(v11);
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 4));
    return;
  }

  unsigned int v15 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl( &dword_187528000,  v15,  OS_LOG_TYPE_ERROR,  "Session manager not running, cannot filter",  (uint8_t *)&buf,  2u);
  }

  os_unfair_lock_unlock(v5);
  v2[2](v2, 0LL);
}

void __ne_filter_request_xpc_connection_block_invoke(uint64_t a1, uint64_t a2)
{
  context = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
  if (a2)
  {
    int v5 = context;
    if (context)
    {
      if (MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9268])
      {
        xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0LL);
        os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
        uint64_t v6 = (_xpc_connection_s *)*((void *)v5 + 33);
        if (v6)
        {
          xpc_connection_cancel(v6);
          xpc_release(*((xpc_object_t *)v5 + 33));
          *((void *)v5 + 33) = 0LL;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)v5 + 1);
        do
        {
          unsigned int v7 = __ldaxr((unsigned int *)v5);
          unsigned int v8 = v7 - 1;
        }

        while (__stlxr(v8, (unsigned int *)v5));
        if (!v8) {
          free(v5);
        }
      }
    }
  }

void __ne_filter_request_xpc_connection_block_invoke_24(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  size_t length = 0LL;
  if (xdict && MEMORY[0x1895A89D8](xdict) == MEMORY[0x1895F9268])
  {
    unsigned int v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(a1 + 48);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1895F91B0]);
    *(_DWORD *)__int128 buf = 67109378;
    int v28 = v12;
    __int16 v29 = 2080;
    int v30 = string;
    unsigned int v14 = "Filter got an error on the XPC connection when requesting endpoint to control unit %u: %s";
    goto LABEL_34;
  }

  xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "new-connection");
  if (!value)
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "error");
    unsigned int v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(a1 + 48);
    else {
      xpc_object_t v11 = off_18A06EA78[int64 - 1];
    }
    *(_DWORD *)__int128 buf = 67109378;
    int v28 = v10;
    __int16 v29 = 2080;
    int v30 = v11;
    unsigned int v14 = "Filter failed to get endpoint to control unit %u: %s";
LABEL_34:
    _os_log_error_impl(&dword_187528000, v9, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    goto LABEL_12;
  }

  xpc_connection_t v5 = xpc_connection_create_from_endpoint(value);
  if (v5)
  {
    uint64_t v6 = v5;
    data = xpc_dictionary_get_data(xdict, "crypto-key", &length);
    goto LABEL_13;
  }

  int64_t v15 = xpc_dictionary_get_int64(xdict, "error");
  unsigned int v9 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v23 = *(_DWORD *)(a1 + 48);
    else {
      uint64_t v24 = off_18A06EA78[v15 - 1];
    }
    *(_DWORD *)__int128 buf = 67109378;
    int v28 = v23;
    __int16 v29 = 2080;
    int v30 = v24;
    unsigned int v14 = "Filter failed to create connection to unit %u: %s";
    goto LABEL_34;
  }

void __ne_filter_request_xpc_connection_block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  context = (char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
  if (context)
  {
    xpc_connection_t v5 = context;
    if (a2 && MEMORY[0x1895A89D8](a2) == MEMORY[0x1895F9268])
    {
      int v10 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v19 = *(_DWORD *)(a1 + 40);
        v20[0] = 67109120;
        v20[1] = v19;
        _os_log_error_impl( &dword_187528000,  v10,  OS_LOG_TYPE_ERROR,  "Got an error on the Filter XPC connection to unit %u",  (uint8_t *)v20,  8u);
      }

      xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0LL);
      os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
      xpc_object_t v11 = &v5[32 * *(unsigned int *)(a1 + 44)];
      CFIndex v13 = (xpc_object_t *)(v11 + 8);
      int v12 = (_xpc_connection_s *)*((void *)v11 + 1);
      if (v12)
      {
        xpc_connection_cancel(v12);
        xpc_release(*v13);
        xpc_object_t *v13 = 0LL;
      }

      uint64_t v16 = (void *)*((void *)v11 + 4);
      int64_t v15 = v11 + 32;
      unsigned int v14 = v16;
      if (v16)
      {
        free(v14);
        void *v15 = 0LL;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)v5 + 1);
      do
      {
        unsigned int v17 = __ldaxr((unsigned int *)v5);
        unsigned int v18 = v17 - 1;
      }

      while (__stlxr(v18, (unsigned int *)v5));
      if (!v18) {
        free(v5);
      }
    }

    else
    {
      uuid = xpc_dictionary_get_uuid(a2, "flow-uuid");
      if (uuid)
      {
        unsigned int v7 = uuid;
        unsigned int v8 = (os_unfair_lock_s *)(v5 + 4);
        os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
        uint64_t v9 = *((void *)v5 + 34);
        if (v9)
        {
          while (uuid_compare(v7, (const unsigned __int8 *)v9))
          {
            uint64_t v9 = *(void *)(v9 + 184);
            if (!v9) {
              goto LABEL_8;
            }
          }

          ne_filter_protocol_retain(v9);
          os_unfair_lock_unlock(v8);
          ne_filter_protocol_handle_message(v9, a2);
          ne_filter_protocol_release(v9);
        }

        else
        {
LABEL_8:
          os_unfair_lock_unlock(v8);
        }
      }
    }
  }

dispatch_queue_t __ne_filter_connection_queue_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("ne.filter", v0);
  ne_filter_connection_queue_filter_queue = (uint64_t)result;
  return result;
}

uint64_t ne_filter_copy_connection(os_unfair_lock_s *a1, unsigned int a2)
{
  if (a2 > 7) {
    return 0LL;
  }
  xpc_connection_t v5 = a1 + 1;
  os_unfair_lock_lock(a1 + 1);
  uint64_t v6 = &a1[8 * a2];
  uint64_t v2 = *(void *)&v6[2]._os_unfair_lock_opaque;
  if (v2) {
    xpc_retain(*(xpc_object_t *)&v6[2]._os_unfair_lock_opaque);
  }
  os_unfair_lock_unlock(v5);
  return v2;
}

BOOL ne_filter_sign_data( os_unfair_lock_s *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, _DWORD *a11)
{
  BOOL v11 = 0LL;
  if (a1 && a2 <= 7)
  {
    uint64_t v20 = a1 + 1;
    os_unfair_lock_lock(a1 + 1);
    uint64_t v21 = *(uint64_t **)&a1[8 * a2 + 8]._os_unfair_lock_opaque;
    if (v21) {
      BOOL v11 = ne_filter_crypto_sign_data(v21, a3, a4, a5, a6, a7, a8, a9, a10, a11) == 0;
    }
    else {
      BOOL v11 = 1LL;
    }
    os_unfair_lock_unlock(v20);
  }

  return v11;
}

void ne_filter_send_message(os_unfair_lock_s *a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t v6 = (_xpc_connection_s *)ne_filter_copy_connection(a1, a2);
  if (v6)
  {
    unsigned int v7 = v6;
    if (a4)
    {
      if (ne_filter_connection_queue_onceToken != -1) {
        dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
      }
      xpc_connection_send_message_with_reply(v7, a3, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, a4);
    }

    else
    {
      xpc_connection_send_message(v6, a3);
    }

    xpc_release(v7);
  }

uint64_t ne_filter_stats_init(uint64_t a1)
{
  *(_DWORD *)(a1 + 288) = 0;
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("Filter stats reporting queue", v2);
  *(void *)(a1 + 312) = 0LL;
  *(void *)(a1 + 320) = v3;
  *(void *)(a1 + 296) = 0LL;
  *(void *)(a1 + 304) = a1 + 296;
  uint64_t result = mach_timebase_info(&info);
  unint64_t v5 = 1000000LL;
  if (!(_DWORD)result && info.numer && info.denom) {
    unint64_t v5 = (unint64_t)((1000000000
  }
                           * (unint64_t)info.denom
                           / info.numer
                           * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 7;
  *(void *)(a1 + 328) = v5;
  return result;
}

_OWORD *ne_filter_allocate_globals()
{
  int v0 = malloc(0x150uLL);
  unsigned int v1 = v0;
  if (v0)
  {
    v0[19] = 0u;
    v0[20] = 0u;
    v0[17] = 0u;
    v0[18] = 0u;
    v0[15] = 0u;
    v0[16] = 0u;
    v0[13] = 0u;
    v0[14] = 0u;
    v0[11] = 0u;
    v0[12] = 0u;
    v0[9] = 0u;
    v0[10] = 0u;
    v0[7] = 0u;
    v0[8] = 0u;
    v0[5] = 0u;
    v0[6] = 0u;
    v0[3] = 0u;
    v0[4] = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    _OWORD *v0 = 0u;
    do
      unsigned int v2 = __ldaxr((unsigned int *)v0);
    while (__stlxr(v2 + 1, (unsigned int *)v0));
    *((void *)v0 + 34) = 0LL;
    *((void *)v0 + 35) = v0 + 17;
    ne_filter_stats_init((uint64_t)v0);
  }

  return v1;
}

void ne_filter_deallocate_globals(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (os_unfair_lock_s *)(a2 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 288));
  dispatch_release(*(dispatch_object_t *)(a2 + 320));
  uint64_t v4 = *(dispatch_source_s **)(a2 + 312);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(a2 + 312));
    *(void *)(a2 + 312) = 0LL;
  }

  os_unfair_lock_unlock(v3);
  do
  {
    unsigned int v5 = __ldaxr((unsigned int *)a2);
    unsigned int v6 = v5 - 1;
  }

  while (__stlxr(v6, (unsigned int *)a2));
  if (!v6) {
    free((void *)a2);
  }
}

void *ne_filter_set_test_provider_factory(void *result)
{
  if (result)
  {
    uint64_t result = _Block_copy(result);
    g_testProviderFactory = (uint64_t)result;
  }

  return result;
}

void ne_filter_register_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  uint64_t v5 = *(void *)(a1 + 272);
  *(void *)(v3 + 184) = v5;
  if (v5) {
    unsigned int v6 = (void *)(v5 + 192);
  }
  else {
    unsigned int v6 = (void *)(a1 + 280);
  }
  *unsigned int v6 = v3 + 184;
  *(void *)(a1 + 272) = v3;
  *(void *)(v3 + 192) = a1 + 272;
  *(_DWORD *)(v3 + 120) |= 0x10000u;
  os_unfair_lock_unlock(v4);
}

void ne_filter_unregister_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if ((*(_BYTE *)(v2 + 122) & 1) != 0)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
    uint64_t v5 = *(void *)(v2 + 184);
    unsigned int v6 = *(void **)(v2 + 192);
    if (v5)
    {
      *(void *)(v5 + 192) = v6;
      unsigned int v6 = *(void **)(v2 + 192);
    }

    else
    {
      *(void *)(a1 + 280) = v6;
    }

    *unsigned int v6 = v5;
    *(_DWORD *)(v2 + 120) &= ~0x10000u;
    os_unfair_lock_unlock(v4);
  }

void ne_filter_stats_report(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  memset(v36, 0, sizeof(v36));
  uint64_t v2 = mach_absolute_time();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  uint64_t v3 = *(void *)(a1 + 296);
  if (!v3) {
    goto LABEL_29;
  }
  do
  {
    uint64_t v4 = *(void *)(v3 + 144);
    if (!v4) {
      goto LABEL_25;
    }
    while (1)
    {
      uint64_t v5 = atomic_load((unint64_t *)(v3 + 104));
      uint64_t v6 = atomic_load((unint64_t *)(v3 + 112));
      uint64_t v7 = *(unsigned int *)(v4 + 4);
      if (!*(void *)(v4 + 80)) {
        goto LABEL_20;
      }
      unint64_t v8 = (v2 - *(void *)(v4 + 136)) / *(void *)(a1 + 328);
      if (v8 <= (unint64_t)((double)*(unint64_t *)(v4 + 80) * 0.95)
        || *(void *)(v4 + 120) >= v5 && *(void *)(v4 + 128) >= v6)
      {
        goto LABEL_20;
      }

      if (!*((void *)v36 + v7)) {
        break;
      }
LABEL_11:
      xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (!v10)
      {
        unsigned int v17 = (os_log_s *)ne_log_obj();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_WORD *)__int128 buf = 0;
        unsigned int v18 = v17;
        int v19 = "Stats Report - failed to create xpc dictionary for stats message";
        goto LABEL_28;
      }

      BOOL v11 = v10;
      xpc_dictionary_set_uuid(v10, "flow-uuid", (const unsigned __int8 *)v3);
      xpc_dictionary_set_uint64(v11, "byte-count-inbound", v5);
      xpc_dictionary_set_uint64(v11, "byte-count-outbound", v6);
      if ((*(_WORD *)(v4 + 144) & 0x100) == 0)
      {
        int v12 = *(nw_endpoint **)(v3 + 64);
        if (v12)
        {
          if (nw_endpoint_get_type(v12) == nw_endpoint_type_address)
          {
            uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v3 + 64));
            if (address)
            {
              xpc_dictionary_set_data(v11, "local-addr", address, address->sa_len);
              *(_WORD *)(v4 + 144) |= 0x100u;
            }
          }
        }
      }

      xpc_array_append_value(*((xpc_object_t *)v36 + *(unsigned int *)(v4 + 4)), v11);
      xpc_release(v11);
      unsigned int v14 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = *(_DWORD *)(v4 + 4);
        uint64_t v16 = *(void *)(v4 + 136);
        *(_DWORD *)__int128 buf = 67110144;
        int v27 = v15;
        __int16 v28 = 2048;
        uint64_t v29 = v5;
        __int16 v30 = 2048;
        uint64_t v31 = v6;
        __int16 v32 = 2048;
        uint64_t v33 = v16;
        __int16 v34 = 2048;
        unint64_t v35 = v8;
        _os_log_debug_impl( &dword_187528000,  v14,  OS_LOG_TYPE_DEBUG,  "Stats Report collected (client %d) - in %llu out %llu (client ts %llu - elapsed msecs %llu)",  buf,  0x30u);
      }

      *(void *)(v4 + 120) = v5;
      *(void *)(v4 + 128) = v6;
      *(void *)(v4 + 136) = mach_absolute_time();
LABEL_20:
      uint64_t v4 = *(void *)(v4 + 152);
      if (!v4) {
        goto LABEL_25;
      }
    }

    xpc_object_t v9 = xpc_array_create(0LL, 0LL);
    if (v9)
    {
      *((void *)v36 + *(unsigned int *)(v4 + 4)) = v9;
      goto LABEL_11;
    }

    uint64_t v20 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)__int128 buf = 0;
    unsigned int v18 = v20;
    int v19 = "Stats Report - failed to create xpc array for stats message";
LABEL_28:
    _os_log_error_impl(&dword_187528000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_25:
    uint64_t v3 = *(void *)(v3 + 200);
  }

  while (v3);
LABEL_29:
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    int v22 = (void *)*((void *)v36 + i);
    if (v22)
    {
      xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v23, "command", 12LL);
      xpc_dictionary_set_value(v23, "stats-report-statistics", v22);
      ne_filter_send_message((os_unfair_lock_s *)a1, i, v23, 0LL);
      uint64_t v24 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        size_t count = xpc_array_get_count(v22);
        *(_DWORD *)__int128 buf = 67109376;
        int v27 = i;
        __int16 v28 = 2048;
        uint64_t v29 = count;
        _os_log_debug_impl( &dword_187528000,  v24,  OS_LOG_TYPE_DEBUG,  "Stats Report (client %d) - reported %zu stats",  buf,  0x12u);
      }

      xpc_release(v23);
      xpc_release(v22);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
}

uint64_t ne_filter_stats_report_register(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  uint64_t v5 = *(void *)(a1 + 296);
  if (!v5) {
    goto LABEL_6;
  }
  char v6 = 0;
  do
  {
    v6 |= v5 == v3;
    uint64_t v5 = *(void *)(v5 + 200);
  }

  while (v5);
  if ((v6 & 1) != 0)
  {
    uint64_t v7 = 0LL;
  }

  else
  {
LABEL_6:
    *(void *)(v3 + 200) = 0LL;
    unint64_t v8 = *(void **)(a1 + 304);
    *(void *)(v3 + 208) = v8;
    void *v8 = v3;
    *(void *)(a1 + 304) = v3 + 200;
    xpc_object_t v9 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl(&dword_187528000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - INSERTED flow", buf, 2u);
    }

    uint64_t v7 = 1LL;
  }

  if (*(void *)(a1 + 296) && !*(void *)(a1 + 312))
  {
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(a1 + 320));
    *(void *)(a1 + 312) = v10;
    if (v10)
    {
      do
        unsigned int v11 = __ldaxr((unsigned int *)a1);
      while (__stlxr(v11 + 1, (unsigned int *)a1));
      int v12 = *(dispatch_source_s **)(a1 + 312);
      dispatch_time_t v13 = dispatch_time(0LL, 200000000LL);
      dispatch_source_set_timer(v12, v13, 0xBEBC200uLL, 0LL);
      uint64_t v14 = MEMORY[0x1895F87A8];
      int v15 = *(dispatch_source_s **)(a1 + 312);
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 0x40000000LL;
      handler[2] = __ne_filter_stats_report_register_block_invoke;
      handler[3] = &__block_descriptor_tmp_12_428;
      handler[4] = a1;
      dispatch_source_set_event_handler(v15, handler);
      uint64_t v16 = *(dispatch_source_s **)(a1 + 312);
      v19[0] = v14;
      v19[1] = 0x40000000LL;
      v19[2] = __ne_filter_stats_report_register_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_13_429;
      v19[4] = a1;
      dispatch_source_set_cancel_handler(v16, v19);
      dispatch_activate(*(dispatch_object_t *)(a1 + 312));
    }

    else
    {
      unsigned int v17 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( &dword_187528000,  v17,  OS_LOG_TYPE_ERROR,  "ne_filter_stats_report_register - dispatch_source_create failed",  buf,  2u);
      }
    }
  }

  os_unfair_lock_unlock(v4);
  return v7;
}

void __ne_filter_stats_report_register_block_invoke(uint64_t a1)
{
}

void __ne_filter_stats_report_register_block_invoke_2(uint64_t a1)
{
  unsigned int v1 = *(unsigned int **)(a1 + 32);
  do
  {
    unsigned int v2 = __ldaxr(v1);
    unsigned int v3 = v2 - 1;
  }

  while (__stlxr(v3, v1));
  if (!v3) {
    free(*(void **)(a1 + 32));
  }
}

uint64_t ne_filter_stats_report_unregister(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  uint64_t v5 = *(void *)(a1 + 296);
  if (v5)
  {
    char v6 = 0;
    do
    {
      v6 |= v5 == v3;
      uint64_t v5 = *(void *)(v5 + 200);
    }

    while (v5);
    if ((v6 & 1) != 0)
    {
      uint64_t v7 = *(void *)(v3 + 200);
      unint64_t v8 = *(void **)(v3 + 208);
      if (v7)
      {
        *(void *)(v7 + 208) = v8;
        unint64_t v8 = *(void **)(v3 + 208);
      }

      else
      {
        *(void *)(a1 + 304) = v8;
      }

      void *v8 = v7;
      xpc_object_t v9 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int v12 = 0;
        _os_log_debug_impl(&dword_187528000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - REMOVED flow", v12, 2u);
      }
    }

    if (!*(void *)(a1 + 296))
    {
      dispatch_source_t v10 = *(dispatch_source_s **)(a1 + 312);
      if (v10)
      {
        dispatch_source_cancel(v10);
        dispatch_release(*(dispatch_object_t *)(a1 + 312));
        *(void *)(a1 + 312) = 0LL;
      }
    }
  }

  else
  {
    char v6 = 0;
  }

  os_unfair_lock_unlock(v4);
  return v6 & 1;
}

uint64_t ne_filter_get_definition()
{
  if (ne_filter_get_definition_onceToken != -1) {
    dispatch_once(&ne_filter_get_definition_onceToken, &__block_literal_global_432);
  }
  return ne_filter_get_definition_filter_definition;
}

uint64_t __ne_filter_get_definition_block_invoke()
{
  if (ne_filter_protocol_identifier_onceToken != -1) {
    dispatch_once(&ne_filter_protocol_identifier_onceToken, &__block_literal_global_2);
  }
  ne_filter_get_definition_filter_definition = nw_protocol_definition_create_with_identifier();
  return nw_protocol_definition_set_globals_allocator();
}

uint64_t __ne_filter_protocol_identifier_block_invoke()
{
  ne_filter_protocol_identifier_g_hasNESMAccess = 1;
  g_filter_protocol_identifier = 0u;
  unk_18C4C454C = 0u;
  qword_18C4C455C = 0LL;
  g_filter_protocol_callbacks = 0u;
  unk_18C6D7E30 = 0u;
  xmmword_18C6D7E40 = 0u;
  xmmword_18C6D7E50 = 0u;
  xmmword_18C6D7E60 = 0u;
  *(_OWORD *)&qword_18C6D7E70 = 0u;
  xmmword_18C6D7E80 = 0u;
  unk_18C6D7E90 = 0u;
  xmmword_18C6D7EA0 = 0u;
  unk_18C6D7EB0 = 0u;
  xmmword_18C6D7EC0 = 0u;
  unk_18C6D7ED0 = 0u;
  xmmword_18C6D7EE0 = 0u;
  unk_18C6D7EF0 = 0u;
  xmmword_18C6D7F00 = 0u;
  unk_18C6D7F10 = 0u;
  xmmword_18C6D7F20 = 0u;
  __strlcpy_chk();
  qword_18C4C455C = 0x100000002LL;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&g_filter_protocol_callbacks = ne_filter_protocol_add_input_handler;
  *((void *)&g_filter_protocol_callbacks + 1) = ne_filter_protocol_remove_input_handler;
  qword_18C6D7E70 = (uint64_t)ne_filter_protocol_get_input_frames;
  unk_18C6D7E78 = ne_filter_protocol_get_output_frames;
  *(void *)&xmmword_18C6D7E80 = ne_filter_protocol_finalize_output_frames;
  *(void *)&xmmword_18C6D7E60 = ne_filter_protocol_input_available;
  *((void *)&xmmword_18C6D7E60 + 1) = ne_filter_protocol_output_available;
  qword_18C6D7ED8 = (uint64_t)ne_filter_protocol_input_finished;
  *(void *)&xmmword_18C6D7EE0 = ne_filter_protocol_output_finished;
  qword_18C6D7E38 = (uint64_t)ne_filter_protocol_connect;
  *(void *)&xmmword_18C6D7E40 = ne_filter_protocol_disconnect;
  *((void *)&xmmword_18C6D7E40 + 1) = ne_filter_protocol_connected;
  *(void *)&xmmword_18C6D7E50 = ne_filter_protocol_disconnected;
  *(void *)&xmmword_18C6D7F20 = nw_filter_protocol_reset;
  return nw_protocol_register();
}

BOOL ne_filter_protocol_add_input_handler(uint64_t a1, unsigned __int8 *src)
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&uint8_t buf[4] = "ne_filter_protocol_add_input_handler";
    unsigned int v18 = "%s called with null protocol";
    goto LABEL_18;
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&uint8_t buf[4] = "ne_filter_protocol_add_input_handler";
    unsigned int v18 = "%s called with null filter";
LABEL_18:
    _os_log_fault_impl(&dword_187528000, v16, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    return 0LL;
  }

  uint64_t v5 = (unsigned int *)(v3 + 180);
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6, v5));
  if (!v6) {
    return 0LL;
  }
  *(void *)(a1 + 48) = src;
  uuid_copy((unsigned __int8 *)v3, src);
  *((void *)src + 4) = v3;
  if ((*(uint64_t (**)(unsigned __int8 *))(*((void *)src + 3) + 112LL))(src)
    && nw_parameters_get_data_mode() == 1)
  {
    uuid_unparse((const unsigned __int8 *)v3, out);
    int v7 = *(_DWORD *)(v3 + 176);
    unint64_t v8 = (os_log_s *)ne_log_obj();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 == 3)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(v3 + 80);
        if (v10) {
          LODWORD(v10) = nw_parameters_get_ip_protocol();
        }
        unsigned int v11 = *(void **)(v3 + 160);
        if (v11)
        {
          uint64_t v13 = v11[6];
          uint64_t v14 = v11[7];
          uint64_t v12 = v11[8];
          uint64_t v15 = v11[9];
        }

        else
        {
          uint64_t v12 = -1LL;
          uint64_t v13 = -1LL;
          uint64_t v14 = -1LL;
          uint64_t v15 = -1LL;
        }

        uint64x2_t v52 = *(void **)(v3 + 168);
        if (v52)
        {
          uint64_t v54 = v52[6];
          uint64_t v55 = v52[7];
          uint64_t v53 = v52[8];
          uint64_t v56 = v52[9];
        }

        else
        {
          uint64_t v53 = -1LL;
          uint64_t v54 = -1LL;
          uint64_t v55 = -1LL;
          uint64_t v56 = -1LL;
        }

        *(_DWORD *)__int128 buf = 136317442;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v13;
        __int16 v65 = 2048;
        uint64_t v66 = v14;
        __int16 v67 = 2048;
        uint64_t v68 = v12;
        __int16 v69 = 2048;
        uint64_t v70 = v15;
        __int16 v71 = 2048;
        uint64_t v72 = v54;
        __int16 v73 = 2048;
        uint64_t v74 = v55;
        __int16 v75 = 2048;
        uint64_t v76 = v53;
        __int16 v77 = 2048;
        uint64_t v78 = v56;
        uint64_t v57 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]detected data"
              "gram connection, frame fragmentation disabled";
        __int128 v58 = v8;
        uint32_t v59 = 98;
LABEL_78:
        _os_log_debug_impl(&dword_187528000, v58, OS_LOG_TYPE_DEBUG, v57, buf, v59);
      }
    }

    else if (v9)
    {
      uint64_t v49 = *(void *)(v3 + 80);
      if (v49) {
        LODWORD(v49) = nw_parameters_get_ip_protocol();
      }
      uint64_t v50 = *(unsigned int *)(v3 + 176);
      else {
        uint64x2_t v51 = (&off_18A06EDE8)[v50];
      }
      *(_DWORD *)__int128 buf = 136315650;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v49;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v51;
      uint64_t v57 = "[filter %s %d %s] detected datagram connection, frame fragmentation disabled";
      __int128 v58 = v8;
      uint32_t v59 = 28;
      goto LABEL_78;
    }

    *(_DWORD *)(v3 + 120) |= 0x8000u;
  }

  int v19 = (void *)(*(uint64_t (**)(unsigned __int8 *))(*((void *)src + 3) + 128LL))(src);
  *(void *)(v3 + 64) = nw_retain(v19);
  uint64_t v20 = (void *)(*(uint64_t (**)(unsigned __int8 *))(*((void *)src + 3) + 136LL))(src);
  *(void *)(v3 + 72) = nw_retain(v20);
  uint64_t v21 = (void *)(*(uint64_t (**)(unsigned __int8 *))(*((void *)src + 3) + 112LL))(src);
  *(void *)(v3 + 80) = nw_retain(v21);
  *(void *)(v3 + 88) = nw_parameters_copy_context();
  if (ne_filter_get_definition_onceToken != -1) {
    dispatch_once(&ne_filter_get_definition_onceToken, &__block_literal_global_432);
  }
  uint64_t globals_for_protocol = nw_context_get_globals_for_protocol();
  *(void *)(v3 + 96) = globals_for_protocol;
  if (globals_for_protocol)
  {
    (*(void (**)(unsigned __int8 *))(*((void *)src + 3) + 120LL))(src);
    int filter_unit = nw_path_get_filter_unit();
    if (!filter_unit)
    {
      *(_DWORD *)(v3 + 176) = 1;
LABEL_40:
      ne_filter_register_flow(*(void *)(v3 + 96), a1);
      BOOL result = 1LL;
      if (*(void *)(v3 + 144))
      {
        *(void *)__int128 buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2000000000LL;
        buf[24] = 1;
        unint64_t v35 = dispatch_group_create();
        uint64_t v36 = *(void *)(v3 + 144);
        for (i = (void (*)(void, void))MEMORY[0x1895F87A8]; v36; uint64_t v36 = *(void *)(v36 + 152))
        {
          uint64x2_t v38 = (void *)ne_filter_copy_connection(*(os_unfair_lock_s **)(v3 + 96), *(_DWORD *)(v36 + 4));
          if (v38)
          {
            xpc_release(v38);
          }

          else
          {
            *(_DWORD *)(v3 + 120) |= 2u;
            dispatch_group_enter(v35);
            uint64x2_t v39 = *(os_unfair_lock_s **)(v3 + 96);
            int v41 = *(_DWORD *)v36;
            unsigned int v40 = *(_DWORD *)(v36 + 4);
            v63[0] = i;
            v63[1] = (void (*)(void, void))0x40000000;
            v63[2] = (void (*)(void, void))__ne_filter_protocol_add_input_handler_block_invoke;
            v63[3] = (void (*)(void, void))&unk_18A06EB48;
            v63[4] = (void (*)(void, void))buf;
            v63[5] = (void (*)(void, void))v35;
            ne_filter_request_connection(v39, v40, v41, v63);
          }
        }

        if ((*(_BYTE *)(v3 + 120) & 2) != 0)
        {
          do
            unsigned int v42 = __ldaxr(v5);
          while (__stlxr(v42 + 1, v5));
          int32x4_t v43 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          block[0] = i;
          block[1] = 0x40000000LL;
          block[2] = __ne_filter_protocol_add_input_handler_block_invoke_2;
          block[3] = &unk_18A06EB98;
          void block[4] = buf;
          void block[5] = v3;
          void block[6] = a1;
          dispatch_queue_t v61 = dispatch_queue_create("Filter establish connections queue", v43);
          __int128 v62 = v35;
          dispatch_group_notify(v35, v61, block);
        }

        else
        {
          dispatch_release(v35);
        }

        _Block_object_dispose(buf, 8);
        return 1LL;
      }

      return result;
    }

    int v24 = filter_unit;
    int v25 = 0;
    while (1)
    {
      if (((1 << v25) & v24) != 0)
      {
        int v26 = (char *)malloc(0xA8uLL);
        if (!v26)
        {
          unint64_t v44 = (os_log_s *)ne_log_obj();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v25 + 1;
            _os_log_error_impl( &dword_187528000,  v44,  OS_LOG_TYPE_ERROR,  "Failed to allocate a ne_filter_client_t for unit %u",  buf,  8u);
          }

          *(_DWORD *)(v3 + 176) = 2;
          uint64_t v45 = *(void *)(a1 + 40);
          if (v45)
          {
            uint32x4_t v46 = (unsigned int *)(v45 + 180);
            do
              unsigned int v47 = __ldaxr(v46);
            while (__stlxr(v47, v46));
            if (v47)
            {
              do
                unsigned int v34 = __ldaxr(v46);
              while (__stlxr(v34 - 1, v46));
LABEL_58:
              if (v34 == 1) {
                ne_filter_protocol_destroy(a1);
              }
            }

            return 0LL;
          }

          int32x4_t v48 = (os_log_s *)ne_log_obj();
          BOOL result = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
          if (result)
          {
            *(_WORD *)__int128 buf = 0;
            goto LABEL_64;
          }

          return result;
        }

        int v27 = v26;
        *(_OWORD *)(v26 + 136) = 0u;
        *(_OWORD *)(v26 + 120) = 0u;
        *(_OWORD *)(v26 + 104) = 0u;
        *(_OWORD *)(v26 + 88) = 0u;
        *(_OWORD *)(v26 + 72) = 0u;
        *(_OWORD *)(v26 + 56) = 0u;
        *(_OWORD *)(v26 + 152) = 0u;
        __int16 v28 = v26 + 152;
        *(_OWORD *)(v26 + 24) = 0u;
        *(_OWORD *)(v26 + 40) = 0u;
        *(_OWORD *)(v26 + 8) = 0u;
        *(_DWORD *)int v26 = 1 << v25;
        *((_DWORD *)v26 + 1) = v25;
        nw_frame_array_init();
        nw_frame_array_init();
        void *v28 = 0LL;
        uint64_t v29 = *(void **)(v3 + 152);
        *((void *)v27 + 20) = v29;
        void *v29 = v27;
        *(void *)(v3 + 152) = v28;
      }

      if (++v25 == 8) {
        goto LABEL_40;
      }
    }
  }

  __int16 v30 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl(&dword_187528000, v30, OS_LOG_TYPE_ERROR, "Failed to get the ne_filter globals", buf, 2u);
  }

  uint64_t v31 = *(void *)(a1 + 40);
  if (v31)
  {
    __int16 v32 = (unsigned int *)(v31 + 180);
    do
      unsigned int v33 = __ldaxr(v32);
    while (__stlxr(v33, v32));
    if (v33)
    {
      do
        unsigned int v34 = __ldaxr(v32);
      while (__stlxr(v34 - 1, v32));
      goto LABEL_58;
    }

    return 0LL;
  }

  else
  {
    int32x4_t v48 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_WORD *)__int128 buf = 0;
LABEL_64:
      _os_log_impl(&dword_187528000, v48, OS_LOG_TYPE_INFO, "filter is null", buf, 2u);
      return 0LL;
    }
  }

  return result;
}

BOOL ne_filter_protocol_remove_input_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v7 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v10 = 136315138;
    unsigned int v11 = "ne_filter_protocol_remove_input_handler";
    unint64_t v8 = "%s called with null protocol";
    goto LABEL_12;
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    int v7 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v10 = 136315138;
    unsigned int v11 = "ne_filter_protocol_remove_input_handler";
    unint64_t v8 = "%s called with null filter";
LABEL_12:
    _os_log_fault_impl(&dword_187528000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    return 0LL;
  }

  uint64_t v4 = (unsigned int *)(v3 + 180);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (!v5) {
    return 0LL;
  }
  *(void *)(a2 + 32) = 0LL;
  if (*(void *)(a1 + 48) != a2) {
    return 0LL;
  }
  *(void *)(a1 + 48) = 0LL;
  *(_DWORD *)(v3 + 120) |= 1u;
  ne_filter_stats_toggle(a1, 0LL, 0LL);
  ne_filter_destroy_frames(*(void *)(a1 + 40));
  int v9 = *(_DWORD *)(v3 + 120);
  if ((v9 & 0x40) == 0)
  {
    *(_DWORD *)(v3 + 120) = v9 | 0x40;
    ne_filter_handle_input_finished(a1, 0LL);
  }

  ne_filter_cleanup(a1);
  return 1LL;
}

uint64_t ne_filter_protocol_get_input_frames( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v196 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    *(_DWORD *)__int128 buf = 136315138;
    v171 = "ne_filter_protocol_get_input_frames";
    unsigned int v17 = "%s called with null protocol";
LABEL_32:
    uint64x2_t v39 = v16;
LABEL_33:
    _os_log_fault_impl(&dword_187528000, v39, OS_LOG_TYPE_FAULT, v17, buf, 0xCu);
    return 0LL;
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (!v7)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    *(_DWORD *)__int128 buf = 136315138;
    v171 = "ne_filter_protocol_get_input_frames";
    unsigned int v17 = "%s called with null filter";
    goto LABEL_32;
  }

  uint64_t v12 = (unsigned int *)(v7 + 180);
  do
    unsigned int v13 = __ldaxr(v12);
  while (__stlxr(v13, v12));
  if (v13)
  {
    nw_frame_array_init();
    int v14 = *(_DWORD *)(v7 + 176);
    if (v14 != 2)
    {
      if (!v14)
      {
        uint64_t v15 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_debug_impl(&dword_187528000, v15, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", buf, 2u);
        }

        return 0LL;
      }

      if ((*(_BYTE *)(v7 + 120) & 8) != 0)
      {
        uuid_unparse((const unsigned __int8 *)v7, out);
        int v20 = *(_DWORD *)(v7 + 176);
        uint64_t v21 = (os_log_s *)ne_log_obj();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20 == 3)
        {
          if (v22)
          {
            uint64_t v23 = *(void *)(v7 + 80);
            if (v23) {
              LODWORD(v23) = nw_parameters_get_ip_protocol();
            }
            int v24 = *(void **)(v7 + 160);
            if (v24)
            {
              uint64_t v26 = v24[6];
              uint64_t v27 = v24[7];
              uint64_t v25 = v24[8];
              uint64_t v28 = v24[9];
            }

            else
            {
              uint64_t v25 = -1LL;
              uint64_t v26 = -1LL;
              uint64_t v27 = -1LL;
              uint64_t v28 = -1LL;
            }

            __int128 v96 = *(void **)(v7 + 168);
            if (v96)
            {
              uint64_t v98 = v96[6];
              uint64_t v99 = v96[7];
              uint64_t v97 = v96[8];
              uint64_t v100 = v96[9];
            }

            else
            {
              uint64_t v97 = -1LL;
              uint64_t v98 = -1LL;
              uint64_t v99 = -1LL;
              uint64_t v100 = -1LL;
            }

            *(_DWORD *)__int128 buf = 136317442;
            v171 = out;
            __int16 v172 = 1024;
            int v173 = v23;
            __int16 v174 = 2048;
            uint64_t v175 = v26;
            __int16 v176 = 2048;
            *(void *)v177 = v27;
            *(_WORD *)&v177[8] = 2048;
            *(void *)v178 = v25;
            *(_WORD *)&v178[8] = 2048;
            uint64_t v179 = v28;
            __int16 v180 = 2048;
            uint64_t v181 = v98;
            __int16 v182 = 2048;
            uint64_t v183 = v99;
            __int16 v184 = 2048;
            uint64_t v185 = v97;
            __int16 v186 = 2048;
            uint64_t v187 = v100;
            __int128 v103 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]start get input";
            __int128 v104 = v21;
            uint32_t v105 = 98;
LABEL_121:
            _os_log_debug_impl(&dword_187528000, v104, OS_LOG_TYPE_DEBUG, v103, buf, v105);
          }
        }

        else if (v22)
        {
          uint64_t v92 = *(void *)(v7 + 80);
          if (v92) {
            LODWORD(v92) = nw_parameters_get_ip_protocol();
          }
          uint64_t v93 = *(unsigned int *)(v7 + 176);
          else {
            __int128 v94 = (&off_18A06EDE8)[v93];
          }
          *(_DWORD *)__int128 buf = 136315650;
          v171 = out;
          __int16 v172 = 1024;
          int v173 = v92;
          __int16 v174 = 2080;
          uint64_t v175 = (uint64_t)v94;
          __int128 v103 = "[filter %s %d %s] start get input";
          __int128 v104 = v21;
          uint32_t v105 = 28;
          goto LABEL_121;
        }

        if (nelog_is_debug_logging_enabled() && (nw_frame_array_is_empty() & 1) == 0)
        {
          unsigned int v29 = nw_frame_array_unclaimed_length();
          uuid_unparse((const unsigned __int8 *)v7, out);
          int v30 = *(_DWORD *)(v7 + 176);
          uint64_t v31 = (os_log_s *)ne_log_obj();
          BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
          if (v30 == 3)
          {
            if (!v32) {
              goto LABEL_35;
            }
            uint64_t v33 = *(void *)(v7 + 80);
            if (v33) {
              LODWORD(v33) = nw_parameters_get_ip_protocol();
            }
            unsigned int v34 = *(void **)(v7 + 160);
            if (v34)
            {
              uint64_t v36 = v34[6];
              uint64_t v37 = v34[7];
              uint64_t v35 = v34[8];
              uint64_t v38 = v34[9];
            }

            else
            {
              uint64_t v35 = -1LL;
              uint64_t v36 = -1LL;
              uint64_t v37 = -1LL;
              uint64_t v38 = -1LL;
            }

            v133 = *(void **)(v7 + 168);
            if (v133)
            {
              uint64_t v135 = v133[6];
              uint64_t v136 = v133[7];
              uint64_t v134 = v133[8];
              uint64_t v137 = v133[9];
            }

            else
            {
              uint64_t v134 = -1LL;
              uint64_t v135 = -1LL;
              uint64_t v136 = -1LL;
              uint64_t v137 = -1LL;
            }

            *(_DWORD *)__int128 buf = 136318210;
            v171 = out;
            __int16 v172 = 1024;
            int v173 = v33;
            __int16 v174 = 2048;
            uint64_t v175 = v36;
            __int16 v176 = 2048;
            *(void *)v177 = v37;
            *(_WORD *)&v177[8] = 2048;
            *(void *)v178 = v35;
            *(_WORD *)&v178[8] = 2048;
            uint64_t v179 = v38;
            __int16 v180 = 2048;
            uint64_t v181 = v135;
            __int16 v182 = 2048;
            uint64_t v183 = v136;
            __int16 v184 = 2048;
            uint64_t v185 = v134;
            __int16 v186 = 2048;
            uint64_t v187 = v137;
            __int16 v188 = 1024;
            unsigned int v189 = v29;
            __int16 v190 = 1024;
            int v191 = a3;
            __int16 v192 = 1024;
            LODWORD(v193) = a4;
            __int128 v138 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]already "
                   "has %u accepted, min %u max %u";
            uint64_t v139 = v31;
            uint32_t v140 = 116;
          }

          else
          {
            if (!v32) {
              goto LABEL_35;
            }
            uint64_t v127 = *(void *)(v7 + 80);
            if (v127) {
              LODWORD(v127) = nw_parameters_get_ip_protocol();
            }
            uint64_t v128 = *(unsigned int *)(v7 + 176);
            else {
              __int128 v129 = (&off_18A06EDE8)[v128];
            }
            *(_DWORD *)__int128 buf = 136316418;
            v171 = out;
            __int16 v172 = 1024;
            int v173 = v127;
            __int16 v174 = 2080;
            uint64_t v175 = (uint64_t)v129;
            __int16 v176 = 1024;
            *(_DWORD *)v177 = v29;
            *(_WORD *)&v177[4] = 1024;
            *(_DWORD *)&v177[6] = a3;
            *(_WORD *)v178 = 1024;
            *(_DWORD *)&v178[2] = a4;
            __int128 v138 = "[filter %s %d %s] already has %u accepted, min %u max %u";
            uint64_t v139 = v31;
            uint32_t v140 = 46;
          }

          _os_log_debug_impl(&dword_187528000, v139, OS_LOG_TYPE_DEBUG, v138, buf, v140);
        }

LABEL_71:
        uint64_t v18 = (v51 + v18);
        v169 += v56;
        nw_frame_array_foreach();
        goto LABEL_72;
      }
    }
  }

  return 0LL;
}

uint64_t ne_filter_protocol_get_output_frames(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    unsigned int v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    int v38 = 136315138;
    uint64x2_t v39 = "ne_filter_protocol_get_output_frames";
    uint64_t v7 = "%s called with null protocol";
LABEL_34:
    _os_log_fault_impl(&dword_187528000, v6, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v38, 0xCu);
    return 0LL;
  }

  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    unsigned int v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    int v38 = 136315138;
    uint64x2_t v39 = "ne_filter_protocol_get_output_frames";
    uint64_t v7 = "%s called with null filter";
    goto LABEL_34;
  }

  unsigned int v2 = (unsigned int *)(v1 + 180);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    int v4 = *(_DWORD *)(v1 + 176);
    if (v4 != 2)
    {
      if (v4)
      {
        if ((*(_DWORD *)(v1 + 120) & 0x48) == 8)
        {
          uint64_t v10 = *(void *)(v1 + 32);
          else {
            uint64_t v8 = 0LL;
          }
          unsigned int v12 = nw_frame_array_unclaimed_length();
          unsigned int v13 = v12;
          int v14 = (unint64_t *)(v1 + 112);
          do
            unint64_t v15 = __ldaxr(v14);
          while (__stlxr(v15 + v12, v14));
          uuid_unparse((const unsigned __int8 *)v1, out);
          int v16 = *(_DWORD *)(v1 + 176);
          unsigned int v17 = (os_log_s *)ne_log_obj();
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
          if (v16 == 3)
          {
            if (!v18) {
              return v8;
            }
            uint64_t v19 = *(void *)(v1 + 80);
            if (v19) {
              LODWORD(v19) = nw_parameters_get_ip_protocol();
            }
            int v20 = *(void **)(v1 + 160);
            if (v20)
            {
              uint64_t v22 = v20[6];
              uint64_t v23 = v20[7];
              uint64_t v21 = v20[8];
              uint64_t v24 = v20[9];
            }

            else
            {
              uint64_t v21 = -1LL;
              uint64_t v22 = -1LL;
              uint64_t v23 = -1LL;
              uint64_t v24 = -1LL;
            }

            uint64_t v28 = *(void **)(v1 + 168);
            if (v28)
            {
              uint64_t v30 = v28[6];
              uint64_t v31 = v28[7];
              uint64_t v29 = v28[8];
              uint64_t v32 = v28[9];
            }

            else
            {
              uint64_t v29 = -1LL;
              uint64_t v30 = -1LL;
              uint64_t v31 = -1LL;
              uint64_t v32 = -1LL;
            }

            unint64_t v37 = atomic_load(v14);
            int v38 = 136318210;
            uint64x2_t v39 = out;
            __int16 v40 = 1024;
            int v41 = v19;
            __int16 v42 = 2048;
            uint64_t v43 = v22;
            __int16 v44 = 2048;
            *(void *)uint64_t v45 = v23;
            *(_WORD *)&v45[8] = 2048;
            *(void *)int v46 = v21;
            *(_WORD *)&v46[8] = 2048;
            uint64_t v47 = v24;
            __int16 v48 = 2048;
            uint64_t v49 = v30;
            __int16 v50 = 2048;
            uint64_t v51 = v31;
            __int16 v52 = 2048;
            uint64_t v53 = v29;
            __int16 v54 = 2048;
            uint64_t v55 = v32;
            __int16 v56 = 1024;
            unsigned int v57 = v13;
            __int16 v58 = 1024;
            int v59 = v8;
            __int16 v60 = 2048;
            unint64_t v61 = v37;
            unsigned int v34 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]OUTPUT: r"
                  "eturning %u bytes in %u framesu (total %llu)";
            uint64_t v35 = v17;
            uint32_t v36 = 120;
          }

          else
          {
            if (!v18) {
              return v8;
            }
            uint64_t v25 = *(void *)(v1 + 80);
            if (v25) {
              LODWORD(v25) = nw_parameters_get_ip_protocol();
            }
            uint64_t v26 = *(unsigned int *)(v1 + 176);
            else {
              uint64_t v27 = (&off_18A06EDE8)[v26];
            }
            unint64_t v33 = atomic_load(v14);
            int v38 = 136316418;
            uint64x2_t v39 = out;
            __int16 v40 = 1024;
            int v41 = v25;
            __int16 v42 = 2080;
            uint64_t v43 = (uint64_t)v27;
            __int16 v44 = 1024;
            *(_DWORD *)uint64_t v45 = v13;
            *(_WORD *)&v45[4] = 1024;
            *(_DWORD *)&v45[6] = v8;
            *(_WORD *)int v46 = 2048;
            *(void *)&v46[2] = v33;
            unsigned int v34 = "[filter %s %d %s] OUTPUT: returning %u bytes in %u framesu (total %llu)";
            uint64_t v35 = v17;
            uint32_t v36 = 50;
          }

          _os_log_debug_impl(&dword_187528000, v35, OS_LOG_TYPE_DEBUG, v34, (uint8_t *)&v38, v36);
          return v8;
        }
      }

      else
      {
        unsigned int v5 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v38) = 0;
          _os_log_debug_impl(&dword_187528000, v5, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v38, 2u);
        }
      }
    }
  }

  return 0LL;
}

uint64_t ne_filter_protocol_finalize_output_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    BOOL v18 = (os_log_s *)ne_log_obj();
    uint64_t result = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v74 = "ne_filter_protocol_finalize_output_frames";
    int v20 = "%s called with null protocol";
LABEL_24:
    _os_log_fault_impl(&dword_187528000, v18, OS_LOG_TYPE_FAULT, v20, buf, 0xCu);
    return 0LL;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    BOOL v18 = (os_log_s *)ne_log_obj();
    uint64_t result = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v74 = "ne_filter_protocol_finalize_output_frames";
    int v20 = "%s called with null filter";
    goto LABEL_24;
  }

  int v4 = (unsigned int *)(v2 + 180);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (!v5) {
    return 0LL;
  }
  int v6 = *(_DWORD *)(v2 + 176);
  if (v6)
  {
    uint64_t v7 = *(void *)(v2 + 32);
    BOOL v8 = v6 == 2 || v7 == 0;
    if (!v8 && *(void *)(*(void *)(v7 + 24) + 96LL))
    {
      if (v6 == 1 && (*(_BYTE *)(v2 + 121) & 0x20) == 0)
      {
        uuid_unparse((const unsigned __int8 *)v2, out);
        int v9 = *(_DWORD *)(v2 + 176);
        uint64_t v10 = (os_log_s *)ne_log_obj();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9 == 3)
        {
          if (v11)
          {
            uint64_t v12 = *(void *)(v2 + 80);
            if (v12) {
              LODWORD(v12) = nw_parameters_get_ip_protocol();
            }
            unsigned int v13 = *(void **)(v2 + 160);
            if (v13)
            {
              uint64_t v15 = v13[6];
              uint64_t v16 = v13[7];
              uint64_t v14 = v13[8];
              uint64_t v17 = v13[9];
            }

            else
            {
              uint64_t v14 = -1LL;
              uint64_t v15 = -1LL;
              uint64_t v16 = -1LL;
              uint64_t v17 = -1LL;
            }

            uint64_t v62 = *(void **)(v2 + 168);
            if (v62)
            {
              uint64_t v64 = v62[6];
              uint64_t v65 = v62[7];
              uint64_t v63 = v62[8];
              uint64_t v66 = v62[9];
            }

            else
            {
              uint64_t v63 = -1LL;
              uint64_t v64 = -1LL;
              uint64_t v65 = -1LL;
              uint64_t v66 = -1LL;
            }

            *(_DWORD *)__int128 buf = 136317442;
            uint64_t v74 = out;
            __int16 v75 = 1024;
            int v76 = v12;
            __int16 v77 = 2048;
            uint64_t v78 = v15;
            __int16 v79 = 2048;
            uint64_t v80 = v16;
            __int16 v81 = 2048;
            uint64_t v82 = v14;
            __int16 v83 = 2048;
            uint64_t v84 = v17;
            __int16 v85 = 2048;
            uint64_t v86 = v64;
            __int16 v87 = 2048;
            uint64_t v88 = v65;
            __int16 v89 = 2048;
            uint64_t v90 = v63;
            __int16 v91 = 2048;
            uint64_t v92 = v66;
            __int16 v67 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]passing f"
                  "inalize output frames";
            BOOL v68 = v10;
            uint32_t v69 = 98;
LABEL_84:
            _os_log_debug_impl(&dword_187528000, v68, OS_LOG_TYPE_DEBUG, v67, buf, v69);
          }
        }

        else if (v11)
        {
          uint64_t v59 = *(void *)(v2 + 80);
          if (v59) {
            LODWORD(v59) = nw_parameters_get_ip_protocol();
          }
          uint64_t v60 = *(unsigned int *)(v2 + 176);
          else {
            unint64_t v61 = (&off_18A06EDE8)[v60];
          }
          *(_DWORD *)__int128 buf = 136315650;
          uint64_t v74 = out;
          __int16 v75 = 1024;
          int v76 = v59;
          __int16 v77 = 2080;
          uint64_t v78 = (uint64_t)v61;
          __int16 v67 = "[filter %s %d %s] passing finalize output frames";
          BOOL v68 = v10;
          uint32_t v69 = 28;
          goto LABEL_84;
        }

        return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 + 24) + 96LL))(v7, a2);
      }

      uuid_unparse((const unsigned __int8 *)v2, out);
      int v31 = *(_DWORD *)(v2 + 176);
      uint64_t v32 = (os_log_s *)ne_log_obj();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v31 == 3)
      {
        if (v33)
        {
          if (*(void *)(v2 + 80)) {
            int ip_protocol = nw_parameters_get_ip_protocol();
          }
          else {
            int ip_protocol = 0;
          }
          int v46 = *(void **)(v2 + 160);
          if (v46)
          {
            uint64_t v47 = v46[7];
            uint64_t v48 = v46[9];
            uint64_t v70 = v46[6];
            uint64_t v71 = v46[8];
          }

          else
          {
            uint64_t v70 = -1LL;
            uint64_t v71 = -1LL;
            uint64_t v47 = -1LL;
            uint64_t v48 = -1LL;
          }

          uint64_t v51 = *(void **)(v2 + 168);
          if (v51)
          {
            uint64_t v53 = v51[6];
            uint64_t v54 = v51[7];
            uint64_t v52 = v51[8];
            uint64_t v55 = v51[9];
          }

          else
          {
            uint64_t v52 = -1LL;
            uint64_t v53 = -1LL;
            uint64_t v54 = -1LL;
            uint64_t v55 = -1LL;
          }

          *(_DWORD *)__int128 buf = 136317698;
          uint64_t v74 = out;
          __int16 v75 = 1024;
          int v76 = ip_protocol;
          __int16 v77 = 2048;
          uint64_t v78 = v70;
          __int16 v79 = 2048;
          uint64_t v80 = v47;
          __int16 v81 = 2048;
          uint64_t v82 = v71;
          __int16 v83 = 2048;
          uint64_t v84 = v48;
          __int16 v85 = 2048;
          uint64_t v86 = v53;
          __int16 v87 = 2048;
          uint64_t v88 = v54;
          __int16 v89 = 2048;
          uint64_t v90 = v52;
          __int16 v91 = 2048;
          uint64_t v92 = v55;
          __int16 v93 = 1024;
          int v94 = nw_frame_array_unclaimed_length();
          __int16 v56 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering n"
                "ew output frames, length %u";
          unsigned int v57 = v32;
          uint32_t v58 = 104;
LABEL_72:
          _os_log_debug_impl(&dword_187528000, v57, OS_LOG_TYPE_DEBUG, v56, buf, v58);
        }
      }

      else if (v33)
      {
        if (*(void *)(v2 + 80)) {
          int v45 = nw_parameters_get_ip_protocol();
        }
        else {
          int v45 = 0;
        }
        uint64_t v49 = *(unsigned int *)(v2 + 176);
        else {
          __int16 v50 = (&off_18A06EDE8)[v49];
        }
        *(_DWORD *)__int128 buf = 136315906;
        uint64_t v74 = out;
        __int16 v75 = 1024;
        int v76 = v45;
        __int16 v77 = 2080;
        uint64_t v78 = (uint64_t)v50;
        __int16 v79 = 1024;
        LODWORD(v80) = nw_frame_array_unclaimed_length();
        __int16 v56 = "[filter %s %d %s] filtering new output frames, length %u";
        unsigned int v57 = v32;
        uint32_t v58 = 34;
        goto LABEL_72;
      }

      ne_filter_send_approved_frames(v2, a2);
      return 1LL;
    }

    uuid_unparse((const unsigned __int8 *)v2, out);
    int v21 = *(_DWORD *)(v2 + 176);
    uint64_t v22 = (os_log_s *)ne_log_obj();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v21 == 3)
    {
      if (v23)
      {
        uint64_t v24 = *(void *)(v2 + 80);
        if (v24) {
          LODWORD(v24) = nw_parameters_get_ip_protocol();
        }
        uint64_t v25 = *(void **)(v2 + 160);
        if (v25)
        {
          uint64_t v27 = v25[6];
          uint64_t v28 = v25[7];
          uint64_t v26 = v25[8];
          uint64_t v29 = v25[9];
        }

        else
        {
          uint64_t v26 = -1LL;
          uint64_t v27 = -1LL;
          uint64_t v28 = -1LL;
          uint64_t v29 = -1LL;
        }

        unint64_t v37 = *(void **)(v2 + 168);
        if (v37)
        {
          uint64_t v39 = v37[6];
          uint64_t v40 = v37[7];
          uint64_t v38 = v37[8];
          uint64_t v41 = v37[9];
        }

        else
        {
          uint64_t v38 = -1LL;
          uint64_t v39 = -1LL;
          uint64_t v40 = -1LL;
          uint64_t v41 = -1LL;
        }

        *(_DWORD *)__int128 buf = 136317442;
        uint64_t v74 = out;
        __int16 v75 = 1024;
        int v76 = v24;
        __int16 v77 = 2048;
        uint64_t v78 = v27;
        __int16 v79 = 2048;
        uint64_t v80 = v28;
        __int16 v81 = 2048;
        uint64_t v82 = v26;
        __int16 v83 = 2048;
        uint64_t v84 = v29;
        __int16 v85 = 2048;
        uint64_t v86 = v39;
        __int16 v87 = 2048;
        uint64_t v88 = v40;
        __int16 v89 = 2048;
        uint64_t v90 = v38;
        __int16 v91 = 2048;
        uint64_t v92 = v41;
        __int16 v42 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]dropping output frames";
        uint64_t v43 = v22;
        uint32_t v44 = 98;
LABEL_56:
        _os_log_debug_impl(&dword_187528000, v43, OS_LOG_TYPE_DEBUG, v42, buf, v44);
      }
    }

    else if (v23)
    {
      uint64_t v34 = *(void *)(v2 + 80);
      if (v34) {
        LODWORD(v34) = nw_parameters_get_ip_protocol();
      }
      uint64_t v35 = *(unsigned int *)(v2 + 176);
      else {
        uint32_t v36 = (&off_18A06EDE8)[v35];
      }
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v74 = out;
      __int16 v75 = 1024;
      int v76 = v34;
      __int16 v77 = 2080;
      uint64_t v78 = (uint64_t)v36;
      __int16 v42 = "[filter %s %d %s] dropping output frames";
      uint64_t v43 = v22;
      uint32_t v44 = 28;
      goto LABEL_56;
    }

    nw_frame_array_foreach();
    return 0LL;
  }

  uint64_t v30 = (os_log_s *)ne_log_obj();
  uint64_t result = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (!(_DWORD)result) {
    return result;
  }
  *(_WORD *)__int128 buf = 0;
  _os_log_debug_impl(&dword_187528000, v30, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", buf, 2u);
  return 0LL;
}

void ne_filter_protocol_input_available(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v12 = 136315138;
    unsigned int v13 = "ne_filter_protocol_input_available";
    uint64_t v10 = "%s called with null protocol";
LABEL_19:
    _os_log_fault_impl(&dword_187528000, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v12, 0xCu);
    return;
  }

  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    int v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v12 = 136315138;
    unsigned int v13 = "ne_filter_protocol_input_available";
    uint64_t v10 = "%s called with null filter";
    goto LABEL_19;
  }

  uint64_t v2 = (unsigned int *)(v1 + 180);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    int v4 = *(_DWORD *)(v1 + 176);
    if (v4 == 3 || v4 == 1)
    {
      uint64_t v6 = *(void *)(v1 + 48);
      if (v6)
      {
        uint64_t v7 = *(void *)(v6 + 24);
        if (v7)
        {
          BOOL v8 = *(void (**)(void))(v7 + 64);
          if (v8) {
            v8();
          }
        }
      }
    }

    else if (!v4)
    {
      BOOL v11 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_187528000, v11, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v12, 2u);
      }
    }
  }

void ne_filter_protocol_output_available(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    int v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v12 = 136315138;
    unsigned int v13 = "ne_filter_protocol_output_available";
    uint64_t v10 = "%s called with null protocol";
LABEL_19:
    _os_log_fault_impl(&dword_187528000, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v12, 0xCu);
    return;
  }

  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    int v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v12 = 136315138;
    unsigned int v13 = "ne_filter_protocol_output_available";
    uint64_t v10 = "%s called with null filter";
    goto LABEL_19;
  }

  uint64_t v2 = (unsigned int *)(v1 + 180);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    int v4 = *(_DWORD *)(v1 + 176);
    if (v4 == 3 || v4 == 1)
    {
      uint64_t v6 = *(void *)(v1 + 48);
      if (v6)
      {
        uint64_t v7 = *(void *)(v6 + 24);
        if (v7)
        {
          BOOL v8 = *(void (**)(void))(v7 + 72);
          if (v8) {
            v8();
          }
        }
      }
    }

    else if (!v4)
    {
      BOOL v11 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_187528000, v11, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v12, 2u);
      }
    }
  }

void ne_filter_protocol_input_finished(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v27 = 136315138;
    uint64_t v28 = "ne_filter_protocol_input_finished";
    uint64_t v15 = "%s called with null protocol";
    goto LABEL_18;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v27 = 136315138;
    uint64_t v28 = "ne_filter_protocol_input_finished";
    uint64_t v15 = "%s called with null filter";
LABEL_18:
    _os_log_fault_impl(&dword_187528000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v27, 0xCu);
    return;
  }

  unsigned int v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4 || (*(_DWORD *)(v2 + 176) | 2) != 3 || (*(_WORD *)(v2 + 120) & 0x240) != 0) {
    return;
  }
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v5 = *(_DWORD *)(v2 + 176);
  uint64_t v6 = (os_log_s *)ne_log_obj();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(v2 + 80);
      if (v8) {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
      }
      int v9 = *(void **)(v2 + 160);
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }

      else
      {
        uint64_t v10 = -1LL;
        uint64_t v11 = -1LL;
        uint64_t v12 = -1LL;
        uint64_t v13 = -1LL;
      }

      uint64_t v19 = *(void **)(v2 + 168);
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }

      else
      {
        uint64_t v20 = -1LL;
        uint64_t v21 = -1LL;
        uint64_t v22 = -1LL;
        uint64_t v23 = -1LL;
      }

      int v27 = 136317442;
      uint64_t v28 = out;
      __int16 v29 = 1024;
      int v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      uint64_t v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]input finished";
      uint64_t v25 = v6;
      uint32_t v26 = 98;
LABEL_35:
      _os_log_debug_impl(&dword_187528000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v27, v26);
    }
  }

  else if (v7)
  {
    uint64_t v16 = *(void *)(v2 + 80);
    if (v16) {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
    }
    uint64_t v17 = *(unsigned int *)(v2 + 176);
    else {
      BOOL v18 = (&off_18A06EDE8)[v17];
    }
    int v27 = 136315650;
    uint64_t v28 = out;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 2080;
    uint64_t v32 = (uint64_t)v18;
    uint64_t v24 = "[filter %s %d %s] input finished";
    uint64_t v25 = v6;
    uint32_t v26 = 28;
    goto LABEL_35;
  }

  *(_DWORD *)(v2 + 120) |= 0x200u;
  nw_frame_array_init();
  if ((*(_BYTE *)(v2 + 121) & 0x40) == 0) {
    ne_filter_read_from_network(*(void *)(a1 + 40), (uint64_t)&v27, 1);
  }
  ne_filter_handle_input_finished(a1, (uint64_t)&v27);
}

void ne_filter_protocol_output_finished(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v28 = 136315138;
    __int16 v29 = "ne_filter_protocol_output_finished";
    uint64_t v15 = "%s called with null protocol";
    goto LABEL_16;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v28 = 136315138;
    __int16 v29 = "ne_filter_protocol_output_finished";
    uint64_t v15 = "%s called with null filter";
LABEL_16:
    _os_log_fault_impl(&dword_187528000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v28, 0xCu);
    return;
  }

  unsigned int v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4) {
    return;
  }
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v5 = *(_DWORD *)(v2 + 176);
  uint64_t v6 = (os_log_s *)ne_log_obj();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = *(void *)(v2 + 80);
    if (v8) {
      LODWORD(v8) = nw_parameters_get_ip_protocol();
    }
    int v9 = *(void **)(v2 + 160);
    if (v9)
    {
      uint64_t v11 = v9[6];
      uint64_t v12 = v9[7];
      uint64_t v10 = v9[8];
      uint64_t v13 = v9[9];
    }

    else
    {
      uint64_t v10 = -1LL;
      uint64_t v11 = -1LL;
      uint64_t v12 = -1LL;
      uint64_t v13 = -1LL;
    }

    uint64_t v20 = *(void **)(v2 + 168);
    if (v20)
    {
      uint64_t v22 = v20[6];
      uint64_t v23 = v20[7];
      uint64_t v21 = v20[8];
      uint64_t v24 = v20[9];
    }

    else
    {
      uint64_t v21 = -1LL;
      uint64_t v22 = -1LL;
      uint64_t v23 = -1LL;
      uint64_t v24 = -1LL;
    }

    int v28 = 136317442;
    __int16 v29 = out;
    __int16 v30 = 1024;
    int v31 = v8;
    __int16 v32 = 2048;
    uint64_t v33 = v11;
    __int16 v34 = 2048;
    uint64_t v35 = v12;
    __int16 v36 = 2048;
    uint64_t v37 = v10;
    __int16 v38 = 2048;
    uint64_t v39 = v13;
    __int16 v40 = 2048;
    uint64_t v41 = v22;
    __int16 v42 = 2048;
    uint64_t v43 = v23;
    __int16 v44 = 2048;
    uint64_t v45 = v21;
    __int16 v46 = 2048;
    uint64_t v47 = v24;
    uint64_t v25 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output finished";
    uint32_t v26 = v6;
    uint32_t v27 = 98;
  }

  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v17 = *(void *)(v2 + 80);
    if (v17) {
      LODWORD(v17) = nw_parameters_get_ip_protocol();
    }
    uint64_t v18 = *(unsigned int *)(v2 + 176);
    else {
      uint64_t v19 = (&off_18A06EDE8)[v18];
    }
    int v28 = 136315650;
    __int16 v29 = out;
    __int16 v30 = 1024;
    int v31 = v17;
    __int16 v32 = 2080;
    uint64_t v33 = (uint64_t)v19;
    uint64_t v25 = "[filter %s %d %s] output finished";
    uint32_t v26 = v6;
    uint32_t v27 = 28;
  }

  _os_log_debug_impl(&dword_187528000, v26, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v28, v27);
LABEL_18:
  if ((*(_DWORD *)(v2 + 176) | 2) == 3)
  {
    int v16 = *(_DWORD *)(v2 + 120);
    if ((v16 & 0x10) == 0)
    {
      *(_DWORD *)(v2 + 120) = v16 | 0x100;
      ne_filter_handle_output_finished(a1);
    }
  }

BOOL ne_filter_protocol_connect(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v11 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v72 = 136315138;
    uint64_t v73 = "ne_filter_protocol_connect";
    uint64_t v12 = "%s called with null protocol";
LABEL_20:
    _os_log_fault_impl(&dword_187528000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v72, 0xCu);
    return 0LL;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v11 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v72 = 136315138;
    uint64_t v73 = "ne_filter_protocol_connect";
    uint64_t v12 = "%s called with null filter";
    goto LABEL_20;
  }

  unsigned int v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4) {
    return 0LL;
  }
  int v5 = *(_DWORD *)(v2 + 120);
  *(_DWORD *)(v2 + 120) = v5 | 4;
  if ((v5 & 2) != 0)
  {
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v13 = *(_DWORD *)(v2 + 176);
    uint64_t v14 = (os_log_s *)ne_log_obj();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13 == 3)
    {
      if (v15)
      {
        uint64_t v16 = *(void *)(v2 + 80);
        if (v16) {
          LODWORD(v16) = nw_parameters_get_ip_protocol();
        }
        uint64_t v17 = *(void **)(v2 + 160);
        if (v17)
        {
          uint64_t v19 = v17[6];
          uint64_t v20 = v17[7];
          uint64_t v18 = v17[8];
          uint64_t v21 = v17[9];
        }

        else
        {
          uint64_t v18 = -1LL;
          uint64_t v19 = -1LL;
          uint64_t v20 = -1LL;
          uint64_t v21 = -1LL;
        }

        uint64_t v47 = *(void **)(v2 + 168);
        if (v47)
        {
          uint64_t v49 = v47[6];
          uint64_t v50 = v47[7];
          uint64_t v48 = v47[8];
          uint64_t v51 = v47[9];
        }

        else
        {
          uint64_t v48 = -1LL;
          uint64_t v49 = -1LL;
          uint64_t v50 = -1LL;
          uint64_t v51 = -1LL;
        }

        int v72 = 136317442;
        uint64_t v73 = out;
        __int16 v74 = 1024;
        int v75 = v16;
        __int16 v76 = 2048;
        uint64_t v77 = v19;
        __int16 v78 = 2048;
        uint64_t v79 = v20;
        __int16 v80 = 2048;
        uint64_t v81 = v18;
        __int16 v82 = 2048;
        uint64_t v83 = v21;
        __int16 v84 = 2048;
        uint64_t v85 = v49;
        __int16 v86 = 2048;
        uint64_t v87 = v50;
        __int16 v88 = 2048;
        uint64_t v89 = v48;
        __int16 v90 = 2048;
        uint64_t v91 = v51;
        uint64_t v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]waiting for xpc connection";
LABEL_69:
        uint64_t v53 = v14;
        uint32_t v54 = 98;
        goto LABEL_70;
      }
    }

    else if (v15)
    {
      uint64_t v41 = *(void *)(v2 + 80);
      if (v41) {
        LODWORD(v41) = nw_parameters_get_ip_protocol();
      }
      uint64_t v42 = *(unsigned int *)(v2 + 176);
      else {
        uint64_t v43 = (&off_18A06EDE8)[v42];
      }
      int v72 = 136315650;
      uint64_t v73 = out;
      __int16 v74 = 1024;
      int v75 = v41;
      __int16 v76 = 2080;
      uint64_t v77 = (uint64_t)v43;
      uint64_t v52 = "[filter %s %d %s] waiting for xpc connection";
      goto LABEL_66;
    }

    return 1LL;
  }

  int v6 = *(_DWORD *)(v2 + 176);
  if (v6 != 3 && v6 != 1)
  {
    if (!v6)
    {
      uint64_t v22 = *(void *)(v2 + 144);
      if (v22)
      {
        BOOL result = 1LL;
        while (*(_DWORD *)(v22 + 40))
        {
          uint64_t v22 = *(void *)(v22 + 152);
          if (!v22) {
            return result;
          }
        }

        __int16 v32 = *(_WORD *)(v22 + 144);
        if ((v32 & 2) == 0)
        {
          *(_WORD *)(v22 + 144) = v32 | 2;
          ne_filter_data_protocol_send_new_flow(a1, v22);
          return 1LL;
        }

        uuid_unparse((const unsigned __int8 *)v2, out);
        int v33 = *(_DWORD *)(v2 + 176);
        uint64_t v14 = (os_log_s *)ne_log_obj();
        BOOL v34 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v33 == 3)
        {
          if (!v34) {
            return 1LL;
          }
          uint64_t v35 = *(void *)(v2 + 80);
          if (v35) {
            LODWORD(v35) = nw_parameters_get_ip_protocol();
          }
          __int16 v36 = *(void **)(v2 + 160);
          if (v36)
          {
            uint64_t v38 = v36[6];
            uint64_t v39 = v36[7];
            uint64_t v37 = v36[8];
            uint64_t v40 = v36[9];
          }

          else
          {
            uint64_t v37 = -1LL;
            uint64_t v38 = -1LL;
            uint64_t v39 = -1LL;
            uint64_t v40 = -1LL;
          }

          __int16 v67 = *(void **)(v2 + 168);
          if (v67)
          {
            uint64_t v69 = v67[6];
            uint64_t v70 = v67[7];
            uint64_t v68 = v67[8];
            uint64_t v71 = v67[9];
          }

          else
          {
            uint64_t v68 = -1LL;
            uint64_t v69 = -1LL;
            uint64_t v70 = -1LL;
            uint64_t v71 = -1LL;
          }

          int v72 = 136317442;
          uint64_t v73 = out;
          __int16 v74 = 1024;
          int v75 = v35;
          __int16 v76 = 2048;
          uint64_t v77 = v38;
          __int16 v78 = 2048;
          uint64_t v79 = v39;
          __int16 v80 = 2048;
          uint64_t v81 = v37;
          __int16 v82 = 2048;
          uint64_t v83 = v40;
          __int16 v84 = 2048;
          uint64_t v85 = v69;
          __int16 v86 = 2048;
          uint64_t v87 = v70;
          __int16 v88 = 2048;
          uint64_t v89 = v68;
          __int16 v90 = 2048;
          uint64_t v91 = v71;
          uint64_t v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]suppressing"
                " duplicate connect call while waiting for initial verdict";
          goto LABEL_69;
        }

        if (!v34) {
          return 1LL;
        }
        uint64_t v44 = *(void *)(v2 + 80);
        if (v44) {
          LODWORD(v44) = nw_parameters_get_ip_protocol();
        }
        uint64_t v45 = *(unsigned int *)(v2 + 176);
        else {
          __int16 v46 = (&off_18A06EDE8)[v45];
        }
        int v72 = 136315650;
        uint64_t v73 = out;
        __int16 v74 = 1024;
        int v75 = v44;
        __int16 v76 = 2080;
        uint64_t v77 = (uint64_t)v46;
        uint64_t v52 = "[filter %s %d %s] suppressing duplicate connect call while waiting for initial verdict";
LABEL_66:
        uint64_t v53 = v14;
        uint32_t v54 = 28;
LABEL_70:
        _os_log_debug_impl(&dword_187528000, v53, OS_LOG_TYPE_DEBUG, v52, (uint8_t *)&v72, v54);
        return 1LL;
      }

      return 1LL;
    }

    uuid_unparse((const unsigned __int8 *)v2, out);
    int v23 = *(_DWORD *)(v2 + 176);
    uint64_t v24 = (os_log_s *)ne_log_obj();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23 == 3)
    {
      if (v25)
      {
        uint64_t v26 = *(void *)(v2 + 80);
        if (v26) {
          LODWORD(v26) = nw_parameters_get_ip_protocol();
        }
        uint32_t v27 = *(void **)(v2 + 160);
        if (v27)
        {
          uint64_t v29 = v27[6];
          uint64_t v30 = v27[7];
          uint64_t v28 = v27[8];
          uint64_t v31 = v27[9];
        }

        else
        {
          uint64_t v28 = -1LL;
          uint64_t v29 = -1LL;
          uint64_t v30 = -1LL;
          uint64_t v31 = -1LL;
        }

        unsigned int v57 = *(void **)(v2 + 168);
        if (v57)
        {
          uint64_t v59 = v57[6];
          uint64_t v60 = v57[7];
          uint64_t v58 = v57[8];
          uint64_t v61 = v57[9];
        }

        else
        {
          uint64_t v58 = -1LL;
          uint64_t v59 = -1LL;
          uint64_t v60 = -1LL;
          uint64_t v61 = -1LL;
        }

        uint64_t v62 = *(unsigned int *)(v2 + 176);
        else {
          uint64_t v63 = (&off_18A06EDE8)[v62];
        }
        int v72 = 136317698;
        uint64_t v73 = out;
        __int16 v74 = 1024;
        int v75 = v26;
        __int16 v76 = 2048;
        uint64_t v77 = v29;
        __int16 v78 = 2048;
        uint64_t v79 = v30;
        __int16 v80 = 2048;
        uint64_t v81 = v28;
        __int16 v82 = 2048;
        uint64_t v83 = v31;
        __int16 v84 = 2048;
        uint64_t v85 = v59;
        __int16 v86 = 2048;
        uint64_t v87 = v60;
        __int16 v88 = 2048;
        uint64_t v89 = v58;
        __int16 v90 = 2048;
        uint64_t v91 = v61;
        __int16 v92 = 2080;
        __int16 v93 = v63;
        uint64_t v64 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]failing call "
              "to connect because of verdict: %s";
        uint64_t v65 = v24;
        uint32_t v66 = 108;
LABEL_87:
        _os_log_debug_impl(&dword_187528000, v65, OS_LOG_TYPE_DEBUG, v64, (uint8_t *)&v72, v66);
      }
    }

    else if (v25)
    {
      uint64_t v55 = *(void *)(v2 + 80);
      if (v55) {
        LODWORD(v55) = nw_parameters_get_ip_protocol();
      }
      __int16 v56 = "pass";
      switch(*(_DWORD *)(v2 + 176))
      {
        case 0:
          __int16 v56 = "invalid";
          break;
        case 1:
          break;
        case 2:
          __int16 v56 = "drop";
          break;
        case 3:
          __int16 v56 = "more-data";
          break;
        default:
          __int16 v56 = "unknown";
          break;
      }

      int v72 = 136315906;
      uint64_t v73 = out;
      __int16 v74 = 1024;
      int v75 = v55;
      __int16 v76 = 2080;
      uint64_t v77 = (uint64_t)v56;
      __int16 v78 = 2080;
      uint64_t v79 = (uint64_t)v56;
      uint64_t v64 = "[filter %s %d %s] failing call to connect because of verdict: %s";
      uint64_t v65 = v24;
      uint32_t v66 = 38;
      goto LABEL_87;
    }

    return 0LL;
  }

  BOOL result = 1LL;
  if ((v5 & 0x40) == 0)
  {
    uint64_t v9 = *(void *)(v2 + 32);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void, uint64_t))(*(void *)(v9 + 24) + 24LL);
      if (v10)
      {
        v10(*(void *)(v2 + 32), a1);
        return 1LL;
      }
    }
  }

  return result;
}

void ne_filter_protocol_connected(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v15 = 136315138;
    uint64_t v16 = "ne_filter_protocol_connected";
    int v13 = "%s called with null protocol";
    goto LABEL_25;
  }

  uint64_t v3 = a1[5];
  if (!v3)
  {
    uint64_t v12 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v15 = 136315138;
    uint64_t v16 = "ne_filter_protocol_connected";
    int v13 = "%s called with null filter";
LABEL_25:
    _os_log_fault_impl(&dword_187528000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v15, 0xCu);
    return;
  }

  int v5 = (unsigned int *)(v3 + 180);
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6, v5));
  if (v6)
  {
    uint64_t v7 = a1[6];
    if (v7)
    {
      uint64_t v8 = *(void *)(v7 + 24);
      if (v8)
      {
        uint64_t v9 = *(void (**)(void, uint64_t))(v8 + 40);
        if (v9) {
          v9(a1[6], a2);
        }
      }
    }

    if (a1[4] == a2)
    {
      *(_DWORD *)(v3 + 120) |= 8u;
      if (!*(void *)(v3 + 64))
      {
        uint64_t v10 = (void *)(*(uint64_t (**)(void *))(a1[3] + 128LL))(a1);
        *(void *)(v3 + 64) = nw_retain(v10);
      }

      unsigned int v11 = *(_DWORD *)(v3 + 176);
      if (v11 < 2)
      {
        if (!v7) {
          return;
        }
        goto LABEL_22;
      }

      if (v7 && v11 == 3)
      {
LABEL_22:
        uint64_t v14 = *(void (**)(uint64_t, void *))(*(void *)(v7 + 24) + 40LL);
        if (v14) {
          v14(v7, a1);
        }
      }
    }
  }

void ne_filter_protocol_disconnect(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v27 = 136315138;
    uint64_t v28 = "ne_filter_protocol_disconnect";
    int v15 = "%s called with null protocol";
    goto LABEL_17;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v27 = 136315138;
    uint64_t v28 = "ne_filter_protocol_disconnect";
    int v15 = "%s called with null filter";
LABEL_17:
    _os_log_fault_impl(&dword_187528000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v27, 0xCu);
    return;
  }

  uint64_t v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4 && (*(_BYTE *)(v2 + 120) & 0x10) == 0)
  {
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v5 = *(_DWORD *)(v2 + 176);
    unsigned int v6 = (os_log_s *)ne_log_obj();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 == 3)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(v2 + 80);
        if (v8) {
          LODWORD(v8) = nw_parameters_get_ip_protocol();
        }
        uint64_t v9 = *(void **)(v2 + 160);
        if (v9)
        {
          uint64_t v11 = v9[6];
          uint64_t v12 = v9[7];
          uint64_t v10 = v9[8];
          uint64_t v13 = v9[9];
        }

        else
        {
          uint64_t v10 = -1LL;
          uint64_t v11 = -1LL;
          uint64_t v12 = -1LL;
          uint64_t v13 = -1LL;
        }

        uint64_t v19 = *(void **)(v2 + 168);
        if (v19)
        {
          uint64_t v21 = v19[6];
          uint64_t v22 = v19[7];
          uint64_t v20 = v19[8];
          uint64_t v23 = v19[9];
        }

        else
        {
          uint64_t v20 = -1LL;
          uint64_t v21 = -1LL;
          uint64_t v22 = -1LL;
          uint64_t v23 = -1LL;
        }

        int v27 = 136317442;
        uint64_t v28 = out;
        __int16 v29 = 1024;
        int v30 = v8;
        __int16 v31 = 2048;
        uint64_t v32 = v11;
        __int16 v33 = 2048;
        uint64_t v34 = v12;
        __int16 v35 = 2048;
        uint64_t v36 = v10;
        __int16 v37 = 2048;
        uint64_t v38 = v13;
        __int16 v39 = 2048;
        uint64_t v40 = v21;
        __int16 v41 = 2048;
        uint64_t v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v20;
        __int16 v45 = 2048;
        uint64_t v46 = v23;
        uint64_t v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output finished - disconnect";
        BOOL v25 = v6;
        uint32_t v26 = 98;
LABEL_32:
        _os_log_debug_impl(&dword_187528000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v27, v26);
      }
    }

    else if (v7)
    {
      uint64_t v16 = *(void *)(v2 + 80);
      if (v16) {
        LODWORD(v16) = nw_parameters_get_ip_protocol();
      }
      uint64_t v17 = *(unsigned int *)(v2 + 176);
      else {
        uint64_t v18 = (&off_18A06EDE8)[v17];
      }
      int v27 = 136315650;
      uint64_t v28 = out;
      __int16 v29 = 1024;
      int v30 = v16;
      __int16 v31 = 2080;
      uint64_t v32 = (uint64_t)v18;
      uint64_t v24 = "[filter %s %d %s] output finished - disconnect";
      BOOL v25 = v6;
      uint32_t v26 = 28;
      goto LABEL_32;
    }

    *(_DWORD *)(v2 + 120) |= 0x10u;
    ne_filter_handle_output_finished(a1);
  }

void ne_filter_protocol_disconnected(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v27 = 136315138;
    uint64_t v28 = "ne_filter_protocol_disconnected";
    int v15 = "%s called with null protocol";
    goto LABEL_17;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v27 = 136315138;
    uint64_t v28 = "ne_filter_protocol_disconnected";
    int v15 = "%s called with null filter";
LABEL_17:
    _os_log_fault_impl(&dword_187528000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v27, 0xCu);
    return;
  }

  uint64_t v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4 && (*(_BYTE *)(v2 + 120) & 0x40) == 0)
  {
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v5 = *(_DWORD *)(v2 + 176);
    unsigned int v6 = (os_log_s *)ne_log_obj();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 == 3)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(v2 + 80);
        if (v8) {
          LODWORD(v8) = nw_parameters_get_ip_protocol();
        }
        uint64_t v9 = *(void **)(v2 + 160);
        if (v9)
        {
          uint64_t v11 = v9[6];
          uint64_t v12 = v9[7];
          uint64_t v10 = v9[8];
          uint64_t v13 = v9[9];
        }

        else
        {
          uint64_t v10 = -1LL;
          uint64_t v11 = -1LL;
          uint64_t v12 = -1LL;
          uint64_t v13 = -1LL;
        }

        uint64_t v19 = *(void **)(v2 + 168);
        if (v19)
        {
          uint64_t v21 = v19[6];
          uint64_t v22 = v19[7];
          uint64_t v20 = v19[8];
          uint64_t v23 = v19[9];
        }

        else
        {
          uint64_t v20 = -1LL;
          uint64_t v21 = -1LL;
          uint64_t v22 = -1LL;
          uint64_t v23 = -1LL;
        }

        int v27 = 136317442;
        uint64_t v28 = out;
        __int16 v29 = 1024;
        int v30 = v8;
        __int16 v31 = 2048;
        uint64_t v32 = v11;
        __int16 v33 = 2048;
        uint64_t v34 = v12;
        __int16 v35 = 2048;
        uint64_t v36 = v10;
        __int16 v37 = 2048;
        uint64_t v38 = v13;
        __int16 v39 = 2048;
        uint64_t v40 = v21;
        __int16 v41 = 2048;
        uint64_t v42 = v22;
        __int16 v43 = 2048;
        uint64_t v44 = v20;
        __int16 v45 = 2048;
        uint64_t v46 = v23;
        uint64_t v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]disconnected";
        BOOL v25 = v6;
        uint32_t v26 = 98;
LABEL_32:
        _os_log_debug_impl(&dword_187528000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v27, v26);
      }
    }

    else if (v7)
    {
      uint64_t v16 = *(void *)(v2 + 80);
      if (v16) {
        LODWORD(v16) = nw_parameters_get_ip_protocol();
      }
      uint64_t v17 = *(unsigned int *)(v2 + 176);
      else {
        uint64_t v18 = (&off_18A06EDE8)[v17];
      }
      int v27 = 136315650;
      uint64_t v28 = out;
      __int16 v29 = 1024;
      int v30 = v16;
      __int16 v31 = 2080;
      uint64_t v32 = (uint64_t)v18;
      uint64_t v24 = "[filter %s %d %s] disconnected";
      BOOL v25 = v6;
      uint32_t v26 = 28;
      goto LABEL_32;
    }

    *(_DWORD *)(v2 + 120) |= 0x40u;
    ne_filter_handle_output_finished(a1);
    ne_filter_handle_input_finished(a1, 0LL);
    ne_filter_cleanup(a1);
  }

uint64_t nw_filter_protocol_reset(uint64_t a1, uint64_t a2)
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    uint64_t result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)uint64_t v64 = 136315138;
    *(void *)&v64[4] = "nw_filter_protocol_reset";
    uint64_t v18 = "%s called with null protocol";
LABEL_16:
    _os_log_fault_impl(&dword_187528000, v16, OS_LOG_TYPE_FAULT, v18, v64, 0xCu);
    return 0LL;
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    uint64_t result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)uint64_t v64 = 136315138;
    *(void *)&v64[4] = "nw_filter_protocol_reset";
    uint64_t v18 = "%s called with null filter";
    goto LABEL_16;
  }

  int v5 = (unsigned int *)(v3 + 180);
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6, v5));
  if (!v6) {
    return 0LL;
  }
  uuid_unparse((const unsigned __int8 *)v3, out);
  int v7 = *(_DWORD *)(v3 + 176);
  uint64_t v8 = (os_log_s *)ne_log_obj();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7 == 3)
  {
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v3 + 80);
    if (v10) {
      LODWORD(v10) = nw_parameters_get_ip_protocol();
    }
    uint64_t v11 = *(void **)(v3 + 160);
    if (v11)
    {
      uint64_t v13 = v11[6];
      uint64_t v14 = v11[7];
      uint64_t v12 = v11[8];
      uint64_t v15 = v11[9];
    }

    else
    {
      uint64_t v12 = -1LL;
      uint64_t v13 = -1LL;
      uint64_t v14 = -1LL;
      uint64_t v15 = -1LL;
    }

    __int16 v45 = *(void **)(v3 + 168);
    if (v45)
    {
      uint64_t v47 = v45[6];
      uint64_t v48 = v45[7];
      uint64_t v46 = v45[8];
      uint64_t v49 = v45[9];
    }

    else
    {
      uint64_t v46 = -1LL;
      uint64_t v47 = -1LL;
      uint64_t v48 = -1LL;
      uint64_t v49 = -1LL;
    }

    *(_DWORD *)uint64_t v64 = 136317442;
    *(void *)&v64[4] = out;
    *(_WORD *)&v64[12] = 1024;
    *(_DWORD *)&v64[14] = v10;
    *(_WORD *)&v64[18] = 2048;
    *(void *)&v64[20] = v13;
    *(_WORD *)&v64[28] = 2048;
    *(void *)&v64[30] = v14;
    *(_WORD *)&v64[38] = 2048;
    uint64_t v65 = v12;
    __int16 v66 = 2048;
    uint64_t v67 = v15;
    __int16 v68 = 2048;
    uint64_t v69 = v47;
    __int16 v70 = 2048;
    uint64_t v71 = v48;
    __int16 v72 = 2048;
    uint64_t v73 = v46;
    __int16 v74 = 2048;
    uint64_t v75 = v49;
    uint64_t v50 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]connection reset";
    uint64_t v51 = v8;
    uint32_t v52 = 98;
  }

  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v42 = *(void *)(v3 + 80);
    if (v42) {
      LODWORD(v42) = nw_parameters_get_ip_protocol();
    }
    uint64_t v43 = *(unsigned int *)(v3 + 176);
    else {
      uint64_t v44 = (&off_18A06EDE8)[v43];
    }
    *(_DWORD *)uint64_t v64 = 136315650;
    *(void *)&v64[4] = out;
    *(_WORD *)&v64[12] = 1024;
    *(_DWORD *)&v64[14] = v42;
    *(_WORD *)&v64[18] = 2080;
    *(void *)&v64[20] = v44;
    uint64_t v50 = "[filter %s %d %s] connection reset";
    uint64_t v51 = v8;
    uint32_t v52 = 28;
  }

  _os_log_debug_impl(&dword_187528000, v51, OS_LOG_TYPE_DEBUG, v50, v64, v52);
LABEL_19:
  uint64_t v19 = *(void *)(v3 + 144);
  if (v19)
  {
    do
    {
      ne_filter_data_protocol_send_finished(a1, v19, 0xBu);
      ne_filter_destroy_frames(*(void *)(a1 + 40));
      *(_DWORD *)(v19 + 40) = 0;
      *(_OWORD *)(v19 + 88) = 0u;
      *(_OWORD *)(v19 + 104) = 0u;
      *(_OWORD *)(v19 + 120) = 0u;
      *(void *)(v19 + 136) = 0LL;
      *(_WORD *)(v19 + 144) &= 0xFE00u;
      uint64_t v19 = *(void *)(v19 + 152);
    }

    while (v19);
    int v20 = 0;
  }

  else
  {
    int v20 = 1;
  }

  *(_DWORD *)(v3 + 176) = v20;
  if (!(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 112LL))(a2)
    || nw_parameters_get_data_mode() != 1)
  {
    goto LABEL_33;
  }

  uuid_unparse((const unsigned __int8 *)v3, out);
  int v21 = *(_DWORD *)(v3 + 176);
  uint64_t v22 = (os_log_s *)ne_log_obj();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (v21 == 3)
  {
    if (v23)
    {
      uint64_t v24 = *(void *)(v3 + 80);
      if (v24) {
        LODWORD(v24) = nw_parameters_get_ip_protocol();
      }
      BOOL v25 = *(void **)(v3 + 160);
      if (v25)
      {
        uint64_t v27 = v25[6];
        uint64_t v28 = v25[7];
        uint64_t v26 = v25[8];
        uint64_t v29 = v25[9];
      }

      else
      {
        uint64_t v26 = -1LL;
        uint64_t v27 = -1LL;
        uint64_t v28 = -1LL;
        uint64_t v29 = -1LL;
      }

      __int16 v56 = *(void **)(v3 + 168);
      if (v56)
      {
        uint64_t v58 = v56[6];
        uint64_t v59 = v56[7];
        uint64_t v57 = v56[8];
        uint64_t v60 = v56[9];
      }

      else
      {
        uint64_t v57 = -1LL;
        uint64_t v58 = -1LL;
        uint64_t v59 = -1LL;
        uint64_t v60 = -1LL;
      }

      *(_DWORD *)uint64_t v64 = 136317442;
      *(void *)&v64[4] = out;
      *(_WORD *)&v64[12] = 1024;
      *(_DWORD *)&v64[14] = v24;
      *(_WORD *)&v64[18] = 2048;
      *(void *)&v64[20] = v27;
      *(_WORD *)&v64[28] = 2048;
      *(void *)&v64[30] = v28;
      *(_WORD *)&v64[38] = 2048;
      uint64_t v65 = v26;
      __int16 v66 = 2048;
      uint64_t v67 = v29;
      __int16 v68 = 2048;
      uint64_t v69 = v58;
      __int16 v70 = 2048;
      uint64_t v71 = v59;
      __int16 v72 = 2048;
      uint64_t v73 = v57;
      __int16 v74 = 2048;
      uint64_t v75 = v60;
      uint64_t v61 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]detected datagr"
            "am connection, frame fragmentation disabled";
      uint64_t v62 = v22;
      uint32_t v63 = 98;
LABEL_62:
      _os_log_debug_impl(&dword_187528000, v62, OS_LOG_TYPE_DEBUG, v61, v64, v63);
    }
  }

  else if (v23)
  {
    uint64_t v53 = *(void *)(v3 + 80);
    if (v53) {
      LODWORD(v53) = nw_parameters_get_ip_protocol();
    }
    uint64_t v54 = *(unsigned int *)(v3 + 176);
    else {
      uint64_t v55 = (&off_18A06EDE8)[v54];
    }
    *(_DWORD *)uint64_t v64 = 136315650;
    *(void *)&v64[4] = out;
    *(_WORD *)&v64[12] = 1024;
    *(_DWORD *)&v64[14] = v53;
    *(_WORD *)&v64[18] = 2080;
    *(void *)&v64[20] = v55;
    uint64_t v61 = "[filter %s %d %s] detected datagram connection, frame fragmentation disabled";
    uint64_t v62 = v22;
    uint32_t v63 = 28;
    goto LABEL_62;
  }

  *(_DWORD *)(v3 + 120) |= 0x8000u;
LABEL_33:
  nw_release(*(void **)(v3 + 64));
  int v30 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 128LL))(a2);
  *(void *)(v3 + 64) = nw_retain(v30);
  nw_release(*(void **)(v3 + 72));
  __int16 v31 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 136LL))(a2);
  *(void *)(v3 + 72) = nw_retain(v31);
  nw_release(*(void **)(v3 + 80));
  uint64_t v32 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 112LL))(a2);
  *(void *)(v3 + 80) = nw_retain(v32);
  atomic_store(0LL, (unint64_t *)(v3 + 104));
  atomic_store(0LL, (unint64_t *)(v3 + 112));
  *(_DWORD *)(v3 + 120) &= 0xFFFFC003;
  ne_filter_unregister_flow(*(void *)(v3 + 96), a1);
  MEMORY[0x1895A8744](v3);
  ne_filter_register_flow(*(void *)(v3 + 96), a1);
  uint64_t v39 = *(void *)(a1 + 32);
  if (v39
    && (uint64_t v40 = *(void *)(v39 + 24)) != 0
    && (__int16 v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(v40 + 256)) != 0LL)
  {
    return v41( v39,  a1,  v33,  v34,  v35,  v36,  v37,  v38,  *(void *)v64,  *(void *)&v64[8],  *(void *)&v64[16],  *(void *)&v64[24],  *(void *)&v64[32]);
  }

  else
  {
    return 1LL;
  }

void ne_filter_protocol_create()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  __memptr = 0LL;
  if (posix_memalign(&__memptr, 8uLL, 0xD8uLL))
  {
    int v0 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v8 = 216LL;
      _os_log_fault_impl(&dword_187528000, v0, OS_LOG_TYPE_FAULT, "posix_memalign(%zu) failed", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v1 = __memptr;
    *(_OWORD *)__memptr = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    void v1[5] = 0u;
    v1[6] = 0u;
    v1[7] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[8] = 0u;
    *((void *)v1 + 26) = 0LL;
    *((void *)v1 + 2) = &g_filter_protocol_identifier;
    *((void *)v1 + 3) = &g_filter_protocol_callbacks;
    *((void *)v1 + 5) = v1;
    nw_frame_array_init();
    uint64_t v2 = (char *)__memptr;
    *((void *)__memptr + 18) = 0LL;
    v2 += 144;
    *((void *)v2 + 1) = v2;
    uint64_t v3 = (unsigned int *)(v2 + 36);
    do
      unsigned int v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    int v5 = (unint64_t *)__memptr;
    atomic_store(0LL, (unint64_t *)__memptr + 13);
    atomic_store(0LL, v5 + 14);
  }

void ne_filter_data_protocol_send_finished(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    int v7 = (unsigned int *)(v3 + 180);
    do
      unsigned int v8 = __ldaxr(v7);
    while (__stlxr(v8, v7));
    if (v8)
    {
      if (a3 == 9)
      {
        __int16 v11 = *(_WORD *)(a2 + 144);
        *(_WORD *)(a2 + 144) = v11 | 0x10;
        if ((v11 & 0x10) != 0) {
          return;
        }
      }

      else if (a3 == 10)
      {
        __int16 v9 = *(_WORD *)(a2 + 144);
        *(_WORD *)(a2 + 144) = v9 | 0x20;
        if ((v9 & 0x20) != 0) {
          return;
        }
      }

      xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v12, "command", a3);
      xpc_dictionary_set_uuid(v12, "flow-uuid", (const unsigned __int8 *)v3);
      if (a3 == 11)
      {
        uint64_t v13 = atomic_load((unint64_t *)(v3 + 104));
        xpc_dictionary_set_uint64(v12, "byte-count-inbound", v13);
        uint64_t v14 = atomic_load((unint64_t *)(v3 + 112));
        xpc_dictionary_set_uint64(v12, "byte-count-outbound", v14);
      }

      if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v3, (uint64_t)length_4, &length, a3 == 11))
      {
        xpc_dictionary_set_data(v12, "crypto-signature", length_4, length);
      }

      else
      {
        uint64_t v15 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( &dword_187528000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to generate signature for finished message",  buf,  2u);
        }
      }

      if (a3 == 11)
      {
        uint64_t v16 = *(os_unfair_lock_s **)(v3 + 96);
        unsigned int v17 = *(_DWORD *)(a2 + 4);
        uint64_t v18 = v12;
        uint64_t v19 = 0LL;
      }

      else
      {
        do
          unsigned int v20 = __ldaxr(v7);
        while (__stlxr(v20 + 1, v7));
        uint64_t v16 = *(os_unfair_lock_s **)(v3 + 96);
        unsigned int v17 = *(_DWORD *)(a2 + 4);
        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 0x40000000LL;
        v21[2] = __ne_filter_data_protocol_send_finished_block_invoke;
        v21[3] = &__block_descriptor_tmp_41;
        v21[4] = v3;
        void v21[5] = a1;
        unsigned int v22 = a3;
        v21[6] = a2;
        uint64_t v19 = v21;
        uint64_t v18 = v12;
      }

      ne_filter_send_message(v16, v17, v18, v19);
      xpc_release(v12);
    }
  }

  else
  {
    uint64_t v10 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)length_4 = 0;
      _os_log_impl(&dword_187528000, v10, OS_LOG_TYPE_INFO, "filter is null", length_4, 2u);
    }
  }

uint64_t ne_filter_destroy_frames(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 144); i; uint64_t i = *(void *)(i + 152))
  {
    nw_frame_array_foreach();
    nw_frame_array_foreach();
  }

  return nw_frame_array_foreach();
}

uint64_t __ne_filter_destroy_frames_block_invoke()
{
  return 1LL;
}

uint64_t __ne_filter_destroy_frames_block_invoke_2()
{
  return 1LL;
}

uint64_t __ne_filter_destroy_frames_block_invoke_3()
{
  return 1LL;
}

BOOL ne_filter_generate_crypto_signature(unsigned int a1, uint64_t a2, uint64_t a3, _DWORD *a4, int a5)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  unint64_t v38 = 0LL;
  __int128 v37 = 0u;
  *(_OWORD *)uuid_t dst = 0u;
  memset(v36, 0, sizeof(v36));
  if (!a4) {
    return 0LL;
  }
  uuid_copy(dst, (const unsigned __int8 *)a2);
  DWORD2(v36[0]) = nw_parameters_get_server_mode() ^ 1;
  uint64_t v10 = *(nw_endpoint **)(a2 + 64);
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 64));
  if (!address) {
    goto LABEL_10;
  }
  int sa_family = address->sa_family;
  if (sa_family == 30)
  {
    sockaddr v13 = *address;
    *(sockaddr *)((char *)&v36[3] + 4) = *(sockaddr *)&address->sa_data[10];
    goto LABEL_9;
  }

  if (sa_family == 2)
  {
    sockaddr v13 = *address;
LABEL_9:
    *(sockaddr *)((char *)&v36[2] + 8) = v13;
  }

LABEL_31:
  BOOL v31 = ne_filter_sign_data(v27, a1, (uint64_t)dst, (uint64_t)effective_bundle_id, v28, (uint64_t)v26, v29, 0LL, 0, a3, a4);
LABEL_32:
  if (!v31)
  {
    uint64_t v33 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)__int128 buf = 0;
    _os_log_error_impl(&dword_187528000, v33, OS_LOG_TYPE_ERROR, "Failed to sign flow message", buf, 2u);
    return 0LL;
  }

  BOOL result = 1LL;
  if (*(void *)(a2 + 64)) {
    *(_DWORD *)(a2 + 124) = 1;
  }
  return result;
}

uint64_t __ne_filter_data_protocol_send_finished_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 176LL);
  int v5 = (os_log_s *)ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      int v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        int v7 = *(void **)(a1 + 32);
      }

      __int16 v9 = (void *)v7[20];
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }

      else
      {
        uint64_t v10 = -1LL;
        uint64_t v11 = -1LL;
        uint64_t v12 = -1LL;
        uint64_t v13 = -1LL;
      }

      sockaddr v19 = (void *)v7[21];
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }

      else
      {
        uint64_t v20 = -1LL;
        uint64_t v21 = -1LL;
        uint64_t v22 = -1LL;
        uint64_t v23 = -1LL;
      }

      *(_DWORD *)__int128 buf = 136317442;
      int v28 = out;
      __int16 v29 = 1024;
      int v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      uint64_t v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]received send-finish reply";
      BOOL v25 = v5;
      uint32_t v26 = 98;
LABEL_20:
      _os_log_debug_impl(&dword_187528000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
  }

  else if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      uint64_t v15 = *(void *)(a1 + 32);
    }

    uint64_t v17 = *(unsigned int *)(v15 + 176);
    else {
      int v18 = (&off_18A06EDE8)[v17];
    }
    *(_DWORD *)__int128 buf = 136315650;
    int v28 = out;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 2080;
    uint64_t v32 = (uint64_t)v18;
    uint64_t v24 = "[filter %s %d %s] received send-finish reply";
    BOOL v25 = v5;
    uint32_t v26 = 28;
    goto LABEL_20;
  }

  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_finished_block_invoke_39(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  if (MEMORY[0x1895A89D8]() == MEMORY[0x1895F9268])
  {
    BOOL v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x1895F91B0]);
    int v16 = 136315138;
    uint64_t v17 = string;
    uint64_t v3 = "Got an error on the XPC connection when sending a finished message: %s";
    int v4 = v6;
    uint32_t v5 = 12;
    goto LABEL_9;
  }

  if (!*(void *)(a1 + 32) || MEMORY[0x1895A89D8]() != MEMORY[0x1895F9250])
  {
LABEL_5:
    uint64_t v2 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v16) = 0;
    uint64_t v3 = "Got an invalid finished message reply";
    int v4 = v2;
    uint32_t v5 = 2;
LABEL_9:
    _os_log_error_impl(&dword_187528000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v16, v5);
    goto LABEL_11;
  }

  ne_filter_process_verdict( *(void *)(a1 + 40),  *(unsigned int *)(a1 + 56),  *(void *)(a1 + 32),  **(unsigned int **)(a1 + 48));
LABEL_11:
  xpc_release(*(xpc_object_t *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v16) = 0;
    uint64_t v15 = "protocol is null";
LABEL_23:
    _os_log_impl(&dword_187528000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v16, 2u);
    return;
  }

  uint64_t v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v16) = 0;
    uint64_t v15 = "filter is null";
    goto LABEL_23;
  }

  uint64_t v10 = (unsigned int *)(v9 + 180);
  do
    unsigned int v11 = __ldaxr(v10);
  while (__stlxr(v11, v10));
  if (v11)
  {
    do
    {
      unsigned int v12 = __ldaxr(v10);
      unsigned int v13 = v12 - 1;
    }

    while (__stlxr(v13, v10));
    if (!v13) {
      ne_filter_protocol_destroy(*(void *)(a1 + 40));
    }
  }

void ne_filter_process_verdict(void *a1, int a2, void *a3, int a4)
{
  uint64_t v167 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    unsigned int v12 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v144) = 0;
    unsigned int v13 = "protocol is null";
LABEL_14:
    _os_log_impl(&dword_187528000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v144, 2u);
    return;
  }

  uint64_t v5 = a1[5];
  if (!v5)
  {
    unsigned int v12 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v144) = 0;
    unsigned int v13 = "filter is null";
    goto LABEL_14;
  }

  uint64_t v9 = (unsigned int *)(v5 + 180);
  do
    unsigned int v10 = __ldaxr(v9);
  while (__stlxr(v10, v9));
  if (v10)
  {
    if (!a3 || MEMORY[0x1895A89D8](a3) != MEMORY[0x1895F9250])
    {
      unsigned int v11 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v144 = 136315138;
        uint64_t v145 = "";
        _os_log_error_impl( &dword_187528000,  v11,  OS_LOG_TYPE_ERROR,  "Received invalid reply from %s, dropping",  (uint8_t *)&v144,  0xCu);
      }

      return;
    }

    int int64 = xpc_dictionary_get_int64(a3, "verdict-value");
    if (!int64)
    {
      int64_t v15 = xpc_dictionary_get_int64(a3, "error");
      int v16 = (char *)v15;
      if (v15 != 6 && v15)
      {
        sockaddr v19 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v144 = 134218242;
          uint64_t v145 = v16;
          __int16 v146 = 2080;
          *(void *)uint64_t v147 = "";
          _os_log_error_impl( &dword_187528000,  v19,  OS_LOG_TYPE_ERROR,  "Received error %llu from %s",  (uint8_t *)&v144,  0x16u);
        }

        int int64 = 2;
      }

      else
      {
        uint64_t v17 = (os_log_s *)ne_log_obj();
        int int64 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (int64)
        {
          uint64_t v18 = "system-internal";
          int v144 = 136315394;
          uint64_t v145 = (char *)v18;
          __int16 v146 = 2080;
          *(void *)uint64_t v147 = "";
          _os_log_error_impl( &dword_187528000,  v17,  OS_LOG_TYPE_ERROR,  "Received error %s from %s",  (uint8_t *)&v144,  0x16u);
          int int64 = 0;
        }
      }
    }

    uint64_t v20 = *(void *)(v5 + 144);
    if (v20)
    {
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
      char v24 = 0;
      LOBYTE(v25) = 1;
      LOBYTE(v26) = 1;
      do
      {
        if (*(_DWORD *)v20 == a4)
        {
          if (!int64)
          {
            if (*(_DWORD *)(v20 + 40) == 3) {

            }
              int int64 = 1;
            else {
              int int64 = 2;
            }
          }

          *(_DWORD *)(v20 + 40) = int64;
          unsigned int v27 = int64;
          uint64_t v21 = v20;
        }

        else
        {
          unsigned int v27 = *(_DWORD *)(v20 + 40);
        }

        int v26 = (v27 != 0) & v26;
        int v25 = (v27 == 1) & v25;
        if (v22) {
          BOOL v28 = 0;
        }
        else {
          BOOL v28 = v27 == 3;
        }
        if (v28) {
          uint64_t v22 = v20;
        }
        if (v27 == 3) {
          uint64_t v23 = v20;
        }
        BOOL v29 = v27 > 3 || v27 == 2;
        v24 |= v29;
        uint64_t v20 = *(void *)(v20 + 152);
      }

      while (v20);
      if (v21)
      {
        if ((v25 & 1) == 0)
        {
          if ((v24 & 1) == 0)
          {
            int v30 = (_DWORD *)(v5 + 176);
            if (v26)
            {
              *int v30 = 3;
LABEL_56:
              *(void *)(v5 + 160) = v22;
              uint64_t v32 = (void *)(v5 + 160);
              int v30 = (_DWORD *)(v5 + 176);
              *(void *)(v5 + 168) = v23;
              __int16 v33 = (void *)(v5 + 168);
              goto LABEL_57;
            }

            *(void *)(v5 + 160) = v22;
            uint64_t v32 = (void *)(v5 + 160);
            int v66 = *(_DWORD *)(v5 + 176);
            *(void *)(v5 + 168) = v23;
            __int16 v33 = (void *)(v5 + 168);
            if (v66 != 2)
            {
LABEL_57:
              *(void *)(v21 + 48) = xpc_dictionary_get_uint64(a3, "input-pass-offset");
              *(void *)(v21 + 56) = xpc_dictionary_get_uint64(a3, "input-peek-offset");
              *(void *)(v21 + 64) = xpc_dictionary_get_uint64(a3, "output-pass-offset");
              *(void *)(v21 + 72) = xpc_dictionary_get_uint64(a3, "output-peek-offset");
              uuid_unparse((const unsigned __int8 *)v5, out);
              int v34 = *(_DWORD *)(v5 + 176);
              __int16 v35 = (os_log_s *)ne_log_obj();
              BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
              if (v34 == 3)
              {
                if (!v36) {
                  goto LABEL_64;
                }
                uint64_t v37 = *(void *)(v5 + 80);
                if (v37) {
                  LODWORD(v37) = nw_parameters_get_ip_protocol();
                }
                uint64_t v38 = (void *)*v32;
                if (*v32)
                {
                  uint64_t v40 = v38[6];
                  uint64_t v41 = v38[7];
                  uint64_t v39 = v38[8];
                  uint64_t v42 = v38[9];
                }

                else
                {
                  uint64_t v39 = -1LL;
                  uint64_t v40 = -1LL;
                  uint64_t v41 = -1LL;
                  uint64_t v42 = -1LL;
                }

                int v94 = (void *)*v33;
                if (*v33)
                {
                  uint64_t v96 = v94[6];
                  uint64_t v97 = v94[7];
                  uint64_t v95 = v94[8];
                  uint64_t v98 = v94[9];
                }

                else
                {
                  uint64_t v95 = -1LL;
                  uint64_t v96 = -1LL;
                  uint64_t v97 = -1LL;
                  uint64_t v98 = -1LL;
                }

                uint64_t v112 = *(unsigned int *)(v21 + 40);
                else {
                  CFDataRef v113 = (&off_18A06EDE8)[v112];
                }
                int v144 = 136317954;
                uint64_t v145 = out;
                __int16 v146 = 1024;
                *(_DWORD *)uint64_t v147 = v37;
                *(_WORD *)&v147[4] = 2048;
                *(void *)&v147[6] = v40;
                __int16 v148 = 2048;
                v149 = (const char *)v41;
                __int16 v150 = 2048;
                uint64_t v151 = v39;
                __int16 v152 = 2048;
                uint64_t v153 = v42;
                __int16 v154 = 2048;
                uint64_t v155 = v96;
                __int16 v156 = 2048;
                uint64_t v157 = v97;
                __int16 v158 = 2048;
                uint64_t v159 = v95;
                __int16 v160 = 2048;
                uint64_t v161 = v98;
                __int16 v162 = 2080;
                uint64_t v163 = "";
                __int16 v164 = 2080;
                uint64_t v165 = v113;
                uint32_t v114 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]new "
                       "verdict from %s: %s";
                uint64_t v115 = v35;
                uint32_t v116 = 118;
              }

              else
              {
                if (!v36) {
                  goto LABEL_64;
                }
                uint64_t v85 = *(void *)(v5 + 80);
                if (v85) {
                  LODWORD(v85) = nw_parameters_get_ip_protocol();
                }
                uint64_t v86 = *v30;
                else {
                  uint64_t v87 = (&off_18A06EDE8)[v86];
                }
                uint64_t v107 = *(unsigned int *)(v21 + 40);
                else {
                  uint64_t v108 = (&off_18A06EDE8)[v107];
                }
                int v144 = 136316162;
                uint64_t v145 = out;
                __int16 v146 = 1024;
                *(_DWORD *)uint64_t v147 = v85;
                *(_WORD *)&v147[4] = 2080;
                *(void *)&v147[6] = v87;
                __int16 v148 = 2080;
                v149 = "";
                __int16 v150 = 2080;
                uint64_t v151 = (uint64_t)v108;
                uint32_t v114 = "[filter %s %d %s] new verdict from %s: %s";
                uint64_t v115 = v35;
                uint32_t v116 = 48;
              }

              _os_log_debug_impl(&dword_187528000, v115, OS_LOG_TYPE_DEBUG, v114, (uint8_t *)&v144, v116);
LABEL_64:
              if ((a2 & 0xFFFFFFFD) == 9) {
                *(_WORD *)(v21 + 144) = *(_WORD *)(v21 + 144) & 0xFFAF | 0x40;
              }
              if ((a2 & 0xFFFFFFFE) == 0xA) {
                *(_WORD *)(v21 + 144) = *(_WORD *)(v21 + 144) & 0xFF5F | 0x80;
              }
              uint int64 = xpc_dictionary_get_uint64(a3, "stats-report-frequency");
              ne_filter_stats_toggle((uint64_t)a1, v21, uint64);
              if ((*(_WORD *)(v21 + 144) & 2) == 0)
              {
                if ((*v30 | 2) != 3) {
                  goto LABEL_129;
                }
                ne_filter_send_approved_frames(v5, 0LL);
                __int16 v44 = *(_WORD *)(v21 + 144);
                if ((v44 & 4) != 0)
                {
                  if (*(_DWORD *)(v21 + 40) == 3 && (v44 & 0x40) == 0 && *(void *)(v21 + 64) != -1LL)
                  {
LABEL_86:
                    int v54 = *(_DWORD *)(v5 + 120);
                    if ((v54 & 0x100) != 0)
                    {
                      if ((v54 & 0x400) != 0) {
                        goto LABEL_93;
                      }
                    }

                    else if ((*(_DWORD *)(v5 + 120) & 0x430) != 0x10)
                    {
                      goto LABEL_93;
                    }

                    if ((nw_frame_array_is_empty() & 1) != 0 || *(void *)(v21 + 104) >= *(void *)(v21 + 64)) {
                      ne_filter_handle_output_finished((uint64_t)a1);
                    }
LABEL_93:
                    ne_filter_read_approved_frames(v5, 0LL);
                    __int16 v55 = *(_WORD *)(v21 + 144);
                    if ((v55 & 8) != 0)
                    {
                      if (*(_DWORD *)(v21 + 40) == 3 && (v55 & 0x80) == 0 && *(void *)(v21 + 48) != -1LL)
                      {
LABEL_100:
                        int v56 = *(_DWORD *)(v5 + 120);
                        if ((v56 & 0x200) != 0)
                        {
                          if ((v56 & 0x800) != 0) {
                            goto LABEL_107;
                          }
                        }

                        else if ((*(_DWORD *)(v5 + 120) & 0x8C0) != 0x40)
                        {
                          goto LABEL_107;
                        }

                        if ((nw_frame_array_is_empty() & 1) != 0 || *(void *)(v21 + 88) >= *(void *)(v21 + 48)) {
                          ne_filter_handle_input_finished((uint64_t)a1, 0LL);
                        }
LABEL_107:
                        if ((*(_BYTE *)(v5 + 120) & 0x10) == 0 && (nw_frame_array_is_empty() & 1) == 0)
                        {
                          uuid_unparse((const unsigned __int8 *)v5, out);
                          int v57 = *(_DWORD *)(v5 + 176);
                          uint64_t v58 = (os_log_s *)ne_log_obj();
                          BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);
                          if (v57 == 3)
                          {
                            if (v59)
                            {
                              uint64_t v60 = *(void *)(v5 + 80);
                              if (v60) {
                                LODWORD(v60) = nw_parameters_get_ip_protocol();
                              }
                              uint64_t v61 = (void *)*v32;
                              if (*v32)
                              {
                                uint64_t v63 = v61[6];
                                uint64_t v64 = v61[7];
                                uint64_t v62 = v61[8];
                                uint64_t v65 = v61[9];
                              }

                              else
                              {
                                uint64_t v62 = -1LL;
                                uint64_t v63 = -1LL;
                                uint64_t v64 = -1LL;
                                uint64_t v65 = -1LL;
                              }

                              uint64_t v136 = (void *)*v33;
                              if (*v33)
                              {
                                uint64_t v138 = v136[6];
                                uint64_t v139 = v136[7];
                                uint64_t v137 = v136[8];
                                uint64_t v140 = v136[9];
                              }

                              else
                              {
                                uint64_t v137 = -1LL;
                                uint64_t v138 = -1LL;
                                uint64_t v139 = -1LL;
                                uint64_t v140 = -1LL;
                              }

                              int v144 = 136317442;
                              uint64_t v145 = out;
                              __int16 v146 = 1024;
                              *(_DWORD *)uint64_t v147 = v60;
                              *(_WORD *)&v147[4] = 2048;
                              *(void *)&v147[6] = v63;
                              __int16 v148 = 2048;
                              v149 = (const char *)v64;
                              __int16 v150 = 2048;
                              uint64_t v151 = v62;
                              __int16 v152 = 2048;
                              uint64_t v153 = v65;
                              __int16 v154 = 2048;
                              uint64_t v155 = v138;
                              __int16 v156 = 2048;
                              uint64_t v157 = v139;
                              __int16 v158 = 2048;
                              uint64_t v159 = v137;
                              __int16 v160 = 2048;
                              uint64_t v161 = v140;
                              uint64_t v141 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %"
                                     "lld/%lld)]sending input available";
                              uint64_t v142 = v58;
                              uint32_t v143 = 98;
LABEL_202:
                              _os_log_debug_impl( &dword_187528000,  v142,  OS_LOG_TYPE_DEBUG,  v141,  (uint8_t *)&v144,  v143);
                            }
                          }

                          else if (v59)
                          {
                            uint64_t v133 = *(void *)(v5 + 80);
                            if (v133) {
                              LODWORD(v133) = nw_parameters_get_ip_protocol();
                            }
                            uint64_t v134 = *v30;
                            else {
                              uint64_t v135 = (&off_18A06EDE8)[v134];
                            }
                            int v144 = 136315650;
                            uint64_t v145 = out;
                            __int16 v146 = 1024;
                            *(_DWORD *)uint64_t v147 = v133;
                            *(_WORD *)&v147[4] = 2080;
                            *(void *)&v147[6] = v135;
                            uint64_t v141 = "[filter %s %d %s] sending input available";
                            uint64_t v142 = v58;
                            uint32_t v143 = 28;
                            goto LABEL_202;
                          }

                          ne_filter_protocol_input_available(v5);
                        }

LABEL_129:
                        uuid_unparse((const unsigned __int8 *)v5, out);
                        int v76 = *(_DWORD *)(v5 + 176);
                        uint64_t v77 = (os_log_s *)ne_log_obj();
                        BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG);
                        if (v76 == 3)
                        {
                          if (v78)
                          {
                            uint64_t v79 = *(void *)(v5 + 80);
                            if (v79) {
                              LODWORD(v79) = nw_parameters_get_ip_protocol();
                            }
                            __int16 v80 = (void *)*v32;
                            if (*v32)
                            {
                              uint64_t v82 = v80[6];
                              uint64_t v83 = v80[7];
                              uint64_t v81 = v80[8];
                              uint64_t v84 = v80[9];
                            }

                            else
                            {
                              uint64_t v81 = -1LL;
                              uint64_t v82 = -1LL;
                              uint64_t v83 = -1LL;
                              uint64_t v84 = -1LL;
                            }

                            uint64_t v102 = (void *)*v33;
                            if (*v33)
                            {
                              uint64_t v104 = v102[6];
                              uint64_t v105 = v102[7];
                              uint64_t v103 = v102[8];
                              uint64_t v106 = v102[9];
                            }

                            else
                            {
                              uint64_t v103 = -1LL;
                              uint64_t v104 = -1LL;
                              uint64_t v105 = -1LL;
                              uint64_t v106 = -1LL;
                            }

                            int v144 = 136317442;
                            uint64_t v145 = out;
                            __int16 v146 = 1024;
                            *(_DWORD *)uint64_t v147 = v79;
                            *(_WORD *)&v147[4] = 2048;
                            *(void *)&v147[6] = v82;
                            __int16 v148 = 2048;
                            v149 = (const char *)v83;
                            __int16 v150 = 2048;
                            uint64_t v151 = v81;
                            __int16 v152 = 2048;
                            uint64_t v153 = v84;
                            __int16 v154 = 2048;
                            uint64_t v155 = v104;
                            __int16 v156 = 2048;
                            uint64_t v157 = v105;
                            __int16 v158 = 2048;
                            uint64_t v159 = v103;
                            __int16 v160 = 2048;
                            uint64_t v161 = v106;
                            CFDataRef v109 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %ll"
                                   "d/%lld)]finished processing new verdict";
                            uint64_t v110 = v77;
                            uint32_t v111 = 98;
LABEL_169:
                            _os_log_debug_impl(&dword_187528000, v110, OS_LOG_TYPE_DEBUG, v109, (uint8_t *)&v144, v111);
                          }
                        }

                        else if (v78)
                        {
                          uint64_t v88 = *(void *)(v5 + 80);
                          if (v88) {
                            LODWORD(v88) = nw_parameters_get_ip_protocol();
                          }
                          uint64_t v89 = *v30;
                          else {
                            __int16 v90 = (&off_18A06EDE8)[v89];
                          }
                          int v144 = 136315650;
                          uint64_t v145 = out;
                          __int16 v146 = 1024;
                          *(_DWORD *)uint64_t v147 = v88;
                          *(_WORD *)&v147[4] = 2080;
                          *(void *)&v147[6] = v90;
                          CFDataRef v109 = "[filter %s %d %s] finished processing new verdict";
                          uint64_t v110 = v77;
                          uint32_t v111 = 28;
                          goto LABEL_169;
                        }

                        ne_filter_cleanup((uint64_t)a1);
                        return;
                      }
                    }

                    else if ((v55 & 0x80) == 0)
                    {
                      goto LABEL_100;
                    }

                    ne_filter_handle_input_finished((uint64_t)a1, 0LL);
                    goto LABEL_100;
                  }
                }

                else if ((v44 & 0x40) == 0)
                {
                  goto LABEL_86;
                }

                ne_filter_handle_output_finished((uint64_t)a1);
                goto LABEL_86;
              }

              uuid_unparse((const unsigned __int8 *)v5, out);
              int v45 = *(_DWORD *)(v5 + 176);
              uint64_t v46 = (os_log_s *)ne_log_obj();
              BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
              if (v45 == 3)
              {
                if (!v47) {
                  goto LABEL_80;
                }
                uint64_t v48 = *(void *)(v5 + 80);
                if (v48) {
                  LODWORD(v48) = nw_parameters_get_ip_protocol();
                }
                uint64_t v49 = (void *)*v32;
                if (*v32)
                {
                  uint64_t v51 = v49[6];
                  uint64_t v52 = v49[7];
                  uint64_t v50 = v49[8];
                  uint64_t v53 = v49[9];
                }

                else
                {
                  uint64_t v50 = -1LL;
                  uint64_t v51 = -1LL;
                  uint64_t v52 = -1LL;
                  uint64_t v53 = -1LL;
                }

                uint32_t v125 = (void *)*v33;
                if (*v33)
                {
                  uint64_t v127 = v125[6];
                  uint64_t v128 = v125[7];
                  uint64_t v126 = v125[8];
                  uint64_t v129 = v125[9];
                }

                else
                {
                  uint64_t v126 = -1LL;
                  uint64_t v127 = -1LL;
                  uint64_t v128 = -1LL;
                  uint64_t v129 = -1LL;
                }

                int v144 = 136317698;
                uint64_t v145 = out;
                __int16 v146 = 1024;
                *(_DWORD *)uint64_t v147 = v48;
                *(_WORD *)&v147[4] = 2048;
                *(void *)&v147[6] = v51;
                __int16 v148 = 2048;
                v149 = (const char *)v52;
                __int16 v150 = 2048;
                uint64_t v151 = v50;
                __int16 v152 = 2048;
                uint64_t v153 = v53;
                __int16 v154 = 2048;
                uint64_t v155 = v127;
                __int16 v156 = 2048;
                uint64_t v157 = v128;
                __int16 v158 = 2048;
                uint64_t v159 = v126;
                __int16 v160 = 2048;
                uint64_t v161 = v129;
                __int16 v162 = 2080;
                uint64_t v163 = "";
                uint64_t v130 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]rece"
                       "ived initial verdict from %s";
                uint64_t v131 = v46;
                uint32_t v132 = 108;
              }

              else
              {
                if (!v47) {
                  goto LABEL_80;
                }
                uint64_t v99 = *(void *)(v5 + 80);
                if (v99) {
                  LODWORD(v99) = nw_parameters_get_ip_protocol();
                }
                uint64_t v100 = *v30;
                else {
                  uint64_t v101 = (&off_18A06EDE8)[v100];
                }
                int v144 = 136315906;
                uint64_t v145 = out;
                __int16 v146 = 1024;
                *(_DWORD *)uint64_t v147 = v99;
                *(_WORD *)&v147[4] = 2080;
                *(void *)&v147[6] = v101;
                __int16 v148 = 2080;
                v149 = "";
                uint64_t v130 = "[filter %s %d %s] received initial verdict from %s";
                uint64_t v131 = v46;
                uint32_t v132 = 38;
              }

              _os_log_debug_impl(&dword_187528000, v131, OS_LOG_TYPE_DEBUG, v130, (uint8_t *)&v144, v132);
LABEL_80:
              *(_WORD *)(v21 + 144) &= ~2u;
              goto LABEL_129;
            }

LABEL_119:
            uuid_unparse((const unsigned __int8 *)v5, out);
            int v67 = *(_DWORD *)(v5 + 176);
            __int16 v68 = (os_log_s *)ne_log_obj();
            BOOL v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG);
            if (v67 == 3)
            {
              if (v69)
              {
                uint64_t v70 = *(void *)(v5 + 80);
                if (v70) {
                  LODWORD(v70) = nw_parameters_get_ip_protocol();
                }
                uint64_t v71 = (void *)*v32;
                if (*v32)
                {
                  uint64_t v73 = v71[6];
                  uint64_t v74 = v71[7];
                  uint64_t v72 = v71[8];
                  uint64_t v75 = v71[9];
                }

                else
                {
                  uint64_t v72 = -1LL;
                  uint64_t v73 = -1LL;
                  uint64_t v74 = -1LL;
                  uint64_t v75 = -1LL;
                }

                int v117 = (void *)*v33;
                if (*v33)
                {
                  uint64_t v119 = v117[6];
                  uint64_t v120 = v117[7];
                  uint64_t v118 = v117[8];
                  uint64_t v121 = v117[9];
                }

                else
                {
                  uint64_t v118 = -1LL;
                  uint64_t v119 = -1LL;
                  uint64_t v120 = -1LL;
                  uint64_t v121 = -1LL;
                }

                int v144 = 136317442;
                uint64_t v145 = out;
                __int16 v146 = 1024;
                *(_DWORD *)uint64_t v147 = v70;
                *(_WORD *)&v147[4] = 2048;
                *(void *)&v147[6] = v73;
                __int16 v148 = 2048;
                v149 = (const char *)v74;
                __int16 v150 = 2048;
                uint64_t v151 = v72;
                __int16 v152 = 2048;
                uint64_t v153 = v75;
                __int16 v154 = 2048;
                uint64_t v155 = v119;
                __int16 v156 = 2048;
                uint64_t v157 = v120;
                __int16 v158 = 2048;
                uint64_t v159 = v118;
                __int16 v160 = 2048;
                uint64_t v161 = v121;
                unint64_t v122 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]over"
                       "all verdict is drop, dropping the flow";
                int v123 = v68;
                uint32_t v124 = 98;
LABEL_182:
                _os_log_debug_impl(&dword_187528000, v123, OS_LOG_TYPE_DEBUG, v122, (uint8_t *)&v144, v124);
              }
            }

            else if (v69)
            {
              uint64_t v91 = *(void *)(v5 + 80);
              if (v91) {
                LODWORD(v91) = nw_parameters_get_ip_protocol();
              }
              uint64_t v92 = *v30;
              else {
                __int16 v93 = (&off_18A06EDE8)[v92];
              }
              int v144 = 136315650;
              uint64_t v145 = out;
              __int16 v146 = 1024;
              *(_DWORD *)uint64_t v147 = v91;
              *(_WORD *)&v147[4] = 2080;
              *(void *)&v147[6] = v93;
              unint64_t v122 = "[filter %s %d %s] overall verdict is drop, dropping the flow";
              int v123 = v68;
              uint32_t v124 = 28;
              goto LABEL_182;
            }

            ne_filter_protocol_drop_flow(a1);
            return;
          }

LABEL_118:
          *(_DWORD *)(v5 + 176) = 2;
          int v30 = (_DWORD *)(v5 + 176);
          *(void *)(v5 + 160) = v22;
          uint64_t v32 = (void *)(v5 + 160);
          *(void *)(v5 + 168) = v23;
          __int16 v33 = (void *)(v5 + 168);
          goto LABEL_119;
        }

        goto LABEL_55;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = 0LL;
      int v25 = 1;
    }

    __int16 v31 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v144 = 136315138;
      uint64_t v145 = "";
      _os_log_error_impl( &dword_187528000,  v31,  OS_LOG_TYPE_ERROR,  "Failed to find the filter client for provider %s",  (uint8_t *)&v144,  0xCu);
      if ((v25 & 1) == 0) {
        goto LABEL_118;
      }
    }

    else if (!v25)
    {
      goto LABEL_118;
    }

    uint64_t v21 = 0LL;
LABEL_55:
    *(_DWORD *)(v5 + 176) = 1;
    goto LABEL_56;
  }

void ne_filter_protocol_destroy(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v3 = *(_DWORD *)(v2 + 176);
  int v4 = (os_log_s *)ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(v2 + 80);
      if (v6) {
        LODWORD(v6) = nw_parameters_get_ip_protocol();
      }
      int v7 = *(void **)(v2 + 160);
      if (v7)
      {
        uint64_t v9 = v7[6];
        uint64_t v10 = v7[7];
        uint64_t v8 = v7[8];
        uint64_t v11 = v7[9];
      }

      else
      {
        uint64_t v8 = -1LL;
        uint64_t v9 = -1LL;
        uint64_t v10 = -1LL;
        uint64_t v11 = -1LL;
      }

      uint64_t v18 = *(void **)(v2 + 168);
      if (v18)
      {
        uint64_t v20 = v18[6];
        uint64_t v21 = v18[7];
        uint64_t v19 = v18[8];
        uint64_t v22 = v18[9];
      }

      else
      {
        uint64_t v19 = -1LL;
        uint64_t v20 = -1LL;
        uint64_t v21 = -1LL;
        uint64_t v22 = -1LL;
      }

      int v26 = 136317442;
      unsigned int v27 = out;
      __int16 v28 = 1024;
      int v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v9;
      __int16 v32 = 2048;
      uint64_t v33 = v10;
      __int16 v34 = 2048;
      uint64_t v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = v20;
      __int16 v40 = 2048;
      uint64_t v41 = v21;
      __int16 v42 = 2048;
      uint64_t v43 = v19;
      __int16 v44 = 2048;
      uint64_t v45 = v22;
      uint64_t v23 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]destroying filter";
      char v24 = v4;
      uint32_t v25 = 98;
LABEL_26:
      _os_log_debug_impl(&dword_187528000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v26, v25);
    }
  }

  else if (v5)
  {
    uint64_t v15 = *(void *)(v2 + 80);
    if (v15) {
      LODWORD(v15) = nw_parameters_get_ip_protocol();
    }
    uint64_t v16 = *(unsigned int *)(v2 + 176);
    else {
      uint64_t v17 = (&off_18A06EDE8)[v16];
    }
    int v26 = 136315650;
    unsigned int v27 = out;
    __int16 v28 = 1024;
    int v29 = v15;
    __int16 v30 = 2080;
    uint64_t v31 = (uint64_t)v17;
    uint64_t v23 = "[filter %s %d %s] destroying filter";
    char v24 = v4;
    uint32_t v25 = 28;
    goto LABEL_26;
  }

  *(void *)(a1 + 40) = 0LL;
  nw_release(*(void **)(v2 + 64));
  nw_release(*(void **)(v2 + 72));
  nw_release(*(void **)(v2 + 80));
  nw_release(*(void **)(v2 + 88));
  *(void *)(v2 + 96) = 0LL;
  *(void *)(v2 + 160) = 0LL;
  *(void *)(v2 + 168) = 0LL;
  while (1)
  {
    unsigned int v12 = *(void **)(v2 + 144);
    if (!v12) {
      break;
    }
    uint64_t v13 = v12[19];
    uint64_t v14 = (void *)v12[20];
    if (v13)
    {
      *(void *)(v13 + 160) = v14;
      uint64_t v14 = (void *)v12[20];
    }

    else
    {
      *(void *)(v2 + 152) = v14;
    }

    void *v14 = v13;
    free(v12);
  }

  ne_filter_stats_toggle(a1, 0LL, 0LL);
  memset_s((void *)v2, 0xD8uLL, 0, 0xD8uLL);
  free((void *)v2);
}

void ne_filter_stats_toggle(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v6 = *(void *)(a2 + 80);
    if (a3)
    {
      if (v6 == a3) {
        return;
      }
    }

    else if (!v6)
    {
      return;
    }
  }

  if (!a1)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v23) = 0;
    uint64_t v15 = "protocol is null";
    goto LABEL_25;
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (!v7)
  {
    uint64_t v14 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v23) = 0;
    uint64_t v15 = "filter is null";
    goto LABEL_25;
  }

  uint64_t v8 = (unsigned int *)(v7 + 180);
  do
    unsigned int v9 = __ldaxr(v8);
  while (__stlxr(v9, v8));
  if (!v9) {
    return;
  }
  uint64_t v10 = *(void *)(v7 + 96);
  if (!v10) {
    return;
  }
  uint64_t v11 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218240;
    uint64_t v24 = a2;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    _os_log_debug_impl( &dword_187528000,  v11,  OS_LOG_TYPE_DEBUG,  "Stats toggle - client %lX frequency %llu",  (uint8_t *)&v23,  0x16u);
    if (a3) {
      goto LABEL_14;
    }
  }

  else if (a3)
  {
LABEL_14:
    if (a2 && *(void *)(a2 + 80) != a3)
    {
      uint64_t v12 = 200LL;
      if (a3 > 0xC8) {
        uint64_t v12 = a3;
      }
      *(void *)(a2 + 80) = v12;
      *(void *)(a2 + 136) = mach_absolute_time();
      if (ne_filter_stats_report_register(v10, a1))
      {
        do
          unsigned int v13 = __ldaxr(v8);
        while (__stlxr(v13 + 1, v8));
      }
    }

    return;
  }

  if (!a2) {
    goto LABEL_47;
  }
  *(void *)(a2 + 80) = 0LL;
  uint64_t v16 = *(void *)(v7 + 144);
  if (!v16) {
    goto LABEL_47;
  }
  char v17 = 0;
  do
  {
    if (*(void *)(v16 + 80)) {
      char v17 = 1;
    }
    uint64_t v16 = *(void *)(v16 + 152);
  }

  while (v16);
  if ((v17 & 1) == 0)
  {
LABEL_47:
    if (ne_filter_stats_report_unregister(v10, a1))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      if (v18)
      {
        uint64_t v19 = (unsigned int *)(v18 + 180);
        do
          unsigned int v20 = __ldaxr(v19);
        while (__stlxr(v20, v19));
        if (v20)
        {
          do
          {
            unsigned int v21 = __ldaxr(v19);
            unsigned int v22 = v21 - 1;
          }

          while (__stlxr(v22, v19));
          if (!v22) {
            ne_filter_protocol_destroy(a1);
          }
        }

        return;
      }

      uint64_t v14 = (os_log_s *)ne_log_obj();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        return;
      }
      LOWORD(v23) = 0;
      uint64_t v15 = "filter is null";
LABEL_25:
      _os_log_impl(&dword_187528000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v23, 2u);
    }
  }

void ne_filter_protocol_drop_flow(void *a1)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    unsigned int v20 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)__int16 v42 = 136315138;
    *(void *)&v42[4] = "ne_filter_protocol_drop_flow";
    unsigned int v21 = "%s called with null protocol";
    goto LABEL_16;
  }

  uint64_t v2 = a1[5];
  if (!v2)
  {
    unsigned int v20 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)__int16 v42 = 136315138;
    *(void *)&v42[4] = "ne_filter_protocol_drop_flow";
    unsigned int v21 = "%s called with null filter";
LABEL_16:
    _os_log_fault_impl(&dword_187528000, v20, OS_LOG_TYPE_FAULT, v21, v42, 0xCu);
    return;
  }

  int v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4) {
    return;
  }
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v5 = *(_DWORD *)(v2 + 176);
  uint64_t v6 = (os_log_s *)ne_log_obj();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v14 = *(void *)(v2 + 80);
    if (v14) {
      LODWORD(v14) = nw_parameters_get_ip_protocol();
    }
    uint64_t v15 = *(void **)(v2 + 160);
    if (v15)
    {
      uint64_t v17 = v15[6];
      uint64_t v18 = v15[7];
      uint64_t v16 = v15[8];
      uint64_t v19 = v15[9];
    }

    else
    {
      uint64_t v16 = -1LL;
      uint64_t v17 = -1LL;
      uint64_t v18 = -1LL;
      uint64_t v19 = -1LL;
    }

    __int16 v34 = *(void **)(v2 + 168);
    if (v34)
    {
      uint64_t v36 = v34[6];
      uint64_t v37 = v34[7];
      uint64_t v35 = v34[8];
      uint64_t v38 = v34[9];
    }

    else
    {
      uint64_t v35 = -1LL;
      uint64_t v36 = -1LL;
      uint64_t v37 = -1LL;
      uint64_t v38 = -1LL;
    }

    *(_DWORD *)__int16 v42 = 136317442;
    *(void *)&v42[4] = out;
    *(_WORD *)&v42[12] = 1024;
    *(_DWORD *)&v42[14] = v14;
    *(_WORD *)&v42[18] = 2048;
    *(void *)&v42[20] = v17;
    *(_WORD *)&v42[28] = 2048;
    *(void *)&v42[30] = v18;
    *(_WORD *)&v42[38] = 2048;
    uint64_t v43 = v16;
    __int16 v44 = 2048;
    uint64_t v45 = v19;
    __int16 v46 = 2048;
    uint64_t v47 = v36;
    __int16 v48 = 2048;
    uint64_t v49 = v37;
    __int16 v50 = 2048;
    uint64_t v51 = v35;
    __int16 v52 = 2048;
    uint64_t v53 = v38;
    uint64_t v39 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]drop flow";
    __int16 v40 = v6;
    uint32_t v41 = 98;
  }

  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v31 = *(void *)(v2 + 80);
    if (v31) {
      LODWORD(v31) = nw_parameters_get_ip_protocol();
    }
    uint64_t v32 = *(unsigned int *)(v2 + 176);
    else {
      uint64_t v33 = (&off_18A06EDE8)[v32];
    }
    *(_DWORD *)__int16 v42 = 136315650;
    *(void *)&v42[4] = out;
    *(_WORD *)&v42[12] = 1024;
    *(_DWORD *)&v42[14] = v31;
    *(_WORD *)&v42[18] = 2080;
    *(void *)&v42[20] = v33;
    uint64_t v39 = "[filter %s %d %s] drop flow";
    __int16 v40 = v6;
    uint32_t v41 = 28;
  }

  _os_log_debug_impl(&dword_187528000, v40, OS_LOG_TYPE_DEBUG, v39, v42, v41);
LABEL_18:
  uint64_t v22 = a1[6];
  if (v22)
  {
    *(_DWORD *)(v2 + 176) = 2;
    for (uint64_t i = *(void *)(v2 + 144); i; uint64_t i = *(void *)(i + 152))
      *(_DWORD *)(i + 40) = 2;
    int v24 = *(_DWORD *)(v2 + 120);
    if ((v24 & 0x80) == 0)
    {
      *(_DWORD *)(v2 + 120) = v24 | 0x80;
      uint64_t v25 = *(void *)(v22 + 24);
      unint64_t v26 = *(void (**)(uint64_t, void *, uint64_t))(v25 + 56);
      if (v26)
      {
        v26(v22, a1, 57LL);
        uint64_t v25 = *(void *)(v22 + 24);
      }

      uint64_t v27 = *(void (**)(uint64_t, void *))(v25 + 48);
      if (v27) {
        v27(v22, a1);
      }
    }

    int v28 = *(_DWORD *)(v2 + 120);
    if ((v28 & 0x20) == 0)
    {
      *(_DWORD *)(v2 + 120) = v28 | 0x20;
      uint64_t v29 = a1[4];
      if (v29)
      {
        __int16 v30 = *(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(*(void *)(v29 + 24) + 32LL);
        if (v30) {
          v30( v29,  a1,  v8,  v9,  v10,  v11,  v12,  v13,  *(void *)v42,  *(void *)&v42[8],  *(void *)&v42[16],  *(void *)&v42[24],  *(void *)&v42[32]);
        }
      }
    }

    ne_filter_cleanup((uint64_t)a1);
  }

uint64_t ne_filter_send_approved_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v143 = *MEMORY[0x1895F89C0];
  uuid_unparse((const unsigned __int8 *)a1, out);
  int v4 = *(_DWORD *)(a1 + 176);
  int v5 = (os_log_s *)ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = *(void *)(a1 + 80);
    if (v7) {
      LODWORD(v7) = nw_parameters_get_ip_protocol();
    }
    uint64_t v8 = *(void **)(a1 + 160);
    if (v8)
    {
      uint64_t v10 = v8[6];
      uint64_t v11 = v8[7];
      uint64_t v9 = v8[8];
      uint64_t v12 = v8[9];
    }

    else
    {
      uint64_t v9 = -1LL;
      uint64_t v10 = -1LL;
      uint64_t v11 = -1LL;
      uint64_t v12 = -1LL;
    }

    uint64_t v61 = *(void **)(a1 + 168);
    if (v61)
    {
      uint64_t v63 = v61[6];
      uint64_t v64 = v61[7];
      uint64_t v62 = v61[8];
      uint64_t v65 = v61[9];
    }

    else
    {
      uint64_t v62 = -1LL;
      uint64_t v63 = -1LL;
      uint64_t v64 = -1LL;
      uint64_t v65 = -1LL;
    }

    *(_DWORD *)__int128 buf = 136317442;
    uint64_t v121 = out;
    __int16 v122 = 1024;
    int v123 = v7;
    __int16 v124 = 2048;
    uint64_t v125 = v10;
    __int16 v126 = 2048;
    uint64_t v127 = v11;
    __int16 v128 = 2048;
    uint64_t v129 = v9;
    __int16 v130 = 2048;
    uint64_t v131 = v12;
    __int16 v132 = 2048;
    uint64_t v133 = v63;
    __int16 v134 = 2048;
    uint64_t v135 = v64;
    __int16 v136 = 2048;
    uint64_t v137 = v62;
    __int16 v138 = 2048;
    uint64_t v139 = v65;
    int v66 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending approved frames";
    int v67 = v5;
    uint32_t v68 = 98;
  }

  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v58 = *(void *)(a1 + 80);
    if (v58) {
      LODWORD(v58) = nw_parameters_get_ip_protocol();
    }
    uint64_t v59 = *(unsigned int *)(a1 + 176);
    else {
      uint64_t v60 = (&off_18A06EDE8)[v59];
    }
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v121 = out;
    __int16 v122 = 1024;
    int v123 = v58;
    __int16 v124 = 2080;
    uint64_t v125 = (uint64_t)v60;
    int v66 = "[filter %s %d %s] sending approved frames";
    int v67 = v5;
    uint32_t v68 = 28;
  }

  _os_log_debug_impl(&dword_187528000, v67, OS_LOG_TYPE_DEBUG, v66, buf, v68);
LABEL_8:
  nw_frame_array_init();
  if (a2) {
    nw_frame_array_append_array();
  }
  uint64_t v13 = *(void *)(a1 + 144);
  if (v13)
  {
    while (1)
    {
      if (*(_DWORD *)(v13 + 40) != 3 || *(void *)(v13 + 64) == -1LL) {
        goto LABEL_23;
      }
      if ((nw_frame_array_is_empty() & 1) == 0) {
        break;
      }
LABEL_20:
      if (ne_filter_data_protocol_send_data(a1, v13, 0) && (*(_WORD *)(v13 + 144) & 4) != 0)
      {
        ne_filter_data_protocol_send_finished(a1, v13, 9u);
        *(_WORD *)(v13 + 144) &= ~4u;
      }

LABEL_66:
  uint64_t result = nw_frame_array_is_empty();
  if ((result & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 120) & 0x40) == 0)
    {
      uint64_t v50 = *(void *)(a1 + 32);
      if (v50)
      {
        if (*(void *)(*(void *)(v50 + 24) + 96LL))
        {
          uuid_unparse((const unsigned __int8 *)a1, out);
          int v51 = *(_DWORD *)(a1 + 176);
          __int16 v52 = (os_log_s *)ne_log_obj();
          BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
          if (v51 == 3)
          {
            if (v53)
            {
              if (*(void *)(a1 + 80)) {
                int v118 = nw_parameters_get_ip_protocol();
              }
              else {
                int v118 = 0;
              }
              uint64_t v88 = *(void **)(a1 + 160);
              if (v88)
              {
                uint64_t v90 = v88[6];
                uint64_t v91 = v88[7];
                uint64_t v89 = v88[8];
                uint64_t v92 = v88[9];
              }

              else
              {
                uint64_t v89 = -1LL;
                uint64_t v90 = -1LL;
                uint64_t v91 = -1LL;
                uint64_t v92 = -1LL;
              }

              uint64_t v95 = *(void **)(a1 + 168);
              if (v95)
              {
                uint64_t v97 = v95[6];
                uint64_t v98 = v95[7];
                uint64_t v96 = v95[8];
                uint64_t v99 = v95[9];
              }

              else
              {
                uint64_t v96 = -1LL;
                uint64_t v97 = -1LL;
                uint64_t v98 = -1LL;
                uint64_t v99 = -1LL;
              }

              int v104 = nw_frame_array_unclaimed_length();
              *(_DWORD *)__int128 buf = 136317698;
              uint64_t v121 = out;
              __int16 v122 = 1024;
              int v123 = v118;
              __int16 v124 = 2048;
              uint64_t v125 = v90;
              __int16 v126 = 2048;
              uint64_t v127 = v91;
              __int16 v128 = 2048;
              uint64_t v129 = v89;
              __int16 v130 = 2048;
              uint64_t v131 = v92;
              __int16 v132 = 2048;
              uint64_t v133 = v97;
              __int16 v134 = 2048;
              uint64_t v135 = v98;
              __int16 v136 = 2048;
              uint64_t v137 = v96;
              __int16 v138 = 2048;
              uint64_t v139 = v99;
              __int16 v140 = 1024;
              int v141 = v104;
              uint64_t v101 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sendin"
                     "g %u bytes to the network";
              uint64_t v102 = v52;
              uint32_t v103 = 104;
LABEL_126:
              _os_log_debug_impl(&dword_187528000, v102, OS_LOG_TYPE_DEBUG, v101, buf, v103);
            }
          }

          else if (v53)
          {
            if (*(void *)(a1 + 80)) {
              int v87 = nw_parameters_get_ip_protocol();
            }
            else {
              int v87 = 0;
            }
            uint64_t v93 = *(unsigned int *)(a1 + 176);
            else {
              int v94 = (&off_18A06EDE8)[v93];
            }
            int v100 = nw_frame_array_unclaimed_length();
            *(_DWORD *)__int128 buf = 136315906;
            uint64_t v121 = out;
            __int16 v122 = 1024;
            int v123 = v87;
            __int16 v124 = 2080;
            uint64_t v125 = (uint64_t)v94;
            __int16 v126 = 1024;
            LODWORD(v127) = v100;
            uint64_t v101 = "[filter %s %d %s] sending %u bytes to the network";
            uint64_t v102 = v52;
            uint32_t v103 = 34;
            goto LABEL_126;
          }

          return (*(uint64_t (**)(uint64_t, _BYTE *))(*(void *)(v50 + 24) + 96LL))(v50, v119);
        }
      }
    }

    uuid_unparse((const unsigned __int8 *)a1, out);
    int v54 = *(_DWORD *)(a1 + 176);
    uint64_t v55 = (os_log_s *)ne_log_obj();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
    if (v54 == 3)
    {
      if (v56)
      {
        if (*(void *)(a1 + 80)) {
          int v57 = nw_parameters_get_ip_protocol();
        }
        else {
          int v57 = 0;
        }
        uint64_t v70 = *(void **)(a1 + 160);
        if (v70)
        {
          uint64_t v72 = v70[6];
          uint64_t v73 = v70[7];
          uint64_t v71 = v70[8];
          uint64_t v74 = v70[9];
        }

        else
        {
          uint64_t v71 = -1LL;
          uint64_t v72 = -1LL;
          uint64_t v73 = -1LL;
          uint64_t v74 = -1LL;
        }

        uint64_t v77 = *(void **)(a1 + 168);
        if (v77)
        {
          uint64_t v79 = v77[6];
          uint64_t v80 = v77[7];
          uint64_t v78 = v77[8];
          uint64_t v81 = v77[9];
        }

        else
        {
          uint64_t v78 = -1LL;
          uint64_t v79 = -1LL;
          uint64_t v80 = -1LL;
          uint64_t v81 = -1LL;
        }

        int v86 = nw_frame_array_unclaimed_length();
        *(_DWORD *)__int128 buf = 136317698;
        uint64_t v121 = out;
        __int16 v122 = 1024;
        int v123 = v57;
        __int16 v124 = 2048;
        uint64_t v125 = v72;
        __int16 v126 = 2048;
        uint64_t v127 = v73;
        __int16 v128 = 2048;
        uint64_t v129 = v71;
        __int16 v130 = 2048;
        uint64_t v131 = v74;
        __int16 v132 = 2048;
        uint64_t v133 = v79;
        __int16 v134 = 2048;
        uint64_t v135 = v80;
        __int16 v136 = 2048;
        uint64_t v137 = v78;
        __int16 v138 = 2048;
        uint64_t v139 = v81;
        __int16 v140 = 1024;
        int v141 = v86;
        uint64_t v83 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output protoc"
              "ol is disconnected or does not exist, dropping %u outbound bytes";
        uint64_t v84 = v55;
        uint32_t v85 = 104;
LABEL_110:
        _os_log_debug_impl(&dword_187528000, v84, OS_LOG_TYPE_DEBUG, v83, buf, v85);
      }
    }

    else if (v56)
    {
      if (*(void *)(a1 + 80)) {
        int v69 = nw_parameters_get_ip_protocol();
      }
      else {
        int v69 = 0;
      }
      uint64_t v75 = *(unsigned int *)(a1 + 176);
      else {
        int v76 = (&off_18A06EDE8)[v75];
      }
      int v82 = nw_frame_array_unclaimed_length();
      *(_DWORD *)__int128 buf = 136315906;
      uint64_t v121 = out;
      __int16 v122 = 1024;
      int v123 = v69;
      __int16 v124 = 2080;
      uint64_t v125 = (uint64_t)v76;
      __int16 v126 = 1024;
      LODWORD(v127) = v82;
      uint64_t v83 = "[filter %s %d %s] output protocol is disconnected or does not exist, dropping %u outbound bytes";
      uint64_t v84 = v55;
      uint32_t v85 = 34;
      goto LABEL_110;
    }

    return nw_frame_array_foreach();
  }

  return result;
}

void ne_filter_handle_output_finished(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    uint64_t v23 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v58 = 136315138;
      *(void *)&v58[4] = "ne_filter_handle_output_finished";
      _os_log_fault_impl(&dword_187528000, v23, OS_LOG_TYPE_FAULT, "%s called with null filter", v58, 0xCu);
    }

    return;
  }

  int v3 = (unsigned int *)(v1 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4) {
    return;
  }
  int v5 = *(_DWORD *)(v1 + 120);
  if ((v5 & 0x400) != 0 || *(_DWORD *)(v1 + 176) != 3 || (uint64_t v6 = *(void *)(v1 + 144)) == 0)
  {
LABEL_12:
    *(_DWORD *)(v1 + 120) = v5 | 0x400;
    if ((v5 & 0x100) == 0) {
      goto LABEL_25;
    }
    *(_DWORD *)(v1 + 120) = v5 & 0xFFFFFAFF | 0x400;
    uuid_unparse((const unsigned __int8 *)v1, out);
    int v8 = *(_DWORD *)(v1 + 176);
    uint64_t v9 = (os_log_s *)ne_log_obj();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 == 3)
    {
      if (v10)
      {
        uint64_t v17 = *(void *)(v1 + 80);
        if (v17) {
          LODWORD(v17) = nw_parameters_get_ip_protocol();
        }
        uint64_t v18 = *(void **)(v1 + 160);
        if (v18)
        {
          uint64_t v20 = v18[6];
          uint64_t v21 = v18[7];
          uint64_t v19 = v18[8];
          uint64_t v22 = v18[9];
        }

        else
        {
          uint64_t v19 = -1LL;
          uint64_t v20 = -1LL;
          uint64_t v21 = -1LL;
          uint64_t v22 = -1LL;
        }

        uint32_t v42 = *(void **)(v1 + 168);
        if (v42)
        {
          uint64_t v44 = v42[6];
          uint64_t v45 = v42[7];
          uint64_t v43 = v42[8];
          uint64_t v46 = v42[9];
        }

        else
        {
          uint64_t v43 = -1LL;
          uint64_t v44 = -1LL;
          uint64_t v45 = -1LL;
          uint64_t v46 = -1LL;
        }

        *(_DWORD *)uint64_t v58 = 136317442;
        *(void *)&v58[4] = out;
        *(_WORD *)&v58[12] = 1024;
        *(_DWORD *)&v58[14] = v17;
        *(_WORD *)&v58[18] = 2048;
        *(void *)&v58[20] = v20;
        *(_WORD *)&v58[28] = 2048;
        *(void *)&v58[30] = v21;
        *(_WORD *)&v58[38] = 2048;
        uint64_t v59 = v19;
        __int16 v60 = 2048;
        uint64_t v61 = v22;
        __int16 v62 = 2048;
        uint64_t v63 = v44;
        __int16 v64 = 2048;
        uint64_t v65 = v45;
        __int16 v66 = 2048;
        uint64_t v67 = v43;
        __int16 v68 = 2048;
        uint64_t v69 = v46;
        __int16 v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling outpu"
              "t_finished on output protocol";
        BOOL v53 = v9;
        uint32_t v54 = 98;
LABEL_58:
        _os_log_debug_impl(&dword_187528000, v53, OS_LOG_TYPE_DEBUG, v52, v58, v54);
      }
    }

    else if (v10)
    {
      uint64_t v36 = *(void *)(v1 + 80);
      if (v36) {
        LODWORD(v36) = nw_parameters_get_ip_protocol();
      }
      uint64_t v37 = *(unsigned int *)(v1 + 176);
      else {
        uint64_t v38 = (&off_18A06EDE8)[v37];
      }
      *(_DWORD *)uint64_t v58 = 136315650;
      *(void *)&v58[4] = out;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v36;
      *(_WORD *)&v58[18] = 2080;
      *(void *)&v58[20] = v38;
      __int16 v52 = "[filter %s %d %s] calling output_finished on output protocol";
      BOOL v53 = v9;
      uint32_t v54 = 28;
      goto LABEL_58;
    }

    uint64_t v24 = *(void *)(v1 + 32);
    if (v24)
    {
      uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(*(void *)(v24 + 24) + 192LL);
      if (v25) {
        v25( v24,  a1,  v11,  v12,  v13,  v14,  v15,  v16,  *(void *)v58,  *(void *)&v58[8],  *(void *)&v58[16],  *(void *)&v58[24],  *(void *)&v58[32]);
      }
    }

uint64_t ne_filter_read_approved_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  nw_frame_array_init();
  for (uint64_t i = *(void *)(a1 + 144); i; uint64_t i = *(void *)(i + 152))
  {
    if (*(_DWORD *)(i + 40) == 3 && *(void *)(i + 48) != -1LL)
    {
      if ((nw_frame_array_is_empty() & 1) == 0)
      {
        uuid_unparse((const unsigned __int8 *)a1, (char *)out);
        int v5 = *(_DWORD *)(a1 + 176);
        uint64_t v6 = (os_log_s *)ne_log_obj();
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
        if (v5 == 3)
        {
          if (v7)
          {
            if (*(void *)(a1 + 80)) {
              int ip_protocol = nw_parameters_get_ip_protocol();
            }
            else {
              int ip_protocol = 0;
            }
            uint64_t v27 = *(void **)(a1 + 160);
            if (v27)
            {
              uint64_t v28 = v27[6];
              uint64_t v29 = v27[7];
              uint64_t v30 = v27[9];
              uint64_t v64 = v27[8];
            }

            else
            {
              uint64_t v64 = -1LL;
              uint64_t v28 = -1LL;
              uint64_t v29 = -1LL;
              uint64_t v30 = -1LL;
            }

            uint64_t v34 = *(void **)(a1 + 168);
            if (v34)
            {
              uint64_t v36 = v34[6];
              uint64_t v37 = v34[7];
              uint64_t v35 = v34[8];
              uint64_t v38 = v34[9];
            }

            else
            {
              uint64_t v35 = -1LL;
              uint64_t v36 = -1LL;
              uint64_t v37 = -1LL;
              uint64_t v38 = -1LL;
            }

            int v39 = nw_frame_array_unclaimed_length();
            *(_DWORD *)__int128 buf = 136317698;
            uint64_t v69 = (char *)out;
            __int16 v70 = 1024;
            int v71 = ip_protocol;
            __int16 v72 = 2048;
            uint64_t v73 = v28;
            __int16 v74 = 2048;
            uint64_t v75 = v29;
            __int16 v76 = 2048;
            uint64_t v77 = v64;
            __int16 v78 = 2048;
            uint64_t v79 = v30;
            __int16 v80 = 2048;
            uint64_t v81 = v36;
            __int16 v82 = 2048;
            uint64_t v83 = v37;
            __int16 v84 = 2048;
            uint64_t v85 = v35;
            __int16 v86 = 2048;
            uint64_t v87 = v38;
            __int16 v88 = 1024;
            int v89 = v39;
            _os_log_debug_impl( &dword_187528000,  v6,  OS_LOG_TYPE_DEBUG,  "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending %u in put bytes to the next filter",  buf,  0x68u);
          }
        }

        else if (v7)
        {
          if (*(void *)(a1 + 80)) {
            int v14 = nw_parameters_get_ip_protocol();
          }
          else {
            int v14 = 0;
          }
          uint64_t v31 = *(unsigned int *)(a1 + 176);
          uint64_t v32 = "unknown";
          int v33 = nw_frame_array_unclaimed_length();
          *(_DWORD *)__int128 buf = 136315906;
          uint64_t v69 = (char *)out;
          __int16 v70 = 1024;
          int v71 = v14;
          __int16 v72 = 2080;
          uint64_t v73 = (uint64_t)v32;
          __int16 v74 = 1024;
          LODWORD(v75) = v33;
          _os_log_debug_impl( &dword_187528000,  v6,  OS_LOG_TYPE_DEBUG,  "[filter %s %d %s] sending %u input bytes to the next filter",  buf,  0x22u);
        }

        nw_frame_array_append_array();
      }

      if (ne_filter_data_protocol_send_data(a1, i, 1) && (*(_WORD *)(i + 144) & 8) != 0)
      {
        ne_filter_data_protocol_send_finished(a1, i, 0xAu);
        *(_WORD *)(i + 144) &= ~8u;
      }
    }

    if (*(void *)(i + 88) < *(void *)(i + 48) && (nw_frame_array_is_empty() & 1) == 0)
    {
      uuid_unparse((const unsigned __int8 *)a1, (char *)out);
      int v8 = *(_DWORD *)(a1 + 176);
      uint64_t v9 = (os_log_s *)ne_log_obj();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8 == 3)
      {
        if (v10)
        {
          if (*(void *)(a1 + 80)) {
            int v66 = nw_parameters_get_ip_protocol();
          }
          else {
            int v66 = 0;
          }
          uint64_t v15 = *(void **)(a1 + 160);
          if (v15)
          {
            uint64_t v16 = v15[7];
            uint64_t v17 = v15[9];
            uint64_t v62 = v15[6];
            uint64_t v63 = v15[8];
          }

          else
          {
            uint64_t v62 = -1LL;
            uint64_t v63 = -1LL;
            uint64_t v16 = -1LL;
            uint64_t v17 = -1LL;
          }

          uint64_t v21 = *(void **)(a1 + 168);
          if (v21)
          {
            uint64_t v23 = v21[6];
            uint64_t v24 = v21[7];
            uint64_t v22 = v21[8];
            uint64_t v25 = v21[9];
          }

          else
          {
            uint64_t v22 = -1LL;
            uint64_t v23 = -1LL;
            uint64_t v24 = -1LL;
            uint64_t v25 = -1LL;
          }

          int v26 = nw_frame_array_unclaimed_length();
          *(_DWORD *)__int128 buf = 136317698;
          uint64_t v69 = (char *)out;
          __int16 v70 = 1024;
          int v71 = v66;
          __int16 v72 = 2048;
          uint64_t v73 = v62;
          __int16 v74 = 2048;
          uint64_t v75 = v16;
          __int16 v76 = 2048;
          uint64_t v77 = v63;
          __int16 v78 = 2048;
          uint64_t v79 = v17;
          __int16 v80 = 2048;
          uint64_t v81 = v23;
          __int16 v82 = 2048;
          uint64_t v83 = v24;
          __int16 v84 = 2048;
          uint64_t v85 = v22;
          __int16 v86 = 2048;
          uint64_t v87 = v25;
          __int16 v88 = 1024;
          int v89 = v26;
          _os_log_debug_impl( &dword_187528000,  v9,  OS_LOG_TYPE_DEBUG,  "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]have %u pending input bytes",  buf,  0x68u);
        }
      }

      else if (v10)
      {
        if (*(void *)(a1 + 80)) {
          int v13 = nw_parameters_get_ip_protocol();
        }
        else {
          int v13 = 0;
        }
        uint64_t v18 = *(unsigned int *)(a1 + 176);
        uint64_t v19 = "unknown";
        int v20 = nw_frame_array_unclaimed_length();
        *(_DWORD *)__int128 buf = 136315906;
        uint64_t v69 = (char *)out;
        __int16 v70 = 1024;
        int v71 = v13;
        __int16 v72 = 2080;
        uint64_t v73 = (uint64_t)v19;
        __int16 v74 = 1024;
        LODWORD(v75) = v20;
        _os_log_debug_impl( &dword_187528000,  v9,  OS_LOG_TYPE_DEBUG,  "[filter %s %d %s] have %u pending input bytes",  buf,  0x22u);
      }

      nw_frame_array_init();
      int v11 = *(_DWORD *)(i + 48) - *(_DWORD *)(i + 88);
      out[0] = 0;
      int v12 = ne_filter_protocol_fulfill_frame_request( a1,  i + 24,  (uint64_t)buf,  (*(_DWORD *)(a1 + 120) & 0x8000) == 0,  v11,  -1,  out);
      *(void *)(i + 88) += out[0];
      if (v12) {
        nw_frame_array_prepend_array();
      }
    }

    if ((nw_frame_array_is_empty() & 1) == 0) {
      *(_DWORD *)(a1 + 120) |= 0x1000u;
    }
  }

  uint64_t result = nw_frame_array_is_empty();
  if ((result & 1) == 0)
  {
    uuid_unparse((const unsigned __int8 *)a1, (char *)out);
    int v41 = *(_DWORD *)(a1 + 176);
    uint32_t v42 = (os_log_s *)ne_log_obj();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG);
    if (v41 == 3)
    {
      if (v43)
      {
        if (*(void *)(a1 + 80)) {
          int v67 = nw_parameters_get_ip_protocol();
        }
        else {
          int v67 = 0;
        }
        uint64_t v45 = *(void **)(a1 + 160);
        if (v45)
        {
          uint64_t v47 = v45[6];
          uint64_t v48 = v45[7];
          uint64_t v46 = v45[8];
          uint64_t v49 = v45[9];
        }

        else
        {
          uint64_t v46 = -1LL;
          uint64_t v47 = -1LL;
          uint64_t v48 = -1LL;
          uint64_t v49 = -1LL;
        }

        __int16 v52 = *(void **)(a1 + 168);
        if (v52)
        {
          uint64_t v54 = v52[6];
          uint64_t v55 = v52[7];
          uint64_t v53 = v52[8];
          uint64_t v56 = v52[9];
        }

        else
        {
          uint64_t v53 = -1LL;
          uint64_t v54 = -1LL;
          uint64_t v55 = -1LL;
          uint64_t v56 = -1LL;
        }

        int v61 = nw_frame_array_unclaimed_length();
        *(_DWORD *)__int128 buf = 136317698;
        uint64_t v69 = (char *)out;
        __int16 v70 = 1024;
        int v71 = v67;
        __int16 v72 = 2048;
        uint64_t v73 = v47;
        __int16 v74 = 2048;
        uint64_t v75 = v48;
        __int16 v76 = 2048;
        uint64_t v77 = v46;
        __int16 v78 = 2048;
        uint64_t v79 = v49;
        __int16 v80 = 2048;
        uint64_t v81 = v54;
        __int16 v82 = 2048;
        uint64_t v83 = v55;
        __int16 v84 = 2048;
        uint64_t v85 = v53;
        __int16 v86 = 2048;
        uint64_t v87 = v56;
        __int16 v88 = 1024;
        int v89 = v61;
        uint64_t v58 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]accepting %u input bytes";
        uint64_t v59 = v42;
        uint32_t v60 = 104;
LABEL_81:
        _os_log_debug_impl(&dword_187528000, v59, OS_LOG_TYPE_DEBUG, v58, buf, v60);
      }
    }

    else if (v43)
    {
      if (*(void *)(a1 + 80)) {
        int v44 = nw_parameters_get_ip_protocol();
      }
      else {
        int v44 = 0;
      }
      uint64_t v50 = *(unsigned int *)(a1 + 176);
      else {
        uint64_t v51 = (&off_18A06EDE8)[v50];
      }
      int v57 = nw_frame_array_unclaimed_length();
      *(_DWORD *)__int128 buf = 136315906;
      uint64_t v69 = (char *)out;
      __int16 v70 = 1024;
      int v71 = v44;
      __int16 v72 = 2080;
      uint64_t v73 = (uint64_t)v51;
      __int16 v74 = 1024;
      LODWORD(v75) = v57;
      uint64_t v58 = "[filter %s %d %s] accepting %u input bytes";
      uint64_t v59 = v42;
      uint32_t v60 = 34;
      goto LABEL_81;
    }

    return nw_frame_array_append_array();
  }

  return result;
}

void ne_filter_handle_input_finished(uint64_t a1, uint64_t a2)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v25 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)uint64_t v65 = 136315138;
    *(void *)&v65[4] = "ne_filter_handle_input_finished";
    int v26 = "%s called with null protocol";
    goto LABEL_30;
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v25 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)uint64_t v65 = 136315138;
    *(void *)&v65[4] = "ne_filter_handle_input_finished";
    int v26 = "%s called with null filter";
LABEL_30:
    _os_log_fault_impl(&dword_187528000, v25, OS_LOG_TYPE_FAULT, v26, v65, 0xCu);
    return;
  }

  unsigned int v4 = (unsigned int *)(v3 + 180);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (!v5) {
    return;
  }
  int v6 = *(_DWORD *)(v3 + 120);
  if ((v6 & 0x800) != 0 || *(_DWORD *)(v3 + 176) != 3 || (uint64_t v7 = *(void *)(v3 + 144)) == 0)
  {
LABEL_13:
    *(_DWORD *)(v3 + 120) = v6 | 0x800;
    if (a2 && (nw_frame_array_is_empty() & 1) == 0) {
      nw_frame_array_append_array();
    }
    int v9 = *(_DWORD *)(v3 + 120);
    if ((v9 & 0x10) == 0)
    {
      if (!nw_frame_array_is_empty())
      {
        ne_filter_protocol_input_available(a1);
        return;
      }

      int v9 = *(_DWORD *)(v3 + 120);
    }

    if ((v9 & 0x200) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)(v3 + 120) & 0xC0) != 0x40) {
        return;
      }
      *(_DWORD *)(v3 + 120) |= 0x80u;
      for (uint64_t i = *(void *)(v3 + 144); i; uint64_t i = *(void *)(i + 152))
        ne_filter_data_protocol_send_finished(a1, i, 0xBu);
      uuid_unparse((const unsigned __int8 *)v3, out);
      int v31 = *(_DWORD *)(v3 + 176);
      uint64_t v32 = (os_log_s *)ne_log_obj();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v31 == 3)
      {
        if (v33)
        {
          uint64_t v34 = *(void *)(v3 + 80);
          if (v34) {
            LODWORD(v34) = nw_parameters_get_ip_protocol();
          }
          uint64_t v35 = *(void **)(v3 + 160);
          if (v35)
          {
            uint64_t v37 = v35[6];
            uint64_t v38 = v35[7];
            uint64_t v36 = v35[8];
            uint64_t v39 = v35[9];
          }

          else
          {
            uint64_t v36 = -1LL;
            uint64_t v37 = -1LL;
            uint64_t v38 = -1LL;
            uint64_t v39 = -1LL;
          }

          uint64_t v54 = *(void **)(v3 + 168);
          if (v54)
          {
            uint64_t v56 = v54[6];
            uint64_t v57 = v54[7];
            uint64_t v55 = v54[8];
            uint64_t v58 = v54[9];
          }

          else
          {
            uint64_t v55 = -1LL;
            uint64_t v56 = -1LL;
            uint64_t v57 = -1LL;
            uint64_t v58 = -1LL;
          }

          *(_DWORD *)uint64_t v65 = 136317442;
          *(void *)&v65[4] = out;
          *(_WORD *)&v65[12] = 1024;
          *(_DWORD *)&v65[14] = v34;
          *(_WORD *)&v65[18] = 2048;
          *(void *)&v65[20] = v37;
          *(_WORD *)&v65[28] = 2048;
          *(void *)&v65[30] = v38;
          *(_WORD *)&v65[38] = 2048;
          uint64_t v66 = v36;
          __int16 v67 = 2048;
          uint64_t v68 = v39;
          __int16 v69 = 2048;
          uint64_t v70 = v56;
          __int16 v71 = 2048;
          uint64_t v72 = v57;
          __int16 v73 = 2048;
          uint64_t v74 = v55;
          __int16 v75 = 2048;
          uint64_t v76 = v58;
          uint64_t v62 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling dis"
                "connected on input protocol";
          uint64_t v63 = v32;
          uint32_t v64 = 98;
LABEL_76:
          _os_log_debug_impl(&dword_187528000, v63, OS_LOG_TYPE_DEBUG, v62, v65, v64);
        }
      }

      else if (v33)
      {
        uint64_t v46 = *(void *)(v3 + 80);
        if (v46) {
          LODWORD(v46) = nw_parameters_get_ip_protocol();
        }
        uint64_t v47 = *(unsigned int *)(v3 + 176);
        else {
          uint64_t v48 = (&off_18A06EDE8)[v47];
        }
        *(_DWORD *)uint64_t v65 = 136315650;
        *(void *)&v65[4] = out;
        *(_WORD *)&v65[12] = 1024;
        *(_DWORD *)&v65[14] = v46;
        *(_WORD *)&v65[18] = 2080;
        *(void *)&v65[20] = v48;
        uint64_t v62 = "[filter %s %d %s] calling disconnected on input protocol";
        uint64_t v63 = v32;
        uint32_t v64 = 28;
        goto LABEL_76;
      }

      uint64_t v40 = *(void *)(v3 + 48);
      if (v40)
      {
        uint64_t v41 = *(void *)(v40 + 24);
        if (v41)
        {
          uint32_t v42 = *(void (**)(void))(v41 + 48);
          if (v42) {
            v42();
          }
        }
      }

      return;
    }

    *(_DWORD *)(v3 + 120) = v9 & 0xFFFFFDFF;
    uuid_unparse((const unsigned __int8 *)v3, out);
    int v10 = *(_DWORD *)(v3 + 176);
    int v11 = (os_log_s *)ne_log_obj();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10 == 3)
    {
      if (v12)
      {
        uint64_t v19 = *(void *)(v3 + 80);
        if (v19) {
          LODWORD(v19) = nw_parameters_get_ip_protocol();
        }
        int v20 = *(void **)(v3 + 160);
        if (v20)
        {
          uint64_t v22 = v20[6];
          uint64_t v23 = v20[7];
          uint64_t v21 = v20[8];
          uint64_t v24 = v20[9];
        }

        else
        {
          uint64_t v21 = -1LL;
          uint64_t v22 = -1LL;
          uint64_t v23 = -1LL;
          uint64_t v24 = -1LL;
        }

        uint64_t v49 = *(void **)(v3 + 168);
        if (v49)
        {
          uint64_t v51 = v49[6];
          uint64_t v52 = v49[7];
          uint64_t v50 = v49[8];
          uint64_t v53 = v49[9];
        }

        else
        {
          uint64_t v50 = -1LL;
          uint64_t v51 = -1LL;
          uint64_t v52 = -1LL;
          uint64_t v53 = -1LL;
        }

        *(_DWORD *)uint64_t v65 = 136317442;
        *(void *)&v65[4] = out;
        *(_WORD *)&v65[12] = 1024;
        *(_DWORD *)&v65[14] = v19;
        *(_WORD *)&v65[18] = 2048;
        *(void *)&v65[20] = v22;
        *(_WORD *)&v65[28] = 2048;
        *(void *)&v65[30] = v23;
        *(_WORD *)&v65[38] = 2048;
        uint64_t v66 = v21;
        __int16 v67 = 2048;
        uint64_t v68 = v24;
        __int16 v69 = 2048;
        uint64_t v70 = v51;
        __int16 v71 = 2048;
        uint64_t v72 = v52;
        __int16 v73 = 2048;
        uint64_t v74 = v50;
        __int16 v75 = 2048;
        uint64_t v76 = v53;
        uint64_t v59 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling input"
              "_finished on input protocol";
        uint32_t v60 = v11;
        uint32_t v61 = 98;
LABEL_73:
        _os_log_debug_impl(&dword_187528000, v60, OS_LOG_TYPE_DEBUG, v59, v65, v61);
      }
    }

    else if (v12)
    {
      uint64_t v43 = *(void *)(v3 + 80);
      if (v43) {
        LODWORD(v43) = nw_parameters_get_ip_protocol();
      }
      uint64_t v44 = *(unsigned int *)(v3 + 176);
      else {
        uint64_t v45 = (&off_18A06EDE8)[v44];
      }
      *(_DWORD *)uint64_t v65 = 136315650;
      *(void *)&v65[4] = out;
      *(_WORD *)&v65[12] = 1024;
      *(_DWORD *)&v65[14] = v43;
      *(_WORD *)&v65[18] = 2080;
      *(void *)&v65[20] = v45;
      uint64_t v59 = "[filter %s %d %s] calling input_finished on input protocol";
      uint32_t v60 = v11;
      uint32_t v61 = 28;
      goto LABEL_73;
    }

    uint64_t v27 = *(void *)(v3 + 48);
    if (v27)
    {
      uint64_t v28 = *(void *)(v27 + 24);
      if (v28)
      {
        uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(v28 + 184);
        if (v29) {
          v29( v27,  a1,  v13,  v14,  v15,  v16,  v17,  v18,  *(void *)v65,  *(void *)&v65[8],  *(void *)&v65[16],  *(void *)&v65[24],  *(void *)&v65[32]);
        }
      }
    }

    goto LABEL_37;
  }

  while (1)
  {
    if (*(_DWORD *)(v7 + 40) == 3 && *(void *)(v7 + 48) != -1LL)
    {
      __int16 v8 = *(_WORD *)(v7 + 144);
      if ((v8 & 0x80) == 0) {
        break;
      }
    }

    uint64_t v7 = *(void *)(v7 + 152);
    if (!v7) {
      goto LABEL_13;
    }
  }

  *(_WORD *)(v7 + 144) = v8 | 8;
  ne_filter_read_approved_frames(v3, a2);
}

void ne_filter_cleanup(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v36 = 136315138;
    uint64_t v37 = "ne_filter_cleanup";
    uint64_t v17 = "%s called with null protocol";
    goto LABEL_35;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v16 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v36 = 136315138;
    uint64_t v37 = "ne_filter_cleanup";
    uint64_t v17 = "%s called with null filter";
LABEL_35:
    _os_log_fault_impl(&dword_187528000, v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v36, 0xCu);
    return;
  }

  uint64_t v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4) {
    return;
  }
  if ((~*(_DWORD *)(v2 + 120) & 0x10001) != 0 || (*(_DWORD *)(v2 + 120) & 0x88) == 8) {
    return;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v7 = *(_DWORD *)(v2 + 176);
    __int16 v8 = (os_log_s *)ne_log_obj();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 == 3)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(v2 + 80);
        if (v10) {
          LODWORD(v10) = nw_parameters_get_ip_protocol();
        }
        int v11 = *(void **)(v2 + 160);
        if (v11)
        {
          uint64_t v13 = v11[6];
          uint64_t v14 = v11[7];
          uint64_t v12 = v11[8];
          uint64_t v15 = v11[9];
        }

        else
        {
          uint64_t v12 = -1LL;
          uint64_t v13 = -1LL;
          uint64_t v14 = -1LL;
          uint64_t v15 = -1LL;
        }

        uint64_t v28 = *(void **)(v2 + 168);
        if (v28)
        {
          uint64_t v30 = v28[6];
          uint64_t v31 = v28[7];
          uint64_t v29 = v28[8];
          uint64_t v32 = v28[9];
        }

        else
        {
          uint64_t v29 = -1LL;
          uint64_t v30 = -1LL;
          uint64_t v31 = -1LL;
          uint64_t v32 = -1LL;
        }

        int v36 = 136317442;
        uint64_t v37 = out;
        __int16 v38 = 1024;
        int v39 = v10;
        __int16 v40 = 2048;
        uint64_t v41 = v13;
        __int16 v42 = 2048;
        uint64_t v43 = v14;
        __int16 v44 = 2048;
        uint64_t v45 = v12;
        __int16 v46 = 2048;
        uint64_t v47 = v15;
        __int16 v48 = 2048;
        uint64_t v49 = v30;
        __int16 v50 = 2048;
        uint64_t v51 = v31;
        __int16 v52 = 2048;
        uint64_t v53 = v29;
        __int16 v54 = 2048;
        uint64_t v55 = v32;
        BOOL v33 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]tearing down output handler";
        uint64_t v34 = v8;
        uint32_t v35 = 98;
LABEL_47:
        _os_log_debug_impl(&dword_187528000, v34, OS_LOG_TYPE_DEBUG, v33, (uint8_t *)&v36, v35);
      }
    }

    else if (v9)
    {
      uint64_t v25 = *(void *)(v2 + 80);
      if (v25) {
        LODWORD(v25) = nw_parameters_get_ip_protocol();
      }
      uint64_t v26 = *(unsigned int *)(v2 + 176);
      else {
        uint64_t v27 = (&off_18A06EDE8)[v26];
      }
      int v36 = 136315650;
      uint64_t v37 = out;
      __int16 v38 = 1024;
      int v39 = v25;
      __int16 v40 = 2080;
      uint64_t v41 = (uint64_t)v27;
      BOOL v33 = "[filter %s %d %s] tearing down output handler";
      uint64_t v34 = v8;
      uint32_t v35 = 28;
      goto LABEL_47;
    }

    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 24) + 8LL);
    if (v18) {
      v18(v6, a1, 1LL);
    }
    *(void *)(a1 + 32) = 0LL;
  }

  ne_filter_unregister_flow(*(void *)(v2 + 96), a1);
  uint64_t v19 = *(void *)(a1 + 40);
  if (v19)
  {
    int v20 = (unsigned int *)(v19 + 180);
    do
      unsigned int v21 = __ldaxr(v20);
    while (__stlxr(v21, v20));
    if (v21)
    {
      do
      {
        unsigned int v22 = __ldaxr(v20);
        unsigned int v23 = v22 - 1;
      }

      while (__stlxr(v23, v20));
      if (!v23) {
        ne_filter_protocol_destroy(a1);
      }
    }
  }

  else
  {
    uint64_t v24 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_187528000, v24, OS_LOG_TYPE_INFO, "filter is null", (uint8_t *)&v36, 2u);
    }
  }

BOOL ne_filter_data_protocol_send_data(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v334 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v27 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187528000, v27, OS_LOG_TYPE_INFO, "filter is null", buf, 2u);
    return 0LL;
  }

  int v4 = a3;
  int v7 = (unsigned int *)(v3 + 180);
  do
    unsigned int v8 = __ldaxr(v7);
  while (__stlxr(v8, v7));
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = 104LL;
  if (a3) {
    uint64_t v9 = 88LL;
  }
  unint64_t v10 = *(void *)(a2 + v9);
  uint64_t v11 = 112LL;
  if (a3) {
    uint64_t v11 = 96LL;
  }
  v302 = (uint64_t *)(a2 + 96);
  v303 = (uint64_t *)(a2 + 112);
  if (a3) {
    uint64_t v12 = (void *)(a2 + 96);
  }
  else {
    uint64_t v12 = (void *)(a2 + 112);
  }
  unint64_t v13 = *(void *)(a2 + v11);
  unsigned int v14 = nw_frame_array_unclaimed_length();
  if (!v14)
  {
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v29 = *(_DWORD *)(v3 + 176);
    uint64_t v30 = (os_log_s *)ne_log_obj();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
    if (v29 == 3)
    {
      if (v31)
      {
        uint64_t v32 = *(void *)(v3 + 80);
        if (v32) {
          LODWORD(v32) = nw_parameters_get_ip_protocol();
        }
        BOOL v33 = *(void **)(v3 + 160);
        if (v33)
        {
          uint64_t v35 = v33[6];
          uint64_t v36 = v33[7];
          uint64_t v34 = v33[8];
          uint64_t v37 = v33[9];
        }

        else
        {
          uint64_t v34 = -1LL;
          uint64_t v35 = -1LL;
          uint64_t v36 = -1LL;
          uint64_t v37 = -1LL;
        }

        v178 = *(void **)(v3 + 168);
        if (v178)
        {
          uint64_t v180 = v178[6];
          uint64_t v181 = v178[7];
          uint64_t v179 = v178[8];
          uint64_t v182 = v178[9];
        }

        else
        {
          uint64_t v179 = -1LL;
          uint64_t v180 = -1LL;
          uint64_t v181 = -1LL;
          uint64_t v182 = -1LL;
        }

        v308 = (char *)out;
        uint64_t v187 = "out";
        __int16 v309 = 1024;
        *(_DWORD *)__int128 buf = 136317698;
        if (v4) {
          uint64_t v187 = "in";
        }
        int v310 = v32;
        __int16 v311 = 2048;
        uint64_t v312 = v35;
        __int16 v313 = 2048;
        size_t v314 = v36;
        __int16 v315 = 2048;
        unint64_t v316 = v34;
        __int16 v317 = 2048;
        uint64_t v318 = v37;
        __int16 v319 = 2048;
        uint64_t v320 = v180;
        __int16 v321 = 2048;
        uint64_t v322 = v181;
        __int16 v323 = 2048;
        uint64_t v324 = v179;
        __int16 v325 = 2048;
        uint64_t v326 = v182;
        __int16 v327 = 2080;
        size_t v328 = (size_t)v187;
        __int16 v184 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound p"
               "ending bytes to filter";
        uint64_t v185 = v30;
        uint32_t v186 = 108;
        goto LABEL_245;
      }
    }

    else if (v31)
    {
      uint64_t v38 = *(void *)(v3 + 80);
      if (v38) {
        LODWORD(v38) = nw_parameters_get_ip_protocol();
      }
      uint64_t v39 = *(unsigned int *)(v3 + 176);
      else {
        __int16 v40 = (&off_18A06EDE8)[v39];
      }
      uint64_t v183 = "out";
      v308 = (char *)out;
      __int16 v309 = 1024;
      *(_DWORD *)__int128 buf = 136315906;
      if (v4) {
        uint64_t v183 = "in";
      }
      int v310 = v38;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v40;
      __int16 v313 = 2080;
      size_t v314 = (size_t)v183;
      __int16 v184 = "[filter %s %d %s] no %sbound pending bytes to filter";
      uint64_t v185 = v30;
      uint32_t v186 = 38;
      goto LABEL_245;
    }

    return 1LL;
  }

  v298 = v12;
  unsigned int v301 = v14;
  if (v13 >= v10)
  {
    unint64_t v16 = v13;
    goto LABEL_36;
  }

  int v15 = v4;
  unint64_t v16 = v10;
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v17 = *(_DWORD *)(v3 + 176);
  uint64_t v18 = (os_log_s *)ne_log_obj();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v17 == 3)
  {
    int v4 = v15;
    if (!v19) {
      goto LABEL_36;
    }
    uint64_t v20 = *(void *)(v3 + 80);
    if (v20) {
      LODWORD(v20) = nw_parameters_get_ip_protocol();
    }
    unsigned int v21 = v18;
    unsigned int v22 = *(void **)(v3 + 160);
    if (v22)
    {
      uint64_t v24 = v22[6];
      uint64_t v25 = v22[7];
      uint64_t v23 = v22[8];
      uint64_t v26 = v22[9];
    }

    else
    {
      uint64_t v23 = -1LL;
      uint64_t v24 = -1LL;
      uint64_t v25 = -1LL;
      uint64_t v26 = -1LL;
    }

    __int16 v188 = *(void **)(v3 + 168);
    if (v188)
    {
      uint64_t v190 = v188[6];
      uint64_t v191 = v188[7];
      uint64_t v189 = v188[8];
      uint64_t v192 = v188[9];
    }

    else
    {
      uint64_t v189 = -1LL;
      uint64_t v190 = -1LL;
      uint64_t v191 = -1LL;
      uint64_t v192 = -1LL;
    }

    v308 = (char *)out;
    v205 = "out";
    __int16 v309 = 1024;
    *(_DWORD *)__int128 buf = 136318210;
    if (v15) {
      v205 = "in";
    }
    int v310 = v20;
    __int16 v311 = 2048;
    uint64_t v312 = v24;
    __int16 v313 = 2048;
    size_t v314 = v25;
    __int16 v315 = 2048;
    unint64_t v316 = v23;
    __int16 v317 = 2048;
    uint64_t v318 = v26;
    __int16 v319 = 2048;
    uint64_t v320 = v190;
    __int16 v321 = 2048;
    uint64_t v322 = v191;
    __int16 v323 = 2048;
    uint64_t v324 = v189;
    __int16 v325 = 2048;
    uint64_t v326 = v192;
    __int16 v327 = 2080;
    size_t v328 = (size_t)v205;
    __int16 v329 = 2048;
    unint64_t v330 = v13;
    __int16 v331 = 2048;
    unint64_t v332 = v10;
    v203 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]%sbound sent off"
           "set less than start, adjusting from %llu to %llu";
    uint32_t v204 = 128;
  }

  else
  {
    int v4 = v15;
    if (!v19) {
      goto LABEL_36;
    }
    uint64_t v138 = *(void *)(v3 + 80);
    if (v138) {
      LODWORD(v138) = nw_parameters_get_ip_protocol();
    }
    unsigned int v21 = v18;
    uint64_t v139 = *(unsigned int *)(v3 + 176);
    else {
      __int16 v140 = (&off_18A06EDE8)[v139];
    }
    v308 = (char *)out;
    v202 = "out";
    __int16 v309 = 1024;
    *(_DWORD *)__int128 buf = 136316418;
    if (v15) {
      v202 = "in";
    }
    int v310 = v138;
    __int16 v311 = 2080;
    uint64_t v312 = (uint64_t)v140;
    __int16 v313 = 2080;
    size_t v314 = (size_t)v202;
    __int16 v315 = 2048;
    unint64_t v316 = v13;
    __int16 v317 = 2048;
    uint64_t v318 = v10;
    v203 = "[filter %s %d %s] %sbound sent offset less than start, adjusting from %llu to %llu";
    uint32_t v204 = 58;
  }

  _os_log_debug_impl(&dword_187528000, v21, OS_LOG_TYPE_DEBUG, v203, buf, v204);
LABEL_36:
  int v300 = v4;
  BOOL v41 = v4 == 0;
  uint64_t v42 = 64LL;
  if (v4) {
    uint64_t v42 = 48LL;
  }
  unint64_t v43 = *(void *)(a2 + v42);
  uint64_t v44 = 72LL;
  if (!v41) {
    uint64_t v44 = 56LL;
  }
  unint64_t v45 = *(void *)(a2 + v44);
  if (v45 <= v43)
  {
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v56 = *(_DWORD *)(v3 + 176);
    uint64_t v57 = (os_log_s *)ne_log_obj();
    BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);
    if (v56 == 3)
    {
      if (v58)
      {
        uint64_t v59 = *(void *)(v3 + 80);
        if (v59) {
          LODWORD(v59) = nw_parameters_get_ip_protocol();
        }
        uint32_t v60 = *(void **)(v3 + 160);
        if (v60)
        {
          uint64_t v62 = v60[6];
          uint64_t v63 = v60[7];
          uint64_t v61 = v60[8];
          uint64_t v64 = v60[9];
        }

        else
        {
          uint64_t v61 = -1LL;
          uint64_t v62 = -1LL;
          uint64_t v63 = -1LL;
          uint64_t v64 = -1LL;
        }

        unint64_t v193 = *(void **)(v3 + 168);
        if (v193)
        {
          uint64_t v195 = v193[6];
          uint64_t v196 = v193[7];
          uint64_t v194 = v193[8];
          uint64_t v197 = v193[9];
        }

        else
        {
          uint64_t v194 = -1LL;
          uint64_t v195 = -1LL;
          uint64_t v196 = -1LL;
          uint64_t v197 = -1LL;
        }

        v308 = (char *)out;
        v206 = "out";
        __int16 v309 = 1024;
        *(_DWORD *)__int128 buf = 136318210;
        if (v300) {
          v206 = "in";
        }
        int v310 = v59;
        __int16 v311 = 2048;
        uint64_t v312 = v62;
        __int16 v313 = 2048;
        size_t v314 = v63;
        __int16 v315 = 2048;
        unint64_t v316 = v61;
        __int16 v317 = 2048;
        uint64_t v318 = v64;
        __int16 v319 = 2048;
        uint64_t v320 = v195;
        __int16 v321 = 2048;
        uint64_t v322 = v196;
        __int16 v323 = 2048;
        uint64_t v324 = v194;
        __int16 v325 = 2048;
        uint64_t v326 = v197;
        __int16 v327 = 2080;
        size_t v328 = (size_t)v206;
        __int16 v329 = 2048;
        unint64_t v330 = v45;
        __int16 v331 = 2048;
        unint64_t v332 = v43;
        __int16 v184 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound b"
               "ytes to peek (%llu < %llu)";
        uint64_t v185 = v57;
        uint32_t v186 = 128;
        goto LABEL_245;
      }
    }

    else if (v58)
    {
      uint64_t v65 = *(void *)(v3 + 80);
      if (v65) {
        LODWORD(v65) = nw_parameters_get_ip_protocol();
      }
      uint64_t v66 = *(unsigned int *)(v3 + 176);
      else {
        __int16 v67 = (&off_18A06EDE8)[v66];
      }
      v308 = (char *)out;
      v198 = "out";
      __int16 v309 = 1024;
      *(_DWORD *)__int128 buf = 136316418;
      if (v300) {
        v198 = "in";
      }
      int v310 = v65;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v67;
      __int16 v313 = 2080;
      size_t v314 = (size_t)v198;
      __int16 v315 = 2048;
      unint64_t v316 = v45;
      __int16 v317 = 2048;
      uint64_t v318 = v43;
      __int16 v184 = "[filter %s %d %s] no %sbound bytes to peek (%llu < %llu)";
      uint64_t v185 = v57;
      uint32_t v186 = 58;
      goto LABEL_245;
    }

    return 1LL;
  }

  unint64_t v46 = v16 - v10;
  if (v43 <= v16)
  {
    unint64_t v43 = v16;
    unsigned int v49 = v301;
    goto LABEL_62;
  }

  unint64_t v296 = v43 - v16;
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v47 = *(_DWORD *)(v3 + 176);
  log = (os_log_s *)ne_log_obj();
  BOOL v48 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v47 == 3)
  {
    unsigned int v49 = v301;
    if (v48)
    {
      uint64_t v50 = *(void *)(v3 + 80);
      if (v50) {
        LODWORD(v50) = nw_parameters_get_ip_protocol();
      }
      uint64_t v51 = *(void **)(v3 + 160);
      if (v51)
      {
        uint64_t v53 = v51[6];
        uint64_t v54 = v51[7];
        uint64_t v52 = v51[8];
        uint64_t v55 = v51[9];
      }

      else
      {
        uint64_t v52 = -1LL;
        uint64_t v53 = -1LL;
        uint64_t v54 = -1LL;
        uint64_t v55 = -1LL;
      }

      v212 = *(void **)(v3 + 168);
      if (v212)
      {
        uint64_t v214 = v212[6];
        uint64_t v215 = v212[7];
        uint64_t v213 = v212[8];
        uint64_t v216 = v212[9];
      }

      else
      {
        uint64_t v213 = -1LL;
        uint64_t v214 = -1LL;
        uint64_t v215 = -1LL;
        uint64_t v216 = -1LL;
      }

      v227 = "out";
      *(_DWORD *)__int128 buf = 136318210;
      v308 = (char *)out;
      __int16 v309 = 1024;
      if (v300) {
        v227 = "in";
      }
      int v310 = v50;
      __int16 v311 = 2048;
      uint64_t v312 = v53;
      __int16 v313 = 2048;
      size_t v314 = v54;
      __int16 v315 = 2048;
      unint64_t v316 = v52;
      __int16 v317 = 2048;
      uint64_t v318 = v55;
      __int16 v319 = 2048;
      uint64_t v320 = v214;
      __int16 v321 = 2048;
      uint64_t v322 = v215;
      __int16 v323 = 2048;
      uint64_t v324 = v213;
      __int16 v325 = 2048;
      uint64_t v326 = v216;
      __int16 v327 = 2080;
      size_t v328 = (size_t)v227;
      __int16 v329 = 2048;
      unint64_t v330 = v46;
      __int16 v331 = 2048;
      unint64_t v332 = v296 + v46;
      v225 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]already passed"
             " %sbound bytes, moving frameArrayStart offset from %llu to %llu";
      v224 = log;
      uint32_t v226 = 128;
LABEL_240:
      _os_log_debug_impl(&dword_187528000, v224, OS_LOG_TYPE_DEBUG, v225, buf, v226);
    }
  }

  else
  {
    unsigned int v49 = v301;
    if (v48)
    {
      uint64_t v199 = *(void *)(v3 + 80);
      if (v199) {
        LODWORD(v199) = nw_parameters_get_ip_protocol();
      }
      uint64_t v200 = *(unsigned int *)(v3 + 176);
      else {
        v201 = (&off_18A06EDE8)[v200];
      }
      v223 = "out";
      *(_DWORD *)__int128 buf = 136316418;
      v308 = (char *)out;
      __int16 v309 = 1024;
      if (v300) {
        v223 = "in";
      }
      int v310 = v199;
      v224 = log;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v201;
      __int16 v313 = 2080;
      size_t v314 = (size_t)v223;
      __int16 v315 = 2048;
      unint64_t v316 = v46;
      __int16 v317 = 2048;
      uint64_t v318 = v296 + v46;
      v225 = "[filter %s %d %s] already passed %sbound bytes, moving frameArrayStart offset from %llu to %llu";
      uint32_t v226 = 58;
      goto LABEL_240;
    }
  }

  v46 += v296;
  *v298 += v296;
LABEL_62:
  if (v49 < v46)
  {
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v68 = *(_DWORD *)(v3 + 176);
    __int16 v69 = (os_log_s *)ne_log_obj();
    BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG);
    if (v68 == 3)
    {
      if (v70)
      {
        uint64_t v71 = *(void *)(v3 + 80);
        if (v71) {
          LODWORD(v71) = nw_parameters_get_ip_protocol();
        }
        uint64_t v72 = *(void **)(v3 + 160);
        if (v72)
        {
          uint64_t v74 = v72[6];
          uint64_t v75 = v72[7];
          uint64_t v73 = v72[8];
          uint64_t v76 = v72[9];
        }

        else
        {
          uint64_t v73 = -1LL;
          uint64_t v74 = -1LL;
          uint64_t v75 = -1LL;
          uint64_t v76 = -1LL;
        }

        v217 = *(void **)(v3 + 168);
        if (v217)
        {
          uint64_t v219 = v217[6];
          uint64_t v220 = v217[7];
          uint64_t v218 = v217[8];
          uint64_t v221 = v217[9];
        }

        else
        {
          uint64_t v218 = -1LL;
          uint64_t v219 = -1LL;
          uint64_t v220 = -1LL;
          uint64_t v221 = -1LL;
        }

        v228 = "out";
        *(_DWORD *)__int128 buf = 136318210;
        v308 = (char *)out;
        __int16 v309 = 1024;
        if (v300) {
          v228 = "in";
        }
        int v310 = v71;
        __int16 v311 = 2048;
        uint64_t v312 = v74;
        __int16 v313 = 2048;
        size_t v314 = v75;
        __int16 v315 = 2048;
        unint64_t v316 = v73;
        __int16 v317 = 2048;
        uint64_t v318 = v76;
        __int16 v319 = 2048;
        uint64_t v320 = v219;
        __int16 v321 = 2048;
        uint64_t v322 = v220;
        __int16 v323 = 2048;
        uint64_t v324 = v218;
        __int16 v325 = 2048;
        uint64_t v326 = v221;
        __int16 v327 = 2080;
        size_t v328 = (size_t)v228;
        __int16 v329 = 2048;
        unint64_t v330 = v46;
        __int16 v331 = 1024;
        LODWORD(v332) = v49;
        __int16 v184 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]all %sbound "
               "pending bytes already passed (%llu > %u), not filtering";
        uint64_t v185 = v69;
        uint32_t v186 = 124;
LABEL_245:
        _os_log_debug_impl(&dword_187528000, v185, OS_LOG_TYPE_DEBUG, v184, buf, v186);
      }
    }

    else if (v70)
    {
      uint64_t v80 = *(void *)(v3 + 80);
      if (v80) {
        LODWORD(v80) = nw_parameters_get_ip_protocol();
      }
      uint64_t v81 = *(unsigned int *)(v3 + 176);
      else {
        __int16 v82 = (&off_18A06EDE8)[v81];
      }
      v222 = "out";
      *(_DWORD *)__int128 buf = 136316418;
      v308 = (char *)out;
      __int16 v309 = 1024;
      if (v300) {
        v222 = "in";
      }
      int v310 = v80;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v82;
      __int16 v313 = 2080;
      size_t v314 = (size_t)v222;
      __int16 v315 = 2048;
      unint64_t v316 = v46;
      __int16 v317 = 1024;
      LODWORD(v318) = v49;
      __int16 v184 = "[filter %s %d %s] all %sbound pending bytes already passed (%llu > %u), not filtering";
      uint64_t v185 = v69;
      uint32_t v186 = 54;
      goto LABEL_245;
    }

    return 1LL;
  }

  if (v45 >= v49 - v46 + v43) {
    unint64_t v45 = v49 - v46 + v43;
  }
  uint64_t v77 = v46 + v10;
  if (v45 <= v46 + v10)
  {
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v83 = *(_DWORD *)(v3 + 176);
    __int16 v84 = (os_log_s *)ne_log_obj();
    BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG);
    if (v83 == 3)
    {
      if (!v85) {
        return 0LL;
      }
      uint64_t v86 = *(void *)(v3 + 80);
      if (v86) {
        LODWORD(v86) = nw_parameters_get_ip_protocol();
      }
      uint64_t v87 = *(void **)(v3 + 160);
      if (v87)
      {
        uint64_t v89 = v87[6];
        uint64_t v90 = v87[7];
        uint64_t v88 = v87[8];
        uint64_t v91 = v87[9];
      }

      else
      {
        uint64_t v88 = -1LL;
        uint64_t v89 = -1LL;
        uint64_t v90 = -1LL;
        uint64_t v91 = -1LL;
      }

      v229 = *(void **)(v3 + 168);
      if (v229)
      {
        uint64_t v231 = v229[6];
        uint64_t v232 = v229[7];
        uint64_t v230 = v229[8];
        uint64_t v233 = v229[9];
      }

      else
      {
        uint64_t v230 = -1LL;
        uint64_t v231 = -1LL;
        uint64_t v232 = -1LL;
        uint64_t v233 = -1LL;
      }

      v308 = (char *)out;
      v238 = "out";
      __int16 v309 = 1024;
      *(_DWORD *)__int128 buf = 136318210;
      if (v300) {
        v238 = "in";
      }
      int v310 = v86;
      __int16 v311 = 2048;
      uint64_t v312 = v89;
      __int16 v313 = 2048;
      size_t v314 = v90;
      __int16 v315 = 2048;
      unint64_t v316 = v88;
      __int16 v317 = 2048;
      uint64_t v318 = v91;
      __int16 v319 = 2048;
      uint64_t v320 = v231;
      __int16 v321 = 2048;
      uint64_t v322 = v232;
      __int16 v323 = 2048;
      uint64_t v324 = v230;
      __int16 v325 = 2048;
      uint64_t v326 = v233;
      __int16 v327 = 2080;
      size_t v328 = (size_t)v238;
      __int16 v329 = 2048;
      unint64_t v330 = v45;
      __int16 v331 = 2048;
      unint64_t v332 = v77;
      v235 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound byt"
             "es to filter (%llu <= %llu)";
      v236 = v84;
      uint32_t v237 = 128;
    }

    else
    {
      if (!v85) {
        return 0LL;
      }
      uint64_t v117 = *(void *)(v3 + 80);
      if (v117) {
        LODWORD(v117) = nw_parameters_get_ip_protocol();
      }
      uint64_t v118 = *(unsigned int *)(v3 + 176);
      else {
        uint64_t v119 = (&off_18A06EDE8)[v118];
      }
      v308 = (char *)out;
      v234 = "out";
      __int16 v309 = 1024;
      *(_DWORD *)__int128 buf = 136316418;
      if (v300) {
        v234 = "in";
      }
      int v310 = v117;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v119;
      __int16 v313 = 2080;
      size_t v314 = (size_t)v234;
      __int16 v315 = 2048;
      unint64_t v316 = v45;
      __int16 v317 = 2048;
      uint64_t v318 = v77;
      v235 = "[filter %s %d %s] no %sbound bytes to filter (%llu <= %llu)";
      v236 = v84;
      uint32_t v237 = 58;
    }

LABEL_259:
    _os_log_debug_impl(&dword_187528000, v236, OS_LOG_TYPE_DEBUG, v235, buf, v237);
    return 0LL;
  }

  size_t v78 = v45 - v43;
  if ((v45 - v43) >> 32)
  {
    uint64_t v79 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v79, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)__int128 buf = 134217984;
    v308 = (char *)(v45 - v43);
    _os_log_fault_impl(&dword_187528000, v79, OS_LOG_TYPE_FAULT, "frameArraySendLength too big %llu", buf, 0xCu);
    return 0LL;
  }

  os_log_t loga = (os_log_t)malloc(v45 - v43);
  if (!loga)
  {
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v120 = *(_DWORD *)(v3 + 176);
    uint64_t v121 = (os_log_s *)ne_log_obj();
    BOOL v122 = os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG);
    if (v120 == 3)
    {
      if (!v122) {
        return 0LL;
      }
      uint64_t v123 = *(void *)(v3 + 80);
      if (v123) {
        LODWORD(v123) = nw_parameters_get_ip_protocol();
      }
      __int16 v124 = *(void **)(v3 + 160);
      if (v124)
      {
        uint64_t v126 = v124[6];
        uint64_t v127 = v124[7];
        uint64_t v125 = v124[8];
        uint64_t v128 = v124[9];
      }

      else
      {
        uint64_t v125 = -1LL;
        uint64_t v126 = -1LL;
        uint64_t v127 = -1LL;
        uint64_t v128 = -1LL;
      }

      v248 = *(void **)(v3 + 168);
      if (v248)
      {
        uint64_t v250 = v248[6];
        uint64_t v251 = v248[7];
        uint64_t v249 = v248[8];
        uint64_t v252 = v248[9];
      }

      else
      {
        uint64_t v249 = -1LL;
        uint64_t v250 = -1LL;
        uint64_t v251 = -1LL;
        uint64_t v252 = -1LL;
      }

      *(_DWORD *)__int128 buf = 136317698;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v123;
      __int16 v311 = 2048;
      uint64_t v312 = v126;
      __int16 v313 = 2048;
      size_t v314 = v127;
      __int16 v315 = 2048;
      unint64_t v316 = v125;
      __int16 v317 = 2048;
      uint64_t v318 = v128;
      __int16 v319 = 2048;
      uint64_t v320 = v250;
      __int16 v321 = 2048;
      uint64_t v322 = v251;
      __int16 v323 = 2048;
      uint64_t v324 = v249;
      __int16 v325 = 2048;
      uint64_t v326 = v252;
      __int16 v327 = 2048;
      size_t v328 = v78;
      v235 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]failed to malloc %zu bytes";
      v236 = v121;
      uint32_t v237 = 108;
    }

    else
    {
      if (!v122) {
        return 0LL;
      }
      uint64_t v141 = *(void *)(v3 + 80);
      if (v141) {
        LODWORD(v141) = nw_parameters_get_ip_protocol();
      }
      uint64_t v142 = *(unsigned int *)(v3 + 176);
      else {
        uint64_t v143 = (&off_18A06EDE8)[v142];
      }
      *(_DWORD *)__int128 buf = 136315906;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v141;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v143;
      __int16 v313 = 2048;
      size_t v314 = v78;
      v235 = "[filter %s %d %s] failed to malloc %zu bytes";
      v236 = v121;
      uint32_t v237 = 38;
    }

    goto LABEL_259;
  }

  uint64_t v293 = a1;
  uint64_t v92 = nw_frame_array_first();
  size_t v297 = v45 - v43;
  size_t v299 = v78 + v46;
  if (v78 + v46 && v92 && v45 != v43)
  {
    size_t v93 = 0LL;
    unint64_t v94 = 0LL;
    do
    {
      *(_DWORD *)__int128 buf = 0;
      uint64_t v95 = nw_frame_unclaimed_bytes();
      if (v46 <= v94) {
        unsigned int v96 = 0;
      }
      else {
        unsigned int v96 = v46 - v94;
      }
      uint64_t v97 = *(unsigned int *)buf;
      if (*(_DWORD *)buf <= v96)
      {
        size_t v98 = v299;
      }

      else
      {
        size_t v98 = v299;
        if (v299 - (v94 + v96) >= *(_DWORD *)buf - v96) {
          size_t v99 = *(_DWORD *)buf - v96;
        }
        else {
          size_t v99 = v299 - (v94 + v96);
        }
        memcpy((char *)loga + v93, (const void *)(v95 + v96), v99);
        v93 += v99;
        size_t v78 = v297;
      }

      v94 += v97;
      uint64_t v100 = nw_frame_array_next();
    }

    while (v94 < v98 && v100 != 0 && v93 < v78);
  }

  xpc_object_t v103 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uuid(v103, "flow-uuid", (const unsigned __int8 *)v3);
  unsigned int ip_protocol = nw_parameters_get_ip_protocol();
  xpc_dictionary_set_uint64(v103, "ip-protocol", ip_protocol);
  if (!v300)
  {
    xpc_dictionary_set_uint64(v103, "pending-data-start-offset", *v303);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v129 = *(_DWORD *)(v3 + 176);
    __int16 v130 = (os_log_s *)ne_log_obj();
    BOOL v131 = os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG);
    uint64_t v105 = v302;
    size_t v109 = v299;
    uint64_t v110 = v293;
    if (v129 == 3)
    {
      if (v131)
      {
        uint64_t v132 = *(void *)(v3 + 80);
        if (v132) {
          LODWORD(v132) = nw_parameters_get_ip_protocol();
        }
        uint64_t v133 = *(void **)(v3 + 160);
        if (v133)
        {
          uint64_t v135 = v133[6];
          uint64_t v136 = v133[7];
          uint64_t v134 = v133[8];
          uint64_t v137 = v133[9];
        }

        else
        {
          uint64_t v134 = -1LL;
          uint64_t v135 = -1LL;
          uint64_t v136 = -1LL;
          uint64_t v137 = -1LL;
        }

        v258 = *(void **)(v3 + 168);
        if (v258)
        {
          uint64_t v260 = v258[6];
          uint64_t v261 = v258[7];
          uint64_t v259 = v258[8];
          uint64_t v262 = v258[9];
        }

        else
        {
          uint64_t v259 = -1LL;
          uint64_t v260 = -1LL;
          uint64_t v261 = -1LL;
          uint64_t v262 = -1LL;
        }

        uint64_t v290 = *v303;
        *(_DWORD *)__int128 buf = 136317954;
        v308 = (char *)out;
        __int16 v309 = 1024;
        int v310 = v132;
        __int16 v311 = 2048;
        uint64_t v312 = v135;
        __int16 v313 = 2048;
        size_t v314 = v136;
        __int16 v315 = 2048;
        unint64_t v316 = v134;
        __int16 v317 = 2048;
        uint64_t v318 = v137;
        __int16 v319 = 2048;
        uint64_t v320 = v260;
        __int16 v321 = 2048;
        uint64_t v322 = v261;
        __int16 v323 = 2048;
        uint64_t v324 = v259;
        __int16 v325 = 2048;
        uint64_t v326 = v262;
        __int16 v327 = 2048;
        size_t v328 = v297;
        __int16 v329 = 2048;
        unint64_t v330 = v290;
        v282 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering %z"
               "u output bytes at offset %llu";
        v283 = v130;
        uint32_t v284 = 118;
LABEL_304:
        _os_log_debug_impl(&dword_187528000, v283, OS_LOG_TYPE_DEBUG, v282, buf, v284);
      }
    }

    else if (v131)
    {
      uint64_t v242 = *(void *)(v3 + 80);
      if (v242) {
        LODWORD(v242) = nw_parameters_get_ip_protocol();
      }
      uint64_t v243 = *(unsigned int *)(v3 + 176);
      else {
        v244 = (&off_18A06EDE8)[v243];
      }
      uint64_t v281 = *v303;
      *(_DWORD *)__int128 buf = 136316162;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v242;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v244;
      __int16 v313 = 2048;
      size_t v314 = v297;
      __int16 v315 = 2048;
      unint64_t v316 = v281;
      v282 = "[filter %s %d %s] filtering %zu output bytes at offset %llu";
      v283 = v130;
      uint32_t v284 = 48;
      goto LABEL_304;
    }

    unsigned int v144 = 7;
    goto LABEL_145;
  }

  uint64_t v105 = v302;
  xpc_dictionary_set_uint64(v103, "pending-data-start-offset", *v302);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v106 = *(_DWORD *)(v3 + 176);
  uint64_t v107 = (os_log_s *)ne_log_obj();
  BOOL v108 = os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG);
  size_t v109 = v299;
  uint64_t v110 = v293;
  if (v106 == 3)
  {
    if (v108)
    {
      uint64_t v111 = *(void *)(v3 + 80);
      if (v111) {
        LODWORD(v111) = nw_parameters_get_ip_protocol();
      }
      uint64_t v112 = *(void **)(v3 + 160);
      if (v112)
      {
        uint64_t v114 = v112[6];
        uint64_t v115 = v112[7];
        uint64_t v113 = v112[8];
        uint64_t v116 = v112[9];
      }

      else
      {
        uint64_t v113 = -1LL;
        uint64_t v114 = -1LL;
        uint64_t v115 = -1LL;
        uint64_t v116 = -1LL;
      }

      v253 = *(void **)(v3 + 168);
      if (v253)
      {
        uint64_t v255 = v253[6];
        uint64_t v256 = v253[7];
        uint64_t v254 = v253[8];
        uint64_t v257 = v253[9];
      }

      else
      {
        uint64_t v254 = -1LL;
        uint64_t v255 = -1LL;
        uint64_t v256 = -1LL;
        uint64_t v257 = -1LL;
      }

      uint64_t v289 = *v302;
      *(_DWORD *)__int128 buf = 136317954;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v111;
      __int16 v311 = 2048;
      uint64_t v312 = v114;
      __int16 v313 = 2048;
      size_t v314 = v115;
      __int16 v315 = 2048;
      unint64_t v316 = v113;
      __int16 v317 = 2048;
      uint64_t v318 = v116;
      __int16 v319 = 2048;
      uint64_t v320 = v255;
      __int16 v321 = 2048;
      uint64_t v322 = v256;
      __int16 v323 = 2048;
      uint64_t v324 = v254;
      __int16 v325 = 2048;
      uint64_t v326 = v257;
      __int16 v327 = 2048;
      size_t v328 = v297;
      __int16 v329 = 2048;
      unint64_t v330 = v289;
      v278 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering %zu "
             "input bytes at offset %llu";
      v279 = v107;
      uint32_t v280 = 118;
LABEL_301:
      _os_log_debug_impl(&dword_187528000, v279, OS_LOG_TYPE_DEBUG, v278, buf, v280);
    }
  }

  else if (v108)
  {
    uint64_t v239 = *(void *)(v3 + 80);
    if (v239) {
      LODWORD(v239) = nw_parameters_get_ip_protocol();
    }
    uint64_t v240 = *(unsigned int *)(v3 + 176);
    else {
      v241 = (&off_18A06EDE8)[v240];
    }
    uint64_t v277 = *v302;
    *(_DWORD *)__int128 buf = 136316162;
    v308 = (char *)out;
    __int16 v309 = 1024;
    int v310 = v239;
    __int16 v311 = 2080;
    uint64_t v312 = (uint64_t)v241;
    __int16 v313 = 2048;
    size_t v314 = v297;
    __int16 v315 = 2048;
    unint64_t v316 = v277;
    v278 = "[filter %s %d %s] filtering %zu input bytes at offset %llu";
    v279 = v107;
    uint32_t v280 = 48;
    goto LABEL_301;
  }

  unsigned int v144 = 8;
LABEL_145:
  xpc_dictionary_set_int64(v103, "command", v144);
  uint64_t v145 = *(nw_endpoint **)(v3 + 64);
  if (v145)
  {
    if (nw_endpoint_get_type(v145) == nw_endpoint_type_address)
    {
      uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v3 + 64));
      if (address) {
        xpc_dictionary_set_data(v103, "local-addr", address, address->sa_len);
      }
    }
  }

  uint64_t v147 = *(nw_endpoint **)(v3 + 72);
  if (v147)
  {
    nw_endpoint_type_t type = nw_endpoint_get_type(v147);
    v149 = *(nw_endpoint **)(v3 + 72);
    if (type == nw_endpoint_type_address)
    {
      __int16 v150 = nw_endpoint_get_address(v149);
      if (!v150) {
        goto LABEL_156;
      }
      p_size_t sa_len = &v150->sa_len;
      size_t sa_len = v150->sa_len;
    }

    else
    {
      ne_filter_create_wildcard_remote_sockaddr((uint64_t)buf, v3);
      size_t sa_len = buf[0];
      p_size_t sa_len = buf;
    }

    xpc_dictionary_set_data(v103, "remote-addr", p_sa_len, sa_len);
  }

LABEL_156:
  xpc_dictionary_set_data(v103, "data", loga, v297);
  free(loga);
  if (!v300)
  {
    uint64_t v153 = (int *)(a2 + 104);
    uint64_t *v303 = v109 + *(void *)(a2 + 104);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v164 = *(_DWORD *)(v3 + 176);
    uint64_t v165 = (os_log_s *)ne_log_obj();
    BOOL v166 = os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG);
    if (v164 == 3)
    {
      if (v166)
      {
        uint64_t v167 = *(void *)(v3 + 80);
        if (v167) {
          LODWORD(v167) = nw_parameters_get_ip_protocol();
        }
        v168 = *(void **)(v3 + 160);
        if (v168)
        {
          uint64_t v170 = v168[6];
          uint64_t v171 = v168[7];
          uint64_t v169 = v168[8];
          uint64_t v172 = v168[9];
        }

        else
        {
          uint64_t v169 = -1LL;
          uint64_t v170 = -1LL;
          uint64_t v171 = -1LL;
          uint64_t v172 = -1LL;
        }

        v268 = *(void **)(v3 + 168);
        if (v268)
        {
          uint64_t v270 = v268[6];
          uint64_t v271 = v268[7];
          uint64_t v269 = v268[8];
          uint64_t v272 = v268[9];
        }

        else
        {
          uint64_t v269 = -1LL;
          uint64_t v270 = -1LL;
          uint64_t v271 = -1LL;
          uint64_t v272 = -1LL;
        }

        uint64_t v292 = *v303;
        *(_DWORD *)__int128 buf = 136317698;
        v308 = (char *)out;
        __int16 v309 = 1024;
        int v310 = v167;
        __int16 v311 = 2048;
        uint64_t v312 = v170;
        __int16 v313 = 2048;
        size_t v314 = v171;
        __int16 v315 = 2048;
        unint64_t v316 = v169;
        __int16 v317 = 2048;
        uint64_t v318 = v172;
        __int16 v319 = 2048;
        uint64_t v320 = v270;
        __int16 v321 = 2048;
        uint64_t v322 = v271;
        __int16 v323 = 2048;
        uint64_t v324 = v269;
        __int16 v325 = 2048;
        uint64_t v326 = v272;
        __int16 v327 = 2048;
        size_t v328 = v292;
        v286 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]outbound sen"
               "t offset is now %llu";
        v287 = v165;
        uint32_t v288 = 108;
LABEL_310:
        _os_log_debug_impl(&dword_187528000, v287, OS_LOG_TYPE_DEBUG, v286, buf, v288);
      }
    }

    else if (v166)
    {
      uint64_t v245 = *(void *)(v3 + 80);
      if (v245) {
        LODWORD(v245) = nw_parameters_get_ip_protocol();
      }
      uint64_t v246 = *(unsigned int *)(v3 + 176);
      else {
        v247 = (&off_18A06EDE8)[v246];
      }
      uint64_t v285 = *v303;
      *(_DWORD *)__int128 buf = 136315906;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v245;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v247;
      __int16 v313 = 2048;
      size_t v314 = v285;
      v286 = "[filter %s %d %s] outbound sent offset is now %llu";
      v287 = v165;
      uint32_t v288 = 38;
      goto LABEL_310;
    }

    uint64_t v157 = v303;
    goto LABEL_176;
  }

  uint64_t v153 = (int *)(a2 + 88);
  *uint64_t v105 = v109 + *(void *)(a2 + 88);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v154 = *(_DWORD *)(v3 + 176);
  uint64_t v155 = (os_log_s *)ne_log_obj();
  BOOL v156 = os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG);
  if (v154 == 3)
  {
    uint64_t v157 = v302;
    if (v156)
    {
      uint64_t v158 = *(void *)(v3 + 80);
      if (v158) {
        LODWORD(v158) = nw_parameters_get_ip_protocol();
      }
      uint64_t v159 = *(void **)(v3 + 160);
      if (v159)
      {
        uint64_t v161 = v159[6];
        uint64_t v162 = v159[7];
        uint64_t v160 = v159[8];
        uint64_t v163 = v159[9];
      }

      else
      {
        uint64_t v160 = -1LL;
        uint64_t v161 = -1LL;
        uint64_t v162 = -1LL;
        uint64_t v163 = -1LL;
      }

      v263 = *(void **)(v3 + 168);
      if (v263)
      {
        uint64_t v265 = v263[6];
        uint64_t v266 = v263[7];
        uint64_t v264 = v263[8];
        uint64_t v267 = v263[9];
      }

      else
      {
        uint64_t v264 = -1LL;
        uint64_t v265 = -1LL;
        uint64_t v266 = -1LL;
        uint64_t v267 = -1LL;
      }

      uint64_t v291 = *v302;
      *(_DWORD *)__int128 buf = 136317698;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v158;
      __int16 v311 = 2048;
      uint64_t v312 = v161;
      __int16 v313 = 2048;
      size_t v314 = v162;
      __int16 v315 = 2048;
      unint64_t v316 = v160;
      __int16 v317 = 2048;
      uint64_t v318 = v163;
      __int16 v319 = 2048;
      uint64_t v320 = v265;
      __int16 v321 = 2048;
      uint64_t v322 = v266;
      __int16 v323 = 2048;
      uint64_t v324 = v264;
      __int16 v325 = 2048;
      uint64_t v326 = v267;
      __int16 v327 = 2048;
      size_t v328 = v291;
      v274 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]inbound sent o"
             "ffset is now %llu";
      v275 = v155;
      uint32_t v276 = 108;
LABEL_307:
      _os_log_debug_impl(&dword_187528000, v275, OS_LOG_TYPE_DEBUG, v274, buf, v276);
    }
  }

  else
  {
    uint64_t v157 = v302;
    if (v156)
    {
      uint64_t v173 = *(void *)(v3 + 80);
      if (v173) {
        LODWORD(v173) = nw_parameters_get_ip_protocol();
      }
      uint64_t v174 = *(unsigned int *)(v3 + 176);
      else {
        uint64_t v175 = (&off_18A06EDE8)[v174];
      }
      uint64_t v273 = *v302;
      *(_DWORD *)__int128 buf = 136315906;
      v308 = (char *)out;
      __int16 v309 = 1024;
      int v310 = v173;
      __int16 v311 = 2080;
      uint64_t v312 = (uint64_t)v175;
      __int16 v313 = 2048;
      size_t v314 = v273;
      v274 = "[filter %s %d %s] inbound sent offset is now %llu";
      v275 = v155;
      uint32_t v276 = 38;
      goto LABEL_307;
    }
  }

LABEL_176:
  int v176 = *(_DWORD *)v157;
  int v177 = *v153;
  if (!*(_DWORD *)(v3 + 124))
  {
    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v3, (uint64_t)buf, out, 0))
    {
      xpc_dictionary_set_data(v103, "crypto-signature", buf, out[0]);
    }

    else
    {
      v207 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v306 = 0;
        _os_log_error_impl( &dword_187528000,  v207,  OS_LOG_TYPE_ERROR,  "Failed to generate signature for data message",  v306,  2u);
      }
    }
  }

  int v208 = v176 - v177;
  do
    unsigned int v209 = __ldaxr(v7);
  while (__stlxr(v209 + 1, v7));
  v210 = *(os_unfair_lock_s **)(v3 + 96);
  unsigned int v211 = *(_DWORD *)(a2 + 4);
  v304[0] = MEMORY[0x1895F87A8];
  v304[1] = 0x40000000LL;
  v304[2] = __ne_filter_data_protocol_send_data_block_invoke;
  v304[3] = &__block_descriptor_tmp_33;
  v304[4] = v3;
  v304[5] = v297;
  unsigned int v305 = v144;
  v304[6] = v110;
  v304[7] = a2;
  ne_filter_send_message(v210, v211, v103, v304);
  xpc_release(v103);
  return v301 == v208;
}

uint64_t ne_filter_protocol_fulfill_frame_request( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, _DWORD *a7)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a2)
  {
    unint64_t v16 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_filter_protocol_fulfill_frame_request";
    unint64_t v13 = "%s called with null source_array";
    goto LABEL_19;
  }

  if (!a3)
  {
    unint64_t v16 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_filter_protocol_fulfill_frame_request";
    unint64_t v13 = "%s called with null destination_array";
LABEL_19:
    unsigned int v14 = v16;
    uint32_t v15 = 12;
    goto LABEL_14;
  }

  if (!a5 || !a6)
  {
    uint64_t v11 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    LODWORD(buf) = 67109632;
    DWORD1(buf) = a5;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = 0;
    HIWORD(buf) = 1024;
    LODWORD(v22) = a6;
    unint64_t v13 = "invalid values for frame request, max %u, min %u, max frame %u";
    unsigned int v14 = v11;
    uint32_t v15 = 20;
LABEL_14:
    _os_log_fault_impl(&dword_187528000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&buf, v15);
    return 0LL;
  }

  nw_frame_array_init();
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2000000000LL;
  int v23 = 0;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  int v20 = 0;
  nw_frame_array_foreach();
  if (a7) {
    *a7 = *((_DWORD *)v18 + 6);
  }
  if ((nw_frame_array_is_empty() & 1) == 0) {
    nw_frame_array_foreach();
  }
  uint64_t v10 = *(unsigned int *)(*((void *)&buf + 1) + 24LL);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);
  return v10;
}

BOOL __ne_filter_protocol_fulfill_frame_request_block_invoke(uint64_t a1)
{
  uint64_t v104 = *MEMORY[0x1895F89C0];
  unsigned int v2 = nw_frame_unclaimed_length();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unsigned int v4 = *(_DWORD *)(v3 + 24);
  unsigned int v5 = *(_DWORD *)(a1 + 84);
  size_t v6 = v5 - v4;
  if (v5 <= v4) {
    return 0LL;
  }
  unsigned int v7 = v2;
  if (v6 >= v2)
  {
    *(_DWORD *)(v3 + 24) = v4 + v2;
    nw_frame_array_remove();
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    int v15 = *(_DWORD *)(*(void *)(a1 + 48) + 176LL);
    unint64_t v16 = (os_log_s *)ne_log_obj();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15 == 3)
    {
      if (v17)
      {
        uint64_t v18 = *(void **)(a1 + 48);
        uint64_t v19 = v18[10];
        if (v19)
        {
          LODWORD(v19) = nw_parameters_get_ip_protocol();
          uint64_t v18 = *(void **)(a1 + 48);
        }

        int v20 = (void *)v18[20];
        if (v20)
        {
          uint64_t v22 = v20[6];
          uint64_t v23 = v20[7];
          uint64_t v21 = v20[8];
          uint64_t v24 = v20[9];
        }

        else
        {
          uint64_t v21 = -1LL;
          uint64_t v22 = -1LL;
          uint64_t v23 = -1LL;
          uint64_t v24 = -1LL;
        }

        unint64_t v46 = (void *)v18[21];
        if (v46)
        {
          uint64_t v48 = v46[6];
          uint64_t v49 = v46[7];
          uint64_t v47 = v46[8];
          uint64_t v50 = v46[9];
        }

        else
        {
          uint64_t v47 = -1LL;
          uint64_t v48 = -1LL;
          uint64_t v49 = -1LL;
          uint64_t v50 = -1LL;
        }

        *(_DWORD *)__int128 buf = 136317698;
        uint64_t v79 = out;
        __int16 v80 = 1024;
        int v81 = v19;
        __int16 v82 = 2048;
        uint64_t v83 = v22;
        __int16 v84 = 2048;
        *(void *)BOOL v85 = v23;
        *(_WORD *)&v85[8] = 2048;
        uint64_t v86 = v21;
        __int16 v87 = 2048;
        uint64_t v88 = v24;
        __int16 v89 = 2048;
        uint64_t v90 = v48;
        __int16 v91 = 2048;
        uint64_t v92 = v49;
        __int16 v93 = 2048;
        uint64_t v94 = v47;
        __int16 v95 = 2048;
        uint64_t v96 = v50;
        __int16 v97 = 1024;
        int v98 = v7;
        uint64_t v51 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]Moving entire"
              " frame (%u bytes)";
        uint64_t v52 = v16;
        uint32_t v53 = 104;
        goto LABEL_49;
      }
    }

    else if (v17)
    {
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(v25 + 80);
      if (v26)
      {
        LODWORD(v26) = nw_parameters_get_ip_protocol();
        uint64_t v25 = *(void *)(a1 + 48);
      }

      uint64_t v27 = *(unsigned int *)(v25 + 176);
      else {
        uint64_t v28 = (&off_18A06EDE8)[v27];
      }
      *(_DWORD *)__int128 buf = 136315906;
      uint64_t v79 = out;
      __int16 v80 = 1024;
      int v81 = v26;
      __int16 v82 = 2080;
      uint64_t v83 = (uint64_t)v28;
      __int16 v84 = 1024;
      *(_DWORD *)BOOL v85 = v7;
      uint64_t v51 = "[filter %s %d %s] Moving entire frame (%u bytes)";
      uint64_t v52 = v16;
      uint32_t v53 = 34;
      goto LABEL_49;
    }

    goto LABEL_41;
  }

  if (!*(_BYTE *)(a1 + 88))
  {
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    int v29 = *(_DWORD *)(*(void *)(a1 + 48) + 176LL);
    uint64_t v30 = (os_log_s *)ne_log_obj();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
    if (v29 == 3)
    {
      if (!v31) {
        return 0LL;
      }
      uint64_t v32 = *(void **)(a1 + 48);
      uint64_t v33 = v32[10];
      if (v33)
      {
        LODWORD(v33) = nw_parameters_get_ip_protocol();
        uint64_t v32 = *(void **)(a1 + 48);
      }

      uint64_t v34 = (void *)v32[20];
      if (v34)
      {
        uint64_t v36 = v34[6];
        uint64_t v37 = v34[7];
        uint64_t v35 = v34[8];
        uint64_t v38 = v34[9];
      }

      else
      {
        uint64_t v35 = -1LL;
        uint64_t v36 = -1LL;
        uint64_t v37 = -1LL;
        uint64_t v38 = -1LL;
      }

      int v56 = (void *)v32[21];
      if (v56)
      {
        uint64_t v58 = v56[6];
        uint64_t v59 = v56[7];
        uint64_t v57 = v56[8];
        uint64_t v60 = v56[9];
      }

      else
      {
        uint64_t v57 = -1LL;
        uint64_t v58 = -1LL;
        uint64_t v59 = -1LL;
        uint64_t v60 = -1LL;
      }

      *(_DWORD *)__int128 buf = 136317442;
      uint64_t v79 = out;
      __int16 v80 = 1024;
      int v81 = v33;
      __int16 v82 = 2048;
      uint64_t v83 = v36;
      __int16 v84 = 2048;
      *(void *)BOOL v85 = v37;
      *(_WORD *)&v85[8] = 2048;
      uint64_t v86 = v35;
      __int16 v87 = 2048;
      uint64_t v88 = v38;
      __int16 v89 = 2048;
      uint64_t v90 = v58;
      __int16 v91 = 2048;
      uint64_t v92 = v59;
      __int16 v93 = 2048;
      uint64_t v94 = v57;
      __int16 v95 = 2048;
      uint64_t v96 = v60;
      uint64_t v61 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]skipping partia"
            "l frame, split frames not allowed";
      uint64_t v62 = v30;
      uint32_t v63 = 98;
    }

    else
    {
      if (!v31) {
        return 0LL;
      }
      uint64_t v41 = *(void *)(a1 + 48);
      uint64_t v42 = *(void *)(v41 + 80);
      if (v42)
      {
        LODWORD(v42) = nw_parameters_get_ip_protocol();
        uint64_t v41 = *(void *)(a1 + 48);
      }

      uint64_t v43 = *(unsigned int *)(v41 + 176);
      else {
        uint64_t v44 = (&off_18A06EDE8)[v43];
      }
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v79 = out;
      __int16 v80 = 1024;
      int v81 = v42;
      __int16 v82 = 2080;
      uint64_t v83 = (uint64_t)v44;
      uint64_t v61 = "[filter %s %d %s] skipping partial frame, split frames not allowed";
      uint64_t v62 = v30;
      uint32_t v63 = 28;
    }

    _os_log_debug_impl(&dword_187528000, v62, OS_LOG_TYPE_DEBUG, v61, buf, v63);
    return 0LL;
  }

  unsigned int v8 = calloc(1uLL, v5 - v4);
  if (v8)
  {
    uint64_t v9 = v8;
    if (nw_frame_create())
    {
      uint64_t v10 = (const void *)nw_frame_unclaimed_bytes();
      memcpy(v9, v10, v6);
      nw_frame_claim();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v6;
      uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
      int v11 = *(_DWORD *)(*(void *)(a1 + 48) + 176LL);
      uint64_t v12 = (os_log_s *)ne_log_obj();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11 == 3)
      {
        if (v13)
        {
          unsigned int v14 = *(void **)(a1 + 48);
          if (v14[10])
          {
            int ip_protocol = nw_parameters_get_ip_protocol();
            unsigned int v14 = *(void **)(a1 + 48);
          }

          else
          {
            int ip_protocol = 0;
          }

          uint64_t v64 = (void *)v14[20];
          if (v64)
          {
            uint64_t v74 = v64[7];
            uint64_t v75 = v64[6];
            uint64_t v68 = v64[8];
            uint64_t v65 = v64[9];
            uint64_t v76 = v68;
          }

          else
          {
            uint64_t v65 = -1LL;
            uint64_t v75 = -1LL;
            uint64_t v76 = -1LL;
            uint64_t v74 = -1LL;
          }

          __int16 v69 = (void *)v14[21];
          if (v69)
          {
            uint64_t v71 = v69[6];
            uint64_t v72 = v69[7];
            uint64_t v70 = v69[8];
            uint64_t v73 = v69[9];
          }

          else
          {
            uint64_t v70 = -1LL;
            uint64_t v71 = -1LL;
            uint64_t v72 = -1LL;
            uint64_t v73 = -1LL;
          }

          *(_DWORD *)__int128 buf = 136318210;
          uint64_t v79 = out;
          __int16 v80 = 1024;
          int v81 = ip_protocol;
          __int16 v82 = 2048;
          uint64_t v83 = v75;
          __int16 v84 = 2048;
          *(void *)BOOL v85 = v74;
          *(_WORD *)&v85[8] = 2048;
          uint64_t v86 = v76;
          __int16 v87 = 2048;
          uint64_t v88 = v65;
          __int16 v89 = 2048;
          uint64_t v90 = v71;
          __int16 v91 = 2048;
          uint64_t v92 = v72;
          __int16 v93 = 2048;
          uint64_t v94 = v70;
          __int16 v95 = 2048;
          uint64_t v96 = v73;
          __int16 v97 = 1024;
          int v98 = v6;
          __int16 v99 = 1024;
          unsigned int v100 = v7;
          __int16 v101 = 1024;
          int v102 = nw_frame_unclaimed_length();
          uint64_t v51 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]Moving part"
                "ial frame (%u bytes of %u, %u bytes remaining)";
          uint64_t v52 = v12;
          uint32_t v53 = 116;
LABEL_49:
          _os_log_debug_impl(&dword_187528000, v52, OS_LOG_TYPE_DEBUG, v51, buf, v53);
        }
      }

      else if (v13)
      {
        uint64_t v54 = *(void *)(a1 + 48);
        if (*(void *)(v54 + 80))
        {
          int v55 = nw_parameters_get_ip_protocol();
          uint64_t v54 = *(void *)(a1 + 48);
        }

        else
        {
          int v55 = 0;
        }

        uint64_t v66 = *(unsigned int *)(v54 + 176);
        else {
          __int16 v67 = (&off_18A06EDE8)[v66];
        }
        *(_DWORD *)__int128 buf = 136316418;
        uint64_t v79 = out;
        __int16 v80 = 1024;
        int v81 = v55;
        __int16 v82 = 2080;
        uint64_t v83 = (uint64_t)v67;
        __int16 v84 = 1024;
        *(_DWORD *)BOOL v85 = v6;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v7;
        LOWORD(v86) = 1024;
        *(_DWORD *)((char *)&v86 + 2) = nw_frame_unclaimed_length();
        uint64_t v51 = "[filter %s %d %s] Moving partial frame (%u bytes of %u, %u bytes remaining)";
        uint64_t v52 = v12;
        uint32_t v53 = 46;
        goto LABEL_49;
      }

LABEL_41:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      nw_frame_array_append();
      return 1LL;
    }

    unint64_t v45 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_fault_impl(&dword_187528000, v45, OS_LOG_TYPE_FAULT, "nw_frame_create with partial data failed", buf, 2u);
    }

    free(v9);
  }

  else
  {
    uint64_t v39 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v79) = v6;
    _os_log_fault_impl(&dword_187528000, v39, OS_LOG_TYPE_FAULT, "calloc(%u) failed", buf, 8u);
  }

  return 0LL;
}

uint64_t __ne_filter_protocol_fulfill_frame_request_block_invoke_35(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }

  return 1LL;
}

void ne_filter_partial_input_frame_finalizer(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int128 buffer = (void *)nw_frame_get_buffer();
    free(buffer);
    nw_frame_reset();
    nw_release(a1);
  }

  else
  {
    uint64_t v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v4 = 136315138;
      unsigned int v5 = "ne_filter_partial_input_frame_finalizer";
      _os_log_fault_impl(&dword_187528000, v3, OS_LOG_TYPE_FAULT, "%s called with null frame", (uint8_t *)&v4, 0xCu);
    }
  }

sockaddr *ne_filter_create_wildcard_remote_sockaddr(uint64_t a1, uint64_t a2)
{
  int v4 = *(nw_endpoint **)(a2 + 72);
  if (v4) {
    __int16 v5 = __rev16(nw_endpoint_get_port(v4));
  }
  else {
    __int16 v5 = 0;
  }
  BOOL result = *(sockaddr **)(a2 + 64);
  if (!result
    || (BOOL result = (sockaddr *)nw_endpoint_get_type((nw_endpoint_t)result), (_DWORD)result != 1)
    || (BOOL result = (sockaddr *)nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 64))) == 0LL)
  {
    *(void *)(a1 + 12) = 0LL;
    *(void *)(a1 + 4) = 0LL;
    *(void *)(a1 + 20) = 0LL;
    goto LABEL_10;
  }

  int sa_family = result->sa_family;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + 24) = 0;
  if (sa_family != 2)
  {
LABEL_10:
    *(_WORD *)a1 = 7708;
    *(_OWORD *)(a1 + 8) = *MEMORY[0x1895FB7E8];
    goto LABEL_11;
  }

  *(_WORD *)a1 = 528;
LABEL_11:
  *(_WORD *)(a1 + 2) = v5;
  return result;
}

uint64_t __ne_filter_data_protocol_send_data_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 176LL);
  __int16 v5 = (os_log_s *)ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      unsigned int v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        unsigned int v7 = *(void **)(a1 + 32);
      }

      uint64_t v9 = (void *)v7[20];
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }

      else
      {
        uint64_t v10 = -1LL;
        uint64_t v11 = -1LL;
        uint64_t v12 = -1LL;
        uint64_t v13 = -1LL;
      }

      uint64_t v19 = (void *)v7[21];
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }

      else
      {
        uint64_t v20 = -1LL;
        uint64_t v21 = -1LL;
        uint64_t v22 = -1LL;
        uint64_t v23 = -1LL;
      }

      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)__int128 buf = 136317698;
      uint64_t v30 = out;
      __int16 v31 = 1024;
      int v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = v11;
      __int16 v35 = 2048;
      uint64_t v36 = v12;
      __int16 v37 = 2048;
      uint64_t v38 = v10;
      __int16 v39 = 2048;
      uint64_t v40 = v13;
      __int16 v41 = 2048;
      uint64_t v42 = v21;
      __int16 v43 = 2048;
      uint64_t v44 = v22;
      __int16 v45 = 2048;
      uint64_t v46 = v20;
      __int16 v47 = 2048;
      uint64_t v48 = v23;
      __int16 v49 = 2048;
      uint64_t v50 = v28;
      uint64_t v25 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]send-data reply"
            " received for %zu bytes";
      uint64_t v26 = v5;
      uint32_t v27 = 108;
LABEL_20:
      _os_log_debug_impl(&dword_187528000, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
    }
  }

  else if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      uint64_t v15 = *(void *)(a1 + 32);
    }

    uint64_t v17 = *(unsigned int *)(v15 + 176);
    else {
      uint64_t v18 = (&off_18A06EDE8)[v17];
    }
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)__int128 buf = 136315906;
    uint64_t v30 = out;
    __int16 v31 = 1024;
    int v32 = v16;
    __int16 v33 = 2080;
    uint64_t v34 = (uint64_t)v18;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    uint64_t v25 = "[filter %s %d %s] send-data reply received for %zu bytes";
    uint64_t v26 = v5;
    uint32_t v27 = 38;
    goto LABEL_20;
  }

  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_data_block_invoke_30(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  unsigned int v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_4;
  }
  if (MEMORY[0x1895A89D8](*(void *)(a1 + 32)) != MEMORY[0x1895F9268])
  {
    if (MEMORY[0x1895A89D8](v2) == MEMORY[0x1895F9250]) {
      goto LABEL_8;
    }
LABEL_4:
    uint64_t v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      int v4 = "Got an invalid data message reply";
      __int16 v5 = v3;
      uint32_t v6 = 2;
LABEL_23:
      _os_log_error_impl(&dword_187528000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v17, v6);
      goto LABEL_7;
    }

    goto LABEL_7;
  }

  unsigned int v7 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1895F91B0]);
    int v17 = 136315138;
    uint64_t v18 = string;
    int v4 = "Got an error on the XPC connection when sending a data message: %s";
    __int16 v5 = v7;
    uint32_t v6 = 12;
    goto LABEL_23;
  }

BOOL __ne_filter_send_approved_frames_block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  unsigned int v2 = nw_frame_unclaimed_length();
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 104) + v2;
  unint64_t v5 = *(void *)(v3 + 64);
  if (v4 <= v5)
  {
    unsigned int v6 = v2;
    uint64_t v7 = v2;
    nw_frame_array_remove();
    nw_frame_array_append();
    *(void *)(*(void *)(a1 + 32) + 104LL) += v7;
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    LODWORD(v7) = *(_DWORD *)(*(void *)(a1 + 48) + 176LL);
    uint64_t v8 = (os_log_s *)ne_log_obj();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)v7 == 3)
    {
      if (v9)
      {
        uint64_t v10 = *(void **)(a1 + 48);
        uint64_t v11 = v10[10];
        if (v11)
        {
          LODWORD(v11) = nw_parameters_get_ip_protocol();
          uint64_t v10 = *(void **)(a1 + 48);
        }

        unsigned int v12 = (void *)v10[20];
        if (v12)
        {
          uint64_t v14 = v12[6];
          uint64_t v15 = v12[7];
          uint64_t v13 = v12[8];
          uint64_t v16 = v12[9];
        }

        else
        {
          uint64_t v13 = -1LL;
          uint64_t v14 = -1LL;
          uint64_t v15 = -1LL;
          uint64_t v16 = -1LL;
        }

        uint64_t v22 = (void *)v10[21];
        if (v22)
        {
          uint64_t v24 = v22[6];
          uint64_t v25 = v22[7];
          uint64_t v23 = v22[8];
          uint64_t v26 = v22[9];
        }

        else
        {
          uint64_t v23 = -1LL;
          uint64_t v24 = -1LL;
          uint64_t v25 = -1LL;
          uint64_t v26 = -1LL;
        }

        uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 104LL);
        int v32 = 136317954;
        __int16 v33 = out;
        __int16 v34 = 1024;
        int v35 = v11;
        __int16 v36 = 2048;
        uint64_t v37 = v14;
        __int16 v38 = 2048;
        *(void *)__int16 v39 = v15;
        *(_WORD *)&v39[8] = 2048;
        *(void *)&v39[10] = v13;
        __int16 v40 = 2048;
        uint64_t v41 = v16;
        __int16 v42 = 2048;
        uint64_t v43 = v24;
        __int16 v44 = 2048;
        uint64_t v45 = v25;
        __int16 v46 = 2048;
        uint64_t v47 = v23;
        __int16 v48 = 2048;
        uint64_t v49 = v26;
        __int16 v50 = 1024;
        unsigned int v51 = v6;
        __int16 v52 = 2048;
        uint64_t v53 = v31;
        uint64_t v28 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending frame"
              " with length %u, pendingOutputStartOffset is now %llu";
        int v29 = v8;
        uint32_t v30 = 114;
LABEL_21:
        _os_log_debug_impl(&dword_187528000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v32, v30);
      }
    }

    else if (v9)
    {
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = *(void *)(v18 + 80);
      if (v19)
      {
        LODWORD(v19) = nw_parameters_get_ip_protocol();
        uint64_t v18 = *(void *)(a1 + 48);
      }

      uint64_t v20 = *(unsigned int *)(v18 + 176);
      else {
        uint64_t v21 = (&off_18A06EDE8)[v20];
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 104LL);
      int v32 = 136316162;
      __int16 v33 = out;
      __int16 v34 = 1024;
      int v35 = v19;
      __int16 v36 = 2080;
      uint64_t v37 = (uint64_t)v21;
      __int16 v38 = 1024;
      *(_DWORD *)__int16 v39 = v6;
      *(_WORD *)&v39[4] = 2048;
      *(void *)&v39[6] = v27;
      uint64_t v28 = "[filter %s %d %s] sending frame with length %u, pendingOutputStartOffset is now %llu";
      int v29 = v8;
      uint32_t v30 = 44;
      goto LABEL_21;
    }
  }

  return v4 <= v5;
}

uint64_t __ne_filter_send_approved_frames_block_invoke_48()
{
  return 1LL;
}

void ne_filter_data_protocol_send_new_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    unint64_t v5 = (unsigned int *)(v2 + 180);
    do
      unsigned int v6 = __ldaxr(v5);
    while (__stlxr(v6, v5));
    if (!v6) {
      return;
    }
    int server_mode = nw_parameters_get_server_mode();
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v8, "command", 6LL);
    xpc_dictionary_set_uuid(v8, "flow-uuid", (const unsigned __int8 *)v2);
    unsigned int ip_protocol = nw_parameters_get_ip_protocol();
    xpc_dictionary_set_uint64(v8, "ip-protocol", ip_protocol);
    pid_t v10 = getpid();
    xpc_dictionary_set_uint64(v8, "client-pid", v10);
    int pid = nw_parameters_get_pid();
    xpc_dictionary_set_uint64(v8, "client-e-pid", pid);
    xpc_dictionary_set_uint64(v8, "connection-direction", server_mode ^ 1u);
    nw_parameters_get_proc_uuid();
    xpc_dictionary_set_uuid(v8, "client-proc-uuid", uuid);
    nw_parameters_get_e_proc_uuid();
    xpc_dictionary_set_uuid(v8, "client-e-proc-uuid", uu);
    effective_bundle_id = (const char *)nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id) {
      xpc_dictionary_set_string(v8, "source-app-bundle-id", effective_bundle_id);
    }
    uuid_unparse(uuid, out);
    uuid_unparse(uu, v66);
    uint64_t v13 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      pid_t v50 = getpid();
      int v36 = nw_parameters_get_pid();
      int length_4 = 67110402;
      uint64_t v37 = "(no bundle id)";
      *(_DWORD *)uint64_t v54 = v50;
      if (effective_bundle_id) {
        uint64_t v37 = effective_bundle_id;
      }
      *(_WORD *)&v54[4] = 1024;
      __int16 v38 = "OUT";
      *(_DWORD *)&v54[6] = v36;
      *(_WORD *)uint64_t v55 = 2080;
      *(void *)&v55[2] = out;
      if (server_mode) {
        __int16 v38 = "IN";
      }
      *(_WORD *)&v55[10] = 2080;
      *(void *)&v55[12] = v66;
      *(_WORD *)&v55[20] = 2080;
      *(void *)&v55[22] = v37;
      *(_WORD *)&v55[30] = 2080;
      *(void *)&v55[32] = v38;
      _os_log_debug_impl( &dword_187528000,  v13,  OS_LOG_TYPE_DEBUG,  "FILTER PROTOCOL: New flow info:\n \t\t\t\tpid:\t%d\n \t\t\t\tepid:\t%d\n \t\t\t\tuuid:\t%s\n \t\t\t\teuuid:\t%s\n \t\t\t\tbundle id: %s\n \t\t\t\tconnection Dir: %s",  (uint8_t *)&length_4,  0x36u);
    }

    uint64_t url = (const char *)nw_parameters_get_url();
    if (url) {
      xpc_dictionary_set_string(v8, "url", url);
    }
    uint64_t v15 = *(nw_endpoint **)(v2 + 64);
    if (v15)
    {
      if (nw_endpoint_get_type(v15) == nw_endpoint_type_address)
      {
        uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v2 + 64));
        if (address) {
          xpc_dictionary_set_data(v8, "local-addr", address, address->sa_len);
        }
      }
    }

    int v17 = *(nw_endpoint **)(v2 + 72);
    if (v17)
    {
      nw_endpoint_type_t type = nw_endpoint_get_type(v17);
      uint64_t v19 = *(nw_endpoint **)(v2 + 72);
      if (type == nw_endpoint_type_address)
      {
        uint64_t v20 = nw_endpoint_get_address(v19);
        if (v20) {
          xpc_dictionary_set_data(v8, "remote-addr", v20, v20->sa_len);
        }
        parent_endpoint_unint64_t domain = (const char *)nw_endpoint_get_parent_endpoint_domain();
      }

      else
      {
        ne_filter_create_wildcard_remote_sockaddr((uint64_t)&length_4, v2);
        xpc_dictionary_set_data(v8, "remote-addr", &length_4, length_4);
        parent_endpoint_unint64_t domain = nw_endpoint_get_hostname(*(nw_endpoint_t *)(v2 + 72));
      }

      xpc_dictionary_set_string(v8, "remote-hostname", parent_endpoint_domain);
    }

uint64_t __ne_filter_data_protocol_send_new_flow_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 176LL);
  unint64_t v5 = (os_log_s *)ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        uint64_t v7 = *(void **)(a1 + 32);
      }

      BOOL v9 = (void *)v7[20];
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }

      else
      {
        uint64_t v10 = -1LL;
        uint64_t v11 = -1LL;
        uint64_t v12 = -1LL;
        uint64_t v13 = -1LL;
      }

      uint64_t v19 = (void *)v7[21];
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }

      else
      {
        uint64_t v20 = -1LL;
        uint64_t v21 = -1LL;
        uint64_t v22 = -1LL;
        uint64_t v23 = -1LL;
      }

      *(_DWORD *)__int128 buf = 136317442;
      uint64_t v28 = out;
      __int16 v29 = 1024;
      int v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      int v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]received new flow xpc reply";
      uint64_t v25 = v5;
      uint32_t v26 = 98;
LABEL_20:
      _os_log_debug_impl(&dword_187528000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
  }

  else if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      uint64_t v15 = *(void *)(a1 + 32);
    }

    uint64_t v17 = *(unsigned int *)(v15 + 176);
    else {
      uint64_t v18 = (&off_18A06EDE8)[v17];
    }
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v28 = out;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 2080;
    uint64_t v32 = (uint64_t)v18;
    int v24 = "[filter %s %d %s] received new flow xpc reply";
    uint64_t v25 = v5;
    uint32_t v26 = 28;
    goto LABEL_20;
  }

  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_new_flow_block_invoke_61(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_4;
  }
  if (MEMORY[0x1895A89D8](*(void *)(a1 + 32)) != MEMORY[0x1895F9268])
  {
    if (MEMORY[0x1895A89D8](v2) == MEMORY[0x1895F9250]) {
      goto LABEL_8;
    }
LABEL_4:
    uint64_t v3 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      int v4 = "Got an invalid new flow message reply";
      unint64_t v5 = v3;
      uint32_t v6 = 2;
LABEL_23:
      _os_log_error_impl(&dword_187528000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v17, v6);
      goto LABEL_7;
    }

    goto LABEL_7;
  }

  uint64_t v7 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1895F91B0]);
    int v17 = 136315138;
    uint64_t v18 = string;
    int v4 = "Got an error on the XPC connection when sending a new flow message: %s";
    unint64_t v5 = v7;
    uint32_t v6 = 12;
    goto LABEL_23;
  }

void ne_filter_read_from_network(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v4 = (unsigned int *)(a1 + 180);
    do
      unsigned int v5 = __ldaxr(v4);
    while (__stlxr(v5, v4));
    if (v5)
    {
      if ((a3 & 1) != 0) {
        goto LABEL_10;
      }
      uint64_t v6 = *(void *)(a1 + 144);
      if (!v6) {
        goto LABEL_10;
      }
      while (*(_DWORD *)(v6 + 40) != 3 || *(void *)(v6 + 48) == -1LL)
      {
        uint64_t v6 = *(void *)(v6 + 152);
        if (!v6) {
          goto LABEL_10;
        }
      }

      unint64_t v30 = *(void *)(v6 + 88) + nw_frame_array_unclaimed_length();
      unint64_t v31 = *(void *)(v6 + 56);
      if (v31 > v30 && (_DWORD)v31 != (_DWORD)v30)
      {
LABEL_10:
        nw_frame_array_init();
        uint64_t v7 = *(void *)(a1 + 32);
        if (v7)
        {
          uint64_t v8 = *(uint64_t (**)(void))(*(void *)(v7 + 24) + 80LL);
          if (v8)
          {
            int v9 = v8();
            if (v9)
            {
              int v10 = v9;
              uuid_unparse((const unsigned __int8 *)a1, out);
              int v11 = *(_DWORD *)(a1 + 176);
              unsigned int v12 = (os_log_s *)ne_log_obj();
              BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
              if (v11 == 3)
              {
                if (v13)
                {
                  uint64_t v14 = *(void *)(a1 + 80);
                  if (v14) {
                    LODWORD(v14) = nw_parameters_get_ip_protocol();
                  }
                  uint64_t v15 = *(void **)(a1 + 160);
                  if (v15)
                  {
                    uint64_t v17 = v15[6];
                    uint64_t v18 = v15[7];
                    uint64_t v16 = v15[8];
                    uint64_t v19 = v15[9];
                  }

                  else
                  {
                    uint64_t v16 = -1LL;
                    uint64_t v17 = -1LL;
                    uint64_t v18 = -1LL;
                    uint64_t v19 = -1LL;
                  }

                  __int16 v39 = *(void **)(a1 + 168);
                  if (v39)
                  {
                    uint64_t v41 = v39[6];
                    uint64_t v42 = v39[7];
                    uint64_t v40 = v39[8];
                    uint64_t v43 = v39[9];
                  }

                  else
                  {
                    uint64_t v40 = -1LL;
                    uint64_t v41 = -1LL;
                    uint64_t v42 = -1LL;
                    uint64_t v43 = -1LL;
                  }

                  *(_DWORD *)__int128 buf = 136317698;
                  __int16 v56 = out;
                  __int16 v57 = 1024;
                  int v58 = v14;
                  __int16 v59 = 2048;
                  uint64_t v60 = v17;
                  __int16 v61 = 2048;
                  uint64_t v62 = v18;
                  __int16 v63 = 2048;
                  uint64_t v64 = v16;
                  __int16 v65 = 2048;
                  uint64_t v66 = v19;
                  __int16 v67 = 2048;
                  uint64_t v68 = v41;
                  __int16 v69 = 2048;
                  uint64_t v70 = v42;
                  __int16 v71 = 2048;
                  uint64_t v72 = v40;
                  __int16 v73 = 2048;
                  uint64_t v74 = v43;
                  __int16 v75 = 1024;
                  int v76 = v10;
                  uint64_t v44 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]rec"
                        "eived %u frames from output handler";
                  __int16 v45 = v12;
                  uint32_t v46 = 104;
LABEL_52:
                  _os_log_debug_impl(&dword_187528000, v45, OS_LOG_TYPE_DEBUG, v44, buf, v46);
                }
              }

              else if (v13)
              {
                uint64_t v33 = *(void *)(a1 + 80);
                if (v33) {
                  LODWORD(v33) = nw_parameters_get_ip_protocol();
                }
                uint64_t v34 = *(unsigned int *)(a1 + 176);
                else {
                  __int16 v35 = (&off_18A06EDE8)[v34];
                }
                *(_DWORD *)__int128 buf = 136315906;
                __int16 v56 = out;
                __int16 v57 = 1024;
                int v58 = v33;
                __int16 v59 = 2080;
                uint64_t v60 = (uint64_t)v35;
                __int16 v61 = 1024;
                LODWORD(v62) = v10;
                uint64_t v44 = "[filter %s %d %s] received %u frames from output handler";
                __int16 v45 = v12;
                uint32_t v46 = 34;
                goto LABEL_52;
              }

              nw_frame_array_append_array();
              return;
            }

            uuid_unparse((const unsigned __int8 *)a1, out);
            int v21 = *(_DWORD *)(a1 + 176);
            uint64_t v22 = (os_log_s *)ne_log_obj();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
            if (v21 == 3)
            {
              if (v23)
              {
                uint64_t v24 = *(void *)(a1 + 80);
                if (v24) {
                  LODWORD(v24) = nw_parameters_get_ip_protocol();
                }
                uint64_t v25 = *(void **)(a1 + 160);
                if (v25)
                {
                  uint64_t v27 = v25[6];
                  uint64_t v28 = v25[7];
                  uint64_t v26 = v25[8];
                  uint64_t v29 = v25[9];
                }

                else
                {
                  uint64_t v26 = -1LL;
                  uint64_t v27 = -1LL;
                  uint64_t v28 = -1LL;
                  uint64_t v29 = -1LL;
                }

                uint64_t v47 = *(void **)(a1 + 168);
                if (v47)
                {
                  uint64_t v49 = v47[6];
                  uint64_t v50 = v47[7];
                  uint64_t v48 = v47[8];
                  uint64_t v51 = v47[9];
                }

                else
                {
                  uint64_t v48 = -1LL;
                  uint64_t v49 = -1LL;
                  uint64_t v50 = -1LL;
                  uint64_t v51 = -1LL;
                }

                *(_DWORD *)__int128 buf = 136317442;
                __int16 v56 = out;
                __int16 v57 = 1024;
                int v58 = v24;
                __int16 v59 = 2048;
                uint64_t v60 = v27;
                __int16 v61 = 2048;
                uint64_t v62 = v28;
                __int16 v63 = 2048;
                uint64_t v64 = v26;
                __int16 v65 = 2048;
                uint64_t v66 = v29;
                __int16 v67 = 2048;
                uint64_t v68 = v49;
                __int16 v69 = 2048;
                uint64_t v70 = v50;
                __int16 v71 = 2048;
                uint64_t v72 = v48;
                __int16 v73 = 2048;
                uint64_t v74 = v51;
                __int16 v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no fr"
                      "ames returned from output handler";
                uint64_t v53 = v22;
                uint32_t v54 = 98;
LABEL_60:
                _os_log_debug_impl(&dword_187528000, v53, OS_LOG_TYPE_DEBUG, v52, buf, v54);
              }
            }

            else if (v23)
            {
              uint64_t v36 = *(void *)(a1 + 80);
              if (v36) {
                LODWORD(v36) = nw_parameters_get_ip_protocol();
              }
              uint64_t v37 = *(unsigned int *)(a1 + 176);
              else {
                uint64_t v38 = (&off_18A06EDE8)[v37];
              }
              *(_DWORD *)__int128 buf = 136315650;
              __int16 v56 = out;
              __int16 v57 = 1024;
              int v58 = v36;
              __int16 v59 = 2080;
              uint64_t v60 = (uint64_t)v38;
              __int16 v52 = "[filter %s %d %s] no frames returned from output handler";
              uint64_t v53 = v22;
              uint32_t v54 = 28;
              goto LABEL_60;
            }
          }
        }
      }
    }
  }

  else
  {
    uint64_t v20 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v56 = "ne_filter_read_from_network";
      _os_log_fault_impl(&dword_187528000, v20, OS_LOG_TYPE_FAULT, "%s called with null filter", buf, 0xCu);
    }
  }

uint64_t __ne_filter_protocol_finalize_output_frames_block_invoke()
{
  return 1LL;
}

uint64_t __ne_filter_protocol_get_input_frames_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }

  return 1LL;
}

uint64_t __ne_filter_protocol_get_input_frames_block_invoke_43(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }

  return 1LL;
}

void __ne_filter_protocol_get_input_frames_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v8 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v12 = 0;
    int v9 = "protocol is null";
    int v10 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_187528000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    return;
  }

  uint64_t v3 = *(void *)(v2 + 40);
  if (!v3)
  {
    uint64_t v8 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v11 = 0;
    int v9 = "filter is null";
    int v10 = (uint8_t *)&v11;
    goto LABEL_13;
  }

  int v4 = (unsigned int *)(v3 + 180);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (v5)
  {
    do
    {
      unsigned int v6 = __ldaxr(v4);
      unsigned int v7 = v6 - 1;
    }

    while (__stlxr(v7, v4));
    if (!v7) {
      ne_filter_protocol_destroy(*(void *)(a1 + 32));
    }
  }

void __ne_filter_protocol_add_input_handler_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __ne_filter_protocol_add_input_handler_block_invoke_2(uint64_t a1)
{
}

void __ne_filter_protocol_add_input_handler_block_invoke_3(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  uuid_unparse(*(const unsigned __int8 **)(a1 + 40), out);
  int v2 = *(_DWORD *)(*(void *)(a1 + 40) + 176LL);
  uint64_t v3 = (os_log_s *)ne_log_obj();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2 == 3)
  {
    if (!v4) {
      goto LABEL_8;
    }
    unsigned int v5 = *(void **)(a1 + 40);
    uint64_t v6 = v5[10];
    if (v6)
    {
      LODWORD(v6) = nw_parameters_get_ip_protocol();
      unsigned int v5 = *(void **)(a1 + 40);
    }

    unsigned int v7 = (void *)v5[20];
    if (v7)
    {
      uint64_t v9 = v7[6];
      uint64_t v10 = v7[7];
      uint64_t v8 = v7[8];
      uint64_t v11 = v7[9];
    }

    else
    {
      uint64_t v8 = -1LL;
      uint64_t v9 = -1LL;
      uint64_t v10 = -1LL;
      uint64_t v11 = -1LL;
    }

    uint64_t v27 = (void *)v5[21];
    if (v27)
    {
      uint64_t v29 = v27[6];
      uint64_t v30 = v27[7];
      uint64_t v28 = v27[8];
      uint64_t v31 = v27[9];
    }

    else
    {
      uint64_t v28 = -1LL;
      uint64_t v29 = -1LL;
      uint64_t v30 = -1LL;
      uint64_t v31 = -1LL;
    }

    int v36 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v37 = 136317698;
    uint64_t v38 = out;
    __int16 v39 = 1024;
    int v40 = v6;
    __int16 v41 = 2048;
    uint64_t v42 = v9;
    __int16 v43 = 2048;
    uint64_t v44 = v10;
    __int16 v45 = 2048;
    uint64_t v46 = v8;
    __int16 v47 = 2048;
    uint64_t v48 = v11;
    __int16 v49 = 2048;
    uint64_t v50 = v29;
    __int16 v51 = 2048;
    uint64_t v52 = v30;
    __int16 v53 = 2048;
    uint64_t v54 = v28;
    __int16 v55 = 2048;
    uint64_t v56 = v31;
    __int16 v57 = 1024;
    int v58 = v36;
    uint64_t v33 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]all provider conn"
          "ection requests complete with success: %d";
    uint64_t v34 = v3;
    uint32_t v35 = 104;
  }

  else
  {
    if (!v4) {
      goto LABEL_8;
    }
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(v23 + 80);
    if (v24)
    {
      LODWORD(v24) = nw_parameters_get_ip_protocol();
      uint64_t v23 = *(void *)(a1 + 40);
    }

    uint64_t v25 = *(unsigned int *)(v23 + 176);
    else {
      uint64_t v26 = (&off_18A06EDE8)[v25];
    }
    int v32 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    int v37 = 136315906;
    uint64_t v38 = out;
    __int16 v39 = 1024;
    int v40 = v24;
    __int16 v41 = 2080;
    uint64_t v42 = (uint64_t)v26;
    __int16 v43 = 1024;
    LODWORD(v44) = v32;
    uint64_t v33 = "[filter %s %d %s] all provider connection requests complete with success: %d";
    uint64_t v34 = v3;
    uint32_t v35 = 34;
  }

  _os_log_debug_impl(&dword_187528000, v34, OS_LOG_TYPE_DEBUG, v33, (uint8_t *)&v37, v35);
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  int v13 = *(_DWORD *)(v12 + 120);
  if ((v13 & 1) == 0)
  {
    *(_DWORD *)(v12 + 120) = v13 & 0xFFFFFFFD;
    uint64_t v14 = *(void *)(a1 + 40);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      if ((*(_BYTE *)(v14 + 120) & 4) != 0) {
        ne_filter_protocol_connect(v14);
      }
    }

    else
    {
      ne_filter_protocol_drop_flow((void *)v14);
    }
  }

  uint64_t v15 = *(void *)(a1 + 48);
  if (!v15)
  {
    int v21 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v37) = 0;
    uint64_t v22 = "protocol is null";
LABEL_25:
    _os_log_impl(&dword_187528000, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v37, 2u);
    return;
  }

  uint64_t v16 = *(void *)(v15 + 40);
  if (!v16)
  {
    int v21 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v37) = 0;
    uint64_t v22 = "filter is null";
    goto LABEL_25;
  }

  uint64_t v17 = (unsigned int *)(v16 + 180);
  do
    unsigned int v18 = __ldaxr(v17);
  while (__stlxr(v18, v17));
  if (v18)
  {
    do
    {
      unsigned int v19 = __ldaxr(v17);
      unsigned int v20 = v19 - 1;
    }

    while (__stlxr(v20, v17));
    if (!v20) {
      ne_filter_protocol_destroy(*(void *)(a1 + 48));
    }
  }

__int128 *ne_filter_protocol_identifier()
{
  if (ne_filter_protocol_identifier_onceToken != -1) {
    dispatch_once(&ne_filter_protocol_identifier_onceToken, &__block_literal_global_2);
  }
  if (ne_filter_protocol_identifier_g_hasNESMAccess) {
    return &g_filter_protocol_identifier;
  }
  else {
    return 0LL;
  }
}

void ne_filter_protocol_retain(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    unsigned int v5 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v7 = 136315138;
    uint64_t v8 = "ne_filter_protocol_retain";
    uint64_t v6 = "%s called with null protocol";
    goto LABEL_13;
  }

  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    unsigned int v5 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v7 = 136315138;
    uint64_t v8 = "ne_filter_protocol_retain";
    uint64_t v6 = "%s called with null filter";
LABEL_13:
    _os_log_fault_impl(&dword_187528000, v5, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v7, 0xCu);
    return;
  }

  int v2 = (unsigned int *)(v1 + 180);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    do
      unsigned int v4 = __ldaxr(v2);
    while (__stlxr(v4 + 1, v2));
  }

void ne_filter_protocol_release(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v10 = 0;
    int v7 = "protocol is null";
    uint64_t v8 = (uint8_t *)&v10;
LABEL_13:
    _os_log_impl(&dword_187528000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    return;
  }

  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v9 = 0;
    int v7 = "filter is null";
    uint64_t v8 = (uint8_t *)&v9;
    goto LABEL_13;
  }

  int v2 = (unsigned int *)(v1 + 180);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    do
    {
      unsigned int v4 = __ldaxr(v2);
      unsigned int v5 = v4 - 1;
    }

    while (__stlxr(v5, v2));
    if (!v5) {
      ne_filter_protocol_destroy(a1);
    }
  }

void ne_filter_protocol_handle_message(uint64_t a1, xpc_object_t object)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v9 = "ne_filter_protocol_handle_message";
    int v7 = "%s called with null protocol";
    goto LABEL_13;
  }

  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v9 = "ne_filter_protocol_handle_message";
    int v7 = "%s called with null filter";
LABEL_13:
    _os_log_fault_impl(&dword_187528000, v6, OS_LOG_TYPE_FAULT, v7, buf, 0xCu);
    return;
  }

  unsigned int v3 = (unsigned int *)(v2 + 180);
  do
    unsigned int v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4)
  {
    do
      unsigned int v5 = __ldaxr(v3);
    while (__stlxr(v5 + 1, v3));
    xpc_retain(object);
    nw_queue_context_async();
  }

void __ne_filter_protocol_handle_message_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v8 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v12 = 0;
    __int16 v9 = "protocol is null";
    uint64_t v10 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_187528000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    return;
  }

  uint64_t v3 = *(void *)(v2 + 40);
  if (!v3)
  {
    uint64_t v8 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v11 = 0;
    __int16 v9 = "filter is null";
    uint64_t v10 = (uint8_t *)&v11;
    goto LABEL_13;
  }

  unsigned int v4 = (unsigned int *)(v3 + 180);
  do
    unsigned int v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (v5)
  {
    do
    {
      unsigned int v6 = __ldaxr(v4);
      unsigned int v7 = v6 - 1;
    }

    while (__stlxr(v7, v4));
    if (!v7) {
      ne_filter_protocol_destroy(*(void *)(a1 + 32));
    }
  }

uint64_t NEPIDByName(const char *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  *(void *)unsigned int v19 = 0x600000001LL;
  int v14 = 0;
  size_t v13 = 4LL;
  if (sysctl(v19, 2u, &v14, &v13, 0LL, 0LL) < 0)
  {
    __int16 v9 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = __error();
      __int16 v12 = strerror(*v11);
      int buffer = 136315394;
      uint64_t v16 = "NEKernMaxProc";
      __int16 v17 = 2080;
      unsigned int v18 = v12;
      _os_log_error_impl( &dword_187528000,  v9,  OS_LOG_TYPE_ERROR,  "%s: Failed to get max proc count (%s)",  (uint8_t *)&buffer,  0x16u);
    }

    return 0LL;
  }

  if (!v14) {
    return 0LL;
  }
  int v2 = 4 * v14;
  uint64_t v3 = malloc(4LL * v14);
  if (!v3) {
    return 0LL;
  }
  unsigned int v4 = v3;
  int v5 = proc_listallpids(v3, v2);
  if (v5 < 1)
  {
LABEL_9:
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = v5;
    while (!proc_name(v4[v6], &buffer, 0x64u) || strcmp((const char *)&buffer, a1))
    {
      if (v7 == ++v6) {
        goto LABEL_9;
      }
    }

    uint64_t v8 = v4[v6];
  }

  free(v4);
  return v8;
}

xpc_object_t NECopySigningIdentifierForPIDwithAuditToken(int a1, uint64_t a2)
{
  xpc_object_t result = ne_copy_signing_identifier_for_pid_with_audit_token(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
    xpc_release(v3);
    return (xpc_object_t)v4;
  }

  return result;
}

xpc_object_t NECopySigningIdentifierForPID(int a1)
{
  return NECopySigningIdentifierForPIDwithAuditToken(a1, 0LL);
}

CFStringRef NECopySigningIdentifierForXPCMessage(void *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a1 || MEMORY[0x1895A89D8]() != MEMORY[0x1895F9250])
  {
    int v2 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    buf.val[0] = 136315138;
    *(void *)&buf.val[1] = "NECopySigningIdentifierForXPCMessage";
    uint64_t v10 = "XPC object passed to %s is NULL or is not a dictionary";
    p_audit_token_t buf = &buf;
    __int16 v12 = v2;
    uint32_t v13 = 12;
LABEL_15:
    _os_log_error_impl(&dword_187528000, v12, OS_LOG_TYPE_ERROR, v10, (uint8_t *)p_buf, v13);
    return 0LL;
  }

  xpc_dictionary_get_audit_token();
  int v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  audit_token_t cf = buf;
  uint64_t v6 = SecTaskCreateWithAuditToken(v5, &cf);
  if (!v6)
  {
    __int16 v9 = (os_log_s *)ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    LOWORD(cf.val[0]) = 0;
    uint64_t v10 = "Failed to create a task from audit token";
    p_audit_token_t buf = &cf;
    __int16 v12 = v9;
    uint32_t v13 = 2;
    goto LABEL_15;
  }

  uint64_t v7 = v6;
  *(void *)cf.val = 0LL;
  CFStringRef v3 = SecTaskCopySigningIdentifier(v6, (CFErrorRef *)&cf);
  if (*(void *)cf.val)
  {
    uint64_t v8 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      remote_uint64_t connection = xpc_dictionary_get_remote_connection(a1);
      pid_t pid = xpc_connection_get_pid(remote_connection);
      *(_DWORD *)__int16 v17 = 67109120;
      pid_t v18 = pid;
      _os_log_error_impl( &dword_187528000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to get the signing identifier of process %d",  v17,  8u);
    }

    CFRelease(*(CFTypeRef *)cf.val);
  }

  CFRelease(v7);
  return v3;
}

BOOL NEAuditTokenForPID(int pid, integer_t *a2)
{
  kern_return_t v4;
  mach_error_t v5;
  os_log_s *v6;
  BOOL result;
  char *v8;
  const char *v9;
  kern_return_t v10;
  mach_error_t v11;
  char *v12;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t target_task;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  mach_error_t v18;
  __int16 v19;
  char *v20;
  uint64_t v21;
  int v21 = *MEMORY[0x1895F89C0];
  task_info_outCnt = 8;
  uint64_t v4 = task_for_pid(*MEMORY[0x1895FBBE0], pid, &target_task);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = (os_log_s *)ne_log_obj();
    xpc_object_t result = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    uint64_t v8 = mach_error_string(v5);
    *(_DWORD *)audit_token_t buf = 67109634;
    uint64_t v16 = pid;
    __int16 v17 = 1024;
    pid_t v18 = v5;
    unsigned int v19 = 2080;
    uint64_t v20 = v8;
    __int16 v9 = "task_for_pid(mach_task_self(), %d, &task) => %d (%s)\n";
LABEL_7:
    _os_log_debug_impl(&dword_187528000, v6, OS_LOG_TYPE_DEBUG, v9, buf, 0x18u);
    return 0LL;
  }

  uint64_t v10 = task_info(target_task, 0xFu, a2, &task_info_outCnt);
  if (v10)
  {
    __int16 v11 = v10;
    uint64_t v6 = (os_log_s *)ne_log_obj();
    xpc_object_t result = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    __int16 v12 = mach_error_string(v11);
    *(_DWORD *)audit_token_t buf = 67109634;
    uint64_t v16 = pid;
    __int16 v17 = 1024;
    pid_t v18 = v11;
    unsigned int v19 = 2080;
    uint64_t v20 = v12;
    __int16 v9 = "task_info(mach_task_self(), %d, TASK_AUDIT_TOKEN) => %d (%s)\n";
    goto LABEL_7;
  }

  return 1LL;
}

uint64_t NEGIDForAuditToken()
{
  return 0LL;
}

uint64_t NEUIDForAuditToken()
{
  return 0LL;
}

uint64_t NECopyBootstrapPortForPID()
{
  return 0LL;
}

uint64_t NECopyAuditPortForAuditToken()
{
  return 0LL;
}

uint64_t *ne_filter_crypto_init_master()
{
  int v0 = (uint64_t *)malloc(0x28uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    arc4random_buf(v0 + 1, 0x20uLL);
    int v2 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4[0] = 0;
      _os_log_debug_impl(&dword_187528000, v2, OS_LOG_TYPE_DEBUG, "Generated master key", (uint8_t *)v4, 2u);
    }

    uint64_t *v1 = ccsha256_di();
  }

  return v1;
}

BOOL ne_filter_crypto_generate_client_key(uint64_t a1, int a2, uint64_t a3)
{
  BOOL result = 0LL;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1 && a3)
  {
    ccsha256_di();
    int v5 = cchkdf();
    uint64_t v6 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)audit_token_t buf = 67109120;
      int v9 = a2;
      _os_log_debug_impl(&dword_187528000, v6, OS_LOG_TYPE_DEBUG, "Generated client key for salt %u", buf, 8u);
    }

    return v5 == 0;
  }

  return result;
}

char *ne_filter_crypto_init_client(_OWORD *a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = (char *)malloc(0x28uLL);
  CFStringRef v3 = v2;
  if (v2)
  {
    __int128 v4 = a1[1];
    *(_OWORD *)(v2 + 8) = *a1;
    *(_OWORD *)(v2 + 24) = v4;
    *(void *)int v2 = ccsha256_di();
    int v5 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 0;
      _os_log_debug_impl(&dword_187528000, v5, OS_LOG_TYPE_DEBUG, "Inited client key", (uint8_t *)v7, 2u);
    }
  }

  return v3;
}

uint64_t ne_filter_crypto_sign_data( uint64_t *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a1 && (__int16 v11 = (unint64_t *)*a1) != 0LL)
  {
    uint64_t result = 22LL;
    if (a2 && a9 && a10)
    {
      unint64_t v14 = *v11;
      if (*v11 <= 0x20 && v14 <= *a10)
      {
        v25[0] = *v11;
        v25[1] = v25;
        *a10 = v14;
        MEMORY[0x1895F8858](22LL);
        uint64_t v23 = (char *)v25 - v22;
        cchmac_init();
        ne_filter_crypto_update_context(*a1, (uint64_t)v23, a2, a3, a4, a5, a6, a7, a8);
        cchmac_final();
        ne_filter_crypto_print_data(a2, a3, a4, a5, a6, a7, a8, (uint64_t)"SIGN");
        uint64_t v24 = (os_log_s *)ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)audit_token_t buf = 68289282;
          int v27 = 32;
          __int16 v28 = 2098;
          uint64_t v29 = a9;
          __int16 v30 = 2048;
          uint64_t v31 = v25[0];
          _os_log_debug_impl( &dword_187528000,  v24,  OS_LOG_TYPE_DEBUG,  "Sign data: sig = %{public,ne_filter_crypto_signature}.32P sig_len = %zu",  buf,  0x1Cu);
        }

        return 0LL;
      }

      else
      {
        return 34LL;
      }
    }
  }

  else
  {
    uint64_t v15 = (os_log_s *)ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_error_impl(&dword_187528000, v15, OS_LOG_TYPE_ERROR, "Failed to sign data, no crypto state", buf, 2u);
    }

    return 22LL;
  }

  return result;
}

uint64_t ne_filter_crypto_update_context( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  uint64_t result = cchmac_update();
  if (a4 && a5) {
    uint64_t result = cchmac_update();
  }
  if (a6 && a7) {
    uint64_t result = cchmac_update();
  }
  if (a8)
  {
    if (a9) {
      return cchmac_update();
    }
  }

  return result;
}

void ne_filter_crypto_print_data( uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v16 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315138;
    uint64_t v35 = a8;
    _os_log_debug_impl(&dword_187528000, v16, OS_LOG_TYPE_DEBUG, "%s NE Filter crypto data:", (uint8_t *)&v34, 0xCu);
  }

  __int16 v17 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1;
    _os_log_debug_impl( &dword_187528000,  v17,  OS_LOG_TYPE_DEBUG,  "%s \tflow_id: %{public, u_int8_t}.16P",  (uint8_t *)&v34,  0x1Cu);
  }

  pid_t v18 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 8;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 16;
    _os_log_debug_impl( &dword_187528000,  v18,  OS_LOG_TYPE_DEBUG,  "%s \tsock_id: %{public,u_int8_t}.8P",  (uint8_t *)&v34,  0x1Cu);
  }

  unsigned int v19 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 24;
    _os_log_debug_impl( &dword_187528000,  v19,  OS_LOG_TYPE_DEBUG,  "%s \tdirection: %{public,u_int8_t}.4P",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v20 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315906;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 28;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 28;
    __int16 v40 = 2048;
    uint64_t v41 = 28LL;
    _os_log_debug_impl( &dword_187528000,  v20,  OS_LOG_TYPE_DEBUG,  "%s \tremote: %{public,u_int8_t}.28P (%lu)",  (uint8_t *)&v34,  0x26u);
  }

  int v21 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315906;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 28;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 56;
    __int16 v40 = 2048;
    uint64_t v41 = 28LL;
    _os_log_debug_impl( &dword_187528000,  v21,  OS_LOG_TYPE_DEBUG,  "%s \tlocal: %{public,u_int8_t}.28P (%lu)",  (uint8_t *)&v34,  0x26u);
  }

  uint64_t v22 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 84;
    _os_log_debug_impl( &dword_187528000,  v22,  OS_LOG_TYPE_DEBUG,  "%s \tsocketProtocol: %{public,u_int8_t}.4P",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v23 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 88;
    _os_log_debug_impl( &dword_187528000,  v23,  OS_LOG_TYPE_DEBUG,  "%s \tpid: %{public,u_int8_t}.4P",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v24 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 92;
    _os_log_debug_impl( &dword_187528000,  v24,  OS_LOG_TYPE_DEBUG,  "%s \teffective_pid: %{public,u_int8_t}.4P",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v25 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 100;
    _os_log_debug_impl( &dword_187528000,  v25,  OS_LOG_TYPE_DEBUG,  "%s \tuuid: %{public,u_int8_t}.16P",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v26 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 116;
    _os_log_debug_impl( &dword_187528000,  v26,  OS_LOG_TYPE_DEBUG,  "%s \teffective_uuid: %{public,u_int8_t}.16P",  (uint8_t *)&v34,  0x1Cu);
  }

  int v27 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 96;
    _os_log_debug_impl( &dword_187528000,  v27,  OS_LOG_TYPE_DEBUG,  "%s \tresponsible_pid: %{public,u_int8_t}.4P",  (uint8_t *)&v34,  0x1Cu);
  }

  __int16 v28 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 132;
    _os_log_debug_impl( &dword_187528000,  v28,  OS_LOG_TYPE_DEBUG,  "%s \tresponsible_uuid: %{public,u_int8_t}.16P",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v29 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 8;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 152;
    _os_log_debug_impl( &dword_187528000,  v29,  OS_LOG_TYPE_DEBUG,  "%s \tbyte_count_in: %{public,u_int8_t}.8P",  (uint8_t *)&v34,  0x1Cu);
  }

  __int16 v30 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 8;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 160;
    _os_log_debug_impl( &dword_187528000,  v30,  OS_LOG_TYPE_DEBUG,  "%s \tbyte_count_out: %{public,u_int8_t}.8P",  (uint8_t *)&v34,  0x1Cu);
    if (!a2) {
      goto LABEL_33;
    }
  }

  else if (!a2)
  {
    goto LABEL_33;
  }

  uint64_t v31 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1040;
    int v37 = a3;
    __int16 v38 = 2080;
    uint64_t v39 = a2;
    _os_log_debug_impl(&dword_187528000, v31, OS_LOG_TYPE_DEBUG, "%s \tbundle_id: %.*s", (uint8_t *)&v34, 0x1Cu);
  }

LABEL_33:
  if (a4 && (uint64_t v32 = (os_log_s *)ne_log_obj(), os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)))
  {
    int v34 = 136315394;
    uint64_t v35 = a8;
    __int16 v36 = 1024;
    int v37 = a5;
    _os_log_debug_impl(&dword_187528000, v32, OS_LOG_TYPE_DEBUG, "%s \turl: <%d characters>", (uint8_t *)&v34, 0x12u);
    if (!a6) {
      return;
    }
  }

  else if (!a6)
  {
    return;
  }

  uint64_t v33 = (os_log_s *)ne_log_obj();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1040;
    int v37 = a7;
    __int16 v38 = 2080;
    uint64_t v39 = a6;
    _os_log_debug_impl(&dword_187528000, v33, OS_LOG_TYPE_DEBUG, "%s \thostname: %.*s", (uint8_t *)&v34, 0x1Cu);
  }

BOOL ne_filter_crypto_validate_data( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (a1 && (__int16 v12 = (void *)*a1) != 0LL)
  {
    BOOL result = 0LL;
    if (a2 && a3 && a10 && a11)
    {
      if (*v12 > 0x20uLL || *v12 != a11) {
        return 0LL;
      }
      v25[1] = v25;
      memset(v34, 0, sizeof(v34));
      MEMORY[0x1895F8858](0LL);
      uint64_t v22 = (char *)v25 - v21;
      cchmac_init();
      ne_filter_crypto_update_context(*a1, (uint64_t)v22, a3, a4, a5, a6, a7, a8, a9);
      cchmac_final();
      ne_filter_crypto_print_data(a3, a4, a5, a6, a7, a8, a9, (uint64_t)"VALIDATE");
      uint64_t v23 = (os_log_s *)ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)audit_token_t buf = 68289538;
        int v27 = 32;
        __int16 v28 = 2098;
        uint64_t v29 = a10;
        __int16 v30 = 1042;
        int v31 = 32;
        __int16 v32 = 2098;
        uint64_t v33 = v34;
        _os_log_debug_impl( &dword_187528000,  v23,  OS_LOG_TYPE_DEBUG,  "Validate data: sig1 = %{public,ne_filter_crypto_signature}.32P sig2 = %{public,ne_filter_crypto_signature}.32P",  buf,  0x22u);
      }

      return cc_cmp_safe() == 0;
    }
  }

  else
  {
    uint64_t v24 = (os_log_s *)ne_log_obj();
    BOOL result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)audit_token_t buf = 0;
      _os_log_error_impl(&dword_187528000, v24, OS_LOG_TYPE_ERROR, "Failed to valdate data, no crypto state", buf, 2u);
      return 0LL;
    }
  }

  return result;
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1896028F0]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x189602950](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x189602958](calendar, v3, at);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x189602A60](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x189602A78](allocator, capacity, theData);
}

CFRange CFDataFind( CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4 = MEMORY[0x189602A90](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.unsigned int length = v5;
  result.CFIndex location = v4;
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x189602AE8](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x189602C80]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x1895F8488]();
}

uint64_t NEHelperGetAppTrackerDomains()
{
  return MEMORY[0x1895F84C8]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x18960B338]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x18960B340]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x18960B630](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x18960B668](allocator, token);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x189612AA8]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x189612AB8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1895F8A18]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1895F94D8](*(void *)&__upper_bound);
}

mach_port_name_t audit_session_self(void)
{
  return MEMORY[0x1895F95C0]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x189614100](atoken);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895F9750]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1895F9F08]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1895F9F28]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1895F9F30]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1895F9F38]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1895FA520]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x1895FAAA0]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1895FAAA8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1895FAC08](data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1895FAC30](object);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD60](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1895FAE60](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

uint64_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1895FAEB0](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1895FB4E0](a1, a2, a3, a4);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FB530]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB610](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1895FB6D8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1895FB730]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1895FB7C8](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FB840](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

uint64_t ne_log_obj()
{
  return MEMORY[0x1895FBFC0]();
}

uint64_t ne_tracker_build_cache()
{
  return MEMORY[0x1895FC0A0]();
}

uint64_t ne_tracker_clear_cache()
{
  return MEMORY[0x1895FC0B0]();
}

uint64_t ne_tracker_context_can_block_request()
{
  return MEMORY[0x1895FC0B8]();
}

uint64_t ne_tracker_context_get_domain()
{
  return MEMORY[0x1895FC0C0]();
}

uint64_t ne_tracker_context_get_domain_owner()
{
  return MEMORY[0x1895FC0C8]();
}

uint64_t ne_tracker_context_is_from_app_list()
{
  return MEMORY[0x1895FC0D0]();
}

uint64_t ne_tracker_context_is_from_web_list()
{
  return MEMORY[0x1895FC0D8]();
}

uint64_t ne_tracker_lookup_app_domains()
{
  return MEMORY[0x1895FC0F8]();
}

uint64_t ne_tracker_validate_domain()
{
  return MEMORY[0x1895FC108]();
}

uint64_t ne_trie_search()
{
  return MEMORY[0x1895FC110]();
}

uint64_t necp_match_policy()
{
  return MEMORY[0x1895FC120]();
}

uint64_t nelog_is_debug_logging_enabled()
{
  return MEMORY[0x1895FC140]();
}

uint64_t nelog_is_info_logging_enabled()
{
  return MEMORY[0x1895FC150]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1895FC190](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

void nw_connection_batch(nw_connection_t connection, dispatch_block_t batch_block)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_local_endpoint()
{
  return MEMORY[0x189609148]();
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x189609150]();
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x189609168](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1896091B0](endpoint, parameters);
}

void nw_connection_group_cancel(nw_connection_group_t group)
{
}

nw_endpoint_t nw_connection_group_copy_remote_endpoint_for_message( nw_connection_group_t group, nw_content_context_t context)
{
  return (nw_endpoint_t)MEMORY[0x189609220](group, context);
}

uint64_t nw_connection_group_create_with_parameters()
{
  return MEMORY[0x189609228]();
}

uint64_t nw_connection_group_get_port()
{
  return MEMORY[0x189609230]();
}

void nw_connection_group_send_message( nw_connection_group_t group, dispatch_data_t content, nw_endpoint_t endpoint, nw_content_context_t context, nw_connection_group_send_completion_t completion)
{
}

void nw_connection_group_set_queue(nw_connection_group_t group, dispatch_queue_t queue)
{
}

void nw_connection_group_set_receive_handler( nw_connection_group_t group, uint32_t maximum_message_size, BOOL reject_oversized_messages, nw_connection_group_receive_handler_t receive_handler)
{
}

void nw_connection_group_set_state_changed_handler( nw_connection_group_t group, nw_connection_group_state_changed_handler_t state_changed_handler)
{
}

void nw_connection_group_start(nw_connection_group_t group)
{
}

void nw_connection_receive( nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send( nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler( nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_context_get_globals_for_protocol()
{
  return MEMORY[0x189609438]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x189609510](address);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x189609528]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x189609538](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x189609558](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x189609568]();
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x189609570](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x189609580](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x189609598](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x189609610]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x189609618]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x189609620]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x189609630]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x189609638]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x189609650]();
}

uint64_t nw_frame_array_last()
{
  return MEMORY[0x189609660]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x189609668]();
}

uint64_t nw_frame_array_prepend_array()
{
  return MEMORY[0x189609678]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x189609680]();
}

uint64_t nw_frame_array_unclaimed_length()
{
  return MEMORY[0x189609688]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1896096A8]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1896096C0]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1896096D0]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1896096E0]();
}

uint64_t nw_frame_is_connection_complete()
{
  return MEMORY[0x1896096F8]();
}

uint64_t nw_frame_is_metadata_complete()
{
  return MEMORY[0x189609700]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x189609710]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x189609750]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x189609760]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x1896097F0]();
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x189609938]();
}

uint64_t nw_nat64_synthesize_v6()
{
  return MEMORY[0x189609948]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x189609998]();
}

nw_parameters_t nw_parameters_create_secure_tcp( nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x189609A08](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp( nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x189609A18](configure_dtls, configure_udp);
}

uint64_t nw_parameters_get_data_mode()
{
  return MEMORY[0x189609A28]();
}

uint64_t nw_parameters_get_e_proc_uuid()
{
  return MEMORY[0x189609A38]();
}

uint64_t nw_parameters_get_effective_bundle_id()
{
  return MEMORY[0x189609A48]();
}

uint64_t nw_parameters_get_ip_protocol()
{
  return MEMORY[0x189609A60]();
}

uint64_t nw_parameters_get_pid()
{
  return MEMORY[0x189609A78]();
}

uint64_t nw_parameters_get_proc_uuid()
{
  return MEMORY[0x189609A80]();
}

uint64_t nw_parameters_get_server_mode()
{
  return MEMORY[0x189609AA0]();
}

uint64_t nw_parameters_get_url()
{
  return MEMORY[0x189609AB8]();
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x189609B10]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x189609B78]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x189609C78]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x189609CA8]();
}

uint64_t nw_path_get_filter_unit()
{
  return MEMORY[0x189609E10]();
}

uint64_t nw_path_get_interface_index()
{
  return MEMORY[0x189609E20]();
}

uint64_t nw_protocol_definition_create_with_identifier()
{
  return MEMORY[0x18960A080]();
}

uint64_t nw_protocol_definition_set_globals_allocator()
{
  return MEMORY[0x18960A0D8]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x18960A4C0]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x18960A500]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x18960A5F0]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x18960A600]();
}

uint64_t nw_queue_context_target_dispatch_queue()
{
  return MEMORY[0x18960A610]();
}

void nw_release(void *obj)
{
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x18960AA20](obj);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int posix_memalign(void **__memptr, size_t __alignment, size_t __size)
{
  return MEMORY[0x1895FC7D8](__memptr, __alignment, __size);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8B0](buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  return (void *)MEMORY[0x1895FCC08](a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return (void *)MEMORY[0x1895FCC18](a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return (void *)MEMORY[0x1895FCC20](a1, a2, *(void *)&a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1895FCCB8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1895FCE30](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1895FCE38](*(void *)&a1, a2, *(void *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
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

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1895FD088](*(void *)&__errnum, __strerrbuf, __buflen);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x1895FD308](*(void *)&target_tport, *(void *)&pid, t);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int tracker_action(int action, char *buffer, size_t buffer_size)
{
  return MEMORY[0x1895FD428](*(void *)&action, buffer, buffer_size);
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8( const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1896158F8](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x189615910](*(void *)&options, pErrorCode);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1895FD810](xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1895FD980](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1895FDAE0]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1895FDB10](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1895FDB88]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1895FDBE0]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC10](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1895FDC58](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1895FDCF8]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1895FE070](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1895FE0F8](uuid);
}

uint64_t objc_msgSend_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_);
}