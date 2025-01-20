uint64_t sub_188BC0C70(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x189616718](*(void *)(a1 + 32), sel_messageReceived_, a2);
}

void *sub_188BC0F08(void *a1, compression_algorithm a2)
{
  v3 = a1;
  v4 = v3;
  if (a2 == COMPRESSION_LZ4)
  {
    uint64_t v5 = 16LL;
  }

  else
  {
    if (a2 != COMPRESSION_LZFSE) {
      sub_188BDA278();
    }
    uint64_t v5 = 8LL;
  }

  v6 = (unint64_t *)&v3[v5];
  size_t v7 = compression_encode_scratch_buffer_size(a2);
  unint64_t v8 = atomic_load(v6);
  do
  {
    v9 = (void *)__ldaxr(v6);
    if (v9 != (void *)v8)
    {
      __clrex();
      goto LABEL_11;
    }
  }

  while (__stlxr(0LL, v6));
  if (v9) {
    goto LABEL_12;
  }
LABEL_11:
  v9 = malloc(v7);
LABEL_12:

  return v9;
}

void sub_188BC0FA4(void *a1, int a2, void *a3)
{
  uint64_t v5 = a1;
  if (a3)
  {
    if (a2 == 256)
    {
      uint64_t v6 = 16LL;
    }

    else
    {
      if (a2 != 2049) {
        sub_188BDA2A0();
      }
      uint64_t v6 = 8LL;
    }

    size_t v7 = (unint64_t *)&v5[v6];
    while (!__ldaxr(v7))
    {
    }

    __clrex();
    v9 = v5;
    free(a3);
    uint64_t v5 = v9;
  }

LABEL_11:
}

  v24 = *(void **)(a1 + 56);
  v25 = objc_msgSend_cost(*(void **)(a1 + 40), v9, v10, v27, v28, v29, v30);
  objc_msgSend_releaseSize_(v24, v26, v25);
  sub_188BCDD08((id *)&v34);
  objc_autoreleasePoolPop(v4);
}

  pthread_setspecific(qword_18C4FE7D0, v5);
  v11 = *(void **)(a1 + 48);
  v14 = objc_msgSend_cost(*(void **)(a1 + 40), v12, v13);
  objc_msgSend_releaseSize_(v11, v15, v14);
  sub_188BCDD08((id *)&v21);
}

void sub_188BC14E0(void *a1)
{
}

void sub_188BC14F4(_Unwind_Exception *a1)
{
}

void sub_188BC1580(uint64_t a1)
{
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 36LL) & 0xC) == 0)
  {
    uint64_t v2 = MEMORY[0x1895D398C](*(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
}

void sub_188BC1674(void *a1)
{
  uint64_t v1 = a1[4];
  if ((*(_BYTE *)(v1 + 36) & 0xC) == 0)
  {
    uint64_t v3 = (void *)a1[5];
    if (v3)
    {
      char v4 = 2;
    }

    else
    {
      uint64_t v3 = (void *)a1[6];
      char v4 = 1;
    }

    id v5 = v3;
    uint64_t v6 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = v5;

    *(_BYTE *)(a1[4] + 36LL) = *(_BYTE *)(a1[4] + 36LL) & 0xFC | v4;
  }

void sub_188BC1790( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_188BC17A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_188BC17B8(uint64_t a1)
{
}

void sub_188BC17C0(uint64_t a1)
{
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 36LL) & 8) == 0)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
    char v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = sub_188BC18FC;
    v13[3] = &unk_18A2ED550;
    v13[4] = *(void *)(a1 + 40);
    uint64_t v6 = (void *)MEMORY[0x1895D398C](v13);
    id v7 = *(id *)(*(void *)(a1 + 32) + 24LL);
    id v8 = v6;
    v9 = v8;
    if (v8 && v7)
    {
      v14[0] = v5;
      v14[1] = 3221225472LL;
      v14[2] = sub_188BC1948;
      v14[3] = &unk_18A2ED5A0;
      id v15 = v7;
      id v16 = v9;
      uint64_t v10 = MEMORY[0x1895D398C](v14);
    }

    else
    {
      if (v7) {
        id v8 = v7;
      }
      uint64_t v10 = MEMORY[0x1895D398C](v8);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;
  }

uint64_t sub_188BC18FC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
}

uint64_t sub_188BC1948(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_188BC1AB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_188BC1AD4(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend__validateDispatch_(WeakRetained, v5, (uint64_t)v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_188BC1BBC(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_cancel(*(void **)(*(void *)(a1 + 32) + 24), a2, a3);
}

void sub_188BC2244(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_msgSend_error(v13, v3, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((id)kDTXInterruptionMessage == v13)
  {
    uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_( MEMORY[0x189607870],  v5,  (uint64_t)@"DTXProxyChannel",  1,  &unk_18A2F2E70);

    id v7 = (void *)v8;
  }

  objc_msgSend__allowedClassesForReturnValues(*(void **)(a1 + 32), v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectWithAllowedClasses_(v13, v10, (uint64_t)v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_invokeCompletionWithReturnValue_error_(*(void **)(a1 + 40), v12, (uint64_t)v11, v7);
}

void sub_188BC273C(uint64_t a1)
{
  mach_msg_return_t v6;
  const char *v7;
  dispatch_queue_s *v8;
  uint64_t v9;
  void v10[5];
  void block[5];
  dispatch_semaphore_t v2 = (mach_msg_header_t *)malloc(0x8000uLL);
  p_msgh_bits = &v2->msgh_bits;
  uint64_t v4 = *(void *)(a1 + 32);
  mach_port_name_t v5 = *(_DWORD *)(v4 + 48);
  if (v5 + 1 < 2 || (uint64_t v6 = mach_msg(v2, 258, 0, 0x8000u, v5, 1u, 0), v4 = *(void *)(a1 + 32), v6))
  {
    free(p_msgh_bits);
    uint64_t v8 = *(dispatch_queue_s **)(v4 + 64);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_188BC2848;
    block[3] = &unk_18A2ED618;
    block[4] = v4;
    dispatch_async(v8, block);
  }

  else
  {
    v9 = p_msgh_bits[6];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = sub_188BC2850;
    v10[3] = &unk_18A2ED638;
    v10[4] = p_msgh_bits;
    objc_msgSend_received_ofLength_destructor_((void *)v4, v7, (uint64_t)(p_msgh_bits + 7), v9, v10);
  }

uint64_t sub_188BC2848(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_disconnect(*(void **)(a1 + 32), a2, a3);
}

void sub_188BC2850(uint64_t a1)
{
}

void sub_188BC2858(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_semaphore_t v2 = *(dispatch_queue_s **)(v1 + 64);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC28B8;
  block[3] = &unk_18A2ED618;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t sub_188BC28B8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_disconnect(*(void **)(a1 + 32), a2, a3);
}

void sub_188BC2988(void *a1)
{
  mach_port_name_t v5 = a1;
  dispatch_queue_t v1 = dispatch_queue_create("DTXMachTransport input queue", 0LL);
  dispatch_semaphore_t v2 = (void *)v5[7];
  v5[7] = v1;

  dispatch_queue_t v3 = dispatch_queue_create("DTXMachTransport output queue", 0LL);
  uint64_t v4 = (void *)v5[8];
  v5[8] = v3;

  v5[13] = malloc(0x8000uLL);
}

LABEL_66:
        if (!v63) {
          mach_port_mod_refs(*MEMORY[0x1895FBBE0], poly[1], poly[0], -1);
        }
        goto LABEL_68;
      }

      v43 = v34;
      v44 = poly[1];
    }

    else
    {
      if ((_DWORD)v35 != (_DWORD)v34)
      {
        while (1)
        {
          name = 0;
          v48 = mach_port_allocate(v34, 4u, &name);
          if ((_DWORD)v48) {
            break;
          }
          v48 = mach_port_deallocate(v34, name);
          if ((_DWORD)v48) {
            break;
          }
          v46 = mach_port_insert_right(v34, name, poly[1], v41);
          if ((v46 & 0xFFFFFFF7) != 5) {
            goto LABEL_34;
          }
        }

        v45 = v48;
        v47 = v72;
        goto LABEL_43;
      }

      name = v39;
      v44 = poly[1];
      v43 = v34;
      v42 = v39;
    }

    v46 = mach_port_insert_right(v43, v42, v44, v41);
LABEL_34:
    v45 = v46;
    v47 = v72;
    if (!(_DWORD)v46)
    {
      v42 = name;
      goto LABEL_36;
    }

LABEL_43:
    if (!v47) {
      mach_port_mod_refs(*MEMORY[0x1895FBBE0], poly[1], poly[0], -1);
    }
    goto LABEL_45;
  }

LABEL_18:
  return v7;
}

    id v16 = v51;
    if (*(void *)(*((void *)&buf + 1) + 40LL))
    {
      v58[0] = MEMORY[0x1895F87A8];
      v58[1] = 3221225472LL;
      v58[2] = sub_188BCC7BC;
      v58[3] = &unk_18A2ED578;
      v59 = v11;
      p_buf = &buf;
      objc_msgSend__scheduleBlock_(v59, v44, (uint64_t)v58);
    }

    else
    {
      v48 = (os_log_s *)qword_18C4FE7C0;
      if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v65 = 138543362;
        v66 = v6;
        _os_log_impl( &dword_188BBF000,  v48,  OS_LOG_TYPE_ERROR,  "Protocol handler unavailable for specified channel: %{public}@",  v65,  0xCu);
      }

      objc_msgSend_cancel(v11, v49, v50, v51);
    }

    _Block_object_dispose(&buf, 8);
  }

  else if (v52)
  {
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = sub_188BCC87C;
    v53[3] = &unk_18A2EDC50;
    v57 = v52;
    v54 = v11;
    v55 = v6;
    v56 = self;
    objc_msgSend__scheduleBlock_(v54, v43, (uint64_t)v53);
  }

  else
  {
    v45 = (os_log_s *)qword_18C4FE7C0;
    if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( &dword_188BBF000,  v45,  OS_LOG_TYPE_ERROR,  "No channel handler specified; channel canceled. %{public}@",
        (uint8_t *)&buf,
        0xCu);
    }

    objc_msgSend_cancel(v11, v46, v47);
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t sub_188BC30B0(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  mach_port_name_t v3 = *(_DWORD *)(v2 + 48);
  if (v3 + 1 >= 2)
  {
    result = mach_port_mod_refs(*MEMORY[0x1895FBBE0], v3, 1u, -1);
    *(_DWORD *)(*(void *)(v1 + 32) + 48LL) = 0;
    uint64_t v2 = *(void *)(v1 + 32);
  }

  mach_port_name_t v4 = *(_DWORD *)(v2 + 52);
  if (v4 + 1 >= 2)
  {
    result = mach_port_deallocate(*MEMORY[0x1895FBBE0], v4);
    *(_DWORD *)(*(void *)(v1 + 32) + 52LL) = 0;
  }

  return result;
}

uint64_t sub_188BC3268(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  mach_port_name_t v3 = *(_DWORD *)(v2 + 48);
  if (v3 + 1 >= 2)
  {
    result = mach_port_mod_refs(*MEMORY[0x1895FBBE0], v3, 1u, -1);
    *(_DWORD *)(*(void *)(v1 + 32) + 48LL) = 0;
    uint64_t v2 = *(void *)(v1 + 32);
  }

  mach_port_name_t v4 = *(_DWORD *)(v2 + 52);
  if (v4 + 1 >= 2)
  {
    result = mach_port_deallocate(*MEMORY[0x1895FBBE0], v4);
    *(_DWORD *)(*(void *)(v1 + 32) + 52LL) = 0;
  }

  return result;
}

uint64_t sub_188BC33B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_188BC33C0(uint64_t a1)
{
}

void sub_188BC33C8(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = sub_188BC342C;
  v3[3] = &unk_18A2ED578;
  __int128 v1 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 56LL);
  __int128 v4 = v1;
  dispatch_sync(v2, v3);
}

uint64_t sub_188BC342C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_DWORD *)(v1 + 52) + 1) >= 2 && (*(_DWORD *)(v1 + 48) + 1) >= 2)
  {
    uint64_t v2 = result;
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v4 = *(void *)(*(void *)(v2 + 40) + 8LL);
    mach_port_name_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    xpc_dictionary_set_mach_send();
    result = xpc_dictionary_set_mach_recv();
    *(_DWORD *)(*(void *)(v2 + 32) + 48LL) = 0;
  }

  return result;
}

void sub_188BC3748(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 8_Block_object_dispose(va, 8) = 0LL;
  }

void sub_188BC3798(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(dispatch_source_s **)(v2 + 80);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v4 = *(dispatch_queue_s **)(v2 + 56);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC381C;
  block[3] = &unk_18A2ED618;
  block[4] = v2;
  dispatch_sync(v4, block);
}

void sub_188BC381C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = 0LL;
  }

void sub_188BC3CDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t sub_188BC3CFC(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 36));
}

uint64_t sub_188BC40F0(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 36));
}

void sub_188BC4228(_Unwind_Exception *a1)
{
}

uint64_t sub_188BC4240(mach_port_name_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  int v21 = -1;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v14 = sub_188BC4CA0;
  id v15 = &unk_18A2ED700;
  v17 = &v18;
  id v4 = v3;
  id v16 = v4;
  mach_port_name_t v5 = v13;
  __int128 v23 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, a1, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    v14((uint64_t)v5, 0, 4, 0LL);
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 4LL;
    if (HIDWORD(v23) + *(_DWORD *)&msg[4] == 48)
    {
      uint64_t v8 = 0LL;
      if (*(_DWORD *)&msg[24] == 1)
      {
        if (!HIBYTE(DWORD1(v23))
          && ((int v9 = HIWORD(DWORD1(v23)), (HIWORD(DWORD1(v23)) - 22) < 0xFFFFFFFA)
           || (*(_DWORD *)msg & 0x80000000) != 0))
        {
          if (v9 == 16) {
            unsigned int v10 = 1;
          }
          else {
            unsigned int v10 = 4 * ((v9 - 17) > 4);
          }
          else {
            uint64_t v7 = v10;
          }
          uint64_t v6 = *(unsigned int *)&msg[28];
          uint64_t v8 = *(unsigned int *)&msg[8];
        }

        else
        {
          uint64_t v6 = 0LL;
          uint64_t v8 = 0LL;
        }
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    v14((uint64_t)v5, v6, v7, v8);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  uint64_t v11 = *((unsigned int *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v11;
}

void sub_188BC43F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_188BC4410(uint64_t a1, int a2)
{
  uint64_t result = sub_188BC4444(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_188BC4444(int a1, int a2)
{
  mach_msg_return_t v11;
  mach_error_t v12;
  const char *v13;
  pid_t v14;
  char *v15;
  int v16;
  int v17;
  int v18[2];
  uint8_t v19[4];
  const char *v20;
  __int16 v21;
  pid_t v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  mach_error_t v26;
  _BYTE buf[12];
  __int128 v28;
  _DWORD v29[3];
  uint64_t v30;
  v30 = *MEMORY[0x1895F89C0];
  int v4 = pipe(v18);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v4 && (v18[0] & 0x80000000) == 0)
  {
    if (v18[1] < 0) {
      return 0xFFFFFFFFLL;
    }
    if (fileport_makeport())
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = getprogname();
        pid_t v7 = getpid();
        uint64_t v8 = __error();
        int v9 = strerror(*v8);
        int v10 = *__error();
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v6;
        LOWORD(v2_Block_object_dispose(va, 8) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v7;
        WORD3(v2_Block_object_dispose(va, 8) = 2080;
        *((void *)&v28 + 1) = v9;
        LOWORD(v29[0]) = 1024;
        *(_DWORD *)((char *)v29 + 2) = v10;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s(%d) [error]: '_send_fd' failed: %s (%d)\n",  buf,  0x22u);
      }

      goto LABEL_12;
    }

    *(void *)((char *)&v28 + 4) = 0LL;
    HIDWORD(v2_Block_object_dispose(va, 8) = 1;
    *(void *)&v29[1] = 0x13000000000000LL;
    *(_DWORD *)&buf[8] = a1;
    LODWORD(v2_Block_object_dispose(va, 8) = a2;
    *(void *)buf = 0x2880001413LL;
    v29[0] = 0;
    uint64_t v11 = mach_msg_send((mach_msg_header_t *)buf);
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        id v13 = getprogname();
        v14 = getpid();
        id v15 = mach_error_string(v12);
        *(_DWORD *)v19 = 136315906;
        uint64_t v20 = v13;
        int v21 = 1024;
        v22 = v14;
        __int128 v23 = 2080;
        v24 = v15;
        v25 = 1024;
        v26 = v12;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n",  v19,  0x22u);
      }

      mach_port_deallocate(*MEMORY[0x1895FBBE0], 0);
      goto LABEL_12;
    }

    mach_port_deallocate(*MEMORY[0x1895FBBE0], 0);
    id v16 = v18[0];
    if ((v18[0] & 0x80000000) == 0)
    {
      v17 = fcntl(v18[0], 3);
      if ((v17 & 4) == 0)
      {
        fcntl(v16, 4, v17 | 4u);
LABEL_19:
        if ((v18[0] & 0x80000000) == 0 && fcntl(v18[0], 2, 1LL) != -1) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }

      if (v17 != -1) {
        goto LABEL_19;
      }
    }

LABEL_12:
    close(v18[0]);
    v18[0] = -1;
LABEL_13:
    close(v18[1]);
    return v18[0];
  }

  return result;
}

  *(_BYTE *)(*(void *)(result[6] + 8LL) + 24LL) = 0;
  return result;
}
      }
    }

uint64_t sub_188BC46D0(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 40));
}

void sub_188BC4A40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_188BC4A74(uint64_t a1, mach_port_name_t a2)
{
  uint64_t v4 = sub_188BC4444(*(_DWORD *)(a1 + 40), a2);
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_188BC4240(a2, 0LL);
    if ((v6 & 0x80000000) != 0)
    {
      close(v5);
    }

    else
    {
      uint64_t v7 = v6;
      uint64_t v8 = objc_alloc(&OBJC_CLASS___DTXFileDescriptorTransport);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      void v13[2] = sub_188BC4B40;
      v13[3] = &unk_18A2ED638;
      int v14 = v5;
      int v15 = v7;
      uint64_t v10 = objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_(v8, v9, v5, v7, v13);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }

uint64_t sub_188BC4B40(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 36));
}

uint64_t sub_188BC4BF8(uint64_t result, int a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t v4 = result;
  if (a2 != 2) {
    goto LABEL_13;
  }
  uint64_t result = *a3;
  int v5 = fileport_makefd();
  uint64_t result = fileport_makefd();
  if (v5 < 0)
  {
    if ((result & 0x80000000) != 0) {
      goto LABEL_13;
    }
  }

  else
  {
    if ((result & 0x80000000) == 0)
    {
      uint64_t v6 = *(_DWORD **)(v4 + 48);
      **(_DWORD **)(v4 + 40) = v5;
      _DWORD *v6 = result;
      return result;
    }

    LODWORD(result) = v5;
  }

  uint64_t result = close(result);
LABEL_13:
  *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 8LL) + 24LL) = 5;
  return result;
}

uint64_t sub_188BC4CA0(uint64_t result, int a2, int a3, uint64_t a4)
{
  if ((a2 + 1) >= 2 && a3 == 0)
  {
    uint64_t v6 = result;
    uint64_t result = fileport_makefd();
    *(_DWORD *)(*(void *)(*(void *)(v6 + 40) + 8LL) + 24LL) = result;
    uint64_t v7 = *(void *)(*(void *)(v6 + 40) + 8LL);
    int v8 = *(_DWORD *)(v7 + 24);
    if ((v8 & 0x80000000) == 0)
    {
      uint64_t result = fcntl(*(_DWORD *)(v7 + 24), 3);
      if ((result & 4) != 0)
      {
        if ((_DWORD)result == -1)
        {
          uint64_t result = close(*(_DWORD *)(*(void *)(*(void *)(v6 + 40) + 8LL) + 24LL));
          *(_DWORD *)(*(void *)(*(void *)(v6 + 40) + 8LL) + 24LL) = -1;
        }
      }

      else
      {
        uint64_t result = fcntl(v8, 4, result | 4);
      }
    }

    if ((*(_DWORD *)(*(void *)(*(void *)(v6 + 40) + 8LL) + 24LL) & 0x80000000) == 0)
    {
      uint64_t result = *(void *)(v6 + 32);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
      }
    }
  }

  return result;
}

void sub_188BC4D88(uint64_t a1, uint64_t a2, void *a3)
{
  uintptr_t v5 = *(unsigned int *)(a1 + 40);
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  id v7 = a3;
  source = dispatch_source_create(MEMORY[0x1895F8B48], v5, 1uLL, v6);

  dispatch_source_set_event_handler(source, v7);
  dispatch_activate(source);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  dispatch_source_cancel(source);
}

void sub_188BC4E38(uint64_t a1)
{
  kern_return_t v6;
  mach_error_t v7;
  kern_return_t v8;
  mach_error_t v9;
  const char *v10;
  pid_t v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  mach_error_t v20;
  uint64_t v21;
  int v21 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }

  while (__stlxr(1u, v2));
  mach_port_name_t v4 = *(_DWORD *)(a1 + 40);
  if (v4 + 1 >= 2)
  {
    uintptr_t v5 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    uint64_t v6 = mach_port_mod_refs(*MEMORY[0x1895FBBE0], v4, 1u, -1);
    if (v6)
    {
      id v7 = v6;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        id v13 = 136315906;
        int v14 = getprogname();
        int v15 = 1024;
        id v16 = getpid();
        v17 = 2080;
        uint64_t v18 = mach_error_string(v7);
        v19 = 1024;
        uint64_t v20 = v7;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_mod_refs' failed: %s (%d)\n",  (uint8_t *)&v13,  0x22u);
      }
    }

    int v8 = mach_port_deallocate(*v5, *(_DWORD *)(a1 + 40));
    if (v8)
    {
      int v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = getprogname();
        uint64_t v11 = getpid();
        v12 = mach_error_string(v9);
        id v13 = 136315906;
        int v14 = v10;
        int v15 = 1024;
        id v16 = v11;
        v17 = 2080;
        uint64_t v18 = v12;
        v19 = 1024;
        uint64_t v20 = v9;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_deallocate' failed: %s (%d)\n",  (uint8_t *)&v13,  0x22u);
      }
    }
  }

