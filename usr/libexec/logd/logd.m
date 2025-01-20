uint64_t sub_100003590(uint64_t a1)
{
  vm_deallocate(mach_task_self_, *(void *)(a1 + 48), 0x40000uLL);
  *(void *)(a1 + 48) = 0LL;
  return (*((uint64_t (**)(void *, uint64_t, uint64_t, void, void))off_10002C2A0 + 2))( off_10002C2A0,  a1,  6LL,  0LL,  0LL);
}

uint64_t sub_1000035E4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (a2) {
    *a2 = *(_DWORD *)(a1 + 128);
  }
  if (!*(_DWORD *)(a1 + 128)) {
    return 0LL;
  }
  uint64_t v3 = *(void *)(v2 + 1536);
  if (v3) {
    return v3;
  }
  else {
    return -1LL;
  }
}

uint64_t sub_100003614(uint64_t a1)
{
  return *(unsigned int *)(a1 + 136);
}

uint64_t sub_10000361C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 132);
}

uint64_t sub_100003624(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  *a2 = 2048LL;
  return v2 + 2048;
}

uint64_t sub_100003638(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t sub_100003640(uint64_t result)
{
  *(_BYTE *)(result + 143) = 1;
  return result;
}

unint64_t sub_10000364C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (unint64_t *)(a1 + 88);
  do
    unint64_t result = __ldxr(v2);
  while (__stxr(a2, v2));
  return result;
}

uint64_t sub_100003660(uint64_t result)
{
  *(_BYTE *)(result + 147) = 1;
  return result;
}

void sub_10000366C(int a1, const void *a2)
{
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(v4);
  qword_10002C280 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.snapshot-gate", v4, 0LL);
  qword_10002C290 = (uint64_t)dispatch_workloop_create_inactive("com.apple.firehose.io-wl");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_10002C290);
  qword_10002C288 = (uint64_t)dispatch_queue_create_with_target_V2( "com.apple.firehose.drain-io",  v4,  (dispatch_queue_t)qword_10002C290);
  qword_10002C298 = (uint64_t)dispatch_queue_create_with_target_V2( "com.apple.firehose.drain-mem",  initially_inactive,  0LL);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_10002C298);
  uint64_t f = dispatch_mach_create_f("com.apple.firehose.listener", qword_10002C298, 0LL, sub_100003914);
  dword_10002C270[0] = a1;
  qword_10002C278 = f;
  off_10002C2A0 = _Block_copy(a2);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    int v8 = open_NOCANCEL("/dev/oslog", 2LL);
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    int v9 = **(_DWORD **)(StatusReg + 8);
    if (v9 != 4)
    {
      if (v9 != 2) {
        sub_100022D00(v9);
      }
      goto LABEL_12;
    }
  }

  int v10 = v8;
  unint64_t v11 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (ioctl(v10, 0x4010744FuLL, &v20) < 0)
  {
    int v12 = **(_DWORD **)(v11 + 8);
    if (v12 != 4) {
      sub_100022D28(v12);
    }
  }

  uint64_t v13 = v20;
  uint64_t v14 = _os_object_alloc_realized(&OBJC_CLASS___OS_firehose_client, 152LL);
  *(void *)(v14 + 48) = v13;
  *(void *)(v14 + 64) = *(void *)(v13 + 464);
  *(void *)(v14 + 56) = *(void *)(v14 + 64);
  *(void *)(v14 + 80) = *(void *)(v13 + 488);
  *(void *)(v14 + 72) = *(void *)(v14 + 80);
  dispatch_source_t v15 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v10,  0LL,  (dispatch_queue_t)qword_10002C298);
  dispatch_set_qos_class_floor(v15, QOS_CLASS_USER_INITIATED, 0);
  dispatch_set_context(v15, (void *)v14);
  dispatch_source_set_event_handler_f(v15, (dispatch_function_t)sub_100004C20);
  *(void *)(v14 + 96) = v15;
  *(_DWORD *)(v14 + 120) = -1;
  dword_10002C2B8 = v10;
  off_10002C2B0 = (_UNKNOWN *)v14;
LABEL_12:
  uint64_t v16 = 0LL;
  v17 = (char *)&unk_10002C2E8;
  do
  {
    v18 = &qword_10002C288;
    if ((v16 & 1) == 0) {
      v18 = &qword_10002C298;
    }
    dispatch_source_t v19 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  (dispatch_queue_t)*v18);
    dispatch_set_context(v19, v17);
    dispatch_source_set_event_handler_f(v19, (dispatch_function_t)sub_100003968);
    *(void *)&dword_10002C270[2 * v16++ + 46] = v19;
    v17 += 16;
  }

  while (v16 != 4);
}

void sub_100003914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2 && (dispatch_mach_mig_demux(a1, &off_100028C98, 1LL, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    mach_msg_destroy(msg);
  }
}

void sub_100003968(uint64_t a1)
{
  v18 = (unint64_t *)(a1 + 8);
  if (*(void *)(a1 + 8))
  {
    uint64_t v2 = 0LL;
    unint64_t v3 = a1 - (void)dword_10002C270 - 120;
    uint64_t v4 = (v3 >> 4) & 1;
    int v5 = 16 << ((v3 & 0x10) != 0);
    int v6 = 256 << ((v3 & 0x10) != 0);
    int v7 = ~(17 << ((v3 & 0x10) != 0));
    unint64_t v17 = v3;
    if ((v3 & 0x20) != 0) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = 4LL;
    }
    while (2)
    {
      int v9 = *(unsigned __int16 **)a1;
      if (!*(void *)a1) {
        int v9 = (unsigned __int16 *)_dispatch_wait_for_enqueuer(a1, v18);
      }
      do
      {
        int v10 = &v9[4 * v4];
        uint64_t v11 = *((void *)v10 + 4);
        *(void *)a1 = v11;
        if (!v11)
        {
          dispatch_source_t v15 = (uint64_t *)(v10 + 16);
          while (1)
          {
            unint64_t v16 = __ldxr(v18);
            if (!__stlxr(0LL, v18)) {
              goto LABEL_8;
            }
          }

          __clrex();
          uint64_t v11 = *v15;
          if (!*v15) {
            uint64_t v11 = _dispatch_wait_for_enqueuer(v15, v18);
          }
          *(void *)a1 = v11;
        }

LABEL_8:
        int v12 = v9 + 70;
        do
        {
          int v13 = __ldxr(v12);
          if ((v5 & v13) != 0) {
            int v14 = v13 & v7 | v6;
          }
          else {
            int v14 = v13 & v7;
          }
        }

        while (__stxr(v14, v12));
        if ((v6 & v14) == 0) {
          sub_1000045D4((unint64_t)v9, 0, v4);
        }
        if (++v2 == v8)
        {
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * ((v17 >> 4) & 3) + 46], 1uLL);
          return;
        }

        int v9 = (unsigned __int16 *)v11;
      }

      while (v11);
      if (*v18) {
        continue;
      }
      break;
    }
  }

    sub_100007370();
  }

    int v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v6, "operation", 6uLL);
    xpc_dictionary_set_uint64(v6, "directory", v1);
    int v7 = sub_100009184(v6, 3);

    return v7;
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_100003B48(unsigned int a1)
{
  if (a1 != 20180226) {
    sub_100022DA0(a1);
  }
  uint64_t result = _firehose_spi_version;
  if (_firehose_spi_version != 20180226) {
    sub_100022D78(_firehose_spi_version);
  }
  return result;
}

BOOL sub_100003B84()
{
  return !off_10002C2B0 || *((void *)off_10002C2B0 + 10) != 0LL;
}

void sub_100003BA8()
{
  if (off_10002C2B0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100003C48;
    block[3] = &unk_100028C50;
    block[4] = dword_10002C270;
    dispatch_async((dispatch_queue_t)qword_10002C298, block);
  }

  dispatch_mach_connect(qword_10002C278, dword_10002C270[0], 0LL, 0LL);
  for (uint64_t i = 0LL; i != 8; i += 2LL)
    dispatch_activate(*(dispatch_object_t *)&dword_10002C270[i + 46]);
}

void sub_100003C48(uint64_t a1)
{
  __int128 v4 = xmmword_1000245A0;
  uint64_t v5 = 0LL;
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 64LL);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C298);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000LL);
  *(void *)(v1 + 16) = 0LL;
  uint64_t v2 = off_10002C2D8;
  *(void *)(v1 + 24) = off_10002C2D8;
  *uint64_t v2 = v1;
  off_10002C2D8 = (_UNKNOWN **)(v1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  (*((void (**)(void *, uint64_t, uint64_t, __int128 *, void))off_10002C2A0 + 2))( off_10002C2A0,  v1,  1LL,  &v4,  0LL);
  unint64_t v3 = *(dispatch_object_s **)(v1 + 96);
  if (*(_DWORD *)(v1 + 128))
  {
    dispatch_mach_connect(v3, *(unsigned int *)(v1 + 112), 0LL, 0LL);
    dispatch_mach_connect(*(void *)(v1 + 104), *(unsigned int *)(v1 + 116), 0LL, 0LL);
  }

  else
  {
    dispatch_activate(v3);
  }

void sub_100003D24()
{
  v0 = off_10002C2D0;
  if (off_10002C2D0)
  {
    do
    {
      if (*((_DWORD *)v0 + 32))
      {
        dispatch_mach_cancel(v0[12]);
        dispatch_mach_cancel(v0[13]);
      }

      v0 = (void *)v0[2];
    }

    while (v0);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
}

void sub_100003D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100003DE8;
  block[3] = &unk_100028C78;
  void block[5] = a2;
  block[6] = a1;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)qword_10002C298, block);
}

uint64_t sub_100003DE8(void *a1)
{
  kern_return_t v2;
  uint64_t v3;
  memory_object_offset_t v4;
  kern_return_t memory_entry_64;
  uint64_t result;
  memory_object_size_t size;
  size = a1[5];
  if (dword_10002C2BC)
  {
    uint64_t v2 = mach_port_deallocate(mach_task_self_, dword_10002C2BC);
    if (v2 == -301) {
      sub_100022DC8();
    }
    if (v2) {
      _dispatch_bug(1024LL, v2);
    }
  }

  if (qword_10002C2C8) {
    munmap((void *)qword_10002C2C8, qword_10002C2C0);
  }
  unint64_t v3 = a1[5];
  qword_10002C2C8 = a1[6];
  qword_10002C2C0 = v3;
  dword_10002C2BC = 0;
  __int128 v4 = a1[6];
  if (v4)
  {
    memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, v4, 4194305, (mach_port_t *)&dword_10002C2BC, 0);
    if (memory_entry_64 == -301) {
      sub_100022DC8();
    }
    if (memory_entry_64) {
      _dispatch_bug(1039LL, memory_entry_64);
    }
  }

  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

dispatch_object_s *sub_100003ED8(uint64_t a1)
{
  uint64_t v1 = *(dispatch_object_s **)off_100028D00[a1 - 1];
  dispatch_retain(v1);
  return v1;
}

void sub_100003F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = (os_unfair_lock_s *)(a1 + 124);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 124));
  if (a3)
  {
    if ((*(unsigned int (**)(uint64_t))(a3 + 16))(a3))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      unint64_t v9 = *(void *)(v8 + 456);
      if (v9)
      {
        do
        {
          unint64_t v10 = __clz(__rbit64(v9));
          uint64_t v11 = (unsigned __int16 *)(v8 + (v10 << 12));
          v9 &= ~(1LL << v10);
        }

        while ((*v11 < 0x11u
              || !v11[19]
              || *((_BYTE *)v11 + 6) != 3
      }
    }
  }

  os_unfair_lock_unlock(v7);
}

void sub_100003FCC(const void *a1)
{
  uint64_t v2 = malloc(0x10uLL);
  *uint64_t v2 = _Block_copy(a1);
  v2[1] = dispatch_group_create();
  dispatch_async_f((dispatch_queue_t)qword_10002C280, v2, (dispatch_function_t)sub_10000401C);
}

void sub_10000401C(uint64_t a1)
{
  off_10002C2A8 = (_UNKNOWN *)a1;
  uint64_t v2 = *(dispatch_group_s **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100005144;
  block[3] = &unk_100028CE0;
  block[4] = a1;
  dispatch_group_async(v2, (dispatch_queue_t)qword_10002C298, block);
  dispatch_group_notify_f( *(dispatch_group_t *)(a1 + 8),  (dispatch_queue_t)qword_10002C288,  (void *)a1,  (dispatch_function_t)sub_1000053CC);
}

uint64_t sub_1000040AC( uint64_t a1, mem_entry_name_port_t a2, uint64_t a3, int a4, int a5, int a6, mach_port_name_t a7, mach_vm_size_t a8, _DWORD *a9)
{
  kern_return_t v17;
  kern_return_t v18;
  kern_return_t v19;
  kern_return_t v20;
  mach_vm_address_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  char v29;
  char v30;
  mach_port_name_t v31;
  uint64_t v32;
  kern_return_t v33;
  uint64_t f;
  uint64_t *v35;
  dispatch_object_s *v36;
  vm_address_t v37[2];
  vm_size_t size;
  mach_vm_address_t address;
  mach_vm_address_t v40[2];
  _DWORD v41[2];
  *(_OWORD *)v37 = xmmword_1000245A0;
  size = 0LL;
  address = 0LL;
  if (dispatch_mach_mig_demux_get_context()) {
    return 5LL;
  }
  if (a3 != 0x40000) {
    return 18LL;
  }
  unint64_t v17 = mach_vm_map(mach_task_self_, &address, 0x40000uLL, 0LL, 1, a2, 0LL, 0, 1, 1, 2u);
  if (v17 == -301) {
    sub_100022DC8();
  }
  if (v17)
  {
    _dispatch_bug(1343LL, v17);
    return 3LL;
  }

  if (a7)
  {
    if (!a8)
    {
LABEL_12:
      dispatch_source_t v19 = mach_port_deallocate(mach_task_self_, a7);
      if (v19 == -301) {
        sub_100022DC8();
      }
      if (v19) {
        _dispatch_bug(91LL, v19);
      }
      goto LABEL_16;
    }

    v40[0] = 0LL;
    v18 = mach_vm_map(mach_task_self_, v40, a8, 0LL, 1, a7, 0LL, 1, 1, 1, 2u);
    if (!v18)
    {
      v37[1] = v40[0];
      size = a8;
      goto LABEL_12;
    }

    sub_100022E18(v18, &address);
    return 3LL;
  }

LABEL_16:
  uint64_t v20 = mach_port_deallocate(mach_task_self_, a2);
  if (v20 == -301) {
    sub_100022DC8();
  }
  if (v20) {
    _dispatch_bug(91LL, v20);
  }
  uint64_t v21 = address;
  v22 = _os_object_alloc_realized(&OBJC_CLASS___OS_firehose_client, 152LL);
  v23 = v22;
  v24 = 0LL;
  *(void *)(v22 + 48) = v21;
  *(void *)(v22 + 64) = *(void *)(v21 + 464);
  *(void *)(v22 + 56) = *(void *)(v22 + 64);
  *(void *)(v22 + 80) = *(void *)(v21 + 488);
  *(void *)(v22 + 72) = *(void *)(v22 + 80);
  v25 = a9[5];
  if (!v25) {
    v25 = -1;
  }
  v26 = a9[1];
  v27 = a9[7];
  *(_DWORD *)(v22 + 128) = v25;
  *(_DWORD *)(v22 + 132) = v27;
  *(_DWORD *)(v22 + 136) = v26;
  v41[0] = a4;
  v41[1] = a5;
  v40[0] = qword_10002C298;
  v40[1] = qword_10002C288;
  *(_BYTE *)(v22 + 142) = 2;
  v28 = v22 + 96;
  v29 = 1;
  do
  {
    v30 = v29;
    v31 = v41[v24];
    v32 = v23 + 4 * v24;
    *(_DWORD *)(v32 + 112) = v31;
    v33 = mach_port_guard(mach_task_self_, v31, v32 + 112, 1);
    if (v33 == -301) {
      sub_100022DC8();
    }
    if (v33) {
      _dispatch_bug(101LL, v33);
    }
    uint64_t f = dispatch_mach_create_f("com.apple.firehose.peer", v40[v24], v23, sub_10000542C);
    v29 = 0;
    *(void *)(v28 + 8 * v24) = f;
    v24 = 1LL;
  }

  while ((v30 & 1) != 0);
  *(_DWORD *)(v23 + 120) = a6;
  dispatch_mach_notify_no_senders(*(void *)(v23 + 96), 1LL);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C298);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000LL);
  *(void *)(v23 + 16) = 0LL;
  v35 = (uint64_t *)off_10002C2D8;
  *(void *)(v23 + 24) = off_10002C2D8;
  *v35 = v23;
  off_10002C2D8 = (_UNKNOWN **)(v23 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  (*((void (**)(void *, uint64_t, uint64_t, vm_address_t *, void))off_10002C2A0 + 2))( off_10002C2A0,  v23,  1LL,  v37,  0LL);
  v36 = *(dispatch_object_s **)(v23 + 96);
  if (*(_DWORD *)(v23 + 128))
  {
    dispatch_mach_connect(v36, *(unsigned int *)(v23 + 112), 0LL, 0LL);
    dispatch_mach_connect(*(void *)(v23 + 104), *(unsigned int *)(v23 + 116), 0LL, 0LL);
  }

  else
  {
    dispatch_activate(v36);
  }

  if (size) {
    vm_deallocate(mach_task_self_, v37[1], size);
  }
  return 0LL;
}

      __int128 v4 = (char *)*((void *)v4 + 2);
    }

    while (v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
    if (v5)
    {
      int v13 = (unsigned int *)(*(void *)(a1 + 8) + 48LL);
      do
        int v14 = __ldxr(v13);
      while (__stxr(v14 - 4 * v5, v13));
    }
  }

  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  }

      __break(0x5513u);
    }
  }

  return sub_100005E78(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
}

    int v6 = __error();
    _os_assumes_log(*v6);
    return 0xFFFFFFFFLL;
  }

  int v7 = *__error();
  uint64_t result = *__error();
  if (v7 != 9)
  {
    _os_assumes_log(result);
    goto LABEL_8;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

uint64_t sub_100004440(int a1)
{
  unint64_t context = dispatch_mach_mig_demux_get_context();
  if (!context) {
    return 5LL;
  }
  int v3 = *(_DWORD *)(context + 116);
  if (!*(_BYTE *)(context + 144))
  {
    int v4 = 1 << (v3 == a1);
    uint64_t v5 = (unsigned __int16 *)(context + 140);
    do
    {
      int v6 = __ldxr(v5);
      if (((256 << (v3 == a1)) & v6) != 0 || (v4 & v6) != 0)
      {
        uint64_t v12 = 0LL;
        __clrex();
        return v12;
      }
    }

    while (__stxr(v6 | v4, v5));
    BOOL v7 = v3 == a1;
    uint64_t v8 = v7 | (2LL * *(unsigned __int8 *)(context + 147));
    *(void *)(context + 8 * v7 + 32) = 0LL;
    unint64_t v9 = (unint64_t *)&dword_10002C270[4 * v8 + 32];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 976) = v9;
    do
      unint64_t v11 = __ldxr(v9);
    while (__stlxr(context, v9));
    if (v11)
    {
      uint64_t v12 = 0LL;
      *(void *)(v11 + 8 * v7 + 32) = context;
      *(void *)(StatusReg + 976) = 0LL;
      return v12;
    }

    *(void *)&dword_10002C270[4 * v8 + 30] = context;
    *(void *)(StatusReg + 976) = 0LL;
    dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v8 + 46], 1uLL);
  }

  return 0LL;
}

uint64_t sub_100004548(int a1, mach_port_t a2)
{
  uint64_t context = dispatch_mach_mig_demux_get_context();
  if (!context) {
    return 5LL;
  }
  unint64_t v5 = context;
  int v6 = *(_DWORD *)(context + 116);
  if (*(_BYTE *)(context + 144))
  {
    sub_100022B4C(context, a2);
  }

  else
  {
    BOOL v7 = v6 == a1;
    BOOL v8 = v6 == a1;
    unint64_t v9 = &qword_10002C288;
    if (!v7) {
      unint64_t v9 = &qword_10002C298;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)*v9);
    sub_1000045D4(v5, a2, v8);
  }

  return 4294966991LL;
}

void sub_1000045D4(unint64_t a1, mach_port_t a2, int a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v53 = a3 & 1;
  unint64_t v5 = (uint64_t *)(a1 + 56);
  int v6 = (uint64_t *)(a1 + 64);
  BOOL v7 = (_BYTE *)(a1 + 146);
  uint64_t v8 = 4LL;
  if ((a3 & 1) != 0)
  {
    BOOL v7 = (_BYTE *)(a1 + 145);
    unint64_t v5 = (uint64_t *)(a1 + 72);
    int v6 = (uint64_t *)(a1 + 80);
    uint64_t v9 = v4 + 128;
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
  }

  if ((a3 & 1) != 0) {
    uint64_t v8 = 3LL;
  }
  uint64_t v57 = v8;
  uint64_t v58 = *(void *)(a1 + 48);
  uint64_t v54 = *v5;
  uint64_t v10 = *v6;
  if (*v7) {
    unint64_t v11 = (dispatch_group_t *)off_10002C2A8;
  }
  else {
    unint64_t v11 = 0LL;
  }
  if (*(_BYTE *)(a1 + 144))
  {
LABEL_80:
    if (v11)
    {
      if ((_DWORD)v53) {
        *(_BYTE *)(v3 + 145) = 0;
      }
      else {
        *(_BYTE *)(v3 + 146) = 0;
      }
      dispatch_group_leave(v11[1]);
    }

    sub_100022B4C(v3, a2);
    if (*(_DWORD *)(v3 + 128))
    {
      v45 = (unsigned __int16 *)(v3 + 140);
      do
      {
        int v46 = __ldxr(v45);
        if (((272 << v53) & v46) != 0)
        {
          __clrex();
          return;
        }
      }

      while (__stxr(v46 | (17 << v53), v45));
      if (v3 && ((1 << v53) & v46) == 0)
      {
        uint64_t v47 = v53 | (2LL * *(unsigned __int8 *)(v3 + 147));
        *(void *)(v3 + 8 * v53 + 32) = 0LL;
        v48 = (unint64_t *)&dword_10002C270[4 * v47 + 32];
        unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        *(void *)(StatusReg + 976) = v48;
        do
          unint64_t v50 = __ldxr(v48);
        while (__stlxr(v3, v48));
        if (v50)
        {
          *(void *)(v50 + 8 * v53 + 32) = v3;
          *(void *)(StatusReg + 976) = 0LL;
        }

        else
        {
          *(void *)&dword_10002C270[4 * v47 + 30] = v3;
          *(void *)(StatusReg + 976) = 0LL;
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v47 + 46], 1uLL);
        }
      }
    }

    return;
  }

  unsigned __int16 v12 = 0;
  __int16 v59 = *v6;
  uint64_t v13 = 320LL;
  if ((a3 & 1) != 0) {
    uint64_t v13 = 384LL;
  }
  v55 = (unsigned __int16 *)(v4 + v13);
  lock = (os_unfair_lock_s *)(a1 + 124);
  while ((unsigned __int16)v10 != (unsigned __int16)(v59 + v12))
  {
    do
LABEL_16:
      uint64_t v15 = *(_WORD *)(v9 + 2LL * (((_BYTE)v59 + (_BYTE)v12) & 0x3F)) & 0x3F;
    while (!(*(_DWORD *)(v3 + 128) | v15));
    if ((*(_WORD *)(v9 + 2LL * (((_BYTE)v59 + (_BYTE)v12) & 0x3F)) & 0x3F) != 0)
    {
      unint64_t v16 = v11;
      unint64_t v17 = v3;
      v18 = (unsigned int *)(v58 + (v15 << 12));
      uint64_t v19 = *((unsigned __int16 *)v18 + 2);
      uint64_t v20 = *v18;
      uint64_t v21 = *((unsigned __int8 *)v18 + 6);
      uint64_t v22 = *((unsigned __int8 *)v18 + 7);
      if (v21 == 3) {
        os_unfair_lock_lock(lock);
      }
      uint64_t v23 = (v20 | (v19 << 32)) & 0xFFFFFFFFFFFFLL | (v21 << 48) | (v22 << 56);
      unint64_t v3 = v17;
      (*((void (**)(void *, unint64_t, uint64_t, unsigned int *, uint64_t))off_10002C2A0 + 2))( off_10002C2A0,  v17,  v57,  v18,  v23);
      unint64_t v11 = v16;
      if (v16) {
        (*((void (**)(void))*v16 + 2))();
      }
      if ((_DWORD)v21 == 3) {
        os_unfair_lock_unlock(lock);
      }
    }

    if (++v12 >= 4u && !v11) {
      goto LABEL_28;
    }
  }

  int v14 = atomic_load(v55);
  if (v14 != (unsigned __int16)v10)
  {
    LOWORD(v10) = v14;
    goto LABEL_16;
  }

  if (!v12) {
    goto LABEL_75;
  }
LABEL_28:
  v24 = (unint64_t *)(v3 + 64);
  if ((_DWORD)v53) {
    v24 = (unint64_t *)(v3 + 80);
  }
  uint64_t v25 = 258LL;
  if ((_DWORD)v53) {
    uint64_t v25 = 262LL;
  }
  do
    unint64_t v26 = __ldxr(v24);
  while (__stxr(v26 + v12, v24));
  if (!*(_DWORD *)(v3 + 128)) {
    goto LABEL_50;
  }
  mach_port_t v27 = a2;
  if (a2)
  {
    if (v11) {
      goto LABEL_78;
    }
    goto LABEL_36;
  }

  if (*(unsigned __int16 *)(v58 + v25) != (unsigned __int16)v54)
  {
    mach_port_t v27 = 0;
    if (v11) {
      goto LABEL_78;
    }
  }

  else
  {
LABEL_50:
    mach_port_t v27 = *(_DWORD *)(v3 + 120);
    if (v11) {
      goto LABEL_78;
    }
  }

LABEL_36:
  if (v27)
  {
    while (1)
    {
      unint64_t v28 = *(void *)(v3 + 64);
      unint64_t v29 = *(void *)(v3 + 80);
      v60[0] = v28;
      v60[1] = v29;
      v30 = (unint64_t *)(v3 + 56);
      while (1)
      {
        unint64_t v31 = __ldxr(v30);
        if (v31 >= v28) {
          break;
        }
        if (!__stxr(v28, v30)) {
          goto LABEL_40;
        }
      }

      __clrex();
LABEL_40:
      v32 = (unint64_t *)(v3 + 72);
      while (1)
      {
        unint64_t v33 = __ldxr(v32);
        if (v33 >= v29) {
          break;
        }
        if (!__stxr(v29, v32)) {
          goto LABEL_43;
        }
      }

      __clrex();
LABEL_43:
      if (!*(_DWORD *)(v3 + 128)) {
        break;
      }
      if (*(_DWORD *)(v3 + 120) == v27) {
        int v34 = sub_100005AAC(v27, v28, v29, *(unsigned __int8 *)(v3 + 147), 0);
      }
      else {
        int v34 = sub_100005A40(v27, 0, v28, v29, *(unsigned __int8 *)(v3 + 147));
      }
      if (v34 != -301)
      {
        if (v34 == 268435459 || !v34) {
          goto LABEL_56;
        }
        uint64_t v35 = v34;
        uint64_t v36 = 235LL;
LABEL_105:
        _dispatch_bug(v36, v35);
        goto LABEL_56;
      }

      qword_10002DF48 = (uint64_t)"MIG_REPLY_MISMATCH";
      qword_10002DF78 = -301LL;
      __break(1u);
LABEL_75:
      unsigned __int16 v12 = 0;
      mach_port_t v27 = a2;
      if (!v11) {
        goto LABEL_36;
      }
LABEL_78:
      mach_port_t v44 = v27;
      sub_100022BC4(v3, (uint64_t)v11, v53);
      if ((_DWORD)v53) {
        *(_BYTE *)(v3 + 145) = 0;
      }
      else {
        *(_BYTE *)(v3 + 146) = 0;
      }
      dispatch_group_leave(v11[1]);
      mach_port_t v27 = v44;
      if (!v44) {
        goto LABEL_56;
      }
    }

    if ((ioctl(dword_10002C2B8, 0x80107451uLL, v60) & 0x80000000) == 0) {
      goto LABEL_56;
    }
    uint64_t v35 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!(_DWORD)v35) {
      goto LABEL_56;
    }
    uint64_t v36 = 223LL;
    goto LABEL_105;
  }

LABEL_56:
  if (*(_DWORD *)(v3 + 128))
  {
    if (v12 >= 4u)
    {
      int v37 = 1 << v53;
      v38 = (unsigned __int16 *)(v3 + 140);
      while (1)
      {
        int v39 = __ldxr(v38);
        if (((256 << v53) & v39) != 0)
        {
          __clrex();
          goto LABEL_68;
        }

        if ((v37 & v39) != 0) {
          break;
        }
        if (!__stxr(v39 | v37, v38)) {
          goto LABEL_62;
        }
      }

      __clrex();
LABEL_62:
      if (v3 && (v37 & v39) == 0)
      {
        uint64_t v40 = v53 | (2LL * *(unsigned __int8 *)(v3 + 147));
        *(void *)(v3 + 8 * v53 + 32) = 0LL;
        v41 = (unint64_t *)&dword_10002C270[4 * v40 + 32];
        unint64_t v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        *(void *)(v42 + 976) = v41;
        do
          unint64_t v43 = __ldxr(v41);
        while (__stlxr(v3, v41));
        if (v43)
        {
          *(void *)(v43 + 8 * v53 + 32) = v3;
          *(void *)(v42 + 976) = 0LL;
        }

        else
        {
          *(void *)&dword_10002C270[4 * v40 + 30] = v3;
          *(void *)(v42 + 976) = 0LL;
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v40 + 46], 1uLL);
        }
      }
    }

  unint64_t v33 = (unint64_t)*v11;
  *unint64_t v11 = (unsigned __int16 *)v33;
  return 1LL;
}

LABEL_68:
    if (v12)
    {
      if (off_10002C2B0) {
        sub_1000045D4(off_10002C2B0, 0LL, a3 | 2u);
      }
    }
  }

  else if ((a3 & 2) == 0)
  {
    dispatch_resume(*(dispatch_object_t *)(v3 + 96));
  }

uint64_t sub_100004BBC(uint64_t a1, _DWORD *a2, void *a3)
{
  *a2 = dword_10002C2BC;
  *a3 = qword_10002C2C0;
  return 0LL;
}

uint64_t sub_100004BDC(uint64_t a1, _DWORD *a2)
{
  uint64_t context = dispatch_mach_mig_demux_get_context();
  if (!context) {
    return 5LL;
  }
  uint64_t v4 = context;
  uint64_t result = 0LL;
  *a2 = *(unsigned __int8 *)(v4 + 143) == 0;
  return result;
}

void sub_100004C20(unint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)(a1 + 140);
  while (1)
  {
    unsigned __int16 v3 = __ldxr(v2);
    if ((v3 & 0x100) != 0)
    {
      __clrex();
      goto LABEL_11;
    }

    if ((v3 & 1) != 0) {
      break;
    }
    if (!__stxr(v3 | 1, v2)) {
      goto LABEL_5;
    }
  }

  __clrex();
LABEL_5:
  uint64_t v4 = *(unsigned __int8 *)(a1 + 147);
  if (a1 && (v3 & 1) == 0)
  {
    uint64_t v5 = 2 * v4;
    int v6 = &dword_10002C270[8 * v4 + 30];
    *(void *)(a1 + 32) = 0LL;
    BOOL v7 = (unint64_t *)&dword_10002C270[4 * v5 + 32];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 976) = v7;
    do
      unint64_t v9 = __ldxr(v7);
    while (__stlxr(a1, v7));
    if (v9)
    {
      *(void *)(v9 + 32) = a1;
      *(void *)(StatusReg + 976) = 0LL;
    }

    else
    {
      *(void *)int v6 = a1;
      *(void *)(StatusReg + 976) = 0LL;
      dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v5 + 46], 1uLL);
    }
  }

  while (1)
  {
LABEL_11:
    unsigned __int16 v10 = __ldxr(v2);
    if ((v10 & 0x200) != 0)
    {
      __clrex();
      return;
    }

    if ((v10 & 2) != 0) {
      break;
    }
    if (!__stxr(v10 | 2, v2)) {
      goto LABEL_14;
    }
  }

  __clrex();
LABEL_14:
  uint64_t v11 = 3LL;
  if (!*(_BYTE *)(a1 + 147)) {
    uint64_t v11 = 1LL;
  }
  if (a1 && (v10 & 2) == 0)
  {
    *(void *)(a1 + 40) = 0LL;
    unsigned __int16 v12 = (unint64_t *)&dword_10002C270[4 * v11 + 32];
    unint64_t v13 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(v13 + 976) = v12;
    do
      unint64_t v14 = __ldxr(v12);
    while (__stlxr(a1, v12));
    if (v14)
    {
      *(void *)(v14 + 40) = a1;
      *(void *)(v13 + 976) = 0LL;
    }

    else
    {
      *(void *)&dword_10002C270[4 * v11 + 30] = a1;
      *(void *)(v13 + 976) = 0LL;
      dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v11 + 46], 1uLL);
    }
  }

void sub_100004D80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 144))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C288);
    __dmb(9u);
    unint64_t v3 = *(void *)(v2 + 520) & 0xFFFFFFFFFFFFFFFELL;
    char v4 = 1;
    do
    {
      char v5 = v4;
      BOOL v6 = (v4 & 1) == 0;
      if ((v4 & 1) != 0) {
        uint64_t v7 = 64LL;
      }
      else {
        uint64_t v7 = 80LL;
      }
      if ((v4 & 1) != 0) {
        uint64_t v8 = 256LL;
      }
      else {
        uint64_t v8 = 260LL;
      }
      int v9 = *(unsigned __int16 *)(v2 + v8);
      if (v6) {
        uint64_t v10 = v2 + 128;
      }
      else {
        uint64_t v10 = v2;
      }
      uint64_t v11 = *(void *)(a1 + v7);
      if ((unsigned __int16)(v11 - v9) > 0x3Fu)
      {
        *(_BYTE *)(a1 + 144) = 1;
        goto LABEL_28;
      }

      if (v9 != (unsigned __int16)v11)
      {
        do
          v3 &= ~(1LL << *(_WORD *)(v10 + 2LL * (v9++ & 0x3F)));
        while ((unsigned __int16)v9 != (unsigned __int16)v11);
      }

      char v4 = 0;
    }

    while ((v5 & 1) != 0);
    if (v3)
    {
      uint64_t v12 = 0LL;
      unint64_t v13 = off_10002C2A8;
      do
      {
        unint64_t v14 = __clz(__rbit64(v3));
        uint64_t v15 = (unsigned __int16 *)(v2 + (v14 << 12));
        unint64_t v16 = *v15;
        uint64_t v17 = 1LL << v14;
        if (v16 >= 0x11 && v15[19])
        {
          uint64_t v18 = *((unsigned __int8 *)v15 + 7);
          if ((v18 & 2) != 0)
          {
            (*((void (**)(void *, uint64_t, uint64_t, unsigned __int16 *, unint64_t))off_10002C2A0 + 2))( off_10002C2A0,  a1,  3LL,  v15,  v16 & 0xFF0000000000FFFFLL | (((*(unsigned int *)(v15 + 1) | ((unint64_t)*((unsigned __int8 *)v15 + 6) << 32)) & 0xFFFFFFFFFFLL) << 16) | (v18 << 56));
            if (*(_BYTE *)(a1 + 145)) {
              (*(void (**)(void))(*(void *)v13 + 16LL))();
            }
          }

          else
          {
            v12 |= v17;
          }
        }

        v3 &= ~v17;
      }

      while (v3);
      if (v12)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 0x40000000LL;
        v19[2] = sub_10000508C;
        v19[3] = &unk_100028CA0;
        v19[4] = v12;
        v19[5] = v2;
        v19[6] = a1;
        v19[7] = v13;
        dispatch_async((dispatch_queue_t)qword_10002C298, v19);
        return;
      }
    }
  }

LABEL_28:
  sub_100004F7C(a1);
}

  _os_assumes_log(v18);
LABEL_12:
  uint64_t v22 = v24;
  uint64_t v23 = v25;
  unint64_t v13 = (char *)sandbox_extension_issue_file_to_process("com.apple.logd.read-only", v10, 0LL, &v22);
  if (v13) {
    xpc_dictionary_set_string(v4, "timesyncdir_sbext", v13);
  }
  free(v13);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  unint64_t v14 = qword_10003A968;
  uint64_t v15 = open((const char *)qword_10003A968, 0);
  if (v15 == -1)
  {
    uint64_t v18 = *__error();
LABEL_30:
    _os_assumes_log(v18);
    goto LABEL_18;
  }

  unint64_t v16 = v15;
  xpc_dictionary_set_fd(v4, "uuidtextdir_fd", v15);
  if (close(v16) == -1)
  {
    uint64_t v21 = *__error();
    uint64_t v18 = *__error();
    if (v21 != 9) {
      goto LABEL_30;
    }
LABEL_33:
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v18;
    __break(1u);
    return;
  }

uint64_t sub_100004F7C(uint64_t a1)
{
  uint64_t v2 = (dispatch_group_t *)off_10002C2A8;
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C288);
  if (*(_BYTE *)(a1 + 145))
  {
    dispatch_group_leave(v2[1]);
    *(_BYTE *)(a1 + 145) = 0;
  }

  if (*(_BYTE *)(a1 + 146))
  {
    dispatch_group_leave(v2[1]);
    *(_BYTE *)(a1 + 146) = 0;
  }

  if (*(_BYTE *)(a1 + 144)) {
    (*((void (**)(void *, uint64_t, uint64_t, uint64_t, void))off_10002C2A0 + 2))( off_10002C2A0,  a1,  5LL,  v3,  0LL);
  }
  (*((void (**)(void *, uint64_t, uint64_t, void, void))off_10002C2A0 + 2))( off_10002C2A0,  a1,  2LL,  0LL,  0LL);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000LL);
  uint64_t v4 = *(void *)(a1 + 16);
  char v5 = *(void **)(a1 + 24);
  if (v4)
  {
    *(void *)(v4 + 24) = v5;
    char v5 = *(void **)(a1 + 24);
  }

  else
  {
    off_10002C2D8 = *(_UNKNOWN ***)(a1 + 24);
  }

  *char v5 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  dispatch_release(*(dispatch_object_t *)(a1 + 96));
  *(void *)(a1 + 96) = 0LL;
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
  *(void *)(a1 + 104) = 0LL;
  *(void *)(a1 + 16) = -1985229329LL;
  *(void *)(a1 + 24) = -1985229329LL;
  return _os_object_release_without_xref_dispose(a1);
}

void sub_10000508C(uint64_t a1)
{
  for (unint64_t i = *(void *)(a1 + 32); i; i &= ~(1LL << v3))
  {
    unint64_t v3 = __clz(__rbit64(i));
    (*((void (**)(void *, void, uint64_t, unint64_t, void))off_10002C2A0 + 2))( off_10002C2A0,  *(void *)(a1 + 48),  4LL,  *(void *)(a1 + 40) + (v3 << 12),  *(void *)(*(void *)(a1 + 40) + (v3 << 12)));
    if (*(_BYTE *)(*(void *)(a1 + 48) + 146LL)) {
      (*(void (**)(void))(**(void **)(a1 + 56) + 16LL))();
    }
  }

  dispatch_async_f((dispatch_queue_t)qword_10002C288, *(void **)(a1 + 48), (dispatch_function_t)sub_100004F7C);
}

void sub_100005144(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(dispatch_group_s **)(v2 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000536C;
  block[3] = &unk_100028CC0;
  block[4] = v2;
  dispatch_group_async(v3, (dispatch_queue_t)qword_10002C288, block);
}

void sub_1000051DC(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = (char *)off_10002C2D0;
  if (off_10002C2D0)
  {
    int v5 = 0;
    int v6 = 1 << a2;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      if (!v4[144])
      {
        if (*((_DWORD *)v4 + 32))
        {
          uint64_t v8 = (unsigned __int16 *)(v4 + 140);
          do
          {
            int v9 = __ldxr(v8);
            if (((256 << a2) & v9) != 0)
            {
              __clrex();
              goto LABEL_16;
            }

            if ((v6 & v9) != 0)
            {
              __clrex();
              goto LABEL_13;
            }
          }

          while (__stxr(v9 | v6, v8));
          uint64_t v10 = a2 | (2LL * v4[147]);
          *(void *)&v4[8 * a2 + 32] = 0LL;
          uint64_t v11 = (unint64_t *)&dword_10002C270[4 * v10 + 32];
          *(void *)(StatusReg + 976) = v11;
          do
            unint64_t v12 = __ldxr(v11);
          while (__stlxr((unint64_t)v4, v11));
          if (v12)
          {
            *(void *)(v12 + 8LL * a2 + 32) = v4;
            *(void *)(StatusReg + 976) = 0LL;
          }

          else
          {
            *(void *)&dword_10002C270[4 * v10 + 30] = v4;
            *(void *)(StatusReg + 976) = 0LL;
            dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v10 + 46], 1uLL);
          }
        }

LABEL_13:
        ++v5;
        if (a2) {
          v4[145] = 1;
        }
        else {
          v4[146] = 1;
        }
      }

  uint64_t v4 = *a2 - v3;
  *a2 = v4;
  int v5 = (char *)a1 + v3;
  if (v4 >= 1) {
    return v5;
  }
  else {
    return 0LL;
  }
}

void sub_10000536C(uint64_t a1)
{
  if (off_10002C2B0) {
    sub_100004C20((unint64_t)off_10002C2B0);
  }
}

void sub_1000053CC(dispatch_object_t *a1)
{
  off_10002C2A8 = 0LL;
  dispatch_release(a1[1]);
  _Block_release(*a1);
  free(a1);
  dispatch_resume((dispatch_object_t)qword_10002C280);
}

void sub_10000542C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  kern_return_t v16;
  const void **v17;
  CFIndex v18;
  const CFArrayCallBacks *v19;
  CFAllocatorRef v20;
  unsigned __int16 *v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  unint64_t *v26;
  unint64_t StatusReg;
  unint64_t v28;
  unsigned __int16 v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  if (a2 > 7)
  {
    if (a2 == 8)
    {
      unsigned int v14 = (unsigned __int8 *)(a1 + 142);
      do
        int v15 = __ldxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (v15 == 1)
      {
        atomic_load((unsigned __int8 *)(a1 + 142));
        unint64_t v16 = mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 120));
        if (v16 == -301) {
          sub_100022DC8();
        }
        if (v16) {
          _dispatch_bug(91LL, v16);
        }
        *(_DWORD *)(a1 + 120) = 0;
        uint64_t v20 = (const __CFAllocator *)*(unsigned int *)(a1 + 112);
        if (((_DWORD)v20 + 1) >= 2
          || (uint64_t v20 = (const __CFAllocator *)*(unsigned int *)(a1 + 116), ((_DWORD)v20 + 1) > 1))
        {
          sub_100022E80(v20, v17, v18, v19);
        }

        uint64_t v21 = (unsigned __int16 *)(a1 + 140);
        do
        {
          uint64_t v22 = __ldxr(v21);
          if ((v22 & 0x110) != 0)
          {
            __clrex();
            goto LABEL_35;
          }
        }

        while (__stxr(v22 | 0x11, v21));
        uint64_t v23 = *(unsigned __int8 *)(a1 + 147);
        if (a1 && (v22 & 1) == 0)
        {
          v24 = 2 * v23;
          uint64_t v25 = &dword_10002C270[8 * v23 + 30];
          *(void *)(a1 + 32) = 0LL;
          unint64_t v26 = (unint64_t *)&dword_10002C270[4 * v24 + 32];
          unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          *(void *)(StatusReg + 976) = v26;
          do
            unint64_t v28 = __ldxr(v26);
          while (__stlxr(a1, v26));
          if (v28)
          {
            *(void *)(v28 + 32) = a1;
            *(void *)(StatusReg + 976) = 0LL;
          }

          else
          {
            *(void *)uint64_t v25 = a1;
            *(void *)(StatusReg + 976) = 0LL;
            dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v24 + 46], 1uLL);
            uint64_t v21 = (unsigned __int16 *)(a1 + 140);
          }
        }

        do
        {
LABEL_35:
          unint64_t v29 = __ldxr(v21);
          if ((v29 & 0x220) != 0)
          {
            __clrex();
            return;
          }
        }

        while (__stxr(v29 | 0x22, v21));
        v30 = 3LL;
        if (!*(_BYTE *)(a1 + 147)) {
          v30 = 1LL;
        }
        if (a1 && (v29 & 2) == 0)
        {
          *(void *)(a1 + 40) = 0LL;
          unint64_t v31 = (unint64_t *)&dword_10002C270[4 * v30 + 32];
          v32 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          *(void *)(v32 + 976) = v31;
          do
            unint64_t v33 = __ldxr(v31);
          while (__stlxr(a1, v31));
          if (v33)
          {
            *(void *)(v33 + 40) = a1;
            *(void *)(v32 + 976) = 0LL;
          }

          else
          {
            *(void *)&dword_10002C270[4 * v30 + 30] = a1;
            *(void *)(v32 + 976) = 0LL;
            dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v30 + 46], 1uLL);
          }
        }
      }
    }

    else if (a2 == 13)
    {
      dispatch_mach_cancel(*(void *)(a1 + 96));
      dispatch_mach_cancel(*(void *)(a1 + 104));
    }
  }

  else if (a2 == 2)
  {
    if ((dispatch_mach_mig_demux(a1, &off_100028C98, 1LL, a3) & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
      mach_msg_destroy(msg);
    }
  }

  else if (a2 == 7)
  {
    unsigned int v5 = *(_DWORD *)(dispatch_mach_msg_get_msg(a3, 0LL) + 12);
    if (v5 - 1 <= 0xFFFFFFFD)
    {
      uint64_t v6 = 0LL;
      for (char i = 1; ; char i = 0)
      {
        unint64_t v8 = a1 + 4 * v6;
        mach_port_name_t v11 = *(_DWORD *)(v8 + 112);
        uint64_t v10 = (_DWORD *)(v8 + 112);
        mach_port_name_t v9 = v11;
        if (v11 == v5) {
          break;
        }
        char v12 = i;
        uint64_t v6 = 1LL;
        if ((v12 & 1) == 0) {
          sub_100022E58(v5);
        }
      }

      *uint64_t v10 = 0;
    }
  }

uint64_t sub_1000056FC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_100005738(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 5 && *(_DWORD *)(result + 4) == 112)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned __int16 *)(result + 50) << 16 == 0x100000
      && *(unsigned __int16 *)(result + 62) << 16 == 0x100000
      && *(unsigned __int16 *)(result + 74) << 16 == 1114112
      && *(unsigned __int16 *)(result + 86) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 112) && *(_DWORD *)(result + 116) > 0x1Fu)
      {
        uint64_t v4 = *(unsigned int *)(result + 12);
        mem_entry_name_port_t v5 = *(_DWORD *)(result + 28);
        int v6 = *(_DWORD *)(result + 40);
        int v7 = *(_DWORD *)(result + 52);
        int v8 = *(_DWORD *)(result + 64);
        mach_port_name_t v9 = *(_DWORD *)(result + 76);
        uint64_t v10 = *(void *)(result + 96);
        mach_vm_size_t v11 = *(void *)(result + 104);
        __int128 v12 = *(_OWORD *)(result + 148);
        v13[0] = *(_OWORD *)(result + 132);
        v13[1] = v12;
        uint64_t result = sub_1000040AC(v4, v5, v10, v6, v7, v8, v9, v11, v13);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }

      int v3 = -309;
    }

    else
    {
      int v3 = -300;
    }
  }

  else
  {
    int v3 = -304;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000584C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100004548(result[3], result[2]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 56;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_1000058CC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100004440(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *sub_10000592C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(void *)(a2 + 32) = 0x13000000000000LL;
  uint64_t result = (_DWORD *)sub_100004BBC(result[3], (_DWORD *)(a2 + 28), (void *)(a2 + 48));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(NDR_record_t *)(a2 + 40) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_1000059C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_100004BDC(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100005A40(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v8 = a2;
  NDR_record_t v7 = NDR_record;
  uint64_t v9 = a3;
  uint64_t v10 = a4;
  int v11 = a5;
  msg.msgh_bits = 18;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 11701;
  return mach_msg(&msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t sub_100005AAC(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, mach_msg_timeout_t timeout)
{
  uint64_t v9 = a2;
  NDR_record_t v8 = NDR_record;
  uint64_t v10 = a3;
  int v11 = a4;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 11702;
  *(void *)&msg.msgh_local_port = 0LL;
  uint64_t v5 = mach_msg(&msg, 17, 0x34u, 0, 0, timeout, 0);
  if ((_DWORD)v5 == 268435460)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(mach_task_self_, msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }

  return v5;
}

void sub_100005B68(void *a1)
{
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  uid_t v1 = dword_10002DF0C[0];
  gid_t v2 = unk_10002DF10;
  id v3 = a1;
  snprintf(__str, 0x1EuLL, "%s.tmp", "version.plist");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  0LL));

  uint64_t v5 = openat(dword_10002DBF8, __str, 1794, 420LL);
  if ((_DWORD)v5 == -1)
  {
    NDR_record_t v8 = __error();
    _os_assumes_log(*v8);
  }

  else
  {
    uint64_t v6 = v5;
    fchown(v5, v1, v2);
    NDR_record_t v7 = -[NSFileHandle initWithFileDescriptor:](objc_alloc(&OBJC_CLASS___NSFileHandle), "initWithFileDescriptor:", v6);
    -[NSFileHandle writeData:error:](v7, "writeData:error:", v4, 0LL);
    -[NSFileHandle synchronizeAndReturnError:](v7, "synchronizeAndReturnError:", 0LL);
    -[NSFileHandle closeAndReturnError:](v7, "closeAndReturnError:", 0LL);
    if (renameat(dword_10002DBF8, __str, dword_10002DBF8, "version.plist") == -1)
    {
      uint64_t v9 = __error();
      _os_assumes_log(*v9);
    }
  }
}

uint64_t sub_100005CE8(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  unsigned int v5 = v4 + a2;
  if ((v4 + a2) >> 32)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    unsigned int v7 = *(_DWORD *)(a1 + 16);
  }

  else
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 16);
    }

    else
    {
      if (2 * v6 > v5) {
        unsigned int v5 = 2 * v6;
      }
      if (*(_DWORD *)(a1 + 16) >= v5) {
        unsigned int v7 = v5;
      }
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }

  if (v7 > v6)
  {
    NDR_record_t v8 = *(const void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      *(void *)a1 = _os_trace_realloc(*(void *)a1, v7);
    }

    else
    {
      uint64_t v9 = (void *)_os_trace_malloc(v7);
      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }

    *(_DWORD *)(a1 + 12) = v7;
  }

  return v7 - v4;
}

uint64_t sub_100005DAC(uint64_t result, void *__src, size_t __n)
{
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    size_t v3 = __n;
    unsigned int v5 = (void *)result;
    unsigned int v6 = *(_DWORD *)(result + 12);
    size_t v7 = *(char *)(result + 22) + v6 - *(_DWORD *)(result + 8) - 1;
    if (v7 < __n)
    {
      if (v6 < *(_DWORD *)(result + 16))
      {
        uint64_t result = sub_100005CE8(result, __n);
        size_t v7 = result;
      }

      if (v7 < v3)
      {
        *((_WORD *)v5 + 10) |= 2u;
        size_t v3 = v7;
      }
    }

    uint64_t v8 = *((unsigned int *)v5 + 2);
    if (__CFADD__(*v5, v8)) {
      goto LABEL_12;
    }
    uint64_t result = (uint64_t)memcpy((void *)(*v5 + v8), __src, v3);
    uint64_t v9 = (*((_DWORD *)v5 + 2) + v3);
    *((_DWORD *)v5 + 2) = v9;
    if (*((_BYTE *)v5 + 22)) {
      return result;
    }
    if (__CFADD__(*v5, v9))
    {
LABEL_12:
      __break(0x5513u);
      return result;
    }

    *(_BYTE *)(*v5 + v9) = 0;
  }

  return result;
}

uint64_t sub_100005E78( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*((_BYTE *)a1 + 22))
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0LL;
  }

  if ((*((_WORD *)a1 + 10) & 2) != 0) {
    return 0LL;
  }
  int v12 = *((_DWORD *)a1 + 2);
  int v11 = *((_DWORD *)a1 + 3);
  *__error() = 0;
  uint64_t v13 = *((unsigned int *)a1 + 2);
  if (__CFADD__(*a1, v13)) {
    goto LABEL_17;
  }
  uint64_t v14 = vsnprintf((char *)(*a1 + v13), (v11 - v12), a2, &a9);
  if ((v14 & 0x80000000) != 0)
  {
    uint64_t v18 = *((unsigned int *)a1 + 2);
    if (!__CFADD__(*a1, v18))
    {
      uint64_t v15 = 0LL;
      *(_BYTE *)(*a1 + v18) = 0;
      return v15;
    }

    goto LABEL_17;
  }

  uint64_t v15 = v14;
  uint64_t v16 = (v11 + ~v12);
  if (v14 > v16)
  {
    if (*((_DWORD *)a1 + 3) >= *((_DWORD *)a1 + 4)) {
      goto LABEL_9;
    }
    uint64_t v16 = sub_100005CE8((uint64_t)a1, v14);
    *__error() = 0;
    uint64_t v17 = *((unsigned int *)a1 + 2);
    if (!__CFADD__(*a1, v17))
    {
      vsnprintf((char *)(*a1 + v17), (v16 + 1), a2, &a9);
LABEL_9:
      if (v15 > v16)
      {
        *((_WORD *)a1 + 10) |= 2u;
        uint64_t v15 = v16;
      }

      goto LABEL_11;
    }

LABEL_17:
    __break(0x5513u);
  }

          unsigned int v6 = fts_read(v4);
          if (!v6) {
            goto LABEL_18;
          }
        }

        uint64_t v9 = 4;
LABEL_15:
        uint64_t v13 = v9;
        if (setattrlist(v6->fts_path, &v14, &v13, 4uLL, 0) == -1)
        {
          uint64_t v10 = __error();
          _os_assumes_log(*v10);
        }

        goto LABEL_17;
      }

      _os_assumes_log(0LL);
      return 0LL;
    }

    if (a1[1] != 88) {
      goto LABEL_17;
    }
    size_t v3 = 88LL;
  }

LABEL_11:
  *((_DWORD *)a1 + 2) += v15;
  return v15;
}

  uuid_unparse_upper((const unsigned __int8 *)a3 + 24, out);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out, @"UUID"));
  v29[1] = @"ContinuousTime";
  v30[0] = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3[1]));
  v30[1] = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  [v7 setObject:v18 forKeyedSubscript:v6];
}

tm *sub_100006000(tm *result, time_t a2)
{
  time_t v17 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    goto LABEL_9;
  }

  gid_t v2 = result;
  if ((result->tm_year & 2) == 0)
  {
    v16.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.tm_mon = v3;
    *(_OWORD *)&v16.tm_isdst = v3;
    *(_OWORD *)&v16.tm_sec = v3;
    uint64_t result = localtime_r(&v17, &v16);
    if (result)
    {
      if (!__OFADD__(v16.tm_year, 1900) && !__OFADD__(v16.tm_mon, 1))
      {
        sub_100005E78(v2, "%04d-%02d-%02d %02d:%02d:%02d", v4, v5, v6, v7, v8, v9, LOBYTE(v16.tm_year) + 108);
        return (tm *)sub_100005E78( v2,  "%+05ld",  v10,  v11,  v12,  v13,  v14,  v15,  (v16.tm_gmtoff / 60 % 60) + 100 * (v16.tm_gmtoff / 3600));
      }

LABEL_9:
      __break(0x5500u);
    }
  }

  return result;
}

  memset(uu, 170, sizeof(uu));
  boot_uuid = (const char *)_os_trace_get_boot_uuid(v2);
  uuid_parse(boot_uuid, uu);
  uint64_t v7 = (int *)_os_trace_zalloc(48LL);
  memset(__str, 170, 26);
  snprintf(__str, 0x1AuLL, "%016llx.timesync", 1LL);
  uint64_t v8 = openat(v3, __str, 1537, 420LL);
  if (v8 < 0)
  {
    free(v7);
    uint64_t v7 = 0LL;
  }

  else
  {
    *uint64_t v7 = v8;
    uuid_copy((unsigned __int8 *)v7 + 4, uu);
    *((void *)v7 + 3) = _os_trace_calloc(8196LL, 64LL);
    *((_OWORD *)v7 + 2) = xmmword_1000248A0;
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v41 = sub_10001BA9C;
  unint64_t v42 = &unk_100029ED0;
  unint64_t v43 = v7;
  uint64_t v9 = v40;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  *(void *)__str = qword_10003A958;
  *(void *)&char __str[8] = 0LL;
  uint64_t v10 = fts_open((char *const *)__str, 2132, 0LL);
  int v39 = a1;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = fts_read(v10);
    if (v12)
    {
      uint64_t v13 = v12;
      do
      {
        if (v13->fts_info == 8) {
          ((void (*)(void *))v41)(v9);
        }
        uint64_t v13 = fts_read(v11);
      }

      while (v13);
    }

    fts_close(v11);
  }

  else
  {
    _os_assumes_log(0LL);
  }

  qsort_b(*((void **)v7 + 3), *((void *)v7 + 4), 0x40uLL, &stru_10002A3A0);
  uint64_t v14 = operator new(0x28uLL);
  *uint64_t v14 = 0u;
  v14[1] = 0u;
  *((_DWORD *)v14 + 8) = 1065353216;
  uint64_t v15 = *((void *)v7 + 4);
  if (v15)
  {
    tm v16 = 0LL;
    time_t v17 = 0LL;
    uint64_t v18 = *((void *)v7 + 3);
    do
    {
      uint64_t v19 = sub_10001F114(v14, (void *)(v18 + v16 + 8));
      if (!v19)
      {
        uint64_t v19 = *((void *)v14 + 3) + 1LL;
        sub_10001ECF8((float *)v14, (uint64_t *)(v18 + v16 + 8), v19);
        uint64_t v18 = *((void *)v7 + 3);
        uint64_t v15 = *((void *)v7 + 4);
      }

      *(void *)(v18 + v16) = v19;
      ++v17;
      v16 += 64LL;
    }

    while (v17 < v15);
  }

  sub_10001F270((void **)v14);
  qsort_b(*((void **)v7 + 3), *((void *)v7 + 4), 0x40uLL, &stru_10002A3E0);
  memset(dst, 0, sizeof(dst));
  if (*((void *)v7 + 4))
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = (const unsigned __int8 *)(*((void *)v7 + 3) + 32LL);
    uint64_t v22 = 1LL;
    do
    {
      if (*(void *)dst == *((void *)v21 - 3) && *(void *)&dst[8] == *((void *)v21 - 2))
      {
        uint64_t v23 = *((void *)v21 + 3);
        if (v23 != v20)
        {
          *(void *)__str = 2126676LL;
          *(void *)&char __str[8] = v23;
          *(void *)&__str[16] = 1000000000LL * *((void *)v21 - 1) + 1000LL * *(int *)v21;
          *(void *)&__str[24] = *((void *)v21 + 1);
          if (_os_trace_write(*v7, __str, 32LL) == -1)
          {
            unint64_t v28 = __error();
            _os_assumes_log(*v28);
            unint64_t v26 = -1;
          }

          else
          {
            unint64_t v26 = 0;
          }

          if (v26) {
            break;
          }
        }
      }

      else
      {
        *(_DWORD *)__str = 3193776;
        memset(&__str[4], 0, 20);
        *(void *)&__str[24] = *((void *)v21 + 2);
        *(void *)&__str[32] = 1000000000LL * *((void *)v21 - 1)
                              + 1000LL * *(int *)v21
                              - *((void *)v21 + 3)
                              * (unint64_t)*(unsigned int *)&__str[24]
                              / HIDWORD(*(void *)&__str[24]);
        *(void *)&__str[40] = *((void *)v21 + 1);
        uuid_copy((unsigned __int8 *)&__str[8], v21 - 24);
        v44[0] = 2126676LL;
        v44[1] = *((void *)v21 + 3);
        v44[2] = 1000000000LL * *((void *)v21 - 1) + 1000LL * *(int *)v21;
        v44[3] = *((void *)v21 + 1);
        v48[0] = __str;
        v48[1] = 48LL;
        v48[2] = v44;
        v48[3] = 32LL;
        if (_os_trace_writev(*v7, v48, 2LL) == -1)
        {
          mach_port_t v27 = __error();
          _os_assumes_log(*v27);
          v24 = -1;
        }

        else
        {
          v24 = 0;
        }

        uuid_copy(dst, v21 - 24);
        if (v24) {
          break;
        }
      }

      uint64_t v20 = *((void *)v21 + 3);
      v21 += 64;
    }

    while (v22++ < *((void *)v7 + 4));
  }

  if (!lseek(*v7, 0LL, 2))
  {
    memset(__str, 170, sizeof(__str));
    if (fcntl(*v7, 50, __str) == -1)
    {
      uint64_t v35 = __error();
      _os_assumes_log(*v35);
    }

    if (unlink(__str) == -1)
    {
      uint64_t v36 = __error();
      _os_assumes_log(*v36);
    }
  }

  if (close(*v7) != -1) {
    goto LABEL_49;
  }
  unint64_t v33 = *__error();
  int v34 = *__error();
  if (v33 == 9)
  {
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v34;
    __break(1u);
    goto LABEL_63;
  }

  _os_assumes_log(v34);
LABEL_49:
  free(*((void **)v7 + 3));
  free(v7);
  unint64_t v29 = v39;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A8F8);
  v30 = sub_100017B30();
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"Pending"]);
  if ([v32 containsObject:v29])
  {
    [v32 removeObject:v29];
    if (![v32 count]) {
      [v31 removeObjectForKey:@"Pending"];
    }
    sub_100005B68(v31);
  }
}

uint64_t sub_100006154(uint64_t a1, const char *a2, const char *a3, off_t a4)
{
  uint64_t v7 = a1;
  off_t v8 = lseek(a1, 0LL, 2);
  if (v8 == -1)
  {
    uint64_t v10 = __error();
    _os_assumes_log(*v10);
  }

  fsync(v7);
  if (v8 < a4) {
    return v7;
  }
  if (close(v7) != -1)
  {
LABEL_5:
    if (renameat(dword_10002DBF8, a2, dword_10002DBF8, a3) == -1)
    {
      uint64_t v12 = __error();
      _os_assumes_log(*v12);
    }

    uint64_t v7 = openat(dword_10002DBF8, a2, 778, 420LL);
    if ((_DWORD)v7 == -1)
    {
      uint64_t v13 = __error();
      _os_assumes_log(*v13);
    }

    return v7;
  }

  int v11 = *__error();
  uint64_t result = *__error();
  if (v11 != 9)
  {
    _os_assumes_log(result);
    goto LABEL_5;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

uint64_t sub_10000628C(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    uint64_t v2 = _os_assert_log(0LL);
    uint64_t result = _os_crash(v2);
    __break(1u);
  }

  else if (!__CFADD__(result + 88, 8LL * a2))
  {
    result += 8LL * a2 + 88;
    return result;
  }

  __break(0x5513u);
  return result;
}

void sub_1000062CC(uint64_t a1, unsigned int a2)
{
  if (a2 >= 6)
  {
    __break(0x5512u);
LABEL_8:
    __break(0x5513u);
  }

  char v2 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = &qword_10002C398[156 * a2];
  os_retain(*(void **)(v3 + 64));
  uint64_t v5 = v4[1];
  if (v5) {
    uint64_t v6 = (dispatch_queue_s **)(v5 + 16);
  }
  else {
    uint64_t v6 = (dispatch_queue_s **)v4;
  }
  uint64_t v7 = *v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = sub_1000063B8;
  v8[3] = &unk_100028E80;
  v8[4] = v3;
  v8[5] = v4;
  char v9 = v2;
  dispatch_async(v7, v8);
}

void sub_1000063B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (const void *)(v2 + 138);
  uint64_t v5 = (void *)sub_10000628C(v2, *(unsigned __int8 *)(a1 + 48));
  sub_100006430(v3, v4, v5);
  *(void *)sub_10000628C(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48)) = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 132LL));
  os_release(*(void **)(*(void *)(a1 + 32) + 64LL));
}

void sub_100006430(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6) {
    uint64_t v7 = (dispatch_queue_t *)(v6 + 16);
  }
  else {
    uint64_t v7 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v7);
  if (*(unsigned __int8 *)(a1 + 1240) <= 4u && *a3)
  {
    off_t v8 = (rb_tree_t *)(a1 + 1176);
    node = rb_tree_find_node(v8, a2);
    if (!node)
    {
      size_t v10 = strlen((const char *)a2);
      node = (void *)_os_trace_calloc(1LL, v10 + 33);
      size_t v11 = strlen((const char *)a2);
      memcpy(node + 4, a2, v11);
      rb_tree_insert_node(v8, node);
    }

    node[3] += *a3;
  }

uint64_t sub_1000064F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcmp((const char *)(a2 + 32), (const char *)(a3 + 32));
}

uint64_t sub_100006504(int a1, uint64_t a2, char *__s2)
{
  return strcmp((const char *)(a2 + 32), __s2);
}

void sub_100006510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3) {
    uint64_t v4 = (dispatch_queue_t *)(v3 + 16);
  }
  else {
    uint64_t v4 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v4);
  unsigned int v5 = *(unsigned __int8 *)(a1 + 1240);
  if (v5 > 4) {
    return;
  }
  v188[0] = _NSConcreteStackBlock;
  v188[1] = 0x40000000LL;
  v188[2] = sub_10000720C;
  v188[3] = &unk_100028E40;
  v188[4] = a1;
  char v189 = v5;
  sub_1000075B4((uint64_t)v188);
  size_t __nel = rb_tree_count((rb_tree_t *)(a1 + 1176));
  uint64_t v6 = _os_trace_calloc(1LL, 8 * __nel);
  uint64_t v7 = rb_tree_iterate((rb_tree_t *)(a1 + 1176), 0LL, 1u);
  if (v7)
  {
    off_t v8 = v7;
    unint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    while (1)
    {
      size_t v11 = rb_tree_iterate((rb_tree_t *)(a1 + 1176), v8, 1u);
      rb_tree_remove_node((rb_tree_t *)(a1 + 1176), v8);
      if (v9 == 0x3FFFFFFF8LL) {
        break;
      }
      if (v9 > ~v6) {
        goto LABEL_108;
      }
      *(void *)(v6 + v9) = v8;
      v10 += v8[3];
      v9 += 8LL;
      off_t v8 = v11;
      if (!v11) {
        goto LABEL_12;
      }
    }

LABEL_109:
    __break(0x5500u);
  }

  unint64_t v10 = 0LL;
LABEL_12:
  unint64_t v12 = __nel;
  qsort((void *)v6, __nel, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000728C);
  unsigned int v13 = *(unsigned __int8 *)(a1 + 1240);
  if (v13 <= 3)
  {
    uint64_t v14 = *(uint64_t **)(a1 + 8);
    uint64_t v15 = v14[17];
    v14[16] = v15;
    __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    v14[17] = v16;
    double v17 = (double)v14[6] / ((double)(v16 - v15) / 1000000000.0);
    if (v17 <= -1.0 || v17 >= 1.84467441e19) {
      goto LABEL_110;
    }
    uint64_t v19 = &xmmword_10003A930;
    if (v13 == 3) {
      uint64_t v19 = (__int128 *)((char *)&xmmword_10003A930 + 8);
    }
    if (*(void *)v19 < (unint64_t)v17)
    {
      BOOL v177 = v5 == 3;
      if ((v5 == 3 || !(_BYTE)word_10003A950) && (v5 != 3 || !HIBYTE(word_10003A950)))
      {
        char is_development_build = _os_trace_is_development_build();
        if (v5 == 3 || (is_development_build & 1) == 0)
        {
          uint64_t v100 = 1LL;
        }

        else
        {
          double v91 = *(double *)&qword_10003A948 * (double)v10;
          if (v91 <= -1.0 || v91 >= 1.84467441e19)
          {
LABEL_110:
            __break(0x5505u);
            return;
          }

          unint64_t v93 = (unint64_t)v91;
          if (v5 == 1) {
            unint64_t v94 = 1LL;
          }
          else {
            unint64_t v94 = qword_10003A940;
          }
          uint64_t v95 = *(void *)v6;
          if (strcmp((const char *)(*(void *)v6 + 32LL), "/kernel") || *(void *)(v95 + 24) < v93)
          {
            if (v94 >= __nel) {
              size_t v96 = __nel;
            }
            else {
              size_t v96 = v94;
            }
            if (v96)
            {
              unint64_t v97 = 0LL;
              unint64_t v98 = 0LL;
              unint64_t v99 = 0LL;
              while (!(v98 >> 60) && v97 <= ~v6)
              {
                uint64_t v100 = v98 + 1;
                v99 += *(void *)(*(void *)(v6 + 8 * v98) + 24LL);
                if (v99 >= v93) {
                  goto LABEL_78;
                }
                v97 += 8LL;
                ++v98;
                if (v96 == v100) {
                  goto LABEL_25;
                }
              }

              goto LABEL_108;
            }

            goto LABEL_25;
          }

          if (__nel >= 2) {
            uint64_t v100 = 2LL;
          }
          else {
            uint64_t v100 = __nel;
          }
          if (!v100) {
            goto LABEL_25;
          }
        }

LABEL_78:
        unint64_t v101 = 0LL;
        unint64_t v102 = 0LL;
        BOOL v176 = v5 == 3;
        unint64_t v179 = ~v6;
        uint64_t v187 = v6;
        uint64_t v178 = v100;
        while (1)
        {
          if (v102 >> 60 || v101 > v179) {
            goto LABEL_108;
          }
          uint64_t v103 = *(void *)(v6 + v101);
          if ((_os_trace_is_development_build() & 1) == 0)
          {
            memset(&__str[21], 170, 0x3EBuLL);
            strcpy(__str, "Quarantined: /kernel");
            sub_10000B70C((uint64_t)__str);
            BOOL v104 = 0LL;
            byte_10003A7B8 = 1;
            goto LABEL_85;
          }

            os_unfair_lock_unlock(lock);
            goto LABEL_82;
          case 1:
            if (v16 + 4 > v12) {
              continue;
            }
            v24 = v18 + v16;
            if (v24 - 4094 < 0xFFFFFFFFFFFFF000LL || v24 - 4093 < 0xFFFFFFFFFFFFF000LL) {
              goto LABEL_135;
            }
            if (v8[v16 + 2]
               + (unint64_t)(unsigned __int16)(v16 + 4)
               + v8[v16 + 3] > v12)
            {
              uint64_t v69 = v12;
            }

            else
            {
              uint64_t v69 = v8[v16 + 2] + v16 + 4 + v8[v16 + 3];
              unint64_t v25 = (unsigned __int8 *)sub_100007554((uint64_t)&v8[v16]);
              *(void *)&uint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (v25)
              {
                sub_100008794(v3, v25);
                goto LABEL_82;
              }
            }

            continue;
          case 2:
            if (v16 + 32 > v12) {
              continue;
            }
            uint64_t v69 = v16 + 32;
            if (__CFADD__(v8, v16)) {
              goto LABEL_136;
            }
            unint64_t v26 = v18 + v16;
            uint64_t v27 = &v8[v16];
            if ((_DWORD)v19 == 2)
            {
              os_unfair_lock_lock_with_options(lock, 0x10000LL);
              uint64_t v49 = *(_WORD *)(v3 + 130);
              if (!v49) {
                goto LABEL_78;
              }
              uint64_t v50 = 0LL;
              uint64_t v51 = 0LL;
              while (1)
              {
                uint64_t v52 = *(void *)(v3 + 72);
                if (__CFADD__(v52, v50)) {
                  break;
                }
                if (v26 > 0xFF8) {
                  goto LABEL_135;
                }
                if (*(void *)(v52 + v50 + 14) == *(void *)v27)
                {
                  if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFF7LL
                    || (unint64_t)(v52 + v50 + 14) > 0xFFFFFFFFFFFFFFF7LL)
                  {
                    break;
                  }

                  if (v26 - 4081 < 0xFFFFFFFFFFFFF007LL) {
                    goto LABEL_135;
                  }
                  uint64_t v53 = v52 + v50;
                  if (*(void *)(v53 + 22) == *((void *)v27 + 1))
                  {
                    *(_WORD *)(v53 + 12) = 0;
                    *(_DWORD *)(v53 + 8) = 0;
                    *(void *)uint64_t v53 = 0LL;
                    uint64_t v49 = *(_WORD *)(v3 + 130);
                  }
                }

                ++v51;
                v50 += 32LL;
                if (v51 >= v49) {
                  goto LABEL_78;
                }
              }

LABEL_98:
          ++v102;
          v101 += 8LL;
          if (v100 == v102) {
            goto LABEL_25;
          }
        }

        v190[0] = _NSConcreteStackBlock;
        v190[1] = 0x40000000LL;
        v190[2] = sub_1000072AC;
        v190[3] = &unk_100028EA0;
        v190[4] = v103;
        BOOL v191 = v176;
        sub_1000075B4((uint64_t)v190);
        BOOL v104 = v177;
LABEL_85:
        memset(__b, 170, sizeof(__b));
        unint64_t v194 = 0xAA00000000000000LL;
        v192 = __b;
        uint64_t v193 = 0x40000000000LL;
        sub_100005E78(&v192, "--- !logd quarantine record\n", v105, v106, v107, v108, v109, v110, v170);
        time_t v111 = time(0LL);
        memset(v195, 170, sizeof(v195));
        v118 = "Quaratine";
        if (v104) {
          v118 = "Super Quarantine";
        }
        sub_100005E78(&v192, "type         : %s\n", v112, v113, v114, v115, v116, v117, (char)v118);
        snprintf(v195, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(a2 + 8), *(void *)(a2 + 24) - 1LL);
        sub_100005E78(&v192, "file         : %s\n", v119, v120, v121, v122, v123, v124, (char)v195);
        sub_100005E78(&v192, "client       : %s\n", v125, v126, v127, v128, v129, v130, v103 + 32);
        sub_100005E78(&v192, "time         : ", v131, v132, v133, v134, v135, v136, v175);
        sub_100006000((tm *)&v192, v111);
        __str[0] = 10;
        if ((v194 & 0x200000000LL) == 0)
        {
          char v143 = BYTE6(v194);
          int v144 = v193;
          if (SBYTE6(v194) + HIDWORD(v193) - 1 == (_DWORD)v193)
          {
            sub_100005DAC((uint64_t)&v192, __str, 1uLL);
          }

          else
          {
            v145 = v192;
            unint64_t v146 = ~(unint64_t)v192;
            *((_BYTE *)v192 + v193) = 10;
            uint64_t v147 = (v144 + 1);
            LODWORD(v193) = v147;
            if (!v143)
            {
              v145[v147] = 0;
            }
          }
        }

        contexta = (void *)v102;
        sub_100005E78( &v192,  "time covered : %llu\n",  v137,  v138,  v139,  v140,  v141,  v142,  (*(void *)(a2 + 136) - *(void *)(a2 + 128)) / 0x3B9ACA00uLL);
        sub_100005E78(&v192, "client total : %zu\n", v148, v149, v150, v151, v152, v153, *(void *)(v103 + 24));
        sub_100005E78(&v192, "overall total: %zu\n\n", v154, v155, v156, v157, v158, v159, v10);
        sub_100007370();
        if ((v194 & 0x100000000LL) != 0)
        {
          v160 = v192;
          v192 = (void *)3954044928LL;
          WORD2(v194) = 0;
          free(v160);
        }

        v180 = objc_autoreleasePoolPush();
        bzero(__str, 0x400uLL);
        snprintf(__str, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(a2 + 8), *(void *)(a2 + 24) - 1LL);
        v205 = @"logd quarantine";
        v197 = @"record";
        v198 = @"superQuarantine";
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v104));
        v206 = v161;
        v199 = @"file";
        v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __str));
        v207 = v162;
        v200 = @"client";
        v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v103 + 32));
        v208 = v163;
        v201 = @"unixTime";
        v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v111));
        v209 = v164;
        v202 = @"timeCovered";
        v165 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (*(void *)(a2 + 136) - *(void *)(a2 + 128)) / 0x3B9ACA00uLL));
        v210 = v165;
        v203 = @"sizeBytes";
        v166 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  *(void *)(v103 + 24)));
        v211 = v166;
        v204 = @"totalBytes";
        v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v10));
        v212 = v167;
        v168 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v205,  &v197,  8LL));

        size_t v169 = sub_10000F9A4((char *)__b, 0x400uLL, v168);
        objc_autoreleasePoolPop(v180);
        if (v169) {
          sub_1000073D4();
        }
        uint64_t v6 = v187;
        unint64_t v12 = __nel;
        uint64_t v100 = v178;
        unint64_t v102 = (unint64_t)contexta;
        goto LABEL_98;
      }
    }
  }

LABEL_25:
  os_unfair_lock_lock_with_options(&stru_10002DF90, 0x10000LL);
  time_t v20 = time(0LL);
  time_t v21 = v20;
  uint64_t v22 = a2;
  if (a2)
  {
    time_t v183 = v20;
    uint64_t v186 = v6;
    if (v12 >= 0x32) {
      uint64_t v23 = 50LL;
    }
    else {
      uint64_t v23 = v12;
    }
    uint64_t context = objc_autoreleasePoolPush();
    bzero(__str, 0x400uLL);
    snprintf(__str, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(a2 + 8), *(void *)(a2 + 24) - 1LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v23));
    if (v23)
    {
      unint64_t v25 = 0LL;
      unint64_t v26 = ~v6;
      uint64_t v27 = 8 * v23;
      while (v25 <= v26)
      {
        uint64_t v28 = *(void *)(v186 + v25);
        uint64_t v29 = *(void *)(v28 + 24);
        uint64_t v30 = v28 + 32;
        v197 = @"sizeBytes";
        unint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  v29));
        v205 = v31;
        v198 = @"process";
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v30));
        v206 = v32;
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v205,  &v197,  2LL));
        [v24 addObject:v33];

        v25 += 8LL;
        if (v27 == v25) {
          goto LABEL_33;
        }
      }

      goto LABEL_108;
    }

      __break(0x5513u);
    }

    __break(0x5513u);
  }

  return result;
}

LABEL_33:
    *(void *)v195 = @"record";
    *(void *)&v195[8] = @"type";
    __b[0] = @"logd statistics";
    __b[1] = @"File Rotate";
    *(void *)&v195[16] = @"file";
    int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __str));
    __b[2] = v34;
    *(void *)&v195[24] = @"unixTime";
    time_t v21 = v183;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v183));
    __b[3] = v35;
    *(void *)&v195[32] = @"totalBytes";
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v10));
    *(void *)&v195[40] = @"processList";
    __b[4] = v36;
    __b[5] = v24;
    int v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  __b,  v195,  6LL));

    size_t v38 = sub_10000F9A4(byte_10002DF94, 0xC800uLL, v37);
    objc_autoreleasePoolPop(context);
    uint64_t v22 = a2;
    uint64_t v6 = v186;
    unint64_t v12 = __nel;
    if (v38)
    {
      sub_100007444();
      dword_10002C34C = sub_100006154( dword_10002C34C,  "logdata.statistics.0.jsonl",  "logdata.statistics.1.jsonl",  5242880LL);
    }
  }

  memset(__str, 170, 0x400uLL);
  *(void *)&v195[16] = 0xAA00000000000000LL;
  *(void *)v195 = __str;
  *(void *)&v195[8] = 0x40000000000LL;
  sub_100005E78(v195, "--- !logd statistics record\n", v39, v40, v41, v42, v43, v44, v170);
  if (v22)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v22 + 8), *(void *)(v22 + 24) - 1LL);
    sub_100005E78(v195, "type  : File Rotate\n", v51, v52, v53, v54, v55, v56, v172);
    sub_100005E78(v195, "file  : %s\n", v57, v58, v59, v60, v61, v62, (char)__b);
  }

  else
  {
    sub_100005E78(v195, "type  : Memory Rollover\n", v45, v46, v47, v48, v49, v50, v171);
  }

  sub_100005E78(v195, "time  : ", v63, v64, v65, v66, v67, v68, v173);
  sub_100006000((tm *)v195, v21);
  LOBYTE(__b[0]) = 10;
  if ((v195[20] & 2) == 0)
  {
    char v75 = v195[22];
    int v76 = *(_DWORD *)&v195[8];
    if (v195[22] + *(_DWORD *)&v195[12] - 1 == *(_DWORD *)&v195[8]) {
      goto LABEL_107;
    }
    uint64_t v77 = *(void *)v195;
    unint64_t v78 = ~*(void *)v195;
    *(_BYTE *)(*(void *)v195 + *(unsigned int *)&v195[8]) = 10;
    uint64_t v79 = (v76 + 1);
    *(_DWORD *)&v195[8] = v79;
    if (!v75)
    {
      if (v78 < v79)
      {
LABEL_108:
        __break(0x5513u);
        goto LABEL_109;
      }

      *(_BYTE *)(v77 + v79) = 0;
    }
  }

  while (1)
  {
    sub_100005E78(v195, "total : %zu\n", v69, v70, v71, v72, v73, v74, v10);
    sub_100005E78(v195, "procs :\n", v80, v81, v82, v83, v84, v85, v174);
    sub_100007484();
    if ((v195[20] & 1) == 0) {
      break;
    }
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
LABEL_107:
    sub_100005DAC((uint64_t)v195, __b, 1uLL);
  }

  if (v12)
  {
    unint64_t v86 = 0LL;
    unint64_t v87 = 0LL;
    unint64_t v88 = ~v6;
    do
    {
      if (v87 <= 0x13)
      {
        if (v86 > v88) {
          goto LABEL_108;
        }
        uint64_t v89 = *(void *)(v6 + v86);
        memset(__str, 170, 0x400uLL);
        snprintf( __str,  0x400uLL,  "    - [ %10zu, %5.1f, %s ]\n",  *(void *)(v89 + 24),  (double)*(unint64_t *)(v89 + 24) / (double)v10 * 100.0,  (const char *)(v89 + 32));
        sub_100007484();
      }

      if (v87 >> 60 || v86 > v88) {
        goto LABEL_108;
      }
      free(*(void **)(v6 + v86));
      ++v87;
      v86 += 8LL;
    }

    while (v12 != v87);
  }

  sub_100007484();
  dword_10002C348 = sub_100006154( dword_10002C348,  "logdata.statistics.0.txt",  "logdata.statistics.1.txt",  0x100000LL);
  os_unfair_lock_unlock(&stru_10002DF90);
  free((void *)v6);
}

uint64_t sub_10000720C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a2 + 132);
  os_unfair_lock_lock_with_options(a2 + 132, 0x10000LL);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (void *)sub_10000628C(a2, *(unsigned __int8 *)(a1 + 40));
  sub_100006430(v5, (const void *)(a2 + 138), v6);
  *(void *)sub_10000628C(a2, *(unsigned __int8 *)(a1 + 40)) = 0LL;
  os_unfair_lock_unlock(v4);
  return 1LL;
}

uint64_t sub_10000728C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)a2 + 24LL);
  unint64_t v3 = *(void *)(*(void *)a1 + 24LL);
  BOOL v4 = v2 > v3;
  if (v2 == v3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 1LL;
  }
  else {
    return v5;
  }
}

uint64_t sub_1000072AC(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (const char *)(a2 + 138);
  if (!strcmp((const char *)(*(void *)(a1 + 32) + 32LL), (const char *)(a2 + 138)))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Super Quarantined %s, dropping clients logs.", v4);
      sub_10000B70C((uint64_t)__b);
      *(_BYTE *)(a2 + 128) = 1;
    }

    else
    {
      sub_100003660(*(void *)(a2 + 64));
    }
  }

  return 1LL;
}

void sub_100007370()
{
  dword_10002C348 = sub_100006154( dword_10002C348,  "logdata.statistics.0.txt",  "logdata.statistics.1.txt",  0x100000LL);
  os_unfair_lock_unlock(&stru_10002DF90);
}

void sub_1000073D4()
{
  dword_10002C34C = sub_100006154( dword_10002C34C,  "logdata.statistics.0.jsonl",  "logdata.statistics.1.jsonl",  5242880LL);
  os_unfair_lock_unlock(&stru_10002DF90);
}

uint64_t sub_100007444()
{
  uint64_t result = dword_10002C34C;
  if ((dword_10002C34C & 0x80000000) == 0)
  {
    uint64_t result = _os_trace_write();
    if (result == -1)
    {
      uid_t v1 = __error();
      return _os_assumes_log(*v1);
    }
  }

  return result;
}

uint64_t sub_100007484()
{
  uint64_t result = dword_10002C348;
  if ((dword_10002C348 & 0x80000000) == 0)
  {
    uint64_t result = _os_trace_write();
    if (result == -1)
    {
      uid_t v1 = __error();
      return _os_assumes_log(*v1);
    }
  }

  return result;
}

uint64_t sub_1000074C4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (os_unfair_lock_s *)(a2 + 132);
  os_unfair_lock_lock_with_options(a2 + 132, 0x10000LL);
  *(void *)sub_10000628C(a2, *(unsigned __int8 *)(*(void *)(a1 + 32) + 1240LL)) = 0LL;
  os_unfair_lock_unlock(v4);
  return 1LL;
}

void sub_10000751C(id a1)
{
}

void sub_10000752C(id a1)
{
  qword_10003A7E0 = (uint64_t)dispatch_queue_create("com.apple.logd.time-change", 0LL);
}

uint64_t sub_100007554(uint64_t result)
{
  unint64_t v1 = *(unsigned __int8 *)(result + 2);
  if (!*(_BYTE *)(result + 2) || !*(_BYTE *)(result + 3)) {
    return 0LL;
  }
  uint64_t v2 = result + 4;
  unint64_t v3 = (v1 - 1);
  unint64_t v4 = ~(result + 4);
  if (v3 > v4) {
    goto LABEL_11;
  }
  if (*(_BYTE *)(v2 + v3)) {
    return 0LL;
  }
  if (v4 < v1 || (uint64_t v5 = v2 + v1, v6 = *(unsigned __int8 *)(result + 3) - 1, __CFADD__(v5, v6)))
  {
LABEL_11:
    __break(0x5513u);
  }

  else if (*(_BYTE *)(v5 + v6))
  {
    return 0LL;
  }

  return result;
}

void sub_1000075B4(uint64_t a1)
{
  uint64_t v2 = &qword_10003A7A8;
  do
    uint64_t v2 = (uint64_t *)*v2;
  while (v2 && ((*(uint64_t (**)(uint64_t, uint64_t *))(a1 + 16))(a1, v2) & 1) != 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A7A0);
}

void sub_10000760C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, _WORD *a6)
{
  unsigned int v11 = *(unsigned __int8 *)(a3 + 136);
  switch(*((_WORD *)a2 + 1) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      unsigned int v11 = 4;
      break;
    case 8:
      break;
    case 0xA:
      unsigned int v11 = 20;
      break;
    case 0xC:
      unsigned int v11 = 6;
      break;
    default:
      unsigned int v11 = 0;
      break;
  }

  unint64_t v12 = (unsigned __int16)*a6;
  unint64_t v13 = v12 + v11;
  unint64_t v14 = *((void *)a2 + 2);
  if (v13 > HIWORD(v14))
  {
    *a6 = HIWORD(v14);
    goto LABEL_68;
  }

  *a6 = v13;
  unint64_t v15 = ~(unint64_t)(a2 + 24);
  if (v15 < v12) {
    goto LABEL_74;
  }
  if (!v11)
  {
LABEL_68:
    memset(&__b[2], 170, 0x3E0uLL);
    strcpy((char *)__b, "#DECODE failed to read location");
    goto LABEL_69;
  }

  __uint64_t v16 = &a2[v12 + 24];
  if (v11 == 6)
  {
    double v17 = 0LL;
    uint64_t v18 = *((unsigned __int16 *)v16 + 2);
  }

  else
  {
    uint64_t v18 = 0LL;
    if (v11 == 4) {
      double v17 = 0LL;
    }
    else {
      double v17 = (uint64_t *)(v16 + 4);
    }
  }

  uint64_t v19 = *(unsigned int *)v16;
  __int16 v20 = *((_WORD *)a2 + 1);
  if ((v20 & 0x20) != 0)
  {
    unint64_t v21 = *((void *)a2 + 2);
    if ((unint64_t)(unsigned __int16)v13 + 2 > HIWORD(v21))
    {
      *a6 = HIWORD(v21);
      return;
    }

    *a6 = v13 + 2;
    if ((unsigned __int16)v13 <= v15)
    {
      __int16 v20 = *((_WORD *)a2 + 1);
      goto LABEL_18;
    }

LABEL_74:
    __break(0x5513u);
  }

          sub_10001C834(v7, (*((void *)v15 + 2) & 0xFFFFFFFFFFFFLL) + *(void *)(a2 + 40));
        }
      }

    case 0x6002:
    case 0x6003:
    case 0x6004:
      sub_10001C834(*(void *)(a1 + 40), *(void *)(a2 + 32));
      return 1LL;
    default:
      return 1LL;
  }

LABEL_18:
  if ((v20 & 0xE) == 8)
  {
    unint64_t v24 = v19 | (v18 << 32);
    uint64_t v25 = sub_100008838(a3, v24);
    if (v25)
    {
LABEL_64:
      sub_10001C220(a4, a5, v25);
      os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 132));
      return;
    }

    if (sub_1000035E4(a1, 0LL))
    {
      *(void *)&__b[0] = _NSConcreteStackBlock;
      *((void *)&__b[0] + 1) = 0x40000000LL;
      *(void *)&__b[1] = sub_100007CE4;
      *((void *)&__b[1] + 1) = &unk_100029040;
      *(void *)&__b[2] = a1;
      sub_100003F1C(a1, 0LL, (uint64_t)&stru_100029020, (uint64_t)__b);
LABEL_63:
      uint64_t v25 = sub_100008838(a3, v24);
      if (v25) {
        goto LABEL_64;
      }
      if (!*(_WORD *)(a3 + 130)) {
        return;
      }
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v42 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v42;
      *(_OWORD *)&out[16] = v42;
      LODWORD(values) = -1431655766;
      uuid_unparse((const unsigned __int8 *)(a3 + 32), out);
      sub_1000035E4(a1, &values);
      memset(__b, 170, sizeof(__b));
      snprintf( (char *)__b,  0x400uLL,  "#DECODE failed to resolve UUID: [pc:0x%llx ns:0x%02x type:0x%02x flags:0x%04x main:%s pid:%d]",  v24,  *a2,  a2[1],  *((unsigned __int16 *)a2 + 1),  out,  (_DWORD)values);
LABEL_69:
      sub_10000B70C((uint64_t)__b);
      return;
    }

    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v26 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v26;
    *(_OWORD *)&out[16] = v26;
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    values = 0LL;
    unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v27 = (const __CFData *)OSKextCopyUUIDForAddress(v24 | 0xFFFF000000000000LL);
    uint64_t v28 = v27;
    if (v27)
    {
      BytePtr = CFDataGetBytePtr(v27);
      uuid_unparse(BytePtr, out);
      values = (void *)CFStringCreateWithCString(kCFAllocatorDefault, out, 0x8000100u);
      if (values) {
        CFArrayRef v30 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
      }
      else {
        CFArrayRef v30 = 0LL;
      }
      CFArrayRef v31 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10002C350, 3LL, &kCFTypeArrayCallBacks);
      if (values && v30)
      {
        v32 = (const __CFDictionary *)OSKextCopyLoadedKextInfoByUUID(v30, v31);
        if (v32)
        {
          uint64_t v47 = v32;
          Value = (const __CFDictionary *)CFDictionaryGetValue(v32, values);
          if (Value && (cuint64_t f = Value, v34 = CFDictionaryGetTypeID(), v34 == CFGetTypeID(cf)))
          {
            CFTypeRef v43 = CFDictionaryGetValue(cf, @"OSBundleExecLoadAddress");
            if (v43
              && (CFTypeID v35 = CFNumberGetTypeID(), v35 == CFGetTypeID(v43))
              && CFNumberGetValue((CFNumberRef)v43, kCFNumberSInt64Type, &valuePtr))
            {
              uint64_t v44 = (const __CFNumber *)CFDictionaryGetValue(cf, @"OSBundleExecLoadSize");
              if (v44)
              {
                CFTypeID TypeID = CFNumberGetTypeID();
                if (TypeID == CFGetTypeID(v44))
                {
                  if (CFNumberGetValue(v44, kCFNumberSInt64Type, &v48))
                  {
                    int v37 = (const __CFData *)CFDictionaryGetValue(cf, @"OSBundleTextUUID");
                    if (v37
                      && (size_t v38 = v37, cfa = (CFTypeRef)CFDataGetTypeID(), cfa == (CFTypeRef)CFGetTypeID(v38))
                      && CFDataGetLength(v38) == 16)
                    {
                      *(void *)&__b[1] = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&__b[1] + 1) = 0xAAAAAAAAAAAAAAAALL;
                      *(void *)&__b[0] = v48;
                      HIWORD(__b[0]) = -21846;
                      DWORD2(__b[0]) = valuePtr;
                      WORD6(__b[0]) = WORD2(valuePtr);
                      uint64_t v39 = CFDataGetBytePtr(v38);
                      uuid_copy((unsigned __int8 *)__b + 14, v39);
                      sub_100008578(a3, (uint64_t)__b);
                    }

                    else
                    {
                      memset((char *)&__b[3] + 4, 170, 0x3CCuLL);
                      strcpy((char *)__b, "kext query: failed to retrieve kOSBundleTextUUIDKey");
                      sub_10000B70C((uint64_t)__b);
                    }

                    goto LABEL_54;
                  }
                }
              }

              memset((char *)&__b[2] + 9, 170, 0x3D7uLL);
              uint64_t v40 = "kext query: failed to retrieve load_size";
            }

            else
            {
              memset((char *)&__b[2] + 9, 170, 0x3D7uLL);
              uint64_t v40 = "kext query: failed to retrieve load_addr";
            }

            __int128 v41 = *((_OWORD *)v40 + 1);
            __b[0] = *(_OWORD *)v40;
            __b[1] = v41;
            *(_OWORD *)((char *)&__b[1] + 9) = *(_OWORD *)(v40 + 25);
          }

          else
          {
            memset((char *)&__b[2] + 6, 170, 0x3DAuLL);
            strcpy((char *)__b, "kext query: failed to retrieve bundle");
          }

          sub_10000B70C((uint64_t)__b);
LABEL_54:
          CFRelease(v47);
          goto LABEL_55;
        }

        memset((char *)&__b[1] + 10, 170, 0x3E6uLL);
        strcpy((char *)__b, "kext query: kext_dict nil");
      }

      else
      {
        memset((char *)&__b[1] + 14, 170, 0x3E2uLL);
        strcpy((char *)__b, "kext query: allocation failed");
      }

      sub_10000B70C((uint64_t)__b);
    }

    else
    {
      memset((char *)&__b[2] + 2, 170, 0x3DEuLL);
      strcpy((char *)__b, "kext query: did not find the uuid");
      sub_10000B70C((uint64_t)__b);
      CFArrayRef v31 = 0LL;
      CFArrayRef v30 = 0LL;
    }

  if (!v7
    || (off_t v8 = strtol(v7, 0LL, 10),
        memset(__b, 170, sizeof(__b)),
        snprintf((char *)__b, 0x400uLL, "LOGD_SHUTDOWN_GRACE_CLIENT_COUNT: %d", v8),
        sub_10000B70C((uint64_t)__b),
        (unint64_t v24 = v8) == 0))
  {
    unint64_t v24 = 10;
  }

  unint64_t v9 = 2000000000LL;
  if (v6) {
    unint64_t v9 = 1000000000 * v6;
  }
  uint64_t v25 = v9;
  if (dword_10003A80C)
  {
    uint64_t v19 = 0;
    do
    {
      if (qword_10003A810 != -1) {
        dispatch_once(&qword_10003A810, &stru_100029180);
      }
      __int16 v20 = (dispatch_group_s *)qword_10003A818;
      unint64_t v21 = dispatch_time(0LL, 500000000LL);
      dispatch_group_wait(v20, v21);
      uint64_t v22 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
      __b[0] = 0LL;
      __b[1] = __b;
      __b[2] = 0x2000000000LL;
      uint64_t v23 = 1;
      LOBYTE(__b[3]) = 1;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 0x40000000LL;
      v26[2] = sub_10000A508;
      v26[3] = &unk_1000292A8;
      v26[4] = __b;
      v26[5] = v2;
      v26[6] = v22;
      v26[7] = v1;
      sub_1000075B4((uint64_t)v26);
      if ((v19 & 1) == 0)
      {
        if (v22 - v1 > v25 || dword_10003A80C < v24)
        {
          sub_100003D24();
          if (!v2) {
            goto LABEL_46;
          }
LABEL_45:
          fflush(v2);
          goto LABEL_46;
        }

        uint64_t v23 = 0;
      }

      if (v2) {
        goto LABEL_45;
      }
LABEL_46:
      _Block_object_dispose(__b, 8);
      uint64_t v19 = v23;
    }

    while (dword_10003A80C);
  }

  unint64_t v10 = &qword_10002C398;
  unsigned int v11 = 5LL;
  do
  {
    sub_100011390((uint64_t)v10);
    v10 += 156;
    --v11;
  }

  while (v11);
  sub_100021ACC(qword_10003A798, 0);
  unint64_t v12 = (int *)qword_10003A798;
  unint64_t v13 = *(_DWORD *)(qword_10003A798 + 112);
  if (v13 < 0) {
    goto LABEL_32;
  }
  if (fsync(v13) == -1)
  {
    unint64_t v14 = __error();
    _os_assumes_log(*v14);
  }

  if (close(v12[28]) != -1)
  {
LABEL_32:
    free(v12);
    double v17 = (void **)sub_10000DEDC();
    sub_100020614(v17);
    if (qword_10003A8B0)
    {
      dispatch_source_cancel((dispatch_source_t)qword_10003A8B0);
      dispatch_release((dispatch_object_t)qword_10003A8B0);
      qword_10003A8B0 = 0LL;
    }

    if (v2)
    {
      uint64_t v18 = time(0LL);
      fprintf(v2, "SIGTERM: [%ld] All buffers flushed\n", v18);
      fclose(v2);
    }

    os_release((void *)qword_10003A7D0);
    exit(0);
  }

  unint64_t v15 = *__error();
  uint64_t result = *__error();
  if (v15 != 9)
  {
    _os_assumes_log(result);
    goto LABEL_32;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

  uint64_t v22 = v24;
  uint64_t v23 = v25;
  double v17 = (char *)sandbox_extension_issue_file_to_process("com.apple.logd.read-only", v14, 0LL, &v22);
  if (v17) {
    xpc_dictionary_set_string(v4, "uuidtextdir_sbext", v17);
  }
  free(v17);
  xpc_connection_send_message(a1, v4);
  xpc_release(v4);
}

      fts_close(v4);
    }

    else
    {
      _os_assumes_log(0LL);
    }

    unsigned int v11 = sub_100017B30();
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    sub_100017D48(v12, 1);
  }

LABEL_55:
    if (values) {
      CFRelease(values);
    }
    if (v30) {
      CFRelease(v30);
    }
    if (v31) {
      CFRelease(v31);
    }
    if (v28) {
      CFRelease(v28);
    }
    goto LABEL_63;
  }

  if ((v20 & 0xE) == 0xA)
  {
    uint64_t v22 = *(void *)(a4 + 16);
    if (v22) {
      uint64_t v23 = *(void *)(v22 + 24);
    }
    else {
      uint64_t v23 = 0LL;
    }
    sub_10001ECF8((float *)v22, v17, v23);
  }

      os_unfair_lock_lock_with_options(&unk_10003A7A0, 0x10000LL);
      CFArrayRef v30 = qword_10003A7A8;
      *unint64_t v9 = qword_10003A7A8;
      if (v30) {
        CFArrayRef v31 = (uint64_t *)qword_10003A7A8;
      }
      else {
        CFArrayRef v31 = &qword_10003A7A8;
      }
      v31[1] = (uint64_t)v9;
      qword_10003A7A8 = (uint64_t)v9;
      v9[1] = &qword_10003A7A8;
      if (!pid) {
        goto LABEL_63;
      }
      if (__OFADD__(dword_10003A80C, 1))
      {
LABEL_72:
        __break(0x5500u);
        JUMPOUT(0x10000B1C4LL);
      }

      ++dword_10003A80C;
      if (qword_10003A810 != -1) {
        dispatch_once(&qword_10003A810, &stru_100029180);
      }
      dispatch_group_enter((dispatch_group_t)qword_10003A818);
LABEL_63:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A7A0);
      return;
    case 2uLL:
      *(_DWORD *)__b = -1431655766;
      unint64_t v14 = (uint64_t **)sub_100003638((uint64_t)a2);
      sub_1000035E4((uint64_t)a2, __b);
      os_unfair_lock_lock_with_options(&unk_10003A7A0, 0x10000LL);
      unint64_t v15 = *v14;
      __uint64_t v16 = &qword_10003A7A8;
      if (*v14) {
        __uint64_t v16 = *v14;
      }
      v16[1] = (uint64_t)v14[1];
      *v14[1] = (uint64_t)v15;
      if (!*(_DWORD *)__b) {
        goto LABEL_23;
      }
      double v17 = dword_10003A80C - 1;
      if (__OFSUB__(dword_10003A80C, 1)) {
        goto LABEL_71;
      }
      --dword_10003A80C;
      if (!v17)
      {
        memset((char *)&buffer[2] + 3, 170, 0x3DDuLL);
        strcpy((char *)buffer, "No userlevel firehose clients left");
        sub_10000B70C((uint64_t)buffer);
      }

      if (qword_10003A810 != -1) {
        dispatch_once(&qword_10003A810, &stru_100029180);
      }
      dispatch_group_leave((dispatch_group_t)qword_10003A818);
LABEL_23:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A7A0);
      *(void *)&buffer[0] = _NSConcreteStackBlock;
      *((void *)&buffer[0] + 1) = 0x40000000LL;
      *(void *)&buffer[1] = sub_1000062CC;
      *((void *)&buffer[1] + 1) = &unk_100028E00;
      *(void *)&buffer[2] = v14;
      sub_1000062CC((uint64_t)buffer, 0);
      sub_1000062CC((uint64_t)buffer, 1u);
      sub_1000062CC((uint64_t)buffer, 2u);
      (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 3LL);
      (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 4LL);
      return;
    case 3uLL:
    case 4uLL:
      if (a5.var2.var0 <= 0x1000uLL && a5.var2.var1 <= 0x1000uLL)
      {
        switch(a5.var2.var4)
        {
          case 0u:
          case 1u:
          case 4u:
            if (a3 == 3) {
              goto LABEL_66;
            }
            break;
          case 2u:
            if (a3 == 4) {
LABEL_66:
            }
              sub_10000B544( a2,  (char *)a4,  a5.var0 & 0xFFFFFFFF00000000LL | ((unint64_t)a5.var2.var1 << 16) | a5.var2.var0);
            break;
          case 3u:
            if (a3 == 4) {
              sub_100007D08((uint64_t)a2, a4);
            }
            break;
          default:
            return;
        }
      }

      return;
    case 6uLL:
      uint64_t v18 = sub_100003638((uint64_t)a2);
      if (v18)
      {
        uint64_t v19 = v18;
        __int16 v20 = *(void **)(v18 + 16);
        if (v20)
        {
          do
          {
            unint64_t v21 = (void *)*v20;
            free(v20);
            __int16 v20 = v21;
          }

          while (v21);
        }

        sub_100020614(*(void ***)(v19 + 80));
        free(*(void **)(v19 + 72));
        free((void *)v19);
      }

      return;
    default:
      return;
  }

uint64_t sub_100007CE4(uint64_t a1, const void *a2)
{
  return 1LL;
}

BOOL sub_100007D00(id a1)
{
  return 1;
}

void sub_100007D08(uint64_t a1, const void *a2)
{
  uint64_t v3 = sub_100003638(a1);
  memcpy(__dst, a2, sizeof(__dst));
  unint64_t v4 = &__dst[8];
  uint64_t v5 = (char *)&__dst[8];
  if (__dst[0] <= 0x1000uLL)
  {
    if (__CFADD__(__dst, __dst[0])) {
      goto LABEL_136;
    }
    uint64_t v5 = (char *)__dst + __dst[0];
  }

  lock = (os_unfair_lock_s *)(v3 + 132);
  unint64_t v6 = 16LL;
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  while (1)
  {
    off_t v8 = (char *)(v4 + 12);
    if (v4 + 12 >= (_WORD *)v5) {
      break;
    }
    unint64_t v9 = v6;
    if (v6 - 4073 < 0xFFFFFFFFFFFFF007LL) {
      goto LABEL_135;
    }
    uint64_t v10 = (uint64_t)v4;
    unint64_t v11 = *((void *)v4 + 2);
    unint64_t v12 = HIWORD(v11);
    uint64_t v14 = v12 + 24;
    if ((v11 & 0x7000000000000LL) != 0) {
      uint64_t v14 = (HIWORD(v11) & 0xFFF8) + 32LL;
    }
    if (__CFADD__(v4, v14)) {
      goto LABEL_136;
    }
    if (v6 > 0xFF8) {
      goto LABEL_135;
    }
    v6 += v14;
    unint64_t v4 = (_WORD *)((char *)v4 + v14);
    unint64_t v15 = *(void *)v10;
    if (*(void *)v10)
    {
      v70[0] = v7;
      v70[1] = v7;
      __int16 v69 = 0;
      int v68 = -1431655766;
      if (v15 == 5LL)
      {
        if ((v15 & 0x10000) != 0)
        {
          if (v11 >> 51)
          {
            __int16 v69 = 8;
            unint64_t v16 = 8LL;
            if ((v15 & 0x100000) != 0) {
              goto LABEL_23;
            }
          }

          else
          {
            __int16 v69 = HIWORD(v11);
            unint64_t v16 = HIWORD(v11);
            if ((v15 & 0x100000) != 0)
            {
LABEL_23:
              if (v16 + 8 > v12)
              {
                __int16 v69 = HIWORD(v11);
                unint64_t v16 = HIWORD(v11);
              }

              else
              {
                __int16 v69 = v16 + 8;
                if (__CFADD__(v8, v16)) {
                  goto LABEL_136;
                }
                unint64_t v16 = (unsigned __int16)(v16 + 8);
              }
            }
          }
        }

        else
        {
          unint64_t v16 = 0LL;
          if ((v15 & 0x100000) != 0) {
            goto LABEL_23;
          }
        }

        int v17 = BYTE1(v15) - 1;
        unint64_t v18 = v9 + 24;
        unint64_t v19 = HIDWORD(v15);
        switch(v17)
        {
          case 0:
            if ((v19 - 1) < 2)
            {
              __int16 v20 = (unsigned __int8 *)sub_1000084D4(v10, &v69);
              *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (!v20) {
                continue;
              }
              unint64_t v21 = v20;
              if (*(_DWORD *)(v10 + 4) == 1)
              {
                uuid_copy((unsigned __int8 *)v70 + 14, v20);
                uint64_t v22 = *((void *)v21 + 2);
                uint64_t v23 = *((void *)v21 + 3);
                DWORD2(v70[0]) = v22;
                WORD6(v70[0]) = WORD2(v22);
                *(void *)&v70[0] = v23;
                sub_100008578(v3, (uint64_t)v70);
              }

              else
              {
                sub_10000872C(v3, (uint64_t *)v20);
              }

              CFArrayRef v30 = (const char *)(v21 + 32);
              uint64_t v29 = v21;
              int v31 = 1;
              goto LABEL_81;
            }

            if ((_DWORD)v19 != 3 || v16 + 32 > v12) {
              continue;
            }
            __int16 v69 = v16 + 32;
            if (__CFADD__(v8, v16)) {
              goto LABEL_136;
            }
            os_unfair_lock_lock_with_options(lock, 0x10000LL);
            uint64_t v40 = *(uint64_t **)(v3 + 80);
            if (v40)
            {
              int8x8_t v41 = (int8x8_t)v40[1];
              if (v41)
              {
                uint64_t v42 = *(void *)&v8[v16];
                uint64_t v43 = *(void *)&v8[v16 + 8];
                uint64_t v44 = __ROR8__(v43 + 16, 16);
                unint64_t v45 = 0x9DDFEA08EB382D69LL
                    * (v44 ^ ((0x9DDFEA08EB382D69LL * (v42 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v42 ^ v44)));
                unint64_t v46 = (0x9DDFEA08EB382D69LL * (v45 ^ (v45 >> 47))) ^ v43;
                uint8x8_t v47 = (uint8x8_t)vcnt_s8(v41);
                v47.i16[0] = vaddlv_u8(v47);
                if (v47.u32[0] > 1uLL)
                {
                  unint64_t v48 = v46;
                  if (v46 >= *(void *)&v41) {
                    unint64_t v48 = v46 % *(void *)&v41;
                  }
                }

                else
                {
                  unint64_t v48 = v46 & (*(void *)&v41 - 1LL);
                }

                uint64_t v54 = *v40;
                uint64_t v55 = *(uint64_t ***)(*v40 + 8 * v48);
                if (v55)
                {
                  uint64_t v56 = *v55;
                  if (*v55)
                  {
                    uint64_t v57 = *(void *)&v41 - 1LL;
                    do
                    {
                      unint64_t v58 = v56[1];
                      if (v58 == v46)
                      {
                        if (v56[2] == v42 && v56[3] == v43)
                        {
                          if (v47.u32[0] > 1uLL)
                          {
                            if (v46 >= *(void *)&v41) {
                              v46 %= *(void *)&v41;
                            }
                          }

                          else
                          {
                            v46 &= v57;
                          }

                          uint64_t v60 = *(uint64_t **)(v54 + 8 * v46);
                          do
                          {
                            uint64_t v61 = v60;
                            uint64_t v60 = (uint64_t *)*v60;
                          }

                          while (v60 != v56);
                          if (v61 == v40 + 2) {
                            goto LABEL_120;
                          }
                          unint64_t v62 = v61[1];
                          if (v47.u32[0] > 1uLL)
                          {
                            if (v62 >= *(void *)&v41) {
                              v62 %= *(void *)&v41;
                            }
                          }

                          else
                          {
                            v62 &= v57;
                          }

                          if (v62 != v46)
                          {
LABEL_120:
                            if (!*v56) {
                              goto LABEL_121;
                            }
                            unint64_t v63 = *(void *)(*v56 + 8);
                            if (v47.u32[0] > 1uLL)
                            {
                              if (v63 >= *(void *)&v41) {
                                v63 %= *(void *)&v41;
                              }
                            }

                            else
                            {
                              v63 &= v57;
                            }

                            if (v63 != v46) {
LABEL_121:
                            }
                              *(void *)(v54 + 8 * v46) = 0LL;
                          }

                          uint64_t v64 = *v56;
                          if (*v56)
                          {
                            unint64_t v65 = *(void *)(v64 + 8);
                            if (v47.u32[0] > 1uLL)
                            {
                              if (v65 >= *(void *)&v41) {
                                v65 %= *(void *)&v41;
                              }
                            }

                            else
                            {
                              v65 &= v57;
                            }

                            if (v65 != v46)
                            {
                              *(void *)(*v40 + 8 * v65) = v61;
                              uint64_t v64 = *v56;
                            }
                          }

                          *uint64_t v61 = v64;
                          *uint64_t v56 = 0LL;
                          --v40[3];
                          operator delete(v56);
                          break;
                        }
                      }

                      else
                      {
                        if (v47.u32[0] > 1uLL)
                        {
                          if (v58 >= *(void *)&v41) {
                            v58 %= *(void *)&v41;
                          }
                        }

                        else
                        {
                          v58 &= v57;
                        }

                        if (v58 != v48) {
                          break;
                        }
                      }

                      uint64_t v56 = (uint64_t *)*v56;
                    }

                    while (v56);
                  }
                }
              }
            }

LABEL_136:
              __break(0x5513u);
            }

            if ((_DWORD)v19 == 1)
            {
              uuid_copy((unsigned __int8 *)v70 + 14, (const unsigned __int8 *)&v8[v16]);
              if (v26 - 4073 < 0xFFFFFFFFFFFFF007LL
                || (uint64_t v28 = *((void *)v27 + 2),
                    DWORD2(v70[0]) = v28,
                    WORD6(v70[0]) = WORD2(v28),
                    v26 - 4065 < 0xFFFFFFFFFFFFF007LL))
              {
LABEL_135:
                __break(1u);
                goto LABEL_136;
              }

              *(void *)&v70[0] = *((void *)v27 + 3);
              sub_100008578(v3, (uint64_t)v70);
              if (qword_10003A9A8 != -1) {
                dispatch_once(&qword_10003A9A8, &stru_10002A568);
              }
              *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (!byte_10002DF3C)
              {
                uint64_t v29 = (unsigned __int8 *)&v8[v16];
                CFArrayRef v30 = 0LL;
                int v31 = 2;
LABEL_81:
                sub_10000E15C(v29, v30, 0LL, v31);
LABEL_82:
                *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              }
            }

            break;
          case 3:
            sub_1000035E4(a1, &v68);
            *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (v68) {
              continue;
            }
            v32 = (const unsigned __int8 *)sub_1000084D4(v10, &v69);
            *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (!v32) {
              continue;
            }
            unint64_t v33 = (unsigned __int8 *)v32;
            uuid_copy((unsigned __int8 *)v70 + 14, v32);
            uint64_t v34 = *((void *)v33 + 2);
            uint64_t v35 = *((void *)v33 + 3);
            DWORD2(v70[0]) = v34;
            WORD6(v70[0]) = WORD2(v34);
            *(void *)&v70[0] = v35;
            sub_100008578(v3, (uint64_t)v70);
            int v36 = *(_DWORD *)(v10 + 4);
            if (v36 == 8)
            {
              CFArrayRef v30 = (const char *)(v33 + 32);
              uint64_t v29 = v33;
              int v31 = 8;
            }

            else
            {
              *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (v36 != 16) {
                continue;
              }
              CFArrayRef v30 = (const char *)(v33 + 32);
              uint64_t v29 = v33;
              int v31 = 4;
            }

            goto LABEL_81;
          case 4:
            if ((_DWORD)v19 != 1 || v16 + 32 > v12) {
              continue;
            }
            __int16 v69 = v16 + 32;
            if (__CFADD__(v8, v16)) {
              goto LABEL_136;
            }
            unint64_t v37 = v18 + v16;
            size_t v38 = &v8[v16];
            uuid_copy((unsigned __int8 *)v70 + 14, (const unsigned __int8 *)&v8[v16]);
            if (v37 - 4073 < 0xFFFFFFFFFFFFF007LL) {
              goto LABEL_135;
            }
            uint64_t v39 = *((void *)v38 + 2);
            DWORD2(v70[0]) = v39;
            WORD6(v70[0]) = WORD2(v39);
            if (v37 - 4065 < 0xFFFFFFFFFFFFF007LL) {
              goto LABEL_135;
            }
            *(void *)&v70[0] = *((void *)v38 + 3);
            sub_100008578(v3, (uint64_t)v70);
            uint64_t v29 = (unsigned __int8 *)&v8[v16];
            CFArrayRef v30 = 0LL;
            int v31 = 1024;
            goto LABEL_81;
          default:
            continue;
        }
      }
    }
  }

uint64_t sub_1000084D4(uint64_t result, _WORD *a2)
{
  unint64_t v3 = (unsigned __int16)*a2;
  __int16 v4 = v3 + 32;
  unint64_t v5 = *(void *)(result + 16);
  if (v3 + 32 > HIWORD(v5))
  {
    uint64_t result = 0LL;
    unint64_t v14 = HIWORD(v5);
LABEL_7:
    *a2 = v14;
    return result;
  }

  *a2 = v4;
  uint64_t v6 = result + 24;
  unint64_t v7 = ~(result + 24);
  if (v7 >= v3 && (unsigned __int16)(v3 + 32) <= v7)
  {
    uint64_t v8 = v6 + v3;
    unint64_t v9 = (const char *)(v6 + (unsigned __int16)(v3 + 32));
    unint64_t v10 = *(void *)(result + 16);
    unint64_t v11 = HIWORD(v10);
    unsigned __int16 v12 = HIWORD(v10) - v4;
    size_t v13 = strnlen(v9, (unsigned __int16)(HIWORD(v10) - v4));
    LOWORD(v14) = v4 + v13;
    if (v13 == v12)
    {
      LOWORD(v14) = v11;
      uint64_t result = 0LL;
    }

    else
    {
      uint64_t result = v8;
    }

    goto LABEL_7;
  }

  __break(0x5513u);
  return result;
}

void sub_100008578(uint64_t a1, uint64_t a2)
{
  __int16 v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000LL);
  unint64_t v5 = *(unsigned __int16 *)(a1 + 130);
  if (v5 <= 0x3FF)
  {
    if (*(_WORD *)(a1 + 130))
    {
      unint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      uint64_t v8 = *(void *)(a1 + 72);
      unint64_t v9 = (void *)(a2 + 14);
      while (1)
      {
        if (v6 > ~v8) {
          goto LABEL_18;
        }
        if (*(void *)(v8 + v6 + 14) == *v9)
        {
          if (*(void *)(v8 + v6 + 22) == *(void *)(a2 + 22)) {
            break;
          }
        }

        ++v7;
        v6 += 32LL;
        if (v5 == v7) {
          goto LABEL_10;
        }
      }

      __int128 v13 = *(_OWORD *)(a2 + 16);
      unint64_t v14 = (_OWORD *)(v8 + 32 * v7);
      *unint64_t v14 = *(_OWORD *)a2;
      v14[1] = v13;
    }

    else
    {
LABEL_10:
      if (v5 >= (((_WORD)v5 + 3) & 0xFFFCu))
      {
        uint64_t v10 = _os_trace_realloc(*(void *)(a1 + 72), 32LL * (unsigned __int16)(((v5 + 3) & 0xFFFC) + 4));
        *(void *)(a1 + 72) = v10;
        LODWORD(v5) = *(unsigned __int16 *)(a1 + 130);
      }

      else
      {
        uint64_t v10 = *(void *)(a1 + 72);
      }

      *(_WORD *)(a1 + 13sub_100021ACC(qword_10003A798, 0) = v5 + 1;
      if (__CFADD__(v10, 32LL * v5)) {
LABEL_18:
      }
        __break(0x5513u);
      unint64_t v11 = (_OWORD *)(v10 + 32LL * v5);
      __int128 v12 = *(_OWORD *)(a2 + 16);
      *unint64_t v11 = *(_OWORD *)a2;
      v11[1] = v12;
      if (*(_WORD *)(a1 + 130) == 1024)
      {
        int v15 = -1431655766;
        sub_1000035E4(*(void *)(a1 + 64), &v15);
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "%s (%d) reached %d dylibs", (const char *)(a1 + 138), v15, 1024);
        sub_10000B70C((uint64_t)__b);
      }
    }
  }

  os_unfair_lock_unlock(v4);
}

void sub_10000872C(uint64_t a1, uint64_t *a2)
{
  __int16 v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000LL);
  unint64_t v5 = *(_OWORD **)(a1 + 80);
  if (!v5)
  {
    unint64_t v5 = operator new(0x28uLL);
    *unint64_t v5 = 0u;
    v5[1] = 0u;
    *((_DWORD *)v5 + 8) = 1065353216;
    *(void *)(a1 + 8sub_100021ACC(qword_10003A798, 0) = v5;
  }

  sub_100020664((uint64_t)v5, a2);
  os_unfair_lock_unlock(v4);
}

void sub_100008794(uint64_t a1, unsigned __int8 *a2)
{
  unint64_t v4 = a2[2] + (unint64_t)a2[3];
  unint64_t v5 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000LL);
  unint64_t v6 = (uint64_t *)(a1 + 16);
  uint64_t v7 = (uint64_t **)(a1 + 16);
  while (1)
  {
    uint64_t v7 = (uint64_t **)*v7;
    if (!v7) {
      break;
    }
  }

  uint64_t v8 = (uint64_t *)_os_trace_malloc(v4 + 16);
  memcpy(v8 + 1, a2, v4 + 4);
  uint64_t v9 = *v6;
  *uint64_t v8 = *v6;
  if (!v9) {
    *(void *)(a1 + 24) = v8;
  }
  *unint64_t v6 = (uint64_t)v8;
LABEL_8:
  os_unfair_lock_unlock(v5);
}

uint64_t sub_100008838(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000LL);
  if (*(_WORD *)(a1 + 130))
  {
    unint64_t v5 = 0LL;
    uint64_t result = 0LL;
    uint64_t v7 = *(void *)(a1 + 72);
    unint64_t v8 = -1LL;
    do
    {
      if (v5 > ~v7)
      {
        __break(0x5513u);
        return result;
      }

      uint64_t v9 = (unint64_t *)(v7 + v5);
      unint64_t v10 = *(unsigned int *)(v7 + v5 + 8) | ((unint64_t)*(unsigned __int16 *)(v7 + v5 + 12) << 32);
      if (v10 <= a2 && *v9 + v10 > a2 && *v9 < v8)
      {
        uint64_t result = v7 + v5;
        unint64_t v8 = *v9;
      }

      v5 += 32LL;
    }

    while (32LL * *(unsigned __int16 *)(a1 + 130) != v5);
    if (result) {
      return result;
    }
  }

  os_unfair_lock_unlock(v4);
  return 0LL;
}

void sub_1000088F4(_xpc_connection_s *a1, xpc_object_t xdict)
{
  if (qword_10003A7C8 != -1) {
    dispatch_once(&qword_10003A7C8, &stru_100028F00);
  }
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "logd_snapshot_flags");
  int v5 = xpc_dictionary_dup_fd(xdict, "snapshot_file_descriptor");
  if (v5 < 0)
  {
    sub_10000BC48(a1, xdict, 22);
  }

  else
  {
    int v6 = v5;
    memset(&v57[0].tm_wday, 170, 0x400uLL);
    pid_t pid = xpc_connection_get_pid(a1);
    if (proc_pidpath(pid, &v57[0].tm_wday, 0x400u) <= 0) {
      strcpy((char *)&v57[0].tm_wday, "<unknown>");
    }
    time_t v8 = time(0LL);
    memset(v63, 170, sizeof(v63));
    *(void *)&v57[0].tm_mon = 0xAA00000000000000LL;
    *(void *)&v57[0].tm_sec = v63;
    *(void *)&v57[0].int tm_hour = 0x40000000000LL;
    sub_100005E78(v57, "--- !logd snapshot record\n", v9, v10, v11, v12, v13, v14, v52);
    sub_100005E78(v57, "client : %s\n", v15, v16, v17, v18, v19, v20, (char)&v57[0].tm_wday);
    sub_100005E78(v57, "time   : ", v21, v22, v23, v24, v25, v26, v53);
    sub_100006000(v57, v8);
    LOBYTE(__src[0]) = 10;
    if ((v57[0].tm_year & 2) == 0)
    {
      char v33 = BYTE2(v57[0].tm_year);
      int tm_hour = v57[0].tm_hour;
      if (SBYTE2(v57[0].tm_year) + v57[0].tm_mday - 1 == v57[0].tm_hour)
      {
        sub_100005DAC((uint64_t)v57, __src, 1uLL);
      }

      else
      {
        uint64_t v35 = *(void *)&v57[0].tm_sec;
        unint64_t v36 = ~*(void *)&v57[0].tm_sec;
        *(_BYTE *)(*(void *)&v57[0].tm_sec + v57[0].tm_hour) = 10;
        uint64_t v37 = (tm_hour + 1);
        v57[0].int tm_hour = v37;
        if (!v33)
        {
          *(_BYTE *)(v35 + v37) = 0;
        }
      }
    }

    char v38 = uint64 & 1;
    sub_100005E78(v57, "flags  : 0x%llx\n\n", v27, v28, v29, v30, v31, v32, uint64);
    sub_100007370();
    if ((v57[0].tm_year & 1) != 0) {
      free(*(void **)&v57[0].tm_sec);
    }
    int v39 = (uint64 >> 1) & 1;
    uint64_t v40 = objc_autoreleasePoolPush();
    __src[0] = @"logd snapshot";
    v64[0] = @"record";
    v64[1] = @"client";
    int8x8_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &v57[0].tm_wday));
    __src[1] = v41;
    v64[2] = @"unixTime";
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v8));
    __src[2] = v42;
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  __src,  v64,  3LL));

    size_t v44 = sub_10000F9A4(v63, 0x400uLL, v43);
    objc_autoreleasePoolPop(v40);
    if (v44) {
      sub_1000073D4();
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003A7C0, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_queue_t v45 = dispatch_queue_create("com.apple.logd.snapshot", 0LL);
    dispatch_queue_t v46 = dispatch_queue_create("com.apple.logd.snapshot.book", 0LL);
    uint8x8_t v47 = dispatch_group_create();
    bzero(&v57[0].tm_gmtoff, 0x4D0uLL);
    dword_10002DE84 = v6;
    qword_10002DE50 = (uint64_t)v46;
    *(void *)&v57[0].tm_wday = v45;
    *(void *)&v57[0].tm_isdst = &off_10002DE40;
    char v62 = 5;
    sub_100011150((uint64_t)&v57[0].tm_wday, 0x20000);
    dispatch_group_enter(v47);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 0x40000000LL;
    v54[2] = sub_100008DF4;
    v54[3] = &unk_100028F60;
    char v55 = v39;
    v54[4] = v47;
    v54[5] = &v57[0].tm_wday;
    char v56 = v38;
    v54[6] = v45;
    sub_100003FCC(v54);
    dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
    sub_100011390((uint64_t)&v57[0].tm_wday);
    if (v61 >= 1)
    {
      uint64_t v48 = 0LL;
      uint64_t v49 = 272LL;
      while (!__CFADD__(v60, v49 - 272))
      {
        uint64_t v50 = (void **)((char *)v60 + v49);
        sub_10001CBE0(*(void *)((char *)v60 + v49 - 48));
        free(*v50);
        ++v48;
        v49 += 280LL;
        if (v48 >= v61) {
          goto LABEL_20;
        }
      }

LABEL_20:
    free(v60);
    mach_vm_deallocate(mach_task_self_, address, size);
    for (uint64_t i = 0LL; i != 1056; i += 264LL)
    {
      sub_10001F8C8(*(void ***)((char *)&v57[5].tm_mon + i), (uint64_t (*)(void))&_os_release);
      sub_10001F8C8(*(void ***)((char *)&v57[5].tm_wday + i), (uint64_t (*)(void))sub_1000109F0);
    }

    sub_100012C38((uint64_t)&off_10002DE40);
    qword_10002DE50 = 0LL;
    dispatch_release(v47);
    dispatch_release(v45);
    dispatch_release(v46);
    sub_10000BC48(a1, xdict, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_10003A7C0);
  }

      reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        uint64_t v11 = reply;
        xpc_connection_send_message(a1, reply);
        xpc_release(v11);
      }

      return;
    default:
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Received oversize message with invalid stream id: %d (%d)");
      goto LABEL_19;
  }

  if (__CFADD__(*v17, v21))
  {
LABEL_29:
    __break(0x5513u);
LABEL_30:
    __break(0x5512u);
    return result;
  }

  uint64_t v26 = v6 - v5;
  bzero((void *)(*v17 + v21), v26);
  *uint64_t v20 = vadd_s32(*v20, (int32x2_t)(v26 | 0x100000000LL));
  uint64_t v28 = *(void *)(a1 + 64);
  uint64_t v27 = *(unsigned __int8 **)(a1 + 72);
  uint64_t v29 = v8 + 264LL * v9;
  uint64_t v31 = *(void **)(v29 + 232);
  uint64_t v30 = (void **)(v29 + 232);
  uint64_t result = (uint64_t)sub_10001F730(v31, *(void *)(v28 + 32), *(_DWORD *)(v28 + 28));
  uint64_t v32 = result;
  if (result)
  {
    if (!v27) {
      return result;
    }
  }

  else
  {
    uint64_t v32 = _os_trace_malloc(88LL);
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v28;
    char v33 = *(_OWORD *)(v28 + 64);
    uint64_t v35 = *(_OWORD *)(v28 + 16);
    uint64_t v34 = *(_OWORD *)(v28 + 32);
    *(_OWORD *)(v32 + 48) = *(_OWORD *)(v28 + 48);
    *(_OWORD *)(v32 + 64) = v33;
    *(_OWORD *)(v32 + 16) = v35;
    *(_OWORD *)(v32 + 32) = v34;
    unint64_t v36 = _os_trace_calloc(1LL, 24LL);
    *(void *)unint64_t v36 = 16LL;
    *(_BYTE *)(v36 + 8) = 1;
    *(void *)(v36 + 16) = _os_trace_calloc(16LL, 8LL);
    *(void *)(v32 + 8sub_100021ACC(qword_10003A798, 0) = v36;
    uint64_t result = sub_10001F2CC(v30, *(void *)(v28 + 32), *(_DWORD *)(v28 + 28), v32);
    if (!v27) {
      return result;
    }
  }

  uint64_t result = sub_100020C34(*(void *)(v32 + 80), (uint64_t)v27);
  if (!result)
  {
    uint64_t v37 = v27[2] + (unint64_t)v27[3] + 4;
    char v38 = (void *)_os_trace_malloc(v37);
    memcpy(v38, v27, v37);
    return sub_100020D28(*(unsigned int **)(v32 + 80), v38, (uint64_t)v38);
  }

  return result;
}

void sub_100008DF4(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5)
{
  switch(a3)
  {
    case 1LL:
      if (*(_BYTE *)(a1 + 56))
      {
        uint64_t v9 = *(dispatch_group_s **)(a1 + 32);
        time_t v8 = *(dispatch_queue_s ***)(a1 + 40);
        sub_100011F0C((uint64_t)&qword_10002C398, v9, v8);
        if ((unint64_t)&qword_10002C398 >= 0xFFFFFFFFFFFFFB20LL
          || (sub_100011F0C((uint64_t)&qword_10002C878, v9, v8),
              (unint64_t)&qword_10002C398 >= 0xFFFFFFFFFFFFF640LL)
          || (sub_100011F0C((uint64_t)&qword_10002CD58, v9, v8),
              (unint64_t)&qword_10002C398 >= 0xFFFFFFFFFFFFF160LL))
        {
          __break(0x5513u);
        }

        else
        {
          sub_100011F0C((uint64_t)&qword_10002D238, v9, v8);
        }
      }

      break;
    case 2LL:
      if (*(_BYTE *)(a1 + 57)) {
        sub_100011F0C((uint64_t)&unk_10002D718, *(dispatch_group_s **)(a1 + 32), *(dispatch_queue_s ***)(a1 + 40));
      }
      break;
    case 3LL:
    case 4LL:
      if ((unsigned __int16)a5 <= 0x1000uLL && (a5 & 0xFFFF0000) <= 0x10000000uLL)
      {
        switch(BYTE6(a5))
        {
          case 0:
          case 1:
          case 4:
            if (*(_BYTE *)(a1 + 56))
            {
              v15[0] = _NSConcreteStackBlock;
              v15[1] = 0x40000000LL;
              v15[2] = sub_100009154;
              v15[3] = &unk_100028F40;
              int v6 = *(dispatch_queue_s **)(a1 + 48);
              v15[4] = *(void *)(a1 + 40);
              v15[5] = a4;
              v15[6] = a5;
              v15[7] = a2;
              uint64_t v7 = v15;
              goto LABEL_18;
            }

            break;
          case 2:
            if (*(_BYTE *)(a1 + 57))
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000LL;
              block[2] = sub_100009144;
              block[3] = &unk_100028F20;
              int v6 = *(dispatch_queue_s **)(a1 + 48);
              block[4] = *(void *)(a1 + 40);
              void block[5] = a4;
              int v17 = a5;
              __int16 v18 = WORD2(a5);
              char v19 = 2;
              char v20 = HIBYTE(a5);
              uint64_t v21 = a2;
              uint64_t v7 = block;
LABEL_18:
              dispatch_sync(v6, v7);
            }

            break;
          case 3:
            sub_100007D08(a2, a4);
            break;
          default:
            return;
        }
      }

      break;
    case 5LL:
      uint64_t v10 = *(dispatch_group_s **)(a1 + 32);
      dispatch_block_t v11 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS,  QOS_CLASS_USER_INITIATED,  0,  &stru_1000295B0);
      dispatch_group_async(v10, (dispatch_queue_t)qword_10003A8D8, v11);
      _Block_release(v11);
      uint64_t v12 = (dispatch_queue_s *)qword_10003A8F8;
      uint64_t v13 = (dispatch_group_s *)*(id *)(a1 + 32);
      dispatch_block_t v14 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS,  QOS_CLASS_USER_INITIATED,  0,  &stru_100029AD8);
      dispatch_group_async(v13, v12, v14);

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      break;
    default:
      return;
  }

uint64_t sub_100009144(uint64_t a1)
{
  return sub_1000114D4(*(dispatch_queue_t **)(a1 + 32), *(char **)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56));
}

uint64_t sub_100009154(uint64_t a1)
{
  return sub_1000114D4(*(dispatch_queue_t **)(a1 + 32), *(char **)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56));
}

void sub_100009164(id a1)
{
  qword_10003A7C0 = (uint64_t)dispatch_semaphore_create(1LL);
}

xpc_type_t sub_100009184(xpc_object_t message, int a2)
{
  if (qword_10003A7F0 != -1) {
    dispatch_once(&qword_10003A7F0, &stru_100029080);
  }
  unint64_t v4 = (_xpc_connection_s *)qword_10003A7E8;
  while (1)
  {
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, message);
    int v6 = v5;
    if (__OFSUB__(a2, 1)) {
      __break(0x5515u);
    }
    if (a2-- <= 0)
    {
      time_t v8 = &_xpc_error_connection_interrupted;
      goto LABEL_10;
    }
  }

  time_t v8 = v5;
LABEL_10:
  xpc_type_t result = xpc_get_type(v8);
  if (result == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(v8, "status");
LABEL_16:
    xpc_release(v8);
    return (xpc_type_t)int64;
  }

  if (result == (xpc_type_t)&_xpc_type_error)
  {
    memset(__b, 170, sizeof(__b));
    string = xpc_dictionary_get_string(v8, _xpc_error_key_description);
    snprintf(__b, 0x400uLL, "Error connecting to logd_helper: %s", string);
    sub_10000B70C((uint64_t)__b);
    else {
      int64_t int64 = 22LL;
    }
    goto LABEL_16;
  }

  qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
  qword_10002DF78 = (uint64_t)result;
  __break(1u);
  return result;
}

void sub_100009324(id a1)
{
  qword_10003A7E8 = (uint64_t)xpc_connection_create_mach_service("com.apple.logd_helper", 0LL, 2uLL);
  xpc_connection_set_event_handler((xpc_connection_t)qword_10003A7E8, &stru_1000290C0);
  xpc_connection_activate((xpc_connection_t)qword_10003A7E8);
}

uint64_t start()
{
  int v35 = -1431655766;
  qword_10003A7D0 = os_transaction_create("com.apple.logd");
  os_trace_set_mode(256LL);
  byte_10003A8F0 = (MEMORY[0xFFFFFC104] & 0x4000000) != 0;
  _os_trace_set_diagnostic_flags(MEMORY[0xFFFFFC104] | 0x4000000u);
  if (bootstrap_check_in2(bootstrap_port, "com.apple.logd", &v35, 8LL))
  {
    memset(&__str[36], 170, 0x3DCuLL);
    strcpy(&__str[32], "ogd");
    unint64_t v1 = "failed to checkin to com.apple.logd";
LABEL_69:
    __int128 v29 = *((_OWORD *)v1 + 1);
    *(_OWORD *)__str = *(_OWORD *)v1;
    *(_OWORD *)&__str[16] = v29;
    sub_10000B70C((uint64_t)__str);
    return 1LL;
  }

  if (&_wd_endpoint_register)
  {
    wd_endpoint_register("com.apple.logd.watchdog");
    uint64_t v2 = wd_endpoint_set_alive_func(&stru_100029100);
    wd_endpoint_activate(v2);
  }

  if (byte_10003A8F0) {
    sub_100009A64(v35);
  }
  sub_100017994(0LL);
  sub_100017994(1LL);
  sub_100017994(2LL);
  sub_100016578();
  qword_10002DDC0 = qword_10003A8F8;
  qword_10002DD30 = qword_10003A8F8;
  qword_10002DC10 = qword_10003A8F8;
  qword_10002DCA0 = qword_10003A8F8;
  dispatch_sync_f((dispatch_queue_t)qword_10003A8F8, 0LL, (dispatch_function_t)sub_100017390);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  unint64_t v3 = (const char *)qword_10003A960;
  unint64_t v4 = (int *)_os_trace_zalloc(152LL);
  int v5 = openat(-2, v3, 0);
  int *v4 = v5;
  if (v5 == -1)
  {
LABEL_24:
    uint64_t v16 = *__error();
LABEL_25:
    _os_assumes_log(v16);
    goto LABEL_65;
  }

  *((void *)v4 + 16) = 0x20000LL;
  v4[34] = 9;
  *((void *)v4 + 18) = 3888000LL;
  unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = sub_100021164(v5, &v37, &v36, 1);
  if (v6 < 0) {
    goto LABEL_65;
  }
  if (v6)
  {
    unint64_t v7 = v37;
    unint64_t v8 = v36 + 1;
    *((void *)v4 + 12) = v37;
    *((void *)v4 + 13) = v8;
    uint64_t v9 = (unsigned int *)(v4 + 24);
    uint64_t v10 = (unsigned int *)(v4 + 24);
    if (v7 > 1) {
      goto LABEL_15;
    }
  }

  else
  {
    *((void *)v4 + 12) = 2LL;
    uint64_t v10 = (unsigned int *)(v4 + 24);
    uint64_t v9 = (unsigned int *)(v4 + 26);
  }

  *(void *)uint64_t v9 = 2LL;
  uint64_t v9 = v10;
LABEL_15:
  sub_10002147C(v4);
  unint64_t v11 = *((void *)v4 + 13);
  if (v11 == 2 || v11 <= *(void *)v9) {
    goto LABEL_34;
  }
  memset(__str, 170, 26);
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v36);
  int v12 = openat(*v4, __str, 16777225);
  if (v12 < 0) {
    goto LABEL_65;
  }
  int v13 = v12;
  off_t v14 = lseek(v12, 0LL, 2);
  if (v14 == -1)
  {
    uint64_t v22 = *__error();
LABEL_40:
    _os_assumes_log(v22);
    goto LABEL_21;
  }

  if (v14 > 0x7FFFFFFF)
  {
    uint64_t v22 = 0LL;
    goto LABEL_40;
  }

  if ((v14 & 7) != 0)
  {
LABEL_21:
    if (close(v13) != -1) {
      goto LABEL_65;
    }
    int v15 = *__error();
    uint64_t v16 = *__error();
    if (v15 != 9) {
      goto LABEL_25;
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v16;
    __break(1u);
    goto LABEL_24;
  }

  v4[28] = v13;
  *((void *)v4 + 15) = v14;
  if ((unint64_t)v14 >= *((void *)v4 + 16))
  {
    if (close(v13) == -1)
    {
      LODWORD(v19) = *__error();
      uint64_t v31 = *__error();
      if ((_DWORD)v19 == 9)
      {
LABEL_80:
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = v31;
        __break(1u);
LABEL_81:
        sub_1000217F0(((_DWORD)v0 << 16) | ((v19 & 0xFFFFF) << 32) | WORD1(v0) | 0xBAD0000000000000LL);
      }

      _os_assumes_log(v31);
    }

    sub_10002147C(v4);
LABEL_34:
LABEL_65:
    if (*v4 < 0 || close(*v4) != -1) {
      goto LABEL_67;
    }
    LODWORD(v19) = *__error();
    uint64_t v31 = *__error();
    if ((_DWORD)v19 != 9)
    {
      _os_assumes_log(v31);
LABEL_67:
      free(v4);
      qword_10003A798 = 0LL;
LABEL_68:
      memset(&__str[33], 170, 0x3DFuLL);
      __str[32] = 0;
      unint64_t v1 = "failed to create timesync writer";
      goto LABEL_69;
    }

    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v31;
    __break(1u);
    goto LABEL_80;
  }

  if (!v14) {
    goto LABEL_35;
  }
  uint64_t v17 = *v4;
  size_t v38 = 0xAAAAAAAAAAAAAAAALL;
  __int16 v18 = (char *)_os_trace_mmap_at(v17, __str, 256LL, &v38);
  if (!v18)
  {
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_25;
    }
    goto LABEL_65;
  }

  if (!v38)
  {
LABEL_60:
    int v27 = munmap(v18, v38);
    int v28 = 1;
    LODWORD(v19) = -1431655766;
    LODWORD(vsub_100021ACC(qword_10003A798, 0) = -1431655766;
    goto LABEL_61;
  }

  if (v38 >= 8)
  {
    size_t v23 = 0LL;
    while (v23 < v38)
    {
      size_t v19 = v23;
      uint64_t v24 = &v18[v23];
      int v25 = *(unsigned __int16 *)&v18[v23];
      if (v25 > 48047)
      {
        if (v25 == 48048)
        {
          if (*((_WORD *)v24 + 1) != 48) {
            goto LABEL_58;
          }
          uint64_t v26 = 48LL;
        }

        else
        {
          if (v25 != 57005) {
            goto LABEL_58;
          }
          uint64_t v26 = *((unsigned __int16 *)v24 + 1);
        }
      }

      else if (v25 == 27986)
      {
        if (*((_WORD *)v24 + 1) != 88) {
          goto LABEL_58;
        }
        uint64_t v26 = 88LL;
      }

      else
      {
        if (v25 != 29524 || *((_WORD *)v24 + 1) != 32)
        {
LABEL_58:
          uint64_t v0 = *(void *)v24;
          goto LABEL_59;
        }

        uint64_t v26 = 32LL;
      }

      size_t v23 = v19 + v26;
      if (v23 > v38) {
        goto LABEL_58;
      }
    }

    goto LABEL_60;
  }

  LODWORD(vsub_100021ACC(qword_10003A798, 0) = -1431655766;
  LODWORD(v19) = -1;
LABEL_59:
  int v27 = munmap(v18, v38);
  int v28 = 0;
LABEL_61:
  if (v27 != -1)
  {
    if (!v28) {
      goto LABEL_63;
    }
LABEL_35:
    if ((sub_100021818((uint64_t)v4, 0) & 0x80000000) == 0)
    {
      qword_10003A798 = (uint64_t)v4;
      if (v4)
      {
        sub_100009AD4();
        memset(__str, 170, 0x400uLL);
        int v20 = sub_100022974();
        snprintf(__str, 0x400uLL, "libtrace_kic=%d", v20);
        sub_10000B70C((uint64_t)__str);
        sub_10000E928();
        sub_100009B6C();
        sub_100003B48(0x133ED02u);
        sub_10000366C(v35, &stru_100028FA0);
        BOOL v21 = sub_100003B84();
        sub_100011084(!v21);
        _os_trace_set_diagnostic_flags(MEMORY[0xFFFFFC104] & 0xFBFFFFFF);
        sub_100014EFC();
        sub_100003BA8();
        sub_100009C3C();
        sub_100009C94();
        sub_100009D08();
        sub_100009EC0();
        sub_100009F94();
        sub_10000BCB0();
        sub_10000ECC0();
        sub_10000A040();
        sub_10000D638();
        dispatch_main();
      }

      goto LABEL_68;
    }

    goto LABEL_65;
  }

  int v34 = v28;
  uint64_t v32 = __error();
  _os_assumes_log(*v32);
  if (v34) {
    goto LABEL_35;
  }
LABEL_63:
  if (close(v4[28]) != -1) {
    goto LABEL_64;
  }
  int v33 = *__error();
  uint64_t result = *__error();
  if (v33 != 9)
  {
    _os_assumes_log(result);
LABEL_64:
    sub_10002147C(v4);
    goto LABEL_65;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

void sub_100009A64(int a1)
{
}

void sub_100009AD4()
{
  if (setiopolicy_np(5, 0, 1) == -1)
  {
    memset(&v0[44], 170, 0x3D4uLL);
    strcpy(v0, "Failed to set IOPOL_VFS_TRIGGER_RESOLVE_OFF");
    sub_10000B70C((uint64_t)v0);
  }

void sub_100009B6C()
{
  *(void *)&v4[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 in = v0;
  *(_OWORD *)unint64_t v4 = v0;
  size_t v1 = 37LL;
  if (!sysctlbyname("kern.uuid", &in, &v1, 0LL, 0LL))
  {
    uuid_parse((const char *)&in, byte_10003A7F9);
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "_read_kernel_uuid calling _logd_uuiddb_harvest_kernel for %s", (const char *)&in);
    sub_10000B70C((uint64_t)__b);
    sub_10000DFB4();
  }

void sub_100009C3C()
{
  if (&_wd_endpoint_register)
  {
    __int128 v0 = sub_100003ED8(2LL);
    size_t v1 = sub_100003ED8(3LL);
    wd_endpoint_add_queue(v0);
    wd_endpoint_add_queue(v1);
    byte_10003A7F8 = 1;
  }

void sub_100009C94()
{
  dword_10003A82C = IORegisterForSystemPower( 0LL,  (IONotificationPortRef *)&qword_10003A820,  (IOServiceInterestCallback)sub_10000A9F4,  &dword_10003A828);
  __int128 v0 = (IONotificationPort *)qword_10003A820;
  if (dword_10003A82C) {
    BOOL v1 = qword_10003A820 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    IONotificationPortSetDispatchQueue(v0, global_queue);
  }

void sub_100009D08()
{
  kern_return_t v1;
  kern_return_t v2;
  uintptr_t v3;
  uintptr_t v4;
  void handler[4];
  mach_port_name_t v6;
  host_t v7;
  mach_port_name_t name;
  _OWORD __b[64];
  name = 0;
  if (qword_10003A840 != -1) {
    dispatch_once(&qword_10003A840, &stru_1000291E0);
  }
  host_t v0 = dword_10003A83C;
  if (!dword_10003A83C)
  {
    memset((char *)&__b[2] + 13, 170, 0x3D3uLL);
    strcpy((char *)__b, "Failed to get host port for calendar changes");
    goto LABEL_7;
  }

  BOOL v1 = mach_port_allocate(mach_task_self_, 1u, &name);
  if (v1)
  {
    uint64_t v2 = v1;
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Failed to allocate mach port for calendar changes: error %d", v2);
LABEL_7:
    sub_10000B70C((uint64_t)__b);
    return;
  }

  unint64_t v3 = name;
  if (qword_10003A7D8 != -1)
  {
    unint64_t v4 = name;
    dispatch_once(&qword_10003A7D8, &stru_100028FE0);
    unint64_t v3 = v4;
  }

  qword_10003A830 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  v3,  0LL,  (dispatch_queue_t)qword_10003A7E0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_10000A778;
  handler[3] = &unk_1000291A0;
  int v6 = name;
  unint64_t v7 = v0;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003A830, handler);
  dispatch_activate((dispatch_object_t)qword_10003A830);
  sub_10000A82C(v0, name);
}

void sub_100009EC0()
{
  if (qword_10003A7D8 != -1) {
    dispatch_once(&qword_10003A7D8, &stru_100028FE0);
  }
  int out_token = -1431655766;
  if (notify_register_dispatch( "com.apple.system.timezone",  &out_token,  (dispatch_queue_t)qword_10003A7E0,  &stru_100029200))
  {
    memset(&v1[40], 170, 0x3D8uLL);
    strcpy(v1, "Failed to register for timezone changes");
    sub_10000B70C((uint64_t)v1);
  }

void sub_100009F94()
{
  if (qword_10003A7D8 != -1) {
    dispatch_once(&qword_10003A7D8, &stru_100028FE0);
  }
  host_t v0 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_10003A7E0);
  qword_10003A850 = (uint64_t)v0;
  dispatch_time_t v1 = dispatch_walltime(0LL, 0LL);
  dispatch_source_set_timer(v0, v1, 0x34630B8A000uLL, 0xDF8475800uLL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003A850, &stru_100029240);
  dispatch_activate((dispatch_object_t)qword_10003A850);
}

void sub_10000A040()
{
  dispatch_source_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  dispatch_set_context(v0, v0);
  dispatch_source_set_cancel_handler_f(v0, (dispatch_function_t)&_dispatch_release);
  dispatch_source_set_event_handler_f(v0, (dispatch_function_t)sub_10000A0AC);
  dispatch_activate(v0);
}

uint64_t sub_10000A0AC(dispatch_source_s *a1)
{
  __uint64_t v1 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  int v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  asprintf(&v28, "%s/shutdown.log", (const char *)qword_10003A958);
  if (v28)
  {
    uint64_t v2 = fopen(v28, "a+");
    free(v28);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  if (qword_10003A7D8 != -1) {
    dispatch_once(&qword_10003A7D8, &stru_100028FE0);
  }
  dispatch_sync((dispatch_queue_t)qword_10003A7E0, &stru_100029280);
  sub_100021ACC(qword_10003A798, 0);
  unint64_t v3 = &qword_10002C398;
  uint64_t v4 = 5LL;
  do
  {
    sub_100011390((uint64_t)v3);
    v3 += 156;
    --v4;
  }

  while (v4);
  int v5 = (void **)sub_10000DEDC();
  sub_100020614(v5);
  else {
    unint64_t v6 = 0LL;
  }
  if (os_variant_allows_internal_security_policies("com.apple.libtrace"))
  {
    unint64_t v7 = getenv("LOGD_SHUTDOWN_GRACE_CLIENT_COUNT");
    if (!v6) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  unint64_t v7 = 0LL;
  if (v6)
  {
LABEL_17:
    unint64_t v6 = strtoul((const char *)v6, 0LL, 10);
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "LOGD_SHUTDOWN_GRACE_TIME: %llu", v6);
    sub_10000B70C((uint64_t)__b);
  }

FILE *sub_10000A508(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(FILE **)(a1 + 40);
  if (result)
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      fprintf( result,  "After %.02fs, these clients are still here:\n",  (double)(unint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 56)) / 1000000000.0);
    }
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v5;
    *(_OWORD *)&out[16] = v5;
    int v6 = -1431655766;
    sub_1000035E4(*(void *)(a2 + 64), &v6);
    uuid_unparse_upper((const unsigned __int8 *)(a2 + 32), out);
    fprintf(*(FILE **)(a1 + 40), "\t\tremaining client pid: %d (%s/%s)\n", v6, (const char *)(a2 + 138), out);
    uint64_t result = (FILE *)(*(void *)(a1 + 40) != 0LL);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  return result;
}

void sub_10000A610(id a1)
{
  qword_10003A818 = (uint64_t)dispatch_group_create();
}

void sub_10000A62C(id a1)
{
  byte_10003A838 = 1;
}

void sub_10000A63C(id a1)
{
  if ((byte_10003A838 & 1) == 0 && (sub_100021ACC(qword_10003A798, 0) & 0x80000000) != 0)
  {
    memset(&v1[40], 170, 0x3D8uLL);
    strcpy(v1, "Failed to write periodic timesync point");
    sub_10000B70C((uint64_t)v1);
  }

void sub_10000A6DC(id a1, int a2)
{
  if ((byte_10003A838 & 1) == 0)
  {
    memset(&v2[41], 170, 0x3D7uLL);
    strcpy(v2, "Time zone changed, updating file headers");
    sub_10000B70C((uint64_t)v2);
    sub_100021ACC(qword_10003A798, 1);
  }

void sub_10000A778(uint64_t a1)
{
  mach_msg_return_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v4 = 0u;
  __int128 v5 = 0u;
  int v2 = *(_DWORD *)(a1 + 32);
  DWORD1(v4) = 24;
  HIDWORD(v4) = v2;
  unint64_t v3 = mach_msg_receive((mach_msg_header_t *)&v4);
  if ((byte_10003A838 & 1) == 0 && (DWORD1(v5) & 0xFFFFFFFE) == 0x3B6)
  {
    sub_100021ACC(qword_10003A798, 1);
    sub_10000A82C(*(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32));
  }

  if (!v3) {
    mach_msg_destroy((mach_msg_header_t *)&v4);
  }
}

void sub_10000A82C(host_t a1, mach_port_t notify_port)
{
  kern_return_t v4;
  char __b[1024];
  uint64_t v4 = host_request_notification(a1, (byte_10003A848 & 1) == 0, notify_port);
  if (v4 == 4 && (byte_10003A848 & 1) == 0)
  {
    byte_10003A848 = 1;
    uint64_t v4 = host_request_notification(a1, 0, notify_port);
  }

  if (v4)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "Failed to register for calendar changes: error %d", v4);
    sub_10000B70C((uint64_t)__b);
  }

void sub_10000A90C(id a1)
{
  kern_return_t special_port;
  kern_return_t v3;
  mach_port_t port;
  char __b[1024];
  mach_port_t v1 = mach_host_self();
  port = -1431655766;
  special_port = host_get_special_port(v1, -1, 1, &port);
  unint64_t v3 = special_port;
  if (special_port == 4)
  {
LABEL_4:
    dword_10003A83C = v1;
    if (v1) {
      return;
    }
    goto LABEL_5;
  }

  if (!special_port)
  {
    mach_port_deallocate(mach_task_self_, v1);
    mach_port_t v1 = port;
    goto LABEL_4;
  }

  if (!dword_10003A83C)
  {
LABEL_5:
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "Failed to get mach host port: error %d", v3);
    sub_10000B70C((uint64_t)__b);
  }

uint64_t sub_10000A9F4(int a1, int a2, int a3, intptr_t notificationID)
{
  if (a3 != -536870288)
  {
    if (a3 != -536870272) {
      return result;
    }
    __int128 v5 = &qword_10002C398;
    uint64_t v6 = 5LL;
    do
    {
      sub_100011390((uint64_t)v5);
      v5 += 156;
      --v6;
    }

    while (v6);
  }

  return IOAllowPowerChange(dword_10003A82C, notificationID);
}

void sub_10000AA74( id a1, firehose_client_s *a2, unint64_t a3, firehose_chunk_s *a4, $754BF22DF3E7A383AD1C6D393ED204EF a5)
{
  switch(a3)
  {
    case 1uLL:
      int pid = -1431655766;
      memset(__b, 170, sizeof(__b));
      sub_1000035E4((uint64_t)a2, &pid);
      if (pid)
      {
        *(void *)uuid_string_t out = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v7 = sub_100003624((uint64_t)a2, out);
        if (v7)
        {
          if (*(void *)out == 2048LL)
          {
            uint64_t v8 = v7;
            if (proc_pidpath(pid, __b, 0x400u) <= 0) {
              __strlcpy_chk(__b, v8 + 568, 1024LL, 1024LL);
            }
            uint64_t v9 = sub_10000B1F0((uint64_t)a2, __b);
            sub_10000364C((uint64_t)a2, (unint64_t)v9);
            *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
            buffer[0] = v10;
            buffer[1] = v10;
            buffer[2] = v10;
            buffer[3] = v10;
            buffer[4] = v10;
            buffer[5] = v10;
            buffer[6] = v10;
            buffer[7] = v10;
            buffer[8] = v10;
            buffer[9] = v10;
            buffer[10] = v10;
            buffer[11] = v10;
            if (proc_pidinfo(pid, 18, 1uLL, buffer, 192) == 192)
            {
              uuid_copy((unsigned __int8 *)v9 + 32, (const unsigned __int8 *)&buffer[8] + 8);
              BOOL v11 = (buffer[0] & 0x10) == 0;
              char v12 = 6;
              char v13 = 4;
            }

            else
            {
              uuid_copy((unsigned __int8 *)v9 + 32, (const unsigned __int8 *)(v8 + 24));
              BOOL v11 = (*(_WORD *)v8 & 1) == 0;
              char v12 = 4;
              char v13 = 6;
            }

            if (v11) {
              char v12 = v13;
            }
            int v27 = *((unsigned __int8 *)v9 + 138);
            *((_BYTE *)v9 + 136) = v12;
            if (!uuid_is_null((const unsigned __int8 *)(v8 + 40)))
            {
              uuid_copy((unsigned __int8 *)v9 + 48, (const unsigned __int8 *)(v8 + 40));
              sub_10000E810((_OWORD *)v9 + 3);
            }

            var1 = (unsigned __int8 *)a4->var0.var1.var1;
            if (var1)
            {
              uint64_t v29 = *(void *)a4->var0.var1.var2;
              if (v29) {
                sub_10000B3A8((uint64_t)v9, var1, v29);
              }
            }

            goto LABEL_55;
          }
        }

        else
        {
          qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Should have a metadata buffer";
          __break(1u);
        }

        qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Invalid metadata buffer size";
        __break(1u);
LABEL_71:
        __break(0x5515u);
        goto LABEL_72;
      }

      *(void *)__b = 0x6C656E72656B2FLL;
      uint64_t v9 = sub_10000B1F0((uint64_t)a2, __b);
      sub_10000364C((uint64_t)a2, (unint64_t)v9);
      if (qword_10003A988 != -1) {
        dispatch_once(&qword_10003A988, &stru_10002A4E8);
      }
      if (byte_10003A990) {
        char v22 = 6;
      }
      else {
        char v22 = 4;
      }
      *((_BYTE *)v9 + 136) = v22;
      uuid_copy((unsigned __int8 *)v9 + 32, byte_10003A7F9);
      if (qword_10003A9A8 != -1) {
        dispatch_once(&qword_10003A9A8, &stru_10002A568);
      }
      if (byte_10002DF3C) {
        sub_100022A98((unsigned __int8 *)v9 + 48);
      }
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v23;
      *(_OWORD *)&out[16] = v23;
      uuid_unparse(byte_10003A7F9, out);
      memset(buffer, 170, sizeof(buffer));
      snprintf((char *)buffer, 0x400uLL, "_logd_read_kernel_info calling _logd_uuiddb_harvest_kernel for %s", out);
      sub_10000B70C((uint64_t)buffer);
      sub_10000DFB4();
      if (qword_10003A9A8 != -1) {
        dispatch_once(&qword_10003A9A8, &stru_10002A568);
      }
      if (!byte_10002DF3C)
      {
        CFArrayRef v24 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10002C368, 3LL, &kCFTypeArrayCallBacks);
        unint64_t v25 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0LL, v24);
        if (v25)
        {
          uint64_t v26 = v25;
          CFDictionaryApplyFunction(v25, (CFDictionaryApplierFunction)sub_10000B298, v9);
          CFRelease(v26);
        }

        if (v24) {
          CFRelease(v24);
        }
      }

void *sub_10000B1F0(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  uint64_t v5 = _os_trace_calloc(1LL, v4 + 145);
  *(_DWORD *)(v5 + 132) = 0;
  *(void *)(v5 + 16) = 0LL;
  *(void *)(v5 + 24) = v5 + 16;
  *(void *)(v5 + 64) = a1;
  uint64_t result = memcpy((void *)(v5 + 138), __s, v4);
  *(void *)(v5 + 88) = 0LL;
  unint64_t v7 = v5 + 88;
  if ((unint64_t)(v5 + 88) >= 0xFFFFFFFFFFFFFFF8LL
    || (*(void *)(v5 + 96) = 0LL, v7 >= 0xFFFFFFFFFFFFFFF0LL)
    || (*(void *)(v5 + 104) = 0LL, v7 >= 0xFFFFFFFFFFFFFFE8LL)
    || (*(void *)(v5 + 112) = 0LL, v7 >= 0xFFFFFFFFFFFFFFE0LL))
  {
    __break(0x5513u);
  }

  else
  {
    *(void *)(v5 + 12sub_100021ACC(qword_10003A798, 0) = 0LL;
    return (void *)v5;
  }

  return result;
}

void sub_10000B298(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleExecLoadAddress");
  uint64_t v6 = (const __CFData *)CFDictionaryGetValue(theDict, @"OSBundleTextUUID");
  unint64_t v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleExecLoadSize");
  if (Value)
  {
    if (v6)
    {
      uint64_t v8 = v7;
      if (v7)
      {
        unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
        if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
        {
          *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v12[0] = v9;
          v12[1] = v9;
          DWORD2(v12[0]) = valuePtr;
          WORD6(v12[0]) = WORD2(valuePtr);
          BytePtr = CFDataGetBytePtr(v6);
          uuid_copy((unsigned __int8 *)((unint64_t)v12 | 0xE), BytePtr);
          CFNumberGetValue(v8, kCFNumberSInt64Type, v12);
          sub_100008578(a3, (uint64_t)v12);
        }
      }
    }
  }

void sub_10000B3A8(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3 = (unint64_t)&a2[a3];
  size_t v4 = a2 + 8;
  if (a2 + 8 < &a2[a3])
  {
    uint64_t v5 = a2;
    do
    {
      int v7 = *(_DWORD *)v5;
      if (!*(_DWORD *)v5) {
        return;
      }
      unint64_t v8 = *((unsigned int *)v5 + 1);
      switch(v7)
      {
        case 3:
          goto LABEL_9;
        case 2:
          if (v8 >= 4 && v8 - 4 >= v5[10] + (unint64_t)v5[11])
          {
            char v12 = (unsigned __int8 *)sub_100007554((uint64_t)v4);
            if (v12) {
              sub_100008794(a1, v12);
            }
          }

          break;
        case 1:
LABEL_9:
          if (v8 >= 0x20 && v8 - 32 != strnlen((const char *)v5 + 40, v8 - 32))
          {
            if (v7 == 1)
            {
              *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v14[0] = v9;
              v14[1] = v9;
              uuid_copy((unsigned __int8 *)v14 + 14, v4);
              uint64_t v10 = *((void *)v5 + 3);
              uint64_t v11 = *((void *)v5 + 4);
              DWORD2(v14[0]) = v10;
              WORD6(v14[0]) = WORD2(v10);
              *(void *)&v14[0] = v11;
              sub_100008578(a1, (uint64_t)v14);
            }

            else
            {
              sub_10000872C(a1, (uint64_t *)v4);
            }

            sub_10000E15C(v4, (const char *)v5 + 40, 0LL, 1);
          }

          break;
      }

      uint64_t v13 = (*((_DWORD *)v5 + 1) + 7) & 0xFFFFFFF8;
      if (__CFADD__(v4, v13)) {
        __break(0x5513u);
      }
      uint64_t v5 = &v4[v13];
      v4 += v13 + 8;
    }

    while ((unint64_t)v4 < v3);
  }

void sub_10000B544(void *a1, char *a2, unint64_t a3)
{
  unint64_t v6 = HIWORD(a3);
  int v14 = -1431655766;
  sub_1000035E4((uint64_t)a1, &v14);
  if (v14) {
    uint64_t v7 = HIBYTE(a3) & 4;
  }
  else {
    LODWORD(v7) = byte_10003A7B8 & 1;
  }
  unsigned __int8 v8 = 4;
  switch((char)v6)
  {
    case 0:
      goto LABEL_7;
    case 1:
      LOBYTE(v6) = 1;
      goto LABEL_7;
    case 2:
      goto LABEL_12;
    case 4:
      LOBYTE(v6) = 2;
LABEL_7:
      if ((_DWORD)v7) {
        unsigned __int8 v8 = 3;
      }
      else {
        unsigned __int8 v8 = v6;
      }
      if (!(_DWORD)v7 || byte_10003A88C)
      {
LABEL_12:
        uint64_t v9 = sub_100003638((uint64_t)a1);
        if (!*(_BYTE *)(v9 + 128))
        {
          if (1248 * (unint64_t)v8 > ~(unint64_t)qword_10002C398)
          {
            __break(0x5513u);
          }

          else
          {
            uint64_t v10 = (os_unfair_lock_s *)v9;
            sub_1000114D4((dispatch_queue_t *)&qword_10002C398[156 * v8], a2, a3, a1);
            unsigned int v11 = (unsigned __int16)a3 - WORD1(a3) + 4096;
            if (v11 >= 0xFF9) {
              unsigned int v11 = 4096;
            }
            if (WORD1(a3) == 4096) {
              uint64_t v12 = (unsigned __int16)a3;
            }
            else {
              uint64_t v12 = v11;
            }
            os_unfair_lock_lock_with_options(&v10[33], 0x10000LL);
            uint64_t v13 = (void *)sub_10000628C((uint64_t)v10, v8);
            *v13 += v12;
            os_unfair_lock_unlock(v10 + 33);
          }
        }
      }

      break;
    default:
      return;
  }

BOOL sub_10000B6DC(id a1, char **a2, unint64_t *a3)
{
  *a2 = 0LL;
  *a3 = 0LL;
  return byte_10003A7F8 & 1;
}

uint64_t sub_10000B6F4(uint64_t a1)
{
  return 1LL;
}

void sub_10000B70C(uint64_t a1)
{
  if (qword_10003A858 != -1) {
    dispatch_once_f(&qword_10003A858, 0LL, (dispatch_function_t)sub_10000B7D8);
  }
  if (!dispatch_get_specific(off_10002C380))
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 0x40000000LL;
    v2[2] = sub_10000B94C;
    v2[3] = &unk_1000292C8;
    v2[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_10003A860, v2);
  }

int *sub_10000B7D8()
{
  if (!qword_10003A868)
  {
    uint64_t v1 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_10002DF78 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_10002DF78 = v2;
    __break(1u);
    return result;
  }

  qword_10003A860 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_10003A868, 0LL, 0LL);
  dispatch_queue_set_specific((dispatch_queue_t)qword_10003A860, off_10002C380, (void *)qword_10003A860, 0LL);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  asprintf((char **)&qword_10003A870, "%s/%s.0.log", (const char *)qword_10003A958, "logd");
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  uint64_t result = (int *)asprintf((char **)&qword_10003A878, "%s/%s.1.log", (const char *)qword_10003A958, "logd");
  if (!qword_10003A870 || !qword_10003A878) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_10000B94C(uint64_t a1)
{
  uint64_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A860);
  memset(__b, 170, sizeof(__b));
  memset(v10, 170, 18);
  v8.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)uint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v8.tm_mon = v2;
  *(_OWORD *)&v8.tm_isdst = v2;
  *(_OWORD *)&v8.tm_sec = v2;
  time_t v7 = time(0LL);
  localtime_r(&v7, &v8);
  strftime(v9, 0x1AuLL, "%F %T%z", &v8);
  unint64_t v3 = getprogname();
  pid_t v4 = getpid();
  uint64_t result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v9, v3, v4, v1);
  if ((int)result >= 1)
  {
    unsigned int v6 = result;
    if (result >= 0x400)
    {
      if ((unint64_t)__b >= 0xFFFFFFFFFFFFFC02LL)
      {
        __break(0x5513u);
        return result;
      }

      __b[1022] = 10;
      unsigned int v6 = 1023;
    }

    dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A860);
    sub_10000BA98();
    uint64_t result = dword_10002C388;
    if ((dword_10002C388 & 0x80000000) == 0)
    {
      _os_trace_write(dword_10002C388, __b, v6);
      return sub_10000BAE0();
    }
  }

  return result;
}

void sub_10000BA98()
{
  if (dword_10002C388 < 0)
  {
    sub_10000BBA4();
    if ((dword_10002C388 & 0x80000000) == 0) {
      sub_10000BAE0();
    }
  }

uint64_t sub_10000BAE0()
{
  off_t v0 = lseek(dword_10002C388, 0LL, 2);
  uint64_t result = fsync(dword_10002C388);
  if (v0 >= 0x100000)
  {
    if (close(dword_10002C388) != -1)
    {
LABEL_3:
      rename((const char *)qword_10003A870, (const char *)qword_10003A878);
      return sub_10000BBA4();
    }

    int v2 = *__error();
    uint64_t result = *__error();
    if (v2 != 9)
    {
      _os_assumes_log(result);
      goto LABEL_3;
    }

    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = result;
    __break(1u);
  }

  return result;
}

uint64_t sub_10000BBA4()
{
  uint64_t result = open((const char *)qword_10003A870, 778, 420LL);
  dword_10002C388 = result;
  if ((result & 0x80000000) == 0) {
    return fchown(result, dword_10002DF0C, unk_10002DF10);
  }
  return result;
}

void sub_10000BBF8()
{
  if (qword_10003A858 != -1) {
    dispatch_once_f(&qword_10003A858, 0LL, (dispatch_function_t)sub_10000B7D8);
  }
  dispatch_sync((dispatch_queue_t)qword_10003A860, &stru_100029308);
}

void sub_10000BC48(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    unsigned int v6 = reply;
    xpc_dictionary_set_int64(reply, "st", a3);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }

void sub_10000BCB0()
{
  mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0LL, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100029348);
  xpc_connection_activate(mach_service);
  qword_10003A880 = (uint64_t)mach_service;
}

void sub_10000BD00()
{
  int v19 = -1431655766;
  int is_development_build = _os_trace_is_development_build();
  int v1 = (is_development_build & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x8000000) == 0;
  int v2 = memset(__b, 170, sizeof(__b));
  unint64_t v3 = (const char *)_os_trace_prefsdir_path(v2);
  os_unfair_lock_lock_with_options(&stru_10003A888, 0x10000LL);
  plist_at = (void *)_os_trace_read_plist_at(4294967294LL, __b);
  if (!plist_at)
  {
    int v14 = 0;
    int v7 = is_development_build;
LABEL_25:
    int v15 = 0;
    unsigned int v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
    if (v1) {
      int v17 = 0;
    }
    else {
      int v17 = 1024;
    }
    if (!is_development_build) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  uint64_t v5 = plist_at;
  BOOL v6 = xpc_dictionary_get_BOOL(plist_at, "Enable-Logging");
  int v7 = is_development_build | v6;
  is_development_build |= xpc_dictionary_get_BOOL(v5, "Enable-Private-Data");
  xpc_object_t value = xpc_dictionary_get_value(v5, "Privacy-Enable-Level");
  if (value)
  {
    uint64_t v9 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v9);
      if (!strcasecmp(string_ptr, "Sensitive"))
      {
        int v11 = 0;
        int is_development_build = 1;
        goto LABEL_15;
      }

      if (!strcasecmp(string_ptr, "Private")) {
        int is_development_build = 1;
      }
    }
  }

  int v11 = 1;
LABEL_15:
  v1 |= v6;
  xpc_object_t v12 = xpc_dictionary_get_value(v5, "Privacy-Set-Level");
  if (!v12 || (uint64_t v13 = v12, xpc_get_type(v12) != (xpc_type_t)&_xpc_type_string))
  {
LABEL_17:
    xpc_release(v5);
    if (v11)
    {
      int v14 = 0;
      int v15 = 0;
      unsigned int v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
      if (v1) {
        int v17 = 0;
      }
      else {
        int v17 = 1024;
      }
      if ((is_development_build & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }

    int v14 = 0x2000000;
    goto LABEL_25;
  }

  uint64_t v18 = xpc_string_get_string_ptr(v13);
  if (strcasecmp(v18, "Sensitive"))
  {
    if (!strcasecmp(v18, "Private"))
    {
      int is_development_build = 1;
    }

    else if (!strcasecmp(v18, "Public"))
    {
      xpc_release(v5);
      int v14 = 0;
      int v15 = 0;
      unsigned int v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
      if (v1) {
        int v17 = 0;
      }
      else {
        int v17 = 1024;
      }
      goto LABEL_30;
    }

    goto LABEL_17;
  }

  xpc_release(v5);
  unsigned int v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
  if (v1) {
    int v17 = 0;
  }
  else {
    int v17 = 1024;
  }
  int v14 = 0x2000000;
LABEL_29:
  int v15 = 0x1000000;
LABEL_30:
  if ((v15 | v17 | v14 | v16) != MEMORY[0xFFFFFC104]) {
    _os_trace_set_diagnostic_flags();
  }
  os_unfair_lock_unlock(&stru_10003A888);
}

void sub_10000C038(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_10000C098((_xpc_connection_s *)a2);
  }

  else
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_10002DF78 = (uint64_t)type;
    __break(1u);
  }

void sub_10000C098(_xpc_connection_s *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000LL;
  v2[2] = sub_10000C128;
  v2[3] = &unk_100029368;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_activate(a1);
}

#error "10000C438: switch analysis failed: switch information is incomplete or incorrect (funcsize=219)"
void sub_10000C4FC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v5;
  const char *string;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  int v16;
  int v17;
  int v18;
  int *v19;
  int v20;
  int *v21;
  int v22;
  int *v23;
  void v24[2];
  char __str[1024];
  void __b[128];
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL
    || (uint64_t v5 = uint64, (string = xpc_dictionary_get_string(xdict, "prefs_name")) == 0LL)
    || (int v7 = string, strchr(string, 47))
    || strlen(v7) >= 0x100)
  {
    sub_10000BC48(a1, xdict, 22);
    return;
  }

  __b[1] = 0xAAAAAAAAAAAAAAAALL;
  __b[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[0] = xpc_dictionary_get_data(xdict, "prefs_data", &__b[1]);
  v24[1] = __b[1];
  if (!v24[0] || !__b[1])
  {
    int v14 = a1;
    int v15 = xdict;
    unsigned int v16 = 22;
LABEL_31:
    sub_10000BC48(v14, v15, v16);
    return;
  }

  memset(__b, 170, sizeof(__b));
  tm v8 = (uint64_t)memset(__str, 170, sizeof(__str));
  if (~(unint64_t)qword_1000293E8 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_37;
  }

  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v8;
    __break(1u);
    goto LABEL_39;
  }

  uint64_t v9 = (const char *)qword_1000293E8[v5];
  uint64_t v10 = (const char *)_os_trace_prefsdir_path(v8);
  int v11 = snprintf((char *)__b, 0x400uLL, "%s/%s/%s.plist", v10, v9, v7);
  xpc_object_t v12 = (const char *)_os_trace_prefsdir_path(v11);
  snprintf(__str, 0x400uLL, "%s/.%s.XXXXXXXX", v12, v7);
  dispatch_suspend((dispatch_object_t)qword_10003A908);
  if (qword_10003A978 != -1) {
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
  }
  if (byte_10003A980) {
    uint64_t v13 = mkstemp_dprotected_np(__str, 4, 0);
  }
  else {
    uint64_t v13 = mkstemp(__str);
  }
  int v17 = v13;
  if ((v13 & 0x80000000) != 0)
  {
    uint64_t v18 = *__error();
LABEL_30:
    sub_100014E8C();
    int v14 = a1;
    int v15 = xdict;
    unsigned int v16 = v18;
    goto LABEL_31;
  }

  if (_os_trace_writev(v13, v24, 1LL) != -1)
  {
    if (fchmod(v17, 0x1A4u) == -1)
    {
      int v19 = __error();
      _os_assumes_log(*v19);
    }

    if (close(v17) != -1) {
      goto LABEL_21;
    }
    int v20 = *__error();
    tm v8 = *__error();
    if (v20 != 9)
    {
      _os_assumes_log(v8);
LABEL_21:
      if (rename(__str, (const char *)__b) == -1)
      {
        dispatch_time_t v21 = __error();
        _os_assumes_log(*v21);
      }

      if (v5 == 1) {
        sub_10000BD00();
      }
      uint64_t v18 = 0;
      goto LABEL_30;
    }

    goto LABEL_38;
  }

  uint64_t v18 = *__error();
  if (close(v17) != -1)
  {
LABEL_28:
    if (unlink(__str) == -1)
    {
      __int128 v23 = __error();
      _os_assumes_log(*v23);
    }

    goto LABEL_30;
  }

  char v22 = *__error();
  tm v8 = *__error();
  if (v22 != 9)
  {
    _os_assumes_log(v8);
    goto LABEL_28;
  }

LABEL_39:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = v8;
  __break(1u);
}

      __break(0x5500u);
      goto LABEL_40;
    }

    int v17 = *(void *)(v3 + 96);
    if (*(_DWORD *)(v3 + 64) > *(_DWORD *)(v3 + 92) || *(void *)(v3 + 56) > v17)
    {
      uint64_t v18 = openat(dword_10002DBF8, *(const char **)(v3 + 8), 1048832);
      if ((_DWORD)v18 == -1)
      {
        a1 = *__error();
      }

      else
      {
        int v19 = v18;
        if ((v18 & 0x80000000) != 0) {
          goto LABEL_27;
        }
        sub_100012D08(v3, 0, 0x7FFFFFFFFFFFFFFFLL, v17, v18);
        if (close(v19) != -1) {
          goto LABEL_27;
        }
        unint64_t v25 = *__error();
        a1 = *__error();
        if (v25 == 9)
        {
LABEL_40:
          qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_10002DF78 = a1;
          __break(1u);
          return;
        }
      }

      _os_assumes_log(a1);
    }

void sub_10000C888(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL
    || (uint64_t v5 = uint64, (string = xpc_dictionary_get_string(xdict, "prefs_name")) == 0LL)
    || (int v7 = string, strchr(string, 47))
    || strlen(v7) >= 0x100)
  {
    sub_10000BC48(a1, xdict, 22);
    return;
  }

  tm v8 = memset(__b, 170, sizeof(__b));
  if (~(unint64_t)qword_1000293E8 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_16;
  }

  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_16:
    __break(1u);
    return;
  }

  uint64_t v9 = (const char *)qword_1000293E8[v5];
  uint64_t v10 = (const char *)_os_trace_prefsdir_path(v8);
  if (!unlink(__b))
  {
    dispatch_suspend((dispatch_object_t)qword_10003A908);
    if (v5 == 1) {
      sub_10000BD00();
    }
    sub_100014E8C();
  }

  sub_10000BC48(a1, xdict, 0);
}

void sub_10000CA08(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    sub_10000BC48(a1, xdict, 22);
    return;
  }

  uint64_t v5 = uint64;
  BOOL v6 = memset(__b, 170, sizeof(__b));
  if (~(unint64_t)qword_1000293E8 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_11;
  }

  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_11:
    __break(1u);
    return;
  }

  int v7 = (const char *)qword_1000293E8[v5];
  tm v8 = (const char *)_os_trace_prefsdir_path(v6);
  dispatch_suspend((dispatch_object_t)qword_10003A908);
  removefile(__b, 0LL, 3u);
  if (v5 == 1) {
    sub_10000BD00();
  }
  sub_100014E8C();
  sub_10000BC48(a1, xdict, 0);
}

void sub_10000CB6C(_xpc_connection_s *a1, void *a2)
{
  if (xpc_connection_get_euid(a1))
  {
    sub_10000BC48(a1, a2, 1);
    return;
  }

  if (qword_10003A7D8 != -1) {
    dispatch_once(&qword_10003A7D8, &stru_100028FE0);
  }
  dispatch_sync((dispatch_queue_t)qword_10003A7E0, &stru_100028EC0);
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "purge");
  uint64_t v5 = uint64;
  if ((uint64 & 1) != 0)
  {
    sub_1000121DC((uint64_t)qword_10002C398);
    sub_1000121DC((uint64_t)&qword_10002CD58);
    sub_1000121DC((uint64_t)&qword_10002D238);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1000121DC((uint64_t)&unk_10002D718);
      if ((v5 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  else if ((uint64 & 2) == 0)
  {
    goto LABEL_7;
  }

  sub_1000121DC((uint64_t)&qword_10002C878);
  if ((v5 & 4) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v5 & 0x10) != 0) {
LABEL_9:
  }
    sub_100013AC0();
LABEL_10:
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "All logs erased (mask:%llx)", v5);
  sub_10000B70C((uint64_t)__b);
  sub_10000BC48(a1, a2, 0);
}

void sub_10000CD00(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply) {
    return;
  }
  pid_t v4 = reply;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  uint64_t v5 = (const char *)qword_10003A958;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v24 = v6;
  __int128 v25 = v6;
  xpc_connection_get_audit_token(a1, &v24);
  int v7 = open(v5, 0);
  if (v7 == -1)
  {
    uint64_t v18 = *__error();
  }

  else
  {
    int v8 = v7;
    xpc_dictionary_set_fd(v4, "persistdir_fd", v7);
    if (close(v8) != -1) {
      goto LABEL_6;
    }
    int v19 = *__error();
    uint64_t v18 = *__error();
    if (v19 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = v18;
      __break(1u);
      goto LABEL_32;
    }
  }

  _os_assumes_log(v18);
LABEL_6:
  __int128 v22 = v24;
  __int128 v23 = v25;
  uint64_t v9 = (char *)sandbox_extension_issue_file_to_process("com.apple.logd.read-only", v5, 0LL, &v22);
  if (v9) {
    xpc_dictionary_set_string(v4, "persistdir_sbext", v9);
  }
  free(v9);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  uint64_t v10 = qword_10003A960;
  int v11 = open((const char *)qword_10003A960, 0);
  if (v11 == -1)
  {
    uint64_t v18 = *__error();
    goto LABEL_28;
  }

  int v12 = v11;
  xpc_dictionary_set_fd(v4, "timesyncdir_fd", v11);
  if (close(v12) != -1) {
    goto LABEL_12;
  }
  int v20 = *__error();
  uint64_t v18 = *__error();
  if (v20 == 9)
  {
LABEL_32:
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v18;
    __break(1u);
    goto LABEL_33;
  }

void sub_10000D09C(_xpc_connection_s *a1, void *a2)
{
}

void sub_10000D14C(_xpc_connection_s *a1, void *a2)
{
}

void sub_10000D18C(_xpc_connection_s *a1, xpc_object_t original)
{
  if (qword_10003A9A8 != -1) {
    dispatch_once(&qword_10003A9A8, &stru_10002A568);
  }
  if (!byte_10002DF3C)
  {
    uuid = xpc_dictionary_get_uuid(original, "uuid");
    if (!uuid || (__int128 v6 = (unsigned __int8 *)uuid, (int64 = xpc_dictionary_get_int64(original, "source")) == 0))
    {
      int v4 = 22;
      goto LABEL_9;
    }

    sub_10000E15C(v6, 0LL, 0LL, int64);
  }

  int v4 = 0;
LABEL_9:
  sub_10000BC48(a1, original, v4);
}

void sub_10000D240()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "operation", 0xAuLL);
  if (qword_10003A7F0 != -1) {
    dispatch_once(&qword_10003A7F0, &stru_100029080);
  }
  xpc_connection_send_message((xpc_connection_t)qword_10003A7E8, v0);
  xpc_release(v0);
}

void sub_10000D2B8(_xpc_connection_s *a1, void *a2)
{
  pid_t pid = xpc_connection_get_pid(a1);
  if (proc_pidpath(pid, __b, 0x400u) <= 0) {
    strcpy((char *)__b, "<unknown>");
  }
  memset(&v33[24], 170, 0x400uLL);
  *(void *)&v33[16] = 0xAA00000000000000LL;
  *(void *)int v33 = &v33[24];
  *(void *)&v33[8] = 0x40000000000LL;
  sub_100005E78(v33, "--- !logd flush-buffers record\n", v5, v6, v7, v8, v9, v10, v30);
  sub_100005E78(v33, "client : %s\n", v11, v12, v13, v14, v15, v16, (char)__b);
  sub_100005E78(v33, "time   : ", v17, v18, v19, v20, v21, v22, v31);
  time_t v23 = time(0LL);
  sub_100006000((tm *)v33, v23);
  sub_100005E78(v33, "\n\n", v24, v25, v26, v27, v28, v29, v32);
  sub_100007370();
  if ((v33[20] & 1) != 0) {
    free(*(void **)v33);
  }
  __b[0] = _NSConcreteStackBlock;
  __b[1] = 0x40000000LL;
  __b[2] = sub_10000FBC8;
  __b[3] = &unk_1000297F8;
  __b[4] = qword_10002C398;
  dispatch_async((dispatch_queue_t)qword_10002C398[0], __b);
  __b[0] = _NSConcreteStackBlock;
  __b[1] = 0x40000000LL;
  __b[2] = sub_10000FBC8;
  __b[3] = &unk_1000297F8;
  __b[4] = &qword_10002C878;
  dispatch_async((dispatch_queue_t)qword_10002C878, __b);
  __b[0] = _NSConcreteStackBlock;
  __b[1] = 0x40000000LL;
  __b[2] = sub_10000FBC8;
  __b[3] = &unk_1000297F8;
  __b[4] = &qword_10002CD58;
  dispatch_async((dispatch_queue_t)qword_10002CD58, __b);
  __b[0] = _NSConcreteStackBlock;
  __b[1] = 0x40000000LL;
  __b[2] = sub_10000FBC8;
  __b[3] = &unk_1000297F8;
  __b[4] = &qword_10002D238;
  dispatch_async((dispatch_queue_t)qword_10002D238, __b);
  dispatch_async_and_wait((dispatch_queue_t)qword_10002C398[0], &stru_100029858);
  if ((unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFFB20LL
    || (dispatch_async_and_wait((dispatch_queue_t)qword_10002C878, &stru_100029858),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF640LL)
    || (dispatch_async_and_wait((dispatch_queue_t)qword_10002CD58, &stru_100029858),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF160LL)
    || (dispatch_async_and_wait((dispatch_queue_t)qword_10002D238, &stru_100029858),
        dispatch_async_and_wait((dispatch_queue_t)off_10002C3A0[2], &stru_100029898),
        dispatch_async_and_wait((dispatch_queue_t)off_10002C880[2], &stru_100029898),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF640LL)
    || (dispatch_async_and_wait((dispatch_queue_t)off_10002CD60[2], &stru_100029898),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF160LL))
  {
LABEL_14:
    __break(0x5513u);
  }

  dispatch_async_and_wait((dispatch_queue_t)off_10002D240[2], &stru_100029898);
  sub_10000BC48(a1, a2, 0);
}

void sub_10000D5AC(id a1)
{
  if (byte_10003A88D == 1)
  {
    os_map_str_clear(&unk_10003A890, &stru_100029468);
    word_10003A8A8 = ~word_10003A8A8 | 0xFFFE;
  }

BOOL sub_10000D5F4(id a1, const char *a2, void *a3)
{
  return 1;
}

void sub_10000D610(id a1)
{
  qword_10003A8C0 = (uint64_t)dispatch_queue_create("com.apple.logd.syslog", 0LL);
}

void sub_10000D638()
{
  if (qword_10003A8B8 != -1) {
    dispatch_once(&qword_10003A8B8, &stru_1000294E8);
  }
  dispatch_async_and_wait((dispatch_queue_t)qword_10003A8C0, &stru_1000294A8);
}

void sub_10000D680(id a1)
{
  size_t cnt = 0xAAAAAAAAAAAAAAAALL;
  fds = (int *)0xAAAAAAAAAAAAAAAALL;
  word_10003A8A8 = -1;
  os_map_str_init(&unk_10003A890, 0LL, 1LL);
  if (launch_activate_socket("BSDSystemLogger", &fds, &cnt))
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Failed to open syslog socket: %d");
LABEL_6:
    sub_10000B70C((uint64_t)__b);
    return;
  }

  if (cnt != 1)
  {
    if (!cnt)
    {
      memset(&__b[2], 170, 0x3E0uLL);
      strcpy((char *)__b, "Syslog socket fd array is empty");
      goto LABEL_6;
    }

    _os_assumes_log(0LL);
  }

  uintptr_t v1 = *fds;
  free(fds);
  if ((v1 & 0x80000000) != 0)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Invalid syslog socket fd: %d");
    goto LABEL_6;
  }

  uint64_t v8 = 0x20000LL;
  if (setsockopt(v1, 0xFFFF, 4098, &v8, 8u) == -1)
  {
    int v2 = __error();
    _os_assumes_log(*v2);
    if (close(v1) != -1) {
      return;
    }
    LODWORD(v1) = *__error();
    uint64_t v3 = *__error();
    if ((_DWORD)v1 != 9) {
      goto LABEL_21;
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v3;
    __break(1u);
LABEL_19:
    int v4 = __error();
    _os_assumes_log(*v4);
    if (close(v1) != -1) {
      return;
    }
    int v5 = *__error();
    uint64_t v3 = *__error();
    if (v5 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = v3;
      __break(1u);
      return;
    }

LABEL_21:
    _os_assumes_log(v3);
    return;
  }

  if (fcntl(v1, 4, 4LL) == -1) {
    goto LABEL_19;
  }
  if (qword_10003A8B8 != -1) {
    dispatch_once(&qword_10003A8B8, &stru_1000294E8);
  }
  qword_10003A8B0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v1,  0LL,  (dispatch_queue_t)qword_10003A8C0);
  *(void *)&__b[0] = _NSConcreteStackBlock;
  *((void *)&__b[0] + 1) = 0x40000000LL;
  *(void *)&__b[1] = sub_10000D98C;
  *((void *)&__b[1] + 1) = &unk_100029508;
  LODWORD(__b[2]) = v1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003A8B0, __b);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_10000DAF4;
  handler[3] = &unk_100029528;
  int v7 = v1;
  dispatch_source_set_cancel_handler((dispatch_source_t)qword_10003A8B0, handler);
  dispatch_resume((dispatch_object_t)qword_10003A8B0);
  byte_10003A88D = 1;
}

  qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Allocating buffer failed";
  qword_10002DF78 = (int)v4;
  __break(1u);
}

  objc_autoreleasePoolPop(v2);
  uint64_t v11 = v1;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Salt"]);
  if ([v12 isNSNumber])
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Salt"]);
    uint64_t v14 = [v13 unsignedLongLongValue];

    if (v14) {
      goto LABEL_28;
    }
  }

  else
  {
  }

  *(void *)&__b[0] = 0LL;
  do
    arc4random_buf(__b, 8uLL);
  while (!*(void *)&__b[0]);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___NSNumber);
  uint64_t v16 = -[NSNumber initWithUnsignedLongLong:](v15, "initWithUnsignedLongLong:", *(void *)&__b[0]);
  [v11 setObject:v16 forKeyedSubscript:@"Salt"];

  sub_100005B68(v11);
LABEL_28:
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Salt"]);
  uint64_t v18 = [v17 unsignedLongLongValue];

  if (!v18)
  {
    char v31 = _os_assert_log(0LL);
    _os_crash(v31);
    __break(1u);
LABEL_47:
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
    goto LABEL_32;
  }

  qword_10003A900 = (uint64_t)v18;

  sub_1000136EC(dword_10002DBF8, off_10002DDB8);
  sub_1000136EC(dword_10002DBF8, off_10002DD28);
  sub_1000136EC(dword_10002DBF8, off_10002DC08);
  uint64_t v19 = sub_1000136EC(dword_10002DBF8, off_10002DC98);
  int is_development_build = _os_trace_is_development_build(v19);
  xmmword_10003A930 = xmmword_100024890;
  qword_10003A940 = 3LL;
  qword_10003A948 = 0x3FE0000000000000LL;
  word_10003A950 = 0;
  byte_10003A952 = 0;
  uint64_t v21 = (const char *)_os_trace_sysprefsdir_path(is_development_build);
  sub_1000126E8(v21);
  time_t v23 = _os_trace_is_development_build(v22);
  if ((_DWORD)v23)
  {
    uint64_t v24 = (const char *)_os_trace_intprefsdir_path();
    sub_1000126E8(v24);
  }

  uint64_t v25 = (const char *)_os_trace_prefsdir_path(v23);
  sub_1000126E8(v25);
  sub_1000138D8((uint64_t)&off_10002DDB0);
  sub_1000138D8((uint64_t)&off_10002DD20);
  sub_1000138D8((uint64_t)&off_10002DC00);
  sub_1000138D8((uint64_t)&off_10002DC90);
  uint64_t v11 = v11;
  if (qword_10003A978 != -1) {
    goto LABEL_47;
  }
LABEL_32:
  if (byte_10003A980)
  {
    sub_100017D48(v11, 0);

    notify_register_dispatch( "com.apple.mobile.keybagd.first_unlock",  &dword_10002DF08,  (dispatch_queue_t)qword_10003A8F8,  &stru_100029E88);
    if (!sub_10002256C()) {
      goto LABEL_37;
    }
    *(void *)&__b[0] = _NSConcreteStackBlock;
    *((void *)&__b[0] + 1) = 3221225472LL;
    *(void *)&__b[1] = sub_100017E80;
    *((void *)&__b[1] + 1) = &unk_100029EB0;
    *(void *)&__b[2] = &stru_100029E88;
    dispatch_async((dispatch_queue_t)qword_10003A8F8, __b);
    uint64_t v26 = *(void **)&__b[2];
  }

  else
  {
    sub_100017D48(v11, 1);
    uint64_t v26 = v11;
  }

LABEL_37:
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    dispatch_async_f((dispatch_queue_t)qword_10003A8F8, 0LL, (dispatch_function_t)sub_100017E90);
  }

  else
  {
    memset((char *)&__b[3] + 3, 170, 0x3CDuLL);
    strcpy((char *)__b, "CacheDelete not available - functioning without it");
    sub_10000B70C((uint64_t)__b);
  }

  uint64_t v27 = openat(dword_10002DBF8, "logdata.statistics.0.txt", 778, 420LL);
  dword_10002C348 = v27;
  if ((_DWORD)v27 == -1)
  {
    uint64_t v29 = __error();
    _os_assumes_log(*v29);
    uint64_t v27 = dword_10002C348;
  }

  dword_10002C348 = sub_100006154(v27, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000LL);
  uint64_t v28 = openat(dword_10002DBF8, "logdata.statistics.0.jsonl", 778, 420LL);
  dword_10002C34C = v28;
  if ((_DWORD)v28 == -1)
  {
    char v30 = __error();
    _os_assumes_log(*v30);
    uint64_t v28 = dword_10002C34C;
  }

  dword_10002C34C = sub_100006154(v28, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880LL);
}

void sub_10000D98C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  memset(__b, 170, sizeof(__b));
  *(void *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  *(sockaddr *)((char *)v14 + 1sub_100021ACC(qword_10003A798, 0) = v2;
  sockaddr v13 = v2;
  v14[0] = v2;
  sockaddr v11 = v2;
  sockaddr v12 = v2;
  sockaddr v9 = v2;
  sockaddr v10 = v2;
  socklen_t v5 = 106;
  ssize_t v3 = recvfrom(v1, __b, 0x1000uLL, 0, &v9, &v5);
  if (v3 >= 1)
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v7[5] = v4;
    v7[6] = v4;
    v7[3] = v4;
    v7[4] = v4;
    v7[1] = v4;
    v7[2] = v4;
    v7[0] = v4;
    if (_os_log_simple_parse(__b, v3, v7))
    {
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Unable to parse os_log_simple buffer. Error: %d Received: %zd");
    }

    else
    {
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Unable to mirror error: %d pid: %llu message: %s");
    }

    sub_10000B70C((uint64_t)__str);
  }

uint64_t sub_10000DAF4(uint64_t a1)
{
  uint64_t result = close(*(_DWORD *)(a1 + 32));
  if ((_DWORD)result == -1)
  {
    int v2 = *__error();
    uint64_t result = *__error();
    if (v2 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = result;
      __break(1u);
    }

    else
    {
      return _os_assumes_log(result);
    }
  }

  return result;
}

size_t sub_10000DB64(char *a1)
{
  size_t v2 = strlen(*((const char **)a1 + 2)) + 1;
  ssize_t v3 = (const char *)*((void *)a1 + 1);
  if (v3) {
    size_t v4 = strlen(v3) + 1;
  }
  else {
    size_t v4 = 0LL;
  }
  size_t v5 = v4 + v2 + 12;
  BOOL v6 = __CFADD__(v4, v2 + 12);
  size_t result = 84LL;
  if (v2 < 0xFFFFFFFFFFFFFFF4LL && !v6)
  {
    size_t result = (size_t)calloc(1uLL, v5);
    if (v5 < 4
      || (v8 = result, *(_DWORD *)size_t result = 1, (v5 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      || ((*(_DWORD *)(result + 4) = v4, v5 >= 8) ? (BOOL v9 = (v5 & 0xFFFFFFFFFFFFFFFCLL) == 8) : (BOOL v9 = 1), v9))
    {
      __break(1u);
    }

    *(_DWORD *)(result + 8) = v2;
    if (!__CFADD__(result + 12, v4))
    {
      strlcpy((char *)(result + 12 + v4), *((const char **)a1 + 2), v2);
      sockaddr v10 = (const char *)*((void *)a1 + 1);
      if (v10) {
        strlcpy((char *)(v8 + 12), v10, v4);
      }
      sockaddr v11 = a1 + 104;
      *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v31[16] = v12;
      *(_OWORD *)&v31[32] = v12;
      __int128 v30 = v12;
      *(_OWORD *)char v31 = v12;
      __int128 v29 = v12;
      v31[40] = 0;
      int v13 = *((_DWORD *)a1 + 8);
      uint64_t v14 = *((void *)a1 + 5);
      *(void *)char v31 = v14;
      int v15 = *((_DWORD *)a1 + 12);
      DWORD1(v3sub_100021ACC(qword_10003A798, 0) = v13;
      HIDWORD(v3sub_100021ACC(qword_10003A798, 0) = v15;
      *(_OWORD *)&v31[8] = *(_OWORD *)(a1 + 88);
      *(_OWORD *)&v31[24] = *v11;
      memset(v28, 170, sizeof(v28));
      if (proc_pidpath(v13, v28, 0x400u) <= 0)
      {
        memset(v27, 170, sizeof(v27));
        snprintf((char *)v27, 0x400uLL, "Unable to get path for %d", v13);
        sub_10000B70C((uint64_t)v27);
        v28[0] = 0;
      }

      uint64_t v16 = sub_10000E15C((unsigned __int8 *)a1 + 88, v28, 0LL, 1);
      uint64_t v17 = 0LL;
      v27[27] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v27[25] = v18;
      *(_OWORD *)&v27[23] = v18;
      *(_OWORD *)&v27[21] = v18;
      *(_OWORD *)&v27[19] = v18;
      *(_OWORD *)&v27[17] = v18;
      *(_OWORD *)&v27[15] = v18;
      *(_OWORD *)&v27[13] = v18;
      *(_OWORD *)&v27[11] = v18;
      v27[0] = 24580LL;
      char v19 = *a1;
      v27[1] = v5 + 72;
      v27[2] = v14;
      uint64_t v20 = *((void *)a1 + 3);
      LODWORD(v27[3]) = v15;
      BYTE4(v27[3]) = 0;
      BYTE5(v27[3]) = v19;
      HIWORD(v27[3]) = 0;
      v27[4] = v20;
      *(_OWORD *)&v27[5] = *(_OWORD *)(a1 + 56);
      *(_OWORD *)&v27[7] = *(_OWORD *)(a1 + 72);
      *(_OWORD *)&v27[9] = *v11;
      unsigned int v21 = *(_DWORD *)(v8 + 4);
      if (v21 < 2) {
        goto LABEL_28;
      }
      size_t v22 = *(_DWORD *)(v8 + 4);
      __chkstk_darwin(v16);
      uint64_t v17 = (char *)v27 - v23;
      memset((char *)v27 - v23, 170, v24);
      LOWORD(v25) = os_map_str_find(&unk_10003A890, *((void *)a1 + 1));
      if (!(_WORD)v25)
      {
        uint64_t v25 = (unsigned __int16)word_10003A8A8;
        word_10003A8A8 -= 2;
        uint64_t v26 = strdup(*((const char **)a1 + 1));
        os_map_str_insert(&unk_10003A890, v26, v25);
      }

      v17[2] = v21;
      v17[3] = 1;
      size_t result = strlcpy(v17 + 4, *((const char **)a1 + 1), v22);
      if (!__CFADD__(v17 + 4, v22))
      {
        v17[v22 + 4] = 0;
        *(_WORD *)uint64_t v17 = v25;
LABEL_28:
        sub_10000EB30((uint64_t)v27, v8, v5, (uint64_t)&v29, (uint64_t)v28, 0, (uint64_t)v17);
        free((void *)v8);
        return 0LL;
      }
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t sub_10000DEDC()
{
  uint64_t v0 = qword_10003A8D0;
  int v1 = operator new(0x28uLL);
  *int v1 = 0u;
  v1[1] = 0u;
  *((_DWORD *)v1 + 8) = 1065353216;
  qword_10003A8D0 = (uint64_t)v1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A8C8);
  for (uint64_t i = *(unsigned __int8 **)(v0 + 16); i; uint64_t i = *(unsigned __int8 **)i)
  {
    memset(__b, 170, sizeof(__b));
    sub_10002269C(i + 16, 1u, __b);
    utimes(__b, 0LL);
  }

  return v0;
}

void sub_10000DFB4()
{
  if (qword_10003A9A8 != -1) {
    dispatch_once(&qword_10003A9A8, &stru_10002A568);
  }
  if (byte_10002DF3C)
  {
    uint64_t v1 = 0LL;
    size_t v2 = (unsigned __int8 *)&v1;
    uint64_t v3 = 0x2800000000LL;
    v4[0] = 0xAAAAAAAAAAAAAAAALL;
    v4[1] = 0xAAAAAAAAAAAAAAAALL;
    sub_100022A98((unsigned __int8 *)v4);
    if (!sub_1000228B4(v2 + 24))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = sub_10000E0F0;
      block[3] = &unk_100029550;
      block[4] = &v1;
      dispatch_async((dispatch_queue_t)qword_10003A8D8, block);
    }

    _Block_object_dispose(&v1, 8);
  }

  else
  {
    sub_10000E15C(byte_10003A7F9, 0LL, 0LL, 2);
  }

void sub_10000E0F0(uint64_t a1)
{
  uint64_t v1 = (const unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "operation", 3uLL);
  xpc_dictionary_set_uuid(v2, "uuid", v1);
  sub_100009184(v2, 1);
  xpc_release(v2);
}

uint64_t sub_10000E15C(unsigned __int8 *a1, const char *a2, xpc_object_t xdict, int a4)
{
  if (!xdict)
  {
    uint64_t v8 = 0LL;
LABEL_11:
    memset(__b, 170, sizeof(__b));
    uint64_t v20 = 0LL;
    unsigned int v21 = &v20;
    uint64_t v22 = 0x83000000000LL;
    memset(v23, 170, 0x810uLL);
    v23[2064] = 0;
    if (qword_10003A9A8 == -1)
    {
      if ((a4 & 2) == 0) {
        goto LABEL_19;
      }
    }

    else
    {
      dispatch_once(&qword_10003A9A8, &stru_10002A568);
      if ((a4 & 2) == 0) {
        goto LABEL_19;
      }
    }

    if (byte_10002DF3C)
    {
LABEL_14:
      uint64_t v11 = 0LL;
LABEL_15:
      _Block_object_dispose(&v20, 8);
      return v11;
    }

LABEL_19:
    if ((a4 & 1) != 0 && (!a2 || !*a2)) {
      goto LABEL_14;
    }
    if (sub_10000E464(a1))
    {
LABEL_23:
      uint64_t v11 = 1LL;
      goto LABEL_15;
    }

    uuid_copy((unsigned __int8 *)v21 + 24, a1);
    if (a2)
    {
      int v13 = (char *)(v21 + 5);
      if ((a4 & 0xC) != 0)
      {
        __stringp[0] = (char *)(v21 + 133);
        strlcpy((char *)v21 + 1064, a2, 0x400uLL);
        strsep(__stringp, "/");
        if (__stringp[0]) {
          uint64_t v14 = __stringp[0];
        }
        else {
          uint64_t v14 = a2;
        }
        strlcpy(v13, v14, 0x400uLL);
      }

      else
      {
        __strlcpy_chk(v21 + 5, a2, 1024LL, 1024LL);
      }
    }

    else
    {
      *((_BYTE *)v21 + 4sub_100021ACC(qword_10003A798, 0) = 0;
    }

    uint64_t v15 = sub_10002269C((unsigned __int8 *)v21 + 24, 1u, __b);
    if ((a4 & 0x100) != 0)
    {
      boot_uuid = (const void *)_os_trace_get_boot_uuid(v15);
      if (!setxattr(__b, "com.apple.uuiddb.boot-uuid", boot_uuid, 0x25uLL, 0, 0)) {
        goto LABEL_14;
      }
    }

    else if (!access(__b, 0))
    {
      *((_BYTE *)v21 + 2088) = 1;
      if ((a4 & 8) == 0)
      {
        sub_10000E4B4((uint64_t *)a1);
        goto LABEL_23;
      }
    }

    if (v8)
    {
      xpc_retain(v8);
      uint64_t v17 = (char *)os_transaction_create("com.apple.logd.uuiddb");
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    __stringp[0] = (char *)_NSConcreteStackBlock;
    __stringp[1] = (char *)0x40000000;
    __stringp[2] = (char *)sub_10000E4F8;
    __stringp[3] = (char *)&unk_1000295D8;
    int v19 = a4;
    __stringp[4] = (char *)&v20;
    __stringp[5] = (char *)v8;
    __stringp[6] = v17;
    dispatch_async((dispatch_queue_t)qword_10003A8D8, __stringp);
    goto LABEL_14;
  }

  if ((a4 & 1) == 0) {
    __assert_rtn("_logd_uuiddb_harvest", "logd_uuiddb.c", 322, "opts & LOGD_HARVEST_UUID_MACHO");
  }
  xpc_object_t array = xpc_dictionary_get_array(xdict, "sections");
  if (array)
  {
    uint64_t v8 = array;
    if (xpc_array_get_count(array) == 5)
    {
      size_t v9 = 0LL;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(v8, v9);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_data) {
          break;
        }
        if (++v9 == 5) {
          goto LABEL_11;
        }
      }
    }
  }

  return 0LL;
}

    __break(0x5500u);
  }

  int v19 = *(const char **)(a2 + 48);
  uint64_t v20 = *(const void **)(a1 + 112);
  *(void *)&v47[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&unsigned int v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t value = v21;
  *(_OWORD *)uint8x8_t v47 = v21;
  if (getxattr(v19, "com.apple.uuiddb.boot-uuid", &value, 0x25uLL, 0, 0) == 37 && !memcmp(&value, v20, 0x25uLL))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    int8x8_t v41 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v42 = *(void *)(v41 + 24);
    uint64_t v16 = __OFADD__(v42, v7);
    uint64_t v43 = v42 + v7;
    if (v16) {
      goto LABEL_19;
    }
    *(void *)(v41 + 24) = v43;
    return sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL),  "    - %s: %lld bytes LOCKED\n",  v22,  v23,  v24,  v25,  v26,  v27,  (char)out);
  }

  else if (*(void *)(*(void *)(a2 + 96) + 64LL) >= *(void *)(a1 + 120))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    int v35 = *(void *)(*(void *)(a1 + 80) + 8LL);
    unint64_t v36 = *(void *)(v35 + 24);
    uint64_t v16 = __OFADD__(v36, v7);
    unint64_t v37 = v36 + v7;
    if (v16) {
      goto LABEL_19;
    }
    *(void *)(v35 + 24) = v37;
    return sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL),  "    - %s: %lld bytes RECENT\n",  v22,  v23,  v24,  v25,  v26,  v27,  (char)out);
  }

  else
  {
    size_t result = unlink(*(const char **)(a2 + 48));
    if ((_DWORD)result)
    {
      if ((_DWORD)result == -1)
      {
        int v34 = __error();
        return _os_assumes_log(*v34);
      }
    }

    else
    {
      size_t v38 = *(void *)(*(void *)(a1 + 88) + 8LL);
      int v39 = *(void *)(v38 + 24);
      uint64_t v16 = __OFADD__(v39, v7);
      uint64_t v40 = v39 + v7;
      if (v16) {
        goto LABEL_19;
      }
      *(void *)(v38 + 24) = v40;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
      return sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL),  "    - %s: %lld bytes REMOVED\n",  v28,  v29,  v30,  v31,  v32,  v33,  (char)out);
    }
  }

  return result;
}

BOOL sub_10000E464(void *a1)
{
  BOOL v2 = sub_100020A8C((void *)qword_10003A8D0, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A8C8);
  return v2;
}

void sub_10000E4B4(uint64_t *a1)
{
}

void sub_10000E4F8(uint64_t a1)
{
  if (!utimes(__b, 0LL)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 2088LL) = 1;
  }
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if ((v2 & 8) == 0)
  {
    if (!*(_BYTE *)(v3 + 2088))
    {
      if ((v2 & 2) != 0)
      {
        xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_object_t v5 = v11;
        uint64_t v12 = 2LL;
      }

      else
      {
        if ((v2 & 0x400) == 0)
        {
          size_t v4 = *(void **)(a1 + 40);
          xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_uint64(v5, "operation", 4uLL);
          xpc_dictionary_set_string(v5, "path", (const char *)(v3 + 40));
          xpc_dictionary_set_uuid(v5, "uuid", (const unsigned __int8 *)(v3 + 24));
          if (v4) {
            xpc_dictionary_set_value(v5, "sections", v4);
          }
          if ((v2 & 0x200) != 0) {
            xpc_dictionary_set_BOOL(v5, "fake_uuid", 1);
          }
          if ((v2 & 4) == 0) {
            goto LABEL_23;
          }
          xpc_dictionary_set_string(v5, "role", (const char *)(v3 + 1064));
          BOOL v6 = "ftab";
          int v7 = v5;
          BOOL v8 = 1;
          goto LABEL_19;
        }

        xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_object_t v5 = v11;
        uint64_t v12 = 11LL;
      }

      xpc_dictionary_set_uint64(v11, "operation", v12);
      xpc_dictionary_set_uuid(v5, "uuid", (const unsigned __int8 *)(v3 + 24));
      goto LABEL_23;
    }

LABEL_15:
    unsigned int v9 = 0;
    goto LABEL_24;
  }

  if (*(_BYTE *)(v3 + 2088))
  {
    if (sub_10000E464((void *)(v3 + 24))) {
      goto LABEL_15;
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    BOOL v10 = *(_BYTE *)(v3 + 2088) != 0;
  }

  else
  {
    BOOL v10 = 0;
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "operation", 5uLL);
  xpc_dictionary_set_uuid(v5, "uuid", (const unsigned __int8 *)(v3 + 24));
  xpc_dictionary_set_string(v5, "path", (const char *)(v3 + 40));
  xpc_dictionary_set_string(v5, "role", (const char *)(v3 + 1064));
  BOOL v6 = "coproc_free_only";
  int v7 = v5;
  BOOL v8 = v10;
LABEL_19:
  xpc_dictionary_set_BOOL(v7, v6, v8);
LABEL_23:
  unsigned int v9 = sub_100009184(v5, 1);
  xpc_release(v5);
LABEL_24:
  if (*(void *)(a1 + 40))
  {
    os_release(*(void **)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }

  if (!v9 || (*(_BYTE *)(a1 + 56) & 4) != 0) {
    sub_10000E4B4((uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  }
}

void sub_10000E810(_OWORD *a1)
{
  *(_OWORD *)uint64_t v3 = *a1;
  if (!sub_1000228B4(v3))
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 0x40000000LL;
    v1[2] = sub_10000E8AC;
    v1[3] = &unk_100029570;
    __int128 v2 = *(_OWORD *)v3;
    dispatch_async((dispatch_queue_t)qword_10003A8D8, v1);
  }

void sub_10000E8AC(uint64_t a1)
{
  uint64_t v1 = (const unsigned __int8 *)(a1 + 32);
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "operation", 1uLL);
  xpc_dictionary_set_uuid(v2, "uuid", v1);
  signed int v3 = sub_100009184(v2, 1);
  xpc_release(v2);
  if (v3) {
    _os_assumes_log(v3);
  }
}

void sub_10000E928()
{
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
  qword_10003A8D8 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.uuid.harvest", v0, 0LL);
  uint64_t v1 = operator new(0x28uLL);
  *uint64_t v1 = 0u;
  v1[1] = 0u;
  *((_DWORD *)v1 + 8) = 1065353216;
  qword_10003A8D0 = (uint64_t)v1;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (qword_10003A9A8 != -1) {
    dispatch_once(&qword_10003A9A8, &stru_10002A568);
  }
  if (!byte_10002DF3C) {
    dispatch_async_f((dispatch_queue_t)qword_10003A8D8, 0LL, (dispatch_function_t)sub_10000EA24);
  }
}

void sub_10000EA24()
{
  CFArrayRef v0 = CFArrayCreate(kCFAllocatorDefault, (const void **)&off_10002C390, 1LL, &kCFTypeArrayCallBacks);
  if (v0)
  {
    CFArrayRef v1 = v0;
    __int128 v2 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0LL, v0);
    if (v2)
    {
      signed int v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFDictionaryGetTypeID()) {
        CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_10000EAC8, 0LL);
      }
      CFRelease(v3);
    }

    CFRelease(v1);
  }

CFDataRef sub_10000EAC8(int a1, CFDictionaryRef theDict)
{
  size_t result = (const __CFData *)CFDictionaryGetValue(theDict, @"OSBundleTextUUID");
  if (result)
  {
    signed int v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    size_t result = (const __CFData *)CFDataGetTypeID();
    if ((const __CFData *)v4 == result)
    {
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v3);
      return (const __CFData *)sub_10000E15C(BytePtr, 0LL, 0LL, 258);
    }
  }

  return result;
}

void sub_10000EB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  v15[0] = a2;
  v15[1] = a3;
  if (a6 >= 6)
  {
    __break(0x5512u);
LABEL_8:
    __break(0x5513u);
  }

  unsigned int v9 = &qword_10002C398[156 * a6];
  BOOL v10 = (dispatch_queue_s *)*v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100011C34;
  block[3] = &unk_1000296E8;
  block[4] = a1;
  void block[5] = v9;
  void block[6] = 1LL;
  void block[7] = v15;
  block[8] = a4;
  block[9] = a7;
  dispatch_sync(v10, block);
  uint64_t v11 = v9[1];
  if (v11) {
    uint64_t v12 = (dispatch_queue_s **)(v11 + 16);
  }
  else {
    uint64_t v12 = (dispatch_queue_s **)v9;
  }
  int v13 = *v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000LL;
  _OWORD v14[2] = sub_10000EC5C;
  v14[3] = &unk_1000295F8;
  v14[4] = a1;
  v14[5] = v9;
  v14[6] = a5;
  dispatch_sync(v13, v14);
}

void sub_10000EC5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL) + 16LL;
  sub_100006430(v1, *(const void **)(a1 + 48), &v2);
}

void sub_10000ECC0()
{
  qword_10003A8E0 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.logd.eventlog", 0LL, 0LL);
  mach_service = xpc_connection_create_mach_service("com.apple.logd.events", (dispatch_queue_t)qword_10003A8E0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100029638);
  xpc_connection_activate(mach_service);
  qword_10003A8E8 = (uint64_t)mach_service;
}

void sub_10000ED28(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_10000ED88((_xpc_connection_s *)a2);
  }

  else
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_10002DF78 = (uint64_t)type;
    __break(1u);
  }

void sub_10000ED88(_xpc_connection_s *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000LL;
  v2[2] = sub_10000EE28;
  v2[3] = &unk_100029688;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_10003A8E0);
  xpc_connection_activate(a1);
}

#error "10000EEC8: switch analysis failed: switch information is incomplete or incorrect (funcsize=51)"
BOOL sub_10000EF04(_xpc_connection_s *a1, xpc_object_t xdict)
{
  xpc_object_t array;
  char uint64;
  uint64_t v6;
  BOOL result;
  char v8;
  __int128 v9;
  pid_t pid;
  void applier[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE *v18;
  char v19;
  char v20;
  _BYTE __b[1024];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  xpc_object_t array = xpc_dictionary_get_array(xdict, "entries");
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "ttl");
  BOOL v6 = xpc_dictionary_get_uint64(xdict, "aid");
  size_t result = xpc_dictionary_get_BOOL(xdict, "quarantined");
  if ((_DWORD)result) {
    BOOL v8 = 3;
  }
  else {
    BOOL v8 = 1;
  }
  if (array)
  {
    *(void *)&unsigned int v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = v9;
    uint64_t v26 = v9;
    uint64_t v23 = v9;
    size_t v24 = v9;
    uint64_t v22 = v9;
    memset(__b, 170, sizeof(__b));
    size_t result = sub_10000F6C4((uint64_t)a1, xdict, (uint64_t)&v22);
    if ((_DWORD)result)
    {
      pid_t pid = xpc_connection_get_pid(a1);
      if (proc_pidpath(pid, __b, 0x400u) <= 0) {
        __b[0] = 0;
      }
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000LL;
      applier[2] = sub_10000F814;
      applier[3] = &unk_1000296A8;
      uint64_t v14 = v24;
      uint64_t v15 = v25;
      uint64_t v16 = v26;
      int v13 = v23;
      uint64_t v12 = v22;
      int v19 = uint64;
      uint64_t v17 = v6;
      __int128 v18 = __b;
      uint64_t v20 = v8;
      return xpc_array_apply(array, applier);
    }
  }

  return result;
}

void sub_10000F08C(_xpc_connection_s *a1, void *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v65 = v4;
  __int128 v64 = v4;
  __int128 v63 = v4;
  __int128 v62 = v4;
  __int128 v61 = v4;
  __int128 v60 = v4;
  __int128 v59 = v4;
  __int128 v58 = v4;
  __int128 v57 = v4;
  __int128 v56 = v4;
  __int128 v55 = v4;
  __int128 v54 = v4;
  __int128 v53 = v4;
  __int128 v52 = v4;
  __int128 v51 = v4;
  __int128 v50 = v4;
  __int128 v49 = v4;
  __int128 v48 = v4;
  __int128 v47 = v4;
  __int128 v46 = v4;
  __int128 v45 = v4;
  __int128 v44 = v4;
  memset(__b, 170, sizeof(__b));
  int uint64 = xpc_dictionary_get_uint64(a2, "stream_id");
  BOOL v6 = xpc_dictionary_get_BOOL(a2, "quarantined");
  int v7 = uint64;
  uint64_t v8 = 4LL;
  switch(v7)
  {
    case 0:
      if (v6) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 0LL;
      }
      goto LABEL_12;
    case 1:
      if (v6) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 1LL;
      }
      goto LABEL_12;
    case 2:
      goto LABEL_12;
    case 4:
      if (v6) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
LABEL_12:
      pid_t pid = xpc_connection_get_pid(a1);
      if (proc_pidpath(pid, __b, 0x400u) < 1) {
        __b[0] = 0;
      }
      memset(__str, 170, 16);
      *(void *)&__int128 v44 = xpc_dictionary_get_data(a2, "commands", (size_t *)&__str[8]);
      *((void *)&v44 + 1) = *(void *)&__str[8];
      memset(__str, 170, 16);
      *(void *)&__int128 v45 = xpc_dictionary_get_data(a2, "pubdata", (size_t *)&__str[8]);
      *((void *)&v45 + 1) = *(void *)&__str[8];
      memset(__str, 170, 16);
      *(void *)&__int128 v46 = xpc_dictionary_get_data(a2, "privdata", (size_t *)&__str[8]);
      *((void *)&v46 + 1) = *(void *)&__str[8];
      if (*((void *)&v44 + 1) > 0x8000uLL
        || *((void *)&v45 + 1) > 0x8000uLL
        || *(void *)&__str[8] > 0x8000uLL
        || (unint64_t v12 = *((void *)&v44 + 1) + *(void *)&__str[8] + *((void *)&v45 + 1), v12 > 0x8000))
      {
        memset(__str, 170, sizeof(__str));
        snprintf(__str, 0x400uLL, "Received oversize message with invalid size: %zd, %zd, %zd");
LABEL_19:
        sub_10000B70C((uint64_t)__str);
      }

      else
      {
        *(void *)&__int128 v52 = 24578LL;
        *((void *)&v52 + 1) = v12 + 32;
        uint64_t v13 = v49;
        int v14 = HIDWORD(v48);
        char v15 = xpc_dictionary_get_uint64(a2, "ttl");
        uint64_t v16 = xpc_dictionary_get_uint64(a2, "ts");
        int v17 = xpc_dictionary_get_uint64(a2, "message_id");
        *(void *)&__int128 v53 = v13;
        DWORD2(v53) = v14;
        BYTE12(v53) = v15;
        *(_WORD *)((char *)&v53 + 13) = 0;
        HIBYTE(v53) = 0;
        *(void *)&__int128 v54 = v16;
        DWORD2(v54) = v17;
        WORD6(v54) = WORD4(v44) + WORD4(v45);
        HIWORD(v54) = WORD4(v46);
        memset(__str, 170, 16);
        data = (unsigned __int8 *)xpc_dictionary_get_data(a2, "subsystem", (size_t *)&__str[8]);
        uint64_t v19 = 0LL;
        if (data && *(void *)&__str[8] >= 4uLL)
        {
          else {
            uint64_t v19 = 0LL;
          }
        }

        if (1248 * v8 > ~(unint64_t)qword_10002C398)
        {
LABEL_36:
          __break(0x5513u);
          return;
        }

        uint64_t v20 = &qword_10002C398[156 * v8];
        unsigned int v21 = (dispatch_queue_s *)*v20;
        *(void *)__str = _NSConcreteStackBlock;
        *(void *)&char __str[8] = 0x40000000LL;
        *(void *)&__str[16] = sub_100011C34;
        *(void *)&__str[24] = &unk_1000296E8;
        *(void *)&__str[32] = &v52;
        *(void *)&__str[40] = v20;
        *(void *)&__str[48] = 3LL;
        *(void *)&__str[56] = &v44;
        *(void *)&__str[64] = &v47;
        *(void *)&__str[72] = v19;
        dispatch_sync(v21, __str);
        uint64_t v22 = v20[1];
        if (v22) {
          uint64_t v23 = (dispatch_queue_s **)(v22 + 16);
        }
        else {
          uint64_t v23 = (dispatch_queue_s **)&qword_10002C398[156 * v8];
        }
        size_t v24 = *v23;
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_10000F7B4;
        block[3] = &unk_1000296C8;
        __int128 v36 = v62;
        __int128 v37 = v63;
        __int128 v38 = v64;
        __int128 v39 = v65;
        __int128 v32 = v58;
        __int128 v33 = v59;
        __int128 v34 = v60;
        __int128 v35 = v61;
        __int128 v28 = v54;
        __int128 v29 = v55;
        __int128 v30 = v56;
        __int128 v31 = v57;
        __int128 v26 = v52;
        __int128 v27 = v53;
        uint64_t v40 = &qword_10002C398[156 * v8];
        int8x8_t v41 = __b;
        dispatch_sync(v24, block);
      }

uint64_t sub_10000F564(int a1, xpc_object_t xdict)
{
  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  string = xpc_dictionary_get_string(xdict, "path");
  return sub_10000E15C(uuid, string, xdict, 1);
}

void sub_10000F5B4(int a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    signed int v3 = reply;
    uint64_t v6 = 0LL;
    int v7 = &v6;
    uint64_t v8 = 0x2020000000LL;
    uint64_t v9 = 0LL;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000138C0;
    v5[3] = &unk_100029980;
    v5[4] = &v6;
    dispatch_async_and_wait((dispatch_queue_t)qword_10003A8F8, v5);
    uint64_t v4 = v7[3];
    _Block_object_dispose(&v6, 8);
    xpc_dictionary_set_uint64(v3, "device_salt", v4);
    xpc_dictionary_send_reply(v3);
    xpc_release(v3);
  }

BOOL sub_10000F6C4(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v11 = v5;
  __int128 v12 = v5;
  __int128 v10 = v5;
  int v6 = proc_pidinfo(*(_DWORD *)(a3 + 20), 17, 1uLL, &v10, 56);
  if (v6 == 56)
  {
    *(_BYTE *)(a3 + 72) = xpc_dictionary_get_BOOL(a2, "32bits");
    *(void *)(a3 + 32) = v11;
    *(_OWORD *)(a3 + 4sub_100021ACC(qword_10003A798, 0) = v10;
    uuid = xpc_dictionary_get_uuid(a2, "dsc_uuid");
    uint64_t v8 = (_OWORD *)(a3 + 56);
    if (uuid)
    {
      *uint64_t v8 = *(_OWORD *)uuid;
    }

    else
    {
      *(void *)uint64_t v8 = 0LL;
      *(void *)(a3 + 64) = 0LL;
    }
  }

  return v6 == 56;
}

void sub_10000F7B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) + 16LL;
  sub_100006430(*(void *)(a1 + 256), *(const void **)(a1 + 264), &v1);
}

uint64_t sub_10000F814(uint64_t a1, int a2, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v19[0] = 0xAAAAAAAAAAAAAAAALL;
    data = xpc_dictionary_get_data(object, "data", v19);
    if (data)
    {
      uint64_t v7 = v19[0];
      if (v19[0])
      {
        if (v19[0] <= 0x8000)
        {
          uint64_t v8 = (uint64_t)data;
          uuid = xpc_dictionary_get_uuid(object, "uuid");
          if (uuid)
          {
            __int128 v10 = uuid;
            *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
            __int128 v36 = v11;
            __int128 v35 = v11;
            __int128 v34 = v11;
            __int128 v33 = v11;
            __int128 v32 = v11;
            __int128 v31 = v11;
            __int128 v30 = v11;
            __int128 v29 = v11;
            __int128 v28 = v11;
            __int128 v27 = v11;
            unint64_t v18 = 24579LL;
            v19[0] = v7 + 48;
            size_t v12 = *(void *)(a1 + 64);
            if (*(_BYTE *)(a1 + 128)) {
              char v13 = *(_BYTE *)(a1 + 128);
            }
            else {
              char v13 = 14;
            }
            int v14 = *(_DWORD *)(a1 + 60);
            uint64_t uint64 = xpc_dictionary_get_uint64(object, "ts");
            v19[1] = v12;
            int v20 = v14;
            char v21 = v13;
            __int16 v22 = 0;
            char v23 = 0;
            uint64_t v17 = *(void *)(a1 + 112);
            uint64_t v16 = *(void *)(a1 + 120);
            uint64_t v24 = uint64;
            uint64_t v25 = v17;
            __int128 v26 = *(_OWORD *)v10;
            sub_10000EB30((uint64_t)&v18, v8, v7, a1 + 32, v16, *(unsigned __int8 *)(a1 + 129), 0LL);
          }
        }
      }
    }
  }

  return 1LL;
}

size_t sub_10000F9A4(char *a1, size_t a2, void *a3)
{
  id v5 = a3;
  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v5))
  {
    memset(__b, 170, sizeof(__b));
    id v12 = objc_claimAutoreleasedReturnValue([v5 description]);
    snprintf( __b,  0x400uLL,  "JSON serialization would not work for record: %s",  (const char *)[v12 UTF8String]);

    sub_10000B70C((uint64_t)__b);
    size_t v11 = 0LL;
LABEL_19:

    return v11;
  }

  id v17 = 0LL;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  &v17));
  id v7 = v17;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    memset(__b, 170, sizeof(__b));
    id v10 = objc_claimAutoreleasedReturnValue([v5 description]);
    snprintf(__b, 0x400uLL, "JSON serialization failed for record: %s", (const char *)[v10 UTF8String]);

    sub_10000B70C((uint64_t)__b);
    size_t v11 = 0LL;
LABEL_18:

    goto LABEL_19;
  }

  char v13 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v6, 4LL);
  size_t result = strlcpy(a1, -[NSString UTF8String](v13, "UTF8String"), a2);
  size_t v15 = result;
  size_t v11 = result + 1;
  if (result >= a2 || v11 >= a2)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "JSON of length %zd is too long, prefix: %.64s...", v15, a1);
    sub_10000B70C((uint64_t)__b);
    size_t v11 = 0LL;
LABEL_17:

    goto LABEL_18;
  }

  if (result <= ~(unint64_t)a1)
  {
    a1[result] = 10;
    if (result < ~(unint64_t)a1)
    {
      a1[v11] = 0;
      goto LABEL_17;
    }
  }

  __break(0x5513u);
  return result;
}

void sub_10000FBC8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)v1);
  sub_10000FC68(v1);
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(v1 + 8) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_10000FDA8;
  v3[3] = &unk_100029818;
  v3[4] = v1;
  dispatch_async(v2, v3);
}

void sub_10000FC68(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 24);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  uint64_t v3 = *(unsigned int *)(a1 + 1128);
  *(_DWORD *)(a1 + 1128) = -1;
  int times = mach_get_times(a1 + 16, a1 + 24, a1 + 32);
  if (times) {
    _os_assumes_log(times);
  }
  if ((_DWORD)v3 != -1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_1000101B0;
    v6[3] = &unk_1000298F8;
    int v7 = v3;
    v6[4] = a1;
    v6[5] = v2;
    if (*(void *)(a1 + 8))
    {
      dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6);
      dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 8) + 16LL), v5);
      _Block_release(v5);
    }

    else
    {
      sub_1000101C0(a1, v3, v2);
    }
  }

void sub_10000FDA8(uint64_t a1)
{
}

void sub_10000FDB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    uint64_t v3 = (dispatch_queue_t *)(v2 + 16);
  }
  else {
    uint64_t v3 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v3);
  uint64_t v4 = *(int *)(a1 + 1168);
  unint64_t v5 = *(void *)(a1 + 1136);
  uint64_t v6 = 280LL * (int)v4;
  BOOL v7 = __CFADD__(v6, v5);
  unint64_t v8 = v6 + v5;
  char v9 = v7;
  BOOL v10 = v8 >= v5;
  if (v4 < 0) {
    BOOL v10 = v9;
  }
  if (!v10) {
    goto LABEL_33;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  id v12 = (dispatch_queue_t *)(v11 ? v11 + 16 : a1);
  dispatch_assert_queue_V2(*v12);
  uint64_t v13 = *(int *)(a1 + 1168);
  int v14 = v13;
  unint64_t v15 = *(void *)(a1 + 1136);
  uint64_t v16 = 280LL * (int)v13;
  BOOL v7 = __CFADD__(v16, v15);
  unint64_t v17 = v16 + v15;
  BOOL v18 = v7;
  BOOL v19 = v17 >= v15;
  if (!(v13 >= 0 ? v19 : v18)) {
    goto LABEL_33;
  }
  uint64_t v21 = v15 + 280LL * v14;
  sub_10000FF38(v21);
  __int16 v22 = *(void (***)(uint64_t, uint64_t))(a1 + 8);
  if (v22)
  {
    (*v22)(a1, v21);
  }

  else
  {
    if (__OFADD__(v14, 1))
    {
LABEL_35:
      __break(0x5500u);
LABEL_36:
      __break(0x5503u);
      return;
    }

    int v23 = *(_DWORD *)(a1 + 1172);
    if (v14 == 0x7FFFFFFF && v23 == -1) {
      goto LABEL_36;
    }
    int v14 = (v14 + 1) % v23;
    *(_DWORD *)(a1 + 1168) = v14;
    if (!v14) {
      sub_100006510(a1, 0LL);
    }
  }

  sub_10000FF90(a1, v14);
  uint64_t v24 = *(void *)(a1 + 1136);
  unint64_t v25 = 280LL * v14;
  if ((v14 & 0x80000000) == 0)
  {
    if (v25 <= ~v24) {
      goto LABEL_30;
    }
LABEL_33:
    __break(0x5513u);
    goto LABEL_34;
  }

  if (v25 <= ~v24) {
    goto LABEL_33;
  }
LABEL_30:
  if (*(void *)(v24 + 280LL * v14 + 232))
  {
LABEL_34:
    uint64_t v26 = _os_assert_log(0LL);
    _os_crash(v26);
    __break(1u);
    goto LABEL_35;
  }

void sub_10000FF38(uint64_t a1)
{
  uint64_t v2 = sub_10001E55C(*(void ***)(a1 + 224));
  if (v2)
  {
    uint64_t v3 = v2[1];
    if ((v3 & 7) != 0) {
      uint64_t v4 = (v3 & 0xFFFFFFFFFFFFFFF8LL) + 24;
    }
    else {
      uint64_t v4 = v3 + 16;
    }
    sub_1000100D0(a1, (uint64_t)v2, v4, 0);
  }

  else
  {
    uint64_t v5 = _os_assert_log(0LL);
    _os_crash(v5);
    __break(1u);
  }

void sub_10000FF90(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 1136);
  uint64_t v3 = 280LL * a2;
  BOOL v4 = __CFADD__(v3, v2);
  unint64_t v5 = v3 + v2;
  int v6 = v4;
  BOOL v7 = v5 >= v2;
  if (a2 < 0) {
    BOOL v7 = v6;
  }
  if (!v7)
  {
LABEL_17:
    __break(0x5513u);
    return;
  }

  BOOL v10 = (int *)(v2 + 280LL * a2 + 268);
  if (*v10 >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = (void *)(v2 + 280LL * a2 + 272);
    uint64_t v14 = *v13;
    while (!__CFADD__(v14, v11))
    {
      free(*(void **)(v14 + v11));
      uint64_t v14 = *v13;
      if (__CFADD__(*v13, v11)) {
        break;
      }
      unint64_t v15 = (void *)(v14 + v11);
      ++v12;
      *unint64_t v15 = 0LL;
      v15[1] = 0LL;
      v11 += 16LL;
      if (v12 >= *v10) {
        goto LABEL_12;
      }
    }

    goto LABEL_17;
  }

LABEL_12:
  unint64_t v16 = v2 + 280LL * a2;
  *(void *)(v16 + 232) = 0LL;
  *BOOL v10 = 1;
  *(_OWORD *)(v16 + 248) = xmmword_100024870;
  if (!*(_BYTE *)(a1 + 1240))
  {
    if (qword_10003A8B8 != -1) {
      dispatch_once(&qword_10003A8B8, &stru_1000294E8);
    }
    dispatch_async((dispatch_queue_t)qword_10003A8C0, &stru_100029428);
  }

  sub_10001CB0C(*(void *)(v2 + 280LL * a2 + 224));
}

  sub_100007370();
}

    sub_100021FBC(a1);
  }

  uint64_t v12 = *(void *)(a1 + 120);
  uint64_t v13 = a2 >= v12;
  uint64_t v14 = a2 - v12;
  if (v13) {
    unint64_t v15 = *(void *)(a1 + 112) + v14 * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  }
  else {
    unint64_t v15 = *(void *)(a1 + 112);
  }
  v6[1] = (void *)v15;
  unint64_t v16 = 1LL;
  sub_10001ECF8((float *)*v6, (uint64_t *)(a1 + 64), 1LL);
  unint64_t v17 = *(void *)(a1 + 64);
  BOOL v18 = *(void *)(a1 + 72);
  v6[2] = (void *)(*(void *)(a1 + 112)
                   + (a3 - *(void *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80));
  if (*(void *)(a1 + 48))
  {
    unint64_t v16 = 1LL;
    do
    {
      sub_100021FBC(a1);
      BOOL v19 = *(void *)(a1 + 120);
      if (*(void *)(a1 + 64) != v17 || *(void *)(a1 + 72) != v18)
      {
        int v20 = (float *)*v6;
        if (*v6) {
          uint64_t v21 = *((void *)v20 + 3);
        }
        else {
          uint64_t v21 = 0LL;
        }
        unint64_t v17 = *(void *)(a1 + 64);
        BOOL v18 = *(void *)(a1 + 72);
      }

      if (v19 <= a3)
      {
        __int16 v22 = sub_10001F114(*v6, (void *)(a1 + 64));
        if (v22) {
          unint64_t v16 = v22;
        }
        v6[2] = (void *)(*(void *)(a1 + 112)
                         + (a3 - *(void *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80));
      }
    }

    while (*(void *)(a1 + 48));
  }

  int v23 = (void **)_os_trace_realloc(v6, 16 * v16 + 24);
  uint64_t v24 = *v23;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 0x40000000LL;
  __int128 v45 = sub_100022524;
  __int128 v46 = &unk_10002A448;
  __int128 v47 = v16;
  unint64_t v25 = (void *)v24[2];
  if (v25)
  {
    while (1)
    {
      uint64_t v26 = v45((uint64_t)v44, (uint64_t)(v25 + 2), v25[4]);
      __int128 v27 = (void *)*v25;
      if (!v26) {
        break;
      }
LABEL_60:
      unint64_t v25 = v27;
      if (!v27) {
        goto LABEL_61;
      }
    }

    __int128 v28 = (int8x8_t)v24[1];
    __int128 v29 = v25[1];
    __int128 v30 = (uint8x8_t)vcnt_s8(v28);
    v30.i16[0] = vaddlv_u8(v30);
    if (v30.u32[0] > 1uLL)
    {
      if (v29 >= *(void *)&v28) {
        v29 %= *(void *)&v28;
      }
    }

    else
    {
      v29 &= *(void *)&v28 - 1LL;
    }

    __int128 v31 = *(void **)(*v24 + 8 * v29);
    do
    {
      __int128 v32 = v31;
      __int128 v31 = (void *)*v31;
    }

    while (v31 != v25);
    if (v32 == v24 + 2) {
      goto LABEL_66;
    }
    __int128 v33 = v32[1];
    if (v30.u32[0] > 1uLL)
    {
      if (v33 >= *(void *)&v28) {
        v33 %= *(void *)&v28;
      }
    }

    else
    {
      v33 &= *(void *)&v28 - 1LL;
    }

    __int128 v34 = (void *)*v25;
    if (v33 != v29)
    {
LABEL_66:
      if (v27)
      {
        __int128 v35 = v27[1];
        if (v30.u32[0] > 1uLL)
        {
          if (v35 >= *(void *)&v28) {
            v35 %= *(void *)&v28;
          }
        }

        else
        {
          v35 &= *(void *)&v28 - 1LL;
        }

        __int128 v34 = (void *)*v25;
        if (v35 == v29) {
          goto LABEL_53;
        }
      }

      *(void *)(*v24 + 8 * v29) = 0LL;
      __int128 v34 = (void *)*v25;
    }

    if (!v34)
    {
LABEL_59:
      int *v32 = v34;
      --v24[3];
      operator delete(v25);
      goto LABEL_60;
    }

void sub_1000100D0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (*(_DWORD *)(a1 + 264) <= a4)
  {
    uint64_t v21 = _os_assert_log(0LL);
    _os_crash(v21);
    __break(1u);
LABEL_19:
    __break(0x5513u);
    goto LABEL_20;
  }

  unint64_t v6 = *(void *)(a1 + 272);
  BOOL v7 = __CFADD__(v6, 16LL * a4);
  BOOL v8 = v6 + 16LL * a4 >= v6;
  if (a4 < 0) {
    BOOL v8 = v7;
  }
  if (!v8) {
    goto LABEL_19;
  }
  unint64_t v11 = v6 + 16LL * a4;
  free(*(void **)v11);
  *(void *)unint64_t v11 = a2;
  *(void *)(v11 + 8) = a3;
  if (!a4) {
    return;
  }
  uint64_t v12 = 16LL * a4;
  unint64_t v13 = *(void *)(a1 + 272);
  BOOL v14 = __CFADD__(v12, v13);
  unint64_t v15 = v12 + v13;
  BOOL v16 = v14;
  BOOL v17 = v15 >= v13;
  if (a4 < 0) {
    BOOL v17 = v16;
  }
  if (!v17) {
    goto LABEL_19;
  }
  *(void *)(a1 + 232) += *(void *)(v13 + 16LL * a4 + 8);
  int v18 = *(_DWORD *)(a1 + 268);
  BOOL v19 = __OFADD__(v18, 1);
  int v20 = v18 + 1;
  if (v19)
  {
LABEL_20:
    __break(0x5500u);
    return;
  }

  *(_DWORD *)(a1 + 268) = v20;
}

void sub_1000101B0(uint64_t a1)
{
}

void sub_1000101C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6) {
    BOOL v7 = (dispatch_queue_t *)(v6 + 16);
  }
  else {
    BOOL v7 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v7);
  if (a2 >= 5) {
LABEL_101:
  }
    __break(0x5512u);
  uint64_t v8 = a1 + 48;
  uint64_t v9 = 33LL * a2;
  uint64_t v10 = v8 + 264LL * a2;
  unsigned int v13 = *(_DWORD *)(v10 + 252);
  uint64_t v12 = (unsigned int *)(v10 + 252);
  size_t v11 = v13;
  if (!v13) {
    return;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (StatusReg >= 0xFFFFFFFFFFFFFFE8LL) {
    goto LABEL_100;
  }
  *(_DWORD *)(a1 + 1108) = *(_DWORD *)(StatusReg + 24) & 0xFFFFFFFC;
  __chkstk_darwin();
  unint64_t v15 = v92;
  memset(v92, 170, 0x10000uLL);
  uint64_t v16 = v8 + 264LL * a2;
  int v18 = *(const uint8_t **)(v16 + 240);
  BOOL v17 = (uint8_t **)(v16 + 240);
  int v97 = 256;
  size_t v19 = compression_encode_buffer(v92, 0x10000uLL, v18, v11, 0LL, COMPRESSION_LZ4);
  unint64_t v95 = a3;
  uint64_t v96 = a2;
  unint64_t v94 = (int *)v12;
  if (v19)
  {
    size_t v20 = v19;
  }

  else
  {
    int v97 = 0;
    unint64_t v15 = *v17;
    size_t v20 = *v12;
  }

  size_t v21 = v20 + 16;
  unint64_t v22 = (v20 + 16) & 0xFFFFFFFFFFFFC000LL;
  uint64_t v23 = (v20 + 16) & 0x3FFF;
  *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v98 = v24;
  __int128 v99 = v24;
  if (!v22 || v23 == 0)
  {
    if ((v20 & 7) != 0) {
      unint64_t v26 = (v21 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    }
    else {
      unint64_t v26 = v20 + 16;
    }
    uint64_t v27 = _os_trace_malloc(v26);
    uint64_t v28 = v27;
    if ((v20 & 7) != 0)
    {
      if ((v21 & 0x8000000000000000LL) != 0 || (v21 & 0xFFFFFFFFFFFFFFF8LL) > ~v27) {
        goto LABEL_100;
      }
      *(void *)(v27 + (v21 & 0xFFFFFFFFFFFFFFF8LL)) = 0LL;
    }

    *(void *)uint64_t v27 = 0x110000600DLL;
    *(void *)(v27 + 8) = v20;
    memcpy((void *)(v27 + 16), v15, v20);
    uint64_t v29 = 0LL;
    *(void *)&__int128 v98 = v28;
    uint64_t v30 = (v20 & 0xFFFFFFFFFFFFFFF8LL) + 24;
    if ((v20 & 7) == 0) {
      uint64_t v30 = v20 + 16;
    }
    unsigned int v31 = 1;
  }

  else
  {
    uint64_t v93 = v9;
    __int128 v32 = (void *)_os_trace_malloc((v20 + 16) & 0xFFFFFFFFFFFFC000LL);
    __int128 v33 = v32;
    void *v32 = 0x110000600DLL;
    v32[1] = v20;
    size_t v34 = v21 & 0x3FF8;
    if ((v20 & 7) != 0) {
      uint64_t v35 = (v21 & 0x3FF8) + 8;
    }
    else {
      uint64_t v35 = (v20 + 16) & 0x3FFF;
    }
    uint64_t v36 = _os_trace_malloc(v35);
    __int128 v37 = (void *)v36;
    if ((v20 & 7) != 0)
    {
      if (__CFADD__(v36, v34)) {
        goto LABEL_100;
      }
      *(void *)(v36 + ((v20 + 16) & 0x3FF8)) = 0LL;
    }

    memcpy(v33 + 2, v15, v22 - 16);
    if (__CFADD__(v15, v22 - 16)) {
      goto LABEL_100;
    }
    memcpy(v37, &v15[v22 - 16], v20 - (v22 - 16));
    *(void *)&__int128 v98 = v33;
    *((void *)&v98 + 1) = (v20 + 16) & 0xFFFFFFFFFFFFC000LL;
    *(void *)&__int128 v99 = v37;
    uint64_t v30 = (v20 & 7) != 0 ? v23 - (v20 & 7) + 8 : (v20 + 16) & 0x3FFF;
    unsigned int v31 = 2;
    uint64_t v29 = 1LL;
    uint64_t v9 = v93;
  }

  __int128 v38 = (void *)(v8 + 8 * v9);
  *((void *)&v98 + 2 * v29 + 1) = v30;
  uint64_t v39 = *(void *)(a1 + 8);
  if (v39) {
    uint64_t v40 = (dispatch_queue_t *)(v39 + 16);
  }
  else {
    uint64_t v40 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v40);
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v43 = v31;
  do
  {
    v42 += *(void *)((char *)&v98 + v41 + 8);
    v41 += 16LL;
  }

  while (16LL * v31 != v41);
  uint64_t v44 = *(void *)(a1 + 8);
  if (v44) {
    __int128 v45 = (dispatch_queue_t *)(v44 + 16);
  }
  else {
    __int128 v45 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v45);
  uint64_t v46 = *(int *)(a1 + 1168);
  unint64_t v47 = *(void *)(a1 + 1136);
  uint64_t v48 = 280LL * (int)v46;
  BOOL v49 = __CFADD__(v48, v47);
  unint64_t v50 = v48 + v47;
  char v51 = v49;
  BOOL v52 = v50 >= v47;
  if (v46 < 0) {
    BOOL v52 = v51;
  }
  if (!v52) {
    goto LABEL_100;
  }
  int v53 = *(_DWORD *)(v47 + 280LL * (int)v46 + 268);
  BOOL v54 = __OFADD__(v53, (_DWORD)v43);
  int v55 = v53 + v43;
  if (v54)
  {
    __break(0x5500u);
    return;
  }

  if (v55 <= *(_DWORD *)(v47 + 280LL * (int)v46 + 264)
    && (unint64_t)sub_10001E370(*(void **)(v47 + 280LL * (int)v46 + 224)) < 0x8000)
  {
    __int128 v62 = (void *)(v47 + 280LL * (int)v46);
  }

  else
  {
LABEL_56:
    sub_10000FDB0(a1);
    unint64_t v57 = *(void *)(a1 + 1136);
    uint64_t v58 = 280LL * v56;
    BOOL v49 = __CFADD__(v58, v57);
    unint64_t v59 = v58 + v57;
    int v60 = v49;
    BOOL v61 = v59 >= v57;
    if (v56 < 0) {
      BOOL v61 = v60;
    }
    if (!v61) {
      goto LABEL_100;
    }
    __int128 v62 = (void *)(v57 + 280LL * v56);
    LODWORD(v46) = v56;
  }

  if (!v62[29]) {
    memcpy(v62, v38, v38[1] + 16LL);
  }
  unint64_t v63 = *(void *)(a1 + 1136);
  uint64_t v64 = 280LL * (int)v46;
  BOOL v65 = __CFADD__(v64, v63);
  BOOL v66 = v64 + v63 >= v63;
  if (!v66) {
    goto LABEL_100;
  }
  uint64_t v67 = 0LL;
  uint64_t v68 = v63 + 280LL * (int)v46;
  uint64_t v69 = 16 * v43;
  do
  {
    sub_1000100D0(v68, *(void *)((char *)&v98 + v67), *(void *)((char *)&v98 + v67 + 8), *(_DWORD *)(v68 + 268));
    v67 += 16LL;
  }

  while (v69 != v67);
  unint64_t v70 = *(void *)(a1 + 1136);
  BOOL v71 = __CFADD__(v64, v70);
  BOOL v72 = v64 + v70 >= v70;
  unint64_t v74 = v95;
  unsigned int v73 = v96;
  if (!v72) {
    goto LABEL_100;
  }
  char v75 = *(void **)(v70 + 280LL * (int)v46 + 224);
  sub_100010728((uint64_t)v75, (uint64_t)v38);
  uint64_t v76 = *(int *)(a1 + 1168);
  unint64_t v77 = *(void *)(a1 + 1136);
  uint64_t v78 = 280LL * (int)v76;
  BOOL v49 = __CFADD__(v78, v77);
  unint64_t v79 = v78 + v77;
  char v80 = v49;
  BOOL v81 = v79 >= v77;
  if (v76 < 0) {
    BOOL v81 = v80;
  }
  if (!v81)
  {
LABEL_100:
    __break(0x5513u);
    goto LABEL_101;
  }

  if (v75[10]) {
    uint64_t v82 = **(void ***)(v75[9] + 8LL);
  }
  else {
    uint64_t v82 = sub_10001C774((uint64_t)v75);
  }
  unint64_t v84 = v82[2];
  unint64_t v83 = v82[3];
  unint64_t v85 = v77 + 280LL * (int)v76;
  unint64_t v87 = *(void *)(v85 + 248);
  unint64_t v86 = (unint64_t *)(v85 + 248);
  if (v84 < v87) {
    *unint64_t v86 = v84;
  }
  unint64_t v88 = v77 + 280LL * (int)v76;
  if (v83 > *(void *)(v88 + 256)) {
    *(void *)(v88 + 256) = v83;
  }
  int v89 = *v94;
  if (v75[10]) {
    v90 = **(void ***)(v75[9] + 8LL);
  }
  else {
    v90 = sub_10001C774((uint64_t)v75);
  }
  int v91 = v97;
  *((_DWORD *)v90 + 8) = v89;
  *((_DWORD *)v90 + 9) = v91;
  if (v75[1] > v74) {
    v75[1] = v74;
  }
  sub_100010864(a1, v73);
  sub_10001C774((uint64_t)v75);
}

uint64_t sub_100010728(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = 0LL;
  uint64_t v5 = *(void *)(a2 + 240);
  unint64_t v6 = *(unsigned int *)(a2 + 252);
  unint64_t v15 = sub_100010A20;
  uint64_t v16 = &unk_100029918;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000LL;
  uint64_t v17 = a2;
  uint64_t v18 = result;
  do
  {
    if (v6 - v4 < 0x10) {
      break;
    }
    unint64_t v7 = *(void *)(v5 + v4 + 8);
    if (v6 - v4 - 16 < v7) {
      break;
    }
    size_t result = ((uint64_t (*)(void *))v15)(v14);
    if (!(_DWORD)result) {
      break;
    }
    unint64_t v4 = (v4 + v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  }

  while (v4 - 1 < v6);
  uint64_t v8 = *(void *)(a2 + 232);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  size_t v11 = sub_100010F4C;
  uint64_t v12 = &unk_100029958;
  uint64_t v13 = v3;
  if (v8)
  {
    for (uint64_t i = *(void **)(v8 + 16); i; uint64_t i = (void *)*i)
      size_t result = (uint64_t)v11((uint64_t)v10, i[4]);
  }

  return result;
}

void sub_100010864(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4) {
    uint64_t v5 = (dispatch_queue_t *)(v4 + 16);
  }
  else {
    uint64_t v5 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v5);
  if (a2 >= 5)
  {
LABEL_28:
    __break(0x5512u);
    goto LABEL_29;
  }

  uint64_t v6 = a1 + 48;
  if (__CFADD__(a1 + 48, 264LL * a2))
  {
LABEL_29:
    __break(0x5513u);
    return;
  }

  unint64_t v7 = *(void **)(v6 + 264LL * a2 + 224);
  if (v7)
  {
    if (v7[3])
    {
      uint64_t v9 = (void *)v7[2];
      if (v9)
      {
        do
        {
          uint64_t v10 = (void *)*v9;
          operator delete(v9);
          uint64_t v9 = v10;
        }

        while (v10);
      }

      v7[2] = 0LL;
      uint64_t v11 = v7[1];
      if (v11)
      {
        for (uint64_t j = 0LL; j != v11; ++j)
          *(void *)(*v7 + 8 * j) = 0LL;
      }

      v7[3] = 0LL;
    }
  }

  uint64_t v13 = (unint64_t *)(a1 + 1104);
  uint64_t v14 = v6 + 264LL * a2;
  sub_10001F838(*(void **)(v14 + 232), (uint64_t (*)(void))sub_1000109F0);
  madvise(*(void **)(v14 + 240), *(unsigned int *)(v14 + 248), 7);
  *(_DWORD *)(v14 + 252) = 0;
  *(_DWORD *)(v14 + 256) = 0;
  *(void *)(v14 + 24sub_100021ACC(qword_10003A798, 0) = 0LL;
  do
    unint64_t v15 = __ldxr(v13);
  while (__stlxr((1 << a2) | v15, v13));
  if ((v15 & 0x100000000LL) != 0)
  {
    uint64_t v16 = a1 + 1108;
    while ((__ulock_wake(258LL, v16, 0LL) & 0x80000000) != 0)
    {
      int v17 = *__error();
      if (v17 != 4)
      {
        if (v17) {
          BOOL v18 = v17 == 2;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: ulock_wake() failed";
          qword_10002DF78 = v17;
          __break(1u);
          goto LABEL_28;
        }

        return;
      }
    }
  }

void sub_1000109F0(unsigned int **a1)
{
}

uint64_t sub_100010A20(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0x6001:
      uint64_t v5 = sub_10001F730(*(void **)(*(void *)(a1 + 32) + 224LL), *(void *)(a2 + 16), *(_DWORD *)(a2 + 24));
      if (!v5)
      {
        uint64_t v36 = _os_assert_log(0LL);
        _os_crash(v36);
        __break(1u);
        goto LABEL_76;
      }

      uint64_t v6 = (uint64_t)v5;
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v40 = 0LL;
      uint64_t v8 = sub_100003638((uint64_t)v5);
      uint64_t v39 = sub_100003624(v6, &v40);
      uint64_t v43 = 0LL;
      memset(v42, 0, sizeof(v42));
      LODWORD(v42[1]) = sub_10000361C(v6);
      DWORD1(v42[1]) = sub_100003614(v6);
      *((void *)&v42[0] + 1) = sub_1000035E4(v6, (_DWORD *)v42 + 1);
      if (*(_BYTE *)(v8 + 136) == 4) {
        WORD1(v42[0]) |= 1u;
      }
      __int128 v9 = *(_OWORD *)(v8 + 48);
      *(_OWORD *)((char *)&v42[1] + 8) = *(_OWORD *)(v8 + 32);
      *(_OWORD *)((char *)&v42[2] + 8) = v9;
      uint64_t v10 = sub_10001C60C(v7, (uint64_t)v42);
      sub_10001C88C(v7, v10);
      uint64_t v11 = (uint64_t *)(a2 + 48);
      unint64_t v12 = *(unsigned __int16 *)(a2 + 32);
      unint64_t v13 = a2 + 48;
      if (v12 > 0x1000) {
        goto LABEL_10;
      }
      if (__CFADD__(a2 + 32, v12)) {
LABEL_76:
      }
        __break(0x5513u);
      unint64_t v13 = a2 + 32 + v12;
LABEL_10:
      uint64_t v37 = v8 + 16;
      lock = (os_unfair_lock_s *)(v8 + 132);
      while (1)
      {
        uint64_t v14 = v11 + 3;
        unint64_t v15 = (unsigned __int8 *)v11;
        unint64_t v16 = v11[2];
        unint64_t v17 = HIWORD(v16);
        uint64_t v19 = v17 + 24;
        if ((v16 & 0x7000000000000LL) != 0) {
          uint64_t v19 = (HIWORD(v16) & 0xFFF8) + 32LL;
        }
        if (__CFADD__(v11, v19)) {
          goto LABEL_76;
        }
        uint64_t v11 = (uint64_t *)((char *)v11 + v19);
        uint64_t v20 = *(void *)v15;
        if (*(void *)v15)
        {
          __int16 v21 = WORD1(*(void *)v15);
          int v22 = *(void *)v15;
          if ((v22 - 3) >= 2 && v22 != 6)
          {
            if (v22 != 2) {
              goto LABEL_74;
            }
            int v23 = BYTE1(v20);
            if ((v21 & 1) != 0)
            {
              if (!(v16 >> 51)) {
                goto LABEL_74;
              }
              uint64_t v24 = 8LL;
              if ((v21 & 0x10) != 0) {
                goto LABEL_62;
              }
LABEL_27:
              if ((*(void *)v15 & 0x2000000LL) != 0)
              {
LABEL_65:
                if (v24 + 8 > v17) {
                  goto LABEL_74;
                }
                if (__CFADD__(v14, v24)) {
                  goto LABEL_76;
                }
                v24 += 8LL;
              }
            }

            else
            {
              uint64_t v24 = 0LL;
              if ((v21 & 0x10) == 0) {
                goto LABEL_27;
              }
LABEL_62:
              if (v24 + 8 > v17) {
                goto LABEL_74;
              }
              if (__CFADD__(v14, v24)) {
                goto LABEL_76;
              }
              v24 += 8LL;
              if ((*(void *)v15 & 0x2000000LL) != 0) {
                goto LABEL_65;
              }
            }

            if (v23 == 1 && v24 + 8 <= v17)
            {
              LOWORD(v42[0]) = v24 + 8;
              if (__CFADD__(v14, v24)) {
                goto LABEL_76;
              }
              sub_10000760C(v6, v15, v8, v7, v10, v42);
            }

            goto LABEL_74;
          }

          unsigned __int16 v41 = 0;
          if ((v20 & 0x10000) != 0)
          {
            if (!(v16 >> 51)) {
              goto LABEL_74;
            }
            unsigned __int16 v41 = 8;
            uint64_t v25 = 8LL;
            if ((v21 & 0x10) != 0)
            {
LABEL_34:
              if (v25 + 8 > v17) {
                goto LABEL_74;
              }
              unsigned __int16 v41 = v25 + 8;
              BOOL v26 = __CFADD__(v14, v25);
              v25 += 8LL;
              if (v26) {
                goto LABEL_76;
              }
            }
          }

          else
          {
            uint64_t v25 = 0LL;
            if ((v21 & 0x10) != 0) {
              goto LABEL_34;
            }
          }

          if ((v21 & 0x100) != 0)
          {
            if (v25 + 4 > v17) {
              goto LABEL_74;
            }
            unsigned __int16 v41 = v25 + 4;
            if (__CFADD__(v14, v25)) {
              goto LABEL_76;
            }
          }

          sub_10000760C(v6, v15, v8, v7, v10, &v41);
          if (*v15 != 3
            && (*((_WORD *)v15 + 1) & 0x200) != 0
            && (unint64_t)v41 + 2 <= *((unsigned __int16 *)v15 + 11))
          {
            if (__CFADD__(v14, v41)) {
              goto LABEL_76;
            }
            uint64_t v27 = v8;
            int v28 = *(unsigned __int16 *)((char *)v14 + v41);
            LOWORD(v29) = *(_WORD *)(v39 + 2);
            unsigned int v30 = *(unsigned __int16 *)(v39 + 4);
            if (v30 >= 0x5C8) {
              unsigned int v30 = 1480;
            }
            do
            {
              unsigned int v31 = (unsigned __int16 *)(v39 + (unsigned __int16)v29 + 568);
              unint64_t v32 = *(unsigned __int8 *)(v39 + (unsigned __int16)v29 + 570)
              if (*v31 == v28)
              {
LABEL_59:
                uint64_t v35 = (char *)(v31 + 1);
                sub_10001C57C(v7, v10, v28, v35);
                sub_10001C904(v7, v35);
                goto LABEL_73;
              }

              unint64_t v29 = v32 + (unsigned __int16)v29 + (v32 & 1);
            }

            while (v29 < 0x10000);
            os_unfair_lock_lock_with_options(lock, 0x10000LL);
            uint64_t v33 = v37;
            while (1)
            {
              uint64_t v33 = *(void *)v33;
              if (!v33) {
                break;
              }
              if (*(unsigned __int16 *)(v33 + 8) == v28)
              {
LABEL_58:
                os_unfair_lock_unlock(lock);
                __int16 v34 = *(_WORD *)(v33 + 8);
                unsigned int v31 = (unsigned __int16 *)(v33 + 8);
                LOWORD(v28) = v34;
                goto LABEL_59;
              }
            }

            os_unfair_lock_unlock(lock);
            *(void *)&v42[0] = _NSConcreteStackBlock;
            *((void *)&v42[0] + 1) = 0x40000000LL;
            *(void *)&v42[1] = sub_100007CE4;
            *((void *)&v42[1] + 1) = &unk_100029040;
            *(void *)&v42[2] = v6;
            sub_100003F1C(v6, 0LL, (uint64_t)&stru_100029020, (uint64_t)v42);
            os_unfair_lock_lock_with_options(lock, 0x10000LL);
            uint64_t v33 = v37;
            while (1)
            {
              uint64_t v33 = *(void *)v33;
              if (!v33) {
                break;
              }
            }

            os_unfair_lock_unlock(lock);
LABEL_73:
            uint64_t v8 = v27;
          }

unsigned int *sub_100010F4C(uint64_t a1, uint64_t a2)
{
  v9[0] = 0;
  v9[1] = *(unsigned __int8 *)(a2 + 72);
  int v10 = *(_DWORD *)(a2 + 20);
  uint64_t v11 = *(void *)(a2 + 32);
  int v4 = *(_DWORD *)(a2 + 4);
  int v12 = *(_DWORD *)(a2 + 28);
  int v13 = v4;
  __int128 v14 = *(_OWORD *)(a2 + 40);
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  __int128 v15 = *(_OWORD *)(a2 + 56);
  uint64_t v5 = sub_10001C60C(*(void *)(a1 + 32), (uint64_t)v9);
  sub_10001C88C(*(void *)(a1 + 32), v5);
  uint64_t v6 = *(unsigned int **)(a2 + 80);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = sub_100011040;
  v8[3] = &unk_100029938;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = v5;
  return sub_100020E74(v6, (uint64_t)v8);
}

uint64_t sub_100011040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = (char *)(a3 + 2);
  sub_10001C57C(*(void *)(a1 + 32), *(void *)(a1 + 40), *(_WORD *)a3, (char *)(a3 + 2));
  return sub_10001C904(*(void *)(a1 + 32), v4);
}

void sub_100011084(int a1)
{
  unint64_t v2 = &qword_10002C398;
  uint64_t v3 = 5LL;
  while (1)
  {
    unint64_t v4 = *((unsigned __int8 *)v2 + 1240);
    if (v4 >= 5) {
      break;
    }
    *unint64_t v2 = (uint64_t)sub_100003ED8(qword_100024728[v4]);
    if (a1) {
      *((_DWORD *)v2 + 311) |= 1u;
    }
    unint64_t v5 = *((unsigned __int8 *)v2 + 1240);
    if (v5 > 4) {
      goto LABEL_10;
    }
    sub_100011150((uint64_t)v2, dword_100024710[v5]);
    v2 += 156;
    if (!--v3) {
      return;
    }
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Nope";
  qword_10002DF78 = v4;
  __break(1u);
LABEL_10:
  __break(0x5512u);
LABEL_11:
  __break(0x5513u);
}

void sub_100011150(uint64_t a1, int a2)
{
  if (0x10000 % vm_page_size)
  {
    uint64_t v16 = _os_assert_log(0LL);
    LODWORD(v4) = _os_crash(v16);
    __break(1u);
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }

  *(void *)(a1 + 1128) = 0x4FFFFFFFFLL;
  *(_DWORD *)(a1 + 1104) = 15;
  *(void *)(a1 + 112sub_100021ACC(qword_10003A798, 0) = 0x40000LL;
  LODWORD(v4) = mach_vm_map( mach_task_self_,  (mach_vm_address_t *)(a1 + 1112),  0x40000uLL,  0LL,  1308622849,  0,  0LL,  0,  3,  3,  2u);
  if (!(_DWORD)v4)
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    while (v5 <= ~(a1 + 48))
    {
      uint64_t v7 = a1 + v5;
      *(void *)(v7 + 296) = 0x10000LL;
      *(_DWORD *)(v7 + 304) = 0;
      *(void *)(v7 + 288) = v6 + *(void *)(a1 + 1112);
      v6 += 0x10000LL;
      v5 += 264LL;
      if (v6 == 0x40000)
      {
        uint64_t v8 = *(void *)(a1 + 8);
        unsigned int v9 = a2 / 0x20000;
        if (a2 / 0x20000 <= 1) {
          unsigned int v9 = 1;
        }
        *(_DWORD *)(a1 + 1168) = 0;
        if (v8) {
          uint64_t v10 = 1LL;
        }
        else {
          uint64_t v10 = v9;
        }
        *(_DWORD *)(a1 + 1172) = v10;
        *(void *)(a1 + 1144) = 0LL;
        uint64_t v4 = _os_trace_calloc(v10, 280LL);
        uint64_t v11 = 0LL;
        *(void *)(a1 + 1136) = v4;
        uint64_t v12 = 280LL * v10;
        while (1)
        {
          uint64_t v13 = *(void *)(a1 + 1136);
          if (__CFADD__(v13, v11)) {
            break;
          }
          uint64_t v14 = v13 + v11;
          *(void *)(v14 + 224) = sub_10001CAB0();
          *(_OWORD *)(v14 + 232) = xmmword_100024880;
          *(void *)(v14 + 264) = 0x100000021LL;
          uint64_t v4 = _os_trace_calloc(33LL, 16LL);
          *(void *)(v14 + 272) = v4;
          *(_OWORD *)(v14 + 248) = xmmword_100024870;
          v11 += 280LL;
          if (v12 == v11)
          {
            int times = mach_get_times(a1 + 16, a1 + 24, a1 + 32);
            if (times) {
              _os_assumes_log(times);
            }
            return;
          }
        }

        goto LABEL_20;
      }
    }

    goto LABEL_20;
  }

void sub_100011390(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10001148C;
    block[3] = &unk_100029708;
    void block[4] = a1;
    dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
  }

  else
  {
    dispatch_block_t v3 = 0LL;
  }

  uint64_t v4 = *(dispatch_queue_s **)a1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_100011494;
  v5[3] = &unk_100029730;
  void v5[5] = a1;
  v5[6] = v2;
  v5[4] = v3;
  dispatch_sync(v4, v5);
  if (v2)
  {
    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    _Block_release(v3);
  }

void sub_10001148C(uint64_t a1)
{
}

void sub_100011494(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    dispatch_async(*(dispatch_queue_t *)(v2 + 16), *(dispatch_block_t *)(a1 + 32));
  }
}

uint64_t sub_1000114D4(dispatch_queue_t *a1, char *a2, int a3, void *a4)
{
  if (HIWORD(a3) == 4096)
  {
    unsigned int v8 = (unsigned __int16)a3;
    unsigned int v9 = (unsigned __int16)a3;
    if ((a3 & 7) == 0)
    {
LABEL_12:
      uint64_t v11 = v8 + 32LL;
      goto LABEL_14;
    }
  }

  else
  {
    unsigned int v9 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
    if ((unsigned __int16)a3 - HIWORD(a3) + 7 < 0xFFFFF007
      || (((unsigned __int16)a3 - HIWORD(a3)) & 7) == 0)
    {
      if (v9 >= 0xFF9) {
        unsigned int v8 = 4096;
      }
      else {
        unsigned int v8 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
      }
      goto LABEL_12;
    }
  }

  uint64_t v11 = v9 - (unint64_t)(v9 & 7) + 40;
LABEL_14:
  uint64_t result = (uint64_t)sub_100011778((uint64_t)a1, v11);
  unsigned int v39 = v11;
  uint64_t v13 = a1 + 6;
  unsigned int v14 = result;
  uint64_t v15 = sub_1000035E4((uint64_t)a4, 0LL);
  unsigned int v16 = sub_10000361C((uint64_t)a4);
  uint64_t v17 = &v13[33 * v14];
  uint64_t v19 = v17[28];
  BOOL v18 = (void **)(v17 + 28);
  uint64_t result = (uint64_t)sub_10001F730(v19, v15, v16);
  if (!result)
  {
    uint64_t v20 = os_retain(a4);
    uint64_t result = sub_10001F2CC(v18, v15, v16, (uint64_t)v20);
  }

  __int16 v21 = &v13[33 * v14];
  unsigned int v24 = *((_DWORD *)v21 + 63);
  int v23 = (int32x2_t *)((char *)v21 + 252);
  uint64_t v22 = v24;
  uint64_t v25 = *(uint64_t *)((char *)&v23[-2] + 4);
  if (__CFADD__(v25, v24)) {
    goto LABEL_46;
  }
  unsigned int v26 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
  BOOL v27 = v26 < 0xFF9;
  if (v26 >= 0xFF9) {
    unsigned int v26 = 4096;
  }
  if (HIWORD(a3) == 4096) {
    size_t v28 = (unsigned __int16)a3;
  }
  else {
    size_t v28 = v26;
  }
  BOOL v29 = HIWORD(a3) != 4096 && v27;
  size_t v30 = v28 + 32;
  if (v25)
  {
    uint64_t v31 = v25 + v22;
    if ((v28 & 7) == 0) {
      goto LABEL_38;
    }
    if (!__CFADD__(v31, v30 & 0x1FFFFFFF8LL)) {
      goto LABEL_37;
    }
    goto LABEL_46;
  }

  if ((v28 & 7) != 0) {
    uint64_t v32 = (v30 & 0x1FFFFFFF8LL) + 8;
  }
  else {
    uint64_t v32 = v28 + 32;
  }
  uint64_t result = _os_trace_malloc(v32);
  uint64_t v31 = result;
  if ((v28 & 7) != 0)
  {
    if (!__CFADD__(result, v30 & 0x1FFFFFFF8LL))
    {
LABEL_37:
      *(void *)(v31 + (v30 & 0x1FFFFFFF8LL)) = 0LL;
      goto LABEL_38;
    }

LABEL_46:
    __break(0x5513u);
    goto LABEL_47;
  }

LABEL_38:
  *(void *)uint64_t v31 = 24577LL;
  *(void *)(v31 + 8) = v28 + 16;
  uint64_t v33 = sub_1000035E4((uint64_t)a4, 0LL);
  int v34 = sub_10000361C((uint64_t)a4);
  *(void *)(v31 + 16) = v33;
  *(_DWORD *)(v31 + 24) = v34;
  *(_BYTE *)(v31 + 28) = 0;
  *(_BYTE *)(v31 + 29) = v29;
  uint64_t v35 = v31 + 32;
  *(_WORD *)(v31 + 3sub_100021ACC(qword_10003A798, 0) = 0;
  if (!v29)
  {
    uint64_t v36 = (void *)(v31 + 32);
    uint64_t v37 = a2;
    size_t v38 = v28;
    goto LABEL_44;
  }

  uint64_t result = (uint64_t)memcpy((void *)(v31 + 32), a2, (unsigned __int16)a3);
  if (HIWORD(a3) <= 0x1000uLL)
  {
    if (!__CFADD__(a2, HIWORD(a3)))
    {
      uint64_t v36 = (void *)(v35 + (unsigned __int16)a3);
      uint64_t v37 = &a2[HIWORD(a3)];
      size_t v38 = 4096LL - HIWORD(a3);
LABEL_44:
      uint64_t result = (uint64_t)memcpy(v36, v37, v38);
      *int v23 = vadd_s32(*v23, (int32x2_t)(v39 | 0x100000000LL));
      return result;
    }

    goto LABEL_46;
  }

LABEL_47:
  __break(0x5512u);
  return result;
}

tm *sub_100011778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 48;
  uint64_t v5 = *(unsigned int *)(a1 + 1128);
  if ((_DWORD)v5 != -1)
  {
    if (__CFADD__(v4, 264 * v5)) {
      goto LABEL_53;
    }
    uint64_t v6 = *(unsigned int *)(v4 + 264LL * v5 + 252);
    if (v6 + a2 <= (unint64_t)*(unsigned int *)(v4 + 264LL * v5 + 248)
      && *(_DWORD *)(v4 + 264LL * v5 + 256) < 0x64u)
    {
      uint64_t v15 = *(unsigned int *)(a1 + 1128);
      if (!(_DWORD)v6) {
        goto LABEL_36;
      }
      return (tm *)v15;
    }

    sub_10000FC68(a1);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  uint64_t v7 = (unint64_t *)(a1 + 1104);
  while (1)
  {
    do
    {
      while (1)
      {
LABEL_8:
        unint64_t v8 = __ldaxr(v7);
        unint64_t v9 = HIDWORD(v8);
        if ((_DWORD)v8)
        {
          unsigned int v10 = (v8 - 1) & v8;
          goto LABEL_12;
        }

        if (v9) {
          break;
        }
        __clrex();
LABEL_24:
        uint64_t v13 = *(void *)(a1 + 8);
        if (v13) {
          unsigned int v14 = (dispatch_queue_t *)(v13 + 16);
        }
        else {
          unsigned int v14 = (dispatch_queue_t *)a1;
        }
        dispatch_async_and_wait(*v14, &stru_1000298D8);
      }

      unsigned int v10 = 0;
      v9 |= 1uLL;
LABEL_12:
      ;
    }

    while (__stxr(v10 | (v9 << 32), v7));
    if (v10 != (_DWORD)v8) {
      break;
    }
    if (!v9) {
      goto LABEL_24;
    }
    do
    {
      if ((__ulock_wait(65538LL, a1 + 1108, v9, 0LL) & 0x80000000) == 0) {
        goto LABEL_8;
      }
      int v11 = *__error();
    }

    while (v11 == 4);
    if (v11 > 0x3C || ((1LL << v11) & 0x1000000000004001LL) == 0)
    {
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: ulock_wait() failed";
      qword_10002DF78 = v11;
      __break(1u);
      goto LABEL_53;
    }
  }

  uint64_t v15 = __clz(__rbit32(v8));
  if ((_DWORD)v8) {
    LODWORD(v5) = v15;
  }
  else {
    LODWORD(v5) = -1;
  }
  uint64_t v16 = v4 + 264LL * v5;
  uint64_t v18 = *(void *)(v16 + 240);
  uint64_t v17 = (void *)(v16 + 240);
  if (!v18)
  {
    size_t v19 = *(unsigned int *)(v4 + 264LL * v5 + 248);
    uint64_t v20 = (void *)(*(void *)(a1 + 1112) + (v19 * v5));
    void *v17 = v20;
    madvise(v20, v19, 8);
  }

  *(_DWORD *)(a1 + 1128) = v5;
LABEL_36:
  uint64_t v21 = v4 + 264LL * v5;
  size_t v42 = 0xAAAAAAAAAAAAAAAALL;
  if (!*(_DWORD *)v21)
  {
    *(void *)uint64_t v21 = 0x1100001000LL;
    *(void *)(v21 + 8) = 208LL;
    *(_DWORD *)(v21 + 52) = 1;
    mach_timebase_info((mach_timebase_info_t)(v21 + 16));
    *(void *)(v21 + 56) = 0x800006100LL;
    *(void *)(v21 + 72) = 0x3800006101LL;
    *(void *)(v21 + 136) = 0x1800006102LL;
    *(void *)(v21 + 168) = 0x3000006103LL;
    size_t v42 = 4LL;
    sysctlbyname("hw.cputype", (void *)(v21 + 80), &v42, 0LL, 0LL);
    size_t v42 = 4LL;
    sysctlbyname("hw.cpusubtype", (void *)(v21 + 84), &v42, 0LL, 0LL);
    size_t v42 = 16LL;
    sysctlbyname("kern.osversion", (void *)(v21 + 88), &v42, 0LL, 0LL);
    size_t v42 = 32LL;
    uint64_t v22 = sysctlbyname("hw.model", (void *)(v21 + 104), &v42, 0LL, 0LL);
    boot_uuid = (const char *)_os_trace_get_boot_uuid(v22);
    uuid_parse(boot_uuid, (unsigned __int8 *)(v21 + 144));
    *(_DWORD *)(v21 + 16sub_100021ACC(qword_10003A798, 0) = getpid();
  }

  int v24 = *(_DWORD *)(a1 + 1244);
  int v25 = *(_DWORD *)(v21 + 52);
  if ((v24 & 1) != 0)
  {
    unsigned int v26 = v25 | 2;
    *(_DWORD *)(a1 + 1244) = v24 & 0xFFFFFFFE;
  }

  else
  {
    unsigned int v26 = v25 & 0xFFFFFFFD;
  }

  *(_DWORD *)(v21 + 52) = v26;
  uint64_t v27 = *(void *)(a1 + 16);
  *(void *)(v21 + 64) = *(void *)(a1 + 24);
  time_t v28 = *(void *)(a1 + 32);
  uint64_t v29 = *(void *)(a1 + 40);
  *(void *)(v21 + 24) = v27;
  *(void *)(v21 + 32) = v28;
  *(_DWORD *)(v21 + 4sub_100021ACC(qword_10003A798, 0) = (int)v29 / 1000;
  time_t v41 = v28;
  __b.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v30 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&__b.tm_mon = v30;
  *(_OWORD *)&__b.int tm_isdst = v30;
  *(_OWORD *)&__b.tm_sec = v30;
  uint64_t result = localtime_r(&v41, &__b);
  int tm_isdst = __b.tm_isdst;
  *(_DWORD *)(v21 + 48) = __b.tm_isdst;
  if (__OFSUB__(0LL, __b.tm_gmtoff))
  {
    __break(0x550Du);
    goto LABEL_56;
  }

  uint64_t v33 = 60LL * tm_isdst;
  if (v33 != (int)v33)
  {
LABEL_56:
    __break(0x550Cu);
    goto LABEL_57;
  }

  int v34 = -LODWORD(__b.tm_gmtoff) / 60;
  BOOL v35 = __OFADD__(v34, (_DWORD)v33);
  int v36 = v34 + v33;
  if (!v35)
  {
    *(_DWORD *)(v21 + 44) = v36;
    *(_OWORD *)(v21 + 176) = 0u;
    uint64_t v37 = v21 + 176;
    *(_OWORD *)(v37 + 16) = 0u;
    *(_OWORD *)(v37 + 32) = 0u;
    memset(&__b, 170, 0x400uLL);
    unint64_t v38 = readlink("/private/var/db/timezone/localtime", (char *)&__b, 0x3FFuLL);
    if ((v38 & 0x8000000000000000LL) != 0) {
      return (tm *)v15;
    }
    if (v38 < 0x400)
    {
      if (v38 <= ~(unint64_t)&__b)
      {
        *((_BYTE *)&__b.tm_sec + v38) = 0;
        unsigned int v39 = strstr((const char *)&__b, "/private/var/db/timezone/zoneinfo/zoneinfo/");
        unint64_t v40 = 43LL;
        if (!v39) {
          unint64_t v40 = 0LL;
        }
        if (v40 <= ~(unint64_t)&__b)
        {
          strlcpy((char *)v37, (const char *)&__b + v40, 0x30uLL);
          return (tm *)v15;
        }
      }

LABEL_53:
      __break(0x5513u);
    }

    int v36 = v34[1];
    if (v30.u32[0] > 1uLL)
    {
      if (v36 >= *(void *)&v28) {
        v36 %= *(void *)&v28;
      }
    }

    else
    {
      v36 &= *(void *)&v28 - 1LL;
    }

    if (v36 != v29)
    {
      *(void *)(*v24 + 8 * v36) = v32;
      int v34 = (void *)*v25;
    }

    goto LABEL_59;
  }

LABEL_54:
    __break(0x5512u);
  }

LABEL_57:
  __break(0x5500u);
  return result;
}

uint64_t sub_100011C34(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 8);
  size_t v5 = v4 + 16;
  if ((v4 & 7) != 0) {
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 24;
  }
  else {
    unint64_t v6 = v4 + 16;
  }
  uint64_t result = (uint64_t)sub_100011778(v2, v6);
  uint64_t v8 = *(void *)(a1 + 40) + 48LL;
  unsigned int v9 = result;
  if (v6 >= *(unsigned int *)(v8 + 264LL * result + 248))
  {
    uint64_t v39 = _os_assert_log(0LL);
    uint64_t result = _os_crash(v39);
    __break(1u);
    goto LABEL_29;
  }

  if ((int)*(void *)(a1 + 48) >= 1)
  {
    unint64_t v10 = 0LL;
    uint64_t v11 = *(void *)(a1 + 56);
    unint64_t v12 = ~v11;
    uint64_t v13 = v11 + 8;
    size_t v14 = v5;
    while (v10 <= v12)
    {
      v14 -= *(void *)(v13 + v10);
      v10 += 16LL;
    }

    goto LABEL_29;
  }

  size_t v14 = v5;
LABEL_13:
  uint64_t v15 = v8 + 264LL * result;
  uint64_t v18 = *(void *)(v15 + 240);
  uint64_t v17 = (void *)(v15 + 240);
  uint64_t v16 = v18;
  uint64_t v20 = (int32x2_t *)((char *)v17 + 12);
  uint64_t v19 = *((unsigned int *)v17 + 3);
  if (__CFADD__(v18, v19)) {
    goto LABEL_29;
  }
  uint64_t result = (uint64_t)memcpy((void *)(v16 + v19), *(const void **)(a1 + 32), v14);
  unsigned int v21 = v20->i32[0] + v14;
  v20->i32[0] = v21;
  if (*(int *)(a1 + 48) >= 1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    while (!__CFADD__(*v17, v21))
    {
      uint64_t v24 = *(void *)(a1 + 56);
      if (__CFADD__(v24, v22)) {
        break;
      }
      uint64_t result = (uint64_t)memcpy((void *)(*v17 + v21), *(const void **)(v24 + v22), *(void *)(v24 + v22 + 8));
      uint64_t v25 = *(void *)(a1 + 56);
      if (__CFADD__(v25, v22)) {
        break;
      }
      unsigned int v21 = v20->i32[0] + *(_DWORD *)(v25 + v22 + 8);
      v20->i32[0] = v21;
      ++v23;
      v22 += 16LL;
    }

    goto LABEL_29;
  }

void sub_100011F0C(uint64_t a1, dispatch_group_s *a2, dispatch_queue_s **a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  sub_10000FC68(a1);
  if (v6)
  {
    uint64_t v7 = *(dispatch_queue_s **)(v6 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100012004;
    block[3] = &unk_100029750;
    void block[4] = a1;
    dispatch_group_async(a2, v7, block);
  }

  else
  {
    uint64_t v8 = *a3;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000LL;
    _WORD v9[2] = sub_10001200C;
    v9[3] = &unk_100029790;
    v9[4] = a3;
    v9[5] = a1;
    dispatch_sync(v8, v9);
  }

void sub_100012004(uint64_t a1)
{
}

void sub_10001200C(int8x16_t *a1)
{
  block[1] = 0x40000000LL;
  int8x16_t v2 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v3 = a1[2].i64[0];
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000120B0;
  block[3] = &unk_100029770;
  uint64_t v4 = *(dispatch_queue_s **)(*(void *)(v3 + 8) + 16LL);
  int8x16_t v6 = v2;
  dispatch_sync(v4, block);
}

void sub_1000120B0(uint64_t a1)
{
  if (__OFADD__(v2, 1)) {
    goto LABEL_25;
  }
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 1172LL);
  if (v2 == 0x7FFFFFFF && (_DWORD)v3 == -1) {
    goto LABEL_26;
  }
  int v5 = (v2 + 1) % (int)v3;
  if ((v3 & 0x80000000) == 0)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 280LL * v5;
    do
    {
      unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 1136LL);
      BOOL v9 = __CFADD__(v7, v8);
      BOOL v10 = v7 + v8 >= v8;
      if (v6 < 0) {
        BOOL v10 = v9;
      }
      if (!v10) {
        goto LABEL_24;
      }
      if (*(void *)(v8 + v7 + 232))
      {
        sub_10000FF38(v8 + v7);
        (**(void (***)(void))(*(void *)(a1 + 40) + 8LL))();
      }

      ++v6;
      v7 += 280LL;
    }

    while (v6 < v3);
  }

  if (v5 >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 280LL * v5;
    while (1)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 1136LL);
      if (__CFADD__(v13, v11)) {
        break;
      }
      if (*(void *)(v13 + v11 + 232))
      {
        sub_10000FF38(v13 + v11);
        (**(void (***)(void))(*(void *)(a1 + 40) + 8LL))();
      }

      v11 += 280LL;
      if (v12 == v11) {
        return;
      }
    }

LABEL_24:
    __break(0x5513u);
LABEL_25:
    __break(0x5500u);
LABEL_26:
    __break(0x5503u);
  }

void sub_1000121DC(uint64_t a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3002000000LL;
  unint64_t v8 = sub_1000122BC;
  BOOL v9 = sub_1000122CC;
  uint64_t v10 = 0LL;
  uint64_t v1 = *(dispatch_queue_s **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  void v4[2] = sub_1000122D8;
  v4[3] = &unk_1000297D8;
  v4[5] = a1;
  v4[6] = v2;
  v4[4] = &v5;
  dispatch_sync(v1, v4);
  uint64_t v3 = (void *)v6[5];
  if (v3)
  {
    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    _Block_release((const void *)v6[5]);
  }

  _Block_object_dispose(&v5, 8);
}

void sub_1000122BC(uint64_t a1, uint64_t a2)
{
}

void sub_1000122CC(uint64_t a1)
{
}

void sub_1000122D8(void *a1)
{
  uint64_t v2 = a1[5];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)v2);
  int v3 = *(_DWORD *)(v2 + 1128);
  *(_DWORD *)(v2 + 1128) = -1;
  int times = mach_get_times(v2 + 16, v2 + 24, v2 + 32);
  if (times) {
    _os_assumes_log(times);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  v6[2] = sub_1000123E0;
  v6[3] = &unk_1000297B0;
  int v9 = v3;
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = v5;
  if (v7)
  {
    *(void *)(*(void *)(a1[4] + 8LL) + 40LL) = dispatch_block_create((dispatch_block_flags_t)0LL, v6);
    dispatch_async(*(dispatch_queue_t *)(a1[6] + 16LL), *(dispatch_block_t *)(*(void *)(a1[4] + 8LL) + 40LL));
  }

  else
  {
    sub_1000123E0((uint64_t)v6);
  }

void sub_1000123E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_14;
  }
  memset(__b, 170, sizeof(__b));
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  snprintf((char *)__b, 0x400uLL, "%s/%s", (const char *)qword_10003A958, *(const char **)(v2 + 8));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  sub_100012C38(v2);
  *(void *)(v2 + 56) = 0LL;
  *(_DWORD *)(v2 + 64) = 0;
  removefile((const char *)__b, 0LL, 3u);
  int v29 = -1442840576;
  size_t v26 = v31;
  uint64_t v28 = 1024LL;
  memset(&v31[1], 170, 0x3F0uLL);
  v31[0] = *(_OWORD *)"--- !logd erase\n";
  *(void *)&v31[1] = 0x203A2020656D6974LL;
  unsigned int v27 = 24;
  BYTE8(v31[1]) = 0;
  time_t v3 = time(0LL);
  sub_100006000((tm *)&v26, v3);
  sub_100005E78(&v26, "\npath  : %s\n", v4, v5, v6, v7, v8, v9, (char)__b);
  char __src = 10;
  char v10 = v29;
  if ((v29 & 2) != 0) {
    goto LABEL_12;
  }
  char v11 = BYTE2(v29);
  unsigned int v12 = v27;
  if (SBYTE2(v29) + (_DWORD)v28 - 1 != v27)
  {
    uint64_t v13 = v26;
    unint64_t v14 = ~(unint64_t)v26;
    if (~(unint64_t)v26 >= v27)
    {
      *((_BYTE *)v26 + v27) = 10;
      uint64_t v15 = v12 + 1;
      unsigned int v27 = v15;
      if (v11) {
        goto LABEL_12;
      }
      if (v14 >= v15)
      {
        v13[v15] = 0;
        goto LABEL_12;
      }
    }

LABEL_29:
    __break(0x5513u);
  }

  sub_100005DAC((uint64_t)&v26, &__src, 1uLL);
  char v10 = v29;
LABEL_12:
  sub_100007370();
  if ((v10 & 1) != 0) {
    free(v26);
  }
LABEL_14:
  unsigned int v16 = *(_DWORD *)(a1 + 48);
  if (v16 != -1) {
    sub_100010864(*(void *)(a1 + 40), v16);
  }
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = v17;
  if (*(int *)(v17 + 1172) >= 1)
  {
    int v19 = 0;
    do
      sub_10000FF90(*(void *)(a1 + 40), v19++);
    while (v19 < *(_DWORD *)(v17 + 1172));
    uint64_t v18 = *(void *)(a1 + 40);
  }

  *(_DWORD *)(v17 + 1168) = 0;
  uint64_t v20 = *(void *)(v18 + 8);
  if (v20) {
    unsigned int v21 = (dispatch_queue_t *)(v20 + 16);
  }
  else {
    unsigned int v21 = (dispatch_queue_t *)v18;
  }
  dispatch_assert_queue_V2(*v21);
  if (*(unsigned __int8 *)(v18 + 1240) <= 4u)
  {
    __b[0] = _NSConcreteStackBlock;
    __b[1] = 0x40000000LL;
    __b[2] = sub_1000074C4;
    __b[3] = &unk_100028E60;
    __b[4] = v18;
    sub_1000075B4((uint64_t)__b);
    uint64_t v22 = (rb_tree_t *)(v18 + 1176);
    uint64_t v23 = rb_tree_iterate((rb_tree_t *)(v18 + 1176), 0LL, 1u);
    if (v23)
    {
      uint64_t v24 = v23;
      do
      {
        uint64_t v25 = rb_tree_iterate(v22, v24, 1u);
        rb_tree_remove_node(v22, v24);
        free(v24);
        uint64_t v24 = v25;
      }

      while (v25);
    }
  }

void sub_1000126E8(const char *a1)
{
  plist_at = (void *)_os_trace_read_plist_at(4294967294LL, __b);
  if (plist_at)
  {
    time_t v3 = plist_at;
    sub_100012860(plist_at, "QuarantineLimit", (uint64_t *)&xmmword_10003A930, (xpc_type_t)&_xpc_type_uint64);
    sub_100012860(v3, "SuperQuaratineLimit", (uint64_t *)&xmmword_10003A930 + 1, (xpc_type_t)&_xpc_type_uint64);
    sub_100012860(v3, "CoalitionSize", (uint64_t *)&qword_10003A940, (xpc_type_t)&_xpc_type_uint64);
    sub_100012860(v3, "QuarantineRatio", (uint64_t *)&qword_10003A948, (xpc_type_t)&_xpc_type_double);
    sub_100012860(v3, "DisableQuarantine", (uint64_t *)&word_10003A950, (xpc_type_t)&_xpc_type_BOOL);
    sub_100012860(v3, "DisableSuperQuarantine", (uint64_t *)((char *)&word_10003A950 + 1), (xpc_type_t)&_xpc_type_BOOL);
    sub_100012860(v3, "DisableHighVolOverrides", (uint64_t *)&byte_10003A952, (xpc_type_t)&_xpc_type_BOOL);
    xpc_release(v3);
  }

void sub_100012860(void *a1, const char *a2, uint64_t *a3, xpc_type_t a4)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  xpc_type_t type = xpc_get_type(value);
  if (value && type == a4)
  {
    if (a4 == (xpc_type_t)&_xpc_type_uint64)
    {
      *a3 = xpc_uint64_get_value(value);
    }

    else if (a4 == (xpc_type_t)&_xpc_type_double)
    {
      *(double *)a3 = xpc_double_get_value(value);
    }

    else if (a4 == (xpc_type_t)&_xpc_type_BOOL)
    {
      *(_BYTE *)a3 = xpc_BOOL_get_value(value);
    }
  }

void sub_1000128FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!*(_BYTE *)(v3 + 88))
  {
    uint64_t v5 = *(void *)(v3 + 48);
    if (v5)
    {
      uint64_t v6 = *(void *)(v3 + 40);
      uint64_t v7 = *(void *)(a2 + 232);
      BOOL v8 = __OFADD__(v6, v7);
      uint64_t v9 = v6 + v7;
      if (v8) {
        goto LABEL_39;
      }
      if (v9 > v5)
      {
        sub_100012C38(*(void *)(a1 + 8));
        sub_100006510(v2, v3);
      }
    }

    unint64_t v10 = *(void *)(a2 + 248);
    if (v10 < *(void *)(v3 + 72)) {
      *(void *)(v3 + 72) = v10;
    }
    unint64_t v11 = *(void *)(a2 + 256);
    if (v11 > *(void *)(v3 + 80)) {
      *(void *)(v3 + 8sub_100021ACC(qword_10003A798, 0) = v11;
    }
    uint64_t v12 = *(unsigned int *)(v3 + 68);
    if ((_DWORD)v12 != -1)
    {
LABEL_13:
      if (*(void *)(v3 + 40)) {
        goto LABEL_17;
      }
      a1 = _os_trace_write(v12, a2, *(void *)(a2 + 8) + 16LL);
      if (a1 == -1) {
        goto LABEL_35;
      }
      uint64_t v13 = *(void *)(v3 + 40);
      BOOL v8 = __OFADD__(v13, a1);
      uint64_t v14 = v13 + a1;
      if (!v8)
      {
        *(void *)(v3 + 4sub_100021ACC(qword_10003A798, 0) = v14;
        uint64_t v12 = *(unsigned int *)(v3 + 68);
LABEL_17:
        a1 = _os_trace_writev(v12, *(void *)(a2 + 272), *(unsigned int *)(a2 + 264));
        if (a1 != -1)
        {
          uint64_t v15 = *(void *)(v3 + 40);
          BOOL v8 = __OFADD__(v15, a1);
          uint64_t v16 = v15 + a1;
          if (!v8)
          {
            *(void *)(v3 + 4sub_100021ACC(qword_10003A798, 0) = v16;
            sub_100013084(v3);
            return;
          }

          goto LABEL_39;
        }

LABEL_35:
        uint64_t v24 = __error();
        _os_assumes_log(*v24);
        return;
      }

LABEL_27:
    memset(__b, 170, sizeof(__b));
    while (1)
    {
      uint64_t v20 = *(void *)(v3 + 24);
      *(void *)(v3 + 24) = v20 + 1;
      snprintf(__b, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v3 + 8), v20);
      uint64_t v12 = sub_100012F84(dword_10002DBF8, __b, 2569);
      *(_DWORD *)(v3 + 68) = v12;
      if ((_DWORD)v12 != -1) {
        goto LABEL_13;
      }
      unsigned int v21 = __error();
      _os_assumes_log(*v21);
      int v22 = *__error();
      if (v22 != 4 && v22 != 17)
      {
        if (v22) {
          return;
        }
        uint64_t v12 = *(unsigned int *)(v3 + 68);
        goto LABEL_13;
      }
    }
  }

  if (*(_DWORD *)(v3 + 68) == -1)
  {
    memset(__b, 170, sizeof(__b));
    snprintf( __b,  0x400uLL,  "%s: writes blocked (and dropped) for %s/%016llx.tracev3",  "_logd_book_persist_handler",  *(const char **)(v3 + 8),  *(void *)(v3 + 24));
    sub_10000B70C((uint64_t)__b);
  }

  else
  {
    memset(__b, 170, sizeof(__b));
    snprintf( __b,  0x400uLL,  "%s: writes blocked (and dropped), %s/%016llx.tracev3 unexpectedly already open",  "_logd_book_persist_handler",  *(const char **)(v3 + 8),  *(void *)(v3 + 24) - 1LL);
    sub_10000B70C((uint64_t)__b);
    sub_100012C38(v3);
    sub_100006510(v2, v3);
  }

uint64_t sub_100012C38(uint64_t result)
{
  uint64_t v1 = result;
  if ((*(_DWORD *)(result + 68) & 0x80000000) != 0) {
    goto LABEL_7;
  }
  sub_100013084(result);
  uint64_t result = close(*(_DWORD *)(v1 + 68));
  if ((_DWORD)result == -1)
  {
    int v8 = *__error();
    uint64_t result = *__error();
    if (v8 == 9) {
      goto LABEL_11;
    }
    uint64_t result = _os_assumes_log(result);
  }

  *(_DWORD *)(v1 + 68) = -1;
  int v2 = *(_DWORD *)(v1 + 64);
  BOOL v3 = __OFADD__(v2, 1);
  int v4 = v2 + 1;
  if (!v3)
  {
    *(_DWORD *)(v1 + 64) = v4;
    uint64_t v5 = *(void *)(v1 + 40);
    uint64_t v6 = (unint64_t *)(v1 + 56);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + v5, v6));
    if (!__OFADD__(v7, v5))
    {
LABEL_7:
      *(void *)(v1 + 4sub_100021ACC(qword_10003A798, 0) = 0LL;
      *(_OWORD *)(v1 + 72) = xmmword_100024870;
      return result;
    }
  }

  __break(0x5500u);
LABEL_11:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

uint64_t sub_100012D08(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = a5;
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v40.st_blkmach_vm_size_t size = v9;
  *(timespec *)v40.st_qspare = v9;
  v40.st_birthtimespec = v9;
  *(timespec *)&v40.st_mach_vm_size_t size = v9;
  v40.st_mtimespec = v9;
  v40.st_ctimespec = v9;
  *(timespec *)&v40.st_uid = v9;
  v40.st_atimespec = v9;
  *(timespec *)&v40.st_dev = v9;
  *(void *)&v39[24] = 0LL;
  uint64_t v10 = *(void *)(a1 + 56);
  unsigned int v37 = sub_10001313C(a1, a5, (uint64_t)&v39[24]);
  memset(&v39[32], 170, 0x400uLL);
  *(void *)&v39[16] = 0xAA00000000100000LL;
  *(void *)uint64_t v39 = &v39[32];
  *(void *)&v39[8] = 0x40000000000LL;
  if (a2 >= 4) {
    goto LABEL_30;
  }
  if (~(unint64_t)off_100029B20 < 8 * (unint64_t)a2)
  {
LABEL_28:
    __break(0x5513u);
LABEL_29:
    __break(0x5500u);
LABEL_30:
    __break(0x5512u);
  }

  sub_1000131EC((tm *)v39, a1, (uint64_t)off_100029B20[a2], a3, v11, v12, v13, v14, v36);
  uint64_t v19 = v37;
  if ((int)v37 < 1)
  {
    uint64_t v22 = 0LL;
    *(_DWORD *)(a1 + 64) = v37;
    goto LABEL_24;
  }

  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = v37;
  while (1)
  {
    if ((int)v23 <= *(_DWORD *)(a1 + 92))
    {
      if (a3 < 1) {
        break;
      }
      if (__OFSUB__(v10, v22)) {
        goto LABEL_27;
      }
      if (v10 - v22 <= a4) {
        break;
      }
    }

    if (__CFADD__(*(void *)&v39[24], v20)) {
      goto LABEL_28;
    }
    uint64_t v24 = (const char *)(*(void *)(*(void *)&v39[24] + v20) + 21LL);
    if (fstatat(v5, v24, &v40, 32) == -1) {
      v40.st_mach_vm_size_t size = 0LL;
    }
    if (unlinkat(v5, v24, 0) == -1)
    {
      uint64_t v32 = __error();
      _os_assumes_log(*v32);
    }

    BOOL v31 = __OFADD__(v22, v40.st_size);
    v22 += v40.st_size;
    if (v31) {
      goto LABEL_29;
    }
    BOOL v31 = __OFSUB__(a3, v40.st_size);
    a3 -= v40.st_size;
    if (v31) {
      goto LABEL_27;
    }
    sub_100005E78(v39, "    - %s/%s: %lld bytes\n", v25, v26, v27, v28, v29, v30, *(void *)(a1 + 8));
    *(void *)(a1 + 32) = sub_1000133AC(v24);
    ++v21;
    v20 += 8LL;
    if (!--v23)
    {
      unsigned int v33 = v37;
      uint64_t v21 = v37;
      goto LABEL_20;
    }
  }

  unsigned int v33 = v37;
LABEL_20:
  BOOL v31 = __OFSUB__(v33, (_DWORD)v21);
  int v34 = v33 - v21;
  if (v31)
  {
LABEL_27:
    __break(0x5515u);
    goto LABEL_28;
  }

  *(_DWORD *)(a1 + 64) = v34;
  if ((_DWORD)v21) {
    sub_100013440(v39, a1, v21, v22, v15, v16, v17, v18);
  }
  uint64_t v19 = v37;
LABEL_24:
  if ((v39[20] & 1) != 0) {
    free(*(void **)v39);
  }
  _os_trace_scandir_free_namelist(v19, *(void *)&v39[24]);
  return v22;
}

uint64_t sub_100012F84(int a1, const char *a2, int a3)
{
  __int16 v3 = a3;
  uint64_t v4 = openat(a1, a2, a3, 420LL);
  if (qword_10003A978 == -1)
  {
    if ((v3 & 0x200) == 0) {
      return v4;
    }
  }

  else
  {
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
    if ((v3 & 0x200) == 0) {
      return v4;
    }
  }

  if (byte_10003A980 && (_DWORD)v4 != -1)
  {
    uint64_t v10 = 0LL;
    __int128 v9 = xmmword_100024768;
    if (sub_10002256C()) {
      int v5 = 3;
    }
    else {
      int v5 = 2;
    }
    int v8 = v5;
    if (fsetattrlist(v4, &v9, &v8, 4uLL, 0) == -1)
    {
      unint64_t v7 = __error();
      _os_assumes_log(*v7);
    }
  }

  return v4;
}

uint64_t sub_100013084(uint64_t a1)
{
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, (unsigned __int8 *)&v6);
  int v3 = *(_DWORD *)(a1 + 68);
  *(void *)&v8[12] = 0xAAAAAAAAAAAAAAAALL;
  int value = 1;
  __int128 v9 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)int v8 = v6;
  uint64_t result = fsetxattr(v3, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0);
  if ((_DWORD)result == -1)
  {
    int v5 = __error();
    return _os_assumes_log(*v5);
  }

  return result;
}

uint64_t sub_10001313C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100013598;
  v7[3] = &unk_100029B40;
  v7[4] = a1;
  return _os_trace_fdscandir_b(a2, a3, v7, &stru_100029B80);
}

uint64_t sub_1000131EC( tm *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v9 = a4;
  if ((a1->tm_year & 2) == 0)
  {
    uint64_t tm_hour = a1->tm_hour;
    if ((SBYTE2(a1->tm_year) + a1->tm_mday - tm_hour - 1) <= 0x16)
    {
      sub_100005DAC((uint64_t)a1, "--- !logd purge record\n", 0x17uLL);
    }

    else
    {
      if (__CFADD__(*(void *)&a1->tm_sec, tm_hour)) {
        goto LABEL_16;
      }
      qmemcpy((void *)(*(void *)&a1->tm_sec + tm_hour), "--- !logd purge record\n", 23);
      uint64_t v13 = (a1->tm_hour + 23);
      a1->uint64_t tm_hour = v13;
      if (!BYTE2(a1->tm_year))
      {
        *(_BYTE *)(*(void *)&a1->tm_sec + v13) = 0;
      }
    }
  }

  sub_100005E78(a1, "type  : %s %s\n", a3, a4, a5, a6, a7, a8, *(void *)(a2 + 8));
  sub_100005E78(a1, "goal  : %lld\n", v14, v15, v16, v17, v18, v19, v9);
  sub_100005E78(a1, "time  : ", v20, v21, v22, v23, v24, v25, v36);
  time_t v26 = time(0LL);
  sub_100006000(a1, v26);
  char __src = 10;
  if ((a1->tm_year & 2) == 0)
  {
    uint64_t v33 = a1->tm_hour;
    if (SBYTE2(a1->tm_year) + a1->tm_mday - 1 == (_DWORD)v33)
    {
      sub_100005DAC((uint64_t)a1, &__src, 1uLL);
      return sub_100005E78(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
    }

    if (__CFADD__(*(void *)&a1->tm_sec, v33)) {
      goto LABEL_16;
    }
    *(_BYTE *)(*(void *)&a1->tm_sec + v33) = 10;
    uint64_t v34 = (a1->tm_hour + 1);
    a1->uint64_t tm_hour = v34;
    if (!BYTE2(a1->tm_year))
    {
      if (!__CFADD__(*(void *)&a1->tm_sec, v34))
      {
        *(_BYTE *)(*(void *)&a1->tm_sec + v34) = 0;
        return sub_100005E78(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
      }

unint64_t sub_1000133AC(const char *a1)
{
  __s1 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = strtoull(a1, &__s1, 16);
  if (__s1 - a1 != 16) {
    return 0LL;
  }
  if (!strcmp(__s1, ".tracev3")) {
    return v2;
  }
  return 0LL;
}

void sub_100013440( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a4;
  uint64_t v11 = (unint64_t *)(a2 + 56);
  do
  {
    unint64_t v12 = __ldxr(v11);
    unint64_t v13 = v12 - a4;
  }

  while (__stxr(v12 - a4, v11));
  if (__OFSUB__(v12, a4)) {
LABEL_16:
  }
    __break(0x5515u);
  sub_100005E78(a1, "count : %d\n", a3, a4, a5, a6, a7, a8, a3);
  sub_100005E78(a1, "size  : %lld\n", v14, v15, v16, v17, v18, v19, v8);
  int v26 = *(_DWORD *)(a2 + 64);
  BOOL v27 = *(_DWORD *)(a2 + 68) != -1;
  BOOL v28 = __OFADD__(v26, v27);
  char v29 = v26 + v27;
  if (v28 || __OFADD__(v13, *(void *)(a2 + 40)))
  {
    __break(0x5500u);
    goto LABEL_15;
  }

  sub_100005E78(a1, "kept  : %d files, %lld bytes\n", v20, v21, v22, v23, v24, v25, v29);
  char __src = 10;
  if ((*((_WORD *)a1 + 10) & 2) != 0) {
    goto LABEL_12;
  }
  uint64_t v30 = *((unsigned int *)a1 + 2);
  if (*((char *)a1 + 22) + *((_DWORD *)a1 + 3) - 1 == (_DWORD)v30)
  {
    sub_100005DAC((uint64_t)a1, &__src, 1uLL);
    goto LABEL_12;
  }

  if (__CFADD__(*a1, v30))
  {
LABEL_15:
    __break(0x5513u);
    goto LABEL_16;
  }

  *(_BYTE *)(*a1 + v3sub_100021ACC(qword_10003A798, 0) = 10;
  uint64_t v31 = (*((_DWORD *)a1 + 2) + 1);
  *((_DWORD *)a1 + 2) = v31;
  if (!*((_BYTE *)a1 + 22))
  {
    if (!__CFADD__(*a1, v31))
    {
      *(_BYTE *)(*a1 + v31) = 0;
      goto LABEL_12;
    }

    goto LABEL_15;
  }

char *sub_100013598(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 20) != 8) {
    return 0LL;
  }
  int v3 = (const char *)(a2 + 21);
  uint64_t result = strrchr((const char *)(a2 + 21), 46);
  if (!result) {
    return result;
  }
  if (strcmp(result, ".tracev3")) {
    return 0LL;
  }
  if (!strncmp(v3, "logdata.Persistent.", 0x13uLL)) {
    return (char *)1;
  }
  unint64_t v5 = sub_1000133AC(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(v6 + 68);
  unint64_t v8 = *(void *)(v6 + 24);
  BOOL v9 = v8 < 2 || v7 == -1;
  uint64_t v10 = -2LL;
  if (v9) {
    uint64_t v10 = -1LL;
  }
  return (char *)(v5 - 1 < v8 + v10);
}

int sub_100013644(id a1, const dirent **a2, const dirent **a3)
{
  int v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  int v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0)) {
    return (v5 != 0) - (v6 != 0);
  }
  else {
    return alphasort(a2, a3);
  }
}

int *sub_1000136EC(int a1, const char *a2)
{
  unint64_t v2 = a2;
  uint64_t result = (int *)mkpathat_np(a1, a2, 0x1EDu);
  if ((_DWORD)result && (_DWORD)result != 17) {
    goto LABEL_17;
  }
  if (qword_10003A978 != -1) {
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
  }
  if (!byte_10003A980) {
    goto LABEL_12;
  }
  uint64_t v12 = 0LL;
  __int128 v11 = xmmword_100024750;
  uint64_t v10 = 0x4000001EDLL;
  int v5 = openat(a1, v2, 0x100000);
  if (v5 == -1)
  {
    uint64_t result = __error();
    uint64_t v9 = *result;
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to open path";
    qword_10002DF78 = v9;
    __break(1u);
LABEL_17:
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to create path";
    qword_10002DF78 = (int)result;
    __break(1u);
    return result;
  }

  int v6 = v5;
  if (fsetattrlist(v5, &v11, &v10, 8uLL, 0) == -1)
  {
    unint64_t v8 = __error();
    _os_assumes_log(*v8);
  }

  uint64_t result = (int *)close(v6);
  if ((_DWORD)result == -1)
  {
    unint64_t v2 = (const char *)*__error();
    uint64_t v7 = *__error();
    if ((_DWORD)v2 != 9) {
      return (int *)_os_assumes_log(v7);
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v7;
    __break(1u);
LABEL_12:
    uint64_t result = (int *)fchmodat(a1, v2, 0x1EDu, 32);
    if ((_DWORD)result != -1) {
      return result;
    }
    uint64_t v7 = *__error();
    return (int *)_os_assumes_log(v7);
  }

  return result;
}

uint64_t sub_1000138C0(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = qword_10003A900;
  return result;
}

uint64_t sub_1000138D8(uint64_t a1)
{
  int v2 = openat(dword_10002DBF8, *(const char **)(a1 + 8), 1048832);
  if (v2 < 0)
  {
LABEL_19:
    uint64_t v17 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to open log book";
    qword_10002DF78 = v17;
    __break(1u);
  }

  int v3 = v2;
  uint64_t v4 = fdopendir(v2);
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v18.st_blkmach_vm_size_t size = v5;
  *(timespec *)v18.st_qspare = v5;
  v18.st_birthtimespec = v5;
  *(timespec *)&v18.st_mach_vm_size_t size = v5;
  v18.st_mtimespec = v5;
  v18.st_ctimespec = v5;
  *(timespec *)&v18.st_uid = v5;
  v18.st_atimespec = v5;
  *(timespec *)&v18.st_dev = v5;
  int v6 = readdir(v4);
  for (i = 0LL; v6; int v6 = readdir(v4))
  {
    if (v6->d_type == 8)
    {
      d_name = v6->d_name;
      uint64_t v9 = strrchr(v6->d_name, 46);
      if (v9)
      {
        if (!strcmp(v9, ".tracev3"))
        {
          if (fstatat(v3, d_name, &v18, 32) == -1)
          {
            uint64_t v14 = __error();
            _os_assumes_log(*v14);
          }

          else
          {
            BOOL v10 = __OFADD__(i, v18.st_size);
            i += v18.st_size;
            if (v10) {
              goto LABEL_18;
            }
          }

          unint64_t v11 = sub_1000133AC(d_name);
          if (v11 >= *(void *)(a1 + 24)) {
            *(void *)(a1 + 24) = v11 + 1;
          }
          int v12 = *(_DWORD *)(a1 + 64);
          BOOL v10 = __OFADD__(v12, 1);
          int v13 = v12 + 1;
          if (v10)
          {
LABEL_18:
            __break(0x5500u);
            goto LABEL_19;
          }

          *(_DWORD *)(a1 + 64) = v13;
        }
      }
    }
  }

  *(void *)(a1 + 72) = -1LL;
  uint64_t result = closedir(v4);
  if ((_DWORD)result == -1)
  {
    uint64_t v16 = __error();
    uint64_t result = _os_assumes_log(*v16);
  }

  *(void *)(a1 + 56) = i;
  return result;
}

uint64_t sub_100013A88(uint64_t a1)
{
  uint64_t result = sub_100012D08( *(void *)(a1 + 40),  *(_DWORD *)(a1 + 64),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(unsigned int *)(a1 + 68));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100013AC0()
{
  time_t v0 = time(0LL);
  time_t v1 = v0 - 86400;
  if (__OFADD__(v0, -86400LL)) {
LABEL_64:
  }
    __break(0x5515u);
  v84[0] = 0LL;
  v84[1] = v84;
  v84[2] = 0x2020000000LL;
  v84[3] = 0LL;
  v83[0] = 0LL;
  v83[1] = v83;
  v83[2] = 0x2020000000LL;
  v83[3] = 0LL;
  v82[0] = 0LL;
  v82[1] = v82;
  v82[2] = 0x2020000000LL;
  v82[3] = 0LL;
  uint64_t v78 = 0LL;
  unint64_t v79 = &v78;
  uint64_t v80 = 0x2020000000LL;
  uint64_t v81 = 0LL;
  v77[0] = 0LL;
  v77[1] = v77;
  v77[2] = 0x2020000000LL;
  v77[3] = 0LL;
  v76[0] = 0LL;
  v76[1] = v76;
  v76[2] = 0x2020000000LL;
  v76[3] = 0LL;
  v75[0] = 0LL;
  v75[1] = v75;
  v75[2] = 0x2020000000LL;
  v75[3] = 0LL;
  int v2 = memset(__b, 170, sizeof(__b));
  uint64_t v68 = 0LL;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3810000000LL;
  unint64_t v74 = 0xAA00000000100000LL;
  BOOL v71 = "";
  BOOL v72 = __b;
  uint64_t v73 = 0x40000000000LL;
  uint64_t boot_uuid = _os_trace_get_boot_uuid(v2);
  uint64_t v4 = (void **)sub_10000DEDC();
  unint64_t v86 = _NSConcreteStackBlock;
  uint64_t v87 = 3221225472LL;
  uint64_t v88 = (uint64_t)sub_1000141C4;
  int v89 = &unk_100029BA0;
  v90 = v4;
  sub_1000075B4((uint64_t)&v86);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_1000144AC;
  v85[3] = &unk_100029BC0;
  v85[4] = v4;
  timespec v5 = v85;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v92 = sub_1000144B8;
  uint64_t v93 = &unk_100029C10;
  id v94 = v5;
  int v6 = v91;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  int v97 = (char *)qword_10003A958;
  uint64_t v98 = 0LL;
  uint64_t v7 = fts_open(&v97, 2132, 0LL);
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = fts_read(v7);
    if (v9)
    {
      BOOL v10 = v9;
      do
      {
        if (v10->fts_info == 8) {
          v92((uint64_t)v6, (uint64_t)v10);
        }
        BOOL v10 = fts_read(v8);
      }

      while (v10);
    }

    fts_close(v8);
  }

  else
  {
    _os_assumes_log(0LL);
  }

  unint64_t v86 = 0LL;
  uint64_t v87 = (uint64_t)&v86;
  uint64_t v88 = 0x2020000000LL;
  LOBYTE(v89) = 0;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  v64[1] = 3221225472LL;
  BOOL v65 = sub_100014620;
  BOOL v66 = &unk_100029980;
  uint64_t v67 = &v68;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  int v60 = sub_100014794;
  BOOL v61 = &unk_1000299A8;
  __int128 v62 = &v86;
  unint64_t v63 = &v68;
  v64[0] = _NSConcreteStackBlock;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  __int128 v45 = sub_1000149A4;
  uint64_t v46 = &unk_1000299D0;
  unint64_t v47 = v84;
  uint64_t v48 = v77;
  BOOL v49 = &v68;
  unint64_t v50 = v83;
  uint64_t v57 = boot_uuid;
  time_t v58 = v1;
  char v51 = v76;
  BOOL v52 = v82;
  int v53 = v75;
  BOOL v54 = &v78;
  int v55 = &v86;
  int v56 = v4;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100014C10;
  v43[3] = &unk_1000299F8;
  v43[4] = &v86;
  v43[5] = &v68;
  v43[6] = v84;
  v43[7] = v77;
  v43[8] = v83;
  v43[9] = v76;
  v43[10] = v82;
  v43[11] = v75;
  int v97 = (char *)qword_10003A968;
  uint64_t v98 = 0LL;
  unint64_t v11 = fts_open(&v97, 84, 0LL);
  if (v11)
  {
    int v12 = v11;
    ((void (*)(void *))v65)(v64);
    v96[0] = 0xAAAAAAAAAAAAAAAALL;
    v96[1] = 0xAAAAAAAAAAAAAAAALL;
    int v13 = fts_read(v12);
    if (v13)
    {
      uint64_t v14 = v13;
      char v15 = 0;
      do
      {
        uint64_t fts_info = v14->fts_info;
        switch(v14->fts_info)
        {
          case 1u:
            if (v14->fts_level == 1)
            {
              if (!strcmp(v14->fts_name, "dsc"))
              {
                char v15 = 1;
                goto LABEL_18;
              }

              if (v14->fts_namelen == 2)
              {
                unsigned int v26 = v14->fts_name[0] - 48;
                int v27 = v26 > 0x36 ? -1 : dword_100024790[v26];
                unsigned int v28 = v14->fts_name[1] - 48;
                int v29 = v28 > 0x36 ? -1 : dword_100024790[v28];
                int v30 = v29 | (16 * v27);
                if ((v30 & 0x80000000) == 0)
                {
                  LOBYTE(v96[0]) = v30;
                  goto LABEL_18;
                }
              }
            }

            else if (!v14->fts_level)
            {
              goto LABEL_18;
            }

            ((void (*)(void *, FTSENT *))v60)(v59, v14);
            fts_set(v12, v14, 4);
            goto LABEL_18;
          case 2u:
            v14->fts_errno = 62;
            goto LABEL_17;
          case 3u:
          case 4u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
            goto LABEL_17;
          case 6u:
            v15 &= v14->fts_level != 1;
            goto LABEL_18;
          case 8u:
            int fts_level = (unsigned __int16)v14->fts_level;
            if (fts_level != 2) {
              goto LABEL_45;
            }
            if ((v15 & 1) != 0) {
              unint64_t v18 = 32LL;
            }
            else {
              unint64_t v18 = 30LL;
            }
            if ((_DWORD)v18 != v14->fts_namelen) {
              goto LABEL_17;
            }
            unint64_t v19 = 0LL;
            uint64_t v20 = (v15 & 1) == 0;
            break;
          default:
            qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
            qword_10002DF78 = fts_info;
            __break(1u);
            goto LABEL_64;
        }

        while (1)
        {
          unsigned int v21 = v14->fts_name[v19] - 48;
          int v22 = v21 > 0x36 ? -1 : dword_100024790[v21];
          unsigned int v23 = v14->fts_name[v19 + 1] - 48;
          int v24 = v23 > 0x36 ? -1 : dword_100024790[v23];
          int v25 = v24 | (16 * v22);
          if (v25 < 0) {
            break;
          }
          *((_BYTE *)v96 + v20++) = v25;
          v19 += 2LL;
          if (v19 >= v18)
          {
            ((void (*)(void *, FTSENT *, void *, void))v45)(v44, v14, v96, v15 & 1);
            goto LABEL_18;
          }
        }

        int fts_level = (unsigned __int16)v14->fts_level;
LABEL_45:
        if (fts_level != 1 || strcmp(v14->fts_name, ".migrated")) {
LABEL_17:
        }
          ((void (*)(void *, FTSENT *))v60)(v59, v14);
LABEL_18:
        uint64_t v14 = fts_read(v12);
      }

      while (v14);
    }

    if (fts_close(v12) == -1)
    {
      size_t v42 = __error();
      _os_assumes_log(*v42);
    }

    sub_100014C10(v43, v31, v32, v33, v34, v35, v36, v37);
  }

  unint64_t v38 = v69;
  if ((*((_WORD *)v69 + 26) & 1) != 0)
  {
    uint64_t v39 = (void *)v69[4];
    v69[4] = 3954044928LL;
    *((_WORD *)v38 + 26) = 0;
    free(v39);
  }

  sub_100020614(v4);
  uint64_t v40 = v79[3];
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v77, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v84, 8);
  return v40;
}

void sub_1000141C4(uint64_t a1, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 130))
  {
LABEL_5:
    lock = (os_unfair_lock_s *)(a2 + 132);
    uint64_t v7 = *(void *)(a2 + 80);
    if (!v7 || (unint64_t v8 = *(void **)(v7 + 16)) == 0LL)
    {
LABEL_52:
      os_unfair_lock_unlock(lock);
      return;
    }

    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = (void *)(v9 + 16);
    while (1)
    {
      uint64_t v11 = v8[2];
      uint64_t v12 = v8[3];
      uint64_t v13 = v11 ^ __ROR8__(v12 + 16, 16);
      uint64_t v14 = __ROR8__(v12 + 16, 16);
      unint64_t v15 = (0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v14 ^ ((0x9DDFEA08EB382D69LL * v13) >> 47) ^ (0x9DDFEA08EB382D69LL * v13))) ^ ((0x9DDFEA08EB382D69LL * (v14 ^ ((0x9DDFEA08EB382D69LL * v13) >> 47) ^ (0x9DDFEA08EB382D69LL * v13))) >> 47))) ^ v12;
      unint64_t v16 = *(void *)(v9 + 8);
      if (v16)
      {
        uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
        v17.i16[0] = vaddlv_u8(v17);
        if (v17.u32[0] > 1uLL)
        {
          unint64_t v18 = v15;
          if (v15 >= v16) {
            unint64_t v18 = v15 % v16;
          }
        }

        else
        {
          unint64_t v18 = v15 & (v16 - 1);
        }

        unint64_t v19 = *(void **)(*(void *)v9 + 8 * v18);
        if (v19)
        {
          for (uint64_t i = (void *)*v19; i; uint64_t i = (void *)*i)
          {
            unint64_t v21 = i[1];
            if (v21 == v15)
            {
              if (i[2] == v11 && i[3] == v12) {
                goto LABEL_51;
              }
            }

            else
            {
              if (v17.u32[0] > 1uLL)
              {
                if (v21 >= v16) {
                  v21 %= v16;
                }
              }

              else
              {
                v21 &= v16 - 1;
              }

              if (v21 != v18) {
                break;
              }
            }
          }
        }
      }

      else
      {
        unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
      }

      unsigned int v23 = operator new(0x20uLL);
      *unsigned int v23 = 0LL;
      v23[1] = v15;
      *((_OWORD *)v23 + 1) = *((_OWORD *)v8 + 1);
      float v24 = (float)(unint64_t)(*(void *)(v9 + 24) + 1LL);
      float v25 = *(float *)(v9 + 32);
      if (!v16 || (float)(v25 * (float)v16) < v24)
      {
        BOOL v26 = (v16 & (v16 - 1)) != 0;
        if (v16 < 3) {
          BOOL v26 = 1LL;
        }
        unint64_t v27 = v26 | (2 * v16);
        unint64_t v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28) {
          size_t v29 = v28;
        }
        else {
          size_t v29 = v27;
        }
        sub_100020894(v9, v29);
        unint64_t v16 = *(void *)(v9 + 8);
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v15 >= v16) {
            unint64_t v18 = v15 % v16;
          }
          else {
            unint64_t v18 = v15;
          }
        }

        else
        {
          unint64_t v18 = (v16 - 1) & v15;
        }
      }

      uint64_t v30 = *(void *)v9;
      uint64_t v31 = *(void **)(*(void *)v9 + 8 * v18);
      if (v31)
      {
        *unsigned int v23 = *v31;
      }

      else
      {
        *unsigned int v23 = *v10;
        *BOOL v10 = v23;
        *(void *)(v30 + 8 * v18) = v10;
        if (!*v23) {
          goto LABEL_50;
        }
        unint64_t v32 = *(void *)(*v23 + 8LL);
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v32 >= v16) {
            v32 %= v16;
          }
        }

        else
        {
          v32 &= v16 - 1;
        }

        uint64_t v31 = (void *)(*(void *)v9 + 8 * v32);
      }

      *uint64_t v31 = v23;
LABEL_50:
      ++*(void *)(v9 + 24);
LABEL_51:
      unint64_t v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_52;
      }
    }
  }

  unint64_t v4 = 0LL;
  uint64_t v5 = 14LL;
  while (1)
  {
    uint64_t v6 = *(void *)(a2 + 72);
    if (__CFADD__(v6, v5 - 14)) {
      break;
    }
    sub_100020664(*(void *)(a1 + 32), (uint64_t *)(v6 + v5));
    ++v4;
    v5 += 32LL;
  }

  __break(0x5513u);
}

void sub_1000144AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

void sub_1000144B8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = strrchr((const char *)(a2 + 104), 46);
  if (v4)
  {
    if (!strcmp(v4, ".tracev3"))
    {
      size_t v16 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v5 = _os_trace_mmap_at(4294967294LL, *(void *)(a2 + 48), 256LL, &v16);
      if (v5)
      {
        uint64_t v6 = (char *)v5;
        size_t v7 = v16;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        uint64_t v13 = (unsigned int (*)(void *))sub_100014DB4;
        uint64_t v14 = &unk_100029BE8;
        id v15 = *(id *)(a1 + 32);
        unint64_t v8 = v12;
        unint64_t v9 = 0LL;
        do
        {
          if (v7 - v9 < 0x10) {
            break;
          }
          unint64_t v10 = *(void *)&v6[v9 + 8];
          if (v7 - v9 - 16 < v10) {
            break;
          }
          if (!v13(v8)) {
            break;
          }
          unint64_t v9 = (v9 + v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
        }

        while (v9 - 1 < v7);

        if (munmap(v6, v16) == -1)
        {
          uint64_t v11 = __error();
          _os_assumes_log(*v11);
        }
      }
    }
  }

tm *sub_100014620( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if ((*(_WORD *)(v9 + 52) & 2) == 0)
  {
    uint64_t result = (tm *)(v9 + 32);
    uint64_t v11 = *(unsigned int *)(v9 + 40);
    if ((*(char *)(v9 + 54) + *(_DWORD *)(v9 + 44) - v11 - 1) <= 7)
    {
      sub_100005DAC((uint64_t)result, "time  : ", 8uLL);
    }

    else
    {
      if (__CFADD__(*(void *)&result->tm_sec, v11)) {
        goto LABEL_16;
      }
      *(void *)(*(void *)&result->tm_sec + v11) = 0x203A2020656D6974LL;
      uint64_t v12 = (*(_DWORD *)(v9 + 40) + 8);
      *(_DWORD *)(v9 + 4sub_100021ACC(qword_10003A798, 0) = v12;
      if (!*(_BYTE *)(v9 + 54))
      {
        *(_BYTE *)(*(void *)&result->tm_sec + v12) = 0;
      }
    }
  }

  uint64_t v13 = (tm *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL);
  time_t v14 = time(0LL);
  uint64_t result = sub_100006000(v13, v14);
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if ((*(_WORD *)(v15 + 52) & 2) != 0) {
    return result;
  }
  uint64_t result = (tm *)(v15 + 32);
  uint64_t v16 = *(unsigned int *)(v15 + 40);
  if (__CFADD__(*(void *)&result->tm_sec, v16)) {
    goto LABEL_16;
  }
  uint64_t v17 = *(void *)&result->tm_sec + v16;
  *(void *)uint64_t v17 = *(void *)"\nuuids :\n";
  *(_BYTE *)(v17 + 8) = 10;
  uint64_t v18 = (*(_DWORD *)(v15 + 40) + 9);
  *(_DWORD *)(v15 + 4sub_100021ACC(qword_10003A798, 0) = v18;
  if (*(_BYTE *)(v15 + 54)) {
    return result;
  }
  if (__CFADD__(*(void *)&result->tm_sec, v18))
  {
LABEL_16:
    __break(0x5513u);
    return result;
  }

  *(_BYTE *)(*(void *)&result->tm_sec + v18) = 0;
  return result;
}

uint64_t sub_100014794( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned __int16 *)(a2 + 88);
  switch(*(_WORD *)(a2 + 88))
  {
    case 1:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL),  "    - %s\n",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a2 + 48));
      uint64_t result = removefile(*(const char **)(a2 + 48), 0LL, 1u);
      break;
    case 2:
    case 4:
    case 7:
    case 0xA:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      uint64_t v11 = (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL);
      uint64_t v12 = *(void *)(a2 + 48);
      strerror(*(_DWORD *)(a2 + 56));
      uint64_t result = sub_100005E78(v11, "    - error at %s (%d:%s)\n", v13, v14, v15, v16, v17, v18, v12);
      break;
    case 3:
    case 8:
      if (unlink(*(const char **)(a2 + 48)) == -1)
      {
        unint64_t v32 = __error();
        _os_assumes_log(*v32);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      uint64_t result = sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL),  "    - %s [default]\n",  v20,  v21,  v22,  v23,  v24,  v25,  *(void *)(a2 + 48));
      break;
    case 0xC:
    case 0xD:
      if (*(_WORD *)(a2 + 86))
      {
        if (unlink(*(const char **)(a2 + 48)) == -1)
        {
          uint64_t v33 = __error();
          _os_assumes_log(*v33);
        }

        uint64_t result = sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL),  "    - %s [symlink]\n",  v26,  v27,  v28,  v29,  v30,  v31,  *(void *)(a2 + 48));
      }

      else
      {
        uint64_t result = sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL),  "    - root %s is a symbolic link\n",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a2 + 48));
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      break;
    default:
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
      qword_10002DF78 = v8;
      __break(1u);
      JUMPOUT(0x100014970LL);
  }

  return result;
}

uint64_t sub_1000149A4(uint64_t a1, uint64_t a2, unsigned __int8 *uu)
{
  if (*(_WORD *)(a2 + 88) != 8)
  {
    uint64_t v44 = _os_assert_log(0LL);
    _os_crash(v44);
    __break(1u);
    goto LABEL_19;
  }

  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v6;
  *(_OWORD *)&out[16] = v6;
  uuid_unparse_upper(uu, out);
  uint64_t v7 = *(void *)(*(void *)(a2 + 96) + 96LL);
  if (sub_100020A8C(*(void **)(a1 + 104), uu))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v15 = *(void *)(v14 + 24);
    BOOL v16 = __OFADD__(v15, v7);
    uint64_t v17 = v15 + v7;
    if (!v16)
    {
      *(void *)(v14 + 24) = v17;
      return sub_100005E78( (void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL),  "    - %s: %lld bytes IN USE\n",  v8,  v9,  v10,  v11,  v12,  v13,  (char)out);
    }

void sub_100014C10( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    sub_100005E78( (void *)(*(void *)(a1[5] + 8LL) + 32LL),  "files_in_use: %ld bytes: %lld\n",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(a1[6] + 8LL) + 24LL));
    sub_100005E78( (void *)(*(void *)(a1[5] + 8LL) + 32LL),  "files_locked: %ld bytes: %lld\n",  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)(*(void *)(a1[8] + 8LL) + 24LL));
    sub_100005E78( (void *)(*(void *)(a1[5] + 8LL) + 32LL),  "files_recent: %ld bytes: %lld\n",  v15,  v16,  v17,  v18,  v19,  v20,  *(void *)(*(void *)(a1[10] + 8LL) + 24LL));
    uint64_t v21 = *(void *)(a1[5] + 8LL);
    char __src = 10;
    if ((*(_WORD *)(v21 + 52) & 2) == 0)
    {
      uint64_t v22 = (void *)(v21 + 32);
      uint64_t v23 = *(unsigned int *)(v21 + 40);
      if (*(char *)(v21 + 54) + *(_DWORD *)(v21 + 44) - 1 == (_DWORD)v23)
      {
        sub_100005DAC((uint64_t)v22, &__src, 1uLL);
        goto LABEL_8;
      }

      if (__CFADD__(*v22, v23))
      {
LABEL_11:
        __break(0x5513u);
        return;
      }

      *(_BYTE *)(*v22 + v23) = 10;
      uint64_t v24 = (*(_DWORD *)(v21 + 40) + 1);
      *(_DWORD *)(v21 + 4sub_100021ACC(qword_10003A798, 0) = v24;
      if (!*(_BYTE *)(v21 + 54))
      {
        if (!__CFADD__(*v22, v24))
        {
          *(_BYTE *)(*v22 + v24) = 0;
          goto LABEL_8;
        }

        goto LABEL_11;
      }
    }

uint64_t sub_100014DB4(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 24587)
  {
    uint64_t v3 = sub_10001CC48((uint64_t)a2);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v3 + 16);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000LL;
      uint64_t v10 = sub_10001C208;
      uint64_t v11 = &unk_10002A0C8;
      uint64_t v12 = v5;
      for (uint64_t i = *(void **)(v6 + 16); i; uint64_t i = (void *)*i)
        ((void (*)(void *, void *, void))v10)(v9, i + 2, i[4]);
      sub_10001CBE0(v4);
    }
  }

  return 1LL;
}

void sub_100014E8C()
{
  time_t v0 = (dispatch_queue_s *)sub_100003ED8(2LL);
  dispatch_async_and_wait(v0, &stru_100029A58);
}

void sub_100014EFC()
{
  time_t v0 = &byte_10002DF94[49260];
  if (qword_10003A908)
  {
    time_t v1 = 0LL;
  }

  else
  {
    time_t v1 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  (dispatch_queue_t)qword_10003A8F8);
    dispatch_source_set_event_handler_f(v1, (dispatch_function_t)sub_1000154D0);
    dispatch_activate(v1);
    objc_storeStrong((id *)&qword_10003A908, v1);
  }

  memset(__b, 170, sizeof(__b));
  int v2 = &byte_10002DF94[49260];
  if (qword_10003A910) {
    goto LABEL_48;
  }
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  memset(v54, 170, sizeof(v54));
  uint64_t v4 = memset(__str, 170, sizeof(__str));
  unint64_t v46 = 0xAA01000000100000LL;
  uint64_t v5 = (const char *)_os_trace_sysprefsdir_path(v4);
  snprintf(__str, 0x400uLL, "%s/Subsystems", v5);
  sub_100015944(v3, __str);
  if (_os_trace_is_development_build())
  {
    uint64_t v6 = (const char *)_os_trace_intprefsdir_path();
    snprintf(__str, 0x400uLL, "%s/Subsystems", v6);
    sub_100015944(v3, __str);
  }

  uint64_t v44 = v54;
  uint64_t v45 = 0x40000000000LL;
  if (byte_10003A952)
  {
    uint64_t v7 = v3;
    uint64_t v8 = 0LL;
LABEL_9:
    char v9 = 1;
    goto LABEL_20;
  }

  uint64_t v10 = memset(applier, 170, 0x400uLL);
  uint64_t v11 = (const char *)_os_trace_sysprefsdir_path(v10);
  plist_at = (void *)_os_trace_read_plist_at(4294967294LL, applier);
  uint64_t is_development_build = _os_trace_is_development_build();
  if ((_DWORD)is_development_build)
  {
    uint64_t v14 = (const char *)_os_trace_intprefsdir_path();
    uint64_t v15 = (void *)_os_trace_read_plist_at(4294967294LL, applier);
    id v16 = sub_100015A00(plist_at, v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

    plist_at = (void *)v17;
  }

  uint64_t v18 = (const char *)_os_trace_prefsdir_path(is_development_build);
  uint64_t v19 = (void *)_os_trace_read_plist_at(4294967294LL, applier);
  id v20 = sub_100015A00(plist_at, v19);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v20);

  uint64_t v21 = v3;
  if (!v8) {
    goto LABEL_9;
  }
  *(void *)applier = _NSConcreteStackBlock;
  *(void *)&applier[8] = 3221225472LL;
  *(void *)&applier[16] = sub_100015AE4;
  *(void *)&applier[24] = &unk_100029CD0;
  *(void *)&applier[32] = v21;
  xpc_dictionary_apply(v8, applier);

  char v9 = 0;
LABEL_20:

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v22 = v3;
  id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v49,  v48,  16LL);
  if (!v23)
  {

    uint64_t v34 = v44;
    uint64_t v44 = (void *)3954044928LL;
    uint64_t v35 = v45;
LABEL_39:
    if (BYTE6(v46)) {
      uint64_t v36 = v35;
    }
    else {
      uint64_t v36 = (v35 + 1);
    }
    uint64_t v34 = (void *)_os_trace_memdup(v34, v36);
    goto LABEL_43;
  }

  id v24 = v23;
  uint64_t v43 = v1;
  uint64_t v25 = *(void *)v50;
  do
  {
    for (uint64_t i = 0LL; i != v24; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v50 != v25) {
        objc_enumerationMutation(v22);
      }
      uint64_t v27 = (char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)i) UTF8String];
      id v28 = v8;
      id sysprefs = (id)_os_log_preferences_load_sysprefs(v27, 0LL, 0LL);
      if ((v9 & 1) == 0)
      {
        xpc_object_t dictionary = xpc_dictionary_get_dictionary(v28, v27);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
        uint64_t v32 = v31;
        if (v31)
        {
          if (sysprefs) {
            _os_log_preferences_merge(sysprefs, v31, 0LL);
          }
          else {
            id sysprefs = v31;
          }
        }
      }

      if (sysprefs) {
        sub_100015B30(&v44, v27, sysprefs);
      }
    }

    id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v49,  v48,  16LL);
  }

  while (v24);
  char v33 = BYTE4(v46);

  int v2 = byte_10002DF94 + 49260;
  if ((v33 & 2) != 0)
  {
    memset(&applier[44], 170, 0x3D4uLL);
    strcpy(applier, "Logging sysprefs cache was larger than 1MB!");
    sub_10000B70C((uint64_t)applier);
    time_t v1 = v43;
    time_t v0 = &byte_10002DF94[49260];
    if ((v33 & 1) != 0) {
      free(v44);
    }
    goto LABEL_47;
  }

  time_t v1 = v43;
  uint64_t v34 = v44;
  uint64_t v44 = (void *)3954044928LL;
  uint64_t v35 = v45;
  time_t v0 = byte_10002DF94 + 49260;
  if ((v33 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_43:
  *((void *)v2 + 29sub_100021ACC(qword_10003A798, 0) = v34;
  if (v34) {
    qword_10003A928 = v35;
  }
LABEL_47:

LABEL_48:
  xpc_type_t v37 = sub_100015D3C(3LL);
  uint64_t v38 = (const char *)_os_trace_prefsdir_path(v37);
  snprintf(__b, 0x400uLL, "%s/Subsystems", v38);
  mkpath_np(__b, 0x1EDu);
  int v39 = open(__b, 1081600);
  if (v39 == -1)
  {
    uint64_t v42 = __error();
    _os_assumes_log(*v42);
    dispatch_source_t v40 = 0LL;
  }

  else
  {
    dispatch_source_t v40 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v39,  0x37uLL,  *((dispatch_queue_t *)v0 + 287));
    dispatch_set_context(v40, v40);
    dispatch_source_set_event_handler_f(v40, (dispatch_function_t)sub_100015EF4);
    dispatch_source_set_cancel_handler_f(v40, (dispatch_function_t)sub_100015F28);
    dispatch_activate(v40);
  }

  if (qword_10003A918)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10003A918);
    uint64_t v41 = (void *)qword_10003A918;
  }

  else
  {
    uint64_t v41 = 0LL;
  }

  qword_10003A918 = (uint64_t)v40;

  sub_1000154D0();
}

void sub_1000154D0()
{
  time_t v0 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  memset(v30, 170, sizeof(v30));
  if (!qword_10003A910)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
LABEL_41:
    sub_100003D88(v20, v21, (uint64_t)&stru_100029C30);

    return;
  }

  if (qword_10003A918)
  {
    uintptr_t handle = dispatch_source_get_handle((dispatch_source_t)qword_10003A918);
    sub_100016300(v0, handle);
  }

  v30[0] = __b;
  WORD2(v30[2]) = 0;
  BYTE6(v30[2]) = 1;
  LODWORD(v30[2]) = 0x100000;
  __b[0] = 6;
  v30[1] = (void *)0x40000000004LL;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  int v2 = v0;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v39;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (char *)[*(id *)(*((void *)&v38 + 1) + 8 * (void)i) UTF8String];
        uint64_t v8 = (void *)_os_log_preferences_load(v7, 0LL);
        if (v8) {
          sub_100015B30(v30, v7, v8);
        }
      }

      id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
    }

    while (v4);
  }

  char v9 = v2;
  uint64_t v10 = (unsigned int *)qword_10003A910;
  unint64_t v11 = qword_10003A928;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  uint64_t v32 = sub_100016488;
  char v33 = &unk_100029CA8;
  uint64_t v12 = v9;
  uint64_t v34 = v12;
  uint64_t v35 = v30;
  uint64_t v13 = v31;
  if (v11 >= 0x14)
  {
    do
    {
      unint64_t v14 = *v10;
      if (v11 < v14) {
        break;
      }
      uint64_t v15 = v10[1];
      if (v15 + 21 > v14) {
        break;
      }
      if (__CFADD__(v10 + 5, v15)) {
        __break(0x5513u);
      }
      if (*((_BYTE *)v10 + v15 + 20)) {
        break;
      }
      uint64_t v16 = *v10;
      uint64_t v10 = (unsigned int *)((char *)v10 + v16);
      v11 -= v16;
    }

    while (v11 > 0x13);
  }

  if ((BYTE4(v30[2]) & 2) != 0)
  {
    memset(&v36[47], 170, 0x3D1uLL);
    strcpy(v36, "Logging preferences cache was larger than 1MB!");
    sub_10000B70C((uint64_t)v36);
LABEL_27:
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    goto LABEL_39;
  }

  uint64_t v18 = (const char *)_os_trace_prefsdir_path(v17);
  snprintf(__str, 0x400uLL, "%s/.plist-cache.XXXXXXXX", v18);
  if (qword_10003A978 != -1) {
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
  }
  if (byte_10003A980) {
    uint64_t v19 = mkstemp_dprotected_np(__str, 4, 0);
  }
  else {
    uint64_t v19 = mkostemp(__str, 0x1000000);
  }
  uint64_t v22 = v19;
  if ((_DWORD)v19 == -1)
  {
    id v24 = __error();
    _os_assumes_log(*v24);
    goto LABEL_27;
  }

  if (unlink(__str) == -1)
  {
    uint64_t v25 = __error();
    _os_assumes_log(*v25);
  }

  if (_os_trace_write(v22, v30[0], LODWORD(v30[1])) == -1)
  {
    uint64_t v26 = __error();
    _os_assumes_log(*v26);
  }

  else
  {
    id v23 = mmap(0LL, LODWORD(v30[1]), 1, 2, v22, 0LL);
    if (v23 != (void *)-1LL)
    {
      uint64_t v20 = (uint64_t)v23;
      uint64_t v21 = LODWORD(v30[1]);
      goto LABEL_38;
    }
  }

  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
LABEL_38:
  if (close(v22) != -1) {
    goto LABEL_39;
  }
  int v28 = *__error();
  uint64_t v29 = *__error();
  if (v28 != 9)
  {
    _os_assumes_log(v29);
LABEL_39:
    if ((BYTE4(v30[2]) & 1) != 0)
    {
      uint64_t v27 = v30[0];
      v30[0] = (void *)3954044928LL;
      WORD2(v30[2]) = 0;
      free(v27);
    }

    goto LABEL_41;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = v29;
  __break(1u);
}

void sub_100015944(void *a1, const char *a2)
{
  id v7 = a1;
  uint64_t v3 = open(a2, 1048832);
  if ((_DWORD)v3 == -1)
  {
    uint64_t v5 = *__error();
    goto LABEL_6;
  }

  int v4 = v3;
  sub_100016300(v7, v3);
  if (close(v4) != -1)
  {
LABEL_3:

    return;
  }

  int v6 = *__error();
  uint64_t v5 = *__error();
  if (v6 != 9)
  {
LABEL_6:
    _os_assumes_log(v5);
    goto LABEL_3;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = v5;
  __break(1u);
}

id sub_100015A00(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v4)
  {
    id v8 = v3;
LABEL_6:
    id v7 = v8;
    goto LABEL_7;
  }

  if (!v3)
  {
    id v8 = v4;
    goto LABEL_6;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100016284;
  void v10[3] = &unk_100029CD0;
  id v6 = v3;
  id v11 = v6;
  xpc_dictionary_apply(v5, v10);
  id v7 = v6;

LABEL_7:
  return v7;
}

uint64_t sub_100015AE4(uint64_t a1, uint64_t a2)
{
  id v3 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a2);
  [*(id *)(a1 + 32) addObject:v3];

  return 1LL;
}

void sub_100015B30(void *a1, char *a2, void *a3)
{
  id v5 = a3;
  memset(__b, 170, sizeof(__b));
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  unint64_t v22 = 0xAA01000000100000LL;
  uint64_t v18 = 0x3810000000LL;
  uint64_t v19 = "";
  uint64_t v20 = __b;
  uint64_t v21 = 0x40000000000LL;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_100015F98;
  applier[3] = &unk_100029C80;
  id v6 = v5;
  id v14 = v6;
  uint64_t v15 = &v16;
  xpc_dictionary_apply(v6, applier);
  memset(v23, 170, 20);
  sub_100016054(v23, a2);
  _os_log_preferences_compute(v6, "DEFAULT-OPTIONS", (char *)&v23[1] + 4);
  LODWORD(v23[0]) += *((_DWORD *)v17 + 10);
  sub_1000160B4(a1, a2, (unsigned int *)v23);
  if ((*((_WORD *)a1 + 10) & 2) == 0)
  {
    id v7 = (void *)v17[4];
    unsigned int v8 = *((_DWORD *)v17 + 10);
    uint64_t v9 = *((unsigned int *)a1 + 2);
    if (*((char *)a1 + 22) + *((_DWORD *)a1 + 3) - (int)v9 - 1 < v8)
    {
      sub_100005DAC((uint64_t)a1, v7, *((unsigned int *)v17 + 10));
    }

    else
    {
      if (__CFADD__(*a1, v9)) {
        goto LABEL_11;
      }
      memcpy((void *)(*a1 + v9), v7, *((unsigned int *)v17 + 10));
      uint64_t v10 = *((_DWORD *)a1 + 2) + v8;
      *((_DWORD *)a1 + 2) = v10;
      if (*((_BYTE *)a1 + 22)) {
        goto LABEL_7;
      }
      if (__CFADD__(*a1, v10)) {
LABEL_11:
      }
        __break(0x5513u);
      *(_BYTE *)(*a1 + v1sub_100021ACC(qword_10003A798, 0) = 0;
    }
  }

LABEL_7:
  id v11 = v17;
  if ((*((_WORD *)v17 + 26) & 1) != 0)
  {
    uint64_t v12 = (void *)v17[4];
    v17[4] = 3954044928LL;
    *((_WORD *)v11 + 26) = 0;
    free(v12);
  }

  _Block_object_dispose(&v16, 8);
}

xpc_type_t sub_100015D3C(uint64_t a1)
{
  unsigned int v1 = a1;
  int v2 = (const char *)sub_100020F30(a1);
  if (!v2)
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Invalid directory index";
    qword_10002DF78 = v1;
    __break(1u);
  }

  id v3 = v2;
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v9.st_blkmach_vm_size_t size = v4;
  *(timespec *)v9.st_qspare = v4;
  v9.st_birthtimespec = v4;
  *(timespec *)&v9.st_mach_vm_size_t size = v4;
  v9.st_mtimespec = v4;
  v9.st_ctimespec = v4;
  *(timespec *)&v9.st_uid = v4;
  v9.st_atimespec = v4;
  *(timespec *)&v9.st_dev = v4;
  xpc_type_t result = (xpc_type_t)stat(v2, &v9);
  if ((_DWORD)result) {
    goto LABEL_8;
  }
  if (12 * (unint64_t)v1 <= ~(unint64_t)dword_10002DF0C)
  {
    if (v9.st_uid == dword_10002DF0C[3 * v1]
      && v9.st_gid == dword_10002DF0C[3 * v1 + 1]
      && (v9.st_mode & 0xFFF) == LOWORD(dword_10002DF0C[3 * v1 + 2]))
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "%s/%s", v3, ".migrated");
      if (!stat(__b, &v9)) {
        return 0LL;
      }
    }

void sub_100015EF4(dispatch_source_s *a1)
{
  if ((dispatch_source_get_mask(a1) & 0x21) != 0) {
    sub_100014EFC();
  }
  else {
    dispatch_source_merge_data((dispatch_source_t)qword_10003A908, 1uLL);
  }
}

uint64_t sub_100015F28(dispatch_source_s *a1)
{
  int handle = dispatch_source_get_handle(a1);
  uint64_t result = close(handle);
  if ((_DWORD)result == -1)
  {
    int v3 = *__error();
    uint64_t result = *__error();
    if (v3 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = result;
      __break(1u);
    }

    else
    {
      return _os_assumes_log(result);
    }
  }

  return result;
}

uint64_t sub_100015F98(uint64_t a1, char *__s1)
{
  if (strcmp(__s1, "DEFAULT-OPTIONS"))
  {
    sub_100016054(v5, __s1);
    _os_log_preferences_compute(*(void *)(a1 + 32), __s1, (char *)&v5[1] + 4);
    sub_1000160B4((void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL), __s1, (unsigned int *)v5);
  }

  return 1LL;
}

uint64_t sub_100016054(_DWORD *a1, char *__s)
{
  unsigned int v4 = strlen(__s);
  a1[1] = v4;
  uint64_t result = os_simple_hash(__s, v4);
  int v6 = a1[1];
  a1[2] = result;
  if ((((_BYTE)v6 + 1) & 3) != 0) {
    int v7 = v6 - (((_BYTE)v6 + 1) & 3) + 5;
  }
  else {
    int v7 = v6 + 1;
  }
  *a1 = v7 + 20;
  return result;
}

void *sub_1000160B4(void *result, void *__src, unsigned int *a3)
{
  id v5 = result;
  if ((*((_WORD *)result + 10) & 2) == 0)
  {
    uint64_t v6 = *((unsigned int *)result + 2);
    if ((*((char *)result + 22) + *((_DWORD *)result + 3) - v6 - 1) <= 0x13)
    {
      uint64_t result = (void *)sub_100005DAC((uint64_t)result, a3, 0x14uLL);
    }

    else
    {
      if (__CFADD__(*result, v6)) {
        goto LABEL_25;
      }
      uint64_t v7 = *result + v6;
      __int128 v8 = *(_OWORD *)a3;
      *(_DWORD *)(v7 + 16) = a3[4];
      *(_OWORD *)uint64_t v7 = v8;
      uint64_t v9 = (*((_DWORD *)result + 2) + 20);
      *((_DWORD *)result + 2) = v9;
      if (!*((_BYTE *)result + 22))
      {
        *(_BYTE *)(*result + v9) = 0;
      }
    }
  }

  if ((*((_WORD *)v5 + 10) & 2) == 0)
  {
    unsigned int v10 = a3[1];
    uint64_t v11 = *((unsigned int *)v5 + 2);
    if (*((char *)v5 + 22) + *((_DWORD *)v5 + 3) - (int)v11 - 1 < v10)
    {
      uint64_t result = (void *)sub_100005DAC((uint64_t)v5, __src, a3[1]);
    }

    else
    {
      if (__CFADD__(*v5, v11)) {
        goto LABEL_25;
      }
      uint64_t result = memcpy((void *)(*v5 + v11), __src, a3[1]);
      uint64_t v12 = *((_DWORD *)v5 + 2) + v10;
      *((_DWORD *)v5 + 2) = v12;
      if (!*((_BYTE *)v5 + 22))
      {
        *(_BYTE *)(*v5 + v12) = 0;
      }
    }
  }

  unsigned int v13 = a3[1];
  int v14 = v13 - (((_BYTE)v13 + 1) & 3) + 5;
  if ((((_BYTE)v13 + 1) & 3) == 0) {
    int v14 = v13 + 1;
  }
  if ((*((_WORD *)v5 + 10) & 2) == 0)
  {
    size_t v15 = v14 - v13;
    uint64_t v16 = *((unsigned int *)v5 + 2);
    if (!__CFADD__(*v5, v16))
    {
      uint64_t result = memcpy((void *)(*v5 + v16), &unk_10003A920, v15);
      uint64_t v17 = (*((_DWORD *)v5 + 2) + v15);
      *((_DWORD *)v5 + 2) = v17;
      if (*((_BYTE *)v5 + 22)) {
        return result;
      }
      if (!__CFADD__(*v5, v17))
      {
        *(_BYTE *)(*v5 + v17) = 0;
        return result;
      }
    }

uint64_t sub_100016284(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(*(xpc_object_t *)(a1 + 32), a2);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(dictionary);
  if (v7)
  {
    id v8 = (id)v7;
    _os_log_preferences_merge(v7, v5, 0LL);
  }

  else
  {
    id v8 = v5;
  }

  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v8);

  return 1LL;
}

void sub_100016300(void *a1, uint64_t a2)
{
  uint64_t v10 = 0LL;
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000163DC;
  void v5[3] = &unk_100029C58;
  id v6 = a1;
  uint64_t v7 = v8;
  id v3 = v6;
  uint64_t v4 = _os_trace_fdscandir_b(a2, &v10, v5, 0LL);
  _os_trace_scandir_free_namelist(v4, v10);

  _Block_object_dispose(v8, 8);
}

uint64_t sub_1000163DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 + 21;
  id v5 = strrchr((const char *)(a2 + 21), 46);
  if (v5)
  {
    if ((*(unsigned __int8 *)(a2 + 20) | 8) == 8)
    {
      id v6 = v5;
      int v7 = strcmp(v5, ".plist");
      BOOL v8 = (unint64_t)v6 > v4;
      char v9 = &v6[-v4];
      if (v8 && !v7)
      {
        uint64_t v10 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v4,  v9,  4LL);
        [*(id *)(a1 + 32) addObject:v10];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      }
    }
  }

  return 0LL;
}

uint64_t sub_100016488(uint64_t a1, unsigned int *a2)
{
  unint64_t v4 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a2 + 5,  a2[1],  4LL);
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) containsObject:v4];
  if ((result & 1) != 0) {
    goto LABEL_8;
  }
  id v6 = *(void **)(a1 + 40);
  if ((*((_WORD *)v6 + 10) & 2) != 0) {
    goto LABEL_8;
  }
  int v7 = *a2;
  uint64_t v8 = *((unsigned int *)v6 + 2);
  if (*((char *)v6 + 22) + *((_DWORD *)v6 + 3) - (int)v8 - 1 < *a2)
  {
    sub_100005DAC((uint64_t)v6, a2, *a2);
    goto LABEL_8;
  }

  if (!__CFADD__(*v6, v8))
  {
    uint64_t result = (uint64_t)memcpy((void *)(*v6 + v8), a2, *a2);
    uint64_t v9 = (*((_DWORD *)v6 + 2) + v7);
    *((_DWORD *)v6 + 2) = v9;
    if (*((_BYTE *)v6 + 22))
    {
LABEL_8:

      return 1LL;
    }

    if (!__CFADD__(*v6, v9))
    {
      *(_BYTE *)(*v6 + v9) = 0;
      goto LABEL_8;
    }
  }

  __break(0x5513u);
  return result;
}

void sub_10001656C(id a1)
{
}

void sub_100016578()
{
  dispatch_queue_attr_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned int v1 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v0);
  dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);

  dispatch_queue_t v3 = dispatch_queue_create_with_target_V2("com.apple.logd.store", attr, 0LL);
  unint64_t v4 = (void *)qword_10003A8F8;
  qword_10003A8F8 = (uint64_t)v3;
}

void sub_1000165EC()
{
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  dword_10002DBF8 = open((const char *)qword_10003A958, 0x100000);
  if ((dword_10002DBF8 & 0x80000000) == 0)
  {
    sub_10000BBF8();
    sub_100016714();
  }

  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    dispatch_async_f((dispatch_queue_t)qword_10003A8F8, 0LL, (dispatch_function_t)sub_1000169D4);
  }

  else
  {
    memset(&v1[51], 170, 0x3CDuLL);
    strcpy(v1, "CacheDelete not available - functioning without it");
    sub_10000B70C((uint64_t)v1);
  }

  dispatch_time_t v0 = dispatch_time(0LL, 600000000000LL);
  dispatch_after(v0, (dispatch_queue_t)qword_10003A8F8, &stru_100029A78);
}

uint64_t sub_100016714()
{
  int v0 = dup(dword_10002DBF8);
  if (v0 == -1)
  {
    unsigned int v13 = __error();
    _os_assumes_log(*v13);
    dispatch_queue_attr_t v2 = 0LL;
  }

  else
  {
    int v1 = v0;
    if (lseek(v0, 0LL, 0) == -1)
    {
      int v14 = __error();
      _os_assumes_log(*v14);
    }

    dispatch_queue_attr_t v2 = fdopendir(v1);
    if (!v2)
    {
      int v3 = *__error();
      if (close(v1) == -1)
      {
        int v15 = *__error();
        uint64_t result = *__error();
        if (v15 == 9)
        {
          qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_10002DF78 = result;
          __break(1u);
          return result;
        }

        _os_assumes_log(result);
      }

      dispatch_queue_attr_t v2 = 0LL;
      *__error() = v3;
    }
  }

  unint64_t v4 = readdir(v2);
  if (v4)
  {
    while (1)
    {
      d_xpc_type_t type = v4->d_type;
      if (d_type == 8) {
        break;
      }
      if (d_type == 4)
      {
        uint64_t v6 = 0LL;
        d_name = v4->d_name;
        while (strcmp((&off_100029CF0)[v6], d_name))
        {
          if (++v6 == 5) {
            goto LABEL_23;
          }
        }

        if (qword_10003A970 != -1) {
          dispatch_once(&qword_10003A970, &stru_10002A340);
        }
        snprintf(__b, 0x400uLL, "%s/%s", (const char *)qword_10003A958, d_name);
        int v10 = removefile(__b, 0LL, 1u);
LABEL_21:
        if (v10 == -1)
        {
          uint64_t v11 = __error();
          _os_assumes_log(*v11);
        }
      }

LABEL_23:
      unint64_t v4 = readdir(v2);
      if (!v4) {
        goto LABEL_26;
      }
    }

    uint64_t v8 = v4->d_name;
    uint64_t v9 = strrchr(v4->d_name, 46);
    if (!v9 || strcmp(v9, ".tracev3")) {
      goto LABEL_23;
    }
    if (!strncmp(v8, "logdata.Persistent.", 0x13uLL))
    {
      snprintf(__b, 0x400uLL, "Persist/%s", v8);
      int v10 = renameat(dword_10002DBF8, v8, dword_10002DBF8, __b);
    }

    else
    {
      int v10 = unlinkat(dword_10002DBF8, v8, 0);
    }

    goto LABEL_21;
  }

LABEL_26:
  closedir(v2);
  return removefile("/private/var/mobile/Library/Logs/com.apple.sharingd", 0LL, 1u);
}

void sub_1000169D4()
{
  if ((CacheDeleteRegisterInfoCallbacks( @"com.apple.logd.cachedelete",  &stru_100029D38,  &stru_100029D80,  &stru_100029DC8,  &stru_100029DE8) & 0x80000000) != 0)
  {
    memset(&v0[37], 170, 0x3DBuLL);
    strcpy(v0, "Unable to register with cache delete");
    sub_10000B70C((uint64_t)v0);
  }

void sub_100016A84(id a1)
{
}

__CFDictionary *__cdecl sub_100016AA8(id a1, int a2, __CFDictionary *a3)
{
  return 0LL;
}

__CFDictionary *__cdecl sub_100016AB4(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  if (sub_100016C58((const char *)qword_10003A958, a3))
  {
    memset(__b, 170, sizeof(__b));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    uint64_t v8 = sub_100016D50;
    uint64_t v9 = &unk_100029DA8;
    uint64_t v11 = __b;
    uint64_t v12 = 1024LL;
    int v10 = &v13;
    sub_100016D50((uint64_t)v7, (uint64_t)&off_10002DDB0);
    sub_100016D50((uint64_t)v7, (uint64_t)&off_10002DD20);
    v8((uint64_t)v7, (uint64_t)&off_10002DC00);
    v8((uint64_t)v7, (uint64_t)&off_10002DC90);
  }

  uint64_t v17 = @"CACHE_DELETE_AMOUNT";
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14[3]));
  uint64_t v18 = v4;
  id v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));

  _Block_object_dispose(&v13, 8);
  return v5;
}

BOOL sub_100016C58(const char *a1, void *a2)
{
  unint64_t v4 = objc_autoreleasePoolPush();
  id v5 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v10.st_blkmach_vm_size_t size = v6;
  *(timespec *)v10.st_qspare = v6;
  v10.st_birthtimespec = v6;
  *(timespec *)&v10.st_mach_vm_size_t size = v6;
  v10.st_mtimespec = v6;
  v10.st_ctimespec = v6;
  *(timespec *)&v10.st_uid = v6;
  v10.st_atimespec = v6;
  *(timespec *)v9.st_qspare = v6;
  *(timespec *)&v10.st_dev = v6;
  *(timespec *)&v9.st_mach_vm_size_t size = v6;
  *(timespec *)&v9.st_blkmach_vm_size_t size = v6;
  v9.st_ctimespec = v6;
  v9.st_birthtimespec = v6;
  v9.st_atimespec = v6;
  v9.st_mtimespec = v6;
  *(timespec *)&v9.st_dev = v6;
  *(timespec *)&v9.st_uid = v6;
  BOOL v7 = v5
    && (stat(a1, &v10) & 0x80000000) == 0
    && (stat((const char *)[v5 fileSystemRepresentation], &v9) & 0x80000000) == 0
    && v10.st_dev == v9.st_dev;

  objc_autoreleasePoolPop(v4);
  return v7;
}

uint64_t sub_100016D50(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(char **)(a1 + 40);
  size_t v5 = *(void *)(a1 + 48);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  snprintf(v4, v5, "%s/%s", (const char *)qword_10003A958, *(const char **)(a2 + 8));
  uint64_t result = open(*(const char **)(a1 + 40), 0x100000);
  if ((result & 0x80000000) != 0)
  {
    st_mach_vm_size_t size = 0LL;
  }

  else
  {
    int v7 = result;
    v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v16.st_blkmach_vm_size_t size = v8;
    *(timespec *)v16.st_qspare = v8;
    v16.st_birthtimespec = v8;
    *(timespec *)&v16.st_mach_vm_size_t size = v8;
    v16.st_mtimespec = v8;
    v16.st_ctimespec = v8;
    *(timespec *)&v16.st_uid = v8;
    v16.st_atimespec = v8;
    *(timespec *)&v16.st_dev = v8;
    uint64_t v9 = _os_trace_fdscandir_b();
    if ((int)v9 < 1)
    {
      v16.st_mach_vm_size_t size = 0LL;
    }

    else
    {
      unlinkat(v7, (const char *)(MEMORY[0] + 21LL), 0);
    }

    if (close(v7) == -1)
    {
      int v15 = *__error();
      uint64_t result = *__error();
      if (v15 == 9)
      {
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = result;
        __break(1u);
        return result;
      }

      _os_assumes_log(result);
    }

    uint64_t result = _os_trace_scandir_free_namelist(v9, 0LL);
    st_mach_vm_size_t size = v16.st_size;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v12 = *(void *)(v11 + 24);
  BOOL v13 = __OFADD__(v12, st_size);
  off_t v14 = v12 + st_size;
  if (v13) {
    __break(0x5500u);
  }
  *(void *)(v11 + 24) = v14;
  return result;
}

int sub_100016F28(id a1, const dirent **a2, const dirent **a3)
{
  int v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  int v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0)) {
    return (v5 != 0) - (v6 != 0);
  }
  else {
    return alphasort(a2, a3);
  }
}

int sub_100016FD0(id a1, const dirent *a2)
{
  if (a2->d_type == 8)
  {
    dispatch_queue_attr_t v2 = strrchr(a2->d_name, 46);
    if (v2) {
      LODWORD(v2) = strcmp(v2, ".tracev3") == 0;
    }
  }

  else
  {
    LODWORD(v2) = 0;
  }

  return (int)v2;
}

__CFDictionary *__cdecl sub_100017018(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  if (sub_100016C58((const char *)qword_10003A958, a3))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    BOOL v13 = sub_1000171F0;
    off_t v14 = &unk_100029D60;
    int v15 = &v16;
    unint64_t v4 = v12;
    if (qword_10003A970 != -1) {
      dispatch_once(&qword_10003A970, &stru_10002A340);
    }
    v22[0] = (char *)qword_10003A958;
    v22[1] = 0LL;
    int v5 = fts_open(v22, 2132, 0LL);
    if (v5)
    {
      int v6 = v5;
      int v7 = fts_read(v5);
      if (v7)
      {
        timespec v8 = v7;
        do
        {
          if (v8->fts_info == 8) {
            ((void (*)(void *))v13)(v4);
          }
          timespec v8 = fts_read(v6);
        }

        while (v8);
      }

      fts_close(v6);
    }

    else
    {
      _os_assumes_log(0LL);
    }
  }

  uint64_t v20 = @"CACHE_DELETE_AMOUNT";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v17[3]));
  uint64_t v21 = v9;
  stat v10 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  _Block_object_dispose(&v16, 8);
  return v10;
}

const char *sub_1000171F0(uint64_t a1, uint64_t a2)
{
  uint64_t result = strrchr((const char *)(a2 + 104), 46);
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, ".tracev3");
    if (!(_DWORD)result)
    {
      v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v8.st_blkmach_vm_size_t size = v5;
      *(timespec *)v8.st_qspare = v5;
      v8.st_birthtimespec = v5;
      *(timespec *)&v8.st_mach_vm_size_t size = v5;
      v8.st_mtimespec = v5;
      v8.st_ctimespec = v5;
      *(timespec *)&v8.st_uid = v5;
      v8.st_atimespec = v5;
      *(timespec *)&v8.st_dev = v5;
      uint64_t result = (const char *)stat(*(const char **)(a2 + 48), &v8);
      if ((result & 0x80000000) == 0)
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
        uint64_t v7 = *(void *)(v6 + 24);
        if (__OFADD__(v7, v8.st_size)) {
          __break(0x5500u);
        }
        else {
          *(void *)(v6 + 24) = v7 + v8.st_size;
        }
      }
    }
  }

  return result;
}

void sub_1000172AC(id a1)
{
  byte_10002DE08 = 1;
  byte_10002DD78 = 1;
  byte_10002DC58 = 1;
  byte_10002DCE8 = 1;
}

void sub_1000172D4(id a1)
{
  if (dword_10002DBF8 == -1) {
    sub_100017390();
  }
  byte_10002DE08 = 0;
  byte_10002DD78 = 0;
  byte_10002DC58 = 0;
  byte_10002DCE8 = 0;
  memset(&v1[17], 170, 0x3EFuLL);
  strcpy(v1, "writes unblocked");
  sub_10000B70C((uint64_t)v1);
}

void sub_100017390()
{
  if (dword_10002DBF8 != -1) {
    __assert_rtn("_logd_store_initialize_io", "logd_store.m", 3231, "_logd_store_dirfd == -1");
  }
  sub_100017994(0LL);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  dword_10002DBF8 = open((const char *)qword_10003A958, 0x100000);
  if (dword_10002DBF8 < 0) {
    goto LABEL_51;
  }
  sub_10000BBF8();
  int v0 = sub_100017B30();
  int v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  dispatch_queue_attr_t v2 = objc_autoreleasePoolPush();
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"Version"]);
  unint64_t v4 = (unint64_t)[v3 integerValue];

  if ((uint64_t)v4 >= 8)
  {
    memset(__b, 170, sizeof(__b));
    snprintf( (char *)__b,  0x400uLL,  "Store version (%ld) is more recent than what this system supports (<= %d), logs will be corrupted",  v4,  7);
    sub_10000B70C((uint64_t)__b);
    goto LABEL_21;
  }

  if (v4 != 7)
  {
    if (v4 <= 6) {
      uint64_t v5 = 6LL;
    }
    else {
      uint64_t v5 = v4;
    }
    if (v4 <= 7) {
      unint64_t v6 = 7 - v4;
    }
    else {
      unint64_t v6 = 0LL;
    }
    unint64_t v7 = 8 * v4;
    unint64_t v8 = v4;
    while (v4 < 7)
    {
      if (!v6) {
        goto LABEL_50;
      }
      ((void (*)(void *))off_10002DED0[v7 / 8])(v1);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v8 + 1));
      [v1 setObject:v9 forKeyedSubscript:@"Version"];

      --v6;
      v7 += 8LL;
      if (v8++ == v5)
      {
        sub_100005B68(v1);
        goto LABEL_21;
      }
    }

    __break(0x5512u);
LABEL_49:
    __break(0x5513u);
LABEL_50:
    __break(1u);
LABEL_51:
    uint64_t v32 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
    qword_10002DF78 = v32;
    __break(1u);
  }

void sub_100017994(uint64_t a1)
{
  signed int v2 = sub_100015D3C(a1);
  if (v2)
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Failed to migrate directory";
    qword_10002DF78 = v2;
    __break(1u);
  }

  if (qword_10003A978 != -1) {
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
  }
  if (byte_10003A980)
  {
    uint64_t v12 = 0LL;
    __int128 v11 = xmmword_100024768;
    int v10 = 4;
    int v3 = (const char *)sub_100020F30(a1);
    int v4 = open(v3, 0x100000);
    if (v4 == -1)
    {
      unint64_t v8 = __error();
      uint64_t v9 = *v8;
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Failed to open directory";
      qword_10002DF78 = v9;
      __break(1u);
    }

    else
    {
      int v5 = v4;
      if (fsetattrlist(v4, &v11, &v10, 4uLL, 0) == -1)
      {
        unint64_t v6 = __error();
        _os_assumes_log(*v6);
      }

      if (close(v5) != -1) {
        return;
      }
      int v7 = *__error();
      unint64_t v8 = (int *)*__error();
      if (v7 != 9)
      {
        _os_assumes_log(v8);
        return;
      }
    }

    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = (uint64_t)v8;
    __break(1u);
  }

NSMutableDictionary *sub_100017B30()
{
  uint64_t v0 = openat(dword_10002DBF8, "version.plist", 256);
  if ((_DWORD)v0 == -1)
  {
    if (*__error() != 2) {
      _os_assumes_log(0LL);
    }
    goto LABEL_9;
  }

  int v1 = -[NSFileHandle initWithFileDescriptor:](objc_alloc(&OBJC_CLASS___NSFileHandle), "initWithFileDescriptor:", v0);
  id v14 = 0LL;
  signed int v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileHandle readDataToEndOfFileAndReturnError:](v1, "readDataToEndOfFileAndReturnError:", &v14));
  id v3 = v14;
  int v4 = v3;
  if (v2)
  {
    -[NSFileHandle closeFile](v1, "closeFile");

    int v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  1LL,  0LL,  0LL));
    goto LABEL_10;
  }

  NSErrorDomain v6 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v3 domain]);
  NSErrorDomain v7 = v6;
  if (v6 != NSCocoaErrorDomain)
  {

    goto LABEL_20;
  }

  id v8 = [v4 code];

  if (v8 != (id)260) {
LABEL_20:
  }
    _os_assumes_log(0LL);
  -[NSFileHandle closeFile](v1, "closeFile");

LABEL_9:
  signed int v2 = 0LL;
  int v5 = 0LL;
LABEL_10:

  if ((-[NSMutableDictionary isNSDictionary](v5, "isNSDictionary") & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"Version"));
    int v10 = v9;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"Pending"));
  }

  else
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

    __int128 v11 = 0LL;
    int v5 = v12;
  }

  return v5;
}

void sub_100017D48(void *a1, int a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"Pending"]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      NSErrorDomain v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) isEqualToString:@"timesync-build"]) {
          BOOL v8 = a2 == 0;
        }
        else {
          BOOL v8 = 1;
        }
        if (!v8) {
          dispatch_async_f( (dispatch_queue_t)qword_10003A8F8,  @"timesync-build",  (dispatch_function_t)sub_10001B38C);
        }
        NSErrorDomain v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }

    while (v5);
  }
}

uint64_t sub_100017E80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100017E90()
{
  if ((CacheDeleteRegisterInfoCallbacks( @"com.apple.logd.cachedelete",  &stru_100029EF0,  &stru_100029F38,  &stru_100029F58,  &stru_100029F78) & 0x80000000) != 0)
  {
    memset(&v0[37], 170, 0x3DBuLL);
    strcpy(v0, "Unable to register with cache delete");
    sub_10000B70C((uint64_t)v0);
  }

__CFDictionary *__cdecl sub_100017F40(id a1, int a2, __CFDictionary *a3)
{
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  id v4 = &byte_10002DF94[49260];
  if (sub_100016C58((const char *)qword_10003A958, a3))
  {
    v145 = (void ***)0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v143 = v5;
    __int128 v144 = v5;
    if (qword_10003A970 != -1) {
      dispatch_once(&qword_10003A970, &stru_10002A340);
    }
    uint64_t v6 = (const char *)qword_10003A960;
    uint64_t v7 = _os_trace_zalloc(136LL);
    int v8 = openat(-2, v6, 0);
    *(_DWORD *)uint64_t v7 = v8;
    if (v8 == -1)
    {
      uint64_t v21 = __error();
      _os_assumes_log(*v21);
    }

    else if ((int)sub_100021164(v8, (void *)(v7 + 8), (void *)(v7 + 16), 0) >= 1 {
           && (sub_100021C8C(v7) & 0x80000000) == 0)
    }
    {
      __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_REALTIME);
      unint64_t v10 = v9;
      if (v9 >= 0x4E94914F0000LL) {
        unint64_t v11 = v9 - 86400000000000LL;
      }
      else {
        unint64_t v11 = 0LL;
      }
      *(void *)&__int128 v143 = sub_1000220F4(v7, v11, v9);
      if (v10 >= 0xEBBDB3ED0000LL) {
        unint64_t v12 = v10 - 259200000000000LL;
      }
      else {
        unint64_t v12 = 0LL;
      }
      __int128 v13 = sub_1000220F4(v7, v12, v10);
      *((void *)&v143 + 1) = v13;
      unint64_t v14 = v10 >= 0x2260FF9290000LL ? v10 - 604800000000000LL : 0LL;
      int v15 = sub_1000220F4(v7, v14, v10);
      *(void *)&__int128 v144 = v15;
      unint64_t v16 = v10 >= 0x44C1FF2520000LL ? v10 - 1209600000000000LL : 0LL;
      uint64_t v17 = sub_1000220F4(v7, v16, v10);
      *((void *)&v144 + 1) = v17;
      unint64_t v18 = v10 >= 0x9356907420000LL ? v10 - 2592000000000000LL : 0LL;
      uint64_t v19 = (void ***)sub_1000220F4(v7, v18, v10);
      v145 = v19;
      sub_100021D38(v7);
      if (close(*(_DWORD *)v7) == -1)
      {
        int v111 = *__error();
        uint64_t result = (__CFDictionary *)*__error();
        if (v111 == 9)
        {
LABEL_142:
          qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_10002DF78 = (uint64_t)result;
          __break(1u);
          goto LABEL_143;
        }

        _os_assumes_log(result);
      }

      free((void *)v7);
      __b[0] = (size_t)_NSConcreteStackBlock;
      __b[1] = 3221225472LL;
      __b[2] = (size_t)sub_100018DB4;
      __b[3] = (size_t)&unk_100029F98;
      __b[4] = (size_t)&v143;
      dispatch_sync((dispatch_queue_t)qword_10003A8F8, __b);
      goto LABEL_35;
    }

    int v22 = *__error();
    if ((*(_DWORD *)v7 & 0x80000000) == 0 && close(*(_DWORD *)v7) == -1)
    {
      int v110 = *__error();
      uint64_t result = (__CFDictionary *)*__error();
      if (v110 == 9)
      {
LABEL_141:
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = (uint64_t)result;
        __break(1u);
        goto LABEL_142;
      }

      _os_assumes_log(result);
    }

    free((void *)v7);
    *__error() = v22;
    int v23 = *__error();
    memset(__b, 170, 0x400uLL);
    snprintf((char *)__b, 0x400uLL, "Unable to open timesync database at %s: error %d", v6, v23);
    sub_10000B70C((uint64_t)__b);
LABEL_35:
    id v24 = &unk_10002D000;
    uint64_t v25 = openat(dword_10002DBF8, "TTL", 1048832);
    if ((v25 & 0x80000000) != 0)
    {
      uint64_t v30 = 0LL;
LABEL_56:
      if ((__int128 *)((char *)&v144 + 1) != 0LL && (unint64_t)&v143 >= 0xFFFFFFFFFFFFFFEFLL
        || (unint64_t)&v143 > 0xFFFFFFFFFFFFFFDFLL)
      {
        goto LABEL_138;
      }

      uint64_t v37 = v143;
      uint64_t v38 = v144;
      uint64_t v39 = sub_10001919C((uint64_t)&off_10002DC00, (uint64_t)v145);
      uint64_t v40 = v30 + v39;
      if (__OFADD__(v30, v39)) {
        goto LABEL_139;
      }
      uint64_t v41 = sub_10001919C((uint64_t)&off_10002DD20, v38);
      BOOL v36 = __OFADD__(v40, v41);
      uint64_t v42 = v40 + v41;
      if (v36) {
        goto LABEL_139;
      }
      uint64_t v43 = sub_10001919C((uint64_t)&off_10002DDB0, v37);
      uint64_t v20 = v42 + v43;
      if (__OFADD__(v42, v43)) {
        goto LABEL_139;
      }
      uint64_t v44 = openat(v24[766], off_10002DC98, 1048832);
      if ((_DWORD)v44 == -1) {
        goto LABEL_133;
      }
      uint64_t v45 = v44;
      if ((v44 & 0x80000000) != 0) {
        goto LABEL_123;
      }
      *(void *)&v119.tm_wday = 0LL;
      *(void *)&v119.int tm_isdst = &v119.tm_wday;
      v119.tm_gmtofuint64_t f = 0x2020000000LL;
      v119.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
      memset(__b, 170, 0x400uLL);
      *(void *)&v119.tm_mon = 0xAA00000000100000LL;
      *(void *)&v119.tm_sec = __b;
      *(void *)&v119.uint64_t tm_hour = 0x40000000000LL;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100019314;
      block[3] = &unk_10002A010;
      void block[4] = &v119.tm_wday;
      void block[5] = &off_10002DC90;
      dispatch_sync((dispatch_queue_t)qword_10003A8F8, block);
      sub_1000131EC(&v119, (uint64_t)&off_10002DC90, (uint64_t)"Periodic Compaction", 0LL, v46, v47, v48, v49, v112);
      int v50 = dup(v45);
      if (v50 == -1)
      {
        id v94 = __error();
        _os_assumes_log(*v94);
      }

      else
      {
        int v51 = v50;
        if (lseek(v50, 0LL, 0) == -1)
        {
          unint64_t v95 = __error();
          _os_assumes_log(*v95);
        }

        __int128 v52 = fdopendir(v51);
        if (v52)
        {
          int v53 = v52;
          char v117 = 0;
          BOOL v54 = readdir(v52);
          uint64_t v61 = 0LL;
          if (v54)
          {
            __int128 v62 = v134;
            do
            {
              if (v54->d_type == 8)
              {
                d_name = v54->d_name;
                uint64_t v64 = strrchr(v54->d_name, 46);
                if (v64)
                {
                  if (!strcmp(v64, ".tracev3"))
                  {
                    unint64_t v65 = sub_1000133AC(d_name);
                    if (v65)
                    {
                      if (v65 < *(void *)(*(void *)&v119.tm_isdst + 24LL))
                      {
                        unint64_t v140 = 0xAAAAAAAAAAAAAAAALL;
                        uint64_t v66 = _os_trace_mmap_at(v45, d_name, 256LL, &v140);
                        if (v66)
                        {
                          uint64_t v67 = (char *)v66;
                          uint64_t v113 = v61;
                          uint64_t v114 = v62;
                          unsigned int v115 = v45;
                          uint64_t v116 = a3;
                          v62[16] = 0LL;
                          *((_OWORD *)v62 + 6) = 0u;
                          *((_OWORD *)v62 + 7) = 0u;
                          *((_OWORD *)v62 + 4) = 0u;
                          *((_OWORD *)v62 + 5) = 0u;
                          *((_OWORD *)v62 + 2) = 0u;
                          *((_OWORD *)v62 + 3) = 0u;
                          *(_OWORD *)__int128 v62 = 0u;
                          *((_OWORD *)v62 + 1) = 0u;
                          __int128 value = &v143;
                          v134[1] = -1LL;
                          int v139 = 0x10000;
                          uint64_t v138 = (void *)_os_trace_malloc(0x10000LL);
                          unint64_t v68 = v140;
                          v127[0] = _NSConcreteStackBlock;
                          v127[1] = 3221225472LL;
                          uint64_t v128 = sub_100019400;
                          uint64_t v129 = &unk_10002A050;
                          uint64_t v130 = v67;
                          uint64_t v131 = &v143;
                          p___int128 value = &value;
                          uint64_t v69 = v127;
                          unint64_t v70 = 0LL;
                          do
                          {
                            if (v68 - v70 < 0x10) {
                              break;
                            }
                            unint64_t v71 = *(void *)&v67[v70 + 8];
                            if (v68 - 16 - v70 < v71) {
                              break;
                            }
                            unint64_t v70 = (v70 + v71 + 23) & 0xFFFFFFFFFFFFFFF8LL;
                          }

                          while (v70 - 1 < v68);

                          if (v134[3]) {
                            sub_10001967C((uint64_t)&value);
                          }
                          uint64_t v123 = 0LL;
                          uint64_t v124 = &v123;
                          uint64_t v125 = 0x2020000000LL;
                          uint64_t v126 = 0LL;
                          uint64_t v45 = v115;
                          __int128 v62 = v114;
                          if (v136 > 1)
                          {
                            a3 = v116;
                            if (!(v140 >> 17))
                            {
LABEL_96:
                              uint64_t v80 = 16LL;
                              unint64_t v81 = 1LL;
                              while (!__CFADD__(v135, v80))
                              {
                                free(*(void **)&v135[v80]);
                                ++v81;
                                v80 += 16LL;
                                if (v81 >= v136) {
                                  goto LABEL_99;
                                }
                              }

LABEL_138:
                              __break(0x5513u);
LABEL_139:
                              __break(0x5500u);
                            }

                            if ((3 * v137) < 2 * v140)
                            {
                              uint64_t v74 = sub_100012F84(v115, "tmp", 1538);
                              if ((_DWORD)v74 == -1)
                              {
                                unint64_t v83 = __error();
                                _os_assumes_log(*v83);
                                uint64_t v45 = v115;
                              }

                              else
                              {
                                int v75 = v74;
                                if (_os_trace_writev(v74, v135, v136) == -1)
                                {
                                  unint64_t v84 = __error();
                                  _os_assumes_log(*v84);
                                  int v85 = close(v75);
                                  uint64_t v45 = v115;
                                  if (v85 == -1)
                                  {
                                    int v86 = *__error();
                                    uint64_t result = (__CFDictionary *)*__error();
                                    if (v86 == 9) {
                                      goto LABEL_145;
                                    }
                                    _os_assumes_log(result);
                                    a3 = v116;
                                    uint64_t v45 = v115;
                                    __int128 v62 = v114;
                                  }
                                }

                                else
                                {
                                  v120[0] = _NSConcreteStackBlock;
                                  v120[1] = 3221225472LL;
                                  v120[2] = sub_10001976C;
                                  uint64_t v76 = v115;
                                  unsigned int v121 = v115;
                                  int v122 = v75;
                                  v120[5] = d_name;
                                  v120[6] = &value;
                                  v120[3] = &unk_10002A078;
                                  v120[4] = &v123;
                                  v120[7] = v140;
                                  v120[8] = &v119;
                                  v120[9] = &off_10002DC90;
                                  dispatch_sync((dispatch_queue_t)qword_10003A8F8, v120);
                                  int v77 = v75;
                                  uint64_t v45 = v76;
                                  if (close(v77) == -1)
                                  {
                                    int v78 = *__error();
                                    uint64_t result = (__CFDictionary *)*__error();
                                    if (v78 == 9) {
                                      goto LABEL_144;
                                    }
                                    _os_assumes_log(result);
                                  }
                                }
                              }
                            }
                          }

                          else
                          {
                            uint64_t v72 = sub_10001932C(v115, (uint64_t)d_name, v140, (uint64_t)&v119, (uint64_t)&v117);
                            v124[3] = v72;
                            a3 = v116;
                          }

                          if (v136 > 1) {
                            goto LABEL_96;
                          }
LABEL_99:
                          free(v135);
                          free(v138);
                          if (munmap(v67, v140) == -1)
                          {
                            uint64_t v82 = __error();
                            _os_assumes_log(*v82);
                          }

                          uint64_t v73 = v124[3];
                          _Block_object_dispose(&v123, 8);
                          uint64_t v61 = v113;
                        }

                        else
                        {
                          uint64_t v73 = sub_10001932C(v45, (uint64_t)d_name, v140, (uint64_t)&v119, (uint64_t)&v117);
                        }

                        BOOL v36 = __OFADD__(v61, v73);
                        v61 += v73;
                        if (v36) {
                          goto LABEL_139;
                        }
                      }
                    }
                  }
                }
              }

              BOOL v54 = readdir(v53);
            }

            while (v54);
          }

          if (v61 || v117)
          {
            sub_100005E78(&v119, "done  : ", v55, v56, v57, v58, v59, v60, v112);
            time_t v87 = time(0LL);
            sub_100006000(&v119, v87);
            sub_100005E78(&v119, "\n\n", v88, v89, v90, v91, v92, v93, v112);
            sub_100007370();
          }

          goto LABEL_117;
        }

        int v96 = *__error();
        if (close(v51) == -1)
        {
          int v97 = *__error();
          uint64_t result = (__CFDictionary *)*__error();
          if (v97 == 9)
          {
LABEL_143:
            qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_10002DF78 = (uint64_t)result;
            __break(1u);
LABEL_144:
            qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_10002DF78 = (uint64_t)result;
            __break(1u);
LABEL_145:
            qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_10002DF78 = (uint64_t)result;
            __break(1u);
            return result;
          }

          _os_assumes_log(result);
        }

        *__error() = v96;
      }

      _os_assumes_log(0LL);
      int v53 = 0LL;
      uint64_t v61 = 0LL;
LABEL_117:
      if ((v119.tm_year & 1) != 0)
      {
        uint64_t v98 = *(void **)&v119.tm_sec;
        *(void *)&v119.tm_sec = 3954044928LL;
        LOWORD(v119.tm_year) = 0;
        free(v98);
      }

      if (closedir(v53) == -1)
      {
        uint64_t v107 = __error();
        _os_assumes_log(*v107);
      }

      _Block_object_dispose(&v119.tm_wday, 8);
      BOOL v36 = __OFADD__(v20, v61);
      v20 += v61;
      if (v36) {
        goto LABEL_139;
      }
      if (close(v45) != -1) {
        goto LABEL_123;
      }
      int v108 = *__error();
      uint64_t result = (__CFDictionary *)*__error();
      if (v108 != 9)
      {
        _os_assumes_log(result);
LABEL_133:
        uint64_t v109 = __error();
        _os_assumes_log(*v109);
LABEL_123:
        __int128 v99 = (void *)v143;
        sub_10001F270(*(void ***)v143);
        free(v99);
        uint64_t v100 = (void *)*((void *)&v143 + 1);
        sub_10001F270(**((void ****)&v143 + 1));
        free(v100);
        unint64_t v101 = (void *)v144;
        sub_10001F270(*(void ***)v144);
        free(v101);
        unint64_t v102 = (void *)*((void *)&v144 + 1);
        sub_10001F270(**((void ****)&v144 + 1));
        free(v102);
        uint64_t v103 = v145;
        sub_10001F270(*v145);
        free(v103);
        memset(__b, 170, 0x400uLL);
        snprintf((char *)__b, 0x400uLL, "Compacted %lld bytes", v20);
        sub_10000B70C((uint64_t)__b);
        goto LABEL_126;
      }

      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = (uint64_t)result;
      __break(1u);
      goto LABEL_141;
    }

    uint64_t v26 = v25;
    __darwin_time_t v27 = *((void *)&v144 + 1);
    uint64_t v28 = fdopendir(v25);
    uint64_t v29 = readdir(v28);
    if (v29)
    {
      uint64_t v116 = a3;
      uint64_t v30 = 0LL;
      char v31 = 0;
      do
      {
        if (v29->d_type == 8)
        {
          uint64_t v32 = v29->d_name;
          char v33 = strrchr(v29->d_name, 46);
          if (v33)
          {
            if (!strcmp(v33, ".tracev3"))
            {
              __b[0] = 0xAAAAAAAAAAAAAAAALL;
              if (sub_100018E94(v26, v32, v27, __b))
              {
                if (unlinkat(v26, v32, 0) == -1)
                {
                  uint64_t v34 = __error();
                  _os_assumes_log(*v34);
                }

                v30 += __b[0];
              }

              else
              {
                char v31 = 1;
              }
            }
          }
        }

        uint64_t v29 = readdir(v28);
      }

      while (v29);
      a3 = v116;
      id v4 = byte_10002DF94 + 49260;
      id v24 = (_DWORD *)&unk_10002D000;
      if ((v31 & 1) != 0)
      {
LABEL_55:
        closedir(v28);
        goto LABEL_56;
      }
    }

    else
    {
      uint64_t v30 = 0LL;
    }

    memset(__b, 170, 0x400uLL);
    if (qword_10003A970 != -1) {
      dispatch_once(&qword_10003A970, &stru_10002A340);
    }
    snprintf((char *)__b, 0x400uLL, "%s/TTL", *((const char **)v4 + 299));
    __int128 value = 0LL;
    uint64_t v35 = removefile_state_alloc();
    removefile_state_set(v35, 1u, sub_100019108);
    removefile_state_set(v35, 2u, &value);
    removefile((const char *)__b, v35, 1u);
    removefile_state_free(v35);
    BOOL v36 = __OFADD__(v30, value);
    v30 += (uint64_t)value;
    if (v36) {
      goto LABEL_139;
    }
    goto LABEL_55;
  }

  uint64_t v20 = 0LL;
LABEL_126:
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  if (sub_100016C58((const char *)qword_10003A968, a3))
  {
    memset((char *)&__b[2] + 3, 170, 0x3EDuLL);
    strcpy((char *)__b, "Purging UUID Cache");
    sub_10000B70C((uint64_t)__b);
    uint64_t v104 = sub_100013AC0();
    BOOL v36 = __OFADD__(v20, v104);
    v20 += v104;
    if (v36) {
      goto LABEL_139;
    }
  }

  memset(__b, 170, 0x400uLL);
  snprintf((char *)__b, 0x400uLL, "Periodic complete. Removed %lld bytes.", v20);
  sub_10000B70C((uint64_t)__b);
  uint64_t v141 = @"CACHE_DELETE_AMOUNT";
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v20));
  uint64_t v142 = v105;
  uint64_t v106 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v142,  &v141,  1LL));

  return v106;
}

void sub_100018DB4(uint64_t a1)
{
  signed int v2 = objc_autoreleasePoolPush();
  id v3 = sub_100017B30();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10001A790(v4, @"ttl01", **(void ****)(a1 + 32));
  unint64_t v5 = *(void *)(a1 + 32);
  if (v5 >= 0xFFFFFFFFFFFFFFF8LL
    || (sub_10001A790(v4, @"ttl03", *(void ***)(v5 + 8)), unint64_t v6 = *(void *)(a1 + 32), v6 > 0xFFFFFFFFFFFFFFEFLL)
    || (sub_10001A790(v4, @"ttl07", *(void ***)(v6 + 16)), unint64_t v7 = *(void *)(a1 + 32), v7 > 0xFFFFFFFFFFFFFFE7LL)
    || (sub_10001A790(v4, @"ttl14", *(void ***)(v7 + 24)), unint64_t v8 = *(void *)(a1 + 32), v8 > 0xFFFFFFFFFFFFFFDFLL))
  {
    __break(0x5513u);
  }

  else
  {
    sub_10001A790(v4, @"ttl30", *(void ***)(v8 + 32));
    sub_100005B68(v4);

    objc_autoreleasePoolPop(v2);
  }

uint64_t sub_100018E94(uint64_t a1, const char *a2, __darwin_time_t a3, size_t *a4)
{
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[0] = v8;
  v29[1] = v8;
  uint64_t v9 = _os_trace_getxattr_at(a1, a2, 256LL, "com.apple.logd.metadata", v29, 40LL);
  if (v9 == 40)
  {
    uint64_t v17 = sub_10001F114(*(void **)a3, (_OWORD *)((char *)v29 + 4));
    if (v17 && (v17 != 1 || v30 >= *(void *)(a3 + 8))) {
      return 0LL;
    }
    goto LABEL_19;
  }

  if (v9 != -1)
  {
    _os_assumes_log(0LL);
LABEL_19:
    v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v18.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v28.st_blkmach_vm_size_t size = v18;
    *(timespec *)v28.st_qspare = v18;
    v28.st_birthtimespec = v18;
    *(timespec *)&v28.st_mach_vm_size_t size = v18;
    v28.st_mtimespec = v18;
    v28.st_ctimespec = v18;
    *(timespec *)&v28.st_uid = v18;
    v28.st_atimespec = v18;
    *(timespec *)&v28.st_dev = v18;
    if (fstatat(a1, a2, &v28, 32) == -1)
    {
      int v23 = __error();
      _os_assumes_log(*v23);
      st_mach_vm_size_t size = 0LL;
    }

    else
    {
      st_mach_vm_size_t size = v28.st_size;
    }

    *a4 = st_size;
    return 1LL;
  }

  if (*__error() != 93)
  {
    uint64_t v21 = __error();
    _os_assumes_log(*v21);
  }

  uint64_t v10 = _os_trace_mmap_at(a1, a2, 256LL, a4);
  BOOL v11 = 1LL;
  if (v10)
  {
    unint64_t v12 = (char *)v10;
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000LL;
    char v27 = 1;
    unint64_t v13 = *a4;
    *(void *)&v28.st_dev = _NSConcreteStackBlock;
    v28.st_ino = 3221225472LL;
    *(void *)&v28.st_uid = sub_10001A6AC;
    *(void *)&v28.st_rdev = &unk_100029FC0;
    v28.st_atimespec.tv_nsec = v10;
    v28.st_mtimespec.tv_sec = a3;
    v28.st_atimespec.tv_sec = (__darwin_time_t)&v24;
    unint64_t v14 = &v28;
    unint64_t v15 = 0LL;
    do
    {
      if (v13 - v15 < 0x10) {
        break;
      }
      unint64_t v16 = *(void *)&v12[v15 + 8];
      if (v13 - 16 - v15 < v16) {
        break;
      }
      unint64_t v15 = (v15 + v16 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    }

    while (v15 - 1 < v13);

    if (munmap(v12, *a4) == -1)
    {
      int v22 = __error();
      _os_assumes_log(*v22);
    }

    BOOL v11 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

uint64_t sub_100019108(int a1, char *a2, void *a3)
{
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v6.st_blkmach_vm_size_t size = v4;
  *(timespec *)v6.st_qspare = v4;
  v6.st_birthtimespec = v4;
  *(timespec *)&v6.st_mach_vm_size_t size = v4;
  v6.st_mtimespec = v4;
  v6.st_ctimespec = v4;
  *(timespec *)&v6.st_uid = v4;
  v6.st_atimespec = v4;
  *(timespec *)&v6.st_dev = v4;
  uint64_t result = lstat(a2, &v6);
  if ((_DWORD)result) {
    return 0LL;
  }
  if (!__OFADD__(*a3, v6.st_size))
  {
    *a3 += v6.st_size;
    return 0LL;
  }

  __break(0x5500u);
  return result;
}

uint64_t sub_10001919C(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = 0LL;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  int v4 = openat(dword_10002DBF8, *(const char **)(a1 + 8), 1048832);
  if (v4 == -1)
  {
    unint64_t v7 = __error();
    _os_assumes_log(*v7);
    goto LABEL_6;
  }

  int v5 = v4;
  if (v4 < 0)
  {
LABEL_6:
    uint64_t v6 = 0LL;
    goto LABEL_7;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A4B0;
  block[3] = &unk_100029FE8;
  int v12 = v4;
  void block[5] = a1;
  void block[6] = a2;
  void block[4] = &v13;
  dispatch_sync((dispatch_queue_t)qword_10003A8F8, block);
  if (close(v5) != -1)
  {
LABEL_4:
    uint64_t v6 = v14[3];
LABEL_7:
    _Block_object_dispose(&v13, 8);
    return v6;
  }

  int v9 = *__error();
  uint64_t result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log(result);
    uint64_t v10 = __error();
    _os_assumes_log(*v10);
    goto LABEL_4;
  }

  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

uint64_t sub_100019314(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(*(void *)(result + 40) + 24LL) - 1LL;
  return result;
}

uint64_t sub_10001932C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  void v7[2] = sub_10001A404;
  v7[3] = &unk_10002A0A0;
  int v8 = a1;
  v7[4] = &v9;
  void v7[5] = a2;
  v7[6] = a5;
  _OWORD v7[7] = a3;
  v7[8] = a4;
  v7[9] = &off_10002DC90;
  dispatch_sync((dispatch_queue_t)qword_10003A8F8, v7);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_100019400(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)a2;
  if (*(void *)(result + 32) != a2)
  {
    if (v4 != 24589)
    {
      if (v4 == 24587)
      {
        uint64_t v5 = *(void *)(result + 48);
        if (*(void *)(v5 + 32))
        {
          sub_10001967C(*(void *)(result + 48));
          uint64_t v5 = *(void *)(v3 + 48);
        }

        uint64_t v6 = sub_10001CC48(a2);
        *(void *)(v5 + 32) = v6;
        if (v6)
        {
          *(void *)(v5 + 48) = *(void *)(v6 + 64);
          *(_DWORD *)(v5 + 124) = *(_DWORD *)(v5 + 112);
          sub_100019A68(v5, 0LL);
          unint64_t v7 = sub_10001CAB0();
          *(void *)(v5 + 88) = v7;
          unint64_t v8 = *(void *)(*(void *)(v5 + 32) + 8LL);
          if (v7[1] > v8) {
            v7[1] = v8;
          }
        }
      }

      return 1LL;
    }

    uint64_t v10 = *(void *)(result + 48);
    if (*(void *)(v10 + 32))
    {
      uint64_t v11 = *(void *)(v10 + 48);
      if (v11)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        uint64_t v21 = sub_100019B0C;
        int v22 = &unk_10002A030;
        uint64_t v23 = v10;
        unsigned int v12 = *(_DWORD *)(v11 + 32);
        if (v12) {
          size_t v13 = v12;
        }
        else {
          size_t v13 = 0x10000LL;
        }
        if (v12) {
          compression_algorithm v14 = *(_DWORD *)(v11 + 36);
        }
        else {
          compression_algorithm v14 = COMPRESSION_LZ4;
        }
        if (!v14)
        {
          uint64_t v15 = (uint8_t *)(a2 + 16);
          size_t v13 = *(void *)(a2 + 8);
          goto LABEL_32;
        }

        uint64_t v15 = (uint8_t *)_os_trace_malloc(v13);
        size_t v16 = compression_decode_buffer(v15, v13, (const uint8_t *)(a2 + 16), *(void *)(a2 + 8), 0LL, v14);
        if (!v16)
        {
          free(v15);
          uint64_t v15 = 0LL;
LABEL_40:
          free(v15);
LABEL_41:
          *(void *)(*(void *)(v3 + 48) + 48LL) = **(void **)(*(void *)(v3 + 48) + 48LL);
          return 1LL;
        }

        size_t v17 = v16;
        if (v12)
        {
          if (v16 == v13) {
            goto LABEL_29;
          }
          _os_assumes_log(0LL);
        }

        size_t v13 = v17;
LABEL_29:
        if (!v15) {
          goto LABEL_40;
        }
LABEL_32:
        unint64_t v18 = 0LL;
        do
        {
          if (v13 - v18 < 0x10) {
            break;
          }
          unint64_t v19 = *(void *)&v15[v18 + 8];
          if (v13 - v18 - 16 < v19) {
            break;
          }
          unint64_t v18 = (v18 + v19 + 23) & 0xFFFFFFFFFFFFFFF8LL;
        }

        while (v18 - 1 < v13);
        if (!v14) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }

    return 1LL;
  }

  if (v4 != 4096 || *(void *)(a2 + 8) < 0x28uLL) {
    return 0LL;
  }
  unint64_t v9 = *(void *)(result + 40);
  if (v9 >= 0xFFFFFFFFFFFFFFE0LL)
  {
    __break(0x5513u);
    return result;
  }

  uint64_t result = sub_10001F114(**(void ***)(v9 + 32), (void *)(a2 + 144));
  if (result)
  {
    *(void *)(*(void *)(v3 + 48) + 8LL) = a2 + 144;
    sub_100019A68(*(void *)(v3 + 48), a2);
    return 1LL;
  }

  return result;
}

void sub_10001967C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 136)) {
    sub_1000198F0(a1);
  }
  int v2 = *(_DWORD *)(a1 + 124);
  if (v2 + 1 == *(_DWORD *)(a1 + 112))
  {
    *(_DWORD *)(a1 + 112) = v2;
LABEL_17:
    sub_10001CBE0(*(void *)(a1 + 32));
    sub_10001CBE0(*(void *)(a1 + 88));
    *(void *)(a1 + 88) = 0LL;
    *(void *)(a1 + 32) = 0LL;
    *(void *)(a1 + 48) = 0LL;
    return;
  }

  uint64_t v3 = *(void *)(a1 + 88);
  if (*(void *)(v3 + 80)) {
    int v4 = **(void ***)(*(void *)(v3 + 72) + 8LL);
  }
  else {
    int v4 = sub_10001C774(v3);
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 < *(void *)(a1 + 16)) {
    *(void *)(a1 + 16) = v6;
  }
  if (v5 > *(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = v5;
  }
  unint64_t v7 = sub_10001E55C(*(void ***)(a1 + 88));
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v9 = *(unsigned int *)(a1 + 124);
  if (!__CFADD__(v8, 16 * v9))
  {
    uint64_t v10 = v7[1];
    if ((v10 & 7) != 0) {
      unint64_t v11 = (v10 & 0xFFFFFFFFFFFFFFF8LL) + 24;
    }
    else {
      unint64_t v11 = v10 + 16;
    }
    unsigned int v12 = (void *)(v8 + 16 * v9);
    *unsigned int v12 = v7;
    v12[1] = v11;
    *(_DWORD *)(a1 + 120) += v11;
    goto LABEL_17;
  }

  __break(0x5513u);
}

uint64_t sub_10001976C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 84);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *(_OWORD **)(v3 + 8);
  __int128 v5 = *(_OWORD *)(v3 + 16);
  *(void *)&v19[12] = 0xAAAAAAAAAAAAAAAALL;
  int value = 1;
  __int128 v20 = v5;
  *(_OWORD *)unint64_t v19 = *v4;
  if (fsetxattr(v2, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
  {
    size_t v16 = __error();
    _os_assumes_log(*v16);
  }

  fsync(*(_DWORD *)(a1 + 84));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *(void *)(a1 + 56)
                                                              - *(unsigned int *)(*(void *)(a1 + 48) + 120LL);
  uint64_t result = sub_100005E78( *(void **)(a1 + 64),  "    - [ %s/%s, %zd, %d ]\n",  v6,  v7,  v8,  v9,  v10,  v11,  *(void *)(*(void *)(a1 + 72) + 8LL));
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  compression_algorithm v14 = (unint64_t *)(*(void *)(a1 + 72) + 56LL);
  do
    unint64_t v15 = __ldxr(v14);
  while (__stxr(v15 - v13, v14));
  if (__OFSUB__(v15, v13))
  {
    __break(0x5515u);
LABEL_10:
    uint64_t result = unlinkat(*(_DWORD *)(a1 + 80), "tmp", 0);
    if ((_DWORD)result == -1)
    {
      size_t v17 = __error();
      return _os_assumes_log(*v17);
    }
  }

  return result;
}

uint64_t sub_1000198F0(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  int v2 = __b;
  memset(__b, 170, sizeof(__b));
  int v3 = 256;
  size_t v4 = compression_encode_buffer( __b,  0x10000uLL,  *(const uint8_t **)(v1 + 128),  *(unsigned int *)(v1 + 136),  0LL,  COMPRESSION_LZ4);
  if (v4)
  {
    size_t v5 = v4;
  }

  else
  {
    int v3 = 0;
    int v2 = *(uint8_t **)(v1 + 128);
    size_t v5 = *(unsigned int *)(v1 + 136);
  }

  size_t v6 = v5 + 16;
  unint64_t v7 = (v5 + 16) & 0xFFFFFFFFFFFFFFF8LL;
  if ((v5 & 7) != 0) {
    unint64_t v8 = v7 + 8;
  }
  else {
    unint64_t v8 = v5 + 16;
  }
  uint64_t result = _os_trace_malloc(v8);
  uint64_t v10 = result;
  if ((v5 & 7) != 0)
  {
    if ((v6 & 0x8000000000000000LL) != 0 || v7 > ~result)
    {
      __break(0x5513u);
      return result;
    }

    *(void *)(result + (v6 & 0xFFFFFFFFFFFFFFF8LL)) = 0LL;
  }

  *(void *)uint64_t result = 0x110000600DLL;
  *(void *)(result + 8) = v5;
  memcpy((void *)(result + 16), v2, v5);
  sub_100019A68(v1, v10);
  uint64_t v11 = *(void *)(v1 + 88);
  int v12 = *(_DWORD *)(v1 + 136);
  if (*(void *)(v11 + 80))
  {
    uint64_t v13 = **(void ***)(*(void *)(v11 + 72) + 8LL);
  }

  else
  {
    uint64_t v13 = sub_10001C774(v11);
    uint64_t v11 = *(void *)(v1 + 88);
  }

  *((_DWORD *)v13 + 8) = v12;
  *((_DWORD *)v13 + 9) = v3;
  uint64_t result = (uint64_t)sub_10001C774(v11);
  *(_DWORD *)(v1 + 136) = 0;
  return result;
}

uint64_t sub_100019A68(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 112);
  if (v4 == *(_DWORD *)(result + 116))
  {
    unsigned int v5 = 2 * v4;
    if (v5 <= 0x10) {
      unsigned int v5 = 16;
    }
    *(_DWORD *)(result + 116) = v5;
    uint64_t result = _os_trace_realloc(*(void *)(result + 104), 16LL * v5);
    *(void *)(v3 + 104) = result;
  }

  if (a2)
  {
    uint64_t v6 = *(void *)(a2 + 8);
    unint64_t v7 = (v6 & 0xFFFFFFFFFFFFFFF8LL) + 24;
    unint64_t v8 = v6 + 16;
    if ((*(void *)(a2 + 8) & 7LL) != 0) {
      unint64_t v8 = v7;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  uint64_t v9 = *(void *)(v3 + 104);
  uint64_t v10 = *(unsigned int *)(v3 + 112);
  *(_DWORD *)(v3 + 112) = v10 + 1;
  if (__CFADD__(v9, 16 * v10))
  {
    __break(0x5513u);
  }

  else
  {
    uint64_t v11 = (void *)(v9 + 16 * v10);
    *uint64_t v11 = a2;
    v11[1] = v8;
    *(_DWORD *)(v3 + 120) += v8;
  }

  return result;
}

uint64_t sub_100019B0C(uint64_t result, unint64_t *a2)
{
  uint64_t v3 = *(void *)(result + 32);
  int v4 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 - 24578) >= 2)
  {
    if (v4 != 24577)
    {
      if (v4 != 24580) {
        return 1LL;
      }
      goto LABEL_4;
    }

    unint64_t v14 = a2[1];
    unint64_t v15 = v14 - 16;
    if (v14 >= 0x10)
    {
      size_t v16 = a2 + 4;
      if (v14 - 4113 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_32;
      }
      unint64_t v17 = *((unsigned __int16 *)a2 + 16);
      if (v15 >= v17)
      {
        uint64_t v18 = *((unsigned __int16 *)a2 + 17);
        if (v18 <= 0xFFF)
        {
          if (*((_BYTE *)a2 + 29))
          {
            if (v15 <= v17 + (unsigned __int16)(4096 - v18))
            {
              if (__CFADD__(v16, v17)) {
                goto LABEL_157;
              }
              uint64_t v19 = (unsigned __int16)(4096 - v18);
              __int128 v20 = (char *)v16 + v17;
              goto LABEL_31;
            }
          }

          else if (v15 == 4096)
          {
            if (__CFADD__(v16, v18)) {
              goto LABEL_157;
            }
            __int128 v20 = (char *)v16 + v18;
            uint64_t v19 = (unsigned __int16)(4096 - v18);
LABEL_31:
            *(void *)(v3 + 64) = v20;
            *(void *)(v3 + 72) = v19;
LABEL_33:
            *(void *)(v3 + 56) = v16;
            goto LABEL_34;
          }
        }

LABEL_32:
        *(void *)(v3 + 64) = 0LL;
        *(void *)(v3 + 72) = 0LL;
        goto LABEL_33;
      }
    }

LABEL_155:
    *(void *)(v3 + 56) = 0LL;
    return 1LL;
  }

LABEL_4:
  unsigned int v5 = *((unsigned __int8 *)a2 + 28);
  if (!*((_BYTE *)a2 + 28)) {
    return 1LL;
  }
  uint64_t v6 = *(void *)v3;
  uint64_t v7 = 1LL;
  uint64_t v8 = 2LL;
  uint64_t v9 = 3LL;
  if (v5 >= 0xF) {
    uint64_t v9 = 4LL;
  }
  if (v5 >= 8) {
    uint64_t v8 = v9;
  }
  if (v5 >= 4) {
    uint64_t v7 = v8;
  }
  if (v5 == 1) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = v7;
  }
  if (__CFADD__(v6, 8 * v10)) {
    goto LABEL_157;
  }
  unint64_t v11 = a2[4];
  uint64_t v12 = *(void *)(v6 + 8 * v10);
  uint64_t v13 = sub_10001F114(*(void **)v12, *(void **)(v3 + 8));
  if (!v13 || v13 == 1 && *(void *)(v12 + 8) > v11) {
    return 1LL;
  }
LABEL_34:
  uint64_t v21 = sub_10001F730(*(void **)(*(void *)(v3 + 32) + 40LL), a2[2], *((_DWORD *)a2 + 6));
  *(void *)(v3 + 4sub_100021ACC(qword_10003A798, 0) = v21;
  if (!v21) {
    goto LABEL_155;
  }
  unint64_t v22 = a2[1];
  if ((v22 & 7) != 0) {
    unsigned int v23 = (v22 & 0xFFFFFFF8) + 24;
  }
  else {
    unsigned int v23 = v22 + 16;
  }
  if (*(_DWORD *)(v3 + 136) + v23 > *(_DWORD *)(v3 + 140)) {
    sub_1000198F0(v3);
  }
  if (*(_DWORD *)a2 != 24577)
  {
    memcpy((void *)(*(void *)(v3 + 128) + *(unsigned int *)(v3 + 136)), a2, v23);
    *(_DWORD *)(v3 + 136) += v23;
    sub_10001C834(*(void *)(v3 + 88), a2[4]);
    uint64_t v78 = sub_10001C60C(*(void *)(v3 + 88), *(void *)(v3 + 40));
    *(void *)(v3 + 8sub_100021ACC(qword_10003A798, 0) = v78;
    sub_10001C88C(*(void *)(v3 + 88), v78);
    *(void *)(v3 + 8sub_100021ACC(qword_10003A798, 0) = 0LL;
    *(void *)(v3 + 4sub_100021ACC(qword_10003A798, 0) = 0LL;
    return 1LL;
  }

  memset(&__src[2], 170, 0xFF0uLL);
  uint64_t v24 = *(size_t **)(v3 + 56);
  __src[1] = v24[1];
  size_t v25 = *v24;
  LODWORD(v25) = 268435472;
  __src[0] = v25;
  *(void *)(v3 + 96) = __src;
  uint64_t v26 = v24 + 2;
  unint64_t v27 = *(unsigned __int16 *)v24;
  unint64_t v28 = (unint64_t)(v24 + 2);
  if (v27 <= 0x1000)
  {
    if (__CFADD__(v24, v27)) {
      goto LABEL_157;
    }
    unint64_t v28 = (unint64_t)v24 + v27;
  }

  id v94 = a2;
  unint64_t v95 = a2 + 2;
  while (1)
  {
    unint64_t v29 = (unint64_t)(v26 + 3);
    unint64_t v30 = v26;
    unint64_t v31 = v26[2];
    unint64_t v32 = HIWORD(v31);
    uint64_t v34 = v32 + 24;
    if ((v31 & 0x7000000000000LL) != 0) {
      uint64_t v34 = (HIWORD(v31) & 0xFFF8) + 32LL;
    }
    if (__CFADD__(v26, v34)) {
      goto LABEL_157;
    }
    uint64_t v26 = (void *)((char *)v26 + v34);
    uint64_t v35 = *(void *)v30;
    if (*(void *)v30 && (v35 | 2) == 6)
    {
      __int16 v36 = WORD1(*(void *)v30);
      if ((v35 & 0x10000) == 0)
      {
        uint64_t v37 = 0LL;
        if ((v35 & 0x100000) == 0) {
          goto LABEL_58;
        }
        goto LABEL_67;
      }

      if (v31 >> 51)
      {
        uint64_t v37 = 8LL;
        if ((v35 & 0x100000) == 0)
        {
LABEL_58:
          if ((v35 & 0x1000000) == 0) {
            goto LABEL_59;
          }
          goto LABEL_70;
        }

LABEL_67:
        if (v37 + 8 <= v32)
        {
          if (__CFADD__(v29, v37)) {
            goto LABEL_157;
          }
          v37 += 8LL;
          if ((v35 & 0x1000000) == 0)
          {
LABEL_59:
            LODWORD(v38) = 0;
            unint64_t v39 = 0LL;
            unint64_t v40 = v37;
            uint64_t v37 = 0LL;
            goto LABEL_60;
          }

    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v15 = v11 % v12;
      }
      else {
        unint64_t v15 = v11;
      }
    }

    else
    {
      unint64_t v15 = (v12 - 1) & v11;
    }

    goto LABEL_72;
  }

  while (1)
  {
    uint64_t v18 = *((void *)v17 + 1);
    if (v18 == v11) {
      break;
    }
    if (v14 > 1)
    {
      if (v18 >= v12) {
        v18 %= v12;
      }
    }

    else
    {
      v18 &= v12 - 1;
    }

    if (v18 != v15) {
      goto LABEL_26;
    }
LABEL_25:
    unint64_t v17 = *(unsigned __int8 **)v17;
    if (!v17) {
      goto LABEL_26;
    }
  }

  unint64_t v43 = 0LL;
  if (v7 < 0) {
LABEL_82:
  }
    operator delete(__p[0]);
  return v43;
}

LABEL_70:
          unint64_t v40 = v37 + 4;
          if (v37 + 4 <= v32)
          {
            if (__CFADD__(v29, v37)) {
              goto LABEL_157;
            }
            unint64_t v39 = *(unsigned __int16 *)(v29 + v37);
            uint64_t v38 = *(unsigned __int16 *)(v29 + v37 + 2);
            if (v38 + v39 <= 0x1000 && 4096LL - *(void *)(v3 + 72) <= v39)
            {
LABEL_60:
              uint64_t v41 = *(void *)(v3 + 40);
              if ((*(_WORD *)(v41 + 2) & 1) != 0) {
                unsigned int v42 = 4;
              }
              else {
                unsigned int v42 = 6;
              }
              switch(v36 & 0xE)
              {
                case 2:
                case 4:
                case 6:
                  unsigned int v42 = 4;
                  break;
                case 8:
                  break;
                case 0xA:
                  unsigned int v42 = 20;
                  break;
                case 0xC:
                  unsigned int v42 = 6;
                  break;
                default:
                  unsigned int v42 = 0;
                  break;
              }

              unint64_t v43 = v40 + v42;
              if (v43 <= v32)
              {
                unint64_t v44 = ~v29;
                if (~v29 < v40) {
                  goto LABEL_157;
                }
                if (v42)
                {
                  uint64_t v45 = (unsigned int *)(v29 + v40);
                  if (v42 == 6)
                  {
                    uint64_t v97 = *((unsigned __int16 *)v45 + 2);
                    uint64_t v98 = 0LL;
                  }

                  else
                  {
                    if (v42 == 4) {
                      uint64_t v46 = 0LL;
                    }
                    else {
                      uint64_t v46 = (uint64_t *)(v45 + 1);
                    }
                    uint64_t v97 = 0LL;
                    uint64_t v98 = v46;
                  }

                  uint64_t v96 = *v45;
                  if ((v36 & 0x20) != 0)
                  {
                    unint64_t v47 = v43 + 2;
                    if (v43 + 2 <= v32)
                    {
                      if (v43 > v44) {
                        goto LABEL_157;
                      }
                      goto LABEL_91;
                    }
                  }

                  else
                  {
                    unint64_t v47 = v43;
LABEL_91:
                    unsigned int __n = v38;
                    unint64_t v100 = v39;
                    if ((*(void *)v30 & 0x2000000LL) != 0)
                    {
                      uint64_t v48 = v26;
                      unint64_t v49 = v28;
                      unint64_t v50 = v47 + 2;
                      if (v47 + 2 > v32)
                      {
                        uint64_t v101 = 0LL;
                        __int16 v99 = -21846;
                        unint64_t v47 = HIWORD(v31);
                      }

                      else
                      {
                        if (v47 > v44) {
                          goto LABEL_157;
                        }
                        __int16 v99 = *(_WORD *)(v29 + v47);
                        __int16 v103 = v99;
                        uint64_t v101 = sub_100020C34(*(void *)(v41 + 64), (uint64_t)&v103);
                        unint64_t v31 = *((void *)v30 + 2);
                        __int16 v36 = *((_WORD *)v30 + 1);
                        unint64_t v32 = HIWORD(v31);
                        unint64_t v47 = v50;
                      }

                      unint64_t v28 = v49;
                      uint64_t v26 = v48;
                      if ((v36 & 0x400) != 0) {
                        goto LABEL_98;
                      }
                    }

                    else
                    {
                      uint64_t v101 = 0LL;
                      __int16 v99 = -21846;
                      if ((*(void *)v30 & 0x4000000LL) != 0)
                      {
LABEL_98:
                        if (v47 < v32)
                        {
                          if (v47 > v44) {
                            goto LABEL_157;
                          }
                          unsigned int v51 = *(unsigned __int8 *)(v29 + v47);
                          if (*(_BYTE *)(v29 + v47))
                          {
                            if (v51 == 1)
                            {
                              uint64_t v52 = 0LL;
                            }

                            else if (v51 >= 4)
                            {
                              if (v51 >= 8)
                              {
                                BOOL v53 = v51 >= 0xF;
                                uint64_t v52 = 3LL;
                                if (v53) {
                                  uint64_t v52 = 4LL;
                                }
                              }

                              else
                              {
                                uint64_t v52 = 2LL;
                              }
                            }

                            else
                            {
                              uint64_t v52 = 1LL;
                            }

                            if (__CFADD__(*(void *)v3, 8 * v52)) {
                              goto LABEL_157;
                            }
                            uint64_t v54 = *(void *)(*(void *)(v3 + 56) + 8LL);
                            uint64_t v55 = *(void *)(*(void *)v3 + 8 * v52);
                            uint64_t v56 = sub_10001F114(*(void **)v55, *(void **)(v3 + 8));
                            if (v56)
                            {
                              unint64_t v57 = v54 + (v31 & 0xFFFFFFFFFFFFLL);
                              if (v56 != 1 || *(void *)(v55 + 8) <= v57)
                              {
                                if (!*(void *)(v3 + 80))
                                {
                                  uint64_t v58 = sub_10001C60C(*(void *)(v3 + 88), *(void *)(v3 + 40));
                                  *(void *)(v3 + 8sub_100021ACC(qword_10003A798, 0) = v58;
                                  sub_10001C88C(*(void *)(v3 + 88), v58);
                                  __int16 v36 = *((_WORD *)v30 + 1);
                                }

                                int v59 = v36 & 0xE;
                                if (v59 == 10)
                                {
                                  uint64_t v63 = *(void *)(*(void *)(v3 + 88) + 16LL);
                                  uint64_t v60 = v101;
                                  if (v63) {
                                    uint64_t v64 = *(void *)(v63 + 24);
                                  }
                                  else {
                                    uint64_t v64 = 0LL;
                                  }
                                  sub_10001ECF8((float *)v63, v98, v64);
                                  goto LABEL_123;
                                }

                                uint64_t v60 = v101;
                                if (v59 == 8)
                                {
                                  uint64_t v61 = sub_10001C31C( *(unsigned int **)(*(void *)(v3 + 40) + 56LL),  v96 | (v97 << 32));
                                  if (v61)
                                  {
                                    *(void *)&v108[10] = 0xAAAAAAAAAAAAAAAALL;
                                    uint64_t v62 = *(void *)v61;
                                    uint64_t v105 = *(void *)(v61 + 8);
                                    int v106 = v62;
                                    __int16 v107 = WORD2(v62);
                                    *(_OWORD *)int v108 = *(_OWORD *)(v61 + 16);
                                    sub_10001C220(*(void *)(v3 + 88), *(void *)(v3 + 80), (uint64_t)&v105);
                                    uint64_t v60 = v101;
                                    goto LABEL_123;
                                  }
                                }

                                else
                                {
LABEL_123:
                                  if (v60)
                                  {
                                    uint64_t v65 = *(void *)(v3 + 80);
                                    uint64_t v66 = *(void *)(v3 + 88);
                                    __int16 v103 = v99;
                                    uint64_t v67 = *(void *)(v3 + 88);
                                    __int16 v68 = (unsigned __int16)sub_100020340(*(void **)(v67 + 24), *(char **)(v60 + 8));
                                    sub_10001C960(v67, v68);
                                    __int16 v69 = (unsigned __int16)sub_100020340(*(void **)(v67 + 24), *(char **)(v60 + 16));
                                    sub_10001C960(v67, v69);
                                  }

                                  uint64_t result = (uint64_t)sub_10001C834(*(void *)(v3 + 88), v57);
                                  unint64_t v70 = *(void *)(v3 + 96);
                                  unint64_t v71 = *(unsigned __int16 *)v70;
                                  if (v71 > 0x1000) {
                                    goto LABEL_158;
                                  }
                                  if (~v70 < v71) {
                                    goto LABEL_157;
                                  }
                                  uint64_t v72 = (char *)(v70 + v71);
                                  unint64_t v73 = *((void *)v30 + 2);
                                  if ((v73 & 0x7000000000000LL) != 0) {
                                    uint64_t v74 = (HIWORD(v73) & 0xFFF8) + 32;
                                  }
                                  else {
                                    uint64_t v74 = HIWORD(v73) + 24;
                                  }
                                  uint64_t result = (uint64_t)memcpy(v72, v30, (unsigned __int16)v74);
                                  *(_WORD *)v70 += v74;
                                  if ((v30[3] & 1) != 0)
                                  {
                                    uint64_t v75 = *(void *)(v3 + 72);
                                    unsigned __int16 v76 = *(_WORD *)(v70 + 2) - __n;
                                    *(_WORD *)(v70 + 2) = v76;
                                    if (v76 > 0x1000u) {
                                      goto LABEL_158;
                                    }
                                    if (~v70 < v76) {
                                      goto LABEL_157;
                                    }
                                    memcpy( (void *)(v70 + v76),  (const void *)(*(void *)(v3 + 64) + v100 + v75 - 4096),  __n);
                                    if (__CFADD__(v72 + 24, v37)) {
                                      goto LABEL_157;
                                    }
                                    int v77 = (unsigned __int16 *)&v72[v37 + 24];
                                    *int v77 = v76;
                                    v77[1] = __n;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  if (!*(void *)(v3 + 80))
  {
LABEL_154:
    *(void *)(v3 + 8sub_100021ACC(qword_10003A798, 0) = 0LL;
    *(void *)(v3 + 4sub_100021ACC(qword_10003A798, 0) = 0LL;
    *(void *)(v3 + 96) = 0LL;
    goto LABEL_155;
  }

  size_t v79 = LOWORD(__src[0]);
  uint64_t v80 = WORD1(__src[0]);
  unsigned int v81 = LOWORD(__src[0]) - WORD1(__src[0]) + 4096;
  BOOL v82 = v81 < 0xFF9;
  if (v81 >= 0xFF9) {
    unsigned int v81 = 4096;
  }
  if (WORD1(__src[0]) == 4096) {
    size_t v83 = LOWORD(__src[0]);
  }
  else {
    size_t v83 = v81;
  }
  BOOL v84 = WORD1(__src[0]) != 4096 && v82;
  int v85 = (void *)(*(void *)(v3 + 128) + *(unsigned int *)(v3 + 136));
  *int v85 = 24577LL;
  v85[1] = v83 + 16;
  uint64_t v86 = (*(_DWORD *)(v3 + 136) + 16);
  *(_DWORD *)(v3 + 136) = v86;
  LOWORD(v85) = *((_WORD *)v94 + 15);
  uint64_t v87 = *(void *)(v3 + 128) + v86;
  unint64_t v88 = *v95;
  int v89 = *((_DWORD *)v95 + 2);
  *(_BYTE *)(v87 + 12) = *((_BYTE *)v95 + 12);
  *(_DWORD *)(v87 + 8) = v89;
  *(void *)uint64_t v87 = v88;
  *(_BYTE *)(v87 + 13) = v84;
  *(_WORD *)(v87 + 14) = (_WORD)v85;
  uint64_t v90 = (*(_DWORD *)(v3 + 136) + 16);
  *(_DWORD *)(v3 + 136) = v90;
  uint64_t v91 = (void *)(*(void *)(v3 + 128) + v90);
  if (!v84)
  {
    memcpy(v91, __src, v83);
    int v93 = *(_DWORD *)(v3 + 136) + v83;
LABEL_153:
    *(_DWORD *)(v3 + 136) = v93;
    goto LABEL_154;
  }

  uint64_t result = (uint64_t)memcpy(v91, __src, v79);
  uint64_t v92 = (*(_DWORD *)(v3 + 136) + v79);
  *(_DWORD *)(v3 + 136) = v92;
  if (v80 <= 0x1000)
  {
    if (!__CFADD__(__src, v80))
    {
      memcpy((void *)(*(void *)(v3 + 128) + v92), (char *)__src + v80, 4096 - v80);
      int v93 = *(_DWORD *)(v3 + 136) + 4096 - v80;
      goto LABEL_153;
    }

LABEL_157:
    __break(0x5513u);
  }

LABEL_158:
  __break(0x5512u);
  return result;
}

uint64_t sub_10001A404(uint64_t a1)
{
  uint64_t result = unlinkat(*(_DWORD *)(a1 + 80), *(const char **)(a1 + 40), 0);
  if ((_DWORD)result != -1)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    **(_BYTE **)(a1 + 48) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v9;
    uint64_t result = sub_100005E78( *(void **)(a1 + 64),  "    - [ %s/%s, %zd, 0 ]\n",  v3,  v4,  v5,  v6,  v7,  v8,  *(void *)(*(void *)(a1 + 72) + 8LL));
    uint64_t v10 = *(void *)(a1 + 72);
    int v11 = *(_DWORD *)(v10 + 64);
    BOOL v12 = __OFSUB__(v11, 1);
    int v13 = v11 - 1;
    if (v12) {
      goto LABEL_7;
    }
    *(_DWORD *)(v10 + 64) = v13;
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    unint64_t v15 = (unint64_t *)(v10 + 56);
    do
      unint64_t v16 = __ldxr(v15);
    while (__stxr(v16 - v14, v15));
    if (__OFSUB__(v16, v14)) {
LABEL_7:
    }
      __break(0x5515u);
  }

  return result;
}

uint64_t sub_10001A4B0(uint64_t a1)
{
  *(void *)&v25[24] = 0LL;
  uint64_t v2 = sub_10001313C(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), (uint64_t)&v25[24]);
  memset(&v25[32], 170, 0x400uLL);
  *(void *)&v25[16] = 0xAA00000000100000LL;
  *(void *)size_t v25 = &v25[32];
  *(void *)&v25[8] = 0x40000000000LL;
  sub_1000131EC((tm *)v25, *(void *)(a1 + 40), (uint64_t)"Periodic Compaction", 0LL, v3, v4, v5, v6, v23);
  if ((int)v2 < 1)
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 64LL) = v2;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    while (1)
    {
      if (__CFADD__(*(void *)&v25[24], v7)) {
        __break(0x5513u);
      }
      uint64_t v9 = (const char *)(*(void *)(*(void *)&v25[24] + 8 * v8) + 21LL);
      size_t v24 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t result = sub_100018E94(*(unsigned int *)(a1 + 56), v9, *(void *)(a1 + 48), &v24);
      if (!(_DWORD)result) {
        break;
      }
      if (unlinkat(*(_DWORD *)(a1 + 56), v9, 0) == -1)
      {
        uint64_t v21 = __error();
        _os_assumes_log(*v21);
      }

      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += v24;
      sub_100005E78(v25, "    - %s/%s\n", v15, v16, v17, v18, v19, v20, *(void *)(*(void *)(a1 + 40) + 8LL));
      uint64_t result = sub_1000133AC(v9);
      *(void *)(*(void *)(a1 + 40) + 32LL) = result;
      ++v8;
      v7 += 8LL;
      if (v2 == v8)
      {
        uint64_t v8 = v2;
        break;
      }
    }

    if (__OFSUB__((_DWORD)v2, (_DWORD)v8))
    {
      __break(0x5515u);
      return result;
    }

    uint64_t v22 = *(void *)(a1 + 40);
    *(_DWORD *)(v22 + 64) = v2 - v8;
    if ((_DWORD)v8) {
      sub_100013440(v25, v22, v8, *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v11, v12, v13, v14);
    }
  }

  if ((v25[20] & 1) != 0) {
    free(*(void **)v25);
  }
  return _os_trace_scandir_free_namelist(v2, *(void *)&v25[24]);
}

uint64_t sub_10001A6AC(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)a2;
  if (*(void *)(a1 + 40) == a2)
  {
    if (v3 == 4096 && *(void *)(a2 + 8) >= 0x28uLL)
    {
      uint64_t result = sub_10001F114(**(void ***)(a1 + 48), (void *)(a2 + 144));
      if (result != 1)
      {
        uint64_t v7 = result;
        uint64_t result = 0LL;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7 == 0;
      }
    }

    else
    {
      return 0LL;
    }
  }

  else if (v3 == 24587 && (uint64_t v4 = sub_10001CC48(a2)) != 0)
  {
    uint64_t v5 = (void *)(v4 + 64);
    while (1)
    {
      uint64_t v5 = (void *)*v5;
      if (!v5) {
        break;
      }
      if (v5[3] >= *(void *)(*(void *)(a1 + 48) + 8LL))
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
        break;
      }
    }

    sub_10001CBE0(v4);
    return *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 0;
  }

  else
  {
    return 1LL;
  }

  return result;
}

void sub_10001A790(void *a1, void *a2, void **a3)
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v5;
  *(_OWORD *)&out[16] = v5;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ContinuousTime"]);
  if (([v9 isNSNumber] & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }

  id v10 = [v9 unsignedLongLongValue];
  *(void *)&v34[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__int128 in = v11;
  *(_OWORD *)uint64_t v34 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"UUID"]);

  if (![v12 isNSString]
    || ([v12 getCString:in maxLength:37 encoding:1] & 1) == 0)
  {

    goto LABEL_10;
  }

  int v13 = uuid_parse(in, uu);

  if (!v13)
  {
    uint64_t v14 = (void **)*a3;
    uint64_t v15 = *a3 ? v14[3] : 0LL;
    uint64_t v19 = sub_10001F114(*a3, uu);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = (id *)(a3 + 1);
      unint64_t v22 = v19 - 1;
      if (v19 == 1)
      {
        id v27 = *v21;
        if (*v21 <= v10) {
          id v27 = v10;
        }
        *uint64_t v21 = v27;
      }

      else
      {
        *uint64_t v21 = v10;
        if ((unint64_t)v15 <= v22)
        {
          if (v14) {
            size_t v28 = 16LL * (void)v14[3];
          }
          else {
            size_t v28 = 0LL;
          }
          *uint64_t v21 = 0LL;
          a3[2] = 0LL;
          bzero(a3 + 3, v28);
          sub_10001F208(v14);
        }

        else
        {
          char v23 = (uint64_t *)(a3 + 3);
          memmove(a3 + 3, &a3[2 * v22 + 3], 16 * (uint64_t)((uint64_t)v15 - v22));
          sub_10001F270(v14);
          size_t v24 = operator new(0x28uLL);
          _OWORD *v24 = 0u;
          v24[1] = 0u;
          *((_DWORD *)v24 + 8) = 1065353216;
          *a3 = v24;
          uint64_t v25 = (uint64_t)v15 - v20;
          uint64_t v26 = -1LL;
          do
          {
            sub_10001ECF8((float *)*a3, v23, v26 + 2);
            ++v26;
            v23 += 2;
          }

          while (v25 != v26);
        }
      }
    }
  }

void sub_10001AA60(id a1)
{
}

__CFDictionary *__cdecl sub_10001AAE8(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v29 = 0LL;
  unint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  __int128 v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( a3,  "objectForKeyedSubscript:",  @"CACHE_DELETE_AMOUNT"));
  id v7 = [v6 longLongValue];

  objc_autoreleasePoolPop(v5);
  unint64_t v28 = (unint64_t)v7;
  memset(__b, 170, 0x400uLL);
  uint64_t v8 = (const char *)objc_msgSend( -[__CFDictionary objectForKeyedSubscript:]( a3, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME"), "UTF8String");
  snprintf( __b,  0x400uLL,  "Received a Purge Request from CacheDelete on volume %s with urgency: %d and goal: %lld",  v8,  a2,  v26[3]);
  sub_10000B70C((uint64_t)__b);
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  if (sub_100016C58((const char *)qword_10003A958, a3))
  {
    if (a2 == 2) {
      int v9 = 2;
    }
    else {
      int v9 = 3;
    }
    v19[0] = _NSConcreteStackBlock;
    if (a2 <= 1) {
      int v9 = 1;
    }
    v19[1] = 3221225472LL;
    uint64_t v20 = sub_10001AE34;
    uint64_t v21 = &unk_100029F18;
    int v24 = v9;
    unint64_t v22 = &v25;
    char v23 = &v29;
    sub_10001AE34((uint64_t)v19, (uint64_t)&off_10002DDB0);
    sub_10001AE34((uint64_t)v19, (uint64_t)&off_10002DD20);
    v20((uint64_t)v19, (uint64_t)&off_10002DC00);
    v20((uint64_t)v19, (uint64_t)&off_10002DC90);
  }

  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  if (!sub_100016C58((const char *)qword_10003A968, a3))
  {
    __int128 v11 = v26;
    uint64_t v16 = (char *)v30[3];
    goto LABEL_17;
  }

  memset(&__b[19], 170, 0x3EDuLL);
  strcpy(__b, "Purging UUID Cache");
  sub_10000B70C((uint64_t)__b);
  uint64_t result = (__CFDictionary *)sub_100013AC0();
  __int128 v11 = v26;
  uint64_t v12 = v26[3];
  BOOL v13 = __OFSUB__(v12, result);
  uint64_t v14 = v12 - (void)result;
  if (v13)
  {
    __break(0x5515u);
  }

  else
  {
    v26[3] = v14;
    uint64_t v15 = v30[3];
    uint64_t v16 = (char *)result + v15;
    if (!__OFADD__(v15, result))
    {
      v30[3] = (uint64_t)v16;
LABEL_17:
      memset(__b, 170, 0x400uLL);
      snprintf(__b, 0x400uLL, "Purge complete. Goal: %lld bytes. Removed: %lld bytes", v11[3], v16);
      sub_10000B70C((uint64_t)__b);
      char v33 = @"CACHE_DELETE_AMOUNT";
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v30[3]));
      uint64_t v34 = v17;
      uint64_t v18 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
      return v18;
    }
  }

  __break(0x5500u);
  return result;
}

void sub_10001AE34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 < 1) {
    return;
  }
  uint64_t v5 = a1;
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  if (*(_DWORD *)(a2 + 64) <= *(_DWORD *)(a2 + 92))
  {
    if (v6 >= 4)
    {
LABEL_22:
      __break(0x5512u);
      goto LABEL_23;
    }

    if (__CFADD__(a2 + 96, 8 * v6))
    {
LABEL_21:
      __break(0x5513u);
      goto LABEL_22;
    }

    if (*(void *)(a2 + 56) <= *(void *)(a2 + 8 * v6 + 96))
    {
      uint64_t v11 = 0LL;
      goto LABEL_14;
    }
  }

  else if (v6 > 3)
  {
    goto LABEL_22;
  }

  if (__CFADD__(a2 + 96, 8 * v6)) {
    goto LABEL_21;
  }
  uint64_t v7 = *(void *)(a2 + 8 * v6 + 96);
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  int v8 = openat(dword_10002DBF8, *(const char **)(a2 + 8), 1048832);
  if (v8 == -1)
  {
    a1 = *__error();
  }

  else
  {
    int v9 = v8;
    if (v8 < 0) {
      goto LABEL_12;
    }
    id v10 = *(dispatch_queue_s **)(a2 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013A88;
    block[3] = &unk_100029B00;
    void block[4] = &v17;
    void block[5] = a2;
    void block[6] = v3;
    void block[7] = v7;
    block[8] = __PAIR64__(v9, v6);
    dispatch_sync(v10, block);
    if (close(v9) != -1) {
      goto LABEL_12;
    }
    int v16 = *__error();
    a1 = *__error();
    if (v16 == 9)
    {
LABEL_25:
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = a1;
      __break(1u);
      return;
    }
  }

  _os_assumes_log(a1);
LABEL_12:
  uint64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  uint64_t v2 = *(void *)(*(void *)(v5 + 32) + 8LL);
  uint64_t v3 = *(void *)(v2 + 24);
LABEL_14:
  if (__OFSUB__(v3, v11))
  {
LABEL_23:
    __break(0x5515u);
    goto LABEL_24;
  }

  *(void *)(v2 + 24) = v3 - v11;
  uint64_t v12 = *(void *)(*(void *)(v5 + 40) + 8LL);
  uint64_t v13 = *(void *)(v12 + 24);
  BOOL v14 = __OFADD__(v13, v11);
  uint64_t v15 = v13 + v11;
  if (v14)
  {
LABEL_24:
    __break(0x5500u);
    goto LABEL_25;
  }

  *(void *)(v12 + 24) = v15;
  memset(block, 170, sizeof(block));
  snprintf((char *)block, 0x400uLL, "Purging book: %s, Removed: %lld bytes", *(const char **)(a2 + 8), v11);
  sub_10000B70C((uint64_t)block);
}

__CFDictionary *__cdecl sub_10001B090(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  if (sub_100016C58((const char *)qword_10003A958, a3))
  {
    if (a2 == 2) {
      int v5 = 2;
    }
    else {
      int v5 = 3;
    }
    v10[0] = _NSConcreteStackBlock;
    if (a2 <= 1) {
      int v5 = 1;
    }
    v10[1] = 3221225472LL;
    uint64_t v11 = sub_10001B304;
    uint64_t v12 = &unk_100029F18;
    int v15 = v5;
    uint64_t v13 = &v20;
    BOOL v14 = &v16;
    sub_10001B304((uint64_t)v10, (uint64_t)&off_10002DDB0);
    sub_10001B304((uint64_t)v10, (uint64_t)&off_10002DD20);
    v11((uint64_t)v10, (uint64_t)&off_10002DC00);
    v11((uint64_t)v10, (uint64_t)&off_10002DC90);
  }

  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "Reporting %lld/%lld bytes as purgeable", v21[3], v17[3]);
  sub_10000B70C((uint64_t)__b);
  v24[0] = @"CACHE_DELETE_AMOUNT";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v21[3]));
  v24[1] = @"CACHE_DELETE_NONPURGEABLE_AMOUNT";
  v25[0] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v17[3]));
  v25[1] = v7;
  int v8 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v8;
}

uint64_t sub_10001B304(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  uint64_t v3 = *(unsigned int *)(result + 48);
  if (v3 >= 4)
  {
    __break(0x5512u);
    goto LABEL_12;
  }

  if (__CFADD__(a2 + 96, 8 * v3))
  {
LABEL_12:
    __break(0x5513u);
LABEL_13:
    __break(0x5515u);
    return result;
  }

  uint64_t v4 = *(void *)(a2 + 8 * v3 + 96);
  uint64_t v5 = v2 - v4;
  if (v2 <= v4) {
    goto LABEL_9;
  }
  if (__OFSUB__(v2, v4)) {
    goto LABEL_13;
  }
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8LL);
  uint64_t v6 = *(void *)(v2 + 24);
  BOOL v7 = __OFADD__(v6, v5);
  uint64_t v8 = v6 + v5;
  if (v7
    || (*(void *)(v2 + 24) = v8,
        uint64_t v9 = *(void *)(*(void *)(result + 40) + 8LL),
        uint64_t v11 = *(void *)(v9 + 24),
        id v10 = (void *)(v9 + 24),
        uint64_t v2 = v11 + v4,
        __OFADD__(v11, v4)))
  {
    do
    {
      __break(0x5500u);
LABEL_9:
      uint64_t v12 = *(void *)(*(void *)(result + 40) + 8LL);
      uint64_t v13 = *(void *)(v12 + 24);
      id v10 = (void *)(v12 + 24);
      BOOL v7 = __OFADD__(v13, v2);
      v2 += v13;
    }

    while (v7);
  }

  *id v10 = v2;
  return result;
}

void sub_10001B38C(void *a1)
{
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  uint64_t v2 = openat(-2, (const char *)qword_10003A960, 0);
  if ((_DWORD)v2 == -1)
  {
    uint64_t v38 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to open timesync directory";
    qword_10002DF78 = v38;
    __break(1u);
LABEL_61:
    __break(0x5513u);
  }

  int v3 = v2;
  uint64_t v4 = qword_10002DC70;
  if (qword_10002DC38 > qword_10002DC70)
  {
    uint64_t v2 = openat(dword_10002DBF8, off_10002DC08, 1048832);
    if ((_DWORD)v2 == -1)
    {
      uint64_t v34 = *__error();
    }

    else
    {
      int v5 = v2;
      if ((v2 & 0x80000000) != 0) {
        goto LABEL_9;
      }
      sub_100012D08((uint64_t)&off_10002DC00, 2u, 0x7FFFFFFFFFFFFFFFLL, v4, v2);
      uint64_t v2 = close(v5);
      if ((_DWORD)v2 != -1) {
        goto LABEL_9;
      }
      int v37 = *__error();
      uint64_t v34 = *__error();
      if (v37 == 9)
      {
LABEL_63:
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = v34;
        __break(1u);
        return;
      }
    }

    uint64_t v2 = _os_assumes_log(v34);
  }

const char *sub_10001BA9C(uint64_t a1, uint64_t a2)
{
  uint64_t result = strrchr((const char *)(a2 + 104), 46);
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, ".tracev3");
    if (!(_DWORD)result)
    {
      size_t v10 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t result = (const char *)_os_trace_mmap_at(4294967294LL, *(void *)(a2 + 48), 0LL, &v10);
      if (result)
      {
        int v5 = (char *)result;
        unint64_t v6 = 0LL;
        uint64_t v7 = *(void *)(a1 + 32);
        size_t v8 = v10;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 0x40000000LL;
        uint64_t v12 = sub_10002101C;
        uint64_t v13 = &unk_10002A360;
        uint64_t v14 = v7;
        do
        {
          if (v8 - v6 < 0x10) {
            break;
          }
          unint64_t v9 = *(void *)&v5[v6 + 8];
          if (v8 - v6 - 16 < v9) {
            break;
          }
          unint64_t v6 = (v6 + v9 + 23) & 0xFFFFFFFFFFFFFFF8LL;
        }

        while (v6 - 1 < v8);
        return (const char *)munmap(v5, v10);
      }
    }
  }

  return result;
}

void sub_10001BBC8(id a1, int a2)
{
  do
    int v2 = __ldxr((unsigned int *)&dword_10002DF08);
  while (__stxr(0xFFFFFFFF, (unsigned int *)&dword_10002DF08));
  if (v2 != -1)
  {
    notify_cancel(v2);
    if (qword_10003A970 != -1) {
      dispatch_once(&qword_10003A970, &stru_10002A340);
    }
    v16[0] = (char *)qword_10003A958;
    v16[1] = 0LL;
    int v3 = fts_open(v16, 2132, 0LL);
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = fts_read(v3);
      if (v5)
      {
        unint64_t v6 = v5;
        while (1)
        {
          if (v6->fts_info != 8) {
            goto LABEL_17;
          }
          uint64_t v15 = 0LL;
          __int128 v14 = xmmword_100024768;
          uint64_t v7 = strrchr(v6->fts_name, 46);
          if (!v7) {
            goto LABEL_17;
          }
          size_t v8 = v7;
          if (!strcmp(v7, ".log") || !strcmp(v8, ".txt")) {
            break;
          }
          if (!strcmp(v8, ".tracev3"))
          {
            int v9 = 3;
            goto LABEL_15;
          }

void sub_10001BDA8(void *a1)
{
  id v1 = a1;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  uint64_t v11 = sub_10001C194;
  uint64_t v12 = &unk_100029D60;
  int v13 = &v14;
  int v2 = v10;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  v18[0] = (char *)qword_10003A958;
  v18[1] = 0LL;
  int v3 = fts_open(v18, 2132, 0LL);
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = fts_read(v3);
    if (v5)
    {
      unint64_t v6 = v5;
      do
      {
        if (v6->fts_info == 8) {
          ((void (*)(void *))v11)(v2);
        }
        unint64_t v6 = fts_read(v4);
      }

      while (v6);
    }

    fts_close(v4);
  }

  else
  {
    _os_assumes_log(0LL);
  }

  if (*((_BYTE *)v15 + 24))
  {
    id v7 = v1;
    size_t v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Pending"]);
    if (v8)
    {
      int v9 = v8;
    }

    else
    {
      int v9 = -[NSMutableArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithObjects:",  @"timesync-build",  0LL);
      [v7 setObject:v9 forKeyedSubscript:@"Pending"];
    }
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t sub_10001BF88()
{
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  v8[0] = (char *)qword_10003A958;
  v8[1] = 0LL;
  uint64_t v0 = fts_open(v8, 2132, 0LL);
  if (!v0) {
    return _os_assumes_log(0LL);
  }
  id v1 = v0;
  int v2 = fts_read(v0);
  if (v2)
  {
    int v3 = v2;
    do
    {
      if (v3->fts_info == 8)
      {
        uint64_t v4 = strrchr(v3->fts_name, 46);
        if (v4)
        {
          int v5 = v4;
          if ((!strcmp(v4, ".txt") || !strcmp(v5, ".log") || !strcmp(v5, ".tracev3"))
            && chmod(v3->fts_path, 0x1A4u) == -1)
          {
            unint64_t v6 = __error();
            _os_assumes_log(*v6);
          }
        }
      }

      int v3 = fts_read(v1);
    }

    while (v3);
  }

  return fts_close(v1);
}

uint64_t sub_10001C0E8()
{
  return unlinkat(dword_10002DBF8, "uuid.purged.1.txt", 0);
}

void sub_10001C128(void *a1)
{
  id v1 = a1;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  int v2 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  [v1 setObject:v2 forKeyedSubscript:@"Identifier"];
}

const char *sub_10001C194(uint64_t a1, uint64_t a2)
{
  uint64_t result = strrchr((const char *)(a2 + 104), 46);
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, ".timesync");
    if (!(_DWORD)result)
    {
      uint64_t result = (const char *)unlink(*(const char **)(a2 + 48));
      if ((_DWORD)result == -1)
      {
        int v5 = __error();
        uint64_t result = (const char *)_os_assumes_log(*v5);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

uint64_t sub_10001C208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10001C220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24);
  }
  else {
    uint64_t v7 = 0LL;
  }
  sub_10001ECF8((float *)v6, (uint64_t *)(a3 + 14), v7);
  unint64_t v11 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
  uint64_t result = sub_100020C34(*(void *)(a2 + 56), (uint64_t)&v11);
  if (!result)
  {
    uint64_t v9 = _os_trace_calloc(1LL, 32LL);
    *(void *)uint64_t v9 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
    *(void *)(v9 + 8) = *(void *)a3;
    *(_OWORD *)(v9 + 16) = *(_OWORD *)(a3 + 14);
    uint64_t result = sub_100020D28(*(unsigned int **)(a2 + 56), (void *)v9, v9);
    if ((result & 1) == 0)
    {
      uint64_t v10 = _os_assert_log(0LL);
      _os_crash(v10);
      __break(1u);
    }

    ++*(void *)(a1 + 48);
  }

  return result;
}

uint64_t sub_10001C31C(unsigned int *a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 0LL;
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  void v5[3] = -1LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  void v4[2] = sub_10001C3F4;
  v4[3] = &unk_10002A0F0;
  v4[5] = &v6;
  v4[6] = a2;
  v4[4] = v5;
  sub_100020E74(a1, (uint64_t)v4);
  uint64_t v2 = v7[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void *sub_10001C3F4(void *result, uint64_t a2, void *a3)
{
  unint64_t v3 = result[6];
  if (v3 >= *a3)
  {
    unint64_t v4 = a3[1];
    if (v3 < v4 + *a3)
    {
      uint64_t v5 = *(void *)(result[4] + 8LL);
      if (v4 < *(void *)(v5 + 24))
      {
        *(void *)(v5 + 24) = v4;
        *(void *)(*(void *)(result[5] + 8LL) + 24LL) = a3;
      }
    }
  }

  return result;
}

uint64_t sub_10001C43C(uint64_t a1, uint64_t a2, __int16 a3, char *a4, char *a5)
{
  LOWORD(v18) = a3;
  uint64_t v10 = _os_trace_calloc(1LL, 24LL);
  *(_WORD *)uint64_t v10 = a3;
  unint64_t v11 = sub_1000204DC(*(void **)(a1 + 24), a4);
  *(void *)(v10 + 8) = v11;
  if (!v11)
  {
    sub_10001F924((void **)(a1 + 24), a4, *(void *)(a1 + 32));
    size_t v12 = strlen(a4);
    int v13 = *(void **)(a1 + 24);
    *(void *)(a1 + 32) += v12 + 1;
    *(void *)(v10 + 8) = sub_1000204DC(v13, a4);
  }

  uint64_t v14 = sub_1000204DC(*(void **)(a1 + 24), a5);
  *(void *)(v10 + 16) = v14;
  if (!v14)
  {
    sub_10001F924((void **)(a1 + 24), a5, *(void *)(a1 + 32));
    size_t v15 = strlen(a5);
    uint64_t v16 = *(void **)(a1 + 24);
    *(void *)(a1 + 32) += v15 + 1;
    *(void *)(v10 + 16) = sub_1000204DC(v16, a5);
  }

  uint64_t result = sub_100020D28(*(unsigned int **)(a2 + 64), &v18, v10);
  ++*(void *)(a1 + 56);
  return result;
}

uint64_t sub_10001C57C(uint64_t a1, uint64_t a2, __int16 a3, char *a4)
{
  __int16 v8 = a3;
  uint64_t result = sub_100020C34(*(void *)(a2 + 64), (uint64_t)&v8);
  if (!result) {
    return sub_10001C43C(a1, a2, v8, a4 + 2, &a4[*a4 + 2]);
  }
  return result;
}

uint64_t sub_10001C60C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void **)(a1 + 40);
  uint64_t v5 = sub_10001F730(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5) {
    return (uint64_t)v5;
  }
  uint64_t v6 = _os_trace_calloc(1LL, 72LL);
  uint64_t v5 = (void *)v6;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
  __int128 v7 = *(_OWORD *)(a2 + 16);
  __int128 v8 = *(_OWORD *)(a2 + 32);
  __int128 v9 = *(_OWORD *)(a2 + 48);
  *(void *)(v6 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  *(_OWORD *)(v6 + 16) = v7;
  uint64_t v10 = *v4;
  if (*v4) {
    LOWORD(v1unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = v10[12];
  }
  *(_WORD *)uint64_t v6 = (_WORD)v10;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 24);
  }
  else {
    uint64_t v12 = 0LL;
  }
  sub_10001ECF8((float *)v11, v5 + 3, v12);
  if (!uuid_is_null((const unsigned __int8 *)v5 + 40))
  {
    uint64_t v13 = *(void *)(a1 + 16);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 24);
    }
    else {
      uint64_t v14 = 0LL;
    }
    sub_10001ECF8((float *)v13, v5 + 5, v14);
  }

  uint64_t v15 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v15 = 16LL;
  *(_BYTE *)(v15 + 8) = 2;
  *(void *)(v15 + 16) = _os_trace_calloc(16LL, 8LL);
  void v5[7] = v15;
  uint64_t v16 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v16 = 16LL;
  *(_BYTE *)(v16 + 8) = 1;
  *(void *)(v16 + 16) = _os_trace_calloc(16LL, 8LL);
  v5[8] = v16;
  uint64_t v18 = _os_assert_log(0LL);
  uint64_t result = _os_crash(v18);
  __break(1u);
  return result;
}

void *sub_10001C774(uint64_t a1)
{
  uint64_t v2 = (void *)_os_trace_calloc(1LL, 56LL);
  v2[2] = -1LL;
  uint64_t v3 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v3 = 16LL;
  *(_BYTE *)(v3 + 8) = 1;
  *(void *)(v3 + 16) = _os_trace_calloc(16LL, 8LL);
  v2[6] = v3;
  uint64_t v4 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v4 = 16LL;
  *(_BYTE *)(v4 + 8) = 1;
  *(void *)(v4 + 16) = _os_trace_calloc(16LL, 8LL);
  void v2[5] = v4;
  uint64_t v5 = *(void **)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  *uint64_t v2 = 0LL;
  v2[1] = v5;
  *uint64_t v5 = v2;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 8unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = v6 + 1;
  return v2;
}

void *sub_10001C834(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t result = **(void ***)(*(void *)(a1 + 72) + 8LL);
  }
  else {
    uint64_t result = sub_10001C774(a1);
  }
  if (result[2] > a2) {
    result[2] = a2;
  }
  if (result[3] < a2) {
    result[3] = a2;
  }
  return result;
}

uint64_t sub_10001C88C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t v4 = **(void ***)(*(void *)(a1 + 72) + 8LL);
  }
  else {
    uint64_t v4 = sub_10001C774(a1);
  }
  if (sub_10001F730(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16))) {
    return sub_100020D28((unsigned int *)v4[6], (void *)a2, 0LL);
  }
  uint64_t v6 = _os_assert_log(0LL);
  uint64_t result = _os_crash(v6);
  __break(1u);
  return result;
}

uint64_t sub_10001C904(uint64_t a1, char *a2)
{
  uint64_t v4 = (unsigned __int8 *)(a2 + 2);
  __int16 v5 = (unsigned __int16)sub_100020340(*(void **)(a1 + 24), a2 + 2);
  sub_10001C960(a1, v5);
  __int16 v6 = (unsigned __int16)sub_100020340(*(void **)(a1 + 24), (char *)&v4[*a2]);
  return sub_10001C960(a1, v6);
}

uint64_t sub_10001C960(uint64_t a1, __int16 a2)
{
  LOWORD(v4) = a2;
  if (*(void *)(a1 + 80)) {
    uint64_t v2 = **(void ***)(*(void *)(a1 + 72) + 8LL);
  }
  else {
    uint64_t v2 = sub_10001C774(a1);
  }
  return sub_100020D28((unsigned int *)v2[5], &v4, 0LL);
}

BOOL sub_10001C9D4( unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    BOOL v10 = 0;
    for (i = 0LL; i != a4; BOOL v10 = i >= a4)
    {
      unint64_t v12 = *a1;
      if (a2)
      {
        if (a2 < v12 || a2 - v12 < a3) {
          break;
        }
      }

      *a1 = v12 + a3;
      if (!v12) {
        break;
      }
      if (((*(uint64_t (**)(uint64_t, unint64_t, unint64_t, unint64_t *))(a5 + 16))( a5,  i,  v12,  a1) & 1) == 0) {
        break;
      }
      ++i;
    }
  }

  else
  {
    return 1;
  }

  return v10;
}

BOOL sub_10001CA7C(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (unint64_t *)*a1;
  if ((!a2 || (a2 >= (unint64_t)v4 ? (BOOL v5 = a2 - (unint64_t)v4 >= 8) : (BOOL v5 = 0), v5))
    && (*a1 = (unint64_t)(v4 + 1), v4))
  {
    return sub_10001C9D4(a1, a2, a3, *v4, a4);
  }

  else
  {
    return 0LL;
  }

void *sub_10001CAB0()
{
  uint64_t v0 = (void *)_os_trace_calloc(1LL, 88LL);
  v0[8] = 0LL;
  v0[9] = v0 + 8;
  v0[1] = -1LL;
  id v1 = operator new(0x28uLL);
  *id v1 = 0u;
  v1[1] = 0u;
  *((_DWORD *)v1 + 8) = 1065353216;
  v0[2] = v1;
  return v0;
}

void sub_10001CB0C(uint64_t a1)
{
  *(void *)(a1 + 32) = 0LL;
  sub_10001F838(*(void **)(a1 + 40), (uint64_t (*)(void))sub_10001CBA0);
  uint64_t v2 = *(unsigned int ***)(a1 + 64);
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  if (v2)
  {
    do
    {
      uint64_t v3 = *v2;
      sub_100020B84(v2[6], 0LL);
      sub_100020B84(v2[5], 0LL);
      free(v2);
      uint64_t v2 = (unsigned int **)v3;
    }

    while (v3);
  }

  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 8unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = 0LL;
  *(void *)(a1 + 8) = -1LL;
}

void sub_10001CBA0(unsigned int **a1)
{
}

void sub_10001CBE0(uint64_t a1)
{
  uint64_t v2 = *(void ****)(a1 + 24);
  sub_100020578((uint64_t)v2);
  if (v2)
  {
    sub_1000205D0(v2[2]);
    uint64_t v3 = *v2;
    *uint64_t v2 = 0LL;
    if (v3) {
      operator delete(v3);
    }
    operator delete(v2);
  }

  sub_10001F8C8(*(void ***)(a1 + 40), 0LL);
  free((void *)a1);
}

uint64_t sub_10001CC48(uint64_t a1)
{
  if (*(_DWORD *)a1 != 24587) {
    return 0LL;
  }
  uint64_t v2 = _os_trace_calloc(1LL, 88LL);
  *(void *)(v2 + 64) = 0LL;
  *(void *)(v2 + 72) = v2 + 64;
  *(void *)(v2 + 8) = -1LL;
  uint64_t v3 = operator new(0x28uLL);
  *uint64_t v3 = 0u;
  v3[1] = 0u;
  *((_DWORD *)v3 + 8) = 1065353216;
  *(void *)(v2 + 16) = v3;
  uint64_t v32 = 0LL;
  int v4 = *(_DWORD *)a1;
  if (*(int *)a1 > 7679)
  {
    switch(v4)
    {
      case 24577:
      case 24578:
      case 24579:
      case 24580:
        if (!*(_DWORD *)(a1 + 4)) {
          goto LABEL_19;
        }
        goto LABEL_31;
      case 24581:
      case 24582:
      case 24583:
      case 24584:
      case 24585:
      case 24586:
      case 24590:
      case 24591:
        goto LABEL_31;
      case 24587:
        goto LABEL_31;
      case 24588:
      case 24592:
        goto LABEL_19;
      case 24589:
        goto LABEL_19;
      default:
        if (v4 != 7680 && v4 != 0x2000) {
          goto LABEL_31;
        }
        goto LABEL_19;
    }
  }

  if (v4 > 7167)
  {
    if (v4 == 7168) {
      goto LABEL_19;
    }
    int v5 = 7424;
  }

  else
  {
    if (v4 == 4096) {
      goto LABEL_19;
    }
    int v5 = 6912;
  }

  if (v4 != v5) {
    goto LABEL_31;
  }
LABEL_19:
  int v6 = *(_DWORD *)(a1 + 4);
  if (v6 == 17)
  {
    *(_WORD *)uint64_t v2 = 17;
    *(void *)(v2 + 8) = *(void *)(a1 + 32);
    uint64_t v32 = (char *)(a1 + 40);
    unint64_t v7 = *(unsigned __int16 *)(a1 + 16);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 18);
    unint64_t v9 = *(unsigned __int16 *)(a1 + 22);
    if (*(void *)(a1 + 8) < v9) {
      goto LABEL_31;
    }
    BOOL v10 = (char *)(a1 + 40 + v7);
    int v33 = _NSConcreteStackBlock;
    uint64_t v34 = 0x40000000LL;
    uint64_t v35 = sub_10001D1A8;
    __int16 v36 = &unk_10002A110;
    uint64_t v37 = v2;
    LOBYTE(v38) = 0;
  }

  else
  {
    *(_WORD *)uint64_t v2 = v6;
    *(void *)(v2 + 8) = -1LL;
    uint64_t v11 = a1 + 24;
    uint64_t v32 = (char *)(a1 + 24);
    uint64_t v12 = *(unsigned __int16 *)(a1 + 16);
    unsigned int v13 = *(unsigned __int16 *)(a1 + 18);
    unsigned int v14 = *(unsigned __int16 *)(a1 + 20);
    if (v13 >= v14) {
      goto LABEL_31;
    }
    unint64_t v15 = *(unsigned __int16 *)(a1 + 22);
    if (*(void *)(a1 + 8) <= v15) {
      goto LABEL_31;
    }
    BOOL v10 = (char *)(v11 + v12);
    int v33 = _NSConcreteStackBlock;
    uint64_t v34 = 0x40000000LL;
    uint64_t v35 = sub_10001D200;
    __int16 v36 = &unk_10002A130;
    uint64_t v37 = v2;
    LOBYTE(v38) = 0;
  }

  if (v32 != v10) {
    goto LABEL_31;
  }
  uint64_t v17 = a1 + *(unsigned __int16 *)(a1 + 18);
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    uint64_t v18 = (char *)(v17 + 40);
    if ((unint64_t)v10 < v17 + 40)
    {
      do
      {
        size_t v19 = strlen(v10) + 1;
        BOOL v10 = &v32[v19];
        uint64_t v32 = v10;
      }

      while (v10 < v18);
    }
  }

  else
  {
    uint64_t v18 = (char *)(v17 + 24);
    BOOL v20 = v17 + 24 >= (unint64_t)v10;
    unint64_t v21 = v17 + 24 - (void)v10;
    if (!v20 || v21 < 8) {
      goto LABEL_31;
    }
    unint64_t v23 = (unint64_t)(v10 + 8);
    uint64_t v22 = *(void *)v10;
    uint64_t v32 = v10 + 8;
    if (v22)
    {
      uint64_t v24 = 0LL;
      while ((unint64_t)v18 >= v23)
      {
        uint64_t v25 = (char *)(v23 + 2);
        uint64_t v32 = (char *)(v23 + 2);
        if (!v23) {
          break;
        }
        if (v18 < v25) {
          break;
        }
        unint64_t v26 = *(unsigned __int8 *)(v23 + 1) + (unint64_t)*(unsigned __int8 *)v23;
        if (v18 - v25 < v26) {
          break;
        }
        uint64_t v32 = &v25[v26];
        sub_10001F924((void **)(v2 + 24), v25, *(void *)(v2 + 32));
        sub_10001C960(v2, *(_WORD *)(v2 + 32));
        uint64_t v27 = *(void *)(v2 + 32) + *(unsigned __int8 *)v23;
        *(void *)(v2 + 32) = v27;
        sub_10001F924((void **)(v2 + 24), (char *)(v23 + *(unsigned __int8 *)v23 + 2), v27);
        sub_10001C960(v2, *(_WORD *)(v2 + 32));
        *(void *)(v2 + 32) += *(unsigned __int8 *)(v23 + 1);
        unint64_t v23 = (unint64_t)&v32[v26 & 1];
        uint64_t v32 = (char *)v23;
      }

      goto LABEL_31;
    }

LABEL_51:
    BOOL v10 = (char *)((v23 & 7) != 0 ? (v23 & 0xFFFFFFFFFFFFFFF8LL) + 8 : v23);
    uint64_t v32 = v10;
  }

  if (v10 != v18) {
    goto LABEL_31;
  }
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    uint64_t v28 = *(unsigned __int16 *)(a1 + 22);
    goto LABEL_61;
  }

  unint64_t v29 = a1 + 24 + *(unsigned __int16 *)(a1 + 20);
  uint64_t v28 = *(unsigned __int16 *)(a1 + 22);
  if (*(_DWORD *)(a1 + 4) != 17)
  {
    unint64_t v30 = a1 + 24 + v28;
    int v33 = _NSConcreteStackBlock;
    uint64_t v34 = 0x40000000LL;
    uint64_t v35 = sub_10001D58C;
    __int16 v36 = &unk_10002A1B0;
    uint64_t v37 = v2;
    uint64_t v38 = a1;
    char v40 = 0;
    unint64_t v39 = v30;
LABEL_31:
    sub_10001CBE0(v2);
    return 0LL;
  }

LABEL_61:
  unint64_t v30 = a1 + v28 + 40;
  unint64_t v31 = *(unsigned __int16 *)(a1 + 20);
  int v33 = _NSConcreteStackBlock;
  uint64_t v34 = 0x40000000LL;
  uint64_t v35 = sub_10001D258;
  __int16 v36 = &unk_10002A190;
  uint64_t v37 = v2;
  uint64_t v38 = a1;
  char v40 = 0;
  unint64_t v39 = v30;
LABEL_62:
  return v2;
}

  uint64_t v37 = *v23;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 0x40000000LL;
  uint64_t v41 = sub_100022534;
  unsigned int v42 = &unk_10002A468;
  unint64_t v43 = v23;
  for (uint64_t j = (__n128 *)v37[2]; j; uint64_t j = (__n128 *)j->n128_u64[0])
    v41((uint64_t)v40, j + 1, j[2].n128_i64[0]);
  sub_100021C8C(a1);
  return v23;
}

uint64_t sub_10001D1A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    sub_10001E2EC(a2, (unsigned __int8 *)a3);
  }
  return 1LL;
}

uint64_t sub_10001D200(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    sub_10001E2EC(a2, (unsigned __int8 *)a3);
  }
  return 1LL;
}

uint64_t sub_10001D258(uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned __int16 **a4)
{
  if (sub_10001F730(*(void **)(*(void *)(a1 + 32) + 40LL), *(void *)(a3 + 8), *(_DWORD *)(a3 + 16))) {
    return 1LL;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(_DWORD *)(v9 + 4);
  uint64_t v11 = v9 + 40;
  uint64_t v12 = v9 + 32;
  BOOL v13 = v10 == 17;
  if (v10 == 17) {
    uint64_t v14 = v9 + 40;
  }
  else {
    uint64_t v14 = v9 + 32;
  }
  uint64_t v15 = *(unsigned __int16 *)(v9 + 16);
  uint64_t v16 = v11 + v15;
  uint64_t v17 = v12 + v15;
  if (v13) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v17;
  }
  uint64_t v19 = _os_trace_calloc(1LL, 72LL);
  BOOL v20 = (unsigned int **)v19;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)a3;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(a3 + 20);
  *(void *)(v19 + 8) = *(void *)(a3 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(a3 + 16);
  *(_DWORD *)(v19 + 2unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = *(_DWORD *)(a3 + 24);
  uint64_t v21 = *(unsigned __int16 *)(a3 + 4);
  unint64_t v22 = v18 - v14;
  if (v22 >= 16 * v21 && v22 - 16 * v21 > 0xF) {
    *(_OWORD *)(v19 + 24) = *(_OWORD *)(v14 + 16 * v21);
  }
  else {
    _os_assumes_log(0LL);
  }
  uint64_t v24 = *(unsigned __int16 *)(a3 + 6);
  if (v24 != 0xFFFF)
  {
    if (v22 >= 16 * v24 && v22 - 16 * v24 > 0xF) {
      *(_OWORD *)(v20 + 5) = *(_OWORD *)(v14 + 16 * v24);
    }
    else {
      _os_assumes_log(0LL);
    }
  }

  uint64_t v26 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v26 = 16LL;
  *(_BYTE *)(v26 + 8) = 2;
  *(void *)(v26 + 16) = _os_trace_calloc(16LL, 8LL);
  v20[7] = (unsigned int *)v26;
  uint64_t v27 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v27 = 16LL;
  *(_BYTE *)(v27 + 8) = 1;
  *(void *)(v27 + 16) = _os_trace_calloc(16LL, 8LL);
  v20[8] = (unsigned int *)v27;
  int v28 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    printf( "[%03u]\n\t%10s : %llu@%u\n\t%10s : %d\n\t%10s : %u\n\t%10s : %u\n\t%10s : %x\n",  a2,  "proc id",  v20[1],  *((_DWORD *)v20 + 4),  "pid",  *((_DWORD *)v20 + 1),  "euid",  *((_DWORD *)v20 + 5),  "index",  *(unsigned __int16 *)v20,  "flags",  *((unsigned __int16 *)v20 + 1));
    int v28 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v29;
      *(_OWORD *)&out[16] = v29;
      uuid_unparse((const unsigned __int8 *)v20 + 24, out);
      if (*(_BYTE *)(a1 + 56)) {
        printf("\t%10s : %s\n", "main uuid", out);
      }
      out[0] = 0;
      int v28 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        int v28 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }

  if (sub_10001DD28( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  (uint64_t)v20,  v28 != 0,  *(void *)(a1 + 40))
    && sub_10001DF44( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  (uint64_t)v20,  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 40)))
  {
    uint64_t v30 = _os_assert_log(0LL);
    _os_crash(v30);
    __break(1u);
  }

  sub_10001CBA0(v20);
  return 0LL;
}

uint64_t sub_10001D58C(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40LL);
  if (v8)
  {
    uint64_t v9 = (void *)(v8 + 16);
    while (1)
    {
      uint64_t v9 = (void *)*v9;
      if (!v9) {
        break;
      }
      if (v9[2] == *((void *)a3 + 1))
      {
        if (v9[4]) {
          return 1LL;
        }
        break;
      }
    }
  }

  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = *(_DWORD *)(v10 + 4);
  uint64_t v12 = v10 + 40;
  uint64_t v13 = v10 + 32;
  BOOL v14 = v11 == 17;
  if (v11 == 17) {
    uint64_t v15 = v10 + 40;
  }
  else {
    uint64_t v15 = v10 + 32;
  }
  uint64_t v16 = *(unsigned __int16 *)(v10 + 16);
  uint64_t v17 = v12 + v16;
  uint64_t v18 = v13 + v16;
  if (v14) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = _os_trace_calloc(1LL, 72LL);
  uint64_t v21 = v20;
  uint64_t v22 = *a3;
  unint64_t v23 = v19 - v15;
  if (v23 >= 16 * v22 && v23 - 16 * v22 > 0xF) {
    *(_OWORD *)(v20 + 24) = *(_OWORD *)(v15 + 16 * v22);
  }
  else {
    _os_assumes_log(0LL);
  }
  uint64_t v25 = a3[1];
  if (v23 >= 16 * v25 && v23 - 16 * v25 > 0xF) {
    *(_OWORD *)(v21 + 4unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = *(_OWORD *)(v15 + 16 * v25);
  }
  else {
    _os_assumes_log(0LL);
  }
  *(_DWORD *)(v21 + 4) = *((_DWORD *)a3 + 1);
  *(void *)(v21 + 8) = *((void *)a3 + 1);
  if (a2 >= 0x10000) {
    _os_assumes_log(0LL);
  }
  *(_WORD *)uint64_t v21 = a2;
  *(_WORD *)(v21 + 2) = 0x8000;
  uint64_t v27 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v27 = 16LL;
  *(_BYTE *)(v27 + 8) = 2;
  *(void *)(v27 + 16) = _os_trace_calloc(16LL, 8LL);
  *(void *)(v21 + 56) = v27;
  uint64_t v28 = _os_trace_calloc(1LL, 24LL);
  *(void *)uint64_t v28 = 16LL;
  *(_BYTE *)(v28 + 8) = 1;
  *(void *)(v28 + 16) = _os_trace_calloc(16LL, 8LL);
  *(void *)(v21 + 64) = v28;
  int v29 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    printf( "[%03u]\n\t%10s : %llu\n\t%10s : %u\n",  (unsigned __int16)a2,  "proc id",  *(void *)(v21 + 8),  "pid",  *(_DWORD *)(v21 + 4));
    int v29 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v30;
      *(_OWORD *)&out[16] = v30;
      uuid_unparse((const unsigned __int8 *)(v21 + 24), out);
      if (*(_BYTE *)(a1 + 56)) {
        printf("\t%10s : %s\n", "main uuid", out);
      }
      uuid_unparse((const unsigned __int8 *)(v21 + 40), out);
      int v29 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        int v29 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }

  if ((sub_10001DD28(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), v21, v29 != 0, *(void *)(a1 + 40)) & 1) != 0
    && (sub_10001DF44( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  v21,  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 40)) & 1) != 0)
  {
    return 1LL;
  }

  else
  {
    sub_10001CBA0((unsigned int **)v21);
    return 0LL;
  }

BOOL sub_10001D88C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 8) + a3 + 16;
  if (*(_DWORD *)(a3 + 4) != 17)
  {
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 0x40000000LL;
    int v11 = sub_10001DC4C;
    uint64_t v12 = &unk_10002A1F0;
    char v15 = 0;
    uint64_t v13 = a2;
    unint64_t v14 = v4;
    BOOL v8 = sub_10001CA7C(a1, v4, 0x20uLL, (uint64_t)&v9);
    BOOL result = 0LL;
    if (!v8) {
      return result;
    }
    return *a1 <= v4;
  }

  unint64_t v5 = *(unsigned __int16 *)(a3 + 24);
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 0x40000000LL;
  int v11 = sub_10001D9B0;
  uint64_t v12 = &unk_10002A1D0;
  char v15 = 0;
  uint64_t v13 = a2;
  unint64_t v14 = v4;
  BOOL v6 = sub_10001C9D4(a1, v4, 0x18uLL, v5, (uint64_t)&v9);
  BOOL result = 0LL;
  if (v6) {
    return *a1 <= v4;
  }
  return result;
}

uint64_t sub_10001D9B0(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  BOOL v8 = sub_10001C774(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  v8[2] = *a3;
  void v8[3] = v10;
  int v11 = *((_DWORD *)a3 + 4);
  int v12 = *((_DWORD *)a3 + 5);
  *((_DWORD *)v8 + 8) = v11;
  *((_DWORD *)v8 + 9) = v12;
  uint64_t v13 = (unsigned __int16 *)(a3 + 3);
  *a4 = (unint64_t)(a3 + 3);
  if (*(_BYTE *)(a1 + 48))
  {
    printf( "[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n",  a2,  "startts",  v9,  "endts",  v10,  "uncomp sz",  v11,  "comp algo",  v12);
    BOOL v14 = *(_BYTE *)(a1 + 48) != 0;
    uint64_t v13 = (unsigned __int16 *)*a4;
  }

  else
  {
    BOOL v14 = 0;
  }

  unint64_t v15 = *(void *)(a1 + 40);
  if (v15)
  {
    uint64_t result = 0LL;
  }

  *a4 = (unint64_t)(v13 + 2);
  if (!v13) {
    return 0LL;
  }
  if (v14) {
    printf("\t\t%10s : %u\n\t\t%10s : ", "procinfos", *(_DWORD *)v13, "indexes");
  }
  if (*(_DWORD *)v13)
  {
    int v17 = 0;
    do
    {
      uint64_t v18 = (unsigned __int16 *)*a4;
      if (v15)
      {
      }

      *a4 = (unint64_t)(v18 + 1);
      if (!v18) {
        return 0LL;
      }
      if (v8) {
        sub_100020D28((unsigned int *)v8[6], v18, 0LL);
      }
      if (v14) {
        printf("%u,", *v18);
      }
    }

    while (++v17 < *(_DWORD *)v13);
  }

  if (v14) {
    putchar(10);
  }
  unint64_t v20 = *(void *)(a1 + 40);
  int v21 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v22 = (unsigned __int16 *)*a4;
  if (v20)
  {
    uint64_t result = 0LL;
  }

  *a4 = (unint64_t)(v22 + 2);
  if (!v22) {
    return 0LL;
  }
  if (v21) {
    printf("\t\t%10s : %u\n\t\t%10s : ", "subcats", *(_DWORD *)v22, "offsets");
  }
  if (*(_DWORD *)v22)
  {
    int v23 = 0;
    do
    {
      uint64_t v24 = (unsigned __int16 *)*a4;
      if (v20)
      {
      }

      *a4 = (unint64_t)(v24 + 1);
      if (!v24) {
        return 0LL;
      }
      if (v8) {
        sub_100020D28((unsigned int *)v8[5], v24, 0LL);
      }
      if (v21) {
        printf("%u,", *v24);
      }
    }

    while (++v23 < *(_DWORD *)v22);
  }

  if (v21) {
    putchar(10);
  }
  unint64_t v26 = *a4;
  if ((*a4 & 7) != 0) {
    unint64_t v26 = (*a4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  *a4 = v26;
  return 1LL;
}

uint64_t sub_10001DC4C(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  BOOL v8 = sub_10001C774(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  v8[2] = *a3;
  void v8[3] = v10;
  if (*(_BYTE *)(a1 + 48)) {
    printf( "[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n",  a2,  "startts",  v9,  "endts",  v10,  "log cnt",  *((_DWORD *)a3 + 4),  "others cnt",  *((_DWORD *)a3 + 5));
  }
  unint64_t v11 = (unint64_t)a3 + 26;
  *a4 = (unint64_t)a3 + 26;
  unint64_t v12 = *(void *)(a1 + 40);
  unint64_t v13 = *((unsigned __int16 *)a3 + 12);
  if (v12)
  {
    BOOL v15 = v12 >= v11;
    unint64_t v14 = v12 - v11;
    BOOL v15 = v15 && v14 >= v13;
    if (!v15) {
      return 0LL;
    }
  }

  unint64_t v17 = v11 + v13;
  if ((v17 & 7) != 0) {
    unint64_t v17 = (v17 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  *a4 = v17;
  return 1LL;
}

uint64_t sub_10001DD28(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  unint64_t v11 = (void *)*a1;
  if (a2)
  {
  }

  *a1 = v11 + 1;
  if (!v11) {
    return 0LL;
  }
  int v13 = *(_DWORD *)(a6 + 4);
  BOOL v14 = v13 == 17;
  if (v13 == 17) {
    uint64_t v15 = a6 + 40;
  }
  else {
    uint64_t v15 = a6 + 32;
  }
  uint64_t v16 = *(unsigned __int16 *)(a6 + 16);
  uint64_t v17 = a6 + 40 + v16;
  uint64_t v18 = a6 + 32 + v16;
  if (v14) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  if (a5) {
    printf("\t%10s : %llu\n", "uuidinfos", *v11);
  }
  if (*v11)
  {
    uint64_t v20 = 0LL;
    unint64_t v29 = v19 - v15;
    while (1)
    {
      int v21 = (void *)*a1;
      if (a2)
      {
      }

      *a1 = v21 + 2;
      if (!v21) {
        break;
      }
      uint64_t v30 = v21[1] >> 16;
      if (!sub_100020C34(*(void *)(a4 + 56), (uint64_t)&v30))
      {
        uint64_t v23 = _os_trace_calloc(1LL, 32LL);
        uint64_t v24 = (unsigned __int8 *)v23;
        *(void *)uint64_t v23 = v21[1] >> 16;
        *(void *)(v23 + 8) = *v21;
        unint64_t v25 = 16LL * (unsigned __int16)*((_DWORD *)v21 + 2);
        if (v29 >= v25 && v29 - v25 > 0xF) {
          *(_OWORD *)(v23 + 16) = *(_OWORD *)(v15 + 16LL * (unsigned __int16)*((_DWORD *)v21 + 2));
        }
        else {
          _os_assumes_log(0LL);
        }
        sub_100020D28(*(unsigned int **)(a4 + 56), v24, (uint64_t)v24);
        ++*(void *)(a3 + 48);
        if (a5)
        {
          *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&__int128 v27 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uuid_string_t out = v27;
          *(_OWORD *)&out[16] = v27;
          uuid_unparse(v24 + 16, out);
          printf( "\t\t<%10s : 0x%llx, %10s : %10llu, %10s : %s>\n",  "load addr",  *(void *)v24,  "size",  *((void *)v24 + 1),  "uuid",  out);
        }
      }
    }

    return 0LL;
  }

  return 1LL;
}

uint64_t sub_10001DF44( unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v7 = a5;
  unint64_t v11 = a1;
  unint64_t v12 = *a1;
  if (*(_DWORD *)(a6 + 4) != 17)
  {
    if (!a2 || (a2 >= (unint64_t)v12 ? (BOOL v21 = a2 - (unint64_t)v12 >= 8) : (BOOL v21 = 0), v21))
    {
      *a1 = v12 + 4;
      if (v12)
      {
        uint64_t v22 = *(unsigned __int16 *)(a6 + 16);
        uint64_t v23 = *(unsigned __int16 *)(a6 + 18);
        if (a5) {
          printf("\t%10s : %llu\n", "subsystems", *(void *)v12);
        }
        if (*(void *)v12)
        {
          uint64_t v24 = 0LL;
          uint64_t v38 = a6 + 24 + v22 + 8;
          unint64_t v25 = v23 - (v22 + 8);
          int v36 = v7;
          while (1)
          {
            unint64_t v26 = *v11;
            if (a2)
            {
            }

            *unint64_t v11 = v26 + 2;
            if (!v26) {
              return 0LL;
            }
            if (v7) {
              printf("\t\t<%10s : %3u, %10s : %5hu>\n", "id", *v26, "offset", v26[1]);
            }
            unint64_t v28 = v26[1];
            if (v25 < v28)
            {
LABEL_59:
              _os_assumes_log(0LL);
              return 0LL;
            }

            if (!sub_100020C34(*(void *)(a4 + 64), (uint64_t)v26))
            {
              unint64_t v29 = v25;
              uint64_t v30 = (char *)(v38 + v28);
              unint64_t v31 = (void *)_os_trace_calloc(1LL, 24LL);
              *(_WORD *)unint64_t v31 = *v26;
              v31[1] = sub_1000204DC(*(void **)(a3 + 24), v30 + 2);
              uint64_t v32 = sub_1000204DC(*(void **)(a3 + 24), &v30[*v30 + 2]);
              void v31[2] = v32;
              if (!v32 || !v31[1]) {
                _os_assumes_log(0LL);
              }
              sub_100020D28(*(unsigned int **)(a4 + 64), v31, (uint64_t)v31);
              ++*(void *)(a3 + 56);
              unint64_t v25 = v29;
              int v7 = v36;
            }
          }
        }

        goto LABEL_56;
      }
    }

    return 0LL;
  }

  if (a2)
  {
  }

  *a1 = v12 + 4;
  if (!v12) {
    return 0LL;
  }
  uint64_t v14 = *(unsigned __int16 *)(a6 + 16);
  uint64_t v15 = *(unsigned __int16 *)(a6 + 18);
  if (a5) {
    printf("\t%10s : %llu\n", "subsystems", *(void *)v12);
  }
  if (*(void *)v12)
  {
    uint64_t v16 = 0LL;
    uint64_t v37 = a6 + 40 + v14;
    unint64_t v17 = v15 - v14;
    uint64_t v35 = v11;
    do
    {
      uint64_t v18 = *v11;
      if (a2)
      {
      }

      *unint64_t v11 = v18 + 3;
      if (!v18) {
        return 0LL;
      }
      if (v7) {
        printf("\t\t<%10s : %3u, %10s : %5hu, %10s : %5hu>\n", "id", *v18, "subsystem", v18[1], "category", v18[2]);
      }
      if (v17 < v18[1] || v17 < v18[2]) {
        goto LABEL_59;
      }
      if (!sub_100020C34(*(void *)(a4 + 64), (uint64_t)v18))
      {
        uint64_t v20 = (void *)_os_trace_calloc(1LL, 24LL);
        *(_WORD *)uint64_t v20 = *v18;
        v20[1] = sub_1000204DC(*(void **)(a3 + 24), (char *)(v37 + v18[1]));
        unint64_t v11 = v35;
        void v20[2] = sub_1000204DC(*(void **)(a3 + 24), (char *)(v37 + v18[2]));
        sub_100020D28(*(unsigned int **)(a4 + 64), v20, (uint64_t)v20);
        ++*(void *)(a3 + 56);
      }
    }

    while ((unint64_t)++v16 < *(void *)v12);
  }

BOOL sub_10001E2E4(id a1, unint64_t a2, const void *a3, char **a4)
{
  return 1;
}

uint64_t sub_10001E2EC(uint64_t a1, unsigned __int8 *uu)
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse(uu, out);
  return printf("[%03llu] %s\n", a1, out);
}

uint64_t sub_10001E370(void *a1)
{
  unint64_t v1 = a1[2];
  if (v1) {
    unint64_t v1 = *(void *)(v1 + 24);
  }
  uint64_t v2 = 16 * v1 + 40;
  if (v1 >> 60 || 16 * v1 >= 0xFFFFFFFFFFFFFFD8LL)
  {
    uint64_t v27 = _os_assert_log(1LL);
    _os_crash(v27);
    __break(1u);
    goto LABEL_36;
  }

  uint64_t v3 = a1[4];
  unint64_t v4 = (v3 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  BOOL v5 = __CFADD__(v2, v4);
  unint64_t v6 = v2 + v4;
  if (v5)
  {
LABEL_36:
    uint64_t v28 = _os_assert_log(1LL);
    _os_crash(v28);
    __break(1u);
    goto LABEL_37;
  }

  unint64_t v7 = a1[6];
  if (v7 >> 60)
  {
LABEL_37:
    uint64_t v29 = _os_assert_log(1LL);
    _os_crash(v29);
    __break(1u);
    goto LABEL_38;
  }

  unint64_t v8 = a1[7];
  if (!is_mul_ok(v8, 6uLL))
  {
LABEL_38:
    uint64_t v30 = _os_assert_log(1LL);
    _os_crash(v30);
    __break(1u);
LABEL_39:
    uint64_t v31 = _os_assert_log(1LL);
    _os_crash(v31);
    __break(1u);
    goto LABEL_40;
  }

  uint64_t v9 = a1[5];
  if (v9) {
    unint64_t v10 = *(void *)(v9 + 24);
  }
  else {
    unint64_t v10 = 0LL;
  }
  if (!is_mul_ok(v10, 0x38uLL)) {
    goto LABEL_39;
  }
  uint64_t v11 = 16 * v7;
  uint64_t v12 = 56 * v10;
  BOOL v5 = __CFADD__(v12, v11);
  uint64_t v13 = v12 + v11;
  if (v5)
  {
LABEL_40:
    uint64_t v32 = _os_assert_log(1LL);
    _os_crash(v32);
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v14 = 6 * v8;
  BOOL v5 = __CFADD__(v13, v14);
  unint64_t v15 = v13 + v14;
  if (v5)
  {
LABEL_41:
    uint64_t v33 = _os_assert_log(1LL);
    _os_crash(v33);
    __break(1u);
LABEL_42:
    uint64_t v34 = _os_assert_log(1LL);
    _os_crash(v34);
    __break(1u);
LABEL_43:
    uint64_t v35 = _os_assert_log(1LL);
    _os_crash(v35);
    __break(1u);
    goto LABEL_44;
  }

  if ((v15 & 6) != 0) {
    unint64_t v15 = (v15 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  BOOL v5 = __CFADD__(v15, v6);
  unint64_t v16 = v15 + v6;
  if (v5) {
    goto LABEL_42;
  }
  if (v9) {
    uint64_t v9 = *(void *)(v9 + 24);
  }
  unint64_t v17 = 2 * v9 + 32;
  uint64_t v18 = 2 * v9 + 40;
  if (v17 >= 0xFFFFFFFFFFFFFFF8LL)
  {
LABEL_44:
    uint64_t v36 = _os_assert_log(1LL);
    _os_crash(v36);
    __break(1u);
LABEL_45:
    uint64_t v37 = _os_assert_log(1LL);
    _os_crash(v37);
    __break(1u);
LABEL_46:
    uint64_t v38 = _os_assert_log(1LL);
    uint64_t result = _os_crash(v38);
    __break(1u);
    return result;
  }

  BOOL v5 = __CFADD__(v18, 2 * v3);
  unint64_t v19 = v18 + 2 * v3;
  int v20 = v5;
  if (v3 < 0 || v20) {
    goto LABEL_45;
  }
  unint64_t v21 = (v19 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  if ((v19 & 6) == 0) {
    unint64_t v21 = v19;
  }
  unint64_t v22 = a1[10];
  BOOL v23 = !is_mul_ok(v22, v21);
  unint64_t v24 = v22 * v21;
  uint64_t result = v16 + v24;
  BOOL v26 = __CFADD__(v16, v24);
  if (v23 || v26) {
    goto LABEL_46;
  }
  return result;
}

void *sub_10001E55C(void **a1)
{
  unint64_t v2 = sub_10001E370(a1);
  uint64_t v3 = (void *)_os_trace_calloc(1LL, v2);
  unint64_t v4 = v3;
  *uint64_t v3 = 0x110000600BLL;
  v3[1] = 0LL;
  v3[4] = a1[1];
  BOOL v5 = (char *)v3 + v2;
  unint64_t v6 = (char *)(v3 + 5);
  uint64_t v33 = v3 + 5;
  unint64_t v7 = a1[2];
  if (v7) {
    uint64_t v8 = 16LL * v7[3];
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (&v5[-v8] >= v6)
  {
    uint64_t v9 = (char *)(v3 + 2);
    uint64_t v34 = _NSConcreteStackBlock;
    uint64_t v35 = 0x40000000LL;
    uint64_t v36 = sub_10001E914;
    uint64_t v37 = &unk_10002A210;
    uint64_t v38 = &v33;
    unint64_t v10 = (void *)v7[2];
    uint64_t v11 = (char *)(v3 + 5);
    if (v10)
    {
      do
      {
        ((void (*)(void ***, void *, void))v36)(&v34, v10 + 2, v10[4]);
        unint64_t v10 = (void *)*v10;
      }

      while (v10);
      uint64_t v11 = (char *)v33;
    }

    uint64_t v12 = &v11[v8];
    uint64_t v33 = v12;
    *(_WORD *)uint64_t v9 = (_WORD)v12 - (_WORD)v6;
    uint64_t v13 = a1[4];
    if (v5 - v13 >= (unint64_t)v12)
    {
      uint64_t v14 = a1[3];
      uint64_t v34 = _NSConcreteStackBlock;
      uint64_t v35 = 0x40000000LL;
      uint64_t v36 = sub_10001E92C;
      uint64_t v37 = &unk_10002A230;
      uint64_t v38 = a1;
      unint64_t v39 = &v33;
      if (v14)
      {
        unint64_t v15 = (uint64_t *)v14[2];
        if (v15)
        {
          do
          {
            unint64_t v16 = v15 + 2;
            ((void (*)(void ***, void *, uint64_t))v36)(&v34, v16, v15[5]);
            unint64_t v15 = (uint64_t *)*v15;
          }

          while (v15);
          uint64_t v13 = a1[4];
          uint64_t v12 = (char *)v33;
        }
      }

      uint64_t v33 = &v13[(void)v12];
      size_t v17 = ((unint64_t)&v13[(void)v12 + 7] & 0xFFFFFFFFFFFFFFF8LL) - (unint64_t)&v13[(void)v12];
      bzero(&v13[(void)v12], v17);
      uint64_t v18 = (char *)v33 + v17;
      uint64_t v33 = v18;
      uint64_t v19 = v18 - v6;
      *((_WORD *)v4 + 9) = (_WORD)v18 - (_WORD)v6;
      int v20 = a1[5];
      if (v20) {
        __int16 v21 = v20[12];
      }
      else {
        __int16 v21 = 0;
      }
      *((_WORD *)v4 + 1unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = v21;
      uint64_t v34 = _NSConcreteStackBlock;
      uint64_t v35 = 0x40000000LL;
      uint64_t v36 = sub_10001E96C;
      uint64_t v37 = &unk_10002A250;
      uint64_t v38 = a1;
      unint64_t v39 = &v33;
      char v40 = v5;
      if (v20)
      {
        unint64_t v22 = (void *)*((void *)v20 + 2);
        if (v22)
        {
          do
          {
            ((void (*)(void ***, void))v36)(&v34, v22[4]);
            unint64_t v22 = (void *)*v22;
          }

          while (v22);
          uint64_t v18 = (char *)v33;
          uint64_t v19 = (_BYTE *)v33 - v6;
        }
      }

      *((_WORD *)v4 + 11) = v19;
      *((_WORD *)v4 + 12) = 0;
      BOOL v23 = a1[8];
      if (v23)
      {
        do
        {
          int v24 = *((_DWORD *)v23 + 8);
          if (v24)
          {
            *(_OWORD *)uint64_t v18 = *((_OWORD *)v23 + 1);
            *((_DWORD *)v18 + 4) = v24;
            *((_DWORD *)v18 + 5) = *((_DWORD *)v23 + 9);
            unint64_t v25 = v18 + 24;
            uint64_t v33 = v18 + 24;
            if ((unint64_t)(v5 - (v18 + 24)) > 3)
            {
              *((_DWORD *)v18 + 6) = *(_DWORD *)(*((void *)v23 + 6) + 4LL);
              uint64_t v33 = v18 + 28;
              uint64_t v34 = _NSConcreteStackBlock;
              BOOL v26 = (unsigned int *)*((void *)v23 + 6);
              uint64_t v35 = 0x40000000LL;
              uint64_t v36 = sub_10001EB54;
              uint64_t v37 = &unk_10002A2B0;
              uint64_t v38 = &v33;
              sub_100020E74(v26, (uint64_t)&v34);
              unint64_t v25 = (char *)v33;
              if ((unint64_t)(v5 - (_BYTE *)v33) >= 4)
              {
                *(_DWORD *)uint64_t v33 = *(_DWORD *)(*((void *)v23 + 5) + 4LL);
                uint64_t v33 = v25 + 4;
                uint64_t v34 = _NSConcreteStackBlock;
                uint64_t v27 = (unsigned int *)*((void *)v23 + 5);
                uint64_t v35 = 0x40000000LL;
                uint64_t v36 = sub_10001EB6C;
                uint64_t v37 = &unk_10002A2D0;
                uint64_t v38 = &v33;
                sub_100020E74(v27, (uint64_t)&v34);
                unint64_t v25 = (char *)v33;
              }
            }

            ++*((_WORD *)v4 + 12);
            size_t v28 = ((unint64_t)(v25 + 7) & 0xFFFFFFFFFFFFFFF8LL) - (void)v25;
            bzero(v25, v28);
            uint64_t v18 = (char *)v33 + v28;
            uint64_t v33 = (char *)v33 + v28;
          }

          BOOL v23 = *(void **)v23;
        }

        while (v23);
        uint64_t v19 = v18 - v6;
        uint64_t v9 = (char *)(v4 + 2);
      }

      if (v19 >= 0x10000)
      {
        uint64_t v31 = _os_assert_log(0LL);
        _os_crash(v31);
        __break(1u);
      }

      else
      {
        int64_t v29 = v18 - v9;
        v4[1] = v29;
        if (v29 + 16 <= v2) {
          return v4;
        }
      }

      uint64_t v32 = _os_assert_log(0LL);
      _os_crash(v32);
      __break(1u);
    }
  }

  free(v4);
  return 0LL;
}

__n128 sub_10001E914(uint64_t a1, __n128 *a2, unsigned __int16 a3)
{
  __n128 result = *a2;
  *(__n128 *)(**(void **)(a1 + 32) + 16LL * a3) = *a2;
  return result;
}

char *sub_10001E92C(uint64_t a1, const char *a2, unsigned __int16 a3)
{
  uint64_t v4 = _os_assert_log(0LL);
  __n128 result = (char *)_os_crash(v4);
  __break(1u);
  return result;
}

void sub_10001E96C(void *a1, uint64_t a2)
{
  unint64_t v4 = sub_10001F114(*(void **)(a1[4] + 16LL), (void *)(a2 + 24));
  if (v4 >= 0x10000)
  {
    uint64_t v21 = _os_assert_log(0LL);
    _os_crash(v21);
    __break(1u);
    goto LABEL_10;
  }

  __int16 v5 = v4;
  if (!uuid_is_null((const unsigned __int8 *)(a2 + 40)))
  {
    unint64_t v6 = sub_10001F114(*(void **)(a1[4] + 16LL), (void *)(a2 + 40));
    if (v6 < 0x10000) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v22 = _os_assert_log(0LL);
    _os_crash(v22);
    __break(1u);
  }

  LOWORD(v6) = -1;
LABEL_5:
  unint64_t v7 = (uint64_t *)a1[5];
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(a2 + 8);
  int v10 = *(_DWORD *)(a2 + 4);
  int v11 = *(_DWORD *)(a2 + 16);
  unsigned int v12 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)uint64_t v8 = *(_DWORD *)a2;
  *(_WORD *)(v8 + 4) = v5;
  *(_WORD *)(v8 + 6) = v6;
  *(void *)(v8 + 8) = v9;
  *(_DWORD *)(v8 + 16) = v11;
  *(_DWORD *)(v8 + 2unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = v10;
  *(void *)(v8 + 24) = v12;
  *unint64_t v7 = v8 + 32;
  uint64_t v13 = (void **)a1[5];
  uint64_t v14 = *v13;
  if (a1[6] - (void)*v13 > 7uLL)
  {
    unint64_t v15 = (void **)a1[4];
    *uint64_t v14 = *(unsigned int *)(*(void *)(a2 + 56) + 4LL);
    *uint64_t v13 = v14 + 1;
    unint64_t v16 = *(unsigned int **)(a2 + 56);
    BOOL v23 = _NSConcreteStackBlock;
    uint64_t v24 = 0x40000000LL;
    unint64_t v25 = sub_10001EB84;
    BOOL v26 = &unk_10002A270;
    uint64_t v27 = v15;
    size_t v28 = v13;
    sub_100020E74(v16, (uint64_t)&v23);
    uint64_t v13 = (void **)a1[5];
    size_t v17 = *v13;
    if (a1[6] - (void)*v13 >= 8uLL)
    {
      uint64_t v18 = (void **)a1[4];
      void *v17 = *(unsigned int *)(*(void *)(a2 + 64) + 4LL);
      *uint64_t v13 = v17 + 1;
      uint64_t v19 = *(unsigned int **)(a2 + 64);
      BOOL v23 = _NSConcreteStackBlock;
      uint64_t v24 = 0x40000000LL;
      unint64_t v25 = sub_10001EC30;
      BOOL v26 = &unk_10002A290;
      uint64_t v27 = v13;
      size_t v28 = v18;
      sub_100020E74(v19, (uint64_t)&v23);
      uint64_t v13 = (void **)a1[5];
    }
  }

  size_t v20 = (((unint64_t)*v13 + 7) & 0xFFFFFFFFFFFFFFF8LL) - (void)*v13;
  bzero(*v13, v20);
  *(void *)a1[5] += v20;
}

uint64_t sub_10001EB54(uint64_t result, _WORD *a2)
{
  unint64_t v2 = *(_WORD ***)(result + 32);
  uint64_t v3 = *v2;
  *uint64_t v3 = *a2;
  *unint64_t v2 = v3 + 1;
  return result;
}

uint64_t sub_10001EB6C(uint64_t result, _WORD *a2)
{
  unint64_t v2 = *(_WORD ***)(result + 32);
  uint64_t v3 = *v2;
  *uint64_t v3 = *a2;
  *unint64_t v2 = v3 + 1;
  return result;
}

unint64_t sub_10001EB84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t result = sub_10001F114(*(void **)(*(void *)(a1 + 32) + 16LL), a3 + 2);
  unint64_t v6 = result;
  BOOL v7 = result < 0x10000;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log(result < 0x10000);
  }
  uint64_t v8 = **(void ***)(a1 + 40);
  uint64_t v9 = *a3;
  v8[1] = *((unsigned __int16 *)v8 + 4) | (unint64_t)(*a3 << 16);
  *uint64_t v8 = a3[1];
  if (v6 >= 0x10000)
  {
    uint64_t v10 = _os_assert_log(v7);
    unint64_t result = _os_crash(v10);
    __break(1u);
  }

  else
  {
    v8[1] = (v9 << 16) | (unsigned __int16)v6;
    **(void **)(a1 + 40) += 16LL;
  }

  return result;
}

void *sub_10001EC30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = **(_WORD ***)(a1 + 32);
  *__int16 v5 = *(_WORD *)a3;
  unint64_t v6 = *(char **)(a3 + 8);
  if (!v6 || !*(void *)(a3 + 16))
  {
    _os_assumes_log(0LL);
    unint64_t v6 = *(char **)(a3 + 8);
  }

  BOOL v7 = sub_100020340(*(void **)(*(void *)(a1 + 40) + 24LL), v6);
  __int16 v8 = (__int16)v7;
  v5[1] = v8;
  unint64_t result = sub_100020340(*(void **)(*(void *)(a1 + 40) + 24LL), *(char **)(a3 + 16));
  __int16 v10 = (__int16)result;
  v5[2] = v10;
  **(void **)(a1 + 32) += 6LL;
  return result;
}

void sub_10001ECEC()
{
}

uint64_t sub_10001ECF8(float *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = __ROR8__(v6 + 16, 16);
  unint64_t v8 = (0x9DDFEA08EB382D69LL
      * ((0x9DDFEA08EB382D69LL * (v7 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69LL * (v7 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v7)))) >> 47))) ^ v6;
  unint64_t v9 = *((void *)a1 + 1);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = (0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL
             * (v7 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69LL * (v7 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v7)))) >> 47))) ^ v6;
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
    }

    else
    {
      unint64_t v11 = v8 & (v9 - 1);
    }

    unsigned int v12 = *(void **)(*(void *)a1 + 8 * v11);
    if (v12)
    {
      for (unint64_t i = (void *)*v12; i; unint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          if (i[2] == v5 && i[3] == v6) {
            return 0LL;
          }
        }

        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }

          else
          {
            v14 &= v9 - 1;
          }

          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  }

  unint64_t v16 = operator new(0x28uLL);
  *unint64_t v16 = 0LL;
  v16[1] = v8;
  v16[2] = v5;
  v16[3] = v6;
  v16[4] = a3;
  float v17 = (float)(unint64_t)(*((void *)a1 + 3) + 1LL);
  float v18 = a1[8];
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1LL;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    else {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *((void *)a1 + 1);
    }

    if (*(void *)&prime > v9) {
      goto LABEL_34;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v29 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }

      else
      {
        uint64_t v31 = 1LL << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }

      if (*(void *)&prime <= v29) {
        int8x8_t prime = (int8x8_t)v29;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *((void *)a1 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            sub_10001ECEC();
          }
          BOOL v23 = operator new(8LL * *(void *)&prime);
          uint64_t v24 = *(void **)a1;
          *(void *)a1 = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0LL;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v25++) = 0LL;
          while (*(void *)&prime != v25);
          BOOL v26 = (void *)*((void *)a1 + 2);
          if (v26)
          {
            unint64_t v27 = v26[1];
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&prime) {
                v27 %= *(void *)&prime;
              }
            }

            else
            {
              v27 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)a1 + 8 * v27) = a1 + 4;
            uint64_t v32 = (void *)*v26;
            if (*v26)
            {
              do
              {
                unint64_t v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(void *)&prime) {
                    v33 %= *(void *)&prime;
                  }
                }

                else
                {
                  v33 &= *(void *)&prime - 1LL;
                }

                if (v33 != v27)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v33))
                  {
                    *(void *)(*(void *)a1 + 8 * v33) = v26;
                    goto LABEL_59;
                  }

                  *BOOL v26 = *v32;
                  void *v32 = **(void **)(*(void *)a1 + 8 * v33);
                  **(void **)(*(void *)a1 + 8 * v33) = v32;
                  uint64_t v32 = v26;
                }

                unint64_t v33 = v27;
LABEL_59:
                BOOL v26 = v32;
                uint64_t v32 = (void *)*v32;
                unint64_t v27 = v33;
              }

              while (v32);
            }
          }

          unint64_t v9 = (unint64_t)prime;
          goto LABEL_63;
        }

        unint64_t v39 = *(void **)a1;
        *(void *)a1 = 0LL;
        if (v39) {
          operator delete(v39);
        }
        unint64_t v9 = 0LL;
        *((void *)a1 + 1) = 0LL;
      }
    }

LABEL_63:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
      else {
        unint64_t v11 = v8;
      }
    }

    else
    {
      unint64_t v11 = (v9 - 1) & v8;
    }
  }

  uint64_t v34 = *(void **)a1;
  uint64_t v35 = *(void **)(*(void *)a1 + 8 * v11);
  if (v35)
  {
    *unint64_t v16 = *v35;
LABEL_76:
    *uint64_t v35 = v16;
    goto LABEL_77;
  }

  uint64_t v36 = *((void *)a1 + 2);
  *unint64_t v16 = v36;
  *((void *)a1 + 2) = v16;
  v34[v11] = a1 + 4;
  if (v36)
  {
    unint64_t v37 = *(void *)(v36 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v37 >= v9) {
        v37 %= v9;
      }
    }

    else
    {
      v37 &= v9 - 1;
    }

    uint64_t v35 = (void *)(*(void *)a1 + 8 * v37);
    goto LABEL_76;
  }

LABEL_77:
  ++*((void *)a1 + 3);
  return 1LL;
}

uint64_t sub_10001F114(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (v2)
  {
    uint64_t v3 = a2[1];
    uint64_t v4 = __ROR8__(v3 + 16, 16);
    unint64_t v5 = 0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v4)));
    unint64_t v6 = (0x9DDFEA08EB382D69LL * (v5 ^ (v5 >> 47))) ^ v3;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = v6;
      if (v6 >= *(void *)&v2) {
        unint64_t v8 = v6 % *(void *)&v2;
      }
    }

    else
    {
      unint64_t v8 = v6 & (*(void *)&v2 - 1LL);
    }

    unint64_t v9 = *(void **)(*a1 + 8 * v8);
    if (v9)
    {
      for (unint64_t i = (void *)*v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v6 == v11)
        {
          if (i[2] == *a2 && i[3] == v3) {
            return i[4];
          }
        }

        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(void *)&v2) {
              v11 %= *(void *)&v2;
            }
          }

          else
          {
            v11 &= *(void *)&v2 - 1LL;
          }

          if (v11 != v8) {
            return 0LL;
          }
        }
      }
    }
  }

  return 0LL;
}

void *sub_10001F208(void *result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result[3])
    {
      unint64_t result = (void *)result[2];
      if (result)
      {
        do
        {
          int8x8_t v2 = (void *)*result;
          operator delete(result);
          unint64_t result = v2;
        }

        while (v2);
      }

      v1[2] = 0LL;
      uint64_t v3 = v1[1];
      if (v3)
      {
        for (uint64_t i = 0LL; i != v3; ++i)
          *(void *)(*v1 + 8 * i) = 0LL;
      }

      v1[3] = 0LL;
    }
  }

  return result;
}

void sub_10001F270(void **a1)
{
  if (a1)
  {
    int8x8_t v2 = a1[2];
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)*v2;
        operator delete(v2);
        int8x8_t v2 = v3;
      }

      while (v3);
    }

    uint64_t v4 = *a1;
    *a1 = 0LL;
    if (v4) {
      operator delete(v4);
    }
    operator delete(a1);
  }

uint64_t sub_10001F2CC(void **a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint8x8_t v7 = (char *)*a1;
  if (!*a1)
  {
    uint8x8_t v7 = (char *)operator new(0x28uLL);
    *(_OWORD *)uint8x8_t v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_DWORD *)v7 + 8) = 1065353216;
    *a1 = v7;
  }

  unint64_t v9 = 0x9DDFEA08EB382D69LL * (a2 ^ __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12));
  unint64_t v10 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12) ^ (v9 >> 47);
  unint64_t v11 = 0x9DDFEA08EB382D69LL * ((0x9DDFEA08EB382D69LL * (v10 ^ v9)) ^ ((0x9DDFEA08EB382D69LL * (v10 ^ v9)) >> 47));
  unint64_t v12 = v11 ^ __PAIR64__(a3, HIDWORD(a2));
  unint64_t v13 = *((void *)v7 + 1);
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v15 = v11 ^ __PAIR64__(a3, HIDWORD(a2));
      if (v12 >= v13) {
        unint64_t v15 = v12 % v13;
      }
    }

    else
    {
      unint64_t v15 = v12 & (v13 - 1);
    }

    unint64_t v16 = *(uint64_t ***)(*(void *)v7 + 8 * v15);
    if (v16)
    {
      for (uint64_t i = *v16; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v18 = i[1];
        if (v18 == v12)
        {
          if (*((_DWORD *)i + 6) == a3 && i[2] == a2) {
            return 0LL;
          }
        }

        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (v18 >= v13) {
              v18 %= v13;
            }
          }

          else
          {
            v18 &= v13 - 1;
          }

          if (v18 != v15) {
            break;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  }

  unint64_t v20 = operator new(0x28uLL);
  *unint64_t v20 = 0LL;
  v20[1] = v12;
  void v20[2] = a2;
  *((_DWORD *)v20 + 6) = a3;
  v20[4] = a4;
  float v21 = (float)(unint64_t)(*((void *)v7 + 3) + 1LL);
  float v22 = *((float *)v7 + 8);
  if (!v13 || (float)(v22 * (float)v13) < v21)
  {
    BOOL v23 = 1LL;
    if (v13 >= 3) {
      BOOL v23 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v13);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v13 = *((void *)v7 + 1);
    if (*(void *)&prime > v13) {
      goto LABEL_36;
    }
    if (*(void *)&prime < v13)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*((unint64_t *)v7 + 3) / *((float *)v7 + 8));
      if (v13 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }

      else
      {
        uint64_t v35 = 1LL << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }

      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= v13)
      {
        unint64_t v13 = *((void *)v7 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_36:
          if (*(void *)&prime >> 61) {
            sub_10001ECEC();
          }
          unint64_t v27 = operator new(8LL * *(void *)&prime);
          uint8x8_t v28 = *(void **)v7;
          *(void *)uint8x8_t v7 = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0LL;
          *((int8x8_t *)v7 + 1) = prime;
          do
            *(void *)(*(void *)v7 + 8 * v29++) = 0LL;
          while (*(void *)&prime != v29);
          uint8x8_t v30 = (void *)*((void *)v7 + 2);
          if (v30)
          {
            unint64_t v31 = v30[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }

            else
            {
              v31 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)v7 + 8 * v31) = v7 + 16;
            uint64_t v36 = (void *)*v30;
            if (*v30)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }

                else
                {
                  v37 &= *(void *)&prime - 1LL;
                }

                if (v37 != v31)
                {
                  if (!*(void *)(*(void *)v7 + 8 * v37))
                  {
                    *(void *)(*(void *)v7 + 8 * v37) = v30;
                    goto LABEL_61;
                  }

                  void *v30 = *v36;
                  *uint64_t v36 = **(void **)(*(void *)v7 + 8 * v37);
                  **(void **)(*(void *)v7 + 8 * v37) = v36;
                  uint64_t v36 = v30;
                }

                unint64_t v37 = v31;
LABEL_61:
                uint8x8_t v30 = v36;
                uint64_t v36 = (void *)*v36;
                unint64_t v31 = v37;
              }

              while (v36);
            }
          }

          unint64_t v13 = (unint64_t)prime;
          goto LABEL_65;
        }

        unint64_t v43 = *(void **)v7;
        *(void *)uint8x8_t v7 = 0LL;
        if (v43) {
          operator delete(v43);
        }
        unint64_t v13 = 0LL;
        *((void *)v7 + 1) = 0LL;
      }
    }

LABEL_65:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v12 >= v13) {
        unint64_t v15 = v12 % v13;
      }
      else {
        unint64_t v15 = v12;
      }
    }

    else
    {
      unint64_t v15 = (v13 - 1) & v12;
    }
  }

  uint64_t v38 = *(void *)v7;
  unint64_t v39 = *(void **)(*(void *)v7 + 8 * v15);
  if (v39)
  {
    *unint64_t v20 = *v39;
LABEL_78:
    *unint64_t v39 = v20;
    goto LABEL_79;
  }

  uint64_t v40 = *((void *)v7 + 2);
  *unint64_t v20 = v40;
  *((void *)v7 + 2) = v20;
  *(void *)(v38 + 8 * v15) = v7 + 16;
  if (v40)
  {
    unint64_t v41 = *(void *)(v40 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v41 >= v13) {
        v41 %= v13;
      }
    }

    else
    {
      v41 &= v13 - 1;
    }

    unint64_t v39 = (void *)(*(void *)v7 + 8 * v41);
    goto LABEL_78;
  }

LABEL_79:
  ++*((void *)v7 + 3);
  return 1LL;
}

void *sub_10001F730(void *result, uint64_t a2, unsigned int a3)
{
  if (result)
  {
    int8x8_t v3 = (int8x8_t)result[1];
    if (v3)
    {
      uint64_t v4 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12);
      unint64_t v5 = (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69LL * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69LL * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
      uint8x8_t v6 = (uint8x8_t)vcnt_s8(v3);
      v6.i16[0] = vaddlv_u8(v6);
      if (v6.u32[0] > 1uLL)
      {
        unint64_t v7 = (0x9DDFEA08EB382D69LL
            * ((0x9DDFEA08EB382D69LL
              * (v4 ^ ((0x9DDFEA08EB382D69LL * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69LL * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69LL * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
        if (v5 >= *(void *)&v3) {
          unint64_t v7 = v5 % *(void *)&v3;
        }
      }

      else
      {
        unint64_t v7 = v5 & (*(void *)&v3 - 1LL);
      }

      unint64_t v8 = *(uint64_t ***)(*result + 8 * v7);
      if (v8)
      {
        for (uint64_t i = *v8; i; uint64_t i = (uint64_t *)*i)
        {
          unint64_t v10 = i[1];
          if (v5 == v10)
          {
            if (*((_DWORD *)i + 6) == a3 && i[2] == a2) {
              return (void *)i[4];
            }
          }

          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v10 >= *(void *)&v3) {
                v10 %= *(void *)&v3;
              }
            }

            else
            {
              v10 &= *(void *)&v3 - 1LL;
            }

            if (v10 != v7) {
              return 0LL;
            }
          }
        }
      }
    }

    return 0LL;
  }

  return result;
}

void *sub_10001F838(void *result, uint64_t (*a2)(void))
{
  if (result)
  {
    int8x8_t v3 = result;
    if (a2)
    {
      for (uint64_t i = (void *)result[2]; i; uint64_t i = (void *)*i)
        unint64_t result = (void *)a2(i[4]);
    }

    if (v3[3])
    {
      unint64_t result = (void *)v3[2];
      if (result)
      {
        do
        {
          unint64_t v5 = (void *)*result;
          operator delete(result);
          unint64_t result = v5;
        }

        while (v5);
      }

      v3[2] = 0LL;
      uint64_t v6 = v3[1];
      if (v6)
      {
        for (uint64_t j = 0LL; j != v6; ++j)
          *(void *)(*v3 + 8 * j) = 0LL;
      }

      v3[3] = 0LL;
    }
  }

  return result;
}

void sub_10001F8C8(void **a1, uint64_t (*a2)(void))
{
  if (a1)
  {
    int8x8_t v3 = a1[2];
    if (v3)
    {
      do
      {
        uint64_t v4 = (void *)*v3;
        operator delete(v3);
        int8x8_t v3 = v4;
      }

      while (v4);
    }

    unint64_t v5 = *a1;
    *a1 = 0LL;
    if (v5) {
      operator delete(v5);
    }
    operator delete(a1);
  }

uint64_t sub_10001F924(void **a1, char *__s, uint64_t a3)
{
  unint64_t v5 = (char *)*a1;
  if (!*a1)
  {
    unint64_t v5 = (char *)operator new(0x28uLL);
    *(_OWORD *)unint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_DWORD *)v5 + 8) = 1065353216;
    *a1 = v5;
  }

  sub_10001FDC0(__p, __s);
  char v7 = HIBYTE(v47);
  if (v47 >= 0) {
    unint64_t v8 = (uint64_t *)__p;
  }
  else {
    unint64_t v8 = (uint64_t *)__p[0];
  }
  if (v47 >= 0) {
    unint64_t v9 = HIBYTE(v47);
  }
  else {
    unint64_t v9 = (unint64_t)__p[1];
  }
  unint64_t v10 = sub_10001FE6C(v8, v9);
  unint64_t v11 = v10;
  unint64_t v12 = *((void *)v5 + 1);
  if (!v12)
  {
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_26;
  }

  uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
  v13.i16[0] = vaddlv_u8(v13);
  unint64_t v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    unint64_t v15 = v10;
    if (v10 >= v12) {
      unint64_t v15 = v10 % v12;
    }
  }

  else
  {
    unint64_t v15 = (v12 - 1) & v10;
  }

  unint64_t v16 = *(unsigned __int8 ***)(*(void *)v5 + 8 * v15);
  if (!v16 || (float v17 = *v16) == 0LL)
  {
LABEL_26:
    BOOL v19 = v5 + 16;
    unint64_t v20 = operator new(0x30uLL);
    *unint64_t v20 = 0LL;
    v20[1] = v11;
    uint64_t v21 = v47;
    *((_OWORD *)v20 + 1) = *(_OWORD *)__p;
    __p[1] = 0LL;
    uint64_t v47 = 0LL;
    __p[0] = 0LL;
    v20[4] = v21;
    v20[5] = a3;
    float v22 = (float)(unint64_t)(*((void *)v5 + 3) + 1LL);
    float v23 = *((float *)v5 + 8);
    if (v12 && (float)(v23 * (float)v12) >= v22)
    {
LABEL_72:
      uint64_t v39 = *(void *)v5;
      uint64_t v40 = *(void **)(*(void *)v5 + 8 * v15);
      if (v40)
      {
        *unint64_t v20 = *v40;
      }

      else
      {
        unint64_t v41 = (void *)*v19;
        *unint64_t v20 = *v19;
        *BOOL v19 = v20;
        *(void *)(v39 + 8 * v15) = v19;
        if (!v41) {
          goto LABEL_81;
        }
        unint64_t v42 = v41[1];
        if ((v12 & (v12 - 1)) != 0)
        {
          if (v42 >= v12) {
            v42 %= v12;
          }
        }

        else
        {
          v42 &= v12 - 1;
        }

        uint64_t v40 = (void *)(*(void *)v5 + 8 * v42);
      }

      *uint64_t v40 = v20;
LABEL_81:
      ++*((void *)v5 + 3);
      uint64_t v43 = 1LL;
      if (v47 < 0) {
        goto LABEL_82;
      }
      return v43;
    }

    BOOL v24 = 1LL;
    if (v12 >= 3) {
      BOOL v24 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v12);
    unint64_t v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26) {
      int8x8_t prime = (int8x8_t)v26;
    }
    else {
      int8x8_t prime = (int8x8_t)v25;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v12 = *((void *)v5 + 1);
    if (*(void *)&prime > v12) {
      goto LABEL_38;
    }
    if (*(void *)&prime < v12)
    {
      unint64_t v34 = vcvtps_u32_f32((float)*((unint64_t *)v5 + 3) / *((float *)v5 + 8));
      if (v12 < 3 || (uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
      {
        unint64_t v34 = std::__next_prime(v34);
      }

      else
      {
        uint64_t v36 = 1LL << -(char)__clz(v34 - 1);
        if (v34 >= 2) {
          unint64_t v34 = v36;
        }
      }

      if (*(void *)&prime <= v34) {
        int8x8_t prime = (int8x8_t)v34;
      }
      if (*(void *)&prime >= v12)
      {
        unint64_t v12 = *((void *)v5 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_38:
          if (*(void *)&prime >> 61) {
            sub_10001ECEC();
          }
          uint8x8_t v28 = operator new(8LL * *(void *)&prime);
          uint64_t v29 = *(void **)v5;
          *(void *)unint64_t v5 = v28;
          if (v29) {
            operator delete(v29);
          }
          uint64_t v30 = 0LL;
          *((int8x8_t *)v5 + 1) = prime;
          do
            *(void *)(*(void *)v5 + 8 * v30++) = 0LL;
          while (*(void *)&prime != v30);
          unint64_t v31 = (void *)*v19;
          if (*v19)
          {
            unint64_t v32 = v31[1];
            uint8x8_t v33 = (uint8x8_t)vcnt_s8(prime);
            v33.i16[0] = vaddlv_u8(v33);
            if (v33.u32[0] > 1uLL)
            {
              if (v32 >= *(void *)&prime) {
                v32 %= *(void *)&prime;
              }
            }

            else
            {
              v32 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)v5 + 8 * v32) = v19;
            unint64_t v37 = (void *)*v31;
            if (*v31)
            {
              do
              {
                unint64_t v38 = v37[1];
                if (v33.u32[0] > 1uLL)
                {
                  if (v38 >= *(void *)&prime) {
                    v38 %= *(void *)&prime;
                  }
                }

                else
                {
                  v38 &= *(void *)&prime - 1LL;
                }

                if (v38 != v32)
                {
                  if (!*(void *)(*(void *)v5 + 8 * v38))
                  {
                    *(void *)(*(void *)v5 + 8 * v38) = v31;
                    goto LABEL_63;
                  }

                  *unint64_t v31 = *v37;
                  *unint64_t v37 = **(void **)(*(void *)v5 + 8 * v38);
                  **(void **)(*(void *)v5 + 8 * v38) = v37;
                  unint64_t v37 = v31;
                }

                unint64_t v38 = v32;
LABEL_63:
                unint64_t v31 = v37;
                unint64_t v37 = (void *)*v37;
                unint64_t v32 = v38;
              }

              while (v37);
            }
          }

          unint64_t v12 = (unint64_t)prime;
          goto LABEL_67;
        }

        uint64_t v45 = *(void **)v5;
        *(void *)unint64_t v5 = 0LL;
        if (v45) {
          operator delete(v45);
        }
        unint64_t v12 = 0LL;
        *((void *)v5 + 1) = 0LL;
      }
    }

void *sub_10001FDC0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

unint64_t sub_10001FE6C(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9LL * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127LL * (v22 + v20) - 0x651E95C4D06FBFB1LL * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9LL * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }

    unint64_t v4 = 0x9DDFEA08EB382D69LL;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69LL
        * (v34 ^ ((0x9DDFEA08EB382D69LL * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69LL * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297LL * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    unint64_t v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0LL);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273LL * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273LL * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64LL;
    }

    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297LL
        * ((0x9DDFEA08EB382D69LL
          * (v49 ^ ((0x9DDFEA08EB382D69LL * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69LL * (v49 ^ ((0x9DDFEA08EB382D69LL * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69LL
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297LL
                * ((0x9DDFEA08EB382D69LL
                  * (v48 ^ ((0x9DDFEA08EB382D69LL * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69LL * (v48 ^ ((0x9DDFEA08EB382D69LL * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69LL * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }

  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273LL * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69LL;
    unint64_t v30 = 0x9DDFEA08EB382D69LL * (v29 ^ (v28 - 0x3C5A37A36834CED9LL * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69LL * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }

  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69LL;
      unint64_t v73 = 0x9DDFEA08EB382D69LL * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }

    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }

  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69LL
        * ((0x9DDFEA08EB382D69LL
          * (v3 ^ ((0x9DDFEA08EB382D69LL * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69LL * (v3 ^ ((0x9DDFEA08EB382D69LL * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL sub_1000202A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0LL;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1LL;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }

  while (v13 && v12);
  return v14;
}

void *sub_100020340(void *result, char *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    sub_10001FDC0(__p, a2);
    uint64_t v3 = sub_1000203D0(v2, (uint64_t)__p);
    uint64_t v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4) {
        return (void *)*((void *)v4 + 5);
      }
    }

    else if (v3)
    {
      return (void *)*((void *)v4 + 5);
    }

    return 0LL;
  }

  return result;
}

unsigned __int8 *sub_1000203D0(void *a1, uint64_t a2)
{
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    int v5 = (uint64_t *)a2;
  }
  else {
    int v5 = *(uint64_t **)a2;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a2 + 8);
  }
  unint64_t v7 = sub_10001FE6C(v5, v6);
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0LL;
  }
  unint64_t v9 = v7;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v12 = v7;
    if (v7 >= *(void *)&v8) {
      unint64_t v12 = v7 % *(void *)&v8;
    }
  }

  else
  {
    unint64_t v12 = (*(void *)&v8 - 1LL) & v7;
  }

  BOOL v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13) {
    return 0LL;
  }
  for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
  {
    unint64_t v15 = *((void *)i + 1);
    if (v9 == v15)
    {
    }

    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(void *)&v8) {
          v15 %= *(void *)&v8;
        }
      }

      else
      {
        v15 &= *(void *)&v8 - 1LL;
      }

      if (v15 != v12) {
        return 0LL;
      }
    }
  }

  return i;
}

void *sub_1000204DC(void *result, char *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    sub_10001FDC0(__p, a2);
    uint64_t v3 = sub_1000203D0(v2, (uint64_t)__p);
    int v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
      {
LABEL_4:
        unint64_t result = v4 + 16;
        return result;
      }
    }

    else if (v3)
    {
      goto LABEL_4;
    }

    return 0LL;
  }

  return result;
}

void sub_100020578(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 24))
  {
    sub_1000205D0(*(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void sub_1000205D0(void **__p)
{
  if (__p)
  {
    unint64_t v1 = __p;
    do
    {
      uint64_t v2 = (void **)*v1;
      operator delete(v1);
      unint64_t v1 = v2;
    }

    while (v2);
  }

void sub_100020614(void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p[2];
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)*v2;
        operator delete(v2);
        uint64_t v2 = v3;
      }

      while (v3);
    }

    int v4 = *__p;
    *__p = 0LL;
    if (v4) {
      operator delete(v4);
    }
    operator delete(__p);
  }

void sub_100020664(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = __ROR8__(v4 + 16, 16);
  unint64_t v6 = (0x9DDFEA08EB382D69LL
      * ((0x9DDFEA08EB382D69LL * (v5 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v5)))) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v5)))) >> 47))) ^ v4;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v5 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v5)))) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v5)))) >> 47))) ^ v4;
      if (v6 >= v7) {
        unint64_t v9 = v6 % v7;
      }
    }

    else
    {
      unint64_t v9 = v6 & (v7 - 1);
    }

    uint8x8_t v10 = *(void **)(*(void *)a1 + 8 * v9);
    if (v10)
    {
      for (uint64_t i = (void *)*v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v6)
        {
          if (i[2] == v3 && i[3] == v4) {
            return;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= v7) {
              v12 %= v7;
            }
          }

          else
          {
            v12 &= v7 - 1;
          }

          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }

  else
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  }

  BOOL v14 = operator new(0x20uLL);
  v14[1] = v6;
  void v14[2] = v3;
  v14[3] = v4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    BOOL v17 = 1LL;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_100020894(a1, v20);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v9 = v6 % v7;
      }
      else {
        unint64_t v9 = v6;
      }
    }

    else
    {
      unint64_t v9 = (v7 - 1) & v6;
    }
  }

  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v9);
  if (v22)
  {
    *BOOL v14 = *v22;
LABEL_42:
    *uint64_t v22 = v14;
    goto LABEL_43;
  }

  uint64_t v23 = *(void *)(a1 + 16);
  *BOOL v14 = v23;
  *(void *)(a1 + 16) = v14;
  *(void *)(v21 + 8 * v9) = a1 + 16;
  if (v23)
  {
    unint64_t v24 = *(void *)(v23 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v24 >= v7) {
        v24 %= v7;
      }
    }

    else
    {
      v24 &= v7 - 1;
    }

    uint64_t v22 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_42;
  }

LABEL_43:
  ++*(void *)(a1 + 24);
}

void sub_100020894(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }

    else
    {
      uint64_t v13 = 1LL << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }

    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      float v16 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0LL;
      return;
    }
  }

  if (prime >> 61) {
    sub_10001ECEC();
  }
  uint64_t v5 = operator new(8 * prime);
  unint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0LL;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0LL;
  while (prime != v7);
  uint8x8_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }

    else
    {
      v9 &= prime - 1;
    }

    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    BOOL v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }

        else
        {
          v15 &= prime - 1;
        }

        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }

          *uint8x8_t v8 = *v14;
          *BOOL v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          BOOL v14 = v8;
        }

        size_t v15 = v9;
LABEL_31:
        uint8x8_t v8 = v14;
        BOOL v14 = (void *)*v14;
        size_t v9 = v15;
      }

      while (v14);
    }
  }

BOOL sub_100020A8C(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (v2)
  {
    uint64_t v3 = a2[1];
    uint64_t v4 = __ROR8__(v3 + 16, 16);
    unint64_t v5 = 0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69LL * (*a2 ^ v4)));
    unint64_t v6 = (0x9DDFEA08EB382D69LL * (v5 ^ (v5 >> 47))) ^ v3;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = v6;
      if (v6 >= *(void *)&v2) {
        unint64_t v8 = v6 % *(void *)&v2;
      }
    }

    else
    {
      unint64_t v8 = v6 & (*(void *)&v2 - 1LL);
    }

    uint64_t i = *(void **)(*a1 + 8 * v8);
    if (i)
    {
      for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
      {
        unint64_t v10 = i[1];
        if (v6 == v10)
        {
          if (i[2] == *a2 && i[3] == v3) {
            return i != 0LL;
          }
        }

        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= *(void *)&v2) {
              v10 %= *(void *)&v2;
            }
          }

          else
          {
            v10 &= *(void *)&v2 - 1LL;
          }

          if (v10 != v8) {
            goto LABEL_22;
          }
        }
      }
    }
  }

  else
  {
LABEL_22:
    uint64_t i = 0LL;
  }

  return i != 0LL;
}

void sub_100020B84(unsigned int *a1, void (*a2)(void))
{
  if (!*((void *)a1 + 2)) {
    goto LABEL_12;
  }
  unint64_t v3 = *a1;
  if ((_DWORD)v3)
  {
    for (unint64_t i = 0LL; i < v3; ++i)
    {
      unint64_t v6 = *(void **)(*((void *)a1 + 2) + 8 * i);
      if (v6)
      {
        do
        {
          uint8x8_t v7 = (void *)*v6;
          if (a2) {
            a2(v6[2]);
          }
          free(v6);
          --a1[1];
          unint64_t v6 = v7;
        }

        while (v7);
        unint64_t v3 = *a1;
      }
    }
  }

  if (!a1[1])
  {
    free(*((void **)a1 + 2));
LABEL_12:
    free(a1);
    return;
  }

  uint64_t v8 = _os_assert_log(0LL);
  _os_crash(v8);
  __break(1u);
}

uint64_t sub_100020C34(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v4 = (void *)(*(void *)(a1 + 16) + 8LL * (qword_10002A2F0[*(unsigned __int8 *)(a1 + 8)](a2) % *(_DWORD *)a1));
    unint64_t v5 = (unsigned int (*)(void, uint64_t))qword_10002A308[*(unsigned __int8 *)(a1 + 8)];
    while (1)
    {
      uint64_t v4 = (void *)*v4;
      if (!v4) {
        break;
      }
      if (v5(v4[1], a2)) {
        return v4[2];
      }
    }
  }

  return 0LL;
}

BOOL sub_100020CC4(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

BOOL sub_100020CD4(uint64_t a1, void *a2)
{
  return *a2 == a1;
}

uint64_t sub_100020CE4(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t sub_100020CEC(void *a1)
{
  unint64_t v1 = *a1 + ~(*a1 << 32);
  unint64_t v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  unint64_t v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

uint64_t sub_100020D28(unsigned int *a1, void *a2, uint64_t a3)
{
  unsigned int v6 = ((unsigned int (**)(void *))qword_10002A2F0)[*((unsigned __int8 *)a1 + 8)](a2);
  unsigned int v7 = *a1;
  if (!*((void *)a1 + 2))
  {
    unsigned int v11 = *a1;
LABEL_9:
    *((void *)a1 + 2) = _os_trace_calloc(v11, 8LL);
    goto LABEL_10;
  }

  uint64_t v8 = (void *)(*((void *)a1 + 2)
                + 8LL
                * (((unsigned int (**)(void *))qword_10002A2F0)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  size_t v9 = (uint64_t (*)(void, void *))qword_10002A308[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      break;
    }
    if ((v9(v8[1], a2) & 1) != 0) {
      return 0LL;
    }
  }

  if (!*((void *)a1 + 2))
  {
    unsigned int v11 = *a1;
    goto LABEL_9;
  }

LABEL_10:
  unsigned int v12 = v6 % v7;
  int v13 = *((unsigned __int8 *)a1 + 8);
  BOOL v14 = (void *)_os_trace_calloc(1LL, 24LL);
  *BOOL v14 = 0LL;
  void v14[2] = a3;
  if (v13 == 2)
  {
    v14[1] = *a2;
  }

  else if (v13 == 1)
  {
    *((_WORD *)v14 + 4) = *(_WORD *)a2;
  }

  else
  {
    free(v14);
    BOOL v14 = 0LL;
  }

  uint64_t v15 = *((void *)a1 + 2);
  *BOOL v14 = *(void *)(v15 + 8LL * v12);
  *(void *)(v15 + 8LL * v12) = v14;
  ++a1[1];
  return 1LL;
}

unsigned int *sub_100020E74(unsigned int *result, uint64_t a2)
{
  if (*((void *)result + 2))
  {
    unint64_t v2 = result;
    unint64_t v3 = *result;
    if ((_DWORD)v3)
    {
      for (unint64_t i = 0LL; i < v3; ++i)
      {
        unsigned int v6 = *(void **)(*((void *)v2 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            int v7 = *((unsigned __int8 *)v2 + 8);
            if (v7 == 1) {
              uint64_t v8 = v6 + 1;
            }
            else {
              uint64_t v8 = 0LL;
            }
            if (v7 == 2) {
              size_t v9 = v6 + 1;
            }
            else {
              size_t v9 = v8;
            }
            unint64_t result = (unsigned int *)(*(uint64_t (**)(uint64_t, void *, void))(a2 + 16))(a2, v9, v6[2]);
            unsigned int v6 = (void *)*v6;
          }

          while (v6);
          unint64_t v3 = *v2;
        }
      }
    }
  }

  return result;
}

void sub_100020EFC(id a1)
{
  qword_10003A958 = (uint64_t)"/private/var/db/diagnostics";
  qword_10003A960 = (uint64_t)"/private/var/db/diagnostics/timesync";
  qword_10003A968 = (uint64_t)"/private/var/db/uuidtext";
}

uint64_t sub_100020F30(uint64_t a1)
{
  switch((int)a1)
  {
    case 0:
      if (qword_10003A970 != -1) {
        dispatch_once(&qword_10003A970, &stru_10002A340);
      }
      uint64_t result = qword_10003A958;
      break;
    case 1:
      if (qword_10003A970 != -1) {
        dispatch_once(&qword_10003A970, &stru_10002A340);
      }
      uint64_t result = qword_10003A960;
      break;
    case 2:
      if (qword_10003A970 != -1) {
        dispatch_once(&qword_10003A970, &stru_10002A340);
      }
      uint64_t result = qword_10003A968;
      break;
    case 3:
      uint64_t result = _os_trace_prefsdir_path(a1);
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t sub_10002101C(uint64_t a1, unsigned __int8 *src)
{
  if (*(_DWORD *)src == 4096 && *((void *)src + 1) >= 0xA8uLL)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    if (*(void *)((char *)v3 + 4) != *((void *)src + 18) || *(void *)((char *)v3 + 12) != *((void *)src + 19))
    {
      unint64_t v4 = v3[4];
      unint64_t v5 = v3[5];
      uint64_t v6 = v3[3];
      if (v4 >= v5)
      {
        uint64_t v7 = 2 * v5;
        uint64_t v6 = _os_trace_realloc(v6, v5 << 7);
        v3[3] = v6;
        void v3[5] = v7;
        unint64_t v4 = v3[4];
      }

      v3[4] = v4 + 1;
      uint64_t v8 = v6 + (v4 << 6);
      uint64_t v9 = *((void *)src + 4);
      int v10 = *((_DWORD *)src + 10);
      uint64_t v11 = *((void *)src + 2);
      uint64_t v12 = *((void *)src + 8);
      uint64_t v13 = *(void *)(src + 44);
      *(void *)uint64_t v8 = 0LL;
      *(void *)(v8 + 8) = 0LL;
      *(void *)(v8 + 16) = 0LL;
      *(void *)(v8 + 24) = v9;
      *(_DWORD *)(v8 + 32) = v10;
      *(void *)(v8 + 4unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = v13;
      *(void *)(v8 + 48) = v11;
      *(void *)(v8 + 56) = v12;
      uuid_copy((unsigned __int8 *)(v3[3] + (v4 << 6) + 8), src + 144);
    }
  }

  return 1LL;
}

int sub_1000210F4(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3)
  {
    unint64_t v3 = *((void *)a2 + 7);
    unint64_t v4 = *((void *)a3 + 7);
    BOOL v5 = v3 == v4;
    if (v3 < v4) {
      int v6 = -1;
    }
    else {
      int v6 = 1;
    }
    if (v5) {
      return 0;
    }
    else {
      return v6;
    }
  }

  else if (*(void *)a2 < *(void *)a3)
  {
    return -1;
  }

  else
  {
    return 1;
  }

int sub_10002112C(id a1, const void *a2, const void *a3)
{
  uint64_t v3 = *((void *)a2 + 3);
  uint64_t v4 = *((void *)a3 + 3);
  if (v3 == v4)
  {
    int v5 = *((_DWORD *)a2 + 8);
    int v6 = *((_DWORD *)a3 + 8);
    BOOL v7 = v5 == v6;
    if (v5 < v6) {
      int v8 = -1;
    }
    else {
      int v8 = 1;
    }
    if (v7) {
      return 0;
    }
    else {
      return v8;
    }
  }

  else if (v3 < v4)
  {
    return -1;
  }

  else
  {
    return 1;
  }

uint64_t sub_100021164(int a1, void *a2, void *a3, int a4)
{
  int v6 = 0LL;
  uint64_t v41 = 0LL;
  unint64_t v42 = &v41;
  uint64_t v43 = 0x2000000000LL;
  int v44 = 0;
  uint64_t v37 = 0LL;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2000000000LL;
  uint64_t v40 = -1LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  uint64_t v28 = sub_100021A20;
  unint64_t v29 = &unk_10002A408;
  uint64_t v36 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000LL;
  unint64_t v30 = &v41;
  unint64_t v31 = &v37;
  uint64_t v32 = &v33;
  if (a4)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 0x40000000LL;
    void v25[2] = sub_100021A94;
    v25[3] = &unk_10002A428;
    int v26 = a1;
    int v6 = v25;
  }

  int v7 = dup(a1);
  if (v7 == -1)
  {
LABEL_27:
    unint64_t v19 = __error();
    _os_assumes_log(*v19);
    goto LABEL_30;
  }

  int v8 = v7;
  if (lseek(v7, 0LL, 0) == -1)
  {
    uint64_t v23 = __error();
    _os_assumes_log(*v23);
  }

  uint64_t v9 = fdopendir(v8);
  if (v9)
  {
    int v10 = v9;
    while (1)
    {
LABEL_8:
      uint64_t v11 = readdir(v10);
      if (!v11) {
        break;
      }
      uint64_t v12 = v11;
      d_xpc_type_t type = v11->d_type;
      if ((d_type | 8) == 8)
      {
        uint64_t v14 = 0LL;
        d_name = v11->d_name;
        while ((d_name[v14] & 0x80000000) == 0
             && (_DefaultRuneLocale.__runetype[d_name[v14]] & 0x10000) != 0)
        {
          if (++v14 == 16)
          {
            if (strcmp(&v11->d_name[16], ".timesync")) {
              break;
            }
            char v18 = v28(v27, d_name);
            goto LABEL_25;
          }
        }
      }

      if (v6 && d_type == 8)
      {
        uint64_t v16 = 0LL;
        BOOL v17 = v12->d_name;
        while ((v17[v16] & 0x80000000) == 0
             && (_DefaultRuneLocale.__runetype[v17[v16]] & 0x10000) != 0)
        {
          if (++v16 == 16)
          {
            if (!strcmp(&v12->d_name[16], ".timesync")) {
              goto LABEL_8;
            }
            break;
          }
        }

        if (strcmp(v12->d_name, ".migrated"))
        {
          char v18 = ((uint64_t (*)(void *, char *))v6[2])(v6, v17);
LABEL_25:
          if ((v18 & 1) == 0) {
            break;
          }
        }
      }
    }

    if (closedir(v10) != -1) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }

  int v20 = *__error();
  if (close(v8) == -1)
  {
    int v24 = *__error();
    uint64_t result = *__error();
    if (v24 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = result;
      __break(1u);
      return result;
    }

    _os_assumes_log(result);
  }

  *__error() = v20;
LABEL_30:
  uint64_t v21 = *((unsigned int *)v42 + 6);
  if ((int)v21 >= 1)
  {
    *a2 = v38[3];
    *a3 = v34[3];
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  return v21;
}

int *sub_10002147C(int *result)
{
  unint64_t v1 = result;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = (int *)_os_trace_get_times_now(&v17, &v16, 0LL);
  unint64_t v2 = v16 / 0x3B9ACA00;
  v16 /= 0x3B9ACA00uLL;
  unint64_t v3 = *((void *)v1 + 12);
  unint64_t v4 = *((void *)v1 + 13) - v1[34];
  if (v3 >= v4)
  {
LABEL_21:
    unint64_t v3 = v4;
    goto LABEL_22;
  }

  unint64_t v5 = v2 - *((void *)v1 + 18);
  while (1)
  {
    memset(v20, 170, 18);
    *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1AuLL, "%016llx.timesync", v3);
    int v6 = openat(*v1, __str, 0);
    if (v6 == -1) {
      goto LABEL_27;
    }
    int v7 = v6;
    v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v18.st_blkmach_vm_size_t size = v8;
    *(timespec *)v18.st_qspare = v8;
    v18.st_birthtimespec = v8;
    *(timespec *)&v18.st_mach_vm_size_t size = v8;
    v18.st_mtimespec = v8;
    v18.st_ctimespec = v8;
    *(timespec *)&v18.st_uid = v8;
    v18.st_atimespec = v8;
    *(timespec *)&v18.st_dev = v8;
    int v9 = fstat(v6, &v18);
    if (v9)
    {
      if (v9 == -1)
      {
        int v10 = __error();
        _os_assumes_log(*v10);
      }

      goto LABEL_9;
    }

    if (v18.st_mtimespec.tv_sec > v5) {
      break;
    }
LABEL_9:
    if (close(v7) == -1)
    {
      int v11 = *__error();
      uint64_t v12 = *__error();
      if (v11 == 9)
      {
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = v12;
        __break(1u);
      }

      _os_assumes_log(v12);
    }

    uint64_t result = (int *)unlinkat(*v1, __str, 0);
    if ((_DWORD)result == -1)
    {
      uint64_t v13 = __error();
      uint64_t result = (int *)_os_assumes_log(*v13);
    }

    if (v3 == 2)
    {
      snprintf(__str, 0x1AuLL, "%016llx.timesync", 1LL);
      uint64_t result = (int *)unlinkat(*v1, __str, 0);
      if ((_DWORD)result == -1)
      {
        uint64_t result = __error();
        if (*result != 2)
        {
          uint64_t result = (int *)*__error();
          if ((_DWORD)result) {
            uint64_t result = (int *)_os_assumes_log(result);
          }
        }
      }
    }

    if (++v3 >= v4) {
      goto LABEL_21;
    }
  }

  uint64_t result = (int *)close(v7);
  if ((_DWORD)result != -1) {
    goto LABEL_22;
  }
  int v14 = *__error();
  uint64_t v15 = *__error();
  if (v14 == 9)
  {
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v15;
    __break(1u);
LABEL_27:
    uint64_t v15 = *__error();
  }

  uint64_t result = (int *)_os_assumes_log(v15);
LABEL_22:
  *((void *)v1 + 12) = v3;
  return result;
}

uint64_t sub_100021738(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 104);
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v4);
  int v2 = openat(*(_DWORD *)a1, __str, 16779785, 420LL);
  *(_DWORD *)(a1 + 112) = v2;
  if (v2 < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 12unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = 0LL;
  ++*(void *)(a1 + 104);
  return result;
}

void sub_1000217F0(uint64_t a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Bad timesync db entry, file rotated";
  qword_10002DF78 = a1;
  __break(1u);
}

uint64_t sub_100021818(uint64_t a1, int a2)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v17 = 0u;
  LODWORD(v17) = 3193776;
  *(void *)&v11.tm_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v11.uint64_t tm_hour = 0xAAAAAAAAAAAAAAAALL;
  time_t v13 = 0x1500000001LL;
  size_t v12 = 16LL;
  if (sysctl((int *)&v13, 2u, &v11, &v12, 0LL, 0LL) < 0)
  {
    uint64_t v10 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Can't get boot time";
    qword_10002DF78 = v10;
    __break(1u);
  }

  *(void *)&__int128 v19 = 1000000000LL * *(void *)&v11.tm_sec + 1000LL * v11.tm_hour;
  uint64_t boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, (unsigned __int8 *)&v17 + 8);
  mach_timebase_info((mach_timebase_info_t)&v18 + 1);
  time_t v13 = time(0LL);
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v5;
  *(_OWORD *)&v11.int tm_isdst = v5;
  *(_OWORD *)&v11.tm_sec = v5;
  localtime_r(&v13, &v11);
  unint64_t v6 = ((unsigned __int128)(v11.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v11.tm_gmtoff;
  DWORD2(v19) = (v6 >> 5) + (v6 >> 63) + 60 * v11.tm_isdst;
  HIDWORD(v19) = v11.tm_isdst;
  memset(&v11.tm_hour, 0, 24);
  v11.tm_sec = 2126676;
  v11.tm_m__int128 in = a2;
  _os_trace_get_times_now(&v11.tm_hour, &v11.tm_mon, &v11.tm_wday);
  time_t v13 = (time_t)&v17;
  uint64_t v14 = 48LL;
  uint64_t v15 = &v11;
  uint64_t v16 = 32LL;
  if (_os_trace_writev(*(unsigned int *)(a1 + 112), &v13, 2LL) == -1)
  {
    timespec v8 = __error();
    _os_assumes_log(*v8);
    return 0xFFFFFFFFLL;
  }

  else
  {
    if (fsync(*(_DWORD *)(a1 + 112)) == -1)
    {
      int v9 = __error();
      _os_assumes_log(*v9);
    }

    uint64_t result = 0LL;
    *(void *)(a1 + 120) += v16 + v14;
  }

  return result;
}

uint64_t sub_100021A20(void *a1, char *__str)
{
  unint64_t v3 = strtoull(__str, 0LL, 16);
  uint64_t v4 = *(void *)(a1[5] + 8LL);
  if (v3 < *(void *)(v4 + 24)) {
    *(void *)(v4 + 24) = v3;
  }
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  if (v3 > *(void *)(v5 + 24)) {
    *(void *)(v5 + 24) = v3;
  }
  return 1LL;
}

uint64_t sub_100021A94(uint64_t a1, const char *a2)
{
  if (unlinkat(*(_DWORD *)(a1 + 32), a2, 0) == -1)
  {
    unint64_t v3 = __error();
    _os_assumes_log(*v3);
  }

  return 1LL;
}

uint64_t sub_100021ACC(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 120) < *(void *)(a1 + 128))
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    v10[0] = 2126676;
    v10[1] = a2;
    _os_trace_get_times_now(&v11, &v12, &v13);
    if (_os_trace_write(*(unsigned int *)(a1 + 112), v10, 32LL) != -1)
    {
      if (fsync(*(_DWORD *)(a1 + 112)) == -1)
      {
        timespec v8 = __error();
        _os_assumes_log(*v8);
      }

      uint64_t result = 0LL;
      uint64_t v5 = *(void *)(a1 + 120) + 32LL;
LABEL_6:
      *(void *)(a1 + 12unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = v5;
      return result;
    }

    goto LABEL_16;
  }

  if (close(*(_DWORD *)(a1 + 112)) != -1)
  {
LABEL_8:
    sub_10002147C((int *)a1);
    if ((sub_100021738(a1) & 0x80000000) != 0 || (sub_100021818(a1, a2) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    if (!*(_WORD *)(a1 + 8)) {
      return 0LL;
    }
    if (_os_trace_write(*(unsigned int *)(a1 + 112), a1 + 8, 88LL) != -1)
    {
      if (fsync(*(_DWORD *)(a1 + 112)) == -1)
      {
        int v9 = __error();
        _os_assumes_log(*v9);
      }

      uint64_t result = 0LL;
      uint64_t v5 = *(void *)(a1 + 120) + 88LL;
      goto LABEL_6;
    }

uint64_t sub_100021C8C(uint64_t a1)
{
  *(void *)(a1 + 24) = *(void *)(a1 + 8);
  while ((sub_100021D8C((void *)a1) & 0x80000000) != 0)
  {
    unint64_t v2 = *(void *)(a1 + 16);
    unint64_t v3 = *(void *)(a1 + 24) + 1LL;
    *(void *)(a1 + 24) = v3;
    if (v3 > v2) {
      return 0xFFFFFFFFLL;
    }
  }

  sub_100021EA0(a1);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = sub_100021F04(*(unsigned __int16 **)(a1 + 48), &v6);
  uint64_t result = 0LL;
  *(void *)(a1 + 48) = v5;
  return result;
}

uint64_t sub_100021D38(uint64_t a1)
{
  unint64_t v3 = (void *)(a1 + 40);
  uint64_t result = *(void *)(a1 + 40);
  if ((unint64_t)(result + 1) >= 2)
  {
    uint64_t result = munmap((void *)result, *(void *)(a1 + 32));
    if ((_DWORD)result == -1)
    {
      uint64_t v4 = __error();
      uint64_t result = _os_assumes_log(*v4);
    }

    *unint64_t v3 = 0LL;
    v3[1] = 0LL;
  }

  return result;
}

uint64_t sub_100021D8C(void *a1)
{
  uint64_t v6 = a1[3];
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v6);
  unint64_t v2 = (unsigned __int16 *)_os_trace_mmap_at(*(unsigned int *)a1, __str, 256LL, a1 + 4);
  a1[5] = v2;
  if (!v2)
  {
    uint64_t v4 = *__error();
    if ((_DWORD)v4) {
      _os_assumes_log(v4);
    }
    return 0xFFFFFFFFLL;
  }

  if ((uint64_t)a1[4] < 80 || *v2 != 48048 || v2[1] != 48 || v2[24] != 29524 || v2[25] != 32)
  {
    sub_100021D38((uint64_t)a1);
    a1[5] = 0LL;
    return 0xFFFFFFFFLL;
  }

  uint64_t v3 = 0LL;
  a1[6] = v2;
  return v3;
}

uint64_t sub_100021EA0(uint64_t result)
{
  unint64_t v1 = *(__int128 **)(result + 48);
  if (*((_DWORD *)v1 + 6))
  {
    if (*((_DWORD *)v1 + 7))
    {
      __int128 v2 = *v1;
      __int128 v3 = v1[1];
      *(_OWORD *)(result + 88) = v1[2];
      *(_OWORD *)(result + 72) = v3;
      *(_OWORD *)(result + 56) = v2;
      *(void *)(result + 112) = 0LL;
      *(_OWORD *)(result + 12unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = *(_OWORD *)(result + 88);
      return result;
    }
  }

  else
  {
    uint64_t v4 = _os_assert_log(0LL);
    _os_crash(v4);
    __break(1u);
  }

  uint64_t v5 = _os_assert_log(0LL);
  uint64_t result = _os_crash(v5);
  __break(1u);
  return result;
}

char *sub_100021F04(unsigned __int16 *a1, void *a2)
{
  unsigned int v2 = *a1;
  if (v2 > 0xBBAF)
  {
    if (v2 == 48048)
    {
      if (a1[1] != 48) {
        goto LABEL_17;
      }
      uint64_t v3 = 48LL;
    }

    else
    {
      if (v2 != 57005) {
        goto LABEL_17;
      }
      uint64_t v3 = a1[1];
    }
  }

  else
  {
    if (v2 != 27986)
    {
      if (v2 == 29524 && a1[1] == 32)
      {
        uint64_t v3 = 32LL;
        goto LABEL_13;
      }

uint64_t sub_100021FBC(uint64_t result)
{
  unint64_t v1 = *(unsigned __int16 **)(result + 48);
  if (!v1) {
    return result;
  }
  unsigned int v2 = (void *)result;
  if (*v1 == 48048)
  {
    sub_100021EA0(result);
    uint64_t v3 = (unsigned __int16 *)v2[6];
  }

  else
  {
    __int128 v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 12unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    uint64_t v3 = v1;
  }

  uint64_t v8 = v2[4] - (void)v3 + v2[5];
  while (1)
  {
    uint64_t result = (uint64_t)sub_100021F04(v1, &v8);
    unint64_t v1 = (unsigned __int16 *)result;
    if (!result) {
      break;
    }
LABEL_10:
    int v7 = *v1;
    if (v7 == 48048)
    {
      if (*((void *)v1 + 1) != v2[8] || *((void *)v1 + 2) != v2[9]) {
        goto LABEL_17;
      }
    }

    else if (v7 == 29524)
    {
      goto LABEL_17;
    }
  }

  uint64_t result = sub_100021D38((uint64_t)v2);
  unint64_t v5 = v2[2];
  unint64_t v6 = v2[3] + 1LL;
  v2[3] = v6;
  if (v6 <= v5)
  {
    uint64_t result = sub_100021D8C(v2);
    if ((result & 0x80000000) == 0)
    {
      unint64_t v1 = (unsigned __int16 *)v2[6];
      uint64_t v8 = v2[4];
      if (!v1) {
        goto LABEL_17;
      }
      goto LABEL_10;
    }
  }

  unint64_t v1 = 0LL;
LABEL_17:
  v2[6] = v1;
  return result;
}

void **sub_1000220F4(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6 = (void **)_os_trace_zalloc(24LL);
  *(_OWORD *)(v6 + 1) = xmmword_100024870;
  int v7 = operator new(0x28uLL);
  *int v7 = 0u;
  v7[1] = 0u;
  *((_DWORD *)v7 + 8) = 1065353216;
  *unint64_t v6 = v7;
  sub_100021C8C(a1);
  if (a2 - 1 >= a3) {
    unint64_t v8 = -1LL;
  }
  else {
    unint64_t v8 = a3;
  }
  for (unint64_t i = *(unsigned __int16 **)(a1 + 48); i; unint64_t i = *(unsigned __int16 **)(a1 + 48))
  {
    unint64_t v10 = *(void *)(a1 + 120);
    if (v10 <= v8)
    {
      if (v10 > a2) {
        break;
      }
      if (*i != 48048)
      {
        unint64_t v11 = (*((void *)i + 1) - *(void *)(a1 + 112))
            * (unint64_t)*(unsigned int *)(a1 + 80)
LABEL_11:
        if (v11 > a2) {
          break;
        }
        goto LABEL_12;
      }

      unint64_t v11 = *((void *)i + 4);
      if (v11 <= v8) {
        goto LABEL_11;
      }
    }

BOOL sub_100022524(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(void *)(a1 + 32) >= a3;
}

__n128 sub_100022534(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

void sub_100022548(id a1)
{
  byte_10003A980 = MKBDeviceFormattedForContentProtection(a1) == 1;
}

BOOL sub_10002256C()
{
  if (byte_10003A981) {
    return 1LL;
  }
  if (qword_10003A978 != -1) {
    dispatch_once(&qword_10003A978, &stru_10002A4A8);
  }
  if (byte_10003A980) {
    BOOL result = MKBDeviceUnlockedSinceBoot() == 1;
  }
  else {
    BOOL result = 1LL;
  }
  byte_10003A981 = result;
  return result;
}

void sub_1000225E4(id a1)
{
  *(_OWORD *)__int128 v4 = xmmword_100024780;
  memset(__b, 170, sizeof(__b));
  size_t v2 = 648LL;
  if (sysctl(v4, 4u, __b, &v2, 0LL, 0LL) == -1)
  {
    unint64_t v1 = __error();
    _os_assumes_log(*v1);
  }

  byte_10003A990 = (__b[32] & 4) != 0;
}

uint64_t sub_10002269C(unsigned __int8 *a1, unsigned int a2, char *__str)
{
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  uint64_t result = snprintf(__str, 0x400uLL, "%s/", (const char *)qword_10003A968);
  int v7 = &__str[(int)result];
  size_t v8 = 1024LL - (int)result;
  if (a2 - 1 >= 2)
  {
    if (a2 != 3)
    {
LABEL_12:
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
      qword_10002DF78 = a2;
      __break(1u);
      return result;
    }

    uint64_t result = snprintf(v7, v8, "dsc");
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t result = snprintf(v7, v8, "%02X", *a1);
    uint64_t v9 = 1LL;
  }

  uint64_t v10 = (int)result + 1LL;
  if (v10 + 2 * (16 - v9) >= v8)
  {
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_10002DF78 = v8;
    __break(1u);
    goto LABEL_12;
  }

  v7[(int)result] = 47;
  unint64_t v11 = &v7[v10];
  do
  {
    *unint64_t v11 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
    v11[1] = a0123456789abcd[a1[v9] & 0xF];
    v11 += 2;
    ++v9;
  }

  while (v9 != 16);
  *unint64_t v11 = 0;
  return result;
}

void sub_100022828(id a1)
{
  uint64_t v1 = getpid();
  int v2 = SANDBOX_CHECK_NO_REPORT;
  if (qword_10003A970 != -1) {
    dispatch_once(&qword_10003A970, &stru_10002A340);
  }
  byte_10003A9A0 = sandbox_check(v1, "file-read-data", v2 | 1u) == 0;
}

BOOL sub_1000228B4(unsigned __int8 *a1)
{
  if (qword_10003A998 != -1) {
    dispatch_once(&qword_10003A998, &stru_10002A528);
  }
  if (!byte_10003A9A0) {
    return 0LL;
  }
  memset(__b, 170, sizeof(__b));
  sub_10002269C(a1, 3u, __b);
  return access(__b, 0) == 0;
}

uint64_t sub_100022974()
{
  if (qword_10003A9A8 != -1) {
    dispatch_once(&qword_10003A9A8, &stru_10002A568);
  }
  return byte_10002DF3C;
}

void sub_1000229B4(id a1)
{
  size_t v1 = 1024LL;
  byte_10002DF3C = sysctlbyname("kern.filesetuuid", __b, &v1, 0LL, 0LL) != 0;
  if (!sysctlbyname("kern.bootargs", __b, &v1, 0LL, 0LL))
  {
    if (strstr(__b, "libtrace_kic=0")) {
      byte_10002DF3C = 0;
    }
    if (strstr(__b, "libtrace_kic=1")) {
      byte_10002DF3C = 1;
    }
  }

void sub_100022A98(unsigned __int8 *a1)
{
  *(void *)&v5[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__int128 in = v2;
  *(_OWORD *)unint64_t v5 = v2;
  size_t v3 = 37LL;
  if (sysctlbyname("kern.kernelcacheuuid", in, &v3, 0LL, 0LL))
  {
    uuid_copy(a1, byte_10003A7F9);
    a1[15] = ~a1[15];
  }

  else
  {
    uuid_parse(in, a1);
  }

uint64_t sub_100022B4C(uint64_t result, mach_port_t a2)
{
  *(_BYTE *)(result + 144) = 1;
  if (a2)
  {
    uint64_t result = sub_100005A40(a2, 0, -1LL, -1LL, 0);
    if ((_DWORD)result == -301)
    {
      qword_10002DF48 = (uint64_t)"MIG_REPLY_MISMATCH";
      qword_10002DF78 = -301LL;
      __break(1u);
    }

    if ((_DWORD)result) {
      return _dispatch_bug(267LL, (int)result);
    }
  }

  return result;
}

uint64_t sub_100022BC4(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(result + 48);
  __int128 v4 = (uint64_t *)(result + 80);
  if (a3)
  {
    unint64_t v5 = (unsigned __int16 *)(v3 + 260);
  }

  else
  {
    __int128 v4 = (uint64_t *)(result + 64);
    unint64_t v5 = (unsigned __int16 *)(v3 + 256);
  }

  if (a3) {
    uint64_t v6 = v3 + 128;
  }
  else {
    uint64_t v6 = *(void *)(result + 48);
  }
  int v7 = *v5;
  uint64_t v8 = *v4;
  if ((unsigned __int16)(*v4 - v7) <= 0x3Fu)
  {
    uint64_t v11 = -2LL;
    if (v7 != (unsigned __int16)v8)
    {
      do
        v11 &= ~(1LL << *(_WORD *)(v6 + 2LL * (v7++ & 0x3F)));
      while ((unsigned __int16)v7 != (unsigned __int16)v8);
    }

    for (unint64_t i = *(void *)(v3 + 520) & v11; i; i &= ~(1LL << v13))
    {
      unint64_t v13 = __clz(__rbit64(i));
      unint64_t v14 = (unsigned __int16 *)(v3 + (v13 << 12));
      if (*v14 >= 0x11uLL && v14[19] && ((*((_BYTE *)v14 + 7) & 2) == 0) != a3) {
        uint64_t result = (*(uint64_t (**)(void))(*(void *)a2 + 16LL))();
      }
    }
  }

  else
  {
    *(_BYTE *)(result + 144) = 1;
  }

  return result;
}

void sub_100022D00(int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unable to open /dev/oslog";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022D28(int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unable to map kernel buffer";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022D50(uint64_t a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected kernel buffer size";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022D78(unsigned int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose libdispatch version mismatch (20180226)";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022DA0(unsigned int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose server version mismatch (20180226)";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022DC8()
{
  qword_10002DF48 = (uint64_t)"MIG_REPLY_MISMATCH";
  qword_10002DF78 = -301LL;
  __break(1u);
}

void sub_100022DF0(uint64_t a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Invalid firehose server queue type";
  qword_10002DF78 = a1;
  __break(1u);
}

uint64_t sub_100022E18(int a1, mach_vm_address_t *a2)
{
  return mach_vm_deallocate(mach_task_self_, *a2, 0x40000uLL);
}

void sub_100022E58(unsigned int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unknown recv-right";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022E80( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: recv-right leak";
  qword_10002DF78 = allocator;
  __break(1u);
  CFArrayCreate(allocator, values, numValues, callBacks);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}