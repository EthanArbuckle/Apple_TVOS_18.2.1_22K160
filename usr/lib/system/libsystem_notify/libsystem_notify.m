void sub_180280F04( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  v10 = 0LL;
  if (getpid() != 1)
  {
    vasprintf(&v10, a1, &a9);
    if (v10)
    {
      os_fault_with_payload();
      free(v10);
    }
  }
}

uint64_t sub_180280F7C(uint64_t a1)
{
  *(_DWORD *)(a1 + 208) = 1;
  *(void *)(a1 + 216) = 0xFFFFFFFF00000000LL;
  os_set_str_ptr_init();
  *(void *)(a1 + 32) = 8LL;
  os_set_64_ptr_init();
  *(void *)(a1 + 64) = 16LL;
  os_set_64_ptr_init();
  *(void *)(a1 + 96) = 64LL;
  os_set_32_ptr_init();
  *(void *)(a1 + 128) = 8LL;
  os_set_32_ptr_init();
  *(void *)(a1 + 160) = 16LL;
  return os_map_64_init();
}

void sub_18028102C(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895FEE08];
  if ((*(_BYTE *)(a2 + 79) & 0x20) != 0)
  {
    char v8 = *(_BYTE *)(a2 + 79) | 0x40;
    goto LABEL_31;
  }

  uint64_t v4 = os_set_32_ptr_find();
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 160);
    char v6 = *(_BYTE *)(a2 + 79);
    if (v5 != v4)
    {
      uint64_t v7 = v4 - v5;
      if ((*(_BYTE *)(v7 + 20) & 1) != 0)
      {
        ++*(_BYTE *)(a2 + 78);
        char v8 = v6 | 0x60;
        goto LABEL_31;
      }

      char v9 = 0;
      goto LABEL_8;
    }

    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 0LL;
    char v6 = *(_BYTE *)(a2 + 79);
  }

  char v9 = 1;
LABEL_8:
  switch(v6 & 0xF)
  {
    case 3:
      mach_port_t v10 = *(_DWORD *)(a2 + 56);
      goto LABEL_36;
    case 4:
      if ((*(_DWORD *)(a2 + 56) & 0x80000000) != 0) {
        goto LABEL_30;
      }
      unsigned int v24 = bswap32(*(_DWORD *)(a2 + 64));
      if (write_NOCANCEL() != 4)
      {
        close_NOCANCEL();
        *(_DWORD *)(a2 + 56) = -1;
        return;
      }

LABEL_29:
      char v6 = *(_BYTE *)(a2 + 79);
LABEL_30:
      char v8 = v6 & 0x3F;
      break;
    case 5:
      pid_t v11 = *(_DWORD *)(a2 + 68);
      if (!v11) {
        pid_t v11 = getpid();
      }
      if (!kill(v11, *(_DWORD *)(a2 + 56))) {
        goto LABEL_29;
      }
      return;
    case 6:
      xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v12, "Notification", *(const char **)(*(void *)(a2 + 48) + 8LL));
      uint64_t v13 = os_set_64_ptr_find();
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 64);
        if (v14 != v13) {
          xpc_dictionary_set_uint64(v12, "_State", *(void *)(v13 - v14 + 24));
        }
      }

      int v15 = xpc_event_publisher_fire_noboost();
      xpc_release(v12);
      if (!v15) {
        goto LABEL_29;
      }
      if (v15 == 55 && !*(_BYTE *)(a2 + 80))
      {
        *(_BYTE *)(a2 + 80) = 1;
        if (xpc_get_service_identifier_for_token())
        {
          if (os_variant_has_internal_diagnostics()) {
            sub_180280F04( "BUG IN CLIENT OF NOTIFYD: %s has not dequeued the last %d messages",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (char)&v24);
          }
        }
      }

      return;
    case 7:
      if ((v9 & 1) == 0)
      {
        uint64_t v23 = *(void *)(v7 + 24);
        if (v23)
        {
          mach_port_t v10 = *(_DWORD *)(v23 + 8);
LABEL_36:
          sub_1802812A0(a1, a2, v10);
        }
      }

      return;
    default:
      goto LABEL_30;
  }

LABEL_31:
  *(_BYTE *)(a2 + 79) = v8;
}

uint64_t sub_1802812A0(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v6 = os_set_32_ptr_find();
  if (v6 && (uint64_t v7 = *(void *)(a1 + 128), v7 != v6))
  {
    uint64_t v8 = v6 - v7;
    if ((*(_BYTE *)(v6 - v7 + 12) & 1) != 0)
    {
      uint64_t result = 0LL;
      ++*(_BYTE *)(a2 + 78);
      char v13 = *(_BYTE *)(a2 + 79) | 0x60;
      goto LABEL_16;
    }

    char v9 = 0;
  }

  else
  {
    uint64_t v8 = 0LL;
    char v9 = 1;
  }

  if ((*(_DWORD *)(a1 + 208) & 2) != 0) {
    mach_msg_option_t v10 = 145;
  }
  else {
    mach_msg_option_t v10 = 17;
  }
  *(void *)&msg.msgh_bits = 0x1800000013LL;
  msg.msgh_remote_port = a3;
  msg.msgh_local_port = 0;
  mach_msg_id_t v11 = *(_DWORD *)(a2 + 64);
  msg.msgh_voucher_port = 0;
  msg.msgh_id = v11;
  uint64_t result = mach_msg(&msg, v10, 0x18u, 0, 0, 0, 0);
  if (!(_DWORD)result)
  {
    char v13 = *(_BYTE *)(a2 + 79) & 0x3F;
LABEL_16:
    *(_BYTE *)(a2 + 79) = v13;
    return result;
  }

  if ((_DWORD)result != 268435460) {
    return 46LL;
  }
  mach_msg_destroy(&msg);
  if ((*(_BYTE *)(a1 + 208) & 2) == 0) {
    return 45LL;
  }
  ++*(_BYTE *)(a2 + 78);
  *(_BYTE *)(a2 + 79) |= 0xE0u;
  uint64_t result = 0LL;
  if ((v9 & 1) == 0) {
    *(_DWORD *)(v8 + 12) |= 1u;
  }
  return result;
}

void sub_1802813E8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = *(_DWORD *)(a2 + 56);
    if (!v4 || (int v5 = v4 - 1, (*(_DWORD *)(a2 + 56) = v5) == 0))
    {
      uint64_t v6 = *(unsigned int *)(a1 + 212);
      if ((_DWORD)v6)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = *(void **)(a1 + 192);
        while (1)
        {
          uint64_t v9 = v7 + 1;
          if (v8[v7] == a2) {
            break;
          }
          ++v7;
          if (v6 == v9) {
            goto LABEL_16;
          }
        }

        if ((int)v7 + 1 < v6)
        {
          do
          {
            ++v9;
          }

          while ((_DWORD)v6 != (_DWORD)v9);
          uint64_t v8 = *(void **)(a1 + 192);
        }

        unsigned int v10 = v6 - 1;
        *(_DWORD *)(a1 + 212) = v10;
        if (v10)
        {
          mach_msg_id_t v11 = reallocf(v8, 8LL * v10);
        }

        else
        {
          free(v8);
          mach_msg_id_t v11 = 0LL;
        }

        *(void *)(a1 + 192) = v11;
      }

LABEL_16:
      sub_1802899AC(a1 + 8, *(void *)(a2 + 8), a2 + 8);
      *(void *)(a2 + 8) = 0LL;
      sub_1802899F4(a1 + 40, *(void *)(a2 + 16), a2 + 16);
      free((void *)a2);
      ++*(_DWORD *)(a1 + 228);
    }
  }

        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v18,  v19,  v20,  v21,  v22,  v23,  (char)"_notify_register_dispatch_with_extra_mp");
      }
    }
  }

  return v12;
}

void sub_1802814E4(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(a1 + 216);
  os_unfair_lock_lock_with_options();
  uint64_t v3 = os_set_64_ptr_find();
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 96);
    int v5 = (uint64_t *)(v3 - v4);
    if (v3 != v4)
    {
      uint64_t v6 = v5[6];
      uint64_t v7 = *v5;
      if (*v5) {
        *(void *)(v7 + 8) = v5[1];
      }
      *(void *)v5[1] = v7;
      sub_1802899F4(a1 + 72, v5[8], (uint64_t)(v5 + 8));
      int v8 = *((_BYTE *)v5 + 79) & 0xF;
      if (v8 == 3)
      {
        mach_port_deallocate(*MEMORY[0x1895FFD48], *((_DWORD *)v5 + 14));
      }

      else if (v8 == 4 && (v5[7] & 0x80000000) == 0)
      {
        close_NOCANCEL();
      }

      free(v5);
      ++*(_DWORD *)(a1 + 236);
      sub_1802813E8(a1, v6);
    }
  }

  os_unfair_lock_unlock(v2);
}

uint64_t sub_1802815D4(uint64_t a1, const char *a2, unsigned int a3, void *a4)
{
  if (!a4) {
    return 0LL;
  }
  if (!a2) {
    return 7LL;
  }
  *a4 = 0LL;
  uint64_t v8 = os_set_str_ptr_find();
  if (!v8 || (uint64_t v9 = *(void *)(a1 + 32), v10 = v8 - v9, v8 == v9))
  {
    size_t v11 = strlen(a2);
    xpc_object_t v12 = (char *)calloc(1uLL, v11 + 73);
    if (!v12) {
      return 47LL;
    }
    uint64_t v10 = (uint64_t)v12;
    ++*(_DWORD *)(a1 + 224);
    char v13 = v12 + 72;
    *(void *)(v10 + 8) = v13;
    memcpy(v13, a2, v11 + 1);
    uint64_t v14 = *(void *)a1 + 1LL;
    *(void *)(v10 + 16) = *(void *)a1;
    *(void *)a1 = v14;
    *(void *)(v10 + 48) = -4294966477LL;
    *(_DWORD *)(v10 + 60) = 1;
    *(void *)uint64_t v10 = 0LL;
    os_set_str_ptr_insert();
    os_set_64_ptr_insert();
  }

  ++*(_DWORD *)(v10 + 56);
  uint64_t v15 = os_set_64_ptr_find();
  if ((!v15 || *(void *)(a1 + 96) == v15) && (uint64_t v16 = calloc(1uLL, 0x58uLL)) != 0LL)
  {
    uint64_t v17 = v16;
    ++*(_DWORD *)(a1 + 232);
    v16[8] = a3;
    v16[6] = v10;
    uint64_t v18 = *(void *)v10;
    *uint64_t v16 = *(void *)v10;
    if (v18) {
      *(void *)(v18 + 8) = v16;
    }
    *(void *)uint64_t v10 = v16;
    v16[1] = v10;
    os_set_64_ptr_insert();
    uint64_t result = 0LL;
    *a4 = v17;
  }

  else
  {
    sub_1802813E8(a1, v10);
    return 48LL;
  }

  return result;
}

uint64_t sub_180281778(uint64_t a1, const char *a2, unsigned int a3, void *a4)
{
  uint64_t v12 = 0LL;
  uint64_t v8 = (os_unfair_lock_s *)(a1 + 216);
  os_unfair_lock_lock_with_options();
  uint64_t v9 = sub_1802815D4(a1, a2, a3, &v12);
  if (!(_DWORD)v9)
  {
    uint64_t v10 = v12;
    *(_BYTE *)(v12 + 79) = *(_BYTE *)(v12 + 79) & 0xF0 | 2;
    *a4 = *(void *)(*(void *)(v10 + 48) + 16LL);
  }

  os_unfair_lock_unlock(v8);
  return v9;
}

BOOL notify_is_valid_token(int val)
{
  uint64_t v1 = sub_180281890();
  v2 = (os_unfair_lock_s *)(v1 + 104);
  os_unfair_lock_lock_with_options();
  uint64_t v3 = os_set_32_ptr_find();
  v5 = v3 && (uint64_t v4 = *(void *)(v1 + 448), v4 != v3) && (*(_BYTE *)(v3 - v4 + 27) & 8) == 0;
  os_unfair_lock_unlock(v2);
  return v5;
}

uint64_t sub_180281890()
{
  v15[3] = *MEMORY[0x1895FEE08];
  if (*MEMORY[0x1895FF8E0] == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 8LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if ((++qword_18C444A08 & 3) != 0) {
    return v0;
  }
  uint64_t v1 = 0LL;
  uint64_t v2 = 0LL;
  unint64_t v3 = 0LL;
  do
  {
    uint64_t v4 = *(void *)(v0 + 8 * v2);
    if (v4 == 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_6;
    }
    v1 |= 1LL << v2;
    if (v3)
    {
      if (v3 > 2) {
        goto LABEL_6;
      }
    }

    else
    {
      memset(v15, 0, 24);
    }

    v15[v3++] = v4;
LABEL_6:
    ++v2;
  }

  while (v2 != 13);
  if (v1)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics) {
      sub_180280F04( "BUG IN LIBNOTIFY CLIENT: internal data structure corrupted [0x%04llx, 0x%llx, 0x%llx, 0x%llx]]",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v1);
    }
    else {
      sub_180281A70( has_internal_diagnostics,  "BUG IN LIBNOTIFY CLIENT: internal data structure corrupted [0x%04llx, 0x%llx, 0x%llx, 0x%llx]]",  v7,  v8,  v9,  v10,  v11,  v12,  v1);
    }
    *(void *)(v0 + 96) = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)(v0 + 64) = v13;
    *(_OWORD *)(v0 + 80) = v13;
    *(_OWORD *)(v0 + 32) = v13;
    *(_OWORD *)(v0 + 48) = v13;
    *(_OWORD *)uint64_t v0 = v13;
    *(_OWORD *)(v0 + 16) = v13;
  }

  return v0;
}

uint64_t sub_1802819F0(uint64_t a1)
{
  *(void *)(a1 + 96) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)(a1 + 64) = v2;
  *(_OWORD *)(a1 + 80) = v2;
  *(_OWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v2;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 488) = 1;
  *(_DWORD *)(a1 + 396) = -1;
  *(_DWORD *)(a1 + 108) = 0;
  os_set_str_ptr_init();
  *(void *)(a1 + 480) = 32LL;
  os_set_32_ptr_init();
  *(void *)(a1 + 448) = 20LL;
  return sub_180280F7C(a1 + 128);
}

void sub_180281A70( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v10[0] = 0LL;
  v10[1] = &a9;
  vasprintf(v10, a2, &a9);
  if (v10[0])
  {
    _simple_asl_log();
    uint64_t v9 = v10[0];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  free(v9);
}

double _notify_fork_child()
{
  uint64_t v0 = sub_180281890();
  sub_1802819F0(v0);
  sub_180280F7C(v0 + 128);
  *(_DWORD *)(v0 + 384) = 0;
  *(_DWORD *)(v0 + 112) = 0;
  *(_DWORD *)(v0 + 512) = 0;
  *(void *)(v0 + 592) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v0 + 520) = 0u;
  *(_OWORD *)(v0 + 536) = 0u;
  *(void *)(v0 + 552) = 0LL;
  return result;
}

void notify_set_options(int a1)
{
  uint64_t v2 = sub_180281890();
  unint64_t v3 = (_DWORD *)v2;
  if ((*(_DWORD *)(v2 + 116) & 0x8000000) != 0)
  {
    if ((a1 & 0x4000000) == 0)
    {
      *(_DWORD *)(v2 + 120) |= a1;
      return;
    }

    uint64_t v6 = (os_unfair_lock_s *)(v2 + 104);
    os_unfair_lock_lock_with_options();
    v3[29] = v3[30];
    v3[96] = v3[97];
    goto LABEL_11;
  }

  uint64_t v4 = (unsigned int *)(v2 + 116);
  if ((a1 & 0x8000000) != 0)
  {
    uint64_t v6 = (os_unfair_lock_s *)(v2 + 104);
    os_unfair_lock_lock_with_options();
    do
      unsigned int v7 = __ldxr(v4);
    while (__stxr(0x8000000u, v4));
    v3[30] = v7;
    v3[97] = v3[96];
    v3[96] = 0;
LABEL_11:
    os_unfair_lock_unlock(v6);
    return;
  }

  do
    unsigned int v5 = __ldxr(v4);
  while (__stxr(v5 | a1, v4));
  sub_180281C00(v2);
}

uint64_t sub_180281C00(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 104);
  os_unfair_lock_lock_with_options();
  sub_180281C48(a1, 0);
  uint64_t v4 = v3;
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_180281C48(uint64_t a1, int a2)
{
  kern_return_t v14;
  int v15;
  uintptr_t v16;
  dispatch_queue_global_t global_queue;
  dispatch_source_s *v18;
  int v19;
  mach_port_t special_reply_port;
  mach_msg_return_t v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t *v25;
  unsigned int v26;
  int v27;
  dispatch_source_s *v28;
  dispatch_source_s *v29;
  int v30;
  void block[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  char *__lasts;
  uint64_t v37;
  uint64_t v38;
  mach_msg_header_t name;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  v44 = *MEMORY[0x1895FEE08];
  v32 = 0LL;
  v33 = &v32;
  v34 = 0x2000000000LL;
  if ((*(_DWORD *)(a1 + 116) & 0x8000000) != 0) {
    goto LABEL_45;
  }
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 104));
  if (os_variant_has_internal_diagnostics() && (uint64_t v4 = getenv("DarwinNotificationLogging")) != 0LL)
  {
    unsigned int v5 = v4;
    if (!strcmp(v4, "1"))
    {
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        *(void *)&name.msgh_bits = 0LL;
        *(void *)&name.msgh_remote_port = 0LL;
      }

      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }

      else
      {
        v37 = 0LL;
        v38 = 0LL;
      }

      _os_log_simple();
      uint64_t v6 = &unk_18C5128F8;
    }

    else
    {
      uint64_t v6 = calloc(1uLL, 0x20uLL);
      *uint64_t v6 = 0;
      os_set_str_ptr_init();
      unsigned int v7 = strdup(v5);
      uint64_t v8 = strtok_r(v7, ",", &__lasts);
      if (v8)
      {
        uint64_t v9 = v8;
        do
        {
          uint64_t v10 = calloc(1uLL, 8uLL);
          *uint64_t v10 = strdup(v9);
          os_set_str_ptr_insert();
          if ((_dyld_get_image_uuid() & 1) == 0)
          {
            *(void *)&name.msgh_bits = 0LL;
            *(void *)&name.msgh_remote_port = 0LL;
          }

          if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          {
            _dyld_get_shared_cache_range();
          }

          else
          {
            v37 = 0LL;
            v38 = 0LL;
          }

          _os_log_simple();
          uint64_t v9 = strtok_r(0LL, ",", &__lasts);
        }

        while (v9);
      }

      free(v7);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v11 = (unsigned int *)(a1 + 116);
  *(void *)(a1 + 584) = v6;
  if (_dispatch_is_multithreaded())
  {
    do
      unsigned int v12 = __ldxr(v11);
    while (__stxr(v12 | 3, v11));
  }

  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10 && (*v11 & 1) != 0)
  {
    if ((*(_DWORD *)(a1 + 392) + 1) <= 1)
    {
      name.msgh_bits = 0;
      uint64_t v14 = mach_port_allocate(*MEMORY[0x1895FFD48], 1u, &name.msgh_bits);
      *((_DWORD *)v33 + 6) = v14;
      if (!v14) {
        sub_1802822E4(a1, name.msgh_bits);
      }
    }

    goto LABEL_45;
  }

  *((_DWORD *)v33 + 6) = 0;
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = sub_1802823A0;
  block[3] = &unk_189638B40;
  block[4] = &v32;
  block[5] = a1;
  if (*(void *)(a1 + 376) != -1LL) {
    dispatch_once((dispatch_once_t *)(a1 + 376), block);
  }
  if (*((_DWORD *)v33 + 6) || (mach_port_t v13 = *(_DWORD *)(a1 + 384), v13 + 1 < 2))
  {
LABEL_45:
    _Block_object_dispose(&v32, 8);
    return;
  }

  uint64_t v15 = *(_DWORD *)(a1 + 112);
  if (a2 != 1 && v15)
  {
LABEL_36:
    if (!*(void *)(a1 + 408) && (*v11 & 2) != 0)
    {
      uint64_t v16 = *(int *)(a1 + 112);
      if ((_DWORD)v16)
      {
        global_queue = dispatch_get_global_queue(2LL, 0LL);
        uint64_t v18 = dispatch_source_create(MEMORY[0x1895FE820], v16, 0x80000000uLL, global_queue);
        *(void *)(a1 + 408) = v18;
        dispatch_source_set_event_handler_f(v18, (dispatch_function_t)sub_1802823F0);
        dispatch_resume(*(dispatch_object_t *)(a1 + 408));
      }
    }

    if ((*v11 & 1) != 0 && (*(_DWORD *)(a1 + 392) + 1) <= 1)
    {
      uint64_t v19 = sub_180289DD4(*(_DWORD *)(a1 + 384), &v37, &name);
      *((_DWORD *)v33 + 6) = v19;
      if (!v19 && !(_DWORD)v37) {
        sub_1802822E4(a1, name.msgh_bits);
      }
    }

    goto LABEL_45;
  }

  *(_DWORD *)(a1 + 112) = 0;
  special_reply_port = mig_get_special_reply_port();
  name.msgh_remote_port = v13;
  name.msgh_local_port = special_reply_port;
  name.msgh_bits = 5395;
  *(void *)&name.msgh_voucher_port = 0x3FF00000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&name);
    special_reply_port = name.msgh_local_port;
  }

  uint64_t v21 = mach_msg(&name, 3227651, 0x18u, 0x38u, special_reply_port, 0, 0);
  uint64_t v22 = v21;
  if ((v21 - 268435458) <= 0xE && ((1 << (v21 - 2)) & 0x4003) != 0)
  {
    *((_DWORD *)v33 + 6) = v21;
LABEL_74:
    unsigned int v24 = sub_18028A13C(*(_DWORD *)(a1 + 384), &__lasts, &v35, &v37);
    uint64_t v25 = v33;
    *((_DWORD *)v33 + 6) = v24;
    if (!v24)
    {
      do
        v26 = __ldxr(v11);
      while (__stxr(v26 | 7, v11));
      unsigned int v24 = *((_DWORD *)v25 + 6);
    }

    if (v24 || (_DWORD)v37) {
      goto LABEL_45;
    }
    goto LABEL_79;
  }

  if (v21)
  {
    mig_dealloc_special_reply_port();
    goto LABEL_73;
  }

  if (name.msgh_id == 71)
  {
    uint64_t v22 = -308;
LABEL_72:
    mach_msg_destroy(&name);
LABEL_73:
    *((_DWORD *)v33 + 6) = v22;
    if (!v22) {
      goto LABEL_79;
    }
    goto LABEL_74;
  }

  if (name.msgh_id != 1123)
  {
    uint64_t v22 = -301;
    goto LABEL_72;
  }

  if ((name.msgh_bits & 0x80000000) != 0) {
    goto LABEL_71;
  }
  if (name.msgh_size != 48)
  {
    if (name.msgh_size == 36)
    {
      if (name.msgh_remote_port) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v40 == 0;
      }
      if (v23) {
        uint64_t v22 = -300;
      }
      else {
        uint64_t v22 = v40;
      }
      goto LABEL_72;
    }

    goto LABEL_71;
  }

  if (name.msgh_remote_port)
  {
LABEL_71:
    uint64_t v22 = -300;
    goto LABEL_72;
  }

  uint64_t v22 = v40;
  if (v40) {
    goto LABEL_72;
  }
  LODWORD(__lasts) = v41;
  v35 = v42;
  v30 = v43;
  LODWORD(v37) = v43;
  *((_DWORD *)v33 + 6) = 0;
  if (v30) {
    goto LABEL_45;
  }