void sub_188BC50D0(_DWORD *a1)
{
  a1[10] = 2;
  uint64_t v1 = a1;
  dispatch_queue_t v2 = dispatch_queue_create("transport handler guard", 0LL);
  id v3 = (void *)v1[2];
  v1[2] = v2;

  mach_port_name_t v4 = (void *)NSString;
  uint64_t v5 = objc_opt_class();
  id v17 = objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)@"transport incoming serializer queue (%@)", v5);
  int v9 = (const char *)objc_msgSend_UTF8String(v17, v7, v8);
  dispatch_queue_t v10 = dispatch_queue_create(v9, 0LL);
  dispatch_suspend(v10);
  uint64_t v11 = (void *)v1[1];
  v1[1] = v10;
  v12 = v10;

  id v13 = (void *)objc_opt_new();
  objc_msgSend_suspendLimits(v13, v14, v15);
  id v16 = (void *)v1[3];
  v1[3] = v13;
}

void sub_188BC52C4(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  free(*(void **)(a1 + 40));
}

void sub_188BC54EC(uint64_t a1, const char *a2, uint64_t a3)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, *(void *)(a1 + 48), *(void *)(a1 + 56));
    if (!*(void *)(a1 + 56)) {
      objc_msgSend_setDataReceivedHandler_(*(void **)(a1 + 32), v4, 0);
    }
  }

  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    objc_msgSend_releaseSize_(*(void **)(*(void *)(a1 + 32) + 24), v4, v5);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void sub_188BC55F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 44))
  {
    *(_BYTE *)(v1 + 44) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8LL));
  }

uint64_t sub_188BC5728(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_188BC57B4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  if (v5)
  {
    *(void *)(v4 + 32) = 0LL;
  }

  else if (*(void *)(a1 + 40) && !*(_BYTE *)(v4 + 44))
  {
    *(_BYTE *)(v4 + 44) = 1;
    objc_msgSend_resumeLimits(*(void **)(*(void *)(a1 + 32) + 24), a2, a3);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8LL));
  }

  uint64_t v6 = *(_BYTE **)(a1 + 32);
  if (v6[44] && objc_msgSend_status(v6, a2, a3) == 3)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0LL, 0LL);
    }
  }

  else
  {
    uint64_t v8 = MEMORY[0x1895D398C](*(void *)(a1 + 40));
    uint64_t v9 = *(void *)(a1 + 32);
    dispatch_queue_t v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;
  }

uint64_t sub_188BC5924(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1895D398C](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_188BC594C(uint64_t a1)
{
}

void sub_188BC5954(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1895D398C](*(void *)(*(void *)(a1 + 32) + 32LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

double DTXPrimitiveArrayCreate()
{
  v0 = malloc(0x200uLL);
  *(void *)&double result = 496LL;
  _OWORD *v0 = xmmword_188BDC150;
  return result;
}

void DTXPrimitiveArrayDestroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

unint64_t *DTXPrimitiveArrayCreateWithTypesAndValues( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  dispatch_queue_t v10 = (unint64_t *)malloc(0x200uLL);
  *(_OWORD *)dispatch_queue_t v10 = xmmword_188BDC150;
  return sub_188BC5AF0(v10, 0, a1, &a9);
}

unint64_t *sub_188BC5AF0(unint64_t *__ptr, unsigned int a2, int a3, const char **a4)
{
  v19 = a4;
  if (a2) {
    unsigned int v5 = a2;
  }
  else {
    unsigned int v5 = -1;
  }
  if (a3)
  {
    unsigned int v6 = 0;
    do
    {
      switch(a3)
      {
        case 1:
          uint64_t v7 = v19++;
          uint64_t v8 = *v7;
          size_t v9 = strlen(*v7) + 1;
          dispatch_queue_t v10 = __ptr;
          int v11 = 1;
          v12 = (char *)v8;
          goto LABEL_13;
        case 3:
          id v13 = v19++;
          LODWORD(v1_Block_object_dispose(va, 8) = *(_DWORD *)v13;
          v12 = (char *)&v18;
          dispatch_queue_t v10 = __ptr;
          int v11 = 3;
          size_t v9 = 4LL;
          goto LABEL_13;
        case 6:
          int v14 = v19++;
          uint64_t v18 = *v14;
          v12 = (char *)&v18;
          dispatch_queue_t v10 = __ptr;
          int v11 = 6;
          goto LABEL_11;
        case 9:
          uint64_t v15 = v19++;
          uint64_t v18 = *v15;
          v12 = (char *)&v18;
          dispatch_queue_t v10 = __ptr;
          int v11 = 9;
LABEL_11:
          size_t v9 = 8LL;
          goto LABEL_13;
        case 10:
          dispatch_queue_t v10 = __ptr;
          int v11 = 10;
          v12 = 0LL;
          size_t v9 = 0LL;
LABEL_13:
          __ptr = sub_188BC5CC8(v10, v11, v12, v9);
          ++v6;
          break;
        default:
          break;
      }

      id v16 = v19++;
      if (v6 >= v5) {
        break;
      }
      a3 = *(_DWORD *)v16;
    }

    while (*(_DWORD *)v16);
  }

  return __ptr;
}

unint64_t *DTXPrimitiveArrayAppendValues( unint64_t *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  if (result)
  {
    size_t v9 = result;
    if (!*result)
    {
      double result = sub_188BC5AF0((unint64_t *)*result, 0, a2, &a9);
      void *v9 = result;
    }
  }

  return result;
}

void *DTXPrimitiveArrayAppendBuffer(void *result, void *__src, size_t __n)
{
  if (result)
  {
    uint64_t v3 = result;
    if (!*result)
    {
      double result = sub_188BC5CC8(0LL, 2, __src, __n);
      void *v3 = result;
    }
  }

  return result;
}

void *sub_188BC5CC8(unint64_t *__ptr, int a2, void *__src, size_t __n)
{
  int v4 = __n;
  uint64_t v7 = __ptr;
  unsigned int v8 = a2 - 1;
  if (__ptr)
  {
    size_t v9 = __n;
    unint64_t v10 = __ptr[1];
    unint64_t v11 = __n + 4LL * (v8 < 2) + v10 + 4;
    if (*__ptr >= v11) {
      goto LABEL_9;
    }
  }

  else
  {
    unint64_t v10 = 0LL;
    size_t v9 = __n;
    unint64_t v11 = __n + 4LL * (v8 < 2) + 4;
  }

  unint64_t v12 = (v11 + 527) & 0xFFFFFFFFFFFFFE00LL;
  if (v12) {
    size_t v13 = v12;
  }
  else {
    size_t v13 = 256LL;
  }
  uint64_t v7 = realloc(__ptr, v13);
  *uint64_t v7 = v13 - 16;
  v7[1] = v10;
LABEL_9:
  int v14 = (_DWORD *)((char *)v7 + v10 + 16);
  _DWORD *v14 = a2;
  uint64_t v15 = (char *)(v14 + 1);
  if (v8 <= 1)
  {
    v14[1] = v4;
    uint64_t v15 = (char *)(v14 + 2);
  }

  if (v4)
  {
    memcpy(v15, __src, v9);
    v15 += v9;
  }

  v7[1] = v15 - (char *)(v7 + 2);
  return v7;
}

CFDataRef _createObjectFromPrimitiveType(int a1, char *cStr, CFIndex length)
{
  switch(a1)
  {
    case 1:
      return (CFDataRef)CFStringCreateWithCString(0LL, cStr, 0x8000100u);
    case 2:
      return CFDataCreate(0LL, (const UInt8 *)cStr, length);
    case 3:
      CFNumberType v6 = kCFNumberSInt32Type;
      goto LABEL_9;
    case 4:
      valuePtr[1] = v3;
      valuePtr[2] = v4;
      valuePtr[0] = *(unsigned int *)cStr;
      return CFNumberCreate(0LL, kCFNumberSInt64Type, valuePtr);
    case 5:
    case 6:
    case 7:
    case 8:
      CFNumberType v6 = kCFNumberSInt64Type;
      goto LABEL_9;
    case 9:
      CFNumberType v6 = kCFNumberDoubleType;
LABEL_9:
      CFDataRef result = CFNumberCreate(0LL, v6, cStr);
      break;
    default:
      CFDataRef result = 0LL;
      break;
  }

  return result;
}

CFArrayRef CFArrayCreateWithDTXPrimitiveArray(uint64_t a1)
{
  unsigned int v2 = sub_188BC5F98(a1);
  if (!v2) {
    return CFArrayCreate(0LL, 0LL, 0LL, MEMORY[0x189605228]);
  }
  uint64_t v9 = 0LL;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  uint64_t v3 = (const void **)malloc(8LL * v2);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = sub_188BC61E0;
  v8[3] = &unk_18A2ED7F0;
  v8[4] = &v9;
  v8[5] = v3;
  sub_188BC602C(a1, (uint64_t)v8);
  unsigned int v4 = *((_DWORD *)v10 + 6);
  CFArrayRef v5 = CFArrayCreate(0LL, v3, v4, MEMORY[0x189605228]);
  *((_DWORD *)v10 + 6) = 0;
  if (v4)
  {
    for (unsigned int i = 0; i < v4; *((_DWORD *)v10 + 6) = i)
    {
      CFRelease(v3[i]);
      unsigned int i = *((_DWORD *)v10 + 6) + 1;
    }
  }

  free(v3);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_188BC5F98(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  CFArrayRef v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  int v7 = 0;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = sub_188BC6784;
  v3[3] = &unk_18A2ED868;
  void v3[4] = &v4;
  sub_188BC602C(a1, (uint64_t)v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_188BC602C(uint64_t a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (a1 && *(void *)(a1 + 8))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = a1 + 16;
    do
    {
      uint64_t v6 = *(unsigned int *)(v4 + v5);
      unint64_t v7 = v4 + 4;
      if ((v6 - 1) > 1)
      {
        if (v6 > 9 || ((1 << v6) & 0x340) == 0)
        {
          uint64_t v8 = 4 * ((_DWORD)v6 != 10);
          if (a2)
          {
LABEL_16:
            if ((_DWORD)v8)
            {
              if ((_DWORD)v6 != 1)
              {
                unint64_t v10 = (const void *)(v7 + v5);
                if (((v7 + v5) & 7) != 0)
                {
                  if (v8 >= 0x101)
                  {
                    size_t v11 = v8;
                    int v12 = (char *)malloc(v8);
                    goto LABEL_23;
                  }

LABEL_22:
                  size_t v11 = v8;
                  MEMORY[0x1895F8858]();
                  int v12 = (char *)v14 - ((v8 + 15LL) & 0x1FFFFFFF0LL);
LABEL_23:
                  memcpy(v12, v10, v11);
LABEL_24:
                  if (v12) {
                    size_t v13 = v12;
                  }
                  else {
                    size_t v13 = (char *)(v7 + v5);
                  }
                  (*(void (**)(uint64_t, uint64_t, char *, uint64_t))(a2 + 16))(a2, v6, v13, v8);
                  if (v8 >= 0x101)
                  {
                    if (v12) {
                      free(v12);
                    }
                  }

                  goto LABEL_30;
                }
              }
            }

  return v15;
}

LABEL_21:
            int v12 = 0LL;
            goto LABEL_24;
          }
        }

        else
        {
          if (a2)
          {
            unint64_t v10 = (const void *)(v7 + v5);
            uint64_t v8 = 8LL;
            if (((v7 + v5) & 7) != 0) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }

          LODWORD(v_Block_object_dispose(va, 8) = 8;
        }
      }

      else
      {
        uint64_t v8 = *(unsigned int *)(v7 + v5);
        unint64_t v7 = v4 + 8;
        if (a2) {
          goto LABEL_16;
        }
      }

LABEL_30:
      unint64_t v4 = v7 + v8;
    }

    while (v4 < *(void *)(a1 + 8));
  }

CFDataRef sub_188BC61E0(uint64_t a1, int a2, char *cStr, CFIndex length)
{
  CFDataRef result = _createObjectFromPrimitiveType(a2, cStr, length);
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v8 = *(unsigned int *)(v7 + 24);
    *(_DWORD *)(v7 + 24) = v8 + 1;
    *(void *)(v6 + 8 * v_Block_object_dispose(va, 8) = result;
  }

  return result;
}

CFDictionaryRef CFDictionaryCreateWithDTXPrimitiveDictionary(uint64_t a1)
{
  CFDictionaryRef v1 = (CFDictionaryRef)a1;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (sub_188BC5F98(a1) >= 2)
    {
      uint64_t v12 = 0LL;
      size_t v13 = &v12;
      uint64_t v14 = 0x2000000000LL;
      int v15 = 0;
      uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
      unint64_t v4 = (const void **)((char *)v11 - ((v3 + 15) & 0x7FFFFFFF0LL));
      MEMORY[0x1895F8858](v2);
      uint64_t v6 = (const void **)((char *)v11 - v5);
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 0x40000000LL;
      v11[2] = sub_188BC6480;
      v11[3] = &unk_18A2ED818;
      v11[4] = v7;
      v11[5] = v4;
      v11[6] = (char *)v11 - v5;
      _DTXPrimitiveDictionaryEnumerate((uint64_t)v1, (uint64_t)v11);
      unsigned int v8 = *((_DWORD *)v13 + 6);
      CFDictionaryRef v1 = CFDictionaryCreate(0LL, v4, v6, v8, MEMORY[0x189605240], MEMORY[0x189605250]);
      *((_DWORD *)v13 + 6) = 0;
      if (v8)
      {
        for (unsigned int i = 0; i < v8; *((_DWORD *)v13 + 6) = i)
        {
          CFRelease(v4[i]);
          CFRelease(v6[*((unsigned int *)v13 + 6)]);
          unsigned int i = *((_DWORD *)v13 + 6) + 1;
        }
      }

      _Block_object_dispose(&v12, 8);
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

uint64_t _DTXPrimitiveDictionaryGetCount(uint64_t a1)
{
  return sub_188BC5F98(a1) >> 1;
}

void _DTXPrimitiveDictionaryEnumerate(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      v5[0] = 0LL;
      v5[1] = v5;
      v5[2] = 0x2000000000LL;
      v5[3] = 0LL;
      v3[0] = 0LL;
      v3[1] = v3;
      v3[2] = 0x2000000000LL;
      int v4 = 0;
      v2[0] = MEMORY[0x1895F87A8];
      v2[1] = 0x40000000LL;
      v2[2] = sub_188BC6670;
      v2[3] = &unk_18A2ED840;
      v2[4] = a2;
      v2[5] = v3;
      v2[6] = v5;
      sub_188BC602C(a1, (uint64_t)v2);
      _Block_object_dispose(v3, 8);
      _Block_object_dispose(v5, 8);
    }
  }

CFDataRef sub_188BC6480(CFDataRef result, const char *a2, int a3, char *a4, CFIndex a5)
{
  if (a2)
  {
    if (*a2)
    {
      CFDataRef v8 = result;
      *(void *)(*((void *)result + 5) + 8LL * *(unsigned int *)(*(void *)(*((void *)result + 4) + 8LL) + 24LL)) = CFStringCreateWithCString(0LL, a2, 0x8000100u);
      CFDataRef result = _createObjectFromPrimitiveType(a3, a4, a5);
      *(void *)(*((void *)v8 + 6)
                + 8LL * (*(_DWORD *)(*(void *)(*((void *)v8 + 4) + 8LL) + 24LL))++) = result;
    }
  }

  return result;
}

double DTXPrimitiveDictionaryCreate()
{
  v0 = malloc(0x200uLL);
  *(void *)&double result = 496LL;
  _OWORD *v0 = xmmword_188BDC150;
  return result;
}

void DTXPrimitiveDictionaryDestroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

unint64_t *DTXPrimitiveDictionaryAddPrimitivePair(unint64_t *result, char *__s, int a3, ...)
{
  if (result)
  {
    if (a3)
    {
      int v4 = result;
      if (*result)
      {
        uint64_t v6 = (unint64_t *)*result;
        if (__s)
        {
          size_t v7 = strlen(__s) + 1;
          CFDataRef v8 = v6;
          int v9 = 1;
          unint64_t v10 = __s;
        }

        else
        {
          CFDataRef v8 = (unint64_t *)*result;
          int v9 = 10;
          unint64_t v10 = 0LL;
          size_t v7 = 0LL;
        }

        size_t v11 = sub_188BC5CC8(v8, v9, v10, v7);
        void *v4 = v11;
        double result = sub_188BC5AF0(v11, 1u, a3, (const char **)va);
        void *v4 = result;
      }
    }
  }

  return result;
}

unint64_t **DTXPrimitiveDictionaryAddBufferPair( unint64_t **result, char *__s, void *a3, size_t a4)
{
  if (result)
  {
    int v4 = result;
    uint64_t v5 = *result;
    if (*result)
    {
      if (__s)
      {
        size_t v9 = strlen(__s) + 1;
        unint64_t v10 = v5;
        int v11 = 1;
        uint64_t v12 = __s;
      }

      else
      {
        unint64_t v10 = *result;
        int v11 = 10;
        uint64_t v12 = 0LL;
        size_t v9 = 0LL;
      }

      size_t v13 = sub_188BC5CC8(v10, v11, v12, v9);
      void *v4 = v13;
      double result = (unint64_t **)sub_188BC5CC8(v13, 2, a3, a4);
      void *v4 = (unint64_t *)result;
    }
  }

  return result;
}

void *sub_188BC6670(void *result, int a2, uint64_t a3)
{
  uint64_t v3 = result;
  if ((*(_BYTE *)(*(void *)(result[5] + 8LL) + 24LL) & 1) != 0)
  {
    double result = (void *)(*(uint64_t (**)(void))(result[4] + 16LL))();
  }

  else
  {
    if (a2 != 1) {
      a3 = 0LL;
    }
    *(void *)(*(void *)(result[6] + 8LL) + 24LL) = a3;
  }

  ++*(_DWORD *)(*(void *)(v3[5] + 8LL) + 24LL);
  return result;
}

uint64_t DTXPrimitiveArrayGetSerialized(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2) {
      *a2 = *(_DWORD *)(result + 8) + 16;
    }
  }

  return result;
}

void *DTXPrimitiveArrayReferencingSerialized(void *result, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (!result || a2 < 0x10 || result[1] + 16LL != a2)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "DTXPrimitiveArrayReferencingSerialized: unexpected bytes at %p of length %u, returning NULL\n",  result,  a2);
    return 0LL;
  }

  return result;
}

uint64_t DTXPrimitiveDictionaryGetSerialized(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2) {
      *a2 = *(_DWORD *)(result + 8) + 16;
    }
  }

  return result;
}

uint64_t sub_188BC6784(uint64_t result)
{
  return result;
}

uint64_t sub_188BC68AC(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 8LL);
  return result;
}

uint64_t sub_188BC6918(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 8LL) = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    uint64_t v2 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(void *)(v2 + 32) + 32LL);
      uint64_t v1 = *(void *)(v2 + 32);
    }

    while (*(_DWORD *)(v1 + 32));
  }

  return result;
}

uint64_t sub_188BC69FC(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 8LL);
  return result;
}

uint64_t sub_188BC6A68(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16LL) = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    uint64_t v2 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(void *)(v2 + 32) + 32LL);
      uint64_t v1 = *(void *)(v2 + 32);
    }

    while (*(_DWORD *)(v1 + 32));
  }

  return result;
}

void *sub_188BC6BB8(void *result)
{
  uint64_t v1 = result[4];
  if (*(_DWORD *)(v1 + 40))
  {
    unint64_t v2 = result[7];
    uint64_t v3 = *(void *)(v1 + 24);
LABEL_9:
    *(void *)(v1 + 24) = v3 + v2;
    ++*(_DWORD *)(result[4] + 36LL);
    uint64_t v6 = result[4];
    int v7 = *(_DWORD *)(v6 + 36);
    if (!v7)
    {
      *(_DWORD *)(v6 + 36) = 1;
      int v7 = *(_DWORD *)(result[4] + 36LL);
    }

    *(_DWORD *)(*(void *)(result[5] + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v7;
    goto LABEL_12;
  }

  uint64_t v3 = *(void *)(v1 + 24);
  unint64_t v2 = result[7];
  unint64_t v4 = *(void *)(v1 + 8);
  if (v2 >= v4) {
    uint64_t v5 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v5 = result[7];
  }
  if (v5 + v3 <= v4) {
    goto LABEL_9;
  }
  if (v2 <= *(void *)(v1 + 16))
  {
    ++*(_DWORD *)(v1 + 32);
    return result;
  }

uint64_t sub_188BC6CB4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24LL) += *(void *)(result + 40);
  return result;
}

uint64_t sub_188BC6D20(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  unint64_t v2 = *(void *)(result + 40);
  unint64_t v3 = *(void *)(v1 + 24);
  BOOL v4 = v3 >= v2;
  unint64_t v5 = v3 - v2;
  if (!v4) {
    unint64_t v5 = 0LL;
  }
  *(void *)(v1 + 24) = v5;
  uint64_t v6 = *(void *)(result + 32);
  if (*(_DWORD *)(v6 + 32))
  {
    uint64_t v7 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 56));
      --*(_DWORD *)(*(void *)(v7 + 32) + 32LL);
      uint64_t v6 = *(void *)(v7 + 32);
    }

    while (*(_DWORD *)(v6 + 32));
  }

  return result;
}

uint64_t sub_188BC6DD8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    uint64_t v2 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(void *)(v2 + 32) + 32LL);
      uint64_t v1 = *(void *)(v2 + 32);
    }

    while (*(_DWORD *)(v1 + 32));
  }

  return result;
}

uint64_t sub_188BC6E8C(uint64_t result)
{
  return result;
}

