uint64_t sub_100002C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  result = os_set_32_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete_n", "table.c", 76, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

uint64_t sub_100002C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_64_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete_64", "table.c", 80, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

uint64_t sub_100002CB8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2 - *(void *)(*(void *)(a1 + 40) + 24LL));
}

uint64_t sub_100002CD0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2 - *(void *)(*(void *)(a1 + 40) + 24LL));
}

uint64_t sub_100002CE8(mach_port_name_t name)
{
  uint64_t result = mach_port_request_notification(mach_task_self_, name, 66, 0, dword_100014288, 0x15u, &previous);
  if ((_DWORD)result)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to arm send-possible";
    qword_100014040 = (int)result;
    __break(1u);
    goto LABEL_5;
  }

  if (previous)
  {
LABEL_5:
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: send-possible already armed??";
    qword_100014040 = 0LL;
    __break(1u);
  }

  return result;
}

void sub_100002D88(uint64_t a1)
{
  if (*(_WORD *)(a1 + 76))
  {
    uint64_t v2 = *(unsigned __int16 *)(a1 + 76) - 1;
    v3 = *(void **)(qword_100014290 + 8 * v2);
    *(void *)(qword_100014290 + 8 * v2) = 0LL;
    if ((*(_DWORD *)v3 - 1) <= 1)
    {
      uint64_t v4 = v3[1];
      dispatch_assert_queue_V2((dispatch_queue_t)qword_100014298);
      if (v4)
      {
        v5 = *(dispatch_source_s **)(v4 + 72);
        if (v5) {
          dispatch_source_cancel(v5);
        }
        sub_10000980C(v4);
      }
    }

    free(v3);
    *(_WORD *)(a1 + 76) = 0;
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (!v6) {
    __assert_rtn("port_proc_cancel_client", "notify_proc.c", 330, "n != NULL");
  }
  int v7 = *(_BYTE *)(a1 + 79) & 0xF;
  if (v7 == 7 || v7 == 3)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      *(void *)(v9 + 40) = *(void *)(a1 + 40);
    }
    **(void **)(a1 + 40) = v9;
    goto LABEL_21;
  }

  if (v7 == 1)
  {
    uint64_t v10 = *(unsigned int *)(v6 + 52);
    if (!__CFADD__(qword_1000142E8, 4 * v10))
    {
      --*(_DWORD *)(qword_1000142E8 + 4 * v10);
      goto LABEL_21;
    }

LABEL_25:
    __break(0x5513u);
    return;
  }

LABEL_21:
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    *(void *)(v11 + 24) = *(void *)(a1 + 24);
  }
  **(void **)(a1 + 24) = v11;
  sub_10000910C((unsigned int *)a1);
}

void sub_100002EC4(unsigned int *a1)
{
  if (*(void *)a1)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
    __break(1u);
  }

  else
  {
    uint64_t v2 = a1 + 2;
    sub_100002C28((uint64_t)&unk_1000141F0, a1[2], (uint64_t)(a1 + 2));
    mach_port_deallocate(mach_task_self_, *v2);
    ++dword_10001427C;
    free(a1);
  }
}

void sub_100002F50(_OWORD *a1, unsigned int a2, uid_t *a3, gid_t *a4, _DWORD *a5, unint64_t *a6)
{
  if (a3)
  {
    __int128 v11 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v11;
    *a3 = audit_token_to_euid(&atoken);
  }

  if (a4)
  {
    __int128 v12 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v12;
    *a4 = audit_token_to_egid(&atoken);
  }

  __int128 v13 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v13;
  uint64_t v14 = audit_token_to_pid(&atoken);
  if (a5) {
    *a5 = v14;
  }
  unint64_t v15 = a2 | (unint64_t)(v14 << 32);
  if (a6) {
    *a6 = v15;
  }
  uint64_t v16 = os_set_64_ptr_find(&unk_1000141D0, v15);
  if (v16)
  {
    if (qword_1000141E8 != v16)
    {
      uint64_t v23 = v16 - qword_1000141E8;
      sub_1000070C4((FILE *)7, "duplicate token %d sent from PID %d\n", v17, v18, v19, v20, v21, v22, a2);
      sub_100002D88(v23);
    }
  }

uint64_t sub_100003034(const char *a1, uint64_t a2)
{
  uint64_t result = strncmp(a1, "com.apple.private.restrict-post.", 0x20uLL);
  if ((_DWORD)result) {
    return 1LL;
  }
  if ((unint64_t)a1 >= 0xFFFFFFFFFFFFFFE0LL)
  {
    __break(0x5513u);
  }

  else
  {
    if ((unint64_t)__strlcat_chk(__dst, a1 + 32, 257LL, 257LL) <= 0x100)
    {
      __int128 v12 = (void *)xpc_copy_entitlement_for_token(__dst, a2);
      if (v12)
      {
        __int128 v13 = v12;
        BOOL value = xpc_BOOL_get_value(v12);
        xpc_release(v13);
        if (value) {
          return 1LL;
        }
      }

      __int128 v11 = "Post %s rejected: missing entitlement\n";
    }

    else
    {
      __int128 v11 = "Post %s rejected: respective restricted notification entitlement would be too long\n";
    }

    sub_1000070C4((FILE *)3, v11, v5, v6, v7, v8, v9, v10, (char)a1);
    return 0LL;
  }

  return result;
}

FILE *sub_100003138(const char *a1, void *a2, _DWORD *a3, int a4, __int128 *a5)
{
  int v26 = -1;
  int v27 = -1;
  int v25 = -1;
  *a2 = 0LL;
  __int128 v10 = a5[1];
  __int128 v28 = *a5;
  __int128 v29 = v10;
  sub_100002F50(&v28, 0xFFFFFFFF, (uid_t *)&v27, (gid_t *)&v26, &v25, 0LL);
  int v11 = v27;
  if (a4 && v27)
  {
    __int128 v12 = a5[1];
    __int128 v28 = *a5;
    __int128 v29 = v12;
    if (sub_1000071C0(&v28, (uint64_t)"com.apple.notify.root_access"))
    {
      int v11 = 0;
      int v27 = 0;
    }

    else
    {
      int v11 = v27;
    }
  }

  uint64_t result = (FILE *)sub_100008AFC(a1, v11, v26, 2);
  *a3 = (_DWORD)result;
  if (!(_DWORD)result)
  {
    __int128 v14 = a5[1];
    __int128 v28 = *a5;
    __int128 v29 = v14;
    uint64_t result = (FILE *)sub_100003034(a1, (uint64_t)&v28);
    if ((result & 1) != 0)
    {
      *(void *)&xmmword_100014078 = xmmword_100014078 + 1;
      *(void *)&xmmword_100014098 = xmmword_100014098 + 1;
      int v15 = sub_100007274((uint64_t)a1, v27, v26);
      *a3 = v15;
      if (v15 == 10) {
        __assert_rtn("__notify_server_post_2", "notify_proc.c", 623, "*status != NOTIFY_STATUS_NULL_INPUT");
      }
      uint64_t v16 = os_set_str_ptr_find(&unk_100014190, a1);
      if (!v16 || qword_1000141A8 == v16)
      {
        *a3 = 60;
        *a2 = -1LL;
        ++*((void *)&xmmword_100014078 + 1);
        return sub_1000070C4((FILE *)7, "__notify_server_post %s %d\n", v17, v18, v19, v20, v21, v22, (char)a1);
      }

      uint64_t v23 = v16 - qword_1000141A8;
      ++*(_DWORD *)(v23 + 64);
      uint64_t v24 = *(void *)(v23 + 16);
      *a2 = v24;
      if (v24 == -1) {
        return sub_1000070C4((FILE *)7, "__notify_server_post %s %d\n", v17, v18, v19, v20, v21, v22, (char)a1);
      }
      return sub_1000070C4((FILE *)7, "__notify_server_post %s %d [%llu]\n", v17, v18, v19, v20, v21, v22, (char)a1);
    }

    else
    {
      *a3 = 7;
    }
  }

  return result;
}

int64x2_t sub_100003314(const char *a1, int a2, __int128 *a3)
{
  __int128 v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  sub_100003138(a1, &v7, &v6, a2, v5);
  int64x2_t result = vaddq_s64(*(int64x2_t *)&qword_100014090, (int64x2_t)xmmword_10000E1D0);
  *(int64x2_t *)&qword_100014090 = result;
  return result;
}

uint64_t sub_100003364(const char *a1, unsigned int a2, __int128 *a3)
{
  unint64_t v23 = 0LL;
  int v21 = -1;
  int v22 = -1;
  unsigned int v20 = -1;
  *(__int128 *)((char *)&xmmword_100014098 + 8) = (__int128)vaddq_s64( *(int64x2_t *)((char *)&xmmword_100014098 + 8),  vdupq_n_s64(1uLL));
  __int128 v6 = a3[1];
  __int128 v18 = *a3;
  __int128 v19 = v6;
  sub_100002F50(&v18, a2, (uid_t *)&v22, (gid_t *)&v21, &v20, &v23);
  sub_1000070C4((FILE *)7, "__notify_server_register_plain %s %d %d\n", v7, v8, v9, v10, v11, v12, (char)a1);
  uint64_t v13 = sub_100009610(a1, v20, a2, -1, v22, v21, &v24);
  if (!(_DWORD)v13)
  {
    uint64_t v14 = os_set_64_ptr_find(&unk_1000141D0, v23);
    if (v14) {
      int v15 = (uint64_t *)(v14 - qword_1000141E8);
    }
    else {
      int v15 = 0LL;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      __int128 v16 = a3[1];
      __int128 v18 = *a3;
      __int128 v19 = v16;
      sub_10000AFB4(a1, (uint64_t)v15, &v18);
    }

    sub_100003488(v15, v20);
  }

  return v13;
}

uint64_t *sub_100003488(uint64_t *result, uint64_t a2)
{
  int v2 = a2;
  uint64_t v3 = (uint64_t)result;
  int64x2_t result = (uint64_t *)os_set_32_ptr_find(&unk_100014210, a2);
  if (!result) {
    return sub_100003514(v3, v2);
  }
  if (!v3 || result == (uint64_t *)qword_100014228)
  {
    return sub_100003514(v3, v2);
  }

  uint64_t v4 = (uint64_t *)((char *)result - qword_100014228);
  uint64_t v5 = *(uint64_t *)((char *)result - qword_100014228);
  *(void *)(v3 + 16) = v5;
  if (v5) {
    *(void *)(v5 + 24) = v3 + 16;
  }
  *uint64_t v4 = v3;
  *(void *)(v3 + 24) = v4;
  return result;
}

uint64_t *sub_100003514(uint64_t a1, int a2)
{
  uint64_t v4 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  a2,  0x80000000uLL,  (dispatch_queue_t)qword_100014298);
  dispatch_source_set_event_handler_f(v4, (dispatch_function_t)sub_10000360C);
  int64x2_t result = (uint64_t *)malloc(0x20uLL);
  if (result)
  {
    __int128 v6 = result;
    ++dword_100014278;
    *int64x2_t result = 0LL;
    result[1] = (uint64_t)v4;
    *((_DWORD *)result + 5) = 0;
    *((_DWORD *)result + 4) = a2;
    result[3] = 0LL;
    os_set_32_ptr_insert();
    if (a1)
    {
      uint64_t v7 = *v6;
      *(void *)(a1 + 16) = *v6;
      if (v7) {
        *(void *)(v7 + 24) = a1 + 16;
      }
      *__int128 v6 = a1;
      *(void *)(a1 + 24) = v6;
    }

    dispatch_set_context(v4, v6);
    dispatch_source_set_cancel_handler_f(v4, (dispatch_function_t)sub_100003644);
    dispatch_activate(v4);
    return v6;
  }

  else
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
    __break(1u);
  }

  return result;
}

void sub_10000360C(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  if (v2)
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 16);
      sub_100002D88(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
}

void sub_100003644(void *a1)
{
  if (*a1)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
    __break(1u);
  }

  else
  {
    uint64_t v2 = a1 + 2;
    sub_100002C28((uint64_t)&unk_100014210, *((unsigned int *)a1 + 4), (uint64_t)(a1 + 2));
    ++dword_10001427C;
    uint64_t v10 = (unsigned int *)v2[1];
    if (v10) {
      sub_1000036D0(v10, v3, v4, v5, v6, v7, v8, v9);
    }
    dispatch_release((dispatch_object_t)a1[1]);
    free(a1);
  }