LABEL_79:
  if (__lasts > 2)
  {
    v27 = v35;
    *(_DWORD *)(a1 + 112) = v35;
    if (a2 == 1 && v27 == v15) {
      goto LABEL_45;
    }
    v28 = *(dispatch_source_s **)(a1 + 408);
    if (v28)
    {
      dispatch_source_cancel(v28);
      dispatch_release(*(dispatch_object_t *)(a1 + 408));
      *(void *)(a1 + 408) = 0LL;
    }

    if ((*(_DWORD *)(a1 + 392) + 1) >= 2)
    {
      v29 = *(dispatch_source_s **)(a1 + 400);
      if (v29)
      {
        dispatch_source_cancel(v29);
        dispatch_release(*(dispatch_object_t *)(a1 + 400));
        *(void *)(a1 + 400) = 0LL;
      }

      *(_DWORD *)(a1 + 392) = 0;
    }

    goto LABEL_36;
  }

  qword_18C512920 = (uint64_t)"BUG IN LIBNOTIFY: Unsupported protocol version";
  qword_18C512950 = __lasts;
  __break(1u);
}

void sub_1802822E4(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 392) = a2;
  uintptr_t v4 = a2;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895FE808], v4, 0LL, global_queue);
  *(void *)(a1 + 400) = v6;
  dispatch_set_context(v6, (void *)a1);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 400), (dispatch_function_t)sub_180282974);
  unsigned int v7 = *(dispatch_source_s **)(a1 + 400);
  handler[0] = MEMORY[0x1895FED80];
  handler[1] = 0x40000000LL;
  handler[2] = sub_180282A54;
  handler[3] = &unk_189638B60;
  unsigned int v9 = a2;
  dispatch_source_set_cancel_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 400));
}

uint64_t sub_1802823A0(uint64_t a1)
{
  uint64_t result = bootstrap_look_up2();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_1802823F0()
{
  uint64_t v0 = (os_unfair_lock_s *)sub_180281890();
  os_unfair_lock_lock_with_options();
  sub_18028242C((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 26);
}

uint64_t sub_18028242C(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 116) & 2) == 0) {
    return 0LL;
  }
  uint64_t v1 = sub_180281C48();
  if ((_DWORD)v1 == 57) {
    return 0LL;
  }
  uint64_t v2 = v1;
  if (!(_DWORD)v1) {
    os_set_32_ptr_foreach();
  }
  return v2;
}

uint64_t sub_1802824C0(uint64_t a1, uint64_t a2)
{
  mach_msg_return_t v20;
  int v21;
  BOOL v22;
  int v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  int has_internal_diagnostics;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  int v48;
  unsigned int v49;
  mach_msg_header_t msg;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  int v58;
  int v59;
  char v60[552];
  uint64_t v61;
  v61 = *MEMORY[0x1895FEE08];
  v48 = -1;
  v47 = -1LL;
  uint64_t v3 = *(const char **)(*(void *)(a2 + 104) + 32LL);
  v45 = sub_180281890();
  if (*(_DWORD *)(a2 + 24) >> 30 != 1) {
    return 1LL;
  }
  uid_t v4 = geteuid();
  if (v4)
  {
    uid_t v5 = v4;
    if (!strncmp(v3, "user.uid.", 9uLL))
    {
      snprintf((char *)&msg, 0x3FuLL, "%s%d", "user.uid.", v5);
      v34 = strlen((const char *)&msg);
      if (strncmp(v3, (const char *)&msg, v34) || v3[v34] && v3[v34] != 46)
      {
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        v36 = geteuid();
        if (has_internal_diagnostics) {
          sub_180280F04( "BUG IN LIBNOTIFY CLIENT: registration held for restricted name %s with process uid %d",  v37,  v38,  v39,  v40,  v41,  v42,  v43,  (char)v3);
        }
        else {
          sub_180281A70( v36,  "BUG IN LIBNOTIFY CLIENT: registration held for restricted name %s with process uid %d",  v38,  v39,  v40,  v41,  v42,  v43,  (char)v3);
        }
      }
    }
  }

  dispatch_source_t v6 = *(const char **)(a2 + 88);
  if (v6) {
    int v7 = strlen(v6) + 1;
  }
  else {
    int v7 = 0;
  }
  int v8 = *(_DWORD *)(a2 + 24) & 0xF;
  int v9 = -51;
  v44 = v3;
  while (1)
  {
    mach_port_t v10 = *(_DWORD *)(v45 + 384);
    int v11 = *(_DWORD *)(a2 + 20);
    if ((*(_DWORD *)(v45 + 116) & 4) != 0)
    {
      unsigned int v24 = v8 == 5 ? *(_DWORD *)(a2 + 40) : 0;
      uint64_t v21 = sub_18028A390( v10,  v3,  v11,  v8,  v24,  *(_DWORD *)(a2 + 28),  *(void *)(a2 + 72),  *(void *)(a2 + 80),  *(void *)(a2 + 88),  v7,  *(_DWORD *)(a2 + 96),  &v48,  &v47,  (int *)&v49);
    }

    else
    {
      if (v8 == 5) {
        int v12 = *(_DWORD *)(a2 + 40);
      }
      else {
        int v12 = 0;
      }
      int v13 = *(_DWORD *)(a2 + 28);
      v46 = *(_OWORD *)(a2 + 72);
      uint64_t v14 = *(void *)(a2 + 88);
      int v15 = *(_DWORD *)(a2 + 96);
      v51 = 2LL;
      v53 = 1310720;
      v54 = v14;
      v55 = 16777472;
      v56 = v7;
      v57 = *MEMORY[0x1895FF688];
      if (MEMORY[0x1895FFE18]) {
        int v16 = mig_strncpy_zerofill(v60, v3, 512);
      }
      else {
        int v16 = mig_strncpy(v60, v3, 512);
      }
      v58 = 0;
      v59 = v16;
      uint64_t v17 = (v16 + 3) & 0xFFFFFFFC;
      uint64_t v18 = (char *)&msg + v17 - 512;
      *((_DWORD *)v18 + 146) = v11;
      *((_DWORD *)v18 + 147) = v8;
      *((_DWORD *)v18 + 148) = v12;
      *((_DWORD *)v18 + 149) = v13;
      *(_OWORD *)(v18 + 600) = v46;
      *((_DWORD *)v18 + 154) = v7;
      *((_DWORD *)v18 + 155) = v15;
      mach_port_t special_reply_port = mig_get_special_reply_port();
      msg.msgh_remote_port = v10;
      msg.msgh_local_port = special_reply_port;
      msg.msgh_bits = -2147478253;
      *(void *)&msg.msgh_voucher_port = 0x3FE00000000LL;
      if (MEMORY[0x189600168])
      {
        voucher_mach_msg_set(&msg);
        mach_port_t special_reply_port = msg.msgh_local_port;
      }

      uint64_t v20 = mach_msg(&msg, 3227651, v17 + 112, 0x3Cu, special_reply_port, 0, 0);
      uint64_t v21 = v20;
      if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
      {
        uint64_t v3 = v44;
        goto LABEL_38;
      }

      uint64_t v3 = v44;
      if (v20)
      {
        mig_dealloc_special_reply_port();
        goto LABEL_38;
      }

      if (msg.msgh_id == 71)
      {
        uint64_t v21 = -308;
        goto LABEL_37;
      }

      if (msg.msgh_id != 1122)
      {
        uint64_t v21 = -301;
        goto LABEL_37;
      }

      if ((msg.msgh_bits & 0x80000000) != 0) {
        goto LABEL_36;
      }
      if (msg.msgh_size != 52)
      {
        if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v52 == 0;
          }
          if (v22) {
            uint64_t v21 = -300;
          }
          else {
            uint64_t v21 = v52;
          }
        }

        else
        {
LABEL_36:
          uint64_t v21 = -300;
        }

LABEL_37:
        mach_msg_destroy(&msg);
        goto LABEL_38;
      }

      if (msg.msgh_remote_port) {
        goto LABEL_36;
      }
      uint64_t v21 = v52;
      if (v52) {
        goto LABEL_37;
      }
      v47 = v54;
      v48 = v53;
      v49 = v55;
    }

LABEL_38:
    if (!v21) {
      break;
    }
    usleep_NOCANCEL();
    if (__CFADD__(v9++, 1)) {
      __assert_rtn("_notify_lib_regenerate_registration", "notify_client.c", 1494, "kstatus == KERN_SUCCESS");
    }
  }

  if (v49 > 0x39 || ((1LL << v49) & 0x208000000000001LL) == 0)
  {
    v26 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v26) {
      sub_180280F04( "Libnotify: _notify_server_regnerate failed for name %s with status %d (flags: %x, token %d)",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (char)v3);
    }
    else {
      sub_180281A70( v26,  "Libnotify: _notify_server_regnerate failed for name %s with status %d (flags: %x, token %d)",  v28,  v29,  v30,  v31,  v32,  v33,  (char)v3);
    }
  }

  *(_DWORD *)(a2 + 28) = v48;
  **(void **)(a2 + 104) = v47;
  return 1LL;
}

void sub_180282974(uint64_t a1)
{
  mach_port_name_t v1 = *(_DWORD *)(a1 + 392);
  if (v1)
  {
    int v2 = 4;
    do
    {
      int v3 = v2;
      memset(v9, 0, sizeof(v9));
      if (mach_msg((mach_msg_header_t *)v9, 258, 0, 0x20u, v1, 0, 0)) {
        break;
      }
      uint64_t v4 = sub_180282A74();
      if (v4)
      {
        uid_t v5 = (char *)v4;
        uint64_t v6 = *(void *)(v4 + 104);
        if (v6)
        {
          int v7 = (os_unfair_lock_s *)(v6 + 40);
          os_unfair_lock_lock_with_options();
          if ((v5[27] & 8) != 0)
          {
            for (i = *(char **)(v6 + 8); i; i = *(char **)i)
            {
              if (i != v5) {
                sub_180282B44((uint64_t)i);
              }
            }
          }

          else
          {
            sub_180282B44((uint64_t)v5);
          }

          os_unfair_lock_unlock(v7);
        }

        sub_180282AF8(v5);
      }

      int v2 = v3 - 1;
    }

    while (v3);
  }

uint64_t sub_180282A54(uint64_t a1)
{
  return mach_port_destruct(*MEMORY[0x1895FFD48], *(_DWORD *)(a1 + 32), 0, 0LL);
}

uint64_t sub_180282A74()
{
  uint64_t v0 = sub_180281890();
  mach_port_name_t v1 = (os_unfair_lock_s *)(v0 + 104);
  os_unfair_lock_lock_with_options();
  uint64_t v2 = os_set_32_ptr_find();
  if (v2 && (uint64_t v3 = *(void *)(v0 + 448), v3 != v2))
  {
    uint64_t v4 = v2 - v3;
    uid_t v5 = (unsigned int *)(v2 - v3 + 16);
    do
      unsigned int v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  os_unfair_lock_unlock(v1);
  return v4;
}

void sub_180282AF8(char *a1)
{
  uint64_t v2 = (os_unfair_lock_s *)sub_180281890();
  os_unfair_lock_lock_with_options();
  sub_180282CB4((uint64_t)v2, a1);
  os_unfair_lock_unlock(v2 + 26);
}

void sub_180282B44(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      int v3 = *(_DWORD *)(a1 + 24);
      if ((v3 & 0x800000) != 0)
      {
        *(_DWORD *)(a1 + 24) = v3 | 0x400000;
      }

      else
      {
        int v4 = *(_DWORD *)(a1 + 20);
        uid_t v5 = _Block_copy(v2);
        unsigned int v6 = *(dispatch_queue_s **)(a1 + 48);
        dispatch_retain(v6);
        v8[0] = MEMORY[0x1895FED80];
        v8[1] = 0x40000000LL;
        v8[2] = sub_180282C34;
        v8[3] = &unk_189638DB8;
        int v9 = v4;
        v8[4] = v5;
        v8[5] = 0LL;
        v8[6] = v6;
        dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v8);
        dispatch_async(v6, v7);
        _Block_release(v7);
      }
    }
  }

void sub_180282C34(uint64_t a1)
{
  if (notify_is_valid_token(*(_DWORD *)(a1 + 56))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    free(v2);
  }
}

void sub_180282CB4(uint64_t a1, char *a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 104);
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 104));
  if (!a2) {
    return;
  }
  uid_t v5 = (unsigned int *)(a2 + 16);
  do
  {
    unsigned int v6 = __ldxr(v5);
    signed int v7 = v6 - 1;
  }

  while (__stlxr(v7, v5));
  if (v7 < 0) {
    goto LABEL_62;
  }
  if (v7) {
    return;
  }
  __dmb(9u);
  os_unfair_lock_assert_owner(v4);
  int v8 = *((_DWORD *)a2 + 5);
  int v9 = *((_DWORD *)a2 + 6);
  os_unfair_lock_assert_owner(v4);
  uint64_t v10 = *((void *)a2 + 13);
  if (sub_18028317C())
  {
    _dyld_get_image_uuid();
    if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
      _dyld_get_shared_cache_range();
    }
    _os_log_simple();
  }

  int v11 = *((_DWORD *)a2 + 6);
  if ((v11 & 0x4000000) != 0)
  {
    os_unfair_lock_assert_owner(v4);
    os_unfair_lock_lock_with_options();
    uint64_t v12 = *(void *)a2;
    int v13 = (void *)*((void *)a2 + 1);
    if (*(void *)a2)
    {
      *(void *)(v12 + 8) = v13;
      int v13 = (void *)*((void *)a2 + 1);
    }

    else
    {
      *(void *)(v10 + 16) = v13;
    }

    *int v13 = v12;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 40));
    sub_180282CB4(a1, *(void *)(v10 + 24));
  }

  else if ((v11 & 0x8000000) != 0)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(v10 + 48) = -1;
    *(void *)(v10 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 40));
    sub_180289D5C(*(_DWORD *)(a1 + 384), *((_DWORD *)a2 + 5));
  }

  int v14 = *((_DWORD *)a2 + 9);
  os_unfair_lock_assert_owner(v4);
  if (v14 < 0) {
    goto LABEL_39;
  }
  unint64_t v15 = *(unsigned int *)(a1 + 512);
  if (!(_DWORD)v15) {
    goto LABEL_39;
  }
  unint64_t v16 = 0LL;
  do
  {
    if (*(_DWORD *)(*(void *)(a1 + 520) + 4 * v16) == v14) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    ++v16;
  }

  while (v16 < v15 && (_DWORD)v17 == -1);
  if ((_DWORD)v17 == -1) {
    goto LABEL_39;
  }
  uint64_t v18 = *(void *)(a1 + 536);
  int v19 = *(_DWORD *)(v18 + 4LL * v17);
  BOOL v20 = __OFSUB__(v19, 1);
  int v21 = v19 - 1;
  if (v21 < 0 == v20)
  {
    *(_DWORD *)(v18 + 4 * v17) = v21;
    if (v21) {
      goto LABEL_39;
    }
  }

  close_NOCANCEL();
  close_NOCANCEL();
  LODWORD(v22) = *(_DWORD *)(a1 + 512);
  if ((_DWORD)v22 == 1)
  {
    uint64_t v23 = *(void **)(a1 + 520);
LABEL_38:
    free(v23);
    *(void *)(a1 + 520) = 0LL;
    free(*(void **)(a1 + 528));
    *(void *)(a1 + 528) = 0LL;
    free(*(void **)(a1 + 536));
    *(void *)(a1 + 536) = 0LL;
    *(_DWORD *)(a1 + 512) = 0;
    goto LABEL_39;
  }

  unint64_t v24 = (v17 + 1);
  uint64_t v25 = *(_DWORD **)(a1 + 520);
  if (v24 < v22)
  {
    unsigned int v26 = v16 - 1;
    uint64_t v27 = *(void *)(a1 + 528);
    uint64_t v28 = *(void *)(a1 + 536);
    do
    {
      v25[v26] = v25[v24];
      *(_DWORD *)(v27 + 4LL * v26) = *(_DWORD *)(v27 + 4 * v24);
      *(_DWORD *)(v28 + 4LL * v26++) = *(_DWORD *)(v28 + 4 * v24++);
      unint64_t v22 = *(unsigned int *)(a1 + 512);
    }

    while (v24 < v22);
  }

  *(_DWORD *)(a1 + 512) = v22 - 1;
  *(void *)(a1 + 520) = reallocf(v25, 4LL * (v22 - 1));
  *(void *)(a1 + 528) = reallocf(*(void **)(a1 + 528), 4LL * *(unsigned int *)(a1 + 512));
  v29 = reallocf(*(void **)(a1 + 536), 4LL * *(unsigned int *)(a1 + 512));
  *(void *)(a1 + 536) = v29;
  uint64_t v23 = *(void **)(a1 + 520);
  if (!v23 || !v29 || !*(void *)(a1 + 528)) {
    goto LABEL_38;
  }
LABEL_39:
  sub_1802831D0(a1, *((_DWORD *)a2 + 11), *((_DWORD *)a2 + 6));
  if ((*((_DWORD *)a2 + 6) & 0xF) == 7)
  {
    mach_port_name_t v30 = *((_DWORD *)a2 + 10);
    if (v30) {
      sub_1802831D0(a1, v30, *((_DWORD *)a2 + 6) | 0x20000000);
    }
  }

  free(*((void **)a2 + 11));
  v31 = (void *)*((void *)a2 + 7);
  if (v31) {
    dispatch_async_f(*((dispatch_queue_t *)a2 + 6), v31, (dispatch_function_t)MEMORY[0x1895FED70]);
  }
  *((void *)a2 + 7) = 0LL;
  v32 = (dispatch_object_s *)*((void *)a2 + 6);
  if (v32) {
    dispatch_release(v32);
  }
  free(a2);
  os_unfair_lock_assert_owner(v4);
  if (!v10) {
    goto LABEL_51;
  }
  v33 = (unsigned int *)(v10 + 44);
  do
  {
    unsigned int v34 = __ldxr(v33);
    signed int v35 = v34 - 1;
  }

  while (__stlxr(v35, v33));
  if (v35 < 0) {
LABEL_62:
  }
    __assert_rtn("atomic_refcount_release", "notify_client.c", 293, "result >= 0");
  if (!v35)
  {
    __dmb(9u);
    sub_180283344((os_unfair_lock_s *)a1, v10);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_52;
    }
LABEL_61:
    sub_1802814E4(a1 + 128);
    return;
  }

LABEL_51:
  if (v9 < 0) {
    goto LABEL_61;
  }