uint64_t sub_188BC7648(uint64_t a1)
{
  return objc_msgSend_setObject_forKey_((void *)qword_18C4FE7B0, v2, *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_188BC7674()
{
  if ((byte_18C7403F4 & 1) == 0)
  {
    v0 = (objc_class *)objc_opt_class();
    ImageName = class_getImageName(v0);
    uint64_t v2 = (objc_class *)objc_opt_class();
    sub_188BC7A04(ImageName, sel_schemes, v2, &unk_18A2EDE30);
    byte_18C7403F4 = 1;
  }

LABEL_26:
}

void sub_188BC7A04(const char *a1, const char *a2, objc_class *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v30 = a4;
  uint64_t v7 = sub_188BCEAB4(a1);
  unsigned int outCount = 0;
  CFDataRef v8 = objc_copyClassNamesForImage(v7, &outCount);
  size_t v9 = (os_log_s *)qword_18C4FE7C8;
  if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v10 = "<nil image?>";
    if (v7) {
      unint64_t v10 = v7;
    }
    *(_DWORD *)buf = 136315394;
    v35 = v10;
    __int16 v36 = 1024;
    unsigned int v37 = outCount;
    _os_log_impl(&dword_188BBF000, v9, OS_LOG_TYPE_DEBUG, "scanning image %s (%u classes)", buf, 0x12u);
  }

  if (outCount)
  {
    unint64_t v11 = 0LL;
    uint64_t v12 = "<nil className>";
    size_t v13 = "checking class %s";
    v31 = a2;
    do
    {
      uint64_t v14 = (os_log_s *)qword_18C4FE7C8;
      if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = v8[v11];
        if (!v15) {
          int v15 = v12;
        }
        *(_DWORD *)buf = 136315138;
        v35 = v15;
        _os_log_impl(&dword_188BBF000, v14, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
      }

      uint64_t v16 = v8[v11];
      if (!v16) {
        goto LABEL_30;
      }
      Class = objc_getClass(v16);
      Method ClassMethod = class_getClassMethod(Class, a2);
      if (!ClassMethod) {
        goto LABEL_30;
      }
      Method v19 = ClassMethod;
      BOOL v20 = Class != 0LL;
      if (Class && Class != a3)
      {
        Superclass = Class;
        do
        {
          Superclass = class_getSuperclass(Superclass);
          BOOL v20 = Superclass != 0LL;
        }

        while (Superclass && Superclass != a3);
      }

      if (!v20) {
        goto LABEL_30;
      }
      v22 = v13;
      __int128 v23 = v12;
      *(_DWORD *)buf = 0;
      v24 = object_getClass(Class);
      v25 = class_copyMethodList(v24, (unsigned int *)buf);
      v26 = v25;
      uint64_t v27 = *(unsigned int *)buf;
      v28 = v25;
      if (*(_DWORD *)buf)
      {
        while (*v28 != v19)
        {
          ++v28;
          if (!--v27) {
            goto LABEL_28;
          }
        }

        v29 = (os_log_s *)qword_18C4FE7C8;
        if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_188BBF000, v29, OS_LOG_TYPE_DEBUG, "selector matched for class, calling block", v32, 2u);
        }

        v30[2](v30, Class);
      }

      else if (!v25)
      {
        goto LABEL_29;
      }

LABEL_28:
      free(v26);
LABEL_29:
      uint64_t v12 = v23;
      size_t v13 = v22;
      a2 = v31;
LABEL_30:
      ++v11;
    }

    while (v11 < outCount);
  }

  if (v8) {
    free(v8);
  }
}

uint64_t sub_188BC7CAC(uint64_t a1, objc_class *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t result = objc_msgSend_automaticallyRegistersCapabilities(a2, (const char *)a2, a3);
  if ((_DWORD)result)
  {
    uint64_t v6 = (void *)qword_18C4FE7C8;
    if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_INFO))
    {
      CFDataRef v8 = v6;
      id v9 = NSStringFromClass(a2);
      int v12 = 136315138;
      uint64_t v13 = objc_msgSend_UTF8String(v9, v10, v11);
      _os_log_impl(&dword_188BBF000, v8, OS_LOG_TYPE_INFO, "registering capabilities: %s", (uint8_t *)&v12, 0xCu);
    }

    return objc_msgSend_registerCapabilities_(a2, v7, *(void *)(a1 + 32));
  }

  return result;
}

uint64_t sub_188BC7D94(uint64_t a1, objc_class *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  BOOL v4 = (void *)qword_18C4FE7C8;
  if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v4;
    id v7 = NSStringFromClass(a2);
    int v11 = 136315138;
    uint64_t v12 = objc_msgSend_UTF8String(v7, v8, v9);
    _os_log_impl(&dword_188BBF000, v6, OS_LOG_TYPE_INFO, "registering capabilities: %s", (uint8_t *)&v11, 0xCu);
  }

  return objc_msgSend_registerCapabilities_(a2, v5, *(void *)(a1 + 32));
}

uint64_t sub_188BC7F60(uint64_t a1, const char *a2)
{
  return objc_msgSend__receiveQueueSetCompressionHint_onChannel_( *(void **)(a1 + 32),  a2,  *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40));
}

void sub_188BC8078( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188BC88E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_188BC8900(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_188BC8910(uint64_t a1)
{
}

void sub_188BC8918(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)a1[4];
  uint64_t v7 = objc_msgSend_cost(v3, v5, v6);
  objc_msgSend_forceAcquireSize_(v4, v8, v7);
  v13[0] = MEMORY[0x1895F87A8];
  void v13[2] = sub_188BC89D0;
  v13[3] = &unk_18A2ED958;
  unint64_t v10 = (void *)a1[4];
  uint64_t v9 = a1[5];
  int v11 = *(dispatch_queue_s **)(v9 + 48);
  v13[1] = 3221225472LL;
  uint64_t v16 = a1[6];
  void v13[4] = v9;
  id v14 = v3;
  id v15 = v10;
  id v12 = v3;
  dispatch_async(v11, v13);
}

uint64_t sub_188BC89D0(uint64_t a1, const char *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) == *(void *)(*(void *)(a1 + 32) + 160LL)) {
    return MEMORY[0x189616718](*(void *)(a1 + 32), sel__routeMessage_, *(void *)(a1 + 40));
  }
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = objc_msgSend_cost(*(void **)(a1 + 40), a2, a3);
  return objc_msgSend_releaseSize_(v3, v5, v4);
}

uint64_t sub_188BC8A28(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x189616718]( *(void *)(a1 + 32),  sel__handleMessageParseException_forChannelCode_messageID_fragmentCount_withPayloadBytes_ofLength_,  a2);
}

void sub_188BC90E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void sub_188BC9108(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  objc_msgSend_dataReceivedHandler(*(void **)(*(void *)(a1 + 32) + 32), a2, a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = @"Unable to publish capabilities after connection has been resumed.";
    goto LABEL_3;
  }

  uint64_t v24 = *(int *)(a1 + 64);
  if ((int)v24 <= 0)
  {
    uint64_t v39 = objc_msgSend_stringWithFormat_( NSString,  v5,  (uint64_t)@"Invalid version number for capability %@: %ld not in one-sided range [0, INT_MAX."),  *(void *)(a1 + 40),  v24);
    uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v7 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = v39;
    goto LABEL_3;
  }

  objc_msgSend_objectForKey_(*(void **)(*(void *)(a1 + 32) + 104), v5, *(void *)(a1 + 40));
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = objc_msgSend_objectForKey_(*(void **)(*(void *)(a1 + 32) + 112), v25, *(void *)(a1 + 40));
  uint64_t v7 = v48;
  if (!v48) {
    goto LABEL_3;
  }
  uint64_t v28 = v26;
  int v29 = objc_msgSend_intValue(v48, (const char *)v48, v27);
  uint64_t v32 = *(int *)(a1 + 64);
  if (v29 != (_DWORD)v32 && v28 == *(void *)(a1 + 56))
  {
    v41 = (void *)NSString;
    uint64_t v42 = *(void *)(a1 + 40);
    uint64_t v47 = objc_msgSend_integerValue(v48, v30, v31);
    objc_msgSend_stringWithFormat_( v41,  v43,  (uint64_t)@"Version mismatch for capability %@ with service class %@: %ld vs. %ld.",  v42,  v28,  v32,  v47);
  }

  else
  {
    v35 = (void *)NSString;
    uint64_t v36 = *(void *)(a1 + 40);
    uint64_t v37 = objc_msgSend_integerValue(v48, v33, v34);
    objc_msgSend_stringWithFormat_( v35,  v38,  (uint64_t)@"Class mismatch for capability %@ with version %ld: %@ vs. %@.",  v36,  v37,  v28,  *(void *)(a1 + 56));
  }
  uint64_t v44 = ;
  uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v46 = *(void **)(v45 + 40);
  *(void *)(v45 + 40) = v44;

LABEL_21:
  if ((int)objc_msgSend_intValue(v48, v33, v34) > *(_DWORD *)(a1 + 64))
  {

    return;
  }

  uint64_t v7 = v48;
LABEL_3:

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    CFDataRef v8 = (void *)qword_18C4FE7C8;
    if (os_log_type_enabled((os_log_t)qword_18C4FE7C8, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = *(void **)(a1 + 32);
      int v11 = v8;
      LODWORD(v10) = objc_msgSend_atomicConnectionNumber(v10, v12, v13);
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = *(_DWORD *)(a1 + 64);
      uint64_t v16 = NSStringFromClass(*(Class *)(a1 + 56));
      id v17 = (void *)v16;
      uint64_t v18 = @"none";
      *(_DWORD *)buf = 67109890;
      int v50 = (int)v10;
      if (v16) {
        uint64_t v18 = (const __CFString *)v16;
      }
      __int16 v51 = 2114;
      uint64_t v52 = v14;
      __int16 v53 = 1024;
      int v54 = v15;
      __int16 v55 = 2114;
      v56 = v18;
      _os_log_impl(&dword_188BBF000, v11, OS_LOG_TYPE_INFO, "x%d %{public}@ v%u (%{public}@)", buf, 0x22u);
    }

    Method v19 = *(void **)(*(void *)(a1 + 32) + 104LL);
    objc_msgSend_numberWithInt_(MEMORY[0x189607968], v9, *(unsigned int *)(a1 + 64));
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v19, v21, (uint64_t)v20, *(void *)(a1 + 40));

    uint64_t v23 = *(void *)(a1 + 56);
    if (v23) {
      objc_msgSend_setObject_forKey_(*(void **)(*(void *)(a1 + 32) + 112), v22, v23, *(void *)(a1 + 40));
    }
  }

void sub_188BC94CC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 104), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_188BC95F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_188BC960C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v7 = (unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  while (1)
  {
    double v8 = COERCE_DOUBLE(__ldaxr(v7));
    if (v8 != 0.0) {
      break;
    }
    if (!__stlxr(*(unint64_t *)&v6, v7))
    {
      dispatch_time_t v12 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      uint64_t v13 = *(void **)(a1 + 40);
      uint64_t v14 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 56LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_188BC9748;
      block[3] = &unk_18A2ED890;
      id v17 = v13;
      uint64_t v18 = *(void *)(a1 + 56);
      dispatch_after(v12, v14, block);

      return;
    }
  }

  __clrex();
  uint64_t v9 = *(void **)(a1 + 40);
  double v10 = v6 - v8;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x189607968], v4, v5, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeCompletionWithReturnValue_error_(v9, v11, (uint64_t)v15, 0);
}

void sub_188BC9748(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend_numberWithDouble_(MEMORY[0x189607968], a2, a3, *(double *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invokeCompletionWithReturnValue_error_(v3, v4, (uint64_t)v5, 0);
}

void sub_188BC9888( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_188BC98A0(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_188BC999C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_188BC99B4(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 32);
  if (!*(void *)(v4 + 120))
  {
    uint64_t result = objc_msgSend_supportedDirections(*(void **)(v4 + 32), a2, a3);
    if ((_DWORD)result == 2)
    {
      uint64_t v7 = objc_msgSend_null(MEMORY[0x189603FE8], v5, v6);
      uint64_t v8 = *(void *)(v3 + 32);
      uint64_t v9 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = v7;

      uint64_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v3 + 32) + 152LL));
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(v3 + 40) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(*(void *)(v3 + 32) + 120LL) == 0LL;
  return result;
}

void sub_188BC9B44(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4) {
    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v5,  (uint64_t)@"DTXConnectionException",  @"Unable to register capability override blocks after connection has been resumed.");
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 128LL);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 128);
    *(void *)(v8 + 12_Block_object_dispose(va, 8) = v7;

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 128LL);
  }

  id v11 = (id)MEMORY[0x1895D398C](*(void *)(a1 + 40));
  objc_msgSend_addObject_(v6, v10, (uint64_t)v11);
}

void sub_188BC9CD4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
}

void sub_188BC9DA8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v4 + 184))
  {
    objc_msgSend_description(*(void **)(a1 + 32), a2, a3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188BC9F54("resuming", (void *)v4, 0LL, v5);

    uint64_t v4 = *(void *)(a1 + 32);
  }

  objc_msgSend_dataReceivedHandler(*(void **)(v4 + 32), a2, a3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 72))
    {
      if ((objc_msgSend_supportedDirections(*(void **)(v9 + 32), v7, v8) & 0xFFFFFFFE) == 2)
      {
        id v11 = *(void **)(*(void *)(a1 + 32) + 104LL);
        objc_msgSend_numberWithInt_(MEMORY[0x189607968], v10, 1);
        dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)v12, @"com.apple.private.DTXConnection");

        objc_msgSend_setObject_forKey_( *(void **)(*(void *)(a1 + 32) + 104),  v14,  (uint64_t)&unk_18A2F2F88,  @"com.apple.private.DTXBlockCompression");
        objc_msgSend_messageWithSelector_objectArguments_( DTXMessage,  v15,  (uint64_t)sel__notifyOfPublishedCapabilities_,  *(void *)(*(void *)(a1 + 32) + 104),  0);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendControlAsync_replyHandler_(*(void **)(a1 + 32), v17, (uint64_t)v16, 0);
      }

      id v18 = *(id *)(*(void *)(a1 + 32) + 160LL);
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = sub_188BCA1A8;
      v22[3] = &unk_18A2EDA70;
      id v23 = v18;
      Method v19 = *(void **)(*(void *)(a1 + 32) + 32LL);
      id v20 = v18;
      objc_msgSend_setDataReceivedHandler_(v19, v21, (uint64_t)v22);
    }
  }

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48LL));
}

void sub_188BC9F54(const char *a1, void *a2, void *a3, void *a4)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v12 = (void *)MEMORY[0x1895D37B8]();
  if (!v9)
  {
    objc_msgSend_description((void *)kDTXInterruptionMessage, v10, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  int v13 = objc_msgSend_channelCode(v8, v10, v11);
  int v16 = v13;
  if (v13 >= 0) {
    int v17 = v13;
  }
  else {
    int v17 = -v13;
  }
  int v18 = objc_msgSend_atomicConnectionNumber(v7, v14, v15);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x189603F50], v19, v20);
  double v22 = v21;
  id v23 = (void *)qword_18C4FE7C0;
  if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_INFO))
  {
    double v24 = v22 - *(double *)&qword_18C4FE7B8;
    if (v16 >= 0) {
      v25 = "";
    }
    else {
      v25 = "f";
    }
    uint64_t v44 = v25;
    int v26 = v18;
    id v27 = v8;
    int v28 = v17;
    id v29 = v7;
    v30 = v12;
    uint64_t v31 = a1;
    id v32 = v9;
    v33 = v23;
    uint64_t v34 = v32;
    a1 = v31;
    dispatch_time_t v12 = v30;
    id v7 = v29;
    int v17 = v28;
    id v8 = v27;
    int v18 = v26;
    *(_DWORD *)buf = 134219266;
    double v46 = v24;
    __int16 v47 = 1024;
    int v48 = v26;
    __int16 v49 = 2080;
    int v50 = a1;
    __int16 v51 = 1024;
    int v52 = v17;
    __int16 v53 = 2080;
    int v54 = v44;
    __int16 v55 = 2080;
    uint64_t v56 = objc_msgSend_UTF8String(v34, v35, v36);
    _os_log_impl(&dword_188BBF000, v33, OS_LOG_TYPE_INFO, "%3.6f x%d %8s [c%d%s]: %s\n", buf, 0x36u);
  }

  uint64_t v37 = (FILE *)qword_18C7403E0;
  if (qword_18C7403E0)
  {
    double v38 = v22 - *(double *)&qword_18C4FE7B8;
    if (v16) {
      uint64_t v39 = "f";
    }
    else {
      uint64_t v39 = "";
    }
    id v40 = v9;
    v43 = (const char *)objc_msgSend_UTF8String(v40, v41, v42);
    fprintf(v37, "%3.6f x%d %8s [c%d%s]: %s\n", v38, v18, a1, v17, v39, v43);
  }

  objc_autoreleasePoolPop(v12);
}

uint64_t sub_188BCA1A8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x189616718](*(void *)(a1 + 32), sel_parseIncomingBytes_length_, a2);
}

void sub_188BCA244(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1895D398C](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = v2;
}

void sub_188BCA39C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[9];
  if (!v5)
  {
    int v26 = *(void **)(a1 + 40);
    if (!v26) {
      return;
    }
    id v27 = (void *)v4[22];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = sub_188BCA558;
    v33[3] = &unk_18A2EDA98;
    id v34 = v26;
    objc_msgSend__scheduleBlock_(v27, v28, (uint64_t)v33);
    v25 = v34;
    goto LABEL_8;
  }

  if (!v4[15])
  {
    objc_msgSend_dictionary(MEMORY[0x189603F68], a2, a3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyOfPublishedCapabilities_(v4, v7, (uint64_t)v6);

    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = (void *)v4[9];
  }

  uint64_t v8 = MEMORY[0x1895F87A8];
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = sub_188BCA568;
  v32[3] = &unk_18A2EDAC0;
  v32[4] = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, a2, (uint64_t)v32);
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 80);
  v31[0] = v8;
  v31[1] = 3221225472LL;
  v31[2] = sub_188BCA578;
  v31[3] = &unk_18A2EDAC0;
  v31[4] = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v11, (uint64_t)v31);
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = 0LL;

  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 80);
  *(void *)(v14 + 80) = 0LL;

  uint64_t v16 = *(void *)(a1 + 32);
  int v17 = *(void **)(v16 + 192);
  *(void *)(v16 + 192) = 0LL;

  uint64_t v18 = *(void *)(a1 + 32);
  Method v19 = *(void **)(v18 + 96);
  *(void *)(v18 + 96) = 0LL;

  uint64_t v23 = *(void *)(a1 + 32);
  double v22 = *(void **)(a1 + 40);
  if (v22)
  {
    double v24 = *(dispatch_queue_s **)(v23 + 16);
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = sub_188BCA5BC;
    block[3] = &unk_18A2ED500;
    void block[4] = v23;
    id v30 = v22;
    dispatch_async(v24, block);
    v25 = v30;
LABEL_8:

    return;
  }

  objc_msgSend_disconnect(*(void **)(v23 + 32), v20, v21);
}

uint64_t sub_188BCA558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_188BCA568(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__scheduleMessage_toChannel_(*(void **)(a1 + 32), a2, 0, a3);
}

void sub_188BCA578(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  objc_msgSend_resume(v7, v4, v5);
  objc_msgSend__scheduleMessage_toChannel_(*(void **)(a1 + 32), v6, 0, v7);
}

void sub_188BCA5BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 32);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BCA630;
  v5[3] = &unk_18A2EDB10;
  void v5[4] = v1;
  id v6 = v2;
  objc_msgSend_serializedDisconnect_(v3, v4, (uint64_t)v5);
}

void sub_188BCA630(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(dispatch_queue_s **)(v4 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BCA6C4;
  block[3] = &unk_18A2EDAE8;
  void block[4] = v4;
  id v9 = v3;
  id v10 = v5;
  id v7 = v3;
  dispatch_async(v6, block);
}

void sub_188BCA6C4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  if (v6) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (object_getClass(v5) != (Class)MEMORY[0x1895F9250]) {
      sub_188BDA2C8();
    }
    id v8 = v6;
    uint64_t v11 = (const void *)objc_msgSend_bytes(v8, v9, v10);
    size_t v14 = objc_msgSend_length(v8, v12, v13);
    xpc_dictionary_set_data(v5, "__DTXTransport_preflightdata", v11, v14);
  }

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 160);
  *(void *)(v15 + 160) = 0LL;

  int v17 = *(void **)(*(void *)(a1 + 32) + 176LL);
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_188BCA800;
  v19[3] = &unk_18A2ED7A0;
  id v21 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 40);
  objc_msgSend__scheduleBlock_(v17, v18, (uint64_t)v19);
}

uint64_t sub_188BCA800(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

LABEL_56:
  return v17;
}

void sub_188BCAD3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v5 = objc_msgSend_fragmentsForLength_(*(void **)(*(void *)(a1 + 32) + 168), v4, *(void *)(a1 + 64));
  BOOL v7 = (dispatch_queue_s *)*(id *)(*(void *)(a1 + 32) + 16LL);
  if (*(_BYTE *)(a1 + 96))
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
    id v8 = (dispatch_queue_s *)*(id *)(*(void *)(a1 + 32) + 24LL);

    BOOL v7 = v8;
  }

  if (*(_BYTE *)(a1 + 97))
  {
    id v9 = (void *)MEMORY[0x1895D398C](v3);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_188BCAFE0;
    block[3] = &unk_18A2ED500;
    void block[4] = *(void *)(a1 + 32);
    id v37 = v9;
    id v10 = v9;
    dispatch_async(v7, block);
  }

  if (*(void *)(a1 + 40) == kDTXBarrierMessage
    || !objc_msgSend__addHandler_forMessage_channel_( *(void **)(a1 + 32),  v6,  (uint64_t)v3,  *(unsigned int *)(a1 + 80),  *(void *)(a1 + 48))
    || (uint64_t v11 = *(void **)(a1 + 40), v11 == (void *)qword_18C4FE7A0))
  {
    if (*(_BYTE *)(a1 + 96)) {
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
    }
    uint64_t v17 = *(void *)(a1 + 72);
    if (v17) {
      objc_msgSend_releaseSize_(*(void **)(*(void *)(a1 + 32) + 136), v6, v17);
    }
  }

  else
  {
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x2020000000LL;
    int v35 = 0;
    uint64_t v28 = 0LL;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    uint64_t v31 = sub_188BCB034;
    id v32 = sub_188BCB05C;
    id v33 = 0LL;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = sub_188BCB064;
    v18[3] = &unk_18A2EDB60;
    v18[4] = *(void *)(a1 + 32);
    id v12 = v11;
    __int128 v25 = *(_OWORD *)(a1 + 80);
    id v19 = v12;
    double v22 = v34;
    uint64_t v23 = &v28;
    int v26 = v5;
    char v27 = *(_BYTE *)(a1 + 96);
    uint64_t v24 = *(void *)(a1 + 72);
    id v20 = *(id *)(a1 + 56);
    uint64_t v13 = v7;
    id v21 = v13;
    uint64_t v14 = MEMORY[0x1895D398C](v18);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v14;

    if (*(void *)(a1 + 56)) {
      int v16 = 1;
    }
    else {
      int v16 = v5;
    }
    for (; v16; --v16)
      dispatch_async(v13, (dispatch_block_t)v29[5]);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v34, 8);
  }
}

uint64_t sub_188BCAFE0(uint64_t a1, const char *a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, kDTXBarrierMessage);
  }
  return result;
}

