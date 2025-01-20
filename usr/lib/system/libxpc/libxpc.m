xpc_object_t xpc_string_create(const char *string)
{
  xpc_object_t result;
  xpc_object_t v2;
  size_t v3;
  result = _xpc_try_strdup(string);
  if (result)
  {
    v2 = result;
    v3 = strlen((const char *)result);
    return (xpc_object_t)_xpc_string_create((uint64_t)v2, v3);
  }

  return result;
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  uint64_t v3 = _xpc_connection_create(name == 0LL, (char *)name);
  mach_port_context_t v4 = v3;
  if (name)
  {
    *(void *)&__int128 v5 = -1LL;
    *((void *)&v5 + 1) = -1LL;
    *(_OWORD *)(v3 + 120) = v5;
    *(_OWORD *)(v3 + 104) = v5;
    *(_DWORD *)(v3 + 124) = 0;
    *(_DWORD *)(v3 + 88) = 0;
  }

  else
  {
    *(_WORD *)(v3 + 224) |= 8u;
    self_audit_token = (_OWORD *)_xpc_get_self_audit_token();
    __int128 v7 = self_audit_token[1];
    *(_OWORD *)(v4 + 104) = *self_audit_token;
    *(_OWORD *)(v4 + 120) = v7;
    *(_DWORD *)(v4 + 88) = 0;
    int v8 = _xpc_mach_port_allocate(0x203Bu, 0x10u, v4);
    *(_DWORD *)(v4 + 68) = v8;
    *(_DWORD *)(v4 + 76) = v8;
  }

  return (xpc_connection_t)v4;
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  if (((unint64_t)object & 0x8000000000000000LL) == 0)
  {
    v1 = *(__objc2_class **)object;
    if (*(void *)object >= (unint64_t)&OBJC_CLASS___OS_xpc_object)
    {
      BOOL v2 = v1 >= &OBJC_CLASS___OS_xpc_session;
      BOOL v3 = v1 == &OBJC_CLASS___OS_xpc_session;
    }

    else
    {
      BOOL v2 = 1;
      BOOL v3 = 0;
    }

    if (!v3 && v2) {
      return object;
    }
    else {
      return (xpc_object_t)_os_object_retain();
    }
  }

  return object;
}

uint64_t xpc_pipe_simpleroutine(uint64_t a1, void *a2)
{
  return _xpc_pipe_simpleroutine(a1, 0, a2, 0, 0);
}

size_t xpc_hash(xpc_object_t object)
{
  if (((unint64_t)object & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = *MEMORY[0x189616658];
    unint64_t v4 = v3 ^ (unint64_t)object;
    do
    {
      if ((v4 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v2)) {
        break;
      }
      ++v2;
    }

    while (v2 != 7);
    unint64_t v5 = v2 | v4;
    uint64_t v6 = v2 & 7;
    int v7 = (v5 >> 55) + 8;
    if (v6 == 7) {
      LODWORD(v6) = v7;
    }
    if ((_DWORD)v6 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v6 != 13)
      {
        v13 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v13);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v9 = *(void *)object;
    if (*(void *)object >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v9 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*(void *)object & 7LL) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v9 - (void)&OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(object);
    }
  }

  return (*((uint64_t (**)(xpc_object_t))extension_vtable + 4))(object);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  unint64_t v4 = (os_log_s *)_activity_log__log;
  unint64_t v5 = &_xpc_activity_check_in;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)activity + 3);
    int v7 = "dict";
    *(_DWORD *)buf = 136446722;
    if (criteria == &_xpc_activity_check_in) {
      int v7 = "check-in";
    }
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    xpc_activity_t v13 = activity;
    __int16 v14 = 2082;
    v15 = v7;
    _os_log_impl( &dword_180150000,  v4,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria: %{public}s (%p), %{public}s",  buf,  0x20u);
  }

  if (criteria != &_xpc_activity_check_in)
  {
    unint64_t v5 = (__objc2_class **)xpc_copy(criteria);
    _xpc_activity_normalize_critiera(v5);
  }

  xpc_retain(activity);
  int v8 = (dispatch_queue_s *)*((void *)activity + 5);
  v9[0] = MEMORY[0x1895FED80];
  v9[1] = 0x40000000LL;
  v9[2] = __xpc_activity_set_criteria_block_invoke;
  v9[3] = &__block_descriptor_tmp_74_0;
  v9[4] = activity;
  v9[5] = v5;
  dispatch_async(v8, v9);
}

void xpc_release(xpc_object_t object)
{
  if (((unint64_t)object & 0x8000000000000000LL) == 0)
  {
    v1 = *(__objc2_class **)object;
    if (*(void *)object >= (unint64_t)&OBJC_CLASS___OS_xpc_object)
    {
      BOOL v2 = v1 >= &OBJC_CLASS___OS_xpc_session;
      BOOL v3 = v1 == &OBJC_CLASS___OS_xpc_session;
    }

    else
    {
      BOOL v2 = 1;
      BOOL v3 = 0;
    }

    if (!v3 && v2)
    {
    }

    else if (v1 == &OBJC_CLASS___OS_xpc_session {
           || v1 == &OBJC_CLASS___OS_xpc_listener
    }
           || v1 == &OBJC_CLASS___OS_xpc_event_publisher
           || v1 == &OBJC_CLASS___OS_xpc_connection
           || v1 == &OBJC_CLASS___OS_xpc_service)
    {
      _os_object_release();
    }

    else
    {
      _os_object_release_without_xref_dispose();
    }
  }
}

  ;
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return xpc_activity_set_state_with_completion_status((uint64_t)activity, state, 0LL);
}

uint64_t _xpc_mach_message_request_init(uint64_t result, int a2, uint64_t a3, int a4, int a5)
{
  if (a4) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  if (a5) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(_DWORD *)result = a2;
  *(_DWORD *)(result + 4) = 0;
  *(void *)(result + 8) = a3;
  *(_BYTE *)(result + 16) = v6 | v5;
  return result;
}

uint64_t _xpc_message_request_get_transport(uint64_t a1)
{
  return *(_BYTE *)(a1 + 16) & 1;
}

uint64_t _xpc_message_request_get_voucher(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _xpc_message_request_extract_voucher(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0LL;
  return v1;
}

uint64_t _xpc_message_request_debug(void *a1, char *__str, size_t __size)
{
  return snprintf( __str,  __size,  ", transport = %d, dest port = 0x%x, dest msg id = 0x%llx, transaction = %d, voucher = %p",  a1[2] & 1,  *(_DWORD *)a1,  *a1,  (*((unsigned __int8 *)a1 + 16) >> 1) & 1,  (const void *)a1[1]);
}

uint64_t _xpc_message_request_get_transaction(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
}

uint64_t _xpc_message_request_set_transaction(uint64_t result, int a2)
{
  if (a2) {
    char v2 = 2;
  }
  else {
    char v2 = 0;
  }
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 0xFD | v2;
  return result;
}

BOOL _xpc_message_request_expects_reply(void *a1)
{
  return *a1 != 0LL;
}

void _xpc_mach_message_request_handoff_reply(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if ((*(_BYTE *)(a1 + 16) & 1) != 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if ((*(_BYTE *)(a1 + 16) & 4) == 0 || (*(_DWORD *)a1 ? (BOOL v3 = *(_DWORD *)a1 == -1) : (BOOL v3 = 1), v3)) {
    dispatch_async(queue, block);
  }
  else {
    dispatch_mach_handoff_reply();
  }
}

void _xpc_mach_message_request_handoff_reply_f( uint64_t a1, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  if ((*(_BYTE *)(a1 + 16) & 1) != 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if ((*(_BYTE *)(a1 + 16) & 4) == 0 || (*(_DWORD *)a1 ? (BOOL v4 = *(_DWORD *)a1 == -1) : (BOOL v4 = 1), v4)) {
    dispatch_async_f(queue, context, work);
  }
  else {
    dispatch_mach_handoff_reply_f();
  }
}

uint64_t _xpc_mach_message_request_extract_reply_port(unsigned int *a1)
{
  if ((a1[4] & 1) != 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v1 = *a1;
  *a1 = 0;
  return v1;
}

uint64_t _xpc_remote_message_request_get_reply_msg_id(_BYTE *a1)
{
  if ((a1[16] & 1) == 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return *(void *)a1;
}

uint64_t _xpc_remote_message_request_set_reply_msg_id(uint64_t result, uint64_t a2)
{
  if ((*(_BYTE *)(result + 16) & 1) == 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)result = a2;
  return result;
}

void _xpc_message_request_destroy(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (v3)
  {
    if ((a1[2] & 1) != 0)
    {
      if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
        uint64_t v5 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
      }
      else {
        uint64_t v5 = _os_alloc_once();
      }
      uint64_t v6 = *(void *)(v5 + 200);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 8))(a2, *a1);
      }
    }

    else if (_xpc_mach_port_release(v3))
    {
      _os_assumes_log();
    }
  }

  int v7 = (void *)a1[1];
  if (v7) {
    os_release(v7);
  }
  if ((a1[2] & 2) != 0) {
    _xpc_transaction_end();
  }
}

_OWORD *_xpc_mach_received_message_init(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  int v7 = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  BOOL v8 = *(_DWORD *)(a2 + 20) == 0x40000000;
  if (a3) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  *(_DWORD *)a1 = v7;
  *(_DWORD *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = a4;
  *(_BYTE *)(a1 + 16) = v9 | (4 * v8);
  result = (_OWORD *)_xpc_mach_msg_get_audit_token(a2);
  __int128 v11 = result[1];
  *(_OWORD *)(a1 + 32) = *result;
  *(_OWORD *)(a1 + 48) = v11;
  *(void *)(a1 + 24) = 0LL;
  if (a5) {
    return (_OWORD *)_xpc_received_message_set_connection(a1, a5);
  }
  return result;
}

uint64_t _xpc_received_message_set_connection(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    uint64_t result = _xpc_retain_with_resurrect((uint64_t)object);
  }
  else {
    uint64_t result = (uint64_t)xpc_retain(object);
  }
  if (*(void *)(a1 + 24)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(a1 + 24) = object;
  return result;
}

uint64_t _xpc_remote_received_message_init(uint64_t result, int a2, uint64_t a3, xpc_object_t object)
{
  if (a2) {
    char v4 = 3;
  }
  else {
    char v4 = 1;
  }
  *(void *)uint64_t result = a3;
  *(void *)(result + 8) = 0LL;
  *(_BYTE *)(result + 16) = v4;
  *(void *)&__int128 v5 = -1LL;
  *((void *)&v5 + 1) = -1LL;
  *(_OWORD *)(result + 32) = v5;
  *(_OWORD *)(result + 48) = v5;
  *(_DWORD *)(result + 52) = 0;
  *(void *)(result + 24) = 0LL;
  if (object) {
    return _xpc_received_message_set_connection(result, object);
  }
  return result;
}

__n128 _xpc_received_message_move(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v2;
  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *(void *)a2 = 0LL;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *((void *)a2 + 3) = 0LL;
  __n128 result = (__n128)a2[2];
  __int128 v4 = a2[3];
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

void _xpc_received_message_destroy(uint64_t *a1)
{
  __int128 v2 = (void *)a1[3];
  if (v2) {
    xpc_release(v2);
  }
}

__n128 _xpc_received_message_extract_request(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  a1->n128_u64[1] = 0LL;
  a1[1].n128_u64[0] = 0LL;
  a1->n128_u64[0] = 0LL;
  return result;
}

__n128 _xpc_received_message_get_audit_token(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a1 + 32);
  __int128 v3 = *(_OWORD *)(a1 + 48);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t _xpc_received_message_get_connection(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t xpc_receive_mach_msg_validate_hdr(_DWORD *a1)
{
  HIDWORD(v2) = a1[5];
  LODWORD(v2) = HIDWORD(v2) - 0x10000000;
  unsigned int v1 = v2 >> 28;
  if (v1 < 2) {
    return !a1[2] || (*a1 & 0x1F) == 18;
  }
  if (v1 == 2)
  {
    if (!a1[2]) {
      return 1LL;
    }
  }

  else if (v1 == 3)
  {
    return !a1[2] || (*a1 & 0x1F) == 18;
  }

  return 0LL;
}

uint64_t xpc_receive_mach_msg(dispatch_object_s *a1, int a2, void *a3, void *a4, uint64_t *a5)
{
  msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if ((xpc_receive_mach_msg_validate_hdr(msg) & 1) != 0)
  {
    _xpc_ktrace_pid1();
    memset(v17, 0, sizeof(v17));
    _xpc_mach_received_message_init((uint64_t)v17, (uint64_t)msg, a2, (uint64_t)a3, a4);
    __int128 v11 = _xpc_payload_create_from_mach_msg(a1, 1);
    if (v11)
    {
      __int16 v12 = v11;
      if (a4)
      {
        uint64_t distorter = _xpc_connection_get_distorter(a4);
        _xpc_payload_distort((uint64_t)v12, distorter);
        unsigned int platform = _xpc_connection_get_platform((uint64_t)a4);
      }

      else
      {
        unsigned int platform = 0;
      }

      uint64_t v15 = xpc_graph_unpack(v17, (uint64_t)v12, platform);
      os_release(v12);
      if (v15)
      {
        _xpc_ktrace_pid2();
        uint64_t result = 0LL;
        *a5 = v15;
        return result;
      }
    }

    _xpc_received_message_destroy((uint64_t *)v17);
    _xpc_ktrace_pid2();
  }

  else
  {
    if (a2) {
      _xpc_transaction_end();
    }
    if (a3) {
      os_release(a3);
    }
    mach_msg_destroy(msg);
  }

  return 0xFFFFFFFFLL;
}

uint64_t xpc_receive_remote_msg( const void *a1, size_t a2, int a3, uint64_t a4, xpc_object_t object, uint64_t a6)
{
  id v9 = _xpc_payload_create_from_data(a1, a2);
  if (!v9 || (v10 = v9, uint64_t v11 = xpc_graph_unpack_with_ool(v13, (uint64_t)v9, a6), os_release(v10), !v11))
  {
    _xpc_received_message_destroy((uint64_t *)v13);
    return 0LL;
  }

  return v11;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

BOOL _xpc_graph_unpack_header(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 40);
  unint64_t v3 = v2 - 4;
  if (v2 >= 4
    && ((__int128 v4 = *(int **)(a1 + 32), *(void *)(a1 + 32) = v4 + 1, *(void *)(a1 + 40) = v3, v4)
      ? (BOOL v5 = v3 >= 4)
      : (BOOL v5 = 0),
        v5 && (int v6 = *v4, *(void *)(a1 + 32) = v4 + 2, *(void *)(a1 + 40) = v2 - 8, v6 == dword_180188140[a2])))
  {
    return v4[1] == 5;
  }

  else
  {
    return 0LL;
  }

uint64_t _xpc_graph_deserializer_read(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0LL;
  uint64_t v4 = a2 >= 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v5 = v4 << 63 >> 63;
  if (v5 == v4 && (v5 & 0x8000000000000000LL) == 0)
  {
    unint64_t v6 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v7 = *(void *)(a1 + 40);
    BOOL v8 = v7 >= v6;
    unint64_t v9 = v7 - v6;
    if (v8)
    {
      uint64_t result = *(void *)(a1 + 32);
      *(void *)(a1 + 32) = result + v6;
      *(void *)(a1 + 40) = v9;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t xpc_graph_unpack(__int128 *a1, uint64_t a2, unsigned int a3)
{
  if (a3 == 3) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return _xpc_graph_unpack_impl(a1, a2, a3, 0LL);
}

uint64_t _xpc_graph_unpack_impl(__int128 *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  if (a3 >= 4) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  unint64_t v23 = 0LL;
  uint64_t contiguous_bytes = xpc_payload_get_contiguous_bytes(a2, &v23);
  unint64_t v9 = v23;
  __int128 v16 = (unint64_t)a2;
  uint64_t v17 = contiguous_bytes;
  unint64_t v18 = v23;
  v19 = (_DWORD *)contiguous_bytes;
  unint64_t v20 = v23;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  if (a4)
  {
    _xpc_graph_deserializer_set_ool_callback((uint64_t)&v16, a4);
    unint64_t v9 = v20;
  }

  if (v9 < 4) {
    return 0LL;
  }
  v10 = v19;
  if ((v9 & 0xFFFFFFFFFFFFFFFCLL) == 4 || v19 == 0LL) {
    return 0LL;
  }
  int v12 = *v19;
  v19 += 2;
  unint64_t v20 = v9 - 8;
  if (v12 != dword_180188140[a3] || v10[1] != 5) {
    return 0LL;
  }
  if (a1) {
    return _xpc_dictionary_create_from_received_message(a1, &v16);
  }
  if (v9 - 8 < 4) {
    return 0LL;
  }
  v19 = v10 + 3;
  unint64_t v20 = v9 - 12;
  unsigned int v14 = v10[2];
  if (!_xpc_class_id_valid(v14)) {
    return 0LL;
  }
  uint64_t v15 = (uint64_t (*)(__int128 *))_xpc_deserialize_from_wire_id(v14);
  return v15(&v16);
}

uint64_t xpc_graph_unpack_with_ool(__int128 *a1, uint64_t a2, uint64_t a3)
{
  return _xpc_graph_unpack_impl(a1, a2, 3u, a3);
}

uint64_t _xpc_graph_deserializer_init(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  uint64_t result = xpc_payload_get_contiguous_bytes(a2, &v6);
  uint64_t v5 = v6;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = 0LL;
  *(_DWORD *)(a1 + 56) = 0;
  return result;
}

uint64_t _xpc_graph_deserializer_init_clone(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 56)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)uint64_t result = 0LL;
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = v2;
  *(void *)(result + 24) = v3;
  *(void *)(result + 32) = v4;
  *(void *)(result + 40) = v5;
  *(void *)(result + 48) = 0LL;
  *(_DWORD *)(result + 56) = 0;
  return result;
}

__n128 _xpc_graph_deserializer_move(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _xpc_graph_deserializer_get_payload(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _xpc_graph_deserializer_read_port(uint64_t *a1, int a2, int *a3)
{
  uint64_t v3 = *a1;
  unint64_t v7 = a1[6];
  a1[6] = v7 + 1;
  switch(a2)
  {
    case 16:
      int v13 = 0;
      BOOL v8 = &v13;
      int v9 = xpc_mach_payload_extract_ool_receive_right(v3, v7, &v13);
      break;
    case 18:
      int v12 = 0;
      BOOL v8 = &v12;
      int v9 = xpc_mach_payload_extract_ool_send_once_right(v3, v7, &v12);
      break;
    case 17:
      int v14 = 0;
      BOOL v8 = &v14;
      int v9 = xpc_mach_payload_extract_ool_send_right(v3, v7, &v14);
      break;
    default:
      _xpc_graph_deserializer_read_port_cold_1();
  }

  int v11 = v9;
  uint64_t result = 0LL;
  if (!v11)
  {
    *a3 = *v8;
    return 1LL;
  }

  return result;
}

BOOL _xpc_graph_deserializer_skip_value(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = (uint64_t (*)(uint64_t))_xpc_wire_length_from_wire_id(a2);
  uint64_t v4 = v3(a1);
  if (v4 == -1) {
    return 0LL;
  }
  uint64_t v5 = v4;
  BOOL result = 0LL;
  BOOL v7 = __CFADD__(v5, 3LL);
  uint64_t v8 = v5 + 3;
  uint64_t v9 = v7;
  uint64_t v10 = v9 << 63 >> 63;
  if (v10 == v9 && (v10 & 0x8000000000000000LL) == 0)
  {
    unint64_t v11 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v12 = *(void *)(a1 + 40);
    BOOL v7 = v12 >= v11;
    unint64_t v13 = v12 - v11;
    if (!v7) {
      return 0LL;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = v14 + v11;
    *(void *)(a1 + 40) = v13;
    return v14 != 0;
  }

  return result;
}

const char *_xpc_graph_deserializer_read_string(uint64_t a1)
{
  uint64_t v2 = *(const char **)(a1 + 32);
  size_t v3 = *(void *)(a1 + 40);
  size_t v4 = strnlen(v2, v3);
  BOOL result = 0LL;
  BOOL v6 = __CFADD__(++v4, 3LL);
  size_t v7 = v4 + 3;
  uint64_t v8 = v6;
  uint64_t v9 = v8 << 63 >> 63;
  if (v9 == v8 && (v9 & 0x8000000000000000LL) == 0)
  {
    unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    BOOL v6 = v3 >= (v7 & 0xFFFFFFFFFFFFFFFCLL);
    size_t v11 = v3 - (v7 & 0xFFFFFFFFFFFFFFFCLL);
    if (v6)
    {
      *(void *)(a1 + 32) = &v2[v10];
      *(void *)(a1 + 40) = v11;
      return v2;
    }
  }

  return result;
}

uint64_t _xpc_graph_deserializer_set_ool_callback(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 8)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(result + 8) = a2;
  return result;
}

uint64_t _xpc_graph_deserializer_get_transport(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    return xpc_payload_get_transport(result);
  }
  return result;
}

uint64_t _xpc_graph_deserializer_get_depth(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

BOOL _xpc_graph_deserializer_enter_container(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1 <= 511) {
    *(_DWORD *)(a1 + 56) = v1 + 1;
  }
  return v1 < 512;
}

uint64_t _xpc_graph_deserializer_restore_depth(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 56) < a2) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(_DWORD *)(result + 56) = a2;
  return result;
}

uint64_t xpc_payload_get_contiguous_bytes(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  uint64_t result = *(void *)(a1 + 16);
  *a2 = *(void *)(v3 + 8);
  return result;
}

uint64_t _xpc_payload_distort(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))( a2,  *(void *)(result + 16),  *(void *)(result + 24));
  }
  return result;
}

uint64_t xpc_payload_get_transport(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t xpc_mach_payload_ool_port_count(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return *(void *)(a1 + 56);
}

uint64_t xpc_mach_payload_extract_ool_send_right(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (*(_BYTE *)(a1 + 32) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v5 = 0;
  uint64_t result = _xpc_mach_payload_extract_ool_port(a1, a2, 17, &v5);
  if (!(_DWORD)result) {
    *a3 = v5;
  }
  return result;
}

uint64_t _xpc_mach_payload_extract_ool_port(uint64_t a1, unint64_t a2, int a3, _DWORD *a4)
{
  if (*(void *)(a1 + 56) <= a2) {
    return 34LL;
  }
  uint64_t v4 = *(void *)(a1 + 48) + 12 * a2;
  unsigned int v5 = *(unsigned __int8 *)(v4 + 10);
  if (v5 - 16 >= 3) {
    _xpc_mach_payload_extract_ool_port_cold_1(v5);
  }
  if (v5 != a3) {
    return 22LL;
  }
  uint64_t result = 0LL;
  int v7 = *(_DWORD *)v4;
  *(void *)uint64_t v4 = 0LL;
  *(_DWORD *)(v4 + 8) = 0;
  *a4 = v7;
  return result;
}

uint64_t xpc_mach_payload_extract_ool_send_once_right(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (*(_BYTE *)(a1 + 32) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v5 = 0;
  uint64_t result = _xpc_mach_payload_extract_ool_port(a1, a2, 18, &v5);
  if (!(_DWORD)result) {
    *a3 = v5;
  }
  return result;
}

uint64_t xpc_mach_payload_extract_ool_receive_right(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  if (*(_BYTE *)(a1 + 32) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v5 = 0;
  uint64_t result = _xpc_mach_payload_extract_ool_port(a1, a2, 16, &v5);
  if (!(_DWORD)result) {
    *a3 = v5;
  }
  return result;
}

_BYTE *_xpc_payload_create_from_mach_msg(dispatch_object_s *a1, char a2)
{
  uint64_t v4 = _xpc_payload_alloc(64LL);
  v4[32] = 1;
  dispatch_retain(a1);
  *((void *)v4 + 5) = a1;
  if ((a2 & 1) == 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t msg = dispatch_mach_msg_get_msg();
  BOOL v6 = (unsigned int *)(msg + 24);
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    uint64_t v7 = -24LL;
LABEL_4:
    *((void *)v4 + 2) = v6;
    *((void *)v4 + 3) = v7;
    return v4;
  }

  unsigned int v8 = *v6;
  if (!*v6)
  {
LABEL_15:
    os_release(v4);
    return 0LL;
  }

  uint64_t v9 = msg;
  if (*(_BYTE *)(msg + 39) != 1)
  {
    BOOL v6 = (unsigned int *)(msg + 28);
    *((void *)v4 + 6) = msg + 28;
LABEL_10:
    uint64_t v10 = v8;
    size_t v11 = v6 + 2;
    v6 += 3 * v8;
    uint64_t v12 = v8;
    while (!*((_BYTE *)v11 + 3))
    {
      v11 += 3;
      if (!--v12) {
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }

  *((void *)v4 + 1) = dispatch_data_create( *(const void **)(msg + 28),  *(unsigned int *)(msg + 40),  0LL,  (dispatch_block_t)*MEMORY[0x1895FE7B0]);
  *(_DWORD *)(v9 + 36) &= 0xFFFFFF00;
  *((void *)v4 + 2) = *(void *)(v9 + 28);
  *((void *)v4 + 3) = *(unsigned int *)(v9 + 40);
  BOOL v6 = (unsigned int *)(v9 + 44);
  *((void *)v4 + 6) = v9 + 44;
  if (--v8) {
    goto LABEL_10;
  }
  uint64_t v10 = 0LL;
LABEL_13:
  *((void *)v4 + 7) = v10;
  if (!*((void *)v4 + 1))
  {
    uint64_t v7 = v9 - (void)v6;
    goto LABEL_4;
  }

  return v4;
}

id _xpc_payload_create_from_data(const void *a1, size_t a2)
{
  return _xpc_payload_create_from_data_impl(a1, a2, 0LL);
}

id _xpc_payload_create_from_data_impl(const void *a1, size_t a2, void *a3)
{
  id v6 = _xpc_payload_alloc(40LL);
  *((_BYTE *)v6 + 32) = 0;
  uint64_t v7 = dispatch_data_create(a1, a2, 0LL, a3);
  *((void *)v6 + 1) = dispatch_data_create_map(v7, (const void **)v6 + 2, (size_t *)v6 + 3);
  dispatch_release(v7);
  return v6;
}

id _xpc_payload_create_from_data_no_copy(const void *a1, size_t a2)
{
  return _xpc_payload_create_from_data_impl(a1, a2, (void *)*MEMORY[0x1895FE7A8]);
}

void _xpc_payload_dispose(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(_BYTE *)(a1 + 32) == 1)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
      dispatch_release(*(dispatch_object_t *)(a1 + 40));
    }
  }

int *_xpc_get_extension_vtable(id a1)
{
  uint64_t v2 = MEMORY[0x1895FF8E0];
  uint64_t v3 = *(void *)(MEMORY[0x1895FF8E0] + 16LL);
  while (1)
  {
    uint64_t v4 = v3 == -1 ? *(void *)(v2 + 24) : _os_alloc_once();
    if (*(void *)(v4 + 200)) {
      break;
    }
    uint64_t v3 = -1LL;
LABEL_9:
    unint64_t v7 = *(void *)a1;
    if (*(void *)a1 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v7 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*(void *)a1 & 7LL) == 0)
    {
      return (int *)((char *)&_xpc_vtables + 2 * (v7 - (void)&OBJC_CLASS___OS_xpc_object));
    }
  }

  Class Class = object_getClass(a1);
  uint64_t v6 = *(void *)(v4 + 200);
  if (Class == *(Class *)(v6 + 24)) {
    return *(int **)(v6 + 32);
  }
  uint64_t v3 = *(void *)(v2 + 16);
LABEL_19:
  uint64_t v11 = 0LL;
  uint64_t v12 = *MEMORY[0x189616658];
  unint64_t v13 = v12 ^ (unint64_t)a1;
  do
  {
    if ((v13 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v11)) {
      break;
    }
    ++v11;
  }

  while (v11 != 7);
  unint64_t v14 = v11 | v13;
  uint64_t v15 = v11 & 7;
  int v16 = (v14 >> 55) + 8;
  if (v15 == 7) {
    LODWORD(v15) = v16;
  }
  if ((_DWORD)v15 == 12) {
    return &_OS_xpc_type_uint64;
  }
  if ((_DWORD)v15 != 13)
  {
    uint64_t v17 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v17);
  }

  return &_OS_xpc_type_int64;
}

uint64_t _xpc_get_extension_type_vtable(uint64_t a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  uint64_t v3 = *(void *)(v2 + 200);
  if (v3 && *(void *)(v3 + 24) == a1) {
    return *(void *)(v3 + 32);
  }
  else {
    return 0LL;
  }
}

double xpc_extension_type_init(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = _xpc_extension_copy;
  *(void *)(a1 + 24) = _xpc_extension_equal;
  *(void *)(a1 + 32) = _xpc_extension_hash;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = _xpc_extension_desc;
  *(void *)(a1 + 56) = _xpc_extension_debug_desc;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = _xpc_extension_serialize;
  *(void *)(a1 + 80) = _xpc_extension_deserialize;
  *(void *)(a1 + 88) = _xpc_extension_wire_length;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  return result;
}

uint64_t _xpc_extension_copy()
{
  return 0LL;
}

BOOL _xpc_extension_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_extension_desc(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  uint64_t v4 = (uint64_t (*)(void *, _OWORD *, uint64_t))*((void *)_xpc_get_extension_vtable(a1) + 21);
  memset(v7, 0, sizeof(v7));
  size_t v5 = v4(a1, v7, 512LL);
  return _xpc_serializer_append(a2, v7, v5, 0);
}

uint64_t _xpc_extension_debug_desc(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  uint64_t v4 = (uint64_t (*)(void *, _OWORD *, uint64_t))*((void *)_xpc_get_extension_vtable(a1) + 22);
  memset(v7, 0, sizeof(v7));
  size_t v5 = v4(a1, v7, 512LL);
  return _xpc_serializer_append(a2, v7, v5, 0);
}

void _xpc_extension_serialize()
{
}

uint64_t _xpc_extension_deserialize()
{
  return 0LL;
}

uint64_t _xpc_extension_wire_length()
{
  return -1LL;
}

BOOL _system_version_copy_string_sysctl(void *a1)
{
  size_t v2 = 48LL;
  return sysctlbyname("kern.osproductversion", a1, &v2, 0LL, 0LL) == 0;
}

const char *_system_version_plist_path()
{
  return "/System/Library/CoreServices/SystemVersion.plist";
}

BOOL _system_version_copy_string_plist(char *a1)
{
  size_t v2 = _xpc_copy_secure_plist("/System/Library/CoreServices/SystemVersion.plist");
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  string = xpc_dictionary_get_string(v2, "ProductVersion");
  BOOL v5 = string != 0LL;
  if (string) {
    strlcpy(a1, string, 0x30uLL);
  }
  xpc_release(v3);
  return v5;
}

BOOL _system_version_parse_string(const char *a1, uint64_t a2)
{
  return (sscanf(a1, "%d.%d.%d", a2, a2 + 4, a2 + 8) - 1) < 3;
}

BOOL _availability_version_check(unsigned int a1, uint64_t a2)
{
  base_unsigned int platform = dyld_get_base_platform();
  int v9 = 0;
  uint64_t v8 = 0LL;
  os_system_version_get_current_version((uint64_t)&v8);
  if (!a1) {
    return 1LL;
  }
  uint64_t v5 = a1;
  for (i = (unsigned int *)(a2 + 4); *(i - 1) != base_platform; i += 2)
  {
    if (!--v5) {
      return 1LL;
    }
  }

  return *i <= (((_DWORD)v8 << 16) | (BYTE4(v8) << 8) | v9);
}

uint64_t os_system_version_get_current_version(uint64_t a1)
{
  if (os_system_version_get_current_version_predicate != -1) {
    _os_once();
  }
  uint64_t v2 = *(void *)current_version;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(current_version + 8);
  *(void *)a1 = v2;
  return 0LL;
}

uint64_t populate_current_version()
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  __int128 v4 = 0u;
  __int128 v5 = 0u;
  *(_OWORD *)uint64_t v3 = 0u;
  size_t v2 = 48LL;
  if (sysctlbyname("kern.osproductversion", v3, &v2, 0LL, 0LL)) {
    _system_version_copy_string_plist(v3);
  }
  uint64_t result = sscanf(v3, "%d.%d.%d", &parsed_version, &unk_18C440F1C, &unk_18C440F20);
  else {
    int v1 = &parsed_version;
  }
  current_version = (uint64_t)v1;
  return result;
}

uint64_t os_system_version_sim_get_current_host_version(uint64_t a1)
{
  if (os_system_version_sim_get_current_host_version_predicate != -1) {
    _os_once();
  }
  uint64_t v2 = *(void *)current_host_version;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(current_host_version + 8);
  *(void *)a1 = v2;
  return 0LL;
}

uint64_t populate_current_host_version()
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  *(_OWORD *)__int128 v5 = 0u;
  size_t v4 = 48LL;
  if (sysctlbyname("kern.osproductversion", v5, &v4, 0LL, 0LL))
  {
    v0 = _xpc_copy_secure_plist("/System/Library/CoreServices/SystemVersion.plist");
    if (v0)
    {
      int v1 = v0;
      if (xpc_dictionary_get_string(v0, "ProductVersion")) {
        __strlcpy_chk();
      }
      xpc_release(v1);
    }
  }

  uint64_t result = sscanf(v5, "%d.%d.%d", &parsed_host_version, &unk_18C50BD28, &unk_18C50BD2C);
  else {
    uint64_t v3 = &parsed_host_version;
  }
  current_host_version = (uint64_t)v3;
  return result;
}

uint64_t _xpc_rich_error_copy(uint64_t a1)
{
  return xpc_rich_error_create(*(const char **)(a1 + 40), *(_BYTE *)(a1 + 24));
}

BOOL _xpc_rich_error_equal(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == *(void *)(a2 + 32)
}

uint64_t _xpc_rich_error_hash(uint64_t a1)
{
  uint64_t v2 = 48LL;
  if (*(_BYTE *)(a1 + 24)) {
    uint64_t v2 = 49LL;
  }
  uint64_t v3 = _xpc_asprintf("%s%c", *(const char **)(a1 + 40), v2);
  uint64_t v4 = _xpc_hash(v3, *(void *)(a1 + 32) + 2LL);
  free(v3);
  return v4;
}

uint64_t _xpc_rich_error_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  int v4 = snprintf(__str, 0x40uLL, "Can Retry: %d. Description:", *(unsigned __int8 *)(a1 + 24));
  _xpc_serializer_append(a2, __str, v4, 0);
  _xpc_serializer_append(a2, *(void **)(a1 + 40), *(void *)(a1 + 32), 0);
  return _xpc_serializer_append(a2, "", 1uLL, 0);
}

uint64_t _xpc_rich_error_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf( __str,  __size,  "Can Retry: %d. Description:%s",  *(unsigned __int8 *)(a1 + 24),  *(const char **)(a1 + 40));
}

uint64_t _xpc_rich_error_serialize(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 32)) {
    _xpc_rich_error_serialize_cold_1();
  }
  int __src = 114688;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int v7 = *(_DWORD *)(a1 + 32) + 13;
  _xpc_serializer_append(a2, &v7, 4uLL, 1);
  int v6 = *(unsigned __int8 *)(a1 + 24);
  _xpc_serializer_append(a2, &v6, 4uLL, 1);
  uint64_t v5 = *(void *)(a1 + 32);
  _xpc_serializer_append(a2, &v5, 8uLL, 1);
  return _xpc_serializer_append(a2, (void *)(a1 + 40), *(void *)(a1 + 32) + 1LL, 1);
}

uint64_t _xpc_rich_error_deserialize(uint64_t a1)
{
  uint64_t v2 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (v2
    && (int v3 = *v2, (v4 = (uint64_t *)_xpc_graph_deserializer_read(a1, 8uLL)) != 0LL)
    && (uint64_t v5 = *v4, (unint64_t)(*v4 - 0x10000) >= 0xFFFFFFFFFFFF0001LL)
    && (int v6 = (const char *)_xpc_graph_deserializer_read(a1, v5 + 1)) != 0LL
    && !v6[v5])
  {
    return xpc_rich_error_create(v6, v3 != 0);
  }

  else
  {
    return 0LL;
  }

void _xpc_rich_error_dispose(uint64_t a1)
{
}

uint64_t xpc_rich_error_create(const char *a1, char a2)
{
  size_t v4 = strlen(a1);
  if (!v4) {
    return 0LL;
  }
  size_t v5 = v4;
  uint64_t v6 = _xpc_base_create();
  *(_BYTE *)(v6 + 24) = a2;
  *(void *)(v6 + 40) = _xpc_try_strdup(a1);
  size_t v7 = (v5 & 0xFFFFFFFC) + 8;
  if (v5 > v7)
  {
    __int128 v9 = _xpc_asprintf("Unreasonably large string");
    _xpc_api_misuse(v9);
  }

  *(_DWORD *)(v6 + 20) = v7;
  *(void *)(v6 + 32) = v5;
  return v6;
}

char *__cdecl xpc_rich_error_copy_description(xpc_rich_error_t error)
{
  return _xpc_strdup(*((const char **)error + 5));
}

BOOL xpc_rich_error_can_retry(xpc_rich_error_t error)
{
  return *((_BYTE *)error + 24);
}

xpc_object_t launch_job_query_get_additional_job_properties(_DWORD *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  int v3 = _launch_job_query_routine(1200LL, v2, &xdict);
  if (v3)
  {
    xpc_release(v2);
    if (xdict) {
      _xpc_rich_error_serialize_cold_1();
    }
    xpc_object_t v4 = 0LL;
  }

  else
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "additional-properties");
    xpc_object_t v4 = dictionary;
    if (dictionary) {
      xpc_retain(dictionary);
    }
    xpc_release(xdict);
    xpc_release(v2);
  }

  *a1 = v3;
  return v4;
}

BOOL _xpc_mach_send_once_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t _xpc_mach_send_once_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_mach_send_once_desc(unsigned int *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  int v11 = 0;
  xpc_object_t v4 = (unsigned int *)MEMORY[0x1895FFD48];
  int v5 = MEMORY[0x186DF6E54](*MEMORY[0x1895FFD48], a1[6], 2LL, &v11);
  if (v5)
  {
    if (v5 == 15)
    {
      size_t v7 = "(none)";
    }

    else if (v5 == 17)
    {
      int v6 = MEMORY[0x186DF6E54](*v4, a1[6], 4LL, &v11);
      size_t v7 = "(invalid)";
      if (!v6) {
        size_t v7 = "dead-name";
      }
    }

    else
    {
      size_t v7 = "(invalid)";
    }
  }

  else
  {
    size_t v7 = "send once";
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v13 = 0u;
  unsigned int v8 = snprintf(__str, 0x80uLL, "<%s: %p> { name = 0x%x, right = %s }", "mach send once right", a1, a1[6], v7);
  if (v8 >= 0x7F) {
    int v9 = 127;
  }
  else {
    int v9 = v8;
  }
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_mach_send_once_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", port = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_mach_send_once_serialize(unsigned int *a1, void *a2)
{
  int right = xpc_mach_send_once_extract_right(a1);
  int v6 = 110592;
  return _xpc_serializer_append_port(a2, &v6, 4uLL, (uint64_t)a1, right, 18);
}

uint64_t _xpc_mach_send_once_deserialize(uint64_t *a1)
{
  int v3 = 0;
  int v1 = v3;
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) |= 3u;
  return result;
}

uint64_t _xpc_mach_send_once_wire_length()
{
  return -1LL;
}

uint64_t _xpc_mach_send_once_dispose(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 24);
  do
    uint64_t result = __ldxr(v1);
  while (__stxr(0xFFFFFFFF, v1));
  if ((result - 1) <= 0xFFFFFFFC)
  {
    uint64_t result = _xpc_mach_port_release(result);
    if ((_DWORD)result) {
      return _os_assumes_log();
    }
  }

  return result;
}

uint64_t xpc_mach_send_once_create(int a1)
{
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 24) = a1;
  *(_DWORD *)(result + 16) |= 2u;
  return result;
}

uint64_t xpc_mach_send_once_extract_right(unsigned int *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send_once) {
    return 0LL;
  }
  int v3 = a1 + 6;
  do
    uint64_t result = __ldxr(v3);
  while (__stxr(0xFFFFFFFE, v3));
  if ((_DWORD)result == -2)
  {
    xpc_object_t v4 = _xpc_asprintf("Send once port already consumed");
    _xpc_api_misuse(v4);
  }

  return result;
}

char *_xpc_realpath(const char *a1)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  __int128 v3 = xmmword_18018815C;
  uint64_t v4 = 0LL;
  bzero(v5, 0x40CuLL);
  while (getattrlist(a1, &v3, v5, 0x40CuLL, 0) == -1)
  {
    if (*__error() != 35) {
      return 0LL;
    }
  }

  return _xpc_strdup((const char *)v6 + v6[0]);
}

char *_xpc_realpath_fd(int a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  bzero(v4, 0x400uLL);
  if (a1 < 0)
  {
    __int128 v3 = __error();
    uint64_t result = 0LL;
    *__int128 v3 = 9;
  }

  else
  {
    while (fcntl(a1, 50, v4) == -1)
    {
      if (*__error() != 35) {
        return 0LL;
      }
    }

    return _xpc_strdup(v4);
  }

  return result;
}

void *_copy_plist_from_fd(int a1, uint64_t a2, void *a3, ssize_t *a4)
{
  unsigned int v8 = _xpc_alloc(*(void *)(a2 + 96));
  ssize_t v9 = read(a1, v8, *(void *)(a2 + 96));
  ssize_t v10 = v9;
  if (v9 != *(void *)(a2 + 96))
  {
    if (v9 && (v9 != -1 || *__error())) {
      _os_assumes_log();
    }
    goto LABEL_8;
  }

  xpc_object_t v11 = xpc_create_from_plist((char *)v8, v9);
  uint64_t v12 = v11;
  if (v11)
  {
    if (xpc_get_type(v11) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
    {
      xpc_release(v12);
LABEL_8:
      uint64_t v12 = 0LL;
      goto LABEL_9;
    }

    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }

LABEL_9:
  free(v8);
  return v12;
}

    xpc_dictionary_set_int64(v4, "pid", v7);
    goto LABEL_16;
  }

  xpc_dictionary_set_mach_send(v4, "service-port", v6);
LABEL_16:
  xpc_object_t xdict = 0LL;
  uint64_t v12 = _xpc_service_routine(712LL, v5, &xdict);
  __int128 v13 = 0LL;
  if (v12 != 113)
  {
    if (v12)
    {
      _os_assumes_log();
      __int128 v13 = 0LL;
    }

    else
    {
      value = xpc_dictionary_get_value(xdict, "attrs");
      __int128 v13 = xpc_retain(value);
      xpc_release(xdict);
    }
  }

  xpc_release(v5);
  return v13;
}

    __int128 v13 = 0LL;
    ssize_t v10 = a1;
    xpc_object_t v11 = a2;
    uint64_t v12 = &v13;
    return dispatch_data_apply_f();
  }

  if (*(void *)(a1 + 40) <= 0x4000uLL) {
    goto LABEL_9;
  }
  memory_entry = dispatch_data_make_memory_entry();
  if (memory_entry) {
    uint64_t v5 = memory_entry;
  }
  else {
    uint64_t v5 = -1;
  }
  return _xpc_serializer_append_port((void *)a2, 0LL, 0LL, a1, v5, 17);
}

int *_xpc_strict_close(int *result)
{
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      if (*__error()) {
        _os_assumes_log();
      }
      uint64_t result = __error();
      if (*result == 9) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
    }
  }

  return result;
}

void *_xpc_copy_secure_plist(const char *a1)
{
  return _copy_secure_plist(a1, 0LL, 0LL);
}

void *_copy_secure_plist(const char *a1, void *a2, ssize_t *a3)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = (int *)open(a1, 0);
  if ((_DWORD)v5 == -1) {
    return 0LL;
  }
  int v6 = v5;
  memset(&v10, 0, sizeof(v10));
  int v7 = fstat((int)v5, &v10);
  if (v7 | v10.st_uid || (v10.st_mode & 0x12) != 0) {
    unsigned int v8 = 0LL;
  }
  else {
    unsigned int v8 = _copy_plist_from_fd((int)v6, (uint64_t)&v10, a2, a3);
  }
  _xpc_strict_close(v6);
  return v8;
}

uint64_t _xpc_ktrace_pid0()
{
  return kdebug_trace();
}

uint64_t _xpc_ktrace_pid1()
{
  return kdebug_trace();
}

uint64_t _xpc_ktrace_pid2()
{
  return kdebug_trace();
}

void _xpc_launch_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  xpc_object_t xdict = 0LL;
  int v4 = _xpc_interface_routine(a1, a2, &xdict, 0, 0LL);
  if (v4) {
    goto LABEL_2;
  }
  xpc_object_t v5 = xdict;
  xpc_object_t value = xpc_dictionary_get_value(xdict, "response");
  if (!value)
  {
    xpc_release(v5);
    int v4 = 118;
LABEL_2:
    *a3 = xpc_uint64_create(v4);
    return;
  }

  *a3 = xpc_retain(value);
  xpc_release(v5);
}

int64_t _xpc_interface_routine(uint64_t a1, xpc_object_t xdict, xpc_object_t *a3, int a4, uint64_t a5)
{
  uint64_t v10 = MEMORY[0x1895FF8E0];
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v11 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v11 = _os_alloc_once();
  }
  if (*(_BYTE *)v11 || *(_BYTE *)(v11 + 4)) {
    return 141LL;
  }
  xpc_object_t xdicta = 0LL;
  if (!*(_BYTE *)(v11 + 41)) {
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  }
  uint64_t v14 = 2LL;
  if (!*(_BYTE *)(v11 + 88)) {
    uint64_t v14 = 6LL;
  }
  int64_t int64 = _xpc_pipe_interface_routine(*(void *)(v11 + 24), a1, xdict, &xdicta, v14 | a5);
  if (xdicta && xpc_dictionary_get_string(xdicta, "xpc-fault")) {
    _XPC_MISUSE_FAULT();
  }
  xpc_object_t v15 = xdicta;
  if ((_DWORD)int64 || (int64 = xpc_dictionary_get_int64(xdicta, "error"), xpc_object_t v15 = xdicta, (_DWORD)int64))
  {
    if (v15) {
      xpc_release(v15);
    }
  }

  else
  {
    if (*(void *)(v10 + 16) == -1LL) {
      uint64_t v16 = *(void *)(v10 + 24);
    }
    else {
      uint64_t v16 = _os_alloc_once();
    }
    if (!*(_BYTE *)(v16 + 88))
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      xpc_dictionary_get_audit_token(v15);
      if (DWORD1(v25) != 1) {
        _xpc_interface_routine_cold_6(SDWORD1(v25));
      }
      if (DWORD1(v24)) {
        _xpc_interface_routine_cold_5();
      }
      if (a4)
      {
        uint64_t int64 = xpc_dictionary_get_uint64(v15, "req_pid");
        uint64_t v18 = xpc_dictionary_get_uint64(v15, "rec_execcnt");
        self_audit_token = _xpc_get_self_audit_token();
        int v21 = *(_DWORD *)(self_audit_token + 20);
        if (!v21 || (int v22 = *(_DWORD *)(self_audit_token + 28)) == 0) {
          _xpc_interface_routine_cold_2();
        }
        if (v22 != v19) {
          _xpc_interface_routine_cold_3();
        }
      }
    }

    int64_t int64 = 0LL;
    *a3 = xdicta;
  }

  return int64;
}

int64_t _xpc_bootstrap_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _xpc_bootstrap_routine_authenticate(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 1, 0LL);
}

int64_t _xpc_bootstrap_routine_check_in(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 1LL);
}

uint64_t _xpc_interface_routine_async(uint64_t a1, xpc_object_t xdict, uint64_t a3)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v6 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v6 = _os_alloc_once();
  }
  if (*(_BYTE *)v6 || *(_BYTE *)(v6 + 4)) {
    return 141LL;
  }
  if (!*(_BYTE *)(v6 + 41)) {
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  }
  return _xpc_pipe_interface_routine_async(*(void *)(v6 + 24), a1, xdict, a3, 2LL);
}

int64_t _xpc_service_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _xpc_domain_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _xpc_domain_routine_activate(xpc_object_t xdict, xpc_object_t *a2)
{
  return _xpc_interface_routine(805LL, xdict, a2, 0, 1LL);
}

xpc_object_t _xpc_domain_request_create_system()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0LL);
  return empty;
}

int64_t _launch_job_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _launch_job_query_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

int64_t _launch_server_test_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0LL);
}

uint64_t _XPC_MISUSE_FAULT()
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if ((_dyld_get_image_uuid() & 1) == 0)
  {
    int v7 = 0LL;
    uint64_t v8 = 0LL;
  }

  if ((_dyld_get_shared_cache_uuid() & 1) != 0)
  {
    _dyld_get_shared_cache_range();
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  _os_log_simple();
  bzero(&v7, 0x400uLL);
  int v0 = backtrace(&v7, 128);
  int v1 = backtrace_symbols(&v7, v0);
  if (v1)
  {
    xpc_object_t v2 = v1;
    if (v0 >= 1)
    {
      uint64_t v3 = v0;
      int v4 = v1;
      do
      {
        if (!*v4) {
          break;
        }
        uint64_t v9 = 0LL;
        uint64_t v10 = 0LL;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
        }

        if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
          _dyld_get_shared_cache_range();
        }
        ++v4;
        _os_log_simple();
        --v3;
      }

      while (v3);
    }

    free(v2);
  }

  uint64_t result = os_fault_with_payload();
  if ((_DWORD)result)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
      _dyld_get_shared_cache_range();
    }
    __error();
    uint64_t v6 = __error();
    xpc_strerror(*v6);
    return _os_log_simple();
  }

  return result;
}

void *_xpc_alloc(size_t __size)
{
  do
  {
    xpc_object_t v2 = calloc(1uLL, __size);
    if (v2) {
      break;
    }
    if (*__error() != 12 && *__error()) {
      _xpc_alloc_cold_1();
    }
  }

  while (_waiting4memory());
  return v2;
}

void *_xpc_realloc(void *__ptr, int a2, size_t __size)
{
  do
  {
    xpc_object_t v5 = realloc(__ptr, __size);
    if (v5) {
      break;
    }
    if (*__error() != 12 && *__error()) {
      _xpc_alloc_cold_1();
    }
  }

  while (_waiting4memory());
  return v5;
}

int64_t _xpc_look_up_endpoint( char *a1, int a2, uint64_t a3, uint64_t a4, const unsigned __int8 *a5, uint64_t a6, const void *a7, _DWORD *a8, BOOL *a9)
{
  xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v17, "type", a2);
  xpc_dictionary_set_uint64(v17, "handle", a3);
  xpc_dictionary_set_uint64(v17, "lookup-handle", a4);
  xpc_dictionary_set_uint64(v17, "flags", a6);
  xpc_dictionary_set_string(v17, "name", a1);
  if ((a6 & 0x24) != 0) {
    xpc_dictionary_set_uuid(v17, "instance", a5);
  }
  if ((a6 & 0x400) != 0)
  {
    if (!a7) {
      _xpc_rich_error_serialize_cold_1();
    }
    xpc_dictionary_set_data(v17, "cputypes", a7, 0x24uLL);
  }

  xpc_object_t xdict = 0LL;
  int64_t v18 = _xpc_bootstrap_routine_authenticate(804LL, v17, &xdict);
  if (!(_DWORD)v18)
  {
    *a8 = _xpc_dictionary_extract_mach_send(xdict, "port");
    if (a9) {
      *a9 = xpc_dictionary_get_BOOL(xdict, "non-launching");
    }
    xpc_release(xdict);
    _launch_report_service_lookup(a1);
  }

  xpc_release(v17);
  return v18;
}

uint64_t _launch_report_service_lookup(char *a1)
{
  uint64_t result = _os_feature_enabled_simple_impl();
  if ((_DWORD)result)
  {
    uint64_t result = _os_trace_lazy_init_completed_4libxpc();
    if ((_DWORD)result)
    {
      uint64_t result = os_variant_has_internal_content();
      if ((_DWORD)result)
      {
        uint64_t result = os_variant_has_internal_diagnostics();
        if ((_DWORD)result)
        {
          uint64_t result = _xpc_equal_strings(a1, "com.apple.system.notification_center");
          if ((result & 1) == 0)
          {
            uint64_t result = _xpc_equal_strings(a1, "com.apple.logd");
            if ((result & 1) == 0)
            {
              uint64_t result = _xpc_equal_strings(a1, "com.apple.logd.events");
              if ((result & 1) == 0)
              {
                uint64_t result = _xpc_equal_strings(a1, "com.apple.diagnosticd");
                if ((result & 1) == 0)
                {
                  uint64_t result = _xpc_equal_strings(a1, "com.apple.system.logger");
                  if ((result & 1) == 0)
                  {
                    if (_xpc_telemetry_log_handle__once != -1) {
                      dispatch_once(&_xpc_telemetry_log_handle__once, &__block_literal_global);
                    }
                    uint64_t result = os_signpost_enabled((os_log_t)_xpc_telemetry_log_handle__log);
                    if ((_DWORD)result) {
                      return _os_signpost_emit_unreliably_with_name_impl();
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

int64_t _xpc_activate_endpoint(const char *a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5, BOOL *a6)
{
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v12, "type", a2);
  xpc_dictionary_set_uint64(v12, "handle", a3);
  xpc_dictionary_set_uint64(v12, "flags", a4);
  xpc_dictionary_set_string(v12, "name", a1);
  xpc_object_t xdict = 0LL;
  int64_t v13 = _xpc_domain_routine_activate(v12, &xdict);
  if (!(_DWORD)v13)
  {
    *a5 = xpc_dictionary_extract_mach_recv(xdict, "port");
    if (a6) {
      *a6 = xpc_dictionary_get_BOOL(xdict, "non-launching");
    }
    xpc_release(xdict);
  }

  xpc_release(v12);
  return v13;
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "type", 6uLL);
  xpc_dictionary_set_uint64(v6, "handle", 0LL);
  xpc_dictionary_set_uint64(v6, "flags", 0x20uLL);
  xpc_dictionary_set_string(v6, "name", name);
  xpc_object_t xdict = 0LL;
  int v7 = _xpc_domain_routine_activate(v6, &xdict);
  if (!v7)
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "port");
    if (value && (uint64_t v9 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_array))
    {
      size_t count = xpc_array_get_count(v9);
      if (count >> 62)
      {
        __break(1u);
        return count;
      }

      uint64_t v11 = (int *)_xpc_alloc(4 * count);
      if (xpc_array_get_count(v9))
      {
        size_t v12 = 0LL;
        do
        {
          v11[v12] = xpc_array_dup_fd(v9, v12);
          ++v12;
        }

        while (v12 < xpc_array_get_count(v9));
      }

      *fds = v11;
      size_t v13 = xpc_array_get_count(v9);
      int v7 = 0;
      *cnt = v13;
    }

    else
    {
      int v7 = 118;
    }

    xpc_release(xdict);
  }

  xpc_release(v6);
  LODWORD(count) = v7;
  return count;
}

int64_t launch_get_service_enabled(const char *a1, BOOL *a2, BOOL *a3)
{
  return _launch_get_service_enabled_impl(a1, a2, a3, 6u);
}

int64_t _launch_get_service_enabled_impl(const char *a1, BOOL *a2, BOOL *a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "type", a4);
  xpc_dictionary_set_uint64(v8, "handle", 0LL);
  xpc_dictionary_set_string(v8, "name", a1);
  xpc_object_t xdict = 0LL;
  int64_t v9 = _xpc_domain_routine(811LL, v8, &xdict);
  if (!(_DWORD)v9)
  {
    if (a2) {
      *a2 = xpc_dictionary_get_BOOL(xdict, "loaded");
    }
    if (a3) {
      *a3 = xpc_dictionary_get_BOOL(xdict, "enabled");
    }
    xpc_release(xdict);
  }

  xpc_release(v8);
  return v9;
}

int64_t launch_get_system_service_enabled(const char *a1, BOOL *a2, BOOL *a3)
{
  return _launch_get_service_enabled_impl(a1, a2, a3, 1u);
}

int64_t launch_set_service_enabled(const char *a1, int a2)
{
  return _launch_set_service_enabled_impl(a1, a2, 6u);
}

int64_t _launch_set_service_enabled_impl(const char *a1, int a2, unsigned int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "type", a3);
  xpc_dictionary_set_uint64(v6, "handle", 0LL);
  if (a2) {
    uint64_t v7 = 808LL;
  }
  else {
    uint64_t v7 = 809LL;
  }
  xpc_object_t v8 = xpc_array_create(0LL, 0LL);
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, a1);
  xpc_dictionary_set_value(v6, "names", v8);
  xpc_release(v8);
  xpc_object_t object = 0LL;
  int64_t v9 = _xpc_domain_routine(v7, v6, &object);
  if (!(_DWORD)v9) {
    xpc_release(object);
  }
  xpc_release(v6);
  return v9;
}

int64_t launch_set_system_service_enabled(const char *a1, int a2)
{
  return _launch_set_service_enabled_impl(a1, a2, 1u);
}

int64_t launch_enable_directory(const char *a1)
{
  return _launch_enable_or_disable_directory(a1, 800LL);
}

int64_t _launch_enable_or_disable_directory(const char *a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, a1, 0LL);
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, "type", 7uLL);
  xpc_dictionary_set_uint64(v5, "handle", 0LL);
  xpc_dictionary_set_value(v5, "paths", v4);
  if ((_DWORD)a2 == 800) {
    xpc_object_t v6 = "enable";
  }
  else {
    xpc_object_t v6 = "disable";
  }
  xpc_dictionary_set_BOOL(v5, v6, 1);
  xpc_object_t xdict = 0LL;
  int64_t int64 = _xpc_domain_routine(a2, v5, &xdict);
  if (!(_DWORD)int64)
  {
    if ((_DWORD)a2 == 800) {
      xpc_object_t v8 = "bootstrap-error";
    }
    else {
      xpc_object_t v8 = "bootout-error";
    }
    int64_t int64 = xpc_dictionary_get_int64(xdict, v8);
    xpc_object_t value = xpc_dictionary_get_value(xdict, "errors");
    if (value)
    {
      if ((_DWORD)a2 == 800) {
        uint64_t v10 = _print_enable_error;
      }
      else {
        uint64_t v10 = _print_disable_error;
      }
      xpc_dictionary_apply_f(value, 0LL, (uint64_t)v10);
    }

    xpc_release(xdict);
  }

  xpc_release(v5);
  xpc_release(v4);
  return int64;
}

int64_t launch_disable_directory(const char *a1)
{
  return _launch_enable_or_disable_directory(a1, 801LL);
}

int64_t launch_create_persona(int a1)
{
  xpc_object_t object = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 1uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0LL);
  xpc_dictionary_set_uint64(v2, "uid", a1);
  int64_t v3 = _xpc_domain_routine(838LL, v2, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(v2);
  return v3;
}

int64_t launch_destroy_persona(int a1)
{
  xpc_object_t object = 0LL;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 2uLL);
  xpc_dictionary_set_uint64(v2, "handle", a1);
  int64_t v3 = _xpc_domain_routine(801LL, v2, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(v2);
  return v3;
}

uint64_t launch_path_for_user_service_4coresim()
{
  return 0LL;
}

char *launch_version_for_user_service_4coresim(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 2uLL);
  uid_t v3 = geteuid();
  xpc_dictionary_set_uint64(v2, "handle", v3);
  xpc_dictionary_set_string(v2, "name", a1);
  xpc_object_t xdict = 0LL;
  if (_xpc_service_routine(712LL, v2, &xdict))
  {
    xpc_release(v2);
    return 0LL;
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "attrs");
    xpc_object_t v6 = xpc_retain(value);
    xpc_release(xdict);
    xpc_release(v2);
    string = xpc_dictionary_get_string(v6, "version");
    if (string) {
      xpc_object_t v4 = _xpc_strdup(string);
    }
    else {
      xpc_object_t v4 = 0LL;
    }
    xpc_release(v6);
  }

  return v4;
}

int64_t launch_bootout_user_service_4coresim(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 2uLL);
  uid_t v3 = geteuid();
  xpc_dictionary_set_uint64(v2, "handle", v3);
  xpc_dictionary_set_string(v2, "name", a1);
  xpc_object_t xdict = 0LL;
  int64_t int64 = _xpc_domain_routine(801LL, v2, &xdict);
  if (!(_DWORD)int64)
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "bootout-error");
    xpc_object_t value = xpc_dictionary_get_value(xdict, "errors");
    if (value) {
      xpc_dictionary_apply_f(value, 0LL, (uint64_t)_print_disable_error);
    }
    xpc_release(xdict);
  }

  xpc_release(v2);
  return int64;
}

void _print_disable_error(const char *a1, xpc_object_t xint)
{
  int value = xpc_int64_get_value(xint);
  xpc_object_t v4 = xpc_strerror(value);
  syslog(3, "Failed to disable path: code = %d: %s, %s", value, v4, a1);
}

int64_t launch_service_instance_create(const char *a1, const unsigned __int8 *a2)
{
  xpc_object_t request = _launchd_service_instance_create_request(a1, a2);
  xpc_object_t object = 0LL;
  int64_t v3 = _xpc_service_routine(721LL, request, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(request);
  return v3;
}

xpc_object_t _launchd_service_instance_create_request(const char *a1, const unsigned __int8 *a2)
{
  if (!a1) {
    _xpc_rich_error_serialize_cold_1();
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "type", 7uLL);
  xpc_dictionary_set_uint64(v4, "handle", 0LL);
  xpc_dictionary_set_string(v4, "name", a1);
  xpc_dictionary_set_uuid(v4, "instance", a2);
  return v4;
}

void launch_service_instance_remove( const char *a1, const unsigned __int8 *a2, dispatch_queue_s *a3, const void *a4)
{
  xpc_object_t request = _launchd_service_instance_create_request(a1, a2);
  object[0] = 0LL;
  int v7 = _xpc_service_routine(722LL, request, object);
  if (v7 || (unsigned int v8 = xpc_dictionary_copy_mach_send(object[0], "monitor"), v8 - 1 > 0xFFFFFFFD))
  {
    size_t v13 = _Block_copy(a4);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __launch_service_instance_remove_block_invoke;
    block[3] = &unk_189629618;
    block[4] = v13;
    int v15 = v7;
    dispatch_async(a3, block);
  }

  else
  {
    unsigned int v9 = v8;
    uint64_t v10 = _Block_copy(a4);
    uint64_t v11 = dispatch_source_create(MEMORY[0x1895FE810], v9, 1uLL, a3);
    size_t v12 = (void *)MEMORY[0x1895FED80];
    handler[0] = MEMORY[0x1895FED80];
    handler[1] = 0x40000000LL;
    handler[2] = ___launch_service_monitor_removal_port_block_invoke;
    handler[3] = &unk_189629680;
    handler[4] = v10;
    handler[5] = v11;
    dispatch_source_set_event_handler(v11, handler);
    object[1] = v12;
    object[2] = (xpc_object_t)0x40000000;
    object[3] = ___launch_service_monitor_removal_port_block_invoke_2;
    object[4] = &__block_descriptor_tmp_41;
    unsigned int v17 = v9;
    object[5] = v11;
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v11);
  }

  if (object[0]) {
    xpc_release(object[0]);
  }
  xpc_release(request);
}

void __launch_service_instance_remove_block_invoke(uint64_t a1)
{
}

xpc_object_t launch_service_instance_copy_uuids(const char *a1, _DWORD *a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 7uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0LL);
  xpc_dictionary_set_string(empty, "name", a1);
  xpc_object_t xdict = 0LL;
  int v5 = _xpc_service_routine(723LL, empty, &xdict);
  xpc_release(empty);
  if (v5)
  {
    xpc_object_t v6 = 0LL;
    if (a2) {
      *a2 = v5;
    }
  }

  else
  {
    xpc_object_t array = xpc_dictionary_get_array(xdict, "uuids");
    xpc_object_t v6 = xpc_retain(array);
    xpc_release(xdict);
  }

  return v6;
}

int64_t launch_active_user_switch()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0LL);
  xpc_object_t object = 0LL;
  int64_t v1 = _xpc_domain_routine(841LL, empty, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(empty);
  return v1;
}

int64_t launch_active_user_login()
{
  xpc_object_t system = _xpc_domain_request_create_system();
  xpc_object_t object = 0LL;
  int64_t v1 = _xpc_domain_routine(842LL, system, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(system);
  return v1;
}

int64_t launch_active_user_logout()
{
  xpc_object_t system = _xpc_domain_request_create_system();
  xpc_object_t object = 0LL;
  int64_t v1 = _xpc_domain_routine(843LL, system, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(system);
  return v1;
}

int64_t launch_load_mounted_jetsam_properties(const char *a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0LL);
  xpc_dictionary_set_string(empty, "mount-point", a1);
  xpc_object_t object = 0LL;
  int64_t v3 = _xpc_domain_routine(846LL, empty, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(empty);
  return v3;
}

void launch_cryptex_terminate(const char *a1, dispatch_queue_s *a2, const void *a3)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0LL);
  xpc_dictionary_set_string(empty, "cryptex", a1);
  uint64_t v7 = _xpc_mach_port_allocate(0, 1u, 0LL);
  int v8 = _xpc_event_routine_async(847LL, empty, v7);
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = _Block_copy(a3);
    uint64_t block = MEMORY[0x1895FED80];
    uint64_t v14 = 0x40000000LL;
    int v15 = ___launch_domain_routine_async_block_invoke;
    uint64_t v16 = &unk_1896296C8;
    unsigned int v17 = v10;
    LODWORD(v18) = v9;
    dispatch_async(a2, &block);
  }

  else
  {
    uint64_t v11 = dispatch_source_create(MEMORY[0x1895FE808], v7, 0LL, a2);
    size_t v12 = _Block_copy(a3);
    uint64_t block = MEMORY[0x1895FED80];
    uint64_t v14 = 0x40000000LL;
    int v15 = ___launch_domain_routine_async_block_invoke_2;
    uint64_t v16 = &unk_1896296F0;
    int v19 = v7;
    unsigned int v17 = v12;
    int64_t v18 = v11;
    dispatch_source_set_event_handler(v11, &block);
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v11);
  }

  xpc_release(empty);
}

int64_t launch_userspace_reboot_with_purpose(uint64_t a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0LL);
  xpc_dictionary_set_uint64(empty, "flags", 0x2100000000000000uLL);
  xpc_dictionary_set_uint64(empty, "userreboot_purpose", a1);
  xpc_object_t object = 0LL;
  int64_t v3 = _xpc_domain_routine(821LL, empty, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(empty);
  return v3;
}

uint64_t ___xpc_telemetry_log_handle_block_invoke()
{
  uint64_t result = MEMORY[0x189600838];
  _xpc_telemetry_log_handle__log = MEMORY[0x189600838];
  return result;
}

void _print_enable_error(const char *a1, xpc_object_t xint)
{
  int value = xpc_int64_get_value(xint);
  xpc_object_t v4 = xpc_strerror(value);
  syslog(3, "Failed to enable path: code = %d: %s, %s", value, v4, a1);
}

void ___launch_service_monitor_removal_port_block_invoke(uint64_t a1)
{
}

void ___launch_service_monitor_removal_port_block_invoke_2(uint64_t a1)
{
}

void ___launch_domain_routine_async_block_invoke(uint64_t a1)
{
}

void ___launch_domain_routine_async_block_invoke_2(uint64_t a1)
{
  xpc_object_t xdict = 0LL;
  if (!xpc_pipe_receive(*(_DWORD *)(a1 + 48), &xdict, 0))
  {
    xpc_dictionary_get_int64(xdict, "error");
    xpc_release(xdict);
    xpc_object_t xdict = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void ___launch_domain_routine_async_block_invoke_3(uint64_t a1)
{
}

__objc2_class *_xpc_type_from_id(unsigned int a1)
{
  if (a1 >= 0x1E000) {
    _xpc_type_from_id_cold_1();
  }
  return &OBJC_CLASS___OS_xpc_object[2 * (a1 >> 12)];
}

uint64_t _xpc_wire_length_from_wire_id(unsigned int a1)
{
  if (a1 >= 0x1E000) {
    _xpc_type_from_id_cold_1();
  }
  return *((void *)&_xpc_vtables + 20 * (a1 >> 12) + 11);
}

uint64_t _xpc_deserialize_from_wire_id(unsigned int a1)
{
  if ((_BYTE)a1) {
    _xpc_deserialize_from_wire_id_cold_2(a1);
  }
  if (a1 >= 0x1E000) {
    _xpc_type_from_id_cold_1();
  }
  return *((void *)&_xpc_vtables + 20 * (a1 >> 12) + 10);
}

BOOL _xpc_class_id_from_wire_valid(int a1)
{
  return (a1 & 0xFFF00F00) == 0 && (a1 - 4096) < 0x1D000;
}

BOOL _xpc_class_id_valid(int a1)
{
  return (a1 & 0xFFF00FFF) == 0 && (a1 - 4096) < 0x1D000;
}

uint64_t _xpc_base_copy()
{
  return 0LL;
}

uint64_t _xpc_base_hash()
{
  return 0LL;
}

uint64_t _xpc_base_desc(unint64_t *a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895FEE08];
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *MEMORY[0x189616658];
    unint64_t v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v3)) {
        break;
      }
      ++v3;
    }

    while (v3 != 7);
    unint64_t v6 = v3 | v5;
    uint64_t v7 = v3 & 7;
    int v8 = (v6 >> 55) + 8;
    if (v7 == 7) {
      LODWORD(v7) = v8;
    }
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v7 != 13)
      {
        uint64_t v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v10 = *a1;
    if (*a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v10 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (void)OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v18 = 0u;
  unsigned int v13 = snprintf(__str, 0x80uLL, "<%s>", *((const char **)extension_vtable + 1));
  if (v13 >= 0x7F) {
    int v14 = 127;
  }
  else {
    int v14 = v13;
  }
  return _xpc_serializer_append(a2, __str, (v14 + 1), 0);
}

uint64_t _xpc_base_debug_desc(id a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1895FEE08];
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = *MEMORY[0x189616658];
    unint64_t v6 = v5 ^ (unint64_t)a1;
    do
    {
      if ((v6 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v4)) {
        break;
      }
      ++v4;
    }

    while (v4 != 7);
    unint64_t v7 = v4 | v6;
    uint64_t v8 = v4 & 7;
    int v9 = (v7 >> 55) + 8;
    if (v8 == 7) {
      LODWORD(v8) = v9;
    }
    if ((_DWORD)v8 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v8 != 13)
      {
        unsigned int v17 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v17);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v11 = *(void *)a1;
    if (*(void *)a1 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v11 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*(void *)a1 & 7LL) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v11 - (void)&OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v19 = 0u;
  unsigned int v14 = snprintf(__str, 0x80uLL, "<%s: %p>", *((const char **)extension_vtable + 1), a1);
  if (v14 >= 0x7F) {
    int v15 = 127;
  }
  else {
    int v15 = v14;
  }
  return _xpc_serializer_append(a2, __str, (v15 + 1), 0);
}

uint64_t _xpc_base_debug(id a1, char *__str, size_t __size)
{
  if (__size < 2)
  {
    size_t v13 = 0LL;
  }

  else
  {
    if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = *MEMORY[0x189616658];
      unint64_t v8 = v7 ^ (unint64_t)a1;
      do
      {
        if ((v8 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v6)) {
          break;
        }
        ++v6;
      }

      while (v6 != 7);
      unint64_t v9 = v6 | v8;
      uint64_t v10 = v6 & 7;
      int v11 = (v9 >> 55) + 8;
      if (v10 == 7) {
        LODWORD(v10) = v11;
      }
      if ((_DWORD)v10 == 12)
      {
        extension_vtable = &_OS_xpc_type_uint64;
      }

      else
      {
        if ((_DWORD)v10 != 13) {
          goto LABEL_58;
        }
        extension_vtable = &_OS_xpc_type_int64;
      }
    }

    else
    {
      unsigned int v14 = *(__objc2_class **)a1;
      if (*(void *)a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
        && v14 <= &OBJC_CLASS___OS_xpc_rich_error
        && (*(void *)a1 & 7LL) == 0)
      {
        extension_vtable = (int *)((char *)&_xpc_vtables + 2 * ((char *)v14 - (char *)OBJC_CLASS___OS_xpc_object));
      }

      else
      {
        extension_vtable = _xpc_get_extension_vtable(a1);
      }
    }

    if ((*((_DWORD *)a1 + 4) & 1) != 0) {
      unsigned int v17 = " (from wire)";
    }
    else {
      unsigned int v17 = (const char *)&unk_18018902B;
    }
    size_t v13 = snprintf( __str,  __size,  "%s[%p]%s: { refcnt = %x, xrefcnt = %x",  *((const char **)extension_vtable + 1),  a1,  v17,  *((_DWORD *)a1 + 2),  *((_DWORD *)a1 + 3));
    if (v13 >= __size) {
      size_t v13 = __size - 1;
    }
  }

  __int128 v18 = &__str[v13];
  size_t v19 = __size - v13;
  __int128 v20 = *(__objc2_class **)a1;
  if (*(__objc2_class **)a1 == OBJC_CLASS___OS_xpc_object) {
    goto LABEL_52;
  }
  if (((unint64_t)a1 & 0x8000000000000000LL) == 0)
  {
    if (v20 >= OBJC_CLASS___OS_xpc_object && v20 <= &OBJC_CLASS___OS_xpc_rich_error && (*(void *)a1 & 7LL) == 0) {
      v27 = (int *)((char *)&_xpc_vtables + 2 * ((char *)v20 - (char *)OBJC_CLASS___OS_xpc_object));
    }
    else {
      v27 = _xpc_get_extension_vtable(a1);
    }
    goto LABEL_51;
  }

  uint64_t v21 = 0LL;
  uint64_t v22 = *MEMORY[0x189616658];
  unint64_t v23 = v22 ^ (unint64_t)a1;
  do
  {
    if ((v23 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v21)) {
      break;
    }
    ++v21;
  }

  while (v21 != 7);
  unint64_t v24 = v21 | v23;
  uint64_t v25 = v21 & 7;
  int v26 = (v24 >> 55) + 8;
  if (v25 == 7) {
    LODWORD(v25) = v26;
  }
  if ((_DWORD)v25 == 12)
  {
    v27 = &_OS_xpc_type_uint64;
    goto LABEL_51;
  }

  if ((_DWORD)v25 != 13)
  {
LABEL_58:
    v33 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v33);
  }

  v27 = &_OS_xpc_type_int64;
LABEL_51:
  uint64_t v30 = (*((uint64_t (**)(id, char *, size_t))v27 + 8))(a1, v18, v19);
  v18 += v30;
  v19 -= v30;
LABEL_52:
  if (v19 < 2)
  {
    size_t v31 = 0LL;
  }

  else
  {
    size_t v31 = snprintf(v18, v19, " }");
    if (v19 <= v31) {
      size_t v31 = v19 - 1;
    }
  }

  return &v18[v31] - __str;
}

uint64_t _xpc_base_deserialize()
{
  return 0LL;
}

uint64_t _xpc_base_wire_length()
{
  return -1LL;
}

uint64_t _xpc_object_pad(char *__str, size_t __size, uint64_t a3)
{
  uint64_t v4 = __str;
  if (a3)
  {
    uint64_t v5 = a3;
    uint64_t v4 = __str;
    do
    {
      if (__size < 2)
      {
        size_t v7 = 0LL;
      }

      else
      {
        size_t v7 = snprintf(v4, __size, "\t");
        if (__size <= v7) {
          size_t v7 = __size - 1;
        }
      }

      v4 += v7;
      __size -= v7;
      --v5;
    }

    while (v5);
  }

  return v4 - __str;
}

uint64_t _xpc_base_create()
{
  return _os_object_alloc_realized();
}

unsigned int *_xpc_wire_length(uint64_t a1)
{
  uint64_t result = (unsigned int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t _xpc_retain(uint64_t result)
{
  if ((result & 0x8000000000000000LL) == 0) {
    return _os_object_retain_internal();
  }
  return result;
}

uint64_t _xpc_retain_with_resurrect(uint64_t result)
{
  if ((result & 0x8000000000000000LL) == 0) {
    return _os_object_retain_with_resurrect();
  }
  return result;
}

uint64_t _xpc_release(uint64_t result)
{
  if ((result & 0x8000000000000000LL) == 0) {
    return _os_object_release_internal();
  }
  return result;
}

uint64_t _xpc_dispose(id a1)
{
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = *MEMORY[0x189616658];
    unint64_t v4 = v3 ^ (unint64_t)a1;
    do
    {
      if ((v4 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v2)) {
        break;
      }
      ++v2;
    }

    while (v2 != 7);
    unint64_t v5 = v2 | v4;
    uint64_t v6 = v2 & 7;
    int v7 = (v5 >> 55) + 8;
    if (v6 == 7) {
      LODWORD(v6) = v7;
    }
    if ((_DWORD)v6 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v6 != 13)
      {
        size_t v13 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v13);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v9 = *(void *)a1;
    if (*(void *)a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v9 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*(void *)a1 & 7LL) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v9 - (void)OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }

  return (*((uint64_t (**)(id))extension_vtable + 12))(a1);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  if (((unint64_t)object & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = *MEMORY[0x189616658];
    unint64_t v4 = v3 ^ (unint64_t)object;
    do
    {
      if ((v4 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v2)) {
        break;
      }
      ++v2;
    }

    while (v2 != 7);
    unint64_t v5 = v2 | v4;
    uint64_t v6 = v2 & 7;
    int v7 = (v5 >> 55) + 8;
    if (v6 == 7) {
      LODWORD(v6) = v7;
    }
    if ((_DWORD)v6 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v6 != 13)
      {
        size_t v13 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v13);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v9 = *(void *)object;
    if (*(void *)object >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v9 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*(void *)object & 7LL) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v9 - (void)&OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(object);
    }
  }

  return (xpc_object_t)(*((uint64_t (**)(xpc_object_t))extension_vtable + 2))(object);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  Class Class = object_getClass(object1);
  if (Class != object_getClass(object2)) {
    return 0;
  }
  if (((unint64_t)object1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *MEMORY[0x189616658];
    unint64_t v8 = v7 ^ (unint64_t)object1;
    do
    {
      if ((v8 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v6)) {
        break;
      }
      ++v6;
    }

    while (v6 != 7);
    unint64_t v9 = v6 | v8;
    uint64_t v10 = v6 & 7;
    int v11 = (v9 >> 55) + 8;
    if (v10 == 7) {
      LODWORD(v10) = v11;
    }
    if ((_DWORD)v10 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v10 != 13)
      {
        uint64_t v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v13 = *(void *)object1;
    if (*(void *)object1 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v13 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*(void *)object1 & 7LL) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v13 - (void)&OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(object1);
    }
  }

  return (*((uint64_t (**)(xpc_object_t, xpc_object_t))extension_vtable + 3))(object1, object2);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  if (type >= (xpc_type_t)OBJC_CLASS___OS_xpc_object
    && type <= (xpc_type_t)&OBJC_CLASS___OS_xpc_rich_error
    && (type & 7) == 0LL)
  {
    extension_type_vtable = (char *)&_xpc_vtables + 2 * (type - (xpc_type_t)OBJC_CLASS___OS_xpc_object);
  }

  else
  {
    extension_type_vtable = (char *)_xpc_get_extension_type_vtable((uint64_t)type);
    if (!extension_type_vtable) {
      return "<unknown>";
    }
  }

  return (const char *)*((void *)extension_type_vtable + 1);
}

char *xpc_copy_short_description(unint64_t *a1)
{
  uint64_t v2 = (const char **)_xpc_serializer_create_for_description();
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *MEMORY[0x189616658];
    unint64_t v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v3)) {
        break;
      }
      ++v3;
    }

    while (v3 != 7);
    unint64_t v6 = v3 | v5;
    uint64_t v7 = v3 & 7;
    int v8 = (v6 >> 55) + 8;
    if (v7 == 7) {
      LODWORD(v7) = v8;
    }
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v7 != 13)
      {
        uint64_t v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v10 = *a1;
    if (*a1 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v10 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (void)&OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }

  unint64_t v13 = (void (*)(unint64_t *, const char **))*((void *)extension_vtable + 5);
  if (!v13) {
    unint64_t v13 = (void (*)(unint64_t *, const char **))*((void *)extension_vtable + 6);
  }
  v13(a1, v2);
  unsigned int v14 = _xpc_strdup(v2[4]);
  xpc_release(v2);
  return v14;
}

char *xpc_copy_clean_description(unint64_t *a1)
{
  uint64_t v2 = (const char **)_xpc_serializer_create_for_description();
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *MEMORY[0x189616658];
    unint64_t v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v3)) {
        break;
      }
      ++v3;
    }

    while (v3 != 7);
    unint64_t v6 = v3 | v5;
    uint64_t v7 = v3 & 7;
    int v8 = (v6 >> 55) + 8;
    if (v7 == 7) {
      LODWORD(v7) = v8;
    }
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v7 != 13)
      {
        int v15 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v15);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v10 = *a1;
    if (*a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v10 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (void)OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }

  (*((void (**)(unint64_t *, const char **))extension_vtable + 6))(a1, v2);
  unint64_t v13 = _xpc_strdup(v2[4]);
  xpc_release(v2);
  return v13;
}

char *xpc_copy_debug_description(unint64_t *a1)
{
  uint64_t v2 = (const char **)_xpc_serializer_create_for_description();
  if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *MEMORY[0x189616658];
    unint64_t v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v3)) {
        break;
      }
      ++v3;
    }

    while (v3 != 7);
    unint64_t v6 = v3 | v5;
    uint64_t v7 = v3 & 7;
    int v8 = (v6 >> 55) + 8;
    if (v7 == 7) {
      LODWORD(v7) = v8;
    }
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v7 != 13)
      {
        uint64_t v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v10 = *a1;
    if (*a1 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
      && v10 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (void)&OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }

  unint64_t v13 = (void (*)(unint64_t *, const char **))*((void *)extension_vtable + 7);
  if (!v13) {
    unint64_t v13 = (void (*)(unint64_t *, const char **))*((void *)extension_vtable + 6);
  }
  v13(a1, v2);
  unsigned int v14 = _xpc_strdup(v2[4]);
  xpc_release(v2);
  return v14;
}

uint64_t _xpc_make_serialization_with_ool_impl(unint64_t *a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = (void *)_xpc_serializer_create_for_data();
    v6[13] = a3;
    if (((unint64_t)a1 & 0x8000000000000000LL) != 0)
    {
LABEL_3:
      uint64_t v7 = 0LL;
      uint64_t v8 = *MEMORY[0x189616658];
      unint64_t v9 = v8 ^ (unint64_t)a1;
      do
      {
        if ((v9 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v7)) {
          break;
        }
        ++v7;
      }

      while (v7 != 7);
      unint64_t v10 = v7 | v9;
      uint64_t v11 = v7 & 7;
      int v12 = (v10 >> 55) + 8;
      if (v11 == 7) {
        LODWORD(v11) = v12;
      }
      if ((_DWORD)v11 == 12)
      {
        extension_vtable = &_OS_xpc_type_uint64;
      }

      else
      {
        if ((_DWORD)v11 != 13)
        {
          __int128 v20 = _xpc_asprintf("Object is not an XPC object");
          _xpc_api_misuse(v20);
        }

        extension_vtable = &_OS_xpc_type_int64;
      }

      goto LABEL_26;
    }
  }

  else
  {
    if (_contains_ool(a1)) {
      return 0LL;
    }
    unint64_t v6 = (void *)_xpc_serializer_create_for_data();
  }

  unint64_t v15 = *a1;
  if (*a1 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
    && v15 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
    && (*a1 & 7) == 0)
  {
    extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v15 - (void)&OBJC_CLASS___OS_xpc_object));
  }

  else
  {
    extension_vtable = _xpc_get_extension_vtable(a1);
  }

LABEL_26:
  (*((void (**)(unint64_t *, void *))extension_vtable + 9))(a1, v6);
  __int128 v18 = (void (__cdecl *)(void *))v6[8];
  *a2 = v6[5] - v6[7];
  if (v18 != _xpc_serializer_free) {
    _xpc_rich_error_serialize_cold_1();
  }
  uint64_t v14 = v6[4];
  v6[4] = 0LL;
  v6[8] = 0LL;
  xpc_release(v6);
  return v14;
}

uint64_t xpc_make_serialization(unint64_t *a1, void *a2)
{
  return _xpc_make_serialization_with_ool_impl(a1, a2, 0LL);
}

id _xpc_create_from_serialization_with_ool_impl(const void *a1, size_t a2, uint64_t a3)
{
  id result = _xpc_payload_create_from_data(a1, a2);
  if (result)
  {
    unint64_t v5 = result;
    uint64_t v6 = xpc_graph_unpack_with_ool(0LL, (uint64_t)result, a3);
    xpc_release(v5);
    return (id)v6;
  }

  return result;
}

id xpc_create_from_serialization(const void *a1, size_t a2)
{
  return _xpc_create_from_serialization_with_ool_impl(a1, a2, 0LL);
}

uint64_t xpc_exit_reason_get_label(int a1)
{
  return __xpc_enum2label(a1, (uint64_t)&xpc_exit_reason_get_label_reasons, 9LL);
}

BOOL _contains_ool(void *a1)
{
  Class Class = (__objc2_class *)object_getClass(a1);
  uint64_t v14 = 0LL;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 0;
  if (Class == &OBJC_CLASS___OS_xpc_fd)
  {
LABEL_6:
    BOOL v5 = 1LL;
  }

  else
  {
    uint64_t v3 = 1LL;
    while (v3 != 8)
    {
      uint64_t v4 = _xpc_ool_types[v3++];
      if (v4 == Class)
      {
        break;
      }
    }

    if (Class == &OBJC_CLASS___OS_xpc_dictionary)
    {
      applier[0] = MEMORY[0x1895FED80];
      applier[1] = 0x40000000LL;
      applier[2] = ___contains_ool_block_invoke;
      applier[3] = &unk_1896297C8;
      applier[4] = &v14;
      xpc_dictionary_apply(a1, applier);
      uint64_t v6 = v15;
    }

    else if (Class == &OBJC_CLASS___OS_xpc_array)
    {
      size_t count = xpc_array_get_count(a1);
      uint64_t v6 = v15;
      if (count && !*((_BYTE *)v15 + 24))
      {
        size_t v8 = 0LL;
        size_t v9 = count - 1;
        do
        {
          xpc_object_t value = xpc_array_get_value(a1, v8);
          int v11 = _contains_ool(value);
          uint64_t v6 = v15;
          *((_BYTE *)v15 + 24) = v11;
          if (v9 == v8) {
            break;
          }
          ++v8;
        }

        while (!v11);
      }
    }

    else
    {
      uint64_t v6 = &v14;
    }

    BOOL v5 = *((unsigned __int8 *)v6 + 24) != 0;
  }

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t ___contains_ool_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = _contains_ool(a3);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
  return v4 ^ 1u;
}

unint64_t _xpc_array_copy(uint64_t a1)
{
  unint64_t v2 = _xpc_array_create(*(unsigned int *)(a1 + 36));
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v3 = 0LL;
    do
    {
      xpc_object_t v4 = xpc_copy(*(xpc_object_t *)(*(void *)(a1 + 24) + 8 * v3));
      _xpc_array_insert(v2, v3, v4);
      xpc_release(v4);
      ++v3;
    }

    while (v3 < *(unsigned int *)(a1 + 32));
  }

  return v2;
}

BOOL _xpc_array_equal(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 != *(_DWORD *)(a2 + 32)) {
    return 0LL;
  }
  if (v2)
  {
    unint64_t v5 = 0LL;
    do
    {
      BOOL v6 = xpc_equal(*(xpc_object_t *)(*(void *)(a1 + 24) + 8 * v5), *(xpc_object_t *)(*(void *)(a2 + 24) + 8 * v5));
      unint64_t v7 = *(unsigned int *)(a1 + 32);
      if (!v6) {
        break;
      }
      ++v5;
    }

    while (v5 < v7);
  }

  else
  {
    unint64_t v7 = 0LL;
    unint64_t v5 = 0LL;
  }

  return v5 == v7;
}

uint64_t _xpc_array_hash(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 32)) {
    return 0LL;
  }
  unint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  do
    v3 += xpc_hash(*(xpc_object_t *)(*(void *)(a1 + 24) + 8 * v2++));
  while (v2 < *(unsigned int *)(a1 + 32));
  return v3;
}

uint64_t _xpc_array_short_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "[<count = %u>]", *(_DWORD *)(a1 + 32));
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_array_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1895FEE08];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v32 = 0u;
  unsigned int v4 = snprintf(__str, 0x80uLL, "[<capacity = %u>\n", *(_DWORD *)(a1 + 36));
  if (v4 >= 0x7F) {
    size_t v5 = 127LL;
  }
  else {
    size_t v5 = v4;
  }
  _xpc_serializer_append(a2, __str, v5, 0);
  uint64_t v6 = _xpc_serializer_pad(a2);
  if (*(_DWORD *)(a1 + 32))
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = MEMORY[0x189616648];
    do
    {
      uint64_t v10 = _xpc_object_pad(__str, 0x80uLL, v7);
      __int128 v11 = &__str[v10];
      size_t v12 = 128 - v10;
      if ((unint64_t)(128 - v10) < 2)
      {
        size_t v14 = 0LL;
      }

      else
      {
        uint64_t v13 = v10;
        size_t v14 = snprintf(&__str[v10], v12, "%lu: ", v8);
        if (v12 <= v14) {
          size_t v14 = 127 - v13;
        }
      }

      _xpc_serializer_append(a2, __str, &v11[v14] - __str, 0);
      unint64_t v15 = *(unint64_t **)(*(void *)(a1 + 24) + 8 * v8);
      if (((unint64_t)v15 & 0x8000000000000000LL) != 0)
      {
        uint64_t v16 = 0LL;
        uint64_t v17 = *MEMORY[0x189616658];
        unint64_t v18 = v17 ^ (unint64_t)v15;
        do
        {
          if ((v18 & 7) == *(_BYTE *)(v9 + v16)) {
            break;
          }
          ++v16;
        }

        while (v16 != 7);
        unint64_t v19 = v16 | v18;
        uint64_t v20 = v16 & 7;
        int v21 = (v19 >> 55) + 8;
        if (v20 == 7) {
          LODWORD(v20) = v21;
        }
        extension_vtable = &_OS_xpc_type_uint64;
        if ((_DWORD)v20 != 12)
        {
          if ((_DWORD)v20 != 13)
          {
            uint64_t v30 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v30);
          }

          extension_vtable = &_OS_xpc_type_int64;
        }
      }

      else
      {
        unint64_t v23 = *v15;
        if (*v15 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
          && v23 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
          && (*v15 & 7) == 0)
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v23 - (void)&OBJC_CLASS___OS_xpc_object));
        }

        else
        {
          extension_vtable = _xpc_get_extension_vtable(v15);
        }
      }

      (*((void (**)(unint64_t *, uint64_t))extension_vtable + 6))(v15, a2);
      uint64_t v26 = *(void *)(a2 + 56) + 1LL;
      --*(void *)(a2 + 48);
      *(void *)(a2 + 56) = v26;
      _xpc_serializer_append(a2, "\n", 1uLL, 0);
      ++v8;
    }

    while (v8 < *(unsigned int *)(a1 + 32));
  }

  _xpc_serializer_unpad(a2);
  uint64_t v27 = _xpc_object_pad(*(char **)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 112));
  uint64_t v28 = *(void *)(a2 + 56) - v27;
  *(void *)(a2 + 48) += v27;
  *(void *)(a2 + 56) = v28;
  return _xpc_serializer_append(a2, "]", 2uLL, 0);
}

uint64_t _xpc_array_debug_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x1895FEE08];
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v33 = 0u;
  unsigned int v4 = snprintf( __str,  0x80uLL,  "<%s: %p> { count = %u, capacity = %u, contents =\n",  "array",  (const void *)a1,  *(_DWORD *)(a1 + 32),  *(_DWORD *)(a1 + 36));
  if (v4 >= 0x7F) {
    size_t v5 = 127LL;
  }
  else {
    size_t v5 = v4;
  }
  _xpc_serializer_append(a2, __str, v5, 0);
  uint64_t v6 = _xpc_serializer_pad(a2);
  if (*(_DWORD *)(a1 + 32))
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = MEMORY[0x189616648];
    do
    {
      uint64_t v10 = _xpc_object_pad(__str, 0x80uLL, v7);
      __int128 v11 = &__str[v10];
      size_t v12 = 128 - v10;
      if ((unint64_t)(128 - v10) < 2)
      {
        size_t v14 = 0LL;
      }

      else
      {
        uint64_t v13 = v10;
        size_t v14 = snprintf(&__str[v10], v12, "%lu: ", v8);
        if (v12 <= v14) {
          size_t v14 = 127 - v13;
        }
      }

      _xpc_serializer_append(a2, __str, &v11[v14] - __str, 0);
      unint64_t v15 = *(unint64_t **)(*(void *)(a1 + 24) + 8 * v8);
      if (((unint64_t)v15 & 0x8000000000000000LL) != 0)
      {
        uint64_t v16 = 0LL;
        uint64_t v17 = *MEMORY[0x189616658];
        unint64_t v18 = v17 ^ (unint64_t)v15;
        do
        {
          if ((v18 & 7) == *(_BYTE *)(v9 + v16)) {
            break;
          }
          ++v16;
        }

        while (v16 != 7);
        unint64_t v19 = v16 | v18;
        uint64_t v20 = v16 & 7;
        int v21 = (v19 >> 55) + 8;
        if (v20 == 7) {
          LODWORD(v20) = v21;
        }
        extension_vtable = &_OS_xpc_type_uint64;
        if ((_DWORD)v20 != 12)
        {
          if ((_DWORD)v20 != 13)
          {
            size_t v31 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v31);
          }

          extension_vtable = &_OS_xpc_type_int64;
        }
      }

      else
      {
        unint64_t v23 = *v15;
        if (*v15 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
          && v23 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
          && (*v15 & 7) == 0)
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v23 - (void)&OBJC_CLASS___OS_xpc_object));
        }

        else
        {
          extension_vtable = _xpc_get_extension_vtable(v15);
        }
      }

      uint64_t v26 = (void (*)(unint64_t *, uint64_t))*((void *)extension_vtable + 7);
      if (!v26) {
        uint64_t v26 = (void (*)(unint64_t *, uint64_t))*((void *)extension_vtable + 6);
      }
      v26(v15, a2);
      uint64_t v27 = *(void *)(a2 + 56) + 1LL;
      --*(void *)(a2 + 48);
      *(void *)(a2 + 56) = v27;
      _xpc_serializer_append(a2, "\n", 1uLL, 0);
      ++v8;
    }

    while (v8 < *(unsigned int *)(a1 + 32));
  }

  _xpc_serializer_unpad(a2);
  uint64_t v28 = _xpc_object_pad(*(char **)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 112));
  uint64_t v29 = *(void *)(a2 + 56) - v28;
  *(void *)(a2 + 48) += v28;
  *(void *)(a2 + 56) = v29;
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

uint64_t _xpc_array_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", size_t count = %u", *(_DWORD *)(a1 + 32));
}

_DWORD *_xpc_array_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 57344;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int v22 = 0;
  uint64_t graph_length = _xpc_serializer_get_graph_length(a2);
  _xpc_serializer_append(a2, &v22, 4uLL, 1);
  int v21 = *(_DWORD *)(a1 + 32);
  _xpc_serializer_append(a2, &v21, 4uLL, 1);
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = MEMORY[0x189616648];
    do
    {
      uint64_t v6 = *(unint64_t **)(*(void *)(a1 + 24) + 8 * v4);
      if (((unint64_t)v6 & 0x8000000000000000LL) != 0)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = *MEMORY[0x189616658];
        unint64_t v9 = v8 ^ (unint64_t)v6;
        do
        {
          if ((v9 & 7) == *(_BYTE *)(v5 + v7)) {
            break;
          }
          ++v7;
        }

        while (v7 != 7);
        unint64_t v10 = v7 | v9;
        uint64_t v11 = v7 & 7;
        int v12 = (v10 >> 55) + 8;
        if (v11 == 7) {
          LODWORD(v11) = v12;
        }
        extension_vtable = &_OS_xpc_type_uint64;
        if ((_DWORD)v11 != 12)
        {
          if ((_DWORD)v11 != 13)
          {
            unint64_t v19 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v19);
          }

          extension_vtable = &_OS_xpc_type_int64;
        }
      }

      else
      {
        unint64_t v14 = *v6;
        if (*v6 >= (unint64_t)&OBJC_CLASS___OS_xpc_object
          && v14 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
          && (*v6 & 7) == 0)
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v14 - (void)&OBJC_CLASS___OS_xpc_object));
        }

        else
        {
          extension_vtable = _xpc_get_extension_vtable(v6);
        }
      }

      (*((void (**)(unint64_t *, uint64_t))extension_vtable + 9))(v6, a2);
      ++v4;
    }

    while (v4 < *(unsigned int *)(a1 + 32));
  }

  id result = (_DWORD *)_xpc_serializer_get_graph_length(a2);
  unint64_t v18 = (unint64_t)result - graph_length - 4;
  if (!HIDWORD(v18))
  {
    id result = (_DWORD *)_xpc_serializer_get_graph_ptr(a2, graph_length);
    _DWORD *result = v18;
  }

  return result;
}

_DWORD *_xpc_array_deserialize(uint64_t a1)
{
  if (!_xpc_graph_deserializer_read(a1, 4uLL)) {
    return 0LL;
  }
  unint64_t v2 = (_DWORD *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v2) {
    return 0LL;
  }
  unint64_t v3 = *v2;
  if (HIBYTE(*v2)) {
    return 0LL;
  }
  int depth = _xpc_graph_deserializer_get_depth(a1);
  uint64_t v5 = (_DWORD *)_xpc_array_create(v3);
  v5[4] |= 1u;
  uint64_t v6 = 0LL;
  if ((_DWORD)v3)
  {
    while (1)
    {
      uint64_t v7 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
      if (!v7) {
        break;
      }
      unsigned int v8 = *v7;
      if (_xpc_class_id_valid(*v7))
      {
        if ((v8 == 57344 || v8 == 0x10000 || v8 == 61440) && !_xpc_graph_deserializer_enter_container(a1)) {
          break;
        }
        unint64_t v9 = (uint64_t (*)(uint64_t))_xpc_deserialize_from_wire_id(v8);
        unint64_t v10 = (void *)v9(a1);
        if (!v10) {
          break;
        }
        uint64_t v11 = v10;
        _xpc_array_insert((uint64_t)v5, v6, v10);
        xpc_release(v11);
      }

      else
      {
        if (!_xpc_class_id_from_wire_valid(v8)) {
          break;
        }
        xpc_object_t v12 = xpc_null_create();
        _xpc_array_insert((uint64_t)v5, v6, v12);
        xpc_release(v12);
        BOOL v13 = _xpc_graph_deserializer_skip_value(a1, v8);
        if (!v12 || !v13) {
          break;
        }
      }

      _xpc_graph_deserializer_restore_depth(a1, depth);
      if (v3 == ++v6) {
        return v5;
      }
    }
  }

  if (v6 != v3)
  {
    xpc_release(v5);
    return 0LL;
  }

  return v5;
}

void _xpc_array_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v2 = 0LL;
    do
      xpc_release(*(xpc_object_t *)(*(void *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
  }

  free(*(void **)(a1 + 24));
}

uint64_t xpc_array_apply_f( uint64_t result, uint64_t a2, uint64_t (*a3)(unint64_t, void, uint64_t))
{
  if (*(_DWORD *)(result + 32))
  {
    uint64_t v5 = result;
    unint64_t v6 = 0LL;
    int v7 = *(_DWORD *)(result + 40);
    do
    {
      id result = a3(v6, *(void *)(*(void *)(v5 + 24) + 8 * v6), a2);
      if (*(_DWORD *)(v5 + 40) != v7)
      {
        unsigned int v8 = _xpc_asprintf("Array mutated during iteration");
        _xpc_api_misuse(v8);
      }

      ++v6;
    }

    while (v6 < *(unsigned int *)(v5 + 32));
  }

  return result;
}

void xpc_array_set_pointer(void *a1, size_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)xpc_pointer_create(a3);
  xpc_array_set_value(a1, a2, v5);
  xpc_release(v5);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  if (xpc_get_type(xarray) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (index == -1LL)
  {
    ++*((_DWORD *)xarray + 10);
    xpc_array_append_value(xarray, value);
  }

  else
  {
    if (*((unsigned int *)xarray + 8) <= index)
    {
      unint64_t v6 = _xpc_asprintf("Out-of-bounds array insertion attempt.");
      _xpc_api_misuse(v6);
    }

    ++*((_DWORD *)xarray + 10);
    _xpc_array_insert((uint64_t)xarray, index, value);
  }

uint64_t xpc_array_get_pointer(void *a1, size_t a2)
{
  xpc_object_t value = xpc_array_get_value(a1, a2);
  else {
    return 0LL;
  }
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  if (xpc_get_type(xarray) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    return 0LL;
  }
  if (*((unsigned int *)xarray + 8) <= index)
  {
    uint64_t v5 = _xpc_asprintf("Attempt to access an out-of-bounds index.");
    _xpc_api_misuse(v5);
  }

  return *(xpc_object_t *)(*((void *)xarray + 3) + 8 * index);
}

void xpc_array_set_mach_send(void *a1, size_t a2, mach_port_name_t a3)
{
  uint64_t v5 = (void *)xpc_mach_send_create(a3);
  xpc_array_set_value(a1, a2, v5);
  xpc_release(v5);
}

uint64_t xpc_array_copy_mach_send(void *a1, size_t a2)
{
  xpc_object_t value = (unsigned int *)xpc_array_get_value(a1, a2);
  if (value && (unint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send)) {
    return xpc_mach_send_copy_right(v3);
  }
  else {
    return 0LL;
  }
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  size_t v2 = count + 4;
  unint64_t v3 = count >= 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v6 = (void *)_xpc_array_create(2 * v2);
  if (count)
  {
    uint64_t v7 = 0LL;
    do
    {
      _xpc_array_insert((uint64_t)v6, v7, objects[v7]);
      ++v7;
    }

    while (count != v7);
  }

  return v6;
}

unint64_t _xpc_array_create(unint64_t result)
{
  if (HIDWORD(result) || (unint64_t v1 = result, result = _xpc_base_create(), *(_DWORD *)(result + 20) = 8, v1 >> 29))
  {
    __break(1u);
  }

  else
  {
    unint64_t v2 = result;
    *(void *)(result + 24) = _xpc_alloc(8 * v1);
    *(_DWORD *)(v2 + 36) = v1;
    return v2;
  }

  return result;
}

void _xpc_array_insert(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  unint64_t v4 = *(void **)(*(void *)(a1 + 24) + 8 * a2);
  *(void *)(*(void *)(a1 + 24) + 8 * a2) = xpc_retain(object);
  if (v4)
  {
    --*(_DWORD *)(a1 + 32);
    xpc_release(v4);
  }

  ++*(_DWORD *)(a1 + 32);
}

xpc_object_t xpc_array_create_empty(void)
{
  uint64_t v0 = _xpc_base_create();
  *(_DWORD *)(v0 + 20) = 8;
  *(void *)(v0 + 24) = _xpc_alloc(0x40uLL);
  *(_DWORD *)(v0 + 36) = 8;
  return (xpc_object_t)v0;
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  if (xpc_get_type(xarray) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    goto LABEL_11;
  }
  int v4 = *((_DWORD *)xarray + 9);
  ++*((_DWORD *)xarray + 10);
  uint64_t v5 = *((unsigned int *)xarray + 8);
  if ((_DWORD)v5 != v4)
  {
LABEL_10:
    _xpc_array_insert((uint64_t)xarray, v5, value);
    return;
  }

  if (!(_DWORD)v5)
  {
    unint64_t v6 = 8LL;
LABEL_7:
    if (xpc_get_type(xarray) == (xpc_type_t)&OBJC_CLASS___OS_xpc_array)
    {
      if (v6 < *((unsigned int *)xarray + 9))
      {
        unint64_t v9 = _xpc_asprintf("Attempt to grow an array to a smaller size.");
        _xpc_api_misuse(v9);
      }

      uint64_t v7 = _xpc_alloc(8 * v6);
      unsigned int v8 = (void *)*((void *)xarray + 3);
      memcpy(v7, v8, 8LL * *((unsigned int *)xarray + 8));
      free(v8);
      *((void *)xarray + 3) = v7;
      *((_DWORD *)xarray + 9) = v6;
      LODWORD(v5) = *((_DWORD *)xarray + 8);
      goto LABEL_10;
    }

LABEL_11:
    _xpc_api_misuse("Given object not of required type.");
  }

  if ((v5 & 0x80000000) == 0)
  {
    unint64_t v6 = 2 * v5;
    goto LABEL_7;
  }

  __break(1u);
}

  unint64_t v9 = (const void *)_xpc_base_create();
  int v4 = (uint64_t)v9;
  if (v6 <= 0x80 && v7) {
    sprintf(v7, "%p", v9);
  }
  strcpy((char *)(v4 + 240), __str);
LABEL_15:
  _4libxpc = dispatch_mach_create_4libxpc();
  *(_DWORD *)(v4 + 24) = a1;
  *(_DWORD *)(v4 + 28) = 1;
  *(_WORD *)(v4 + 224) &= ~0x4000u;
  *(_DWORD *)(v4 + 84) = -2;
  *(void *)(v4 + 144) = 0LL;
  *(void *)(v4 + 152) = _4libxpc;
  uuid_clear((unsigned __int8 *)(v4 + 160));
  *(_DWORD *)(v4 + 192) = 0;
  return _xpc_retain(v4);
}

    unint64_t v9 = *(void (**)(uint64_t, const char *, ...))(v2 + 24);
    if (v9) {
      v9(v2, "[%s]: %s\n", "string_prefix_allowed_iterate", "Unexpected type to match against during iteration");
    }
    return 1LL;
  }

  if (v5 != 4) {
    goto LABEL_11;
  }
  unint64_t v6 = *(const void **)(v4 + 8);
  uint64_t v7 = *(void *)(v4 + 16);
LABEL_6:
  unsigned int v8 = a1[7];
  unint64_t v15 = *((_OWORD *)a1 + 6);
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v15, 12LL, &v16) & 1) != 0)
  {
  }

  else
  {
    unint64_t v10 = *(void (**)(unint64_t, const char *, ...))(v8 + 24);
    if (v10)
    {
      v10(v8, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      uint64_t v11 = *(void (**)(unint64_t, const char *, ...))(v8 + 24);
      if (v11)
      {
        if (v8 && v8 >= v8 + 64)
        {
LABEL_28:
          __break(0x5519u);
          goto LABEL_29;
        }

        v11(v8, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
      }
    }
  }

  unsigned int v8 = a1[7];
  unint64_t v15 = *((_OWORD *)a1 + 6);
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v15, 12LL, &v16) & 1) != 0)
  {
    if (!v7 || v7 <= v17 - (uint64_t)v16 && !memcmp(v6, v16, v7))
    {
LABEL_23:
      id result = 0LL;
      *(_BYTE *)(*v3 + 33LL) = 1;
      return result;
    }

    return 1LL;
  }

  BOOL v13 = *(void (**)(unint64_t, const char *, ...))(v8 + 24);
  if (v13) {
    v13(v8, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  }
  if (v8 && v8 >= v8 + 64) {
    goto LABEL_28;
  }
LABEL_29:
  unint64_t v14 = (*(uint64_t (**)(unint64_t, const char *, ...))(v8 + 32))( v8,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return integer_allowed_iterate(v14);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  if (xpc_get_type(xarray) == (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    return *((unsigned int *)xarray + 8);
  }
  else {
    return 0LL;
  }
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  if (xpc_get_type(xarray) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (!*((_DWORD *)xarray + 8)) {
    return 1;
  }
  uint64_t v4 = 0LL;
  int v5 = *((_DWORD *)xarray + 10);
  do
  {
    BOOL result = (*((uint64_t (**)(xpc_array_applier_t, uint64_t, void))applier + 2))( applier,  v4,  *(void *)(*((void *)xarray + 3) + 8 * v4));
    if (*((_DWORD *)xarray + 10) != v5)
    {
      unsigned int v8 = _xpc_asprintf("Array mutated during iteration");
      _xpc_api_misuse(v8);
    }
  }

  while (++v4 < (unint64_t)*((unsigned int *)xarray + 8) && result);
  return result;
}

void xpc_array_set_BOOL(xpc_object_t xarray, size_t index, BOOL value)
{
  xpc_object_t v5 = xpc_BOOL_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  xpc_object_t v5 = xpc_int64_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  xpc_object_t v5 = xpc_uint64_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
  xpc_object_t v5 = xpc_double_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_date(xpc_object_t xarray, size_t index, int64_t value)
{
  xpc_object_t v5 = xpc_date_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  xpc_object_t v6 = xpc_data_create(bytes, length);
  xpc_array_set_value(xarray, index, v6);
  xpc_release(v6);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  xpc_object_t v5 = xpc_string_create(string);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  xpc_object_t v5 = xpc_uuid_create(uuid);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_fd(xpc_object_t xarray, size_t index, int fd)
{
  xpc_object_t v5 = xpc_fd_create(fd);
  if (v5)
  {
    xpc_object_t v6 = v5;
    xpc_array_set_value(xarray, index, v5);
    xpc_release(v6);
  }

void xpc_array_set_connection(xpc_object_t xarray, size_t index, xpc_connection_t connection)
{
  xpc_endpoint_t v5 = xpc_endpoint_create(connection);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  result = value && (unint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_BOOL) && xpc_BOOL_get_value(v3);
  return result;
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  else {
    return 0LL;
  }
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  else {
    return 0LL;
  }
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  else {
    return NAN;
  }
}

int64_t xpc_array_get_date(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (value && (unint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_date)) {
    return xpc_date_get_value(v3);
  }
  else {
    return 0LL;
  }
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  uint64_t v7 = 0LL;
  size_t v8 = 0LL;
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (value)
  {
    xpc_endpoint_t v5 = value;
    if (xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_data
      && !xpc_data_get_bytes_ptr_and_length(v5, &v7, &v8))
    {
      _xpc_rich_error_serialize_cold_1();
    }
  }

  if (length) {
    *length = v8;
  }
  return v7;
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (value && (unint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_string)) {
    return xpc_string_get_string_ptr(v3);
  }
  else {
    return 0LL;
  }
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (value && (unint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_uuid)) {
    return xpc_uuid_get_bytes(v3);
  }
  else {
    return 0LL;
  }
}

int xpc_array_dup_fd(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (value && (unint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_fd)) {
    return xpc_fd_dup(v3);
  }
  else {
    return -1;
  }
}

xpc_connection_t xpc_array_create_connection(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = (_xpc_endpoint_s *)xpc_array_get_value(xarray, index);
  else {
    return 0LL;
  }
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (!value) {
    return 0LL;
  }
  unint64_t v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return 0LL;
  }
  return v3;
}

xpc_object_t xpc_array_get_array(xpc_object_t xarray, size_t index)
{
  xpc_object_t value = xpc_array_get_value(xarray, index);
  if (!value) {
    return 0LL;
  }
  unint64_t v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    return 0LL;
  }
  return v3;
}

double xpc_binprefs_alloc()
{
  uint64_t v0 = _xpc_alloc(0x24uLL);
  double result = 0.0;
  _OWORD *v0 = 0u;
  v0[1] = 0u;
  *((_DWORD *)v0 + 8) = 0;
  return result;
}

double xpc_binprefs_init(uint64_t a1)
{
  *(_DWORD *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void *xpc_binprefs_copy(const void *a1)
{
  return _xpc_memdup(a1, 0x24uLL);
}

uint64_t xpc_binprefs_add(uint64_t result, int a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(result + 32);
  *(_DWORD *)(result + 4 * v3) = a2;
  *(_DWORD *)(result + 4LL * (*(_DWORD *)(result + 32))++ + 16) = a3;
  return result;
}

uint64_t xpc_binprefs_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t xpc_binprefs_cpu_type(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 32) <= a2) {
    _xpc_rich_error_serialize_cold_1();
  }
  return *(unsigned int *)(a1 + 4LL * a2);
}

uint64_t xpc_binprefs_cpu_subtype(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 32) <= a2) {
    _xpc_rich_error_serialize_cold_1();
  }
  return *(unsigned int *)(a1 + 4LL * a2 + 16);
}

BOOL xpc_binprefs_equal(uint64_t a1, uint64_t a2)
{
  BOOL result = (a1 | a2) == 0;
  if (a1 && a2)
  {
    int v5 = *(_DWORD *)(a1 + 32);
    if (v5 == *(_DWORD *)(a2 + 32))
    {
      if (!v5) {
        return 1LL;
      }
      unsigned int v6 = 0;
      while (1)
      {
        int v7 = xpc_binprefs_cpu_type(a1, v6);
        int v8 = xpc_binprefs_cpu_subtype(a1, v6);
        if (++v6 >= *(_DWORD *)(a1 + 32)) {
          return 1LL;
        }
      }
    }

    return 0LL;
  }

  return result;
}

char *xpc_binprefs_copy_description(uint64_t a1)
{
  if (!a1) {
    return _xpc_strdup("(null)");
  }
  unint64_t v2 = (const char **)string_builder_new(0x80uLL);
  string_builder_appendf((uint64_t)v2, "%d: [", v3, v4, v5, v6, v7, v8, *(_DWORD *)(a1 + 32));
  if (*(_DWORD *)(a1 + 32))
  {
    unsigned int v15 = 0;
    do
    {
      if (v15) {
        string_builder_appendf((uint64_t)v2, ", ", v9, v10, v11, v12, v13, v14, v25);
      }
      char v16 = xpc_binprefs_cpu_type(a1, v15);
      xpc_binprefs_cpu_subtype(a1, v15);
      string_builder_appendf((uint64_t)v2, "%d.%d", v17, v18, v19, v20, v21, v22, v16);
      ++v15;
    }

    while (v15 < *(_DWORD *)(a1 + 32));
  }

  string_builder_appendf((uint64_t)v2, "]", v9, v10, v11, v12, v13, v14, v25);
  unint64_t v23 = string_builder_copy_string(v2);
  string_builder_destroy((void **)v2);
  return v23;
}

BOOL xpc_binprefs_is_noop(_DWORD *a1)
{
  return !a1[8] || *a1 == -1;
}

uint64_t xpc_binprefs_set_psattr(cpu_type_t *a1, posix_spawnattr_t *a2)
{
  uint64_t result = posix_spawnattr_setarchpref_np(a2, a1[8], a1, a1 + 4, 0LL);
  if ((_DWORD)result) {
    _xpc_alloc_cold_1();
  }
  return result;
}

void xpc_traverse_serialized_data(const void *a1, size_t a2, uint64_t a3)
{
  int v12 = 1;
  (*(void (**)(uint64_t, void, void))(a3 + 16))(a3, 0LL, 0LL);
  id v6 = _xpc_payload_create_from_data_no_copy(a1, a2);
  if (v6)
  {
    uint64_t v7 = v6;
    memset(v11, 0, sizeof(v11));
    _xpc_graph_deserializer_init((uint64_t)v11, (uint64_t)v6);
    if (_xpc_graph_unpack_header((uint64_t)v11, 3))
    {
      uint64_t v8 = (int *)_xpc_graph_deserializer_read((uint64_t)v11, 4uLL);
      if (v8)
      {
        unsigned int v9 = *v8;
        if (_xpc_class_id_valid(*v8))
        {
          if (v9 == 57344)
          {
            int v10 = _xpc_traverse_array((uint64_t)v11, a3);
          }

          else if (v9 == 61440)
          {
            int v10 = _xpc_traverse_dictionary((uint64_t *)v11, a3);
          }

          else
          {
            int v10 = _xpc_traverse_simple((uint64_t *)v11, v9, a3);
          }

          int v12 = v10;
        }
      }
    }

    (*(void (**)(uint64_t, uint64_t, int *))(a3 + 16))(a3, 1LL, &v12);
    xpc_release(v7);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, int *))(a3 + 16))(a3, 1LL, &v12);
  }

uint64_t _xpc_traverse_dictionary(uint64_t *a1, uint64_t a2)
{
  if (_xpc_dictionary_wire_length() == -1) {
    return 1LL;
  }
  uint64_t v4 = (unsigned int *)_xpc_graph_deserializer_read((uint64_t)a1, 4uLL);
  if (!v4) {
    return 1LL;
  }
  uint64_t v5 = *v4;
  v20[0] = &OBJC_CLASS___OS_xpc_dictionary;
  v20[1] = v5;
  uint64_t v6 = 2LL;
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a2 + 16))(a2, 2LL, v20);
  if (v8)
  {
    if (v8 != 3) {
      _xpc_traverse_dictionary_cold_1();
    }
  }

  else
  {
    int depth = _xpc_graph_deserializer_get_depth((uint64_t)a1);
    if ((_DWORD)v5)
    {
      int v10 = depth;
      do
      {
        string = _xpc_graph_deserializer_read_string((uint64_t)a1);
        if (!string) {
          return 1LL;
        }
        int v12 = string;
        uint64_t v13 = (int *)_xpc_graph_deserializer_read((uint64_t)a1, 4uLL);
        if (!v13) {
          return 1LL;
        }
        unsigned int v14 = *v13;
        if (!_xpc_class_id_valid(*v13)) {
          return 1LL;
        }
        uint64_t v18 = v12;
        uint64_t v19 = 0LL;
        uint64_t v19 = _xpc_type_from_id(v14);
        int v15 = (*(uint64_t (**)(uint64_t, uint64_t, const char **))(a2 + 16))(a2, 5LL, &v18);
        uint64_t v16 = _xt_do_container_element_action(a1, v15, a2, v14, v10);
        if ((_DWORD)v16) {
          return v16;
        }
        LODWORD(v5) = v5 - 1;
      }

      while ((_DWORD)v5);
    }

    int v17 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 16))(a2, 3LL, 0LL);
    if (v17)
    {
      if (v17 != 3) {
        _xpc_traverse_dictionary_cold_2();
      }
      return 2LL;
    }

    else
    {
      return 0LL;
    }
  }

  return v6;
}

uint64_t _xpc_traverse_array(uint64_t a1, uint64_t a2)
{
  if (_xpc_array_wire_length() == -1) {
    return 1LL;
  }
  uint64_t v4 = (unsigned int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v4) {
    return 1LL;
  }
  uint64_t v5 = *v4;
  v19[0] = &OBJC_CLASS___OS_xpc_array;
  v19[1] = v5;
  uint64_t v6 = 2LL;
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(a2 + 16))(a2, 2LL, v19);
  if (v8)
  {
    if (v8 != 3) {
      _xpc_traverse_array_cold_1();
    }
  }

  else
  {
    uint64_t depth = _xpc_graph_deserializer_get_depth(a1);
    if ((_DWORD)v5)
    {
      uint64_t v10 = depth;
      uint64_t v11 = 0LL;
      do
      {
        int v12 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
        if (!v12) {
          return 1LL;
        }
        uint64_t v13 = *v12;
        if (!_xpc_class_id_valid(*v12)) {
          return 1LL;
        }
        uint64_t v17 = v11;
        uint64_t v18 = 0LL;
        uint64_t v18 = _xpc_type_from_id(v13);
        uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 4LL, &v17);
        uint64_t v15 = _xt_do_container_element_action(a1, v14, a2, v13, v10);
        if ((_DWORD)v15) {
          return v15;
        }
      }

      while (v5 != ++v11);
    }

    int v16 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 16))(a2, 3LL, 0LL);
    if (v16)
    {
      if (v16 != 3) {
        _xpc_traverse_array_cold_2();
      }
      return 2LL;
    }

    else
    {
      return 0LL;
    }
  }

  return v6;
}

uint64_t _xpc_traverse_simple(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  unsigned int v9 = _xpc_type_from_id(a2);
  HIDWORD(v6) = a2;
  LODWORD(v6) = a2 - 0x2000;
  switch((v6 >> 12))
  {
    case 0u:
      uint64_t v10 = _xpc_BOOL_wire_length();
      goto LABEL_14;
    case 1u:
      uint64_t v10 = _xpc_int64_wire_length();
      goto LABEL_14;
    case 2u:
      uint64_t v10 = _xpc_uint64_wire_length();
      goto LABEL_5;
    case 3u:
      uint64_t v10 = _xpc_double_wire_length();
      goto LABEL_5;
    case 5u:
      uint64_t v10 = _xpc_date_wire_length();
      goto LABEL_5;
    case 6u:
      if ((_xpc_data_get_wire_value(a1, &v11, (mach_vm_size_t *)&v10) & 1) != 0) {
        goto LABEL_14;
      }
      goto LABEL_5;
    case 7u:
      goto LABEL_5;
    case 8u:
      uint64_t v10 = _xpc_uuid_wire_length();
      if (_xpc_uuid_get_wire_value((uint64_t)a1, &v11))
      {
LABEL_14:
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __objc2_class **))(a3 + 16))(a3, 6LL, &v9);
        if ((_DWORD)result)
        {
          if ((_DWORD)result != 3) {
            _xpc_traverse_simple_cold_1();
          }
          uint64_t result = 2LL;
        }
      }

      else
      {
LABEL_5:
        uint64_t result = 1LL;
      }

      break;
    default:
      BOOL v8 = _xpc_graph_deserializer_skip_value((uint64_t)a1, a2);
      if (!v8) {
        _os_assumes_log();
      }
      uint64_t result = !v8;
      break;
  }

  return result;
}

uint64_t _xt_do_container_element_action(uint64_t *a1, int a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t result = 2LL;
  switch(a2)
  {
    case 0:
    case 2:
      unsigned int v11 = a4 & 0xFFFFEFFF;
      if ((a4 & 0xFFFFEFFF) == 0xE000)
      {
        uint64_t result = _xpc_graph_deserializer_enter_container((uint64_t)a1);
        if (!(_DWORD)result) {
          return result;
        }
      }

      if (a2 == 2)
      {
        int v12 = (uint64_t (*)(uint64_t *))_xpc_deserialize_from_wire_id(a4);
        uint64_t v13 = v12(a1);
        if (!v13) {
          return 1LL;
        }
        uint64_t v14 = (void *)v13;
        int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, 7LL, v13);
        xpc_release(v14);
        if (v15 == 3) {
          return 2LL;
        }
LABEL_18:
        if (v11 == 57344) {
          _xpc_graph_deserializer_restore_depth((uint64_t)a1, a5);
        }
        return 0LL;
      }

      if (a4 == 61440)
      {
        uint64_t result = _xpc_traverse_dictionary(a1, a3);
        if (!(_DWORD)result) {
          goto LABEL_18;
        }
      }

      else if (a4 == 57344)
      {
        uint64_t result = _xpc_traverse_array((uint64_t)a1, a3);
        if (!(_DWORD)result) {
          goto LABEL_18;
        }
      }

      else
      {
        uint64_t result = _xpc_traverse_simple(a1, a4, a3);
        if (!(_DWORD)result) {
          goto LABEL_18;
        }
      }

      return result;
    case 1:
      _os_assumes_log();
      return 1LL;
    case 3:
      return result;
    default:
      return 0LL;
  }

xpc_object_t launch_socket_service_check_in()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "type", 6uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0LL);
  xpc_object_t v2 = 0LL;
  _xpc_launch_routine(101LL, v0, &v2);
  xpc_release(v0);
  return v2;
}

uint64_t launchd_getfd()
{
  return 0xFFFFFFFFLL;
}

uint64_t launchd_fdopen()
{
  return 0LL;
}

uint64_t launchd_msg_send()
{
  return 0xFFFFFFFFLL;
}

uint64_t launchd_msg_recv()
{
  return 0xFFFFFFFFLL;
}

uint64_t launch_data_pack()
{
  return 0LL;
}

uint64_t launch_data_unpack()
{
  return 0LL;
}

uint64_t _vprocmgr_getsocket()
{
  return 46LL;
}

xpc_object_t _launch_msg2(void *a1, int a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (a2)
  {
    if (a2 == 2)
    {
      uint64_t v7 = 3LL;
    }

    else if (a2 == 1)
    {
      if (a3 == -1LL) {
        a3 = getuid();
      }
      uint64_t v7 = 2LL;
    }

    else
    {
      a3 = 0LL;
      uint64_t v7 = 7LL;
    }
  }

  else
  {
    a3 = 0LL;
    uint64_t v7 = 1LL;
  }

  xpc_dictionary_set_uint64(v6, "type", v7);
  xpc_dictionary_set_uint64(v6, "handle", a3);
  xpc_dictionary_set_value(v6, "request", a1);
  xpc_object_t v9 = 0LL;
  _xpc_launch_routine(100LL, v6, &v9);
  xpc_release(v6);
  return v9;
}

uint64_t launch_wait()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t mpm_wait()
{
  return 46LL;
}

uint64_t mpm_uncork_fork()
{
  return 46LL;
}

uint64_t (*reboot2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  int v8 = reboot3(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  if (!v8) {
    return 0LL;
  }
  *__error() = v8;
  return reboot2;
}

uint64_t reboot3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v10, "type", 1uLL);
  xpc_dictionary_set_uint64(v10, "handle", 0LL);
  xpc_dictionary_set_uint64(v10, "flags", a1);
  int v16 = &a9;
  if ((a1 & 0x100000000000000LL) != 0)
  {
    unsigned int v11 = (unsigned int *)v16++;
    uint64_t v12 = *v11;
    xpc_dictionary_set_uint64(v10, "userreboot_purpose", v12);
  }

  xpc_object_t v15 = 0LL;
  int64_t v13 = _xpc_domain_routine(821LL, v10, &v15);
  xpc_release(v10);
  return v13;
}

uint64_t create_and_switch_to_per_session_launchd()
{
  return 0xFFFFFFFFLL;
}

uint64_t place_hold_on_real_loginwindow()
{
  return 0LL;
}

launch_data_t launch_data_alloc(launch_data_type_t type)
{
  switch(type)
  {
    case LAUNCH_DATA_DICTIONARY:
      launch_data_t result = (launch_data_t)xpc_dictionary_create(0LL, 0LL, 0LL);
      break;
    case LAUNCH_DATA_ARRAY:
      launch_data_t result = (launch_data_t)xpc_array_create(0LL, 0LL);
      break;
    case LAUNCH_DATA_FD:
    case LAUNCH_DATA_MACHPORT:
      xpc_object_t v2 = _xpc_asprintf("This is not what you want to do.");
      _xpc_api_misuse(v2);
    case LAUNCH_DATA_INTEGER:
      launch_data_t result = (launch_data_t)xpc_int64_create(0LL);
      break;
    case LAUNCH_DATA_REAL:
      launch_data_t result = (launch_data_t)xpc_double_create(0.0);
      break;
    case LAUNCH_DATA_BOOL:
      launch_data_t result = (launch_data_t)_xpc_BOOL_create_distinct(0);
      break;
    case LAUNCH_DATA_STRING:
      launch_data_t result = (launch_data_t)xpc_string_create((const char *)&unk_18018902B);
      break;
    case LAUNCH_DATA_OPAQUE:
      launch_data_t result = (launch_data_t)xpc_data_create(&unk_18018902B, 1uLL);
      break;
    case LAUNCH_DATA_ERRNO:
      launch_data_t result = (launch_data_t)xpc_uint64_create(0LL);
      break;
    default:
      launch_data_t result = 0LL;
      break;
  }

  return result;
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  type = (__objc2_class *)xpc_get_type(ld);
  if (type == &OBJC_CLASS___OS_xpc_dictionary) {
    return 1;
  }
  if (type == &OBJC_CLASS___OS_xpc_array) {
    return 2;
  }
  if (type == &OBJC_CLASS___OS_xpc_fd) {
    return 3;
  }
  if (type == &OBJC_CLASS___OS_xpc_BOOL) {
    return 6;
  }
  if (type == &OBJC_CLASS___OS_xpc_string) {
    return 7;
  }
  if (type == &OBJC_CLASS___OS_xpc_mach_recv) {
    int v2 = 10;
  }
  else {
    int v2 = 0;
  }
  else {
    launch_data_type_t v3 = v2;
  }
  if (type == &OBJC_CLASS___OS_xpc_data) {
    return 8;
  }
  else {
    return v3;
  }
}

BOOL launch_data_dict_insert(launch_data_t ldict, const launch_data_t lval, const char *key)
{
  return 1;
}

launch_data_t launch_data_dict_lookup(const launch_data_t ldict, const char *key)
{
  if (launch_data_get_type(ldict) == LAUNCH_DATA_DICTIONARY) {
    return (launch_data_t)xpc_dictionary_get_value(ldict, key);
  }
  else {
    return 0LL;
  }
}

BOOL launch_data_dict_remove(launch_data_t ldict, const char *key)
{
  return 1;
}

void launch_data_dict_iterate(const launch_data_t ldict, launch_data_dict_iterator_t iterator, void *ctx)
{
  v3[0] = iterator;
  v3[1] = ctx;
  xpc_dictionary_apply_f(ldict, (uint64_t)v3, (uint64_t)_launch_data_dict_iterate_apply);
}

uint64_t _launch_data_dict_iterate_apply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))a3)(a2, a1, *(void *)(a3 + 8));
}

BOOL launch_data_array_set_index(launch_data_t larray, const launch_data_t lval, size_t idx)
{
  size_t count = xpc_array_get_count(larray);
  if (count <= idx)
  {
    if (count != idx)
    {
      int v8 = _xpc_asprintf("Out-of-bounds launch array insertion attempt.");
      _xpc_api_misuse(v8);
    }

    xpc_array_append_value(larray, lval);
  }

  else
  {
    xpc_array_set_value(larray, idx, lval);
  }

  xpc_release(lval);
  return 1;
}

xpc_object_t launch_data_new_errno(int a1)
{
  return xpc_uint64_create(a1);
}

BOOL launch_data_set_fd(launch_data_t ld, int fd)
{
  int v2 = _xpc_asprintf("This API is functionally useless.", *(void *)&fd);
  _xpc_api_misuse(v2);
}

BOOL launch_data_set_machport(launch_data_t ld, mach_port_t mp)
{
  int v2 = _xpc_asprintf("This API is functionally useless.", *(void *)&mp);
  _xpc_api_misuse(v2);
}

BOOL launch_data_set_integer(launch_data_t ld, uint64_t val)
{
}

uint64_t sub_1801596FC()
{
  return 1LL;
}

BOOL launch_data_set_BOOL(launch_data_t ld, BOOL val)
{
  return 1;
}

BOOL launch_data_set_real(launch_data_t ld, double val)
{
  return 1;
}

BOOL launch_data_set_string(launch_data_t ld, const char *val)
{
  return 1;
}

BOOL launch_data_set_opaque(launch_data_t ld, const void *bytes, size_t sz)
{
  return 1;
}

uint64_t launch_data_set_errno()
{
  return 1LL;
}

void *__cdecl launch_data_get_opaque(const launch_data_t ld)
{
  int v2 = 0LL;
  uint64_t v3 = 0LL;
  if (xpc_data_get_bytes_ptr_and_length(ld, &v2, &v3)) {
    return v2;
  }
  else {
    return 0LL;
  }
}

size_t launch_data_get_opaque_size(const launch_data_t ld)
{
  uint64_t v2 = 0LL;
  size_t v3 = 0LL;
  if (xpc_data_get_bytes_ptr_and_length(ld, &v2, &v3)) {
    return v3;
  }
  else {
    return 0LL;
  }
}

int launch_data_get_errno(const launch_data_t ld)
{
  return xpc_uint64_get_value(ld);
}

int launch_get_fd(void)
{
  return -1;
}

launch_data_t launch_msg(const launch_data_t request)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 7uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0LL);
  xpc_dictionary_set_value(v2, "request", request);
  if (xpc_get_type(request) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary
    && xpc_dictionary_get_BOOL(request, "_TargetLocalDomain"))
  {
    xpc_dictionary_set_uint64(v2, "type", 6uLL);
  }

  uint64_t v4 = 0LL;
  _xpc_launch_routine(100LL, v2, (xpc_object_t *)&v4);
  xpc_release(v2);
  return v4;
}

BOOL _xpc_BOOL_equal(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24);
}

uint64_t _xpc_BOOL_hash(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24)) {
    return 45057LL;
  }
  else {
    return 4107LL;
  }
}

uint64_t _xpc_BOOL_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  if (*(_BYTE *)(a1 + 24)) {
    size_t v3 = "true";
  }
  else {
    size_t v3 = "false";
  }
  unsigned int v4 = snprintf(__str, 0x80uLL, "%s", v3);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_BOOL_debug_desc(_BYTE *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  if (a1[24]) {
    size_t v3 = "true";
  }
  else {
    size_t v3 = "false";
  }
  unsigned int v4 = snprintf(__str, 0x80uLL, "<%s: %p>: %s", "BOOL", a1, v3);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_BOOL_debug(uint64_t a1, char *__str, size_t __size)
{
  if (*(_BYTE *)(a1 + 24)) {
    size_t v3 = "true";
  }
  else {
    size_t v3 = "false";
  }
  return snprintf(__str, __size, ", xpc_object_t value = %s", v3);
}

uint64_t _xpc_BOOL_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 0x2000;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int v5 = *(unsigned __int8 *)(a1 + 24);
  return _xpc_serializer_append(a2, &v5, 4uLL, 1);
}

__objc2_class **_xpc_BOOL_deserialize(uint64_t a1)
{
  launch_data_t result = (__objc2_class **)_xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
  {
    if (*(_DWORD *)result == 1)
    {
      return &_xpc_BOOL_true;
    }

    else if (*(_DWORD *)result)
    {
      return 0LL;
    }

    else
    {
      return &_xpc_BOOL_false;
    }
  }

  return result;
}

uint64_t _xpc_BOOL_wire_length()
{
  return 4LL;
}

uint64_t _xpc_BOOL_create_distinct(char a1)
{
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 20) = 4;
  *(_BYTE *)(result + 24) = a1;
  return result;
}

uint64_t _xpc_BOOL_set_value(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2;
  return result;
}

uint64_t _xpc_BOOL_get_wire_value(uint64_t a1, _BYTE *a2)
{
  uint64_t result = _xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
  {
    int v4 = *(_DWORD *)result;
    if (!*(_DWORD *)result || (uint64_t result = 0LL, v4 == 1))
    {
      *a2 = v4;
      return 1LL;
    }
  }

  return result;
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  if (value) {
    return &_xpc_BOOL_true;
  }
  else {
    return &_xpc_BOOL_false;
  }
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return xpc_get_type(xBOOL) == (xpc_type_t)&OBJC_CLASS___OS_xpc_BOOL && *((_BYTE *)xBOOL + 24) != 0;
}

uint64_t xpc_get_event_name(const char *a1, uint64_t a2, char *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  xpc_dictionary_set_string(v6, "stream", a1);
  xpc_dictionary_set_uint64(v6, "token", a2);
  int v7 = _xpc_bootstrap_routine(402LL, v6, &xdict);
  if (!v7)
  {
    string = xpc_dictionary_get_string(xdict, "name");
    if (string)
    {
      strlcpy(a3, string, 0x80uLL);
      xpc_release(xdict);
      uint64_t v9 = 1LL;
      goto LABEL_5;
    }

    xpc_release(xdict);
    int v7 = 118;
  }

  __int128 v8 = xpc_strerror(v7);
  syslog(3, "Could not get event name for stream/token: %s/%llu: %d: %s", a1, a2, v7, v8);
  uint64_t v9 = 0LL;
LABEL_5:
  xpc_release(v6);
  return v9;
}

xpc_object_t xpc_copy_event_entitlements(const char *a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  xpc_dictionary_set_string(v4, "stream", a1);
  xpc_dictionary_set_uint64(v4, "token", a2);
  int v5 = _xpc_bootstrap_routine(405LL, v4, &xdict);
  if (v5) {
    goto LABEL_2;
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, "out-entitlements");
  if (!value)
  {
    xpc_release(xdict);
    int v5 = 118;
LABEL_2:
    xpc_object_t v6 = xpc_strerror(v5);
    syslog(3, "Could not get entitlements for stream/token: %s/%llu: %d: %s", a1, a2, v5, v6);
    xpc_object_t v7 = 0LL;
    goto LABEL_9;
  }

  xpc_object_t v7 = value;
  if (xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    xpc_object_t v7 = xpc_retain(v7);
  }
  else {
    xpc_release(v7);
  }
  xpc_release(xdict);
LABEL_9:
  xpc_release(v4);
  return v7;
}

void xpc_set_event_with_flags(const char *a1, const char *a2, void *a3, uint64_t a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  xpc_dictionary_set_string(v8, "stream", a1);
  xpc_dictionary_set_string(v8, "name", a2);
  xpc_dictionary_set_uint64(v8, "flags", a4);
  if (a3)
  {
    xpc_dictionary_set_value(v8, "descriptor", a3);
    int v9 = _xpc_bootstrap_routine(400LL, v8, &xdict);
    if (!v9)
    {
      uint64_t int64 = xpc_dictionary_get_uint64(xdict, "token");
      syslog(6, "Subscribed to event %s using token %llu", a2, uint64);
LABEL_6:
      xpc_release(xdict);
      goto LABEL_7;
    }
  }

  else
  {
    int v9 = _xpc_bootstrap_routine(400LL, v8, &xdict);
    if (!v9) {
      goto LABEL_6;
    }
  }

  __int128 v11 = xpc_strerror(v9);
  syslog(3, "Could not set XPC event for stream/key: %s/%s: %d: %s", a1, a2, v9, v11);
LABEL_7:
  xpc_release(v8);
}

void xpc_set_event(const char *a1, const char *a2, void *a3)
{
}

xpc_object_t xpc_copy_event(const char *a1, const char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v5 = v4;
  xpc_object_t xdict = 0LL;
  if (a1)
  {
    xpc_dictionary_set_string(v4, "stream", a1);
    if (a2) {
      xpc_dictionary_set_string(v5, "name", a2);
    }
  }

  int v6 = _xpc_bootstrap_routine(401LL, v5, &xdict);
  if (v6)
  {
    int v7 = v6;
    xpc_object_t v8 = 0LL;
LABEL_11:
    if (v7 != 3)
    {
      __int128 v10 = xpc_strerror(v7);
      syslog(3, "Could not copy XPC event for stream/key: %s/%s: %d: %s", a1, a2, v7, v10);
    }

    goto LABEL_13;
  }

  xpc_object_t value = xpc_dictionary_get_value(xdict, "event");
  xpc_object_t v8 = value;
  if (value && xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    xpc_object_t v8 = xpc_retain(v8);
    int v7 = 0;
  }

  else
  {
    int v7 = 118;
  }

  xpc_release(xdict);
  if (v7) {
    goto LABEL_11;
  }
LABEL_13:
  xpc_release(v5);
  return v8;
}

uint64_t xpc_event_stream_check_in2()
{
  return 0LL;
}

uint64_t xpc_event_stream_check_in()
{
  return 0LL;
}

void xpc_set_event_state(const char *a1, uint64_t a2, BOOL a3)
{
  int v4 = _xpc_set_event_state_impl(a1, a2, a3);
  if (v4)
  {
    int v5 = v4;
    int v6 = xpc_strerror(v4);
    syslog(3, "Could not set event state: %s: %d: %s", a1, v5, v6);
  }

int64_t _xpc_set_event_state_impl(const char *a1, uint64_t a2, BOOL a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t object = 0LL;
  xpc_dictionary_set_string(v6, "stream", a1);
  xpc_dictionary_set_uint64(v6, "token", a2);
  xpc_dictionary_set_BOOL(v6, "state", a3);
  int64_t v7 = _xpc_bootstrap_routine(404LL, v6, &object);
  if (!(_DWORD)v7) {
    xpc_release(object);
  }
  xpc_release(v6);
  return v7;
}

uint64_t xpc_get_service_identifier_for_token(uint64_t a1, char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  xpc_dictionary_set_uint64(v4, "token", a1);
  int v5 = _xpc_bootstrap_routine(410LL, v4, &xdict);
  if (!v5)
  {
    string = xpc_dictionary_get_string(xdict, "identifier");
    if (string)
    {
      strlcpy(a2, string, 0x80uLL);
      xpc_release(xdict);
      uint64_t v7 = 1LL;
      goto LABEL_5;
    }

    xpc_release(xdict);
    int v5 = 118;
  }

  xpc_object_t v6 = xpc_strerror(v5);
  syslog(3, "Could not get service identifier for token: %llu: %d: %s", a1, v5, v6);
  uint64_t v7 = 0LL;
LABEL_5:
  xpc_release(v4);
  return v7;
}

uint64_t xpc_get_service_uid_for_token(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  xpc_dictionary_set_uint64(v2, "token", a1);
  int v3 = _xpc_bootstrap_routine(411LL, v2, &xdict);
  if (v3)
  {
    int v4 = v3;
    int v5 = xpc_strerror(v3);
    syslog(3, "Could not get uid for token: %llu: %d: %s", a1, v4, v5);
    uint64_t int64 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t int64 = xpc_dictionary_get_uint64(xdict, "uid");
    xpc_release(xdict);
  }

  xpc_release(v2);
  return uint64;
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  dispatch_queue_global_t global_queue = (dispatch_queue_global_t)targetq;
  if (!targetq) {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service(stream, 0LL, 1uLL);
  xpc_connection_set_event_channel((uint64_t)mach_service, 0LL);
  uint64_t v7 = _xpc_alloc(0x18uLL);
  *uint64_t v7 = xpc_retain(mach_service);
  v7[1] = global_queue;
  dispatch_retain(global_queue);
  v7[2] = _Block_copy(handler);
  xpc_connection_set_context(mach_service, v7);
  xpc_connection_set_finalizer_f(mach_service, (xpc_finalizer_t)_xpc_events_ctx_finalizer);
  _xpc_connection_set_event_handler_f((uint64_t)mach_service, (unint64_t)_xpc_events_listener_event);
  xpc_connection_activate(mach_service);
  os_unfair_lock_lock_with_options();
  xpc_object_t v8 = (xpc_object_t)_event_listeners;
  if (!_event_listeners)
  {
    xpc_object_t v8 = xpc_array_create(0LL, 0LL);
    _event_listeners = (uint64_t)v8;
  }

  xpc_array_append_value(v8, mach_service);
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_listeners_lock);
}

void _xpc_events_ctx_finalizer(uint64_t a1)
{
  xpc_object_t v2 = *(dispatch_object_s **)(a1 + 8);
  int v3 = *(const void **)(a1 + 16);
  xpc_release(*(xpc_object_t *)a1);
  dispatch_release(v2);
  _Block_release(v3);
  free((void *)a1);
}

void _xpc_events_listener_event(_xpc_connection_s *a1, uint64_t a2)
{
  int v4 = *(void **)a2;
  int v3 = *(dispatch_queue_s **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_connection)
  {
    uint64_t v7 = _xpc_alloc(0x18uLL);
    *uint64_t v7 = a1;
    v7[1] = 0LL;
    v7[2] = v5;
    xpc_connection_set_context(a1, v7);
    xpc_connection_set_finalizer_f(a1, (xpc_finalizer_t)MEMORY[0x189600260]);
    xpc_connection_set_target_queue(a1, v3);
    _xpc_connection_set_event_handler_f((uint64_t)a1, (unint64_t)_xpc_events_peer_event);
    xpc_connection_activate(a1);
  }

  else if (a1 != (_xpc_connection_s *)&_xpc_error_termination_imminent)
  {
    xpc_object_t v6 = xpc_copy_description(a1);
    syslog(4, "Event stream listener got an error: %s", v6);
    free(v6);
    xpc_release(v4);
  }

uint64_t xpc_event_publisher_create(const char *a1, dispatch_object_s *a2)
{
  uint64_t v4 = _xpc_event_publisher_alloc();
  strcpy((char *)(v4 + 88), a1);
  *(void *)(v4 + 16) = dispatch_queue_create(a1, 0LL);
  *(_DWORD *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = a2;
  dispatch_retain(a2);
  return v4;
}

void xpc_event_publisher_set_handler(uint64_t a1, void *aBlock)
{
  int v3 = _Block_copy(aBlock);
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __xpc_event_publisher_set_handler_block_invoke;
  v5[3] = &unk_189629878;
  _BYTE v5[4] = v3;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __xpc_event_publisher_set_handler_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(_DWORD *)(v1 + 24)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v3 = *(const void **)(v1 + 40);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v1 = *(void *)(a1 + 40);
  }

  *(void *)(v1 + 40) = *(void *)(a1 + 32);
}

void xpc_event_publisher_set_error_handler(uint64_t a1, void *aBlock)
{
  int v3 = _Block_copy(aBlock);
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __xpc_event_publisher_set_error_handler_block_invoke;
  v5[3] = &unk_1896298A0;
  _BYTE v5[4] = v3;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __xpc_event_publisher_set_error_handler_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(_DWORD *)(v1 + 24)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v3 = *(const void **)(v1 + 48);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v1 = *(void *)(a1 + 40);
  }

  *(void *)(v1 + 48) = *(void *)(a1 + 32);
}

void xpc_event_publisher_set_initial_load_completed_handler_4remoted(uint64_t a1, void *aBlock)
{
  int v3 = _Block_copy(aBlock);
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 16);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __xpc_event_publisher_set_initial_load_completed_handler_4remoted_block_invoke;
  v5[3] = &unk_1896298C8;
  _BYTE v5[4] = v3;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __xpc_event_publisher_set_initial_load_completed_handler_4remoted_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(_DWORD *)(v1 + 24)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v3 = *(const void **)(v1 + 56);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v1 = *(void *)(a1 + 40);
  }

  *(void *)(v1 + 56) = *(void *)(a1 + 32);
}

void _xpc_event_publisher_xref_dispose(uint64_t a1)
{
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = ___xpc_event_publisher_xref_dispose_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  block[4] = a1;
  dispatch_sync(v1, block);
}

void ___xpc_event_publisher_xref_dispose_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 24);
  if (v2 != 2)
  {
    if (v2) {
      ___xpc_event_publisher_xref_dispose_block_invoke_cold_1();
    }
    _xpc_event_publisher_cancel(v1);
  }

void _xpc_event_publisher_cancel(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) == 1) {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  }
  else {
    _xpc_event_publisher_cancel_complete(a1);
  }
}

void _xpc_event_publisher_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) != 2) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
}

void xpc_event_publisher_activate(mach_port_context_t a1)
{
  int v2 = (unsigned int *)(a1 + 24);
  do
  {
    if (__ldxr(v2))
    {
      __clrex();
      return;
    }
  }

  while (__stxr(1u, v2));
  os_unfair_lock_lock_with_options();
  xpc_object_t v4 = (xpc_object_t)_event_publishers;
  if (!_event_publishers)
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    _event_publishers = (uint64_t)v4;
  }

  xpc_dictionary_set_pointer((void *)_event_publishers, (const char *)(a1 + 88), a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_publishers_lock);
  unsigned int v5 = _xpc_mach_port_allocate(0x33u, 6u, a1);
  *(void *)(a1 + 64) = dispatch_source_create(MEMORY[0x1895FE808], v5, 0LL, *(dispatch_queue_t *)(a1 + 16));
  _os_object_retain_internal();
  uint64_t v6 = MEMORY[0x1895FED80];
  uint64_t v12 = MEMORY[0x1895FED80];
  uint64_t v13 = 0x40000000LL;
  __int128 v14 = ___xpc_event_publisher_setup_poll_block_invoke;
  uint64_t v15 = &__block_descriptor_tmp_43;
  mach_port_context_t v16 = a1;
  unsigned int v17 = v5;
  dispatch_source_set_mandatory_cancel_handler();
  uint64_t v7 = *(dispatch_source_s **)(a1 + 64);
  handler[0] = v6;
  handler[1] = 0x40000000LL;
  handler[2] = ___xpc_event_publisher_setup_poll_block_invoke_2;
  handler[3] = &__block_descriptor_tmp_45_0;
  unsigned int v11 = v5;
  handler[4] = a1;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(*(dispatch_object_t *)(a1 + 64));
  xpc_object_t v8 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = v6;
  block[1] = 0x40000000LL;
  block[2] = __xpc_event_publisher_activate_block_invoke;
  block[3] = &__block_descriptor_tmp_22;
  block[4] = a1;
  dispatch_async(v8, block);
}

void __xpc_event_publisher_activate_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 24) == 1)
  {
    _xpc_event_publisher_fetch_subscriptions(v2);
    _xpc_event_publisher_arm_poll(*(void *)(a1 + 32));
  }

void _xpc_event_publisher_fetch_subscriptions(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create((const char *)(a1 + 88));
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "stream", (const char *)(a1 + 88));
  xpc_object_t object = 0LL;
  int v4 = _xpc_bootstrap_routine(403LL, v3, &object);
  xpc_release(v3);
  if (v4)
  {
    _xpc_event_publisher_error(a1, v4);
  }

  else
  {
    _xpc_event_publisher_set_subscriptions(a1, object, v2);
    xpc_release(object);
  }

  os_release(v2);
}

void _xpc_event_publisher_arm_poll(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v2, "stream", (const char *)(a1 + 88));
    uintptr_t handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 64));
    int v4 = _xpc_event_routine_async(406LL, v2, handle);
    xpc_release(v2);
    if (v4) {
      _xpc_event_publisher_error(a1, v4);
    }
  }

uint64_t xpc_event_publisher_fire(uint64_t a1, uint64_t a2, void *a3)
{
  return _xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)&__block_literal_global_0);
}

uint64_t _xpc_event_publisher_fire_impl(uint64_t a1, uint64_t a2, xpc_object_t object, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  if (object)
  {
    xpc_object_t v7 = object;
    xpc_retain(object);
  }

  else
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  memset(string, 0, sizeof(string));
  int v17 = 0;
  if ((xpc_get_event_name((const char *)(a1 + 88), a2, (char *)string) & 1) != 0)
  {
    xpc_object_t v8 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___xpc_event_publisher_fire_impl_block_invoke;
    block[3] = &unk_189629AF0;
    block[6] = a1;
    block[7] = a2;
    block[4] = &v18;
    void block[5] = &v14;
    char v13 = 0;
    dispatch_sync(v8, block);
    if (!*((_DWORD *)v15 + 6))
    {
      xpc_dictionary_set_string(v7, "XPCEventName", (const char *)string);
      (*(void (**)(uint64_t, uint64_t, xpc_object_t))(a4 + 16))(a4, v19[3], v7);
    }
  }

  else
  {
    *((_DWORD *)v15 + 6) = 132;
  }

  int v9 = (void *)v19[3];
  if (v9) {
    xpc_release(v9);
  }
  xpc_release(v7);
  uint64_t v10 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void __xpc_event_publisher_fire_block_invoke(int a1, xpc_connection_t connection, xpc_object_t message)
{
}

uint64_t xpc_event_publisher_fire_noboost(uint64_t a1, uint64_t a2, void *a3)
{
  return _xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)&__block_literal_global_26);
}

void __xpc_event_publisher_fire_noboost_block_invoke(int a1, unsigned int *a2, xpc_object_t object)
{
}

uint64_t xpc_event_publisher_fire_barrier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1895FED80];
  v4[1] = 0x40000000LL;
  v4[2] = __xpc_event_publisher_fire_barrier_block_invoke;
  v4[3] = &unk_1896299B0;
  v4[4] = a3;
  return _xpc_event_publisher_fire_impl(a1, a2, 0LL, (uint64_t)v4);
}

void __xpc_event_publisher_fire_barrier_block_invoke(uint64_t a1, xpc_connection_t connection)
{
}

uint64_t xpc_event_publisher_fire_with_reply(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1895FED80];
  v6[1] = 0x40000000LL;
  v6[2] = __xpc_event_publisher_fire_with_reply_block_invoke;
  v6[3] = &unk_1896299D8;
  v6[4] = a5;
  v6[5] = a4;
  return _xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)v6);
}

void __xpc_event_publisher_fire_with_reply_block_invoke( uint64_t a1, xpc_connection_t connection, xpc_object_t message)
{
}

uint64_t xpc_event_publisher_fire_with_reply_sync(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = 0LL;
  xpc_object_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  uint64_t v9 = 0LL;
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __xpc_event_publisher_fire_with_reply_sync_block_invoke;
  v5[3] = &unk_189629A00;
  _BYTE v5[4] = &v6;
  uint64_t v3 = 0LL;
  _Block_object_dispose(&v6, 8);
  return v3;
}

xpc_object_t __xpc_event_publisher_fire_with_reply_sync_block_invoke( uint64_t a1, xpc_connection_t connection, xpc_object_t message)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(connection, message);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

int64_t xpc_event_publisher_set_subscriber_keepalive(uint64_t a1, uint64_t a2, BOOL a3)
{
  return _xpc_set_event_state_impl((const char *)(a1 + 88), a2, a3);
}

uint64_t xpc_event_publisher_get_subscriber_asid(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  unsigned int v5 = (const char *)(a1 + 88);
  xpc_dictionary_set_string(v4, "stream", v5);
  xpc_dictionary_set_uint64(v4, "token", a2);
  int v6 = _xpc_bootstrap_routine(407LL, v4, &xdict);
  xpc_release(v4);
  if (v6)
  {
    xpc_object_t v7 = xpc_strerror(v6);
    syslog(3, "Could not get asid for stream/token: %s/%llu: %d: %s", v5, a2, v6, v7);
    return 0xFFFFFFFFLL;
  }

  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "asid");
    xpc_release(xdict);
  }

  return int64;
}

int64_t xpc_event_publisher_set_event(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t *a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v17 = 0LL;
  xpc_dictionary_set_string(v10, "stream", (const char *)(a1 + 88));
  xpc_dictionary_set_uint64(v10, "token", a2);
  xpc_dictionary_set_uint64(v10, "flags", 0LL);
  xpc_dictionary_set_int64(v10, "subscriber-pid", a4);
  if (a3) {
    xpc_dictionary_set_value(v10, "descriptor", a3);
  }
  int64_t v11 = _xpc_bootstrap_routine(408LL, v10, &v17);
  int64_t v12 = v11;
  if ((_DWORD)v11)
  {
    char v13 = xpc_strerror(v11);
    syslog( 3,  "Could not set XPC event for stream/token/subscriber: %s/%llu/%d: %d: %s",  (const char *)(a1 + 88),  a2,  a4,  v12,  v13);
  }

  else
  {
    *a5 = xpc_dictionary_get_uint64(v17, "token");
    uint64_t v14 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __xpc_event_publisher_set_event_block_invoke;
    block[3] = &__block_descriptor_tmp_34;
    block[4] = a1;
    void block[5] = v17;
    dispatch_sync(v14, block);
    xpc_release(v17);
  }

  xpc_release(v10);
  return v12;
}

void __xpc_event_publisher_set_event_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = (void *)os_transaction_create((const char *)(*(void *)(a1 + 32) + 88LL));
  _xpc_event_publisher_set_subscriptions(*(void *)(a1 + 32), *(xpc_object_t *)(a1 + 40), v2);
  os_release(v2);
}

void _xpc_event_publisher_set_subscriptions(uint64_t a1, xpc_object_t xdict, void *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "events");
  BOOL v7 = xpc_dictionary_get_BOOL(xdict, "initial-load-completed");
  if (xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  size_t count = xpc_array_get_count(value);
  unint64_t v9 = count;
  if ((count & 1) != 0) {
    _xpc_event_publisher_set_subscriptions_cold_3();
  }
  unint64_t v10 = count >> 1;
  uint64_t v11 = *(void *)(a1 + 72);
  int64_t v12 = (unsigned int *)_xpc_alloc(24LL * (count >> 1) + 8);
  *int64_t v12 = v10;
  if (v9 >= 2)
  {
    size_t v13 = 0LL;
    if (v10 <= 1) {
      unint64_t v10 = 1LL;
    }
    do
    {
      uint64_t int64 = xpc_array_get_uint64(value, v13);
      unsigned int v15 = v12[1];
      if (v15 >= *v12) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      uint64_t v16 = &v12[6 * v15];
      *((void *)v16 + 2) = 0LL;
      *((void *)v16 + 3) = 0LL;
      *((void *)v16 + 1) = uint64;
      v12[1] = v15 + 1;
      v13 += 2LL;
      --v10;
    }

    while (v10);
  }

  BOOL v41 = v7;
  if (v11 && *(_DWORD *)(v11 + 4))
  {
    unsigned int v17 = 0;
    while (1)
    {
      uint64_t v18 = (void *)_xpc_token_cache_get_at_index(v11, v17);
      uint64_t v19 = v18;
      uint64_t v20 = *v18;
      uint64_t v21 = v12[1];
      uint64_t v22 = v12 + 4;
      if ((_DWORD)v21) {
        break;
      }
LABEL_15:
      os_retain(a3);
      uint64_t v23 = *(dispatch_queue_s **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = ___xpc_event_publisher_set_subscriptions_block_invoke;
      block[3] = &unk_189629B58;
      block[4] = v24;
      void block[5] = v20;
      void block[6] = a3;
      dispatch_async(v23, block);
      uint64_t v27 = (_xpc_connection_s *)v19[1];
      uint64_t v26 = v19 + 1;
      char v25 = v27;
      if (v27)
      {
        xpc_connection_cancel(v25);
LABEL_18:
        *uint64_t v26 = 0LL;
      }

      if (++v17 >= *(_DWORD *)(v11 + 4)) {
        goto LABEL_20;
      }
    }

    while (*(v22 - 1) != v20)
    {
      v22 += 3;
      if (!--v21) {
        goto LABEL_15;
      }
    }

    uint64_t v26 = v18 + 1;
    *uint64_t v22 = v18[1];
    goto LABEL_18;
  }

LABEL_20:
  if (v12[1])
  {
    unint64_t v28 = 0LL;
    do
    {
      uint64_t v29 = *(void *)_xpc_token_cache_get_at_index((uint64_t)v12, v28);
      if (v11 && (uint64_t v30 = *(unsigned int *)(v11 + 4), v31 = (uint64_t *)(v11 + 8), (_DWORD)v30))
      {
        while (1)
        {
          uint64_t v32 = *v31;
          v31 += 3;
          if (v32 == v29) {
            break;
          }
          if (!--v30) {
            goto LABEL_26;
          }
        }
      }

      else
      {
LABEL_26:
        os_retain(a3);
        xpc_object_t v33 = xpc_array_get_value(value, (2 * v28) | 1LL);
        xpc_object_t v34 = xpc_copy(v33);
        __int128 v35 = *(dispatch_queue_s **)(a1 + 32);
        uint64_t v36 = *(void *)(a1 + 40);
        v44[0] = MEMORY[0x1895FED80];
        v44[1] = 0x40000000LL;
        v44[2] = ___xpc_event_publisher_set_subscriptions_block_invoke_2;
        v44[3] = &unk_189629B80;
        v44[4] = v36;
        v44[5] = v29;
        v44[6] = v34;
        v44[7] = a3;
        dispatch_async(v35, v44);
      }

      ++v28;
    }

    while (v28 < v12[1]);
  }

  if (!v11)
  {
    os_retain(a3);
    __int128 v37 = *(dispatch_queue_s **)(a1 + 32);
    uint64_t v38 = *(void *)(a1 + 40);
    v43[0] = MEMORY[0x1895FED80];
    v43[1] = 0x40000000LL;
    v43[2] = ___xpc_event_publisher_set_subscriptions_block_invoke_3;
    v43[3] = &unk_189629BA8;
    v43[4] = v38;
    v43[5] = a3;
    dispatch_async(v37, v43);
  }

  if (v41 && *(void *)(a1 + 56))
  {
    os_retain(a3);
    __int128 v39 = *(const void **)(a1 + 56);
    uint64_t v40 = *(dispatch_queue_s **)(a1 + 32);
    v42[0] = MEMORY[0x1895FED80];
    v42[1] = 0x40000000LL;
    v42[2] = ___xpc_event_publisher_set_subscriptions_block_invoke_4;
    v42[3] = &unk_189629BD0;
    v42[4] = v39;
    v42[5] = a3;
    dispatch_async(v40, v42);
    _Block_release(v39);
    *(void *)(a1 + 56) = 0LL;
  }

  free(*(void **)(a1 + 72));
  *(void *)(a1 + 72) = v12;
}

    __break(1u);
    return;
  }

  unsigned int v17 = *(char **)a1;
  uint64_t v18 = *(void *)(a1 + 8);
LABEL_13:
  uint64_t v19 = strlcat(v17, __source[0], v18);
  *(void *)(a1 + 16) = v19;
  if (v19 >= *(void *)(a1 + 8)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  free(__source[0]);
}

xpc_object_t xpc_event_publisher_copy_event(uint64_t a1, uint64_t a2, int a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = 0LL;
  BOOL v7 = (const char *)(a1 + 88);
  xpc_dictionary_set_string(v6, "stream", v7);
  xpc_dictionary_set_uint64(v6, "token", a2);
  xpc_dictionary_set_int64(v6, "subscriber-pid", a3);
  int v8 = _xpc_bootstrap_routine(409LL, v6, &xdict);
  if (v8)
  {
    int v9 = v8;
    xpc_object_t v10 = 0LL;
LABEL_8:
    if (v9 != 3)
    {
      int64_t v12 = xpc_strerror(v9);
      syslog(3, "Could not copy XPC event for stream/token/subscriber: %s/%llu/%d: %d: %s", v7, a2, a3, v9, v12);
    }

    goto LABEL_10;
  }

  xpc_object_t value = xpc_dictionary_get_value(xdict, "event");
  xpc_object_t v10 = value;
  if (value && xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    xpc_object_t v10 = xpc_retain(v10);
    int v9 = 0;
  }

  else
  {
    int v9 = 118;
  }

  xpc_release(xdict);
  if (v9) {
    goto LABEL_8;
  }
LABEL_10:
  xpc_release(v6);
  return v10;
}

uint64_t xpc_event_publisher_create_subscription( uint64_t a1, const char *a2, const char *a3, void *a4, int a5, uint64_t *a6)
{
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v20 = 0LL;
  xpc_dictionary_set_string(v12, "stream", a2);
  xpc_dictionary_set_string(v12, "name", a3);
  xpc_dictionary_set_value(v12, "descriptor", a4);
  xpc_dictionary_set_int64(v12, "subscriber-pid", a5);
  int64_t v13 = _xpc_bootstrap_routine(412LL, v12, &v20);
  if ((_DWORD)v13)
  {
    uint64_t v14 = v13;
    unsigned int v15 = xpc_strerror(v13);
    syslog(3, "Could not create subscription for stream/event/subscriber: %s/%s/%d: %d: %s", a2, a3, a5, v14, v15);
  }

  else
  {
    uint64_t int64 = xpc_dictionary_get_uint64(v20, "token");
    if (uint64)
    {
      *a6 = uint64;
      unsigned int v17 = *(dispatch_queue_s **)(a1 + 16);
      block[0] = MEMORY[0x1895FED80];
      block[1] = 0x40000000LL;
      block[2] = __xpc_event_publisher_create_subscription_block_invoke;
      block[3] = &__block_descriptor_tmp_37;
      block[4] = a1;
      void block[5] = v20;
      dispatch_sync(v17, block);
      uint64_t v14 = 0LL;
    }

    else
    {
      uint64_t v14 = 118LL;
    }

    xpc_release(v20);
  }

  xpc_release(v12);
  return v14;
}

void __xpc_event_publisher_create_subscription_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = (void *)os_transaction_create((const char *)(*(void *)(a1 + 32) + 88LL));
  _xpc_event_publisher_set_subscriptions(*(void *)(a1 + 32), *(xpc_object_t *)(a1 + 40), v2);
  os_release(v2);
}

void xpc_event_publisher_set_throttling(uint64_t a1, unsigned int a2)
{
  if (a2 <= 2) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  xpc_object_t v2 = *(dispatch_queue_s **)(a1 + 16);
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  void v3[2] = __xpc_event_publisher_set_throttling_block_invoke;
  v3[3] = &__block_descriptor_tmp_38;
  v3[4] = a1;
  __int16 v4 = a2;
  dispatch_sync(v2, v3);
}

uint64_t __xpc_event_publisher_set_throttling_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 24)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(_WORD *)(v1 + 84) = *(_WORD *)(result + 40) >> 1;
  *(_WORD *)(v1 + 86) = *(_WORD *)(result + 40);
  return result;
}

__objc2_class *_xpc_events_peer_event(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  xpc_object_t result = (__objc2_class *)xpc_get_type(a1);
  if (result == &OBJC_CLASS___OS_xpc_dictionary) {
    return (__objc2_class *)__XPC_CONNECTION_EVENT_HANDLER_CALLOUT__(v2);
  }
  return result;
}

uint64_t __XPC_CONNECTION_EVENT_HANDLER_CALLOUT__(uint64_t a1)
{
  return _os_avoid_tail_call();
}

void _xpc_event_publisher_cancel_complete(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      os_unfair_lock_lock_with_options();
      xpc_dictionary_set_pointer((void *)_event_publishers, (const char *)(a1 + 88), 0LL);
      os_unfair_lock_unlock((os_unfair_lock_t)&_event_publishers_lock);
    }

    *(_DWORD *)(a1 + 24) = 2;
    if (*(_DWORD *)(a1 + 80))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      if (v3)
      {
        __int16 v4 = *(dispatch_queue_s **)(a1 + 32);
        v11[0] = MEMORY[0x1895FED80];
        v11[1] = 0x40000000LL;
        v11[2] = ___xpc_event_publisher_cancel_complete_block_invoke;
        v11[3] = &unk_189629A88;
        _OWORD v11[4] = v3;
        v11[5] = a1;
        dispatch_async(v4, v11);
      }
    }

    unsigned int v5 = *(const void **)(a1 + 40);
    if (v5)
    {
      _Block_release(v5);
      *(void *)(a1 + 40) = 0LL;
    }

    xpc_object_t v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      _Block_release(v6);
      *(void *)(a1 + 48) = 0LL;
    }

    BOOL v7 = *(const void **)(a1 + 56);
    if (v7)
    {
      _Block_release(v7);
      *(void *)(a1 + 56) = 0LL;
    }

    dispatch_release(*(dispatch_object_t *)(a1 + 32));
    *(void *)(a1 + 32) = 0LL;
    int v8 = *(_DWORD **)(a1 + 72);
    if (v8)
    {
      if (v8[1])
      {
        unsigned int v9 = 0;
        do
        {
          xpc_object_t v10 = *(_xpc_connection_s **)(_xpc_token_cache_get_at_index((uint64_t)v8, v9) + 8);
          if (v10) {
            xpc_connection_cancel(v10);
          }
          ++v9;
          int v8 = *(_DWORD **)(a1 + 72);
        }

        while (v9 < v8[1]);
      }

      free(v8);
      *(void *)(a1 + 72) = 0LL;
    }
  }

uint64_t ___xpc_event_publisher_cancel_complete_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned int *)(*(void *)(a1 + 40) + 80LL));
}

uint64_t _xpc_token_cache_get_at_index(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 4) <= a2) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return a1 + 24LL * a2 + 8;
}

uint64_t ___xpc_event_publisher_setup_poll_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64LL) = 0LL;
  return _os_object_release_internal();
}

void ___xpc_event_publisher_setup_poll_block_invoke_2(uint64_t a1)
{
  xpc_object_t xdict = 0LL;
  int int64 = xpc_pipe_receive(*(_DWORD *)(a1 + 40), &xdict, 0);
  if (int64 || (int int64 = xpc_dictionary_get_int64(xdict, "error")) != 0)
  {
    if (xdict) {
      xpc_release(xdict);
    }
    _xpc_event_publisher_error(*(void *)(a1 + 32), int64);
  }

  else
  {
    xpc_release(xdict);
    _xpc_event_publisher_fetch_subscriptions(*(void *)(a1 + 32));
    _xpc_event_publisher_arm_poll(*(void *)(a1 + 32));
  }

void _xpc_event_publisher_error(uint64_t a1, int a2)
{
  if (!*(_DWORD *)(a1 + 80))
  {
    if (a2 == 5)
    {
      syslog(5, "Publisher %s was unable talk to launchd");
    }

    else if (a2 == 124)
    {
      syslog(5, "Publisher %s is removed by launchd");
    }

    else
    {
      __int16 v4 = xpc_strerror(a2);
      syslog(3, "Canceling event publisher for %s because of error: %d - %s", (const char *)(a1 + 88), a2, v4);
      *(_DWORD *)(a1 + 80) = a2;
      _xpc_event_publisher_cancel(a1);
    }
  }

void ___xpc_event_publisher_fire_impl_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
  *(_DWORD *)(v4 + 24) = 0;
  if (*(_DWORD *)(v3 + 24) == 2)
  {
    uint64_t v5 = 0LL;
    xpc_connection_t mach_service = 0LL;
    int v7 = 89;
LABEL_9:
    *(_DWORD *)(v4 + 24) = v7;
    goto LABEL_10;
  }

  uint64_t v8 = *(void *)(v3 + 72);
  if (!v8) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v9 = *(unsigned int *)(v8 + 4);
  if (!(_DWORD)v9)
  {
LABEL_8:
    uint64_t v5 = 0LL;
    xpc_connection_t mach_service = 0LL;
    int v7 = 132;
    goto LABEL_9;
  }

  uint64_t v5 = v8 + 8;
  while (*(void *)v5 != v2)
  {
    v5 += 24LL;
    if (!--v9) {
      goto LABEL_8;
    }
  }

  uint64_t v14 = *(void **)(v5 + 8);
  if (v14)
  {
    xpc_connection_t mach_service = (_xpc_connection_s *)xpc_retain(v14);
  }

  else
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)(v3 + 88), *(dispatch_queue_t *)(v3 + 16), 0LL);
    xpc_connection_set_event_channel((uint64_t)mach_service, v2);
    _os_object_retain_internal();
    uint64_t barrier = MEMORY[0x1895FED80];
    uint64_t v16 = 0x40000000LL;
    unsigned int v17 = ___xpc_event_publisher_create_connection_block_invoke;
    uint64_t v18 = &__block_descriptor_tmp_51;
    uint64_t v19 = v3;
    uint64_t v20 = v2;
    uint64_t v21 = mach_service;
    xpc_connection_set_event_handler(mach_service, &barrier);
    xpc_connection_activate(mach_service);
    *(void *)(v5 + 8) = xpc_retain(mach_service);
  }

LABEL_10:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = mach_service;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      if (*(_WORD *)(v10 + 84))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v10 + 16));
        if (!v5) {
          _xpc_mach_message_request_handoff_reply_cold_1();
        }
        unsigned int v11 = *(unsigned __int16 *)(v5 + 16);
        if (v11 >= *(unsigned __int16 *)(v10 + 86))
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 55;
        }

        else
        {
          if (v11 == *(unsigned __int16 *)(v10 + 84))
          {
            uint64_t v13 = *(void *)v5;
            xpc_object_t v12 = *(_xpc_connection_s **)(v5 + 8);
            uint64_t barrier = MEMORY[0x1895FED80];
            uint64_t v16 = 0x40000000LL;
            unsigned int v17 = ___xpc_event_publisher_check_and_update_inflight_count_block_invoke;
            uint64_t v18 = &__block_descriptor_tmp_52;
            uint64_t v19 = v10;
            uint64_t v20 = v13;
            xpc_connection_send_barrier(v12, &barrier);
            LOWORD(v11) = *(_WORD *)(v5 + 16);
          }

          *(_WORD *)(v5 + 16) = v11 + 1;
        }
      }
    }
  }

    if (!v1 || v1 < v1 + 64) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if (v8 - (void)v7 != 1)
  {
    uint64_t v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v3)
    {
      uint64_t v4 = "BOOLean should be exactly 1 byte";
      goto LABEL_9;
    }

    goto LABEL_10;
  }

__objc2_class *___xpc_event_publisher_create_connection_block_invoke(uint64_t a1, __objc2_class **object)
{
  xpc_object_t result = (__objc2_class *)xpc_get_type(object);
  if (result != &OBJC_CLASS___OS_xpc_error) {
    xpc_object_t result = (__objc2_class *)_os_assumes_log();
  }
  if (object == &_xpc_error_connection_invalid)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 72LL);
    if (v5)
    {
      uint64_t v6 = *(unsigned int *)(v5 + 4);
      if ((_DWORD)v6)
      {
        int v7 = (void *)(v5 + 16);
        while (*(v7 - 1) != *(void *)(a1 + 40))
        {
          v7 += 3;
          if (!--v6) {
            goto LABEL_12;
          }
        }

        if (*v7 == *(void *)(a1 + 48)) {
          *int v7 = 0LL;
        }
      }
    }

LABEL_12:
    xpc_release(*(xpc_object_t *)(a1 + 48));
    return (__objc2_class *)_os_object_release_internal();
  }

  return result;
}

  __break(0x5519u);
LABEL_13:
  uint64_t v5 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_BOOL_from_context",  "Attempting to select a BOOLean value from a non-BOOLean DER object");
  return der_vm_data_from_context(v5);
}

    uint64_t v9 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (!v9) {
      return 1LL;
    }
    if (!v3 || v3 < v3 + 64)
    {
      v9(v3, "[%s]: %s\n", "der_vm_execute_match_integer", "BOOL decode failure");
      return 1LL;
    }

uint64_t ___xpc_event_publisher_check_and_update_inflight_count_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(unsigned int *)(v2 + 4);
  if ((_DWORD)v3)
  {
    unsigned int v4 = *(unsigned __int16 *)(v1 + 84);
    for (i = (_WORD *)(v2 + 24); *((void *)i - 2) != *(void *)(result + 40); i += 12)
    {
      if (!--v3) {
        return result;
      }
    }

    unsigned int v6 = (unsigned __int16)*i;
    BOOL v7 = v6 >= v4;
    __int16 v8 = v6 - v4;
    if (!v7) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    _WORD *i = v8;
  }

  return result;
}

void ___xpc_event_publisher_set_subscriptions_block_invoke(uint64_t a1)
{
}

void ___xpc_event_publisher_set_subscriptions_block_invoke_2(uint64_t a1)
{
}

void ___xpc_event_publisher_set_subscriptions_block_invoke_3(uint64_t a1)
{
}

void ___xpc_event_publisher_set_subscriptions_block_invoke_4(uint64_t a1)
{
}

uint64_t _xpc_install_dispatch_hooks()
{
  return dispatch_mach_hooks_install_4libxpc();
}

char *_xpc_connection_pretty_name(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  xpc_object_t result = "(anonymous)";
  switch(v1)
  {
    case 0:
      xpc_object_t result = *(char **)(a1 + 152);
      if (result) {
        goto LABEL_3;
      }
      break;
    case 1:
      return result;
    case 2:
      xpc_object_t result = *(char **)(a1 + 152);
      if (result) {
LABEL_3:
      }
        xpc_object_t result = (char *)dispatch_queue_get_label((dispatch_queue_t)result);
      break;
    case 3:
      xpc_object_t result = "(dummy)";
      break;
    default:
      xpc_object_t result = "(bogus)";
      break;
  }

  return result;
}

uint64_t _xpc_connection_copy()
{
  return 0LL;
}

BOOL _xpc_connection_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_connection_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1895FEE08];
  __int128 v39 = 0u;
  __int128 v40 = 0u;
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
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v10 = 0u;
  unsigned int v4 = _xpc_connection_pretty_name(a1);
  if ((*(_WORD *)(a1 + 224) & 8) != 0) {
    uint64_t v5 = "true";
  }
  else {
    uint64_t v5 = "false";
  }
  unsigned int v6 = snprintf( __str,  0x200uLL,  "<%s: %p> { name = %s, listener = %s, pid = %d, euid = %u, egid = %u, asid = %u }",  "connection",  (const void *)a1,  v4,  v5,  *(_DWORD *)(a1 + 124),  *(_DWORD *)(a1 + 108),  *(_DWORD *)(a1 + 112),  *(_DWORD *)(a1 + 128));
  if (v6 >= 0x1FF) {
    int v7 = 511;
  }
  else {
    int v7 = v6;
  }
  return _xpc_serializer_append(a2, __str, (v7 + 1), 0);
}

size_t _xpc_connection_debug(uint64_t a1, char *a2, size_t a3)
{
  unint64_t v6 = atomic_load((unint64_t *)(a1 + 96));
  int v7 = "<none>";
  if (v6)
  {
    int v8 = *(_DWORD *)v6;
    uint64_t v9 = *(const char **)(v6 + 8);
    if (v9) {
      int v7 = v9;
    }
  }

  else
  {
    int v8 = 0;
  }

  __int128 v10 = _xpc_copy_nsobject_debug_description(*(void **)(a1 + 152));
  if (a3 < 2)
  {
    size_t v17 = 0LL;
  }

  else
  {
    label = *(dispatch_queue_s **)(a1 + 152);
    if (label) {
      label = (dispatch_queue_s *)dispatch_queue_get_label(label);
    }
    __int16 v12 = *(_WORD *)(a1 + 224);
    if ((v12 & 4) != 0) {
      __int128 v13 = "true";
    }
    else {
      __int128 v13 = "false";
    }
    if ((v12 & 0x10) != 0) {
      __int128 v14 = "true";
    }
    else {
      __int128 v14 = "false";
    }
    __int128 v15 = "<no channel>";
    if (v10) {
      __int128 v15 = v10;
    }
    int v16 = snprintf( a2,  a3,  ", name = %s, type = %s, state = %s, cancelation = (%u, %s), mach = %s, privileged = %s, bssend = 0x%x, recv = 0x%x, send = 0x%x, pid = %d, euid = %u, egid = %u, asid = %u, channel: %s",  (const char *)label,  type2str[*(int *)(a1 + 24)],  state2str[*(int *)(a1 + 64)],  v8,  v7,  v13,  v14,  *(_DWORD *)(a1 + 72),  *(_DWORD *)(a1 + 68),  *(_DWORD *)(a1 + 76),  *(_DWORD *)(a1 + 124),  *(_DWORD *)(a1 + 108),  *(_DWORD *)(a1 + 112),  *(_DWORD *)(a1 + 128),  v15);
    if (v16 >= a3) {
      size_t v17 = a3 - 1;
    }
    else {
      size_t v17 = v16;
    }
  }

  free(v10);
  return v17;
}

uint64_t _xpc_connection_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 69632;
  return _xpc_serializer_append(a2, &__src, 4uLL, 1);
}

uint64_t _xpc_connection_deserialize()
{
  return 0LL;
}

uint64_t _xpc_connection_wire_length()
{
  return -1LL;
}

void _xpc_connection_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64) != 7) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (*(_DWORD *)(a1 + 28))
  {
    unsigned int v4 = _xpc_asprintf("Release of a suspended connection.");
    _xpc_api_misuse(v4);
  }

  _Block_release(*(const void **)(a1 + 176));
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    _Block_release(*(const void **)(a1 + 32));
    *(_BYTE *)(a1 + 40) = 0;
  }

  *(void *)(a1 + 32) = 0LL;
  dispatch_release(*(dispatch_object_t *)(a1 + 152));
  free(*(void **)(a1 + 216));
  *(void *)(a1 + 216) = 0LL;
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2)
  {
    free(*(void **)(v2 + 8));
    free(*(void **)(a1 + 96));
    *(void *)(a1 + 96) = 0LL;
  }

  _Block_release(*(const void **)(a1 + 232));
  uint64_t v3 = *(xpc_object_t **)(a1 + 200);
  if (v3)
  {
    os_map_128_destroy();
    uint64_t v3 = *(xpc_object_t **)(a1 + 200);
    if (v3[3])
    {
      xpc_release(v3[3]);
      uint64_t v3 = *(xpc_object_t **)(a1 + 200);
    }
  }

  free(v3);
  *(void *)(a1 + 200) = 0LL;
}

uint64_t _xpc_connection_get_platform(uint64_t a1)
{
  return *(unsigned int *)(a1 + 192);
}

void do_mach_notify_port_deleted()
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: Misfired notification: port-deleted.";
  __break(1u);
}

uint64_t do_mach_notify_port_destroyed(uint64_t a1, mach_port_name_t a2)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  uint64_t v3 = (uint64_t *)pthread_getspecific(_mig_tsd);
  mach_port_context_t v11 = *v3;
  if (*(_DWORD *)(*v3 + 76) == a2)
  {
    if ((*(_WORD *)(v11 + 224) & 3) != 0)
    {
      _xpc_connection_bs_cancel(*v3, v4, v5, v6, v7, v8, v9, v10);
    }

    else
    {
      *(_DWORD *)(v11 + 64) = 4;
      _xpc_connection_init(v11);
      if (*(_DWORD *)(v11 + 64) == 5)
      {
        os_unfair_lock_lock_with_options();
        *(void *)&__int128 v12 = -1LL;
        *((void *)&v12 + 1) = -1LL;
        *(_OWORD *)(v11 + 120) = v12;
        *(_OWORD *)(v11 + 104) = v12;
        *(_DWORD *)(v11 + 124) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 88));
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(v11 + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1) {
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          }
          __int128 v13 = (os_log_s *)_xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 134217984;
            mach_port_context_t v16 = v11;
            _os_log_impl( &dword_180150000,  v13,  OS_LOG_TYPE_DEFAULT,  "[%p] Re-initialization successful; calling out to event handler with XPC_ERROR_CONNECTION_INTERRUPTED",
              (uint8_t *)&v15,
              0xCu);
          }
        }

        _xpc_connection_call_event_handler(v11, (uint64_t)&_xpc_error_connection_interrupted);
      }
    }
  }

  return 0LL;
}

uint64_t _xpc_connection_bs_cancel( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v10;
  BOOL v11;
  int v12;
  char v14;
  mach_port_type_t ptype;
  mach_port_name_t v9 = *(_DWORD *)(a1 + 72);
  if (v9 - 1 > 0xFFFFFFFD)
  {
    __int128 v12 = 3;
  }

  else
  {
    ptype = 0;
    uint64_t v10 = mach_port_type(*MEMORY[0x1895FFD48], v9, &ptype);
    if (v10) {
      mach_port_context_t v11 = v10 == 15;
    }
    else {
      mach_port_context_t v11 = 1;
    }
    if (!v11) {
      _os_assumes_log();
    }
    if ((ptype & 0x10000) != 0) {
      __int128 v12 = 4;
    }
    else {
      __int128 v12 = 3;
    }
  }

  return _xpc_connection_cancel(a1, v12, "finalizing BS connection", a4, a5, a6, a7, a8, v14);
}

uint64_t do_mach_notify_no_senders()
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  xpc_object_t v0 = (uint64_t *)pthread_getspecific(_mig_tsd);
  uint64_t v1 = *v0;
  if (_xpc_connection_cancel(*v0, 3, "client is gone", v2, v3, v4, v5, v6, v10)
    && _os_trace_lazy_init_completed_4libxpc()
    && (*(_WORD *)(v1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1) {
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    }
    uint64_t v7 = (os_log_s *)_xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(v1 + 124);
      int v10 = 134218240;
      uint64_t v11 = v1;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl( &dword_180150000,  v7,  OS_LOG_TYPE_DEFAULT,  "[%p] invalidated because the client process (pid %d) either cancelled the connection or exited",  (uint8_t *)&v10,  0x12u);
    }
  }

  return 0LL;
}

uint64_t _xpc_connection_cancel( uint64_t a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v12 = (char **)_xpc_alloc(0x10uLL);
  *(_DWORD *)__int16 v12 = a2;
  vasprintf(v12 + 1, a3, &a9);
  int v13 = (unint64_t *)(a1 + 96);
  while (!__ldxr(v13))
  {
    if (!__stlxr((unint64_t)v12, v13))
    {
      uint64_t v15 = 1LL;
      dispatch_mach_cancel();
      return v15;
    }
  }

  uint64_t v15 = 0LL;
  __clrex();
  free(v12[1]);
  free(v12);
  return v15;
}

uint64_t do_mach_notify_send_once(int a1)
{
  uint64_t v2 = (uint64_t *)pthread_getspecific(_mig_tsd);
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = *v2;
  uint64_t msg = dispatch_mach_msg_get_msg();
  mach_port_context_t context = _xpc_mach_msg_get_context(msg);
  if (*(_DWORD *)(v3 + 68) != a1)
  {
    if (context)
    {
      uint64_t v6 = (_DWORD *)atomic_load((unint64_t *)(v3 + 96));
      uint64_t v7 = &_xpc_error_connection_interrupted;
      if (v6 && *v6 != 4) {
        uint64_t v7 = &_xpc_error_connection_invalid;
      }
      _xpc_connection_call_reply_async((void *)v3, context, v7);
    }

    return 0LL;
  }

  if (v3 == context) {
    return 0LL;
  }
  _dyld_get_image_uuid();
  if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
    _dyld_get_shared_cache_range();
  }
  _os_log_simple();
  return 5LL;
}

void do_mach_notify_dead_name()
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: Misfired notification: dead-name.";
  __break(1u);
}

void _xpc_connection_last_xref_cancel( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  if (*(_DWORD *)(a1 + 28))
  {
    int v10 = _xpc_asprintf("Release of last reference on a suspended connection.");
    _xpc_api_misuse(v10);
  }

  if (_xpc_connection_cancel(a1, 2, "connection was released", a4, a5, a6, a7, a8, v11)
    && _os_trace_lazy_init_completed_4libxpc()
    && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1) {
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    }
    mach_port_name_t v9 = (os_log_s *)_xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = a1;
      _os_log_impl( &dword_180150000,  v9,  OS_LOG_TYPE_DEFAULT,  "[%p] invalidated after the last release of the connection object",  (uint8_t *)&v11,  0xCu);
    }
  }

uint64_t _xpc_connection_copy_listener_port(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  uint64_t checkin_port = dispatch_mach_get_checkin_port();
  unsigned int v12 = checkin_port;
  if ((checkin_port - 1) >= 0xFFFFFFFE)
  {
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      uint64_t v5 = (os_log_s *)_xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = a1;
        _os_log_impl( &dword_180150000,  v5,  OS_LOG_TYPE_DEFAULT,  "[%p] Channel could not return listener port.",  buf,  0xCu);
      }
    }

    int v6 = *(_DWORD *)(a1 + 24);
    if (v6 == 1)
    {
      uint64_t v9 = 68LL;
      if ((*(_WORD *)(a1 + 224) & 8) == 0) {
        uint64_t v9 = 72LL;
      }
      return _xpc_mach_port_try_retain_send(*(unsigned int *)(a1 + v9));
    }

    else
    {
      if (v6)
      {
        int v11 = _xpc_asprintf("Attempt to create an endpoint out of an unsupported connection type.");
        _xpc_api_misuse(v11);
      }

      int v7 = _xpc_connection_bootstrap_look_up_slow(a1, &v12);
      if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
      {
        if (_xpc_connection_log_handle__once != -1) {
          dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
        }
        int v8 = (os_log_s *)_xpc_connection_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          uint64_t v14 = a1;
          __int16 v15 = 1024;
          int v16 = v7;
          __int16 v17 = 1024;
          unsigned int v18 = v12;
          _os_log_impl( &dword_180150000,  v8,  OS_LOG_TYPE_DEFAULT,  "[%p] Falling back to bootstrap_look_up() = %d, lp: 0x%x",  buf,  0x18u);
        }
      }

      if (v7) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v12;
      }
    }
  }

  else
  {
    uint64_t v3 = _xpc_mach_port_try_retain_send(checkin_port);
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      uint64_t v4 = (os_log_s *)_xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v14 = a1;
        __int16 v15 = 1024;
        int v16 = v3;
        _os_log_impl(&dword_180150000, v4, OS_LOG_TYPE_DEFAULT, "[%p] Channel returned listener port: 0x%x", buf, 0x12u);
      }
    }
  }

  return v3;
}

int64_t _xpc_connection_bootstrap_look_up_slow(uint64_t a1, _DWORD *a2)
{
  unint64_t v4 = *(unsigned __int16 *)(a1 + 224);
  if ((v4 & 4) != 0)
  {
    if ((v4 & 0x200) != 0)
    {
      uint64_t v8 = 0LL;
      uint64_t v6 = *(void *)(a1 + 184);
      int v9 = 7;
      uint64_t v7 = 16LL;
    }

    else
    {
      int v10 = *(_DWORD *)(a1 + 84);
      if (v10 == -2) {
        int v9 = 7;
      }
      else {
        int v9 = 2;
      }
      uint64_t v6 = 0LL;
      if (v10 == -2) {
        uint64_t v8 = 0LL;
      }
      else {
        uint64_t v8 = *(unsigned int *)(a1 + 84);
      }
      if (v10 == -2) {
        uint64_t v7 = (v4 >> 1) & 8;
      }
      else {
        uint64_t v7 = 0LL;
      }
    }
  }

  else
  {
    pid_t v5 = getpid();
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = v5;
    LODWORD(v4) = *(unsigned __int16 *)(a1 + 224);
    int v9 = 5;
  }

  LODWORD(v11) = (v4 >> 3) & 4;
  if ((v4 & 0x40) != 0) {
    uint64_t v11 = 32LL;
  }
  else {
    uint64_t v11 = v11;
  }
  uint64_t v12 = v7 | v11;
  uint64_t v13 = *(const void **)(a1 + 216);
  if (v13) {
    v12 |= 0x400uLL;
  }
  unsigned int v14 = (v4 >> 7) & 1;
  if ((v4 & 3) == 3) {
    unsigned int v14 = 1;
  }
  if (v14) {
    v12 |= 0x80uLL;
  }
  if ((v4 & 3) == 1) {
    uint64_t v15 = v12 | 0x200;
  }
  else {
    uint64_t v15 = v12;
  }
  if ((v4 & 8) != 0 && !*(_DWORD *)(a1 + 24)) {
    v15 |= 0x100uLL;
  }
  BOOL v22 = 0;
  label = *(dispatch_queue_s **)(a1 + 152);
  if (label) {
    label = (dispatch_queue_s *)dispatch_queue_get_label(label);
  }
  int64_t v17 = _xpc_look_up_endpoint((char *)label, v9, v8, v6, (const unsigned __int8 *)(a1 + 160), v15, v13, a2, &v22);
  if (!(_DWORD)v17)
  {
    __int16 v18 = *(_WORD *)(a1 + 224);
    if ((v18 & 3) == 1)
    {
      if (v22) {
        __int16 v19 = 3;
      }
      else {
        __int16 v19 = 2;
      }
      *(_WORD *)(a1 + 224) = v18 & 0xFFFC | v19;
    }
  }

  __int128 v20 = *(dispatch_queue_s **)(a1 + 152);
  if (v20) {
    dispatch_queue_get_label(v20);
  }
  return v17;
}

BOOL _xpc_connection_check_in_with_ports(int a1, int a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1895FEE08];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  unint64_t v4 = &OBJC_CLASS___OS_xpc_connection;
  int v5 = 0x7FFFFFFF;
  int v6 = 0x7FFFFFFF;
  LODWORD(v7) = 2048;
  DWORD2(v7) = 3;
  int v10 = 5;
  int v11 = a2;
  int v12 = a1;
  int v13 = a3;
  LOWORD(v23) = 1024;
  _xpc_connection_check_in((uint64_t)&v4);
  return v10 == 6;
}

void _xpc_connection_check_in(uint64_t a1)
{
  if ((*(_WORD *)(a1 + 224) & 0x400) != 0)
  {
    uint64_t msg = 0LL;
    uint64_t v2 = (dispatch_object_s *)dispatch_mach_msg_create();
    MEMORY[8] = *(_DWORD *)(a1 + 72);
    MEMORY[0] = 0x3480000013LL;
    MEMORY[0xC] = xmmword_180188200;
    unsigned __int16 v3 = MEMORY[0x30];
    MEMORY[0x30] &= 0xFFFFFFu;
    int v4 = *(_DWORD *)(a1 + 68);
    MEMORY[0x30] = v3 | 0x140000;
    unsigned __int16 v5 = MEMORY[0x24];
    MEMORY[0x24] &= 0xFFFFFFu;
    MEMORY[0x28] = v4;
    MEMORY[0x1C] = *(_DWORD *)(a1 + 76);
    MEMORY[0x24] = v5 | 0x100000;
    if ((*(_BYTE *)(a1 + 17) & 8) != 0)
    {
      if (mach_msg(0LL, 1, 0x34u, 0, 0, 0, 0))
      {
        _os_assumes_log();
      }

      else
      {
        ++*(_DWORD *)(a1 + 64);
      }
    }

    else
    {
      mach_port_name_t name = 0;
      if (_xpc_mach_port_setup_port_destroyed(*(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 68), &name)
        || name && (_os_assumes_log(), _xpc_mach_port_release(name)))
      {
        _os_assumes_log();
      }

      if ((*(_WORD *)(a1 + 224) & 0x100) != 0)
      {
        dispatch_mach_reconnect();
      }

      else
      {
        *(_WORD *)(a1 + 224) |= 0x100u;
        dispatch_mach_connect();
      }
    }

    dispatch_release(v2);
  }

  else
  {
    *(_DWORD *)(a1 + 64) = 6;
    dispatch_mach_connect();
  }

xpc_object_t _xpc_connection_copy_attrs(uint64_t a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned __int16 v5 = v4;
  if (!a1)
  {
    if (!a2)
    {
      __int128 v16 = _xpc_asprintf("Attempt to get connection property with no connection and no target PID.");
      goto LABEL_23;
    }

    int64_t v7 = a2;
    goto LABEL_9;
  }

  mach_port_name_t v6 = *(_DWORD *)(a1 + 72);
  if (v6 + 1 < 2)
  {
    int64_t v7 = *(int *)(a1 + 124);
    if (!(_DWORD)v7)
    {
      if (!*(_DWORD *)(a1 + 24))
      {
        if ((*(_WORD *)(a1 + 224) & 4) != 0)
        {
          __int128 v9 = "type";
          uint64_t v8 = 7LL;
        }

        else
        {
          xpc_dictionary_set_uint64(v4, "type", 5uLL);
          uint64_t v8 = getpid();
          __int128 v9 = "handle";
          xpc_object_t v4 = v5;
        }

        xpc_dictionary_set_uint64(v4, v9, v8);
        int v10 = *(dispatch_queue_s **)(a1 + 152);
        if (v10) {
          label = dispatch_queue_get_label(v10);
        }
        else {
          label = 0LL;
        }
        xpc_dictionary_set_string(v5, "name", label);
        goto LABEL_16;
      }

      __int128 v16 = _xpc_asprintf("Attempt to get connection property before it was populated.");
LABEL_23:
      _xpc_api_misuse(v16);
    }

BOOL _xpc_connection_is_invalid(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 96));
  return v1 != 0;
}

uint64_t _xpc_connection_create_internal_listener(char *a1)
{
  uint64_t result = xpc_connection_create_listener(a1);
  *(_WORD *)(result + 224) |= 0x8000u;
  return result;
}

uint64_t xpc_connection_create_listener(char *__s)
{
  uint64_t v1 = _xpc_connection_create(0, __s);
  *(_WORD *)(v1 + 224) |= 8u;
  self_audit_token = (_OWORD *)_xpc_get_self_audit_token();
  __int128 v3 = self_audit_token[1];
  *(_OWORD *)(v1 + 104) = *self_audit_token;
  *(_OWORD *)(v1 + 120) = v3;
  *(_DWORD *)(v1 + 88) = 0;
  return v1;
}

uint64_t _xpc_connection_activate_internal_listener(_WORD *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if ((a1[112] & 8) == 0)
  {
    __int128 v3 = _xpc_asprintf("connection must be a listener.");
    goto LABEL_8;
  }

  if ((a1[112] & 0x8000) == 0)
  {
    __int128 v3 = _xpc_asprintf("connection must be internal lifecycle.");
LABEL_8:
    _xpc_api_misuse(v3);
  }

  return _xpc_connection_activate_if_needed((mach_port_context_t)a1, 1);
}

uint64_t _xpc_connection_activate_if_needed(mach_port_context_t a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  __int128 v3 = (unsigned int *)(a1 + 64);
  do
  {
    if (__ldxr(v3))
    {
      uint64_t v5 = 0LL;
      __clrex();
      return v5;
    }

    uint64_t v5 = 1LL;
  }

  while (__stxr(1u, v3));
  *(_BYTE *)(a1 + 41) = 1;
  if (!*(void *)(a1 + 32))
  {
    __int128 v20 = _xpc_asprintf("Activation of a connection without an event handler.");
    goto LABEL_29;
  }

  if (a2)
  {
    mach_port_name_t v6 = (unsigned int *)(a1 + 28);
    do
      unsigned int v7 = __ldxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      __int128 v20 = _xpc_asprintf("Over-resume of a connection.");
LABEL_29:
      _xpc_api_misuse(v20);
    }
  }

  uint64_t v8 = *(void *)(a1 + 184);
  int inited = _os_trace_lazy_init_completed_4libxpc();
  if (v8)
  {
    if (inited && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      uint64_t v10 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = _xpc_connection_pretty_name(a1);
        uint64_t v12 = *(void *)(a1 + 184);
        int v21 = 134218498;
        mach_port_context_t v22 = a1;
        __int16 v23 = 2082;
        *(void *)uint64_t v24 = v11;
        *(_WORD *)&v24[8] = 2050;
        uint64_t v25 = v12;
        xpc_object_t v13 = "[%p] activating connection: name=%{public}s publishToken=%{public}llu";
        __int128 v14 = (os_log_s *)v10;
        uint32_t v15 = 32;
        goto LABEL_24;
      }
    }
  }

  else if (inited && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1) {
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    }
    uint64_t v16 = _xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = *(unsigned __int16 *)(a1 + 224);
      BOOL v18 = *(_DWORD *)(a1 + 24) == 2;
      int v21 = 134219010;
      mach_port_context_t v22 = a1;
      __int16 v23 = 1024;
      *(_DWORD *)uint64_t v24 = (v17 >> 2) & 1;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = (v17 >> 3) & 1;
      LOWORD(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 2) = v18;
      HIWORD(v25) = 2082;
      __int128 v26 = _xpc_connection_pretty_name(a1);
      xpc_object_t v13 = "[%p] activating connection: mach=%{BOOL}d listener=%{BOOL}d peer=%{BOOL}d name=%{public}s";
      __int128 v14 = (os_log_s *)v16;
      uint32_t v15 = 40;
LABEL_24:
      _os_log_impl(&dword_180150000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
    }
  }

  _xpc_retain(a1);
  _xpc_connection_init(a1);
  _xpc_release(a1);
  return v5;
}

uint64_t _xpc_connection_create(int a1, char *__s)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v13 = 0u;
  if (a1 == 2)
  {
    int v5 = snprintf(__str, 0x80uLL, "%s.%s");
LABEL_8:
    unint64_t v6 = v5;
    unsigned int v7 = &__str[v5 - 18];
    goto LABEL_11;
  }

  if (a1 == 1)
  {
    int v5 = snprintf(__str, 0x80uLL, "com.apple.xpc.anonymous.%s");
    goto LABEL_8;
  }

  if (a1)
  {
    unsigned int v7 = 0LL;
    unint64_t v6 = 0LL;
  }

  else
  {
    strlen(__s);
    if (_dyld_is_memory_immutable())
    {
      uint64_t v4 = _xpc_base_create();
      goto LABEL_15;
    }

    int v8 = snprintf(__str, 0x80uLL, "%s", __s);
    unsigned int v7 = 0LL;
    unint64_t v6 = v8;
  }

void xpc_connection_get_audit_token(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock_with_options();
  __int128 v5 = *(_OWORD *)(a1 + 120);
  *a2 = *(_OWORD *)(a1 + 104);
  a2[1] = v5;
  os_unfair_lock_unlock(v4);
}

void xpc_connection_set_instance(uint64_t a1, const unsigned __int8 *a2)
{
  if (*(_DWORD *)(a1 + 64))
  {
    __int128 v3 = _xpc_asprintf("Attempt to set instance on a live connection.");
    goto LABEL_6;
  }

  __int16 v2 = *(_WORD *)(a1 + 224);
  if ((v2 & 8) != 0)
  {
    __int128 v3 = _xpc_asprintf("Attempt to set instance on a listening connection.");
LABEL_6:
    _xpc_api_misuse(v3);
  }

  *(_WORD *)(a1 + 224) = v2 | 0x20;
  uuid_copy((unsigned __int8 *)(a1 + 160), a2);
}

void xpc_connection_set_oneshot_instance(uint64_t a1, const unsigned __int8 *a2)
{
  *(_WORD *)(a1 + 224) |= 0x40u;
  xpc_connection_set_instance(a1, a2);
}

uint64_t xpc_connection_set_instance_binpref(uint64_t a1, const void *a2)
{
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set instance binpref on a live connection.");
    goto LABEL_12;
  }

  __int16 v3 = *(_WORD *)(a1 + 224);
  if ((v3 & 8) != 0)
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set instance binpref on a listening connection.");
    goto LABEL_12;
  }

  if ((v3 & 4) != 0)
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set instance binpref on a MachService connection.");
    goto LABEL_12;
  }

  if ((v3 & 0x20) == 0)
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set binpref on a connection without instance uuid.");
LABEL_12:
    _xpc_api_misuse(v6);
  }

  uint64_t v4 = xpc_binprefs_copy(a2);
  *(void *)(a1 + 216) = v4;
  else {
    return xpc_binprefs_add(*(void *)(a1 + 216), -1, -1);
  }
}

void xpc_connection_get_instance(uint64_t a1, uuid_t dst)
{
}

uint64_t xpc_connection_get_filter_policy_id_4test(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) != 2)
  {
    __int16 v2 = _xpc_asprintf("Only peer connections have a filter policy");
    _xpc_api_misuse(v2);
  }

  return *(void *)(a1 + 184);
}

uint64_t _xpc_connection_get_recvp_4test(uint64_t a1)
{
  return *(unsigned int *)(a1 + 68);
}

uint64_t _xpc_connection_get_parent_4test(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t xpc_connection_set_legacy(uint64_t result)
{
  if (*(_DWORD *)(result + 64))
  {
    uint64_t v1 = _xpc_asprintf("Attempt to set non-bundled on a live connection.");
    _xpc_api_misuse(v1);
  }

  *(_WORD *)(result + 224) |= 4u;
  return result;
}

uint64_t xpc_connection_set_privileged(uint64_t result)
{
  if (*(_DWORD *)(result + 64))
  {
    uint64_t v1 = _xpc_asprintf("Attempt to set privileged bit on a live connection.");
    goto LABEL_6;
  }

  if (*(_DWORD *)(result + 84) != -2)
  {
    uint64_t v1 = _xpc_asprintf("Attempt to set privileged bit on a connection targetting a specific user.");
LABEL_6:
    _xpc_api_misuse(v1);
  }

  *(_WORD *)(result + 224) |= 0x10u;
  return result;
}

void xpc_connection_set_target_uid()
{
  xpc_object_t v0 = _xpc_asprintf("Setting the target UID for a connection is not supported on embedded platforms.");
  _xpc_api_misuse(v0);
}

uint64_t xpc_connection_set_target_user_session_uid(uint64_t a1, int a2)
{
  __int16 v2 = *(_WORD *)(a1 + 224);
  if ((v2 & 4) == 0)
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set target session UID on a non-MachService connection.");
    goto LABEL_12;
  }

  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set target session UID on a live connection.");
    goto LABEL_12;
  }

  if (a2 == -2)
  {
    unint64_t v6 = _xpc_asprintf("How does one look up a service owned by nobody?");
    goto LABEL_12;
  }

  if ((v2 & 0x10) != 0)
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set target session UID on a privileged connection.");
    goto LABEL_12;
  }

  uint64_t result = xpc_user_sessions_enabled();
  if ((result & 1) == 0)
  {
    unint64_t v6 = _xpc_asprintf("Attempt to set target session UID, but user sessions are not enabled.");
LABEL_12:
    _xpc_api_misuse(v6);
  }

  *(_DWORD *)(a1 + 84) = a2;
  return result;
}

uint64_t xpc_connection_set_event_channel(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(result + 24) == 2)
  {
    __int16 v2 = _xpc_asprintf("Can't set event channel on peer connection");
    _xpc_api_misuse(v2);
  }

  *(_WORD *)(result + 224) |= 0x200u;
  *(void *)(result + 184) = a2;
  return result;
}

uint64_t xpc_connection_set_non_launching(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 64))
  {
    __int16 v3 = _xpc_asprintf("Attempt to change the non-launching property on a live connection.");
    _xpc_api_misuse(v3);
  }

  if (a2) {
    __int16 v2 = 128;
  }
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(result + 224) = *(_WORD *)(result + 224) & 0xFF7F | v2;
  return result;
}

xpc_object_t xpc_connection_copy_entitlement_value(os_unfair_lock_s *a1, const char *a2)
{
  uint64_t v4 = a1 + 22;
  os_unfair_lock_lock_with_options();
  xpc_object_t v5 = _xpc_copy_entitlements_with_key(a1[31]._os_unfair_lock_opaque, (uint64_t)&a1[26], a2);
  os_unfair_lock_unlock(v4);
  return v5;
}

void xpc_connection_send_notification(unsigned int *a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    xpc_object_t v5 = _xpc_asprintf("Notification types other than dictionaries are not supported.");
    _xpc_api_misuse(v5);
  }

  uint64_t v4 = (void *)_xpc_connection_pack_message(a1, object, 0);
  *(_DWORD *)(_xpc_serializer_get_mach_message_header() + 20) = 805306368;
  _xpc_connection_enqueue(a1, 0x40000LL, (uint64_t)v4);
  xpc_release(v4);
}

uint64_t _xpc_connection_pack_message(unsigned int *a1, void *a2, int a3)
{
  int reply_port = _xpc_dictionary_extract_reply_port((uint64_t)a2);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(a2);
  if (reply_port && remote_connection && remote_connection != (xpc_connection_t)a1)
  {
    __int128 v14 = _xpc_asprintf("Attempt to send a message expecting a reply to the wrong connection.");
    _xpc_api_misuse(v14);
  }

  uint64_t v8 = _xpc_serializer_create();
  uint64_t v9 = v8;
  if (a3)
  {
    *(_DWORD *)(v8 + 152) = a3;
    int v10 = 5376;
  }

  else
  {
    int v10 = 0;
  }

  int v11 = (_DWORD *)_xpc_serializer_pack(v8, (uint64_t)a2, a1[48], 0);
  if (reply_port)
  {
    v11[5] = 0x20000000;
    int v12 = 18;
  }

  else
  {
    int v12 = 19;
  }

  *v11 |= v12 | v10;
  v11[2] = reply_port;
  v11[3] = a3;
  return v9;
}

void _xpc_connection_enqueue(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1[29];
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(void *)(a3 + 32), *(void *)(a3 + 40));
  }
  if ((*(_BYTE *)(_xpc_serializer_get_mach_message_header() + 1) & 0x1F) != 0)
  {
    xpc_retain(a1);
    _xpc_retain(a3);
    _xpc_received_message_get_connection(a3);
    dispatch_mach_send_with_result_and_async_reply_4libxpc();
  }

  else
  {
    _xpc_received_message_get_connection(a3);
    dispatch_mach_send_with_result();
  }

  _xpc_connection_enqueue_cold_1(0LL);
}

void xpc_connection_kill(uint64_t a1, int a2)
{
  uint64_t v47 = *MEMORY[0x1895FEE08];
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t object = 0LL;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
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
  __int128 v20 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  *(_OWORD *)__str = 0u;
  if ((*(_WORD *)(a1 + 224) & 0x20) != 0)
  {
    memset(out, 0, 37);
    uuid_unparse_upper((const unsigned __int8 *)(a1 + 160), out);
    unint64_t v6 = *(dispatch_queue_s **)(a1 + 152);
    if (v6) {
      dispatch_queue_get_label(v6);
    }
    snprintf(__str, 0x200uLL, "%s.%s");
  }

  else
  {
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 152);
    if (v5) {
      dispatch_queue_get_label(v5);
    }
    snprintf(__str, 0x200uLL, "%s");
  }

  xpc_dictionary_set_uint64(v4, "type", 5uLL);
  pid_t v7 = getpid();
  xpc_dictionary_set_uint64(v4, "handle", v7);
  xpc_dictionary_set_string(v4, "name", __str);
  xpc_dictionary_set_int64(v4, "signal", a2);
  int v8 = _xpc_domain_routine(812LL, v4, &object);
  if (v8)
  {
    int v9 = v8;
    if (v8 != 3 && v8 != 37)
    {
      int v10 = *(dispatch_queue_s **)(a1 + 152);
      if (v10) {
        label = dispatch_queue_get_label(v10);
      }
      else {
        label = 0LL;
      }
      int v12 = xpc_strerror(v9);
      syslog(3, "Could not signal service %s: %d: %s", label, v9, v12);
    }
  }

  else
  {
    xpc_release(object);
  }

  xpc_release(v4);
}

uint64_t xpc_connection_set_bootstrap(void *a1, void *a2)
{
  xpc_object_t v3 = xpc_retain(a1);
  xpc_object_t v4 = xpc_retain(a2);
  uint64_t v5 = _xpc_alloc(0x18uLL);
  *uint64_t v5 = v3;
  v5[1] = v4;
  v5[2] = 0LL;
  return dispatch_mach_send_barrier_f();
}

void _xpc_connection_set_bootstrap_impl(void *a1)
{
  xpc_object_t v3 = (void *)*a1;
  __int16 v2 = (void *)a1[1];
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "type", 5uLL);
  pid_t v5 = getpid();
  xpc_dictionary_set_uint64(v4, "handle", v5);
  unint64_t v6 = (dispatch_queue_s *)v3[19];
  if (v6) {
    label = dispatch_queue_get_label(v6);
  }
  else {
    label = 0LL;
  }
  xpc_dictionary_set_string(v4, "name", label);
  xpc_dictionary_set_value(v4, "bootstrap", v2);
  xpc_object_t object = 0LL;
  else {
    xpc_release(object);
  }
  xpc_release(v4);
  xpc_release(v3);
  xpc_release(v2);
  free(a1);
}

xpc_object_t xpc_connection_is_extension(uint64_t a1)
{
  xpc_object_t result = _xpc_connection_copy_attrs(a1, -1);
  if (result)
  {
    __int16 v2 = result;
    BOOL v3 = xpc_dictionary_get_BOOL(result, "extension");
    xpc_release(v2);
    return (xpc_object_t)v3;
  }

  return result;
}

char *xpc_connection_copy_bundle_id(uint64_t a1)
{
  xpc_object_t v1 = _xpc_connection_copy_attrs(a1, -1);
  if (!v1) {
    return 0LL;
  }
  __int16 v2 = v1;
  string = xpc_dictionary_get_string(v1, "bundle-id");
  if (string) {
    xpc_object_t v4 = _xpc_strdup(string);
  }
  else {
    xpc_object_t v4 = 0LL;
  }
  xpc_release(v2);
  return v4;
}

__objc2_class *xpc_connection_set_bs_type(uint64_t a1, int a2)
{
  xpc_object_t result = (__objc2_class *)xpc_get_type((xpc_object_t)a1);
  if (result != &OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*(_DWORD *)(a1 + 64))
  {
    pid_t v5 = _xpc_asprintf("Attempt to change the bs_managed propertyon a live connection.");
    goto LABEL_11;
  }

  if (!*(_DWORD *)(a1 + 24))
  {
    if ((a2 & 0xFE) != 2) {
      goto LABEL_7;
    }
    pid_t v5 = _xpc_asprintf("Cannot set specific when not from endpoint.");
LABEL_11:
    _xpc_api_misuse(v5);
  }

  if (a2 == 1)
  {
    pid_t v5 = _xpc_asprintf("Cannot set TBD when from endpoint or anon.");
    goto LABEL_11;
  }

LABEL_7:
  *(_WORD *)(a1 + 224) = *(_WORD *)(a1 + 224) & 0xFFFC | a2 & 3;
  return result;
}

    pid_t v7 = (void *)os_transaction_create(string);
    uint int64 = xpc_dictionary_get_uint64(xdict, "_SequenceNumber");
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    int v9 = v5 ^ 1;
    int v10 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int128 v27 = string;
      __int128 v28 = 2048;
      __int128 v29 = uint64;
      _os_log_impl( &dword_180150000,  v10,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: beginning dispatch, activity name %{public}s, seqno %llu",  buf,  0x16u);
    }

    if ((_DWORD)v5) {
      xpc_object_t value = xpc_dictionary_get_value(xdict, "_ReplyEndpoint");
    }
    else {
      xpc_object_t value = 0LL;
    }
    __int128 v22 = 0LL;
    __int128 v23 = &v22;
    __int128 v24 = 0x2000000000LL;
    __int128 v25 = 0LL;
    int v12 = MEMORY[0x1895FED80];
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___xpc_activity_dispatch_block_invoke;
    block[3] = &unk_18962B3F0;
    __int128 v21 = v5 ^ 1;
    void block[6] = uint64;
    block[7] = a2;
    block[4] = &v22;
    void block[5] = string;
    void block[8] = v7;
    block[9] = value;
    dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
    if (!v23[3]) {
      goto LABEL_31;
    }
    if (value) {
      xpc_retain(value);
    }
    if (xdict) {
      xpc_retain(xdict);
    }
    if (a2)
    {
      if ((_DWORD)v5)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }

      else if (xdict)
      {
        xpc_retain(a2);
        __int128 v13 = (__objc2_class **)xpc_dictionary_get_value(xdict, "eligible");
        if (v13) {
          _xpc_activity_set_eligible((_BYTE *)v23[3], v13 == &_xpc_BOOL_true);
        }
        goto LABEL_24;
      }

      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_35;
    }

uint64_t xpc_connection_get_bs_type(_WORD *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return a1[112] & 3;
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  __int16 v3 = flags;
  if ((flags & 1) != 0)
  {
    xpc_connection_t result = (xpc_connection_t)xpc_connection_create_listener((char *)name);
  }

  else
  {
    xpc_connection_t result = (xpc_connection_t)_xpc_connection_create(0, (char *)name);
    *(void *)&__int128 v5 = -1LL;
    *((void *)&v5 + 1) = -1LL;
    *(_OWORD *)((char *)result + 120) = v5;
    *(_OWORD *)((char *)result + 104) = v5;
    *((_DWORD *)result + 31) = 0;
    *((_DWORD *)result + 22) = 0;
    *((_WORD *)result + 112) = *((_WORD *)result + 112) & 0xFFEF | (8 * v3) & 0x10;
  }

  *((_WORD *)result + 112) |= (32 * v3) & 0x80 | 4;
  return result;
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  __int16 v2 = (_xpc_connection_s *)_xpc_connection_create(1, 0LL);
  *((_DWORD *)v2 + 18) = _xpc_endpoint_copy_listener_port((uint64_t)endpoint);
  *((_DWORD *)v2 + 4) |= 1u;
  return v2;
}

void xpc_connection_set_qos_class_floor(dispatch_object_t *a1, dispatch_qos_class_t a2, int a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_set_qos_class_floor(a1[19], a2, a3);
}

uint64_t xpc_connection_set_qos_class_fallback(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return dispatch_set_qos_class_fallback();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_set_target_queue(*((dispatch_object_t *)connection + 19), targetq);
}

void _xpc_connection_set_event_handler_f(uint64_t a1, unint64_t a2)
{
  __int16 v2 = (unsigned __int128 *)(a1 + 32);
  do
    unsigned __int128 v3 = __ldxp(v2);
  while (__stxp(a2, v2));
  if ((WORD4(v3) & 0x100) != 0)
  {
    xpc_object_t v4 = _xpc_asprintf("_xpc_connection_set_event_handler_f called after connection activation");
    _xpc_api_misuse(v4);
  }

  if ((BYTE8(v3) & 1) != 0) {
    _Block_release((const void *)v3);
  }
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  unsigned __int128 v3 = _xpc_Block_copy_impl(handler);
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  xpc_object_t v4 = (unsigned __int128 *)((char *)connection + 32);
  do
  {
    unsigned __int128 v5 = __ldxp(v4);
    if ((WORD4(v5) & 0x100) != 0)
    {
      __clrex();
      _xpc_connection_set_event_handler_slow((unint64_t *)connection, (unint64_t)v3);
      return;
    }
  }

  while (__stlxp(__PAIR128__(1LL, (unint64_t)v3), v4));
  if ((BYTE8(v5) & 1) != 0) {
    _Block_release((const void *)v5);
  }
}

uint64_t _xpc_connection_set_event_handler_slow(unint64_t *a1, unint64_t a2)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  xpc_object_t v4 = a1 + 22;
  do
    unsigned __int128 v5 = (const void *)__ldxr(v4);
  while (__stlxr(a2, v4));
  if (v5) {
    _Block_release(v5);
  }
  _xpc_retain((uint64_t)a1);
  return dispatch_mach_receive_barrier_f();
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*((__int16 *)connection + 112) < 0)
  {
    xpc_object_t v4 = _xpc_asprintf("suspend is not allowed on this connection.");
    _xpc_api_misuse(v4);
  }

  dispatch_suspend(*((dispatch_object_t *)connection + 19));
  __int16 v2 = (unsigned int *)((char *)connection + 28);
  do
    unsigned int v3 = __ldxr(v2);
  while (__stxr(v3 + 1, v2));
}

void xpc_connection_activate(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*((__int16 *)connection + 112) < 0)
  {
    __int16 v2 = _xpc_asprintf("activate is not allowed on this connection.");
    _xpc_api_misuse(v2);
  }

  _xpc_connection_activate_if_needed((mach_port_context_t)connection, 1);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*((__int16 *)connection + 112) < 0)
  {
    xpc_object_t v4 = _xpc_asprintf("resume is not allowed on this connection.");
LABEL_12:
    _xpc_api_misuse(v4);
  }

  __int16 v2 = (unsigned int *)((char *)connection + 28);
  do
    unsigned int v3 = __ldxr(v2);
  while (__stlxr(v3 - 1, v2));
  if (v3 == 1)
  {
    if ((_xpc_connection_activate_if_needed((mach_port_context_t)connection, 0) & 1) != 0) {
      return;
    }
  }

  else if (!v3)
  {
    xpc_object_t v4 = _xpc_asprintf("Over-resume of a connection.");
    goto LABEL_12;
  }

  dispatch_resume(*((dispatch_object_t *)connection + 19));
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (xpc_get_type(message) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    unsigned __int128 v5 = _xpc_asprintf("Message types other than dictionaries are not supported.");
    _xpc_api_misuse(v5);
  }

  _xpc_ktrace_pid1();
  xpc_object_t v4 = (void *)_xpc_connection_pack_message((unsigned int *)connection, message, 0);
  _xpc_connection_enqueue(connection, 0LL, (uint64_t)v4);
  _xpc_ktrace_pid1();
  xpc_release(v4);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_mach_send_barrier();
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (xpc_get_type(message) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    int v10 = _xpc_asprintf("Message types other than dictionaries are not supported.");
    goto LABEL_12;
  }

  if ((*((_WORD *)connection + 112) & 0x80) != 0)
  {
    int v10 = _xpc_asprintf("send_message_with_reply is not allowed with a non-launching Mach service");
LABEL_12:
    _xpc_api_misuse(v10);
  }

  if (!replyq) {
    replyq = dispatch_get_global_queue(0LL, 0LL);
  }
  _xpc_ktrace_pid1();
  mach_port_name_t v8 = _xpc_mach_port_allocate(0x1002u, 0, 0LL);
  int v9 = (void *)_xpc_connection_pack_message((unsigned int *)connection, message, v8);
  v9[17] = _xpc_Block_copy_impl(handler);
  v9[18] = replyq;
  dispatch_retain(replyq);
  _xpc_connection_enqueue(connection, 0LL, (uint64_t)v9);
  _xpc_ktrace_pid1();
  xpc_release(v9);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  if (xpc_get_type(connection) == (xpc_type_t)&OBJC_CLASS___OS_xpc_connection)
  {
    if (xpc_get_type(message) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
    {
      if ((*((_WORD *)connection + 112) & 0x80) == 0)
      {
        _xpc_ktrace_pid1();
        uint64_t v4 = _xpc_connection_pack_message((unsigned int *)connection, message, 0);
        mach_message_header = (_DWORD *)_xpc_serializer_get_mach_message_header();
        *mach_message_header |= 0x1500u;
        if (!*((_DWORD *)connection + 48)) {
          mach_message_header[5] = 0x40000000;
        }
        xpc_retain(connection);
        _xpc_retain(v4);
        uint64_t v6 = *((void *)connection + 29);
        if (v6) {
          (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(void *)(v4 + 32), *(void *)(v4 + 40));
        }
        _xpc_received_message_get_connection(v4);
        dispatch_mach_send_with_result_and_wait_for_reply();
        _xpc_connection_enqueue_cold_1(0LL);
      }

      pid_t v7 = _xpc_asprintf("send_message_with_reply_sync is not allowed with a non-launching Mach service");
    }

    else
    {
      pid_t v7 = _xpc_asprintf("Message types other than dictionaries are not supported.");
    }

    _xpc_api_misuse(v7);
  }

  _xpc_api_misuse("Given object not of required type.");
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*((__int16 *)connection + 112) < 0)
  {
    mach_port_name_t v8 = _xpc_asprintf("cancel is not allowed on this connection.");
    _xpc_api_misuse(v8);
  }

  if (_xpc_connection_cancel((uint64_t)connection, 1, "xpc_connection_cancel()", v2, v3, v4, v5, v6, v9)
    && _os_trace_lazy_init_completed_4libxpc()
    && (*((_WORD *)connection + 112) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1) {
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    }
    pid_t v7 = (os_log_s *)_xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      xpc_connection_t v10 = connection;
      _os_log_impl( &dword_180150000,  v7,  OS_LOG_TYPE_DEFAULT,  "[%p] invalidated because the current process cancelled the connection by calling xpc_connection_cancel()",  (uint8_t *)&v9,  0xCu);
    }
  }

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*((_DWORD *)connection + 6)) {
    return 0LL;
  }
  uint64_t v3 = (dispatch_queue_s *)*((void *)connection + 19);
  if (!v3) {
    return 0LL;
  }
  else {
    return dispatch_queue_get_label(v3);
  }
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return *((_DWORD *)connection + 27);
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return *((_DWORD *)connection + 28);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return *((_DWORD *)connection + 31);
}

au_asid_t xpc_connection_get_asid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return *((_DWORD *)connection + 32);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_set_context(*((dispatch_object_t *)connection + 19), context);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return dispatch_get_context(*((dispatch_object_t *)connection + 19));
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_set_finalizer_f(*((dispatch_object_t *)connection + 19), finalizer);
}

__objc2_class *xpc_connection_enable_termination_imminent_event(uint64_t a1)
{
  xpc_connection_t result = (__objc2_class *)xpc_get_type((xpc_object_t)a1);
  if (result != &OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = _xpc_asprintf("Attempt to enable termination-imminent event on a live connection.");
    _xpc_api_misuse(v3);
  }

  *(_WORD *)(a1 + 224) |= 0x2000u;
  return result;
}

__objc2_class *xpc_connection_enable_sim2host_4sim(_DWORD *a1)
{
  xpc_connection_t result = (__objc2_class *)xpc_get_type(a1);
  if (result != &OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (a1[16])
  {
    uint64_t v3 = _xpc_asprintf("Attempt to change the sim-to-host mode on a live connection.");
    _xpc_api_misuse(v3);
  }

  a1[48] = 2;
  return result;
}

BOOL xpc_connection_get_peer_instance(_DWORD *a1, unsigned __int8 *a2)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (a1[6] != 2)
  {
    uint64_t v5 = _xpc_asprintf("xpc_connection_get_peer_instance() must be called on a peer connection.");
    _xpc_api_misuse(v5);
  }

  return _xpc_get_service_instance(a1[31], a2);
}

void *xpc_connection_set_distorter(const void **a1, const void *a2)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  _Block_release(a1[29]);
  xpc_connection_t result = _Block_copy(a2);
  a1[29] = result;
  return result;
}

uint64_t _xpc_connection_get_distorter(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return a1[29];
}

int xpc_connection_set_peer_code_signing_requirement(xpc_connection_t connection, const char *requirement)
{
  return 45;
}

uint64_t xpc_connection_set_peer_entitlement_exists_requirement(_xpc_connection_s *a1, const char *a2)
{
  xpc_object_t empty = xpc_array_create_empty();
  xpc_object_t v5 = xpc_array_create_empty();
  xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, 1LL);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, a2);
  xpc_array_append_value(empty, v5);
  uint64_t v6 = _xpc_connection_set_lwcr_entitlement_requirement(a1, empty);
  xpc_release(empty);
  xpc_release(v5);
  return v6;
}

uint64_t _xpc_connection_set_lwcr_entitlement_requirement(_xpc_connection_s *a1, void *a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_object_t v5 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v5, "$query", a2);
  xpc_dictionary_set_value(empty, "entitlements", v5);
  uint64_t v6 = _xpc_connection_set_lwcr_requirements(a1, empty);
  xpc_release(empty);
  xpc_release(v5);
  return v6;
}

uint64_t xpc_connection_set_peer_entitlement_matches_value_requirement( _xpc_connection_s *a1, const char *a2, void *a3)
{
  xpc_object_t empty = xpc_array_create_empty();
  xpc_object_t v7 = xpc_array_create_empty();
  xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, 1LL);
  xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, a2);
  xpc_array_append_value(empty, v7);
  xpc_release(v7);
  xpc_object_t v8 = xpc_array_create_empty();
  if (xpc_get_type(a3) == (xpc_type_t)&OBJC_CLASS___OS_xpc_BOOL)
  {
    int64_t v9 = 5LL;
  }

  else if (xpc_get_type(a3) == (xpc_type_t)&OBJC_CLASS___OS_xpc_string)
  {
    int64_t v9 = 3LL;
  }

  else
  {
    if (xpc_get_type(a3) != (xpc_type_t)&OBJC_CLASS___OS_xpc_int64)
    {
      type = xpc_get_type(a3);
      mach_port_name_t name = xpc_type_get_name(type);
      __int128 v14 = _xpc_asprintf("Attempting to set entitlement matching value with unsupported value type: %s", name);
      _xpc_api_misuse(v14);
    }

    int64_t v9 = 7LL;
  }

  xpc_array_set_int64(v8, 0xFFFFFFFFFFFFFFFFLL, v9);
  xpc_array_set_value(v8, 0xFFFFFFFFFFFFFFFFLL, a3);
  xpc_array_append_value(empty, v8);
  uint64_t v10 = _xpc_connection_set_lwcr_entitlement_requirement(a1, empty);
  xpc_release(v8);
  xpc_release(empty);
  return v10;
}

uint64_t xpc_connection_set_peer_team_identity_requirement(_xpc_connection_s *a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, "team-identifier-for-current-process", 1);
  if (a2) {
    xpc_dictionary_set_string(empty, "signing-identifier", a2);
  }
  int v9 = 6;
  __int128 v8 = xmmword_1801881AC;
  xpc_object_t lwcr_query_for_validation_category = xpc_create_lwcr_query_for_validation_category((int *)&v8, 5LL);
  xpc_dictionary_set_value(empty, "validation-category", lwcr_query_for_validation_category);
  xpc_release(lwcr_query_for_validation_category);
  uint64_t v6 = _xpc_connection_set_lwcr_requirements(a1, empty);
  xpc_release(empty);
  return v6;
}

uint64_t _xpc_connection_set_lwcr_requirements(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  lwcr_xpc_object_t dictionary = xpc_create_lwcr_dictionary(1LL, 0LL, object);
  uint64_t v5 = _xpc_connection_set_lwcr((uint64_t)a1, lwcr_dictionary);
  if (!(_DWORD)v5)
  {
    uint64_t v6 = xpc_copy_clean_description((unint64_t *)object);
    if (_os_trace_lazy_init_completed_4libxpc() && (*((_WORD *)a1 + 112) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      xpc_object_t v7 = (os_log_s *)_xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134218498;
        uint64_t v10 = a1;
        __int16 v11 = 2080;
        mach_port_name_t name = xpc_connection_get_name(a1);
        __int16 v13 = 2080;
        __int128 v14 = v6;
        _os_log_impl( &dword_180150000,  v7,  OS_LOG_TYPE_DEFAULT,  "[%p] Set peer lightweight code requirement on connection (%s): %s",  (uint8_t *)&v9,  0x20u);
      }
    }

    free(v6);
  }

  xpc_release(lwcr_dictionary);
  return v5;
}

uint64_t xpc_connection_set_peer_platform_identity_requirement(_xpc_connection_s *a1, const char *a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v5 = empty;
  if (a2) {
    xpc_dictionary_set_string(empty, "signing-identifier", a2);
  }
  int v9 = 1;
  xpc_object_t v6 = xpc_create_lwcr_query_for_validation_category(&v9, 1LL);
  xpc_dictionary_set_value(v5, "validation-category", v6);
  xpc_release(v6);
  uint64_t v7 = _xpc_connection_set_lwcr_requirements(a1, v5);
  xpc_release(v5);
  return v7;
}

uint64_t xpc_connection_set_peer_lightweight_code_requirement(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return _xpc_connection_set_lwcr_requirements(a1, object);
  }
  if (xpc_get_type(object) != (xpc_type_t)&OBJC_CLASS___OS_xpc_data)
  {
    type = xpc_get_type(object);
    mach_port_name_t name = xpc_type_get_name(type);
    int v9 = _xpc_asprintf("Attempting to set LWCR with invalid type: %s", name);
    _xpc_api_misuse(v9);
  }

  uint64_t result = _xpc_connection_set_lwcr((uint64_t)a1, object);
  if (!(_DWORD)result)
  {
    uint64_t result = _os_trace_lazy_init_completed_4libxpc();
    if ((_DWORD)result)
    {
      if ((*((_WORD *)a1 + 112) & 0x4000) != 0) {
        return 0LL;
      }
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      uint64_t v5 = (os_log_s *)_xpc_connection_log_handle__log;
      BOOL v6 = os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0LL;
      if (v6)
      {
        *(_DWORD *)buf = 134218242;
        __int16 v11 = a1;
        __int16 v12 = 2080;
        __int16 v13 = xpc_connection_get_name(a1);
        _os_log_impl( &dword_180150000,  v5,  OS_LOG_TYPE_DEFAULT,  "[%p] Set peer lightweight code requirement on connection: %s",  buf,  0x16u);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t _xpc_connection_set_lwcr(uint64_t a1, xpc_object_t object)
{
  *(void *)&v15[257] = *MEMORY[0x1895FEE08];
  if (*(void *)(a1 + 200))
  {
    uint64_t v10 = _xpc_asprintf("xpc_connection_set_peer_* family must be called no more than once");
    goto LABEL_26;
  }

  if (xpc_get_type(object) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_data)
    {
      data_from_lwcr_xpc_object_t dictionary = xpc_retain(object);
      goto LABEL_6;
    }

    type = xpc_get_type(object);
    xpc_type_get_name(type);
    uint64_t v10 = _xpc_asprintf("Attempting to set LWCR with invalid type: %s", v12);
LABEL_26:
    _xpc_api_misuse(v10);
  }

  data_from_lwcr_xpc_object_t dictionary = (void *)xpc_create_data_from_lwcr_dictionary(object);
  if (!data_from_lwcr_dictionary)
  {
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      __int128 v8 = (os_log_s *)_xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v14 = 134217984;
        *(void *)uint64_t v15 = a1;
        _os_log_impl( &dword_180150000,  v8,  OS_LOG_TYPE_DEFAULT,  "[%p] Unable to convert LWCR dictionary to LWCR data",  v14,  0xCu);
      }
    }

    return 22LL;
  }

LABEL_6:
  if (xpc_get_type(data_from_lwcr_dictionary) != (xpc_type_t)&OBJC_CLASS___OS_xpc_data) {
    _os_assumes_log();
  }
  self_audit_token = (_OWORD *)_xpc_get_self_audit_token();
  *(_OWORD *)buf = *self_audit_token;
  *(_OWORD *)&buf[16] = self_audit_token[1];
  bzero(v14, 0x404uLL);
  _xpc_connection_token_satisfies_lwcr(buf, data_from_lwcr_dictionary, v14);
  if (*(_DWORD *)v14 < 2u)
  {
    *(void *)(a1 + 200) = _xpc_alloc(0x20uLL);
    os_map_128_init();
    uint64_t v7 = 0LL;
    *(void *)(*(void *)(a1 + 200) + 24LL) = data_from_lwcr_dictionary;
    return v7;
  }

  if (_xpc_connection_log_handle__once != -1) {
    dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
  }
  BOOL v6 = (os_log_s *)_xpc_connection_log_handle__log;
  if (!os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
    return 22LL;
  }
  *(_DWORD *)buf = 134218242;
  *(void *)&uint8_t buf[4] = a1;
  *(_WORD *)&buf[12] = 2080;
  *(void *)&buf[14] = v15;
  uint64_t v7 = 22LL;
  _os_log_impl(&dword_180150000, v6, OS_LOG_TYPE_DEFAULT, "[%p] LWCR invalid: %s", buf, 0x16u);
  return v7;
}

char *xpc_connection_copy_invalidation_reason(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 96));
  else {
    return 0LL;
  }
}

__objc2_class *__xpc_connection_set_logging(_WORD *a1, int a2)
{
  uint64_t result = (__objc2_class *)xpc_get_type(a1);
  if (result != &OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (a2) {
    __int16 v5 = 0;
  }
  else {
    __int16 v5 = 0x4000;
  }
  a1[112] = a1[112] & 0xBFFF | v5;
  return result;
}

uint64_t _xpc_connection_extract_connection(uint64_t a1, BOOL *a2)
{
  if (a2) {
    *a2 = *(_DWORD *)(a1 + 24) == 2;
  }
  if (*(void *)(a1 + 32)) {
    _xpc_connection_call_event_handler(a1, (uint64_t)&_xpc_error_connection_invalid);
  }
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    _Block_release(*(const void **)(a1 + 32));
    *(_BYTE *)(a1 + 40) = 0;
  }

  *(void *)(a1 + 32) = 0LL;
  return a1;
}

uint64_t _xpc_connection_call_event_handler(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
  }

  else
  {
    mach_port_context_t context = dispatch_get_context(*(dispatch_object_t *)(a1 + 152));
    (*(void (**)(uint64_t, void *))(a1 + 32))(a2, context);
  }

  return _os_avoid_tail_call();
}

uint64_t _xpc_connection_handle_event_inline(void *a1, uint64_t a2, dispatch_object_t object, int a4)
{
  if ((unint64_t)(a2 - 3) >= 2)
  {
    if (a2 != 5) {
      return 0LL;
    }
    a4 = 268435459;
  }

  uint64_t result = (uint64_t)dispatch_get_context(object);
  if (result)
  {
    _xpc_connection_release_message(a1, (uint64_t)object, result, a4);
    return 1LL;
  }

  return result;
}

uint64_t _xpc_serializer_reply_queue_from_msg_context(uint64_t result)
{
  if (result) {
    return *(void *)(result + 144);
  }
  return result;
}

void _xpc_connection_handle_async_reply(_WORD *a1, uint64_t a2, dispatch_object_s *a3)
{
  uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if (a2 != 2)
  {
    if (a2 != 12) {
      _xpc_connection_handle_async_reply_cold_1(a2);
    }
    _xpc_connection_handle_disconnect_event((mach_port_context_t)a1, (uint64_t)a3, 12LL);
    return;
  }

  int msgh_id = msg->msgh_id;
  if (msgh_id > 805306367)
  {
    if (msgh_id != 805306368 && msgh_id != 1999646836 && msgh_id != 0x40000000) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  if (msgh_id == 0x10000000) {
    goto LABEL_20;
  }
  if (msgh_id != 0x20000000)
  {
LABEL_21:
    _xpc_connection_pass2mig((uint64_t)a1, (uint64_t)a3);
    return;
  }

  uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if ((a1[112] & 8) != 0)
  {
LABEL_20:
    mach_msg_destroy(msg);
    return;
  }

  mach_port_context_t context = _xpc_mach_msg_get_context((uint64_t)msg);
  __int16 v11 = _xpc_connection_unpack_message((uint64_t)a1, a3);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = &_xpc_error_connection_interrupted;
  }
  _xpc_connection_call_reply_async(a1, context, v12);
}

uint64_t _xpc_connection_wants_sigterm(unsigned __int16 *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return (a1[112] >> 13) & 1;
}

uint64_t _xpc_connection_release_message(xpc_object_t object, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 <= 268435458)
  {
    if (a4) {
      goto LABEL_18;
    }
    _xpc_serializer_clear_sent_descriptors(a3);
    goto LABEL_7;
  }

  if (a4 > 268435468)
  {
    if (a4 <= 268437507)
    {
      if (a4 == 268435469)
      {
        unsigned int v8 = *(_DWORD *)(dispatch_mach_msg_get_msg() + 4);
        if (v8 <= 0x40000) {
          _xpc_connection_release_message_cold_3(v8);
        }
        _xpc_connection_release_message_cold_4();
      }

      unsigned __int16 v7 = 1028;
    }

    else
    {
      if (a4 == 268437508 || a4 == 268439556) {
        goto LABEL_15;
      }
      unsigned __int16 v7 = 8196;
    }

    if (a4 != (v7 | 0x10000000)) {
      goto LABEL_18;
    }
LABEL_15:
    _xpc_connection_release_message_cold_2(a4);
  }

  if (a4 != 268435459) {
LABEL_18:
  }
    _xpc_connection_release_message_cold_1(a4);
LABEL_7:
  xpc_release(object);
  return _xpc_release(a3);
}

void _xpc_connection_handle_disconnect_event(mach_port_context_t a1, uint64_t a2, uint64_t a3)
{
  kern_return_t v11;
  char *v12;
  kern_return_t v13;
  char *v14;
  mach_port_type_t ptype;
  uint64_t msg = dispatch_mach_msg_get_msg();
  uint64_t v6 = *(unsigned int *)(msg + 12);
  if (a3 == 12)
  {
    mach_port_context_t context = _xpc_mach_port_get_context(*(_DWORD *)(msg + 12));
    unsigned int v8 = (_DWORD *)atomic_load((unint64_t *)(a1 + 96));
    int v9 = &_xpc_error_connection_interrupted;
    if (v8)
    {
      if (*v8 != 4) {
        int v9 = &_xpc_error_connection_invalid;
      }
    }

    _xpc_connection_call_reply_async((void *)a1, context, v9);
  }

  else
  {
    mach_port_name_t v10 = *(_DWORD *)(msg + 8);
    if (v10)
    {
      ptype = 0;
      __int16 v11 = mach_port_type(*MEMORY[0x1895FFD48], v10, &ptype);
      if (v11 && (__int16 v13 = v11, _os_assumes_log(), v13 == 15))
      {
        uint64_t v14 = _xpc_copy_nsobject_debug_description((void *)a1);
        uint64_t v12 = _xpc_asprintf("BUG IN (CLIENT OF?) LIBXPC: invalid disconnect oldsendp 0x%x, conn %s", v10, v14);
        free(v14);
        qword_18C50BCD8 = (uint64_t)v12;
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      if ((*(_WORD *)(a1 + 224) & 8) != 0)
      {
        *(_DWORD *)(a1 + 80) = v10;
      }

      else if (_xpc_mach_port_release(v10))
      {
        _os_assumes_log();
      }

      if (v10 == *(_DWORD *)(a1 + 76)) {
        *(_DWORD *)(a1 + 76) = 0;
      }
      if (v12)
      {
        qword_18C50BCD8 = 0LL;
        free(v12);
      }
    }

    else if ((_DWORD)v6)
    {
      if ((_DWORD)v6 != *(_DWORD *)(a1 + 68)) {
        _xpc_connection_handle_disconnect_event_cold_1((unsigned int *)(a1 + 68), v6);
      }
      *(_DWORD *)(a1 + 68) = 0;
    }
  }

void _xpc_connection_pass2mig(uint64_t a1, uint64_t a2)
{
  if (_mig_tsd_once != -1) {
    dispatch_once(&_mig_tsd_once, &__block_literal_global_1);
  }
  uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if (*(_DWORD *)(_xpc_mach_msg_get_audit_token((uint64_t)msg) + 20))
  {
    mach_msg_destroy(msg);
  }

  else
  {
    v7[0] = a1;
    v7[1] = a2;
    v7[2] = 0LL;
    if (pthread_setspecific(_mig_tsd, v7)) {
      _os_assumes_log();
    }
    int v6 = 0;
    memset(v5, 0, sizeof(v5));
    if (notify_server(msg, (uint64_t)v5))
    {
      if (v6) {
        _os_assumes_log();
      }
    }

    else
    {
      syslog(3, "MIG demux failed. This message ID is invalid: 0x%x", msg->msgh_id);
      mach_msg_destroy(msg);
    }

    if (pthread_setspecific(_mig_tsd, 0LL)) {
      _os_assumes_log();
    }
  }

__objc2_class **_xpc_connection_unpack_message(uint64_t a1, dispatch_object_s *a2)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  uint64_t msg = dispatch_mach_msg_get_msg();
  int v5 = _xpc_connection_check_peer_requirement(a1, msg);
  if (v5)
  {
    int v6 = v5;
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      unsigned __int16 v7 = (os_log_s *)_xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = a1;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_impl( &dword_180150000,  v7,  OS_LOG_TYPE_DEFAULT,  "[%p] Received message forbidden due to code signing requirement: %d",  buf,  0x12u);
      }
    }

    return &_xpc_error_peer_code_signing_requirement;
  }

  else
  {
    int v9 = (void *)voucher_copy();
    int v10 = *(_DWORD *)(msg + 20);
    if (v10 == 0x40000000 || v10 == 0x10000000)
    {
      _xpc_transaction_begin();
      int v12 = 1;
    }

    else
    {
      int v12 = 0;
    }

    *(void *)buf = 0LL;
    int v13 = xpc_receive_mach_msg(a2, v12, v9, (void *)a1, (uint64_t *)buf);
    uint64_t result = 0LL;
    if (v13 != -1)
    {
      if (v13) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      _xpc_connection_set_creds(a1, msg);
      return *(__objc2_class ***)buf;
    }
  }

  return result;
}

void _xpc_connection_call_reply_async(void *a1, mach_port_context_t guard, void *a3)
{
  if (!a3) {
    _xpc_connection_call_reply_async_cold_1();
  }
  int v6 = _xpc_alloc(0x18uLL);
  _xpc_serializer_invoke_reply(guard, a3);
  _Block_release(*(const void **)(guard + 136));
  dispatch_release(*(dispatch_object_t *)(guard + 144));
  xpc_release(a1);
  _xpc_release(guard);
  xpc_release(a3);
  free(v6);
}

uint64_t _xpc_connection_check_peer_requirement(uint64_t a1, uint64_t a2)
{
  *(void *)&v25[257] = *MEMORY[0x1895FEE08];
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_4;
  }
  uint64_t audit_token = _xpc_mach_msg_get_audit_token(a2);
  os_unfair_lock_lock_with_options();
  if (*(_DWORD *)(a1 + 124) != *(_DWORD *)(audit_token + 20))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
LABEL_8:
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1) {
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      }
      __int16 v15 = (os_log_s *)_xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)__int128 v25 = a1;
        _os_log_impl( &dword_180150000,  v15,  OS_LOG_TYPE_DEFAULT,  "[%p] A message is received from other than initial peer.",  buf,  0xCu);
      }
    }

    _xpc_connection_cancel(a1, 3, "peer image changed", v10, v11, v12, v13, v14, v18);
    return 153LL;
  }

  int v5 = *(_DWORD *)(a1 + 132);
  int v6 = *(_DWORD *)(audit_token + 28);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  if (v5 != v6) {
    goto LABEL_8;
  }
LABEL_4:
  if (!*(void *)(a1 + 200)) {
    return 0LL;
  }
  uint64_t v7 = _xpc_mach_msg_get_audit_token(a2);
  int v21 = *(_DWORD *)(v7 + 16);
  int v8 = *(_DWORD *)(v7 + 28);
  uint64_t v19 = *(void *)(v7 + 20);
  __int128 v20 = *(_OWORD *)v7;
  if (os_map_128_find()) {
    return 0LL;
  }
  int v16 = *(void **)(*(void *)(a1 + 200) + 24LL);
  if (!v16) {
    return 45LL;
  }
  bzero(buf, 0x404uLL);
  *(_OWORD *)__int128 v22 = v20;
  *(_DWORD *)&v22[16] = v21;
  *(void *)&v22[20] = v19;
  int v23 = v8;
  _xpc_connection_token_satisfies_lwcr(v22, v16, buf);
  if (!*(_DWORD *)buf) {
    goto LABEL_25;
  }
  if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1) {
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    }
    uint64_t v17 = (os_log_s *)_xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 v22 = 134218242;
      *(void *)&v22[4] = a1;
      *(_WORD *)&v22[12] = 2080;
      *(void *)&v22[14] = v25;
      _os_log_impl(&dword_180150000, v17, OS_LOG_TYPE_DEFAULT, "[%p] LWCR requirement doesn't match: %s", v22, 0x16u);
    }
  }

  uint64_t result = *(unsigned int *)buf;
  if (!*(_DWORD *)buf)
  {
LABEL_25:
    os_map_128_insert();
    return 0LL;
  }

  return result;
}

void _xpc_connection_set_creds(uint64_t a1, uint64_t a2)
{
  uint64_t audit_token = (__int128 *)_xpc_mach_msg_get_audit_token(a2);
  os_unfair_lock_lock_with_options();
  __int128 v4 = *audit_token;
  *(_OWORD *)(a1 + 120) = audit_token[1];
  *(_OWORD *)(a1 + 104) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

uint64_t _xpc_connection_token_satisfies_lwcr@<X0>(_OWORD *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = 0LL;
  unint64_t v8 = 0LL;
  if (!xpc_data_get_bytes_ptr_and_length(a2, &v9, &v8)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  bzero(a3, 0x404uLL);
  __int128 v5 = a1[1];
  v7[0] = *a1;
  v7[1] = v5;
  return amfi_launch_constraint_matches_process((uint64_t)v7, v9, v8, (uint64_t)a3);
}

uint64_t ___xpc_connection_pass2mig_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_mig_tsd, 0LL);
  if ((_DWORD)result) {
    _xpc_alloc_cold_1();
  }
  return result;
}

void _xpc_connection_init(mach_port_context_t context)
{
  uint64_t v52 = *MEMORY[0x1895FEE08];
  if ((*(_WORD *)(context + 224) & 4) == 0 && !*(void *)(context + 136) && *(_DWORD *)(context + 24) != 1) {
    _xpc_uncork_domain();
  }
  int v2 = *(_DWORD *)(context + 64);
  switch(v2)
  {
    case 1:
      int v3 = *(_DWORD *)(context + 24);
      if (v3 == 1)
      {
        if ((*(_WORD *)(context + 224) & 8) != 0) {
          goto LABEL_41;
        }
        if ((*(_BYTE *)(context + 16) & 1) == 0) {
          _xpc_mach_message_request_handoff_reply_cold_1();
        }
        goto LABEL_40;
      }

      if (v3) {
        goto LABEL_41;
      }
      unsigned int v4 = *(unsigned __int16 *)(context + 224);
      if ((v4 & 8) == 0)
      {
LABEL_40:
        *(_DWORD *)(context + 68) = _xpc_mach_port_allocate(0x202Bu, 6u, context);
        goto LABEL_41;
      }

      if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL)
      {
        uint64_t v5 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
      }

      else
      {
        uint64_t v5 = _os_alloc_once();
        unsigned int v4 = *(unsigned __int16 *)(context + 224);
      }

      uint64_t v6 = (v4 >> 5) & 0x10;
      int v7 = (v4 >> 7) & 1;
      int v8 = v4 & 3;
      if (v8 == 3) {
        int v7 = 1;
      }
      if (v7) {
        v6 |= 0x100uLL;
      }
      if (v8 == 1) {
        uint64_t v9 = v6 | 0x200;
      }
      else {
        uint64_t v9 = v6;
      }
      uint64_t v10 = v9 | 1;
      LOBYTE(buf.flags) = 0;
      label = *(dispatch_queue_s **)(context + 152);
      if (label) {
        label = (dispatch_queue_s *)dispatch_queue_get_label(label);
      }
      unsigned int v12 = _xpc_activate_endpoint((const char *)label, 6, 0LL, v9, (_DWORD *)(context + 68), (BOOL *)&buf);
      if (v12)
      {
        int v13 = v12;
        if ((v12 > 0x25 || ((1LL << v12) & 0x200000000ALL) == 0) && v12 != 124 && v12 != 159) {
          _os_assumes_log();
        }
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1) {
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          }
          uint64_t v14 = (os_log_s *)_xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            buf.uint32_t flags = 134218240;
            *(void *)&buf.mpl.mpl_qlimit = context;
            WORD2(buf.reserved[0]) = 1024;
            *(_DWORD *)((char *)buf.reserved + 6) = v13;
            _os_log_impl( &dword_180150000,  v14,  OS_LOG_TYPE_DEFAULT,  "[%p] listener failed to activate: xpc_error=%{errno}d",  (uint8_t *)&buf,  0x12u);
          }
        }

        goto LABEL_141;
      }

      __int16 v39 = *(_WORD *)(context + 224);
      if ((v39 & 3) == 1)
      {
        if (LOBYTE(buf.flags)) {
          __int16 v40 = 3;
        }
        else {
          __int16 v40 = 2;
        }
        *(_WORD *)(context + 224) = v39 & 0xFFFC | v40;
      }

      if (_xpc_mach_port_guard(*(_DWORD *)(context + 68), 1, context))
      {
        _os_assumes_log();
        int v13 = 9;
LABEL_141:
        __int16 v41 = *(_WORD *)(context + 224);
        __int128 v42 = "listener activation";
        __int128 v43 = "receive right creation";
        goto LABEL_152;
      }

LABEL_41:
      ++*(_DWORD *)(context + 64);
LABEL_42:
      if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
        uint64_t v16 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
      }
      else {
        uint64_t v16 = _os_alloc_once();
      }
      if (*(_DWORD *)(context + 24) == 2 && *(_BYTE *)(v16 + 168))
      {
        xpc_retain((xpc_object_t)context);
        *(_WORD *)(context + 224) |= 0x1000u;
      }

      int v2 = *(_DWORD *)(context + 64) + 1;
      *(_DWORD *)(context + 64) = v2;
LABEL_48:
      if (*(_DWORD *)(context + 24) == 2)
      {
        *(_DWORD *)uint64_t v47 = 0;
        int v17 = _xpc_mach_port_setup_no_more_senders( *(_DWORD *)(context + 68),  *(_DWORD *)(context + 68),  (mach_port_t *)v47);
        if (v17)
        {
          int v26 = v17;
          _os_assumes_log();
          if ((_os_trace_lazy_init_completed_4libxpc() & 1) != 0 && (*(_WORD *)(context + 224) & 0x4000) == 0)
          {
            if (_xpc_connection_log_handle__once != -1) {
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            }
            __int128 v27 = (os_log_s *)_xpc_connection_log_handle__log;
            if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
            {
              buf.uint32_t flags = 134218240;
              *(void *)&buf.mpl.mpl_qlimit = context;
              WORD2(buf.reserved[0]) = 1024;
              *(_DWORD *)((char *)buf.reserved + 6) = v26;
              _os_log_impl( &dword_180150000,  v27,  OS_LOG_TYPE_DEFAULT,  "[%p] failed to register a no-senders notification: mach_error=%{mach.errno}x",  (uint8_t *)&buf,  0x12u);
            }
          }

          __int16 v15 = "no-senders registration";
          int v13 = 9;
          goto LABEL_111;
        }

        if (*(_DWORD *)v47) {
          _xpc_connection_init_cold_3(*(unsigned int *)v47, (mach_port_name_t *)v47);
        }
        int v2 = *(_DWORD *)(context + 64);
      }

      *(_DWORD *)(context + 64) = v2 + 1;
LABEL_54:
      int v18 = *(_DWORD *)(context + 24);
      if (v18 == 1)
      {
        if ((*(_WORD *)(context + 224) & 8) != 0) {
          goto LABEL_109;
        }
        *(_DWORD *)(context + 72) = 0;
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1) {
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          }
          __int128 v22 = (os_log_s *)_xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            buf.uint32_t flags = 134217984;
            *(void *)&buf.mpl.mpl_qlimit = context;
            _os_log_impl( &dword_180150000,  v22,  OS_LOG_TYPE_DEFAULT,  "[%p] anonymous connection failed to decode send port",  (uint8_t *)&buf,  0xCu);
          }
        }

        int v13 = 9;
        goto LABEL_151;
      }

      if (!v18)
      {
        if ((*(_WORD *)(context + 224) & 8) != 0)
        {
          int send = _xpc_mach_port_make_send(*(_DWORD *)(context + 68));
          if (!send)
          {
            *(_DWORD *)(context + 76) = *(_DWORD *)(context + 68);
            goto LABEL_109;
          }

          int v44 = send;
          _os_assumes_log();
          if ((_os_trace_lazy_init_completed_4libxpc() & 1) != 0 && (*(_WORD *)(context + 224) & 0x4000) == 0)
          {
            if (_xpc_connection_log_handle__once != -1) {
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            }
            __int128 v45 = (os_log_s *)_xpc_connection_log_handle__log;
            if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
            {
              buf.uint32_t flags = 134218240;
              *(void *)&buf.mpl.mpl_qlimit = context;
              WORD2(buf.reserved[0]) = 1024;
              *(_DWORD *)((char *)buf.reserved + 6) = v44;
              _os_log_impl( &dword_180150000,  v45,  OS_LOG_TYPE_DEFAULT,  "[%p] listener failed to create a send right: mach_error=%{mach.errno}x",  (uint8_t *)&buf,  0x12u);
            }
          }

          int v13 = 24;
          goto LABEL_151;
        }

        uint32_t flags = *(_DWORD *)(context + 72);
        if (flags) {
          goto LABEL_58;
        }
        buf.uint32_t flags = 0;
        int v24 = _xpc_connection_bootstrap_look_up_slow(context, &buf);
        int v13 = v24;
        uint32_t flags = buf.flags;
        *(_DWORD *)(context + 72) = buf.flags;
        if (v24 > 123)
        {
          if ((v24 - 124) > 0x23 || ((1LL << (v24 - 124)) & 0x800200001LL) == 0) {
LABEL_155:
          }
            _os_assumes_log();
        }

        else
        {
          if (!v24)
          {
LABEL_58:
            if (!*(_DWORD *)(context + 192))
            {
              *(void *)&buf.uint32_t flags = 0x60000283FLL;
              *(_OWORD *)buf.reserved = flags;
              mach_port_name_t name = 0;
              int v20 = _xpc_try_mach_port_construct(&buf, context, &name);
              int v21 = v20;
              if (v20 > 16)
              {
                if (v20 != 17)
                {
                  if (v20 != 20) {
                    goto LABEL_100;
                  }
                  goto LABEL_107;
                }
              }

              else
              {
                if (!v20)
                {
                  int v29 = name;
                  if (name - 1 >= 0xFFFFFFFE) {
                    _xpc_mach_message_request_handoff_reply_cold_1();
                  }
                  goto LABEL_108;
                }

                if (v20 != 15) {
LABEL_100:
                }
                  _xpc_connection_init_cold_1(v20);
              }

              if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
              {
                if (_xpc_connection_log_handle__once != -1) {
                  dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
                }
                __int128 v28 = (os_log_s *)_xpc_connection_log_handle__log;
                if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v47 = 134218240;
                  mach_port_context_t v48 = context;
                  __int16 v49 = 1024;
                  int v50 = v21;
                  _os_log_impl( &dword_180150000,  v28,  OS_LOG_TYPE_DEFAULT,  "[%p] Failed to derive connection port; error %#x",
                    v47,
                    0x12u);
                }
              }
            }

  if (v13) {
    int v29 = v16;
  }
  else {
    int v29 = 1;
  }
  if ((v29 & 1) == 0)
  {
    __int128 v28 = -1;
    goto LABEL_46;
  }

  *(void *)(a2 + 96) = *(void *)(a1 + 16);
  return result;
}

  __break(0x5519u);
  return result;
}

LABEL_107:
            int v29 = _xpc_mach_port_allocate(0x203Fu, 6u, context);
LABEL_108:
            *(_DWORD *)(context + 76) = v29;
            *(_WORD *)(context + 224) |= 0x400u;
            goto LABEL_109;
          }

          if (v24 != 1 && v24 != 3) {
            goto LABEL_155;
          }
        }

        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1) {
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          }
          __int128 v25 = (os_log_s *)_xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            buf.uint32_t flags = 134218240;
            *(void *)&buf.mpl.mpl_qlimit = context;
            WORD2(buf.reserved[0]) = 1024;
            *(_DWORD *)((char *)buf.reserved + 6) = v13;
            _os_log_impl( &dword_180150000,  v25,  OS_LOG_TYPE_DEFAULT,  "[%p] failed to do a bootstrap look-up: xpc_error=%{errno}d",  (uint8_t *)&buf,  0x12u);
          }
        }

        *(_WORD *)(context + 224) |= 0x400u;
        if (!v13) {
          goto LABEL_109;
        }
LABEL_151:
        __int16 v41 = *(_WORD *)(context + 224);
        __int128 v42 = "send right creation";
        __int128 v43 = "lookup";
LABEL_152:
        if ((v41 & 8) != 0) {
          LOBYTE(v15) = (_BYTE)v42;
        }
        else {
          LOBYTE(v15) = (_BYTE)v43;
        }
        goto LABEL_111;
      }

LABEL_109:
      ++*(_DWORD *)(context + 64);
LABEL_110:
      _xpc_connection_check_in(context);
      int v13 = 0;
      LOBYTE(v15) = 0;
LABEL_111:
      int v2 = *(_DWORD *)(context + 64);
LABEL_112:
      if (v2 <= 4)
      {
        xpc_strerror(v13);
        if (_xpc_connection_cancel( context,  3,  "failed at %s%s with error %d - %s",  v30,  v31,  v32,  v33,  v34,  (char)v15))
        {
          __int16 v35 = *(_WORD *)(context + 224);
          int inited = _os_trace_lazy_init_completed_4libxpc();
          if ((v35 & 0x100) != 0)
          {
            if (!inited || (*(_WORD *)(context + 224) & 0x4000) != 0) {
              goto LABEL_128;
            }
            if (_xpc_connection_log_handle__once != -1) {
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            }
            __int128 v37 = (os_log_s *)_xpc_connection_log_handle__log;
            if (!os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_128;
            }
            buf.uint32_t flags = 134217984;
            *(void *)&buf.mpl.mpl_qlimit = context;
            __int128 v38 = "[%p] invalidated after a failed reconnect";
          }

          else
          {
            if (!inited || (*(_WORD *)(context + 224) & 0x4000) != 0) {
              goto LABEL_128;
            }
            if (_xpc_connection_log_handle__once != -1) {
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            }
            __int128 v37 = (os_log_s *)_xpc_connection_log_handle__log;
            if (!os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_128;
            }
            buf.uint32_t flags = 134217984;
            *(void *)&buf.mpl.mpl_qlimit = context;
            __int128 v38 = "[%p] invalidated after a failed init";
          }

          _os_log_impl(&dword_180150000, v37, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&buf, 0xCu);
        }

LABEL_128:
        if ((*(_WORD *)(context + 224) & 0x100) != 0) {
          dispatch_mach_reconnect();
        }
        else {
          dispatch_mach_connect();
        }
      }

      return;
    case 2:
      goto LABEL_42;
    case 3:
      goto LABEL_48;
    case 4:
      goto LABEL_54;
    case 5:
      goto LABEL_110;
    default:
      int v13 = 0;
      LOBYTE(v15) = 0;
      goto LABEL_112;
  }

os_log_t ___xpc_connection_log_handle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.xpc", "connection");
  _xpc_connection_log_handle__log = (uint64_t)result;
  return result;
}

void _xpc_connection_mach_event(mach_port_context_t a1, uint64_t a2, dispatch_object_t object, int a4)
{
  uint64_t v57 = *MEMORY[0x1895FEE08];
  uint64_t v4 = a2 - 2;
  switch(a2)
  {
    case 2LL:
    case 8LL:
    case 11LL:
    case 15LL:
      if (*(void *)(a1 + 176)) {
        _xpc_connection_update_event_handler(a1);
      }
      break;
    case 3LL:
    case 4LL:
      goto LABEL_26;
    case 5LL:
LABEL_25:
      a4 = 268435459;
LABEL_26:
      _xpc_connection_handle_sent_event(a1, object, a4, 0);
      return;
    case 7LL:
LABEL_27:
      _xpc_connection_handle_disconnect_event(a1, (uint64_t)object, 7LL);
      return;
    case 9LL:
LABEL_114:
      _xpc_connection_mach_event_cold_6();
    default:
      return;
  }

  switch(v4)
  {
    case 0LL:
      uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      int msgh_id = msg->msgh_id;
      if (msgh_id <= 805306367)
      {
        if (msgh_id != 0x10000000)
        {
          if (msgh_id == 0x20000000) {
            goto LABEL_74;
          }
LABEL_60:
          _xpc_connection_pass2mig(a1, (uint64_t)object);
          goto LABEL_75;
        }

LABEL_61:
        *(void *)mach_port_options_t buf = 0LL;
        uint64_t v29 = dispatch_mach_msg_get_msg();
        if ((*(_WORD *)(a1 + 224) & 8) != 0)
        {
          syslog(3, "Normal message received by listener connection. Ignoring.");
        }

        else if (!*(void *)(a1 + 96))
        {
          uint64_t v30 = _xpc_connection_unpack_message(a1, object);
          if (v30)
          {
            uint64_t v31 = v30;
            _xpc_connection_call_event_handler(a1, (uint64_t)v30);
            xpc_release(v31);
          }

          goto LABEL_75;
        }

        uint64_t msg = (mach_msg_header_t *)v29;
        goto LABEL_74;
      }

      if (msgh_id == 805306368 || msgh_id == 0x40000000) {
        goto LABEL_61;
      }
      if (msgh_id != 1999646836) {
        goto LABEL_60;
      }
      v47[1] = 0LL;
      uint64_t v10 = dispatch_mach_msg_get_msg();
      uint64_t v11 = v10;
      if (!*(void *)(a1 + 96))
      {
        v47[0] = 0LL;
        if ((*(_WORD *)(a1 + 224) & 8) != 0
          && *(_DWORD *)(v10 + 4) == 52
          && (*(_DWORD *)v10 & 0x80000000) != 0
          && *(_DWORD *)(v10 + 24) == 2
          && *(unsigned __int16 *)(v10 + 38) << 16 == 0x100000
          && *(unsigned __int16 *)(v10 + 50) << 16 == 1114112)
        {
          int v12 = _xpc_connection_check_peer_requirement(a1, v10);
          if (v12)
          {
            int v13 = v12;
            if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
            {
              if (_xpc_connection_log_handle__once != -1) {
                dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
              }
              uint64_t v14 = (os_log_s *)_xpc_connection_log_handle__log;
              if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)mach_port_options_t buf = 134218240;
                *(void *)&uint8_t buf[4] = a1;
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = v13;
                _os_log_impl( &dword_180150000,  v14,  OS_LOG_TYPE_DEFAULT,  "[%p] Dropping check-in message due to code signing requirement: %d",  buf,  0x12u);
              }
            }
          }

          else
          {
            v47[0] = 0LL;
            if (*(_DWORD *)(a1 + 24)) {
              goto LABEL_87;
            }
            if (*(_DWORD *)(a1 + 192)) {
              goto LABEL_87;
            }
            int v44 = MEMORY[0x186DF6E78]( *MEMORY[0x1895FFD48],  *(unsigned int *)(v11 + 28),  *(unsigned int *)(a1 + 68),  v47);
            if (!v44) {
              goto LABEL_87;
            }
            int v45 = v44;
            if (v44 == 20) {
              goto LABEL_87;
            }
            if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
            {
              if (_xpc_connection_log_handle__once != -1) {
                dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
              }
              __int128 v46 = (os_log_s *)_xpc_connection_log_handle__log;
              if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)mach_port_options_t buf = 134218496;
                *(void *)&uint8_t buf[4] = a1;
                *(_WORD *)&_BYTE buf[12] = 1024;
                *(_DWORD *)&buf[14] = v45;
                *(_WORD *)&buf[18] = 2048;
                *(void *)&buf[20] = v47[0];
                _os_log_impl( &dword_180150000,  v46,  OS_LOG_TYPE_DEFAULT,  "[%p] Failed to verify check-in connection port was derived from the listener connection port (kr=%d, s andbox_message_filter_id=#%llx)",  buf,  0x1Cu);
              }
            }

            if (v45 == 20)
            {
LABEL_87:
              uint64_t v36 = v47[0];
              uint64_t audit_token = _xpc_mach_msg_get_audit_token(v11);
              label = *(dispatch_queue_s **)(a1 + 152);
              if (label) {
                label = (dispatch_queue_s *)dispatch_queue_get_label(label);
              }
              __int128 v55 = 0u;
              __int128 v56 = 0u;
              __int128 v53 = 0u;
              __int128 v54 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              memset(buf, 0, sizeof(buf));
              snprintf((char *)buf, 0x80uLL, "%s.peer[%d]", (const char *)label, *(_DWORD *)(audit_token + 20));
              uint64_t v39 = _xpc_connection_create(2, (char *)buf);
              *(_DWORD *)(v39 + 68) = *(_DWORD *)(v11 + 28);
              *(_DWORD *)(v39 + 76) = *(_DWORD *)(v11 + 40);
              *(void *)(v39 + 136) = _xpc_retain(a1);
              *(_WORD *)(v39 + 224) = *(_WORD *)(v39 + 224) & 0xD7FF | 0x800;
              *(void *)(v39 + 184) = v36;
              uint64_t v40 = *(void *)(a1 + 144);
              *(_DWORD *)(v39 + 192) = *(_DWORD *)(a1 + 192);
              *(void *)(v39 + 48) = v40;
              if (v40) {
                *(void *)(v40 + 56) = v39 + 48;
              }
              *(void *)(a1 + 144) = v39;
              *(void *)(v39 + 56) = a1 + 144;
              _xpc_connection_set_creds(v39, v11);
              xpc_connection_suspend((xpc_connection_t)v39);
              _xpc_transaction_begin();
              _xpc_connection_call_event_handler(a1, v39);
              if (*(void *)(v39 + 96))
              {
                unint64_t v41 = atomic_load((unint64_t *)(v39 + 96));
                else {
                  __int128 v43 = 0LL;
                }
                *(void *)mach_port_options_t buf = 0LL;
                *(void *)&buf[8] = 0LL;
                uint64_t v48 = 0LL;
                uint64_t v49 = 0LL;
                if ((_dyld_get_image_uuid() & 1) == 0)
                {
                  *(void *)mach_port_options_t buf = 0LL;
                  *(void *)&buf[8] = 0LL;
                }

                if ((_dyld_get_shared_cache_uuid() & 1) != 0)
                {
                  _dyld_get_shared_cache_range();
                }

                else
                {
                  uint64_t v48 = 0LL;
                  uint64_t v49 = 0LL;
                }

                _os_log_simple();
                free(v43);
                xpc_connection_set_event_handler((xpc_connection_t)v39, &__block_literal_global_119);
                xpc_connection_resume((xpc_connection_t)v39);
                xpc_connection_activate((xpc_connection_t)v39);
              }

              else
              {
                xpc_connection_resume((xpc_connection_t)v39);
              }

              goto LABEL_75;
            }
          }
        }

        syslog(3, "Bogus check-in attempt. Ignoring.");
      }

      uint64_t msg = (mach_msg_header_t *)v11;
LABEL_74:
      mach_msg_destroy(msg);
LABEL_75:
      if ((*(_WORD *)(a1 + 224) & 0x800) != 0)
      {
        *(_WORD *)(a1 + 224) &= ~0x800u;
        _xpc_transaction_end();
      }

      return;
    case 1LL:
    case 2LL:
      goto LABEL_26;
    case 3LL:
      goto LABEL_25;
    case 5LL:
      goto LABEL_27;
    case 6LL:
      int v17 = (unsigned int *)(a1 + 64);
      int v16 = *(_DWORD *)(a1 + 64);
      if (v16 == 7) {
        _xpc_connection_mach_event_cold_5();
      }
      if (!v16) {
        _xpc_connection_mach_event_cold_4();
      }
      unsigned int v18 = *(_DWORD *)(a1 + 68);
      if (v18 + 1 >= 2) {
        _xpc_connection_mach_event_cold_2(v18);
      }
      unsigned int v19 = *(_DWORD *)(a1 + 76);
      if (v19 + 1 >= 2) {
        _xpc_connection_mach_event_cold_3(v19);
      }
      mach_port_name_t v20 = *(_DWORD *)(a1 + 72);
      *(_DWORD *)(a1 + 72) = 0;
      __int16 v21 = *(_WORD *)(a1 + 224);
      if ((v21 & 8) != 0)
      {
        __int128 v22 = *(unsigned int **)(a1 + 144);
        if (v22)
        {
          do
          {
            int v23 = v22;
            __int128 v22 = (unsigned int *)*((void *)v22 + 6);
            xpc_retain(v23);
            int v24 = v23 + 4;
            do
              unsigned int v25 = __ldxr(v24);
            while (__stxr(v25 | 0x400, v24));
            if ((v25 & 0x400) == 0)
            {
              xpc_retain(v23);
              _xpc_connection_remove_peer_impl(a1, v23);
            }

            xpc_connection_cancel((xpc_connection_t)v23);
            xpc_release(v23);
          }

          while (v22);
          __int16 v21 = *(_WORD *)(a1 + 224);
        }
      }

      if ((v21 & 0x800) != 0)
      {
        *(_WORD *)(a1 + 224) = v21 & 0xF7FF;
        _xpc_transaction_end();
      }

      do
        __ldxr(v17);
      while (__stxr(7u, v17));
      int v26 = *(int **)(a1 + 96);
      if (v26)
      {
        int v27 = *v26;
        if (v27 == 2) {
          goto LABEL_67;
        }
        if (v27 == 4) {
          __int128 v28 = &_xpc_error_connection_interrupted;
        }
        else {
          __int128 v28 = &_xpc_error_connection_invalid;
        }
      }

      else
      {
        __int128 v28 = &_xpc_error_connection_invalid;
      }

      _xpc_connection_call_event_handler(a1, (uint64_t)v28);
LABEL_67:
      if (*(_DWORD *)(a1 + 24) == 2)
      {
        uint64_t v32 = (unsigned int *)(a1 + 16);
        do
          unsigned int v33 = __ldxr(v32);
        while (__stxr(v33 | 0x400, v32));
        if ((v33 & 0x400) != 0)
        {
          xpc_release((xpc_object_t)a1);
        }

        else
        {
          uint64_t v34 = *(void *)(a1 + 136);
          __int16 v35 = _xpc_alloc(0x18uLL);
          *__int16 v35 = v34;
          v35[1] = a1;
          v35[2] = 0LL;
          dispatch_mach_receive_barrier_f();
        }

        if ((*(_WORD *)(a1 + 224) & 0x1000) != 0)
        {
          *(_WORD *)(a1 + 224) &= ~0x1000u;
          xpc_release((xpc_object_t)a1);
        }
      }

      if ((*(_BYTE *)(a1 + 40) & 1) != 0)
      {
        _Block_release(*(const void **)(a1 + 32));
        *(_BYTE *)(a1 + 40) = 0;
      }

      *(void *)(a1 + 32) = 0LL;
      _xpc_release(a1);
      return;
    case 7LL:
      goto LABEL_114;
    case 9LL:
      if ((*(_WORD *)(a1 + 224) & 0x2000) == 0) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      if (!*(void *)(a1 + 96) && *(_DWORD *)(a1 + 24) == 2)
      {
        uint64_t v15 = *(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL
            ? *(void *)(MEMORY[0x1895FF8E0] + 24LL)
            : _os_alloc_once();
        if (*(_BYTE *)(v15 + 168)) {
          _xpc_connection_call_event_handler(a1, (uint64_t)&_xpc_error_termination_imminent);
        }
      }

      return;
    default:
      return;
  }

void _xpc_connection_update_event_handler(uint64_t a1)
{
  int v2 = (unint64_t *)(a1 + 176);
  do
    unint64_t v3 = __ldxr(v2);
  while (__stxr(0LL, v2));
  if (v3)
  {
    if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
      _Block_release(*(const void **)(a1 + 32));
    }
    *(void *)(a1 + 32) = v3;
    *(_BYTE *)(a1 + 40) = 1;
  }

void _xpc_connection_handle_sent_event(mach_port_context_t a1, dispatch_object_t object, int a3, int a4)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  mach_port_context_t context = dispatch_get_context(object);
  uint64_t msg = dispatch_mach_msg_get_msg();
  if (context)
  {
    _xpc_connection_release_message((xpc_object_t)a1, (uint64_t)object, (uint64_t)context, a3);
  }

  else
  {
    uint64_t v10 = msg;
    int v11 = *(_DWORD *)(msg + 20);
    if (v11 != 1999646836 || a4 != 0) {
      _xpc_connection_handle_sent_event_cold_1(v11);
    }
    if (a3)
    {
      if (_xpc_connection_cancel( a1,  3,  "failed to check-in, peer may have been unloaded: mach_error=%x",  v13,  v14,  v15,  v16,  v17,  a3)
        && _os_trace_lazy_init_completed_4libxpc()
        && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
      {
        if (_xpc_connection_log_handle__once != -1) {
          dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
        }
        unsigned int v18 = (os_log_s *)_xpc_connection_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)mach_port_options_t buf = 134218240;
          mach_port_context_t v20 = a1;
          __int16 v21 = 1024;
          int v22 = a3;
          _os_log_impl( &dword_180150000,  v18,  OS_LOG_TYPE_DEFAULT,  "[%p] invalidated after a failed send of the check-in message: mach_error=%{mach.errno}x",  buf,  0x12u);
        }
      }
    }

    else
    {
      *(_DWORD *)(a1 + 64) = 6;
    }
  }

uint64_t _xpc_connection_remove_peer_impl(uint64_t a1, void *object)
{
  uint64_t v3 = object[6];
  if (v3) {
    *(void *)(v3 + 56) = object[7];
  }
  *(void *)object[7] = v3;
  xpc_object_t object[6] = -1LL;
  object[7] = -1LL;
  object[17] = 0LL;
  xpc_release(object);
  return _xpc_release(a1);
}

void _xpc_connection_remove_peer(uint64_t a1)
{
}

uint64_t _xpc_connection_set_event_handler2(uint64_t a1)
{
  if (*(void *)(a1 + 176)) {
    _xpc_connection_update_event_handler(a1);
  }
  return _xpc_release(a1);
}

BOOL _xpc_data_equal(size_t a1, size_t a2)
{
  if (*(void *)(a1 + 40) != *(void *)(a2 + 40)) {
    return 0LL;
  }
  _xpc_data_map(a1);
  _xpc_data_map(a2);
  return memcmp(*(const void **)(a1 + 32), *(const void **)(a2 + 32), *(void *)(a1 + 40)) == 0;
}

uint64_t _xpc_data_hash()
{
  return 0LL;
}

uint64_t _xpc_data_desc(size_t a1, uint64_t a2)
{
  return _xpc_serializer_append(a2, &unk_18018902B, 1uLL, 0);
}

uint64_t _xpc_data_debug_desc(void *a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  _xpc_data_map((size_t)a1);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  unsigned int v4 = snprintf(__str, 0x100uLL, "<%s: %p>: { length = %lu bytes, contents = ", "data", a1, a1[5]);
  if (v4 >= 0xFF) {
    size_t v5 = 255LL;
  }
  else {
    size_t v5 = v4;
  }
  _xpc_serializer_append(a2, __str, v5, 0);
  _xpc_data_print_bytes_string((uint64_t)a1, a2, 0x18uLL);
  return _xpc_serializer_append(a2, " }", 3uLL, 0);
}

uint64_t _xpc_data_debug(uint64_t a1, char *__str, size_t __size)
{
  if (*(_BYTE *)(a1 + 48))
  {
    if (__size >= 2)
    {
      LODWORD(result) = snprintf(__str, __size, ", buff = %p, len = %lu");
      goto LABEL_6;
    }

    return 0LL;
  }

  if (__size < 2) {
    return 0LL;
  }
  LODWORD(result) = snprintf(__str, __size, ", buff = (unmapped), len = %lu");
LABEL_6:
  else {
    return (int)result;
  }
}

uint64_t _xpc_data_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 0x8000;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int v8 = *(void *)(a1 + 40);
  _xpc_serializer_append(a2, &v8, 4uLL, 1);
  if ((*(_BYTE *)(a2 + 156) & 0x40) != 0)
  {
    uint64_t v7 = *(void *)(a2 + 104);
    if (v7)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
      if ((result & 1) != 0) {
        return result;
      }
    }

_DWORD *_xpc_data_deserialize(uint64_t *a1)
{
  __int128 v9 = 0LL;
  mach_vm_size_t v10 = 0LL;
  int transport = _xpc_graph_deserializer_get_transport(a1);
  uint64_t v3 = 0LL;
  if (_xpc_data_get_wire_value(a1, (uint64_t *)&v9, &v10))
  {
    int v5 = v9;
    mach_vm_size_t v4 = v10;
    if (transport == 1 && v10 > 0x4000)
    {
      uint64_t v6 = dispatch_data_create(v9, v10, 0LL, (dispatch_block_t)*MEMORY[0x1895FE7B0]);
      uint64_t v3 = xpc_data_create_with_dispatch_data(v6);
      dispatch_release(v6);
      if (v3)
      {
        v3[4] |= 1u;
        *((void *)v3 + 4) = v5;
        *((void *)v3 + 5) = v4;
        *((_BYTE *)v3 + 48) = 1;
      }
    }

    else
    {
      uint64_t v7 = xpc_data_create(v9, v10);
      uint64_t v3 = v7;
      if (v7) {
        v7[4] |= 1u;
      }
    }
  }

  return v3;
}

void _xpc_data_dispose(uint64_t a1)
{
}

uint64_t _xpc_data_set_value(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t result = dispatch_data_create_alloc();
  if (result)
  {
    *(void *)(a1 + 24) = result;
    uint64_t result = (uint64_t)memcpy(0LL, a2, a3);
    if (a3 > 0x4000)
    {
      *(_DWORD *)(a1 + 16) |= 2u;
      int v7 = 4;
    }

    else
    {
      int v7 = ((a3 + 3) & 0xFFFFFFFC) + 4;
    }

    *(_DWORD *)(a1 + 20) = v7;
  }

  else
  {
    *(void *)(a1 + 24) = MEMORY[0x1895FE7B8];
  }

  return result;
}

uint64_t _xpc_data_get_wire_value(uint64_t *a1, uint64_t *a2, mach_vm_size_t *a3)
{
  uint64_t result = _xpc_graph_deserializer_read((uint64_t)a1, 4uLL);
  uint64_t v14 = result;
  if (result)
  {
    int v7 = (unsigned int *)result;
    int transport = _xpc_graph_deserializer_get_transport(a1);
    mach_vm_size_t v9 = *v7;
    if (transport == 1 && v9 > 0x4000)
    {
      mem_entry_name_port_t object = 0;
      int v10 = _xpc_vm_map_memory_entry(object, v9, (mach_vm_address_t *)&v14, 0);
      int v11 = v10;
      if (v10) {
        BOOL v12 = v10 == 29;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12) {
        _os_assumes_log();
      }
      if (v11) {
        return 0LL;
      }
    }

    else
    {
      uint64_t result = _xpc_graph_deserializer_read((uint64_t)a1, v9);
      uint64_t v14 = result;
      if (!result) {
        return result;
      }
    }

    *a2 = v14;
    *a3 = v9;
    return 1LL;
  }

  return result;
}

uint64_t xpc_data_get_inline_max()
{
  return 0LL;
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  if (length)
  {
    alloc = (dispatch_data_s *)dispatch_data_create_alloc();
    if (alloc)
    {
      int v5 = alloc;
      uint64_t v6 = xpc_data_create_with_dispatch_data(alloc);
      memcpy(0LL, bytes, length);
      dispatch_release(v5);
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = xpc_data_create_with_dispatch_data(MEMORY[0x1895FE7B8]);
    v6[48] = 1;
  }

  return v6;
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  uint64_t v2 = _xpc_base_create();
  size_t size = dispatch_data_get_size(ddata);
  if (size > 0x4000)
  {
    *(_DWORD *)(v2 + 16) |= 2u;
    int v4 = 4;
  }

  else
  {
    int v4 = ((size + 3) & 0xFFFFFFFC) + 4;
  }

  *(_DWORD *)(v2 + 20) = v4;
  *(void *)(v2 + 40) = size;
  *(void *)(v2 + 24) = ddata;
  dispatch_retain(ddata);
  return (xpc_object_t)v2;
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  if (xpc_get_type(xdata) == (xpc_type_t)&OBJC_CLASS___OS_xpc_data) {
    return *((void *)xdata + 5);
  }
  else {
    return 0LL;
  }
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  if (xpc_get_type(xdata) != (xpc_type_t)&OBJC_CLASS___OS_xpc_data) {
    return 0LL;
  }
  _xpc_data_map((size_t)xdata);
  return (const void *)*((void *)xdata + 4);
}

size_t _xpc_data_map(size_t result)
{
  if (!*(_BYTE *)(result + 48))
  {
    size_t v1 = result;
    flattened_bytesuint64_t _4libxpc = dispatch_data_get_flattened_bytes_4libxpc();
    uint64_t v3 = *(dispatch_data_s **)(v1 + 24);
    if (!flattened_bytes_4libxpc)
    {
      if (dispatch_data_get_size(*(dispatch_data_t *)(v1 + 24))) {
        _xpc_rich_error_serialize_cold_1();
      }
    }

    uint64_t result = dispatch_data_get_size(v3);
    *(void *)(v1 + 32) = flattened_bytes_4libxpc;
    *(void *)(v1 + 40) = result;
    *(_BYTE *)(v1 + 48) = 1;
  }

  return result;
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  if (xpc_get_type(xdata) != (xpc_type_t)&OBJC_CLASS___OS_xpc_data) {
    return 0LL;
  }
  _xpc_data_map((size_t)xdata);
  size_t v8 = *((void *)xdata + 5);
  BOOL v9 = v8 >= off;
  size_t v10 = v8 - off;
  if (!v9) {
    return 0LL;
  }
  if (v10 < length) {
    length = v10;
  }
  memcpy(buffer, (const void *)(*((void *)xdata + 4) + off), length);
  return length;
}

BOOL xpc_data_get_bytes_ptr_and_length(void *a1, void *a2, void *a3)
{
  *a2 = 0LL;
  *a3 = 0LL;
  type = (__objc2_class *)xpc_get_type(a1);
  if (type == &OBJC_CLASS___OS_xpc_data)
  {
    _xpc_data_map((size_t)a1);
    uint64_t v7 = a1[5];
    *a2 = a1[4];
    *a3 = v7;
  }

  return type == &OBJC_CLASS___OS_xpc_data;
}

uint64_t _xpc_data_hash_apply(void **a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5)
{
  int v5 = *a1;
  *v5 += _xpc_hash(a4, a5);
  return 1LL;
}

uint64_t _xpc_data_print_bytes_string(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  memset(__src, 0, sizeof(__src));
  if (*(void *)(a1 + 40) >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = *(void *)(a1 + 40);
  }
  strcpy((char *)__src, "0x");
  int v5 = (char *)__src + 2;
  if (v4)
  {
    size_t v8 = *(unsigned __int8 **)(a1 + 32);
    size_t v9 = 94LL;
    do
    {
      if (v9 < 2)
      {
        size_t v10 = 0LL;
      }

      else
      {
        size_t v10 = snprintf(v5, v9, "%2.2x", *v8);
        if (v9 <= v10) {
          size_t v10 = v9 - 1;
        }
      }

      v5 += v10;
      v9 -= v10;
      ++v8;
      --v4;
    }

    while (v4);
    if (*(void *)(a1 + 40) > a3)
    {
      if (v9 < 2)
      {
        size_t v11 = 0LL;
      }

      else
      {
        size_t v11 = snprintf(v5, v9, "...");
        if (v9 <= v11) {
          size_t v11 = v9 - 1;
        }
      }

      v5 += v11;
    }
  }

  return _xpc_serializer_append(a2, __src, v5 - (char *)__src, 0);
}

uint64_t _xpc_data_serialize_inline_apply(uint64_t *a1, int a2, int a3, void *__src, size_t __n)
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  size_t v8 = (void *)a1[2];
  _xpc_serializer_append(v6, __src, __n, 0);
  size_t v9 = *v8 + __n;
  *size_t v8 = v9;
  if (v9 == *(void *)(v7 + 40))
  {
    size_t v10 = ((v9 + 3) & 0xFFFFFFFFFFFFFFFCLL) - v9;
    size_t v11 = *(void *)(v6 + 48) + v10;
    size_t v12 = *(void *)(v6 + 56) - v10;
    *(void *)(v6 + 48) = v11;
    *(void *)(v6 + 56) = v12;
  }

  return 1LL;
}

BOOL _xpc_date_equal(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 16);
  if ((*(_BYTE *)(a1 + 18) & 1) == 0)
  {
    if ((v3 & 0x10000) == 0) {
      return *(void *)(a1 + 24) == *(void *)(a2 + 24);
    }
    goto LABEL_5;
  }

  if ((v3 & 0x10000) == 0)
  {
LABEL_5:
    double value_absolute = xpc_date_get_value_absolute(a1);
    return value_absolute == xpc_date_get_value_absolute(a2);
  }

  return *(double *)(a1 + 24) == *(double *)(a2 + 24);
}

uint64_t _xpc_date_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 8LL);
}

uint64_t _xpc_date_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  memset(&v5, 0, sizeof(v5));
  if ((*(_BYTE *)(a1 + 18) & 1) != 0)
  {
    time_t v6 = (uint64_t)(*(double *)(a1 + 24) + 978307200.0);
    gmtime_r(&v6, &v5);
  }

  else
  {
    time_t v6 = *(void *)(a1 + 24) / 0x3B9ACA00uLL;
    localtime_r(&v6, &v5);
  }

  *(void *)int __src = 0LL;
  uint64_t v8 = 0LL;
  memset(v9, 0, sizeof(v9));
  size_t v3 = strftime(__src, 0x1EuLL, "%a %b %d %T %Y %Z", &v5);
  return _xpc_serializer_append(a2, __src, v3 + 1, 0);
}

uint64_t _xpc_date_debug_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  memset(&v7, 0, sizeof(v7));
  if ((*(_BYTE *)(a1 + 18) & 1) != 0)
  {
    time_t v8 = (uint64_t)(*(double *)(a1 + 24) + 978307200.0);
    gmtime_r(&v8, &v7);
  }

  else
  {
    time_t v8 = *(void *)(a1 + 24) / 0x3B9ACA00uLL;
    localtime_r(&v8, &v7);
  }

  *(void *)__int128 v17 = 0LL;
  uint64_t v18 = 0LL;
  memset(v19, 0, sizeof(v19));
  strftime(v17, 0x1EuLL, "%a %b %d %T %Y %Z", &v7);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v10 = 0u;
  unsigned int v4 = snprintf(__str, 0x80uLL, "<%s: %p> %s (approx)", "date", (const void *)a1, v17);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_date_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", interval = %lli", *(void *)(a1 + 24));
}

uint64_t _xpc_date_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 28672;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  uint64_t v5 = *(void *)(a1 + 24);
  return _xpc_serializer_append(a2, &v5, 8uLL, 1);
}

uint64_t _xpc_date_deserialize(uint64_t a1)
{
  uint64_t result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    uint64_t v2 = *(void *)result;
    uint64_t result = _xpc_base_create();
    *(void *)(result + 24) = v2;
    *(_DWORD *)(result + 16) |= 1u;
    *(_DWORD *)(result + 20) = 8;
  }

  return result;
}

uint64_t _xpc_date_wire_length()
{
  return 8LL;
}

BOOL _xpc_date_get_wire_value(uint64_t a1, void *a2)
{
  size_t v3 = (void *)_xpc_graph_deserializer_read(a1, 8uLL);
  if (v3) {
    *a2 = *v3;
  }
  return v3 != 0LL;
}

xpc_object_t xpc_date_create(int64_t interval)
{
  xpc_object_t result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((void *)result + 3) = interval;
  return result;
}

uint64_t xpc_date_create_absolute(double a1)
{
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 0x10000u;
  *(_DWORD *)(result + 20) = 8;
  *(double *)(result + 24) = a1;
  return result;
}

xpc_object_t xpc_date_create_from_current(void)
{
  int64_t v0 = clock_gettime_nsec_np(_CLOCK_REALTIME);
  if (v0 <= 0) {
    xpc_date_create_from_current_cold_1();
  }
  int64_t v1 = v0;
  xpc_object_t result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((void *)result + 3) = v1;
  return result;
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  if (xpc_get_type(xdate) != (xpc_type_t)&OBJC_CLASS___OS_xpc_date) {
    return 0LL;
  }
  if ((*((_BYTE *)xdate + 18) & 1) == 0) {
    return *((void *)xdate + 3);
  }
  double v3 = (*((double *)xdate + 3) + 978307200.0) * 1000000000.0;
  if (v3 > 9.22337204e18 || v3 < -9.22337204e18) {
    return 0LL;
  }
  else {
    return (uint64_t)v3;
  }
}

BOOL xpc_date_is_int64_range(uint64_t a1)
{
  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_date || (*(_BYTE *)(a1 + 18) & 1) == 0) {
    return 0LL;
  }
  double v3 = (*(double *)(a1 + 24) + 978307200.0) * 1000000000.0;
  return v3 <= 9.22337204e18 && v3 >= -9.22337204e18;
}

double xpc_date_get_value_absolute(uint64_t a1)
{
  type = (__objc2_class *)xpc_get_type((xpc_object_t)a1);
  double result = 0.0;
  if (type == &OBJC_CLASS___OS_xpc_date)
  {
    if ((*(_BYTE *)(a1 + 18) & 1) != 0) {
      return *(double *)(a1 + 24);
    }
    else {
      return (double)*(uint64_t *)(a1 + 24) / 1000000000.0 + -978307200.0;
    }
  }

  return result;
}

uint64_t xpc_get_attachment_endpoint()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  return *(void *)(v0 + 32);
}

xpc_object_t xpc_copy_domain()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  pid_t v1 = getpid();
  xpc_dictionary_set_int64(v0, "pid", v1);
  return v0;
}

xpc_object_t xpc_copy_entitlements_for_pid(uint64_t a1)
{
  return _xpc_copy_entitlements_data(a1, 0LL, 7LL);
}

xpc_object_t xpc_copy_entitlements_data_for_token(uint64_t a1)
{
  return _xpc_copy_entitlements_data(*(unsigned int *)(a1 + 20), a1, 7LL);
}

char *xpc_copy_code_signing_identity_for_token(uint64_t a1)
{
  return _xpc_copy_cs_identity(*(unsigned int *)(a1 + 20), a1);
}

uint64_t xpc_copy_bootstrap()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "type", 5uLL);
  pid_t v1 = getpid();
  xpc_dictionary_set_uint64(v0, "handle", v1);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  xpc_object_t xdict = 0LL;
  if (_xpc_service_routine(711LL, v0, &xdict))
  {
    _os_assumes_log();
    uint64_t bootstrap_copy = 0LL;
  }

  else
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "bootstrap");
    size_t v6 = 0LL;
    data = xpc_dictionary_get_data(xdict, "creator", &v6);
    if (v6 != 32) {
      xpc_copy_bootstrap_cold_1();
    }
    uint64_t bootstrap_copy = _xpc_dictionary_create_bootstrap_copy(value, data);
    xpc_release(xdict);
  }

  xpc_release(v0);
  return bootstrap_copy;
}

double xpc_generate_audit_token(int a1, uint64_t a2)
{
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)(a2 + 20) = a1;
  *(_DWORD *)(a2 + 28) = 0x7FFFFFFF;
  return result;
}

xpc_object_t xpc_copy_entitlement_for_token(const char *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(unsigned int *)(a2 + 20);
    if (*(_DWORD *)(a2 + 28) == 0x7FFFFFFF) {
      a2 = 0LL;
    }
  }

  else
  {
    uint64_t v3 = getpid();
    a2 = 0LL;
  }

  xpc_object_t v4 = _xpc_copy_entitlements(v3, a2);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  if (a1)
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, a1);
    xpc_object_t v7 = value;
    if (value) {
      xpc_retain(value);
    }
  }

  else
  {
    xpc_object_t v7 = xpc_retain(v4);
  }

  xpc_release(v5);
  return v7;
}

xpc_object_t xpc_copy_entitlements_for_self()
{
  self_uint64_t audit_token = _xpc_get_self_audit_token();
  uint64_t v1 = getpid();
  return _xpc_copy_entitlements(v1, self_audit_token);
}

xpc_object_t xpc_copy_entitlement_for_self(const char *a1)
{
  self_uint64_t audit_token = _xpc_get_self_audit_token();
  uint64_t v3 = getpid();
  if (a1) {
    return _xpc_copy_entitlements_with_key(v3, self_audit_token, a1);
  }
  else {
    return _xpc_copy_entitlements(v3, self_audit_token);
  }
}

uint64_t xpc_test_symbols_exported()
{
  return 0LL;
}

uint64_t xpc_install_remote_hooks(void *a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t result = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t result = _os_alloc_once();
  }
  if (*(void *)(result + 200)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (*a1 != 40LL) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (!a1[1]) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (!a1[2]) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (!a1[3]) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (!a1[4]) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(result + 200) = a1;
  return result;
}

BOOL _xpc_get_service_instance(int a1, unsigned __int8 *a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v4, "pid", a1);
  xpc_object_t xdict = 0LL;
  int v5 = _xpc_service_routine(720LL, v4, &xdict);
  xpc_release(v4);
  if (v5)
  {
    if (v5 != 113) {
      _xpc_get_service_instance_cold_1(v10, v5);
    }
    return 0LL;
  }

  else
  {
    uuid = xpc_dictionary_get_uuid(xdict, "instance");
    BOOL v6 = uuid != 0LL;
    if (uuid) {
      uuid_copy(a2, uuid);
    }
    xpc_release(xdict);
  }

  return v6;
}

BOOL xpc_get_instance(unsigned __int8 *a1)
{
  pid_t v2 = getpid();
  return _xpc_get_service_instance(v2, a1);
}

uint64_t xpc_user_sessions_enabled()
{
  if (xpc_user_sessions_enabled_once != -1) {
    dispatch_once(&xpc_user_sessions_enabled_once, &__block_literal_global_2);
  }
  return xpc_user_sessions_enabled_enabled;
}

int64_t __xpc_user_sessions_enabled_block_invoke()
{
  int v4 = 0;
  uint64_t v3 = 0LL;
  int64_t result = _xpc_user_sessions_info_routine((uint64_t)&v3);
  if ((_DWORD)result) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = v3 == 0;
  }
  char v2 = !v1;
  xpc_user_sessions_enabled_enabled = v2;
  return result;
}

int64_t _xpc_user_sessions_info_routine(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_object_t xdict = 0LL;
  int64_t v3 = _xpc_bootstrap_routine(904LL, empty, &xdict);
  xpc_release(empty);
  if ((_DWORD)v3)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      _dyld_get_shared_cache_range();
    }

    else
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
    }

    xpc_strerror(v3);
    _os_log_simple();
  }

  else
  {
    *(_BYTE *)a1 = xpc_dictionary_get_BOOL(xdict, "enabled");
    *(_DWORD *)(a1 + 4) = xpc_dictionary_get_uint64(xdict, "foreground_uid");
    *(_DWORD *)(a1 + 8) = xpc_dictionary_get_uint64(xdict, "session_uid");
    xpc_release(xdict);
  }

  return v3;
}

uint64_t xpc_user_sessions_get_foreground_uid(int *a1)
{
  int v6 = 0;
  uint64_t v5 = 0LL;
  int v2 = _xpc_user_sessions_info_routine((uint64_t)&v5);
  if (v2)
  {
    if (!a1) {
      return 4294967195LL;
    }
    goto LABEL_8;
  }

  if (!(_BYTE)v5)
  {
    int v4 = _xpc_asprintf("xpc_user_sessions_get_foreground_uid() must not be called if xpc_user_sessions_enabled() is false");
    _xpc_api_misuse(v4);
  }

  uint64_t result = HIDWORD(v5);
  if (a1 && HIDWORD(v5) == -101)
  {
    int v2 = 112;
LABEL_8:
    *a1 = v2;
    return 4294967195LL;
  }

  return result;
}

uint64_t xpc_user_sessions_get_session_uid()
{
  if (xpc_user_sessions_get_session_uid_once != -1) {
    dispatch_once(&xpc_user_sessions_get_session_uid_once, &__block_literal_global_13);
  }
  return xpc_user_sessions_get_session_uid_session_uid;
}

int64_t __xpc_user_sessions_get_session_uid_block_invoke()
{
  int v4 = 0;
  uint64_t v3 = 0LL;
  int64_t result = _xpc_user_sessions_info_routine((uint64_t)&v3);
  if ((_DWORD)result)
  {
    int v1 = -101;
  }

  else
  {
    if (!(_BYTE)v3)
    {
      int v2 = _xpc_asprintf("xpc_user_sessions_get_session_uid() must not be called if xpc_user_sessions_enabled() is false");
      _xpc_api_misuse(v2);
    }

    int v1 = v4;
  }

  xpc_user_sessions_get_session_uid_session_uid = v1;
  return result;
}

uint64_t xpc_is_system_session()
{
  return 0LL;
}

void *_xpc_neuter_potential_reentrancy(int a1)
{
  if (a1)
  {
    if (dlopen("/usr/lib/system/libsystem_notify.dylib", 1)) {
      notify_set_options();
    }
    if (!dlopen("/usr/lib/system/libsystem_info.dylib", 1))
    {
LABEL_8:
      int64_t result = dlopen("/usr/lib/system/libsystem_trace.dylib", 1);
      if (!result) {
        return result;
      }
      return (void *)os_trace_set_mode();
    }
  }

  else
  {
    notify_set_options();
  }

  si_search_module_set_flags();
  si_search_module_set_flags();
  if (a1) {
    goto LABEL_8;
  }
  return (void *)os_trace_set_mode();
}

char *_xpc_copy_cs_identity(uint64_t a1, uint64_t a2)
{
  return _xpc_copy_csops_string(a1, a2, 11LL);
}

char *_xpc_copy_csops_string(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  bzero(v11, 0x408uLL);
  _xpc_get_csops_blob(a1, a2, a3, (int8x8_t *)v11);
  if ((v6 & 0x80000000) == 0)
  {
    if (!v6) {
      return _xpc_strndup(&__size_4, __size - 8LL);
    }
    return 0LL;
  }

  if (*__error() != 34) {
    return 0LL;
  }
  uint64_t v8 = (int8x8_t *)_xpc_alloc(__size);
  _xpc_get_csops_blob(a1, a2, a3, v8);
  if (v9)
  {
    if (*__error() != 3 && *__error()) {
      _os_assumes_log();
    }
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = _xpc_strndup((const char *)&v8[1], v8->u32[1] - 8LL);
  }

  free(v8);
  return v7;
}

xpc_object_t _xpc_copy_entitlements_data(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __size_4[128] = *MEMORY[0x1895FEE08];
  bzero(&v12, 0x408uLL);
  if ((_DWORD)a3 != 16 && (_DWORD)a3 != 7) {
    return 0LL;
  }
  _xpc_get_csops_blob(a1, a2, a3, (int8x8_t *)&v12);
  if (v6 < 0)
  {
    if (*__error() != 34) {
      return 0LL;
    }
    uint64_t v8 = (int8x8_t *)_xpc_alloc(__size);
    _xpc_get_csops_blob(a1, a2, a3, v8);
    if (v9)
    {
      if (*__error() != 3 && *__error()) {
        _os_assumes_log();
      }
    }

    else
    {
      uint64_t v11 = v8->u32[1];
      if ((_DWORD)v11 && v8->i32[0])
      {
        xpc_object_t v7 = xpc_data_create(&v8[1], v11 - 8);
LABEL_19:
        free(v8);
        return v7;
      }
    }

    xpc_object_t v7 = 0LL;
    goto LABEL_19;
  }

  if (v6) {
    return 0LL;
  }
  xpc_object_t v7 = 0LL;
  if (__size && v12) {
    return xpc_data_create(__size_4, __size - 8LL);
  }
  return v7;
}

int8x8_t _xpc_get_csops_blob(uint64_t a1, uint64_t a2, uint64_t a3, int8x8_t *a4)
{
  if (a2) {
    csops_audittoken();
  }
  else {
    csops();
  }
  int8x8_t result = vrev32_s8(*a4);
  *a4 = result;
  return result;
}

xpc_object_t _xpc_copy_entitlements(uint64_t a1, uint64_t a2)
{
  xpc_object_t result = _xpc_copy_entitlements_data(a1, a2, 16LL);
  if (result)
  {
    uint64_t v3 = result;
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(result);
    size_t length = xpc_data_get_length(v3);
    uint64_t v6 = xpc_create_from_ce_der(bytes_ptr, length);
    xpc_release(v3);
    return (xpc_object_t)v6;
  }

  return result;
}

xpc_object_t _xpc_copy_entitlements_with_key(uint64_t a1, uint64_t a2, const char *a3)
{
  xpc_object_t result = _xpc_copy_entitlements_data(a1, a2, 16LL);
  if (result)
  {
    uint64_t v5 = result;
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(result);
    size_t length = xpc_data_get_length(v5);
    uint64_t v8 = xpc_create_from_ce_der_with_key(bytes_ptr, length, a3);
    xpc_release(v5);
    return (xpc_object_t)v8;
  }

  return result;
}

uint64_t _xpc_proc_bsdinfo(int a1, void *buffer)
{
  if (proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64) {
    return 0LL;
  }
  else {
    return *__error();
  }
}

uint64_t _xpc_vm_map_memory_entry( mem_entry_name_port_t object, mach_vm_size_t size, mach_vm_address_t *a3, int a4)
{
  mach_vm_address_t address = 0LL;
  uint64_t result = mach_vm_map(*MEMORY[0x1895FFD48], &address, size, 0LL, 1, object, 0LL, a4 ^ 1, 67, 67, 2u);
  if (!(_DWORD)result) {
    *a3 = address;
  }
  return result;
}

vm_address_t _xpc_allocate_purgable_buffer(uint64_t a1)
{
  vm_address_t address = 0LL;
  if (vm_allocate(*MEMORY[0x1895FFD48], &address, (a1 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148], -268435453)) {
    _os_assumes_log();
  }
  return address;
}

uint64_t _xpc_deallocate_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x186DF7364](*MEMORY[0x1895FFD48], a1, a2);
  if ((_DWORD)result) {
    _xpc_alloc_cold_1();
  }
  return result;
}

char *xpc_dictionary_copy_basic_description(const void *a1)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v6 = 0u;
  unsigned int v2 = snprintf(__str, 0x100uLL, "<%s: %p>", "dictionary", a1);
  if (v2 >= 0xFF) {
    uint64_t v3 = 255LL;
  }
  else {
    uint64_t v3 = v2;
  }
  _xpc_dictionary_debug((uint64_t)a1, &__str[v3], 256 - v3);
  return strdup(__str);
}

unint64_t _xpc_dictionary_debug(uint64_t a1, char *__str, size_t __size)
{
  unint64_t v6 = snprintf(__str, __size, ", subtype = %d, count = %u", *(_DWORD *)(a1 + 28) & 3, *(_DWORD *)(a1 + 24));
  if ((*(_DWORD *)(a1 + 28) & 3) == 2)
  {
    xpc_object_t request = (void *)(a1 + 96);
    if (a1 == -96) {
      return v6;
    }
  }

  else
  {
    if ((*(_DWORD *)(a1 + 28) & 3) != 1) {
      return v6;
    }
    xpc_object_t request = (void *)_xpc_received_message_get_request(a1 + 88);
    if (!request) {
      return v6;
    }
  }

  if (__size > v6) {
    v6 += _xpc_message_request_debug(request, &__str[v6], __size - v6);
  }
  return v6;
}

uint64_t _xpc_dictionary_copy(_DWORD *a1)
{
  uint64_t v2 = _xpc_base_create();
  *(_DWORD *)(v2 + 20) = 8;
  *(_DWORD *)(v2 + 28) &= 0xFFFFFFFC;
  _xpc_dictionary_apply_node_f(a1, v2, (uint64_t (*)(void))_xpc_dictionary_copy_apply);
  return v2;
}

BOOL _xpc_dictionary_equal(_DWORD *a1, uint64_t a2)
{
  if (a1[6] != *(_DWORD *)(a2 + 24)) {
    return 0LL;
  }
  char v4 = 1;
  v3[0] = a1;
  v3[1] = a2;
  void v3[2] = &v4;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)v3, (uint64_t (*)(void))_xpc_dictionary_equal_apply);
  return v4 != 0;
}

uint64_t _xpc_dictionary_hash(_DWORD *a1)
{
  uint64_t v2 = 0LL;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)&v2, (uint64_t (*)(void))_xpc_dictionary_hash_apply);
  return v2;
}

uint64_t _xpc_dictionary_desc(_DWORD *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1895FEE08];
  memset(v21, 0, sizeof(v21));
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int16 __src = 123;
  _xpc_serializer_append(a2, &__src, 1uLL, 0);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v23 = 0u;
  if (_xpc_dictionary_get_transaction((uint64_t)a1))
  {
    strcpy(__str, "<transaction");
    _xpc_serializer_append(a2, __str, 0xCuLL, 0);
    if (!_xpc_dictionary_get_importance_voucher((uint64_t)a1))
    {
LABEL_10:
      __int128 v8 = ">";
      goto LABEL_11;
    }

    char v4 = ", ";
LABEL_6:
    importance_voucher = (const void *)_xpc_dictionary_get_importance_voucher((uint64_t)a1);
    unsigned int v6 = snprintf(__str, 0x80uLL, "%svoucher = %p, ", v4, importance_voucher);
    if (v6 >= 0x7F) {
      size_t v7 = 127LL;
    }
    else {
      size_t v7 = v6;
    }
    _xpc_serializer_append(a2, __str, v7, 0);
    goto LABEL_10;
  }

  if (_xpc_dictionary_get_importance_voucher((uint64_t)a1))
  {
    char v4 = "<";
    goto LABEL_6;
  }

  __int128 v8 = (const char *)&unk_18018902B;
LABEL_11:
  unsigned int v9 = snprintf(__str, 0x80uLL, "%s\n", v8);
  if (v9 >= 0x7F) {
    size_t v10 = 127LL;
  }
  else {
    size_t v10 = v9;
  }
  _xpc_serializer_append(a2, __str, v10, 0);
  *(void *)&__str[8] = _xpc_serializer_pad(a2);
  *(void *)&__int128 v23 = 0LL;
  *(void *)__str = a2;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)__str, (uint64_t (*)(void))_xpc_dictionary_desc_apply);
  _xpc_serializer_unpad(a2);
  uint64_t v11 = _xpc_object_pad(*(char **)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 112));
  uint64_t v12 = *(void *)(a2 + 56) - v11;
  *(void *)(a2 + 48) += v11;
  *(void *)(a2 + 56) = v12;
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

uint64_t _xpc_dictionary_debug_desc(_DWORD *a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v16 = 0u;
  int v4 = a1[6];
  int transaction = _xpc_dictionary_get_transaction((uint64_t)a1);
  unsigned int v6 = snprintf(__str, 0x80uLL, "<%s: %p> { count = %u, transaction: %d, ", "dictionary", a1, v4, transaction);
  if (v6 >= 0x7F) {
    size_t v7 = 127LL;
  }
  else {
    size_t v7 = v6;
  }
  _xpc_serializer_append(a2, __str, v7, 0);
  importance_voucher = (const void *)_xpc_dictionary_get_importance_voucher((uint64_t)a1);
  unsigned int v9 = snprintf(__str, 0x80uLL, "voucher = %p, ", importance_voucher);
  if (v9 >= 0x7F) {
    size_t v10 = 127LL;
  }
  else {
    size_t v10 = v9;
  }
  _xpc_serializer_append(a2, __str, v10, 0);
  strcpy(__str, "contents =\n");
  _xpc_serializer_append(a2, __str, 0xBuLL, 0);
  v14[1] = _xpc_serializer_pad(a2);
  v14[0] = a2;
  v14[2] = 1LL;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)v14, (uint64_t (*)(void))_xpc_dictionary_desc_apply);
  _xpc_serializer_unpad(a2);
  uint64_t v11 = _xpc_object_pad(*(char **)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 112));
  uint64_t v12 = *(void *)(a2 + 56) - v11;
  *(void *)(a2 + 48) += v11;
  *(void *)(a2 + 56) = v12;
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

_DWORD *_xpc_dictionary_serialize(_DWORD *a1, uint64_t a2)
{
  int __src = 61440;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int v8 = 0;
  uint64_t graph_length = _xpc_serializer_get_graph_length(a2);
  _xpc_serializer_append(a2, &v8, 4uLL, 1);
  int v7 = a1[6];
  _xpc_serializer_append(a2, &v7, 4uLL, 1);
  _xpc_dictionary_apply_node_f(a1, a2, (uint64_t (*)(void))_xpc_dictionary_serialize_apply);
  uint64_t result = (_DWORD *)_xpc_serializer_get_graph_length(a2);
  unint64_t v6 = (unint64_t)result - graph_length - 4;
  if (!HIDWORD(v6))
  {
    uint64_t result = (_DWORD *)_xpc_serializer_get_graph_ptr(a2, graph_length);
    _DWORD *result = v6;
  }

  return result;
}

_DWORD *_xpc_dictionary_deserialize(_OWORD *a1)
{
  uint64_t v2 = (_DWORD *)_xpc_base_create();
  v2[5] = 8;
  v2[7] &= 0xFFFFFFFC;
  char v5 = 1;
  v4[0] = v2;
  v4[1] = &v5;
  _xpc_dictionary_apply_wire_f( (uint64_t)v2,  a1,  (uint64_t)v4,  (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_deserialize_apply);
  if (!v5)
  {
    xpc_release(v2);
    return 0LL;
  }

  return v2;
}

void _xpc_dictionary_dispose(uint64_t a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(_DWORD **)(a1 + 8 * v2 + 32);
    if (v3)
    {
      do
      {
        int v4 = *(_DWORD **)v3;
        _xpc_dictionary_node_free(v3);
        uint64_t v3 = v4;
      }

      while (v4);
    }

    if (++v2 == 7) {
      __asm { BR              X11 }
    }
  }

void sub_1801642BC(char a1@<W8>)
{
  if ((a1 & 4) != 0)
  {
    payload = (void *)_xpc_graph_deserializer_get_payload((uint64_t)&v1[9].opaque2);
    os_release(payload);
    uint64_t v3 = (xpc_object_t *)OSAtomicDequeue(v1 + 14, 0LL);
    if (v3)
    {
      int v4 = v3;
      do
      {
        xpc_release(v4[1]);
        free(v4);
        int v4 = (xpc_object_t *)OSAtomicDequeue(v1 + 14, 0LL);
      }

      while (v4);
    }
  }

  _xpc_received_message_destroy(&v1[5].opaque2);
}

void sub_18016431C()
{
  int v1 = *(void **)(v0 + 88);
  if (v1) {
    xpc_release(v1);
  }
  else {
    sub_1801642AC();
  }
}

uint64_t _xpc_dictionary_create_from_received_message(__int128 *a1, _OWORD *a2)
{
  int v4 = (_DWORD *)_xpc_graph_deserializer_read((uint64_t)a2, 4uLL);
  if (!v4 || *v4 != 61440) {
    return 0LL;
  }
  uint64_t payload = _xpc_graph_deserializer_get_payload((uint64_t)a2);
  if (!payload) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  unint64_t v6 = (void *)payload;
  int transport = xpc_payload_get_transport(payload);
  if (!transport)
  {
LABEL_10:
    memset(v15, 0, sizeof(v15));
    _xpc_graph_deserializer_init_clone((uint64_t)v15, (uint64_t)a2);
    size_t v10 = (uint64_t (*)(_OWORD *))_xpc_wire_length_from_wire_id(0xF000u);
    if (v10(v15) == -1) {
      return 0LL;
    }
    uint64_t v11 = (int *)_xpc_graph_deserializer_read((uint64_t)v15, 4uLL);
    if (!v11) {
      return 0LL;
    }
    int v12 = *v11;
    uint64_t v8 = _xpc_base_create();
    int v13 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)(v8 + 20) = 8;
    *(_DWORD *)(v8 + 24) = v12;
    *(void *)(v8 + 224) = 0LL;
    *(void *)(v8 + 232) = 0LL;
    *(_DWORD *)(v8 + 28) = v13 & 0xFFFFFFF8 | 5;
    _xpc_graph_deserializer_move(v8 + 152, (uint64_t)a2);
    os_retain(v6);
    goto LABEL_13;
  }

  if (transport != 1) {
    _xpc_dictionary_create_from_received_message_cold_2();
  }
LABEL_7:
  uint64_t v8 = _xpc_base_create();
  *(_DWORD *)(v8 + 20) = 8;
  *(_DWORD *)(v8 + 28) = *(_DWORD *)(v8 + 28) & 0xFFFFFFFC | 1;
  _xpc_ktrace_pid0();
  unsigned __int8 v16 = 1;
  *(void *)&v15[0] = v8;
  *((void *)&v15[0] + 1) = &v16;
  _xpc_dictionary_apply_wire_f( v8,  a2,  (uint64_t)v15,  (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_deserialize_apply);
  int v9 = v16;
  _xpc_ktrace_pid0();
  if (!v9)
  {
    xpc_release((xpc_object_t)v8);
    return 0LL;
  }

LABEL_13:
  _xpc_received_message_move(v8 + 88, a1);
  return v8;
}

  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

uint64_t _xpc_dictionary_create_bootstrap_copy(_DWORD *a1, _OWORD *a2)
{
  uint64_t v4 = _xpc_base_create();
  *(_DWORD *)(v4 + 20) = 8;
  *(void *)&__int128 v5 = -1LL;
  *((void *)&v5 + 1) = -1LL;
  *(_OWORD *)(v4 + 104) = v5;
  *(_OWORD *)(v4 + 88) = v5;
  *(_DWORD *)(v4 + 108) = 0;
  *(_DWORD *)(v4 + 28) |= 3u;
  __int128 v6 = a2[1];
  *(_OWORD *)(v4 + 88) = *a2;
  *(_OWORD *)(v4 + 104) = v6;
  if (a1) {
    _xpc_dictionary_apply_node_f(a1, v4, (uint64_t (*)(void))_xpc_dictionary_copy_apply);
  }
  return v4;
}

uint64_t _xpc_dictionary_create_reply_with_port(int a1)
{
  uint64_t v2 = _xpc_base_create();
  *(_DWORD *)(v2 + 20) = 8;
  *(_DWORD *)(v2 + 28) = *(_DWORD *)(v2 + 28) & 0xFFFFFFFC | 2;
  _xpc_mach_message_request_init(v2 + 96, a1, 0LL, 0, 0);
  return v2;
}

uint64_t _xpc_dictionary_set_remote_connection(uint64_t a1, void *a2)
{
  if ((*(_DWORD *)(a1 + 28) & 3) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v3 = a1 + 88;
  xpc_object_t request = (void *)_xpc_received_message_get_request(a1 + 88);
  if (!_xpc_message_request_expects_reply(request)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return _xpc_received_message_set_connection(v3, a2);
}

uint64_t _xpc_dictionary_extract_reply_port(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2)
    {
      xpc_object_t request = (unsigned int *)(a1 + 96);
      goto LABEL_5;
    }

    return 0LL;
  }

  xpc_object_t request = (unsigned int *)_xpc_received_message_get_request(a1 + 88);
  if (!request) {
    return 0LL;
  }
LABEL_5:
  return _xpc_mach_message_request_extract_reply_port(request);
}

uint64_t _xpc_dictionary_set_reply_msg_id(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a1 + 28) & 3) == 1)
  {
    uint64_t request = _xpc_received_message_get_request(a1 + 88);
    if (request) {
      return _xpc_remote_message_request_set_reply_msg_id(request, a2);
    }
LABEL_6:
    _xpc_mach_message_request_handoff_reply_cold_1();
  }

  if ((*(_DWORD *)(a1 + 28) & 3) != 2) {
    goto LABEL_6;
  }
  uint64_t request = a1 + 96;
  return _xpc_remote_message_request_set_reply_msg_id(request, a2);
}

uint64_t _xpc_dictionary_get_reply_msg_id(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 28) & 3) == 1)
  {
    uint64_t request = (_BYTE *)_xpc_received_message_get_request(a1 + 88);
    if (!request) {
      return 0LL;
    }
  }

  else
  {
    if ((*(_DWORD *)(a1 + 28) & 3) != 2) {
      return 0LL;
    }
    uint64_t request = (_BYTE *)(a1 + 96);
  }

  return 0LL;
}

uint64_t _xpc_dictionary_extract_reply_msg_id(uint64_t a1)
{
  uint64_t reply_msg_id = _xpc_dictionary_get_reply_msg_id(a1);
  if (reply_msg_id) {
    _xpc_dictionary_set_reply_msg_id(a1, 0LL);
  }
  return reply_msg_id;
}

unsigned int *xpc_dictionary_apply_f(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a1;
  v4[1] = a3;
  void v4[2] = a2;
  uint64_t v5 = 0LL;
  LODWORD(v5) = (a1[7] >> 3) & 0xFFFFFFF;
  return _xpc_dictionary_apply_node_f(a1, (uint64_t)v4, (uint64_t (*)(void))_xpc_dictionary_apply_f_apply);
}

unsigned int *_xpc_dictionary_apply_node_f(_DWORD *a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary
    && xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_error)
  {
    _xpc_api_misuse("Given object not of required type.");
  }

  type = (__objc2_class *)xpc_get_type(a1);
  unint64_t v7 = 0LL;
  while (1)
  {
    uint64_t result = *(unsigned int **)&a1[2 * v7 + 8];
    if (result) {
      break;
    }
LABEL_8:
    if (type == &OBJC_CLASS___OS_xpc_error || v7++ >= 6)
    {
      if ((a1[7] & 7) == 5)
      {
        v11[0] = a1;
        v11[1] = a3;
        v11[2] = a2;
        return _xpc_dictionary_apply_wire_f( (uint64_t)a1,  0LL,  (uint64_t)v11,  (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_apply_node_f_wire_apply);
      }

      return result;
    }
  }

  while (1)
  {
    int v9 = *(unsigned int **)result;
    if (*((__objc2_class ***)result + 2) != &_xpc_dictionary_null_value)
    {
      uint64_t result = (unsigned int *)a3();
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t result = v9;
    if (!v9) {
      goto LABEL_8;
    }
  }

uint64_t _xpc_dictionary_apply_f_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + 32);
  (*(void (**)(void *, void, void))(a2 + 8))(v3, *(void *)(a1 + 16), *(void *)(a2 + 16));
  if (((*(_DWORD *)(*(void *)a2 + 28LL) >> 3) & 0xFFFFFFF) != *(_DWORD *)(a2 + 24))
  {
    uint64_t v5 = _xpc_asprintf("Dictionary mutated during iteration");
    _xpc_api_misuse(v5);
  }

  return 1LL;
}

uint64_t _xpc_dictionary_extract_importance_voucher(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2) {
      return _xpc_message_request_extract_voucher(a1 + 96);
    }
    return 0LL;
  }

  uint64_t request = _xpc_received_message_get_request(a1 + 88);
  if (!request) {
    return 0LL;
  }
  return _xpc_message_request_extract_voucher(request);
}

uint64_t _xpc_dictionary_set_transaction(uint64_t a1, int a2)
{
  if ((*(_DWORD *)(a1 + 28) & 3) == 1)
  {
    uint64_t request = _xpc_received_message_get_request(a1 + 88);
    if (request) {
      return _xpc_message_request_set_transaction(request, a2);
    }
LABEL_6:
    _xpc_mach_message_request_handoff_reply_cold_1();
  }

  if ((*(_DWORD *)(a1 + 28) & 3) != 2) {
    goto LABEL_6;
  }
  uint64_t request = a1 + 96;
  return _xpc_message_request_set_transaction(request, a2);
}

uint64_t _xpc_dictionary_get_transaction(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2) {
      return _xpc_message_request_get_transaction(a1 + 96);
    }
    return 0LL;
  }

  uint64_t request = _xpc_received_message_get_request(a1 + 88);
  if (!request) {
    return 0LL;
  }
  return _xpc_message_request_get_transaction(request);
}

BOOL xpc_dictionary_expects_reply(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2) {
      return _xpc_message_request_expects_reply((void *)(a1 + 96));
    }
    return 0LL;
  }

  uint64_t request = (void *)_xpc_received_message_get_request(a1 + 88);
  if (!request) {
    return 0LL;
  }
  return _xpc_message_request_expects_reply(request);
}

xpc_connection_t xpc_dictionary_get_connection(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return xpc_dictionary_get_remote_connection(a1);
  }
  else {
    return 0LL;
  }
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  if (xpc_get_type(xdict) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return 0LL;
  }
  if ((*((_DWORD *)xdict + 7) & 3) == 2) {
    return (xpc_connection_t)*((void *)xdict + 11);
  }
  if ((*((_DWORD *)xdict + 7) & 3) != 1) {
    return 0LL;
  }
  return (xpc_connection_t)_xpc_received_message_get_connection((uint64_t)xdict + 88);
}

void xpc_dictionary_set_pointer(void *a1, const char *a2, uint64_t a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  __int128 v6 = (void *)xpc_pointer_create(a3);
  xpc_dictionary_set_value(a1, a2, v6);
  xpc_release(v6);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  if (xpc_get_type(xdict) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  *((_DWORD *)xdict + 7) = *((_DWORD *)xdict + 7) & 0x80000007 | (8
                                                                * (((*((_DWORD *)xdict + 7) + 8) >> 3) & 0xFFFFFFF));
  _xpc_dictionary_insert(xdict, key, (__objc2_class **)value);
}

uint64_t xpc_dictionary_get_pointer(void *a1, const char *a2)
{
  if ((xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
    && (xpc_object_t value = xpc_dictionary_get_value(a1, a2)) != 0LL
    && (uint64_t v5 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_pointer))
  {
    return xpc_pointer_get_value(v5);
  }

  else
  {
    return 0LL;
  }

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  if (xpc_get_type(xdict) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error
    || xpc_get_type(xdict) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    return (xpc_object_t)_xpc_dictionary_look_up((uint64_t)xdict, key, 0LL);
  }

  else
  {
    return 0LL;
  }

void xpc_dictionary_set_mach_send(void *a1, const char *a2, mach_port_name_t a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  __int128 v6 = (void *)xpc_mach_send_create(a3);
  xpc_dictionary_set_value(a1, a2, v6);
  xpc_release(v6);
}

uint64_t xpc_dictionary_copy_mach_send(void *a1, const char *a2)
{
  if ((xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
    && (xpc_object_t value = (unsigned int *)xpc_dictionary_get_value(a1, a2)) != 0LL
    && (uint64_t v5 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send))
  {
    return xpc_mach_send_copy_right(v5);
  }

  else
  {
    return 0LL;
  }

uint64_t _xpc_dictionary_extract_mach_send(void *a1, const char *a2)
{
  if ((xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
    && (xpc_object_t value = (unsigned int *)xpc_dictionary_get_value(a1, a2)) != 0LL
    && (uint64_t v5 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send))
  {
    return _xpc_mach_send_extract_right(v5);
  }

  else
  {
    return 0LL;
  }

void xpc_dictionary_set_mach_recv(void *a1, const char *a2, int a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  __int128 v6 = (void *)xpc_mach_recv_create(a3);
  xpc_dictionary_set_value(a1, a2, v6);
  xpc_release(v6);
}

uint64_t xpc_dictionary_extract_mach_recv(void *a1, const char *a2)
{
  if ((xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
    && (xpc_object_t value = (unsigned int *)xpc_dictionary_get_value(a1, a2)) != 0LL
    && (uint64_t v5 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_recv))
  {
    return xpc_mach_recv_extract_right(v5);
  }

  else
  {
    return 0LL;
  }

void xpc_dictionary_get_audit_token(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    __asm { BR              X10 }
  }

  _xpc_api_misuse("Given object not of required type.");
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  __int128 v6 = (_DWORD *)_xpc_base_create();
  v6[5] = 8;
  for (v6[7] &= 0xFFFFFFFC; count; --count)
  {
    uint64_t v8 = *keys++;
    unint64_t v7 = v8;
    int v9 = (__objc2_class **)*values++;
    _xpc_dictionary_insert(v6, v7, v9);
  }

  return v6;
}

void _xpc_dictionary_insert(_DWORD *a1, const char *a2, __objc2_class **a3)
{
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error)
  {
    uint64_t v30 = _xpc_asprintf("Attempt to modify a global dictionary.");
    _xpc_api_misuse(v30);
  }

  __int128 v6 = &a1[2 * _hash_bucket(a2)];
  int v9 = (char *)*((void *)v6 + 4);
  uint64_t v8 = (uint64_t *)(v6 + 8);
  unint64_t v7 = v9;
  do
  {
    if (!v7)
    {
      BOOL v14 = 0;
      int v13 = 0LL;
      BOOL v16 = a3 != 0LL;
      goto LABEL_19;
    }

    size_t v10 = v7;
    uint64_t v11 = v7 + 32;
    unint64_t v7 = *(char **)v7;
  }

  while (strcmp(a2, v11));
  unint64_t v7 = 0LL;
  int v12 = (__objc2_class **)*((void *)v10 + 2);
  if (v12 == &_xpc_dictionary_null_value) {
    int v13 = 0LL;
  }
  else {
    int v13 = (__objc2_class **)*((void *)v10 + 2);
  }
  BOOL v14 = v13 != 0LL;
  if (v13 == a3 && v13 != 0LL) {
    unint64_t v7 = (char *)xpc_retain(a3);
  }
  _xpc_dictionary_node_free(v10);
  BOOL v16 = a3 != 0LL;
  if (a3 && v13)
  {
    LOBYTE(v16) = 1;
    int v13 = v12;
    goto LABEL_33;
  }

LABEL_19:
  if ((a1[7] & 7) == 5)
  {
    memset(v31, 0, sizeof(v31));
    char v33 = 0;
    v32[0] = a2;
    v32[1] = v31;
    v32[2] = &v33;
    _xpc_dictionary_apply_wire_f( (uint64_t)a1,  0LL,  (uint64_t)v32,  (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_look_up_wire_apply);
    if (v33) {
      int v17 = v14;
    }
    else {
      int v17 = 1;
    }
    if (v33) {
      int v18 = v16;
    }
    else {
      int v18 = 1;
    }
    if (!v17) {
      int v13 = &_xpc_dictionary_null_value;
    }
    if (v18 != 1)
    {
      a3 = &_xpc_dictionary_null_value;
      goto LABEL_33;
    }
  }

  if (a3)
  {
LABEL_33:
    size_t v19 = strlen(a2);
    size_t v20 = v19 + 40;
    BOOL v21 = v19 >= 0xFFFFFFFFFFFFFFD8LL;
    size_t v22 = v19 + 41;
    uint64_t v23 = v20 == -1LL;
    uint64_t v24 = v23 << 63 >> 63;
    BOOL v25 = v24 != v23;
    if (v21 || v25 || v24 < 0)
    {
      __break(1u);
      return;
    }

    __int128 v26 = _xpc_alloc(v22);
    *((_DWORD *)v26 + 6) = 0;
    *(void *)__int128 v26 = 0LL;
    *((void *)v26 + 1) = 0LL;
    strcpy((char *)v26 + 32, a2);
    *((void *)v26 + 2) = xpc_retain(a3);
    uint64_t v27 = *v8;
    *(void *)__int128 v26 = *v8;
    if (v27) {
      *(void *)(v27 + 8) = v26;
    }
    *uint64_t v8 = (uint64_t)v26;
    *((void *)v26 + 1) = v8;
    if (v13) {
      goto LABEL_41;
    }
  }

  else if (v13)
  {
    goto LABEL_41;
  }

  if (v16)
  {
    int v28 = 1;
LABEL_46:
    a1[6] += v28;
    goto LABEL_47;
  }

    dispatch_release(v6);
    __int128 v15 = 0LL;
LABEL_20:
    *a2 = (dispatch_object_s *)v15;
    return v13;
  }

  voucher_create_with_mach_msg();
  BOOL v14 = (void *)voucher_adopt();
  os_release(v14);
  if (v8)
  {
    dispatch_release(v6);
    __int128 v15 = dispatch_mach_msg_create();
    int v13 = 0LL;
    goto LABEL_20;
  }

  return 0LL;
}

    if (!v1 || v1 < v1 + 64) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  if (v10 - (unint64_t)v9 >= 9)
  {
    uint64_t v5 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v5)
    {
      __int128 v6 = "number too large";
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  if ((unint64_t)v9 < v10)
  {
    uint64_t v2 = 0LL;
    uint64_t result = 0LL;
    while (1)
    {
      if (!v2 && *v9 < 0) {
        uint64_t result = -1LL;
      }
      uint64_t v4 = (unsigned __int8 *)&v9[v2];
      uint64_t result = *v4 | (unint64_t)(result << 8);
      if (v10 - (void)v9 == ++v2) {
        return result;
      }
    }

LABEL_47:
  if (v7) {
    xpc_release(v7);
  }
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  xpc_object_t result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((_DWORD *)result + 7) &= 0xFFFFFFFC;
  return result;
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  if (xpc_get_type(original) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return 0LL;
  }
  if ((*((_DWORD *)original + 7) & 3) == 1 && _xpc_message_request_expects_reply((void *)original + 11))
  {
    uint64_t v2 = (__n128 *)_xpc_base_create();
    v2[1].n128_u32[1] = 8;
    v2[1].n128_u32[3] = v2[1].n128_u32[3] & 0xFFFFFFFC | 2;
    _xpc_received_message_extract_request((__n128 *)((char *)original + 88), v2 + 6);
    connection = (void *)_xpc_received_message_get_connection((uint64_t)original + 88);
    if (connection) {
      v2[5].n128_u64[1] = (unint64_t)xpc_retain(connection);
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  _xpc_ktrace_pid2();
  return v2;
}

void xpc_dictionary_handoff_reply(_DWORD *a1, dispatch_queue_s *a2, void *a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if ((a1[7] & 3) == 1)
  {
    uint64_t request = _xpc_received_message_get_request(a1 + 22);
    if (request) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v7 = _xpc_asprintf("XPC Dictionary is not a message");
    _xpc_api_misuse(v7);
  }

  if ((a1[7] & 3) != 2) {
    goto LABEL_8;
  }
  uint64_t request = (uint64_t)(a1 + 24);
LABEL_6:
  _xpc_mach_message_request_handoff_reply(request, a2, a3);
}

void xpc_dictionary_handoff_reply_f(_DWORD *a1, dispatch_queue_s *a2, void *a3, void (__cdecl *a4)(void *))
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if ((a1[7] & 3) == 1)
  {
    uint64_t request = _xpc_received_message_get_request(a1 + 22);
    if (request) {
      goto LABEL_6;
    }
LABEL_8:
    int v9 = _xpc_asprintf("XPC Dictionary is not a message");
    _xpc_api_misuse(v9);
  }

  if ((a1[7] & 3) != 2) {
    goto LABEL_8;
  }
  uint64_t request = (uint64_t)(a1 + 24);
LABEL_6:
  _xpc_mach_message_request_handoff_reply_f(request, a2, a3, a4);
}

void xpc_dictionary_send_reply(uint64_t a1)
{
  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if ((*(_DWORD *)(a1 + 28) & 3) == 2)
  {
    connection = *(_xpc_connection_s **)(a1 + 88);
    uint64_t request = (void *)(a1 + 96);
  }

  else
  {
    if ((*(_DWORD *)(a1 + 28) & 3) != 1)
    {
      __int128 v6 = _xpc_asprintf("Attempt to send non-message dictionary as reply");
      goto LABEL_18;
    }

    connection = (_xpc_connection_s *)_xpc_received_message_get_connection(a1 + 88);
    uint64_t request = (void *)_xpc_received_message_get_request(a1 + 88);
  }

  if (!_xpc_message_request_expects_reply(request)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int transport = _xpc_message_request_get_transport((uint64_t)request);
  if (transport != 1)
  {
    if (!transport)
    {
      xpc_connection_send_message(connection, (xpc_object_t)a1);
      return;
    }

    __int128 v6 = _xpc_asprintf("Attempt to send non-reply message as reply");
LABEL_18:
    _xpc_api_misuse(v6);
  }

  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v5 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v5 = _os_alloc_once();
  }
  (*(void (**)(uint64_t))(*(void *)(v5 + 200) + 16LL))(a1);
}

void xpc_dictionary_send_reply_4SWIFT(_DWORD *a1, _DWORD *a2)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    goto LABEL_8;
  }
  if ((a1[7] & 3) != 1)
  {
    unint64_t v7 = _xpc_asprintf("Attempting to merge reply with non-received dictionary");
    goto LABEL_11;
  }

  if (xpc_get_type(a2) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
LABEL_8:
  }
    _xpc_api_misuse("Given object not of required type.");
  if ((a2[7] & 3) == 2)
  {
    xpc_dictionary_send_reply((uint64_t)a2);
    return;
  }

  uint64_t v4 = (__n128 *)(a1 + 22);
  if (!_xpc_message_request_expects_reply(v4))
  {
    unint64_t v7 = _xpc_asprintf( "Attempting to send reply dictionary without valid reply port. Did you call xpc_dictionary_create_reply() or X PCDictionary.createReply()?");
LABEL_11:
    _xpc_api_misuse(v7);
  }

  uint64_t v5 = (__n128 *)_xpc_base_create();
  v5[1].n128_u32[1] = 8;
  v5[1].n128_u32[3] = v5[1].n128_u32[3] & 0xFFFFFFFC | 2;
  _xpc_dictionary_apply_node_f(a2, (uint64_t)v5, (uint64_t (*)(void))_xpc_dictionary_copy_apply);
  _xpc_received_message_extract_request(v4, v5 + 6);
  connection = (void *)_xpc_received_message_get_connection((uint64_t)v4);
  v5[5].n128_u64[1] = (unint64_t)xpc_retain(connection);
  xpc_dictionary_send_reply((uint64_t)v5);
  xpc_release(v5);
}

unint64_t _xpc_dictionary_look_up(uint64_t a1, const char *a2, _OWORD *a3)
{
  unint64_t result = _xpc_dictionary_look_up_table(a1, a2);
  if (result || (*(_DWORD *)(a1 + 28) & 7) != 5)
  {
    if (result)
    {
      if (*(__objc2_class ***)(result + 16) == &_xpc_dictionary_null_value) {
        return 0LL;
      }
      else {
        return *(void *)(result + 16);
      }
    }
  }

  else
  {
    memset(v8, 0, sizeof(v8));
    if (a3) {
      unint64_t v7 = a3;
    }
    else {
      unint64_t v7 = v8;
    }
    char v10 = 0;
    v9[0] = a2;
    v9[1] = v7;
    v9[2] = &v10;
    _xpc_dictionary_apply_wire_f( a1,  0LL,  (uint64_t)v9,  (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_look_up_wire_apply);
    if (a3 || !v10)
    {
      if (v10) {
        return 3735928559LL;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return (unint64_t)_xpc_dictionary_unpack_value_and_vend((OSQueueHead *)a1, (uint64_t)v7);
    }
  }

  return result;
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  if (xpc_get_type(xdict) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error
    || xpc_get_type(xdict) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    return *((unsigned int *)xdict + 6);
  }

  else
  {
    return 0LL;
  }

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  if (xpc_get_type(xdict) != (xpc_type_t)&OBJC_CLASS___OS_xpc_error
    && xpc_get_type(xdict) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    _xpc_api_misuse("Given object not of required type.");
  }

  BOOL v7 = 1;
  v5[0] = xdict;
  v5[1] = applier;
  _OWORD v5[2] = &v7;
  uint64_t v6 = 0LL;
  LODWORD(v6) = (*((_DWORD *)xdict + 7) >> 3) & 0xFFFFFFF;
  _xpc_dictionary_apply_node_f(xdict, (uint64_t)v5, (uint64_t (*)(void))_xpc_dictionary_apply_apply);
  return v7;
}

uint64_t _xpc_dictionary_apply_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = (void *)(a1 + 32);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, *(void *)(a1 + 16));
  **(_BYTE **)(a2 + 16) = result;
  if (((*(_DWORD *)(*(void *)a2 + 28LL) >> 3) & 0xFFFFFFF) != *(_DWORD *)(a2 + 24))
  {
    BOOL v7 = _xpc_asprintf("Dictionary mutated during iteration");
    _xpc_api_misuse(v7);
  }

  return result;
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  xpc_object_t v5 = xpc_BOOL_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  xpc_object_t v5 = xpc_int64_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  xpc_object_t v5 = xpc_uint64_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  xpc_object_t v5 = xpc_double_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  xpc_object_t v5 = xpc_date_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  xpc_object_t v6 = xpc_data_create(bytes, length);
  xpc_dictionary_set_value(xdict, key, v6);
  xpc_release(v6);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  xpc_object_t v5 = xpc_string_create(string);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  xpc_object_t v5 = xpc_uuid_create(uuid);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  xpc_object_t v5 = xpc_fd_create(fd);
  if (v5)
  {
    xpc_object_t v6 = v5;
    xpc_dictionary_set_value(xdict, key, v5);
    xpc_release(v6);
  }

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
  xpc_endpoint_t v5 = xpc_endpoint_create(connection);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  char v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = (void *)_xpc_dictionary_look_up_fast(xdict, key, 0x2000, v4);
  if (v2)
  {
    if (v2 == (void *)3735928559LL)
    {
      _xpc_BOOL_get_wire_value((uint64_t)v4, &v5);
      LOBYTE(v2) = v5 != 0;
    }

    else
    {
      LOBYTE(v2) = xpc_BOOL_get_value(v2);
    }
  }

  return (char)v2;
}

unint64_t _xpc_dictionary_look_up_fast(void *a1, const char *a2, int a3, _OWORD *a4)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_error
    && xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    _xpc_api_misuse("Given object not of required type.");
  }

  unint64_t result = _xpc_dictionary_look_up((uint64_t)a1, a2, a4);
  if (result)
  {
    if (result == 3735928559)
    {
      int v9 = (int *)_xpc_graph_deserializer_read((uint64_t)a4, 4uLL);
      if (v9) {
        int v10 = *v9;
      }
      else {
        int v10 = 122880;
      }
      if (_xpc_class_id_valid(v10) && v10 == a3) {
        return 3735928559LL;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      if ((result & 0x8000000000000000LL) != 0)
      {
        uint64_t v11 = 0LL;
        uint64_t v12 = *MEMORY[0x189616658];
        if ((~result & 0xC000000000000007LL) == 0) {
          uint64_t v12 = 0LL;
        }
        unint64_t v13 = v12 ^ result;
        do
        {
          if ((v13 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v11)) {
            break;
          }
          ++v11;
        }

        while (v11 != 7);
        unint64_t v14 = v11 | v13;
        uint64_t v15 = v11 & 7;
        int v16 = (v14 >> 55) + 8;
        if (v15 == 7) {
          LODWORD(v15) = v16;
        }
        if ((_DWORD)v15 == 12)
        {
          extension_vtable = &_OS_xpc_type_uint64;
        }

        else
        {
          if ((_DWORD)v15 != 13)
          {
            size_t v20 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v20);
          }

          extension_vtable = &_OS_xpc_type_int64;
        }
      }

      else
      {
        unint64_t v18 = *(void *)result;
        if (*(void *)result < (unint64_t)&OBJC_CLASS___OS_xpc_object
          || v18 > (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
          || (v18 & 7) != 0)
        {
          unint64_t v19 = result;
          extension_vtable = _xpc_get_extension_vtable((id)result);
          unint64_t result = v19;
        }

        else
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v18 - (void)&OBJC_CLASS___OS_xpc_object));
        }
      }

      if (*extension_vtable != a3) {
        return 0LL;
      }
    }
  }

  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  int64_t v4 = 0LL;
  memset(v3, 0, sizeof(v3));
  int64_t result = _xpc_dictionary_look_up_fast(xdict, key, 12288, v3);
  if (result)
  {
    if (result == 3735928559LL)
    {
      _xpc_date_get_wire_value((uint64_t)v3, &v4);
      return v4;
    }

    else
    {
      return xpc_int64_get_value((xpc_object_t)result);
    }
  }

  return result;
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  uint64_t v4 = 0LL;
  memset(v3, 0, sizeof(v3));
  uint64_t result = _xpc_dictionary_look_up_fast(xdict, key, 0x4000, v3);
  if (result)
  {
    if (result == 3735928559)
    {
      _xpc_date_get_wire_value((uint64_t)v3, &v4);
      return v4;
    }

    else
    {
      return xpc_uint64_get_value((xpc_object_t)result);
    }
  }

  return result;
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double v5 = NAN;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = (void *)_xpc_dictionary_look_up_fast(xdict, key, 20480, v4);
  if (!v2) {
    return NAN;
  }
  _xpc_double_get_wire_value((uint64_t)v4, &v5);
  return v5;
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  int64_t v4 = 0LL;
  memset(v3, 0, sizeof(v3));
  int64_t result = _xpc_dictionary_look_up_fast(xdict, key, 28672, v3);
  if (result)
  {
    if (result == 3735928559LL)
    {
      _xpc_date_get_wire_value((uint64_t)v3, &v4);
      return v4;
    }

    else
    {
      return xpc_date_get_value((xpc_object_t)result);
    }
  }

  return result;
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  int v9 = 0LL;
  size_t v10 = 0LL;
  BOOL v7 = 0LL;
  mach_vm_size_t v8 = 0LL;
  memset(v6, 0, sizeof(v6));
  int64_t v4 = (void *)_xpc_dictionary_look_up_fast(xdict, key, 0x8000, v6);
  if (v4)
  {
    if (v4 == (void *)3735928559LL)
    {
      _xpc_data_get_wire_value((uint64_t *)v6, (uint64_t *)&v7, &v8);
      int v9 = v7;
      size_t v10 = v8;
    }

    else if (!xpc_data_get_bytes_ptr_and_length(v4, &v9, &v10))
    {
      return 0LL;
    }
  }

  if (length) {
    *size_t length = v10;
  }
  return v9;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  int64_t v4 = 0LL;
  unint64_t v5 = 0LL;
  memset(v3, 0, sizeof(v3));
  int64_t result = (const char *)_xpc_dictionary_look_up_fast(xdict, key, 36864, v3);
  if (result)
  {
    if (result == (const char *)3735928559LL)
    {
      _xpc_string_get_wire_value((uint64_t)v3, (uint64_t *)&v4, &v5);
      return v4;
    }

    else
    {
      return xpc_string_get_string_ptr((xpc_object_t)result);
    }
  }

  return result;
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  int64_t v4 = 0LL;
  memset(v3, 0, sizeof(v3));
  int64_t result = (const uint8_t *)_xpc_dictionary_look_up_fast(xdict, key, 40960, v3);
  if (result)
  {
    if (result == (const uint8_t *)3735928559LL)
    {
      _xpc_uuid_get_wire_value((uint64_t)v3, (uint64_t *)&v4);
      return v4;
    }

    else
    {
      return xpc_uuid_get_bytes((xpc_object_t)result);
    }
  }

  return result;
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  if (value && (uint64_t v3 = value, xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_fd)) {
    return xpc_fd_dup(v3);
  }
  else {
    return -1;
  }
}

xpc_connection_t xpc_dictionary_create_connection(xpc_object_t xdict, const char *key)
{
  xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, key);
  else {
    return 0LL;
  }
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  if (!value) {
    return 0LL;
  }
  uint64_t v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return 0LL;
  }
  return v3;
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  if (!value) {
    return 0LL;
  }
  uint64_t v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    return 0LL;
  }
  return v3;
}

uint64_t _xpc_dictionary_equal_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  unint64_t v5 = (const char *)(a1 + 32);
  xpc_object_t v6 = *(_BYTE **)(a2 + 16);
  BOOL v7 = *(void **)(a1 + 16);
  mach_vm_size_t v8 = (void *)_xpc_dictionary_look_up(v4, v5, 0LL);
  if (v8 && xpc_equal(v7, v8)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *xpc_object_t v6 = 0;
  return result;
}

uint64_t _xpc_dictionary_hash_apply(uint64_t a1, void *a2)
{
  *a2 += xpc_hash(*(xpc_object_t *)(a1 + 16));
  return 1LL;
}

uint64_t _xpc_dictionary_desc_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = *MEMORY[0x1895FEE08];
  uint64_t v5 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v39 = 0u;
  uint64_t v6 = _xpc_object_pad(__str, 0x80uLL, v4);
  BOOL v7 = &__str[v6];
  size_t v8 = 128 - v6;
  if (*(_BYTE *)(a2 + 16))
  {
    if (v8 >= 2)
    {
      int v9 = snprintf(v7, v8, "%s => ");
      goto LABEL_6;
    }
  }

  else if (v8 >= 2)
  {
    int v9 = snprintf(v7, v8, "%s => ");
LABEL_6:
    uint64_t v10 = v9;
    if (v8 <= v9) {
      uint64_t v10 = 127 - v6;
    }
    goto LABEL_10;
  }

  uint64_t v10 = 0LL;
LABEL_10:
  _xpc_serializer_append(v5, __str, &v7[v10] - __str, 0);
  if (!*(_BYTE *)(a2 + 16)) {
    goto LABEL_34;
  }
  uint64_t v11 = *(unint64_t **)(a1 + 16);
  if (((unint64_t)v11 & 0x8000000000000000LL) != 0)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = *MEMORY[0x189616658];
    unint64_t v14 = v13 ^ (unint64_t)v11;
    do
    {
      if ((v14 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v12)) {
        break;
      }
      ++v12;
    }

    while (v12 != 7);
    unint64_t v15 = v12 | v14;
    uint64_t v16 = v12 & 7;
    int v17 = (v15 >> 55) + 8;
    if (v16 == 7) {
      LODWORD(v16) = v17;
    }
    if ((_DWORD)v16 == 12)
    {
      unint64_t v18 = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v16 != 13) {
        goto LABEL_57;
      }
      unint64_t v18 = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v19 = *v11;
    BOOL v20 = *v11 < (unint64_t)OBJC_CLASS___OS_xpc_object || v19 > (unint64_t)&OBJC_CLASS___OS_xpc_rich_error;
    BOOL v21 = !v20 && (*v11 & 7) == 0;
    unint64_t v18 = v21
  }

  size_t v22 = (void (*)(unint64_t *, uint64_t))*((void *)v18 + 7);
  if (!v22)
  {
LABEL_34:
    uint64_t v24 = *(unint64_t **)(a1 + 16);
    if (((unint64_t)v24 & 0x8000000000000000LL) == 0)
    {
      unint64_t v32 = *v24;
      if (*v24 >= (unint64_t)OBJC_CLASS___OS_xpc_object
        && v32 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
        && (*v24 & 7) == 0)
      {
        extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v32 - (void)OBJC_CLASS___OS_xpc_object));
      }

      else
      {
        extension_vtable = _xpc_get_extension_vtable(v24);
      }

      goto LABEL_55;
    }

    uint64_t v25 = 0LL;
    uint64_t v26 = *MEMORY[0x189616658];
    unint64_t v27 = v26 ^ (unint64_t)v24;
    do
    {
      if ((v27 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v25)) {
        break;
      }
      ++v25;
    }

    while (v25 != 7);
    unint64_t v28 = v25 | v27;
    uint64_t v29 = v25 & 7;
    int v30 = (v28 >> 55) + 8;
    if (v29 == 7) {
      LODWORD(v29) = v30;
    }
    if ((_DWORD)v29 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
      goto LABEL_55;
    }

    if ((_DWORD)v29 == 13)
    {
      extension_vtable = &_OS_xpc_type_int64;
LABEL_55:
      size_t v22 = (void (*)(unint64_t *, uint64_t))*((void *)extension_vtable + 6);
      uint64_t v23 = v24;
      goto LABEL_56;
    }

LABEL_57:
    __int128 v37 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v37);
  }

  uint64_t v23 = v11;
LABEL_56:
  v22(v23, v5);
  uint64_t v35 = *(void *)(v5 + 56) + 1LL;
  --*(void *)(v5 + 48);
  *(void *)(v5 + 56) = v35;
  _xpc_serializer_append(v5, "\n", 1uLL, 0);
  return 1LL;
}

uint64_t _xpc_dictionary_get_importance_voucher(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2) {
      return _xpc_message_request_get_voucher(a1 + 96);
    }
    return 0LL;
  }

  uint64_t request = _xpc_received_message_get_request(a1 + 88);
  if (!request) {
    return 0LL;
  }
  return _xpc_message_request_get_voucher(request);
}

uint64_t _xpc_dictionary_serialize_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (char *)(a1 + 32);
  size_t v5 = strlen(v4);
  _xpc_serializer_append(a2, v4, v5 + 1, 1);
  uint64_t v6 = *(unint64_t **)(a1 + 16);
  if (((unint64_t)v6 & 0x8000000000000000LL) != 0)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = *MEMORY[0x189616658];
    unint64_t v9 = v8 ^ (unint64_t)v6;
    do
    {
      if ((v9 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v7)) {
        break;
      }
      ++v7;
    }

    while (v7 != 7);
    unint64_t v10 = v7 | v9;
    uint64_t v11 = v7 & 7;
    int v12 = (v10 >> 55) + 8;
    if (v11 == 7) {
      LODWORD(v11) = v12;
    }
    if ((_DWORD)v11 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v11 != 13)
      {
        unint64_t v18 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v18);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v14 = *v6;
    if (*v6 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v14 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*v6 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v14 - (void)OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(v6);
    }
  }

  (*((void (**)(unint64_t *, uint64_t))extension_vtable + 9))(v6, a2);
  return 1LL;
}

void _xpc_dictionary_node_free(_DWORD *a1)
{
  if (a1[6] != 2)
  {
    uint64_t v2 = *(void *)a1;
    if (*(void *)a1) {
      *(void *)(v2 + 8) = *((void *)a1 + 1);
    }
    **((void **)a1 + 1) = v2;
    *(void *)a1 = -1LL;
    *((void *)a1 + 1) = -1LL;
    xpc_release(*((xpc_object_t *)a1 + 2));
    free(a1);
  }

unsigned int *_xpc_dictionary_apply_wire_f( uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t (*a4)(const char *, _OWORD *, uint64_t))
{
  uint64_t v6 = a2;
  memset(v13, 0, sizeof(v13));
  if (!a2)
  {
    uint64_t v6 = v13;
    _xpc_graph_deserializer_init_clone((uint64_t)v13, a1 + 152);
  }

  uint64_t result = (unsigned int *)_xpc_graph_deserializer_read((uint64_t)v6, 4uLL);
  if (!result) {
    return (unsigned int *)a4(0LL, 0LL, a3);
  }
  uint64_t v8 = *result;
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8 - 1;
    do
    {
      string = _xpc_graph_deserializer_read_string((uint64_t)v6);
      uint64_t result = (unsigned int *)a4(string, v6, a3);
      BOOL v12 = v9-- != 0;
    }

    while ((_DWORD)result && v12);
  }

  return result;
}

uint64_t _xpc_dictionary_deserialize_apply(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(_BYTE **)(a3 + 8);
  if (result
    && (uint64_t v4 = (const char *)result, v5 = *(_DWORD **)a3, (result = (uint64_t)_xpc_dictionary_unpack_value(a2)) != 0))
  {
    uint64_t v6 = (void *)result;
    _xpc_dictionary_insert(v5, v4, (__objc2_class **)result);
    xpc_release(v6);
    return 1LL;
  }

  else
  {
    *uint64_t v3 = 0;
  }

  return result;
}

xpc_object_t _xpc_dictionary_unpack_value(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v2) {
    return 0LL;
  }
  unsigned int v3 = *v2;
  int depth = _xpc_graph_deserializer_get_depth(a1);
  if (!_xpc_class_id_valid(v3))
  {
    if (_xpc_class_id_from_wire_valid(v3))
    {
      xpc_object_t v7 = xpc_null_create();
      if (_xpc_graph_deserializer_skip_value(a1, v3)) {
        return v7;
      }
      else {
        return 0LL;
      }
    }

    return 0LL;
  }

  if ((v3 == 57344 || v3 == 0x10000 || v3 == 61440) && !_xpc_graph_deserializer_enter_container(a1))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    size_t v5 = (uint64_t (*)(uint64_t))_xpc_deserialize_from_wire_id(v3);
    uint64_t v6 = v5(a1);
  }

  _xpc_graph_deserializer_restore_depth(a1, depth);
  return (xpc_object_t)v6;
}

uint64_t _xpc_dictionary_copy_apply(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = (__objc2_class **)xpc_copy(*(xpc_object_t *)(a1 + 16));
  size_t v5 = (const char *)(a1 + 32);
  _xpc_dictionary_insert(a2, v5, v4);
  xpc_release(v4);
  return 1LL;
}

const char *_xpc_dictionary_apply_node_f_wire_apply(const char *result, uint64_t a2, uint64_t *a3)
{
  if (result)
  {
    uint64_t v4 = result;
    size_t v5 = (OSQueueHead *)*a3;
    uint64_t v6 = (uint64_t (*)(void *, uint64_t))a3[1];
    uint64_t v7 = a3[2];
    if (_xpc_dictionary_look_up_table(*a3, result))
    {
      return (const char *)_skip_id_and_value(a2);
    }

    else
    {
      uint64_t result = (const char *)_xpc_dictionary_unpack_value_and_vend(v5, a2);
      if (result)
      {
        _OWORD v8[4] = v4;
        v8[3] = 2LL;
        v8[0] = 0LL;
        v8[1] = 0LL;
        v8[2] = result;
        return (const char *)v6(v8, v7);
      }
    }
  }

  return result;
}

unint64_t _xpc_dictionary_look_up_table(uint64_t a1, const char *a2)
{
  unint64_t v3 = a1 + 8 * _hash_bucket(a2) + 32;
  do
  {
    unint64_t v3 = *(void *)v3;
    if (!v3) {
      break;
    }
    uint64_t v4 = (const char *)(v3 + 32);
  }

  while (strcmp(a2, v4));
  return v3;
}

xpc_object_t _xpc_dictionary_unpack_value_and_vend(OSQueueHead *a1, uint64_t a2)
{
  xpc_object_t v3 = _xpc_dictionary_unpack_value(a2);
  if (v3)
  {
    uint64_t v4 = _xpc_alloc(0x10uLL);
    v4[1] = v3;
    OSAtomicEnqueue(a1 + 14, v4, 0LL);
  }

  return v3;
}

BOOL _skip_id_and_value(uint64_t a1)
{
  uint64_t v2 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (v2 && (unsigned int v3 = *v2, *v2 != 122880) && _xpc_class_id_from_wire_valid(*v2)) {
    return _xpc_graph_deserializer_skip_value(a1, v3);
  }
  else {
    return 0LL;
  }
}

unint64_t _hash_bucket(const char *a1)
{
  if (!strcmp(a1, "XPCErrorDescription")) {
    return 0LL;
  }
  char v2 = *a1;
  if (!*a1) {
    return 5LL;
  }
  unsigned int v3 = (unsigned __int8 *)(a1 + 1);
  unint64_t v4 = 5381LL;
  do
  {
    unint64_t v4 = 33 * v4 + v2;
    int v5 = *v3++;
    char v2 = v5;
  }

  while (v5);
  return v4 % 7;
}

BOOL _xpc_dictionary_look_up_wire_apply(char *__s2, uint64_t a2, uint64_t a3)
{
  if (__s2)
  {
    uint64_t v4 = *(void *)(a3 + 8);
    int v5 = *(_BYTE **)(a3 + 16);
    _xpc_graph_deserializer_init_clone(v4, a2);
    *int v5 = 1;
  }

  return 0LL;
}

uint64_t vprocmgr_lookup_vproc()
{
  return 0LL;
}

__objc2_class **vproc_retain()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vproc_set_global_on_demand(int a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 7uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0LL);
  if (a1) {
    uint64_t v3 = 806LL;
  }
  else {
    uint64_t v3 = 807LL;
  }
  xpc_object_t object = 0LL;
  if (_xpc_domain_routine(v3, v2, &object))
  {
    uint64_t v4 = &_xpc_BOOL_false;
  }

  else
  {
    xpc_release(object);
    uint64_t v4 = 0LL;
  }

  xpc_release(v2);
  return v4;
}

__objc2_class **_vproc_kickstart_by_label()
{
  return &_xpc_BOOL_false;
}

void _vprocmgr_log_drain()
{
  while (1)
    sleep(0xFFFFFFFF);
}

__objc2_class **_vprocmgr_log_forward()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vprocmgr_move_subset_to_user()
{
  return &_xpc_BOOL_false;
}

uint64_t _vproc_grab_subset()
{
  return 46LL;
}

__objc2_class **_vproc_post_fork_ping()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vprocmgr_switch_to_session()
{
  return &_xpc_BOOL_false;
}

uint64_t _vproc_standby_count()
{
  return 0LL;
}

uint64_t _vproc_standby_timeout()
{
  return 0LL;
}

uint64_t _vproc_transaction_count_for_pid()
{
  return 5LL;
}

uint64_t _vproc_pid_is_managed()
{
  return 0LL;
}

uint64_t _spawn_via_launchd()
{
  return 0xFFFFFFFFLL;
}

__objc2_class **vproc_swap_integer(uint64_t a1, unsigned int a2, int64_t *a3, int64_t *a4)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v7 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v7 = _os_alloc_once();
  }
  if (a2 != 2)
  {
    if (a2 == 5)
    {
      uint64_t v8 = 0LL;
      *a4 = *(unsigned __int8 *)(v7 + 3);
      return (__objc2_class **)v8;
    }

    xpc_object_t request = _vproc_create_request();
    unint64_t v10 = request;
    if (a3)
    {
      xpc_dictionary_set_uint64(request, "ingsk", a2);
      xpc_dictionary_set_BOOL(v10, "set", 1);
      xpc_dictionary_set_int64(v10, "in", *a3);
    }

    if (a4)
    {
      xpc_dictionary_set_uint64(v10, "outgsk", a2);
      xpc_dictionary_set_BOOL(v10, "get", 1);
      xpc_object_t xdict = 0LL;
      if (!_xpc_bootstrap_routine(301LL, v10, &xdict))
      {
        *a4 = xpc_dictionary_get_int64(xdict, "out");
LABEL_16:
        xpc_release(xdict);
        uint64_t v8 = 0LL;
        goto LABEL_17;
      }
    }

    else
    {
      xpc_object_t xdict = 0LL;
    }

    uint64_t v8 = vproc_swap_integer;
LABEL_17:
    xpc_release(v10);
    return (__objc2_class **)v8;
  }

  if (a3) {
    return _vproc_set_global_on_demand(*a3 != 0);
  }
  return &_xpc_BOOL_false;
}

xpc_object_t _vproc_create_request()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "type", 7uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0LL);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  return v0;
}

uint64_t (*vproc_swap_complex(uint64_t a1, unsigned int a2, void *a3, void *a4))()
{
  xpc_object_t request = _vproc_create_request();
  uint64_t v8 = request;
  if (a3)
  {
    xpc_dictionary_set_uint64(request, "ingsk", a2);
    xpc_dictionary_set_BOOL(v8, "set", 1);
    xpc_dictionary_set_value(v8, "in", a3);
  }

  if (a4)
  {
    xpc_dictionary_set_uint64(v8, "outgsk", a2);
    xpc_dictionary_set_BOOL(v8, "get", 1);
  }

  xpc_object_t xdict = 0LL;
  int v9 = _xpc_bootstrap_routine(301LL, v8, &xdict);
  if (v9 == 135) {
    goto LABEL_14;
  }
  if (v9 == 45)
  {
    syslog(3, "Swap operation not supported: %d", a2);
LABEL_14:
    unint64_t v14 = vproc_swap_complex;
    goto LABEL_18;
  }

  if (v9)
  {
    _os_assumes_log();
    goto LABEL_14;
  }

  if (a4)
  {
    xpc_object_t value = (_launch_data *)xpc_dictionary_get_value(xdict, "out");
    if (value
      && ((uint64_t v11 = value, type = launch_data_get_type(value), type == LAUNCH_DATA_STRING) || type == LAUNCH_DATA_DICTIONARY))
    {
      xpc_object_t v13 = xpc_retain(v11);
      unint64_t v14 = 0LL;
      *a4 = v13;
    }

    else
    {
      unint64_t v14 = vproc_swap_complex;
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  xpc_release(xdict);
LABEL_18:
  xpc_release(v8);
  return v14;
}

uint64_t (*vproc_swap_string(char *a1, unsigned int a2, char *string, char **a4))()
{
  if (string)
  {
    a1 = (char *)xpc_string_create(string);
    string = a1;
  }

  xpc_object_t object = 0LL;
  if (!a4) {
    return vproc_swap_complex((uint64_t)a1, a2, string, 0LL);
  }
  uint64_t result = vproc_swap_complex((uint64_t)a1, a2, string, &object);
  if (!result)
  {
    if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_string)
    {
      string_ptr = xpc_string_get_string_ptr(object);
      *a4 = _xpc_strdup(string_ptr);
    }

    xpc_release(object);
    return 0LL;
  }

  return result;
}

__objc2_class **_vproc_send_signal_by_label(const char *a1, int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "type", 7uLL);
  xpc_dictionary_set_uint64(v4, "handle", 0LL);
  xpc_dictionary_set_int64(v4, "signal", a2);
  xpc_dictionary_set_string(v4, "name", a1);
  xpc_object_t object = 0LL;
  int v5 = _xpc_domain_routine(812LL, v4, &object);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = xpc_strerror(v5);
    syslog(3, "Could not signal service: %d: %s", v6, v7);
    uint64_t v8 = &_xpc_BOOL_false;
  }

  else
  {
    xpc_release(object);
    uint64_t v8 = 0LL;
  }

  xpc_release(v4);
  return v8;
}

__objc2_class **_vprocmgr_detach_from_console()
{
  return &_xpc_BOOL_false;
}

void _vproc_transaction_try_exit()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    xpc_object_t v0 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    xpc_object_t v0 = (os_unfair_lock_s *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if (!v0[43]._os_unfair_lock_opaque) {
    _exit(0);
  }
  os_unfair_lock_unlock(v0 + 44);
}

uint64_t _vproc_transaction_count()
{
  return 0LL;
}

__objc2_class **_vprocmgr_init()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vproc_get_last_exit_status(_DWORD *a1)
{
  int64_t v3 = 0LL;
  uint64_t result = vproc_swap_integer((uint64_t)a1, 1u, 0LL, &v3);
  if (!result) {
    *a1 = v3;
  }
  return result;
}

vproc_transaction_t vproc_transaction_begin(vproc_t virtual_proc)
{
  return vproc_transaction_begin;
}

vproc_standby_t vproc_standby_begin(vproc_t virtual_proc)
{
  return vproc_standby_begin;
}

uint64_t bootstrap_info()
{
  return 46LL;
}

int64_t bootstrap_register2(int a1, const char *a2, mach_port_name_t name, uint64_t a4)
{
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", a2);
  xpc_dictionary_set_mach_send(request, "port", name);
  xpc_dictionary_set_uint64(request, "flags", a4);
  xpc_object_t object = 0LL;
  int64_t v7 = _xpc_bootstrap_routine(204LL, request, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(request);
  return v7;
}

xpc_object_t _bootstrap_create_request()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "type", 7uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0LL);
  return v0;
}

uint64_t bootstrap_look_up2(uint64_t a1, char *a2, mach_port_name_t *a3, int a4, uint64_t a5)
{
  v6[2] = *MEMORY[0x1895FEE08];
  v6[0] = 0LL;
  v6[1] = 0LL;
  return bootstrap_look_up3(a1, a2, a3, a4, (const unsigned __int8 *)v6, a5);
}

uint64_t bootstrap_look_up3( uint64_t a1, char *a2, mach_port_name_t *a3, int a4, const unsigned __int8 *a5, uint64_t a6)
{
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", a2);
  xpc_dictionary_set_int64(request, "targetpid", a4);
  xpc_dictionary_set_uuid(request, "instance", a5);
  xpc_dictionary_set_uint64(request, "flags", a6);
  xpc_object_t xdict = 0LL;
  int v12 = _xpc_bootstrap_routine_authenticate(207LL, request, &xdict);
  if (xdict)
  {
    xpc_object_t value = (unsigned int *)xpc_dictionary_get_value(xdict, "port");
    if (value)
    {
      unint64_t v14 = value;
      if (xpc_get_type(value) == (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send)
      {
        mach_port_name_t right = xpc_mach_send_get_right(v14);
        int v16 = _xpc_mach_port_retain_send(right);
        if (v16 != 19 && v16)
        {
          _os_assumes_log();
          int v12 = 17;
        }

        else
        {
          *a3 = right;
        }
      }
    }

    xpc_release(xdict);
  }

  xpc_release(request);
  if (v12 == 141) {
    unsigned int v17 = 268435459;
  }
  else {
    unsigned int v17 = v12;
  }
  if (v17 == 124) {
    uint64_t v18 = 1102LL;
  }
  else {
    uint64_t v18 = v17;
  }
  if (!(_DWORD)v18) {
    _launch_report_service_lookup(a2);
  }
  return v18;
}

int64_t bootstrap_check_in2(uint64_t a1, const char *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  __int128 v5 = 0uLL;
  return bootstrap_check_in3(a1, a2, a3, &v5, a4);
}

int64_t bootstrap_check_in3(uint64_t a1, const char *a2, _DWORD *a3, _OWORD *a4, uint64_t a5)
{
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", a2);
  xpc_dictionary_set_uint64(request, "flags", a5);
  xpc_object_t xdict = 0LL;
  int64_t v10 = _xpc_bootstrap_routine_check_in(206LL, request, &xdict);
  if (xdict)
  {
    *a3 = xpc_dictionary_extract_mach_recv(xdict, "port");
    uuid = xpc_dictionary_get_uuid(xdict, "instance");
    if (uuid) {
      *a4 = *(_OWORD *)uuid;
    }
    xpc_release(xdict);
  }

  xpc_release(request);
  return v10;
}

uint64_t bootstrap_look_up_per_user(uint64_t a1, const char *a2, unsigned int a3, _DWORD *a4)
{
  if ((xpc_user_sessions_enabled() & 1) == 0)
  {
    uint64_t v11 = _xpc_asprintf("Attempt to do a per-user lookup, but user sessions are not enabled.");
    _xpc_api_misuse(v11);
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!a2) {
    return 45LL;
  }
  uint64_t v8 = v7;
  xpc_dictionary_set_uint64(v7, "type", 2uLL);
  xpc_dictionary_set_uint64(v8, "handle", a3);
  xpc_dictionary_set_string(v8, "name", a2);
  xpc_dictionary_set_uint64(v8, "flags", 0x200uLL);
  xpc_object_t object = 0LL;
  int64_t v9 = _xpc_bootstrap_routine(207LL, v8, &object);
  if (!(_DWORD)v9)
  {
    *a4 = _xpc_dictionary_extract_mach_send(object, "port");
    xpc_release(object);
  }

  xpc_release(v8);
  return v9;
}

void bootstrap_lookup_children()
{
  qword_18C50BCD8 = (uint64_t)__str;
  __break(1u);
}

int64_t bootstrap_get_root(uint64_t a1, _DWORD *a2)
{
  xpc_object_t request = _bootstrap_create_request();
  xpc_object_t object = 0LL;
  int64_t v4 = _xpc_bootstrap_routine(211LL, request, &object);
  if (object)
  {
    *a2 = _xpc_dictionary_extract_mach_send(object, "rootport");
    xpc_release(object);
  }

  xpc_release(request);
  return v4;
}

kern_return_t bootstrap_create_server( mach_port_t bp, cmd_t server_cmd, uid_t server_uid, BOOLean_t on_demand, mach_port_t *server_port)
{
  kern_return_t v10;
  xpc_object_t object;
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "cmd", server_cmd);
  xpc_dictionary_set_uint64(request, "uid", server_uid);
  xpc_dictionary_set_BOOL(request, "ondemand", on_demand != 0);
  xpc_object_t object = 0LL;
  int64_t v10 = _xpc_bootstrap_routine(200LL, request, &object);
  if (object)
  {
    *server_port = _xpc_dictionary_extract_mach_send(object, "serverport");
    xpc_release(object);
  }

  xpc_release(request);
  return v10;
}

kern_return_t bootstrap_subset(mach_port_t bp, mach_port_t requestor_port, mach_port_t *subset_port)
{
  kern_return_t v6;
  xpc_object_t object;
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_mach_send(request, "reqport", requestor_port);
  xpc_object_t object = 0LL;
  uint64_t v6 = _xpc_bootstrap_routine(201LL, request, &object);
  if (object)
  {
    *subset_port = _xpc_dictionary_extract_mach_send(object, "subsetport");
    xpc_release(object);
  }

  xpc_release(request);
  return v6;
}

kern_return_t bootstrap_unprivileged(mach_port_t bp, mach_port_t *unpriv_port)
{
  return 46;
}

kern_return_t bootstrap_parent(mach_port_t bp, mach_port_t *parent_port)
{
  kern_return_t v5;
  xpc_object_t object;
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_mach_send(request, "port", bp);
  xpc_object_t object = 0LL;
  __int128 v5 = _xpc_bootstrap_routine(203LL, request, &object);
  if (object)
  {
    *parent_port = _xpc_dictionary_extract_mach_send(object, "parent");
    xpc_release(object);
  }

  xpc_release(request);
  return v5;
}

kern_return_t bootstrap_register(mach_port_t bp, name_t service_name, mach_port_t sp)
{
  return bootstrap_register2(bp, service_name, sp, 0LL);
}

kern_return_t bootstrap_create_service(mach_port_t bp, name_t service_name, mach_port_t *sp)
{
  kern_return_t v6;
  xpc_object_t object;
  xpc_object_t request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", service_name);
  xpc_object_t object = 0LL;
  uint64_t v6 = _xpc_bootstrap_routine(205LL, request, &object);
  if (object)
  {
    *sp = _xpc_dictionary_extract_mach_send(object, "port");
    xpc_release(object);
  }

  xpc_release(request);
  return v6;
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  __int128 v4 = 0uLL;
  return bootstrap_check_in3(*(uint64_t *)&bp, service_name, sp, &v4, 0LL);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  void v4[2] = *MEMORY[0x1895FEE08];
  v4[0] = 0LL;
  v4[1] = 0LL;
  return bootstrap_look_up3(*(uint64_t *)&bp, (char *)service_name, sp, 0, (const unsigned __int8 *)v4, 0LL);
}

kern_return_t bootstrap_status(mach_port_t bp, name_t service_name, bootstrap_status_t *service_active)
{
  return 46;
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  switch(r)
  {
    case 1100:
      uint64_t result = "Permission denied";
      break;
    case 1101:
      uint64_t result = "Service name already exists";
      break;
    case 1102:
      uint64_t result = "Unknown service name";
      break;
    case 1103:
      uint64_t result = "Service is already active";
      break;
    case 1104:
      uint64_t result = "Too many lookups were requested in one request";
      break;
    case 1105:
      uint64_t result = "Out of memory";
      break;
    default:
      if (r) {
        uint64_t result = mach_error_string(r);
      }
      else {
        uint64_t result = "Success";
      }
      break;
  }

  return result;
}

BOOL _xpc_double_equal(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 24) == *(double *)(a2 + 24);
}

uint64_t _xpc_double_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 8LL);
}

uint64_t _xpc_double_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "%f", *(double *)(a1 + 24));
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_double_debug_desc(double *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "<%s: %p>: %f", "double", a1, a1[3]);
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_double_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", xpc_object_t value = %f", *(double *)(a1 + 24));
}

uint64_t _xpc_double_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 20480;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  uint64_t v5 = *(void *)(a1 + 24);
  return _xpc_serializer_append(a2, &v5, 8uLL, 1);
}

uint64_t _xpc_double_deserialize(uint64_t a1)
{
  uint64_t result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    uint64_t v2 = *(void *)result;
    uint64_t result = _xpc_base_create();
    *(void *)(result + 24) = v2;
    *(_DWORD *)(result + 16) |= 1u;
    *(_DWORD *)(result + 20) = 8;
  }

  return result;
}

uint64_t _xpc_double_wire_length()
{
  return 8LL;
}

uint64_t _xpc_double_set_value(uint64_t result, double a2)
{
  *(double *)(result + 24) = a2;
  return result;
}

BOOL _xpc_double_get_wire_value(uint64_t a1, void *a2)
{
  unsigned int v3 = (void *)_xpc_graph_deserializer_read(a1, 8uLL);
  if (v3) {
    *a2 = *v3;
  }
  return v3 != 0LL;
}

xpc_object_t xpc_double_create(double value)
{
  xpc_object_t result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((double *)result + 3) = value;
  return result;
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  launch_data_type_t type = (__objc2_class *)xpc_get_type(xdouble);
  double result = 0.0;
  return result;
}

BOOL _xpc_int64_equal(void *a1, void *a2)
{
  int64_t value = xpc_int64_get_value(a1);
  return value == xpc_int64_get_value(a2);
}

uint64_t _xpc_int64_hash(void *a1)
{
  int64_t value = xpc_int64_get_value(a1);
  return _xpc_hash(&value, 8LL);
}

uint64_t _xpc_int64_desc(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  int64_t value = xpc_int64_get_value(a1);
  unsigned int v4 = snprintf(__str, 0x80uLL, "%lli", value);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_int64_debug_desc(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v9 = 0u;
  int64_t value = xpc_int64_get_value(a1);
  unsigned int v5 = snprintf(__str, 0x80uLL, "<%s: %p>: %lli", "int64", a1, value);
  if (v5 >= 0x7F) {
    int v6 = 127;
  }
  else {
    int v6 = v5;
  }
  return _xpc_serializer_append(a2, __str, (v6 + 1), 0);
}

uint64_t _xpc_int64_debug(void *a1, char *a2, size_t a3)
{
  int64_t value = xpc_int64_get_value(a1);
  return snprintf(a2, a3, ", int64_t value = %lli", value);
}

uint64_t _xpc_int64_serialize(void *a1, uint64_t a2)
{
  int __src = 12288;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int64_t value = xpc_int64_get_value(a1);
  return _xpc_serializer_append(a2, &value, 8uLL, 1);
}

unint64_t _xpc_int64_deserialize(uint64_t a1)
{
  unint64_t result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    uint64_t v2 = *(void *)result;
    unint64_t result = _xpc_int64_create_tagged(*(void *)result);
    if (!result)
    {
      unint64_t result = _xpc_base_create();
      *(void *)(result + 24) = v2;
      *(_DWORD *)(result + 16) |= 1u;
      *(_DWORD *)(result + 20) = 8;
    }
  }

  return result;
}

uint64_t _xpc_int64_wire_length()
{
  return 8LL;
}

void _xpc_int64_set_value()
{
  xpc_object_t v0 = _xpc_asprintf( "This function, long deprecated, is no longer supported. Please stop using launch_data (or at least switch to la unch_data_new_integer).");
  _xpc_api_misuse(v0);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  xpc_object_t result = (xpc_object_t)_xpc_int64_create_tagged(value);
  if (!result)
  {
    xpc_object_t result = (xpc_object_t)_xpc_base_create();
    *((_DWORD *)result + 5) = 8;
    *((void *)result + 3) = value;
  }

  return result;
}

unint64_t _xpc_int64_create_tagged(uint64_t a1)
{
  unint64_t result = (8 * (a1 & 0xFFFFFFFFFFFFFLL)) | 0x8280000000000007LL;
  unint64_t v3 = *MEMORY[0x189616658] ^ result;
  if ((~v3 & 0xC000000000000007LL) != 0) {
    return v3 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v3 & 7));
  }
  return result;
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = *MEMORY[0x189616658];
  unint64_t v4 = v3 ^ (unint64_t)xint;
  unint64_t v5 = v4 & 7;
  do
  {
    ++v2;
  }

  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000LL) == 0x280000000000000LL)
  {
    int64_t v6 = (uint64_t)(v4 << 9) >> 12;
    int64_t v7 = (uint64_t)(2 * v4) >> 4;
    if (v5 == 7) {
      return v6;
    }
    else {
      return v7;
    }
  }

  else
  {
LABEL_12:
    else {
      return 0LL;
    }
  }

BOOL _xpc_null_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_null_hash()
{
  return 0x804201026298LL;
}

uint64_t _xpc_null_desc(int a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  memset(v10, 0, sizeof(v10));
  __int128 v9 = 0u;
  __int128 v8 = 0u;
  __int128 v7 = 0u;
  __int128 v6 = 0u;
  __int128 v5 = 0u;
  __int128 v4 = 0u;
  strcpy(__src, "NULL");
  return _xpc_serializer_append(a2, __src, 5uLL, 0);
}

uint64_t _xpc_null_debug_desc(const void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "<%s: %p>: null-object", "null", a1);
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_null_debug(int a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", (null)");
}

uint64_t _xpc_null_serialize(int a1, uint64_t a2)
{
  int __src = 4096;
  return _xpc_serializer_append(a2, &__src, 4uLL, 1);
}

__objc2_class **_xpc_null_deserialize()
{
  return &_xpc_null;
}

uint64_t _xpc_null_wire_length()
{
  return 0LL;
}

xpc_object_t xpc_null_create(void)
{
  return &_xpc_null;
}

BOOL _xpc_string_equal(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 24) == *(void *)(a2 + 24)
      && strcmp(*(const char **)(a1 + 32), *(const char **)(a2 + 32)) == 0;
}

uint64_t _xpc_string_hash(uint64_t a1)
{
  return _xpc_hash(*(_BYTE **)(a1 + 32), *(void *)(a1 + 24) + 1LL);
}

uint64_t _xpc_string_desc(uint64_t a1, uint64_t a2)
{
  return _xpc_serializer_append(a2, *(void **)(a1 + 32), *(void *)(a1 + 24) + 1LL, 0);
}

uint64_t _xpc_string_debug_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  unsigned int v4 = snprintf( __str,  0x40uLL,  "<%s: %p> { length = %lu, contents = ",  "string",  (const void *)a1,  *(void *)(a1 + 24));
  if (v4 >= 0x3F) {
    size_t v5 = 63LL;
  }
  else {
    size_t v5 = v4;
  }
  _xpc_serializer_append(a2, __str, v5, 0);
  _xpc_serializer_append(a2, *(void **)(a1 + 32), *(void *)(a1 + 24), 0);
  return _xpc_serializer_append(a2, " }", 4uLL, 0);
}

uint64_t _xpc_string_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", str = %s, len = %lu", *(const char **)(a1 + 32), *(void *)(a1 + 24));
}

uint64_t _xpc_string_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 36864;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  int v5 = *(_DWORD *)(a1 + 24) + 1;
  _xpc_serializer_append(a2, &v5, 4uLL, 1);
  return _xpc_serializer_append(a2, *(void **)(a1 + 32), *(void *)(a1 + 24) + 1LL, 1);
}

uint64_t _xpc_string_deserialize(uint64_t a1)
{
  __s1 = 0LL;
  wire_int64_t value = _xpc_string_get_wire_value(a1, (uint64_t *)&__s1, &v6);
  uint64_t result = 0LL;
  if (wire_value)
  {
    uint64_t result = (uint64_t)_xpc_try_strdup(__s1);
    if (result)
    {
      uint64_t v3 = result;
      size_t v4 = strlen((const char *)result);
      uint64_t result = _xpc_string_create(v3, v4);
      *(_DWORD *)(result + 16) |= 1u;
    }
  }

  return result;
}

void _xpc_string_dispose(uint64_t a1)
{
}

const char *_xpc_string_set_value(uint64_t a1, const char *a2)
{
  *(void *)(a1 + 32) = 0LL;
  uint64_t result = _xpc_try_strdup(a2);
  if (result)
  {
    int v5 = result;
    uint64_t result = (const char *)strlen(result);
    *(void *)(a1 + 24) = result;
    *(void *)(a1 + 32) = v5;
    unint64_t v6 = (result & 0xFFFFFFFC) + 8;
    if ((unint64_t)result > v6)
    {
      __int128 v7 = _xpc_asprintf("Unreasonably large string");
      _xpc_api_misuse(v7);
    }

    *(_DWORD *)(a1 + 20) = v6;
  }

  return result;
}

uint64_t _xpc_string_get_wire_value(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t result = _xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
  {
    unint64_t v7 = *(unsigned int *)result;
    if (!(_DWORD)v7) {
      return 0LL;
    }
    uint64_t result = _xpc_graph_deserializer_read(a1, v7);
    if (!result) {
      return result;
    }
    if (!*(_BYTE *)(result + (v7 - 1)))
    {
      *a2 = result;
      *a3 = v7;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t xpc_string_create_no_copy(const char *a1)
{
  size_t v2 = strlen(a1);
  return _xpc_string_create((uint64_t)a1, v2);
}

uint64_t _xpc_string_create(uint64_t a1, unint64_t a2)
{
  uint64_t result = _xpc_base_create();
  unint64_t v5 = (a2 & 0xFFFFFFFC) + 8;
  if (v5 < a2)
  {
    unint64_t v6 = _xpc_asprintf("Unreasonably large string");
    _xpc_api_misuse(v6);
  }

  *(_DWORD *)(result + 20) = v5;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a1;
  return result;
}

xpc_object_t xpc_string_create_with_format(const char *fmt, ...)
{
  uint64_t v3 = 0LL;
  int v1 = vasprintf(&v3, fmt, va);
  return (xpc_object_t)_xpc_string_create((uint64_t)v3, v1);
}

xpc_object_t xpc_string_create_with_format_and_arguments(const char *fmt, va_list ap)
{
  size_t v4 = 0LL;
  int v2 = vasprintf(&v4, fmt, ap);
  return (xpc_object_t)_xpc_string_create((uint64_t)v4, v2);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  if (xpc_get_type(xstring) == (xpc_type_t)&OBJC_CLASS___OS_xpc_string) {
    return *((void *)xstring + 3);
  }
  else {
    return 0LL;
  }
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  if (xpc_get_type(xstring) != (xpc_type_t)&OBJC_CLASS___OS_xpc_string) {
    return 0LL;
  }
  uint64_t result = (const char *)*((void *)xstring + 4);
  if (result[*((void *)xstring + 3)])
  {
    _os_assumes_log();
    return 0LL;
  }

  return result;
}

xpc_object_t xpc_coalition_copy_info(uint64_t a1)
{
  if (!a1) {
    return xpc_null_create();
  }
  uint64_t v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 1uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0LL);
  xpc_dictionary_set_uint64(v2, "cid", v1);
  xpc_object_t v4 = 0LL;
  LODWORD(v1) = _xpc_domain_routine(829LL, v2, &v4);
  xpc_release(v2);
  if ((_DWORD)v1) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t xpc_coalition_history_pipe_async(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 1uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0LL);
  uint64_t v3 = _xpc_event_routine_async(830LL, v2, a1);
  xpc_release(v2);
  return v3;
}

BOOL _xpc_uint64_equal(void *a1, void *a2)
{
  uint64_t value = xpc_uint64_get_value(a1);
  return value == xpc_uint64_get_value(a2);
}

uint64_t _xpc_uint64_hash(void *a1)
{
  uint64_t value = xpc_uint64_get_value(a1);
  return _xpc_hash(&value, 8LL);
}

uint64_t _xpc_uint64_desc(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  uint64_t value = xpc_uint64_get_value(a1);
  unsigned int v4 = snprintf(__str, 0x80uLL, "%llu", value);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_uint64_debug_desc(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v9 = 0u;
  uint64_t value = xpc_uint64_get_value(a1);
  unsigned int v5 = snprintf(__str, 0x80uLL, "<%s: %p>: %llu", "uint64", a1, value);
  if (v5 >= 0x7F) {
    int v6 = 127;
  }
  else {
    int v6 = v5;
  }
  return _xpc_serializer_append(a2, __str, (v6 + 1), 0);
}

uint64_t _xpc_uint64_debug(void *a1, char *a2, size_t a3)
{
  uint64_t value = xpc_uint64_get_value(a1);
  return snprintf(a2, a3, ", uint64_t value = %llu", value);
}

uint64_t _xpc_uint64_serialize(void *a1, uint64_t a2)
{
  int __src = 0x4000;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  uint64_t value = xpc_uint64_get_value(a1);
  return _xpc_serializer_append(a2, &value, 8uLL, 1);
}

unint64_t _xpc_uint64_deserialize(uint64_t a1)
{
  unint64_t result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    unint64_t v2 = *(void *)result;
    unint64_t result = _xpc_uint64_create_tagged(*(void *)result);
    if (!result)
    {
      unint64_t result = _xpc_base_create();
      *(void *)(result + 24) = v2;
      *(_DWORD *)(result + 16) |= 1u;
      *(_DWORD *)(result + 20) = 8;
    }
  }

  return result;
}

uint64_t _xpc_uint64_wire_length()
{
  return 8LL;
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  xpc_object_t result = (xpc_object_t)_xpc_uint64_create_tagged(value);
  if (!result)
  {
    xpc_object_t result = (xpc_object_t)_xpc_base_create();
    *((_DWORD *)result + 5) = 8;
    *((void *)result + 3) = value;
  }

  return result;
}

unint64_t _xpc_uint64_create_tagged(unint64_t a1)
{
  unint64_t result = 0LL;
  if (!(a1 >> 52) && *MEMORY[0x189616650])
  {
    unint64_t result = (8 * a1) | 0x8200000000000007LL;
    unint64_t v3 = *MEMORY[0x189616658] ^ result;
    if ((~v3 & 0xC000000000000007LL) != 0) {
      return v3 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v3 & 7));
    }
  }

  return result;
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = *MEMORY[0x189616658];
  unint64_t v4 = v3 ^ (unint64_t)xuint;
  unint64_t v5 = v4 & 7;
  do
  {
    ++v2;
  }

  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000LL) == 0x200000000000000LL)
  {
    BOOL v6 = v5 == 7;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v6) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    return v7 & (v4 >> 3);
  }

  else
  {
LABEL_12:
    else {
      return 0LL;
    }
  }

xpc_object_t launch_copy_endpoints_properties_for_pid(int a1)
{
  xpc_object_t v1 = _xpc_connection_copy_attrs(0LL, a1);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  xpc_object_t value = xpc_dictionary_get_value(v1, "XPCServiceEndpoints");
  if (value) {
    xpc_object_t v4 = xpc_copy(value);
  }
  else {
    xpc_object_t v4 = 0LL;
  }
  xpc_release(v2);
  return v4;
}

void _xpc_objc_main(void *a1)
{
  xpc_object_t autorelease_pool = a1;
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    xpc_object_t autorelease_pool = xpc_retain(autorelease_pool);
    string = xpc_dictionary_get_string(autorelease_pool, "RunLoopType");
    if (string) {
      xpc_object_t v1 = string;
    }
    else {
      xpc_object_t v1 = "dispatch_main";
    }
    if (!strcmp(v1, "_UIApplicationMain")) {
      _xpc_objc_uimain(autorelease_pool);
    }
  }

  else
  {
    qword_18C50BCD8 = (uint64_t)"Configuration error: Invalid XPCService dictionary.";
    __break(1u);
  }

  if (!strcmp(v1, "_NSApplicationMain"))
  {
    xpc_release(autorelease_pool);
    qword_18C50BCD8 = (uint64_t)"Configuration error: Service specifies NSApplicationMain() for run loop but AppKit is not"
                               " available on this platform.";
    __break(1u);
  }

  if (!strcmp(v1, "NSRunLoop"))
  {
    xpc_release(autorelease_pool);
    xpc_object_t autorelease_pool = _get_autorelease_pool();
    Class Class = objc_getClass("NSRunLoop");
    if (Class)
    {
      Class v5 = Class;

      objc_msgSend((id)-[objc_class currentRunLoop](v5, "currentRunLoop"), "run");
      qword_18C50BCD8 = (uint64_t)"Bug in libxpc: _xpc_objc_main() is not supposed to return";
      __break(1u);
      goto LABEL_16;
    }

    qword_18C50BCD8 = (uint64_t)"Configuration error: Service specifies NSRunLoop for run loop but does not have class.";
    __break(1u);
  }

  if (!strcmp(v1, "dispatch_main"))
  {
    xpc_release(autorelease_pool);
    dispatch_main();
  }

LABEL_16:
  qword_18C50BCD8 = (uint64_t)"Configuration error: Service specifies unknown RunLoopType.";
  __break(1u);
}

void _xpc_objc_uimain(void *a1)
{
  id autorelease_pool = _get_autorelease_pool();
  nsstring_for_key = (char *)_create_nsstring_for_key(a1, "_UIApplicationClass");
  xpc_object_t v4 = (char *)_create_nsstring_for_key(a1, "_UIApplicationDelegateClass");
  xpc_release(a1);
  [autorelease_pool drain];
  Class v5 = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  if (!v5)
  {
    qword_18C50BCD8 = (uint64_t)"Configuration error: UIKit does not exist.";
    __break(1u);
  }

  BOOL v6 = (void (*)(uint64_t, char **, char *, char *))dlsym(v5, "UIApplicationMain");
  if (!v6)
  {
    qword_18C50BCD8 = (uint64_t)"Configuration error: Service specifies UIApplicationMain() for run loop but does not have symbol.";
    __break(1u);
  }

  uint64_t v7 = v6;
  uint64_t v8 = *_NSGetArgc();
  __int128 v9 = _NSGetArgv();
  v7(v8, *v9, nsstring_for_key, v4);

  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: _xpc_objc_uimain() is not supposed to return";
  __break(1u);
}

id _get_autorelease_pool()
{
  Class Class = objc_getClass("NSAutoreleasePool");
  if (!Class) {
    _get_autorelease_pool_cold_1();
  }
  return objc_alloc_init(Class);
}

const char *_create_nsstring_for_key(void *a1, const char *a2)
{
  Class Class = objc_getClass("NSString");
  if (!Class) {
    _create_nsstring_for_key_cold_1();
  }
  Class v5 = Class;
  unint64_t result = xpc_dictionary_get_string(a1, a2);
  if (result) {
    return (const char *)[[v5 alloc] initWithUTF8String:result];
  }
  return result;
}

BOOL _xpc_uuid_equal(uint64_t a1, uint64_t a2)
{
  return uuid_compare((const unsigned __int8 *)(a1 + 24), (const unsigned __int8 *)(a2 + 24)) == 0;
}

uint64_t _xpc_uuid_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 16LL);
}

uint64_t _xpc_uuid_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)(a1 + 24), out);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "%s", out);
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_uuid_debug_desc(const unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  memset(out, 0, 37);
  uuid_unparse_upper(a1 + 24, out);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  unsigned int v4 = snprintf(__str, 0x80uLL, "<%s: %p> %s", "uuid", a1, out);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

size_t _xpc_uuid_debug(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)(a1 + 24), out);
  size_t result = 0LL;
  if (a3 >= 2)
  {
    LODWORD(result) = snprintf(a2, a3, ", uuid = %s", out);
    else {
      return (int)result;
    }
  }

  return result;
}

uint64_t _xpc_uuid_serialize(uint64_t a1, uint64_t a2)
{
  int __src = 40960;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  return _xpc_serializer_append(a2, (void *)(a1 + 24), 0x10uLL, 1);
}

uint64_t _xpc_uuid_deserialize(uint64_t a1)
{
  uint64_t v1 = _xpc_graph_deserializer_read(a1, 0x10uLL);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (const unsigned __int8 *)v1;
  uint64_t v3 = _xpc_base_create();
  *(_DWORD *)(v3 + 20) = 16;
  uuid_copy((unsigned __int8 *)(v3 + 24), v2);
  *(_DWORD *)(v3 + 16) |= 1u;
  return v3;
}

uint64_t _xpc_uuid_wire_length()
{
  return 16LL;
}

BOOL _xpc_uuid_get_wire_value(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = _xpc_graph_deserializer_read(a1, 0x10uLL);
  if (v3) {
    *a2 = v3;
  }
  return v3 != 0;
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  uint64_t v2 = _xpc_base_create();
  *(_DWORD *)(v2 + 20) = 16;
  uuid_copy((unsigned __int8 *)(v2 + 24), uuid);
  return (xpc_object_t)v2;
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  if (xpc_get_type(xuuid) == (xpc_type_t)&OBJC_CLASS___OS_xpc_uuid) {
    return (const uint8_t *)xuuid + 24;
  }
  else {
    return 0LL;
  }
}

uint64_t _xpc_fd_copy(uint64_t a1)
{
  if (_xpc_mach_port_retain_send(*(_DWORD *)(a1 + 24)))
  {
    _os_assumes_log();
    return 0LL;
  }

  else
  {
    int v2 = *(_DWORD *)(a1 + 24);
    uint64_t result = _xpc_base_create();
    *(_DWORD *)(result + 16) |= 2u;
    *(_DWORD *)(result + 24) = v2;
  }

  return result;
}

BOOL _xpc_fd_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_fd_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_fd_desc(void *a1, uint64_t a2)
{
  uint64_t v43 = *MEMORY[0x1895FEE08];
  int v4 = xpc_fd_dup(a1);
  bzero(__str, 0x480uLL);
  unsigned int v5 = snprintf(__str, 0x480uLL, "<%s: %p> { type = ", "fd", a1);
  unsigned int v6 = v5;
  memset(&v41.st_blksize, 0, 32);
  if (v5 >= 0x47F) {
    uint64_t v7 = 1151LL;
  }
  else {
    uint64_t v7 = v5;
  }
  __int128 v8 = &__str[v7];
  unint64_t v9 = 1152 - v7;
  memset(&v41, 0, 112);
  int v10 = fstat(v4, &v41);
  if (v10)
  {
    if (v10 == -1) {
      _xpc_fd_desc_cold_1();
    }
    mode_t st_mode = v41.st_mode;
    if ((v41.st_mode & 0xF000) == 0x4000)
    {
      if (v6 > 0x47E)
      {
        uint64_t v13 = 0LL;
      }

      else
      {
        int v12 = snprintf(v8, 1152 - v7, "directory");
        uint64_t v13 = 1151 - v7;
        if (v9 > v12) {
          uint64_t v13 = v12;
        }
        mode_t st_mode = v41.st_mode;
      }

      uint64_t v16 = &v8[v13];
      size_t v15 = v9 - v13;
    }

    else
    {
      size_t v15 = 1152 - v7;
      uint64_t v16 = &__str[v7];
    }

    if ((st_mode & 0xF000) == 0x8000)
    {
      if (v16 == v8)
      {
        uint64_t v18 = v8;
      }

      else
      {
        if (v15 < 2)
        {
          size_t v17 = 0LL;
        }

        else
        {
          size_t v17 = snprintf(v16, v15, "/");
          if (v15 <= v17) {
            size_t v17 = v15 - 1;
          }
        }

        uint64_t v18 = &v16[v17];
        v15 -= v17;
      }

      if (v15 < 2)
      {
        size_t v19 = 0LL;
      }

      else
      {
        size_t v19 = snprintf(v18, v15, "file");
        if (v15 <= v19) {
          size_t v19 = v15 - 1;
        }
      }

      uint64_t v16 = &v18[v19];
      v15 -= v19;
      mode_t st_mode = v41.st_mode;
    }

    if ((st_mode & 0xF000) == 0x2000)
    {
      if (v16 == v8)
      {
        BOOL v21 = v8;
      }

      else
      {
        if (v15 < 2)
        {
          size_t v20 = 0LL;
        }

        else
        {
          size_t v20 = snprintf(v16, v15, "/");
          if (v15 <= v20) {
            size_t v20 = v15 - 1;
          }
        }

        BOOL v21 = &v16[v20];
        v15 -= v20;
      }

      if (v15 < 2)
      {
        size_t v22 = 0LL;
      }

      else
      {
        size_t v22 = snprintf(v21, v15, "character device");
        if (v15 <= v22) {
          size_t v22 = v15 - 1;
        }
      }

      uint64_t v16 = &v21[v22];
      v15 -= v22;
      mode_t st_mode = v41.st_mode;
    }

    if ((st_mode & 0xF000) == 0x6000)
    {
      if (v16 == v8)
      {
        uint64_t v24 = v8;
      }

      else
      {
        if (v15 < 2)
        {
          size_t v23 = 0LL;
        }

        else
        {
          size_t v23 = snprintf(v16, v15, "/");
          if (v15 <= v23) {
            size_t v23 = v15 - 1;
          }
        }

        uint64_t v24 = &v16[v23];
        v15 -= v23;
      }

      if (v15 < 2)
      {
        size_t v25 = 0LL;
      }

      else
      {
        size_t v25 = snprintf(v24, v15, "block device");
        if (v15 <= v25) {
          size_t v25 = v15 - 1;
        }
      }

      uint64_t v16 = &v24[v25];
      v15 -= v25;
      mode_t st_mode = v41.st_mode;
    }

    if ((st_mode & 0xF000) == 0xC000)
    {
      if (v16 == v8)
      {
        unint64_t v27 = v8;
      }

      else
      {
        if (v15 < 2)
        {
          size_t v26 = 0LL;
        }

        else
        {
          size_t v26 = snprintf(v16, v15, "/");
          if (v15 <= v26) {
            size_t v26 = v15 - 1;
          }
        }

        unint64_t v27 = &v16[v26];
        v15 -= v26;
      }

      if (v15 < 2)
      {
        size_t v28 = 0LL;
      }

      else
      {
        size_t v28 = snprintf(v27, v15, "socket");
        if (v15 <= v28) {
          size_t v28 = v15 - 1;
        }
      }

      uint64_t v16 = &v27[v28];
      v15 -= v28;
      mode_t st_mode = v41.st_mode;
    }

    if ((st_mode & 0xF000) == 0x1000)
    {
      if (v16 == v8)
      {
        int v30 = v8;
      }

      else
      {
        if (v15 < 2)
        {
          size_t v29 = 0LL;
        }

        else
        {
          size_t v29 = snprintf(v16, v15, "/");
          if (v15 <= v29) {
            size_t v29 = v15 - 1;
          }
        }

        int v30 = &v16[v29];
        v15 -= v29;
      }

      if (v15 < 2)
      {
        size_t v31 = 0LL;
      }

      else
      {
        size_t v31 = snprintf(v30, v15, "fifo");
        if (v15 <= v31) {
          size_t v31 = v15 - 1;
        }
      }

      uint64_t v16 = &v30[v31];
    }
  }

  else
  {
    if (v6 > 0x47E)
    {
      unint64_t v14 = 0LL;
    }

    else
    {
      unint64_t v14 = snprintf(v8, 1152 - v7, "(invalid descriptor)");
      if (v9 <= v14) {
        unint64_t v14 = 1151 - v7;
      }
    }

    uint64_t v16 = &v8[v14];
  }

  size_t v32 = v9 + v8 - v16;
  if (v32 < 2)
  {
    size_t v33 = 0LL;
  }

  else
  {
    size_t v33 = snprintf(v16, v32, ", path = ");
    if (v32 <= v33) {
      size_t v33 = v32 - 1;
    }
  }

  uint64_t v34 = &v16[v33];
  size_t v35 = v32 - v33;
  if (fcntl(v4, 50, &v16[v33]) == -1)
  {
    if (v35 < 2)
    {
      size_t v36 = 0LL;
    }

    else
    {
      LODWORD(v36) = snprintf(v34, v35, "(invalid path)");
      else {
        size_t v36 = (int)v36;
      }
    }
  }

  else
  {
    size_t v36 = strlen(v34);
  }

  __int128 v37 = &v34[v36];
  size_t v38 = v35 - v36;
  if (v38 < 2)
  {
    size_t v39 = 0LL;
  }

  else
  {
    size_t v39 = snprintf(v37, v38, " }");
    if (v38 <= v39) {
      size_t v39 = v38 - 1;
    }
  }

  _xpc_serializer_append(a2, __str, &v37[v39] - __str + 1, 0);
  uint64_t result = close(v4);
  if ((_DWORD)result) {
    return _os_assumes_log();
  }
  return result;
}

uint64_t _xpc_fd_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", fileport = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_fd_serialize(uint64_t a1, void *a2)
{
  int v3 = 45056;
  return _xpc_serializer_append_port(a2, &v3, 4uLL, a1, *(_DWORD *)(a1 + 24), 19);
}

uint64_t _xpc_fd_deserialize(uint64_t *a1)
{
  int v4 = 0;
  int v1 = v4;
  uint64_t result = _xpc_base_create();
  int v3 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) = v3 | 3;
  return result;
}

uint64_t _xpc_fd_wire_length()
{
  return -1LL;
}

uint64_t _xpc_fd_dispose(uint64_t a1)
{
  uint64_t result = _xpc_mach_port_release(*(_DWORD *)(a1 + 24));
  if ((_DWORD)result) {
    return _os_assumes_log();
  }
  return result;
}

uint64_t _xpc_fd_get_port(unsigned int *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_fd) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return a1[6];
}

xpc_object_t xpc_fd_create(int fd)
{
  if (fd != -1 && _xpc_fileport_makeport())
  {
    _os_assumes_log();
    return 0LL;
  }

  else
  {
    xpc_object_t result = (xpc_object_t)_xpc_base_create();
    *((_DWORD *)result + 4) |= 2u;
    *((_DWORD *)result + 6) = 0;
  }

  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  if (xpc_get_type(xfd) == (xpc_type_t)&OBJC_CLASS___OS_xpc_fd) {
    return _xpc_fileport_makefd(*((unsigned int *)xfd + 6));
  }
  else {
    return -1;
  }
}

uint64_t _xpc_shmem_copy(uint64_t a1)
{
  if (_xpc_mach_port_retain_send(*(_DWORD *)(a1 + 24)))
  {
    _os_assumes_log();
    return 0LL;
  }

  else
  {
    int v2 = *(_DWORD *)(a1 + 24);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t result = _xpc_base_create();
    *(_DWORD *)(result + 16) |= 2u;
    *(_DWORD *)(result + 20) = 8;
    *(_DWORD *)(result + 24) = v2;
    *(void *)(result + 32) = v3;
  }

  return result;
}

BOOL _xpc_shmem_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_shmem_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_shmem_desc(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v12 = 0u;
  uint64_t v4 = a1[4];
  unint64_t v5 = (v4 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148];
  int v6 = getpagesize();
  uint64_t v7 = "s";
  if (v5 / v6 == 1) {
    uint64_t v7 = (const char *)&unk_18018902B;
  }
  unsigned int v8 = snprintf(__str, 0x80uLL, "<%s: %p>: %llu bytes (%llu page%s)", "shmem", a1, v4, v5 / v6, v7);
  if (v8 >= 0x7F) {
    int v9 = 127;
  }
  else {
    int v9 = v8;
  }
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_shmem_debug(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = (v5 + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148];
  int v7 = *(_DWORD *)(a1 + 24);
  int v8 = getpagesize();
  return snprintf(a2, a3, ", port = 0x%x, len = %llu (%llu pages)", v7, v5, v6 / v8);
}

uint64_t _xpc_shmem_serialize(uint64_t a1, void *a2)
{
  int __src = 49152;
  _xpc_serializer_append((uint64_t)a2, &__src, 4uLL, 1);
  uint64_t v5 = *(void *)(a1 + 32);
  return _xpc_serializer_append_port(a2, &v5, 8uLL, a1, *(_DWORD *)(a1 + 24), 19);
}

uint64_t _xpc_shmem_deserialize(uint64_t *a1)
{
  mach_port_name_t name = 0;
  int v2 = (uint64_t *)_xpc_graph_deserializer_read((uint64_t)a1, 8uLL);
  if (_xpc_graph_deserializer_read_port(a1, 17, (int *)&name))
  {
    if (v2)
    {
      uint64_t v3 = *v2;
      mach_port_name_t v4 = name;
      uint64_t result = _xpc_base_create();
      int v6 = *(_DWORD *)(result + 16);
      *(_DWORD *)(result + 20) = 8;
      *(_DWORD *)(result + 24) = v4;
      *(void *)(result + 32) = v3;
      *(_DWORD *)(result + 16) = v6 | 3;
      return result;
    }
  }

  return 0LL;
}

uint64_t _xpc_shmem_wire_length()
{
  return -1LL;
}

uint64_t _xpc_shmem_dispose(uint64_t a1)
{
  uint64_t result = _xpc_mach_port_release(*(_DWORD *)(a1 + 24));
  if ((_DWORD)result) {
    return _os_assumes_log();
  }
  return result;
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)_xpc_shmem_create_with_prot(region, length, 3);
}

uint64_t _xpc_shmem_create_with_prot(const void *a1, memory_object_size_t a2, int a3)
{
  kern_return_t memory_entry_64;
  memory_object_size_t v8;
  uint64_t result;
  mach_port_t v10;
  char *v11;
  memory_object_size_t size;
  mach_port_t object_handle;
  if (malloc_size(a1))
  {
    __int128 v11 = _xpc_asprintf("Attempt to pass a malloc(3)ed region to xpc_shmem_create().");
    _xpc_api_misuse(v11);
  }

  object_uintptr_t handle = 0;
  size_t size = a2;
  int v6 = (vm_map_t *)MEMORY[0x1895FFD48];
  memory_entry_64 = mach_make_memory_entry_64( *MEMORY[0x1895FFD48],  &size,  (memory_object_offset_t)a1,  a3 | 0x400040,  &object_handle,  0);
  if (memory_entry_64)
  {
    if (memory_entry_64 != 18) {
      goto LABEL_10;
    }
    if (mach_make_memory_entry_64(*v6, &size, (memory_object_offset_t)a1, a3 & 0xFFBFFFBF | 0x40, &object_handle, 0)) {
      return 0LL;
    }
  }

  int v8 = size;
  if (size < a2)
  {
    syslog( 3,  "Shared memory length exceeded size supported by a single memory entry (actual/supported): %llu/%llu",  a2,  size);
LABEL_10:
    _os_assumes_log();
    return 0LL;
  }

  int v10 = object_handle;
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 20) = 8;
  *(_DWORD *)(result + 24) = v10;
  *(void *)(result + 32) = v8;
  *(_DWORD *)(result + 40) = a3;
  return result;
}

uint64_t xpc_shmem_create_readonly(const void *a1, memory_object_size_t a2)
{
  return _xpc_shmem_create_with_prot(a1, a2, 1);
}

uint64_t xpc_shmem_get_length(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_shmem) {
    return a1[4];
  }
  else {
    return 0LL;
  }
}

uint64_t _xpc_shmem_get_mach_port(unsigned int *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_shmem) {
    return a1[6];
  }
  else {
    return 0LL;
  }
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  if (xpc_get_type(xshmem) == (xpc_type_t)&OBJC_CLASS___OS_xpc_shmem
    && !_xpc_vm_map_memory_entry( *((_DWORD *)xshmem + 6),  *((void *)xshmem + 4),  (mach_vm_address_t *)region,  1))
  {
    return *((void *)xshmem + 4);
  }

  else
  {
    return 0LL;
  }

void _xpc_init_pid_domain_process_initial_images(uint64_t a1, void *a2, void *a3)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_object_t v7 = xpc_dictionary_create_empty();
  v8[0] = MEMORY[0x1895FED80];
  v8[1] = 0x40000000LL;
  v8[2] = ___xpc_init_pid_domain_process_initial_images_block_invoke;
  v8[3] = &__block_descriptor_tmp_4;
  _OWORD v8[4] = v7;
  void v8[5] = empty;
  xpc_dictionary_apply(a2, v8);
  xpc_dictionary_set_value(a3, "paths", empty);
  xpc_array_set_value(*(xpc_object_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL, v7);
  xpc_release(empty);
  xpc_release(v7);
}

uint64_t ___xpc_init_pid_domain_process_initial_images_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  if (_xpc_has_prefix(a2, "/System/Library/Frameworks/") || _xpc_has_prefix(a2, "/System/Library/PrivateFrameworks/")) {
    int v6 = (xpc_object_t *)(a1 + 32);
  }
  else {
    int v6 = (xpc_object_t *)(a1 + 40);
  }
  xpc_dictionary_set_value(*v6, a2, a3);
  return 1LL;
}

void _xpc_envdict_putenv(void *a1, const char *a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (_xpc_has_prefix(a2, "__XPC_"))
  {
    mach_port_name_t v4 = strchr(a2, 61);
    if (v4)
    {
      uint64_t v5 = v4;
      memset(v6, 0, sizeof(v6));
      __strlcpy_chk();
      xpc_dictionary_set_string(a1, (const char *)v6, v5 + 1);
    }
  }

uint64_t _libxpc_initializer()
{
  kern_return_t v8;
  uint64_t v9;
  mach_port_array_t v10;
  int v11;
  mach_port_name_t v12;
  uint64_t v13;
  task_t *v14;
  mach_port_name_t v15;
  kern_return_t v16;
  mach_port_array_t v17;
  int v18;
  mach_port_name_t *v19;
  int special_port;
  mach_port_name_t v21;
  char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set[4];
  init_port_set[3] = *(mach_port_array_t *)MEMORY[0x1895FEE08];
  _xpc_ktrace_pid0();
  _xpc_install_dispatch_hooks();
  uint64_t v0 = MEMORY[0x1895FF8E0];
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v1 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v1 = _os_alloc_once();
  }
  if (*MEMORY[0x189616650])
  {
    xpc_get_class4NSXPC(&OBJC_CLASS___OS_xpc_uint64);
    _objc_registerTaggedPointerClass();
    xpc_get_class4NSXPC(&OBJC_CLASS___OS_xpc_int64);
    _objc_registerTaggedPointerClass();
  }

  *(_DWORD *)(v1 + 176) = 0;
  *(void *)(v1 + 184) = 0LL;
  *(void *)(v1 + 112) = xpc_array_create(0LL, 0LL);
  *(_DWORD *)(v1 + 104) = 0;
  *(_BYTE *)(v1 + 41) = 1;
  int v2 = getenv("XPC_FLAGS");
  if (!v2) {
    int v2 = "0x0";
  }
  uint64_t v3 = strtoll(v2, 0LL, 16);
  *(void *)(v1 + 8) = v3;
  mach_port_name_t v4 = getenv("XPC_NULL_BOOTSTRAP");
  if (v4 && !strcmp(v4, "1"))
  {
    v3 |= 2uLL;
    *(void *)(v1 + 8) = v3;
    if ((v3 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if ((v3 & 0x4000) != 0) {
LABEL_10:
  }
    *(_BYTE *)(v1 + 208) = 1;
LABEL_11:
  uint64_t v5 = getenv("XPC_SERVICES_UNAVAILABLE");
  if (v5 && !strcmp(v5, "1")) {
    *(void *)(v1 + 8) = v3 | 0x80;
  }
  if (getsectbyname("__TEXT", "__launchd"))
  {
    *(_BYTE *)uint64_t v1 = 1;
  }

  else if (getsectbyname("__TEXT", "__xpcproxy"))
  {
    *(_BYTE *)(v1 + 1) = 1;
  }

  else if (getsectbyname("__TEXT", "__launchctl"))
  {
    *(_BYTE *)(v1 + 2) = 1;
  }

  else if ((*(_BYTE *)(v1 + 8) & 1) != 0)
  {
    *(_BYTE *)(v1 + 3) = 1;
  }

  if (getsectbyname("__TEXT", "__libxpcunittest") && MEMORY[0xFFFFF4084]) {
    *(_BYTE *)(v1 + 88) = 1;
  }
  uint64_t v6 = *(void *)(v1 + 8);
  if ((v6 & 2) != 0)
  {
    *(_BYTE *)(v1 + 4) = 1;
    _xpc_neuter_potential_reentrancy(1);
    uint64_t v6 = *(void *)(v1 + 8);
    if ((v6 & 0x2000) == 0)
    {
LABEL_29:
      if ((v6 & 0x10) == 0) {
        goto LABEL_30;
      }
LABEL_34:
      xpc_track_activity();
      goto LABEL_35;
    }
  }

  else if ((v6 & 0x2000) == 0)
  {
    goto LABEL_29;
  }

  *(_BYTE *)(v1 + 192) = 1;
  if ((v6 & 0x10) != 0) {
    goto LABEL_34;
  }
LABEL_30:
  if ((v6 & 8) != 0) {
    xpc_transactions_enable();
  }
LABEL_35:
  if (getenv("XPC_DEBUG_SERVICES")) {
    *(_BYTE *)(v1 + 40) = 1;
  }
  if (!*(_BYTE *)v1 && !*(_BYTE *)(v1 + 4))
  {
    if (*(_BYTE *)(v1 + 1))
    {
      if (*(void *)(v0 + 16) == -1LL) {
        uint64_t v7 = *(void *)(v0 + 24);
      }
      else {
        uint64_t v7 = _os_alloc_once();
      }
      init_port_set[0] = 0LL;
      init_port_setCnt = 0;
      int v8 = mach_ports_lookup(*MEMORY[0x1895FFD48], init_port_set, &init_port_setCnt);
      if (v8) {
        _libxpc_initializer_cold_2(v8);
      }
      int v9 = init_port_setCnt;
      if (!init_port_setCnt) {
        _libxpc_initializer_cold_4();
      }
      int v10 = init_port_set[0];
      __int128 v11 = *init_port_set[0];
      *(_DWORD *)(v7 + 16) = *init_port_set[0];
      mig_deallocate((vm_address_t)v10, 4 * v9);
      if ((*(_BYTE *)(v7 + 9) & 1) != 0)
      {
        __int128 v12 = *(_DWORD *)(v7 + 16);
        *MEMORY[0x1895FF920] = v12;
        _xpc_mach_port_retain_send(v12);
      }

      _xpc_create_bootstrap_pipe();
      goto LABEL_71;
    }

    __int128 v13 = *(void *)(v0 + 16);
    if (*(_BYTE *)(v1 + 3))
    {
      if (v13 == -1)
      {
        unint64_t v27 = *(void *)(v0 + 24);
        size_t v26 = v27;
      }

      else
      {
        size_t v26 = _os_alloc_once();
        unint64_t v27 = *(void *)(v0 + 24);
      }

      __int128 v14 = (task_t *)MEMORY[0x1895FFD48];
      if (!task_get_special_port(*MEMORY[0x1895FFD48], 4, (mach_port_t *)(v27 + 16)))
      {
        __int128 v15 = *(_DWORD *)(v27 + 16);
        *MEMORY[0x1895FF920] = v15;
        _xpc_mach_port_retain_send(v15);
        if ((*(_BYTE *)(v27 + 8) & 4) != 0)
        {
          init_port_set[0] = 0LL;
          init_port_setCnt = 0;
          __int128 v16 = mach_ports_lookup(*v14, init_port_set, &init_port_setCnt);
          if (v16) {
            _libxpc_initializer_cold_2(v16);
          }
          __int128 v17 = init_port_set[0];
          if (*init_port_set[0] + 1 >= 2)
          {
            *(void *)(v27 + 32) = _xpc_endpoint_create(*init_port_set[0]);
            __int128 v17 = init_port_set[0];
          }

          mig_deallocate((vm_address_t)v17, 4LL * init_port_setCnt);
        }

        _xpc_create_bootstrap_pipe();
        _xpc_collect_environment();
        _xpc_collect_images();
        if ((*(_DWORD *)(v26 + 16) + 1) <= 1)
        {
          *(void *)(v26 + 8) |= 2uLL;
          *(_BYTE *)(v26 + 4) = 1;
        }

        __int128 v18 = 0;
LABEL_70:
        _xpc_early_init(v18);
        goto LABEL_71;
      }

      special_port = _libxpc_initializer_cold_3();
    }

    else
    {
      if (v13 == -1)
      {
        size_t v29 = *(void *)(v0 + 24);
        size_t v28 = v29;
      }

      else
      {
        size_t v28 = _os_alloc_once();
        size_t v29 = *(void *)(v0 + 24);
      }

      uint64_t v19 = (mach_port_name_t *)(v29 + 16);
      special_port = task_get_special_port(*MEMORY[0x1895FFD48], 4, (mach_port_t *)(v29 + 16));
      if (!special_port)
      {
        BOOL v21 = *v19;
        *MEMORY[0x1895FF920] = *v19;
        _xpc_mach_port_retain_send(v21);
        _xpc_create_bootstrap_pipe();
        _xpc_collect_environment();
        _xpc_collect_images();
        if ((*(_DWORD *)(v28 + 16) + 1) <= 1)
        {
          *(void *)(v28 + 8) |= 2uLL;
          *(_BYTE *)(v28 + 4) = 1;
        }

        __int128 v18 = 1;
        goto LABEL_70;
      }
    }

    _libxpc_initializer_cold_1(special_port);
  }

LABEL_71:
  size_t v22 = getenv("XPC_FLAGS");
  if (v22)
  {
    size_t v23 = v22;
    uint64_t v24 = *(void *)(v1 + 8) & 0x82LL;
    memset(init_port_set, 0, 24);
    snprintf((char *)init_port_set, 0x18uLL, "0x%llx", v24);
  }

  *(_BYTE *)(v1 + 137) = 1;
  return _xpc_ktrace_pid0();
}

uint64_t xpc_atfork_prepare()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t result = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t result = _os_alloc_once();
  }
  if (!*(_BYTE *)result)
  {
    mach_port_t init_port_set = *(_DWORD *)(result + 16);
    return mach_ports_register(*MEMORY[0x1895FFD48], &init_port_set, 1u);
  }

  return result;
}

uint64_t xpc_atfork_child()
{
  kern_return_t v2;
  uint64_t v3;
  BOOL v4;
  mach_port_array_t v5;
  uint64_t v6;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set;
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  *(_BYTE *)(v0 + 41) = 0;
  mach_port_t init_port_set = 0LL;
  init_port_setCnt = 0;
  uint64_t v1 = (task_inspect_t *)MEMORY[0x1895FFD48];
  int v2 = mach_ports_lookup(*MEMORY[0x1895FFD48], &init_port_set, &init_port_setCnt);
  uint64_t v3 = init_port_setCnt;
  if (v2) {
    mach_port_name_t v4 = 1;
  }
  else {
    mach_port_name_t v4 = init_port_setCnt == 0;
  }
  if (!v4)
  {
    uint64_t v5 = init_port_set;
    *(_DWORD *)(v0 + 16) = *init_port_set;
    mig_deallocate((vm_address_t)v5, 4 * v3);
    uint64_t v6 = *(void *)(v0 + 24);
    if (v6)
    {
      xpc_pipe_invalidate(v6);
      xpc_release(*(xpc_object_t *)(v0 + 24));
    }

    *(void *)(v0 + 24) = xpc_pipe_create_from_port(*(_DWORD *)(v0 + 16), 4);
  }

  if (getenv("XPC_SERVICE_NAME")) {
    setenv("XPC_SERVICE_NAME", "0", 1);
  }
  return task_get_special_port(*v1, 4, MEMORY[0x1895FF920]);
}

uint64_t _xpc_is_multithreaded()
{
  if (MEMORY[0x1895FE7F0]) {
    return _dispatch_is_multithreaded();
  }
  else {
    return 0LL;
  }
}

int64_t _xpc_bootstrap_services(void *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", 5uLL);
  pid_t v3 = getpid();
  xpc_dictionary_set_uint64(v2, "handle", v3);
  xpc_dictionary_set_value(v2, "paths", a1);
  xpc_object_t object = 0LL;
  int64_t v4 = _xpc_domain_routine(800LL, v2, &object);
  xpc_release(v2);
  if (object) {
    xpc_release(object);
  }
  return v4;
}

void _xpc_uncork_domain()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = (os_unfair_lock_s *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  _xpc_uncork_pid_domain_locked((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 26);
}

void _xpc_uncork_pid_domain_locked(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 108) && !*(_BYTE *)(a1 + 4) && !*(_BYTE *)(a1 + 1))
  {
    if (!*(_BYTE *)(a1 + 109)) {
      _xpc_init_pid_domain((_BYTE *)a1);
    }
    *(_BYTE *)(a1 + 108) = 1;
    if ((_xpc_services_unavailable() & 1) == 0)
    {
      xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
      if (xpc_array_get_count(*(xpc_object_t *)(a1 + 112)))
      {
        size_t v3 = 0LL;
        uint64_t v4 = MEMORY[0x1895FED80];
        do
        {
          xpc_object_t value = xpc_array_get_value(*(xpc_object_t *)(a1 + 112), v3);
          applier[0] = v4;
          applier[1] = 0x40000000LL;
          applier[2] = ___xpc_uncork_pid_domain_locked_block_invoke;
          applier[3] = &__block_descriptor_tmp_55_0;
          applier[4] = v2;
          xpc_dictionary_apply(value, applier);
          ++v3;
        }

        while (v3 < xpc_array_get_count(*(xpc_object_t *)(a1 + 112)));
      }

      if (xpc_dictionary_get_count(v2)) {
        _xpc_bootstrap_services(v2);
      }
      xpc_release(v2);
      xpc_release(*(xpc_object_t *)(a1 + 112));
      *(void *)(a1 + 112) = 0LL;
      xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v6, "type", 5uLL);
      pid_t v7 = getpid();
      xpc_dictionary_set_uint64(v6, "handle", v7);
      xpc_object_t object = 0LL;
      _xpc_domain_routine(803LL, v6, &object);
      if (object) {
        xpc_release(object);
      }
      xpc_release(v6);
    }
  }

BOOL xpc_is_xpcservice()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if (!*(_BYTE *)(v0 + 3)) {
    return 0LL;
  }
  if (*(void *)(v0 + 144) != -1LL) {
    dispatch_once_f((dispatch_once_t *)(v0 + 144), 0LL, (dispatch_function_t)_fetch_xpcservice_info);
  }
  return *(void *)(v0 + 160) != 0LL;
}

void _fetch_xpcservice_info()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v1, "type", 6uLL);
  xpc_dictionary_set_BOOL(v1, "self", 1);
  xpc_object_t xdict = 0LL;
  if (_xpc_service_routine(718LL, v1, &xdict))
  {
    _os_assumes_log();
  }

  else
  {
    string = xpc_dictionary_get_string(xdict, "identifier");
    if (string) {
      string = _xpc_strdup(string);
    }
    *(void *)(v0 + 160) = string;
    xpc_object_t value = xpc_dictionary_get_value(xdict, "xpcservice-dict");
    xpc_object_t v4 = value;
    if (value) {
      xpc_retain(value);
    }
    *(void *)(v0 + 152) = v4;
    xpc_release(xdict);
  }

  xpc_release(v1);
}

_xpc_connection_s *xpc_connection_create_bs_service_listener(const char *a1)
{
  service_listener = (_xpc_connection_s *)_xpc_connection_create_service_listener(a1);
  _xpc_register_service_listener_with_handler(service_listener, 0LL, a1 == 0LL, 1);
  return service_listener;
}

uint64_t _xpc_connection_create_service_listener(const char *a1)
{
  uint64_t v46 = *MEMORY[0x1895FEE08];
  xpc_object_t v2 = _xpc_copy_xpcservice_dictionary();
  if (!v2 || (size_t v3 = v2, xpc_get_type(v2) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)) {
    _xpc_connection_create_service_listener_cold_1();
  }
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v4 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v4 = _os_alloc_once();
  }
  if (*(void *)(v4 + 144) != -1LL) {
    dispatch_once_f((dispatch_once_t *)(v4 + 144), 0LL, (dispatch_function_t)_fetch_xpcservice_info);
  }
  uint64_t v5 = *(const char **)(v4 + 160);
  if (!v5) {
    _xpc_connection_create_service_listener_cold_2();
  }
  xpc_object_t v6 = _xpc_strdup(v5);
  if (!v6) {
    _xpc_connection_create_service_listener_cold_3();
  }
  pid_t v7 = v6;
  if (a1)
  {
    xpc_object_t value = xpc_dictionary_get_value(v3, "_AdditionalSubServices");
    if (!value || (int v9 = value, xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)) {
      _xpc_connection_create_service_listener_cold_4();
    }
    int v10 = (__objc2_class **)xpc_dictionary_get_value(v9, a1);
    if (!v10 || (__int128 v11 = v10, xpc_get_type(v10) != (xpc_type_t)&OBJC_CLASS___OS_xpc_BOOL)) {
      _xpc_connection_create_service_listener_cold_5();
    }
    if (v11 == &_xpc_BOOL_false) {
      _xpc_connection_create_service_listener_cold_6();
    }
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    *(_OWORD *)__str = 0u;
    __int128 v15 = 0u;
    snprintf(__str, 0x200uLL, "%s.%s", v7, a1);
    xpc_object_t v6 = __str;
  }

  uint64_t internal_listener = _xpc_connection_create_internal_listener(v6);
  xpc_release(v3);
  free(v7);
  return internal_listener;
}

void _xpc_register_service_listener_with_handler(xpc_connection_t connection, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = MEMORY[0x1895FED80];
  if (a2)
  {
    handler[0] = MEMORY[0x1895FED80];
    handler[1] = 0x40000000LL;
    handler[2] = ___xpc_register_service_listener_with_handler_block_invoke;
    handler[3] = &__block_descriptor_tmp_71;
    handler[4] = connection;
    void handler[5] = a2;
    xpc_connection_set_event_handler(connection, handler);
  }

  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v8 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v8 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if (a4 && (*(_BYTE *)(v8 + 136) & 1) != 0)
  {
    int v10 = _xpc_asprintf("must be called before _xpc_start_listeners");
    _xpc_api_misuse(v10);
  }

  if (a3)
  {
    if (*(void *)(v8 + 120)) {
      _xpc_register_service_listener_with_handler_cold_1();
    }
    *(void *)(v8 + 120) = xpc_retain(connection);
    if ((a4 & 1) != 0) {
      goto LABEL_15;
    }
LABEL_14:
    block[0] = v7;
    block[1] = 0x40000000LL;
    block[2] = ___xpc_register_service_listener_with_handler_block_invoke_2;
    block[3] = &__block_descriptor_tmp_74;
    block[4] = connection;
    dispatch_async(MEMORY[0x1895FE800], block);
    goto LABEL_15;
  }

  xpc_object_t empty = *(xpc_object_t *)(v8 + 128);
  if (!empty)
  {
    xpc_object_t empty = xpc_array_create_empty();
    *(void *)(v8 + 128) = empty;
  }

  xpc_array_append_value(empty, connection);
  if ((a4 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
}

void xpc_bs_main()
{
}

void _xpc_main()
{
  xpc_object_t v0 = _xpc_copy_xpcservice_dictionary();
  xpc_object_t v1 = v0;
  if (!v0 || xpc_get_type(v0) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    _xpc_start_listeners();
    _xpc_objc_main(v1);
  }

  qword_18C50BCD8 = (uint64_t)"Configuration error: XPCService is not a dictionary.";
  __break(1u);
}

void xpc_handle_service(char *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    __int128 v14 = _xpc_asprintf("The evaluator doesn't do anything. Pass NULL.");
    _xpc_api_misuse(v14);
  }

  main = (void *)xpc_bundle_create_main();
  info_xpc_object_t dictionary = (void *)xpc_bundle_get_info_dictionary((uint64_t)main);
  if (!info_dictionary) {
    xpc_handle_service_cold_1();
  }
  xpc_object_t value = xpc_dictionary_get_value(info_dictionary, "XPCService");
  if (!value || (uint64_t v8 = value, xpc_get_type(value) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)) {
    xpc_handle_service_cold_2();
  }
  xpc_object_t v9 = xpc_dictionary_get_value(v8, "_AdditionalServices");
  if (!v9 || (int v10 = v9, xpc_get_type(v9) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)) {
    xpc_handle_service_cold_3();
  }
  __int128 v11 = (__objc2_class **)xpc_dictionary_get_value(v10, a1);
  if (!v11 || (__int128 v12 = v11, xpc_get_type(v11) != (xpc_type_t)&OBJC_CLASS___OS_xpc_BOOL)) {
    xpc_handle_service_cold_4();
  }
  if (v12 == &_xpc_BOOL_false) {
    xpc_handle_service_cold_5();
  }
  uint64_t internal_listener = (_xpc_connection_s *)_xpc_connection_create_internal_listener(a1);
  _xpc_register_service_listener_with_handler(internal_listener, a2, 0, 0);
  xpc_release(internal_listener);
  xpc_release(main);
}

void xpc_handle_subservice(const char *a1, uint64_t a2)
{
  service_listener = (_xpc_connection_s *)_xpc_connection_create_service_listener(a1);
  _xpc_register_service_listener_with_handler(service_listener, a2, 0, 0);
  xpc_release(service_listener);
}

void xpc_main(xpc_connection_handler_t handler)
{
  service_listener = (_xpc_connection_s *)_xpc_connection_create_service_listener(0LL);
  _xpc_register_service_listener_with_handler(service_listener, (uint64_t)handler, 1, 1);
  xpc_release(service_listener);
  _xpc_main();
}

mach_port_context_t _xpc_create_bootstrap_pipe()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  _xpc_mach_port_retain_send(*(_DWORD *)(v0 + 16));
  mach_port_context_t result = xpc_pipe_create_from_port(*(_DWORD *)(v0 + 16), 4);
  *(void *)(v0 + 24) = result;
  if (!result) {
    _xpc_create_bootstrap_pipe_cold_1();
  }
  return result;
}

void _xpc_collect_environment()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v1 = "HOME";
  uint64_t v2 = 1u;
  do
  {
    size_t v3 = getenv(v1);
    if (v3) {
      xpc_dictionary_set_string(v0, v1, v3);
    }
    xpc_object_t v1 = _xpc_interesting_envvars[v2++];
  }

  while (v2 != 8);
  uint64_t v4 = _NSGetEnviron();
  uint64_t v5 = **v4;
  if (v5)
  {
    xpc_object_t v6 = (const char **)(*v4 + 1);
    do
    {
      _xpc_envdict_putenv(v0, v5);
      uint64_t v7 = *v6++;
      uint64_t v5 = v7;
    }

    while (v7);
  }

  _environment = (uint64_t)xpc_retain(v0);
  xpc_release(v0);
}

uint64_t _xpc_collect_images()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  xpc_object_t v1 = (void *)_xpc_copy_own_bundle();
  uint64_t v2 = xpc_bundle_copy_services((uint64_t)v1);
  if (v2)
  {
    size_t v3 = v2;
    size_t count = xpc_array_get_count(v2);
    xpc_release(v3);
    if (count)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      path = (const char *)xpc_bundle_get_path((uint64_t)v1);
      xpc_dictionary_set_uint64(empty, path, 2uLL);
      xpc_array_set_value(*(xpc_object_t *)(v0 + 112), 0xFFFFFFFFFFFFFFFFLL, empty);
      xpc_release(empty);
    }
  }

  xpc_release(v1);
  return _xpc_ktrace_pid0();
}

void _xpc_early_init(int a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if (!a1) {
    _xpc_init_pid_domain((_BYTE *)v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
}

void _xpc_dyld_image_callback(unsigned int a1, void *a2, const char **a3)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v6 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v6 = _os_alloc_once();
  }
  uint64_t v21 = v6;
  if (*(_BYTE *)(v6 + 137))
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }

  else
  {
    xpc_object_t v8 = (xpc_object_t)_initial_images;
    if (!_initial_images)
    {
      xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
      _initial_images = (uint64_t)v8;
    }

    xpc_object_t v7 = xpc_retain(v8);
  }

  xpc_object_t xdict = v7;
  xpc_object_t v9 = getenv("DYLD_IMAGE_SUFFIX");
  int v10 = v9;
  if (v9 && !_xpc_equal_strings(v9, "_asan"))
  {
    unint64_t v11 = 0LL;
    do
    {
      unint64_t v12 = v11;
      if (v11 == 3) {
        break;
      }
      BOOL v13 = _xpc_equal_strings(v10, off_18962A1A8[v11 + 1]);
      unint64_t v11 = v12 + 1;
    }

    while (!v13);
    if (v12 >= 3) {
      int v10 = 0LL;
    }
  }

  if (_xpc_dyld_image_callback_pred == -1)
  {
    if (!a1) {
      goto LABEL_37;
    }
  }

  else
  {
    dispatch_once(&_xpc_dyld_image_callback_pred, &__block_literal_global_3);
    if (!a1) {
      goto LABEL_37;
    }
  }

  int v14 = 0;
  uint64_t v15 = a1;
  do
  {
    if (*a2 != _xpc_dyld_image_callback_executableMH)
    {
      __int128 v16 = *a3;
      if (!_xpc_has_prefix(*a3, "/usr/lib")
        && !_xpc_has_prefix(v16, "/usr/local/lib")
        && !_xpc_has_suffix(v16, ".dylib"))
      {
        __int128 v17 = *a3;
        if (v10 && _xpc_has_suffix(*a3, v10))
        {
          __int128 v18 = _xpc_strdup(v17);
          size_t v19 = strlen(v17);
          v18[v19 - strlen(v10)] = 0;
          __int128 v17 = v18;
        }

        else
        {
          __int128 v18 = 0LL;
        }

        xpc_dictionary_set_uint64(xdict, v17, 2uLL);
        ++v14;
        free(v18);
      }
    }

    ++a2;
    ++a3;
    --v15;
  }

  while (v15);
  if (v14 && (_xpc_services_unavailable() & 1) == 0 && *(_BYTE *)(v21 + 137))
  {
    if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
      uint64_t v20 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
    }
    else {
      uint64_t v20 = _os_alloc_once();
    }
    os_unfair_lock_lock_with_options();
    if (*(_BYTE *)(v20 + 108)) {
      _xpc_bootstrap_services(xdict);
    }
    else {
      xpc_array_set_value(*(xpc_object_t *)(v20 + 112), 0xFFFFFFFFFFFFFFFFLL, xdict);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 104));
  }

LABEL_37:
  xpc_release(xdict);
}

uint64_t ___xpc_dyld_image_callback_block_invoke()
{
  uint64_t result = _dyld_get_prog_image_header();
  _xpc_dyld_image_callback_executableMH = result;
  return result;
}

uint64_t _xpc_copy_own_bundle()
{
  uint64_t v3 = *MEMORY[0x1895FEE08];
  bzero(buf, 0x400uLL);
  bufsize_t size = 1024;
  if (_NSGetExecutablePath(buf, &bufsize) || !bufsize) {
    _xpc_rich_error_serialize_cold_1();
  }
  return xpc_bundle_create(buf, 2u);
}

_BYTE *_xpc_init_pid_domain(_BYTE *result)
{
  if (!result[109])
  {
    uint64_t v1 = (uint64_t)result;
    if (!result[4] && !result[1])
    {
      result[109] = 1;
      _xpc_ktrace_pid0();
      xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v2, "type", 5uLL);
      pid_t v3 = getpid();
      xpc_dictionary_set_uint64(v2, "handle", v3);
      _xpc_init_pid_domain_process_initial_images(v1, (void *)_initial_images, v2);
      xpc_dictionary_set_value(v2, "environment", (xpc_object_t)_environment);
      uint64_t v4 = (void *)_xpc_copy_own_bundle();
      property = xpc_bundle_get_property((uint64_t)v4, 2);
      if (property) {
        xpc_dictionary_set_string(v2, "origin", property);
      }
      xpc_release(v4);
      xpc_object_t object = 0LL;
      int v6 = _xpc_domain_routine(802LL, v2, &object);
      if (object) {
        xpc_release(object);
      }
      if (v6 == 32 && !*(_BYTE *)(v1 + 137)) {
        _xpc_init_pid_domain_cold_1();
      }
      xpc_release(v2);
      xpc_release((xpc_object_t)_initial_images);
      _initial_images = 0LL;
      xpc_release((xpc_object_t)_environment);
      _environment = 0LL;
      return (_BYTE *)_xpc_ktrace_pid0();
    }
  }

  return result;
}

uint64_t ___xpc_uncork_pid_domain_locked_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1LL;
}

xpc_object_t _xpc_copy_xpcservice_dictionary()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if (*(void *)(v0 + 144) != -1LL) {
    dispatch_once_f((dispatch_once_t *)(v0 + 144), 0LL, (dispatch_function_t)_fetch_xpcservice_info);
  }
  uint64_t v1 = *(void **)(v0 + 152);
  if (!v1)
  {
    if (!*(_BYTE *)(v0 + 3)) {
      _xpc_copy_xpcservice_dictionary_cold_1();
    }
    _xpc_copy_xpcservice_dictionary_cold_2();
  }

  return xpc_retain(v1);
}

void ___xpc_register_service_listener_with_handler_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v4 = *(void (**)(xpc_object_t))(a1 + 40);
  if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_connection)
  {
    v4(object);
  }

  else
  {
    pid_t v3 = xpc_copy_description(object);
    syslog(3, "Bogus event received by listener connection:\n%s", v3);
    free(v3);
  }

uint64_t ___xpc_register_service_listener_with_handler_block_invoke_2(uint64_t a1)
{
  return _xpc_connection_activate_internal_listener(*(_WORD **)(a1 + 32));
}

void _xpc_start_listeners()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if ((*(_BYTE *)(v0 + 136) & 1) != 0)
  {
    xpc_object_t v8 = _xpc_asprintf("_xpc_start_listeners may only be called once");
    _xpc_api_misuse(v8);
  }

  *(_BYTE *)(v0 + 136) |= 1u;
  xpc_object_t empty = xpc_array_create_empty();
  xpc_object_t v2 = *(void **)(v0 + 128);
  if (v2)
  {
    size_t count = xpc_array_get_count(*(xpc_object_t *)(v0 + 128));
    if (count)
    {
      size_t v4 = count;
      for (size_t i = 0LL; i != v4; ++i)
      {
        xpc_object_t value = xpc_array_get_value(v2, i);
        xpc_array_append_value(empty, value);
      }
    }
  }

  xpc_object_t v7 = *(void **)(v0 + 120);
  if (v7) {
    xpc_array_append_value(empty, v7);
  }
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = ___xpc_start_listeners_block_invoke;
  block[3] = &__block_descriptor_tmp_77;
  block[4] = empty;
  dispatch_async(MEMORY[0x1895FE800], block);
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 104));
}

void ___xpc_start_listeners_block_invoke(uint64_t a1)
{
  size_t count = xpc_array_get_count(*(xpc_object_t *)(a1 + 32));
  if (count)
  {
    size_t v3 = count;
    for (size_t i = 0LL; i != v3; ++i)
    {
      xpc_object_t value = xpc_array_get_value(*(xpc_object_t *)(a1 + 32), i);
      _xpc_connection_activate_internal_listener(value);
    }
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t _xpc_serializer_munmap(void *a1, size_t a2)
{
  uint64_t result = munmap(a1, a2);
  if ((_DWORD)result == -1) {
    return _xpc_fd_desc_cold_1();
  }
  return result;
}

uint64_t _xpc_serializer_copy()
{
  return 0LL;
}

uint64_t _xpc_serializer_hash()
{
  return 0LL;
}

uint64_t _xpc_serializer_desc(unint64_t *a1, uint64_t a2)
{
  return _xpc_base_desc(a1, a2);
}

size_t _xpc_serializer_debug(uint64_t a1, char *a2, size_t a3)
{
  uint64_t msg = (const void *)dispatch_mach_msg_get_msg();
  dispatch_mach_msg_get_msg();
  size_t result = 0LL;
  if (a3 >= 2)
  {
    if ((*(_BYTE *)(a1 + 156) & 4) != 0) {
      xpc_object_t v8 = "true";
    }
    else {
      xpc_object_t v8 = "false";
    }
    LODWORD(result) = snprintf( a2,  a3,  ", hdr = %p, hdr size_t size = %lu, graph = %p, graph sz = %lu, out-of-line = %s",  msg,  0LL,  *(const void **)(a1 + 32),  *(void *)(a1 + 40),  v8);
    else {
      return (int)result;
    }
  }

  return result;
}

uint64_t _xpc_serializer_deserialize()
{
  return 0LL;
}

uint64_t _xpc_serializer_wire_length()
{
  return 0LL;
}

void _xpc_serializer_dispose(uint64_t a1)
{
  xpc_object_t v2 = *(dispatch_object_s **)(a1 + 24);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 156) & 2) == 0)
    {
      uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      _xpc_mach_port_cleanup_right(msg->msgh_local_port, (msg->msgh_bits >> 8) & 0x1F);
      mach_msg_destroy(msg);
      xpc_object_t v2 = *(dispatch_object_s **)(a1 + 24);
    }

    dispatch_release(v2);
  }

  _xpc_serializer_cleanup(a1);
}

uint64_t _xpc_serializer_create()
{
  return _xpc_base_create();
}

uint64_t _xpc_serializer_create_for_description()
{
  uint64_t v0 = _xpc_base_create();
  uint64_t v1 = _xpc_alloc(0x400uLL);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = 1024LL;
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 56) = 1024LL;
  *(void *)(v0 + 64) = _xpc_serializer_free;
  *(_BYTE *)(v0 + 156) |= 8u;
  return v0;
}

uint64_t _xpc_serializer_create_for_data()
{
  int __src = 1108555586;
  int v4 = 5;
  uint64_t v0 = _xpc_base_create();
  *(void *)(v0 + 40) = 1024LL;
  uint64_t v1 = _xpc_alloc(0x400uLL);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = *(void *)(v0 + 40);
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = _xpc_serializer_free;
  *(_BYTE *)(v0 + 156) |= 0x40u;
  _xpc_serializer_append(v0, &__src, 4uLL, 0);
  _xpc_serializer_append(v0, &v4, 4uLL, 0);
  return v0;
}

uint64_t _xpc_serializer_append(uint64_t result, void *__src, size_t __n, int a4)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  if ((*(_DWORD *)(result + 16) & 5) == 1)
  {
    __int128 v16 = _xpc_asprintf("Attempt to append to a serializer created from the wire.", __src, __n);
    _xpc_api_misuse(v16);
  }

  if (__src)
  {
    uint64_t v7 = result;
    size_t v8 = (__n + 3) & 0xFFFFFFFFFFFFFFFCLL;
    if (a4) {
      size_t v9 = (__n + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    else {
      size_t v9 = __n;
    }
    size_t v10 = *(void *)(result + 56);
    if (v10 < v9)
    {
      if ((*(_BYTE *)(result + 156) & 0x48) == 0)
      {
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        *(_OWORD *)__str = 0u;
        __int128 v18 = 0u;
        size_t result = snprintf( __str,  0xA0uLL,  "full graph sz = %zu, remaining = %zu, needed = %zu",  *(void *)(result + 40),  v10,  v9);
        qword_18C50BCD8 = (uint64_t)__str;
        __break(1u);
        return result;
      }

      uint64_t v11 = *(void *)(result + 40);
      size_t v12 = v11 - v10;
      size_t v13 = ((v9 - v10 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 2 * v11;
      int v14 = (char *)_xpc_realloc(*(void **)(result + 32), v11, v13);
      *(void *)(v7 + 32) = v14;
      *(void *)(v7 + 40) = v13;
      *(void *)(v7 + 48) = &v14[v12];
      *(void *)(v7 + 56) = v13 - v12;
    }

    if (a4) {
      bzero((void *)(*(void *)(v7 + 48) + __n), v8 - __n);
    }
    size_t result = (uint64_t)memcpy(*(void **)(v7 + 48), __src, __n);
    size_t v15 = *(void *)(v7 + 56) - v9;
    *(void *)(v7 + 48) += v9;
    *(void *)(v7 + 56) = v15;
  }

  return result;
}

uint64_t _xpc_serializer_pack(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  uint64_t v37 = 8LL;
  uint64_t v38 = 0LL;
  v36[0] = a1;
  v36[1] = &v37;
  v36[2] = &v38;
  _xpc_serializer_apply(a2, (uint64_t)v36);
  size_t v8 = v37;
  if (12 * v38) {
    uint64_t v9 = 12 * v38 + 28;
  }
  else {
    uint64_t v9 = 24LL;
  }
  uint64_t v35 = 0LL;
  BOOL v11 = (a4 & 1) == 0 && (unint64_t)(v9 + v37) < 0x3FBD;
  if ((a4 & 2) != 0 || v11)
  {
    *(void *)(a1 + 24) = dispatch_mach_msg_create();
    size_t v13 = (_DWORD *)(v35 + v9);
  }

  else
  {
    uint64_t v12 = 16LL;
    if (!v38) {
      uint64_t v12 = 20LL;
    }
    *(void *)(a1 + 24) = dispatch_mach_msg_create();
    size_t v34 = v8;
    size_t v13 = _xpc_mmap_anon(&v34);
    *(void *)(a1 + 64) = _xpc_serializer_munmap;
    *(_BYTE *)(a1 + 156) |= 4u;
  }

  uint64_t v14 = v38;
  if (v38)
  {
    uint64_t v15 = v35 + 44;
    if ((*(_BYTE *)(a1 + 156) & 4) == 0) {
      uint64_t v15 = v35 + 28;
    }
    *(void *)(a1 + 72) = v15;
    *(void *)(a1 + 88) = v14;
  }

  dispatch_set_context(*(dispatch_object_t *)(a1 + 24), (void *)a1);
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v13;
  *(void *)(a1 + 56) = v8;
  if (a3 >= 4) {
    _xpc_serializer_pack_cold_1();
  }
  _DWORD *v13 = dword_180188140[a3];
  v13[1] = 5;
  *(void *)(a1 + 48) = v13 + 2;
  *(void *)(a1 + 56) = v8 - 8;
  if (a2 < 0)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = *MEMORY[0x189616658];
    if ((~a2 & 0xC000000000000007LL) == 0) {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = v17 ^ a2;
    do
    {
      if ((v18 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v16)) {
        break;
      }
      ++v16;
    }

    while (v16 != 7);
    unint64_t v19 = v16 | v18;
    uint64_t v20 = v16 & 7;
    int v21 = (v19 >> 55) + 8;
    if (v20 == 7) {
      LODWORD(v20) = v21;
    }
    if ((_DWORD)v20 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v20 != 13)
      {
        __int128 v33 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v33);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v23 = *(void *)a2;
    if (*(void *)a2 < (unint64_t)&OBJC_CLASS___OS_xpc_object
      || v23 > (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      || (v23 & 7) != 0)
    {
      extension_vtable = _xpc_get_extension_vtable((id)a2);
    }

    else
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v23 - (void)&OBJC_CLASS___OS_xpc_object));
    }
  }

  (*((void (**)(uint64_t, uint64_t))extension_vtable + 9))(a2, a1);
  uint64_t v25 = *(void *)(a1 + 88);
  uint64_t v24 = *(void *)(a1 + 96);
  if (v24 != v25) {
    _xpc_serializer_pack_cold_2(v24, v25, (void *)a2);
  }
  uint64_t msg = dispatch_mach_msg_get_msg();
  v36[0] = 0LL;
  dispatch_mach_msg_get_msg();
  int v27 = v36[0];
  unint64_t v28 = *(void *)(a1 + 88) + (((unint64_t)*(unsigned __int8 *)(a1 + 156) >> 2) & 1);
  if (xpc_get_type((xpc_object_t)a2) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    *(void *)(a1 + 128) = _xpc_dictionary_extract_importance_voucher(a2);
    int transaction = _xpc_dictionary_get_transaction(a2);
    char v30 = transaction ? 16 : 0;
    *(_BYTE *)(a1 + 156) = *(_BYTE *)(a1 + 156) & 0xEF | v30;
    if (transaction) {
      _xpc_dictionary_set_transaction(a2, 0);
    }
  }

  *(_DWORD *)uint64_t msg = (v28 != 0) << 31;
  *(_DWORD *)(msg + 4) = v27;
  *(_OWORD *)(msg + 8) = xmmword_180188240;
  if (v28)
  {
    *(_DWORD *)(msg + 24) = v28;
    if ((*(_BYTE *)(a1 + 156) & 4) != 0)
    {
      *(void *)(a1 + 64) = 0LL;
      int v31 = (*(_DWORD *)(a1 + 40) + *MEMORY[0x189600148] - 1) & -*MEMORY[0x189600148];
      *(void *)(msg + 28) = *(void *)(a1 + 32);
      *(_DWORD *)(msg + 36) = 16777473;
      *(_DWORD *)(msg + 40) = v31;
    }
  }

  *(_BYTE *)(a1 + 156) |= 1u;
  dispatch_mach_msg_get_msg();
  _xpc_ktrace_pid2();
  return dispatch_mach_msg_get_msg();
}

uint64_t _xpc_serializer_get_mach_message_header()
{
  return dispatch_mach_msg_get_msg();
}

void _xpc_serializer_clear_sent_descriptors(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    uint64_t v2 = _xpc_asprintf("Attempt to clear sent descriptors on a serializer created from the wire.");
    goto LABEL_8;
  }

  char v1 = *(_BYTE *)(a1 + 156);
  if ((v1 & 1) == 0)
  {
    uint64_t v2 = _xpc_asprintf("Attempt to clear sent descriptors on an unpacked serializer.");
LABEL_8:
    _xpc_api_misuse(v2);
  }

  if ((*(_BYTE *)(a1 + 156) & 4) != 0) {
    *(void *)(a1 + 64) = 0LL;
  }
  *(_BYTE *)(a1 + 156) = v1 | 2;
  _xpc_serializer_cleanup(a1);
}

void _xpc_serializer_cleanup(uint64_t a1)
{
  uint64_t v2 = *(void (**)(void, void))(a1 + 64);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 156) & 0x4C) == 0) {
      _xpc_serializer_cleanup_cold_1();
    }
    v2(*(void *)(a1 + 32), *(void *)(a1 + 40));
    *(void *)(a1 + 64) = 0LL;
  }

  size_t v3 = *(void **)(a1 + 80);
  if (v3)
  {
    unint64_t v4 = *(void *)(a1 + 88);
    if (v4)
    {
      for (unint64_t i = 0LL; i < v4; ++i)
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8 * i);
        if (v6)
        {
          _xpc_release(v6);
          unint64_t v4 = *(void *)(a1 + 88);
        }
      }

      size_t v3 = *(void **)(a1 + 80);
    }

    free(v3);
    *(void *)(a1 + 80) = 0LL;
  }

  uint64_t v7 = *(void **)(a1 + 128);
  if (v7)
  {
    os_release(v7);
    *(void *)(a1 + 128) = 0LL;
  }

  if ((*(_BYTE *)(a1 + 156) & 0x10) != 0)
  {
    _xpc_transaction_end();
    *(_BYTE *)(a1 + 156) &= ~0x10u;
  }

uint64_t _xpc_serializer_reap_combined_send_receive(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 156) & 2) == 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (*(void *)(a1 + 64)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(a1 + 24) = 0LL;
  return v1;
}

void _xpc_serializer_destroy(_DWORD *a1)
{
  if (a1[3] != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  xpc_release(a1);
}

uint64_t _xpc_serializer_append_port(void *a1, void *a2, size_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t result = _xpc_serializer_append((uint64_t)a1, a2, a3, 1);
  if ((a6 - 16) >= 3)
  {
    if (a6 != 19) {
      _xpc_serializer_append_port_cold_1();
    }
    if (!a1[10])
    {
      unint64_t v11 = a1[11];
      if (v11 >> 61)
      {
        __break(1u);
        return result;
      }

      a1[10] = _xpc_alloc(8 * v11);
    }

    uint64_t result = _xpc_retain(a4);
    *(void *)(a1[10] + 8LL * a1[12]) = result;
  }

  unint64_t v12 = a1[12];
  if (v12 >= a1[11]) {
    _xpc_serializer_append_port_cold_2();
  }
  uint64_t v13 = a1[9];
  a1[12] = v12 + 1;
  uint64_t v14 = (_DWORD *)(v13 + 12 * v12);
  *uint64_t v14 = a5;
  v14[1] = 0;
  v14[2] = a6 << 16;
  return result;
}

uint64_t _xpc_serializer_pad(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 112) + 1LL;
  *(void *)(a1 + 112) = v1;
  return v1;
}

uint64_t _xpc_serializer_unpad(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 112) - 1LL;
  *(void *)(a1 + 112) = v1;
  return v1;
}

uint64_t _xpc_serializer_get_graph_ptr(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) + a2;
}

uint64_t _xpc_serializer_get_graph_length(uint64_t a1)
{
  return *(void *)(a1 + 48) - *(void *)(a1 + 32);
}

uint64_t _xpc_serializer_get_mach_message_length()
{
  return 0LL;
}

uint64_t _xpc_serializer_reset_mach_message_header(uint64_t a1)
{
  uint64_t result = dispatch_mach_msg_create();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t _xpc_connection_reply_callout(uint64_t a1)
{
  return _os_avoid_tail_call();
}

unsigned int *_xpc_serializer_apply(uint64_t object, uint64_t a2)
{
  unint64_t v4 = *(void **)(a2 + 8);
  if (object < 0)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = *MEMORY[0x189616658];
    if ((~object & 0xC000000000000007LL) == 0) {
      uint64_t v6 = 0LL;
    }
    unint64_t v7 = v6 ^ object;
    do
    {
      if ((v7 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v5)) {
        break;
      }
      ++v5;
    }

    while (v5 != 7);
    unint64_t v8 = v5 | v7;
    uint64_t v9 = v5 & 7;
    int v10 = ((v8 >> 55) & 0xFE) + 8;
    if (v9 == 7) {
      LOWORD(v9) = v10;
    }
    uint64_t v11 = v9 & 0x1FE;
    if (v11 != 12) {
      _xpc_serializer_apply_cold_1();
    }
  }

  else
  {
    unint64_t v12 = *(unsigned int *)(object + 16);
    *v4 += *(unsigned int *)(object + 20) + 4LL;
    unint64_t v4 = *(void **)(a2 + 16);
    uint64_t v11 = (v12 >> 1) & 1;
  }

  *v4 += v11;
  if (xpc_get_type((xpc_object_t)object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_array) {
    return (unsigned int *)xpc_array_apply_f( object,  a2,  (uint64_t (*)(unint64_t, void, uint64_t))_xpc_serializer_array_apply);
  }
  uint64_t result = (unsigned int *)xpc_get_type((xpc_object_t)object);
  return result;
}

uint64_t _xpc_serializer_array_apply(int a1, xpc_object_t object)
{
  return _xpc_serializer_apply(object);
}

uint64_t _xpc_serializer_dictionary_apply(const char *a1, void *a2, uint64_t a3)
{
  **(void **)(a3 + 8) += (strlen(a1) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  return _xpc_serializer_apply(a2);
}

BOOL _xpc_mach_send_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t _xpc_mach_send_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_mach_send_desc(unsigned int *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  int v11 = 0;
  unint64_t v4 = (unsigned int *)MEMORY[0x1895FFD48];
  int v5 = MEMORY[0x186DF6E54](*MEMORY[0x1895FFD48], a1[6], 0LL, &v11);
  if (v5)
  {
    if (v5 == 15)
    {
      unint64_t v7 = "(none)";
    }

    else if (v5 == 17)
    {
      int v6 = MEMORY[0x186DF6E54](*v4, a1[6], 4LL, &v11);
      unint64_t v7 = "(invalid)";
      if (!v6) {
        unint64_t v7 = "dead-name";
      }
    }

    else
    {
      unint64_t v7 = "(invalid)";
    }
  }

  else
  {
    unint64_t v7 = "send";
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v13 = 0u;
  unsigned int v8 = snprintf(__str, 0x80uLL, "<%s: %p> { name = %u, right = %s, urefs = %u }", "mach send right", a1, a1[6], v7, v11);
  if (v8 >= 0x7F) {
    int v9 = 127;
  }
  else {
    int v9 = v8;
  }
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_mach_send_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", port = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_mach_send_serialize(uint64_t a1, void *a2)
{
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 == -2)
  {
    unint64_t v4 = _xpc_asprintf("Cannot serialize an xpc_mach_send object and use _xpc_mach_send_extract_right at the same time");
    _xpc_api_misuse(v4);
  }

  int v5 = 53248;
  return _xpc_serializer_append_port(a2, &v5, 4uLL, a1, v2, 19);
}

uint64_t _xpc_mach_send_deserialize(uint64_t *a1)
{
  int v4 = 0;
  int v1 = v4;
  uint64_t result = _xpc_base_create();
  int v3 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) = v3 | 3;
  return result;
}

uint64_t _xpc_mach_send_wire_length()
{
  return -1LL;
}

uint64_t _xpc_mach_send_dispose(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 24);
  do
    uint64_t result = __ldxr(v1);
  while (__stxr(0xFFFFFFFF, v1));
  if ((result - 1) <= 0xFFFFFFFC)
  {
    uint64_t result = _xpc_mach_port_release(result);
    if ((_DWORD)result) {
      return _os_assumes_log();
    }
  }

  return result;
}

uint64_t xpc_mach_send_create(mach_port_name_t a1)
{
  return xpc_mach_send_create_with_disposition(a1, 19);
}

uint64_t xpc_mach_send_create_with_disposition(mach_port_name_t name, int a2)
{
  mach_port_name_t v2 = name;
  if (name - 1 > 0xFFFFFFFD || a2 == 17) {
    goto LABEL_13;
  }
  if (a2 == 19)
  {
    int send = _xpc_mach_port_retain_send(name);
    if (!send) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }

  if (a2 != 20)
  {
    int v6 = _xpc_asprintf("Invalid disposition");
    _xpc_api_misuse(v6);
  }

  int send = _xpc_mach_port_make_send(name);
  if (send)
  {
LABEL_10:
    if (send != 17) {
      _os_assumes_log();
    }
    mach_port_name_t v2 = -1;
  }

uint64_t xpc_mach_send_get_right(unsigned int *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send) {
    return 0LL;
  }
  uint64_t result = a1[6];
  if ((_DWORD)result == -2)
  {
    int v3 = _xpc_asprintf("Cannot use xpc_mach_send_get_right and _xpc_mach_send_extract_right at the same time");
    _xpc_api_misuse(v3);
  }

  return result;
}

uint64_t _xpc_mach_send_extract_right(unsigned int *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_send) {
    return 0LL;
  }
  int v3 = a1 + 6;
  do
    uint64_t result = __ldxr(v3);
  while (__stxr(0xFFFFFFFE, v3));
  if ((_DWORD)result == -2)
  {
    int v4 = _xpc_asprintf("Cannot call _xpc_mach_send_extract_right twice");
    _xpc_api_misuse(v4);
  }

  return result;
}

uint64_t xpc_mach_send_copy_right(unsigned int *a1)
{
  uint64_t right = xpc_mach_send_get_right(a1);
  uint64_t v2 = right;
  if ((right - 1) <= 0xFFFFFFFD)
  {
    int v3 = _xpc_mach_port_retain_send(right);
    if (v3 <= 16)
    {
      if (!v3) {
        return v2;
      }
      if (v3 == 15) {
        xpc_mach_send_copy_right_cold_1();
      }
    }

    else
    {
      if (v3 == 17) {
        return 0LL;
      }
      if (v3 == 19)
      {
        _os_assumes_log();
        return v2;
      }
    }

    _os_assumes_log();
    return 0LL;
  }

  return v2;
}

xpc_object_t xpc_create_reply_with_format( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _create_with_format_and_arguments(a1, a2, (uint64_t)&a9);
}

xpc_object_t _create_with_format_and_arguments(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v46 = a3;
  int v5 = _xpc_strdup(a2);
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2000000000LL;
  uint64_t v41 = 0LL;
  __int128 v42 = &v41;
  uint64_t v43 = 0x2000000000LL;
  uint64_t v44 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2000000000LL;
  char v40 = 0;
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x2000000000LL;
  int v38 = 0;
  v45[3] = v46;
  v36[0] = MEMORY[0x1895FED80];
  v36[1] = 0x40000000LL;
  v36[2] = ___create_with_format_and_arguments_block_invoke;
  void v36[3] = &unk_18962A250;
  v36[4] = &v41;
  v36[5] = a2;
  v35[0] = MEMORY[0x1895FED80];
  v35[1] = 0x40000000LL;
  v35[2] = ___create_with_format_and_arguments_block_invoke_2;
  v35[3] = &unk_18962A278;
  v35[6] = a2;
  v35[7] = v5;
  v35[5] = &v41;
  v35[4] = v36;
  __int128 v33 = a2;
  v34[0] = MEMORY[0x1895FED80];
  v34[1] = 0x40000000LL;
  v34[2] = ___create_with_format_and_arguments_block_invoke_3;
  v34[3] = &unk_18962A2A0;
  v34[6] = v5;
  v34[7] = a2;
  v34[5] = &v41;
  v34[4] = v36;
  v27[0] = MEMORY[0x1895FED80];
  v27[1] = 0x40000000LL;
  unint64_t v28 = ___create_with_format_and_arguments_block_invoke_4;
  __int128 v29 = &unk_18962A2C8;
  char v30 = v35;
  int v31 = v34;
  __int128 v32 = &v41;
  uint64_t v21 = 0LL;
  __int128 v22 = &v21;
  uint64_t v23 = 0x3002000000LL;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x3002000000LL;
  __int128 v18 = __Block_byref_object_copy_;
  __int128 v19 = __Block_byref_object_dispose_;
  v14[0] = MEMORY[0x1895FED80];
  v14[1] = 0x40000000LL;
  v14[2] = ___create_with_format_and_arguments_block_invoke_8;
  void v14[3] = &unk_18962A480;
  v14[8] = &v21;
  v14[9] = &v15;
  uint8_t v14[4] = v34;
  v14[5] = v36;
  v14[10] = v45;
  v14[11] = v37;
  v14[12] = v39;
  v14[13] = a2;
  v14[6] = v27;
  v14[7] = &v41;
  v13[0] = MEMORY[0x1895FED80];
  v13[1] = 0x40000000LL;
  v13[2] = ___create_with_format_and_arguments_block_invoke_12;
  v13[3] = &unk_18962A4A8;
  v13[6] = &v41;
  v13[7] = a2;
  _OWORD v13[4] = v36;
  v13[5] = v14;
  __int128 v26 = v13;
  v12[0] = MEMORY[0x1895FED80];
  v12[1] = 0x40000000LL;
  v12[2] = ___create_with_format_and_arguments_block_invoke_13;
  v12[3] = &unk_18962A4D0;
  v12[4] = v27;
  v12[5] = v36;
  v12[11] = v39;
  v12[12] = a2;
  v12[8] = &v21;
  v12[9] = &v15;
  v12[6] = v34;
  v12[7] = &v41;
  v12[10] = v45;
  v11[0] = MEMORY[0x1895FED80];
  v11[1] = 0x40000000LL;
  v11[2] = ___create_with_format_and_arguments_block_invoke_14;
  void v11[3] = &unk_18962A4F8;
  void v11[6] = &v41;
  v11[7] = a2;
  _BYTE v11[4] = v36;
  v11[5] = v12;
  uint64_t v20 = v11;
  ___create_with_format_and_arguments_block_invoke((uint64_t)v36, 0);
  if (a2[v42[3]] == 123)
  {
    if (a1) {
      xpc_object_t reply = xpc_dictionary_create_reply(a1);
    }
    else {
      xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    xpc_object_t v7 = reply;
    (*(void (**)(void))(v16[5] + 16))();
  }

  else
  {
    if (a1)
    {
      int v10 = _xpc_asprintf("Reply format must specify a dictionary!");
      _xpc_api_misuse(v10);
    }

    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    if (a2[v42[3]] != 91)
    {
      unsigned int v8 = (const char *)v28(v27);
      xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, v8);
    }

    (*(void (**)(void))(v22[5] + 16))();
  }

  free(v5);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);
  return v7;
}

xpc_object_t xpc_create_with_format( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _create_with_format_and_arguments(0LL, a1, (uint64_t)&a9);
}

xpc_object_t xpc_create_with_format_and_arguments(const char *a1, uint64_t a2)
{
  return _create_with_format_and_arguments(0LL, a1, a2);
}

uint64_t ___create_with_format_and_arguments_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v4 = *(void *)(v3 + 24);
    *(void *)(v3 + 24) = v4 + 1;
  }

  uint64_t v5 = MEMORY[0x1895FED88];
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = *(void *)(v6 + 24);
    unsigned int v8 = *(char *)(*(void *)(a1 + 40) + v7);
    if ((v8 & 0x80000000) != 0) {
      break;
    }
    uint64_t result = *(_DWORD *)(v5 + 4LL * v8 + 60) & 0x4000;
    if (!(_DWORD)result) {
      return result;
    }
LABEL_9:
    *(void *)(v6 + 24) = v7 + 1;
  }

  uint64_t result = __maskrune(v8, 0x4000uLL);
  if ((_DWORD)result) {
    goto LABEL_9;
  }
  return result;
}

uint64_t ___create_with_format_and_arguments_block_invoke_2(void *a1, unsigned __int8 a2)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  uint64_t v9 = *(void *)(v6 + 24);
  unsigned int v8 = (void *)(v6 + 24);
  uint64_t v7 = v9;
  int v10 = *(unsigned __int8 *)(v2 + v9);
  if (!*(_BYTE *)(v2 + v9) || v10 == a2)
  {
    uint64_t v11 = v7;
  }

  else
  {
    uint64_t v11 = v7;
    do
    {
      *unsigned int v8 = v11 + 1;
      uint64_t v12 = *(void *)(a1[5] + 8LL);
      uint64_t v13 = *(void *)(v12 + 24);
      unsigned int v8 = (void *)(v12 + 24);
      uint64_t v11 = v13;
      int v14 = *(unsigned __int8 *)(v2 + v13);
    }

    while (*(_BYTE *)(v2 + v13) && v14 != a2);
  }

  uint64_t v15 = v5 + v7;
  *(_BYTE *)(v5 + v11) = 0;
  (*(void (**)(void))(a1[4] + 16LL))();
  return v15;
}

uint64_t ___create_with_format_and_arguments_block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
  uint64_t v4 = MEMORY[0x1895FED88];
  for (uint64_t i = v3; ; uint64_t i = *(void *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    uint64_t v6 = a1[7];
    unsigned int v7 = *(char *)(v6 + i);
    if ((v7 & 0x80000000) != 0)
    {
    }

    else if ((*(_DWORD *)(v4 + 4LL * v7 + 60) & 0x500) != 0)
    {
      goto LABEL_8;
    }

    if (!v7 || !memchr("!-_;./?", v7, 8uLL)) {
      break;
    }
LABEL_8:
    ++*(void *)(*(void *)(a1[5] + 8LL) + 24LL);
  }

  *(_BYTE *)(a1[6] + *(void *)(*(void *)(a1[5] + 8LL) + 24LL)) = 0;
  (*(void (**)(void))(a1[4] + 16LL))();
  return v2 + v3;
}

uint64_t ___create_with_format_and_arguments_block_invoke_4(void *a1)
{
  if (v2) {
    return (*(uint64_t (**)(void, void))(a1[4] + 16LL))(a1[4], *v2);
  }
  else {
    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void *___create_with_format_and_arguments_block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v5 = *(void *)(v4 + 24);
  int v6 = *(unsigned __int8 *)(*(void *)(a1 + 104) + v5);
  switch(v6)
  {
    case '%':
      *(void *)(v4 + 24) = v5 + 1;
      unsigned int v8 = (const char *)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
      size_t v9 = strlen(v8);
      if (!v9) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      int v10 = v9;
      uint64_t v11 = memchr( "*+",  *(char *)(*(void *)(a1 + 104) + *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)),  3uLL);
      if (v11) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
      uint64_t v12 = xpc_format_specifiers_lookup(v8, v10);
      if (!v12)
      {
        uint64_t v21 = _xpc_asprintf("Invalid format specifier!");
        goto LABEL_42;
      }

      switch(v12[2])
      {
        case 1u:
          BOOL v13 = v12[1] == 1;
          v39[0] = MEMORY[0x1895FED80];
          v39[1] = 0x40000000LL;
          v39[2] = ___create_with_format_and_arguments_block_invoke_2_12;
          void v39[3] = &unk_18962A2F0;
          v39[4] = *(void *)(a1 + 80);
          uint64_t v41 = a2;
          BOOL v42 = v13;
          __int128 v40 = *(_OWORD *)(a1 + 88);
          uint64_t v14 = v40;
          uint64_t v15 = v39;
          goto LABEL_30;
        case 2u:
          if (v11)
          {
            uint64_t v21 = _xpc_asprintf("Invalid rest suffix for 'BOOL' format specifier!");
            goto LABEL_42;
          }

          v38[0] = MEMORY[0x1895FED80];
          v38[1] = 0x40000000LL;
          v38[2] = ___create_with_format_and_arguments_block_invoke_3_16;
          v38[3] = &unk_18962A318;
          uint64_t v14 = *(void *)(a1 + 88);
          v38[4] = *(void *)(a1 + 80);
          v38[5] = v14;
          v38[6] = a2;
          uint64_t v15 = v38;
          goto LABEL_30;
        case 3u:
          v35[0] = MEMORY[0x1895FED80];
          v35[1] = 0x40000000LL;
          v35[2] = ___create_with_format_and_arguments_block_invoke_4_18;
          v35[3] = &unk_18962A340;
          v35[4] = *(void *)(a1 + 80);
          uint64_t v37 = a2;
          __int128 v36 = *(_OWORD *)(a1 + 88);
          uint64_t v14 = v36;
          uint64_t v15 = v35;
          goto LABEL_30;
        case 4u:
          if (v11)
          {
            uint64_t v21 = _xpc_asprintf("Invalid rest suffix for 'date' format specifier!");
            goto LABEL_42;
          }

          v34[0] = MEMORY[0x1895FED80];
          v34[1] = 0x40000000LL;
          v34[2] = ___create_with_format_and_arguments_block_invoke_5;
          v34[3] = &unk_18962A368;
          uint64_t v14 = *(void *)(a1 + 88);
          v34[4] = *(void *)(a1 + 80);
          v34[5] = v14;
          v34[6] = a2;
          uint64_t v15 = v34;
          goto LABEL_30;
        case 5u:
          if (v11)
          {
            uint64_t v21 = _xpc_asprintf("Invalid rest suffix for 'double' format specifier!");
            goto LABEL_42;
          }

          v33[0] = MEMORY[0x1895FED80];
          v33[1] = 0x40000000LL;
          v33[2] = ___create_with_format_and_arguments_block_invoke_6;
          v33[3] = &unk_18962A390;
          uint64_t v14 = *(void *)(a1 + 88);
          v33[4] = *(void *)(a1 + 80);
          v33[5] = v14;
          v33[6] = a2;
          uint64_t v15 = v33;
          goto LABEL_30;
        case 6u:
          if (v11)
          {
            uint64_t v21 = _xpc_asprintf("Invalid rest suffix for 'fd' format specifier!");
            goto LABEL_42;
          }

          v32[0] = MEMORY[0x1895FED80];
          v32[1] = 0x40000000LL;
          v32[2] = ___create_with_format_and_arguments_block_invoke_7;
          void v32[3] = &unk_18962A3B8;
          uint64_t v14 = *(void *)(a1 + 88);
          v32[4] = *(void *)(a1 + 80);
          v32[5] = v14;
          v32[6] = a2;
          uint64_t v15 = v32;
          goto LABEL_30;
        case 7u:
          if (v11)
          {
            uint64_t v21 = _xpc_asprintf("Invalid rest suffix for 'int{64}' format specifier!");
            goto LABEL_42;
          }

          BOOL v17 = v12[1] == 2;
          v30[0] = MEMORY[0x1895FED80];
          v30[1] = 0x40000000LL;
          v30[2] = ___create_with_format_and_arguments_block_invoke_8;
          v30[3] = &unk_18962A3E0;
          BOOL v31 = v17;
          uint64_t v14 = *(void *)(a1 + 88);
          v30[4] = *(void *)(a1 + 80);
          v30[5] = v14;
          v30[6] = a2;
          uint64_t v15 = v30;
          goto LABEL_30;
        case 8u:
          v27[0] = MEMORY[0x1895FED80];
          v27[1] = 0x40000000LL;
          void v27[2] = ___create_with_format_and_arguments_block_invoke_9;
          v27[3] = &unk_18962A408;
          v27[4] = *(void *)(a1 + 80);
          __int128 v29 = a2;
          __int128 v28 = *(_OWORD *)(a1 + 88);
          uint64_t v14 = v28;
          uint64_t v15 = v27;
          goto LABEL_30;
        case 9u:
          if (v11)
          {
            uint64_t v21 = _xpc_asprintf("Invalid rest suffix for 'uint{64}' format specifier!");
          }

          else
          {
            BOOL v18 = v12[1] == 2;
            v25[0] = MEMORY[0x1895FED80];
            v25[1] = 0x40000000LL;
            v25[2] = ___create_with_format_and_arguments_block_invoke_10;
            v25[3] = &unk_18962A430;
            BOOL v26 = v18;
            uint64_t v14 = *(void *)(a1 + 88);
            v25[4] = *(void *)(a1 + 80);
            v25[5] = v14;
            v25[6] = a2;
            uint64_t v15 = v25;
LABEL_30:
            *(_DWORD *)(*(void *)(v14 + 8) + 24LL) = 0;
            do
            {
              ((void (*)(void *))v15[2])(v15);
              if (!v11) {
                goto LABEL_34;
              }
            }

            while (!*(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL));
            if (*v11 != 43) {
              goto LABEL_35;
            }
LABEL_34:
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL)) {
              goto LABEL_35;
            }
            uint64_t v21 = _xpc_asprintf("Missing required format arg!");
          }

LABEL_42:
          _xpc_api_misuse(v21);
        case 0xAu:
          v22[0] = MEMORY[0x1895FED80];
          v22[1] = 0x40000000LL;
          v22[2] = ___create_with_format_and_arguments_block_invoke_11;
          v22[3] = &unk_18962A458;
          v22[4] = *(void *)(a1 + 80);
          uint64_t v24 = a2;
          __int128 v23 = *(_OWORD *)(a1 + 88);
          uint64_t v14 = v23;
          uint64_t v15 = v22;
          goto LABEL_30;
        default:
          uint64_t v15 = 0LL;
          uint64_t v14 = *(void *)(a1 + 88);
          goto LABEL_30;
      }

    case '{':
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_array_set_value(a2, 0xFFFFFFFFFFFFFFFFLL, v7);
      (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL) + 16LL))();
      goto LABEL_12;
    case '[':
      xpc_object_t v7 = xpc_array_create(0LL, 0LL);
      xpc_array_set_value(a2, 0xFFFFFFFFFFFFFFFFLL, v7);
      (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) + 16LL))();
LABEL_12:
      xpc_release(v7);
      goto LABEL_35;
  }

  __int128 v16 = (const char *)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  xpc_array_set_string(a2, 0xFFFFFFFFFFFFFFFFLL, v16);
LABEL_35:
  int v19 = *(char *)(*(void *)(a1 + 104) + *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
  if (v19 == 44) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  uint64_t result = memchr("])", v19, 3uLL);
  if (!result) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return result;
}

void ___create_with_format_and_arguments_block_invoke_2_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(xpc_object_t **)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  xpc_object_t v4 = *v3;
  if (*v3)
  {
    xpc_array_set_value(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, *v3);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (*(_BYTE *)(a1 + 64)) {
      xpc_release(v4);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void ___create_with_format_and_arguments_block_invoke_3_16(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(_DWORD **)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 2;
  xpc_array_set_BOOL(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3 != 0);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void ___create_with_format_and_arguments_block_invoke_4_18(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(const void ***)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  xpc_object_t v4 = *v3;
  if (*v3)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v6 = *(size_t **)(v5 + 24);
    *(void *)(v5 + 24) = v6 + 1;
    xpc_array_set_data(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, v4, *v6);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void ___create_with_format_and_arguments_block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(int64_t **)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  xpc_array_set_date(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void ___create_with_format_and_arguments_block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(double **)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  xpc_array_set_double(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void ___create_with_format_and_arguments_block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(int **)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 2;
  xpc_array_set_fd(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void ___create_with_format_and_arguments_block_invoke_8(uint64_t a1)
{
  uint64_t v2 = (int64_t **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v3 = *v2;
  if (*(_BYTE *)(a1 + 56))
  {
    ++*v2;
    int64_t v4 = *(int *)v3;
  }

  else
  {
    ++*v2;
    int64_t v4 = *v3;
  }

  xpc_array_set_int64(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v4);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void ___create_with_format_and_arguments_block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(const char ***)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  if (*v3)
  {
    xpc_array_set_string(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, *v3);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void ___create_with_format_and_arguments_block_invoke_10(uint64_t a1)
{
  uint64_t v2 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v3 = *v2;
  if (*(_BYTE *)(a1 + 56))
  {
    ++*v2;
    uint64_t v4 = *(unsigned int *)v3;
  }

  else
  {
    ++*v2;
    uint64_t v4 = *v3;
  }

  xpc_array_set_uint64(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v4);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void ___create_with_format_and_arguments_block_invoke_11(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(const unsigned __int8 ***)(v2 + 24);
  *(void *)(v2 + 24) = v3 + 1;
  if (*v3)
  {
    xpc_array_set_uuid(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, *v3);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

uint64_t ___create_with_format_and_arguments_block_invoke_12(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a1[4] + 16LL))();
}

void ___create_with_format_and_arguments_block_invoke_13(void *a1, void *a2)
{
  uint64_t v4 = (const char *)(*(uint64_t (**)(void))(a1[4] + 16LL))();
  (*(void (**)(void))(a1[5] + 16LL))();
  uint64_t v5 = *(void *)(a1[7] + 8LL);
  uint64_t v6 = *(void *)(v5 + 24);
  int v7 = *(unsigned __int8 *)(a1[12] + v6);
  switch(v7)
  {
    case '%':
      *(void *)(v5 + 24) = v6 + 1;
      size_t v9 = (const char *)(*(uint64_t (**)(void))(a1[6] + 16LL))();
      size_t v10 = strlen(v9);
      if (!v10) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      int v11 = v10;
      uint64_t v12 = (char *)memchr("*+", *(char *)(a1[12] + *(void *)(*(void *)(a1[7] + 8LL) + 24LL)), 3uLL);
      if (v12)
      {
        (*(void (**)(void, void))(a1[5] + 16LL))(a1[5], *v12);
        uint64_t v43 = _xpc_asprintf("Invalid rest suffix in dictionary element format specifier!");
      }

      else
      {
        BOOL v13 = xpc_format_specifiers_lookup(v9, v11);
        if (v13)
        {
          switch(v13[2])
          {
            case 1u:
              unsigned int v14 = v13[1];
              uint64_t v15 = *(void *)(a1[10] + 8LL);
              __int128 v16 = *(xpc_object_t **)(v15 + 24);
              *(void *)(v15 + 24) = v16 + 1;
              xpc_object_t v17 = *v16;
              if (!*v16) {
                goto LABEL_29;
              }
              xpc_dictionary_set_value(a2, v4, *v16);
              if (v14 == 1) {
                xpc_release(v17);
              }
              break;
            case 2u:
              uint64_t v19 = *(void *)(a1[10] + 8LL);
              uint64_t v20 = *(_DWORD **)(v19 + 24);
              *(void *)(v19 + 24) = v20 + 2;
              xpc_dictionary_set_BOOL(a2, v4, *v20 != 0);
              break;
            case 3u:
              uint64_t v21 = *(void *)(a1[10] + 8LL);
              __int128 v22 = *(const void ***)(v21 + 24);
              *(void *)(v21 + 24) = v22 + 1;
              __int128 v23 = *v22;
              if (!*v22) {
                goto LABEL_29;
              }
              uint64_t v24 = *(void *)(a1[10] + 8LL);
              uint64_t v25 = *(size_t **)(v24 + 24);
              *(void *)(v24 + 24) = v25 + 1;
              xpc_dictionary_set_data(a2, v4, v23, *v25);
              break;
            case 4u:
              uint64_t v26 = *(void *)(a1[10] + 8LL);
              int v27 = *(int64_t **)(v26 + 24);
              *(void *)(v26 + 24) = v27 + 1;
              xpc_dictionary_set_date(a2, v4, *v27);
              break;
            case 5u:
              uint64_t v28 = *(void *)(a1[10] + 8LL);
              __int128 v29 = *(double **)(v28 + 24);
              *(void *)(v28 + 24) = v29 + 1;
              xpc_dictionary_set_double(a2, v4, *v29);
              break;
            case 6u:
              uint64_t v30 = *(void *)(a1[10] + 8LL);
              BOOL v31 = *(int **)(v30 + 24);
              *(void *)(v30 + 24) = v31 + 2;
              xpc_dictionary_set_fd(a2, v4, *v31);
              break;
            case 7u:
              __int128 v32 = (int64_t **)(*(void *)(a1[10] + 8LL) + 24LL);
              __int128 v33 = *v32;
              if (v13[1] == 2)
              {
                ++*v32;
                int64_t v34 = *(int *)v33;
              }

              else
              {
                ++*v32;
                int64_t v34 = *v33;
              }

              xpc_dictionary_set_int64(a2, v4, v34);
              break;
            case 8u:
              uint64_t v35 = *(void *)(a1[10] + 8LL);
              __int128 v36 = *(const char ***)(v35 + 24);
              *(void *)(v35 + 24) = v36 + 1;
              if (!*v36) {
                goto LABEL_29;
              }
              xpc_dictionary_set_string(a2, v4, *v36);
              break;
            case 9u:
              uint64_t v37 = (uint64_t **)(*(void *)(a1[10] + 8LL) + 24LL);
              int v38 = *v37;
              if (v13[1] == 2)
              {
                ++*v37;
                uint64_t v39 = *(unsigned int *)v38;
              }

              else
              {
                ++*v37;
                uint64_t v39 = *v38;
              }

              xpc_dictionary_set_uint64(a2, v4, v39);
              break;
            case 0xAu:
              uint64_t v40 = *(void *)(a1[10] + 8LL);
              uint64_t v41 = *(const unsigned __int8 ***)(v40 + 24);
              *(void *)(v40 + 24) = v41 + 1;
              if (*v41) {
                xpc_dictionary_set_uuid(a2, v4, *v41);
              }
              else {
LABEL_29:
              }
                *(_BYTE *)(*(void *)(a1[11] + 8LL) + 24LL) = 1;
              break;
            default:
              break;
          }

          if (!*(_BYTE *)(*(void *)(a1[11] + 8LL) + 24LL)) {
            goto LABEL_35;
          }
          uint64_t v43 = _xpc_asprintf("Null required format arg!");
        }

        else
        {
          uint64_t v43 = _xpc_asprintf("Invalid format specifier!");
        }
      }

      _xpc_api_misuse(v43);
    case '{':
      xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_value(a2, v4, v8);
      (*(void (**)(void))(*(void *)(*(void *)(a1[9] + 8LL) + 40LL) + 16LL))();
      goto LABEL_13;
    case '[':
      xpc_object_t v8 = xpc_array_create(0LL, 0LL);
      xpc_dictionary_set_value(a2, v4, v8);
      (*(void (**)(void))(*(void *)(*(void *)(a1[8] + 8LL) + 40LL) + 16LL))();
LABEL_13:
      xpc_release(v8);
      goto LABEL_35;
  }

  BOOL v18 = (const char *)(*(uint64_t (**)(void))(a1[4] + 16LL))();
  xpc_dictionary_set_string(a2, v4, v18);
LABEL_35:
  int v42 = *(unsigned __int8 *)(a1[12] + *(void *)(*(void *)(a1[7] + 8LL) + 24LL));
  if (v42 == 44)
  {
    (*(void (**)(void))(a1[5] + 16LL))();
  }

  else if (v42 != 125)
  {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }

uint64_t ___create_with_format_and_arguments_block_invoke_14(void *a1)
{
  while (*(_BYTE *)(a1[7] + *(void *)(*(void *)(a1[6] + 8LL) + 24LL)) != 125)
    (*(void (**)(void))(a1[5] + 16LL))();
  return (*(uint64_t (**)(void))(a1[4] + 16LL))();
}

int64_t launch_add_external_service(int a1, const char *a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "type", 5uLL);
  xpc_dictionary_set_uint64(v6, "handle", a1);
  xpc_dictionary_set_string(v6, "path", a2);
  xpc_dictionary_set_value(v6, "overlay", a3);
  xpc_object_t object = 0LL;
  int64_t v7 = _xpc_domain_routine(831LL, v6, &object);
  if (!(_DWORD)v7) {
    xpc_release(object);
  }
  xpc_release(v6);
  return v7;
}

void launch_remove_external_service(const char *a1, const char *a2, dispatch_queue_s *a3, const void *a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "type", 1uLL);
  xpc_dictionary_set_uint64(v8, "handle", 0LL);
  xpc_dictionary_set_string(v8, "name", a1);
  if (a2) {
    xpc_dictionary_set_string(v8, "version", a2);
  }
  uint64_t v9 = _xpc_mach_port_allocate(1u, 1u, (mach_port_context_t)launch_remove_external_service);
  mach_port_name_t v10 = v9;
  int v11 = _xpc_event_routine_async(832LL, v8, v9);
  if (v11)
  {
    int v12 = v11;
    BOOL v13 = _xpc_alloc(0x18uLL);
    v13[2] = v12;
    *((void *)v13 + 2) = _xpc_Block_copy_impl(a4);
    dispatch_async_f(a3, v13, (dispatch_function_t)_deliver_error);
  }

  else
  {
    unsigned int v14 = _xpc_alloc(0x18uLL);
    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1895FE808], v10, 0LL, a3);
    dispatch_set_context(v15, v14);
    *unsigned int v14 = v15;
    v14[2] = _xpc_Block_copy_impl(a4);
    dispatch_source_set_event_handler_f(v15, (dispatch_function_t)_removal_reply_event);
    dispatch_source_set_mandatory_cancel_handler_f();
    dispatch_activate(v15);
  }

  xpc_release(v8);
}

void _deliver_error(uint64_t a1)
{
  uint64_t v2 = *(void (***)(void, void))(a1 + 16);
  v2[2](v2, *(unsigned int *)(a1 + 8));
  _Block_release(v2);
  free((void *)a1);
}

void _removal_reply_event(uint64_t a1)
{
  uint64_t v2 = *(dispatch_source_s **)a1;
  uint64_t v3 = *(void (***)(void, void))(a1 + 16);
  mach_port_name_t handle = dispatch_source_get_handle(*(dispatch_source_t *)a1);
  xpc_object_t xdict = 0LL;
  uint64_t int64 = xpc_pipe_receive(handle, &xdict, 0);
  if (!(_DWORD)int64)
  {
    uint64_t int64 = xpc_dictionary_get_int64(xdict, "error");
    xpc_release(xdict);
  }

  v3[2](v3, int64);
  dispatch_set_context(v2, v2);
  dispatch_source_cancel(v2);
  _Block_release(v3);
  free((void *)a1);
}

void _removal_reply_cancel(dispatch_source_s *a1)
{
  mach_port_name_t handle = dispatch_source_get_handle(a1);
  dispatch_release(a1);
}

xpc_object_t launch_copy_extension_properties(uint64_t a1)
{
  xpc_object_t v1 = _xpc_connection_copy_attrs(a1, -1);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  if (xpc_dictionary_get_BOOL(v1, "extension")) {
    xpc_object_t v3 = _translate_attrs(v2);
  }
  else {
    xpc_object_t v3 = 0LL;
  }
  xpc_release(v2);
  return v3;
}

xpc_object_t _translate_attrs(void *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  string = xpc_dictionary_get_string(a1, "path");
  if (string) {
    xpc_dictionary_set_string(v2, "XPCExtensionPath", string);
  }
  uint64_t v4 = xpc_dictionary_get_string(a1, "bundle-id");
  if (v4) {
    xpc_dictionary_set_string(v2, "XPCExtensionBundleIdentifier", v4);
  }
  uint64_t v5 = xpc_dictionary_get_string(a1, "version");
  if (v5) {
    xpc_dictionary_set_string(v2, "XPCExtensionBundleVersion", v5);
  }
  xpc_object_t v6 = xpc_dictionary_get_string(a1, "XPCExtensionHostBundleIdentifier");
  if (v6) {
    xpc_dictionary_set_string(v2, "XPCExtensionHostBundleIdentifier", v6);
  }
  int int64 = xpc_dictionary_get_int64(a1, "XPCExtensionHostPID");
  int v8 = xpc_dictionary_get_int64(a1, "XPCExtensionPID");
  if (v8) {
    xpc_dictionary_set_int64(v2, "XPCExtensionPID", v8);
  }
  if (xpc_dictionary_get_BOOL(a1, "XPCExtensionXPCBundle")) {
    xpc_dictionary_set_BOOL(v2, "XPCExtensionXPCBundle", 1);
  }
  return v2;
}

xpc_object_t launch_copy_extension_properties_for_pid(int a1)
{
  xpc_object_t v1 = _xpc_connection_copy_attrs(0LL, a1);
  if (!v1) {
    return 0LL;
  }
  xpc_object_t v2 = v1;
  if (xpc_dictionary_get_BOOL(v1, "extension")) {
    xpc_object_t v3 = _translate_attrs(v2);
  }
  else {
    xpc_object_t v3 = 0LL;
  }
  xpc_release(v2);
  return v3;
}

xpc_object_t launch_copy_properties_for_pid_4assertiond(int a1)
{
  xpc_object_t result = _xpc_connection_copy_attrs(0LL, a1);
  if (result)
  {
    xpc_object_t v2 = result;
    xpc_object_t v3 = _translate_attrs(result);
    xpc_release(v2);
    return v3;
  }

  return result;
}

xpc_object_t launch_copy_busy_extension_instances(const char **a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v4, "type", 1uLL);
  xpc_dictionary_set_uint64(v4, "handle", 0LL);
  for (xpc_object_t i = xpc_array_create(0LL, 0LL); a2; --a2)
  {
    xpc_object_t v6 = *a1++;
    xpc_array_set_string(i, 0xFFFFFFFFFFFFFFFFLL, v6);
  }

  xpc_dictionary_set_value(v4, "names", i);
  xpc_release(i);
  xpc_object_t xdict = 0LL;
  if (_xpc_domain_routine(833LL, v4, &xdict))
  {
    _os_assumes_log();
    xpc_object_t v7 = 0LL;
  }

  else
  {
    xpc_object_t v7 = xpc_array_create(0LL, 0LL);
    xpc_object_t value = xpc_dictionary_get_value(xdict, "instances");
    if (xpc_array_get_count(value))
    {
      size_t v9 = 0LL;
      do
      {
        xpc_object_t v10 = xpc_array_get_value(value, v9);
        xpc_object_t v11 = _translate_attrs(v10);
        xpc_array_append_value(v7, v11);
        xpc_release(v11);
        ++v9;
      }

      while (v9 < xpc_array_get_count(value));
    }

    xpc_release(xdict);
  }

  xpc_release(v4);
  return v7;
}

void launch_extension_check_in_live_4UIKit()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "type", 5uLL);
  pid_t v1 = getpid();
  xpc_dictionary_set_uint64(v0, "handle", v1);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  xpc_object_t object = 0LL;
  else {
    xpc_release(object);
  }
  xpc_release(v0);
}

uint64_t _xpc_session_get_state(os_unfair_lock_s *a1)
{
  xpc_object_t v2 = a1 + 8;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v2);
  uint64_t os_unfair_lock_opaque = a1[9]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return os_unfair_lock_opaque;
}

uint64_t _xpc_session_get_state_locked(os_unfair_lock_s *a1)
{
  return a1[9]._os_unfair_lock_opaque;
}

const char *_xpc_session_string_for_state(int a1)
{
  else {
    return off_18962A6A8[a1 - 1];
  }
}

char *_xpc_session_common_copy_concise_identifier(uint64_t a1, const char *a2)
{
  if (a1) {
    xpc_object_t v3 = _xpc_connection_pretty_name(a1);
  }
  else {
    xpc_object_t v3 = "No Connection";
  }
  return _xpc_asprintf("%s<%s>", a2, v3);
}

char *__cdecl xpc_session_copy_description(xpc_session_t session)
{
  unsigned int v2 = _xpc_session_get_state((os_unfair_lock_s *)session) - 1;
  if (v2 > 4) {
    xpc_object_t v3 = "Unknown";
  }
  else {
    xpc_object_t v3 = off_18962A6A8[v2];
  }
  xpc_object_t v4 = _xpc_session_common_copy_concise_identifier(*((void *)session + 7), "Session");
  uint64_t v5 = _xpc_asprintf("%s(%s)", v4, v3);
  free(v4);
  return v5;
}

uint64_t _xpc_session_xref_dispose(os_unfair_lock_s *a1)
{
  uint64_t result = _xpc_session_get_state(a1);
  if ((result - 6) <= 0xFFFFFFFD)
  {
    unsigned int v2 = _xpc_asprintf("Session must be canceled before it's disposed");
    _xpc_api_misuse(v2);
  }

  return result;
}

void _xpc_session_dispose(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    unsigned int v2 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = a1;
      _os_log_impl(&dword_180150000, v2, OS_LOG_TYPE_DEFAULT, "[%p] Disposing of session", (uint8_t *)&v5, 0xCu);
    }
  }

  if (*(_DWORD *)(a1 + 36) != 5) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(void *)(a1 + 56) = 0LL;
  _Block_release(*(const void **)(a1 + 24));
  *(void *)(a1 + 24) = 0LL;
  _Block_release(*(const void **)(a1 + 16));
  *(void *)(a1 + 16) = 0LL;
  xpc_object_t v3 = *(void **)(a1 + 40);
  if (v3) {
    _xpc_session_cancelation_reason_dispose(v3);
  }
  xpc_object_t v4 = *(dispatch_object_s **)(a1 + 64);
  if (v4) {
    dispatch_release(v4);
  }
}

void _xpc_session_cancelation_reason_dispose(void *a1)
{
  unsigned int v2 = (void *)a1[1];
  if (v2) {
    xpc_release(v2);
  }
  free(a1);
}

dispatch_queue_t _xpc_session_common_create_opq(dispatch_queue_global_s *a1, char *label)
{
  dispatch_queue_global_t global_queue = a1;
  if (!a1) {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  }
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2(label, 0LL, global_queue);
  dispatch_set_context(v5, a1);
  return v5;
}

uint64_t _xpc_session_create_with_connection( _xpc_connection_s *a1, dispatch_queue_s *a2, char a3, char a4, xpc_object_t *a5)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  xpc_connection_set_target_queue(a1, a2);
  uint64_t v10 = _xpc_session_alloc();
  *(void *)(v10 + 40) = 0LL;
  *(_DWORD *)(v10 + 48) = 0;
  *(void *)(v10 + 32) = 0x100000000LL;
  dispatch_retain(a2);
  *(void *)(v10 + 64) = a2;
  xpc_retain(a1);
  *(void *)(v10 + 56) = a1;
  _xpc_retain(v10);
  *(void *)&__int128 v13 = MEMORY[0x1895FED80];
  *((void *)&v13 + 1) = 0x40000000LL;
  unsigned int v14 = ___xpc_session_setup_connection_handlers_block_invoke;
  dispatch_source_t v15 = &__block_descriptor_tmp_31_0;
  uint64_t v16 = v10;
  xpc_connection_set_event_handler(a1, &v13);
  if ((a3 & 1) == 0)
  {
    if (*(_DWORD *)(v10 + 36) != 1) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    xpc_connection_activate(*(xpc_connection_t *)(v10 + 56));
    if (_xpc_connection_is_invalid(*(void *)(v10 + 56)))
    {
      _xpc_session_cancel_with_code(v10, 3);
      if (a5) {
        *a5 = xpc_retain(*(xpc_object_t *)(*(void *)(v10 + 40) + 8LL));
      }
      xpc_release((xpc_object_t)v10);
      return 0LL;
    }

    *(_DWORD *)(v10 + 36) = 3;
  }

  if ((a4 & 1) != 0)
  {
    *(_BYTE *)(v10 + 52) |= 1u;
    xpc_retain((xpc_object_t)v10);
  }

  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    xpc_object_t v11 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v13) = 134217984;
      *(void *)((char *)&v13 + 4) = v10;
      _os_log_impl(&dword_180150000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Session created.", (uint8_t *)&v13, 0xCu);
    }
  }

  return v10;
}

xpc_session_t xpc_session_create_xpc_service( const char *name, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  char v4 = flags;
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if ((flags & 2) != 0)
  {
    int v12 = _xpc_asprintf("Attempting to set privileged flag on connection to XPC Service.", target_queue);
    _xpc_api_misuse(v12);
  }

  opq = _xpc_session_common_create_opq((dispatch_queue_global_s *)target_queue, "com.apple.session.queue");
  int v8 = xpc_connection_create(name, opq);
  size_t v9 = (_xpc_session_s *)_xpc_session_create_with_connection(v8, opq, v4, 0, (xpc_object_t *)error_out);
  dispatch_release(opq);
  xpc_release(v8);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    uint64_t v10 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      unsigned int v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = name;
      _os_log_impl( &dword_180150000,  v10,  OS_LOG_TYPE_DEFAULT,  "[%p] Session created with XPC Service: %s",  (uint8_t *)&v13,  0x16u);
    }
  }

  return v9;
}

xpc_session_t xpc_session_create_mach_service( const char *mach_service, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  char v5 = flags;
  uint64_t v16 = *MEMORY[0x1895FEE08];
  opq = _xpc_session_common_create_opq((dispatch_queue_global_s *)target_queue, "com.apple.session.queue");
  int v8 = xpc_connection_create_mach_service(mach_service, opq, v5 & 2);
  size_t v9 = (_xpc_session_s *)_xpc_session_create_with_connection(v8, opq, v5, 0, (xpc_object_t *)error_out);
  dispatch_release(opq);
  xpc_release(v8);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    uint64_t v10 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      int v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = mach_service;
      _os_log_impl( &dword_180150000,  v10,  OS_LOG_TYPE_DEFAULT,  "[%p] Session created with Mach Service: %s",  (uint8_t *)&v12,  0x16u);
    }
  }

  return v9;
}

uint64_t xpc_session_create_xpc_endpoint( _xpc_endpoint_s *a1, dispatch_queue_global_s *a2, char a3, xpc_object_t *a4)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  opq = _xpc_session_common_create_opq(a2, "com.apple.session.queue");
  int v8 = xpc_connection_create_from_endpoint(a1);
  uint64_t v9 = _xpc_session_create_with_connection(v8, opq, a3, 0, a4);
  dispatch_release(opq);
  xpc_release(v8);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    uint64_t v10 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = v9;
      _os_log_impl( &dword_180150000,  v10,  OS_LOG_TYPE_DEFAULT,  "[%p] Session created with Endpoint.",  (uint8_t *)&v12,  0xCu);
    }
  }

  return v9;
}

uint64_t _xpc_session_create_from_connection_4SWIFT( uint64_t a1, dispatch_queue_global_s *a2, unint64_t a3, xpc_object_t *a4)
{
  char v4 = a3;
  uint64_t v18 = *MEMORY[0x1895FEE08];
  if (a3 >= 2)
  {
    int v12 = _xpc_asprintf("invalid flags value %llu", a3);
    _xpc_api_misuse(v12);
  }

  char v13 = 0;
  opq = _xpc_session_common_create_opq(a2, "com.apple.session.queue");
  connection = (_xpc_connection_s *)_xpc_connection_extract_connection(a1, (BOOL *)&v13);
  uint64_t v9 = _xpc_session_create_with_connection(connection, opq, v4, v13, a4);
  dispatch_release(opq);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    uint64_t v10 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_port_options_t buf = 134218240;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = a1;
      _os_log_impl(&dword_180150000, v10, OS_LOG_TYPE_DEFAULT, "[%p] Session created from connection [%p]", buf, 0x16u);
    }
  }

  return v9;
}

uint64_t _xpc_session_extract_connection_4SWIFT(uint64_t a1)
{
  unsigned int v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v2);
  if (*(_DWORD *)(a1 + 36) != 1)
  {
    int state_locked = _xpc_session_get_state_locked((os_unfair_lock_s *)a1);
    char v5 = _xpc_session_string_for_state(state_locked);
    uint64_t v6 = _xpc_asprintf("Session must be inactive to extract the connection, not %s", v5);
    _xpc_api_misuse(v6);
  }

  os_unfair_lock_assert_owner(v2);
  *(_DWORD *)(a1 + 36) = 2;
  os_unfair_lock_unlock(v2);
  xpc_retain(*(xpc_object_t *)(a1 + 56));
  *(_BYTE *)(a1 + 52) |= 2u;
  return _xpc_connection_extract_connection(*(void *)(a1 + 56), 0LL);
}

void xpc_session_set_incoming_message_handler( xpc_session_t session, xpc_session_incoming_message_handler_t handler)
{
  char v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  if (*((_DWORD *)session + 9) != 1)
  {
    int state_locked = _xpc_session_get_state_locked((os_unfair_lock_s *)session);
    uint64_t v7 = _xpc_session_string_for_state(state_locked);
    int v8 = _xpc_asprintf("Session must be inactive to set the message handler, not %s", v7);
    _xpc_api_misuse(v8);
  }

  char v5 = (const void *)*((void *)session + 3);
  if (v5) {
    _Block_release(v5);
  }
  *((void *)session + 3) = _xpc_Block_copy_impl(handler);
  os_unfair_lock_unlock(v4);
}

void xpc_session_set_cancel_handler(xpc_session_t session, xpc_session_cancel_handler_t cancel_handler)
{
  char v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  if (*((_DWORD *)session + 9) != 1)
  {
    int state_locked = _xpc_session_get_state_locked((os_unfair_lock_s *)session);
    uint64_t v7 = _xpc_session_string_for_state(state_locked);
    int v8 = _xpc_asprintf("Session must be inactive to set the cancel handler, not %s", v7);
    _xpc_api_misuse(v8);
  }

  char v5 = (const void *)*((void *)session + 2);
  if (v5) {
    _Block_release(v5);
  }
  *((void *)session + 2) = _xpc_Block_copy_impl(cancel_handler);
  os_unfair_lock_unlock(v4);
}

void xpc_session_set_target_queue(xpc_session_t session, dispatch_queue_t target_queue)
{
  char v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  if (*((_DWORD *)session + 9) != 1)
  {
    int state_locked = _xpc_session_get_state_locked((os_unfair_lock_s *)session);
    int v8 = _xpc_session_string_for_state(state_locked);
    uint64_t v9 = _xpc_asprintf("Session must be inactive to set the cancel handler, not %s", v8);
    _xpc_api_misuse(v9);
  }

  char v5 = (dispatch_object_s *)*((void *)session + 8);
  if (v5) {
    dispatch_release(v5);
  }
  opq = _xpc_session_common_create_opq((dispatch_queue_global_s *)target_queue, "com.apple.session.queue");
  *((void *)session + 8) = opq;
  xpc_connection_set_target_queue(*((xpc_connection_t *)session + 7), opq);
  os_unfair_lock_unlock(v4);
}

uint64_t _xpc_session_activate_if_new(uint64_t a1, xpc_object_t *a2)
{
  char v4 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  uint64_t v5 = *(unsigned int *)(a1 + 36);
  if ((_DWORD)v5 == 1)
  {
    BOOL v6 = _xpc_session_activate_locked(a1);
    os_unfair_lock_unlock(v4);
    if (!v6) {
      _xpc_session_activate_handle_error(a1, a2);
    }
  }

  else
  {
    os_unfair_lock_unlock(v4);
  }

  return v5;
}

BOOL _xpc_session_activate_locked(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 32));
  *(_DWORD *)(a1 + 36) = 3;
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 56));
  BOOL is_invalid = _xpc_connection_is_invalid(*(void *)(a1 + 56));
  if (!is_invalid && _os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    xpc_object_t v3 = (os_log_s *)_xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = a1;
      _os_log_impl(&dword_180150000, v3, OS_LOG_TYPE_DEFAULT, "[%p] Session activated", (uint8_t *)&v5, 0xCu);
    }
  }

  return !is_invalid;
}

void _xpc_session_activate_handle_error(uint64_t a1, xpc_object_t *a2)
{
  if (a2)
  {
    char v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 40);
    os_unfair_lock_unlock(v4);
    *a2 = xpc_retain(*(xpc_object_t *)(v5 + 8));
  }

BOOL xpc_session_activate(xpc_session_t session, xpc_rich_error_t *error_out)
{
  char v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  int v5 = *((_DWORD *)session + 9);
  if (v5 != 1)
  {
    switch(v5)
    {
      case 3:
        int v8 = _xpc_asprintf("Attempting to activate an already active session");
        break;
      case 4:
        int v8 = _xpc_asprintf("Attempting to activate a canceling session");
        break;
      case 5:
        int v8 = _xpc_asprintf("Attempting to activate a canceled session");
        break;
      default:
        int v8 = _xpc_asprintf("Attempting to activate a session in an unknown state");
        break;
    }

    _xpc_api_misuse(v8);
  }

  BOOL v6 = _xpc_session_activate_locked((uint64_t)session);
  os_unfair_lock_unlock(v4);
  if (!v6) {
    _xpc_session_activate_handle_error((uint64_t)session, (xpc_object_t *)error_out);
  }
  return v6;
}

void xpc_session_cancel(xpc_session_t session)
{
  if (_xpc_session_get_state((os_unfair_lock_s *)session) == 1)
  {
    unsigned int v2 = _xpc_asprintf("Attempting to cancel an inactive session");
    _xpc_api_misuse(v2);
  }

  _xpc_session_cancel_with_code((uint64_t)session, 1);
}

void _xpc_session_cancel_with_code(uint64_t a1, int a2)
{
  uint64_t v4 = _xpc_session_rich_error_with_cancelation_reason(a1, a2);
  int v5 = _xpc_alloc(0x10uLL);
  *(_DWORD *)int v5 = a2;
  v5[1] = v4;
  _xpc_session_cancel_with_reason(a1, v5);
}

void _xpc_session_cancel_peer(uint64_t a1, const char *a2)
{
  xpc_object_t v3 = _xpc_asprintf("Peer rejected with reason: %s", a2);
  uint64_t v4 = xpc_rich_error_create(v3, 0);
  free(v3);
  int v5 = _xpc_alloc(0x10uLL);
  *(_DWORD *)int v5 = 4;
  v5[1] = v4;
  _xpc_session_cancel_with_reason(a1, v5);
}

xpc_rich_error_t xpc_session_send_message(xpc_session_t session, xpc_object_t message)
{
  signed int state = _xpc_session_get_state((os_unfair_lock_s *)session);
  if (state <= 2)
  {
    BOOL v6 = _xpc_asprintf("Attempting to send a message using a session that is neither active or canceled.");
    _xpc_api_misuse(v6);
  }

  if ((state & 0xFFFFFFFE) == 4) {
    return (xpc_rich_error_t)_xpc_session_message_error_during_cancelation(state);
  }
  xpc_connection_send_message(*((xpc_connection_t *)session + 7), message);
  return 0LL;
}

uint64_t _xpc_session_message_error_during_cancelation(unsigned int a1)
{
  if (a1 == 4)
  {
    pid_t v1 = "Attempting to send message using a session that's canceling";
  }

  else
  {
    if (a1 != 5) {
      _xpc_session_message_error_during_cancelation_cold_1(a1);
    }
    pid_t v1 = "Attempting to send message using a canceled session";
  }

  return xpc_rich_error_create(v1, 0);
}

xpc_object_t xpc_session_send_message_with_reply_sync( xpc_session_t session, xpc_object_t message, xpc_rich_error_t *error_out)
{
  int state = _xpc_session_get_state((os_unfair_lock_s *)session);
  if (state <= 2)
  {
    int v12 = _xpc_asprintf("Attempting to send a message using a session that is neither active or canceled.");
    _xpc_api_misuse(v12);
  }

  unsigned int v7 = state;
  mach_port_context_t context = (dispatch_queue_s *)dispatch_get_context(*((dispatch_object_t *)session + 8));
  if (context) {
    dispatch_assert_queue_not_V2(context);
  }
  if ((v7 & 0xFFFFFFFE) == 4)
  {
    if (error_out)
    {
      uint64_t v9 = (_xpc_rich_error_s *)_xpc_session_message_error_during_cancelation(v7);
LABEL_7:
      xpc_object_t v10 = 0LL;
      *error_out = v9;
      return v10;
    }

    return 0LL;
  }

  os_unfair_lock_lock_with_options();
  ++*((_DWORD *)session + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)session + 8);
  xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(*((xpc_connection_t *)session + 7), message);
  _xpc_session_decrement_inflight_replies((uint64_t)session);
  if (v10 && xpc_get_type(v10) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error)
  {
    uint64_t v9 = (_xpc_rich_error_s *)_xpc_session_cancel_after_reply_error((uint64_t)session, (__objc2_class **)v10);
    if (error_out) {
      goto LABEL_7;
    }
    return 0LL;
  }

  return v10;
}

void _xpc_session_decrement_inflight_replies(uint64_t a1)
{
  unsigned int v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3)
  {
    int v4 = v3 - 1;
    *(_DWORD *)(a1 + 48) = v4;
    BOOL v5 = v4 == 0;
  }

  else
  {
    BOOL v5 = 1;
  }

  int v6 = *(_DWORD *)(a1 + 36);
  unsigned int v7 = *(dispatch_queue_s **)(a1 + 64);
  os_unfair_lock_unlock(v2);
  if (v5 && v6 == 4)
  {
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___xpc_session_decrement_inflight_replies_block_invoke;
    block[3] = &__block_descriptor_tmp_52_0;
    block[4] = a1;
    dispatch_async(v7, block);
  }

xpc_object_t _xpc_session_cancel_after_reply_error(uint64_t a1, __objc2_class **a2)
{
  if (a2 == &_xpc_error_peer_code_signing_requirement) {
    int v3 = 5;
  }
  else {
    int v3 = 2;
  }
  if (a2 == &_xpc_error_connection_invalid) {
    int v4 = 3;
  }
  else {
    int v4 = v3;
  }
  uint64_t v5 = _xpc_session_rich_error_with_cancelation_reason(a1, v4);
  int v6 = _xpc_alloc(0x10uLL);
  *(_DWORD *)int v6 = v4;
  v6[1] = v5;
  _xpc_session_cancel_with_reason(a1, v6);
  return xpc_retain(*(xpc_object_t *)(*(void *)(a1 + 40) + 8LL));
}

void xpc_session_send_message_with_reply_async( xpc_session_t session, xpc_object_t message, xpc_session_reply_handler_t reply_handler)
{
  signed int state = _xpc_session_get_state((os_unfair_lock_s *)session);
  if (state <= 2)
  {
    xpc_object_t v11 = _xpc_asprintf("Attempting to send a message using a session that is neither active or canceled.");
    _xpc_api_misuse(v11);
  }

  if ((state & 0xFFFFFFFE) == 4)
  {
    uint64_t v7 = _xpc_session_message_error_during_cancelation(state);
    int v8 = (dispatch_queue_s *)*((void *)session + 8);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = __xpc_session_send_message_with_reply_async_block_invoke;
    block[3] = &unk_18962A558;
    block[4] = reply_handler;
    void block[5] = v7;
    dispatch_async(v8, block);
  }

  else
  {
    _xpc_retain((uint64_t)session);
    os_unfair_lock_lock_with_options();
    ++*((_DWORD *)session + 12);
    os_unfair_lock_unlock((os_unfair_lock_t)session + 8);
    uint64_t v9 = (_xpc_connection_s *)*((void *)session + 7);
    xpc_object_t v10 = (dispatch_queue_s *)*((void *)session + 8);
    v12[0] = MEMORY[0x1895FED80];
    v12[1] = 0x40000000LL;
    v12[2] = __xpc_session_send_message_with_reply_async_block_invoke_2;
    v12[3] = &unk_18962A580;
    v12[4] = reply_handler;
    v12[5] = session;
    xpc_connection_send_message_with_reply(v9, message, v10, v12);
  }

void __xpc_session_send_message_with_reply_async_block_invoke(uint64_t a1)
{
}

uint64_t __xpc_session_send_message_with_reply_async_block_invoke_2(uint64_t a1, __objc2_class **a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error)
  {
    xpc_object_t v4 = _xpc_session_cancel_after_reply_error(*(void *)(a1 + 40), a2);
    if (!v4) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    uint64_t v5 = v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    xpc_release(v5);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return _xpc_release(*(void *)(a1 + 40));
}

uint64_t xpc_session_set_target_user_session_uid(uint64_t a1, int a2)
{
  return xpc_connection_set_target_user_session_uid(*(void *)(a1 + 56), a2);
}

uint64_t _xpc_session_assert_inactive(os_unfair_lock_s *a1, const char *a2)
{
  uint64_t result = _xpc_session_get_state(a1);
  if ((_DWORD)result != 1)
  {
    xpc_object_t v4 = _xpc_session_string_for_state(result);
    uint64_t v5 = _xpc_asprintf("Session must be inactive to %s, not %s", a2, v4);
    _xpc_api_misuse(v5);
  }

  return result;
}

void xpc_session_set_instance(uint64_t a1, const unsigned __int8 *a2)
{
}

void _xpc_session_get_peer_audit_token_4SWIFT(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  xpc_connection_get_audit_token(*(void *)(a1 + 56), a2);
}

uint64_t _xpc_session_is_extracted(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 52) >> 1) & 1;
}

os_log_t ___xpc_session_log_handle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.xpc", "session");
  _xpc_session_log_handle__log = (uint64_t)result;
  return result;
}

void ___xpc_session_setup_connection_handlers_block_invoke(uint64_t a1, __objc2_class **object)
{
  uint64_t v31 = *MEMORY[0x1895FEE08];
  int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 36LL);
  if ((v3 - 4) <= 0xFFFFFFFD)
  {
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1) {
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      }
      uint64_t v4 = _xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)mach_port_options_t buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        int v6 = "[%p] Received event on inactive Session";
        uint64_t v7 = (os_log_s *)v4;
LABEL_7:
        _os_log_impl(&dword_180150000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
        return;
      }
    }

    return;
  }

  if (v3 == 2 && object != &_xpc_error_connection_invalid) {
    _os_assumes_log();
  }
  launch_data_type_t type = (__objc2_class *)xpc_get_type(object);
  uint64_t v11 = *(void *)(a1 + 32);
  if (type != &OBJC_CLASS___OS_xpc_error)
  {
    uint64_t v12 = *(void *)(v11 + 24);
    if (v12)
    {
      (*(void (**)(uint64_t, __objc2_class **))(v12 + 16))(v12, object);
    }

    else
    {
      uint64_t v18 = _xpc_session_common_copy_concise_identifier(*(void *)(v11 + 56), "Session");
      *(_OWORD *)mach_port_options_t buf = 0u;
      __int128 v26 = 0u;
      xpc_dictionary_get_audit_token(object);
      if (_os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_session_log_handle__once != -1) {
          dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
        }
        uint64_t v19 = (os_log_s *)_xpc_session_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v27 = 134218498;
          uint64_t v28 = v11;
          __int16 v29 = 2080;
          *(void *)uint64_t v30 = v18;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)&v30[10] = DWORD1(v26);
          _os_log_impl( &dword_180150000,  v19,  OS_LOG_TYPE_ERROR,  "[%p] Incoming message to %s from PID %d is dropped because incoming message handler isn't set",  v27,  0x1Cu);
        }
      }

      uint64_t v20 = _xpc_asprintf("Incoming message to %s is dropped because incoming message handler isn't set", v18);
      if (os_fault_with_payload() && _os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_session_log_handle__once != -1) {
          dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
        }
        uint64_t v21 = (os_log_s *)_xpc_session_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_ERROR))
        {
          int v22 = *__error();
          __int128 v23 = __error();
          uint64_t v24 = xpc_strerror(*v23);
          *(_DWORD *)int v27 = 134218498;
          uint64_t v28 = v11;
          __int16 v29 = 1024;
          *(_DWORD *)uint64_t v30 = v22;
          *(_WORD *)&v30[4] = 2080;
          *(void *)&v30[6] = v24;
          _os_log_impl(&dword_180150000, v21, OS_LOG_TYPE_ERROR, "[%p] Unable to generate a fault: %d - %s", v27, 0x1Cu);
        }
      }

      free(v20);
      free(v18);
    }

    return;
  }

  if (object == &_xpc_error_connection_invalid)
  {
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1) {
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      }
      uint64_t v15 = (os_log_s *)_xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)mach_port_options_t buf = 134217984;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl(&dword_180150000, v15, OS_LOG_TYPE_DEFAULT, "[%p] Connection invalidation received", buf, 0xCu);
      }
    }

    if (*(_DWORD *)(v11 + 36) == 2) {
      int v14 = 6;
    }
    else {
      int v14 = 3;
    }
    goto LABEL_40;
  }

  if (object == &_xpc_error_connection_interrupted)
  {
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1) {
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      }
      __int16 v16 = (os_log_s *)_xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)mach_port_options_t buf = 134217984;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl(&dword_180150000, v16, OS_LOG_TYPE_DEFAULT, "[%p] Connection interruption received", buf, 0xCu);
      }
    }

    int v14 = 2;
    goto LABEL_40;
  }

  if (object != &_xpc_error_termination_imminent)
  {
    if (object != &_xpc_error_peer_code_signing_requirement) {
      ___xpc_session_setup_connection_handlers_block_invoke_cold_1();
    }
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1) {
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      }
      char v13 = (os_log_s *)_xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)mach_port_options_t buf = 134217984;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl( &dword_180150000,  v13,  OS_LOG_TYPE_DEFAULT,  "[%p] Peer did not meet the code signing requirement. Cancelling the connection.",  buf,  0xCu);
      }
    }

    int v14 = 5;
LABEL_40:
    _xpc_session_cancel_with_code(*(void *)(a1 + 32), v14);
    return;
  }

  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1) {
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    }
    uint64_t v17 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_port_options_t buf = 134217984;
      *(void *)&uint8_t buf[4] = v11;
      int v6 = "[%p] Termination imminent. No more messages will be received on this session.";
      uint64_t v7 = (os_log_s *)v17;
      goto LABEL_7;
    }
  }

uint64_t _xpc_session_rich_error_with_cancelation_reason(uint64_t a1, int a2)
{
  if ((a2 & 0xFFFFFFFB) - 1 > 1)
  {
    if (a2 == 3)
    {
      int v3 = xpc_connection_copy_invalidation_reason(*(void *)(a1 + 56));
      uint64_t v4 = v3;
      uint64_t v5 = "Unknown";
      if (v3) {
        uint64_t v5 = v3;
      }
      int v6 = _xpc_asprintf("%s. Reason: %s", "Underlying connection was invalidated", v5);
      if (v4) {
        free(v4);
      }
      uint64_t v7 = xpc_rich_error_create(v6, 0);
      free(v6);
      return v7;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    else {
      unsigned int v2 = off_18962A6D0[a2 - 2];
    }
    return xpc_rich_error_create(v2, 0);
  }

void _xpc_session_cancel_with_reason(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  if (a2)
  {
    if (*(void *)(a1 + 40))
    {
      _xpc_session_cancelation_reason_dispose(a2);
    }

    else
    {
      os_unfair_lock_assert_owner(v4);
      *(void *)(a1 + 40) = a2;
    }
  }

  if (*(_DWORD *)(a1 + 36) != 5)
  {
    os_unfair_lock_assert_owner(v4);
    if (*(_DWORD *)(a1 + 36) != 4)
    {
      os_unfair_lock_assert_owner(v4);
      *(_DWORD *)(a1 + 36) = 4;
    }

    os_unfair_lock_assert_owner(v4);
    if (!*(_DWORD *)(a1 + 48))
    {
      uint64_t v5 = *(_xpc_connection_s **)(a1 + 56);
      if (v5 && (*(_BYTE *)(a1 + 52) & 2) == 0)
      {
        xpc_connection_set_event_handler(v5, &__block_literal_global_45);
        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      }

      os_unfair_lock_assert_owner(v4);
      *(_DWORD *)(a1 + 36) = 5;
      if (_os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_session_log_handle__once != -1) {
          dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
        }
        int v6 = (os_log_s *)_xpc_session_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v13) = 134217984;
          *(void *)((char *)&v13 + 4) = a1;
          _os_log_impl(&dword_180150000, v6, OS_LOG_TYPE_DEFAULT, "[%p] Session canceled.", (uint8_t *)&v13, 0xCu);
        }
      }

      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = MEMORY[0x1895FED80];
      if (v7)
      {
        os_unfair_lock_assert_owner(v4);
        uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 8LL);
        xpc_retain(v9);
        xpc_object_t v10 = *(dispatch_queue_s **)(a1 + 64);
        *(void *)&__int128 v13 = v8;
        *((void *)&v13 + 1) = 0x40000000LL;
        int v14 = ___xpc_session_call_cancel_handler_block_invoke;
        uint64_t v15 = &unk_18962A668;
        uint64_t v16 = v7;
        uint64_t v17 = v9;
        dispatch_async(v10, &v13);
      }

      char v11 = *(_BYTE *)(a1 + 52) & 1;
      uint64_t v12 = *(dispatch_queue_s **)(a1 + 64);
      *(void *)&__int128 v13 = v8;
      *((void *)&v13 + 1) = 0x40000000LL;
      int v14 = ___xpc_session_complete_cancelation_locked_block_invoke_46;
      uint64_t v15 = &__block_descriptor_tmp_47;
      uint64_t v16 = a1;
      LOBYTE(v17) = v11;
      dispatch_async(v12, &v13);
    }
  }

  os_unfair_lock_unlock(v4);
}

void ___xpc_session_complete_cancelation_locked_block_invoke_46(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40)) {
    xpc_release(*(xpc_object_t *)(a1 + 32));
  }
}

void ___xpc_session_call_cancel_handler_block_invoke(uint64_t a1)
{
}

void ___xpc_session_decrement_inflight_replies_block_invoke(uint64_t a1)
{
}

BOOL _xpc_endpoint_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

unint64_t _xpc_endpoint_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24) ^ (unint64_t)_xpc_endpoint_hash;
}

uint64_t _xpc_endpoint_desc(unint64_t *a1, uint64_t a2)
{
  return _xpc_base_desc(a1, a2);
}

uint64_t _xpc_endpoint_debug()
{
  return 0LL;
}

uint64_t _xpc_endpoint_serialize(uint64_t a1, void *a2)
{
  int v3 = 73728;
  return _xpc_serializer_append_port(a2, &v3, 4uLL, a1, *(_DWORD *)(a1 + 24), 19);
}

uint64_t _xpc_endpoint_deserialize(uint64_t *a1)
{
  int v4 = 0;
  int v1 = v4;
  uint64_t result = _xpc_base_create();
  int v3 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) = v3 | 3;
  return result;
}

uint64_t _xpc_endpoint_wire_length()
{
  return -1LL;
}

uint64_t _xpc_endpoint_dispose(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 24);
  if ((result + 1) >= 2)
  {
    uint64_t result = _xpc_mach_port_release(result);
    if ((_DWORD)result) {
      return _os_assumes_log();
    }
  }

  return result;
}

uint64_t _xpc_endpoint_create(int a1)
{
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = a1;
  return result;
}

uint64_t _xpc_endpoint_get_listener_port(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_endpoint_copy_listener_port(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 24);
  int v2 = _xpc_mach_port_retain_send(*(_DWORD *)(a1 + 24));
  if (v2)
  {
    if (v2 != 17) {
      _os_assumes_log();
    }
    return 0xFFFFFFFFLL;
  }

  return v1;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection) {
    _xpc_api_misuse("Given object not of required type.");
  }
  int v2 = _xpc_connection_copy_listener_port((uint64_t)connection);
  xpc_endpoint_t result = (xpc_endpoint_t)_xpc_base_create();
  *((_DWORD *)result + 4) |= 2u;
  *((_DWORD *)result + 6) = v2;
  return result;
}

uint64_t xpc_endpoint_compare(_DWORD *a1, _DWORD *a2)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_endpoint
    || xpc_get_type(a2) != (xpc_type_t)&OBJC_CLASS___OS_xpc_endpoint)
  {
    _xpc_api_misuse("Given object not of required type.");
  }

  unsigned int v4 = a1[6];
  unsigned int v5 = a2[6];
  BOOL v6 = v4 == v5;
  if (v4 > v5) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = -1;
  }
  if (v6) {
    return 0LL;
  }
  else {
    return v7;
  }
}

uint64_t xpc_endpoint_create_bs_from_port(int a1)
{
  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    int v3 = _xpc_asprintf("Cannot create endpoint from invalid mach port.");
    _xpc_api_misuse(v3);
  }

  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = a1;
  return result;
}

uint64_t xpc_endpoint_create_bs_named(char *a1, int a2, char *a3)
{
  if (a2) {
    uint64_t v3 = 8LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  return _xpc_endpoint_create_bs(a1, 7, 0LL, 0LL, v3, a3);
}

uint64_t _xpc_endpoint_create_bs( char *a1, int a2, uint64_t a3, const unsigned __int8 *a4, uint64_t a5, char *a6)
{
  if (!a1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (!a6) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *a6 = 0;
  uint64_t v7 = 544LL;
  if (!a4) {
    uint64_t v7 = 512LL;
  }
  int v13 = 0;
  BOOL v12 = 0;
  int v8 = _xpc_look_up_endpoint(a1, a2, a3, 0LL, a4, v7 | a5, 0LL, &v13, &v12);
  uint64_t result = 0LL;
  if (v8 > 123)
  {
  }

  else if (v8)
  {
    if (v8 != 1 && v8 != 3)
    {
LABEL_12:
      _os_assumes_log();
      return 0LL;
    }
  }

  else
  {
    int v10 = v13;
    uint64_t result = _xpc_base_create();
    *(_DWORD *)(result + 16) |= 2u;
    *(_DWORD *)(result + 24) = v10;
    if (v12) {
      char v11 = 3;
    }
    else {
      char v11 = 2;
    }
    *a6 = v11;
  }

  return result;
}

uint64_t xpc_endpoint_create_bs_service(char *a1, const unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = getpid();
  return _xpc_endpoint_create_bs(a1, 5, v6, a2, 0LL, a3);
}

BOOL xpc_endpoint_get_bs_job_handle(uint64_t a1, _OWORD *a2)
{
  mach_port_name_t v2 = *(_DWORD *)(a1 + 24);
  if (v2 + 1 < 2) {
    return 0LL;
  }
  unsigned int v4 = (void *)xpc_mach_send_create(v2);
  if (!xpc_mach_send_get_right((unsigned int *)v4)
    || xpc_mach_send_get_right((unsigned int *)v4) == -1)
  {
    xpc_release(v4);
    return 0LL;
  }

  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_value(v5, "endpoint", v4);
  xpc_release(v4);
  xpc_object_t xdict = 0LL;
  int v6 = _launch_job_routine(1012LL, v5, &xdict);
  BOOL v7 = v6 == 0;
  if (v6)
  {
    if (v6 != 113) {
      _os_assumes_log();
    }
  }

  else
  {
    if (!xdict) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    uuid = xpc_dictionary_get_uuid(xdict, "job-handle");
    if (!uuid) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    *a2 = *(_OWORD *)uuid;
    xpc_release(xdict);
  }

  xpc_release(v5);
  return v7;
}

uint64_t xpc_endpoint_create_mach_port_4sim(int a1)
{
  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    uint64_t v3 = _xpc_asprintf("Cannot create endpoint from invalid mach port.");
    _xpc_api_misuse(v3);
  }

  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = a1;
  return result;
}

BOOL _xpc_pointer_equal(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 24) == *(void *)(a2 + 24);
}

uint64_t _xpc_pointer_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 8LL);
}

uint64_t _xpc_pointer_desc(const void **a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "<%s: %p>: %p", "pointer", a1, a1[3]);
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_pointer_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", xpc_object_t value = %p", *(const void **)(a1 + 24));
}

uint64_t _xpc_pointer_deserialize()
{
  return 0LL;
}

uint64_t _xpc_pointer_wire_length()
{
  return -1LL;
}

uint64_t xpc_pointer_create(uint64_t a1)
{
  uint64_t result = _xpc_base_create();
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t xpc_pointer_get_value(void *a1)
{
  else {
    return 0LL;
  }
}

char *__cdecl xpc_listener_copy_description(xpc_listener_t listener)
{
  unsigned int v2 = _xpc_listener_get_state((os_unfair_lock_s *)listener) - 1;
  if (v2 > 2) {
    unsigned int v3 = "Unknown";
  }
  else {
    unsigned int v3 = off_18962A7B8[v2];
  }
  int v4 = _xpc_session_common_copy_concise_identifier(*((void *)listener + 4), "Listener");
  xpc_object_t v5 = _xpc_asprintf("%s(%s)", v4, v3);
  free(v4);
  return v5;
}

uint64_t _xpc_listener_get_state(os_unfair_lock_s *a1)
{
  unsigned int v2 = a1 + 6;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v2);
  uint64_t os_unfair_lock_opaque = a1[7]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return os_unfair_lock_opaque;
}

uint64_t _xpc_listener_xref_dispose(os_unfair_lock_s *a1)
{
  uint64_t result = _xpc_listener_get_state(a1);
  if ((_DWORD)result != 3)
  {
    unsigned int v2 = _xpc_asprintf("Listener must be canceled before it's disposed");
    _xpc_api_misuse(v2);
  }

  return result;
}

void _xpc_listener_dispose(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895FEE08];
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    unsigned int v2 = (os_log_s *)_xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = a1;
      _os_log_impl(&dword_180150000, v2, OS_LOG_TYPE_DEFAULT, "[%p] Disposing of listener", (uint8_t *)&v4, 0xCu);
    }
  }

  if (*(_DWORD *)(a1 + 28) != 3) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(void *)(a1 + 32) = 0LL;
  _Block_release(*(const void **)(a1 + 16));
  *(void *)(a1 + 16) = 0LL;
  unsigned int v3 = *(dispatch_object_s **)(a1 + 40);
  if (v3) {
    dispatch_release(v3);
  }
}

xpc_endpoint_t xpc_listener_create_endpoint(uint64_t a1)
{
  return xpc_endpoint_create(*(xpc_connection_t *)(a1 + 32));
}

xpc_listener_t xpc_listener_create( const char *service, dispatch_queue_t target_queue, xpc_listener_create_flags_t flags, xpc_listener_incoming_session_handler_t incoming_session_handler, xpc_rich_error_t *error_out)
{
  int v7 = flags;
  uint64_t v20 = *MEMORY[0x1895FEE08];
  dispatch_queue_t opq = _xpc_session_common_create_opq((dispatch_queue_global_s *)target_queue, "com.apple.listener.queue");
  listener = (_xpc_connection_s *)xpc_connection_create_listener((char *)service);
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v11 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v11 = _os_alloc_once();
  }
  if ((~v7 & 6LL) == 0)
  {
    uint64_t v15 = _xpc_asprintf("Cannot force the listener to be both a MachService and a XPCService");
    _xpc_api_misuse(v15);
  }

  if ((v7 & 2) != 0 || !(v7 & 4 | *(void *)(v11 + 8) & 0x8000LL)) {
    xpc_connection_set_legacy((uint64_t)listener);
  }
  __int128 v12 = (xpc_listener_s *)_xpc_listener_create_with_connection( listener,  (uint64_t)opq,  v7,  incoming_session_handler,  (uint64_t *)error_out);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    __int128 v13 = (os_log_s *)_xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218242;
      uint64_t v17 = v12;
      __int16 v18 = 2080;
      uint64_t v19 = service;
      _os_log_impl( &dword_180150000,  v13,  OS_LOG_TYPE_DEFAULT,  "[%p] Listener created with name: %s",  (uint8_t *)&v16,  0x16u);
    }
  }

  return v12;
}

void *_xpc_listener_create_with_connection( _xpc_connection_s *a1, uint64_t a2, char a3, const void *a4, uint64_t *a5)
{
  __int128 v10 = (void *)_xpc_listener_alloc();
  v10[3] = 0x100000000LL;
  v10[4] = a1;
  v10[5] = a2;
  v10[2] = _xpc_Block_copy_impl(a4);
  _xpc_retain((uint64_t)v10);
  handler[0] = MEMORY[0x1895FED80];
  handler[1] = 0x40000000LL;
  handler[2] = ___xpc_listener_setup_connection_handlers_block_invoke;
  handler[3] = &__block_descriptor_tmp_15;
  handler[4] = v10;
  xpc_connection_set_event_handler(a1, handler);
  if ((a3 & 1) == 0)
  {
    LODWORD(handler[0]) = 0;
    char v11 = _xpc_listener_activate((uint64_t)v10, handler, a5);
    if (LODWORD(handler[0]) != 1) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    if ((v11 & 1) == 0)
    {
      xpc_release(v10);
      return 0LL;
    }
  }

  return v10;
}

void *xpc_listener_create_anonymous(dispatch_queue_global_s *a1, char a2, const void *a3)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  dispatch_queue_t opq = _xpc_session_common_create_opq(a1, "com.apple.listener.queue");
  uint64_t v6 = xpc_connection_create(0LL, opq);
  uint64_t v10 = 0LL;
  int v7 = _xpc_listener_create_with_connection(v6, (uint64_t)opq, a2, a3, &v10);
  if (!v7) {
    _os_assumes_log();
  }
  if (v10) {
    _os_assumes_log();
  }
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    __int128 v8 = (os_log_s *)_xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_port_options_t buf = 134217984;
      __int128 v12 = v7;
      _os_log_impl(&dword_180150000, v8, OS_LOG_TYPE_DEFAULT, "[%p] Anonymous listener created", buf, 0xCu);
    }
  }

  return v7;
}

BOOL xpc_listener_activate(xpc_listener_t listener, xpc_rich_error_t *error_out)
{
  int v4 = 0;
  BOOL result = _xpc_listener_activate((uint64_t)listener, &v4, (uint64_t *)error_out);
  if (v4 != 1)
  {
    if (v4 == 2) {
      unsigned int v3 = _xpc_asprintf("Attempting to activate an already active listener");
    }
    else {
      unsigned int v3 = _xpc_asprintf("Attempting to activate a listener in an unknown state");
    }
    _xpc_api_misuse(v3);
  }

  return result;
}

uint64_t _xpc_listener_activate(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  if (!a2) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock_with_options();
  *a2 = *(_DWORD *)(a1 + 28);
  if (*(_DWORD *)(a1 + 28) != 1)
  {
    os_unfair_lock_unlock(v6);
    return 0LL;
  }

  xpc_retain((xpc_object_t)a1);
  os_unfair_lock_assert_owner(v6);
  *(_DWORD *)(a1 + 28) = 2;
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 32));
  BOOL is_invalid = _xpc_connection_is_invalid(*(void *)(a1 + 32));
  os_unfair_lock_unlock(v6);
  if (is_invalid)
  {
    __int128 v8 = xpc_connection_copy_invalidation_reason(*(void *)(a1 + 32));
    __int128 v9 = v8;
    if (a3)
    {
      uint64_t v10 = _xpc_asprintf("Unable to activate listener: %s", v8);
      *a3 = xpc_rich_error_create(v10, 0);
      free(v10);
    }

    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_listener_log_handle__once != -1) {
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      }
      char v11 = (os_log_s *)_xpc_listener_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)mach_port_options_t buf = 134218242;
        uint64_t v15 = a1;
        __int16 v16 = 2080;
        uint64_t v17 = v9;
        _os_log_impl(&dword_180150000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Failed listener activation: %s", buf, 0x16u);
      }
    }

    free(v9);
    xpc_listener_cancel((xpc_listener_t)a1);
    return 0LL;
  }

  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    uint64_t v13 = (os_log_s *)_xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_port_options_t buf = 134217984;
      uint64_t v15 = a1;
      _os_log_impl(&dword_180150000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Listener activated", buf, 0xCu);
    }
  }

  return 1LL;
}

void xpc_listener_cancel(xpc_listener_t listener)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  unsigned int v2 = (os_unfair_lock_s *)((char *)listener + 24);
  os_unfair_lock_lock_with_options();
  int v3 = *((_DWORD *)listener + 7);
  if (v3 != 3)
  {
    int v4 = (_xpc_connection_s *)*((void *)listener + 4);
    if (v4)
    {
      xpc_connection_set_event_handler(v4, &__block_literal_global_19);
      xpc_connection_cancel(*((xpc_connection_t *)listener + 4));
    }

    os_unfair_lock_assert_owner(v2);
    *((_DWORD *)listener + 7) = 3;
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_listener_log_handle__once != -1) {
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      }
      uint64_t v5 = (os_log_s *)_xpc_listener_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v7) = 134217984;
        *(void *)((char *)&v7 + 4) = listener;
        _os_log_impl(&dword_180150000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Listener canceled.", (uint8_t *)&v7, 0xCu);
      }
    }

    if (v3 == 2) {
      xpc_release(listener);
    }
    uint64_t v6 = (dispatch_queue_s *)*((void *)listener + 5);
    *(void *)&__int128 v7 = MEMORY[0x1895FED80];
    *((void *)&v7 + 1) = 0x40000000LL;
    __int128 v8 = ___xpc_listener_cancel_locked_block_invoke_20;
    __int128 v9 = &__block_descriptor_tmp_21_1;
    xpc_listener_t v10 = listener;
    dispatch_async(v6, &v7);
  }

  os_unfair_lock_unlock(v2);
}

os_log_t ___xpc_listener_log_handle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.xpc", "listener");
  _xpc_listener_log_handle__log = (uint64_t)result;
  return result;
}

void ___xpc_listener_setup_connection_handlers_block_invoke(uint64_t a1, __objc2_class **a2)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  uint64_t v3 = *(void *)(a1 + 32);
  if (_xpc_listener_get_state((os_unfair_lock_s *)v3) != 2)
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    __int128 v7 = (os_log_s *)_xpc_listener_log_handle__log;
    if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)mach_port_options_t buf = 134217984;
    uint64_t v25 = v3;
    __int128 v8 = "[%p] Received event on inactive Listener";
LABEL_26:
    _os_log_impl(&dword_180150000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    return;
  }

  if (a2 == &_xpc_error_connection_invalid)
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    __int128 v7 = (os_log_s *)_xpc_listener_log_handle__log;
    if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)mach_port_options_t buf = 134217984;
    uint64_t v25 = v3;
    __int128 v8 = "[%p] Connection invalidation received";
    goto LABEL_26;
  }

  if (a2 != &_xpc_error_connection_interrupted)
  {
    if (xpc_get_type(a2) != (xpc_type_t)&OBJC_CLASS___OS_xpc_connection)
    {
      int v4 = xpc_copy_description(a2);
      if (_xpc_listener_log_handle__once != -1) {
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      }
      uint64_t v5 = (os_log_s *)_xpc_listener_log_handle__log;
      if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)mach_port_options_t buf = 134218242;
      uint64_t v25 = v3;
      __int16 v26 = 2080;
      int v27 = v4;
      uint64_t v6 = "[%p] Received object of unsupported type: %s";
LABEL_10:
      _os_log_impl(&dword_180150000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x16u);
LABEL_34:
      free(v4);
      return;
    }

    if (!a2) {
      return;
    }
    xpc_rich_error_t error = 0LL;
    __int128 v9 = (void *)_xpc_session_create_with_connection( (_xpc_connection_s *)a2,  *(dispatch_queue_s **)(v3 + 40),  1,  1,  (xpc_object_t *)&error);
    if (error)
    {
      int v4 = xpc_rich_error_copy_description(error);
      if (_xpc_listener_log_handle__once != -1) {
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      }
      uint64_t v5 = (os_log_s *)_xpc_listener_log_handle__log;
      if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)mach_port_options_t buf = 134218242;
      uint64_t v25 = v3;
      __int16 v26 = 2080;
      int v27 = v4;
      uint64_t v6 = "[%p] Error creating session for incoming peer: %s";
      goto LABEL_10;
    }

    uint64_t v10 = *(void *)(v3 + 16);
    if (!v10) {
      ___xpc_listener_setup_connection_handlers_block_invoke_cold_1();
    }
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    xpc_rich_error_t v23 = 0LL;
    int v11 = _xpc_session_activate_if_new((uint64_t)v9, (xpc_object_t *)&v23);
    if (v23)
    {
      __int128 v12 = xpc_rich_error_copy_description(v23);
      if (_os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_listener_log_handle__once != -1) {
          dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
        }
        uint64_t v13 = (os_log_s *)_xpc_listener_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)mach_port_options_t buf = 134218242;
          uint64_t v25 = v3;
          __int16 v26 = 2080;
          int v27 = v12;
          _os_log_impl(&dword_180150000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Error activating session: %s", buf, 0x16u);
        }
      }

      free(v12);
      goto LABEL_44;
    }

    switch(v11)
    {
      case 1:
LABEL_44:
        xpc_release(v9);
        return;
      case 5:
        int is_extracted = _xpc_session_is_extracted((uint64_t)v9);
        int inited = _os_trace_lazy_init_completed_4libxpc();
        if (is_extracted)
        {
          if (!inited) {
            goto LABEL_44;
          }
          if (_xpc_listener_log_handle__once != -1) {
            dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
          }
          uint64_t v14 = _xpc_listener_log_handle__log;
          if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_44;
          }
          *(_DWORD *)mach_port_options_t buf = 134217984;
          uint64_t v25 = v3;
          uint64_t v15 = "[%p] Peer session extracted";
        }

        else
        {
          if (!inited) {
            goto LABEL_44;
          }
          if (_xpc_listener_log_handle__once != -1) {
            dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
          }
          uint64_t v14 = _xpc_listener_log_handle__log;
          if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_44;
          }
          *(_DWORD *)mach_port_options_t buf = 134217984;
          uint64_t v25 = v3;
          uint64_t v15 = "[%p] Peer session rejected";
        }

        break;
      case 3:
        if (_xpc_listener_log_handle__once != -1) {
          dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
        }
        uint64_t v14 = _xpc_listener_log_handle__log;
        if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)mach_port_options_t buf = 134217984;
        uint64_t v25 = v3;
        uint64_t v15 = "[%p] Peer session explicitly activated";
        break;
      default:
        if (_xpc_listener_log_handle__once != -1) {
          dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
        }
        uint64_t v18 = _xpc_listener_log_handle__log;
        if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        uint64_t v19 = _xpc_session_string_for_state(v11);
        *(_DWORD *)mach_port_options_t buf = 134218242;
        uint64_t v25 = v3;
        __int16 v26 = 2080;
        int v27 = (void *)v19;
        uint64_t v15 = "[%p] Unexpected peer session state: %s";
        uint64_t v20 = (os_log_s *)v18;
        uint32_t v21 = 22;
        goto LABEL_70;
    }

    uint64_t v20 = (os_log_s *)v14;
    uint32_t v21 = 12;
LABEL_70:
    _os_log_impl(&dword_180150000, v20, OS_LOG_TYPE_DEFAULT, v15, buf, v21);
    goto LABEL_44;
  }

  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1) {
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    }
    __int128 v7 = (os_log_s *)_xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)mach_port_options_t buf = 134217984;
      uint64_t v25 = v3;
      __int128 v8 = "[%p] Connection interruption received";
      goto LABEL_26;
    }
  }

uint64_t ___xpc_listener_cancel_locked_block_invoke_20(uint64_t a1)
{
  return _xpc_release(*(void *)(a1 + 32));
}

uint64_t _xpc_try_mach_port_construct( mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  uint64_t v6 = (ipc_space_t *)MEMORY[0x1895FFD48];
  do
  {
    uint64_t v7 = mach_port_construct(*v6, options, context, name);
    uint64_t v8 = v7;
    BOOL v9 = (_DWORD)v7 == 6 || (_DWORD)v7 == 3;
  }

  while (v9 && _waiting4memory());
  return v8;
}

uint64_t _xpc_mach_port_construct(mach_port_options_t *a1, mach_port_context_t a2)
{
  mach_port_name_t name = 0;
  int v2 = _xpc_try_mach_port_construct(a1, a2, &name);
  if (v2) {
    _xpc_mach_port_construct_cold_1(v2);
  }
  return name;
}

uint64_t _xpc_mach_port_allocate(uint32_t a1, mach_port_msgcount_t a2, mach_port_context_t a3)
{
  v4.uint32_t flags = a1;
  v4.mpl.mpl_qlimit = a2;
  v4.reserved[0] = 0LL;
  v4.reserved[1] = 0LL;
  return _xpc_mach_port_construct(&v4, a3);
}

uint64_t _xpc_mach_port_guard(mach_port_name_t name, BOOLean_t strict, mach_port_context_t a3)
{
  return mach_port_guard(*MEMORY[0x1895FFD48], name, a3, strict);
}

uint64_t _xpc_mach_port_make_send(mach_port_name_t name)
{
  return mach_port_insert_right(*MEMORY[0x1895FFD48], name, name, 0x14u);
}

uint64_t _xpc_mach_port_retain_send(mach_port_name_t name)
{
  return mach_port_mod_refs(*MEMORY[0x1895FFD48], name, 0, 1);
}

uint64_t _xpc_mach_port_try_retain_send(uint64_t name)
{
  kern_return_t v2;
  uint64_t v1 = name;
  int v2 = mach_port_mod_refs(*MEMORY[0x1895FFD48], name, 0, 1);
  if (v2)
  {
    if (v2 != 15 && v2 != 17) {
      _os_assumes_log();
    }
    return 0xFFFFFFFFLL;
  }

  return v1;
}

uint64_t _xpc_mach_port_release(mach_port_name_t name)
{
  return mach_port_deallocate(*MEMORY[0x1895FFD48], name);
}

uint64_t _xpc_mach_port_close_recv( mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return mach_port_destruct(*MEMORY[0x1895FFD48], name, srdelta, guard);
}

uint64_t _xpc_mach_port_cleanup_right(mach_port_name_t name, int a2)
{
  if (name - 1 > 0xFFFFFFFD) {
    return 0LL;
  }
  if (a2 == 16) {
    return mach_port_destruct(*MEMORY[0x1895FFD48], name, 0, 0LL);
  }
  else {
    return 0LL;
  }
}

mach_port_context_t _xpc_mach_port_get_context(mach_port_name_t name)
{
  mach_port_context_t context = 0LL;
  if (mach_port_get_context(*MEMORY[0x1895FFD48], name, &context)) {
    _xpc_mach_port_get_context_cold_1();
  }
  return context;
}

uint64_t _xpc_mach_port_set_queue_limit(uint64_t a1, int a2)
{
  int v3 = a2;
  return MEMORY[0x186DF6E9C](*MEMORY[0x1895FFD48], a1, 1LL, &v3, 1LL);
}

uint64_t _xpc_mach_port_setup_port_destroyed( mach_port_name_t name, mach_port_t notify, mach_port_t *previous)
{
  if (notify) {
    mach_msg_type_name_t v3 = 21;
  }
  else {
    mach_msg_type_name_t v3 = 18;
  }
  return mach_port_request_notification(*MEMORY[0x1895FFD48], name, 69, 0, notify, v3, previous);
}

uint64_t _xpc_mach_port_setup_no_more_senders( mach_port_name_t name, mach_port_t notify, mach_port_t *previous)
{
  if (notify) {
    mach_msg_type_name_t v3 = 21;
  }
  else {
    mach_msg_type_name_t v3 = 18;
  }
  return mach_port_request_notification(*MEMORY[0x1895FFD48], name, 70, 0, notify, v3, previous);
}

uint64_t _xpc_mach_msg_get_context(uint64_t a1)
{
  return *(void *)(a1 + ((*(unsigned int *)(a1 + 4) + 3LL) & 0x1FFFFFFFCLL) + 52);
}

uint64_t _xpc_mach_msg_get_audit_token(uint64_t a1)
{
  return a1 + ((*(unsigned int *)(a1 + 4) + 3LL) & 0x1FFFFFFFCLL) + 20;
}

uint64_t _xpc_get_self_audit_token()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if (*(_BYTE *)(v0 + 41))
  {
    if (*(void *)(v0 + 48) != -1LL) {
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)_fetch_self_token);
    }
  }

  else
  {
    _fetch_self_token((task_info_t)(v0 + 56));
  }

  return v0 + 56;
}

uint64_t _fetch_self_token(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1895FFD48], 0xFu, task_info_out, &task_info_outCnt)) {
    _fetch_self_token_cold_1();
  }
  integer_t v2 = task_info_out[5];
  uint64_t result = getpid();
  if (v2 != (_DWORD)result || !task_info_out[7]) {
    _fetch_self_token_cold_1();
  }
  return result;
}

uint64_t _xpc_fileport_makeport()
{
  LODWORD(result) = fileport_makeport();
  if ((_DWORD)result == -1) {
    LODWORD(result) = *__error();
  }
  if ((_DWORD)result == 35) {
    return 12LL;
  }
  else {
    return result;
  }
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_assert_log();
}

uint64_t _xpc_dict_copy_sorted_keys(void *a1)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  xpc_object_t empty = 0LL;
  xpc_object_t empty = xpc_array_create_empty();
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = ___xpc_dict_copy_sorted_keys_block_invoke;
  applier[3] = &unk_18962A7D8;
  applier[4] = &v12;
  xpc_dictionary_apply(a1, applier);
  size_t count = xpc_array_get_count((xpc_object_t)v13[3]);
  do
  {
    if (count < 2) {
      break;
    }
    size_t v3 = 0LL;
    for (size_t i = 1LL; i != count; ++i)
    {
      xpc_object_t value = xpc_array_get_value((xpc_object_t)v13[3], i - 1);
      xpc_object_t v6 = xpc_array_get_value((xpc_object_t)v13[3], i);
      string_ptr = xpc_string_get_string_ptr(value);
      uint64_t v8 = xpc_string_get_string_ptr(v6);
      if (strcmp(string_ptr, v8) >= 1)
      {
        xpc_retain(value);
        xpc_array_set_value((xpc_object_t)v13[3], i - 1, v6);
        xpc_array_set_value((xpc_object_t)v13[3], i, value);
        xpc_release(value);
        size_t v3 = i;
      }
    }

    size_t count = v3;
  }

  while (v3);
  uint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t ___xpc_dict_copy_sorted_keys_block_invoke(uint64_t a1, char *string)
{
  return 1LL;
}

xpc_object_t xpc_create_lwcr_dictionary(int64_t a1, int64_t a2, xpc_object_t object)
{
  if (object && xpc_get_type(object) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return 0LL;
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "vers", a1);
  xpc_dictionary_set_int64(empty, "comp", 1LL);
  xpc_dictionary_set_int64(empty, "ccat", a2);
  if (object) {
    xpc_dictionary_set_value(empty, "reqs", object);
  }
  return empty;
}

size_t xpc_create_data_from_lwcr_dictionary(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
    return 0LL;
  }
  xpc_object_t empty = xpc_array_create_empty();
  if (serialize_xpc_dict(a1, empty))
  {
    xpc_release(empty);
    return 0LL;
  }

  if (!empty) {
    return 0LL;
  }
  size_t result = xpc_array_get_count(empty);
  if (!(result >> 59))
  {
    uint64_t v5 = (void **)_xpc_alloc(32 * result);
    length[0] = MEMORY[0x1895FED80];
    length[1] = 0x40000000LL;
    length[2] = (size_t)__convert_xpc_array_to_ce_elem_array_block_invoke;
    length[3] = (size_t)&__block_descriptor_tmp_12_0;
    length[4] = (size_t)v5;
    xpc_array_apply(empty, length);
    size_t count = xpc_array_get_count(empty);
    length[0] = 0LL;
    xpc_object_t v3 = 0LL;
    if (CESizeSerialization(v5, count, (uint64_t *)length) == (void *)&Errors)
    {
      uint64_t v7 = _xpc_alloc(length[0]);
      char v12 = 1;
      if ((_UNKNOWN *)CESerializeWithOptions( (uint64_t)&_CERuntimeImpl,  &v12,  (unint64_t)v5,  count,  (unsigned __int8 *)v7,  (unsigned __int8 *)v7 + length[0]) == &Errors) {
        xpc_object_t v3 = xpc_data_create(v7, length[0]);
      }
      else {
        xpc_object_t v3 = 0LL;
      }
      free(v7);
    }

    size_t v8 = xpc_array_get_count(empty);
    if (v8)
    {
      size_t v9 = v8;
      uint64_t v10 = v5 + 1;
      do
      {
        v10 += 4;
        --v9;
      }

      while (v9);
    }

    free(v5);
    xpc_release(empty);
    return (size_t)v3;
  }

  __break(1u);
  return result;
}

xpc_object_t xpc_create_lwcr_query_for_validation_category(int *a1, uint64_t a2)
{
  xpc_object_t empty = xpc_array_create_empty();
  for (xpc_object_t i = xpc_dictionary_create_empty(); a2; --a2)
  {
    int64_t v6 = *a1++;
    xpc_array_set_int64(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
  }

  xpc_dictionary_set_value(i, "$in", empty);
  xpc_release(empty);
  return i;
}

uint64_t serialize_xpc_dict(void *a1, void *a2)
{
  uint64_t v8 = 0LL;
  size_t v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  int v11 = 4;
  mach_port_options_t v4 = (void *)_xpc_dict_copy_sorted_keys(a1);
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t bytes = 7LL;
  uint64_t v13 = 0LL;
  xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = __serialize_xpc_dict_block_invoke;
  applier[3] = &unk_18962A800;
  void applier[5] = a2;
  applier[6] = a1;
  applier[4] = &v8;
  xpc_array_apply(v4, applier);
  xpc_release(v4);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  if (!(_DWORD)v5)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    uint64_t bytes = 8LL;
    uint64_t v13 = 0LL;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    uint64_t v5 = *((unsigned int *)v9 + 6);
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __serialize_xpc_dict_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t bytes = 5LL;
  uint64_t v16 = 0LL;
  xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  string_ptr = xpc_string_get_string_ptr(a3);
  v12[3] = 0LL;
  v12[0] = 3LL;
  v12[1] = _xpc_strdup(string_ptr);
  v12[2] = xpc_string_get_length(a3);
  xpc_array_set_data(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v12, 0x20uLL);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = xpc_string_get_string_ptr(a3);
  xpc_object_t value = xpc_dictionary_get_value(v7, v8);
  if (value)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = serialize_xpc_object(value, *(void **)(a1 + 40));
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      uint64_t bytes = 0LL;
      uint64_t v16 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        uint64_t bytes = 0LL;
        uint64_t v16 = 0LL;
      }

      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }

      else
      {
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
      }

      xpc_string_get_string_ptr(a3);
      _os_log_simple();
      return 0LL;
    }

    else
    {
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t bytes = 6LL;
      uint64_t v16 = 0LL;
      xpc_array_set_data(v10, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      return 1LL;
    }
  }

  else
  {
    uint64_t bytes = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      uint64_t bytes = 0LL;
      uint64_t v16 = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      _dyld_get_shared_cache_range();
    }

    else
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
    }

    xpc_string_get_string_ptr(a3);
    _os_log_simple();
    uint64_t result = 0LL;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 2;
  }

  return result;
}

uint64_t serialize_xpc_object(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  launch_data_type_t type = (__objc2_class *)xpc_get_type(a1);
  if (type == &OBJC_CLASS___OS_xpc_string)
  {
    uint64_t v16 = 0LL;
    uint64_t bytes = 2LL;
    int64_t string_ptr = (int64_t)xpc_string_get_string_ptr(a1);
    size_t length = xpc_string_get_length(a1);
LABEL_12:
    uint64_t v15 = (BOOL (*)(uint64_t, uint64_t, uint64_t))length;
LABEL_16:
    LOBYTE(v16) = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    return 0LL;
  }

  uint64_t v5 = (const _xpc_type_s *)type;
  if (type == &OBJC_CLASS___OS_xpc_int64)
  {
    uint64_t bytes = 4LL;
    uint64_t v16 = 0LL;
    int64_t string_ptr = xpc_int64_get_value(a1);
LABEL_15:
    uint64_t v15 = 0LL;
    goto LABEL_16;
  }

  if (type == &OBJC_CLASS___OS_xpc_BOOL)
  {
    uint64_t bytes = 1LL;
    uint64_t v16 = 0LL;
    int64_t string_ptr = xpc_BOOL_get_value(a1);
    goto LABEL_15;
  }

  if (type == &OBJC_CLASS___OS_xpc_data)
  {
    uint64_t v16 = 0LL;
    uint64_t bytes = 9LL;
    int64_t string_ptr = (int64_t)xpc_data_get_bytes_ptr(a1);
    size_t length = xpc_data_get_length(a1);
    goto LABEL_12;
  }

  if (type != &OBJC_CLASS___OS_xpc_dictionary)
  {
    if (type == &OBJC_CLASS___OS_xpc_array)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2000000000LL;
      int v12 = 4;
      uint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
      uint64_t bytes = 5LL;
      int64_t string_ptr = 0LL;
      xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      uint64_t bytes = MEMORY[0x1895FED80];
      int64_t string_ptr = 0x40000000LL;
      uint64_t v15 = __serialize_xpc_array_block_invoke;
      uint64_t v16 = &unk_18962A828;
      uint64_t v17 = &v9;
      uint64_t v18 = a2;
      xpc_array_apply(a1, &bytes);
      uint64_t v7 = *((unsigned int *)v10 + 6);
      if (!(_DWORD)v7)
      {
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v19 = 6LL;
        uint64_t v20 = 0LL;
        xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &v19, 0x20uLL);
        uint64_t v7 = *((unsigned int *)v10 + 6);
      }

      _Block_object_dispose(&v9, 8);
    }

    else
    {
      uint64_t bytes = 0LL;
      int64_t string_ptr = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        uint64_t bytes = 0LL;
        int64_t string_ptr = 0LL;
      }

      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        uint64_t v9 = 0LL;
        _dyld_get_shared_cache_range();
      }

      else
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = 0LL;
      }

      xpc_type_get_name(v5);
      _os_log_simple();
      return 1LL;
    }

    return v7;
  }

  return serialize_xpc_dict(a1, a2);
}

BOOL __serialize_xpc_array_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = serialize_xpc_object(a3, *(void *)(a1 + 40));
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0;
}

uint64_t __convert_xpc_array_to_ce_elem_array_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t xdata)
{
  xpc_object_t v3 = (_OWORD *)(*(void *)(a1 + 32) + 32 * a2);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  __int128 v5 = bytes_ptr[1];
  *xpc_object_t v3 = *bytes_ptr;
  v3[1] = v5;
  return 1LL;
}

char *os_transaction_copy_description(uint64_t a1)
{
  char v1 = *(_BYTE *)(a1 + 48);
  integer_t v2 = (const char *)(a1 + 56);
  if ((v1 & 2) != 0) {
    integer_t v2 = *(const char **)v2;
  }
  return strdup(v2);
}

uint64_t os_transaction_get_description(uint64_t a1)
{
  char v1 = *(_BYTE *)(a1 + 48);
  uint64_t result = a1 + 56;
  if ((v1 & 2) != 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t os_transaction_get_timestamp(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t os_transaction_get_ra(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void _xpc_os_transaction_dispose(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 48) & 1) == 0)
  {
    mach_port_options_t v4 = _xpc_asprintf("Over-release of a transaction object.");
    _xpc_api_misuse(v4);
  }

  *(_BYTE *)(a1 + 48) &= ~1u;
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    integer_t v2 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    integer_t v2 = (os_unfair_lock_s *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3) {
    *(void *)(v3 + 24) = *(void *)(a1 + 24);
  }
  **(void **)(a1 + 24) = v3;
  *(void *)(a1 + 16) = -1LL;
  *(void *)(a1 + 24) = -1LL;
  _xpc_transaction_end_impl((uint64_t)v2);
  os_unfair_lock_unlock(v2 + 44);
}

uint64_t _xpc_transaction_end_impl(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a1 + 172) = v1 - 1;
  if (v1 <= 0)
  {
    __int128 v5 = _xpc_asprintf("Underflow of transaction count.");
    _xpc_api_misuse(v5);
  }

  _xpc_ktrace_pid1();
  uint64_t result = *(unsigned int *)(a1 + 172);
  if (v1 == 1 && *(_BYTE *)(a1 + 168))
  {
    pid_t v4 = getpid();
    proc_set_dirty(v4, 0);
    uint64_t result = _xpc_ktrace_pid0();
    if (*(_BYTE *)(a1 + 170)) {
      _exit(0);
    }
  }

  return result;
}

uint64_t os_transaction_create(const char *a1)
{
  size_t v3 = strlen(a1);
  char is_memory_immutable = _dyld_is_memory_immutable();
  if (v3 + 1 < 0x1C8) {
    size_t v5 = v3 + 1;
  }
  else {
    size_t v5 = 456LL;
  }
  uint64_t v6 = _xpc_os_transaction_alloc();
  uint64_t v7 = v6;
  if ((is_memory_immutable & 1) != 0 || !v5)
  {
    char v8 = *(_BYTE *)(v6 + 48) | 2;
    *(void *)(v6 + 56) = a1;
  }

  else
  {
    strlcpy((char *)(v6 + 56), a1, v5);
    char v8 = *(_BYTE *)(v7 + 48);
  }

  *(_BYTE *)(v7 + 48) = v8 | 1;
  *(void *)(v7 + 40) = v1;
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v9 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v9 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v10 = *(void *)(v9 + 184);
  *(void *)(v7 + 16) = v10;
  if (v10) {
    *(void *)(v10 + 24) = v7 + 16;
  }
  *(void *)(v9 + 184) = v7;
  *(void *)(v7 + 24) = v9 + 184;
  _xpc_transaction_begin_impl(v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 176));
  *(void *)(v7 + 32) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  return v7;
}

void _xpc_transaction_begin_impl(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a1 + 172) = v1 + 1;
  if (v1 == -1)
  {
    pid_t v4 = _xpc_asprintf("Underflow of transaction count.");
    _xpc_api_misuse(v4);
  }

  _xpc_ktrace_pid1();
  if (_sigterm_deferred_initialization == 1 && _xpc_is_multithreaded())
  {
    _sigterm_deferred_initialization = 0;
    _sigterm_queue = (uint64_t)dispatch_queue_create("com.apple.xpc.transaction.sigterm", 0LL);
    _sigterm_source = (uint64_t)dispatch_source_create( MEMORY[0x1895FE830],  0xFuLL,  0LL,  (dispatch_queue_t)_sigterm_queue);
    dispatch_source_set_event_handler_f( (dispatch_source_t)_sigterm_source,  (dispatch_function_t)_xpc_transaction_sigterm_handler);
    dispatch_resume((dispatch_object_t)_sigterm_source);
  }

  if (v1 <= 0)
  {
    if (*(_BYTE *)(a1 + 168))
    {
      pid_t v3 = getpid();
      proc_set_dirty(v3, 1);
      _xpc_ktrace_pid0();
    }
  }

void _xpc_transaction_begin()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = (os_unfair_lock_s *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  _xpc_transaction_begin_impl((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 44);
}

void _xpc_transaction_end()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = (os_unfair_lock_s *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  _xpc_transaction_end_impl((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 44);
}

void xpc_track_activity()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if (*(_BYTE *)(v0 + 169))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 176));
  }

  else
  {
    *(_BYTE *)(v0 + 169) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 176));
    if (*(_BYTE *)(v0 + 192)) {
      uint32_t v1 = 19;
    }
    else {
      uint32_t v1 = 7;
    }
    pid_t v2 = getpid();
    if ((proc_track_dirty(v2, v1) | 0x10) != 0x10) {
      _xpc_alloc_cold_1();
    }
    xpc_transactions_enable();
  }

void xpc_transactions_enable()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if (!*(_BYTE *)(v0 + 168))
  {
    if (!*(_BYTE *)(v0 + 169))
    {
      pid_t v1 = getpid();
      proc_track_dirty(v1, 1u);
    }

    *(_BYTE *)(v0 + 168) = 1;
    if (*(_DWORD *)(v0 + 172))
    {
      pid_t v2 = getpid();
      proc_set_dirty(v2, 1);
    }

    _sigterm_deferred_initialization = 1;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 176));
}

uint64_t xpc_transaction_try_exit_clean()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(os_unfair_lock_s **)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = (os_unfair_lock_s *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  if (!v0[43]._os_unfair_lock_opaque) {
    _exit(0);
  }
  os_unfair_lock_unlock(v0 + 44);
  _os_transaction_log_active("while trying to exit cleanly");
  return 0LL;
}

void _os_transaction_log_active(void *a1)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  if (_xpc_transaction_log_pred != -1) {
    dispatch_once(&_xpc_transaction_log_pred, &__block_literal_global_6);
  }
  pid_t v2 = (os_log_s *)_xpc_transaction_log__log;
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v4 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v4 = _os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  uint64_t v5 = *(void *)(v4 + 184);
  if (v5)
  {
    int v6 = 0;
    uint64_t v7 = *(void *)(v4 + 184);
    do
    {
      ++v6;
      uint64_t v7 = *(void *)(v7 + 16);
    }

    while (v7);
  }

  else
  {
    int v6 = 0;
  }

  int v8 = *(_DWORD *)(v4 + 172);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)mach_port_options_t buf = 136316162;
    uint64_t v9 = ", list follows";
    uint64_t v13 = a1;
    __int16 v14 = 1024;
    if (!v6) {
      uint64_t v9 = (const char *)&unk_18018902B;
    }
    *(_DWORD *)uint64_t v15 = v8;
    *(_WORD *)&_OWORD v15[4] = 1024;
    *(_DWORD *)&v15[6] = v6;
    __int16 v16 = 1024;
    int v17 = v8 - v6;
    __int16 v18 = 2080;
    uint64_t v19 = v9;
    _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "Remaining transactions %s: %d (%d os_transaction + %d xpc_transaction_begin)%s",  buf,  0x28u);
    uint64_t v5 = *(void *)(v4 + 184);
  }

  for (; v5; uint64_t v5 = *(void *)(v5 + 16))
  {
    uint64_t v10 = (void *)(v5 + 56);
    if ((*(_BYTE *)(v5 + 48) & 2) != 0) {
      uint64_t v10 = (void *)*v10;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __uint64_t v11 = v3 - *(void *)(v5 + 32);
      *(_DWORD *)mach_port_options_t buf = 136446466;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      *(void *)uint64_t v15 = v11 / 0x3B9ACA00;
      _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "os_transaction: '%{public}s', created %llu sec ago",  buf,  0x16u);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 176));
}

void xpc_transaction_exit_clean()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  pid_t v1 = (os_unfair_lock_s *)(v0 + 176);
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(v0 + 170) = 1;
  if (!*(_DWORD *)(v0 + 172)) {
    _exit(0);
  }
  if ((*(_BYTE *)(v0 + 9) & 4) != 0)
  {
    xpc_object_t request = _service_create_request();
    xpc_dictionary_set_BOOL(request, "yesno", 1);
    xpc_object_t object = 0LL;
    int v3 = _xpc_service_routine(715LL, request, &object);
    if (v3 != 124)
    {
      if (v3) {
        _os_assumes_log();
      }
      else {
        xpc_release(object);
      }
    }

    xpc_release(request);
  }

  os_unfair_lock_unlock(v1);
}

xpc_object_t _service_create_request()
{
  xpc_object_t v0 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v0, "type", 6uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0LL);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  return v0;
}

void xpc_transaction_interrupt_clean_exit()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  pid_t v1 = (os_unfair_lock_s *)(v0 + 176);
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(v0 + 170) = 0;
  if ((*(_BYTE *)(v0 + 9) & 4) != 0)
  {
    xpc_object_t request = _service_create_request();
    xpc_dictionary_set_BOOL(request, "yesno", 0);
    xpc_object_t object = 0LL;
    int v3 = _xpc_service_routine(715LL, request, &object);
    if (v3 != 124 && v3 != 37)
    {
      if (v3) {
        _os_assumes_log();
      }
      else {
        xpc_release(object);
      }
    }

    xpc_release(request);
  }

  os_unfair_lock_unlock(v1);
}

uint64_t os_transaction_needs_more_time()
{
  return 0LL;
}

void _xpc_transaction_sigterm_handler()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  pid_t v1 = (os_unfair_lock_s *)(v0 + 176);
  os_unfair_lock_lock_with_options();
  dispatch_source_cancel((dispatch_source_t)_sigterm_source);
  dispatch_release((dispatch_object_t)_sigterm_source);
  pid_t v2 = dispatch_source_create(MEMORY[0x1895FE838], 0LL, 0LL, (dispatch_queue_t)_sigterm_queue);
  dispatch_release((dispatch_object_t)_sigterm_queue);
  os_unfair_lock_unlock(v1);
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX) + 30000000000LL;
  dispatch_time_t v4 = dispatch_time(0LL, 500000000LL);
  dispatch_source_set_timer(v2, v4, 0x1DCD6500uLL, 0xEE6B280uLL);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = ___xpc_transaction_sigterm_handler_block_invoke;
  void v5[3] = &__block_descriptor_tmp_9;
  _BYTE v5[4] = v3;
  void v5[5] = v2;
  dispatch_source_set_event_handler(v2, v5);
  dispatch_resume(v2);
}

void ___xpc_transaction_sigterm_handler_block_invoke(uint64_t a1)
{
  if (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX) >= *(void *)(a1 + 32))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }

os_log_t ___xpc_transaction_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.xpc.transaction", "all");
  _xpc_transaction_log__log = (uint64_t)result;
  return result;
}

uint64_t _xpc_bundle_resolve_path_variant(const char *a1)
{
  if (access(a1, 5)) {
    return 3LL;
  }
  int v3 = open(a1, 0);
  if (v3 == -1)
  {
    uint64_t v2 = 3LL;
    goto LABEL_13;
  }

  int v4 = v3;
  if (v3 < 0) {
    return 3LL;
  }
  uint64_t v5 = 0LL;
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  int v8 = ___xpc_bundle_resolve_path_variant_block_invoke;
  uint64_t v9 = &__block_descriptor_tmp_10;
  int v10 = v3;
  while (!((unsigned int (*)(void *, char *))v8)(v7, (&off_18962A928)[v5]))
  {
    v5 += 2LL;
    if (v5 == 6)
    {
      uint64_t v2 = 3LL;
      goto LABEL_10;
    }
  }

  uint64_t v2 = LODWORD((&off_18962A928)[v5 + 1]);
LABEL_10:
  if (close(v4) == -1)
  {
LABEL_13:
    __error();
    _os_assumes_log();
  }

  return v2;
}

BOOL ___xpc_bundle_resolve_path_variant_block_invoke(uint64_t a1, const char *a2)
{
  int v2 = fstatat(*(_DWORD *)(a1 + 32), a2, &v6, 0);
  if (v2)
  {
    int v3 = *__error();
    if (v2 == -1 && v3 != 2) {
      _xpc_fd_desc_cold_1();
    }
  }

  return v2 == 0;
}

uint64_t _xpc_bundle_resolve_executable_variant(const char *a1)
{
  pid_t v1 = _xpc_strdup(a1);
  int v2 = strrchr(v1, 47);
  if (v2) {
    *int v2 = 0;
  }
  uint64_t v3 = 0LL;
  while (!_xpc_has_suffix(v1, (&off_18962A8E8)[v3]))
  {
    v3 += 2LL;
    if (v3 == 8) {
      goto LABEL_8;
    }
  }

  uint64_t v4 = LODWORD((&off_18962A8E8)[v3 + 1]);
  if ((_DWORD)v4 != 2) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v5 = strrchr(v1, 47);
  if (v5) {
    *uint64_t v5 = 0;
  }
  if (_xpc_has_suffix(v1, "Versions")) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
LABEL_13:
  free(v1);
  return v4;
}

char *_xpc_bundle_copy_container(unsigned int a1, const char *a2)
{
  if (a1 == 3) {
    _xpc_rich_error_serialize_cold_1();
  }
  uint64_t v3 = _xpc_strdup(a2);
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v5 = a1 > 2 ? 0LL : qword_180188290[a1];
    if (i >= v5) {
      break;
    }
    stat v6 = strrchr(v3, 47);
    if (v6) {
      *stat v6 = 0;
    }
  }

  return v3;
}

char *_xpc_bundle_variant_create_subpath(_BYTE *a1, unsigned int a2, int a3, uint64_t a4)
{
  if (a2 == 3) {
    _xpc_rich_error_serialize_cold_1();
  }
  switch(a3)
  {
    case 0:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2];
      goto LABEL_13;
    case 1:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 1];
      goto LABEL_13;
    case 2:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 2];
      goto LABEL_13;
    case 3:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 3];
      goto LABEL_13;
    case 4:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 4];
      goto LABEL_13;
    case 5:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 7];
      goto LABEL_13;
    case 6:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 5];
      goto LABEL_13;
    case 7:
      uint64_t v4 = &off_18962A958[8 * (unint64_t)a2 + 6];
LABEL_13:
      unint64_t v5 = *v4;
      if (a1) {
        goto LABEL_14;
      }
      goto LABEL_17;
    default:
      unint64_t v5 = 0LL;
      if (!a1) {
        goto LABEL_17;
      }
LABEL_14:
      if (*a1)
      {
        if (!v5)
        {
LABEL_21:
          if (a4) {
            return _xpc_asprintf("%s%s%s%s%s");
          }
          return _xpc_asprintf("%s%s%s");
        }
      }

      else
      {
LABEL_17:
        if (!v5) {
          goto LABEL_21;
        }
      }

      if (!*v5) {
        goto LABEL_21;
      }
      if (!a4) {
        return _xpc_asprintf("%s%s%s");
      }
      return _xpc_asprintf("%s%s%s%s%s");
  }

char *_xpc_bundle_resolve_executable_name(const char *a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, "CFBundleExecutable");
  if (string) {
    return _xpc_strdup(string);
  }
  string = xpc_dictionary_get_string(xdict, "NSExecutable");
  if (string) {
    return _xpc_strdup(string);
  }
  stat v6 = _xpc_strdup(a1);
  uint64_t v7 = strrchr(v6, 47);
  if (v7 == v6)
  {
    free(v6);
    int v8 = _xpc_strdup(a1 + 1);
  }

  else
  {
    if (v7[1])
    {
      int v8 = _xpc_strdup(v7 + 1);
    }

    else
    {
      uint64_t v9 = v7 + 2;
      do
      {
        int v10 = *(v9 - 2);
        --v9;
      }

      while (v10 == 47);
      *uint64_t v9 = 0;
      __uint64_t v11 = strrchr(v6, 47);
      int v8 = strdup(v11 + 1);
      *uint64_t v9 = 47;
    }

    free(v6);
  }

  if (v8)
  {
    int v12 = strrchr(v8, 46);
    if (v12) {
      *int v12 = 0;
    }
  }

  return v8;
}

BOOL _xpc_bundle_is_valid_variant(unsigned int a1)
{
  return a1 < 3;
}

uint64_t _xpc_is_being_debugged()
{
  if (_xpc_is_being_debugged_pred != -1) {
    dispatch_once(&_xpc_is_being_debugged_pred, &__block_literal_global_7);
  }
  return _xpc_is_being_debugged_is_being_debugged;
}

uint64_t ___xpc_is_being_debugged_block_invoke()
{
  pid_t v0 = getpid();
  uint64_t result = _xpc_pid_is_being_debugged(v0);
  _xpc_is_being_debugged_is_being_debugged = result;
  return result;
}

uint64_t _xpc_pid_is_being_debugged(int a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  memset(v2, 0, sizeof(v2));
  _os_assumes_log();
  return 0LL;
}

const char *_xpc_get_embedded_crash_message(void)
{
  return (const char *)qword_18C50BCD8;
}

void _xpc_api_misuse(const char *a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v5 = 0u;
  __int128 v6 = 0u;
  __int128 v3 = 0u;
  __int128 v4 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v2 = 0u;
  snprintf(__str, 0xA0uLL, "XPC API Misuse: %s", a1);
  qword_18C50BCD8 = (uint64_t)__str;
  __break(1u);
}

void *string_builder_new(size_t a1)
{
  if (!a1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  __int128 v2 = _xpc_alloc(0x18uLL);
  __int128 v3 = _xpc_alloc(a1);
  *__int128 v3 = 0;
  *__int128 v2 = v3;
  v2[1] = a1;
  _OWORD v2[2] = 0LL;
  return v2;
}

char *string_builder_copy_string(const char **a1)
{
  return _xpc_strdup(*a1);
}

void string_builder_destroy(void **a1)
{
}

void string_builder_appendf( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __source[0] = 0LL;
  __source[1] = &a9;
  int v10 = vasprintf(__source, a2, &a9);
  if (v10 == -1)
  {
    _xpc_fd_desc_cold_1();
    return;
  }

  uint64_t v11 = *(void *)(a1 + 16);
  BOOL v12 = __CFADD__(v11, v10);
  unint64_t v13 = v11 + v10;
  if (v12) {
    uint64_t v14 = ((uint64_t)v10 >> 63) + 1;
  }
  else {
    uint64_t v14 = (uint64_t)v10 >> 63;
  }
  uint64_t v15 = v14 << 63 >> 63;
  if (v15 != v14 || v15 < 0) {
    goto LABEL_20;
  }
  unint64_t v16 = *(void *)(a1 + 8);
  if (v16 <= v13)
  {
    if ((v13 & 0x8000000000000000LL) == 0)
    {
      size_t v18 = 2 * v13;
      if (2 * v13 < 2 * v16) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      int v17 = (char *)_xpc_alloc(2 * v13);
      free(*(void **)a1);
      *(void *)a1 = v17;
      *(void *)(a1 + 8) = v18;
      goto LABEL_13;
    }

uint64_t _xpc_services_unavailable()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  if (*(_BYTE *)v0) {
    return 1LL;
  }
  if (!*(_BYTE *)(v0 + 41)) {
    return 1LL;
  }
  unint64_t v2 = *(void *)(v0 + 8);
  if ((v2 & 0x80) != 0) {
    return 1LL;
  }
  else {
    return (v2 >> 1) & 1;
  }
}

uint64_t _xpc_runtime_get_entitlements_data()
{
  if (_xpc_runtime_get_entitlements_data_pred != -1) {
    dispatch_once(&_xpc_runtime_get_entitlements_data_pred, &__block_literal_global_8);
  }
  return _xpc_runtime_get_entitlements_data_entitlements_data;
}

xpc_object_t ___xpc_runtime_get_entitlements_data_block_invoke()
{
  uint64_t v0 = getpid();
  xpc_object_t result = _xpc_copy_entitlements_data(v0, 0LL, 16LL);
  _xpc_runtime_get_entitlements_data_entitlements_data = (uint64_t)result;
  return result;
}

uint64_t _xpc_runtime_get_self_entitlements()
{
  if (_xpc_runtime_get_self_entitlements_pred != -1) {
    dispatch_once(&_xpc_runtime_get_self_entitlements_pred, &__block_literal_global_2);
  }
  return _xpc_runtime_get_self_entitlements_entitlements;
}

uint64_t ___xpc_runtime_get_self_entitlements_block_invoke()
{
  if (_xpc_runtime_get_entitlements_data_pred != -1) {
    dispatch_once(&_xpc_runtime_get_entitlements_data_pred, &__block_literal_global_8);
  }
  if (_xpc_runtime_get_entitlements_data_entitlements_data)
  {
    pid_t v1 = 0LL;
    uint64_t v2 = 0LL;
    xpc_data_get_bytes_ptr_and_length((void *)_xpc_runtime_get_entitlements_data_entitlements_data, &v1, &v2);
    uint64_t result = xpc_create_from_ce_der(v1, v2);
  }

  else
  {
    uint64_t result = (uint64_t)xpc_dictionary_create(0LL, 0LL, 0LL);
  }

  _xpc_runtime_get_self_entitlements_entitlements = result;
  return result;
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  if (_xpc_runtime_is_app_sandboxed_pred != -1) {
    dispatch_once(&_xpc_runtime_is_app_sandboxed_pred, &__block_literal_global_4);
  }
  return _xpc_runtime_is_app_sandboxed_containerized;
}

uint64_t ___xpc_runtime_is_app_sandboxed_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895FEE08];
  bzero(v1, 0x400uLL);
  getpid();
  uint64_t result = sandbox_container_path_for_pid();
  if (!(_DWORD)result)
  {
    if (v1[0]) {
      _xpc_runtime_is_app_sandboxed_containerized = 1;
    }
  }

  return result;
}

void xpc_add_bundle(const char *a1, char a2)
{
  if ((a2 & 2) != 0) {
    uint64_t v4 = 4097LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v5, a1, v4);
  int v6 = _xpc_bootstrap_services(v5);
  if (v6 != 36 && v6 != 124 && v6) {
    _xpc_alloc_cold_1();
  }
  xpc_release(v5);
}

void xpc_add_bundles_for_domain(void *a1, void *a2)
{
  int64_t int64 = xpc_dictionary_get_int64(a1, "pid");
  if (!int64)
  {
    int v10 = _xpc_asprintf("Bogus domain object.");
    _xpc_api_misuse(v10);
  }

  uint64_t v5 = int64;
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "type", 5uLL);
  xpc_dictionary_set_uint64(v6, "handle", v5);
  xpc_dictionary_set_value(v6, "paths", a2);
  xpc_object_t object = 0LL;
  int v7 = _xpc_domain_routine(800LL, v6, &object);
  if (v7)
  {
    int v8 = v7;
    __int128 v9 = xpc_strerror(v7);
    syslog(3, "Failed to extend PID domain: %d: %s", v8, v9);
  }

  else
  {
    xpc_release(object);
  }

  xpc_release(v6);
}

size_t _xpc_spawnattr_pack_string_fragment(uint64_t a1, _DWORD *a2, void *a3, char *__src)
{
  size_t result = strlen(__src);
  *a2 += result;
  *a3 -= result;
  return result;
}

size_t _xpc_spawnattr_pack_string(uint64_t a1, _DWORD *a2, void *a3, char *__src)
{
  size_t result = strlen(__src);
  *a2 += result + 1;
  *a3 -= result + 1;
  return result;
}

const char *_xpc_spawnattr_unpack_string(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (a2 <= a3) {
    return 0LL;
  }
  __int128 v3 = (const char *)(a1 + a3 + 240);
  if (strnlen(v3, a2 - a3) + 1 <= a2 - a3) {
    return v3;
  }
  else {
    return 0LL;
  }
}

void *_xpc_spawnattr_pack_bytes(uint64_t a1, _DWORD *a2, void *a3, void *__src, size_t __n)
{
  unsigned int v5 = __n;
  size_t result = memcpy((void *)(a1 + *a2 + 240), __src, __n);
  *a2 += v5;
  *a3 -= v5;
  return result;
}

uint64_t _xpc_spawnattr_unpack_bytes(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  if (a2 - a3 >= a4) {
    uint64_t v4 = a1 + a3 + 240;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= a3) {
    return 0LL;
  }
  else {
    return v4;
  }
}

const char *_xpc_spawnattr_unpack_strings( uint64_t a1, unint64_t a2, unsigned int a3, const char **a4, uint64_t a5)
{
  if (a3 >= a2) {
    return 0LL;
  }
  uint64_t v5 = a5;
  if (!a5) {
    return *a4;
  }
  unsigned int v7 = a3;
  uint64_t v9 = a1 + 240;
  for (unint64_t i = a4; ; ++i)
  {
    uint64_t v11 = (const char *)(v9 + v7);
    size_t v12 = strnlen(v11, a2 - v7);
    if (v12 + 1 > a2 - v7) {
      break;
    }
    v7 += v12 + 1;
    _WORD *i = v11;
    if (!--v5) {
      return *a4;
    }
  }

  return 0LL;
}

uint64_t _xpc_spawnattr_binprefs_size(uint64_t a1)
{
  return 8LL * xpc_binprefs_count(a1);
}

uint64_t _xpc_spawnattr_binprefs_pack(uint64_t a1, uint64_t a2, _DWORD *a3, void *a4)
{
  unsigned int v8 = xpc_binprefs_count(a2);
  *(_DWORD *)(a1 + 32) = v8;
  uint64_t v9 = 0LL;
  if (v8)
  {
    *(_DWORD *)(a1 + 36) = *a3;
    uint64_t v10 = 8LL * (v8 - 1);
    uint64_t v11 = v8;
    size_t v12 = (_DWORD *)(*a3 + a1 + 244);
    do
    {
      *(v12 - 1) = xpc_binprefs_cpu_type(a2, v9);
      *size_t v12 = xpc_binprefs_cpu_subtype(a2, v9);
      v12 += 2;
      ++v9;
    }

    while (v11 != v9);
    uint64_t v9 = v10 + 8;
  }

  else
  {
    *(_DWORD *)(a1 + 36) = 0;
  }

  uint64_t result = xpc_binprefs_count(a2);
  *a3 += v9;
  *a4 -= v9;
  return result;
}

uint64_t _xpc_spawnattr_binprefs_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  xpc_binprefs_alloc();
  uint64_t v4 = v5;
  if (*(_DWORD *)(a1 + 32))
  {
    unint64_t v6 = 0LL;
    unsigned int v7 = (int *)(*(unsigned int *)(a1 + 36) + a1 + 244);
    do
    {
      xpc_binprefs_add(v4, *(v7 - 1), *v7);
      ++v6;
      v7 += 2;
    }

    while (v6 < *(unsigned int *)(a1 + 32));
  }

  return v4;
}

uint64_t _xpc_pipe_copy()
{
  return 0LL;
}

uint64_t _xpc_pipe_hash()
{
  return 0LL;
}

uint64_t _xpc_pipe_desc(const char *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "<%s: %p> { name = %s }", "pipe", a1, a1 + 49);
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_pipe_debug(uint64_t a1, char *__str, size_t __size)
{
  if (__size < 2) {
    return 0LL;
  }
  LODWORD(result) = snprintf(__str, __size, ", mach_port_name_t name = %s", (const char *)(a1 + 49));
  else {
    return (int)result;
  }
}

uint64_t _xpc_pipe_deserialize()
{
  return 0LL;
}

uint64_t _xpc_pipe_wire_length()
{
  return -1LL;
}

uint64_t _xpc_pipe_dispose(mach_port_context_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 32);
  if ((_DWORD)result)
  {
    mach_port_name_t v3 = *(_DWORD *)(a1 + 40);
    if (v3)
    {
    }

    uint64_t result = *(unsigned int *)(a1 + 36);
    if ((_DWORD)result)
    {
      uint64_t result = _xpc_mach_port_close_recv(result, 0, a1);
      if ((_DWORD)result) {
        return _os_assumes_log();
      }
    }
  }

  return result;
}

uint64_t _xpc_pipe_handle_mig(mach_msg_header_t *a1, mach_msg_header_t *a2, unsigned int (*a3)(void))
{
  if (!a3())
  {
    mach_msg_destroy(a2);
    return 22LL;
  }

  if ((a2->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = a2[1].msgh_remote_port;
    if (msgh_remote_port == -305)
    {
      a2->mach_port_t msgh_remote_port = 0;
    }

    else if (msgh_remote_port)
    {
      if ((a1->msgh_bits & 0x80000000) != 0)
      {
        a1->mach_port_t msgh_remote_port = 0;
        mach_msg_destroy(a1);
      }
    }
  }

  if (a2->msgh_remote_port)
  {
    uint64_t result = mach_msg(a2, 1, a2->msgh_size, 0, 0, 0, 0);
    if (!(_DWORD)result) {
      return result;
    }
    if ((_DWORD)result != 268435459)
    {
      _os_assumes_log();
      mach_msg_destroy(a2);
      return 5LL;
    }

    mach_msg_destroy(a2);
  }

  return 0LL;
}

mach_port_context_t xpc_pipe_create(char *a1, int a2)
{
  if ((a2 & 2) != 0) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }
  mach_port_name_t v5 = _xpc_pipe_bootstrap_look_up(a1, v4, 0LL);
  if (v5 - 1 > 0xFFFFFFFD) {
    return 0LL;
  }
  mach_port_name_t v6 = v5;
  mach_port_context_t v7 = _xpc_pipe_create(a1, v5, a2);
  return v7;
}

uint64_t _xpc_pipe_bootstrap_look_up(char *a1, int a2, uint64_t a3)
{
  unsigned int v8 = 0;
  uint64_t v3 = 8LL;
  if (a2 != 2) {
    uint64_t v3 = 0LL;
  }
  BOOL v4 = a2 == 3;
  if (a2 == 3) {
    int v5 = 2;
  }
  else {
    int v5 = 7;
  }
  if (v4) {
    a3 = a3;
  }
  else {
    a3 = 0LL;
  }
  if (v4) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = v3;
  }
  else {
    return v8;
  }
}

mach_port_context_t _xpc_pipe_create(char *__s, mach_port_name_t a2, int a3)
{
  if (__s) {
    size_t v6 = strlen(__s) + 1;
  }
  else {
    size_t v6 = 0LL;
  }
  mach_port_context_t v7 = _xpc_base_create();
  if (_xpc_mach_port_retain_send(a2))
  {
    _os_assumes_log();
    xpc_release((xpc_object_t)v7);
    return 0LL;
  }

  else
  {
    *(_DWORD *)(v7 + 32) = a2;
    if (__s || (a3 & 0x10000) != 0)
    {
      *(_DWORD *)(v7 + 40) = _xpc_mach_port_allocate(0x37u, 6u, v7);
      *(_DWORD *)(v7 + 36) = _xpc_mach_port_allocate(0x23u, 6u, v7);
      *(_DWORD *)(v7 + 44) = *(_DWORD *)(v7 + 40);
      *(_BYTE *)(v7 + 48) |= 1u;
      if (__s) {
        strlcpy((char *)(v7 + 49), __s, v6);
      }
    }

    else
    {
      *(_DWORD *)(v7 + 44) = a2;
    }

    if ((a3 & 8) != 0) {
      char v8 = 6;
    }
    else {
      char v8 = 4;
    }
    *(_BYTE *)(v7 + 48) |= v8;
    *(_DWORD *)(v7 + 24) = 0;
  }

  return v7;
}

mach_port_context_t xpc_pipe_create_with_user_session_uid(char *a1, unsigned int a2, int a3)
{
  if ((xpc_user_sessions_enabled() & 1) == 0)
  {
    __int128 v10 = _xpc_asprintf("xpc_pipe_create_with_user_session_uid() can only be used if xpc_user_sessions_enabled() returns true.");
    goto LABEL_12;
  }

  if ((a3 & 2) != 0)
  {
    __int128 v10 = _xpc_asprintf("xpc_pipe_create_with_user_session_uid() cannot be used with the privileged flag.");
LABEL_12:
    _xpc_api_misuse(v10);
  }

  mach_port_name_t v11 = 0;
  int v6 = _xpc_look_up_endpoint(a1, 2, a2, 0LL, 0LL, 0LL, 0LL, &v11, 0LL);
  mach_port_context_t v7 = 0LL;
  if (v6) {
    mach_port_name_t v8 = 0;
  }
  else {
    mach_port_name_t v8 = v11;
  }
  if (v8 - 1 <= 0xFFFFFFFD)
  {
    mach_port_context_t v7 = _xpc_pipe_create(a1, v8, a3);
  }

  return v7;
}

mach_port_context_t xpc_pipe_create_from_port(mach_port_name_t a1, int a2)
{
  return _xpc_pipe_create(0LL, a1, a2);
}

uint64_t _xpc_pipe_routine(uint64_t a1, int a2, void *a3, void *a4, char a5)
{
  if (*(_DWORD *)(a1 + 28) != 1) {
    return 32LL;
  }
  if (xpc_get_type(a3) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    uint64_t v41 = _xpc_asprintf("Messages must be dictionaries.");
    goto LABEL_54;
  }

  if ((*(_BYTE *)(a1 + 48) & 4) == 0)
  {
    unsigned int reply_port = mig_get_reply_port();
    goto LABEL_8;
  }

  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int reply_port = *(_DWORD *)(StatusReg + 64);
  if (!reply_port)
  {
    unsigned int reply_port = thread_get_special_reply_port();
    *(void *)(StatusReg + 64) = reply_port;
    if (!reply_port)
    {
      uint64_t v41 = _xpc_asprintf("Unable to allocate reply port, possible port leak");
LABEL_54:
      _xpc_api_misuse(v41);
    }
  }

LABEL_8:
  __int128 v13 = _xpc_pipe_pack_message(a1, a2, (uint64_t)a3, reply_port, 21, 1);
  if (!v13) {
    return 22LL;
  }
  uint64_t v14 = v13;
  int v42 = a4;
  mach_message_header = (mach_msg_header_t *)_xpc_serializer_get_mach_message_header();
  unint64_t v16 = mach_message_header;
  mach_port_name_t msgh_local_port = mach_message_header->msgh_local_port;
  int v18 = *(unsigned __int8 *)(a1 + 48);
  if ((v18 & 2) != 0) {
    int v19 = 52428807;
  }
  else {
    int v19 = 50331655;
  }
  int v20 = v18 << 29;
  if ((a5 & 1) != 0) {
    int v21 = 9453568;
  }
  else {
    int v21 = 1064960;
  }
  int v22 = v21 & (v20 >> 31);
  char v44 = a5;
  if ((a5 & 2) != 0) {
    int v23 = 66048;
  }
  else {
    int v23 = 512;
  }
  mach_msg_option_t v24 = v22 | v23 | v19;
  BOOLean_t v43 = voucher_mach_msg_set(mach_message_header);
  mach_message_size_t length = _xpc_serializer_get_mach_message_length();
  char v26 = 0;
  LODWORD(v11) = 35;
  memset(v46, 0, 76);
  while (2)
  {
    unsigned int v45 = v11;
    int v27 = 0LL;
    unsigned int v28 = v24 & 0xFFFFBFFA;
    __int16 v29 = v16;
    char v30 = v26;
    size_t v31 = mach_message_length;
    while (1)
    {
      mach_message_size_t length = v31;
      unint64_t v16 = v29;
      int v32 = _xpc_pipe_mach_msg((uint64_t)v14, v29, v24, v31, msgh_local_port);
      if (v27) {
        _xpc_serializer_reset_mach_message_header((uint64_t)v14);
      }
      if (v32 != 268451844) {
        break;
      }
      if ((v24 & 4) == 0)
      {
        _xpc_serializer_clear_sent_descriptors((uint64_t)v14);
        uint64_t v11 = 12LL;
        goto LABEL_34;
      }

      size_t v33 = v16->msgh_size + 52LL;
      int v27 = (mach_msg_header_t *)malloc(v33);
      size_t v31 = 0LL;
      char v30 = 1;
      __int16 v29 = (mach_msg_header_t *)v46;
      mach_msg_option_t v24 = v28;
      if (v27)
      {
        memcpy(v27, v16, mach_message_length);
        __int16 v29 = v27;
        mach_msg_option_t v24 = v28;
        size_t v31 = v33;
      }
    }

    uint64_t v11 = v45;
    switch(v32)
    {
      case 0:
        break;
      case 268435459:
        uint64_t v11 = 32LL;
        break;
      case 268435479:
        _xpc_consume_send_once_notification_on_reply_port(v16->msgh_local_port);
        uint64_t v11 = 1LL;
        char v26 = 1;
        if ((v30 & 1) != 0) {
          continue;
        }
        break;
      default:
        uint64_t v11 = 5LL;
        break;
    }

    break;
  }

        _xpc_activity_end_running(a1);
        break;
      default:
        return;
    }
  }

LABEL_34:
  if (v43) {
    voucher_mach_msg_clear(v16);
  }
  if (v32)
  {
    if ((v32 & 0xFFFFC1FF) == 0x1000400C) {
      mach_msg_destroy(v16);
    }
    _xpc_serializer_destroy(v14);
    if ((_DWORD)v11 == 32) {
      *(_DWORD *)(a1 + 28) = 2;
    }
    return v11;
  }

  if (v16->msgh_id != 0x20000000)
  {
    _xpc_serializer_destroy(v14);
    return 5LL;
  }

  int64_t v34 = (dispatch_object_s *)_xpc_serializer_reap_combined_send_receive((uint64_t)v14);
  _xpc_serializer_destroy(v14);
  if ((v44 & 4) != 0)
  {
    uint64_t msg = (_DWORD *)dispatch_mach_msg_get_msg();
    if ((xpc_receive_mach_msg_validate_hdr(msg) & 1) != 0)
    {
      uint64_t audit_token = _xpc_mach_msg_get_audit_token((uint64_t)msg);
      int v37 = *(_DWORD *)(audit_token + 20);
      if (v37 != 1) {
        _xpc_pipe_routine_cold_2(v37);
      }
      if (*(_DWORD *)(audit_token + 4)) {
        _xpc_interface_routine_cold_5();
      }
      goto LABEL_46;
    }

    dispatch_release(v34);
    return 22LL;
  }

LABEL_46:
  *(void *)&v46[0] = 0LL;
  int v38 = xpc_receive_mach_msg(v34, 0, 0LL, 0LL, (uint64_t *)v46);
  uint64_t v39 = *(void *)&v46[0];
  dispatch_release(v34);
  uint64_t v11 = 5LL;
  if (!v38 && v39)
  {
    uint64_t v11 = 0LL;
    *int v42 = v39;
  }

  return v11;
}

uint64_t xpc_pipe_routine(uint64_t a1, void *a2, void *a3)
{
  return _xpc_pipe_routine(a1, 0, a2, a3, 0);
}

uint64_t xpc_pipe_routine_with_flags(uint64_t a1, void *a2, void *a3, char a4)
{
  return _xpc_pipe_routine(a1, 0, a2, a3, a4);
}

uint64_t xpc_pipe_routine_async(uint64_t a1, void *a2, int a3)
{
  return _xpc_pipe_simpleroutine(a1, 0, a2, a3, 0);
}

uint64_t _xpc_pipe_simpleroutine(uint64_t a1, int a2, void *a3, int a4, char a5)
{
  if (*(_DWORD *)(a1 + 28) != 1) {
    return 32LL;
  }
  if (xpc_get_type(a3) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    uint64_t v15 = _xpc_asprintf("Messages must be dictionaries.");
    _xpc_api_misuse(v15);
  }

  if (a4) {
    int v10 = 21;
  }
  else {
    int v10 = 0;
  }
  uint64_t v11 = _xpc_pipe_pack_message(a1, a2, (uint64_t)a3, a4, v10, 0);
  if (!v11) {
    return 22LL;
  }
  __int128 v12 = v11;
  uint64_t v13 = _xpc_send_serializer((uint64_t)v11, 1, a5);
  xpc_release(v12);
  if ((_DWORD)v13 == 32) {
    *(_DWORD *)(a1 + 28) = 2;
  }
  return v13;
}

uint64_t xpc_pipe_routine_reply(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    int v6 = _xpc_asprintf("Messages must be dictionaries.");
    _xpc_api_misuse(v6);
  }

  uint64_t v2 = _xpc_pipe_pack_message(0LL, 0, (uint64_t)a1, 0, 0, 0);
  if (!v2) {
    return 22LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = _xpc_send_serializer((uint64_t)v2, 0, 0);
  xpc_release(v3);
  return v4;
}

void *_xpc_pipe_pack_message(uint64_t a1, int a2, uint64_t a3, int a4, int a5, char a6)
{
  __int128 v12 = (void *)_xpc_serializer_create();
  if (a4) {
    int v13 = a5 << 8;
  }
  else {
    int v13 = 0;
  }
  if ((a2 & 0xFF000000) != 0) {
    _xpc_pipe_pack_message_cold_1();
  }
  if ((a6 & 1) != 0) {
    int v14 = 0x40000000;
  }
  else {
    int v14 = 0x10000000;
  }
  int reply_port = _xpc_dictionary_extract_reply_port(a3);
  if (reply_port)
  {
    int v16 = reply_port;
    int v17 = 0x20000000;
    int v18 = 18;
  }

  else
  {
    int v17 = v14 | a2;
    if (a1) {
      int v16 = *(_DWORD *)(a1 + 44);
    }
    else {
      int v16 = 0;
    }
    int v18 = 19;
  }

  int v19 = (_DWORD *)_xpc_serializer_pack((uint64_t)v12, a3, 0, 0);
  if (v19)
  {
    v19[5] = v17;
    *v19 |= v18 | v13;
    void v19[2] = v16;
    v19[3] = a4;
  }

  else
  {
    xpc_release(v12);
    return 0LL;
  }

  return v12;
}

uint64_t _xpc_send_serializer(uint64_t a1, BOOL a2, char a3)
{
  mach_message_header = (mach_msg_header_t *)_xpc_serializer_get_mach_message_header();
  mach_message_size_t length = _xpc_serializer_get_mach_message_length();
  if (a2) {
    a2 = voucher_mach_msg_set(mach_message_header) != 0;
  }
  if ((a3 & 2) != 0) {
    mach_msg_option_t v8 = 65537;
  }
  else {
    mach_msg_option_t v8 = 1;
  }
  uint64_t v9 = _xpc_pipe_mach_msg(a1, mach_message_header, v8, mach_message_length, 0);
  if (a2) {
    voucher_mach_msg_clear(mach_message_header);
  }
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 == 268435479)
    {
      _xpc_consume_send_once_notification_on_reply_port(mach_message_header->msgh_local_port);
      return 1LL;
    }

    else if ((_DWORD)v9 == 268435459)
    {
      return 32LL;
    }

    else
    {
      return 5LL;
    }
  }

  return v9;
}

uint64_t xpc_pipe_create_reply_from_port(int a1)
{
  else {
    return _xpc_dictionary_create_reply_with_port(a1);
  }
}

uint64_t xpc_pipe_routine_forward(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(a1 + 28) != 1) {
    return 32LL;
  }
  if (xpc_get_type(a2) != (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    uint64_t v9 = _xpc_asprintf("Messages must be dictionaries.");
    _xpc_api_misuse(v9);
  }

  int reply_port = _xpc_dictionary_extract_reply_port((uint64_t)a2);
  int v5 = _xpc_pipe_pack_message(a1, 0, (uint64_t)a2, reply_port, 18, 0);
  if (!v5) {
    return 22LL;
  }
  int v6 = v5;
  uint64_t v7 = _xpc_send_serializer((uint64_t)v5, 1, 0);
  xpc_release(v6);
  if ((_DWORD)v7 == 32) {
    *(_DWORD *)(a1 + 28) = 2;
  }
  return v7;
}

void _xpc_pipe_check_in_once(uint64_t a1)
{
  if (!atomic_load((unsigned int *)(a1 + 28)))
  {
    uint64_t v3 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    if (!*(_DWORD *)(a1 + 28))
    {
      unsigned int v4 = 1;
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        if (_xpc_connection_check_in_with_ports(*(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40))) {
          unsigned int v4 = 1;
        }
        else {
          unsigned int v4 = 2;
        }
      }

      atomic_store(v4, (unsigned int *)(a1 + 28));
    }

    os_unfair_lock_unlock(v3);
  }

uint64_t _xpc_pipe_interface_simpleroutine(uint64_t a1, int a2, void *a3, char a4)
{
  return _xpc_pipe_simpleroutine(a1, a2, a3, 0, a4);
}

uint64_t xpc_pipe_receive(mach_port_name_t a1, void *a2, char a3)
{
  object[1] = 0LL;
  object[0] = (dispatch_object_t)dispatch_mach_msg_create();
  uint64_t v6 = _xpc_pipe_receive(a1, object, a3);
  uint64_t v7 = object[0];
  if (!(_DWORD)v6)
  {
    uint64_t v11 = 0LL;
    else {
      BOOL v8 = v11 == 0;
    }
    if (!v8)
    {
      uint64_t v6 = 0LL;
      *a2 = v11;
      if (!v7) {
        return v6;
      }
      goto LABEL_9;
    }

    uint64_t v6 = 5LL;
  }

  if (v7) {
LABEL_9:
  }
    dispatch_release(v7);
  return v6;
}

uint64_t _xpc_pipe_receive(mach_port_name_t a1, dispatch_object_s **a2, char a3)
{
  mach_msg_return_t v11;
  mach_msg_header_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _OWORD v17[5];
  mach_msg_size_t rcv_size[2];
  if ((a3 & 1) != 0) {
    mach_msg_option_t v5 = 50334470;
  }
  else {
    mach_msg_option_t v5 = 50334214;
  }
  uint64_t v6 = *a2;
  *(void *)rcv_size_t size = 0LL;
  uint64_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  BOOL v8 = 0LL;
  memset(v17, 0, 76);
  int v9 = v5 & 0x3000B02;
  LODWORD(v10) = 0;
  while (1)
  {
    uint64_t v11 = mach_msg(msg, v5, 0, v10, a1, 0, 0);
    if (v11 != 268451844) {
      break;
    }
    if ((v5 & 4) == 0)
    {
      int v13 = 12LL;
      if (v8) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }

    uint64_t v10 = msg->msgh_size + 52LL;
    __int128 v12 = (mach_msg_header_t *)malloc(v10);
    BOOL v8 = v12;
    if (v12)
    {
      memcpy(v12, msg, *(size_t *)rcv_size);
      uint64_t msg = v8;
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t msg = (mach_msg_header_t *)v17;
    }

    *(void *)rcv_size_t size = v10;
    mach_msg_option_t v5 = v9;
  }

  if (v11)
  {
    if (v11 == 268451843)
    {
      int v13 = 35LL;
      if (v8) {
        goto LABEL_18;
      }
    }

    else
    {
      _os_assumes_log();
      int v13 = 5LL;
      if (v8) {
LABEL_18:
      }
        free(v8);
    }

uint64_t xpc_pipe_invalidate(uint64_t result)
{
  *(_DWORD *)(result + 40) = 0;
  *(void *)(result + 32) = 0LL;
  return result;
}

uint64_t xpc_pipe_try_receive( mach_port_name_t a1, uint64_t *a2, _DWORD *a3, unsigned int (*a4)(void), size_t a5, char a6)
{
  v24[1] = *MEMORY[0x1895FEE08];
  uint64_t v23 = 0LL;
  int v22 = (dispatch_object_s *)dispatch_mach_msg_create();
  uint64_t v12 = _xpc_pipe_receive(a1, &v22, a6);
  if ((_DWORD)v12)
  {
    uint64_t v13 = v12;
    int v14 = v22;
  }

  else
  {
    v24[0] = 0LL;
    int v14 = v22;
    uint64_t msg = dispatch_mach_msg_get_msg();
    uint64_t v23 = msg;
    if (v24[0] <= 0x17uLL) {
      xpc_pipe_try_receive_cold_1();
    }
    int v17 = (mach_msg_header_t *)msg;
    int v18 = *(_DWORD *)(msg + 20);
    if (v18 == 0x40000000 || v18 == 0x10000000)
    {
      int v20 = *(_DWORD *)(msg + 12);
      v24[0] = 0LL;
      uint64_t v13 = 22LL;
      if (!xpc_receive_mach_msg(v14, 0, 0LL, 0LL, v24))
      {
        uint64_t v21 = v24[0];
        if (v24[0])
        {
          uint64_t v13 = 0LL;
          *a3 = v20;
          *a2 = v21;
        }
      }
    }

    else
    {
      MEMORY[0x1895FE128]();
      bzero((char *)&v22 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL), a5);
      bzero((char *)&v22 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL), a5);
      uint64_t v13 = _xpc_pipe_handle_mig(v17, (mach_msg_header_t *)((char *)&v22 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL)), a4);
    }
  }

  if (v14) {
    dispatch_release(v14);
  }
  return v13;
}

uint64_t _xpc_pipe_mach_msg( uint64_t a1, mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t a4, mach_port_name_t a5)
{
  mach_msg_bits_t msgh_bits = msg->msgh_bits;
  uint64_t v8 = mach_msg(msg, option, msg->msgh_size, a4, a5, 0, 0);
  uint64_t v9 = v8;
  if ((int)v8 > 268435465)
  {
    if ((_DWORD)v8 == 268451844) {
      return v9;
    }
    if ((_DWORD)v8 == 268435466) {
      _xpc_pipe_mach_msg_cold_1();
    }
  }

  else
  {
    if (!(_DWORD)v8)
    {
LABEL_13:
      _xpc_serializer_clear_sent_descriptors(a1);
      return v9;
    }

    if ((_DWORD)v8 == 268435459) {
      goto LABEL_4;
    }
  }

  _os_assumes_log();
  if ((v9 & 0x3FFC000) != 0) {
    goto LABEL_13;
  }
LABEL_4:
  return v9;
}

uint64_t _xpc_consume_send_once_notification_on_reply_port(int a1)
{
  *(_DWORD *)&_OWORD v4[4] = 32;
  *(_DWORD *)&v4[12] = a1;
  uint64_t result = mach_msg_receive((mach_msg_header_t *)v4);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 268435479) {
      int v3 = 1;
    }
    else {
      int v3 = 5;
    }
    if ((_DWORD)result == 268435459) {
      int v3 = 32;
    }
    int v2 = *(_DWORD *)&v4[20];
    goto LABEL_11;
  }

  int v2 = *(_DWORD *)&v4[20];
  if (*(_DWORD *)&v4[20] != 71)
  {
    int v3 = 0;
LABEL_11:
    _xpc_asprintf("Unable to consume send-once notification, error = %d, int msgh_id = %x", v3, v2);
    uint64_t result = _os_crash();
    __break(1u);
  }

  return result;
}

uint64_t _waiting4memory()
{
  return 1LL;
}

void *_xpc_memdup(const void *a1, size_t __size)
{
  unsigned int v4 = _xpc_alloc(__size);
  return memcpy(v4, a1, __size);
}

void *_xpc_mmap_anon(size_t *a1)
{
  size_t v2 = ~*MEMORY[0x189600138] & (*MEMORY[0x189600138] + *a1);
  for (*a1 = v2; ; size_t v2 = *a1)
  {
    uint64_t result = mmap(0LL, v2, 3, 4098, -1, 0LL);
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_mach_port_get_context_cold_1();
      }
    }

    _waiting4memory();
  }

  return result;
}

char *_xpc_strdup(const char *a1)
{
  for (unint64_t i = a1; ; a1 = i)
  {
    uint64_t result = strdup(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_mach_port_get_context_cold_1();
      }
    }

    _waiting4memory();
  }

  return result;
}

char *_xpc_strndup(const char *a1, size_t a2)
{
  size_t v2 = a2;
  int v3 = a1;
  while (1)
  {
    uint64_t result = strndup(a1, a2);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_mach_port_get_context_cold_1();
      }
    }

    _waiting4memory();
    a1 = v3;
    a2 = v2;
  }

  return result;
}

uint64_t _xpc_memcmp(const void *a1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n == a4) {
    return memcmp(a1, __s2, __n);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

char *_xpc_asprintf(char *a1, ...)
{
  int v3 = 0LL;
  while (1)
  {
    vasprintf(&v3, a1, va);
    uint64_t result = v3;
    if (v3) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_mach_port_get_context_cold_1();
      }
    }

    _waiting4memory();
  }

  return result;
}

void *_xpc_Block_copy_impl(const void *a1)
{
  for (unint64_t i = a1; ; a1 = i)
  {
    uint64_t result = _Block_copy(a1);
    if (result) {
      break;
    }
    if (*__error() != 12)
    {
      if (*__error()) {
        _xpc_mach_port_get_context_cold_1();
      }
    }

    _waiting4memory();
  }

  return result;
}

BOOL _xpc_has_prefix(const char *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return strncmp(a1, __s, v4) == 0;
}

BOOL _xpc_has_suffix(const char *a1, const char *a2)
{
  size_t v4 = &a1[strlen(a1)];
  mach_msg_option_t v5 = &v4[-strlen(a2)];
  return v5 >= a1 && strcmp(v5, a2) == 0;
}

BOOL _xpc_equal_strings(char *__s1, const char *a2)
{
  BOOL result = ((unint64_t)__s1 | (unint64_t)a2) == 0;
  if (__s1)
  {
    if (a2) {
      return strcmp(__s1, a2) == 0;
    }
  }

  return result;
}

uint64_t _xpc_hash(_BYTE *a1, uint64_t a2)
{
  if (!a2) {
    return 5381LL;
  }
  uint64_t result = 5381LL;
  do
  {
    uint64_t v4 = *a1;
    if (!*a1) {
      break;
    }
    ++a1;
    uint64_t result = 33 * result + v4;
    --a2;
  }

  while (a2);
  return result;
}

uint64_t __xpc_enum2label(int a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  for (uint64_t i = a2 + 8; *(_DWORD *)(i - 8) != a1; i += 16LL)
  {
    if (!--a3) {
      return 0LL;
    }
  }

  return *(void *)i;
}

xpc_object_t xpc_create_from_plist(char *buffer, uint64_t size)
{
  xpc_object_t v2 = 0LL;
  v109 = 0LL;
  uint64_t v110 = 0LL;
  v104 = buffer;
  int64_t v105 = size;
  if (*(_DWORD *)buffer != 1768714338 || *((_WORD *)buffer + 2) != 29811)
  {
    dispatch_data_t v6 = dispatch_data_create(buffer, size, 0LL, (dispatch_block_t)*MEMORY[0x1895FE7A8]);
    uint64_t v7 = (dispatch_data_s *)dispatch_data_create_with_transform();
    dispatch_release(v6);
    if (v7)
    {
      size_t size_ptr = 0LL;
      buffer_ptr[0] = 0LL;
      dispatch_data_t v8 = dispatch_data_create_map(v7, (const void **)buffer_ptr, &size_ptr);
      uint64_t v9 = buffer_ptr[0];
      dispatch_release(v7);
      if (v8)
      {
        xpc_object_t v2 = _xpc_plist_parse_xml((unint64_t)v9, size_ptr);
        dispatch_release(v8);
        return v2;
      }
    }

    return 0LL;
  }

  if (*(_DWORD *)buffer != 1768714338 || *(_DWORD *)(buffer + 3) != 812938089) {
    return 0LL;
  }
  xpc_object_t v2 = 0LL;
  uint64_t v12 = &buffer[size - 32];
  __int128 v13 = *((_OWORD *)v12 + 1);
  __int128 v106 = *(_OWORD *)v12;
  unint64_t v14 = bswap64(*((unint64_t *)&v106 + 1));
  unint64_t v15 = bswap64(v13);
  *((void *)&v106 + 1) = v14;
  unint64_t v107 = v15;
  unint64_t v16 = bswap64(*((unint64_t *)&v13 + 1));
  unint64_t v108 = v16;
  if ((v16 & 0x8000000000000000LL) != 0) {
    return v2;
  }
  xpc_object_t v2 = 0LL;
  if (v14 < v15 || v16 < 9 || size - 32 <= v16) {
    return v2;
  }
  if (!BYTE6(v106) || !BYTE7(v106)) {
    return 0LL;
  }
  xpc_object_t v2 = 0LL;
  if (!is_mul_ok(v14, BYTE6(v106))) {
    return v2;
  }
  xpc_object_t v2 = 0LL;
  unint64_t v17 = v14 * BYTE6(v106);
  BOOL v18 = __CFADD__(v17, v16);
  if (!v17) {
    return v2;
  }
  if (v18) {
    return v2;
  }
  xpc_object_t v2 = 0LL;
  if (v17 + v16 > 0xFFFFFFFFFFFFFFDFLL || v17 + v16 + 32 != size) {
    return v2;
  }
  if (BYTE7(v106) <= 7u && v14 >> (8 * BYTE7(v106))) {
    return 0LL;
  }
  if (BYTE6(v106) <= 7u && v16 >> (8 * BYTE6(v106))) {
    return 0LL;
  }
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v113 = 0u;
  size_t size_ptr = (size_t)buffer;
  size_t v112 = size;
  if (buffer + 8 < buffer) {
    return 0LL;
  }
  int v19 = (unsigned int *)&buffer[size];
  if (buffer + 8 >= &buffer[size]) {
    return 0LL;
  }
  int v20 = (unsigned int *)&buffer[v16];
  if (&buffer[v16] < buffer) {
    return 0LL;
  }
  if (v20 >= v19) {
    return 0LL;
  }
  unint64_t v21 = (unint64_t)v20 + v17 - 1;
  do
  {
    buffer_ptr[0] = 0LL;
    if (!_xpc_plist_swap_int(&size_ptr, v20, BYTE6(v106), (unint64_t *)buffer_ptr)
      || (void *)(v16 - 1) < buffer_ptr[0])
    {
      return 0LL;
    }

    int v20 = (unsigned int *)((char *)v20 + BYTE6(v106));
    --v14;
  }

  while (v14);
  uint64_t v116 = 0LL;
  int v22 = _xpc_plist_swap_int( (unint64_t *)&v104,  (unsigned int *)&buffer[v16 + v15 * BYTE6(v106)],  BYTE6(v106),  (unint64_t *)&v116);
  xpc_object_t v23 = 0LL;
  if (!v22) {
    return v23;
  }
  xpc_object_t v23 = 0LL;
  uint64_t v24 = v116;
  if (v116 < 0 || v116 >= size) {
    return v23;
  }
  uint64_t v25 = (uint64_t *)calloc(1uLL, 0x38uLL);
  v109 = v25;
  if (!v25) {
    return 0LL;
  }
  *((_BYTE *)v25 + 48) |= 1u;
  *uint64_t v25 = v24;
  char v26 = (void *)*MEMORY[0x1895FE7A8];
LABEL_49:
  int v27 = v109;
  if ((v109[6] & 0x10) == 0)
  {
    if ((v109[6] & 1) != 0)
    {
      LODWORD(v31) = 0;
      *((_BYTE *)v109 + 48) |= 0x10u;
      uint64_t v32 = *v27;
      if (!*v27) {
        goto LABEL_83;
      }
      goto LABEL_84;
    }

    if ((v109[6] & 2) != 0)
    {
      size_t v33 = (char *)v109[3];
      if (v33 < v104 || v33 >= &v104[v105]) {
        goto LABEL_81;
      }
      unint64_t v35 = v109[1];
      if (v35 >= v109[2]) {
        goto LABEL_180;
      }
      unint64_t v36 = _xpc_plist_offset_of_object((uint64_t)&v104, (unsigned int *)&v33[v35 * BYTE7(v106)]);
      if (v36 != -1LL)
      {
        uint64_t v32 = v36;
        unint64_t v31 = (unint64_t)calloc(1uLL, 0x38uLL);
        if (!v31) {
          goto LABEL_82;
        }
        unint64_t v37 = v31;
        LODWORD(v31) = 0;
        *(_BYTE *)(v37 + 48) |= 8u;
        *(void *)(v37 + 40) = v27;
        *(void *)(v37 + 8) = v27[1];
        v109 = (uint64_t *)v37;
        goto LABEL_71;
      }
    }

    else
    {
      if ((v109[6] & 8) == 0)
      {
        if ((v109[6] & 4) == 0) {
          goto LABEL_81;
        }
        unsigned int v28 = (char *)v109[3];
        if (v28 < v104 || v28 >= &v104[v105]) {
          goto LABEL_81;
        }
        unint64_t v30 = v109[1];
        if (v30 >= v109[2])
        {
LABEL_180:
          LODWORD(v31) = _xpc_plist_collapse_stack((uint64_t)&v104);
          goto LABEL_82;
        }

        unint64_t v31 = _xpc_plist_offset_of_object((uint64_t)&v104, (unsigned int *)&v28[v30 * BYTE7(v106)]);
        if (v31 == -1LL) {
          goto LABEL_81;
        }
        uint64_t v32 = v31;
        LODWORD(v31) = 0;
LABEL_71:
        ++v27[1];
        if (!v32) {
          goto LABEL_83;
        }
        goto LABEL_84;
      }

      uint64_t v38 = v109[5];
      if (v38)
      {
        if ((*(_BYTE *)(v38 + 48) & 2) != 0)
        {
          unint64_t v39 = v109[1];
          unint64_t v40 = *(void *)(v38 + 16);
          if (v39 <= v40)
          {
            uint64_t v41 = *(char **)(v38 + 24);
            if (v41 >= v104 && v41 < &v104[v105])
            {
              unint64_t v102 = _xpc_plist_offset_of_object((uint64_t)&v104, (unsigned int *)&v41[(v40 + v39) * BYTE7(v106)]);
              LODWORD(v31) = 0;
              if (v102 == -1LL) {
                uint64_t v32 = 0LL;
              }
              else {
                uint64_t v32 = v102;
              }
              if (!v32) {
                goto LABEL_83;
              }
              goto LABEL_84;
            }
          }
        }
      }
    }
  }

LABEL_81:
  while (1)
  {
    LODWORD(v31) = 0;
LABEL_82:
    uint64_t v32 = 0LL;
LABEL_83:
    if (!(_DWORD)v31) {
      break;
    }
LABEL_84:
    if ((v31 & 1) == 0)
    {
      BOOLean_t v43 = v104;
      char v44 = &v104[v32];
      unsigned int v45 = v104[v32];
      if ((v45 & 0xF0) == 0xA0)
      {
        unint64_t v54 = (unint64_t)(v44 + 1);
        size_t size_ptr = (size_t)(v44 + 1);
        __int128 v55 = &v104[v105];
        unint64_t v72 = *v44 & 0xF;
        buffer_ptr[0] = (void *)v72;
        if ((_DWORD)v72 != 15
          || (int v73 = _xpc_plist_read_int((unint64_t *)&v104, v54, (unint64_t *)buffer_ptr, &size_ptr),
              char v51 = 0,
              v73)
          && (unint64_t v72 = (unint64_t)buffer_ptr[0], ((unint64_t)buffer_ptr[0] & 0x8000000000000000LL) == 0))
        {
          if (v72 && !is_mul_ok(v72, BYTE7(v106))) {
            goto LABEL_102;
          }
          unint64_t v74 = v72 * BYTE7(v106);
          if ((v74 & 0x8000000000000000LL) != 0) {
            goto LABEL_102;
          }
          size_t v75 = size_ptr + v74 - 1;
          v77 = (uint64_t *)calloc(1uLL, 0x38uLL);
          if (!v77) {
            goto LABEL_102;
          }
          v78 = v77;
          v77[1] = 0LL;
          v77[2] = v72;
          *((_BYTE *)v77 + 48) |= 4u;
          v77[3] = size_ptr;
          v77[5] = (uint64_t)v109;
          xpc_object_t v79 = xpc_array_create(0LL, 0LL);
LABEL_143:
          v78[4] = (uint64_t)v79;
          v109 = v78;
          char v51 = 1;
        }
      }

      else
      {
        if ((v45 & 0xF0) != 0xD0)
        {
          uint64_t v57 = v109;
          if ((v109[6] & 8) == 0 || v109[4])
          {
            v58 = (uint64_t *)calloc(1uLL, 0x38uLL);
            if (!v58) {
              goto LABEL_203;
            }
            v58[5] = (uint64_t)v57;
            v109 = v58;
            uint64_t v57 = v58;
          }

          switch(v45 >> 4)
          {
            case 0u:
              if (v45 == 9)
              {
                BOOL v101 = 1;
LABEL_187:
                uint64_t no_copy = (uint64_t)xpc_BOOL_create(v101);
                goto LABEL_188;
              }

              if (v45 == 8)
              {
                BOOL v101 = 0;
                goto LABEL_187;
              }

              if (v45) {
                goto LABEL_203;
              }
              uint64_t no_copy = (uint64_t)xpc_null_create();
LABEL_188:
              v57[4] = no_copy;
LABEL_189:
              break;
            case 1u:
              xpc_object_t v23 = 0LL;
              if (v32 < 0 || v105 <= v32) {
                goto LABEL_204;
              }
              uint64_t v85 = 1LL << (*v44 & 0xF);
              size_t size_ptr = 0LL;
              if (!_xpc_plist_swap_int( (unint64_t *)&v104,  (unsigned int *)(v44 + 1),  v85,  &size_ptr)) {
                goto LABEL_203;
              }
              uint64_t no_copy = (uint64_t)xpc_int64_create(size_ptr);
              goto LABEL_188;
            case 2u:
              v86 = (unint64_t *)(v44 + 1);
              if (v44 + 1 < v43) {
                goto LABEL_203;
              }
              unint64_t v87 = (unint64_t)&v43[v105];
              int v88 = *v44 & 0xF;
              if (v88 == 3)
              {
                xpc_object_t v23 = 0LL;
                double v89 = COERCE_DOUBLE(bswap64(*v86));
              }

              else
              {
                if (v88 != 2) {
                  goto LABEL_203;
                }
                xpc_object_t v23 = 0LL;
                double v89 = COERCE_FLOAT(bswap32(*(_DWORD *)v86));
              }

              uint64_t no_copy = (uint64_t)xpc_double_create(v89);
              goto LABEL_188;
            case 3u:
              goto LABEL_189;
            case 4u:
              char v92 = *v44;
              v91 = v44 + 1;
              char v90 = v92;
              size_t size_ptr = (size_t)v91;
              if (v91 < v43) {
                goto LABEL_203;
              }
              v93 = &v43[v105];
              if (v91 >= &v43[v105]) {
                goto LABEL_203;
              }
              size_t v94 = v90 & 0xF;
              buffer_ptr[0] = (void *)v94;
              if ((v90 & 0xF) != 0xF) {
                goto LABEL_168;
              }
              if (!_xpc_plist_read_int( (unint64_t *)&v104,  (unint64_t)v91,  (unint64_t *)buffer_ptr,  &size_ptr)) {
                goto LABEL_203;
              }
              size_t v94 = (size_t)buffer_ptr[0];
              v91 = (char *)size_ptr;
LABEL_168:
              unint64_t v95 = (unint64_t)&v91[v94 - 1];
              uint64_t no_copy = (uint64_t)xpc_data_create(v91, v94);
              goto LABEL_188;
            case 5u:
            case 6u:
              char v61 = *v44;
              v59 = v44 + 1;
              char v60 = v61;
              buffer_ptr[0] = v59;
              if (v59 < v43) {
                goto LABEL_203;
              }
              v62 = &v43[v105];
              if (v59 >= &v43[v105]) {
                goto LABEL_203;
              }
              size_t v63 = v60 & 0xF;
              size_t v117 = v63;
              if ((v60 & 0xF) == 0xF)
              {
                if (!_xpc_plist_read_int( (unint64_t *)&v104,  (unint64_t)v59,  &v117,  buffer_ptr)) {
                  goto LABEL_203;
                }
                size_t v63 = v117;
                if ((v117 & 0x8000000000000000LL) != 0) {
                  goto LABEL_203;
                }
              }

              if ((v60 & 0xF0) == 0x60)
              {
                size_t v64 = 2 * v63;
                if (((2 * v63) & 0x8000000000000000LL) != 0) {
                  goto LABEL_203;
                }
                v65 = (char *)buffer_ptr[0] + v64 - 1;
                if (v65 < v43 || v65 >= v62) {
                  goto LABEL_203;
                }
                dispatch_data_t v67 = dispatch_data_create(buffer_ptr[0], v64, 0LL, v26);
                v68 = (dispatch_data_s *)dispatch_data_create_with_transform();
                dispatch_release(v67);
                if (!v68) {
                  goto LABEL_203;
                }
                size_t v69 = dispatch_data_get_size(v68);
                v70 = (const char *)malloc(v69 + 1);
                if (!v70)
                {
                  dispatch_release(v68);
                  goto LABEL_203;
                }

                v71 = v70;
                size_t size_ptr = MEMORY[0x1895FED80];
                size_t v112 = 0x40000000LL;
                *(void *)&__int128 v113 = ___xpc_plist_parse_string_block_invoke;
                *((void *)&v113 + 1) = &__block_descriptor_tmp_4;
                *(void *)&__int128 v114 = v70;
                dispatch_data_apply(v68, &size_ptr);
                v71[dispatch_data_get_size(v68)] = 0;
                dispatch_release(v68);
              }

              else
              {
                v97 = buffer_ptr[0];
                v98 = (char *)buffer_ptr[0] + v63 - 1;
                if (v98 < v43 || v98 >= v62) {
                  goto LABEL_203;
                }
                v100 = (char *)malloc(v63 + 1);
                if (!v100) {
                  goto LABEL_203;
                }
                v71 = v100;
                memcpy(v100, v97, v63);
                v71[v63] = 0;
              }

              uint64_t no_copy = xpc_string_create_no_copy(v71);
              goto LABEL_188;
            default:
              goto LABEL_203;
          }

          goto LABEL_190;
        }

        unint64_t v46 = (unint64_t)(v44 + 1);
        size_t size_ptr = (size_t)(v44 + 1);
        uint64_t v47 = &v104[v105];
        unint64_t v49 = *v44 & 0xF;
        buffer_ptr[0] = (void *)v49;
        if ((_DWORD)v49 != 15
          || (int v50 = _xpc_plist_read_int((unint64_t *)&v104, v46, (unint64_t *)buffer_ptr, &size_ptr),
              char v51 = 0,
              v50)
          && (unint64_t v49 = (unint64_t)buffer_ptr[0], ((unint64_t)buffer_ptr[0] & 0x8000000000000000LL) == 0))
        {
          if (v49)
          {
            uint64_t v52 = 2 * v49;
            uint64_t v53 = BYTE7(v106);
            if (is_mul_ok(2 * v49, BYTE7(v106))) {
              goto LABEL_136;
            }
            goto LABEL_102;
          }

          uint64_t v52 = 0LL;
          uint64_t v53 = BYTE7(v106);
LABEL_136:
          uint64_t v80 = v52 * v53;
          if ((v80 & 0x8000000000000000LL) == 0)
          {
            size_t v81 = size_ptr + v80 - 1;
            if (v81 >= (unint64_t)v43 && v81 < (unint64_t)v47)
            {
              v83 = (uint64_t *)calloc(1uLL, 0x38uLL);
              if (v83)
              {
                v78 = v83;
                v83[1] = 0LL;
                v83[2] = v49;
                *((_BYTE *)v83 + 48) |= 2u;
                v83[3] = size_ptr;
                v83[5] = (uint64_t)v109;
                xpc_object_t v79 = xpc_dictionary_create(0LL, 0LL, 0LL);
                goto LABEL_143;
              }
            }
          }

LABEL_102:
          char v51 = 0;
        }
      }

      LOBYTE(v110) = v51 ^ 1;
    }

LABEL_190:
    if (!(_BYTE)v110) {
      goto LABEL_49;
    }
  }

  else {
LABEL_203:
  }
    xpc_object_t v23 = 0LL;
LABEL_204:
  _xpc_plist_unwind_stack((uint64_t)&v104);
  return v23;
}

void xpc_create_from_plist_descriptor(dispatch_fd_t a1, dispatch_queue_t queue, uint64_t a3)
{
  handler[0] = MEMORY[0x1895FED80];
  handler[1] = 0x40000000LL;
  handler[2] = __xpc_create_from_plist_descriptor_block_invoke;
  handler[3] = &unk_18962AB20;
  handler[4] = a3;
  dispatch_read(a1, 0xFFFFFFFFFFFFFFFFLL, queue, handler);
}

void __xpc_create_from_plist_descriptor_block_invoke(uint64_t a1, dispatch_data_t data, int a3)
{
  if (a3
    || (uint64_t v7 = 0LL,
        buffer_ptr = 0LL,
        (dispatch_data_t map = dispatch_data_create_map(data, (const void **)&buffer_ptr, (size_t *)&v7)) == 0LL))
  {
    xpc_object_t v4 = 0LL;
  }

  else
  {
    dispatch_data_t v6 = map;
    xpc_object_t v4 = xpc_create_from_plist((char *)buffer_ptr, v7);
    dispatch_release(v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (v4) {
    xpc_release(v4);
  }
}

uint64_t _xpc_plist_swap_int(unint64_t *a1, unsigned int *a2, uint64_t a3, unint64_t *a4)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)a2 + a3 - 1;
    if (v4 < *a1 || v4 >= *a1 + a1[1]) {
      return 0LL;
    }
    switch(a3)
    {
      case 1LL:
        unint64_t v5 = *(unsigned __int8 *)a2;
        break;
      case 2LL:
        unint64_t v5 = bswap32(*(unsigned __int16 *)a2) >> 16;
        break;
      case 4LL:
        unint64_t v5 = bswap32(*a2);
        break;
      case 8LL:
        unint64_t v5 = bswap64(*(void *)a2);
        break;
      default:
        unint64_t v5 = 0LL;
        do
        {
          unsigned int v7 = *(unsigned __int8 *)a2;
          a2 = (unsigned int *)((char *)a2 + 1);
          unint64_t v5 = v7 | (v5 << 8);
          --a3;
        }

        while (a3);
        break;
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  *a4 = v5;
  return 1LL;
}

void _xpc_plist_unwind_stack(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 48); i; *(void *)(a1 + 48) = i)
  {
    int v3 = (xpc_object_t *)i;
    uint64_t i = *(void *)(i + 40);
    if (v3[4])
    {
      xpc_release(v3[4]);
      int v3 = *(xpc_object_t **)(a1 + 48);
    }

    free(v3);
  }

uint64_t _xpc_plist_parse_date(unint64_t *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *a1 + a2;
  unint64_t v4 = (unint64_t *)(v3 + 1);
  if (v3 + 1 < *a1) {
    return 0LL;
  }
  unint64_t v5 = v2 + a1[1];
  unint64_t v6 = v3 + 9;
  if (v6 < v2 || v6 >= v5) {
    return 0LL;
  }
  *(void *)(a1[6] + 32) = xpc_date_create_absolute(COERCE_DOUBLE(bswap64(*v4)));
  return 1LL;
}

uint64_t _xpc_plist_collapse_stack(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3)
  {
    if ((*(_BYTE *)(v2 + 48) & 8) != 0) {
      return 1LL;
    }
    if ((*(_BYTE *)(v3 + 48) & 8) != 0)
    {
      if (*(void *)(v2 + 32))
      {
        uint64_t result = *(void *)(v3 + 32);
        if (!result) {
          return result;
        }
        uint64_t v5 = *(void *)(v3 + 40);
        if (v5)
        {
          if ((*(_BYTE *)(v5 + 48) & 2) != 0
            && xpc_get_type((xpc_object_t)result) == (xpc_type_t)&OBJC_CLASS___OS_xpc_string)
          {
            unint64_t v6 = *(void **)(v5 + 32);
            int64_t string_ptr = xpc_string_get_string_ptr(*(xpc_object_t *)(v3 + 32));
            xpc_dictionary_set_value(v6, string_ptr, *(xpc_object_t *)(*(void *)(a1 + 48) + 32LL));
            xpc_release(*(xpc_object_t *)(v3 + 32));
            xpc_release(*(xpc_object_t *)(*(void *)(a1 + 48) + 32LL));
            free(*(void **)(a1 + 48));
            free((void *)v3);
LABEL_17:
            *(void *)(a1 + 48) = v5;
            return 1LL;
          }
        }
      }
    }

    else if ((*(_BYTE *)(v3 + 48) & 4) != 0)
    {
      dispatch_data_t v8 = *(void **)(v2 + 32);
      if (v8)
      {
        uint64_t result = *(void *)(v3 + 32);
        if (!result) {
          return result;
        }
        xpc_array_append_value((xpc_object_t)result, v8);
        xpc_release(*(xpc_object_t *)(*(void *)(a1 + 48) + 32LL));
        uint64_t v2 = *(void *)(a1 + 48);
        goto LABEL_16;
      }
    }

    else if ((*(_BYTE *)(v3 + 48) & 1) != 0)
    {
      *(void *)(v3 + 32) = *(void *)(v2 + 32);
LABEL_16:
      free((void *)v2);
      uint64_t v5 = v3;
      goto LABEL_17;
    }
  }

  return 0LL;
}

unint64_t _xpc_plist_offset_of_object(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(void *)a1 + *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 23);
  unint64_t v8 = 0LL;
  uint64_t v5 = *(unsigned __int8 *)(a1 + 22);
  unint64_t v7 = 0LL;
  else {
    return -1LL;
  }
}

uint64_t _xpc_plist_read_int(unint64_t *a1, unint64_t a2, unint64_t *a3, void *a4)
{
  if (*a1 > a2) {
    return 0LL;
  }
  if (*a1 + a1[1] <= a2) {
    return 0LL;
  }
  unint64_t v4 = a2 + 1;
  if ((*(_BYTE *)a2 & 0xF0) != 0x10) {
    return 0LL;
  }
  uint64_t v6 = 1LL << (*(_BYTE *)a2 & 0xF);
  uint64_t result = _xpc_plist_swap_int(a1, (unsigned int *)(a2 + 1), v6, a3);
  if (a4)
  {
    if ((_DWORD)result)
    {
      *a4 = v4 + v6;
      return 1LL;
    }
  }

  return result;
}

uint64_t ___xpc_plist_parse_string_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  return 1LL;
}

xpc_object_t _xpc_plist_parse_xml(unint64_t a1, uint64_t a2)
{
  v65 = 0LL;
  v63[0] = 0LL;
  v63[1] = a1;
  v63[2] = a2;
  v63[3] = 1LL;
  __int128 v64 = a1;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  xpc_object_t v2 = 0LL;
  if (_xpc_xml_lex((int *)v63, (uint64_t)&v61))
  {
    while ((v61 - 1) < 2)
    {
    }

    if ((_DWORD)v61 != 4) {
      goto LABEL_118;
    }
    uint64_t v3 = _xpc_alloc(0x18uLL);
    *(void *)uint64_t v3 = 0LL;
    void v3[2] = 4;
    *((void *)v3 + 2) = 0LL;
    v65 = (xpc_object_t *)v3;
    xpc_object_t v2 = 0LL;
    if (_xpc_xml_lex((int *)v63, (uint64_t)&v61))
    {
      xpc_object_t v2 = 0LL;
      unint64_t v4 = (const char *)&unk_18018902B;
      uint64_t v5 = (dispatch_data_s *)MEMORY[0x1895FE7B8];
      uint64_t v6 = (void *)*MEMORY[0x1895FE7A8];
      while (1)
      {
        switch((int)v61)
        {
          case 5:
            if (!v65) {
              return 0LL;
            }
            if (*((_DWORD *)v65 + 2) != 4 || !*v65) {
              goto LABEL_118;
            }
            xpc_object_t v2 = xpc_retain(*v65);
            _xpc_xml_parser_pop((uint64_t *)&v65);
            goto LABEL_56;
          case 6:
            xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
            unint64_t v8 = v7;
            int v9 = 6;
            goto LABEL_54;
          case 7:
            uint64_t v10 = v65;
            if (!v65) {
              return 0LL;
            }
            if (*((_DWORD *)v65 + 2) != 6) {
              goto LABEL_118;
            }
            goto LABEL_21;
          case 8:
            xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
            goto LABEL_50;
          case 9:
            xpc_object_t v7 = xpc_array_create(0LL, 0LL);
            unint64_t v8 = v7;
            int v9 = 9;
            goto LABEL_54;
          case 10:
            uint64_t v10 = v65;
            if (!v65) {
              return 0LL;
            }
            if (*((_DWORD *)v65 + 2) != 9) {
              goto LABEL_118;
            }
LABEL_21:
            xpc_object_t v7 = xpc_retain(*v10);
            _xpc_xml_parser_pop((uint64_t *)&v65);
            goto LABEL_51;
          case 11:
            xpc_object_t v11 = xpc_array_create(0LL, 0LL);
            goto LABEL_50;
          case 12:
            if (!v65) {
              return 0LL;
            }
            if ((_DWORD)v61 == 13)
            {
              xpc_object_t v7 = xpc_string_create(v4);
              unint64_t v8 = v7;
              int v9 = 12;
LABEL_54:
              _xpc_xml_parser_push(&v65, v8, v9);
              goto LABEL_55;
            }

            if ((_DWORD)v61 != 19) {
              goto LABEL_118;
            }
            uint64_t v12 = _xpc_xml_parser_string_terminate((const void *)v62, *((size_t *)&v62 + 1));
            if (!v12) {
              goto LABEL_118;
            }
            __int128 v13 = (char *)v12;
            if (strchr(v12, 38))
            {
              unint64_t v14 = _xpc_xml_replace_entities(v13);
              if (v14)
              {
                unint64_t v15 = v14;
                free(v13);
                __int128 v13 = v15;
              }
            }

            uint64_t no_copy = (void *)xpc_string_create_no_copy(v13);
            _xpc_xml_parser_push(&v65, no_copy, 12);
            xpc_release(no_copy);
            goto LABEL_56;
          case 14:
            size_t v17 = *((void *)&v62 + 1);
            __s2 = (void *)v62;
            BOOL v18 = v5;
            while (2)
            {
              if ((v61 - 19) < 2)
              {
                int v19 = dispatch_data_create((const void *)v62, *((size_t *)&v62 + 1), 0LL, v6);
                concat = dispatch_data_create_concat(v18, v19);
                dispatch_release(v18);
                dispatch_release(v19);
                BOOL v18 = concat;
                continue;
              }

              break;
            }

            concat = v18;
            if ((_DWORD)v61 != 15) {
              goto LABEL_118;
            }
LABEL_59:
            size_t size_ptr = 0LL;
            buffer_ptr = 0LL;
            dispatch_data_t v23 = dispatch_data_create_map(concat, (const void **)&buffer_ptr, &size_ptr);
            dispatch_release(concat);
            if (!v23) {
              goto LABEL_118;
            }
            xpc_object_t object = v23;
            size_t v24 = size_ptr;
            uint64_t v25 = buffer_ptr;
            if (!_xpc_memcmp(__s2, v17, "data", 4LL))
            {
              unint64_t v30 = v5;
              unint64_t v31 = v4;
              dispatch_data_t v32 = dispatch_data_create(v25, v24, 0LL, v6);
              size_t v33 = (dispatch_data_s *)dispatch_data_create_with_transform();
              int64_t v34 = v32;
              unint64_t v4 = v31;
              uint64_t v5 = v30;
              dispatch_release(v34);
              if (v33)
              {
                xpc_object_t v29 = xpc_data_create_with_dispatch_data(v33);
                dispatch_release(v33);
                unsigned int v28 = object;
                goto LABEL_78;
              }
            }

            char v26 = _xpc_xml_parser_string_terminate(v25, v24);
            if (!v26)
            {
              dispatch_release(object);
              goto LABEL_118;
            }

            int v27 = v26;
            if (_xpc_memcmp(__s2, v17, "string", 6LL))
            {
              if (!_xpc_memcmp(__s2, v17, "integer", 7LL))
              {
                int64_t v38 = strtoll(v27, 0LL, 10);
                xpc_object_t v29 = xpc_int64_create(v38);
                unsigned int v28 = object;
                goto LABEL_77;
              }

              unsigned int v28 = object;
              if (_xpc_memcmp(__s2, v17, "real", 4LL))
              {
                if (_xpc_memcmp(__s2, v17, "date", 4LL)
                  || (memset(&v66, 0, sizeof(v66)), !strptime(v27, "%Y-%m-%dT%H:%M:%SZ", &v66)))
                {
                  xpc_object_t v29 = 0LL;
                  goto LABEL_77;
                }

                uint64_t v41 = v66.tm_year - 101LL;
                double v42 = (double)((int)v41 / 400) * 146097.0 + 0.0;
                uint64_t v43 = v41 - 400LL * ((int)v41 / 400);
                if (v43 < 0)
                {
                  unint64_t v48 = ~v43;
                  uint64_t v49 = v43;
                  do
                  {
                    unint64_t v50 = v48 % 0x190;
                    double v51 = 365.0;
                    if (((v48 % 0x190) & 3) == 0)
                    {
                      double v51 = 365.0;
                      if (v50 != 100)
                      {
                        double v51 = 365.0;
                        if (v50 != 200)
                        {
                          double v51 = 365.0;
                          if (v50 != 300) {
                            double v51 = 366.0;
                          }
                        }
                      }
                    }

                    double v42 = v42 - v51;
                    --v48;
                    ++v49;
                  }

                  while (v49);
                }

                else if (v43)
                {
                  unint64_t v44 = 1LL;
                  uint64_t v45 = v43;
                  do
                  {
                    unint64_t v46 = v44 % 0x190;
                    double v47 = 365.0;
                    if (((v44 % 0x190) & 3) == 0)
                    {
                      double v47 = 365.0;
                      if (v46 != 100)
                      {
                        double v47 = 365.0;
                        if (v46 != 200)
                        {
                          double v47 = 365.0;
                          if (v46 != 300) {
                            double v47 = 366.0;
                          }
                        }
                      }
                    }

                    double v42 = v42 + v47;
                    ++v44;
                    --v45;
                  }

                  while (v45);
                }

                double v52 = v42 + (double)_xpc_mktime_days_before[v66.tm_mon];
                uint64_t v53 = (v43 + 1) % 400;
                if (v53 < 0) {
                  uint64_t v53 = -v53;
                }
                double v54 = v52 + 1.0;
                if (v53 == 300) {
                  double v54 = v52;
                }
                if (v53 == 200) {
                  double v54 = v52;
                }
                if (v53 == 100) {
                  double v54 = v52;
                }
                if ((v53 & 3) != 0) {
                  double v54 = v52;
                }
                if (v66.tm_mon >= 2) {
                  double v52 = v54;
                }
                uint64_t absolute = xpc_date_create_absolute( (v52 + (double)(v66.tm_mday - 1)) * 86400.0 + (double)v66.tm_min * 60.0 + (double)v66.tm_hour * 3600.0 + (double)v66.tm_sec);
              }

              else
              {
                double v39 = strtod(v27, 0LL);
                uint64_t absolute = (uint64_t)xpc_double_create(v39);
              }
            }

            else
            {
              unint64_t v35 = _xpc_xml_parser_string_terminate(v25, v24);
              if (strchr(v35, 38))
              {
                unint64_t v36 = _xpc_xml_replace_entities(v35);
                unsigned int v28 = object;
                if (v36)
                {
                  unint64_t v37 = v36;
                  free(v35);
                  unint64_t v35 = v37;
                }
              }

              else
              {
                unsigned int v28 = object;
              }

              uint64_t absolute = xpc_string_create_no_copy(v35);
            }

            xpc_object_t v29 = (xpc_object_t)absolute;
LABEL_77:
            free(v27);
LABEL_78:
            dispatch_release(v28);
            if (!v29) {
              goto LABEL_118;
            }
            xpc_release(v29);
            goto LABEL_56;
          case 16:
            if (*((void *)&v62 + 1) < 6uLL
              || (*(_DWORD *)v62 == 1769108595 ? (BOOL v21 = *(unsigned __int16 *)(v62 + 4) == 26478) : (BOOL v21 = 0), !v21))
            {
              __int128 v55 = _xpc_xml_parser_string_terminate((const void *)v62, *((size_t *)&v62 + 1));
              if (v55) {
                free(v55);
              }
LABEL_118:
              while (v65)
                _xpc_xml_parser_pop((uint64_t *)&v65);
              return 0LL;
            }

            xpc_object_t v11 = xpc_string_create(v4);
LABEL_50:
            xpc_object_t v7 = v11;
LABEL_51:
LABEL_55:
            xpc_release(v7);
LABEL_56:
            break;
          case 17:
            BOOL v22 = 1;
            goto LABEL_49;
          case 18:
            BOOL v22 = 0;
LABEL_49:
            xpc_object_t v11 = xpc_BOOL_create(v22);
            goto LABEL_50;
          default:
            goto LABEL_56;
        }
      }
    }
  }

  return v2;
}

uint64_t _xpc_xml_lex(int *a1, uint64_t a2)
{
  uint64_t result = 0LL;
  *(_DWORD *)a2 = 0;
  unint64_t v4 = (char *)*((void *)a1 + 4);
  uint64_t v5 = v4 + 1;
  uint64_t v7 = *((void *)a1 + 1);
  unint64_t v6 = *((void *)a1 + 2);
  unint64_t v8 = v7 + v6;
  while (1)
  {
    int v10 = *v4;
    *((_BYTE *)a1 + 40) = v10;
    *((void *)a1 + 4) = v5;
    int v11 = *a1;
    if (*a1)
    {
      if (v11 == 1)
      {
        if (v10 != 60)
        {
          size_t v24 = (char *)v5 - 1;
          *((void *)a1 + 4) = (char *)v5 - 1;
          uint64_t v25 = (char *)v5 - v7 - 1;
          BOOL v19 = v6 >= (unint64_t)v25;
          size_t v26 = v6 - (void)v25;
          if (v19) {
            size_t v27 = v26;
          }
          else {
            size_t v27 = 0LL;
          }
          uint64_t result = (uint64_t)memchr(v24, 60, v27);
          if (result)
          {
            uint64_t v28 = *((void *)a1 + 3);
            *(_DWORD *)a2 = 19;
            *(void *)(a2 + 8) = v28;
            *(void *)(a2 + 16) = v24;
            *(void *)(a2 + 24) = result - (void)v24;
            *((void *)a1 + 4) = result;
            return 1LL;
          }

          return result;
        }

        unint64_t v16 = v6 - ((void)v5 - v7);
        if (v16 < 9 || *v5 != 0x5B41544144435B21LL)
        {
          if (_xpc_xml_lexer_read_tag(a1, a2)) {
            _xpc_xml_lexer_process_tag((int *)a2);
          }
          if ((*(_DWORD *)a2 | 2) == 0xF) {
            *a1 = 0;
          }
          return 1LL;
        }

        *a1 = 2;
        *((void *)a1 + 4) = ++v5;
      }

      else if (v11 == 2)
      {
        size_t v17 = (char *)v5 - 1;
        *((void *)a1 + 4) = (char *)v5 - 1;
        BOOL v18 = (char *)v5 - v7 - 1;
        BOOL v19 = v6 >= (unint64_t)v18;
        size_t v20 = v6 - (void)v18;
        if (v19) {
          size_t v21 = v20;
        }
        else {
          size_t v21 = 0LL;
        }
        uint64_t result = (uint64_t)strnstr(v17, "]]>", v21);
        if (!result) {
          return result;
        }
        uint64_t v23 = *((void *)a1 + 3);
        uint64_t v22 = *((void *)a1 + 4);
        *(_DWORD *)a2 = 20;
        *(void *)(a2 + 8) = v23;
        *(void *)(a2 + 16) = v22;
        *(void *)(a2 + 24) = result - v22;
        *((void *)a1 + 4) = result + 3;
        uint64_t result = 1LL;
        goto LABEL_39;
      }

      goto LABEL_25;
    }

    uint64_t result = 0LL;
    if (v10 <= 12)
    {
      if (v10 != 9)
      {
        if (v10 != 10) {
          return result;
        }
        ++*((void *)a1 + 3);
      }

      goto LABEL_25;
    }

    if (v10 != 13 && v10 != 32)
    {
      if (v10 != 60) {
        return result;
      }
      uint64_t v12 = (char *)v5 + 1;
    }

LABEL_25:
    unint64_t v4 = (char *)v5;
    uint64_t v5 = (void *)((char *)v5 + 1);
    unint64_t v8 = v7 + v6;
  }

  int v13 = *(char *)v5;
  *((_BYTE *)a1 + 40) = *(_BYTE *)v5;
  *((void *)a1 + 4) = v12;
  if (v13 != 33)
  {
    if (v13 == 63) {
      return _xpc_xml_lexer_read_header(a1, a2);
    }
    *((void *)a1 + 4) = v5;
    if (_xpc_xml_lexer_read_tag(a1, a2)) {
      _xpc_xml_lexer_process_tag((int *)a2);
    }
    uint64_t result = 1LL;
    if ((*(_DWORD *)a2 | 2) != 0xE) {
      return result;
    }
LABEL_39:
    *a1 = 1;
    return result;
  }

  else {
    size_t v14 = 0LL;
  }
  if (v14 < 5) {
    return 0LL;
  }
  if (*(_WORD *)v12 == 11565)
  {
    uint64_t result = (uint64_t)strnstr(v12, "-->", v14);
    if (!result) {
      return result;
    }
    *(_DWORD *)a2 = 3;
    uint64_t v15 = *((void *)a1 + 4) + 2LL;
    *(void *)(a2 + 8) = *((void *)a1 + 3);
    *(void *)(a2 + 16) = v15;
    *(void *)(a2 + 24) = result - v15;
    uint64_t v5 = (void *)(result + 3);
    *((void *)a1 + 4) = result + 3;
    uint64_t v7 = *((void *)a1 + 1);
    unint64_t v6 = *((void *)a1 + 2);
    goto LABEL_25;
  }

  if (v14 < 0xE) {
    return 0LL;
  }
  unint64_t v30 = (char *)v5 + 14;
  *((void *)a1 + 4) = (char *)v5 + 14;
  unint64_t v31 = (char *)v5 - v7 + 14;
  BOOL v19 = v6 >= (unint64_t)v31;
  size_t v32 = v6 - (void)v31;
  if (v19) {
    size_t v33 = v32;
  }
  else {
    size_t v33 = 0LL;
  }
  uint64_t result = (uint64_t)strnstr(v30, ">", v33);
  if (result)
  {
    *(_DWORD *)a2 = 2;
    *(void *)(a2 + 8) = *((void *)a1 + 3);
    *(void *)(a2 + 16) = 0LL;
    *((void *)a1 + 4) = result + 1;
    return 1LL;
  }

  return result;
}

void *_xpc_xml_parser_push(void *a1, void *a2, int a3)
{
  uint64_t result = _xpc_alloc(0x18uLL);
  uint64_t v7 = result;
  void *result = 0LL;
  if (a2)
  {
    uint64_t result = xpc_retain(a2);
    *uint64_t v7 = result;
  }

  *((_DWORD *)v7 + 2) = a3;
  void v7[2] = *a1;
  *a1 = v7;
  return result;
}

void _xpc_xml_parser_pop(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    if (*(void *)v1) {
      xpc_release(*(xpc_object_t *)v1);
    }
    *a1 = *(void *)(v1 + 16);
    free((void *)v1);
  }

uint64_t _xpc_xml_parser_stack_finish_leaf(uint64_t *a1, xpc_object_t value)
{
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  int v5 = *(_DWORD *)(v2 + 8);
  if (v5 == 12)
  {
    xpc_object_t v6 = xpc_retain(*(xpc_object_t *)v2);
    _xpc_xml_parser_pop(a1);
    if (*a1 && *(_DWORD *)(*a1 + 8) == 6)
    {
      int64_t string_ptr = xpc_string_get_string_ptr(v6);
      xpc_dictionary_set_value(*(xpc_object_t *)*a1, string_ptr, value);
      xpc_release(v6);
      return 1LL;
    }

    return 0LL;
  }

  if (v5 == 9)
  {
    xpc_array_append_value(*(xpc_object_t *)v2, value);
    return 1LL;
  }

  if (v5 != 4) {
    return 0LL;
  }
  *(void *)*a1 = xpc_retain(value);
  return 1LL;
}

_BYTE *_xpc_xml_parser_string_terminate(const void *a1, size_t a2)
{
  unint64_t v4 = malloc(a2 + 1);
  int v5 = v4;
  if (v4)
  {
    memcpy(v4, a1, a2);
    v5[a2] = 0;
  }

  return v5;
}

char *_xpc_xml_replace_entities(const char *a1)
{
  uint64_t v2 = strchr(a1, 38);
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t v4 = 0LL;
    while (1)
    {
      int v5 = strchr(v3, 59);
      if (!v5) {
        return v4;
      }
      xpc_object_t v6 = v5;
      unsigned int v7 = (_DWORD)v5 - (_DWORD)v3;
      if (v5 - v3 >= 3)
      {
        if (v3[1] != 35)
        {
          uint64_t v15 = 0LL;
          while ((char *)(v7 - 1) != (&entity_table)[v15 + 1] || strncmp(v3 + 1, (&entity_table)[v15], v7 - 1))
          {
            v15 += 3LL;
            if (v15 == 15)
            {
              if (v7 != 1) {
                goto LABEL_43;
              }
              unsigned int v10 = 0;
              goto LABEL_30;
            }
          }

          unsigned int v10 = (&entity_table)[v15 + 2];
          if (v4) {
            goto LABEL_32;
          }
LABEL_31:
          unint64_t v4 = _xpc_strdup(a1);
          uint64_t v3 = &v4[v3 - a1];
LABEL_32:
          size_t v16 = strlen(v3);
          if (v10 > 0x7F)
          {
            if (v10 > 0x7FF)
            {
              if (HIWORD(v10))
              {
                xpc_object_t v6 = v3;
                if (!(v10 >> 21))
                {
                  *uint64_t v3 = (v10 >> 18) | 0xF0;
                  v3[1] = (v10 >> 12) & 0x3F | 0x80;
                  void v3[2] = (v10 >> 6) & 0x3F | 0x80;
                  xpc_object_t v6 = v3 + 4;
                  void v3[3] = v10 & 0x3F | 0x80;
                }
              }

              else
              {
                *uint64_t v3 = (v10 >> 12) | 0xE0;
                v3[1] = (v10 >> 6) & 0x3F | 0x80;
                xpc_object_t v6 = v3 + 3;
                void v3[2] = v10 & 0x3F | 0x80;
              }
            }

            else
            {
              *uint64_t v3 = (v10 >> 6) | 0xC0;
              xpc_object_t v6 = v3 + 2;
              v3[1] = v10 & 0x3F | 0x80;
            }
          }

          else
          {
            *uint64_t v3 = v10;
            xpc_object_t v6 = v3 + 1;
          }

          memmove(v6, &v3[v7 + 1], v16 - (v7 + 1) + 1);
          goto LABEL_43;
        }

        int v8 = v3[2];
        if (v8 == 120) {
          unsigned int v7 = 3;
        }
        else {
          unsigned int v7 = 2;
        }
        int v9 = v3[v7];
        if (v9 != 59)
        {
          unsigned int v10 = 0;
          if (v8 == 120) {
            int v11 = 16;
          }
          else {
            int v11 = 10;
          }
          do
          {
            int v12 = (char)v9;
            if ((v9 - 48) > 9u)
            {
              if (v8 != 120 || (int v13 = (char)v9 - 97, (v12 - 97) > 5u))
              {
                int v13 = v12 - 65;
              }
            }

            else
            {
              int v13 = (char)v9 - 48;
            }

            unsigned int v10 = v13 + v10 * v11;
            int v9 = v3[++v7];
          }

          while (v9 != 59);
LABEL_30:
          if (!v4) {
            goto LABEL_31;
          }
          goto LABEL_32;
        }
      }

LABEL_43:
      uint64_t v3 = strchr(v6, 38);
      if (!v3) {
        return v4;
      }
    }
  }

  return 0LL;
}

    if (a4)
    {
      uint64_t v28 = ccder_sizeof(0xA000000000000010LL, *(void *)(a3 + 16));
      xpc_object_t v29 = ccder_sizeof(2LL, 1uLL);
      if ((ccder_blob_encode_tl((uint64_t *)&v36, 0x6000000000000010uLL, v29 + v28) & 1) != 0)
      {
        size_t v33 = 0LL;
        int64_t v34 = 0LL;
        unint64_t v35 = 0LL;
        xpc_object_t v6 = (void *)CEValidateWithOptions(v31, a2, (uint64_t *)&v33, a5, a6);
        if (v6 != &Errors) {
          cc_clear(__n, a5);
        }
        return (uint64_t)v6;
      }

      return (uint64_t)&unk_18962B810;
    }
  }

uint64_t _xpc_xml_lexer_read_header(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  unint64_t v5 = v4 - (v2 - v3);
  if (v4 < v2 - v3) {
    unint64_t v5 = 0LL;
  }
  if (v5 < 6 || *(_DWORD *)v2 != 543976824) {
    return 0LL;
  }
  a1[4] = v2 + 4;
  unint64_t v9 = v2 + 4 - v3;
  BOOL v10 = v4 >= v9;
  size_t v11 = v4 - v9;
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = 0LL;
  }
  uint64_t result = (uint64_t)strnstr((const char *)(v2 + 4), "?>", v12);
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v15 = a1[3];
    uint64_t v14 = a1[4];
    uint64_t v16 = result - v14;
    uint64_t result = 1LL;
    *(_DWORD *)a2 = 1;
    *(void *)(a2 + 8) = v15;
    *(void *)(a2 + 16) = v14;
    *(void *)(a2 + 24) = v16;
    a1[4] = v13 + 2;
  }

  return result;
}

BOOL _xpc_xml_lexer_read_tag(void *a1, uint64_t a2)
{
  unint64_t v4 = (const char *)a1[4];
  unint64_t v5 = a1[2];
  xpc_object_t v6 = &v4[-a1[1]];
  BOOL v7 = v5 >= (unint64_t)v6;
  size_t v8 = v5 - (void)v6;
  if (v7) {
    size_t v9 = v8;
  }
  else {
    size_t v9 = 0LL;
  }
  BOOL v10 = strnstr(v4, ">", v9);
  if (v10)
  {
    uint64_t v12 = a1[3];
    size_t v11 = (_BYTE *)a1[4];
    *(_DWORD *)a2 = 14;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 16) = v11;
    *(void *)(a2 + 24) = v10 - v11;
    if (*v11 == 47)
    {
      *(_DWORD *)a2 = 15;
      *(void *)(a2 + 16) = v11 + 1;
    }

    else
    {
      if (*(v10 - 1) != 47)
      {
LABEL_10:
        a1[4] = v10 + 1;
        return v10 != 0LL;
      }

      *(_DWORD *)a2 = 16;
    }

    *(void *)(a2 + 24) = v10 - v11 - 1;
    goto LABEL_10;
  }

  return v10 != 0LL;
}

int *_xpc_xml_lexer_process_tag(int *result)
{
  int v1 = *result;
  if (*result == 16)
  {
    unint64_t v6 = *((void *)result + 3);
    if (v6 < 4) {
      return result;
    }
    BOOL v7 = (int *)*((void *)result + 2);
    if (*v7 == 1952672100)
    {
      int v5 = 8;
      goto LABEL_80;
    }

    if (v6 < 5)
    {
      if (*v7 != 1702195828) {
        return result;
      }
    }

    else
    {
      if (*v7 == 1634890337 && *((_BYTE *)v7 + 4) == 121)
      {
        int v5 = 11;
        goto LABEL_80;
      }

      if (*v7 != 1702195828)
      {
        int v9 = *v7;
        int v10 = *((unsigned __int8 *)v7 + 4);
        if (v9 == 1936482662 && v10 == 101)
        {
          int v5 = 18;
          goto LABEL_80;
        }

        return result;
      }
    }

    int v5 = 17;
    goto LABEL_80;
  }

  if (v1 == 15)
  {
    unint64_t v12 = *((void *)result + 3);
    if (v12 < 5)
    {
      if (v12 != 4)
      {
        if (v12 <= 2) {
          return result;
        }
        size_t v27 = (unsigned __int16 *)*((void *)result + 2);
        int v28 = *v27;
        int v29 = *((unsigned __int8 *)v27 + 2);
        if (v28 != 25963 || v29 != 121) {
          return result;
        }
        goto LABEL_73;
      }

      uint64_t v13 = (int *)*((void *)result + 2);
    }

    else
    {
      uint64_t v13 = (int *)*((void *)result + 2);
      if (*v13 == 1936288880 && *((_BYTE *)v13 + 4) == 116)
      {
        int v5 = 5;
        goto LABEL_80;
      }
    }

    if (*v13 == 1952672100)
    {
      int v5 = 7;
      goto LABEL_80;
    }

    if (*(_WORD *)v13 != 25963 || *((_BYTE *)v13 + 2) != 121)
    {
      if (v12 >= 5)
      {
        int v20 = *v13;
        int v21 = *((unsigned __int8 *)v13 + 4);
        if (v20 == 1634890337 && v21 == 121)
        {
          int v5 = 10;
          goto LABEL_80;
        }
      }

      return result;
    }

LABEL_73:
    int v5 = 13;
    goto LABEL_80;
  }

  if (v1 != 14) {
    return result;
  }
  unint64_t v2 = *((void *)result + 3);
  if (v2 >= 5)
  {
    uint64_t v3 = (int *)*((void *)result + 2);
    if (*v3 == 1936288880 && *((_BYTE *)v3 + 4) == 116)
    {
      int v5 = 4;
      goto LABEL_80;
    }

    goto LABEL_34;
  }

  if (v2 == 4)
  {
    uint64_t v3 = (int *)*((void *)result + 2);
LABEL_34:
    if (*v3 == 1952672100)
    {
      int v5 = 6;
      goto LABEL_80;
    }

    if (*(_WORD *)v3 != 25963 || *((_BYTE *)v3 + 2) != 121)
    {
      if (v2 < 5) {
        return result;
      }
      int v16 = *v3;
      int v17 = *((unsigned __int8 *)v3 + 4);
      if (v16 != 1634890337 || v17 != 121) {
        return result;
      }
      int v5 = 9;
LABEL_80:
      void *result = v5;
      return result;
    }

LABEL_66:
    int v5 = 12;
    goto LABEL_80;
  }

  if (v2 > 2)
  {
    uint64_t v23 = (unsigned __int16 *)*((void *)result + 2);
    int v24 = *v23;
    int v25 = *((unsigned __int8 *)v23 + 2);
    if (v24 == 25963 && v25 == 121) {
      goto LABEL_66;
    }
  }

  return result;
}

BOOL _xpc_mach_recv_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t _xpc_mach_recv_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_mach_recv_desc(unsigned int *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  uint64_t v4 = a1[6];
  if ((_DWORD)v4 == -1)
  {
    unint64_t v6 = "(consumed)";
    int v7 = -1;
  }

  else
  {
    *(_DWORD *)__str = 0;
    int v5 = MEMORY[0x186DF6E54](*MEMORY[0x1895FFD48], v4, 1LL, __str);
    if (v5)
    {
      if (v5 == 15)
      {
        unint64_t v6 = "(none)";
      }

      else if (v5 == 17)
      {
        unint64_t v6 = "(consumed)";
      }

      else
      {
        unint64_t v6 = "(invalid)";
      }
    }

    else
    {
      unint64_t v6 = "receive";
    }

    int v7 = a1[6];
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v12 = 0u;
  unsigned int v8 = snprintf(__str, 0x80uLL, "<%s: %p> { name = 0x%x, right = %s }", "mach receive right", a1, v7, v6);
  if (v8 >= 0x7F) {
    int v9 = 127;
  }
  else {
    int v9 = v8;
  }
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_mach_recv_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", port = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_mach_recv_serialize(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = (unsigned int *)(a1 + 24);
  do
    int v4 = __ldxr(v3);
  while (__stxr(0xFFFFFFFF, v3));
  if (v4 == -1)
  {
    unint64_t v6 = _xpc_asprintf("Multiple attempts to serialize a receive right.", a2, a3, a1);
    _xpc_api_misuse(v6);
  }

  int v7 = 86016;
  return _xpc_serializer_append_port(a2, &v7, 4uLL, a1, v4, 16);
}

uint64_t _xpc_mach_recv_deserialize(uint64_t *a1)
{
  int v3 = 0;
  int v1 = v3;
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 3u;
  return result;
}

uint64_t _xpc_mach_recv_wire_length()
{
  return -1LL;
}

uint64_t _xpc_mach_recv_dispose(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 24);
  do
    uint64_t result = __ldxr(v1);
  while (__stxr(0, v1));
  if ((result - 1) <= 0xFFFFFFFD)
  {
    uint64_t result = _xpc_mach_port_close_recv(result, 0, 0LL);
    if ((_DWORD)result) {
      return _os_assumes_log();
    }
  }

  return result;
}

uint64_t xpc_mach_recv_create(int a1)
{
  uint64_t result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  return result;
}

uint64_t xpc_mach_recv_extract_right(unsigned int *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_mach_recv) {
    return 0LL;
  }
  int v3 = a1 + 6;
  do
    uint64_t result = __ldxr(v3);
  while (__stxr(0xFFFFFFFF, v3));
  if ((_DWORD)result == -1)
  {
    int v4 = _xpc_asprintf("Attempt to extract a receive right multiple times from the same object. This is unsafe.");
    _xpc_api_misuse(v4);
  }

  return result;
}

BOOL _xpc_bundle_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_bundle_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v91 = *MEMORY[0x1895FEE08];
  _xpc_bundle_resolve(a1);
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v76 = 0u;
  unsigned int v4 = snprintf(__str, 0x100uLL, "<%s: %p> {\n", "bundle", (const void *)a1);
  if (v4 >= 0xFF) {
    size_t v5 = 255LL;
  }
  else {
    size_t v5 = v4;
  }
  _xpc_serializer_append(a2, __str, v5, 0);
  uint64_t v6 = _xpc_serializer_pad(a2);
  uint64_t v7 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v8 = v7;
  size_t v9 = 256 - v7;
  if ((unint64_t)(256 - v7) < 2)
  {
    size_t v10 = 0LL;
  }

  else
  {
    size_t v10 = snprintf(&__str[v7], v9, "resolved = %d,\n", (*(unsigned __int8 *)(a1 + 296) >> 2) & 1);
    if (v9 <= v10) {
      size_t v10 = 255 - v8;
    }
  }

  _xpc_serializer_append(a2, __str, v10 + v8, 0);
  uint64_t v11 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v12 = v11;
  size_t v13 = 256 - v11;
  if ((unint64_t)(256 - v11) < 2)
  {
    size_t v14 = 0LL;
  }

  else
  {
    size_t v14 = snprintf(&__str[v11], v13, "populated = %d,\n", (*(unsigned __int8 *)(a1 + 296) >> 3) & 1);
    if (v13 <= v14) {
      size_t v14 = 255 - v12;
    }
  }

  _xpc_serializer_append(a2, __str, v14 + v12, 0);
  if (*(void *)(a1 + 288))
  {
    uint64_t v15 = _xpc_object_pad(__str, 0x100uLL, v6);
    uint64_t v16 = v15;
    size_t v17 = 256 - v15;
    if ((unint64_t)(256 - v15) < 2)
    {
      size_t v18 = 0LL;
    }

    else
    {
      size_t v18 = snprintf(&__str[v15], v17, "taint = %s,\n", *(const char **)(a1 + 288));
      if (v17 <= v18) {
        size_t v18 = 255 - v16;
      }
    }

    _xpc_serializer_append(a2, __str, v18 + v16, 0);
  }

  uint64_t v19 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v20 = v19;
  size_t v21 = 256 - v19;
  if ((unint64_t)(256 - v19) < 2)
  {
    size_t v22 = 0LL;
  }

  else
  {
    size_t v22 = snprintf(&__str[v19], v21, "error = %d,\n", *(_DWORD *)(a1 + 36));
    if (v21 <= v22) {
      size_t v22 = 255 - v20;
    }
  }

  _xpc_serializer_append(a2, __str, v22 + v20, 0);
  uint64_t v23 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v24 = v23;
  size_t v25 = 256 - v23;
  if ((unint64_t)(256 - v23) < 2)
  {
    size_t v26 = 0LL;
  }

  else
  {
    size_t v26 = snprintf(&__str[v23], v25, "origin type = %d,\n", *(_DWORD *)(a1 + 40));
    if (v25 <= v26) {
      size_t v26 = 255 - v24;
    }
  }

  _xpc_serializer_append(a2, __str, v26 + v24, 0);
  uint64_t v27 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v28 = v27;
  size_t v29 = 256 - v27;
  if ((unint64_t)(256 - v27) < 2)
  {
    size_t v30 = 0LL;
  }

  else
  {
    size_t v30 = snprintf(&__str[v27], v29, "origin path = %s,\n", *(const char **)(a1 + 48));
    if (v29 <= v30) {
      size_t v30 = 255 - v28;
    }
  }

  _xpc_serializer_append(a2, __str, v30 + v28, 0);
  uint64_t v31 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v32 = v31;
  size_t v33 = 256 - v31;
  if ((unint64_t)(256 - v31) < 2)
  {
    size_t v34 = 0LL;
  }

  else
  {
    size_t v34 = snprintf(&__str[v31], v33, "resolved origin path = %s,\n", *(const char **)(a1 + 56));
    if (v33 <= v34) {
      size_t v34 = 255 - v32;
    }
  }

  _xpc_serializer_append(a2, __str, v34 + v32, 0);
  uint64_t v35 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v36 = v35;
  size_t v37 = 256 - v35;
  if ((unint64_t)(256 - v35) < 2)
  {
    size_t v38 = 0LL;
  }

  else
  {
    size_t v38 = snprintf(&__str[v35], v37, "root path = %s,\n", *(const char **)(a1 + 64));
    if (v37 <= v38) {
      size_t v38 = 255 - v36;
    }
  }

  _xpc_serializer_append(a2, __str, v38 + v36, 0);
  uint64_t v39 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v40 = v39;
  size_t v41 = 256 - v39;
  if ((unint64_t)(256 - v39) < 2)
  {
    size_t v42 = 0LL;
  }

  else
  {
    size_t v42 = snprintf(&__str[v39], v41, "executable path = %s,\n", *(const char **)(a1 + 232));
    if (v41 <= v42) {
      size_t v42 = 255 - v40;
    }
  }

  _xpc_serializer_append(a2, __str, v42 + v40, 0);
  uint64_t v43 = _xpc_object_pad(__str, 0x100uLL, v6);
  uint64_t v44 = v43;
  size_t v45 = 256 - v43;
  if ((unint64_t)(256 - v43) < 2)
  {
    size_t v46 = 0LL;
  }

  else
  {
    size_t v46 = snprintf(&__str[v43], v45, "info plist = ");
    if (v45 <= v46) {
      size_t v46 = 255 - v44;
    }
  }

  _xpc_serializer_append(a2, __str, v46 + v44, 0);
  double v47 = *(unint64_t **)(a1 + 240);
  if (v47)
  {
    if (((unint64_t)v47 & 0x8000000000000000LL) != 0)
    {
      uint64_t v48 = 0LL;
      uint64_t v49 = *MEMORY[0x189616658];
      unint64_t v50 = v49 ^ (unint64_t)v47;
      do
      {
        if ((v50 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v48)) {
          break;
        }
        ++v48;
      }

      while (v48 != 7);
      unint64_t v51 = v48 | v50;
      uint64_t v52 = v48 & 7;
      int v53 = (v51 >> 55) + 8;
      if (v52 == 7) {
        LODWORD(v52) = v53;
      }
      if ((_DWORD)v52 == 12)
      {
        extension_vtable = &_OS_xpc_type_uint64;
      }

      else
      {
        if ((_DWORD)v52 != 13) {
          goto LABEL_101;
        }
        extension_vtable = &_OS_xpc_type_int64;
      }
    }

    else
    {
      unint64_t v55 = *v47;
      if (*v47 < (unint64_t)OBJC_CLASS___OS_xpc_object
        || v55 > (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
        || (v55 & 7) != 0)
      {
        extension_vtable = _xpc_get_extension_vtable(*(id *)(a1 + 240));
      }

      else
      {
        extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v55 - (void)OBJC_CLASS___OS_xpc_object));
      }
    }

    (*((void (**)(unint64_t *, uint64_t))extension_vtable + 6))(v47, a2);
    uint64_t v56 = *(void *)(a2 + 56) + 1LL;
    --*(void *)(a2 + 48);
    *(void *)(a2 + 56) = v56;
  }

  else
  {
    _xpc_serializer_append(a2, "(null)", 6uLL, 0);
  }

  _xpc_serializer_append(a2, "\n", 1uLL, 0);
  if (*(void *)(a1 + 248))
  {
    uint64_t v57 = _xpc_object_pad(__str, 0x100uLL, v6);
    uint64_t v58 = v57;
    size_t v59 = 256 - v57;
    if ((unint64_t)(256 - v57) < 2)
    {
      size_t v60 = 0LL;
    }

    else
    {
      size_t v60 = snprintf(&__str[v57], v59, "services = ");
      if (v59 <= v60) {
        size_t v60 = 255 - v58;
      }
    }

    _xpc_serializer_append(a2, __str, v60 + v58, 0);
    __int128 v61 = *(unint64_t **)(a1 + 248);
    if (((unint64_t)v61 & 0x8000000000000000LL) == 0)
    {
      unint64_t v69 = *v61;
      if (*v61 < (unint64_t)OBJC_CLASS___OS_xpc_object
        || v69 > (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
        || (v69 & 7) != 0)
      {
        v68 = _xpc_get_extension_vtable(v61);
      }

      else
      {
        v68 = (int *)((char *)&_xpc_vtables + 2 * (v69 - (void)OBJC_CLASS___OS_xpc_object));
      }

      goto LABEL_97;
    }

    uint64_t v62 = 0LL;
    uint64_t v63 = *MEMORY[0x189616658];
    unint64_t v64 = v63 ^ (unint64_t)v61;
    do
    {
      if ((v64 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v62)) {
        break;
      }
      ++v62;
    }

    while (v62 != 7);
    unint64_t v65 = v62 | v64;
    uint64_t v66 = v62 & 7;
    int v67 = (v65 >> 55) + 8;
    if (v66 == 7) {
      LODWORD(v66) = v67;
    }
    if ((_DWORD)v66 == 12)
    {
      v68 = &_OS_xpc_type_uint64;
      goto LABEL_97;
    }

    if ((_DWORD)v66 == 13)
    {
      v68 = &_OS_xpc_type_int64;
LABEL_97:
      (*((void (**)(unint64_t *, uint64_t))v68 + 6))(v61, a2);
      uint64_t v70 = *(void *)(a2 + 56) + 1LL;
      --*(void *)(a2 + 48);
      *(void *)(a2 + 56) = v70;
      _xpc_serializer_append(a2, "\n", 1uLL, 0);
      goto LABEL_98;
    }

LABEL_101:
    unint64_t v74 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v74);
  }

LABEL_98:
  uint64_t v71 = _xpc_serializer_unpad(a2);
  size_t v72 = _xpc_object_pad(__str, 0x100uLL, v71);
  _xpc_serializer_append(a2, __str, v72, 0);
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

uint64_t _xpc_bundle_debug()
{
  return 0LL;
}

uint64_t _xpc_bundle_deserialize()
{
  return 0LL;
}

uint64_t _xpc_bundle_wire_length()
{
  return -1LL;
}

void _xpc_bundle_dispose(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 240);
  if (v2) {
    xpc_release(v2);
  }
  int v3 = *(void **)(a1 + 248);
  if (v3) {
    xpc_release(v3);
  }
  unsigned int v4 = *(dispatch_object_s **)(a1 + 264);
  if (v4) {
    dispatch_release(v4);
  }
  size_t v5 = *(dispatch_object_s **)(a1 + 256);
  if (v5) {
    dispatch_release(v5);
  }
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 232));
}

char *xpc_bundle_copy_normalized_cryptex_path(const char *a1)
{
  unint64_t v2 = _normalize_cryptex_path(a1);
  if (!v2) {
    unint64_t v2 = a1;
  }
  return _xpc_strdup(v2);
}

const char *_normalize_cryptex_path(const char *a1)
{
  if (_xpc_has_prefix(a1, "/private/preboot/Cryptexes/OS/")) {
    return a1 + 29;
  }
  BOOL has_prefix = _xpc_has_prefix(a1, "/System/Cryptexes/OS/");
  uint64_t v4 = 20LL;
  if (!has_prefix) {
    uint64_t v4 = 0LL;
  }
  size_t v5 = &a1[v4];
  if (has_prefix) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t xpc_bundle_create(const char *a1, unsigned int a2)
{
  char v2 = a2;
  uint64_t result = xpc_bundle_create_from_origin((a2 >> 1) & 1, a1);
  *(_BYTE *)(result + 296) |= 1u;
  if ((v2 & 4) != 0)
  {
    uint64_t v4 = _xpc_asprintf("This platform does not support bundles in other platforms' formats.");
    _xpc_api_misuse(v4);
  }

  return result;
}

uint64_t xpc_bundle_create_from_origin(int a1, const char *a2)
{
  uint64_t v4 = _xpc_base_create();
  *(_DWORD *)(v4 + 40) = a1;
  size_t v5 = _xpc_strdup(a2);
  *(void *)(v4 + 48) = v5;
  if (v5[strlen(v5) - 1] == 47)
  {
    uint64_t v6 = strrchr(v5, 47) + 2;
    do
    {
      int v7 = *(v6 - 2);
      --v6;
    }

    while (v7 == 47);
    *uint64_t v6 = 0;
  }

  return v4;
}

uint64_t xpc_bundle_create_main()
{
  uint64_t v3 = *MEMORY[0x1895FEE08];
  bzero(buf, 0x400uLL);
  bufsize_t size = 1024;
  _NSGetExecutablePath(buf, &bufsize);
  uint64_t result = xpc_bundle_create_from_origin(1, buf);
  *(_BYTE *)(result + 296) |= 1u;
  return result;
}

void xpc_bundle_resolve(uint64_t a1, dispatch_object_s *a2, uint64_t a3, uint64_t a4)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  xpc_bundle_resolve_on_queue(a1, a2, global_queue, a3, a4);
}

void xpc_bundle_resolve_on_queue( uint64_t a1, dispatch_object_s *a2, dispatch_object_t object, uint64_t a4, uint64_t a5)
{
  if ((*(_BYTE *)(a1 + 296) & 8) != 0)
  {
    size_t v9 = _xpc_asprintf("Attempt to resolve populated bundle.", a2, object);
    _xpc_api_misuse(v9);
  }

  *(void *)(a1 + 256) = object;
  dispatch_retain(object);
  *(void *)(a1 + 264) = a2;
  dispatch_retain(a2);
  *(void *)(a1 + 272) = a5;
  *(void *)(a1 + 280) = a4;
  _xpc_bundle_resolve(a1);
}

void _xpc_bundle_resolve(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  char v2 = (dispatch_once_t *)(a1 + 24);
  block[4] = a1;
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = ___xpc_bundle_resolve_block_invoke;
  block[3] = &__block_descriptor_tmp_26;
  if (v3 != -1) {
    dispatch_once(v2, block);
  }
}

void xpc_bundle_populate(uint64_t a1, xpc_object_t object, void *a3)
{
  if (*(_DWORD *)(a1 + 40) == 2)
  {
    int v7 = _xpc_asprintf("Attempt to populate an unknown bundle type.", object);
    goto LABEL_12;
  }

  if (*(void *)(a1 + 256))
  {
    int v7 = _xpc_asprintf("Attempt to populate a non-inert bundle.", object);
LABEL_12:
    _xpc_api_misuse(v7);
  }

  if (object) {
    xpc_object_t v5 = xpc_retain(object);
  }
  else {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  *(void *)(a1 + 240) = v5;
  if (a3) {
    xpc_object_t v6 = xpc_retain(a3);
  }
  else {
    xpc_object_t v6 = xpc_array_create(0LL, 0LL);
  }
  *(void *)(a1 + 248) = v6;
  *(_BYTE *)(a1 + 296) |= 8u;
  _xpc_bundle_resolve(a1);
}

char *xpc_bundle_get_property(uint64_t a1, int a2)
{
  uint64_t result = 0LL;
  switch(a2)
  {
    case 0:
      uint64_t result = (char *)*(int *)(a1 + 40);
      break;
    case 1:
      uint64_t result = *(char **)(a1 + 48);
      break;
    case 2:
      uint64_t result = *(char **)(a1 + 64);
      break;
    case 3:
      uint64_t result = *(char **)(a1 + 232);
      break;
    case 4:
      uint64_t result = (char *)(a1 + 80);
      break;
    case 6:
      uint64_t result = *(char **)(a1 + 288);
      break;
    case 7:
      uint64_t result = *(char **)(a1 + 240);
      break;
    case 9:
      uint64_t result = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 5, 0LL);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t xpc_bundle_get_path(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t xpc_bundle_get_executable_path(uint64_t a1)
{
  return *(void *)(a1 + 232);
}

void *xpc_bundle_copy_info_dictionary(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 240);
  if (result)
  {
    xpc_retain(result);
    return *(void **)(a1 + 240);
  }

  return result;
}

uint64_t xpc_bundle_get_info_dictionary(uint64_t a1)
{
  return *(void *)(a1 + 240);
}

xpc_object_t xpc_bundle_get_xpcservice_dictionary(uint64_t a1)
{
  xpc_object_t result = *(xpc_object_t *)(a1 + 240);
  if (result)
  {
    xpc_object_t result = xpc_dictionary_get_value(result, "XPCService");
    if (result)
    {
      xpc_object_t v3 = result;
      if (xpc_get_type(result) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary) {
        return v3;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

void *xpc_bundle_copy_services(uint64_t a1)
{
  xpc_object_t result = *(void **)(a1 + 248);
  if (result)
  {
    xpc_retain(result);
    return *(void **)(a1 + 248);
  }

  return result;
}

char *xpc_bundle_copy_resource_path(uint64_t a1, const char *a2, const char *a3)
{
  xpc_object_t v6 = *(const char **)(a1 + 72);
  if (v6) {
    return _xpc_asprintf("%s/%s.%s", v6, a2, a3);
  }
  else {
    return 0LL;
  }
}

void xpc_bundle_resolve_sync(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 296) & 1) == 0) {
    _xpc_rich_error_serialize_cold_1();
  }
  _xpc_bundle_resolve(a1);
}

uint64_t xpc_bundle_get_error(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

void ___xpc_bundle_resolve_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 296) & 8) != 0)
  {
    *(void *)(v2 + 56) = _xpc_strdup(*(const char **)(v2 + 48));
    xpc_object_t v6 = _xpc_strdup(*(const char **)(v2 + 48));
    int v7 = strrchr(v6, 47);
    if (v7) {
      *int v7 = 0;
    }
    if (*v6)
    {
      if (_xpc_has_suffix(v6, "/Contents/MacOS"))
      {
        unsigned int v8 = 0;
LABEL_15:
        *(_DWORD *)(v2 + 32) = v8;
        free(v6);
        if (*(_DWORD *)(v2 + 40) == 1) {
          uint64_t v12 = _xpc_bundle_copy_container(v8, *(const char **)(v2 + 48));
        }
        else {
          uint64_t v12 = _xpc_strdup(*(const char **)(v2 + 48));
        }
        *(void *)(v2 + 64) = v12;
        _xpc_bundle_normalize_cryptex_path((const char **)(v2 + 64));
        if (!**(_BYTE **)(v2 + 64))
        {
          *(void *)(v2 + 288) = "invalid populated entry";
          uint64_t v16 = 0LL;
          uint64_t v17 = 0LL;
          uint64_t v14 = 0LL;
          uint64_t v15 = 0LL;
          if ((_dyld_get_image_uuid() & 1) == 0)
          {
            uint64_t v16 = 0LL;
            uint64_t v17 = 0LL;
          }

          if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          {
            void block[5] = 0LL;
            _dyld_get_shared_cache_range();
          }

          else
          {
            uint64_t v14 = 0LL;
            uint64_t v15 = 0LL;
          }

          _os_log_simple();
        }

        _xpc_bundle_resolve_executable(v2);
        uint64_t v10 = *(void *)(a1 + 32);
        goto LABEL_26;
      }

      uint64_t v11 = strrchr(v6, 47);
      if (v11) {
        *uint64_t v11 = 0;
      }
      if (_xpc_has_suffix(v6, "/Versions"))
      {
        unsigned int v8 = 1;
        goto LABEL_15;
      }
    }

    unsigned int v8 = 2;
    goto LABEL_15;
  }

  xpc_object_t v3 = *(void **)(a1 + 32);
  if ((*(_BYTE *)(v2 + 296) & 1) == 0)
  {
    xpc_retain(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    xpc_object_t v5 = *(dispatch_queue_s **)(v4 + 256);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___xpc_bundle_resolve_block_invoke_2;
    block[3] = &__block_descriptor_tmp_14;
    block[4] = v4;
    dispatch_async(v5, block);
    return;
  }

  int v9 = _xpc_bundle_resolve_sync((uint64_t)v3);
  uint64_t v10 = *(void *)(a1 + 32);
  *(_DWORD *)(v10 + 36) = v9;
LABEL_26:
  *(_BYTE *)(v10 + 296) |= 4u;
}

uint64_t _xpc_bundle_resolve_sync(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  uint64_t v2 = _xpc_realpath(*(const char **)(a1 + 48));
  *(void *)(a1 + 56) = v2;
  xpc_object_t v3 = (char **)(a1 + 56);
  if (v2) {
    goto LABEL_2;
  }
  uint64_t v4 = *__error();
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    xpc_object_t v5 = (const char *)_dyld_shared_cache_real_path();
    if (v5)
    {
      xpc_object_t v6 = _xpc_strdup(v5);
      *xpc_object_t v3 = v6;
      if (v6)
      {
LABEL_2:
        uint64_t v4 = 0LL;
LABEL_14:
        _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 56));
        goto LABEL_15;
      }
    }

    else
    {
      *xpc_object_t v3 = 0LL;
    }

    *(void *)&v20.st_dev = 0LL;
    v20.st_ino = 0LL;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      *(void *)&v20.st_dev = 0LL;
      v20.st_ino = 0LL;
    }

    if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
      _dyld_get_shared_cache_range();
    }
    _os_log_simple();
  }

  if (*v3) {
    goto LABEL_14;
  }
LABEL_15:
  if (!(_DWORD)v4)
  {
    if ((*(_BYTE *)(a1 + 296) & 0x10) != 0)
    {
      unsigned int v8 = 2;
    }

    else
    {
      int v7 = *(const char **)(a1 + 56);
      if (*(_DWORD *)(a1 + 40) == 1) {
        unsigned int v8 = _xpc_bundle_resolve_executable_variant(v7);
      }
      else {
        unsigned int v8 = _xpc_bundle_resolve_path_variant(v7);
      }
      if (v8 == 3) {
        return 128LL;
      }
    }

    *(_DWORD *)(a1 + 32) = v8;
    if (!_xpc_bundle_is_valid_variant(v8)) {
      _xpc_bundle_resolve_sync_cold_2();
    }
    uint64_t v4 = _xpc_bundle_resolve_root(a1);
    if (!(_DWORD)v4)
    {
      memset(&v20, 0, sizeof(v20));
      subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 1, 0LL);
      uint64_t v10 = (int *)open(subpath, 0);
      if ((v10 & 0x80000000) != 0)
      {
        if (*__error() != 2 && *__error()) {
          _os_assumes_log();
        }
        uint64_t v4 = *__error();
        free(subpath);
        uint64_t v14 = 0LL;
        size_t v13 = 0LL;
        goto LABEL_34;
      }

      uint64_t v11 = v10;
      if (!fstat((int)v10, &v20))
      {
        uint64_t v16 = _xpc_realpath_fd((int)v11);
        if (v16)
        {
          uint64_t v14 = v16;
          st_size_t size = v20.st_size;
          size_t v13 = malloc(v20.st_size);
          if (v13)
          {
            ssize_t v18 = read((int)v11, v13, st_size);
            if (v18 == -1) {
              _xpc_fd_desc_cold_1();
            }
            if (v18 == v20.st_size)
            {
              xpc_object_t v19 = xpc_create_from_plist((char *)v13, v18);
              *(void *)(a1 + 240) = v19;
              if (v19)
              {
                if (xpc_get_type(v19) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
                {
                  uint64_t v4 = 0LL;
                  goto LABEL_29;
                }

                xpc_release(*(xpc_object_t *)(a1 + 240));
                *(void *)(a1 + 240) = 0LL;
              }

              uint64_t v4 = 109LL;
LABEL_29:
              free(subpath);
              _xpc_strict_close(v11);
LABEL_34:
              free(v14);
              free(v13);
              if (!(_DWORD)v4)
              {
                uint64_t v4 = _xpc_bundle_resolve_executable(a1);
                if (!(_DWORD)v4)
                {
                  _xpc_bundle_resolve_services(a1);
                  _xpc_bundle_resolve_resources(a1);
                }
              }

              return v4;
            }
          }

          uint64_t v12 = __error();
LABEL_28:
          uint64_t v4 = *v12;
          goto LABEL_29;
        }

        if (*__error() == 2)
        {
          size_t v13 = 0LL;
          uint64_t v14 = 0LL;
          uint64_t v4 = 128LL;
          goto LABEL_29;
        }
      }

      uint64_t v12 = __error();
      size_t v13 = 0LL;
      uint64_t v14 = 0LL;
      goto LABEL_28;
    }
  }

  return v4;
}

void ___xpc_bundle_resolve_block_invoke_2(uint64_t a1)
{
  int v2 = _xpc_bundle_resolve_sync(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  *(_DWORD *)(v3 + 36) = v2;
  *(_BYTE *)(v3 + 296) |= 4u;
  uint64_t v4 = *(void **)(a1 + 32);
  xpc_retain(v4);
  xpc_object_t v5 = (dispatch_queue_s *)v4[33];
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = ___xpc_bundle_invoke_callback_async_block_invoke;
  block[3] = &__block_descriptor_tmp_42_0;
  block[4] = v4;
  dispatch_async(v5, block);
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t _xpc_bundle_resolve_executable(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 296) & 8) == 0)
  {
    int v2 = _xpc_bundle_resolve_executable_name(*(const char **)(a1 + 64), *(xpc_object_t *)(a1 + 240));
    subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 0, (uint64_t)v2);
    uint64_t v4 = _resolve_and_stat_path(subpath, (char **)(a1 + 232), 0LL, 0LL);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      if ((_DWORD)v4 != 2)
      {
        *(void *)(a1 + 288) = "failed to resolve executable";
        _dyld_get_image_uuid();
        if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
          _dyld_get_shared_cache_range();
        }
        _os_log_simple();
        goto LABEL_19;
      }

      xpc_object_t v6 = (const char *)_dyld_shared_cache_real_path();
      if (!v6 || (int v7 = _xpc_strdup(v6)) == 0LL)
      {
        *(void *)(a1 + 232) = _xpc_strdup(subpath);
        *(void *)(a1 + 288) = "missing executable";
        _dyld_get_image_uuid();
        if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
          _dyld_get_shared_cache_range();
        }
        _os_log_simple();
        uint64_t v5 = 2LL;
        goto LABEL_19;
      }

      *(void *)(a1 + 232) = v7;
    }

    else if (!_xpc_has_prefix(*(const char **)(a1 + 232), *(char **)(a1 + 64)))
    {
      *(void *)(a1 + 288) = "linked executable";
      _dyld_get_image_uuid();
      if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
        _dyld_get_shared_cache_range();
      }
      _os_log_simple();
    }

    _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 232));
    uint64_t v5 = 0LL;
LABEL_19:
    free(v2);
    free(subpath);
    return v5;
  }

  *(void *)(a1 + 232) = _xpc_strdup(*(const char **)(a1 + 48));
  _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 232));
  return 0LL;
}

void _xpc_bundle_normalize_cryptex_path(const char **a1)
{
  int v2 = (char *)*a1;
  uint64_t v3 = _normalize_cryptex_path(*a1);
  if (v3) {
    *a1 = _xpc_strdup(v3);
  }
  else {
    int v2 = 0LL;
  }
  free(v2);
}

uint64_t _resolve_and_stat_path(const char *a1, char **a2, stat *a3, _BYTE *a4)
{
  if (access(a1, 4)) {
    return *__error();
  }
  int v9 = (int *)open(a1, 0);
  uint64_t v10 = v9;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v11 = _xpc_realpath_fd((int)v10);
  if (!v11)
  {
LABEL_10:
    uint64_t v8 = *__error();
  }

  else
  {
    uint64_t v8 = 0LL;
    *a2 = v11;
  }

  _xpc_strict_close(v10);
  return v8;
}

uint64_t _xpc_bundle_resolve_root(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  uint64_t v1 = *(void *)(a1 + 56);
  if (*(_BYTE *)v1 != 47 || !*(_BYTE *)(v1 + 1)) {
    return 22LL;
  }
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 != 1)
  {
    if (!v3)
    {
      uint64_t v4 = _resolve_and_stat_path(*(const char **)(a1 + 56), (char **)(a1 + 64), (stat *)(a1 + 80), (_BYTE *)(a1 + 224));
      if ((_DWORD)v4)
      {
        *(void *)(a1 + 288) = "missing root";
        *(void *)&v10.st_dev = 0LL;
        v10.st_ino = 0LL;
        uint64_t v11 = 0LL;
        uint64_t v12 = 0LL;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          *(void *)&v10.st_dev = 0LL;
          v10.st_ino = 0LL;
        }

        if ((_dyld_get_shared_cache_uuid() & 1) != 0)
        {
          _dyld_get_shared_cache_range();
        }

        else
        {
          uint64_t v11 = 0LL;
          uint64_t v12 = 0LL;
        }

        _os_log_simple();
      }

      else
      {
        _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 64));
      }

      return v4;
    }

    memset(&v10, 0, sizeof(v10));
    *(_BYTE *)(a1 + 296) |= 2u;
    int v7 = v10.st_mode & 0xF000;
    if (v7 == 0x8000)
    {
      int v8 = 1;
      goto LABEL_32;
    }

    if (v7 == 0x4000)
    {
      int v8 = 0;
LABEL_32:
      *(_DWORD *)(a1 + 40) = v8;
      return _xpc_bundle_resolve_root(a1);
    }

    return 22LL;
  }

  uint64_t v5 = _xpc_bundle_copy_container(*(_DWORD *)(a1 + 32), (const char *)v1);
  xpc_object_t v6 = v5;
  if (*v5)
  {
    uint64_t v4 = _resolve_and_stat_path(v5, (char **)(a1 + 64), (stat *)(a1 + 80), (_BYTE *)(a1 + 224));
    if ((_DWORD)v4)
    {
      *(void *)(a1 + 288) = "missing root";
      *(void *)&v10.st_dev = 0LL;
      v10.st_ino = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        *(void *)&v10.st_dev = 0LL;
        v10.st_ino = 0LL;
      }

      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }

      else
      {
        uint64_t v11 = 0LL;
        uint64_t v12 = 0LL;
      }

      _os_log_simple();
    }

    else
    {
      _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 64));
    }
  }

  else
  {
    uint64_t v4 = 128LL;
  }

  free(v6);
  return v4;
}

void _xpc_bundle_resolve_services(uint64_t a1)
{
  *(void *)(a1 + 248) = xpc_array_create(0LL, 0LL);
  subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 2, 0LL);
  int v3 = opendir(subpath);
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = readdir(v3); i; uint64_t i = readdir(v4))
    {
      d_mach_port_name_t name = (uint64_t)i->d_name;
      if (_xpc_has_suffix(i->d_name, ".xpc"))
      {
        int v7 = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 2, d_name);
        int v8 = _xpc_realpath(v7);
        free(v7);
        if (v8)
        {
          if (!_xpc_has_prefix(v8, *(char **)(a1 + 64)))
          {
            *(void *)(a1 + 288) = "linked xpc services";
            _dyld_get_image_uuid();
            if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
              _dyld_get_shared_cache_range();
            }
            _os_log_simple();
          }

          uint64_t v9 = xpc_bundle_create_from_origin(0, v8);
          if (v9)
          {
            stat v10 = (void *)v9;
            *(_BYTE *)(v9 + 296) = *(_BYTE *)(v9 + 296) & 0xFE | *(_BYTE *)(a1 + 296) & 1;
            uint64_t v12 = *(dispatch_object_s **)(a1 + 256);
            uint64_t v11 = *(dispatch_object_s **)(a1 + 264);
            v10[32] = v12;
            v10[33] = v11;
            if (v12)
            {
              dispatch_retain(v12);
              uint64_t v11 = (dispatch_object_s *)v10[33];
            }

            if (v11) {
              dispatch_retain(v11);
            }
            xpc_array_append_value(*(xpc_object_t *)(a1 + 248), v10);
            xpc_release(v10);
          }

          free(v8);
        }
      }
    }

    free(subpath);
    if (closedir(v4) == -1) {
      _xpc_fd_desc_cold_1();
    }
  }

  else
  {
    free(subpath);
  }

void _xpc_bundle_resolve_resources(uint64_t a1)
{
  subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 3, 0LL);
  int v3 = subpath;
  if ((*(_BYTE *)(a1 + 296) & 8) != 0)
  {
    uint64_t v4 = subpath;
  }

  else
  {
    uint64_t v4 = _xpc_realpath(subpath);
    free(v3);
    if (!v4) {
      return;
    }
    if (!_xpc_has_prefix(v4, v4))
    {
      *(void *)(a1 + 288) = "linked resources";
      _dyld_get_image_uuid();
      if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
        _dyld_get_shared_cache_range();
      }
      _os_log_simple();
    }
  }

  *(void *)(a1 + 72) = v4;
}

void ___xpc_bundle_invoke_callback_async_block_invoke(uint64_t a1)
{
}

uint64_t xpc_inspect_copy_description_local()
{
  return 0LL;
}

uint64_t xpc_inspect_copy_short_description_local()
{
  return 0LL;
}

uint64_t xpc_inspect_copy_description()
{
  return 0LL;
}

uint64_t xpc_inspect_copy_short_description()
{
  return 0LL;
}

uint64_t xpc_is_kind_of_xpc_object4NSXPC()
{
  return objc_opt_isKindOfClass() & 1;
}

char *_xpc_copy_nsobject_debug_description(void *a1)
{
  int v2 = (void *)MEMORY[0x186DF6F8C]();
  int v3 = (const char *)objc_msgSend((id)objc_msgSend(a1, "debugDescription"), "UTF8String");
  if (v3) {
    uint64_t v4 = _xpc_strdup(v3);
  }
  else {
    uint64_t v4 = 0LL;
  }
  objc_autoreleasePoolPop(v2);
  return v4;
}

id _xpc_payload_alloc(uint64_t a1)
{
  size_t v1 = a1 - 8;
  int v2 = (objc_class *)objc_opt_class();
  return class_createInstance(v2, v1);
}

uint64_t _xpc_os_transaction_alloc()
{
  return _os_object_alloc();
}

uint64_t _xpc_event_publisher_alloc()
{
  return _os_object_alloc();
}

uint64_t _xpc_listener_alloc()
{
  return _os_object_alloc();
}

uint64_t _xpc_session_alloc()
{
  return _os_object_alloc();
}

BOOL _xpc_file_transfer_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_file_transfer_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  int v3 = "YES";
  if (!*(void *)(a1 + 72)) {
    int v3 = "NO";
  }
  unsigned int v4 = snprintf( __str,  0x80uLL,  "<%s> { id = %lld, state = %d, transaction = %s }",  "file transfer",  *(void *)(a1 + 24),  *(_DWORD *)(a1 + 88),  v3);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_file_transfer_debug_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v8 = 0u;
  int v3 = "YES";
  if (!*(void *)(a1 + 72)) {
    int v3 = "NO";
  }
  unsigned int v4 = snprintf( __str,  0x80uLL,  "<%s: %p> { id = %lld, state = %d, transaction = %s }",  "file transfer",  (const void *)a1,  *(void *)(a1 + 24),  *(_DWORD *)(a1 + 88),  v3);
  if (v4 >= 0x7F) {
    int v5 = 127;
  }
  else {
    int v5 = v4;
  }
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_file_transfer_debug()
{
  return 0LL;
}

uint64_t _xpc_file_transfer_serialize(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 88)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(_DWORD *)(a1 + 88) = 1;
  *(void *)(a1 + 72) = os_transaction_create("com.apple.xpc.file_transfer.outgoing");
  int __src = 106496;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  if (!*(void *)(a1 + 24)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v18 = *(void *)(a1 + 24);
  _xpc_serializer_append(a2, &v18, 8uLL, 1);
  unsigned int v4 = *(unint64_t **)(a1 + 32);
  if (((unint64_t)v4 & 0x8000000000000000LL) != 0)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = *MEMORY[0x189616658];
    unint64_t v7 = v6 ^ (unint64_t)v4;
    do
    {
      if ((v7 & 7) == *(_BYTE *)(MEMORY[0x189616648] + v5)) {
        break;
      }
      ++v5;
    }

    while (v5 != 7);
    unint64_t v8 = v5 | v7;
    uint64_t v9 = v5 & 7;
    int v10 = (v8 >> 55) + 8;
    if (v9 == 7) {
      LODWORD(v9) = v10;
    }
    if ((_DWORD)v9 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }

    else
    {
      if ((_DWORD)v9 != 13)
      {
        uint64_t v17 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v17);
      }

      extension_vtable = &_OS_xpc_type_int64;
    }
  }

  else
  {
    unint64_t v12 = *v4;
    if (*v4 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v12 <= (unint64_t)&OBJC_CLASS___OS_xpc_rich_error
      && (*v4 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v12 - (void)OBJC_CLASS___OS_xpc_object));
    }

    else
    {
      extension_vtable = _xpc_get_extension_vtable(*(id *)(a1 + 32));
    }
  }

  (*((void (**)(unint64_t *, uint64_t))extension_vtable + 9))(v4, a2);
  uint64_t v15 = *(void *)(a2 + 104);
  if (!v15) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v15, a1);
  if ((result & 1) == 0) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return result;
}

uint64_t _xpc_file_transfer_deserialize(uint64_t a1)
{
  uint64_t voucher = _xpc_message_request_get_voucher(a1);
  if (!voucher) {
    return 0LL;
  }
  uint64_t v3 = voucher;
  unsigned int v4 = (uint64_t *)_xpc_graph_deserializer_read(a1, 8uLL);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = *v4;
  if (!*v4) {
    return 0LL;
  }
  uint64_t v6 = _xpc_file_transfer_create();
  *(void *)(v6 + 24) = v5;
  unint64_t v7 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v7
    || (int v8 = *v7, v9 = _xpc_class_id_valid(*v7), v8 != 61440)
    || !v9
    || (int depth = _xpc_graph_deserializer_get_depth(a1), !_xpc_graph_deserializer_enter_container(a1))
    || (__int128 v11 = (uint64_t (*)(uint64_t))_xpc_deserialize_from_wire_id(0xF000u),
        uint64_t v12 = v11(a1),
        _xpc_graph_deserializer_restore_depth(a1, depth),
        !v12))
  {
    xpc_release((xpc_object_t)v6);
    return 0LL;
  }

  if (xpc_dictionary_get_count(*(xpc_object_t *)(v6 + 32))) {
    _xpc_serializer_pack_cold_3();
  }
  xpc_release(*(xpc_object_t *)(v6 + 32));
  *(void *)(v6 + 32) = v12;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v6);
  return v6;
}

uint64_t _xpc_file_transfer_wire_length()
{
  return -1LL;
}

void _xpc_file_transfer_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 88) == 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  int v2 = *(const void **)(a1 + 64);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 56);
  if (v3) {
    _Block_release(v3);
  }
  unsigned int v4 = *(const void **)(a1 + 40);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = *(void (***)(void, void))(a1 + 48);
  if (v5)
  {
    if (!*(_DWORD *)(a1 + 88))
    {
      v5[2](v5, *(void *)(a1 + 24));
      uint64_t v5 = *(void (***)(void, void))(a1 + 48);
    }

    _Block_release(v5);
  }

  uint64_t v6 = *(dispatch_io_s **)(a1 + 80);
  if (v6)
  {
    dispatch_io_close(v6, 0LL);
    dispatch_release(*(dispatch_object_t *)(a1 + 80));
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t xpc_file_transfer_create_with_fd(int a1, const void *a2)
{
  if (fstat(a1, &v6) == -1) {
    xpc_file_transfer_create_with_fd_cold_1();
  }
  int v4 = v6.st_mode & 0xF000;
  if (v4 == 4096 || v4 == 49152 || v4 == 0x8000) {
    return _xpc_file_transfer_create_with_fd_impl(a1, (uint64_t)&v6, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t _xpc_file_transfer_create_with_fd_impl(dispatch_fd_t a1, uint64_t a2, const void *a3)
{
  int v6 = *(_WORD *)(a2 + 4) & 0xF000;
  if (v6 != 4096 && v6 != 0x8000 && v6 != 49152) {
    _xpc_file_transfer_create_with_fd_impl_cold_1();
  }
  uint64_t v7 = _xpc_file_transfer_create();
  *(void *)(v7 + 56) = _Block_copy(a3);
  *(_DWORD *)(v7 + 16) |= 2u;
  if ((*(_WORD *)(a2 + 4) & 0xF000) == 0x8000) {
    uint64_t v8 = *(void *)(a2 + 96);
  }
  else {
    uint64_t v8 = -1LL;
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(v7 + 32), "s", v8);
  *(void *)(v7 + 80) = _xpc_file_transfer_create_io_for_fd(v7, a1);
  return v7;
}

uint64_t xpc_file_transfer_create_with_path(const char *a1, const void *a2)
{
  uint64_t v3 = (int *)open(a1, 0);
  if ((_DWORD)v3 != -1)
  {
    int v4 = v3;
    memset(&v6, 0, sizeof(v6));
    if ((v6.st_mode & 0xF000) == 0x8000) {
      return _xpc_file_transfer_create_with_fd_impl((dispatch_fd_t)v4, (uint64_t)&v6, a2);
    }
    _xpc_strict_close(v4);
  }

  return 0LL;
}

void xpc_file_transfer_cancel(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer)
  {
    _os_crash();
    __break(1u);
  }

  _xpc_api_misuse("Given object not of required type.");
}

uint64_t xpc_file_transfer_get_size(xpc_object_t *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return xpc_dictionary_get_uint64(a1[4], "s");
}

uint64_t xpc_file_transfer_write_to_fd(void *a1, dispatch_fd_t a2, const void *a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return _xpc_file_transfer_write_to_fd_impl((uint64_t)a1, a2, a3);
}

uint64_t _xpc_file_transfer_write_to_fd_impl(uint64_t a1, dispatch_fd_t a2, const void *a3)
{
  if (*(_DWORD *)(a1 + 88)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(_DWORD *)(a1 + 88) = 1;
  *(void *)(a1 + 72) = os_transaction_create("com.apple.xpc.file_transfer.incoming");
  if (!a3) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(a1 + 64) = _Block_copy(a3);
  *(void *)(a1 + 80) = _xpc_file_transfer_create_io_for_fd(a1, a2);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t xpc_file_transfer_write_to_path(void *a1, const char *a2, uint64_t (**a3)(void, void))
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_fd_t v6 = open(a2, 2561, 438LL);
  if (v6 != -1) {
    return _xpc_file_transfer_write_to_fd_impl((uint64_t)a1, v6, a3);
  }
  if (!*__error()) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  uint64_t v8 = *__error();
  return a3[2](a3, v8);
}

dispatch_object_t xpc_file_transfer_copy_io(dispatch_object_t *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  dispatch_retain(a1[10]);
  return a1[10];
}

uint64_t xpc_file_transfer_get_transfer_id(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  return a1[3];
}

void *xpc_file_transfer_set_transport_writing_callbacks(uint64_t a1, const void *a2, const void *a3)
{
  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*(_DWORD *)(a1 + 88)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (*(void *)(a1 + 40)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if (*(void *)(a1 + 48)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(a1 + 40) = _Block_copy(a2);
  uint64_t result = _Block_copy(a3);
  *(void *)(a1 + 48) = result;
  return result;
}

void xpc_file_transfer_write_finished(uint64_t a1, dispatch_queue_s *a2, int a3)
{
  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*(_DWORD *)(a1 + 88) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(_DWORD *)(a1 + 88) = 2;
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6)
  {
    if (!a2) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    v8[0] = MEMORY[0x1895FED80];
    v8[1] = 0x40000000LL;
    v8[2] = __xpc_file_transfer_write_finished_block_invoke;
    v8[3] = &unk_18962AC48;
    _OWORD v8[4] = v6;
    int v9 = a3;
    dispatch_async(a2, v8);
    *(void *)(a1 + 64) = 0LL;
  }

  uint64_t v7 = *(void **)(a1 + 72);
  if (!v7) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  os_release(v7);
  *(void *)(a1 + 72) = 0LL;
}

void __xpc_file_transfer_write_finished_block_invoke(uint64_t a1)
{
}

void xpc_file_transfer_send_finished(uint64_t a1, dispatch_queue_s *a2, int a3)
{
  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)&OBJC_CLASS___OS_xpc_file_transfer) {
    _xpc_api_misuse("Given object not of required type.");
  }
  if (*(_DWORD *)(a1 + 88) != 1) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(_DWORD *)(a1 + 88) = 2;
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    if (!a2) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    v8[0] = MEMORY[0x1895FED80];
    v8[1] = 0x40000000LL;
    v8[2] = __xpc_file_transfer_send_finished_block_invoke;
    v8[3] = &unk_18962AC70;
    _OWORD v8[4] = v6;
    int v9 = a3;
    dispatch_async(a2, v8);
    *(void *)(a1 + 56) = 0LL;
  }

  uint64_t v7 = *(void **)(a1 + 72);
  if (!v7) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  os_release(v7);
  *(void *)(a1 + 72) = 0LL;
}

void __xpc_file_transfer_send_finished_block_invoke(uint64_t a1)
{
}

uint64_t _xpc_file_transfer_create()
{
  uint64_t v0 = _xpc_base_create();
  uint64_t v1 = v0;
  do
    unint64_t v2 = __ldxr(&_file_transfer_id_last);
  while (__stxr(v2 + 1, &_file_transfer_id_last));
  *(void *)(v0 + 24) = v2 + 1;
  if (v2 == -1LL) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  *(void *)(v0 + 32) = xpc_dictionary_create(0LL, 0LL, 0LL);
  return v1;
}

dispatch_io_t _xpc_file_transfer_create_io_for_fd(uint64_t a1, dispatch_fd_t a2)
{
  uint64_t v8 = a1;
  int v7 = 0;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  cleanup_handler[0] = MEMORY[0x1895FED80];
  cleanup_handler[1] = 0x40000000LL;
  cleanup_handler[2] = ___xpc_file_transfer_create_io_for_fd_block_invoke;
  cleanup_handler[3] = &__block_descriptor_tmp_14_0;
  dispatch_fd_t v6 = a2;
  cleanup_handler[4] = v8;
  dispatch_io_t result = dispatch_io_create(0LL, a2, global_queue, cleanup_handler);
  if (!result) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  return result;
}

uint64_t ___xpc_file_transfer_create_io_for_fd_block_invoke()
{
  uint64_t result = guarded_close_np();
  if ((_DWORD)result == -1) {
    xpc_file_transfer_create_with_fd_cold_1();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_assert_log();
}

char *xpc_strerror(int a1)
{
  else {
    return (char *)*(&_errors + (a1 - 106));
  }
}

int64_t launch_service_stats_enable(const char *a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "monitor_id", a1);
  xpc_dictionary_set_uint64(v4, "capacity", a2);
  xpc_object_t object = 0LL;
  int64_t v5 = _xpc_bootstrap_routine(905LL, v4, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(v4);
  return v5;
}

int64_t launch_service_stats_disable(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, "monitor_id", a1);
  xpc_object_t object = 0LL;
  int64_t v3 = _xpc_bootstrap_routine(906LL, v2, &object);
  if (object) {
    xpc_release(object);
  }
  xpc_release(v2);
  return v3;
}

BOOL launch_service_stats_is_enabled(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v2, "monitor_id", a1);
  xpc_object_t xdict = 0LL;
  else {
    BOOL v3 = xpc_dictionary_get_BOOL(xdict, "enabled");
  }
  if (xdict) {
    xpc_release(xdict);
  }
  xpc_release(v2);
  return v3;
}

int64_t _launch_service_stats_copy_impl(const char *a1, unsigned int a2, uint64_t a3, int a4)
{
  if (!a3) {
    _xpc_rich_error_serialize_cold_1();
  }
  if ((a4 - 2) >= 4)
  {
    uint64_t v18 = _xpc_asprintf("Unsupported service stats version %d", a4);
    _xpc_api_misuse(v18);
  }

  size_t v6 = qword_180188360[a4 - 2];
  uint64_t v7 = (*MEMORY[0x189600148] + 51LL * a2 - 1) & -*MEMORY[0x189600148];
  purgable_buffer = (char *)_xpc_allocate_purgable_buffer(v7);
  xpc_object_t v9 = xpc_shmem_create(purgable_buffer, v7);
  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v10, "monitor_id", a1);
  xpc_dictionary_set_value(v10, "shmem", v9);
  xpc_release(v9);
  xpc_object_t xdict = 0LL;
  int64_t v11 = _xpc_bootstrap_routine(902LL, v10, &xdict);
  if (!(_DWORD)v11)
  {
    *(_DWORD *)(a3 + 16) = xpc_dictionary_get_uint64(xdict, "count");
    *(_DWORD *)(a3 + 20) = xpc_dictionary_get_uint64(xdict, "dropped-count");
    xpc_object_t value = xpc_dictionary_get_value(xdict, "labels");
    *(void *)a3 = value;
    if (value) {
      xpc_retain(value);
    }
    uint64_t v13 = *(unsigned int *)(a3 + 16);
    if ((_DWORD)v13)
    {
      __int128 v14 = (char *)_xpc_alloc(v6 * v13);
      uint64_t v15 = v14;
      uint64_t v16 = purgable_buffer;
      do
      {
        memcpy(v15, v16, v6);
        v16 += 51;
        v15 += v6;
        --v13;
      }

      while (v13);
      *(void *)(a3 + 8) = v14;
    }
  }

  if (xdict) {
    xpc_release(xdict);
  }
  xpc_release(v10);
  _xpc_deallocate_purgable_buffer(purgable_buffer, v7);
  return v11;
}

int64_t launch_service_stats_enable_4ppse()
{
  return launch_service_stats_enable("com.apple.launchd.service-stats-default", 0x1000u);
}

int64_t launch_service_stats_disable_4ppse()
{
  return launch_service_stats_disable("com.apple.launchd.service-stats-default");
}

BOOL launch_service_stats_is_enabled_4ppse()
{
  return launch_service_stats_is_enabled("com.apple.launchd.service-stats-default");
}

int64_t _launch_service_stats_copy_4ppse_impl(uint64_t a1, int a2)
{
  return _launch_service_stats_copy_impl("com.apple.launchd.service-stats-default", 0x1000u, a1, a2);
}

BOOL _xpc_service_instance_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_service_instance_desc(_DWORD *a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1895FEE08];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x200uLL, "<%s: %p> { pid = %d }", "service", a1, a1[10]);
  if (v3 >= 0x1FF) {
    int v4 = 511;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_service_instance_debug()
{
  return 0LL;
}

uint64_t _xpc_service_instance_deserialize()
{
  return 0LL;
}

uint64_t _xpc_service_instance_wire_length()
{
  return -1LL;
}

void _xpc_service_instance_dispose(uint64_t a1)
{
  xpc_object_t v2 = *(dispatch_object_s **)(a1 + 32);
  if (v2) {
    dispatch_release(v2);
  }
  free(*(void **)(a1 + 72));
  unsigned int v3 = *(void **)(a1 + 80);
  if (v3) {
    xpc_release(v3);
  }
  int v4 = *(void **)(a1 + 56);
  if (v4) {
    xpc_release(v4);
  }
  free(*(void **)(a1 + 88));
  int64_t v5 = *(void **)(a1 + 64);
  if (v5) {
    xpc_release(v5);
  }
  size_t v6 = *(void **)(a1 + 96);
  if (v6) {
    xpc_release(v6);
  }
  __int128 v7 = *(void **)(a1 + 120);
  if (v7) {
    xpc_release(v7);
  }
  __int128 v8 = *(void (**)(void))(a1 + 136);
  if (v8) {
    v8(*(void *)(a1 + 128));
  }
}

void xpc_service_instance_set_path(uint64_t a1, const char *a2)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    int64_t v5 = _xpc_asprintf("Attempt to configure non-configurable service instance.");
    goto LABEL_10;
  }

  if (!*(void *)(a1 + 120))
  {
    int64_t v5 = _xpc_asprintf("Attempt to configure a service after it has been run.");
LABEL_10:
    _xpc_api_misuse(v5);
  }

  xpc_object_t v2 = (unint64_t *)(a1 + 72);
  unsigned int v3 = _xpc_strdup(a2);
  do
    int v4 = (void *)__ldxr(v2);
  while (__stlxr((unint64_t)v3, v2));
  if (v4) {
    free(v4);
  }
}

uint64_t xpc_service_instance_set_start_suspended(uint64_t result)
{
  *(_BYTE *)(result + 48) = 1;
  return result;
}

void xpc_service_instance_set_environment(uint64_t a1, xpc_object_t object)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    int64_t v5 = _xpc_asprintf("Attempt to configure non-configurable service instance.", object);
    goto LABEL_10;
  }

  if (!*(void *)(a1 + 120))
  {
    int64_t v5 = _xpc_asprintf("Attempt to configure a service after it has been run.", object);
LABEL_10:
    _xpc_api_misuse(v5);
  }

  xpc_object_t v2 = (unint64_t *)(a1 + 56);
  xpc_object_t v3 = xpc_retain(object);
  do
    int v4 = (void *)__ldxr(v2);
  while (__stlxr((unint64_t)v3, v2));
  if (v4) {
    xpc_release(v4);
  }
}

uint64_t xpc_service_instance_set_binpref(uint64_t result, int a2)
{
  *(_DWORD *)(result + 28) = a2;
  return result;
}

void xpc_service_instance_dup2(uint64_t a1, int a2, int a3)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    xpc_object_t v3 = _xpc_asprintf("Attempt to configure non-configurable service instance.");
    goto LABEL_6;
  }

  if (!*(void *)(a1 + 120))
  {
    xpc_object_t v3 = _xpc_asprintf("Attempt to configure a service after it has been run.");
LABEL_6:
    _xpc_api_misuse(v3);
  }

  uint64_t v4 = a1;
  int v5 = a2;
  int v6 = a3;
  dispatch_sync_f(*(dispatch_queue_t *)(a1 + 32), &v4, (dispatch_function_t)_xpc_service_instance_dup2_insert);
}

void _xpc_service_instance_dup2_insert(_DWORD *a1)
{
  uint64_t v1 = *(void *)a1;
  int v2 = a1[2];
  int64_t v3 = (int)a1[3];
  xpc_object_t v4 = *(xpc_object_t *)(*(void *)a1 + 64LL);
  if (!v4)
  {
    xpc_object_t v4 = xpc_array_create(0LL, 0LL);
    *(void *)(v1 + 64) = v4;
  }

  xpc_array_set_fd(v4, 0xFFFFFFFFFFFFFFFFLL, v2);
  xpc_array_set_int64(*(xpc_object_t *)(v1 + 64), 0xFFFFFFFFFFFFFFFFLL, v3);
}

void xpc_service_instance_set_cwd(uint64_t a1, const char *a2)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    int v5 = _xpc_asprintf("Attempt to configure non-configurable service instance.");
    goto LABEL_10;
  }

  if (!*(void *)(a1 + 120))
  {
    int v5 = _xpc_asprintf("Attempt to configure a service after it has been run.");
LABEL_10:
    _xpc_api_misuse(v5);
  }

  int v2 = (unint64_t *)(a1 + 88);
  int64_t v3 = _xpc_strdup(a2);
  do
    xpc_object_t v4 = (void *)__ldxr(v2);
  while (__stlxr((unint64_t)v3, v2));
  if (v4) {
    free(v4);
  }
}

void xpc_service_instance_set_endpoint(uint64_t a1, xpc_object_t object)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    int v6 = _xpc_asprintf("Attempt to configure non-configurable service instance.", object);
    goto LABEL_10;
  }

  if (!*(void *)(a1 + 120))
  {
    int v6 = _xpc_asprintf("Attempt to configure a service after it has been run.", object);
LABEL_10:
    _xpc_api_misuse(v6);
  }

  int64_t v3 = (unint64_t *)(a1 + 96);
  xpc_object_t v4 = xpc_retain(object);
  do
    unint64_t v5 = __ldxr(v3);
  while (__stlxr((unint64_t)v4, v3));
  if (v5) {
    xpc_release(object);
  }
}

_DWORD *xpc_service_instance_set_jetsam_properties(_DWORD *result, int a2, int a3, int a4)
{
  result[26] = a2;
  result[27] = a3;
  if (!a4)
  {
    a4 = -1;
    goto LABEL_5;
  }

  if (a4 >= 1) {
LABEL_5:
  }
    result[28] = a4;
  return result;
}

uint64_t xpc_service_instance_set_context(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  xpc_object_t v4 = *(uint64_t (**)(uint64_t))(result + 136);
  if (v4) {
    uint64_t result = v4(a2);
  }
  *(void *)(v3 + 128) = a2;
  return result;
}

uint64_t xpc_service_instance_set_finalizer_f(uint64_t result, uint64_t a2)
{
  *(void *)(result + 136) = a2;
  return result;
}

uint64_t xpc_service_instance_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t xpc_service_instance_get_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t xpc_service_instance_get_host_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t xpc_service_instance_get_context(uint64_t a1)
{
  return *(void *)(a1 + 128);
}

uint64_t xpc_service_instance_is_configurable(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 49);
}

void xpc_service_instance_run(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 49))
  {
    __int128 v23 = _xpc_asprintf("This SPI may not be called on non-configurable services.");
    _xpc_api_misuse(v23);
  }

  int v2 = (unint64_t *)(a1 + 72);
  do
    uint64_t v3 = (char *)__ldxr(v2);
  while (__stxr(0LL, v2));
  xpc_object_t v4 = (unint64_t *)(a1 + 56);
  do
    unint64_t v5 = (void *)__ldxr(v4);
  while (__stxr(0LL, v4));
  int v6 = (unint64_t *)(a1 + 88);
  do
    __int128 v7 = (char *)__ldxr(v6);
  while (__stxr(0LL, v6));
  __int128 v8 = (unint64_t *)(a1 + 64);
  do
    __int128 v9 = (void *)__ldxr(v8);
  while (__stxr(0LL, v8));
  __int128 v10 = (unint64_t *)(a1 + 96);
  do
    uint64_t v11 = __ldxr(v10);
  while (__stxr(0LL, v10));
  __int128 v12 = (unsigned int *)(a1 + 104);
  do
    signed int v13 = __ldxr(v12);
  while (__stxr(0, v12));
  __int128 v14 = (unsigned int *)(a1 + 108);
  do
    unsigned int v15 = __ldxr(v14);
  while (__stxr(0, v14));
  __int128 v16 = (unsigned int *)(a1 + 112);
  do
    signed int v17 = __ldxr(v16);
  while (__stxr(0, v16));
  if (v3)
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 120), "program", v3);
    free(v3);
  }

  if (*(_BYTE *)(a1 + 48)) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 120), "suspended", 1);
  }
  uint64_t v18 = *(int *)(a1 + 28);
  if ((_DWORD)v18) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 120), "binpref", v18);
  }
  if (v5)
  {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 120), "environment", v5);
    xpc_release(v5);
  }

  if (v7)
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 120), "cwd", v7);
    free(v7);
  }

  if (v9)
  {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 120), "fds", v9);
    xpc_release(v9);
  }

  if (v11)
  {
    mach_port_name_t listener_port = _xpc_endpoint_get_listener_port(v11);
    xpc_dictionary_set_mach_send(*(void **)(a1 + 120), "endpoint", listener_port);
  }

  if (v13) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 120), "jetsam-flags", v13);
  }
  if ((v15 & 0x80000000) == 0) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 120), "jetsam-priority", v15);
  }
  if (v17) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 120), "jetsam-memlimit", v17);
  }
  xpc_object_t object = 0LL;
  int v20 = _xpc_service_routine(705LL, *(void **)(a1 + 120), &object);
  if (v20)
  {
    int v21 = v20;
    __int128 v22 = xpc_strerror(v20);
    syslog(3, "Could not configure service: %d: %s", v21, v22);
  }

  else
  {
    xpc_release(object);
  }

  xpc_release(*(xpc_object_t *)(a1 + 120));
  *(void *)(a1 + 120) = 0LL;
}

BOOL _xpc_service_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_service_desc(const char *a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1895FEE08];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x200uLL, "<%s: %p> { name = %s }", "service", a1, a1 + 76);
  if (v3 >= 0x1FF) {
    int v4 = 511;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_service_debug()
{
  return 0LL;
}

uint64_t _xpc_service_deserialize()
{
  return 0LL;
}

uint64_t _xpc_service_wire_length()
{
  return -1LL;
}

void _xpc_service_dispose(uint64_t a1)
{
  int v2 = *(dispatch_object_s **)(a1 + 64);
  if (v2) {
    dispatch_release(v2);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  _Block_release(*(const void **)(a1 + 32));
}

void _xpc_service_last_xref_cancel(uint64_t a1)
{
  xpc_object_t request = _xpc_service_create_request(a1);
  xpc_object_t object = 0LL;
  xpc_release(request);
  unsigned int v3 = *(dispatch_source_s **)(a1 + 64);
  if (v3) {
    dispatch_source_cancel(v3);
  }
}

uint64_t xpc_service_create(int a1, char *__s, uint64_t a3, dispatch_queue_global_s *a4)
{
  uint64_t result = _xpc_service_create_internal(__s, a4);
  if (a1 == 1) {
    int v7 = 5;
  }
  else {
    int v7 = 6;
  }
  *(_DWORD *)(result + 48) = a1;
  *(_DWORD *)(result + 52) = v7;
  *(void *)(result + 40) = a3;
  return result;
}

uint64_t _xpc_service_create_internal(char *__s, dispatch_queue_global_t global_queue)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  if (__s) {
    strlen(__s);
  }
  uint64_t v4 = _xpc_base_create();
  if (!global_queue) {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  }
  *(void *)(v4 + 24) = global_queue;
  dispatch_retain(global_queue);
  if (__s)
  {
    strcpy((char *)(v4 + 76), __s);
  }

  else
  {
    *(void *)uu = 0LL;
    uint64_t v7 = 0LL;
    MEMORY[0x186DF7328](uu);
    uuid_unparse(uu, (char *)(v4 + 76));
  }

  *(_DWORD *)(v4 + 56) = 0;
  return v4;
}

uint64_t xpc_service_create_from_specifier(const char *a1, dispatch_queue_global_s *a2)
{
  int v9 = 0;
  __s = 0LL;
  unint64_t v8 = 0LL;
  uint64_t internal = 0LL;
  if (!_xpc_parse_service_specifier(a1, &v9, &v8, &__s))
  {
    uint64_t v4 = __s;
    if (__s)
    {
      uint64_t internal = _xpc_service_create_internal(__s, a2);
      free(v4);
      int v5 = v9;
      *(_DWORD *)(internal + 48) = 3;
      *(_DWORD *)(internal + 52) = v5;
      *(void *)(internal + 40) = v8;
    }
  }

  return internal;
}

uint64_t _xpc_parse_service_specifier(const char *a1, int *a2, unint64_t *a3, char **a4)
{
  uint64_t v23 = *MEMORY[0x1895FEE08];
  uint64_t v7 = _xpc_strdup(a1);
  uint64_t v8 = 0LL;
  __int128 v18 = v7;
  __s1 = 0LL;
  __str = 0LL;
  uint64_t v22 = 0LL;
  do
  {
    int v9 = strsep(&v18, "/");
    if (!v9) {
      break;
    }
    (&__s1)[v8++] = v9;
  }

  while (v8 != 3);
  __int128 v10 = __s1;
  if (!__s1) {
    goto LABEL_7;
  }
  if (!strcmp(__s1, "system"))
  {
    unint64_t v12 = 0LL;
    uint64_t v13 = 1LL;
    int v14 = 1;
    goto LABEL_9;
  }

  if (strcmp(v10, "pid")
    || !__str
    || (__endptr = 0LL, unint64_t v12 = strtol(__str, &__endptr, 10), !__endptr)
    || *__endptr
    || v12 >= 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    uint64_t v11 = 140LL;
    goto LABEL_14;
  }

  int v14 = 5;
  uint64_t v13 = 2LL;
LABEL_9:
  __int128 v15 = (&__s1)[v13];
  *a2 = v14;
  *a3 = v12;
  if (v15 && *v15) {
    __int128 v16 = strdup(v15);
  }
  else {
    __int128 v16 = 0LL;
  }
  uint64_t v11 = 0LL;
  *a4 = v16;
LABEL_14:
  free(v7);
  return v11;
}

void xpc_service_set_attach_handler(mach_port_context_t a1, const void *a2)
{
  if (!a2)
  {
    __int128 v15 = (unint64_t *)(a1 + 32);
    do
      __int128 v16 = (const void *)__ldxr(v15);
    while (__stlxr(0LL, v15));
    if (v16)
    {
      _Block_release(v16);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
      return;
    }

    __int128 v17 = _xpc_asprintf("Attach handler is already NULL.");
LABEL_15:
    _xpc_api_misuse(v17);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if (!*(_DWORD *)(a1 + 72))
  {
    unsigned int v4 = _xpc_mach_port_allocate(0x33u, 6u, a1);
    *(_DWORD *)(a1 + 72) = v4;
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895FE808], v4, 0LL, *(dispatch_queue_t *)(a1 + 24));
    *(void *)(a1 + 64) = v5;
    int v6 = (void *)_xpc_retain(a1);
    dispatch_set_context(v5, v6);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 64), (dispatch_function_t)_xpc_service_attach_event);
    dispatch_source_set_mandatory_cancel_handler_f();
    dispatch_activate(*(dispatch_object_t *)(a1 + 64));
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  uint64_t v7 = _xpc_Block_copy_impl(a2);
  uint64_t v8 = (unint64_t *)(a1 + 32);
  do
  {
    if (__ldxr(v8))
    {
      __clrex();
      __int128 v17 = _xpc_asprintf("Attempt to reset attach handler.");
      goto LABEL_15;
    }
  }

  while (__stlxr((unint64_t)v7, v8));
  xpc_object_t request = _xpc_service_create_request(a1);
  xpc_dictionary_set_mach_send(request, "port", *(_DWORD *)(a1 + 72));
  int v11 = _xpc_event_routine_async(704LL, request, *(unsigned int *)(a1 + 72));
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = xpc_copy_description((xpc_object_t)a1);
    int v14 = xpc_strerror(v12);
    syslog(3, "Could not attach to service: %d: %s:\n%s", v12, v14, v13);
    free(v13);
  }

  xpc_release(request);
}

xpc_object_t _xpc_service_create_request(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "type", *(int *)(a1 + 52));
  xpc_dictionary_set_uint64(v2, "handle", *(void *)(a1 + 40));
  xpc_dictionary_set_string(v2, "name", (const char *)(a1 + 76));
  xpc_dictionary_set_BOOL(v2, "unidomain", 1);
  return v2;
}

uint64_t xpc_service_get_rendezvous_token(uint64_t a1)
{
  return a1 + 76;
}

int64_t xpc_service_kickstart(uint64_t a1, char a2, int a3)
{
  if (a3) {
    a2 |= 2u;
  }
  return xpc_service_kickstart_with_flags(a1, a2);
}

int64_t xpc_service_kickstart_with_flags(uint64_t a1, char a2)
{
  xpc_object_t request = _xpc_service_create_request(a1);
  xpc_dictionary_set_BOOL(request, "suspended", a2 & 1);
  xpc_dictionary_set_BOOL(request, "kill", (a2 & 2) != 0LL);
  xpc_dictionary_set_BOOL(request, "unthrottle", 1);
  xpc_object_t object = 0LL;
  int64_t v4 = _xpc_service_routine(702LL, request, &object);
  int64_t v5 = v4;
  if ((_DWORD)v4)
  {
    int v6 = xpc_strerror(v4);
    syslog(3, "Could not kickstart service: %d: %s", v5, v6);
  }

  else
  {
    xpc_release(object);
  }

  xpc_release(request);
  return v5;
}

int64_t xpc_service_attach(uint64_t a1, char a2, int a3)
{
  if (a3) {
    a2 |= 2u;
  }
  return xpc_service_attach_with_flags(a1, a2);
}

int64_t xpc_service_attach_with_flags(uint64_t a1, char a2)
{
  xpc_object_t request = _xpc_service_create_request(a1);
  xpc_dictionary_set_BOOL(request, "run", a2 & 1);
  xpc_dictionary_set_BOOL(request, "kill", (a2 & 2) != 0LL);
  xpc_object_t object = 0LL;
  int64_t v4 = _xpc_service_routine(703LL, request, &object);
  int64_t v5 = v4;
  if ((_DWORD)v4)
  {
    int v6 = xpc_strerror(v4);
    syslog(3, "Could not attach service: %d: %s", v5, v6);
  }

  else
  {
    xpc_release(object);
  }

  xpc_release(request);
  return v5;
}

char *xpc_get_service_name_from_pid(int a1)
{
  if (!a1) {
    return 0LL;
  }
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v2, "pid", a1);
  xpc_object_t xdict = 0LL;
  int v3 = _xpc_service_routine(725LL, v2, &xdict);
  xpc_release(v2);
  int64_t v4 = 0LL;
  if (!v3)
  {
    string = xpc_dictionary_get_string(xdict, "service-name");
    if (string) {
      int64_t v4 = strdup(string);
    }
    else {
      int64_t v4 = 0LL;
    }
    xpc_release(xdict);
  }

  return v4;
}

void _xpc_service_attach_event(uint64_t a1)
{
  xpc_object_t xdict = 0LL;
  int int64 = xpc_pipe_receive(*(_DWORD *)(a1 + 72), &xdict, 0);
  if (int64 || (int int64 = xpc_dictionary_get_int64(xdict, "error")) != 0)
  {
    if (xdict) {
      xpc_release(xdict);
    }
    int v3 = xpc_strerror(int64);
    syslog(3, "Could not attach to service: %d: %s", int64, v3);
    return;
  }

  int v4 = xpc_dictionary_get_int64(xdict, "pid");
  int v5 = xpc_dictionary_get_int64(xdict, "hostpid");
  BOOL v6 = xpc_dictionary_get_BOOL(xdict, "configurable");
  if (*(void *)(a1 + 40) || *(_DWORD *)(a1 + 48) != 1)
  {
    if (!v6)
    {
      xpc_object_t request = 0LL;
      goto LABEL_14;
    }
  }

  else
  {
    if (!v6) {
      return;
    }
    *(void *)(a1 + 40) = v5;
  }

  xpc_object_t request = _xpc_service_create_request(a1);
  xpc_dictionary_set_int64(request, "pid", v4);
LABEL_14:
  int v8 = *(_DWORD *)(a1 + 48);
  uint64_t v9 = _xpc_base_create();
  *(_DWORD *)(v9 + 40) = v4;
  *(_DWORD *)(v9 + 44) = v5;
  *(_DWORD *)(v9 + 24) = v8;
  *(void *)(v9 + 104) = 0xFFFFFFFF00000000LL;
  *(_DWORD *)(v9 + 112) = 0;
  if (request)
  {
    *(void *)(v9 + 120) = xpc_retain(request);
    *(_BYTE *)(v9 + 49) = 1;
    *(void *)(v9 + 32) = dispatch_queue_create("com.apple.xpc.service-instance", 0LL);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    xpc_release((xpc_object_t)v9);
  }

  else
  {
    *(void *)(v9 + 32) = dispatch_queue_create("com.apple.xpc.service-instance", 0LL);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    xpc_object_t request = (xpc_object_t)v9;
  }

  xpc_release(request);
  xpc_release(xdict);
}

uint64_t _xpc_service_attach_cancel(mach_port_context_t guard)
{
  return _xpc_release(guard);
}

uint64_t _xpc_activity_copy()
{
  return 0LL;
}

BOOL _xpc_activity_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_activity_desc(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "<%s: %s>", "activity", *(const char **)(a1 + 24));
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_activity_debug_desc(const char **a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  unsigned int v3 = snprintf(__str, 0x80uLL, "<%s: %p>: %s", "activity", a1, a1[3]);
  if (v3 >= 0x7F) {
    int v4 = 127;
  }
  else {
    int v4 = v3;
  }
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_activity_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", %s", *(const char **)(a1 + 24));
}

uint64_t _xpc_activity_deserialize()
{
  return 0LL;
}

uint64_t _xpc_activity_wire_length()
{
  return -1LL;
}

void _xpc_activity_dispose(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  xpc_object_t v2 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 96);
    if ((*(_BYTE *)(a1 + 136) & 1) != 0) {
      int v5 = "(is running)";
    }
    else {
      int v5 = "(not running)";
    }
    int v10 = 136446978;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = a1;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2082;
    __int128 v17 = v5;
    _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispose: %{public}s (%p) seqno: %llu, %{public}s",  (uint8_t *)&v10,  0x2Au);
  }

  _xpc_activity_end_running(a1);
  free(*(void **)(a1 + 24));
  BOOL v6 = *(dispatch_object_s **)(a1 + 40);
  if (v6) {
    dispatch_release(v6);
  }
  __int128 v7 = *(const void **)(a1 + 48);
  if (v7) {
    _Block_release(v7);
  }
  __int128 v8 = *(_xpc_connection_s **)(a1 + 80);
  if (v8)
  {
    xpc_connection_cancel(v8);
    xpc_release(*(xpc_object_t *)(a1 + 80));
  }

  __int128 v9 = *(void **)(a1 + 32);
  if (v9) {
    xpc_release(v9);
  }
  if (*(void *)(a1 + 56)) {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  BOOL v6 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v7 = "dictionary";
    if (criteria == &_xpc_activity_check_in) {
      __int128 v7 = "check-in";
    }
    *(_DWORD *)mach_port_options_t buf = 136446466;
    *(void *)&uint8_t buf[4] = identifier;
    __int16 v12 = 2082;
    uint64_t v13 = v7;
    _os_log_impl( &dword_180150000,  v6,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_register: %{public}s, criteria: %{public}s",  buf,  0x16u);
  }

  if (_xpc_activity_once != -1) {
    dispatch_once(&_xpc_activity_once, &__block_literal_global_104);
  }
  *(void *)mach_port_options_t buf = 0LL;
  __int128 v8 = (_xpc_activity_s *)_xpc_base_create();
  *((void *)v8 + 3) = strdup(identifier);
  asprintf((char **)buf, "com.apple.xpc.activity.%s", identifier);
  dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  __int128 v9 = (dispatch_queue_attr_s *)dispatch_queue_attr_make_with_overcommit();
  *((void *)v8 + 5) = dispatch_queue_create_with_target_V2(*(const char **)buf, v9, 0LL);
  free(*(void **)buf);
  *((void *)v8 + 6) = _Block_copy(handler);
  *((void *)v8 + 7) = 0LL;
  if (criteria == &_xpc_activity_check_in) {
    *((void *)v8 + 4) = &_xpc_activity_check_in;
  }
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __xpc_activity_register_block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = v8;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  xpc_activity_set_criteria(v8, criteria);
  xpc_release(v8);
}

xpc_object_t __xpc_activity_register_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  uint64_t v2 = *(void *)(a1 + 32);
  registration = _xpc_activity_find_registration(*(const char **)(v2 + 24));
  uint64_t v4 = registration;
  if (registration[2] == -1LL) {
    registration[2] = 0LL;
  }
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  int v5 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(v2 + 24);
    uint64_t v7 = v4[2];
    int v12 = 136446722;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v2;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    _os_log_impl( &dword_180150000,  v5,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_register: %{public}s (%p), %llu",  (uint8_t *)&v12,  0x20u);
  }

  uint64_t v10 = v4[3];
  __int128 v9 = v4 + 3;
  uint64_t v8 = v10;
  *(void *)(v2 + 120) = v10;
  if (v10) {
    *(void *)(v8 + 128) = v2 + 120;
  }
  *__int128 v9 = v2;
  *(void *)(v2 + 128) = v9;
  *(_BYTE *)(v2 + 136) |= 8u;
  return xpc_retain(*(xpc_object_t *)(a1 + 32));
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  uint64_t v4 = 0LL;
  int v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0LL;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  void v3[2] = __xpc_activity_copy_criteria_block_invoke;
  void v3[3] = &unk_18962B0D8;
  _OWORD v3[4] = &v4;
  void v3[5] = activity;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, v3);
  uint64_t v1 = (void *)v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __xpc_activity_copy_criteria_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(__objc2_class ***)(*(void *)(a1 + 40) + 32LL);
  if (v2) {
    BOOL v3 = v2 == &_xpc_activity_check_in;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_copy(v2);
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (v4) {
      xpc_dictionary_set_value(v4, "_SequenceNumber", 0LL);
    }
  }

void _xpc_activity_normalize_critiera(void *a1)
{
  if (a1)
  {
    _xpc_activity_normalize_integer(a1, "Delay");
    _xpc_activity_normalize_integer(a1, "RandomInitialDelay");
    _xpc_activity_normalize_integer(a1, "GracePeriod");
    _xpc_activity_normalize_integer(a1, "Interval");
  }

void __xpc_activity_set_criteria_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  uint64_t v2 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 24);
    if (*(__objc2_class ***)(a1 + 40) == &_xpc_activity_check_in) {
      int v5 = "check-in";
    }
    else {
      int v5 = "dict";
    }
    *(_DWORD *)mach_port_options_t buf = 136446722;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&_BYTE buf[12] = 2048;
    *(void *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2082;
    __int128 v30 = v5;
    _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria, lower half: %{public}s (%p), %{public}s",  buf,  0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(__objc2_class ***)(a1 + 40);
  *(void *)mach_port_options_t buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2000000000LL;
  __int128 v30 = 0LL;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  uint64_t v22 = 0LL;
  block[2] = __xpc_activity_set_criteria_block_invoke_70;
  block[3] = &unk_18962B100;
  uint64_t v8 = MEMORY[0x1895FED80];
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  void block[6] = v6;
  block[7] = v7;
  block[4] = buf;
  void block[5] = &v19;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  __int128 v9 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 24);
    *(_DWORD *)uint64_t v23 = 136446722;
    uint64_t v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v10;
    __int16 v27 = 2048;
    BOOL v28 = v7 != &_xpc_activity_check_in;
    _os_log_impl( &dword_180150000,  v9,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria: %{public}s (%p), setting state now to %ld",  v23,  0x20u);
  }

  _xpc_activity_set_state_with_completion_status(*(void *)(a1 + 32), v7 != &_xpc_activity_check_in, 0LL);
  if (*(void *)(*(void *)&buf[8] + 24LL))
  {
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    int v12 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 24);
      uint int64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(void *)&buf[8] + 24LL), "_SequenceNumber");
      *(_DWORD *)uint64_t v23 = 136446722;
      uint64_t v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      __int16 v27 = 2048;
      BOOL v28 = uint64;
      _os_log_impl( &dword_180150000,  v12,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria: %{public}s (%p), there is a pending event, which contained seqno %llu. If next state is CHECK_IN, it will be dispatched. If next state is WAIT, it will be dropped.",  v23,  0x20u);
    }

    if (v7 == &_xpc_activity_check_in)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      xpc_retain(*(xpc_object_t *)(*(void *)&buf[8] + 24LL));
      os_retain((void *)v20[3]);
      v17[0] = v8;
      v17[1] = 0x40000000LL;
      v17[2] = __xpc_activity_set_criteria_block_invoke_72;
      v17[3] = &unk_18962B128;
      __int128 v17[4] = buf;
      v17[5] = &v19;
      dispatch_async(global_queue, v17);
    }

    xpc_release(*(xpc_object_t *)(*(void *)&buf[8] + 24LL));
  }

  os_release((void *)v20[3]);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);
}

void __xpc_activity_set_criteria_block_invoke_70(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  uint64_t v2 = *(void *)(a1 + 48);
  if ((*(_BYTE *)(v2 + 136) & 8) != 0)
  {
    registration = (const char **)_xpc_activity_find_registration(*(const char **)(v2 + 24));
    _xpc_activity_set_criteria((uint64_t)registration, *(void *)(a1 + 48), *(__objc2_class ***)(a1 + 56));
    uint64_t v8 = registration[6];
    if (v8 || registration[7])
    {
      if (v8 >= registration[2])
      {
        if (_activity_log_pred != -1) {
          dispatch_once(&_activity_log_pred, &__block_literal_global_9);
        }
        __int128 v9 = (os_log_s *)_activity_log__log;
        if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 48);
          uint64_t v11 = *(void *)(v10 + 24);
          int v12 = registration[6];
          uint64_t v13 = registration[2];
          int v20 = 136446978;
          uint64_t v21 = v11;
          __int16 v22 = 2048;
          uint64_t v23 = v10;
          __int16 v24 = 2048;
          __int16 v25 = v12;
          __int16 v26 = 2048;
          __int16 v27 = v13;
          _os_log_impl( &dword_180150000,  v9,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria: %{public}s (%p): registration->pending_seqno %llu >= registration->seqno %llu; cr"
            "eating a pending event",
            (uint8_t *)&v20,
            0x2Au);
        }

        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_string( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  "XPCEventName",  *registration);
        xpc_dictionary_set_uint64( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  "_SequenceNumber",  (uint64_t)registration[6]);
        uint64_t v14 = (char *)registration[7];
        if (v14) {
          xpc_dictionary_set_value( *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  "_ReplyEndpoint",  v14);
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = registration[8];
        registration[8] = 0LL;
      }

      if (_activity_log_pred != -1) {
        dispatch_once(&_activity_log_pred, &__block_literal_global_9);
      }
      uint64_t v15 = (os_log_s *)_activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        uint64_t v17 = *(void *)(v16 + 24);
        uint64_t v18 = registration[6];
        int v20 = 136446722;
        uint64_t v21 = v17;
        __int16 v22 = 2048;
        uint64_t v23 = v16;
        __int16 v24 = 2048;
        __int16 v25 = v18;
        _os_log_impl( &dword_180150000,  v15,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria: %{public}s (%p): clearing pending seqno %llu, endpoint, transaction",  (uint8_t *)&v20,  0x20u);
      }

      registration[6] = 0LL;
      uint64_t v19 = (char *)registration[7];
      if (v19)
      {
        xpc_release(v19);
        registration[7] = 0LL;
      }

      os_release((void *)registration[8]);
      registration[8] = 0LL;
    }
  }

  else
  {
    uint64_t v3 = *(__objc2_class ***)(a1 + 56);
    if (v3 != &_xpc_activity_check_in) {
      xpc_release(v3);
    }
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    uint64_t v4 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(v5 + 24);
      int v20 = 136446466;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      _os_log_impl( &dword_180150000,  v4,  OS_LOG_TYPE_DEFAULT,  "xpc_activity_set_criteria: %{public}s (%p): early return",  (uint8_t *)&v20,  0x16u);
    }
  }

void *_xpc_activity_find_registration(const char *a1)
{
  registration = (void *)__xpc_activity_find_registration(a1);
  if (!registration)
  {
    registration = calloc(1uLL, 0x48uLL);
    void *registration = strdup(a1);
    registration[3] = 0LL;
    uint64_t v3 = _xpc_activity_list;
    registration[4] = _xpc_activity_list;
    if (v3) {
      *(void *)(v3 + 40) = registration + 4;
    }
    _xpc_activity_list = (uint64_t)registration;
    registration[5] = &_xpc_activity_list;
  }

  return registration;
}

xpc_object_t _xpc_activity_set_criteria(uint64_t a1, uint64_t a2, __objc2_class **a3)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  uint64_t v6 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a2 + 24);
    uint64_t v8 = "dict";
    *(_DWORD *)__int128 v29 = 136446722;
    if (a3 == &_xpc_activity_check_in) {
      uint64_t v8 = "check-in";
    }
    *(void *)&v29[4] = v7;
    *(_WORD *)&v29[12] = 2048;
    *(void *)&v29[14] = a2;
    *(_WORD *)&v29[22] = 2082;
    __int128 v30 = v8;
    _os_log_impl( &dword_180150000,  v6,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_set_criteria: %{public}s (%p), %{public}s",  v29,  0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)_xpc_activity_queue);
  __int128 v9 = *(void **)(a1 + 8);
  if (v9) {
    xpc_release(v9);
  }
  if (a3 == &_xpc_activity_check_in)
  {
    if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
      uint64_t v16 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
    }
    else {
      uint64_t v16 = _os_alloc_once();
    }
    if (*(_BYTE *)(v16 + 3))
    {
      xpc_object_t v17 = xpc_copy_event("com.apple.xpc.activity", *(const char **)a1);
      *(void *)(a1 + 8) = v17;
      if (v17)
      {
        *(void *)(a1 + 16) = xpc_dictionary_get_uint64(v17, "_SequenceNumber");
        _xpc_activity_normalize_critiera(*(void **)(a1 + 8));
        goto LABEL_30;
      }
    }

    else
    {
      *(void *)(a1 + 8) = 0LL;
    }

    *(void *)(a1 + 16) = 1LL;
    goto LABEL_30;
  }

  uint64_t v10 = *(void *)(a1 + 16) + 1LL;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = v10;
  xpc_dictionary_set_uint64(a3, "_SequenceNumber", v10);
  uint64_t v11 = MEMORY[0x1895FF8E0];
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v12 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v12 = _os_alloc_once();
  }
  if (*(_BYTE *)(v12 + 3))
  {
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    uint64_t v13 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(const char **)a1;
      uint64_t v15 = *(void *)(a1 + 16);
      *(_DWORD *)__int128 v29 = 136446466;
      *(void *)&v29[4] = v14;
      *(_WORD *)&v29[12] = 2048;
      *(void *)&v29[14] = v15;
      _os_log_impl( &dword_180150000,  v13,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_set_criteria: xpc_set_event %{public}s, %llu",  v29,  0x16u);
    }

    xpc_set_event("com.apple.xpc.activity", *(const char **)a1, *(void **)(a1 + 8));
  }

  else
  {
    uint64_t v18 = *(void **)(a2 + 80);
    if (v18 && (xpc_release(v18), *(void *)(v11 + 16) != -1LL)) {
      uint64_t v19 = _os_alloc_once();
    }
    else {
      uint64_t v19 = *(void *)(v11 + 24);
    }
    if (*(_BYTE *)(v19 + 3)) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.xpc.activity.unmanaged", global_queue, 0LL);
    *(void *)__int128 v29 = MEMORY[0x1895FED80];
    *(void *)&v29[8] = 0x40000000LL;
    *(void *)&v29[16] = ___xpc_activity_new_unmanaged_connection_block_invoke;
    __int128 v30 = (const char *)&__block_descriptor_tmp_109;
    uint64_t v31 = mach_service;
    uint64_t v32 = a2;
    xpc_connection_set_event_handler(mach_service, v29);
    xpc_connection_activate(mach_service);
    uint64_t v22 = *(void *)(a2 + 88) + 1LL;
    *(void *)(a2 + 80) = mach_service;
    *(void *)(a2 + 88) = v22;
    xpc_object_t v23 = xpc_copy(*(xpc_object_t *)(a1 + 8));
    xpc_dictionary_set_string(v23, "name", *(const char **)a1);
    xpc_connection_send_message(*(xpc_connection_t *)(a2 + 80), v23);
    xpc_release(v23);
  }

LABEL_30:
  __int16 v24 = *(__objc2_class ***)(a2 + 32);
  if (v24 && v24 != &_xpc_activity_check_in) {
    xpc_release(v24);
  }
  xpc_object_t result = *(xpc_object_t *)(a1 + 8);
  if (!result)
  {
    *(void *)(a2 + 32) = 0LL;
    char v28 = *(_BYTE *)(a2 + 136) & 0xFB;
LABEL_40:
    *(_BYTE *)(a2 + 136) = v28;
    goto LABEL_41;
  }

  xpc_object_t v26 = xpc_retain(result);
  *(void *)(a2 + 32) = v26;
  *(_BYTE *)(a2 + 136) = *(_BYTE *)(a2 + 136) & 0xFB | (4 * (xpc_dictionary_get_int64(v26, "Interval") != 0));
  xpc_object_t result = xpc_dictionary_get_value(*(xpc_object_t *)(a2 + 32), "Repeating");
  if (result)
  {
    xpc_object_t result = (xpc_object_t)xpc_BOOL_get_value(result);
    if ((_DWORD)result) {
      char v27 = 4;
    }
    else {
      char v27 = 0;
    }
    char v28 = *(_BYTE *)(a2 + 136) & 0xFB | v27;
    goto LABEL_40;
  }

    __break(0x5519u);
    return result;
  }

  if (v15 - (unint64_t)v14 >= 9)
  {
    uint64_t v5 = *(uint64_t (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v5)
    {
      uint64_t v6 = "number too large";
LABEL_11:
      xpc_object_t result = v5(v3, "[%s]: %s\n", "der_decode_number", v6);
      goto LABEL_12;
    }

    goto LABEL_12;
  }

  if ((unint64_t)v14 < v15)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    while (1)
    {
      if (!v10 && *v14 < 0) {
        uint64_t v11 = -1LL;
      }
      uint64_t v12 = (unsigned __int8 *)&v14[v10];
      uint64_t v11 = *v12 | (unint64_t)(v11 << 8);
      if (v15 - (void)v14 == ++v10) {
        goto LABEL_28;
      }
    }
  }

  uint64_t v11 = 0LL;
LABEL_28:
  xpc_object_t result = 1LL;
  if (v11 == *(void *)(v2 + 8))
  {
    *(_BYTE *)(*v1 + 33LL) = 1;
    return 0LL;
  }

  return result;
}

void __xpc_activity_set_criteria_block_invoke_72(uint64_t a1)
{
}

void _xpc_activity_dispatch(xpc_object_t xdict, void *a2)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v4 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v4 = _os_alloc_once();
  }
  uint64_t v5 = *(unsigned __int8 *)(v4 + 3);
  if (*(_BYTE *)(v4 + 3))
  {
    string = xpc_dictionary_get_string(xdict, "XPCEventName");
    if (!strcmp(string, "com.apple.xpc.activity.control"))
    {
      _xpc_activity_setup_control_channel(xdict);
      return;
    }

LABEL_24:
    uint64_t v5 = v23[3];
    if ((*(_BYTE *)(v5 + 136) & 1) != 0)
    {
LABEL_30:
      xpc_object_t v17 = *(dispatch_queue_s **)(v23[3] + 40);
      v18[0] = v12;
      v18[1] = 0x40000000LL;
      v18[2] = ___xpc_activity_dispatch_block_invoke_113;
      v18[3] = &unk_18962B438;
      v18[4] = &v22;
      v18[5] = uint64;
      char v19 = v9;
      v18[6] = value;
      v18[7] = a2;
      v18[8] = xdict;
      dispatch_async(v17, v18);
LABEL_31:
      os_release(v7);
      _Block_object_dispose(&v22, 8);
      return;
    }

    *(_BYTE *)(v5 + 136) |= 1u;
    if (*(void *)(v5 + 112)) {
      _os_assumes_log();
    }
    *(void *)(v5 + 112) = os_retain(v7);
    if (_activity_log_pred == -1)
    {
LABEL_28:
      uint64_t v14 = (os_log_s *)_activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(const char **)(v5 + 24);
        uint64_t v16 = *(void *)(v5 + 96);
        *(_DWORD *)mach_port_options_t buf = 136446722;
        char v27 = v15;
        __int16 v28 = 2048;
        uint64_t v29 = v5;
        __int16 v30 = 2048;
        uint64_t v31 = v16;
        _os_log_impl( &dword_180150000,  v14,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_begin_running: %{public}s (%p) seqno: %llu.",  buf,  0x20u);
      }

      goto LABEL_30;
    }

LABEL_35:
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    goto LABEL_28;
  }

  string = xpc_dictionary_get_string(xdict, "name");
  if (strcmp(string, "com.apple.xpc.activity.control")) {
    goto LABEL_7;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  xpc_activity_state_t result = *((void *)activity + 9);
  if (!result) {
    return *((void *)activity + 8);
  }
  return result;
}

char *xpc_activity_copy_identifier(uint64_t a1)
{
  xpc_activity_state_t result = *(char **)(a1 + 24);
  if (result) {
    return strdup(result);
  }
  return result;
}

void *xpc_activity_add_eligibility_changed_handler(void *a1, const void *a2)
{
  uint64_t v4 = calloc(1uLL, 0x20uLL);
  *uint64_t v4 = xpc_retain(a1);
  uint64_t v5 = _Block_copy(a2);
  v4[1] = v5;
  uint64_t v6 = MEMORY[0x1895FED80];
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __xpc_activity_add_eligibility_changed_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_75;
  block[4] = v4;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  xpc_retain(a1);
  uint64_t v7 = _Block_copy(v5);
  uint64_t v8 = (dispatch_queue_s *)a1[5];
  v10[0] = v6;
  v10[1] = 0x40000000LL;
  v10[2] = __xpc_activity_add_eligibility_changed_handler_block_invoke_2;
  v10[3] = &unk_18962B190;
  v10[4] = v7;
  v10[5] = a1;
  dispatch_async(v8, v10);
  return v4;
}

uint64_t __xpc_activity_add_eligibility_changed_handler_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 56LL);
  *(void *)(*(void *)(result + 32) + 16LL) = v1;
  if (v1) {
    *(void *)(*(void *)(*(void *)(result + 40) + 56LL) + 24LL) = *(void *)(result + 32) + 16LL;
  }
  *(void *)(*(void *)(result + 40) + 56LL) = *(void *)(result + 32);
  *(void *)(*(void *)(result + 32) + 24LL) = *(void *)(result + 40) + 56LL;
  return result;
}

void __xpc_activity_add_eligibility_changed_handler_block_invoke_2(uint64_t a1)
{
}

void xpc_activity_remove_eligibility_changed_handler(uint64_t a1)
{
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __xpc_activity_remove_eligibility_changed_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_77_0;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  xpc_release(*(xpc_object_t *)a1);
  _Block_release(*(const void **)(a1 + 8));
  free((void *)a1);
}

uint64_t __xpc_activity_remove_eligibility_changed_handler_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    *(void *)(v2 + 24) = *(void *)(v1 + 24);
    uint64_t v1 = *(void *)(result + 32);
    uint64_t v2 = *(void *)(v1 + 16);
  }

  **(void **)(v1 + 24) = v2;
  *(void *)(*(void *)(result + 32) + 16LL) = -1LL;
  *(void *)(*(void *)(result + 32) + 24LL) = -1LL;
  return result;
}

uint64_t xpc_activity_should_be_data_budgeted(uint64_t a1)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  char v7 = 0;
  v3[0] = MEMORY[0x1895FED80];
  v3[1] = 0x40000000LL;
  void v3[2] = __xpc_activity_should_be_data_budgeted_block_invoke;
  void v3[3] = &unk_18962B1D8;
  _OWORD v3[4] = &v4;
  void v3[5] = a1;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void *__xpc_activity_should_be_data_budgeted_block_invoke(uint64_t a1)
{
  xpc_activity_state_t result = (void *)xpc_dictionary_get_string(*(xpc_object_t *)(*(void *)(a1 + 40) + 32LL), "Priority");
  if (result && (xpc_activity_state_t result = (void *)strncmp((const char *)result, "Maintenance", 0xBuLL), (_DWORD)result))
  {
    xpc_activity_state_t result = xpc_dictionary_get_value(*(xpc_object_t *)(*(void *)(a1 + 40) + 32LL), "DataBudgeting");
    if (result)
    {
      xpc_activity_state_t result = (void *)xpc_BOOL_get_value(result);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_BYTE)result;
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  return result;
}

uint64_t xpc_activity_set_state_with_completion_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 5 && a3) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 64);
  }
  if (v4 == 4)
  {
    if (a2 != 5 && a2 != 3) {
      return 0LL;
    }
LABEL_12:
    _xpc_activity_set_state_with_completion_status(a1, a2, a3);
    return 1LL;
  }

  return 0LL;
}

uint64_t xpc_activity_set_completion_status(uint64_t a1, uint64_t a2)
{
  return xpc_activity_set_state_with_completion_status(a1, 5LL, a2);
}

uint64_t xpc_activity_defer_until_percentage()
{
  return 0LL;
}

uint64_t xpc_activity_defer_until_network_change()
{
  return 0LL;
}

uint64_t xpc_activity_get_percentage()
{
  return 0LL;
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return (*((_BYTE *)activity + 136) & 2) == 0;
}

void xpc_activity_unregister(const char *identifier)
{
  if (_xpc_activity_once != -1) {
    dispatch_once(&_xpc_activity_once, &__block_literal_global_104);
  }
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __xpc_activity_unregister_block_invoke;
  block[3] = &__block_descriptor_tmp_79;
  block[4] = identifier;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
}

BOOL __xpc_activity_unregister_block_invoke(uint64_t a1)
{
  registration = _xpc_activity_find_registration(*(const char **)(a1 + 32));
  return _xpc_activity_unregister((uint64_t)registration, 0LL);
}

BOOL _xpc_activity_unregister(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  if (a2)
  {
    uint64_t v3 = a2;
    __xpc_activity_unregister(a2);
    BOOL v4 = *(void *)(a1 + 24) == 0LL;
  }

  else
  {
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 24);
      if (!v5) {
        break;
      }
      __xpc_activity_unregister(v5);
    }

    uint64_t v3 = 0LL;
    BOOL v4 = 1LL;
  }

  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  uint64_t v6 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = *(const char **)a1;
    uint64_t v8 = *(void *)(a1 + 16);
    int v14 = 136446722;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_impl( &dword_180150000,  v6,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_unregister: %{public}s %llu, last registration: %{BOOL}d",  (uint8_t *)&v14,  0x1Cu);
  }

  if (v4)
  {
    if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
      uint64_t v9 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
    }
    else {
      uint64_t v9 = _os_alloc_once();
    }
    if (*(_BYTE *)(v9 + 3)) {
      xpc_set_event("com.apple.xpc.activity", *(const char **)a1, 0LL);
    }
    os_release(*(void **)(a1 + 64));
    *(void *)(a1 + 64) = 0LL;
    uint64_t v10 = *(void **)(a1 + 8);
    if (v10)
    {
      xpc_release(v10);
      *(void *)(a1 + 8) = 0LL;
    }

    uint64_t v11 = *(void **)(a1 + 56);
    if (v11)
    {
      xpc_release(v11);
      *(void *)(a1 + 56) = 0LL;
    }

    if (v3)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        *(void *)(v12 + 40) = *(void *)(a1 + 40);
      }
      **(void **)(a1 + 40) = v12;
      *(void *)(a1 + 32) = -1LL;
      *(void *)(a1 + 40) = -1LL;
      free(*(void **)a1);
      free((void *)a1);
    }

    else
    {
      *(void *)(a1 + 48) = 0LL;
      *(void *)(a1 + 16) = -1LL;
    }
  }

  return v4;
}

uint64_t xpc_activity_copy_dispatch_queue(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void xpc_activity_run(const char *a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "Command", "Run");
  xpc_dictionary_set_string(v4, "Identifier", a1);
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __xpc_activity_run_block_invoke;
  void v5[3] = &unk_18962B248;
  _BYTE v5[4] = a2;
  void v5[5] = v4;
  dispatch_async((dispatch_queue_t)_control_queue, v5);
}

void _xpc_activity_create_control_channel()
{
  if (_xpc_activity_once != -1) {
    dispatch_once(&_xpc_activity_once, &__block_literal_global_104);
  }
  if (_control_once != -1) {
    dispatch_once(&_control_once, &__block_literal_global_132);
  }
}

void __xpc_activity_run_block_invoke(uint64_t a1)
{
  handler[0] = MEMORY[0x1895FED80];
  handler[1] = 0x40000000LL;
  handler[2] = __xpc_activity_run_block_invoke_2;
  handler[3] = &unk_18962B220;
  uint64_t v2 = *(void **)(a1 + 40);
  handler[4] = *(void *)(a1 + 32);
  xpc_connection_send_message_with_reply( (xpc_connection_t)_control_connection,  v2,  (dispatch_queue_t)_xpc_activity_queue,  handler);
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_activity_run_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  unsigned int int64 = xpc_dictionary_get_int64(xdict, "Result");
  if (xpc_get_type(xdict) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error) {
    uint64_t v5 = 5LL;
  }
  else {
    uint64_t v5 = int64;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v5);
}

void xpc_activity_list(const char *a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "Command", "List");
  if (a1) {
    xpc_dictionary_set_string(v4, "Identifier", a1);
  }
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  _OWORD v5[2] = __xpc_activity_list_block_invoke;
  void v5[3] = &unk_18962B298;
  _BYTE v5[4] = a2;
  void v5[5] = v4;
  dispatch_async((dispatch_queue_t)_control_queue, v5);
}

void __xpc_activity_list_block_invoke(uint64_t a1)
{
  handler[0] = MEMORY[0x1895FED80];
  handler[1] = 0x40000000LL;
  handler[2] = __xpc_activity_list_block_invoke_2;
  handler[3] = &unk_18962B270;
  uint64_t v2 = *(void **)(a1 + 40);
  handler[4] = *(void *)(a1 + 32);
  xpc_connection_send_message_with_reply( (xpc_connection_t)_control_connection,  v2,  (dispatch_queue_t)_xpc_activity_queue,  handler);
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_activity_list_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t value = xpc_dictionary_get_value(xdict, "List");
  return (*(uint64_t (**)(uint64_t, xpc_object_t))(v2 + 16))(v2, value);
}

void xpc_activity_debug(const char *a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, "Command", "Debug");
  xpc_dictionary_set_string(v6, "Identifier", a1);
  xpc_dictionary_set_uint64(v6, "Flags", a2);
  v7[0] = MEMORY[0x1895FED80];
  v7[1] = 0x40000000LL;
  void v7[2] = __xpc_activity_debug_block_invoke;
  void v7[3] = &unk_18962B2E8;
  v7[4] = a3;
  v7[5] = v6;
  dispatch_async((dispatch_queue_t)_control_queue, v7);
}

void __xpc_activity_debug_block_invoke(uint64_t a1)
{
  handler[0] = MEMORY[0x1895FED80];
  handler[1] = 0x40000000LL;
  handler[2] = __xpc_activity_debug_block_invoke_2;
  handler[3] = &unk_18962B2C0;
  uint64_t v2 = *(void **)(a1 + 40);
  handler[4] = *(void *)(a1 + 32);
  xpc_connection_send_message_with_reply( (xpc_connection_t)_control_connection,  v2,  (dispatch_queue_t)_xpc_activity_queue,  handler);
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_activity_debug_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  unsigned int int64 = xpc_dictionary_get_int64(xdict, "Result");
  if (xpc_get_type(xdict) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error) {
    uint64_t v5 = 5LL;
  }
  else {
    uint64_t v5 = int64;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v5);
}

void _xpc_activity_end_running(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  if ((*(_BYTE *)(a1 + 136) & 1) != 0)
  {
    *(_BYTE *)(a1 + 136) &= ~1u;
    if (!*(void *)(a1 + 112)) {
      goto LABEL_10;
    }
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    uint64_t v2 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 24);
      uint64_t v4 = *(void *)(a1 + 96);
      int v6 = 136446722;
      uint64_t v7 = v3;
      __int16 v8 = 2048;
      uint64_t v9 = a1;
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_end_running: %{public}s (%p) seqno: %llu.",  (uint8_t *)&v6,  0x20u);
    }

    uint64_t v5 = *(void **)(a1 + 112);
    if (!v5)
    {
LABEL_10:
      _os_assumes_log();
      uint64_t v5 = *(void **)(a1 + 112);
    }

    os_release(v5);
    *(void *)(a1 + 112) = 0LL;
  }

os_log_t ___activity_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.xpc.activity", "Client");
  _activity_log__log = (uint64_t)result;
  return result;
}

void ___xpc_activity_init_block_invoke()
{
  _xpc_activity_list = 0LL;
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  _xpc_activity_queue = (uint64_t)dispatch_queue_create("com.apple.xpc.activity", v0);
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v1 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v1 = _os_alloc_once();
  }
  if (*(_BYTE *)(v1 + 3))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    xpc_set_event_stream_handler("com.apple.xpc.activity", global_queue, &__block_literal_global_106);
  }

void ___xpc_activity_init_block_invoke_2(int a1, xpc_object_t xdict)
{
}

void _xpc_activity_normalize_integer(void *a1, const char *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (value)
  {
    uint64_t v5 = value;
    launch_data_type_t type = (__objc2_class *)xpc_get_type(value);
    if (type == &OBJC_CLASS___OS_xpc_uint64)
    {
      uint64_t v7 = xpc_uint64_get_value(v5);
      if (v7 >= 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t v8 = v7;
      }
      xpc_dictionary_set_int64(a1, a2, v8);
    }

    else if (type == &OBJC_CLASS___OS_xpc_int64 && xpc_int64_get_value(v5) < 0)
    {
      xpc_dictionary_set_value(a1, a2, 0LL);
    }
  }

uint64_t __xpc_activity_find_registration(const char *a1)
{
  uint64_t v2 = _xpc_activity_list;
  if (!_xpc_activity_list) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  do
  {
    uint64_t v2 = *(void *)(v2 + 32);
  }

  while (v2);
  return v3;
}

void ___xpc_activity_new_unmanaged_connection_block_invoke(uint64_t a1, __objc2_class **object)
{
  if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_dictionary)
  {
    _xpc_activity_dispatch(object, *(void **)(a1 + 32));
  }

  else if (object == &_xpc_error_connection_interrupted)
  {
    xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 40), *(xpc_object_t *)(*(void *)(a1 + 40) + 32LL));
  }

void _xpc_activity_setup_control_channel(xpc_object_t xdict)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 16LL) == -1LL) {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 24LL);
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  if (*(_BYTE *)(v2 + 3))
  {
    if (_control_connection)
    {
      xpc_connection_cancel((xpc_connection_t)_control_connection);
      xpc_release((xpc_object_t)_control_connection);
      dispatch_suspend((dispatch_object_t)_control_queue);
    }

    xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "_ReplyEndpoint");
    if (value && (uint64_t v4 = xpc_connection_create_from_endpoint(value)) != 0LL)
    {
      uint64_t v5 = v4;
      xpc_connection_set_target_queue(v4, (dispatch_queue_t)_control_queue);
      xpc_connection_set_event_handler(v5, &__block_literal_global_119_0);
      xpc_connection_activate(v5);
      _control_connection = (uint64_t)v5;
      dispatch_resume((dispatch_object_t)_control_queue);
    }

    else
    {
      _control_connection = 0LL;
    }
  }

  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

void ___xpc_activity_dispatch_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1895FEE08];
  registration = _xpc_activity_find_registration(*(const char **)(a1 + 40));
  uint64_t v3 = registration[3];
  if (v3)
  {
    char v4 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v5 = v3;
        uint64_t v3 = *(void *)(v3 + 120);
        if (!*(void *)(v5 + 64) && *(__objc2_class ***)(v5 + 32) == &_xpc_activity_check_in)
        {
          if (_activity_log_pred != -1) {
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          }
          int v6 = (os_log_s *)_activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = *(void *)(a1 + 40);
            *(_DWORD *)mach_port_options_t buf = 136446466;
            uint64_t v33 = v7;
            __int16 v34 = 2048;
            uint64_t v35 = v5;
            _os_log_impl( &dword_180150000,  v6,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%p): state is checking and criteria is checking. Calling _xpc_activity _set_criteria(...CHECK_IN)",  buf,  0x16u);
          }

          _xpc_activity_set_criteria(registration, v5, &_xpc_activity_check_in);
        }

        unint64_t v8 = *(void *)(v5 + 96);
        unint64_t v9 = *(void *)(a1 + 48);
        if (v8 == v9) {
          break;
        }
        if (v8 >= v9)
        {
          if (_activity_log_pred != -1) {
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          }
          xpc_object_t v23 = (os_log_s *)_activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = *(void *)(v5 + 96);
            uint64_t v25 = *(void *)(a1 + 40);
            uint64_t v26 = *(void *)(a1 + 48);
            *(_DWORD *)mach_port_options_t buf = 136446978;
            uint64_t v33 = v25;
            __int16 v34 = 2048;
            uint64_t v35 = v5;
            __int16 v36 = 2048;
            uint64_t v37 = v24;
            __int16 v38 = 2048;
            uint64_t v39 = v26;
            _os_log_impl( &dword_180150000,  v23,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%p): found a activity with seqno %llu NEWER THAN than the event's seqn o %llu. Doing nothing.",  buf,  0x2Au);
          }

          char v4 = 1;
          if (!v3) {
            goto LABEL_46;
          }
        }

        else
        {
          if (v9 > registration[2]) {
            goto LABEL_37;
          }
          if (_activity_log_pred != -1) {
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          }
          int v14 = (os_log_s *)_activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(v5 + 96);
            uint64_t v16 = *(void *)(a1 + 40);
            uint64_t v17 = *(void *)(a1 + 48);
            *(_DWORD *)mach_port_options_t buf = 136446978;
            uint64_t v33 = v16;
            __int16 v34 = 2050;
            uint64_t v35 = v5;
            __int16 v36 = 2048;
            uint64_t v37 = v15;
            __int16 v38 = 2048;
            uint64_t v39 = v17;
            _os_log_impl( &dword_180150000,  v14,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%{public}p): found an activity with seqno %llu older than the event's seqno %llu. Unregistering it.",  buf,  0x2Au);
          }

          if (_activity_log_pred != -1) {
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          }
          __int16 v18 = (os_log_s *)_activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *(void *)(a1 + 40);
            *(_DWORD *)mach_port_options_t buf = 136446466;
            uint64_t v33 = v19;
            __int16 v34 = 2050;
            uint64_t v35 = v5;
            _os_log_impl( &dword_180150000,  v18,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%{public}p): no references remain after unregistering old activity.",  buf,  0x16u);
          }

          registration = 0LL;
          if (!v3) {
            goto LABEL_46;
          }
        }
      }

      if (!*(_BYTE *)(a1 + 80)) {
        break;
      }
      uint64_t v10 = *(void *)(a1 + 56);
      if (v10)
      {
        if (*(void *)(v5 + 80) == v10) {
          break;
        }
      }

      if (_activity_log_pred != -1) {
        dispatch_once(&_activity_log_pred, &__block_literal_global_9);
      }
      uint64_t v11 = (os_log_s *)_activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        *(_DWORD *)mach_port_options_t buf = 136446722;
        uint64_t v33 = v12;
        __int16 v34 = 2048;
        uint64_t v35 = v5;
        __int16 v36 = 2048;
        uint64_t v37 = v13;
        _os_log_impl( &dword_180150000,  v11,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%p): ignoring an activity with matching seqno because of reply connection mismatch %llu",  buf,  0x20u);
        if (!v3) {
          goto LABEL_46;
        }
      }

      else
      {
LABEL_37:
        if (!v3) {
          goto LABEL_46;
        }
      }
    }

    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    uint64_t v20 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)mach_port_options_t buf = 136446722;
      uint64_t v33 = v21;
      __int16 v34 = 2048;
      uint64_t v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = v22;
      _os_log_impl( &dword_180150000,  v20,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%p): found an activity with matching seqno %llu",  buf,  0x20u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_retain((xpc_object_t)v5);
    goto LABEL_37;
  }

  char v4 = 0;
LABEL_46:
  if ((v4 & 1) == 0
    && registration
    && !*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
    && registration[2] != -1LL)
  {
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    char v27 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = *(void *)(a1 + 48);
      *(_DWORD *)mach_port_options_t buf = 136446722;
      uint64_t v33 = v28;
      __int16 v34 = 2048;
      uint64_t v35 = 0LL;
      __int16 v36 = 2048;
      uint64_t v37 = v29;
      _os_log_impl( &dword_180150000,  v27,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: %{public}s (%p): An event was delivered before the process has checked in. Stashing pend ing_seqno %llu, transaction, endpoint",  buf,  0x20u);
    }

    registration[6] = *(void *)(a1 + 48);
    os_release((void *)registration[8]);
    registration[8] = os_retain(*(void **)(a1 + 64));
    __int16 v30 = (void *)registration[7];
    if (v30)
    {
      xpc_release(v30);
      registration[7] = 0LL;
    }

    uint64_t v31 = *(void **)(a1 + 72);
    if (v31)
    {
      xpc_retain(v31);
      registration[7] = *(void *)(a1 + 72);
    }
  }

void _xpc_activity_set_eligible(_BYTE *a1, int a2)
{
  char v2 = a1[136];
  if (a2) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  a1[136] = v2 & 0xFD | v3;
  if ((v2 & 2) != 0 && (a2 & 1) == 0)
  {
    xpc_retain(a1);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___xpc_activity_notify_eligibility_changed_handlers_block_invoke;
    block[3] = &__block_descriptor_tmp_121;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_xpc_activity_queue, block);
  }

void ___xpc_activity_dispatch_block_invoke_113(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  char v2 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v5 = *(_xpc_connection_s **)(v4 + 24);
    *(_DWORD *)mach_port_options_t buf = 136446722;
    char v27 = v5;
    __int16 v28 = 2048;
    uint64_t v29 = v4;
    __int16 v30 = 2048;
    uint64_t v31 = v3;
    _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: lower half, activity name %{public}s (%p), seqno from top half was %llu",  buf,  0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 && *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 80LL))
  {
    if (*(_BYTE *)(a1 + 72)) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    int listener_port = _xpc_endpoint_get_listener_port(v6);
    mach_port_name_t v8 = _xpc_connection_copy_listener_port(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
                                                      + 80LL));
    if (listener_port != v8)
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      xpc_connection_cancel(*(xpc_connection_t *)(v9 + 80));
      xpc_release(*(xpc_object_t *)(v9 + 80));
      *(void *)(v9 + 80) = 0LL;
    }
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    if (!*(_BYTE *)(a1 + 72)) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    if (v10 != *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 80LL)) {
      _xpc_mach_message_request_handoff_reply_cold_1();
    }
    if (xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 64), "run") == &_xpc_BOOL_true)
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      *(_BYTE *)(v11 + 136) |= 2u;
      _xpc_activity_set_state_with_completion_status( *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  2LL,  0LL);
    }
  }

  if (*(void *)(a1 + 48))
  {
    if (!*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 80LL))
    {
      if (*(_BYTE *)(a1 + 72)) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      uint64_t v12 = *(void **)(a1 + 64);
      if (!v12) {
        _xpc_mach_message_request_handoff_reply_cold_1();
      }
      xpc_retain(v12);
      uint64_t v13 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 48));
      xpc_connection_set_target_queue(v13, (dispatch_queue_t)_xpc_activity_queue);
      uint64_t v14 = MEMORY[0x1895FED80];
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 8_xpc_activity_dispatch(xdict, 0LL) = v13;
      v24[0] = v14;
      v24[1] = 0x40000000LL;
      uint64_t v24[2] = ___xpc_activity_dispatch_block_invoke_115;
      v24[3] = &__block_descriptor_tmp_116;
      uint64_t v15 = *(void *)(a1 + 40);
      v24[4] = *(void *)(a1 + 64);
      v24[5] = v15;
      char v25 = *(_BYTE *)(a1 + 72);
      v24[6] = v13;
      xpc_connection_set_event_handler(v13, v24);
      xpc_connection_activate(v13);
      if (_activity_log_pred != -1) {
        dispatch_once(&_activity_log_pred, &__block_literal_global_9);
      }
      uint64_t v16 = (os_log_s *)_activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
        uint64_t v19 = *(void *)(v18 + 24);
        *(_DWORD *)mach_port_options_t buf = 134218754;
        char v27 = v13;
        __int16 v28 = 2082;
        uint64_t v29 = v19;
        __int16 v30 = 2048;
        uint64_t v31 = v18;
        __int16 v32 = 2048;
        uint64_t v33 = v17;
        _os_log_impl( &dword_180150000,  v16,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: created connection %p for activity name %{public}s (%p), seqno %llu",  buf,  0x2Au);
      }
    }

    uint64_t v20 = *(void **)(a1 + 48);
    if (v20) {
      xpc_release(v20);
    }
  }

  uint64_t v21 = *(void **)(a1 + 56);
  if (v21) {
    xpc_release(v21);
  }
  uint64_t v22 = *(void **)(a1 + 64);
  if (v22) {
    xpc_release(v22);
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    *(_BYTE *)(v23 + 136) |= 2u;
    _xpc_activity_set_state_with_completion_status( *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  2LL,  0LL);
  }

  xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

void ___xpc_activity_dispatch_block_invoke_115(uint64_t a1, __objc2_class **object)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  if (xpc_get_type(object) == (xpc_type_t)&OBJC_CLASS___OS_xpc_error)
  {
    if (object == &_xpc_error_connection_invalid) {
      xpc_release(*(xpc_object_t *)(a1 + 32));
    }
  }

  else
  {
    xpc_object_t value = (__objc2_class **)xpc_dictionary_get_value(object, "eligible");
    if (value)
    {
      uint64_t v5 = value;
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "XPCEventName");
      uint64_t registration = __xpc_activity_find_registration(string);
      if (registration)
      {
        uint64_t v8 = *(void *)(registration + 24);
        if (v8)
        {
          uint64_t v9 = 0LL;
          do
          {
            while (1)
            {
              uint64_t v10 = v8;
              uint64_t v8 = *(void *)(v8 + 120);
              if (*(void *)(v10 + 96) == *(void *)(a1 + 40))
              {
                if (!*(_BYTE *)(a1 + 56)) {
                  break;
                }
                uint64_t v11 = *(void *)(a1 + 48);
                if (v11)
                {
                  if (*(void *)(v10 + 80) == v11) {
                    break;
                  }
                }
              }

              if (!v8) {
                goto LABEL_20;
              }
            }

            if (_activity_log_pred != -1) {
              dispatch_once(&_activity_log_pred, &__block_literal_global_9);
            }
            uint64_t v12 = (os_log_s *)_activity_log__log;
            if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = *(void *)(a1 + 40);
              *(_DWORD *)mach_port_options_t buf = 136446722;
              uint64_t v15 = string;
              __int16 v16 = 2048;
              uint64_t v17 = v10;
              __int16 v18 = 2048;
              uint64_t v19 = v13;
              _os_log_impl( &dword_180150000,  v12,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_dispatch: xpc_connection_set_event_handler: %{public}s (%p): found an activity with matching seqno %llu",  buf,  0x20u);
            }

            uint64_t v9 = (_BYTE *)v10;
          }

          while (v8);
LABEL_20:
          if (v9) {
            _xpc_activity_set_eligible(v9, v5 == &_xpc_BOOL_true);
          }
        }
      }
    }
  }

void ___xpc_activity_notify_eligibility_changed_handlers_block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[7];
  if (v3)
  {
    uint64_t v4 = MEMORY[0x1895FED80];
    do
    {
      uint64_t v5 = *(const void **)(v3 + 8);
      xpc_retain(*(xpc_object_t *)(a1 + 32));
      uint64_t v6 = _Block_copy(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(dispatch_queue_s **)(v7 + 40);
      v9[0] = v4;
      v9[1] = 0x40000000LL;
      v9[2] = ___xpc_activity_notify_eligibility_changed_handlers_block_invoke_2;
      void v9[3] = &unk_18962B4A0;
      v9[4] = v6;
      v9[5] = v7;
      dispatch_async(v8, v9);
      uint64_t v3 = *(void *)(v3 + 16);
    }

    while (v3);
    char v2 = *(void **)(a1 + 32);
  }

  xpc_release(v2);
}

void ___xpc_activity_notify_eligibility_changed_handlers_block_invoke_2(uint64_t a1)
{
}

void _xpc_activity_set_state_with_completion_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  uint64_t v6 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 24);
    *(_DWORD *)mach_port_options_t buf = 136446722;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = a1;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    _os_log_impl(&dword_180150000, v6, OS_LOG_TYPE_DEFAULT, "_xpc_activity_set_state: %{public}s (%p), %ld", buf, 0x20u);
  }

  if (a2)
  {
    if (*(void *)(a1 + 80))
    {
      if (*(void *)(a1 + 72) != a2)
      {
        *(void *)(a1 + 72) = a2;
        xpc_retain((xpc_object_t)a1);
        uint64_t v8 = *(void *)(a1 + 88);
        uint64_t v9 = *(dispatch_queue_s **)(a1 + 40);
        v10[0] = MEMORY[0x1895FED80];
        v10[1] = 0x40000000LL;
        v10[2] = ___xpc_activity_set_state_with_completion_status_block_invoke;
        v10[3] = &__block_descriptor_tmp_127;
        v10[4] = v8;
        v10[5] = a1;
        void v10[6] = a2;
        v10[7] = a3;
        dispatch_async(v9, v10);
      }
    }
  }

  else
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    *(void *)(a1 + 64) = 0LL;
    __XPC_ACTIVITY_CALLING_HANDLER__(a1);
  }

uint64_t __XPC_ACTIVITY_CALLING_HANDLER__(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  char v2 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 72);
    int v14 = 136446978;
    uint64_t v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = a1;
    __int16 v18 = 2048;
    uint64_t v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v5;
    _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "__XPC_ACTIVITY_CALLING_HANDLER__: %{public}s (%p), current state %ld, pending state %ld",  (uint8_t *)&v14,  0x2Au);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a1);
  }
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  uint64_t v7 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 24);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    int v14 = 136446978;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = a1;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    _os_log_impl( &dword_180150000,  v7,  OS_LOG_TYPE_DEFAULT,  "__XPC_ACTIVITY_CALLING_HANDLER__ returned from handler: %{public}s (%p), current state %ld, pending state %ld",  (uint8_t *)&v14,  0x2Au);
  }

  unint64_t v11 = *(void *)(a1 + 72);
  if (!v11) {
    unint64_t v11 = *(void *)(a1 + 64);
  }
  if (v11 > 5) {
    abort();
  }
  if (((1LL << v11) & 0x29) != 0)
  {
    uint64_t v12 = 1LL;
LABEL_18:
    _xpc_activity_set_state_with_completion_status(a1, v12, 0LL);
    return _os_avoid_tail_call();
  }

  if (((1LL << v11) & 0x12) == 0)
  {
    uint64_t v12 = 5LL;
    goto LABEL_18;
  }

  return _os_avoid_tail_call();
}

void ___xpc_activity_set_state_with_completion_status_block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895FEE08];
  uint64_t v3 = *(void *)(a1 + 32);
  char v2 = *(void **)(a1 + 40);
  if (v3 == v2[11])
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v4, "state", *(void *)(a1 + 48));
    if (*(void *)(a1 + 48) == 5LL) {
      xpc_dictionary_set_int64(v4, "completion_status", *(void *)(a1 + 56));
    }
    xpc_retain(*(xpc_object_t *)(a1 + 40));
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    uint64_t v5 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(v6 + 24);
      *(_DWORD *)mach_port_options_t buf = 136446722;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      uint64_t v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl( &dword_180150000,  v5,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_set_state: send new state to CTS: %{public}s (%p), %ld",  buf,  0x20u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(_xpc_connection_s **)(v9 + 80);
    unint64_t v11 = *(dispatch_queue_s **)(v9 + 40);
    v14[0] = MEMORY[0x1895FED80];
    v14[1] = 0x40000000LL;
    v14[2] = ___xpc_activity_set_state_with_completion_status_block_invoke_125;
    void v14[3] = &__block_descriptor_tmp_126;
    uint8_t v14[4] = v9;
    xpc_connection_send_message_with_reply(v10, v4, v11, v14);
    xpc_release(v4);
  }

  else
  {
    xpc_retain(v2);
    uint64_t v12 = *(void *)(a1 + 40);
    __int16 v13 = *(dispatch_queue_s **)(v12 + 40);
    block[0] = MEMORY[0x1895FED80];
    block[1] = 0x40000000LL;
    block[2] = ___xpc_activity_set_state_with_completion_status_block_invoke_2;
    block[3] = &__block_descriptor_tmp_122;
    block[4] = v12;
    dispatch_async(v13, block);
  }

  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void ___xpc_activity_set_state_with_completion_status_block_invoke_2(uint64_t a1)
{
}

void _xpc_activity_set_state_fakereply(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    uint64_t v4 = *(void *)(a1 + 64);
  }
  if (((v4 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    int64_t v5 = 1LL;
  }
  else {
    int64_t v5 = 5LL;
  }
  xpc_dictionary_set_int64(v2, "state", v5);
  _xpc_activity_set_state_from_cts(a1, v3);
  xpc_release(v3);
}

void ___xpc_activity_set_state_with_completion_status_block_invoke_125(uint64_t a1, xpc_object_t object)
{
  launch_data_type_t type = (__objc2_class *)xpc_get_type(object);
  uint64_t v5 = *(void *)(a1 + 32);
  if (type == &OBJC_CLASS___OS_xpc_error) {
    _xpc_activity_set_state_fakereply(v5);
  }
  else {
    _xpc_activity_set_state_from_cts(v5, object);
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void _xpc_activity_set_state_from_cts(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  int64_t int64 = xpc_dictionary_get_int64(a2, "state");
  if (*(void *)(a1 + 64) != int64 || *(void *)(a1 + 104) != *(void *)(a1 + 96))
  {
    if (_activity_log_pred != -1) {
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    }
    uint64_t v5 = (os_log_s *)_activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 24);
      *(_DWORD *)mach_port_options_t buf = 136446722;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = a1;
      __int16 v13 = 2048;
      int64_t v14 = int64;
      _os_log_impl( &dword_180150000,  v5,  OS_LOG_TYPE_DEFAULT,  "_xpc_activity_set_state_from_cts: %{public}s (%p), set activity state to %ld",  buf,  0x20u);
    }

    *(void *)(a1 + 104) = *(void *)(a1 + 96);
    *(void *)(a1 + 64) = int64;
    *(void *)(a1 + 72) = 0LL;
    switch(int64)
    {
      case 1LL:
      case 3LL:
        goto LABEL_8;
      case 2LL:
        xpc_object_t value = (__objc2_class **)xpc_dictionary_get_value(a2, "eligible");
        if (value) {
          _xpc_activity_set_eligible((_BYTE *)a1, value == &_xpc_BOOL_true);
        }
        __XPC_ACTIVITY_CALLING_HANDLER__(a1);
        break;
      case 5LL:
        if ((*(_BYTE *)(a1 + 136) & 4) == 0)
        {
          block[0] = MEMORY[0x1895FED80];
          block[1] = 0x40000000LL;
          block[2] = ___xpc_activity_set_state_from_cts_block_invoke;
          block[3] = &__block_descriptor_tmp_128;
          block[4] = a1;
          dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
        }

BOOL ___xpc_activity_set_state_from_cts_block_invoke(uint64_t a1)
{
  uint64_t registration = _xpc_activity_find_registration(*(const char **)(*(void *)(a1 + 32) + 24LL));
  return _xpc_activity_unregister((uint64_t)registration, *(void *)(a1 + 32));
}

void __xpc_activity_unregister(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  if (_activity_log_pred != -1) {
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  }
  xpc_object_t v2 = (os_log_s *)_activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 96);
    if ((*(_BYTE *)(a1 + 136) & 8) != 0) {
      uint64_t v5 = "(is registered)";
    }
    else {
      uint64_t v5 = "(not registered)";
    }
    int v7 = 136446978;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = a1;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    __int16 v13 = 2082;
    int64_t v14 = v5;
    _os_log_impl( &dword_180150000,  v2,  OS_LOG_TYPE_DEFAULT,  "__xpc_activity_unregister: %{public}s (%p) seqno: %llu, %{public}s",  (uint8_t *)&v7,  0x2Au);
  }

  if ((*(_BYTE *)(a1 + 136) & 8) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 120);
    *(_BYTE *)(a1 + 136) &= ~8u;
    if (v6) {
      *(void *)(v6 + 128) = *(void *)(a1 + 128);
    }
    **(void **)(a1 + 128) = v6;
    *(void *)(a1 + 120) = -1LL;
    *(void *)(a1 + 128) = -1LL;
    xpc_release((xpc_object_t)a1);
  }

void ___xpc_activity_create_control_channel_block_invoke()
{
  _control_queue = (uint64_t)dispatch_queue_create_with_target_V2( "com.apple.xpc.activity.control",  0LL,  (dispatch_queue_t)_xpc_activity_queue);
  dispatch_suspend((dispatch_object_t)_control_queue);
  xpc_connection_t mach_service = xpc_connection_create_mach_service( "com.apple.xpc.activity.control",  (dispatch_queue_t)_control_queue,  0LL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_134);
  _control_connection = (uint64_t)mach_service;
  xpc_connection_activate(mach_service);
  dispatch_resume((dispatch_object_t)_control_queue);
}

uint64_t _der_vm_context_to_xpc(__int128 *a1)
{
  __int128 v2 = a1[1];
  __int128 v5 = *a1;
  __int128 v6 = v2;
  __int128 v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  __int128 v3 = a1[1];
  __int128 v5 = *a1;
  __int128 v6 = v3;
  __int128 v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 6);
  return _objectForActiveContext((uint64_t *)&v5);
}

uint64_t _objectForActiveContext(uint64_t *a1)
{
  uint64_t v2 = *a1;
  __int128 v3 = *((_OWORD *)a1 + 1);
  __int128 v22 = *(_OWORD *)a1;
  __int128 v23 = v3;
  __int128 v24 = *((_OWORD *)a1 + 2);
  uint64_t v25 = a1[6];
  switch(der_vm_CEType_from_context((uint64_t)&v22, 0LL))
  {
    case 1u:
      __int128 v18 = *(_OWORD *)a1;
      __int128 v19 = *((_OWORD *)a1 + 1);
      __int128 v20 = *((_OWORD *)a1 + 2);
      uint64_t v21 = a1[6];
      xpc_object_t empty = xpc_dictionary_create_empty();
      goto LABEL_4;
    case 2u:
      __int128 v18 = *(_OWORD *)a1;
      __int128 v19 = *((_OWORD *)a1 + 1);
      __int128 v20 = *((_OWORD *)a1 + 2);
      uint64_t v21 = a1[6];
      xpc_object_t empty = xpc_array_create_empty();
LABEL_4:
      uint64_t v5 = (uint64_t)empty;
      __int128 v22 = v18;
      __int128 v23 = v19;
      __int128 v24 = v20;
      uint64_t v25 = v21;
      der_vm_iterate((unint64_t)&v22, (uint64_t)empty, (uint64_t)_manufacturingCallback);
      goto LABEL_10;
    case 3u:
      __int128 v6 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v6;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      int64_t v7 = der_vm_integer_from_context((uint64_t)&v22);
      uint64_t no_copy = (uint64_t)xpc_int64_create(v7);
      goto LABEL_9;
    case 4u:
      __int128 v9 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v9;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      uint64_t v10 = (const char *)string_for_context((uint64_t)&v22);
      uint64_t no_copy = xpc_string_create_no_copy(v10);
      goto LABEL_9;
    case 5u:
      __int128 v11 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v11;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      char v12 = der_vm_BOOL_from_context((uint64_t)&v22);
      uint64_t no_copy = (uint64_t)xpc_BOOL_create(v12);
      goto LABEL_9;
    case 6u:
      __int128 v13 = *((_OWORD *)a1 + 1);
      __int128 v22 = *(_OWORD *)a1;
      __int128 v23 = v13;
      __int128 v24 = *((_OWORD *)a1 + 2);
      uint64_t v25 = a1[6];
      int64_t v14 = der_vm_data_from_context((uint64_t)&v22);
      uint64_t no_copy = (uint64_t)xpc_data_create(v14, v15);
LABEL_9:
      uint64_t v5 = no_copy;
LABEL_10:
      uint64_t result = v5;
      break;
    default:
      uint64_t v17 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_objectForActiveContext",  "CoreEntitlements: unknown DER type");
      uint64_t result = xpc_create_from_ce_der(v17);
      break;
  }

  return result;
}

uint64_t xpc_create_from_ce_der(unsigned __int8 *a1, uint64_t a2)
{
  __int128 v12 = 0uLL;
  uint64_t v13 = 0LL;
  uint64_t v2 = (void *)CEValidate((uint64_t)&_CERuntimeImpl, (uint64_t *)&v12, a1, &a1[a2]);
  uint64_t result = 0LL;
  if (v2 == &Errors)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v4 = v12;
    *(void *)&__int128 v5 = v13;
    if ((_UNKNOWN *)CEAcquireUnmanagedContext((uint64_t)&_CERuntimeImpl, &v4, (uint64_t)&v8) == &Errors)
    {
      __int128 v4 = v8;
      __int128 v5 = v9;
      __int128 v6 = v10;
      uint64_t v7 = v11;
      return _der_vm_context_to_xpc(&v4);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t xpc_create_from_ce_der_with_key(unsigned __int8 *a1, uint64_t a2, const char *a3)
{
  uint64_t v37 = *MEMORY[0x1895FEE08];
  __int128 v18 = 0uLL;
  size_t v19 = 0LL;
  __int128 v4 = (void *)CEValidate((uint64_t)&_CERuntimeImpl, (uint64_t *)&v18, a1, &a1[a2]);
  uint64_t result = 0LL;
  if (v4 == &Errors)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v20 = v18;
    size_t v21 = v19;
    if ((_UNKNOWN *)CEAcquireUnmanagedContext((uint64_t)&_CERuntimeImpl, &v20, (uint64_t)&v14) == &Errors)
    {
      uint64_t v36 = 0LL;
      __int128 v35 = 0u;
      __int128 v34 = 0u;
      __int128 v33 = 0u;
      __int128 v32 = 0u;
      __int128 v31 = 0u;
      __int128 v30 = 0u;
      __int128 v29 = 0u;
      __int128 v28 = 0u;
      __int128 v27 = 0u;
      __int128 v26 = 0u;
      __int128 v25 = 0u;
      __int128 v24 = 0u;
      __int128 v23 = 0u;
      __int128 v22 = 0u;
      *(void *)&__int128 v20 = 0x4000000000000001LL;
      *((void *)&v20 + 1) = a3;
      size_t v21 = strlen(a3);
      uint64_t v13 = 0LL;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v10 = 0u;
      __int128 v6 = v14;
      __int128 v7 = v15;
      __int128 v8 = v16;
      uint64_t v9 = v17;
      der_vm_execute_nocopy((unint64_t)&v6, (uint64_t)&v20, (uint64_t)&v10);
      __int128 v6 = v10;
      __int128 v7 = v11;
      __int128 v8 = v12;
      uint64_t v9 = v13;
      return _der_vm_context_to_xpc(&v6);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t _manufacturingCallback(uint64_t *a1)
{
  uint64_t v27 = *MEMORY[0x1895FEE08];
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      __int128 v7 = (void *)a1[15];
      __int128 v14 = *(_OWORD *)(a1 + 7);
      __int128 v15 = *(_OWORD *)(a1 + 9);
      __int128 v16 = *(_OWORD *)(a1 + 11);
      uint64_t v17 = a1[13];
      uint64_t v25 = 0LL;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v22 = 0u;
      memset((char *)v26 + 8, 0, 248);
      __int128 v8 = *(_OWORD *)(a1 + 9);
      v20[0] = *(_OWORD *)(a1 + 7);
      v20[1] = v8;
      void v20[2] = *(_OWORD *)(a1 + 11);
      uint64_t v21 = a1[13];
      *(void *)&v26[0] = 2LL;
      der_vm_execute((unint64_t)v20, (unint64_t)v26, (uint64_t)&v22);
      v26[0] = v22;
      v26[1] = v23;
      v26[2] = v24;
      *(void *)&v26[3] = v25;
      uint64_t v9 = (char *)string_for_context((uint64_t)v26);
      v18[0] = v14;
      v18[1] = v15;
      v18[2] = v16;
      uint64_t v19 = v17;
      v26[0] = xmmword_1801883F0;
      memset(&v26[1], 0, 240);
      der_vm_execute((unint64_t)v18, (unint64_t)v26, (uint64_t)v20);
      xpc_object_t active = (xpc_object_t)_objectForActiveContext(v20);
      xpc_dictionary_set_value(v7, v9, active);
      free(v9);
    }

    else
    {
      xpc_object_t active = xpc_array_create_empty();
      __int128 v11 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v11;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v26[3] = a1[13];
      if ((_UNKNOWN *)der_vm_iterate((unint64_t)v26, (uint64_t)active, (uint64_t)_manufacturingCallback) != &Errors)
      {
        uint64_t v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)string_for_context(v13);
      }

      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, active);
    }

    __int128 v6 = active;
    goto LABEL_10;
  }

  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      __int128 v4 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v4;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(void *)&v26[3] = a1[13];
      __int128 v5 = (void *)_objectForActiveContext(v26);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      __int128 v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1LL;
    }

    uint64_t v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: not a sequence");
  }

  else
  {
    uint64_t v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))( v2,  "[%s]: %s\n",  "_manufacturingCallback",  "CoreEntitlements: unknown DER type");
  }

  return (uint64_t)string_for_context(v13);
}

void *string_for_context(uint64_t a1)
{
  __int128 v1 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v1;
  void v7[2] = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v2 = der_vm_string_from_context((uint64_t)v7);
  size_t v4 = v3;
  __int128 v5 = _xpc_alloc(v3 + 1);
  memcpy(v5, v2, v4);
  return v5;
}

void *_ce_malloc(int a1, size_t __size)
{
  return malloc(__size);
}

void _ce_free(int a1, void *a2)
{
}

void _ce_log( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void _ce_abort( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

unsigned int *xpc_format_specifiers_lookup(const char *a1, int a2)
{
  size_t v3 = (a2 - 1);
  unsigned int v4 = specifier_hash_asso_values[a1[v3]] + a2;
  if (v4 > 0x13) {
    return 0LL;
  }
  __int128 v5 = (unsigned int *)((char *)&xpc_format_specifiers_lookup_wordlist + 12 * v4);
  uint64_t v6 = *v5;
  if ((v6 & 0x80000000) != 0) {
    return 0LL;
  }
  __int128 v7 = (char *)&stringpool_contents[v6];
  return v5;
}

uint64_t (*notify_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

_DWORD *_Xmach_notify_port_deleted(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36) {
    do_mach_notify_port_deleted();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  return result;
}

uint64_t _Xmach_notify_port_destroyed(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 0x100000)
    {
      uint64_t result = do_mach_notify_port_destroyed(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }

    int v3 = -300;
  }

  else
  {
    int v3 = -304;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  return result;
}

_DWORD *_Xmach_notify_no_senders(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  }

  else
  {
    uint64_t result = (_DWORD *)do_mach_notify_no_senders();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xmach_notify_send_once(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  }

  else
  {
    uint64_t result = (_DWORD *)do_mach_notify_send_once(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

_DWORD *_Xmach_notify_dead_name(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36) {
    do_mach_notify_dead_name();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  return result;
}

uint64_t notify_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 73) >= 0xFFFFFFF7
    && (__int128 v5 = (void (*)(void))do_notify_subsystem[5 * (v4 - 64) + 5]) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

BOOL ccder_blob_encode_body(void *a1, unint64_t a2, const void *a3)
{
  if (!a3) {
    return a2 == 0;
  }
  __dst[0] = 0LL;
  __dst[1] = 0LL;
  BOOL v5 = ccder_blob_reserve(a1, a2, __dst);
  if (v5) {
    memmove(__dst[0], a3, a2);
  }
  return v5;
}

uint64_t ccder_blob_decode_range(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3)
{
  unint64_t v8 = 0LL;
  uint64_t result = ccder_blob_decode_tl_internal(a1, a2, &v8, 0);
  if ((_DWORD)result)
  {
    uint64_t v6 = *a1;
    __int128 v7 = &(*a1)[v8];
    *a1 = v7;
    *a3 = v6;
    a3[1] = v7;
  }

  else
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  return result;
}

uint64_t ccder_blob_decode_len_strict(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 1);
}

uint64_t ccder_blob_decode_len_internal(unsigned __int8 **a1, unint64_t *a2, int a3)
{
  int v4 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if (*a1) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  __int128 v7 = v4 + 1;
  unint64_t v8 = *v4;
  if ((char)*v4 < 0)
  {
    switch(*v4)
    {
      case 0x81u:
        if ((uint64_t)(v3 - (void)v7) >= 1)
        {
          __int128 v7 = v4 + 2;
          int v10 = (char)v4[1];
          unint64_t v8 = v10;
          if (!a3 || v10 < 0) {
            break;
          }
        }

        goto LABEL_10;
      case 0x82u:
        if ((uint64_t)(v3 - (void)v7) >= 2)
        {
          __int128 v7 = v4 + 3;
          unint64_t v8 = __rev16(*(unsigned __int16 *)(v4 + 1));
          if (!a3 || v8 >= 0x100) {
            break;
          }
        }

        goto LABEL_10;
      case 0x83u:
        if ((uint64_t)(v3 - (void)v7) >= 3)
        {
          __int128 v7 = v4 + 4;
          unint64_t v8 = ((unint64_t)v4[1] << 16) | ((unint64_t)v4[2] << 8) | v4[3];
          if (!a3 || v8 >= 0x10000) {
            break;
          }
        }

        goto LABEL_10;
      case 0x84u:
        if ((uint64_t)(v3 - (void)v7) >= 4)
        {
          __int128 v7 = v4 + 5;
          unint64_t v8 = bswap32(*(_DWORD *)(v4 + 1));
          if (!a3 || v8 >> 24) {
            break;
          }
        }

        goto LABEL_10;
      default:
        goto LABEL_10;
    }
  }

  if (v3 - (unint64_t)v7 < v8)
  {
LABEL_10:
    uint64_t result = 0LL;
    *a2 = 0LL;
  }

  else
  {
    *a2 = v8;
    *a1 = v7;
    return 1LL;
  }

  return result;
}

uint64_t ccder_blob_decode_len(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 0);
}

uint64_t ccder_blob_decode_sequence_tl(unsigned __int8 **a1, unsigned __int8 **a2)
{
  return ccder_blob_decode_range(a1, 0x2000000000000010LL, a2);
}

uint64_t ccder_blob_decode_tag(unsigned __int8 **a1, unint64_t *a2)
{
  int v2 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if (*a1) {
    BOOL v4 = (unint64_t)v2 >= v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0LL;
  }
  unsigned int v8 = *v2;
  uint64_t v6 = v2 + 1;
  unint64_t v7 = v8;
  unint64_t v9 = v8 & 0x1F;
  if (v9 == 31)
  {
    unint64_t v9 = 0LL;
    while (1)
    {
      uint64_t v5 = 0LL;
      unint64_t v10 = v9;
      if (v9 >> 57) {
        break;
      }
      char v11 = *v6++;
      unint64_t v9 = v11 & 0x7F | (v9 << 7);
      if ((v11 & 0x80) == 0)
      {
        if (v10 >> 54) {
          return 0LL;
        }
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    *a2 = v9 | (v7 >> 5 << 61);
    *a1 = v6;
    return 1LL;
  }

  return v5;
}

uint64_t ccder_blob_decode_tl_internal(unsigned __int8 **a1, uint64_t a2, unint64_t *a3, int a4)
{
  unint64_t v10 = 0LL;
  *a3 = 0LL;
  int v8 = ccder_blob_decode_tag(a1, &v10);
  uint64_t result = 0LL;
  if (v8 && v10 == a2)
  {
    if (a4) {
      return ccder_blob_decode_len_strict(a1, a3);
    }
    else {
      return ccder_blob_decode_len(a1, a3);
    }
  }

  return result;
}

uint64_t ccder_blob_decode_tl(unsigned __int8 **a1, uint64_t a2, unint64_t *a3)
{
  return ccder_blob_decode_tl_internal(a1, a2, a3, 0);
}

BOOL ccder_blob_reserve(void *a1, unint64_t a2, void *a3)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = v3 - *a1;
  if (v4 < a2)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  else
  {
    a1[1] = v3 - a2;
    *a3 = v3 - a2;
    a3[1] = v3;
  }

  return v4 >= a2;
}

uint64_t ccder_blob_reserve_tl(uint64_t *a1, unint64_t a2, unint64_t a3, void *a4)
{
  __int128 v9 = 0uLL;
  *a4 = 0LL;
  a4[1] = 0LL;
  uint64_t result = ccder_blob_reserve(a1, a3, &v9);
  if ((_DWORD)result)
  {
    uint64_t result = ccder_blob_encode_tl(a1, a2, a3);
    if ((_DWORD)result)
    {
      *(_OWORD *)a4 = v9;
      return 1LL;
    }
  }

  return result;
}

uint64_t ccder_blob_encode_len(uint64_t *a1, unint64_t a2)
{
  if (HIDWORD(a2)) {
    return 0LL;
  }
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  if (a2 > 0x7F)
  {
    if (a2 > 0xFF)
    {
      if (a2 >> 16)
      {
        if (a2 >> 24)
        {
          if (v3 + 5 <= v2)
          {
            *(_BYTE *)(v2 - 5) = -124;
            unint64_t v4 = v2 - 5;
            *(_DWORD *)(v4 + 1) = bswap32(a2);
            goto LABEL_17;
          }
        }

        else if (v3 + 4 <= v2)
        {
          *(_BYTE *)(v2 - 4) = -125;
          unint64_t v4 = v2 - 4;
          *(_WORD *)(v4 + 2) = bswap32(a2) >> 16;
          *(_BYTE *)(v4 + 1) = BYTE2(a2);
          goto LABEL_17;
        }
      }

      else if (v3 + 3 <= v2)
      {
        *(_BYTE *)(v2 - 3) = -126;
        unint64_t v4 = v2 - 3;
        *(_WORD *)(v4 + 1) = bswap32(a2) >> 16;
        goto LABEL_17;
      }
    }

    else if (v3 + 2 <= v2)
    {
      *(_BYTE *)(v2 - 2) = -127;
      unint64_t v4 = v2 - 2;
      *(_BYTE *)(v4 + 1) = a2;
      goto LABEL_17;
    }

    return 0LL;
  }

  if (v3 + 1 > v2) {
    return 0LL;
  }
  *(_BYTE *)(v2 - 1) = a2;
  unint64_t v4 = v2 - 1;
LABEL_17:
  *a1 = v3;
  a1[1] = v4;
  return 1LL;
}

uint64_t ccder_blob_encode_tag(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = a2 & 0x1FFFFFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFFFFLL) > 0x1E)
  {
    if (v4 <= 0x7F)
    {
      *(_BYTE *)(v2 - 1) = a2;
      uint64_t v6 = (_BYTE *)(v2 - 1);
LABEL_18:
      *(v6 - 1) = HIBYTE(a2) | 0x1F;
      uint64_t v5 = v6 - 1;
      goto LABEL_19;
    }

    if (v4 >> 14)
    {
      if (v4 >> 21)
      {
        unint64_t v9 = v2 - v3;
        if (v4 >> 28)
        {
          if (v9 < 6) {
            return 0LL;
          }
          uint64x2_t v11 = (uint64x2_t)vdupq_n_s64(a2);
          int16x8_t v12 = (int16x8_t)vuzp1q_s32( (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_180188690),  (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_180188680));
          v12.i64[0] = *(void *)&vmovn_s32((int32x4_t)v12) | 0x80008000800080LL;
          *(_DWORD *)(v2 - 5) = vmovn_s16(v12).u32[0];
          uint64_t v6 = (_BYTE *)(v2 - 5);
          _OWORD v6[4] = a2 & 0x7F;
          goto LABEL_18;
        }

        if (v9 < 5) {
          return 0LL;
        }
        *(_BYTE *)(v2 - 4) = (a2 >> 21) | 0x80;
        uint64_t v6 = (_BYTE *)(v2 - 4);
        void v6[3] = a2 & 0x7F;
        v6[2] = (a2 >> 7) | 0x80;
        unsigned int v8 = a2 >> 14;
      }

      else
      {
        *(_BYTE *)(v2 - 3) = (a2 >> 14) | 0x80;
        uint64_t v6 = (_BYTE *)(v2 - 3);
        v6[2] = a2 & 0x7F;
        unsigned int v8 = a2 >> 7;
      }

      char v7 = v8 | 0x80;
    }

    else
    {
      char v7 = a2 & 0x7F;
      *(_BYTE *)(v2 - 2) = (a2 >> 7) | 0x80;
      uint64_t v6 = (_BYTE *)(v2 - 2);
    }

    v6[1] = v7;
    goto LABEL_18;
  }

  if (v2 != v3)
  {
    *(_BYTE *)(v2 - 1) = HIBYTE(a2) & 0xE0 | a2;
    uint64_t v5 = (_BYTE *)(v2 - 1);
LABEL_19:
    *a1 = v3;
    a1[1] = (uint64_t)v5;
    return 1LL;
  }

  return 0LL;
}

uint64_t ccder_blob_encode_tl(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = ccder_blob_encode_len(a1, a3);
  if ((_DWORD)result) {
    return ccder_blob_encode_tag(a1, a2);
  }
  return result;
}

uint64_t ccder_sizeof(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = ccder_sizeof_tag(a1);
  return v3 + a2 + ccder_sizeof_len(a2);
}

uint64_t ccder_blob_encode_body_tl(uint64_t *a1, unint64_t a2, unint64_t a3, const void *a4)
{
  uint64_t result = ccder_blob_encode_body(a1, a3, a4);
  if ((_DWORD)result) {
    return ccder_blob_encode_tl(a1, a2, a3);
  }
  return result;
}

uint64_t ccder_sizeof_len(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1LL;
  }
  uint64_t v2 = 3LL;
  uint64_t v3 = 4LL;
  uint64_t v4 = 5LL;
  uint64_t v5 = 6LL;
  uint64_t v6 = 7LL;
  uint64_t v7 = 8LL;
  if (HIBYTE(a1)) {
    uint64_t v7 = 9LL;
  }
  if (HIWORD(a1)) {
    uint64_t v6 = v7;
  }
  if (a1 >> 40) {
    uint64_t v5 = v6;
  }
  if (HIDWORD(a1)) {
    uint64_t v4 = v5;
  }
  if (a1 >> 24) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x10000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x100) {
    return v2;
  }
  else {
    return 2LL;
  }
}

uint64_t ccder_sizeof_tag(uint64_t a1)
{
  unint64_t v1 = a1 & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v2 = 2LL;
  uint64_t v3 = 3LL;
  uint64_t v4 = 4LL;
  uint64_t v5 = 5LL;
  if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >> 28) {
    uint64_t v5 = 6LL;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x1F) {
    return v2;
  }
  else {
    return 1LL;
  }
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = 22LL;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0LL;
    uint64_t result = __sandbox_ms();
    if ((_DWORD)result) {
      return *__error();
    }
    else {
      *a3 = 0LL;
    }
  }

  return result;
}

uint64_t amfi_interface_query_bootarg_state(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  *a1 = 0LL;
  uint64_t result = __sandbox_ms();
  if ((_DWORD)result) {
    return *__error();
  }
  *a1 = 0LL;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(_BYTE *a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22LL;
  }
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!(_DWORD)result) {
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(_BYTE *a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22LL;
  }
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!(_DWORD)result) {
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  char v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL)) {
    return 22LL;
  }
  else {
    return __sandbox_ms();
  }
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  else {
    return 22LL;
  }
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (int *)a4;
  v7[128] = *MEMORY[0x1895FEE08];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      int v6 = 5;
      if (!v4) {
        uint64_t v4 = &v6;
      }
    }

    else if (a4)
    {
      uint64_t result = 0LL;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }

  else if (a4)
  {
    uint64_t result = 0LL;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }

  return 0LL;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

void *CESizeSerialization(void *result, unint64_t a2, uint64_t *a3)
{
  *a3 = 0LL;
  uint64_t v10 = 0LL;
  if (a2 <= 1 || *result != 7LL) {
    return &unk_18962B7F0;
  }
  unint64_t v3 = (unint64_t)&result[4 * a2];
  uint64_t v4 = (void *)(v3 - 32);
  if (v3 >= 0x20 && v4 >= result)
  {
    if (*v4 == 8LL)
    {
      unsigned int v8 = result + 4;
      unint64_t v9 = &result[4 * a2];
      int v6 = (void *)der_size_dictionary((uint64_t)result, (uint64_t)&v8, &v10);
      if (v6 == &Errors)
      {
        if (v8 == v9)
        {
          uint64_t v7 = ccder_sizeof(2LL, 1uLL);
          *a3 = ccder_sizeof(0x6000000000000010LL, v10 + v7);
        }

        else
        {
          return &unk_18962B810;
        }
      }

      return v6;
    }

    return &unk_18962B7F0;
  }

  __break(0x5519u);
  return result;
}

uint64_t CESerializeWithOptions( uint64_t result, _BYTE *a2, unint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  uint64_t v31 = result;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  if (a5 <= a6)
  {
    uint64_t v36 = a5;
    uint64_t v37 = a6;
    rsize_t __n = a6 - a5;
    if (a6 > a5)
    {
      unint64_t v11 = a3 + 32 * a4;
      int16x8_t v12 = (void *)(v11 - 32);
      uint64_t v13 = a4;
      while (2)
      {
        if ((--v13 & 0x8000000000000000LL) == 0)
        {
          if ((unint64_t)(v12 + 4) <= v11 && (unint64_t)v12 >= a3)
          {
            int v14 = 4;
            switch(*v12)
            {
              case 1LL:
                __int128 v33 = 0LL;
                unint64_t v34 = 0LL;
                uint64_t result = ccder_blob_reserve_tl((uint64_t *)&v36, 1uLL, v12[2], &v33);
                if ((result & 1) == 0 || (unint64_t)v33 >= v34)
                {
                  int v6 = &unk_18962B7F0;
                  int v14 = 1;
                  goto LABEL_6;
                }

                if (v12[1]) {
                  char v17 = -1;
                }
                else {
                  char v17 = 0;
                }
                char *v33 = v17;
                goto LABEL_5;
              case 2LL:
              case 3LL:
                __int128 v16 = (char *)v12[1];
                unint64_t v15 = v12[2];
                if (&v16[v15] < v16) {
                  goto LABEL_50;
                }
                uint64_t result = ccder_blob_encode_body_tl((uint64_t *)&v36, 0xCuLL, v15, v16);
                if ((result & 1) == 0) {
                  return (uint64_t)&unk_18962B7F0;
                }
                goto LABEL_5;
              case 4LL:
                uint64_t result = der_encode_number((uint64_t *)&v36, v12[1]);
                if ((result & 1) != 0) {
                  goto LABEL_5;
                }
                return (uint64_t)&unk_18962B7F0;
              case 5LL:
                unint64_t v18 = v12[2];
                unint64_t v19 = 0x2000000000000010LL;
                goto LABEL_23;
              case 7LL:
                unint64_t v18 = v12[2];
                unint64_t v19 = 0xA000000000000010LL;
LABEL_23:
                uint64_t result = ccder_blob_encode_tl((uint64_t *)&v36, v19, v18);
                if ((result & 1) == 0) {
                  return (uint64_t)&unk_18962B7F0;
                }
LABEL_5:
                int v14 = 4;
                goto LABEL_6;
              case 9LL:
                uint64_t v21 = (char *)v12[1];
                unint64_t v20 = v12[2];
                if (&v21[v20] < v21) {
                  goto LABEL_50;
                }
                int v14 = 4;
                uint64_t result = ccder_blob_encode_body_tl((uint64_t *)&v36, 4uLL, v20, v21);
                if ((result & 1) != 0) {
                  goto LABEL_6;
                }
                return (uint64_t)&unk_18962B7F0;
              default:
LABEL_6:
                v12 -= 4;
                if (v14 == 4) {
                  continue;
                }
                return (uint64_t)v6;
            }
          }

          goto LABEL_50;
        }

        break;
      }
    }

    __int128 v33 = 0LL;
    unint64_t v34 = 0LL;
    uint64_t result = ccder_blob_reserve_tl((uint64_t *)&v36, 2uLL, 1uLL, &v33);
    if ((result & 1) == 0) {
      return (uint64_t)&unk_18962B810;
    }
    __int128 v22 = v33;
    unint64_t v23 = v34;
    if ((char *)v34 != v33)
    {
      __int128 v24 = (char *)(v34 - 1);
      if (v34) {
        BOOL v25 = v24 >= v33;
      }
      else {
        BOOL v25 = 0;
      }
      if (!v25) {
        goto LABEL_50;
      }
      *__int128 v24 = 1;
      if (v24 != v33)
      {
        __int128 v26 = (char *)(v23 - 2);
        while ((unint64_t)v26 < v23 && v26 >= v22)
        {
          *__int128 v26 = 0;
          if (v26-- == v33) {
            goto LABEL_43;
          }
        }

        goto LABEL_50;
      }
    }

LABEL_50:
  __break(0x5519u);
  return result;
}

unint64_t der_vm_execute_nocopy@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = result;
  uint64_t v135 = *MEMORY[0x1895FEE08];
  if (!*(_BYTE *)(result + 33))
  {
LABEL_6:
    __int128 v10 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v3;
    *(_OWORD *)(a3 + 16) = v10;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v3 + 32);
    uint64_t v11 = *(void *)(v3 + 48);
LABEL_7:
    *(void *)(a3 + 48) = v11;
    return result;
  }

  unint64_t v6 = *(void *)result;
  unint64_t v7 = *(void *)result + 64LL;
  uint64_t v8 = *(void *)a2;
  switch(*(void *)a2 & 0xBFFFFFFFFFFFFFFFLL)
  {
    case 0uLL:
      unint64_t v9 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v9) {
        goto LABEL_6;
      }
      if (v6 >= v7) {
        goto LABEL_317;
      }
      uint64_t result = v9(v6, "[%s]: %s\n", "der_vm_execute_nocopy", "noop");
      goto LABEL_6;
    case 1uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v33 = *(_OWORD *)(result + 16);
      __int128 v131 = *(_OWORD *)result;
      __int128 v132 = v33;
      LOBYTE(v133) = *(_BYTE *)(result + 32);
      *(_OWORD *)v130 = *(_OWORD *)(result + 34);
      *(void *)&v130[14] = *(void *)(result + 48);
      *((void *)&v131 + 1) = 0LL;
      *(void *)&__int128 v132 = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        __s1 = *(void **)(a2 + 8);
        unint64_t v34 = (size_t *)(a2 + 16);
      }

      else
      {
        __s1 = (void *)(a2 + 8);
        unint64_t v34 = (size_t *)(a2 + 248);
      }

      size_t v60 = *v34;
      uint64_t v61 = *(void *)(result + 16);
      if (v61)
      {
        unint64_t v6 = 0LL;
        __int128 v62 = *(_OWORD *)(result + 32);
        *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
        *(_OWORD *)(a3 + 32) = v62;
        *(_OWORD *)a3 = *(_OWORD *)result;
        uint64_t v63 = *(void *)(result + 40);
        *(void *)(a3 + 48) = *(void *)(result + 48);
        *(_BYTE *)(a3 + 33) = 0;
        unint64_t v64 = v61 - 1;
        *(void *)(a3 + 8) = 0LL;
        *(void *)(a3 + 16) = 0LL;
        if (__s1) {
          BOOL v65 = v60 == 0;
        }
        else {
          BOOL v65 = 1;
        }
        char v66 = v65;
        uint64_t v122 = *(void *)(result + 8);
        uint64_t v123 = v63;
        while (1)
        {
          unint64_t v67 = (v6 + v64) >> 1;
          if ((v66 & 1) != 0) {
            goto LABEL_325;
          }
          unint64_t v68 = *(void *)(v122 + 8 * v67);
          unint64_t v69 = (const void *)(v123 + v68);
          if (!v69) {
            goto LABEL_86;
          }
          if (v60 >= HIDWORD(v68)) {
            size_t v70 = HIDWORD(v68);
          }
          else {
            size_t v70 = v60;
          }
          if (v60 < HIDWORD(v68)) {
            int v71 = -1;
          }
          else {
            int v71 = 1;
          }
          uint64_t result = memcmp(__s1, v69, v70);
          if (v60 != HIDWORD(v68) && (_DWORD)result == 0) {
            int v73 = v71;
          }
          else {
            int v73 = result;
          }
          if (!v73)
          {
            *(_BYTE *)(a3 + 33) = 1;
            unint64_t v107 = *(void *)(a3 + 40);
            unint64_t v108 = v107 + (HIDWORD(v68) + v68);
            if (v108 <= *(void *)(a3 + 48) && v107 <= v108)
            {
              *(void *)(a3 + 40) = v108;
              return result;
            }

            while (1)
            {
              do
              {
LABEL_317:
                __break(0x5519u);
LABEL_318:
                v121 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
                if (v121) {
                  v121(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
                }
              }

              while (v6 && v6 >= v6 + 64);
              (*(void (**)(unint64_t, const char *, ...))(v6 + 32))( v6,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
LABEL_316:
              v129[0] = 0LL;
              v129[1] = 0LL;
            }
          }

          if (v73 < 0)
          {
LABEL_325:
            if (v6 + v64 < 2) {
              return result;
            }
            unint64_t v64 = v67 - 1;
            if (v6 > v67 - 1) {
              return result;
            }
          }

          else
          {
LABEL_86:
            unint64_t v6 = v67 + 1;
            if (v67 + 1 > v64) {
              return result;
            }
          }
        }
      }

      v129[0] = 0LL;
      v129[1] = 0LL;
      __int128 v128 = *(_OWORD *)(result + 40);
      uint64_t result = der_decode_next(v6, 0LL, 0LL, (unsigned __int8 **)v129, (uint64_t)&v128);
      if ((result & 1) != 0)
      {
        if (v60)
        {
          if (v129[0] < v129[1])
          {
            if (v6 && v6 >= v7) {
              goto LABEL_317;
            }
            while (1)
            {
              __s2 = 0LL;
              size_t v127 = 0LL;
              __int128 v125 = 0uLL;
              uint64_t result = der_decode_key_value(v6, &__s2, &v125, (unsigned __int8 **)v129);
              if (!(_DWORD)result) {
                break;
              }
              if (__s1 && __s2)
              {
                size_t v82 = v127;
                size_t v83 = v60 >= v127 ? v127 : v60;
                uint64_t result = memcmp(__s1, __s2, v83);
                if (!(_DWORD)result && v60 == v82)
                {
                  *(_OWORD *)&v130[6] = v125;
                  LOBYTE(v85) = 1;
                  goto LABEL_294;
                }
              }

              if (v129[0] >= v129[1]) {
                goto LABEL_254;
              }
            }

            __int128 v85 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
            if (v85)
            {
              uint64_t result = v85(v6, "[%s]: %s\n", "der_vm_execute_select_key", "invalid dictionary element");
              LOBYTE(v85) = 0;
            }

LABEL_294:
            __int128 v116 = v132;
            *(_OWORD *)a3 = v131;
            *(_OWORD *)(a3 + 16) = v116;
            *(_BYTE *)(a3 + 32) = v133;
            *(_BYTE *)(a3 + 33) = (_BYTE)v85;
            goto LABEL_255;
          }

LABEL_254:
          __int128 v110 = v132;
          *(_OWORD *)a3 = v131;
          *(_OWORD *)(a3 + 16) = v110;
          *(_BYTE *)(a3 + 32) = v133;
          *(_BYTE *)(a3 + 33) = 0;
LABEL_255:
          *(_OWORD *)(a3 + 34) = *(_OWORD *)v130;
          uint64_t v11 = *(void *)&v130[14];
          goto LABEL_7;
        }

        unint64_t v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102) {
          goto LABEL_254;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v103 = "key length is invalid";
      }

      else
      {
        unint64_t v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102) {
          goto LABEL_254;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v103 = "dictionary decoding failure";
      }

      uint64_t result = v102(v6, "[%s]: %s\n", "der_vm_execute_select_key", v103);
      goto LABEL_254;
    case 2uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v19 = *(_OWORD *)(result + 32);
      __int128 v20 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v19;
      *(_OWORD *)a3 = v20;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      uint64_t v21 = *(void *)(a2 + 8);
      __int128 v131 = 0uLL;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      uint64_t result = der_decode_next(v6, 0LL, 0LL, (unsigned __int8 **)&v131, (uint64_t)v130);
      if (!(_DWORD)result)
      {
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        unint64_t v55 = "array decoding failure";
        goto LABEL_229;
      }

      BOOL v22 = (unint64_t)v131 < *((void *)&v131 + 1);
      if ((unint64_t)v131 < *((void *)&v131 + 1) && v21 >= 1)
      {
        while (1)
        {
          uint64_t result = der_decode_next(v6, 0LL, 0LL, 0LL, (uint64_t)&v131);
          if ((result & 1) == 0) {
            break;
          }
          uint64_t v23 = v21 - 1;
          BOOL v22 = (unint64_t)v131 < *((void *)&v131 + 1);
        }

        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        unint64_t v55 = "encountered invalid element in an array";
LABEL_229:
        uint64_t v56 = "der_vm_execute_select_index";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }

      uint64_t v23 = v21;
LABEL_148:
      if (v22 && v23 == 0)
      {
        if (!v6 || v6 < v7)
        {
          uint64_t result = der_decode_next(v6, 0LL, (unsigned __int8 **)(a3 + 40), 0LL, (uint64_t)&v131);
          *(_BYTE *)(a3 + 33) = result;
          return result;
        }

        goto LABEL_317;
      }

      return result;
    case 3uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      return der_vm_execute_match_string(a3, (__int128 *)result, a2);
    case 4uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v25 = *(_OWORD *)(result + 32);
      __int128 v26 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v25;
      *(_OWORD *)a3 = v26;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        unint64_t v27 = *(void *)(a2 + 8);
        uint64_t v28 = (size_t *)(a2 + 16);
      }

      else
      {
        unint64_t v27 = a2 + 8;
        uint64_t v28 = (size_t *)(a2 + 248);
      }

      size_t v57 = *v28;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      __int128 v131 = 0uLL;
      uint64_t result = ccder_blob_decode_range((unsigned __int8 **)v130, 12LL, (unsigned __int8 **)&v131);
      if ((result & 1) != 0)
      {
        if (!v57) {
          goto LABEL_308;
        }
        uint64_t v58 = (const void *)v131;
        if (v57 > *((void *)&v131 + 1) - (void)v131)
        {
LABEL_63:
          *(_BYTE *)(a3 + 33) = 0;
          return result;
        }

        uint64_t result = v27;
        size_t v104 = v57;
        goto LABEL_224;
      }

      size_t v59 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v59) {
        return result;
      }
      uint64_t result = v59(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      if (v6 && v6 >= v7) {
        goto LABEL_317;
      }
      unint64_t v55 = "string decode failure";
      uint64_t v56 = "der_vm_execute_match_string_prefix";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 5uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v35 = *(_OWORD *)(result + 32);
      __int128 v36 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v35;
      *(_OWORD *)a3 = v36;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      __int128 v131 = 0uLL;
      uint64_t result = ccder_blob_decode_range((unsigned __int8 **)v130, 1LL, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
      {
        unint64_t v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v74) {
          goto LABEL_187;
        }
        size_t v75 = "Unknown BOOLean encoding";
        goto LABEL_186;
      }

      if (*((void *)&v131 + 1) - (void)v131 == 1LL)
      {
        BOOL v18 = *(void *)(a2 + 8) == (*(_BYTE *)v131 != 0);
        goto LABEL_235;
      }

      unint64_t v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v74)
      {
        size_t v75 = "BOOLean should be exactly 1 byte";
LABEL_186:
        uint64_t result = v74(v6, "[%s]: %s\n", "der_decode_BOOLean", v75);
      }

LABEL_187:
      double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      if (v6 && v6 >= v7) {
        goto LABEL_317;
      }
      unint64_t v55 = "BOOL decode failure";
      uint64_t v56 = "der_vm_execute_match_BOOL";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 6uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v37 = *(_OWORD *)(result + 32);
      __int128 v38 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v37;
      *(_OWORD *)a3 = v38;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        uint64_t v39 = *(const void **)(a2 + 8);
        uint64_t v40 = (size_t *)(a2 + 16);
      }

      else
      {
        uint64_t v39 = (const void *)(a2 + 8);
        uint64_t v40 = (size_t *)(a2 + 248);
      }

      size_t v76 = *v40;
      uint64_t v77 = *(void *)(result + 24);
      __int128 v78 = *(_OWORD *)(result + 40);
      *(void *)v130 = 0LL;
      __int128 v131 = v78;
      uint64_t result = der_decode_next(v6, v130, 0LL, 0LL, (uint64_t)&v131);
      if (!(_DWORD)result || v77 == *(void *)v130) {
        goto LABEL_112;
      }
      if (*(void *)v130 != 12LL)
      {
        if (*(void *)v130 == 0x2000000000000010LL || *(void *)v130 == 0x6000000000000010LL)
        {
          *(void *)v130 = a3;
          *(void *)&v130[8] = a2;
          __int128 v99 = *(_OWORD *)(v3 + 16);
          __int128 v131 = *(_OWORD *)v3;
          __int128 v132 = v99;
          __int128 v133 = *(_OWORD *)(v3 + 32);
          uint64_t v134 = *(void *)(v3 + 48);
          v100 = string_value_allowed_iterate;
          return der_vm_iterate((unint64_t)&v131, (uint64_t)v130, (uint64_t)v100);
        }

LABEL_112:
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7) {
            goto LABEL_317;
          }
          unint64_t v55 = "Unexpected type to match against";
          uint64_t v56 = "der_vm_execute_string_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }

        return result;
      }

      uint64_t result = der_vm_execute_match_string((uint64_t)&v131, (__int128 *)v3, a2);
      if (BYTE1(v133)) {
        goto LABEL_308;
      }
      unint64_t v6 = *(void *)v3;
      *(_OWORD *)v129 = *(_OWORD *)(v3 + 40);
      *(_OWORD *)v130 = 0uLL;
      uint64_t result = *(void *)v130;
      if (*(void *)&v130[8] == *(void *)v130) {
        return result;
      }
      v111 = (_BYTE *)(*(void *)&v130[8] - 1LL);
      if (*v111 != 42) {
        return result;
      }
      size_t v104 = ~*(void *)v130 + *(void *)&v130[8];
      if (!v104) {
        goto LABEL_308;
      }
      if (v104 > v76) {
        goto LABEL_63;
      }
      uint64_t v58 = v39;
      goto LABEL_224;
    case 7uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v41 = *(_OWORD *)(result + 32);
      __int128 v42 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v41;
      *(_OWORD *)a3 = v42;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      __int128 v131 = 0uLL;
      uint64_t result = ccder_blob_decode_range((unsigned __int8 **)v130, 2LL, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
      {
        uint64_t v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v43) {
          goto LABEL_118;
        }
        uint64_t v44 = "unknown number encoding";
        goto LABEL_117;
      }

      if (*((void *)&v131 + 1) - (void)v131 < 9uLL)
      {
        if ((unint64_t)v131 >= *((void *)&v131 + 1))
        {
          uint64_t v95 = 0LL;
        }

        else
        {
          uint64_t v94 = 0LL;
          uint64_t v95 = 0LL;
          do
          {
            v96 = (unsigned __int8 *)(v131 + v94);
            if ((unint64_t)(v131 + v94) >= *((void *)&v131 + 1)
              || (unint64_t)v96 < (unint64_t)v131)
            {
              goto LABEL_317;
            }

            uint64_t v95 = *v96 | (unint64_t)(v95 << 8);
            ++v94;
          }

          while (*((void *)&v131 + 1) - (void)v131 != v94);
        }

        BOOL v18 = v95 == *(void *)(a2 + 8);
        goto LABEL_235;
      }

      uint64_t v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v43)
      {
        uint64_t v44 = "number too large";
LABEL_117:
        uint64_t result = v43(v6, "[%s]: %s\n", "der_decode_number", v44);
      }

LABEL_118:
      double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      if (v6 && v6 >= v7) {
        goto LABEL_317;
      }
LABEL_121:
      unint64_t v55 = "BOOL decode failure";
      uint64_t v56 = "der_vm_execute_match_integer";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 8uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v45 = *(_OWORD *)(result + 32);
      __int128 v46 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v45;
      *(_OWORD *)a3 = v46;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      double v47 = (const void *)(a2 + 8);
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        unint64_t v49 = *(void *)(a2 + 8);
        uint64_t v48 = (size_t *)(a2 + 16);
      }

      else
      {
        uint64_t v48 = (size_t *)(a2 + 248);
        unint64_t v49 = a2 + 8;
      }

      size_t v79 = *v48;
      uint64_t v80 = *(void *)(result + 24);
      __int128 v81 = *(_OWORD *)(result + 40);
      *(void *)v130 = 0LL;
      __int128 v131 = v81;
      uint64_t result = der_decode_next(v6, v130, 0LL, 0LL, (uint64_t)&v131);
      if (!(_DWORD)result || v80 == *(void *)v130) {
        goto LABEL_125;
      }
      if (*(void *)v130 != 12LL)
      {
        if (*(void *)v130 == 0x2000000000000010LL || *(void *)v130 == 0x6000000000000010LL)
        {
          *(void *)v130 = a3;
          *(void *)&v130[8] = a2;
          __int128 v101 = *(_OWORD *)(v3 + 16);
          __int128 v131 = *(_OWORD *)v3;
          __int128 v132 = v101;
          __int128 v133 = *(_OWORD *)(v3 + 32);
          uint64_t v134 = *(void *)(v3 + 48);
          v100 = string_prefix_allowed_iterate;
          return der_vm_iterate((unint64_t)&v131, (uint64_t)v130, (uint64_t)v100);
        }

LABEL_125:
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7) {
            goto LABEL_317;
          }
          unint64_t v55 = "Unexpected type to match against";
          uint64_t v56 = "der_vm_execute_string_prefix_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }

        return result;
      }

      if ((*(_BYTE *)(a2 + 7) & 0x40) != 0)
      {
        double v47 = *(const void **)(a2 + 8);
        size_t v112 = (size_t *)(a2 + 16);
      }

      else
      {
        size_t v112 = (size_t *)(a2 + 248);
      }

      unint64_t v6 = *(void *)v3;
      size_t v113 = *v112;
      *(_OWORD *)v130 = *(_OWORD *)(v3 + 40);
      __int128 v131 = 0uLL;
      uint64_t result = ccder_blob_decode_range((unsigned __int8 **)v130, 12LL, (unsigned __int8 **)&v131);
      if ((result & 1) != 0)
      {
        if (!v113) {
          goto LABEL_308;
        }
        if (v113 <= *((void *)&v131 + 1) - (void)v131)
        {
          uint64_t result = memcmp(v47, (const void *)v131, v113);
          if (!(_DWORD)result) {
            goto LABEL_308;
          }
        }
      }

      else
      {
        __int128 v114 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v114)
        {
          v114(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
          __int128 v115 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
          if (v115)
          {
            if (v6 && v6 >= v6 + 64) {
              goto LABEL_317;
            }
            v115(v6, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
          }
        }
      }

      unint64_t v6 = *(void *)v3;
      *(_OWORD *)v130 = *(_OWORD *)(v3 + 40);
      __int128 v131 = 0uLL;
      uint64_t result = ccder_blob_decode_range((unsigned __int8 **)v130, 12LL, (unsigned __int8 **)&v131);
      if ((result & 1) == 0) {
        goto LABEL_318;
      }
      if (v79)
      {
        uint64_t v58 = (const void *)v131;
        if (v79 > *((void *)&v131 + 1) - (void)v131) {
          goto LABEL_63;
        }
        uint64_t result = v49;
        size_t v104 = v79;
LABEL_224:
        uint64_t result = memcmp((const void *)result, v58, v104);
        BOOL v18 = (_DWORD)result == 0;
LABEL_235:
        char v105 = v18;
        goto LABEL_309;
      }

      goto LABEL_308;
    case 9uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v29 = *(_OWORD *)(result + 32);
      __int128 v30 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v29;
      *(_OWORD *)a3 = v30;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      __int128 v131 = 0uLL;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      uint64_t result = der_decode_next(v6, 0LL, 0LL, (unsigned __int8 **)&v131, (uint64_t)v130);
      if ((result & 1) == 0)
      {
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        unint64_t v55 = "dictionary decoding failure";
        goto LABEL_247;
      }

      if ((*(_BYTE *)(a2 + 7) & 0x40) != 0)
      {
        uint64_t v31 = *(const void **)(a2 + 8);
        __int128 v32 = (void **)(a2 + 16);
      }

      else
      {
        uint64_t v31 = (const void *)(a2 + 8);
        __int128 v32 = (void **)(a2 + 248);
      }

      __int128 v87 = (char *)*v32;
      if (!*v32)
      {
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        unint64_t v55 = "key length is invalid";
        goto LABEL_247;
      }

      if (v6 && v6 >= v7) {
        goto LABEL_316;
      }
      while (2)
      {
        v129[0] = 0LL;
        v129[1] = 0LL;
        __int128 v128 = 0uLL;
        uint64_t result = der_decode_key_value(v6, v129, &v128, (unsigned __int8 **)&v131);
        if ((_DWORD)result)
        {
          __int128 v88 = (char *)v129[1];
          if (v129[1])
          {
            __int128 v89 = v129[0];
            __int128 v90 = (char *)v129[1] - 1;
            uint64_t v91 = (char *)v129[0] + (unint64_t)v129[1] - 1;
            if (*v91 == 42)
            {
              if (v129[1] == (void *)1 || v90 <= v87 && (uint64_t result = memcmp(v129[0], v31, (size_t)v90), !(_DWORD)result))
              {
LABEL_162:
                *(_BYTE *)(a3 + 33) = 1;
                *(_OWORD *)(a3 + 40) = v128;
              }

LABEL_163:
              continue;
            }
          }

          else
          {
            __int128 v89 = v129[0];
          }

          if (v31 && v89)
          {
            v93 = v87 >= v129[1] ? v129[1] : v87;
            uint64_t result = memcmp(v31, v89, (size_t)v93);
            if (v87 == v88 && !(_DWORD)result) {
              goto LABEL_162;
            }
          }

          goto LABEL_163;
        }

        break;
      }

      double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      unint64_t v55 = "invalid dictionary element";
LABEL_247:
      uint64_t v56 = "der_vm_execute_select_longest_matching_key";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 0xAuLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v50 = *(_OWORD *)(result + 32);
      __int128 v51 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v50;
      *(_OWORD *)a3 = v51;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      uint64_t v52 = *(void *)(result + 24);
      __int128 v53 = *(_OWORD *)(result + 40);
      *(void *)v130 = 0LL;
      __int128 v131 = v53;
      uint64_t result = der_decode_next(v6, v130, 0LL, 0LL, (uint64_t)&v131);
      if (!(_DWORD)result || v52 == *(void *)v130) {
        goto LABEL_56;
      }
      if (*(void *)v130 == 0x6000000000000010LL || *(void *)v130 == 0x2000000000000010LL)
      {
        *(void *)v130 = a3;
        *(void *)&v130[8] = a2;
        __int128 v106 = *(_OWORD *)(v3 + 16);
        __int128 v131 = *(_OWORD *)v3;
        __int128 v132 = v106;
        __int128 v133 = *(_OWORD *)(v3 + 32);
        uint64_t v134 = *(void *)(v3 + 48);
        v100 = integer_allowed_iterate;
        return der_vm_iterate((unint64_t)&v131, (uint64_t)v130, (uint64_t)v100);
      }

      if (*(void *)v130 != 2LL)
      {
LABEL_56:
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 >= v7) {
          goto LABEL_317;
        }
        unint64_t v55 = "Unexpected type to match against";
        uint64_t v56 = "der_vm_execute_integer_value_allowed";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }

      unint64_t v6 = *(void *)v3;
      *(_OWORD *)v130 = *(_OWORD *)(v3 + 40);
      __int128 v131 = 0uLL;
      uint64_t result = ccder_blob_decode_range((unsigned __int8 **)v130, 2LL, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "unknown number encoding";
          goto LABEL_272;
        }

LABEL_273:
        double v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v6 + 64) {
          goto LABEL_317;
        }
        goto LABEL_121;
      }

      if (*((void *)&v131 + 1) - (void)v131 >= 9uLL)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "number too large";
LABEL_272:
          uint64_t result = v97(v6, "[%s]: %s\n", "der_decode_number", v98);
          goto LABEL_273;
        }

        goto LABEL_273;
      }

      if ((unint64_t)v131 >= *((void *)&v131 + 1))
      {
        uint64_t v118 = 0LL;
      }

      else
      {
        uint64_t v117 = 0LL;
        uint64_t v118 = 0LL;
        do
        {
          v119 = (unsigned __int8 *)(v131 + v117);
          if ((unint64_t)(v131 + v117) >= *((void *)&v131 + 1)
            || (unint64_t)v119 < (unint64_t)v131)
          {
            goto LABEL_317;
          }

          uint64_t v118 = *v119 | (unint64_t)(v118 << 8);
          ++v117;
        }

        while (*((void *)&v131 + 1) - (void)v131 != v117);
      }

      if (v118 != *(void *)(a2 + 8)) {
        return result;
      }
LABEL_308:
      char v105 = 1;
LABEL_309:
      *(_BYTE *)(a3 + 33) = v105;
      return result;
    case 0xBuLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v12 = *(_OWORD *)(result + 32);
      __int128 v13 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v12;
      *(_OWORD *)a3 = v13;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      uint64_t v14 = *(void *)(a2 + 8);
      uint64_t v15 = *(void *)(result + 24);
      __int128 v16 = *(_OWORD *)(result + 40);
      *(void *)v130 = 0LL;
      __int128 v131 = v16;
      uint64_t result = der_decode_next(v6, v130, 0LL, 0LL, (uint64_t)&v131);
      if (!(_DWORD)result) {
        return result;
      }
      if (v15 == *(void *)v130)
      {
        int v17 = 1;
LABEL_13:
        BOOL v18 = v17 == (_DWORD)v14;
        goto LABEL_235;
      }

      if (*(uint64_t *)v130 > 0x200000000000000FLL)
      {
        if (*(void *)v130 == 0x6000000000000010LL || *(void *)v130 == 0x2000000000000010LL)
        {
          int v17 = 2;
          goto LABEL_13;
        }
      }

      else
      {
        int v17 = 5;
        switch(*(void *)v130)
        {
          case 1LL:
            goto LABEL_13;
          case 2LL:
            int v17 = 3;
            goto LABEL_13;
          case 4LL:
            int v17 = 6;
            goto LABEL_13;
          case 0xCLL:
            int v17 = 4;
            goto LABEL_13;
          default:
            return result;
        }
      }

      return result;
    default:
      if (v6) {
        BOOL v120 = v6 >= v7;
      }
      else {
        BOOL v120 = 0;
      }
      if (v120) {
        goto LABEL_317;
      }
      (*(void (**)(unint64_t, const char *, ...))(v6 + 32))( v6,  "[%s]: %s\n",  "der_vm_execute_nocopy",  "unhandled opcode");
      goto LABEL_316;
  }

unint64_t der_vm_execute@<X0>( unint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a2 && a2 + 256 < a2)
  {
    __break(0x5519u);
  }

  else
  {
    __int128 v3 = *(_OWORD *)(result + 16);
    v4[0] = *(_OWORD *)result;
    v4[1] = v3;
    void v4[2] = *(_OWORD *)(result + 32);
    uint64_t v5 = *(void *)(result + 48);
    return der_vm_execute_nocopy((unint64_t)v4, a2, a3);
  }

  return result;
}

uint64_t der_vm_context_is_valid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t der_vm_CEType_from_context(uint64_t a1, uint64_t *a2)
{
  uint64_t v8 = 0LL;
  if (!*(_BYTE *)(a1 + 33)) {
    return 0LL;
  }
  uint64_t v4 = *(void *)a1;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  uint64_t result = der_decode_next(v4, &v8, 0LL, 0LL, (uint64_t)&v7);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v6 = v8;
  if (a2) {
    *a2 = v8;
  }
  if (*(void *)(a1 + 24) == v6) {
    return 1LL;
  }
  if (v6 > 0x200000000000000FLL)
  {
    if (v6 == 0x6000000000000010LL || v6 == 0x2000000000000010LL) {
      return 2LL;
    }
    return 0LL;
  }

  uint64_t result = 5LL;
  switch(v6)
  {
    case 1LL:
      return result;
    case 2LL:
      uint64_t result = 3LL;
      break;
    case 3LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
      return 0LL;
    case 4LL:
      uint64_t result = 6LL;
      break;
    case 12LL:
      uint64_t result = 4LL;
      break;
    default:
      return v6 == 0xA000000000000010LL;
  }

  return result;
}

unint64_t der_vm_iterate(unint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = result;
  if (result && result + 56 < result) {
    goto LABEL_41;
  }
  v13[0] = MEMORY[0x1895FED80];
  v13[1] = 0x40000000LL;
  uint64_t v14 = __der_vm_iterate_block_invoke;
  uint64_t v15 = &__block_descriptor_tmp_17;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  if (!*(_BYTE *)(result + 33)) {
    return (unint64_t)&unk_18962B7F0;
  }
  unint64_t v4 = *(void *)result;
  unint64_t v5 = *(void *)result + 64LL;
  unint64_t v29 = 0LL;
  v30[0] = 0LL;
  uint64_t v28 = 0LL;
  __int128 v27 = *(_OWORD *)(result + 40);
  uint64_t result = der_decode_next(v4, v30, 0LL, &v28, (uint64_t)&v27);
  if ((result & 1) != 0)
  {
    if (*(void *)(v3 + 24) == v30[0])
    {
LABEL_6:
      int v6 = 1;
      goto LABEL_14;
    }

    int v6 = 2;
    if (v30[0] != 0x6000000000000010LL && v30[0] != 0x2000000000000010LL)
    {
      if (v30[0] == 0xA000000000000010LL) {
        goto LABEL_6;
      }
      __int128 v12 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
      if (!v12) {
        return (unint64_t)&unk_18962B7F0;
      }
      if (!v4 || v4 < v5)
      {
        v12(v4, "[%s]: %s\n", "der_vm_iterate_b", "iteration over a non-iterable type");
        return (unint64_t)&unk_18962B7F0;
      }

      goto LABEL_41;
    }

    while (1)
    {
LABEL_14:
      __int128 v10 = *(_OWORD *)(v3 + 16);
      __int128 v11 = *(_OWORD *)(v3 + 32);
      v18[0] = *(_OWORD *)v3;
      v18[1] = v10;
      v18[2] = v11;
      uint64_t v19 = *(void *)(v3 + 48);
      __int128 v20 = v18[0];
      __int128 v21 = v10;
      __int128 v22 = v11;
      uint64_t v23 = v19;
      int v24 = v6;
      int v25 = 0;
      uint64_t v26 = 0LL;
      uint64_t result = der_decode_next(*(void *)v3, v30, (unsigned __int8 **)&v22 + 1, 0LL, (uint64_t)&v28);
      if ((result & 1) == 0) {
        break;
      }
      if (*((void *)&v21 + 1) == v30[0])
      {
        int v9 = 1;
      }

      else if (v30[0] > 0x200000000000000FLL)
      {
        if (v30[0] == 0x6000000000000010LL || v30[0] == 0x2000000000000010LL) {
          int v9 = 2;
        }
        else {
LABEL_23:
        }
          int v9 = 0;
      }

      else
      {
        int v9 = 5;
        switch(v30[0])
        {
          case 1LL:
            break;
          case 2LL:
            int v9 = 3;
            break;
          case 4LL:
            int v9 = 6;
            break;
          case 0xCLL:
            int v9 = 4;
            break;
          default:
            goto LABEL_23;
        }
      }

      int v25 = v9;
    }

    __int128 v7 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
    if (v7)
    {
      if (!v4 || v4 < v5)
      {
        uint64_t v8 = "encountered invalid element in an iterable";
        goto LABEL_39;
      }

      goto LABEL_41;
    }

    return (unint64_t)&unk_18962B810;
  }

  __int128 v7 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
  if (!v7) {
    return (unint64_t)&unk_18962B810;
  }
  if (!v4 || v4 < v5)
  {
    uint64_t v8 = "iterable decoding failure";
LABEL_39:
    v7(v4, "[%s]: %s\n", "der_vm_iterate_b", v8);
    return (unint64_t)&unk_18962B810;
  }

uint64_t __der_vm_iterate_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 120) = *(void *)(a1 + 32);
  uint64_t v2 = *(uint64_t (**)(_OWORD *))(a1 + 40);
  __int128 v3 = *(_OWORD *)(a2 + 80);
  _OWORD v8[4] = *(_OWORD *)(a2 + 64);
  void v8[5] = v3;
  __int128 v4 = *(_OWORD *)(a2 + 112);
  void v8[6] = *(_OWORD *)(a2 + 96);
  v8[7] = v4;
  __int128 v5 = *(_OWORD *)(a2 + 16);
  v8[0] = *(_OWORD *)a2;
  v8[1] = v5;
  __int128 v6 = *(_OWORD *)(a2 + 48);
  v8[2] = *(_OWORD *)(a2 + 32);
  v8[3] = v6;
  return v2(v8);
}

uint64_t der_vm_integer_from_context(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  __int128 v8 = *(_OWORD *)(a1 + 40);
  int v9 = 0LL;
  unint64_t v10 = 0LL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v8, 2LL, (unsigned __int8 **)&v9) & 1) == 0)
  {
    __int128 v5 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v5)
    {
      __int128 v6 = "unknown number encoding";
LABEL_18:
      v5(v1, "[%s]: %s\n", "der_decode_number", v6);
    }

LABEL_21:
    __break(0x5519u);
LABEL_22:
    uint64_t v7 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_integer_from_context",  "Attempting to select an integer value from a non-integer DER object");
    return (uint64_t)der_vm_string_from_context(v7);
  }

  return 0LL;
}

unsigned __int8 *der_vm_string_from_context(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  __int128 v5 = *(_OWORD *)(a1 + 40);
  v6[0] = 0LL;
  v6[1] = 0LL;
  __int128 v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3) {
    v3(v1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  }
  if (v1)
  {
    if (v1 >= v1 + 64) {
      __break(0x5519u);
    }
  }

  uint64_t v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return (unsigned __int8 *)der_vm_BOOL_from_context(v4);
}

uint64_t der_vm_BOOL_from_context(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = 0LL;
  unint64_t v8 = 0LL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v6, 1LL, &v7) & 1) == 0)
  {
    __int128 v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v3)
    {
      uint64_t v4 = "Unknown BOOLean encoding";
LABEL_9:
      v3(v1, "[%s]: %s\n", "der_decode_BOOLean", v4);
    }

unsigned __int8 *der_vm_data_from_context(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  __int128 v5 = *(_OWORD *)(a1 + 40);
  v6[0] = 0LL;
  v6[1] = 0LL;
  __int128 v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3) {
    v3(v1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
  }
  if (v1)
  {
    if (v1 >= v1 + 64) {
      __break(0x5519u);
    }
  }

  uint64_t v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_data_from_context",  "Attempting to select a data value from a non-data DER object");
  return (unsigned __int8 *)CEValidate(v4);
}

uint64_t CEValidate(uint64_t result, uint64_t *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  char v4 = 0;
  if (a3 <= a4) {
    return CEValidateWithOptions(result, &v4, a2, a3, a4);
  }
  __break(0x5519u);
  return result;
}

uint64_t CEValidateWithOptions( uint64_t result, _BYTE *a2, uint64_t *a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  uint64_t v5 = result;
  if (!a3) {
    goto LABEL_16;
  }
  *a3 = 0LL;
  if (a4 > a5)
  {
LABEL_56:
    __break(0x5519u);
    return result;
  }

  a3[1] = (uint64_t)a4;
  a3[2] = (uint64_t)a5;
  if (a4 && a4 < a5)
  {
    if ((unint64_t)(a5 - a4) >= 5 && (*(_DWORD *)a4 == 1836597052 ? (BOOL v10 = a4[4] == 108) : (BOOL v10 = 0), v10))
    {
      uint64_t v17 = *(void (**)(uint64_t, const char *, ...))(result + 24);
      if (v17) {
        v17(result, "[%s]: %s\n", "CEValidateWithOptions", "xml-looking blob was passed in");
      }
      return 0x18962B7E0LL;
    }

    else
    {
      v23[1] = a5;
      unint64_t v24 = 0LL;
      v22[1] = a5;
      v23[0] = a4;
      v22[0] = a4;
      if (ccder_blob_decode_tl(v22, 0x6000000000000010LL, &v24))
      {
        __int128 v32 = 0uLL;
        if ((ccder_blob_decode_range(v23, 0x6000000000000010LL, (unsigned __int8 **)&v32) & 1) == 0)
        {
          __int128 v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v11)
          {
            __int128 v12 = "entitlements blob does not have CCDER_ENTITLEMENTS coding";
LABEL_25:
            uint64_t v16 = "validate_VNext";
            goto LABEL_34;
          }

          return (uint64_t)&unk_18962B810;
        }

        uint64_t v26 = 0LL;
        unint64_t v27 = 0LL;
        uint64_t result = ccder_blob_decode_range((unsigned __int8 **)&v32, 2LL, (unsigned __int8 **)&v26);
        if ((result & 1) == 0)
        {
          __int128 v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v11)
          {
            __int128 v12 = "unknown number encoding";
            goto LABEL_33;
          }

          return (uint64_t)&unk_18962B810;
        }

        if (v27 - (unint64_t)v26 >= 9)
        {
          __int128 v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v11)
          {
            __int128 v12 = "number too large";
LABEL_33:
            uint64_t v16 = "der_decode_number";
            goto LABEL_34;
          }

          return (uint64_t)&unk_18962B810;
        }

        if ((unint64_t)v26 >= v27)
        {
          uint64_t v19 = 0LL;
LABEL_52:
          __int128 v21 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v21) {
            v21(v5, "[%s]: entitlements blob has unexpected version %lld\n", "validate_VNext", v19);
          }
          return (uint64_t)&unk_18962B810;
        }

        uint64_t v18 = 0LL;
        uint64_t v19 = 0LL;
        while (1)
        {
          if (!v18 && *v26 < 0) {
            uint64_t v19 = -1LL;
          }
          __int128 v20 = (unsigned __int8 *)&v26[v18];
          uint64_t v19 = *v20 | (unint64_t)(v19 << 8);
          if (v27 - (void)v26 == ++v18)
          {
            if (v19 != 1) {
              goto LABEL_52;
            }
            __int128 v30 = 0LL;
            uint64_t v31 = 0LL;
            __int128 v25 = v32;
            if ((ccder_blob_decode_range((unsigned __int8 **)&v25, 0xA000000000000010LL, &v30) & 1) != 0)
            {
              uint64_t v29 = 0LL;
              uint64_t v26 = (char *)v5;
              unint64_t v27 = 0xA000000000000010LL;
              uint64_t v28 = 1LL;
              LOBYTE(v29) = *a2;
              uint64_t v14 = 2LL;
              goto LABEL_22;
            }

            __int128 v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
            if (!v11) {
              return (uint64_t)&unk_18962B810;
            }
            __int128 v12 = "entitlements blob does not have CCDER_ENTITLEMENTS_DICT as the second element";
            goto LABEL_25;
          }
        }
      }

      __int128 v32 = 0uLL;
      __int128 v30 = a4;
      uint64_t v31 = a5;
      if ((ccder_blob_decode_range(&v30, 0x2000000000000011LL, (unsigned __int8 **)&v32) & 1) == 0)
      {
        __int128 v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
        if (v11)
        {
          __int128 v12 = "entitlements blob does not have CCDER_CONSTRUCTED_SET coding";
          uint64_t v16 = "validate_V0";
LABEL_34:
          v11(v5, "[%s]: %s\n", v16, v12);
          return (uint64_t)&unk_18962B810;
        }

        return (uint64_t)&unk_18962B810;
      }

      uint64_t v28 = 0LL;
      uint64_t v29 = 0LL;
      uint64_t v26 = (char *)v5;
      unint64_t v27 = 0x2000000000000011LL;
      LOBYTE(v29) = *a2;
      if (recursivelyValidateEntitlements((uint64_t)&v26, (uint64_t)v23))
      {
        uint64_t v14 = 1LL;
LABEL_22:
        *a3 = v14;
        uint64_t v15 = &kCENoError;
      }

      else
      {
LABEL_48:
        uint64_t v15 = &kCEMalformedEntitlements;
      }

      return (uint64_t)*v15;
    }
  }

  else
  {
LABEL_16:
    __int128 v13 = *(void (**)(uint64_t, const char *, ...))(result + 24);
    if (v13) {
      v13(result, "[%s]: %s\n", "CEValidateWithOptions", "invalid arguments passed in");
    }
    return (uint64_t)&unk_18962B7F0;
  }

uint64_t CEAcquireUnmanagedContext(uint64_t result, void *a2, uint64_t a3)
{
  if (!a3 || !*a2 || !a2[1] || !a2[2])
  {
    unint64_t v8 = &kCEInvalidArgument;
    return (uint64_t)*v8;
  }

  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  unint64_t v5 = a2[1];
  unint64_t v4 = a2[2];
  if (*a2 == 2LL)
  {
    if (v5 <= v4)
    {
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)a3 = result;
      *(_OWORD *)(a3 + 24) = xmmword_180188820;
      *(void *)(a3 + 40) = v5;
      *(void *)(a3 + 48) = v4;
      __int128 v6 = *(_OWORD *)(a3 + 16);
      v9[0] = *(_OWORD *)a3;
      v9[1] = v6;
      v9[2] = *(_OWORD *)(a3 + 32);
      unint64_t v10 = v4;
      der_vm_execute_nocopy((unint64_t)v9, (uint64_t)&_CESelectValueOperation, (uint64_t)v11);
      __int128 v7 = v11[1];
      *(_OWORD *)a3 = v11[0];
      *(_OWORD *)(a3 + 16) = v7;
      *(_OWORD *)(a3 + 32) = v11[2];
      unint64_t v4 = v12;
LABEL_12:
      *(void *)(a3 + 48) = v4;
      unint64_t v8 = &kCENoError;
      return (uint64_t)*v8;
    }
  }

  else if (v5 <= v4)
  {
    *(void *)(a3 + 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = result;
    *(_OWORD *)(a3 + 24) = xmmword_180188810;
    *(void *)(a3 + 40) = v5;
    goto LABEL_12;
  }

  __break(0x5519u);
  return result;
}

uint64_t der_vm_execute_match_string(uint64_t a1, __int128 *a2, uint64_t a3)
{
  unint64_t v4 = *(void *)a2;
  __int128 v5 = a2[2];
  __int128 v6 = *a2;
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v6;
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(_BYTE *)(a1 + 33) = 0;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  if ((*(_BYTE *)(a3 + 7) & 0x40) != 0)
  {
    __int128 v7 = *(const void **)(a3 + 8);
    unint64_t v8 = (size_t *)(a3 + 16);
  }

  else
  {
    __int128 v7 = (const void *)(a3 + 8);
    unint64_t v8 = (size_t *)(a3 + 248);
  }

  size_t v9 = *v8;
  __int128 v19 = *(__int128 *)((char *)a2 + 40);
  __int128 v20 = 0LL;
  __int128 v21 = 0LL;
  uint64_t result = ccder_blob_decode_range((unsigned __int8 **)&v19, 12LL, &v20);
  if ((result & 1) != 0)
  {
    BOOL v11 = 0;
    unint64_t v12 = v20;
    __int128 v13 = v21;
    if (v7 && v9)
    {
      if (v20)
      {
        uint64_t v14 = v21 - v20;
        if (v9 >= v21 - v20) {
          size_t v15 = v21 - v20;
        }
        else {
          size_t v15 = v9;
        }
        uint64_t result = memcmp(v7, v20, v15);
        BOOL v11 = (_DWORD)result == 0;
        if (v9 != v14) {
          BOOL v11 = 0;
        }
      }

      else
      {
        BOOL v11 = 0;
      }
    }

    if (v9) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v13 == v12;
    }
    if (v18) {
      BOOL v11 = 1;
    }
    *(_BYTE *)(a1 + 33) = v11;
  }

  else
  {
    uint64_t v16 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
    if (v16)
    {
      uint64_t result = v16(v4, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      uint64_t v17 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
      if (v17)
      {
        if (v4 && v4 >= v4 + 64) {
          __break(0x5519u);
        }
        else {
          return v17(v4, "[%s]: %s\n", "der_vm_execute_match_string", "string decode failure");
        }
      }
    }
  }

  return result;
}

uint64_t string_value_allowed_iterate(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[15];
  uint64_t v3 = v2[1];
  if ((*(_BYTE *)(v3 + 7) & 0x40) != 0)
  {
    unint64_t v4 = *(const void **)(v3 + 8);
    __int128 v5 = (size_t *)(v3 + 16);
  }

  else
  {
    unint64_t v4 = (const void *)(v3 + 8);
    __int128 v5 = (size_t *)(v3 + 248);
  }

  if (*((_DWORD *)a1 + 29) != 4)
  {
    uint64_t v8 = *a1;
    size_t v9 = *(void (**)(uint64_t, const char *, ...))(*a1 + 24);
    if (v9) {
      v9(v8, "[%s]: %s\n", "string_value_allowed_iterate", "Unexpected type to match against during iteration");
    }
    return 1LL;
  }

  size_t v6 = *v5;
  der_vm_execute_match_string((uint64_t)v17, (__int128 *)(a1 + 7), v3);
  if (v17[33])
  {
    uint64_t result = 0LL;
    *(_BYTE *)(*v2 + 33LL) = 1;
    return result;
  }

  unint64_t v10 = a1[7];
  __int128 v18 = *((_OWORD *)a1 + 6);
  __int128 v19 = 0LL;
  unint64_t v20 = 0LL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v18, 12LL, &v19) & 1) == 0)
  {
    size_t v15 = *(void (**)(unint64_t, const char *, ...))(v10 + 24);
    if (v15) {
      v15(v10, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    }
    if (!v10 || v10 < v10 + 64) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  size_t v11 = v20 - (void)v19 - 1;
  unint64_t v12 = (unsigned __int8 *)(v20 - 1);
  if (v20 - 1 >= v20 || v12 < v19)
  {
LABEL_26:
    __break(0x5519u);
LABEL_27:
    uint64_t v16 = (*(uint64_t (**)(unint64_t, const char *, ...))(v10 + 32))( v10,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
    return string_prefix_allowed_iterate(v16);
  }

  if (*v12 != 42 || v11 > v6) {
    return 1LL;
  }
  int v14 = memcmp(v19, v4, v11);
  uint64_t result = 1LL;
  if (!v14)
  {
    *(_BYTE *)(*v2 + 33LL) = 1;
    return 0LL;
  }

  return result;
}

uint64_t string_prefix_allowed_iterate(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[15];
  uint64_t v4 = v3[1];
  int v5 = *((_DWORD *)a1 + 29);
  if ((*(_BYTE *)(v4 + 7) & 0x40) == 0)
  {
    if (v5 == 4)
    {
      size_t v6 = (const void *)(v4 + 8);
      size_t v7 = *(void *)(v4 + 248);
      goto LABEL_6;
    }

uint64_t integer_allowed_iterate(uint64_t *a1)
{
  if (*((_DWORD *)a1 + 29) != 3)
  {
    uint64_t v7 = *a1;
    unint64_t v8 = *(void (**)(uint64_t, const char *, ...))(v7 + 24);
    if (v8) {
      v8(v7, "[%s]: %s\n", "integer_allowed_iterate", "Unexpected type to match against during iteration");
    }
    return 0LL;
  }

  unint64_t v1 = (void *)a1[15];
  uint64_t v2 = v1[1];
  unint64_t v3 = a1[7];
  __int128 v13 = *((_OWORD *)a1 + 6);
  uint64_t v14 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = ccder_blob_decode_range((unsigned __int8 **)&v13, 2LL, (unsigned __int8 **)&v14);
  if ((result & 1) == 0)
  {
    int v5 = *(uint64_t (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v5)
    {
      size_t v6 = "unknown number encoding";
      goto LABEL_11;
    }

uint64_t recursivelyValidateEntitlements(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)result;
  unint64_t v3 = *(void *)result + 64LL;
  if (*(int *)(result + 20) > 12)
  {
    uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
      if (v2 < v3) {
        goto LABEL_33;
      }
      goto LABEL_95;
    }

    return 0LL;
  }

  __int128 v21 = 0LL;
  uint64_t v22 = 0LL;
  unint64_t v20 = 0LL;
  if (v2) {
    BOOL v5 = v2 >= v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
LABEL_95:
    __break(0x5519u);
    return result;
  }

  uint64_t v6 = result;
  if ((der_decode_next(v2, &v22, &v20, 0LL, a2) & 1) == 0)
  {
    uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
LABEL_33:
      unint64_t v16 = v2;
LABEL_34:
      v4(v16, "[%s]: %s\n");
      return 0LL;
    }

    return 0LL;
  }

  if (v22 != *(void *)(v6 + 8))
  {
    switch(v22)
    {
      case 1LL:
        uint64_t v26 = 0LL;
        unint64_t v27 = 0LL;
        if ((ccder_blob_decode_range(&v20, 1LL, &v26) & 1) != 0)
        {
          if (v27 - (void)v26 == 1) {
            goto LABEL_89;
          }
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        else
        {
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        goto LABEL_33;
      case 2LL:
        uint64_t v26 = 0LL;
        unint64_t v27 = 0LL;
        uint64_t result = ccder_blob_decode_range(&v20, 2LL, &v26);
        if ((result & 1) == 0)
        {
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
          goto LABEL_33;
        }

        unint64_t v18 = v27 - (void)v26;
        if (v27 - (unint64_t)v26 >= 9)
        {
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
          goto LABEL_33;
        }

        __int128 v19 = v26;
        while ((unint64_t)v19 < v27 && v19 >= v26)
        {
          ++v19;
          if (!--v18) {
            goto LABEL_89;
          }
        }

        goto LABEL_95;
      case 3LL:
      case 5LL:
      case 6LL:
      case 7LL:
      case 8LL:
      case 9LL:
      case 10LL:
      case 11LL:
        goto LABEL_51;
      case 4LL:
        if (*(_BYTE *)(v6 + 24))
        {
          uint64_t v26 = 0LL;
          unint64_t v27 = 0LL;
          if ((der_decode_data(v2, &v26, &v20) & 1) == 0) {
            return 0LL;
          }
          goto LABEL_89;
        }

        uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
        if (!v4) {
          return 0LL;
        }
        goto LABEL_33;
      case 12LL:
        uint64_t v26 = 0LL;
        unint64_t v27 = 0LL;
        if ((ccder_blob_decode_range(&v20, 12LL, &v26) & 1) != 0)
        {
          if (!memchr(v26, 0, v27 - (void)v26)) {
            goto LABEL_89;
          }
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        else
        {
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        goto LABEL_33;
      default:
        if (v22 != 0x2000000000000010LL)
        {
LABEL_51:
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
          goto LABEL_33;
        }

        unint64_t v7 = *(void *)v6;
        unint64_t v17 = *(void *)v6 + 64LL;
        uint64_t v26 = 0LL;
        unint64_t v27 = 0LL;
        uint64_t result = ccder_blob_decode_sequence_tl(&v20, &v26);
        if ((_DWORD)result)
        {
          do
          {
            ++*(_DWORD *)(v6 + 20);
            uint64_t result = recursivelyValidateEntitlements(v6, &v26);
            --*(_DWORD *)(v6 + 20);
          }

          while ((result & 1) != 0);
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4) {
            return 0LL;
          }
          if (v7 >= v17) {
            goto LABEL_95;
          }
        }

        else
        {
          uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4) {
            return 0LL;
          }
          if (v7 >= v17) {
            goto LABEL_95;
          }
        }

        break;
    }

    goto LABEL_43;
  }

  unint64_t v7 = *(void *)v6;
  unint64_t v8 = *(void *)v6 + 64LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = 0LL;
  uint64_t result = ccder_blob_decode_range(&v20, v22, &v26);
  if (!(_DWORD)result)
  {
    uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4) {
      return 0LL;
    }
    if (v7 >= v8) {
      goto LABEL_95;
    }
LABEL_43:
    unint64_t v16 = v7;
    goto LABEL_34;
  }

  if ((unint64_t)v26 < v27)
  {
    size_t v9 = 0LL;
    size_t v10 = 0LL;
    while (1)
    {
      unint64_t v24 = 0LL;
      size_t v25 = 0LL;
      __int128 v23 = 0uLL;
      uint64_t result = der_decode_key_value(v7, &v24, &v23, &v26);
      if ((result & 1) == 0)
      {
        uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4) {
          return 0LL;
        }
        if (v7 >= v8) {
          goto LABEL_95;
        }
        goto LABEL_43;
      }

      unint64_t v12 = v24;
      size_t v11 = v25;
      uint64_t result = (uint64_t)memchr(v24, 0, v25);
      if (result)
      {
        uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4) {
          return 0LL;
        }
        if (v7 >= v8) {
          goto LABEL_95;
        }
        goto LABEL_43;
      }

      if (*(_BYTE *)(v6 + 16) && v9 && v10)
      {
        if (!v12) {
          break;
        }
        size_t v13 = v10 >= v11 ? v11 : v10;
        uint64_t result = memcmp(v9, v12, v13);
        BOOL v14 = v10 != v11 && (_DWORD)result == 0;
        int v15 = (v10 < v11) << 31;
        if (!v14) {
          int v15 = result;
        }
        if ((v15 & 0x80000000) == 0) {
          break;
        }
      }

      ++*(_DWORD *)(v6 + 20);
      uint64_t result = recursivelyValidateEntitlements(v6, &v23);
      --*(_DWORD *)(v6 + 20);
      if ((result & 1) == 0)
      {
        uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4) {
          return 0LL;
        }
        if (v7 >= v8) {
          goto LABEL_95;
        }
        goto LABEL_43;
      }

      size_t v9 = v24;
      size_t v10 = v25;
    }

    uint64_t v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4) {
      return 0LL;
    }
    if (v7 < v8) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }

LABEL_89:
  if (v20 != v21)
  {
    uint64_t v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (!v4) {
      return 0LL;
    }
    goto LABEL_33;
  }

  return 1LL;
}

uint64_t der_decode_next(uint64_t a1, void *a2, unsigned __int8 **a3, unsigned __int8 **a4, uint64_t a5)
{
  size_t v11 = *(unsigned __int8 **)a5;
  uint64_t v10 = *(void *)(a5 + 8);
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  if ((ccder_blob_decode_tag((unsigned __int8 **)a5, &v19) & 1) == 0)
  {
    BOOL v14 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v14)
    {
      int v15 = "could not decode tag for next DER sub-sequence";
      goto LABEL_10;
    }

    return 0LL;
  }

  if ((ccder_blob_decode_len((unsigned __int8 **)a5, &v18) & 1) == 0)
  {
    BOOL v14 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v14)
    {
      int v15 = "could not decode size for next DER sub-sequence";
      goto LABEL_10;
    }

    return 0LL;
  }

  unint64_t v12 = *(unsigned __int8 **)a5;
  unint64_t v13 = v18;
  if (*(void *)(a5 + 8) - *(void *)a5 < v18)
  {
    BOOL v14 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v14)
    {
      int v15 = "sub-sequence size is larger than sequence size";
LABEL_10:
      v14(a1, "[%s]: %s\n", "der_decode_next", v15);
      return 0LL;
    }

    return 0LL;
  }

  if (a2) {
    *a2 = v19;
  }
  unint64_t v17 = &v12[v13];
  if (a3)
  {
    *a3 = v11;
    a3[1] = v17;
  }

  if (a4)
  {
    *a4 = v12;
    a4[1] = v17;
  }

  *(void *)a5 = v17;
  *(void *)(a5 + 8) = v10;
  return 1LL;
}

uint64_t der_decode_data(uint64_t a1, void *a2, unsigned __int8 **a3)
{
  size_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v5 = ccder_blob_decode_range(a3, 4LL, &v9);
  if ((v5 & 1) != 0)
  {
    if (a2)
    {
      uint64_t v6 = v10 - (void)v9;
      *a2 = v9;
      a2[1] = v6;
    }
  }

  else
  {
    unint64_t v7 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v7) {
      v7(a1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
    }
  }

  return v5;
}

uint64_t der_decode_key_value(uint64_t a1, void *a2, _OWORD *a3, unsigned __int8 **a4)
{
  __int128 v15 = 0uLL;
  unint64_t v13 = 0LL;
  unint64_t v14 = 0LL;
  if ((ccder_blob_decode_sequence_tl(a4, (unsigned __int8 **)&v15) & 1) == 0)
  {
    size_t v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v9)
    {
      uint64_t v10 = "key / value decoding failure";
LABEL_12:
      v9(a1, "[%s]: %s\n", "der_decode_key_value", v10);
    }

    return 0LL;
  }

  __int128 v16 = 0uLL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v15, 12LL, (unsigned __int8 **)&v16) & 1) == 0)
  {
    size_t v11 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v11) {
      v11(a1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    }
LABEL_10:
    size_t v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v9)
    {
      uint64_t v10 = "dictionary key is not a valid string";
      goto LABEL_12;
    }

    return 0LL;
  }

  if (a2)
  {
    uint64_t v8 = *((void *)&v16 + 1) - v16;
    *a2 = v16;
    a2[1] = v8;
    if (!v8) {
      goto LABEL_10;
    }
  }

  else if (!MEMORY[8])
  {
    goto LABEL_10;
  }

  __int128 v16 = v15;
  if ((ccder_blob_decode_tag((unsigned __int8 **)&v16, &v14) & 1) == 0)
  {
    size_t v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v9) {
      return 0LL;
    }
    uint64_t v10 = "unable to decode value tag for key-value pair";
    goto LABEL_12;
  }

  if ((ccder_blob_decode_len((unsigned __int8 **)&v16, &v13) & 1) == 0)
  {
    size_t v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v9) {
      return 0LL;
    }
    uint64_t v10 = "unable to decode value size for key-value pair";
    goto LABEL_12;
  }

  if ((unsigned __int8 *)(v16 + v13) != *a4)
  {
    size_t v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v9) {
      return 0LL;
    }
    uint64_t v10 = "key-value pair contains extra elements";
    goto LABEL_12;
  }

  *a3 = v15;
  return 1LL;
}

char *der_size_element(void *a1, char **a2, uint64_t *a3)
{
  if (!a1) {
    return (char *)&unk_18962B7F0;
  }
  switch(*a1)
  {
    case 1LL:
      a1[2] = 1LL;
      uint64_t v6 = 1LL;
      unint64_t v7 = 1LL;
      goto LABEL_30;
    case 2LL:
      unint64_t v7 = a1[2];
      uint64_t v6 = 12LL;
      goto LABEL_30;
    case 4LL:
      unint64_t v9 = a1[1];
      unint64_t v10 = HIBYTE(v9);
      if ((HIBYTE(v9) + 1) > 1u)
      {
        unint64_t v16 = 8LL;
      }

      else
      {
        if ((_DWORD)v10 == BYTE6(v9))
        {
          if ((_DWORD)v10 == BYTE5(v9))
          {
            if ((_DWORD)v10 == BYTE4(v9))
            {
              if ((_DWORD)v10 == BYTE3(v9))
              {
                if ((_DWORD)v10 == BYTE2(v9))
                {
                  if (BYTE1(v9) == (_DWORD)v10) {
                    uint64_t v11 = 2LL;
                  }
                  else {
                    uint64_t v11 = 3LL;
                  }
                  uint64_t v12 = 1LL;
                  if (BYTE1(v9) != (_DWORD)v10) {
                    uint64_t v12 = 2LL;
                  }
                }

                else
                {
                  uint64_t v12 = 3LL;
                  uint64_t v11 = 4LL;
                }
              }

              else
              {
                uint64_t v12 = 4LL;
                uint64_t v11 = 5LL;
              }
            }

            else
            {
              uint64_t v12 = 5LL;
              uint64_t v11 = 6LL;
            }
          }

          else
          {
            uint64_t v12 = 6LL;
            uint64_t v11 = 7LL;
          }
        }

        else
        {
          uint64_t v12 = 7LL;
          uint64_t v11 = 8LL;
        }

        else {
          unint64_t v16 = v12;
        }
      }

      *a3 = ccder_sizeof(2LL, v16);
      a1[2] = v16;
      return (char *)&Errors;
    case 5LL:
      goto LABEL_18;
    case 7LL:
      return (char *)der_size_dictionary(a1, a2, a3);
    case 9LL:
      unint64_t v7 = a1[2];
      uint64_t v6 = 4LL;
LABEL_30:
      *a3 = ccder_sizeof(v6, v7);
      return (char *)&Errors;
    default:
      return (char *)&unk_18962B7F0;
  }

  while (1)
  {
LABEL_18:
    uint64_t result = *a2;
    unint64_t v13 = (unint64_t)a2[1];
    unint64_t v14 = result + 32;
    *a2 = v14;
    if (!result) {
      return (char *)&unk_18962B810;
    }
    if (*(void *)result == 6LL)
    {
      *a3 = ccder_sizeof(0x2000000000000010LL, 0LL);
      a1[2] = 0LL;
      return (char *)&Errors;
    }

    if (result >= v14) {
      break;
    }
    uint64_t result = (char *)der_size_element();
  }

  __break(0x5519u);
  return result;
}

uint64_t der_size_dictionary(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = result;
  unint64_t v6 = 0LL;
  unint64_t v7 = *(char **)a2;
  unint64_t v8 = *(void *)(a2 + 8);
  if (*(void *)a2 >= v8) {
    return (uint64_t)&unk_18962B810;
  }
  while (1)
  {
    unint64_t v9 = v7 + 32;
    if ((unint64_t)(v7 + 32) > v8 || v7 > v9)
    {
LABEL_28:
      __break(0x5519u);
      return result;
    }

    *(void *)a2 = v9;
    if (!v7) {
      return (uint64_t)&unk_18962B810;
    }
    if (*(void *)v7 != 5LL) {
      break;
    }
    v7[24] = 1;
    unint64_t v10 = v7 + 64;
    *(void *)a2 = v10;
    if (*(void *)v9 != 3LL) {
      return (uint64_t)&unk_18962B810;
    }
    unint64_t v11 = *((void *)v7 + 6);
    if (!v11) {
      return (uint64_t)&unk_18962B810;
    }
    uint64_t v12 = ccder_sizeof(12LL, v11);
    uint64_t result = 0LL;
    uint64_t v17 = 0LL;
    if ((unint64_t)v10 < v8)
    {
      unint64_t v13 = v7 + 96;
      *(void *)a2 = v13;
      uint64_t result = (uint64_t)(v7 + 64);
    }

    uint64_t result = (uint64_t)der_size_element((void *)result, (char **)a2, &v17);
    if ((_UNKNOWN *)result != &Errors) {
      return result;
    }
    unint64_t v14 = *(char **)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    if (*(void *)a2 >= v8) {
      return (uint64_t)&unk_18962B810;
    }
    __int128 v15 = v14 + 32;
    *(void *)a2 = v15;
    if (v14)
    {
      if (*(void *)v14 == 6LL)
      {
        v14[24] = 1;
        unint64_t v16 = v17 + v12;
        *((void *)v7 + 2) = v17 + v12;
        uint64_t result = ccder_sizeof(0x2000000000000010LL, v16);
        v6 += result;
        unint64_t v7 = v15;
      }
    }

    return (uint64_t)&unk_18962B810;
  }

  if (*(void *)v7 != 8LL) {
    return (uint64_t)&unk_18962B810;
  }
  *a3 = ccder_sizeof(0xA000000000000010LL, v6);
  *(void *)(v5 + 16) = v6;
  return (uint64_t)&Errors;
}

uint64_t der_encode_number(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = HIBYTE(a2);
  if ((HIBYTE(a2) + 1) > 1u)
  {
    unint64_t v6 = 8LL;
  }

  else
  {
    if ((_DWORD)v3 == BYTE6(a2))
    {
      if ((_DWORD)v3 == BYTE5(a2))
      {
        if ((_DWORD)v3 == BYTE4(a2))
        {
          if ((_DWORD)v3 == BYTE3(a2))
          {
            if ((_DWORD)v3 == BYTE2(a2))
            {
              if (BYTE1(a2) == (_DWORD)v3) {
                uint64_t v4 = 2LL;
              }
              else {
                uint64_t v4 = 3LL;
              }
              uint64_t v5 = 1LL;
              if (BYTE1(a2) != (_DWORD)v3) {
                uint64_t v5 = 2LL;
              }
            }

            else
            {
              uint64_t v5 = 3LL;
              uint64_t v4 = 4LL;
            }
          }

          else
          {
            uint64_t v5 = 4LL;
            uint64_t v4 = 5LL;
          }
        }

        else
        {
          uint64_t v5 = 5LL;
          uint64_t v4 = 6LL;
        }
      }

      else
      {
        uint64_t v5 = 6LL;
        uint64_t v4 = 7LL;
      }
    }

    else
    {
      uint64_t v5 = 7LL;
      uint64_t v4 = 8LL;
    }

    else {
      unint64_t v6 = v5;
    }
  }

  uint64_t v12 = 0LL;
  unint64_t v13 = 0LL;
  uint64_t result = ccder_blob_reserve_tl(a1, 2uLL, v6, &v12);
  if ((_DWORD)result)
  {
    unint64_t v8 = (unint64_t)v12;
    unint64_t v9 = (unint64_t)v13;
    if (v13 != v12)
    {
      unint64_t v10 = v13 - 1;
      while ((unint64_t)v10 < v9 && (unint64_t)v10 >= v8)
      {
        _BYTE *v10 = v2;
        v2 >>= 8;
        if (v10-- == v12) {
          return result;
        }
      }

      __break(0x5519u);
    }
  }

  return result;
}

void _xpc_mach_message_request_handoff_reply_cold_1()
{
}

void _xpc_graph_deserializer_read_port_cold_1()
{
}

void _xpc_mach_payload_extract_ool_port_cold_1(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Invalid disposition in payload.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_rich_error_serialize_cold_1()
{
}

void _xpc_interface_routine_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void _xpc_interface_routine_cold_2()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void _xpc_interface_routine_cold_3()
{
}

void _xpc_interface_routine_cold_4()
{
}

void _xpc_interface_routine_cold_5()
{
}

void _xpc_interface_routine_cold_6(int a1)
{
  _xpc_asprintf("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void _xpc_alloc_cold_1()
{
}

void _xpc_type_from_id_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: looking up type for a bogus id";
  __break(1u);
}

void _xpc_deserialize_from_wire_id_cold_2(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Attempted to deserialize an unknown type of object (the caller should have"
                             " skipped it with _xpc_wire_length_from_wire_id";
  qword_18C50BD08 = a1;
  __break(1u);
}

void xpc_array_create_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Too many objects";
  __break(1u);
}

void _xpc_traverse_dictionary_cold_1()
{
}

void _xpc_traverse_dictionary_cold_2()
{
}

void _xpc_traverse_array_cold_1()
{
}

void _xpc_traverse_array_cold_2()
{
}

void _xpc_traverse_simple_cold_1()
{
}

void ___xpc_event_publisher_xref_dispose_block_invoke_cold_1()
{
}

void xpc_event_publisher_activate_cold_1(const char *a1)
{
}

void _xpc_event_publisher_set_subscriptions_cold_3()
{
}

void _xpc_connection_enqueue_cold_1(uint64_t a1)
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: Unexpected send result.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_connection_handle_async_reply_cold_1(uint64_t a1)
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: Unexpected async reply reason.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_connection_release_message_cold_1(int a1)
{
  uint64_t v1 = a1;
  _os_assumes_log();
  qword_18C50BCD8 = (uint64_t)"Data corruption: Malformed Mach message or kernel bug.";
  qword_18C50BD08 = v1;
  __break(1u);
}

void _xpc_connection_release_message_cold_2(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: The kernel cannot allocate memory needed for the pseudo-receive.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_connection_release_message_cold_3(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: MACH_SEND_NO_BUFFER returned for reliable message size.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_connection_release_message_cold_4()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: Message larger than reliable size.";
  __break(1u);
}

void _xpc_connection_handle_disconnect_event_cold_1(unsigned int *a1, uint64_t a2)
{
  uint64_t v4 = *a1 | (unint64_t)(a2 << 32);
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: Disconnect with invalid receive port";
  qword_18C50BD08 = v4;
  __break(1u);
}

void _xpc_connection_call_reply_async_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Reply handler block scheduled with NULL reply.";
  __break(1u);
}

void _xpc_connection_init_cold_1(int a1)
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: Unexpected error from connection mach_port_construct()";
  qword_18C50BD08 = a1;
  __break(1u);
}

uint64_t _xpc_connection_init_cold_3(uint64_t a1, mach_port_name_t *a2)
{
  uint64_t result = _xpc_mach_port_release(*a2);
  if ((_DWORD)result) {
    return _os_assumes_log();
  }
  return result;
}

void _xpc_connection_mach_event_cold_2(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: _recvp is still valid";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_connection_mach_event_cold_3(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: _sendp is still valid";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_connection_mach_event_cold_4()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Teardown of an uninitialized connection.";
  __break(1u);
}

void _xpc_connection_mach_event_cold_5()
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: Multiple cancellation events delivered.";
  __break(1u);
}

void _xpc_connection_mach_event_cold_6()
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: Invalid reply-received event delivered.";
  __break(1u);
}

void _xpc_connection_handle_sent_event_cold_1(int a1)
{
  qword_18C50BCD8 = (uint64_t)"libdispatch bug: Non-check-in message without context.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void xpc_date_create_from_current_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: clock_gettime_nsec_np failed or is unreasonably far in the future";
  __break(1u);
}

void xpc_copy_bootstrap_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: Invalid audit token in bootstrap dictionary";
  __break(1u);
}

void _xpc_get_service_instance_cold_1(void *a1, int a2)
{
  uint64_t v4 = strerror(a2);
  snprintf((char *)a1, 0xA0uLL, "%s: %d: %s", "_xpc_get_service_instance failed", a2, v4);
  qword_18C50BCD8 = (uint64_t)a1;
  __break(1u);
}

void _xpc_dictionary_create_from_received_message_cold_2()
{
}

void _get_autorelease_pool_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Service does not have NSAutoreleasePool.";
  __break(1u);
}

void _create_nsstring_for_key_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Service does not have NSString.";
  __break(1u);
}

uint64_t _xpc_fd_desc_cold_1()
{
  return _os_assumes_log();
}

void _libxpc_initializer_cold_1(int a1)
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: Could not obtain task bootstrap port.";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _libxpc_initializer_cold_2(int a1)
{
  qword_18C50BCD8 = (uint64_t)"Kernel bug: mach_ports_lookup() failed.";
  qword_18C50BD08 = a1;
  __break(1u);
}

uint64_t _libxpc_initializer_cold_3()
{
  if ((_dyld_get_shared_cache_uuid() & 1) != 0) {
    _dyld_get_shared_cache_range();
  }
  uint64_t result = _os_log_simple();
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: Could not get bootstrap port.";
  __break(1u);
  return result;
}

void _libxpc_initializer_cold_4()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: No port given.";
  __break(1u);
}

void _libxpc_initializer_cold_5()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Invalid bootstrap port.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: XPCService is not a dictionary.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_2()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Couldn't retrieve XPCService identifier from service bundle.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_3()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle Info.plist has no CFBundleIdentifier.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_4()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare additional subservices.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_5()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare specified subservice.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_6()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Specified subservice is disabled.";
  __break(1u);
}

void _xpc_register_service_listener_with_handler_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Already have a main service listener.";
  __break(1u);
}

void xpc_handle_service_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle has no Info.plist";
  __break(1u);
}

void xpc_handle_service_cold_2()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle Info.plist has no XPCService dictionary.";
  __break(1u);
}

void xpc_handle_service_cold_3()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare additional services.";
  __break(1u);
}

void xpc_handle_service_cold_4()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare specified service name.";
  __break(1u);
}

void xpc_handle_service_cold_5()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Specified service name is disabled.";
  __break(1u);
}

void _xpc_create_bootstrap_pipe_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: Could not create pipe to bootstrap server!";
  __break(1u);
}

void _xpc_init_pid_domain_cold_1()
{
}

void _xpc_copy_xpcservice_dictionary_cold_1()
{
}

void _xpc_copy_xpcservice_dictionary_cold_2()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Couldn't retrieve XPCService dictionary from service bundle.";
  __break(1u);
}

void _xpc_serializer_pack_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: Unexpected platform";
  __break(1u);
}

void _xpc_serializer_pack_cold_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = xpc_copy_description(a3);
  syslog(3, "Message:\n%s", v4);
  qword_18C50BCD8 = (uint64_t)"Data corruption: Out-of-line descriptor count is out-of-sync.";
  __break(1u);
}

void _xpc_serializer_pack_cold_3()
{
}

void _xpc_serializer_cleanup_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Destructor set on inline object graph.";
  __break(1u);
}

void _xpc_serializer_append_port_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: Unexpected disposition";
  __break(1u);
}

void _xpc_serializer_append_port_cold_2()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Out-of-bounds descriptor append attempt.";
  __break(1u);
}

void _xpc_serializer_apply_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Found unexpected non-XPC tagged pointer object";
  __break(1u);
}

void xpc_mach_send_copy_right_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: mach_port_destroy() called on send right referenced by an XPC object.";
  __break(1u);
}

void _xpc_session_message_error_during_cancelation_cold_1(unsigned int a1)
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: invalid state passed to _xpc_session_message_error_during_cancelation()";
  qword_18C50BD08 = a1;
  __break(1u);
}

void ___xpc_session_setup_connection_handlers_block_invoke_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: unhandled error in session";
  __break(1u);
}

void ___xpc_listener_setup_connection_handlers_block_invoke_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: xpc_listener_t configured without session handler";
  __break(1u);
}

void _xpc_mach_port_construct_cold_1(int a1)
{
  qword_18C50BCD8 = (uint64_t)"Bug in libxpc: mach_port_construct() failed";
  qword_18C50BD08 = a1;
  __break(1u);
}

void _xpc_mach_port_get_context_cold_1()
{
}

void _fetch_self_token_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void _xpc_pipe_routine_cold_2(int a1)
{
  _xpc_asprintf("reply must be from PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void _xpc_pipe_pack_message_cold_1()
{
}

void xpc_pipe_try_receive_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Message buffer was shorter than mach_msg_header";
  __break(1u);
}

void _xpc_pipe_mach_msg_cold_1()
{
  qword_18C50BCD8 = (uint64_t)"Data corruption: Invalid out-of-line descriptor specified.";
  __break(1u);
}

void _xpc_bundle_resolve_sync_cold_2()
{
  qword_18C50BCD8 = (uint64_t)"Configuration error: Nonexistent bundle layout was resolved.";
  __break(1u);
}

void xpc_file_transfer_create_with_fd_cold_1()
{
}

void _xpc_file_transfer_create_with_fd_impl_cold_1()
{
  uint64_t v0 = (OSQueueHead *)_os_crash();
  __break(1u);
  OSAtomicDequeue(v0, v1);
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1896003C0](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895FED58](aBlock);
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

int *_NSGetArgc(void)
{
  return (int *)MEMORY[0x1895FED90]();
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1895FED98]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1895FEDA0]();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x1895FEBD0](buf, bufsize);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895FEDD0](*(void *)&a1, a2);
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1895FF808]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895FEE38]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1895FE7F0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1895FEC00]();
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1895FEC10]();
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

uint64_t _dyld_register_for_bulk_image_loads()
{
  return MEMORY[0x1895FEC40]();
}

uint64_t _dyld_shared_cache_real_path()
{
  return MEMORY[0x1895FEC58]();
}

void _exit(int a1)
{
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1896163D8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x189600400]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895FEE58]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895FEE60]();
}

uint64_t _os_avoid_tail_call()
{
  return MEMORY[0x1895FEE70]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895FEE78]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1895FF600]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_simple()
{
  return MEMORY[0x189600408]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x1895FE840]();
}

uint64_t _os_object_alloc_realized()
{
  return MEMORY[0x1895FE848]();
}

uint64_t _os_object_release()
{
  return MEMORY[0x1895FE850]();
}

uint64_t _os_object_release_internal()
{
  return MEMORY[0x1895FE858]();
}

uint64_t _os_object_release_without_xref_dispose()
{
  return MEMORY[0x1895FE860]();
}

uint64_t _os_object_retain()
{
  return MEMORY[0x1895FE868]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x1895FE870]();
}

uint64_t _os_object_retain_with_resurrect()
{
  return MEMORY[0x1895FE878]();
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x189600860]();
}

uint64_t _os_trace_lazy_init_completed_4libxpc()
{
  return MEMORY[0x189600870]();
}

void abort(void)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1895FF8F8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895FF908](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895FEF70](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895FEF88](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1895FF928]();
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x189616498](cls, extraBytes);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1895FEFB0](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FEFB8](a1);
}

uint64_t csops()
{
  return MEMORY[0x1895FF980]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1895FF988]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1895FE8E0](data, applier);
}

uint64_t dispatch_data_apply_f()
{
  return MEMORY[0x1895FE8E8]();
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FE8F0](buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1895FE8F8]();
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1895FE900](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1895FE908](data, buffer_ptr, size_ptr);
}

uint64_t dispatch_data_create_with_transform()
{
  return MEMORY[0x1895FE910]();
}

uint64_t dispatch_data_get_flattened_bytes_4libxpc()
{
  return MEMORY[0x1895FE918]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FE920](data);
}

uint64_t dispatch_data_make_memory_entry()
{
  return MEMORY[0x1895FE928]();
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1895FE930](object);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FE940](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create( dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1895FE978](type, *(void *)&fd, queue, cleanup_handler);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1895FE990]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1895FE998]();
}

uint64_t dispatch_mach_create_4libxpc()
{
  return MEMORY[0x1895FE9A0]();
}

uint64_t dispatch_mach_get_checkin_port()
{
  return MEMORY[0x1895FE9A8]();
}

uint64_t dispatch_mach_handoff_reply()
{
  return MEMORY[0x1895FE9B0]();
}

uint64_t dispatch_mach_handoff_reply_f()
{
  return MEMORY[0x1895FE9B8]();
}

uint64_t dispatch_mach_hooks_install_4libxpc()
{
  return MEMORY[0x1895FE9C0]();
}

uint64_t dispatch_mach_msg_create()
{
  return MEMORY[0x1895FE9C8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1895FE9D0]();
}

uint64_t dispatch_mach_receive_barrier_f()
{
  return MEMORY[0x1895FE9D8]();
}

uint64_t dispatch_mach_reconnect()
{
  return MEMORY[0x1895FE9E0]();
}

uint64_t dispatch_mach_send_barrier()
{
  return MEMORY[0x1895FE9E8]();
}

uint64_t dispatch_mach_send_barrier_f()
{
  return MEMORY[0x1895FE9F0]();
}

uint64_t dispatch_mach_send_with_result()
{
  return MEMORY[0x1895FE9F8]();
}

uint64_t dispatch_mach_send_with_result_and_async_reply_4libxpc()
{
  return MEMORY[0x1895FEA00]();
}

uint64_t dispatch_mach_send_with_result_and_wait_for_reply()
{
  return MEMORY[0x1895FEA08]();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1895FEA30]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FEA38](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA40](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA48](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FEA50](queue);
}

void dispatch_read(dispatch_fd_t fd, size_t length, dispatch_queue_t queue, void *handler)
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1895FEAA8]();
}

void dispatch_set_qos_class_floor( dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FEAC8](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1895FEAD8](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1895FEB00]();
}

uint64_t dispatch_source_set_mandatory_cancel_handler_f()
{
  return MEMORY[0x1895FEB08]();
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FEB30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FEC80](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FEC88](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FEC90]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1895FEC98]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FF9D8](*(void *)&a1, *(void *)&a2);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x1895FFA00]();
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1895FFA08]();
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FFA58](*(void *)&a1, a2, a3, *(void *)&a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF0D8](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFA80](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

int getpagesize(void)
{
  return MEMORY[0x1895FF0F8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

const section_64 *__cdecl getsectbyname(const char *segname, const char *sectname)
{
  return (const section_64 *)MEMORY[0x1895FECD0](segname, sectname);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FF110](a1, a2);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1895FFB20]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FFB88]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FF150](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FFC28](*(void *)&error_value);
}

kern_return_t mach_make_memory_entry_64( vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1895FFC80]( *(void *)&target_task,  size,  offset,  *(void *)&permission,  object_handle,  *(void *)&parent_entry);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FFC90]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

mach_msg_return_t mach_msg_receive(mach_msg_header_t *a1)
{
  return MEMORY[0x1895FFCA8](a1);
}

kern_return_t mach_port_construct( ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1895FFCB8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct( ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1895FFCC8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_get_context( ipc_space_inspect_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return MEMORY[0x1895FFCE0](*(void *)&task, *(void *)&name, context);
}

kern_return_t mach_port_get_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1895FFCE8](*(void *)&task, *(void *)&name, *(void *)&right, refs);
}

kern_return_t mach_port_guard( ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  return MEMORY[0x1895FFCF0](*(void *)&task, *(void *)&name, guard, *(void *)&strict);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FFCF8](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_is_connection_for_service( ipc_space_t task, mach_port_name_t connection_port, mach_port_name_t service_port, uint64_t *filter_policy_id)
{
  return MEMORY[0x1895FFD00](*(void *)&task, *(void *)&connection_port, *(void *)&service_port, filter_policy_id);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FFD10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1895FFD18]( *(void *)&task,  *(void *)&name,  *(void *)&msgid,  *(void *)&sync,  *(void *)&notify,  *(void *)&notifyPoly,  previous);
}

kern_return_t mach_port_set_attributes( ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1895FFD20]( *(void *)&task,  *(void *)&name,  *(void *)&flavor,  port_info,  *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1895FFD28](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_ports_lookup( task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return MEMORY[0x1895FFD30](*(void *)&target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_ports_register( task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return MEMORY[0x1895FFD38](*(void *)&target_task, init_port_set, *(void *)&init_port_setCnt);
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFD78]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1896002E8](ptr);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FF160](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FF168](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FF178](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FF190](__s, __smax, *(void *)&__c, __n);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FFDF8]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

uint64_t notify_set_options()
{
  return MEMORY[0x1896003A0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x189616708](name);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FFE58](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FF1C0](a1);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1895FFE88]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x189600890](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

uint64_t os_map_128_destroy()
{
  return MEMORY[0x1895FF4B0]();
}

uint64_t os_map_128_find()
{
  return MEMORY[0x1895FF4B8]();
}

uint64_t os_map_128_init()
{
  return MEMORY[0x1895FF4C0]();
}

uint64_t os_map_128_insert()
{
  return MEMORY[0x1895FF4C8]();
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1895FEB48](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1896008C0](log);
}

uint64_t os_trace_set_mode()
{
  return MEMORY[0x1896008D8]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FF5B8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FF5C0]();
}

int posix_spawnattr_setarchpref_np( posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, cpu_subtype_t *a4, size_t *a5)
{
  return MEMORY[0x1895FFEE0](a1, a2, a3, a4, a5);
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1895FFEF0]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FFF10](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_set_dirty(pid_t pid, BOOL dirty)
{
  return MEMORY[0x1895FFF28](*(void *)&pid, dirty);
}

int proc_track_dirty(pid_t pid, uint32_t flags)
{
  return MEMORY[0x1895FFF30](*(void *)&pid, *(void *)&flags);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FFF48](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FF210](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1896007B8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1895FF268](__name, __value, *(void *)&__overwrite);
}

uint64_t si_search_module_set_flags()
{
  return MEMORY[0x1895FF680]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1895FF280](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FF290](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF2A8](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF2B8](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF2E0](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FF2F0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FF308](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FF318](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF320](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF328](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FF350](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FF358](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FF360](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1895FF368](a1, a2, a3);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF370](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FF378](__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A0](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FF3F0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x189600078](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x189600080](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t thread_get_special_reply_port()
{
  return MEMORY[0x1896000C0]();
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FF440](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FF478](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x189600100](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x189600110](*(void *)&target_task, address, size);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1895FEB98]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1895FEBA0]();
}

uint64_t voucher_create_with_mach_msg()
{
  return MEMORY[0x1895FEBA8]();
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x189600168](msg);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}