LABEL_52:
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10)
  {
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
  }

  if ((v9 & 0xC000000) == 0)
  {
    uint64_t v36 = sub_180289D5C(*(_DWORD *)(a1 + 384), v8);
    if ((_DWORD)v36 != -308)
    {
      if ((_DWORD)v36)
      {
        if ((_DWORD)v36 != 268435459) {
          sub_180281A70( v36,  "<- %s [%d] _notify_server_cancel_2 failed: 0x%08x\n",  v37,  v38,  v39,  v40,  v41,  v42,  (char)"registration_node_delete_locked");
        }
      }
    }
  }

BOOL sub_18028317C()
{
  uint64_t v0 = *(_BYTE **)(sub_180281890() + 584);
  if (!v0) {
    return 0LL;
  }
  if (*v0) {
    return 1LL;
  }
  return os_set_str_ptr_find() != 0;
}

void sub_1802831D0(uint64_t a1, mach_port_name_t a2, int a3)
{
  unsigned int v6 = *(_DWORD **)(a1 + 552);
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 104));
  if (a2)
  {
    if (*(_DWORD *)(a1 + 392) != a2)
    {
      uint64_t v7 = *(unsigned int *)(a1 + 544);
      if ((_DWORD)v7)
      {
        uint64_t v8 = 0LL;
        int v9 = (unsigned int *)(a1 + 544);
        for (i = v6; *i != a2; i += 3)
        {
          if (v7 == ++v8) {
            return;
          }
        }

        int v11 = (char *)&v6[3 * v8];
        int v14 = *((_DWORD *)v11 + 1);
        uint64_t v12 = v11 + 4;
        int v13 = v14;
        if (v14 < 2)
        {
          if (LOBYTE(v6[3 * v8 + 2]))
          {
            mach_port_destruct(*MEMORY[0x1895FFD48], a2, (4 * a3) >> 31, 0LL);
          }

          else if ((a3 & 0x20000000) != 0)
          {
            mach_port_deallocate(*MEMORY[0x1895FFD48], a2);
          }

          unsigned int v15 = *v9 - 1;
          *int v9 = v15;
          if (v15 != (_DWORD)v8)
          {
            unint64_t v16 = (char *)&v6[3 * v15];
            uint64_t v17 = *(void *)v16;
            i[2] = *((_DWORD *)v16 + 2);
            *(void *)i = v17;
            LODWORD(v8) = *v9;
          }

          if ((_DWORD)v8)
          {
            uint64_t v18 = *(unsigned int *)(a1 + 548);
            if (v18 >= 5 && v8 <= v18 >> 2)
            {
              int v19 = realloc(v6, 6 * v18);
              if (v19)
              {
                *(void *)(a1 + 552) = v19;
                *(_DWORD *)(a1 + 548) >>= 1;
              }
            }
          }

          else
          {
            free(v6);
            *(void *)int v9 = 0LL;
            *(void *)(a1 + 552) = 0LL;
          }
        }

        else
        {
          *uint64_t v12 = v13 - 1;
        }
      }
    }
  }

void sub_180283344(os_unfair_lock_s *a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 53)) {
    free(*(void **)(a2 + 32));
  }
  free((void *)a2);
}

uint64_t sub_180283394()
{
  uint64_t result = sub_1802833C0((uint64_t)"com.apple.developer.web-browser-engine.restrict.notifyd", (uint64_t)&unk_189638C20);
  byte_18C444A10 = result;
  return result;
}

uint64_t sub_1802833C0(uint64_t a1, uint64_t a2)
{
  uint64_t result = xpc_copy_entitlement_for_token();
  if (result)
  {
    int v4 = (void *)result;
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, result);
    xpc_release(v4);
    return v5;
  }

  return result;
}

BOOL sub_18028340C(uint64_t a1, uint64_t a2)
{
  return a2 == MEMORY[0x189600928];
}

uint32_t notify_post(const char *name)
{
  mach_msg_return_t v40;
  uint64_t v41;
  mach_port_t v42;
  mach_msg_header_t msg;
  uint64_t v44;
  _BYTE v45[12];
  int v46;
  uint64_t v47;
  v47 = *MEMORY[0x1895FEE08];
  uint64_t v2 = sub_180281890();
  if ((*(_DWORD *)(v2 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    int v3 = *(_DWORD **)(v2 + 592);
    if (v3 && *v3 != *(_DWORD *)(v2 + 112))
    {
      unsigned int v9 = sub_18028242C(v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
      if (v9)
      {
        uint32_t v7 = v9;
        if (v9 < 0xB) {
          return v7;
        }
        uint32_t v7 = 1000000;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
        {
LABEL_36:
          sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  (char)"notify_post");
          return v7;
        }

LABEL_22:
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (char)"notify_post");
        return v7;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    }
  }

  if (!name) {
    return 1;
  }
  if (!strncmp(name, "self.", 5uLL)) {
    goto LABEL_10;
  }
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10)
  {
LABEL_10:
    os_unfair_lock_lock_with_options();
    uint64_t v4 = os_set_str_ptr_find();
    if (v4)
    {
      uint64_t v5 = v4 - *(void *)(v2 + 160);
      if (v5)
      {
        if (*(void *)(v5 + 8))
        {
          ++*(_DWORD *)(v5 + 60);
          unsigned int v6 = *(void **)v5;
          if (*(void *)v5)
          {
            do
            {
              sub_18028102C(v2 + 128, (uint64_t)v6);
              unsigned int v6 = (void *)*v6;
            }

            while (v6);
          }
        }
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 344));
    return 0;
  }

  if (!*(_DWORD *)(v2 + 384))
  {
    unsigned int v31 = sub_180281C00(v2);
    if (v31)
    {
      uint32_t v7 = v31;
      if (v31 < 0xB) {
        return v7;
      }
      uint32_t v7 = 1000000;
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      goto LABEL_22;
    }
  }

  uint64_t v18 = sub_180281890();
  int v19 = (os_unfair_lock_s *)(v18 + 104);
  os_unfair_lock_lock_with_options();
  BOOL v20 = (os_unfair_lock_s *)sub_180283BC4(v18, name, -1LL, 0);
  os_unfair_lock_unlock(v19);
  if (!v20)
  {
    mach_port_t v32 = *(_DWORD *)(v2 + 384);
    if ((*(_DWORD *)(v2 + 116) & 4) != 0)
    {
      if (qword_18C4449F0 != -1) {
        dispatch_once(&qword_18C4449F0, &unk_189638C60);
      }
      int v33 = sub_18028A29C(v32, name, byte_18C4449E8);
    }

    else
    {
      if (qword_18C4449F0 != -1) {
        dispatch_once(&qword_18C4449F0, &unk_189638C60);
      }
      int v33 = sub_180289A54(v32, name, byte_18C4449E8);
    }

    if (!v33) {
      return 0;
    }
    uint64_t v23 = os_variant_has_internal_diagnostics();
    uint32_t v7 = 1000000;
    if (!(_DWORD)v23) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }

  os_unfair_lock_lock_with_options();
  if ((*(_DWORD *)(v2 + 116) & 4) != 0)
  {
    uint64_t v42 = *(_DWORD *)(v2 + 384);
    if (qword_18C4449F0 != -1) {
      dispatch_once(&qword_18C4449F0, &unk_189638C60);
    }
    if (sub_18028A29C(v42, name, byte_18C4449E8))
    {
      sub_180283CF0(v20);
      uint64_t v23 = os_variant_has_internal_diagnostics();
      uint32_t v7 = 1000000;
      if ((_DWORD)v23) {
        goto LABEL_76;
      }
      goto LABEL_77;
    }

    goto LABEL_68;
  }

  uint64_t v21 = *(void *)&v20->_os_unfair_lock_opaque;
  if (*(void *)&v20->_os_unfair_lock_opaque == -2LL)
  {
    mach_port_t v34 = *(_DWORD *)(v2 + 384);
    if (qword_18C4449F0 != -1) {
      dispatch_once(&qword_18C4449F0, &unk_189638C60);
    }
    int v35 = byte_18C4449E8;
    v44 = *MEMORY[0x1895FF688];
    if (MEMORY[0x1895FFE18]) {
      int v36 = mig_strncpy_zerofill(&v45[8], name, 512);
    }
    else {
      int v36 = mig_strncpy(&v45[8], name, 512);
    }
    *(_DWORD *)v45 = 0;
    *(_DWORD *)&v45[4] = v36;
    mach_msg_size_t v38 = ((v36 + 3) & 0xFFFFFFFC) + 44;
    *(_DWORD *)&v45[((v36 + 3) & 0xFFFFFFFC) + 8] = v35;
    mach_port_t special_reply_port = mig_get_special_reply_port();
    msg.msgh_remote_port = v34;
    msg.msgh_local_port = special_reply_port;
    msg.msgh_bits = 5395;
    *(void *)&msg.msgh_voucher_port = 0x3F000000000LL;
    if (MEMORY[0x189600168])
    {
      voucher_mach_msg_set(&msg);
      mach_port_t special_reply_port = msg.msgh_local_port;
    }

    uint64_t v40 = mach_msg(&msg, 3162115, v38, 0x38u, special_reply_port, 0, 0);
    if ((v40 - 268435458) > 0xE || ((1 << (v40 - 2)) & 0x4003) == 0)
    {
      if (v40)
      {
        mig_dealloc_special_reply_port();
      }

      else if (msg.msgh_id != 1108 {
             || (msg.msgh_bits & 0x80000000) != 0
      }
             || msg.msgh_size != 48
             || msg.msgh_remote_port
             || *(_DWORD *)v45)
      {
        mach_msg_destroy(&msg);
      }

      else
      {
        if (!v46)
        {
          uint64_t v41 = *(void *)&v45[4];
          os_unfair_lock_assert_owner(v20 + 10);
          goto LABEL_67;
        }

        if (v46 == 60)
        {
          os_unfair_lock_assert_owner(v20 + 10);
          uint64_t v41 = -1LL;
LABEL_67:
          *(void *)&v20->_os_unfair_lock_opaque = v41;
          goto LABEL_68;
        }
      }
    }

    uint32_t v7 = 1000000;
    sub_180283CF0(v20);
    uint64_t v23 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v23) {
      goto LABEL_77;
    }
LABEL_76:
    sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (char)"notify_post");
    return v7;
  }

  if (v21 == -1)
  {
    mach_port_t v22 = *(_DWORD *)(v2 + 384);
    if (qword_18C4449F0 != -1) {
      dispatch_once(&qword_18C4449F0, &unk_189638C60);
    }
    if (sub_180289A54(v22, name, byte_18C4449E8))
    {
      sub_180283CF0(v20);
      uint64_t v23 = os_variant_has_internal_diagnostics();
      uint32_t v7 = 1000000;
      if ((_DWORD)v23) {
        goto LABEL_76;
      }
LABEL_77:
      sub_180281A70( v23,  "Libnotify: %s failed with code %d (%d) on line %d",  v25,  v26,  v27,  v28,  v29,  v30,  (char)"notify_post");
      return v7;
    }

    os_unfair_lock_assert_owner(v20 + 10);
    uint64_t v41 = -2LL;
    goto LABEL_67;
  }

  mach_port_t v37 = *(_DWORD *)(v2 + 384);
  if (qword_18C4449F0 != -1) {
    dispatch_once(&qword_18C4449F0, &unk_189638C60);
  }
  v44 = *MEMORY[0x1895FF688];
  *(void *)v45 = v21;
  *(_DWORD *)&v45[8] = byte_18C4449E8;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = v37;
  msg.msgh_id = 1009;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  if (mach_msg(&msg, 2097153, 0x2Cu, 0, 0, 0, 0))
  {
    sub_180283CF0(v20);
    uint64_t v23 = os_variant_has_internal_diagnostics();
    uint32_t v7 = 1000000;
    if ((_DWORD)v23) {
      goto LABEL_76;
    }
    goto LABEL_77;
  }

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

LABEL_68:
  sub_180283CF0(v20);
  return 0;
}

  LODWORD(v6) = v11;
  return v6;
}

void *sub_180283BC4(uint64_t a1, const char *a2, uint64_t a3, int a4)
{
  uint64_t v8 = os_set_str_ptr_find();
  if (v8 && (uint64_t v9 = *(void *)(a1 + 480), v9 != v8))
  {
    uint64_t v10 = (void *)(v8 - v9);
    uint64_t v13 = (unsigned int *)(v8 - v9 + 44);
    do
      unsigned int v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  else
  {
    if (!a4) {
      return 0LL;
    }
    uint64_t v10 = calloc(1uLL, 0x38uLL);
    if (v10)
    {
      size_t v11 = strlen(a2) + 1;
      if ((_dyld_is_memory_immutable() & 1) != 0)
      {
        char v12 = 0;
LABEL_12:
        v10[4] = a2;
        *((_BYTE *)v10 + 53) = v12;
        *((_DWORD *)v10 + 11) = 1;
        v10[1] = 0LL;
        *uint64_t v10 = a3;
        v10[2] = v10 + 1;
        *((_DWORD *)v10 + 12) = -1;
        *((_DWORD *)v10 + 10) = 0;
        *((_BYTE *)v10 + 52) = 0;
        os_set_str_ptr_insert();
        return v10;
      }

      uint64_t v15 = (char *)malloc(v11);
      if (v15)
      {
        uint64_t v16 = v15;
        memcpy(v15, a2, v11);
        char v12 = 1;
        a2 = v16;
        goto LABEL_12;
      }

      free(v10);
      return 0LL;
    }
  }

  return v10;
}

void sub_180283CF0(os_unfair_lock_s *a1)
{
  uint64_t v2 = (os_unfair_lock_s *)sub_180281890();
  os_unfair_lock_lock_with_options();
  p_os_unfair_lock_opaque = &a1[11]._os_unfair_lock_opaque;
  do
  {
    unsigned int v4 = __ldxr(p_os_unfair_lock_opaque);
    signed int v5 = v4 - 1;
  }

  while (__stlxr(v5, p_os_unfair_lock_opaque));
  if (v5 < 0) {
    __assert_rtn("atomic_refcount_release", "notify_client.c", 293, "result >= 0");
  }
  if (!v5)
  {
    __dmb(9u);
    sub_180283344(v2, (uint64_t)a1);
  }

  os_unfair_lock_unlock(v2 + 26);
}

uint64_t sub_180283D84()
{
  uint64_t result = sub_1802833C0((uint64_t)"com.apple.notify.root_access", (uint64_t)&unk_189638CA0);
  byte_18C4449E8 = result;
  return result;
}

BOOL sub_180283DB0(uint64_t a1, uint64_t a2)
{
  return a2 == MEMORY[0x189600928];
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  if ((sub_180283E3C(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_180280F04( "LIBNOTIFY INTROSPECT: registering for non-exempt notification %s",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (char)name);
  }
  return sub_180283F24((char *)name, (unsigned int *)out_token, queue, handler, 0);
}

uint64_t sub_180283E3C(const char *a1)
{
  uint64_t v2 = sub_180281890();
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = sub_180284E50;
  block[3] = &unk_189638CC0;
  block[4] = v2;
  if (qword_18C4449F8 == -1)
  {
    if (!a1) {
      return 1LL;
    }
  }

  else
  {
    dispatch_once(&qword_18C4449F8, block);
    if (!a1) {
      return 1LL;
    }
  }

  if (!*(_BYTE *)(v2 + 576)) {
    return 1LL;
  }
  uint64_t v3 = *(void *)(v2 + 568);
  if (v3)
  {
    unsigned int v4 = (void *)(*(void *)(v2 + 560) + 8LL);
    do
    {
      signed int v5 = (const char *)*(v4 - 1);
      size_t v6 = *v4 - 1LL;
      if (v5[v6] == 42)
      {
        if (!strncmp(a1, v5, v6)) {
          return 1LL;
        }
      }

      else if (!strcmp(a1, v5))
      {
        return 1LL;
      }

      v4 += 2;
      --v3;
    }

    while (v3);
  }

  return 0LL;
}

uint64_t sub_180283F24(char *a1, unsigned int *a2, dispatch_object_s *a3, const void *a4, int a5)
{
  uint64_t v10 = sub_180281890();
  if ((*(_DWORD *)(v10 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v11 = *(_DWORD **)(v10 + 592);
    if (v11 && *v11 != *(_DWORD *)(v10 + 112))
    {
      uint64_t v15 = sub_18028242C(v10);
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 104));
      if ((_DWORD)v15)
      {
        uint64_t v12 = v15;
        uint64_t v12 = 1000000LL;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        goto LABEL_16;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 104));
    }
  }

  uint64_t v12 = 10LL;
  if (a3)
  {
    if (a4)
    {
      notify_set_options(3);
      uint64_t v12 = sub_1802840E8(a1, a2, v10, a5);
      if (!(_DWORD)v12)
      {
        uint64_t v13 = sub_180282A74();
        if (v13)
        {
          uint64_t v14 = v13;
          *(void *)(v13 + 48) = a3;
          dispatch_retain(a3);
          *(void *)(v14 + 56) = _Block_copy(a4);
          sub_180282AF8((char *)v14);
          return 0LL;
        }

        uint64_t v12 = 1000000LL;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_15:
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"_notify_register_dispatch_with_extra_mp");
          return v12;
        }

uint64_t sub_1802840E8(char *__s1, unsigned int *a2, uint64_t a3, int a4)
{
  uint64_t v63 = *MEMORY[0x1895FEE08];
  if (!a3) {
    __assert_rtn("notify_register_coalesced_registration", "notify_client.c", 3148, "globals");
  }
  if (!__s1) {
    __assert_rtn("notify_register_coalesced_registration", "notify_client.c", 3149, "name");
  }
  if (!strncmp(__s1, "self.", 5uLL)) {
    return sub_1802846F8(__s1, (mach_port_name_t *)(a3 + 392), 1073741825, a2, (os_unfair_lock_s *)a3);
  }
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10) {
    return sub_1802846F8(__s1, (mach_port_name_t *)(a3 + 392), 1073741825, a2, (os_unfair_lock_s *)a3);
  }
  if (*(_DWORD *)(a3 + 384) && (*(_DWORD *)(a3 + 392) + 1) > 1 || (uint64_t v9 = sub_180281C00(a3), !(_DWORD)v9))
  {
    os_unfair_lock_lock_with_options();
    uint64_t v19 = os_set_str_ptr_find();
    if (v19)
    {
      uint64_t v20 = *(void *)(a3 + 480);
      if (v20 != v19)
      {
        if (*(void *)(v19 - v20 + 24))
        {
          uint64_t v21 = os_set_str_ptr_find();
          if (v21) {
            uint64_t v22 = v21 - *(void *)(a3 + 480);
          }
          else {
            uint64_t v22 = 0LL;
          }
          uint64_t v42 = (unsigned int *)(*(void *)(v22 + 24) + 16LL);
          do
            unsigned int v43 = __ldxr(v42);
          while (__stxr(v43 + 1, v42));
          char v44 = 0;
LABEL_56:
          os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
          v46 = (unsigned int *)(a3 + 488);
          do
          {
            unsigned int v47 = __ldxr(v46);
            int v48 = v47 + 1;
          }

          while (__stxr(v47 + 1, v46));
          else {
            int v49 = a4;
          }
          uint64_t v10 = sub_180284A68(__s1, -1LL, v48, v48, -1, 0x44000007u, v49, -1, *(_DWORD *)(a3 + 384), v44);
          if ((v44 & 1) == 0) {
            sub_180282AF8(*(char **)(v22 + 24));
          }
          if ((_DWORD)v10)
          {
            if (v10 >= 0xB)
            {
              uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
              if ((_DWORD)has_internal_diagnostics) {
                sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v51,  v52,  v53,  v54,  v55,  v56,  v57,  (char)"notify_register_coalesced_registration");
              }
              else {
                sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v52,  v53,  v54,  v55,  v56,  v57,  (char)"notify_register_coalesced_registration");
              }
              return 1000000LL;
            }
          }

          else
          {
            uint64_t v10 = 0LL;
            if (a2) {
              *a2 = v48;
            }
          }

          return v10;
        }
      }
    }

    uint64_t v23 = (unsigned int *)(a3 + 488);
    do
    {
      unsigned int v24 = __ldxr(v23);
      unsigned int v25 = v24 + 1;
    }

    while (__stxr(v24 + 1, v23));
    mach_port_t v26 = *(_DWORD *)(a3 + 384);
    uint64_t v59 = *MEMORY[0x1895FF688];
    if (MEMORY[0x1895FFE18]) {
      int v27 = mig_strncpy_zerofill(v62, __s1, 512);
    }
    else {
      int v27 = mig_strncpy(v62, __s1, 512);
    }
    int v60 = 0;
    int v61 = v27;
    unsigned int v28 = (v27 + 3) & 0xFFFFFFFC;
    *(_DWORD *)&v62[v28] = v25;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v26;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1026;
    if (MEMORY[0x189600168]) {
      voucher_mach_msg_set(&msg);
    }
    if (mach_msg(&msg, 1, v28 + 44, 0, 0, 0, 0))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
      uint64_t v29 = os_variant_has_internal_diagnostics();
      uint64_t v10 = 1000000LL;
      if ((_DWORD)v29) {
        sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (char)"notify_register_coalesced_registration");
      }
      else {
        sub_180281A70( v29,  "Libnotify: %s failed with code %d (%d) on line %d",  v31,  v32,  v33,  v34,  v35,  v36,  (char)"notify_register_coalesced_registration");
      }
      return v10;
    }

    int v37 = *(_DWORD *)(a3 + 392);
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a3 + 104));
    uint64_t v38 = os_set_32_ptr_find();
    if (!v38 || *(void *)(a3 + 448) == v38)
    {
      uint64_t v39 = (char *)calloc(1uLL, 0x70uLL);
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = sub_180283BC4(a3, __s1, -1LL, 1);
        if (v41)
        {
          *((_DWORD *)v40 + 4) = 1;
          *((_DWORD *)v40 + 5) = v25;
          *((_DWORD *)v40 + 16) = v25;
          *(_OWORD *)(v40 + 24) = xmmword_18028AD50;
          *((_DWORD *)v40 + 10) = -1;
          *((_DWORD *)v40 + 11) = v37;
          *((void *)v40 + 13) = v41;
          v41[3] = v40;
          *((_DWORD *)v41 + 12) = v25;
          os_set_32_ptr_insert();
          if (sub_18028317C())
          {
            if ((_dyld_get_image_uuid() & 1) == 0)
            {
              *(void *)&msg.msgh_bits = 0LL;
              *(void *)&msg.msgh_remote_port = 0LL;
            }

            if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
              _dyld_get_shared_cache_range();
            }
            _os_log_simple();
          }

          uint64_t v45 = os_set_str_ptr_find();
          if (v45) {
            uint64_t v22 = v45 - *(void *)(a3 + 480);
          }
          else {
            uint64_t v22 = 0LL;
          }
          char v44 = 1;
          goto LABEL_56;
        }

        free(v40);
      }
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 104));
    uint64_t v11 = os_variant_has_internal_diagnostics();
    uint64_t v10 = 1000000LL;
    if ((_DWORD)v11)
    {
LABEL_48:
      sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_register_coalesced_registration");
      return v10;
    }