uint64_t sub_188BCB034(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1895D398C](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_188BCB05C(uint64_t a1)
{
}

void sub_188BCB064(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = *(void **)(v4 + 168);
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  void v14[2] = sub_188BCB19C;
  v14[3] = &unk_18A2EDB38;
  void v14[4] = v4;
  objc_msgSend_transmitMessage_routingInfo_fragment_transmitter_( v5,  a2,  v3,  *(void *)(a1 + 88),  *(void *)(a1 + 96),  v6,  v14);
  if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == *(_DWORD *)(a1 + 104))
  {
    if ((*(_BYTE *)(a1 + 100) & 1) != 0
      || *(_DWORD *)(a1 + 92)
      || objc_msgSend_isBarrier(*(void **)(a1 + 40), v7, v8))
    {
      objc_msgSend_transmit_ofLength_(*(void **)(*(void *)(a1 + 32) + 32), v7, 0, 0);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0LL;

    if (*(_BYTE *)(a1 + 108)) {
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
    }
    uint64_t v12 = *(void *)(a1 + 80);
    if (v12) {
      objc_msgSend_releaseSize_(*(void **)(*(void *)(a1 + 32) + 136), v11, v12);
    }
    uint64_t v13 = *(dispatch_semaphore_s **)(a1 + 48);
    if (v13) {
      dispatch_semaphore_signal(v13);
    }
  }

  else if (*(void *)(a1 + 48))
  {
    dispatch_async( *(dispatch_queue_t *)(a1 + 56),  *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
  }

uint64_t sub_188BCB19C(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t result = objc_msgSend_transmit_ofLength_(*(void **)(*(void *)(a1 + 32) + 32), a2, (uint64_t)a2, a3);
  if (result != a3) {
    return objc_msgSend_disconnect(*(void **)(*(void *)(a1 + 32) + 32), v6, v7);
  }
  return result;
}

void sub_188BCB1EC(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  if (!v4) {
    sub_188BDA2F0();
  }
  int v5 = (void (**)(void, void))v4;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_188BC8900;
  int v16 = sub_188BC8910;
  id v17 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_188BCEC44;
  v9[3] = &unk_18A2EDE58;
  uint64_t v11 = &v12;
  uint64_t v7 = v6;
  id v10 = v7;
  uint64_t v8 = (void *)MEMORY[0x1895D398C](v9);
  ((void (**)(void, void *))v5)[2](v5, v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v3) {
    v3[2](v3, v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void sub_188BCB30C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_188BCB488( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_188BCB4A4(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 72LL);
  if (v4)
  {
    a3 = *(unsigned int *)(a1 + 72);
    if ((_DWORD)a3)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x189607968], a2, a3);
      int v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v4, v6, (uint64_t)v5);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    uint64_t v9 = *(void **)(v8 + 88);
    id v13 = (id)MEMORY[0x1895D398C](*(void *)(a1 + 56));
    objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)v13, *(void *)(a1 + 48));
  }

  else
  {
    if (*(_BYTE *)(v8 + 184))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      sub_188BCB5D0(*(unsigned int *)(a1 + 76), a2, a3);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_188BC9F54(" handler", (void *)v8, v11, v12);
    }

    objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 40), a2, 0, 0, *(void *)(a1 + 56));
  }

id sub_188BCB5D0(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorStatus_(v4, v5, 2);
  objc_msgSend_setIdentifier_(v4, v6, a1);
  objc_msgSend__makeImmutable((void *)kDTXInterruptionMessage, v7, v8);
  objc_msgSend_description(v4, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_188BCBC64(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id)objc_msgSend_newReply(a2, (const char *)a2, a3);
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( *(void **)(a1 + 32),  v4,  (uint64_t)v5,  *(void *)(a1 + 40),  2,  0,  0);
}

void sub_188BCBCB0(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  id v5 = (void *)MEMORY[0x1895D398C](a3);
  uint64_t v8 = objc_msgSend_unsignedLongLongValue(v17, v6, v7);
  if (objc_msgSend_channelCode(*(void **)(a1 + 32), v9, v10) == HIDWORD(v8))
  {
    objc_msgSend_removeObjectForKey_(*(void **)(a1 + 40), v11, (uint64_t)v17);
    uint64_t v14 = *(_BYTE **)(a1 + 48);
    if (v14[184])
    {
      uint64_t v15 = *(void **)(a1 + 32);
      sub_188BCB5D0(v8, v12, v13);
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_188BC9F54(" handler", v14, v15, v16);
    }

    objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 32), v12, *(void *)(a1 + 56), 0, v5);
  }
}

void sub_188BCBF50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_188BCBF78(uint64_t *a1, const char *a2)
{
  uint64_t v3 = a1[4];
  int v4 = *(_DWORD *)(v3 + 64);
  *(_DWORD *)(v3 + 64) = v4 + 1;
  *(_DWORD *)(*(void *)(a1[6] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v4;
  objc_msgSend_numberWithInt_(MEMORY[0x189607968], a2, *(unsigned int *)(*(void *)(a1[6] + 8) + 24));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc(&OBJC_CLASS___DTXChannel);
  uint64_t v7 = objc_msgSend_initWithConnection_channelIdentifier_label_( v5,  v6,  a1[4],  *(unsigned int *)(*(void *)(a1[6] + 8) + 24),  a1[5]);
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  objc_msgSend_setObject_forKey_(*(void **)(a1[4] + 72), v10, *(void *)(*(void *)(a1[7] + 8) + 40), v11);
}

uint64_t sub_188BCC02C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t result = objc_msgSend_errorStatus(a2, (const char *)a2, a3);
  if ((_DWORD)result)
  {
    id v5 = (os_log_s *)qword_18C4FE7C0;
    if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = @"nil";
      uint64_t v9 = *(void *)(a1 + 40);
      if (*(void *)(a1 + 32)) {
        uint64_t v8 = *(const __CFString **)(a1 + 32);
      }
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl( &dword_188BBF000,  v5,  OS_LOG_TYPE_ERROR,  "Connection peer refused channel request for %{public}@; channel canceled %@",
        (uint8_t *)&v10,
        0x16u);
    }

    return objc_msgSend_cancel(*(void **)(a1 + 40), v6, v7);
  }

  return result;
}

void sub_188BCC270(uint64_t a1, const char *a2, uint64_t a3)
{
  int v4 = (void *)MEMORY[0x189607968];
  uint64_t v5 = objc_msgSend_channelCode(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_numberWithInt_(v4, v6, v5);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(*(void **)(*(void *)(a1 + 40) + 80), v7, (uint64_t)v14);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v8;
  if (v8)
  {
    objc_msgSend_resume(v8, v9, v10);
    uint64_t v12 = 80LL;
  }

  else
  {
    uint64_t v12 = 72LL;
  }

  objc_msgSend_removeObjectForKey_(*(void **)(*(void *)(a1 + 40) + v12), v9, (uint64_t)v14);
  objc_msgSend__scheduleMessage_toChannel_(*(void **)(a1 + 40), v13, 0, *(void *)(a1 + 32));
}

void sub_188BCC790(_Unwind_Exception *a1)
{
}

void sub_188BCC7BC(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___DTXProxyChannel);
  uint64_t v3 = *(void *)(a1 + 32);
  objc_msgSend_peerProtocol(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4, v5);
  dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publishedProtocol(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = (id)objc_msgSend_initWithChannel_remoteProtocol_localProtocol_(v2, v10, v3, v6, v9);

  objc_msgSend_handlerBlock(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11, v12);
  uint64_t v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))v13)[2](v13, v14);
}

uint64_t sub_188BCC87C(void *a1, const char *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  uint64_t v5 = objc_msgSend_objectForKey_(*(void **)(a1[6] + 112), a2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v2, v3, v5);
}

uint64_t sub_188BCC9B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

LABEL_6:
}

void sub_188BCCB54(void *a1, uint64_t a2)
{
  id v6 = a1;
}

void sub_188BCD198(uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_alloc(&OBJC_CLASS___DTXProxyRequestHandler);
  uint64_t v4 = (void *)objc_msgSend_initWithPublishedProtocol_publishedProtocolName_peerProtocol_peerProtocolName_handlerBlock_( v2,  v3,  a1[4],  a1[5],  a1[6],  a1[7],  a1[9]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = *(id *)(a1[8] + 96);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend_matchesPublishedProtocolName_peerProtocolName_( *(void **)(*((void *)&v13 + 1) + 8 * v11),  v8,  a1[5],  a1[7],  (void)v13)) {
          objc_msgSend_raise_format_( MEMORY[0x189603F70],  v8,  (uint64_t)@"DTXConnectionException",  @"Proxy handler already exists for protocol pair specified.");
        }
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, v17, 16);
    }

    while (v9);
  }

  objc_msgSend_addObject_(*(void **)(a1[8] + 96), v12, (uint64_t)v4);
}

uint64_t sub_188BCD9D0(uint64_t a1, const char *a2)
{
  return objc_msgSend_setDispatchTarget_(*(void **)(a1 + 32), v4, 0);
}

void sub_188BCDA0C(uint64_t a1)
{
  v37[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)MEMORY[0x1895D37B8]();
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend__callbackSnapshot(v5, v2, v3);
    if (*((void *)&v34 + 1))
    {
      id v6 = pthread_getspecific(qword_18C4FE7D0);
      pthread_setspecific(qword_18C4FE7D0, *(const void **)(a1 + 32));
      uint64_t v8 = (dispatch_queue_s *)v34;
      if ((void)v34)
      {
        uint64_t v27 = MEMORY[0x1895F87A8];
        uint64_t v28 = 3254779904LL;
        id v29 = sub_188BCDC90;
        uint64_t v30 = &unk_18A2EDCC8;
        id v31 = *(id *)(a1 + 40);
        sub_188BCDCB0(v33, (uint64_t)&v34);
        uint64_t v32 = *(void *)(a1 + 32);
        dispatch_sync(v8, &v27);
        sub_188BCDD08(v33);
      }

      else
      {
        objc_msgSend_invokeWithTarget_replyChannel_validator_( *(void **)(a1 + 40),  v7,  *((uint64_t *)&v34 + 1),  *(void *)(a1 + 32),  *((void *)&v35 + 1));
      }

      pthread_setspecific(qword_18C4FE7D0, v6);
      goto LABEL_11;
    }
  }

  else
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
  }

  if (objc_msgSend_expectsReply(*(void **)(a1 + 40), v2, v3)
    && (objc_msgSend_isCanceled(*(void **)(a1 + 32), v9, v10) & 1) == 0)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_( MEMORY[0x189603F70],  v9,  (uint64_t)@"DTXMissingDispatchTargetException",  @"Unable to invoke message - channel has no dispatch target",  0);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void **)(a1 + 40);
    __int128 v13 = (void *)MEMORY[0x189607870];
    uint64_t v36 = *MEMORY[0x1896075E0];
    objc_msgSend_description(v11, v14, v15);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v17, (uint64_t)v37, &v36, 1);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v19, (uint64_t)@"DTXConnection", 1, v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    double v22 = (void *)objc_msgSend_newReplyWithError_(v12, v21, (uint64_t)v20);

    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( *(void **)(a1 + 48),  v23,  (uint64_t)v22,  *(void *)(a1 + 32),  2,  0,  0);
  }

void sub_188BCDC68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_188BCDC90(uint64_t a1, const char *a2)
{
  return objc_msgSend_invokeWithTarget_replyChannel_validator_( *(void **)(a1 + 32),  a2,  *(void *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 72));
}

uint64_t sub_188BCDCA4(uint64_t a1, uint64_t a2)
{
  return sub_188BCDCB0((void *)(a1 + 48), a2 + 48);
}

uint64_t sub_188BCDCB0(void *a1, uint64_t a2)
{
  *a1 = *(id *)a2;
  a1[1] = *(id *)(a2 + 8);
  a1[2] = MEMORY[0x1895D398C](*(void *)(a2 + 16));
  uint64_t result = MEMORY[0x1895D398C](*(void *)(a2 + 24));
  a1[3] = result;
  return result;
}

void sub_188BCDD00(uint64_t a1)
{
}

void sub_188BCDD08(id *a1)
{
}

void sub_188BCDD40(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend__callbackSnapshot(v4, a2, a3);
  }

  else
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
  }

  id v5 = pthread_getspecific(qword_18C4FE7D0);
  pthread_setspecific(qword_18C4FE7D0, *(const void **)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    int isCanceled = objc_msgSend_isCanceled(*(void **)(a1 + 32), v6, v7);
    uint64_t v10 = (uint64_t *)(a1 + 40);
    if (isCanceled) {
      uint64_t v10 = &kDTXInterruptionMessage;
    }
    goto LABEL_10;
  }

  uint64_t v8 = v22;
  if ((void)v22)
  {
    uint64_t v10 = (uint64_t *)(a1 + 40);
LABEL_10:
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, *v10);
    goto LABEL_11;
  }

  if (objc_msgSend_tracer(*(void **)(*(void *)(a1 + 32) + 24), v6, v7))
  {
    uint64_t v18 = *(void **)(a1 + 32);
    id v19 = (void *)v18[3];
    objc_msgSend_description(*(void **)(a1 + 40), v16, v17);
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    sub_188BC9F54("dropped message (no message handler)", v19, v18, v20);
  }

void sub_188BCDE5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_188BCDF2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_188BCDF4C(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0LL;
  result[6] = v2;
  uint64_t v3 = a2[7];
  a2[7] = 0LL;
  result[7] = v3;
  uint64_t v4 = a2[8];
  a2[8] = 0LL;
  result[8] = v4;
  uint64_t v5 = a2[9];
  a2[9] = 0LL;
  result[9] = v5;
  return result;
}

void sub_188BCDF80(uint64_t a1)
{
}

void sub_188BCDF88(os_unfair_lock_s *a1, void *a2)
{
  uint64_t v3 = a1 + 10;
  uint64_t v4 = a2;
  uint64_t v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4, (uint64_t)&v5[14]);

  os_unfair_lock_unlock(v3);
}

void sub_188BCDFF4(uint64_t a1, uint64_t a2)
{
}

void sub_188BCE004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1895D398C](*(void *)(a2 + 16));
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;

  uint64_t v6 = MEMORY[0x1895D398C](*(void *)(a2 + 24));
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v6;
}

void sub_188BCE130( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_188BCE148(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) != *(void *)(a2 + 16))
  {
    id v14 = (id)MEMORY[0x1895D398C]();
    if (objc_msgSend_isCanceled(*(void **)(a1 + 32), v4, v5))
    {
      uint64_t v7 = v14;
      if (v14)
      {
        objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 32), v6, 0, 0, v14);
        uint64_t v7 = v14;
      }

      id v14 = 0LL;
    }

    if (*(void *)(a2 + 16))
    {
      objc_msgSend__scheduleMessage_tracker_withHandler_(*(void **)(a1 + 32), v6, 0, 0);
      uint64_t v8 = *(void *)(a2 + 16);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    uint64_t v9 = MEMORY[0x1895D398C](v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = MEMORY[0x1895D398C](v14);
    uint64_t v13 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v12;
  }

void sub_188BCE328( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_188BCE340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int isCanceled = objc_msgSend_isCanceled(*(void **)(a1 + 32), (const char *)a2, a3);
  char v6 = isCanceled;
  if (isCanceled)
  {
    uint64_t v7 = *(void **)(a2 + 8);
  }

  else
  {
    uint64_t v7 = *(void **)(a2 + 8);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v7);
  if ((v6 & 1) != 0) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = *(void **)(a1 + 40);
  }
  objc_storeStrong((id *)(a2 + 8), v8);
LABEL_8:
  objc_storeStrong((id *)a2, *(id *)(a1 + 48));
}

void sub_188BCE444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1895D398C](*(void *)(a1 + 32));
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v3;
}

uint64_t sub_188BCE510(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_188BCE5EC(uint64_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)qword_18C4FE7C0;
  if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2082;
    Name = sel_getName(a2);
    _os_log_impl( &dword_188BBF000,  v4,  OS_LOG_TYPE_ERROR,  "Warning: called -[%{public}@ %{public}s] with NULL replyHandler!\n The caller will not block synchronously on this call as there is no handler to wait for.",  (uint8_t *)&v7,  0x16u);
  }

void sub_188BCE700(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v14 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( v9,  v12,  (uint64_t)v14,  v10,  0,  a4,  v11)) {
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(v9, v13, (uint64_t)v14, v10, 1, a4, v11);
  }
}

void sub_188BCE8FC(uint64_t a1, objc_class *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  objc_msgSend_schemes(a2, (const char *)a2, a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v21, v31, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v22;
    *(void *)&__int128 v8 = 138543874LL;
    __int128 v20 = v8;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = (objc_class *)(id)objc_msgSend_objectForKey_( (void *)qword_18C4FE7B0,  v7,  v12,  v20);
        if (v13)
        {
          uint64_t v15 = v13;
          __int128 v16 = (void *)qword_18C4FE7C0;
          if (os_log_type_enabled((os_log_t)qword_18C4FE7C0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v16;
            Name = class_getName(v15);
            id v19 = class_getName(a2);
            *(_DWORD *)buf = v20;
            uint64_t v26 = v12;
            __int16 v27 = 2082;
            uint64_t v28 = Name;
            __int16 v29 = 2082;
            uint64_t v30 = v19;
            _os_log_impl( &dword_188BBF000,  v17,  OS_LOG_TYPE_ERROR,  "Warning: duplicate registration of scheme %{public}@ - claims made by both %{public}s and %{public}s transports.",  buf,  0x20u);
          }
        }

        else
        {
          objc_msgSend_setObject_forKey_((void *)qword_18C4FE7B0, v14, (uint64_t)a2, v12);
        }
      }

      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v21, v31, 16);
    }

    while (v9);
  }
}

const char *sub_188BCEAB4(const char *a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = strrchr(a1, 47);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  uint32_t v4 = _dyld_image_count();
  if (!v4) {
    goto LABEL_7;
  }
  uint32_t v5 = v4;
  uint32_t v6 = 0;
  while (1)
  {
    image_name = _dyld_get_image_name(v6);
    __int128 v8 = strrchr(image_name, 47);
    if (v8)
    {
      if (!strcmp(v3, v8)) {
        break;
      }
    }

    if (v5 == ++v6) {
      goto LABEL_7;
    }
  }

  if (!image_name)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = a1;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "couldn't find dyld's real path for loaded image %s",  (uint8_t *)&v10,  0xCu);
    }

    return 0LL;
  }

  return image_name;
}

void sub_188BCEBC4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    objc_msgSend_objectForKey_((void *)qword_18C4FE7B0, v2, v3);
    uint32_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 40;
    *(void *)(*(void *)(v6 + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v4;
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 40;
    *(void *)(*(void *)(v7 + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0LL;
  }

  if (!*(void *)(*(void *)(*(void *)v5 + 8LL) + 24LL)) {
    *(void *)(*(void *)(*(void *)v5 + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = objc_opt_class();
  }
}

void sub_188BCEC44(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_188BCEC90(void *a1)
{
  id v1 = a1;
  else {
    id v5 = v1;
  }

  return v5;
}

void sub_188BCECE4(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_188BCEF30(uint64_t a1)
{
  socklen_t v10 = 28;
  if (getsockname(a1, &v11, &v10))
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v2, v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"int _getPortOfSocketFileDescriptor(int)");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v8 = __error();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_( v5,  v9,  (uint64_t)v7,  @"DTXSocketTransport.m",  23,  @"socket port could not be determined for %u (%u)",  a1,  *v8);
  }

  return bswap32(*(unsigned __int16 *)v11.sa_data) >> 16;
}

uint64_t sub_188BCEFE8(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a1 + 40);
  socklen_t v9 = 128;
  uint64_t v4 = accept(v2, &v10, &v9);
  id v5 = *(void **)(a1 + 32);
  if ((_DWORD)v4 == -1) {
    objc_msgSend_disconnect(v5, v3, v4);
  }
  else {
    objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_(v5, v3, v4, 1, 0);
  }
  return objc_msgSend__signalSocketAccepted(*(void **)(a1 + 32), v6, v7);
}

void sub_188BCF1B0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2))
    {
      uint64_t v3 = *(unsigned int *)(a1 + 32);
      uint64_t v4 = __error();
      id v5 = strerror(*v4);
      NSLog(@"Error closing socket file descriptor %d while disconnecting: %s", v3, v5);
    }
  }

LABEL_15:
  return v9;
}