void sub_1000036D0( unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = a1[3];
  if ((v9 & 4) != 0)
  {
    if (*(void *)a1)
    {
      qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
      __break(1u);
    }

    else
    {
      sub_1000070C4((FILE *)7, "do_mach_notify_dead_name freed port %x\n", a3, a4, a5, a6, a7, a8, (char)a1);
      sub_100002EC4(a1);
    }
  }

  else
  {
    a1[3] = v9 | 4;
  }

uint64_t *sub_100003754( const char *a1, unsigned int a2, _DWORD *a3, _DWORD *a4, void *a5, _DWORD *a6, __int128 *a7)
{
  unint64_t v33 = 0LL;
  int v31 = -1;
  int v32 = -1;
  unsigned int v30 = -1;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0LL;
  *a6 = 0;
  __int128 v14 = a7[1];
  __int128 v34 = *a7;
  __int128 v35 = v14;
  sub_100002F50(&v34, a2, (uid_t *)&v32, (gid_t *)&v31, &v30, &v33);
  ++*((void *)&xmmword_100014098 + 1);
  ++qword_1000140B0;
  if (!dword_1000142D8)
  {
    *a3 = -1;
    *a4 = -1;
    __int128 v25 = a7[1];
    __int128 v34 = *a7;
    __int128 v35 = v25;
    return (uint64_t *)sub_100003364(a1, a2, &v34);
  }

  int64x2_t result = (uint64_t *)os_set_str_ptr_find(&unk_100014190, a1);
  if (!result
    || (uint64_t *)qword_1000141A8 == result
    || (uint64_t v22 = *(unsigned int *)((char *)result - qword_1000141A8 + 52), (_DWORD)v22 == -1))
  {
    if (dword_1000142D8 >= 2)
    {
      LODWORD(v22) = dword_1000142DC;
      int v24 = 1;
      do
      {
        uint64_t v22 = (int)v22 + 1 < dword_1000142D8 ? (v22 + 1) : 1LL;
        unint64_t v23 = 4LL * v22;
        if (v23 > ~qword_1000142E8) {
          goto LABEL_33;
        }
        if (!*(_DWORD *)(qword_1000142E8 + 4 * v22))
        {
          if ((_DWORD)v22 == -1) {
            break;
          }
          dword_1000142DC = v22;
          goto LABEL_22;
        }
      }

      while (dword_1000142D8 != ++v24);
    }

    else {
      int v26 = 1;
    }
    dword_1000142DC = v26;
    int64x2_t result = (uint64_t *)sub_1000070C4((FILE *)7, "reused shared memory slot %u\n", v16, v17, v18, v19, v20, v21, v26);
    uint64_t v22 = dword_1000142DC;
    unint64_t v23 = 4LL * dword_1000142DC;
LABEL_22:
    if (__CFADD__(qword_1000142E0, v23))
    {
LABEL_33:
      __break(0x5513u);
      return result;
    }

    *(_DWORD *)(qword_1000142E0 + 4 * v22) = 1;
  }

  else
  {
    unint64_t v23 = 4 * v22;
  }

  if (__CFADD__(qword_1000142E8, v23)) {
    goto LABEL_33;
  }
  ++*(_DWORD *)(qword_1000142E8 + 4 * v22);
  sub_1000070C4((FILE *)7, "__notify_server_register_check %s %d %d\n", v16, v17, v18, v19, v20, v21, (char)a1);
  *a3 = 4 * dword_1000142D8;
  *a4 = v22;
  int64x2_t result = (uint64_t *)sub_100009610(a1, v30, a2, v22, v32, v31, a5);
  *a6 = (_DWORD)result;
  if (!(_DWORD)result)
  {
    uint64_t v27 = os_set_64_ptr_find(&unk_1000141D0, v33);
    if (v27) {
      __int128 v28 = (uint64_t *)(v27 - qword_1000141E8);
    }
    else {
      __int128 v28 = 0LL;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      __int128 v29 = a7[1];
      __int128 v34 = *a7;
      __int128 v35 = v29;
      sub_10000AFB4(a1, (uint64_t)v28, &v34);
    }

    return sub_100003488(v28, v30);
  }

  return result;
}

uint64_t sub_100003A04(const char *a1, unsigned int a2, int a3, __int128 *a4)
{
  unint64_t v26 = 0LL;
  int v24 = -1;
  int v25 = -1;
  unsigned int v23 = -1;
  __int128 v8 = a4[1];
  __int128 v21 = *a4;
  __int128 v22 = v8;
  sub_100002F50(&v21, a2, (uid_t *)&v25, (gid_t *)&v24, &v23, &v26);
  ++*((void *)&xmmword_100014098 + 1);
  *(void *)&xmmword_1000140B8 = xmmword_1000140B8 + 1;
  sub_1000070C4((FILE *)7, "__notify_server_register_signal %s %d %d %d\n", v9, v10, v11, v12, v13, v14, (char)a1);
  if (!a1) {
    return 1LL;
  }
  unsigned int v15 = v23;
  *(void *)&__int128 v21 = 0LL;
  uint64_t result = sub_1000093D4(a1, v23, a2, v25, v24, &v21);
  if (!(_DWORD)result)
  {
    uint64_t v17 = v21;
    *(_BYTE *)(v21 + 79) = *(_BYTE *)(v21 + 79) & 0xF0 | 5;
    *(_DWORD *)(v17 + 68) = v15;
    *(_DWORD *)(v17 + 56) = a3;
    uint64_t v18 = os_set_64_ptr_find(&unk_1000141D0, v26);
    if (v18) {
      uint64_t v19 = (uint64_t *)(v18 - qword_1000141E8);
    }
    else {
      uint64_t v19 = 0LL;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      __int128 v20 = a4[1];
      __int128 v21 = *a4;
      __int128 v22 = v20;
      sub_10000AFB4(a1, (uint64_t)v19, &v21);
    }

    sub_100003488(v19, v23);
    return 0LL;
  }

  return result;
}

uint64_t sub_100003B64(const char *a1, unsigned int a2, uint64_t a3, __int128 *a4)
{
  unint64_t v26 = 0LL;
  int v24 = -1;
  int v25 = -1;
  unsigned int v23 = -1;
  __int128 v8 = a4[1];
  __int128 v21 = *a4;
  __int128 v22 = v8;
  sub_100002F50(&v21, a2, (uid_t *)&v25, (gid_t *)&v24, &v23, &v26);
  ++*((void *)&xmmword_100014098 + 1);
  ++*((void *)&xmmword_1000140B8 + 1);
  sub_1000070C4((FILE *)7, "__notify_server_register_file_descriptor %s %d %d\n", v9, v10, v11, v12, v13, v14, (char)a1);
  uint64_t v15 = fileport_makefd(a3);
  uint64_t result = mach_port_deallocate(mach_task_self_, a3);
  if ((v15 & 0x80000000) == 0)
  {
    uint64_t result = fcntl_NOCANCEL(v15, 3LL);
    if ((result & 0x80000000) == 0)
    {
      uint64_t result = fcntl_NOCANCEL(v15, 4LL);
      if ((result & 0x80000000) == 0)
      {
        if (a1)
        {
          *(void *)&__int128 v21 = 0LL;
          uint64_t result = sub_1000093D4(a1, v23, a2, v25, v24, &v21);
          if (!(_DWORD)result)
          {
            uint64_t v17 = v21;
            *(_BYTE *)(v21 + 79) = *(_BYTE *)(v21 + 79) & 0xF0 | 4;
            *(_DWORD *)(v17 + 56) = v15;
            uint64_t v18 = os_set_64_ptr_find(&unk_1000141D0, v26);
            if (v18) {
              uint64_t v19 = (uint64_t *)(v18 - qword_1000141E8);
            }
            else {
              uint64_t v19 = 0LL;
            }
            if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
            {
              __int128 v20 = a4[1];
              __int128 v21 = *a4;
              __int128 v22 = v20;
              sub_10000AFB4(a1, (uint64_t)v19, &v21);
            }

            return (uint64_t)sub_100003488(v19, v23);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100003CFC(const char *a1, unsigned int a2, uint64_t a3, __int128 *a4)
{
  uint64_t v8 = os_set_32_ptr_find(&unk_1000141F0, a3);
  if (v8) {
    BOOL v9 = qword_100014208 == v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return mach_port_deallocate(mach_task_self_, a3);
  }
  __int128 v10 = a4[1];
  v12[0] = *a4;
  v12[1] = v10;
  return sub_100003DA4(a1, a2, a3, v12);
}

uint64_t sub_100003DA4(const char *a1, unsigned int a2, uint64_t a3, __int128 *a4)
{
  unint64_t v30 = 0LL;
  int v28 = -1;
  int v29 = -1;
  unsigned int v27 = -1;
  __int128 v9 = a4[1];
  __int128 v25 = *a4;
  __int128 v26 = v9;
  sub_100002F50(&v25, a2, (uid_t *)&v29, (gid_t *)&v28, &v27, &v30);
  ++*((void *)&xmmword_100014098 + 1);
  ++qword_1000140C8;
  sub_1000070C4((FILE *)7, "__notify_server_register_mach_port %s %d %d\n", v10, v11, v12, v13, v14, v15, (char)a1);
  if (a1 && (*(void *)&__int128 v25 = 0LL, !sub_1000093D4(a1, v27, a2, v29, v28, &v25)))
  {
    uint64_t v16 = v25;
    *(_BYTE *)(v25 + 79) = *(_BYTE *)(v25 + 79) & 0xF0 | 3;
    *(_DWORD *)(v16 + 56) = a3;
    uint64_t v17 = os_set_64_ptr_find(&unk_1000141D0, v30);
    if (v17) {
      uint64_t v18 = (uint64_t *)(v17 - qword_1000141E8);
    }
    else {
      uint64_t v18 = 0LL;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      __int128 v19 = a4[1];
      __int128 v25 = *a4;
      __int128 v26 = v19;
      sub_10000AFB4(a1, (uint64_t)v18, &v25);
    }

    sub_100003488(v18, v27);
    uint64_t v20 = os_set_32_ptr_find(&unk_1000141F0, a3);
    if (v20 && (__int128 v21 = (uint64_t **)(v20 - qword_100014208), v20 != qword_100014208))
    {
      uint64_t v24 = (uint64_t)*v21;
      v18[4] = (uint64_t)*v21;
      if (v24) {
        *(void *)(v24 + 40) = v18 + 4;
      }
      uint64_t result = 0LL;
      *__int128 v21 = v18;
      v18[5] = (uint64_t)v21;
    }

    else
    {
      uint64_t result = (uint64_t)calloc(1uLL, 0x10uLL);
      if (result)
      {
        __int128 v22 = (uint64_t *)result;
        ++dword_100014278;
        *(void *)uint64_t result = 0LL;
        *(_DWORD *)(result + 8) = a3;
        os_set_32_ptr_insert(&unk_1000141F0, result + 8);
        uint64_t v23 = *v22;
        v18[4] = *v22;
        if (v23) {
          *(void *)(v23 + 40) = v18 + 4;
        }
        *__int128 v22 = (uint64_t)v18;
        v18[5] = (uint64_t)v22;
        if (mach_port_insert_right(mach_task_self_, a3, a3, 0x13u)) {
          sub_100002D88((uint64_t)v18);
        }
        else {
          sub_100002CE8(a3);
        }
        return 0LL;
      }

      else
      {
        qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
        __break(1u);
      }
    }
  }

  else
  {
    mach_port_deallocate(mach_task_self_, a3);
    return 7LL;
  }

  return result;
}

FILE *sub_100004008(unsigned int a1, uint64_t a2, void *a3, int *a4, int a5, __int128 *a6, int a7)
{
  int v34 = -1;
  int v35 = -1;
  unsigned int v33 = -1;
  *a3 = 0LL;
  __int128 v14 = a6[1];
  __int128 v36 = *a6;
  __int128 v37 = v14;
  sub_100002F50(&v36, 0xFFFFFFFF, (uid_t *)&v35, (gid_t *)&v34, &v33, 0LL);
  if (a5)
  {
    if (v35)
    {
      __int128 v15 = a6[1];
      __int128 v36 = *a6;
      __int128 v37 = v15;
    }
  }

  ++qword_100014130;
  ++qword_100014148;
  uint64_t v16 = os_set_64_ptr_find(&unk_1000141D0, a1 | ((unint64_t)v33 << 32));
  if (!v16 || qword_1000141E8 == v16)
  {
    int v23 = 50;
LABEL_8:
    *a4 = v23;
    *a3 = -1LL;
    return sub_1000070C4( (FILE *)7,  "__notify_server_set_state_3 %d %d %llu [uid %d%s gid %d]\n",  v17,  v18,  v19,  v20,  v21,  v22,  v33);
  }

  uint64_t v25 = v16 - qword_1000141E8;
  __int128 v26 = *(const char **)(*(void *)(v16 - qword_1000141E8 + 48) + 8LL);
  __int128 v27 = a6[1];
  __int128 v36 = *a6;
  __int128 v37 = v27;
  if (!sub_100003034(v26, (uint64_t)&v36)
    || a7
    && (__int128 v32 = a6[1],
        __int128 v36 = *a6,
        __int128 v37 = v32,
        sandbox_check_by_audit_token(&v36, "darwin-notification-post", 9LL)))
  {
    int v23 = 7;
    goto LABEL_8;
  }

  uint64_t v28 = *(void *)(v25 + 48);
  if (!v28) {
    __assert_rtn("_internal_notify_server_set_state_3", "notify_proc.c", 1297, "c->name_info != NULL");
  }
  int v29 = sub_100009348(*(void *)(v28 + 16), a2, v35, v34);
  *a4 = v29;
  if (v29) {
    BOOL v30 = v29 == 7;
  }
  else {
    BOOL v30 = 1;
  }
  if (!v30) {
    __assert_rtn( "_internal_notify_server_set_state_3",  "notify_proc.c",  1299,  "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
  }
  uint64_t v31 = *(void *)(*(void *)(v25 + 48) + 16LL);
  *a3 = v31;
  if (v31 != -1) {
    return sub_1000070C4( (FILE *)7,  "__notify_server_set_state_3 %d %d %llu [%llu] [uid %d%s gid %d]\n",  v17,  v18,  v19,  v20,  v21,  v22,  v33);
  }
  return sub_1000070C4( (FILE *)7,  "__notify_server_set_state_3 %d %d %llu [uid %d%s gid %d]\n",  v17,  v18,  v19,  v20,  v21,  v22,  v33);
}

FILE *sub_100004248(uint64_t a1, uint64_t a2, int a3, _OWORD *a4, int a5)
{
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  ++qword_100014130;
  ++*((void *)&xmmword_100014138 + 1);
  __int128 v10 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v10;
  audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, 0LL, 0LL, &pidp, 0LL, 0LL);
  if (a3)
  {
    if (euidp)
    {
      __int128 v11 = a4[1];
      *(_OWORD *)atoken.val = *a4;
      *(_OWORD *)&atoken.val[4] = v11;
    }
  }

  uint64_t result = (FILE *)os_set_64_ptr_find(&unk_1000141B0, a1);
  if (result)
  {
    if ((FILE *)qword_1000141C8 != result)
    {
      uint64_t v13 = *(const char **)((char *)&result->_r - qword_1000141C8);
      __int128 v14 = a4[1];
      *(_OWORD *)atoken.val = *a4;
      *(_OWORD *)&atoken.val[4] = v14;
      uint64_t result = (FILE *)sub_100003034(v13, (uint64_t)&atoken);
      if ((_DWORD)result)
      {
        if (!a5
          || (__int128 v21 = a4[1],
              *(_OWORD *)atoken.val = *a4,
              *(_OWORD *)&atoken.val[4] = v21,
              uint64_t result = (FILE *)sandbox_check_by_audit_token(&atoken, "darwin-notification-post", 9LL),
              !(_DWORD)result))
        {
          uint64_t result = (FILE *)sub_100009348(a1, a2, euidp, egidp);
          if ((_DWORD)result != 7 && (_DWORD)result != 1)
          {
            if ((_DWORD)result) {
              __assert_rtn( "_internal_notify_server_set_state_2",  "notify_proc.c",  1371,  "status == NOTIFY_STATUS_OK || status == NOTIFY_STATUS_NOT_AUTHORIZED || status == NOTIFY_STATUS_INVALID_NAME");
            }
            return sub_1000070C4( (FILE *)7,  "__notify_server_set_state_2 %d %llu %llu [uid %d%s gid %d]\n",  v15,  v16,  v17,  v18,  v19,  v20,  pidp);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000043FC(uint64_t result, const char *a2, int a3, int a4, __int128 *a5)
{
  unsigned int v8 = result;
  gid_t v24 = -1;
  uid_t v25 = -1;
  unsigned int v23 = -1;
  if (a2 || !a3)
  {
    if (!a2) {
      goto LABEL_8;
    }
    if (a3)
    {
      uint64_t v9 = (a3 - 1);
      if (__CFADD__(a2, v9))
      {
        __break(0x5513u);
        return result;
      }

      if (!a2[v9])
      {
LABEL_8:
        __int128 v10 = a5[1];
        __int128 v21 = *a5;
        __int128 v22 = v10;
        sub_100002F50(&v21, 0xFFFFFFFF, &v25, &v24, &v23, 0LL);
        ++*((void *)&xmmword_100014158 + 1);
        sub_1000070C4((FILE *)7, "__notify_server_monitor_file %d %d %s 0x%08x\n", v11, v12, v13, v14, v15, v16, v23);
        uint64_t result = os_set_64_ptr_find(&unk_1000141D0, v8 | ((unint64_t)v23 << 32));
        if (result)
        {
          uint64_t v17 = result - qword_1000141E8;
          if (result != qword_1000141E8)
          {
            uint64_t v18 = *(void *)(v17 + 48);
            if (!v18) {
              __assert_rtn("__notify_server_monitor_file_2", "notify_proc.c", 1422, "n != NULL");
            }
            uint64_t v19 = *(void *)(v18 + 8);
            __int128 v20 = a5[1];
            __int128 v21 = *a5;
            __int128 v22 = v20;
            return sub_10000AC7C(v19, v17, a2, &v21, a4);
          }
        }
      }
    }
  }

  return result;
}

uint64_t *sub_10000452C( uint64_t *result, uint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, unint64_t a8, const char *a9, int a10, int a11, int *a12, void *a13, int *a14, _OWORD *a15)
{
  pidp[0] = -1;
  *a12 = 0;
  *a13 = 0LL;
  *a14 = 0;
  if (!a9 && a10) {
    goto LABEL_3;
  }
  if (!a9) {
    goto LABEL_10;
  }
  if (!a10) {
    goto LABEL_3;
  }
  uint64_t v19 = (a10 - 1);
  if (__CFADD__(a9, v19))
  {
LABEL_44:
    __break(0x5513u);
    return result;
  }

  if (a9[v19])
  {
LABEL_3:
    int v18 = 6;
  }

  else
  {
LABEL_10:
    __int128 v20 = (const char *)result;
    *(void *)&xmmword_100014178 = xmmword_100014178 + 1;
    __int128 v21 = a15[1];
    *(_OWORD *)atoken.val = *a15;
    *(_OWORD *)&atoken.val[4] = v21;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, pidp, 0LL, 0LL);
    uint64_t v46 = a7;
    int v47 = a5;
    uint64_t v23 = a2;
    sub_1000070C4( (FILE *)7,  "__notify_server_regenerate %s %d %d %d %u %d %d %llu %s %d\n",  v24,  v25,  v26,  v27,  v28,  v29,  (char)v20);
    unint64_t v30 = a2 | ((unint64_t)pidp[0] << 32);
    uint64_t result = (uint64_t *)os_set_64_ptr_find(&unk_1000141D0, v30);
    if (!result || (uint64_t *)qword_1000141E8 == result)
    {
      switch(a3)
      {
        case 1:
          uint64_t v31 = a15;
          __int128 v32 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v32;
          uint64_t result = sub_100003754(v20, a2, &v51, a12, a13, a14, (__int128 *)&atoken);
          if (*a14) {
            goto LABEL_36;
          }
          uint64_t v33 = *a12;
          if ((_DWORD)v33 == -1) {
            goto LABEL_36;
          }
          uint64_t v34 = qword_1000142F0;
          if (!qword_1000142F0) {
            goto LABEL_36;
          }
          BOOL v35 = __CFADD__(qword_1000142E0, 4 * v33);
          BOOL v36 = qword_1000142E0 + 4 * v33 >= (unint64_t)qword_1000142E0;
          if (!v36) {
            goto LABEL_44;
          }
          BOOL v37 = __CFADD__(qword_1000142F0, 4LL * a6);
          BOOL v38 = qword_1000142F0 + 4LL * a6 >= (unint64_t)qword_1000142F0;
          if (a6 < 0) {
            BOOL v38 = v37;
          }
          if (!v38) {
            goto LABEL_44;
          }
          *(_DWORD *)(qword_1000142E0 + 4 * v33) = *(_DWORD *)(qword_1000142E0 + 4 * v33)
                                                 + *(_DWORD *)(qword_1000142F0 + 4LL * a6)
                                                 - 1;
          *(_DWORD *)(v34 + 4LL * a6) = 0;
          uint64_t v23 = a2;
LABEL_36:
          if (a9)
          {
            __int128 v43 = v31[1];
            *(_OWORD *)atoken.val = *v31;
            *(_OWORD *)&atoken.val[4] = v43;
            sub_1000043FC(v23, a9, a10, a11, (__int128 *)&atoken);
          }

          uint64_t result = (uint64_t *)os_set_64_ptr_find(&unk_1000141D0, v30);
          if (result)
          {
            uint64_t v44 = qword_1000141E8;
            if ((uint64_t *)qword_1000141E8 != result)
            {
              *a14 = 0;
              v45 = *(void **)((char *)result - v44 + 48);
              *a13 = v45[2];
              if (v45[4] < a8) {
                v45[3] = v46;
              }
              return result;
            }
          }

          if (*a14) {
            return result;
          }
          int v18 = 50;
          break;
        case 2:
          uint64_t v31 = a15;
          __int128 v39 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v39;
          int v40 = sub_100003364(v20, a2, (__int128 *)&atoken);
          goto LABEL_35;
        case 5:
          uint64_t v31 = a15;
          __int128 v41 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v41;
          int v40 = sub_100003A04(v20, a2, v47, (__int128 *)&atoken);
          goto LABEL_35;
        case 7:
          uint64_t v31 = a15;
          __int128 v42 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v42;
          int v40 = sub_100004880(v20, a2, (__int128 *)&atoken);
LABEL_35:
          *a14 = v40;
          goto LABEL_36;
        default:
          int v18 = 52;
          break;
      }
    }

    else
    {
      int v18 = 51;
    }
  }

  *a14 = v18;
  return result;
}

uint64_t sub_100004880(const char *a1, unsigned int a2, __int128 *a3)
{
  unint64_t v33 = 0LL;
  int v31 = -1;
  int v32 = -1;
  unsigned int v30 = -1;
  __int128 v6 = a3[1];
  __int128 v28 = *a3;
  __int128 v29 = v6;
  sub_100002F50(&v28, a2, (uid_t *)&v32, (gid_t *)&v31, &v30, &v33);
  ++*((void *)&xmmword_100014098 + 1);
  *(void *)&xmmword_1000140D8 = xmmword_1000140D8 + 1;
  sub_1000070C4((FILE *)7, "_notify_internal_register_common_port %s %d %d\n", v7, v8, v9, v10, v11, v12, (char)a1);
  uint64_t v13 = os_set_32_ptr_find(&unk_100014210, v30);
  if (v13 && (__int128 v20 = (uint64_t *)(v13 - qword_100014228), v13 != qword_100014228) && v20[3])
  {
    if (a1)
    {
      *(void *)&__int128 v28 = 0LL;
      uint64_t result = sub_1000093D4(a1, v30, a2, v32, v31, &v28);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(v28 + 79) = *(_BYTE *)(v28 + 79) & 0xF0 | 7;
        uint64_t v22 = os_set_64_ptr_find(&unk_1000141D0, v33);
        if (v22) {
          uint64_t v23 = (void *)(v22 - qword_1000141E8);
        }
        else {
          uint64_t v23 = 0LL;
        }
        if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
        {
          __int128 v24 = a3[1];
          __int128 v28 = *a3;
          __int128 v29 = v24;
          sub_10000AFB4(a1, (uint64_t)v23, &v28);
        }

        if (v23)
        {
          uint64_t v25 = *v20;
          v23[2] = *v20;
          if (v25) {
            *(void *)(v25 + 24) = v23 + 2;
          }
          *__int128 v20 = (uint64_t)v23;
          v23[3] = v20;
        }

        uint64_t v26 = (uint64_t *)v20[3];
        uint64_t v27 = *v26;
        v23[4] = *v26;
        if (v27) {
          *(void *)(v27 + 40) = v23 + 4;
        }
        uint64_t result = 0LL;
        *uint64_t v26 = (uint64_t)v23;
        v23[5] = v26;
      }
    }

    else
    {
      return 1LL;
    }
  }

  else
  {
    sub_1000070C4( (FILE *)7,  "_notify_internal_register_common_port FAILED %s %d %d\n",  v14,  v15,  v16,  v17,  v18,  v19,  (char)a1);
    return 59LL;
  }

  return result;
}

uint64_t sub_100004A4C(_DWORD *a1, _DWORD *a2, _DWORD *a3, _OWORD *a4)
{
  pid_t pidp = -1;
  ++*((void *)&xmmword_100014178 + 1);
  __int128 v7 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v7;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  sub_1000070C4((FILE *)7, "__notify_server_checkin %d\n", v8, v9, v10, v11, v12, v13, pidp);
  *a1 = 3;
  uint64_t result = getpid();
  *a2 = result;
  *a3 = 0;
  return result;
}

uint64_t sub_100004AF4(uint64_t a1, _OWORD *a2)
{
  __int128 v4 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v4;
  if (audit_token_to_euid(&atoken)) {
    return mach_port_deallocate(mach_task_self_, a1);
  }
  __int128 v5 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v5;
  __int128 v6 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v6;
  uint64_t v7 = fileport_makefd(a1);
  uint64_t result = mach_port_deallocate(mach_task_self_, a1);
  if ((v7 & 0x80000000) == 0)
  {
    if ((fcntl_NOCANCEL(v7, 3LL) & 0x80000000) == 0 && (fcntl_NOCANCEL(v7, 4LL) & 0x80000000) == 0) {
      sub_100004E98(0, v7);
    }
    return close_NOCANCEL(v7);
  }

  return result;
}

uint64_t sub_100004BE8(const char *a1, unsigned int a2, _DWORD *a3, mach_port_name_t *a4, __int128 *a5)
{
  *a3 = 0;
  *a4 = 0;
  *(_OWORD *)&options.flags = xmmword_10000E250;
  options.reserved[1] = 0LL;
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u)) {
    __assert_rtn("__notify_server_register_mach_port_3", "notify_proc.c", 1847, "kstatus == KERN_SUCCESS");
  }
  __int128 v10 = a5[1];
  v12[0] = *a5;
  v12[1] = v10;
  uint64_t result = sub_100003DA4(a1, a2, name, v12);
  *a3 = result;
  if ((_DWORD)result) {
    return mach_port_destruct(mach_task_self_, name, -1, 0LL);
  }
  *a4 = name;
  return result;
}

int64x2_t sub_100004D04(const char *a1, int a2, __int128 *a3)
{
  __int128 v6 = a3[1];
  __int128 v9 = *a3;
  __int128 v10 = v6;
  if (!sandbox_check_by_audit_token(&v9, "darwin-notification-post", 9LL))
  {
    __int128 v8 = a3[1];
    __int128 v9 = *a3;
    __int128 v10 = v8;
    sub_100003138(a1, &v12, &v11, a2, &v9);
    int64x2_t result = vaddq_s64(*(int64x2_t *)&qword_100014090, (int64x2_t)xmmword_10000E1D0);
    *(int64x2_t *)&qword_100014090 = result;
  }

  return result;
}

uint64_t *sub_100004D98( uint64_t *a1, uint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, unint64_t a8, const char *a9, int a10, int a11, int *a12, void *a13, int *a14, __int128 *a15)
{
  __int128 v18 = a15[1];
  __int128 v27 = *a15;
  __int128 v28 = v18;
  if (sandbox_check_by_audit_token(&v27, "darwin-notification-post", 9LL))
  {
    __int128 v19 = a15[1];
    __int128 v27 = *a15;
    __int128 v28 = v19;
    return sub_10000452C(a1, a2, a3, a4, a5, a6, 0LL, 0LL, a9, a10, a11, a12, a13, a14, &v27);
  }

  else
  {
    __int128 v21 = a15[1];
    __int128 v27 = *a15;
    __int128 v28 = v21;
    return sub_10000452C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, &v27);
  }

FILE *sub_100004E98(int a1, int a2)
{
  if (a2 < 0)
  {
    int64x2_t result = (FILE *)qword_100014048;
    if (!qword_100014048)
    {
      pid_t v4 = getpid();
      asprintf((char **)&qword_100014048, "/var/run/notifyd_%u.status", v4);
      int64x2_t result = (FILE *)qword_100014048;
      if (!qword_100014048) {
        return result;
      }
    }

    unlink((const char *)result);
    int64x2_t result = fopen((const char *)qword_100014048, "w");
  }

  else
  {
    int64x2_t result = fdopen(a2, "w");
  }

  __int128 v5 = result;
  if (!result) {
    return result;
  }
  if (os_variant_has_internal_diagnostics("com.apple.notifyd"))
  {
    __int128 v6 = fopen("/var/run/notifyd_jetsam.log", "r");
    if (v6)
    {
      uint64_t v7 = v6;
      while (1)
      {
        int v8 = fgetc(v7);
        if (v8 == -1) {
          break;
        }
        fputc(v8, v5);
      }

      fclose(v7);
    }
  }

  if (a1 != 1)
  {
    if (!a1) {
      sub_100005BD0(v5);
    }
    return (FILE *)fclose(v5);
  }

  uint64_t v37 = 0LL;
  BOOL v38 = &v37;
  uint64_t v39 = 0x2000000000LL;
  int v40 = 0;
  __int128 v9 = localtime(&qword_1000142D0);
  strftime(v41, 0x80uLL, "%a, %d %b %Y %T %z", v9);
  if (fprintf( v5,  "name         alloc %9u   free %9u   extant %9u\n",  dword_100014268,  dword_10001426C,  dword_100014268 - dword_10001426C) < 0) {
    goto LABEL_133;
  }
  if (fprintf( v5,  "subscription alloc %9u   free %9u   extant %9u\n",  dword_100014270,  dword_100014274,  dword_100014270 - dword_100014274) < 0) {
    goto LABEL_133;
  }
  if (fprintf( v5,  "portproc     alloc %9u   free %9u   extant %9u\n",  dword_100014278,  dword_10001427C,  dword_100014278 - dword_10001427C) < 0) {
    goto LABEL_133;
  }
  int v10 = os_set_32_ptr_count(&unk_1000141F0);
  int v11 = os_set_32_ptr_count(&unk_100014210);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 0x40000000LL;
  v36[2] = sub_1000065B0;
  v36[3] = &unk_100010760;
  v36[4] = &v37;
  v36[5] = v5;
  *(void *)__int128 v41 = _NSConcreteStackBlock;
  uint64_t v42 = 0x40000000LL;
  __int128 v43 = sub_100002CB8;
  uint64_t v44 = &unk_100010530;
  v45 = v36;
  uint64_t v46 = &unk_100014190;
  os_set_str_ptr_foreach(&unk_100014190, v41);
  int v12 = os_set_str_ptr_count(&unk_100014190);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 0x40000000LL;
  v35[2] = sub_100006988;
  v35[3] = &unk_100010780;
  v35[4] = v5;
  *(void *)__int128 v41 = _NSConcreteStackBlock;
  uint64_t v42 = 0x40000000LL;
  __int128 v43 = sub_100002CD0;
  uint64_t v44 = &unk_100010558;
  v45 = v35;
  uint64_t v46 = &unk_1000141D0;
  os_set_64_ptr_foreach(&unk_1000141D0, v41);
  int v13 = os_set_64_ptr_count(&unk_1000141D0);
  int64x2_t result = (FILE *)fprintf(v5, "--- CONTROLLED NAME ---\n");
  int v14 = dword_10001425C;
  if (dword_10001425C)
  {
    uint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
    do
    {
      if (__CFADD__(qword_100014248, v15))
      {
        __break(0x5513u);
LABEL_137:
        __break(0x5500u);
        return result;
      }

      int64x2_t result = (FILE *)fprintf( v5,  "%s %u %u %03x\n",  *(const char **)(*(void *)(qword_100014248 + v15) + 8LL),  *(_DWORD *)(*(void *)(qword_100014248 + v15) + 40LL),  *(_DWORD *)(*(void *)(qword_100014248 + v15) + 44LL),  *(_DWORD *)(*(void *)(qword_100014248 + v15) + 48LL));
      ++v16;
      int v14 = dword_10001425C;
      v15 += 8LL;
    }

    while (v16 < dword_10001425C);
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 0x40000000LL;
  v34[2] = sub_1000069C0;
  v34[3] = &unk_1000107A0;
  v34[4] = v5;
  *(void *)__int128 v41 = _NSConcreteStackBlock;
  uint64_t v42 = 0x40000000LL;
  __int128 v43 = sub_100002CD0;
  uint64_t v44 = &unk_100010558;
  v45 = v34;
  uint64_t v46 = &unk_1000141D0;
  os_set_64_ptr_foreach(&unk_1000141D0, v41);
  int v17 = os_set_str_ptr_count(&unk_100014190);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 0x40000000LL;
  v33[2] = sub_100006A90;
  v33[3] = &unk_1000107C0;
  v33[4] = v5;
  *(void *)__int128 v41 = _NSConcreteStackBlock;
  uint64_t v42 = 0x40000000LL;
  __int128 v43 = sub_100002CD0;
  uint64_t v44 = &unk_100010558;
  v45 = v33;
  uint64_t v46 = &unk_1000141D0;
  os_set_64_ptr_foreach(&unk_1000141D0, v41);
  int v18 = os_set_64_ptr_count(&unk_1000141D0);
  if (fprintf(v5, "--- PRIVATE SERVICE COUNT %u ---\n", v18) < 0
    || fprintf(v5, "\n") < 0
    || fprintf(v5, "--- PROCESSES ---\n") < 0)
  {
    goto LABEL_133;
  }

  if ((v38[3] & 0x80000000) != 0)
  {
LABEL_132:
    fwrite("-- END --\n", 0xAuLL, 1uLL, v5);
    goto LABEL_133;
  }

  uint64_t v19 = 0LL;
  while (1)
  {
    int64x2_t result = (FILE *)os_set_32_ptr_find(&unk_100014210, v19);
    if (result)
    {
      int v32 = (uint64_t *)((char *)result - qword_100014228);
      if (result != (FILE *)qword_100014228) {
        break;
      }
    }

LABEL_130:
    BOOL v28 = __OFADD__((_DWORD)v19, 1);
    uint64_t v19 = (v19 + 1);
    if (v28) {
      goto LABEL_137;
    }
  }

  uint64_t v20 = *v32;
  if (*v32)
  {
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    do
    {
      switch(*(_BYTE *)(v20 + 79) & 0xF)
      {
        case 1:
          BOOL v28 = __OFADD__(v27++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        case 2:
          BOOL v28 = __OFADD__(v26++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        case 3:
          BOOL v28 = __OFADD__(v24++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        case 4:
          BOOL v28 = __OFADD__(v25++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        case 5:
          BOOL v28 = __OFADD__(v23++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        case 6:
          BOOL v28 = __OFADD__(v22++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        case 7:
          BOOL v28 = __OFADD__(v21++, 1);
          if (v28) {
            goto LABEL_137;
          }
          break;
        default:
          break;
      }

      uint64_t v20 = *(void *)(v20 + 16);
    }

    while (v20);
  }

  else
  {
    int v27 = 0;
    int v26 = 0;
    int v25 = 0;
    int v24 = 0;
    int v23 = 0;
    int v22 = 0;
    int v21 = 0;
  }

  if (fprintf(v5, "pid: %u   ", v19) < 0
    || fprintf( v5,  "memory %u   plain %u   port %u   file %u   signal %u   event %u   common %u\n",  v27,  v26,  v24,  v25,  v23,  v22,  v21) < 0)
  {
    goto LABEL_133;
  }

  uint64_t v29 = *v32;
  if (!*v32)
  {
LABEL_129:
    int64x2_t result = (FILE *)fprintf(v5, "\n");
    goto LABEL_130;
  }

  while (1)
  {
    uint64_t v30 = *(_BYTE *)(v29 + 79) & 0xF;
    int v31 = "unknown";
    uint64_t v29 = *(void *)(v29 + 16);
    if (!v29) {
      goto LABEL_129;
    }
  }

LABEL_133:
  _Block_object_dispose(&v37, 8);
  return (FILE *)fclose(v5);
}

size_t sub_100005BD0(FILE *a1)
{
  size_t result = fprintf(a1, "--- GLOBALS ---\n");
  if ((result & 0x80000000) == 0)
  {
    size_t result = fprintf(a1, "%u slots (current id %u)\n", dword_1000142D8, dword_1000142DC);
    if ((result & 0x80000000) == 0)
    {
      size_t result = fprintf(a1, "%u log_cutoff (default %u)\n", dword_1000142F8, dword_1000142FC);
      if ((result & 0x80000000) == 0)
      {
        size_t result = fprintf(a1, "\n");
        if ((result & 0x80000000) == 0)
        {
          size_t result = fprintf(a1, "--- STATISTICS ---\n");
          if ((result & 0x80000000) == 0)
          {
            size_t result = fprintf(a1, "post         %llu\n", (void)xmmword_100014078);
            if ((result & 0x80000000) == 0)
            {
              size_t result = fprintf(a1, "    id       %llu\n", qword_100014088);
              if ((result & 0x80000000) == 0)
              {
                size_t result = fprintf(a1, "    name     %llu\n", qword_100014090);
                if ((result & 0x80000000) == 0)
                {
                  size_t result = fprintf(a1, "    fetch    %llu\n", (void)xmmword_100014098);
                  if ((result & 0x80000000) == 0)
                  {
                    size_t result = fprintf(a1, "    no_op    %llu\n", *((void *)&xmmword_100014078 + 1));
                    if ((result & 0x80000000) == 0)
                    {
                      size_t result = fprintf(a1, "\n");
                      if ((result & 0x80000000) == 0)
                      {
                        size_t result = fprintf(a1, "register     %llu\n", *((void *)&xmmword_100014098 + 1));
                        if ((result & 0x80000000) == 0)
                        {
                          size_t result = fprintf(a1, "    plain    %llu\n", unk_1000140A8);
                          if ((result & 0x80000000) == 0)
                          {
                            size_t result = fprintf(a1, "    check    %llu\n", qword_1000140B0);
                            if ((result & 0x80000000) == 0)
                            {
                              size_t result = fprintf(a1, "    signal   %llu\n", (void)xmmword_1000140B8);
                              if ((result & 0x80000000) == 0)
                              {
                                size_t result = fprintf(a1, "    file     %llu\n", *((void *)&xmmword_1000140B8 + 1));
                                if ((result & 0x80000000) == 0)
                                {
                                  size_t result = fprintf(a1, "    port     %llu\n", qword_1000140C8);
                                  if ((result & 0x80000000) == 0)
                                  {
                                    size_t result = fprintf(a1, "    event    %llu\n", qword_1000140D0);
                                    if ((result & 0x80000000) == 0)
                                    {
                                      size_t result = fprintf(a1, "    common   %llu\n", (void)xmmword_1000140D8);
                                      if ((result & 0x80000000) == 0)
                                      {
                                        size_t result = fprintf(a1, "\n");
                                        if ((result & 0x80000000) == 0)
                                        {
                                          size_t result = fprintf(a1, "check        %llu\n", qword_100014108);
                                          if ((result & 0x80000000) == 0)
                                          {
                                            size_t result = fprintf( a1,  "cancel       %llu\n",  *((void *)&xmmword_1000140D8 + 1));
                                            if ((result & 0x80000000) == 0)
                                            {
                                              size_t result = fprintf(a1, "cleanup      %llu\n", qword_100014170);
                                              if ((result & 0x80000000) == 0)
                                              {
                                                size_t result = fprintf(a1, "regenerate   %llu\n", (void)xmmword_100014178);
                                                if ((result & 0x80000000) == 0)
                                                {
                                                  size_t result = fprintf( a1,  "checkin      %llu\n",  *((void *)&xmmword_100014178 + 1));
                                                  if ((result & 0x80000000) == 0)
                                                  {
                                                    size_t result = fprintf(a1, "\n");
                                                    if ((result & 0x80000000) == 0)
                                                    {
                                                      size_t result = fprintf(a1, "suspend      %llu\n", qword_1000140E8);
                                                      if ((result & 0x80000000) == 0)
                                                      {
                                                        size_t result = fprintf(a1, "resume       %llu\n", qword_1000140F0);
                                                        if ((result & 0x80000000) == 0)
                                                        {
                                                          size_t result = fprintf( a1,  "suspend_pid  %llu\n",  (void)xmmword_1000140F8);
                                                          if ((result & 0x80000000) == 0)
                                                          {
                                                            size_t result = fprintf( a1,  "resume_pid   %llu\n",  *((void *)&xmmword_1000140F8 + 1));
                                                            if ((result & 0x80000000) == 0)
                                                            {
                                                              size_t result = fprintf(a1, "\n");
                                                              if ((result & 0x80000000) == 0)
                                                              {
                                                                size_t result = fprintf( a1,  "get_state    %llu\n",  (void)xmmword_100014110);
                                                                if ((result & 0x80000000) == 0)
                                                                {
                                                                  size_t result = fprintf( a1,  "    id       %llu\n",  unk_100014120);
                                                                  if ((result & 0x80000000) == 0)
                                                                  {
                                                                    size_t result = fprintf( a1,  "    client   %llu\n",  *((void *)&xmmword_100014110 + 1));
                                                                    if ((result & 0x80000000) == 0)
                                                                    {
                                                                      size_t result = fprintf( a1,  "    fetch    %llu\n",  qword_100014128);
                                                                      if ((result & 0x80000000) == 0)
                                                                      {
                                                                        size_t result = fprintf(a1, "\n");
                                                                        if ((result & 0x80000000) == 0)
                                                                        {
                                                                          size_t result = fprintf( a1,  "set_state    %llu\n",  qword_100014130);
                                                                          if ((result & 0x80000000) == 0)
                                                                          {
                                                                            size_t result = fprintf( a1,  "    id       %llu\n",  *((void *)&xmmword_100014138 + 1));
                                                                            if ((result & 0x80000000) == 0)
                                                                            {
                                                                              size_t result = fprintf( a1,  "    client   %llu\n",  (void)xmmword_100014138);
                                                                              if ((result & 0x80000000) == 0)
                                                                              {
                                                                                size_t result = fprintf( a1,  "    fetch    %llu\n",  qword_100014148);
                                                                                if ((result & 0x80000000) == 0)
                                                                                {
                                                                                  size_t result = fprintf(a1, "\n");
                                                                                  if ((result & 0x80000000) == 0)
                                                                                  {
                                                                                    size_t result = fprintf( a1,  "set_owner    %llu\n",  qword_100014150);
                                                                                    if ((result & 0x80000000) == 0)
                                                                                    {
                                                                                      size_t result = fprintf(a1, "\n");
                                                                                      if ((result & 0x80000000) == 0)
                                                                                      {
                                                                                        size_t result = fprintf( a1,  "set_access   %llu\n",  (void)xmmword_100014158);
                                                                                        if ((result & 0x80000000) == 0)
                                                                                        {
                                                                                          size_t result = fprintf(a1, "\n");
                                                                                          if ((result & 0x80000000) == 0)
                                                                                          {
                                                                                            size_t result = fprintf(a1, "monitor      %llu\n", *((void *)&xmmword_100014158 + 1));
                                                                                            if ((result & 0x80000000) == 0)
                                                                                            {
                                                                                              size_t result = fprintf(a1, "svc_path     %llu\n", qword_100014168);
                                                                                              if ((result & 0x80000000) == 0)
                                                                                              {
                                                                                                uint64_t v3 = localtime(&qword_1000142D0);
                                                                                                strftime( v15,  0x80uLL,  "%a, %d %b %Y %T %z",  v3);
                                                                                                size_t result = fprintf(a1, "last reset time was %s\n", v15);
                                                                                                if ((result & 0x80000000) == 0)
                                                                                                {
                                                                                                  size_t result = fprintf(a1, "\n");
                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                  {
                                                                                                    size_t result = fprintf(a1, "name         alloc %9u   free %9u   extant %9u\n", dword_100014268, dword_10001426C, dword_100014268 - dword_10001426C);
                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                    {
                                                                                                      size_t result = fprintf(a1, "subscription alloc %9u   free %9u   extant %9u\n", dword_100014270, dword_100014274, dword_100014270 - dword_100014274);
                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                      {
                                                                                                        size_t result = fprintf(a1, "portproc     alloc %9u   free %9u   extant %9u\n", dword_100014278, dword_10001427C, dword_100014278 - dword_10001427C);
                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                        {
                                                                                                          size_t result = fprintf(a1, "\n");
                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                          {
                                                                                                            int v4 = os_set_32_ptr_count(&unk_1000141F0);
                                                                                                            size_t result = fprintf(a1, "port count   %u\n", v4);
                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                            {
                                                                                                              int v5 = os_set_32_ptr_count(&unk_100014210);
                                                                                                              size_t result = fprintf(a1, "proc count   %u\n", v5);
                                                                                                              if ((result & 0x80000000) == 0)
                                                                                                              {
                                                                                                                size_t result = fprintf(a1, "\n");
                                                                                                                if ((result & 0x80000000) == 0)
                                                                                                                {
                                                                                                                  size_t result = fprintf(a1, "--- NAME TABLE ---\n");
                                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                                  {
                                                                                                                    size_t result = fprintf(a1, "Name Info: id, uid, gid, access, refcount, postcount, last hour postcount, slot, val, state\n");
                                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                                    {
                                                                                                                      size_t result = fprintf(a1, "Client Info: client_id, pid,token, lastval, suspend_count, pending, 0, type, type-info\n\n\n");
                                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                                      {
                                                                                                                        v14[0] = _NSConcreteStackBlock;
                                                                                                                        v14[1] = 0x40000000LL;
                                                                                                                        v14[2] = sub_100006CE8;
                                                                                                                        v14[3] = &unk_1000106F8;
                                                                                                                        v14[4] = a1;
                                                                                                                        *(void *)uint64_t v15 = _NSConcreteStackBlock;
                                                                                                                        uint64_t v16 = 0x40000000LL;
                                                                                                                        int v17 = sub_100002CB8;
                                                                                                                        int v18 = &unk_100010530;
                                                                                                                        uint64_t v19 = v14;
                                                                                                                        uint64_t v20 = &unk_100014190;
                                                                                                                        os_set_str_ptr_foreach(&unk_100014190, v15);
                                                                                                                        int v6 = os_set_str_ptr_count(&unk_100014190);
                                                                                                                        size_t result = fprintf(a1, "--- NAME COUNT %u ---\n", v6);
                                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                                        {
                                                                                                                          size_t result = fprintf(a1, "\n");
                                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                                          {
                                                                                                                            size_t result = fprintf(a1, "--- CONTROLLED NAME ---\n");
                                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                                            {
                                                                                                                              int v7 = dword_10001425C;
                                                                                                                              if (dword_10001425C)
                                                                                                                              {
                                                                                                                                uint64_t v8 = 0LL;
                                                                                                                                unint64_t v9 = 0LL;
                                                                                                                                while (!__CFADD__(qword_100014248, v8))
                                                                                                                                {
                                                                                                                                  size_t result = fprintf(a1, "%s %u %u %03x\n", *(const char **)(*(void *)(qword_100014248 + v8) + 8LL), *(_DWORD *)(*(void *)(qword_100014248 + v8) + 40LL), *(_DWORD *)(*(void *)(qword_100014248 + v8) + 44LL), *(_DWORD *)(*(void *)(qword_100014248 + v8) + 48LL));
                                                                                                                                  if ((result & 0x80000000) != 0) {
                                                                                                                                    return result;
                                                                                                                                  }
                                                                                                                                  ++v9;
                                                                                                                                  int v7 = dword_10001425C;
                                                                                                                                  v8 += 8LL;
                                                                                                                                }

                                                                                                                                __break(0x5513u);
                                                                                                                              }

                                                                                                                              else
                                                                                                                              {
LABEL_68:
                                                                                                                                size_t result = fprintf(a1, "--- CONTROLLED NAME COUNT %u ---\n", v7);
                                                                                                                                if ((result & 0x80000000) == 0)
                                                                                                                                {
                                                                                                                                  size_t result = fprintf(a1, "\n");
                                                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                                                  {
                                                                                                                                    size_t result = fprintf(a1, "--- PUBLIC SERVICE ---\n");
                                                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                                                    {
                                                                                                                                      v13[0] = _NSConcreteStackBlock;
                                                                                                                                      v13[1] = 0x40000000LL;
                                                                                                                                      v13[2] = sub_100006F30;
                                                                                                                                      v13[3] = &unk_100010718;
                                                                                                                                      v13[4] = a1;
                                                                                                                                      *(void *)uint64_t v15 = _NSConcreteStackBlock;
                                                                                                                                      uint64_t v16 = 0x40000000LL;
                                                                                                                                      int v17 = sub_100002CD0;
                                                                                                                                      int v18 = &unk_100010558;
                                                                                                                                      uint64_t v19 = v13;
                                                                                                                                      uint64_t v20 = &unk_1000141D0;
                                                                                                                                      ((void (*)(void))os_set_64_ptr_foreach)();
                                                                                                                                      int v10 = os_set_str_ptr_count(&unk_100014190);
                                                                                                                                      size_t result = fprintf(a1, "--- PUBLIC SERVICE COUNT %u ---\n", v10);
                                                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                                                      {
                                                                                                                                        size_t result = fprintf(a1, "\n");
                                                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                                                        {
                                                                                                                                          size_t result = fprintf(a1, "--- PRIVATE SERVICE ---\n");
                                                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                                                          {
                                                                                                                                            v12[0] = _NSConcreteStackBlock;
                                                                                                                                            v12[1] = 0x40000000LL;
                                                                                                                                            __int128 v12[2] = sub_100007000;
                                                                                                                                            v12[3] = &unk_100010738;
                                                                                                                                            v12[4] = a1;
                                                                                                                                            *(void *)uint64_t v15 = _NSConcreteStackBlock;
                                                                                                                                            uint64_t v16 = 0x40000000LL;
                                                                                                                                            int v17 = sub_100002CD0;
                                                                                                                                            int v18 = &unk_100010558;
                                                                                                                                            uint64_t v19 = v12;
                                                                                                                                            uint64_t v20 = &unk_1000141D0;
                                                                                                                                            os_set_64_ptr_foreach(&unk_1000141D0, v15);
                                                                                                                                            int v11 = os_set_64_ptr_count(&unk_1000141D0);
                                                                                                                                            size_t result = fprintf(a1, "--- PRIVATE SERVICE COUNT %u ---\n", v11);
                                                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                                                            {
                                                                                                                                              size_t result = fprintf(a1, "\n");
                                                                                                                                              if ((result & 0x80000000) == 0) {
                                                                                                                                                return fwrite("-- END --\n", 0xAuLL, 1uLL, a1);
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
      }
    }
  }

  return result;
}

uint64_t sub_1000065B0(uint64_t a1, uint64_t a2)
{
  int v4 = *(FILE **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (fprintf(v4, "name: %s\n", *(const char **)(a2 + 8)) < 0
    || fprintf(v4, "id: %llu\n", *(void *)(a2 + 16)) < 0
    || fprintf(v4, "uid: %u\n", *(_DWORD *)(a2 + 40)) < 0
    || fprintf(v4, "gid: %u\n", *(_DWORD *)(a2 + 44)) < 0
    || fprintf(v4, "access: %03x\n", *(_DWORD *)(a2 + 48)) < 0
    || fprintf(v4, "refcount: %u\n", *(_DWORD *)(a2 + 56)) < 0
    || fprintf(v4, "postcount: %u\n", *(_DWORD *)(a2 + 64)) < 0
    || fprintf(v4, "last hour postcount: %u\n", *(_DWORD *)(a2 + 68)) < 0)
  {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }

  if (*(_DWORD *)(a2 + 52) == -1)
  {
    int v8 = fprintf(v4, "slot: -unassigned-");
    goto LABEL_16;
  }

  uint64_t result = fprintf(v4, "slot: %u", *(_DWORD *)(a2 + 52));
  if ((result & 0x80000000) != 0) {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
  uint64_t v7 = *(unsigned int *)(a2 + 52);
  if (__CFADD__(qword_1000142E8, 4 * v7)) {
    goto LABEL_56;
  }
  if (*(_DWORD *)(qword_1000142E8 + 4 * v7) != -1)
  {
    if (__CFADD__(qword_1000142E0, 4 * v7)) {
      goto LABEL_56;
    }
    int v8 = fprintf(v4, " = %u (%u)");
LABEL_16:
    if ((v8 & 0x80000000) == 0) {
      goto LABEL_17;
    }
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }

LABEL_17:
  uint64_t result = fprintf(v4, "state: %llu\n", *(void *)(a2 + 24));
  if ((result & 0x80000000) != 0) {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  unint64_t v9 = *(void **)a2;
  if (*(void *)a2)
  {
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    do
    {
      unsigned int v18 = *((_DWORD *)v9 + 17);
      if (v18 != -1 && v18 > *(_DWORD *)(v5 + 24)) {
        *(_DWORD *)(v5 + 24) = v18;
      }
      switch(*((_BYTE *)v9 + 79) & 0xF)
      {
        case 1:
          DWORD1(v22) = ++v10;
          break;
        case 2:
          DWORD2(v22) = ++v11;
          break;
        case 3:
          HIDWORD(v22) = ++v12;
          break;
        case 4:
          LODWORD(v23) = ++v13;
          break;
        case 5:
          DWORD1(v23) = ++v14;
          break;
        case 6:
          DWORD2(v23) = ++v15;
          break;
        case 7:
          HIDWORD(v23) = ++v16;
          break;
        default:
          LODWORD(v22) = ++v17;
          break;
      }

      unint64_t v9 = (void *)*v9;
    }

    while (v9);
  }

  else
  {
    int v16 = 0;
    int v15 = 0;
    int v14 = 0;
    int v13 = 0;
    int v12 = 0;
    int v11 = 0;
    int v10 = 0;
    int v17 = 0;
  }

  BOOL v19 = (__int128 *)((char *)&v23 + 5) != 0LL && (unint64_t)&v22 >= 0xFFFFFFFFFFFFFFEBLL;
  if ((unint64_t)&v22 <= 0xFFFFFFFFFFFFFFEFLL && !v19)
  {
    BOOL v20 = (__int128 *)((char *)&v23 + 13) != 0LL && (unint64_t)&v22 >= 0xFFFFFFFFFFFFFFE3LL;
    if ((unint64_t)&v22 <= 0xFFFFFFFFFFFFFFE7LL && !v20)
    {
      if ((fprintf( v4,  "types: none %u   memory %u   plain %u   port %u   file %u   signal %u   event %u   common %u\n",  v17,  v10,  v11,  v12,  v13,  v14,  v15,  v16) & 0x80000000) == 0)
      {
        for (i = *(void **)a2; i; i = (void *)*i)
        {
          sub_100006B54(v4, (uint64_t)i);
        }
      }

      return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
    }
  }

LABEL_56:
  __break(0x5513u);
  return result;
}

BOOL sub_100006988(uint64_t a1, uint64_t a2)
{
  return fprintf(*(FILE **)(a1 + 32), "%d\n", *(_DWORD *)(a2 + 68)) >= 0;
}

uint64_t sub_1000069C0(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1LL;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8LL * v2))
  {
    uint64_t v3 = *(int **)(qword_100014290 + 8 * v2);
    if (v3)
    {
      uint64_t v4 = result;
      int v5 = *v3;
      if (!*v3)
      {
        int v5 = *v3;
      }

      if (v5 == 1) {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Path Service: %s <- %s\n");
      }
      else {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Unknown service: %s (%u)\n");
      }
      return (v6 & 0x80000000) == 0;
    }

    return 1LL;
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_100006A90(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1LL;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8LL * v2))
  {
    uint64_t v4 = result;
    int v5 = *(const char ****)(qword_100014290 + 8 * v2);
    uint64_t v6 = *(void *)(a2 + 48);
    int v7 = *(_DWORD *)v5;
    if (!*(_DWORD *)v5)
    {
      int v7 = *(_DWORD *)v5;
    }

    return v7 != 2
        || (fprintf( *(FILE **)(v4 + 32),  "PID %u Path Service: %s <- %s\n",  *(_DWORD *)(a2 + 68),  *(const char **)(v6 + 8),  *v5[1]) & 0x80000000) == 0;
  }

  __break(0x5513u);
  return result;
}

size_t sub_100006B54(FILE *a1, uint64_t a2)
{
  size_t result = fprintf(a1, "client_id: %llu\n", *(void *)(a2 + 64));
  if ((result & 0x80000000) == 0)
  {
    size_t result = fprintf(a1, "pid: %d\n", *(_DWORD *)(a2 + 68));
    if ((result & 0x80000000) == 0)
    {
      size_t result = fprintf(a1, "token: %d\n", *(_DWORD *)(a2 + 64));
      if ((result & 0x80000000) == 0)
      {
        size_t result = fprintf(a1, "lastval: %u\n", *(_DWORD *)(a2 + 72));
        if ((result & 0x80000000) == 0)
        {
          size_t result = fprintf(a1, "suspend_count: %u\n", *(unsigned __int8 *)(a2 + 78));
          if ((result & 0x80000000) == 0)
          {
            uint64_t v5 = *(_BYTE *)(a2 + 79) & 0xF;
            else {
              uint64_t v6 = (&off_100010848)[v5];
            }
            size_t result = fprintf(a1, "type: %s\n", v6);
            if ((result & 0x80000000) == 0)
            {
              switch(*(_BYTE *)(a2 + 79) & 0xF)
              {
                case 3:
                  size_t result = fprintf(a1, "mach port: 0x%08x\n");
                  break;
                case 4:
                  size_t result = fprintf(a1, "fd: %d\n");
                  break;
                case 5:
                  size_t result = fprintf(a1, "signal: %d\n");
                  break;
                case 6:
                  size_t result = fprintf(a1, "xpc event: %llu\n");
                  break;
                case 7:
                  size_t result = fwrite("common port\n", 0xCuLL, 1uLL, a1);
                  break;
                default:
                  return result;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

BOOL sub_100006CE8(uint64_t a1, uint64_t **a2)
{
  if (a2)
  {
    uint64_t v4 = *(FILE **)(a1 + 32);
    if ((fprintf(v4, "name:%s\n", (const char *)a2[1]) & 0x80000000) == 0
      && (fprintf( v4,  "info:%llu,%u,%u,%03x,%u,%u,%u,",  a2[2],  *((_DWORD *)a2 + 10),  *((_DWORD *)a2 + 11),  *((_DWORD *)a2 + 12),  *((_DWORD *)a2 + 14),  *((_DWORD *)a2 + 16),  *((_DWORD *)a2 + 17)) & 0x80000000) == 0)
    {
      int v5 = *((_DWORD *)a2 + 13) == -1 ? fprintf(v4, "-1,") : fprintf(v4, "%u,");
      if ((v5 & 0x80000000) == 0
        && (fprintf(v4, "%u,%llu\n", *((_DWORD *)a2 + 15), a2[3]) & 0x80000000) == 0
        && (fprintf(v4, "clients:\n") & 0x80000000) == 0)
      {
        for (i = *a2; i; i = (uint64_t *)*i)
        {
          if ((fprintf( v4,  "%llu,%d,%d,%u,%u,%u,",  i[8],  HIDWORD(i[8]),  i[8],  *((_DWORD *)i + 18),  *((unsigned __int8 *)i + 78),  0) & 0x80000000) == 0)
          {
            switch(*((_BYTE *)i + 79) & 0xF)
            {
              case 1:
                int v7 = "check,0\n";
                goto LABEL_15;
              case 3:
                fprintf(v4, "port,0x%08x\n");
                continue;
              case 4:
                fprintf(v4, "fd,%d\n");
                continue;
              case 5:
                fprintf(v4, "signal,%d\n");
                continue;
              case 6:
                fprintf(v4, "event,%llu\n");
                continue;
              case 7:
                int v7 = "common-port\n";
                size_t v8 = 12LL;
                goto LABEL_22;
              default:
                int v7 = "other,0\n";
LABEL_15:
                size_t v8 = 8LL;
LABEL_22:
                fwrite(v7, v8, 1uLL, v4);
                break;
            }
          }
        }

        fputc(10, v4);
      }
    }
  }

  return fprintf(*(FILE **)(a1 + 32), "\n") >= 0;
}

uint64_t sub_100006F30(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1LL;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8LL * v2))
  {
    uint64_t v3 = *(int **)(qword_100014290 + 8 * v2);
    if (v3)
    {
      uint64_t v4 = result;
      int v5 = *v3;
      if (!*v3)
      {
        int v5 = *v3;
      }

      if (v5 == 1) {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Path Service: %s <- %s\n");
      }
      else {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Unknown service: %s (%u)\n");
      }
      return (v6 & 0x80000000) == 0;
    }

    return 1LL;
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_100007000(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1LL;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8LL * v2))
  {
    uint64_t v4 = result;
    int v5 = *(const char ****)(qword_100014290 + 8 * v2);
    uint64_t v6 = *(void *)(a2 + 48);
    int v7 = *(_DWORD *)v5;
    if (!*(_DWORD *)v5)
    {
      int v7 = *(_DWORD *)v5;
    }

    return v7 != 2
        || (fprintf( *(FILE **)(v4 + 32),  "PID %u Path Service: %s <- %s\n",  *(_DWORD *)(a2 + 68),  *(const char **)(v6 + 8),  *v5[1]) & 0x80000000) == 0;
  }

  __break(0x5513u);
  return result;
}

FILE *sub_1000070C4( FILE *result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_1000142F8 >= (int)result)
  {
    size_t result = (FILE *)qword_100014308;
    if (qword_100014308)
    {
      size_t result = fopen((const char *)qword_100014308, "a");
      if (result)
      {
        int v10 = result;
        time_t v12 = time(0LL);
        *(_OWORD *)int v13 = 0u;
        __int128 v14 = 0u;
        int v11 = localtime(&v12);
        strftime(v13, 0x20uLL, "%b %e %T", v11);
        fprintf(v10, "%s: ", v13);
        vfprintf(v10, a2, &a9);
        fflush(v10);
        return (FILE *)fclose(v10);
      }
    }
  }

  return result;
}

BOOL sub_1000071C0(_OWORD *a1, uint64_t a2)
{
  __int128 v4 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v4;
  char v5 = audit_token_to_pid(&atoken);
  sub_1000070C4((FILE *)5, "-> has_root_entitlement (PID %d)\n", v6, v7, v8, v9, v10, v11, v5);
  time_t v12 = (void *)xpc_copy_entitlement_for_token(a2, a1);
  if (v12)
  {
    BOOL v19 = v12;
    BOOL value = xpc_BOOL_get_value(v12);
    xpc_release(v19);
  }

  else
  {
    BOOL value = 0LL;
  }

  sub_1000070C4((FILE *)5, "<- has_root_entitlement (PID %d) = %s\n", v13, v14, v15, v16, v17, v18, v5);
  return value;
}

uint64_t sub_100007274(uint64_t a1, int a2, int a3)
{
  if (!a1) {
    return 10LL;
  }
  uint64_t result = os_set_str_ptr_find(&unk_100014190, a1);
  if (result)
  {
    if (qword_1000141A8 == result) {
      return 0LL;
    }
    uint64_t v7 = *(unsigned int *)(result - qword_1000141A8 + 52);
    if ((_DWORD)v7 != -1)
    {
      if (__CFADD__(qword_1000142E0, 4 * v7))
      {
        __break(0x5513u);
        return result;
      }

      ++*(_DWORD *)(qword_1000142E0 + 4 * v7);
    }

    uint64_t v8 = os_set_str_ptr_find(&unk_100014190, a1);
    if (v8 && qword_1000141A8 != v8) {
      return sub_1000090AC(v8 - qword_1000141A8, a2, a3);
    }
    else {
      return 1LL;
    }
  }

  return result;
}

void sub_100007348()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests port-deleted";
  __break(1u);
}

void sub_100007368()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests port-destroyed";
  __break(1u);
}

void sub_100007388()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests no-senders";
  __break(1u);
}

void sub_1000073A8()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: someone destroyed our send-possible notification";
  __break(1u);
}

size_t start(int a1, unint64_t a2)
{
  kern_return_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  kern_return_t v52;
  FILE *v53;
  pid_t v54;
  size_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  unsigned int v60;
  FILE *v61;
  FILE *v62;
  size_t result;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned __int8 *v71;
  unsigned int v72;
  BOOL v73;
  uint64_t v74;
  int v76;
  int v77;
  unint64_t v78;
  char *v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int v83;
  unint64_t v84;
  int v85;
  BOOL v86;
  BOOL v87;
  void *v88;
  int v89;
  const char *v90;
  unsigned int v91;
  const char *v92;
  unsigned int v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  _DWORD *v98;
  uint64_t v99;
  void *v100;
  kern_return_t v101;
  uint64_t v102;
  dispatch_source_t v103;
  dispatch_source_t v104;
  dispatch_source_s *v105;
  dispatch_time_t v106;
  dispatch_source_s *v107;
  int v108;
  const char *v109;
  FILE *v110;
  const char *v111;
  rlimit v112;
  void block[5];
  uint64_t v114;
  mach_port_options_t port_info[43];
  stat v116;
  notify_set_options(0x8000000LL);
  os_trace_set_mode(256LL);
  v112 = (rlimit)xmmword_10000E1E0;
  setrlimit(8, &v112);
  signal(13, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(30, (void (__cdecl *)(int))1);
  signal(31, (void (__cdecl *)(int))1);
  signal(28, (void (__cdecl *)(int))1);
  xmmword_100014078 = 0u;
  *(_OWORD *)&qword_100014088 = 0u;
  xmmword_100014098 = 0u;
  unk_1000140A8 = 0u;
  xmmword_1000140B8 = 0u;
  *(_OWORD *)&qword_1000140C8 = 0u;
  xmmword_1000140D8 = 0u;
  *(_OWORD *)&qword_1000140E8 = 0u;
  xmmword_1000140F8 = 0u;
  *(_OWORD *)&qword_100014108 = 0u;
  *(__int128 *)((char *)&xmmword_100014110 + 8) = 0u;
  *(_OWORD *)&qword_100014128 = 0u;
  xmmword_100014138 = 0u;
  *(_OWORD *)&qword_100014148 = 0u;
  xmmword_100014158 = 0u;
  *(_OWORD *)&qword_100014168 = 0u;
  xmmword_100014178 = 0u;
  unint64_t v4 = (unint64_t)&unk_100014190;
  v108 = getpagesize() >> 2;
  dword_1000142D8 = v108;
  dword_100014258 = 2;
  qword_100014260 = 0xFFFFFFFF00000000LL;
  os_set_str_ptr_init(&unk_100014190, 0LL, 1LL);
  qword_1000141A8 = 8LL;
  os_set_64_ptr_init(&unk_1000141B0, 0LL, 1LL);
  qword_1000141C8 = 16LL;
  os_set_64_ptr_init(&unk_1000141D0, 0LL, 1LL);
  qword_1000141E8 = 64LL;
  os_set_32_ptr_init(&unk_1000141F0, 0LL, 1LL);
  qword_100014208 = 8LL;
  os_set_32_ptr_init(&unk_100014210, 0LL, 1LL);
  qword_100014228 = 16LL;
  os_map_64_init(&unk_100014230, 0LL, 1LL);
  dword_100014300 = 1;
  int v5 = 3;
  dword_1000142F8 = 3;
  uint64_t v6 = strdup("/var/log/notifyd.log");
  qword_100014308 = (uint64_t)v6;
  dword_1000142DC = -1;
  if (a1 >= 2)
  {
    uint64_t v13 = v6;
    int v14 = 1;
    v109 = "apple.shm.notification_center";
    v111 = "com.apple.system.notification_center";
    uint64_t v15 = "-d";
    while (1)
    {
      BOOL v16 = __CFADD__(a2, 8LL * v14);
      BOOL v17 = a2 + 8LL * v14 >= a2;
      if (v14 < 0) {
        BOOL v17 = v16;
      }
      if (!v17)
      {
LABEL_176:
        __break(0x5513u);
LABEL_177:
        __break(0x5500u);
LABEL_178:
        sub_1000070C4((FILE *)3, "config file %s not owned by root: ignored\n", v7, v8, v9, v10, v11, v12, a2);
LABEL_180:
        *(_OWORD *)&port_info[0].flags = *(_OWORD *)"!";
        port_info[0].reserved[1] = 0LL;
        v101 = mach_port_construct( *(_DWORD *)v15,  port_info,  (mach_port_context_t)&qword_100014188,  (mach_port_name_t *)&dword_100014288);
        if (v101)
        {
          qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate Mach notification port";
          qword_100014040 = v101;
LABEL_189:
          __break(1u);
        }

        else
        {
          qword_100014280 = dispatch_mach_create_f("com.apple.notifyd.mach-notifs", qword_100014298, 0LL, sub_10000858C);
          dispatch_set_qos_class_fallback();
          qword_1000142A0 = dispatch_mach_create_f("com.apple.notifyd.channel", qword_100014298, 0LL, sub_1000085E0);
          dispatch_set_qos_class_fallback();
          v102 = xpc_event_publisher_create("com.apple.notifyd.matching", qword_100014298);
          qword_100014250 = v102;
          xpc_event_publisher_set_handler();
          xpc_event_publisher_set_error_handler(v102, &stru_1000105D8);
          xpc_event_publisher_set_throttling(v102, 64LL);
          xpc_event_publisher_activate(v102);
          v103 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0x1EuLL,  0LL,  (dispatch_queue_t)qword_100014298);
          qword_1000142A8 = (uint64_t)v103;
          if (v103)
          {
            dispatch_set_context(v103, 0LL);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 0x10), (dispatch_function_t)sub_100008634);
            dispatch_activate(*(dispatch_object_t *)(v4 + 0x10));
            v104 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0x1FuLL,  0LL,  *(dispatch_queue_t *)v4);
            *(void *)(v4 + 0x18) = v104;
            if (v104)
            {
              dispatch_set_context(v104, (void *)1);
              dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 0x18), (dispatch_function_t)sub_100008634);
              dispatch_activate(*(dispatch_object_t *)(v4 + 0x18));
              v105 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0x1CuLL,  0LL,  *(dispatch_queue_t *)v4);
              *(void *)(v4 + 0x20) = v105;
              if (v105)
              {
                dispatch_source_set_event_handler(v105, &stru_100010618);
                dispatch_activate(*(dispatch_object_t *)(v4 + 0x20));
                *(void *)(v4 + 0x28) = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)v4);
                v106 = dispatch_walltime(0LL, 0LL);
                dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 0x28), v106, 0x34630B8A000uLL, 0LL);
                dispatch_source_set_event_handler(*(dispatch_source_t *)(v4 + 0x28), &stru_100010658);
                dispatch_activate(*(dispatch_object_t *)(v4 + 0x28));
                if (os_variant_has_internal_diagnostics("com.apple.notifyd"))
                {
                  v107 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_memorypressure,  0LL,  0x10uLL,  *(dispatch_queue_t *)v4);
                  *(void *)(v4 + 0x30) = v107;
                  if (!v107) {
                    __assert_rtn("main", "notifyd.c", 1479, "global.memory_pressure_src != NULL");
                  }
                  dispatch_source_set_event_handler(v107, &stru_100010698);
                  dispatch_activate((dispatch_object_t)qword_1000142C8);
                }

                dispatch_async((dispatch_queue_t)qword_100014298, &stru_1000106D8);
                dispatch_main();
              }

              __assert_rtn("main", "notifyd.c", 1458, "global.sig_winch_src != NULL");
            }

            __assert_rtn("main", "notifyd.c", 1450, "global.sig_usr2_src != NULL");
          }
        }

        __assert_rtn("main", "notifyd.c", 1442, "global.sig_usr1_src != NULL");
      }

      unint64_t v4 = *(void *)(a2 + 8LL * v14);
      if (!strcmp((const char *)v4, "-d"))
      {
        dword_1000142F8 = 7;
      }

      else
      {
        if (!strcmp((const char *)v4, "-log_cutoff"))
        {
          unint64_t v4 = v14 + 1LL;
          BOOL v20 = __CFADD__(a2, 8 * v4);
          BOOL v21 = a2 + 8 * (v14 + 1LL) >= a2;
          if (v14 < -1) {
            BOOL v21 = v20;
          }
          if (!v21) {
            goto LABEL_176;
          }
          dword_1000142F8 = atoi(*(const char **)(a2 + 8 * v4));
          goto LABEL_37;
        }

        if (!strcmp((const char *)v4, "-log_file"))
        {
          free(v13);
          unint64_t v4 = v14 + 1LL;
          BOOL v22 = __CFADD__(a2, 8 * v4);
          BOOL v23 = a2 + 8 * (v14 + 1LL) >= a2;
          if (v14 < -1) {
            BOOL v23 = v22;
          }
          if (!v23) {
            goto LABEL_176;
          }
          uint64_t v13 = strdup(*(const char **)(a2 + 8 * v4));
          qword_100014308 = (uint64_t)v13;
          goto LABEL_37;
        }

        if (!strcmp((const char *)v4, "-service"))
        {
          uint64_t v24 = v14 + 1LL;
          BOOL v25 = __CFADD__(a2, 8 * v24);
          BOOL v26 = a2 + 8 * (v14 + 1LL) >= a2;
          if (v14 < -1) {
            BOOL v26 = v25;
          }
          if (!v26) {
            goto LABEL_176;
          }
          v111 = *(const char **)(a2 + 8 * v24);
          goto LABEL_52;
        }

        if (!strcmp((const char *)v4, "-shm"))
        {
          uint64_t v24 = v14 + 1LL;
          BOOL v27 = __CFADD__(a2, 8 * v24);
          BOOL v28 = a2 + 8 * (v14 + 1LL) >= a2;
          if (v14 < -1) {
            BOOL v28 = v27;
          }
          if (!v28) {
            goto LABEL_176;
          }
          v109 = *(const char **)(a2 + 8 * v24);
LABEL_52:
          int v14 = v24;
          goto LABEL_53;
        }

        if (!strcmp((const char *)v4, "-shm_pages"))
        {
          unint64_t v4 = v14 + 1LL;
          BOOL v18 = __CFADD__(a2, 8 * v4);
          BOOL v19 = a2 + 8 * (v14 + 1LL) >= a2;
          if (v14 < -1) {
            BOOL v19 = v18;
          }
          if (!v19) {
            goto LABEL_176;
          }
          dword_1000142D8 = atoi(*(const char **)(a2 + 8 * v4)) * v108;
LABEL_37:
          int v14 = v4;
        }
      }

LABEL_53:
      if (__OFADD__(v14++, 1)) {
        goto LABEL_177;
      }
      if (v14 >= a1)
      {
        int v5 = dword_1000142F8;
        int v31 = v109;
        uint64_t v30 = v111;
        goto LABEL_57;
      }
    }
  }

  uint64_t v30 = "com.apple.system.notification_center";
  int v31 = "apple.shm.notification_center";
LABEL_57:
  dword_1000142FC = v5;
  char v32 = getpid();
  sub_1000070C4((FILE *)7, "--------------------\nnotifyd start PID %u\n", v33, v34, v35, v36, v37, v38, v32);
  uint64_t v39 = bootstrap_check_in(bootstrap_port, v30, (mach_port_t *)&dword_10001428C);
  if (v39)
  {
    v52 = v39;
    v53 = __stderrp;
    v54 = getpid();
    fprintf(v53, "%d bootstrap_check_in failed (%d)\n", v54, v52);
    exit(1);
  }

  port_info[0].flags = 32;
  uint64_t v15 = (char *)&mach_task_self_;
  mach_port_set_attributes(mach_task_self_, dword_10001428C, 1, (mach_port_info_t)port_info, 4u);
  int v40 = dword_1000142D8;
  if (dword_1000142D8)
  {
    __int128 v41 = shm_open(v31, 2, 420LL);
    uint64_t v42 = v41;
    __int128 v43 = v41;
    if ((_DWORD)v41 == -1)
    {
      __int128 v43 = shm_open(v31, 514, 420LL);
      if ((_DWORD)v43 == -1)
      {
        uint64_t v44 = __error();
        v45 = strerror(*v44);
        snprintf((char *)port_info, 0x400uLL, "shm_open %s failed: %s\n", v31, v45);
        qword_100014010 = (uint64_t)port_info;
        sub_1000070C4((FILE *)5, "%s", v46, v47, v48, v49, v50, v51, (char)port_info);
        goto LABEL_68;
      }
    }

    v55 = (4 * v40);
    ftruncate(v43, v55);
    qword_1000142E0 = (uint64_t)mmap(0LL, v55, 3, 1, v43, 0LL);
    close_NOCANCEL(v43);
    if (v42 == -1)
    {
      v56 = (void *)qword_1000142E0;
    }

    else
    {
      v57 = malloc(v55);
      qword_1000142F0 = (uint64_t)v57;
      v56 = (void *)qword_1000142E0;
      if (v57) {
        memcpy(v57, (const void *)qword_1000142E0, v55);
      }
    }

    bzero(v56, v55);
    v58 = malloc(v55);
    qword_1000142E8 = (uint64_t)v58;
    if (!v58) {
LABEL_68:
    }
      __assert_rtn("main", "notifyd.c", 1380, "status == 0");
    bzero(v58, v55);
    *(_DWORD *)qword_1000142E0 = getpid();
    *(_DWORD *)qword_1000142E8 = 1;
    dword_1000142DC = 0;
  }

  unint64_t v4 = (unint64_t)&qword_100014298;
  qword_100014298 = (uint64_t)dispatch_workloop_create_inactive("com.apple.notifyd.main");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_100014298);
  v59 = ((uint64_t)getpid() << 32) | 3;
  v60 = dword_100014300++;
  sub_100009610("com.apple.system.notify.ipc_version", 0xFFFFFFFFLL, v60, -1, 0, 0, &v114);
  sub_100009348(v114, v59, 0, 0);
  a2 = (unint64_t)"/etc/notify.conf";
  if (stat("/etc/notify.conf", &v116)) {
    goto LABEL_180;
  }
  if (v116.st_uid) {
    goto LABEL_178;
  }
  if ((v116.st_mode & 2) != 0)
  {
    sub_1000070C4( (FILE *)3,  "config file %s is world-writable: ignored\n",  v7,  v8,  v9,  v10,  v11,  v12,  (char)"/etc/notify.conf");
    goto LABEL_180;
  }

  v61 = fopen("/etc/notify.conf", "r");
  if (!v61) {
    goto LABEL_180;
  }
  v62 = v61;
  v110 = v61;
  while (1)
  {
    do
    {
      if (!fgets((char *)port_info, 1024, v62))
      {
LABEL_194:
        fclose(v62);
        unint64_t v4 = (unint64_t)&qword_100014298;
        uint64_t v15 = (char *)&mach_task_self_;
        goto LABEL_180;
      }
    }

    while (!LOBYTE(port_info[0].flags) || LOBYTE(port_info[0].flags) == 35);
    uint64_t result = strlen((const char *)port_info);
    v64 = result - 1;
    if (result - 1 > 0x3FF) {
      break;
    }
    v65 = 0LL;
    unint64_t v4 = 0LL;
    v66 = 0LL;
    v67 = (unint64_t)port_info;
    *((_BYTE *)&port_info[0].flags + v64) = 0;
    while (1)
    {
      if (v4 > 0x3FF) {
        goto LABEL_189;
      }
      if (!*(_BYTE *)v67) {
        break;
      }
      v68 = 0LL;
      a2 = ~v67;
      v69 = v66;
      v70 = v4;
      v71 = (unsigned __int8 *)v67;
      while (1)
      {
        if (v69 > 0x3FF || v70 > 0x3FF) {
          goto LABEL_189;
        }
        v72 = *v71;
        v73 = v72 > 0x20;
        v74 = (1LL << v72) & 0x100000201LL;
        if (!v73 && v74 != 0) {
          break;
        }
        v76 = v68 + 1;
        if (__OFADD__((_DWORD)v68, 1)) {
          goto LABEL_177;
        }
        v68 = v76;
        v69 = v66 + v76;
        v70 = v4 + v76;
        v71 = (unsigned __int8 *)(v67 + v76);
        if (a2 < v76) {
          goto LABEL_176;
        }
      }

      v77 = v68 + 1;
      if (__OFADD__((_DWORD)v68, 1)) {
        goto LABEL_177;
      }
      v78 = v77;
      v79 = (char *)malloc(v77);
      uint64_t v15 = v79;
      v80 = ~(unint64_t)v79;
      if ((int)v68 < 1)
      {
        v83 = 0;
      }

      else
      {
        v81 = 0LL;
        v82 = 1024 - v66;
        if (v66 > 0x400) {
          v82 = 0LL;
        }
        do
        {
          if (v81 > a2) {
            goto LABEL_176;
          }
          if (v82 == v81 || 1024 - v4 == v81) {
            goto LABEL_189;
          }
          if (v81 > v80) {
            goto LABEL_176;
          }
          if (v78 == v81) {
            goto LABEL_189;
          }
          v79[v81] = *(_BYTE *)(v67 + v81);
          ++v81;
        }

        while (v68 != v81);
        v83 = v68;
      }

      if (v68 > v80) {
        goto LABEL_176;
      }
      if ((v68 & 0x8000000000000000LL) != 0 || v68 >= v78) {
        goto LABEL_189;
      }
      v79[v68] = 0;
      v65 = (unint64_t)sub_100008290(v79, v65);
      free(v15);
      if (a2 < v83) {
        goto LABEL_176;
      }
      a2 = v66 + v83;
      if (a2 > 0x3FF) {
        goto LABEL_189;
      }
      v84 = v4 + v83;
      if (v84 > 0x3FF) {
        goto LABEL_189;
      }
      uint64_t v15 = (char *)(v67 + v83);
      if (!*v15) {
        break;
      }
      v85 = v83 + 1;
      if (__OFADD__(v83, 1)) {
        goto LABEL_177;
      }
      v86 = __CFADD__(v67, v85);
      v87 = v67 + v85 >= v67;
      if (v85 < 0) {
        v87 = v86;
      }
      if (!v87) {
        goto LABEL_176;
      }
      if (v66 + v85 > 0x3FF || v4 + v85 > 0x3FF) {
        goto LABEL_189;
      }
      if (!*(_BYTE *)(v67 + v85)) {
        v65 = (unint64_t)sub_100008290("", v65);
      }
      v66 = a2 + 1;
      unint64_t v4 = v84 + 1;
      v67 = (unint64_t)(v15 + 1);
      if (a2 > 0x3FE) {
        goto LABEL_189;
      }
    }

    v62 = v110;
    if (v65)
    {
      LODWORD(a2) = 0;
      v88 = (void *)v65;
      while (*v88)
      {
        v89 = a2 + 1;
        if (__OFADD__((_DWORD)a2, 1)) {
          goto LABEL_177;
        }
        v88 = (void *)(v65 + 8LL * v89);
        LODWORD(a2) = a2 + 1;
        if (8LL * v89 > ~v65) {
          goto LABEL_176;
        }
      }

      if (!(_DWORD)a2) {
        goto LABEL_175;
      }
      uint64_t v15 = *(char **)v65;
      if (!strcasecmp(*(const char **)v65, "monitor"))
      {
        if (v65 > 0xFFFFFFFFFFFFFFF7LL) {
          goto LABEL_176;
        }
        v90 = *(const char **)(v65 + 8);
        a2 = (unint64_t)&qword_100014298;
        v91 = dword_100014300++;
        sub_100009610(v90, 0xFFFFFFFFLL, v91, -1, 0, 0, &v114);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_1000083FC;
        block[3] = &unk_1000107E0;
        block[4] = v65;
        dispatch_async((dispatch_queue_t)qword_100014298, block);
      }

      else
      {
        if (!strcasecmp(v15, "set"))
        {
          if ((_DWORD)a2 != 1 && a2 < 4)
          {
            if (v65 > 0xFFFFFFFFFFFFFFF7LL) {
              goto LABEL_176;
            }
            v92 = *(const char **)(v65 + 8);
            v93 = dword_100014300++;
            sub_100009610(v92, 0xFFFFFFFFLL, v93, -1, 0, 0, &v114);
            if ((_DWORD)a2 == 3)
            {
              if (v65 > 0xFFFFFFFFFFFFFFEFLL) {
                goto LABEL_176;
              }
              v94 = atoll(*(const char **)(v65 + 16));
              sub_100009348(v114, v94, 0, 0);
            }
          }

          goto LABEL_175;
        }

        if (!strcasecmp(v15, "reserve"))
        {
          if ((_DWORD)a2 == 1) {
            goto LABEL_175;
          }
          if (a2 < 3)
          {
            uint64_t v15 = 0LL;
            v95 = 0;
          }

          else
          {
            if (v65 > 0xFFFFFFFFFFFFFFEFLL) {
              goto LABEL_176;
            }
            v95 = atoi(*(const char **)(v65 + 16));
            if (a2 < 4)
            {
              uint64_t v15 = 0LL;
            }

            else
            {
              if (v65 > 0xFFFFFFFFFFFFFFE7LL) {
                goto LABEL_176;
              }
              uint64_t v15 = (char *)atoi(*(const char **)(v65 + 24));
              if (a2 >= 5)
              {
                if (v65 > 0xFFFFFFFFFFFFFFDFLL) {
                  goto LABEL_176;
                }
                LODWORD(a2) = sub_1000084F0(*(const char **)(v65 + 32));
                goto LABEL_159;
              }
            }
          }

          LODWORD(a2) = 819;
LABEL_159:
          if (v65 > 0xFFFFFFFFFFFFFFF7LL) {
            goto LABEL_176;
          }
          v96 = *(const char **)(v65 + 8);
          if (!v96) {
            goto LABEL_167;
          }
          v97 = os_set_str_ptr_find(&unk_100014190, *(void *)(v65 + 8));
          if (v97)
          {
            v98 = (_DWORD *)(v97 - qword_1000141A8);
            if (v98) {
              goto LABEL_166;
            }
          }

          v98 = sub_100009518(v96);
          if (v98)
          {
            ++v98[14];
LABEL_166:
            v98[10] = v95;
            v98[11] = (_DWORD)v15;
            sub_100009698((uint64_t)v98);
          }

LABEL_167:
          if ((_DWORD)a2 != 819)
          {
            if (v65 > 0xFFFFFFFFFFFFFFF7LL) {
              goto LABEL_176;
            }
            uint64_t v15 = *(char **)(v65 + 8);
            if (v15)
            {
              v99 = os_set_str_ptr_find(&unk_100014190, *(void *)(v65 + 8));
              if (!v99 || (v100 = (void *)(v99 - qword_1000141A8)) == 0LL)
              {
                v100 = sub_100009518(v15);
                if (!v100) {
                  goto LABEL_175;
                }
                ++*((_DWORD *)v100 + 14);
              }

              *((_DWORD *)v100 + 12) = a2;
              sub_100009698((uint64_t)v100);
            }
          }

LABEL_175:
          sub_100008380(v65);
        }

        else
        {
          uint64_t v15 = (char *)strcasecmp(v15, "quit");
          sub_100008380(v65);
          if (!(_DWORD)v15) {
            goto LABEL_194;
          }
        }
      }
    }
  }

  __break(0x5512u);
  return result;
}

char *sub_100008290(const char *a1, unint64_t __ptr)
{
  unint64_t v5 = __ptr;
  if (!a1) {
    return (char *)v5;
  }
  if (__ptr)
  {
    unint64_t v4 = 0LL;
    uint64_t v3 = 0LL;
    LODWORD(v7) = 0;
    do
    {
      uint64_t v2 = (v7 + 1);
      if (!*(void *)(__ptr + 8 * v3)) {
        goto LABEL_7;
      }
      unint64_t v4 = 8LL * (v7 + 1);
      uint64_t v3 = (v7 + 1);
      LODWORD(v7) = v7 + 1;
    }

    while (v4 <= ~__ptr);
    goto LABEL_6;
  }

  unint64_t v5 = (unint64_t)malloc(0x10uLL);
  *(void *)unint64_t v5 = strdup(a1);
  if (v5 < 0xFFFFFFFFFFFFFFF8LL)
  {
    uint64_t v10 = (void *)(v5 + 8);
LABEL_14:
    *uint64_t v10 = 0LL;
    return (char *)v5;
  }

  while (1)
  {
    do
    {
LABEL_6:
      __break(0x5513u);
LABEL_7:
      size_t v8 = 8LL * (v7 + 2);
      unint64_t v5 = (unint64_t)realloc((void *)v5, v8);
      uint64_t result = strdup(a1);
    }

    while (v4 > ~v5);
    if (v8 <= 8 * v3) {
      break;
    }
    *(void *)(v5 + 8 * v3) = result;
    unint64_t v7 = 8LL * v2;
    if (v7 <= ~v5)
    {
      if (v8 >= v7)
      {
        uint64_t v10 = (void *)(v5 + 8 * v2);
        goto LABEL_14;
      }

      break;
    }
  }

  __break(1u);
  return result;
}

void sub_100008380(unint64_t a1)
{
  if (a1)
  {
    int v2 = 0;
    unint64_t v3 = ~a1;
    unint64_t v4 = (void **)a1;
    while (1)
    {
      if (!*v4) {
        goto LABEL_7;
      }
      free(*v4);
      *unint64_t v4 = 0LL;
      int v5 = v2 + 1;
      if (__OFADD__(v2, 1)) {
        break;
      }
      unint64_t v4 = (void **)(a1 + 8LL * v5);
      ++v2;
      if (8LL * v5 > v3)
      {
        __break(0x5513u);
LABEL_7:
        free((void *)a1);
        return;
      }
    }

    __break(0x5500u);
  }

void sub_1000083FC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 0xFFFFFFFFFFFFFFF7LL || v1 >= 0xFFFFFFFFFFFFFFF0LL)
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = *(const char **)(v1 + 8);
    int v5 = *(const char **)(v1 + 16);
    ++qword_100014168;
    if (v5)
    {
      uint64_t v6 = os_set_str_ptr_find(&unk_100014190, v4);
      if (v6) {
        BOOL v7 = qword_1000141A8 == v6;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        __int128 v11 = 0u;
        __int128 v12 = 0u;
        size_t v8 = sub_100009C74(v5, &v11, 1, 1023);
        if (v8)
        {
          size_t v9 = v8;
          *(void *)(v8 + 80) = strdup(v4);
          uint64_t v10 = *(dispatch_source_s **)(v9 + 72);
          *(void *)&__int128 v11 = _NSConcreteStackBlock;
          *((void *)&v11 + 1) = 0x40000000LL;
          *(void *)&__int128 v12 = sub_10000AC68;
          *((void *)&v12 + 1) = &unk_100010948;
          size_t v13 = v9;
          uint64_t v14 = 0LL;
          dispatch_source_set_event_handler(v10, &v11);
          dispatch_activate(*(dispatch_object_t *)(v9 + 72));
        }
      }
    }

    sub_100008380(*(void *)(a1 + 32));
  }

const char *sub_1000084F0(const char *result)
{
  if (result)
  {
    unint64_t v1 = result;
    uint64_t result = (const char *)strlen(result);
    if (result == (const char *)6)
    {
      if ((unint64_t)v1 > 0xFFFFFFFFFFFFFFFALL)
      {
        __break(0x5513u);
      }

      else
      {
        if (v1[1] == 119) {
          int v2 = (*v1 == 114) | 2;
        }
        else {
          int v2 = *(unsigned __int8 *)v1 == 114;
        }
        if (v1[2] == 114) {
          int v3 = v2 | 0x10;
        }
        else {
          int v3 = v2;
        }
        if (v1[3] == 119) {
          int v4 = v3 | 0x20;
        }
        else {
          int v4 = v3;
        }
        if (v1[4] == 114) {
          unsigned int v5 = v4 | 0x100;
        }
        else {
          unsigned int v5 = v4;
        }
        if (v1[5] == 119) {
          return (const char *)(v5 | 0x200);
        }
        else {
          return (const char *)v5;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void sub_10000858C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2 && (dispatch_mach_mig_demux(a1, &off_100010800, 1LL, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    mach_msg_destroy(msg);
  }

void sub_1000085E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2 && (dispatch_mach_mig_demux(a1, &off_100014000, 1LL, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    mach_msg_destroy(msg);
  }

FILE *sub_100008634(int a1)
{
  return sub_100004E98(a1, -1);
}

void sub_10000863C(id a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 0x40000000LL;
  v1[2] = sub_100002CB8;
  v1[3] = &unk_100010530;
  v1[4] = &stru_100010828;
  v1[5] = &unk_100014190;
  os_set_str_ptr_foreach(&unk_100014190, v1);
  qword_1000142D0 = time(0LL);
}

BOOL sub_1000086B4(id a1, void *a2)
{
  int v2 = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = 0;
  *((_DWORD *)a2 + 17) = v2;
  return 1;
}

void sub_1000086C4(id a1)
{
  unint64_t v1 = fopen("/var/run/notifyd_jetsam.log", "w");
  if (v1)
  {
    int v2 = v1;
    if ((fprintf(v1, "-- JETSAM LOG BEGIN ---\n") & 0x80000000) == 0)
    {
      sub_100005BD0(v2);
    }
  }

void sub_100008740(id a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 0x40000000LL;
  v1[2] = sub_100002CB8;
  v1[3] = &unk_100010530;
  v1[4] = &stru_100010828;
  v1[5] = &unk_100014190;
  os_set_str_ptr_foreach(&unk_100014190, v1);
  qword_1000142D0 = time(0LL);
}

void sub_1000087B8(id a1)
{
  if (dword_1000142F8 == 7) {
    int v1 = dword_1000142FC;
  }
  else {
    int v1 = 7;
  }
  dword_1000142F8 = v1;
}

void sub_1000087D8(id a1, int a2)
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Event publisher error";
  qword_100014040 = a2;
  __break(1u);
}

void sub_100008800(id a1, unsigned int a2, unint64_t a3, void *a4)
{
  if (a2 == 2)
  {
    dispatch_mach_connect(qword_100014280, dword_100014288, 0LL, 0LL);
    dispatch_mach_connect(qword_1000142A0, dword_10001428C, 0LL, 0LL);
    return;
  }

  if (a2 != 1)
  {
    if (a2) {
      return;
    }
    if (xpc_get_type(a4) != (xpc_type_t)&_xpc_type_dictionary) {
      __assert_rtn( "notifyd_matching_register",  "notify_proc.c",  1658,  "xpc_get_type(descriptor) == XPC_TYPE_DICTIONARY");
    }
    string = xpc_dictionary_get_string(a4, "Notification");
    unsigned int v7 = dword_100014300++;
    ++*((void *)&xmmword_100014098 + 1);
    ++qword_1000140D0;
    sub_1000070C4((FILE *)7, "notifyd_matching_register %s %d %llu\n", v8, v9, v10, v11, v12, v13, (char)string);
    uint64_t v25 = 0LL;
    if (!string)
    {
      LOBYTE(v20) = 1;
      goto LABEL_14;
    }

    if (!qword_100014250) {
      __assert_rtn("_notify_lib_register_xpc_event", "libnotify.c", 1109, "ns->event_publisher != NULL");
    }
    int v20 = sub_1000093D4(string, 0xFFFFFFFFLL, v7, 0, -101, &v25);
    if (v20)
    {
      if (v20 == 7) {
        return;
      }
LABEL_14:
      sub_1000070C4( (FILE *)4,  "_notify_lib_register_xpc_event failed with status %u\n",  v14,  v15,  v16,  v17,  v18,  v19,  v20);
      return;
    }

    uint64_t v22 = v25;
    *(_BYTE *)(v25 + 79) = *(_BYTE *)(v25 + 79) & 0xF0 | 6;
    *(void *)(v22 + 56) = a3;
    uint64_t v23 = os_set_64_ptr_find(&unk_1000141D0, *(void *)&v7 | 0xFFFFFFFF00000000LL);
    if (!v23 || (uint64_t v24 = v23 - qword_1000141E8, v23 == qword_1000141E8))
    {
      qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Can't find client after registering an event";
      __break(1u);
    }

    else if (!os_map_64_find(&unk_100014230, a3))
    {
      os_map_64_insert(&unk_100014230, a3, v24);
      ++dword_100014278;
      return;
    }

    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Event token is already registered";
    qword_100014040 = a3;
    __break(1u);
    return;
  }

  BOOL v21 = (unsigned int *)os_map_64_delete(&unk_100014230, a3, a3, a4);
  if (v21)
  {
    ++dword_10001427C;
    sub_10000910C(v21);
  }

void sub_100008A84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = 0LL;
  if (getpid() != 1)
  {
    int v9 = vasprintf(&v10, "BUG IN CLIENT OF NOTIFYD: %s has not dequeued the last %d messages", &a9);
    if (v10)
    {
      if (__OFADD__(v9, 1))
      {
        __break(0x5500u);
      }

      else
      {
        os_fault_with_payload(18LL, 2LL, v10, (v9 + 1), v10, 0LL);
        free(v10);
      }
    }
  }

uint64_t sub_100008AFC(const char *a1, int a2, int a3, int a4)
{
  if (!a1) {
    return 10LL;
  }
  if (!a2) {
    return 0LL;
  }
  if (strncmp(a1, "user.uid.", 9uLL))
  {
    size_t v8 = strlen(a1);
    uint64_t v9 = qword_100014248;
    if (!qword_100014248)
    {
      dword_10001425C = 0;
      return 0LL;
    }

    int v24 = a4;
    if (!dword_10001425C) {
      return 0LL;
    }
    size_t v10 = v8;
    unint64_t v11 = 0LL;
    unint64_t v12 = ~qword_100014248;
    uint64_t v13 = 8LL * dword_10001425C;
    while (1)
    {
      if (v11 > v12) {
        goto LABEL_38;
      }
      uint64_t v14 = *(void *)(v9 + v11);
      if (!v14) {
        return 0LL;
      }
      uint64_t v15 = *(const char **)(v14 + 8);
      if (v15)
      {
        size_t v16 = strlen(*(const char **)(v14 + 8));
        if (v16 <= v10 && !strncmp(v15, a1, v16)) {
          break;
        }
      }

      v11 += 8LL;
      if (v13 == v11) {
        return 0LL;
      }
    }

    if (*(_DWORD *)(v14 + 40) == a2 && (*(_DWORD *)(v14 + 48) & v24) != 0) {
      return 0LL;
    }
    int v21 = *(_DWORD *)(v14 + 48);
    BOOL v22 = *(_DWORD *)(v14 + 44) != a3 || (v21 & (16 * v24)) == 0;
    if (!v22 || (v21 & (v24 << 8)) != 0) {
      return 0LL;
    }
    return 7LL;
  }

  snprintf(__str, 0x3FuLL, "%s%d", "user.uid.", a2);
  size_t v18 = strlen(__str);
  if (strncmp(a1, __str, v18)) {
    return 7LL;
  }
  if (__CFADD__(a1, v18)) {
LABEL_38:
  }
    __break(0x5513u);
  int v19 = a1[v18];
  if (v19 == 46 || v19 == 0) {
    return 0LL;
  }
  else {
    return 7LL;
  }
}

void sub_100008CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(_BYTE *)(a1 + 79);
  if ((v4 & 0x20) != 0)
  {
    char v7 = v4 | 0x40;
    goto LABEL_31;
  }

  if (a2) {
    goto LABEL_3;
  }
  uint64_t v8 = os_set_32_ptr_find(&unk_100014210, *(unsigned int *)(a1 + 68));
  if (v8 && qword_100014228 != v8)
  {
    a2 = v8 - qword_100014228;
    char v4 = *(_BYTE *)(a1 + 79);
LABEL_3:
    if ((*(_BYTE *)(a2 + 20) & 1) != 0)
    {
      ++*(_BYTE *)(a1 + 78);
      char v7 = v4 | 0x60;
      goto LABEL_31;
    }

    char v6 = 0;
    goto LABEL_9;
  }

  a2 = 0LL;
  char v4 = *(_BYTE *)(a1 + 79);
  char v6 = 1;
LABEL_9:
  switch(v4 & 0xF)
  {
    case 3:
      uint64_t v9 = *(unsigned int *)(a1 + 56);
      goto LABEL_36;
    case 4:
      if ((*(_DWORD *)(a1 + 56) & 0x80000000) != 0) {
        goto LABEL_30;
      }
      v23[0] = bswap32(*(_DWORD *)(a1 + 64));
      if (write_NOCANCEL() != 4)
      {
        close_NOCANCEL(*(unsigned int *)(a1 + 56));
        *(_DWORD *)(a1 + 56) = -1;
        return;
      }

LABEL_29:
      char v4 = *(_BYTE *)(a1 + 79);
LABEL_30:
      char v7 = v4 & 0x3F;
      break;
    case 5:
      pid_t v10 = *(_DWORD *)(a1 + 68);
      if (!v10) {
        pid_t v10 = getpid();
      }
      if (!kill(v10, *(_DWORD *)(a1 + 56))) {
        goto LABEL_29;
      }
      return;
    case 6:
      xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v11, "Notification", *(const char **)(*(void *)(a1 + 48) + 8LL));
      uint64_t v12 = os_set_64_ptr_find(&unk_1000141B0, *(void *)(*(void *)(a1 + 48) + 16LL));
      if (v12 && qword_1000141C8 != v12) {
        xpc_dictionary_set_uint64(v11, "_State", *(void *)(v12 - qword_1000141C8 + 24));
      }
      int v13 = xpc_event_publisher_fire_noboost(qword_100014250, *(void *)(a1 + 56), v11);
      xpc_release(v11);
      if (!v13) {
        goto LABEL_29;
      }
      if (v13 == 55 && !*(_BYTE *)(a1 + 80))
      {
        *(_BYTE *)(a1 + 80) = 1;
        if (xpc_get_service_identifier_for_token(*(void *)(a1 + 56), v23))
        {
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics("libnotify.simulate_crash");
        }
      }

      return;
    case 7:
      if ((v6 & 1) == 0)
      {
        uint64_t v22 = *(void *)(a2 + 24);
        if (v22)
        {
          uint64_t v9 = *(unsigned int *)(v22 + 8);
LABEL_36:
          sub_100008F50(a1, a3, v9);
        }
      }

      return;
    default:
      goto LABEL_30;
  }

LABEL_31:
  *(_BYTE *)(a1 + 79) = v7;
}

uint64_t sub_100008F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v3 = a3;
  uint64_t v4 = a2;
  if (a2) {
    goto LABEL_2;
  }
  uint64_t v7 = os_set_32_ptr_find(&unk_1000141F0, a3);
  if (!v7)
  {
    uint64_t v4 = 0LL;
LABEL_9:
    char v6 = 1;
    goto LABEL_10;
  }

  uint64_t v4 = v7 - qword_100014208;
  if (v7 == qword_100014208) {
    goto LABEL_9;
  }
LABEL_2:
  if ((*(_BYTE *)(v4 + 12) & 1) != 0)
  {
    uint64_t result = 0LL;
    ++*(_BYTE *)(a1 + 78);
    char v9 = *(_BYTE *)(a1 + 79) | 0x60;
LABEL_18:
    *(_BYTE *)(a1 + 79) = v9;
    return result;
  }

  char v6 = 0;
LABEL_10:
  if ((dword_100014258 & 2) != 0) {
    mach_msg_option_t v10 = 145;
  }
  else {
    mach_msg_option_t v10 = 17;
  }
  *(void *)&msg.msgh_voucher_port = 0LL;
  *(void *)&msg.msgh_bits = 0x1800000013LL;
  msg.msgh_remote_port = v3;
  msg.msgh_local_port = 0;
  msg.msgh_id = *(_DWORD *)(a1 + 64);
  uint64_t result = mach_msg(&msg, v10, 0x18u, 0, 0, 0, 0);
  if (!(_DWORD)result)
  {
    char v9 = *(_BYTE *)(a1 + 79) & 0x3F;
    goto LABEL_18;
  }

  if ((_DWORD)result != 268435460) {
    return 46LL;
  }
  mach_msg_destroy(&msg);
  if ((dword_100014258 & 2) == 0) {
    return 45LL;
  }
  ++*(_BYTE *)(a1 + 78);
  *(_BYTE *)(a1 + 79) |= 0xE0u;
  uint64_t result = 0LL;
  if ((v6 & 1) == 0) {
    *(_DWORD *)(v4 + 12) |= 1u;
  }
  return result;
}

uint64_t sub_1000090AC(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = a1;
  ++*(_DWORD *)(v3 + 60);
  while (1)
  {
    uint64_t v3 = *(void *)v3;
    if (!v3) {
      break;
    }
    sub_100008CD0(v3, 0LL, 0LL);
  }

  return 0LL;
}

void sub_10000910C(unsigned int *a1)
{
  uint64_t v2 = *((void *)a1 + 6);
  uint64_t v3 = *(void *)a1;
  if (*(void *)a1) {
    *(void *)(v3 + 8) = *((void *)a1 + 1);
  }
  **((void **)a1 + 1) = v3;
  sub_100002C70((uint64_t)&unk_1000141D0, *((void *)a1 + 8), (uint64_t)(a1 + 16));
  int v4 = *((_BYTE *)a1 + 79) & 0xF;
  if (v4 == 3)
  {
    mach_port_deallocate(mach_task_self_, a1[14]);
  }

  else if (v4 == 4)
  {
    uint64_t v5 = a1[14];
    if ((v5 & 0x80000000) == 0) {
      close_NOCANCEL(v5);
    }
  }

  free(a1);
  ++dword_100014274;
  sub_1000091BC(v2);
}

void sub_1000091BC(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 56);
    if (!v2 || (int v3 = v2 - 1, (*(_DWORD *)(a1 + 56) = v3) == 0))
    {
      int v4 = dword_10001425C;
      if (dword_10001425C)
      {
        uint64_t v5 = 0LL;
        char v6 = (void *)qword_100014248;
        unint64_t v7 = 8LL;
        while (1)
        {
          if (*(void *)(qword_100014248 + 8 * v5) == a1) {
            break;
          }
          ++v5;
          v7 += 8LL;
          if (v5 == dword_10001425C) {
            goto LABEL_20;
          }
        }

        if ((int)v5 + 1 < dword_10001425C)
        {
          uint64_t v8 = 8LL * dword_10001425C;
          while (v7 <= ~qword_100014248 && ~qword_100014248 >= 8 * (unint64_t)v5)
          {
            *(void *)(qword_100014248 + 8LL * v5) = *(void *)(qword_100014248 + v7);
            v7 += 8LL;
            LODWORD(v5) = v5 + 1;
            if (v8 == v7)
            {
              char v6 = (void *)qword_100014248;
              goto LABEL_16;
            }
          }

LABEL_24:
          __break(0x5513u);
          return;
        }

LABEL_16:
        unsigned int v9 = v4 - 1;
        dword_10001425C = v9;
        if (v9)
        {
          mach_msg_option_t v10 = reallocf(v6, 8LL * v9);
        }

        else
        {
          free(v6);
          mach_msg_option_t v10 = 0LL;
        }

        qword_100014248 = (uint64_t)v10;
      }

LABEL_20:
      if (os_set_str_ptr_delete(&unk_100014190, *(void *)(a1 + 8)) != a1 + 8) {
        __assert_rtn("_nc_table_delete", "table.c", 72, "os_set_delete(&t->set, key) == expected");
      }
      *(void *)(a1 + 8) = 0LL;
      sub_100002C70((uint64_t)&unk_1000141B0, *(void *)(a1 + 16), a1 + 16);
      free((void *)a1);
      ++dword_10001426C;
    }
  }

void sub_100009314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 78) || (char v3 = *(_BYTE *)(a1 + 78) - 1, (*(_BYTE *)(a1 + 78) = v3) == 0))
  {
    char v4 = *(_BYTE *)(a1 + 79);
    *(_BYTE *)(a1 + 79) = v4 & 0x5F;
    if ((v4 & 0x40) != 0) {
      sub_100008CD0(a1, a2, a3);
    }
  }

uint64_t sub_100009348(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = os_set_64_ptr_find(&unk_1000141B0, a1);
  if (!v7) {
    return 1LL;
  }
  uint64_t v8 = v7 - qword_1000141C8;
  if (v7 == qword_1000141C8) {
    return 1LL;
  }
  *(void *)(v8 + 24) = a2;
  uint64_t v10 = mach_absolute_time();
  uint64_t result = 0LL;
  *(void *)(v8 + 32) = v10;
  return result;
}

uint64_t sub_1000093D4(const char *a1, uint64_t a2, unsigned int a3, int a4, int a5, void *a6)
{
  if (!a6) {
    return 0LL;
  }
  *a6 = 0LL;
  uint64_t v11 = os_set_str_ptr_find(&unk_100014190, a1);
  if (!v11 || (uint64_t v12 = (void *)(v11 - qword_1000141A8), v11 == qword_1000141A8))
  {
    uint64_t v12 = sub_100009518(a1);
    if (!v12) {
      return 47LL;
    }
  }

  unint64_t v13 = a3 | (unint64_t)(a2 << 32);
  ++*((_DWORD *)v12 + 14);
  uint64_t v14 = os_set_64_ptr_find(&unk_1000141D0, v13);
  if ((!v14 || qword_1000141E8 == v14) && (uint64_t v15 = calloc(1uLL, 0x58uLL)) != 0LL)
  {
    uint64_t v16 = v15;
    ++dword_100014270;
    char v15[8] = v13;
    v15[6] = v12;
    uint64_t v17 = *v12;
    *uint64_t v15 = *v12;
    if (v17) {
      *(void *)(v17 + 8) = v15;
    }
    *uint64_t v12 = v15;
    v15[1] = v12;
    os_set_64_ptr_insert(&unk_1000141D0, v15 + 8);
    uint64_t result = 0LL;
    *a6 = v16;
  }

  else
  {
    sub_1000091BC((uint64_t)v12);
    return 48LL;
  }

  return result;
}

void *sub_100009518(const char *a1)
{
  size_t v2 = strlen(a1);
  unint64_t v3 = v2 + 73;
  uint64_t result = calloc(1uLL, v2 + 73);
  uint64_t v5 = result;
  if (!result) {
    return v5;
  }
  ++dword_100014268;
  if ((unint64_t)result < 0xFFFFFFFFFFFFFFB8LL)
  {
    if (v3 >= 0x10)
    {
      result[1] = result + 9;
      uint64_t result = memcpy(result + 9, a1, v2 + 1);
      uint64_t v6 = qword_100014188++;
      if (v3 >= 0x18)
      {
        __int128 v5[2] = v6;
        if (v3 >= 0x34)
        {
          *((_DWORD *)v5 + 12) = 819;
          if (v3 >= 0x38)
          {
            *((_DWORD *)v5 + 13) = -1;
            if (v3 >= 0x40)
            {
              *((_DWORD *)v5 + 15) = 1;
              void *v5 = 0LL;
              os_set_str_ptr_insert(&unk_100014190, v5 + 1);
              os_set_64_ptr_insert(&unk_1000141B0, v5 + 2);
              return v5;
            }
          }
        }
      }
    }

    __break(1u);
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_100009610(const char *a1, uint64_t a2, unsigned int a3, int a4, int a5, int a6, void *a7)
{
  if (!a1) {
    return 1LL;
  }
  uint64_t v14 = 0LL;
  uint64_t result = sub_1000093D4(a1, a2, a3, a5, a6, &v14);
  if (!(_DWORD)result)
  {
    uint64_t v10 = v14;
    char v11 = *(_BYTE *)(v14 + 79) & 0xF0;
    uint64_t v12 = *(void *)(v14 + 48);
    if (a4 == -1)
    {
      char v13 = v11 | 2;
    }

    else
    {
      char v13 = v11 | 1;
      *(_DWORD *)(v12 + 52) = a4;
    }

    uint64_t result = 0LL;
    *(_BYTE *)(v10 + 79) = v13;
    *a7 = *(void *)(v12 + 16);
  }

  return result;
}

uint64_t sub_100009698(uint64_t a1)
{
  uint64_t result = qword_100014248;
  if (qword_100014248)
  {
    if (dword_10001425C)
    {
      unint64_t v3 = 0LL;
      while (v3 <= ~qword_100014248)
      {
        if (*(void *)(qword_100014248 + v3) == a1) {
          return result;
        }
        v3 += 8LL;
        if (8LL * dword_10001425C == v3)
        {
          size_t v4 = 8LL * (dword_10001425C + 1);
          goto LABEL_10;
        }
      }

      goto LABEL_27;
    }
  }

  else
  {
    dword_10001425C = 0;
  }

  size_t v4 = 8LL;
LABEL_10:
  uint64_t result = (uint64_t)reallocf((void *)qword_100014248, v4);
  uint64_t v5 = result;
  qword_100014248 = result;
  uint64_t v6 = dword_10001425C;
  if (dword_10001425C)
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    unint64_t v9 = ~result;
    uint64_t v10 = *(const char **)(a1 + 8);
    size_t v11 = v4 >> 3;
    while (v7 <= v9)
    {
      if (v11 == v8) {
        goto LABEL_28;
      }
      uint64_t result = strcmp(v10, *(const char **)(*(void *)(v5 + 8 * v8) + 8LL));
      if ((int)result > 0)
      {
        unsigned int v12 = v6;
        while (1)
        {
          uint64_t v13 = v12 - 1;
          if (~qword_100014248 < 8 * (unint64_t)v13
            || ~qword_100014248 < 8 * (unint64_t)v12)
          {
            goto LABEL_27;
          }

          *(void *)(qword_100014248 + 8LL * v12--) = *(void *)(qword_100014248 + 8 * v13);
          if (v13 <= v8)
          {
            uint64_t v5 = qword_100014248;
            goto LABEL_24;
          }
        }
      }

      ++v8;
      v7 += 8LL;
      if (v6 == v8)
      {
        LODWORD(v8) = v6;
        goto LABEL_24;
      }
    }
  }

  else
  {
    LODWORD(v8) = 0;
LABEL_24:
    if (!__CFADD__(v5, 8LL * v8))
    {
      *(void *)(v5 + 8LL * v8) = a1;
      dword_10001425C = v6 + 1;
      return result;
    }
  }

LABEL_27:
  __break(0x5513u);
LABEL_28:
  __break(1u);
  return result;
}

void sub_10000980C(uint64_t a1)
{
  if (!a1) {
    return;
  }
  int v2 = *(_DWORD *)(a1 + 104);
  if (v2)
  {
    int v3 = v2 - 1;
    *(_DWORD *)(a1 + 104) = v3;
    if (v3) {
      return;
    }
  }

  sub_1000098D8(a1);
  sub_100009954();
  free(*(void **)a1);
  size_t v4 = *(void **)(a1 + 56);
  if (!v4)
  {
LABEL_13:
    free(*(void **)(a1 + 80));
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    free((void *)a1);
    return;
  }

  uint64_t v5 = *(unsigned int *)(a1 + 48);
  *(_DWORD *)(a1 + 48) = 0;
  if (!(_DWORD)v5)
  {
LABEL_12:
    free(v4);
    goto LABEL_13;
  }

  uint64_t v6 = 0LL;
  uint64_t v7 = 8 * v5;
  while (1)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if (__CFADD__(v8, v6)) {
      break;
    }
    free(*(void **)(v8 + v6));
    uint64_t v9 = *(void *)(a1 + 56);
    if (__CFADD__(v9, v6)) {
      break;
    }
    *(void *)(v9 + v6) = 0LL;
    v6 += 8LL;
    if (v7 == v6)
    {
      size_t v4 = *(void **)(a1 + 56);
      goto LABEL_12;
    }
  }

  __break(0x5513u);
}

uint64_t sub_1000098D8(uint64_t result)
{
  uint64_t v1 = dword_100014058;
  if (dword_100014058)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = qword_100014060;
    while (!__CFADD__(v3, 8 * v2))
    {
      uint64_t v4 = *(void *)(v3 + 8 * v2);
      if (v4)
      {
        uint64_t v5 = *(unsigned int *)(v4 + 56);
        if ((_DWORD)v5)
        {
          uint64_t v6 = 0LL;
          uint64_t v7 = *(void *)(v4 + 64);
          while (~v7 >= (unint64_t)(8 * v6))
          {
            if (*(void *)(v7 + 8 * v6) == result)
            {
              *(void *)(v7 + 8 * v6) = 0LL;
              uint64_t v3 = qword_100014060;
              goto LABEL_12;
            }

            if (++v6 == v5) {
              goto LABEL_12;
            }
          }

          break;
        }
      }

LABEL_12:
      if (++v2 == v1) {
        return result;
      }
    }

    __break(0x5513u);
  }

  return result;
}

void sub_100009954()
{
  unsigned int v0 = dword_100014058;
  if (dword_100014058)
  {
    unsigned int v1 = 0;
    uint64_t v2 = qword_100014060;
    do
    {
      if (__CFADD__(v2, 8LL * v1)) {
        goto LABEL_54;
      }
      unsigned int v3 = v1;
      uint64_t v4 = *(void *)(v2 + 8LL * v1);
      if (v4)
      {
        uint64_t v5 = *(unsigned int *)(v4 + 56);
        if ((_DWORD)v5)
        {
          unint64_t v6 = 0LL;
          LODWORD(v7) = 0;
          uint64_t v8 = *(void *)(v4 + 64);
          do
          {
            if (v6 > ~v8) {
              goto LABEL_54;
            }
            if (*(void *)(v8 + v6)) {
              size_t v7 = (v7 + 1);
            }
            else {
              size_t v7 = v7;
            }
            v6 += 8LL;
          }

          while (8 * v5 != v6);
          if ((_DWORD)v7 != (_DWORD)v5)
          {
            if ((_DWORD)v7)
            {
              unint64_t v9 = (unint64_t)calloc(v7, 8uLL);
              if (!v9) {
                __assert_rtn("_vnode_sweep", "pathwatch.c", 515, "new_path_node != NULL");
              }
              unint64_t v10 = v9;
              uint64_t v11 = *(unsigned int *)(v4 + 56);
              if ((_DWORD)v11)
              {
                uint64_t v12 = 0LL;
                unsigned int v13 = 0;
                uint64_t v14 = 8 * v11;
                while (1)
                {
                  uint64_t v15 = *(void *)(v4 + 64);
                  if (__CFADD__(v15, v12)) {
                    goto LABEL_54;
                  }
                  uint64_t v16 = *(void *)(v15 + v12);
                  if (v16)
                  {
                    if (v7 <= v13)
                    {
LABEL_56:
                      __break(1u);
                      return;
                    }

                    uint64_t v17 = v13++;
                    *(void *)(v9 + 8 * v17) = v16;
                  }

                  v12 += 8LL;
                  if (v14 == v12) {
                    goto LABEL_26;
                  }
                }
              }

              unsigned int v13 = 0;
            }

            else
            {
              unsigned int v13 = 0;
              unint64_t v10 = 0LL;
            }

LABEL_26:
            free(*(void **)(v4 + 64));
            *(void *)(v4 + 64) = v10;
            *(_DWORD *)(v4 + 56) = v13;
            unsigned int v0 = dword_100014058;
            uint64_t v2 = qword_100014060;
          }
        }
      }

      unsigned int v1 = v3 + 1;
    }

    while (v3 + 1 < v0);
    if (v0)
    {
      unint64_t v18 = 0LL;
      unsigned int v19 = 0;
      do
      {
        if (v18 > ~v2) {
          goto LABEL_54;
        }
        uint64_t v20 = *(void *)(v2 + v18);
        if (v20)
        {
          if (*(_DWORD *)(v20 + 56)) {
            ++v19;
          }
        }

        v18 += 8LL;
      }

      while (8LL * v0 != v18);
      if (v19 != v0)
      {
        if (v19)
        {
          uint64_t v21 = (uint64_t)calloc(v19, 8uLL);
          if (!v21) {
            goto LABEL_55;
          }
          uint64_t v22 = v21;
          unint64_t v23 = dword_100014058;
          if (dword_100014058)
          {
            uint64_t v24 = 0LL;
            unint64_t v25 = 0LL;
            unsigned int v26 = 0;
            unint64_t v27 = ~v21;
            while (!__CFADD__(qword_100014060, v24))
            {
              uint64_t v28 = *(void *)(qword_100014060 + 8 * v25);
              if (v28)
              {
                if (*(_DWORD *)(v28 + 56))
                {
                  if (v19 <= v26) {
                    goto LABEL_56;
                  }
                  uint64_t v29 = v26++;
                  *(void *)(v22 + 8 * v29) = v28;
                }

                else
                {
                  dispatch_source_cancel(*(dispatch_source_t *)(v28 + 48));
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 0x40000000LL;
                  block[2] = sub_100009C30;
                  block[3] = &unk_1000108C8;
                  block[4] = v28;
                  dispatch_async((dispatch_queue_t)qword_100014298, block);
                  unint64_t v23 = dword_100014058;
                }
              }

              ++v25;
              v24 += 8LL;
              if (v25 >= v23) {
                goto LABEL_51;
              }
            }

LABEL_54:
            __break(0x5513u);
LABEL_55:
            __assert_rtn("_vnode_sweep", "pathwatch.c", 548, "new_source != NULL");
          }

          unsigned int v26 = 0;
        }

        else
        {
          unsigned int v26 = 0;
          uint64_t v22 = 0LL;
        }

LABEL_51:
        free((void *)qword_100014060);
        qword_100014060 = v22;
        dword_100014058 = v26;
      }
    }
  }

void sub_100009C30(uint64_t a1)
{
}

size_t sub_100009C74(const char *a1, _OWORD *a2, int a3, __int16 a4)
{
  uint64_t v8 = (dispatch_queue_s *)qword_100014298;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100014298);
  if (qword_100014050 != -1) {
    dispatch_once(&qword_100014050, &stru_1000108A8);
  }
  if (*a1 == 47)
  {
    size_t result = (size_t)calloc(1uLL, 0x70uLL);
    if (!result) {
      __assert_rtn("_path_node_init", "pathwatch.c", 723, "pnode != NULL");
    }
    uint64_t v10 = result;
    *(void *)(result + 8) = 1LL;
    for (int i = *(unsigned __int8 *)a1; i == 47; int i = v12)
    {
      int v12 = *(unsigned __int8 *)++a1;
    }

    while (1)
    {
LABEL_28:
      unint64_t v18 = strchr(a1, 47);
      if (!v18) {
        unint64_t v18 = (char *)&a1[strlen(a1)];
      }
      int64_t v19 = v18 - a1;
      if (v18 == a1) {
        break;
      }
      *(void *)(v10 + 8) += v19 + 1;
      if (v18)
      {
        size_t result = (size_t)malloc(v19 + 1);
        if (!result) {
          __assert_rtn("_path_node_init", "pathwatch.c", 747, "name != NULL");
        }
        unsigned int v13 = (char *)result;
        if (a1) {
          size_t result = (size_t)strncpy((char *)result, a1, v18 - a1);
        }
        if (__CFADD__(v13, v19)) {
          goto LABEL_44;
        }
        if (v19 < 0) {
          goto LABEL_45;
        }
        v13[v19] = 0;
      }

      else
      {
        unsigned int v13 = strdup(a1);
      }

      int v14 = *(_DWORD *)(v10 + 48);
      if (v14)
      {
        size_t v15 = 8LL * (v14 + 1);
        size_t result = (size_t)reallocf(*(void **)(v10 + 56), v15);
      }

      else
      {
        size_t result = (size_t)calloc(1uLL, 8uLL);
        size_t v15 = 8LL;
      }

      *(void *)(v10 + 56) = result;
      if (!result) {
        __assert_rtn("_path_node_init", "pathwatch.c", 763, "pnode->pname != NULL");
      }
      uint64_t v16 = *(unsigned int *)(v10 + 48);
      if (__CFADD__(result, 8 * v16)) {
        goto LABEL_44;
      }
      if (v15 <= 8 * v16) {
        goto LABEL_45;
      }
      a1 = 0LL;
      *(void *)(result + 8 * v16) = v13;
      *(_DWORD *)(v10 + 48) = v16 + 1;
      if (v18)
      {
        a1 = v18;
        if (*v18 == 47)
        {
          a1 = v18;
          while (a1 != (const char *)-1LL)
          {
            int v17 = *(unsigned __int8 *)++a1;
            if (v17 != 47) {
              goto LABEL_28;
            }
          }

          goto LABEL_44;
        }
      }
    }

    uint64_t v20 = calloc(1uLL, *(void *)(v10 + 8));
    *(void *)uint64_t v10 = v20;
    if (!v20) {
      __assert_rtn("_path_node_init", "pathwatch.c", 776, "pnode->path != NULL");
    }
    if (!*(_DWORD *)(v10 + 48))
    {
LABEL_36:
      *(_DWORD *)(v10 + 104) = 1;
      __int128 v24 = a2[1];
      *(_OWORD *)(v10 + 16) = *a2;
      *(_OWORD *)(v10 + 32) = v24;
      sub_100009F88(v10, 0, 0LL);
      *(void *)(v10 + 72) = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  v8);
      *(_DWORD *)(v10 + 68) = a4 & 0x3FF;
      if (a3) {
        *(_DWORD *)(v10 + 68) = a4 & 0x3FF | 0x20000000;
      }
      return v10;
    }

    uint64_t v21 = 0LL;
    unint64_t v22 = 0LL;
    while (1)
    {
      size_t result = strlcat(*(char **)v10, "/", *(void *)(v10 + 8));
      uint64_t v23 = *(void *)(v10 + 56);
      if (__CFADD__(v23, v21)) {
        break;
      }
      strlcat(*(char **)v10, *(const char **)(v23 + 8 * v22++), *(void *)(v10 + 8));
      v21 += 8LL;
    }

LABEL_44:
    __break(0x5513u);
LABEL_45:
    __break(1u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

void sub_100009F88(uint64_t a1, int a2, const char **a3)
{
  if (!a1) {
    return;
  }
  unint64_t v6 = *(dispatch_source_s **)(a1 + 72);
  if (v6)
  {
    if (dispatch_source_testcancel(v6)) {
      return;
    }
  }

  size_t v7 = *(const char **)a1;
  int v9 = *(_DWORD *)(a1 + 64);
  int v8 = *(_DWORD *)(a1 + 68);
  __int128 v10 = *(_OWORD *)(a1 + 32);
  __int128 v44 = *(_OWORD *)(a1 + 16);
  __int128 v45 = v10;
  if (v7)
  {
    *(_DWORD *)(a1 + 64) = 0;
    if (*v7 == 47)
    {
      if (v7 == (const char *)-1LL) {
LABEL_75:
      }
        __break(0x5513u);
      if (v7[1])
      {
        if ((v8 & 0x20000000) == 0)
        {
          __int128 v11 = *(_OWORD *)(a1 + 32);
          *(_OWORD *)&v43.st_dev = *(_OWORD *)(a1 + 16);
          *(_OWORD *)&v43.st_uid = v11;
          if (sandbox_check_by_audit_token(&v43, "file-read-metadata", SANDBOX_CHECK_NO_REPORT | 1u))
          {
LABEL_10:
            a2 |= 0x40u;
            goto LABEL_18;
          }
        }

        memset(&v46, 0, sizeof(v46));
        if (lstat(v7, &v46)) {
          goto LABEL_18;
        }
        int v12 = v46.st_mode & 0xF000;
        switch(v12)
        {
          case 16384:
            int v14 = 0;
            int v13 = 0;
            int v15 = 3;
            goto LABEL_57;
          case 40960:
            int v14 = 0;
            int v15 = 2;
            int v13 = 1;
            goto LABEL_57;
          case 32768:
            int v13 = 0;
            int v14 = 1;
            int v15 = 1;
LABEL_57:
            *(_DWORD *)(a1 + 64) = v15;
            if ((v8 & 0x20000000) != 0) {
              goto LABEL_18;
            }
            *(_OWORD *)&v43.st_dev = v44;
            *(_OWORD *)&v43.st_uid = v45;
            if (!audit_token_to_euid((audit_token_t *)&v43)) {
              goto LABEL_18;
            }
            bzero(__str, 0x401uLL);
            if (!realpath_DARWIN_EXTSN(v7, __str)
              || qword_100014068 && !strncasecmp(__str, (const char *)qword_100014068, qword_100014070))
            {
              goto LABEL_18;
            }

            if (v14)
            {
              *(_OWORD *)&v43.st_dev = v44;
              *(_OWORD *)&v43.st_uid = v45;
              uid_t v36 = audit_token_to_euid((audit_token_t *)&v43);
              *(_OWORD *)&v43.st_dev = v44;
              *(_OWORD *)&v43.st_uid = v45;
              gid_t v37 = audit_token_to_egid((audit_token_t *)&v43);
              uint64_t v38 = (char *)v7;
              int v39 = 0;
            }

            else
            {
              if (!v13)
              {
                snprintf(__str, 0x400uLL, "%s/.", v7);
                *(_OWORD *)&v43.st_dev = v44;
                *(_OWORD *)&v43.st_uid = v45;
                uid_t v41 = audit_token_to_euid((audit_token_t *)&v43);
                *(_OWORD *)&v43.st_dev = v44;
                *(_OWORD *)&v43.st_uid = v45;
                gid_t v37 = audit_token_to_egid((audit_token_t *)&v43);
                uint64_t v38 = __str;
                int v39 = 0;
                uid_t v40 = v41;
                goto LABEL_72;
              }

              *(_OWORD *)&v43.st_dev = v44;
              *(_OWORD *)&v43.st_uid = v45;
              uid_t v36 = audit_token_to_euid((audit_token_t *)&v43);
              *(_OWORD *)&v43.st_dev = v44;
              *(_OWORD *)&v43.st_uid = v45;
              gid_t v37 = audit_token_to_egid((audit_token_t *)&v43);
              uint64_t v38 = (char *)v7;
              int v39 = 1;
            }

            uid_t v40 = v36;
LABEL_72:
            *(_DWORD *)(a1 + 64) = 0;
            goto LABEL_10;
        }

        int v16 = 4;
      }

      else
      {
        int v16 = 3;
      }

      *(_DWORD *)(a1 + 64) = v16;
    }
  }

LABEL_18:
  if (a3)
  {
    if ((a2 & 0x61) != 0)
    {
      *(_DWORD *)(a1 + 64) = 0;
      int v17 = a2 & 0x60 | 1;
    }

    else
    {
      int v17 = 0;
    }

    int v18 = *(_DWORD *)(a1 + 68);
    int v19 = v17 | (*(_DWORD *)(a1 + 64) == 0);
    int v20 = v17 | 0x80;
    if (!*(_DWORD *)(a1 + 64)) {
      int v20 = 0;
    }
    if (!v9) {
      int v19 = v20;
    }
    unint64_t v21 = v18 & v19 & 0x3FFLL;
    if (v21)
    {
      unint64_t v22 = *(dispatch_source_s **)(a1 + 72);
      if ((v18 & 0x10000000) == 0)
      {
        *(_DWORD *)(a1 + 68) = v18 | 0x10000000;
        if (v22) {
          dispatch_suspend(v22);
        }
        dispatch_time_t v23 = dispatch_time(0LL, 100000000LL);
        ++*(_DWORD *)(a1 + 104);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_10000A64C;
        block[3] = &unk_1000108E8;
        block[4] = a1;
        dispatch_after(v23, (dispatch_queue_t)qword_100014298, block);
        unint64_t v22 = *(dispatch_source_s **)(a1 + 72);
      }

      if (v22) {
        dispatch_source_merge_data(v22, v21);
      }
    }
  }

  size_t v24 = *(void *)(a1 + 8);
  if (v24 <= 0x400)
  {
    unint64_t v25 = (stat *)malloc(v24);
    if (!v25) {
      __assert_rtn("_path_node_update", "pathwatch.c", 874, "buf != NULL");
    }
  }

  else
  {
    unint64_t v25 = &v46;
  }

  sub_1000098D8(a1);
  sub_10000A684(0LL, 0, a1);
  bzero(v25, *(void *)(a1 + 8));
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v26 = 0LL;
    unint64_t v27 = 0LL;
    while (1)
    {
      size_t v28 = strlen((const char *)v25);
      size_t v29 = *(void *)(a1 + 8);
      if (v28 + 1 > v29) {
        __assert_rtn("_path_node_update", "pathwatch.c", 885, "(strlen(buf) + 1) <= pnode->plen");
      }
      strlcat((char *)v25, "/", v29);
      uint64_t v30 = *(void *)(a1 + 56);
      if (__CFADD__(v30, v26)) {
        goto LABEL_75;
      }
      int v31 = *(const char **)(v30 + 8 * v27);
      if (!v31) {
        __assert_rtn("_path_node_update", "pathwatch.c", 888, "pnode->pname[i] != NULL");
      }
      size_t v32 = strlen((const char *)v25);
      size_t v33 = strlen(v31);
      size_t v34 = *(void *)(a1 + 8);
      if (v33 + v32 > v34) {
        __assert_rtn("_path_node_update", "pathwatch.c", 889, "(strlen(buf) + strlen(pnode->pname[i])) <= pnode->plen");
      }
      strlcat((char *)v25, v31, v34);
      memset(&v43, 0, sizeof(v43));
      uint64_t v35 = (char *)v25;
      if ((v43.st_mode & 0xF000) != 0xA000) {
        goto LABEL_50;
      }
      sub_10000A684((const char *)v25, 1, a1);
LABEL_51:
      ++v27;
      v26 += 8LL;
    }

    uint64_t v35 = __str;
LABEL_50:
    sub_10000A684(v35, 0, a1);
    goto LABEL_51;
  }

LABEL_52:
  sub_100009954();
  if (v25 != &v46) {
    free(v25);
  }
}

uint64_t sub_10000A50C(const char *a1, int a2, uid_t a3, gid_t a4)
{
  int v8 = gL1CacheEnabled;
  gL1CacheEnabled = 0;
  *(_OWORD *)int v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v9 = getgroups(16, v17);
  if ((v9 & 0x80000000) != 0) {
    return 1LL;
  }
  uint64_t v10 = v9;
  __int128 v11 = getpwuid(a3);
  if (!v11)
  {
    gL1CacheEnabled = v8;
    return 1LL;
  }

  int v12 = initgroups(v11->pw_name, a4);
  gL1CacheEnabled = v8;
  if (v12 < 0) {
    return 1LL;
  }
  pthread_setugid_np(a3, a4);
  int v13 = a2 ? lstat(a1, &v16) : stat(a1, &v16);
  int v14 = v13;
  pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if (syscall(243, v10, v17, 0LL) < 0) {
    return 1LL;
  }
  if (!v14) {
    return 0LL;
  }
  if (*__error() == 13) {
    return 2LL;
  }
  return 1LL;
}

void sub_10000A64C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 68) &= ~0x10000000u;
  dispatch_resume(*(dispatch_object_t *)(v2 + 72));
  sub_10000980C(*(void *)(a1 + 32));
}

void sub_10000A684(const char *a1, int a2, uint64_t a3)
{
  if (a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = "/";
  }
  if (*v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = "/";
  }
  if (dword_100014058)
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = qword_100014060;
    unint64_t v9 = ~qword_100014060;
    uint64_t v10 = 8LL * dword_100014058;
    while (v7 <= v9)
    {
      uint64_t v11 = *(void *)(v8 + v7);
      if (v11 && *(_DWORD *)(v11 + 8) == a2 && !strcmp(v6, *(const char **)v11))
      {
        sub_10000A998(v11, a3);
        return;
      }

      v7 += 8LL;
      if (v10 == v7) {
        goto LABEL_14;
      }
    }

LABEL_36:
    __break(0x5513u);
    goto LABEL_37;
  }

LABEL_14:
  if (a2 == 1) {
    uint64_t v12 = 2129920LL;
  }
  else {
    uint64_t v12 = 0x8000LL;
  }
  uint64_t v13 = open_NOCANCEL(v6, v12);
  if ((v13 & 0x80000000) == 0)
  {
    uint64_t v14 = v13;
    dispatch_source_t v15 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v13,  0x7FuLL,  (dispatch_queue_t)qword_100014298);
    if (!v15)
    {
      close_NOCANCEL(v14);
      return;
    }

    stat v16 = v15;
    int v17 = calloc(1uLL, 0x48uLL);
    if (!v17) {
      __assert_rtn("_vnode_create", "pathwatch.c", 430, "vnode != NULL");
    }
    uint64_t v18 = (uint64_t)v17;
    v17[2] = a2;
    __int128 v19 = strdup(v6);
    *(void *)uint64_t v18 = v19;
    if (!v19) {
      __assert_rtn("_vnode_create", "pathwatch.c", 434, "vnode->path != NULL");
    }
    *(_DWORD *)(v18 + 12) = v14;
    *(void *)(v18 + 48) = v16;
    memset(&v26, 0, sizeof(v26));
    if (!fstat(v14, &v26))
    {
      *(timespec *)(v18 + 16) = v26.st_mtimespec;
      *(timespec *)(v18 + 32) = v26.st_ctimespec;
    }

    sub_10000A998(v18, a3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_10000AA9C;
    handler[3] = &unk_100010908;
    handler[4] = v18;
    dispatch_source_set_event_handler(v16, handler);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 0x40000000LL;
    v23[2] = sub_10000ABD0;
    v23[3] = &unk_100010928;
    int v24 = v14;
    dispatch_source_set_cancel_handler(v16, v23);
    if (dword_100014058)
    {
      size_t v20 = 8LL * (dword_100014058 + 1);
      unint64_t v21 = reallocf((void *)qword_100014060, v20);
    }

    else
    {
      size_t v20 = 8LL;
      unint64_t v21 = calloc(1uLL, 8uLL);
    }

    qword_100014060 = (uint64_t)v21;
    if (!v21) {
      __assert_rtn("_vnode_create", "pathwatch.c", 460, "_global.vnode != NULL");
    }
    uint64_t v22 = dword_100014058++;
    if (__CFADD__(v21, 8 * v22)) {
      goto LABEL_36;
    }
    if (v20 <= 8 * v22)
    {
LABEL_37:
      __break(1u);
      return;
    }

    v21[v22] = v18;
    dispatch_resume(v16);
  }

    __break(0x5513u);
  }

  return result;
}

unint64_t sub_10000A998(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v4)
  {
    unint64_t v5 = 0LL;
    unint64_t result = *(void *)(a1 + 64);
    unint64_t v7 = ~result;
    while (v5 <= v7)
    {
      if (*(void *)(result + v5) == a2) {
        return result;
      }
      v5 += 8LL;
      if (8 * v4 == v5)
      {
        uint64_t v8 = 0LL;
        while (v7 >= 8 * v8)
        {
          if (!*(void *)(result + 8 * v8))
          {
            uint64_t v11 = (void *)(result + 8 * v8);
            goto LABEL_17;
          }

          if (++v8 == v4)
          {
            size_t v9 = 8LL * (v4 + 1);
            unint64_t result = (unint64_t)reallocf((void *)result, v9);
            goto LABEL_12;
          }
        }

        goto LABEL_20;
      }
    }

    goto LABEL_20;
  }

  size_t v9 = 8LL;
  unint64_t result = (unint64_t)calloc(1uLL, 8uLL);
LABEL_12:
  *(void *)(a1 + 64) = result;
  if (!result) {
    __assert_rtn("_vnode_add_pnode", "pathwatch.c", 319, "vnode->path_node != NULL");
  }
  uint64_t v10 = *(unsigned int *)(a1 + 56);
  *(_DWORD *)(a1 + 56) = v10 + 1;
  if (__CFADD__(result, 8 * v10))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }

  if (v9 <= 8 * v10)
  {
LABEL_21:
    __break(1u);
    return result;
  }

  uint64_t v11 = (void *)(result + 8 * v10);
LABEL_17:
  *uint64_t v11 = a2;
  return result;
}

uint64_t sub_10000AA9C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    unint64_t data = *(void *)(v1 + 48);
    if (data)
    {
      unint64_t result = dispatch_source_testcancel(*(dispatch_source_t *)(v1 + 48));
      if (result) {
        return result;
      }
      unint64_t data = dispatch_source_get_data((dispatch_source_t)data);
    }

    memset(&v6, 0, sizeof(v6));
    unint64_t result = fstat(*(_DWORD *)(v1 + 12), &v6);
    if (!(_DWORD)result)
    {
      if (*(_OWORD *)(v1 + 16) != *(_OWORD *)&v6.st_mtimespec)
      {
        unint64_t data = data | 0x100;
        *(timespec *)(v1 + 16) = v6.st_mtimespec;
      }

      if (*(_OWORD *)(v1 + 32) != *(_OWORD *)&v6.st_ctimespec)
      {
        unint64_t data = data | 0x200;
        *(timespec *)(v1 + 32) = v6.st_ctimespec;
      }
    }

    if ((data & 1) != 0) {
      *(_DWORD *)(v1 + 8) = 2;
    }
    if (*(_DWORD *)(v1 + 56))
    {
      uint64_t v3 = 0LL;
      unint64_t v4 = 0LL;
      while (1)
      {
        uint64_t v5 = *(void *)(v1 + 64);
        if (__CFADD__(v5, v3)) {
          break;
        }
        unint64_t result = sub_100009F88(*(void *)(v5 + 8 * v4++), data, v1);
        v3 += 8LL;
      }

      __break(0x5513u);
    }
  }

  return result;
}

uint64_t sub_10000ABD0(uint64_t a1)
{
  return close_NOCANCEL(*(unsigned int *)(a1 + 32));
}

void sub_10000ABD8(id a1)
{
  qword_100014068 = 0LL;
  qword_100014070 = 0LL;
  if (realpath_DARWIN_EXTSN("/var/db/timezone/zoneinfo", __s))
  {
    qword_100014070 = strlen(__s);
    qword_100014068 = (uint64_t)strdup(__s);
    if (!qword_100014068) {
      qword_100014070 = 0LL;
    }
  }

uint64_t sub_10000AC68(uint64_t a1)
{
  return sub_100007274(*(void *)(*(void *)(a1 + 32) + 80LL), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
}

uint64_t sub_10000AC7C(uint64_t a1, uint64_t a2, const char *a3, _OWORD *a4, int a5)
{
  if (!a3) {
    return 6LL;
  }
  uint64_t result = os_set_str_ptr_find(&unk_100014190, a1);
  uint64_t v10 = 1LL;
  if (!result || qword_1000141A8 == result) {
    return v10;
  }
  if (!a2) {
    return 10LL;
  }
  if (!*(_WORD *)(a2 + 76))
  {
    if (a5) {
      __int16 v13 = a5;
    }
    else {
      __int16 v13 = 1023;
    }
    __int128 v14 = a4[1];
    v27[0] = *a4;
    v27[1] = v14;
    size_t v15 = sub_100009C74(a3, v27, 0, v13);
    if (v15)
    {
      size_t v16 = v15;
      *(void *)(v15 + 96) = *(void *)(a2 + 64);
      int v17 = calloc(1uLL, 0x10uLL);
      if (!v17) {
        __assert_rtn("service_open_path_private", "service.c", 195, "info != NULL");
      }
      uint64_t v18 = v17;
      *(_DWORD *)int v17 = 2;
      v17[1] = v16;
      if (!word_100014304)
      {
        __int16 v22 = 1;
        word_100014304 = 1;
        int v24 = malloc(8uLL);
        qword_100014290 = (uint64_t)v24;
LABEL_34:
        *int v24 = v18;
LABEL_35:
        *(_WORD *)(a2 + 76) = v22;
        unint64_t v25 = *(dispatch_source_s **)(v16 + 72);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000LL;
        handler[2] = sub_10000AF28;
        handler[3] = &unk_100010968;
        handler[4] = v16;
        dispatch_source_set_event_handler(v25, handler);
        dispatch_activate(*(dispatch_object_t *)(v16 + 72));
        return 0LL;
      }

      unint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t result = qword_100014290;
      while (v19 <= ~qword_100014290)
      {
        if (!*(void *)(qword_100014290 + 8 * v20))
        {
          *(void *)(qword_100014290 + 8 * v20) = v18;
          __int16 v22 = v20 + 1;
          goto LABEL_35;
        }

        ++v20;
        v19 += 8LL;
        if ((unsigned __int16)word_100014304 == v20)
        {
          size_t v21 = 8LL * (unsigned __int16)++word_100014304;
          uint64_t result = (uint64_t)realloc((void *)qword_100014290, v21);
          __int16 v22 = word_100014304;
          qword_100014290 = result;
          unint64_t v23 = 8LL * (unsigned __int16)word_100014304 - 8;
          if (word_100014304)
          {
            if (v23 > ~result) {
              goto LABEL_39;
            }
          }

          else
          {
            if (v23 <= ~result) {
              goto LABEL_39;
            }
            __int16 v22 = 0;
          }

          if (v21 > v23)
          {
            int v24 = (void *)(result + v23);
            goto LABEL_34;
          }

          goto LABEL_40;
        }
      }

      goto LABEL_39;
    }

    return 53LL;
  }

  uint64_t v11 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8LL * v11))
  {
    uint64_t v12 = *(void *)(qword_100014290 + 8 * v11);
    uint64_t v10 = 6LL;
    if (*(_DWORD *)v12 == 2)
    {
      else {
        return 6LL;
      }
    }

    return v10;
  }

LABEL_39:
  __break(0x5513u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_10000AF28(uint64_t a1)
{
  uint64_t v1 = os_set_64_ptr_find(&unk_1000141D0, *(void *)(*(void *)(a1 + 32) + 96LL));
  if (v1)
  {
    uint64_t v2 = v1 - qword_1000141E8;
    if (v2)
    {
      if ((*(_BYTE *)(v2 + 79) & 0xF) == 1)
      {
        uint64_t v3 = *(void *)(v2 + 48);
        if (v3)
        {
          uint64_t v4 = *(unsigned int *)(v3 + 52);
          if ((_DWORD)v4 != -1)
          {
            if (__CFADD__(qword_1000142E0, 4 * v4))
            {
              __break(0x5513u);
              return;
            }

            ++*(_DWORD *)(qword_1000142E0 + 4 * v4);
          }
        }
      }

      sub_100008CD0(v2, 0LL, 0LL);
    }
  }

uint64_t sub_10000AFB4(const char *a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = strncmp(a1, "com.apple.system.notify.service.", 0x20uLL);
  if (!(_DWORD)result)
  {
    if ((unint64_t)a1 < 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t result = strncmp(a1 + 32, "path:", 5uLL);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = (uint64_t)strchr(a1, 58);
      if (result)
      {
        if (result == -1) {
          goto LABEL_14;
        }
        unint64_t v7 = (const char *)(result + 1);
      }

      else
      {
        unint64_t v7 = 0LL;
      }

      uint64_t v8 = strchr(v7, 58);
      if (!v8)
      {
        int v10 = 0;
        goto LABEL_12;
      }

      size_t v9 = v8;
      uint64_t result = strtol(v7, 0LL, 0);
      if (v9 != (char *)-1LL)
      {
        int v10 = result;
        unint64_t v7 = v9 + 1;
LABEL_12:
        __int128 v11 = a3[1];
        v12[0] = *a3;
        v12[1] = v11;
        return sub_10000AC7C((uint64_t)a1, a2, v7, v12, v10);
      }
    }

uint64_t sub_10000B0A4(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 20);
  BOOL v2 = __OFSUB__(v1, 64);
  unsigned int v3 = v1 - 64;
  if (v2)
  {
    __break(0x5515u);
  }

  else
  {
    if (v3 > 8) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

_DWORD *sub_10000B100(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36) {
    sub_100007348();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000B140(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = a1[8];
    sub_100002CE8(a1[8]);
    uint64_t v4 = os_set_32_ptr_find(&unk_1000141F0, v3);
    if (v4) {
      uint64_t v5 = v4 - qword_100014208;
    }
    else {
      uint64_t v5 = 0LL;
    }
    *(_DWORD *)(v5 + 12) &= ~1u;
    for (uint64_t i = *(void *)v5; i; uint64_t i = *(void *)(i + 32))
    {
      sub_100009314(i, 0LL, v5);
      if ((*(_BYTE *)(v5 + 12) & 1) != 0) {
        break;
      }
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

uint64_t sub_10000B1FC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    int v2 = -300;
  }

  else
  {
    int v2 = -304;
  }

  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000B260(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36) {
    sub_100007388();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000B2A0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 24) {
    sub_1000073A8();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000B2E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  uint64_t v3 = result[8];
  uint64_t v4 = os_set_32_ptr_find(&unk_1000141F0, v3);
  if (v4) {
    __int128 v11 = (unsigned int *)(v4 - qword_100014208);
  }
  else {
    __int128 v11 = 0LL;
  }
  uint64_t v12 = *(void *)v11;
  if (*(void *)v11)
  {
    do
    {
      uint64_t v13 = *(void *)(v12 + 32);
      sub_100002D88(v12);
      uint64_t v12 = v13;
    }

    while (v13);
  }

  unsigned int v14 = v11[3];
  if ((v14 & 2) == 0) {
    goto LABEL_13;
  }
  if ((v14 & 4) != 0)
  {
    sub_1000070C4((FILE *)7, "do_mach_notify_dead_name freed port %x\n", v5, v6, v7, v8, v9, v10, v3);
LABEL_13:
    sub_100002EC4(v11);
    goto LABEL_14;
  }

  v11[3] = v14 | 4;
LABEL_14:
  uint64_t result = (_DWORD *)mach_port_deallocate(mach_task_self_, v3);
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_10000B3C8(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 20);
  BOOL v2 = __OFSUB__(v1, 1000);
  unsigned int v3 = v1 - 1000;
  if (v2)
  {
    __break(0x5515u);
  }

  else
  {
    if (v3 > 0x20) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_10000B424(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  uint64_t v4 = *(unsigned int *)(result + 32);
  __int128 v6 = *(_OWORD *)(result + 72);
  __int128 v18 = *(_OWORD *)(result + 56);
  __int128 v5 = v18;
  __int128 v19 = v6;
  pid_t pidp = -1;
  *(_DWORD *)(a2 + 36) = 0;
  ++qword_100014108;
  *(_OWORD *)atoken.val = v5;
  *(_OWORD *)&atoken.val[4] = v6;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  sub_1000070C4((FILE *)7, "__notify_server_check %d %d\n", v7, v8, v9, v10, v11, v12, pidp);
  uint64_t result = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)pidp << 32));
  if (result && qword_1000141E8 != result)
  {
    int v14 = *(_DWORD *)(*(void *)(result - qword_1000141E8 + 48) + 60LL);
    if (v14 == *(_DWORD *)(result - qword_1000141E8 + 72))
    {
      int v15 = 0;
    }

    else
    {
      *(_DWORD *)(result - qword_1000141E8 + 72) = v14;
      int v15 = 1;
    }

    int v13 = 0;
    *(_DWORD *)(a2 + 36) = v15;
  }

  else
  {
    int v13 = 2;
  }

  *(_DWORD *)(a2 + 40) = v13;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 44;
  return result;
}

uint64_t sub_10000B5B4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  uint64_t v4 = *(unsigned int *)(result + 32);
  __int128 v5 = *(_OWORD *)(result + 72);
  v14[0] = *(_OWORD *)(result + 56);
  v14[1] = v5;
  gid_t v16 = -1;
  uid_t v17 = -1;
  unsigned int v15 = -1;
  *(void *)(a2 + 36) = 0LL;
  sub_100002F50(v14, 0xFFFFFFFF, &v17, &v16, &v15, 0LL);
  xmmword_100014110 = (__int128)vaddq_s64((int64x2_t)xmmword_100014110, vdupq_n_s64(1uLL));
  sub_1000070C4((FILE *)7, "__notify_server_get_state %d %d\n", v6, v7, v8, v9, v10, v11, v15);
  uint64_t result = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v15 << 32));
  if (result && qword_1000141E8 != result)
  {
    uint64_t v13 = *(void *)(*(void *)(result - qword_1000141E8 + 48) + 16LL);
    *(void *)(a2 + 36) = 0LL;
    uint64_t result = os_set_64_ptr_find(&unk_1000141B0, v13);
    if (!result || qword_1000141C8 == result)
    {
      *(_DWORD *)(a2 + 44) = 1;
      __assert_rtn( "__notify_server_get_state",  "notify_proc.c",  1182,  "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
    }

    int v12 = 0;
    *(void *)(a2 + 36) = *(void *)(result - qword_1000141C8 + 24);
  }

  else
  {
    int v12 = 50;
  }

  *(_DWORD *)(a2 + 44) = v12;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

uint64_t sub_10000B750(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  uint64_t v4 = *(unsigned int *)(result + 32);
  __int128 v5 = *(_OWORD *)(result + 72);
  v16[0] = *(_OWORD *)(result + 56);
  v16[1] = v5;
  unsigned int v17 = -1;
  sub_100002F50(v16, 0xFFFFFFFF, 0LL, 0LL, &v17, 0LL);
  ++qword_1000140E8;
  sub_1000070C4((FILE *)7, "__notify_server_suspend %d %d\n", v6, v7, v8, v9, v10, v11, v17);
  uint64_t result = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v17 << 32));
  if (result && (uint64_t v12 = qword_1000141E8, qword_1000141E8 != result))
  {
    uint64_t v14 = result - qword_1000141E8;
    *(_BYTE *)(result - qword_1000141E8 + 79) |= 0x20u;
    int v15 = *(unsigned __int8 *)(result - v12 + 78);
    int v13 = 0;
    if (v15 != 255) {
      *(_BYTE *)(v14 + 78) = v15 + 1;
    }
  }

  else
  {
    int v13 = 50;
  }

  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = v13;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

void sub_10000B89C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v14[0] = *(_OWORD *)(a1 + 56);
  v14[1] = v5;
  unsigned int v15 = -1;
  sub_100002F50(v14, 0xFFFFFFFF, 0LL, 0LL, &v15, 0LL);
  ++qword_1000140F0;
  sub_1000070C4((FILE *)7, "__notify_server_resume %d %d\n", v6, v7, v8, v9, v10, v11, v15);
  uint64_t v12 = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v15 << 32));
  if (v12 && qword_1000141E8 != v12)
  {
    sub_100009314(v12 - qword_1000141E8, 0LL, 0LL);
    int v13 = 0;
  }

  else
  {
    int v13 = 50;
  }

  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = v13;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
}

FILE *sub_10000B9CC(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(&result->_bf._size + 1) || result->_lbfsize <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  uint64_t size = result->_bf._size;
  __int128 v5 = *(_OWORD *)&result->_seek;
  *(_OWORD *)v20.val = *(_OWORD *)&result->_close;
  *(_OWORD *)&v20.val[4] = v5;
  *(_OWORD *)atoken.val = *(_OWORD *)v20.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uid_t v6 = audit_token_to_euid(&atoken);
  *(void *)&xmmword_1000140F8 = xmmword_1000140F8 + 1;
  sub_1000070C4((FILE *)7, "__notify_server_suspend_pid %d\n", v7, v8, v9, v10, v11, v12, size);
  if (v6)
  {
    audit_token_t atoken = v20;
    audit_token_to_pid(&atoken);
    uint64_t result = sub_1000070C4( (FILE *)4,  "__notify_server_suspend_pid %d permission denied for caller %d \n",  v13,  v14,  v15,  v16,  v17,  v18,  size);
  }

  else
  {
    uint64_t result = (FILE *)os_set_32_ptr_find(&unk_100014210, size);
    if (result)
    {
      if ((FILE *)qword_100014228 != result) {
        *(_DWORD *)((char *)&result->_file - qword_100014228 + 2) |= 1u;
      }
    }
  }

  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

void sub_10000BB1C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v23.val = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v23.val[4] = v5;
  *(_OWORD *)atoken.val = *(_OWORD *)v23.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uid_t v6 = audit_token_to_euid(&atoken);
  ++*((void *)&xmmword_1000140F8 + 1);
  sub_1000070C4((FILE *)7, "__notify_server_resume_pid %d\n", v7, v8, v9, v10, v11, v12, v4);
  if (v6)
  {
    audit_token_t atoken = v23;
    audit_token_to_pid(&atoken);
    sub_1000070C4( (FILE *)4,  "__notify_server_resume_pid %d permission denied for caller %d \n",  v13,  v14,  v15,  v16,  v17,  v18,  v4);
  }

  else
  {
    uint64_t v19 = os_set_32_ptr_find(&unk_100014210, v4);
    if (v19)
    {
      uint64_t v20 = v19 - qword_100014228;
      if (v19 != qword_100014228)
      {
        *(_DWORD *)(v20 + 20) &= ~1u;
        for (uint64_t i = *(void *)v20; i; uint64_t i = *(void *)(i + 16))
          sub_100009314(i, v20, 0LL);
      }
    }
  }

  *(_DWORD *)(a2 + 32) = 0;
}

const char *sub_10000BC88(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  uint64_t result = (const char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *(_DWORD *)&v3[v6 + 40];
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (const char *)sub_100003138(v3 + 40, (void *)(a2 + 36), (_DWORD *)(a2 + 44), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000BDC0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 44) && *(_DWORD *)(result + 48) > 0x1Fu)
    {
      uint64_t v4 = *(void *)(result + 32);
      int v5 = *(_DWORD *)(result + 40);
      __int128 v6 = *(_OWORD *)(result + 80);
      __int128 v24 = *(_OWORD *)(result + 64);
      __int128 v25 = v6;
      int v20 = -1;
      int v21 = -1;
      int v19 = -1;
      uint64_t result = os_set_64_ptr_find(&unk_1000141B0, v4);
      if (result)
      {
        uint64_t v7 = result - qword_1000141C8;
        if (result != qword_1000141C8)
        {
          ++*(_DWORD *)(v7 + 64);
          __int128 v22 = v24;
          __int128 v23 = v25;
          sub_100002F50(&v22, 0xFFFFFFFF, (uid_t *)&v21, (gid_t *)&v20, &v19, 0LL);
          if (v5)
          {
            if (v21)
            {
              __int128 v22 = v24;
              __int128 v23 = v25;
            }
          }

          size_t v8 = *(const char **)(v7 + 8);
          __int128 v22 = v24;
          __int128 v23 = v25;
          uint64_t result = sub_100003034(v8, (uint64_t)&v22);
          if ((_DWORD)result)
          {
            uint64_t result = sub_100008AFC(*(const char **)(v7 + 8), v21, v20, 2);
            if ((_DWORD)result)
            {
              if ((_DWORD)result == 10) {
                __assert_rtn("__notify_server_post_3", "notify_proc.c", 567, "status != NOTIFY_STATUS_NULL_INPUT");
              }
            }

            else
            {
              *(void *)&xmmword_100014078 = xmmword_100014078 + 1;
              ++qword_100014088;
              sub_1000070C4( (FILE *)7,  "__notify_server_post %s %d by nameid: %llu \n",  v9,  v10,  v11,  v12,  v13,  v14,  *(void *)(v7 + 8));
              int v16 = v20;
              int v15 = v21;
              uint64_t result = os_set_64_ptr_find(&unk_1000141B0, v4);
              if (result && qword_1000141C8 != result)
              {
                uint64_t v17 = *(unsigned int *)(result - qword_1000141C8 + 52);
                if ((_DWORD)v17 != -1)
                {
                  if (__CFADD__(qword_1000142E0, 4 * v17))
                  {
                    __break(0x5513u);
                    return result;
                  }

                  ++*(_DWORD *)(qword_1000142E0 + 4 * v17);
                }

                uint64_t v18 = os_set_64_ptr_find(&unk_1000141B0, v4);
                if (!v18
                  || qword_1000141C8 == v18
                  || (uint64_t result = sub_1000090AC(v18 - qword_1000141C8, v15, v16), (_DWORD)result))
                {
                  __assert_rtn("__notify_server_post_3", "notify_proc.c", 578, "status == NOTIFY_STATUS_OK");
                }
              }
            }
          }
        }
      }

      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000C050(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0) {
    goto LABEL_18;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  unsigned int v5 = *(_DWORD *)(a1 + 36);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(a1, v4))
  {
    __break(0x5513u);
    return;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  if (memchr((const void *)(a1 + 40), 0, v8))
  {
    uint64_t v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + a1;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      int v11 = *(_DWORD *)(a1 + v6 + 40);
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      sub_100003314((const char *)(a1 + 40), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

const char *sub_10000C168(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  uint64_t result = (const char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (const char *)sub_100003364(v3 + 40, v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_10000C280(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  uint64_t result = (const char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (const char *)sub_100003754( v3 + 40,  v11,  (_DWORD *)(a2 + 36),  (_DWORD *)(a2 + 40),  (void *)(a2 + 44),  (_DWORD *)(a2 + 52),  v13);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 56;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_10000C3C0(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  uint64_t result = (const char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      int v12 = *(_DWORD *)&v3[v6 + 44];
      __int128 v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (const char *)sub_100003A04(v3 + 40, v11, v12, v14);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000C4DC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    uint64_t v4 = result;
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    uint64_t v5 = *(unsigned int *)(result + 4);
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }

    unsigned int v6 = *(_DWORD *)(result + 52);
    if (v6 <= 0x200)
    {
      int v3 = -304;
      unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
      if ((_DWORD)v5 != v7 + 60) {
        goto LABEL_3;
      }
      if (__CFADD__(result, v5))
      {
        __break(0x5513u);
        return result;
      }

      else {
        size_t v8 = v5 - 56;
      }
      uint64_t result = (uint64_t)memchr((const void *)(result + 56), 0, v8);
      if (result)
      {
        uint64_t v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
        if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
        {
          unsigned int v10 = *(_DWORD *)(v4 + v7 + 56);
          uint64_t v11 = *(unsigned int *)(v4 + 28);
          __int128 v12 = *(_OWORD *)(v9 + 36);
          v13[0] = *(_OWORD *)(v9 + 20);
          v13[1] = v12;
          uint64_t result = sub_100003B64((const char *)(v4 + 56), v10, v11, v13);
          *(_DWORD *)(a2 + 32) = 0;
          return result;
        }

        int v3 = -309;
        goto LABEL_3;
      }
    }
  }

  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000C628(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    uint64_t v4 = result;
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    uint64_t v5 = *(unsigned int *)(result + 4);
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }

    unsigned int v6 = *(_DWORD *)(result + 52);
    if (v6 <= 0x200)
    {
      int v3 = -304;
      unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
      if ((_DWORD)v5 != v7 + 60) {
        goto LABEL_3;
      }
      if (__CFADD__(result, v5))
      {
        __break(0x5513u);
        return result;
      }

      else {
        size_t v8 = v5 - 56;
      }
      uint64_t result = (uint64_t)memchr((const void *)(result + 56), 0, v8);
      if (result)
      {
        uint64_t v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
        if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
        {
          unsigned int v10 = *(_DWORD *)(v4 + v7 + 56);
          uint64_t v11 = *(unsigned int *)(v4 + 28);
          __int128 v12 = *(_OWORD *)(v9 + 36);
          v13[0] = *(_OWORD *)(v9 + 20);
          v13[1] = v12;
          uint64_t result = sub_100003CFC((const char *)(v4 + 56), v10, v11, v13);
          *(_DWORD *)(a2 + 32) = 0;
          return result;
        }

        int v3 = -309;
        goto LABEL_3;
      }
    }
  }

  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000C774(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = *(unsigned int *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v13[0] = *(_OWORD *)(a1 + 56);
  v13[1] = v5;
  unsigned int v14 = -1;
  uid_t v15 = -1;
  sub_100002F50(v13, 0xFFFFFFFF, &v15, 0LL, &v14, 0LL);
  ++*((void *)&xmmword_1000140D8 + 1);
  sub_1000070C4((FILE *)7, "__notify_server_cancel %d %d\n", v6, v7, v8, v9, v10, v11, v14);
  uint64_t v12 = os_set_64_ptr_find(&unk_1000141D0, v4 | ((unint64_t)v14 << 32));
  if (v12)
  {
    if (qword_1000141E8 != v12) {
      sub_100002D88(v12 - qword_1000141E8);
    }
  }

  *(_DWORD *)(a2 + 32) = 0;
}

uint64_t sub_10000C878(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  uint64_t v4 = *(void *)(result + 32);
  __int128 v5 = *(_OWORD *)(result + 76);
  v13[0] = *(_OWORD *)(result + 60);
  v13[1] = v5;
  gid_t v14 = -1;
  uid_t v15 = -1;
  *(void *)(a2 + 36) = 0LL;
  sub_100002F50(v13, 0xFFFFFFFF, &v15, &v14, 0LL, 0LL);
  sub_1000070C4((FILE *)7, "__notify_server_get_state_2 %llu\n", v6, v7, v8, v9, v10, v11, v4);
  *(void *)(a2 + 36) = 0LL;
  uint64_t result = os_set_64_ptr_find(&unk_1000141B0, v4);
  if (result && qword_1000141C8 != result)
  {
    int v12 = 0;
    *(void *)(a2 + 36) = *(void *)(result - qword_1000141C8 + 24);
  }

  else
  {
    int v12 = 1;
  }

  *(_DWORD *)(a2 + 44) = v12;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

FILE *sub_10000C998(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (!*(&result->_bf._size + 1) && result->_lbfsize > 0x1Fu)
  {
    uint64_t size = result->_bf._size;
    __int128 v5 = *(_OWORD *)&result->_seek;
    v17[0] = *(_OWORD *)&result->_close;
    v17[1] = v5;
    gid_t v19 = -1;
    uid_t v20 = -1;
    *(void *)(a2 + 36) = 0LL;
    unsigned int v18 = -1;
    *(void *)(a2 + 44) = 0LL;
    sub_100002F50(v17, 0xFFFFFFFF, &v20, &v19, &v18, 0LL);
    *(void *)&xmmword_100014110 = xmmword_100014110 + 1;
    ++qword_100014128;
    uint64_t v6 = os_set_64_ptr_find(&unk_1000141D0, size | ((unint64_t)v18 << 32));
    if (v6 && qword_1000141E8 != v6)
    {
      uint64_t v13 = v6 - qword_1000141E8;
      uint64_t v14 = *(void *)(*(void *)(v6 - qword_1000141E8 + 48) + 16LL);
      *(void *)(a2 + 36) = 0LL;
      uint64_t v15 = os_set_64_ptr_find(&unk_1000141B0, v14);
      if (!v15 || qword_1000141C8 == v15)
      {
        *(_DWORD *)(a2 + 52) = 1;
        __assert_rtn( "__notify_server_get_state_3",  "notify_proc.c",  1243,  "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
      }

      *(void *)(a2 + 36) = *(void *)(v15 - qword_1000141C8 + 24);
      *(_DWORD *)(a2 + 52) = 0;
      uint64_t v16 = *(void *)(*(void *)(v13 + 48) + 16LL);
      *(void *)(a2 + 44) = v16;
      if (v16 != -1)
      {
        uint64_t result = sub_1000070C4((FILE *)7, "__notify_server_get_state_3 %d %d [%llu]\n", v7, v8, v9, v10, v11, v12, v18);
        goto LABEL_13;
      }
    }

    else
    {
      *(_DWORD *)(a2 + 52) = 50;
      *(void *)(a2 + 44) = -1LL;
    }

    uint64_t result = sub_1000070C4((FILE *)7, "__notify_server_get_state_3 %d %d\n", v7, v8, v9, v10, v11, v12, v18);
LABEL_13:
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 56;
    return result;
  }

  int v3 = -309;
LABEL_7:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_10000CB78(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 52)
  {
    int v3 = -304;
  }

  else
  {
    if (!HIDWORD(result->_cookie) && LODWORD(result->_close) > 0x1F)
    {
      uint64_t v5 = *(void *)&result->_bf._size;
      uint64_t v4 = *(void *)&result->_lbfsize;
      int cookie = (int)result->_cookie;
      __sbuf ub = result->_ub;
      v8[0] = *(_OWORD *)&result->_seek;
      v8[1] = ub;
      uint64_t result = sub_100004248(v5, v4, cookie, v8, 0);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_10000CC14(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 48)
  {
    int v3 = -304;
  }

  else
  {
    if (!LODWORD(result->_cookie) && HIDWORD(result->_cookie) > 0x1F)
    {
      unsigned int size = result->_bf._size;
      uint64_t v5 = *(void *)(&result->_bf._size + 1);
      int v6 = *(&result->_lbfsize + 1);
      __int128 v7 = *(_OWORD *)((char *)&result->_write + 4);
      v8[0] = *(_OWORD *)((char *)&result->_read + 4);
      v8[1] = v7;
      uint64_t result = sub_100004008(size, v5, (void *)(a2 + 36), (int *)(a2 + 44), v6, v8, 0);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000CCD4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 64)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 56)))
    {
      if (!*(_DWORD *)(a1 + 64) && *(_DWORD *)(a1 + 68) > 0x1Fu)
      {
        int v6 = *(const char **)(a1 + 28);
        uint64_t v7 = *(unsigned int *)(a1 + 52);
        int v8 = *(_DWORD *)(a1 + 60);
        __int128 v9 = *(_OWORD *)(a1 + 100);
        v10[0] = *(_OWORD *)(a1 + 84);
        v10[1] = v9;
        sub_1000043FC(v7, v6, v4, v8, v10);
        *(_DWORD *)(a2 + 32) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_10000CDB4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 4);
  unsigned int v7 = *(_DWORD *)(a1 + 68);
  if (v7 > 0x200)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }

  int v3 = -304;
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v6 != v8 + 112) {
    goto LABEL_3;
  }
  uint64_t v9 = a1 + v8;
  int v10 = *(_DWORD *)(a1 + 52);
  if (v10 != *(_DWORD *)(v9 + 104))
  {
LABEL_23:
    int v3 = -300;
    goto LABEL_3;
  }

  if (__CFADD__(a1, v6))
  {
    __break(0x5513u);
    return;
  }

  else {
    size_t v11 = v6 - 72;
  }
  uint64_t v12 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v12 && *(_DWORD *)(v12 + 4) > 0x1Fu)
  {
    uint64_t v13 = *(unsigned int *)(v9 + 72);
    int v14 = *(_DWORD *)(v9 + 76);
    int v15 = *(_DWORD *)(a1 + 28);
    int v16 = *(_DWORD *)(v9 + 80);
    int v17 = *(_DWORD *)(v9 + 84);
    uint64_t v18 = *(void *)(v9 + 88);
    gid_t v19 = *(const char **)(a1 + 40);
    unint64_t v20 = *(void *)(v9 + 96);
    int v21 = *(_DWORD *)(v9 + 108);
    __int128 v22 = *(_OWORD *)(v12 + 36);
    v23[0] = *(_OWORD *)(v12 + 20);
    v23[1] = v22;
    sub_10000452C( (uint64_t *)(a1 + 72),  v13,  v14,  v15,  v16,  v17,  v18,  v20,  v19,  v10,  v21,  (int *)(a2 + 36),  (void *)(a2 + 40),  (int *)(a2 + 48),  v23);
    *(_DWORD *)(a2 + 32) = 0;
    mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
    *(void *)(a1 + 40) = 0LL;
    *(_DWORD *)(a1 + 52) = 0;
    NDR_record_t v4 = NDR_record;
    if (!*(_DWORD *)(a2 + 32))
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 52;
      return;
    }

    goto LABEL_4;
  }

  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  NDR_record_t v4 = NDR_record;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
}

uint64_t sub_10000CF88(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v4 = -304;
  }

  else
  {
    int v3 = *(_DWORD *)(result + 24);
    result += 24LL;
    if (!v3 && *(_DWORD *)(result + 4) > 0x1Fu)
    {
      __int128 v5 = *(_OWORD *)(result + 36);
      v6[0] = *(_OWORD *)(result + 20);
      v6[1] = v5;
      uint64_t result = sub_100004A4C((_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44), v6);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }

    int v4 = -309;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000D038(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      uint64_t v3 = result + 40;
      if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) < 0x20u)
      {
        int v4 = -309;
      }

      else
      {
        uint64_t v5 = *(unsigned int *)(result + 28);
        __int128 v6 = *(_OWORD *)(v3 + 36);
        v7[0] = *(_OWORD *)(v3 + 20);
        v7[1] = v6;
        uint64_t result = sub_100004AF4(v5, v7);
        int v4 = 0;
      }
    }

    else
    {
      int v4 = -300;
    }
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

char *sub_10000D0EC(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *((_DWORD *)result + 1) != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  int v3 = *((_DWORD *)result + 6);
  result += 24;
  if (v3 || *((_DWORD *)result + 1) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(void *)(a2 + 32) = 0x10000000000000LL;
  __int128 v6 = *(_OWORD *)(result + 36);
  __int128 v31 = *(_OWORD *)(result + 20);
  __int128 v5 = v31;
  __int128 v32 = v6;
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 28) = 0;
  *(_OWORD *)atoken.val = v5;
  *(_OWORD *)&atoken.val[4] = v6;
  uint64_t v7 = audit_token_to_pid(&atoken);
  sub_1000070C4((FILE *)7, "__notify_generate_common_port %d\n", v8, v9, v10, v11, v12, v13, v7);
  uint64_t v14 = os_set_32_ptr_find(&unk_100014210, v7);
  __int128 v23 = (unsigned int *)v22[3];
  if (v23)
  {
    uint64_t v24 = *(void *)v23;
    if (*(void *)v23)
    {
      do
      {
        uint64_t v25 = *(void *)(v24 + 16);
        sub_100002D88(v24);
        uint64_t v24 = v25;
      }

      while (v25);
      __int128 v23 = (unsigned int *)v22[3];
    }

    sub_1000036D0(v23, v15, v16, v17, v18, v19, v20, v21);
    v22[3] = 0LL;
  }

  *(void *)&atoken.val[4] = 0LL;
  *(_OWORD *)atoken.val = xmmword_10000E250;
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u)) {
    __assert_rtn("__notify_generate_common_port", "notify_proc.c", 1754, "kstatus == KERN_SUCCESS");
  }
  mach_port_name_t v26 = name;
  uint64_t result = (char *)calloc(1uLL, 0x10uLL);
  if (result)
  {
    unint64_t v27 = result;
    ++dword_100014278;
    *(void *)uint64_t result = 0LL;
    *((_DWORD *)result + 2) = v26;
    *((_DWORD *)result + 3) = 2;
    os_set_32_ptr_insert(&unk_1000141F0, result + 8);
    uint64_t result = (char *)sub_100002CE8(v26);
    v22[3] = (uint64_t)v27;
    mach_port_name_t v28 = name;
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    *(_DWORD *)(a2 + 28) = v28;
  }

  else
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
    __break(1u);
  }

  return result;
}

const char *sub_10000D368(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  uint64_t result = (const char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (const char *)sub_100004880(v3 + 40, v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_10000D480(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  uint64_t result = (const char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      *(void *)(a2 + 32) = 0x10000000000000LL;
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (const char *)sub_100004BE8(v3 + 40, v11, (_DWORD *)(a2 + 48), (mach_port_name_t *)(a2 + 28), v13);
      *(NDR_record_t *)(a2 + 40) = NDR_record;
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 52;
      *(_DWORD *)(a2 + 24) = 1;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000D5D0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v4 = -304;
  }

  else
  {
    int v3 = *(_DWORD *)(result + 24);
    result += 24LL;
    if (!v3 && *(_DWORD *)(result + 4) > 0x1Fu)
    {
      __int128 v5 = *(_OWORD *)(result + 36);
      v6[0] = *(_OWORD *)(result + 20);
      v6[1] = v5;
      uint64_t result = sub_100004A4C((_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44), v6);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }

    int v4 = -309;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000D680(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0) {
    goto LABEL_18;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  unsigned int v5 = *(_DWORD *)(a1 + 36);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if (__CFADD__(a1, v4))
  {
    __break(0x5513u);
    return;
  }

  size_t v8 = v4 >= 0x228 ? 512LL : v4 - 40;
  if (memchr((const void *)(a1 + 40), 0, v8))
  {
    uint64_t v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + a1;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      int v11 = *(_DWORD *)(a1 + v6 + 40);
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      sub_100004D04((const char *)(a1 + 40), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return;
    }

    int v10 = -309;
  }

  else
  {
LABEL_18:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_10000D798(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 4);
  unsigned int v7 = *(_DWORD *)(a1 + 68);
  if (v7 > 0x200)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }

  int v3 = -304;
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v6 != v8 + 112) {
    goto LABEL_3;
  }
  uint64_t v9 = a1 + v8;
  int v10 = *(_DWORD *)(a1 + 52);
  if (v10 != *(_DWORD *)(v9 + 104))
  {
LABEL_23:
    int v3 = -300;
    goto LABEL_3;
  }

  if (__CFADD__(a1, v6))
  {
    __break(0x5513u);
    return;
  }

  else {
    size_t v11 = v6 - 72;
  }
  uint64_t v12 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v12 && *(_DWORD *)(v12 + 4) > 0x1Fu)
  {
    uint64_t v13 = *(unsigned int *)(v9 + 72);
    int v14 = *(_DWORD *)(v9 + 76);
    int v15 = *(_DWORD *)(a1 + 28);
    int v16 = *(_DWORD *)(v9 + 80);
    int v17 = *(_DWORD *)(v9 + 84);
    uint64_t v18 = *(void *)(v9 + 88);
    uint64_t v19 = *(const char **)(a1 + 40);
    unint64_t v20 = *(void *)(v9 + 96);
    int v21 = *(_DWORD *)(v9 + 108);
    __int128 v22 = *(_OWORD *)(v12 + 36);
    v23[0] = *(_OWORD *)(v12 + 20);
    v23[1] = v22;
    sub_100004D98( (uint64_t *)(a1 + 72),  v13,  v14,  v15,  v16,  v17,  v18,  v20,  v19,  v10,  v21,  (int *)(a2 + 36),  (void *)(a2 + 40),  (int *)(a2 + 48),  v23);
    *(_DWORD *)(a2 + 32) = 0;
    mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
    *(void *)(a1 + 40) = 0LL;
    *(_DWORD *)(a1 + 52) = 0;
    NDR_record_t v4 = NDR_record;
    if (!*(_DWORD *)(a2 + 32))
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 52;
      return;
    }

    goto LABEL_4;
  }

  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  NDR_record_t v4 = NDR_record;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
}

FILE *sub_10000D96C(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 52)
  {
    int v3 = -304;
  }

  else
  {
    if (!HIDWORD(result->_cookie) && LODWORD(result->_close) > 0x1F)
    {
      uint64_t v5 = *(void *)&result->_bf._size;
      uint64_t v4 = *(void *)&result->_lbfsize;
      int cookie = (int)result->_cookie;
      __sbuf ub = result->_ub;
      v8[0] = *(_OWORD *)&result->_seek;
      v8[1] = ub;
      uint64_t result = sub_100004248(v5, v4, cookie, v8, 1);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_10000DA08(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 48)
  {
    int v3 = -304;
  }

  else
  {
    if (!LODWORD(result->_cookie) && HIDWORD(result->_cookie) > 0x1F)
    {
      unsigned int size = result->_bf._size;
      uint64_t v5 = *(void *)(&result->_bf._size + 1);
      int v6 = *(&result->_lbfsize + 1);
      __int128 v7 = *(_OWORD *)((char *)&result->_write + 4);
      v8[0] = *(_OWORD *)((char *)&result->_read + 4);
      v8[1] = v7;
      uint64_t result = sub_100004008(size, v5, (void *)(a2 + 36), (int *)(a2 + 44), v6, v8, 1);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}