LABEL_49:
    sub_180281A70( v11,  "Libnotify: %s failed with code %d on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_register_coalesced_registration");
    return v10;
  }

  uint64_t v10 = v9;
  if ((v9 - 10) <= 0xFFFFFFFD)
  {
    uint64_t v11 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v11) {
      goto LABEL_48;
    }
    goto LABEL_49;
  }

  return v10;
}

uint64_t sub_1802846F8( const char *a1, mach_port_name_t *name, int a3, unsigned int *a4, os_unfair_lock_s *a5)
{
  if (!a5) {
    __assert_rtn("notify_register_mach_port_self", "notify_client.c", 2941, "globals");
  }
  if ((a3 & 1) != 0)
  {
    mach_port_name_t v20 = *name;
    if (v20 + 1 < 2 || mach_port_insert_right(*MEMORY[0x1895FFD48], v20, *name, 0x14u)) {
      return 3LL;
    }
  }

  else
  {
    uint64_t v10 = (ipc_space_t *)MEMORY[0x1895FFD48];
    if (mach_port_allocate(*MEMORY[0x1895FFD48], 1u, name))
    {
      uint64_t v11 = 1000000LL;
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if ((_DWORD)has_internal_diagnostics) {
        sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"notify_register_mach_port_self");
      }
      else {
        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d (%d) on line %d",  v14,  v15,  v16,  v17,  v18,  v19,  (char)"notify_register_mach_port_self");
      }
      return v11;
    }

    if (mach_port_insert_right(*v10, *name, *name, 0x14u))
    {
      mach_port_destruct(*v10, *name, 0, 0LL);
      return 3LL;
    }
  }

  p_os_unfair_lock_opaque = &a5[122]._os_unfair_lock_opaque;
  do
  {
    unsigned int v22 = __ldxr(p_os_unfair_lock_opaque);
    unsigned int v23 = v22 + 1;
  }

  while (__stxr(v22 + 1, p_os_unfair_lock_opaque));
  mach_port_t v24 = *name;
  if (*name - 1 >= 0xFFFFFFFE)
  {
    uint64_t v11 = 3LL;
    if ((a3 & 1) != 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  uint64_t v47 = 0LL;
  os_unfair_lock_lock_with_options();
  uint64_t v25 = sub_1802815D4((uint64_t)&a5[32], a1, v23, &v47);
  if ((_DWORD)v25)
  {
    uint64_t v11 = v25;
    os_unfair_lock_unlock(a5 + 86);
    if ((a3 & 1) != 0)
    {
LABEL_21:
      if (v11 >= 0xB)
      {
        uint64_t v26 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v26) {
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (char)"notify_register_mach_port_self");
        }
        else {
          sub_180281A70( v26,  "Libnotify: %s failed with code %d on line %d",  v28,  v29,  v30,  v31,  v32,  v33,  (char)"notify_register_mach_port_self");
        }
        return 1000000LL;
      }

      return v11;
    }

LABEL_20:
    mach_port_destruct(*MEMORY[0x1895FFD48], *name, 0, 0LL);
    goto LABEL_21;
  }

  uint64_t v35 = v47;
  *(_BYTE *)(v47 + 79) = *(_BYTE *)(v47 + 79) & 0xF0 | 3;
  *(_DWORD *)(v35 + 56) = v24;
  uint64_t v36 = *(void *)(*(void *)(v35 + 48) + 16LL);
  os_unfair_lock_unlock(a5 + 86);
  uint64_t v37 = sub_180284A68(a1, v36, v23, v23, -1, 0x80000003, -1, -1, *name, 0);
  if ((_DWORD)v37)
  {
    uint64_t v38 = v37;
    if ((a3 & 1) == 0) {
      mach_port_destruct(*MEMORY[0x1895FFD48], *name, 0, 0LL);
    }
    sub_1802814E4((uint64_t)&a5[32]);
    uint64_t v11 = v38;
    if (v38 >= 0xB)
    {
      uint64_t v11 = 1000000LL;
      uint64_t v39 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v39) {
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (char)"notify_register_mach_port_self");
      }
      else {
        sub_180281A70( v39,  "Libnotify: %s failed with code %d on line %d",  v41,  v42,  v43,  v44,  v45,  v46,  (char)"notify_register_mach_port_self");
      }
    }
  }

  else
  {
    *a4 = v23;
    sub_180284D30((uint64_t)a5, *name, a3);
    return 0LL;
  }

  return v11;
}

uint64_t sub_180284A68( const char *a1, uint64_t a2, int a3, int a4, int a5, unsigned int a6, int a7, int a8, int a9, char a10)
{
  uint64_t v17 = sub_180281890();
  uint64_t v18 = (os_unfair_lock_s *)(v17 + 104);
  os_unfair_lock_lock_with_options();
  uint64_t v19 = os_set_32_ptr_find();
  if (v19 && *(void *)(v17 + 448) != v19) {
    goto LABEL_20;
  }
  mach_port_name_t v20 = (os_unfair_lock_s *)sub_180283BC4(v17, a1, a2, 1);
  if (!v20) {
    goto LABEL_20;
  }
  uint64_t v21 = v20;
  char v39 = (char)a1;
  lock = v20 + 10;
  os_unfair_lock_lock_with_options();
  unsigned int v22 = calloc(1uLL, 0x70uLL);
  if (!v22)
  {
    sub_180283CF0(v21);
LABEL_20:
    os_unfair_lock_unlock(v18);
    return 14LL;
  }

  v22[4] = 1;
  uint64_t v38 = v22;
  v22[5] = a3;
  unsigned int v23 = (char *)(v22 + 5);
  os_set_32_ptr_insert();
  unsigned int v24 = a6 & 0xBFFFFFFF;
  if ((a6 & 0x4000000) == 0) {
    unsigned int v24 = a6;
  }
  *((_DWORD *)v23 + 1) = v24;
  *((_DWORD *)v23 + 2) = a5;
  *((_DWORD *)v23 + 3) = 0;
  *((_DWORD *)v23 + 4) = a8;
  *((_DWORD *)v23 + 5) = a7;
  *((_DWORD *)v23 + 6) = a9;
  *((_DWORD *)v23 + 11) = a4;
  *(void *)(v23 + 84) = v21;
  if ((v24 & 0x4000000) != 0 && (*(_DWORD *)(v17 + 116) & 1) != 0 && (v24 & 0xF) - 3 <= 4)
  {
    os_unfair_lock_assert_owner(lock);
    if ((a10 & 1) == 0)
    {
      uint64_t v25 = *(void *)&v21[6]._os_unfair_lock_opaque;
      if (v25)
      {
        uint64_t v26 = (unsigned int *)(v25 + 16);
        do
          unsigned int v27 = __ldxr(v26);
        while (__stxr(v27 + 1, v26));
      }
    }

    *uint64_t v38 = 0LL;
    uint64_t v28 = *(void **)&v21[4]._os_unfair_lock_opaque;
    v38[1] = v28;
    *uint64_t v28 = v38;
    *(void *)&v21[4]._os_unfair_lock_opaque = v38;
  }

  if (!LOBYTE(v21[13]._os_unfair_lock_opaque) && v21[11]._os_unfair_lock_opaque == 500)
  {
    LOBYTE(v21[13]._os_unfair_lock_opaque) = 1;
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics) {
      sub_180280F04( "notify name %s has been registered %d times - this may be a leak",  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v39);
    }
    else {
      sub_180281A70( has_internal_diagnostics,  "notify name %s has been registered %d times - this may be a leak",  v31,  v32,  v33,  v34,  v35,  v36,  v39);
    }
  }

  if (sub_18028317C())
  {
    _dyld_get_image_uuid();
    if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
      _dyld_get_shared_cache_range();
    }
    _os_log_simple();
  }

  os_unfair_lock_unlock(lock);
  os_unfair_lock_unlock(v18);
  return 0LL;
}

void sub_180284D30(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    char v3 = a3;
    if ((a3 & 0x40000000) == 0)
    {
      size_t v6 = (os_unfair_lock_s *)(a1 + 104);
      os_unfair_lock_lock_with_options();
      uint32_t v7 = *(_DWORD **)(a1 + 552);
      uint64_t v8 = *(unsigned int *)(a1 + 544);
      if ((_DWORD)v8)
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = *(int **)(a1 + 552);
        while (1)
        {
          int v11 = *v10;
          v10 += 3;
          if (v11 == a2) {
            break;
          }
          if (v8 == ++v9) {
            goto LABEL_7;
          }
        }

        ++v7[3 * v9 + 1];
        goto LABEL_15;
      }

LABEL_7:
      *(_DWORD *)(a1 + 544) = v8 + 1;
      unsigned int v12 = *(_DWORD *)(a1 + 548);
      if (v8 < v12
        || (v12 >= 4 ? (unsigned int v13 = 2 * v12) : (unsigned int v13 = 4),
            *(_DWORD *)(a1 + 548) = v13,
            uint32_t v7 = reallocf(v7, 12LL * v13),
            (*(void *)(a1 + 552) = v7) != 0LL))
      {
        uint64_t v14 = (char *)&v7[3 * v8];
        *(_DWORD *)uint64_t v14 = a2;
        *((_DWORD *)v14 + 1) = 1;
        v14[8] = (v3 & 1) == 0;
LABEL_15:
        os_unfair_lock_unlock(v6);
        return;
      }

      qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: Unable to allocate port array: possible notification registration leak";
      __break(1u);
    }
  }

void sub_180284E50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 0LL;
  uint64_t v3 = 0LL;
  unsigned int v4 = &v3;
  uint64_t v5 = 0x2000000000LL;
  uint64_t v6 = 0LL;
  v2[0] = MEMORY[0x1895FED80];
  v2[1] = 0x40000000LL;
  v2[2] = sub_180284F10;
  v2[3] = &unk_189638D10;
  v2[4] = &v7;
  v2[5] = &v3;
  *(_BYTE *)(v1 + 576) = sub_1802833C0((uint64_t)"com.apple.private.darwin-notification.introspect", (uint64_t)v2);
  *(void *)(v1 + 568) = v4[3];
  *(void *)(v1 + 560) = v8[3];
  _Block_object_dispose(&v3, 8);
  _Block_object_dispose(&v7, 8);
}

uint64_t sub_180284F10(uint64_t a1, void *a2)
{
  uint64_t result = MEMORY[0x186DF8918](a2);
  if (result != MEMORY[0x189600958])
  {
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a non-empty *array* of strings";
    __break(1u);
    goto LABEL_7;
  }

  uint64_t result = xpc_array_get_count(a2);
  if (!result)
  {
LABEL_7:
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a *non-empty* array of strings";
    __break(1u);
    return result;
  }

  uint64_t v5 = result;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = calloc(result, 0x10uLL);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    __assert_rtn( "_notification_introspection_init_block_invoke",  "notify_client.c",  1888,  "exempt_notifications != NULL");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = sub_180285038;
  applier[3] = &unk_189638CE8;
  applier[4] = *(void *)(a1 + 32);
  return xpc_array_apply(a2, applier);
}

uint64_t sub_180285038(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = MEMORY[0x186DF8918](a3);
  if (result == MEMORY[0x1896009B8])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    size_t length = xpc_string_get_length(a3);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 16 * a2) = strdup(string_ptr);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 16 * a2 + 8) = length;
    return 1LL;
  }

  else
  {
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: entitlement com.apple.private.darwin-notification.introspect "
                               "must be a non-empty array of *strings*";
    __break(1u);
  }

  return result;
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  mach_msg_return_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  mach_msg_header_t msg;
  uint64_t v58;
  int v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  v64 = *MEMORY[0x1895FEE08];
  uint64_t v4 = sub_180281890();
  if ((sub_180283E3C(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_180280F04( "LIBNOTIFY INTROSPECT: registering for non-exempt notification %s",  v38,  v39,  v40,  v41,  v42,  v43,  v44,  (char)name);
  }
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      uint32_t v10 = sub_18028242C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v10)
      {
        if (v10 >= 0xB)
        {
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          goto LABEL_24;
        }

        return v10;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }

  if ((*(_DWORD *)(v4 + 116) & 4) == 0)
  {
    if (!name) {
      return 1;
    }
    if (!out_token) {
      return 10;
    }
    *out_token = -1;
    if (strncmp(name, "self.", 5uLL))
    {
      if (qword_18C444A00 != -1) {
        dispatch_once(&qword_18C444A00, &unk_189638BE0);
      }
      if (!byte_18C444A10)
      {
        mach_port_t v21 = *(_DWORD *)(v4 + 384);
        if (!v21)
        {
          uint64_t v29 = sub_180281C00(v4);
          if (v29)
          {
            uint32_t v10 = v29;
            if (v29 < 0xB) {
              return v10;
            }
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            goto LABEL_24;
          }

          mach_port_t v21 = *(_DWORD *)(v4 + 384);
        }

        unsigned int v22 = (unsigned int *)(v4 + 488);
        do
        {
          unsigned int v23 = __ldxr(v22);
          int v24 = v23 + 1;
        }

        while (__stxr(v23 + 1, v22));
        v58 = *MEMORY[0x1895FF688];
        if (MEMORY[0x1895FFE18]) {
          int v25 = mig_strncpy_zerofill((char *)&v61, name, 512);
        }
        else {
          int v25 = mig_strncpy((char *)&v61, name, 512);
        }
        uint64_t v59 = 0;
        int v60 = v25;
        mach_msg_size_t v26 = ((v25 + 3) & 0xFFFFFFFC) + 44;
        *(int *)((char *)&v61 + ((v25 + 3) & 0xFFFFFFFC)) = v24;
        mach_port_t special_reply_port = mig_get_special_reply_port();
        msg.msgh_remote_port = v21;
        msg.msgh_local_port = special_reply_port;
        msg.msgh_bits = 5395;
        *(void *)&msg.msgh_voucher_port = 0x3F400000000LL;
        if (MEMORY[0x189600168])
        {
          voucher_mach_msg_set(&msg);
          mach_port_t special_reply_port = msg.msgh_local_port;
        }

        uint64_t v28 = mach_msg(&msg, 3162115, v26, 0x40u, special_reply_port, 0, 0);
        if ((v28 - 268435458) > 0xE || ((1 << (v28 - 2)) & 0x4003) == 0)
        {
          if (v28)
          {
            mig_dealloc_special_reply_port();
          }

          else
          {
            if (msg.msgh_id == 1112
              && (msg.msgh_bits & 0x80000000) == 0
              && msg.msgh_size == 56
              && !msg.msgh_remote_port
              && !v59)
            {
              uint32_t v10 = v63;
              if (v63)
              {
                if (v63 < 0xB) {
                  return v10;
                }
                uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
                goto LABEL_24;
              }

              uint64_t v45 = v60;
              uint64_t v46 = v62;
              if (v60 == -1)
              {
                int v48 = sub_180284A68(name, v62, v24, v24, -1, 0x40000002u, -1, -1, 0, 0);
              }

              else
              {
                uint64_t v47 = v61;
                os_unfair_lock_lock_with_options();
                if (!*(void *)(v4 + 592))
                {
                  if (!sub_180285BF0(v45))
                  {
                    uint32_t v10 = 1000000;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                    return v10;
                  }

                  if (!*(void *)(v4 + 592))
                  {
                    uint32_t v10 = 1000000;
                    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                    int v49 = os_variant_has_internal_diagnostics();
                    if ((_DWORD)v49) {
                      sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (char)"notify_register_check");
                    }
                    else {
                      sub_180281A70( v49,  "Libnotify: %s failed with code %d on line %d",  v51,  v52,  v53,  v54,  v55,  v56,  (char)"notify_register_check");
                    }
                    return v10;
                  }
                }

                os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
                int v48 = sub_180284A68(name, v46, v24, v24, v47, 0x40000001u, -1, -1, 0, 0);
              }

              uint32_t v10 = v48;
              if (!v48)
              {
                *out_token = v24;
                return v10;
              }

              if (v48 >= 0xB)
              {
                uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
                goto LABEL_24;
              }

              return v10;
            }

            mach_msg_destroy(&msg);
          }
        }

        uint64_t v30 = os_variant_has_internal_diagnostics();
        uint32_t v10 = 1000000;
        if ((_DWORD)v30) {
          sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (char)"notify_register_check");
        }
        else {
          sub_180281A70( v30,  "Libnotify: %s failed with code %d (%d) on line %d",  v32,  v33,  v34,  v35,  v36,  v37,  (char)"notify_register_check");
        }
        return v10;
      }
    }

    uint64_t v6 = (unsigned int *)(v4 + 488);
    do
    {
      unsigned int v7 = __ldxr(v6);
      unsigned int v8 = v7 + 1;
    }

    while (__stxr(v7 + 1, v6));
    unsigned int v9 = sub_180281778(v4 + 128, name, v8, &msg);
    if (v9)
    {
      uint32_t v10 = v9;
      if (v9 >= 0xB)
      {
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_66:
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_register_check");
          return 1000000;
        }

LABEL_24:
        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_register_check");
        return 1000000;
      }
    }

    else
    {
      unsigned int v20 = sub_180284A68(name, *(uint64_t *)&msg.msgh_bits, v8, v8, -1, 0x80000002, -1, -1, 0, 0);
      uint32_t v10 = v20;
      if (!v20)
      {
        *out_token = v8;
        return v10;
      }

      if (v20 >= 0xB)
      {
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        goto LABEL_24;
      }
    }

    return v10;
  }

  return notify_register_plain(name, out_token);
}

uint64_t notify_register_plain(const char *a1, _DWORD *a2)
{
  uint64_t v57 = *MEMORY[0x1895FEE08];
  uint64_t v4 = sub_180281890();
  if ((sub_180283E3C(a1) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_180280F04( "LIBNOTIFY INTROSPECT: registering for non-exempt notification %s",  v45,  v46,  v47,  v48,  v49,  v50,  v51,  (char)a1);
  }
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      uint64_t v10 = sub_18028242C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if ((_DWORD)v10)
      {
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_42:
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (char)"notify_register_plain");
          return 1000000LL;
        }

LABEL_47:
        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v22,  v23,  v24,  v25,  v26,  v27,  (char)"notify_register_plain");
        return 1000000LL;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }

  if (!a1) {
    return 1LL;
  }
  if (!strncmp(a1, "self.", 5uLL)) {
    goto LABEL_11;
  }
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10)
  {
LABEL_11:
    uint64_t v6 = (unsigned int *)(v4 + 488);
    do
    {
      unsigned int v7 = __ldxr(v6);
      unsigned int v8 = v7 + 1;
    }

    while (__stxr(v7 + 1, v6));
    uint64_t v9 = sub_180281778(v4 + 128, a1, v8, &msg);
    if ((_DWORD)v9)
    {
      uint64_t v10 = v9;
      if (v9 >= 0xB)
      {
        uint64_t v10 = 1000000LL;
        uint64_t v11 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v11) {
          goto LABEL_21;
        }
LABEL_46:
        sub_180281A70( v11,  "Libnotify: %s failed with code %d on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_register_plain");
        return v10;
      }

      return v10;
    }

    uint64_t v19 = sub_180284A68(a1, *(uint64_t *)&msg.msgh_bits, v8, v8, -1, 0x80000002, -1, -1, 0, 0);
    if (!(_DWORD)v19)
    {
      uint64_t v10 = 0LL;
      *a2 = v8;
      return v10;
    }

    uint64_t v10 = v19;
    uint64_t v10 = 1000000LL;
    uint64_t v11 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v11) {
      goto LABEL_46;
    }