id sub_188BCFAC4(uint64_t a1, const char *a2)
{
  if (!atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 32) + 48LL) + 48LL)))
  {
    unsigned int v4 = 64;
    do
    {
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 48LL) + 44LL)) {
        break;
      }
      if (v4 <= 0x40) {
        useconds_t v5 = 64;
      }
      else {
        useconds_t v5 = v4;
      }
      usleep(v5);
      unsigned int v4 = 2 * v5;
      if (2 * v5 >= 0x20000) {
        unsigned int v4 = 0x20000;
      }
    }

    while (!atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 32) + 48LL) + 48LL)));
  }

  uint64_t v7 = *(void *)(a1 + 32);
  __int128 v8 = *(_DWORD **)(v7 + 48);
  uint64_t v46 = a1;
  if (!v8[12])
  {
    objc_msgSend_setStatus_((void *)v7, a2, 1);
    uint64_t v7 = *(void *)(a1 + 32);
    __int128 v8 = *(_DWORD **)(v7 + 48);
  }

  int v9 = *(unsigned __int8 *)(v7 + 64);
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  __int16 v53 = sub_188BCFE64;
  int v54 = &unk_18A2EDEE8;
  uint64_t v55 = v7;
  sockaddr v10 = v52;
  int v50 = v8;
  if (v8)
  {
    int v11 = 0;
    uint64_t v12 = 15LL;
    if (!v9) {
      uint64_t v12 = 13LL;
    }
    uint64_t v13 = 14LL;
    if (v9) {
      uint64_t v13 = 16LL;
    }
    uint64_t v14 = 8LL;
    if (!v9) {
      uint64_t v14 = 6LL;
    }
    uint64_t v15 = v8[v14];
    if (v9) {
      __int128 v16 = v8 + 16;
    }
    else {
      __int128 v16 = v8 + 14;
    }
    uint64_t v17 = (uint64_t)v8 + v15 + 80;
    uint64_t v18 = 9LL;
    if (!v9) {
      uint64_t v18 = 7LL;
    }
    unsigned int v19 = v8[v18];
    uint64_t v20 = 11LL;
    if (!v9) {
      uint64_t v20 = 10LL;
    }
    unint64_t v21 = -1LL;
    __int16 v49 = &v50[v12];
    int v48 = &v50[v13];
    __int16 v47 = &v50[v20];
    unsigned int v22 = 64;
    uint64_t v23 = (uint64_t)v50 + v15 + 80;
    while (1)
    {
      while (1)
      {
        signed int v24 = atomic_load(v49);
        signed int v25 = atomic_load(v48);
        int v26 = v24 >= v25 ? 0 : v19;
        int v27 = v26 + v24;
        unsigned int v28 = atomic_load(v50 + 12);
        int v29 = v28 | v11;
        if (v27 != v25) {
          break;
        }
        if (v29) {
          BOOL v30 = 1;
        }
        else {
          BOOL v30 = v21 == 0;
        }
        if (v30) {
          goto LABEL_67;
        }
        unint64_t v31 = 1000 * v22;
        BOOL v32 = v21 >= v31;
        unint64_t v33 = v21 - v31;
        if (v32) {
          unint64_t v21 = v33;
        }
        else {
          unint64_t v21 = 0LL;
        }
        pid_t v34 = atomic_load(v47);
        __int128 v35 = v10;
        if (v22 <= 0x40) {
          useconds_t v36 = 64;
        }
        else {
          useconds_t v36 = v22;
        }
        usleep(v36);
        uint64_t v17 = v23;
        int v11 = 0;
        unsigned int v22 = 2 * v36;
        sockaddr v10 = v35;
        if (v22 > 0x20000)
        {
          int v11 = 0;
          unsigned int v22 = 0x20000;
          if (v34)
          {
            uint64_t v17 = v23;
            if (kill(v34, 0) != -1 || (v37 = __error(), v17 = v23, int v11 = 1, *v37 != 3)) {
              int v11 = 0;
            }
          }
        }
      }

      signed int v38 = v25;
      unsigned int v39 = v27 - v25;
      if ((v22 & 0xFFFE0000) != 0 || v39 > v19 >> 2) {
        unsigned int v22 = 64;
      }
      v41 = v10;
      uint64_t v42 = v19 - v25 >= v39 ? v39 : v19 - v25;
      unsigned __int8 v57 = 0;
      ((void (*)(void *, uint64_t, uint64_t, unsigned __int8 *))v53)(v41, v17 + v25, v42, &v57);
      uint64_t v43 = v39 - v42;
      if ((_DWORD)v43) {
        ((void (*)(void *, uint64_t, uint64_t, unsigned __int8 *))v53)(v41, v17, v43, &v57);
      }
      else {
        LODWORD(v43) = v42 + v38;
      }
      sockaddr v10 = v41;
      uint64_t v17 = v23;
      while (1)
      {
        unsigned int v44 = __ldaxr(v16);
        if (v44 != v38) {
          break;
        }
        if (!__stlxr(v43, v16)) {
          goto LABEL_63;
        }
      }

      __clrex();
      uint64_t v17 = v23;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Inconsistent reader offset in shared memory! MT reception suspected...\n",  buf,  2u);
        uint64_t v17 = v23;
      }

LABEL_63:
      int v11 = v57;
      if (v57) {
        break;
      }
      unint64_t v21 = -1LL;
      if (v29) {
        goto LABEL_67;
      }
    }

    atomic_store(1u, v50 + 12);
  }

LABEL_67:
  v51.receiver = *(id *)(v46 + 32);
  v51.super_class = (Class)&OBJC_CLASS___DTXSharedMemoryTransport;
  return objc_msgSendSuper2(&v51, sel_disconnect);
}

uint64_t sub_188BCFE64(uint64_t a1, const void *a2, size_t __size)
{
  size_t v5 = __size;
  uint64_t v6 = malloc(__size);
  memcpy(v6, a2, v5);
  uint64_t v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_188BCFEF4;
  v10[3] = &unk_18A2ED638;
  v10[4] = v6;
  return objc_msgSend_received_ofLength_destructor_(v7, v8, (uint64_t)v6, v5, v10);
}

void sub_188BCFEF4(uint64_t a1)
{
}

LABEL_36:
      signed int v25 = 0LL;
      goto LABEL_37;
    }

    uint64_t v23 = (size_t *)mmap(0LL, 0x1000uLL, 3, 1, v22, 0LL);
    if (v23 == (size_t *)-1LL)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        __int16 v53 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = 4096LL;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v71) = v53;
        int v54 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v55 = "Unable to map shared memory %s with size %ld: %d\n";
LABEL_34:
        _os_log_impl(&dword_188BBF000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x1Cu);
      }
    }

    else
    {
      signed int v24 = *v23;
      munmap(v23, 0x1000uLL);
      signed int v25 = (uint64_t)mmap(0LL, v24, 3, 1, v22, 0LL);
      if (v25 != -1)
      {
        close(v22);
        if (!v25)
        {
LABEL_37:

          goto LABEL_38;
        }

        int v26 = atomic_load((unsigned int *)(v25 + 44));
        if (!v26 || v26 == getpid())
        {
          atomic_store(getpid(), (unsigned int *)(v25 + 44));
          int v27 = *(void *)(v25 + 16);
          if (v27) {
            shm_unlink((const char *)(v25 + v27));
          }
          goto LABEL_37;
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v26;
          __int16 v47 = (os_log_s *)MEMORY[0x1895F8DA0];
          int v48 = "Unable to attach to shared memory - process %d already attached.\n";
          __int16 v49 = 8;
          goto LABEL_24;
        }

        goto LABEL_36;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        uint64_t v56 = *__error();
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v71) = v56;
        int v54 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v55 = "Unable to map shared memory %s with size %lld: %d\n";
        goto LABEL_34;
      }
    }

    close(v22);
    goto LABEL_36;
  }

  objc_msgSend_scheme(v4, v10, v11);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v14, v15, (uint64_t)@"shmem");

  if (isEqualToString) {
    goto LABEL_5;
  }
  objc_msgSend_host(v4, v12, v13);
  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v31 = objc_msgSend_intValue(v28, v29, v30);

  objc_msgSend_path(v4, v32, v33);
  pid_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v34, v35, v36) <= 1)
  {

    uint64_t v43 = 0LL;
  }

  else
  {
    unsigned int v39 = objc_msgSend_path(v4, v37, v38);
    uint64_t v42 = objc_msgSend_UTF8String(v39, v40, v41);

    uint64_t v43 = strtoull((const char *)(v42 + 1), 0LL, 16);
  }

  name = 0;
  unsigned int v44 = (vm_map_t *)MEMORY[0x1895FBBE0];
  uint64_t v45 = task_for_pid(*MEMORY[0x1895FBBE0], v31, &name);
  if (v45)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v45;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to acquire task for pid: %d (%d)\n",  buf,  0xEu);
    }

    goto LABEL_39;
  }

  if (!v43) {
    goto LABEL_58;
  }
  int v50 = name;
  if (name - 1 > 0xFFFFFFFD) {
    goto LABEL_58;
  }
  objc_super v51 = *v44;
  if (*v44 - 1 >= 0xFFFFFFFE) {
    goto LABEL_58;
  }
  *(void *)v73 = 0LL;
  v74 = v73;
  v75 = 0x2020000000LL;
  v76 = 0LL;
  *(void *)buf = MEMORY[0x1895F87A8];
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_188BD14B0;
  v71 = &unk_18A2EDF50;
  v72 = v73;
  int v52 = buf;
  if (mach_task_is_self(v50))
  {
    (*(void (**)(_BYTE *, mach_vm_address_t))&buf[16])(v52, v43);
  }

  else
  {
    v59 = *v44;
    *(void *)cur_protection = 0LL;
    target_address = 0LL;
    v60 = mach_vm_remap( v59,  &target_address,  0x50uLL,  0LL,  1048577,  v50,  v43,  0,  &cur_protection[1],  cur_protection,  2u);
    if (v60)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v77 = 134218496;
        v78 = v43;
        v79 = 1024;
        v80 = v50;
        v81 = 1024;
        v82 = v60;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory for address: %#llx in task: %d (%d)\n",  v77,  0x18u);
      }

      v61 = 0LL;
    }

    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v77 = 134218496;
          v78 = v43;
          v79 = 1024;
          v80 = v50;
          v81 = 1024;
          v82 = cur_protection[1];
          _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory r/w for address: %#llx in task: %d (%d)\n",  v77,  0x18u);
        }

        mach_vm_deallocate(v59, target_address, 0x50uLL);
      }

      v61 = target_address;
    }

    (*(void (**)(_BYTE *, mach_vm_address_t))&buf[16])(v52, v61);
    mach_vm_deallocate(*v44, v61, 0x50uLL);
  }

  v62 = *((void *)v74 + 3);
  if (!v62) {
    goto LABEL_57;
  }
  *(void *)cur_protection = 0LL;
  target_address = 0LL;
  v63 = mach_vm_remap(v51, &target_address, v62, 0LL, 1048577, v50, v43, 0, &cur_protection[1], cur_protection, 2u);
  if (v63)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 134218496;
      v78 = v43;
      v79 = 1024;
      v80 = v50;
      v81 = 1024;
      v82 = v63;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory for address: %#llx in task: %d (%d)\n",  v77,  0x18u);
    }

LABEL_57:
    _Block_object_dispose(v73, 8);
    goto LABEL_58;
  }

  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 134218496;
      v78 = v43;
      v79 = 1024;
      v80 = v50;
      v81 = 1024;
      v82 = cur_protection[1];
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to map memory r/w for address: %#llx in task: %d (%d)\n",  v77,  0x18u);
    }

    mach_vm_deallocate(v51, target_address, v62);
  }

  signed int v25 = target_address;
  _Block_object_dispose(v73, 8);
  if (!v25) {
    goto LABEL_59;
  }
  v64 = atomic_load((unsigned int *)(v25 + 44));
  if (!v64 || v64 == getpid())
  {
    atomic_store(getpid(), (unsigned int *)(v25 + 44));
    v65 = *(void *)(v25 + 16);
    if (v65) {
      shm_unlink((const char *)(v25 + v65));
    }
    goto LABEL_59;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v73 = 67109120;
    *(_DWORD *)&v73[4] = v64;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Unable to attach to shared memory - process %d already attached.\n",  v73,  8u);
  }

LABEL_58:
  signed int v25 = 0LL;
LABEL_59:
  mach_port_deallocate(*v44, name);
LABEL_38:
  if ((objc_msgSend__setupWithShm_asCreator_(v7, v57, v25, 0) & 1) == 0)
  {
LABEL_39:

    uint64_t v7 = 0LL;
  }

LABEL_40:
  return v7;
}

void sub_188BD0A48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_188BD0E54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t sub_188BD14B0(uint64_t result, void *a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *a2;
  }
  return result;
}

void sub_188BD17BC(void *a1)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v53 = 0LL;
  int v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  uint64_t v56 = 0LL;
  v52[0] = MEMORY[0x1895F87A8];
  v52[1] = 3221225472LL;
  void v52[2] = sub_188BD1C90;
  v52[3] = &unk_18A2EDF78;
  uint64_t v3 = a1 + 5;
  uint64_t v2 = a1[5];
  v52[4] = a1[4];
  v52[5] = &v53;
  uint64_t v4 = a1[6];
  v52[6] = v2;
  v52[7] = v4;
  uint64_t v45 = MEMORY[0x1895D398C](v52);
  BOOL v5 = (unint64_t)v54[3] >= *v3;
  uint64_t v6 = (uint64_t (**)(void, void, void))v45;
  if (!v5)
  {
    do
    {
      uint64_t v51 = 0LL;
      uint64_t v7 = ((uint64_t (**)(void, uint64_t, uint64_t *))v6)[2](v6, 32LL, &v51);
      if (!v7 || *(_BYTE *)(a1[4] + 48LL)) {
        break;
      }
      int v9 = *(_DWORD *)v7;
      int v10 = *(_DWORD *)(v7 + 4);
      int v11 = *(unsigned __int16 *)(v7 + 8);
      int v12 = *(unsigned __int16 *)(v7 + 10);
      uint64_t v13 = *(unsigned int *)(v7 + 12);
      uint64_t v14 = *(unsigned int *)(v7 + 16);
      uint64_t v49 = *(void *)(v7 + 20);
      int v50 = *(_DWORD *)(v7 + 28);
      if (v9 != 524114809)
      {
        useconds_t v36 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v37 = MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          signed int v38 = getprogname();
          pid_t v39 = getpid();
          uint64_t v40 = a1[5] - v54[3] + 32;
          *(_DWORD *)buf = 136315650;
          v58 = v38;
          LOWORD(v59) = 1024;
          *(_DWORD *)((char *)&v59 + 2) = v39;
          HIWORD(v59) = 2048;
          uint64_t v60 = v40;
          _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%u]: [connection error] handling %llu bytes with unexpected protocol header; disconnecting.",
            buf,
            0x1Cu);
        }

        *(_BYTE *)(a1[4] + 48LL) = 1;
        free(*(void **)(a1[4] + 8LL));
        *(void *)(a1[4] + 8LL) = 0LL;
        (*(void (**)(void))(*(void *)(a1[4] + 40LL) + 16LL))();
        uint64_t v42 = a1[4];
        v41 = a1 + 4;
        uint64_t v43 = *(void **)(v42 + 40);
        *(void *)(v42 + 40) = 0LL;

        uint64_t v18 = *(void **)(*v41 + 32LL);
        *(void *)(*v41 + 32LL) = 0LL;
LABEL_21:

        uint64_t v6 = (uint64_t (**)(void, void, void))v45;
        break;
      }

      if (v12 == 1)
      {
        uint64_t v16 = ((uint64_t (**)(void, uint64_t, uint64_t *))v6)[2](v6, v13, &v51);
        if (!v16) {
          break;
        }
        uint64_t v17 = (_BYTE *)a1[4];
        if (v17[48]) {
          break;
        }
        v48[0] = MEMORY[0x1895F87A8];
        v48[1] = 3221225472LL;
        v48[2] = sub_188BD1D88;
        v48[3] = &unk_18A2ED638;
        v48[4] = v16;
        *(_DWORD *)buf = 524114809;
        LODWORD(v5_Block_object_dispose(va, 8) = v10;
        WORD2(v5_Block_object_dispose(va, 8) = v11;
        HIWORD(v5_Block_object_dispose(va, 8) = 1;
        unint64_t v59 = __PAIR64__(v14, v13);
        uint64_t v60 = v49;
        int v61 = v50;
        objc_msgSend__messageParsedWithHeader_bytes_length_destructor_(v17, v15, (uint64_t)buf, v16 + 32, v13, v48);
        *(void *)(a1[4] + 8LL) = 0LL;
        *(void *)(a1[4] + 16LL) = 0LL;
        *(void *)(a1[4] + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0LL;
      }

      else
      {
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v8, v14);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v45 + 16))(v45, v13, &v51);
          if (!v20) {
            goto LABEL_21;
          }
          uint64_t v21 = a1[4];
          if (*(_BYTE *)(v21 + 48)) {
            goto LABEL_21;
          }
          objc_msgSend_objectForKeyedSubscript_(*(void **)(v21 + 64), v19, (uint64_t)v18);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendBytes_length_(v22, v23, v20 + 32, v13);
          if (v12 - 1 == v11)
          {
            unsigned int v44 = (void *)a1[4];
            id v24 = v22;
            uint64_t v27 = objc_msgSend_bytes(v24, v25, v26);
            uint64_t v30 = objc_msgSend_length(v24, v28, v29);
            v46[0] = MEMORY[0x1895F87A8];
            v46[1] = 3221225472LL;
            v46[2] = sub_188BD1D90;
            v46[3] = &unk_18A2ED618;
            id v22 = v24;
            id v47 = v22;
            *(_DWORD *)buf = 524114809;
            LODWORD(v5_Block_object_dispose(va, 8) = v10;
            WORD2(v5_Block_object_dispose(va, 8) = v11;
            HIWORD(v5_Block_object_dispose(va, 8) = v12;
            unint64_t v59 = __PAIR64__(v14, v13);
            uint64_t v60 = v49;
            int v61 = v50;
            objc_msgSend__messageParsedWithHeader_bytes_length_destructor_(v44, v31, (uint64_t)buf, v27, v30, v46);
            objc_msgSend_removeObjectForKey_(*(void **)(a1[4] + 64), v32, (uint64_t)v18);
          }
        }

        else
        {
          id v33 = objc_alloc(MEMORY[0x189603FB8]);
          id v22 = (id)objc_msgSend_initWithCapacity_(v33, v34, v13);
          objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 64), v35, (uint64_t)v22, v18);
        }

        *(void *)(a1[4] + 16LL) = 0LL;

        uint64_t v6 = (uint64_t (**)(void, void, void))v45;
      }
    }

    while ((unint64_t)v54[3] < a1[5]);
  }

  _Block_object_dispose(&v53, 8);
}

void sub_188BD1C58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_188BD1C90(void *a1, unsigned int a2, unint64_t *a3)
{
  unint64_t v5 = *a3 + a2;
  *a3 = v5;
  uint64_t v6 = (void *)a1[4];
  if (v6[3] < v5)
  {
    v6[3] = (v5 + 127) & 0xFFFFFFFFFFFFFF80LL;
    *(void *)(a1[4] + 8LL) = realloc(*(void **)(a1[4] + 8LL), *(void *)(a1[4] + 24LL));
    uint64_t v6 = (void *)a1[4];
    unint64_t v5 = *a3;
  }

  unint64_t v7 = v6[2];
  unint64_t v8 = v5 - v7;
  if (v5 > v7)
  {
    uint64_t v9 = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
    if (v8 >= a1[6] - v9) {
      unint64_t v8 = a1[6] - v9;
    }
    uint64_t v10 = v8;
    if ((_DWORD)v8)
    {
      memcpy((void *)(v6[1] + v7), (const void *)(a1[7] + v9), v8);
      *(void *)(a1[4] + 16LL) += v10;
      *(void *)(*(void *)(a1[5] + 8LL) + 24LL) += v10;
      uint64_t v6 = (void *)a1[4];
      unint64_t v7 = v6[2];
      unint64_t v5 = *a3;
    }
  }

  if (v7 >= v5) {
    return v6[1];
  }
  else {
    return 0LL;
  }
}

void sub_188BD1D88(uint64_t a1)
{
}

uint64_t sub_188BD1D90(uint64_t a1, const char *a2)
{
  return objc_msgSend_setLength_(*(void **)(a1 + 32), a2, 0);
}

uint64_t sub_188BD1E50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_188BD1E60(uint64_t a1)
{
}

void sub_188BD1E68(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 48))
  {
    *(_BYTE *)(v3 + 4_Block_object_dispose(va, 8) = 1;
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40LL) + 16LL))();
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;

    uint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0LL;

    uint64_t v3 = *(void *)(a1 + 32);
  }

  uint64_t v8 = *(void *)(v3 + 8);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], a2, v8, *(void *)(v3 + 16));
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

void sub_188BD220C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_188BD2230(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *sub_188BD223C(void *result, uint64_t a2, unsigned int a3)
{
  if (*(_DWORD *)(*(void *)(result[5] + 8LL) + 24LL))
  {
    uint64_t v3 = *(void *)(result[6] + 8LL);
    unint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = a3;
    if (v4 < a3) {
      uint64_t v5 = *(void *)(v3 + 24);
    }
    *(void *)(v3 + 24) = v4 - v5;
    unsigned int v6 = a3 - v5;
    if (a3 != (_DWORD)v5)
    {
      uint64_t v7 = *(void *)(result[5] + 8LL);
      unsigned int v8 = *(_DWORD *)(v7 + 24);
      if (v6 >= v8) {
        unsigned int v9 = *(_DWORD *)(v7 + 24);
      }
      else {
        unsigned int v9 = v6;
      }
      *(_DWORD *)(v7 + 24) = v8 - v9;
      return (void *)(*(uint64_t (**)(void))(result[4] + 16LL))();
    }
  }

  return result;
}

__CFString *sub_188BD2534(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  unsigned int v8 = v5;
  if ((uint64_t *)kDTXInterruptionMessage == v5)
  {
    uint64_t v10 = @"< DTXMessage : kDTXInterruptionMessage >";
    goto LABEL_43;
  }

  if (objc_msgSend_errorStatus(v5, v6, v7) == 2)
  {
    objc_msgSend_stringWithFormat_( NSString,  v9,  (uint64_t)@"< DTXMessage : i%u kDTXInterruptionMessage >",  a2);
LABEL_4:
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }

  if ((uint64_t *)kDTXBarrierMessage == v8)
  {
    uint64_t v10 = @"< DTXMessage : kDTXBarrierMessage >";
    goto LABEL_43;
  }

  if ((uint64_t *)kDTXAckBarrierMessage == v8)
  {
    uint64_t v10 = @"< DTXMessage : kDTXAckBarrierMessage >";
    goto LABEL_43;
  }

  uint64_t v11 = "";
  if ((a3 & 0x100000000LL) != 0) {
    int v12 = "e";
  }
  else {
    int v12 = "";
  }
  if ((uint64_t *)kDTXHeartbeatMessage == v8)
  {
    objc_msgSend_stringWithFormat_( NSString,  v9,  (uint64_t)@"< DTXMessage : i%d.%d%s kDTXHeartbeatMessage >",  a2,  HIDWORD(a2),  v12);
    goto LABEL_4;
  }

  else {
    uint64_t v13 = -(int)a3;
  }
  objc_msgSend_stringWithFormat_( MEMORY[0x189607940],  v9,  (uint64_t)@"< DTXMessage %p : i%d.%d%s c%d%s",  v8,  a2,  HIDWORD(a2),  v12,  v13,  v11);
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend_messageType(v8, v14, v15))
  {
    case 1u:
      unint64_t v53 = 0LL;
      uint64_t v18 = v8;
      objc_msgSend_getBufferWithReturnedLength_(v18, v19, (uint64_t)&v53);
      if (v53 >> 30)
      {
        objc_msgSend_appendFormat_(v10, v20, (uint64_t)@" buffer: %.3f GB", (double)v53 * 9.31322575e-10);
      }

      else if (v53 < 0x100000)
      {
        if (v53 < 0x400) {
          objc_msgSend_appendFormat_(v10, v20, (uint64_t)@" buffer: %lld bytes", v53);
        }
        else {
          objc_msgSend_appendFormat_(v10, v20, (uint64_t)@" buffer: %.3f KB", (double)v53 * 0.0009765625);
        }
      }

      else
      {
        objc_msgSend_appendFormat_(v10, v20, (uint64_t)@" buffer: %.3f MB", (double)v53 * 0.000000953674316);
      }

      break;
    case 2u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)@" dispatch:[");
      objc_msgSend_payloadObject(v8, v21, v22);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsSeparatedByString_(v23, v24, (uint64_t)@":");
      signed int v25 = (void *)objc_claimAutoreleasedReturnValue();
      size_t v28 = objc_msgSend_count(v25, v26, v27);
      uint64_t v29 = calloc(v28, 8uLL);
      unint64_t v53 = 0LL;
      int v54 = &v53;
      uint64_t v55 = 0x2020000000LL;
      int v56 = 0;
      uint64_t v30 = v8[7];
      uint64_t v31 = MEMORY[0x1895F87A8];
      v52[0] = MEMORY[0x1895F87A8];
      v52[1] = 3221225472LL;
      void v52[2] = sub_188BD62EC;
      v52[3] = &unk_18A2EE210;
      v52[4] = &v53;
      v52[5] = v28;
      v52[6] = v29;
      sub_188BD6260(v30, v52);
      v47[0] = v31;
      v47[1] = 3221225472LL;
      v47[2] = sub_188BD6358;
      v47[3] = &unk_18A2EE238;
      BOOL v32 = v10;
      int v48 = v32;
      uint64_t v49 = &v53;
      size_t v50 = v28;
      uint64_t v51 = v29;
      objc_msgSend_enumerateObjectsUsingBlock_(v25, v33, (uint64_t)v47);
      if (*((_DWORD *)v54 + 6))
      {
        unint64_t v34 = 0LL;
        do
        {
          __int128 v35 = (void *)v29[v34];
          v29[v34] = 0LL;

          ++v34;
        }

        while (v34 < *((unsigned int *)v54 + 6));
      }

      free(v29);
      objc_msgSend_appendString_(v32, v36, (uint64_t)@"]");

      _Block_object_dispose(&v53, 8);
      goto LABEL_34;
    case 3u:
      objc_msgSend_payloadObject(v8, v16, v17);
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      signed int v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      pid_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v10, v40, (uint64_t)@" object:(%@*)", v39);

      objc_msgSend_payloadObject(v8, v41, v42);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_188BD63EC(v10, v23, 0, 1);
      goto LABEL_34;
    case 4u:
      objc_msgSend_payloadObject(v8, v16, v17);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v10, v43, (uint64_t)@" error: %@", v23);
      goto LABEL_34;
    case 5u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)@" ack barrier");
      break;
    case 6u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)@" primitive message");
      break;
    case 7u:
      objc_msgSend_appendString_(v10, v16, (uint64_t)@" compressed buffer");
      break;
    case 8u:
      objc_msgSend_payloadObject(v8, v16, v17);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v10, v44, (uint64_t)@" rerouted message: %@", v23);
