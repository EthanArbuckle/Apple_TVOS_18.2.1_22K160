uint64_t _tb_null_transport_send_message(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t transport_buffer;
  size_t v9;
  const void *v10;
  char *v11;
  char *v12;
  void **v13;
  void **v14;
  _DWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  size_t v22;
  uint64_t result;
  transport_buffer = tb_message_get_transport_buffer(a2);
  v9 = *(void *)(transport_buffer + 24);
  v10 = *(const void **)transport_buffer;
  v11 = (char *)calloc(v9, 1uLL);
  if (v11 > &v11[v9]) {
    goto LABEL_15;
  }
  v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  memcpy(v11, v10, v9);
  v13 = (void **)calloc(1uLL, 0x68uLL);
  if (!v13) {
    _tb_null_transport_send_message_cold_1();
  }
  v14 = v13;
  *v13 = v12;
  v13[2] = 0LL;
  v13[3] = (void *)v9;
  v13[4] = 0LL;
  v13[6] = 0LL;
  *((_WORD *)v13 + 21) = *(_WORD *)(transport_buffer + 42);
  v15 = calloc(1uLL, 0x58uLL);
  if (!v15) {
    _tb_null_transport_send_message_cold_1();
  }
  v16 = v15;
  *v15 = 4;
  *((_BYTE *)v15 + 4) = 1;
  *((void *)v15 + 10) = v14;
  *((void *)v15 + 3) = a1;
  tb_message_configure_received((uint64_t)v15, 1);
  v17 = *(void *)(a1 + 72);
  v18 = (uint64_t)v16;
  if (v17)
  {
    v18 = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    if (!v18)
    {
      free(*v14);
      free(v14);
      free(v16);
      return (2 * a4) & 4;
    }
  }

  v19 = tb_message_get_transport_buffer(v18);
  v20 = *(void *)(v19 + 24);
  free(*(void **)transport_buffer);
  *(void *)transport_buffer = 0LL;
  *(void *)(transport_buffer + 16) = 0LL;
  *(void *)(transport_buffer + 24) = 0LL;
  v22 = *(void *)(v19 + 24);
  if (v22 > *(void *)(transport_buffer + 24))
  {
LABEL_15:
    __break(0x5519u);
LABEL_16:
    _tb_null_transport_send_message_cold_1();
  }

  memcpy(*(void **)transport_buffer, *(const void **)v19, v22);
  *(_WORD *)(transport_buffer + 42) = *(_WORD *)(v19 + 42);
  *(void *)(a2 + 24) = *(void *)(v18 + 24);
  tb_message_configure_received(a2, 2);
  if (v14 != (void **)v19)
  {
    free(*(void **)v19);
    free((void *)v19);
  }

  free(*v14);
  free(v14);
  free(v16);
  result = 0LL;
  if (a3) {
    *a3 = a2;
  }
  return result;
}

uint64_t _tb_null_client_transport_activate()
{
  return 0LL;
}

uint64_t _tb_null_service_transport_activate()
{
  return 0LL;
}

uint64_t _tb_null_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (char *)calloc(a1, 1uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_null_transport_send_message_cold_1();
  }

  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(_BYTE *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0LL;
  *(void *)(a3 + 48) = 0LL;
  *(_BYTE *)(a3 + 41) = 0;
  return 0LL;
}

void _tb_null_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t _tb_null_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  return _tb_null_transport_construct_message_buffer(a3, v5, a1);
}

uint64_t _tb_null_transport_supports_multipart_messages()
{
  return 1LL;
}

uint64_t _tb_null_transport_get_tx_buffer_size()
{
  return tb_null_transport_max_send_size;
}

__n128 tb_null_transport_create_inplace_with_endpoint(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(void *)(a2 + 224) = 0LL;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)a2 = _tb_null_transport_vtable;
  __int128 v3 = xmmword_18C505DB0;
  __n128 result = *(__n128 *)&off_18C505DC0;
  __int128 v4 = xmmword_18C505DA0;
  *(void *)(a2 + 64) = off_18C505DD0;
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)(a2 + 48) = result;
  *(_OWORD *)(a2 + 16) = v4;
  *(void *)(a2 + 96) = 0LL;
  return result;
}

__n128 tb_null_transport_create()
{
  v0 = calloc(1uLL, 0xE8uLL);
  if (!v0) {
    _tb_null_transport_send_message_cold_1();
  }
  *(_OWORD *)((char *)v0 + 216) = 0u;
  *(_OWORD *)((char *)v0 + 200) = 0u;
  *(_OWORD *)((char *)v0 + 184) = 0u;
  *(_OWORD *)((char *)v0 + 168) = 0u;
  *(_OWORD *)((char *)v0 + 152) = 0u;
  *(_OWORD *)((char *)v0 + 136) = 0u;
  *(_OWORD *)((char *)v0 + 120) = 0u;
  *(_OWORD *)((char *)v0 + 104) = 0u;
  *(_OWORD *)((char *)v0 + 88) = 0u;
  *(_OWORD *)((char *)v0 + 72) = 0u;
  __int128 v1 = *(_OWORD *)&off_18C505DC0;
  v0[2] = xmmword_18C505DB0;
  v0[3] = v1;
  *((void *)v0 + 8) = off_18C505DD0;
  __n128 result = (__n128)xmmword_18C505DA0;
  _OWORD *v0 = _tb_null_transport_vtable;
  v0[1] = result;
  return result;
}

uint64_t tb_conclave_start()
{
  uint64_t v3 = 0LL;
  __int128 v4 = &v3;
  uint64_t v5 = 0x2000000000LL;
  int v6 = 0;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __tb_conclave_start_block_invoke;
  block[3] = &unk_18A3AB070;
  block[4] = &v3;
  if (tb_conclave_start_onceToken[0] != -1) {
    dispatch_once(tb_conclave_start_onceToken, block);
  }
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t __tb_conclave_start_block_invoke(uint64_t a1)
{
  uint64_t result = exclaves_launch_conclave();
  if ((_DWORD)result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 3;
  }
  return result;
}

uint64_t tb_conclave_identifier_for_service(uint64_t a1, void *a2)
{
  uint64_t result = tb_conclave_start();
  if (!(_DWORD)result)
  {
    uint64_t result = exclaves_lookup_service();
    if ((_DWORD)result) {
      return 10LL;
    }
    else {
      *a2 = 0LL;
    }
  }

  return result;
}

uint64_t tb_conclave_endpoint_for_service(uint64_t a1, void *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v3 = tb_conclave_identifier_for_service(a1, &v7);
  if (!(_DWORD)v3)
  {
    __int128 v4 = calloc(1uLL, 0x10uLL);
    if (!v4) {
      _tb_null_transport_send_message_cold_1();
    }
    uint64_t v5 = v7;
    *__int128 v4 = 0LL;
    v4[1] = v5;
    *a2 = tb_endpoint_create_with_data(8, (uint64_t)v4, 0, &__block_literal_global);
  }

  return v3;
}

void __tb_conclave_endpoint_for_service_block_invoke(int a1, void *a2)
{
}

void *tb_eve_client_transport_create(uint64_t a1)
{
  v2 = calloc(1uLL, 0xE8uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v3 = v2;
  v2[12] = _tb_eve_transport_create(a1);
  v3[3] = _tb_eve_transport_construct_message_buffer;
  v3[4] = _tb_eve_transport_destruct_message_buffer;
  v3[5] = _tb_eve_transport_message_buffer_reset;
  *uint64_t v3 = _tb_eve_transport_send_message;
  v3[1] = _tb_eve_transport_activate;
  v3[8] = _tb_eve_transport_destruct;
  return v3;
}

char *tb_owned_buffer_allocate(size_t a1)
{
  uint64_t result = (char *)calloc(a1, 1uLL);
  if (result > &result[a1]) {
    goto LABEL_4;
  }
  if (!result) {
    goto LABEL_5;
  }
  if (!a1)
  {
LABEL_4:
    __break(0x5519u);
LABEL_5:
    _tb_null_transport_send_message_cold_1();
  }

  return result;
}

double tb_message_initialize(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = -1LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  return result;
}

_DWORD *tb_message_set_state(_DWORD *result, int a2)
{
  *double result = a2;
  return result;
}

uint64_t tb_message_set_disposition(uint64_t result, char a2)
{
  *(_BYTE *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_construct(uint64_t a1, uint64_t a2, char a3)
{
  if (*(_DWORD *)a1) {
    tb_message_construct_cold_1();
  }
  *(_DWORD *)a1 = 1;
  *(_BYTE *)(a1 + 4) = a3;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 32) = -1LL;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = a2;
  return 0LL;
}

uint64_t tb_message_clear_connection_identifier(uint64_t result)
{
  *(void *)(result + 8) = 0LL;
  return result;
}

uint64_t tb_message_set_transport_buffer(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t tb_message_complete(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 4);
  if (v1 == 1) {
    goto LABEL_5;
  }
  if (v1 != 2)
  {
    if (!*(_BYTE *)(result + 4))
    {
      do
      {
LABEL_4:
        __break(1u);
LABEL_5:
        ;
      }

      while (*(_DWORD *)result != 1 && *(_DWORD *)result != 4);
    }

LABEL_10:
    *(_DWORD *)double result = 2;
    return result;
  }

  if ((*(_DWORD *)result - 3) >= 2)
  {
    if (*(_DWORD *)result != 1) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }

  return result;
}

  v14 = calloc(1uLL, 0x20uLL);
  if (!v14) {
    _tb_null_transport_send_message_cold_1();
  }
  v15 = (unint64_t)v14;
  v16 = *(void *)(v8 + 24);
  v17 = (char *)calloc(v16, 1uLL);
  if (v17 > &v17[v16]) {
    goto LABEL_22;
  }
  v18 = v17;
  if (!v17) {
    _tb_null_transport_send_message_cold_1();
  }
  if (v16 > *(void *)(v8 + 24)) {
    goto LABEL_22;
  }
  memcpy(v17, *(const void **)v8, v16);
  *(void *)(v15 + 16) = v16;
  *(void *)(v15 + 24) = 0LL;
  *(void *)v15 = v9;
  *(void *)(v15 + 8) = v18;
  if (v15 >= v15 + 32) {
    goto LABEL_22;
  }
  tb_list_add(v10, v9, v15, &__block_literal_global_8);
  tx_buffer_size = tb_transport_get_tx_buffer_size(transport);
  double result = _tb_message_reset(a3, (_DWORD *)a1, 1, tx_buffer_size, 0LL);
  if ((_DWORD)result) {
    return result;
  }
  v20 = (void *)tb_message_get_transport_buffer(a1);
  if (tx_buffer_size > *(void *)(v15 + 16)
    || (v21 = v20, v22 = *v20, v23 = *v20 + v20[3], v24 = (void *)(*v20 + v20[4]), (unint64_t)v24 > v23)
    || v22 > (unint64_t)v24
    || tx_buffer_size > v23 - (unint64_t)v24)
  {
LABEL_22:
    __break(0x5519u);
    goto LABEL_23;
  }

  memcpy(v24, *(const void **)(v15 + 8), tx_buffer_size);
  v21[2] += tx_buffer_size;
  *(void *)(v15 + 24) += tx_buffer_size;
  *((_WORD *)v21 + 21) |= 1u;
  *a2 = a1;
  tb_message_complete(a1);
  return 0LL;
}

    __break(1u);
    goto LABEL_11;
  }

  return result;
}

  sub_189488C68(v9, v10, a1, a2, v8);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t tb_message_reset(uint64_t a1, char a2)
{
  *(_DWORD *)a1 = 1;
  *(_BYTE *)(a1 + 4) = a2;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0LL;
  return 0LL;
}

uint64_t tb_message_destruct(uint64_t result)
{
  *(_BYTE *)(result + 4) = 0;
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 32) = -1LL;
  *(void *)(result + 80) = 0LL;
  *(_DWORD *)double result = 5;
  return result;
}

uint64_t tb_message_configure_received(uint64_t result, int a2)
{
  *(_DWORD *)double result = 4;
  *(_BYTE *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_configure_recieved(uint64_t result, int a2)
{
  *(_DWORD *)double result = 4;
  *(_BYTE *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_get_transport_buffer(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t tb_message_get_state(unsigned int *a1)
{
  return *a1;
}

uint64_t tb_message_get_disposition(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t tb_message_measure_subrange(uint64_t a1, unint64_t *a2, void *a3, uint64_t a4)
{
  *a2 = *(void *)(*(void *)(a1 + 80) + 16LL);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  unint64_t v8 = *(void *)(*(void *)(a1 + 80) + 16LL);
  BOOL v9 = v8 >= *a2;
  *a3 = v8 - *a2;
  if (!v9) {
    tb_message_measure_subrange_cold_1();
  }
  return result;
}

uint64_t tb_message_subrange(void *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v4 = (unint64_t *)a1[10];
  unint64_t v5 = v4[3];
  if (v5 < a2) {
    tb_message_subrange_cold_1();
  }
  if (__CFADD__(a2, a3)) {
    tb_message_subrange_cold_2();
  }
  if (a2 + a3 > v5) {
    tb_message_subrange_cold_3();
  }
  unint64_t v6 = *v4;
  unint64_t v7 = *v4 + v5;
  unint64_t v8 = *v4 + a2;
  BOOL v11 = v7 >= v8;
  unint64_t v9 = v7 - v8;
  BOOL v11 = v11 && v6 <= v8 && v9 >= a3;
  if (!v11) {
    __break(0x5519u);
  }
  unint64_t v25 = v8;
  char v26 = 0;
  uint64_t v27 = 0LL;
  unint64_t v28 = a3;
  uint64_t v29 = 0LL;
  int v30 = 0;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v34 = 0LL;
  int v15 = 4;
  char v16 = 2;
  uint64_t v12 = a1[2];
  uint64_t v17 = 0LL;
  uint64_t v18 = v12;
  uint64_t v13 = a1[4];
  uint64_t v19 = 0LL;
  uint64_t v20 = v13;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v23 = 0LL;
  v24 = (uint64_t *)&v25;
  return (*(uint64_t (**)(uint64_t, int *))(a4 + 16))(a4, &v15);
}

uint64_t tb_message_get_client_identifier(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t tb_message_set_client_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t tb_message_set_connection_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  return result;
}

BOOL tb_message_check_connection_identifier(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) == a2;
}

uint64_t tb_message_get_msg_identifier(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t tb_message_set_msg_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t tb_message_get_num_caps(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tb_message_get_capability(uint64_t result, uint64_t a2)
{
  unint64_t v2 = result + 40 + 8 * a2;
  if (v2 < result + 72 && v2 >= result + 40) {
    return *(void *)v2;
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_message_encode_capability(uint64_t result, uint64_t a2)
{
  unint64_t v2 = (void *)(result + 72);
  unint64_t v3 = *(void *)(result + 72);
  if (v3 > 3) {
    return 6LL;
  }
  __int128 v4 = (void *)(result + 40 + 8 * v3);
  if (v4 < v2 && (unint64_t)v4 >= result + 40)
  {
    uint64_t result = 0LL;
    *__int128 v4 = a2;
    void *v2 = v3 + 1;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_decode_capability(uint64_t result, void *a2)
{
  unint64_t v2 = (void *)(result + 72);
  uint64_t v3 = *(void *)(result + 72);
  if (!v3) {
    return 7LL;
  }
  unint64_t v4 = result + 40;
  *a2 = *(void *)(result + 40);
  uint64_t v5 = v3 - 1;
  if (v5)
  {
    unint64_t v6 = (void *)(result + 48);
    uint64_t v7 = v5;
    while (v6 < v2 && (unint64_t)v6 >= v4 && v6 - 1 < v2)
    {
      *(v6 - 1) = *v6;
      ++v6;
      if (!--v7) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    unint64_t v8 = (void *)(v4 + 8 * v5);
    if (v8 < v2 && (unint64_t)v8 >= v4)
    {
      uint64_t result = 0LL;
      *unint64_t v8 = 0LL;
      void *v2 = v5;
      return result;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t tb_message_size_BOOL()
{
  return 1LL;
}

uint64_t tb_message_size_u8()
{
  return 1LL;
}

uint64_t tb_message_size_u16()
{
  return 2LL;
}

uint64_t tb_message_size_u32()
{
  return 4LL;
}

uint64_t tb_message_size_u64()
{
  return 8LL;
}

uint64_t tb_message_size_s8()
{
  return 1LL;
}

uint64_t tb_message_size_s16()
{
  return 2LL;
}

uint64_t tb_message_size_s32()
{
  return 4LL;
}

uint64_t tb_message_size_s64()
{
  return 8LL;
}

uint64_t tb_message_size_f32()
{
  return 4LL;
}

uint64_t tb_message_size_f64()
{
  return 8LL;
}

uint64_t tb_message_size_capability()
{
  return 0LL;
}

uint64_t tb_message_precheck_encoding(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(void *)(result + 80);
  uint64_t v3 = *(void *)(v2 + 16);
  BOOL v4 = __CFADD__(v3, a2);
  unint64_t v5 = v3 + a2;
  if (v4) {
    tb_message_precheck_encoding_cold_1();
  }
  if (v5 > *(void *)(v2 + 24)) {
    tb_message_precheck_encoding_cold_2();
  }
  return result;
}

uint64_t tb_message_encode_BOOL(uint64_t result, char a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 == -1LL) {
    tb_message_encode_BOOL_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 1 > v4) {
    tb_message_encode_BOOL_cold_2();
  }
  unint64_t v5 = *v2;
  unint64_t v6 = (_BYTE *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }

  else
  {
    *unint64_t v6 = a2;
    ++*(void *)(*(void *)(result + 80) + 16LL);
  }

  return result;
}

uint64_t tb_message_raw_encode_BOOL(uint64_t result, char a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_BYTE *)(*v2 + v2[2]);
  if (v4 <= (unint64_t)v5 || v3 > (unint64_t)v5)
  {
    __break(0x5519u);
  }

  else
  {
    _BYTE *v5 = a2;
    ++*(void *)(*(void *)(result + 80) + 16LL);
  }

  return result;
}

uint64_t tb_message_encode_u8(uint64_t result, char a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 == -1LL) {
    tb_message_encode_u8_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 1 > v4) {
    tb_message_encode_u8_cold_2();
  }
  unint64_t v5 = *v2;
  unint64_t v6 = (_BYTE *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }

  else
  {
    *unint64_t v6 = a2;
    ++*(void *)(*(void *)(result + 80) + 16LL);
  }

  return result;
}

uint64_t tb_message_raw_encode_u8(uint64_t result, char a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_BYTE *)(*v2 + v2[2]);
  if (v4 <= (unint64_t)v5 || v3 > (unint64_t)v5)
  {
    __break(0x5519u);
  }

  else
  {
    _BYTE *v5 = a2;
    ++*(void *)(*(void *)(result + 80) + 16LL);
  }

  return result;
}

uint64_t tb_message_encode_u16(uint64_t result, __int16 a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_encode_u16_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 2 > v4) {
    tb_message_encode_u16_cold_2();
  }
  unint64_t v5 = *v2;
  unint64_t v6 = (_WORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 1)
  {
    *unint64_t v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 2LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_encode_u16(uint64_t result, __int16 a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_WORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 1)
  {
    _WORD *v5 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 2LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_encode_u32(uint64_t result, int a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_encode_u32_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 4 > v4) {
    tb_message_encode_u32_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_DWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 3)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 4LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_encode_u32(uint64_t result, int a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_DWORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 3)
  {
    _DWORD *v5 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 4LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_encode_u64(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFF8LL) {
    tb_message_encode_u64_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 8 > v4) {
    tb_message_encode_u64_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (void *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 7)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 8LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_encode_u64(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (void *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 7)
  {
    void *v5 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 8LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_encode_s8(uint64_t result, char a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 == -1LL) {
    tb_message_encode_s8_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 1 > v4) {
    tb_message_encode_s8_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_BYTE *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }

  else
  {
    *BOOL v6 = a2;
    ++*(void *)(*(void *)(result + 80) + 16LL);
  }

  return result;
}

uint64_t tb_message_raw_encode_s8(uint64_t result, char a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_BYTE *)(*v2 + v2[2]);
  if (v4 <= (unint64_t)v5 || v3 > (unint64_t)v5)
  {
    __break(0x5519u);
  }

  else
  {
    _BYTE *v5 = a2;
    ++*(void *)(*(void *)(result + 80) + 16LL);
  }

  return result;
}

uint64_t tb_message_encode_s16(uint64_t result, __int16 a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_encode_s16_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 2 > v4) {
    tb_message_encode_s16_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_WORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 1)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 2LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_encode_s16(uint64_t result, __int16 a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_WORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 1)
  {
    _WORD *v5 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 2LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_encode_s32(uint64_t result, int a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_encode_s32_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 4 > v4) {
    tb_message_encode_s32_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_DWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 3)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 4LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_encode_s32(uint64_t result, int a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_DWORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 3)
  {
    _DWORD *v5 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 4LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_encode_s64(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFF8LL) {
    tb_message_encode_s64_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 8 > v4) {
    tb_message_encode_s64_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (void *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 7)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 8LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_encode_s64(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (void *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 7)
  {
    void *v5 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 8LL;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_encode_f32_v2(uint64_t result, float a2)
{
  uint64_t v2 = 6LL;
  if (fabsf(a2) != INFINITY)
  {
    if (*(_DWORD *)result != 1) {
      tb_message_precheck_encoding_cold_3();
    }
    unint64_t v3 = *(unint64_t **)(result + 80);
    unint64_t v4 = v3[2];
    if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
      tb_message_encode_f32_v2_cold_1();
    }
    unint64_t v5 = v3[3];
    if (v4 + 4 > v5) {
      tb_message_encode_f32_v2_cold_2();
    }
    unint64_t v6 = *v3;
    unint64_t v7 = *v3 + v5;
    unint64_t v8 = (float *)(*v3 + v4);
    if (v7 < (unint64_t)v8 || v6 > (unint64_t)v8 || v7 - (unint64_t)v8 <= 3)
    {
      __break(0x5519u);
      return result;
    }

    uint64_t v2 = 0LL;
    *unint64_t v8 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 4LL;
  }

  return v2;
}

uint64_t tb_message_raw_encode_f32_v2(uint64_t result, float a2)
{
  uint64_t v2 = 6LL;
  if (fabsf(a2) != INFINITY)
  {
    uint64_t v3 = *(void *)(result + 80);
    __int128 v4 = *(_OWORD *)(v3 + 16);
    unint64_t v5 = *(float **)v3;
    unint64_t v6 = (float *)((char *)v5 + v4);
    unint64_t v7 = *((void *)&v4 + 1) - v4;
    if ((char *)v5 + *((void *)&v4 + 1) >= (char *)v5 + (unint64_t)v4)
    {
      BOOL v8 = v5 >= v6;
      BOOL v9 = v5 == v6;
    }

    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }

    if (!v9 && v8)
    {
      BOOL v10 = 0;
      BOOL v11 = 0;
    }

    else
    {
      BOOL v10 = v7 >= 3;
      BOOL v11 = v7 == 3;
    }

    if (v11 || !v10)
    {
      __break(0x5519u);
      return result;
    }

    uint64_t v2 = 0LL;
    *unint64_t v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 4LL;
  }

  return v2;
}

uint64_t tb_message_encode_f64_v2(uint64_t result, double a2)
{
  uint64_t v2 = 6LL;
  if (fabs(a2) != INFINITY)
  {
    if (*(_DWORD *)result != 1) {
      tb_message_precheck_encoding_cold_3();
    }
    uint64_t v3 = *(unint64_t **)(result + 80);
    unint64_t v4 = v3[2];
    if (v4 >= 0xFFFFFFFFFFFFFFF8LL) {
      tb_message_encode_f64_v2_cold_1();
    }
    unint64_t v5 = v3[3];
    if (v4 + 8 > v5) {
      tb_message_encode_f64_v2_cold_2();
    }
    unint64_t v6 = *v3;
    unint64_t v7 = *v3 + v5;
    BOOL v8 = (double *)(*v3 + v4);
    if (v7 < (unint64_t)v8 || v6 > (unint64_t)v8 || v7 - (unint64_t)v8 <= 7)
    {
      __break(0x5519u);
      return result;
    }

    uint64_t v2 = 0LL;
    *BOOL v8 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 8LL;
  }

  return v2;
}

uint64_t tb_message_raw_encode_f64_v2(uint64_t result, double a2)
{
  uint64_t v2 = 6LL;
  if (fabs(a2) != INFINITY)
  {
    uint64_t v3 = *(void *)(result + 80);
    __int128 v4 = *(_OWORD *)(v3 + 16);
    unint64_t v5 = *(double **)v3;
    unint64_t v6 = (double *)((char *)v5 + v4);
    unint64_t v7 = *((void *)&v4 + 1) - v4;
    if ((char *)v5 + *((void *)&v4 + 1) >= (char *)v5 + (unint64_t)v4)
    {
      BOOL v8 = v5 >= v6;
      BOOL v9 = v5 == v6;
    }

    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }

    if (!v9 && v8)
    {
      BOOL v10 = 0;
      BOOL v11 = 0;
    }

    else
    {
      BOOL v10 = v7 >= 7;
      BOOL v11 = v7 == 7;
    }

    if (v11 || !v10)
    {
      __break(0x5519u);
      return result;
    }

    uint64_t v2 = 0LL;
    *unint64_t v6 = a2;
    *(void *)(*(void *)(result + 80) + 16LL) += 8LL;
  }

  return v2;
}

uint64_t tb_message_encode_f32(uint64_t a1, float a2)
{
  uint64_t result = tb_message_encode_f32_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_encode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_encode_f32(uint64_t a1, float a2)
{
  uint64_t result = tb_message_raw_encode_f32_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_raw_encode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_encode_f64(uint64_t a1, double a2)
{
  uint64_t result = tb_message_encode_f64_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_encode_f64_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_encode_f64(uint64_t a1, double a2)
{
  uint64_t result = tb_message_raw_encode_f64_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_raw_encode_f64_cold_1(result);
  }
  return result;
}

void *tb_message_encode_buffer(uint64_t a1, const void *a2, size_t __n)
{
  uint64_t v3 = *(void **)(a1 + 80);
  uint64_t v4 = v3[2];
  if (__CFADD__(v4, __n)) {
    tb_message_encode_buffer_cold_1();
  }
  size_t v5 = v3[3];
  if (v4 + __n > v5) {
    tb_message_encode_buffer_cold_2();
  }
  unint64_t v7 = *v3 + v5;
  uint64_t result = (void *)(*v3 + v4);
  if (v7 >= (unint64_t)result && *v3 <= (unint64_t)result && v7 - (unint64_t)result >= __n)
  {
    uint64_t result = memcpy(result, a2, __n);
    v3[2] += __n;
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_precheck_decoding(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void *)(result + 80);
  unint64_t v3 = *(void *)(v2 + 24);
  if (!v3) {
    tb_message_precheck_decoding_cold_1();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  BOOL v5 = __CFADD__(v4, a2);
  unint64_t v6 = v4 + a2;
  if (v5) {
    tb_message_precheck_decoding_cold_2();
  }
  if (v6 > v3) {
    tb_message_precheck_decoding_cold_3();
  }
  return result;
}

uint64_t tb_message_decode_BOOL(uint64_t result, _BYTE *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_BOOL_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 1;
  if (v4 == -1LL) {
    tb_message_decode_BOOL_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_BOOL_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_BYTE *)(*v2 + v4);
  v2[2] = v5;
  else {
    *a2 = *v8 & 1;
  }
  return result;
}

uint64_t tb_message_raw_decode_BOOL(uint64_t result, _BYTE *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_BYTE *)(*v2 + v5);
  v2[2] = v5 + 1;
  else {
    *a2 = *v6 & 1;
  }
  return result;
}

uint64_t tb_message_decode_u8(uint64_t result, _BYTE *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u8_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 1;
  if (v4 == -1LL) {
    tb_message_decode_u8_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u8_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_BYTE *)(*v2 + v4);
  v2[2] = v5;
  else {
    *a2 = *v8;
  }
  return result;
}

uint64_t tb_message_raw_decode_u8(uint64_t result, _BYTE *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_BYTE *)(*v2 + v5);
  v2[2] = v5 + 1;
  else {
    *a2 = *v6;
  }
  return result;
}

uint64_t tb_message_decode_u16(uint64_t result, _WORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u16_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 2;
  if (v4 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_decode_u16_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u16_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_WORD *)(*v2 + v4);
  v2[2] = v5;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_u16(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_WORD *)(*v2 + v5);
  v2[2] = v5 + 2;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_u32(uint64_t result, _DWORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u32_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 4;
  if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_decode_u32_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u32_cold_3();
  }
  unint64_t v6 = (_DWORD *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_DWORD *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }

  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }

  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }

  else
  {
    BOOL v12 = v9 >= 3;
    BOOL v13 = v9 == 3;
  }

  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_u32(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_DWORD *)(*v2 + v5);
  v2[2] = v5 + 4;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_u64(uint64_t result, void *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u64_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 8;
  if (v4 >= 0xFFFFFFFFFFFFFFF8LL) {
    tb_message_decode_u64_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u64_cold_3();
  }
  unint64_t v6 = (void *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (void *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }

  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }

  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }

  else
  {
    BOOL v12 = v9 >= 7;
    BOOL v13 = v9 == 7;
  }

  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_u64(uint64_t result, void *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (void *)(*v2 + v5);
  v2[2] = v5 + 8;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_s8(uint64_t result, _BYTE *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s8_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 1;
  if (v4 == -1LL) {
    tb_message_decode_s8_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s8_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_BYTE *)(*v2 + v4);
  v2[2] = v5;
  else {
    *a2 = *v8;
  }
  return result;
}

uint64_t tb_message_raw_decode_s8(uint64_t result, _BYTE *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_BYTE *)(*v2 + v5);
  v2[2] = v5 + 1;
  else {
    *a2 = *v6;
  }
  return result;
}

uint64_t tb_message_decode_s16(uint64_t result, _WORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s16_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 2;
  if (v4 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_decode_s16_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s16_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_WORD *)(*v2 + v4);
  v2[2] = v5;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_s16(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_WORD *)(*v2 + v5);
  v2[2] = v5 + 2;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_s32(uint64_t result, _DWORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s32_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 4;
  if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_decode_s32_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s32_cold_3();
  }
  unint64_t v6 = (_DWORD *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_DWORD *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }

  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }

  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }

  else
  {
    BOOL v12 = v9 >= 3;
    BOOL v13 = v9 == 3;
  }

  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_s32(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_DWORD *)(*v2 + v5);
  v2[2] = v5 + 4;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_s64(uint64_t result, void *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s64_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 8;
  if (v4 >= 0xFFFFFFFFFFFFFFF8LL) {
    tb_message_decode_s64_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s64_cold_3();
  }
  unint64_t v6 = (void *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (void *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }

  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }

  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }

  else
  {
    BOOL v12 = v9 >= 7;
    BOOL v13 = v9 == 7;
  }

  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_s64(uint64_t result, void *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (void *)(*v2 + v5);
  v2[2] = v5 + 8;
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_f32_v2(uint64_t result, _DWORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_f32_v2_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 4;
  if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_decode_f32_v2_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_f32_v2_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (float *)(*v2 + v4);
  v2[2] = v5;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 3)
  {
    float v11 = *v8;
    *a2 = *(_DWORD *)v8;
    float v12 = fabsf(v11);
    if (v12 >= INFINITY) {
      unsigned int v13 = 7;
    }
    else {
      unsigned int v13 = 0;
    }
    if (v12 <= INFINITY) {
      return v13;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_decode_f32_v2(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (float *)(*v2 + v5);
  v2[2] = v5 + 4;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 3)
  {
    float v9 = *v6;
    *a2 = *(_DWORD *)v6;
    float v10 = fabsf(v9);
    if (v10 >= INFINITY) {
      unsigned int v11 = 7;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v10 <= INFINITY) {
      return v11;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_decode_f64_v2(uint64_t result, void *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_f64_v2_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 8;
  if (v4 >= 0xFFFFFFFFFFFFFFF8LL) {
    tb_message_decode_f64_v2_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_f64_v2_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (double *)(*v2 + v4);
  v2[2] = v5;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 7)
  {
    double v11 = *v8;
    *a2 = *(void *)v8;
    double v12 = fabs(v11);
    if (v12 >= INFINITY) {
      unsigned int v13 = 7;
    }
    else {
      unsigned int v13 = 0;
    }
    if (v12 <= INFINITY) {
      return v13;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_raw_decode_f64_v2(uint64_t result, void *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (double *)(*v2 + v5);
  v2[2] = v5 + 8;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 7)
  {
    double v9 = *v6;
    *a2 = *(void *)v6;
    double v10 = fabs(v9);
    if (v10 >= INFINITY) {
      unsigned int v11 = 7;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v10 <= INFINITY) {
      return v11;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t tb_message_decode_f32(uint64_t a1, _DWORD *a2)
{
  uint64_t result = tb_message_decode_f32_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_decode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_decode_f32(uint64_t a1, _DWORD *a2)
{
  uint64_t result = tb_message_raw_decode_f32_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_raw_decode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_decode_f64(uint64_t a1, void *a2)
{
  uint64_t result = tb_message_decode_f64_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_decode_f64_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_decode_f64(uint64_t a1, void *a2)
{
  uint64_t result = tb_message_raw_decode_f64_v2(a1, a2);
  if ((_DWORD)result) {
    tb_message_raw_decode_f64_cold_1(result);
  }
  return result;
}

_DWORD *tb_endpoint_create(int a1, int a2)
{
  uint64_t result = calloc(1uLL, 0x60uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  *uint64_t result = a1;
  result[1] = a2;
  *((_BYTE *)result + 40) = 1;
  return result;
}

_DWORD *tb_endpoint_create_with_data(int a1, uint64_t a2, int a3, const void *a4)
{
  BOOL v8 = calloc(1uLL, 0x60uLL);
  if (!v8) {
    _tb_null_transport_send_message_cold_1();
  }
  double v9 = v8;
  *BOOL v8 = a1;
  v8[1] = a3;
  *((_BYTE *)v8 + 40) = 1;
  *((void *)v8 + 4) = a2;
  if (a4)
  {
    *((void *)v8 + 2) = _tb_endpoint_block_destructor;
    *((void *)v8 + 3) = _Block_copy(a4);
  }

  return v9;
}

void _tb_endpoint_block_destructor(void (**a1)(void))
{
  if (a1)
  {
    a1[2]();
    _Block_release(a1);
  }
}

_DWORD *tb_endpoint_create_with_value(int a1, uint64_t a2, int a3)
{
  uint64_t result = calloc(1uLL, 0x60uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  *uint64_t result = a1;
  result[1] = a3;
  *((void *)result + 4) = a2;
  *((_BYTE *)result + 40) = 1;
  return result;
}

uint64_t tb_endpoint_create_with_value_static(uint64_t a1, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  *(void *)(a1 + 32) = a3;
  return 0LL;
}

void tb_endpoint_destruct(void *a1)
{
  uint64_t v2 = (void (*)(void, void))a1[2];
  if (v2) {
    v2(a1[3], a1[4]);
  }
  if (*((_BYTE *)a1 + 40)) {
    free(a1);
  }
}

uint64_t tb_endpoint_get_data(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t tb_endpoint_get_value(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t tb_endpoint_get_type(unsigned int *a1)
{
  return *a1;
}

uint64_t tb_endpoint_get_options(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t tb_endpoint_get_interface_identifier(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t tb_endpoint_set_interface_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  return result;
}

uint64_t tb_connection_get_transport(uint64_t a1)
{
  return *(void *)a1;
}

void _tb_connection_create_transport_for_endpoint(unsigned int *a1, int a2)
{
  int type = tb_endpoint_get_type(a1);
  switch(type)
  {
    case 1:
      tb_null_transport_create();
      break;
    case 2:
      if (a2 != 1)
      {
        if (!a2)
        {
          unint64_t v5 = tb_mach_client_transport_create((uint64_t)a1);
          break;
        }

        goto LABEL_26;
      }

      unint64_t v5 = tb_mach_service_transport_create((uint64_t)a1);
      break;
    case 0:
      goto LABEL_26;
    default:
      if (!a2 && (type & 0xFFFFFFFE) == 4)
      {
        unint64_t v5 = tb_eve_client_transport_create((uint64_t)a1);
        break;
      }

      switch(type)
      {
        case 10:
          if (a2)
          {
            if (a2 != 1) {
              goto LABEL_26;
            }
            unint64_t v5 = tb_delegated_service_transport_create((uint64_t)a1);
          }

          else
          {
            unint64_t v5 = tb_delegated_client_transport_create((uint64_t)a1);
          }

          break;
        case 9:
          if (a2)
          {
            if (a2 != 1) {
              goto LABEL_26;
            }
            unint64_t v5 = tb_unix_service_transport_create_with_endpoint((uint64_t)a1);
          }

          else
          {
            unint64_t v5 = tb_unix_client_transport_create_with_endpoint((uint64_t)a1);
          }

          break;
        case 8:
          unint64_t v5 = tb_darwin_client_transport_create((uint64_t)a1);
          goto LABEL_16;
        default:
LABEL_26:
          __break(1u);
          return;
      }

      break;
  }

LABEL_16:
  if (!v5) {
    goto LABEL_26;
  }
}

      __break(1u);
      goto LABEL_17;
    }

void *_tb_connection_create(uint64_t a1)
{
  uint64_t v2 = calloc(1uLL, 0x28uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  unint64_t v3 = v2;
  void *v2 = a1;
  v2[4] = tb_list_create();
  return v3;
}

void _tb_connection_destruct(uint64_t a1)
{
}

void *tb_service_connection_create(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = _tb_connection_create(a1);
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 0x40000000LL;
  aBlock[2] = __tb_service_connection_create_block_invoke;
  aBlock[3] = &unk_18A3AB0D8;
  aBlock[6] = v4 + 5;
  aBlock[7] = v4;
  aBlock[8] = a1;
  aBlock[4] = a2;
  aBlock[5] = v4;
  tb_transport_set_message_handler(a1, aBlock);
  return v4;
}

unint64_t __tb_service_connection_create_block_invoke(void *a1, unsigned int *a2)
{
  uint64_t v17 = a2;
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  if (!transport_buffer) {
    __tb_service_connection_create_block_invoke_cold_1();
  }
  if (!*(void *)transport_buffer) {
    __tb_service_connection_create_block_invoke_cold_2();
  }
  __int16 v5 = *(_WORD *)(transport_buffer + 42);
  if ((v5 & 4) != 0)
  {
    unint64_t result = a1[5];
    if (!result || result < a1[6] && result >= a1[7])
    {
      int message = tb_reply_splitter_next_message((uint64_t *)result, (uint64_t)a2, (uint64_t)&v17, a1[8]);
      uint64_t v15 = (uint64_t)v17;
LABEL_25:
      if (message) {
        return 0LL;
      }
      else {
        return v15;
      }
    }
  }

  else
  {
    if ((v5 & 1) != 0)
    {
      unint64_t result = a1[5];
      if (result && (result >= a1[6] || result < a1[7])) {
        goto LABEL_34;
      }
      accumulator_list = (pthread_mutex_t *)_get_accumulator_list(result);
      BOOL v8 = tb_message_accumulator_accumulate(accumulator_list, (uint64_t)a2);
      if (!v8) {
        return 0LL;
      }
      tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)v8);
    }

    unint64_t result = a1[4];
    unint64_t v9 = a1[5];
    if (!v9 || v9 < a1[6] && v9 >= a1[7])
    {
      uint64_t v10 = (*(uint64_t (**)(void))(result + 16))();
      uint64_t v11 = v10;
      uint64_t v16 = v10;
      if (!v10) {
        return v11;
      }
      uint64_t v12 = tb_message_get_transport_buffer(v10);
      unint64_t result = tb_message_splitter_split_required(a1[8], *(void *)(v12 + 24));
      if (!(_DWORD)result) {
        return v11;
      }
      unsigned int v13 = (uint64_t *)a1[5];
      if (!v13 || (unint64_t)v13 < a1[6] && (unint64_t)v13 >= a1[7])
      {
        int message = tb_reply_splitter_add_reply(v11, &v16, v13);
        uint64_t v15 = v16;
        goto LABEL_25;
      }
    }
  }

LABEL_34:
  __break(0x5519u);
  return result;
}

uint64_t _get_accumulator_list(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!result) {
    _get_accumulator_list_cold_1();
  }
  return result;
}

void *tb_service_connection_create_with_endpoint(unsigned int *a1, uint64_t a2)
{
  __int16 v5 = tb_service_connection_create(v4, a2);
  tb_endpoint_destruct(a1);
  return v5;
}

double _tb_connection_transport_for_endpoint_inplace(unsigned int *a1, uint64_t a2)
{
  int type = tb_endpoint_get_type(a1);
  if (type)
  {
    if (type != 1) {
      _tb_connection_transport_for_endpoint_inplace_cold_1();
    }
    *(void *)&double result = tb_null_transport_create_inplace_with_endpoint((uint64_t)a1, a2).n128_u64[0];
  }

  return result;
}

uint64_t tb_service_connection_activate(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
    }
  }

  return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t _tb_connection_observe_activate_service(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    double result = *(void *)(v1 + 16);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

void *tb_client_connection_create_with_endpoint(unsigned int *a1)
{
  uint64_t v3 = _tb_connection_create(v2);
  tb_endpoint_destruct(a1);
  return v3;
}

uint64_t tb_client_connection_create_with_endpoint_static(uint64_t *a1, uint64_t a2, unsigned int *a3)
{
  *(void *)(a2 + 224) = 0LL;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  _tb_connection_transport_for_endpoint_inplace(a3, a2);
  *a1 = a2;
  return 0LL;
}

uint64_t tb_client_connection_activate(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
    }
  }

  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v2);
}

uint64_t _tb_connection_observe_activate_client(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    double result = *(void *)(v1 + 8);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

uint64_t tb_connection_send_query(uint64_t *a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  if (*(_DWORD *)a2 != 2) {
    tb_connection_send_query_cold_4();
  }
  if (*(_BYTE *)(a2 + 4) != 1) {
    tb_connection_send_query_cold_3();
  }
  tb_message_set_state((_DWORD *)a2, 3);
  uint64_t v8 = *a1;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  uint64_t v10 = transport_buffer;
  if ((a4 & 2) == 0) {
    *(_WORD *)(transport_buffer + 42) |= 0x10u;
  }
  if (tb_message_splitter_split_required(v8, *(void *)(transport_buffer + 24)))
  {
    uint64_t v11 = tb_message_splitter_send((uint64_t)a1, v8, a2, a3, a4);
  }

  else
  {
    unsigned int v13 = (void *)a1[1];
    if (v13 && *v13) {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))(*v13 + 16LL))( *v13,  v8,  a2,  a3,  a4);
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, unint64_t))v8)(v8, a2, a3, a4);
  }

  uint64_t v12 = v11;
  if (!(_DWORD)v11)
  {
    uint64_t v12 = (*(_WORD *)(v10 + 42) & 8) >> 1;
    if ((a4 & 2) != 0 && (*(_WORD *)(v10 + 42) & 8) == 0)
    {
      if (!a3 || !*a3) {
        return 4LL;
      }
      tb_message_set_state((_DWORD *)*a3, 4);
      tb_message_set_disposition(*a3, 2);
      if ((*(_WORD *)(tb_message_get_transport_buffer(*a3) + 42) & 1) != 0)
      {
        uint64_t msg_identifier = tb_message_get_msg_identifier(*a3);
        if (!msg_identifier)
        {
          uint64_t msg_identifier = mach_absolute_time();
          tb_message_set_msg_identifier(*a3, msg_identifier);
        }

        accumulator_list = (pthread_mutex_t *)_get_accumulator_list((uint64_t)a1);
        uint64_t v16 = tb_message_accumulator_accumulate(accumulator_list, *a3);
        uint64_t v17 = calloc(1uLL, 0x58uLL);
        if (!v17) {
          _tb_null_transport_send_message_cold_1();
        }
        uint64_t v18 = v17;
        uint64_t v29 = v17;
        uint64_t v19 = calloc(1uLL, 0x68uLL);
        if (!v19) {
          _tb_null_transport_send_message_cold_1();
        }
        uint64_t v20 = v19;
        uint64_t v21 = _tb_connection_message_construct(a1, 0, (uint64_t)v18, (uint64_t)v19, 0LL, 0LL);
        if ((_DWORD)v21)
        {
          uint64_t v12 = v21;
          free(v20);
          __int128 v22 = v18;
LABEL_26:
          free(v22);
          return v12;
        }

        if (!v16)
        {
          while (1)
          {
            tb_message_complete((uint64_t)v29);
            v20[21] |= 4u;
            tb_message_set_state(v29, 3);
            v24 = (void *)a1[1];
            if (v24 && *v24) {
              (*(void (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))(*v24 + 16LL))( *v24,  v8,  a2,  a3,  a4);
            }
            uint64_t v25 = (*(uint64_t (**)(uint64_t, void *, void **, uint64_t))v8)(v8, v29, &v29, 2LL);
            if ((_DWORD)v25)
            {
              uint64_t v12 = v25;
              _tb_connection_message_destruct(a1, (uint64_t)v29);
              free(v20);
              __int128 v22 = v29;
              goto LABEL_26;
            }

            tb_message_set_msg_identifier((uint64_t)v29, msg_identifier);
            uint64_t v23 = tb_message_accumulator_accumulate(accumulator_list, (uint64_t)v29);
            uint64_t v18 = v29;
            if (v23) {
              break;
            }
            _tb_message_reset(a1, v29, 0, 0LL, 0LL);
          }

          uint64_t v16 = v23;
        }

        _tb_connection_message_destruct(a1, (uint64_t)v18);
        free(v20);
        free(v29);
        uint64_t v26 = tb_message_get_transport_buffer(*a3);
        (*(void (**)(void))(v8 + 32))();
        tb_transport_initialize_message_buffer(v26);
        uint64_t v27 = v16[3];
        *(void *)uint64_t v26 = *v16;
        *(void *)(v26 + 24) = v27;
        *(_BYTE *)(v26 + 40) = 1;
        *(_WORD *)(v26 + 42) = *((_WORD *)v16 + 21);
        free(v16);
      }

      return 0LL;
    }
  }

  return v12;
}

uint64_t _tb_connection_observe_send_message(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 8);
  if (v1)
  {
    double result = *v1;
    if (*v1) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

uint64_t tb_client_connection_message_construct(uint64_t *a1, uint64_t a2, uint64_t a3, size_t a4, uint64_t a5)
{
  return _tb_connection_message_construct(a1, 0, a2, a3, a4, a5);
}

uint64_t tb_client_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  return 0LL;
}

uint64_t tb_client_connection_message_reset(uint64_t *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  return _tb_message_reset(a1, a2, 0, a3, a4);
}

uint64_t tb_connection_alloc_init_owned_transport_message_buffer(uint64_t a1, size_t a2)
{
  uint64_t v4 = (char *)calloc(a2, 1uLL);
  if (v4 > &v4[a2])
  {
    __break(0x5519u);
LABEL_5:
    _tb_null_transport_send_message_cold_1();
  }

  if (!v4) {
    goto LABEL_5;
  }
  *(void *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 1;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  return 0LL;
}

void tb_connection_dealloc_destruct_owned_transport_message_buffer(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40)) {
    tb_connection_dealloc_destruct_owned_transport_message_buffer_cold_1();
  }
  free(*(void **)a1);
  *(void *)a1 = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_WORD *)(a1 + 40) = 256;
}

uint64_t _tb_message_buffer_reset(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  BOOL v10 = tb_message_splitter_split_required(a2, a4);
  BOOL v11 = v10;
  if (*(_BYTE *)(a3 + 40))
  {
    tb_connection_dealloc_destruct_owned_transport_message_buffer(a3);
    if (!v11)
    {
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(a2 + 24))(a4, a5, a3);
      goto LABEL_13;
    }
  }

  else
  {
    if (!v10)
    {
      tb_transport_reset_message_buffer(a3);
      uint64_t v13 = *(void *)(a1 + 8);
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + 24);
        if (v14) {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v14 + 16))(v14, a2, a3, a5, a4);
        }
      }

      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 40))(a3, a5, a4);
LABEL_13:
      if ((_DWORD)result) {
        return result;
      }
      return 0LL;
    }

    (*(void (**)(uint64_t))(a2 + 32))(a3);
  }

  tb_connection_alloc_init_owned_transport_message_buffer(a3, a4);
  return 0LL;
}

uint64_t _tb_connection_observe_reset_message(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    uint64_t result = *(void *)(v1 + 24);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

uint64_t _tb_message_reset(uint64_t *a1, _DWORD *a2, int a3, unint64_t a4, uint64_t a5)
{
  if (a3 == 1) {
    char v10 = 2;
  }
  else {
    char v10 = 1;
  }
  tb_message_set_disposition((uint64_t)a2, v10);
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  return _tb_message_buffer_reset((uint64_t)a1, *a1, transport_buffer, a4, a5);
}

uint64_t tb_transport_get_context(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

__n128 tb_transport_message_buffer_copy(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  return result;
}

uint64_t tb_service_connection_message_construct(uint64_t *a1, uint64_t a2, uint64_t a3, size_t a4, uint64_t a5)
{
  return _tb_connection_message_construct(a1, 1, a2, a3, a4, a5);
}

uint64_t _tb_connection_message_construct(uint64_t *a1, int a2, uint64_t a3, uint64_t a4, size_t a5, uint64_t a6)
{
  uint64_t v12 = *a1;
  if (!tb_transport_supports_multipart_messages(*a1))
  {
    if (!*(_BYTE *)(a4 + 8))
    {
LABEL_6:
      uint64_t result = (*(uint64_t (**)(size_t, uint64_t, uint64_t))(v12 + 24))(a5, a6, a4);
      if ((_DWORD)result) {
        return result;
      }
      goto LABEL_7;
    }

LABEL_13:
    _tb_connection_message_construct_cold_1();
  }

  unint64_t tx_buffer_size = tb_transport_get_tx_buffer_size(v12);
  if (*(_BYTE *)(a4 + 8)) {
    goto LABEL_13;
  }
  if (tx_buffer_size >= a5) {
    goto LABEL_6;
  }
  tb_connection_alloc_init_owned_transport_message_buffer(a4, a5);
LABEL_7:
  if (a2 == 1) {
    char v15 = 2;
  }
  else {
    char v15 = 1;
  }
  uint64_t result = tb_message_construct(a3, a4, v15);
  if (!(_DWORD)result)
  {
    tb_message_set_connection_identifier(a3, (uint64_t)a1);
    return 0LL;
  }

  return result;
}

    __break(1u);
    goto LABEL_14;
  }

  *(void *)&v24 = 0LL;
  *((void *)&v24 + 1) = 0xE000000000000000LL;
  uint64_t v21 = v15;
  sub_1894A2358();
  sub_1894A21FC();
  __int128 v22 = v21;
  sub_189486E64();
  sub_1894A2334();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  uint64_t v23 = v8;
  sub_1894A2394();
LABEL_20:
  sub_1894A23AC();
  __break(1u);
}

      __break(1u);
LABEL_14:
      __break(1u);
      goto LABEL_18;
    }

    uint64_t result = sub_1894924A8(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = sub_1894A2388();
  if (!v8)
  {
    sub_1894A23A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1894A23E8();
    __break(1u);
    return result;
  }

uint64_t tb_service_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  return 0LL;
}

uint64_t _tb_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  if (*(_BYTE *)(transport_buffer + 8)) {
    _tb_connection_message_destruct_cold_1();
  }
  if (*(_BYTE *)(transport_buffer + 40)) {
    tb_connection_dealloc_destruct_owned_transport_message_buffer(transport_buffer);
  }
  else {
    (*(void (**)(void))(v3 + 32))();
  }
  return tb_message_destruct(a2);
}

uint64_t tb_service_connection_message_configure_reply( uint64_t *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  return _tb_message_reset(a1, a2, 1, a3, a4);
}

void *_tb_connection_init_observers(void *result)
{
  if (!result[1])
  {
    uint64_t v1 = result;
    uint64_t result = calloc(1uLL, 0x20uLL);
    if (!result) {
      _tb_null_transport_send_message_cold_1();
    }
    v1[1] = result;
  }

  return result;
}

uint64_t _tb_connection_get_observers(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

double _tb_connection_clear_observers(uint64_t a1)
{
  uint64_t v1 = *(_OWORD **)(a1 + 8);
  if (v1)
  {
    double result = 0.0;
    *uint64_t v1 = 0u;
    v1[1] = 0u;
  }

  return result;
}

uint64_t tb_mach_transport_get_tx_buffer_size()
{
  return 15360LL;
}

uint64_t (**tb_mach_service_transport_create(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = (ipc_space_t *)a1;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  mach_port_name_t name = 0;
  switch(tb_endpoint_get_options(a1))
  {
    case 0u:
    case 3u:
      goto LABEL_6;
    case 1u:
      data = (const char *)tb_endpoint_get_data((uint64_t)v1);
      strncpy(__dst, data, 0x7FuLL);
      __dst[127] = 0;
      uint64_t v1 = (ipc_space_t *)MEMORY[0x1895FBBE0];
      if (!mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, &name)
        && !mach_port_insert_right(*v1, name, name, 0x14u)
        && !task_get_special_port(*v1, 4, &v4)
        && !bootstrap_register(v4, __dst, name))
      {
        goto LABEL_8;
      }

LABEL_6:
      __break(1u);
LABEL_7:
      mach_port_name_t name = tb_endpoint_get_value((uint64_t)v1);
LABEL_8:
      double result = _tb_mach_transport_create();
      *((_DWORD *)result[12] + 4) = name;
      return result;
    case 2u:
      goto LABEL_7;
    default:
      goto LABEL_8;
  }

uint64_t (**_tb_mach_transport_create())(uint64_t a1)
{
  uint64_t v0 = (uint64_t (**)(uint64_t))calloc(1uLL, 0xE8uLL);
  if (!v0) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v1 = v0;
  uint64_t v2 = calloc(1uLL, 0x18uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v3 = v2;
  v1[4] = (uint64_t (*)(uint64_t))_tb_mach_transport_destruct_message_buffer;
  v1[5] = (uint64_t (*)(uint64_t))_tb_mach_transport_message_buffer_reset;
  v1[12] = (uint64_t (*)(uint64_t))v2;
  *uint64_t v1 = _tb_mach_transport_send_message;
  v1[1] = (uint64_t (*)(uint64_t))_tb_mach_transport_activate;
  v1[2] = (uint64_t (*)(uint64_t))_tb_mach_transport_activate;
  v1[3] = (uint64_t (*)(uint64_t))_tb_mach_transport_construct_message_buffer;
  v1[6] = (uint64_t (*)(uint64_t))_tb_mach_transport_supports_multipart_messages;
  v1[7] = (uint64_t (*)(uint64_t))tb_mach_transport_get_tx_buffer_size;
  v1[8] = (uint64_t (*)(uint64_t))_tb_mach_transport_destruct;
  v2[2] = 0LL;
  void *v2 = dispatch_queue_create("com.apple.tightbeam.mach_transport.q", 0LL);
  v3[1] = dispatch_mach_create();
  return v1;
}

uint64_t (**tb_mach_client_transport_create(uint64_t a1))(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  mach_port_t sp = 0;
  switch(tb_endpoint_get_options(a1))
  {
    case 0u:
    case 2u:
      goto LABEL_4;
    case 1u:
      data = (const char *)tb_endpoint_get_data(a1);
      strncpy(__dst, data, 0x7FuLL);
      __dst[127] = 0;
      if (!task_get_special_port(*MEMORY[0x1895FBBE0], 4, &bp) && !bootstrap_look_up(bp, __dst, &sp)) {
        goto LABEL_6;
      }
LABEL_4:
      __break(1u);
LABEL_5:
      mach_port_t sp = tb_endpoint_get_value(a1);
LABEL_6:
      double result = _tb_mach_transport_create();
      *((_DWORD *)result[12] + 5) = sp;
      return result;
    case 3u:
      goto LABEL_5;
    default:
      goto LABEL_6;
  }

uint64_t _tb_mach_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = (char *)calloc(a1, 1uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_null_transport_send_message_cold_1();
  }

  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(_BYTE *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0LL;
  *(void *)(a3 + 48) = 0LL;
  return 0LL;
}

void _tb_mach_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t _tb_mach_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  return _tb_mach_transport_construct_message_buffer(a3, v5, a1);
}

uint64_t _tb_mach_transport_send_message(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (*v1 != 3) {
    _tb_mach_transport_send_message_cold_1();
  }
  char v4 = v3;
  uint64_t v5 = v2;
  uint64_t v6 = (uint64_t)v1;
  bzero(v12, 0x3C18uLL);
  uint64_t transport_buffer = tb_message_get_transport_buffer(v6);
  v12[3] = *(unsigned __int16 *)(transport_buffer + 42);
  unint64_t v13 = *(void *)(transport_buffer + 24);
  if (v13 >= 0x3C01) {
    __break(0x5519u);
  }
  __memcpy_chk();
  uint64_t v8 = (dispatch_object_s *)dispatch_mach_msg_create();
  if ((v4 & 2) != 0)
  {
    uint64_t v9 = dispatch_mach_send_and_wait_for_reply();
    char v10 = (dispatch_object_s *)v9;
    if (v5 && v9)
    {
      _tb_unpack_dispatch_mach_msg_to_tb_message();
      uint64_t *v5 = v6;
      dispatch_release(v10);
    }

    else if (v5 && !v9)
    {
      return 4LL;
    }
  }

  else
  {
    dispatch_mach_send();
  }

  dispatch_release(v8);
  return 0LL;
}

uint64_t _tb_mach_transport_activate()
{
  return 0LL;
}

void _tb_mach_transport_destruct(void *a1)
{
  uint64_t context = tb_transport_get_context((uint64_t)a1);
  mach_port_name_t v3 = *(_DWORD *)(context + 16);
  char v4 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  if (v3)
  {
    mach_port_deallocate(*MEMORY[0x1895FBBE0], v3);
    *(_DWORD *)(context + 16) = 0;
  }

  mach_port_name_t v5 = *(_DWORD *)(context + 20);
  if (v5)
  {
    mach_port_deallocate(*v4, v5);
    *(_DWORD *)(context + 20) = 0;
  }

  dispatch_mach_cancel();
  dispatch_release(*(dispatch_object_t *)context);
  free((void *)context);
  free(a1);
}

uint64_t _tb_mach_transport_supports_multipart_messages()
{
  return 1LL;
}

void ___tb_mach_transport_create_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    mach_port_name_t v3 = calloc(1uLL, 0x58uLL);
    if (!v3) {
      goto LABEL_18;
    }
    char v4 = v3;
    mach_port_name_t v5 = (void **)calloc(1uLL, 0x68uLL);
    if (!v5) {
      _tb_null_transport_send_message_cold_1();
    }
    uint64_t v6 = v5;
    uint64_t msg = dispatch_mach_msg_get_msg();
    if (_tb_mach_transport_construct_message_buffer(*(void *)(msg + 24), v8, (uint64_t)v6)
      || tb_message_construct((uint64_t)v4, (uint64_t)v6, 1))
    {
LABEL_17:
      __break(1u);
LABEL_18:
      _tb_null_transport_send_message_cold_1();
    }

    _tb_unpack_dispatch_mach_msg_to_tb_message();
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72LL);
    if (!v9)
    {
      tb_message_destruct((uint64_t)v4);
      free(v6);
      free(v4);
      return;
    }

    char v10 = (_DWORD *)(*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v4);
    if (v10)
    {
      BOOL v11 = v10;
      if (*v10 != 2) {
        ___tb_mach_transport_create_block_invoke_cold_3();
      }
      uint64_t v12 = dispatch_mach_msg_get_msg();
      uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)v11);
      unint64_t v14 = *(void *)(transport_buffer + 24);
      if (v14 >= 0x3C01) {
        goto LABEL_17;
      }
      uint64_t v15 = transport_buffer;
      *(_DWORD *)uint64_t v12 = 18;
      *(_DWORD *)(v12 + 12) = 0;
      *(void *)(v12 + 24) = v14;
      bzero((void *)(v12 + 32), 0x3C00uLL);
      size_t v16 = *(void *)(v15 + 24);
      if (v16 > 0x3C00)
      {
        __break(0x5519u);
        return;
      }

      memcpy((void *)(v12 + 32), *(const void **)v15, v16);
      *(_DWORD *)(v12 + 20) = *(unsigned __int16 *)(v15 + 42);
      dispatch_mach_send();
      *BOOL v11 = 3;
      tb_message_complete((uint64_t)v11);
    }

    free(*v6);
    *uint64_t v6 = 0LL;
    v6[6] = 0LL;
    v6[3] = 0LL;
    v6[4] = 0LL;
    v6[2] = 0LL;
    *((_BYTE *)v6 + 41) = 1;
    tb_message_destruct((uint64_t)v4);
    free(v6);
    free(v4);
  }

  else if (a2 == 4)
  {
    goto LABEL_17;
  }

uint64_t _tb_unpack_dispatch_mach_msg_to_tb_message()
{
  uint64_t result = dispatch_mach_msg_get_msg();
  __break(1u);
  __break(0x5519u);
  return result;
}

void *tb_darwin_client_transport_create(uint64_t a1)
{
  uint64_t v2 = calloc(1uLL, 0xE8uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  mach_port_name_t v3 = v2;
  char v4 = calloc(1uLL, 0x10uLL);
  if (!v4) {
    _tb_null_transport_send_message_cold_1();
  }
  mach_port_name_t v5 = v4;
  v3[4] = _tb_darwin_transport_destruct_message_buffer;
  v3[5] = _tb_darwin_transport_message_buffer_reset;
  *mach_port_name_t v3 = _tb_darwin_transport_send_message;
  v3[1] = _tb_darwin_client_transport_activate;
  v3[2] = _tb_darwin_service_transport_activate;
  v3[3] = _tb_darwin_transport_construct_message_buffer;
  v3[12] = v4;
  v3[6] = _tb_darwin_transport_supports_multipart_messages;
  v3[7] = _tb_darwin_transport_get_tx_buffer_size;
  v3[8] = _tb_darwin_transport_destruct;
  data = (_OWORD *)tb_endpoint_get_data(a1);
  if (data) {
    _OWORD *v5 = *data;
  }
  return v3;
}

uint64_t _tb_darwin_transport_construct_message_buffer(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 > 0x1F0) {
    return 12LL;
  }
  uint64_t result = (uint64_t)calloc(1uLL, 0x200uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v6 = result;
  *(void *)(a3 + 48) = result;
  if (a1 >= 0x1B1)
  {
    __break(0x5519u);
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)a3 = v6 + 16;
    *(_BYTE *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0LL;
    *(void *)(a3 + 24) = a1;
    *(void *)(a3 + 32) = 0LL;
    *(_BYTE *)(a3 + 41) = 0;
  }

  return result;
}

void _tb_darwin_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t _tb_darwin_transport_message_buffer_reset(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 > 0x1F0) {
    return 12LL;
  }
  *(void *)(result + 16) = 0LL;
  if (*(void *)result <= *(void *)result + a3)
  {
    uint64_t v3 = 0LL;
    *(void *)(result + 24) = a3;
    return v3;
  }

  __break(0x5519u);
  return result;
}

uint64_t _tb_darwin_transport_send_message(uint64_t a1, _DWORD *a2, void *a3, char a4)
{
  if (*a2 != 3) {
    _tb_mach_transport_send_message_cold_1();
  }
  unint64_t v8 = (*(_DWORD *)(tb_message_get_transport_buffer((uint64_t)a2) + 24) + 7);
  unint64_t v11 = (v8 >> 3) & 0x3F | ((unint64_t)*(unsigned __int16 *)(tb_message_get_transport_buffer((uint64_t)a2) + 42) << 16);
  tb_transport_get_context(a1);
  if ((a4 & 2) == 0) {
    return 0LL;
  }
  tb_message_configure_received((uint64_t)a2, 2);
  uint64_t result = tb_message_get_transport_buffer((uint64_t)a2);
  if (!result) {
    return 4LL;
  }
  unint64_t v10 = 8 * (v11 & 0x3F);
  if (v10 > 0x1F0) {
    return 4LL;
  }
  *(void *)(result + 16) = 0LL;
  if (*(void *)result > *(void *)result + v10)
  {
    __break(0x5519u);
  }

  else
  {
    *(void *)(result + 24) = v10;
    *(_WORD *)(result + 42) = WORD1(v11);
    if (!a3) {
      return 0LL;
    }
    uint64_t result = 0LL;
    *a3 = a2;
  }

  return result;
}

uint64_t _tb_darwin_client_transport_activate()
{
  return 0LL;
}

uint64_t _tb_darwin_service_transport_activate()
{
  return 0LL;
}

uint64_t _tb_darwin_transport_supports_multipart_messages()
{
  return _config_supports_multipart;
}

uint64_t _tb_darwin_transport_get_tx_buffer_size()
{
  return 400LL;
}

void _tb_darwin_transport_destruct(void *a1)
{
  uint64_t context = (void *)tb_transport_get_context((uint64_t)a1);
  free(context);
  free(a1);
}

uint64_t tb_delegated_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_name_t v5 = (char *)calloc(a1, 1uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_null_transport_send_message_cold_1();
  }

  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0LL;
  *(void *)(a3 + 48) = 0LL;
  *(_BYTE *)(a3 + 41) = 0;
  return 0LL;
}

void tb_delegated_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t tb_delegated_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  return tb_delegated_transport_construct_message_buffer(a3, v5, a1);
}

_OWORD *tb_delegated_service_transport_create(uint64_t a1)
{
  uint64_t v2 = calloc(1uLL, 0xE8uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v3 = v2;
  __int128 v4 = *(_OWORD *)&off_18C505DE8;
  _OWORD *v2 = _tb_delegated_transport_vtable;
  v2[1] = v4;
  __int128 v5 = unk_18C505E08;
  v2[2] = xmmword_18C505DF8;
  v2[3] = v5;
  *((void *)v2 + 8) = _tb_delegated_service_transport_destruct;
  *((void *)v2 + 12) = _tb_delegated_service_transport_create(a1);
  return v3;
}

_OWORD *tb_delegated_client_transport_create(uint64_t a1)
{
  uint64_t v2 = calloc(1uLL, 0xE8uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v3 = v2;
  __int128 v4 = *(_OWORD *)&off_18C505DE8;
  _OWORD *v2 = _tb_delegated_transport_vtable;
  v2[1] = v4;
  __int128 v5 = unk_18C505E08;
  v2[2] = xmmword_18C505DF8;
  v2[3] = v5;
  *((void *)v2 + 8) = _tb_delegated_client_transport_destruct;
  *((void *)v2 + 12) = _tb_delegated_client_transport_create(a1);
  return v3;
}

unint64_t tb_exclave_notification_create(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t result = (unint64_t)calloc(1uLL, 0x20uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  *(void *)unint64_t result = -1LL;
  *(void *)(result + 8) = a2;
  if (result < result + 32)
  {
    uint64_t v5 = 0LL;
    *a3 = result;
    return v5;
  }

  __break(0x5519u);
  return result;
}

uint64_t tb_exclave_notification_register(uint64_t a1, dispatch_queue_s *object, void *a3)
{
  *(void *)(a1 + 24) = object;
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895F8B30], *(void *)a1, *(void *)(a1 + 8), object);
  if (!v6) {
    return 12LL;
  }
  uint64_t v7 = v6;
  dispatch_retain(v6);
  *(void *)(a1 + 16) = v7;
  dispatch_source_set_event_handler(v7, a3);
  dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  return 0LL;
}

void tb_exclave_notification_unregister(uint64_t a1, void *a2)
{
}

uint64_t _add_accumulator(pthread_mutex_t *a1, uint64_t *a2)
{
  uint64_t result = tb_list_add(a1, *a2, (uint64_t)a2, &__block_literal_global_0);
  if ((result & 1) == 0) {
    _add_accumulator_cold_1();
  }
  return result;
}

void ___add_accumulator_block_invoke(uint64_t a1, void **a2)
{
}

void **tb_message_accumulator_accumulate(pthread_mutex_t *a1, uint64_t a2)
{
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  uint64_t v5 = tb_list_find(a1, *(void *)(a2 + 24));
  if (v5)
  {
    dispatch_source_t v6 = (uint64_t *)v5;
    unint64_t v7 = v5 + 32;
  }

  else
  {
    unint64_t v8 = (uint64_t *)calloc(1uLL, 0x20uLL);
    if (!v8) {
      _tb_null_transport_send_message_cold_1();
    }
    dispatch_source_t v6 = v8;
    *unint64_t v8 = *(void *)(a2 + 24);
    unint64_t v7 = (unint64_t)(v8 + 4);
    uint64_t v9 = *(void *)(transport_buffer + 24);
    if (v9 < 0) {
      tb_message_accumulator_accumulate_cold_2();
    }
    uint64_t v10 = 2 * v9;
    unint64_t v11 = (char *)calloc(2 * v9, 1uLL);
    if (v11 > &v11[v10]) {
      goto LABEL_32;
    }
    if (!v11) {
      _tb_null_transport_send_message_cold_1();
    }
    v6[2] = v10;
    v6[3] = (uint64_t)v11;
    _add_accumulator(a1, v6);
  }

  uint64_t v12 = tb_message_get_transport_buffer(a2);
  uint64_t v13 = v6[1];
  uint64_t v14 = *(void *)(v12 + 24);
  size_t v15 = v13 + v14;
  if (__CFADD__(v13, v14)) {
    goto LABEL_33;
  }
  size_t v16 = v6[2];
  if (v15 > v16)
  {
    uint64_t v17 = (char *)realloc((void *)v6[3], v15);
    if (v17 > &v17[v15])
    {
LABEL_32:
      __break(0x5519u);
LABEL_33:
      tb_message_accumulator_accumulate_cold_4();
    }

    if (!v17) {
      _tb_null_transport_send_message_cold_1();
    }
    v6[2] = v15;
    v6[3] = (uint64_t)v17;
    size_t v16 = v15;
  }

  uint64_t v18 = v6[1];
  size_t v19 = *(void *)(transport_buffer + 24);
  if (__CFADD__(v18, v19)) {
    tb_message_accumulator_accumulate_cold_6();
  }
  if (v16 < v18 + v19) {
    tb_message_accumulator_accumulate_cold_7();
  }
  unint64_t v20 = v6[3];
  unint64_t v21 = v20 + v16;
  __int128 v22 = (void *)(v20 + v18);
  BOOL v23 = v21 >= v20 + v18;
  size_t v24 = v21 - (v20 + v18);
  BOOL v25 = !v23 || v20 > (unint64_t)v22;
  if (v25 || v19 > v24) {
    goto LABEL_32;
  }
  memcpy(v22, *(const void **)transport_buffer, v19);
  v6[1] += *(void *)(transport_buffer + 24);
  if ((*(_BYTE *)(transport_buffer + 42) & 2) != 0)
  {
    unint64_t v28 = (void **)calloc(1uLL, 0x68uLL);
    if (!v28) {
      _tb_null_transport_send_message_cold_1();
    }
    uint64_t v27 = v28;
    size_t v29 = v6[1];
    if (v29 <= v6[2] && v29 <= (unint64_t)v27[3])
    {
      memcpy(*v27, (const void *)v6[3], v29);
      tb_list_remove(a1, *v6);
      return v27;
    }

    goto LABEL_32;
  }

  return 0LL;
}

BOOL tb_message_splitter_split_required(uint64_t a1, unint64_t a2)
{
  return *(void *)(a1 + 56) && tb_transport_get_tx_buffer_size(a1) < a2;
}

uint64_t tb_message_splitter_send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  size_t tx_buffer_size = tb_transport_get_tx_buffer_size(a2);
  uint64_t transport_buffer = (void *)tb_message_get_transport_buffer(a3);
  size_t v40 = transport_buffer[3];
  uint64_t v43 = 0LL;
  uint64_t v10 = calloc(1uLL, 0x68uLL);
  if (!v10) {
    goto LABEL_57;
  }
  unint64_t v11 = v10;
  uint64_t v12 = (*(uint64_t (**)(size_t, void, void *))(a2 + 24))(tx_buffer_size, 0LL, v10);
  if (!(_DWORD)v12)
  {
    v39 = a4;
    size_t v13 = v40;
    if (!v40)
    {
LABEL_42:
      (*(void (**)(void *))(a2 + 32))(v11);
      free(v11);
      if (v39 && v43) {
        uint64_t *v39 = a3;
      }
      tb_message_set_transport_buffer(a3, (uint64_t)transport_buffer);
      return 0LL;
    }

    unint64_t v14 = 0LL;
    while (1)
    {
      size_t v15 = v14 + tx_buffer_size;
      if (__CFADD__(v14, tx_buffer_size)) {
        tb_message_splitter_send_cold_2();
      }
      size_t v16 = tx_buffer_size;
      if (v15 >= v13) {
        size_t tx_buffer_size = v13 - v14;
      }
      uint64_t v17 = *(uint64_t (**)(void *, void, size_t))(a2 + 40);
      if (!v17) {
        break;
      }
      uint64_t v18 = v17(v11, 0LL, tx_buffer_size);
      if ((_DWORD)v18)
      {
        uint64_t v12 = v18;
        goto LABEL_50;
      }

      unint64_t v19 = *v11 + v11[3];
      unint64_t v20 = (void *)(*v11 + v11[4]);
      unint64_t v21 = *transport_buffer + transport_buffer[3];
      __int128 v22 = (const void *)(*transport_buffer + transport_buffer[4] + v14);
      BOOL v23 = v21 >= (unint64_t)v22;
      size_t v24 = v21 - (void)v22;
      if (!v23
        || *transport_buffer > (unint64_t)v22
        || tx_buffer_size > v24
        || (unint64_t)v20 > v19
        || *v11 > (unint64_t)v20
        || tx_buffer_size > v19 - (unint64_t)v20)
      {
        __break(0x5519u);
LABEL_57:
        _tb_null_transport_send_message_cold_1();
      }

      if (v15 < v13) {
        __int16 v30 = 1;
      }
      else {
        __int16 v30 = 3;
      }
      if (v15 >= v13 || (a5 & 2) == 0) {
        unint64_t v32 = a5;
      }
      else {
        unint64_t v32 = a5 & 0xFFFFFFFFFFFFFFFDLL;
      }
      memcpy(v20, v22, tx_buffer_size);
      *((_WORD *)v11 + 21) = v30;
      tb_message_set_transport_buffer(a3, (uint64_t)v11);
      _tb_connection_observe_send_message(a1);
      uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, unint64_t))a2)(a2, a3, &v43, v32);
      if ((_DWORD)v33)
      {
        uint64_t v12 = v33;
        (*(void (**)(void *))(a2 + 32))(v11);
        free(v11);
        uint64_t v37 = a3;
        uint64_t v38 = (uint64_t)transport_buffer;
        goto LABEL_54;
      }

      if (v43)
      {
        if (v15 < v40)
        {
          (*(void (**)(void *))(a2 + 32))(v11);
          free(v11);
          tb_message_set_transport_buffer(v43, (uint64_t)transport_buffer);
          return 4LL;
        }

        uint64_t v34 = tb_message_get_transport_buffer(v43);
        uint64_t v35 = _tb_message_buffer_reset(a1, a2, (uint64_t)transport_buffer, *(void *)(v34 + 24), 0LL);
        if ((_DWORD)v35)
        {
          uint64_t v12 = v35;
          (*(void (**)(void *))(a2 + 32))(v11);
          free(v11);
          uint64_t v37 = v43;
          uint64_t v38 = (uint64_t)transport_buffer;
LABEL_54:
          tb_message_set_transport_buffer(v37, v38);
          return v12;
        }

        tb_transport_message_buffer_deep_copy(transport_buffer, v34);
      }

      tb_message_set_transport_buffer(a3, (uint64_t)transport_buffer);
      v14 += tx_buffer_size;
      size_t v13 = v40;
      size_t tx_buffer_size = v16;
      if (v14 >= v40) {
        goto LABEL_42;
      }
    }

    uint64_t v12 = 2LL;
LABEL_50:
    (*(void (**)(void *))(a2 + 32))(v11);
    free(v11);
  }

  return v12;
}

uint64_t tb_reply_splitter_add_reply(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t transport = tb_connection_get_transport((uint64_t)a3);
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (!*(_BYTE *)(transport_buffer + 40)) {
LABEL_23:
  }
    tb_reply_splitter_add_reply_cold_1();
  uint64_t v8 = transport_buffer;
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = (pthread_mutex_t *)atomic_load(&reply_list);
  if (!v10)
  {
    unint64_t v11 = tb_list_create();
    uint64_t v10 = v11;
    while (!__ldxr(&reply_list))
    {
    }

    __clrex();
    free(v11);
    uint64_t v10 = (pthread_mutex_t *)atomic_load(&reply_list);
  }

uint64_t tb_reply_splitter_next_message(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_BYTE *)(tb_message_get_transport_buffer(a2) + 40)) {
    return 2LL;
  }
  uint64_t v8 = (pthread_mutex_t *)atomic_load(&reply_list);
  if (!v8) {
    return 14LL;
  }
  uint64_t v9 = tb_list_find(v8, *(void *)(a2 + 24));
  if (!v9) {
    return 14LL;
  }
  uint64_t v10 = (void *)v9;
  uint64_t tx_buffer_size = tb_transport_get_tx_buffer_size(a4);
  uint64_t v12 = v10[3];
  unint64_t v13 = v12 + tx_buffer_size;
  if (__CFADD__(v12, tx_buffer_size)) {
    tb_reply_splitter_next_message_cold_1();
  }
  unint64_t v14 = v10[2];
  unint64_t v15 = v14 - v12;
  if (v13 >= v14) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = tx_buffer_size;
  }
  uint64_t result = _tb_message_reset(a1, (_DWORD *)a2, 1, v16, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = tb_message_get_transport_buffer(a2);
    if (v13 < v14) {
      __int16 v17 = 1;
    }
    else {
      __int16 v17 = 3;
    }
    *(_WORD *)(result + 42) = v17;
    uint64_t v18 = (char *)(v10[1] + v10[3]);
    if (v18 > &v18[v16] || v16 > *(void *)(result + 24))
    {
      __break(0x5519u);
    }

    else
    {
      memcpy(*(void **)result, v18, v16);
      v10[3] += v16;
      tb_message_complete(a2);
      if (v13 < v14) {
        return 0LL;
      }
      uint64_t result = atomic_load(&reply_list);
      if (result)
      {
        tb_list_remove((pthread_mutex_t *)result, *(void *)(a2 + 24));
        return 0LL;
      }
    }
  }

  return result;
}

void ___reply_list_add_block_invoke(uint64_t a1, void **a2)
{
}

void *tb_transport_set_message_handler(uint64_t a1, void *aBlock)
{
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 72) = result;
  return result;
}

uint64_t tb_transport_set_message_handler_f(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

uint64_t tb_transport_call_message_handler(void *a1, uint64_t a2, uint64_t *a3)
{
  __int128 v4 = (uint64_t (*)(uint64_t, void))a1[10];
  if (v4)
  {
    uint64_t v5 = v4(a2, a1[11]);
LABEL_5:
    uint64_t v7 = v5;
    uint64_t result = 0LL;
    *a3 = v7;
    return result;
  }

  uint64_t v6 = a1[9];
  if (v6)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(v6 + 16))();
    goto LABEL_5;
  }

  return 4LL;
}

void tb_transport_destruct(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 72);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 64);
  if (v3) {
    v3(a1);
  }
}

uint64_t tb_transport_message_buffer_wrap_buffer(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = a2;
  *(_BYTE *)(result + 8) = 1;
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0LL;
  *(void *)(result + 48) = 0LL;
  return result;
}

uint64_t tb_transport_supports_multipart_messages(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 48);
  if (v1) {
    return v1();
  }
  else {
    return 0LL;
  }
}

uint64_t tb_transport_get_tx_buffer_size(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 56);
  if (v1) {
    return v1();
  }
  else {
    return 0LL;
  }
}

double tb_transport_initialize_message_buffer(uint64_t a1)
{
  *(_BYTE *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 48) = 0LL;
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = 0LL;
  return result;
}

uint64_t tb_transport_reset_message_buffer(uint64_t result)
{
  *(_BYTE *)(result + 8) = 0;
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 32) = 0LL;
  *(_WORD *)(result + 42) = 0;
  *(_BYTE *)(result + 40) = 0;
  return result;
}

void *tb_transport_message_buffer_deep_copy(void *result, uint64_t a2)
{
  size_t v2 = *(void *)(a2 + 24);
  if (v2 > result[3]
    || (v4 = result, result = memcpy((void *)*result, *(const void **)a2, v2), unint64_t v5 = *(void *)(a2 + 24), v5 > v4[3]))
  {
    __break(0x5519u);
  }

  else
  {
    *((_BYTE *)v4 + 8) = *(_BYTE *)(a2 + 8);
    v4[2] = *(void *)(a2 + 16);
    v4[3] = v5;
    v4[4] = *(void *)(a2 + 32);
    *((_DWORD *)v4 + 10) = *(_DWORD *)(a2 + 40);
  }

  return result;
}

uint64_t tb_component_capability(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 >= a2 || a1 == 0) {
    return 0LL;
  }
  else {
    return a1 + a3;
  }
}

BOOL tb_component_admission_search_multiple(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  BOOL result = 1LL;
  if (a1 && a2)
  {
    if ((tb_component_admission_search(*a1, a3) & 1) != 0)
    {
      return 1LL;
    }

    else
    {
      uint64_t v7 = 1LL;
      do
      {
        unint64_t v8 = v7;
        if (a2 == v7) {
          break;
        }
        int v9 = tb_component_admission_search(a1[v7], a3);
        uint64_t v7 = v8 + 1;
      }

      while (!v9);
      return v8 < a2;
    }
  }

  return result;
}

_BYTE *tb_forwarding_connection_create_with_endpoint_options( unsigned int *a1, unsigned int *a2, char a3, const void *a4)
{
  uint64_t v9 = v8;
  _tb_connection_create_transport_for_endpoint(a2, 0);
  unint64_t v11 = _tb_forwarding_connection_create(v9, v10, a3, a4);
  tb_endpoint_destruct(a1);
  tb_endpoint_destruct(a2);
  return v11;
}

_BYTE *_tb_forwarding_connection_create(uint64_t a1, uint64_t a2, char a3, const void *a4)
{
  BOOL result = calloc(1uLL, 0x18uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v9 = result;
  if ((a3 & 1) != 0) {
    *BOOL result = 1;
  }
  if (result >= result + 24)
  {
    __break(0x5519u);
  }

  else
  {
    uint64_t v10 = _tb_connection_create(a1);
    unint64_t v11 = _Block_copy(a4);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = ___tb_service_connection_create_forward_block_invoke;
    v12[3] = &unk_18A3AB1A0;
    _DWORD v12[4] = v11;
    v12[5] = v9;
    tb_transport_set_message_handler(a1, v12);
    *((void *)v9 + 1) = v10;
    *((void *)v9 + 2) = tb_client_connection_create(a2);
    return v9;
  }

  return result;
}

_BYTE *tb_forwarding_connection_create(uint64_t a1, uint64_t a2, const void *a3)
{
  return _tb_forwarding_connection_create(a1, a2, 0, a3);
}

_BYTE *tb_forwarding_connection_create_with_endpoint(unsigned int *a1, unsigned int *a2, const void *a3)
{
  return tb_forwarding_connection_create_with_endpoint_options(a1, a2, 0, a3);
}

uint64_t tb_forwarding_connection_activate(uint64_t a1)
{
  uint64_t result = tb_client_connection_activate(*(uint64_t **)(a1 + 16));
  if (!(_DWORD)result) {
    return tb_service_connection_activate(*(uint64_t **)(a1 + 8));
  }
  return result;
}

void tb_forwarding_connection_destruct(uint64_t a1)
{
}

_DWORD *___tb_service_connection_create_forward_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, _DWORD *, uint64_t))(v4 + 16))(v4, v3, a2, 1LL))
  {
    tb_message_complete((uint64_t)a2);
    return 0LL;
  }

  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  *(void *)(transport_buffer + 16) = *(void *)(transport_buffer + 24);
  uint64_t transport = tb_connection_get_transport(*(void *)(v3 + 16));
  if (transport == tb_connection_get_transport(*(void *)(v3 + 8)))
  {
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)tb_message_get_transport_buffer((uint64_t)a2);
    uint64_t v8 = calloc(1uLL, 0x68uLL);
    if (!v8) {
      _tb_null_transport_send_message_cold_1();
    }
    uint64_t v9 = v8;
    uint64_t v10 = 0LL;
  }

  if (*(_BYTE *)v3 || !(*(unsigned int (**)(uint64_t, uint64_t, _DWORD *, void))(v4 + 16))(v4, v3, a2, 0LL))
  {
    tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)v7);
LABEL_15:
    uint64_t v10 = 0LL;
    goto LABEL_16;
  }

  uint64_t v11 = tb_message_get_transport_buffer((uint64_t)a2);
  *(void *)(v11 + 16) = *(void *)(v11 + 24);
  else {
    uint64_t v10 = a2;
  }
LABEL_16:
  if (v9)
  {
    (*(void (**)(void *))(transport + 32))(v9);
LABEL_18:
    free(v9);
  }

  return v10;
}

void *_tb_forwarding_connection_message_forward(uint64_t a1, _DWORD *a2, void *a3, int a4)
{
  uint64_t v26 = a2;
  uint64_t v8 = 16LL;
  if (a4) {
    uint64_t v8 = 8LL;
  }
  uint64_t transport = tb_connection_get_transport(*(void *)(a1 + v8));
  if (*a2 != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v10 = (void *)transport;
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  uint64_t v12 = (void *)transport_buffer;
  if (a3 && a3[2] < a3[4]) {
    _tb_forwarding_connection_message_forward_cold_3();
  }
  unint64_t v13 = (uint64_t *)(a1 + 16);
  uint64_t v14 = *(void *)(transport_buffer + 16);
  uint64_t v15 = *(void *)(transport_buffer + 32);
  if (!a4) {
    unint64_t v13 = (uint64_t *)(a1 + 8);
  }
  uint64_t result = (void *)tb_connection_get_transport(*v13);
  uint64_t v17 = 9LL;
  if (!a3) {
    return (void *)v17;
  }
  if (v10 == result) {
    return (void *)v17;
  }
  unint64_t v18 = v14 - v15;
  if ((a4 & 1) == 0)
  {
    uint64_t v19 = tb_connection_get_transport(*(void *)(a1 + 8));
    tb_transport_reset_message_buffer((uint64_t)a3);
    uint64_t result = (void *)(*(uint64_t (**)(void *, void, uint64_t))(v19 + 40))(a3, 0LL, v14 - v15);
    uint64_t v17 = (uint64_t)result;
    if ((_DWORD)result) {
      return (void *)v17;
    }
  }

  uint64_t v20 = a3[2];
  if (__CFADD__(v20, v18)) {
    _tb_forwarding_connection_message_forward_cold_1();
  }
  unint64_t v21 = a3[3];
  if (v20 + v18 > v21) {
    _tb_forwarding_connection_message_forward_cold_2();
  }
  unint64_t v22 = *v12 + v12[3];
  unint64_t v23 = (const void *)(*v12 + v12[4]);
  if (v22 >= (unint64_t)v23 && *v12 <= (unint64_t)v23 && v18 <= v22 - (unint64_t)v23)
  {
    unint64_t v24 = *a3 + v21;
    uint64_t result = (void *)(*a3 + v20);
    if ((unint64_t)result <= v24 && *a3 <= (unint64_t)result && v18 <= v24 - (unint64_t)result)
    {
      memcpy(result, v23, v14 - v15);
      a3[2] += v18;
      tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)a3);
      tb_message_complete((uint64_t)a2);
      tb_message_set_state(a2, 2);
      if (a4) {
        char v25 = 1;
      }
      else {
        char v25 = 2;
      }
      tb_message_set_disposition((uint64_t)a2, v25);
      tb_message_set_connection_identifier((uint64_t)a2, *(void *)(a1 + 16));
      if (!a4) {
        return 0LL;
      }
      uint64_t v17 = tb_connection_send_query(*(uint64_t **)(a1 + 16), (uint64_t)a2, (uint64_t *)&v26, 2LL * (*(_BYTE *)a1 == 0));
      if ((_DWORD)v17) {
        tb_message_set_transport_buffer((uint64_t)v26, (uint64_t)v12);
      }
      return (void *)v17;
    }
  }

  __break(0x5519u);
  return result;
}

void *tb_alloc_message()
{
  uint64_t result = calloc(1uLL, 0x58uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  return result;
}

void *tb_alloc_transport_message_buffer()
{
  uint64_t result = calloc(1uLL, 0x68uLL);
  if (!result) {
    _tb_null_transport_send_message_cold_1();
  }
  return result;
}

uint64_t tb_unix_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = (char *)calloc(a1, 1uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_null_transport_send_message_cold_1();
  }

  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(_BYTE *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0LL;
  *(void *)(a3 + 48) = 0LL;
  *(_BYTE *)(a3 + 41) = 0;
  return 0LL;
}

void tb_unix_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t tb_unix_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  return tb_unix_transport_construct_message_buffer(a3, v5, a1);
}

_OWORD *tb_unix_client_transport_create_with_endpoint(uint64_t a1)
{
  size_t v2 = calloc(1uLL, 0xE8uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v3 = v2;
  __int128 v4 = unk_18C505E50;
  v2[2] = xmmword_18C505E40;
  v2[3] = v4;
  *((void *)v2 + 8) = off_18C505E60;
  __int128 v5 = *(_OWORD *)&off_18C505E30;
  _OWORD *v2 = _tb_unix_client_transport_vtable;
  v2[1] = v5;
  *((void *)v2 + 12) = _tb_unix_client_transport_create_with_endpoint(a1);
  return v3;
}

_OWORD *tb_unix_service_transport_create_with_endpoint(uint64_t a1)
{
  size_t v2 = calloc(1uLL, 0xE8uLL);
  if (!v2) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v3 = v2;
  __int128 v4 = unk_18C505E98;
  v2[2] = xmmword_18C505E88;
  v2[3] = v4;
  *((void *)v2 + 8) = off_18C505EA8;
  __int128 v5 = *(_OWORD *)&off_18C505E78;
  _OWORD *v2 = _tb_unix_service_transport_vtable;
  v2[1] = v5;
  *((void *)v2 + 12) = _tb_unix_service_transport_create_with_endpoint(a1);
  return v3;
}

char *_make_node(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v6 = (char *)calloc(1uLL, 0x20uLL);
  if (!v6) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v7 = v6;
  uint64_t v8 = v6 + 32;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a2;
  uint64_t result = (char *)_Block_copy(a3);
  *((void *)v7 + 3) = result;
  if (v7 < v8) {
    return v7;
  }
  __break(0x5519u);
  return result;
}

uint64_t _iterate_list(pthread_mutex_t *a1, uint64_t a2)
{
  sig = (void *)a1[1].__sig;
  if (sig)
  {
    char v6 = 0;
    do
    {
      (*(void (**)(uint64_t, void *, char *))(a2 + 16))(a2, sig, &v6);
      if (v6) {
        break;
      }
      sig = (void *)*sig;
    }

    while (sig);
  }

  return pthread_mutex_unlock(a1);
}

uint64_t tb_list_clear(pthread_mutex_t *a1)
{
  sig = (void *)a1[1].__sig;
  if (sig)
  {
    do
    {
      uint64_t v3 = (void *)*sig;
      (*(void (**)(void))(sig[3] + 16LL))();
      free(sig);
      sig = v3;
    }

    while (v3);
    a1[1].__sig = 0LL;
  }

  return pthread_mutex_unlock(a1);
}

pthread_mutex_t *tb_list_create()
{
  uint64_t v0 = (pthread_mutex_t *)calloc(1uLL, 0x48uLL);
  if (!v0) {
    _tb_null_transport_send_message_cold_1();
  }
  uint64_t v1 = v0;
  pthread_mutex_init(v0, 0LL);
  return v1;
}

void tb_list_free(pthread_mutex_t *a1)
{
}

uint64_t tb_list_add(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  node = _make_node(a2, a3, a4);
  pthread_mutex_lock(a1);
  sig = (char *)a1[1].__sig;
  if (sig)
  {
    while (1)
    {
      uint64_t v8 = (char **)sig;
      if (*((void *)sig + 1) == a2) {
        break;
      }
      sig = *(char **)sig;
      if (!*v8)
      {
        *uint64_t v8 = node;
        goto LABEL_6;
      }
    }

    free(node);
    uint64_t v9 = 0LL;
  }

  else
  {
    a1[1].__sig = (uint64_t)node;
LABEL_6:
    uint64_t v9 = 1LL;
  }

  pthread_mutex_unlock(a1);
  return v9;
}

uint64_t tb_list_remove(pthread_mutex_t *a1, uint64_t a2)
{
  __int128 v4 = a1 + 1;
  sig = (pthread_mutex_t *)a1[1].__sig;
  while (*(void *)sig->__opaque != a2)
  {
    __int128 v4 = sig;
    sig = (pthread_mutex_t *)sig->__sig;
    if (!sig) {
      return pthread_mutex_unlock(a1);
    }
  }

  v4->__sig = sig->__sig;
  (*(void (**)(void))(*(void *)&sig->__opaque[16] + 16LL))();
  free(sig);
  return pthread_mutex_unlock(a1);
}

uint64_t tb_list_find(pthread_mutex_t *a1, uint64_t a2)
{
  sig = (void *)a1[1].__sig;
  if (!sig)
  {
    pthread_mutex_unlock(a1);
    return 0LL;
  }

  __int128 v5 = 0LL;
  unint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  do
  {
    if (sig[1] == a2)
    {
      uint64_t v7 = sig;
      unint64_t v6 = (unint64_t)(sig + 4);
      __int128 v5 = sig;
    }

    sig = (void *)*sig;
  }

  while (sig);
  uint64_t result = pthread_mutex_unlock(a1);
  if (!v5) {
    return 0LL;
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_list_count(pthread_mutex_t *a1)
{
  uint64_t v4 = 0LL;
  __int128 v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0LL;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __tb_list_count_block_invoke;
  v3[3] = &unk_18A3AB1C8;
  v3[4] = &v4;
  _iterate_list(a1, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __tb_list_count_block_invoke(uint64_t result)
{
  return result;
}

uint64_t static Conclave.service<A>(for:as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v14[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = (void *)((char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v14[0] = 0LL;
  uint64_t v10 = sub_1894A21CC();
  int v11 = tb_conclave_identifier_for_service(v10 + 32, v14);
  swift_release();
  if (v11)
  {
    type metadata accessor for TransportError(0LL);
    sub_189482774( (unint64_t *)&qword_18C79AB30,  (uint64_t (*)(uint64_t))type metadata accessor for TransportError,  (uint64_t)&protocol conformance descriptor for tb_error_t);
    swift_allocError();
    *uint64_t v12 = v11;
    return swift_willThrow();
  }

  else if ((v14[0] & 0x8000000000000000LL) != 0)
  {
    uint64_t result = sub_1894A23A0();
    __break(1u);
  }

  else
  {
    *uint64_t v9 = v14[0];
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(a5 + 8))(v9, a4, a5);
  }

  return result;
}

void type metadata accessor for TransportError(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for Conclave()
{
  return &type metadata for Conclave;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void type metadata accessor for tb_connection_s(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for BumpBuffer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_1894821C8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 88)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1894821E8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 88) = v3;
  return result;
}

void type metadata accessor for tb_message_s(uint64_t a1)
{
}

__n128 __swift_memcpy232_8(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __int128 v4 = a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __int128 v7 = a2[7];
  __int128 v8 = a2[8];
  __int128 v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  __int128 v11 = a2[12];
  __int128 v12 = a2[13];
  *(void *)(a1 + 224) = *((void *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

void type metadata accessor for tb_transport_s(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1894822B0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_189482304(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2) {
      *(_BYTE *)__n128 result = a2 + 1;
    }
  }

  return result;
}

void type metadata accessor for tb_forwarding_connection_s(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EndpointTuple(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for EndpointTuple(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for tb_darwin_transport_endpoint_s(uint64_t a1)
{
}

_DWORD *sub_1894823D8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_1894823E8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1894823F4(uint64_t a1, uint64_t a2)
{
  return sub_18948253C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1896070D8]);
}

uint64_t sub_189482400(uint64_t a1, id *a2)
{
  uint64_t result = sub_1894A219C();
  *a2 = 0LL;
  return result;
}

uint64_t sub_189482474(uint64_t a1, id *a2)
{
  char v3 = sub_1894A21A8();
  *a2 = 0LL;
  return v3 & 1;
}

uint64_t sub_1894824F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1894A2190();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_189482530(uint64_t a1, uint64_t a2)
{
  return sub_18948253C(a1, a2, MEMORY[0x189617F88]);
}

uint64_t sub_18948253C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1894A21B4();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_189482578()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1894825B8()
{
  uint64_t v0 = sub_1894A249C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_189482628()
{
  return sub_1894A249C();
}

uint64_t sub_189482688()
{
  return sub_1894A1E60();
}

uint64_t sub_1894826D8()
{
  return sub_1894A249C();
}

BOOL sub_189482734(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_189482748()
{
  return sub_189482774( &qword_18C79AB70,  (uint64_t (*)(uint64_t))type metadata accessor for TransportError,  (uint64_t)&unk_1894A2BC0);
}

uint64_t sub_189482774(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895E7954](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1894827B4()
{
  uint64_t v0 = sub_1894A21B4();
  uint64_t v2 = v1;
  if (v0 == sub_1894A21B4() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1894A240C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_18948283C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1894A2190();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_189482880@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1894A21B4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1894828A8()
{
  return sub_1894A23F4();
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_189482940(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_189482960(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for tb_connection_s.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
}

void type metadata accessor for MessageDisposition(uint64_t a1)
{
}

void type metadata accessor for MessageState(uint64_t a1)
{
}

uint64_t sub_1894829D0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 232)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1894829F0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 232) = v3;
  return result;
}

void type metadata accessor for tb_transport_s.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_189482A94(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 104)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_189482AE8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 104) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 104) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = a2 + 1;
    }
  }

  return result;
}

void type metadata accessor for tb_transport_message_buffer_s(uint64_t a1)
{
}

uint64_t sub_189482B58(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_189482BA0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for tb_component_handler_vtable_s(uint64_t a1)
{
}

uint64_t sub_189482BFC(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_189482C40(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0LL;
    }
  }

  return result;
}

void type metadata accessor for tb_component_admission_table_s(uint64_t a1)
{
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_189482CA8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_189482CF0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for tb_component_vtable_s(uint64_t a1)
{
}

uint64_t sub_189482D50()
{
  return sub_189482774( &qword_18C79ABC0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1894A2DF0);
}

uint64_t sub_189482D7C()
{
  return sub_189482774( &qword_18C79ABC8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1894A2DC4);
}

uint64_t sub_189482DA8()
{
  return sub_189482774( &qword_18C505EB8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1894A2E60);
}

uint64_t getEnumTagSinglePayload for BumpBuffer(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for BumpBuffer(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for tb_transport_message_buffer_opaque_data_s(uint64_t a1)
{
}

void type metadata accessor for tb_transport_flags_t(uint64_t a1)
{
}

uint64_t sub_189482E54(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_189482E98(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 2) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0LL;
    }
  }

  return result;
}

void type metadata accessor for tb_component_admission_list_s(uint64_t a1)
{
}

void sub_189482EE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t dispatch thunk of TightbeamServiceInitProtocol.init(endpoint:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

const mach_header_64 *sub_189482F48@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v20[1] = *MEMORY[0x1895F89C0];
  __n128 result = (const mach_header_64 *)_dyld_image_count();
  if ((_DWORD)result)
  {
    int v7 = (int)result;
    uint32_t v8 = 0;
    while (1)
    {
      __n128 result = (const mach_header_64 *)_dyld_get_image_header(v8);
      if (result)
      {
        v20[0] = 0LL;
        __n128 result = (const mach_header_64 *)getsectiondata(result, "__DATA", "__TIGHTBEAM", v20);
        if (result)
        {
        }
      }

LABEL_3:
      if (++v8 == v7) {
        goto LABEL_25;
      }
    }

    __int128 v9 = (const mach_header_64 *)((char *)result + (v20[0] & 0xFFFFFFFFFFFFFFF8LL));
    while (1)
    {
      uint64_t v10 = **(unsigned __int8 ***)&result->magic;
      int v11 = *v10;
      if (!*v10) {
        goto LABEL_8;
      }
      if (v10[1]) {
        break;
      }
      if (a2 == 1 && v11 == *a1)
      {
LABEL_24:
        *a3 = *(void *)&result->magic;
        return result;
      }

  type metadata accessor for TransportError(0LL);
  sub_189494F5C();
  swift_allocError();
  uint64_t *v5 = v4;
  swift_willThrow();
  return v3;
}

LABEL_9:
      __n128 result = (const mach_header_64 *)((char *)result + 8);
      if (result == v9) {
        goto LABEL_3;
      }
    }

    uint64_t v12 = 0LL;
    while (v12 != 1022)
    {
      if (!v10[v12++ + 2])
      {
        if (a2 - 1 != v12 || v11 != *a1 || v10[1] != a1[1]) {
          goto LABEL_9;
        }
        uint64_t v14 = v10 + 2;
        uint64_t v15 = a2 - 2;
        unint64_t v16 = a1 + 2;
        while (v15)
        {
          int v18 = *v14++;
          int v17 = v18;
          int v19 = *v16++;
          --v15;
          if (v17 != v19) {
            goto LABEL_9;
          }
        }

        goto LABEL_24;
      }
    }

LABEL_8:
    if (!a2) {
      goto LABEL_24;
    }
    goto LABEL_9;
  }

  __n128 result = sub_1894A23A0();
  __break(1u);
  return result;
}

  __n128 result = sub_1894A23A0();
  __break(1u);
  return result;
}

  __n128 result = sub_1894A23AC();
  __break(1u);
  return result;
}

  __n128 result = sub_1894A23AC();
  __break(1u);
  return result;
}

  __n128 result = sub_1894A23AC();
  __break(1u);
  return result;
}

LABEL_25:
  *a3 = 0LL;
  return result;
}

    uint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    int v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v1);
    int v18 = 8 * v16;
    int v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    __n128 result = (void *)swift_retain();
  }

  unint64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int v11 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    int v11 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

    uint64_t v12 = (v20 - 1) & v20;
    uint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = 16 * v15;
    int v17 = 8 * v15;
    int v18 = *(void *)(*(void *)(v2 + 56) + v17);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v17) = v18;
    __n128 result = (void *)swift_retain();
  }

  unint64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  uint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    __int128 v9 = v21;
    goto LABEL_25;
  }

  while (1)
  {
    __int128 v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }

    uint64_t v12 = (v19 - 1) & v19;
    uint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = 8 * v15;
    int v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    __n128 result = (void *)swift_retain();
  }

  uint64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  int v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    __int128 v9 = v20;
    goto LABEL_25;
  }

  while (1)
  {
    __int128 v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    int v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }

uint64_t sub_1894830EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1894832E4(a1, a2, a3, a4, a5, sub_189486C4C, sub_189486BD0);
}

uint64_t sub_189483100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18948311C(a1, a2, a3, sub_189486C4C, sub_189486BD0);
}

uint64_t sub_18948311C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, uint64_t, uint64_t), uint64_t (*a5)(void, uint64_t, uint64_t, uint64_t))
{
  if (a1 < 0) {
    goto LABEL_20;
  }
  uint64_t v9 = a3 - a2;
  if (a2) {
    uint64_t v10 = a3 - a2;
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = a4(0LL, v10, a2, a3);
  if (a1 && (v11 & 0x8000000000000000LL) == 0 && v11 < a1)
  {
    uint64_t result = v9;
    if (!a2) {
      return 0LL;
    }
LABEL_11:
    uint64_t v13 = v9;
    if (v9 >= result) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }

  uint64_t result = a5(0LL, a1, a2, a3);
  if (a2) {
    goto LABEL_11;
  }
  uint64_t v13 = 0LL;
  if (result > 0)
  {
LABEL_19:
    sub_1894A23A0();
    __break(1u);
LABEL_20:
    sub_1894A23A0();
    __break(1u);
    goto LABEL_21;
  }

LABEL_12:
  if (result < 0) {
    goto LABEL_21;
  }
  if (a2)
  {
    if (v9 >= v13) {
      return result;
    }
LABEL_21:
    uint64_t result = sub_1894A23E8();
    __break(1u);
    return result;
  }

  if (v13 >= 1) {
    goto LABEL_21;
  }
  return result;
}

    __break(1u);
    goto LABEL_13;
  }

  *(void *)&size_t v29 = 0LL;
  *((void *)&v29 + 1) = 0xE000000000000000LL;
  unint64_t v24 = v19;
  sub_1894A2358();
  sub_1894A21FC();
  uint64_t v27 = v24;
  sub_189486E64();
  sub_1894A2334();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  LOBYTE(v27) = v26;
  BYTE1(v27) = v25;
  BYTE2(v27) = v9;
  WORD2(v27) = v10;
  HIWORD(v27) = v11;
  unint64_t v28 = v12;
  sub_1894A2394();
LABEL_18:
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_1894832E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    uint64_t v13 = a6(a2, a3, a4, a5);
    if (!a1 || (v14 = v13, v13 < 0) || (uint64_t result = a3, v14 >= a1))
    {
      uint64_t result = a7(a2, a1, a4, a5);
      if (result > a3) {
        goto LABEL_8;
      }
    }

    if (result >= a2) {
      return result;
    }
  }

  sub_1894A23A0();
  __break(1u);
LABEL_8:
  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t sub_189483458(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    sub_1894A23A0();
    __break(1u);
  }

  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (a1) {
      unint64_t v4 = v3;
    }
    else {
      unint64_t v4 = 0LL;
    }
    if (v2 >= v4) {
      return a2;
    }
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.Configuration.numEndpoints.getter()
{
  return *(void *)v0;
}

uint64_t ComponentRuntime.Configuration.numComponents.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ComponentRuntime.Configuration.numClients.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ComponentRuntime.Configuration.numTypes.getter()
{
  return *(void *)(v0 + 24);
}

Tightbeam::ComponentRuntime::Configuration __swiftcall ComponentRuntime.Configuration.init(numEndpoints:numComponents:numClients:numTypes:)( Swift::Int numEndpoints, Swift::Int numComponents, Swift::Int numClients, Swift::Int numTypes)
{
  *unint64_t v4 = numEndpoints;
  v4[1] = numComponents;
  v4[2] = numClients;
  v4[3] = numTypes;
  result.numTypes = numTypes;
  result.numClients = numClients;
  result.numComponents = numComponents;
  result.numEndpoints = numEndpoints;
  return result;
}

uint64_t sub_189483560(unsigned __int8 *a1, unint64_t a2)
{
  unint64_t v3 = *(uint64_t **)(*(void *)(v2 + 32) + 40LL);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = *v3;
  if (*v3 < 0)
  {
    __break(1u);
LABEL_32:
    uint64_t result = sub_1894A23E8();
    __break(1u);
    return result;
  }

  if (!v4) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v7 = v3[1];
  uint64_t v8 = 3LL;
  if (a2 > 3) {
    uint64_t v8 = a2;
  }
  uint64_t v9 = v8 - 3;
  while (1)
  {
    uint64_t v10 = **(unsigned __int8 ***)(v7 + 8 * result);
    int v11 = *v10;
    if (*v10)
    {
      if (!v10[1])
      {
        if (a2 == 1 && v11 == *a1) {
          return result;
        }
        goto LABEL_7;
      }

      uint64_t v12 = 2LL;
      while (v12 != 1024)
      {
        uint64_t v13 = v12 + 1;
        if (!v10[v12++])
        {
          if (v13 - 1 != a2) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
    }

    if (a2) {
      goto LABEL_7;
    }
LABEL_16:
    if (!a2) {
      return result;
    }
    if (v11 == *a1 && v10[1] == a1[1])
    {
      if (a2 == 2) {
        return result;
      }
      if (v10[2] == a1[2]) {
        break;
      }
    }

LABEL_7:
    if (++result == v4) {
      return 0LL;
    }
  }

  uint64_t v15 = v10 + 3;
  unint64_t v16 = a2 - 3;
  int v17 = a1 + 3;
  uint64_t v18 = v9;
  while (v16)
  {
    if (!v18) {
      goto LABEL_32;
    }
    int v20 = *v15++;
    int v19 = v20;
    int v21 = *v17++;
    --v18;
    --v16;
    if (v19 != v21) {
      goto LABEL_7;
    }
  }

  return result;
}

  if (result < 0)
  {
    uint64_t result = sub_1894A23A0();
    __break(1u);
    return result;
  }

  uint64_t v12 = *(void *)(v7 + 16);
  uint64_t v13 = *(void *)(v8 + 16);
  *a1 = 0x494E495444415441LL;
  a1[1] = result;
  a1[2] = v12;
  a1[3] = v13;
  uint64_t v14 = a2 - (void)a1;
  if (a1) {
    uint64_t v15 = a2 - (void)a1;
  }
  else {
    uint64_t v15 = 0LL;
  }
  if (v15 <= 31)
  {
LABEL_55:
    __break(1u);
    while (1)
    {
LABEL_56:
      sub_1894A23A0();
      __break(1u);
LABEL_57:
      sub_1894A23E8();
      __break(1u);
LABEL_58:
      sub_1894A23A0();
      __break(1u);
    }
  }

  unint64_t v16 = *(void *)(v7 + 16);
  if (!v16)
  {
    unint64_t v24 = 32LL;
    char v25 = *(void *)(v8 + 16);
    if (!v25) {
      return result;
    }
    goto LABEL_31;
  }

  int v17 = 0LL;
  uint64_t v18 = (__int128 *)(v7 + 32);
  int v19 = (v15 - 8) / 0x18uLL;
  do
  {
    int v20 = v15 - (v17 + 32);
    int v21 = __OFSUB__(v15, v17 + 32);
    if (!v19) {
      goto LABEL_57;
    }
    if (!v20) {
      goto LABEL_5;
    }
    if (!v10) {
      goto LABEL_57;
    }
    if (v20 < 0x18) {
      goto LABEL_5;
    }
    unint64_t v22 = *v18;
    v10[v17 / 8 + 4] = 0x454E445044415441LL;
    *(_OWORD *)&v10[v17 / 8 + 5] = v22;
    if (v21)
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }

    if (v17 == 0x7FFFFFFFFFFFFFC8LL) {
      goto LABEL_53;
    }
    unint64_t v23 = v17 + 56;
    if (((v17 + 56) & 0x8000000000000000LL) != 0 || v14 < v23) {
      goto LABEL_56;
    }
    v17 += 24LL;
    --v19;
    ++v18;
    --v16;
  }

  while (v16);
  unint64_t v24 = v17 + 32;
  char v25 = *(void *)(v8 + 16);
  if (v25)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    unint64_t v32 = (uint64_t)v10 + v15;
    uint64_t v26 = v8 + 56;
    uint64_t v33 = a2;
    uint64_t v35 = (uint64_t)v10;
    while (1)
    {
      uint64_t v34 = v25;
      if (v10) {
        uint64_t v27 = (unint64_t)v10 + v24;
      }
      else {
        uint64_t v27 = 0LL;
      }
      if (v15 - v24 < 0) {
        goto LABEL_57;
      }
      if (v15 != v24) {
        break;
      }
      if (v10) {
        goto LABEL_40;
      }
      unint64_t v28 = 0LL;
LABEL_41:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      size_t v29 = sub_189489E14(v27, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4) {
        return swift_bridgeObjectRelease();
      }
      if (v29 < 0) {
        goto LABEL_56;
      }
      __int16 v30 = sub_189486C4C(v24, v15, v35, v33);
      if (!v29 || v30 < 0 || (__int128 v31 = v15, v30 >= v29))
      {
        __int128 v31 = v24 + v29;
        if (__OFADD__(v24, v29)) {
          goto LABEL_54;
        }
        if (v31 < 0 || v15 < v31) {
          goto LABEL_56;
        }
      }

      if (v31 < v24) {
        goto LABEL_56;
      }
      v26 += 32LL;
      unint64_t v24 = v31;
      char v25 = v34 - 1;
      uint64_t v10 = (void *)v35;
      if (v34 == 1) {
        return swift_bridgeObjectRelease();
      }
    }

    if (!v10) {
      goto LABEL_57;
    }
LABEL_40:
    unint64_t v28 = v32;
    goto LABEL_41;
  }

  return result;
}

unsigned __int8 **sub_1894836EC(unsigned __int8 *a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 < 1)
  {
    while (1)
    {
LABEL_26:
      sub_1894A23AC();
      __break(1u);
    }
  }

  uint64_t v6 = *(void *)(v4 + 32);
  if ((a3 & 1) != 0) {
    return *(unsigned __int8 ***)v6;
  }
  uint64_t v7 = 0LL;
  while (1)
  {
    uint64_t v8 = *(unsigned __int8 ***)(v6 + 8 * v7);
    uint64_t v9 = *v8;
    int v10 = **v8;
    if (!**v8)
    {
LABEL_4:
      if (!a2) {
        return v8;
      }
      goto LABEL_5;
    }

    if (!v9[1])
    {
      if (a2 == 1 && v10 == *a1) {
        return v8;
      }
      goto LABEL_5;
    }

    uint64_t v11 = 0LL;
    do
    {
      if (v11 == 1022) {
        goto LABEL_4;
      }
    }

    while (v9[v11++ + 2]);
    if (a2 - 1 == v11 && v10 == *a1 && v9[1] == a1[1])
    {
      if (a2 == 2) {
        return v8;
      }
    }

LABEL_5:
    if (++v7 == v5)
    {
      sub_1894A2358();
      swift_bridgeObjectRelease();
      sub_1894A21D8();
      sub_1894A21FC();
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }

  uint64_t v13 = v9 + 3;
  uint64_t v14 = a2 - 3;
  uint64_t v15 = a1 + 3;
  while (v14)
  {
    int v17 = *v13++;
    int v16 = v17;
    int v18 = *v15++;
    --v14;
    if (v16 != v18) {
      goto LABEL_5;
    }
  }

  return v8;
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    int v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    int v17 = *v16;
    int v18 = (-1LL << v3) - 1;
  }

  else
  {
    int v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    int v18 = *v16;
    int v17 = (-1LL << result) - 1;
  }

  *int v16 = v18 & v17;
  int v19 = *(void *)(a2 + 16);
  int v20 = __OFSUB__(v19, 1LL);
  int v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

  *a3 = result;
  a3[1] = v5;
  return result;
}

__n128 ComponentRuntime.init(allocatingFor:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  *(void *)&__int128 v14 = *a1;
  uint64_t v3 = v14;
  *((void *)&v14 + 1) = v4;
  v15.n128_u64[0] = v5;
  v15.n128_u64[1] = v6;
  uint64_t v7 = _s9Tightbeam16ComponentRuntimeV4size3forSiAC13ConfigurationV_tFZ_0((uint64_t *)&v14);
  uint64_t v8 = swift_slowAlloc();
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  ComponentRuntime.init(for:into:)(v13, v8, (uint64_t)v7 + v8, (uint64_t *)&v14);
  __int128 v9 = v21;
  *(_OWORD *)(a2 + 96) = v20;
  *(_OWORD *)(a2 + 112) = v9;
  *(void *)(a2 + 128) = v22;
  __int128 v10 = v17;
  *(_OWORD *)(a2 + 32) = v16;
  *(_OWORD *)(a2 + 48) = v10;
  __int128 v11 = v19;
  *(_OWORD *)(a2 + 64) = v18;
  *(_OWORD *)(a2 + 80) = v11;
  __n128 result = v15;
  *(_OWORD *)a2 = v14;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t ComponentRuntime.init(for:into:)@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = sub_18948311C(0LL, a2, a3, sub_189486C4C, sub_189486BD0);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (sub_189486C4C(v10, v11, v13, v15) < 4)
  {
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    uint64_t v79 = v10;
    uint64_t v80 = v12;
    uint64_t v81 = v14;
LABEL_79:
    uint64_t v82 = v16;
    goto LABEL_81;
  }

  uint64_t v88 = sub_189486CDC(v10, v12, v14);
  if (!v88) {
    goto LABEL_82;
  }
  if ((unint64_t)(v9 - 0x2000000000000000LL) >> 62 != 3)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }

  uint64_t v87 = a2;
  uint64_t v17 = sub_1894832E4(4 * v9, v10, v12, v14, v16, sub_189486C4C, sub_189486BD0);
  if (v9 < 0) {
    goto LABEL_82;
  }
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  uint64_t v24 = v20;
  if (v9)
  {
    unint64_t v25 = v9 - 1;
    if (v25 > 7)
    {
      unint64_t v27 = v25 + 1;
      uint64_t v28 = v27 & 7;
      if ((v27 & 7) == 0) {
        uint64_t v28 = 8LL;
      }
      unint64_t v26 = v27 - v28;
      size_t v29 = (_OWORD *)(v88 + 16);
      unint64_t v30 = v26;
      do
      {
        *(v29 - 1) = 0uLL;
        *size_t v29 = 0uLL;
        v29 += 2;
        v30 -= 8LL;
      }

      while (v30);
    }

    else
    {
      unint64_t v26 = 0LL;
    }

    unint64_t v31 = v26 - 0x2000000000000000LL;
    unint64_t v32 = v9 - v26;
    uint64_t v33 = (_DWORD *)(v88 + 4 * v26);
    while (v31)
    {
      *v33++ = 0;
      ++v31;
      if (!--v32) {
        goto LABEL_17;
      }
    }

    __break(1u);
    goto LABEL_63;
  }

LABEL_17:
  if (sub_189486C4C(v17, v18, v19, v20) < 1)
  {
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486C4C(v21, v22, v23, v24);
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    goto LABEL_82;
  }

  uint64_t v85 = sub_189486CDC(v21, v22, v23);
  if (!v85) {
    goto LABEL_82;
  }
  uint64_t v34 = v22;
  if (sub_189486C4C(v21, v22, v23, v24))
  {
    uint64_t v34 = sub_189486BD0(v21, 1LL, v23, v24);
    if (v22 < v34) {
      goto LABEL_83;
    }
  }

  if (v34 < v21)
  {
    sub_1894A23A0();
    __break(1u);
    goto LABEL_77;
  }

  if (sub_189486C4C(v34, v22, v23, v24) < 24)
  {
LABEL_77:
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    uint64_t v79 = v34;
    uint64_t v80 = v22;
    uint64_t v81 = v23;
    uint64_t v82 = v24;
LABEL_81:
    sub_189486C4C(v79, v80, v81, v82);
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    goto LABEL_82;
  }

  uint64_t v35 = sub_189486CDC(v34, v22, v23);
  if (!v35) {
    goto LABEL_82;
  }
  v36 = (void *)v35;
  if ((unsigned __int128)(v7 * (__int128)24LL) >> 64 != (24 * v7) >> 63)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }

  uint64_t v86 = a3;
  uint64_t v37 = sub_1894832E4(24 * v7, v34, v22, v23, v24, sub_189486C4C, sub_189486BD0);
  if (v7 < 0) {
    goto LABEL_82;
  }
  uint64_t v41 = v37;
  uint64_t v42 = v38;
  uint64_t v43 = v39;
  uint64_t v16 = v40;
  if (v7)
  {
    uint64_t v44 = 0x555555555555556LL;
    uint64_t v45 = v7;
    v46 = v36;
    while (v44)
    {
      void *v46 = 0LL;
      v46[1] = 0LL;
      v46[2] = 0LL;
      v46 += 3;
      --v44;
      if (!--v45) {
        goto LABEL_30;
      }
    }

        __break(1u);
LABEL_18:
        __break(1u);
        goto LABEL_22;
      }

  sub_1894A2358();
  sub_1894A21FC();
  sub_1894A2394();
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }

  uint64_t v12 = 0LL;
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t result = v8 + v12;
  if (__OFADD__(v8, v12)) {
    goto LABEL_19;
  }
  return result;
}

  uint64_t v6 = *a1;
  uint64_t v7 = v6 >= 2;
  uint64_t v8 = v6 - 2;
  if (!v7) {
    uint64_t v8 = -1;
  }
  return (v8 + 1);
}

  uint64_t v6 = *a1;
  uint64_t v7 = v6 >= 3;
  uint64_t v8 = v6 - 3;
  if (!v7) {
    uint64_t v8 = -1;
  }
  return (v8 + 1);
}

LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }

LABEL_30:
  if (sub_189486C4C(v37, v38, v39, v40) < 48) {
    goto LABEL_78;
  }
  uint64_t v47 = sub_189486CDC(v41, v42, v43);
  if (!v47) {
    goto LABEL_82;
  }
  v48 = (_OWORD *)v47;
  if ((unsigned __int128)(v8 * (__int128)48LL) >> 64 != (48 * v8) >> 63)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }

  uint64_t v49 = sub_1894832E4(48 * v8, v41, v42, v43, v16, sub_189486C4C, sub_189486BD0);
  if (v8 < 0) {
    goto LABEL_82;
  }
  uint64_t v41 = v49;
  uint64_t v42 = v50;
  uint64_t v43 = v51;
  uint64_t v16 = v52;
  if (v8)
  {
    uint64_t v53 = 0x2AAAAAAAAAAAAABLL;
    uint64_t v54 = v8;
    v55 = v48;
    while (v53)
    {
      v55[1] = 0uLL;
      v55[2] = 0uLL;
      _OWORD *v55 = 0uLL;
      v55 += 3;
      --v53;
      if (!--v54) {
        goto LABEL_38;
      }
    }

    goto LABEL_64;
  }

  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

        uint64_t v11 = (v22 - 1) & v22;
        uint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }

      unint64_t v31 = *(_OWORD *)(*(void *)(v5 + 48) + 16 * v20);
      uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      sub_1894A2478();
      sub_1894A2490();
      sub_1894A2490();
      uint64_t result = sub_1894A249C();
      uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
      uint64_t v15 = result & ~v14;
      uint64_t v16 = v15 >> 6;
      if (((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        uint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
        uint64_t v18 = v31;
      }

      else
      {
        uint64_t v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        uint64_t v18 = v31;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          unint64_t v26 = v16 == v25;
          if (v16 == v25) {
            uint64_t v16 = 0LL;
          }
          v24 |= v26;
          unint64_t v27 = *(void *)(v13 + 8 * v16);
        }

        while (v27 == -1);
        uint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }

      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      *(_OWORD *)(*(void *)(v7 + 48) + 16 * v17) = v18;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
      ++*(void *)(v7 + 16);
    }
  }

  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

        uint64_t v12 = (v22 - 1) & v22;
        uint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }

      uint64_t v28 = 8 * v20;
      size_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      unint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_1894A246C();
      uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
      uint64_t v15 = result & ~v14;
      uint64_t v16 = v15 >> 6;
      if (((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        uint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }

          unint64_t v26 = v16 == v25;
          if (v16 == v25) {
            uint64_t v16 = 0LL;
          }
          v24 |= v26;
          unint64_t v27 = *(void *)(v13 + 8 * v16);
        }

        while (v27 == -1);
        uint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }

      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }

  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

LABEL_38:
  uint64_t v84 = v7;
  if (sub_189486C4C(v49, v50, v51, v52) < 64)
  {
LABEL_78:
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    uint64_t v79 = v41;
    uint64_t v80 = v42;
    uint64_t v81 = v43;
    goto LABEL_79;
  }

  uint64_t v56 = sub_189486CDC(v41, v42, v43);
  if (!v56) {
    goto LABEL_82;
  }
  if ((unint64_t)(v9 - 0x200000000000000LL) >> 58 != 63)
  {
LABEL_70:
    __break(1u);
    goto LABEL_82;
  }

  uint64_t v57 = v56;
  uint64_t v58 = sub_1894832E4(v9 << 6, v41, v42, v43, v16, sub_189486C4C, sub_189486BD0);
  uint64_t v62 = v58;
  uint64_t v63 = v59;
  uint64_t v64 = v60;
  if (v9)
  {
    uint64_t v65 = v9 - 1;
    if (v9 <= 1) {
      uint64_t v66 = 1LL;
    }
    else {
      uint64_t v66 = v9;
    }
    uint64_t v67 = v57 + 8;
    uint64_t v68 = 0x200000000000000LL;
    while (v68)
    {
      *(void *)(v67 - 8) = 0x200000000LL;
      *(_OWORD *)uint64_t v67 = 0uLL;
      *(_OWORD *)(v67 + 16) = 0uLL;
      *(_OWORD *)(v67 + 32) = 0uLL;
      *(void *)(v67 + 48) = 0LL;
      if (!v65) {
        goto LABEL_50;
      }
      --v68;
      --v65;
      v67 += 64LL;
      if (!--v66)
      {
LABEL_60:
        uint64_t result = sub_1894A23E8();
        __break(1u);
        goto LABEL_61;
      }
    }

    goto LABEL_65;
  }

LABEL_50:
  uint64_t v43 = v8;
  uint64_t v83 = v61;
  if (sub_189486C4C(v58, v59, v60, v61) < 16)
  {
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    uint64_t v79 = v62;
    uint64_t v80 = v63;
    uint64_t v81 = v64;
    uint64_t v82 = v83;
    goto LABEL_81;
  }

  uint64_t v69 = sub_189486CDC(v62, v63, v64);
  if (v69)
  {
    uint64_t v8 = v69;
    uint64_t result = sub_1894832E4(16 * v9, v62, v63, v64, v83, sub_189486C4C, sub_189486BD0);
    uint64_t v74 = v86;
    if (!v9)
    {
LABEL_61:
      *a4 = v87;
      a4[1] = v74;
      a4[2] = result;
      a4[3] = v71;
      a4[4] = v72;
      a4[5] = v73;
      a4[6] = v85;
      a4[7] = (uint64_t)v36;
      a4[8] = v84;
      a4[9] = (uint64_t)v48;
      a4[10] = v43;
      a4[11] = v8;
      a4[12] = v9;
      a4[13] = v88;
      a4[14] = v9;
      a4[15] = v57;
      a4[16] = v9;
      return result;
    }

    uint64_t v75 = v9 - 1;
    if (v9 <= 1) {
      uint64_t v76 = 1LL;
    }
    else {
      uint64_t v76 = v9;
    }
    uint64_t v77 = 0x800000000000000LL;
    v78 = (void *)v8;
    while (v77)
    {
      void *v78 = 0LL;
      v78[1] = 0LL;
      if (!v75) {
        goto LABEL_61;
      }
      --v77;
      --v75;
      v78 += 2;
      if (!--v76) {
        goto LABEL_60;
      }
    }

    goto LABEL_66;
  }

LABEL_82:
  sub_1894A23AC();
  __break(1u);
LABEL_83:
  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.initializeComponent(at:from:cnode:)( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v35[12] = *MEMORY[0x1895F89C0];
  unint64_t v9 = a2[1];
  uint64_t v32 = *a2;
  uint64_t v11 = (uint64_t *)v5[2];
  uint64_t v10 = v5[3];
  uint64_t v13 = v5[4];
  uint64_t v12 = v5[5];
  uint64_t v31 = a4;
  uint64_t v14 = sub_189486CDC((uint64_t)v11, v10, v13);
  if (!v14) {
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  uint64_t v16 = v10;
  if ((unint64_t)sub_189486C4C((uint64_t)v11, v10, v13, v12) >= 0xE8)
  {
    uint64_t v16 = sub_189486BD0((uint64_t)v11, 232LL, v13, v12);
    if (v10 < v16) {
      goto LABEL_26;
    }
  }

  if (v16 < (uint64_t)v11)
  {
LABEL_22:
    sub_1894A23A0();
    __break(1u);
LABEL_23:
    v35[0] = 0LL;
    v35[1] = 0xE000000000000000LL;
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    uint64_t v33 = sub_189486C4C((uint64_t)v11, v10, v13, v12);
LABEL_25:
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    goto LABEL_29;
  }

  v5[2] = v16;
  v5[3] = v10;
  v5[4] = v13;
  v5[5] = v12;
  if (sub_189486C4C(v16, v10, v13, v12) < 40)
  {
    v35[0] = 0LL;
    v35[1] = 0xE000000000000000LL;
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2370();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    uint64_t v33 = sub_189486C4C(v16, v10, v13, v12);
    goto LABEL_25;
  }

  uint64_t v17 = sub_189486CDC(v16, v10, v13);
  if (!v17) {
    goto LABEL_29;
  }
  uint64_t v11 = (uint64_t *)v17;
  unint64_t v18 = sub_189486C4C(v16, v10, v13, v12);
  uint64_t v19 = v10;
  if (v18 >= 0x28)
  {
    uint64_t v19 = sub_189486BD0(v16, 40LL, v13, v12);
    if (v10 < v19)
    {
LABEL_26:
      sub_1894A23A0();
      __break(1u);
      goto LABEL_29;
    }
  }

  if (v19 < v16) {
    goto LABEL_22;
  }
  v5[2] = v19;
  v5[3] = v10;
  v5[4] = v13;
  v5[5] = v12;
  uint64_t inited = ComponentInitDataReader.Component.dataBuffer()();
  uint64_t v22 = v21;
  LODWORD(v35[0]) = 1;
  *(_OWORD *)((char *)v35 + 4) = 0u;
  memset((char *)&v35[2] + 4, 0, 21);
  memset(&v35[6], 0, 48);
  if (!tb_client_connection_create_with_endpoint_static(v11, v15, (unsigned int *)v35))
  {
    uint64_t v33 = v32;
    unint64_t v34 = v9;
    uint64_t v23 = (unsigned __int8 *)ComponentInitDataReader.Component.identifier()();
    sub_189482F48(v23, v24, &v33);
    uint64_t v25 = v33;
    if (v33)
    {
      if (inited)
      {
        if (!a3) {
          goto LABEL_20;
        }
        uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8))( a3,  v31 - a3,  inited,  v22 - inited);
        if ((a1 & 0x8000000000000000LL) == 0 && v5[10] > a1)
        {
          if ((unsigned __int128)(a1 * (__int128)48LL) >> 64 == (48 * a1) >> 63)
          {
            uint64_t v27 = v26;
            uint64_t v28 = (uint64_t *)(v5[9] + 48 * a1);
            uint64_t v33 = v32;
            unint64_t v34 = v9;
            uint64_t result = ComponentInitDataReader.Component.identifier()();
            *uint64_t v28 = result;
            v28[1] = v30;
            v28[2] = v15;
            v28[3] = (uint64_t)v11;
            v28[4] = v25;
            v28[5] = v27;
            return result;
          }

          __break(1u);
LABEL_20:
          __break(1u);
        }
      }
    }

    else
    {
      uint64_t v33 = 0LL;
      unint64_t v34 = 0xE000000000000000LL;
      sub_1894A2358();
      swift_bridgeObjectRelease();
      uint64_t v33 = 0xD000000000000025LL;
      unint64_t v34 = 0x80000001894A5160LL;
      ComponentInitDataReader.Component.identifier()();
      sub_1894A21D8();
      sub_1894A21FC();
      swift_bridgeObjectRelease();
      sub_1894A21FC();
    }
  }

LABEL_29:
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.initializeClient(componentIndex:handlerIndex:client:)( uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (a1 < 0) {
    goto LABEL_47;
  }
  uint64_t v4 = v3;
  uint64_t v5 = a1;
  if (v3[10] <= a1) {
    goto LABEL_47;
  }
  uint64_t v6 = (unint64_t *)(v3[9] + 48 * a1);
  unint64_t v7 = v6[2];
  if (!v7)
  {
    sub_1894A2358();
    swift_bridgeObjectRelease();
    unint64_t v92 = 0xD000000000000023LL;
    unint64_t v93 = 0x80000001894A5250LL;
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }

  uint64_t v9 = *a3;
  uint64_t v8 = a3[1];
  unint64_t v10 = *v6;
  unint64_t v11 = v6[1];
  unint64_t v12 = v6[4];
  unint64_t v13 = v6[5];
  unint64_t v14 = v6[3];
  unint64_t v92 = v10;
  unint64_t v93 = v11;
  unint64_t v94 = v7;
  unint64_t v95 = v14;
  unint64_t v89 = v12;
  unint64_t v96 = v12;
  unint64_t v97 = v13;
  if (!v9 || v8 - v9 <= 36) {
    goto LABEL_47;
  }
  uint64_t v15 = *(void *)(v9 + 29);
  if ((v15 & 0x8000000000000000LL) == 0)
  {
    uint64_t v17 = *(unsigned int *)(v9 + 17);
    uint64_t v21 = sub_18948311C(37LL, v9, v8, sub_189486C4C, sub_189486BD0);
    uint64_t v22 = *(void *)(v9 + 21);
    if ((v22 & 0x8000000000000000LL) == 0)
    {
      uint64_t v23 = sub_1894832E4(v22, v21, v18, v19, v20, sub_189486C4C, sub_189486BD0);
      sub_18948CC78(v23, v24, v25, v26);
      if (!v15)
      {
        uint64_t v90 = 0LL;
        if (a2 < 0) {
          goto LABEL_47;
        }
        goto LABEL_29;
      }

      uint64_t v81 = v17;
      unint64_t v82 = v13;
      uint64_t v83 = a2;
      uint64_t v84 = v5;
      uint64_t v27 = v4;
      uint64_t v29 = v4[2];
      uint64_t v28 = v4[3];
      uint64_t v30 = v27[4];
      uint64_t v31 = v27[5];
      uint64_t v85 = v27;
      uint64_t v86 = v15;
      if (sub_189486C4C(v29, v28, v30, v31) < 8)
      {
        sub_1894A2358();
        sub_1894A21FC();
        sub_1894A2370();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_1894A2370();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_189486E64();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        v91[0] = sub_189486C4C(v29, v28, v30, v31);
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        goto LABEL_47;
      }

      uint64_t v90 = sub_189486CDC(v29, v28, v30);
      if (!v90) {
        goto LABEL_47;
      }
      v85[2] = sub_1894832E4(8 * v15, v29, v28, v30, v31, sub_189486C4C, sub_189486BD0);
      v85[3] = v32;
      v85[4] = v33;
      v85[5] = v34;
      if ((*(void *)(v9 + 29) & 0x8000000000000000LL) == 0)
      {
        uint64_t v88 = v8;
        uint64_t v38 = sub_18948311C(37LL, v9, v8, sub_189486C4C, sub_189486BD0);
        uint64_t v39 = *(void *)(v9 + 21);
        if ((v39 & 0x8000000000000000LL) == 0)
        {
          uint64_t v40 = v35;
          uint64_t v41 = v36;
          uint64_t v42 = v37;
          uint64_t v43 = 0LL;
          uint64_t v87 = v15 - 1;
          while (1)
          {
            uint64_t v44 = sub_1894832E4(v39, v38, v40, v41, v42, sub_189486C4C, sub_189486BD0);
            sub_18948CC78(v44, v45, v46, v47);
            ComponentInitDataReader.TypeBuffer.subscript.getter(v43, v91);
            uint64_t v48 = sub_18948311C(16LL, v91[0], v91[1], sub_189486C4C, sub_189486BD0);
            uint64_t v50 = v49;
            uint64_t v52 = v51;
            uint64_t v54 = v53;
            uint64_t v55 = sub_18948ADB4();
            uint64_t v56 = sub_189486A60(v55, v48, v50, v52, v54);
            uint64_t v60 = (unsigned __int8 *)sub_18948CC78(v56, v57, v58, v59);
            if (v60) {
              unint64_t v62 = v61 - (void)v60;
            }
            else {
              unint64_t v62 = 0LL;
            }
            uint64_t v63 = sub_189483560(v60, v62);
            if ((v64 & 1) != 0) {
              goto LABEL_44;
            }
            uint64_t v65 = *(uint64_t **)(v89 + 40);
            if (!v65)
            {
              sub_1894A2358();
              sub_1894A21FC();
              sub_1894A21D8();
              sub_1894A21FC();
              swift_bridgeObjectRelease();
              sub_1894A21FC();
              goto LABEL_47;
            }

            if (v63 < 0 || v63 >= *v65) {
              goto LABEL_47;
            }
            if (v43 == 0x1000000000000000LL) {
              break;
            }
            *(void *)(v90 + 8 * v43) = *(void *)(v65[1] + 8 * v63);
            if (v87 == v43) {
              goto LABEL_28;
            }
            if ((*(void *)(v9 + 29) & 0x8000000000000000LL) == 0)
            {
              uint64_t v38 = sub_18948311C(37LL, v9, v88, sub_189486C4C, sub_189486BD0);
              uint64_t v40 = v66;
              uint64_t v41 = v67;
              uint64_t v42 = v68;
              uint64_t v39 = *(void *)(v9 + 21);
              ++v43;
              if ((v39 & 0x8000000000000000LL) == 0) {
                continue;
              }
            }

            goto LABEL_27;
          }

          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          sub_1894A2358();
          swift_bridgeObjectRelease();
          sub_1894A21D8();
          sub_1894A21FC();
          swift_bridgeObjectRelease();
          sub_1894A21FC();
          sub_1894A21D8();
          sub_1894A21FC();
          swift_bridgeObjectRelease();
          while (1)
          {
LABEL_47:
            sub_1894A23AC();
            __break(1u);
          }
        }
      }
    }
  }

LABEL_27:
  sub_1894A23A0();
  __break(1u);
LABEL_28:
  a2 = v83;
  uint64_t v5 = v84;
  uint64_t v4 = v85;
  uint64_t v15 = v86;
  uint64_t v17 = v81;
  unint64_t v13 = v82;
  if (v83 < 0) {
    goto LABEL_47;
  }
LABEL_29:
  if (v4[14] <= a2) {
    goto LABEL_47;
  }
  uint64_t v69 = v4[13];
  uint64_t inited = (unsigned __int8 *)ComponentInitDataReader.Client.propertyName()();
  int v73 = v72 & 1;
  if (v73)
  {
    uint64_t inited = 0LL;
    uint64_t v71 = 0LL;
  }

  uint64_t v74 = sub_1894836EC(inited, v71, v73);
  if (v4[16] <= a2) {
    goto LABEL_47;
  }
  uint64_t v75 = v74;
  uint64_t v76 = (void *)(v4[15] + (a2 << 6));
  uint64_t result = ((uint64_t (*)(unint64_t))v74[1])(v13);
  *uint64_t v76 = v17;
  v76[1] = 0LL;
  v76[2] = v5;
  v76[3] = a2;
  v76[4] = result;
  v76[5] = v90;
  v76[6] = v15;
  v76[7] = v75;
  if (v4[12] <= a2) {
    goto LABEL_47;
  }
  uint64_t v78 = v4[11];
  uint64_t v79 = (_DWORD *)(v69 + 4 * a2);
  *uint64_t v79 = 0;
  uint64_t v80 = (void *)(v78 + 16 * a2);
  *uint64_t v80 = v79;
  v80[1] = v76;
  return result;
}

    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_1894A2214();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      unint64_t v11 = a3;
      goto LABEL_33;
    }

    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }

  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.handleMessage(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = v9[0];
  v6[1] = v9[1];
  v6[2] = v9[2];
  int v7 = v10;
  __int16 v8 = v11;
  return ComponentRuntime.handleMessage(_:_:_:)(a1, a2, (uint64_t)v6);
}

{
  __int128 *v3;
  char v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  uint64_t v10;
  uint64_t result;
  __int16 v12;
  char v13;
  __int16 v14;
  __int16 v15;
  uint64_t v16;
  if (*(_BYTE *)(a3 + 1) == 1)
  {
    uint64_t v4 = *(_BYTE *)(a3 + 2);
    uint64_t v5 = *(_WORD *)(a3 + 4);
    uint64_t v6 = *(_WORD *)(a3 + 6);
    int v7 = *(_WORD *)(a3 + 8);
    if (*(_BYTE *)a3)
    {
      if (*(_BYTE *)a3 == 1)
      {
        unint64_t v12 = 257;
        unint64_t v13 = v4;
        unint64_t v14 = v5;
        uint64_t v15 = v6;
        LOWORD(v16) = v7;
        sub_189485D08((char *)&v12, v3);
      }

      else
      {
        unint64_t v12 = 258;
        unint64_t v13 = v4;
        unint64_t v14 = v5;
        uint64_t v15 = v6;
        LOWORD(v16) = v7;
        sub_1894862F8((char *)&v12, v3, (void (*)(uint64_t, void))sub_18948714C);
      }

      return 0LL;
    }

    else
    {
      unint64_t v12 = 256;
      unint64_t v13 = v4;
      unint64_t v14 = v5;
      uint64_t v15 = v6;
      LOWORD(v16) = v7;
      sub_189486010((char *)&v12, v3);
      unint64_t v12 = 256;
      unint64_t v13 = v4;
      unint64_t v14 = v5;
      uint64_t v15 = v6;
      LOWORD(v16) = v7;
      int v10 = sub_1894865D0((char *)&v12, v3, a1, a2);
      unint64_t v12 = 256;
      unint64_t v13 = v4;
      unint64_t v14 = v5;
      uint64_t v15 = v6;
      LOWORD(v16) = v7;
      sub_1894862F8((char *)&v12, v3, (void (*)(uint64_t, void))sub_189487290);
    }

    return v10;
  }

  else
  {
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2394();
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

void sub_189485D08(char *a1, __int128 *a2)
{
  char v3 = *a1;
  char v4 = a1[1];
  char v5 = a1[2];
  __int16 v6 = *((_WORD *)a1 + 2);
  __int16 v7 = *((_WORD *)a1 + 3);
  __int16 v8 = *((_WORD *)a1 + 4);
  __int128 v9 = a2[3];
  __int128 v26 = a2[2];
  __int128 v27 = v9;
  __int128 v10 = a2[1];
  __int128 v24 = *a2;
  __int128 v25 = v10;
  uint64_t v11 = *((void *)a2 + 8);
  uint64_t v12 = *((void *)a2 + 9);
  uint64_t v13 = *((void *)a2 + 10);
  __int128 v31 = *(__int128 *)((char *)a2 + 88);
  __int128 v32 = *(__int128 *)((char *)a2 + 104);
  __int128 v33 = *(__int128 *)((char *)a2 + 120);
  uint64_t v28 = v11;
  uint64_t v29 = v12;
  uint64_t v30 = v13;
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  __int16 v23 = v8;
  uint64_t v14 = sub_1894868D0((uint64_t)&v22);
  if (v15 < 0 || v15 >= v13) {
    goto LABEL_22;
  }
  if ((unsigned __int128)(v15 * (__int128)48LL) >> 64 != (48 * v15) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v16 = v12 + 48 * v15;
  if (*(void *)(v16 + 16))
  {
    if (v14 < 0 || v14 >= *((void *)a2 + 12)) {
      goto LABEL_22;
    }
    if ((unint64_t)(v14 - 0x800000000000000LL) >> 60 == 15)
    {
      uint64_t v17 = *((void *)a2 + 11) + 16 * v14;
      if (*(void *)v17)
      {
        uint64_t v18 = *(void *)(v16 + 40);
        os_unfair_lock_lock(*(os_unfair_lock_t *)v17);
        uint64_t v19 = *(void *)(v17 + 8);
        if ((unint64_t)*(unsigned __int8 *)(v19 + 4) << 32 != 0x200000000LL)
        {
          if (*(void *)(v19 + 32))
          {
LABEL_13:
            os_unfair_lock_unlock(*(os_unfair_lock_t *)v17);
            return;
          }

          uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)(v19 + 56) + 8LL))(v18);
          if ((unint64_t)*(unsigned __int8 *)(v19 + 4) << 32 != 0x200000000LL)
          {
            *(void *)(v19 + 32) = v20;
            goto LABEL_13;
          }

          goto LABEL_18;
        }

LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  *(void *)&__int128 v24 = 0LL;
  *((void *)&v24 + 1) = 0xE000000000000000LL;
  uint64_t v21 = v15;
  sub_1894A2358();
  sub_1894A21FC();
  uint64_t v22 = v21;
  sub_189486E64();
  sub_1894A2334();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  __int16 v23 = v8;
  sub_1894A2394();
LABEL_22:
  sub_1894A23AC();
  __break(1u);
}

  uint64_t result = sub_1894A2424();
  __break(1u);
  return result;
}

  uint64_t result = sub_1894A2424();
  __break(1u);
  return result;
}

void sub_189486010(char *a1, __int128 *a2)
{
  char v3 = *a1;
  char v4 = a1[1];
  char v5 = a1[2];
  __int16 v6 = *((_WORD *)a1 + 2);
  __int16 v7 = *((_WORD *)a1 + 3);
  __int16 v8 = *((_WORD *)a1 + 4);
  __int128 v9 = a2[3];
  __int128 v26 = a2[2];
  __int128 v27 = v9;
  __int128 v10 = a2[1];
  __int128 v24 = *a2;
  __int128 v25 = v10;
  uint64_t v11 = *((void *)a2 + 8);
  uint64_t v12 = *((void *)a2 + 9);
  uint64_t v13 = *((void *)a2 + 10);
  __int128 v31 = *(__int128 *)((char *)a2 + 88);
  __int128 v32 = *(__int128 *)((char *)a2 + 104);
  __int128 v33 = *(__int128 *)((char *)a2 + 120);
  uint64_t v28 = v11;
  uint64_t v29 = v12;
  uint64_t v30 = v13;
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  __int16 v23 = v8;
  uint64_t v14 = sub_1894868D0((uint64_t)&v22);
  if (v15 < 0 || v15 >= v13) {
    goto LABEL_20;
  }
  if ((unsigned __int128)(v15 * (__int128)48LL) >> 64 != (48 * v15) >> 63)
  {
    __break(1u);
    goto LABEL_13;
  }

  if (*(void *)(v12 + 48 * v15 + 16))
  {
    if (v14 < 0 || v14 >= *((void *)a2 + 12)) {
      goto LABEL_20;
    }
    if ((unint64_t)(v14 - 0x800000000000000LL) >> 60 == 15)
    {
      uint64_t v16 = *((void *)a2 + 11) + 16 * v14;
      if (!*(void *)v16)
      {
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }

      os_unfair_lock_lock(*(os_unfair_lock_t *)v16);
      uint64_t v17 = *(void *)(v16 + 8);
      if ((unint64_t)*(unsigned __int8 *)(v17 + 4) << 32 == 0x200000000LL)
      {
LABEL_16:
        __break(1u);
        goto LABEL_20;
      }

      uint64_t v18 = *(void *)(v17 + 8);
      BOOL v19 = __CFADD__(v18, 1LL);
      uint64_t v20 = v18 + 1;
      if (!v19)
      {
        *(void *)(v17 + 8) = v20;
        os_unfair_lock_unlock(*(os_unfair_lock_t *)v16);
        return;
      }

LABEL_14:
      __break(1u);
      goto LABEL_15;
    }

          swift_unknownObjectRelease();
          *uint64_t v1 = v12;
          sub_1894A2418();
          swift_unknownObjectRetain_n();
          uint64_t v15 = swift_dynamicCastClass();
          if (!v15)
          {
            swift_bridgeObjectRelease();
            uint64_t v15 = MEMORY[0x18961AFE8];
          }

          uint64_t v16 = *(void *)(v15 + 16);
          swift_release();
          if (v16 == v5)
          {
            if (!swift_dynamicCastClass()) {
              swift_bridgeObjectRelease();
            }
            goto LABEL_19;
          }

    swift_once();
    goto LABEL_10;
  }

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v42);
  __swift_destroy_boxed_opaque_existential_1(v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for UnixListener();
  swift_deallocPartialClassInstance();
  return v7;
}

void sub_1894862F8(char *a1, __int128 *a2, void (*a3)(uint64_t, void))
{
  char v5 = *a1;
  char v6 = a1[1];
  char v7 = a1[2];
  __int16 v8 = *((_WORD *)a1 + 2);
  __int16 v9 = *((_WORD *)a1 + 3);
  __int16 v10 = *((_WORD *)a1 + 4);
  __int128 v11 = a2[3];
  __int128 v27 = a2[2];
  __int128 v28 = v11;
  __int128 v12 = a2[1];
  __int128 v25 = *a2;
  __int128 v26 = v12;
  uint64_t v13 = *((void *)a2 + 8);
  uint64_t v14 = *((void *)a2 + 9);
  uint64_t v15 = *((void *)a2 + 10);
  __int128 v32 = *(__int128 *)((char *)a2 + 88);
  __int128 v33 = *(__int128 *)((char *)a2 + 104);
  __int128 v34 = *(__int128 *)((char *)a2 + 120);
  uint64_t v29 = v13;
  uint64_t v30 = v14;
  uint64_t v31 = v15;
  char v22 = v5;
  LOBYTE(v23) = v5;
  BYTE1(v23) = v6;
  BYTE2(v23) = v7;
  WORD2(v23) = v8;
  HIWORD(v23) = v9;
  __int16 v24 = v10;
  uint64_t v16 = sub_1894868D0((uint64_t)&v23);
  if (v17 < 0 || v17 >= v15) {
    goto LABEL_16;
  }
  if ((unsigned __int128)(v17 * (__int128)48LL) >> 64 != (48 * v17) >> 63)
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v18 = v14 + 48 * v17;
  if (*(void *)(v18 + 16))
  {
    if (v16 < 0 || v16 >= *((void *)a2 + 12)) {
      goto LABEL_16;
    }
    if ((unint64_t)(v16 - 0x800000000000000LL) >> 60 == 15)
    {
      uint64_t v19 = *((void *)a2 + 11) + 16 * v16;
      if (*(void *)v19)
      {
        uint64_t v20 = *(void *)(v18 + 40);
        os_unfair_lock_lock(*(os_unfair_lock_t *)v19);
        a3(v20, *(void *)(v19 + 8));
        os_unfair_lock_unlock(*(os_unfair_lock_t *)v19);
        return;
      }

      goto LABEL_12;
    }

LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_16;
  }

  *(void *)&__int128 v25 = 0LL;
  *((void *)&v25 + 1) = 0xE000000000000000LL;
  uint64_t v21 = v17;
  sub_1894A2358();
  sub_1894A21FC();
  uint64_t v23 = v21;
  sub_189486E64();
  sub_1894A2334();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  LOBYTE(v23) = v22;
  BYTE1(v23) = v6;
  BYTE2(v23) = v7;
  WORD2(v23) = v8;
  HIWORD(v23) = v9;
  __int16 v24 = v10;
  sub_1894A2394();
LABEL_16:
  sub_1894A23AC();
  __break(1u);
}

      __break(1u);
      return result;
    }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

    v18[(v12 >> 6) + 8] |= 1LL << v12;
    uint64_t v21 = (uint64_t *)(v18[6] + 16 * v12);
    *uint64_t v21 = a2;
    v21[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    char v22 = v18[2];
    uint64_t v23 = __OFADD__(v22, 1LL);
    __int16 v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }

    goto LABEL_14;
  }

  sub_189493178(result, a4 & 1);
  uint64_t result = sub_189492898(a2, a3);
  if ((v16 & 1) == (v20 & 1))
  {
    __int128 v12 = result;
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

    v16[(v10 >> 6) + 8] |= 1LL << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    uint64_t v21 = __OFADD__(v20, 1LL);
    char v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }

    goto LABEL_14;
  }

  sub_189493460(result, a3 & 1);
  uint64_t result = sub_189492868(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    __int16 v10 = result;
    uint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

uint64_t sub_1894865D0(char *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  char v7 = *a1;
  char v8 = a1[1];
  char v9 = a1[2];
  __int16 v10 = *((_WORD *)a1 + 2);
  __int16 v11 = *((_WORD *)a1 + 3);
  __int16 v12 = *((_WORD *)a1 + 4);
  __int128 v13 = a2[3];
  __int128 v31 = a2[2];
  __int128 v32 = v13;
  __int128 v14 = a2[1];
  __int128 v29 = *a2;
  __int128 v30 = v14;
  uint64_t v15 = *((void *)a2 + 8);
  uint64_t v16 = *((void *)a2 + 9);
  uint64_t v17 = *((void *)a2 + 10);
  __int128 v36 = *(__int128 *)((char *)a2 + 88);
  __int128 v37 = *(__int128 *)((char *)a2 + 104);
  __int128 v38 = *(__int128 *)((char *)a2 + 120);
  uint64_t v33 = v15;
  uint64_t v34 = v16;
  uint64_t v35 = v17;
  char v25 = v8;
  char v26 = v7;
  LOBYTE(v27) = v7;
  BYTE1(v27) = v8;
  BYTE2(v27) = v9;
  WORD2(v27) = v10;
  HIWORD(v27) = v11;
  __int16 v28 = v12;
  uint64_t v18 = sub_1894868D0((uint64_t)&v27);
  if (v19 < 0 || v19 >= v17) {
    goto LABEL_18;
  }
  if ((unsigned __int128)(v19 * (__int128)48LL) >> 64 != (48 * v19) >> 63)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v20 = v16 + 48 * v19;
  if (*(void *)(v20 + 16))
  {
    if (v18 < 0 || v18 >= *((void *)a2 + 12)) {
      goto LABEL_18;
    }
    if ((unint64_t)(v18 - 0x800000000000000LL) >> 60 == 15)
    {
      uint64_t v21 = (void *)(*((void *)a2 + 11) + 16 * v18);
      if (*v21)
      {
        uint64_t v22 = v21[1];
        if ((unint64_t)*(unsigned __int8 *)(v22 + 4) << 32 != 0x200000000LL) {
          return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(*(void *)(v22 + 56) + 32LL))( a3,  a4,  *(void *)(v20 + 40),  *(void *)(v22 + 32));
        }
        goto LABEL_14;
      }

uint64_t sub_1894868D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 96);
  if (v2 < 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  int v3 = *(unsigned __int16 *)(a1 + 4);
  int v4 = *(unsigned __int16 *)(a1 + 6);
  if (v2)
  {
    uint64_t result = 0LL;
    char v6 = (uint64_t **)(*(void *)(v1 + 88) + 8LL);
    while (result != 0x800000000000000LL)
    {
      if (*(v6 - 1))
      {
        uint64_t v7 = **v6;
        if ((v7 & 0xFF00000000LL) == 0x200000000LL) {
          goto LABEL_16;
        }
      }

      ++result;
      v6 += 2;
      if (v2 == result) {
        goto LABEL_17;
      }
    }

    __break(1u);
    goto LABEL_15;
  }

uint64_t sub_189486A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    uint64_t v10 = sub_189486C4C(a2, a3, a4, a5);
    if (!a1 || v10 < 0 || (uint64_t v11 = a3, v10 >= a1)) {
      uint64_t v11 = sub_189486BD0(a2, a1, a4, a5);
    }
    if (v11 < a2)
    {
      sub_1894A23A0();
      __break(1u);
    }

    else if (v11 <= a3)
    {
      return a2;
    }
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t sub_189486BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4) {
    goto LABEL_8;
  }
  if (!a3)
  {
    if (!result) {
      return result;
    }
    goto LABEL_7;
  }

  if (result < 0 || a4 - a3 < result)
  {
LABEL_7:
    uint64_t result = sub_1894A23A0();
    __break(1u);
LABEL_8:
    __break(1u);
  }

  return result;
}

uint64_t sub_189486C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v4 = a4 - a3;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if ((a1 & 0x8000000000000000LL) == 0 && v4 >= a1)
  {
    if (a3)
    {
      if ((a2 & 0x8000000000000000LL) == 0 && a4 - a3 >= a2) {
        return a2 - a1;
      }
    }

    else if (!a2)
    {
      return a2 - a1;
    }
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t sub_189486CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t result = a3 + a1;
  }
  else {
    uint64_t result = 0LL;
  }
  uint64_t v5 = a2 - a1;
  if (v5 < 0 || v5 && !result)
  {
    uint64_t result = sub_1894A23E8();
    __break(1u);
  }

  return result;
}

uint64_t *_s9Tightbeam16ComponentRuntimeV4size3forSiAC13ConfigurationV_tFZ_0(uint64_t *result)
{
  uint64_t v1 = 296 * *result;
  if ((unsigned __int128)(*result * (__int128)296LL) >> 64 != v1 >> 63)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v2 = result[1];
  uint64_t v3 = (unsigned __int128)(v2 * (__int128)320LL) >> 64;
  uint64_t v4 = 320 * v2;
  if (v3 != v4 >> 63)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v5 = v1 | 5;
  BOOL v6 = __OFADD__(v5, v4);
  uint64_t v7 = v5 + v4;
  if (v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v8 = result[2];
  BOOL v6 = __OFADD__(v7, 16 * v8);
  uint64_t v9 = v7 + 16 * v8;
  if (v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  BOOL v6 = __OFADD__(v9, 4 * v8);
  uint64_t v10 = v9 + 4 * v8;
  if (v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if ((unint64_t)(v8 - 0x200000000000000LL) >> 58 != 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  BOOL v6 = __OFADD__(v10, v8 << 6);
  uint64_t v11 = v10 + (v8 << 6);
  if (v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v12 = result[3];
  if ((unint64_t)(v12 - 0x1000000000000000LL) >> 61 != 7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  uint64_t result = (uint64_t *)(v11 + 8 * v12);
  if (__OFADD__(v11, 8 * v12)) {
LABEL_19:
  }
    __break(1u);
  return result;
}

unint64_t sub_189486E64()
{
  unint64_t result = qword_18C79ABF8;
  if (!qword_18C79ABF8)
  {
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x189618788], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C79ABF8);
  }

  return result;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __int128 v2 = *(_OWORD *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  __int128 v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 48)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(_BYTE *)(result + 136) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 48) = 0LL;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime()
{
  return &type metadata for ComponentRuntime;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.Configuration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.Configuration()
{
  return &type metadata for ComponentRuntime.Configuration;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.ComponentRegistration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 16)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.ComponentRegistration( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(_BYTE *)(result + 48) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = 0LL;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.ComponentRegistration()
{
  return &type metadata for ComponentRuntime.ComponentRegistration;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.EndpointRegistration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.EndpointRegistration( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0LL;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.EndpointRegistration()
{
  return &type metadata for ComponentRuntime.EndpointRegistration;
}

ValueMetadata *type metadata accessor for ComponentRuntime.Metadata()
{
  return &type metadata for ComponentRuntime.Metadata;
}

ValueMetadata *type metadata accessor for BumpBuffer()
{
  return &type metadata for BumpBuffer;
}

uint64_t sub_18948714C(uint64_t result, uint64_t a2)
{
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000LL)
  {
    __break(1u);
    __break(1u);
    goto LABEL_10;
  }

  if (*(void *)(a2 + 8))
  {
    *(_BYTE *)(a2 + 4) = 1;
    return result;
  }

  *(_BYTE *)(a2 + 4) = 0;
  uint64_t v3 = *(void *)(a2 + 32);
  if (v3)
  {
    uint64_t v4 = result;
    __n128 result = (*(uint64_t (**)(uint64_t, void))(*(void *)(a2 + 56) + 24LL))(result, *(void *)(a2 + 32));
    if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 != 0x200000000LL)
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 + 56) + 16LL))(v4, v3);
      if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 != 0x200000000LL)
      {
        *(void *)(a2 + 32) = 0LL;
        return result;
      }

uint64_t sub_189487200(uint64_t result, uint64_t a2)
{
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000LL)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v3 = *(void *)(a2 + 32);
  if (!v3) {
    return result;
  }
  uint64_t v4 = result;
  __n128 result = (*(uint64_t (**)(uint64_t, void))(*(void *)(a2 + 56) + 24LL))(result, *(void *)(a2 + 32));
  __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 + 56) + 16LL))(v4, v3);
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000LL)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  *(void *)(a2 + 32) = 0LL;
  return result;
}

uint64_t sub_189487290(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)a2;
  if ((*(void *)a2 & 0xFF00000000LL) == 0x200000000LL) {
    goto LABEL_8;
  }
  uint64_t v3 = *(void *)(a2 + 8);
  BOOL v4 = v3 != 0;
  uint64_t v5 = v3 - 1;
  if (!v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }

  *(void *)(a2 + 8) = v5;
  if ((v2 & 0x100000000LL) != 0 && !v5)
  {
    *(_BYTE *)(a2 + 4) = 0;
    return sub_189487200(result, a2);
  }

  return result;
}

void sub_1894872D0()
{
  qword_18C79AC00 = MEMORY[0x18961AFE8];
}

uint64_t sub_1894872E4()
{
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1894A3030;
  sub_1894A2358();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  *(void *)(v0 + 56) = MEMORY[0x189617FA8];
  *(void *)(v0 + 32) = 0xD00000000000001ALL;
  *(void *)(v0 + 40) = 0x80000001894A56C0LL;
  sub_1894A2460();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1894873B4(uint64_t a1)
{
  return sub_1894873D4(a1);
}

uint64_t sub_1894873D4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1894A2130();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  __int128 v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_1894A2010();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  __int128 v14 = (char *)&v24 - v13;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v15((char *)&v24 - v13, a1, v8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v14, v8);
  if ((_DWORD)result == *MEMORY[0x189608A38])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v14, v8);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v14, v4);
    uint64_t v17 = v2 + 2;
    uint64_t v19 = v2[5];
    uint64_t v18 = v2[6];
    __swift_project_boxed_opaque_existential_1(v17, v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v7, v19, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  else if ((_DWORD)result != *MEMORY[0x189608A68])
  {
    if ((_DWORD)result == *MEMORY[0x189608A20])
    {
      swift_retain();
      sub_1894A2040();
      swift_release();
      uint64_t v20 = v2[5];
      uint64_t v21 = v2[6];
      __swift_project_boxed_opaque_existential_1(v2 + 2, v20);
      return (*(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 8))(v2, v20, v21);
    }

    else
    {
      v15(v12, a1, v8);
      sub_1894A21C0();
      uint64_t v24 = 0LL;
      unint64_t v25 = 0xE000000000000000LL;
      sub_1894A2358();
      uint64_t v23 = v2[8];
      unint64_t v22 = v2[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v24 = v23;
      unint64_t v25 = v22;
      sub_1894A21FC();
      sub_1894A21FC();
      swift_bridgeObjectRelease();
      sub_1894872E4();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }

  return result;
}

uint64_t sub_189487668(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a2 >> 60 == 15) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = a1;
  }
  if (a2 >> 60 == 15) {
    unint64_t v10 = 0xC000000000000000LL;
  }
  else {
    unint64_t v10 = a2;
  }
  uint64_t v11 = a6[5];
  uint64_t v12 = a6[6];
  __swift_project_boxed_opaque_existential_1(a6 + 2, v11);
  uint64_t v13 = *(void (**)(void *, uint64_t, unint64_t, uint64_t, uint64_t))(v12 + 24);
  sub_1894883EC(a1, a2);
  v13(a6, v9, v10, v11, v12);
  swift_retain();
  sub_1894A2040();
  swift_release();
  return sub_189488444(v9, v10);
}

uint64_t sub_189487734(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC08);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1894A2130();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189487970(a1, (uint64_t)v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v10[0] = 0LL;
  v10[1] = 0xE000000000000000LL;
  sub_1894A2358();
  sub_1894A21FC();
  swift_bridgeObjectRetain();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  sub_1894A2394();
  sub_1894872E4();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1894878DC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnixProtocolConnection()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E793C]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_189487970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1894879B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1894879F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    unint64_t v7 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }

  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1894A23B8();
  swift_bridgeObjectRelease();
  if (v23 < v5) {
    goto LABEL_31;
  }
LABEL_4:
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1LL, v9))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1894A23B8();
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1894A23B8();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }

  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_34;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_36;
  }
LABEL_8:
  unint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v7;
  uint64_t v10 = 0LL;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000LL) == 0 && (v7 & 0x4000000000000000LL) == 0)
  {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8LL;
    if (v11 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1LL;
  }

  if (v7 >> 62) {
    goto LABEL_37;
  }
  uint64_t v14 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x1895E73B4](v10, v14, 1LL, v7);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8LL;
LABEL_18:
  uint64_t v15 = (void *)(v13 + 32 + 8 * v6);
  sub_1894A2124();
  swift_arrayDestroy();
  if (!v8)
  {
LABEL_28:
    *uint64_t v15 = v3;
    return sub_1894A2268();
  }

  if (!(v7 >> 62))
  {
    uint64_t v16 = *(void *)(v13 + 16);
    uint64_t v17 = v16 - v5;
    if (!__OFSUB__(v16, v5)) {
      goto LABEL_21;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  swift_bridgeObjectRetain();
  uint64_t v24 = sub_1894A23B8();
  swift_bridgeObjectRelease();
  uint64_t v17 = v24 - v5;
  if (__OFSUB__(v24, v5)) {
    goto LABEL_40;
  }
LABEL_21:
  if ((v17 & 0x8000000000000000LL) == 0)
  {
    uint64_t v18 = (char *)(v15 + 1);
    uint64_t v19 = (char *)(v13 + 32 + 8 * v5);
    if (v15 + 1 != (void *)v19 || v18 >= &v19[8 * v17]) {
      memmove(v18, v19, 8 * v17);
    }
    if (!(v7 >> 62))
    {
      uint64_t v20 = *(void *)(v13 + 16);
      uint64_t v21 = v20 + v8;
      if (!__OFADD__(v20, v8))
      {
LABEL_27:
        *(void *)(v13 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v21;
        goto LABEL_28;
      }

      goto LABEL_43;
    }

LABEL_41:
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1894A23B8();
    swift_bridgeObjectRelease();
    uint64_t v21 = v25 + v8;
    if (!__OFADD__(v25, v8)) {
      goto LABEL_27;
    }
LABEL_43:
    __break(1u);
  }

  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_189487CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v48 = sub_1894A22BC();
  uint64_t v46 = *(void *)(v48 - 8);
  MEMORY[0x1895F8858](v48);
  uint64_t v47 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = sub_1894A22B0();
  MEMORY[0x1895F8858](v44);
  uint64_t v45 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_1894A2154();
  MEMORY[0x1895F8858](v16);
  uint64_t v43 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = sub_1894A1F68();
  uint64_t v18 = *(void *)(v42 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v42);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  uint64_t v23 = (uint64_t *)((char *)&v37 - v22);
  v50[3] = a6;
  v50[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v50);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32LL))(boxed_opaque_existential_1, a3, a6);
  sub_189488234((uint64_t)v50, (uint64_t)(a5 + 2));
  a5[8] = a1;
  a5[9] = a2;
  if (a4)
  {
    a5[7] = a4;
    uint64_t v25 = v42;
  }

  else
  {
    uint64_t v40 = 0LL;
    uint64_t v41 = v21;
    uint64_t v39 = a1;
    sub_1894A2094();
    uint64_t v38 = a2;
    swift_bridgeObjectRetain();
    sub_1894A2088();
    if (qword_18C79AB20 != -1) {
      swift_once();
    }
    sub_1894A20E8();
    swift_allocObject();
    swift_retain();
    uint64_t v26 = sub_1894A20DC();
    sub_1894A2070();
    swift_retain();
    __int16 v28 = (void (*)(uint64_t *, void))sub_1894A2064();
    uint64_t v29 = *v27;
    __int128 v30 = v41;
    if ((unint64_t)*v27 >> 62)
    {
      uint64_t v36 = v29 & 0xFFFFFFFFFFFFFF8LL;
      if (v29 < 0) {
        uint64_t v36 = *v27;
      }
      uint64_t v37 = v36;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1894A23B8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v37 < 0)
      {
        __break(1u);
        return result;
      }
    }

    sub_1894879F8(0LL, 0LL, v26);
    v28(v49, 0LL);
    swift_release();
    uint64_t v31 = v38;
    *uint64_t v23 = v39;
    v23[1] = v31;
    uint64_t v25 = v42;
    (*(void (**)(void *, void, uint64_t))(v18 + 104))(v23, *MEMORY[0x189608818], v42);
    (*(void (**)(char *, void *, uint64_t))(v18 + 16))(v30, v23, v25);
    sub_1894A2058();
    swift_allocObject();
    uint64_t v32 = sub_1894A1FEC();
    swift_release();
    (*(void (**)(void *, uint64_t))(v18 + 8))(v23, v25);
    a5[7] = v32;
  }

  swift_retain();
  swift_retain();
  swift_retain();
  sub_18948827C((uint64_t)sub_189488278);
  sub_1894A1FE0();
  swift_release();
  swift_release();
  sub_18948828C();
  sub_1894A204C();
  sub_1894A1F44();
  (*(void (**)(void *, uint64_t))(v18 + 8))(v23, v25);
  sub_1894A2148();
  v49[0] = MEMORY[0x18961AFE8];
  sub_1894882C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC28);
  sub_189488310();
  sub_1894A2340();
  (*(void (**)(char *, void, uint64_t))(v46 + 104))(v47, *MEMORY[0x18961B900], v48);
  uint64_t v33 = (void *)sub_1894A22D4();
  swift_retain();
  sub_1894A201C();
  swift_release();
  if (qword_18C79AB00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v34 = v33;
  MEMORY[0x1895E7294]();
  if (*(void *)((qword_18C79AC00 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((qword_18C79AC00 & 0xFFFFFFFFFFFFFF8LL)
                                                                                + 0x18) >> 1)
    sub_1894A2274();
  sub_1894A228C();
  sub_1894A2268();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  return (uint64_t)a5;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }

  return v1;
}

uint64_t sub_189488234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18948827C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_18948828C()
{
  unint64_t result = qword_18C79AC18;
  if (!qword_18C79AC18)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C79AC18);
  }

  return result;
}

unint64_t sub_1894882C8()
{
  unint64_t result = qword_18C79AC20;
  if (!qword_18C79AC20)
  {
    uint64_t v1 = sub_1894A22B0();
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x18961B8C0], v1);
    atomic_store(result, (unint64_t *)&qword_18C79AC20);
  }

  return result;
}

unint64_t sub_189488310()
{
  unint64_t result = qword_18C79AC30;
  if (!qword_18C79AC30)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C79AC28);
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x189618470], v1);
    atomic_store(result, (unint64_t *)&qword_18C79AC30);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E7948](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_1894883E4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_189487668(a1, a2, a3, a4, a5, v5);
}

uint64_t sub_1894883EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_189488400(a1, a2);
  }
  return a1;
}

uint64_t sub_189488400(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_189488444(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t ComponentInitDataReader.Component.dataBuffer()()
{
  uint64_t v1 = *v0;
  if (!*v0) {
    goto LABEL_10;
  }
  uint64_t v2 = v0[1];
  if (v2 - v1 < 48) {
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if ((v3 & 0x8000000000000000LL) == 0)
  {
    BOOL v4 = __OFADD__(v3, 48LL);
    uint64_t v5 = v3 + 48;
    if (v4)
    {
      __break(1u);
LABEL_9:
      __break(1u);
LABEL_10:
      sub_1894A23AC();
      __break(1u);
      goto LABEL_11;
    }

    uint64_t v6 = *(void *)(v1 + 24);
    if ((v6 & 0x8000000000000000LL) == 0)
    {
      if (!__OFADD__(v5, v6))
      {
        uint64_t v7 = sub_189483100(v5 + v6, v1, v2);
        return sub_18948CC78(v7, v8, v9, v10);
      }

      goto LABEL_9;
    }
  }

uint64_t ComponentInitDataReader.Client.badge()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *v1;
  if (*v1 && v1[1] - v2 > 36)
  {
    char v3 = *(_BYTE *)(v2 + 16);
    int v4 = *(_DWORD *)(v2 + 17);
    *(_WORD *)a1 = 257;
    *(_BYTE *)(a1 + 2) = v3;
    *(_DWORD *)(a1 + 4) = v4;
    *(_WORD *)(a1 + 8) = 0;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t ComponentInitDataReader.Client.types.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*v1 && v1[1] - v3 >= 37)
  {
    uint64_t v4 = *(void *)(v3 + 29);
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      uint64_t result = sub_18948B344();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.TypeBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = sub_189483100(0LL, v3, v4);
  if (v5 < 1)
  {
LABEL_57:
    uint64_t v28 = 0LL;
    unint64_t v29 = 0xE000000000000000LL;
    sub_1894A2358();
    swift_bridgeObjectRelease();
    uint64_t v28 = 0xD00000000000001FLL;
    unint64_t v29 = 0x80000001894A5790LL;
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
LABEL_58:
    sub_1894A23AC();
    __break(1u);
LABEL_59:
    sub_1894A23A0();
    __break(1u);
LABEL_60:
    sub_1894A23E8();
    __break(1u);
LABEL_61:
    sub_1894A23A0();
    __break(1u);
  }

  else
  {
    uint64_t v10 = v6;
    if ((v6 & 0x8000000000000000LL) == 0)
    {
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      uint64_t v13 = v9 - v8;
      if (v8) {
        uint64_t v14 = v9 - v8;
      }
      else {
        uint64_t v14 = 0LL;
      }
      BOOL v16 = v7 < 0 || v13 < v7;
      uint64_t v17 = a1;
      while (1)
      {
        if (v12)
        {
          if (v13 < v11) {
            goto LABEL_62;
          }
          uint64_t v18 = (void *)(v12 + v10);
        }

        else
        {
          if (v11 > 0) {
            goto LABEL_62;
          }
          uint64_t v18 = 0LL;
        }

        unint64_t v19 = v11 - v10;
        BOOL v20 = __OFSUB__(v11, v10);
        if ((v19 & 0x8000000000000000LL) != 0) {
          goto LABEL_62;
        }
        if (v19) {
          break;
        }
        if (v18) {
          goto LABEL_26;
        }
        uint64_t v21 = 0LL;
LABEL_27:
        uint64_t result = sub_18948A9E0(v18, v21, &v28);
        unint64_t v23 = v29;
        if (!v17)
        {
          *a2 = v28;
          a2[1] = v23;
          return result;
        }

        unint64_t v24 = *(void *)(v28 + 8);
        if ((v24 & 0x8000000000000000LL) != 0) {
          goto LABEL_59;
        }
        if (v14 < 0) {
          goto LABEL_60;
        }
        if (v14 < v10) {
          goto LABEL_61;
        }
        if (v12)
        {
          if (v16) {
            goto LABEL_61;
          }
        }

        else if (v11)
        {
          goto LABEL_61;
        }

        if (v20)
        {
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_61;
        }

        uint64_t v25 = v11;
        if (v19 >= v24)
        {
          uint64_t v25 = v10 + v24;
          if (__OFADD__(v10, v24)) {
            goto LABEL_52;
          }
          if (v12)
          {
            if (v25 < 0 || v13 < v25) {
              goto LABEL_61;
            }
          }

          else if (v25)
          {
            goto LABEL_61;
          }
        }

        if (v25 < v10) {
          goto LABEL_61;
        }
        --v17;
        uint64_t v10 = v25;
        if (!--v5) {
          goto LABEL_57;
        }
      }

      if (!v18) {
        goto LABEL_62;
      }
LABEL_26:
      uint64_t v21 = (uint64_t)v18 + v19;
      goto LABEL_27;
    }
  }

LABEL_62:
  sub_1894A23E8();
  __break(1u);
LABEL_63:
  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

  sub_1894A23E8();
  __break(1u);
LABEL_63:
  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t EndpointTuple.identifier.getter()
{
  return *(void *)v0;
}

uint64_t EndpointTuple.numHandlers.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_189488B64(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  if ((a4 & 0x1000000000000000LL) == 0)
  {
    if ((a4 & 0x2000000000000000LL) != 0) {
      uint64_t v8 = HIBYTE(a4) & 0xF;
    }
    else {
      uint64_t v8 = a3 & 0xFFFFFFFFFFFFLL;
    }
    swift_bridgeObjectRetain();
    if ((v4 & 0x2000000000000000LL) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    size_t v10 = HIBYTE(v4) & 0xF;
    v14[0] = v5;
    v14[1] = v4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = v14;
    goto LABEL_10;
  }

  uint64_t v8 = sub_1894A2208();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_18949AC78();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v4 = v12;
  if ((v12 & 0x2000000000000000LL) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if ((v5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v9 = (void *)((v4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    size_t v10 = v5 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v9 = (void *)sub_1894A2388();
  }

void *sub_189488C68(void *__src, size_t __len, void *__dst, uint64_t a4, uint64_t a5)
{
  if (a5 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }

  if (!__dst)
  {
    if (!a5) {
      return __src;
    }
LABEL_10:
    sub_1894A23E8();
    __break(1u);
LABEL_11:
    __src = (void *)sub_1894A23E8();
    __break(1u);
    return __src;
  }

  if (__src)
  {
    if ((__len & 0x8000000000000000LL) == 0) {
      return memmove(__dst, __src, __len);
    }
    goto LABEL_11;
  }

  return __src;
}

uint64_t sub_189488D50()
{
  return sub_1894A21D8();
}

uint64_t sub_189488D78(uint64_t *a1, uint64_t a2)
{
  return sub_18948CC14(*a1, a1[1], *(unsigned __int8 **)a2, *(void *)(a2 + 8));
}

BOOL static ComponentInitDataBuilder.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ComponentInitDataBuilder.Error.hash(into:)()
{
  return sub_1894A2484();
}

uint64_t ComponentInitDataBuilder.Error.hashValue.getter()
{
  return sub_1894A249C();
}

BOOL sub_189488E10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV0B0V5ErrorO9hashValueSivg_0()
{
  return sub_1894A249C();
}

uint64_t sub_189488E6C()
{
  return sub_1894A2484();
}

uint64_t sub_189488E94()
{
  return sub_1894A249C();
}

uint64_t ComponentInitDataBuilder.TypeData.type.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

Tightbeam::ComponentInitDataBuilder::TypeData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComponentInitDataBuilder.TypeData.init(type:)( Tightbeam::ComponentInitDataBuilder::TypeData type)
{
  uint64_t v2 = HIBYTE(type.type._object) & 0xF;
  if (v2)
  {
    *uint64_t v1 = type;
  }

  else
  {
    swift_bridgeObjectRelease();
    sub_18948CDA0();
    swift_allocError();
    *uint64_t v3 = 1;
    type.type._countAndFlagsBits = swift_willThrow();
  }

  return type;
}

void ComponentInitDataBuilder.Client.badge.getter(uint64_t a1@<X8>)
{
  char v2 = *(_BYTE *)(v1 + 1);
  char v3 = *(_BYTE *)(v1 + 2);
  int v4 = *(_DWORD *)(v1 + 4);
  __int16 v5 = *(_WORD *)(v1 + 8);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_BYTE *)(a1 + 1) = v2;
  *(_BYTE *)(a1 + 2) = v3;
  *(_DWORD *)(a1 + 4) = v4;
  *(_WORD *)(a1 + 8) = v5;
}

uint64_t ComponentInitDataBuilder.Client.property.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentInitDataBuilder.Client.types.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComponentInitDataBuilder.Client.init(identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = TightbeamBadge.init(_:)(a1, (uint64_t)v8);
  char v4 = v8[1];
  char v5 = v8[2];
  int v6 = v9;
  __int16 v7 = v10;
  *(_BYTE *)a2 = v8[0];
  *(_BYTE *)(a2 + 1) = v4;
  *(_BYTE *)(a2 + 2) = v5;
  *(_DWORD *)(a2 + 4) = v6;
  *(_WORD *)(a2 + 8) = v7;
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = MEMORY[0x18961AFE8];
  return result;
}

uint64_t ComponentInitDataBuilder.Client.init(badge:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(_BYTE *)(result + 1);
  char v3 = *(_BYTE *)(result + 2);
  int v4 = *(_DWORD *)(result + 4);
  __int16 v5 = *(_WORD *)(result + 8);
  *(_BYTE *)a2 = *(_BYTE *)result;
  *(_BYTE *)(a2 + 1) = v2;
  *(_BYTE *)(a2 + 2) = v3;
  *(_DWORD *)(a2 + 4) = v4;
  *(_WORD *)(a2 + 8) = v5;
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = MEMORY[0x18961AFE8];
  return result;
}

uint64_t ComponentInitDataBuilder.Client.init(badge:property:types:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v5 = *(_BYTE *)(result + 1);
  char v6 = *(_BYTE *)(result + 2);
  int v7 = *(_DWORD *)(result + 4);
  __int16 v8 = *(_WORD *)(result + 8);
  *(_BYTE *)a5 = *(_BYTE *)result;
  *(_BYTE *)(a5 + 1) = v5;
  *(_BYTE *)(a5 + 2) = v6;
  *(_DWORD *)(a5 + 4) = v7;
  *(_WORD *)(a5 + 8) = v8;
  *(void *)(a5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2;
  *(void *)(a5 + 24) = a3;
  *(void *)(a5 + 32) = a4;
  return result;
}

uint64_t sub_1894890B8()
{
  unint64_t v1 = v0[3];
  char v2 = (unint64_t *)v0[4];
  if (!v1)
  {
    uint64_t i = 37LL;
    goto LABEL_10;
  }

  if ((v1 & 0x1000000000000000LL) != 0) {
    goto LABEL_28;
  }
  if ((v1 & 0x2000000000000000LL) != 0) {
    uint64_t result = HIBYTE(v1) & 0xF;
  }
  else {
    uint64_t result = v0[2] & 0xFFFFFFFFFFFFLL;
  }
  for (uint64_t i = result + 37; !__OFADD__(result, 37LL); uint64_t i = result + 37)
  {
LABEL_10:
    unint64_t v5 = v2[2];
    if (v5)
    {
      uint64_t v6 = 0LL;
      v2 += 5;
      while (1)
      {
        unint64_t v7 = *v2;
        if ((*v2 & 0x1000000000000000LL) != 0)
        {
          uint64_t v11 = sub_1894A2208();
          uint64_t v9 = v11 + 16;
          if (__OFADD__(v11, 16LL)) {
            goto LABEL_22;
          }
        }

        else
        {
          if ((v7 & 0x2000000000000000LL) != 0) {
            uint64_t v8 = HIBYTE(v7) & 0xF;
          }
          else {
            uint64_t v8 = *(v2 - 1) & 0xFFFFFFFFFFFFLL;
          }
          uint64_t v9 = v8 + 16;
          if (__OFADD__(v8, 16LL))
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }

        BOOL v10 = __OFADD__(v6, v9);
        v6 += v9;
        if (v10) {
          break;
        }
        v2 += 2;
        if (!--v5) {
          goto LABEL_24;
        }
      }

      __break(1u);
    }

    else
    {
LABEL_23:
      uint64_t v6 = 0LL;
LABEL_24:
      uint64_t result = i + v6;
      if (!__OFADD__(i, v6)) {
        return result;
      }
    }

    __break(1u);
LABEL_28:
    uint64_t result = sub_1894A2208();
  }

  __break(1u);
  return result;
}

uint64_t sub_18948918C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v3;
  LOBYTE(v7) = *(_BYTE *)(v2 + 2);
  LOWORD(v8) = *(_WORD *)(v2 + 4);
  LOWORD(v9) = *(_WORD *)(v2 + 6);
  uint64_t v10 = *(void *)(v2 + 16);
  unint64_t v11 = *(void *)(v2 + 24);
  uint64_t v49 = *(void *)(v2 + 32);
  uint64_t v12 = sub_1894890B8();
  uint64_t v13 = v12;
  uint64_t v48 = v12;
  if (a1)
  {
LABEL_11:
    sub_18948CDA0();
    swift_allocError();
    *uint64_t v15 = 0;
    swift_willThrow();
    return v48;
  }

  if (v12 > 0) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11)
  {
    if ((v11 & 0x1000000000000000LL) != 0) {
      goto LABEL_92;
    }
    if ((v11 & 0x2000000000000000LL) != 0)
    {
      if ((v12 & 0x8000000000000000LL) == 0)
      {
        uint64_t v14 = HIBYTE(v11) & 0xF;
        goto LABEL_16;
      }
    }

    else if ((v12 & 0x8000000000000000LL) == 0)
    {
      uint64_t v14 = v10 & 0xFFFFFFFFFFFFLL;
      while (1)
      {
        if (v14 < 0) {
          goto LABEL_93;
        }
LABEL_16:
        uint64_t v16 = *(void *)(v49 + 16);
        *(void *)a1 = 0x434C4E5444415441LL;
        *(void *)(a1 + 8) = v13;
        *(_BYTE *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = (_BYTE)v7;
        *(_WORD *)(a1 + 17) = v8;
        *(_WORD *)(a1 + 19) = v9;
        *(void *)(a1 + 21) = v14;
        *(void *)(a1 + 29) = v16;
        uint64_t v8 = a2 - a1;
        uint64_t v17 = a1;
        a1 = a1 ? a2 - a1 : 0LL;
        if (a1 > 36) {
          break;
        }
LABEL_91:
        __break(1u);
LABEL_92:
        uint64_t v14 = sub_1894A2208();
        uint64_t v13 = v48;
        if (v48 < 0) {
          goto LABEL_93;
        }
      }

      if (!v11)
      {
        uint64_t v10 = 37LL;
        uint64_t v9 = v4;
        uint64_t v21 = v49;
        uint64_t v24 = v17;
        uint64_t v26 = *(void *)(v49 + 16);
        if (v26)
        {
LABEL_25:
          uint64_t v27 = a2 - v24;
          if (v24) {
            int64_t v28 = a2 - v24;
          }
          else {
            int64_t v28 = 0LL;
          }
          uint64_t v43 = v27;
          BOOL v30 = v8 < 0 || v27 < v8;
          BOOL v44 = v30;
          swift_bridgeObjectRetain();
          unint64_t v7 = (unint64_t *)(v21 + 40);
          unint64_t v46 = v8;
          uint64_t v47 = v24;
          int64_t v45 = v28;
          while (1)
          {
            unint64_t v11 = v24 + v10;
            if (v24) {
              a1 = v24 + v10;
            }
            else {
              a1 = 0LL;
            }
            unint64_t v31 = v8 - v10;
            unint64_t v32 = __OFSUB__(v8, v10);
            if ((v31 & 0x8000000000000000LL) != 0) {
              goto LABEL_99;
            }
            uint64_t v33 = *(v7 - 1);
            a2 = *v7;
            uint64_t v8 = v9;
            if (v31) {
              break;
            }
            if (a1) {
              goto LABEL_46;
            }
            uint64_t v9 = 0LL;
            uint64_t v50 = v26;
            if ((a2 & 0x1000000000000000LL) == 0)
            {
LABEL_47:
              if ((a2 & 0x2000000000000000LL) != 0)
              {
                uint64_t v34 = HIBYTE(a2) & 0xF;
                uint64_t v4 = v34 + 16;
                if (__OFADD__(v34, 16LL)) {
                  goto LABEL_83;
                }
              }

              else
              {
                uint64_t v4 = (v33 & 0xFFFFFFFFFFFFLL) + 16;
                if (__OFADD__(v33 & 0xFFFFFFFFFFFFLL, 16LL)) {
                  goto LABEL_83;
                }
              }

              goto LABEL_52;
            }

LABEL_81:
            unsigned int v42 = v32;
            uint64_t v38 = *(v7 - 1);
            uint64_t v39 = sub_1894A2208();
            uint64_t v33 = v38;
            unint64_t v32 = v42;
            uint64_t v4 = v39 + 16;
            if (__OFADD__(v39, 16LL))
            {
LABEL_83:
              __break(1u);
LABEL_84:
              sub_18948CDA0();
              swift_allocError();
              *uint64_t v40 = 0;
              swift_bridgeObjectRetain();
              swift_willThrow();
              swift_bridgeObjectRelease();
LABEL_85:
              swift_bridgeObjectRelease();
              return v48;
            }

LABEL_52:
            if (a1)
            {
              if (v9 - a1 < v4) {
                goto LABEL_84;
              }
              if (v4 < 0) {
                goto LABEL_93;
              }
            }

            else
            {
              if (v4 >= 1) {
                goto LABEL_84;
              }
              unint64_t v11 = 0LL;
              if (v4 < 0) {
                goto LABEL_93;
              }
            }

            *(void *)unint64_t v11 = 0x5459504544415441LL;
            *(void *)(v11 + 8) = v4;
            if (!a1 || v9 - a1 < 16)
            {
              __break(1u);
LABEL_89:
              __break(1u);
LABEL_90:
              __break(1u);
              goto LABEL_91;
            }

            unint64_t v11 = v32;
            uint64_t v35 = (void *)(a1 + 16);
            a1 = v9;
            uint64_t v36 = v33;
            swift_bridgeObjectRetain();
            sub_189488B64(v35, a1, v36, a2);
            uint64_t v9 = v8;
            swift_bridgeObjectRelease();
            if (v8) {
              goto LABEL_85;
            }
            a2 = v45;
            if (v45 < 0)
            {
              sub_1894A23E8();
              __break(1u);
LABEL_97:
              sub_1894A23A0();
              __break(1u);
              goto LABEL_94;
            }

            uint64_t v8 = v46;
            uint64_t v24 = v47;
            if (v10 < 0 || v45 < v10) {
              goto LABEL_94;
            }
            if (v47)
            {
              if (v44) {
                goto LABEL_94;
              }
            }

            else if (v46)
            {
              goto LABEL_94;
            }

            if ((v11 & 1) != 0) {
              goto LABEL_89;
            }
            unint64_t v37 = v46;
            if (v31 >= v4)
            {
              unint64_t v37 = v10 + v4;
              if (__OFADD__(v10, v4)) {
                goto LABEL_90;
              }
              if (v47)
              {
              }

              else if (v37)
              {
                goto LABEL_94;
              }
            }

            if (v46 < v37) {
              goto LABEL_97;
            }
            if (v37 < v10) {
              goto LABEL_94;
            }
            v7 += 2;
            uint64_t v10 = v37;
            uint64_t v26 = v50 - 1;
            if (v50 == 1) {
              goto LABEL_85;
            }
          }

          if (!a1) {
            goto LABEL_99;
          }
LABEL_46:
          uint64_t v9 = a1 + v31;
          uint64_t v50 = v26;
          if ((a2 & 0x1000000000000000LL) == 0) {
            goto LABEL_47;
          }
          goto LABEL_81;
        }

        return v13;
      }

      uint64_t v18 = (void *)sub_189486CDC(37LL, a1, v17);
      uint64_t v20 = sub_189488B64(v18, v19, v10, v11);
      uint64_t v9 = v4;
      uint64_t v21 = v49;
      if (!v4)
      {
        uint64_t v10 = sub_1894830EC(v20, 37LL, a1, v17, a2);
        uint64_t v8 = v22;
        uint64_t v24 = v23;
        a2 = v25;
        uint64_t v13 = v48;
        uint64_t v26 = *(void *)(v49 + 16);
        if (!v26) {
          return v13;
        }
        goto LABEL_25;
      }

      return v48;
    }
  }

  else if ((v12 & 0x8000000000000000LL) == 0)
  {
    uint64_t v14 = 0LL;
    goto LABEL_16;
  }

LABEL_93:
  sub_1894A23A0();
  __break(1u);
LABEL_94:
  sub_1894A23A0();
  __break(1u);
LABEL_99:
  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataBuilder.Component.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentInitDataBuilder.Component.clients.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComponentInitDataBuilder.Component.data.getter()
{
  return swift_bridgeObjectRetain();
}

void ComponentInitDataBuilder.Component.init(identifier:dataSize:clients:)( uint64_t a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  if ((a3 & 0x8000000000000000LL) != 0)
  {
    sub_1894A23A0();
    __break(1u);
  }

  else
  {
    if (a3)
    {
      uint64_t v10 = sub_1894A2280();
      *(void *)(v10 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a3;
      bzero((void *)(v10 + 32), a3);
    }

    else
    {
      uint64_t v10 = MEMORY[0x18961AFE8];
    }

    *a5 = a1;
    a5[1] = a2;
    a5[2] = a4;
    a5[3] = v10;
  }

uint64_t ComponentInitDataBuilder.Component.withMutableMessage(_:)(void (*a1)(uint64_t))
{
  uint64_t v3 = *(char **)(v1 + 24);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_18948CC00((uint64_t)v3);
  }
  uint64_t result = sub_18949D1D0(0, (uint64_t)(v3 + 32), *((void *)v3 + 2), a1);
  *(void *)(v1 + 24) = v3;
  return result;
}

uint64_t sub_1894898F8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x18961AFE8];
  if (!v1) {
    return v2;
  }
  uint64_t v20 = MEMORY[0x18961AFE8];
  sub_18948CA88(0, v1, 0);
  uint64_t v4 = 0LL;
  uint64_t v2 = v20;
  uint64_t v5 = a1 + 32;
  while (1)
  {
    uint64_t v6 = (void *)(v5 + 40 * v4);
    unint64_t v7 = v6[3];
    uint64_t v8 = v6[4];
    if (v7)
    {
      if ((v7 & 0x1000000000000000LL) != 0)
      {
        uint64_t result = sub_1894A2208();
        uint64_t v10 = result + 37;
        if (__OFADD__(result, 37LL)) {
          goto LABEL_33;
        }
      }

      else
      {
        if ((v7 & 0x2000000000000000LL) != 0) {
          uint64_t result = HIBYTE(v7) & 0xF;
        }
        else {
          uint64_t result = v6[2] & 0xFFFFFFFFFFFFLL;
        }
        uint64_t v10 = result + 37;
        if (__OFADD__(result, 37LL))
        {
LABEL_33:
          __break(1u);
          return v2;
        }
      }
    }

    else
    {
      uint64_t result = 0LL;
      uint64_t v10 = 37LL;
    }

    uint64_t v11 = *(void *)(v8 + 16);
    if (v11) {
      break;
    }
    uint64_t v12 = 0LL;
LABEL_26:
    uint64_t v17 = v10 + v12;
    if (__OFADD__(v10, v12)) {
      goto LABEL_37;
    }
    unint64_t v19 = *(void *)(v20 + 16);
    unint64_t v18 = *(void *)(v20 + 24);
    if (v19 >= v18 >> 1) {
      sub_18948CA88(v18 > 1, v19 + 1, 1);
    }
    ++v4;
    *(void *)(v20 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v19 + 1;
    *(void *)(v20 + 8 * v19 + 32) = v17;
    if (v4 == v1) {
      return v2;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v13 = (unint64_t *)(v8 + 40);
  while (1)
  {
    unint64_t v14 = *v13;
    if ((*v13 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = sub_1894A2208();
      uint64_t v15 = result + 16;
      if (__OFADD__(result, 16LL)) {
        goto LABEL_36;
      }
    }

    else
    {
      if ((v14 & 0x2000000000000000LL) != 0) {
        uint64_t result = HIBYTE(v14) & 0xF;
      }
      else {
        uint64_t result = *(v13 - 1) & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v15 = result + 16;
      if (__OFADD__(result, 16LL)) {
        goto LABEL_36;
      }
    }

    BOOL v16 = __OFADD__(v12, v15);
    v12 += v15;
    if (v16) {
      break;
    }
    v13 += 2;
    if (!--v11) {
      goto LABEL_26;
    }
  }

  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_189489A8C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x18961AFE8];
  if (v1)
  {
    uint64_t v5 = MEMORY[0x18961AFE8];
    sub_18948CA88(0, v1, 0);
    uint64_t result = v5;
    do
    {
      uint64_t v6 = result;
      unint64_t v4 = *(void *)(result + 16);
      unint64_t v3 = *(void *)(result + 24);
      if (v4 >= v3 >> 1)
      {
        sub_18948CA88(v3 > 1, v4 + 1, 1);
        uint64_t result = v6;
      }

      *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4 + 1;
      *(void *)(result + 8 * v4 + 32) = 24LL;
      --v1;
    }

    while (v1);
  }

  return result;
}

uint64_t sub_189489B40(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x18961AFE8];
  if (!v1) {
    return v2;
  }
  uint64_t v24 = MEMORY[0x18961AFE8];
  sub_18948CA88(0, v1, 0);
  uint64_t v4 = 0LL;
  uint64_t v2 = v24;
  int64_t v22 = v1;
  uint64_t v23 = a1 + 32;
  while (1)
  {
    uint64_t v5 = (void *)(v23 + 32 * v4);
    unint64_t v6 = v5[1];
    uint64_t v8 = v5[2];
    uint64_t v7 = v5[3];
    if ((v6 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = sub_1894A2208();
      uint64_t v10 = result + 48;
      if (__OFADD__(result, 48LL)) {
        goto LABEL_27;
      }
    }

    else
    {
      if ((v6 & 0x2000000000000000LL) != 0) {
        uint64_t result = HIBYTE(v6) & 0xF;
      }
      else {
        uint64_t result = *v5 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v10 = result + 48;
      if (__OFADD__(result, 48LL)) {
        goto LABEL_27;
      }
    }

    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1894898F8(v8);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12) {
      break;
    }
    uint64_t v13 = 0LL;
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = v10 + v13;
    if (__OFADD__(v10, v13)) {
      goto LABEL_25;
    }
    uint64_t v18 = *(void *)(v7 + 16);
    uint64_t v19 = v17 + v18;
    if (__OFADD__(v17, v18)) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v24 + 16);
    unint64_t v20 = *(void *)(v24 + 24);
    if (v21 >= v20 >> 1) {
      sub_18948CA88(v20 > 1, v21 + 1, 1);
    }
    ++v4;
    *(void *)(v24 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v21 + 1;
    *(void *)(v24 + 8 * v21 + 32) = v19;
    if (v4 == v22) {
      return v2;
    }
  }

  uint64_t v13 = 0LL;
  unint64_t v14 = (uint64_t *)(v11 + 32);
  while (1)
  {
    uint64_t v15 = *v14++;
    BOOL v16 = __OFADD__(v13, v15);
    v13 += v15;
    if (v16) {
      break;
    }
    if (!--v12) {
      goto LABEL_14;
    }
  }

  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_189489D08()
{
  unint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  if ((v1 & 0x1000000000000000LL) != 0) {
    goto LABEL_16;
  }
  if ((v1 & 0x2000000000000000LL) != 0) {
    uint64_t result = HIBYTE(v1) & 0xF;
  }
  else {
    uint64_t result = *v0 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v5 = result + 48;
  if (__OFADD__(result, 48LL))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  while (1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1894898F8(v3);
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v6 + 16);
    if (!v7) {
      break;
    }
    uint64_t v8 = 0LL;
    uint64_t v9 = (uint64_t *)(v6 + 32);
    while (1)
    {
      uint64_t v10 = *v9++;
      BOOL v11 = __OFADD__(v8, v10);
      v8 += v10;
      if (v11) {
        break;
      }
      if (!--v7) {
        goto LABEL_12;
      }
    }

    __break(1u);
LABEL_16:
    uint64_t result = sub_1894A2208();
    uint64_t v5 = result + 48;
    if (__OFADD__(result, 48LL)) {
      goto LABEL_18;
    }
  }

  uint64_t v8 = 0LL;
LABEL_12:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = v5 + v8;
  if (__OFADD__(v5, v8)) {
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)(v2 + 16);
  uint64_t result = v12 + v13;
  if (__OFADD__(v12, v13)) {
LABEL_20:
  }
    __break(1u);
  return result;
}

uint64_t sub_189489E14(unint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  unint64_t v7 = v2[1];
  uint64_t v8 = v2[2];
  uint64_t v9 = v2[3];
  uint64_t v10 = sub_189489D08();
  uint64_t v11 = v10;
  if (a1)
  {
LABEL_12:
    sub_18948CDA0();
    swift_allocError();
    *unint64_t v20 = 0;
    swift_willThrow();
    return v11;
  }

  if (v10 > 0) {
    goto LABEL_12;
  }
LABEL_3:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1894898F8(v8);
  unint64_t v13 = v3;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v12 + 16);
  uint64_t v48 = v8;
  if (v14)
  {
    uint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
    do
    {
      uint64_t v17 = *(void *)(v12 + 8 * v15 + 32);
      BOOL v18 = __OFADD__(v16, v17);
      v16 += v17;
      if (v18)
      {
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }

      ++v15;
    }

    while (v14 != v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 0x1000000000000000LL) != 0) {
      goto LABEL_73;
    }
    if ((v7 & 0x2000000000000000LL) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v19 = HIBYTE(v7) & 0xF;
    if ((v11 & 0x8000000000000000LL) == 0) {
      goto LABEL_16;
    }
    goto LABEL_74;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v16 = 0LL;
  if ((v7 & 0x1000000000000000LL) != 0)
  {
LABEL_73:
    uint64_t v19 = sub_1894A2208();
    if ((v11 & 0x8000000000000000LL) == 0) {
      goto LABEL_16;
    }
    goto LABEL_74;
  }

  if ((v7 & 0x2000000000000000LL) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v19 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v11 & 0x8000000000000000LL) == 0)
  {
LABEL_16:
    if (v19 < 0 || (v16 & 0x8000000000000000LL) != 0) {
      goto LABEL_74;
    }
    uint64_t v21 = *(void *)(v48 + 16);
    uint64_t v22 = *(void *)(v9 + 16);
    *(void *)a1 = 0x434F4D5044415441LL;
    *(void *)(a1 + 8) = v11;
    *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v19;
    *(void *)(a1 + 24) = v16;
    *(void *)(a1 + 32) = v21;
    *(void *)(a1 + 40) = v22;
    if (a1) {
      uint64_t v23 = a2 - a1;
    }
    else {
      uint64_t v23 = 0LL;
    }
    if (v23 <= 47) {
      goto LABEL_75;
    }
    uint64_t v24 = (void *)sub_189486CDC(48LL, v23, a1);
    uint64_t v26 = sub_189488B64(v24, v25, v6, v7);
    unint64_t v16 = v13;
    if (!v13)
    {
      uint64_t v41 = v11;
      unint64_t v7 = sub_1894830EC(v26, 48LL, v23, a1, a2);
      uint64_t v11 = v27;
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)(v48 + 16);
      if (v31)
      {
        if (v28) {
          int64_t v32 = v29 - v28;
        }
        else {
          int64_t v32 = 0LL;
        }
        int64_t v44 = v32;
        int64_t v42 = v29 - v28;
        BOOL v34 = v27 < 0 || v29 - v28 < v27;
        BOOL v43 = v34;
        swift_bridgeObjectRetain();
        a2 = 0LL;
        unint64_t v45 = v11;
        uint64_t v46 = v9;
        uint64_t v47 = v30;
        while (1)
        {
          if (v30) {
            uint64_t v35 = v30 + v7;
          }
          else {
            uint64_t v35 = 0LL;
          }
          a1 = v11 - v7;
          uint64_t v6 = __OFSUB__(v11, v7);
          if ((a1 & 0x8000000000000000LL) != 0) {
            goto LABEL_81;
          }
          uint64_t v49 = v31;
          if (a1) {
            break;
          }
          if (v35) {
            goto LABEL_45;
          }
          unint64_t v36 = 0LL;
LABEL_46:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v13 = sub_18948918C(v35, v36);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v13 & 0x8000000000000000LL) != 0) {
            goto LABEL_80;
          }
          uint64_t v11 = v45;
          uint64_t v9 = v46;
          uint64_t v30 = v47;
          if (v44 < 0)
          {
            sub_1894A23E8();
            __break(1u);
            goto LABEL_80;
          }

          if (v47)
          {
            if (v43) {
              goto LABEL_80;
            }
          }

          else if (v45)
          {
            goto LABEL_80;
          }

          if ((v6 & 1) != 0) {
            goto LABEL_71;
          }
          unint64_t v37 = v45;
          if (a1 >= v13)
          {
            unint64_t v37 = v7 + v13;
            if (__OFADD__(v7, v13)) {
              goto LABEL_72;
            }
            if (v47)
            {
              if (v45 < v37) {
                goto LABEL_82;
              }
            }

            else if (v37)
            {
              goto LABEL_80;
            }
          }

          if (v37 < v7) {
            goto LABEL_80;
          }
          a2 += 40LL;
          unint64_t v7 = v37;
          uint64_t v31 = v49 - 1;
          if (v49 == 1)
          {
            swift_bridgeObjectRelease();
            uint64_t v30 = v47;
            goto LABEL_68;
          }
        }

        if (!v35) {
          goto LABEL_81;
        }
LABEL_45:
        unint64_t v36 = v35 + a1;
        goto LABEL_46;
      }

      unint64_t v37 = v7;
LABEL_68:
      uint64_t v38 = v9 + 32 + *(void *)(v9 + 16);
      uint64_t v39 = (void *)sub_189486CDC(v37, v11, v30);
      sub_18949C024((void *)(v9 + 32), v38, v39);
      return v41;
    }

    return v11;
  }

LABEL_74:
  sub_1894A23A0();
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_80:
  sub_1894A23A0();
  __break(1u);
LABEL_81:
  sub_1894A23E8();
  __break(1u);
LABEL_82:
  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataBuilder.Endpoint.identifier.getter()
{
  return *(void *)v0;
}

uint64_t ComponentInitDataBuilder.Endpoint.init(identifier:numHandlers:)@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

Tightbeam::ComponentInitDataBuilder __swiftcall ComponentInitDataBuilder.init(components:endpoints:)( Swift::OpaquePointer components, Swift::OpaquePointer endpoints)
{
  v2->_rawValue = components._rawValue;
  v2[1]._rawValue = endpoints._rawValue;
  result.endpoints = endpoints;
  result.components = components;
  return result;
}

uint64_t ComponentInitDataBuilder.encodedByteSize.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_189489A8C(v0);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = (uint64_t *)(v1 + 32);
    while (1)
    {
      uint64_t v6 = *v5++;
      BOOL v7 = __OFADD__(v4, v6);
      v4 += v6;
      if (v7) {
        break;
      }
      if (!--v3) {
        goto LABEL_7;
      }
    }

    __break(1u);
    goto LABEL_17;
  }

  uint64_t v4 = 0LL;
LABEL_7:
  uint64_t result = swift_bridgeObjectRelease();
  BOOL v7 = __OFADD__(v4, 32LL);
  uint64_t v8 = v4 + 32;
  if (v7) {
    goto LABEL_18;
  }
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_189489B40(v9);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = (uint64_t *)(v10 + 32);
    while (1)
    {
      uint64_t v14 = *v13++;
      BOOL v7 = __OFADD__(v12, v14);
      v12 += v14;
      if (v7) {
        break;
      }
      if (!--v11) {
        goto LABEL_14;
      }
    }

uint64_t ComponentInitDataBuilder.encode(into:)(void *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v2;
  uint64_t v7 = v2[1];
  uint64_t result = ComponentInitDataBuilder.encodedByteSize.getter();
  uint64_t v10 = a1;
  if (!a1)
  {
    if (result <= 0) {
      goto LABEL_7;
    }
LABEL_5:
    sub_18948CDA0();
    swift_allocError();
    *uint64_t v11 = 0;
    return swift_willThrow();
  }

uint64_t sub_18948A9E0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a1)
  {
    unint64_t v5 = a2 - (void)a1;
    if (a2 - (uint64_t)a1 >= 16)
    {
      if (*a1 == 0x5459504544415441LL)
      {
        unint64_t v7 = a1[1];
        if ((v7 & 0x8000000000000000LL) != 0)
        {
          sub_1894A23A0();
          __break(1u);
        }

        else if (v5 >= v7)
        {
          uint64_t v8 = sub_18948ACE4(v7, (uint64_t)a1, a2);
          uint64_t result = sub_18948CC78(v8, v9, v10, v11);
          *a3 = result;
          a3[1] = v13;
          return result;
        }

        sub_1894A2358();
        sub_1894A21FC();
        sub_18948CE6C();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_189486E64();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
      }

      else
      {
        sub_1894A2358();
        swift_bridgeObjectRelease();
        sub_18948CE6C();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
      }
    }
  }

  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_18948ACE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    if (a2)
    {
      if (a3 - a2 >= a1) {
        return 0LL;
      }
    }

    else if (!a1)
    {
      return 0LL;
    }

    sub_1894A23E8();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t sub_18948ADB4()
{
  uint64_t v1 = *v0;
  if (*v0 && v0[1] - v1 >= 16)
  {
    uint64_t v2 = *(void *)(v1 + 8);
    if ((v2 & 0x8000000000000000LL) == 0) {
      return v2 - 16;
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.TypeData.type()()
{
  uint64_t v1 = sub_189483100(16LL, *v0, v0[1]);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_18948ADB4();
  uint64_t v9 = sub_189486A60(v8, v1, v3, v5, v7);
  return sub_18948CC78(v9, v10, v11, v12);
}

uint64_t sub_18948AF08@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a1)
  {
    unint64_t v5 = a2 - (void)a1;
    if (a2 - (uint64_t)a1 >= 37)
    {
      if (*a1 == 0x434C4E5444415441LL)
      {
        unint64_t v7 = a1[1];
        if ((v7 & 0x8000000000000000LL) != 0)
        {
          sub_1894A23A0();
          __break(1u);
        }

        else if (v5 >= v7)
        {
          uint64_t v8 = sub_18948ACE4(v7, (uint64_t)a1, a2);
          uint64_t result = sub_18948CC78(v8, v9, v10, v11);
          *a3 = result;
          a3[1] = v13;
          return result;
        }

        sub_1894A2358();
        sub_1894A21FC();
        sub_18948CE6C();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_189486E64();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
      }

      else
      {
        sub_1894A2358();
        swift_bridgeObjectRelease();
        sub_18948CE6C();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
        sub_1894A21FC();
        sub_1894A2334();
        sub_1894A21FC();
        swift_bridgeObjectRelease();
      }
    }
  }

  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Client.propertyName()()
{
  uint64_t v1 = *v0;
  if (!*v0 || (uint64_t v2 = v0[1], v2 - v1 < 37))
  {
    sub_1894A23AC();
    __break(1u);
LABEL_11:
    uint64_t result = sub_1894A23A0();
    __break(1u);
    return result;
  }

  uint64_t v3 = *(void *)(v1 + 21);
  if (v3 < 0) {
    goto LABEL_11;
  }
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = sub_189483100(37LL, v1, v2);
  uint64_t v8 = *(void *)(v1 + 21);
  if (v8 < 0) {
    goto LABEL_11;
  }
  uint64_t v9 = sub_189486A60(v8, v7, v4, v5, v6);
  uint64_t result = sub_18948CC78(v9, v10, v11, v12);
  if (!result) {
    return 0LL;
  }
  return result;
}

uint64_t sub_18948B344()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_189483100(37LL, v1, v2);
  if (v1 && v2 - v1 >= 37)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *(void *)(v1 + 21);
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      uint64_t v9 = sub_1894830EC(v8, v7, v4, v5, v6);
      return sub_18948CC78(v9, v10, v11, v12);
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.ClientBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = sub_189483100(0LL, v3, v4);
  if (v5 < 1)
  {
LABEL_57:
    uint64_t v28 = 0LL;
    unint64_t v29 = 0xE000000000000000LL;
    sub_1894A2358();
    swift_bridgeObjectRelease();
    uint64_t v28 = 0xD00000000000001CLL;
    unint64_t v29 = 0x80000001894A5910LL;
    sub_189486E64();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
LABEL_58:
    sub_1894A23AC();
    __break(1u);
LABEL_59:
    sub_1894A23A0();
    __break(1u);
LABEL_60:
    sub_1894A23E8();
    __break(1u);
LABEL_61:
    sub_1894A23A0();
    __break(1u);
  }

  else
  {
    uint64_t v10 = v6;
    if ((v6 & 0x8000000000000000LL) == 0)
    {
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      uint64_t v13 = v9 - v8;
      if (v8) {
        uint64_t v14 = v9 - v8;
      }
      else {
        uint64_t v14 = 0LL;
      }
      BOOL v16 = v7 < 0 || v13 < v7;
      uint64_t v17 = a1;
      while (1)
      {
        if (v12)
        {
          if (v13 < v11) {
            goto LABEL_62;
          }
          BOOL v18 = (void *)(v12 + v10);
        }

        else
        {
          if (v11 > 0) {
            goto LABEL_62;
          }
          BOOL v18 = 0LL;
        }

        unint64_t v19 = v11 - v10;
        BOOL v20 = __OFSUB__(v11, v10);
        if ((v19 & 0x8000000000000000LL) != 0) {
          goto LABEL_62;
        }
        if (v19) {
          break;
        }
        if (v18) {
          goto LABEL_26;
        }
        uint64_t v21 = 0LL;
LABEL_27:
        uint64_t result = sub_18948AF08(v18, v21, &v28);
        unint64_t v23 = v29;
        if (!v17)
        {
          *a2 = v28;
          a2[1] = v23;
          return result;
        }

        unint64_t v24 = *(void *)(v28 + 8);
        if ((v24 & 0x8000000000000000LL) != 0) {
          goto LABEL_59;
        }
        if (v14 < 0) {
          goto LABEL_60;
        }
        if (v14 < v10) {
          goto LABEL_61;
        }
        if (v12)
        {
          if (v16) {
            goto LABEL_61;
          }
        }

        else if (v11)
        {
          goto LABEL_61;
        }

        if (v20)
        {
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_61;
        }

        uint64_t v25 = v11;
        if (v19 >= v24)
        {
          uint64_t v25 = v10 + v24;
          if (__OFADD__(v10, v24)) {
            goto LABEL_52;
          }
          if (v12)
          {
            if (v25 < 0 || v13 < v25) {
              goto LABEL_61;
            }
          }

          else if (v25)
          {
            goto LABEL_61;
          }
        }

        if (v25 < v10) {
          goto LABEL_61;
        }
        --v17;
        uint64_t v10 = v25;
        if (!--v5) {
          goto LABEL_57;
        }
      }

      if (!v18) {
        goto LABEL_62;
      }
LABEL_26:
      uint64_t v21 = (uint64_t)v18 + v19;
      goto LABEL_27;
    }
  }

BOOL static ComponentInitDataReader.Component.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComponentInitDataReader.Component.Error.hash(into:)()
{
  return sub_1894A2484();
}

BOOL sub_18948B8D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComponentInitDataReader.Component.identifier()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_189483100(48LL, v1, v2);
  if (v1 && v2 - v1 >= 48)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *(void *)(v1 + 16);
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      uint64_t v9 = sub_189486A60(v8, v7, v4, v5, v6);
      return sub_18948CC78(v9, v10, v11, v12);
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t sub_18948BA08()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_189483100(48LL, v1, v2);
  if (v1 && v2 - v1 >= 48)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *(void *)(v1 + 16);
    if ((v8 & 0x8000000000000000LL) == 0)
    {
      uint64_t v12 = sub_1894830EC(v8, v7, v4, v5, v6);
      uint64_t v13 = *(void *)(v1 + 24);
      if ((v13 & 0x8000000000000000LL) == 0)
      {
        uint64_t v14 = sub_189486A60(v13, v12, v9, v10, v11);
        return sub_18948CC78(v14, v15, v16, v17);
      }
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Component.clients.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*v1 && v1[1] - v3 >= 48)
  {
    uint64_t v4 = *(void *)(v3 + 32);
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      uint64_t result = sub_18948BA08();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.ComponentBuffer.count.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ComponentInitDataReader.ComponentBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  uint64_t result = sub_189483100(0LL, v5, v6);
  if (v7 < 1)
  {
LABEL_46:
    sub_1894A2358();
    sub_189486E64();
    sub_1894A2334();
    swift_bridgeObjectRelease();
    sub_1894A21FC();
    while (1)
    {
LABEL_57:
      sub_1894A23AC();
      __break(1u);
    }
  }

  if (result < 0)
  {
LABEL_52:
    sub_1894A23E8();
    __break(1u);
LABEL_53:
    char v22 = 1;
    goto LABEL_56;
  }

  uint64_t v12 = v11 - v10;
  if (v10) {
    uint64_t v13 = v11 - v10;
  }
  else {
    uint64_t v13 = 0LL;
  }
  BOOL v15 = v9 < 0 || v12 < v9;
  uint64_t v16 = a1;
  while (1)
  {
    if (v10)
    {
      if (v12 < v9) {
        goto LABEL_52;
      }
      uint64_t v17 = (void *)(v10 + result);
    }

    else
    {
      if (v9 > 0) {
        goto LABEL_52;
      }
      uint64_t v17 = 0LL;
    }

    unint64_t v18 = v9 - result;
    BOOL v19 = __OFSUB__(v9, result);
    if ((v18 & 0x8000000000000000LL) != 0) {
      goto LABEL_52;
    }
    if (!v18) {
      goto LABEL_51;
    }
    if (!v17) {
      goto LABEL_52;
    }
    if (v18 < 0x30)
    {
LABEL_51:
      char v22 = 0;
LABEL_56:
      sub_18948CDE4();
      swift_allocError();
      *unint64_t v23 = v22;
      swift_willThrow();
      sub_1894A2358();
      sub_1894A21FC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC48);
      sub_1894A2394();
      goto LABEL_57;
    }

    if (*v17 != 0x434F4D5044415441LL) {
      goto LABEL_53;
    }
    unint64_t v20 = v17[1];
    if ((v20 & 0x8000000000000000LL) != 0)
    {
      sub_1894A23A0();
      __break(1u);
LABEL_55:
      char v22 = 2;
      goto LABEL_56;
    }

    if (v18 < v20) {
      goto LABEL_55;
    }
    if (!v16)
    {
      *a2 = v17;
      a2[1] = (char *)v17 + v20;
      return result;
    }

    if (v20 <= 0x2F) {
      goto LABEL_57;
    }
    if (v13 < 0) {
      break;
    }
    if (v13 < result) {
      goto LABEL_61;
    }
    if (v10)
    {
      if (v15) {
        goto LABEL_61;
      }
    }

    else if (v9)
    {
      goto LABEL_61;
    }

    if (v19)
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_61;
    }

    uint64_t v21 = result + v20;
    if (__OFADD__(result, v20)) {
      goto LABEL_49;
    }
    if (v10)
    {
      if (v21 < 0 || v12 < v21) {
        goto LABEL_61;
      }
    }

    else if (v21)
    {
      goto LABEL_61;
    }

    if (v21 < result) {
      goto LABEL_61;
    }
    --v16;
    result += v20;
    if (!--v7) {
      goto LABEL_46;
    }
  }

  sub_1894A23E8();
  __break(1u);
LABEL_60:
  sub_1894A23A0();
  __break(1u);
LABEL_61:
  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Error.description.getter()
{
  unint64_t v1 = 0x64696C61766E692ELL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010LL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696146646E69622ELL;
  }
}

uint64_t sub_18948C18C()
{
  unint64_t v1 = 0x64696C61766E692ELL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010LL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696146646E69622ELL;
  }
}

void *ComponentInitDataReader.init(start:count:)@<X0>( void *result@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)sub_1894A23E8();
    __break(1u);
  }

  else
  {
    if (a2 >= 0x20)
    {
      if (*result == 0x494E495444415441LL)
      {
        if (result[1] == a2)
        {
          *a3 = result;
          a3[1] = (char *)result + a2;
          return result;
        }

        char v3 = 2;
      }

      else
      {
        char v3 = 1;
      }
    }

    else
    {
      char v3 = 0;
    }

    sub_18948CE28();
    swift_allocError();
    *uint64_t v4 = v3;
    return (void *)swift_willThrow();
  }

  return result;
}

uint64_t sub_18948C2F0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_189483100(32LL, v1, v2);
  if (!v1 || v2 - v1 < 32)
  {
LABEL_7:
    sub_1894A23AC();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v7 = *(void *)(v1 + 16);
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    if ((unsigned __int128)(v7 * (__int128)24LL) >> 64 == (24 * v7) >> 63)
    {
      uint64_t v8 = sub_189486A60(24 * v7, v3, v4, v5, v6);
      return sub_18948CC78(v8, v9, v10, v11);
    }

    __break(1u);
    goto LABEL_7;
  }

uint64_t ComponentInitDataReader.endpointCount.getter()
{
  uint64_t v1 = *v0;
  if (!*v0 || v0[1] - v1 < 32)
  {
    sub_1894A23AC();
    __break(1u);
    goto LABEL_6;
  }

  uint64_t result = *(void *)(v1 + 16);
  if (result < 0)
  {
LABEL_6:
    uint64_t result = sub_1894A23A0();
    __break(1u);
  }

  return result;
}

uint64_t ComponentInitDataReader.totalClientCount.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  *(void *)&__int128 v8 = *v0;
  *((void *)&v8 + 1) = v2;
  uint64_t result = ComponentInitDataReader.components.getter((uint64_t *)&v11);
  uint64_t v4 = v12;
  if ((v12 & 0x8000000000000000LL) == 0)
  {
    uint64_t v5 = 0LL;
    if (!v12) {
      return v5;
    }
    uint64_t v6 = 0LL;
    while (1)
    {
      *(void *)&__int128 v8 = v1;
      *((void *)&v8 + 1) = v2;
      ComponentInitDataReader.components.getter((uint64_t *)&v11);
      __int128 v8 = v11;
      uint64_t v9 = v12;
      ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v10);
      uint64_t result = ComponentInitDataReader.Component.clients.getter((uint64_t *)&v8);
      BOOL v7 = __OFADD__(v5, v9);
      v5 += v9;
      if (v7) {
        break;
      }
      if (v4 == ++v6) {
        return v5;
      }
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.components.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*v1 && v1[1] - v3 >= 32)
  {
    uint64_t v4 = *(void *)(v3 + 24);
    if ((v4 & 0x8000000000000000LL) == 0)
    {
      uint64_t result = sub_18948C968();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23A0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.totalTypesCount.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  *(void *)&__int128 v14 = *v0;
  *((void *)&v14 + 1) = v2;
  uint64_t result = ComponentInitDataReader.components.getter((uint64_t *)&v16);
  uint64_t v4 = v17;
  if ((v17 & 0x8000000000000000LL) == 0)
  {
    uint64_t v5 = 0LL;
    if (!v17) {
      return v5;
    }
    uint64_t v6 = 0LL;
    while (1)
    {
      *(void *)&__int128 v14 = v1;
      *((void *)&v14 + 1) = v2;
      ComponentInitDataReader.components.getter((uint64_t *)&v16);
      __int128 v14 = v16;
      uint64_t v15 = v17;
      ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v10);
      __int128 v13 = v10;
      uint64_t result = ComponentInitDataReader.Component.clients.getter((uint64_t *)&v14);
      uint64_t v7 = v15;
      if (v15 < 0) {
        break;
      }
      if (v15)
      {
        uint64_t v8 = 0LL;
        while (1)
        {
          *(void *)&__int128 v14 = v1;
          *((void *)&v14 + 1) = v2;
          ComponentInitDataReader.components.getter((uint64_t *)&v16);
          __int128 v14 = v16;
          uint64_t v15 = v17;
          ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v13);
          __int128 v10 = v13;
          ComponentInitDataReader.Component.clients.getter((uint64_t *)&v14);
          __int128 v10 = v14;
          uint64_t v11 = v15;
          ComponentInitDataReader.ClientBuffer.subscript.getter(v8, &v12);
          uint64_t result = ComponentInitDataReader.Client.types.getter((uint64_t *)&v10);
          BOOL v9 = __OFADD__(v5, v11);
          v5 += v11;
          if (v9) {
            break;
          }
          if (v7 == ++v8) {
            goto LABEL_4;
          }
        }

        __break(1u);
        break;
      }

LABEL_4:
      if (++v6 == v4) {
        return v5;
      }
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

    if (qword_18C79AB18 != -1) {
      goto LABEL_38;
    }
    goto LABEL_5;
  }

  v30[1] = v2;
  a2 = *(void *)(a1 + 16);
  __int128 v16 = a2 + 64;
  uint64_t v17 = 1LL << *(_BYTE *)(a2 + 32);
  unint64_t v18 = -1LL;
  if (v17 < 64) {
    unint64_t v18 = ~(-1LL << v17);
  }
  BOOL v19 = v18 & *(void *)(a2 + 64);
  uint64_t v3 = (unint64_t)(v17 + 63) >> 6;
  swift_bridgeObjectRetain();
  unint64_t v20 = 0LL;
  while (1)
  {
    if (v19)
    {
      uint64_t v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      char v22 = v21 | (v20 << 6);
      goto LABEL_16;
    }

    uint64_t v26 = v20 + 1;
    if (__OFADD__(v20, 1LL))
    {
      __break(1u);
      goto LABEL_37;
    }

    if (v26 >= v3) {
      goto LABEL_34;
    }
    unint64_t v27 = *(void *)(v16 + 8 * v26);
    ++v20;
    if (!v27)
    {
      unint64_t v20 = v26 + 1;
      if (v26 + 1 >= v3) {
        goto LABEL_34;
      }
      unint64_t v27 = *(void *)(v16 + 8 * v20);
      if (!v27)
      {
        unint64_t v20 = v26 + 2;
        if (v26 + 2 >= v3) {
          goto LABEL_34;
        }
        unint64_t v27 = *(void *)(v16 + 8 * v20);
        if (!v27) {
          break;
        }
      }
    }

uint64_t ComponentInitDataReader.endpoint(at:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(sub_18948C2F0() + 24 * a1) == 0x454E445044415441LL)
  {
    uint64_t v4 = 24 * a1;
    uint64_t v5 = *(void *)(sub_18948C2F0() + v4 + 8);
    uint64_t result = sub_18948C2F0();
    uint64_t v7 = *(void *)(result + v4 + 16);
    *a2 = v5;
    a2[1] = v7;
  }

  else
  {
    sub_1894A2358();
    swift_bridgeObjectRelease();
    sub_18948CE6C();
    sub_1894A2334();
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18948C968()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_189483100(32LL, v1, v2);
  if (!v1 || v2 - v1 < 32)
  {
LABEL_7:
    sub_1894A23AC();
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v7 = *(void *)(v1 + 16);
  if ((v7 & 0x8000000000000000LL) == 0)
  {
    if ((unsigned __int128)(v7 * (__int128)24LL) >> 64 == (24 * v7) >> 63)
    {
      uint64_t v8 = sub_1894830EC(24 * v7, v3, v4, v5, v6);
      return sub_18948CC78(v8, v9, v10, v11);
    }

    __break(1u);
    goto LABEL_7;
  }

uint64_t sub_18948CA88(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_18948CAA4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_18948CAA4(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC78);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  __int128 v13 = v10 + 32;
  __int128 v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

LABEL_32:
  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

char *sub_18948CC00(uint64_t a1)
{
  return sub_189492128(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_18948CC14(uint64_t result, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a2 != a4) {
    return 0LL;
  }
  if (a2 < 0)
  {
    __break(1u);
    return result;
  }

  if (!a2) {
    return 1LL;
  }
  uint64_t v4 = (unsigned __int8 *)(result + 1);
  uint64_t v5 = a3 + 1;
  uint64_t v6 = a2 - 1;
  do
  {
    uint64_t result = v6 == 0;
    if (!v6) {
      break;
    }
    int v8 = *v4++;
    int v7 = v8;
    int v9 = *v5++;
    --v6;
  }

  while (v7 == v9);
  return result;
}

uint64_t sub_18948CC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    if (a4 - a3 < a2) {
      goto LABEL_12;
    }
    uint64_t result = a3 + a1;
    uint64_t v7 = a2 - a1;
    BOOL v6 = v7 == 0;
    if (v7 < 0) {
      goto LABEL_12;
    }
  }

  else
  {
    if (a2 > 0) {
      goto LABEL_12;
    }
    uint64_t result = 0LL;
    uint64_t v8 = a2 - a1;
    BOOL v6 = v8 == 0;
    if (v8 < 0) {
      goto LABEL_12;
    }
  }

  if (!v6 && !result)
  {
LABEL_12:
    uint64_t result = sub_1894A23E8();
    __break(1u);
  }

  return result;
}

unint64_t sub_18948CDA0()
{
  unint64_t result = qword_18C79AC38;
  if (!qword_18C79AC38)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for ComponentInitDataBuilder.Error,  &type metadata for ComponentInitDataBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_18C79AC38);
  }

  return result;
}

unint64_t sub_18948CDE4()
{
  unint64_t result = qword_18C79AC40;
  if (!qword_18C79AC40)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for ComponentInitDataReader.Component.Error,  &type metadata for ComponentInitDataReader.Component.Error);
    atomic_store(result, (unint64_t *)&qword_18C79AC40);
  }

  return result;
}

unint64_t sub_18948CE28()
{
  unint64_t result = qword_18C79AC50;
  if (!qword_18C79AC50)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for ComponentInitDataReader.Error,  &type metadata for ComponentInitDataReader.Error);
    atomic_store(result, (unint64_t *)&qword_18C79AC50);
  }

  return result;
}

unint64_t sub_18948CE6C()
{
  unint64_t result = qword_18C79AC58;
  if (!qword_18C79AC58)
  {
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x18961A8F0], MEMORY[0x18961A8C8]);
    atomic_store(result, (unint64_t *)&qword_18C79AC58);
  }

  return result;
}

unint64_t sub_18948CEB4()
{
  unint64_t result = qword_18C79AC60;
  if (!qword_18C79AC60)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for ComponentInitDataBuilder.Error,  &type metadata for ComponentInitDataBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_18C79AC60);
  }

  return result;
}

unint64_t sub_18948CEFC()
{
  unint64_t result = qword_18C79AC68;
  if (!qword_18C79AC68)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for ComponentInitDataReader.Component.Error,  &type metadata for ComponentInitDataReader.Component.Error);
    atomic_store(result, (unint64_t *)&qword_18C79AC68);
  }

  return result;
}

unint64_t sub_18948CF44()
{
  unint64_t result = qword_18C79AC70;
  if (!qword_18C79AC70)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for ComponentInitDataReader.Error,  &type metadata for ComponentInitDataReader.Error);
    atomic_store(result, (unint64_t *)&qword_18C79AC70);
  }

  return result;
}

ValueMetadata *type metadata accessor for EndpointTuple()
{
  return &type metadata for EndpointTuple;
}

uint64_t destroy for ComponentInitDataBuilder()
{
  return swift_bridgeObjectRelease();
}

void *_s9Tightbeam24ComponentInitDataBuilderVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComponentInitDataBuilder(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ComponentInitDataBuilder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder()
{
  return &type metadata for ComponentInitDataBuilder;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Error( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_18948D20C + 4 * byte_1894A30A5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18948D240 + 4 * asc_1894A30A0[v4]))();
}

uint64_t sub_18948D240(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18948D248(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18948D250LL);
  }
  return result;
}

uint64_t sub_18948D25C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18948D264LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_18948D268(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18948D270(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18948D27C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18948D288(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Error()
{
  return &type metadata for ComponentInitDataBuilder.Error;
}

void *initializeBufferWithCopyOfBuffer for ComponentInitDataBuilder.TypeData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ComponentInitDataBuilder.TypeData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ComponentInitDataBuilder.TypeData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ComponentInitDataBuilder.TypeData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.TypeData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.TypeData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.TypeData()
{
  return &type metadata for ComponentInitDataBuilder.TypeData;
}

uint64_t destroy for ComponentInitDataBuilder.Client()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_DWORD *)(a1 + 6) = *(_DWORD *)(a2 + 6);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Client(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Client(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Client()
{
  return &type metadata for ComponentInitDataBuilder.Client;
}

uint64_t destroy for ComponentInitDataBuilder.Component()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ComponentInitDataBuilder.Component(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComponentInitDataBuilder.Component(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComponentInitDataBuilder.Component(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Component(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Component()
{
  return &type metadata for ComponentInitDataBuilder.Component;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Endpoint()
{
  return &type metadata for ComponentInitDataBuilder.Endpoint;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader()
{
  return &type metadata for ComponentInitDataReader;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.TypeData()
{
  return &type metadata for ComponentInitDataReader.TypeData;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.TypeBuffer()
{
  return &type metadata for ComponentInitDataReader.TypeBuffer;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Client()
{
  return &type metadata for ComponentInitDataReader.Client;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.ClientBuffer()
{
  return &type metadata for ComponentInitDataReader.ClientBuffer;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Component()
{
  return &type metadata for ComponentInitDataReader.Component;
}

_BYTE *sub_18948D83C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Component.Error()
{
  return &type metadata for ComponentInitDataReader.Component.Error;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataReader.ComponentBuffer(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataReader.ComponentBuffer( uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.ComponentBuffer()
{
  return &type metadata for ComponentInitDataReader.ComponentBuffer;
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV9ComponentV5ErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t _s9Tightbeam23ComponentInitDataReaderV9ComponentV5ErrorOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_18948D98C + 4 * byte_1894A30AF[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_18948D9C0 + 4 * byte_1894A30AA[v4]))();
}

uint64_t sub_18948D9C0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18948D9C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18948D9D0LL);
  }
  return result;
}

uint64_t sub_18948D9DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18948D9E4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_18948D9E8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18948D9F0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Error()
{
  return &type metadata for ComponentInitDataReader.Error;
}

ValueMetadata *type metadata accessor for _StaticString()
{
  return &type metadata for _StaticString;
}

ValueMetadata *type metadata accessor for EveIncomingMessageBuffer()
{
  return &type metadata for EveIncomingMessageBuffer;
}

ValueMetadata *type metadata accessor for EveMessageID()
{
  return &type metadata for EveMessageID;
}

uint64_t sub_18948DA78()
{
  return 24LL;
}

uint64_t sub_18948DA80()
{
  return sub_1894A249C();
}

uint64_t sub_18948DAD8()
{
  return sub_1894A2490();
}

uint64_t sub_18948DB10()
{
  return sub_1894A249C();
}

BOOL sub_18948DB64(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_18948DB80()
{
  unint64_t result = qword_18C79AC80;
  if (!qword_18C79AC80)
  {
    unint64_t result = MEMORY[0x1895E7954](&unk_1894A3488, &type metadata for EveMessageID);
    atomic_store(result, (unint64_t *)&qword_18C79AC80);
  }

  return result;
}

uint64_t sub_18948DBC4()
{
  uint64_t v2 = *v1;
  unint64_t v3 = *(void *)(*v1 + 16);
  if (v3 >= 0x18)
  {
    unint64_t v4 = *(void *)(v2 + 32);
    if (v3 >= v4)
    {
      unint64_t v5 = v4 - 24;
      if (v4 < 0x18)
      {
        __break(1u);
        goto LABEL_22;
      }

      uint64_t v0 = *(void *)(v2 + 40);
      uint64_t v7 = sub_189483458(*(void *)(v2 + 32), *v1);
      uint64_t v8 = v6;
      uint64_t v19 = v9;
      unint64_t v11 = v10;
      if ((v10 & 1) != 0)
      {
        uint64_t v18 = v6;
        sub_1894A2418();
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v13 = swift_dynamicCastClass();
        if (!v13)
        {
          swift_unknownObjectRelease();
          uint64_t v13 = MEMORY[0x18961AFE8];
        }

        uint64_t v14 = *(void *)(v13 + 16);
        swift_release();
        if (__OFSUB__(v11 >> 1, v19))
        {
          __break(1u);
        }

        else if (v14 == (v11 >> 1) - v19)
        {
          uint64_t v12 = swift_dynamicCastClass();
          unint64_t v5 = v4 - 24;
          if (!v12)
          {
            swift_unknownObjectRelease();
            uint64_t v12 = MEMORY[0x18961AFE8];
          }

LABEL_22:
          swift_bridgeObjectRelease();
          sub_18948DDD8(v2, v2 + 32, 24LL, (2 * v4) | 1);
LABEL_19:
          swift_bridgeObjectRelease();
          return v0;
        }

        swift_unknownObjectRelease();
        uint64_t v8 = v18;
        unint64_t v5 = v4 - 24;
      }

      else
      {
        swift_bridgeObjectRetain();
      }

      uint64_t v12 = sub_18948DDD8(v7, v8, v19, v11);
      goto LABEL_14;
    }
  }

  return 0LL;
}

uint64_t sub_18948DDD8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x18961AFE8];
    }
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x18961AFE8];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = v8 + 4;
        memcpy(v10, (const void *)(a2 + a3), v5);
        return (uint64_t)v8;
      }
    }

    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC88);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3) {
        goto LABEL_5;
      }
    }

    __break(1u);
  }

  __break(1u);
LABEL_17:
  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_18948DF30()
{
  uint64_t v0 = sub_1894A22BC();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  unint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1894A22B0();
  MEMORY[0x1895F8858](v4);
  uint64_t v5 = sub_1894A2154();
  MEMORY[0x1895F8858](v5);
  sub_18948828C();
  sub_1894A2148();
  v7[1] = MEMORY[0x18961AFE8];
  sub_1894882C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC28);
  sub_189488310();
  sub_1894A2340();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x18961B900], v0);
  uint64_t result = sub_1894A22D4();
  qword_18C79AC90 = result;
  return result;
}

void *sub_18948E0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  v45[5] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v12 = sub_1894A1F5C();
  MEMORY[0x1895F8858](v12);
  uint64_t v40 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_18C79AC98);
  MEMORY[0x1895F8858](v14);
  uint64_t v16 = (uint64_t *)((char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = MEMORY[0x18961AFE8];
  v7[14] = a2;
  v7[15] = v17;
  v7[13] = a1;
  uint64_t v43 = a3;
  uint64_t v41 = v7 + 7;
  sub_189488234(a3, (uint64_t)(v7 + 7));
  uint64_t v42 = a4;
  unint64_t v37 = v7 + 2;
  sub_189488234(a4, (uint64_t)(v7 + 2));
  uint64_t v18 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  id v19 = objc_msgSend(v18, sel_defaultManager);
  uint64_t v38 = a1;
  unint64_t v20 = (void *)sub_1894A2190();
  v45[0] = 0LL;
  LODWORD(a1) = objc_msgSend(v19, sel_removeItemAtPath_error_, v20, v45);

  if ((_DWORD)a1)
  {
    id v21 = v45[0];
  }

  else
  {
    id v22 = v45[0];
    uint64_t v23 = sub_1894A1E84();

    swift_willThrow();
    MEMORY[0x1895E78D0](v23);
    uint64_t v6 = 0LL;
  }

  uint64_t v39 = v6;
  sub_1894A2094();
  sub_1894A2088();
  if (qword_18C79AB20 != -1) {
    swift_once();
  }
  sub_1894A20E8();
  swift_allocObject();
  swift_retain();
  uint64_t v24 = sub_1894A20DC();
  sub_1894A2070();
  swift_retain();
  uint64_t v25 = (void (*)(id *, void))sub_1894A2064();
  if (*v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1894A23B8();
    swift_bridgeObjectRelease();
    if (v36 < 0)
    {
      __break(1u);
      goto LABEL_14;
    }
  }

  sub_1894879F8(0LL, 0LL, v24);
  v25(v45, 0LL);
  swift_release();
  *uint64_t v16 = v38;
  v16[1] = a2;
  uint64_t v27 = *MEMORY[0x189608818];
  uint64_t v28 = sub_1894A1F68();
  uint64_t v29 = *(void *)(v28 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v29 + 104))(v16, v27, v28);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v16, 0LL, 1LL, v28);
  sub_1894A207C();
  swift_retain();
  sub_1894A1F50();
  sub_1894A1FB0();
  swift_allocObject();
  uint64_t v30 = v39;
  uint64_t v31 = sub_1894A1FA4();
  if (!v30)
  {
    v7[12] = v31;
    uint64_t v32 = (void *)*__swift_project_boxed_opaque_existential_1(v41, v7[10]);
    v45[3] = (id)type metadata accessor for UnixTransportService();
    v45[4] = &off_18A3AD298;
    v45[0] = v32;
    sub_189488234((uint64_t)v45, (uint64_t)v44);
    uint64_t v33 = swift_allocObject();
    sub_18948E970(v44, v33 + 16);
    swift_retain();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    sub_18948827C((uint64_t)sub_18948E988);
    sub_1894A1F74();
    swift_release();
    swift_release();
    swift_retain();
    swift_retain();
    sub_18948827C((uint64_t)sub_18948E990);
    sub_1894A1F80();
    swift_release();
    swift_release();
    if (qword_18C79AB08 == -1)
    {
LABEL_10:
      sub_1894A1F98();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v42);
      __swift_destroy_boxed_opaque_existential_1(v43);
      return v7;
    }

uint64_t sub_18948E5E0(uint64_t a1)
{
  uint64_t v2 = sub_1894A1F8C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x189608870])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_4:
    v8[0] = 0LL;
    v8[1] = 0xE000000000000000LL;
    sub_1894A2358();
    sub_1894A21FC();
    sub_1894A2394();
    sub_1894872E4();
    return swift_bridgeObjectRelease();
  }

  if (v6 == *MEMORY[0x189608878]) {
    goto LABEL_4;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_18948E724(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v2[13];
  uint64_t v5 = v2[14];
  sub_189488234((uint64_t)(v2 + 2), (uint64_t)v16);
  type metadata accessor for UnixProtocolConnection();
  int v6 = (void *)swift_allocObject();
  uint64_t v7 = v17;
  uint64_t v8 = v18;
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x1895F8858](v9);
  unint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  (*(void (**)(_BYTE *))(v12 + 16))(v11);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_189487CD0(v4, v5, (uint64_t)v11, a1, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  uint64_t v13 = swift_beginAccess();
  MEMORY[0x1895E7294](v13);
  if (*(void *)((v2[15] & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((v2[15] & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
    sub_1894A2274();
  }
  sub_1894A228C();
  sub_1894A2268();
  return swift_endAccess();
}

uint64_t UnixListener.deinit()
{
  return v0;
}

uint64_t UnixListener.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnixListener()
{
  return objc_opt_self();
}

uint64_t method lookup function for UnixListener()
{
  return swift_lookUpClassMethod();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_18948E94C()
{
  return swift_deallocObject();
}

uint64_t sub_18948E970(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  return a2;
}

uint64_t sub_18948E988(uint64_t a1)
{
  return sub_18948E5E0(a1);
}

uint64_t sub_18948E994()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for ComponentRuntimeLock(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntimeLock(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 2) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for _UnsafeMutableBufferPointer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _UnsafeMutableBufferPointer);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895E7900](a1, v6, a5);
}

void sub_18948EA54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1894A1F08();
  MEMORY[0x1895F8858](v3);
  __asm { BR              X10 }

uint64_t sub_18948EAD8()
{
  uint64_t v7 = *v2;
  int64_t v8 = *((void *)*v2 + 2);
  int64_t v9 = v8 + BYTE6(v3);
  if (__OFADD__(v8, BYTE6(v3)))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  void *v2 = v7;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (int64_t v11 = *((void *)v7 + 3) >> 1, v11 < v9))
  {
    if (v8 <= v9) {
      int64_t v12 = v8 + BYTE6(v3);
    }
    else {
      int64_t v12 = v8;
    }
    uint64_t v7 = sub_189492128(isUniquelyReferenced_nonNull_native, v12, 1, v7);
    void *v2 = v7;
    int64_t v11 = *((void *)v7 + 3) >> 1;
  }

  uint64_t v13 = v11 - *((void *)v7 + 2);
  sub_189488400(v4, v3);
  uint64_t v14 = sub_1894A1EE4();
  sub_189488444(v4, v3);
  sub_189488444(v4, v3);
  if (v14 < BYTE6(v3)) {
    goto LABEL_15;
  }
  if (v14 >= 1)
  {
    uint64_t v15 = *((void *)v7 + 2);
    BOOL v16 = __OFADD__(v15, v14);
    uint64_t v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      JUMPOUT(0x18948ECD0LL);
    }

    *((void *)v7 + 2) = v17;
  }

  if (v14 == v13)
  {
LABEL_16:
    int64_t v19 = *((void *)v7 + 2);
    sub_189482774( (unint64_t *)&qword_18C79AD50,  (uint64_t (*)(uint64_t))MEMORY[0x189606D08],  MEMORY[0x189606D20]);
    sub_1894A2304();
    if ((*(_BYTE *)(v6 - 81) & 1) != 0) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
    }
    while (1)
    {
      unint64_t v20 = *((void *)v7 + 3);
      int64_t v21 = v20 >> 1;
      uint64_t v7 = sub_189492128((char *)(v20 > 1), v19 + 1, 1, v7);
      void *v2 = v7;
      char v22 = *(_BYTE *)(v6 - 81);
      int64_t v21 = *((void *)v7 + 3) >> 1;
      if ((v22 & 1) == 0) {
        goto LABEL_21;
      }
LABEL_18:
      *((void *)v7 + 2) = v19;
      if ((v22 & 1) != 0) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
      }
    }

    char v22 = 0;
    do
    {
LABEL_21:
      if (v19 >= v21) {
        break;
      }
      v7[v19++ + 32] = *(_BYTE *)(v6 - 82);
      sub_1894A2304();
      char v22 = *(_BYTE *)(v6 - 81);
    }

    while ((v22 & 1) == 0);
    goto LABEL_18;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
}

uint64_t sub_18948ECE8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18948ED18()
{
  uint64_t v0 = swift_allocObject();
  unint64_t v1 = sub_18948ED80(MEMORY[0x18961AFE8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADA0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v1;
  *(void *)(v0 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = result;
  qword_18C79BDE8 = v0;
  return result;
}

unint64_t sub_18948ED80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADA8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD80);
  uint64_t v6 = sub_1894A23DC();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }

  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_189494C04(v12, (uint64_t)v5, &qword_18C79ADA8);
    unint64_t result = sub_1894927FC((uint64_t)v5);
    if ((v15 & 1) != 0) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_1894A1ECC();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32LL))( v17 + *(void *)(*(void *)(v18 - 8) + 72LL) * v16,  v5,  v18);
    *(void *)(v7[7] + 8 * v__swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1LL);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    void v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_18948EF14(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD70);
  uint64_t v2 = sub_1894A23DC();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_189494C04(v6, (uint64_t)&v13, &qword_18C79AD78);
    uint64_t v7 = v13;
    unint64_t result = sub_189492904(v13);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_189494BB4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1LL);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40LL;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_18948F040@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_1894A1ECC();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  char v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *a1;
  if (*(void *)(*a1 + 16) && (unint64_t v11 = sub_1894927FC(a2), (v12 & 1) != 0))
  {
    *a3 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    return swift_retain();
  }

  else
  {
    __int128 v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v14(v9, a2, v6);
    type metadata accessor for EveTransportManager(0LL);
    uint64_t v15 = swift_allocObject();
    sub_18949047C((uint64_t)v9);
    v14(v9, a2, v6);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *a1;
    *a1 = 0x8000000000000000LL;
    sub_1894938E4(v15, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
    *a1 = v18;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a3 = v15;
  }

  return result;
}

uint64_t sub_18948F1A0()
{
  return sub_189491B8C();
}

uint64_t sub_18948F1A8()
{
  uint64_t v0 = sub_1894A1F38();
  __swift_allocate_value_buffer(v0, qword_18C79AD20);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C79AD20);
  return sub_1894A1F2C();
}

uint64_t sub_18948F224(uint64_t a1)
{
  *(_DWORD *)(v1 + 32) = 0;
  *(_BYTE *)(v1 + 36) = 1;
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = dispatch_semaphore_create(0LL);
  type metadata accessor for TightbeamMessage();
  uint64_t v3 = (void *)swift_allocObject();
  v3[3] = 0LL;
  v3[4] = 0LL;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v5 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 24) = 0LL;
    *(void *)(v6 + 32) = 0LL;
    *(void *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
    *(_BYTE *)(v6 + 40) = 1;
    v3[3] = a1;
    v3[4] = v6;
    v3[2] = 0xC000000000000000LL;
    *(void *)(v1 + 24) = v3;
    *(_DWORD *)(v1 + 32) = 0;
    *(_BYTE *)(v1 + 36) = 1;
    return v1;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18948F324()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_18948F350()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1LL << *(_BYTE *)(v1 + 32);
  uint64_t v4 = -1LL;
  if (v3 < 64) {
    uint64_t v4 = ~(-1LL << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }

    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
      __break(1u);
      goto LABEL_23;
    }

    if (v12 >= v6) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_21;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          goto LABEL_21;
        }
        unint64_t v13 = *(void *)(v2 + 8 * v8);
        if (!v13) {
          break;
        }
      }
    }

LABEL_20:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = *(void *)(*(void *)(v1 + 56) + 8 * v10);
    *(_DWORD *)(v11 + 32) = 4;
    *(_BYTE *)(v11 + 36) = 0;
    swift_retain();
    sub_1894A22EC();
    uint64_t result = swift_release();
  }

  int64_t v14 = v12 + 3;
  if (v14 >= v6)
  {
LABEL_21:
    swift_release();
    *(void *)(v0 + 24) = sub_1894944A8(MEMORY[0x18961AFE8]);
    return swift_bridgeObjectRelease();
  }

  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }

LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_18948F4FC()
{
  uint64_t v0 = sub_1894A2010();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1895F8858](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v2);
  int64_t v6 = (char *)&v10 - v5;
  sub_1894A2028();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x189608A20], v0);
  char v7 = MEMORY[0x1895E703C](v6, v4);
  int64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
  if ((v7 & 1) != 0)
  {
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_1894A2040();
    return swift_release_n();
  }

  return result;
}

uint64_t sub_18948F630(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_18948FD80(a1, a2, a4 & 1);
    return swift_release();
  }

  return result;
}

uint64_t sub_18948F6B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1894A1FD4();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  int64_t v8 = (uint64_t (**)(uint64_t))((char *)&v26[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = *(void *)(v2 + 40);
  if (v9 == -1)
  {
    __break(1u);
    goto LABEL_16;
  }

  *(void *)(v2 + 40) = v9 + 1;
  if (a1 < 0)
  {
LABEL_20:
    sub_1894A23A0();
    __break(1u);
LABEL_21:
    uint64_t result = sub_1894A23AC();
    __break(1u);
    return result;
  }

  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v26[0] = *(void *)(v2 + 24);
  *(void *)(v2 + 24) = 0x8000000000000000LL;
  sub_189493A40(a2, a1, v9, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 24) = v26[0];
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v11 = *(void *)(*(void *)(a2 + 24) + 32LL);
  if (!v11) {
    goto LABEL_21;
  }
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = *(void *)(v12 + 16);
  if (*(void *)(v12 + 24) < v13) {
    goto LABEL_21;
  }
  if (v13 < 0)
  {
LABEL_19:
    sub_1894A23E8();
    __break(1u);
    goto LABEL_20;
  }

  if (*(uint64_t *)(v12 + 32) < 24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_21;
  }

  int64_t v14 = *(void **)v12;
  *int64_t v14 = v13;
  v14[1] = a1;
  void v14[2] = v9;
  uint64_t v15 = *(uint64_t **)(v11 + 16);
  uint64_t v16 = v15[2];
  if (v15[3] < v16) {
    goto LABEL_21;
  }
  if (v16 < 0) {
    goto LABEL_19;
  }
  uint64_t v17 = *v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v11;
  *(void *)(v18 + 24) = v2;
  *int64_t v8 = sub_189494B2C;
  v8[1] = (uint64_t (*)(uint64_t))v18;
  (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v6 + 104))( v8,  *MEMORY[0x1896089B8],  v5);
  sub_1894A1FC8();
  swift_retain_n();
  swift_retain();
  sub_1894A1FBC();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD58);
  v27[3] = v19;
  v27[4] = sub_189494BC4((unint64_t *)&qword_18C79AD60, &qword_18C79AD58, MEMORY[0x189607080]);
  v27[0] = v17;
  v27[1] = v16;
  BOOL v20 = __swift_project_boxed_opaque_existential_1(v27, v19);
  if (*v20) {
    uint64_t v21 = (_BYTE *)(*v20 + v20[1]);
  }
  else {
    uint64_t v21 = 0LL;
  }
  sub_18949CB9C((_BYTE *)*v20, v21, v26);
  uint64_t v22 = v26[0];
  unint64_t v23 = v26[1];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  sub_1894A1FF8();
  sub_189488444(v22, v23);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t (**)(uint64_t), uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_18948FAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1894A1F38();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_18C79AB18 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_18C79AD20);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_retain();
  int64_t v8 = (void *)sub_1894A1F20();
  os_log_type_t v9 = sub_1894A22A4();
  if (!os_log_type_enabled((os_log_t)v8, v9))
  {

    swift_release();
    goto LABEL_9;
  }

  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v10 = 134217984;
  if (*(unsigned __int8 *)(a2 + 40) >= 2u
    || (uint64_t v11 = *(void *)(a2 + 16), v12 = *(void *)(v11 + 16), *(void *)(v11 + 24) < v12))
  {
    swift_release();
    sub_1894A23AC();
    __break(1u);
  }

  else if ((v12 & 0x8000000000000000LL) == 0)
  {
    uint64_t v13 = v10;
    v15[1] = *(void *)(v11 + 16);
    sub_1894A2310();
    swift_release();
    _os_log_impl(&dword_18947B000, (os_log_t)v8, v9, "| message sent, %ld bytes", v13, 0xCu);
    MEMORY[0x1895E79FC](v13, -1LL, -1LL);

LABEL_9:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_18948F4FC();
  }

  swift_release();
  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_18948FD80(uint64_t result, unint64_t a2, char a3)
{
  if (a2 >> 60 != 15)
  {
    uint64_t v5 = result;
    sub_189488400(result, a2);
    if (qword_18C79AB18 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1894A1F38();
    __swift_project_value_buffer(v6, (uint64_t)qword_18C79AD20);
    sub_189488400(v5, a2);
    uint64_t v7 = (os_log_s *)sub_1894A1F20();
    os_log_type_t v8 = sub_1894A22A4();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)swift_slowAlloc() = 134217984;
      __asm { BR              X11 }
    }

    sub_189494AEC(v5, a2);

    swift_beginAccess();
    sub_189488400(v5, a2);
    sub_18948EA54(v5, a2);
    swift_endAccess();
    sub_189490038();
    uint64_t result = sub_189494AEC(v5, a2);
  }

  if ((a3 & 1) != 0)
  {
    if (qword_18C79AB18 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1894A1F38();
    __swift_project_value_buffer(v9, (uint64_t)qword_18C79AD20);
    uint64_t v10 = (os_log_s *)sub_1894A1F20();
    os_log_type_t v11 = sub_1894A22A4();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_18947B000, v10, v11, "| disconnected", v12, 2u);
      MEMORY[0x1895E79FC](v12, -1LL, -1LL);
    }

    return sub_18948F350();
  }

  return result;
}

void sub_189490038()
{
  uint64_t v0 = sub_18948DBC4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  swift_endAccess();
  if (v4)
  {
    swift_beginAccess();
    uint64_t v5 = sub_189492D50(v0, v2);
    swift_endAccess();
    if (v5)
    {
      if (qword_18C79AB18 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_1894A1F38();
      __swift_project_value_buffer(v6, (uint64_t)qword_18C79AD20);
      swift_bridgeObjectRetain();
      uint64_t v7 = (os_log_s *)sub_1894A1F20();
      os_log_type_t v8 = sub_1894A22A4();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 134217984;
        sub_1894A2310();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_18947B000, v7, v8, "| copying out payload of %ld bytes", v9, 0xCu);
        MEMORY[0x1895E79FC](v9, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease();
      }

      uint64_t v14 = *(void *)(*(void *)(v5 + 24) + 32LL);
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v15 = sub_18948DA78();
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)(v14 + 16);
      if (v15 >= *(void *)(v17 + 24)) {
        goto LABEL_21;
      }
      *(void *)(v17 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v15;
      sub_18949C1BC(v4, *(void *)(v4 + 16));
      swift_retain();
      swift_bridgeObjectRelease();
      if (*(unsigned __int8 *)(v14 + 40) < 2u
        && (uint64_t v18 = *(void *)(v14 + 16), v16 < *(void *)(v18 + 24))
        && (*(void *)(v18 + 16) = v16, (uint64_t v19 = *(void *)(*(void *)(v5 + 24) + 24LL)) != 0))
      {
        tb_message_configure_received(v19, 2);
        sub_1894A22EC();
        swift_release();
        swift_release();
      }

      else
      {
LABEL_21:
        sub_1894A23AC();
        __break(1u);
      }
    }

    else
    {
      swift_bridgeObjectRelease();
      if (qword_18C79AB18 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_1894A1F38();
      __swift_project_value_buffer(v10, (uint64_t)qword_18C79AD20);
      os_log_type_t v11 = (os_log_s *)sub_1894A1F20();
      os_log_type_t v12 = sub_1894A2298();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 134218240;
        sub_1894A2310();
        *(_WORD *)(v13 + 12) = 2048;
        sub_1894A2310();
        _os_log_impl( &dword_18947B000,  v11,  v12,  "| reply message buffer for id %llu:%llu has already vanished!",  (uint8_t *)v13,  0x16u);
        MEMORY[0x1895E79FC](v13, -1LL, -1LL);
      }
    }
  }

uint64_t sub_189490448()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18949047C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v18 = a1;
  uint64_t v3 = sub_1894A22BC();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_1894A22B0();
  os_log_type_t v8 = (uint64_t (*)(uint64_t))MEMORY[0x18961B8A8];
  MEMORY[0x1895F8858](v7);
  uint64_t v9 = sub_1894A2154();
  MEMORY[0x1895F8858](v9);
  v17[1] = sub_18948828C();
  sub_1894A2148();
  uint64_t v19 = MEMORY[0x18961AFE8];
  sub_189482774((unint64_t *)&qword_18C79AC20, v8, MEMORY[0x18961B8C0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC28);
  sub_189494BC4((unint64_t *)&qword_18C79AC30, &qword_18C79AC28, MEMORY[0x189618470]);
  sub_1894A2340();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x18961B900], v3);
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = sub_1894A22D4();
  uint64_t v10 = v1 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
  uint64_t v11 = sub_1894A1ECC();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v18, v11);
  unint64_t v14 = sub_1894943AC(MEMORY[0x18961AFE8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD90);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 40) = 0;
  *(void *)(v15 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v15 + 24) = 0LL;
  *(void *)(v15 + 32) = v14;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v11);
  *(void *)(v2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener) = v15;
  return v2;
}

uint64_t sub_1894906D4(uint64_t *a1, uint64_t a2)
{
  v76[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v5 = sub_1894A1F5C();
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_18C79AC98);
  MEMORY[0x1895F8858](v8);
  uint64_t v10 = (uint64_t *)((char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = sub_1894A1ECC();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = MEMORY[0x1895F8858](v13);
  uint64_t v18 = (char *)&v64 - v17;
  if (!*a1)
  {
    uint64_t v70 = a2;
    uint64_t v71 = v7;
    uint64_t v68 = a1;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v73 = a2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
    uint64_t v74 = v2;
    char v72 = v19;
    ((void (*)(char *))v19)(v15);
    sub_1894A1EB4();
    BOOL v20 = *(void (**)(char *, uint64_t))(v12 + 8);
    v20(v15, v11);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1896078A8]), sel_init);
    uint64_t v22 = (void *)sub_1894A1E9C();
    sub_18948EF14(MEMORY[0x18961AFE8]);
    type metadata accessor for FileAttributeKey(0LL);
    sub_189482774( &qword_18C79ABD0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1894A2ED8);
    unint64_t v23 = (void *)sub_1894A2160();
    swift_bridgeObjectRelease();
    v76[0] = 0LL;
    unsigned int v24 = objc_msgSend( v21,  sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_,  v22,  1,  v23,  v76);

    if (v24)
    {
      uint64_t v67 = v18;
      uint64_t v69 = v20;
      uint64_t v25 = qword_18C79AB18;
      id v26 = v76[0];
      if (v25 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_1894A1F38();
      os_log_t v66 = (os_log_t)__swift_project_value_buffer(v27, (uint64_t)qword_18C79AD20);
      uint64_t v28 = (os_log_s *)sub_1894A1F20();
      os_log_type_t v29 = sub_1894A22A4();
      BOOL v30 = os_log_type_enabled(v28, v29);
      uint64_t v31 = v69;
      uint64_t v33 = v72;
      uint64_t v32 = v73;
      if (v30)
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_18947B000, v28, v29, "| creating new tightbeam listener socket", v34, 2u);
        MEMORY[0x1895E79FC](v34, -1LL, -1LL);
      }

      id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1896078A8]), sel_init);
      v33(v15, v32, v11);
      uint64_t v36 = (void *)sub_1894A1E9C();
      v31(v15, v11);
      v76[0] = 0LL;
      unsigned int v37 = objc_msgSend(v35, sel_removeItemAtURL_error_, v36, v76);

      id v38 = v76[0];
      if (!v37)
      {
        uint64_t v39 = v38;
        uint64_t v40 = sub_1894A1E84();

        swift_willThrow();
        MEMORY[0x1895E78D0](v40);
        uint64_t v74 = 0LL;
      }

      sub_1894A2094();
      sub_1894A2088();
      v33(v15, v32, v11);
      uint64_t v41 = sub_1894A1EC0();
      uint64_t v43 = v42;
      v31(v15, v11);
      *uint64_t v10 = v41;
      v10[1] = v43;
      uint64_t v44 = *MEMORY[0x189608818];
      uint64_t v45 = sub_1894A1F68();
      uint64_t v46 = v31;
      uint64_t v47 = *(void *)(v45 - 8);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v47 + 104))(v10, v44, v45);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v47 + 56))(v10, 0LL, 1LL, v45);
      sub_1894A207C();
      swift_retain();
      sub_1894A1F50();
      sub_1894A1FB0();
      swift_allocObject();
      uint64_t v48 = v74;
      uint64_t v49 = sub_1894A1FA4();
      if (v48)
      {
        v46(v67, v11);
        return swift_release();
      }

      else
      {
        uint64_t v51 = v49;
        uint64_t v74 = 0LL;
        uint64_t v52 = v68;
        swift_retain();
        swift_release();
        *uint64_t v52 = v51;
        swift_retain();
        sub_1894A1F74();
        swift_allocObject();
        swift_weakInit();
        swift_retain();
        sub_1894A1F80();
        swift_release();
        swift_retain_n();
        uint64_t v53 = (os_log_s *)sub_1894A1F20();
        os_log_type_t v54 = sub_1894A22A4();
        int v55 = v54;
        if (os_log_type_enabled(v53, v54))
        {
          LODWORD(v71) = v55;
          uint64_t v56 = (uint8_t *)swift_slowAlloc();
          uint64_t v68 = (uint64_t *)swift_slowAlloc();
          v76[0] = v68;
          uint64_t v65 = v56;
          os_log_t v66 = v53;
          *(_DWORD *)uint64_t v56 = 136315138;
          char v64 = v56 + 4;
          v33(v15, v73, v11);
          sub_189482774(&qword_18C79AD68, (uint64_t (*)(uint64_t))MEMORY[0x189606A90], MEMORY[0x189606AD0]);
          uint64_t v57 = sub_1894A2400();
          unint64_t v59 = v58;
          uint64_t v60 = (uint64_t (*)(char *, uint64_t))v69;
          v69(v15, v11);
          uint64_t v75 = sub_189492220(v57, v59, (uint64_t *)v76);
          sub_1894A2310();
          swift_release_n();
          swift_bridgeObjectRelease();
          unint64_t v62 = v65;
          os_log_t v61 = v66;
          _os_log_impl(&dword_18947B000, v66, (os_log_type_t)v71, "| opening new listener at: %s", v65, 0xCu);
          uint64_t v63 = v68;
          swift_arrayDestroy();
          MEMORY[0x1895E79FC](v63, -1LL, -1LL);
          MEMORY[0x1895E79FC](v62, -1LL, -1LL);
        }

        else
        {

          swift_release_n();
          uint64_t v60 = (uint64_t (*)(char *, uint64_t))v69;
        }

        sub_1894A1F98();
        swift_release();
        swift_release();
        return v60(v67, v11);
      }
    }

    else
    {
      id v50 = v76[0];
      sub_1894A1E84();

      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v20)(v18, v11);
    }
  }

  return result;
}

void sub_189490DE8(uint64_t a1)
{
  uint64_t v2 = sub_1894A1F8C();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1895F8858](v2);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)v17 - v7;
  if (qword_18C79AB18 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1894A1F38();
  __swift_project_value_buffer(v9, (uint64_t)qword_18C79AD20);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, a1, v2);
  uint64_t v11 = (os_log_s *)sub_1894A1F20();
  os_log_type_t v12 = sub_1894A22A4();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v18 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v17[1] = v13 + 4;
    v10(v6, (uint64_t)v8, v2);
    uint64_t v15 = sub_1894A21C0();
    void v17[2] = sub_189492220(v15, v16, &v18);
    sub_1894A2310();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    _os_log_impl(&dword_18947B000, v11, v12, "| listener did change state, new state: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E79FC](v14, -1LL, -1LL);
    MEMORY[0x1895E79FC](v13, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

uint64_t sub_189491008(uint64_t a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_18949110C(a1);
    return swift_release();
  }

  return result;
}

uint64_t sub_189491064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 8))
  {
    swift_retain();
    sub_18948F6B8(a2, a3);
    return swift_release();
  }

  else
  {
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *(void *)(a1 + 16);
    *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0x8000000000000000LL;
    sub_189493B84(a3, a2, isUniquelyReferenced_nonNull_native);
    *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v8;
    return swift_bridgeObjectRelease();
  }

uint64_t sub_18949110C(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_18C79AB18 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1894A1F38();
  __swift_project_value_buffer(v4, (uint64_t)qword_18C79AD20);
  swift_retain_n();
  uint64_t v5 = (os_log_s *)sub_1894A1F20();
  os_log_type_t v6 = sub_1894A22A4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_1894A2058();
    swift_retain();
    uint64_t v9 = sub_1894A21C0();
    sub_189492220(v9, v10, &v13);
    sub_1894A2310();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_18947B000, v5, v6, "| got new connection: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E79FC](v8, -1LL, -1LL);
    MEMORY[0x1895E79FC](v7, -1LL, -1LL);
  }

  else
  {

    swift_release_n();
  }

  uint64_t v11 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock(v11 + 10);
  sub_189491314((uint64_t)&v11[4], a1);
  os_unfair_lock_unlock(v11 + 10);
  return swift_release();
}

uint64_t sub_189491314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  uint64_t v5 = MEMORY[0x18961AFE8];
  unint64_t v6 = sub_1894944A8(MEMORY[0x18961AFE8]);
  v4[4] = v5;
  v4[5] = 0LL;
  v4[2] = a2;
  v4[3] = v6;
  if (*(void *)(a1 + 8))
  {
    swift_retain();
    sub_18948F350();
  }

  else
  {
    swift_retain();
  }

  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v4;
  swift_allocObject();
  swift_weakInit();
  sub_1894A1FE0();
  sub_1894A201C();
  return swift_release();
}

uint64_t sub_1894913FC(uint64_t a1)
{
  uint64_t v2 = sub_1894A2010();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    int v8 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
    if (v8 == *MEMORY[0x189608A38])
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    else
    {
      if (v8 == *MEMORY[0x189608A20])
      {
        sub_189491578();
        return swift_release();
      }

      if (v8 != *MEMORY[0x189608A50])
      {
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
    }

    uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v9 + 40));
    if (*(void *)(v9 + 24)) {
      sub_18948F350();
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 40));
    swift_release();
    return swift_release();
  }

  return result;
}

uint64_t sub_189491578()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock(v1 + 10);
  sub_1894915F0((uint64_t)&v1[4], v0);
  os_unfair_lock_unlock(v1 + 10);
  return swift_release();
}

void sub_1894915F0(uint64_t a1, uint64_t a2)
{
  int64_t v3 = v2;
  uint64_t v6 = sub_1894A2010();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!*(void *)(a1 + 8)) {
    return;
  }
  swift_retain();
  sub_1894A2028();
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x189608A38])
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    goto LABEL_4;
  }

  if (v10 != *MEMORY[0x189608A20])
  {
    if (v10 != *MEMORY[0x189608A50])
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return;
    }

LABEL_31:
    unint64_t v19 = (v27 - 1) & v27;
    unint64_t v22 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_16:
    uint64_t v23 = 8 * v22;
    uint64_t v24 = *(void *)(*(void *)(a2 + 48) + v23);
    uint64_t v25 = *(void *)(*(void *)(a2 + 56) + v23);
    swift_retain();
    sub_18948F6B8(v24, v25);
    swift_release();
  }

  int64_t v28 = v26 + 3;
  if (v28 >= v3)
  {
LABEL_34:
    swift_release();
    unint64_t v29 = sub_1894943AC(MEMORY[0x18961AFE8]);
    swift_bridgeObjectRelease();
    *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v29;
    sub_18948F4FC();
    swift_release();
    return;
  }

  unint64_t v27 = *(void *)(v16 + 8 * v28);
  if (v27)
  {
    int64_t v20 = v28;
    goto LABEL_31;
  }

  while (1)
  {
    int64_t v20 = v28 + 1;
    if (__OFADD__(v28, 1LL)) {
      break;
    }
    if (v20 >= v3) {
      goto LABEL_34;
    }
    unint64_t v27 = *(void *)(v16 + 8 * v20);
    ++v28;
    if (v27) {
      goto LABEL_31;
    }
  }

LABEL_37:
  __break(1u);
LABEL_38:
  swift_once();
LABEL_5:
  uint64_t v11 = sub_1894A1F38();
  __swift_project_value_buffer(v11, (uint64_t)qword_18C79AD20);
  os_log_type_t v12 = (os_log_s *)sub_1894A1F20();
  os_log_type_t v13 = sub_1894A22A4();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_18947B000, v12, v13, "| listener disconnected", v14, 2u);
    MEMORY[0x1895E79FC](v14, -1LL, -1LL);
  }

  uint64_t v15 = *(void *)(a2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v15 + 40));
  if (*(void *)(v15 + 24)) {
    sub_18948F350();
  }
  swift_release();
  *(void *)(v15 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 40));
  if (v3)
  {
    __break(1u);
  }

  else
  {
    swift_release();
    swift_release();
  }

uint64_t sub_189491978()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
  uint64_t v2 = sub_1894A1ECC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

void sub_1894919E0(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener;
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 40));
  sub_1894906D4((uint64_t *)(v7 + 16), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 40));
  swift_release();
  if (!v2)
  {
    type metadata accessor for EveTransportManager.PendingMessage();
    uint64_t v8 = swift_allocObject();
    sub_18948F224(a1);
    uint64_t v9 = *(void *)(v3 + 24);
    int v10 = *(os_unfair_lock_s **)(v5 + v6);
    swift_retain();
    os_unfair_lock_lock(v10 + 10);
    sub_189491064((uint64_t)&v10[4], v9, v8);
    os_unfair_lock_unlock(v10 + 10);
    swift_release();
    sub_1894A22E0();
    if ((*(_BYTE *)(v8 + 36) & 1) != 0)
    {
      swift_retain();
      sub_18949DD58();
      swift_release();
    }

    else
    {
      int v11 = *(_DWORD *)(v8 + 32);
      type metadata accessor for TransportError(0LL);
      sub_189482774( (unint64_t *)&qword_18C79AB30,  (uint64_t (*)(uint64_t))type metadata accessor for TransportError,  (uint64_t)&protocol conformance descriptor for tb_error_t);
      swift_allocError();
      *os_log_type_t v12 = v11;
      swift_willThrow();
    }

    swift_release();
  }

uint64_t sub_189491B84()
{
  return sub_189491B8C();
}

uint64_t sub_189491B8C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_189491BC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
  MEMORY[0x1895F8858](v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1894A1ECC();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v7);
  os_log_type_t v12 = (char *)&v28 - v11;
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  uint64_t v15 = (char *)&v28 - v14;
  MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v28 - v16;
  uint64_t data = tb_endpoint_get_data(a1);
  LODWORD(a1) = tb_endpoint_get_options(a1);
  sub_1894A1E90();
  if ((_DWORD)a1 == 1)
  {
    uint64_t v29 = *(void *)(data + 16);
    uint64_t v19 = data + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL;
    swift_retain();
    sub_189494C04(v19, (uint64_t)v4, &qword_18C79AD38);
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
    {
      int64_t v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v15, v17, v5);
      sub_18949200C((uint64_t)v4);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
      int64_t v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v15, v4, v5);
    }

    v20(v17, v15, v5);
  }

  else
  {
    uint64_t v29 = data;
  }

  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v17, v5);
  type metadata accessor for EveTransportClient();
  uint64_t v21 = swift_allocObject();
  if (qword_18C79AB10 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_18C79BDE8;
  sub_1894A1EA8();
  uint64_t v23 = *(void *)(v22 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v23 + 24));
  sub_18948F040((uint64_t *)(v23 + 16), (uint64_t)v9, &v30);
  os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 24));
  uint64_t v24 = v30;
  swift_release();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v9, v5);
  v25(v12, v5);
  uint64_t v26 = v29;
  *(void *)(v21 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v24;
  *(void *)(v21 + 24) = v26;
  v25(v17, v5);
  return v21;
}

uint64_t sub_189491EB8(uint64_t a1)
{
  uint64_t v1 = *(void *)(tb_transport_get_context(a1) + 16);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 40));
  sub_1894906D4((uint64_t *)(v2 + 16), v1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  swift_release();
  swift_release();
  return 0LL;
}

uint64_t _tb_eve_transport_destruct(uint64_t a1)
{
  return swift_release();
}

uint64_t type metadata accessor for EveTransportClient()
{
  return objc_opt_self();
}

uint64_t sub_18949200C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_18949204C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC88);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1894920B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v10 = sub_1894A2244();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }

  else
  {
    uint64_t v5 = MEMORY[0x1895E7258](15LL, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }

char *sub_189492128(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC88);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      unint64_t v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v10 = (char *)MEMORY[0x18961AFE8];
      unint64_t v12 = (char *)(MEMORY[0x18961AFE8] + 32LL);
    }

    sub_1894942C8(0LL, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

uint64_t sub_189492220(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1894922F0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_189494B60((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_189494B60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1894922F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1894A2328();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

uint64_t sub_1894924A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_18949253C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1894926B0(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1894926B0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18949253C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_18949204C(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1894A2364();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1894A23A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1894A2208();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_1894A23E8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1894A23A0();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

uint64_t sub_1894926B0(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC88);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

unint64_t sub_1894927FC(uint64_t a1)
{
  uint64_t v2 = sub_1894A216C();
  return sub_189492984(a1, v2);
}

unint64_t sub_189492868(uint64_t a1)
{
  uint64_t v2 = sub_1894A246C();
  return sub_189492AC4(a1, v2);
}

unint64_t sub_189492898(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1894A249C();
  return sub_189492B60(a1, a2, v4);
}

unint64_t sub_189492904(uint64_t a1)
{
  uint64_t v2 = sub_1894A249C();
  swift_bridgeObjectRelease();
  return sub_189492BDC(a1, v2);
}

unint64_t sub_189492984(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v16[1] = a1;
  uint64_t v5 = sub_1894A1ECC();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  int64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_189482774(&qword_18C79AD98, (uint64_t (*)(uint64_t))MEMORY[0x189606A90], MEMORY[0x189606AC0]);
      char v14 = sub_1894A2184();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

unint64_t sub_189492AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

unint64_t sub_189492B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = ~v5;
    do
    {
      uint64_t v8 = (uint64_t *)(*(void *)(v3 + 48) + 16 * result);
      uint64_t v10 = *v8;
      uint64_t v9 = v8[1];
      if (v10 == a1 && v9 == a2) {
        break;
      }
      unint64_t result = (result + 1) & v7;
    }

    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0);
  }

  return result;
}

unint64_t sub_189492BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v6 = sub_1894A21B4();
    uint64_t v8 = v7;
    if (v6 == sub_1894A21B4() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }

    char v11 = sub_1894A240C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v13 = sub_1894A21B4();
          uint64_t v15 = v14;
          if (v13 == sub_1894A21B4() && v15 == v16) {
            break;
          }
          char v18 = sub_1894A240C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

uint64_t sub_189492D50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = sub_189492898(a1, a2);
  if ((v5 & 1) == 0) {
    return 0LL;
  }
  unint64_t v6 = v4;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v2;
  uint64_t v11 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_189493F84();
    uint64_t v8 = v11;
  }

  uint64_t v9 = *(void *)(*(void *)(v8 + 56) + 8 * v6);
  sub_189493714(v6, v8);
  *uint64_t v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_189492DE4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1894A1ECC();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD80);
  int v42 = a2;
  uint64_t v10 = sub_1894A23D0();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1LL << *(_BYTE *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v40 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1LL << v12);
  }
  else {
    uint64_t v14 = -1LL;
  }
  unint64_t v15 = v14 & v13;
  id v38 = v2;
  int64_t v39 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0LL;
  for (i = v9; ; uint64_t v9 = i)
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }

    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v22 >= v39) {
      break;
    }
    uint64_t v23 = v40;
    unint64_t v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      int64_t v18 = v22 + 1;
      if (v22 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v24 = v40[v18];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v42 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }

        unint64_t v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v18 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_43;
            }
            if (v18 >= v39) {
              goto LABEL_34;
            }
            unint64_t v24 = v40[v18];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }

        int64_t v18 = v25;
      }
    }

LABEL_21:
    unint64_t v15 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v6 + 72);
    unint64_t v27 = *(void *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      uint64_t v28 = *(void *)(*(void *)(v9 + 56) + 8 * v21);
    }

    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      uint64_t v28 = *(void *)(*(void *)(v9 + 56) + 8 * v21);
      swift_retain();
    }

    sub_189482774(&qword_18C79AD88, (uint64_t (*)(uint64_t))MEMORY[0x189606A90], MEMORY[0x189606AB8]);
    uint64_t result = sub_1894A216C();
    uint64_t v29 = -1LL << *(_BYTE *)(v11 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1LL << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0LL;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v16 + 8 * v31);
      }

      while (v35 == -1);
      unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }

    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v11 + 48) + v26 * v19,  v8,  v5);
    *(void *)(*(void *)(v11 + 56) + 8 * v19) = v28;
    ++*(void *)(v11 + 16);
  }

  swift_release();
  uint64_t v3 = v38;
  uint64_t v23 = v40;
  if ((v42 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v36 = 1LL << *(_BYTE *)(v9 + 32);
  if (v36 >= 64) {
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v36;
  }
  *(void *)(v9 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_189493178(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD48);
  uint64_t result = sub_1894A23D0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0LL;
    unint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }

      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        uint64_t result = v5 + 64;
        if (v21 >= v12) {
          goto LABEL_33;
        }
        unint64_t v22 = v30[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v22 = v30[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }

              uint64_t v29 = 1LL << *(_BYTE *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
              }
              else {
                *unint64_t v30 = -1LL << v29;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
              break;
            }

            unint64_t v22 = v30[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1LL)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_33;
                }
                unint64_t v22 = v30[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }

            int64_t v8 = v23;
          }
        }

uint64_t sub_189493460(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD40);
  uint64_t result = sub_1894A23D0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0LL;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v31 = -1LL << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1LL << v10);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }

      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1LL))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }

        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
              }

              break;
            }

            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1LL)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }

            int64_t v8 = v23;
          }
        }

unint64_t sub_189493714(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1894A234C();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1894A2478();
        sub_1894A2490();
        sub_1894A2490();
        uint64_t result = sub_1894A249C();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }

        else if (v9 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (_OWORD *)(v10 + 16 * v3);
          unint64_t v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          unint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }

uint64_t sub_1894938E4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_1894A1ECC();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_1894927FC(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }

  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    BOOL v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }

    goto LABEL_11;
  }

  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_189493D54();
    goto LABEL_7;
  }

  sub_189492DE4(v17, a3 & 1);
  unint64_t v23 = sub_1894927FC(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_1894A2424();
    __break(1u);
    return result;
  }

  unint64_t v14 = v23;
  BOOL v20 = *v4;
  if ((v18 & 1) != 0) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_189493CBC(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_189493A40(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_189492898(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_189493F84();
LABEL_7:
    char v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }

uint64_t sub_189493B84(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_189492868(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_189494128();
LABEL_7:
    char v16 = (void *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }

uint64_t sub_189493CBC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_1894A1ECC();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))( v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1,  a2,  v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1LL);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_189493D54()
{
  uint64_t v1 = sub_1894A1ECC();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD80);
  uint64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_1894A23C4();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v24 = v7;
    return result;
  }

  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  uint64_t v25 = v5 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_189493F84()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1894A23C4();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }

void *sub_189494128()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1894A23C4();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }

char *sub_1894942C8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }

  uint64_t result = (char *)sub_1894A23E8();
  __break(1u);
  return result;
}

unint64_t sub_1894943AC(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x18961AFF0];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD40);
  uint64_t v3 = (void *)sub_1894A23DC();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_189492868(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }

  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1LL);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_retain();
    unint64_t result = sub_189492868(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if ((v15 & 1) != 0) {
      goto LABEL_7;
    }
  }

  __break(1u);
  return result;
}

unint64_t sub_1894944A8(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x18961AFF0];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD48);
  uint64_t v3 = (void *)sub_1894A23DC();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  unint64_t result = sub_189492898(v4, v5);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }

  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v10 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v10 = v4;
    v10[1] = v5;
    *(void *)(v3[7] + 8 * result) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    uint64_t v5 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_retain();
    unint64_t result = sub_189492898(v4, v5);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if ((v16 & 1) != 0) {
      goto LABEL_7;
    }
  }

  __break(1u);
  return result;
}

uint64_t _tb_eve_transport_send_message_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = v5;
  swift_release();
  *a3 = v6;
  return 0LL;
}

uint64_t sub_189494698()
{
  return type metadata accessor for EveEndpointData(0LL);
}

uint64_t type metadata accessor for EveEndpointData(uint64_t a1)
{
  return sub_1894947C0(a1, (uint64_t *)&unk_18C506080);
}

void sub_1894946B4()
{
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_189494730()
{
  if (!qword_18C506090)
  {
    sub_1894A1ECC();
    unint64_t v0 = sub_1894A22F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18C506090);
    }
  }

uint64_t type metadata accessor for EveTransportCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_1894947A4()
{
  return type metadata accessor for EveTransportManager(0LL);
}

uint64_t type metadata accessor for EveTransportManager(uint64_t a1)
{
  return sub_1894947C0(a1, qword_18C506208);
}

uint64_t sub_1894947C0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1894947F4()
{
  uint64_t result = sub_1894A1ECC();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for EveTransportManager.PendingMessage()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for EveTransportManager.Connection()
{
  return objc_opt_self();
}

uint64_t destroy for EveTransportManager.Listener()
{
  return swift_bridgeObjectRelease();
}

void *_s9Tightbeam19EveTransportManagerC8ListenerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EveTransportManager.Listener(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EveTransportManager.Listener(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EveTransportManager.Listener(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EveTransportManager.Listener(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for EveTransportManager.Listener()
{
  return &type metadata for EveTransportManager.Listener;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

uint64_t sub_189494AEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_189488444(a1, a2);
  }
  return a1;
}

uint64_t sub_189494B00()
{
  return swift_deallocObject();
}

uint64_t sub_189494B2C(uint64_t a1)
{
  return sub_18948FAD0(a1, *(void *)(v1 + 16));
}

uint64_t sub_189494B34()
{
  return swift_deallocObject();
}

uint64_t sub_189494B58(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  return sub_18948F630(a1, a2, a3, a4);
}

uint64_t sub_189494B60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_189494B9C(uint64_t a1)
{
  return sub_1894913FC(a1);
}

void sub_189494BA4(uint64_t a1)
{
}

uint64_t sub_189494BAC(uint64_t a1)
{
  return sub_189491008(a1);
}

_OWORD *sub_189494BB4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_189494BC4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E7954](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_189494C04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_189494C4C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v10 = a1;
    char v11 = 1;
    uint64_t v12 = 0LL;
    uint64_t v13 = a2;
    type metadata accessor for TransportBuffer();
    uint64_t v14 = 0LL;
    int v15 = 0;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v19 = 0LL;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 24) = 0LL;
    *(void *)(v4 + 32) = 0LL;
    *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = &v10;
    *(_BYTE *)(v4 + 40) = 1;
    a3();
    uint64_t v5 = *(void *)(v4 + 16);
    uint64_t v6 = *(void *)(v4 + 24);
    uint64_t v7 = *(void *)(v4 + 32);
    *(void *)(v4 + 24) = 0LL;
    *(void *)(v4 + 32) = 0LL;
    *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    char v8 = *(_BYTE *)(v4 + 40);
    *(_BYTE *)(v4 + 40) = 2;
    sub_189494FA4(v5, v6, v7, v8);
    return swift_release();
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t TransportBuffer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v1);
  *(void *)(v0 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v1;
  *(void *)(v0 + 24) = nullsub_1;
  *(void *)(v0 + 32) = 0LL;
  *(_BYTE *)(v0 + 40) = 0;
  return v0;
}

uint64_t TransportBuffer.init()()
{
  uint64_t v1 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v1);
  *(void *)(v0 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v1;
  *(void *)(v0 + 24) = nullsub_1;
  *(void *)(v0 + 32) = 0LL;
  *(_BYTE *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_189494E2C( uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  if (*(_BYTE *)(v6 + 40))
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  else
  {
    uint64_t v10 = *(void *)(v6 + 16);
    int v11 = a1(a5, a6, v10);
    if (v11)
    {
      int v12 = v11;
      type metadata accessor for TransportError(0LL);
      sub_189494F5C();
      swift_allocError();
      *uint64_t v13 = v12;
      return swift_willThrow();
    }

    else
    {
      uint64_t v16 = *(void *)(v6 + 16);
      uint64_t v15 = *(void *)(v6 + 24);
      uint64_t v17 = *(void *)(v7 + 32);
      *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v10;
      *(void *)(v7 + 24) = a3;
      *(void *)(v7 + 32) = a4;
      char v18 = *(_BYTE *)(v7 + 40);
      *(_BYTE *)(v7 + 40) = 0;
      swift_retain();
      return sub_189494FA4(v16, v15, v17, v18);
    }
  }

  return result;
}

unint64_t sub_189494F5C()
{
  unint64_t result = qword_18C79AB30;
  if (!qword_18C79AB30)
  {
    type metadata accessor for TransportError(255LL);
    unint64_t result = MEMORY[0x1895E7954](&protocol conformance descriptor for tb_error_t, v1);
    atomic_store(result, (unint64_t *)&qword_18C79AB30);
  }

  return result;
}

uint64_t sub_189494FA4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (!a4) {
    return swift_release();
  }
  return result;
}

uint64_t sub_189494FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v4 + 16);
  if (__OFADD__(v5, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(void *)(v4 + 24) >= v5 + a2)
  {
    uint64_t result = sub_1894A231C();
    uint64_t v7 = *(void *)(v4 + 16);
    BOOL v8 = __OFADD__(v7, a2);
    uint64_t v9 = v7 + a2;
    if (!v8)
    {
      *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v9;
      return result;
    }

    goto LABEL_7;
  }

uint64_t sub_1894950C4(uint64_t result)
{
  if (*(unsigned __int8 *)(v1 + 40) >= 2u || (uint64_t v2 = *(void *)(v1 + 16), *(void *)(v2 + 24) <= result))
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  else
  {
    *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = result;
  }

  return result;
}

uint64_t sub_18949518C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned __int8 *)(v5 + 40) < 2u)
  {
    uint64_t v7 = *(uint64_t **)(v5 + 16);
    if (v7[4] >= *(void *)(*(void *)(a4 - 8) + 64LL))
    {
      uint64_t v9 = *v7;
      MEMORY[0x1895F8858](a1);
      void v15[2] = a4;
      v15[3] = v10;
      v15[4] = v11;
      v15[5] = v12;
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC48);
      return sub_189495310( a4,  1LL,  (uint64_t)sub_1894952E0,  (uint64_t)v15,  v9,  MEMORY[0x18961A610],  a4,  v13,  a5,  MEMORY[0x18961A3E8],  (uint64_t)&v16);
    }

    __break(1u);
  }

  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_1894952E0(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 32))();
  if (v3) {
    *a2 = v3;
  }
  return result;
}

uint64_t sub_189495310( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13 = *(void *)(a8 - 8);
  uint64_t v14 = MEMORY[0x1895F8858](a5);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = v17(v14, v16);
  if (v11) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a11, v16, a8);
  }
  return result;
}

uint64_t sub_189495390()
{
  if (*(unsigned __int8 *)(v0 + 40) >= 2u || (uint64_t v1 = *(void **)(v0 + 16), v2 = v1[4], v1[3] < v2))
  {
    sub_1894A23AC();
    __break(1u);
  }

  else if ((v2 & 0x8000000000000000LL) == 0)
  {
    return *v1;
  }

  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_1894954A4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[4];
  if (v2 < v3) {
    goto LABEL_8;
  }
  uint64_t v4 = v1[3];
  if (v4 < v2) {
    goto LABEL_8;
  }
  if (__OFSUB__(v4, v3))
  {
    __break(1u);
LABEL_8:
    sub_1894A23AC();
    __break(1u);
    goto LABEL_9;
  }

  if (((v4 - v3) & 0x8000000000000000LL) == 0) {
    return *v1 + v3;
  }
LABEL_9:
  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_1894955D8()
{
  if (*(unsigned __int8 *)(v0 + 40) >= 2u || (uint64_t v1 = *(void **)(v0 + 16), v2 = v1[2], v1[3] < v2))
  {
    sub_1894A23AC();
    __break(1u);
  }

  else if ((v2 & 0x8000000000000000LL) == 0)
  {
    return *v1;
  }

  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t TransportBuffer.deinit()
{
  uint64_t v1 = v0;
  char v2 = *(_BYTE *)(v0 + 40);
  if (!v2)
  {
    uint64_t v4 = *(void (**)(uint64_t))(v0 + 24);
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v1 + 16);
    swift_retain();
    v4(v5);
    MEMORY[0x1895E79FC](v5, -1LL, -1LL);
    sub_189494FA4(v5, (uint64_t)v4, v3, 0);
    char v2 = *(_BYTE *)(v1 + 40);
  }

  sub_189494FA4(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), v2);
  return v1;
}

uint64_t TransportBuffer.__deallocating_deinit()
{
  uint64_t v1 = v0;
  char v2 = *(_BYTE *)(v0 + 40);
  if (!v2)
  {
    uint64_t v4 = *(void (**)(uint64_t))(v0 + 24);
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v1 + 16);
    swift_retain();
    v4(v5);
    MEMORY[0x1895E79FC](v5, -1LL, -1LL);
    sub_189494FA4(v5, (uint64_t)v4, v3, 0);
    char v2 = *(_BYTE *)(v1 + 40);
  }

  sub_189494FA4(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), v2);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TransportBuffer()
{
  return objc_opt_self();
}

uint64_t method lookup function for TransportBuffer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TransportBuffer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TransportBuffer.construct(with:destructor:size:capabilities:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of TransportBuffer.copyBytes<A>(from:size:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144LL))();
}

uint64_t dispatch thunk of TransportBuffer.setPosition(pos:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152LL))();
}

uint64_t dispatch thunk of TransportBuffer.withReservedDataRebound<A, B>(to:closure:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t dispatch thunk of TransportBuffer.reserved.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168LL))();
}

uint64_t dispatch thunk of TransportBuffer.data.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

uint64_t dispatch thunk of TransportBuffer.rawData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184LL))();
}

uint64_t sub_189495894(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (!a4) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for TransportBuffer.Buffer(uint64_t a1)
{
  return sub_189494FA4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(_BYTE *)(a2 + 24);
  sub_189495894(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(_BYTE *)(a2 + 24);
  sub_189495894(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  char v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_189494FA4(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(_BYTE *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  char v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_189494FA4(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransportBuffer.Buffer(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TransportBuffer.Buffer( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(_BYTE *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 25) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 25) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 24) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_189495A74(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_189495A8C(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    LOBYTE(a2) = 2;
    *(void *)__n128 result = v2;
  }

  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransportBuffer.Buffer()
{
  return &type metadata for TransportBuffer.Buffer;
}

uint64_t sub_189495AB8()
{
  return swift_deallocClassInstance();
}

uint64_t sub_189495ADC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3) & 1;
}

uint64_t sub_189495B28()
{
  return MEMORY[0x1895E7A74](v0 + 24);
}

uint64_t sub_189495B6C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_189495BCC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  void v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1895E7A74](v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_189495C38;
}

void sub_189495C38(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40LL) + 32LL) = *(void *)(*(void *)a1 + 32LL);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }

  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t ForwardingConnection.__allocating_init(service_endpoint:client_endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  ForwardingConnection.init(service_endpoint:client_endpoint:)(a1, a2);
  return v4;
}

uint64_t ForwardingConnection.init(service_endpoint:client_endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v2 + 32) = 0LL;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v2;
  *(void *)(v6 + 24) = &off_18A3ACA98;
  swift_retain();
  TightbeamEndpoint.constructEndpoint()();
  char v8 = v7;
  TightbeamEndpoint.constructEndpoint()();
  char v10 = v9;
  v14[4] = sub_189495E40;
  v14[5] = v6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 1107296256LL;
  void v14[2] = sub_189495E44;
  v14[3] = &block_descriptor;
  uint64_t v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  uint64_t v12 = tb_forwarding_connection_create_with_endpoint(v8, v10, v11);
  _Block_release(v11);
  swift_release();
  sub_189495EC0(a2);
  sub_189495EC0(a1);
  *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v12;
  return v3;
}

uint64_t type metadata accessor for AnyForwardingConnection()
{
  return objc_opt_self();
}

uint64_t sub_189495E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a4) = v7(a2, a3, a4);
  swift_release();
  return a4 & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_189495EC0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TightbeamEndpoint();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t ForwardingConnection.__allocating_init(service_transport:client_transport:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v4 + 32) = 0LL;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4;
  *(void *)(v5 + 24) = &off_18A3ACA98;
  _BYTE v9[4] = sub_189495E40;
  v9[5] = v5;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 1107296256LL;
  v9[2] = sub_189495E44;
  v9[3] = &block_descriptor_3;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v7 = tb_forwarding_connection_create(a1, a2, v6);
  swift_release();
  _Block_release(v6);
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v7;
  return v4;
}

uint64_t ForwardingConnection.init(service_transport:client_transport:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v2 + 32) = 0LL;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v2;
  *(void *)(v5 + 24) = &off_18A3ACA98;
  _BYTE v9[4] = sub_189495E40;
  v9[5] = v5;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 1107296256LL;
  v9[2] = sub_189495E44;
  v9[3] = &block_descriptor_7;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v7 = tb_forwarding_connection_create(a1, a2, v6);
  swift_release();
  _Block_release(v6);
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v7;
  return v2;
}

uint64_t ForwardingConnection.__allocating_init(serviceEndpoint:clientEndpoint:rawConnectionType:)( uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  ForwardingConnection.init(serviceEndpoint:clientEndpoint:rawConnectionType:)(a1, a2, a3);
  return v6;
}

uint64_t ForwardingConnection.init(serviceEndpoint:clientEndpoint:rawConnectionType:)( uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v3 + 32) = 0LL;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  *(void *)(v8 + 24) = &off_18A3ACA98;
  swift_retain();
  TightbeamEndpoint.constructEndpoint()();
  char v10 = v9;
  TightbeamEndpoint.constructEndpoint()();
  uint64_t v12 = v11;
  v16[4] = sub_189495E40;
  v16[5] = v8;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 1107296256LL;
  void v16[2] = sub_189495E44;
  v16[3] = &block_descriptor_10;
  uint64_t v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  uint64_t v14 = tb_forwarding_connection_create_with_endpoint_options(v10, v12, a3, v13);
  _Block_release(v13);
  swift_release();
  sub_189495EC0(a2);
  sub_189495EC0(a1);
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v14;
  return v4;
}

uint64_t sub_189496294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, ObjectType, v4) & 1;
}

uint64_t sub_1894962E0(uint64_t a1)
{
  if (MEMORY[0x1895E7A74](v1 + 24))
  {
    uint64_t v3 = *(void *)(v1 + 32);
    type metadata accessor for AnyForwardingConnection();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v1;
    *(void *)(v4 + 24) = &off_18A3ACA98;
    swift_retain();
    uint64_t v5 = sub_18949E604(a1, v4);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = v5;
    LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v3 + 8))(v1, &v8, ObjectType, v3);
    swift_retain();
    sub_18949DD58();
    swift_unknownObjectRelease();
    swift_release_n();
    return v3 & 1;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_189496418()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result) {
    return tb_forwarding_connection_activate(result);
  }
  __break(1u);
  return result;
}

uint64_t ForwardingConnection.deinit()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    tb_forwarding_connection_destruct(result);
    sub_189496454(v0 + 24);
    return v0;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_189496454(uint64_t a1)
{
  return a1;
}

uint64_t ForwardingConnection.__deallocating_deinit()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    tb_forwarding_connection_destruct(result);
    sub_189496454(v0 + 24);
    return swift_deallocClassInstance();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1894964B0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 24;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1895E7A74](v4);
  uint64_t v6 = *(void *)(v3 + 32);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_189496508(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of ForwardingProtocol.decode(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for ForwardingConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for ForwardingConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ForwardingConnection.forward.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of ForwardingConnection.forward.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t dispatch thunk of ForwardingConnection.forward.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(service_endpoint:client_endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(service_transport:client_transport:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(serviceEndpoint:clientEndpoint:rawConnectionType:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ForwardingConnection.begin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176LL))();
}

unint64_t tb_error_t.description.getter(int a1)
{
  unint64_t result = 0x73736563637553LL;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x6F6E20646C756F43LL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015LL;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000011LL;
      break;
    case 4:
      unint64_t result = 0xD000000000000016LL;
      break;
    case 7:
      unint64_t result = 0xD000000000000015LL;
      break;
    case 8:
      unint64_t result = 0x6961662072657355LL;
      break;
    case 9:
      unint64_t result = 0x2064726177726F46LL;
      break;
    case 15:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      unint64_t result = 0x206E776F6E6B6E55LL;
      break;
  }

  return result;
}

unint64_t static tb_error_t._nsErrorDomain.getter()
{
  return 0xD000000000000018LL;
}

uint64_t sub_189496768()
{
  return sub_1894A1E78();
}

uint64_t sub_1894967A0()
{
  return sub_1894A1E6C();
}

unint64_t sub_1894967D8()
{
  return tb_error_t.description.getter(*v0);
}

uint64_t sub_1894967E0()
{
  return sub_189496924(&qword_18C79ADB0, (uint64_t)&protocol conformance descriptor for tb_error_t);
}

uint64_t sub_189496804()
{
  return sub_189496924(&qword_18C79ADB8, (uint64_t)&unk_1894A2C28);
}

uint64_t sub_189496828()
{
  return sub_189496924(&qword_18C79ADC0, (uint64_t)&unk_1894A2BEC);
}

unint64_t sub_189496850()
{
  unint64_t result = qword_18C79ADC8;
  if (!qword_18C79ADC8)
  {
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x18961A890], MEMORY[0x18961A860]);
    atomic_store(result, (unint64_t *)&qword_18C79ADC8);
  }

  return result;
}

unint64_t sub_189496894()
{
  return 0xD000000000000018LL;
}

uint64_t sub_1894968B0()
{
  return sub_189496924((unint64_t *)&qword_18C79AB30, (uint64_t)&protocol conformance descriptor for tb_error_t);
}

uint64_t sub_1894968D4()
{
  return sub_1894A1E54();
}

uint64_t sub_189496924(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TransportError(255LL);
    uint64_t result = MEMORY[0x1895E7954](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_189496964()
{
  uint64_t result = sub_1894A20A0();
  qword_18C79BDF0 = result;
  return result;
}

uint64_t sub_1894969BC(uint64_t *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 0LL;
  if ((a3 & 1) == 0)
  {
    if (a1)
    {
      if (a2 - (uint64_t)a1 >= a5)
      {
LABEL_4:
        *(void *)a6 = sub_189496B48(a1, a2);
        *(_BYTE *)(a6 + 8) = 0;
        return a5;
      }
    }

    else if (a5 <= 0)
    {
      goto LABEL_4;
    }

    return 0LL;
  }

  return v6;
}

uint64_t sub_189496A84()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnixTransportProtocol()
{
  return objc_opt_self();
}

unint64_t sub_189496AB4()
{
  return 0xD000000000000013LL;
}

uint64_t sub_189496AD0()
{
  return swift_allocObject();
}

uint64_t sub_189496AF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x189608BE8];
  uint64_t v3 = sub_1894A20B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104LL))(a1, v2, v3);
}

uint64_t sub_189496B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189496C10(a1, a3);
}

uint64_t sub_189496B40()
{
  return 1LL;
}

uint64_t sub_189496B48(uint64_t *a1, uint64_t a2)
{
  if (!a1)
  {
    uint64_t v2 = 0LL;
    goto LABEL_6;
  }

  uint64_t v2 = a2 - (void)a1;
  if (a2 - (uint64_t)a1 <= 15)
  {
LABEL_6:
    sub_189496FA8();
    swift_allocError();
    *(void *)uint64_t v4 = 16LL;
    char v5 = 1;
    goto LABEL_7;
  }

  uint64_t v2 = *a1;
  if (*a1 == 0x12345678AABBCCDDLL) {
    return a1[1];
  }
  sub_189496FA8();
  swift_allocError();
  char v5 = 0;
  *(void *)uint64_t v4 = 0x12345678AABBCCDDLL;
LABEL_7:
  *(void *)(v4 + 8) = v2;
  *(_BYTE *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  return swift_willThrow();
}

uint64_t sub_189496C10(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a2 < 0)
  {
    sub_1894A23A0();
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }

  else
  {
    __int128 v13 = xmmword_1894A38F0;
    uint64_t __src = 0x12345678AABBCCDDLL;
    uint64_t v3 = sub_18949CDD4(&__src, &v13);
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFLL;
    sub_1894A1EFC();
    sub_189488444(v3, v5);
    uint64_t v11 = a2;
    uint64_t v6 = sub_18949CDD4(&v11, &__src);
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFLL;
    sub_1894A1EFC();
    sub_189488444(v6, v8);
    __int128 v9 = v13;
    sub_1894A2100();
    sub_189488444(v9, *((unint64_t *)&v9 + 1));
    return sub_1894A210C();
  }

  return result;
}

uint64_t sub_189496D94()
{
  return 16LL;
}

uint64_t sub_189496F58(uint64_t *a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_1894969BC(a1, a2, a3 & 1, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

unint64_t sub_189496F64()
{
  unint64_t result = qword_18C79ADD0;
  if (!qword_18C79ADD0)
  {
    uint64_t v1 = type metadata accessor for UnixTransportProtocol();
    unint64_t result = MEMORY[0x1895E7954](&unk_1894A3918, v1);
    atomic_store(result, (unint64_t *)&qword_18C79ADD0);
  }

  return result;
}

unint64_t sub_189496FA8()
{
  unint64_t result = qword_18C79ADD8;
  if (!qword_18C79ADD8)
  {
    unint64_t result = MEMORY[0x1895E7954](&unk_1894A3994, &type metadata for UnixProtocolHeader.Error);
    atomic_store(result, (unint64_t *)&qword_18C79ADD8);
  }

  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for UnixProtocolHeader.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UnixProtocolHeader.Error( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_18949708C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_189497094(uint64_t result, char a2)
{
  *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UnixProtocolHeader.Error()
{
  return &type metadata for UnixProtocolHeader.Error;
}

uint64_t TightbeamBadge.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = HIBYTE(result);
  *(_BYTE *)(a2 + 1) = 0;
  *(_BYTE *)(a2 + 2) = BYTE6(result);
  *(_WORD *)(a2 + 4) = WORD2(result);
  *(_WORD *)(a2 + 6) = WORD1(result);
  *(_WORD *)(a2 + 8) = result;
  return result;
}

_BYTE *TightbeamBadge.init(usage:variant:component:client:metadata:)@<X0>( _BYTE *result@<X0>, __int16 a2@<W1>, __int16 a3@<W2>, __int16 a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  char v6 = result[1];
  if ((a2 & 0x100) != 0) {
    char v7 = 0;
  }
  else {
    char v7 = a2;
  }
  *(_BYTE *)a6 = *result;
  *(_BYTE *)(a6 + 1) = v6;
  *(_BYTE *)(a6 + 2) = v7;
  if ((a5 & 0x10000) != 0) {
    __int16 v8 = 0;
  }
  else {
    __int16 v8 = a5;
  }
  *(_WORD *)(a6 + 4) = a3;
  *(_WORD *)(a6 + 6) = a4;
  *(_WORD *)(a6 + 8) = v8;
  return result;
}

void TightbeamBadge.usage.getter(_BYTE *a1@<X8>)
{
  char v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

uint64_t TightbeamBadge.variant.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t TightbeamBadge.component.getter()
{
  return *(unsigned __int16 *)(v0 + 4);
}

uint64_t TightbeamBadge.client.getter()
{
  return *(unsigned __int16 *)(v0 + 6);
}

uint64_t TightbeamBadge.metadata.getter()
{
  return *(unsigned __int16 *)(v0 + 8);
}

uint64_t TightbeamBadge.Usage.init(_:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  a2[1] = 0;
  return result;
}

uint64_t __swift_memcpy10_2(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TightbeamBadge(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for TightbeamBadge(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 10) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamBadge()
{
  return &type metadata for TightbeamBadge;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TightbeamBadge.Usage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  unsigned int v2 = a2 + 0xFFFF;
  else {
    unsigned int v3 = 4;
  }
  if (v2 < 0xFF0000) {
    unsigned int v3 = 1;
  }
  if (v2 >= 0x10000) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return ((uint64_t (*)(void))((char *)&loc_189497214 + 4 * byte_1894A39D4[v4]))();
}

uint64_t sub_18949722C(unsigned __int16 *a1)
{
  uint64_t v1 = a1[1];
  if (a1[1]) {
    return (*a1 | ((_DWORD)v1 << 16)) - 0xFFFF;
  }
  return v1;
}

void sub_189497238(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 2)) {
    JUMPOUT(0x189497240LL);
  }
  JUMPOUT(0x189497250LL);
}

uint64_t storeEnumTagSinglePayload for TightbeamBadge.Usage(_WORD *a1, int a2, int a3)
{
  unsigned int v3 = a3 + 0xFFFF;
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    LODWORD(v5) = v4;
  }
  else {
    LODWORD(v5) = 0;
  }
  if (a3) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (!a2) {
    return ((uint64_t (*)(void))((char *)sub_1894972DC + 4 * byte_1894A39DE[v5]))();
  }
  *a1 = a2 - 1;
  return ((uint64_t (*)(void))((char *)sub_1894972BC + 4 * byte_1894A39D9[v5]))();
}

uint64_t sub_1894972BC(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1894972DC(uint64_t result)
{
  *(_BYTE *)(result + 2) = 0;
  return result;
}

uint64_t sub_1894972E4(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1894972EC(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1894972F4(uint64_t result)
{
  *(_WORD *)(result + 2) = 0;
  return result;
}

uint64_t sub_1894972FC(uint64_t result)
{
  *(_DWORD *)(result + 2) = 0;
  return result;
}

uint64_t sub_189497308(unsigned __int8 *a1)
{
  if (a1[1]) {
    return (*a1 | (a1[1] << 8)) - 255;
  }
  else {
    return 0LL;
  }
}

_BYTE *sub_189497328(_BYTE *result, int a2)
{
  if (a2)
  {
    *__n128 result = a2 - 1;
    result[1] = ((unsigned __int16)(a2 - 1) >> 8) + 1;
  }

  else
  {
    result[1] = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for TightbeamBadge.Usage()
{
  return &type metadata for TightbeamBadge.Usage;
}

uint64_t TightbeamDecoder.init(message:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t TightbeamDecoder.decode(as:)()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  unsigned __int8 v3 = 0;
  uint64_t v1 = *(void *)(*(void *)v0 + 24LL);
  if (v1)
  {
    tb_message_decode_BOOL(v1, &v3);
    return v3;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

{
  return sub_18949758C((void (*)(uint64_t, unsigned __int8 *))tb_message_decode_u8);
}

{
  return sub_1894976AC((void (*)(uint64_t, unsigned __int16 *))tb_message_decode_u16);
}

{
  return sub_1894977CC((void (*)(uint64_t, unsigned int *))tb_message_decode_u32);
}

{
  return sub_1894978EC((void (*)(uint64_t, void *))tb_message_decode_u64);
}

{
  return sub_18949758C((void (*)(uint64_t, unsigned __int8 *))tb_message_decode_s8);
}

{
  return sub_1894976AC((void (*)(uint64_t, unsigned __int16 *))tb_message_decode_s16);
}

{
  return sub_1894977CC((void (*)(uint64_t, unsigned int *))tb_message_decode_s32);
}

{
  return sub_1894978EC((void (*)(uint64_t, void *))tb_message_decode_s64);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *v0;
  uint64_t v4 = 0;
  unsigned int v2 = *(void *)(v1 + 24);
  if (v2)
  {
    swift_retain();
    tb_message_decode_f32(v2, &v4);
    return swift_release();
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void v4[2];
  v4[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *v0;
  v4[0] = 0LL;
  unsigned int v2 = *(void *)(v1 + 24);
  if (v2)
  {
    swift_retain();
    tb_message_decode_f64(v2, v4);
    return swift_release();
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18949758C(void (*a1)(uint64_t, unsigned __int8 *))
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *v1;
  unsigned __int8 v6 = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_1894976AC(void (*a1)(uint64_t, unsigned __int16 *))
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *v1;
  unsigned __int16 v6 = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_1894977CC(void (*a1)(uint64_t, unsigned int *))
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *v1;
  unsigned int v6 = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_1894978EC(void (*a1)(uint64_t, void *))
{
  v6[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *v1;
  v6[0] = 0LL;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, v6);
    swift_release();
    return v6[0];
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t TightbeamDecoder.decode(as:)@<X0>(void *a1@<X8>)
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  uint64_t v3 = *(void *)(*(void *)v1 + 24LL);
  if (v3)
  {
    uint64_t result = tb_message_decode_capability(v3, v5);
    *a1 = v5[0];
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

void TightbeamDecoder.decode(as:)()
{
}

void TightbeamDecoder.encoder(bytes:capabilities:)(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  sub_18949DB24();
  if (!v2)
  {
    *a1 = v4;
    swift_retain();
  }

uint64_t TightbeamCapabilityDecoder.init(table:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

Swift::UInt __swiftcall TightbeamCapabilityDecoder.capability(for:)(Swift::Int a1)
{
  uint64_t v2 = *v1;
  if ((a1 & 0x8000000000000000LL) == 0 && v2 && v1[1] - *v1 > a1) {
    return v2 + a1;
  }
  sub_1894A2358();
  sub_1894A21FC();
  sub_189486E64();
  sub_1894A2334();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  sub_1894A2334();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894A21FC();
  Swift::UInt result = sub_1894A23AC();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for TightbeamDecoder()
{
  return &type metadata for TightbeamDecoder;
}

ValueMetadata *type metadata accessor for TightbeamCapabilityDecoder()
{
  return &type metadata for TightbeamCapabilityDecoder;
}

uint64_t sub_189497E18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  uint64_t v2 = sub_1894A1ECC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t _tb_unix_client_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2 = sub_1894A1ECC();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = tb_endpoint_get_data(a1) + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(v5, v6, v2);
  swift_release();
  type metadata accessor for UnixTransportClient(0LL);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection) = 0LL;
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage) = 0LL;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_targetURL,  v5,  v2);
  return v8;
}

uint64_t type metadata accessor for UnixTransportClient(uint64_t a1)
{
  return sub_1894947C0(a1, qword_18C506AE0);
}

uint64_t __tb_unix_client_transport_destruct(uint64_t a1)
{
  return swift_release();
}

uint64_t _tb_unix_client_transport_activate(uint64_t a1)
{
  uint64_t context = tb_transport_get_context(a1);
  swift_retain();
  uint64_t v2 = sub_1894A1EC0();
  uint64_t v4 = v3;
  type metadata accessor for UnixProtocolConnection();
  uint64_t v5 = (void *)swift_allocObject();
  swift_retain();
  *(void *)(context + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection) = sub_189498490( v2,  v4,  context,  0LL,  v5);
  swift_release();
  swift_release();
  return 0LL;
}

uint64_t sub_189498024(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1894A1FD4();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (uint64_t (**)(uint64_t))((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection);
  if (!v9)
  {
    uint64_t v11 = 0LL;
    goto LABEL_5;
  }

  uint64_t v10 = OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage;
  if (*(void *)(v3 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage))
  {
    uint64_t v11 = 1LL;
LABEL_5:
    sub_189498F78();
    swift_allocError();
    *uint64_t v12 = v11;
    swift_willThrow();
    return v11;
  }

  type metadata accessor for PendingMessage();
  swift_allocObject();
  swift_retain();
  uint64_t v13 = sub_18948F224(a1);
  uint64_t v14 = *(void *)(*(void *)(v13 + 24) + 32LL);
  if (v14 && *(unsigned __int8 *)(v14 + 40) < 2u && (uint64_t v15 = *(uint64_t **)(v14 + 16), v16 = v15[2], v15[3] >= v16))
  {
    unint64_t v27 = v2;
    uint64_t v28 = v13;
    uint64_t v31 = v10;
    if ((v16 & 0x8000000000000000LL) == 0)
    {
      uint64_t v17 = *v15;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD58);
      v30[3] = v18;
      v30[4] = sub_189494BC4((unint64_t *)&qword_18C79AD60, &qword_18C79AD58, MEMORY[0x189607080]);
      v30[0] = v17;
      v30[1] = v16;
      uint64_t v19 = __swift_project_boxed_opaque_existential_1(v30, v18);
      if (*v19) {
        uint64_t v20 = (_BYTE *)(*v19 + v19[1]);
      }
      else {
        uint64_t v20 = 0LL;
      }
      sub_18949CB9C((_BYTE *)*v19, v20, v29);
      uint64_t v25 = v29[0];
      unint64_t v27 = v29[1];
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      uint64_t v26 = *(void *)(v9 + 56);
      *uint64_t v8 = sub_189498FBC;
      v8[1] = (uint64_t (*)(uint64_t))v9;
      (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v6 + 104))( v8,  *MEMORY[0x1896089B8],  v5);
      sub_1894A1FC8();
      swift_retain();
      sub_1894A1FBC();
      unint64_t v21 = v27;
      sub_1894A1FF8();
      swift_release();
      (*(void (**)(uint64_t (**)(uint64_t), uint64_t))(v6 + 8))(v8, v5);
      sub_189488444(v25, v21);
      uint64_t v22 = v31;
      *(void *)(v3 + v31) = v28;
      swift_retain();
      swift_release();
      sub_1894A22E0();
      *(void *)(v3 + v22) = 0LL;
      swift_release();
      swift_retain();
      uint64_t v11 = sub_18949DD58();
      swift_release();
      swift_release();
      swift_release();
      return v11;
    }
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

  uint64_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_1894983F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_targetURL;
  uint64_t v2 = sub_1894A1ECC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_189498468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189498A50(a2, a3);
}

uint64_t sub_189498490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v41 = sub_1894A22BC();
  uint64_t v39 = *(void *)(v41 - 8);
  MEMORY[0x1895F8858](v41);
  uint64_t v40 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = sub_1894A22B0();
  MEMORY[0x1895F8858](v37);
  id v38 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_1894A2154();
  MEMORY[0x1895F8858](v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_1894A1F68();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v17);
  unint64_t v21 = (uint64_t *)((char *)&v31 - v20);
  v44[3] = type metadata accessor for UnixTransportClient(0LL);
  v44[4] = &off_18A3ACE20;
  v44[0] = a3;
  sub_189488234((uint64_t)v44, (uint64_t)(a5 + 2));
  a5[8] = a1;
  a5[9] = a2;
  uint64_t v42 = a4;
  if (a4)
  {
    a5[7] = a4;
  }

  else
  {
    uint64_t v35 = a1;
    uint64_t v36 = v14;
    sub_1894A2094();
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1894A2088();
    if (qword_18C79AB20 != -1) {
      swift_once();
    }
    sub_1894A20E8();
    swift_allocObject();
    swift_retain();
    uint64_t v23 = sub_1894A20DC();
    sub_1894A2070();
    uint64_t v34 = v22;
    swift_retain();
    int64_t v33 = (void (*)(void *, void))sub_1894A2064();
    uint64_t v25 = *v24;
    if ((unint64_t)*v24 >> 62)
    {
      uint64_t v30 = v25 & 0xFFFFFFFFFFFFFF8LL;
      if (v25 < 0) {
        uint64_t v30 = *v24;
      }
      uint64_t v32 = v30;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_1894A23B8();
      uint64_t result = swift_bridgeObjectRelease();
      if (v32 < 0)
      {
        __break(1u);
        return result;
      }
    }

    sub_1894879F8(0LL, 0LL, v23);
    v33(v43, 0LL);
    swift_release();
    *unint64_t v21 = v35;
    v21[1] = a2;
    (*(void (**)(void *, void, uint64_t))(v16 + 104))(v21, *MEMORY[0x189608818], v15);
    (*(void (**)(char *, void *, uint64_t))(v16 + 16))(v19, v21, v15);
    sub_1894A2058();
    swift_allocObject();
    uint64_t v26 = sub_1894A1FEC();
    swift_release();
    (*(void (**)(void *, uint64_t))(v16 + 8))(v21, v15);
    a5[7] = v26;
  }

  swift_retain();
  swift_retain();
  swift_retain();
  sub_18948827C((uint64_t)sub_189498FC4);
  sub_1894A1FE0();
  swift_release();
  swift_release();
  sub_18948828C();
  sub_1894A204C();
  sub_1894A1F44();
  (*(void (**)(void *, uint64_t))(v16 + 8))(v21, v15);
  sub_1894A2148();
  v43[0] = MEMORY[0x18961AFE8];
  sub_1894882C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC28);
  sub_189494BC4((unint64_t *)&qword_18C79AC30, &qword_18C79AC28, MEMORY[0x189618470]);
  sub_1894A2340();
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v40, *MEMORY[0x18961B900], v41);
  unint64_t v27 = (void *)sub_1894A22D4();
  swift_retain();
  sub_1894A201C();
  swift_release();
  if (qword_18C79AB00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v28 = v27;
  MEMORY[0x1895E7294]();
  if (*(void *)((qword_18C79AC00 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((qword_18C79AC00 & 0xFFFFFFFFFFFFFF8LL)
                                                                                + 0x18) >> 1)
    sub_1894A2274();
  sub_1894A228C();
  sub_1894A2268();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return (uint64_t)a5;
}

uint64_t sub_1894989B4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_189498A50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage);
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(v3 + 24) + 32LL);
    if (v4 && *(unsigned __int8 *)(v4 + 40) < 2u) {
      __asm { BR              X9 }
    }

    sub_1894A23AC();
    __break(1u);
    JUMPOUT(0x189498D60LL);
  }

  sub_1894A2358();
  swift_bridgeObjectRelease();
  sub_1894A1ED8();
  sub_1894A21FC();
  swift_bridgeObjectRelease();
  sub_1894872E4();
  return swift_bridgeObjectRelease();
}

uint64_t _tb_unix_client_transport_send_message_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_189498024(a2);
  swift_release();
  if (a3) {
    *a3 = v5;
  }
  return 0LL;
}

uint64_t sub_189498E50()
{
  return type metadata accessor for UnixEndpointData(0LL);
}

uint64_t type metadata accessor for UnixEndpointData(uint64_t a1)
{
  return sub_1894947C0(a1, qword_18C506940);
}

uint64_t sub_189498E6C()
{
  uint64_t result = sub_1894A1ECC();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for PendingMessage()
{
  return objc_opt_self();
}

uint64_t sub_189498EF8()
{
  return type metadata accessor for UnixTransportClient(0LL);
}

uint64_t sub_189498F00()
{
  uint64_t result = sub_1894A1ECC();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

unint64_t sub_189498F78()
{
  unint64_t result = qword_18C79ADE0;
  if (!qword_18C79ADE0)
  {
    unint64_t result = MEMORY[0x1895E7954](&unk_1894A3B60, &type metadata for UnixTransportClient.Error);
    atomic_store(result, (unint64_t *)&qword_18C79ADE0);
  }

  return result;
}

uint64_t sub_189498FBC(uint64_t a1)
{
  return sub_189487734(a1);
}

uint64_t sub_189498FC4(uint64_t a1)
{
  return sub_1894873B4(a1);
}

uint64_t storeEnumTagSinglePayload for UnixTransportClient.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_189499018 + 4 * byte_1894A3A65[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18949904C + 4 * asc_1894A3A60[v4]))();
}

uint64_t sub_18949904C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189499054(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18949905CLL);
  }
  return result;
}

uint64_t sub_189499068(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189499070LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_189499074(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18949907C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnixTransportClient.Error()
{
  return &type metadata for UnixTransportClient.Error;
}

unint64_t sub_18949909C()
{
  unint64_t result = qword_18C79ADE8;
  if (!qword_18C79ADE8)
  {
    unint64_t result = MEMORY[0x1895E7954](&unk_1894A3B38, &type metadata for UnixTransportClient.Error);
    atomic_store(result, (unint64_t *)&qword_18C79ADE8);
  }

  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Bool a1)
{
  if (*(void *)(*(void *)v1 + 24LL))
  {
    tb_message_encode_BOOL(*(void *)(*(void *)v1 + 24LL), a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt8 a1)
{
  if (*(void *)(*(void *)v1 + 24LL))
  {
    tb_message_encode_u8(*(void *)(*(void *)v1 + 24LL), a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt16 a1)
{
  if (*(void *)(*(void *)v1 + 24LL))
  {
    tb_message_encode_u16(*(void *)(*(void *)v1 + 24LL), a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt64 a1)
{
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int8 a1)
{
  if (*(void *)(*(void *)v1 + 24LL))
  {
    tb_message_encode_s8(*(void *)(*(void *)v1 + 24LL), a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int16 a1)
{
  if (*(void *)(*(void *)v1 + 24LL))
  {
    tb_message_encode_s16(*(void *)(*(void *)v1 + 24LL), a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int32 a1)
{
}

uint64_t sub_18949935C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(*(void *)v2 + 24LL);
  if (v5) {
    return a2(v5, a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int64 a1)
{
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Float a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24LL);
  if (v2)
  {
    tb_message_encode_f32(v2, a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Double a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24LL);
  if (v2)
  {
    tb_message_encode_f64(v2, a1);
  }

  else
  {
    sub_1894A23AC();
    __break(1u);
  }

uint64_t TightbeamEncoder.encode(_:)(uint64_t *a1)
{
  if (*(void *)(*(void *)v1 + 24LL)) {
    return tb_message_encode_capability(*(void *)(*(void *)v1 + 24LL), *a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

void *TightbeamEncoder.encode(_:)(const void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = *(void *)(*(void *)v2 + 24LL);
    if (v4) {
      return tb_message_encode_buffer(v4, a1, a2 - (void)a1);
    }
  }

  uint64_t result = (void *)sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t TightbeamEncoder.complete()()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24LL);
  if (v1)
  {
    tb_message_complete(v1);
    return swift_retain();
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18949967C(char a1)
{
  if (*(void *)(*(void *)v1 + 24LL)) {
    return tb_message_encode_BOOL(*(void *)(*(void *)v1 + 24LL), a1 & 1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_1894996F4(char a1)
{
  if (*(void *)(*(void *)v1 + 24LL)) {
    return tb_message_encode_u8(*(void *)(*(void *)v1 + 24LL), a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_18949976C(__int16 a1)
{
  if (*(void *)(*(void *)v1 + 24LL)) {
    return tb_message_encode_u16(*(void *)(*(void *)v1 + 24LL), a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_1894997E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894998F8(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))tb_message_encode_u32);
}

uint64_t sub_1894997F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894998F8(a1, a2, a3, tb_message_encode_u64);
}

uint64_t sub_1894997FC(char a1)
{
  if (*(void *)(*(void *)v1 + 24LL)) {
    return tb_message_encode_s8(*(void *)(*(void *)v1 + 24LL), a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_189499874(__int16 a1)
{
  if (*(void *)(*(void *)v1 + 24LL)) {
    return tb_message_encode_s16(*(void *)(*(void *)v1 + 24LL), a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_1894998EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894998F8(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))tb_message_encode_s32);
}

uint64_t sub_1894998F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(*(void *)v4 + 24LL);
  if (v6) {
    return a4(v6, a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_18949996C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894998F8(a1, a2, a3, tb_message_encode_s64);
}

uint64_t sub_189499978(float a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24LL);
  if (v2) {
    return tb_message_encode_f32(v2, a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t sub_1894999E8(double a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24LL);
  if (v2) {
    return tb_message_encode_f64(v2, a1);
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

uint64_t TightbeamSizingEncoder.size.getter()
{
  return *(void *)v0;
}

Tightbeam::TightbeamSizingEncoder __swiftcall TightbeamSizingEncoder.init()()
{
  void *v0 = 0LL;
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Bool a1)
{
  uint64_t v2 = tb_message_size_BOOL();
  if (__OFADD__(*v1, v2)) {
    __break(1u);
  }
  else {
    *v1 += v2;
  }
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt64 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int8 a1)
{
}

uint64_t sub_189499ACC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (__OFADD__(*v2, result)) {
    __break(1u);
  }
  else {
    *v2 += result;
  }
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int16 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int32 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int64 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Float a1)
{
  uint64_t v2 = tb_message_size_f32();
  if (__OFADD__(*v1, v2)) {
    __break(1u);
  }
  else {
    *v1 += v2;
  }
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Double a1)
{
  uint64_t v2 = tb_message_size_f64();
  if (__OFADD__(*v1, v2)) {
    __break(1u);
  }
  else {
    *v1 += v2;
  }
}

uint64_t TightbeamSizingEncoder.encode(_:)()
{
  uint64_t result = tb_message_size_capability();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t sub_189499B90()
{
  uint64_t result = tb_message_size_BOOL();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t sub_189499BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_u8);
}

uint64_t sub_189499BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_u16);
}

uint64_t sub_189499BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_u32);
}

uint64_t sub_189499BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_u64);
}

uint64_t sub_189499BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_s8);
}

uint64_t sub_189499BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (__OFADD__(*v4, result)) {
    __break(1u);
  }
  else {
    *v4 += result;
  }
  return result;
}

uint64_t sub_189499C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_s16);
}

uint64_t sub_189499C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_s32);
}

uint64_t sub_189499C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189499BF4(a1, a2, a3, tb_message_size_s64);
}

uint64_t sub_189499C40()
{
  uint64_t result = tb_message_size_f32();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t sub_189499C68()
{
  uint64_t result = tb_message_size_f64();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t dispatch thunk of TightbeamEncoderProtocol.encode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of TightbeamEncoderProtocol.encode(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

ValueMetadata *type metadata accessor for TightbeamEncoder()
{
  return &type metadata for TightbeamEncoder;
}

ValueMetadata *type metadata accessor for TightbeamSizingEncoder()
{
  return &type metadata for TightbeamSizingEncoder;
}

void TightbeamEndpoint.constructEndpoint()()
{
  uint64_t v1 = sub_1894A1ECC();
  uint64_t v2 = MEMORY[0x1895F8858](v1);
  MEMORY[0x1895F8858](v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
  uint64_t v4 = MEMORY[0x1895F8858](v3);
  MEMORY[0x1895F8858](v4);
  uint64_t v5 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x1895F8858](v5);
  sub_18949A788(v0, (uint64_t)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = (char *)&loc_189499E2C + dword_18949A714[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }

_DWORD *sub_189499E3C()
{
  uint64_t v1 = *v0;
  sub_18949A7CC();
  int v3 = v2;
  int v4 = sub_18949A908();
  return tb_endpoint_create_with_value(v3, v1, v4);
}

uint64_t type metadata accessor for TightbeamEndpoint()
{
  uint64_t result = qword_18C79ADF8;
  if (!qword_18C79ADF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18949A788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TightbeamEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_18949A7CC()
{
  uint64_t v1 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x1895F8858](v1);
  sub_18949A788(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  int v3 = (char *)sub_18949A850 + 4 * byte_1894A3C30[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }

uint64_t sub_18949A850()
{
  return 3LL;
}

uint64_t sub_18949A908()
{
  uint64_t v1 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x1895F8858](v1);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_18949A788(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = 2LL;
  switch(EnumCaseMultiPayload)
  {
    case 0:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 1:
      return result;
    case 2:
      return 3LL;
    case 7:
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0);
      sub_18949200C((uint64_t)&v3[*(int *)(v6 + 48)]);
      goto LABEL_7;
    case 8:
      uint64_t v7 = sub_1894A1ECC();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v3, v7);
LABEL_7:
      uint64_t result = 1LL;
      break;
    default:
      sub_189495EC0((uint64_t)v3);
      uint64_t result = 0LL;
      break;
  }

  return result;
}

size_t sub_18949AA08(char **a1, char *__src, int64_t a3, char *__dst, int64_t a5)
{
  uint64_t v6 = __src;
  if (!a3 || !a5)
  {
    size_t v8 = 0LL;
    uint64_t v9 = &__src[a3];
    if (!__src) {
      uint64_t v9 = 0LL;
    }
    goto LABEL_12;
  }

  if (a3 >= a5) {
    size_t v8 = a5;
  }
  else {
    size_t v8 = a3;
  }
  if ((v8 & 0x8000000000000000LL) == 0 && (&__dst[v8] <= __src || &__src[v8] <= __dst))
  {
    memcpy(__dst, __src, v8);
    uint64_t v9 = &v6[a3];
    v6 += v8;
LABEL_12:
    *a1 = v6;
    a1[1] = v9;
    return v8;
  }

  size_t result = sub_1894A23E8();
  __break(1u);
  return result;
}

uint64_t sub_18949AB28(uint64_t a1, uint64_t a2)
{
  int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_18949AB64()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_18949AB90()
{
  return swift_deallocObject();
}

uint64_t sub_18949ABA0()
{
  return swift_deallocObject();
}

uint64_t sub_18949ABB0()
{
  return swift_deallocObject();
}

uint64_t sub_18949ABC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18949AC08()
{
  return swift_deallocObject();
}

uint64_t sub_18949AC18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18949AC60()
{
  return swift_deallocObject();
}

uint64_t sub_18949AC70()
{
  return swift_release();
}

uint64_t sub_18949AC78()
{
  unint64_t v0 = sub_1894A2250();
  uint64_t v4 = sub_18949B860(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_18949ACF4()
{
  return swift_deallocObject();
}

uint64_t sub_18949AD04()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result) {
    JUMPOUT(0x1895E79FCLL);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        *a1 = *a2;
        uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0) + 48);
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_1894A1ECC();
        uint64_t v14 = *(void *)(v13 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
          memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
        }

        else
        {
          (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 1LL, v13);
        }

        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
      case 9u:
        uint64_t v16 = sub_1894A1ECC();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16LL))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
        *a1 = *a2;
        uint64_t v18 = a2[3];
        *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
        a1[3] = v18;
        swift_retain();
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v5 + 64));
        break;
    }
  }

  return a1;
}

uint64_t destroy for TightbeamEndpoint(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 7:
      uint64_t v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0) + 48);
      uint64_t v7 = sub_1894A1ECC();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
      if (!(_DWORD)result)
      {
        uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
        uint64_t v5 = v6;
        uint64_t v3 = v7;
        goto LABEL_3;
      }

      break;
    case 8:
    case 9:
      uint64_t v3 = sub_1894A1ECC();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL);
      uint64_t v5 = a1;
LABEL_3:
      uint64_t result = v4(v5, v3);
      break;
    case 10:
      goto LABEL_8;
    case 11:
      swift_release();
LABEL_8:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }

  return result;
}

void *initializeWithCopy for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 7u:
      *a1 = *a2;
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_1894A1ECC();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
      }

      goto LABEL_10;
    case 8u:
    case 9u:
      uint64_t v13 = sub_1894A1ECC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16LL))(a1, a2, v13);
      goto LABEL_10;
    case 0xAu:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_retain();
      goto LABEL_10;
    case 0xBu:
      *a1 = *a2;
      uint64_t v15 = a2[3];
      *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
      a1[3] = v15;
      swift_retain();
      swift_retain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
      break;
  }

  return a1;
}

void *assignWithCopy for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_189495EC0((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_11;
      case 7u:
        *a1 = *a2;
        uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0) + 48);
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_1894A1ECC();
        uint64_t v10 = *(void *)(v9 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1LL, v9))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
          memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64LL));
        }

        else
        {
          (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0LL, 1LL, v9);
        }

        goto LABEL_11;
      case 8u:
      case 9u:
        uint64_t v12 = sub_1894A1ECC();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(a1, a2, v12);
        goto LABEL_11;
      case 0xAu:
        uint64_t v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_retain();
        goto LABEL_11;
      case 0xBu:
        uint64_t v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        uint64_t v15 = a2[2];
        uint64_t v16 = a2[3];
        a1[2] = v15;
        a1[3] = v16;
        swift_retain();
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
        break;
    }
  }

  return a1;
}

void *initializeWithTake for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 9 || EnumCaseMultiPayload == 8)
  {
    uint64_t v13 = sub_1894A1ECC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(a1, a2, v13);
LABEL_10:
    swift_storeEnumTagMultiPayload();
    return a1;
  }

  if (EnumCaseMultiPayload == 7)
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0) + 48);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1894A1ECC();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
    }

    goto LABEL_10;
  }

  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  return a1;
}

void *assignWithTake for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_189495EC0((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 9 || EnumCaseMultiPayload == 8)
    {
      uint64_t v13 = sub_1894A1ECC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(a1, a2, v13);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }

    if (EnumCaseMultiPayload == 7)
    {
      *a1 = *a2;
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C79ADF0) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_1894A1ECC();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD38);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0LL, 1LL, v10);
      }

      goto LABEL_11;
    }

    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  return a1;
}

uint64_t getEnumTagSinglePayload for TightbeamEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t storeEnumTagSinglePayload for TightbeamEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_18949B768()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_18949B778()
{
  uint64_t v5 = &unk_1894A3C98;
  uint64_t v6 = MEMORY[0x189617758] + 64LL;
  uint64_t v7 = MEMORY[0x189617758] + 64LL;
  uint64_t v8 = MEMORY[0x189617758] + 64LL;
  uint64_t v0 = MEMORY[0x189617760];
  uint64_t v9 = MEMORY[0x189617760] + 64LL;
  uint64_t v10 = MEMORY[0x189617760] + 64LL;
  uint64_t v11 = MEMORY[0x189617760] + 64LL;
  sub_189494730();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v12 = &v4;
    uint64_t v2 = sub_1894A1ECC();
    if (v3 <= 0x3F)
    {
      uint64_t v13 = *(void *)(v2 - 8) + 64LL;
      uint64_t v14 = v13;
      uint64_t v15 = MEMORY[0x18961AFD8] + 64LL;
      uint64_t v16 = &unk_1894A3CB0;
      uint64_t v17 = v0 + 64;
      swift_initEnumMetadataMultiPayload();
    }
  }

uint64_t sub_18949B860(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    unint64_t v9 = sub_18949B9A4(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_18949204C(v9, 0LL);
      unint64_t v12 = sub_18949BA90((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v11 = (void *)MEMORY[0x18961AFE8];
    }

    uint64_t v13 = MEMORY[0x1895E721C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }

  else
  {
    if ((a4 & 0x2000000000000000LL) == 0)
    {
      if ((a3 & 0x1000000000000000LL) != 0) {
LABEL_12:
      }
        JUMPOUT(0x1895E721CLL);
LABEL_9:
      sub_1894A2388();
      goto LABEL_12;
    }

    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1895E721C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }

unint64_t sub_18949B9A4( unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000LL) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4LL << v8;
  if ((result & 0xC) == 4LL << v8)
  {
    uint64_t result = sub_1894920B0(result, a3, a4);
    unint64_t v7 = result;
  }

  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_1894920B0(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000LL) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }

  else if ((a4 & 0x1000000000000000LL) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }

  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }

  else if (v10 >= a2 >> 16)
  {
    return sub_1894A222C();
  }

  __break(1u);
  return result;
}

unint64_t sub_18949BA90( unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0LL;
    goto LABEL_33;
  }

  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0LL;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    _BYTE v9[4] = v12;
    return v11;
  }

  uint64_t v11 = 0LL;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000LL) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4LL << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1894920B0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = sub_1894A2238();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }

    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000LL) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000LL) == 0) {
          uint64_t result = sub_1894A2388();
        }
        char v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000LL) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }

    uint64_t result = sub_1894920B0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000LL) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_29;
    }

uint64_t sub_18949BCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[2] = *MEMORY[0x1895F89C0];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AE08);
  uint64_t result = MEMORY[0x1895F8858](v8);
  v11[0] = a1;
  v11[1] = a2;
  if (a3)
  {
    MEMORY[0x1895F8858](result);
    *(void *)&v10[-32] = v11;
    *(void *)&v10[-24] = a3;
    *(void *)&v10[-16] = a4;
    *(void *)&v10[-8] = a3;
    __asm { BR              X10 }
  }

  return result;
}

void *sub_18949C024(void *__src, uint64_t a2, void *__dst)
{
  if (__dst && __src)
  {
    if (a2 - (uint64_t)__src < 0)
    {
      uint64_t __src = (void *)sub_1894A23E8();
      __break(1u);
    }

    else
    {
      return memmove(__dst, __src, a2 - (void)__src);
    }
  }

  return __src;
}

uint64_t sub_18949C0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(v3 + 16);
  uint64_t v6 = v5[2];
  if (__OFADD__(v6, a3))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (v5[3] >= v6 + a3)
  {
    uint64_t result = sub_18949BCD4(a1, a2, *v5 + v6, *v5 + v6 + a3);
    uint64_t v8 = v5[2];
    BOOL v9 = __OFADD__(v8, a3);
    uint64_t v10 = v8 + a3;
    if (!v9)
    {
      void v5[2] = v10;
      return result;
    }

    goto LABEL_7;
  }

uint64_t sub_18949C1BC(uint64_t a1, uint64_t a2)
{
  char v4 = *(void **)(v2 + 16);
  uint64_t v5 = v4[2];
  if (__OFADD__(v5, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (v4[3] >= v5 + a2)
  {
    uint64_t result = (uint64_t)memmove((void *)(*v4 + v5), (const void *)(a1 + 32), *(void *)(a1 + 16));
    uint64_t v7 = v4[2];
    BOOL v8 = __OFADD__(v7, a2);
    uint64_t v9 = v7 + a2;
    if (!v8)
    {
      v4[2] = v9;
      return result;
    }

    goto LABEL_7;
  }

uint64_t _tb_unix_service_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2 = sub_1894A1ECC();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = tb_endpoint_get_data(a1) + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(v5, v6, v2);
  swift_release();
  type metadata accessor for UnixTransportService();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_listener) = 0LL;
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport) = 0LL;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_targetURL,  v5,  v2);
  return v8;
}

uint64_t type metadata accessor for UnixTransportService()
{
  uint64_t result = qword_18C506C78;
  if (!qword_18C506C78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void _tb_unix_service_transport_send_message()
{
}

uint64_t sub_18949C45C(uint64_t a1)
{
  uint64_t context = tb_transport_get_context(a1);
  *(void *)(context + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport) = a1;
  swift_retain();
  uint64_t v3 = sub_1894A1EC0();
  uint64_t v5 = v4;
  uint64_t v9 = type metadata accessor for UnixTransportService();
  uint64_t v10 = &off_18A3AD298;
  v7[4] = &off_18A3AD278;
  v8[0] = context;
  v7[3] = v9;
  v7[0] = context;
  type metadata accessor for UnixListener();
  swift_allocObject();
  swift_retain_n();
  *(void *)(context + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_listener) = sub_18948E0C0( v3,  v5,  (uint64_t)v8,  (uint64_t)v7);
  swift_release();
  swift_release();
  return 0LL;
}

void sub_18949C5C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = tb_alloc_transport_message_buffer();
  if (v4)
  {
    uint64_t v5 = v4;
    type metadata accessor for TransportBuffer();
    uint64_t inited = swift_initStackObject();
    *(void *)(inited + 24) = 0LL;
    *(void *)(inited + 32) = 0LL;
    *(void *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
    *(_BYTE *)(inited + 40) = 1;
    __asm { BR              X9 }
  }

  __break(1u);
  JUMPOUT(0x18949C860LL);
}

uint64_t sub_18949C918()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_targetURL;
  uint64_t v2 = sub_1894A1ECC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_18949C978()
{
  return type metadata accessor for UnixTransportService();
}

uint64_t sub_18949C980()
{
  uint64_t result = sub_1894A1ECC();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18949CA04(uint64_t (*a1)(uint64_t a1), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1894A1FD4();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858](v7);
  uint64_t v10 = (uint64_t (**)(uint64_t))((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t result = *(void *)(v3 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport);
  if (result)
  {
    sub_18949C5C4(result, a2, a3);
    uint64_t v13 = v12;
    unint64_t v15 = v14;
    *uint64_t v10 = sub_189498FBC;
    v10[1] = a1;
    (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v8 + 104))( v10,  *MEMORY[0x1896089B8],  v7);
    sub_1894A1FC8();
    swift_retain();
    sub_1894A1FBC();
    sub_1894A1FF8();
    swift_release();
    (*(void (**)(uint64_t (**)(uint64_t), uint64_t))(v8 + 8))(v10, v7);
    return sub_189488444(v13, v15);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18949CB30(uint64_t (*a1)(uint64_t a1), uint64_t a2, uint64_t a3)
{
  return sub_18949CA04(a1, a2, a3);
}

unint64_t sub_18949CB50()
{
  unint64_t result = qword_18C79AD60;
  if (!qword_18C79AD60)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C79AD58);
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x189607080], v1);
    atomic_store(result, (unint64_t *)&qword_18C79AD60);
  }

  return result;
}

_BYTE *sub_18949CB9C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    unint64_t result = (_BYTE *)sub_18949CDD4(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (_BYTE *)sub_18949CE94((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    unint64_t result = (_BYTE *)sub_18949CF0C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

uint64_t sub_18949CC10(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v3 = a2 - a1;
  if (v3 < 0)
  {
    a1 = sub_1894A23E8();
    __break(1u);
LABEL_4:
    uint64_t v3 = 0LL;
  }

  return a3(a1, v3);
}

uint64_t sub_18949CC90()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_18949CD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t result = sub_1894A1E24();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = sub_1894A1E3C();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v8 += a1 - result;
  }

  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v11 = sub_1894A1E30();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0LL;
  }
  sub_18949CC10(v8, v14, a4);
  return 0LL;
}

uint64_t sub_18949CDD4(_BYTE *__src, _BYTE *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_18949CE94(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_1894A1E48();
  swift_allocObject();
  uint64_t result = sub_1894A1E18();
  if (v2 < 0)
  {
    __break(1u);
  }

  else
  {
    sub_1894A1EF0();
    uint64_t result = swift_allocObject();
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(void *)(result + 24) = v2;
  }

  return result;
}

uint64_t sub_18949CF0C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  sub_1894A1E48();
  swift_allocObject();
  uint64_t result = sub_1894A1E18();
  if (v2 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

void *sub_18949CF8C(void *__src, size_t __len)
{
  if (__src)
  {
    if ((__len & 0x8000000000000000LL) != 0)
    {
      uint64_t __src = (void *)sub_1894A23E8();
      __break(1u);
    }

    else
    {
      return memmove(*(void **)(v2 + 40), __src, __len);
    }
  }

  return __src;
}

unint64_t sub_18949D00C()
{
  unint64_t result = qword_18C79AD50;
  if (!qword_18C79AD50)
  {
    uint64_t v1 = sub_1894A1F08();
    unint64_t result = MEMORY[0x1895E7954](MEMORY[0x189606D20], v1);
    atomic_store(result, (unint64_t *)&qword_18C79AD50);
  }

  return result;
}

uint64_t sub_18949D054(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AE08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t static TightbeamMessage.size<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t TightbeamEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t result = (*(uint64_t (**)(uint64_t *))(a3 + 16))(&v6);
  if (v4)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }

  return result;
}

uint64_t TightbeamDecoder.decode<A>(as:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  uint64_t v7 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8);
  swift_retain();
  uint64_t result = v7(&v9, a2, a3);
  if (v4)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }

  return result;
}

uint64_t dispatch thunk of TightbeamEndpointDecodable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static TightbeamEncodable.encodedSize(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of TightbeamEncodable.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of TightbeamDecodable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_18949D1D0(char a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v16 = a2;
    char v17 = 1;
    uint64_t v18 = 0LL;
    uint64_t v19 = a3;
    uint64_t v20 = 0LL;
    int v21 = 0;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v25 = 0LL;
    if ((a1 & 1) != 0) {
      int v5 = 4;
    }
    else {
      int v5 = 1;
    }
    int v8 = v5;
    char v9 = 0;
    __int128 v10 = 0uLL;
    __int128 v11 = 0uLL;
    __int128 v12 = 0uLL;
    __int128 v13 = 0uLL;
    uint64_t v14 = 0LL;
    unint64_t v15 = &v16;
    type metadata accessor for TightbeamMessage();
    uint64_t v6 = swift_allocObject();
    TightbeamMessage.init(wrapping:)((uint64_t)&v8);
    a4(v6);
    sub_18949DD58();
    swift_release();
    return sub_189494FA4((uint64_t)&v16, 0LL, 0LL, 1);
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t static TightbeamMessage.withBufferPointer<A>(for:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189494C4C(a2, a3, (void (*)(void))sub_18949D684);
}

uint64_t TightbeamMessage.__allocating_init(wrapping:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  TightbeamMessage.init(wrapping:)(a1);
  return v2;
}

uint64_t Capability.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t Capability.value.getter()
{
  return *(void *)v0;
}

BOOL static TightbeamMessage.BufferUsage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TightbeamMessage.BufferUsage.hash(into:)()
{
  return sub_1894A2484();
}

uint64_t TightbeamMessage.BufferUsage.hashValue.getter()
{
  return sub_1894A249C();
}

BOOL static TightbeamMessage.admissionSearchMultiple(table:selector:)( uint64_t *a1, unint64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    a2 = 0LL;
    a1 = 0LL;
  }

  return tb_component_admission_search_multiple(a1, a2, a4);
}

uint64_t sub_18949D4BC(uint64_t a1, char a2, void (*a3)(void *))
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = (a2 & 1) != 0 ? 4 : 1;
  int v11 = v5;
  char v12 = 0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v17 = 0LL;
  uint64_t v18 = v4;
  type metadata accessor for TightbeamMessage();
  uint64_t v6 = (void *)swift_allocObject();
  void v6[3] = 0LL;
  _BYTE v6[4] = 0LL;
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)&v11);
  if (transport_buffer)
  {
    uint64_t v8 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 24) = 0LL;
    *(void *)(v9 + 32) = 0LL;
    *(void *)(v9 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v8;
    *(_BYTE *)(v9 + 40) = 1;
    void v6[3] = &v11;
    _BYTE v6[4] = v9;
    void v6[2] = 0xC000000000000000LL;
    a3(v6);
    sub_18949DD58();
    return swift_release();
  }

  else
  {
LABEL_7:
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18949D684(uint64_t a1)
{
  return sub_18949D4BC(a1, *(_BYTE *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

uint64_t static TightbeamMessage.decode(message:from:for:validating:)( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  char v12 = a6 & 1;
  type metadata accessor for UnownedServiceConnection();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2;
  type metadata accessor for AnyServiceConnection();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v13;
  *(void *)(v14 + 24) = &off_18A3AD5B8;
  uint64_t v15 = a3[3];
  uint64_t v16 = a3[4];
  uint64_t v17 = __swift_project_boxed_opaque_existential_1(a3, v15);
  swift_retain();
  uint64_t v18 = sub_18949E098(a1, v14, (uint64_t)v17, a4, a5, v12, v6, v15, v16);
  swift_release();
  swift_release();
  return v18;
}

uint64_t sub_18949D798(uint64_t a1, size_t a2, uint64_t a3)
{
  v3[3] = 0LL;
  v3[4] = 0LL;
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  type metadata accessor for TransportBuffer();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v9);
  *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v9;
  *(void *)(v8 + 24) = nullsub_1;
  *(void *)(v8 + 32) = 0LL;
  *(_BYTE *)(v8 + 40) = 0;
  if (tb_client_connection_message_construct(*(uint64_t **)(a1 + 16), (uint64_t)v7, v9, a2, a3))
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  else
  {
    v3[4] = v8;
    swift_release();
    v3[2] = a1;
    v3[3] = v7;
    return (uint64_t)v3;
  }

  return result;
}

uint64_t TightbeamMessage.__allocating_init(buffer:disposition:state:)( uint64_t a1, char a2, unint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  TightbeamMessage.init(buffer:disposition:state:)(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32));
  return v6;
}

uint64_t TightbeamMessage.init(buffer:disposition:state:)(uint64_t a1, char a2, uint64_t a3)
{
  v3[3] = 0LL;
  v3[4] = 0LL;
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  if (*(unsigned __int8 *)(a1 + 40) >= 2u)
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  else
  {
    uint64_t v8 = v7;
    tb_message_construct((uint64_t)v7, *(void *)(a1 + 16), a2);
    if ((a3 & 0x100000000LL) == 0) {
      *uint64_t v8 = a3;
    }
    v3[2] = 0xC000000000000000LL;
    v3[3] = v8;
    v3[4] = a1;
    swift_release();
    return (uint64_t)v3;
  }

  return result;
}

uint64_t TightbeamMessage.init(wrapping:)(uint64_t a1)
{
  v1[3] = 0LL;
  v1[4] = 0LL;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v4 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 24) = 0LL;
    *(void *)(v5 + 32) = 0LL;
    *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4;
    *(_BYTE *)(v5 + 40) = 1;
    v1[3] = a1;
    v1[4] = v5;
    swift_release();
    v1[2] = 0xC000000000000000LL;
    return (uint64_t)v1;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18949DAAC@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_18949DAB8()
{
  if (*(void *)(v0 + 32)) {
    return swift_retain();
  }
  uint64_t result = sub_1894A23AC();
  __break(1u);
  return result;
}

void sub_18949DB24()
{
  __asm { BR              X10 }

uint64_t sub_18949DB74()
{
  uint64_t v4 = *(_DWORD **)(v3 + 24);
  if (!v4)
  {
    sub_1894A23AC();
    __break(1u);
    JUMPOUT(0x18949DD48LL);
  }

  uint64_t v5 = *(uint64_t **)(v0 + 16);
  swift_retain();
  int v6 = tb_client_connection_message_reset(v5, v4, v2, v1);
  if (v6)
  {
    int v7 = v6;
    type metadata accessor for TransportError(0LL);
    sub_189494F5C();
    swift_allocError();
    *uint64_t v8 = v7;
    swift_willThrow();
  }

  return swift_release();
}

uint64_t sub_18949DD58()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 16);
    uint64_t v3 = *(void *)(v1 + 24);
    uint64_t v4 = *(void *)(v1 + 32);
    *(void *)(v1 + 24) = 0LL;
    *(void *)(v1 + 32) = 0LL;
    *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    char v5 = *(_BYTE *)(v1 + 40);
    *(_BYTE *)(v1 + 40) = 2;
    sub_189494FA4(v2, v3, v4, v5);
  }

  uint64_t v6 = *(void *)(v0 + 24);
  if (v6)
  {
    *(void *)(v0 + 24) = 0LL;
    *(void *)(v0 + 32) = 0LL;
    swift_release();
    return v6;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t TightbeamMessage.deinit()
{
  if (*(void *)(v0 + 24)) {
    __asm { BR              X11 }
  }

  swift_release();
  swift_release();
  return v0;
}

void sub_18949DEEC()
{
}

uint64_t TightbeamMessage.__deallocating_deinit()
{
  if (*(void *)(v0 + 24)) {
    __asm { BR              X11 }
  }

  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_18949E038()
{
}

uint64_t sub_18949E098( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = a6 & 1;
  uint64_t v15 = *(void *)(a8 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v19);
  swift_retain();
  uint64_t v25 = sub_18949E6D8(a1, a2);
  uint64_t v20 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 8);
  swift_retain();
  uint64_t v21 = v20(&v25, a4, a5, v14, a8, a9);
  uint64_t v22 = sub_18949DD58();
  swift_release_n();
  swift_release();
  if (!v21) {
    uint64_t v22 = 0LL;
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a8);
  return v22;
}

unint64_t sub_18949E26C()
{
  unint64_t result = qword_18C79AE10;
  if (!qword_18C79AE10)
  {
    unint64_t result = MEMORY[0x1895E7954]( &protocol conformance descriptor for TightbeamMessage.BufferUsage,  &type metadata for TightbeamMessage.BufferUsage);
    atomic_store(result, (unint64_t *)&qword_18C79AE10);
  }

  return result;
}

uint64_t dispatch thunk of MessageDecodeProtocol.decode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ValidatingMessageDecodeProtocol.decode(_:validating:)( uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a6 + 8))(a1, a2, a3, a4 & 1);
}

ValueMetadata *type metadata accessor for Capability()
{
  return &type metadata for Capability;
}

uint64_t type metadata accessor for TightbeamMessage()
{
  return objc_opt_self();
}

uint64_t method lookup function for TightbeamMessage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TightbeamMessage.__allocating_init(buffer:disposition:state:)( uint64_t a1, uint64_t a2, unint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v3 + 200))( a1,  a2,  a3 | ((HIDWORD(a3) & 1) << 32));
}

uint64_t dispatch thunk of TightbeamMessage.__allocating_init(wrapping:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of TightbeamMessage.encoder()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216LL))();
}

uint64_t dispatch thunk of TightbeamMessage.transportBuffer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of TightbeamMessage.unwrap()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240LL))();
}

uint64_t storeEnumTagSinglePayload for TightbeamMessage.BufferUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_18949E3B4 + 4 * byte_1894A3DD5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18949E3E8 + 4 * asc_1894A3DD0[v4]))();
}

uint64_t sub_18949E3E8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18949E3F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18949E3F8LL);
  }
  return result;
}

uint64_t sub_18949E404(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18949E40CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_18949E410(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18949E418(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamMessage.BufferUsage()
{
  return &type metadata for TightbeamMessage.BufferUsage;
}

void *initializeBufferWithCopyOfBuffer for TightbeamMessage.Connection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for TightbeamMessage.Connection()
{
  return swift_release();
}

void *assignWithCopy for TightbeamMessage.Connection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for TightbeamMessage.Connection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TightbeamMessage.Connection(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7D && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TightbeamMessage.Connection( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)unint64_t result = a2 - 125;
    if (a3 >= 0x7D) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7D) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007LL;
    }
  }

  return result;
}

uint64_t sub_18949E59C(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if ((_DWORD)v1 == 3) {
    return (*a1 >> 3) + 3;
  }
  else {
    return v1;
  }
}

void *sub_18949E5B8(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_18949E5C8(unint64_t *result, uint64_t a2)
{
  if (a2 < 3)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8LL;
    unint64_t v3 = a2 << 62;
  }

  else
  {
    uint64_t v2 = 8LL * (a2 - 3);
    unint64_t v3 = 0xC000000000000000LL;
  }

  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamMessage.Connection()
{
  return &type metadata for TightbeamMessage.Connection;
}

uint64_t sub_18949E604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v6 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 24) = 0LL;
    *(void *)(v7 + 32) = 0LL;
    *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v6;
    *(_BYTE *)(v7 + 40) = 1;
    v4[3] = a1;
    v4[4] = v7;
    v4[2] = a2 | 0x8000000000000000LL;
    return (uint64_t)v4;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18949E6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_allocObject();
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v6 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 24) = 0LL;
    *(void *)(v7 + 32) = 0LL;
    *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v6;
    *(_BYTE *)(v7 + 40) = 1;
    v4[3] = a1;
    v4[4] = v7;
    v4[2] = a2 | 0x4000000000000000LL;
    return (uint64_t)v4;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t ClientConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  TightbeamEndpoint.constructEndpoint()();
  uint64_t v4 = tb_client_connection_create_with_endpoint(v3);
  tb_client_connection_activate(v4);
  sub_189495EC0(a1);
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4;
  return v2;
}

uint64_t ClientConnection.init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = v1;
  TightbeamEndpoint.constructEndpoint()();
  char v5 = tb_client_connection_create_with_endpoint(v4);
  tb_client_connection_activate(v5);
  sub_189495EC0(a1);
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  return v2;
}

uint64_t ClientConnection.__allocating_init(connection:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a1;
  return result;
}

uint64_t ClientConnection.init(connection:)(uint64_t a1)
{
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a1;
  return v1;
}

uint64_t ClientConnection.allocateMessage(size:capabilities:)(size_t a1, uint64_t a2)
{
  uint64_t v4 = swift_retain();
  return sub_18949D798(v4, a1, a2);
}

void *ClientConnection.send(message:)(void *a1)
{
  v12[1] = *MEMORY[0x1895F89C0];
  v12[0] = 0LL;
  uint64_t v2 = a1[3];
  if (!v2) {
    goto LABEL_12;
  }
  unint64_t v3 = a1;
  int v4 = tb_connection_send_query(*(uint64_t **)(v1 + 16), v2, v12, 2uLL);
  if (!v4)
  {
    uint64_t v7 = v12[0];
    if (!v12[0])
    {
      int v4 = 4;
      goto LABEL_3;
    }

    uint64_t v8 = v3[3];
    if (v8)
    {
      if (v8 == v12[0])
      {
        swift_retain();
        return v3;
      }

      type metadata accessor for TightbeamMessage();
      unint64_t v3 = (void *)swift_allocObject();
      uint64_t transport_buffer = tb_message_get_transport_buffer(v7);
      if (transport_buffer)
      {
        uint64_t v10 = transport_buffer;
        type metadata accessor for TransportBuffer();
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 24) = 0LL;
        *(void *)(v11 + 32) = 0LL;
        *(void *)(v11 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v10;
        *(_BYTE *)(v11 + 40) = 1;
        v3[3] = v7;
        v3[4] = v11;
        v3[2] = 0xC000000000000000LL;
        return v3;
      }
    }

    while (1)
    {
LABEL_12:
      sub_1894A23AC();
      __break(1u);
    }
  }

uint64_t ClientConnection.sendOneway(message:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t result = tb_connection_send_query(*(uint64_t **)(v1 + 16), v2, 0LL, 0LL);
    if ((_DWORD)result)
    {
      int v4 = result;
      type metadata accessor for TransportError(0LL);
      sub_189494F5C();
      swift_allocError();
      _DWORD *v5 = v4;
      return swift_willThrow();
    }
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t ClientConnection.deinit()
{
  return v0;
}

uint64_t ClientConnection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClientConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for ClientConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ClientConnection.__allocating_init(endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ClientConnection.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t _tb_eve_transport_construct_message_buffer(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (__OFADD__(result, 24LL))
  {
    __break(1u);
  }

  else if (result + 24 <= 4096)
  {
    int v4 = (void *)swift_slowAlloc();
    uint64_t result = 0LL;
    v4[1] = 0LL;
    v4[2] = 0LL;
    *int v4 = 0LL;
    *(void *)a3 = v4;
    *(_BYTE *)(a3 + 8) = 0;
    *(_OWORD *)(a3 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_1894A3F50;
    *(void *)(a3 + 32) = 24LL;
    *(void *)(a3 + 48) = 0LL;
  }

  else
  {
    return 2LL;
  }

  return result;
}

void _tb_eve_transport_destruct_message_buffer()
{
}

uint64_t _tb_eve_transport_message_buffer_reset(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 24;
  if (__OFADD__(a3, 24LL))
  {
    __break(1u);
  }

  else if (v3 <= 4096)
  {
    uint64_t v4 = result;
    uint64_t result = 0LL;
    *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 24LL;
    *(void *)(v4 + 24) = v3;
    *(_BYTE *)(v4 + 41) = 1;
  }

  else
  {
    return 2LL;
  }

  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for HandlerRegistration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HandlerRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 64) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 64) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 4) = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HandlerRegistration()
{
  return &type metadata for HandlerRegistration;
}

ValueMetadata *type metadata accessor for ComponentRuntimeLock()
{
  return &type metadata for ComponentRuntimeLock;
}

uint64_t sub_18949EDA0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
}

uint64_t sub_18949EDDC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_18949EE24()
{
  return swift_deallocClassInstance();
}

uint64_t sub_18949EE34()
{
  return *(void *)(v0 + 16);
}

void sub_18949EE3C()
{
}

uint64_t ServiceConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ServiceConnection.init(endpoint:)(a1);
  return v2;
}

uint64_t ServiceConnection.init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v2 + 32) = 0LL;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyServiceConnection();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v2;
  *(void *)(v4 + 24) = &off_18A3AD578;
  swift_retain();
  TightbeamEndpoint.constructEndpoint()();
  uint64_t v6 = v5;
  v10[4] = sub_18949F000;
  v10[5] = v4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1107296256LL;
  void v10[2] = sub_18949F048;
  v10[3] = &block_descriptor_1;
  uint64_t v7 = _Block_copy(v10);
  swift_retain();
  swift_release();
  uint64_t v8 = tb_service_connection_create_with_endpoint(v6, (uint64_t)v7);
  _Block_release(v7);
  sub_18949F5F0(0xD00000000000001BLL, 0x80000001894A6A40LL);
  swift_release();
  sub_189495EC0(a1);
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v8;
  return v2;
}

uint64_t type metadata accessor for AnyServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_18949F000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, ObjectType, v4);
}

uint64_t sub_18949F048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  return v6;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_18949F0B4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1895E7A74](v2 + 24);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(v2 + 32);
    type metadata accessor for AnyServiceConnection();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v2;
    *(void *)(v7 + 24) = &off_18A3AD578;
    swift_retain();
    swift_unknownObjectRetain();
    uint64_t v8 = sub_18949F378(a1, v7, v5, v6, 0LL, 0LL, 1);
    swift_release();
    swift_unknownObjectRelease_n();
    return v8;
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t *sub_18949F1D0()
{
  uint64_t result = *(uint64_t **)(v0 + 16);
  if (result) {
    return (uint64_t *)tb_service_connection_activate(result);
  }
  __break(1u);
  return result;
}

uint64_t ServiceConnection.deinit()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    tb_service_connection_destruct();
    sub_189496454(v0 + 24);
    return v0;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t ServiceConnection.__deallocating_deinit()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    tb_service_connection_destruct();
    sub_189496454(v0 + 24);
    return swift_deallocClassInstance();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18949F244@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 24;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1895E7A74](v4);
  uint64_t v6 = *(void *)(v3 + 32);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_18949F29C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t type metadata accessor for UnownedServiceConnection()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for ServiceConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ServiceConnection.service.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120LL))();
}

uint64_t dispatch thunk of ServiceConnection.service.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128LL))();
}

uint64_t dispatch thunk of ServiceConnection.service.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136LL))();
}

uint64_t dispatch thunk of ServiceConnection.__allocating_init(endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ServiceConnection.begin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160LL))();
}

uint64_t sub_18949F378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v11 = sub_18949E6D8(a1, a2);
  if ((a7 & 1) != 0)
  {
    uint64_t v12 = v11;
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v19 = v12;
    uint64_t v14 = *(void *)(a4 + 8);
    uint64_t v15 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v14 + 8);
    swift_retain();
    uint64_t v16 = v15(&v19, ObjectType, v14);
    uint64_t v17 = sub_18949DD58();
    swift_release_n();
    swift_release();
    swift_unknownObjectRelease();
    if (v16) {
      return v17;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

uint64_t sub_18949F548(uint64_t result)
{
  if ((_DWORD)result)
  {
    int v1 = result;
    sub_1894A2358();
    swift_bridgeObjectRelease();
    tb_error_t.description.getter(v1);
    sub_1894A21FC();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1894A23AC();
    __break(1u);
  }

  return result;
}

void sub_18949F5F0(uint64_t a1, unint64_t a2)
{
  if (qword_18C79AB28 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1894A1F38();
  __swift_project_value_buffer(v4, (uint64_t)qword_18C79AE18);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = (os_log_s *)sub_1894A1F20();
  os_log_type_t v6 = sub_1894A22A4();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_189492220(a1, a2, &v9);
    sub_1894A2310();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_18947B000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E79FC](v8, -1LL, -1LL);
    MEMORY[0x1895E79FC](v7, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n();
  }

uint64_t sub_18949F78C()
{
  uint64_t v0 = sub_1894A1F38();
  __swift_allocate_value_buffer(v0, qword_18C79AE18);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C79AE18);
  return sub_1894A1F2C();
}

uint64_t sub_18949F7F4()
{
  return swift_deallocClassInstance();
}

uint64_t _tb_delegated_client_transport_create(uint64_t a1)
{
  uint64_t data = tb_endpoint_get_data(a1);
  type metadata accessor for DelegatedTransportClient();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = data;
  *(void *)(v2 + 24) = 0LL;
  swift_retain();
  return v2;
}

uint64_t type metadata accessor for DelegatedTransportClient()
{
  return objc_opt_self();
}

uint64_t _tb_delegated_client_transport_activate(uint64_t a1)
{
  *(void *)(tb_transport_get_context(a1) + 24) = a1;
  return 0LL;
}

void sub_18949F8A8(uint64_t a1)
{
  uint64_t v3 = v2;
  type metadata accessor for TightbeamMessage();
  uint64_t inited = (void *)swift_initStackObject();
  inited[3] = 0LL;
  inited[4] = 0LL;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v7 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 24) = 0LL;
    *(void *)(v8 + 32) = 0LL;
    *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v7;
    *(_BYTE *)(v8 + 40) = 1;
    inited[3] = a1;
    inited[4] = v8;
    swift_release();
    inited[2] = 0xC000000000000000LL;
    if (*(unsigned __int8 *)(v8 + 40) < 2u)
    {
      uint64_t v9 = *(uint64_t **)(v8 + 16);
      uint64_t v10 = v9[2];
      if (v9[3] >= v10)
      {
        if (v10 < 0)
        {
          sub_1894A23E8();
          __break(1u);
        }

        else
        {
          uint64_t v11 = *v9;
          uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AD58);
          unint64_t v24 = sub_18949CB50();
          v22[0] = v11;
          v22[1] = v10;
          uint64_t v12 = __swift_project_boxed_opaque_existential_1(v22, v23);
          if (*v12) {
            uint64_t v13 = (_BYTE *)(*v12 + v12[1]);
          }
          else {
            uint64_t v13 = 0LL;
          }
          sub_18949CB9C((_BYTE *)*v12, v13, v21);
          uint64_t v14 = v21[0];
          uint64_t v15 = v21[1];
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
          uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 + 16) + 16LL);
          swift_retain();
          v16(v14, v15);
          unint64_t v18 = v17;
          swift_release();
          uint64_t v19 = inited[4];
          if (v19 && *(unsigned __int8 *)(v19 + 40) < 2u)
          {
            uint64_t v20 = (char *)&loc_18949FA0C + *((int *)qword_18949FCF0 + (v18 >> 62));
            uint64_t v25 = v3;
            __asm { BR              X9 }
          }
        }
      }
    }
  }

  sub_1894A23AC();
  __break(1u);
  JUMPOUT(0x18949FCF0LL);
}

uint64_t sub_18949FD00()
{
  return swift_deallocClassInstance();
}

uint64_t _tb_delegated_client_transport_send_message_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = v5;
  swift_release();
  if (a3) {
    *a3 = v6;
  }
  return 0LL;
}

uint64_t type metadata accessor for DelegatedClientEndpointData()
{
  return objc_opt_self();
}

uint64_t tb_component_admission_search(uint64_t a1, unint64_t a2)
{
  return admissionSearch(_:_:)(a1, a2) & 1;
}

uint64_t admissionSearch(_:_:)(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 1LL;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 0)
  {
LABEL_25:
    uint64_t result = sub_1894A23E8();
    __break(1u);
    return result;
  }

  uint64_t v3 = v2 - 1;
  if (v2 >= 1) {
    uint64_t v4 = v2 - 1;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  uint64_t v5 = v4 >> 1;
  if (v2 > (unint64_t)v5)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    unint64_t v7 = *(void *)(v6 + 8 * v5);
    if (v7 == a2) {
      return 1LL;
    }
    uint64_t v9 = 0LL;
    while (1)
    {
      if (v7 <= a2) {
        uint64_t v9 = v5 + 1;
      }
      else {
        uint64_t v3 = v5 - 1;
      }
      uint64_t v5 = v9 + (v3 - v9) / 2;
      if (__OFADD__(v9, (v3 - v9) / 2)) {
        break;
      }
      uint64_t result = v5 >= v9 && v3 >= v5;
      if ((_DWORD)result == 1)
      {
        unint64_t v7 = *(void *)(v6 + 8 * v5);
        if (v7 != a2) {
          continue;
        }
      }

      return result;
    }

    goto LABEL_25;
  }

  return 0LL;
}

uint64_t sub_18949FF60()
{
  return swift_deallocClassInstance();
}

uint64_t _tb_delegated_service_transport_create(uint64_t a1)
{
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = swift_retain();
  sub_1894A0040(v2);
  return v1;
}

uint64_t type metadata accessor for DelegatedTransportService()
{
  return objc_opt_self();
}

uint64_t sub_18949FFF4(uint64_t a1)
{
  return 0LL;
}

void *sub_1894A0040(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v2 = sub_1894A22BC();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1894A22B0();
  unint64_t v7 = (uint64_t (*)(uint64_t))MEMORY[0x18961B8A8];
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = sub_1894A2154();
  MEMORY[0x1895F8858](v8);
  v10[1] = sub_18948828C();
  sub_1894A2148();
  uint64_t v12 = MEMORY[0x18961AFE8];
  sub_189482774((unint64_t *)&qword_18C79AC20, v7, MEMORY[0x18961B8C0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AC28);
  sub_189494BC4((unint64_t *)&qword_18C79AC30, &qword_18C79AC28, MEMORY[0x189618470]);
  sub_1894A2340();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x18961B900], v2);
  v1[3] = sub_1894A22D4();
  v1[4] = 0LL;
  v1[2] = v11;
  return v1;
}

uint64_t sub_1894A0214(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1894A213C();
  uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0];
  uint64_t v15 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_1894A2154();
  uint64_t v8 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v2 + 32) = a1;
  aBlock[4] = sub_1894A0A5C;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1894A041C;
  aBlock[3] = &block_descriptor_3_0;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1894A2148();
  aBlock[7] = MEMORY[0x18961AFE8];
  sub_189482774(&qword_18C79AE30, v5, MEMORY[0x18961B6B8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AE38);
  sub_189494BC4((unint64_t *)&unk_18C79AE40, &qword_18C79AE38, MEMORY[0x189618470]);
  sub_1894A2340();
  MEMORY[0x1895E7300](0LL, v10, v7, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v14);
  return swift_release();
}

uint64_t type metadata accessor for DelegatedServiceEndpointData()
{
  return objc_opt_self();
}

uint64_t sub_1894A041C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1894A0448()
{
  uint64_t v1 = sub_1894A213C();
  uint64_t v24 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_1894A2154();
  uint64_t v22 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v7 + 16);
  uint64_t v9 = swift_retain();
  uint64_t v10 = v8(v9);
  uint64_t v21 = v10;
  unint64_t v12 = v11;
  swift_release();
  sub_1894A0698(v10, v12);
  uint64_t v14 = v13;
  unint64_t v16 = v15;
  unint64_t v17 = *(void (**)(uint64_t, unint64_t))(v7 + 32);
  swift_retain();
  v17(v14, v16);
  swift_release();
  uint64_t v20 = *(void *)(v0 + 24);
  aBlock[4] = sub_1894A0A38;
  uint64_t v27 = v0;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1894A041C;
  aBlock[3] = &block_descriptor_2;
  unint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  sub_1894A2148();
  uint64_t v25 = MEMORY[0x18961AFE8];
  sub_189482774(&qword_18C79AE30, (uint64_t (*)(uint64_t))MEMORY[0x18961B6A0], MEMORY[0x18961B6B8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79AE38);
  sub_189494BC4((unint64_t *)&unk_18C79AE40, &qword_18C79AE38, MEMORY[0x189618470]);
  sub_1894A2340();
  MEMORY[0x1895E7300](0LL, v6, v3, v18);
  _Block_release(v18);
  sub_189488444(v14, v16);
  sub_189488444(v21, v12);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v23);
  return swift_release();
}

void sub_1894A0698(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = tb_alloc_transport_message_buffer();
  if (v3)
  {
    uint64_t v4 = v3;
    type metadata accessor for TransportBuffer();
    uint64_t inited = swift_initStackObject();
    *(void *)(inited + 24) = 0LL;
    *(void *)(inited + 32) = 0LL;
    *(void *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4;
    *(_BYTE *)(inited + 40) = 1;
    __asm { BR              X9 }
  }

  __break(1u);
  JUMPOUT(0x1894A0950LL);
}

uint64_t sub_1894A0A0C()
{
  return swift_deallocClassInstance();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void _tb_null_transport_send_message_cold_1()
{
}

void _tb_null_transport_send_message_cold_4()
{
}

void tb_message_construct_cold_1()
{
}

void tb_message_configure_received_cold_1()
{
}

void tb_message_measure_subrange_cold_1()
{
}

void tb_message_subrange_cold_1()
{
}

void tb_message_subrange_cold_2()
{
}

void tb_message_subrange_cold_3()
{
}

void tb_message_precheck_encoding_cold_1()
{
}

void tb_message_precheck_encoding_cold_2()
{
}

void tb_message_precheck_encoding_cold_3()
{
}

void tb_message_encode_BOOL_cold_1()
{
}

void tb_message_encode_BOOL_cold_2()
{
}

void tb_message_encode_u8_cold_1()
{
}

void tb_message_encode_u8_cold_2()
{
}

void tb_message_encode_u16_cold_1()
{
}

void tb_message_encode_u16_cold_2()
{
}

void tb_message_encode_u32_cold_1()
{
}

void tb_message_encode_u32_cold_2()
{
}

void tb_message_encode_u64_cold_1()
{
}

void tb_message_encode_u64_cold_2()
{
}

void tb_message_encode_s8_cold_1()
{
}

void tb_message_encode_s8_cold_2()
{
}

void tb_message_encode_s16_cold_1()
{
}

void tb_message_encode_s16_cold_2()
{
}

void tb_message_encode_s32_cold_1()
{
}

void tb_message_encode_s32_cold_2()
{
}

void tb_message_encode_s64_cold_1()
{
}

void tb_message_encode_s64_cold_2()
{
}

void tb_message_encode_f32_v2_cold_1()
{
}

void tb_message_encode_f32_v2_cold_2()
{
}

void tb_message_encode_f64_v2_cold_1()
{
}

void tb_message_encode_f64_v2_cold_2()
{
}

void tb_message_encode_f32_cold_1(int a1)
{
}

void tb_message_raw_encode_f32_cold_1(int a1)
{
}

void tb_message_encode_f64_cold_1(int a1)
{
}

void tb_message_raw_encode_f64_cold_1(int a1)
{
}

void tb_message_encode_buffer_cold_1()
{
}

void tb_message_encode_buffer_cold_2()
{
}

void tb_message_precheck_decoding_cold_1()
{
}

void tb_message_precheck_decoding_cold_2()
{
}

void tb_message_precheck_decoding_cold_3()
{
}

void tb_message_precheck_decoding_cold_4()
{
}

void tb_message_decode_BOOL_cold_1()
{
}

void tb_message_decode_BOOL_cold_2()
{
}

void tb_message_decode_BOOL_cold_3()
{
}

void tb_message_decode_u8_cold_1()
{
}

void tb_message_decode_u8_cold_2()
{
}

void tb_message_decode_u8_cold_3()
{
}

void tb_message_decode_u16_cold_1()
{
}

void tb_message_decode_u16_cold_2()
{
}

void tb_message_decode_u16_cold_3()
{
}

void tb_message_decode_u32_cold_1()
{
}

void tb_message_decode_u32_cold_2()
{
}

void tb_message_decode_u32_cold_3()
{
}

void tb_message_decode_u64_cold_1()
{
}

void tb_message_decode_u64_cold_2()
{
}

void tb_message_decode_u64_cold_3()
{
}

void tb_message_decode_s8_cold_1()
{
}

void tb_message_decode_s8_cold_2()
{
}

void tb_message_decode_s8_cold_3()
{
}

void tb_message_decode_s16_cold_1()
{
}

void tb_message_decode_s16_cold_2()
{
}

void tb_message_decode_s16_cold_3()
{
}

void tb_message_decode_s32_cold_1()
{
}

void tb_message_decode_s32_cold_2()
{
}

void tb_message_decode_s32_cold_3()
{
}

void tb_message_decode_s64_cold_1()
{
}

void tb_message_decode_s64_cold_2()
{
}

void tb_message_decode_s64_cold_3()
{
}

void tb_message_decode_f32_v2_cold_1()
{
}

void tb_message_decode_f32_v2_cold_2()
{
}

void tb_message_decode_f32_v2_cold_3()
{
}

void tb_message_decode_f64_v2_cold_1()
{
}

void tb_message_decode_f64_v2_cold_2()
{
}

void tb_message_decode_f64_v2_cold_3()
{
}

void tb_message_decode_f32_cold_1(int a1)
{
}

void tb_message_raw_decode_f32_cold_1(int a1)
{
}

void tb_message_decode_f64_cold_1(int a1)
{
}

void tb_message_raw_decode_f64_cold_1(int a1)
{
}

void __tb_service_connection_create_block_invoke_cold_1()
{
}

void __tb_service_connection_create_block_invoke_cold_2()
{
}

void __tb_service_connection_create_block_invoke_cold_3()
{
}

void __tb_service_connection_create_block_invoke_cold_4()
{
}

void _get_accumulator_list_cold_1()
{
}

void _tb_connection_transport_for_endpoint_inplace_cold_1()
{
}

void tb_connection_send_query_cold_3()
{
}

void tb_connection_send_query_cold_4()
{
}

void tb_connection_dealloc_destruct_owned_transport_message_buffer_cold_1()
{
}

void _tb_connection_message_construct_cold_1()
{
}

void _tb_connection_message_destruct_cold_1()
{
}

void _tb_mach_transport_send_message_cold_1()
{
}

void ___tb_mach_transport_create_block_invoke_cold_3()
{
}

void _add_accumulator_cold_1()
{
}

void tb_message_accumulator_accumulate_cold_2()
{
}

void tb_message_accumulator_accumulate_cold_4()
{
}

void tb_message_accumulator_accumulate_cold_6()
{
}

void tb_message_accumulator_accumulate_cold_7()
{
}

void tb_message_accumulator_accumulate_cold_9()
{
}

void tb_message_splitter_send_cold_2()
{
}

void tb_reply_splitter_add_reply_cold_1()
{
}

void tb_reply_splitter_next_message_cold_1()
{
}

void _tb_forwarding_connection_message_forward_cold_1()
{
}

void _tb_forwarding_connection_message_forward_cold_2()
{
}

void _tb_forwarding_connection_message_forward_cold_3()
{
}

uint64_t sub_1894A1E18()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_1894A1E24()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_1894A1E30()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_1894A1E3C()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_1894A1E48()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_1894A1E54()
{
  return MEMORY[0x189606320]();
}

uint64_t sub_1894A1E60()
{
  return MEMORY[0x189606328]();
}

uint64_t sub_1894A1E6C()
{
  return MEMORY[0x189606330]();
}

uint64_t sub_1894A1E78()
{
  return MEMORY[0x189606338]();
}

uint64_t sub_1894A1E84()
{
  return MEMORY[0x189606940]();
}

uint64_t sub_1894A1E90()
{
  return MEMORY[0x1896069D8]();
}

uint64_t sub_1894A1E9C()
{
  return MEMORY[0x1896069E8]();
}

uint64_t sub_1894A1EA8()
{
  return MEMORY[0x189606A08]();
}

uint64_t sub_1894A1EB4()
{
  return MEMORY[0x189606A18]();
}

uint64_t sub_1894A1EC0()
{
  return MEMORY[0x189606A60]();
}

uint64_t sub_1894A1ECC()
{
  return MEMORY[0x189606A90]();
}

uint64_t sub_1894A1ED8()
{
  return MEMORY[0x189606B80]();
}

uint64_t sub_1894A1EE4()
{
  return MEMORY[0x189606B90]();
}

uint64_t sub_1894A1EF0()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_1894A1EFC()
{
  return MEMORY[0x189606CF8]();
}

uint64_t sub_1894A1F08()
{
  return MEMORY[0x189606D08]();
}

uint64_t sub_1894A1F14()
{
  return MEMORY[0x189606D28]();
}

uint64_t sub_1894A1F20()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_1894A1F2C()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_1894A1F38()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_1894A1F44()
{
  return MEMORY[0x1896087C0]();
}

uint64_t sub_1894A1F50()
{
  return MEMORY[0x1896087F8]();
}

uint64_t sub_1894A1F5C()
{
  return MEMORY[0x189608808]();
}

uint64_t sub_1894A1F68()
{
  return MEMORY[0x189608838]();
}

uint64_t sub_1894A1F74()
{
  return MEMORY[0x189608860]();
}

uint64_t sub_1894A1F80()
{
  return MEMORY[0x189608868]();
}

uint64_t sub_1894A1F8C()
{
  return MEMORY[0x189608880]();
}

uint64_t sub_1894A1F98()
{
  return MEMORY[0x189608888]();
}

uint64_t sub_1894A1FA4()
{
  return MEMORY[0x189608890]();
}

uint64_t sub_1894A1FB0()
{
  return MEMORY[0x189608898]();
}

uint64_t sub_1894A1FBC()
{
  return MEMORY[0x189608990]();
}

uint64_t sub_1894A1FC8()
{
  return MEMORY[0x1896089A8]();
}

uint64_t sub_1894A1FD4()
{
  return MEMORY[0x1896089C0]();
}

uint64_t sub_1894A1FE0()
{
  return MEMORY[0x1896089D0]();
}

uint64_t sub_1894A1FEC()
{
  return MEMORY[0x1896089F8]();
}

uint64_t sub_1894A1FF8()
{
  return MEMORY[0x189608A08]();
}

uint64_t sub_1894A2004()
{
  return MEMORY[0x189608A18]();
}

uint64_t sub_1894A2010()
{
  return MEMORY[0x189608A78]();
}

uint64_t sub_1894A201C()
{
  return MEMORY[0x189608A80]();
}

uint64_t sub_1894A2028()
{
  return MEMORY[0x189608A98]();
}

uint64_t sub_1894A2034()
{
  return MEMORY[0x189608AA8]();
}

uint64_t sub_1894A2040()
{
  return MEMORY[0x189608AB8]();
}

uint64_t sub_1894A204C()
{
  return MEMORY[0x189608AC8]();
}

uint64_t sub_1894A2058()
{
  return MEMORY[0x189608AE0]();
}

uint64_t sub_1894A2064()
{
  return MEMORY[0x189608B00]();
}

uint64_t sub_1894A2070()
{
  return MEMORY[0x189608B08]();
}

uint64_t sub_1894A207C()
{
  return MEMORY[0x189608B20]();
}

uint64_t sub_1894A2088()
{
  return MEMORY[0x189608B30]();
}

uint64_t sub_1894A2094()
{
  return MEMORY[0x189608B58]();
}

uint64_t sub_1894A20A0()
{
  return MEMORY[0x189608BD8]();
}

uint64_t sub_1894A20AC()
{
  return MEMORY[0x189608BE0]();
}

uint64_t sub_1894A20B8()
{
  return MEMORY[0x189608BF0]();
}

uint64_t sub_1894A20C4()
{
  return MEMORY[0x189608BF8]();
}

uint64_t sub_1894A20D0()
{
  return MEMORY[0x189608C00]();
}

uint64_t sub_1894A20DC()
{
  return MEMORY[0x189608C08]();
}

uint64_t sub_1894A20E8()
{
  return MEMORY[0x189608C10]();
}

uint64_t sub_1894A20F4()
{
  return MEMORY[0x189608C18]();
}

uint64_t sub_1894A2100()
{
  return MEMORY[0x189608C20]();
}

uint64_t sub_1894A210C()
{
  return MEMORY[0x189608C28]();
}

uint64_t sub_1894A2118()
{
  return MEMORY[0x189608C30]();
}

uint64_t sub_1894A2124()
{
  return MEMORY[0x189608C98]();
}

uint64_t sub_1894A2130()
{
  return MEMORY[0x189608CD0]();
}

uint64_t sub_1894A213C()
{
  return MEMORY[0x18961B6A0]();
}

uint64_t sub_1894A2148()
{
  return MEMORY[0x18961B6E8]();
}

uint64_t sub_1894A2154()
{
  return MEMORY[0x18961B708]();
}

uint64_t sub_1894A2160()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_1894A216C()
{
  return MEMORY[0x1896179F8]();
}

uint64_t sub_1894A2178()
{
  return MEMORY[0x189617A00]();
}

uint64_t sub_1894A2184()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_1894A2190()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_1894A219C()
{
  return MEMORY[0x1896070E8]();
}

uint64_t sub_1894A21A8()
{
  return MEMORY[0x1896070F8]();
}

uint64_t sub_1894A21B4()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_1894A21C0()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_1894A21CC()
{
  return MEMORY[0x189617CB0]();
}

uint64_t sub_1894A21D8()
{
  return MEMORY[0x189617D78]();
}

uint64_t sub_1894A21E4()
{
  return MEMORY[0x189617D80]();
}

uint64_t sub_1894A21F0()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_1894A21FC()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1894A2208()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1894A2214()
{
  return MEMORY[0x189617EB8]();
}

uint64_t sub_1894A2220()
{
  return MEMORY[0x189617ED0]();
}

uint64_t sub_1894A222C()
{
  return MEMORY[0x189617ED8]();
}

uint64_t sub_1894A2238()
{
  return MEMORY[0x189617EE0]();
}

uint64_t sub_1894A2244()
{
  return MEMORY[0x189617F48]();
}

uint64_t sub_1894A2250()
{
  return MEMORY[0x189618078]();
}

uint64_t sub_1894A225C()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_1894A2268()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_1894A2274()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_1894A2280()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_1894A228C()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_1894A2298()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_1894A22A4()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_1894A22B0()
{
  return MEMORY[0x18961B8A8]();
}

uint64_t sub_1894A22BC()
{
  return MEMORY[0x18961B920]();
}

uint64_t sub_1894A22C8()
{
  return MEMORY[0x18961B948]();
}

uint64_t sub_1894A22D4()
{
  return MEMORY[0x18961B958]();
}

uint64_t sub_1894A22E0()
{
  return MEMORY[0x18961BA20]();
}

uint64_t sub_1894A22EC()
{
  return MEMORY[0x18961BA28]();
}

uint64_t sub_1894A22F8()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_1894A2304()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_1894A2310()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_1894A231C()
{
  return MEMORY[0x189618D38]();
}

uint64_t sub_1894A2328()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_1894A2334()
{
  return MEMORY[0x189618ED0]();
}

uint64_t sub_1894A2340()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_1894A234C()
{
  return MEMORY[0x189619020]();
}

uint64_t sub_1894A2358()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_1894A2364()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_1894A2370()
{
  return MEMORY[0x189619260]();
}

uint64_t sub_1894A237C()
{
  return MEMORY[0x189619308]();
}

uint64_t sub_1894A2388()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1894A2394()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_1894A23A0()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_1894A23AC()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_1894A23B8()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_1894A23C4()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_1894A23D0()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_1894A23DC()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1894A23E8()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1894A23F4()
{
  return MEMORY[0x189619A08]();
}

uint64_t sub_1894A2400()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1894A240C()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1894A2418()
{
  return MEMORY[0x18961A120]();
}

uint64_t sub_1894A2424()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_1894A2430()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_1894A243C()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_1894A2448()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1894A2454()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1894A2460()
{
  return MEMORY[0x18961A668]();
}

uint64_t sub_1894A246C()
{
  return MEMORY[0x18961A678]();
}

uint64_t sub_1894A2478()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1894A2484()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_1894A2490()
{
  return MEMORY[0x18961A6B0]();
}

uint64_t sub_1894A249C()
{
  return MEMORY[0x18961A6C0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1895F8C00](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1895F8C58]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9618](*(void *)&bp, service_name, sp);
}

kern_return_t bootstrap_register(mach_port_t bp, name_t service_name, mach_port_t sp)
{
  return MEMORY[0x1895F9638](*(void *)&bp, service_name, *(void *)&sp);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1895FACF0]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1895FACF8]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1895FAD00]();
}

uint64_t dispatch_mach_msg_create()
{
  return MEMORY[0x1895FAD18]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1895FAD20]();
}

uint64_t dispatch_mach_send()
{
  return MEMORY[0x1895FAD28]();
}

uint64_t dispatch_mach_send_and_wait_for_reply()
{
  return MEMORY[0x1895FAD30]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
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

uint64_t exclaves_endpoint_call()
{
  return MEMORY[0x1895FB160]();
}

uint64_t exclaves_launch_conclave()
{
  return MEMORY[0x1895FB168]();
}

uint64_t exclaves_lookup_service()
{
  return MEMORY[0x1895FB170]();
}

uint64_t exclaves_notification_create()
{
  return MEMORY[0x1895FB178]();
}

void free(void *a1)
{
}

uint8_t *__cdecl getsectiondata( const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FB6A0](mhp, segname, sectname, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
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

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
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

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x18961B188]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x18961B2E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x18961B338]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x18961B388]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x18961B408]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x18961B460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x18961B470]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x18961B478]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x18961B490]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x18961B498]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x18961B4A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x18961B4F0]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x18961B4F8]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x18961B500]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}