LABEL_21:
    sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_register_plain");
    return v10;
  }

  mach_port_t v28 = *(_DWORD *)(v4 + 384);
  if (!v28)
  {
    uint64_t v42 = sub_180281C00(v4);
    if (!(_DWORD)v42)
    {
      mach_port_t v28 = *(_DWORD *)(v4 + 384);
      goto LABEL_27;
    }

    uint64_t v10 = v42;
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    goto LABEL_47;
  }

            sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v19,  v20,  v21,  v22,  v23,  v24,  (char)"notify_suspend");
            return 1000000;
          }

          return v11;
        }
      }

      os_unfair_lock_lock_with_options();
      uint64_t v6 = *(_DWORD *)(v5 + 24);
      if ((v6 & 0x4000000) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v5 + 104) + 40LL));
        unsigned int v7 = *(_DWORD *)(v2 + 384);
        uint64_t v37 = *MEMORY[0x1895FF688];
        uint64_t v38 = token;
        mach_port_t special_reply_port = mig_get_special_reply_port();
        msg.msgh_remote_port = v7;
        msg.msgh_local_port = special_reply_port;
        msg.msgh_bits = 5395;
        *(void *)&msg.msgh_voucher_port = 0x3EC00000000LL;
        if (MEMORY[0x189600168])
        {
          voucher_mach_msg_set(&msg);
          mach_port_t special_reply_port = msg.msgh_local_port;
        }

        uint64_t v9 = mach_msg(&msg, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
        uint64_t v10 = v9;
        if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
        {
          sub_180282AF8((char *)v5);
          goto LABEL_56;
        }

        if (v9)
        {
          mig_dealloc_special_reply_port();
          goto LABEL_55;
        }

        if (msg.msgh_id == 71)
        {
          uint64_t v10 = -308;
        }

        else
        {
          if (msg.msgh_id == 1104)
          {
            if ((msg.msgh_bits & 0x80000000) != 0) {
              goto LABEL_53;
            }
            if (msg.msgh_size != 40)
            {
              if (msg.msgh_size == 36)
              {
                if (msg.msgh_remote_port) {
                  uint64_t v27 = 1;
                }
                else {
                  uint64_t v27 = v38 == 0;
                }
                if (v27) {
                  uint64_t v10 = -300;
                }
                else {
                  uint64_t v10 = v38;
                }
                goto LABEL_54;
              }

              goto LABEL_53;
            }

            if (msg.msgh_remote_port)
            {
LABEL_53:
              uint64_t v10 = -300;
              goto LABEL_54;
            }

            uint64_t v10 = v38;
            if (v38) {
              goto LABEL_54;
            }
            token = v39;
            sub_180282AF8((char *)v5);
            if (token >= 0xB)
            {
LABEL_56:
              uint64_t v11 = 1000000;
              mach_port_t v28 = os_variant_has_internal_diagnostics();
              if ((_DWORD)v28) {
                sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (char)"notify_suspend");
              }
              else {
                sub_180281A70( v28,  "Libnotify: %s failed with code %d (%d) on line %d",  v30,  v31,  v32,  v33,  v34,  v35,  (char)"notify_suspend");
              }
              return v11;
            }

            return token;
          }

          uint64_t v10 = -301;
        }

LABEL_27:
  uint64_t v29 = (unsigned int *)(v4 + 488);
  do
  {
    unsigned int v30 = __ldxr(v29);
    int v31 = v30 + 1;
  }

  while (__stxr(v30 + 1, v29));
  uint64_t v53 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v32 = mig_strncpy_zerofill(v56, a1, 512);
  }
  else {
    int v32 = mig_strncpy(v56, a1, 512);
  }
  int v54 = 0;
  int v55 = v32;
  unsigned int v33 = (v32 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v56[v33] = v31;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = v28;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1011;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  if (mach_msg(&msg, 1, v33 + 44, 0, 0, 0, 0))
  {
    uint64_t v10 = 1000000LL;
    uint64_t v34 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v34) {
      sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v35,  v36,  v37,  v38,  v39,  v40,  v41,  (char)"notify_register_plain");
    }
    else {
      sub_180281A70( v34,  "Libnotify: %s failed with code %d (%d) on line %d",  v36,  v37,  v38,  v39,  v40,  v41,  (char)"notify_register_plain");
    }
    return v10;
  }

  uint64_t v43 = sub_180284A68(a1, -1LL, v31, v31, -1, 0x40000002u, -1, -1, 0, 0);
  if (!(_DWORD)v43)
  {
    uint64_t v10 = 0LL;
    *a2 = v31;
    return v10;
  }

  uint64_t v10 = v43;
  if (v43 >= 0xB)
  {
    uint64_t v10 = 1000000LL;
    uint64_t v11 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v11) {
      goto LABEL_46;
    }
    goto LABEL_21;
  }

  return v10;
}

BOOL sub_180285BF0(unsigned int a1)
{
  uint64_t v2 = sub_180281890();
  int v3 = shm_open("apple.shm.notification_center", 0, 0LL);
  if (v3 == -1)
  {
    if (*__error() != 1)
    {
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      unsigned int v7 = __error();
      if (has_internal_diagnostics) {
        sub_180280F04( "Libnotify: %s failed on line %d with errno %d",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (char)"shm_attach");
      }
      else {
        sub_180281A70( (uint64_t)v7,  "Libnotify: %s failed on line %d with errno %d",  v9,  v10,  v11,  v12,  v13,  v14,  (char)"shm_attach");
      }
    }

    return 0LL;
  }

  else
  {
    uint64_t v4 = mmap(0LL, a1, 1, 1, v3, 0LL);
    BOOL v5 = v4 != (void *)-1LL;
    if (v4 == (void *)-1LL)
    {
      int v15 = os_variant_has_internal_diagnostics();
      uint64_t v16 = __error();
      if (v15) {
        sub_180280F04( "Libnotify: %s failed on line %d with errno %d",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"shm_attach");
      }
      else {
        sub_180281A70( (uint64_t)v16,  "Libnotify: %s failed on line %d with errno %d",  v18,  v19,  v20,  v21,  v22,  v23,  (char)"shm_attach");
      }
    }

    else
    {
      *(void *)(v2 + 592) = v4;
    }

    close_NOCANCEL();
  }

  return v5;
}

uint32_t notify_register_signal(const char *name, int sig, int *out_token)
{
  uint64_t v68 = *MEMORY[0x1895FEE08];
  uint64_t v6 = sub_180281890();
  if ((sub_180283E3C(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_180280F04( "LIBNOTIFY INTROSPECT: registering for non-exempt notification %s",  v54,  v55,  v56,  v57,  v58,  v59,  v60,  (char)name);
  }
  if ((*(_DWORD *)(v6 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    unsigned int v7 = *(_DWORD **)(v6 + 592);
    if (v7 && *v7 != *(_DWORD *)(v6 + 112))
    {
      uint32_t v14 = sub_18028242C(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
      if (v14)
      {
        if (v14 < 0xB) {
          return v14;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v27,  v28,  v29,  v30,  v31,  v32,  v33,  (char)"notify_register_signal");
        return 1000000;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
    }
  }

  if (!name) {
    return 1;
  }
  if (!strncmp(name, "self.", 5uLL)) {
    goto LABEL_11;
  }
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10)
  {
LABEL_11:
    uint64_t v8 = (unsigned int *)(v6 + 488);
    do
    {
      unsigned int v9 = __ldxr(v8);
      unsigned int v10 = v9 + 1;
    }

    while (__stxr(v9 + 1, v8));
    *(void *)&msg.msgh_bits = 0LL;
    uint64_t v11 = (os_unfair_lock_s *)(v6 + 344);
    os_unfair_lock_lock_with_options();
    unsigned int v12 = sub_1802815D4(v6 + 128, name, v10, &msg);
    if (v12)
    {
      unsigned int v13 = v12;
      os_unfair_lock_unlock(v11);
      uint32_t v14 = v13;
      if (v13 >= 0xB)
      {
        uint32_t v14 = 1000000;
        uint64_t v15 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v15) {
          goto LABEL_35;
        }
        goto LABEL_53;
      }
    }

    else
    {
      uint64_t v23 = *(void *)&msg.msgh_bits;
      *(_BYTE *)(*(void *)&msg.msgh_bits + 79LL) = *(_BYTE *)(*(void *)&msg.msgh_bits + 79LL) & 0xF0 | 5;
      *(_DWORD *)(v23 + 68) = 0;
      *(_DWORD *)(v23 + 56) = sig;
      uint64_t v24 = *(void *)(*(void *)(v23 + 48) + 16LL);
      os_unfair_lock_unlock(v11);
      unsigned int v25 = sub_180284A68(name, v24, v10, v10, -1, 0x80000005, sig, -1, 0, 0);
      if (!v25)
      {
        uint32_t v14 = 0;
        *out_token = v10;
        return v14;
      }

      uint32_t v14 = v25;
      if (v25 >= 0xB)
      {
        uint32_t v14 = 1000000;
        uint64_t v15 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v15) {
          goto LABEL_35;
        }
        goto LABEL_53;
      }
    }

    return v14;
  }

  if ((*(_DWORD *)(v6 + 116) & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    handler[0] = MEMORY[0x1895FED80];
    handler[1] = 0x40000000LL;
    handler[2] = sub_1802862EC;
    handler[3] = &unk_189638B18;
    int v62 = sig;
    uint32_t v14 = notify_register_dispatch(name, out_token, global_queue, handler);
    if (v14 >= 0xB)
    {
      uint32_t v14 = 1000000;
      uint64_t v15 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v15)
      {
LABEL_35:
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (char)"notify_register_signal");
        return v14;
      }

LABEL_53:
      sub_180281A70( v15,  "Libnotify: %s failed with code %d on line %d",  v17,  v18,  v19,  v20,  v21,  v22,  (char)"notify_register_signal");
    }
  }

  else
  {
    mach_port_t v34 = *(_DWORD *)(v6 + 384);
    if (!v34)
    {
      unsigned int v50 = sub_180281C00(v6);
      if (v50)
      {
        uint32_t v14 = v50;
        if (v50 < 0xB) {
          return v14;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
LABEL_47:
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v51,  v28,  v29,  v30,  v31,  v32,  v33,  (char)"notify_register_signal");
        return 1000000;
      }

      mach_port_t v34 = *(_DWORD *)(v6 + 384);
    }

    uint64_t v35 = (unsigned int *)(v6 + 488);
    do
    {
      unsigned int v36 = __ldxr(v35);
      int v37 = v36 + 1;
    }

    while (__stxr(v36 + 1, v35));
    uint64_t v64 = *MEMORY[0x1895FF688];
    if (MEMORY[0x1895FFE18]) {
      int v38 = mig_strncpy_zerofill(v67, name, 512);
    }
    else {
      int v38 = mig_strncpy(v67, name, 512);
    }
    int v65 = 0;
    int v66 = v38;
    unsigned int v40 = (v38 + 3) & 0xFFFFFFFC;
    uint64_t v41 = (char *)&msg + v40;
    *((_DWORD *)v41 + 10) = v37;
    *((_DWORD *)v41 + 11) = sig;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v34;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1013;
    if (MEMORY[0x189600168]) {
      voucher_mach_msg_set(&msg);
    }
    if (mach_msg(&msg, 1, v40 + 48, 0, 0, 0, 0))
    {
      uint32_t v14 = 1000000;
      uint64_t v42 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v42) {
        sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v43,  v44,  v45,  v46,  v47,  v48,  v49,  (char)"notify_register_signal");
      }
      else {
        sub_180281A70( v42,  "Libnotify: %s failed with code %d (%d) on line %d",  v44,  v45,  v46,  v47,  v48,  v49,  (char)"notify_register_signal");
      }
      return v14;
    }

    unsigned int v52 = sub_180284A68(name, -1LL, v37, v37, -1, 0x40000005u, sig, -1, 0, 0);
    uint32_t v14 = v52;
    if (!v52)
    {
      *out_token = v37;
      return v14;
    }

    if (v52 >= 0xB)
    {
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (!(_DWORD)has_internal_diagnostics)
      {
LABEL_51:
        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v28,  v29,  v30,  v31,  v32,  v33,  (char)"notify_register_signal");
        return 1000000;
      }

      goto LABEL_47;
    }
  }

  return v14;
}

uint64_t sub_1802862EC(uint64_t a1)
{
  pid_t v2 = getpid();
  return kill(v2, *(_DWORD *)(a1 + 32));
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  uint64_t v8 = sub_180281890();
  if ((sub_180283E3C(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_180280F04( "LIBNOTIFY INTROSPECT: registering for non-exempt notification %s",  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (char)name);
  }
  if ((*(_DWORD *)(v8 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    unsigned int v9 = *(_DWORD **)(v8 + 592);
    if (v9 && *v9 != *(_DWORD *)(v8 + 112))
    {
      uint32_t v11 = sub_18028242C(v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
      if (v11)
      {
        if (v11 < 0xB) {
          return v11;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"notify_register_mach_port");
          return 1000000;
        }

        uint64_t v43 = "notify_register_mach_port";
LABEL_44:
        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v14,  v15,  v16,  v17,  v18,  v19,  (char)v43);
        return 1000000;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
    }
  }

  if (!name) {
    return 1;
  }
  if (!notify_port) {
    return 3;
  }
  if (!strncmp(name, "self.", 5uLL)) {
    return sub_1802846F8(name, notify_port, flags, (unsigned int *)out_token, (os_unfair_lock_s *)v8);
  }
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10) {
    return sub_1802846F8(name, notify_port, flags, (unsigned int *)out_token, (os_unfair_lock_s *)v8);
  }
  if ((flags & 0x80000000) == 0 && (*(_DWORD *)(v8 + 116) & 1) != 0)
  {
    if ((flags & 1) == 0 && mach_port_allocate(*MEMORY[0x1895FFD48], 1u, notify_port))
    {
      uint64_t v20 = os_variant_has_internal_diagnostics();
      uint32_t v11 = 1000000;
      if ((_DWORD)v20)
      {
        uint64_t v28 = "notify_register_mach_port_via_dispatch";
LABEL_61:
        sub_180280F04("Libnotify: %s failed with code %d (%d) on line %d", v21, v22, v23, v24, v25, v26, v27, (char)v28);
        return v11;
      }

      uint64_t v45 = "notify_register_mach_port_via_dispatch";
      goto LABEL_63;
    }

    mach_port_name_t v41 = *notify_port;
    if (*notify_port - 1 <= 0xFFFFFFFD)
    {
      uint64_t v42 = (ipc_space_t *)MEMORY[0x1895FFD48];
      if (!mach_port_insert_right(*MEMORY[0x1895FFD48], *notify_port, *notify_port, 0x14u))
      {
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
        v57[0] = MEMORY[0x1895FED80];
        v57[1] = 0x40000000LL;
        v57[2] = sub_180286988;
        v57[3] = &unk_189638D30;
        mach_port_name_t v58 = v41;
        v57[4] = v8;
        uint32_t v47 = sub_180283F24((char *)name, (unsigned int *)out_token, global_queue, v57, *notify_port);
        uint32_t v11 = v47;
        if ((flags & 1) != 0 || !v47)
        {
          if (!v47) {
            sub_180284D30(v8, *notify_port, flags);
          }
        }

        else
        {
          mach_port_destruct(*v42, v41, 0, 0LL);
        }

        return v11;
      }

      if ((flags & 1) == 0) {
        mach_port_destruct(*v42, v41, 0, 0LL);
      }
    }

    return 3;
  }

  if (!strncmp(name, "self.", 5uLL)) {
    __assert_rtn( "notify_register_mach_port_no_dispatch",  "notify_client.c",  3044,  "strncmp(name, SELF_PREFIX, SELF_PREFIX_LEN)");
  }
  if (byte_18C444A10)
  {
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
LABEL_79:
    __assert_rtn("notify_register_mach_port_no_dispatch", "notify_client.c", 3084, "*notify_port == MACH_PORT_NULL");
  }

  if ((flags & 1) != 0 && *notify_port + 1 < 2) {
    return 3;
  }
  if (!*(_DWORD *)(v8 + 384))
  {
    unsigned int v44 = sub_180281C00(v8);
    if (v44)
    {
      uint32_t v11 = v44;
      if (v44 < 0xB) {
        return v11;
      }
      uint32_t v11 = 1000000;
      uint64_t v33 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v33)
      {
LABEL_52:
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (char)"notify_register_mach_port_no_dispatch");
        return v11;
      }

LABEL_66:
      sub_180281A70( v33,  "Libnotify: %s failed with code %d on line %d",  v35,  v36,  v37,  v38,  v39,  v40,  (char)"notify_register_mach_port_no_dispatch");
      return v11;
    }
  }

  uint64_t v29 = (unsigned int *)(v8 + 488);
  do
  {
    unsigned int v30 = __ldxr(v29);
    int v31 = v30 + 1;
  }

  while (__stxr(v30 + 1, v29));
  if ((flags & 1) != 0)
  {
    if (sub_180289C54(*(_DWORD *)(v8 + 384), name, v31, *notify_port))
    {
LABEL_59:
      uint64_t v20 = os_variant_has_internal_diagnostics();
      uint32_t v11 = 1000000;
      if ((_DWORD)v20)
      {
        uint64_t v28 = "notify_register_mach_port_no_dispatch";
        goto LABEL_61;
      }

      uint64_t v45 = "notify_register_mach_port_no_dispatch";
LABEL_63:
      sub_180281A70(v20, "Libnotify: %s failed with code %d (%d) on line %d", v22, v23, v24, v25, v26, v27, (char)v45);
      return v11;
    }

    uint32_t v11 = sub_180284A68(name, -1LL, v31, v31, -1, 3u, -1, -1, *notify_port, 0);
    if (v11) {
      goto LABEL_69;
    }
    goto LABEL_72;
  }

  LODWORD(v57[0]) = 0;
  *notify_port = 0;
  int v32 = sub_180289F44(*(_DWORD *)(v8 + 384), name, v31, v57, notify_port);
  if (!LODWORD(v57[0]))
  {
    if (v32)
    {
      mach_port_destruct(*MEMORY[0x1895FFD48], *notify_port, 0, 0LL);
      goto LABEL_59;
    }

    uint32_t v48 = sub_180284A68(name, -1LL, v31, v31, -1, 3u, -1, -1, *notify_port, 0);
    if (v48)
    {
      uint32_t v11 = v48;
      mach_port_destruct(*MEMORY[0x1895FFD48], *notify_port, 0, 0LL);
LABEL_69:
      if (v11 < 0xB) {
        return v11;
      }
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if ((_DWORD)has_internal_diagnostics)
      {
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v49,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"notify_register_mach_port_no_dispatch");
        return 1000000;
      }

      uint64_t v43 = "notify_register_mach_port_no_dispatch";
      goto LABEL_44;
    }

LABEL_72:
    sub_180284D30(v8, *notify_port, flags);
    uint32_t v11 = 0;
    if (out_token) {
      *out_token = v31;
    }
    return v11;
  }

  if (*notify_port) {
    goto LABEL_79;
  }
  uint32_t v11 = v57[0];
  if (LODWORD(v57[0]) >= 0xB)
  {
    uint32_t v11 = 1000000;
    uint64_t v33 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v33) {
      goto LABEL_52;
    }
    goto LABEL_66;
  }

  return v11;
}

void sub_180286988(uint64_t a1, mach_msg_id_t a2)
{
  mach_port_t v3 = *(_DWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  msg.msgh_remote_port = v3;
  *(void *)&msg.msgh_local_port = 0LL;
  *(void *)&msg.msgh_bits = 0x1800000013LL;
  msg.msgh_id = a2;
  if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460)
  {
    uint64_t v5 = MEMORY[0x1895FED80];
    v10[0] = MEMORY[0x1895FED80];
    v10[1] = 0x40000000LL;
    v10[2] = sub_180286A88;
    v10[3] = &unk_189638D50;
    v10[4] = v4;
    if (*(void *)(v4 + 496) != -1LL) {
      dispatch_once((dispatch_once_t *)(v4 + 496), v10);
    }
    uint64_t v6 = *(dispatch_queue_s **)(v4 + 504);
    if (v6)
    {
      block[0] = v5;
      block[1] = 0x40000000LL;
      block[2] = sub_180286ABC;
      block[3] = &unk_189638D70;
      mach_port_t v8 = v3;
      mach_msg_id_t v9 = a2;
      dispatch_async(v6, block);
    }
  }

dispatch_queue_t sub_180286A88(uint64_t a1)
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.notify.background.local.notification", 0LL);
  *(void *)(*(void *)(a1 + 32) + 504LL) = result;
  return result;
}

uint64_t sub_180286ABC(uint64_t a1)
{
  mach_msg_id_t v1 = *(_DWORD *)(a1 + 36);
  msg.msgh_remote_port = *(_DWORD *)(a1 + 32);
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_bits = 0x1800000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = v1;
  return mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
}