LABEL_34:

      break;
    default:
      break;
  }

  objc_msgSend_appendString_(v10, v16, (uint64_t)@" >");
  CFDictionaryRef v45 = CFDictionaryCreateWithDTXPrimitiveDictionary(v8[7]);
  if (v45) {
    sub_188BD63EC(v10, v45, 1, 1);
  }

LABEL_43:
  return v10;
}

void sub_188BD29C0(_Unwind_Exception *a1)
{
}

void sub_188BD2A54(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    uint64_t v2 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_18C7403F8);
    v2[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C7403F8);
    uint64_t v1 = v2;
  }
}

void sub_188BD2AA8(void *a1)
{
}

void sub_188BD2AC0(_Unwind_Exception *a1)
{
}

void sub_188BD2AD4(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895D398C](*(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_18C740400;
  qword_18C740400 = v1;
}

uint64_t sub_188BD2DD0(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3 = qword_18C740400;
  if (qword_18C740400)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 40);
    uint64_t v6 = objc_msgSend_length(*(void **)(*(void *)(result + 32) + 24), a2, a3);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, void))(v3 + 16))( v3,  v5,  v6,  *(void *)(v4 + 48) * (unint64_t)dword_18C4FE7F0 / *(unsigned int *)algn_18C4FE7F4,  *(unsigned int *)(v4 + 56));
  }

  return result;
}

id sub_188BD3540( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = objc_alloc(v10);
  uint64_t v14 = (__CFString *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, &a9);

  uint64_t v15 = &stru_18A2EF878;
  if (v14) {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v15;

  uint64_t v17 = (void *)MEMORY[0x189607870];
  uint64_t v23 = *MEMORY[0x1896075E0];
  v24[0] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v18, (uint64_t)v24, &v23, 1);
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v17, v20, (uint64_t)@"DTXConnection", a1, v19);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void sub_188BD37D8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  uint64_t v6 = (void *)MEMORY[0x1895D37B8]();
  if (v3)
  {
    id v21 = 0LL;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_( MEMORY[0x1896078F8],  v5,  (uint64_t)v3,  1,  &v21);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v8 = (__CFString *)v21;
    if (!v7)
    {
      unsigned int v9 = (void *)MEMORY[0x189603F70];
      uint64_t v10 = *MEMORY[0x189603A60];
      uint64_t v11 = objc_opt_class();
      uint64_t v13 = &stru_18A2EF878;
      if (v8) {
        uint64_t v13 = v8;
      }
      objc_msgSend_raise_format_( v9,  v12,  v10,  @"Unable to archive object <%@ %p> via NSSecureCoding. %@",  v3,  v11,  v13);
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    unsigned int v8 = 0LL;
  }

  id v14 = v7;
  uint64_t v17 = objc_msgSend_bytes(v14, v15, v16);
  uint64_t v20 = objc_msgSend_length(v14, v18, v19);
  v4[2](v4, v17, v20);

  objc_autoreleasePoolPop(v6);
}

unint64_t **sub_188BD38FC(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(void *)(a1 + 32) + 56LL), 0LL, a2, a3);
}

unint64_t **sub_188BD3ACC(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(void *)(a1 + 32) + 56LL), 0LL, a2, a3);
}

unint64_t **sub_188BD3CE0(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(void *)(a1 + 32) + 56LL), 0LL, a2, a3);
}

LABEL_10:
  self->_messageType = 1;
}

uint64_t sub_188BD3E58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_188BD3F54(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t result = objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_( *(void **)(a1 + 32),  a2,  (uint64_t)a2,  a3,  1,  0);
  *(_DWORD *)(*(void *)(a1 + 32) + 8LL) = 3;
  return result;
}

void sub_188BD3FD8(void *a1, void *a2)
{
  id v3 = a1;
  id v6 = a2;
  if (!*((void *)v3 + 6))
  {
    uint64_t v7 = (void *)*((void *)v3 + 3);
    if (v7)
    {
      int v8 = *((_DWORD *)v3 + 2);
      if ((v8 - 2) < 3)
      {
        uint64_t v9 = objc_msgSend_bytes(v7, v4, v5);
        uint64_t v12 = objc_msgSend_length(*((void **)v3 + 3), v10, v11);
        v23[0] = MEMORY[0x1895F87A8];
        v23[1] = 3221225472LL;
        v23[2] = sub_188BD6B30;
        v23[3] = &unk_18A2EE288;
        id v24 = v3;
        sub_188BD6758(v9, v12, v6, v23);
        uint64_t v13 = v24;
LABEL_12:

        goto LABEL_13;
      }

      if (v8 == 1)
      {
        uint64_t v20 = objc_opt_class();
        if ((objc_msgSend_containsObject_(v6, v21, v20) & 1) == 0)
        {
          uint64_t v13 = (void *)*((void *)v3 + 6);
          *((void *)v3 + 6) = 0LL;
          goto LABEL_12;
        }

        uint64_t v19 = objc_msgSend_dataWithData_(MEMORY[0x189603F48], v22, *((void *)v3 + 3));
        goto LABEL_10;
      }

      if (v8 == 6)
      {
        uint64_t v14 = objc_msgSend_bytes(v7, v4, v5);
        uint64_t v17 = objc_msgSend_length(*((void **)v3 + 3), v15, v16);
        uint64_t v18 = DTXPrimitiveDictionaryReferencingSerialized(v14, v17);
        uint64_t v19 = (uint64_t)CFDictionaryCreateWithDTXPrimitiveDictionary(v18);
LABEL_10:
        uint64_t v13 = (void *)*((void *)v3 + 6);
        *((void *)v3 + 6) = v19;
        goto LABEL_12;
      }
    }
  }

LABEL_13:
}

void sub_188BD4370()
{
  v4[3] = *MEMORY[0x1895F89C0];
  v3[0] = objc_opt_class();
  v4[0] = &unk_18A2EE0A0;
  v3[1] = objc_opt_class();
  v4[1] = &unk_18A2EE0E0;
  v3[2] = objc_opt_class();
  v4[2] = &unk_18A2EE120;
  uint64_t v1 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v0, (uint64_t)v4, v3, 3);
  uint64_t v2 = (void *)qword_18C4FE800;
  qword_18C4FE800 = v1;
}

unint64_t *sub_188BD4434(int a1, unint64_t *a2, id a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = (char *)objc_msgSend_UTF8String(v6, v8, v9);
  uint64_t v13 = objc_msgSend_longLongValue(v7, v11, v12);

  return DTXPrimitiveDictionaryAddPrimitivePair(a2, v10, 6, v13);
}

unint64_t *sub_188BD44A8(int a1, unint64_t *a2, id a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = (char *)objc_msgSend_UTF8String(v6, v8, v9);
  id v11 = v7;
  uint64_t v14 = objc_msgSend_UTF8String(v11, v12, v13);

  return DTXPrimitiveDictionaryAddPrimitivePair(a2, v10, 1, v14);
}

unint64_t **sub_188BD4524(int a1, unint64_t **a2, id a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = (char *)objc_msgSend_UTF8String(v6, v8, v9);
  id v11 = v7;
  uint64_t v14 = (void *)objc_msgSend_bytes(v11, v12, v13);
  size_t v17 = objc_msgSend_length(v11, v15, v16);

  return DTXPrimitiveDictionaryAddBufferPair(a2, v10, v14, v17);
}

void sub_188BD45A8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  Class Class = object_getClass(v5);
  if (Class)
  {
    Superclass = Class;
    do
    {
      uint64_t v9 = objc_msgSend_objectForKeyedSubscript_((void *)qword_18C4FE800, v7, (uint64_t)Superclass);
      uint64_t v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, *(void *)(a1 + 32) + 56LL, v11, v5);
      }

      Superclass = class_getSuperclass(Superclass);
    }

    while (Superclass);
  }
}

unint64_t **sub_188BD49BC(uint64_t a1, void *a2, size_t a3)
{
  id v5 = (unint64_t **)(*(void *)(a1 + 32) + 56LL);
  id v6 = *(id *)(a1 + 40);
  uint64_t v9 = (char *)objc_msgSend_UTF8String(v6, v7, v8);
  return DTXPrimitiveDictionaryAddBufferPair(v5, v9, a2, a3);
}

uint64_t sub_188BD5078(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_18C4FE808 != -1) {
    dispatch_once(&qword_18C4FE808, &unk_18A2EE2F8);
  }
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v4 = (dispatch_queue_s *)qword_18C4FE810;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BD6C9C;
  block[3] = &unk_18A2EE348;
  uint64_t v10 = &v12;
  uint64_t v11 = a1;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
  uint64_t v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_188BD5624( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
  if (a2 == 1)
  {
    id v36 = objc_begin_catch(a1);
    id v37 = (void *)MEMORY[0x189607870];
    *(void *)(v33 - 12_Block_object_dispose((const void *)(v33 - 160), 8) = *MEMORY[0x1896075E0];
    objc_msgSend_description(v36, v38, v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)(v33 - 120) = v40;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v41, v33 - 120, v33 - 128, 1);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v37, v43, (uint64_t)@"DTXMessage", 1, v42);
    unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = (void *)objc_msgSend_newReplyWithError_(v32, v45, (uint64_t)v44);

    objc_msgSend_sendControlAsync_replyHandler_(v31, v47, (uint64_t)v46, 0);
    objc_end_catch();
    JUMPOUT(0x188BD55D8LL);
  }

  _Unwind_Resume(a1);
}

void sub_188BD5764(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = sub_188BD6EE4;
  v9[3] = &unk_18A2EE398;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  _DTXPrimitiveDictionaryEnumerate(a1, (uint64_t)v9);
}

void sub_188BD5804(uint64_t a1, uint64_t a2, void *a3, const void *a4, unsigned int a5, void *a6)
{
  id v10 = a3;
  id v24 = v10;
  id v11 = a6;
  uint64_t v14 = v11;
  if (v11)
  {
    char v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = *MEMORY[0x189607680];
    objc_msgSend_userInfo(v11, v12, v13);
    size_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, *MEMORY[0x189607490]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v15,  v20,  v16,  @"Arguments must conform to expected NSSecureCoding classes: %@",  v19,  v24);
  }

  unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v21 < *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    if (a4)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL)) {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = CFArrayCreateMutable(0LL, 0LL, 0LL);
      }
      uint64_t v22 = malloc(a5);
      memcpy(v22, a4, a5);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL), v22);
      objc_msgSend_setArgument_atIndex_( *(void **)(a1 + 32),  v23,  (uint64_t)v22,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 2);
    }

    else
    {
      if (v10)
      {
        objc_msgSend_addObject_(*(void **)(a1 + 40), v12, (uint64_t)v10);
        unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      }

      objc_msgSend_setArgument_atIndex_(*(void **)(a1 + 32), v12, (uint64_t)&v24, v21 + 2);
    }

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }
}

void sub_188BD59B0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (a3) {
    uint64_t v5 = objc_msgSend_newReplyWithError_(v3, a2, a3);
  }
  else {
    uint64_t v5 = objc_msgSend_newReplyWithObject_(v3, a2, (uint64_t)a2);
  }
  id v6 = (char *)v5;
  objc_msgSend_sendControlAsync_replyHandler_(v4, v6, (uint64_t)v6, 0);
}

LABEL_7:
  return v11;
}

uint64_t sub_188BD5EE4(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_( *(void **)(a1 + 32),  a2,  (uint64_t)a2,  a3,  0,  0);
}

uint64_t sub_188BD602C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_188BD6040(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_( *(void **)(a1 + 32),  a2,  (uint64_t)a2,  a3,  0,  0);
}

void sub_188BD6260(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)qword_18C4FE7E8;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = sub_188BD66EC;
  v6[3] = &unk_18A2EE260;
  id v7 = v3;
  id v5 = v3;
  sub_188BD5764(a1, v4, v6);
}

void sub_188BD62EC(void *a1, void *a2)
{
  id v4 = a2;
  unint64_t v5 = *(unsigned int *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (a1[5] > v5)
  {
    id v6 = v4;
    objc_storeStrong((id *)(a1[6] + 8 * v5), a2);
    id v4 = v6;
    ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
  }
}

void sub_188BD6358(uint64_t a1, const char *a2, unint64_t a3)
{
  if (a3 + 1 < *(void *)(a1 + 48))
  {
    if (a3) {
      objc_msgSend_appendString_(*(void **)(a1 + 32), v5, (uint64_t)@" ");
    }
    objc_msgSend_appendString_(*(void **)(a1 + 32), v5, (uint64_t)@":");
  }

void sub_188BD63EC(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v9 = a2;
  if (!v9)
  {
    objc_msgSend_appendString_(v7, v8, (uint64_t)@"nil");
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v10 = v9;
    uint64_t v13 = objc_msgSend_length(v10, v11, v12);
    objc_msgSend_appendFormat_(v7, v14, (uint64_t)@"<NSData %p | %u bytes> ", v10, v13);
    if (!a3)
    {
LABEL_6:

      goto LABEL_8;
    }

    id v15 = v10;
    uint64_t v18 = objc_msgSend_bytes(v15, v16, v17);
    uint64_t v21 = objc_msgSend_length(v15, v19, v20);
    objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v22, v23);
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1895F87A8];
    v55[1] = 3221225472LL;
    v55[2] = sub_188BD695C;
    v55[3] = &unk_18A2EE288;
    id v56 = v7;
    sub_188BD6758(v18, v21, v24, v55);

    signed int v25 = v56;
LABEL_5:

    goto LABEL_6;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v28 = objc_msgSend_count(v9, v26, v27);
    objc_msgSend_appendFormat_(v7, v29, (uint64_t)@"<NSArray %p | %ld objects>", v9, v28);
    if (a4)
    {
      objc_msgSend_appendString_(v7, v30, (uint64_t)@" { ");
      v53[0] = MEMORY[0x1895F87A8];
      v53[1] = 3221225472LL;
      v53[2] = sub_188BD6A2C;
      v53[3] = &unk_18A2EE2B0;
      id v31 = v7;
      id v54 = v31;
      objc_msgSend_enumerateObjectsUsingBlock_(v9, v32, (uint64_t)v53);
      objc_msgSend_appendString_(v31, v33, (uint64_t)@" }");
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!a4)
      {
        uint64_t v48 = objc_msgSend_count(v9, v34, v35);
        objc_msgSend_appendFormat_(v7, v49, (uint64_t)@"<NSDictionary %p | %ld key/value pairs>", v9, v48);
        goto LABEL_8;
      }

      id v10 = v9;
      if (!objc_msgSend_count(v10, v36, v37)) {
        goto LABEL_6;
      }
      objc_msgSend_appendString_(v7, v38, (uint64_t)@" {\n");
      v50[0] = MEMORY[0x1895F87A8];
      v50[1] = 3221225472LL;
      v50[2] = sub_188BD6ABC;
      v50[3] = &unk_18A2EE2D8;
      id v39 = v7;
      id v51 = v39;
      char v52 = a3;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v40, (uint64_t)v50);
      objc_msgSend_appendString_(v39, v41, (uint64_t)@"}");
      signed int v25 = v51;
      goto LABEL_5;
    }

    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
    uint64_t v45 = sub_188BD69A4(v9, v43, v44);
    id v47 = (void *)v45;
    if ((isKindOfClass & 1) != 0) {
      objc_msgSend_appendFormat_(v7, v46, (uint64_t)@"%@", v45);
    }
    else {
      objc_msgSend_appendFormat_(v7, v46, (uint64_t)@"[%@]", v45);
    }
  }

LABEL_8:
}

void sub_188BD66EC(uint64_t a1, int a2, int a3, char *cStr, CFIndex length)
{
  if (cStr)
  {
    CFDataRef ObjectFromPrimitiveType = _createObjectFromPrimitiveType(a2, cStr, length);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void sub_188BD6758(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v17[3] = *(id *)MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v10 = (void *)MEMORY[0x1895D37B8]();
  if (a2)
  {
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x189603F48], v9, a1, a2, 0);
    v17[0] = 0LL;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v7;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x189607908], v13, (uint64_t)v12, v11, v17);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    id v15 = v17[0];
  }

  else
  {
    uint64_t v14 = 0LL;
    id v15 = 0LL;
  }

  if (v15) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = v14;
  }
  ((void (**)(id, void *, id))v8)[2](v8, v16, v15);

  objc_autoreleasePoolPop(v10);
}

void sub_188BD695C(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  sub_188BD69A4(a2, (const char *)a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)@"[%@]", v5);
}

id sub_188BD69A4(void *a1, const char *a2, uint64_t a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v3, v4, v5) >= 0x101)
  {
    id v7 = (void *)NSString;
    objc_msgSend_substringToIndex_(v3, v6, 253);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)@"%@...", v8);

    id v3 = (void *)v10;
  }

  return v3;
}

void sub_188BD6A2C(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = (char *)v7;
  if (a3 && (objc_msgSend_appendString_(*(void **)(a1 + 32), v7, (uint64_t)@", "), id v7 = v8, a3 > 4))
  {
    objc_msgSend_appendString_(*(void **)(a1 + 32), v8, (uint64_t)@"... ");
    *a4 = 1;
  }

  else
  {
    sub_188BD63EC(*(void *)(a1 + 32), v7, 0LL, 0LL);
  }
}

uint64_t sub_188BD6ABC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend_appendFormat_(v5, v7, (uint64_t)@"    %@ : ", a2);
  sub_188BD63EC(*(void *)(a1 + 32), v6, *(unsigned __int8 *)(a1 + 40), 0LL);

  return objc_msgSend_appendString_(*(void **)(a1 + 32), v8, (uint64_t)@"\n");
}

void sub_188BD6B30(uint64_t a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v7 && *(_DWORD *)(v10 + 8) == 4)
  {
    id v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x189607798];
    v18[0] = *MEMORY[0x1896075E0];
    v18[1] = v12;
    v19[0] = @"Failed to deserialize message";
    v19[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v8, (uint64_t)v19, v18, 2);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v14, (uint64_t)@"DTXMessage", 2, v13);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 4_Block_object_dispose((const void *)(v33 - 160), 8) = v15;
  }

  else
  {
    objc_storeStrong((id *)(v10 + 48), a2);
  }
}

void sub_188BD6C54()
{
  dispatch_queue_t v0 = dispatch_queue_create("selector checking queue", 0LL);
  uint64_t v1 = (void *)qword_18C4FE810;
  qword_18C4FE810 = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_18C4FE818;
  qword_18C4FE818 = v2;
}

void sub_188BD6C9C(uint64_t a1)
{
  Superclass = (objc_class *)objc_opt_class();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(Superclass);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_((void *)qword_18C4FE818, v5, (uint64_t)v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    uint64_t v18 = v4;
    uint64_t v19 = a1;
    uint64_t v20 = v3;
    id v7 = (void *)objc_opt_new();
    if (Superclass)
    {
      while (1)
      {
        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 3221225472LL;
        uint64_t v22 = sub_188BD6EA0;
        uint64_t v23 = &unk_18A2EE320;
        id v24 = v7;
        id v9 = v21;
        unsigned int outCount = 0;
        uint64_t v10 = class_copyProtocolList(Superclass, &outCount);
        if (outCount) {
          break;
        }
LABEL_13:
        if (v10) {
          free(v10);
        }

        Superclass = class_getSuperclass(Superclass);
        if (!Superclass) {
          goto LABEL_16;
        }
      }

      uint64_t v11 = 0LL;
      while (1)
      {
        uint64_t v12 = v10[v11];
        if (protocol_conformsToProtocol(v12, (Protocol *)&unk_18C741C50))
        {
          unsigned int v25 = 0;
          uint64_t v13 = protocol_copyMethodDescriptionList(v12, 1, 1, &v25);
          uint64_t v14 = v13;
          if (v25)
          {
            unint64_t v15 = 0LL;
            uint64_t v16 = v13;
            do
            {
              name = v16->name;
              ++v16;
              v22((uint64_t)v9, name);
              ++v15;
            }

            while (v15 < v25);
LABEL_11:
            free(v14);
            goto LABEL_12;
          }

          if (v13) {
            goto LABEL_11;
          }
        }

LABEL_16:
    id v4 = v18;
    objc_msgSend_setObject_forKey_((void *)qword_18C4FE818, v8, (uint64_t)v7, v18);
    a1 = v19;
    id v3 = v20;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = objc_msgSend_containsObject_(v7, v6, (uint64_t)v3);
}

    objc_msgSend_disconnect(v11, v12, v13);

    uint64_t v11 = 0LL;
  }

void sub_188BD6EA0(uint64_t a1, SEL aSelector)
{
  uint64_t v2 = *(void **)(a1 + 32);
  NSStringFromSelector(aSelector);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v2, v3, (uint64_t)v4);
}

void sub_188BD6EE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (!a2)
  {
    if (a3 == 2)
    {
      uint64_t v6 = a5;
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = sub_188BD6FA8;
      v8[3] = &unk_18A2EE370;
      id v7 = *(void **)(a1 + 32);
      id v9 = *(id *)(a1 + 40);
      int v10 = 2;
      sub_188BD6758(a4, v6, v7, v8);
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

void sub_188BD6FA8(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v8 = v5;
  if (v5 && objc_msgSend_code(v5, v6, v7) == 4865)
  {

    id v8 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t DTXSpawnSubtask(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v107 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v15 = a5;
  if (v9 && objc_msgSend_length(v9, v13, v14))
  {
    uint64_t v97 = 0LL;
    v98 = (const posix_spawnattr_t *)&v97;
    uint64_t v99 = 0x2020000000LL;
    uint64_t v94 = 0LL;
    v95 = (posix_spawn_file_actions_t *)&v94;
    uint64_t v96 = 0x2020000000LL;
    uint64_t v90 = 0LL;
    v91 = &v90;
    uint64_t v92 = 0x2020000000LL;
    int v93 = posix_spawnattr_init(&v100);
    if (*((_DWORD *)v91 + 6))
    {
      uint64_t v16 = 0xFFFFFFFFLL;
LABEL_28:
      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(&v97, 8);
      goto LABEL_29;
    }

    __int16 v89 = 0;
    int v17 = posix_spawnattr_getflags(v98 + 3, &v89);
    *((_DWORD *)v91 + 6) |= v17;
    int v18 = posix_spawnattr_setpgroup((posix_spawnattr_t *)v98 + 3, 0);
    *((_DWORD *)v91 + 6) |= v18;
    v89 |= 0x4002u;
    objc_msgSend_objectForKeyedSubscript_(v12, v19, (uint64_t)@"__DTX_SpawnSuspended");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = objc_msgSend_BOOLValue(v20, v21, v22);

    __int16 v24 = v89;
    if (v23)
    {
      __int16 v24 = v89 | 0x80;
      v89 |= 0x80u;
    }

    int v25 = posix_spawnattr_setflags((posix_spawnattr_t *)v98 + 3, v24);
    *((_DWORD *)v91 + 6) |= v25;
    objc_msgSend_objectForKeyedSubscript_(v12, v26, (uint64_t)@"cpu_type");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = v27;
    if (v27 && objc_msgSend_intValue(v27, v28, v29) != -1)
    {
      *(_DWORD *)buf = objc_msgSend_intValue(v30, v31, v32);
      int v33 = posix_spawnattr_setbinpref_np((posix_spawnattr_t *)v98 + 3, 1uLL, (cpu_type_t *)buf, 0LL);
      *((_DWORD *)v91 + 6) |= v33;
    }

    int v34 = posix_spawn_file_actions_init(v95 + 3);
    int v36 = *((_DWORD *)v91 + 6) | v34;
    *((_DWORD *)v91 + 6) = v36;
    v72 = v30;
    if (v36)
    {
      posix_spawnattr_destroy((posix_spawnattr_t *)v98 + 3);
    }

    else
    {
      id v37 = objc_msgSend_objectForKeyedSubscript_(v12, v35, (uint64_t)@"stdin_path");
      uint64_t v39 = objc_msgSend_cStringUsingEncoding_(v37, v38, 4);
      if (v39) {
        uint64_t v40 = (const char *)v39;
      }
      else {
        uint64_t v40 = "/dev/null";
      }

      id v42 = objc_msgSend_objectForKeyedSubscript_(v12, v41, (uint64_t)@"stdout_path");
      uint64_t v44 = objc_msgSend_cStringUsingEncoding_(v42, v43, 4);
      if (v44) {
        uint64_t v45 = (const char *)v44;
      }
      else {
        uint64_t v45 = "/dev/null";
      }

      id v47 = objc_msgSend_objectForKeyedSubscript_(v12, v46, (uint64_t)@"stderr_path");
      uint64_t v49 = objc_msgSend_cStringUsingEncoding_(v47, v48, 4);
      if (v49) {
        size_t v50 = (const char *)v49;
      }
      else {
        size_t v50 = "/dev/null";
      }

      int v51 = posix_spawn_file_actions_addopen(v95 + 3, 0, v40, 0, 0);
      *((_DWORD *)v91 + 6) |= v51;
      int v52 = posix_spawn_file_actions_addopen(v95 + 3, 1, v45, 2, 0);
      *((_DWORD *)v91 + 6) |= v52;
      int v53 = posix_spawn_file_actions_addopen(v95 + 3, 2, v50, 2, 0);
      int v54 = *((_DWORD *)v91 + 6) | v53;
      *((_DWORD *)v91 + 6) = v54;
      if (!v54)
      {
        uint64_t v85 = 0LL;
        v86 = &v85;
        uint64_t v87 = 0x2020000000LL;
        int v88 = -1;
        v73[0] = MEMORY[0x1895F87A8];
        v73[1] = 3221225472LL;
        v74 = sub_188BD7774;
        v75 = &unk_18A2EE4C0;
        id v76 = v10;
        id v77 = v9;
        id v78 = v11;
        id v79 = v12;
        v81 = &v90;
        v82 = &v85;
        v83 = &v94;
        v84 = &v97;
        id v80 = v15;
        id v56 = v73;
        name[0] = 0;
        unsigned __int8 v57 = (ipc_space_t *)MEMORY[0x1895FBBE0];
        mach_error_t v58 = mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, name);
        if (v58)
        {
          unint64_t v59 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v60 = MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            int v61 = getprogname();
            pid_t v62 = getpid();
            v63 = mach_error_string(v58);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v61;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v62;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v63;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v58;
            _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n",  buf,  0x22u);
          }
        }

        mach_error_t inserted = mach_port_insert_right(*v57, name[0], name[0], 0x14u);
        if (inserted)
        {
          v65 = (os_log_s *)MEMORY[0x1895F8DA0];
          id v66 = MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v67 = getprogname();
            pid_t v68 = getpid();
            v69 = mach_error_string(inserted);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v68;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v69;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = inserted;
            _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n",  buf,  0x22u);
          }
        }

        uint64_t v70 = name[0];
        *(void *)name = 0LL;
        v102 = name;
        uint64_t v103 = 0x2020000000LL;
        char v104 = 0;
        *(void *)buf = MEMORY[0x1895F87A8];
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_188BD8ECC;
        *(void *)&buf[24] = &unk_18A2ED688;
        *(void *)&buf[32] = name;
        int v106 = v70;
        v71 = (void (**)(void))MEMORY[0x1895D398C](buf);
        v74((uint64_t)v56, v70, v71);
        v71[2](v71);

        _Block_object_dispose(name, 8);
        uint64_t v16 = *((unsigned int *)v86 + 6);

        _Block_object_dispose(&v85, 8);
        goto LABEL_27;
      }

      posix_spawn_file_actions_destroy(v95 + 3);
      posix_spawnattr_destroy((posix_spawnattr_t *)v98 + 3);
    }

    uint64_t v16 = 0xFFFFFFFFLL;
LABEL_27:

    goto LABEL_28;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188BBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "empty executable path specified", buf, 2u);
  }

  uint64_t v16 = 0xFFFFFFFFLL;
LABEL_29:

  return v16;
}

void sub_188BD76F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_188BD7774(uint64_t a1, mach_port_t a2, void *a3)
{
  mach_port_t v109 = a2;
  uint64_t v157 = *MEMORY[0x1895F89C0];
  id v110 = a3;
  uint64_t v6 = objc_msgSend_count(*(void **)(a1 + 32), v4, v5);
  uint64_t v108 = (uint64_t)&v108;
  MEMORY[0x1895F8858](v6);
  id v8 = (char **)((char *)&v108 - v7);
  id v9 = *(id *)(a1 + 40);
  uint64_t v12 = objc_msgSend_UTF8String(v9, v10, v11);
  v115 = v8;
  *id v8 = (char *)v12;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  uint64_t v112 = a1;
  id v13 = *(id *)(a1 + 32);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v147, v156, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v148;
    int v19 = 1;
    do
    {
      uint64_t v20 = 0LL;
      int v21 = v19;
      int v22 = v19;
      int v23 = &v115[v19];
      do
      {
        if (*(void *)v148 != v18) {
          objc_enumerationMutation(v13);
        }
        id v24 = objc_msgSend_description(*(void **)(*((void *)&v147 + 1) + 8 * v20), v15, v16);
        v23[v20] = (char *const)objc_msgSend_UTF8String(v24, v25, v26);

        ++v20;
      }

      while (v17 != v20);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v147, v156, 16);
      int v19 = v22 + v20;
    }

    while (v17);
    int v27 = v20 + v21;
  }

  else
  {
    int v27 = 1;
  }

  v115[v27] = 0LL;
  uint64_t v30 = *(void **)(v112 + 48);
  if (v30)
  {
    v118 = (void *)objc_msgSend_mutableCopy(v30, v28, v29);
  }

  else
  {
    objc_msgSend_processInfo(MEMORY[0x1896079D8], v28, v29);
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_environment(v31, v32, v33);
    int v34 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (void *)objc_msgSend_mutableCopy(v34, v35, v36);
  }

  uint64_t v37 = getpid();
  objc_msgSend_numberWithInt_(MEMORY[0x189607968], v38, v37);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v118, v40, (uint64_t)v39, @"__DTX_SpawnParentPidKey");

  objc_msgSend_objectForKeyedSubscript_(*(void **)(v112 + 56), v41, (uint64_t)@"__DTX_SpawnDYLDForcePlatformKey");
  id v111 = (id)objc_claimAutoreleasedReturnValue();
  if (v111) {
    objc_msgSend_setObject_forKeyedSubscript_(v118, v42, (uint64_t)v111, @"DYLD_FORCE_PLATFORM");
  }
  uint64_t v44 = objc_msgSend_count(v118, v42, v43);
  MEMORY[0x1895F8858](v44);
  char *const *__attribute__((__org_arrdim(0,0))) v114 = (char *const *)((char *)&v108 - v45);
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  objc_msgSend_allKeys(v118, v46, v47);
  v117 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v48, (uint64_t)&v143, v155, 16);
  if (v50)
  {
    int v51 = 0LL;
    uint64_t v52 = *(void *)v144;
    do
    {
      uint64_t v53 = 0LL;
      dispatch_semaphore_t v116 = (dispatch_semaphore_t)(int)v51;
      v113 = v51;
      int v54 = &v114[(int)v51];
      do
      {
        if (*(void *)v144 != v52) {
          objc_enumerationMutation(v117);
        }
        uint64_t v55 = *(void *)(*((void *)&v143 + 1) + 8 * v53);
        id v56 = (void *)NSString;
        objc_msgSend_objectForKey_(v118, v49, v55);
        unsigned __int8 v57 = (void *)objc_claimAutoreleasedReturnValue();
        id v59 = objc_msgSend_stringWithFormat_(v56, v58, (uint64_t)@"%@=%@", v55, v57);
        v54[v53] = (char *const)objc_msgSend_UTF8String(v59, v60, v61);

        ++v53;
      }

      while (v50 != v53);
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v49, (uint64_t)&v143, v155, 16);
      int v51 = (char *)v116 + v53;
    }

    while (v50);
    int v62 = v53 + (_DWORD)v113;
  }

  else
  {
    int v62 = 0;
  }

  v114[v62] = 0LL;
  os_unfair_lock_lock(&stru_18C740408);
  v63 = (task_t *)MEMORY[0x1895FBBE0];
  task_t v64 = *MEMORY[0x1895FBBE0];
  mach_port_t v142 = v109;
  mach_error_t v65 = mach_ports_register(v64, &v142, 1u);
  if (v65 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v66 = getprogname();
    pid_t v67 = getpid();
    pid_t v68 = mach_error_string(v65);
    LODWORD(v153[0]) = 136315906;
    *(void *)((char *)v153 + 4) = v66;
    WORD2(v153[1]) = 1024;
    *(_DWORD *)((char *)&v153[1] + 6) = v67;
    WORD1(v153[2]) = 2080;
    *(void *)((char *)&v153[2] + 4) = v68;
    WORD2(v153[3]) = 1024;
    *(_DWORD *)((char *)&v153[3] + 6) = v65;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n",  (uint8_t *)v153,  0x22u);
  }

  uint64_t v69 = *(void *)(*(void *)(v112 + 80) + 8LL);
  id v70 = *(id *)(v112 + 40);
  v73 = (const char *)objc_msgSend_UTF8String(v70, v71, v72);
  int v74 = posix_spawn( (pid_t *)(v69 + 24),  v73,  (const posix_spawn_file_actions_t *)(*(void *)(*(void *)(v112 + 88) + 8LL) + 24LL),  (const posix_spawnattr_t *)(*(void *)(*(void *)(v112 + 96) + 8LL) + 24LL),  v115,  v114);
  *(_DWORD *)(*(void *)(*(void *)(v112 + 72) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v74;
  mach_error_t v75 = mach_ports_register(*v63, &v151, 0);
  if (v75 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v76 = getprogname();
    pid_t v77 = getpid();
    id v78 = mach_error_string(v75);
    LODWORD(v153[0]) = 136315906;
    *(void *)((char *)v153 + 4) = v76;
    WORD2(v153[1]) = 1024;
    *(_DWORD *)((char *)&v153[1] + 6) = v77;
    WORD1(v153[2]) = 2080;
    *(void *)((char *)&v153[2] + 4) = v78;
    WORD2(v153[3]) = 1024;
    *(_DWORD *)((char *)&v153[3] + 6) = v75;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n",  (uint8_t *)v153,  0x22u);
  }

  os_unfair_lock_unlock(&stru_18C740408);
  posix_spawn_file_actions_destroy((posix_spawn_file_actions_t *)(*(void *)(*(void *)(v112 + 88) + 8LL) + 24LL));
  posix_spawnattr_destroy((posix_spawnattr_t *)(*(void *)(*(void *)(v112 + 96) + 8LL) + 24LL));
  uint64_t v79 = v112;
  if (*(_DWORD *)(*(void *)(*(void *)(v112 + 72) + 8LL) + 24LL))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v80 = *(id *)(v79 + 40);
      uint64_t v83 = objc_msgSend_UTF8String(v80, v81, v82);
      v84 = strerror(*(_DWORD *)(*(void *)(*(void *)(v112 + 72) + 8LL) + 24LL));
      LODWORD(v153[0]) = 136315394;
      *(void *)((char *)v153 + 4) = v83;
      WORD2(v153[1]) = 2080;
      *(void *)((char *)&v153[1] + 6) = v84;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failed to posix spawn %s: %s",  (uint8_t *)v153,  0x16u);
      uint64_t v79 = v112;
    }

    *(_DWORD *)(*(void *)(*(void *)(v79 + 80) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = -1;
  }

  else
  {
    dispatch_get_global_queue(0LL, 0LL);
    v117 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_t v85 = dispatch_semaphore_create(0LL);
    dispatch_queue_t v86 = dispatch_queue_create("helper process handshake queue", 0LL);
    v153[0] = 0LL;
    v153[1] = v153;
    v153[2] = 0x3032000000LL;
    v153[3] = sub_188BD81F4;
    v153[4] = sub_188BD8204;
    id v154 = 0LL;
    v140[0] = 0LL;
    v140[1] = v140;
    v140[2] = 0x2020000000LL;
    char v141 = 0;
    uint64_t v87 = MEMORY[0x1895F87A8];
    v133[0] = MEMORY[0x1895F87A8];
    v133[1] = 3221225472LL;
    v133[2] = sub_188BD820C;
    v133[3] = &unk_18A2EE3F8;
    v138 = v140;
    id v137 = *(id *)(v79 + 64);
    id v134 = *(id *)(v79 + 40);
    dispatch_semaphore_t v116 = v85;
    id v135 = v116;
    v139 = v153;
    int v88 = v86;
    v136 = v88;
    __int16 v89 = (void *)MEMORY[0x1895D398C](v133);
    uint64_t v90 = v112;
    dispatch_source_t v91 = dispatch_source_create( MEMORY[0x1895F8B58],  *(int *)(*(void *)(*(void *)(v112 + 80) + 8LL) + 24LL),  0x80000000uLL,  v117);
    if (v91)
    {
      v125[0] = v87;
      v125[1] = 3221225472LL;
      v125[2] = sub_188BD8598;
      v125[3] = &unk_18A2EE420;
      uint64_t v130 = *(void *)(v90 + 80);
      uint64_t v92 = v88;
      v126 = v92;
      id v93 = v89;
      id v128 = v93;
      id v129 = v110;
      uint64_t v94 = v91;
      v127 = v94;
      dispatch_source_set_event_handler(v94, v125);
      dispatch_resume(v94);
      if (*(void *)(v90 + 64))
      {
        objc_msgSend_objectForKeyedSubscript_(*(void **)(v90 + 56), v95, (uint64_t)@"SpawnTimeout");
        uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v99 = objc_msgSend_unsignedLongLongValue(v96, v97, v98);

        v121[0] = v87;
        v121[1] = 3221225472LL;
        v121[2] = sub_188BD8650;
        v121[3] = &unk_18A2EE498;
        mach_port_t v124 = v109;
        posix_spawnattr_t v100 = v92;
        v122 = v100;
        id v101 = v93;
        id v123 = v101;
        dispatch_async(v117, v121);
        if (v99) {
          dispatch_time_t v102 = dispatch_time(0LL, 1000000 * v99);
        }
        else {
          dispatch_time_t v102 = -1LL;
        }
        uint64_t v106 = v112;
        if (dispatch_semaphore_wait(v116, v102))
        {
          v119[0] = v87;
          v119[1] = 3221225472LL;
          v119[2] = sub_188BD886C;
          v119[3] = &unk_18A2EDA98;
          id v120 = v101;
          dispatch_sync(v100, v119);
          pid_t v107 = *(_DWORD *)(*(void *)(*(void *)(v106 + 80) + 8LL) + 24LL);
          if (v107 >= 1) {
            kill(v107, 9);
          }
        }
      }

      v105 = (id *)&v126;
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        int v103 = *(_DWORD *)(*(void *)(*(void *)(v90 + 80) + 8LL) + 24LL);
        v152[0] = 67109120;
        v152[1] = v103;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Failed to start observing process with pid %i",  (uint8_t *)v152,  8u);
      }

      pid_t v104 = *(_DWORD *)(*(void *)(*(void *)(v90 + 80) + 8LL) + 24LL);
      v152[0] = 0;
      waitpid(v104, v152, 1);
      v131[0] = v87;
      v131[1] = 3221225472LL;
      v131[2] = sub_188BD8584;
      v131[3] = &unk_18A2EDA98;
      id v132 = v89;
      dispatch_async(v88, v131);
      (*((void (**)(void))v110 + 2))();
      v105 = &v132;
      *(_DWORD *)(*(void *)(*(void *)(v90 + 80) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = -1;
    }

    _Block_object_dispose(v140, 8);
    _Block_object_dispose(v153, 8);
  }
}

void sub_188BD81C0(_Unwind_Exception *a1)
{
}

uint64_t sub_188BD81F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_188BD8204(uint64_t a1)
{
}

void sub_188BD820C(uint64_t a1, mach_port_t a2, int a3)
{
  mach_msg_return_t v13;
  const char *v14;
  pid_t v15;
  char *v16;
  void v17[4];
  id v18;
  mach_port_t v19;
  mach_msg_header_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  pid_t v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  mach_msg_return_t v29;
  uint64_t v30;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  if (!*(_BYTE *)(v3 + 24))
  {
    *(_BYTE *)(v3 + 24) = 1;
    if (*(void *)(a1 + 56))
    {
      uint64_t v7 = (void *)MEMORY[0x1895D37B8]();
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
      if (a2 - 1 > 0xFFFFFFFD
        || (a3 - 1) >= 0xFFFFFFFE
        || mach_port_mod_refs(*MEMORY[0x1895FBBE0], a2, 0, 1))
      {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }

      else
      {
        dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1895F8B48], a2, 1uLL, *(dispatch_queue_t *)(a1 + 48));
        uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8LL);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        uint64_t v11 = *(dispatch_source_s **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
        v17[0] = MEMORY[0x1895F87A8];
        v17[1] = 3221225472LL;
        v17[2] = sub_188BD8550;
        v17[3] = &unk_18A2EDEA0;
        uint64_t v18 = *(id *)(a1 + 40);
        int v19 = a2;
        dispatch_source_set_event_handler(v11, v17);
        dispatch_activate(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
        pid_t v12 = getpid();
        v20.msgh_remote_port = a2;
        v20.msgh_local_port = 0;
        *(void *)&v20.msgh_bits = 0x2000000013LL;
        *(void *)&v20.msgh_voucher_port = 0LL;
        int v21 = v12;
        id v13 = mach_msg_send(&v20);
        if (v13)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = getprogname();
            id v15 = getpid();
            uint64_t v16 = mach_error_string(v13);
            *(_DWORD *)buf = 136315906;
            int v23 = v14;
            id v24 = 1024;
            int v25 = v15;
            uint64_t v26 = 2080;
            int v27 = v16;
            uint64_t v28 = 1024;
            uint64_t v29 = v13;
            _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n",  buf,  0x22u);
          }
        }
      }

      objc_autoreleasePoolPop(v7);
    }
  }

void sub_188BD8444( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v20 = objc_begin_catch(a1);
      int v21 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v22 = MEMORY[0x1895F8DA0];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v23 = *(id *)(v19 + 32);
        uint64_t v26 = objc_msgSend_UTF8String(v23, v24, v25);
        id v29 = objc_msgSend_description(v20, v27, v28);
        uint64_t v32 = objc_msgSend_UTF8String(v29, v30, v31);
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = v26;
        WORD6(buf) = 2080;
        *(void *)((char *)&buf + 14) = v32;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "DTXSpawnSubtask handshake block failed for %s: %s",  (uint8_t *)&buf,  0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x188BD82B4LL);
    }

    objc_begin_catch(a1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v19 + 40));
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x188BD8530LL);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_188BD8550(uint64_t a1)
{
  return mach_port_deallocate(*MEMORY[0x1895FBBE0], *(_DWORD *)(a1 + 40));
}