uint32_t notify_register_file_descriptor(const char *name, int *notify_fd, int flags, int *out_token)
{
  char v5 = flags;
  uint64_t v64 = *MEMORY[0x1895FEE08];
  uint64_t v8 = sub_180281890();
  if ((sub_180283E3C(name) & 1) == 0 && os_variant_has_internal_diagnostics()) {
    sub_180280F04( "LIBNOTIFY INTROSPECT: registering for non-exempt notification %s",  v55,  v56,  v57,  v58,  v59,  v60,  v61,  (char)name);
  }
  if ((*(_DWORD *)(v8 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    mach_msg_id_t v9 = *(_DWORD **)(v8 + 592);
    if (v9 && *v9 != *(_DWORD *)(v8 + 112))
    {
      uint32_t v10 = sub_18028242C(v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
      if (v10)
      {
        if (v10 < 0xB) {
          return v10;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (!(_DWORD)has_internal_diagnostics)
        {
LABEL_66:
          sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v17,  v18,  v19,  v20,  v21,  v22,  (char)"notify_register_file_descriptor");
          return 1000000;
        }

        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (char)"notify_register_file_descriptor");
        return 1000000;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
    }
  }

  if (!name) {
    return 1;
  }
  if (!notify_fd) {
    return 4;
  }
  if ((v5 & 1) != 0)
  {
    uint64_t v11 = *(unsigned int *)(v8 + 512);
    if ((_DWORD)v11)
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)(v8 + 520);
      while (*(_DWORD *)(v13 + 4 * v12) != *notify_fd)
      {
        if (v11 == ++v12) {
          return 4;
        }
      }

      uint64_t v31 = 4LL * v12;
      v63[0] = *(_DWORD *)(v13 + v31);
      v63[1] = *(_DWORD *)(*(void *)(v8 + 528) + v31);
      goto LABEL_25;
    }

    return 4;
  }

  if (pipe(v63) < 0)
  {
    uint64_t v23 = os_variant_has_internal_diagnostics();
    uint32_t v10 = 1000000;
    if (!(_DWORD)v23) {
      goto LABEL_60;
    }
    goto LABEL_40;
  }

  *notify_fd = v63[0];
LABEL_25:
  if (strncmp(name, "self.", 5uLL))
  {
    if (qword_18C444A00 != -1) {
      dispatch_once(&qword_18C444A00, &unk_189638BE0);
    }
    if (!byte_18C444A10)
    {
      if ((*(_DWORD *)(v8 + 116) & 1) != 0)
      {
        uint32_t v10 = sub_180287250((char *)name, (unsigned int *)out_token, v63[0], v63[1]);
        if (v10)
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }

          if (v10 < 0xB) {
            return v10;
          }
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
LABEL_58:
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v53,  v17,  v18,  v19,  v20,  v21,  v22,  (char)"notify_register_file_descriptor");
          return 1000000;
        }
      }

      else
      {
        if (!*(_DWORD *)(v8 + 384))
        {
          uint32_t v54 = sub_180281C00(v8);
          if (v54)
          {
            uint32_t v10 = v54;
            if ((v5 & 1) == 0)
            {
              close_NOCANCEL();
              close_NOCANCEL();
            }

            if (v10 < 0xB) {
              return v10;
            }
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            goto LABEL_58;
          }
        }

        LODWORD(v62) = 0;
        if ((fileport_makeport() & 0x80000000) != 0)
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }

          uint64_t v23 = os_variant_has_internal_diagnostics();
          uint32_t v10 = 1000000;
          if ((_DWORD)v23) {
            goto LABEL_40;
          }
          goto LABEL_60;
        }

        uint64_t v42 = (unsigned int *)(v8 + 488);
        do
        {
          unsigned int v43 = __ldxr(v42);
          int v44 = v43 + 1;
        }

        while (__stxr(v43 + 1, v42));
        if (sub_180289B4C(*(_DWORD *)(v8 + 384), name, v44, v62))
        {
          if ((v5 & 1) == 0)
          {
            close_NOCANCEL();
            close_NOCANCEL();
          }

          uint64_t v45 = os_variant_has_internal_diagnostics();
          uint32_t v10 = 1000000;
          if ((_DWORD)v45) {
            sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v46,  v47,  v48,  v49,  v50,  v51,  v52,  (char)"notify_register_file_descriptor");
          }
          else {
            sub_180281A70( v45,  "Libnotify: %s failed with code %d (%d) on line %d",  v47,  v48,  v49,  v50,  v51,  v52,  (char)"notify_register_file_descriptor");
          }
          return v10;
        }

        uint32_t v10 = sub_180284A68(name, -1LL, v44, -1, -1, 4u, -1, *notify_fd, 0, 0);
        if (v10) {
          return v10;
        }
        *out_token = v44;
      }

      sub_180287114(v63[0], v63[1]);
      return v10;
    }
  }

  int v32 = (unsigned int *)(v8 + 488);
  do
  {
    unsigned int v33 = __ldxr(v32);
    unsigned int v34 = v33 + 1;
  }

  while (__stxr(v33 + 1, v32));
  int v35 = v63[1];
  uint64_t v62 = 0LL;
  uint64_t v36 = (os_unfair_lock_s *)(v8 + 344);
  os_unfair_lock_lock_with_options();
  unsigned int v37 = sub_1802815D4(v8 + 128, name, v34, &v62);
  if (!v37)
  {
    uint64_t v39 = v62;
    *(_BYTE *)(v62 + 79) = *(_BYTE *)(v62 + 79) & 0xF0 | 4;
    *(_DWORD *)(v39 + 56) = v35;
    uint64_t v40 = *(void *)(*(void *)(v39 + 48) + 16LL);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 344));
    unsigned int v41 = sub_180284A68(name, v40, v34, v34, -1, 0x80000004, -1, *notify_fd, 0, 0);
    if (!v41)
    {
      *out_token = v34;
      sub_180287114(v63[0], v63[1]);
      return 0;
    }

    uint32_t v10 = v41;
    if (v41 < 0xB) {
      return v10;
    }
    uint32_t v10 = 1000000;
    uint64_t v23 = os_variant_has_internal_diagnostics();
    if (!(_DWORD)v23) {
      goto LABEL_60;
    }
LABEL_40:
    sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (char)"notify_register_file_descriptor");
    return v10;
  }

  unsigned int v38 = v37;
  os_unfair_lock_unlock(v36);
  if ((v5 & 1) == 0)
  {
    close_NOCANCEL();
    close_NOCANCEL();
  }

  uint32_t v10 = v38;
  if (v38 >= 0xB)
  {
    uint32_t v10 = 1000000;
    uint64_t v23 = os_variant_has_internal_diagnostics();
    if ((_DWORD)v23) {
      goto LABEL_40;
    }
LABEL_60:
    sub_180281A70( v23,  "Libnotify: %s failed with code %d on line %d",  v25,  v26,  v27,  v28,  v29,  v30,  (char)"notify_register_file_descriptor");
  }

  return v10;
}

void sub_180287114(int a1, int a2)
{
  uint64_t v4 = sub_180281890();
  if (((a2 | a1) & 0x80000000) == 0)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (os_unfair_lock_s *)(v4 + 104);
    os_unfair_lock_lock_with_options();
    unint64_t v7 = *(unsigned int *)(v5 + 512);
    uint64_t v8 = *(_DWORD **)(v5 + 520);
    if (!(_DWORD)v7) {
      goto LABEL_15;
    }
    unint64_t v9 = 0LL;
    do
    {
      if (v8[v9] == a1) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = -1;
      }
      ++v9;
    }

    while (v10 == -1 && v9 < v7);
    if (v10 == -1)
    {
LABEL_15:
      *(_DWORD *)(v5 + 512) = v7 + 1;
      *(void *)(v5 + 520) = reallocf(v8, 4LL * (v7 + 1));
      *(void *)(v5 + 528) = reallocf(*(void **)(v5 + 528), 4LL * *(unsigned int *)(v5 + 512));
      uint64_t v12 = reallocf(*(void **)(v5 + 536), 4LL * *(unsigned int *)(v5 + 512));
      *(void *)(v5 + 536) = v12;
      uint64_t v13 = *(void *)(v5 + 520);
      if (v13 && v12 && (uint64_t v14 = *(void *)(v5 + 528)) != 0)
      {
        *(_DWORD *)(v13 + 4 * v7) = a1;
        *(_DWORD *)(v14 + 4 * v7) = a2;
        v12[v7] = 1;
      }

      else
      {
        free(*(void **)(v5 + 520));
        *(void *)(v5 + 520) = 0LL;
        free(*(void **)(v5 + 528));
        *(void *)(v5 + 528) = 0LL;
        free(*(void **)(v5 + 536));
        *(void *)(v5 + 536) = 0LL;
        *(_DWORD *)(v5 + 512) = 0;
      }
    }

    else
    {
      ++*(_DWORD *)(*(void *)(v5 + 536) + 4LL * v10);
    }

    os_unfair_lock_unlock(v6);
  }

uint64_t sub_180287250(char *a1, unsigned int *a2, int a3, int a4)
{
  uint64_t v8 = sub_180281890();
  if (!*(_DWORD *)(v8 + 392)) {
    return 19LL;
  }
  uint64_t result = sub_1802840E8(a1, a2, v8, 0);
  if (!(_DWORD)result)
  {
    uint64_t v10 = sub_180282A74();
    if (v10)
    {
      uint64_t v11 = v10;
      *(_DWORD *)(v10 + 20) = *a2;
      *(_DWORD *)(v10 + 36) = a3;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      *(void *)(v11 + 48) = global_queue;
      dispatch_retain(global_queue);
      unsigned int v13 = bswap32(*(_DWORD *)(v11 + 20));
      aBlock[0] = MEMORY[0x1895FED80];
      aBlock[1] = 0x40000000LL;
      aBlock[2] = sub_18028733C;
      aBlock[3] = &unk_189638D90;
      int v15 = a4;
      unsigned int v16 = v13;
      *(void *)(v11 + 56) = _Block_copy(aBlock);
      sub_180282AF8((char *)v11);
      return 0LL;
    }

    else
    {
      return 18LL;
    }
  }

  return result;
}

uint64_t sub_18028733C()
{
  return write_NOCANCEL();
}

uint32_t notify_check(int token, int *check)
{
  mach_msg_return_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  BOOL v31;
  mach_msg_header_t msg;
  uint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  uint64_t v4 = sub_180281890();
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      unsigned int v12 = sub_18028242C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v12)
      {
        int v11 = v12;
        if (v12 >= 0xB)
        {
          int v11 = 1000000;
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if ((_DWORD)has_internal_diagnostics)
          {
LABEL_65:
            sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v14,  v15,  v16,  v17,  v18,  v19,  v20,  (char)"notify_check");
            goto LABEL_68;
          }

LABEL_67:
          sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v15,  v16,  v17,  v18,  v19,  v20,  (char)"notify_check");
          goto LABEL_68;
        }

        goto LABEL_68;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }

  if (check)
  {
    uint64_t v6 = sub_180282A74();
    if (v6)
    {
      uint64_t v7 = v6;
      if ((*(_DWORD *)(v6 + 24) & 0x80000000) != 0)
      {
        os_unfair_lock_lock_with_options();
        uint64_t v21 = os_set_64_ptr_find();
        if (v21 && (uint64_t v22 = *(void *)(v4 + 224), v22 != v21))
        {
          uint64_t v28 = v21 - v22;
          uint64_t v29 = *(_DWORD *)(*(void *)(v28 + 48) + 60LL);
          if (v29 == *(_DWORD *)(v28 + 72))
          {
            uint64_t v30 = 0;
          }

          else
          {
            *(_DWORD *)(v28 + 72) = v29;
            uint64_t v30 = 1;
          }

          unsigned int v10 = 0;
          *check = v30;
        }

        else
        {
          unsigned int v10 = 2;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 344));
LABEL_63:
        sub_180282AF8((char *)v7);
        if (v10 < 0xB)
        {
          int v11 = v10;
          goto LABEL_68;
        }

        int v11 = 1000000;
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        goto LABEL_67;
      }

      if (qword_18C444A00 != -1) {
        dispatch_once(&qword_18C444A00, &unk_189638BE0);
      }
      if (byte_18C444A10)
      {
        qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return v6;
      }

      int v8 = *(_DWORD *)(v7 + 24);
      if ((v8 & 0xF) == 1)
      {
        if (*(void *)(v4 + 592))
        {
          *check = 0;
          os_unfair_lock_lock_with_options();
          uint64_t v9 = *(void *)(v4 + 592);
          if (*(_DWORD *)(v7 + 32) != *(_DWORD *)(v9 + 4LL * *(unsigned int *)(v7 + 28)))
          {
            *check = 1;
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v9 + 4LL * *(unsigned int *)(v7 + 28));
          }

          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 108));
          unsigned int v10 = 0;
        }

        else
        {
          unsigned int v10 = 32;
        }

        goto LABEL_63;
      }

      if (!*(_DWORD *)(v4 + 384))
      {
        unsigned int v10 = sub_180281C00(v4);
        if (v10) {
          goto LABEL_63;
        }
        int v8 = *(_DWORD *)(v7 + 24);
      }

      int v23 = token;
      if ((v8 & 0x4000000) != 0) {
        int v23 = *(_DWORD *)(*(void *)(v7 + 104) + 48LL);
      }
      mach_port_t v24 = *(_DWORD *)(v4 + 384);
      unsigned int v34 = *MEMORY[0x1895FF688];
      int v35 = v23;
      mach_port_t special_reply_port = mig_get_special_reply_port();
      msg.msgh_remote_port = v24;
      msg.msgh_local_port = special_reply_port;
      msg.msgh_bits = 5395;
      *(void *)&msg.msgh_voucher_port = 0x3EA00000000LL;
      if (MEMORY[0x189600168])
      {
        voucher_mach_msg_set(&msg);
        mach_port_t special_reply_port = msg.msgh_local_port;
      }

      uint64_t v26 = mach_msg(&msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
      uint64_t v27 = v26;
      if ((v26 - 268435458) <= 0xE && ((1 << (v26 - 2)) & 0x4003) != 0)
      {
        unsigned int v10 = 33;
        goto LABEL_63;
      }

      if (v26)
      {
        mig_dealloc_special_reply_port();
        goto LABEL_60;
      }

      if (msg.msgh_id == 71)
      {
        uint64_t v27 = -308;
      }

      else if (msg.msgh_id == 1102)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 44)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v27 = v35;
              if (!v35)
              {
                unsigned int v10 = v37;
                *check = v36;
                goto LABEL_63;
              }

              goto LABEL_59;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              uint64_t v31 = 1;
            }
            else {
              uint64_t v31 = v35 == 0;
            }
            if (v31) {
              uint64_t v27 = -300;
            }
            else {
              uint64_t v27 = v35;
            }
            goto LABEL_59;
          }
        }

        uint64_t v27 = -300;
      }

      else
      {
        uint64_t v27 = -301;
      }

        mach_msg_destroy(&msg);
        goto LABEL_68;
      }
    }

    if (!v9) {
      dispatch_once(&qword_18C4449F0, &unk_189638C60);
    }
    unsigned int v13 = sub_18028A654(v5, token, state64, &v50, &v51, byte_18C4449E8);
    uint64_t v30 = v51;
    goto LABEL_69;
  }

  mach_port_t v24 = (os_unfair_lock_s *)(v5 + 344);
  os_unfair_lock_lock_with_options();
  uint64_t v25 = os_set_64_ptr_find();
  if (v25 && (uint64_t v26 = *(void *)(v5 + 192), v27 = (void *)(v25 - v26), v25 != v26))
  {
    if (v27[1])
    {
      v27[3] = state64;
      LODWORD(v2) = 0;
      v27[4] = mach_absolute_time();
    }

    else
    {
      LODWORD(v2) = 7;
    }
  }

  else
  {
    LODWORD(v2) = 1;
  }

  os_unfair_lock_unlock(v24);
  sub_180282AF8((char *)v8);
  return v2;
}

LABEL_59:
      mach_msg_destroy(&msg);
LABEL_60:
      if (v27) {
        unsigned int v10 = 33;
      }
      else {
        unsigned int v10 = 0;
      }
      goto LABEL_63;
    }

    int v11 = 2;
  }

  else
  {
    int v11 = 10;
  }