uint64_t sub_188BD8584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_188BD8598(uint64_t a1)
{
  pid_t v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  int v9 = 0;
  waitpid(v2, &v9, 1);
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_188BD863C;
  v7[3] = &unk_18A2EDA98;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v3, v7);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  v4,  v5,  v6);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

uint64_t sub_188BD863C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_188BD8650(uint64_t a1)
{
  mach_port_name_t v2 = *(_DWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  id v8 = sub_188BD87D8;
  int v9 = &unk_18A2EE470;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  int v12 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = v7;
  __int128 v14 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, v2, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    v8((uint64_t)v3, 0LL, 4LL, 0);
  }

  else
  {
    if (HIDWORD(v14) + *(_DWORD *)&msg[4] == 48
      && *(_DWORD *)&msg[24] == 1
      && !HIBYTE(DWORD1(v14))
      && ((int v4 = HIWORD(DWORD1(v14)), (HIWORD(DWORD1(v14)) - 22) < 0xFFFFFFFA)
       || (*(_DWORD *)msg & 0x80000000) != 0))
    {
      if (v4 == 16) {
        unsigned int v5 = 1;
      }
      else {
        unsigned int v5 = 4 * ((v4 - 17) > 4);
      }
      else {
        uint64_t v6 = v5;
      }
      v8((uint64_t)v3, *(unsigned int *)&msg[28], v6, *(unsigned int *)&msg[8]);
    }

    else
    {
      v8((uint64_t)v3, 0LL, 4LL, 0);
    }

    mach_msg_destroy((mach_msg_header_t *)msg);
  }
}

void sub_188BD87D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = sub_188BD8858;
  v8[3] = &unk_18A2EE448;
  uint64_t v6 = *(dispatch_queue_s **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  int v7 = *(_DWORD *)(a1 + 48);
  int v10 = a4;
  int v11 = v7;
  dispatch_sync(v6, v8);
}

uint64_t sub_188BD8858(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(a1 + 40),  *(unsigned int *)(a1 + 44));
}

uint64_t sub_188BD886C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void DTXSubtaskCheckin(void *a1)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  mach_port_name_t v2 = (void *)MEMORY[0x1895D37B8]();
  unsigned int v5 = (const char *)objc_msgSend_UTF8String(@"__DTX_SpawnParentPidKey", v3, v4);
  uint64_t v6 = getenv(v5);
  if (v6)
  {
    int v7 = atoi(v6);
    if (v7 != getppid())
    {
      v40[0] = 648LL;
      *(void *)uint64_t v43 = 0xE00000001LL;
      LODWORD(v44) = 1;
      HIDWORD(v44) = getpid();
      if (sysctl(v43, 4u, buf, v40, 0LL, 0LL) || !v40[0] || (*(_WORD *)&buf[32] & 0x800) == 0) {
        goto LABEL_21;
      }
    }
  }

  else if (getppid())
  {
    goto LABEL_21;
  }

  mach_port_array_t init_port_set = 0LL;
  mach_msg_type_number_t init_port_setCnt = 0;
  int v10 = (task_t *)MEMORY[0x1895FBBE0];
  if (mach_ports_lookup(*MEMORY[0x1895FBBE0], &init_port_set, &init_port_setCnt)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = init_port_setCnt == 0;
  }
  if (v11 || (mach_port_t v12 = *init_port_set, *init_port_set + 1 < 2))
  {
    mach_port_t v12 = 0;
  }

  else
  {
    mig_deallocate((vm_address_t)init_port_set, 4LL * init_port_setCnt);
    mach_error_t v28 = mach_ports_register(*v10, &v42, 0);
    if (v28 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v29 = getprogname();
      pid_t v30 = getpid();
      uint64_t v31 = mach_error_string(v28);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v30;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v31;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v28;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n",  buf,  0x22u);
    }
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v32 = MEMORY[0x1895F87A8];
  uint64_t v33 = 3221225472LL;
  int v34 = sub_188BD8D1C;
  uint64_t v35 = &unk_18A2EE4E8;
  mach_port_t v37 = v12;
  id v36 = v1;
  __int128 v14 = &v32;
  *(void *)uint64_t v43 = v13;
  uint64_t v44 = 3221225472LL;
  uint64_t v45 = sub_188BD90A0;
  uint64_t v46 = &unk_18A2ED728;
  mach_port_t v48 = v12;
  id v15 = v14;
  uint64_t v47 = v15;
  uint64_t v16 = v43;
  LODWORD(v40[0]) = 0;
  mach_error_t v17 = mach_port_allocate(*v10, 1u, (mach_port_name_t *)v40);
  if (v17 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = getprogname();
    pid_t v19 = getpid();
    id v20 = mach_error_string(v17);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v19;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v20;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v17;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n",  buf,  0x22u);
  }

  mach_error_t inserted = mach_port_insert_right(*v10, v40[0], v40[0], 0x14u);
  if (inserted && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v22 = getprogname();
    pid_t v23 = getpid();
    id v24 = mach_error_string(inserted);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v23;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v24;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = inserted;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n",  buf,  0x22u);
  }

  uint64_t v25 = LODWORD(v40[0]);
  v40[0] = 0LL;
  v40[1] = (size_t)v40;
  v40[2] = 0x2020000000LL;
  char v41 = 0;
  *(void *)buf = v13;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_188BD8ECC;
  *(void *)&buf[24] = &unk_18A2ED688;
  *(void *)&buf[32] = v40;
  int v50 = v25;
  uint64_t v26 = (void (**)(void))MEMORY[0x1895D398C](buf);
  v45((uint64_t)v16, v25, v26);
  v26[2](v26);

  _Block_object_dispose(v40, 8);
  mach_port_deallocate(*v10, v12);

LABEL_21:
  int v27 = (const char *)objc_msgSend_UTF8String(@"__DTX_SpawnParentPidKey", v8, v9, v32, v33, v34, v35);
  unsetenv(v27);
  objc_autoreleasePoolPop(v2);
}

void sub_188BD8CFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_188BD8D1C(uint64_t a1, uint64_t a2)
{
  mach_msg_return_t v5;
  mach_error_t v6;
  const char *v7;
  pid_t v8;
  char *v9;
  uint64_t v10;
  mach_port_name_t name[4];
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  pid_t v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  mach_error_t v21;
  uint64_t v22;
  id v22 = *MEMORY[0x1895F89C0];
  mach_port_name_t v4 = *(_DWORD *)(a1 + 40);
  *(void *)&mach_port_t v12 = 0LL;
  *((void *)&v12 + 1) = 1LL;
  uint64_t v13 = 0x13000000000000LL;
  mach_port_name_t name[2] = v4;
  name[3] = a2;
  *(void *)name = 0x2880001413LL;
  unsigned int v5 = mach_msg_send((mach_msg_header_t *)name);
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      int v7 = getprogname();
      id v8 = getpid();
      uint64_t v9 = mach_error_string(v6);
      *(_DWORD *)buf = 136315906;
      id v15 = v7;
      uint64_t v16 = 1024;
      mach_error_t v17 = v8;
      uint64_t v18 = 2080;
      pid_t v19 = v9;
      id v20 = 1024;
      int v21 = v6;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n",  buf,  0x22u);
    }
  }

  int v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, *(unsigned int *)(a1 + 40), a2);
  }
  uint64_t v13 = 0LL;
  *(_OWORD *)name = 0u;
  mach_port_t v12 = 0u;
  if (!mach_msg((mach_msg_header_t *)name, 2, 0, 0x28u, a2, 0, 0) && DWORD1(v12) != 70)
  {
    if ((name[0] & 0x80000000) != 0)
    {
      mach_msg_destroy((mach_msg_header_t *)name);
    }

    else if (HIDWORD(v13) + name[1] == 40)
    {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], name[2]);
    }
  }

void sub_188BD8ECC(uint64_t a1)
{
  kern_return_t v6;
  mach_error_t v7;
  kern_return_t v8;
  mach_error_t v9;
  const char *v10;
  pid_t v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  mach_error_t v20;
  uint64_t v21;
  int v21 = *MEMORY[0x1895F89C0];
  mach_port_name_t v2 = (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  do
  {
    if (__ldaxr(v2))
    {
      __clrex();
      return;
    }
  }

  while (__stlxr(1u, v2));
  mach_port_name_t v4 = *(_DWORD *)(a1 + 40);
  if (v4 + 1 >= 2)
  {
    unsigned int v5 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    uint64_t v6 = mach_port_mod_refs(*MEMORY[0x1895FBBE0], v4, 1u, -1);
    if (v6)
    {
      int v7 = v6;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = 136315906;
        __int128 v14 = getprogname();
        id v15 = 1024;
        uint64_t v16 = getpid();
        mach_error_t v17 = 2080;
        uint64_t v18 = mach_error_string(v7);
        pid_t v19 = 1024;
        id v20 = v7;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_mod_refs' failed: %s (%d)\n",  (uint8_t *)&v13,  0x22u);
      }
    }

    id v8 = mach_port_deallocate(*v5, *(_DWORD *)(a1 + 40));
    if (v8)
    {
      uint64_t v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        int v10 = getprogname();
        BOOL v11 = getpid();
        mach_port_t v12 = mach_error_string(v9);
        uint64_t v13 = 136315906;
        __int128 v14 = v10;
        id v15 = 1024;
        uint64_t v16 = v11;
        mach_error_t v17 = 2080;
        uint64_t v18 = v12;
        pid_t v19 = 1024;
        id v20 = v9;
        _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s[%d]: [error] 'mach_port_deallocate' failed: %s (%d)\n",  (uint8_t *)&v13,  0x22u);
      }
    }
  }

void sub_188BD90A0(uint64_t a1, uint64_t a2, void *a3)
{
  uintptr_t v5 = *(unsigned int *)(a1 + 40);
  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  id v7 = a3;
  source = dispatch_source_create(MEMORY[0x1895F8B48], v5, 1uLL, v6);

  dispatch_source_set_event_handler(source, v7);
  dispatch_activate(source);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  dispatch_source_cancel(source);
}

void sub_188BD91A0(_DWORD *a1)
{
  a1[12] = -1;
  a1[13] = -1;
  uintptr_t v5 = a1;
  dispatch_queue_t v1 = dispatch_queue_create("transport input queue", 0LL);
  mach_port_name_t v2 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v1;

  dispatch_queue_t v3 = dispatch_queue_create("transport output queue", 0LL);
  mach_port_name_t v4 = (void *)*((void *)v5 + 8);
  *((void *)v5 + _Block_object_dispose(va, 8) = v3;

  v5[18] = -1;
}

LABEL_17:
  return v11;
}

uint64_t sub_188BD939C(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
  uint64_t v9 = 420LL;
  if ((a2 & 0x200) == 0) {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = open(v8, a2, v9);
  if ((v10 & 0x80000000) != 0)
  {
    if (a3)
    {
      __error();
      _NSErrorWithFilePathErrnoAndVariant();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v11 = __error();
      NSLog(@"Error opening path: %@ (%d)", v5, *v11);
    }
  }

  return v10;
}

void sub_188BD9450(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0 && close(v2))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 32);
    mach_port_name_t v4 = __error();
    id v5 = strerror(*v4);
    NSLog(@"Error closing input file descriptor %d while disconnecting: %s", v3, v5);
  }

  int v6 = *(_DWORD *)(a1 + 36);
  if ((v6 & 0x80000000) == 0 && v6 != *(_DWORD *)(a1 + 32))
  {
    if (close(v6))
    {
      uint64_t v7 = *(unsigned int *)(a1 + 36);
      id v8 = __error();
      uint64_t v9 = strerror(*v8);
      NSLog(@"Error closing output file descriptor %d while disconnecting: %s", v7, v9);
    }
  }

void sub_188BD9684(uint64_t a1)
{
  int v2 = malloc(0x4000uLL);
  uint64_t v3 = MEMORY[0x1895F87A8];
  do
  {
    while (1)
    {
      ssize_t v4 = read(*(_DWORD *)(a1 + 40), v2, 0x4000uLL);
      if (v4 < 0) {
        break;
      }
      ssize_t v6 = v4;
      if (!v4) {
        goto LABEL_9;
      }
      uint64_t v7 = *(void **)(a1 + 32);
      v11[0] = v3;
      v11[1] = 3221225472LL;
      v11[2] = sub_188BD97A8;
      v11[3] = &unk_18A2ED638;
      v11[4] = v2;
      objc_msgSend_received_ofLength_destructor_(v7, v5, (uint64_t)v2, v6, v11);
      int v2 = malloc(0x4000uLL);
    }
  }

  while (*__error() == 4);
  if (*__error() == 35)
  {
    free(v2);
    return;
  }

LABEL_9:
  free(v2);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(dispatch_queue_s **)(v8 + 64);
  v10[0] = v3;
  v10[1] = 3221225472LL;
  v10[2] = sub_188BD97B0;
  v10[3] = &unk_18A2ED618;
  v10[4] = v8;
  dispatch_async(v9, v10);
}

void sub_188BD97A8(uint64_t a1)
{
}

uint64_t sub_188BD97B0(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_disconnect(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_188BD9A50(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 36);
  if ((result & 0x80000000) == 0) {
    return close(result);
  }
  return result;
}

uint64_t sub_188BD9BA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_188BD9BB4(uint64_t a1)
{
}

void sub_188BD9BBC(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = sub_188BD9C20;
  void v3[3] = &unk_18A2ED578;
  __int128 v1 = *(_OWORD *)(a1 + 32);
  int v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 56LL);
  __int128 v4 = v1;
  dispatch_sync(v2, v3);
}

void sub_188BD9C20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(v1 + 48) & 0x80000000) == 0 && (*(_DWORD *)(v1 + 52) & 0x80000000) == 0)
  {
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    xpc_dictionary_set_fd( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  "_inFD",  *(_DWORD *)(*(void *)(a1 + 32) + 48LL));
    xpc_dictionary_set_fd( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  "_outFD",  *(_DWORD *)(*(void *)(a1 + 32) + 52LL));
  }

void sub_188BD9E18(_Unwind_Exception *a1)
{
}

uint64_t sub_188BD9E38(uint64_t a1)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(dispatch_queue_s **)(v1 + 64);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BD9EE8;
  block[3] = &unk_18A2EE510;
  void block[4] = v1;
  void block[5] = &v8;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

ssize_t sub_188BD9EE8(uint64_t a1)
{
  ssize_t result = *(unsigned int *)(*(void *)(a1 + 32) + 52LL);
  if ((result & 0x80000000) != 0) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3)
  {
    if (*(void *)(a1 + 64)) {
      abort();
    }
    ssize_t result = 0LL;
    goto LABEL_10;
  }

  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  ssize_t result = write(result, (const void *)(v3 + v4), *(void *)(a1 + 64) - v4);
  if (result != -1)
  {
LABEL_10:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += result;
    return result;
  }

  ssize_t result = (ssize_t)__error();
  if (*(_DWORD *)result != 4)
  {
    ssize_t result = (ssize_t)__error();
    if (*(_DWORD *)result != 35)
    {
      ssize_t result = objc_msgSend_disconnect(*(void **)(a1 + 32), v5, v6);
LABEL_7:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0;
    }
  }

  return result;
}

void sub_188BDA074(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 8_Block_object_dispose((const void *)(v1 - 80), 8) = 0LL;
  }

void sub_188BDA0C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 56);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BDA124;
  block[3] = &unk_18A2ED618;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_188BDA124(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = 0LL;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(_DWORD *)(v2 + 52) = -1;
  *(_DWORD *)(*(void *)(a1 + 32) + 48LL) = -1;
}

void sub_188BDA278()
{
}

void sub_188BDA2A0()
{
  __assert_rtn( "_returnScratchBufferForAlgorithm",  "DTXBlockCompressor.m",  183,  "false && unexpected: compression type with libcompression is not known");
}

void sub_188BDA2C8()
{
  __assert_rtn( "DTXTransportPreserveDataInSerializedTransport",  "DTXTransport_Internal.h",  22,  "xpc_get_type(serializedTransport) == XPC_TYPE_DICTIONARY");
}

void sub_188BDA2F0()
{
}

void sub_188BDA318()
{
  __assert_rtn( "-[DTXConnection _unregisterChannel:]_block_invoke",  "DTXConnection.m",  1404,  "channel == unconfiguredChannel");
}

void sub_188BDA340()
{
}

void sub_188BDA368()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 38, "ret == 0");
}

void sub_188BDA390()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 36, "ret == 0");
}

void sub_188BDA3B8()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 33, "ret == 0");
}

void sub_188BDA3E0()
{
  __assert_rtn( "-[DTXSocketTransport _setupChannelWithConnectedSocket:assumingOwnership:orDisconnectBlock:]",  "DTXSocketTransport.m",  91,  "self.status == DTXTransportStatus_Unavailable");
}

void sub_188BDA408()
{
}

void sub_188BDA430()
{
}

void sub_188BDA458(int *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    int v4 = *a1;
    v5[0] = 67109376;
    v5[1] = v4;
    __int16 v6 = 2048;
    uint64_t v7 = a2;
    _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "invalid compression type %d specified for compatibility version %ld",  (uint8_t *)v5,  0x12u);
  }

  __assert_rtn( "-[DTXMessage compressWithCompressor:usingType:forCompatibilityWithVersion:]",  "DTXMessage.m",  471,  "false && unexpected _compressionType, unsupported by compatibility version 1 --- logic error in compression selection");
}

void sub_188BDA4FC()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x189607708](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x189607720]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSErrorWithFilePathErrnoAndVariant()
{
  return MEMORY[0x189607B70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1895F8C08](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1895F8C58]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x189616450]();
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895F9320](*(void *)&a1, a2, a3);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895F9608](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x189616470](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x189616480](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x189616490](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1896164A0](cls, name);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x1896164A8](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1896164E0](cls);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1896149A8](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149B0](*(void *)&algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1896175A0](strm, *(void *)&level, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1895FAF98](*(void *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x1895FB2A8]();
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1895FB2B0]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
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

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x1895FB4D8](*(void *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1895FB4E0](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

pid_t getppid(void)
{
  return MEMORY[0x1895FB630]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB6D0](*(void *)&a1, a2, a3);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x189617620](strm, version, *(void *)&stream_size);
}

int kevent( int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1895FB8D8](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FB8E8](*(void *)&a1, *(void *)&a2);
}

int kqueue(void)
{
  return MEMORY[0x1895FB910]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x1895FB9F8](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
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

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return MEMORY[0x1895FBB00](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_extract_right( ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1895FBB40](*(void *)&task, *(void *)&name, *(void *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_ports_lookup( task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return MEMORY[0x1895FBBB8](*(void *)&target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_ports_register( task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return MEMORY[0x1895FBBC0](*(void *)&target_task, init_port_set, *(void *)&init_port_setCnt);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1895FBBD8](*(void *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

kern_return_t mach_vm_remap( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FBC50]( *(void *)&target_task,  target_address,  size,  mask,  *(void *)&flags,  *(void *)&src_task,  src_address,  *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1895FBF48](a1, *(void *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  return (const char **)MEMORY[0x189616610](image, outCount);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1896166D0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC7E0](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x1895FC800](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC808](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC810](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC818](a1);
}

int posix_spawnattr_getflags(const posix_spawnattr_t *a1, __int16 *a2)
{
  return MEMORY[0x1895FC820](a1, a2);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC828](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x1895FC838](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1895FC840](a1, a2);
}

int posix_spawnattr_setpgroup(posix_spawnattr_t *a1, pid_t a2)
{
  return MEMORY[0x1895FC850](a1, *(void *)&a2);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x189616A10](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList( Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x189616A18](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription( Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  int v4 = (const char *)MEMORY[0x189616A38](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x189616A40](p);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x189616A48](sel);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1895FCE90](a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FCEE8](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1895FCEF0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
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

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x1895FD308](*(void *)&target_tport, *(void *)&pid, t);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1895FD480](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1895FDB88]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBB8](xdict, key);
}

uint64_t xpc_dictionary_extract_mach_recv()
{
  return MEMORY[0x1895FDBC8]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

uint64_t xpc_dictionary_set_mach_recv()
{
  return MEMORY[0x1895FDCF0]();
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1895FDCF8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, a3);
}

uint64_t objc_msgSend__allowedClassesForArgumentsOfRemoteInterfaceSelector_methodSignature_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel__allowedClassesForArgumentsOfRemoteInterfaceSelector_methodSignature_, a3);
}

uint64_t objc_msgSend__handleProxyRequestForInterface_interfaceName_peerInterface_peerInterfaceName_handler_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718]( a1,  sel__handleProxyRequestForInterface_interfaceName_peerInterface_peerInterfaceName_handler_,  a3);
}

uint64_t objc_msgSend__initWithReferencedSerializedForm_compressor_payloadSet_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithReferencedSerializedForm_compressor_payloadSet_, a3);
}

uint64_t objc_msgSend__makeProxyChannelWithRemoteInterface_remoteInterfaceName_exportedInterface_exportedInterfaceName_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718]( a1,  sel__makeProxyChannelWithRemoteInterface_remoteInterfaceName_exportedInterface_exportedInterfaceName_,  a3);
}

uint64_t objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_, a3);
}

uint64_t objc_msgSend_compressBuffer_ofLength_toBuffer_ofLength_usingCompressionType_withFinalCompressionType_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718]( a1,  sel_compressBuffer_ofLength_toBuffer_ofLength_usingCompressionType_withFinalCompressionType_,  a3);
}

uint64_t objc_msgSend_compressWithCompressor_usingType_forCompatibilityWithVersion_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_compressWithCompressor_usingType_forCompatibilityWithVersion_, a3);
}

uint64_t objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, a3);
}

uint64_t objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_handleFailureInMethod_object_file_lineNumber_description_, a3);
}

uint64_t objc_msgSend_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithIncomingFileDescriptor_outgoingFileDescriptor_disconnectBlock_, a3);
}

uint64_t objc_msgSend_initWithPublishedProtocol_publishedProtocolName_peerProtocol_peerProtocolName_handlerBlock_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPublishedProtocol_publishedProtocolName_peerProtocol_peerProtocolName_handlerBlock_,  a3);
}

uint64_t objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_, a3);
}

uint64_t objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718](a1, sel_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_, a3);
}

uint64_t objc_msgSend_uncompressBuffer_ofLength_toBuffer_withKnownUncompressedLength_usingCompressionType_( void *a1, const char *a2, uint64_t a3, ...)
{
  return MEMORY[0x189616718]( a1,  sel_uncompressBuffer_ofLength_toBuffer_withKnownUncompressedLength_usingCompressionType_,  a3);
}