void notify_peek(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = sub_180281890();
  if ((*(_DWORD *)(v3 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(_DWORD **)(v3 + 592);
    if (v4 && *v4 != *(_DWORD *)(v3 + 112))
    {
      unsigned int v10 = sub_18028242C(v3);
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
      if (v10)
      {
        if (v10 < 0xB) {
          return;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((_DWORD)has_internal_diagnostics)
        {
LABEL_25:
          sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_peek");
          return;
        }

LABEL_30:
        sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_peek");
        return;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
    }
  }

  uint64_t v5 = sub_180282A74();
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  if ((*(_DWORD *)(v5 + 24) & 0x80000000) != 0)
  {
    if (a2)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v8 = os_set_64_ptr_find();
      if (v8)
      {
        uint64_t v9 = *(void *)(v3 + 224);
        if (v9 != v8) {
          *a2 = *(_DWORD *)(*(void *)(v8 - v9 + 48) + 60LL);
        }
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 344));
    }

    goto LABEL_28;
  }

  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10)
  {
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
    return;
  }

  if ((*(_DWORD *)(v6 + 24) & 0xF) != 1) {
    goto LABEL_28;
  }
  uint64_t v7 = *(void *)(v3 + 592);
  if (!v7)
  {
    sub_180282AF8((char *)v6);
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    goto LABEL_30;
  }

  *a2 = *(_DWORD *)(v7 + 4LL * *(unsigned int *)(v6 + 28));
LABEL_28:
  sub_180282AF8((char *)v6);
}

void notify_monitor_file(int a1, const char *a2, int a3)
{
  mach_msg_return_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  _BYTE msg[28];
  const char *v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  uint64_t v6 = sub_180281890();
  if ((*(_DWORD *)(v6 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v7 = *(_DWORD **)(v6 + 592);
    if (v7 && *v7 != *(_DWORD *)(v6 + 112))
    {
      unsigned int v10 = sub_18028242C(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
      if (v10)
      {
        if (v10 < 0xB) {
          return;
        }
        uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
        goto LABEL_34;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
    }
  }

  if (!a2) {
    return;
  }
  uint64_t v8 = sub_180282A74();
  if (!v8) {
    return;
  }
  uint64_t v9 = v8;
  if ((*(_DWORD *)(v8 + 24) & 0x80000000) != 0) {
    goto LABEL_12;
  }
  if (qword_18C444A00 != -1) {
    dispatch_once(&qword_18C444A00, &unk_189638BE0);
  }
  if (byte_18C444A10)
  {
    qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
    __break(1u);
    return;
  }

  if (*(void *)(v9 + 88))
  {
LABEL_12:
    sub_180282AF8((char *)v9);
    return;
  }

  if (*(_DWORD *)(v6 + 384) || (int v32 = sub_180281C00(v6)) == 0)
  {
    uint64_t v19 = strdup(a2);
    if (v19)
    {
      uint64_t v20 = v19;
      int v21 = strlen(a2) + 1;
      if ((*(_BYTE *)(v9 + 27) & 4) != 0) {
        a1 = *(_DWORD *)(*(void *)(v9 + 104) + 48LL);
      }
      int v22 = *(_DWORD *)(v6 + 384);
      int v35 = a2;
      uint64_t v36 = 16777472;
      unsigned int v37 = v21;
      unsigned int v38 = *MEMORY[0x1895FF688];
      uint64_t v39 = a1;
      uint64_t v40 = v21;
      unsigned int v41 = a3;
      *(_DWORD *)mach_msg_header_t msg = -2147483629;
      *(_DWORD *)&msg[8] = v22;
      *(_OWORD *)&msg[12] = xmmword_18028AD60;
      if (MEMORY[0x189600168]) {
        voucher_mach_msg_set((mach_msg_header_t *)msg);
      }
      int v23 = mach_msg((mach_msg_header_t *)msg, 1, 0x40u, 0, 0, 0, 0);
      *(void *)(v9 + 88) = v20;
      *(_DWORD *)(v9 + 96) = a3;
      sub_180282AF8((char *)v9);
      if (v23)
      {
        mach_port_t v24 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v24) {
          sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (char)"notify_monitor_file");
        }
        else {
          sub_180281A70( v24,  "Libnotify: %s failed with code %d (%d) on line %d",  v26,  v27,  v28,  v29,  v30,  v31,  (char)"notify_monitor_file");
        }
      }

      return;
    }

    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
LABEL_34:
    sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_monitor_file");
    return;
  }

  unsigned int v33 = v32;
  sub_180282AF8((char *)v9);
  if (v33 >= 0xB)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
LABEL_37:
    sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v13,  v14,  v15,  v16,  v17,  v18,  (char)"notify_monitor_file");
  }

uint64_t notify_get_event(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4)
{
  if ((byte_18C512958 & 1) == 0)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics) {
      sub_180280F04( "Libnotify client using deprecated function notify_get_event; this function does nothing",
    }
        v7,
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        v15);
    else {
      sub_180281A70( has_internal_diagnostics,  "Libnotify client using deprecated function notify_get_event; this function does nothing",
    }
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        v15);
    byte_18C512958 = 1;
  }

  if (a2) {
    *a2 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 0LL;
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  mach_msg_return_t v12;
  int v13;
  uint32_t v14;
  unsigned int v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  mach_port_t msgh_local_port;
  mach_msg_return_t v28;
  BOOL v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint32_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  mach_msg_header_t msg;
  uint64_t v50;
  _BYTE v51[12];
  unint64_t v52;
  uint32_t v53;
  uint64_t v54;
  uint32_t v54 = *MEMORY[0x1895FEE08];
  uint64_t v4 = sub_180281890();
  if ((*(_DWORD *)(v4 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v5 = *(_DWORD **)(v4 + 592);
    if (v5 && *v5 != *(_DWORD *)(v4 + 112))
    {
      uint64_t v16 = sub_18028242C(v4);
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
      if (v16)
      {
        uint64_t v14 = v16;
        if (v16 >= 0xB)
        {
          uint64_t v14 = 1000000;
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if ((_DWORD)has_internal_diagnostics) {
            sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"notify_get_state");
          }
          else {
            sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v19,  v20,  v21,  v22,  v23,  v24,  (char)"notify_get_state");
          }
        }

        return v14;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 104));
    }
  }

  uint64_t v6 = sub_180282A74();
  if (!v6) {
    return 2;
  }
  uint64_t v7 = v6;
  if (!*(void *)(v6 + 104))
  {
    sub_180282AF8((char *)v6);
    return 2;
  }

  if ((*(_DWORD *)(v6 + 24) & 0x80000000) == 0)
  {
    if (qword_18C444A00 != -1) {
      dispatch_once(&qword_18C444A00, &unk_189638BE0);
    }
    if (byte_18C444A10)
    {
      qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
      __break(1u);
    }

    if (!*(_DWORD *)(v4 + 384))
    {
      uint64_t v30 = sub_180281C00(v4);
      if (v30)
      {
        uint64_t v14 = v30;
        sub_180282AF8((char *)v7);
        if (v14 >= 0xB)
        {
          uint64_t v31 = os_variant_has_internal_diagnostics();
          if ((_DWORD)v31) {
            sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v32,  v33,  v34,  v35,  v36,  v37,  v38,  (char)"notify_get_state");
          }
          else {
            sub_180281A70( v31,  "Libnotify: %s failed with code %d on line %d",  v33,  v34,  v35,  v36,  v37,  v38,  (char)"notify_get_state");
          }
          return 1000000;
        }

        return v14;
      }
    }

    uint64_t v8 = *(os_unfair_lock_s **)(v7 + 104);
    if ((*(_BYTE *)(v7 + 27) & 4) != 0) {
      token = v8[12]._os_unfair_lock_opaque;
    }
    os_unfair_lock_lock_with_options();
    unint64_t v9 = *(void *)&v8->_os_unfair_lock_opaque;
    os_unfair_lock_unlock(v8 + 10);
    mach_port_t v10 = *(_DWORD *)(v4 + 384);
    if (v9 >= 0xFFFFFFFFFFFFFFFELL)
    {
      uint64_t v50 = *MEMORY[0x1895FF688];
      *(_DWORD *)uint64_t v51 = token;
      mach_port_t special_reply_port = mig_get_special_reply_port();
      msg.msgh_remote_port = v10;
      msg.msgh_local_port = special_reply_port;
      msg.msgh_bits = 5395;
      *(void *)&msg.msgh_voucher_port = 0x3FA00000000LL;
      if (MEMORY[0x189600168])
      {
        voucher_mach_msg_set(&msg);
        mach_port_t special_reply_port = msg.msgh_local_port;
      }

      uint64_t v12 = mach_msg(&msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
      uint64_t v13 = v12;
      if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
      {
        sub_180282AF8((char *)v7);
LABEL_81:
        uint64_t v14 = 1000000;
        unsigned int v41 = os_variant_has_internal_diagnostics();
        if ((_DWORD)v41) {
          sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v42,  v43,  v44,  v45,  v46,  v47,  v48,  (char)"notify_get_state");
        }
        else {
          sub_180281A70( v41,  "Libnotify: %s failed with code %d (%d) on line %d",  v43,  v44,  v45,  v46,  v47,  v48,  (char)"notify_get_state");
        }
        return v14;
      }

      if (v12)
      {
        mig_dealloc_special_reply_port();
LABEL_89:
        uint64_t v40 = 0;
        goto LABEL_90;
      }

      if (msg.msgh_id == 71)
      {
        uint64_t v13 = -308;
      }

      else if (msg.msgh_id == 1118)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 56)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v13 = *(_DWORD *)v51;
              if (!*(_DWORD *)v51)
              {
                *state64 = *(void *)&v51[4];
                unint64_t v9 = v52;
                uint64_t v40 = v53;
LABEL_90:
                if (!(v13 | v40))
                {
                  sub_1802883DC(v8, v9);
                  sub_180282AF8((char *)v7);
                  return 0;
                }

LABEL_80:
                sub_180282AF8((char *)v7);
                if (!v13 && v40 < 0xB) {
                  return v40;
                }
                goto LABEL_81;
              }

              goto LABEL_88;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              uint64_t v39 = 1;
            }
            else {
              uint64_t v39 = *(_DWORD *)v51 == 0;
            }
            if (v39) {
              uint64_t v13 = -300;
            }
            else {
              uint64_t v13 = *(_DWORD *)v51;
            }
            goto LABEL_88;
          }
        }

        uint64_t v13 = -300;
      }

      else
      {
        uint64_t v13 = -301;
      }

LABEL_88:
      mach_msg_destroy(&msg);
      goto LABEL_89;
    }

    uint64_t v50 = *MEMORY[0x1895FF688];
    *(void *)uint64_t v51 = v9;
    msgh_local_port = mig_get_special_reply_port();
    msg.msgh_remote_port = v10;
    msg.msgh_local_port = msgh_local_port;
    msg.msgh_bits = 5395;
    *(void *)&msg.msgh_voucher_port = 0x3F900000000LL;
    if (MEMORY[0x189600168])
    {
      voucher_mach_msg_set(&msg);
      msgh_local_port = msg.msgh_local_port;
    }

    uint64_t v28 = mach_msg(&msg, 3162115, 0x28u, 0x38u, msgh_local_port, 0, 0);
    uint64_t v13 = v28;
    if ((v28 - 268435458) > 0xE || ((1 << (v28 - 2)) & 0x4003) == 0)
    {
      if (!v28)
      {
        if (msg.msgh_id == 71)
        {
          uint64_t v13 = -308;
        }

        else if (msg.msgh_id == 1117)
        {
          if ((msg.msgh_bits & 0x80000000) == 0)
          {
            if (msg.msgh_size == 48)
            {
              if (!msg.msgh_remote_port)
              {
                uint64_t v13 = *(_DWORD *)v51;
                if (!*(_DWORD *)v51)
                {
                  *state64 = *(void *)&v51[4];
                  uint64_t v40 = v52;
                  goto LABEL_80;
                }

                goto LABEL_78;
              }
            }

            else if (msg.msgh_size == 36)
            {
              if (msg.msgh_remote_port) {
                uint64_t v29 = 1;
              }
              else {
                uint64_t v29 = *(_DWORD *)v51 == 0;
              }
              if (v29) {
                uint64_t v13 = -300;
              }
              else {
                uint64_t v13 = *(_DWORD *)v51;
              }
              goto LABEL_78;
            }
          }

          uint64_t v13 = -300;
        }

        else
        {
          uint64_t v13 = -301;
        }

LABEL_78:
        mach_msg_destroy(&msg);
        goto LABEL_79;
      }

      mig_dealloc_special_reply_port();
    }

LABEL_79:
    uint64_t v40 = 0;
    goto LABEL_80;
  }

  if (state64)
  {
    *state64 = 0LL;
    os_unfair_lock_lock_with_options();
    uint64_t v25 = os_set_64_ptr_find();
    if (v25 && (uint64_t v26 = *(void *)(v4 + 192), v26 != v25))
    {
      uint64_t v14 = 0;
      *state64 = *(void *)(v25 - v26 + 24);
    }

    else
    {
      uint64_t v14 = 1;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 344));
  }

  else
  {
    uint64_t v14 = 10;
  }

  sub_180282AF8((char *)v7);
  return v14;
}

void sub_1802883DC(os_unfair_lock_s *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = a1 + 10;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner(v4);
    *(void *)&a1->_os_unfair_lock_opaque = a2;
    os_unfair_lock_unlock(v4);
  }

uint32_t notify_set_state(int token, uint64_t state64)
{
  mach_msg_return_t v12;
  int v13;
  BOOL v14;
  uint64_t has_internal_diagnostics;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  mach_port_t v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  mach_msg_header_t msg;
  uint64_t v53;
  __int128 v54;
  int v55;
  uint64_t v5 = sub_180281890();
  if ((*(_DWORD *)(v5 + 116) & 2) != 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v6 = *(_DWORD **)(v5 + 592);
    if (v6 && *v6 != *(_DWORD *)(v5 + 112))
    {
      pid_t v2 = (os_unfair_lock_s *)sub_18028242C(v5);
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
      if ((_DWORD)v2)
      {
        if (v2 >= 0xB)
        {
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if ((_DWORD)has_internal_diagnostics) {
            sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"notify_set_state");
          }
          else {
            sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v18,  v19,  v20,  v21,  v22,  v23,  (char)"notify_set_state");
          }
          LODWORD(v2) = 1000000;
        }

        return v2;
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 104));
    }
  }

  uint64_t v7 = sub_180282A74();
  if (!v7)
  {
LABEL_35:
    LODWORD(v2) = 2;
    return v2;
  }

  uint64_t v8 = v7;
  if (!*(void *)(v7 + 104))
  {
    sub_180282AF8((char *)v7);
    goto LABEL_35;
  }

  if ((*(_DWORD *)(v7 + 24) & 0x80000000) == 0)
  {
    BOOL v9 = qword_18C444A00 == -1;
    if (qword_18C444A00 != -1) {
      dispatch_once(&qword_18C444A00, &unk_189638BE0);
    }
    if (byte_18C444A10)
    {
      qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
      __break(1u);
    }

    else
    {
      if (!*(_DWORD *)(v5 + 384))
      {
        uint64_t v31 = sub_180281C00(v5);
        if (v31)
        {
          int v32 = v31;
          sub_180282AF8((char *)v8);
          LODWORD(v2) = v32;
          if (v32 >= 0xB)
          {
            LODWORD(v2) = 1000000;
            unsigned int v33 = os_variant_has_internal_diagnostics();
            if ((_DWORD)v33) {
              sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (char)"notify_set_state");
            }
            else {
              sub_180281A70( v33,  "Libnotify: %s failed with code %d on line %d",  v35,  v36,  v37,  v38,  v39,  v40,  (char)"notify_set_state");
            }
          }

          return v2;
        }
      }

      uint64_t v51 = 0;
      pid_t v2 = *(os_unfair_lock_s **)(v8 + 104);
      if ((*(_BYTE *)(v8 + 27) & 4) != 0) {
        token = v2[12]._os_unfair_lock_opaque;
      }
      os_unfair_lock_lock_with_options();
      uint64_t v50 = *(void *)&v2->_os_unfair_lock_opaque;
      os_unfair_lock_unlock(v2 + 10);
      if (v50 < 0xFFFFFFFFFFFFFFFELL)
      {
        uint64_t v51 = 0;
        uint64_t v28 = *(_DWORD *)(v5 + 384);
        if ((*(_DWORD *)(v5 + 116) & 4) != 0)
        {
          if (qword_18C4449F0 != -1) {
            dispatch_once(&qword_18C4449F0, &unk_189638C60);
          }
          uint64_t v29 = sub_18028A5D4(v28, v50, state64, byte_18C4449E8);
        }

        else
        {
          if (qword_18C4449F0 != -1) {
            dispatch_once(&qword_18C4449F0, &unk_189638C60);
          }
          uint64_t v53 = *MEMORY[0x1895FF688];
          *(void *)&uint32_t v54 = v50;
          *((void *)&v54 + 1) = state64;
          uint64_t v55 = byte_18C4449E8;
          msg.msgh_bits = 19;
          msg.msgh_remote_port = v28;
          msg.msgh_local_port = 0;
          msg.msgh_voucher_port = 0;
          msg.msgh_id = 1019;
          if (MEMORY[0x189600168]) {
            voucher_mach_msg_set(&msg);
          }
          uint64_t v29 = mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
        }

        uint64_t v13 = v29;
        uint64_t v30 = 0;
LABEL_71:
        if (v13 | v30)
        {
          sub_180282AF8((char *)v8);
          if (v13)
          {
            uint64_t v42 = os_variant_has_internal_diagnostics();
            LODWORD(v2) = 1000000;
            if ((_DWORD)v42) {
              sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v43,  v44,  v45,  v46,  v47,  v48,  v49,  (char)"notify_set_state");
            }
            else {
              sub_180281A70( v42,  "Libnotify: %s failed with code %d (%d) on line %d",  v44,  v45,  v46,  v47,  v48,  v49,  (char)"notify_set_state");
            }
            return v2;
          }
        }

        else
        {
          unsigned int v41 = mach_absolute_time();
          *(void *)(v8 + 72) = state64;
          *(void *)(v8 + 80) = v41;
          sub_180282AF8((char *)v8);
        }

        LODWORD(v2) = 0;
        return v2;
      }

      int v10 = *(_DWORD *)(v5 + 116);
      LODWORD(v5) = *(_DWORD *)(v5 + 384);
      BOOL v9 = qword_18C4449F0 == -1;
      if ((v10 & 4) == 0)
      {
        if (qword_18C4449F0 != -1) {
          dispatch_once(&qword_18C4449F0, &unk_189638C60);
        }
        uint64_t v53 = *MEMORY[0x1895FF688];
        LODWORD(v54) = token;
        *(void *)((char *)&v54 + 4) = state64;
        HIDWORD(v54) = byte_18C4449E8;
        mach_port_t special_reply_port = mig_get_special_reply_port();
        msg.msgh_remote_port = v5;
        msg.msgh_local_port = special_reply_port;
        msg.msgh_bits = 5395;
        *(void *)&msg.msgh_voucher_port = 0x3FC00000000LL;
        if (MEMORY[0x189600168])
        {
          voucher_mach_msg_set(&msg);
          mach_port_t special_reply_port = msg.msgh_local_port;
        }

        uint64_t v12 = mach_msg(&msg, 3162115, 0x30u, 0x38u, special_reply_port, 0, 0);
        uint64_t v13 = v12;
        if (v12)
        {
          mig_dealloc_special_reply_port();
LABEL_68:
          uint64_t v30 = 0;
          goto LABEL_69;
        }

        if (msg.msgh_id == 71)
        {
          uint64_t v13 = -308;
        }

        else if (msg.msgh_id == 1120)
        {
          if ((msg.msgh_bits & 0x80000000) == 0)
          {
            if (msg.msgh_size == 48)
            {
              if (!msg.msgh_remote_port)
              {
                uint64_t v13 = v54;
                if (!(_DWORD)v54)
                {
                  uint64_t v50 = *(void *)((char *)&v54 + 4);
                  uint64_t v30 = HIDWORD(v54);
LABEL_69:
                  if (!(v13 | v30))
                  {
                    sub_1802883DC(v2, v50);
                    uint64_t v30 = 0;
                    uint64_t v13 = 0;
                  }

                  goto LABEL_71;
                }

                goto LABEL_67;
              }
            }

            else if (msg.msgh_size == 36)
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 1;
              }
              else {
                uint64_t v14 = (_DWORD)v54 == 0;
              }
              if (v14) {
                uint64_t v13 = -300;
              }
              else {
                uint64_t v13 = v54;
              }
              goto LABEL_67;
            }
          }

          uint64_t v13 = -300;
        }

        else
        {
          uint64_t v13 = -301;
        }

uint32_t notify_cancel(int token)
{
  uint64_t v1 = sub_180281890();
  if ((*(_DWORD *)(v1 + 116) & 2) == 0)
  {
LABEL_5:
    os_unfair_lock_lock_with_options();
    uint64_t v3 = os_set_32_ptr_find();
    if (v3 && (uint64_t v4 = *(void *)(v1 + 448), v5 = v3 - v4, v3 != v4))
    {
      int v7 = *(_DWORD *)(v5 + 24);
      if ((v7 & 0x1000000) == 0)
      {
        *(_DWORD *)(v5 + 24) = v7 | 0x1000000;
        sub_180282CB4(v1, (char *)v5);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
      return 0;
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
      return 2;
    }
  }

  os_unfair_lock_lock_with_options();
  pid_t v2 = *(_DWORD **)(v1 + 592);
  if (!v2 || *v2 == *(_DWORD *)(v1 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    goto LABEL_5;
  }

  unsigned int v9 = sub_18028242C(v1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
  if (!v9) {
    goto LABEL_5;
  }
  uint32_t v6 = v9;
  if (v9 >= 0xB)
  {
    uint32_t v6 = 1000000;
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics) {
      sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  (char)"notify_cancel");
    }
    else {
      sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v12,  v13,  v14,  v15,  v16,  v17,  (char)"notify_cancel");
    }
  }

  return v6;
}

uint32_t notify_suspend(int token)
{
  mach_msg_return_t v9;
  int v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  os_unfair_lock_s *v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  mach_msg_header_t msg;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v2 = sub_180281890();
  if ((*(_DWORD *)(v2 + 116) & 2) == 0) {
    goto LABEL_5;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(_DWORD **)(v2 + 592);
  if (!v3 || *v3 == *(_DWORD *)(v2 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    goto LABEL_5;
  }

  uint64_t v11 = sub_18028242C(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
  if (!v11)
  {
LABEL_5:
    uint64_t v4 = sub_180282A74();
    if (!v4) {
      return 2;
    }
    uint64_t v5 = v4;
    if ((*(_DWORD *)(v4 + 24) & 0x80000000) != 0)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v12 = os_set_64_ptr_find();
      if (v12)
      {
        uint64_t v13 = *(void *)(v2 + 224);
        if (v13 != v12)
        {
          uint64_t v14 = v12 - v13;
          *(_BYTE *)(v14 + 79) |= 0x20u;
          uint64_t v15 = *(unsigned __int8 *)(v14 + 78);
          if (v15 != 255) {
            *(_BYTE *)(v14 + 78) = v15 + 1;
          }
        }
      }

      uint64_t v16 = (os_unfair_lock_s *)(v2 + 344);
    }

    else
    {
      if (qword_18C444A00 != -1) {
        dispatch_once(&qword_18C444A00, &unk_189638BE0);
      }
      if (byte_18C444A10)
      {
        qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return token;
      }

      if (!*(_DWORD *)(v2 + 384))
      {
        uint64_t v26 = sub_180281C00(v2);
        if (v26)
        {
          uint64_t v11 = v26;
          sub_180282AF8((char *)v5);
          if (v11 >= 0xB)
          {
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if ((_DWORD)has_internal_diagnostics)
            {
LABEL_34:
              sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"notify_suspend");
              return 1000000;
            }

LABEL_54:
        mach_msg_destroy(&msg);
LABEL_55:
        sub_180282AF8((char *)v5);
        if (v10) {
          goto LABEL_56;
        }
        return 0;
      }

      *(_DWORD *)(v5 + 24) = v6 | 0x800000;
      uint64_t v16 = (os_unfair_lock_s *)(*(void *)(v5 + 104) + 40LL);
    }

    os_unfair_lock_unlock(v16);
    sub_180282AF8((char *)v5);
    return 0;
  }

  if (v11 >= 0xB)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    goto LABEL_47;
  }

  return v11;
}

uint32_t notify_resume(int token)
{
  mach_msg_return_t v9;
  int v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t has_internal_diagnostics;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  mach_msg_header_t msg;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v2 = sub_180281890();
  if ((*(_DWORD *)(v2 + 116) & 2) == 0) {
    goto LABEL_5;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(_DWORD **)(v2 + 592);
  if (!v3 || *v3 == *(_DWORD *)(v2 + 112))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
    goto LABEL_5;
  }

  uint64_t v11 = sub_18028242C(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
  if (!v11)
  {
LABEL_5:
    uint64_t v4 = sub_180282A74();
    if (!v4) {
      return 2;
    }
    uint64_t v5 = v4;
    if ((*(_DWORD *)(v4 + 24) & 0x80000000) != 0)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v12 = os_set_64_ptr_find();
      if (v12)
      {
        uint64_t v13 = *(void *)(v2 + 224);
        uint64_t v14 = v12 - v13;
        if (v12 != v13)
        {
          if (!*(_BYTE *)(v14 + 78) || (uint64_t v15 = *(_BYTE *)(v14 + 78) - 1, (*(_BYTE *)(v14 + 78) = v15) == 0))
          {
            uint64_t v16 = *(_BYTE *)(v14 + 79);
            *(_BYTE *)(v14 + 79) = v16 & 0x5F;
            if ((v16 & 0x40) != 0) {
              sub_18028102C(v2 + 128, v14);
            }
          }
        }
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 344));
    }

    else
    {
      if (qword_18C444A00 != -1) {
        dispatch_once(&qword_18C444A00, &unk_189638BE0);
      }
      if (byte_18C444A10)
      {
        qword_18C512920 = (uint64_t)"BUG IN CLIENT OF LIBNOTIFY: loopback mode enabled but process wants to IPC to notifyd";
        __break(1u);
        return token;
      }

      if (!*(_DWORD *)(v2 + 384))
      {
        uint64_t v26 = sub_180281C00(v2);
        if (v26)
        {
          uint64_t v11 = v26;
          sub_180282AF8((char *)v5);
          if (v11 >= 0xB)
          {
            uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
            if ((_DWORD)has_internal_diagnostics)
            {
LABEL_37:
              sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"notify_resume");
              return 1000000;
            }

LABEL_50:
            sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v19,  v20,  v21,  v22,  v23,  v24,  (char)"notify_resume");
            return 1000000;
          }

          return v11;
        }
      }

      os_unfair_lock_lock_with_options();
      int v6 = *(_DWORD *)(v5 + 24);
      if ((v6 & 0x4000000) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v5 + 104) + 40LL));
        mach_port_t v7 = *(_DWORD *)(v2 + 384);
        unsigned int v37 = *MEMORY[0x1895FF688];
        unsigned int v38 = token;
        mach_port_t special_reply_port = mig_get_special_reply_port();
        msg.msgh_remote_port = v7;
        msg.msgh_local_port = special_reply_port;
        msg.msgh_bits = 5395;
        *(void *)&msg.msgh_voucher_port = 0x3ED00000000LL;
        if (MEMORY[0x189600168])
        {
          voucher_mach_msg_set(&msg);
          mach_port_t special_reply_port = msg.msgh_local_port;
        }

        unsigned int v9 = mach_msg(&msg, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
        int v10 = v9;
        if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
        {
          sub_180282AF8((char *)v5);
          goto LABEL_59;
        }

        if (v9)
        {
          mig_dealloc_special_reply_port();
          goto LABEL_58;
        }

        if (msg.msgh_id == 71)
        {
          int v10 = -308;
        }

        else
        {
          if (msg.msgh_id == 1105)
          {
            if ((msg.msgh_bits & 0x80000000) != 0) {
              goto LABEL_56;
            }
            if (msg.msgh_size != 40)
            {
              if (msg.msgh_size == 36)
              {
                if (msg.msgh_remote_port) {
                  uint64_t v27 = 1;
                }
                else {
                  uint64_t v27 = v38 == 0;
                }
                if (v27) {
                  int v10 = -300;
                }
                else {
                  int v10 = v38;
                }
                goto LABEL_57;
              }

              goto LABEL_56;
            }

            if (msg.msgh_remote_port)
            {
LABEL_56:
              int v10 = -300;
              goto LABEL_57;
            }

            int v10 = v38;
            if (v38) {
              goto LABEL_57;
            }
            token = v39;
            sub_180282AF8((char *)v5);
            if (token >= 0xB)
            {
LABEL_59:
              uint64_t v11 = 1000000;
              uint64_t v28 = os_variant_has_internal_diagnostics();
              if ((_DWORD)v28) {
                sub_180280F04( "Libnotify: %s failed with code %d (%d) on line %d",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (char)"notify_resume");
              }
              else {
                sub_180281A70( v28,  "Libnotify: %s failed with code %d (%d) on line %d",  v30,  v31,  v32,  v33,  v34,  v35,  (char)"notify_resume");
              }
              return v11;
            }

            return token;
          }

          int v10 = -301;
        }

LABEL_57:
        mach_msg_destroy(&msg);
LABEL_58:
        sub_180282AF8((char *)v5);
        if (v10) {
          goto LABEL_59;
        }
        return 0;
      }

      *(_DWORD *)(v5 + 24) = v6 & 0xFF3FFFFF;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v5 + 104) + 40LL));
      if ((v6 & 0x400000) != 0) {
        sub_180282B44(v5);
      }
    }

    sub_180282AF8((char *)v5);
    return 0;
  }

  if (v11 >= 0xB)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    goto LABEL_50;
  }

  return v11;
}

uint64_t notify_suspend_pid(int a1)
{
  uint64_t v2 = sub_180281890();
  mach_port_t v3 = *(_DWORD *)(v2 + 384);
  if (v3)
  {
LABEL_2:
    uint64_t v17 = *MEMORY[0x1895FF688];
    int v18 = a1;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v3;
    msg.msgh_id = 1006;
    *(void *)&msg.msgh_local_port = 0LL;
    if (MEMORY[0x189600168]) {
      voucher_mach_msg_set(&msg);
    }
    if (!mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0)) {
      return 0LL;
    }
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v12 = 1000000LL;
LABEL_10:
    sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v6,  v7,  v8,  v9,  v10,  v11,  (char)"notify_suspend_pid");
    return v12;
  }

  uint64_t v13 = v2;
  uint64_t v14 = sub_180281C00(v2);
  if (!(_DWORD)v14)
  {
    mach_port_t v3 = *(_DWORD *)(v13 + 384);
    goto LABEL_2;
  }

  uint64_t v12 = v14;
  uint64_t v12 = 1000000LL;
  uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
LABEL_6:
  sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (char)"notify_suspend_pid");
  return v12;
}

uint64_t notify_resume_pid(int a1)
{
  uint64_t v2 = sub_180281890();
  mach_port_t v3 = *(_DWORD *)(v2 + 384);
  if (v3)
  {
LABEL_2:
    uint64_t v17 = *MEMORY[0x1895FF688];
    int v18 = a1;
    msg.msgh_bits = 19;
    msg.msgh_remote_port = v3;
    msg.msgh_id = 1007;
    *(void *)&msg.msgh_local_port = 0LL;
    if (MEMORY[0x189600168]) {
      voucher_mach_msg_set(&msg);
    }
    if (!mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0)) {
      return 0LL;
    }
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v12 = 1000000LL;
LABEL_10:
    sub_180281A70( has_internal_diagnostics,  "Libnotify: %s failed with code %d on line %d",  v6,  v7,  v8,  v9,  v10,  v11,  (char)"notify_resume_pid");
    return v12;
  }

  uint64_t v13 = v2;
  uint64_t v14 = sub_180281C00(v2);
  if (!(_DWORD)v14)
  {
    mach_port_t v3 = *(_DWORD *)(v13 + 384);
    goto LABEL_2;
  }

  uint64_t v12 = v14;
  uint64_t v12 = 1000000LL;
  uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
LABEL_6:
  sub_180280F04("Libnotify: %s failed with code %d on line %d", v5, v6, v7, v8, v9, v10, v11, (char)"notify_resume_pid");
  return v12;
}

uint64_t notify_simple_post(char *name)
{
  if ((byte_18C512959 & 1) == 0)
  {
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if ((_DWORD)has_internal_diagnostics) {
      sub_180280F04( "Libnotify client using deprecated function notify_simple_post, use notify_post instead",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v11);
    }
    else {
      sub_180281A70( has_internal_diagnostics,  "Libnotify client using deprecated function notify_simple_post, use notify_post instead",  v4,  v5,  v6,  v7,  v8,  v9,  v11);
    }
    byte_18C512959 = 1;
  }

  return notify_post(name);
}

uint64_t notify_dump_status()
{
  mach_msg_return_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int has_internal_diagnostics;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  mach_msg_header_t msg;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v0 = sub_180281890();
  uint64_t v1 = v0;
  if (*(_DWORD *)(v0 + 384) || (uint64_t v6 = sub_180281C00(v0), !(_DWORD)v6))
  {
    if ((creat_NOCANCEL() & 0x80000000) != 0)
    {
      uint64_t v5 = 1000000LL;
      uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
      uint64_t v16 = __error();
      if (has_internal_diagnostics) {
        sub_180280F04( "Libnotify: %s failed with code %d on line %d (errno: %d)",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"notify_dump_status");
      }
      else {
        sub_180281A70( (uint64_t)v16,  "Libnotify: %s failed with code %d on line %d (errno: %d)",  v18,  v19,  v20,  v21,  v22,  v23,  (char)"notify_dump_status");
      }
    }

    else if ((fileport_makeport() & 0x80000000) != 0)
    {
      close_NOCANCEL();
      mach_port_t v24 = os_variant_has_internal_diagnostics();
      uint64_t v5 = 1000000LL;
      if ((_DWORD)v24) {
        sub_180280F04( "Libnotify: %s failed with code %d on line %d (fileport_status: %d)",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  (char)"notify_dump_status");
      }
      else {
        sub_180281A70( v24,  "Libnotify: %s failed with code %d on line %d (fileport_status: %d)",  v26,  v27,  v28,  v29,  v30,  v31,  (char)"notify_dump_status");
      }
    }

    else
    {
      mach_port_t v2 = *(_DWORD *)(v1 + 384);
      uint64_t v42 = 1;
      unsigned int v43 = 0;
      uint64_t v45 = 1114112;
      mach_port_t special_reply_port = mig_get_special_reply_port();
      msg.msgh_remote_port = v2;
      msg.msgh_local_port = special_reply_port;
      msg.msgh_bits = -2147478253;
      *(void *)&msg.msgh_voucher_port = 0x40000000000LL;
      if (MEMORY[0x189600168])
      {
        voucher_mach_msg_set(&msg);
        mach_port_t special_reply_port = msg.msgh_local_port;
      }

      uint64_t v4 = mach_msg(&msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
      if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
      {
        if (v4)
        {
          mig_dealloc_special_reply_port();
        }

        else
        {
          if (msg.msgh_id == 1124
            && (msg.msgh_bits & 0x80000000) == 0
            && msg.msgh_size == 36
            && !msg.msgh_remote_port
            && !v44)
          {
            close_NOCANCEL();
            return 0LL;
          }

          mach_msg_destroy(&msg);
        }
      }

      close_NOCANCEL();
      int v32 = os_variant_has_internal_diagnostics();
      uint64_t v5 = 1000000LL;
      if ((_DWORD)v32) {
        sub_180280F04( "Libnotify: %s failed with code %d on line %d (kstatus: %d)",  v33,  v34,  v35,  v36,  v37,  v38,  v39,  (char)"notify_dump_status");
      }
      else {
        sub_180281A70( v32,  "Libnotify: %s failed with code %d on line %d (kstatus: %d)",  v34,  v35,  v36,  v37,  v38,  v39,  (char)"notify_dump_status");
      }
    }
  }

  else
  {
    uint64_t v5 = v6;
    if (v6 >= 0xB)
    {
      uint64_t v5 = 1000000LL;
      uint64_t v7 = os_variant_has_internal_diagnostics();
      if ((_DWORD)v7) {
        sub_180280F04( "Libnotify: %s failed with code %d on line %d",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (char)"notify_dump_status");
      }
      else {
        sub_180281A70( v7,  "Libnotify: %s failed with code %d on line %d",  v9,  v10,  v11,  v12,  v13,  v14,  (char)"notify_dump_status");
      }
    }
  }

  return v5;
}

uint64_t sub_1802899AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_str_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete", "table.c", 72, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

uint64_t sub_1802899F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_64_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete_64", "table.c", 80, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

uint64_t sub_180289A3C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2 - *(void *)(*(void *)(a1 + 40) + 24LL));
}

uint64_t sub_180289A54(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  uint64_t v9 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v5 = mig_strncpy_zerofill(v12, a2, 512);
  }
  else {
    int v5 = mig_strncpy(v12, a2, 512);
  }
  int v10 = 0;
  int v11 = v5;
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v12[v6] = a3;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 1010;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, v6 + 44, 0, 0, 0, 0);
}

uint64_t sub_180289B4C(mach_port_t a1, const char *a2, int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  int v10 = 1;
  int v11 = a4;
  int v12 = 1114112;
  uint64_t v13 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v6 = mig_strncpy_zerofill(v16, a2, 512);
  }
  else {
    int v6 = mig_strncpy(v16, a2, 512);
  }
  int v14 = 0;
  int v15 = v6;
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v16[v7] = a3;
  msg.msgh_bits = -2147483629;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 1014;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, v7 + 60, 0, 0, 0, 0);
}

uint64_t sub_180289C54(mach_port_t a1, const char *a2, int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  int v10 = 1;
  int v11 = a4;
  int v12 = 1310720;
  uint64_t v13 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v6 = mig_strncpy_zerofill(v16, a2, 512);
  }
  else {
    int v6 = mig_strncpy(v16, a2, 512);
  }
  int v14 = 0;
  int v15 = v6;
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v16[v7] = a3;
  msg.msgh_bits = -2147483629;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 1015;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, v7 + 60, 0, 0, 0, 0);
}

uint64_t sub_180289D5C(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895FF688];
  int v5 = a2;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 1016;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t sub_180289DD4(mach_port_t a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x40100000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x18u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 1125)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v8 = 4294966996LL;
            if (v14)
            {
              if (msg.msgh_remote_port) {
                uint64_t v8 = 4294966996LL;
              }
              else {
                uint64_t v8 = v14;
              }
            }
          }

          else
          {
            uint64_t v8 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v8 = 4294966996LL;
        if (v12 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && v15 << 16 == 0x100000)
        {
          uint64_t v8 = 0LL;
          int v9 = v13;
          *a2 = v16;
          *a3 = v9;
          return v8;
        }
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

LABEL_23:
      mach_msg_destroy(&msg);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

uint64_t sub_180289F44(mach_port_t a1, const char *a2, int a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  uint64_t v18 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v9 = mig_strncpy_zerofill(v21, a2, 512);
  }
  else {
    int v9 = mig_strncpy(v21, a2, 512);
  }
  unsigned int v19 = 0;
  int v20 = v9;
  mach_msg_size_t v10 = ((v9 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v21[(v9 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x40300000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3162115, v10, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988LL;
      }

      else if (msg.msgh_id == 1127)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v13 = 4294966996LL;
          if ((_DWORD)v18 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v20) << 16 == 0x100000)
          {
            uint64_t v13 = 0LL;
            int v15 = HIDWORD(v18);
            *a4 = v22;
            *a5 = v15;
            return v13;
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v13 = 4294966996LL;
          if (v19)
          {
            if (msg.msgh_remote_port) {
              uint64_t v13 = 4294966996LL;
            }
            else {
              uint64_t v13 = v19;
            }
          }
        }

        else
        {
          uint64_t v13 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v13 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v13;
    }

    mig_dealloc_special_reply_port();
  }

  return v13;
}

uint64_t sub_18028A13C(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x40400000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x18u, 0x38u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 1128)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = v15;
              if (!v15)
              {
                int v13 = v17;
                *a2 = v16;
                *a3 = v13;
                *a4 = v18;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = v15 == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v15;
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t sub_18028A29C(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  uint64_t v9 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v5 = mig_strncpy_zerofill(v12, a2, 512);
  }
  else {
    int v5 = mig_strncpy(v12, a2, 512);
  }
  int v10 = 0;
  int v11 = v5;
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v12[v6] = a3;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 1029;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, v6 + 44, 0, 0, 0, 0);
}

uint64_t sub_18028A390( mach_port_t a1, const char *a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int *a12, void *a13, int *a14)
{
  uint64_t v41 = *MEMORY[0x1895FEE08];
  uint64_t v31 = 2LL;
  int v33 = 1310720;
  uint64_t v34 = a9;
  int v35 = 16777472;
  int v36 = a10;
  uint64_t v37 = *MEMORY[0x1895FF688];
  if (MEMORY[0x1895FFE18]) {
    int v21 = mig_strncpy_zerofill(v40, a2, 512);
  }
  else {
    int v21 = mig_strncpy(v40, a2, 512);
  }
  int v38 = 0;
  int v39 = v21;
  uint64_t v22 = (v21 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v23 = v22 + 112;
  mach_port_t v24 = (char *)&v30 + v22;
  *((_DWORD *)v24 + 18) = a3;
  *((_DWORD *)v24 + 19) = a4;
  *((_DWORD *)v24 + 20) = a5;
  *((_DWORD *)v24 + 21) = a6;
  *((void *)v24 + 11) = a7;
  *((void *)v24 + 12) = a8;
  *((_DWORD *)v24 + 26) = a10;
  *((_DWORD *)v24 + 27) = a11;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v30.msgh_remote_port = a1;
  v30.msgh_local_port = special_reply_port;
  v30.msgh_bits = -2147478253;
  *(void *)&v30.msgh_voucher_port = 0x40600000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&v30);
    mach_port_t special_reply_port = v30.msgh_local_port;
  }

  uint64_t v26 = mach_msg(&v30, 3162115, v23, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v27 = v26;
  if ((v26 - 268435458) > 0xE || ((1 << (v26 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v26)
    {
      if (v30.msgh_id == 71)
      {
        uint64_t v27 = 4294966988LL;
      }

      else if (v30.msgh_id == 1130)
      {
        if ((v30.msgh_bits & 0x80000000) == 0)
        {
          if (v30.msgh_size == 52)
          {
            if (!v30.msgh_remote_port)
            {
              uint64_t v27 = v32;
              if (!v32)
              {
                *a12 = v33;
                *a13 = v34;
                *a14 = v35;
                return v27;
              }

              goto LABEL_25;
            }
          }

          else if (v30.msgh_size == 36)
          {
            if (v30.msgh_remote_port) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v32 == 0;
            }
            if (v28) {
              uint64_t v27 = 4294966996LL;
            }
            else {
              uint64_t v27 = v32;
            }
            goto LABEL_25;
          }
        }

        uint64_t v27 = 4294966996LL;
      }

      else
      {
        uint64_t v27 = 4294966995LL;
      }

LABEL_25:
      mach_msg_destroy(&v30);
      return v27;
    }

    mig_dealloc_special_reply_port();
  }

  return v27;
}

uint64_t sub_18028A5D4(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *MEMORY[0x1895FF688];
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  int v9 = a4;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_id = 1031;
  *(void *)&msg.msgh_local_port = 0LL;
  if (MEMORY[0x189600168]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
}

uint64_t sub_18028A654(mach_port_t a1, unsigned int a2, uint64_t a3, void *a4, _DWORD *a5, int a6)
{
  uint64_t v15 = *MEMORY[0x1895FF688];
  unsigned int v16 = a2;
  uint64_t v17 = a3;
  int v18 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x40800000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x30u, 0x38u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 1132)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = v16;
              if (!v16)
              {
                *a4 = v17;
                *a5 = v18;
                return v11;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = v16 == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = v16;
            }
            goto LABEL_22;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895FED58](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1895FE7E8]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1895FE7F8]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1895FEC00]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1895FEC18]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895FEC20]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1895FEC38]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x189600400]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x189600408]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1896004C0]();
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1896009D0]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1895FF968]();
}

uint64_t creat_NOCANCEL()
{
  return MEMORY[0x1895FEFC8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FE8C8](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FE940](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA40](label, attr);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FEAC8](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1895FFA08]();
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FFBA8](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FFC90]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FFCB0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct( ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1895FFCC8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FFCF8](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1895FFDE8]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1895FFE00]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FFE10](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FFE18](dest, src, *(void *)&len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1895FFE88]();
}

uint64_t os_map_64_init()
{
  return MEMORY[0x1895FF4D0]();
}

uint64_t os_set_32_ptr_delete()
{
  return MEMORY[0x1895FF520]();
}

uint64_t os_set_32_ptr_find()
{
  return MEMORY[0x1895FF528]();
}

uint64_t os_set_32_ptr_foreach()
{
  return MEMORY[0x1895FF530]();
}

uint64_t os_set_32_ptr_init()
{
  return MEMORY[0x1895FF538]();
}

uint64_t os_set_32_ptr_insert()
{
  return MEMORY[0x1895FF540]();
}

uint64_t os_set_64_ptr_delete()
{
  return MEMORY[0x1895FF548]();
}

uint64_t os_set_64_ptr_find()
{
  return MEMORY[0x1895FF550]();
}

uint64_t os_set_64_ptr_init()
{
  return MEMORY[0x1895FF558]();
}

uint64_t os_set_64_ptr_insert()
{
  return MEMORY[0x1895FF560]();
}

uint64_t os_set_str_ptr_delete()
{
  return MEMORY[0x1895FF568]();
}

uint64_t os_set_str_ptr_find()
{
  return MEMORY[0x1895FF570]();
}

uint64_t os_set_str_ptr_init()
{
  return MEMORY[0x1895FF578]();
}

uint64_t os_set_str_ptr_insert()
{
  return MEMORY[0x1895FF580]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FF5C0]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FFEA0](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600330](__ptr, __size);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x189600008](a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1895FF398](__str, __sep, __lasts);
}

uint64_t usleep_NOCANCEL()
{
  return MEMORY[0x1895FF430]();
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FF478](a1, a2, a3);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x189600168](msg);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x189600210]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1896009F8](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x189600A08](xarray);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x189600AF0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600B40](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_event_publisher_fire_noboost()
{
  return MEMORY[0x189600BF8]();
}

uint64_t xpc_get_service_identifier_for_token()
{
  return MEMORY[0x189600C08]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x189600C10](object);
}

void xpc_release(xpc_object_t object)
{
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x189600C80](xstring);
}