uint64_t _catalog_uuid_add(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  v2 = *(void *)(a1 + 16);
  if (v2) {
    v3 = *(void *)(v2 + 24);
  }
  else {
    v3 = 0LL;
  }
  return _os_trace_uuid_map_insert((float *)v2, a2, v3);
}

uint64_t _catalog_for_each_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(result + 16);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v5 = ___catalog_for_each_uuid_block_invoke;
  v6 = &unk_189F0DE88;
  uint64_t v7 = a2;
  for (i = *(void **)(v2 + 16); i; i = (void *)*i)
    result = ((uint64_t (*)(void *, void *, void))v5)(v4, i + 2, i[4]);
  return result;
}

uint64_t ___catalog_for_each_uuid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

unsigned int *_catalog_procinfo_for_each_uuidinfo(uint64_t a1, uint64_t a2)
{
  v4[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(unsigned int **)(a1 + 56);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  void v4[2] = ___catalog_procinfo_for_each_uuidinfo_block_invoke;
  v4[3] = &unk_189F0DEB0;
  v4[4] = a2;
  return hashtable_iterate(v2, (uint64_t)v4);
}

uint64_t ___catalog_procinfo_for_each_uuidinfo_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL _catalog_procinfo_uuidinfo_add(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24);
  }
  else {
    uint64_t v7 = 0LL;
  }
  _os_trace_uuid_map_insert((float *)v6, (uint64_t *)(a3 + 14), v7);
  v11[0] = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
  uint64_t v8 = hashtable_lookup(*(void *)(a2 + 56), (uint64_t)v11);
  if (!v8)
  {
    uint64_t v9 = _os_trace_calloc();
    *(void *)uint64_t v9 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
    *(void *)(v9 + 8) = *(void *)a3;
    *(_OWORD *)(v9 + 16) = *(_OWORD *)(a3 + 14);
    if ((hashtable_insert(*(int **)(a2 + 56), (void *)v9, v9) & 1) == 0)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }

    ++*(void *)(a1 + 48);
  }

  return v8 != 0;
}

uint64_t _catalog_procinfo_uuidinfo_remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1895F89C0];
  v10[0] = a3;
  uint64_t v3 = *(void *)(a2 + 56);
  if (*(void *)(v3 + 16))
  {
    v5 = (void *)(*(void *)(v3 + 16)
                  + 8LL
    uint64_t v6 = (unsigned int (*)(void, void *))hashkey_compare_array[*(unsigned __int8 *)(v3 + 8)];
    while (1)
    {
      uint64_t v7 = v5;
      v5 = (void *)*v5;
      if (!v5) {
        break;
      }
      if (v6(v5[1], v10))
      {
        *uint64_t v7 = *v5;
        uint64_t v8 = (void *)v5[2];
        free(v5);
        --*(_DWORD *)(v3 + 4);
        if (!v8) {
          return 0LL;
        }
        --*(void *)(a1 + 48);
        free(v8);
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t _catalog_procinfo_lookup_pc(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 0LL;
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2000000000LL;
  v6[3] = -1LL;
  uint64_t v2 = *(unsigned int **)(a1 + 56);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = ___catalog_procinfo_lookup_pc_block_invoke;
  v5[3] = &unk_189F0DED8;
  v5[5] = &v7;
  v5[6] = a2;
  v5[4] = v6;
  hashtable_iterate(v2, (uint64_t)v5);
  uint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *___catalog_procinfo_lookup_pc_block_invoke(void *result, uint64_t a2, void *a3)
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

uint64_t _catalog_procinfo_lookup_subsystem(uint64_t a1, __int16 a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  __int16 v3 = a2;
  return hashtable_lookup(*(void *)(a1 + 64), (uint64_t)&v3);
}

uint64_t _catalog_lookup_procinfo_by_procid(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    __int16 v3 = (void *)(v2 + 16);
    while (1)
    {
      __int16 v3 = (void *)*v3;
      if (!v3) {
        break;
      }
      if (v3[2] == a2) {
        return v3[4];
      }
    }
  }

  return 0LL;
}

void *_catalog_lookup_procinfo_by_procinfo_key(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _os_procinfo_map_lookup(*(void **)(a1 + 40), a2, a3);
}

uint64_t _catalog_procinfo_create(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void **)(a1 + 40);
  uint64_t v5 = _os_procinfo_map_lookup(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5) {
    return (uint64_t)v5;
  }
  uint64_t v6 = _os_trace_calloc();
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
    LOWORD(v10) = v10[12];
  }
  *(_WORD *)uint64_t v6 = (_WORD)v10;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 24);
  }
  else {
    uint64_t v12 = 0LL;
  }
  _os_trace_uuid_map_insert((float *)v11, v5 + 3, v12);
  if (!uuid_is_null((const unsigned __int8 *)v5 + 40))
  {
    uint64_t v13 = *(void *)(a1 + 16);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 24);
    }
    else {
      uint64_t v14 = 0LL;
    }
    _os_trace_uuid_map_insert((float *)v13, v5 + 5, v14);
  }

  uint64_t v15 = _os_trace_calloc();
  *(void *)uint64_t v15 = 16LL;
  *(_BYTE *)(v15 + 8) = 2;
  *(void *)(v15 + 16) = _os_trace_calloc();
  void v5[7] = v15;
  uint64_t v16 = _os_trace_calloc();
  *(void *)uint64_t v16 = 16LL;
  *(_BYTE *)(v16 + 8) = 1;
  *(void *)(v16 + 16) = _os_trace_calloc();
  v5[8] = v16;
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t ___catalog_for_each_procinfo_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *_catalog_subchunk_entry_alloc(uint64_t a1)
{
  uint64_t v2 = (void *)_os_trace_calloc();
  v2[2] = -1LL;
  uint64_t v3 = _os_trace_calloc();
  *(void *)uint64_t v3 = 16LL;
  *(_BYTE *)(v3 + 8) = 1;
  *(void *)(v3 + 16) = _os_trace_calloc();
  v2[6] = v3;
  uint64_t v4 = _os_trace_calloc();
  *(void *)uint64_t v4 = 16LL;
  *(_BYTE *)(v4 + 8) = 1;
  *(void *)(v4 + 16) = _os_trace_calloc();
  v2[5] = v4;
  uint64_t v5 = *(void **)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  *uint64_t v2 = 0LL;
  v2[1] = v5;
  void *v5 = v2;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v6 + 1;
  return v2;
}

void *_catalog_subchunk_update_times(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t result = **(void ***)(*(void *)(a1 + 72) + 8LL);
  }
  else {
    uint64_t result = _catalog_subchunk_entry_alloc(a1);
  }
  if (result[2] > a2) {
    result[2] = a2;
  }
  if (result[3] < a2) {
    result[3] = a2;
  }
  return result;
}

uint64_t _catalog_subchunk_procinfo_add(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t v4 = **(void ***)(*(void *)(a1 + 72) + 8LL);
  }
  else {
    uint64_t v4 = _catalog_subchunk_entry_alloc(a1);
  }
  if (_os_procinfo_map_lookup(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16))) {
    return hashtable_insert((int *)v4[6], (void *)a2, 0LL);
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t catalog_subchunk_string_insert(uint64_t a1, __int16 a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  __int16 v4 = a2;
  if (*(void *)(a1 + 80)) {
    uint64_t v2 = **(void ***)(*(void *)(a1 + 72) + 8LL);
  }
  else {
    uint64_t v2 = _catalog_subchunk_entry_alloc(a1);
  }
  return hashtable_insert((int *)v2[5], &v4, 0LL);
}

BOOL catalog_chunk_parse_entries( unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
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

BOOL catalog_chunk_parse_section(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  __int16 v4 = (unint64_t *)*a1;
  if ((!a2 || (a2 >= (unint64_t)v4 ? (BOOL v5 = a2 - (unint64_t)v4 >= 8) : (BOOL v5 = 0), v5))
    && (*a1 = (unint64_t)(v4 + 1), v4))
  {
    return catalog_chunk_parse_entries(a1, a2, a3, *v4, a4);
  }

  else
  {
    return 0LL;
  }
}

void *_catalog_create()
{
  v0 = (void *)_os_trace_calloc();
  v0[8] = 0LL;
  v0[9] = v0 + 8;
  v0[1] = -1LL;
  v1 = operator new(0x28uLL);
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  *((_DWORD *)v1 + 8) = 1065353216;
  v0[2] = v1;
  return v0;
}

void _catalog_procinfo_free(unsigned int **a1)
{
  uint64_t v2 = (void (*)(void))MEMORY[0x1895FB398];
  hashtable_destroy(a1[7], (void (*)(void))MEMORY[0x1895FB398]);
  hashtable_destroy(a1[8], v2);
  free(a1);
}

void _catalog_destroy(uint64_t a1)
{
  *(void *)(a1 + 32) = 0LL;
  _os_procinfo_map_clear(*(void **)(a1 + 40), (uint64_t (*)(void))_catalog_procinfo_free);
  uint64_t v2 = *(unsigned int ***)(a1 + 64);
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  if (v2)
  {
    do
    {
      uint64_t v3 = *v2;
      hashtable_destroy(v2[6], 0LL);
      hashtable_destroy(v2[5], 0LL);
      free(v2);
      uint64_t v2 = (unsigned int **)v3;
    }

    while (v3);
  }

  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 8) = -1LL;
  _os_trace_uuid_map_destroy(*(void ***)(a1 + 16));
  _os_trace_str_map_destroy(*(void ****)(a1 + 24));
  __int16 v4 = *(void ***)(a1 + 40);
  _os_procinfo_map_clear(v4, 0LL);
  if (v4)
  {
    BOOL v5 = v4[2];
    if (v5)
    {
      do
      {
        uint64_t v6 = (void *)*v5;
        operator delete(v5);
        BOOL v5 = v6;
      }

      while (v6);
    }

    __int128 v7 = *v4;
    *__int16 v4 = 0LL;
    if (v7) {
      operator delete(v7);
    }
    operator delete(v4);
  }

  free((void *)a1);
}

uint64_t _catalog_update_earliest_fhbuf_ts(uint64_t result, unint64_t a2)
{
  if (*(void *)(result + 8) > a2) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t _catalog_create_with_chunk(uint64_t a1, int a2)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)a1 != 24587)
  {
    if (a2) {
      puts("Error: Incorrect catalog chunk preamble tag");
    }
    return 0LL;
  }

  uint64_t v4 = _os_trace_calloc();
  *(void *)(v4 + 64) = 0LL;
  *(void *)(v4 + 72) = v4 + 64;
  *(void *)(v4 + 8) = -1LL;
  BOOL v5 = operator new(0x28uLL);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  *((_DWORD *)v5 + 8) = 1065353216;
  *(void *)(v4 + 16) = v5;
  v36 = 0LL;
  int v6 = *(_DWORD *)a1;
  if (*(int *)a1 > 7679)
  {
    switch(v6)
    {
      case 24577:
      case 24578:
      case 24579:
      case 24580:
        if (!*(_DWORD *)(a1 + 4)) {
          goto LABEL_19;
        }
        goto LABEL_35;
      case 24581:
      case 24582:
      case 24583:
      case 24584:
      case 24585:
      case 24586:
      case 24590:
      case 24591:
        goto LABEL_35;
      case 24587:
      case 24588:
      case 24592:
        goto LABEL_19;
      case 24589:
        goto LABEL_19;
      default:
        if (v6 == 7680 || v6 == 0x2000) {
          goto LABEL_19;
        }
        goto LABEL_35;
    }
  }

  if (v6 > 7167)
  {
    if (v6 == 7168) {
      goto LABEL_19;
    }
    int v7 = 7424;
  }

  else
  {
    if (v6 == 4096) {
      goto LABEL_19;
    }
    int v7 = 6912;
  }

  if (v6 != v7)
  {
LABEL_35:
    if (a2) {
      printf("Invalid catalog subtag");
    }
    goto LABEL_37;
  }

LABEL_19:
  int v8 = *(_DWORD *)(a1 + 4);
  if (v8 != 17)
  {
    *(_WORD *)uint64_t v4 = v8;
    *(void *)(v4 + 8) = -1LL;
    uint64_t v9 = a1 + 24;
    v36 = (char *)(a1 + 24);
    uint64_t v10 = *(unsigned __int16 *)(a1 + 16);
    unsigned int v13 = *(unsigned __int16 *)(a1 + 18);
    if (v10 < v13)
    {
      unsigned int v14 = *(unsigned __int16 *)(a1 + 20);
      if (v13 < v14)
      {
        unint64_t v15 = *(unsigned __int16 *)(a1 + 22);
        if (v14 < v15 && *(void *)(a1 + 8) > v15)
        {
          if ((a2 & 1) == 0)
          {
            char v16 = 0;
            goto LABEL_44;
          }

          printf("\n----- %-30s -----\n", "CATALOG_V2 Metadata");
          printf("%-30s : %hu\n", "Subsystem Offset", *(unsigned __int16 *)(a1 + 16));
          printf("%-30s : %hu\n", "Activity ID Offset", *(unsigned __int16 *)(a1 + 18));
          printf("%-30s : %hu\n", "Procinfo Offset", *(unsigned __int16 *)(a1 + 20));
          printf("%-30s : %hu\n");
          goto LABEL_31;
        }
      }
    }

  unsigned int v11 = *(void **)(a1 + 384);
  if (v11)
  {

    *(void *)(a1 + 384) = 0LL;
  }

  unint64_t v12 = *(void **)(a1 + 392);
  if (v12)
  {

    *(void *)(a1 + 392) = 0LL;
  }

  if (*(void *)(a1 + 48)) {
    *(void *)(a1 + 384) = (id)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  if (*(void *)(a1 + 120)) {
    *(void *)(a1 + 392) = (id)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  *(void *)(a1 + 336) |= 2uLL;
}

    uint64_t v9 = 0LL;
    goto LABEL_27;
  }

  if (xpc_dictionary_get_uint64(v7, "errorcode") == 1)
  {
    if (a3)
    {
      _OSLogError(14LL);
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      uint64_t v9 = 0LL;
      *a3 = v8;
LABEL_27:

      goto LABEL_28;
    }

    goto LABEL_19;
  }

  v17 = xpc_dictionary_dup_fd(v7, "persistdir_fd");
  v18 = xpc_dictionary_get_string(v7, "persistdir_sbext");
  if ((_DWORD)v17 == -1) {
    goto LABEL_19;
  }
  uint64_t v19 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:sandboxExtensionToken:",  v17,  v18);
  if (close(v17) == -1)
  {
    uint64_t v29 = *__error();
    uint64_t result = (id)*__error();
    if (v29 == 9)
    {
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = (uint64_t)result;
      __break(1u);
      goto LABEL_32;
    }

    _os_assumes_log();
  }

  v20 = xpc_dictionary_dup_fd(v7, "timesyncdir_fd");
  unsigned __int16 v21 = xpc_dictionary_get_string(v7, "timesyncdir_sbext");
  if ((_DWORD)v20 == -1)
  {
    size_t v22 = 0LL;
    goto LABEL_21;
  }

  size_t v22 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:sandboxExtensionToken:",  v20,  v21);
  if (close(v20) == -1)
  {
    BOOL v23 = *__error();
    uint64_t result = (id)*__error();
    if (v23 != 9)
    {
      _os_assumes_log();
      goto LABEL_21;
    }

LABEL_33:
    if (a2) {
      puts("Error: Incorrect section offsets");
    }
    goto LABEL_37;
  }

  *(_WORD *)uint64_t v4 = 17;
  *(void *)(v4 + 8) = *(void *)(a1 + 32);
  uint64_t v9 = a1 + 40;
  v36 = (char *)(a1 + 40);
  uint64_t v10 = *(unsigned __int16 *)(a1 + 16);
  unsigned int v11 = *(unsigned __int16 *)(a1 + 18);
  unint64_t v12 = *(unsigned __int16 *)(a1 + 22);
  if ((a2 & 1) == 0)
  {
    char v16 = 0;
    goto LABEL_41;
  }

  printf("\n----- %-30s -----\n", "CATALOG_V3 Metadata");
  printf("%-30s : %hu\n", "Subsystem Offset", *(unsigned __int16 *)(a1 + 16));
  printf("%-30s : %hu\n", "Procinfo Offset", *(unsigned __int16 *)(a1 + 18));
  printf("%-30s : %hu\n", "Procinfo Count", *(unsigned __int16 *)(a1 + 20));
  printf("%-30s : %hu\n", "Subchunk Offset", *(unsigned __int16 *)(a1 + 22));
  printf("%-30s : %hu\n", "Subchunk Count", *(unsigned __int16 *)(a1 + 24));
  printf("%-30s : %llu\n");
LABEL_31:
  printf("\n----- %-30s -----\n", "Catalog UUID Section");
  uint64_t v10 = *(unsigned __int16 *)(a1 + 16);
  char v16 = 1;
  if (*(_DWORD *)(a1 + 4) != 17)
  {
LABEL_44:
    v18 = (char *)(a1 + v10 + 24);
    uint64_t v37 = MEMORY[0x1895F87A8];
    uint64_t v38 = 0x40000000LL;
    v39 = __catalog_chunk_parse_uuid_legacy_block_invoke;
    v40 = &__block_descriptor_tmp_34;
    uint64_t v41 = v4;
    LOBYTE(v42) = v16;
    goto LABEL_45;
  }

  _os_assumes_log();
  if (v8) {
    goto LABEL_37;
  }
LABEL_38:
  if (close(v6) != -1) {
    return;
  }
  unint64_t v28 = *__error();
  uint64_t v29 = *__error();
  if (v28 != 9) {
    goto LABEL_40;
  }
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v29;
  __break(1u);
}

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = (uint64_t)result;
  __break(1u);
  return result;
}

      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_34:
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_35:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_36;
    }

    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_33;
  }

  if (!xpc_array_get_count(*(xpc_object_t *)(a1 + 40)))
  {
    if (xpc_array_get_count(*(xpc_object_t *)(a1 + 48)))
    {
      if (a2)
      {
LABEL_39:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_40;
      }

      if (*(_BYTE *)(a1 + 84))
      {
LABEL_40:
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_41;
      }

      unint64_t v24 = *(id *)(a1 + 48);
      if (!xpc_array_get_count(v24))
      {
LABEL_41:
        _os_assert_log();
        _os_crash();
        __break(1u);
        return;
      }

      unint64_t v25 = -[_OSLogStreamFilter initWithPredicate:]( objc_alloc(&OBJC_CLASS____OSLogStreamFilter),  "initWithPredicate:",  0LL);
      applier = v7;
      v35 = 3221225472LL;
      v36 = ___OSLogStreamFilterBytesForUIDArray_block_invoke;
      uint64_t v37 = &unk_189F0F458;
      uint64_t v38 = v25;
      unint64_t v26 = v25;
      xpc_array_apply(v24, &applier);
      v27 = -[_OSLogStreamFilter data](v26, "data");
      [v27 length];
      v18 = (void *)_os_trace_malloc();
      objc_msgSend(v27, "getBytes:length:", v18, objc_msgSend(v27, "length"));
      a3 = [v27 length];

      v17 = 0LL;
      uint64_t v19 = 0LL;
      a2 = v18;
      if (!v18) {
        goto LABEL_26;
      }
    }

    else
    {
      v17 = 0LL;
      v18 = 0LL;
      uint64_t v19 = 0LL;
      if (!a2) {
        goto LABEL_26;
      }
    }

    goto LABEL_24;
  }

  if (a2) {
    goto LABEL_35;
  }
  if (*(_BYTE *)(a1 + 84))
  {
LABEL_36:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_37;
  }

  v20 = *(id *)(a1 + 40);
  if (!xpc_array_get_count(v20))
  {
LABEL_37:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_38:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_39;
  }

  unsigned __int16 v21 = -[_OSLogStreamFilter initWithPredicate:]( objc_alloc(&OBJC_CLASS____OSLogStreamFilter),  "initWithPredicate:",  0LL);
  applier = v7;
  v35 = 3221225472LL;
  v36 = ___OSLogStreamFilterBytesForPIDArray_block_invoke;
  uint64_t v37 = &unk_189F0F458;
  uint64_t v38 = v21;
  size_t v22 = v21;
  xpc_array_apply(v20, &applier);
  -[_OSLogStreamFilter data](v22, "data");
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 length];
  uint64_t v19 = (void *)_os_trace_malloc();
  objc_msgSend(v23, "getBytes:length:", v19, objc_msgSend(v23, "length"));
  a3 = [v23 length];

  v17 = 0LL;
  v18 = 0LL;
  a2 = v19;
  if (!v19)
  {
LABEL_26:
    if (*(_BYTE *)(a1 + 84)) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }

    free(v5);
  }

LABEL_41:
  v18 = (char *)(a1 + v10 + 40);
  uint64_t v37 = MEMORY[0x1895F87A8];
  uint64_t v38 = 0x40000000LL;
  v39 = __catalog_chunk_parse_uuid_v2_block_invoke;
  v40 = &__block_descriptor_tmp_32;
  uint64_t v41 = v4;
  LOBYTE(v42) = v16;
  if (!catalog_chunk_parse_entries( (unint64_t *)&v36,  (unint64_t)v18,  0x10uLL,  (unint64_t)&v18[-v9] >> 4,  (uint64_t)&v37)) {
    goto LABEL_37;
  }
LABEL_45:
  if (v36 != v18) {
    goto LABEL_37;
  }
  if (a2)
  {
    printf("\n----- %-30s -----\n", "Catalog Subsystems Section");
    v18 = v36;
  }

  uint64_t v19 = a1 + *(unsigned __int16 *)(a1 + 18);
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    v20 = (char *)(v19 + 40);
    if ((unint64_t)v18 < v19 + 40)
    {
      unsigned __int16 v21 = 0;
      do
      {
        size_t v22 = strlen(v18) + 1;
        if (_os_trace_str_map_insert((void **)(v4 + 24), v18, *(void *)(v4 + 32)))
        {
          if (a2) {
            printf("[%03u] [Offset: %6llu] %-30s\n", v21, *(void *)(v4 + 32), v36);
          }
          *(void *)(v4 + 32) += v22;
          ++v21;
        }

        v18 = &v36[v22];
        v36 = v18;
      }

      while (v18 < v20);
    }
  }

  else
  {
    v20 = (char *)(v19 + 24);
    BOOL v23 = v19 + 24 >= (unint64_t)v18;
    unint64_t v24 = v19 + 24 - (void)v18;
    if (!v23) {
      goto LABEL_37;
    }
    if (v24 < 8) {
      goto LABEL_37;
    }
    v36 = v18 + 8;
    if (!v18) {
      goto LABEL_37;
    }
    if (*(void *)v18)
    {
      unint64_t v25 = 0LL;
      v35 = (void **)(v4 + 24);
      unint64_t v26 = (unint64_t)(v18 + 8);
      char v34 = v16;
      while ((unint64_t)v20 >= v26)
      {
        v27 = (const char *)(v26 + 2);
        v36 = (char *)(v26 + 2);
        if (!v26) {
          break;
        }
        if (v20 < v27) {
          break;
        }
        unint64_t v28 = *(unsigned __int8 *)(v26 + 1) + (unint64_t)*(unsigned __int8 *)v26;
        if (v20 - v27 < v28) {
          break;
        }
        v36 = (char *)&v27[v28];
        if (a2) {
          printf( "[%03u] [Offset: %6llu] Subsystem: %-30s Category: %-30s\n",  (unsigned __int16)v25,  v26 - (void)(v18 + 8) + 2,  (const char *)(v26 + 2),  (const char *)(v26 + *(unsigned __int8 *)v26 + 2));
        }
        _os_trace_str_map_insert(v35, (char *)(v26 + 2), *(void *)(v4 + 32));
        catalog_subchunk_string_insert(v4, *(_WORD *)(v4 + 32));
        uint64_t v29 = *(void *)(v4 + 32) + *(unsigned __int8 *)v26;
        *(void *)(v4 + 32) = v29;
        _os_trace_str_map_insert(v35, (char *)(v26 + *(unsigned __int8 *)v26 + 2), v29);
        catalog_subchunk_string_insert(v4, *(_WORD *)(v4 + 32));
        *(void *)(v4 + 32) += *(unsigned __int8 *)(v26 + 1);
        unint64_t v26 = (unint64_t)&v36[v28 & 1];
        v36 = (char *)v26;
        ++v25;
        char v16 = v34;
        if (v25 >= *(void *)v18) {
          goto LABEL_73;
        }
      }

      goto LABEL_37;
    }

    unint64_t v26 = (unint64_t)(v18 + 8);
LABEL_73:
    if ((v26 & 7) != 0) {
      v18 = (char *)((v26 & 0xFFFFFFFFFFFFFFF8LL) + 8);
    }
    else {
      v18 = (char *)v26;
    }
    v36 = v18;
  }

  if (v18 != v20) {
    goto LABEL_37;
  }
  if (*(_DWORD *)(a1 + 4) != 17)
  {
    if (a2) {
      printf("\n----- %-30s -----\n", "Catalog Activites Section");
    }
    v30 = (const char *)(a1 + *(unsigned __int16 *)(a1 + 20) + 24);
    if (!catalog_chunk_parse_section( (unint64_t *)&v36,  (unint64_t)v30,  8uLL,  (uint64_t)&__block_literal_global)
      || v36 != v30)
    {
      goto LABEL_37;
    }
  }

  if (a2) {
    printf("\n----- %-30s -----\n", "Catalog Procinfo Section");
  }
  uint64_t v31 = a1 + *(unsigned __int16 *)(a1 + 22);
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    v32 = (const char *)(v31 + 40);
    unint64_t v33 = *(unsigned __int16 *)(a1 + 20);
    uint64_t v37 = MEMORY[0x1895F87A8];
    uint64_t v38 = 0x40000000LL;
    v39 = __catalog_chunk_parse_procinfo_v2_block_invoke;
    v40 = &__block_descriptor_tmp_50;
    uint64_t v41 = v4;
    uint64_t v42 = a1;
    char v44 = v16;
    uint64_t v43 = v31 + 40;
LABEL_37:
    _catalog_destroy(v4);
    return 0LL;
  }

  v32 = (const char *)(v31 + 24);
  uint64_t v37 = MEMORY[0x1895F87A8];
  uint64_t v38 = 0x40000000LL;
  v39 = __catalog_chunk_parse_procinfo_legacy_block_invoke;
  v40 = &__block_descriptor_tmp_65;
  uint64_t v41 = v4;
  uint64_t v42 = a1;
  char v44 = v16;
  uint64_t v43 = v31 + 24;
LABEL_89:
  return v4;
}

            if ((v9 & 0x1F) != 0)
            {
              if ((self->_cur_attrs & 0x1F) == 0x10)
              {
                if ((self->_ob.ob_flags & 2) == 0)
                {
                  v32 = self->_ob.ob_len;
                  if ((self->_ob.ob_binary + self->_ob.ob_size - v32 - 1) <= 2)
                  {
                    os_trace_blob_add_slow((uint64_t)p_ob, "49;", 3uLL);
                  }

                  else
                  {
                    unint64_t v33 = &self->_ob.var0.ob_b[v32];
                    v33[2] = 59;
                    *(_WORD *)unint64_t v33 = 14644;
                    char v34 = self->_ob.ob_len + 3;
                    self->_ob.ob_len = v34;
                    if (!self->_ob.ob_binary) {
                      p_ob->var0.ob_b[v34] = 0;
                    }
                  }
                }
              }

              else
              {
                os_trace_blob_addf((uint64_t)p_ob, "48;5;%d;", v2, v3, v4, v5, v6, v7, self->_cur_attrs & 0x1F);
              }
            }

            if ((v9 & 0x1F00) != 0)
            {
              if ((HIBYTE(self->_cur_attrs) & 0x1F) == 0x10)
              {
                if ((self->_ob.ob_flags & 2) == 0)
                {
                  v35 = self->_ob.ob_len;
                  if ((self->_ob.ob_binary + self->_ob.ob_size - v35 - 1) <= 2)
                  {
                    os_trace_blob_add_slow((uint64_t)p_ob, "39;", 3uLL);
                  }

                  else
                  {
                    v36 = &self->_ob.var0.ob_b[v35];
                    v36[2] = 59;
                    *(_WORD *)v36 = 14643;
                    uint64_t v37 = self->_ob.ob_len + 3;
                    self->_ob.ob_len = v37;
                    if (!self->_ob.ob_binary) {
                      p_ob->var0.ob_b[v37] = 0;
                    }
                  }
                }
              }

              else
              {
                os_trace_blob_addf((uint64_t)p_ob, "38;5;%d;", v2, v3, v4, v5, v6, v7, HIBYTE(self->_cur_attrs) & 0x1F);
              }
            }

            self->_ob.var0.ob_b[self->_ob.ob_len - 1] = 109;
            goto LABEL_56;
          }

          uint64_t v38 = "1;";
          v39 = (uint64_t)p_ob;
          v40 = 2LL;
        }

        else
        {
          if ((v17 & 2) != 0) {
            goto LABEL_21;
          }
          v18 = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - v18 - 1) > 2)
          {
            uint64_t v19 = &self->_ob.var0.ob_b[v18];
            v19[2] = 59;
            *(_WORD *)uint64_t v19 = 12850;
            v20 = self->_ob.ob_len + 3;
            goto LABEL_19;
          }

          uint64_t v38 = "22;";
          v39 = (uint64_t)p_ob;
          v40 = 3LL;
        }

        os_trace_blob_add_slow(v39, v38, v40);
        goto LABEL_21;
      }

      *(_WORD *)&self->_ob.var0.ob_b[v15] = 23323;
      char v16 = self->_ob.ob_len + 2;
      self->_ob.ob_len = v16;
      if (!self->_ob.ob_binary) {
        p_ob->var0.ob_b[v16] = 0;
      }
    }

    if ((v9 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }

    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_42;
  }

  int v6 = v38;
  if (v38 <= a5)
  {
    if (v38)
    {
      int v7 = 0LL;
      v18 = MEMORY[0x1895F8770];
      while (1)
      {
        uint64_t v19 = *(char *)(a4 + v7);
        if (!*(_BYTE *)(a4 + v7)) {
          break;
        }
        if ((v19 & 0x80000000) != 0) {
          v20 = __maskrune(v19, 0x40000uLL);
        }
        else {
          v20 = *(_DWORD *)(v18 + 4LL * v19 + 60) & 0x40000;
        }
        ++v7;
        if (v20) {
          unsigned __int16 v21 = v7 >= v6;
        }
        else {
          unsigned __int16 v21 = 1;
        }
        if (v21) {
          goto LABEL_17;
        }
      }

      os_trace_blob_addf(a3, "%.*s", v12, v13, v14, v15, v16, v17, v6);
      return 1LL;
    }

    goto LABEL_17;
  }

  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

  int v6 = 0LL;
LABEL_43:

  int v7 = 0x189607000uLL;
  if (v6)
  {
LABEL_44:
    v413 = v6;
    [*(id *)(v7 + 2504) predicateWithFormat:v6 argumentArray:MEMORY[0x189604A58]];
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    if (v386) {
      BYTE8(v422) = 1;
    }
  }

  else
  {
    v413 = 0LL;
    v415 = 0LL;
  }

  v60 = v382;
  OSLogLogdAdminConnection();
  v67 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v68, "operation", 0xAuLL);
    xpc_connection_send_message(v67, v68);
  }

  else
  {
    _OSLogWarningMessage(v60, "Coprocessors flush failed: no connection to logd", v61, v62, v63, v64, v65, v66, v377);
  }

  v69 = operator new(0x28uLL);
  *v69 = 0u;
  v69[1] = 0u;
  *((_DWORD *)v69 + 8) = 1065353216;
  v417 = v60;
  v70 = v378;
  [v70 objectForKeyedSubscript:OSLogConstructPersistSizeLimit];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (v71) {
    v73 = [v71 unsignedLongLongValue];
  }
  else {
    v73 = -1LL;
  }
  *(void *)&v427 = v73;

  [v70 objectForKeyedSubscript:OSLogConstructSpecialSizeLimit];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74) {
    v76 = [v74 unsignedLongLongValue];
  }
  else {
    v76 = -1LL;
  }
  *((void *)&v428 + 1) = v76;

  [v70 objectForKeyedSubscript:OSLogConstructSignpostSizeLimit];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v77) {
    v79 = [v77 unsignedLongLongValue];
  }
  else {
    v79 = -1LL;
  }
  *(void *)&v430 = v79;

  [v70 objectForKeyedSubscript:OSLogConstructHighVolumeSizeLimit];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v80) {
    v82 = [v80 unsignedLongLongValue];
  }
  else {
    v82 = -1LL;
  }
  *((void *)&v431 + 1) = v82;

  [v70 objectForKeyedSubscript:OSLogConstructPersistAgeLimit];
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    [v70 objectForKeyedSubscript:OSLogConstructPersistAgeLimit];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v410 = 1000000000 * [v84 unsignedLongLongValue];
    *((void *)&v427 + 1) = v410;
  }

  else
  {
    [v70 objectForKeyedSubscript:_OSLogConstructPersistStart];
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v85)
    {
      v107 = "Required key missing from options dictionary: OSLogConstructPersistAgeLimit";
LABEL_124:
      _OSLogWarningMessage(v417, v107, v86, v87, v88, v89, v90, v91, v377);
      *__error() = 22;

      v152 = 0LL;
      v125 = 0LL;
      v153 = 0xFFFFFFFFLL;
      goto LABEL_186;
    }

    [v70 objectForKeyedSubscript:_OSLogConstructPersistStart];
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v410 = 1000000000 * [v92 unsignedLongLongValue];
    *((void *)&v427 + 1) = v410;

    LODWORD(v428) = 1;
  }

  [v70 objectForKeyedSubscript:OSLogConstructSpecialAgeLimit];
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    [v70 objectForKeyedSubscript:OSLogConstructSpecialAgeLimit];
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v407 = 1000000000 * [v94 unsignedLongLongValue];
    *(void *)&v429 = v407;

    goto LABEL_70;
  }

  [v70 objectForKeyedSubscript:_OSLogConstructSpecialStart];
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v95)
  {
    v107 = "Required key missing from options dictionary: OSLogConstructSpecialAgeLimit";
    goto LABEL_124;
  }

  [v70 objectForKeyedSubscript:_OSLogConstructSpecialStart];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v407 = 1000000000 * [v96 unsignedLongLongValue];
  *(void *)&v429 = v407;

  DWORD2(v429) = 1;
LABEL_70:
  [v70 objectForKeyedSubscript:OSLogConstructSignpostAgeLimit];
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    [v70 objectForKeyedSubscript:OSLogConstructSignpostAgeLimit];
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v404 = 1000000000 * [v98 unsignedLongLongValue];
    *((void *)&v430 + 1) = v404;
  }

  else
  {
    [v70 objectForKeyedSubscript:_OSLogConstructSignpostStart];
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      [v70 objectForKeyedSubscript:_OSLogConstructSignpostStart];
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v404 = 1000000000 * [v106 unsignedLongLongValue];
      *((void *)&v430 + 1) = v404;

      LODWORD(v431) = 1;
    }

    else
    {
      _OSLogWarningMessage( v417,  "Expected key missing from options dictionary: OSLogConstructSignpostAgeLimit (using value of Persist option instead)",  v100,  v101,  v102,  v103,  v104,  v105,  v377);
      *((void *)&v430 + 1) = v410;
      LODWORD(v431) = v428;
      v404 = v410;
    }
  }

  [v70 objectForKeyedSubscript:OSLogConstructHighVolumeAgeLimit];
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    [v70 objectForKeyedSubscript:OSLogConstructHighVolumeAgeLimit];
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v401 = 1000000000 * [v109 unsignedLongLongValue];
    *(void *)&v432 = v401;

    goto LABEL_81;
  }

  [v70 objectForKeyedSubscript:_OSLogConstructHighVolumeStart];
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v110)
  {
    v107 = "Required key missing from options dictionary: OSLogConstructHighVolumeAgeLimit";
    goto LABEL_124;
  }

  [v70 objectForKeyedSubscript:_OSLogConstructHighVolumeStart];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v401 = 1000000000 * [v111 unsignedLongLongValue];
  *(void *)&v432 = v401;

  DWORD2(v432) = 1;
LABEL_81:

  v112 = (os_log_s *)MEMORY[0x1895F8DA0];
  v113 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Generating archive with the following parameters:",  (uint8_t *)buf,  2u);
  }

  v114 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v73;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Persist size limit: %lld bytes",  (uint8_t *)buf,  0xCu);
  }

  v115 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v410 / 0x3B9ACA00;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Persist age limit: %lld seconds",  (uint8_t *)buf,  0xCu);
  }

  v116 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v76;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Special size limit: %lld bytes",  (uint8_t *)buf,  0xCu);
  }

  v117 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v407 / 0x3B9ACA00;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Special age limit: %lld seconds",  (uint8_t *)buf,  0xCu);
  }

  v118 = v112;
  if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v79;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Signpost size limit: %lld bytes",  (uint8_t *)buf,  0xCu);
  }

  v119 = (os_log_s *)MEMORY[0x1895F8DA0];
  v120 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v404 / 0x3B9ACA00;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Signpost age limit: %lld seconds",  (uint8_t *)buf,  0xCu);
  }

  v121 = v119;
  if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v82;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "HighVolume size limit: %lld bytes",  (uint8_t *)buf,  0xCu);
  }

  v122 = (os_log_s *)MEMORY[0x1895F8DA0];
  v123 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = v401 / 0x3B9ACA00;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "HighVolume limit: %lld seconds",  (uint8_t *)buf,  0xCu);
  }

  v124 = v417;
  if (geteuid())
  {
    *(void *)&buf[0] = 0LL;
    +[_OSLogCollectionReference localDBRefWithError:]( &OBJC_CLASS____OSLogCollectionReference,  "localDBRefWithError:",  buf);
    v125 = (_OSLogCollectionReference *)objc_claimAutoreleasedReturnValue();
    v126 = (_OSLogDirectoryReference *)*(id *)&buf[0];
    v133 = v126;
    if (v125)
    {
LABEL_127:

      goto LABEL_138;
    }

    if (!v126)
    {
      _OSLogWarningMessage(v124, "unable to get local database reference", v127, v128, v129, v130, v131, v132, v377);
      v133 = 0LL;
      v125 = 0LL;
      goto LABEL_127;
    }

    -[_OSLogDirectoryReference localizedDescription](v126, "localizedDescription");
    v134 = (_OSLogDirectoryReference *) objc_claimAutoreleasedReturnValue();
    v135 = -[_OSLogDirectoryReference UTF8String](v134, "UTF8String");
    _OSLogWarningMessage( v124,  "unable to get local database reference due to %s",  v136,  v137,  v138,  v139,  v140,  v141,  v135);
    v125 = 0LL;
LABEL_122:

    goto LABEL_127;
  }

  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  v142 = _os_trace_persist_path;
  v143 = open((const char *)_os_trace_persist_path, 0);
  if ((_DWORD)v143 == -1)
  {
    v154 = __error();
    strerror(*v154);
    __error();
    _OSLogWarningMessage(v124, "failed to open: %s: %s (%d)", v155, v156, v157, v158, v159, v160, v142);
    goto LABEL_137;
  }

  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  v144 = _os_trace_timesync_path;
  v145 = open((const char *)_os_trace_timesync_path, 0);
  if ((_DWORD)v145 != -1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    LOBYTE(v146) = _os_trace_uuidtext_path;
    v147 = open((const char *)_os_trace_uuidtext_path, 0);
    if ((_DWORD)v147 != -1)
    {
      v133 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v143);
      v134 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v145);
      v398 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v147);
      v125 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]( objc_alloc(&OBJC_CLASS____OSLogCollectionReference),  "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:",  v133,  v134,  v398);
      if (close(v143) == -1)
      {
        v148 = *__error();
        uint64_t result = *__error();
        if (v148 == 9)
        {
LABEL_250:
          qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_18C695DD0 = result;
          __break(1u);
          goto LABEL_251;
        }

        _os_assumes_log();
      }

      if (close(v145) == -1)
      {
        v150 = *__error();
        uint64_t result = *__error();
        if (v150 == 9)
        {
LABEL_251:
          qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_18C695DD0 = result;
          __break(1u);
          goto LABEL_252;
        }

        _os_assumes_log();
      }

      if (close(v147) == -1)
      {
        v151 = *__error();
        uint64_t result = *__error();
        if (v151 == 9)
        {
LABEL_252:
          qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_18C695DD0 = result;
          __break(1u);
          goto LABEL_253;
        }

        _os_assumes_log();
      }

      goto LABEL_122;
    }

    goto LABEL_131;
  }

  v161 = __error();
  LODWORD(v145) = strerror(*v161);
  __error();
  _OSLogWarningMessage(v124, "failed to open: %s: %s (%d)", v162, v163, v164, v165, v166, v167, v144);
  if (close(v143) != -1)
  {
LABEL_137:
    v125 = 0LL;
LABEL_138:
    v178 = -[_OSLogCollectionReference diagnosticsDirectoryReference](v125, "diagnosticsDirectoryReference");
    v179 = [v178 fileDescriptor];
    v180 = -[_OSLogCollectionReference timesyncReference](v125, "timesyncReference");
    v399 = [v180 fileDescriptor];
    v181 = -[_OSLogCollectionReference UUIDTextReference](v125, "UUIDTextReference");
    v394 = [v181 fileDescriptor];

    v182 = v124;
    file_at = _os_trace_read_file_at();
    if (file_at)
    {
      v184 = objc_alloc(MEMORY[0x189603F48]);
      v185 = (void *)[v184 initWithBytesNoCopy:file_at length:*(void *)&buf[0] freeWhenDone:1];
      v434[0] = 0LL;
      [MEMORY[0x1896079E8] propertyListWithData:v185 options:0 format:0 error:v434];
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = v186;
      if (v186)
      {
        v187 = v186;
      }

      else
      {
        v194 = [(id)v434[0] description];
        v195 = [v194 UTF8String];
        _OSLogWarningMessage(v182, "unable to decode version.plist: %s", v196, v197, v198, v199, v200, v201, v195);

        *__error() = 79;
      }

      if (v152)
      {
        v392 = _timesync_db_openat(v399, ".");
        if (v392)
        {
          v208 = v182;
          v390 = v381;
          v396 = v208;
          TempDirectory = _OSLogCreateTempDirectory(v208, 0x1FFu);
          v210 = TempDirectory;
          if ((_DWORD)TempDirectory == -1)
          {

            v244 = 0LL;
            v254 = 0LL;
            v411 = 0LL;
            v255 = 0LL;
            v153 = 0xFFFFFFFFLL;
            goto LABEL_244;
          }

          buf[0] = xmmword_1869D9038;
          buf[1] = unk_1869D9048;
          if (fsetxattr(TempDirectory, "com.apple.FinderInfo", buf, 0x20uLL, 0, 0) < 0)
          {
            v211 = __error();
            v212 = strerror(*v211);
            __error();
            _OSLogWarningMessage(v396, "unable to set bundle bit: %s (%d)", v213, v214, v215, v216, v217, v218, v212);
          }

          (*((void (**)(id, uint64_t, const char *))v390 + 2))(v390, v210, ".");
          if (close(v210) != -1)
          {
LABEL_151:

            v153 = OSLogStateCaptureForAllPIDs(v396);
            if ((_DWORD)v153) {
              _OSLogWarningMessage(v396, "failed to capture state data", v220, v221, v222, v223, v224, v225, v377);
            }
            v226 = tmpfile();
            if (v226)
            {
              obja = v226;
              [v70 objectForKeyedSubscript:@"_OSLogConstructSkipMemoryStores"];
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v228 = [v227 intValue] == 1;

              v229 = 2LL;
              if (!v228) {
                v229 = 3LL;
              }
              v379 = v229;
              v230 = time(0LL);
              v231 = 1000000000 * v230;
              v232 = 1000000000 * v230 - v410;
              if (1000000000 * v230 < v410) {
                v232 = 0LL;
              }
              if ((v428 & 1) != 0) {
                v233 = v410;
              }
              else {
                v233 = v232;
              }
              if ((v428 & 1) != 0) {
                v234 = v410;
              }
              else {
                v234 = 0LL;
              }
              if ((v428 & 1) != 0) {
                v235 = 1000000000 * v230;
              }
              else {
                v235 = -1LL;
              }
              keya = (char *)_timesync_range_create_impl(v392, v233, v231, 0);
              v236 = v231 - v407;
              if (v231 < v407) {
                v236 = 0LL;
              }
              if ((BYTE8(v429) & 1) != 0) {
                v237 = v407;
              }
              else {
                v237 = v236;
              }
              impl = (char *)_timesync_range_create_impl(v392, v237, v231, 0);
              v238 = v231 - v404;
              if (v231 < v404) {
                v238 = 0LL;
              }
              if ((v431 & 1) != 0) {
                v239 = v404;
              }
              else {
                v239 = v238;
              }
              v405 = (char *)_timesync_range_create_impl(v392, v239, v231, 0);
              v240 = v231 - v401;
              if (v231 < v401) {
                v240 = 0LL;
              }
              if ((BYTE8(v432) & 1) != 0) {
                v241 = v401;
              }
              else {
                v241 = v240;
              }
              v402 = (char *)_timesync_range_create_impl(v392, v241, v231, 0);
              v408 = (char *)_timesync_range_create_impl(v392, v234, v235, 0);
              v411 = +[OSLogEventProxy _make](&OBJC_CLASS___OSLogEventProxy, "_make");
              [v411 _setDoNotTrackActivites:1];
              [v411 _setIncludeSensitive:1];
              [v411 _setTimesyncDatabase:v392];
              v242 = -[_OSLogCollectionReference UUIDTextReference](v125, "UUIDTextReference");
              objc_msgSend(v411, "_setUUIDDBFileDescriptor:", objc_msgSend(v242, "fileDescriptor"));

              v243 = *(void *)(v392 + 80);
              if (v415)
              {
                v244 = -[_OSLogPredicateMapper initWithPredicate:]( objc_alloc(&OBJC_CLASS____OSLogPredicateMapper),  "initWithPredicate:",  v415);
                v245 = -[_OSLogPredicateMapper mappedPredicate](v244, "mappedPredicate");
                v246 = v245 == 0LL;

                if (v246)
                {
                  _OSLogWarningMessage( v396,  "Unable to validate mapped predicate",  v247,  v248,  v249,  v250,  v251,  v252,  v377);
                  v254 = 0LL;
                  v153 = 0xFFFFFFFFLL;
                  goto LABEL_234;
                }
                v253 = -[_OSLogPredicateMapper mappedPredicate](v244, "mappedPredicate");
                [v253 allowEvaluation];
                v254 = -[_OSLogCatalogFilter initWithPredicate:collection:]( objc_alloc(&OBJC_CLASS____OSLogCatalogFilter),  "initWithPredicate:collection:",  v253,  v125);
                v415 = v253;
              }

              else
              {
                v244 = 0LL;
                v254 = 0LL;
                v415 = 0LL;
              }

              *((void *)&v421 + 1) = v243;
              *(void *)&v422 = v69;
              *(void *)&v421 = v411;
              v264 = objc_alloc_init(MEMORY[0x189603FE0]);
              v265 = v423;
              v423 = v264;

              v266 = fileno(obja);
              if (OSLogCaptureInflightBuffersToFile(v266, v379, v396))
              {
                v267 = fileno(obja);
                v380 = v396;
                v268 = v267;
                v269 = _os_trace_mmap();
                v270 = (void *)v269;
                if (!v269)
                {
                  v286 = *__error();
                  if (fcntl(v268, 50, buf) == -1)
                  {
                    __error();
                    _os_assumes_log();
                  }

                  strerror(v286);
                  _OSLogWarningMessage( v380,  "could not mmap(): %s: %s (%d)",  v287,  v288,  v289,  v290,  v291,  v292,  (char)buf);
                  v271 = -1;
                  goto LABEL_206;
                }

                v271 = _OSLogUUIDMapAddFromFile(v269, v434[0], (uint64_t)v69, v380);
                if (munmap(v270, v434[0]) == -1)
                {
                  __error();
                  _os_assumes_log();
                }

                if (v271)
                {
                  if (fcntl(v268, 50, buf) == -1)
                  {
                    __error();
                    _os_assumes_log();
                  }

                  strerror(v271);
                  _OSLogWarningMessage( v380,  "failed to index uuids: %s: %s (%d)",  v272,  v273,  v274,  v275,  v276,  v277,  (char)buf);
LABEL_206:

                  v293 = strerror(v271);
                  _OSLogWarningMessage( v380,  "failed to index LiveData uuids: %s (%d)",  v294,  v295,  v296,  v297,  v298,  v299,  v293);
                  goto LABEL_207;
                }

                v317 = fileno(obja);
                if (fchmod(v317, 0x1A4u) == -1)
                {
                  __error();
                  _os_assumes_log();
                }

                v318 = fileno(obja);
                if (lseek(v318, 0LL, 0) == -1)
                {
                  __error();
                  _os_assumes_log();
                }

                v319 = fileno(obja);
                if ((_OSLogCopyTraceFile( v319,  (uint64_t)"logdata.LiveData.tracev3",  (void **)v408,  (uint64_t)v425,  (uint64_t)v420,  v390,  v380,  v415,  v254,  (uint64_t)&v421) & 0x8000000000000000LL) == 0) {
                  goto LABEL_207;
                }
                strerror(0);
                _OSLogWarningMessage( v380,  "copy handler failed: %s: %s (%d)",  v320,  v321,  v322,  v323,  v324,  v325,  (char)"logdata.LiveData.tracev3");
                v153 = 0LL;
              }

              else
              {
                v278 = __error();
                v279 = strerror(*v278);
                __error();
                _OSLogWarningMessage( v396,  "failed to collect LiveData: %s (%d)",  v280,  v281,  v282,  v283,  v284,  v285,  v279);
                if (*__error() == 1)
                {
LABEL_207:
                  v300 = fileno(obja);
                  v301 = _OSLogCopyBook(v179, "Persist", v427, keya, v415, v254, (uint64_t)&v421, v390, v396);
                  v153 = (uint64_t)v301;
                  if ((_DWORD)v301)
                  {
                    v302 = strerror((int)v301);
                    _OSLogWarningMessage( v396,  "copy book failed: persist: %s (%d)",  v303,  v304,  v305,  v306,  v307,  v308,  v302);
                  }

                  else
                  {
                    v309 = _OSLogCopyBook( v179,  "Special",  *((uint64_t *)&v428 + 1),  impl,  v415,  v254,  (uint64_t)&v421,  v390,  v396);
                    v153 = (uint64_t)v309;
                    if ((_DWORD)v309)
                    {
                      v310 = strerror((int)v309);
                      _OSLogWarningMessage( v396,  "copy book failed: special: %s (%d)",  v311,  v312,  v313,  v314,  v315,  v316,  v310);
                    }

                    else
                    {
                      v326 = _OSLogCopyBook(v179, "Signpost", v430, v405, v415, v254, (uint64_t)&v421, v390, v396);
                      v153 = (uint64_t)v326;
                      if ((_DWORD)v326)
                      {
                        v327 = strerror((int)v326);
                        _OSLogWarningMessage( v396,  "copy book failed: signpost: %s (%d)",  v328,  v329,  v330,  v331,  v332,  v333,  v327);
                      }

                      else
                      {
                        v334 = _OSLogCopyBook( v179,  "HighVolume",  *((uint64_t *)&v431 + 1),  v402,  v415,  v254,  (uint64_t)&v421,  v390,  v396);
                        v153 = (uint64_t)v334;
                        if ((_DWORD)v334)
                        {
                          v335 = strerror((int)v334);
                          _OSLogWarningMessage( v396,  "copy book failed: highvol: %s (%d)",  v336,  v337,  v338,  v339,  v340,  v341,  v335);
                        }

                        else
                        {
                          v342 = _OSLogCopyDirectory(v179, (uint64_t)"Extra", v390, v396, 1);
                          if (v342)
                          {
                            v343 = strerror(v342);
                            _OSLogWarningMessage( v396,  "copy extra failed: %s (%d)",  v344,  v345,  v346,  v347,  v348,  v349,  v343);
                          }

                          v350 = _OSLogCopyDirectory(v399, (uint64_t)"timesync", v390, v396, 0);
                          v153 = (uint64_t)v350;
                          if ((_DWORD)v350)
                          {
                            v351 = strerror((int)v350);
                            _OSLogWarningMessage( v396,  "copy timesync failed: %s (%d)",  v352,  v353,  v354,  v355,  v356,  v357,  v351);
                          }

                          else
                          {
                            v358 = _OSLogUUIDMapCopySet(v394, (uint64_t)v69, v390, v396);
                            v153 = v358;
                            if ((_DWORD)v358)
                            {
                              v359 = strerror(v358);
                              _OSLogWarningMessage( v396,  "copy uuiddb failed: %s (%d)",  v360,  v361,  v362,  v363,  v364,  v365,  v359);
                            }

                            else
                            {
                              if (BYTE8(v422))
                              {
                                v418 = 0LL;
                                v366 = purge_unused_uuids(v386, v423, &v418);
                                v367 = v418;
                                v368 = v367;
                                if (!v366)
                                {
                                  v369 = [v367 description];
                                  v370 = [v369 UTF8String];
                                  _OSLogWarningMessage( v396,  "Purging UUIDS failed: %s",  v371,  v372,  v373,  v374,  v375,  v376,  v370);
                                }
                              }

                              v153 = _OSLogArchiveCreateInfoPlist( v152,  (uint64_t)keya,  (uint64_t)impl,  (uint64_t)v405,  (uint64_t)v402,  (uint64_t)v408,  &v427,  v390,  v396,  v392,  (uint64_t)v415);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

uint64_t __catalog_chunk_parse_uuid_v2_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  }
  return 1LL;
}

uint64_t __catalog_chunk_parse_uuid_legacy_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  }
  return 1LL;
}

uint64_t __catalog_chunk_parse_procinfo_v2_block_invoke( uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned __int16 **a4)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (_os_procinfo_map_lookup(*(void **)(*(void *)(a1 + 32) + 40LL), *(void *)(a3 + 8), *(_DWORD *)(a3 + 16))) {
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
  uint64_t v19 = _os_trace_calloc();
  v20 = (unsigned int **)v19;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)a3;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(a3 + 20);
  *(void *)(v19 + 8) = *(void *)(a3 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(a3 + 16);
  *(_DWORD *)(v19 + 20) = *(_DWORD *)(a3 + 24);
  uint64_t v21 = *(unsigned __int16 *)(a3 + 4);
  unint64_t v22 = v18 - v14;
  if (v22 >= 16 * v21 && v22 - 16 * v21 > 0xF) {
    *(_OWORD *)(v19 + 24) = *(_OWORD *)(v14 + 16 * v21);
  }
  else {
    _os_assumes_log();
  }
  uint64_t v24 = *(unsigned __int16 *)(a3 + 6);
  if (v24 != 0xFFFF)
  {
    if (v22 >= 16 * v24 && v22 - 16 * v24 > 0xF) {
      *(_OWORD *)(v20 + 5) = *(_OWORD *)(v14 + 16 * v24);
    }
    else {
      _os_assumes_log();
    }
  }

  uint64_t v26 = _os_trace_calloc();
  *(void *)uint64_t v26 = 16LL;
  *(_BYTE *)(v26 + 8) = 2;
  *(void *)(v26 + 16) = _os_trace_calloc();
  v20[7] = (unsigned int *)v26;
  uint64_t v27 = _os_trace_calloc();
  *(void *)uint64_t v27 = 16LL;
  *(_BYTE *)(v27 + 8) = 1;
  *(void *)(v27 + 16) = _os_trace_calloc();
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

  if (catalog_chunk_parse_procinfo_uuidinfo( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  (uint64_t)v20,  v28 != 0,  *(void *)(a1 + 40))
    && catalog_chunk_parse_procinfo_subsystem( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  (uint64_t)v20,  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 40)))
  {
    if ((_os_procinfo_map_insert( (void **)(*(void *)(a1 + 32) + 40LL),  (uint64_t)v20[1],  *((_DWORD *)v20 + 4),  (uint64_t)v20) & 1) != 0) {
      return 1LL;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  _catalog_procinfo_free(v20);
  return 0LL;
}

uint64_t __catalog_chunk_parse_procinfo_legacy_block_invoke( uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
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
  uint64_t v20 = _os_trace_calloc();
  uint64_t v21 = v20;
  uint64_t v22 = *a3;
  unint64_t v23 = v19 - v15;
  if (v23 >= 16 * v22 && v23 - 16 * v22 > 0xF) {
    *(_OWORD *)(v20 + 24) = *(_OWORD *)(v15 + 16 * v22);
  }
  else {
    _os_assumes_log();
  }
  uint64_t v25 = a3[1];
  if (v23 >= 16 * v25 && v23 - 16 * v25 > 0xF) {
    *(_OWORD *)(v21 + 40) = *(_OWORD *)(v15 + 16 * v25);
  }
  else {
    _os_assumes_log();
  }
  *(_DWORD *)(v21 + 4) = *((_DWORD *)a3 + 1);
  *(void *)(v21 + 8) = *((void *)a3 + 1);
  if (a2 >= 0x10000) {
    _os_assumes_log();
  }
  *(_WORD *)uint64_t v21 = a2;
  *(_WORD *)(v21 + 2) = 0x8000;
  uint64_t v27 = _os_trace_calloc();
  *(void *)uint64_t v27 = 16LL;
  *(_BYTE *)(v27 + 8) = 2;
  *(void *)(v27 + 16) = _os_trace_calloc();
  *(void *)(v21 + 56) = v27;
  uint64_t v28 = _os_trace_calloc();
  *(void *)uint64_t v28 = 16LL;
  *(_BYTE *)(v28 + 8) = 1;
  *(void *)(v28 + 16) = _os_trace_calloc();
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

  if ((catalog_chunk_parse_procinfo_uuidinfo( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  v21,  v29 != 0,  *(void *)(a1 + 40)) & 1) != 0 && (catalog_chunk_parse_procinfo_subsystem( a4,  *(void *)(a1 + 48),  *(void *)(a1 + 32),  v21,  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 40)) & 1) != 0)
  {
    if ((_os_procinfo_map_insert( (void **)(*(void *)(a1 + 32) + 40LL),  *(void *)(v21 + 8),  *(_DWORD *)(v21 + 16),  v21) & 1) == 0) {
      _os_assumes_log();
    }
    return 1LL;
  }

  else
  {
    _catalog_procinfo_free((unsigned int **)v21);
    return 0LL;
  }

BOOL catalog_chunk_parse_subchunk(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  char v5 = a3;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v8 = *(void *)(a4 + 8) + a4 + 16;
  if (a3) {
    printf("\n----- %-30s -----\n", "Catalog Subchunk Section");
  }
  if (*(_DWORD *)(a4 + 4) == 17)
  {
    unint64_t v9 = *(unsigned __int16 *)(a4 + 24);
    uint64_t v11 = MEMORY[0x1895F87A8];
    uint64_t v12 = 0x40000000LL;
    uint64_t v13 = __catalog_chunk_parse_subchunk_v2_block_invoke;
    BOOL v14 = &__block_descriptor_tmp_72;
    char v17 = v5;
    uint64_t v15 = a2;
    unint64_t v16 = v8;
  }

  else
  {
    uint64_t v11 = MEMORY[0x1895F87A8];
    uint64_t v12 = 0x40000000LL;
    uint64_t v13 = __catalog_chunk_parse_subchunk_legacy_block_invoke;
    BOOL v14 = &__block_descriptor_tmp_75;
    char v17 = v5;
    uint64_t v15 = a2;
    unint64_t v16 = v8;
    BOOL result = catalog_chunk_parse_section(a1, v8, 0x20uLL, (uint64_t)&v11);
    if (!result) {
      return result;
    }
  }

  return *a1 <= v8;
}

uint64_t __catalog_chunk_parse_subchunk_v2_block_invoke( uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  unint64_t v8 = _catalog_subchunk_entry_alloc(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
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
        hashtable_insert((int *)v8[6], v18, 0LL);
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
        hashtable_insert((int *)v8[5], v24, 0LL);
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

uint64_t __catalog_chunk_parse_subchunk_legacy_block_invoke( uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  unint64_t v8 = _catalog_subchunk_entry_alloc(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
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

uint64_t catalog_chunk_parse_procinfo_uuidinfo( void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
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
      if (!hashtable_lookup(*(void *)(a4 + 56), (uint64_t)&v30))
      {
        uint64_t v23 = _os_trace_calloc();
        uint64_t v24 = (unsigned __int8 *)v23;
        *(void *)uint64_t v23 = v21[1] >> 16;
        *(void *)(v23 + 8) = *v21;
        unint64_t v25 = 16LL * (unsigned __int16)*((_DWORD *)v21 + 2);
        if (v29 >= v25 && v29 - v25 > 0xF) {
          *(_OWORD *)(v23 + 16) = *(_OWORD *)(v15 + 16LL * (unsigned __int16)*((_DWORD *)v21 + 2));
        }
        else {
          _os_assumes_log();
        }
        hashtable_insert(*(int **)(a4 + 56), v24, (uint64_t)v24);
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

uint64_t catalog_chunk_parse_procinfo_subsystem( unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
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
              _os_assumes_log();
              return 0LL;
            }

            if (!hashtable_lookup(*(void *)(a4 + 64), (uint64_t)v26))
            {
              unint64_t v29 = v25;
              uint64_t v30 = (char *)(v38 + v28);
              uint64_t v31 = (void *)_os_trace_calloc();
              *(_WORD *)uint64_t v31 = *v26;
              v31[1] = _os_trace_str_map_entry(*(void **)(a3 + 24), v30 + 2);
              uint64_t v32 = _os_trace_str_map_entry(*(void **)(a3 + 24), &v30[*v30 + 2]);
              v31[2] = v32;
              if (!v32 || !v31[1]) {
                _os_assumes_log();
              }
              hashtable_insert(*(int **)(a4 + 64), v31, (uint64_t)v31);
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
    v35 = v11;
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
      if (!hashtable_lookup(*(void *)(a4 + 64), (uint64_t)v18))
      {
        uint64_t v20 = (void *)_os_trace_calloc();
        *(_WORD *)uint64_t v20 = *v18;
        v20[1] = _os_trace_str_map_entry(*(void **)(a3 + 24), (char *)(v37 + v18[1]));
        unint64_t v11 = v35;
        v20[2] = _os_trace_str_map_entry(*(void **)(a3 + 24), (char *)(v37 + v18[2]));
        hashtable_insert(*(int **)(a4 + 64), v20, (uint64_t)v20);
        ++*(void *)(a3 + 56);
      }
    }

    while ((unint64_t)++v16 < *(void *)v12);
  }

LABEL_56:
  unint64_t v33 = (unint64_t)*v11;
  *unint64_t v11 = (unsigned __int16 *)v33;
  return 1LL;
}

    uint64_t v43 = (unsigned int *)(a1 + 24LL * v19 + 44);
    while (1)
    {
      char v44 = *v43;
      v43 += 8;
      if (v44 >= a2) {
        break;
      }
      if (!--v23) {
        goto LABEL_59;
      }
    }
  }

  return result;
}

      self->_last_attrs = self->_cur_attrs;
      return;
    }

    if ((ob_flags & 2) == 0)
    {
      uint64_t v15 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v15 - 1) <= 1)
      {
        os_trace_blob_add_slow((uint64_t)&self->_ob, "\x1B[", 2uLL);
        if ((v9 & 0x20) == 0) {
          goto LABEL_21;
        }
LABEL_12:
        unint64_t v17 = self->_ob.ob_flags;
        if ((self->_cur_attrs & 0x20) != 0)
        {
          if ((v17 & 2) != 0) {
            goto LABEL_21;
          }
          BOOL v21 = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - v21 - 1) > 1)
          {
            *(_WORD *)&self->_ob.var0.ob_b[v21] = 15153;
            uint64_t v20 = self->_ob.ob_len + 2;
LABEL_19:
            self->_ob.ob_len = v20;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v20] = 0;
            }
LABEL_21:
            if ((v9 & 0x40) == 0) {
              goto LABEL_31;
            }
            uint64_t v22 = self->_ob.ob_flags;
            if ((self->_cur_attrs & 0x40) != 0)
            {
              if ((v22 & 2) != 0) {
                goto LABEL_31;
              }
              unint64_t v26 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v26 - 1) > 1)
              {
                *(_WORD *)&self->_ob.var0.ob_b[v26] = 15155;
                unint64_t v25 = self->_ob.ob_len + 2;
LABEL_29:
                self->_ob.ob_len = v25;
                if (!self->_ob.ob_binary) {
                  p_ob->var0.ob_b[v25] = 0;
                }
LABEL_31:
                if ((v9 & 0x80) == 0) {
                  goto LABEL_41;
                }
                goto LABEL_32;
              }

              uint64_t v41 = "3;";
              uint64_t v42 = (uint64_t)p_ob;
              uint64_t v43 = 2LL;
            }

            else
            {
              if ((v22 & 2) != 0) {
                goto LABEL_31;
              }
              uint64_t v23 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v23 - 1) > 2)
              {
                uint64_t v24 = &self->_ob.var0.ob_b[v23];
                v24[2] = 59;
                *(_WORD *)uint64_t v24 = 13362;
                unint64_t v25 = self->_ob.ob_len + 3;
                goto LABEL_29;
              }

              uint64_t v41 = "24;";
              uint64_t v42 = (uint64_t)p_ob;
              uint64_t v43 = 3LL;
            }

            os_trace_blob_add_slow(v42, v41, v43);
            if ((v9 & 0x80) == 0) {
              goto LABEL_41;
            }
LABEL_32:
            __int128 v27 = self->_ob.ob_flags;
            if ((self->_cur_attrs & 0x80) != 0)
            {
              if ((v27 & 2) == 0)
              {
                uint64_t v31 = self->_ob.ob_len;
                if ((self->_ob.ob_binary + self->_ob.ob_size - v31 - 1) > 1)
                {
                  *(_WORD *)&self->_ob.var0.ob_b[v31] = 15156;
                  uint64_t v30 = self->_ob.ob_len + 2;
LABEL_39:
                  self->_ob.ob_len = v30;
                  if (!self->_ob.ob_binary) {
                    p_ob->var0.ob_b[v30] = 0;
                  }
                  goto LABEL_41;
                }

                char v44 = "4;";
                uint64_t v45 = (uint64_t)p_ob;
                v46 = 2LL;
                goto LABEL_72;
              }
            }

            else if ((v27 & 2) == 0)
            {
              unint64_t v28 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v28 - 1) > 2)
              {
                unint64_t v29 = &self->_ob.var0.ob_b[v28];
                v29[2] = 59;
                *(_WORD *)unint64_t v29 = 13362;
                uint64_t v30 = self->_ob.ob_len + 3;
                goto LABEL_39;
              }

              char v44 = "24;";
              uint64_t v45 = (uint64_t)p_ob;
              v46 = 3LL;
LABEL_72:
              os_trace_blob_add_slow(v45, v44, v46);
            }

          uint64_t v4 = v18 + 1;
          goto LABEL_57;
        }

        if (v28 == 127) {
          uint64_t v32 = 63;
        }
        else {
          uint64_t v32 = v28 + 64;
        }
        qmemcpy(&__srca, "\\M^", 3);
        HIBYTE(__srca) = v32;
        if ((*(_BYTE *)(a1 + 20) & 2) != 0) {
          goto LABEL_56;
        }
        unint64_t v29 = *(unsigned int *)(a1 + 8);
        if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 3)
        {
          p_srca = (__int16 *)&__srca;
          goto LABEL_64;
        }

        uint64_t v30 = *(void *)a1;
        uint64_t v31 = __srca;
LABEL_53:
        *(_DWORD *)(v30 + v29) = v31;
        uint64_t v23 = *(_DWORD *)(a1 + 8) + 4;
LABEL_54:
        *(_DWORD *)(a1 + 8) = v23;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v23) = 0;
        }
        goto LABEL_56;
      }

      unint64_t v25 = v24;
      if (v24 == -2LL) {
        return v17;
      }
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        unint64_t v26 = *(unsigned int *)(a1 + 8);
        if (v24 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1))
        {
          os_trace_blob_add_slow(a1, v18, v24);
        }

        else
        {
          memcpy((void *)(*(void *)a1 + v26), v18, v24);
          __int128 v27 = *(_DWORD *)(a1 + 8) + v25;
          *(_DWORD *)(a1 + 8) = v27;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v27) = 0;
          }
        }
      }

      uint64_t v10 = v25 + v17;
      if (v25 + v17 == v3) {
        return v3;
      }
      uint64_t v4 = &v18[v25];
LABEL_57:
      unint64_t v17 = v10;
      if (!*v4) {
        return v17;
      }
    }

    uint64_t v10 = v17 + 3;
    if (v17 + 3 > v3) {
      return v17;
    }
    uint64_t v20 = v19 + 64;
    if (v19 == 127) {
      uint64_t v20 = 63;
    }
    v39 = 24156;
    v40 = v20;
    if ((*(_BYTE *)(a1 + 20) & 2) != 0) {
      goto LABEL_56;
    }
    BOOL v21 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v21 - 1) <= 2)
    {
      p_srca = &v39;
      char v34 = a1;
      v35 = 3LL;
      goto LABEL_65;
    }

    uint64_t v22 = *(void *)a1 + v21;
    *(_WORD *)uint64_t v22 = v39;
    *(_BYTE *)(v22 + 2) = v40;
    uint64_t v23 = *(_DWORD *)(a1 + 8) + 3;
    goto LABEL_54;
  }

  return 0LL;
}

uint64_t __catalog_chunk_parse_activity_legacy_block_invoke()
{
  return 1LL;
}

uint64_t _chunk_print_uuid(uint64_t a1, unsigned __int8 *uu)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse(uu, out);
  return printf("[%03llu] %s\n", a1, out);
}

__n128 __catalog_chunk_unparse_uuid_block_invoke(uint64_t a1, __n128 *a2, unsigned __int16 a3)
{
  __n128 result = *a2;
  *(__n128 *)(**(void **)(a1 + 32) + 16LL * a3) = *a2;
  return result;
}

char *__catalog_chunk_unparse_subsystem_block_invoke(uint64_t a1, const char *a2, unsigned __int16 a3)
{
  __n128 result = (char *)_os_crash();
  __break(1u);
  return result;
}

void __catalog_chunk_unparse_procinfo_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  unint64_t v4 = _os_trace_uuid_map_lookup(*(void **)(a1[4] + 16LL), (void *)(a2 + 24));
  if (v4 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }

  __int16 v5 = v4;
  if (!uuid_is_null((const unsigned __int8 *)(a2 + 40)))
  {
    unint64_t v6 = _os_trace_uuid_map_lookup(*(void **)(a1[4] + 16LL), (void *)(a2 + 40));
    if (v6 < 0x10000) {
      goto LABEL_5;
    }
LABEL_10:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  LOWORD(v6) = -1;
LABEL_5:
  int v7 = (uint64_t *)a1[5];
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
  *(_DWORD *)(v8 + 20) = v10;
  *(void *)(v8 + 24) = v12;
  *int v7 = v8 + 32;
  int v13 = (void **)a1[5];
  uint64_t v14 = *v13;
  if (a1[6] - (void)*v13 > 7uLL)
  {
    uint64_t v15 = (void **)a1[4];
    *uint64_t v14 = *(unsigned int *)(*(void *)(a2 + 56) + 4LL);
    *int v13 = v14 + 1;
    uint64_t v16 = *(unsigned int **)(a2 + 56);
    uint64_t v17 = MEMORY[0x1895F87A8];
    uint64_t v22 = MEMORY[0x1895F87A8];
    uint64_t v23 = 0x40000000LL;
    uint64_t v24 = __catalog_chunk_unparse_procinfo_uuidinfo_block_invoke;
    unint64_t v25 = &__block_descriptor_tmp_80;
    unint64_t v26 = v15;
    __int128 v27 = v13;
    hashtable_iterate(v16, (uint64_t)&v22);
    int v13 = (void **)a1[5];
    uint64_t v18 = *v13;
    if (a1[6] - (void)*v13 >= 8uLL)
    {
      uint64_t v19 = (void **)a1[4];
      void *v18 = *(unsigned int *)(*(void *)(a2 + 64) + 4LL);
      *int v13 = v18 + 1;
      uint64_t v20 = *(unsigned int **)(a2 + 64);
      uint64_t v22 = v17;
      uint64_t v23 = 0x40000000LL;
      uint64_t v24 = __catalog_chunk_unparse_procinfo_subsystem_block_invoke;
      unint64_t v25 = &__block_descriptor_tmp_81;
      unint64_t v26 = v13;
      __int128 v27 = v19;
      hashtable_iterate(v20, (uint64_t)&v22);
      int v13 = (void **)a1[5];
    }
  }

  size_t v21 = (((unint64_t)*v13 + 7) & 0xFFFFFFFFFFFFFFF8LL) - (void)*v13;
  bzero(*v13, v21);
  *(void *)a1[5] += v21;
}

uint64_t __catalog_chunk_unparse_subchunk_procinfos_block_invoke(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(_WORD ***)(result + 32);
  __int128 v3 = *v2;
  *__int128 v3 = *a2;
  *uint64_t v2 = v3 + 1;
  return result;
}

uint64_t __catalog_chunk_unparse_subchunk_subcats_block_invoke(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(_WORD ***)(result + 32);
  __int128 v3 = *v2;
  *__int128 v3 = *a2;
  *uint64_t v2 = v3 + 1;
  return result;
}

unint64_t __catalog_chunk_unparse_procinfo_uuidinfo_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t result = _os_trace_uuid_map_lookup(*(void **)(*(void *)(a1 + 32) + 16LL), a3 + 2);
  unint64_t v6 = result;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log();
  }
  int v7 = **(void ***)(a1 + 40);
  uint64_t v8 = *a3;
  v7[1] = *((unsigned __int16 *)v7 + 4) | (unint64_t)(*a3 << 16);
  *int v7 = a3[1];
  if (v6 >= 0x10000)
  {
    _os_assert_log();
    unint64_t result = _os_crash();
    __break(1u);
  }

  else
  {
    v7[1] = (v8 << 16) | (unsigned __int16)v6;
    **(void **)(a1 + 40) += 16LL;
  }

  return result;
}

unint64_t __catalog_chunk_unparse_procinfo_subsystem_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = **(_WORD ***)(a1 + 32);
  _WORD *v5 = *(_WORD *)a3;
  unint64_t v6 = *(char **)(a3 + 8);
  if (!v6 || !*(void *)(a3 + 16))
  {
    _os_assumes_log();
    unint64_t v6 = *(char **)(a3 + 8);
  }

  int v7 = _os_trace_str_map_lookup(*(void **)(*(void *)(a1 + 40) + 24LL), v6);
  __int16 v8 = (__int16)v7;
  v5[1] = v8;
  unint64_t result = (unint64_t)_os_trace_str_map_lookup(*(void **)(*(void *)(a1 + 40) + 24LL), *(char **)(a3 + 16));
  __int16 v10 = result;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log();
  }
  v5[2] = v10;
  **(void **)(a1 + 32) += 6LL;
  return result;
}

uint8_t *_tracev3_chunk_decompress(uint64_t a1, uint64_t a2, compression_algorithm *a3, size_t *a4)
{
  compression_algorithm v7 = COMPRESSION_LZ4;
  size_t v8 = 0x10000LL;
  if (a2)
  {
    unsigned int v9 = *(_DWORD *)(a2 + 32);
    BOOL v10 = v9 == 0;
    if (v9) {
      size_t v8 = v9;
    }
    else {
      size_t v8 = 0x10000LL;
    }
    if (v9) {
      compression_algorithm v7 = *(_DWORD *)(a2 + 36);
    }
    else {
      compression_algorithm v7 = COMPRESSION_LZ4;
    }
    if (!v7)
    {
      int v11 = (uint8_t *)(a1 + 16);
      size_t v12 = *(void *)(a1 + 8);
      if (!a3) {
        goto LABEL_20;
      }
LABEL_19:
      *a3 = v7;
      goto LABEL_20;
    }
  }

  else
  {
    BOOL v10 = 1;
  }

  int v11 = (uint8_t *)_os_trace_malloc();
  size_t v13 = compression_decode_buffer(v11, v8, (const uint8_t *)(a1 + 16), *(void *)(a1 + 8), 0LL, v7);
  size_t v12 = v13;
  if (!v13)
  {
    free(v11);
    int v11 = 0LL;
LABEL_18:
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  if (v10) {
    goto LABEL_18;
  }
  if (v13 == v8)
  {
    size_t v12 = v8;
    if (a3) {
      goto LABEL_19;
    }
  }

  else
  {
    _os_assumes_log();
    if (a3) {
      goto LABEL_19;
    }
  }

LABEL_20:
  if (a4) {
    *a4 = v12;
  }
  return v11;
}

    unint64_t v6 = *(_DWORD *)(a2 + 9);
    uint64_t v22 = v5;
    uint64_t v23 = v6;
    compression_algorithm v7 = *(void *)(a2 + 13);
    __int128 v27 = *(_OWORD *)(a2 + 39);
    uint64_t v24 = v7;
    unint64_t v25 = a2 + 21;
    size_t v8 = *(unsigned __int16 *)(a2 + 37);
    if (*(_WORD *)(a2 + 37)) {
      unsigned int v9 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125));
    }
    else {
      unsigned int v9 = "<missing path>";
    }
    unint64_t v26 = v9;
    uint64_t v28 = *(_OWORD *)(a2 + 67);
    unint64_t v29 = *(void *)(a2 + 83);
    uint64_t v30 = a2 + 91;
    BOOL v10 = *(unsigned __int16 *)(a2 + 107);
    if (*(_WORD *)(a2 + 107)) {
      int v11 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8);
    }
    else {
      int v11 = "<missing path>";
    }
    uint64_t v31 = v11;
    size_t v12 = *(_DWORD *)(a2 + 1);
    if (v12 > 7)
    {
      switch(v12)
      {
        case 8:
          goto LABEL_30;
        case 16:
          if (*(_WORD *)(a2 + 109)) {
            uint64_t v16 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8 + v10);
          }
          else {
            uint64_t v16 = "<missing name>";
          }
          size_t v21 = *(unsigned int *)(a2 + 111);
          v35 = v16;
          char v34 = v21;
          uint64_t v32 = *(void *)(a2 + 55);
          unint64_t v33 = *(_DWORD *)(a2 + 63);
          LOBYTE(v36) = 0;
          goto LABEL_60;
        case 64:
LABEL_30:
          size_t v13 = *(unsigned int *)(a2 + 109);
          if ((_DWORD)v13) {
            uint64_t v14 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8 + v10);
          }
          else {
            uint64_t v14 = "<missing format data>";
          }
          v35 = v14;
          int v36 = 0u;
          uint64_t v37 = 0u;
          if (v12 == 8)
          {
            if (*(_DWORD *)(a2 + 121))
            {
              uint64_t v17 = *(unsigned int *)(a2 + 117);
              uint64_t v18 = a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8 + v10 + v13 + v17;
            }

            else
            {
              uint64_t v18 = 0LL;
              LODWORD(v17) = *(_DWORD *)(a2 + 117);
            }

            v39 = (const char *)v18;
            if ((_DWORD)v17) {
              uint64_t v19 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8 + v10 + v13);
            }
            else {
              uint64_t v19 = 0LL;
            }
          }

          else
          {
            uint64_t v19 = "<missing buffer data>";
            v39 = "<missing buffer data>";
          }

          uint64_t v38 = v19;
          char v34 = 0LL;
          v40 = 0;
          goto LABEL_59;
      }

  size_t v13 = malloc(0x30uLL);
  if (!v13)
  {
LABEL_27:
    unsigned int v9 = 35;
    goto LABEL_16;
  }

  uint64_t v14 = v13;
  uint64_t v15 = ctf_strdup(__s2);
  if (!v15)
  {
    free(v14);
    goto LABEL_27;
  }

  uint64_t v16 = i + 64;
  v14[2] = v15;
  *(_OWORD *)(v14 + 3) = xmmword_1869D9100;
  *((_DWORD *)v14 + 10) = a4;
  *(_DWORD *)(i + 44) = v10 & 0x400 | (v10 + 1) & 0x3FF | 0x4000;
  uint64_t v17 = *(void *)(i + 64);
  *(void *)(i + 64) = v14;
  *uint64_t v14 = v17;
  v14[1] = 0LL;
  if (v17) {
    uint64_t v16 = v17;
  }
  *(void *)(v16 + 8) = v14;
  uint64_t v18 = strlen(v15);
  unint64_t result = 0LL;
  *(void *)(a1 + 600) += v18 + 1;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

void _tracev3_chunk_decompress_and_enumerate_chunks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x1895F89C0];
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  int v8 = -1431655766;
  unint64_t v4 = _tracev3_chunk_decompress(a1, a2, (compression_algorithm *)&v8, v9);
  if (v4)
  {
    unint64_t v5 = 0LL;
    unint64_t v6 = v9[0];
    do
    {
      if (v6 - v5 < 0x10) {
        break;
      }
      unint64_t v7 = *(void *)&v4[v5 + 8];
      if (v6 - v5 - 16 < v7) {
        break;
      }
      unint64_t v5 = (v5 + v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    }

    while (v5 - 1 < v6);
  }

  if (v8) {
    free(v4);
  }
}

void _os_activity_map_destroy(void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p[2];
    if (v2)
    {
      do
      {
        __int128 v3 = (void *)*v2;
        operator delete(v2);
        uint64_t v2 = v3;
      }

      while (v3);
    }

    unint64_t v4 = *__p;
    *__p = 0LL;
    if (v4) {
      operator delete(v4);
    }
    operator delete(__p);
  }

void *_os_activity_map_find_parent(void *result, unint64_t a2)
{
  if (result)
  {
    int8x8_t v2 = (int8x8_t)result[1];
    if (v2)
    {
      uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
      v3.i16[0] = vaddlv_u8(v3);
      if (v3.u32[0] > 1uLL)
      {
        unint64_t v4 = a2;
        if (*(void *)&v2 <= a2) {
          unint64_t v4 = a2 % *(void *)&v2;
        }
      }

      else
      {
        unint64_t v4 = (*(void *)&v2 - 1LL) & a2;
      }

      unint64_t v5 = *(void **)(*result + 8 * v4);
      if (v5)
      {
        for (unint64_t i = (void *)*v5; i; unint64_t i = (void *)*i)
        {
          unint64_t v7 = i[1];
          if (v7 == a2)
          {
            if (i[2] == a2) {
              return (void *)i[3];
            }
          }

          else
          {
            if (v3.u32[0] > 1uLL)
            {
              if (v7 >= *(void *)&v2) {
                v7 %= *(void *)&v2;
              }
            }

            else
            {
              v7 &= *(void *)&v2 - 1LL;
            }

            if (v7 != v4) {
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

void _os_activity_map_insert(void **a1, unint64_t a2, uint64_t a3)
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

  unint64_t v7 = *((void *)v5 + 1);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = a2;
      if (v7 <= a2) {
        unint64_t v9 = a2 % v7;
      }
    }

    else
    {
      unint64_t v9 = (v7 - 1) & a2;
    }

    BOOL v10 = *(void **)(*(void *)v5 + 8 * v9);
    if (v10)
    {
      for (unint64_t i = (void *)*v10; i; unint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == a2)
        {
          if (i[2] == a2) {
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

  size_t v13 = operator new(0x20uLL);
  *size_t v13 = 0LL;
  v13[1] = a2;
  v13[2] = a2;
  v13[3] = a3;
  float v14 = (float)(unint64_t)(*((void *)v5 + 3) + 1LL);
  float v15 = *((float *)v5 + 8);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1LL;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      int8x8_t prime = (int8x8_t)v18;
    }
    else {
      int8x8_t prime = (int8x8_t)v17;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v7 = *((void *)v5 + 1);
    if (*(void *)&prime > v7) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*((unint64_t *)v5 + 3) / *((float *)v5 + 8));
      if (v7 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }

      else
      {
        uint64_t v28 = 1LL << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }

      if (*(void *)&prime <= v26) {
        int8x8_t prime = (int8x8_t)v26;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *((void *)v5 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v20 = operator new(8LL * *(void *)&prime);
          size_t v21 = *(void **)v5;
          *(void *)unint64_t v5 = v20;
          if (v21) {
            operator delete(v21);
          }
          uint64_t v22 = 0LL;
          *((int8x8_t *)v5 + 1) = prime;
          do
            *(void *)(*(void *)v5 + 8 * v22++) = 0LL;
          while (*(void *)&prime != v22);
          uint64_t v23 = (void *)*((void *)v5 + 2);
          if (v23)
          {
            unint64_t v24 = v23[1];
            uint8x8_t v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(void *)&prime) {
                v24 %= *(void *)&prime;
              }
            }

            else
            {
              v24 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)v5 + 8 * v24) = v5 + 16;
            unint64_t v29 = (void *)*v23;
            if (*v23)
            {
              do
              {
                unint64_t v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(void *)&prime) {
                    v30 %= *(void *)&prime;
                  }
                }

                else
                {
                  v30 &= *(void *)&prime - 1LL;
                }

                if (v30 != v24)
                {
                  if (!*(void *)(*(void *)v5 + 8 * v30))
                  {
                    *(void *)(*(void *)v5 + 8 * v30) = v23;
                    goto LABEL_57;
                  }

                  *uint64_t v23 = *v29;
                  *unint64_t v29 = **(void **)(*(void *)v5 + 8 * v30);
                  **(void **)(*(void *)v5 + 8 * v30) = v29;
                  unint64_t v29 = v23;
                }

                unint64_t v30 = v24;
LABEL_57:
                uint64_t v23 = v29;
                unint64_t v29 = (void *)*v29;
                unint64_t v24 = v30;
              }

              while (v29);
            }
          }

          unint64_t v7 = (unint64_t)prime;
          goto LABEL_61;
        }

        v35 = *(void **)v5;
        *(void *)unint64_t v5 = 0LL;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v7 = 0LL;
        *((void *)v5 + 1) = 0LL;
      }
    }

LABEL_61:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v9 = a2 % v7;
      }
      else {
        unint64_t v9 = a2;
      }
    }

    else
    {
      unint64_t v9 = (v7 - 1) & a2;
    }
  }

  uint64_t v31 = *(void *)v5;
  uint64_t v32 = *(void **)(*(void *)v5 + 8 * v9);
  if (v32)
  {
    *size_t v13 = *v32;
LABEL_74:
    void *v32 = v13;
    goto LABEL_75;
  }

  uint64_t v33 = *((void *)v5 + 2);
  *size_t v13 = v33;
  *((void *)v5 + 2) = v13;
  *(void *)(v31 + 8 * v9) = v5 + 16;
  if (v33)
  {
    unint64_t v34 = *(void *)(v33 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v34 >= v7) {
        v34 %= v7;
      }
    }

    else
    {
      v34 &= v7 - 1;
    }

    uint64_t v32 = (void *)(*(void *)v5 + 8 * v34);
    goto LABEL_74;
  }

LABEL_75:
  ++*((void *)v5 + 3);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t _os_trace_uuid_map_insert(float *a1, uint64_t *a2, uint64_t a3)
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

    unint64_t v12 = *(void **)(*(void *)a1 + 8 * v11);
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

  BOOL v16 = operator new(0x28uLL);
  *BOOL v16 = 0LL;
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
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v23 = operator new(8LL * *(void *)&prime);
          unint64_t v24 = *(void **)a1;
          *(void *)a1 = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0LL;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v25++) = 0LL;
          while (*(void *)&prime != v25);
          unint64_t v26 = (void *)*((void *)a1 + 2);
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

                  *unint64_t v26 = *v32;
                  void *v32 = **(void **)(*(void *)a1 + 8 * v33);
                  **(void **)(*(void *)a1 + 8 * v33) = v32;
                  uint64_t v32 = v26;
                }

                unint64_t v33 = v27;
LABEL_59:
                unint64_t v26 = v32;
                uint64_t v32 = (void *)*v32;
                unint64_t v27 = v33;
              }

              while (v32);
            }
          }

          unint64_t v9 = (unint64_t)prime;
          goto LABEL_63;
        }

        v39 = *(void **)a1;
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

  unint64_t v34 = *(void **)a1;
  v35 = *(void **)(*(void *)a1 + 8 * v11);
  if (v35)
  {
    *BOOL v16 = *v35;
LABEL_76:
    void *v35 = v16;
    goto LABEL_77;
  }

  uint64_t v36 = *((void *)a1 + 2);
  *BOOL v16 = v36;
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

    v35 = (void *)(*(void *)a1 + 8 * v37);
    goto LABEL_76;
  }

LABEL_77:
  ++*((void *)a1 + 3);
  return 1LL;
}

uint64_t _os_trace_uuid_map_lookup(void *a1, void *a2)
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

void *_os_trace_uuid_map_clear(void *result)
{
  if (result)
  {
    v1 = result;
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

void _os_trace_uuid_map_destroy(void **a1)
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

uint64_t _os_procinfo_map_insert(void **a1, uint64_t a2, unsigned int a3, uint64_t a4)
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

    BOOL v16 = *(uint64_t ***)(*(void *)v7 + 8 * v15);
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
  void *v20 = 0LL;
  v20[1] = v12;
  v20[2] = a2;
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
            std::__throw_bad_array_new_length[abi:nn180100]();
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
                  void *v36 = **(void **)(*(void *)v7 + 8 * v37);
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

        uint64_t v43 = *(void **)v7;
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
  v39 = *(void **)(*(void *)v7 + 8 * v15);
  if (v39)
  {
    void *v20 = *v39;
LABEL_78:
    void *v39 = v20;
    goto LABEL_79;
  }

  uint64_t v40 = *((void *)v7 + 2);
  void *v20 = v40;
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

    v39 = (void *)(*(void *)v7 + 8 * v41);
    goto LABEL_78;
  }

LABEL_66:
LABEL_67:

LABEL_68:
      v52 = -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
      if (!v52) {
        goto LABEL_93;
      }
      v53 = -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
      v54 = v53;
      v55 = (v6 & 8) != 0 ? [v53 endTime] < v33 : objc_msgSend(v53, "oldestTime") > v33;

      if (v55) {
        goto LABEL_93;
      }
      v56 = v34;
      v57 = -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
      v58 = v57;
      if (!v57) {
        goto LABEL_92;
      }
      if ((v6 & 8) == 0)
      {
        if ([v57 oldestTime] <= v33) {
          goto LABEL_78;
        }
LABEL_186:
        qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_open_catalogs called with nothing to open yet";
        __break(1u);
LABEL_187:
        qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_open_subchunks called with nothing to open yet";
        __break(1u);
        goto LABEL_188;
      }

      if ([v57 endTime] < v33) {
        goto LABEL_186;
      }
LABEL_78:
      while (2)
      {
        v59 = v58;
        v60 = v59;
        if ((v6 & 8) == 0)
        {
          if ([v59 oldestTime] > v33) {
            goto LABEL_90;
          }

          if ([v60 endTime] < v33) {
            goto LABEL_88;
          }
LABEL_84:
          if (!self->_catalogFilter
            || (v61 = v60, [v61 catalog])
            && -[_OSLogCatalogFilter isKeptCatalog:]( self->_catalogFilter, "isKeptCatalog:", [v61 catalog]))
          {
            v62 = v56;
            v139 = MEMORY[0x1895F87A8];
            v140 = 3221225472LL;
            v141 = ___oie_advance_cursor_open_catalog_block_invoke;
            v142 = &unk_189F0E9E0;
            v143 = v62;
            [v60 enumerateSubchunksUsingBlock:&v139];
          }

      v54 = *(_WORD *)(a1 + 2);
      if ((v54 & 0x400) == 0) {
        goto LABEL_68;
      }
      LOWORD(v51) = v51 + 1;
LABEL_68:
      if (*(_BYTE *)a1 == 6)
      {
        v55 = (unsigned __int16)v51;
        v51 = (unsigned __int16)v51 + 8LL;
        *(void *)(a2 + 208) = *(void *)(a1 + v55 + 24);
        *(_BYTE *)(a2 + 224) = *(_BYTE *)(a1 + 1) & 0x3F;
        *(_BYTE *)(a2 + 225) = *(_BYTE *)(a1 + 1) & 0xC0;
        v54 = *(_WORD *)(a1 + 2);
        if (v54 < 0)
        {
          v51 = (unsigned __int16)v51 + 4LL;
          v56 = *(void *)(a1 + 16);
          if (v51 > HIWORD(v56)) {
            return 0LL;
          }
          if ((v54 & 0x20) != 0)
          {
            v51 = (unsigned __int16)v51 + 2LL;
            if (v51 > HIWORD(v56)) {
              return 0LL;
            }
          }
        }
      }

      if ((v54 & 0x800) == 0) {
        goto LABEL_77;
      }
      v57 = (unsigned __int16)v51;
      v51 = (unsigned __int16)v51 + 4LL;
      *(_DWORD *)(a2 + 200) = *(_DWORD *)(a1 + v57 + 24);
LABEL_77:
      *(void *)(a2 + 152) = a1 + (unsigned __int16)v51 + 24;
      v58 = *(unsigned __int16 *)(a1 + 22) - (unint64_t)(unsigned __int16)v51;
LABEL_85:
      *(void *)(a2 + 160) = v58;
LABEL_86:
      unint64_t result = 1LL;
      break;
    case 7:
      *(_DWORD *)a2 = 1792;
      if (*(void *)(a1 + 16) >> 51 < 3uLL) {
        return 0LL;
      }
      uint64_t v45 = *(_DWORD *)(a1 + 40);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a1 + 24);
      *(_DWORD *)(a2 + 160) = v45;
      goto LABEL_86;
    default:
      return result;
  }

  return result;
}

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v15;
  __break(1u);
}

    free(v22);
    goto LABEL_66;
  }

LABEL_79:
  ++*((void *)v7 + 3);
  return 1LL;
}

void *_os_procinfo_map_lookup(void *result, uint64_t a2, unsigned int a3)
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

void *_os_procinfo_map_clear(void *result, uint64_t (*a2)(void))
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

uint64_t _os_trace_str_map_insert(void **a1, char *__s, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (char *)*a1;
  if (!*a1)
  {
    unint64_t v5 = (char *)operator new(0x28uLL);
    *(_OWORD *)unint64_t v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((_DWORD *)v5 + 8) = 1065353216;
    *a1 = v5;
  }

  std::string::basic_string[abi:nn180100]<0>(__p, __s);
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
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v8, v9);
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

  BOOL v16 = *(unsigned __int8 ***)(*(void *)v5 + 8 * v15);
  if (!v16 || (float v17 = *v16) == 0LL)
  {
LABEL_26:
    BOOL v19 = v5 + 16;
    unint64_t v20 = operator new(0x30uLL);
    void *v20 = 0LL;
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
        void *v20 = *v40;
      }

      else
      {
        unint64_t v41 = (void *)*v19;
        void *v20 = *v19;
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

      void *v40 = v20;
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
            std::__throw_bad_array_new_length[abi:nn180100]();
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

LABEL_67:
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
    unint64_t v18 = *((void *)v17 + 1);
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
    float v17 = *(unsigned __int8 **)v17;
    if (!v17) {
      goto LABEL_26;
    }
  }

  uint64_t v43 = 0LL;
  if (v7 < 0) {
LABEL_82:
  }
    operator delete(__p[0]);
  return v43;
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
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

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]( uint64_t *a1, unint64_t a2)
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
    v50 = a1 + 4;
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

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
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

void *_os_trace_str_map_lookup(void *result, char *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    std::string::basic_string[abi:nn180100]<0>(__p, a2);
    uint64_t v3 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>( v2,  (uint64_t)__p);
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

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>( void *a1, uint64_t a2)
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
  unint64_t v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
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

void *_os_trace_str_map_entry(void *result, char *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    std::string::basic_string[abi:nn180100]<0>(__p, a2);
    uint64_t v3 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>( v2,  (uint64_t)__p);
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

uint64_t _os_trace_str_map_for_each(uint64_t result, uint64_t a2)
{
  if (result)
  {
    for (uint64_t i = *(uint64_t **)(result + 16); i; uint64_t i = (uint64_t *)*i)
    {
      int v4 = i + 2;
      unint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t))(a2 + 16))(a2, v4, i[5]);
    }
  }

  return result;
}

void _os_trace_str_map_clear(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node( void **__p)
{
  if (__p)
  {
    v1 = __p;
    do
    {
      uint64_t v2 = (void **)*v1;
      operator delete(v1);
      v1 = v2;
    }

    while (v2);
  }

void _os_trace_str_map_destroy(void ***a1)
{
  if (a1)
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(a1[2]);
    uint64_t v2 = *a1;
    *a1 = 0LL;
    if (v2) {
      operator delete(v2);
    }
    operator delete(a1);
  }

void hashtable_destroy(unsigned int *a1, void (*a2)(void))
{
  if (!*((void *)a1 + 2)) {
    goto LABEL_12;
  }
  unint64_t v3 = *a1;
  if ((_DWORD)v3)
  {
    for (unint64_t i = 0LL; i < v3; ++i)
    {
      char v6 = *(void **)(*((void *)a1 + 2) + 8 * i);
      if (v6)
      {
        do
        {
          uint64_t v7 = (void *)*v6;
          if (a2) {
            a2(v6[2]);
          }
          free(v6);
          --a1[1];
          char v6 = v7;
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

  _os_assert_log();
  _os_crash();
  __break(1u);
}

uint64_t hashtable_lookup(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16))
  {
    int v4 = (void *)(*(void *)(a1 + 16) + 8LL * (hash_fn_array[*(unsigned __int8 *)(a1 + 8)](a2) % *(_DWORD *)a1));
    int v5 = (unsigned int (*)(void, uint64_t))hashkey_compare_array[*(unsigned __int8 *)(a1 + 8)];
    while (1)
    {
      int v4 = (void *)*v4;
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

BOOL hashkey_compare_uint16(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

BOOL hashkey_compare_uint64(uint64_t a1, void *a2)
{
  return *a2 == a1;
}

uint64_t hash_uint16(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t hash_uint64(void *a1)
{
  unint64_t v1 = *a1 + ~(*a1 << 32);
  unint64_t v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  unint64_t v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

uint64_t hashtable_insert(int *a1, void *a2, uint64_t a3)
{
  unsigned int v6 = ((unsigned int (**)(void *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2);
  unsigned int v7 = *a1;
  if (!*((void *)a1 + 2)) {
    goto LABEL_8;
  }
  int8x8_t v8 = (void *)(*((void *)a1 + 2)
                + 8LL
                * (((unsigned int (**)(void *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  unint64_t v9 = (uint64_t (*)(void, void *))hashkey_compare_array[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    int8x8_t v8 = (void *)*v8;
    if (!v8) {
      break;
    }
    if ((v9(v8[1], a2) & 1) != 0) {
      return 0LL;
    }
  }

  if (!*((void *)a1 + 2)) {
LABEL_8:
  }
    *((void *)a1 + 2) = _os_trace_calloc();
  unsigned int v11 = v6 % v7;
  int v12 = *((unsigned __int8 *)a1 + 8);
  BOOL v13 = (void *)_os_trace_calloc();
  *BOOL v13 = 0LL;
  v13[2] = a3;
  if (v12 == 2)
  {
    v13[1] = *a2;
  }

  else if (v12 == 1)
  {
    *((_WORD *)v13 + 4) = *(_WORD *)a2;
  }

  else
  {
    free(v13);
    BOOL v13 = 0LL;
  }

  uint64_t v14 = *((void *)a1 + 2);
  *BOOL v13 = *(void *)(v14 + 8LL * v11);
  *(void *)(v14 + 8LL * v11) = v13;
  ++a1[1];
  return 1LL;
}

unsigned int *hashtable_iterate(unsigned int *result, uint64_t a2)
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
              int8x8_t v8 = v6 + 1;
            }
            else {
              int8x8_t v8 = 0LL;
            }
            if (v7 == 2) {
              unint64_t v9 = v6 + 1;
            }
            else {
              unint64_t v9 = v8;
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

uint64_t _os_trace_persistdir_path()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  return _os_trace_persist_path;
}

void ___os_trace_shared_paths_init_block_invoke()
{
  _os_trace_persist_path = (uint64_t)"/private/var/db/diagnostics";
  _os_trace_timesync_path = (uint64_t)"/private/var/db/diagnostics/timesync";
  _os_trace_uuidtext_path = (uint64_t)"/private/var/db/uuidtext";
}

uint64_t _os_trace_timesyncdir_path()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  return _os_trace_timesync_path;
}

uint64_t _os_trace_uuiddb_path()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  return _os_trace_uuidtext_path;
}

uint64_t _os_trace_get_path(int a1)
{
  switch(a1)
  {
    case 0:
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      uint64_t result = _os_trace_persist_path;
      break;
    case 1:
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      uint64_t result = _os_trace_timesync_path;
      break;
    case 2:
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      uint64_t result = _os_trace_uuidtext_path;
      break;
    case 3:
      uint64_t result = _os_trace_prefsdir_path();
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t _timesync_foreach_reg_file_at(int a1, uint64_t a2)
{
  int v3 = dup(a1);
  if (v3 == -1)
  {
LABEL_15:
    __error();
    return _os_assumes_log();
  }

  int v4 = v3;
  if (lseek(v3, 0LL, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }

  int v5 = fdopendir(v4);
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = MEMORY[0x1895F8770];
LABEL_6:
    while (1)
    {
      int8x8_t v8 = readdir(v6);
      if (!v8) {
        break;
      }
      if ((v8->d_type | 8) == 8)
      {
        uint64_t v9 = 0LL;
        d_name = v8->d_name;
        while ((d_name[v9] & 0x80000000) == 0
             && (*(_DWORD *)(v7 + 4LL * d_name[v9] + 60) & 0x10000) != 0)
        {
          if (++v9 == 16)
          {
            if (strcmp(&v8->d_name[16], ".timesync")
              || ((*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, d_name) & 1) != 0)
            {
              goto LABEL_6;
            }

            goto LABEL_14;
          }
        }
      }
    }

LABEL_14:
    uint64_t result = closedir(v6);
    if ((_DWORD)result == -1) {
      goto LABEL_15;
    }
  }

  else
  {
    int v12 = *__error();
    if (close(v4) == -1)
    {
      int v13 = *__error();
      uint64_t result = *__error();
      if (v13 == 9)
      {
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = result;
        __break(1u);
        return result;
      }

      _os_assumes_log();
    }

    uint64_t result = (uint64_t)__error();
    *(_DWORD *)uint64_t result = v12;
  }

  return result;
}

      int v13 = 1;
LABEL_15:
      v7->_fancy = v13;
      return v7;
    case 2:
      goto LABEL_14;
    case 1:
      v7->_fancy = 0;
      break;
  }

  return v7;
}

      return v7;
    case 8:
      [v5 senderImageUUID];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (void *)[v13 copy];

      if (v9)
      {
        uint64_t v14 = (void *)NSString;
        [v9 UUIDString];
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v6 senderImageOffset];
        [v6 formatString];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"%@ + %llu : %@", v15, v16, v17];
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v7 = @"<Unknown>";
      }

    unint64_t v30 = 0LL;
LABEL_20:
    _Block_object_dispose(&v60, 8);

    return (int *)v30;
  }

  TempDirectory = _OSLogCreateTempDirectory(v19, 0x1FFu);
  if ((_DWORD)TempDirectory == -1)
  {
    *((_DWORD *)v61 + 6) = *__error();
    if (close(v20) != -1) {
      goto LABEL_19;
    }
    if (*__error() != 9) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }

  uint64_t v22 = (*((uint64_t (**)(id, uint64_t, const char *))v18 + 2))(v18, TempDirectory, a2);
  *((_DWORD *)v61 + 6) = v22;
  if (v22)
  {
    if (fcntl(TempDirectory, 50, &v65) == -1)
    {
      __error();
      _os_assumes_log();
    }

    strerror(*((_DWORD *)v61 + 6));
    _OSLogWarningMessage( v19,  "copy handler failed for directory fd: '%s' to '%s': %s (%d)",  v23,  v24,  v25,  v26,  v27,  v28,  (char)&v65);
    if (close(v20) == -1)
    {
      if (*__error() == 9)
      {
        uint64_t v38 = *__error();
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v38;
        __break(1u);
LABEL_31:
        unint64_t v39 = *__error();
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v39;
        __break(1u);
LABEL_32:
        unint64_t v40 = *__error();
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v40;
        __break(1u);
        goto LABEL_33;
      }

      __error();
      _os_assumes_log();
    }

    if (close(TempDirectory) != -1)
    {
LABEL_19:
      unint64_t v30 = *((unsigned int *)v61 + 6);
      goto LABEL_20;
    }

    if (*__error() != 9)
    {
LABEL_12:
      __error();
      _os_assumes_log();
      goto LABEL_19;
    }

    goto LABEL_31;
  }

  uint64_t v65 = 0LL;
  unint64_t v66 = &v65;
  unint64_t v67 = 0x2020000000LL;
  uint64_t v56 = 0LL;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000LL;
  uint64_t v59 = 0LL;
  v43[0] = MEMORY[0x1895F87A8];
  v43[1] = 3221225472LL;
  v43[2] = ___OSLogCopyBook_block_invoke;
  v43[3] = &unk_189F0F7F8;
  unint64_t v52 = a4;
  uint64_t v53 = v64;
  uint64_t v51 = a2;
  uint64_t v48 = &v65;
  uint64_t v46 = v18;
  uint64_t v47 = v19;
  unint64_t v44 = v16;
  uint64_t v45 = v17;
  uint64_t v49 = &v56;
  uint64_t v54 = a7;
  uint64_t v55 = a3;
  v50 = &v60;
  _OSLogEnumerateFiles(v47, v20, v43);
  if (close(TempDirectory) == -1)
  {
    if (*__error() == 9)
    {
LABEL_33:
      unint64_t v41 = *__error();
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = v41;
      __break(1u);
      goto LABEL_34;
    }

    __error();
    _os_assumes_log();
  }

  if (close(v20) != -1)
  {
LABEL_27:
    if (v57[3] >= 1) {
      _timesync_range_intersect(a4, v64, (float *)v66[3], 0LL, 0LL);
    }
    unint64_t v30 = *((unsigned int *)v61 + 6);

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v65, 8);
    goto LABEL_20;
  }

  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
    goto LABEL_27;
  }

uint64_t ___timesync_convert_tracev3_block_invoke(uint64_t a1, unsigned __int8 *src)
{
  if (*(_DWORD *)src == 4096 && *((void *)src + 1) >= 0xA8uLL)
  {
    int v3 = *(void **)(a1 + 32);
    if (*(void *)((char *)v3 + 4) != *((void *)src + 18) || *(void *)((char *)v3 + 12) != *((void *)src + 19))
    {
      unint64_t v4 = v3[4];
      unint64_t v5 = v3[5];
      uint64_t v6 = v3[3];
      if (v4 >= v5)
      {
        uint64_t v7 = 2 * v5;
        uint64_t v6 = _os_trace_realloc();
        v3[3] = v6;
        v3[5] = v7;
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
      *(void *)(v8 + 40) = v13;
      *(void *)(v8 + 48) = v11;
      *(void *)(v8 + 56) = v12;
      uuid_copy((unsigned __int8 *)(v3[3] + (v4 << 6) + 8), src + 144);
    }
  }

  return 1LL;
}

uint64_t ___timesync_converter_close_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*a2 == *a3)
  {
    unint64_t v3 = a2[7];
    unint64_t v4 = a3[7];
    BOOL v5 = v3 == v4;
    if (v3 < v4) {
      unsigned int v6 = -1;
    }
    else {
      unsigned int v6 = 1;
    }
    if (v5) {
      return 0LL;
    }
    else {
      return v6;
    }
  }

  else if (*a2 < *a3)
  {
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 1LL;
  }

uint64_t ___timesync_converter_close_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a3 + 24);
  if (v3 == v4)
  {
    int v5 = *(_DWORD *)(a2 + 32);
    int v6 = *(_DWORD *)(a3 + 32);
    BOOL v7 = v5 == v6;
    if (v5 < v6) {
      unsigned int v8 = -1;
    }
    else {
      unsigned int v8 = 1;
    }
    if (v7) {
      return 0LL;
    }
    else {
      return v8;
    }
  }

  else if (v3 < v4)
  {
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 1LL;
  }

uint64_t _timesync_validate(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  int v6 = (char *)_os_trace_mmap_at();
  if (!v6)
  {
    uint64_t v7 = 0xFFFFFFFFLL;
    if (!*__error()) {
      return v7;
    }
LABEL_28:
    _os_assumes_log();
    return v7;
  }

  for (unint64_t i = 0LL; i <= 0xAAAAAAAAAAAAAAAALL; unint64_t i = v9 + v12)
  {
    if (i >= 0xAAAAAAAAAAAAAAAALL)
    {
      int v13 = munmap(v6, 0xAAAAAAAAAAAAAAAALL);
      uint64_t v14 = 1LL;
      uint64_t v7 = 1LL;
      goto LABEL_25;
    }

    unint64_t v9 = i;
    int v10 = &v6[i];
    int v11 = *(unsigned __int16 *)&v6[i];
    if (v11 > 48047)
    {
      if (v11 == 48048)
      {
        if (*((_WORD *)v10 + 1) != 48) {
          break;
        }
        uint64_t v12 = 48LL;
      }

      else
      {
        if (v11 != 57005) {
          break;
        }
        uint64_t v12 = *((unsigned __int16 *)v10 + 1);
      }

      continue;
    }

    if (v11 == 27986)
    {
      if (*((_WORD *)v10 + 1) != 88) {
        break;
      }
      uint64_t v12 = 88LL;
      continue;
    }

    if (v11 != 29524 || *((_WORD *)v10 + 1) != 32) {
      break;
    }
    uint64_t v12 = 32LL;
  }

  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = *(void *)v10;
  }
  int v13 = munmap(v6, 0xAAAAAAAAAAAAAAAALL);
  uint64_t v14 = 0LL;
  uint64_t v7 = 0LL;
LABEL_25:
  if (v13 == -1)
  {
    __error();
    uint64_t v7 = v14;
    goto LABEL_28;
  }

  return v7;
}

uint64_t ___timesync_tidy_and_count_files_block_invoke(void *a1, char *__str)
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

uint64_t _timesync_repair(int a1, const char *a2, uint64_t a3)
{
  int v4 = openat(a1, a2, 16777478);
  if (v4 == -1)
  {
    __error();
    _os_assumes_log();
    return 0xFFFFFFFFLL;
  }

  int v5 = v4;
  uint64_t v6 = _os_trace_mmap_at();
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    while (1)
    {
      int v10 = &v7[v8];
      unsigned int v11 = *(unsigned __int16 *)&v7[v8];
      if (v11 > 0xBBAF)
      {
        if (v11 == 48048)
        {
          if (*((_WORD *)v10 + 1) != 48) {
            goto LABEL_22;
          }
          unsigned int v12 = 48;
        }

        else
        {
          if (v11 != 57005) {
            goto LABEL_22;
          }
          unsigned int v12 = *((unsigned __int16 *)v10 + 1);
        }
      }

      else if (v11 == 27986)
      {
        if (*((_WORD *)v10 + 1) != 88) {
          goto LABEL_22;
        }
        unsigned int v12 = 88;
      }

      else
      {
        if (v11 != 29524 || *((_WORD *)v10 + 1) != 32)
        {
LABEL_22:
          unsigned __int16 v14 = *(_WORD *)&v7[v8];
          unint64_t v15 = &v7[v8];
          unint64_t v16 = 0xAAAAAAAAAAAAAAAALL - v8;
          while (1)
          {
            if (v14 == 27986)
            {
              if (*((_WORD *)v15 + 1) == 88) {
                goto LABEL_34;
              }
            }

            else if (v14 == 29524)
            {
              if (*((_WORD *)v15 + 1) == 32) {
                goto LABEL_34;
              }
            }

            else if (v14 == 48048 && *((_WORD *)v15 + 1) == 48)
            {
LABEL_34:
              unint64_t v13 = v15 - v10;
LABEL_35:
              if (v13 >= 0xFFFF)
              {
                LOWORD(v12) = -8;
              }

              else
              {
LABEL_36:
                LOWORD(v12) = v13;
                if (!(_WORD)v13)
                {
                  LOWORD(v12) = *((_WORD *)v10 + 1);
                  goto LABEL_43;
                }
              }

              (*(void (**)(uint64_t, unint64_t))(a3 + 16))(a3, v8);
              if (lseek(v5, v8, 0) == -1 || (uint64_t v18 = _os_trace_write(), v18 == -1))
              {
                __error();
                _os_assumes_log();
              }

              else if ((v18 & 0x8000000000000000LL) == 0)
              {
                uint64_t v9 = (v9 + 1);
                goto LABEL_43;
              }

              uint64_t v9 = 0xFFFFFFFFLL;
LABEL_50:
              if (munmap(v7, 0xAAAAAAAAAAAAAAAALL) == -1)
              {
                __error();
                _os_assumes_log();
              }

              if (close(v5) != -1) {
                return v9;
              }
              int v21 = *__error();
              uint64_t result = *__error();
              if (v21 != 9)
              {
LABEL_55:
                _os_assumes_log();
                __error();
                _os_assumes_log();
                return v9;
              }

              qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_18C695DD0 = result;
              __break(1u);
              goto LABEL_57;
            }

            if (v16 <= 7)
            {
              unint64_t v13 = (unsigned __int16)(-21846 - v8);
              goto LABEL_35;
            }

            v16 -= 8LL;
            unsigned __int16 v17 = *((_WORD *)v15 + 4);
            v15 += 8;
            unsigned __int16 v14 = v17;
          }
        }

        unsigned int v12 = 32;
      }

      if (v8 + v12 > 0xAAAAAAAAAAAAAAAALL)
      {
        LOWORD(v13) = -21846 - v8;
        goto LABEL_36;
      }

LABEL_43:
      v8 += (unsigned __int16)v12;
      if (v8 >= 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_50;
      }
    }
  }

  if (*__error()) {
    _os_assumes_log();
  }
  if (close(v5) != -1) {
    return 0xFFFFFFFFLL;
  }
  int v19 = *__error();
  uint64_t result = *__error();
  if (v19 != 9)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }

    uint64_t v34 = v32[1];
    if (v28.u32[0] > 1uLL)
    {
      if (v34 >= *(void *)&v26) {
        v34 %= *(void *)&v26;
      }
    }

    else
    {
      v34 &= *(void *)&v26 - 1LL;
    }

    if (v34 != v27)
    {
      *(void *)(*v21 + 8 * v34) = v30;
      uint64_t v32 = (void *)*v23;
    }

    goto LABEL_49;
  }

        os_trace_blob_add_slow(a3, __src, 1uLL);
        if ((_DWORD)v7) {
          goto LABEL_24;
        }
        goto LABEL_44;
      }

    if (a4)
    {
      uint64_t v38 = 0LL;
      unint64_t v39 = 1009;
      goto LABEL_20;
    }

    return 0LL;
  }

  if (*(void *)(a1 + 32) <= 0x23uLL) {
    goto LABEL_43;
  }
  unint64_t v23 = *(__int128 **)(a1 + 24);
  unint64_t v24 = v23[1];
  v103 = *v23;
  v104 = v24;
  unint64_t v25 = *((_DWORD *)v23 + 8);
  v105 = v25;
  uint64_t v26 = HIDWORD(v24);
  unint64_t v27 = HIDWORD(v103);
  uint64_t v28 = v25 + HIDWORD(v24);
  ctf_dprintf("ctf_bufopen: uncompressed size=%lu\n", v15, v16, v17, v18, v19, v20, v21, v25 + BYTE12(v24));
  uint64_t v36 = v104;
  uint64_t v37 = 36LL;
LABEL_30:
  if (v36 > v28
    || DWORD1(v104) > v28
    || (v26 <= v28 ? (unint64_t v41 = DWORD2(v104) > v28) : (unint64_t v41 = 1),
        v41
     || DWORD2(v104) > v26
     || v27 > v36
     || v36 > DWORD1(v104)
     || DWORD1(v104) > DWORD2(v104)
     || (BYTE8(v104) | v27) & 3 | (BYTE4(v104) | v36) & 1))
  {
LABEL_41:
    if (a4)
    {
      uint64_t v38 = 0LL;
      unint64_t v39 = 1007;
      goto LABEL_20;
    }

    return 0LL;
  }

  v101 = v26;
  v102 = v25;
  if ((BYTE3(v103) & 1) == 0)
  {
    unint64_t v42 = *(_BYTE **)(a1 + 24);
    v100 = &v42[v37];
    goto LABEL_49;
  }

  if (!ctf_zopen(a4, v29, v30, v31, v32, v33, v34, v35)) {
    return 0LL;
  }
  uint64_t v65 = mmap(0LL, v37 + v28, 3, 4098, -1, 0LL);
  if (v65 == (_BYTE *)-1LL)
  {
    if (!a4) {
      return 0LL;
    }
    v74 = 1016;
    goto LABEL_113;
  }

  unint64_t v42 = v65;
  memmove(v65, *(const void **)(a1 + 24), v37);
  v42[3] &= ~1u;
  v100 = &v42[v37];
  if (zlib())
  {
    unint64_t v66 = off_18C695FF8();
    ctf_dprintf("zlib inflate err: %s\n", v67, v68, v69, v70, v71, v72, v73, v66);
    munmap(v42, v37 + v28);
    if (!a4) {
      return 0LL;
    }
    v74 = 1017;
LABEL_113:
    *a4 = v74;
    return 0LL;
  }

  mprotect(v42, v37 + v28, 1);
LABEL_49:
  uint64_t v43 = (char *)malloc(0x278uLL);
  if (!v43)
  {
    if (a4)
    {
      uint64_t v38 = 0LL;
      unint64_t v39 = 35;
      goto LABEL_20;
    }

    return 0LL;
  }

  uint64_t v38 = (uint64_t)v43;
  bzero(v43 + 64, 0x238uLL);
  uint64_t v51 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v38 + 8) = *(_OWORD *)a1;
  unint64_t v52 = BYTE2(v103);
  *(_DWORD *)(v38 + 564) = BYTE2(v103);
  *(void *)uint64_t v38 = (char *)&ctf_fileops + 72 * v52;
  uint64_t v53 = (const char **)(v38 + 8);
  *(_OWORD *)(v38 + 24) = v51;
  *(_OWORD *)(v38 + 40) = *(_OWORD *)(a1 + 32);
  *(void *)(v38 + 56) = *(void *)(a1 + 48);
  if (a2)
  {
    uint64_t v54 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v38 + 64) = *(_OWORD *)a2;
    *(_OWORD *)(v38 + 80) = v54;
    *(_OWORD *)(v38 + 96) = *(_OWORD *)(a2 + 32);
    uint64_t v55 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)(v38 + 120) = *(_OWORD *)a3;
    *(void *)(v38 + 112) = *(void *)(a2 + 48);
    *(_OWORD *)(v38 + 136) = v55;
    *(_OWORD *)(v38 + 152) = *(_OWORD *)(a3 + 32);
    *(void *)(v38 + 168) = *(void *)(a3 + 48);
  }

  if (*v53) {
    *uint64_t v53 = ctf_strdup(*v53);
  }
  uint64_t v56 = *(const char **)(v38 + 64);
  if (v56) {
    *(void *)(v38 + 64) = ctf_strdup(v56);
  }
  uint64_t v57 = *(char **)(v38 + 120);
  if (v57)
  {
    uint64_t v57 = ctf_strdup(v57);
    *(void *)(v38 + 120) = v57;
  }

  if (!*v53) {
    *uint64_t v53 = (const char *)&_CTF_NULLSTR;
  }
  if (!*(void *)(v38 + 64)) {
    *(void *)(v38 + 64) = &_CTF_NULLSTR;
  }
  if (!v57) {
    *(void *)(v38 + 120) = &_CTF_NULLSTR;
  }
  *(void *)(v38 + 424) = &v100[v101];
  *(void *)(v38 + 432) = v102;
  if (a3)
  {
    uint64_t v58 = *(void *)(a3 + 32);
    *(void *)(v38 + 440) = *(void *)(a3 + 24);
    *(void *)(v38 + 448) = v58;
  }

  *(void *)(v38 + 456) = v42;
  *(void *)(v38 + 464) = v100;
  *(void *)(v38 + 472) = v37 + v28;
  uint64_t v59 = "(?)";
  if (DWORD1(v103))
  {
    uint64_t v60 = v38 + 16 * ((unint64_t)DWORD1(v103) >> 31);
    uint64_t v61 = *(void *)(v60 + 424);
    if (v61)
    {
      uint64_t v62 = DWORD1(v103) & 0x7FFFFFFF;
      uint64_t v63 = (const char *)(v61 + v62);
      if (*(void *)(v60 + 432) <= v62) {
        uint64_t v64 = 0LL;
      }
      else {
        uint64_t v64 = v63;
      }
    }

    else
    {
      uint64_t v64 = 0LL;
    }

    if (!v64) {
      uint64_t v64 = "(?)";
    }
    *(void *)(v38 + 536) = v64;
  }

  if (DWORD2(v103))
  {
    v75 = v38 + 16 * ((unint64_t)DWORD2(v103) >> 31);
    v76 = *(void *)(v75 + 424);
    if (v76)
    {
      v77 = DWORD2(v103) & 0x7FFFFFFF;
      v78 = (const char *)(v76 + v77);
      if (*(void *)(v75 + 432) <= v77) {
        v79 = 0LL;
      }
      else {
        v79 = v78;
      }
    }

    else
    {
      v79 = 0LL;
    }

    if (v79) {
      uint64_t v59 = v79;
    }
    *(void *)(v38 + 544) = v59;
  }

  else
  {
    uint64_t v59 = *(const char **)(v38 + 544);
  }

  if (!v59) {
    uint64_t v59 = "<NULL>";
  }
  ctf_dprintf("ctf_bufopen: parent name %s (label %s)\n", v44, v45, v46, v47, v48, v49, v50, (char)v59);
  if (a2)
  {
    v86 = *(void *)(a2 + 32) / *(void *)(a2 + 40);
    *(void *)(v38 + 488) = v86;
    v87 = 2;
    if (*(_DWORD *)(v38 + 564) == 4) {
      v87 = 3;
    }
    v88 = malloc(v86 << v87);
    *(void *)(v38 + 480) = v88;
    if (!v88)
    {
      inited = 35;
      goto LABEL_107;
    }

    init_symtab(v38, &v103, a2, a3, v92, v93, v94, v95);
  }

  inited = init_types(v38, &v103, v80, v81, v82, v83, v84, v85);
  if (inited)
  {
LABEL_107:
    if (a4) {
      *a4 = inited;
    }
    ctf_close(v38, v89, v90, v91, v92, v93, v94, v95);
    return 0LL;
  }

  *(void *)(v38 + 304) = "struct";
  *(void *)(v38 + 312) = 6LL;
  *(void *)(v38 + 320) = v38 + 176;
  *(void *)(v38 + 328) = "union";
  *(void *)(v38 + 336) = 5LL;
  *(void *)(v38 + 344) = v38 + 208;
  *(void *)(v38 + 352) = "enum";
  *(void *)(v38 + 360) = 4LL;
  *(void *)(v38 + 368) = v38 + 240;
  *(void *)(v38 + 376) = &_CTF_NULLSTR;
  *(void *)(v38 + 384) = 0LL;
  *(void *)(v38 + 392) = v38 + 272;
  *(void *)(v38 + 408) = 0LL;
  *(void *)(v38 + 416) = 0LL;
  *(void *)(v38 + 400) = 0LL;
  if (a2)
  {
    v97 = *(void *)(a2 + 40);
    v98 = &off_189F103C0;
    if (v97 != 40 && v97 != 16) {
      v98 = &_libctf_models;
    }
  }

  else
  {
    v98 = &off_189F103C0;
  }

  *(void *)(v38 + 520) = v98;
  *(_DWORD *)(v38 + 552) = 1;
  return v38;
}

LABEL_57:
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

  os_trace_blob_addf(v10, "length=%u", a3, a4, a5, a6, a7, a8, v17);
  uint64_t v37 = v15 - 4;
  if (v37 >= v16) {
    uint64_t v38 = v16;
  }
  else {
    uint64_t v38 = v37;
  }
  if (v38)
  {
    unint64_t v39 = (uint64_t)(a2 + 4);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      unint64_t v40 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v40 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }

      else
      {
        *(_WORD *)(*(void *)v10 + v40) = 8236;
        unint64_t v41 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v41;
        if (!*(_BYTE *)(v10 + 22)) {
          *(_BYTE *)(*(void *)v10 + v41) = 0;
        }
      }
    }

    os_trace_blob_add_base64(v10, v39, v38);
  }

  if ((*(_WORD *)(v10 + 20) & 2) == 0)
  {
    unint64_t v42 = *(unsigned int *)(v10 + 8);
    if (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - 1 == (_DWORD)v42)
    {
      uint64_t v43 = ">";
      a1 = v10;
      unint64_t v44 = 1LL;
      goto LABEL_76;
    }

    *(_BYTE *)(*(void *)v10 + v42) = 62;
    unsigned int v12 = *(_DWORD *)(v10 + 8) + 1;
    goto LABEL_69;
  }

      uint64_t v57 = 0xFFFFFFFFLL;
      if (a2)
      {
        if (v56)
        {
          uint64_t v56 = v56;
          *a2 = v56;
        }
      }

      goto LABEL_60;
    }
  }

  unint64_t v52 = *__error();
  v50 = *__error();
  if (v52 != 9)
  {
    _os_assumes_log();
    goto LABEL_46;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v50;
  __break(1u);
LABEL_123:
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v50;
  __break(1u);
LABEL_124:
  v108 = *__error();
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v108;
  __break(1u);
LABEL_125:
  v109 = *__error();
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v109;
  __break(1u);
LABEL_126:
  uint64_t result = __error();
  v110 = *result;
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v110;
  __break(1u);
  return result;
}

    ++v42;
    v45 += 64;
  }

  while (v16 != v42);
  free(v22);
  if (!*((void *)&v85[0] + 1))
  {
    munmap(v72, v73);
    if (a2)
    {
      int v5 = 0LL;
      uint64_t v6 = 1008;
      goto LABEL_68;
    }

    return 0LL;
  }

  if (ctf_sect_mmap(v85, a1) == (char *)-1LL)
  {
    munmap(v72, v73);
    if (!a2) {
      return 0LL;
    }
LABEL_74:
    int v5 = 0LL;
    uint64_t v6 = 1013;
    goto LABEL_68;
  }

  if (v41 && v75)
  {
    if (ctf_sect_mmap(&v81, a1) != (char *)-1LL && ctf_sect_mmap(&v77, a1) != (char *)-1LL)
    {
      unint64_t v67 = &v81;
      unint64_t v68 = &v77;
      goto LABEL_78;
    }

    if (a2) {
      *a2 = 1013;
    }
LABEL_82:
    ctf_sect_munmap((uint64_t)v85);
    ctf_sect_munmap((uint64_t)&v81);
    ctf_sect_munmap((uint64_t)&v77);
    int v5 = 0LL;
  }

  else
  {
    unint64_t v67 = 0LL;
    unint64_t v68 = 0LL;
LABEL_78:
    v71 = ctf_bufopen((uint64_t)v85, (uint64_t)v67, (uint64_t)v68, a2, v63, v64, v65, v66);
    int v5 = v71;
    if (!v71) {
      goto LABEL_82;
    }
    *(_DWORD *)(v71 + 556) |= 1u;
  }

  unint64_t v13 = v72;
  unsigned __int16 v14 = v73;
LABEL_18:
  munmap(v13, v14);
  return v5;
}

uint64_t _timesync_db_openat(int a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  int v4 = (void *)_os_trace_zalloc();
  int v5 = openat(a1, a2, 0);
  *(_DWORD *)int v4 = v5;
  if (v5 == -1)
  {
    __error();
    _os_assumes_log();
  }

  else
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2000000000LL;
    int v22 = 0;
    uint64_t v15 = 0LL;
    unint64_t v16 = &v15;
    uint64_t v17 = 0x2000000000LL;
    uint64_t v18 = -1LL;
    uint64_t v11 = 0LL;
    unsigned int v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    void v10[2] = ___timesync_tidy_and_count_files_block_invoke;
    v10[3] = &unk_189F0E1D8;
    v10[4] = &v19;
    v10[5] = &v15;
    v10[6] = &v11;
    _timesync_foreach_reg_file_at(v5, (uint64_t)v10);
    int v6 = *((_DWORD *)v20 + 6);
    if (v6 >= 1)
    {
      v4[1] = v16[3];
      void v4[2] = v12[3];
    }

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }

  int v7 = *__error();
  if ((*(_DWORD *)v4 & 0x80000000) != 0 || close(*(_DWORD *)v4) != -1)
  {
LABEL_10:
    free(v4);
    int v4 = 0LL;
    *__error() = v7;
    return (uint64_t)v4;
  }

  int v9 = *__error();
  uint64_t result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log();
    goto LABEL_10;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_reset(uint64_t a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  _timesync_munmap_file(a1);
  *(void *)(a1 + 24) = *(void *)(a1 + 8);
  while ((_timesync_mmap_file((void *)a1) & 0x80000000) != 0)
  {
    unint64_t v2 = *(void *)(a1 + 16);
    unint64_t v3 = *(void *)(a1 + 24) + 1LL;
    *(void *)(a1 + 24) = v3;
    if (v3 > v2) {
      return 0xFFFFFFFFLL;
    }
  }

  _timesync_process_boot_entry(a1);
  v6[0] = *(void *)(a1 + 32);
  entry = _timesync_next_entry(*(unsigned __int16 **)(a1 + 48), v6);
  uint64_t result = 0LL;
  *(void *)(a1 + 48) = entry;
  return result;
}

uint64_t _timesync_munmap_file(uint64_t a1)
{
  unint64_t v3 = (void *)(a1 + 40);
  uint64_t result = *(void *)(a1 + 40);
  if ((unint64_t)(result + 1) >= 2)
  {
    uint64_t result = munmap((void *)result, *(void *)(a1 + 32));
    if ((_DWORD)result == -1)
    {
      __error();
      uint64_t result = _os_assumes_log();
    }

    *unint64_t v3 = 0LL;
    v3[1] = 0LL;
  }

  return result;
}

uint64_t _timesync_mmap_file(void *a1)
{
  v7[3] = *MEMORY[0x1895F89C0];
  memset(v7, 170, 18);
  uint64_t v5 = a1[3];
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v5);
  unint64_t v2 = (unsigned __int16 *)_os_trace_mmap_at();
  a1[5] = v2;
  if (!v2)
  {
    if (*__error()) {
      _os_assumes_log();
    }
    return 0xFFFFFFFFLL;
  }

  if ((uint64_t)a1[4] < 80 || *v2 != 48048 || v2[1] != 48 || v2[24] != 29524 || v2[25] != 32)
  {
    _timesync_munmap_file((uint64_t)a1);
    a1[5] = 0LL;
    return 0xFFFFFFFFLL;
  }

  uint64_t v3 = 0LL;
  a1[6] = v2;
  return v3;
}

uint64_t _timesync_process_boot_entry(uint64_t result)
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
      *(_OWORD *)(result + 120) = *(_OWORD *)(result + 88);
      return result;
    }
  }

  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

char *_timesync_next_entry(unsigned __int16 *a1, void *a2)
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

LABEL_17:
      _os_assumes_log();
      return 0LL;
    }

    if (a1[1] != 88) {
      goto LABEL_17;
    }
    uint64_t v3 = 88LL;
  }

    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_18C695DD0 = a2;
    __break(1u);
    return result;
  }

  int v7 = -1LL;
  if (a2 != 19) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t result = snprintf(__str, __size, "dsc");
LABEL_10:
  if (v7 == -1) {
    return result;
  }
  unint64_t v8 = (int)result + 1LL;
  if (v8 + 2 * (16 - v7) >= __size)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_18C695DD0 = __size;
    __break(1u);
    goto LABEL_17;
  }

  __str[(int)result] = 47;
  int v9 = &__str[v8];
  do
  {
    *int v9 = a0123456789abcd_0[(unint64_t)*(unsigned __int8 *)(v6 + v7) >> 4];
    v9[1] = a0123456789abcd_0[*(_BYTE *)(v6 + v7) & 0xF];
    v9 += 2;
    ++v7;
  }

  while (v7 != 16);
  *int v9 = 0;
  return result;
}

    unint64_t v8 = 0LL;
    goto LABEL_27;
  }

  int v7 = [v5 devType];
  if (v7 == 2)
  {
    if ([v6 isEqualToString:@"DeviceName"])
    {
      [v5 simDev];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 name];
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if ([v6 isEqualToString:@"UniqueDeviceID"])
      {
        [v5 simDev];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 UDID];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 UUIDString];
      }

      else
      {
        if ([v6 isEqualToString:@"ProductType"])
        {
          [v5 simDev];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 deviceType];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          [v5 simDev];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 runtime];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v14 = v16;
        uint64_t v15 = [v16 name];
      }

      unint64_t v8 = (void *)v15;
    }

    goto LABEL_27;
  }

  if (v7 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = 134217984;
      uint64_t v19 = [v5 devType];
      int v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v11 = "Unknown logging device type %ld";
      unsigned int v12 = 12;
      goto LABEL_16;
    }

    goto LABEL_17;
  }

  [v5 mobileDeviceRef];
  if (_logdev_mobdev_vtable_onceToken != -1) {
    dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2509);
  }
  unint64_t v8 = 0LL;
  int v9 = &_logdev_mobdev_vtable_vtab;
  if (!_logdev_mobdev_vtable_valid) {
    int v9 = 0LL;
  }
  mobdevtab = (uint64_t)v9;
  if (_logdev_mobdev_vtable_valid) {
    unint64_t v8 = (void *)off_18C695FA0();
  }
LABEL_27:

  return v8;
}

  int v7 = (void *)MEMORY[0x186E40118]();
  unint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v7);
  return v8 != 0;
}

        *uint64_t v3 = 0LL;
        *(void *)(a3 + 24) = 0LL;
        goto LABEL_18;
      }

      uint64_t v18 = (unsigned __int16)(4096 - v17);
      *uint64_t v3 = (char *)v7 + v15;
LABEL_45:
      *(void *)(a3 + 24) = v18;
LABEL_18:
      *(void *)(a3 + 8) = v7;
      *(void *)(a3 + 32) = 0LL;
      if ((v4 - 24577) < 4)
      {
        if (a2) {
          *(void *)(a3 + 32) = _os_procinfo_map_lookup(*(void **)(a2 + 40), *((void *)a1 + 2), a1[6]);
        }
        return 1LL;
      }

      if (v4 == 24592)
      {
        unint64_t v16 = 0;
        goto LABEL_31;
      }

      int v10 = 0LL;
      if (v4 == 24588)
      {
        unint64_t v16 = *((unsigned __int8 *)a1 + 29);
LABEL_31:
        if (a2)
        {
          uint64_t v19 = *(void *)(a2 + 40);
          if (v19)
          {
            uint64_t v20 = (void *)(v19 + 16);
            while (1)
            {
              uint64_t v20 = (void *)*v20;
              if (!v20) {
                break;
              }
              if (v20[2] == *((void *)a1 + 2))
              {
                uint64_t v21 = v20[4];
                *(void *)(a3 + 32) = v21;
                if (v21) {
                  int v22 = v16 == 0;
                }
                else {
                  int v22 = 1;
                }
                if (!v22)
                {
                  uint64_t v23 = *(__int16 *)(v21 + 2);
                  if (v23 < 0)
                  {
                    unint64_t v25 = v23 & 0x7FFF;
                    *(_WORD *)(v21 + 2) = v25;
                    if (v16 == 4) {
                      *(_WORD *)(v21 + 2) = v25 | 1;
                    }
                  }
                }

                return 1LL;
              }
            }
          }
        }

        return 1LL;
      }

      return v10;
  }
}

    unint64_t v25 = __error();
    _OSLogFailWithPOSIXError((id)*v25, a5);

    goto LABEL_18;
  }

  uint64_t v17 = objc_alloc(MEMORY[0x189603F48]);
  uint64_t v18 = (void *)[v17 initWithBytesNoCopy:v16 length:v41 freeWhenDone:0];
  [MEMORY[0x1896079E8] propertyListWithData:v18 options:0 format:0 error:a5];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  munmap(v16, v41);
  if (v19)
  {
    [v19 objectForKeyedSubscript:@"OSArchiveVersion"];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v20 == 0LL;

    if (!v21)
    {
      [v19 objectForKeyedSubscript:@"OSArchiveVersion"];
      int v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_version = [v22 integerValue];

      [v19 objectForKeyedSubscript:@"EndTimeRef"];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_hasEndTimeRef = v23 != 0LL;

LABEL_29:
      version = v11->_version;
      uint64_t v35 = 1LL;
      if (version)
      {
        uint64_t v36 = 2LL;
        uint64_t v37 = 3LL;
        if (version >= 5) {
          uint64_t v37 = 0LL;
        }
        if (version != -1) {
          uint64_t v36 = v37;
        }
        else {
          uint64_t v38 = 1LL;
        }
        if (version != 5) {
          uint64_t v35 = v38;
        }
      }

      v11->_state = v35;
      goto LABEL_40;
    }
  }

  _OSLogFailWithPOSIXError((id)0x16, a5);

LABEL_18:
  uint64_t v26 = 0LL;
LABEL_41:

  return v26;
}

    int v22 = "<compose failure [corrupt trace]>";
    return strdup(v22);
  }

  int v10 = *(char **)(a1 + 88);
  if (!v10)
  {
    uint64_t v11 = _os_log_resolve_format(*(__n128 **)(a1 + 24), *(void *)a1, *(void *)(a1 + 72), &v14);
    if (!v11)
    {
      uint64_t v5 = v14;
      return strdup(v5);
    }

    int v10 = (char *)v11;
    *(void *)(a1 + 88) = v11;
    uint64_t v4 = *(void *)(a1 + 120);
  }

  if ((*(_DWORD *)(a1 + 80) & 1) != 0) {
    unsigned int v12 = 4LL;
  }
  else {
    unsigned int v12 = 8LL;
  }
  os_log_fmt_compose((size_t)v15, v10, 2LL, 3u, v12, v2, v7, (unsigned __int16)v3, *(void *)(a1 + 112), v4, 0LL);
  uint64_t v13 = v17;
  uint64_t result = (char *)v15[0];
  v15[0] = 3954044928LL;
  uint64_t v17 = 0;
  if ((v13 & 1) == 0) {
    return (char *)_os_trace_memdup();
  }
  return result;
}

        *uint64_t v4 = 0LL;
        *(void *)(a3 + 24) = 0LL;
        goto LABEL_18;
      }

      uint64_t v18 = (unsigned __int16)(4096 - v17);
      *uint64_t v4 = (char *)v8 + v15;
LABEL_46:
      *(void *)(a3 + 24) = v18;
LABEL_18:
      *(void *)(a3 + 8) = v8;
      *(void *)(a3 + 32) = 0LL;
      if ((v5 - 24577) >= 4)
      {
        if (v5 == 24592)
        {
          unint64_t v16 = 0;
        }

        else
        {
          if (v5 != 24588) {
            return result;
          }
          unint64_t v16 = *((unsigned __int8 *)result + 29);
        }

        if (a2)
        {
          uint64_t v19 = *(void *)(a2 + 40);
          if (v19)
          {
            uint64_t v20 = (void *)(v19 + 16);
            while (1)
            {
              uint64_t v20 = (void *)*v20;
              if (!v20) {
                break;
              }
              if (v20[2] == result[2])
              {
                uint64_t v21 = v20[4];
                *(void *)(a3 + 32) = v21;
                if (v21) {
                  int v22 = v16 == 0;
                }
                else {
                  int v22 = 1;
                }
                if (!v22)
                {
                  uint64_t v23 = *(__int16 *)(v21 + 2);
                  if (v23 < 0)
                  {
                    unint64_t v24 = v23 & 0x7FFF;
                    *(_WORD *)(v21 + 2) = v24;
                    if (v16 == 4) {
                      *(_WORD *)(v21 + 2) = v24 | 1;
                    }
                  }
                }

                return result;
              }
            }
          }
        }
      }

      else if (a2)
      {
        uint64_t result = _os_procinfo_map_lookup(*(void **)(a2 + 40), result[2], *((_DWORD *)result + 6));
        *(void *)(a3 + 32) = result;
      }

      return result;
  }

LABEL_13:
  uint64_t v4 = *a2 - v3;
  *a2 = v4;
  uint64_t v5 = (char *)a1 + v3;
  if (v4 >= 1) {
    return v5;
  }
  else {
    return 0LL;
  }
}

  char *v6 = 0;
  if ((v3 & 8) == 0) {
    return result;
  }
LABEL_14:
  if ((v3 & 4) != 0 || (v3 & 0x10) == 0 && *(_BYTE *)(result + 10) != 18)
  {
    if (*a2)
    {
      int v10 = *a3;
      --*a2;
      uint64_t v11 = (int *)(v10 + 2);
      *a3 = &v10[v10[1] + 2];
      unsigned int v12 = (int *)(result + 24);
      if (v10[1] == 4)
      {
        uint64_t v13 = *v10;
        if (v13 < 0x10 || (v13 & 0xF0) == 16)
        {
          uint64_t v15 = *v11;
LABEL_31:
          *unsigned int v12 = v15;
          return result;
        }
      }
    }

    else
    {
      unsigned int v12 = (int *)(result + 24);
    }

    uint64_t v15 = -1;
    goto LABEL_31;
  }

  if (*a2)
  {
    int v9 = *a3;
    if ((**a3 & 0xF0) == 0x10)
    {
      --*a2;
      *a3 = &v9[v9[1] + 2];
    }
  }

  *(_WORD *)(result + 8) = v3 & 0xFFF7;
  return result;
}

  uint64_t result = _parse_location((void *)a1, a2, &v28);
  if (!(_DWORD)result) {
    return result;
  }
  LOWORD(v13) = v28;
  if ((*(_WORD *)(a2 + 2) & 0x200) != 0)
  {
    LOWORD(v13) = v28 + 2;
    uint64_t v14 = v4[11];
    unint64_t v29 = *(_WORD *)(a2 + v28 + 24);
    uint64_t v15 = hashtable_lookup(*(void *)(v14 + 64), (uint64_t)&v29);
    if (v15)
    {
      *(void *)(a1 + 248) = *(void *)(v15 + 8);
      *(void *)(a1 + 256) = *(void *)(v15 + 16);
    }
  }

  if ((*(_WORD *)(a2 + 2) & 0x400) != 0)
  {
    unint64_t v16 = (unsigned __int16)v13;
    LOWORD(v13) = v13 + 1;
    *(_BYTE *)(a1 + 268) = *(_BYTE *)(a2 + v16 + 24);
  }

  if (*(_BYTE *)a2 == 6)
  {
    uint64_t v17 = (unsigned __int16)v13;
    uint64_t v13 = (unsigned __int16)v13 + 8LL;
    uint64_t v18 = a2 + 24;
    uint64_t v19 = *(void *)(a2 + 24 + v17);
    *(_BYTE *)(a1 + 271) = *(_BYTE *)(a2 + 1) & 0x3F;
    *(_BYTE *)(a1 + 270) = *(_BYTE *)(a2 + 1) & 0xC0;
    *(void *)(a1 + 272) = v19;
    *(void *)(a1 + 8) = 1536LL;
    if (*(__int16 *)(a2 + 2) < 0)
    {
      uint64_t v20 = (unsigned __int16)v13;
      uint64_t v13 = (unsigned __int16)v13 + 4LL;
      uint64_t v21 = *(void *)(a2 + 16);
      if (v13 > HIWORD(v21)) {
        return 0LL;
      }
      int v22 = *(_DWORD *)(v18 + v20);
      if ((*(_WORD *)(a2 + 2) & 0x20) != 0)
      {
        unint64_t v24 = HIWORD(v21);
        unint64_t v25 = (unsigned __int16)v13;
        uint64_t v13 = (unsigned __int16)v13 + 2LL;
        if (v13 > v24) {
          return 0LL;
        }
        uint64_t v23 = (unint64_t)*(unsigned __int16 *)(v18 + v25) << 31;
      }

      else
      {
        uint64_t v23 = 0LL;
      }

      uint64_t v26 = v23 | v22 & 0x7FFFFFFF;
      if (v22 < 0) {
        v26 |= 0x8000000000000000LL;
      }
      *(void *)(a1 + 280) = v26;
    }
  }

  if ((*(_WORD *)(a2 + 2) & 0x800) == 0) {
    goto LABEL_35;
  }
  unint64_t v27 = (unsigned __int16)v13;
  uint64_t v13 = (unsigned __int16)v13 + 4LL;
  *(_DWORD *)(a1 + 264) = *(_DWORD *)(a2 + v27 + 24);
LABEL_35:
  *(void *)(a1 + 192) = a2 + (unsigned __int16)v13 + 24;
  *(void *)(a1 + 200) = *(unsigned __int16 *)(a2 + 22) - (unint64_t)(unsigned __int16)v13;
  uint64_t result = 1LL;
  if ((*(_WORD *)(a2 + 2) & 0x1000) != 0) {
    *(_BYTE *)(a1 + 296) = 1;
  }
  return result;
}

      goto LABEL_14;
    default:
      int v7 = &stru_189F108F0;
      goto LABEL_14;
  }

  uint64_t v13 = v5;
LABEL_16:

  return v13;
}

      uint64_t v5 = 0LL;
      goto LABEL_14;
    }
  }

  return 0LL;
}

uint64_t _timesync_db_open(const char *a1)
{
  return _timesync_db_openat(-2, a1);
}

uint64_t _timesync_db_dup(int *a1)
{
  return _timesync_db_openat(*a1, ".");
}

uint64_t _timesync_advance_boot(void *a1)
{
  unint64_t v1 = (unsigned __int16 *)a1[6];
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = a1[8];
  uint64_t v4 = a1[9];
  while (*v1 != 48048 || *((void *)v1 + 1) == v3 && *((void *)v1 + 2) == v4)
  {
    _timesync_advance((uint64_t)a1);
    unint64_t v1 = (unsigned __int16 *)a1[6];
    if (!v1) {
      return 0xFFFFFFFFLL;
    }
  }

  _timesync_advance((uint64_t)a1);
  return 0LL;
}

uint64_t _timesync_advance(uint64_t result)
{
  v8[1] = *MEMORY[0x1895F89C0];
  unint64_t v1 = *(unsigned __int16 **)(result + 48);
  if (!v1) {
    return result;
  }
  unsigned int v2 = (void *)result;
  if (*v1 == 48048)
  {
    _timesync_process_boot_entry(result);
    uint64_t v3 = (unsigned __int16 *)v2[6];
  }

  else
  {
    __int128 v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 120) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    uint64_t v3 = v1;
  }

  v8[0] = v2[4] - (void)v3 + v2[5];
  while (1)
  {
    uint64_t result = (uint64_t)_timesync_next_entry(v1, v8);
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

  uint64_t result = _timesync_munmap_file((uint64_t)v2);
  unint64_t v5 = v2[2];
  unint64_t v6 = v2[3] + 1LL;
  v2[3] = v6;
  if (v6 <= v5)
  {
    uint64_t result = _timesync_mmap_file(v2);
    if ((result & 0x80000000) == 0)
    {
      unint64_t v1 = (unsigned __int16 *)v2[6];
      v8[0] = v2[4];
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

uint64_t _timesync_mach_timebase(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 80);
  return result;
}

unint64_t _timesync_continuous_to_wall_time(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  if (*a2 != *(void *)(a1 + 64) || a2[1] != *(void *)(a1 + 72)) {
    goto LABEL_8;
  }
  unint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9 && *(_WORD *)v9 == 29524)
  {
    if (v8 > a3 || *(void *)(v9 + 8) <= a3)
    {
LABEL_7:
      if (v8 <= a3) {
        return _timesync_advance_and_calculate(a1, a3, a4);
      }
LABEL_8:
      _timesync_reset(a1);
      while (*a2 != *(void *)(a1 + 64) || a2[1] != *(void *)(a1 + 72))
      {
      }

      return _timesync_advance_and_calculate(a1, a3, a4);
    }
  }

  else if (v8 > a3)
  {
    goto LABEL_7;
  }

  if (a4)
  {
    *a4 = *(void *)(a1 + 128);
    unint64_t v8 = *(void *)(a1 + 112);
  }

  return (a3 - v8) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(void *)(a1 + 120);
}

unint64_t _timesync_advance_and_calculate(uint64_t a1, unint64_t a2, void *a3)
{
  while (1)
  {
    unint64_t v6 = *(void *)(a1 + 112);
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      if (*(_WORD *)v7 == 29524) {
        break;
      }
    }

    if (v6 <= a2) {
      goto LABEL_8;
    }
LABEL_7:
    _timesync_advance(a1);
  }

  if (v6 > a2 || *(void *)(v7 + 8) <= a2) {
    goto LABEL_7;
  }
LABEL_8:
  if (a3)
  {
    *a3 = *(void *)(a1 + 128);
    unint64_t v6 = *(void *)(a1 + 112);
  }

  return (a2 - v6) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(void *)(a1 + 120);
}

unint64_t _timesync_wall_time_to_continuous( uint64_t a1, unint64_t a2, unint64_t a3, _OWORD *a4)
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  *a4 = *(_OWORD *)_timesync_range_find_startboot(a1, a2, a3, v5);
  return v5[0];
}

uint64_t _timesync_range_find_startboot( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  if (a2 - 1 >= a3) {
    a3 = -1LL;
  }
  for (unint64_t i = *(unsigned __int16 **)(a1 + 48); i; unint64_t i = *(unsigned __int16 **)(a1 + 48))
  {
    unint64_t v9 = *(void *)(a1 + 120);
    if (v9 <= a3)
    {
      if (v9 > a2) {
        break;
      }
      if (*i != 48048)
      {
        unint64_t v10 = (*((void *)i + 1) - *(void *)(a1 + 112))
            * (unint64_t)*(unsigned int *)(a1 + 80)
LABEL_10:
        if (v10 > a2) {
          break;
        }
        goto LABEL_11;
      }

      unint64_t v10 = *((void *)i + 4);
      if (v10 <= a3) {
        goto LABEL_10;
      }
    }

LABEL_11:
    _timesync_advance(a1);
  }

  unint64_t v11 = *(void *)(a1 + 120);
  BOOL v12 = a2 >= v11;
  unint64_t v13 = a2 - v11;
  if (v12) {
    unint64_t v14 = *(void *)(a1 + 112) + v13 * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  }
  else {
    unint64_t v14 = *(void *)(a1 + 112);
  }
  *a4 = v14;
  return a1 + 64;
}

  unint64_t v10 = v4 + 8;
  *(void *)(a1 + 56) = *(void *)(a2 + v4 + 24);
  uint64_t result = _parse_location((void *)a1, a2, &v10);
  if ((_DWORD)result)
  {
    unint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      unint64_t v9 = *(void *)(a1 + 64);
      if (v9)
      {
        if (*(_BYTE *)(a1 + 365)) {
          _os_activity_map_insert((void **)(a1 + 320), v8, v9);
        }
      }
    }

    else
    {
      *(void *)(a1 + 176) = "Default/remote activity";
    }

    return 1LL;
  }

  return result;
}
}

    uint64_t v15 = (unsigned int *)(a1 + 32);
    if (v5) {
      uint64_t v15 = (unsigned int *)(a1 + 36);
    }
    return *v15;
  }

  return 0LL;
}

  [v6[3] firstObject];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = v11;
  if (!v11) {
    goto LABEL_18;
  }
  if ((a2 & 8) != 0)
  {
    if ([v11 endTime] < v7) {
      goto LABEL_18;
    }
    unint64_t v13 = [v12 endTime];
  }

  else
  {
    if ([v11 oldestTime] > v7) {
      goto LABEL_18;
    }
    unint64_t v13 = [v12 oldestTime];
  }

  uint64_t v7 = v13;
LABEL_18:
  [v6[4] firstObject];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_29;
  }
  if ((a2 & 8) != 0)
  {
    if ([v14 endTime] < v7) {
      goto LABEL_29;
    }
  }

  else if ([v14 oldestTime] > v7)
  {
    goto LABEL_29;
  }

  unint64_t v16 = (void *)[v15 bootUUID];
  if (*v16 == *a3 && v16[1] == a3[1])
  {
    if ((a2 & 8) != 0) {
      uint64_t v17 = [v15 endTime];
    }
    else {
      uint64_t v17 = [v15 oldestTime];
    }
    uint64_t v7 = v17;
  }

LABEL_12:
  }

  return v6;
}

  return v6;
}

  return v6;
}

  return v8;
}

  BOOL v12 = v6 + 8;
  *(void *)(a1 + 40) = *(void *)(a2 + v6 + 24);
  uint64_t result = _chunk_support_parse_location(a2, &v12, a1 + 56, a3);
  if ((_DWORD)result)
  {
    unint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      unint64_t v11 = *(void *)(a1 + 48);
      if (v11) {
        _os_activity_map_insert((void **)(a3 + 8), v10, v11);
      }
    }

    else
    {
      *(void *)(a1 + 144) = "Default/remote activity";
    }

    return 1LL;
  }

  return result;
}

      __int128 v4 = 0;
      goto LABEL_12;
    }
  }

  return 0;
}

void _timesync_db_close(int *a1)
{
  if (close(*a1) != -1) {
    goto LABEL_2;
  }
  int v2 = *__error();
  uint64_t v3 = *__error();
  if (v2 != 9)
  {
    _os_assumes_log();
LABEL_2:
    free(a1);
    return;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v3;
  __break(1u);
}

void **_timesync_range_create(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return _timesync_range_create_impl(a1, a2, a3, 0);
}

void **_timesync_range_create_impl(uint64_t a1, unint64_t a2, unint64_t a3, int a4)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  unint64_t v8 = (unint64_t *)_os_trace_zalloc();
  *(_OWORD *)(v8 + 1) = xmmword_1869D9100;
  unint64_t v9 = operator new(0x28uLL);
  *unint64_t v9 = 0u;
  v9[1] = 0u;
  *((_DWORD *)v9 + 8) = 1065353216;
  *unint64_t v8 = (unint64_t)v9;
  startboot = (uint64_t *)_timesync_range_find_startboot(a1, a2, a3, v8 + 1);
  uint64_t v11 = 1LL;
  _os_trace_uuid_map_insert((float *)*v8, startboot, 1LL);
  uint64_t v12 = *startboot;
  uint64_t v13 = startboot[1];
  unint64_t v14 = *(void *)(a1 + 112) + (a3 - *(void *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  void v8[2] = v14;
  if (*(void *)(a1 + 48))
  {
    uint64_t v11 = 1LL;
    do
    {
      _timesync_advance(a1);
      unint64_t v15 = *(void *)(a1 + 120);
      if (*(void *)(a1 + 64) != v12 || *(void *)(a1 + 72) != v13)
      {
        unint64_t v16 = (float *)*v8;
        if (*v8) {
          uint64_t v17 = *((void *)v16 + 3);
        }
        else {
          uint64_t v17 = 0LL;
        }
        uint64_t v12 = *(void *)(a1 + 64);
        uint64_t v13 = *(void *)(a1 + 72);
      }

      if (v15 <= a3)
      {
        uint64_t v18 = _os_trace_uuid_map_lookup((void *)*v8, (void *)(a1 + 64));
        if (v18) {
          uint64_t v11 = v18;
        }
        unint64_t v19 = *(void *)(a1 + 112)
            + (a3 - *(void *)(a1 + 120)) * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
        void v8[2] = v19;
      }
    }

    while (*(void *)(a1 + 48));
  }

  if (a3 != -1LL && a4 && v14 > v8[2])
  {
    fwrite( "Wall Clock adjustment detected - results might be strange while using --end\n",  0x4CuLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
    void v8[2] = v14;
  }

  uint64_t v20 = (void **)_os_trace_realloc();
  uint64_t v21 = *v20;
  uint64_t v22 = MEMORY[0x1895F87A8];
  v42[0] = MEMORY[0x1895F87A8];
  v42[1] = 0x40000000LL;
  uint64_t v43 = ___timesync_range_create_impl_block_invoke;
  unint64_t v44 = &__block_descriptor_tmp_17;
  uint64_t v45 = v11;
  uint64_t v23 = (void *)v21[2];
  if (v23)
  {
    while (1)
    {
      BOOL v24 = v43((uint64_t)v42, (uint64_t)(v23 + 2), v23[4]);
      unint64_t v25 = (void *)*v23;
      if (!v24) {
        break;
      }
LABEL_50:
      uint64_t v23 = v25;
      if (!v25) {
        goto LABEL_51;
      }
    }

    int8x8_t v26 = (int8x8_t)v21[1];
    unint64_t v27 = v23[1];
    uint8x8_t v28 = (uint8x8_t)vcnt_s8(v26);
    v28.i16[0] = vaddlv_u8(v28);
    if (v28.u32[0] > 1uLL)
    {
      if (v27 >= *(void *)&v26) {
        v27 %= *(void *)&v26;
      }
    }

    else
    {
      v27 &= *(void *)&v26 - 1LL;
    }

    unint64_t v29 = *(void **)(*v21 + 8 * v27);
    do
    {
      unint64_t v30 = v29;
      unint64_t v29 = (void *)*v29;
    }

    while (v29 != v23);
    if (v30 == v21 + 2) {
      goto LABEL_56;
    }
    unint64_t v31 = v30[1];
    if (v28.u32[0] > 1uLL)
    {
      if (v31 >= *(void *)&v26) {
        v31 %= *(void *)&v26;
      }
    }

    else
    {
      v31 &= *(void *)&v26 - 1LL;
    }

    uint64_t v32 = (void *)*v23;
    if (v31 != v27)
    {
LABEL_56:
      if (v25)
      {
        unint64_t v33 = v25[1];
        if (v28.u32[0] > 1uLL)
        {
          if (v33 >= *(void *)&v26) {
            v33 %= *(void *)&v26;
          }
        }

        else
        {
          v33 &= *(void *)&v26 - 1LL;
        }

        uint64_t v32 = (void *)*v23;
        if (v33 == v27) {
          goto LABEL_43;
        }
      }

      *(void *)(*v21 + 8 * v27) = 0LL;
      uint64_t v32 = (void *)*v23;
    }

    if (!v32)
    {
LABEL_49:
      void *v30 = v32;
      --v21[3];
      operator delete(v23);
      goto LABEL_50;
    }

LABEL_51:
  uint64_t v35 = *v20;
  v38[0] = v22;
  v38[1] = 0x40000000LL;
  unint64_t v39 = ___timesync_range_create_impl_block_invoke_2;
  unint64_t v40 = &__block_descriptor_tmp_19;
  unint64_t v41 = v20;
  for (unint64_t i = (__n128 *)v35[2]; i; unint64_t i = (__n128 *)i->n128_u64[0])
    v39((uint64_t)v38, i + 1, i[2].n128_i64[0]);
  _timesync_reset(a1);
  return v20;
}

BOOL ___timesync_range_create_impl_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(void *)(a1 + 32) >= a3;
}

__n128 ___timesync_range_create_impl_block_invoke_2(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

void **_timesync_range_create_true_max(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return _timesync_range_create_impl(a1, a2, a3, 1);
}

uint64_t _timesync_range_create_since_last_boot(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _os_trace_zalloc();
  *(_OWORD *)(v4 + 8) = xmmword_1869D9100;
  unint64_t v5 = operator new(0x28uLL);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  *((_DWORD *)v5 + 8) = 1065353216;
  *(void *)uint64_t v4 = v5;
  _timesync_reset(a1);
  unint64_t v6 = 0LL;
  uint64_t v7 = (_OWORD *)(v4 + 24);
  unint64_t v8 = (_OWORD *)(a1 + 64);
  do
  {
    if (*(void *)v7 != *(void *)v8 || *(void *)(v4 + 32) != *(void *)(a1 + 72))
    {
      *uint64_t v7 = *v8;
      unint64_t v6 = (unsigned int *)(a1 + 80);
    }

    _timesync_advance(a1);
  }

  while (*(void *)(a1 + 48));
  if (v6) {
    unint64_t v9 = (unint64_t)v6[1] * a2 / *v6;
  }
  else {
    unint64_t v9 = 0LL;
  }
  *(void *)(v4 + 8) = v9;
  *(void *)(v4 + 16) = -1LL;
  _os_trace_uuid_map_insert(*(float **)v4, (uint64_t *)(v4 + 24), 1LL);
  _timesync_reset(a1);
  return v4;
}

uint64_t _timesync_range_copy(char *a1)
{
  if (*(void *)a1) {
    uint64_t v2 = *(void *)(*(void *)a1 + 24LL);
  }
  else {
    uint64_t v2 = 0LL;
  }
  uint64_t v3 = _os_trace_zalloc();
  *(_OWORD *)(v3 + 8) = xmmword_1869D9100;
  uint64_t v4 = operator new(0x28uLL);
  *uint64_t v4 = 0u;
  v4[1] = 0u;
  *((_DWORD *)v4 + 8) = 1065353216;
  *(void *)(v3 + 16) = *((void *)a1 + 2);
  uint64_t v5 = *((void *)a1 + 1);
  *(void *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = v5;
  unint64_t v6 = a1 + 24;
  memcpy((void *)(v3 + 24), v6, 16 * v2);
  if (v2)
  {
    uint64_t v7 = 0LL;
    do
    {
      _os_trace_uuid_map_insert(*(float **)v3, (uint64_t *)v6, ++v7);
      v6 += 16;
    }

    while (v2 != v7);
  }

  return v3;
}

uint64_t _timesync_range_count(uint64_t a1)
{
  if (*(void *)a1) {
    return *(void *)(*(void *)a1 + 24LL);
  }
  else {
    return 0LL;
  }
}

unint64_t _timesync_range_contains(uint64_t *a1, void *a2, unint64_t a3)
{
  uint64_t v5 = (void *)*a1;
  unint64_t result = _os_trace_uuid_map_lookup((void *)*a1, a2);
  if (result)
  {
    if (v5) {
      unint64_t v7 = v5[3];
    }
    else {
      unint64_t v7 = 0LL;
    }
    return result == 1 && a1[1] <= a3 || v7 == result && a1[2] >= a3 || result > 1 && v7 > result;
  }

  return result;
}

char *_timesync_range_intersect(char *result, void *a2, float *a3, void *a4, float *a5)
{
  unint64_t v8 = (float **)result;
  unint64_t v9 = *(void ***)result;
  if (*(void *)result)
  {
    unint64_t v10 = (char *)v9[3];
    if (!a2) {
      goto LABEL_10;
    }
  }

  else
  {
    unint64_t v10 = 0LL;
    if (!a2)
    {
LABEL_10:
      uint64_t v11 = 0LL;
      goto LABEL_11;
    }
  }

  unint64_t result = (char *)_os_trace_uuid_map_lookup(*(void **)result, a2);
  if (!result) {
    goto LABEL_10;
  }
  uint64_t v11 = result - 1;
  v8[1] = a3;
LABEL_11:
  uint64_t v12 = v10;
  if (a4)
  {
    unint64_t result = (char *)_os_trace_uuid_map_lookup(v9, a4);
    uint64_t v12 = v10;
    if (result)
    {
      if (v10 == result && v8[2] < a5) {
        a5 = v8[2];
      }
      void v8[2] = a5;
      uint64_t v12 = result;
    }
  }

  if (v11 || v12 != v10)
  {
    if (v12 <= v11)
    {
      if (v9) {
        size_t v16 = 16LL * (void)v9[3];
      }
      else {
        size_t v16 = 0LL;
      }
      v8[1] = 0LL;
      void v8[2] = 0LL;
      bzero(v8 + 3, v16);
      return (char *)_os_trace_uuid_map_clear(v9);
    }

    else
    {
      uint64_t v13 = v12;
      if (v11)
      {
        memmove(v8 + 3, &v8[2 * (void)v11 + 3], 16 * (v12 - v11));
        uint64_t v13 = (char *)(v12 - v11);
      }

      _os_trace_uuid_map_destroy(v9);
      unint64_t result = (char *)operator new(0x28uLL);
      *(_OWORD *)unint64_t result = 0u;
      *((_OWORD *)result + 1) = 0u;
      *((_DWORD *)result + 8) = 1065353216;
      *unint64_t v8 = (float *)result;
      if (v12 != v11)
      {
        unint64_t v14 = 0LL;
        unint64_t v15 = (uint64_t *)(v8 + 3);
        do
        {
          unint64_t result = (char *)_os_trace_uuid_map_insert(*v8, v15, (uint64_t)++v14);
          v15 += 2;
        }

        while (v13 != v14);
      }
    }
  }

  return result;
}

uint64_t _timesync_range_compare( void **a1, void *a2, unint64_t a3, void *a4, unint64_t a5)
{
  unint64_t v9 = *a1;
  unint64_t v10 = _os_trace_uuid_map_lookup(*a1, a2);
  if (!v10)
  {
    _os_assumes_log();
    unint64_t v9 = *a1;
  }

  unint64_t v11 = _os_trace_uuid_map_lookup(v9, a4);
  if (!v11) {
    _os_assumes_log();
  }
  if (a3 >= a5) {
    int v12 = a3 > a5;
  }
  else {
    int v12 = -1;
  }
  if (v10 <= v11) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 1;
  }
  if (v10 >= v11) {
    return v13;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void _timesync_range_destroy(void ***a1)
{
}

uint64_t _os_trace_device_formatted_for_content_protection()
{
  if (_os_trace_device_formatted_for_content_protection_once != -1) {
    dispatch_once(&_os_trace_device_formatted_for_content_protection_once, &__block_literal_global_80);
  }
  return _os_trace_device_formatted_for_content_protection_formatted;
}

uint64_t ___os_trace_device_formatted_for_content_protection_block_invoke()
{
  uint64_t result = MKBDeviceFormattedForContentProtection();
  _os_trace_device_formatted_for_content_protection_formatted = (_DWORD)result == 1;
  return result;
}

BOOL _os_trace_device_unlocked_since_boot()
{
  if (_os_trace_device_unlocked_since_boot_unlocked) {
    return 1LL;
  }
  if (_os_trace_device_formatted_for_content_protection_once != -1) {
    dispatch_once(&_os_trace_device_formatted_for_content_protection_once, &__block_literal_global_80);
  }
  if (_os_trace_device_formatted_for_content_protection_formatted) {
    BOOL result = MKBDeviceUnlockedSinceBoot() == 1;
  }
  else {
    BOOL result = 1LL;
  }
  _os_trace_device_unlocked_since_boot_unlocked = result;
  return result;
}

BOOL _os_trace_peer_is_admin(_xpc_connection_s *a1)
{
  return xpc_connection_get_euid(a1) == 0;
}

char *_os_trace_development_getenv(const char *a1)
{
  else {
    return 0LL;
  }
}

uint64_t _os_trace_is_kernel_64_bit()
{
  if (_os_trace_is_kernel_64_bit_k64_once != -1) {
    dispatch_once(&_os_trace_is_kernel_64_bit_k64_once, &__block_literal_global_3);
  }
  return _os_trace_is_kernel_64_bit_k64;
}

uint64_t ___os_trace_is_kernel_64_bit_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  *(_OWORD *)uint64_t v3 = xmmword_1869D8DB8;
  memset(__b, 170, sizeof(__b));
  size_t v1 = 648LL;
  uint64_t result = sysctl(v3, 4u, __b, &v1, 0LL, 0LL);
  if ((_DWORD)result == -1)
  {
    __error();
    uint64_t result = _os_assumes_log();
  }

  _os_trace_is_kernel_64_bit_k64 = (__b[32] & 4) != 0;
  return result;
}

uint64_t _os_trace_uuiddb_get_pathsuffix(uint64_t result, int a2, char *__str, size_t __size)
{
  uint64_t v6 = result;
  if (a2 <= 16)
  {
    if ((a2 - 1) < 2)
    {
      uint64_t v7 = 1LL;
LABEL_5:
      uint64_t result = snprintf(__str, __size, "%02X");
      goto LABEL_10;
    }

    if (a2 == 3)
    {
      uint64_t v7 = 0LL;
      goto LABEL_9;
    }

uint64_t _os_trace_uuiddb_get_path(const char *a1, uint64_t a2, int a3, char *__str)
{
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    a1 = (const char *)_os_trace_uuidtext_path;
  }

  int v7 = snprintf(__str, 0x400uLL, "%s/", a1);
  return _os_trace_uuiddb_get_pathsuffix(a2, a3, &__str[v7], 1024LL - v7);
}

uint64_t ___os_trace_uuiddb_path_sandbox_can_read_data_block_invoke()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  uint64_t result = sandbox_check();
  _os_trace_uuiddb_path_sandbox_can_read_data_can_read = (_DWORD)result == 0;
  return result;
}

BOOL _os_trace_uuiddb_path_exists(const char *a1, uint64_t a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    int v6 = snprintf(__b, 0x400uLL, "%s/", a1);
    _os_trace_uuiddb_get_pathsuffix(a2, a3, &__b[v6], 1024LL - v6);
    return access(__b, 0) == 0;
  }

  if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1) {
    dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
  {
    memset(__b, 170, sizeof(__b));
    _os_trace_uuiddb_get_path(0LL, a2, a3, __b);
    return access(__b, 0) == 0;
  }

  return 0LL;
}

FTS *_os_trace_uuiddb_foreach(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v30[2] = *(char **)MEMORY[0x1895F89C0];
  v30[0] = a1;
  v30[1] = 0LL;
  uint64_t result = fts_open(v30, 84, 0LL);
  if (result)
  {
    unint64_t v10 = result;
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    v29[0] = 0xAAAAAAAAAAAAAAAALL;
    v29[1] = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = fts_read(v10);
    if (v11)
    {
      int v12 = v11;
      char v13 = 0;
      do
      {
        uint64_t fts_info = v12->fts_info;
        switch(v12->fts_info)
        {
          case 1u:
            if (v12->fts_level == 1)
            {
              if (!strcmp(v12->fts_name, "dsc"))
              {
                char v13 = 1;
                goto LABEL_6;
              }

              if (v12->fts_namelen == 2)
              {
                unsigned int v24 = v12->fts_name[0] - 48;
                int v25 = v24 > 0x36 ? -1 : dword_1869D8DC8[v24];
                unsigned int v26 = v12->fts_name[1] - 48;
                int v27 = v26 > 0x36 ? -1 : dword_1869D8DC8[v26];
                int v28 = v27 | (16 * v25);
                if ((v28 & 0x80000000) == 0)
                {
                  LOBYTE(v29[0]) = v28;
                  goto LABEL_6;
                }
              }
            }

            else if (!v12->fts_level)
            {
              goto LABEL_6;
            }

            (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v12);
            fts_set(v10, v12, 4);
            goto LABEL_6;
          case 2u:
            v12->fts_errno = 62;
            goto LABEL_5;
          case 3u:
          case 4u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
            goto LABEL_5;
          case 6u:
            v13 &= v12->fts_level != 1;
            goto LABEL_6;
          case 8u:
            int fts_level = (unsigned __int16)v12->fts_level;
            if (fts_level != 2) {
              goto LABEL_33;
            }
            if ((v13 & 1) != 0) {
              unint64_t v16 = 32LL;
            }
            else {
              unint64_t v16 = 30LL;
            }
            if ((_DWORD)v16 != v12->fts_namelen) {
              goto LABEL_5;
            }
            unint64_t v17 = 0LL;
            uint64_t v18 = (v13 & 1) == 0;
            break;
          default:
            qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
            qword_18C695DD0 = fts_info;
            __break(1u);
            return result;
        }

        while (1)
        {
          unsigned int v19 = v12->fts_name[v17] - 48;
          int v20 = v19 > 0x36 ? -1 : dword_1869D8DC8[v19];
          unsigned int v21 = v12->fts_name[v17 + 1] - 48;
          int v22 = v21 > 0x36 ? -1 : dword_1869D8DC8[v21];
          int v23 = v22 | (16 * v20);
          if (v23 < 0) {
            break;
          }
          *((_BYTE *)v29 + v18++) = v23;
          v17 += 2LL;
          if (v17 >= v16)
          {
            (*(void (**)(uint64_t, FTSENT *, void *, void))(a4 + 16))(a4, v12, v29, v13 & 1);
            goto LABEL_6;
          }
        }

        int fts_level = (unsigned __int16)v12->fts_level;
LABEL_33:
        if (fts_level != 1 || strcmp(v12->fts_name, ".migrated")) {
LABEL_5:
        }
          (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v12);
LABEL_6:
        int v12 = fts_read(v10);
      }

      while (v12);
    }

    if (fts_close(v10) == -1)
    {
      __error();
      _os_assumes_log();
    }

    return (FTS *)(*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
  }

  return result;
}

__n128 _os_trace_uuiddb_dsc_validate_hdr(uint64_t a1, unint64_t a2, __n128 *a3)
{
  if (a2 - 0x80000000 < 0xFFFFFFFF80000010LL || *(_DWORD *)a1 != 1685283688) {
    return result;
  }
  int v5 = a2;
  int v6 = *(unsigned __int16 *)(a1 + 4);
  if (v6 != 2)
  {
    if (v6 != 1) {
      return result;
    }
    uint64_t v7 = *(unsigned int *)(a1 + 8);
    uint64_t v8 = (16 * v7) & 0xFFFFFFF0LL;
    if (16 * v7 != v8 || v8 == 4294967280LL) {
      return result;
    }
    int v10 = 16 * v7 + 16;
    uint64_t v11 = *(unsigned int *)(a1 + 12);
    BOOL v12 = __CFADD__(v10, 28 * v11);
    unint64_t v13 = (v10 + 28 * v11);
    BOOL v14 = v12;
    if (v13 <= a2)
    {
      if ((_DWORD)v7)
      {
        unint64_t v15 = (unsigned int *)(a1 + 28);
        uint64_t v16 = *(unsigned int *)(a1 + 8);
        while (1)
        {
          unint64_t v17 = *(v15 - 1);
          BOOL v12 = a2 >= v17;
          unint64_t v18 = a2 - v17;
          v15 += 4;
          if (!--v16) {
            goto LABEL_44;
          }
        }
      }

      if ((_DWORD)v11)
      {
LABEL_44:
        unint64_t v30 = (unsigned int *)(a1 + 16 * v7 + 40);
        do
        {
          unsigned int v31 = *v30;
          v30 += 7;
          if (v31 >= a2) {
            return result;
          }
        }

        while (--v11);
      }

      if (*(_BYTE *)(a2 + a1 - 1)) {
        return result;
      }
      uint64_t v32 = _os_trace_calloc();
      uint64_t v33 = v32;
      uint64_t v34 = *(unsigned int *)(a1 + 8);
      if ((_DWORD)v34)
      {
        uint64_t v35 = (_DWORD *)(v32 + 16);
        uint64_t v36 = (void *)(a1 + 24);
        do
        {
          *((void *)v35 - 2) = *((unsigned int *)v36 - 1);
          *((void *)v35 - 1) = *v36;
          _DWORD *v35 = *((_DWORD *)v36 - 2);
          v35 += 6;
          v36 += 2;
          --v34;
        }

        while (v34);
      }

      uint64_t v37 = _os_trace_calloc();
      uint64_t v38 = v37;
      if (*(_DWORD *)(a1 + 12))
      {
        unint64_t v39 = 0LL;
        uint64_t v40 = a1 + 16 * v7 + 20;
        uint64_t v41 = v37;
        do
        {
          *(void *)uint64_t v41 = *(unsigned int *)(v40 - 4);
          *(_DWORD *)(v41 + 8) = *(_DWORD *)v40;
          *(_OWORD *)(v41 + 12) = *(_OWORD *)(v40 + 4);
          *(_DWORD *)(v41 + 28) = *(_DWORD *)(v40 + 20);
          ++v39;
          v41 += 32LL;
          v40 += 28LL;
        }

        while (v39 < *(unsigned int *)(a1 + 12));
      }

      uint64_t v42 = _os_trace_calloc();
      *(void *)(v42 + 8) = a1;
      *(void *)(v42 + 16) = v33;
      *(void *)(v42 + 24) = v38;
LABEL_61:
      __n128 result = *a3;
      *(__n128 *)(v42 + 32) = *a3;
      *(_DWORD *)(v42 + 48) = v5;
      return result;
    }

LABEL_62:
    _os_assumes_log();
    return result;
  }

  uint64_t v19 = *(unsigned int *)(a1 + 8);
  unint64_t v20 = (24 * v19) & 0xFFFFFFF8LL;
  if (24 * v19 != v20 || v20 > 0xFFFFFFEF) {
    return result;
  }
  int v22 = 24 * v19 + 16;
  uint64_t v23 = *(unsigned int *)(a1 + 12);
  BOOL v12 = __CFADD__(v22, 32 * v23);
  unint64_t v24 = (v22 + 32 * v23);
  BOOL v25 = v12;
  if (v24 > a2) {
    goto LABEL_62;
  }
  if ((_DWORD)v19)
  {
    unsigned int v26 = (_DWORD *)(a1 + 32);
    uint64_t v27 = *(unsigned int *)(a1 + 8);
    while (1)
    {
      unint64_t v28 = *(v26 - 2);
      BOOL v12 = a2 >= v28;
      unint64_t v29 = a2 - v28;
      v26 += 6;
      if (!--v27) {
        goto LABEL_56;
      }
    }
  }

  else
  {
    if (!(_DWORD)v23)
    {
LABEL_59:
      if (*(_BYTE *)(a2 + a1 - 1)) {
        return result;
      }
      uint64_t v45 = a1 + 16 + 24LL * v19;
      uint64_t v42 = _os_trace_calloc();
      *(void *)(v42 + 8) = a1;
      *(void *)(v42 + 16) = a1 + 16;
      *(void *)(v42 + 24) = v45;
      goto LABEL_61;
    }

        -[NSMutableArray removeObjectAtIndex:](self->_fileStartQ, "removeObjectAtIndex:", 0LL);
        -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
        unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          unsigned int v44 = 0LL;
          goto LABEL_66;
        }
      }

      if ([v43 endTime] >= v33)
      {

        if ([v44 oldestTime] <= v33) {
          goto LABEL_59;
        }
        goto LABEL_62;
      }

            __src = v19 + 1;
            uint64_t v3 = v17 - 1;
            goto LABEL_63;
          }

          if (v29 == 127) {
            uint64_t v33 = 63;
          }
          else {
            uint64_t v33 = v29 + 64;
          }
          qmemcpy(&__srca, "\\M^", 3);
          HIBYTE(__srca) = v33;
          if ((*(_BYTE *)(a1 + 20) & 2) != 0) {
            goto LABEL_62;
          }
          unint64_t v30 = *(unsigned int *)(a1 + 8);
          if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
          {
            p_srca = (__int16 *)&__srca;
            goto LABEL_71;
          }

          unsigned int v31 = *(void *)a1;
          uint64_t v32 = __srca;
LABEL_59:
          *(_DWORD *)(v31 + v30) = v32;
          unint64_t v24 = *(_DWORD *)(a1 + 8) + 4;
LABEL_60:
          *(_DWORD *)(a1 + 8) = v24;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v24) = 0;
          }
          goto LABEL_62;
        }

        unsigned int v26 = v25;
        if (v25 == -2LL) {
          return;
        }
        int v10 = v25 + v18;
        if (v10 > v11) {
          return;
        }
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v27 = *(unsigned int *)(a1 + 8);
          if (v25 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
          {
            os_trace_blob_add_slow(a1, v19, v25);
          }

          else
          {
            memcpy((void *)(*(void *)a1 + v27), v19, v25);
            unint64_t v28 = *(_DWORD *)(a1 + 8) + v26;
            *(_DWORD *)(a1 + 8) = v28;
            if (!*(_BYTE *)(a1 + 22)) {
              *(_BYTE *)(*(void *)a1 + v28) = 0;
            }
          }
        }

        __src = &v19[v26];
        uint64_t v3 = v17 - v26;
LABEL_63:
        if (!v3 || v10 >= v11) {
          return;
        }
      }

      int v10 = v18 + 3;
      if (v10 > v11) {
        return;
      }
      unsigned int v21 = v20 + 64;
      if (v20 == 127) {
        unsigned int v21 = 63;
      }
      unint64_t v39 = 24156;
      uint64_t v40 = v21;
      if ((*(_BYTE *)(a1 + 20) & 2) != 0) {
        goto LABEL_62;
      }
      int v22 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v22 - 1) <= 2)
      {
        p_srca = &v39;
        uint64_t v35 = a1;
        uint64_t v36 = 3LL;
        goto LABEL_72;
      }

      uint64_t v23 = *(void *)a1 + v22;
      *(_WORD *)uint64_t v23 = v39;
      *(_BYTE *)(v23 + 2) = v40;
      unint64_t v24 = *(_DWORD *)(a1 + 8) + 3;
      goto LABEL_60;
    }
  }

__objc2_class *_os_trace_uuiddb_get_dsc_map_fd(uint64_t a1, __n128 *a2)
{
  return _os_trace_uuiddb_get_dsc_map_impl(a1, 0LL, a2, 1);
}

__objc2_class *_os_trace_uuiddb_get_dsc_map_impl(uint64_t a1, char *a2, __n128 *a3, int a4)
{
  uint64_t v7 = 0LL;
  p_superclass = &OBJC_CLASS____OSLogChunkFileReference.superclass;
  uint64_t v9 = &OBJC_CLASS____OSLogChunkFileReference.superclass;
  int v10 = &OBJC_CLASS____OSLogChunkFileReference.superclass;
  uint64_t v11 = &_os_trace_shared_paths_init_once;
  while (1)
  {
    BOOL v12 = p_superclass[167];
    if (v12)
    {
      unint64_t v13 = p_superclass[167];
      while (v13->info != (__objc2_class_ro *)a3->n128_u64[0] || v13[1].isa != (__objc2_class *)a3->n128_u64[1])
      {
        unint64_t v13 = v13->isa;
        if (!v13) {
          goto LABEL_7;
        }
      }

      if (v7) {
        _os_trace_uuiddb_dsc_map_destroy((uint64_t)v7);
      }
      return v13;
    }

LABEL_7:
    if (!a4) {
      return 0LL;
    }
    if (!v7) {
      break;
    }
LABEL_19:
    *uint64_t v7 = v12;
    while (1)
    {
      unint64_t v21 = __ldxr((unint64_t *)&_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head);
      if ((__objc2_class *)v21 != v12) {
        break;
      }
    }

    __clrex();
  }

  int v27 = a4;
  if ((_DWORD)a1 == -1)
  {
    if (!a2)
    {
      if (v9[180] != (__objc2_class *)-1LL)
      {
        unint64_t v24 = v11;
        BOOL v25 = v9;
        dispatch_once(v11, &__block_literal_global_55);
        uint64_t v11 = v24;
        uint64_t v9 = v25;
      }

      a2 = (char *)v10[182];
    }

    BOOL v14 = p_superclass;
    unint64_t v15 = v10;
    uint64_t v16 = v11;
    unint64_t v17 = v9;
    unint64_t v18 = a2;
    a1 = open(a2, 0, v26);
    if ((_DWORD)a1 == -1)
    {
      __error();
      _os_assumes_log();
      return 0LL;
    }
  }

  else
  {
    BOOL v14 = p_superclass;
    unint64_t v15 = v10;
    uint64_t v16 = v11;
    unint64_t v17 = v9;
    unint64_t v18 = a2;
  }

  _os_trace_uuiddb_dsc_map_create(a1, a3);
  uint64_t v7 = v19;
  a2 = v18;
  if (!v18 || (unsigned int v26 = v18, v20 = close(a1), a2 = v18, v20 != -1))
  {
LABEL_18:
    uint64_t v9 = v17;
    uint64_t v11 = v16;
    int v10 = v15;
    p_superclass = v14;
    a4 = v27;
    if (!v7) {
      return (__objc2_class *)v7;
    }
    goto LABEL_19;
  }

  int v22 = *__error();
  __n128 result = (__objc2_class *)*__error();
  if (v22 != 9)
  {
    _os_assumes_log();
    a2 = v26;
    goto LABEL_18;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = (uint64_t)result;
  __break(1u);
  return result;
}

    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  int v10 = [v5 endTime];
  if (v10 == [v6 endTime]) {
    goto LABEL_7;
  }
  uint64_t v11 = [v5 endTime];
  if (v11 > [v6 endTime]) {
    uint64_t v9 = -1LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
LABEL_11:

  return v9;
}

    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  int v10 = [v5 oldestTime];
  if (v10 == [v6 oldestTime]) {
    goto LABEL_7;
  }
  uint64_t v11 = [v5 oldestTime];
  if (v11 > [v6 oldestTime]) {
    uint64_t v9 = -1LL;
  }
  else {
    uint64_t v9 = 1LL;
  }
LABEL_11:

  return v9;
}

      if (ctf_enum_name(a1, a2, v11))
      {
        int v27 = v11;
        unint64_t v18 = "[%#llx %s]";
LABEL_9:
        os_trace_blob_addf(a3, v18, v12, v13, v14, v15, v16, v17, v27);
        return 1LL;
      }

      if (!v11)
      {
        int v27 = 0;
LABEL_16:
        unint64_t v18 = "%#llx";
        goto LABEL_9;
      }

      v31[0] = &v35;
      v31[1] = (void *)0x40000000000LL;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      unint64_t v28 = v11;
      unint64_t v29 = v31;
      unint64_t v30 = 1;
      if (ctf_enum_iter( a1,  a2,  (uint64_t (*)(char *, void, uint64_t))ctf_enum_flag_parse,  (uint64_t)&v28) == 1) {
        os_trace_blob_addf(a3, "[%#llx %s]", v20, v21, v22, v23, v24, v25, v11);
      }
      else {
        os_trace_blob_addf(a3, "%#llx", v20, v21, v22, v23, v24, v25, v11);
      }
      if ((v33 & 1) != 0)
      {
        unsigned int v26 = v31[0];
        v31[0] = (void *)3954044928LL;
        uint64_t v33 = 0;
        free(v26);
      }

      return 1LL;
    default:
      _os_assumes_log();
      return 0LL;
  }

  return v12;
}

void _os_trace_uuiddb_dsc_map_destroy(uint64_t a1)
{
  uint64_t v2 = *(_WORD **)(a1 + 8);
  if (v2[2] == 1)
  {
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 24));
    uint64_t v2 = *(_WORD **)(a1 + 8);
  }

  if (munmap(v2, *(unsigned int *)(a1 + 48)) == -1)
  {
    __error();
    _os_assumes_log();
  }

  free((void *)a1);
}

void _os_trace_uuiddb_dsc_map_create(uint64_t a1, __n128 *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  memset(__b, 170, sizeof(__b));
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, 3, __b, 0x400uLL);
  uint64_t v3 = _os_trace_mmap_at();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    _os_trace_uuiddb_dsc_validate_hdr(v3, 0xAAAAAAAAuLL, a2);
    if (!v5 && munmap(v4, 0xAAAAAAAAAAAAAAAALL) == -1)
    {
      __error();
      _os_assumes_log();
    }
  }

void _os_trace_uuiddb_dsc_run_block_on_map(char *a1, __n128 *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    uint64_t v5 = (char *)_os_trace_uuidtext_path;
  }

  uint64_t v6 = open(v5, 0);
  if ((_DWORD)v6 == -1)
  {
    __error();
    _os_assumes_log();
    return;
  }

  uint64_t v7 = v6;
  dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(0xFFFFFFFFLL, v5, a2, 0);
  BOOL v9 = dsc_map_impl != 0LL;
  if (dsc_map_impl || (_os_trace_uuiddb_dsc_map_create(v7, a2), (dsc_map_impl = v10) != 0LL))
  {
    (*(void (**)(uint64_t, __objc2_class *))(a3 + 16))(a3, dsc_map_impl);
    if (!(_DWORD)v7) {
      goto LABEL_10;
    }
  }

  else
  {
    BOOL v9 = 1;
    if (!(_DWORD)v7) {
      goto LABEL_10;
    }
  }

  if (close(v7) == -1)
  {
    int v11 = *__error();
    uint64_t v12 = *__error();
    if (v11 == 9)
    {
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = v12;
      __break(1u);
      return;
    }

    _os_assumes_log();
  }

LABEL_10:
  if (!v9) {
    _os_trace_uuiddb_dsc_map_destroy((uint64_t)dsc_map_impl);
  }
}

  *a3 = v4;
  *a4 = v5;
  return result;
}

      return;
    }
  }

  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  _os_assert_log();
  _os_crash();
  __break(1u);
}

  return v8;
}

uint64_t _os_trace_uuiddb_dsc_map_resolve_entry( uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 8);
  unsigned int v6 = *(_DWORD *)(v5 + 12);
  if (!v6) {
    return 0LL;
  }
  unsigned int v7 = 0;
  uint64_t v8 = *(void *)(a1 + 24);
  unsigned int v9 = *(_DWORD *)(v5 + 12);
  do
  {
    uint64_t v10 = (v9 + v7) >> 1;
    unint64_t v11 = *(void *)(v8 + 32 * v10);
    BOOL v12 = a2 >= v11;
    unint64_t v13 = a2 - v11;
    if (v12)
    {
      unsigned int v7 = v10 + 1;
    }

    else
    {
      unsigned int v9 = (v9 + v7) >> 1;
    }
  }

  while (v7 < v9);
  uint64_t v14 = 0LL;
  if (*(_DWORD *)(v8 + 8)) {
    return v14;
  }
  LODWORD(v10) = 0;
LABEL_10:
  unint64_t v15 = (void *)(v8 + 32LL * v10);
  if (a3) {
    *a3 = (char *)v15 + 12;
  }
  if (a4) {
    *a4 = *(void *)(a1 + 8) + *(unsigned int *)(v8 + 32LL * v10 + 28);
  }
  if (a5) {
    *a5 = *v15;
  }
  return 1LL;
}

const char *_os_trace_uuiddb_dsc_map_resolve_string(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000LL) != 0) {
    return "%s";
  }
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(v2 + 8);
  if (!(_DWORD)v3) {
    return 0LL;
  }
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  while (1)
  {
    uint64_t v6 = (v3 + v4) >> 1;
    unint64_t v7 = *(void *)(v5 + 24LL * v6);
    BOOL v8 = a2 >= v7;
    unint64_t v9 = a2 - v7;
    if (!v8) {
      goto LABEL_8;
    }
    unsigned int v4 = v6 + 1;
    uint64_t v6 = v3;
LABEL_8:
    uint64_t v3 = v6;
  }

uint64_t _os_trace_uuiddb_dsc_foreach_range_with_uuid(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 8);
  if (*(_DWORD *)(v3 + 8))
  {
    uint64_t v6 = (void *)result;
    uint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    do
    {
      uint64_t v9 = v6[2];
      uint64_t v10 = v6[3] + 32LL * *(unsigned int *)(v9 + v7 + 16);
      uint64_t v12 = *(void *)(v10 + 12);
      uint64_t v11 = v10 + 12;
      if (v12 == *a2 && *(void *)(v11 + 8) == a2[1])
      {
        __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a3 + 16))( a3,  v3 + *(unsigned int *)(v9 + v7 + 8),  *(unsigned int *)(v9 + v7 + 12));
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v3 = v6[1];
      }

      ++v8;
      v7 += 24LL;
    }

    while (v8 < *(unsigned int *)(v3 + 8));
  }

  return result;
}

uint64_t _os_trace_uuiddb_dsc_foreach_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (*(_DWORD *)(v2 + 12))
  {
    uint64_t v4 = result;
    unint64_t v5 = 0LL;
    uint64_t v6 = 28LL;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))( a2,  *(void *)(v4 + 24) + v6 - 16,  v2 + *(unsigned int *)(*(void *)(v4 + 24) + v6));
      if ((result & 1) == 0) {
        break;
      }
      ++v5;
      uint64_t v2 = *(void *)(v4 + 8);
      v6 += 32LL;
    }

    while (v5 < *(unsigned int *)(v2 + 12));
  }

  return result;
}

uint64_t _os_trace_kic_mode()
{
  if (_os_trace_kic_mode_o != -1) {
    dispatch_once(&_os_trace_kic_mode_o, &__block_literal_global_11);
  }
  return _os_trace_kic_mode_kic;
}

char *___os_trace_kic_mode_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  memset(__b, 170, sizeof(__b));
  size_t v1 = 1024LL;
  _os_trace_kic_mode_kic = sysctlbyname("kern.filesetuuid", __b, &v1, 0LL, 0LL) != 0;
  __n128 result = (char *)sysctlbyname("kern.bootargs", __b, &v1, 0LL, 0LL);
  if (!(_DWORD)result)
  {
    if (strstr(__b, "libtrace_kic=0")) {
      _os_trace_kic_mode_kic = 0;
    }
    __n128 result = strstr(__b, "libtrace_kic=1");
    if (result) {
      _os_trace_kic_mode_kic = 1;
    }
  }

  return result;
}

void _os_trace_uuiddb_make_kernel_cache_uuid(unsigned __int8 *a1, const unsigned __int8 *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)&v7[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)in = v4;
  *(_OWORD *)uint64_t v7 = v4;
  size_t v5 = 37LL;
  if (sysctlbyname("kern.kernelcacheuuid", in, &v5, 0LL, 0LL))
  {
    uuid_copy(a1, a2);
    a1[15] = ~a1[15];
  }

  else
  {
    uuid_parse(in, a1);
  }

uint64_t _internal_log_assumes(uint64_t a1)
{
  v3[5] = *MEMORY[0x1895F89C0];
  if (!dispatch_get_specific((const void *)_internal_log_q_key))
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 0x40000000LL;
    v3[2] = ___internal_log_block_invoke;
    v3[3] = &__block_descriptor_tmp_108;
    v3[4] = a1;
    dispatch_sync((dispatch_queue_t)_internal_log_q, v3);
  }

  return 1LL;
}

int *_internal_log_queue_init()
{
  if (!_internal_queue_target)
  {
    uint64_t v1 = *__error();
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_18C695DD0 = v1;
    __break(1u);
LABEL_10:
    __n128 result = __error();
    uint64_t v2 = *result;
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_18C695DD0 = v2;
    __break(1u);
    return result;
  }

  _internal_log_q = (uint64_t)dispatch_queue_create_with_target_V2((const char *)_internal_queue_target, 0LL, 0LL);
  dispatch_queue_set_specific( (dispatch_queue_t)_internal_log_q,  (const void *)_internal_log_q_key,  (void *)_internal_log_q,  0LL);
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  asprintf((char **)&_internal_log_file_0, "%s/%s.0.log", (const char *)_os_trace_persist_path, "logd");
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  __n128 result = (int *)asprintf((char **)&_internal_log_file_1, "%s/%s.1.log", (const char *)_os_trace_persist_path, "logd");
  return result;
}

uint64_t ___internal_log_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, 18);
  v7.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.tm_mon = v2;
  *(_OWORD *)&v7.tm_isdst = v2;
  *(_OWORD *)&v7.tm_sec = v2;
  time_t v6 = time(0LL);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  uint64_t v3 = getprogname();
  pid_t v4 = getpid();
  uint64_t result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v8, v3, v4, v1);
  if ((int)result >= 1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
    dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
    if ((_internal_log_fd & 0x80000000) == 0
      || (uint64_t result = _internal_log_open(), (_internal_log_fd & 0x80000000) == 0)
      && (_internal_log_rotate_if_needed(), uint64_t result = _internal_log_fd,
                                            (_internal_log_fd & 0x80000000) == 0))
    {
      _os_trace_write();
      return _internal_log_rotate_if_needed();
    }
  }

  return result;
}

uint64_t _internal_log_rotate_if_needed()
{
  off_t v0 = lseek(_internal_log_fd, 0LL, 2);
  uint64_t result = fsync(_internal_log_fd);
  if (v0 >= 0x100000)
  {
    if (close(_internal_log_fd) != -1)
    {
LABEL_3:
      rename((const char *)_internal_log_file_0, (const char *)_internal_log_file_1);
      return _internal_log_open();
    }

    int v2 = *__error();
    uint64_t result = *__error();
    if (v2 != 9)
    {
      _os_assumes_log();
      goto LABEL_3;
    }

    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C695DD0 = result;
    __break(1u);
  }

  return result;
}

uint64_t _internal_log_open()
{
  uint64_t result = open((const char *)_internal_log_file_0, 778, 420LL);
  _internal_log_fd = result;
  if ((result & 0x80000000) == 0) {
    return fchown(result, 0x110u, 0x110u);
  }
  return result;
}

void os_trace_blob_add_base64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  time_t v6 = (void *)MEMORY[0x186E40118]();
  tm v7 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a2 length:a3];
  id v8 = [v7 base64EncodedStringWithOptions:0];
  char v9 = [v8 UTF8String];
  os_trace_blob_addf(a1, "'%s%s'", v10, v11, v12, v13, v14, v15, v9);

  objc_autoreleasePoolPop(v6);
}

char *os_log_fmt_delimit(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  pid_t v4 = a1 + 1;
  uint64_t v5 = v6;
  if (v6 != 37)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: Should start with '%'";
    qword_18C695DD0 = v5;
    __break(1u);
    JUMPOUT(0x18698AC44LL);
  }

  *(void *)(a3 + 56) = 0LL;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 8) = 0u;
  *(void *)a3 = a1;
  if (a1[1] != 123)
  {
    unsigned int v11 = 0;
LABEL_50:
    unsigned int v24 = 0;
    while (1)
    {
      while (1)
      {
        int v26 = *v4++;
        int v25 = v26;
LABEL_52:
        do
        {
          int v27 = *v4++;
          int v25 = v27;
        }

        while ((v27 - 48) < 0xA);
        if (v25 != 36) {
          goto LABEL_52;
        }
        v11 |= 1u;
        *(_WORD *)(a3 + 8) = v11;
      }

      switch(v25)
      {
        case ' ':
        case '#':
        case '\'':
        case '+':
        case '-':
        case '0':
          continue;
        case '*':
          if ((v11 & 8) != 0)
          {
            v11 |= 1u;
            *(_WORD *)(a3 + 8) = v11;
          }

          uint64_t v33 = v4;
          do
          {
            int v35 = *v33++;
            char v34 = v35;
          }

          while ((v35 - 48) < 0xA);
          if (v34 == 36) {
            v11 |= 1u;
          }
          else {
            v11 |= (v11 >> 1) & 1 | 2;
          }
          if (v34 == 36) {
            pid_t v4 = v33;
          }
          *(_WORD *)(a3 + 8) = v11;
          continue;
        case '.':
          int v28 = *v4++;
          int v25 = v28;
          if (v28 != 42)
          {
            *(_DWORD *)(a3 + 24) = 0;
            int v29 = v25 - 48;
            if ((v25 - 48) <= 9)
            {
              int v30 = 0;
              do
              {
                int v30 = v29 + 10 * v30;
                *(_DWORD *)(a3 + 24) = v30;
                int v31 = *v4++;
                int v25 = v31;
                int v29 = v31 - 48;
              }

              while ((v31 - 48) < 0xA);
            }

            int v32 = (v11 >> 3) & 1 | v11;
            unsigned int v11 = v32 | 8;
            *(_WORD *)(a3 + 8) = v32 | 8;
            goto LABEL_52;
          }

          uint64_t v36 = v4;
          do
          {
            int v38 = *v36++;
            char v37 = v38;
          }

          while ((v38 - 48) < 0xA);
          if (v37 == 36)
          {
            v11 |= 1u;
            *(_WORD *)(a3 + 8) = v11;
            pid_t v4 = v36;
          }

          else
          {
            int v39 = v11 | ((v11 & 0xC) != 0);
            unsigned int v11 = v39 | 0xC;
            *(_WORD *)(a3 + 8) = v39 | 0xC;
          }

          break;
        case '@':
          char v41 = 18;
          goto LABEL_130;
        case 'A':
        case 'E':
        case 'F':
        case 'G':
        case 'a':
        case 'e':
        case 'f':
        case 'g':
          if ((v24 & 8) != 0) {
            char v40 = 15;
          }
          else {
            char v40 = 14;
          }
          goto LABEL_132;
        case 'C':
          LOBYTE(v24) = 16;
          goto LABEL_107;
        case 'D':
          LOWORD(v24) = v24 | 0x10;
          goto LABEL_111;
        case 'L':
          v24 |= 8u;
          continue;
        case 'O':
        case 'U':
          LOWORD(v24) = v24 | 0x10;
          goto LABEL_92;
        case 'P':
          if (a2 != 2) {
            return 0LL;
          }
          if ((v11 & 8) == 0) {
            *(_WORD *)(a3 + 8) = v11 | 1;
          }
          char v41 = 19;
          goto LABEL_130;
        case 'S':
          LOBYTE(v24) = 16;
          goto LABEL_127;
        case 'X':
        case 'o':
        case 'u':
        case 'x':
LABEL_92:
          if ((v24 & 0x1000) != 0) {
            goto LABEL_103;
          }
          if ((v24 & 0xC00) != 0) {
            goto LABEL_94;
          }
          if ((v24 & 0x20) != 0)
          {
LABEL_103:
            char v41 = 12;
          }

          else if ((v24 & 0x10) != 0)
          {
LABEL_94:
            char v41 = 10;
          }

          else
          {
            if ((v24 & 0x2000) != 0) {
              char v42 = 2;
            }
            else {
              char v42 = 6;
            }
            if ((v24 & 0x40) != 0) {
              char v41 = 4;
            }
            else {
              char v41 = v42;
            }
          }

          *(_WORD *)(a3 + 8) = v11 | 0x30;
LABEL_130:
          *(_BYTE *)(a3 + 10) = v41;
          goto LABEL_134;
        case 'c':
LABEL_107:
          if ((v24 & 0x10) != 0) {
            char v40 = 7;
          }
          else {
            char v40 = 5;
          }
          goto LABEL_132;
        case 'd':
        case 'i':
LABEL_111:
          if ((v24 & 0x1000) != 0) {
            goto LABEL_119;
          }
          if ((v24 & 0x400) != 0 || (v24 & 0x800) != 0) {
            goto LABEL_120;
          }
          if ((v24 & 0x20) != 0)
          {
LABEL_119:
            char v40 = 11;
          }

          else if ((v24 & 0x10) != 0)
          {
LABEL_120:
            char v40 = 9;
          }

          else if ((v24 & 0x40) != 0)
          {
            char v40 = 3;
          }

          else if ((v24 & 0x2000) != 0)
          {
            char v40 = 1;
          }

          else
          {
            char v40 = 5;
          }

LABEL_132:
          *(_BYTE *)(a3 + 10) = v40;
          __int16 v43 = v11 | 0x10;
LABEL_133:
          *(_WORD *)(a3 + 8) = v43;
LABEL_134:
          *(_WORD *)(a3 + 12) = (_WORD)v4 - (_WORD)a1;
          return (char *)(unsigned __int16)((_WORD)v4 - (_WORD)a1);
        case 'h':
          if ((v24 & 0x40) != 0) {
            unsigned int v24 = v24 & 0xFFFFDFBF | 0x2000;
          }
          else {
            v24 |= 0x40u;
          }
          continue;
        case 'j':
          v24 |= 0x1000u;
          continue;
        case 'l':
          if ((v24 & 0x10) != 0) {
            unsigned int v24 = v24 & 0xFFFFFFCF | 0x20;
          }
          else {
            v24 |= 0x10u;
          }
          continue;
        case 'm':
          char v40 = 8;
          goto LABEL_132;
        case 'n':
          __int16 v43 = v11 | 1;
          goto LABEL_133;
        case 'p':
          *(_BYTE *)(a3 + 10) = 13;
          __int16 v43 = v11 | 0x30;
          goto LABEL_133;
        case 'q':
          v24 |= 0x20u;
          continue;
        case 's':
LABEL_127:
          if ((v24 & 0x10) != 0) {
            char v41 = 17;
          }
          else {
            char v41 = 16;
          }
          goto LABEL_130;
        case 't':
          v24 |= 0x800u;
          continue;
        case 'z':
          v24 |= 0x400u;
          continue;
        default:
          return 0LL;
      }
    }
  }

  if (a2 != 2) {
    return 0LL;
  }
  uint64_t result = strchr(v4, 125);
  if (result)
  {
    uint64_t v10 = a1 + 2;
    if (a1[2] == 125)
    {
      unsigned int v11 = 0;
LABEL_49:
      pid_t v4 = result + 1;
      goto LABEL_50;
    }

    unsigned int v44 = result;
    unsigned int v11 = 0;
    do
    {
      uint64_t v12 = &v10[strspn(v10, ", ")];
      size_t v13 = strcspn(v12, ",}");
      switch(v13)
      {
        case 0uLL:
          uint64_t result = v44;
          goto LABEL_49;
        case 6uLL:
          if (*(_DWORD *)v12 != 1818391920 || *((_WORD *)v12 + 2) != 25449) {
            goto LABEL_26;
          }
          v11 |= 0x100u;
          goto LABEL_38;
        case 7uLL:
          if (*(_DWORD *)v12 != 1986622064 || *(_DWORD *)(v12 + 3) != 1702125942) {
            goto LABEL_26;
          }
          v11 |= 0x200u;
          goto LABEL_38;
        case 9uLL:
          if (*(void *)v12 != 0x76697469736E6573LL || v12[8] != 101) {
            goto LABEL_26;
          }
          v11 |= 0x400u;
LABEL_38:
          *(_WORD *)(a3 + 8) = v11;
          break;
        default:
LABEL_26:
          if (!memchr(v12, 61, v13))
          {
            if (!strncmp(v12, "mask.", 5uLL))
            {
              if (v13 - 6 <= 7)
              {
                uint64_t v19 = 0LL;
                uint64_t v20 = 0LL;
                v11 |= 0x800u;
                *(_WORD *)(a3 + 8) = v11;
                unint64_t v21 = (char *)(v12 + 5);
                *(void *)(a3 + 48) = v12 + 5;
                *(_WORD *)(a3 + 18) = v13 - 5;
                do
                {
                  uint64_t v22 = *v21++;
                  v20 |= v22 << v19;
                  v19 += 8LL;
                }

                while (8LL * (unsigned __int16)(v13 - 5) != v19);
                *(void *)(a3 + 56) = v20;
              }
            }

            else
            {
              int v17 = v11 | 0x40;
              *(_WORD *)(a3 + 8) = v11 | 0x40;
              if (!strncmp(v12, "builtin:", 8uLL))
              {
                v11 |= 0xC0u;
                *(_WORD *)(a3 + 8) = v11;
                *(_WORD *)(a3 + 14) = 7;
                *(void *)(a3 + 32) = "builtin";
                *(void *)(a3 + 40) = v12 + 8;
                *(_WORD *)(a3 + 16) = v13 - 8;
              }

              else
              {
                unint64_t v18 = (char *)memchr(v12, 58, v13);
                if (v18)
                {
                  if ((v11 & 0x80) != 0)
                  {
                    v17 ^= 0x80u;
                    *(_WORD *)(a3 + 8) = v17;
                  }

                  *(_WORD *)(a3 + 14) = (_WORD)v18 - (_WORD)v12;
                  *(void *)(a3 + 32) = v12;
                  *(void *)(a3 + 40) = v18 + 1;
                  *(_WORD *)(a3 + 16) = (_WORD)v12 + v13 - ((_WORD)v18 + 1);
                  unsigned int v11 = v17;
                }

                else
                {
                  v11 |= 0xC0u;
                  *(_WORD *)(a3 + 8) = v11;
                  *(_WORD *)(a3 + 14) = 7;
                  *(void *)(a3 + 32) = "builtin";
                  *(void *)(a3 + 40) = v12;
                  *(_WORD *)(a3 + 16) = v13;
                }
              }
            }
          }

          break;
      }

      uint64_t v10 = &v12[v13];
    }

    while (*v10 != 125);
    if ((v11 & 0x400) != 0)
    {
      int v23 = 64767;
      uint64_t result = v44;
    }

    else
    {
      uint64_t result = v44;
      if ((v11 & 0x200) == 0) {
        goto LABEL_49;
      }
      int v23 = 65279;
    }

    v11 &= v23;
    *(_WORD *)(a3 + 8) = v11;
    goto LABEL_49;
  }

  return result;
}

        uint64_t v5 = 1043;
        goto LABEL_92;
      }
    }

    int v31 = *(uint64_t **)(a1 + 584);
    if (v31)
    {
      while (*(void *)(a1 + 616) < (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40LL))(v31[4]))
      {
        if ((unsigned __int16)*((_DWORD *)v31 + 11) >> 11 == v17)
        {
          int v32 = (const char *)v31[3];
          if (v32)
          {
            if (!strcmp(v32, v15))
            {
              if (!ctf_type_encoding(v73, v3, (unsigned int *)&v67)
                && v67 == v31[8]
                && v68 == (unint64_t)*((unsigned int *)v31 + 18))
              {
                return v31[4];
              }
            }
          }
        }

        int v31 = (uint64_t *)*v31;
        if (!v31) {
          break;
        }
      }

      int v25 = v22;
      tm v7 = v73;
    }

    else
    {
      int v25 = v22;
    }

    uint64_t v62 = v31;
    goto LABEL_56;
  }

  return v3;
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, char *a2, int a3)
{
  int v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 != 15 && v3 != 14)
  {
    if ((*(_WORD *)(a1 + 8) & 0x20) == 0)
    {
      switch(a3)
      {
        case 1:
          return *a2;
        case 2:
          return *(__int16 *)a2;
        case 4:
          return *(int *)a2;
        case 8:
          return *(void *)a2;
        default:
          goto LABEL_14;
      }
    }

    switch(a3)
    {
      case 1:
        return *a2;
      case 2:
        return *(unsigned __int16 *)a2;
      case 4:
        return *(unsigned int *)a2;
      case 8:
        return *(void *)a2;
      default:
LABEL_14:
        _os_crash();
        __break(1u);
        JUMPOUT(0x18698AE90LL);
    }
  }

  return *(void *)a2;
}

_BYTE *os_log_fmt_convert_trace(_BYTE *a1, char *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v5 = &a2[a3 - 1];
  uint64_t v4 = *v5;
  *a1 = 0;
  a1[1] = v4;
  if (v4)
  {
    uint64_t v6 = -v4;
    tm v7 = &a2[a3 + ~v4];
    id v8 = a1 + 2;
    while (1)
    {
      size_t v9 = v5[v6] & 0x3F;
      uint64_t v10 = &a2[v9];
      if (&a2[v9] > v7) {
        break;
      }
      *id v8 = 0;
      v8[1] = v9;
      unsigned int v11 = v8 + 2;
      memcpy(v8 + 2, a2, v9);
      id v8 = &v11[v9];
      a2 = v10;
      if (__CFADD__(v6++, 1LL)) {
        return v3;
      }
    }

    return 0LL;
  }

  return v3;
}

_BYTE *os_log_fmt_extract_pubdata(_BYTE *result, int a2, void *a3, unsigned __int16 *a4)
{
  *a3 = 0LL;
  *a4 = 0;
  if (!a2) {
    return &os_log_fmt_extract_pubdata_empty_hdr;
  }
  if (a2 == 1) {
    return 0LL;
  }
  uint64_t v4 = result + 2;
  unsigned __int16 v5 = a2 - 2;
  if (result[1])
  {
    int v6 = 0;
    while (v5 >= 2u)
    {
      unint64_t v7 = v4[1] + 2LL;
      if (v7 > v5) {
        break;
      }
      v4 += v7;
      v5 -= v7;
    }

    return 0LL;
  }

uint64_t os_log_fmt_read_aster_if_necessary(uint64_t result, _WORD *a2, unsigned __int8 **a3)
{
  __int16 v3 = *(_WORD *)(result + 8);
  if ((v3 & 2) == 0)
  {
LABEL_10:
    if ((v3 & 8) == 0) {
      return result;
    }
    goto LABEL_14;
  }

  if (!*a2)
  {
    int v6 = (_DWORD *)(result + 20);
    goto LABEL_13;
  }

  uint64_t v4 = *a3;
  --*a2;
  unsigned __int16 v5 = v4 + 2;
  *a3 = &v4[v4[1] + 2];
  int v6 = (_DWORD *)(result + 20);
  if (v4[1] == 4)
  {
    unsigned int v7 = *v4;
    if (v7 < 0x10 || (v7 & 0xF0) == 16)
    {
      _DWORD *v6 = *v5;
      goto LABEL_10;
    }
  }

uint64_t os_log_fmt_get_data( uint64_t a1, unsigned int a2, unsigned int a3, unsigned __int8 *a4, int a5, unsigned __int16 a6, unsigned __int8 **a7, _WORD *a8, int8x8_t a9, BOOL *a10, uint64_t a11, unsigned __int16 a12, uint64_t a13, unsigned __int16 a14)
{
  if (!a4) {
    goto LABEL_52;
  }
  int v14 = *a4 & 0xF0;
  if (v14 == 224)
  {
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15 > 0x656D616E6C69616CLL)
    {
      if (v15 > 0x6F6363616C69616CLL)
      {
        if (v15 == 0x6F6363616C69616DLL || v15 == 0x7075626D6C69616DLL) {
          goto LABEL_30;
        }
        uint64_t v16 = 0x726464616C69616DLL;
      }

      else
      {
        if (v15 == 0x656D616E6C69616DLL || v15 == 0x6A6275736C69616DLL) {
          goto LABEL_30;
        }
        uint64_t v16 = 0x6D6D75736C69616DLL;
      }
    }

    else
    {
      if (v15 <= 0x786F626C69616CLL)
      {
        if (v15)
        {
          if (v15 != 1752392040)
          {
            uint64_t v16 = 0x68736168766564LL;
            goto LABEL_29;
          }

LABEL_30:
          LOBYTE(v20) = 8;
          goto LABEL_69;
        }

LABEL_68:
        LOBYTE(v20) = 3;
        goto LABEL_69;
      }

      if (v15 == 0x786F626C69616DLL || v15 == 0x35646D6E69616C70LL) {
        goto LABEL_30;
      }
      uint64_t v16 = 0x617474616C69616DLL;
    }

LABEL_29:
    if (v15 != v16)
    {
      LOBYTE(v20) = 10;
      goto LABEL_69;
    }

    goto LABEL_30;
  }

  if ((*a4 & 1) == 0)
  {
    unsigned int v18 = a12;
    goto LABEL_10;
  }

  uint64_t v21 = *a4 & 7;
  if (((0xD8uLL >> v21) & 1) != 0) {
    goto LABEL_68;
  }
  unsigned int v22 = privacy_flags2opt[v21];
  if (v22 > a3)
  {
LABEL_22:
    LOBYTE(v20) = 1;
    goto LABEL_69;
  }

  a11 = a13;
  unsigned int v18 = a14;
  if (a2 - 1 >= 3)
  {
    if (a2) {
      goto LABEL_10;
    }
    if (a13)
    {
      BOOL v19 = 0;
      goto LABEL_35;
    }

    goto LABEL_22;
  }

  if (v14 != 128 && v22 > a2) {
    goto LABEL_22;
  }
LABEL_10:
  BOOL v19 = a11 == 0;
  if (v18 && !a11)
  {
LABEL_12:
    LOBYTE(v20) = 4;
LABEL_69:
    *a7 = 0LL;
    *a8 = 0;
    return v20;
  }

  [v6[2] firstObject];
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v19 = v18;
  if (v18)
  {
    if ((a2 & 8) != 0)
    {
      int v25 = [v18 oldestTime];
      __int16 v26 = v25 - 1;
      if (v25 - 1 <= v7) {
        __int16 v26 = v7;
      }
      if (v25) {
        unsigned int v7 = v26;
      }
    }

    else
    {
      uint64_t v20 = [v18 endTime];
      uint64_t v21 = v20 + 1;
      unsigned int v22 = v20 == -1;
      unsigned int v23 = v22 << 63 >> 63;
      uint64_t v24 = v23 ^ v22;
      if (v7 < v20 + 1) {
        uint64_t v21 = v7;
      }
      if (v23 < 0) {
        uint64_t v21 = v7;
      }
      if (!v24) {
        unsigned int v7 = v21;
      }
    }
  }

  [v6[5] firstObject];
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v28 = v27;
  if (v27)
  {
    if ((a2 & 8) != 0)
    {
      uint64_t v34 = [v27 oldestTime];
      unsigned int v35 = v34 - 1;
      if (v34 - 1 <= v7) {
        unsigned int v35 = v7;
      }
      if (v34) {
        unsigned int v7 = v35;
      }
    }

    else
    {
      unsigned int v29 = [v27 endTime];
      int v30 = v29 + 1;
      uint64_t v31 = v29 == -1;
      uint64_t v32 = v31 << 63 >> 63;
      uint64_t v33 = v32 ^ v31;
      if (v7 < v29 + 1) {
        int v30 = v7;
      }
      if (v32 < 0) {
        int v30 = v7;
      }
      if (!v33) {
        unsigned int v7 = v30;
      }
    }
  }

  return v7;
}

  objc_autoreleasePoolPop(v6);
  return v3 & 1;
}

        uint64_t v36 = v26 * v25 / v24;
        v21 -= v36 / 0x3B9ACA00;
        v22 -= v36 % 0x3B9ACA00 / 0x3E8;
        if (v22 < 0)
        {
          --v21;
          v22 += 1000000;
        }
      }
    }

LABEL_35:
  *a10 = 0;
  unsigned int v23 = *a4;
  if ((v23 & 0xFFFFFFF1) != 0)
  {
    if ((v23 & 0xFFFFFFE1) == 0 || a4[1] != 4) {
      goto LABEL_68;
    }
    uint64_t v24 = *((unsigned __int16 *)a4 + 1);
    int v25 = v18 - v24;
    __int16 v26 = *((_WORD *)a4 + 2);
    if (v25 < (v26 & 0x7FFF)) {
      goto LABEL_12;
    }
    int v27 = v26;
    if (v23 <= 0xF && v26 < 0)
    {
LABEL_52:
      LOBYTE(v20) = 2;
      goto LABEL_69;
    }

    uint64_t v20 = (unsigned __int8 *)(a11 + v24);
    if (v19) {
      uint64_t v20 = 0LL;
    }
    unsigned int v28 = (v26 >> 15) & 1;
    *a10 = v26 < 0;
    unsigned int v29 = *((_WORD *)a4 + 2) & 0x7FFF;
    if (!a5 && v27 < 0 && (*((_WORD *)a4 + 2) & 0x7FFF) == 0)
    {
      if (v25 < 0x8000)
      {
        unsigned int v29 = 0;
      }

      else
      {
        unsigned int v28 = 0;
        *a10 = 0;
        unsigned int v29 = 0x8000;
      }
    }

    if (*a4 >= 0xF0u)
    {
      uint64_t v31 = *(void *)(a1 + 56);
      if (v31 > 0x656D616E6C69616CLL)
      {
        if (v31 <= 0x6F6363616C69616CLL)
        {
          if (v31 == 0x656D616E6C69616DLL || v31 == 0x6A6275736C69616DLL) {
            goto LABEL_93;
          }
          uint64_t v34 = 0x6D6D75736C69616DLL;
          goto LABEL_86;
        }

        if (v31 != 0x6F6363616C69616DLL)
        {
          if (v31 == 0x726464616C69616DLL)
          {
            *a7 = v20;
            *a8 = v29;
            LOBYTE(v20) = 7;
            return v20;
          }

          uint64_t v32 = 0x7075626D6C69616DLL;
LABEL_91:
          if (v31 == v32) {
            goto LABEL_92;
          }
LABEL_105:
          LOBYTE(v20) = 9;
          goto LABEL_69;
        }
      }

      else
      {
        if (v31 <= 0x786F626C69616CLL)
        {
          if (!v31) {
            goto LABEL_68;
          }
          if (v31 != 1752392040)
          {
            uint64_t v32 = 0x68736168766564LL;
            goto LABEL_91;
          }

LABEL_92:
          *a7 = v20;
          *a8 = v29;
          LOBYTE(v20) = 5;
          return v20;
        }

        if (v31 != 0x786F626C69616DLL)
        {
          if (v31 == 0x35646D6E69616C70LL) {
            goto LABEL_92;
          }
          uint64_t v34 = 0x617474616C69616DLL;
LABEL_86:
          if (v31 != v34) {
            goto LABEL_105;
          }
        }
      }

LABEL_93:
      *a7 = v20;
      *a8 = v29;
      LOBYTE(v20) = 6;
      return v20;
    }
  }

  else
  {
    uint64_t v20 = a4 + 2;
    unsigned int v29 = a4[1];
    unsigned int v28 = a4[1] == 0;
    *a10 = v28;
  }

  if (v28 && *a4 < 0x10u) {
    goto LABEL_52;
  }
  *a7 = v20;
  *a8 = v29;
  int v30 = *a4;
  if ((v30 & 0xF0) != 0x10
    && *a4 < 0x10u == (*(_WORD *)(a1 + 8) & 0x10) >> 4
    && ((*(_WORD *)(a1 + 8) & 0x10) == 0 || (a9.i32[0] = v29, vaddlv_u8((uint8x8_t)vcnt_s8(a9)) == 1)))
  {
    switch(*(_BYTE *)(a1 + 10))
    {
      case 1:
      case 2:
        if (v29 <= 4) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        if (v29 < 5) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 9:
      case 0xA:
        if (v29 <= a6) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 0xB:
      case 0xC:
        if (v29 < 9) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 0xD:
        if (v29 == a6) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 0xE:
      case 0xF:
        if (v29 == 8) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 0x10:
        if ((v30 & 0xF0) == 0x20) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 0x11:
        if ((v30 & 0xF0) == 0x50) {
          goto LABEL_103;
        }
        goto LABEL_57;
      case 0x12:
        unsigned int v35 = (v30 >> 4) - 2;
        if (v35 >= 7) {
          goto LABEL_57;
        }
        return (0x30303000000uLL >> (8 * v35));
      case 0x13:
        if ((v30 & 0xF0) != 0x30) {
          goto LABEL_57;
        }
LABEL_103:
        LOBYTE(v20) = 0;
        break;
      default:
        qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
        qword_18C695DD0 = v30 & 0xFFFFFFF0;
        __break(1u);
        JUMPOUT(0x18698B6ACLL);
    }
  }

  else
  {
LABEL_57:
    LOBYTE(v20) = 3;
  }

  return v20;
}

unint64_t os_log_fmt_compose( size_t a1, char *__s, uint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, int a8, uint64_t a9, unsigned __int16 a10, uint64_t a11)
{
  uint64_t v135 = *MEMORY[0x1895F89C0];
  unsigned int v111 = (*a6 >> 5) & 3;
  v127 = a6 + 2;
  unsigned __int16 v126 = a6[1];
  while (1)
  {
    unint64_t result = strcspn(__s, "%");
    unint64_t v17 = result;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v18 = *(unsigned int *)(a1 + 8);
      if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
      {
        unint64_t result = os_trace_blob_add_slow(a1, __s, result);
      }

      else
      {
        unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v18), __s, result);
        unsigned int v19 = *(_DWORD *)(a1 + 8) + v17;
        *(_DWORD *)(a1 + 8) = v19;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v19) = 0;
        }
      }
    }

    uint64_t v20 = &__s[v17];
    if (!__s[v17]) {
      break;
    }
    unint64_t result = (unint64_t)os_log_fmt_delimit(&__s[v17], a3, (uint64_t)&v117);
    if (result)
    {
      if ((v118 & 1) != 0) {
        return _os_log_fmt_decode_give_up(a1, v117, v119, v21, v22, v23, v24, v25);
      }
      unint64_t v26 = result;
      os_log_fmt_read_aster_if_necessary((uint64_t)&v117, &v126, &v127);
      unsigned __int16 v28 = v126;
      if (v126)
      {
        unsigned int v29 = v127;
        unsigned __int16 v28 = --v126;
        v127 += v127[1] + 2;
      }

      else
      {
        unsigned int v29 = 0LL;
      }

      uint64_t data = os_log_fmt_get_data( (uint64_t)&v117,  v111,  a4,  v29,  v28,  a5,  (unsigned __int8 **)&v116,  &v115,  v27,  &v114,  a7,  a8,  a9,  a10);
      switch((int)data)
      {
        case 0:
          if ((v118 & 0x40) == 0) {
            goto LABEL_21;
          }
          BOOL v48 = v114;
          if ((v118 & 0x80) != 0)
          {
LABEL_21:
            if ((v118 & 0x10) != 0) {
              _os_log_fmt_compose_scalar(a1, (uint64_t)&v117, a5, v116, v115);
            }
            else {
              _os_log_fmt_compose_data(a1, (uint64_t)&v117, v29, v116, v115, v114);
            }
            goto LABEL_107;
          }

          p_uint64_t scalar = v116;
          unsigned int v109 = v115;
          uint64_t v49 = v123;
          size_t v50 = v120;
          if (!ctf_is_type(v123, v120))
          {
            goto LABEL_21;
          }

          if (!a11 || v48) {
            goto LABEL_21;
          }
          __source = v124;
          unint64_t v51 = v121;
          if (!ctf_is_type(v49, v50))
          {
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_128:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_129:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_130:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_131:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_132:
            _os_assert_log();
            _os_crash();
            __break(1u);
          }

          int v52 = *v49;
          if (v52 > 115)
          {
            if (v52 == 117)
            {
LABEL_60:
              strncpy(__dst, v49, v50);
              __dst[v50] = 32;
              uint64_t v56 = &__dst[v50 + 1];
              if (254 - v50 >= v51 + 1) {
                size_t v55 = v51 + 1;
              }
              else {
                size_t v55 = 254 - v50;
              }
            }

            else
            {
              if (v52 != 116) {
                goto LABEL_65;
              }
              if (strncmp(v49, "type", 4uLL)) {
                goto LABEL_131;
              }
              uint64_t v54 = 254LL;
              if (v51 < 0xFE) {
                uint64_t v54 = v51;
              }
              size_t v55 = v54 + 1;
              uint64_t v56 = __dst;
            }

            strlcpy(v56, __source, v55);
            goto LABEL_65;
          }

          if (v52 == 101 || v52 == 115) {
            goto LABEL_60;
          }
LABEL_65:
          uint64_t v57 = a11;
          if (*(void *)(a11 + 32)) {
            goto LABEL_128;
          }
          __sa = 0LL;
          uint64_t p_sa = (uint64_t)&__sa;
          uint64_t v131 = 0x2000000000LL;
          uint64_t v132 = 0LL;
          if ((((*(_WORD *)(a11 + 26) & 0xE) - 4) & 0xFFFFFFF7) != 0)
          {
            int v58 = *(_DWORD *)(a11 + 16);
            uint64_t v59 = *(void *)(a11 + 8);
            if (v58) {
              uint64_t v60 = uuidpath_map_header_fd(v58, v59, __src);
            }
            else {
              uint64_t v60 = uuidpath_map_header(0LL, v59, __src);
            }
            unint64_t v69 = v60;
            if (v60)
            {
              uint64_t v70 = v60[3];
              uint64_t v71 = *(void *)(p_sa + 24);
              int v107 = a8;
              uint64_t v106 = a5;
              if ((_DWORD)v70 && !v71)
              {
                uint64_t v72 = 0LL;
                unint64_t v73 = (unsigned __int16 *)&v69[2 * v70 + 4];
                v74 = v69 + 5;
                v75 = v69 + 5;
                while (1)
                {
                  unsigned int v76 = *v75;
                  v75 += 2;
                  v77 = v69;
                  uint64_t v71 = _ctf_open_buffer(v73, v76, v61, v62, v63, v64, v65, v66);
                  unint64_t v69 = v77;
                  *(void *)(p_sa + 24) = v71;
                  unint64_t v73 = (unsigned __int16 *)((char *)v73 + *v74);
                  v74 = v75;
                  if (v71) {
                    goto LABEL_83;
                  }
                }
              }

              if (v71)
              {
LABEL_83:
                size_t v78 = __src[0];
                uint64_t v57 = a11;
                *(void *)(a11 + 40) = v69;
                *(void *)(a11 + 48) = v78;
                a8 = v107;
              }

              else
              {
                munmap(v69, __src[0]);
                a8 = v107;
                uint64_t v57 = a11;
              }

              a5 = v106;
            }
          }

          else
          {
            unint64_t v67 = *(__n128 **)a11;
            if (*(void *)a11)
            {
              uint64_t v68 = *(unsigned int *)(a11 + 16);
            }

            else
            {
              if ((_dyld_get_shared_cache_uuid() & 1) == 0) {
                goto LABEL_132;
              }
              unint64_t v67 = (__n128 *)__src;
              uint64_t v68 = 0xFFFFFFFFLL;
            }

            dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(v68, 0LL, v67, 1);
            if (dsc_map_impl)
            {
              v80 = *(void **)(a11 + 8);
              __src[0] = MEMORY[0x1895F87A8];
              __src[1] = 0x40000000LL;
              __src[2] = (size_t)__ctf_metadata_open_ctf_block_invoke;
              __src[3] = (size_t)&unk_189F0F480;
              __src[4] = (size_t)&__sa;
              _os_trace_uuiddb_dsc_foreach_range_with_uuid((uint64_t)dsc_map_impl, v80, (uint64_t)__src);
            }
          }

          uint64_t v81 = p_sa;
          *(void *)(v57 + 32) = *(void *)(p_sa + 24);
          v82 = *(const char ***)(v81 + 24);
          _Block_object_dispose(&__sa, 8);
          if (!v82) {
            goto LABEL_21;
          }
          if ((v118 & 0x10) != 0)
          {
            uint64_t scalar = os_log_fmt_read_scalar((uint64_t)&v117, p_scalar, v109);
            p_uint64_t scalar = (char *)&scalar;
          }

          __sa = (char *)__src;
          uint64_t p_sa = 0x40000000000LL;
          LODWORD(v131) = 0;
          WORD2(v131) = 0;
          BYTE6(v131) = 0;
          uint64_t v83 = ctf_lookup_by_name(v82, __dst);
          if (v83 == -1 || !ctf_type_parse((uint64_t)v82, v83, (uint64_t)&__sa, (uint64_t)p_scalar, v109))
          {
            char v95 = 0;
          }

          else
          {
            unint64_t v91 = strlen(__sa);
            if ((*(_WORD *)(a1 + 20) & 2) == 0)
            {
              int v92 = v91;
              uint64_t v93 = *(unsigned int *)(a1 + 8);
              if (v91 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v93 - 1))
              {
                os_trace_blob_add_slow(a1, __sa, v91);
              }

              else
              {
                memcpy((void *)(*(void *)a1 + v93), __sa, v91);
                unsigned int v94 = *(_DWORD *)(a1 + 8) + v92;
                *(_DWORD *)(a1 + 8) = v94;
                if (!*(_BYTE *)(a1 + 22)) {
                  *(_BYTE *)(*(void *)a1 + v94) = 0;
                }
              }
            }

            char v95 = 1;
          }

          if ((v131 & 0x100000000LL) != 0)
          {
            v96 = __sa;
            __sa = (char *)3954044928LL;
            WORD2(v131) = 0;
            free(v96);
          }

          uint64_t v97 = *(void *)(a11 + 32);
          if (!v97) {
            goto LABEL_129;
          }
          ctf_close(v97, v84, v85, v86, v87, v88, v89, v90);
          v98 = *(void **)(a11 + 40);
          if (v98) {
            munmap(v98, *(void *)(a11 + 48));
          }
          *(void *)(a11 + 32) = 0LL;
          if ((v95 & 1) == 0) {
            goto LABEL_21;
          }
LABEL_107:
          __s = &v20[v26];
          break;
        case 5:
          char v42 = (unsigned __int8 *)v116;
          uint64_t v43 = v115;
          BOOL v44 = v114;
          os_trace_blob_addf(a1, "<mask.%.*s: ", v34, data, v35, v36, v37, v38, v122);
          if (v43 || v44)
          {
            os_trace_blob_add_base64(a1, (uint64_t)v42, v43);
          }

          else if ((*(_WORD *)(a1 + 20) & 2) == 0)
          {
            uint64_t v45 = *(unsigned int *)(a1 + 8);
            if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v45 - 1) <= 5)
            {
              os_trace_blob_add_slow(a1, "(null)", 6uLL);
            }

            else
            {
              uint64_t v46 = *(void *)a1 + v45;
              *(_WORD *)(v46 + 4) = 10604;
              *(_DWORD *)uint64_t v46 = 1819635240;
              unsigned int v47 = *(_DWORD *)(a1 + 8) + 6;
              *(_DWORD *)(a1 + 8) = v47;
              if (!*(_BYTE *)(a1 + 22)) {
                *(_BYTE *)(*(void *)a1 + v47) = 0;
              }
            }
          }

          if ((*(_WORD *)(a1 + 20) & 2) == 0)
          {
            uint64_t v53 = *(unsigned int *)(a1 + 8);
            if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v53)
            {
              uint64_t v99 = a1;
              v100 = ">";
              size_t v101 = 1LL;
LABEL_113:
              os_trace_blob_add_slow(v99, v100, v101);
            }

            else
            {
              *(_BYTE *)(*(void *)a1 + v53) = 62;
              unsigned int v41 = *(_DWORD *)(a1 + 8) + 1;
LABEL_46:
              *(_DWORD *)(a1 + 8) = v41;
              if (!*(_BYTE *)(a1 + 22)) {
                *(_BYTE *)(*(void *)a1 + v41) = 0;
              }
            }
          }

          goto LABEL_107;
        case 6:
        case 7:
          _os_log_fmt_compose_masked_partial_redacted(a1, v116, v115, v114, v35, v36, v37, v38);
          goto LABEL_107;
        default:
          switch((int)data)
          {
            case 1:
              if ((*(_WORD *)(a1 + 20) & 2) == 0)
              {
                uint64_t v39 = *(unsigned int *)(a1 + 8);
                if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v39 - 1) > 8)
                {
                  uint64_t v40 = *(void *)a1 + v39;
                  *(void *)uint64_t v40 = *(void *)"<private>";
                  *(_BYTE *)(v40 + 8) = 62;
                  unsigned int v41 = *(_DWORD *)(a1 + 8) + 9;
                  goto LABEL_46;
                }

                uint64_t v99 = a1;
                v100 = "<private>";
                size_t v101 = 9LL;
                goto LABEL_113;
              }

              break;
            case 2:
              _os_log_fmt_decode_error(a1);
              break;
            case 3:
              _os_log_fmt_decode_cmd_mismatch(a1, v117, v119, v29, v115, v115, v37, v38);
              break;
            case 4:
              _os_log_fmt_decode_bad_range( a1,  v117,  v119,  *((unsigned __int16 *)v29 + 1),  *((unsigned __int16 *)v29 + 2),  v115,  v37,  v38);
              break;
            case 8:
            case 9:
            case 10:
              _os_log_fmt_decode_masked_unknown(a1, v122, v125, data, v35, v115, v37, v38);
              break;
            default:
              goto LABEL_107;
          }

          goto LABEL_107;
      }
    }

    else
    {
      char v30 = v20[1];
      if (!v30) {
        break;
      }
      LOBYTE(__src[0]) = v20[1];
      if ((*(_BYTE *)(a1 + 20) & 2) == 0)
      {
        uint64_t v31 = *(unsigned int *)(a1 + 8);
        if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v31)
        {
          os_trace_blob_add_slow(a1, __src, 1uLL);
        }

        else
        {
          *(_BYTE *)(*(void *)a1 + v31) = v30;
          unsigned int v32 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v32;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v32) = 0;
          }
        }
      }

      __s = v20 + 2;
    }
  }

  uint64_t v102 = *(unsigned int *)(a1 + 8) - 1LL;
  uint64_t v103 = MEMORY[0x1895F8770];
  while (v102 != -1)
  {
    unsigned int v104 = *(char *)(*(void *)a1 + v102);
    if ((v104 & 0x80000000) != 0) {
      unint64_t result = __maskrune(v104, 0x4000uLL);
    }
    else {
      unint64_t result = *(_DWORD *)(v103 + 4LL * v104 + 60) & 0x4000;
    }
    --v102;
    if (!(_DWORD)result)
    {
      unsigned int v105 = v102 + 2;
      goto LABEL_123;
    }
  }

  unsigned int v105 = 0;
LABEL_123:
  *(_DWORD *)(a1 + 8) = v105;
  if (!*(_BYTE *)(a1 + 22)) {
    *(_BYTE *)(*(void *)a1 + v105) = 0;
  }
  return result;
}

void _os_log_fmt_compose_masked_partial_redacted( uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  uint64_t v10 = a1;
  if (!(_DWORD)a3 && (a4 & 1) == 0)
  {
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      return;
    }
    uint64_t v11 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1) > 7)
    {
      *(void *)(*(void *)a1 + v11) = 0x3E296C6C756E283CLL;
      unsigned int v12 = *(_DWORD *)(a1 + 8) + 8;
      goto LABEL_69;
    }

    uint64_t v43 = "<(null)>";
    size_t v44 = 8LL;
LABEL_76:
    os_trace_blob_add_slow(a1, v43, v44);
    return;
  }

  if (a3 <= 3)
  {
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      return;
    }
    uint64_t v13 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v13 - 1) <= 4)
    {
      uint64_t v43 = "<…>";
      size_t v44 = 5LL;
      goto LABEL_76;
    }

    uint64_t v14 = *(void *)a1 + v13;
    *(_BYTE *)(v14 + 4) = 62;
    *(_DWORD *)uint64_t v14 = -1501502916;
    unsigned int v12 = *(_DWORD *)(a1 + 8) + 5;
LABEL_69:
    *(_DWORD *)(v10 + 8) = v12;
    if (!*(_BYTE *)(v10 + 22)) {
      *(_BYTE *)(*(void *)v10 + v12) = 0;
    }
    return;
  }

  unint64_t v15 = a3;
  unint64_t v16 = *a2;
  char v17 = a2[1];
  unint64_t v18 = a2[2];
  int v19 = a2[3];
  BOOL v21 = v19 != 2 || v18 == 0;
  if (!(_DWORD)a4 && !*a2 && v21)
  {
    os_trace_blob_addns(a1, a2 + 4, a3 - 4LL);
    return;
  }

  BOOL v22 = v19 == 1;
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v23 = *(unsigned int *)(a1 + 8);
    if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v23)
    {
      os_trace_blob_add_slow(a1, "<", 1uLL);
    }

    else
    {
      *(_BYTE *)(*(void *)a1 + v23) = 60;
      unsigned int v24 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v24;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v24) = 0;
      }
    }
  }

  unint64_t v25 = v16 + 4;
  if (v15 > v16 + 4)
  {
    if (v15 - (v16 + 4) < v18) {
      unint64_t v18 = v15 - (v16 + 4);
    }
    if (v19 == 2) {
      a3 = v18;
    }
    else {
      a3 = v15 - (v16 + 4);
    }
    if (a3)
    {
      if (v19 == 1 && (*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v26 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v26 - 1) <= 2)
        {
          unint64_t v45 = a3;
          os_trace_blob_add_slow(v10, "…", 3uLL);
          a3 = v45;
        }

        else
        {
          uint64_t v27 = *(void *)v10 + v26;
          *(_BYTE *)(v27 + 2) = -90;
          *(_WORD *)uint64_t v27 = -32542;
          unsigned int v28 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v28;
          if (!*(_BYTE *)(v10 + 22)) {
            *(_BYTE *)(*(void *)v10 + v28) = 0;
          }
        }
      }

      if (os_trace_blob_addns(v10, &a2[v25], a3))
      {
        if (((v19 | 2) == 2 || v8) && (*(_WORD *)(v10 + 20) & 2) == 0)
        {
          uint64_t v29 = *(unsigned int *)(v10 + 8);
          if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v29 - 1) <= 2)
          {
            os_trace_blob_add_slow(v10, "…", 3uLL);
          }

          else
          {
            uint64_t v30 = *(void *)v10 + v29;
            *(_BYTE *)(v30 + 2) = -90;
            *(_WORD *)uint64_t v30 = -32542;
            unsigned int v31 = *(_DWORD *)(v10 + 8) + 3;
            *(_DWORD *)(v10 + 8) = v31;
            if (!*(_BYTE *)(v10 + 22)) {
              *(_BYTE *)(*(void *)v10 + v31) = 0;
            }
          }
        }

        BOOL v22 = 1;
      }
    }

    else
    {
      BOOL v22 = 0;
    }

    if (v19 == 2
      && (a3 = v15 - (v18 + v25), v15 != v18 + v25)
      && os_trace_blob_addns(v10, &a2[v18 + v25], a3))
    {
      if ((*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v32 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v32 - 1) <= 2)
        {
          os_trace_blob_add_slow(v10, "…", 3uLL);
        }

        else
        {
          uint64_t v33 = *(void *)v10 + v32;
          *(_BYTE *)(v33 + 2) = -90;
          *(_WORD *)uint64_t v33 = -32542;
          unsigned int v34 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v34;
          if (!*(_BYTE *)(v10 + 22)) {
            *(_BYTE *)(*(void *)v10 + v34) = 0;
          }
        }
      }
    }

    else if (!v22)
    {
      goto LABEL_57;
    }

    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v35 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v35 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }

      else
      {
        *(_WORD *)(*(void *)v10 + v35) = 8236;
        unsigned int v36 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v36;
        if (!*(_BYTE *)(v10 + 22)) {
          *(_BYTE *)(*(void *)v10 + v36) = 0;
        }
      }
    }
  }

uint64_t _os_log_fmt_builtin_annotated( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  unint64_t v10 = 0LL;
  uint64_t v11 = *(const char **)(a3 + 40);
  size_t v12 = *(unsigned __int16 *)(a3 + 16);
  unint64_t v13 = 17LL;
  while (1)
  {
    unint64_t v14 = (v10 + v13) >> 1;
    unint64_t v15 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14];
    int v16 = strncmp(v11, v15, v12);
    if (!v16) {
      break;
    }
LABEL_5:
    if (v16 >= 0) {
      unint64_t v10 = v14 + 1;
    }
    else {
      unint64_t v13 = (v10 + v13) >> 1;
    }
    if (v10 >= v13) {
      return 0LL;
    }
  }

  if (v15[v12])
  {
    int v16 = -v15[v12];
    goto LABEL_5;
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(&_os_log_fmt_builtin_annotated_functions)[2 * v14 + 1])( a1,  a2,  a3,  a4,  a5,  a6,  a7);
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t scalar = os_log_fmt_read_scalar(a2, a4, a5);
  __int16 v9 = *(_WORD *)(a2 + 8);
  if ((v9 & 2) == 0)
  {
    unsigned int v10 = 0;
    if ((v9 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  int v31 = *(_DWORD *)(a2 + 20);
  unsigned int v10 = 1;
  if ((v9 & 4) != 0) {
LABEL_5:
  }
    *(&v31 + v10++) = *(_DWORD *)(a2 + 24);
LABEL_6:
  MEMORY[0x1895F8858]();
  size_t v12 = (char *)&v31 - v11;
  unint64_t result = _os_log_fmt_compose_format_copy((_BYTE *)&v31 - v11, *(void **)a2, *(_WORD *)(a2 + 12));
  uint64_t v20 = *(unsigned __int8 *)(a2 + 10);
  switch(*(_BYTE *)(a2 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      HIWORD(v30) = HIWORD(scalar);
      qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
      qword_18C695DD0 = v20;
      __break(1u);
      JUMPOUT(0x18698CA84LL);
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      unint64_t v25 = strerror(scalar);
      unint64_t result = strlen(v25);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v26 = result;
        uint64_t v27 = *(unsigned int *)(a1 + 8);
        if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
        {
          return os_trace_blob_add_slow(a1, v25, result);
        }

        else
        {
          unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v27), v25, result);
          unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
          *(_DWORD *)(a1 + 8) = v28;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v28) = 0;
          }
        }
      }

      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (a3 == 8 || (_DWORD)v20 == 13) {
        goto LABEL_34;
      }
      unsigned int v21 = result;
      uint64_t v22 = result;
      uint64_t v23 = result - 1LL;
      unsigned int v24 = v12[v23];
      if (a3 == 4)
      {
        if ((v24 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v12[v23], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v24 + 60) & 0x8000;
        }
        if ((_DWORD)result) {
          unint64_t result = __tolower(v24);
        }
        else {
          v12[v21 - 2] = v24;
        }
        v12[v23] = result;
LABEL_7:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10) {
              return result;
            }
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }

LABEL_38:
          HIWORD(v30) = HIWORD(scalar);
          return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
        }
      }

      else
      {
        if ((v24 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v12[v23], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v24 + 60) & 0x8000;
        }
        if ((_DWORD)result)
        {
          v12[v21] = 108;
          unint64_t result = __tolower(v24);
          LOBYTE(v24) = result;
          uint64_t v22 = v21 + 1;
          unsigned int v29 = 2;
        }

        else
        {
          v12[v21 - 2] = 108;
          unsigned int v29 = 1;
        }

        v12[v23] = 108;
        v12[v22] = v24;
        v12[v29 + (unint64_t)v21] = 0;
LABEL_34:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10) {
              return result;
            }
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }

          goto LABEL_38;
        }
      }

      return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
      goto LABEL_34;
    default:
      return result;
  }

          unsigned int v29 = 0LL;
          goto LABEL_39;
        }

        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
LABEL_36:
          if ((void)buf) {
            CFRelease((CFTypeRef)buf);
          }
          goto LABEL_38;
        }

        LOWORD(handler[0]) = 0;
        uint64_t v27 = (os_log_s *)MEMORY[0x1895F8DA0];
        unsigned int v28 = "Incorrect response type";
      }

      else
      {
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        LOWORD(handler[0]) = 0;
        uint64_t v27 = (os_log_s *)MEMORY[0x1895F8DA0];
        unsigned int v28 = "Got NULL response dictionary";
      }
    }

    else
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      LOWORD(handler[0]) = 0;
      uint64_t v27 = (os_log_s *)MEMORY[0x1895F8DA0];
      unsigned int v28 = "Failed to get message type response";
    }

    uint64_t v30 = 2;
LABEL_35:
    _os_log_impl(&dword_186981000, v27, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)handler, v30);
    goto LABEL_36;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = device;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unknown logging device type %@",  (uint8_t *)&buf,  0xCu);
  }

      _os_assumes_log();
      return 0LL;
    }

    uint64_t v35 = __error();
    int v6 = *v35;
    a1 = *(void *)(a1 + 32);
    strerror(*v35);
    _OSLogWarningMessage((void *)a1, "failed to copyfile: %s: %s (%d)", v36, v37, v38, v39, v40, v41, (char)a3);
    if (close(v34) != -1) {
      return v6;
    }
    uint64_t v42 = *__error();
    uint64_t v43 = *__error();
    if (v42 != 9)
    {
LABEL_23:
      _os_assumes_log();
      return v6;
    }

    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C695DD0 = v43;
    __break(1u);
LABEL_16:
    if (!*(void *)(a1 + 44) || fchown(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) != -1) {
      return 0LL;
    }
    __error();
    goto LABEL_38;
  }

  if (mkdirat(v14, a3, 0x1FFu))
  {
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = __error();
    strerror(*v16);
    __error();
    uint64_t v59 = (char)a3;
    uint64_t v23 = "failed to mkdir: %s: %s (%d)";
LABEL_25:
    _OSLogWarningMessage(v15, v23, v17, v18, v19, v20, v21, v22, v59);
    return *__error();
  }

  size_t v44 = openat(*(_DWORD *)(a1 + 40), a3, 0);
  if (v44 == -1)
  {
LABEL_24:
    uint64_t v15 = *(void **)(a1 + 32);
    size_t v55 = __error();
    strerror(*v55);
    __error();
    uint64_t v59 = (char)a3;
    uint64_t v23 = "failed to open: %s: %s (%d)";
    goto LABEL_25;
  }

  unsigned int v34 = v44;
  if (!fcopyfile(a2, v44, 0LL, 4u)) {
    goto LABEL_33;
  }
  unint64_t v45 = __error();
  int v6 = *v45;
  uint64_t v46 = *(void **)(a1 + 32);
  strerror(*v45);
  _OSLogWarningMessage(v46, "failed to copyfile: %s: %s (%d)", v47, v48, v49, v50, v51, v52, (char)a3);
  if (close(v34) != -1) {
    return v6;
  }
  uint64_t v53 = *__error();
  unint64_t result = *__error();
  if (v53 != 9) {
    goto LABEL_23;
  }
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
LABEL_42:
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

_DWORD *_os_log_fmt_compose_data(uint64_t a1, uint64_t a2, _BYTE *a3, const char *a4, unsigned int a5, int a6)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  MEMORY[0x1895F8858]();
  unint64_t v13 = (char *)&__src - v12;
  unint64_t result = (_DWORD *)_os_log_fmt_compose_format_copy((_BYTE *)&__src - v12, *v14, *(_WORD *)(a2 + 12));
  if ((*a3 & 0xF0) == 0x30)
  {
    LOBYTE(__src) = 39;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v22 = *(unsigned int *)(a1 + 8);
      if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v22)
      {
        unint64_t result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
        if (a5)
        {
LABEL_7:
          uint64_t v24 = 0LL;
          do
          {
            unint64_t v25 = a4[v24];
            __int16 v26 = *(_WORD *)(a1 + 20);
            if (v24)
            {
              LOBYTE(__src) = 32;
              if ((v26 & 2) == 0)
              {
                uint64_t v27 = *(unsigned int *)(a1 + 8);
                if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v27)
                {
                  unint64_t result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
                }

                else
                {
                  *(_BYTE *)(*(void *)a1 + v27) = 32;
                  unsigned int v28 = *(_DWORD *)(a1 + 8) + 1;
                  *(_DWORD *)(a1 + 8) = v28;
                  if (!*(_BYTE *)(a1 + 22)) {
                    *(_BYTE *)(*(void *)a1 + v28) = 0;
                  }
                }
              }

              __int16 v26 = *(_WORD *)(a1 + 20);
            }

            char v29 = a0123456789abcd_0[v25 >> 4];
            LOBYTE(__src) = v29;
            if ((v26 & 2) == 0)
            {
              uint64_t v30 = *(unsigned int *)(a1 + 8);
              if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v30)
              {
                unint64_t result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
              }

              else
              {
                *(_BYTE *)(*(void *)a1 + v30) = v29;
                unsigned int v31 = *(_DWORD *)(a1 + 8) + 1;
                *(_DWORD *)(a1 + 8) = v31;
                if (!*(_BYTE *)(a1 + 22)) {
                  *(_BYTE *)(*(void *)a1 + v31) = 0;
                }
              }
            }

            char v32 = a0123456789abcd_0[v25 & 0xF];
            LOBYTE(__src) = v32;
            if ((*(_WORD *)(a1 + 20) & 2) == 0)
            {
              uint64_t v33 = *(unsigned int *)(a1 + 8);
              if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v33)
              {
                unint64_t result = (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
              }

              else
              {
                *(_BYTE *)(*(void *)a1 + v33) = v32;
                unsigned int v34 = *(_DWORD *)(a1 + 8) + 1;
                *(_DWORD *)(a1 + 8) = v34;
                if (!*(_BYTE *)(a1 + 22)) {
                  *(_BYTE *)(*(void *)a1 + v34) = 0;
                }
              }
            }

            ++v24;
          }

          while (a5 != v24);
        }

LABEL_54:
        if ((a6 & 1) != 0)
        {
          uint64_t v40 = "…'";
          return (_DWORD *)os_trace_blob_addns(a1, v40, 0xFFFFFFFFFFFFFFFFLL);
        }

        LOBYTE(__src) = 39;
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v41 = *(unsigned int *)(a1 + 8);
          if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v41)
          {
            return (_DWORD *)os_trace_blob_add_slow(a1, &__src, 1uLL);
          }

          else
          {
            *(_BYTE *)(*(void *)a1 + v41) = 39;
            unsigned int v42 = *(_DWORD *)(a1 + 8) + 1;
            *(_DWORD *)(a1 + 8) = v42;
            if (!*(_BYTE *)(a1 + 22)) {
              *(_BYTE *)(*(void *)a1 + v42) = 0;
            }
          }
        }

        return result;
      }

      *(_BYTE *)(*(void *)a1 + v22) = 39;
      unsigned int v23 = *(_DWORD *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v23;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v23) = 0;
      }
    }

    if (a5) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }

  if (*(_BYTE *)(a2 + 10) == 18) {
    v13[result - 1] = 115;
  }
  __int16 v35 = *(_WORD *)(a2 + 8);
  if ((v35 & 2) != 0)
  {
    int __src = *(_DWORD *)(a2 + 20);
    unsigned int v36 = 1;
    if (a5) {
      goto LABEL_31;
    }
LABEL_34:
    if (a6) {
      a4 = (const char *)&_CTF_NULLSTR;
    }
    else {
      a4 = "(null)";
    }
    if ((v35 & 4) != 0)
    {
      unsigned int v37 = v36 + 1;
      *(&__src + v36) = 0x7FFFFFFF;
    }

    else
    {
      unsigned int v37 = v36;
    }

    goto LABEL_45;
  }

  unsigned int v36 = 0;
  if (!a5) {
    goto LABEL_34;
  }
LABEL_31:
  if ((v35 & 8) == 0)
  {
    *(_DWORD *)&v13[result - 1] = 7547438;
    unsigned int v37 = v36 + 1;
    *(&__src + v36) = a5;
    goto LABEL_45;
  }

  unsigned int v37 = v36 + 1;
  uint64_t v38 = v36;
  if ((v35 & 4) == 0)
  {
    unint64_t result = strrchr(v13, 46);
    *unint64_t result = 7547438;
LABEL_43:
    *(&__src + v38) = a5;
    goto LABEL_45;
  }

  unsigned int v39 = *(_DWORD *)(a2 + 24);
  if (v39 > a5) {
    goto LABEL_43;
  }
  *(&__src + v38) = v39;
LABEL_45:
  switch(v37)
  {
    case 2u:
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, __src);
      break;
    case 1u:
      HIBYTE(v43) = HIBYTE(a4);
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, __src);
      break;
    case 0u:
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, (char)a4);
      break;
  }

  if (a6)
  {
    uint64_t v40 = "<…>";
    return (_DWORD *)os_trace_blob_addns(a1, v40, 0xFFFFFFFFFFFFFFFFLL);
  }

  return result;
}

  if (v14)
  {
    ctf_dprintf("CTF container %p is a child\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a1);
    *(_DWORD *)(a1 + 556) |= 2u;
  }

  else
  {
    ctf_dprintf("CTF container %p is a parent\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a1);
  }

  unint64_t result = ctf_hash_create(a1 + 176, v150);
  if (!(_DWORD)result)
  {
    unint64_t result = ctf_hash_create(a1 + 208, *((unint64_t *)&v150 + 1));
    if (!(_DWORD)result)
    {
      unint64_t result = ctf_hash_create(a1 + 240, v151);
      if (!(_DWORD)result)
      {
        unint64_t result = ctf_hash_create( a1 + 272,  vaddvq_s64(vaddq_s64(*(int64x2_t *)((char *)v152 + 8), *(int64x2_t *)((char *)&v152[1] + 8)))
                 + *((void *)&v147 + 1)
                 + v148
                 + *((void *)&v149 + 1)
                 + v152[0].i64[0]
                 + *((void *)&v148 + 1));
        if (!(_DWORD)result)
        {
          uint64_t v38 = *(void *)(a1 + 512);
          unsigned int v39 = malloc(4 * v38 + 4);
          *(void *)(a1 + 496) = v39;
          uint64_t v40 = malloc(4 * v38 + 4);
          *(void *)(a1 + 504) = v40;
          unint64_t result = 35LL;
          v137 = v39;
          if (v39)
          {
            if (v40)
            {
              void *v39 = 0;
              bzero(v39, 4 * v38 + 4);
              bzero(v40, 4 * v38 + 4);
              if (v140 < v138)
              {
                v139 = 0;
                v141 = (uint64_t *)(a1 + 272);
                v136 = 0;
                BOOL v48 = 1LL;
                while (2)
                {
                  else {
                    uint64_t v49 = *((unsigned __int16 *)v142 + 2);
                  }
                  size_t v50 = (**(uint64_t (***)(uint64_t))a1)(v49);
                  else {
                    unint64_t v51 = *((unsigned __int16 *)v142 + 2);
                  }
                  int v52 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(v51);
                  ctf_get_ctt_size((_DWORD *)a1, (uint64_t)v142, (unint64_t *)&v146, &v145);
                  uint64_t v53 = *v142;
                  uint64_t v54 = a1 + 16 * (v53 >> 31);
                  size_t v55 = *(void *)(v54 + 424);
                  if (v55)
                  {
                    uint64_t v56 = v53 & 0x7FFFFFFF;
                    uint64_t v57 = (char *)(v55 + v56);
                    if (*(void *)(v54 + 432) <= v56) {
                      int v58 = 0LL;
                    }
                    else {
                      int v58 = v57;
                    }
                  }

                  else
                  {
                    int v58 = 0LL;
                  }

                  if (v58) {
                    uint64_t v59 = v58;
                  }
                  else {
                    uint64_t v59 = "(?)";
                  }
                  uint64_t v60 = v50 - 1;
                  uint64_t v61 = (uint64_t *)(a1 + 272);
                  switch(v60)
                  {
                    case 0:
                    case 1:
                      uint64_t v64 = strlen(v59);
                      uint64_t v65 = ctf_hash_lookup((uint64_t)v141, a1, v59, v64);
                      if (!v65) {
                        goto LABEL_85;
                      }
                      uint64_t v66 = v65;
                      unint64_t v67 = ctf_type_encoding( (uint64_t (***)(uint64_t))a1,  v65[1],  (unsigned int *)&v143);
                      if (!(v67 | v144)) {
                        v66[1] = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      }
                      goto LABEL_89;
                    case 2:
                      else {
                        unint64_t v69 = *((unsigned __int16 *)v142 + 3);
                      }
                      if (v14 == (*(unsigned int (**)(uint64_t))(*(void *)a1 + 32LL))(v69))
                      {
                        uint64_t v81 = *(int *)(a1 + 564) > 3 ? v142[2] : *((unsigned __int16 *)v142 + 3);
                        if (*(void *)(a1 + 512) >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40LL))(v81))
                        {
                          else {
                            uint64_t v83 = *((unsigned __int16 *)v142 + 3);
                          }
                          uint64_t v84 = *(void *)(a1 + 504);
                          *(_DWORD *)(v84 + 4LL * (*(unsigned int (**)(uint64_t))(*(void *)a1 + 40LL))(v83)) = v48;
                        }
                      }

                      goto LABEL_80;
                    case 3:
                      uint64_t v63 = 12LL;
                      goto LABEL_140;
                    case 4:
                      uint64_t v70 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      unint64_t result = ctf_hash_insert(v141, a1, v70, *v142);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0) {
                        return result;
                      }
                      uint64_t v72 = (v52 & 1) + (unint64_t)v52;
                      uint64_t v63 = 2 * v72;
                      goto LABEL_140;
                    case 5:
                      unint64_t v73 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      unint64_t result = ctf_hash_define((uint64_t *)(a1 + 176), a1, v73, *v142);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0) {
                        return result;
                      }
                      v75 = *(_DWORD *)(a1 + 564);
                      if (v75 == 1 || v146 < 0x2000) {
                        goto LABEL_125;
                      }
                      uint64_t v63 = 16LL * v52;
                      ++v136;
                      goto LABEL_140;
                    case 6:
                      unsigned int v76 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      unint64_t result = ctf_hash_define((uint64_t *)(a1 + 208), a1, v76, *v142);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0) {
                        return result;
                      }
                      v75 = *(_DWORD *)(a1 + 564);
                      if (v75 == 1 || v146 < 0x2000)
                      {
LABEL_125:
                        if (v75 > 3)
                        {
                          uint64_t v72 = 3LL * v52;
LABEL_136:
                          uint64_t v63 = 4 * v72;
                        }

                        else
                        {
LABEL_126:
                          uint64_t v63 = 8LL * v52;
                        }
                      }

                      else
                      {
                        uint64_t v63 = 16LL * v52;
                        ++v139;
                      }

                      goto LABEL_140;
                    case 7:
                      size_t v78 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      unint64_t result = ctf_hash_define((uint64_t *)(a1 + 240), a1, v78, *v142);
                      if ((_DWORD)result != 1018 && (_DWORD)result != 0) {
                        return result;
                      }
                      goto LABEL_126;
                    case 8:
                      else {
                        v80 = *((unsigned __int16 *)v142 + 3);
                      }
                      if (v80 == 8)
                      {
                        uint64_t v61 = (uint64_t *)(a1 + 240);
                      }

                      else
                      {
                        uint64_t v61 = (uint64_t *)(a1 + 176);
                        if (v80 == 7) {
                          uint64_t v61 = (uint64_t *)(a1 + 208);
                        }
                      }

                      v82 = strlen(v59);
                      goto LABEL_80;
                    case 9:
                    case 10:
                    case 11:
                    case 12:
LABEL_80:
                      uint64_t v62 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      unint64_t result = ctf_hash_insert(v61, a1, v62, *v142);
                      uint64_t v63 = 0LL;
                      if (!(_DWORD)result) {
                        goto LABEL_140;
                      }
                      goto LABEL_87;
                    case 13:
LABEL_85:
                      uint64_t v68 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 48LL))(v48, v14 != 0);
                      unint64_t result = ctf_hash_insert(v141, a1, v68, *v142);
                      if ((_DWORD)result)
                      {
                        uint64_t v63 = 4LL;
LABEL_87:
                        if ((_DWORD)result != 1018) {
                          return result;
                        }
                      }

                      else
                      {
LABEL_89:
                        uint64_t v63 = 4LL;
                      }

uint64_t _os_log_fmt_compose_format_copy(_BYTE *a1, void *__s, unsigned __int16 a3)
{
  unsigned __int16 v3 = a3;
  size_t v6 = a3;
  unsigned int v7 = memchr(__s, 125, a3);
  if (v7)
  {
    v3 += (_WORD)__s - (_WORD)v7;
    size_t v6 = v3;
    memcpy(a1, v7, v3);
    *a1 = 37;
  }

  else
  {
    memcpy(a1, __s, v6);
  }

  a1[v6] = 0;
  return v3;
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 1))
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1LL;
  }

  uint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
  __int16 v15 = *(_WORD *)(a1 + 20);
  if (**(_BYTE **)(a3 + 40) == 66)
  {
    if (scalar) {
      uint64_t v16 = "YES";
    }
    else {
      uint64_t v16 = "NO";
    }
    if (scalar) {
      size_t v17 = 3LL;
    }
    else {
      size_t v17 = 2LL;
    }
    if ((v15 & 2) != 0) {
      return 1LL;
    }
LABEL_18:
    uint64_t v18 = *(unsigned int *)(a1 + 8);
    if (v17 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
    {
      os_trace_blob_add_slow(a1, v16, v17);
    }

    else
    {
      memcpy((void *)(*(void *)a1 + v18), v16, v17);
      unsigned int v19 = *(_DWORD *)(a1 + 8) + v17;
      *(_DWORD *)(a1 + 8) = v19;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v19) = 0;
      }
    }

    return 1LL;
  }

  if (scalar) {
    uint64_t v16 = "true";
  }
  else {
    uint64_t v16 = "false";
  }
  if (scalar) {
    size_t v17 = 4LL;
  }
  else {
    size_t v17 = 5LL;
  }
  if ((v15 & 2) == 0) {
    goto LABEL_18;
  }
  return 1LL;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    int v18 = *a5;
    if (*a5)
    {
      strerror(*a5);
      os_trace_blob_addf(a1, "[%d: %s]", v19, v20, v21, v22, v23, v24, v18);
    }

    else
    {
      os_trace_blob_addf(a1, "[%d: %s]", v12, v13, v14, v15, v16, v17, 0);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_darwin_mode( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int *a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    unsigned int v15 = *a5;
    __src[0] = aPcDBLSW[(unsigned __int16)*a5 >> 12];
    if ((v15 & 0x40) != 0) {
      __int8 v16 = 120;
    }
    else {
      __int8 v16 = 45;
    }
    if ((v15 & 0x40) != 0) {
      __int8 v17 = 115;
    }
    else {
      __int8 v17 = 83;
    }
    if ((v15 & 8) != 0) {
      __int8 v18 = 120;
    }
    else {
      __int8 v18 = 45;
    }
    if ((v15 & 8) != 0) {
      __int8 v19 = 115;
    }
    else {
      __int8 v19 = 83;
    }
    int8x16_t v20 = (int8x16_t)vdupq_n_s32(v15);
    v21.i16[0] = 11565;
    v21.i8[3] = 45;
    v21.i8[4] = 45;
    v21.i16[3] = 11565;
    v21.i8[2] = v16;
    v21.i8[5] = v18;
    v22.i16[0] = 30578;
    v22.i8[2] = v17;
    v22.i8[3] = 114;
    v22.i8[4] = 119;
    v22.i8[5] = v19;
    v22.i16[3] = 30578;
    *(int8x8_t *)&__src[1] = vbsl_s8( vmovn_s16( vuzp1q_s16( (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_1869D9110)),  (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_1869D9120)))),  v21,  v22);
    if ((v15 & 1) != 0) {
      char v23 = 120;
    }
    else {
      char v23 = 45;
    }
    if ((v15 & 1) != 0) {
      char v24 = 116;
    }
    else {
      char v24 = 84;
    }
    if ((v15 & 0x200) != 0) {
      char v25 = v24;
    }
    else {
      char v25 = v23;
    }
    __src[9] = v25;
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
    {
      uint64_t v26 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1) <= 9)
      {
        os_trace_blob_add_slow(a1, __src, 0xAuLL);
      }

      else
      {
        uint64_t v27 = *(void *)a1 + v26;
        *(void *)uint64_t v27 = *(void *)__src;
        *(_WORD *)(v27 + 8) = *(_WORD *)&__src[8];
        unsigned int v28 = *(_DWORD *)(a1 + 8) + 10;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_darwin_signal( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, _DWORD *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    uint64_t v18 = *a5;
    else {
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v12, v13, v14, v15, v16, v17, *a5);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_mach_errno( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, kern_return_t *a5, uint64_t a6)
{
  kern_return_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    uint64_t v15 = *a5;
    else {
      bootstrap_strerror(*a5);
    }
    os_trace_blob_addf(a1, "[%#x: %s]", v16, v17, v18, v19, v20, v21, v15);
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_trace_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 != 4 || !is_integer)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
    return 1LL;
  }

  int v18 = *a5;
  os_trace_blob_addf(a1, "0x%X", v12, v13, v14, v15, v16, v17, *a5);
  uint64_t v19 = 0LL;
  char v20 = 1;
  do
  {
    if ((_os_log_fmt_builtin_trace_mode_masks[v19] & v18) == 0) {
      goto LABEL_20;
    }
    if ((v20 & 1) != 0) {
      int8x8_t v21 = "(";
    }
    else {
      int8x8_t v21 = ", ";
    }
    if ((v20 & 1) != 0) {
      size_t v22 = 3LL;
    }
    else {
      size_t v22 = 2LL;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v23 = *(unsigned int *)(a1 + 8);
      if (v22 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1))
      {
        os_trace_blob_add_slow(a1, v21, v22);
      }

      else
      {
        memcpy((void *)(*(void *)a1 + v23), v21, v22);
        unsigned int v24 = *(_DWORD *)(a1 + 8) + v22;
        *(_DWORD *)(a1 + 8) = v24;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v24) = 0;
        }
      }
    }

    char v25 = *(char **)&_os_log_fmt_builtin_trace_mode_masks[v19 + 2];
    unint64_t v26 = strlen(v25);
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      goto LABEL_18;
    }
    int v27 = v26;
    uint64_t v28 = *(unsigned int *)(a1 + 8);
    if (v26 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
    {
      os_trace_blob_add_slow(a1, v25, v26);
LABEL_18:
      char v20 = 0;
      goto LABEL_20;
    }

    memcpy((void *)(*(void *)a1 + v28), v25, v26);
    unsigned int v29 = *(_DWORD *)(a1 + 8) + v27;
    *(_DWORD *)(a1 + 8) = v29;
    char v20 = *(_BYTE *)(a1 + 22);
    if (v20) {
      goto LABEL_18;
    }
    *(_BYTE *)(*(void *)a1 + v29) = 0;
LABEL_20:
    v19 += 4LL;
  }

  while (v19 != 28);
  if ((v20 & 1) == 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v30 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 1)
    {
      os_trace_blob_add_slow(a1, ")", 2uLL);
    }

    else
    {
      *(_WORD *)(*(void *)a1 + v30) = 10528;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 2;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v31) = 0;
      }
    }
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6)
{
  if ((_DWORD)a6 == 4)
  {
    time_t v14 = *(int *)a5;
    goto LABEL_6;
  }

  if ((_DWORD)a6 != 8)
  {
LABEL_8:
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1LL;
  }

  time_t v14 = *a5;
LABEL_6:
  os_trace_blob_add_localtime(a1, v14, 0, 3u);
  return 1LL;
}

uint64_t _os_log_fmt_builtin_timespec( tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *a5, a5[1], 0);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_timeval( tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *(void *)a5, *(_DWORD *)(a5 + 8), 1u);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_uuid_t( size_t a1, int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *uu, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
    {
      _os_log_fmt_decode_error(a1);
    }

    else
    {
      uuid_unparse_upper(uu, out);
      unint64_t v9 = strlen(out);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v10 = v9;
        uint64_t v11 = *(unsigned int *)(a1 + 8);
        if (v9 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1))
        {
          os_trace_blob_add_slow(a1, out, v9);
        }

        else
        {
          memcpy((void *)(*(void *)a1 + v11), out, v9);
          unsigned int v12 = *(_DWORD *)(a1 + 8) + v10;
          *(_DWORD *)(a1 + 8) = v12;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v12) = 0;
          }
        }
      }
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }

  return 1LL;
}

BOOL _os_log_fmt_spec_is_integer(unsigned __int8 a1, int a2)
{
  int v2 = a2 ^ 1;
  if (v2) {
    return a1 - 1 < 0xC;
  }
  else {
    return a1 == 13;
  }
}

uint64_t _os_log_fmt_builtin_scaled( uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6, void *a7)
{
  unint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
  double v24 = 0.0;
  int v25 = 0;
  if (*a7 && a7[1] && scalar >= 0x3E8)
  {
    int v25 = 0;
    do
    {
      int v26 = scalar;
      uint64_t v27 = a7[v25 + 2];
      ++v25;
      scalar /= a2;
    }

    while (v27 && scalar > 0x3E7);
    double v24 = (double)(v26 - scalar * a2) * 100.0;
  }

  unsigned int v28 = vcvtad_u64_f64(v24 / (double)a2);
  if (v28 == 100) {
    unint64_t v29 = scalar + 1;
  }
  else {
    unint64_t v29 = scalar;
  }
  if (v28 == 100) {
    unsigned int v28 = 0;
  }
  if (!v25) {
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
  }
  if (v29 <= 9 && -10 * (v28 / 0xA) != -v28) {
    return os_trace_blob_addf(a1, "%llu.%02u %s", v18, v19, v20, v21, v22, v23, v29);
  }
  if (v28 && v29 <= 0x63) {
    return os_trace_blob_addf(a1, "%llu.%01u %s", v18, v19, v20, v21, v22, v23, v29);
  }
  else {
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
  }
}

LABEL_85:
    LOBYTE(logMessage) = 0;
    return logMessage & 1;
  }

  if (v21 == 24579)
  {
    uint64_t v22 = event->var5.var0.var2.var0;
    if (v22->var0.var0 == 24579 && !v22->var0.var1 && v22->var0.var2 >= 0x31)
    {
      self->_eint.type = 2560LL;
      uint64_t v23 = v22->var1.var2.var6;
      self->_eint.activity_id = v22->var1.var8.var5;
      double v24 = (mach_timebase_info *)event->var5.var0.var0;
      self->_eint.common.timestamp = v23;
      self->_eint.common.timebase = v24[2];
      int v25 = event->var5.var0.var0;
      int v26 = self->_tsdb;
      if (v26)
      {
        uint64_t v27 = _timesync_continuous_to_wall_time((uint64_t)v26, &v25->var1.var10[128], v23, &self->_eint.common.tz);
        unsigned int v28 = v27 / 0x3B9ACA00;
        unint64_t v29 = v27 % 0x3B9ACA00 / 0x3E8;
        event = self->_event;
        uint64_t v30 = self->_efv | 1;
      }

      else
      {
        unsigned int v28 = v25->var1.var0.var2;
        unint64_t v29 = v25->var1.var0.var3;
        self->_eint.common.tz = self->_tz;
        uint64_t v59 = v25->var1.var0.var8.var0;
        if (v59 != v23)
        {
          uint64_t v61 = v25->var1.var0.var0.numer;
          uint64_t v60 = v25->var1.var0.var0.denom;
          if (v59 >= v23)
          {
            unint64_t v67 = (v59 - v23) * v61 / v60;
            v28 -= v67 / 0x3B9ACA00;
            v29 -= v67 % 0x3B9ACA00 / 0x3E8;
            if (v29 < 0)
            {
              --v28;
              v29 += 1000000;
            }
          }

          else
          {
            uint64_t v62 = (v23 - v59) * v61 / v60;
            v28 += v62 / 0x3B9ACA00;
            v29 += v62 % 0x3B9ACA00 / 0x3E8;
            if (v29 > 999999)
            {
              ++v28;
              v29 -= 1000000;
            }
          }
        }

        uint64_t v30 = 1LL;
      }

      self->_eint.common.tv_gmt.tv_sec = v28;
      *(void *)&self->_eint.common.tv_gmt.tv_usec = v29;
      self->_eint.common.image_uuid = (char *)v22->var1.var8.var6;
      self->_efv = v30;
      self->_eint.statedump.ttl = v22->var1.var3.var2;
      uint64_t v68 = event->var5.var0.var2.var0;
      unint64_t v69 = v68->var0.var2;
      if (v69 - 48 >= 0xC8)
      {
        uint64_t v70 = *(unsigned int *)&v68->var1.var10[52];
        if (v69 - 248 >= v70)
        {
          self->_eint.common.sz = v70;
          logMessage = (NSString *)event->var5.var0.var2.var3;
LABEL_84:
          LOBYTE(logMessage) = logMessage != 0LL;
          return logMessage & 1;
        }
      }
    }

    goto LABEL_85;
  }

  uint64_t v43 = (*((void *)v17 + 2) & 0xFFFFFFFFFFFFLL) + *((void *)var1 + 1);
  size_t v44 = (mach_timebase_info *)event->var5.var0.var0;
  self->_eint.common.timestamp = v43;
  self->_eint.common.timebase = v44[2];
  uint64_t v45 = event->var5.var0.var0;
  uint64_t v46 = self->_tsdb;
  if (v46)
  {
    unsigned int v47 = _timesync_continuous_to_wall_time((uint64_t)v46, &v45->var1.var10[128], v43, &self->_eint.common.tz);
    BOOL v48 = v47 / 0x3B9ACA00;
    uint64_t v49 = v47 % 0x3B9ACA00 / 0x3E8;
  }

  else
  {
    BOOL v48 = v45->var1.var0.var2;
    uint64_t v49 = v45->var1.var0.var3;
    self->_eint.common.tz = self->_tz;
    size_t v50 = v45->var1.var0.var8.var0;
    if (v50 != v43)
    {
      int v52 = v45->var1.var0.var0.numer;
      unint64_t v51 = v45->var1.var0.var0.denom;
      if (v50 >= v43)
      {
        uint64_t v54 = (v50 - v43) * v52 / v51;
        v48 -= v54 / 0x3B9ACA00;
        v49 -= v54 % 0x3B9ACA00 / 0x3E8;
        if (v49 < 0)
        {
          --v48;
          v49 += 1000000;
        }
      }

      else
      {
        uint64_t v53 = (v43 - v50) * v52 / v51;
        v48 += v53 / 0x3B9ACA00;
        v49 += v53 % 0x3B9ACA00 / 0x3E8;
        if (v49 > 999999)
        {
          ++v48;
          v49 -= 1000000;
        }
      }
    }
  }

  self->_eint.common.tv_gmt.tv_sec = v48;
  *(void *)&self->_eint.common.tv_gmt.tv_usec = v49;
  self->_eint.common.sz = *((unsigned __int16 *)v17 + 11);
  self->_eint.common.trace_id = *(void *)v17;
  self->_eint.common.thread = *((void *)v17 + 1);
  size_t v55 = *(void *)v17;
  if (v55 <= 6 && ((1 << v55) & 0x58) != 0) {
    uint64_t v56 = (unint64_t)*(void *)v17 << 8;
  }
  else {
    uint64_t v56 = bswap32(*(void *)v17) >> 16;
  }
  self->_eint.type = v56;
  if (!var3) {
    goto LABEL_85;
  }
  LOBYTE(logMessage) = 0;
  switch(*(_BYTE *)v17)
  {
    case 2:
      int v58 = *((unsigned __int8 *)v17 + 1);
      switch(v58)
      {
        case 1:
          unint64_t result = _parse_activity_create((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
        case 3:
          unint64_t result = _parse_activity_useraction((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
        case 2:
          unint64_t result = _parse_activity_swap((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
        default:
LABEL_49:
          unint64_t result = _parse_log_message((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
      }

      break;
    case 3:
      return _parse_trace((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
    case 4:
    case 6:
      goto LABEL_49;
    case 7:
      return _parse_loss((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
    default:
      return logMessage & 1;
  }

  return result;
}

        uint64_t v71 = v55;
        uint64_t v72 = 0;
        v130 = v71;
      }

      else
      {
        uint64_t v71 = 0LL;
        uint64_t v72 = 1;
      }

LABEL_39:
  if (*p_image_path) {
    self->_senderImagePath = (NSString *)(id)objc_msgSend(NSString, "stringWithUTF8String:");
  }
}

            if (v14)
            {
              (*(void (**)(CFTypeRef))(mobdevtab + 88))(v14);
              CFRelease(v14);
              unsigned int v47 = 0LL;
            }

            unsigned int v31 = 0LL;
            size_t v6 = 0LL;
            if (!v29) {
              goto LABEL_43;
            }
            goto LABEL_42;
          }

    __error();
    _os_assumes_log();
    goto LABEL_36;
  }

  uint64_t v66 = fileno(v64);
  unint64_t v67 = v112;
  if (fchmod(v66, 0x1A4u) == -1)
  {
    __error();
    _os_assumes_log();
  }

  uint64_t v68 = fileno(v64);
  unint64_t v69 = (void *)v120;
  if (lseek(v68, 0LL, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }

  uint64_t v70 = fileno(v64);
  uint64_t v71 = (*((uint64_t (**)(id, uint64_t, const char *))v112 + 2))(v112, v70, "Info.plist");
  if (v71)
  {
    uint64_t v72 = v71;
    unint64_t v73 = fileno(v64);
    if (fcntl(v73, 50, v124) == -1)
    {
      __error();
      _os_assumes_log();
    }

    strerror(v72);
    v74 = v99;
    _OSLogWarningMessage( v99,  "failed copy handler: '%s' to 'Info.plist': %s (%d)",  v75,  v76,  v77,  v78,  v79,  v80,  (char)v124);
    if (fclose(v64) != -1) {
      goto LABEL_36;
    }
    goto LABEL_39;
  }

  if (fclose(v64) == -1)
  {
    __error();
    _os_assumes_log();
  }

  uint64_t v81 = 0LL;
  v74 = v99;
LABEL_43:

  return v81;
}

void _resolve_uuid_slow(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (!v1) {
    return;
  }
  unsigned __int16 v3 = (void *)(a1 + 112);
  if (!*(void *)(a1 + 112)) {
    return;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 328) + 96LL);
  if (v4)
  {
    if (!*(void *)(a1 + 160)) {
      return;
    }
  }

  uuidpath_lookup_fd(*(_DWORD *)(a1 + 352), v1, (void *)(a1 + 48));
  if (*(void *)(a1 + 8) == 2560LL || (*(_BYTE *)(a1 + 168) & 2) != 0)
  {
    if (uuidpath_lookup_fd(*(_DWORD *)(a1 + 352), *(const void **)(a1 + 112), (void *)(a1 + 120))
      || (*(_BYTE *)(a1 + 168) & 2) == 0)
    {
      goto LABEL_19;
    }

    uint64_t v8 = *(unsigned int *)(a1 + 352);
    unint64_t v9 = *(__n128 **)(a1 + 104);
    unint64_t v10 = *(void *)(a1 + 152);
    uint64_t v13 = 0LL;
    uuidpath_sharedcache_resolve_fd(v8, v9, 0LL, v10, 0LL, 0LL, 0LL, 0LL, a1 + 120, &v13, 0LL);
LABEL_18:
    *(void *)(a1 + 152) -= v13;
    goto LABEL_19;
  }

  if (v4)
  {
    uint64_t v13 = 0LL;
    int v5 = *(__int16 *)(v4 + 2);
    size_t v6 = (const char **)(a1 + 288);
    if (v5 >= 0) {
      size_t v6 = 0LL;
    }
    if (*(_BYTE *)v4 == 6) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = 0LL;
    }
    if ((v5 & 6 | 8) != 0xC)
    {
      uuidpath_resolve_fd( *(_DWORD *)(a1 + 352),  *(const void **)(a1 + 112),  *(void *)(a1 + 160),  *(void *)(a1 + 280),  (const char **)(a1 + 176),  v7,  (void *)(a1 + 120),  0LL);
      goto LABEL_19;
    }

    uuidpath_sharedcache_resolve_fd( *(unsigned int *)(a1 + 352),  *(__n128 **)(a1 + 112),  *(void *)(a1 + 160),  *(void *)(a1 + 152),  *(void *)(a1 + 280),  (const char **)(a1 + 176),  v7,  v3,  a1 + 120,  &v13,  0LL);
    goto LABEL_18;
  }

LABEL_21:
        self->_hdr = hdr_buffer;
        goto LABEL_25;
      }
    }

  int v25 = xpc_dictionary_dup_fd(v7, "uuidtextdir_fd");
  int v26 = xpc_dictionary_get_string(v7, "uuidtextdir_sbext");
  if ((_DWORD)v25 == -1)
  {
    uint64_t v27 = 0LL;
    goto LABEL_26;
  }

  uint64_t v27 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:sandboxExtensionToken:",  v25,  v26);
  if (close(v25) != -1)
  {
LABEL_26:
    unint64_t v9 = (void *)[objc_alloc((Class)a1) initWithDiagnosticsDirectory:v19 timesyncDirectory:v22 UUIDTextDirectory:v27];

    goto LABEL_27;
  }

  unsigned int v28 = *__error();
  unint64_t result = (id)*__error();
  if (v28 != 9)
  {
    _os_assumes_log();
    goto LABEL_26;
  }

          uint64_t v17 = 0LL;
          unsigned int v37 = 2;
          goto LABEL_22;
        }
      }

      else if (v25)
      {
        goto LABEL_13;
      }

      _OSLogWarningMessage(v5, "snapshot failed: no reply from logd", v19, v20, v21, v22, v23, v24, v39);
      unsigned int v36 = __error();
      goto LABEL_21;
    }

    _OSLogWarningMessage(v5, "snapshot failed: no connection to logd", v7, v8, v9, v10, v11, v12, v39);
    uint64_t v17 = 0LL;
    *__error() = 2;
  }

  return v31;
}

LABEL_8:
    int v5 = 1LL;
LABEL_9:
    self->_messageState = v5;
    return;
  }

  hdr = proxy->_eint.var0.log_message.hdr;
  if (hdr)
  {
    self->_hdr = hdr;
    self->_pubuint64_t data = proxy->_eint.var0.log_message.pubdata;
    self->_pubsize = proxy->_eint.var0.log_message.pubdata_sz;
    goto LABEL_25;
  }

  pubuint64_t data = (const os_log_fmt_hdr_s *)os_log_fmt_extract_pubdata( proxy->_eint.var0.log_message.buffer,  (unsigned __int16)proxy->_eint.var0.activity_create.unique_pid,  &proxy->_eint.var0.timesync.continuous_time,  &proxy->_eint.var0.log_message.pubdata_sz);
  proxy->_eint.var0.timesync.flags = (unint64_t)pubdata;
  self->_hdr = pubdata;
  self->_pubuint64_t data = proxy->_eint.var0.log_message.pubdata;
  self->_pubsize = proxy->_eint.var0.log_message.pubdata_sz;
  if (!pubdata) {
    goto LABEL_8;
  }
LABEL_25:
  message = proxy->_eint.common.message;
  if (!message)
  {
    message = _os_log_resolve_format( (__n128 *)proxy->_eint.common.image_uuid,  proxy->_eint.common.trace_id,  proxy->_eint.common.format_offset,  0LL);
    proxy->_eint.common.message = (char *)message;
  }

  self->_fmt = message;
  self->_privuint64_t data = proxy->_eint.var0.log_message.privdata;
  self->_privsize = proxy->_eint.var0.log_message.privdata_sz;
  uint64_t v21 = 1LL;
  self->_variant = v21;
  self->_placeholderCount = 0;
  if (!message) {
    goto LABEL_33;
  }
  uint64_t v22 = 4LL;
  self->_sizeof_long = v22;
  -[OSLogEventDecomposedMessage _initializePlaceholders](self, "_initializePlaceholders");
}

    v5->_cursor = cursor;
  }

  else
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
  }
}

CFStringRef _compose_log_message(uint64_t a1)
{
  v52[128] = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)(a1 + 168) & 2) == 0)
  {
    if ((*(void *)(a1 + 336) & 3LL) == 1) {
      _resolve_uuid_slow(a1);
    }
    uint64_t v47 = (uint64_t)v52;
    uint64_t v48 = 0x40000000000LL;
    __int16 v50 = 0;
    char v51 = 0;
    int v49 = 0x10000;
    uint64_t v2 = *(void *)(a1 + 192);
    if (!v2)
    {
      if (!*(void *)(a1 + 176)) {
        return @"<compose failure [missing precomposed log]>";
      }
      uint64_t v21 = (void *)NSString;
      return (const __CFString *)objc_msgSend(v21, "stringWithUTF8String:");
    }

    unint64_t v3 = *(void *)(a1 + 200);
    if (!(v3 >> 16) && !(*(void *)(a1 + 240) >> 16))
    {
      if (*(void *)(a1 + 8) == 768LL)
      {
        if (v3 - 1733 >= 0xFFFFFFFFFFFFF93CLL)
        {
          uint64_t v4 = (unsigned __int8 *)(v3 + v2 - 1);
          if ((_WORD)v3 + ~*v4 + 2 * *v4 != 0xFFFE)
          {
            MEMORY[0x1895F8858]();
            pubuint64_t data = (unsigned __int8 *)&v40 - v8;
            *pubuint64_t data = 0;
            pubdata[1] = v7;
            if ((_DWORD)v7)
            {
              uint64_t v10 = -v7;
              uint64_t v11 = &v5[v6 + ~v7];
              unsigned int v12 = pubdata + 2;
              uint64_t v13 = @"<compose failure [corrupt log]>";
              while (1)
              {
                size_t v14 = v4[v10] & 0x3F;
                uint64_t v15 = &v5[v14];
                if (&v5[v14] > v11) {
                  return v13;
                }
                *unsigned int v12 = 0;
                v12[1] = v14;
                uint64_t v16 = v12 + 2;
                memcpy(v12 + 2, v5, v14);
                unsigned int v12 = &v16[v14];
                int v5 = v15;
                if (__CFADD__(v10++, 1LL)) {
                  goto LABEL_28;
                }
              }
            }

            goto LABEL_28;
          }
        }
      }

      else
      {
        pubuint64_t data = *(unsigned __int8 **)(a1 + 208);
        if (pubdata
          || (pubuint64_t data = os_log_fmt_extract_pubdata( *(_BYTE **)(a1 + 192),  (unsigned __int16)*(void *)(a1 + 200),  (void *)(a1 + 216),  (unsigned __int16 *)(a1 + 224))) != 0LL)
        {
LABEL_28:
          objc_msgSend((id)a1, "set_unreliableIdentifier:", 0);
          if ((*(void *)(a1 + 8) | 0x200LL) == 0x600 && (*pubdata & 0x10) != 0) {
            objc_msgSend((id)a1, "set_unreliableIdentifier:", 1);
          }
          uint64_t v22 = *(char **)(a1 + 176);
          if (v22) {
            goto LABEL_34;
          }
          uint64_t v23 = _os_log_resolve_format(*(__n128 **)(a1 + 112), *(void *)(a1 + 72), *(void *)(a1 + 160), &v46);
          *(void *)(a1 + 176) = v23;
          if (v23)
          {
            uint64_t v22 = (char *)v23;
LABEL_34:
            if (*(void *)(a1 + 8) == 768LL) {
              uint64_t v24 = 1LL;
            }
            else {
              uint64_t v24 = 2LL;
            }
            int v25 = *(unsigned __int8 *)(a1 + 364);
            if ((*(_DWORD *)(a1 + 168) & 1) != 0) {
              uint64_t v26 = 4LL;
            }
            else {
              uint64_t v26 = 8LL;
            }
            uint64_t v27 = *(void *)(a1 + 216);
            int v28 = *(unsigned __int16 *)(a1 + 224);
            uint64_t v29 = *(void *)(a1 + 232);
            uint64_t v30 = *(void *)(a1 + 240);
            int v31 = *(_DWORD *)(a1 + 352);
            uint64_t v32 = *(void *)(a1 + 72);
            __int128 v40 = *(_OWORD *)(a1 + 104);
            LODWORD(v41) = v31;
            uint64_t v42 = v32;
            uint64_t v43 = 0LL;
            uint64_t v44 = 0LL;
            uint64_t v45 = 0LL;
            if (v25) {
              unsigned int v33 = 3;
            }
            else {
              unsigned int v33 = 1;
            }
            os_log_fmt_compose((size_t)&v47, v22, v24, v33, v26, pubdata, v27, v28, v29, v30, (uint64_t)&v40);
            char v34 = v50;
            __int16 v35 = (char *)v47;
            uint64_t v47 = 3954044928LL;
            __int16 v50 = 0;
            uint64_t v36 = v48;
            if ((v34 & 1) == 0) {
              __int16 v35 = (char *)_os_trace_memdup();
            }
            if (*(void *)(a1 + 8) == 1536LL && !*(void *)(a1 + 288))
            {
              old_signpost_name_end = _find_old_signpost_name_end(v35, *(const char **)(a1 + 176));
              if (old_signpost_name_end)
              {
                v36 += (uint64_t)&v35[~(unint64_t)old_signpost_name_end];
                uint64_t v38 = _os_trace_memdup();
                free(v35);
                __int16 v35 = (char *)v38;
              }
            }

            id v39 = objc_alloc(NSString);
            uint64_t v13 = (const __CFString *)objc_msgSend( v39,  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v35,  v36,  4,  1,  (void)v40,  *((void *)&v40 + 1),  v41,  v42,  v43,  v44,  v45);
            *(void *)(a1 + 408) = v13;
            if (!v13)
            {
              free(v35);
              return @"<compose failure [illegible log arguments]>";
            }

            return v13;
          }

          uint64_t v21 = (void *)NSString;
          return (const __CFString *)objc_msgSend(v21, "stringWithUTF8String:");
        }
      }
    }

    return @"<compose failure [corrupt log]>";
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 328) + 56LL);
  if (*(_DWORD *)v18 == 24580 && !*(_DWORD *)(v18 + 4) && *(void *)(v18 + 8) >= 0x49uLL)
  {
    uint64_t v19 = _simple_support_validate_payload(v18, 0LL);
    if (v19) {
      return (const __CFString *)[NSString stringWithUTF8String:v19 + *(unsigned int *)(v19 + 4) + 12];
    }
  }

  return 0LL;
}

char *_find_old_signpost_name_end(const char *a1, const char *a2)
{
  unint64_t result = strchr(a1, 32);
  if (!result)
  {
    size_t v5 = strlen(a1);
    if (!strncmp(a1, a2, v5) && !a1[v5] && a2[v5] == 32)
    {
      if (a2[v5 + 1]) {
        return 0LL;
      }
      else {
        return (char *)&a1[v5 - 1];
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t _parse_activity_swap(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 514LL;
  __int16 v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) == 0)
  {
    LODWORD(v5) = 0;
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v5 = (v5 + 8);
    goto LABEL_7;
  }

  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0LL;
  }
  unint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v6);
  __int16 v4 = *(_WORD *)(a2 + 2);
  LODWORD(v5) = 8;
  if ((v4 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  if ((v4 & 0x200) == 0) {
    return 1LL;
  }
  if ((unint64_t)v5 + 8 <= *(unsigned __int16 *)(a2 + 22))
  {
    *(void *)(a1 + 192) = *(void *)(a2 + v5 + 24);
    return 1LL;
  }

  return 0LL;
}

uint64_t _parse_activity_create(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 513LL;
  __int16 v3 = *(_WORD *)(a2 + 2);
  if ((v3 & 1) == 0)
  {
    LODWORD(v4) = 0;
    if ((v3 & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v5 = v4;
    unint64_t v4 = v4 + 8LL;
    *(void *)(a1 + 200) = *(void *)(a2 + v5 + 24);
    if ((*(_WORD *)(a2 + 2) & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0LL;
  }
  *(void *)(a1 + 192) = *(void *)(a2 + 24);
  __int16 v3 = *(_WORD *)(a2 + 2);
  LODWORD(v4) = 8;
  if ((v3 & 0x10) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v3 & 0x200) != 0)
  {
LABEL_9:
    uint64_t v6 = v4;
    unint64_t v4 = v4 + 8LL;
    if (v4 <= *(unsigned __int16 *)(a2 + 22))
    {
      *(void *)(a1 + 64) = *(void *)(a2 + v6 + 24);
      goto LABEL_11;
    }

    return 0LL;
  }

uint64_t _parse_activity_useraction(uint64_t a1, uint64_t a2)
{
  __int16 v8 = 0;
  *(void *)(a1 + 8) = 515LL;
  __int16 v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) == 0)
  {
    unint64_t v5 = 8LL;
    if ((v4 & 0x10) == 0) {
      return _parse_location((void *)a1, a2, &v8);
    }
    goto LABEL_6;
  }

  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0LL;
  }
  __int16 v8 = 8;
  unint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v6);
  unint64_t v5 = 16LL;
  if ((*(_WORD *)(a2 + 2) & 0x10) != 0)
  {
LABEL_6:
    if (v5 <= *(unsigned __int16 *)(a2 + 22))
    {
      __int16 v8 = v5;
      return _parse_location((void *)a1, a2, &v8);
    }

    return 0LL;
  }

  return _parse_location((void *)a1, a2, &v8);
}

uint64_t _parse_log_message(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int16 v4 = *(void **)(a1 + 328);
  unsigned __int16 v28 = 0;
  __int16 v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) != 0)
  {
    if (!(*(void *)(a2 + 16) >> 51)) {
      return 0LL;
    }
    LODWORD(v6) = 8;
    unsigned __int16 v28 = 8;
    unint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 56) = v7;
    *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v7);
    __int16 v5 = *(_WORD *)(a2 + 2);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }

  else
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0) {
      goto LABEL_3;
    }
  }

  unint64_t v6 = (v6 + 8);
  unsigned __int16 v28 = v6;
  if ((v5 & 0x100) != 0)
  {
LABEL_9:
    unsigned __int16 v28 = v6 + 4;
    uint64_t v8 = a2 + v6;
    unint64_t v9 = *(unsigned __int16 *)(v8 + 24);
    uint64_t v10 = *(unsigned __int16 *)(v8 + 26);
    if ((v10 + v9) <= 0x1000)
    {
      uint64_t v11 = v4[10];
      if (4096 - v11 <= v9)
      {
        *(void *)(a1 + 232) = v11 + v4[9] + v9 - 4096;
        *(void *)(a1 + 240) = v10;
        *(void *)(a1 + 184) += v10;
      }
    }
  }

uint64_t _parse_trace(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v9 = 0;
  *(void *)(a1 + 8) = 768LL;
  __int16 v4 = *(_WORD *)(a2 + 2);
  if ((v4 & 1) != 0)
  {
    if (!(*(void *)(a2 + 16) >> 51)) {
      return 0LL;
    }
    unsigned __int16 v9 = 8;
    unint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 56) = v6;
    *(void *)(a1 + 64) = _os_activity_map_find_parent(*(void **)(a1 + 320), v6);
    unint64_t v5 = 16LL;
    if ((*(_WORD *)(a2 + 2) & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_6:
    if (v5 <= *(unsigned __int16 *)(a2 + 22))
    {
      unsigned __int16 v9 = v5;
      goto LABEL_8;
    }

    return 0LL;
  }

  unint64_t v5 = 8LL;
  if ((v4 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_8:
  uint64_t result = _parse_location((void *)a1, a2, &v9);
  if ((_DWORD)result)
  {
    uint64_t v8 = v9;
    *(void *)(a1 + 192) = a2 + v9 + 24;
    *(void *)(a1 + 200) = *(unsigned __int16 *)(a2 + 22) - v8;
    return 1LL;
  }

  return result;
}

BOOL _parse_loss(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 1792LL;
  unint64_t v2 = *(void *)(a2 + 16) >> 51;
  if (v2 >= 3)
  {
    unint64_t v4 = *(void *)(a2 + 24);
    unint64_t v5 = *(void *)(a2 + 32);
    int v6 = *(_DWORD *)(a2 + 40);
    *(void *)(a1 + 216) = 0LL;
    unint64_t v7 = (void *)(a1 + 216);
    *(void *)(a1 + 192) = v4;
    *(void *)(a1 + 200) = 0LL;
    *(void *)(a1 + 208) = 0LL;
    *(void *)(a1 + 224) = v5;
    *(void *)(a1 + 232) = 0LL;
    *(void *)(a1 + 240) = 0LL;
    *(void *)(a1 + 248) = 0LL;
    *(_DWORD *)(a1 + 256) = v6;
    uint64_t v8 = *(void *)(a1 + 328);
    uint64_t v9 = *(void *)(v8 + 40);
    uint64_t v10 = *(void *)(a1 + 344);
    if (v10)
    {
      unint64_t v11 = _timesync_continuous_to_wall_time(v10, (void *)(v9 + 144), v4, v7);
      unint64_t v12 = v11 / 0x3B9ACA00;
      unint64_t v13 = v11 % 0x3B9ACA00 / 0x3E8;
      uint64_t v14 = *(void *)(a1 + 328);
      uint64_t v15 = *(void *)(a1 + 344);
      *(void *)(a1 + 200) = v12;
      *(void *)(a1 + 208) = v13;
      uint64_t v16 = (void *)(a1 + 248);
      uint64_t v17 = *(void *)(v14 + 40);
      if (v15)
      {
        unint64_t v18 = _timesync_continuous_to_wall_time(v15, (void *)(v17 + 144), v5, v16);
        unint64_t v19 = v18 / 0x3B9ACA00;
        int v20 = v18 % 0x3B9ACA00 / 0x3E8;
LABEL_19:
        *(void *)(a1 + 232) = v19;
        *(void *)(a1 + 240) = v20;
        return v2 > 2;
      }

      uint64_t v23 = *(void *)(a1 + 356);
    }

    else
    {
      uint64_t v21 = *(void *)(v9 + 32);
      int v22 = *(_DWORD *)(v9 + 40);
      uint64_t v23 = *(void *)(a1 + 356);
      *(void *)(a1 + 216) = v23;
      unint64_t v24 = *(void *)(v9 + 64);
      if (v24 != v4)
      {
        uint64_t v26 = *(unsigned int *)(v9 + 16);
        unint64_t v25 = *(unsigned int *)(v9 + 20);
        if (v24 >= v4)
        {
          unint64_t v28 = (v24 - v4) * v26 / v25;
          v21 -= v28 / 0x3B9ACA00;
          v22 -= v28 % 0x3B9ACA00 / 0x3E8;
          if (v22 < 0)
          {
            --v21;
            v22 += 1000000;
          }
        }

        else
        {
          unint64_t v27 = (v4 - v24) * v26 / v25;
          v21 += v27 / 0x3B9ACA00;
          v22 += v27 % 0x3B9ACA00 / 0x3E8;
          if (v22 > 999999)
          {
            ++v21;
            v22 -= 1000000;
          }
        }
      }

      *(void *)(a1 + 200) = v21;
      *(void *)(a1 + 208) = v22;
      uint64_t v16 = (void *)(a1 + 248);
      uint64_t v17 = *(void *)(v8 + 40);
    }

    unint64_t v19 = *(void *)(v17 + 32);
    int v20 = *(_DWORD *)(v17 + 40);
    *uint64_t v16 = v23;
    unint64_t v29 = *(void *)(v17 + 64);
    if (v29 != v5)
    {
      uint64_t v31 = *(unsigned int *)(v17 + 16);
      unint64_t v30 = *(unsigned int *)(v17 + 20);
      if (v29 >= v5)
      {
        unint64_t v33 = (v29 - v5) * v31 / v30;
        v19 -= v33 / 0x3B9ACA00;
        v20 -= v33 % 0x3B9ACA00 / 0x3E8;
        if (v20 < 0)
        {
          --v19;
          v20 += 1000000;
        }
      }

      else
      {
        unint64_t v32 = (v5 - v29) * v31 / v30;
        v19 += v32 / 0x3B9ACA00;
        v20 += v32 % 0x3B9ACA00 / 0x3E8;
        if (v20 > 999999)
        {
          ++v19;
          v20 -= 1000000;
        }
      }
    }

    goto LABEL_19;
  }

  return v2 > 2;
}

uint64_t _parse_location(void *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v4 = *(void *)(a1[41] + 88LL);
  int v5 = *(_DWORD *)(a2 + 4);
  if ((*(_WORD *)(v4 + 2) & 1) != 0) {
    unsigned int v6 = 4;
  }
  else {
    unsigned int v6 = 6;
  }
  switch(*(_WORD *)(a2 + 2) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      unsigned int v6 = 4;
      break;
    case 8:
      break;
    case 0xA:
      unsigned int v6 = 20;
      break;
    case 0xC:
      unsigned int v6 = 6;
      break;
    default:
      unsigned int v6 = 0;
      break;
  }

  uint64_t v7 = (unsigned __int16)*a3;
  unint64_t v8 = v7 + v6;
  unint64_t v9 = *(void *)(a2 + 16);
  if (v8 > HIWORD(v9))
  {
    uint64_t v17 = 0LL;
    unint64_t v22 = HIWORD(v9);
LABEL_36:
    *a3 = v22;
    return v17;
  }

  *a3 = v8;
  if (!v6) {
    return 0LL;
  }
  uint64_t v10 = (unsigned int *)(a2 + 24 + v7);
  if (v6 == 6)
  {
    unint64_t v11 = 0LL;
    unint64_t v12 = (unint64_t)*((unsigned __int16 *)v10 + 2) << 32;
  }

  else
  {
    unint64_t v12 = 0LL;
    if (v6 == 4) {
      unint64_t v11 = 0LL;
    }
    else {
      unint64_t v11 = v10 + 1;
    }
  }

  uint64_t v13 = *v10;
  if ((*(_WORD *)(a2 + 2) & 0x20) == 0)
  {
    unint64_t v14 = 0LL;
    goto LABEL_20;
  }

  unint64_t v15 = *(void *)(a2 + 16);
  if ((unint64_t)(unsigned __int16)v8 + 2 > HIWORD(v15))
  {
    uint64_t v17 = 0LL;
    unint64_t v22 = HIWORD(v15);
    goto LABEL_36;
  }

  *a3 = v8 + 2;
  unint64_t v14 = (unint64_t)*(unsigned __int16 *)(a2 + 24 + (unsigned __int16)v8) << 31;
LABEL_20:
  unint64_t v16 = v14 | v5 & 0x7FFFFFFF;
  if (v5 >= 0) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v16 | 0x8000000000000000LL;
  }
  a1[20] = v17;
  if (v17)
  {
    a1[42] |= 1uLL;
    uint64_t v17 = 1LL;
    unint64_t v18 = v12 | v13;
    switch(*(_WORD *)(a2 + 2) & 0xE)
    {
      case 2:
        a1[19] = v18;
        unint64_t v11 = (unsigned int *)(v4 + 24);
        goto LABEL_31;
      case 4:
      case 0xC:
        a1[19] = v18;
        unint64_t v11 = (unsigned int *)(v4 + 40);
        a1[14] = v4 + 40;
        uint64_t v19 = 13LL;
        goto LABEL_32;
      case 8:
        int v20 = (void *)_catalog_procinfo_lookup_pc(v4, v12 | v13);
        if (!v20) {
          return 0LL;
        }
        unint64_t v11 = (unsigned int *)(v20 + 2);
        a1[19] = v18 - *v20;
        goto LABEL_31;
      case 0xA:
        a1[19] = v18;
LABEL_31:
        uint64_t v19 = 14LL;
LABEL_32:
        a1[v19] = v11;
        uint64_t v17 = v11 != 0LL;
        break;
      default:
        return v17;
    }
  }

  return v17;
}

void __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__()
{
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventProxy was retained outside of iteration";
  __break(1u);
}

LABEL_27:
  return v15;
}

  uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2);
  if ((_DWORD)v13 == -1) {
    goto LABEL_33;
  }
  unint64_t v14 = *(void *)(a1 + 464);
  if (*(int *)(a1 + 564) > 3)
  {
    unint64_t v15 = *(unsigned int *)(v14 + v13);
    if (v15) {
      return v15;
    }
LABEL_33:
    uint64_t v7 = 1033;
    goto LABEL_34;
  }

  unint64_t v15 = *(unsigned __int16 *)(v14 + v13);
  if (!v15) {
    goto LABEL_33;
  }
  return v15;
}

void logdev_notification_callback(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  unint64_t v8 = objc_alloc(&OBJC_CLASS___OSLogDevice);
  [NSString stringWithUTF8String:a2];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = -[OSLogDevice initWithMobileDevice:andUDID:](v8, "initWithMobileDevice:andUDID:", a3, v9);

  if (a1 == 2) {
    uint64_t v10 = 2LL;
  }
  else {
    uint64_t v10 = a1 == 1;
  }
  [v7 deviceDelegate];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:a2];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 activityStream:v7 deviceUDID:v12 deviceID:v13 status:v10 error:0];
}

void __watchForSims_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  _simDeviceUpdate(v3, *(void **)(a1 + 32));
}

void _simDeviceUpdate(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  [v4 deviceDelegate];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 state] == 3)
  {
    unsigned int v6 = (void *)_knownSimulators;
    [v3 UDID];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 UUIDString];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKey:v8];
    unint64_t v9 = (OSLogDevice *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }

      [v3 UDID];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 UUIDString];
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 138412546;
      uint64_t v24 = (uint64_t)v11;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "duplicate sim seen: %@, already have %@",  (uint8_t *)&v23,  0x16u);
    }

    else
    {
      unint64_t v9 = -[OSLogDevice initWithSimualatedDevice:]( objc_alloc(&OBJC_CLASS___OSLogDevice),  "initWithSimualatedDevice:",  v3);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = (uint64_t)v9;
        _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "sim added: %@", (uint8_t *)&v23, 0xCu);
      }

      int v20 = (void *)_knownSimulators;
      [v3 UDID];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 UUIDString];
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 setObject:v9 forKey:v22];

      -[OSLogDevice uid](v9, "uid");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 activityStream:v4 deviceUDID:v10 deviceID:v9 status:0 error:0];
    }

    goto LABEL_17;
  }

  uint64_t v12 = [v3 state];
  uint64_t v13 = (void *)_knownSimulators;
  [v3 UDID];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 UUIDString];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKey:v15];
  unint64_t v9 = (OSLogDevice *)objc_claimAutoreleasedReturnValue();

  if (v12 == 4)
  {
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = (uint64_t)v9;
        _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "sim removed: %@", (uint8_t *)&v23, 0xCu);
      }

      -[OSLogDevice uid](v9, "uid");
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 activityStream:v4 deviceUDID:v16 deviceID:v9 status:1 error:0];

      uint64_t v17 = (void *)_knownSimulators;
      [v3 UDID];
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 UUIDString];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 removeObjectForKey:v19];

      goto LABEL_17;
    }
  }

  else if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v23 = 134218242;
      uint64_t v24 = [v3 state];
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "sim state %lu: %@", (uint8_t *)&v23, 0x16u);
    }

    goto LABEL_17;
  }

LABEL_18:
}

  qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: oltb table overflow";
  qword_18C695DD0 = (uint64_t)v1;
  __break(1u);
}

        _os_trace_scandir_free_namelist();
        if (unlinkat(v8, "timesync", 128) == -1) {
          goto LABEL_103;
        }
        if (close(v10) == -1) {
          goto LABEL_106;
        }
      }

      if (mkdirat(v8, "timesync", 0x1EDu) == -1)
      {
        __error();
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_103:
        __error();
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_104:
        _os_assert_log();
        uint64_t v42 = _os_crash();
        __break(1u);
LABEL_105:
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v42;
        __break(1u);
LABEL_106:
        uint64_t v56 = *__error();
        uint64_t v57 = *__error();
        if (v56 == 9)
        {
          qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_18C695DD0 = v57;
          __break(1u);
        }

        _os_assumes_log();
        __error();
        _os_assert_log();
        _os_crash();
        __break(1u);
      }

      unint64_t v15 = openat(v8, "timesync", 0);
      if (v15 == -1) {
        goto LABEL_96;
      }
      unint64_t v16 = v15;
      uint64_t v17 = (_DWORD *)_os_trace_zalloc();
      memset(__str, 170, 26);
      snprintf(__str, 0x1AuLL, "%016llx.timesync", 1LL);
      unint64_t v18 = openat(v16, __str, 1537, 420LL);
      if (v18 < 0)
      {
        free(v17);
        uint64_t v17 = 0LL;
      }

      else
      {
        *uint64_t v17 = v18;
        uuid_clear((unsigned __int8 *)v17 + 4);
        *((void *)v17 + 3) = _os_trace_calloc();
        *((_OWORD *)v17 + 2) = xmmword_1869D9160;
      }

      for (unint64_t i = fts_read(v9); i; unint64_t i = fts_read(v9))
      {
        uint64_t fts_info = i->fts_info;
        if (fts_info == 8)
        {
          uint64_t v21 = strrchr(i->fts_name, 46);
          if (v21)
          {
            if (!strcmp(v21, ".tracev3"))
            {
              unint64_t v22 = _os_trace_mmap_at();
              if (v22)
              {
                int v23 = (unsigned __int8 *)v22;
                uint64_t v24 = 0LL;
                __int16 v25 = v66[0];
                *(void *)__str = MEMORY[0x1895F87A8];
                *(void *)&char __str[8] = 0x40000000LL;
                *(void *)&__str[16] = ___timesync_convert_tracev3_block_invoke;
                *(void *)&__str[24] = &__block_descriptor_tmp_69;
                *(void *)&__str[32] = v17;
                do
                {
                  if (v25 - v24 < 0x10) {
                    break;
                  }
                  uint64_t v26 = *(void *)&v23[v24 + 8];
                  if (v25 - v24 - 16 < v26) {
                    break;
                  }
                  if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))&__str[16])( (uint64_t)__str,  &v23[v24])) {
                    break;
                  }
                  uint64_t v24 = (v24 + v26 + 23) & 0xFFFFFFFFFFFFFFF8LL;
                }

                while (v24 - 1 < v25);
                munmap(v23, v66[0]);
              }
            }
          }
        }

        else if (fts_info == 1 && i->fts_level == 1 && !strcmp(i->fts_name, "FaultsAndErrors"))
        {
          fts_set(v9, i, 4);
        }
      }

      fts_close(v9);
      qsort_b(*((void **)v17 + 3), *((void *)v17 + 4), 0x40uLL, &__block_literal_global_73);
      uint64_t v27 = operator new(0x28uLL);
      void *v27 = 0u;
      v27[1] = 0u;
      *((_DWORD *)v27 + 8) = 1065353216;
      unint64_t v28 = *((void *)v17 + 4);
      if (v28)
      {
        unint64_t v29 = 0LL;
        unint64_t v30 = 0LL;
        uint64_t v31 = *((void *)v17 + 3);
        do
        {
          unint64_t v32 = _os_trace_uuid_map_lookup(v27, (void *)(v31 + v29 + 8));
          if (!v32)
          {
            unint64_t v32 = *((void *)v27 + 3) + 1LL;
            _os_trace_uuid_map_insert((float *)v27, (uint64_t *)(v31 + v29 + 8), v32);
            uint64_t v31 = *((void *)v17 + 3);
            unint64_t v28 = *((void *)v17 + 4);
          }

          *(void *)(v31 + v29) = v32;
          ++v30;
          v29 += 64LL;
        }

        while (v30 < v28);
      }

      _os_trace_uuid_map_destroy((void **)v27);
      qsort_b(*((void **)v17 + 3), *((void *)v17 + 4), 0x40uLL, &__block_literal_global_4);
      memset(v70, 0, sizeof(v70));
      self = v63;
      if (*((void *)v17 + 4))
      {
        unint64_t v33 = 0LL;
        char v34 = (const unsigned __int8 *)(*((void *)v17 + 3) + 32LL);
        __int16 v35 = 1LL;
        do
        {
          if (*(void *)v70 == *((void *)v34 - 3) && *(void *)&v70[8] == *((void *)v34 - 2))
          {
            uint64_t v36 = *((void *)v34 + 3);
            if (v36 != v33)
            {
              *(void *)__str = 2126676LL;
              *(void *)&char __str[8] = v36;
              *(void *)&__str[16] = 1000000000LL * *((void *)v34 - 1) + 1000LL * *(int *)v34;
              *(void *)&__str[24] = *((void *)v34 + 1);
              if (_os_trace_write() == -1)
              {
                __error();
                _os_assumes_log();
                id v39 = -1;
              }

              else
              {
                id v39 = 0;
              }

              if (v39) {
                break;
              }
            }
          }

          else
          {
            *(_DWORD *)__str = 3193776;
            memset(&__str[4], 0, 20);
            *(void *)&__str[24] = *((void *)v34 + 2);
            *(void *)&__str[32] = 1000000000LL * *((void *)v34 - 1)
                                  + 1000LL * *(int *)v34
                                  - *((void *)v34 + 3)
                                  * (unint64_t)*(unsigned int *)&__str[24]
                                  / HIDWORD(*(void *)&__str[24]);
            *(void *)&__str[40] = *((void *)v34 + 1);
            uuid_copy((unsigned __int8 *)&__str[8], v34 - 24);
            v66[0] = 2126676LL;
            v66[1] = *((void *)v34 + 3);
            v66[2] = 1000000000LL * *((void *)v34 - 1) + 1000LL * *(int *)v34;
            v66[3] = *((void *)v34 + 1);
            uint64_t v71 = __str;
            uint64_t v72 = 48LL;
            unint64_t v73 = v66;
            v74 = 32LL;
            if (_os_trace_writev() == -1)
            {
              __error();
              _os_assumes_log();
              unsigned int v37 = -1;
            }

            else
            {
              unsigned int v37 = 0;
            }

            uuid_copy(v70, v34 - 24);
            if (v37) {
              break;
            }
          }

          unint64_t v33 = *((void *)v34 + 3);
          v34 += 64;
        }

        while (v35++ < *((void *)v17 + 4));
      }

      if (!lseek(*v17, 0LL, 2))
      {
        memset(__str, 170, sizeof(__str));
        if (fcntl(*v17, 50, __str) == -1)
        {
          __error();
          _os_assumes_log();
        }

        if (unlink(__str) == -1)
        {
          __error();
          _os_assumes_log();
        }
      }

      if (close(*v17) == -1)
      {
        uint64_t v41 = *__error();
        uint64_t v42 = *__error();
        if (v41 == 9) {
          goto LABEL_105;
        }
        _os_assumes_log();
      }

      free(*((void **)v17 + 3));
      free(v17);

      unsigned int v6 = v62;
      version = 2LL;
    }
  }

  while (version++ != v6);
  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_lcr, "diagnosticsDirectoryReference");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v43 fileDescriptor];

  uint64_t v45 = openat(v44, "Info.plist", 514, 420LL);
  if ((_DWORD)v45 == -1)
  {
    int v52 = *__error();
    uint64_t v53 = v61;
    goto LABEL_92;
  }

  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:v45 closeOnDealloc:1];
  [v46 readDataToEndOfFileAndReturnError:0];
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v47 length])
  {
    [MEMORY[0x1896079E8] propertyListWithData:v47 options:1 format:0 error:v61];
    uint64_t v48 = (id)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
LABEL_88:

      return 0;
    }
  }

  else
  {
    uint64_t v48 = objc_alloc_init(MEMORY[0x189603FC8]);
  }

  [MEMORY[0x189607968] numberWithInteger:v60];
  int v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 setObject:v49 forKeyedSubscript:@"OSArchiveVersion"];

  [MEMORY[0x1896079E8] dataWithPropertyList:v48 format:100 options:0 error:v61];
  __int16 v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  {
    uint64_t v47 = 0LL;
    goto LABEL_88;
  }

  if (![v46 truncateAtOffset:0 error:v61]
    || ([v46 writeData:v50 error:v61] & 1) == 0)
  {
    uint64_t v47 = v50;
    goto LABEL_88;
  }

  [v46 closeAndReturnError:0];

  self->_state = (unint64_t)(v6 - 2) < 3;
  self->_version = v60;
  return 1;
}

void __watchForSims_block_invoke()
{
  if (_coreSimulatorFrameworkPath_once != -1) {
    dispatch_once(&_coreSimulatorFrameworkPath_once, &__block_literal_global_170);
  }
  id v0 = (id)_coreSimulatorFrameworkPath_path;
  if (v0)
  {
    id v5 = v0;
    [MEMORY[0x1896077F8] bundleWithPath:v0];
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v2 = v1;
    if (v1)
    {
      watchForSims_SimServiceContextClass = [v1 classNamed:@"SimServiceContext"];
      if (watchForSims_SimServiceContextClass)
      {
        uint64_t v3 = objc_opt_new();
        id v4 = (void *)_knownSimulators;
        _knownSimulators = v3;
      }
    }

    id v0 = v5;
  }
}

void ___coreSimulatorFrameworkPath_block_invoke()
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896078A8] defaultManager];
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t v1 = [&unk_189F1CFF8 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(&unk_189F1CFF8);
        }
        id v5 = *(void **)(*((void *)&v6 + 1) + 8 * i);
        if ([v0 fileExistsAtPath:v5])
        {
          objc_storeStrong((id *)&_coreSimulatorFrameworkPath_path, v5);
          goto LABEL_11;
        }
      }

      uint64_t v2 = [&unk_189F1CFF8 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

void sub_1869947A4(void *a1)
{
}

void logdev_message_callback(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (a1)
  {
    +[OSActivityEvent activityEventFromStreamEntry:](&OBJC_CLASS___OSActivityEvent, "activityEventFromStreamEntry:", a1);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      [v7 predicate];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4
        || ([v7 predicate],
            id v5 = (void *)objc_claimAutoreleasedReturnValue(),
            char v6 = [v5 evaluateWithObject:v3],
            v5,
            (v6 & 1) != 0))
      {
        [v7 streamEvent:v3 error:0];
      }
    }
  }

  else
  {
    [v7 streamEvent:0 error:0];
  }
}

void sub_1869949A4(void *a1)
{
}

void sub_186994CB0(_Unwind_Exception *a1)
{
}

LABEL_12:
    char v6 = @"Unknown";
    goto LABEL_13;
  }

  if (v5 == 2)
  {
    char v6 = @"Debug";
    goto LABEL_13;
  }

  if (v5 == 16)
  {
    char v6 = @"Error";
    goto LABEL_13;
  }

  if (v5 != 17) {
    goto LABEL_12;
  }
  char v6 = @"Fault";
LABEL_13:
  [v4 setObject:v6 forKey:@"messageType"];
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[OSActivityTraceMessageEvent senderProgramCounter](self, "senderProgramCounter"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKey:@"senderProgramCounter"];
}

    *(_DWORD *)(a1 + 560) = 22;
    return -1LL;
  }

id _index_log()
{
  if (_index_log_o != -1) {
    dispatch_once(&_index_log_o, &__block_literal_global_391);
  }
  return (id)_index_log_h;
}

void ___index_log_block_invoke()
{
  id v0 = getenv("INDEX_SIGNPOSTS");
  if (v0 && !strcmp(v0, "1"))
  {
    os_log_t v1 = os_log_create("com.apple.loggingsupport", "Index");
  }

  else
  {
    os_log_t v1 = (os_log_t)MEMORY[0x1895F8DA8];
    id v2 = MEMORY[0x1895F8DA8];
  }

  uint64_t v3 = (void *)_index_log_h;
  _index_log_h = (uint64_t)v1;
}

LABEL_6:
  return v10;
}

void sub_186997640( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void _catalog_lite_read_limits(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 22);
  unint64_t v4 = *(void *)(a1 + 8) + a1 + 16;
  if (*(_DWORD *)(a1 + 4) == 17)
  {
    uint64_t v5 = *(unsigned __int16 *)(a1 + 24);
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    unint64_t v16 = (void (*)(void *))___catalog_lite_read_limits_block_invoke;
    uint64_t v17 = &__block_descriptor_56_e12_v24__0_8__16l;
    uint64_t v18 = a2;
    uint64_t v19 = a3;
    unint64_t v20 = v4;
    unint64_t v21 = a1 + v3 + 40;
    for (uint64_t i = v15; v5; --v5)
    {
      if (v4 < v21 || v4 - v21 < 0x18) {
        break;
      }
      v21 += 24LL;
      v16(i);
    }
  }

  else
  {
    uint64_t v8 = a1 + v3;
    uint64_t v9 = *(unsigned __int16 *)(v8 + 24);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    uint64_t v11 = ___catalog_lite_read_limits_block_invoke_2;
    uint64_t v12 = &__block_descriptor_48_e12_v24__0_8__16l;
    uint64_t v13 = a2;
    uint64_t v14 = a3;
    unint64_t v21 = v8 + 32;
    for (uint64_t i = v10; v9; --v9)
    {
      if (v4 < v21) {
        break;
      }
      if (v4 - v21 < 0x20) {
        break;
      }
      v21 += 32LL;
      ((void (*)(void *))v11)(i);
    }
  }
}

void *___catalog_lite_read_limits_block_invoke(void *result, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = (void *)result[4];
  if (*(void *)a2 < *v3) {
    *uint64_t v3 = *(void *)a2;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = (unint64_t *)result[5];
  if (v4 > *v5) {
    unint64_t *v5 = v4;
  }
  char v6 = (unsigned int *)(a2 + 2LL * *(unsigned int *)(a2 + 24) + 28);
  unint64_t v7 = result[6];
  if ((unint64_t)v6 <= v7)
  {
    unint64_t v8 = (unint64_t)v6 + 2 * *v6 + 4;
    if (v8 <= v7)
    {
      unint64_t v7 = (v8 & 0xFFFFFFFFFFFFFFF8LL) + 8;
      if ((v8 & 7) == 0) {
        unint64_t v7 = v8;
      }
    }
  }

  *a3 = v7;
  return result;
}

uint64_t ___catalog_lite_read_limits_block_invoke_2(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *(void **)(result + 32);
  if (*(void *)a2 < *v3) {
    *uint64_t v3 = *(void *)a2;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(unint64_t **)(result + 40);
  if (v4 < *v5) {
    unint64_t *v5 = v4;
  }
  uint64_t v6 = a2 + *(unsigned __int16 *)(a2 + 24) + 26;
  if ((v6 & 7) != 0) {
    uint64_t v6 = (v6 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  *a3 = v6;
  return result;
}

uint64_t enumerateAndDecompressSubchunk(void *a1, _DWORD *a2, uint64_t a3, void *a4)
{
  unint64_t v7 = a1;
  id v8 = a4;
  uint64_t v9 = v8;
  uint64_t v10 = 1LL;
  unsigned int v11 = *a2 - 24577;
  if (v11 <= 0xF)
  {
    if (((1 << v11) & 0x880F) != 0)
    {
      uint64_t v10 = (*((uint64_t (**)(id, _DWORD *, uint64_t))v8 + 2))(v8, a2, a3);
    }

    else if (*a2 == 24589)
    {
      [v7 _decompressedBufferForChunk:a2 subchunk:v7[2]];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = 0LL;
      unint64_t v28 = &v27;
      uint64_t v29 = 0x2020000000LL;
      char v30 = 1;
      uint64_t v14 = [v13 data];
      unint64_t v15 = [v13 size];
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      unint64_t v21 = __enumerateAndDecompressSubchunk_block_invoke;
      unint64_t v22 = &unk_189F0E970;
      uint64_t v26 = &v27;
      int v23 = v7;
      id v16 = v13;
      id v24 = v16;
      id v25 = v9;
      uint64_t v17 = v20;
      unint64_t v18 = 0LL;
      do
      {
        if (v15 - v18 < 0x10) {
          break;
        }
        unint64_t v19 = *(void *)(v14 + v18 + 8);
        if (v15 - v18 - 16 < v19) {
          break;
        }
        unint64_t v18 = (v18 + v19 + 23) & 0xFFFFFFFFFFFFFFF8LL;
      }

      while (v18 - 1 < v15);

      uint64_t v10 = *((_BYTE *)v28 + 24) != 0;
      _Block_object_dispose(&v27, 8);
    }
  }

  return v10;
}

void sub_18699859C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __enumerateAndDecompressSubchunk_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = enumerateAndDecompressSubchunk( *(void *)(a1 + 32),  a2,  [*(id *)(a1 + 40) data],  *(void *)(a1 + 48));
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
}

void sub_1869989B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v14 = va_arg(va2, void);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void enumerateOldChunkTracepointLimits(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (*(_DWORD *)a1 == 24589)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __enumerateOldChunkTracepointLimits_block_invoke;
    v18[3] = &__block_descriptor_48_e767_B16__0__tracev3_chunk_s__tracev3_chunk_preamble_s_IIQ_____tracev3_chunk_header_s__mach_timebase_info_II_QqiiiI_tracev3_subchunk_preamble_s_II__tracev3_subchunk_continuous_s_Q__tracev3_subchunk_preamble_s_II__tracev3_subchunk_systeminfo_s_ii_16c__32c___tracev3_subchunk_preamble_s_II__tracev3_subchunk_generation_s__16C_ii__tracev3_subchunk_preamble_s_II__tracev3_subchunk_timezone_s__48c____tracev3_chunk_catalog_s_SSSS_0C___tracev3_chunk_catalog_v2_s_SSSSS_3S_Q_0C___tracev3_chunk_log_preamble_s_QIC_3C___tracev3_chunk_firehose_s_QICC_2C__0C___tracev3_chunk_firehose_old_s_QiCC_0C___tracev3_chunk_oversize_s_QIC_3C_QISS_0C___tracev3_chunk_oversize_old_s_QISS_0C___tracev3_chunk_statedump_s_QIC_3C_QQ_16C__0C___tracev3_chunk_simple_s_QICC_2C_QQQ_16C__16C__0C___0C___8l;
    v18[4] = a2;
    v18[5] = a3;
    _tracev3_chunk_decompress_and_enumerate_chunks(a1, 0LL, (uint64_t)v18);
    return;
  }

  if (*(_DWORD *)a1 == 24588)
  {
    unint64_t v3 = *(void *)(a1 + 8);
    unint64_t v4 = v3 - 16;
    if (v3 >= 0x10)
    {
      uint64_t v5 = (unsigned __int16 *)(a1 + 30);
      if (v3 - 4113 > 0xFFFFFFFFFFFFF00ELL)
      {
        unint64_t v6 = *v5;
        if (v4 < v6) {
          return;
        }
      }

      else
      {
        unint64_t v6 = *v5;
      }

      unint64_t v7 = (uint64_t *)(a1 + 46);
      unint64_t v8 = (unint64_t)v5 + v6;
      while ((unint64_t)(v7 + 3) < v8)
      {
        unint64_t v9 = v7[2];
        uint64_t v10 = HIWORD(v9);
        uint64_t v12 = v10 + 24;
        uint64_t v13 = (HIWORD(v9) & 0xFFF8) + 32LL;
        if ((v9 & 0x7000000000000LL) == 0) {
          uint64_t v13 = v12;
        }
        uint64_t v14 = (uint64_t *)((char *)v7 + v13);
        uint64_t v15 = *v7;
        unint64_t v7 = v14;
        if (v15)
        {
          unint64_t v16 = (v9 & 0xFFFFFFFFFFFFLL) + *(void *)(a1 + 38);
          unint64_t v17 = *a2;
          if (*a2 >= v16) {
            unint64_t v17 = v16;
          }
          *a2 = v17;
          if (*a3 > v16) {
            unint64_t v16 = *a3;
          }
          *a3 = v16;
          unint64_t v7 = v14;
        }
      }
    }
  }

uint64_t __enumerateOldChunkTracepointLimits_block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

void _oltb_consolidate(void *a1)
{
  os_log_t v1 = a1;
  if (v1[40])
  {
    uint64_t v13 = v1;

    for (uint64_t i = v13[2]; i; uint64_t i = v13[2])
    {
      uint64_t v3 = i - 1;
      uint64_t v4 = v13[1];
      uint64_t v5 = v4 + 104 * v3;
      uint64_t v6 = v13[3] - 1LL;
      v13[2] = v3;
      v13[3] = v6;
      unint64_t v7 = (__int128 *)(v4 + 104 * v6);
      uint64_t v8 = *((void *)v7 + 12);
      __int128 v9 = v7[3];
      __int128 v10 = v7[5];
      *(_OWORD *)(v5 + 64) = v7[4];
      *(_OWORD *)(v5 + 80) = v10;
      *(_OWORD *)(v5 + 4_Block_object_dispose(va, 8) = v9;
      __int128 v11 = *v7;
      __int128 v12 = v7[2];
      *(_OWORD *)(v5 + 16) = v7[1];
      *(_OWORD *)(v5 + 32) = v12;
      *(_OWORD *)uint64_t v5 = v11;
      *(void *)(v5 + 96) = v8;
    }
  }

  else
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
  }

uint64_t _OSLogEventUnpackChunk(int *a1, uint64_t a2, uint64_t a3)
{
  *(void *)a3 = a1;
  uint64_t v3 = (void *)(a3 + 16);
  int v4 = *a1;
  switch(*a1)
  {
    case 24577:
      unint64_t v5 = *((void *)a1 + 1);
      unint64_t v6 = v5 - 16;
      if (v5 < 0x10) {
        goto LABEL_22;
      }
      unint64_t v7 = (unsigned __int16 *)(a1 + 8);
      BOOL v8 = *((_BYTE *)a1 + 29) != 0;
      goto LABEL_16;
    case 24578:
      unint64_t v11 = *((void *)a1 + 1);
      unint64_t v6 = v11 - 32;
      if (v11 < 0x20) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 12);
      goto LABEL_16;
    case 24579:
      unint64_t v12 = *((void *)a1 + 1);
      unint64_t v6 = v12 - 48;
      if (v12 < 0x30) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 16);
      goto LABEL_16;
    case 24580:
      unint64_t v13 = *((void *)a1 + 1);
      unint64_t v6 = v13 - 72;
      if (v13 < 0x48) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 22);
      goto LABEL_16;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24587:
      goto LABEL_7;
    case 24588:
      unint64_t v14 = *((void *)a1 + 1);
      unint64_t v6 = v14 - 16;
      if (v14 < 0x10) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)a1 + 15;
      goto LABEL_16;
    default:
      if (v4 != 24592)
      {
LABEL_7:
        uint64_t v10 = 0LL;
        *(_OWORD *)(a3 + 24) = 0u;
        *(_OWORD *)(a3 + _Block_object_dispose(va, 8) = 0u;
        return v10;
      }

      unint64_t v9 = *((void *)a1 + 1);
      unint64_t v6 = v9 - 16;
      if (v9 < 0x10) {
        goto LABEL_22;
      }
      BOOL v8 = 0;
      unint64_t v7 = (unsigned __int16 *)(a1 + 8);
LABEL_16:
      if (v6 - 4097 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_17;
      }
      unint64_t v15 = *v7;
      if (v6 < v15)
      {
LABEL_22:
        uint64_t v10 = 0LL;
        *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
        *(void *)(a3 + 32) = 0LL;
        return v10;
      }

      uint64_t v17 = v7[1];
      if (!v8)
      {
        if (v6 == 4096)
        {
          *uint64_t v3 = (char *)v7 + v17;
          uint64_t v18 = (unsigned __int16)(4096 - v17);
          goto LABEL_45;
        }

void _oltb_allocate_row(void *a1)
{
  id v2 = a1;
  if (!v2[40])
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
    goto LABEL_17;
  }

  os_log_t v1 = v2;

  uint64_t v3 = v1;
  if (!v1[40])
  {
LABEL_17:
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
    goto LABEL_18;
  }

  int v4 = v3;

  uint64_t v5 = v4[2];
  uint64_t v6 = v4[4] - v4[3];

  if (!(v6 + v5))
  {
    unint64_t v7 = v4[4];
    if (v7) {
      uint64_t v8 = v7 >> 1;
    }
    else {
      uint64_t v8 = 1024LL;
    }
    unint64_t v9 = v4;
    _oltb_consolidate(v9);
    uint64_t v10 = v4[3] + v8;
    unint64_t v11 = (void *)_os_trace_malloc();
    unint64_t v12 = v11;
    unint64_t v13 = (void *)v9[1];
    if (v13)
    {
      uint64_t v14 = v4[3];
      if (v14)
      {
        memcpy(v11, v13, 104 * v14);
        unint64_t v13 = (void *)v9[1];
      }
    }

    free(v13);
    v9[1] = v12;
    v4[4] = v10;
  }

  uint64_t v15 = v4[2];
  if (v15)
  {
    void v4[2] = v15 - 1;
LABEL_15:

    return;
  }

  os_log_t v1 = (_BYTE *)v4[3];
  if ((unint64_t)v1 < v4[4])
  {
    v4[3] = v1 + 1;
    goto LABEL_15;
  }

LABEL_88:
          -[NSMutableArray removeObjectAtIndex:](self->_catalogStartQ, "removeObjectAtIndex:", 0LL);
          -[NSMutableArray firstObject](self->_catalogStartQ, "firstObject");
          int v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v58)
          {
            uint64_t v60 = 0LL;
            goto LABEL_91;
          }

          continue;
        }

        break;
      }

      if ([v59 endTime] >= v33)
      {

        if ([v60 oldestTime] <= v33) {
          goto LABEL_84;
        }
        goto LABEL_88;
      }

LABEL_90:
LABEL_91:
      -[NSMutableArray sortUsingFunction:context:]( self->_subchunkStartQ,  "sortUsingFunction:context:",  _OSLogIndexOrderForOpening,  v6);
      -[NSMutableArray sortUsingFunction:context:]( self->_subchunkEndQ,  "sortUsingFunction:context:",  _OSLogIndexOrderForClosing,  v6);

LABEL_92:
LABEL_93:
      -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v63) {
        goto LABEL_114;
      }
      -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v65 = v64;
      uint64_t v66 = (v6 & 8) != 0 ? [v64 endTime] < v33 : objc_msgSend(v64, "oldestTime") > v33;

      if (v66) {
        goto LABEL_114;
      }
      unint64_t v67 = v34;
      -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
      uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v69 = v68;
      if (!v68) {
        goto LABEL_113;
      }
      if ((v6 & 8) == 0)
      {
        if ([v68 oldestTime] <= v33) {
          goto LABEL_103;
        }
        goto LABEL_187;
      }

      if ([v68 endTime] < v33) {
        goto LABEL_187;
      }
LABEL_103:
      while (2)
      {
        uint64_t v70 = v69;
        uint64_t v71 = v70;
        if ((v6 & 8) == 0)
        {
          if ([v70 oldestTime] > v33) {
            goto LABEL_112;
          }

          if ([v71 endTime] < v33) {
            goto LABEL_110;
          }
LABEL_109:
          uint64_t v72 = v67;
          unint64_t v73 = v71;
          v139 = MEMORY[0x1895F87A8];
          v140 = 3221225472LL;
          v141 = ___oie_advance_cursor_open_subchunk_block_invoke;
          v142 = &unk_189F0EA08;
          v143 = v72;
          v144 = v73;
          LODWORD(v145) = v6;
          -[_OSLogIndexEnumerator enumerateChunksUsingBlock:](v73, "enumerateChunksUsingBlock:", &v139);

LABEL_110:
          -[NSMutableArray removeObjectAtIndex:](self->_subchunkStartQ, "removeObjectAtIndex:", 0LL);
          -[NSMutableArray firstObject](self->_subchunkStartQ, "firstObject");
          unint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v69) {
            goto LABEL_113;
          }
          continue;
        }

        break;
      }

      if ([v70 endTime] >= v33)
      {

        if ([v71 oldestTime] <= v33) {
          goto LABEL_109;
        }
        goto LABEL_110;
      }

LABEL_112:
LABEL_113:
LABEL_114:
      v74 = -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
      if (!v74) {
        goto LABEL_132;
      }
      v75 = -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
      unsigned int v76 = v75;
      if ((v6 & 8) != 0)
      {
        size_t v78 = [v75 oldestTime] > v33;

        if (!v78) {
          goto LABEL_132;
        }
      }

      else
      {
        v77 = [v75 endTime] < v33;

        if (!v77) {
          goto LABEL_132;
        }
      }

      v79 = v34;
      v80 = -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
      uint64_t v81 = v80;
      if (!v80) {
        goto LABEL_131;
      }
      if ((v6 & 8) == 0)
      {
        if ([v80 endTime] < v33) {
          goto LABEL_124;
        }
LABEL_188:
        qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_close_subchunks called with nothing to close";
        __break(1u);
LABEL_189:
        qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _oie_advance_cursor_close_files called with nothing to close";
        __break(1u);
        goto LABEL_190;
      }

      if ([v80 oldestTime] <= v33) {
        goto LABEL_188;
      }
LABEL_124:
      while (2)
      {
        v82 = v81;
        uint64_t v83 = v82;
        if ((v6 & 8) == 0)
        {
          if ([v82 endTime] >= v33) {
            break;
          }
          goto LABEL_128;
        }

        if ([v82 oldestTime] > v33)
        {
LABEL_128:

          -[NSMutableArray removeObjectAtIndex:](self->_subchunkEndQ, "removeObjectAtIndex:", 0LL);
          -[NSMutableArray firstObject](self->_subchunkEndQ, "firstObject");
          uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v81) {
            goto LABEL_131;
          }
          continue;
        }

        break;
      }

LABEL_131:
LABEL_132:
      -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v84) {
        goto LABEL_150;
      }
      -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
      uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v86 = v85;
      if ((v6 & 8) != 0)
      {
        uint64_t v88 = [v85 oldestTime] > v33;

        if (!v88) {
          goto LABEL_150;
        }
      }

      else
      {
        uint64_t v87 = [v85 endTime] < v33;

        if (!v87) {
          goto LABEL_150;
        }
      }

      uint64_t v89 = v34;
      -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
      uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v91 = v90;
      if (!v90) {
        goto LABEL_149;
      }
      if ((v6 & 8) == 0)
      {
        if ([v90 endTime] < v33) {
          goto LABEL_142;
        }
        goto LABEL_189;
      }

      if ([v90 oldestTime] <= v33) {
        goto LABEL_189;
      }
LABEL_142:
      while (2)
      {
        int v92 = v91;
        uint64_t v93 = v92;
        if ((v6 & 8) == 0)
        {
          if ([v92 endTime] >= v33) {
            break;
          }
          goto LABEL_146;
        }

        if ([v92 oldestTime] > v33)
        {
LABEL_146:

          -[NSMutableArray removeObjectAtIndex:](self->_fileEndQ, "removeObjectAtIndex:", 0LL);
          -[NSMutableArray firstObject](self->_fileEndQ, "firstObject");
          unint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v91) {
            goto LABEL_149;
          }
          continue;
        }

        break;
      }

LABEL_149:
LABEL_150:
      next_major_time = _oie_get_next_major_time(v34, v6, &v150);
      -[_OSLogTracepointBuffer finishedInsertingTracepointsWithNextMajorTime:options:]( self->_tracepoints,  "finishedInsertingTracepointsWithNextMajorTime:options:",  next_major_time,  v6);
      -[NSMutableArray sortUsingSelector:](self->_oversizeChunks, "sortUsingSelector:", sel_compare_);
      char v95 = v34;
      v96 = -[NSMutableArray firstObject](self->_oversizeChunks, "firstObject");
      if (v96)
      {
        do
        {
          uint64_t v97 = [v96 timestamp];
          if (v97 == v33) {
            break;
          }
          if ((v6 & 8) != 0)
          {
            if (v97 <= v33) {
              break;
            }
          }

          else if (v97 >= v33)
          {
            break;
          }

          -[NSMutableArray removeObjectAtIndex:](self->_oversizeChunks, "removeObjectAtIndex:", 0LL);
          v98 = -[NSMutableArray firstObject](self->_oversizeChunks, "firstObject");

          v96 = (void *)v98;
        }

        while (v98);
      }

      if (v119 == 1)
      {
        if ((v6 & 8) != 0)
        {
          if (next_major_time <= *v109) {
            next_major_time = *v109;
          }
        }

        else if (next_major_time >= *p_var2)
        {
          next_major_time = *p_var2;
        }
      }

      tracepoints = self->_tracepoints;
      v100 = v132[3];
      v121[0] = MEMORY[0x1895F87A8];
      v121[1] = 3221225472LL;
      v121[2] = __81___OSLogIndexEnumerator_enumerateTracepointsInRange_timesync_options_usingBlock___block_invoke;
      v121[3] = &unk_189F0E878;
      v123 = &v131;
      v124 = v135;
      size_t v101 = v114;
      unsigned __int16 v126 = v137;
      __int16 v122 = v101;
      uint64_t v125 = &v127;
      -[_OSLogTracepointBuffer enumerateEventsFromTime:to:options:usingBlock:]( tracepoints,  "enumerateEventsFromTime:to:options:usingBlock:",  v100,  next_major_time,  v6,  v121);
      uint64_t v102 = v132[3];
      if (v102 >= next_major_time) {
        uint64_t v103 = next_major_time;
      }
      else {
        uint64_t v103 = v132[3];
      }
      if (v102 <= next_major_time) {
        uint64_t v102 = next_major_time;
      }
      if ((v6 & 8) != 0) {
        uint64_t v102 = v103;
      }
      v132[3] = v102;

      objc_autoreleasePoolPop(context);
      unint64_t v28 = v119;
      if (*((_BYTE *)v128 + 24))
      {
        unsigned int v104 = v132[3];
        unsigned int v105 = v95;
        uint64_t v106 = _oie_get_next_major_time(v105, v6, &v150);
        if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          if (v106 == v104)
          {

            continue;
          }

          if ((v6 & 8) != 0)
          {
            if (v106 > v104) {
              goto LABEL_190;
            }
          }

          else if (v106 < v104)
          {
LABEL_190:
            qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: iteration skipped a major time";
            __break(1u);
          }
        }

        unint64_t v28 = v119;
      }

      break;
    }

    _Block_object_dispose(&v127, 8);
LABEL_177:
    _Block_object_dispose(&v131, 8);
    uint64_t v10 = v115 + v111;
    ++v116;
    unint64_t v9 = v28 - 1;
  }

  while (v9);
LABEL_185:
  _Block_object_dispose(v135, 8);
}

void sub_18699B384( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44)
{
}

uint64_t _OSLogIndexOrderForOpening(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if ((a3 & 8) == 0)
  {
    uint64_t v7 = [v5 oldestTime];
    if (v7 != [v6 oldestTime])
    {
      unint64_t v8 = [v5 oldestTime];
      if (v8 < [v6 oldestTime]) {
        uint64_t v9 = -1LL;
      }
      else {
        uint64_t v9 = 1LL;
      }
      goto LABEL_11;
    }

uint64_t _OSLogIndexOrderForClosing(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  if ((a3 & 8) == 0)
  {
    uint64_t v7 = [v5 endTime];
    if (v7 != [v6 endTime])
    {
      unint64_t v8 = [v5 endTime];
      if (v8 < [v6 endTime]) {
        uint64_t v9 = -1LL;
      }
      else {
        uint64_t v9 = 1LL;
      }
      goto LABEL_11;
    }

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t ___oie_advance_cursor_open_store_block_invoke(void *a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v5 = *a2;
  if (*a2 <= 24587)
  {
    if (v5 == 4096)
    {
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = a2;
    }

    else if (v5 == 24587)
    {
      if (*(void *)(*(void *)(a1[6] + 8LL) + 24LL))
      {
        unint64_t v8 = -[_OSLogEnumeratorCatalog initWithStore:index:fileHeader:range:chunk:]( objc_alloc(&OBJC_CLASS____OSLogEnumeratorCatalog),  "initWithStore:index:fileHeader:range:chunk:",  a1[4],  *(void *)(a1[5] + 120LL),  *(void *)(*(void *)(a1[6] + 8LL) + 24LL),  a3,  a4,  a2);
        uint64_t v9 = *(void *)(a1[7] + 8LL);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        if (*(void *)(*(void *)(a1[7] + 8LL) + 40LL)) {
          objc_msgSend(*(id *)(a1[5] + 24), "addObject:");
        }
      }
    }
  }

  else if ((v5 - 24588) < 2 || v5 == 24592)
  {
    if (*(void *)(*(void *)(a1[6] + 8LL) + 24LL))
    {
      uint64_t v7 = *(void **)(*(void *)(a1[7] + 8LL) + 40LL);
      if (v7) {
        objc_msgSend(v7, "unionWithRange:", a3, a4);
      }
    }
  }

  return 1LL;
}

uint64_t ___oie_advance_cursor_open_catalog_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v4 = a2;
  [v3 addObject:v4];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v4];

  return 1LL;
}

uint64_t ___oie_advance_cursor_open_subchunk_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  switch(*(_DWORD *)a2)
  {
    case 0x6001:
    case 0x600C:
      [*(id *)(*(void *)(a1 + 32) + 136) insertTracepoints:a2 chunkOffset:a3 chunkSetStartAddr:a4 subchunk:*(void *)(a1 + 40) options:*(unsigned int *)(a1 + 48)];
      break;
    case 0x6002:
      goto LABEL_4;
    case 0x6003:
      unint64_t v10 = 0LL;
      if (_oie_validate_subchunk_ttl( *(void **)(a1 + 32),  *(void **)(a1 + 40),  *(unsigned __int8 *)(a2 + 28),  &v10)
        && *(void *)(a2 + 32) >= v10)
      {
        [*(id *)(*(void *)(a1 + 32) + 136) insertStatedumpChunk:a2 chunkOffset:a3 chunkSetStartAddr:a4 subchunk:*(void *)(a1 + 40)];
      }

      break;
    case 0x6004:
      unint64_t v10 = 0LL;
      if (_oie_validate_subchunk_ttl( *(void **)(a1 + 32),  *(void **)(a1 + 40),  *(unsigned __int8 *)(a2 + 28),  &v10)
        && *(void *)(a2 + 32) >= v10)
      {
        [*(id *)(*(void *)(a1 + 32) + 136) insertSimpleChunk:a2 chunkOffset:a3 chunkSetStartAddr:a4 subchunk:*(void *)(a1 + 40) options:*(unsigned int *)(a1 + 48)];
      }

      break;
    case 0x6005:
    case 0x6006:
    case 0x6007:
    case 0x6008:
    case 0x6009:
    case 0x600A:
    case 0x600B:
      return 1LL;
    default:
      if (*(_DWORD *)a2 == 24592)
      {
LABEL_4:
        unint64_t v8 = -[_OSLogEnumeratorOversizeChunk initWithSubchunk:chunk:]( objc_alloc(&OBJC_CLASS____OSLogEnumeratorOversizeChunk),  "initWithSubchunk:chunk:",  *(void *)(a1 + 40),  a2);
        [*(id *)(*(void *)(a1 + 32) + 56) addObject:v8];
      }

      break;
  }

  return 1LL;
}

unint64_t _oie_get_next_major_time(void *a1, char a2, void *a3)
{
  int v5 = a1;
  id v6 = v5;
  if ((a2 & 8) != 0) {
    unint64_t v7 = 0LL;
  }
  else {
    unint64_t v7 = -1LL;
  }
  [v5[1] firstObject];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8)
  {
    if ((a2 & 8) != 0)
    {
      if ([v8 endTime] < v7) {
        goto LABEL_11;
      }
      uint64_t v10 = [v9 endTime];
    }

    else
    {
      if ([v8 oldestTime] > v7) {
        goto LABEL_11;
      }
      uint64_t v10 = [v9 oldestTime];
    }

    unint64_t v7 = v10;
  }

uint64_t _oie_validate_subchunk_ttl(void *a1, void *a2, int a3, void *a4)
{
  unint64_t v7 = a1;
  id v8 = a2;
  uint64_t v9 = v8;
  uint64_t v10 = 3LL;
  uint64_t v11 = 4LL;
  uint64_t v12 = 5LL;
  if (a3 != 30) {
    uint64_t v12 = 0LL;
  }
  if (a3 != 14) {
    uint64_t v11 = v12;
  }
  if (a3 != 7) {
    uint64_t v10 = v11;
  }
  uint64_t v13 = 1LL;
  uint64_t v14 = 2LL;
  if (a3 != 3) {
    uint64_t v14 = 0LL;
  }
  if (a3 != 1) {
    uint64_t v13 = v14;
  }
  if (a3 <= 6) {
    uint64_t v10 = v13;
  }
  uint64_t v15 = v7[v10 + 8];
  if (!v15) {
    goto LABEL_20;
  }
  int v16 = *(void **)v15;
  id v17 = [v8 catalog];
  unint64_t v18 = _os_trace_uuid_map_lookup(v16, (void *)[v17 bootUUID]);

  if (v18)
  {
    if (v18 <= 1) {
      uint64_t v19 = *(void *)(v15 + 8);
    }
    else {
      uint64_t v19 = 0LL;
    }
    *a4 = v19;
LABEL_20:
    uint64_t v20 = 1LL;
    goto LABEL_21;
  }

  uint64_t v20 = 0LL;
LABEL_21:

  return v20;
}

LABEL_58:
                _os_log_index_metadata_determine_oldest((uint64_t)&self->_metadata, (uint64_t)self->_tsdb);
                self->_metadataValid = 1;

                uint64_t v11 = v53;
                unint64_t v7 = v54;
                int v16 = v52;
                uint64_t v27 = 1;
                uint64_t v26 = v51;
              }

              uint64_t v25 = v56;
              uint64_t v21 = v57;
            }

            else
            {
              uint64_t v27 = 0;
              uint64_t v21 = v57;
            }
          }

          else
          {
            uint64_t v27 = 0;
          }
        }

        else
        {
          uint64_t v27 = 0;
        }
      }

      else
      {
        uint64_t v27 = 0;
      }
    }

    else
    {
      uint64_t v27 = 0;
    }
  }

  else
  {
    uint64_t v48 = __error();
    _OSLogFailWithPOSIXError((id)*v48, a3);
    return 0;
  }

  return v27;
}

          if (!a8) {
            return 0LL;
          }
          LOBYTE(a4) = a3;
          goto LABEL_60;
        }

        uint64_t v25 = 0;
LABEL_50:
        v26 += *v29;
      }
    }

    if (a8)
    {
      uuid_unparse_upper((const unsigned __int8 *)a2, out);
      _uuidpath_error_message(a3, a8, "Invalid image <%s>", v41, v42, v43, v44, v45, (char)out);
    }

    return 0LL;
  }

  else
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t result = 0LL;
    *a8 = "Invalid image UUID (NULL)";
  }

  return result;
}

void sub_18699D230( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void _os_log_index_metadata_determine_oldest(uint64_t a1, uint64_t a2)
{
  v9[5] = *MEMORY[0x1895F89C0];
  impl = (uint64_t *)_timesync_range_create_impl(a2, 0LL, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v4 = 0LL;
  v9[0] = a1;
  v9[1] = a1 + 24;
  size_t v9[2] = a1 + 48;
  void v9[3] = a1 + 72;
  v9[4] = a1 + 96;
  *(void *)(a1 + 144) = 0LL;
  do
  {
    uint64_t v5 = v9[v4];
    id v6 = *(void **)(a1 + 144);
    unint64_t v7 = *(void *)(v5 + 16);
    int v8 = _timesync_range_contains(impl, (void *)v5, v7);
    if (!v6)
    {
      if ((v8 & 1) == 0) {
        goto LABEL_3;
      }
LABEL_10:
      *(void *)(a1 + 144) = v5;
      goto LABEL_3;
    }

LABEL_3:
    ++v4;
  }

  while (v4 != 5);
  _os_trace_uuid_map_destroy((void **)*impl);
  free(impl);
}

  int v8 = ctf_add_generic(a1, a2, a3, &v15);
  if (v8 != -1)
  {
    uint64_t v9 = v15;
    if (a2) {
      uint64_t v10 = 21504;
    }
    else {
      uint64_t v10 = 20480;
    }
    *(_DWORD *)(v15 + 44) = v10;
    *(_DWORD *)(v9 + 4_Block_object_dispose(va, 8) = a4;
    ctf_ref_inc(a1, a4);
  }

  return v8;
}

id _OSLogError(uint64_t a1)
{
  size_t v9[2] = *MEMORY[0x1895F89C0];
  switch(a1)
  {
    case 4LL:
    case 5LL:
    case 11LL:
    case 12LL:
    case 13LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"The log archive is corrupt or incomplete and cannot be read";
      uint64_t v3 = 2LL;
      break;
    case 7LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:7];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"A system resource shortage prevented the operation from completing successfully";
      uint64_t v3 = 6LL;
      break;
    case 8LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:8];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"The log archive format requires upgrading in order to be opened";
      uint64_t v3 = 4LL;
      break;
    case 9LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:9];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"The log archive upgrade process failed";
      uint64_t v3 = 5LL;
      break;
    case 10LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:10];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"The log archive version is unsupported by this library";
      uint64_t v3 = 3LL;
      break;
    case 14LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:14];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"Client lacks entitlement to perform operation";
      uint64_t v3 = 9LL;
      break;
    case 15LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:15];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"Connection to logd failed";
      uint64_t v3 = 10LL;
      break;
    case 16LL:
    case 17LL:
    case 18LL:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"The log archive contains partial or missing metadata";
      uint64_t v3 = 7LL;
      break;
    default:
      unint64_t v7 = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
      os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *MEMORY[0x1896075E0];
      v9[0] = v1;
      id v2 = @"The specified URL did not refer to a valid log archive";
      uint64_t v3 = 1LL;
      break;
  }

  v9[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v7 count:2];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"OSLogErrorDomain" code:v3 userInfo:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _OSLogPOSIXError(uint64_t a1, uint64_t a2)
{
  v12[3] = *MEMORY[0x1895F89C0];
  else {
    uint64_t v3 = qword_1869D8F98[a1 - 4];
  }
  v11[0] = @"_OSLogErrorInternalCode";
  [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = @"_OSLogErrorPOSIXErrno";
  uint64_t v5 = [MEMORY[0x189607968] numberWithInt:a2];
  v12[1] = v5;
  void v11[2] = *MEMORY[0x1896075E0];
  uint64_t v6 = v3 - 1;
  if ((unint64_t)(v3 - 1) >= 0xA || ((0x37Fu >> v6) & 1) == 0)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: unimplemented log error case";
    qword_18C695DD0 = v3;
    __break(1u);
  }

  unint64_t v7 = (void *)v5;
  v12[2] = off_189F0EA88[v6];
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"OSLogErrorDomain" code:v3 userInfo:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id _OSLogInternalError(uint64_t a1, void *a2)
{
  void v11[3] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = qword_1869D8F98[a1 - 4];
  v10[0] = @"_OSLogErrorInternalCode";
  [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = @"_OSLogErrorInternalError";
  uint64_t v6 = v3;
  if (!v3)
  {
    [MEMORY[0x189603FE8] null];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11[1] = v6;
  void v10[2] = *MEMORY[0x1896075E0];
  if ((unint64_t)(v4 - 1) >= 0xA)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: unimplemented log error case";
    qword_18C695DD0 = v4;
    __break(1u);
  }

  void v11[2] = off_189F0EAD8[v4 - 1];
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3) {

  }
  [MEMORY[0x189607870] errorWithDomain:@"OSLogErrorDomain" code:v4 userInfo:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1869A0108( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1869A0488( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1869A0A58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

uint64_t _cmp_uuid_node(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), (const unsigned __int8 *)(a3 + 24));
}

uint64_t _cmp_uuid_key(int a1, uint64_t a2, unsigned __int8 *uu2)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), uu2);
}

uint64_t __Block_byref_object_copy__836(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__837(uint64_t a1)
{
}

uint64_t uuidpath_sharedcache_resolve_fd( uint64_t a1, __n128 *a2, unint64_t a3, unint64_t a4, unint64_t a5, const char **a6, const char **a7, void *a8, unint64_t a9, void *a10, const char **a11)
{
  int v17 = a1;
  v35[1] = *MEMORY[0x1895F89C0];
  dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(a1, 0LL, a2, 1);
  if (dsc_map_impl)
  {
    uint64_t v19 = (uint64_t)dsc_map_impl;
    if (!a6 || (uint64_t v20 = _os_trace_uuiddb_dsc_map_resolve_string((uint64_t)dsc_map_impl, a3), (*a6 = v20) != 0LL))
    {
      if (a7) {
        *a7 = _os_trace_uuiddb_dsc_map_resolve_string(v19, a5);
      }
      if (!a8 && !a9 && !a10 || (_os_trace_uuiddb_dsc_map_resolve_entry(v19, a4, a8, (void *)a9, a10) & 1) != 0) {
        return 1LL;
      }
      if (a11)
      {
        uint64_t result = 0LL;
        uint64_t v22 = "<Invalid shared cache code pointer offset>";
        goto LABEL_20;
      }

      return 0LL;
    }

    if (a11)
    {
      uint64_t result = 0LL;
      uint64_t v22 = "<Invalid shared cache format string offset>";
      goto LABEL_20;
    }

    return 0LL;
  }

  if (headercache_once == -1)
  {
    if (!a2) {
      goto LABEL_14;
    }
  }

  else
  {
    dispatch_once(&headercache_once, &__block_literal_global_878);
    if (!a2)
    {
LABEL_14:
      if (a11)
      {
        uint64_t result = 0LL;
        uint64_t v22 = "<Invalid shared cache is NULL>";
LABEL_20:
        *a11 = v22;
        return result;
      }

      return 0LL;
    }
  }

  uint64_t v23 = pthread_getspecific(headercache_key);
  if (!v23)
  {
    uint64_t v23 = calloc(1uLL, 0xC8uLL);
    pthread_setspecific(headercache_key, v23);
  }

  if (uuid_compare((const unsigned __int8 *)v23 + 24, (const unsigned __int8 *)a2))
  {
    v35[0] = 0LL;
    uint64_t v24 = uuidpath_map_header_fd(v17, (uint64_t)a2, v35);
    if (!v24)
    {
      if (a11) {
        *a11 = "<Invalid - Unable to find matching cache information>";
      }
      return 0LL;
    }

    uint64_t v25 = v24;
    if ((v24[8] & 2) == 0)
    {
      if (a11) {
        *a11 = "<Invalid - Not shared cache information>";
      }
      munmap(v24, v35[0]);
      return 0LL;
    }

    uint64_t v26 = (void *)*((void *)v23 + 1);
    if (v26) {
      munmap(v26, *((void *)v23 + 2));
    }
    size_t v27 = v35[0];
    *((void *)v23 + 1) = v25;
    *((void *)v23 + 2) = v27;
    uuid_copy((unsigned __int8 *)v23 + 24, (const unsigned __int8 *)a2);
  }

  else
  {
    uint64_t v25 = (_BYTE *)*((void *)v23 + 1);
    if (!v25)
    {
      if (a11)
      {
        uint64_t result = 0LL;
        uint64_t v22 = "<Invalid - Unable to find matching cache information>";
        goto LABEL_20;
      }

      return 0LL;
    }
  }

  uint64_t v28 = *((unsigned int *)v25 + 3);
  if (!(_DWORD)v28)
  {
LABEL_42:
    if (a11)
    {
      uint64_t result = 0LL;
      uint64_t v22 = "<Invalid shared cache offset>";
      goto LABEL_20;
    }

    return 0LL;
  }

  uint64_t v29 = 0LL;
  unint64_t v30 = a3 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v31 = v25 + 48;
  while (1)
  {
    unint64_t v32 = *(v31 - 1) - *((void *)v25 + 2);
    if (v30 >= v32 && v30 <= *v31 + v32) {
      break;
    }
    ++v29;
    v31 += 4;
    if (v28 == v29) {
      goto LABEL_42;
    }
  }

  uint64_t v33 = &v25[32 * v29 + 24];
  if (a8) {
    *a8 = v33;
  }
  return uuidpath_resolve_fd(v17, v33, (v30 - v32) | a3 & 0x8000000000000000LL, 0LL, a6, 0LL, (void *)a9, a11);
}

_DWORD *uuidpath_map_header_fd(int a1, uint64_t a2, size_t *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a3) {
    *a3 = 0LL;
  }
  if (!a2) {
    return 0LL;
  }
  _os_trace_uuiddb_get_pathsuffix(a2, 1, __str, 0x400uLL);
  uint64_t result = (_DWORD *)_os_trace_mmap_at();
  if (!result) {
    return result;
  }
  if (v5 < 0x10 || *result != 1719109785 || result[1] != 2)
  {
    munmap(result, v5);
    return 0LL;
  }

  if (a3) {
    *a3 = v5;
  }
  return result;
}

uint64_t uuidpath_resolve_fd( int a1, const void *a2, unint64_t a3, unint64_t a4, const char **a5, const char **a6, void *a7, void *a8)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  size_t v51 = 0LL;
  if (a2)
  {
    if (!a5)
    {
      if (a7)
      {
        int v16 = _uuidpath_pathcache();
        node = (char *)rb_tree_find_node(v16, a2);
        if (node)
        {
          *a7 = node + 40;
          return 1LL;
        }
      }
    }

    unint64_t v18 = _uuidpath_headercache_lookup((const unsigned __int8 *)a2, &v51);
    if (v18) {
      goto LABEL_9;
    }
    uint64_t v19 = (char *)uuidpath_map_header_fd(a1, (uint64_t)a2, &v51);
    if (v19)
    {
      unint64_t v18 = v19;
      _uuidpath_headercache_add((const unsigned __int8 *)a2, (uint64_t)v19, v51);
LABEL_9:
      uint64_t v20 = _uuidpath_pathcache_add((uint64_t)v18, (const unsigned __int8 *)a2, v51);
      if (a7 && v20)
      {
        *a7 = v20 + 40;
        if (!a5) {
          return 1LL;
        }
      }

      else if (!a5)
      {
        return 1LL;
      }

      if ((a3 & 0x8000000000000000LL) != 0)
      {
        *a5 = "%s";
        return 1LL;
      }

      uint64_t v22 = *((unsigned int *)v18 + 3);
      if (!(_DWORD)v22) {
        goto LABEL_58;
      }
      uint64_t v23 = 0LL;
      LOBYTE(v24) = 0;
      BOOL v25 = a6 == 0LL;
      uint64_t v26 = (uint64_t)&v18[8 * v22 + 16];
      int64_t v27 = v51;
      while (1)
      {
        uint64_t v28 = &v18[8 * v23];
        int v30 = *((_DWORD *)v28 + 5);
        uint64_t v29 = (unsigned int *)(v28 + 20);
        unint64_t v31 = *(v29 - 1);
        unint64_t v32 = (v30 + v31);
        if ((v24 & 1) == 0)
        {
          uint64_t v33 = a3 - v31;
          if (a3 < v31 || v32 <= a3)
          {
            int v24 = 0;
            if (v25) {
              goto LABEL_47;
            }
            goto LABEL_34;
          }

          if (v33 > v27 || v33 < 0) {
            uint64_t v36 = "<format string calculation error>";
          }
          else {
            uint64_t v36 = (const char *)(v26 + v33);
          }
          *a5 = v36;
        }

        int v24 = 1;
        if (v25) {
          goto LABEL_47;
        }
LABEL_34:
        uint64_t v37 = a4 - v31;
        if (a4 >= v31 && v32 > a4)
        {
          if (v37 > v27 || v37 < 0) {
            __int128 v40 = "<signpost name calculation error>";
          }
          else {
            __int128 v40 = (const char *)(v26 + v37);
          }
          *a6 = v40;
LABEL_47:
          if ((v24 & 1) != 0) {
            return 1LL;
          }
          BOOL v25 = 1;
          goto LABEL_50;
        }

        if (++v23 >= (unint64_t)*((unsigned int *)v18 + 3))
        {
          if (v24)
          {
            if (!a8) {
              return 0LL;
            }
LABEL_60:
            uuid_unparse_upper((const unsigned __int8 *)a2, out);
            _uuidpath_error_message(a3, a8, "Invalid bounds %d for %s", v46, v47, v48, v49, v50, a4);
            return 0LL;
          }

rb_tree_t *_uuidpath_pathcache()
{
  if (_uuidpath_pathcache_onceToken != -1) {
    dispatch_once(&_uuidpath_pathcache_onceToken, &__block_literal_global_20);
  }
  id v0 = (rb_tree_t *)pthread_getspecific(_uuidpath_pathcache_key);
  if (!v0)
  {
    id v0 = (rb_tree_t *)calloc(1uLL, 0x40uLL);
    rb_tree_init(v0, (const rb_tree_ops_t *)&_uuidpath_pathcache_ops);
    pthread_setspecific(_uuidpath_pathcache_key, v0);
  }

  return v0;
}

char *_uuidpath_headercache_lookup(const unsigned __int8 *a1, void *a2)
{
  if (headercache_once != -1) {
    dispatch_once(&headercache_once, &__block_literal_global_22);
  }
  uint64_t result = (char *)pthread_getspecific(headercache_key);
  if (result)
  {
    size_t v5 = result;
    uint64_t v6 = 0LL;
    for (uint64_t i = (const unsigned __int8 *)(result + 56); uuid_compare(i, a1); i += 32)
    {
      if (++v6 == 5) {
        return 0LL;
      }
    }

    uint64_t v8 = &v5[32 * v6];
    uint64_t result = (char *)*((void *)v8 + 5);
    *a2 = *((void *)v8 + 6);
  }

  return result;
}

void _uuidpath_headercache_add(const unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a1 && !uuid_is_null(a1))
  {
    if (headercache_once != -1) {
      dispatch_once(&headercache_once, &__block_literal_global_24);
    }
    uint64_t v6 = (int *)pthread_getspecific(headercache_key);
    if (!v6)
    {
      uint64_t v6 = (int *)calloc(1uLL, 0xC8uLL);
      pthread_setspecific(headercache_key, v6);
    }

    uint64_t v7 = *v6;
    uint64_t v8 = &v6[8 * v7];
    uint64_t v9 = (void *)*((void *)v8 + 5);
    if (v9)
    {
      munmap(v9, *((void *)v8 + 6));
      uint64_t v7 = *v6;
    }

    uint64_t v10 = &v6[8 * v7];
    *((void *)v10 + 5) = a2;
    *((void *)v10 + 6) = a3;
    uuid_copy((unsigned __int8 *)v10 + 56, a1);
    if (*v6 == 4) {
      int v11 = 0;
    }
    else {
      int v11 = *v6 + 1;
    }
    int *v6 = v11;
  }

unsigned __int8 *_uuidpath_pathcache_add(uint64_t a1, const unsigned __int8 *a2, unint64_t a3)
{
  if (a3 >= 0x10 && (*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 12);
    unint64_t v5 = 8 * v4 + 16;
    if (v5 < a3)
    {
      if ((_DWORD)v4)
      {
        uint64_t v6 = (unsigned int *)(a1 + 20);
        while (1)
        {
          unsigned int v7 = *v6;
          v6 += 2;
          BOOL v8 = __CFADD__(v5, v7);
          v5 += v7;
          if (v8) {
            break;
          }
          if (!--v4) {
            goto LABEL_8;
          }
        }
      }

      else
      {
LABEL_8:
        size_t v9 = a3 - v5;
        if (a3 > v5)
        {
          uint64_t v10 = (const void *)(a1 + v5);
          size_t v11 = strnlen((const char *)(a1 + v5), a3 - v5);
          if (v11 < v9)
          {
            size_t v12 = v11;
            goto LABEL_12;
          }
        }
      }
    }
  }

  size_t v12 = 0LL;
  uint64_t v10 = &_CTF_NULLSTR;
LABEL_12:
  uint64_t v13 = (unsigned __int8 *)_os_trace_malloc();
  uuid_copy(v13 + 24, a2);
  memcpy(v13 + 40, v10, v12 + 1);
  uint64_t v14 = _uuidpath_pathcache();
  inserted = (unsigned __int8 *)rb_tree_insert_node(v14, v13);
  if (v13 != inserted) {
    free(v13);
  }
  return inserted;
}

uint64_t _uuidpath_error_message( uint64_t a1, void *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_uuidpath_error_message_onceToken != -1) {
    dispatch_once(&_uuidpath_error_message_onceToken, &__block_literal_global_17);
  }
  size_t v12 = pthread_getspecific(_uuidpath_error_message_threadKey);
  uint64_t v13 = v12;
  if (v12 && *v12 == a1 && *((_DWORD *)v12 + 2) < 5u)
  {
    uint64_t v14 = (unsigned int *)v12;
  }

  else
  {
    uint64_t v14 = (unsigned int *)calloc(1uLL, 0x38uLL);
    *(void *)uint64_t v14 = a1;
    pthread_setspecific(_uuidpath_error_message_threadKey, v14);
    if (v13) {
      _uuidpath_error_message_free(v13);
    }
  }

  uint64_t result = vasprintf((char **)&v14[2 * v14[2] + 4], a3, &a9);
  uint64_t v16 = v14[2];
  *a2 = *(void *)&v14[2 * v16 + 4];
  v14[2] = v16 + 1;
  return result;
}

void _uuidpath_error_message_free(void *a1)
{
  unint64_t v2 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v2)
  {
    for (unint64_t i = 0LL; i < v2; ++i)
    {
      uint64_t v4 = (void *)a1[i + 2];
      if (v4)
      {
        free(v4);
        unint64_t v2 = *((unsigned int *)a1 + 2);
      }
    }
  }

  free(a1);
}

uint64_t ___uuidpath_error_message_block_invoke()
{
  return pthread_key_create( (pthread_key_t *)&_uuidpath_error_message_threadKey,  (void (__cdecl *)(void *))_uuidpath_error_message_free);
}

uint64_t ___uuidpath_headercache_add_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

void _uuidpath_headercache_free(void *a1)
{
  unint64_t v2 = (void *)a1[1];
  if (v2) {
    munmap(v2, a1[2]);
  }
  for (uint64_t i = 0LL; i != 20; i += 4LL)
  {
    uint64_t v4 = (void *)a1[i + 5];
    if (v4) {
      munmap(v4, a1[i + 6]);
    }
  }

  free(a1);
}

uint64_t ___uuidpath_headercache_lookup_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

uint64_t _uuidpath_pathcache_compare_nodes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), (const unsigned __int8 *)(a3 + 24));
}

uint64_t _uuidpath_pathcache_compare_key(int a1, uint64_t a2, unsigned __int8 *uu2)
{
  return uuid_compare((const unsigned __int8 *)(a2 + 24), uu2);
}

uint64_t ___uuidpath_pathcache_block_invoke()
{
  return pthread_key_create( (pthread_key_t *)&_uuidpath_pathcache_key,  (void (__cdecl *)(void *))_uuidpath_pathcache_free);
}

void _uuidpath_pathcache_free(rb_tree_t *a1)
{
  unint64_t v2 = rb_tree_iterate(a1, 0LL, 1u);
  if (v2)
  {
    id v3 = v2;
    do
    {
      uint64_t v4 = rb_tree_iterate(a1, v3, 1u);
      rb_tree_remove_node(a1, v3);
      free(v3);
      id v3 = v4;
    }

    while (v4);
  }

  free(a1);
}

uint64_t ___uuidpath_sharedcache_resolve_fd_legacy_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&headercache_key, (void (__cdecl *)(void *))_uuidpath_headercache_free);
}

_DWORD *uuidpath_map_header(const char *a1, uint64_t a2, size_t *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *a3 = 0LL;
  if (!a2) {
    return 0LL;
  }
  if (!a1)
  {
    if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1) {
      dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
    }
    if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
    {
      _os_trace_uuiddb_get_path(0LL, a2, 1, __str);
      goto LABEL_8;
    }

    return 0LL;
  }

  int v5 = snprintf(__str, 0x400uLL, "%s/", a1);
  _os_trace_uuiddb_get_pathsuffix(a2, 1, &__str[v5], 1024LL - v5);
LABEL_8:
  uint64_t result = (_DWORD *)_os_trace_mmap_at();
  if (result && (*a3 < 0x10 || *result != 1719109785 || result[1] != 2))
  {
    munmap(result, *a3);
    uint64_t result = 0LL;
    *a3 = 0LL;
  }

  return result;
}

uint64_t uuidpath_resolve( char *a1, const void *a2, unint64_t a3, unint64_t a4, const char **a5, const char **a6, void *a7, void *a8)
{
  uint64_t v15 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    uint64_t v15 = (const char *)_os_trace_uuidtext_path;
  }

  int v16 = open(v15, 0);
  if (v16 == -1)
  {
    if (a8)
    {
      __error();
      _uuidpath_error_message(a3, a8, "Unable to open source path <%s> (%d)", v20, v21, v22, v23, v24, (char)v15);
      return 0LL;
    }

    return (uint64_t)a8;
  }

  int v17 = v16;
  a8 = (void *)uuidpath_resolve_fd(v16, a2, a3, a4, a5, a6, a7, a8);
  if (close(v17) != -1) {
    return (uint64_t)a8;
  }
  int v18 = *__error();
  uint64_t result = *__error();
  if (v18 != 9)
  {
    _os_assumes_log();
    return (uint64_t)a8;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

BOOL uuidpath_lookup_fd(int a1, const void *a2, void *a3)
{
  uint64_t v6 = _uuidpath_pathcache();
  node = (char *)rb_tree_find_node(v6, a2);
  if (!node)
  {
    size_t v12 = 0LL;
    uint64_t v8 = _uuidpath_headercache_lookup((const unsigned __int8 *)a2, &v12);
    if (v8)
    {
LABEL_8:
      node = (char *)_uuidpath_pathcache_add((uint64_t)v8, (const unsigned __int8 *)a2, v12);
      goto LABEL_9;
    }

    if (a1 == -3) {
      size_t v9 = (char *)uuidpath_map_header(0LL, (uint64_t)a2, &v12);
    }
    else {
      size_t v9 = (char *)uuidpath_map_header_fd(a1, (uint64_t)a2, &v12);
    }
    uint64_t v8 = v9;
    if (v9)
    {
      _uuidpath_headercache_add((const unsigned __int8 *)a2, (uint64_t)v9, v12);
      goto LABEL_8;
    }

    node = 0LL;
  }

LABEL_9:
  uint64_t v10 = node + 40;
  if (!node) {
    uint64_t v10 = 0LL;
  }
  *a3 = v10;
  return node != 0LL;
}

  int v17 = *(char **)(a1 + 88);
  if (!v17)
  {
    int v18 = _os_log_resolve_format(*(__n128 **)(a1 + 24), *(void *)a1, *(void *)(a1 + 72), &v24);
    if (!v18)
    {
      uint64_t v22 = v24;
      return strdup(v22);
    }

    int v17 = (char *)v18;
    *(void *)(a1 + 8_Block_object_dispose(va, 8) = v18;
  }

  if ((*(_DWORD *)(a1 + 80) & 1) != 0) {
    uint64_t v19 = 4LL;
  }
  else {
    uint64_t v19 = 8LL;
  }
  os_log_fmt_compose((size_t)v25, v17, 1LL, 3u, v19, v9, 0LL, 0, 0LL, 0, 0LL);
  uint64_t v20 = v27;
  uint64_t result = (char *)v25[0];
  v25[0] = 3954044928LL;
  int64_t v27 = 0;
  if ((v20 & 1) == 0) {
    return (char *)_os_trace_memdup();
  }
  return result;
}

  size_t v12 = *(void *)(a1 + 528);
  if (v12) {
    ctf_close(v12, a2, a3, a4, a5, a6, a7, a8);
  }
  if (a2)
  {
    *(_DWORD *)(a1 + 556) |= 2u;
    ++*(_DWORD *)(a2 + 552);
  }

  uint64_t result = 0LL;
  *(void *)(a1 + 52_Block_object_dispose(va, 8) = a2;
  return result;
}

const char *_os_log_resolve_format(__n128 *a1, int a2, unint64_t a3, const char **a4)
{
  size_t v11 = 0LL;
  unsigned int v5 = BYTE2(a2) & 0xE;
  if (v5 > 0xC) {
    goto LABEL_10;
  }
  int v6 = 1 << v5;
  if ((v6 & 0x504) != 0)
  {
    char v7 = uuidpath_resolve(0LL, a1, a3, 0LL, &v11, 0LL, 0LL, 0LL);
    if (!a4 || (v7 & 1) != 0) {
      return v11;
    }
    goto LABEL_11;
  }

  if ((v6 & 0x1010) == 0)
  {
LABEL_10:
    if (!a4) {
      return v11;
    }
LABEL_11:
    size_t v9 = "<compose failure [UUID]>";
    goto LABEL_12;
  }

  char v8 = uuidpath_sharedcache_resolve_fd(0xFFFFFFFFLL, a1, a3, 0LL, 0LL, &v11, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (a4 && (v8 & 1) == 0)
  {
    size_t v9 = "<compose failure [shared UUID]>";
LABEL_12:
    *a4 = v9;
  }

  return v11;
}

uint64_t OSLogLookupPathWithUUID(const void *a1, void *a2, void *a3)
{
  return uuidpath_resolve(0LL, a1, 0LL, 0LL, 0LL, 0LL, a2, a3);
}

void sub_1869A237C(void *a1)
{
  v1[9] = 8LL;
  [v1 invalidate];
  objc_end_catch();
  JUMPOUT(0x1869A2360LL);
}

void sub_1869A23A0(_Unwind_Exception *a1)
{
}

void sub_1869A2798( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  size_t v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
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
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }

  if (v7 > v6)
  {
    char v8 = *(const void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      *(void *)a1 = _os_trace_realloc();
    }

    else
    {
      size_t v9 = (void *)_os_trace_malloc();
      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }

    *(_DWORD *)(a1 + 12) = v7;
  }

  return v7 - v4;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0LL;
  }
  size_t v3 = __n;
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  size_t v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16)) {
      size_t v7 = os_trace_blob_grow(a1, __n);
    }
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      size_t v3 = v7;
    }
  }

  memcpy((void *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  unsigned int v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v8;
  if (!*(_BYTE *)(a1 + 22)) {
    *(_BYTE *)(*(void *)a1 + v_Block_object_dispose(va, 8) = 0;
  }
  return v3;
}

void os_trace_blob_add_unsafe_bytes(uint64_t a1, char *__src, unint64_t a3)
{
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    unint64_t v3 = a3;
    int v6 = *(_DWORD *)(a1 + 8);
    if (!*(_BYTE *)(a1 + 22)) {
      ++v6;
    }
    int v7 = *(_DWORD *)(a1 + 16);
    if (v7)
    {
      unsigned int v8 = v7 - v6;
      if (!a3) {
        return;
      }
      goto LABEL_10;
    }

    int v9 = *(_DWORD *)(a1 + 12);
    unsigned int v8 = v9 - v6;
    if (!v9) {
      unsigned int v8 = 0;
    }
    if (a3)
    {
LABEL_10:
      if (!v8) {
        return;
      }
      unint64_t v10 = 0LL;
      unint64_t v11 = v8;
      while (1)
      {
        if (!*__src) {
          return;
        }
        if (v3 >= v11 - v10) {
          int64_t v12 = v11 - v10;
        }
        else {
          int64_t v12 = v3;
        }
        if (v12)
        {
          if (_os_trace_unsafe_ascii_once != -1) {
            dispatch_once(&_os_trace_unsafe_ascii_once, &__block_literal_global_1077);
          }
          if (v12 >= 1)
          {
            if (((*(void *)((char *)_os_trace_unsafe_ascii_tbl
                             + (((unint64_t)*__src >> 3) & 0x18)) >> *__src) & 1) != 0)
            {
              int64_t v12 = 0LL;
            }

            else
            {
              uint64_t v13 = 1LL;
              while (v13 < v12)
              {
                unint64_t v14 = __src[v13++];
                if (((*(void *)((char *)_os_trace_unsafe_ascii_tbl + ((v14 >> 3) & 0x18)) >> v14) & 1) != 0)
                {
                  int64_t v12 = v13 - 1;
                  break;
                }
              }
            }
          }
        }

        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v15 = *(unsigned int *)(a1 + 8);
          if (v12 > (unint64_t)(*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v15 - 1))
          {
            os_trace_blob_add_slow(a1, __src, v12);
          }

          else
          {
            memcpy((void *)(*(void *)a1 + v15), __src, v12);
            unsigned int v16 = *(_DWORD *)(a1 + 8) + v12;
            *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v16;
            if (!*(_BYTE *)(a1 + 22)) {
              *(_BYTE *)(*(void *)a1 + v16) = 0;
            }
          }
        }

        unint64_t v17 = v3 - v12;
        if (!v17) {
          return;
        }
        unint64_t v18 = v12 + v10;
        if (v18 == v11) {
          return;
        }
        uint64_t v19 = &__src[v12];
        int v20 = *v19;
        if (!*v19) {
          return;
        }
        if ((v20 & 0x80) == 0) {
          break;
        }
        size_t v25 = _os_trace_utf8_len(v19, v17);
        if (v25 == -1LL)
        {
          unint64_t v10 = v18 + 4;
          if (v10 > v11) {
            return;
          }
          int v29 = v20 & 0x7F;
          if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * (v20 & 0x7F) + 60) & 0x200) == 0)
          {
            qmemcpy(&v37, "\\M-", 3);
            HIBYTE(v37) = v20 & 0x7F;
            if ((*(_BYTE *)(a1 + 20) & 2) == 0)
            {
              uint64_t v30 = *(unsigned int *)(a1 + 8);
              if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) > 3)
              {
                uint64_t v31 = *(void *)a1;
                int v32 = v37;
                goto LABEL_59;
              }

              p_srca = (__int16 *)&v37;
LABEL_71:
              uint64_t v35 = a1;
              size_t v36 = 4LL;
LABEL_72:
              os_trace_blob_add_slow(v35, p_srca, v36);
            }

uint64_t _os_trace_utf8_len(char *a1, unint64_t a2)
{
  char v2 = *a1;
  if ((*a1 & 0xF8) == 0xF0)
  {
    unint64_t v3 = 4LL;
  }

  else if ((v2 & 0xF0) == 0xE0)
  {
    unint64_t v3 = 3LL;
  }

  else
  {
    if ((v2 & 0xE0) != 0xC0) {
      return -1LL;
    }
    unint64_t v3 = 2LL;
  }

  if (v3 <= a2)
  {
    uint64_t v4 = 1LL;
    while ((a1[v4] & 0xC0) == 0x80)
    {
      if (v3 == ++v4) {
        return v3;
      }
    }

    return -1LL;
  }

  return -2LL;
}

void __os_trace_safe_ascii_strcspn_block_invoke()
{
  uint64_t v0 = 0LL;
  uint64_t v1 = MEMORY[0x1895F8770];
  do
  {
    ++v0;
  }

  while (v0 != 256);
}

unint64_t os_trace_blob_addns(uint64_t a1, char *__src, unint64_t a3)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0LL;
  }
  unint64_t v3 = a3;
  uint64_t v4 = __src;
  int v6 = *(_DWORD *)(a1 + 8);
  if (!*(_BYTE *)(a1 + 22)) {
    ++v6;
  }
  int v7 = *(_DWORD *)(a1 + 16);
  if (v7)
  {
    unint64_t v8 = (v7 - v6);
  }

  else
  {
    int v9 = *(_DWORD *)(a1 + 12);
    LODWORD(v_Block_object_dispose(va, 8) = v9 - v6;
    if (v9) {
      unint64_t v8 = v8;
    }
    else {
      unint64_t v8 = 0LL;
    }
  }

  if (v8 < a3) {
    unint64_t v3 = v8;
  }
  if (*__src)
  {
    size_t v10 = 0LL;
    uint64_t v11 = MEMORY[0x1895F8770];
    while (1)
    {
      size_t v12 = 0LL;
      size_t v13 = v3 - v10;
      if (v3 != v10)
      {
        while (v4[v12] >= 1 && (*(_DWORD *)(v11 + 4LL * v4[v12] + 60) & 0x4200) != 0x200)
        {
          if (v13 == ++v12)
          {
            size_t v12 = v3 - v10;
            break;
          }
        }
      }

      if (v12 >= v13) {
        size_t v14 = v3 - v10;
      }
      else {
        size_t v14 = v12;
      }
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        uint64_t v15 = *(unsigned int *)(a1 + 8);
        if (v14 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v15 - 1))
        {
          os_trace_blob_add_slow(a1, v4, v14);
        }

        else
        {
          memcpy((void *)(*(void *)a1 + v15), v4, v14);
          unsigned int v16 = *(_DWORD *)(a1 + 8) + v14;
          *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v16;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v16) = 0;
          }
        }
      }

      size_t v17 = v14 + v10;
      if (v3 == v14 + v10) {
        return v3;
      }
      unint64_t v18 = &v4[v14];
      int v19 = *v18;
      if (!*v18) {
        return v17;
      }
      if ((v19 & 0x80) == 0) {
        break;
      }
      size_t v24 = _os_trace_utf8_len(v18, v3 - (v14 + v10));
      if (v24 == -1LL)
      {
        size_t v10 = v17 + 4;
        if (v17 + 4 > v3) {
          return v17;
        }
        int v28 = v19 & 0x7F;
        if ((*(_DWORD *)(v11 + 4LL * (v19 & 0x7F) + 60) & 0x200) == 0)
        {
          qmemcpy(&v37, "\\M-", 3);
          HIBYTE(v37) = v19 & 0x7F;
          if ((*(_BYTE *)(a1 + 20) & 2) == 0)
          {
            uint64_t v29 = *(unsigned int *)(a1 + 8);
            if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) > 3)
            {
              uint64_t v30 = *(void *)a1;
              int v31 = v37;
              goto LABEL_53;
            }

            p_srca = (__int16 *)&v37;
LABEL_64:
            uint64_t v34 = a1;
            size_t v35 = 4LL;
LABEL_65:
            os_trace_blob_add_slow(v34, p_srca, v35);
          }

uint64_t os_trace_blob_addf( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(_BYTE *)(a1 + 22))
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0LL;
  }

  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0LL;
  }
  int v12 = *(_DWORD *)(a1 + 8);
  int v11 = *(_DWORD *)(a1 + 12);
  *__error() = 0;
  uint64_t v13 = vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v11 - v12), a2, &a9);
  if ((v13 & 0x80000000) != 0)
  {
    uint64_t v14 = 0LL;
    *(_BYTE *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
  }

  else
  {
    uint64_t v14 = v13;
    uint64_t v15 = (v11 + ~v12);
    if (v13 > v15)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        uint64_t v15 = os_trace_blob_grow(a1, v13);
        *__error() = 0;
        vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v15 + 1), a2, &a9);
      }

      if (v14 > v15)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        uint64_t v14 = v15;
      }
    }

    *(_DWORD *)(a1 + 8) += v14;
  }

  return v14;
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, char a3, unsigned int a4)
{
  time_t v20 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
  }

  else
  {
    uint64_t v4 = (uint64_t)result;
    if ((result->tm_year & 2) == 0)
    {
      uint64_t result = localtime_r(&v20, &v19);
      if (result)
      {
        os_trace_blob_addf(v4, "%04d-%02d-%02d %02d:%02d:%02d", v7, v8, v9, v10, v11, v12, LOBYTE(v19.tm_year) + 108);
        if (a4 <= 2) {
          os_trace_blob_addf(v4, off_189F0EFA8[a4], v13, v14, v15, v16, v17, v18, a3);
        }
        return (tm *)os_trace_blob_addf( v4,  "%+05ld",  v13,  v14,  v15,  v16,  v17,  v18,  (v19.tm_gmtoff / 60 % 60) + 100 * (v19.tm_gmtoff / 3600));
      }
    }
  }

  return result;
}

BOOL ctf_is_type(const char *a1, size_t a2)
{
  unint64_t v4 = 0LL;
  BOOL v5 = 1;
  do
  {
    if (strlen(BUILTIN_LIBRARY[v4]) == a2 && !strncmp(a1, BUILTIN_LIBRARY[v4], a2)) {
      break;
    }
    BOOL v5 = v4++ < 3;
  }

  while (v4 != 4);
  return v5;
}

uint64_t ctf_type_parse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = ctf_type_resolve(a1, a2);
  if (v10 == -1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  else
  {
    uint64_t v11 = v10;
    int v12 = ctf_type_kind(a1, v11);
    if (v12 < 31)
    {
      uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))ctf_formatters[v12];
      if (v13) {
        return v13(a1, a2, a3, a4, a5);
      }
      return 0LL;
    }
  }

  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t ctf_integer(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int a5)
{
  uint64_t v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    JUMPOUT(0x1869A5450LL);
  }

  uint64_t v15 = v8;
  uint64_t result = 0LL;
  switch(v15)
  {
    case 1LL:
      LOBYTE(v17) = *a4;
      goto LABEL_6;
    case 2LL:
      LOWORD(v17) = *(_WORD *)a4;
      goto LABEL_6;
    case 4LL:
      int v17 = *(_DWORD *)a4;
LABEL_6:
      os_trace_blob_addf(a3, "%#x", v9, v10, v11, v12, v13, v14, v17);
      goto LABEL_8;
    case 8LL:
      os_trace_blob_addf(a3, "%#llx", v9, v10, v11, v12, v13, v14, *(void *)a4);
LABEL_8:
      uint64_t result = 1LL;
      break;
    default:
      return result;
  }

  return result;
}

uint64_t ctf_float(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, unsigned int a5)
{
  uint64_t v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }

  else
  {
    if (v8 == 8)
    {
      double v15 = *a4;
      goto LABEL_6;
    }

    if (v8 == 4)
    {
      double v15 = *(float *)a4;
LABEL_6:
      os_trace_blob_addf(a3, "%.20g", v9, v10, v11, v12, v13, v14, SLOBYTE(v15));
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t ctf_pointer(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unsigned int a5)
{
  uint64_t v8 = ctf_type_size(a1, a2);
  if (v8 > a5)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }

  else
  {
    if (v8 == 8)
    {
      os_trace_blob_addf(a3, "0x%llx", v9, v10, v11, v12, v13, v14, *a4);
      return 1LL;
    }

    if (v8 == 4)
    {
      os_trace_blob_addf(a3, "0x%x", v9, v10, v11, v12, v13, v14, *(_DWORD *)a4);
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t ctf_array(uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (ctf_array_info(a1, a2, (uint64_t)&v37))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v5 = v37;
  if (ctf_type_encoding(a1, v5, __src))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_52;
  }

  if ((__src[0] & 2) == 0)
  {
LABEL_17:
    uint64_t v22 = ctf_type_size((uint64_t)a1, v5);
    if ((unint64_t)(v22 - 1) < 0xFFFF)
    {
      LODWORD(v6) = v22;
      unint64_t v7 = v38;
      if (v38 * v22 <= a5)
      {
        LOBYTE(__src[0]) = 91;
        if ((*(_WORD *)(a3 + 20) & 2) != 0) {
          goto LABEL_23;
        }
        uint64_t v23 = *(unsigned int *)(a3 + 8);
        if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 != (_DWORD)v23)
        {
          *(_BYTE *)(*(void *)a3 + v23) = 91;
          unsigned int v24 = *(_DWORD *)(a3 + 8) + 1;
          *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v24;
          if (!*(_BYTE *)(a3 + 22)) {
            *(_BYTE *)(*(void *)a3 + v24) = 0;
          }
LABEL_23:
          if ((_DWORD)v7)
          {
LABEL_24:
            unsigned int v25 = 0;
            unint64_t v26 = 0LL;
            while ((ctf_type_parse((uint64_t)a1, v5, a3, a4 + v25, (unsigned __int16)v6) & 1) != 0)
            {
              if (v26 < (v7 - 1) && (*(_WORD *)(a3 + 20) & 2) == 0)
              {
                uint64_t v27 = *(unsigned int *)(a3 + 8);
                if ((*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - v27 - 1) <= 1)
                {
                  os_trace_blob_add_slow(a3, ", ", 2uLL);
                }

                else
                {
                  *(_WORD *)(*(void *)a3 + v27) = 8236;
                  unsigned int v28 = *(_DWORD *)(a3 + 8) + 2;
                  *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v28;
                  if (!*(_BYTE *)(a3 + 22)) {
                    *(_BYTE *)(*(void *)a3 + v2_Block_object_dispose(va, 8) = 0;
                  }
                }
              }

              ++v26;
              v25 += v6;
              if (v7 == v26) {
                goto LABEL_44;
              }
            }

            if ((*(_WORD *)(a3 + 20) & 2) != 0) {
              goto LABEL_37;
            }
            uint64_t v29 = *(unsigned int *)(a3 + 8);
            if ((*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - v29 - 1) > 6)
            {
              uint64_t v30 = (_DWORD *)(*(void *)a3 + v29);
              *(_DWORD *)((char *)v30 + 3) = 1047687026;
              _DWORD *v30 = 1920099644;
              unsigned int v31 = *(_DWORD *)(a3 + 8) + 7;
              *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v31;
              if (*(_BYTE *)(a3 + 22))
              {
LABEL_37:
                uint64_t v32 = 0LL;
                goto LABEL_45;
              }

              uint64_t v32 = 0LL;
              *(_BYTE *)(*(void *)a3 + v31) = 0;
LABEL_45:
              LOBYTE(__src[0]) = 93;
              if ((*(_WORD *)(a3 + 20) & 2) == 0)
              {
                uint64_t v33 = *(unsigned int *)(a3 + 8);
                if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == (_DWORD)v33)
                {
                  os_trace_blob_add_slow(a3, __src, 1uLL);
                }

                else
                {
                  *(_BYTE *)(*(void *)a3 + v33) = 93;
                  unsigned int v34 = *(_DWORD *)(a3 + 8) + 1;
                  *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v34;
                  if (!*(_BYTE *)(a3 + 22)) {
                    *(_BYTE *)(*(void *)a3 + v34) = 0;
                  }
                }
              }

              return v32;
            }

LABEL_52:
            os_trace_blob_add_slow(a3, "<error>", 7uLL);
            goto LABEL_37;
          }

LABEL_44:
          uint64_t v32 = 1LL;
          goto LABEL_45;
        }

LABEL_42:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_43;
    }

  closedir(v11);
  a3 = v45;
  if (v45)
  {
LABEL_43:
    if (!v14)
    {
      uint64_t v30 = v30;
      uint64_t v14 = 0LL;
      *a3 = v30;
    }
  }

    if (v30 >= 1 && close(v30) == -1) {
      break;
    }
LABEL_46:
    if ((v47 & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v53 = 1;
    uint64_t v54 = v130;
LABEL_49:

    size_t v55 = v54;
    if ((v53 & 1) != 0)
    {
      v130 = v55;
    }

    else
    {
      if ([v55 code] != -2) {
        goto LABEL_85;
      }

      v130 = 0LL;
    }

    if (++v25 == 4)
    {
      if (!fstatat(v127, "logdata.LiveData.tracev3", &v163, 0))
      {
        unint64_t v67 = [v115 lastPathComponent];
        uint64_t v68 = [v67 UTF8String];
        v152 = v130;
        unint64_t v69 = _compact_tracev3( v127,  v68,  "logdata.LiveData.tracev3",  &v155,  (uint64_t)v153,  v27,  v28,  &v152);
        size_t v55 = v152;

        v130 = v55;
        if ((v69 & 1) != 0) {
          goto LABEL_82;
        }
        goto LABEL_85;
      }

      uint64_t v63 = *__error();
      if (v63 != 2)
      {
        create_repack_error(v63, @"Unable to fstatat logdata.LiveData.tracev3");
        size_t v55 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_85;
      }

  unsigned int v34 = &v22[64 * (unint64_t)HIWORD(v88)];
  size_t v36 = *((void *)v34 + 3);
  size_t v35 = *((void *)v34 + 4);
  uint64_t v37 = getpagesize();
  unsigned int v38 = v37 - 1;
  __int16 v39 = (v36 & v38) + v35;
  char v40 = (char *)mmap(0LL, v39, 1, 2, a1, v36 & -v37);
  if (v40 == (char *)-1LL)
  {
    free(v22);
    if (!a2) {
      return 0LL;
    }
    goto LABEL_74;
  }

  uint64_t v72 = v40;
  unint64_t v73 = v39;
  v75 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v40[*(void *)&v22[64 * (unint64_t)HIWORD(v88) + 24] & v38];
  uint64_t v44 = WORD6(v88);
  uint64_t v45 = v22 + 32;
  uint64_t v46 = &v22[64 * (unint64_t)HIWORD(v88) + 32];
  else {
    uint64_t v16 = v16;
  }
  v74 = &v40[*(void *)&v22[64 * (unint64_t)HIWORD(v88) + 24] & v38];
  do
  {
    uint64_t v47 = *((unsigned int *)v45 + 2);
    if (v47 < v44)
    {
      uint64_t v48 = *((unsigned int *)v45 - 8);
      if (*(void *)v46 > v48)
      {
        uint64_t v49 = *(unsigned int *)&v22[64 * v47];
        if (*(void *)v46 > v49)
        {
          uint64_t v50 = *((_DWORD *)v45 - 7);
          if (v50 == 2)
          {
            *(void *)&uint64_t v81 = &v43[v48];
            *((void *)&v81 + 1) = 2LL;
            uint64_t v53 = *(void *)v45;
            *(void *)&v82 = *((void *)v45 - 3);
            *(void *)&uint64_t v83 = v53;
            uint64_t v54 = *((void *)v45 - 1);
            *((void *)&v83 + 1) = *((void *)v45 + 3);
            uint64_t v84 = v54;
            size_t v55 = &v43[v49];
            uint64_t v56 = *(unsigned int *)&v22[64 * v47 + 4];
            *(void *)&v77 = v55;
            *((void *)&v77 + 1) = v56;
            v75 = v56;
            uint64_t v57 = &v79;
            int v58 = &v78;
            uint64_t v60 = &v80;
            uint64_t v59 = (char *)&v79 + 8;
            uint64_t v41 = 2LL;
          }

          else
          {
            if (v50 != 1) {
              goto LABEL_57;
            }
            size_t v51 = v41;
            int v52 = &v43[v48];
            if (strcmp(&v43[v48], ".SUNW_ctf"))
            {
              uint64_t v41 = v51;
              uint64_t v43 = v74;
              goto LABEL_57;
            }

            uint64_t v47 = v42;
            *(void *)&v85[0] = v52;
            *((void *)&v85[0] + 1) = 1LL;
            uint64_t v57 = v86;
            int v58 = &v85[1];
            uint64_t v60 = (uint64_t *)&v86[1];
            uint64_t v59 = (char *)v86 + 8;
            uint64_t v41 = v51;
            uint64_t v43 = v74;
          }

          uint64_t v61 = &v22[64 * v47];
          *(void *)int v58 = *((void *)v61 + 1);
          uint64_t v62 = *((void *)v61 + 3);
          *(void *)uint64_t v57 = *((void *)v61 + 4);
          *(void *)uint64_t v59 = *((void *)v61 + 7);
          *uint64_t v60 = v62;
        }
      }
    }

BOOL ctf_recursive(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  v14[0] = a1;
  v14[1] = a3;
  v14[2] = a4;
  __int16 v15 = a5;
  char v16 = 1;
  char __src = 123;
  if ((*(_WORD *)(a3 + 20) & 2) == 0)
  {
    uint64_t v8 = *(unsigned int *)(a3 + 8);
    if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == (_DWORD)v8)
    {
      os_trace_blob_add_slow(a3, &__src, 1uLL);
    }

    else
    {
      *(_BYTE *)(*(void *)a3 + v_Block_object_dispose(va, 8) = 123;
      unsigned int v9 = *(_DWORD *)(a3 + 8) + 1;
      *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v9;
      if (!*(_BYTE *)(a3 + 22)) {
        *(_BYTE *)(*(void *)a3 + v9) = 0;
      }
    }
  }

  int v10 = ctf_member_iter( a1,  a2,  (uint64_t (*)(const char *, void, unint64_t, uint64_t))ctf_member_parse,  (uint64_t)v14);
  char __src = 125;
  if ((*(_WORD *)(a3 + 20) & 2) == 0)
  {
    uint64_t v11 = *(unsigned int *)(a3 + 8);
    if (*(char *)(a3 + 22) + *(_DWORD *)(a3 + 12) - 1 == (_DWORD)v11)
    {
      os_trace_blob_add_slow(a3, &__src, 1uLL);
    }

    else
    {
      *(_BYTE *)(*(void *)a3 + v11) = 125;
      unsigned int v12 = *(_DWORD *)(a3 + 8) + 1;
      *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v12;
      if (!*(_BYTE *)(a3 + 22)) {
        *(_BYTE *)(*(void *)a3 + v12) = 0;
      }
    }
  }

  return v10 == 0;
}

uint64_t ctf_enum(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v10 = ctf_type_size(a1, a2);
  if (v10 > a5)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  switch(v10)
  {
    case 1LL:
      unint64_t v11 = *a4;
      goto LABEL_7;
    case 2LL:
      unint64_t v11 = *(unsigned __int16 *)a4;
      goto LABEL_7;
    case 4LL:
      unint64_t v11 = *(unsigned int *)a4;
      goto LABEL_7;
    case 8LL:
      unint64_t v11 = *(void *)a4;
      if (HIDWORD(v11))
      {
        _os_assumes_log();
        char v27 = v11;
        goto LABEL_16;
      }

BOOL ctf_enum_flag_parse(char *__s, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 & a2) != 0)
  {
    if (!*(_BYTE *)(a3 + 16))
    {
      uint64_t v7 = *(void *)(a3 + 8);
      char __src = 124;
      if ((*(_WORD *)(v7 + 20) & 2) == 0)
      {
        uint64_t v8 = *(unsigned int *)(v7 + 8);
        if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v8)
        {
          os_trace_blob_add_slow(v7, &__src, 1uLL);
        }

        else
        {
          *(_BYTE *)(*(void *)v7 + v_Block_object_dispose(va, 8) = 124;
          unsigned int v9 = *(_DWORD *)(v7 + 8) + 1;
          *(_DWORD *)(v7 + _Block_object_dispose(va, 8) = v9;
          if (!*(_BYTE *)(v7 + 22)) {
            *(_BYTE *)(*(void *)v7 + v9) = 0;
          }
        }
      }
    }

    *(_BYTE *)(a3 + 16) = 0;
    uint64_t v10 = *(void *)(a3 + 8);
    unint64_t v11 = strlen(__s);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      int v12 = v11;
      uint64_t v13 = *(unsigned int *)(v10 + 8);
      if (v11 > (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v13 - 1))
      {
        os_trace_blob_add_slow(v10, __s, v11);
      }

      else
      {
        memcpy((void *)(*(void *)v10 + v13), __s, v11);
        unsigned int v14 = *(_DWORD *)(v10 + 8) + v12;
        *(_DWORD *)(v10 + _Block_object_dispose(va, 8) = v14;
        if (!*(_BYTE *)(v10 + 22)) {
          *(_BYTE *)(*(void *)v10 + v14) = 0;
        }
      }
    }

    int v3 = *(_DWORD *)a3 ^ a2;
    *(_DWORD *)a3 = v3;
  }

  return v3 == 0;
}

uint64_t ctf_member_parse(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v9 = ctf_type_size(*(void *)a4, a2);
  if ((unint64_t)(v9 - 1) >= 0xFFFF)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v4 = v9;
  if (!*(_BYTE *)(a4 + 26))
  {
    uint64_t v16 = *(void *)(a4 + 8);
    if ((*(_WORD *)(v16 + 20) & 2) == 0)
    {
      uint64_t v17 = *(unsigned int *)(v16 + 8);
      *(_WORD *)(*(void *)v16 + v17) = 8236;
      unsigned int v18 = *(_DWORD *)(v16 + 8) + 2;
      *(_DWORD *)(v16 + _Block_object_dispose(va, 8) = v18;
      if (!*(_BYTE *)(v16 + 22)) {
        *(_BYTE *)(*(void *)v16 + v1_Block_object_dispose(va, 8) = 0;
      }
    }
  }

  while (1)
  {
    *(_BYTE *)(a4 + 26) = 0;
    os_trace_blob_addf(*(void *)(a4 + 8), "%s = ", v10, v11, v12, v13, v14, v15, a1);
    uint64_t v19 = *(void *)(a4 + 16);
    uint64_t v20 = v19 + (a3 >> 3);
LABEL_10:
    _os_assert_log();
    uint64_t v16 = _os_crash();
    __break(1u);
LABEL_11:
    os_trace_blob_add_slow(v16, ", ", 2uLL);
  }

  return ctf_type_parse(*(void *)a4, a2, *(void *)(a4 + 8), v20, (unsigned __int16)v4) - 1;
}

LABEL_25:
      [NSString stringWithUTF8String:v17];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_OSLogCatalogFilter containsProcessLookupSubstr:](self, "containsProcessLookupSubstr:", v21))
      {
      }

      else
      {
        [NSString stringWithUTF8String:v17];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = -[_OSLogCatalogFilter containsSenderLookupSubstr:](self, "containsSenderLookupSubstr:", v22);

        if (!v23) {
          goto LABEL_31;
        }
      }

      fts_pathlen = a3->fts_pathlen;
      if (fts_pathlen <= 0x20) {
        goto LABEL_33;
      }
      uint64_t v25 = &a3->fts_path[fts_pathlen];
      int v32 = *(_WORD *)(v25 - 33);
      unint64_t v26 = *(_OWORD *)(v25 - 30);
      *(_OWORD *)&v33[14] = *((_OWORD *)v25 - 1);
      *(_OWORD *)__int16 v33 = v26;
      char v34 = 0;
      if (_convertUUIDStringToUUID((const char *)&v32, v31))
      {
        char v27 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v31];
        -[_OSLogCatalogFilter addUUID:](self, "addUUID:", v27);
      }

  unsigned int v18 = 0LL;
LABEL_26:
  dispatch_source_cancel((dispatch_source_t)v2[1]);
  free(v18);
  if (cf) {
    CFRelease(cf);
  }
}

      objc_autoreleasePoolPop(v38);
      char v35 = readdir(v34);
    }

    *(void *)&v163.st_dev = v36;
    uint64_t v41 = _compact_tracev3(v30, (uint64_t)v26, d_name, &v155, (uint64_t)v153, v27, v28, &v163);
    uint64_t v42 = *(id *)&v163.st_dev;

    if (v41)
    {
      uint64_t v36 = v42;
      goto LABEL_25;
    }

    objc_autoreleasePoolPop(v38);
    uint64_t v47 = 0;
    uint64_t v36 = v42;
LABEL_35:
    if (closedir(v34) == -1)
    {
      __error();
      _os_assumes_log();
    }

LABEL_31:
      if (!v8) {
        goto LABEL_38;
      }
LABEL_37:
      munmap(v8, v30);
      goto LABEL_38;
    }
  }

    *(void *)(a2 + 96) = v21;
    *(void *)(a2 + 104) = v22;
    *(void *)(a2 + 112) = *(void *)(a3 + 16);
  }

      uint64_t v16 = result[5];
      if (!v16 || (uint64_t v17 = *(void *)(v16 + 40)) == 0)
      {
LABEL_43:
        result[7] = 0LL;
        return result;
      }

      unsigned int v18 = (void *)(v17 + 16);
      do
      {
        unsigned int v18 = (void *)*v18;
        if (!v18) {
          goto LABEL_43;
        }
      }

      while (v18[2] != *((void *)a2 + 2));
      uint64_t v19 = v18[4];
      result[7] = v19;
      if (v19) {
        uint64_t v20 = v9 == 0;
      }
      else {
        uint64_t v20 = 1;
      }
      if (!v20)
      {
        uint64_t v21 = *(__int16 *)(v19 + 2);
        if (v21 < 0)
        {
          uint64_t v22 = v21 & 0x7FFF;
          *(_WORD *)(v19 + 2) = v22;
          if (v9 == 4) {
            *(_WORD *)(v19 + 2) = v22 | 1;
          }
        }
      }

      return result;
  }

    char v27 = 0;
    int v28 = 1LL;
    goto LABEL_32;
  }

  __error();
  _os_assumes_log();
  uint64_t v29 = create_repack_error(-1, @"Failed to create tmp file");
LABEL_12:
  char v27 = 0;
  char v30 = (void *)v65[5];
  v65[5] = v29;
LABEL_13:

LABEL_14:
  int v28 = 0LL;
  if (a8) {
    *a8 = (id) v65[5];
  }
LABEL_32:
  if (v17 < 1 || close(v17) != -1) {
    goto LABEL_36;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
LABEL_36:
    if (v27 && unlinkat(a1, "tmp", 0) == -1)
    {
      __error();
      _os_assumes_log();
    }

    _repack_context_cleanup((uint64_t)v55);
    if (munmap(v15, v54) == -1)
    {
      __error();
      _os_assumes_log();
    }

    goto LABEL_41;
  }

  uint64_t result = __error();
  uint64_t v37 = *result;
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v37;
  __break(1u);
  return result;
}

uint64_t _convertUUIDStringToUUID(const char *a1, unsigned __int8 *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (strlen(a1) == 32
    && (*a1 & 0x80000000) == 0
    && (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * *(unsigned __int8 *)a1 + 60) & 0x10000) != 0)
  {
    unint64_t v4 = 0LL;
    while (v4 != 31)
    {
      unint64_t v5 = v4;
      int v6 = a1[v4 + 1];
      if ((v6 & 0x80000000) == 0)
      {
        int v7 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v6 + 60);
        unint64_t v4 = v5 + 1;
        if ((v7 & 0x10000) != 0) {
          continue;
        }
      }

      if (v5 <= 0x1E) {
        goto LABEL_11;
      }
      break;
    }

    snprintf(__str, 0x25uLL, "%.8s-%.4s-%.4s-%.4s-%.12s", a1, a1 + 8, a1 + 12, a1 + 16, a1 + 20);
    uuid_parse(__str, a2);
    return 1LL;
  }

  else
  {
LABEL_11:
    _os_assumes_log();
    return 0LL;
  }

LABEL_26:
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = (uint64_t)result;
  __break(1u);
  return result;
}

LABEL_32:
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C695DD0 = (uint64_t)result;
    __break(1u);
    goto LABEL_33;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

  *(void *)(a2 + 56) = *(void *)a1;
  *(void *)(a2 + 72) = *(void *)(a1 + 8);
  uint64_t v37 = *(void *)a1;
  if (v37 <= 6 && ((1 << v37) & 0x58) != 0) {
    unsigned int v38 = *(void *)a1 << 8;
  }
  else {
    unsigned int v38 = bswap32(*(void *)a1) >> 16;
  }
  *(_DWORD *)a2 = v38;
  if (!v7) {
    return 0LL;
  }
  uint64_t result = 0LL;
  switch(*(_BYTE *)a1)
  {
    case 2:
      char v40 = *(unsigned __int8 *)(a1 + 1);
      if (v40 == 1) {
        return _chunk_support_parse_activity_create(a2, a1, a3);
      }
      if (v40 == 3) {
        return _chunk_support_parse_useraction(a2, a1, a3);
      }
      if (v40 != 2) {
        return 0LL;
      }
      return _chunk_support_parse_activity_swap(a2, a1, a3);
    case 3:
      uint64_t v64 = 0;
      *(_DWORD *)a2 = 768;
      uint64_t v41 = *(_WORD *)(a1 + 2);
      if ((v41 & 1) != 0)
      {
        if (!(*(void *)(a1 + 16) >> 51)) {
          return 0LL;
        }
        uint64_t v64 = 8;
        uint64_t v59 = *(void *)(a1 + 24);
        *(void *)(a2 + 40) = v59;
        *(void *)(a2 + 4_Block_object_dispose(va, 8) = _os_activity_map_find_parent(*(void **)(a3 + 8), v59);
        uint64_t v41 = *(_WORD *)(a1 + 2);
        uint64_t v42 = 16LL;
      }

      else
      {
        uint64_t v42 = 8LL;
      }

      if ((v41 & 0x10) != 0)
      {
        uint64_t v64 = v42;
      }

      uint64_t result = _chunk_support_parse_location(a1, &v64, a2 + 56, a3);
      if ((_DWORD)result)
      {
        uint64_t v60 = v64;
        *(void *)(a2 + 152) = a1 + v64 + 24;
        int v58 = *(unsigned __int16 *)(a1 + 22) - v60;
        goto LABEL_85;
      }

      return result;
    case 4:
      goto LABEL_45;
    case 6:
      *(_DWORD *)a2 = 1536;
LABEL_45:
      uint64_t v63 = 0;
      uint64_t v43 = *(_WORD *)(a1 + 2);
      if ((v43 & 1) != 0)
      {
        if (!(*(void *)(a1 + 16) >> 51)) {
          return 0LL;
        }
        LODWORD(v44) = 8;
        uint64_t v63 = 8;
        uint64_t v46 = *(void *)(a1 + 24);
        *(void *)(a2 + 40) = v46;
        *(void *)(a2 + 4_Block_object_dispose(va, 8) = _os_activity_map_find_parent(*(void **)(a3 + 8), v46);
        uint64_t v43 = *(_WORD *)(a1 + 2);
        if ((v43 & 0x10) == 0) {
          goto LABEL_54;
        }
      }

      else
      {
        LODWORD(v44) = 0;
        if ((v43 & 0x10) == 0) {
          goto LABEL_54;
        }
      }

      uint64_t v44 = (v44 + 8);
      uint64_t v63 = v44;
LABEL_54:
      if ((v43 & 0x100) == 0) {
        goto LABEL_60;
      }
      uint64_t v63 = v44 + 4;
      uint64_t v47 = a1 + v44;
      uint64_t v48 = *(unsigned __int16 *)(v47 + 24);
      uint64_t v49 = *(unsigned __int16 *)(v47 + 26);
      if ((v49 + v48) <= 0x1000)
      {
        uint64_t v50 = *(void *)(a3 + 80);
        if (4096 - v50 <= v48 && (*(_BYTE *)a3 & 0x80) == 0)
        {
          *(void *)(a2 + 16_Block_object_dispose(va, 8) = *(void *)(a3 + 72) + v50 - 4096 + v48;
          *(void *)(a2 + 176) = v49;
        }
      }

uint64_t ___os_log_fdscandir_trace_block_invoke_2(uint64_t a1, const dirent **a2, const dirent **a3)
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

char *___os_log_fdscandir_trace_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = strrchr((const char *)(a2 + 21), 46);
  if (result)
  {
    if ((*(unsigned __int8 *)(a2 + 20) | 8) == 8)
    {
      unint64_t v4 = result;
      if (!strcmp(result, ".tracev3")
        || !strcmp(v4, ".log")
        || !strcmp(v4, ".txt")
        || !strcmp(v4, ".plist")
        || !strcmp(v4, ".timesync"))
      {
        return (char *)1;
      }

      else
      {
        return (char *)(strcmp(v4, ".jsonl") == 0);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void sub_1869A8370( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void _invalidate(void *a1, uint64_t a2, void *a3)
{
  id v8 = a1;
  id v5 = a3;
  [v8 setInvalidated:1];
  [v8 invalidationHandler];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v8 invalidationHandler];
    int v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, uint64_t, id))v7)[2](v7, a2, v5);

    [v8 setInvalidationHandler:0];
  }
}

BOOL _simple_support_validate_chunk(uint64_t a1)
{
  return *(_DWORD *)a1 == 24580 && !*(_DWORD *)(a1 + 4) && *(void *)(a1 + 8) > 0x48uLL;
}

uint64_t _simple_support_validate_payload(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *(void *)(a1 + 8) - 72LL;
  if (v2 < 0xC) {
    return 0LL;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  uint64_t v4 = *(unsigned int *)(a1 + 96);
  unint64_t v5 = v3 + v4 + 12;
  if (v2 < v5
    || !(_DWORD)v4
    || *(_BYTE *)(a1 + 100 + v3 + (v4 - 1))
    || (_DWORD)v3 && *(_BYTE *)(a1 + 100 + (v3 - 1)))
  {
    return 0LL;
  }

  uint64_t result = a1 + 88;
  if (a2) {
    *a2 = v5;
  }
  return result;
}

void logging_support_test_oslog(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    uint64_t v3 = a1;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "LoggingSupportTest: %s",  (uint8_t *)&v2,  0xCu);
  }

void sub_1869A9568( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

uint64_t _os_log_set_nscf_formatter(uint64_t result)
{
  _NSCF_function = result;
  return result;
}

uint64_t _os_log_get_nscf_formatter()
{
  return _NSCF_function;
}

id os_log_fmt_object_for_data(uint64_t a1, int a2, char *a3, unsigned int a4, uint64_t a5)
{
  if (os_log_fmt_object_for_data_onceToken != -1) {
    dispatch_once(&os_log_fmt_object_for_data_onceToken, &__block_literal_global_1652);
  }
  if ((*(_WORD *)(a1 + 8) & 0x10) != 0) {
    uint64_t scalar = os_log_fmt_read_scalar(a1, a3, a4);
  }
  else {
    uint64_t scalar = 0LL;
  }
  switch(*(_BYTE *)(a1 + 10))
  {
    case 1:
      return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithChar:(char)scalar];
    case 2:
      return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedChar:scalar];
    case 3:
      return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithShort:(__int16)scalar];
    case 4:
      return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedShort:(unsigned __int16)scalar];
    case 5:
    case 7:
    case 8:
      goto LABEL_24;
    case 6:
      goto LABEL_15;
    case 9:
      if (a5 == 4)
      {
LABEL_24:
        id result = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithInt:scalar];
      }

      else
      {
        if (a5 == 8) {
          goto LABEL_23;
        }
LABEL_25:
        id result = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithLongLong:scalar];
      }

      break;
    case 0xA:
    case 0xD:
      if (a5 == 4)
      {
LABEL_15:
        id result = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedInt:scalar];
      }

      else if (a5 == 8)
      {
LABEL_23:
        id result = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithLong:scalar];
      }

      else
      {
LABEL_11:
        id result = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedLongLong:scalar];
      }

      break;
    case 0xB:
      goto LABEL_25;
    case 0xC:
      goto LABEL_11;
    case 0xE:
    case 0xF:
      return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithDouble:*(double *)&scalar];
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      if (a2 == 3) {
        return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSData) initWithBytes:a3 length:a4];
      }
      if (a4) {
        return (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSString) initWithBytes:a3 length:a4 - 1 encoding:4];
      }
      return objc_alloc_init((Class)os_log_fmt_object_for_data__NSString);
    default:
      return 0LL;
  }

  return result;
}

Class __os_log_fmt_object_for_data_block_invoke()
{
  os_log_fmt_object_for_data__NSString = (uint64_t)objc_getClass("NSString");
  os_log_fmt_object_for_data__NSNumber = (uint64_t)objc_getClass("NSNumber");
  Class result = objc_getClass("NSData");
  os_log_fmt_object_for_data__NSData = (uint64_t)result;
  return result;
}

unint64_t _os_log_fmt_plugin_annotated( uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, char *a5, unsigned int a6, char a7)
{
  v29[256] = *MEMORY[0x1895F89C0];
  plugin = os_log_fmt_get_plugin(*(const char **)(a3 + 32), *(unsigned __int16 *)(a3 + 14));
  unint64_t v15 = (unint64_t)plugin;
  if (plugin)
  {
    if (plugin[3] && (id v16 = os_log_fmt_object_for_data(a3, *a4 >> 4, a5, a6, a2)) != 0LL)
    {
      uint64_t v17 = v16;
      int v27 = 1;
      char v28 = a7;
      __strlcpy_chk();
      unsigned int v18 = (void *)(*(uint64_t (**)(void *, void *, int *))(v15 + 24))(v29, v17, &v27);
      uint64_t v19 = (void *)[v18 string];
      unint64_t v15 = v19 != 0LL;
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = (char *)[v20 _fastCStringContents:1];
        if (v21)
        {
          os_trace_blob_addns(a1, v21, 0xFFFFFFFFFFFFFFFFLL);
        }

        else
        {
          unint64_t v22 = [v20 lengthOfBytesUsingEncoding:4];
          v29[0] = v22;
          unsigned int v23 = *(_DWORD *)(a1 + 8);
          unint64_t v24 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1;
          if (v22 > v24)
          {
            os_trace_blob_grow(a1, v22);
            unsigned int v23 = *(_DWORD *)(a1 + 8);
            unint64_t v24 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1;
            if (v22 > v24) {
              *(_WORD *)(a1 + 20) |= 2u;
            }
          }

          objc_msgSend( v20,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  *(void *)a1 + v23,  v24,  v29,  4,  1,  0,  objc_msgSend(v20, "length"),  0);
          unsigned int v25 = *(_DWORD *)(a1 + 8) + LODWORD(v29[0]);
          *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v25;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v25) = 0;
          }
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v15;
}

#error "1869AAC4C: call analysis failed (funcsize=19)"
void *os_log_fmt_get_plugin(const char *a1, size_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  int v9;
  void *v10;
  if ((_dyld_dlsym_blocked() & 1) != 0) {
    return 0LL;
  }
  if (qword_18C4AD530 != -1) {
    dispatch_once_f(&qword_18C4AD530, 0LL, (dispatch_function_t)_os_trace_formatters_list);
  }
  uint64_t v4 = qword_18C4AD528;
  if (!qword_18C4AD528) {
    return 0LL;
  }
  unint64_t v5 = 0LL;
  int v6 = _formatters;
  while (1)
  {
    int v7 = (v5 + v4) >> 1;
    id v8 = *(const char **)(v6 + 40 * v7 + 8);
    uint64_t v9 = strncasecmp(a1, v8, a2);
    if (!v9) {
      break;
    }
LABEL_9:
    if (v9 >= 0) {
      unint64_t v5 = v7 + 1;
    }
    else {
      uint64_t v4 = (v5 + v4) >> 1;
    }
    if (v5 >= v4) {
      return 0LL;
    }
  }

  if (v8[a2])
  {
    uint64_t v9 = -v8[a2];
    goto LABEL_9;
  }

  uint64_t v10 = (void *)(v6 + 40 * v7);
  if (*v10 != -1LL) {
    dispatch_once_f( (dispatch_once_t *)(v6 + 40 * v7),  (void *)(v6 + 40 * v7),  (dispatch_function_t)_os_trace_load_formatter);
  }
  return v10;
}

void _os_trace_formatters_list()
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v17 = 0LL;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  uint64_t v0 = getenv("OS_ACTIVITY_FORMATTER");
  if (!v0 || strcmp(v0, "disable"))
  {
    uint64_t v1 = 0LL;
    char v2 = 1;
    do
    {
      char v3 = v2;
      uint64_t v4 = opendir((&plugin_dirs)[2 * v1]);
      unint64_t v5 = v4;
      if (v4)
      {
        for (uint64_t i = readdir(v4); i; uint64_t i = readdir(v5))
        {
          if (i->d_type == 8)
          {
            uint64_t v7 = _os_trace_formatter_record(v18[3], i->d_name, v1, v14 + 3, v10 + 3);
            v18[3] = v7;
          }
        }

        closedir(v5);
      }

      char v2 = 0;
      uint64_t v1 = 1LL;
    }

    while ((v3 & 1) != 0);
    qsort_b((void *)v18[3], v14[3], 0x28uLL, &__block_literal_global_61);
    uint64_t v8 = v14[3];
    _formatters = v18[3];
    qword_18C4AD528 = v8;
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_1869AAF7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

void *_os_trace_load_formatter(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x400uLL, "%sliblog_%s.dylib", (&plugin_dirs)[2 * *(void *)(a1 + 16)], *(const char **)(a1 + 8));
  Class result = dlopen(__str, 6);
  *(void *)(a1 + 16) = result;
  if (result)
  {
    *(void *)(a1 + 24) = dlsym(result, "OSLogCopyFormattedString");
    Class result = dlsym(*(void **)(a1 + 16), "OSStateCreateStringWithData");
    *(void *)(a1 + 32) = result;
  }

  return result;
}

uint64_t _os_trace_formatter_record(uint64_t a1, char *__s1, uint64_t a3, uint64_t *a4, void *a5)
{
  if (!strncmp(__s1, "liblog_", 7uLL) && !strchr(__s1, 47))
  {
    uint64_t v11 = strrchr(__s1, 46);
    if (v11)
    {
      uint64_t v12 = v11;
      if (!strcmp(v11, ".dylib"))
      {
        uint64_t v13 = strndup(__s1 + 7, v12 - (__s1 + 7));
        uint64_t v14 = *a4;
        if (*a4)
        {
          uint64_t v15 = 8LL;
          uint64_t v16 = *a4;
          while (strcasecmp(*(const char **)(a1 + v15), v13))
          {
            v15 += 40LL;
            if (!--v16) {
              goto LABEL_10;
            }
          }

          free(v13);
        }

        else
        {
LABEL_10:
          if (v14 == *a5)
          {
            *a5 = v14 + 8;
            a1 = _os_trace_realloc();
            uint64_t v14 = *a4;
          }

          *a4 = v14 + 1;
          uint64_t v17 = (void *)(a1 + 40 * v14);
          *uint64_t v17 = 0LL;
          v17[1] = v13;
          v17[3] = 0LL;
          v17[4] = 0LL;
          v17[2] = a3;
        }
      }
    }
  }

  return a1;
}

uint64_t ___os_trace_formatters_list_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  char v4 = 0;
  uint64_t v5 = 0LL;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if ((v4 & 1) != 0 || !*(_BYTE *)(v3 + 56))
    {
      size_t v8 = strlen((&plugin_dirs)[2 * v5]);
      uint64_t v9 = *(const char **)(a2 + 40);
      Class result = strncmp(v9, (&plugin_dirs)[2 * v5], v8);
      if (!(_DWORD)result)
      {
        Class result = _os_trace_formatter_record( *(void *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL),  (char *)&v9[v8],  v5,  (uint64_t *)(*(void *)(*(void *)(v3 + 40) + 8LL) + 24LL),  (void *)(*(void *)(*(void *)(v3 + 48) + 8LL) + 24LL));
        *(void *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL) = result;
      }
    }

    char v6 = 0;
    char v4 = 1;
    uint64_t v5 = 1LL;
  }

  while ((v7 & 1) != 0);
  return result;
}

uint64_t ___os_trace_formatters_list_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcasecmp(*(const char **)(a2 + 8), *(const char **)(a3 + 8));
}

id _OSLogGetSimplePredicate(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  uint64_t v11 = -[_OSLogSimplePredicate initWithPredicate:supportedKeys:supportedOperators:supportedCompoundTypes:]( objc_alloc(&OBJC_CLASS____OSLogSimplePredicate),  "initWithPredicate:supportedKeys:supportedOperators:supportedCompoundTypes:",  v10,  v9,  v8,  v7);

  -[_OSLogSimplePredicate predicate](v11, "predicate");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

LABEL_70:
  }
}

uint64_t requiresLogicalExpression(void *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    if ([v2 compoundPredicateType] == 2)
    {
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      objc_msgSend(v2, "subpredicates", 0);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v9;
        while (2)
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v3);
            }
            if ((requiresLogicalExpression(*(void *)(*((void *)&v8 + 1) + 8 * i)) & 1) != 0)
            {
              uint64_t v4 = 1LL;
              goto LABEL_15;
            }
          }

          uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }

LABEL_15:
    }

    else
    {
      uint64_t v4 = 1LL;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

    unsigned int v18 = *(unsigned __int16 *)(a2 + 6);
    uint64_t v13 = 8LL;
    goto LABEL_16;
  }

  uint64_t v12 = v11 < 4;
  uint64_t v13 = 16LL;
  uint64_t v14 = 12LL;
  uint64_t v15 = 8LL;
  if (!v12) {
    uint64_t v15 = 12LL;
  }
  uint64_t v16 = *(unsigned int *)(a2 + v15);
  if (!v12) {
    uint64_t v14 = 16LL;
  }
  Class result = *(unsigned int *)(a2 + v14) | (unint64_t)(v16 << 32);
  if (!v12) {
    uint64_t v13 = 20LL;
  }
  if (a3) {
LABEL_17:
  }
    *a3 = result;
LABEL_18:
  if (a4) {
    *a4 = v13;
  }
  return result;
}

BOOL __ctf_metadata_open_ctf_block_invoke( uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _ctf_open_buffer(a2, a3, a3, a4, a5, a6, a7, a8);
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0LL;
}

uint64_t _ctf_open_buffer( unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a1 != 53233 || *((_BYTE *)a1 + 2) != 4) {
    return 0LL;
  }
  __int128 v10 = ".SUNW_ctf";
  __int128 v11 = xmmword_1869D9170;
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  __int128 v14 = xmmword_1869D9180;
  return ctf_bufopen((uint64_t)&v10, 0LL, 0LL, &v9, a5, a6, a7, a8);
}

void sub_1869AE90C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1869AED54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location, uint64_t a25, uint64_t a26, char a27)
{
}

id _logHandle()
{
  if (_logHandle_onceToken != -1) {
    dispatch_once(&_logHandle_onceToken, &__block_literal_global_193);
  }
  return (id)_logHandle_handle;
}

void ___logHandle_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.loggingsupport", "os_log_statistics");
  id v1 = (void *)_logHandle_handle;
  _logHandle_handle = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy__1985(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1986(uint64_t a1)
{
}

uint64_t _state_support_decode_data(uint64_t a1)
{
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 == 1 && *(_DWORD *)(a1 + 4))
    {
      char v6 = (void *)MEMORY[0x186E40118]();
      id v7 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a1 + 200 length:*(unsigned int *)(a1 + 4) freeWhenDone:0];
      [MEMORY[0x1896079E8] propertyListWithData:v7 options:0 format:0 error:0];
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [v8 description];

      objc_autoreleasePoolPop(v6);
      return v5;
    }

    return 0LL;
  }

  size_t v2 = strlen((const char *)(a1 + 8));
  plugin = os_log_fmt_get_plugin((const char *)(a1 + 8), v2);
  if (!plugin) {
    return 0LL;
  }
  uint64_t v4 = (uint64_t (*)(uint64_t, void, uint64_t))plugin[4];
  if (!v4) {
    return 0LL;
  }
  return v4(a1 + 72, *(unsigned int *)(a1 + 4), a1 + 200);
}

#error "1869AF268: call analysis failed (funcsize=19)"
BOOL _state_support_validate_chunk(uint64_t a1)
{
  return *(_DWORD *)a1 == 24579 && !*(_DWORD *)(a1 + 4) && *(void *)(a1 + 8) > 0x30uLL;
}

uint64_t _state_support_validate_payload(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  return 0LL;
}

_BYTE *_state_support_create_message(uint64_t a1, void *a2)
{
  if (*(_DWORD *)a1 != 24579) {
    return 0LL;
  }
  if (*(_DWORD *)(a1 + 4)) {
    return 0LL;
  }
  unint64_t v3 = *(void *)(a1 + 8);
  BOOL v4 = v3 >= 0xF8;
  unint64_t v5 = v3 - 248;
  uint64_t v9 = (void *)_state_support_decode_data(a1 + 64);
  __int128 v10 = (const void *)(a1 + 200);
  size_t v11 = strnlen((const char *)(a1 + 200), 0x3FuLL);
  uint64_t v12 = [v9 lengthOfBytesUsingEncoding:4];
  if (v11 | v12)
  {
    size_t v13 = v11 + 1;
    uint64_t v14 = (_BYTE *)_os_trace_malloc();
    char v6 = v14;
    if (v11)
    {
      memcpy(v14, v10, v11);
      v6[v11] = 10;
      v6[v13] = 0;
    }

    else
    {
      size_t v13 = 0LL;
    }

    if (v12) {
      [v9 getCString:&v6[v13] maxLength:v12 + 1 encoding:4];
    }
  }

  else
  {
    size_t v13 = 0LL;
    char v6 = 0LL;
  }

  if (a2) {
    *a2 = v13 + v12;
  }

  return v6;
}

id OSLogLogdAdminConnection()
{
  if (OSLogLogdAdminConnection_once != -1) {
    dispatch_once(&OSLogLogdAdminConnection_once, &__block_literal_global_2056);
  }
  return (id)OSLogLogdAdminConnection_xconn;
}

void __OSLogLogdAdminConnection_block_invoke()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0LL, 2uLL);
  uint64_t v1 = (void *)OSLogLogdAdminConnection_xconn;
  OSLogLogdAdminConnection_xconn = (uint64_t)mach_service;

  if (OSLogLogdAdminConnection_xconn)
  {
    xpc_connection_set_event_handler((xpc_connection_t)OSLogLogdAdminConnection_xconn, &__block_literal_global_47);
    xpc_connection_activate((xpc_connection_t)OSLogLogdAdminConnection_xconn);
  }

uint64_t _OSLogFileFindExhaustivePoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  size_t v18 = 0LL;
  unint64_t v5 = (char *)_os_trace_mmap();
  if (!v5) {
    goto LABEL_9;
  }
  size_t v6 = v18;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  size_t v13 = ___OSLogFileFindExhaustivePoint_block_invoke;
  uint64_t v14 = &unk_189F0F688;
  uint64_t v15 = &v19;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  id v7 = v12;
  unint64_t v8 = 0LL;
  do
  {
    if (v6 - v8 < 0x10) {
      break;
    }
    unint64_t v9 = *(void *)&v5[v8 + 8];
    if (v6 - v8 - 16 < v9) {
      break;
    }
    unint64_t v8 = (v8 + v9 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  }

  while (v8 - 1 < v6);

  munmap(v5, v18);
  uint64_t v10 = *((unsigned int *)v20 + 6);
  if ((_DWORD)v10)
  {
    *__error() = v10;
LABEL_9:
    uint64_t v10 = 0xFFFFFFFFLL;
  }

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_1869AF5E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t _OSLogUUIDMapAddFromCatalog(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v4 = MEMORY[0x1895F87A8];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  size_t v9[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke;
  void v9[3] = &__block_descriptor_40_e69_v16__0__catalog_procinfo_s_SSiQII_16C__16C___hashtable___hashtable__8l;
  v9[4] = a2;
  v10[0] = MEMORY[0x1895F87A8];
  uint64_t v5 = *(void *)(a1 + 40);
  v10[1] = 0x40000000LL;
  size_t v11 = ___catalog_for_each_procinfo_block_invoke;
  uint64_t v12 = &unk_189F0DF00;
  size_t v13 = v9;
  if (v5)
  {
    for (uint64_t i = *(void **)(v5 + 16); i; uint64_t i = (void *)*i)
      ((void (*)(void *, void))v11)(v10, i[4]);
  }

  v8[0] = v4;
  v8[1] = 3221225472LL;
  void v8[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke_3;
  v8[3] = &__block_descriptor_40_e15_v24__0Q8_16C_16l;
  v8[4] = a2;
  return _catalog_for_each_uuid(a1, (uint64_t)v8);
}

void _OSLogGenerateXattrs(uint64_t a1, unint64_t a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  unint64_t v9 = ___OSLogGenerateXattrs_block_invoke;
  uint64_t v10 = &__block_descriptor_40_e767_B16__0__tracev3_chunk_s__tracev3_chunk_preamble_s_IIQ_____tracev3_chunk_header_s__mach_timebase_info_II_QqiiiI_tracev3_subchunk_preamble_s_II__tracev3_subchunk_continuous_s_Q__tracev3_subchunk_preamble_s_II__tracev3_subchunk_systeminfo_s_ii_16c__32c___tracev3_subchunk_preamble_s_II__tracev3_subchunk_generation_s__16C_ii__tracev3_subchunk_preamble_s_II__tracev3_subchunk_timezone_s__48c____tracev3_chunk_catalog_s_SSSS_0C___tracev3_chunk_catalog_v2_s_SSSSS_3S_Q_0C___tracev3_chunk_log_preamble_s_QIC_3C___tracev3_chunk_firehose_s_QICC_2C__0C___tracev3_chunk_firehose_old_s_QiCC_0C___tracev3_chunk_oversize_s_QIC_3C_QISS_0C___tracev3_chunk_oversize_old_s_QISS_0C___tracev3_chunk_statedump_s_QIC_3C_QQ_16C__0C___tracev3_chunk_simple_s_QICC_2C_QQQ_16C__16C__0C___0C___8l;
  uint64_t v11 = a3;
  uint64_t v5 = v8;
  unint64_t v6 = 0LL;
  do
  {
    if (a2 - v6 < 0x10) {
      break;
    }
    unint64_t v7 = *(void *)(a1 + v6 + 8);
    if (a2 - v6 - 16 < v7) {
      break;
    }
    unint64_t v6 = (v6 + v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  }

  while (v6 - 1 < a2);
}

uint64_t OSLogCaptureInflightBuffersToFile(int a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = OSLogLogdAdminConnection();
  size_t v13 = (_xpc_connection_s *)v6;
  if (a1 < 0)
  {
    uint64_t v17 = 1LL;
  }

  else
  {
    if (v6)
    {
      int v14 = fstat(a1, &v40);
      if (v14)
      {
        int v15 = 0;
        int v16 = 0;
      }

      else
      {
        int v15 = v40.st_mode & 0xFFF;
        int v14 = fchmod(a1, v40.st_mode & 0xFFD | 2);
        int v16 = v15;
      }

      if (v14 == -1)
      {
        __error();
        _os_assumes_log();
        int v16 = v15;
      }

      xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_fd(v18, "snapshot_file_descriptor", a1);
      xpc_dictionary_set_uint64(v18, "logd_snapshot_flags", a2);
      xpc_dictionary_set_uint64(v18, "operation", 1uLL);
      xpc_object_t v25 = xpc_connection_send_message_with_reply_sync(v13, v18);
      if (v16 && fchmod(a1, v16) == -1)
      {
        __error();
        _os_assumes_log();
        if (v25)
        {
LABEL_13:
          if (MEMORY[0x186E40964](v25) != MEMORY[0x1895F9268])
          {
            int int64 = xpc_dictionary_get_int64(v25, "st");
            int v27 = int64;
            if (int64)
            {
              char v28 = strerror(int64);
              _OSLogWarningMessage(v5, "snapshot failed: %s (%d)", v29, v30, v31, v32, v33, v34, v28);
              uint64_t v17 = 0LL;
              *__error() = v27;
            }

            else
            {
              uint64_t v17 = 1LL;
            }

            goto LABEL_23;
          }

          xpc_object_t v35 = (xpc_object_t)MEMORY[0x1895F9198];
          uint64_t v36 = __error();
          if (v25 == v35)
          {
            uint64_t v17 = 0LL;
            int v37 = 1;
LABEL_22:
            int *v36 = v37;
LABEL_23:

            goto LABEL_24;
          }

LABEL_24:
  return v17;
}

  xpc_dictionary_set_data(v8, "stream_filter", a2, a3);
LABEL_27:
  free(v19);
  free(v18);
  free(v17);
  char v28 = *(_xpc_connection_s **)(a1 + 16);
  if (*(void *)(a1 + 8))
  {
    global_queue = dispatch_get_global_queue(0LL, 0LL);
    v30[0] = v7;
    v30[1] = 0x40000000LL;
    v30[2] = ___os_activity_stream_resume_with_filter_block_invoke_2;
    v30[3] = &__block_descriptor_tmp_43;
    v30[4] = a1;
    xpc_connection_send_message_with_reply(v28, v8, global_queue, v30);
  }

  else
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 16), v8);
  }

  xpc_release(v8);
}

void _OSLogWarningMessage( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v10 = a1;
    vsnprintf(__str, 0x100uLL, a2, &a9);
    v10[2](v10, __str);
  }

uint64_t OSLogCreateArchive(const char *a1, uint64_t a2, int64_t a3, BOOL a4, void *a5)
{
  id v9 = a5;
  _InitArchiveDictionary(a1, a2, a3, a4);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t ArchiveWithDictionary = OSLogCreateArchiveWithDictionary(v10, v9);

  return ArchiveWithDictionary;
}

id _InitArchiveDictionary(const char *a1, uint64_t a2, int64_t a3, BOOL a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v8, "path", a1);
  if (a2) {
    xpc_dictionary_set_uint64(v8, "base_size", a2);
  }
  xpc_dictionary_set_int64(v8, "base_time", a3);
  xpc_dictionary_set_BOOL(v8, "livedata", a4);
  return v8;
}

uint64_t OSLogCreateArchiveWithDictionary(void *a1, void *a2)
{
  v74[5] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v3, "path");
  if (string) {
    uint64_t v6 = string;
  }
  else {
    uint64_t v6 = ".";
  }
  uint64_t v72 = 0LL;
  if (strcasestr(v6, ".logarchive"))
  {
    uint64_t v7 = strdup(v6);
    uint64_t v72 = v7;
  }

  else
  {
    asprintf(&v72, "%s/system_logs.logarchive", v6);
    uint64_t v7 = v72;
  }

  int v8 = mkdir(v7, 0x1FFu);
  char v9 = (char)v72;
  if (v8)
  {
    uint64_t v10 = __error();
    strerror(*v10);
    __error();
    _OSLogWarningMessage(v4, "failed to create directory: %s: %s (%d)", v11, v12, v13, v14, v15, v16, v9);
LABEL_9:
    free(v72);
    uint64_t v17 = *__error();
LABEL_70:

    return v17;
  }

  int v18 = open(v72, 0);
  if (v18 == -1)
  {
    char v21 = (char)v72;
    uint64_t v22 = __error();
    strerror(*v22);
    __error();
    _OSLogWarningMessage(v4, "failed to open directory: %s: %s (%d)", v23, v24, v25, v26, v27, v28, v21);
    goto LABEL_9;
  }

  int v19 = v18;
  else {
    uint64_t int64 = xpc_dictionary_get_int64(v3, "base_time");
  }
  else {
    uuint64_t int64 = xpc_dictionary_get_uint64(v3, "ttl_time");
  }
  else {
    uint64_t v30 = xpc_dictionary_get_uint64(v3, "sp_time");
  }
  if ((uint64_t)xpc_dictionary_get_uint64(v3, "hv_time") <= 0)
  {
    else {
      uint64_t v33 = int64;
    }
    if (v30) {
      uint64_t v34 = v30;
    }
    else {
      uint64_t v34 = int64;
    }
  }

  else
  {
    uint64_t v31 = xpc_dictionary_get_uint64(v3, "hv_time");
    uint64_t v32 = v31;
    else {
      uint64_t v33 = int64;
    }
    if (v30) {
      uint64_t v34 = v30;
    }
    else {
      uint64_t v34 = int64;
    }
    if (v31)
    {
      goto LABEL_38;
    }
  }

  uint64_t v32 = int64;
LABEL_38:
  else {
    uint64_t int64 = xpc_dictionary_get_uint64(v3, "base_time");
  }
LABEL_41:
  xpc_dictionary_get_value(v3, "livedata");
  xpc_object_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = &unk_189F1D3A0;
  if (v35 && !xpc_dictionary_get_BOOL(v3, "livedata")) {
    uint64_t v36 = &unk_189F1D3B8;
  }

  v73[0] = _OSLogConstructPersistStart;
  [MEMORY[0x189607968] numberWithLong:int64];
  int v37 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v37;
  v73[1] = _OSLogConstructSpecialStart;
  [MEMORY[0x189607968] numberWithLong:v33];
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v38;
  v73[2] = _OSLogConstructSignpostStart;
  [MEMORY[0x189607968] numberWithLong:v34];
  char v39 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v39;
  v73[3] = _OSLogConstructHighVolumeStart;
  [MEMORY[0x189607968] numberWithLong:v32];
  stat v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = @"_OSLogConstructSkipMemoryStores";
  v74[3] = v40;
  v74[4] = v36;
  [MEMORY[0x189603F68] dictionaryWithObjects:v74 forKeys:v73 count:5];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)[v41 mutableCopy];

  xpc_dictionary_get_value(v3, "base_size");
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    uint64_t v44 = xpc_dictionary_get_uint64(v3, "base_size");
    [MEMORY[0x189607968] numberWithLong:v44];
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 setObject:v45 forKeyedSubscript:OSLogConstructPersistSizeLimit];
  }

  else
  {
    uint64_t v44 = -1LL;
  }

  xpc_dictionary_get_value(v3, "ttl_size");
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    uint64_t v47 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "ttl_size"));
  }

  else
  {
    if (v44 == -1LL) {
      goto LABEL_52;
    }
    uint64_t v47 = [MEMORY[0x189607968] numberWithLong:v44];
  }

  uint64_t v48 = (void *)v47;
  [v42 setObject:v47 forKeyedSubscript:OSLogConstructSpecialSizeLimit];

LABEL_52:
  xpc_dictionary_get_value(v3, "sp_size");
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    uint64_t v50 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "sp_size"));
  }

  else
  {
    if (v44 == -1LL) {
      goto LABEL_57;
    }
    uint64_t v50 = [MEMORY[0x189607968] numberWithLong:v44];
  }

  size_t v51 = (void *)v50;
  [v42 setObject:v50 forKeyedSubscript:OSLogConstructSignpostSizeLimit];

LABEL_57:
  xpc_dictionary_get_value(v3, "hv_size");
  int v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    uint64_t v53 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", xpc_dictionary_get_uint64(v3, "hv_size"));
  }

  else
  {
    if (v44 == -1LL) {
      goto LABEL_62;
    }
    uint64_t v53 = [MEMORY[0x189607968] numberWithLong:v44];
  }

  uint64_t v54 = (void *)v53;
  [v42 setObject:v53 forKeyedSubscript:OSLogConstructHighVolumeSizeLimit];

LABEL_62:
  size_t v55 = xpc_dictionary_get_string(v3, "predicate");
  if (v55)
  {
    [NSString stringWithUTF8String:v55];
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 setObject:v56 forKeyedSubscript:@"OSLogConstructPredicate"];

    [NSString stringWithUTF8String:v72];
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 setObject:v57 forKeyedSubscript:@"OSLogConstructTargetDir"];
  }

  free(v72);
  int v58 = getenv("SUDO_UID");
  uint64_t v59 = getenv("SUDO_GID");
  int v60 = 0;
  if (v58)
  {
    uint64_t v61 = v59;
    int v62 = 0;
    if (v59)
    {
      int v60 = strtoul(v58, 0LL, 10);
      int v62 = strtoul(v61, 0LL, 10);
    }
  }

  else
  {
    int v62 = 0;
  }

  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __OSLogCreateArchiveWithDictionary_block_invoke;
  aBlock[3] = &unk_189F0F730;
  id v63 = v4;
  id v68 = v63;
  int v69 = v19;
  int v70 = v60;
  int v71 = v62;
  uint64_t v64 = _Block_copy(aBlock);
  uint64_t v17 = OSLogConstructArchive(v42, v63, v64);
  if (close(v19) != -1) {
    goto LABEL_69;
  }
  int v66 = *__error();
  uint64_t result = *__error();
  if (v66 != 9)
  {
    _os_assumes_log();
LABEL_69:

    goto LABEL_70;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

uint64_t __OSLogCreateArchiveWithDictionary_block_invoke(uint64_t a1, int a2, const char *a3)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  if (fstat(a2, &v60))
  {
    uint64_t v6 = *__error();
    if (fcntl(a2, 50, v61) == -1)
    {
      __error();
      _os_assumes_log();
    }

    uint64_t v7 = *(void **)(a1 + 32);
    strerror(v6);
    _OSLogWarningMessage(v7, "unable to stat temp fd: %s: %s (%d)", v8, v9, v10, v11, v12, v13, (char)v61);
    return v6;
  }

  if (!strcmp(a3, "."))
  {
    if (fcopyfile(a2, *(_DWORD *)(a1 + 40), 0LL, 4u))
    {
      uint64_t v24 = *(void **)(a1 + 32);
      uint64_t v25 = __error();
      char v26 = strerror(*v25);
      __error();
      _OSLogWarningMessage(v24, "failed to copyfile on root node: %s (%d)", v27, v28, v29, v30, v31, v32, v26);
      return *__error();
    }

    goto LABEL_16;
  }

  int v14 = *(_DWORD *)(a1 + 40);
  if ((v60.st_mode & 0xF000) != 0x4000)
  {
    int v33 = openat(v14, a3, 2562, 420LL);
    if (v33 == -1) {
      goto LABEL_24;
    }
    int v34 = v33;
    if (!fcopyfile(a2, v33, 0LL, 0xEu))
    {
      if (*(void *)(a1 + 44) && fchown(v34, *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) == -1)
      {
        __error();
        _os_assumes_log();
      }

      if (close(v34) != -1) {
        return 0LL;
      }
      int v56 = *__error();
      uint64_t v57 = *__error();
      if (v56 == 9)
      {
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = v57;
        __break(1u);
LABEL_33:
        if (*(void *)(a1 + 44) && fchown(v34, *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48)) == -1)
        {
          __error();
          _os_assumes_log();
        }

        if (close(v34) != -1) {
          return 0LL;
        }
        int v58 = *__error();
        uint64_t result = *__error();
        if (v58 == 9) {
          goto LABEL_42;
        }
      }

uint64_t OSLogConstructArchive(void *a1, void *a2, void *a3)
{
  uint64_t v447 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v382 = a2;
  id v381 = a3;
  [v5 objectForKey:@"OSLogConstructPredicate"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v378 = v5;
  [v5 objectForKey:@"OSLogConstructTargetDir"];
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v431 = 0u;
  __int128 v432 = 0u;
  __int128 v429 = 0u;
  __int128 v430 = 0u;
  __int128 v427 = 0u;
  __int128 v428 = 0u;
  v423 = 0LL;
  unint64_t v7 = 0x189607000LL;
  __int128 v421 = 0u;
  __int128 v422 = 0u;
  if (v6) {
    goto LABEL_44;
  }
  id v395 = v382;
  int is_development_build = _os_trace_is_development_build();
  [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v439 = v9;
  if (is_development_build)
  {
    [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v440 = v10;
    [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v441 = v11;
    [MEMORY[0x189603F18] arrayWithObjects:&v439 count:3];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v440 = v10;
    [MEMORY[0x189603F18] arrayWithObjects:&v439 count:2];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  __int128 v437 = 0u;
  __int128 v438 = 0u;
  __int128 v435 = 0u;
  __int128 v436 = 0u;
  obuint64_t j = v12;
  uint64_t v400 = [obj countByEnumeratingWithState:&v435 objects:v434 count:16];
  if (v400)
  {
    uint64_t v397 = *(void *)v436;
    v393 = (void *)*MEMORY[0x189607460];
    key = (void *)*MEMORY[0x189604B60];
LABEL_7:
    uint64_t v412 = 0LL;
    while (1)
    {
      if (*(void *)v436 != v397) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v435 + 1) + 8 * v412);
      int v14 = (void *)MEMORY[0x189604030];
      v433[0] = v13;
      v433[1] = @"com.apple.LoggingSupport.collect_override.plist";
      [MEMORY[0x189603F18] arrayWithObjects:v433 count:2];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 fileURLWithPathComponents:v15];
      v409 = (void *)objc_claimAutoreleasedReturnValue();

      id v424 = 0LL;
      [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v409 error:&v424];
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v424;
      v406 = v16;
      if (!v16)
      {
        id v416 = v395;
        id v391 = v403;
        [v391 valueForKeyPath:@"Events"];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        v389 = v24;
        if (v24)
        {
          uint64_t v25 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
          char v26 = v25;
          if (v25)
          {
            CFDictionaryGetValue(v25, key);
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            CFRelease(v26);
            __int128 v444 = 0u;
            __int128 v445 = 0u;
            __int128 v442 = 0u;
            __int128 v443 = 0u;
            id v27 = v24;
            id v28 = 0LL;
            uint64_t v29 = [v27 countByEnumeratingWithState:&v442 objects:buf count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v443;
              do
              {
                for (uint64_t i = 0LL; i != v29; ++i)
                {
                  if (*(void *)v443 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void **)(*((void *)&v442 + 1) + 8 * i);
                  [v32 valueForKeyPath:@"Predicates"];
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v39)
                  {
                    [v32 valueForKeyPath:@"Builds"];
                    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v46)
                    {
                      char v377 = (char)v414;
                      [MEMORY[0x1896079C8] predicateWithFormat:@"SELF MATCHES %@"];
                      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                      [v46 filteredArrayUsingPredicate:v47];
                      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
                      if ([v48 count])
                      {
                        if (v28)
                        {
                          char v377 = (char)v28;
                          uint64_t v49 = [NSString stringWithFormat:@"%@ && %@"];

                          id v28 = (id)v49;
                        }

                        else
                        {
                          id v28 = v39;
                        }
                      }
                    }

                    else
                    {
                    }
                  }

                  else
                  {
                    _OSLogWarningMessage( v416,  "Unable to find local predicates. Please make sure you use the 'Predicates' key.",  v33,  v34,  v35,  v36,  v37,  v38,  v377);
                  }
                }

                uint64_t v29 = [v27 countByEnumeratingWithState:&v442 objects:buf count:16];
              }

              while (v29);
            }

LABEL_38:
            id v6 = v28;

            if (v6)
            {

              goto LABEL_43;
            }

            goto LABEL_39;
          }

          char v59 = "Unable to identify build version. Quitting";
        }

        else
        {
          char v59 = "Unable to find local events. Please make sure you use the 'Events' key";
        }

        _OSLogWarningMessage(v416, v59, v18, v19, v20, v21, v22, v23, v377);
        v414 = 0LL;
        id v28 = 0LL;
        goto LABEL_38;
      }

      [v16 domain];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 != v393) {
        break;
      }
      BOOL v50 = [v406 code] == 260;

      if (!v50) {
        goto LABEL_34;
      }
LABEL_39:

      if (++v412 == v400)
      {
        uint64_t v400 = [obj countByEnumeratingWithState:&v435 objects:v434 count:16];
        if (v400) {
          goto LABEL_7;
        }
        goto LABEL_41;
      }
    }

LABEL_34:
    char v51 = [v13 UTF8String];
    id v52 = [v406 description];
    [v52 UTF8String];
    _OSLogWarningMessage(v395, "Unable to read plist %s: %s", v53, v54, v55, v56, v57, v58, v51);

    goto LABEL_39;
  }

LABEL_234:
              if (keya)
              {
                _os_trace_uuid_map_destroy(*(void ***)keya);
                free(keya);
              }

              v255 = obja;
              if (impl)
              {
                _os_trace_uuid_map_destroy(*(void ***)impl);
                free(impl);
              }

              if (v405)
              {
                _os_trace_uuid_map_destroy(*(void ***)v405);
                free(v405);
              }

              if (v402)
              {
                _os_trace_uuid_map_destroy(*(void ***)v402);
                free(v402);
              }

              if (v408)
              {
                _os_trace_uuid_map_destroy(*(void ***)v408);
                free(v408);
              }

              goto LABEL_244;
            }

            v256 = __error();
            char v257 = strerror(*v256);
            __error();
            _OSLogWarningMessage( v396,  "failed to create LiveData temp file: %s (%d)",  v258,  v259,  v260,  v261,  v262,  v263,  v257);
            v244 = 0LL;
            v254 = 0LL;
            id v411 = 0LL;
            v255 = 0LL;
            uint64_t v153 = *__error();
LABEL_244:
            _timesync_db_close((int *)v392);
            _os_trace_uuid_map_destroy((void **)v69);
            if (v255 && fclose(v255) == -1)
            {
              __error();
              _os_assumes_log();
            }

            if (v411) {
              [v411 _unmake];
            }
            goto LABEL_187;
          }

          int v219 = *__error();
          uint64_t result = *__error();
          if (v219 != 9)
          {
            _os_assumes_log();
            goto LABEL_151;
          }

          qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_18C695DD0 = result;
          __break(1u);
          goto LABEL_250;
        }

        _OSLogWarningMessage(v182, "failed to open timesync database", v202, v203, v204, v205, v206, v207, v377);
        uint64_t v153 = 2LL;
LABEL_186:
        _os_trace_uuid_map_destroy((void **)v69);
        v244 = 0LL;
        v254 = 0LL;
LABEL_187:
        -[_OSLogCollectionReference close](v125, "close");

        return v153;
      }
    }

    else
    {
    }

    _OSLogWarningMessage(v182, "failed to read version.plist", v188, v189, v190, v191, v192, v193, v377);
    v152 = 0LL;
    uint64_t v153 = *__error();
    goto LABEL_186;
  }

  int v146 = *__error();
  uint64_t v168 = *__error();
  if (v146 != 9)
  {
LABEL_136:
    _os_assumes_log();
    goto LABEL_137;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v168;
  __break(1u);
LABEL_131:
  v169 = __error();
  strerror(*v169);
  __error();
  _OSLogWarningMessage(v124, "failed to open: %s: %s (%d)", v170, v171, v172, v173, v174, v175, v146);
  if (close(v143) == -1)
  {
    int v176 = *__error();
    uint64_t result = *__error();
    if (v176 == 9)
    {
LABEL_253:
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = result;
      __break(1u);
      goto LABEL_254;
    }

    _os_assumes_log();
  }

  if (close(v145) != -1) {
    goto LABEL_137;
  }
  int v177 = *__error();
  uint64_t result = *__error();
  if (v177 != 9) {
    goto LABEL_136;
  }
LABEL_254:
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

void sub_1869B27F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, void *a37)
{
}

uint64_t _OSLogCreateTempDirectory(void *a1, mode_t a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  if (issetugid()) {
    id v4 = 0LL;
  }
  else {
    id v4 = getenv("TMPDIR");
  }
  id v5 = "/tmp";
  if (v4) {
    id v5 = v4;
  }
  snprintf(__str, 0x400uLL, "%s/oslogarchive.XXXXXX", v5);
  if (!mkdtemp(__str))
  {
    int v17 = *__error();
    uint64_t v18 = __error();
    strerror(*v18);
    _OSLogWarningMessage(v3, "failed to create temporary directory: %d (%s)", v19, v20, v21, v22, v23, v24, v17);
    goto LABEL_16;
  }

  uint64_t v6 = open(__str, 2048);
  if ((_DWORD)v6 == -1)
  {
    __error();
    uint64_t v25 = __error();
    strerror(*v25);
    _OSLogWarningMessage( v3,  "failed to open temporary directory: %s (%d - %s)",  v26,  v27,  v28,  v29,  v30,  v31,  (char)__str);
    goto LABEL_16;
  }

  uint64_t v7 = v6;
  if (rmdir(__str) == -1)
  {
    __error();
    _os_assumes_log();
  }

  if (!fchmod(v7, a2)) {
    goto LABEL_17;
  }
  uint64_t v8 = __error();
  strerror(*v8);
  __error();
  _OSLogWarningMessage(v3, "failed to set permissions: %s: %s (%d)", v9, v10, v11, v12, v13, v14, (char)__str);
  if (close(v7) != -1)
  {
LABEL_16:
    uint64_t v7 = 0xFFFFFFFFLL;
LABEL_17:

    return v7;
  }

  int v15 = *__error();
  uint64_t result = *__error();
  if (v15 != 9)
  {
    _os_assumes_log();
    __error();
    _os_assumes_log();
    goto LABEL_16;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

uint64_t OSLogStateCaptureForAllPIDs(void *a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  *(_OWORD *)uint64_t v27 = xmmword_1869D91A0;
  size_t v26 = 0LL;
  uint64_t v2 = sysctl(v27, 4u, 0LL, &v26, 0LL, 0LL);
  if ((_DWORD)v2)
  {
    uint64_t v9 = v2;
    _OSLogWarningMessage(v1, "Failed to get process list length", v3, v4, v5, v6, v7, v8, v25);
  }

  else
  {
    uint64_t v10 = (_DWORD *)_os_trace_malloc();
    uint64_t v9 = sysctl(v27, 4u, v10, &v26, 0LL, 0LL);
    if ((_DWORD)v9)
    {
      _OSLogWarningMessage(v1, "Failed to get process list", v11, v12, v13, v14, v15, v16, v25);
      int v17 = 0LL;
    }

    else
    {
      size_t v18 = v26;
      size_t v19 = v26 / 0x288;
      uint64_t v20 = _os_trace_calloc();
      int v17 = (void *)v20;
      if (v18 >= 0x288)
      {
        if (v19 <= 1) {
          uint64_t v21 = 1LL;
        }
        else {
          uint64_t v21 = v19;
        }
        uint64_t v22 = v10 + 10;
        uint64_t v23 = (_DWORD *)v20;
        do
        {
          *v23++ = *v22;
          v22 += 162;
          --v21;
        }

        while (v21);
      }

      _os_state_request_for_pidlist();
      usleep(0x16E360u);
    }

    free(v10);
    free(v17);
  }

  return v9;
}

uint64_t _OSLogCopyTraceFile( uint64_t a1, uint64_t a2, void **a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10)
{
  uint64_t v163 = *MEMORY[0x1895F89C0];
  id v124 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  uint64_t v17 = _os_trace_mmap();
  size_t v18 = (_DWORD *)v17;
  if (v17)
  {
    if (*(_DWORD *)v17 == 4096 && *(void *)(v17 + 8) > 0x27uLL)
    {
      uint64_t v19 = _os_trace_uuid_map_lookup(*a3, (void *)(v17 + 144));
      if (!v19)
      {
        uint64_t v31 = 0LL;
LABEL_14:
        if (munmap(v18, 0LL) == -1)
        {
          __error();
          _os_assumes_log();
        }

        goto LABEL_21;
      }

      unint64_t v20 = v19;
      uint64_t v21 = tmpfile();
      if (v21)
      {
        uint64_t v22 = v21;
        unsigned int fd = fileno(v21);
        uint64_t v117 = v22;
        if (v15)
        {
          [NSString stringWithUTF8String:a2];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 lastPathComponent];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

          id v118 = v24;
          id v114 = v14;
          id v25 = v15;
          id v112 = v16;
          size_t v143 = 0LL;
          char v144 = &v143;
          uint64_t v145 = 0x3032000000LL;
          int v146 = __Block_byref_object_copy__2182;
          uint64_t v147 = __Block_byref_object_dispose__2183;
          id v148 = 0LL;
          v141[0] = 0LL;
          v141[1] = v141;
          v141[2] = 0x3032000000LL;
          v141[3] = __Block_byref_object_copy__2182;
          v141[4] = __Block_byref_object_dispose__2183;
          id v111 = v25;
          id v142 = v111;
          v139[0] = 0LL;
          v139[1] = v139;
          v139[2] = 0x2020000000LL;
          char v140 = 0;
          uint64_t v161 = 0LL;
          uint64_t v160 = 0LL;
          __int128 v158 = 0u;
          __int128 v159 = 0u;
          __int128 v156 = 0u;
          __int128 v157 = 0u;
          __int128 v154 = 0u;
          __int128 v155 = 0u;
          __int128 v152 = 0u;
          __int128 v153 = 0u;
          __int128 v150 = 0u;
          __int128 v151 = 0u;
          *(void *)&__int128 value = 0LL;
          uint64_t v162 = a10;
          *((void *)&value + 1) = -1LL;
          DWORD1(v157) = 0x10000;
          *((void *)&v156 + 1) = _os_trace_malloc();
          *((void *)&v158 + 1) = 0LL;
          *(void *)&__int128 v159 = v18;
          LODWORD(v160) = fd;
          uint64_t v26 = MEMORY[0x1895F87A8];
          aBlock[0] = MEMORY[0x1895F87A8];
          aBlock[1] = 3221225472LL;
          aBlock[2] = ___OSLogCopyTraceFile_implWithRepack_block_invoke;
          aBlock[3] = &unk_189F0F7A8;
          void aBlock[4] = v141;
          aBlock[5] = &value;
          uint64_t v27 = _Block_copy(aBlock);
          uint64_t v28 = (void *)*((void *)&v157 + 1);
          *((void *)&v157 + 1) = v27;

          uint64_t v126 = v26;
          uint64_t v127 = 3221225472LL;
          uint64_t v128 = (uint64_t)___OSLogCopyTraceFile_implWithRepack_block_invoke_2;
          uint64_t v129 = &unk_189F0F7D0;
          char v135 = v18;
          p___int128 value = &value;
          v133 = &v143;
          id v115 = v114;
          id v132 = v115;
          v134 = v139;
          id v113 = v112;
          id v130 = v113;
          id v119 = v118;
          id v131 = v119;
          uint64_t v137 = a3;

          if (*((void *)&v150 + 1)
            && (uint64_t v29 = (id *)(v144 + 5),
                obuint64_t j = (id)v144[5],
                char v30 = _repack_ttl_compact_close_catalog((uint64_t)&value, &obj),
                objc_storeStrong(v29, obj),
                (v30 & 1) == 0))
          {
            [(id)v144[5] userInfo];
            size_t v78 = (void *)objc_claimAutoreleasedReturnValue();
            id v79 = [v78 description];
            char v80 = [v79 UTF8String];
            _OSLogWarningMessage(v115, "failed to close catalog: %s", v81, v82, v83, v84, v85, v86, v80);

            uint64_t v31 = 0LL;
          }

          else
          {
            uint64_t v31 = v161;
          }

          _repack_context_cleanup((uint64_t)&value);

          _Block_object_dispose(v139, 8);
          _Block_object_dispose(v141, 8);

          _Block_object_dispose(&v143, 8);
        }

        else
        {
          uint64_t v54 = *(void *)(a10 + 16);
          uint64_t v55 = (uint64_t (**)(id, uint64_t, void))v124;
          id v56 = v14;
          uint64_t v126 = 0LL;
          uint64_t v127 = (uint64_t)&v126;
          uint64_t v128 = 0x2020000000LL;
          uint64_t v129 = 0LL;
          v116 = v56;
          if (v20 <= 1 && v18[1] > 0x10u)
          {
            *(void *)&__int128 value = MEMORY[0x1895F87A8];
            *((void *)&value + 1) = 3221225472LL;
            *(void *)&__int128 v150 = ___OSLogCopyTraceFile_impl_block_invoke;
            *((void *)&v150 + 1) = &unk_189F0F780;
            __int128 v152 = (unint64_t)a3;
            *(void *)&__int128 v153 = v18;
            *((void *)&v153 + 1) = v18;
            *(void *)&__int128 v154 = v54;
            id v87 = v56;
            *((void *)&v154 + 1) = a2;
            *(void *)&__int128 v155 = __PAIR64__(fd, a1);
            *(void *)&__int128 v151 = v87;
            *((void *)&v151 + 1) = &v126;

            uint64_t v31 = *(void *)(v127 + 24);
          }

          else
          {
            int v57 = _OSLogUUIDMapAddFromFile((uint64_t)v18, 0LL, v54, v56);
            if (v57)
            {
              if (fcntl(a1, 50, &value) == -1)
              {
                __error();
                _os_assumes_log();
              }

              strerror(v57);
              _OSLogWarningMessage( v116,  "failed to index uuids: '%s' to '%s': %s (%d)",  v58,  v59,  v60,  v61,  v62,  v63,  (char)&value);
            }

            *(void *)(v127 + 24) = 0LL;
            if (_OSLogFileFindExhaustivePoint(a1, a4, a5) && *__error() != 2)
            {
              int v64 = *__error();
              if (fcntl(a1, 50, &value) == -1)
              {
                __error();
                _os_assumes_log();
              }

              strerror(v64);
              _OSLogWarningMessage( v116,  "failed to find sparse boundary: %s: %s (%d)",  v65,  v66,  v67,  v68,  v69,  v70,  (char)&value);
              *(void *)(v127 + 24) = 0LL;
            }

            if (*(void *)(v127 + 24))
            {
              if (lseek(a1, 0LL, 0) == -1)
              {
                __error();
                _os_assumes_log();
              }

              int v71 = v55[2](v55, a1, a2);
              if (v71)
              {
                if (fcntl(a1, 50, &value) == -1)
                {
                  __error();
                  _os_assumes_log();
                }

                strerror(v71);
                _OSLogWarningMessage( v116,  "failed copy: '%s' to '%s': %s (%d)",  v72,  v73,  v74,  v75,  v76,  v77,  (char)&value);
                uint64_t v31 = -1LL;
                *(void *)(v127 + 24) = -1LL;
              }

              else
              {
                uint64_t v31 = *(void *)(v127 + 24);
              }
            }

            else
            {
              uint64_t v31 = 0LL;
            }
          }

          _Block_object_dispose(&v126, 8);
        }

        if ((v31 & 0x8000000000000000LL) == 0 && lseek(fd, 0LL, 2) >= 1)
        {
          if (_OSLogFileFindExhaustivePoint(fd, a4, a5) && *__error() != 2)
          {
            int v88 = *__error();
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }

            strerror(v88);
            _OSLogWarningMessage( v14,  "failed to find sparse boundary: %s: %s (%d)",  v89,  v90,  v91,  v92,  v93,  v94,  (char)&value);
            uint64_t v31 = -1LL;
          }

          uint64_t v95 = _os_trace_mmap();
          v96 = (void *)v95;
          if (v95)
          {
            __int128 value = 0u;
            *(void *)&__int128 v150 = 0LL;
            LODWORD(value) = 1;
            *((void *)&v150 + 1) = -1LL;
            *(void *)&__int128 v151 = 0LL;
            _OSLogGenerateXattrs(v95, v143, (uint64_t)&value);
            if (munmap(v96, v143) == -1)
            {
              __error();
              _os_assumes_log();
            }

            if (fsetxattr(fd, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
          }

          if (fcopyfile(a1, fd, 0LL, 2u))
          {
            int v97 = *__error();
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }

            strerror(v97);
            _OSLogWarningMessage( v14,  "fcopyfile (stat only): '%s' to '%s': %s (%d)",  v98,  v99,  v100,  v101,  v102,  v103,  (char)&value);
            uint64_t v31 = -1LL;
          }

          if (lseek(fd, 0LL, 0) == -1)
          {
            __error();
            _os_assumes_log();
          }

          int v104 = (*((uint64_t (**)(id, void, uint64_t))v124 + 2))(v124, fd, a2);
          if (v104)
          {
            if (fcntl(a1, 50, &value) == -1)
            {
              __error();
              _os_assumes_log();
            }

            strerror(v104);
            _OSLogWarningMessage( v14,  "copy handler failed: '%s' to '%s': %s (%d)",  v105,  v106,  v107,  v108,  v109,  v110,  (char)&value);
            uint64_t v31 = -1LL;
          }
        }

        if (fclose(v117) == -1)
        {
          __error();
          _os_assumes_log();
        }

        goto LABEL_14;
      }

      uint64_t v46 = __error();
      char v47 = strerror(*v46);
      __error();
      _OSLogWarningMessage(v14, "failed to create tmpfile: %s (%d)", v48, v49, v50, v51, v52, v53, v47);
    }

    else
    {
      if (fcntl(a1, 50, &value) == -1)
      {
        __error();
        _os_assumes_log();
      }

      _OSLogWarningMessage(v14, "File started with invalid header: '%s'", v32, v33, v34, v35, v36, v37, (char)&value);
    }

    uint64_t v31 = -1LL;
    goto LABEL_14;
  }

  int v38 = *__error();
  if (v38 == 34)
  {
    uint64_t v31 = 0LL;
  }

  else
  {
    if (fcntl(a1, 50, &value) == -1)
    {
      __error();
      _os_assumes_log();
    }

    strerror(v38);
    _OSLogWarningMessage(v14, "could not mmap(): %s: %s (%d)", v39, v40, v41, v42, v43, v44, (char)&value);
    uint64_t v31 = -1LL;
  }

void sub_1869B36A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

int *_OSLogCopyBook( int a1, const char *a2, uint64_t a3, char *a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  uint64_t v60 = 0LL;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  int v63 = 0;
  if (!a3) {
    goto LABEL_14;
  }
  int v20 = openat(a1, a2, 0);
  if (v20 == -1)
  {
    int v29 = *__error();
    *((_DWORD *)v61 + 6) = v29;
    if (v29 != 2)
    {
      strerror(v29);
      _OSLogWarningMessage(v19, "failed to open '%s': %s", v31, v32, v33, v34, v35, v36, (char)a2);
      goto LABEL_19;
    }

LABEL_34:
  uint64_t result = __error();
  uint64_t v42 = *result;
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v42;
  __break(1u);
  return result;
}

      uint64_t v28 = &v43;
LABEL_35:
      uint64_t v30 = (const char *)&_CTF_NULLSTR;
      if (v18 < *(void *)(a4 + 32)) {
        uint64_t v30 = (const char *)(*(void *)(a4 + 24) + v18);
      }
      if (!v18) {
        goto LABEL_50;
      }
      uint64_t v31 = *((unsigned __int16 *)v28 + 5);
      if (!*((_WORD *)v28 + 5) || !strcmp(v30, "_START_") || !strcmp(v30, "_END_")) {
        goto LABEL_50;
      }
      uint64_t v32 = v28[8] & 0xF;
      if (v32 == 2)
      {
        if (v41 < a2[6])
        {
          *uint64_t v11 = v41;
          uint64_t v33 = *(void *)(a1 + 464);
          if (*(_DWORD *)(a1 + 564) == 4) {
            uint64_t v34 = *(unsigned int *)(v33 + v41);
          }
          else {
            uint64_t v34 = *(unsigned __int16 *)(v33 + v41);
          }
          uint64_t v35 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(v34);
          else {
            v41 += v38;
          }
          goto LABEL_51;
        }

void sub_1869B3BD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

int *_OSLogCopyDirectory(int a1, uint64_t a2, void *a3, void *a4, char a5)
{
  v36[128] = *MEMORY[0x1895F89C0];
  uint64_t v9 = a3;
  id v10 = a4;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t TempDirectory = _OSLogCreateTempDirectory(v10, 0x1FFu);
  if ((_DWORD)TempDirectory == -1)
  {
    uint64_t v20 = *__error();
    *((_DWORD *)v34 + 6) = v20;
    goto LABEL_14;
  }

  int v12 = v9[2](v9, TempDirectory, a2);
  uint64_t v13 = v34;
  *((_DWORD *)v34 + 6) = v12;
  if (!v12)
  {
    v36[0] = 0LL;
    v36[1] = v36;
    v36[2] = 0x2020000000LL;
    v36[3] = 0LL;
    *((_DWORD *)v13 + 6) = 0;
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = ___OSLogCopyDirectory_block_invoke;
    v24[3] = &unk_189F0F820;
    char v32 = a5;
    uint64_t v29 = a2;
    uint64_t v27 = &v33;
    uint64_t v25 = v9;
    int v31 = TempDirectory;
    id v26 = v10;
    uint64_t v28 = v36;
    uint64_t v30 = 0LL;
    _OSLogEnumerateFiles(v26, a1, v24);
    if (close(TempDirectory) == -1)
    {
      if (*__error() == 9) {
        goto LABEL_16;
      }
      __error();
      _os_assumes_log();
    }

    uint64_t v20 = *((unsigned int *)v34 + 6);

    _Block_object_dispose(v36, 8);
    goto LABEL_14;
  }

  if (fcntl(TempDirectory, 50, v36) == -1)
  {
    __error();
    _os_assumes_log();
  }

  strerror(*((_DWORD *)v34 + 6));
  _OSLogWarningMessage( v10,  "copy handler failed for directory fd: '%s' to '%s': %s (%d)",  v14,  v15,  v16,  v17,  v18,  v19,  (char)v36);
  if (close(TempDirectory) != -1) {
    goto LABEL_8;
  }
  if (*__error() != 9)
  {
    __error();
    _os_assumes_log();
LABEL_8:
    uint64_t v20 = *((unsigned int *)v34 + 6);
LABEL_14:
    _Block_object_dispose(&v33, 8);

    return (int *)v20;
  }

  uint64_t v22 = *__error();
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v22;
  __break(1u);
LABEL_16:
  uint64_t result = __error();
  uint64_t v23 = *result;
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v23;
  __break(1u);
  return result;
}

void sub_1869B3EE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t _OSLogUUIDMapCopySet(int a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  int v30 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  uint64_t v16 = ___OSLogUUIDMapCopySet_block_invoke;
  uint64_t v17 = &unk_189F0F848;
  int v22 = a1;
  uint64_t v20 = &v27;
  uint64_t v21 = &v23;
  id v9 = v7;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = *(const unsigned __int8 **)(a2 + 16);
  if (v11)
  {
    do
    {
      v16((uint64_t)v15, v11 + 16, *((void *)v11 + 4));
      uint64_t v11 = *(const unsigned __int8 **)v11;
    }

    while (v11);
    int v12 = (void ***)v24[3];
  }

  else
  {
    int v12 = 0LL;
  }

  _os_trace_str_map_destroy(v12);
  uint64_t v13 = *((unsigned int *)v28 + 6);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t _OSLogArchiveCreateInfoPlist( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v151 = *MEMORY[0x1895F89C0];
  id v14 = a1;
  id v15 = a8;
  id v99 = a9;
  uint64_t v110 = a2;
  if (*(void *)a2) {
    uint64_t v108 = *(void *)(*(void *)a2 + 24LL);
  }
  else {
    uint64_t v108 = 0LL;
  }
  uuid_unparse_upper((const unsigned __int8 *)(a3 + 24), out);
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:@"ttl01"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    [v14 objectForKeyedSubscript:@"ttl01"];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v18 forKeyedSubscript:@"ttl01"];
  }

  [v14 objectForKeyedSubscript:@"ttl03"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    [v14 objectForKeyedSubscript:@"ttl03"];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v20 forKeyedSubscript:@"ttl03"];
  }

  [v14 objectForKeyedSubscript:@"ttl07"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    [v14 objectForKeyedSubscript:@"ttl07"];
    int v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v22 forKeyedSubscript:@"ttl07"];
  }

  id v112 = v15;
  [v14 objectForKeyedSubscript:@"ttl14"];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    [v14 objectForKeyedSubscript:@"ttl14"];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v24 forKeyedSubscript:@"ttl14"];
  }

  [v14 objectForKeyedSubscript:@"ttl30"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    [v14 objectForKeyedSubscript:@"ttl30"];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v26 forKeyedSubscript:@"ttl30"];
  }

  unsigned __int16 v121 = v16;
  id v113 = v14;
  [v14 objectForKeyedSubscript:@"Identifier"];
  __int16 v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v122)
  {
    [MEMORY[0x189607AB8] UUID];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 UUIDString];
    __int16 v122 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v147[0] = @"OldestTimeRef";
  v145[0] = @"UUID";
  [NSString stringWithUTF8String:out];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v28;
  v145[1] = @"ContinuousTime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a3 + 8)];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v29;
  v145[2] = @"WallTime";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  _timesync_continuous_to_wall_time(a10, (void *)(a3 + 24), *(void *)(a3 + 8), 0));
  int v30 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:v146 forKeys:v145 count:3];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = @"TTL";
  v148[0] = v31;
  v148[1] = v16;
  uint64_t v120 = [MEMORY[0x189603F68] dictionaryWithObjects:v148 forKeys:v147 count:2];

  uuid_unparse_upper((const unsigned __int8 *)(a4 + 24), out);
  size_t v143 = @"OldestTimeRef";
  v141[0] = @"UUID";
  [NSString stringWithUTF8String:out];
  char v32 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v32;
  v141[1] = @"ContinuousTime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a4 + 8)];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v33;
  v141[2] = @"WallTime";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  _timesync_continuous_to_wall_time(a10, (void *)(a4 + 24), *(void *)(a4 + 8), 0));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v34;
  [MEMORY[0x189603F68] dictionaryWithObjects:v142 forKeys:v141 count:3];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  char v144 = v35;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
  id v119 = (void *)objc_claimAutoreleasedReturnValue();

  uuid_unparse_upper((const unsigned __int8 *)(a5 + 24), out);
  uint64_t v139 = @"OldestTimeRef";
  v137[0] = @"UUID";
  [NSString stringWithUTF8String:out];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v36;
  v137[1] = @"ContinuousTime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a5 + 8)];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v37;
  v137[2] = @"WallTime";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  _timesync_continuous_to_wall_time(a10, (void *)(a5 + 24), *(void *)(a5 + 8), 0));
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v38;
  [MEMORY[0x189603F68] dictionaryWithObjects:v138 forKeys:v137 count:3];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  char v140 = v39;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
  uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    uuid_unparse_upper((const unsigned __int8 *)(a6 + 24), out);
    char v135 = @"OldestTimeRef";
    v133[0] = @"UUID";
    [NSString stringWithUTF8String:out];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = v40;
    v133[1] = @"ContinuousTime";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a6 + 8)];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    v134[1] = v41;
    v133[2] = @"WallTime";
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  _timesync_continuous_to_wall_time(a10, (void *)(a6 + 24), *(void *)(a6 + 8), 0));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    v134[2] = v42;
    [MEMORY[0x189603F68] dictionaryWithObjects:v134 forKeys:v133 count:3];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v136 = v43;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
    id v115 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189603F68] dictionary];
    id v115 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uuid_unparse_upper((const unsigned __int8 *)(v110 + 24), out);
  id v44 = (unsigned __int8 *)(v110 + 24 + 16 * v108 - 16);
  uuid_unparse_upper(v44, v149);
  v132[0] = &unk_189F1D3D0;
  v131[0] = @"OSArchiveVersion";
  v131[1] = @"OSLoggingSupportProject";
  id v45 = strdup("libtrace-1612.60.27\n");
  if (v45)
  {
    id v46 = v45;
    id v47 = strchr(v45, 10);
    if (v47) {
      *id v47 = 0;
    }
    id v48 = objc_alloc(NSString);
    size_t v49 = strlen(v46);
    uint64_t v50 = v48;
    unint64_t v51 = 0x189607000LL;
    id v45 = (char *)[v50 initWithBytesNoCopy:v46 length:v49 encoding:4 freeWhenDone:1];
  }

  else
  {
    unint64_t v51 = 0x189607000uLL;
  }

  uint64_t v109 = v45;
  v132[1] = v45;
  v131[2] = @"OSLoggingSupportVersion";
  [MEMORY[0x189607968] numberWithDouble:1612.6];
  uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v107;
  v131[3] = @"ArchiveIdentifier";
  [MEMORY[0x189607AB8] UUID];
  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
  [v106 UUIDString];
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
  v132[3] = v105;
  v132[4] = v122;
  v131[4] = @"SourceIdentifier";
  v131[5] = @"EndTimeRef";
  v129[0] = @"UUID";
  [*(id *)(v51 + 2600) stringWithUTF8String:v149];
  int v104 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v104;
  v129[1] = @"ContinuousTime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v110 + 16)];
  uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = v103;
  v129[2] = @"WallTime";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  _timesync_continuous_to_wall_time(a10, v44, *(void *)(v110 + 16), 0));
  uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
  v130[2] = v102;
  [MEMORY[0x189603F68] dictionaryWithObjects:v130 forKeys:v129 count:3];
  uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();
  v132[5] = v101;
  v131[6] = @"PersistMetadata";
  uint64_t v127 = @"OldestTimeRef";
  v125[0] = @"UUID";
  [*(id *)(v51 + 2600) stringWithUTF8String:out];
  uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v100;
  v125[1] = @"ContinuousTime";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v110 + 8)];
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v52;
  v125[2] = @"WallTime";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  _timesync_continuous_to_wall_time(a10, (void *)(v110 + 24), *(void *)(v110 + 8), 0));
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v53;
  [MEMORY[0x189603F68] dictionaryWithObjects:v126 forKeys:v125 count:3];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v128 = v54;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  v132[6] = v55;
  v132[7] = v120;
  v131[7] = @"SpecialMetadata";
  v131[8] = @"SignpostMetadata";
  v132[8] = v119;
  v132[9] = v117;
  v131[9] = @"HighVolumeMetadata";
  v131[10] = @"LiveMetadata";
  v132[10] = v115;
  v131[11] = @"PersistSizeLimit";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*a7];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  v132[11] = v56;
  v131[12] = @"SpecialSizeLimit";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a7[3]];
  int v57 = (void *)objc_claimAutoreleasedReturnValue();
  v132[12] = v57;
  v131[13] = @"SignpostSizeLimit";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a7[6]];
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
  v132[13] = v58;
  v131[14] = @"HighVolumeSizeLimit";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a7[9]];
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
  v132[14] = v59;
  [MEMORY[0x189603F68] dictionaryWithObjects:v132 forKeys:v131 count:15];
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = (void *)[v60 mutableCopy];

  if (a11) {
    [v61 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"CollectedWithPredicate"];
  }
  uint64_t v123 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:v61 format:100 options:0 error:&v123];
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  int v63 = tmpfile();
  if (!v63)
  {
    uint64_t v82 = __error();
    char v83 = strerror(*v82);
    __error();
    uint64_t v74 = v99;
    _OSLogWarningMessage(v99, "unable to create Info.plist tempfile: %s (%d)", v84, v85, v86, v87, v88, v89, v83);
    uint64_t v81 = 0xFFFFFFFFLL;
    uint64_t v67 = v112;
    uint64_t v69 = (void *)v120;
    goto LABEL_43;
  }

  int v64 = v63;
  fileno(v63);
  id v65 = v62;
  [v65 bytes];
  [v65 length];
  if (_os_trace_write() < 0)
  {
    uint64_t v90 = __error();
    char v98 = strerror(*v90);
    __error();
    uint64_t v74 = v99;
    _OSLogWarningMessage(v99, "failed to write to tempfile: %s (%d)", v91, v92, v93, v94, v95, v96, v98);
    uint64_t v67 = v112;
    uint64_t v69 = (void *)v120;
    if (fclose(v64) != -1)
    {
LABEL_36:
      uint64_t v81 = 0xFFFFFFFFLL;
      goto LABEL_43;
    }

uint64_t _OSLogUUIDMapCopyUUID(int a1, const unsigned __int8 *a2, int a3, void **a4, void *a5, void *a6)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  id v12 = a6;
  if (uuid_is_null(a2)) {
    goto LABEL_4;
  }
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, a3, __str, 0x400uLL);
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, a3 | 0x10, __s, 0x400uLL);
  if (_os_trace_str_map_lookup(*a4, __s))
  {
LABEL_3:
    if (_os_trace_str_map_lookup(*a4, __str))
    {
LABEL_4:
      uint64_t v13 = 0LL;
LABEL_5:

      return v13;
    }

    goto LABEL_13;
  }

  uint64_t TempDirectory = _OSLogCreateTempDirectory(v12, 0x1EDu);
  if ((_DWORD)TempDirectory == -1)
  {
    uint64_t v13 = *__error();
    goto LABEL_5;
  }

  int v16 = TempDirectory;
  uint64_t v17 = (*((uint64_t (**)(id, uint64_t, char *))v11 + 2))(v11, TempDirectory, __s);
  if (!(_DWORD)v17)
  {
    _os_trace_str_map_insert(a4, __s, 1LL);
    if (close(v16) == -1)
    {
      int v41 = *__error();
      uint64_t result = *__error();
      if (v41 == 9)
      {
LABEL_31:
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = result;
        __break(1u);
        goto LABEL_32;
      }

      _os_assumes_log();
    }

    goto LABEL_3;
  }

  uint64_t v13 = v17;
  if (fcntl(v16, 50, v43) == -1)
  {
    __error();
    _os_assumes_log();
  }

  strerror(v13);
  _OSLogWarningMessage(v12, "failed copy handler: '%s' to '%s': %s (%d)", v18, v19, v20, v21, v22, v23, (char)v43);
  if (close(v16) != -1) {
    goto LABEL_5;
  }
  a4 = (void **)*__error();
  uint64_t v24 = *__error();
  if ((_DWORD)a4 != 9)
  {
LABEL_19:
    _os_assumes_log();
    goto LABEL_5;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v24;
  __break(1u);
LABEL_13:
  uint64_t v25 = openat(a1, __str, 0);
  if ((_DWORD)v25 == -1)
  {
    uint64_t v13 = *__error();
    if (fcntl(a1, 50, v43) == -1)
    {
      __error();
      _os_assumes_log();
    }

    strerror(v13);
    _OSLogWarningMessage(v12, "uuid text missing: %s/%s: %s (%d)", v35, v36, v37, v38, v39, v40, (char)v43);
    goto LABEL_5;
  }

  int v26 = v25;
  uint64_t v27 = (*((uint64_t (**)(id, uint64_t, char *))v11 + 2))(v11, v25, __str);
  if ((_DWORD)v27)
  {
    uint64_t v13 = v27;
    if (fcntl(v26, 50, v43) == -1)
    {
      __error();
      _os_assumes_log();
    }

    strerror(v13);
    _OSLogWarningMessage(v12, "failed copy handler: '%s' to '%s': %s (%d)", v28, v29, v30, v31, v32, v33, (char)v43);
    if (close(v26) != -1) {
      goto LABEL_5;
    }
    int v34 = *__error();
    uint64_t result = *__error();
    if (v34 != 9) {
      goto LABEL_19;
    }
    qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C695DD0 = result;
    __break(1u);
    goto LABEL_31;
  }

  _os_trace_str_map_insert(a4, __str, 1LL);
  if (close(v26) != -1) {
    goto LABEL_4;
  }
  int v42 = *__error();
  uint64_t result = *__error();
  if (v42 != 9)
  {
    _os_assumes_log();
    goto LABEL_4;
  }

void _OSLogEnumerateFiles(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  int v7 = _os_trace_fdscandir_b();
  if (v7 < 1)
  {
LABEL_16:
    _os_trace_scandir_free_namelist();

    return;
  }

  for (unsigned int i = v7; ; --i)
  {
    uint64_t v9 = i - 1;
    uint64_t v10 = openat(a2, (const char *)(*(void *)(8LL * v9) + 21LL), 0);
    if ((_DWORD)v10 != -1) {
      break;
    }
    if (*__error() != 2)
    {
      uint64_t v15 = *(void *)(8 * v9) + 21LL;
      int v16 = __error();
      strerror(*v16);
      __error();
      _OSLogWarningMessage(v5, "failed to open: '%s': %s (%d)", v17, v18, v19, v20, v21, v22, v15);
    }

    if (i < 2) {
      goto LABEL_16;
    }
LABEL_13:
    ;
  }

  uint64_t v11 = v10;
  id v12 = (void *)MEMORY[0x186E40118]();
  char v13 = (*((uint64_t (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v11, *(void *)(8 * v9) + 21LL);
  objc_autoreleasePoolPop(v12);
  if (close(v11) != -1)
  {
LABEL_5:
    if (i > 1) {
      char v14 = v13;
    }
    else {
      char v14 = 0;
    }
    if ((v14 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  int v23 = *__error();
  uint64_t v24 = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
    goto LABEL_5;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = v24;
  __break(1u);
}

uint64_t _OSLogUUIDMapAddFromFile(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  uint64_t v15 = (unsigned int (*)(void *))___OSLogUUIDMapAddFromFile_block_invoke;
  int v16 = &unk_189F0F758;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v20;
  uint64_t v19 = a3;
  uint64_t v9 = v14;
  unint64_t v10 = 0LL;
  do
  {
    if (a2 - v10 < 0x10) {
      break;
    }
    unint64_t v11 = *(void *)(a1 + v10 + 8);
    if (a2 - v10 - 16 < v11) {
      break;
    }
    if (!v15(v9)) {
      break;
    }
    unint64_t v10 = (v10 + v11 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  }

  while (v10 - 1 < a2);

  uint64_t v12 = *((unsigned int *)v21 + 6);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void sub_1869B59F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__2182(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2183(uint64_t a1)
{
}

uint64_t OSLogCreateArchiveWithPredicate( const char *a1, uint64_t a2, int64_t a3, BOOL a4, const char *a5, void *a6)
{
  id v11 = a6;
  _InitArchiveDictionary(a1, a2, a3, a4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string(v12, "predicate", a5);
  uint64_t ArchiveWithDictionary = OSLogCreateArchiveWithDictionary(v12, v11);

  return ArchiveWithDictionary;
}

int64_t OSLogFlushBuffers()
{
  os_log_t v0 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v1, "operation", 0xBuLL);
    xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(v0, v1);
    uint64_t v3 = v2;
    if (v2)
    {
      if (MEMORY[0x186E40964](v2) == MEMORY[0x1895F9268])
      {
        int64_t int64 = 22LL;
      }

      else if (xpc_dictionary_get_uint64(v3, "errorcode"))
      {
        int64_t int64 = 1LL;
      }

      else
      {
        int64_t int64 = xpc_dictionary_get_int64(v3, "st");
      }
    }

    else
    {
      int64_t int64 = 96LL;
    }
  }

  else
  {
    int64_t int64 = 53LL;
  }

  return int64;
}

id _findOldestTimeRef(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _timesync_range_contains(a1, (void *)[v6 UUID], objc_msgSend(v6, "continuousTime"));
  if (v5)
  {
    id v8 = v5;
    if (v7)
    {
      int v9 = _timesync_range_compare( (void **)a1,  (void *)[v6 UUID],  objc_msgSend(v6, "continuousTime"),  (void *)objc_msgSend(v5, "UUID"),  objc_msgSend(v5, "continuousTime"));
      id v8 = v6;
      if (v9 != -1) {
        id v8 = v5;
      }
    }
  }

  else
  {
    id v8 = v6;
    if (!v7)
    {
      id v10 = 0LL;
      goto LABEL_8;
    }
  }

  id v10 = v8;
LABEL_8:

  return v10;
}

char *os_trace_copy_formatted_message(uint64_t a1)
{
  v29[128] = *MEMORY[0x1895F89C0];
  v25[0] = v29;
  v25[1] = 0x40000000000LL;
  __int16 v27 = 0;
  char v28 = 0;
  int v26 = 0x10000;
  uint64_t v2 = *(void *)(a1 + 96);
  if (!v2)
  {
    uint64_t v22 = *(const char **)(a1 + 88);
    if (!v22) {
      uint64_t v22 = "<compose failure [missing precomposed trace]>";
    }
    return strdup(v22);
  }

  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = (unsigned __int8 *)(v3 + v2 - 1);
  if ((_WORD)v3 + ~*v4 + 2 * *v4 == 0xFFFE) {
    goto LABEL_17;
  }
  MEMORY[0x1895F8858]();
  int v9 = (unsigned __int8 *)&v23 - v8;
  *int v9 = 0;
  v9[1] = v7;
  if ((_DWORD)v7)
  {
    uint64_t v10 = -v7;
    id v11 = &v5[v6 + ~v7];
    uint64_t v12 = v9 + 2;
    while (1)
    {
      size_t v13 = v4[v10] & 0x3F;
      char v14 = &v5[v13];
      if (&v5[v13] > v11) {
        break;
      }
      *uint64_t v12 = 0;
      v12[1] = v13;
      uint64_t v15 = v12 + 2;
      memcpy(v12 + 2, v5, v13);
      uint64_t v12 = &v15[v13];
      id v5 = v14;
      if (__CFADD__(v10++, 1LL)) {
        goto LABEL_9;
      }
    }

char *os_log_copy_formatted_message(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v15[0] = &v19;
  v15[1] = 0x40000000000LL;
  __int16 v17 = 0;
  char v18 = 0;
  int v16 = 0x10000;
  uint64_t v2 = *(unsigned __int8 **)(a1 + 96);
  if (!v2)
  {
    id v5 = *(const char **)(a1 + 88);
    if (!v5) {
      id v5 = "<compose failure [missing precomposed log]>";
    }
    return strdup(v5);
  }

  unint64_t v3 = *(void *)(a1 + 104);
  if (v3 >> 16) {
    goto LABEL_6;
  }
  unint64_t v4 = *(void *)(a1 + 120);
  if (v4 >> 16) {
    goto LABEL_6;
  }
  if ((unsigned __int16)*(void *)(a1 + 104))
  {
    if ((unsigned __int16)*(void *)(a1 + 104) == 1)
    {
LABEL_6:
      id v5 = "<compose failure [corrupt log]>";
      return strdup(v5);
    }

    uint64_t v7 = (uint64_t)(v2 + 2);
    LOWORD(v3) = v3 - 2;
    if (v2[1])
    {
      int v8 = 0;
      while ((unsigned __int16)v3 >= 2u)
      {
        unint64_t v9 = *(unsigned __int8 *)(v7 + 1) + 2LL;
        v7 += v9;
        LOWORD(v3) = v3 - v9;
      }

      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v2 = (unsigned __int8 *)&os_log_fmt_extract_pubdata_empty_hdr;
  }

uint64_t _chunk_support_convert_tracepoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  unint64_t v6 = *(void *)(a2 + 64);
  *(_OWORD *)(a2 + 4) = 0u;
  *(_OWORD *)(a2 + 20) = 0u;
  *(_OWORD *)(a2 + 36) = 0u;
  *(_OWORD *)(a2 + 84) = 0u;
  *(_OWORD *)(a2 + 100) = 0u;
  *(_OWORD *)(a2 + 116) = 0u;
  *(_OWORD *)(a2 + 132) = 0u;
  *(_OWORD *)(a2 + 14_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a2 + 164) = 0u;
  *(_OWORD *)(a2 + 180) = 0u;
  *(_OWORD *)(a2 + 196) = 0u;
  *(_OWORD *)(a2 + 212) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 6_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a2 + 52) = 0u;
  *(_DWORD *)a2 = 1024;
  uint64_t v7 = *(void *)(a3 + 56);
  if (v7)
  {
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(v7 + 4);
    *(void *)(a2 + _Block_object_dispose(va, 8) = *(void *)(v7 + 8);
    *(void *)(a2 + 24) = v7 + 24;
    uuidpath_lookup_fd(*(_DWORD *)(a3 + 4), (const void *)(v7 + 24), (void *)(a2 + 32));
    if ((*(_WORD *)(v7 + 2) & 1) != 0) {
      *(_DWORD *)(a2 + 136) = 1;
    }
  }

  uint64_t v8 = *(void *)(a3 + 32);
  if (*(_DWORD *)v8 == 24580) {
    return 0LL;
  }
  if (*(_DWORD *)v8 == 24579)
  {
    if (!*(_DWORD *)(v8 + 4) && *(void *)(v8 + 8) >= 0x31uLL)
    {
      *(_DWORD *)a2 = 2560;
      unint64_t v9 = *(void *)(v8 + 32);
      *(void *)(a2 + 40) = *(void *)(v8 + 40);
      uint64_t v10 = *(unsigned int **)(a3 + 24);
      *(void *)(a2 + 64) = v9;
      uint64_t v11 = *(void *)(a3 + 88);
      if (v11)
      {
        unint64_t v12 = _timesync_continuous_to_wall_time(v11, (void *)(*(void *)(a3 + 24) + 128LL), v9, (void *)(a2 + 112));
        *(void *)(a2 + 96) = v12 / 0x3B9ACA00;
        *(_DWORD *)(a2 + 104) = v12 % 0x3B9ACA00 / 0x3E8;
      }

      else
      {
        uint64_t v30 = *((void *)v10 + 2);
        int v31 = v10[6];
        unint64_t v32 = *((void *)v10 + 6);
        if (v32 != v9)
        {
          uint64_t v34 = *v10;
          unint64_t v33 = v10[1];
          if (v32 >= v9)
          {
            unint64_t v61 = (v32 - v9) * v34 / v33;
            v30 -= v61 / 0x3B9ACA00;
            v31 -= v61 % 0x3B9ACA00 / 0x3E8;
            if (v31 < 0)
            {
              --v30;
              v31 += 1000000;
            }
          }

          else
          {
            unint64_t v35 = (v9 - v32) * v34 / v33;
            v30 += v35 / 0x3B9ACA00;
            v31 += v35 % 0x3B9ACA00 / 0x3E8;
            if (v31 > 999999)
            {
              ++v30;
              v31 -= 1000000;
            }
          }
        }

        *(void *)(a2 + 96) = v30;
        *(void *)(a2 + 104) = v31;
        *(void *)(a2 + 112) = *(void *)(a3 + 16);
      }

      uint64_t v62 = v8 + 48;
      if (!uuidpath_lookup_fd(*(_DWORD *)(a3 + 4), (const void *)(v8 + 48), (void *)(a2 + 88)))
      {
        uint64_t v62 = *(void *)(a2 + 24);
        *(void *)(a2 + 8_Block_object_dispose(va, 8) = *(void *)(a2 + 32);
      }

      *(void *)(a2 + 80) = v62;
      uint64_t result = (uint64_t)_state_support_create_message(*(void *)(a3 + 32), (void *)(a2 + 152));
      *(void *)(a2 + 144) = result;
      if (result) {
        return *(void *)(a3 + 56) != 0LL;
      }
      return result;
    }

    return 0LL;
  }

  uint64_t v13 = *(void *)(a3 + 64);
  if (v13)
  {
    if (v13 == -1)
    {
      char v14 = *(unsigned int **)(a3 + 24);
      *(void *)(a2 + 64) = v6;
      uint64_t v15 = *(void *)(a3 + 88);
      if (v15)
      {
        int v16 = (void *)(*(void *)(a3 + 24) + 128LL);
        __int16 v17 = (void *)(a2 + 112);
        unint64_t v18 = v6;
LABEL_16:
        unint64_t v20 = _timesync_continuous_to_wall_time(v15, v16, v18, v17);
        *(void *)(a2 + 96) = v20 / 0x3B9ACA00;
        *(_DWORD *)(a2 + 104) = v20 % 0x3B9ACA00 / 0x3E8;
        goto LABEL_32;
      }

      uint64_t v21 = *((void *)v14 + 2);
      int v22 = v14[6];
      unint64_t v23 = *((void *)v14 + 6);
      if (v23 != v6)
      {
        uint64_t v25 = *v14;
        unint64_t v24 = v14[1];
        uint64_t v26 = v23 - v6;
        if (v23 < v6)
        {
          uint64_t v27 = v6 - v23;
          goto LABEL_23;
        }

        goto LABEL_29;
      }
    }

    else
    {
      unint64_t v18 = (*(void *)(a1 + 16) & 0xFFFFFFFFFFFFLL) + *(void *)(v13 + 8);
      char v19 = *(unsigned int **)(a3 + 24);
      *(void *)(a2 + 64) = v18;
      uint64_t v15 = *(void *)(a3 + 88);
      if (v15)
      {
        int v16 = (void *)(*(void *)(a3 + 24) + 128LL);
        __int16 v17 = (void *)(a2 + 112);
        goto LABEL_16;
      }

      uint64_t v21 = *((void *)v19 + 2);
      int v22 = v19[6];
      unint64_t v28 = *((void *)v19 + 6);
      if (v28 != v18)
      {
        uint64_t v25 = *v19;
        unint64_t v24 = v19[1];
        uint64_t v26 = v28 - v18;
        if (v28 < v18)
        {
          uint64_t v27 = v18 - v28;
LABEL_23:
          unint64_t v29 = v27 * v25 / v24;
          v21 += v29 / 0x3B9ACA00;
          v22 += v29 % 0x3B9ACA00 / 0x3E8;
          if (v22 > 999999)
          {
            ++v21;
            v22 -= 1000000;
          }

          goto LABEL_31;
        }

LABEL_60:
      uint64_t result = _chunk_support_parse_location(a1, &v63, a2 + 56, a3);
      if (!(_DWORD)result) {
        return result;
      }
      LOWORD(v51) = v63;
      if ((*(_WORD *)(a1 + 2) & 0x200) == 0) {
        goto LABEL_65;
      }
      LOWORD(v51) = v63 + 2;
      uint64_t v52 = *(void *)(a3 + 56);
      __int16 v65 = *(_WORD *)(a1 + v63 + 24);
      uint64_t v53 = hashtable_lookup(*(void *)(v52 + 64), (uint64_t)&v65);
      if (v53)
      {
        *(void *)(a2 + 184) = *(void *)(v53 + 8);
        *(void *)(a2 + 192) = *(void *)(v53 + 16);
      }

uint64_t _chunk_support_parse_activity_swap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = 514;
  __int16 v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) == 0)
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v6 = (v6 + 8);
    goto LABEL_7;
  }

  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0LL;
  }
  unint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = _os_activity_map_find_parent(*(void **)(a3 + 8), v7);
  __int16 v5 = *(_WORD *)(a2 + 2);
  LODWORD(v6) = 8;
  if ((v5 & 0x10) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  if ((v5 & 0x200) == 0) {
    return 1LL;
  }
  if ((unint64_t)v6 + 8 <= *(unsigned __int16 *)(a2 + 22))
  {
    *(void *)(a1 + 144) = *(void *)(a2 + v6 + 24);
    return 1LL;
  }

  return 0LL;
}

uint64_t _chunk_support_parse_activity_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = 513;
  __int16 v5 = *(_WORD *)(a2 + 2);
  if ((v5 & 1) == 0)
  {
    LODWORD(v6) = 0;
    if ((v5 & 0x10) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = v6;
    unint64_t v6 = v6 + 8LL;
    *(void *)(a1 + 160) = *(void *)(a2 + v7 + 24);
    if ((*(_WORD *)(a2 + 2) & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0LL;
  }
  *(void *)(a1 + 152) = *(void *)(a2 + 24);
  __int16 v5 = *(_WORD *)(a2 + 2);
  LODWORD(v6) = 8;
  if ((v5 & 0x10) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v5 & 0x200) != 0)
  {
LABEL_9:
    uint64_t v8 = v6;
    unint64_t v6 = v6 + 8LL;
    if (v6 <= *(unsigned __int16 *)(a2 + 22))
    {
      *(void *)(a1 + 4_Block_object_dispose(va, 8) = *(void *)(a2 + v8 + 24);
      goto LABEL_11;
    }

    return 0LL;
  }

uint64_t _chunk_support_parse_useraction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v10 = 0;
  *(_DWORD *)a1 = 515;
  __int16 v6 = *(_WORD *)(a2 + 2);
  if ((v6 & 1) == 0)
  {
    unint64_t v7 = 8LL;
    if ((v6 & 0x10) == 0) {
      return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
    }
    goto LABEL_6;
  }

  if (!(*(void *)(a2 + 16) >> 51)) {
    return 0LL;
  }
  __int16 v10 = 8;
  unint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = _os_activity_map_find_parent(*(void **)(a3 + 8), v8);
  unint64_t v7 = 16LL;
  if ((*(_WORD *)(a2 + 2) & 0x10) != 0)
  {
LABEL_6:
    if (v7 <= *(unsigned __int16 *)(a2 + 22))
    {
      __int16 v10 = v7;
      return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
    }

    return 0LL;
  }

  return _chunk_support_parse_location(a2, &v10, a1 + 56, a3);
}

uint64_t _chunk_support_parse_location(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 + 56);
  int v9 = *(_DWORD *)(a1 + 4);
  if ((*(_WORD *)(v8 + 2) & 1) != 0) {
    unsigned int v10 = 4;
  }
  else {
    unsigned int v10 = 6;
  }
  switch(*(_WORD *)(a1 + 2) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      unsigned int v10 = 4;
      break;
    case 8:
      break;
    case 0xA:
      unsigned int v10 = 20;
      break;
    case 0xC:
      unsigned int v10 = 6;
      break;
    default:
      unsigned int v10 = 0;
      break;
  }

  uint64_t v11 = (unsigned __int16)*a2;
  unint64_t v12 = v11 + v10;
  unint64_t v13 = *(void *)(a1 + 16);
  if (v12 > HIWORD(v13))
  {
    uint64_t v23 = 0LL;
    unint64_t v28 = HIWORD(v13);
LABEL_37:
    *a2 = v28;
    return v23;
  }

  *a2 = v12;
  if (!v10) {
    return 0LL;
  }
  char v14 = (unsigned int *)(a1 + 24 + v11);
  if (v10 == 6)
  {
    uint64_t v15 = 0LL;
    unint64_t v16 = (unint64_t)*((unsigned __int16 *)v14 + 2) << 32;
  }

  else
  {
    unint64_t v16 = 0LL;
    if (v10 == 4) {
      uint64_t v15 = 0LL;
    }
    else {
      uint64_t v15 = v14 + 1;
    }
  }

  uint64_t v17 = *v14;
  if ((*(_WORD *)(a1 + 2) & 0x20) == 0)
  {
    unint64_t v18 = 0LL;
    goto LABEL_20;
  }

  unint64_t v19 = *(void *)(a1 + 16);
  if ((unint64_t)(unsigned __int16)v12 + 2 > HIWORD(v19))
  {
    uint64_t v23 = 0LL;
    unint64_t v28 = HIWORD(v19);
    goto LABEL_37;
  }

  *a2 = v12 + 2;
  unint64_t v18 = (unint64_t)*(unsigned __int16 *)(a1 + 24 + (unsigned __int16)v12) << 31;
LABEL_20:
  unint64_t v20 = v18 | v9 & 0x7FFFFFFF;
  if (v9 >= 0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v20 | 0x8000000000000000LL;
  }
  *(void *)(a3 + 72) = v21;
  if (!v21) {
    return 0LL;
  }
  int v22 = *(_WORD *)(a1 + 2) & 0xE;
  uint64_t v23 = 1LL;
  unint64_t v24 = v16 | v17;
  switch(v22)
  {
    case 2:
      *(void *)(a3 + 64) = v24;
      uint64_t v15 = (const void *)(v8 + 24);
      goto LABEL_29;
    case 4:
    case 12:
      *(void *)(a3 + 24) = v8 + 40;
      uint64_t v25 = a3 + 24;
      *(void *)(v25 + 40) = v24;
      return uuidpath_sharedcache_resolve_fd( *(unsigned int *)(a4 + 4),  (__n128 *)(v8 + 40),  v21,  v16 | v17,  0LL,  (const char **)(v25 + 64),  0LL,  (void *)v25,  v25 + 8,  0LL,  0LL);
    case 8:
      uint64_t v27 = (void *)_catalog_procinfo_lookup_pc(v8, v16 | v17);
      if (!v27) {
        return 0LL;
      }
      uint64_t v15 = v27 + 2;
      *(void *)(a3 + 64) = v24 - *v27;
      unint64_t v21 = *(void *)(a3 + 72);
LABEL_29:
      *(void *)(a3 + 24) = v15;
      break;
    case 10:
      *(void *)(a3 + 64) = v24;
      *(void *)(a3 + 24) = v15;
      if (!v15) {
        return 0LL;
      }
      break;
    default:
      return v23;
  }

  return uuidpath_resolve_fd( *(_DWORD *)(a4 + 4),  v15,  v21,  0LL,  (const char **)(a3 + 88),  0LL,  (void *)(a3 + 32),  0LL);
}

tm *_chunk_support_context_init(uint64_t a1)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 4) = -1;
  time_t v6 = time(0LL);
  uint64_t result = localtime_r(&v6, &v5);
  int tm_isdst = v5.tm_isdst;
  unint64_t v4 = ((unsigned __int128)(v5.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v5.tm_gmtoff;
  *(_DWORD *)(a1 + 16) = (v4 >> 5) + (v4 >> 63) + 60 * v5.tm_isdst;
  *(_DWORD *)(a1 + 20) = tm_isdst;
  return result;
}

uint64_t _chunk_support_context_clear(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    _catalog_destroy(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 4);
  if ((_DWORD)result != -1)
  {
    uint64_t result = close(result);
    if ((_DWORD)result == -1)
    {
      int v4 = *__error();
      uint64_t result = *__error();
      if (v4 == 9)
      {
        qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C695DD0 = result;
        __break(1u);
      }

      else
      {
        return _os_assumes_log();
      }
    }
  }

  return result;
}

void *_chunk_support_context_update(void *result, int *a2)
{
  uint64_t v2 = result;
  unint64_t v3 = 0LL;
  result[4] = a2;
  int v4 = *a2;
  switch(*a2)
  {
    case 24577:
      unint64_t v5 = *((void *)a2 + 1);
      unint64_t v6 = v5 - 16;
      if (v5 < 0x10) {
        goto LABEL_12;
      }
      unint64_t v3 = (unsigned __int16 *)(a2 + 8);
      BOOL v7 = *((_BYTE *)a2 + 29) != 0;
      goto LABEL_19;
    case 24578:
      unint64_t v10 = *((void *)a2 + 1);
      unint64_t v6 = v10 - 32;
      if (v10 < 0x20) {
        goto LABEL_12;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 12);
      goto LABEL_19;
    case 24579:
      unint64_t v11 = *((void *)a2 + 1);
      unint64_t v6 = v11 - 48;
      if (v11 < 0x30) {
        goto LABEL_12;
      }
      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 16);
      goto LABEL_19;
    case 24580:
      unint64_t v12 = *((void *)a2 + 1);
      unint64_t v6 = v12 - 72;
      if (v12 < 0x48)
      {
LABEL_12:
        result[8] = 0LL;
        goto LABEL_25;
      }

      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 22);
      goto LABEL_19;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24587:
      goto LABEL_23;
    case 24588:
      unint64_t v8 = *((void *)a2 + 1);
      if (v8 <= 0xF)
      {
        result[8] = 0LL;
        goto LABEL_29;
      }

      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)a2 + 15;
      goto LABEL_18;
    default:
      if (v4 != 24592) {
        goto LABEL_23;
      }
      unint64_t v8 = *((void *)a2 + 1);
      if (v8 <= 0xF)
      {
        int v9 = 0;
        result[8] = 0LL;
        goto LABEL_31;
      }

      BOOL v7 = 0;
      unint64_t v3 = (unsigned __int16 *)(a2 + 8);
LABEL_18:
      unint64_t v6 = v8 - 16;
LABEL_19:
      if (v6 - 4097 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_23;
      }
      unint64_t v13 = *v3;
      if (v6 < v13)
      {
        unint64_t v3 = 0LL;
        goto LABEL_24;
      }

      uint64_t v14 = v3[1];
      if (!v7)
      {
        if (v6 == 4096)
        {
          result[9] = (char *)v3 + v14;
          result[10] = (unsigned __int16)(4096 - v14);
          goto LABEL_24;
        }

LABEL_23:
        result[9] = 0LL;
        result[10] = 0LL;
        goto LABEL_24;
      }

      result[9] = (char *)v3 + v13;
      result[10] = (unsigned __int16)(4096 - v14);
LABEL_24:
      result[8] = v3;
      if ((v4 - 24577) < 4)
      {
LABEL_25:
        uint64_t v15 = result[5];
        if (v15)
        {
          uint64_t result = _os_procinfo_map_lookup(*(void **)(v15 + 40), *((void *)a2 + 2), a2[6]);
          v2[7] = result;
          return result;
        }

        goto LABEL_43;
      }

      if (v4 == 24592)
      {
        int v9 = 0;
      }

      else
      {
        if (v4 != 24588) {
          return result;
        }
LABEL_29:
        int v9 = *((unsigned __int8 *)a2 + 29);
      }

    BOOL v7 = 1020;
    goto LABEL_24;
  }

  BOOL v7 = 1039;
LABEL_24:
  *(_DWORD *)(a1 + 560) = v7;
  return 0xFFFFFFFFLL;
}

BOOL ___os_activity_stream_mapped_file_block_invoke(void *a1, uint64_t a2)
{
  int v3 = *(_DWORD *)a2;
  if (a1[5] == a2)
  {
    if (v3 != 4096 || *(void *)(a2 + 8) <= 0x27uLL) {
      return 0LL;
    }
LABEL_17:
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = _chunk_support_stream((int *)a2, a1[6]);
    return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
  }

  if (v3 > 7679)
  {
    switch(v3)
    {
      case 24577:
      case 24578:
      case 24579:
      case 24580:
        if (!*(_DWORD *)(a2 + 4)) {
          goto LABEL_17;
        }
        break;
      case 24581:
      case 24582:
      case 24583:
      case 24584:
      case 24585:
      case 24586:
      case 24590:
      case 24591:
        return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
      case 24587:
        break;
      case 24588:
      case 24592:
        break;
      case 24589:
        goto LABEL_17;
      default:
        if (v3 == 7680 || v3 == 0x2000) {
          goto LABEL_17;
        }
        break;
    }

    return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
  }

  if (v3 > 7167)
  {
    BOOL v5 = v3 == 7168;
    int v6 = 7424;
  }

  else
  {
    BOOL v5 = v3 == 4096;
    int v6 = 6912;
  }

  if (v5 || v3 == v6) {
    goto LABEL_17;
  }
  return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
}

BOOL _chunk_support_stream(int *a1, uint64_t a2)
{
  uint64_t v28 = 0LL;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000LL;
  char v31 = 1;
  *(void *)(a2 + 32) = a1;
  switch(*a1)
  {
    case 24577:
    case 24588:
      _chunk_support_context_update((void *)a2, a1);
      uint64_t v8 = *(void *)(a2 + 104);
      if (v8)
      {
        int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
        *((_BYTE *)v29 + 24) = v9;
        if (!v9) {
          goto LABEL_5;
        }
      }

      else if (!*((_BYTE *)v29 + 24))
      {
        goto LABEL_5;
      }

      if (!*(void *)(a2 + 96)) {
        goto LABEL_5;
      }
      uint64_t v16 = *(unsigned __int16 **)(a2 + 64);
      if (!v16) {
        goto LABEL_5;
      }
      unint64_t v18 = v16 + 8;
      uint64_t v17 = *v16;
      uint64_t v19 = (char *)v16 + v17;
      else {
        unint64_t v20 = (unint64_t)v19;
      }
      while ((unint64_t)(v18 + 12) < v20)
      {
        int v21 = v18;
        unint64_t v22 = *((void *)v18 + 2);
        uint64_t v23 = HIWORD(v22);
        if ((v22 & 0x7000000000000LL) != 0) {
          uint64_t v25 = (HIWORD(v22) & 0xFFF8) + 32LL;
        }
        else {
          uint64_t v25 = v23 + 24;
        }
        unint64_t v18 = (unsigned __int16 *)((char *)v18 + v25);
        if (*(void *)v21
          && _chunk_support_convert_tracepoint((uint64_t)v21, (uint64_t)&v26, a2)
          && ((*(uint64_t (**)(void))(*(void *)(a2 + 96) + 16LL))() & 1) == 0)
        {
          *((_BYTE *)v29 + 24) = 0;
          goto LABEL_5;
        }
      }

      goto LABEL_5;
    case 24578:
    case 24579:
    case 24580:
    case 24592:
      _chunk_support_context_update((void *)a2, a1);
      goto LABEL_3;
    case 24581:
    case 24582:
    case 24583:
    case 24584:
    case 24585:
    case 24586:
    case 24590:
    case 24591:
      goto LABEL_5;
    case 24587:
      uint64_t v10 = *(void *)(a2 + 40);
      if (v10) {
        _catalog_destroy(v10);
      }
      uint64_t v11 = _catalog_create_with_chunk((uint64_t)a1, 0);
      *(void *)(a2 + 40) = v11;
      if (v11) {
        uint64_t v12 = *(void *)(v11 + 64);
      }
      else {
        uint64_t v12 = 0LL;
      }
      *(void *)(a2 + 4_Block_object_dispose(va, 8) = v12;
      goto LABEL_3;
    case 24589:
      uint64_t v13 = *(void *)(a2 + 104);
      if (v13)
      {
        char v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 16))(v13, a2);
        *((_BYTE *)v29 + 24) = v14;
      }

      uint64_t v15 = *(void **)(a2 + 48);
      if (v15)
      {
        if ((*(_BYTE *)(a2 + 1) & 8) == 0)
        {
          v27[0] = MEMORY[0x1895F87A8];
          v27[1] = 0x40000000LL;
          v27[2] = ___chunk_support_stream_block_invoke;
          v27[3] = &unk_189F0F8D8;
          v27[4] = &v28;
          v27[5] = a2;
          _tracev3_chunk_decompress_and_enumerate_chunks((uint64_t)a1, (uint64_t)v15, (uint64_t)v27);
          uint64_t v15 = *(void **)(a2 + 48);
        }

        if (*v15) {
          *(void *)(a2 + 4_Block_object_dispose(va, 8) = *v15;
        }
LABEL_5:
        BOOL v6 = *((_BYTE *)v29 + 24) != 0;
      }

      else
      {
        BOOL v6 = 1LL;
      }

      _Block_object_dispose(&v28, 8);
      return v6;
    default:
      if (*a1 != 4096) {
        goto LABEL_5;
      }
      *(void *)(a2 + 24) = a1 + 4;
LABEL_3:
      uint64_t v4 = *(void *)(a2 + 104);
      if (v4)
      {
        char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
        *((_BYTE *)v29 + 24) = v5;
      }

      goto LABEL_5;
  }

BOOL ___chunk_support_stream_block_invoke(uint64_t a1, int *a2)
{
  BOOL result = 1LL;
  unsigned int v5 = *a2 - 24577;
  BOOL v6 = v5 > 0xF;
  int v7 = (1 << v5) & 0x880F;
  if (!v6 && v7 != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _chunk_support_stream(a2, *(void *)(a1 + 40));
    return *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 0;
  }

  return result;
}

uint64_t _os_activity_stream_entry_decode(void *a1, int *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (MEMORY[0x186E40964]() != MEMORY[0x1895F9250]) {
    return 0xFFFFFFFFLL;
  }
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + _Block_object_dispose(va, 8) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  a2[1] = xpc_dictionary_get_uint64(a1, "pid");
  *((void *)a2 + 1) = xpc_dictionary_get_uint64(a1, "procid");
  a2[4] = xpc_dictionary_get_uint64(a1, "uid");
  *((void *)a2 + 3) = xpc_dictionary_get_uuid(a1, "procuuid");
  string = xpc_dictionary_get_string(a1, "procpath");
  *((void *)a2 + 4) = string;
  if (!string)
  {
    BOOL v6 = (const void *)*((void *)a2 + 3);
    if (v6) {
      uuidpath_lookup_fd(-3, v6, (void *)a2 + 4);
    }
  }

  *((void *)a2 + 5) = xpc_dictionary_get_uint64(a1, "aid");
  *((void *)a2 + 6) = xpc_dictionary_get_uint64(a1, "paid");
  *a2 = xpc_dictionary_get_uint64(a1, "type");
  a2[29] = xpc_dictionary_get_int64(a1, "timezoneDSTflag");
  a2[28] = xpc_dictionary_get_int64(a1, "timezoneMinutesWest");
  *((void *)a2 + 12) = xpc_dictionary_get_int64(a1, "timeGMTsec");
  a2[26] = xpc_dictionary_get_int64(a1, "timeGMTusec");
  if (xpc_dictionary_get_BOOL(a1, "32bits")) {
    a2[34] |= 1u;
  }
  uint64_t int64 = xpc_dictionary_get_uint64(a1, "traceid");
  char v8 = BYTE2(uint64);
  *((void *)a2 + 7) = uint64;
  *((void *)a2 + 9) = xpc_dictionary_get_uint64(a1, "thread");
  *((void *)a2 + _Block_object_dispose(va, 8) = xpc_dictionary_get_uint64(a1, "timestamp");
  *((void *)a2 + 15) = xpc_dictionary_get_uint64(a1, "offset");
  *((void *)a2 + 16) = xpc_dictionary_get_uint64(a1, "formatoffset");
  *((void *)a2 + 10) = xpc_dictionary_get_uuid(a1, "imageuuid");
  int v9 = (__n128 **)(a2 + 20);
  *((void *)a2 + 11) = xpc_dictionary_get_string(a1, "imagepath");
  int v10 = *a2;
  uint64_t result = 0xFFFFFFFFLL;
  if (*a2 > 767)
  {
    if (v10 != 1024 && v10 != 768) {
      return result;
    }
  }

  else if (v10 != 513 && v10 != 515)
  {
    return result;
  }

  uint64_t v11 = xpc_dictionary_get_string(a1, "name");
  *((void *)a2 + 1_Block_object_dispose(va, 8) = v11;
  if (!v11 || !*((void *)a2 + 11))
  {
    uint64_t v12 = *v9;
    if (*v9)
    {
      if ((v8 & 6 | 8) == 0xC) {
        uuidpath_sharedcache_resolve_fd( 0xFFFFFFFFLL,  v12,  *((void *)a2 + 16),  *((void *)a2 + 15),  0LL,  (const char **)a2 + 18,  0LL,  (void *)a2 + 10,  (unint64_t)(a2 + 22),  0LL,  0LL);
      }
      else {
        uuidpath_resolve(0LL, v12, *((void *)a2 + 16), 0LL, (const char **)a2 + 18, 0LL, (void *)a2 + 11, 0LL);
      }
    }
  }

  int v13 = *a2;
  if (*a2 == 515)
  {
    BOOL v15 = xpc_dictionary_get_BOOL(a1, "persisted");
    uint64_t result = 0LL;
    *((_BYTE *)a2 + 152) = v15;
  }

  else if (v13 == 1024)
  {
    *((void *)a2 + 19) = xpc_dictionary_get_data(a1, "buffer", (size_t *)a2 + 20);
    *((void *)a2 + 21) = xpc_dictionary_get_data(a1, "privdata", (size_t *)a2 + 22);
    *((void *)a2 + 24) = xpc_dictionary_get_string(a1, "category");
    *((void *)a2 + 23) = xpc_dictionary_get_string(a1, "subsystem");
    BOOL v16 = xpc_dictionary_get_BOOL(a1, "persisted");
    uint64_t result = 0LL;
    *((_BYTE *)a2 + 205) = v16;
  }

  else if (v13 == 768)
  {
    *((void *)a2 + 21) = xpc_dictionary_get_value(a1, "payload");
    uint64_t data = xpc_dictionary_get_data(a1, "buffer", (size_t *)a2 + 20);
    uint64_t result = 0LL;
    *((void *)a2 + 19) = data;
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t os_activity_stream_for_simulator(const char *a1, int a2, const void *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%s", a1);
  *(void *)(v6 + 24) = dispatch_queue_create(__str, 0LL);
  *(void *)uint64_t v6 = _Block_copy(a3);
  *(void *)(v6 + 40) = xpc_array_create(0LL, 0LL);
  *(void *)(v6 + 4_Block_object_dispose(va, 8) = xpc_array_create(0LL, 0LL);
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  *(_BYTE *)(v6 + 84) = 1;
  *(void *)(v6 + 72) = strdup(a1);
  return v6;
}

uint64_t os_activity_stream_for_pid(int a1, int a2, const void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%d", a1);
  *(void *)(v6 + 24) = dispatch_queue_create(__str, 0LL);
  *(void *)uint64_t v6 = _Block_copy(a3);
  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  *(void *)(v6 + 40) = v7;
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  if (a1 == -1)
  {
    *(_BYTE *)(v6 + 84) = 1;
  }

  else if (a1 >= 1)
  {
    xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, a1);
  }

  return v6;
}

void os_activity_stream_add_pid(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 84))
  {
    xpc_object_t v4 = *(xpc_object_t *)(a1 + 40);
    if (!v4)
    {
      xpc_object_t v4 = xpc_array_create(0LL, 0LL);
      *(void *)(a1 + 40) = v4;
    }

    xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, a2);
  }

uint64_t os_activity_stream_for_uid(unsigned int a1, int a2, const void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v6 = _os_trace_calloc();
  snprintf(__str, 0x40uLL, "com.apple.activity.stream.%d", a1);
  *(void *)(v6 + 24) = dispatch_queue_create(__str, 0LL);
  *(void *)uint64_t v6 = _Block_copy(a3);
  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  *(void *)(v6 + 4_Block_object_dispose(va, 8) = v7;
  *(_DWORD *)(v6 + 32) = a2;
  *(_DWORD *)(v6 + 64) = 0;
  xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, a1);
  return v6;
}

void os_activity_stream_add_uid(uint64_t a1, int64_t value)
{
  unsigned int v2 = value;
  xpc_object_t v4 = *(xpc_object_t *)(a1 + 48);
  if (!v4)
  {
    xpc_object_t v4 = xpc_array_create(0LL, 0LL);
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = v4;
  }

  xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, v2);
}

void *os_activity_stream_set_event_handler(uint64_t a1, void *aBlock)
{
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + _Block_object_dispose(va, 8) = result;
  return result;
}

uint64_t os_activity_stream_set_filter(uint64_t result, int a2)
{
  *(_DWORD *)(result + 64) |= a2;
  return result;
}

void os_activity_stream_resume(uint64_t a1)
{
}

void _os_activity_stream_resume_with_filter(uint64_t a1, const void *a2, size_t a3)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", *(dispatch_queue_t *)(a1 + 24), 2uLL);
  uint64_t v7 = MEMORY[0x1895F87A8];
  *(void *)(a1 + 16) = mach_service;
  handler[0] = v7;
  handler[1] = 0x40000000LL;
  handler[2] = ___os_activity_stream_resume_with_filter_block_invoke;
  handler[3] = &__block_descriptor_tmp_37;
  handler[4] = a1;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_retain(*(xpc_object_t *)(a1 + 16));
  xpc_connection_set_context(*(xpc_connection_t *)(a1 + 16), (void *)a1);
  xpc_connection_set_finalizer_f(*(xpc_connection_t *)(a1 + 16), (xpc_finalizer_t)_os_activity_stream_dealloc);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 16));
  if (!*(_DWORD *)(a1 + 64)) {
    *(_DWORD *)(a1 + 64) = 7;
  }
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "action", 3uLL);
  xpc_dictionary_set_uint64(v8, "flags", *(unsigned int *)(a1 + 32));
  xpc_dictionary_set_uint64(v8, "types", *(unsigned int *)(a1 + 64));
  uint64_t v9 = *(const char **)(a1 + 72);
  if (v9) {
    xpc_dictionary_set_string(v8, "simulator_device", v9);
  }
  if (xpc_array_get_count(*(xpc_object_t *)(a1 + 40)) && xpc_array_get_count(*(xpc_object_t *)(a1 + 48)))
  {
    if (a2)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }

    else if (!*(_BYTE *)(a1 + 84))
    {
      uint64_t v10 = *(void **)(a1 + 48);
      id v11 = *(id *)(a1 + 40);
      id v12 = v10;
      if (xpc_array_get_count(v11))
      {
        if (xpc_array_get_count(v12))
        {
          int v13 = -[_OSLogStreamFilter initWithPredicate:]( objc_alloc(&OBJC_CLASS____OSLogStreamFilter),  "initWithPredicate:",  0LL);
          uint64_t applier = v7;
          uint64_t v35 = 3221225472LL;
          unint64_t v36 = ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke;
          unsigned int v37 = &unk_189F0F458;
          char v14 = v13;
          unsigned int v38 = v14;
          xpc_array_apply(v11, &applier);
          v32[0] = v7;
          v32[1] = 3221225472LL;
          v32[2] = ___OSLogStreamFilterBytesForPIDAndUIDArray_block_invoke_2;
          v32[3] = &unk_189F0F458;
          unint64_t v33 = v14;
          BOOL v15 = v14;
          xpc_array_apply(v12, v32);
          -[_OSLogStreamFilter data](v15, "data");
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 length];
          uint64_t v17 = (void *)_os_trace_malloc();
          objc_msgSend(v16, "getBytes:length:", v17, objc_msgSend(v16, "length"));
          a3 = [v16 length];

          unint64_t v18 = 0LL;
          uint64_t v19 = 0LL;
          a2 = v17;
          if (!v17) {
            goto LABEL_26;
          }
          goto LABEL_24;
        }

        goto LABEL_34;
      }

void ___os_activity_stream_resume_with_filter_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x186E40964](a2);
  if (v4 == MEMORY[0x1895F9250])
  {
    if (xpc_dictionary_get_value(a2, "action")
      && !_os_activity_stream_entry_decode(a2, v8)
      && ((*(uint64_t (**)(void))(**(void **)(a1 + 32) + 16LL))() & 1) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)(v6 + 80) = 89;
      xpc_connection_cancel(*(xpc_connection_t *)(v6 + 16));
    }
  }

  else if (v4 == MEMORY[0x1895F9268])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (a2 == (void *)MEMORY[0x1895F91A0])
    {
      uint64_t v7 = *(void *)(v5 + 8);
      if (v7) {
        (*(void (**)(void))(v7 + 16))();
      }
      else {
        (*(void (**)(void))(*(void *)v5 + 16LL))();
      }
      xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 16LL));
    }

    else
    {
      *(_DWORD *)(v5 + 80) = 5;
      xpc_connection_cancel(*(xpc_connection_t *)(v5 + 16));
    }
  }

void _os_activity_stream_dealloc(const void **a1)
{
  unsigned int v2 = (dispatch_object_s *)a1[3];
  if (v2)
  {
    dispatch_release(v2);
    a1[3] = 0LL;
  }

  if (*a1)
  {
    _Block_release(*a1);
    *a1 = 0LL;
  }

  int v3 = a1[1];
  if (v3)
  {
    _Block_release(v3);
    a1[1] = 0LL;
  }

  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    xpc_release(v4);
    a1[5] = 0LL;
  }

  uint64_t v5 = (void *)a1[6];
  if (v5) {
    xpc_release(v5);
  }
  free(a1);
}

void ___os_activity_stream_resume_with_filter_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x186E40964](a2);
  if (v4 == MEMORY[0x1895F9250])
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "error");
    uint64_t v6 = *(void *)(a1 + 32);
    if (!value)
    {
      (*(void (**)(void))(*(void *)(v6 + 8) + 16LL))();
      return;
    }

    *(_DWORD *)(v6 + 80) = 1;
    uint64_t v7 = *(_xpc_connection_s **)(v6 + 16);
LABEL_7:
    xpc_connection_cancel(v7);
    return;
  }

  if (v4 == MEMORY[0x1895F9268])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)(v8 + 80) = 5;
    uint64_t v7 = *(_xpc_connection_s **)(v8 + 16);
    goto LABEL_7;
  }

void os_activity_stream_cancel(uint64_t a1)
{
  *(_DWORD *)(a1 + 80) = 89;
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
  xpc_release(*(xpc_object_t *)(a1 + 16));
}

void _OSLogInstallPreferences(unsigned int a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1896079E8];
  id v6 = a2;
  [v5 dataWithPropertyList:a3 format:200 options:0 error:0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v8, "operation", 2uLL);
  xpc_dictionary_set_uint64(v8, "prefs_type", a1);
  id v9 = v6;
  uint64_t v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "prefs_name", v10);
  id v11 = v7;
  xpc_dictionary_set_data(v8, "prefs_data", (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  _OSLogPreferencesSendMessage(v8);
}

void _OSLogRemovePreferences(unsigned int a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(xdict, "operation", 3uLL);
  xpc_dictionary_set_uint64(xdict, "prefs_type", a1);
  id v4 = v3;
  uint64_t v5 = (const char *)[v4 UTF8String];

  xpc_dictionary_set_string(xdict, "prefs_name", v5);
  _OSLogPreferencesSendMessage(xdict);
}

void _OSLogPreferencesSendMessage(void *a1)
{
  id v1 = a1;
  connection = xpc_connection_create_mach_service("com.apple.logd.admin", 0LL, 2uLL);
  xpc_connection_set_event_handler(connection, &__block_literal_global_161);
  xpc_connection_activate(connection);
  xpc_object_t v2 = xpc_connection_send_message_with_reply_sync(connection, v1);
}

uint64_t _LevelForKey(void *a1, uint64_t a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v2)
  {
    if (![v2 caseInsensitiveCompare:@"default"])
    {
      uint64_t v4 = 2LL;
      goto LABEL_12;
    }

    if (![v3 caseInsensitiveCompare:@"info"])
    {
      uint64_t v4 = 3LL;
      goto LABEL_12;
    }

    if (![v3 caseInsensitiveCompare:@"debug"])
    {
      uint64_t v4 = 4LL;
      goto LABEL_12;
    }

    if (![v3 caseInsensitiveCompare:@"off"]
      || ![v3 caseInsensitiveCompare:@"none"])
    {
      uint64_t v4 = 0LL;
      goto LABEL_12;
    }
  }

  uint64_t v4 = 1LL;
LABEL_12:

  return v4;
}

id OSLogPreferencesList(void *a1)
{
  id v1 = a1;
  [MEMORY[0x189603FA8] array];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:_os_trace_sysprefsdir_path()];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingPathComponent:v1];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogPreferencesListDirectory(v4, v2);
  if (_os_trace_is_development_build())
  {
    [NSString stringWithUTF8String:_os_trace_intprefsdir_path()];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringByAppendingPathComponent:v1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    OSLogPreferencesListDirectory(v6, v2);
  }

  [NSString stringWithUTF8String:_os_trace_prefsdir_path()];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringByAppendingPathComponent:v1];
  xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  OSLogPreferencesListDirectory(v8, v2);
  return v2;
}

void OSLogPreferencesListDirectory(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1896078A8];
  id v5 = a1;
  [v4 defaultManager];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 contentsOfDirectoryAtPath:v5 error:0];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  size_t v9[2] = __OSLogPreferencesListDirectory_block_invoke;
  void v9[3] = &unk_189F0FA90;
  id v10 = v3;
  id v7 = v3;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __OSLogPreferencesListDirectory_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = [v6 hasSuffix:@".plist"];
  uint64_t v4 = v6;
  if (v3)
  {
    [v6 stringByDeletingPathExtension];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    uint64_t v4 = v6;
  }
}

BOOL OSLogValidateProfilePayload(void *a1)
{
  id v1 = a1;
  [v1 objectForKey:@"Processes"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v5 = 0LL;
  }

  else
  {
    [v1 objectForKey:@"Subsystems"];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v5 = 0LL;
    }

    else
    {
      [v1 objectForKey:@"System"];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = 1;
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          BOOL v5 = 0;
        }
      }
    }
  }

  return v5;
}

BOOL OSLogInstallProfilePayload(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA8], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v1;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA8],  OS_LOG_TYPE_DEFAULT,  "Profile installation requested with dictionary: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 1;
  [v1 objectForKey:@"Processes"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  void v12[2] = __OSLogInstallProfilePayload_block_invoke;
  v12[3] = &unk_189F0F900;
  void v12[4] = &buf;
  [v2 enumerateKeysAndObjectsUsingBlock:v12];
  if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
    goto LABEL_8;
  }
  [v1 objectForKey:@"Subsystems"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472LL;
  void v11[2] = __OSLogInstallProfilePayload_block_invoke_2;
  void v11[3] = &unk_189F0F900;
  void v11[4] = &buf;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    [v1 objectForKey:@"System"];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKey:@"Enable-Logging"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = v7 == 0LL;

    if (v8) {
      [v6 setObject:MEMORY[0x189604A88] forKey:@"Enable-Logging"];
    }
    [v6 setObject:MEMORY[0x189604A88] forKey:@"Locked"];
    _OSLogInstallPreferences(1u, @"com.apple.system.logging", (uint64_t)v6);

    BOOL v9 = *(_BYTE *)(*((void *)&buf + 1) + 24LL) != 0;
  }

  else
  {
LABEL_8:
    BOOL v9 = 0LL;
  }

  _Block_object_dispose(&buf, 8);
  return v9;
}

void sub_1869BBE6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __OSLogInstallProfilePayload_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v4];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:MEMORY[0x189604A88] forKey:@"Locked"];
    _OSLogInstallPreferences(2u, v6, (uint64_t)v5);
  }
}

void __OSLogInstallProfilePayload_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v4];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:MEMORY[0x189604A88] forKey:@"Locked"];
    _OSLogInstallPreferences(3u, v6, (uint64_t)v5);
  }
}

uint64_t OSLogRemoveProfilePayload(void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA8], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v1;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA8],  OS_LOG_TYPE_DEFAULT,  "Profile removal requested with dictionary: %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  [v1 objectForKey:@"Processes"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2503];
  [v1 objectForKey:@"Subsystems"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_11_2504];
  [v1 objectForKey:@"System"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    _OSLogRemovePreferences(1u, @"com.apple.system.logging");
  }

  return 1LL;
}

void __OSLogRemoveProfilePayload_block_invoke_2(uint64_t a1, void *a2)
{
}

void __OSLogRemoveProfilePayload_block_invoke(uint64_t a1, void *a2)
{
}

void observation_callback(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  strcpy(buffer, "0000000000000000000000000000000000000000");
  buffer[41] = 0;
  if (!a1 || (uint64_t v3 = *(const void **)a1) == 0LL)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid inputs", (uint8_t *)&v19, 2u);
    }

    id v10 = 0LL;
    uint64_t v3 = 0LL;
    int v6 = 0LL;
LABEL_15:
    (*(void (**)(const void *))(mobdevtab + 64))(v3);
    if (v3) {
      CFRelease(v3);
    }
    if (v6) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }

  BOOL v5 = (const __CFString *)(*(uint64_t (**)(void))(mobdevtab + 128))(*(void *)a1);
  int v6 = v5;
  if (v5) {
    CFStringGetCString(v5, buffer, 42LL, 0x8000100u);
  }
  int v7 = *(_DWORD *)(a1 + 8);
  if (v7 == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = buffer;
      _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "device disconnected (%s)\n",  (uint8_t *)&v19,  0xCu);
    }

    (*(void (**)(uint64_t, char *, const void *, void))a2)(1LL, buffer, v3, *(void *)(a2 + 8));
  }

  else if (v7 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = buffer;
      _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "device connected (%s)\n",  (uint8_t *)&v19,  0xCu);
    }

    int v8 = (*(uint64_t (**)(const void *))(mobdevtab + 32))(v3);
    if (v8)
    {
      int v9 = v8;
      id v10 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        id v20 = buffer;
        __int16 v21 = 1024;
        int v22 = v9;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "(%s) AMDeviceConnect failed with %08x (%@)\n",  (uint8_t *)&v19,  0x1Cu);
      }

      goto LABEL_15;
    }

    int v11 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v3);
    if (v11 != -402653155 && v11 != 0)
    {
      int v13 = (*(uint64_t (**)(const void *))(mobdevtab + 120))(v3);
      if (v13)
      {
        int v14 = v13;
        id v10 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
LABEL_37:
          (*(void (**)(uint64_t, char *, const void *, void))a2)(2LL, buffer, v3, *(void *)(a2 + 8));
          goto LABEL_15;
        }

        int v19 = 136315650;
        id v20 = buffer;
        __int16 v21 = 1024;
        int v22 = v14;
        __int16 v23 = 2112;
        id v24 = v10;
        char v15 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v16 = "(%s) AMDevicePair failed with %08x (%@)\n";
LABEL_36:
        _os_log_impl(&dword_186981000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0x1Cu);
        goto LABEL_37;
      }

      uint64_t v17 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v3);
      if ((_DWORD)v17 != -402653155)
      {
        int v18 = v17;
        if ((_DWORD)v17)
        {
          id v10 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v17);
          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_37;
          }
          int v19 = 136315650;
          id v20 = buffer;
          __int16 v21 = 1024;
          int v22 = v18;
          __int16 v23 = 2112;
          id v24 = v10;
          char v15 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v16 = "(%s) AMDeviceStartSession failed with %08x (%@)\n";
          goto LABEL_36;
        }
      }
    }

    (*(void (**)(void, char *, const void *, void))a2)(0LL, buffer, v3, *(void *)(a2 + 8));
    id v10 = 0LL;
    goto LABEL_15;
  }

  id v10 = 0LL;
  if (v6) {
LABEL_18:
  }
    CFRelease(v6);
LABEL_19:
  if (v10) {
    CFRelease(v10);
  }
}

void *___logdev_mobdev_vtable_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileDevice.framework/MobileDevice", 1);
  _logdev_mobdev_vtable_vtab = (uint64_t)result;
  if (result)
  {
    uint64_t result = dlsym(result, "AMDServiceConnectionReceive");
    qword_18C695F48 = (uint64_t)result;
    if (result)
    {
      uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionReceiveMessage");
      qword_18C695F50 = (uint64_t)result;
      if (result)
      {
        uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCreateCopy");
        qword_18C695F58 = (uint64_t)result;
        if (result)
        {
          uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceConnect");
          qword_18C695F60 = (uint64_t)result;
          if (result)
          {
            uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceStartSession");
            qword_18C695F68 = (uint64_t)result;
            if (result)
            {
              uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceSecureStartService");
              qword_18C695F70 = (uint64_t)result;
              if (result)
              {
                uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceStopSession");
                qword_18C695F78 = (uint64_t)result;
                if (result)
                {
                  uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceDisconnect");
                  qword_18C695F80 = (uint64_t)result;
                  if (result)
                  {
                    uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionSendMessage");
                    qword_18C695F88 = (uint64_t)result;
                    if (result)
                    {
                      uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionGetSocket");
                      qword_18C695F90 = (uint64_t)result;
                      if (result)
                      {
                        uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDServiceConnectionInvalidate");
                        qword_18C695F98 = (uint64_t)result;
                        if (result)
                        {
                          uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCopyValue");
                          off_18C695FA0 = (uint64_t (*)(void))result;
                          if (result)
                          {
                            uint64_t result = dlsym( (void *)_logdev_mobdev_vtable_vtab,  "AMDeviceNotificationSubscribeWithOptions");
                            qword_18C695FA8 = (uint64_t)result;
                            if (result)
                            {
                              uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceNotificationUnsubscribe");
                              off_18C695FB0 = (uint64_t (*)(void))result;
                              if (result)
                              {
                                uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDevicePair");
                                qword_18C695FB8 = (uint64_t)result;
                                if (result)
                                {
                                  uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceCopyDeviceIdentifier");
                                  qword_18C695FC0 = (uint64_t)result;
                                  if (result)
                                  {
                                    uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDCopyErrorText");
                                    qword_18C695FC8 = (uint64_t)result;
                                    if (result)
                                    {
                                      uint64_t result = dlsym((void *)_logdev_mobdev_vtable_vtab, "AMDeviceGetInterfaceType");
                                      qword_18C695FD0 = (uint64_t)result;
                                      if (result) {
                                        _logdev_mobdev_vtable_valid = 1;
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

void __logdev_stream_events_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    int v4 = *(_DWORD *)(a2 + 1);
    if (v4 > 15)
    {
      switch(v4)
      {
        case 16:
          int v5 = 515;
          goto LABEL_20;
        case 32:
          int v5 = 514;
          goto LABEL_20;
        case 64:
          int v5 = 1152;
          goto LABEL_20;
      }
    }

    else
    {
      switch(v4)
      {
        case 2:
          int v5 = 513;
          goto LABEL_20;
        case 4:
          int v5 = 768;
          goto LABEL_20;
        case 8:
          int v5 = 1024;
          goto LABEL_20;
      }
    }

    int v5 = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 67109120;
      int v23 = v4;
      _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unknown os_activity_stream_type %u\n",  (uint8_t *)&v22,  8u);
      int v5 = 0;
    }

LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109120;
        int v42 = v12;
        _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unknown message type %x\n", buf, 8u);
      }

      goto LABEL_60;
    }

    if (v12 == 2)
    {
      if (*(_WORD *)(a2 + 109)) {
        char v15 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8 + v10);
      }
      else {
        char v15 = "<missing name>";
      }
      *(void *)&__int128 v36 = *(void *)(a2 + 111);
      uint64_t v20 = *(unsigned int *)(a2 + 119);
    }

    else
    {
      if (v12 != 4) {
        goto LABEL_40;
      }
      if (*(_DWORD *)(a2 + 109)) {
        char v15 = (const char *)(a2 + *(unsigned int *)(a2 + 5) + 8LL * *(unsigned int *)(a2 + 125) + v8 + v10);
      }
      else {
        char v15 = "<missing buffer data>";
      }
      *(void *)&__int128 v37 = 0LL;
      __int128 v36 = 0uLL;
      uint64_t v20 = *(unsigned int *)(a2 + 117);
    }

    uint64_t v35 = v15;
    uint64_t v34 = v20;
LABEL_59:
    uint64_t v32 = *(void *)(a2 + 55);
    int v33 = *(_DWORD *)(a2 + 63);
LABEL_60:
    if (v5 > 767 || v5 == 513 || v5 == 515) {
      (*(void (**)(int *, void))(a1 + 32))(&v22, *(void *)(a1 + 40));
    }
    return;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Got NULL OTRCancelAndFreeActivityStream\n",  (uint8_t *)&v22,  2u);
  }

  (*(void (**)(void, void))(a1 + 32))(0LL, *(void *)(a1 + 40));
}

uint64_t _CopyOTRServiceConnectionForDevice(uint64_t a1, CFTypeRef *a2, const __CFString *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  *a2 = 0LL;
  uint64_t v5 = (*(uint64_t (**)(void))(mobdevtab + 24))();
  if (v5)
  {
    int v6 = (const void *)v5;
    uint64_t v7 = (*(uint64_t (**)(void))(mobdevtab + 32))();
    if ((_DWORD)v7)
    {
      uint64_t v8 = v7;
      int v9 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109378;
        *(_DWORD *)uint64_t v18 = v8;
        *(_WORD *)&v18[4] = 2112;
        *(void *)&void v18[6] = v9;
        _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AMDeviceConnect failed: 0x%08x (%@)",  buf,  0x12u);
      }
    }

    else
    {
      uint64_t v10 = (*(uint64_t (**)(const void *))(mobdevtab + 40))(v6);
      if ((_DWORD)v10 == -402653155 || (_DWORD)v10 == 0)
      {
        uint64_t v12 = (*(uint64_t (**)(const void *, const __CFString *, void, CFTypeRef *))(mobdevtab + 48))( v6,  a3,  0LL,  &cf);
        uint64_t v8 = v12;
        if ((_DWORD)v12)
        {
          int v9 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v12);
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
            *(_DWORD *)__int128 buf = 136315650;
            *(void *)uint64_t v18 = CStringPtr;
            *(_WORD *)&v18[8] = 1024;
            *(_DWORD *)&v18[10] = v8;
            __int16 v19 = 2112;
            uint64_t v20 = v9;
            _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to start service %s: 0x%08x (%@)",  buf,  0x1Cu);
          }

          if (cf) {
            CFRelease(cf);
          }
          CFTypeRef cf = 0LL;
        }

        else
        {
          int v9 = 0LL;
          *a2 = cf;
        }
      }

      else
      {
        uint64_t v8 = v10;
        int v9 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 67109378;
          *(_DWORD *)uint64_t v18 = v8;
          *(_WORD *)&v18[4] = 2112;
          *(void *)&void v18[6] = v9;
          _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "AMDeviceStartSession failed: 0x%08x (%@)",  buf,  0x12u);
        }
      }

      (*(void (**)(const void *))(mobdevtab + 64))(v6);
    }

    CFRelease(v6);
    if (v9) {
      CFRelease(v9);
    }
  }

  else
  {
    uint64_t v8 = 3892314119LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "AMDeviceCreateCopy failed", buf, 2u);
    }
  }

  return v8;
}

void __OTRCreateActivityStreamForPID_block_invoke(uint64_t a1)
{
  *(void *)&v48[5] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  CFTypeRef cf = 0LL;
  unsigned __int8 __size_7 = 0;
  int v3 = (*(uint64_t (**)(void, unsigned __int8 *, uint64_t))(mobdevtab + 8))(*v2, &__size_7, 1LL);
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)__int128 buf = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v8 = "Failed to receive message type: remote side closed connection";
LABEL_10:
    uint32_t v9 = 2;
    goto LABEL_24;
  }

  if (v3 < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)unint64_t v48 = v11;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v8 = "receive got -1 when getting message type: %s";
LABEL_13:
    uint32_t v9 = 12;
    goto LABEL_24;
  }

  int v4 = __size_7;
  if (__size_7 != 2)
  {
    if (__size_7 != 1)
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)__int128 buf = 67109120;
      v48[0] = v4;
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v8 = "Unknown message type: %d";
LABEL_23:
      uint32_t v9 = 8;
      goto LABEL_24;
    }

    int v5 = (*(uint64_t (**)(void, CFTypeRef *, void, void))(mobdevtab + 16))(*v2, &cf, 0LL, 0LL);
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109120;
        v48[0] = v6;
        uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v8 = "Failed to receive response: %x";
        goto LABEL_23;
      }

      goto LABEL_25;
    }

    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFTypeID v20 = CFGetTypeID(cf);
    BOOL v21 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (TypeID == v20)
    {
      if (!v21) {
        goto LABEL_25;
      }
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)unint64_t v48 = cf;
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v8 = "Got error: %p";
      goto LABEL_13;
    }

    if (!v21) {
      goto LABEL_25;
    }
    *(_WORD *)__int128 buf = 0;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v8 = "Incorrect response type";
    goto LABEL_10;
  }

  uint64_t v12 = 0LL;
  int v13 = 0;
  unsigned int __size = 0;
  uint64_t v14 = *v2;
  p_size = &__size;
  do
  {
    unsigned int v16 = (*(uint64_t (**)(uint64_t, unsigned int *, uint64_t))(mobdevtab + 8))(v14, p_size, 4 - v12);
    if (!v16)
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_WORD *)__int128 buf = 0;
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v8 = "Failed to receive message size: remote side closed connection";
      goto LABEL_10;
    }

    if ((v16 & 0x80000000) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      int v22 = __error();
      int v23 = strerror(*v22);
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)unint64_t v48 = v23;
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v8 = "receive got -1 when getting message size: %s";
      goto LABEL_13;
    }

    uint64_t v12 = v16 + v13;
    p_size = (unsigned int *)((char *)p_size + v16);
    int v13 = v12;
  }

  while (v12 < 4);
  unint64_t v17 = __size;
  if (__size > 0x80)
  {
    uint64_t v24 = (unsigned __int8 *)malloc(__size);
    if (v24)
    {
      uint64_t v18 = v24;
      uint64_t v25 = 0LL;
      signed int v26 = 0;
      uint64_t v27 = *v2;
      __int128 v28 = v24;
      do
      {
        unsigned int v29 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unint64_t))(mobdevtab + 8))( v27,  v28,  v17 - v25);
        if (!v29) {
          break;
        }
        if ((v29 & 0x80000000) != 0) {
          goto LABEL_49;
        }
        v26 += v29;
        v28 += v29;
        uint64_t v25 = v26;
      }

      while (v26 < v17);
      if (v26 < 0)
      {
LABEL_49:
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        __int128 v36 = __error();
        __int128 v37 = strerror(*v36);
        *(_DWORD *)__int128 buf = 136315138;
        *(void *)unint64_t v48 = v37;
        char v31 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v32 = "receive got -1 when getting stream message: %s";
        uint32_t v33 = 12;
      }

      else
      {
        unsigned int v30 = __size;
        if (v26 >= (int)__size)
        {
          int v38 = *(_DWORD *)(v18 + 1);
          HIDWORD(v39) = v38;
          LODWORD(v39) = v38 - 2;
          unint64_t v40 = *(unsigned __int16 *)(v18 + 37) + (unint64_t)*(unsigned __int16 *)(v18 + 107) + 129;
          switch((v39 >> 1))
          {
            case 0u:
            case 7u:
              unint64_t v41 = *(unsigned __int16 *)(v18 + 109);
              goto LABEL_58;
            case 1u:
              v40 += *(unsigned int *)(v18 + 109);
              unint64_t v41 = *(unsigned int *)(v18 + 113);
              goto LABEL_58;
            case 3u:
              v40 += *(unsigned int *)(v18 + 109);
              unint64_t v41 = *(unsigned int *)(v18 + 117) + (unint64_t)*(unsigned int *)(v18 + 121);
LABEL_58:
              uint64_t v42 = v40 + v41 + 8LL * *(unsigned int *)(v18 + 125);
              break;
            default:
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 67109120;
                v48[0] = v38;
                _os_log_impl( &dword_186981000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Unknown message type: %u",  buf,  8u);
                uint64_t v42 = 0LL;
                unsigned int v30 = __size;
              }

              else
              {
                uint64_t v42 = 0LL;
              }

              break;
          }

          if (v42 == v30)
          {
            int v43 = *v18;
            if (v43 == 2)
            {
              (*(void (**)(uint64_t, unsigned __int8 *))(v1 + 16))(v1, v18);
              free(v18);
              return;
            }

            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            *(_DWORD *)__int128 buf = 67109120;
            v48[0] = v43;
            char v31 = (os_log_s *)MEMORY[0x1895F8DA0];
            uint64_t v32 = "Received unknown message version: %hhu";
            uint32_t v33 = 8;
          }

          else
          {
            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            *(_DWORD *)__int128 buf = 67109376;
            v48[0] = v30;
            LOWORD(v48[1]) = 2048;
            *(void *)((char *)&v48[1] + 2) = v42;
            char v31 = (os_log_s *)MEMORY[0x1895F8DA0];
            uint64_t v32 = "Got message of size %u but expected size %zu";
            uint32_t v33 = 18;
          }
        }

        else
        {
          if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_26;
          }
          *(_WORD *)__int128 buf = 0;
          char v31 = (os_log_s *)MEMORY[0x1895F8DA0];
          uint64_t v32 = "Failed to receive stream message: remote side closed connection";
          uint32_t v33 = 2;
        }
      }

      _os_log_impl(&dword_186981000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, v33);
      goto LABEL_26;
    }

    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    uint64_t v34 = __error();
    uint64_t v35 = strerror(*v34);
    *(_DWORD *)__int128 buf = 67109378;
    v48[0] = v17;
    LOWORD(v48[1]) = 2080;
    *(void *)((char *)&v48[1] + 2) = v35;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v8 = "Failed to allocate message of size %d: %s";
    uint32_t v9 = 18;
LABEL_24:
    _os_log_impl(&dword_186981000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    goto LABEL_25;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    v48[0] = v17;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v8 = "Got a message size that's too small to be an OTRActivityStreamMessage: %u";
    goto LABEL_23;
  }

uint64_t __OTRCreateActivityStreamForPID_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 24LL));
}

void __logdev_stream_events_block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_186981000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Canceling stream\n", v2, 2u);
  }

  OTRCancelAndFreeActivityStream(*(void *)(a1 + 32));
}

void OTRCancelAndFreeActivityStream(uint64_t a1)
{
  if (a1)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __OTRCancelAndFreeActivityStream_block_invoke;
    block[3] = &__block_descriptor_tmp_56_2549;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }

void __OTRCancelAndFreeActivityStream_block_invoke(uint64_t a1)
{
  id v2 = *(CFTypeRef **)(a1 + 32);
  if (*v2)
  {
    CFRelease(*v2);
    id v2 = *(CFTypeRef **)(a1 + 32);
  }

  *id v2 = 0LL;
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8LL));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  free(*(void **)(a1 + 32));
}

void __OTRStartLegacyStreaming_block_invoke(void *a1)
{
  id v2 = (dispatch_source_s *)a1[6];
  int64_t data = dispatch_source_get_data(v2);
  if (data <= 0)
  {
    dispatch_source_cancel(v2);
  }

  else
  {
    int64_t v4 = data;
    int v5 = (char *)_os_trace_malloc();
    (*(void (**)(void, char *, int64_t))(mobdevtab + 8))(a1[7], v5, v4);
    int v6 = &v5[v4];
    uint64_t v7 = *(void *)(a1[5] + 8LL);
    uint64_t v8 = v5;
    if (*(_BYTE *)(v7 + 24))
    {
      uint64_t v8 = &v5[strlen(v5) + 1];
      *(_BYTE *)(v7 + 24) = 0;
    }

    if (v8 < v6)
    {
      unint64_t v9 = (unint64_t)(v6 - 1);
      while (1)
      {
        size_t v10 = strlen(v8);
        if (*v8) {
          break;
        }
LABEL_28:
        v8 += v10 + 1;
        if (v8 >= v6) {
          goto LABEL_33;
        }
      }

      int v11 = v8 - 1;
      do
        int v12 = *(unsigned __int8 *)++v11;
      while (v12 == 10);
      if (v11 < v6)
      {
        int v13 = strptime(v11, "%b %d %H:%M:%S ", &v39);
        time_t v14 = mktime(&v39);
        uint64_t v15 = 0LL;
        if (!v13) {
          goto LABEL_27;
        }
        time_t v16 = v14;
        unint64_t v17 = strchr(v13, 32);
        uint64_t v15 = 0LL;
        if (!v17) {
          goto LABEL_27;
        }
        *unint64_t v17 = 0;
        uint64_t v18 = v17 + 1;
        __int16 v19 = strchr(v17 + 1, 91);
        uint64_t v15 = 0LL;
        if (!v19) {
          goto LABEL_27;
        }
        CFTypeID v20 = v19;
        *__int16 v19 = 0;
        size_t v37 = strlen(v18);
        int v21 = strtol(v20 + 1, &__endptr, 10);
        int v22 = strchr(__endptr, 60);
        uint64_t v15 = 0LL;
        if (!v22) {
          goto LABEL_27;
        }
        int v36 = v21;
        int v23 = v22 + 1;
        uint64_t v24 = strchr(v22 + 1, 62);
        uint64_t v15 = 0LL;
        if (!v24) {
          goto LABEL_27;
        }
        *uint64_t v24 = 0;
        uint64_t v25 = strchr(v24 + 1, 58);
        uint64_t v15 = 0LL;
        signed int v26 = v25 + 1;
        uint64_t v27 = &v25[strlen(v25 + 1) + 1];
        if (v27 < v6)
        {
          char *v27 = 0;
          char __src = (char *)v26;
          size_t v34 = strlen(v26) + 1;
          uint64_t v15 = _os_trace_calloc();
          *(void *)(v15 + 55) = v16;
          *(_DWORD *)(v15 + 63) = 0;
          *(void *)(v15 + 1) = 0x8100000040LL;
          *(_DWORD *)(v15 + 9) = v36;
          if (!strcmp(v23, "Info"))
          {
            uint64_t v32 = OTRParseLegacyLogLine_trace_id_counter++;
            uint64_t v31 = (v32 << 32) | 0x104;
          }

          else
          {
            int v28 = strcmp(v23, "Debug");
            uint64_t v29 = OTRParseLegacyLogLine_trace_id_counter++;
            uint64_t v30 = v29 << 32;
            if (v28) {
              uint64_t v31 = v30 | 4;
            }
            else {
              uint64_t v31 = v30 | 0x204;
            }
          }

          *(void *)(v15 + 67) = v31;
          *(_WORD *)(v15 + 37) = v37 + 1;
          uint32_t v33 = strncpy((char *)(v15 + 129), v18, v37 + 1);
          *(_DWORD *)(v15 + 109) = v34;
          strncpy(&v33[v37 + 1], __src, v34);
          goto LABEL_27;
        }
      }

      uint64_t v15 = 0LL;
LABEL_27:
      (*(void (**)(void))(a1[4] + 16LL))();
      free((void *)v15);
      goto LABEL_28;
    }

uint64_t __OTRStartLegacyStreaming_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 24LL));
}

void sub_1869BDDF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1869BE61C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

id _dataForUUID(void *a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  [a1 getUUIDBytes:v2];
  [MEMORY[0x189603F48] dataWithBytes:v2 length:16];
  return (id)objc_claimAutoreleasedReturnValue();
}

id _dictForTimeval(uint64_t a1)
{
  v7[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"sec";
  [MEMORY[0x189607968] numberWithLong:*(void *)a1];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = @"usec";
  v7[0] = v2;
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 8)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:2];
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _dictForTimezone(unsigned int *a1)
{
  v7[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"mw";
  [MEMORY[0x189607968] numberWithInt:*a1];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = @"dt";
  v7[0] = v2;
  [MEMORY[0x189607968] numberWithInt:a1[1]];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:2];
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _dictArrayForBacktrace(void *a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  [MEMORY[0x189603FA8] array];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  int v13 = v1;
  [v1 frames];
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        v19[0] = @"iu";
        [v7 imageUUID];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        _dataForUUID(v8);
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = @"io";
        v20[0] = v9;
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v7, "imageOffset"));
        size_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v10;
        [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
        int v11 = (void *)objc_claimAutoreleasedReturnValue();

        [v2 addObject:v11];
        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v4);
  }

  return v2;
}

id _dictForLossCount(unint64_t a1)
{
  v7[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"c";
  [MEMORY[0x189607968] numberWithUnsignedInt:a1];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = @"s";
  v7[0] = v2;
  [MEMORY[0x189607968] numberWithBool:HIDWORD(a1) & 1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:2];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1869C0F98(void *a1)
{
}

void sub_1869C0FB8(_Unwind_Exception *a1)
{
}

uint64_t _repack_compact_add_iov(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 104);
  if (v4 == *(_DWORD *)(result + 108))
  {
    unsigned int v5 = 2 * v4;
    if (v5 <= 0x10) {
      unsigned int v5 = 16;
    }
    *(_DWORD *)(result + 10_Block_object_dispose(va, 8) = v5;
    uint64_t result = _os_trace_realloc();
    *(void *)(v3 + 96) = result;
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

  uint64_t v9 = *(void *)(v3 + 96);
  uint64_t v10 = *(unsigned int *)(v3 + 104);
  *(_DWORD *)(v3 + 104) = v10 + 1;
  int v11 = (void *)(v9 + 16 * v10);
  *int v11 = a2;
  v11[1] = v8;
  *(_DWORD *)(v3 + 112) += v8;
  return result;
}

void _repack_context_cleanup(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 104) >= 2u)
  {
    unint64_t v2 = 1LL;
    uint64_t v3 = 16LL;
    do
    {
      free(*(void **)(*(void *)(a1 + 96) + v3));
      ++v2;
      v3 += 16LL;
    }

    while (v2 < *(unsigned int *)(a1 + 104));
  }

  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 120));
}

uint64_t _repack_ttl_compact_close_catalog(uint64_t a1, void *a2)
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)(a1 + 128)) {
    _repack_ttl_compact_flush_chunkset();
  }
  int v4 = *(_DWORD *)(a1 + 116);
  if (v4 + 1 == *(_DWORD *)(a1 + 104)) {
    goto LABEL_86;
  }
  uint64_t v5 = *(void *)(a1 + 80);
  if (*(void *)(v5 + 80)) {
    uint64_t v6 = **(void ***)(*(void *)(v5 + 72) + 8LL);
  }
  else {
    uint64_t v6 = _catalog_subchunk_entry_alloc(v5);
  }
  unint64_t v8 = v6[2];
  unint64_t v7 = v6[3];
  if (v8 < *(void *)(a1 + 8)) {
    *(void *)(a1 + _Block_object_dispose(va, 8) = v8;
  }
  if (v7 > *(void *)(a1 + 16)) {
    *(void *)(a1 + 16) = v7;
  }
  uint64_t v9 = *(void ***)(a1 + 80);
  uint64_t v10 = MEMORY[0x1895F87A8];
  if (*(_BYTE *)(*(void *)(a1 + 192) + 24LL))
  {
    int v11 = v9[2];
    v81[0] = MEMORY[0x1895F87A8];
    v81[1] = 3221225472LL;
    uint64_t v82 = ___repack_ttl_compact_close_catalog_block_invoke;
    char v83 = &__block_descriptor_40_e16_v24__0_16C_8_v16l;
    uint64_t v84 = a1;
    int v12 = (void *)v11[2];
    if (v12)
    {
      do
      {
        ((void (*)(void *, void *, void))v82)(v81, v12 + 2, v12[4]);
        int v12 = (void *)*v12;
      }

      while (v12);
      uint64_t v9 = *(void ***)(a1 + 80);
    }

    int v13 = v9[5];
    v77[0] = v10;
    v77[1] = 3221225472LL;
    uint64_t v78 = ___repack_ttl_compact_close_catalog_block_invoke_2;
    uint64_t v79 = &__block_descriptor_40_e9_v16__0_v8l;
    uint64_t v80 = a1;
    if (v13)
    {
      time_t v14 = (void *)v13[2];
      if (v14)
      {
        do
        {
          v78((uint64_t)v77, v14[4]);
          time_t v14 = (void *)*v14;
        }

        while (v14);
        uint64_t v9 = *(void ***)(a1 + 80);
      }
    }
  }

  unint64_t v15 = (unint64_t)v9[2];
  if (v15) {
    unint64_t v15 = *(void *)(v15 + 24);
  }
  uint64_t v16 = 16 * v15 + 40;
  if (v15 >> 60 || 16 * v15 >= 0xFFFFFFFFFFFFFFD8LL)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_91;
  }

  unint64_t v17 = (unint64_t)v9[4];
  unint64_t v18 = (v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  BOOL v19 = __CFADD__(v16, v18);
  unint64_t v20 = v16 + v18;
  if (v19)
  {
LABEL_91:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_92;
  }

  unint64_t v21 = (unint64_t)v9[6];
  if (v21 >> 60)
  {
LABEL_92:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_93;
  }

  unint64_t v22 = (unint64_t)v9[7];
  if (!is_mul_ok(v22, 6uLL))
  {
LABEL_93:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_94:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_95;
  }

  unint64_t v23 = (unint64_t)v9[5];
  if (v23) {
    unint64_t v24 = *(void *)(v23 + 24);
  }
  else {
    unint64_t v24 = 0LL;
  }
  if (!is_mul_ok(v24, 0x38uLL)) {
    goto LABEL_94;
  }
  uint64_t v25 = 16 * v21;
  uint64_t v26 = 56 * v24;
  BOOL v19 = __CFADD__(v26, v25);
  uint64_t v27 = v26 + v25;
  if (v19)
  {
LABEL_95:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_96;
  }

  uint64_t v28 = 6 * v22;
  BOOL v19 = __CFADD__(v27, v28);
  unint64_t v29 = v27 + v28;
  if (v19)
  {
LABEL_96:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_97:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_98:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_99;
  }

  if ((v29 & 6) != 0) {
    unint64_t v29 = (v29 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  }
  BOOL v19 = __CFADD__(v29, v20);
  unint64_t v30 = v29 + v20;
  if (v19) {
    goto LABEL_97;
  }
  if (v23) {
    unint64_t v23 = *(void *)(v23 + 24);
  }
  unint64_t v31 = 2 * v23 + 32;
  if ((v23 & 0x8000000000000000LL) != 0 || 2 * v23 >= 0xFFFFFFFFFFFFFFE0LL) {
    goto LABEL_98;
  }
  uint64_t v32 = 2 * v23 + 40;
  if (v31 >= 0xFFFFFFFFFFFFFFF8LL)
  {
LABEL_99:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_100:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_101:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_102:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_103:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

  BOOL v19 = __CFADD__(v32, 2 * v17);
  unint64_t v33 = v32 + 2 * v17;
  int v34 = v19;
  if ((v17 & 0x8000000000000000LL) != 0 || v34) {
    goto LABEL_100;
  }
  unint64_t v35 = (v33 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  if ((v33 & 6) == 0) {
    unint64_t v35 = v33;
  }
  unint64_t v36 = (unint64_t)v9[10];
  BOOL v37 = !is_mul_ok(v36, v35);
  unint64_t v38 = v36 * v35;
  unint64_t v39 = v30 + v38;
  BOOL v40 = __CFADD__(v30, v38);
  if (v37 || v40) {
    goto LABEL_101;
  }
  unint64_t v41 = (void *)_os_trace_calloc();
  uint64_t v42 = v41;
  *unint64_t v41 = 0x110000600BLL;
  v41[1] = 0LL;
  v41[4] = v9[1];
  int v43 = (char *)v41 + v39;
  unint64_t v44 = (char *)(v41 + 5);
  uint64_t v85 = v41 + 5;
  int v45 = v9[2];
  if (v45) {
    uint64_t v46 = 16LL * v45[3];
  }
  else {
    uint64_t v46 = 0LL;
  }
  if (&v43[-v46] < v44) {
    goto LABEL_60;
  }
  uint64_t v76 = (char *)(v41 + 2);
  uint64_t v86 = v10;
  uint64_t v87 = 0x40000000LL;
  uint64_t v88 = __catalog_chunk_unparse_uuid_block_invoke;
  uint64_t v89 = &__block_descriptor_tmp_76;
  uint64_t v90 = &v85;
  uint64_t v47 = (void *)v45[2];
  unint64_t v48 = (char *)(v41 + 5);
  if (v47)
  {
    do
    {
      ((void (*)(uint64_t *, void *, void))v88)(&v86, v47 + 2, v47[4]);
      uint64_t v47 = (void *)*v47;
    }

    while (v47);
    unint64_t v48 = (char *)v85;
  }

  uint64_t v49 = &v48[v46];
  uint64_t v85 = v49;
  *(_WORD *)uint64_t v76 = (_WORD)v49 - (_WORD)v44;
  if (v43 - (_BYTE *)v9[4] < (unint64_t)v49)
  {
LABEL_60:
    free(v42);
    uint64_t v42 = 0LL;
    int64_t v50 = MEMORY[8];
    uint64_t v51 = MEMORY[8] + 16LL;
    goto LABEL_78;
  }

  uint64_t v52 = (uint64_t)v9[3];
  uint64_t v86 = v10;
  uint64_t v87 = 0x40000000LL;
  uint64_t v88 = __catalog_chunk_unparse_subsystem_block_invoke;
  uint64_t v89 = &__block_descriptor_tmp_78;
  uint64_t v90 = v9;
  uint64_t v91 = &v85;
  _os_trace_str_map_for_each(v52, (uint64_t)&v86);
  uint64_t v85 = (char *)v9[4] + (void)v85;
  size_t v53 = (((unint64_t)v85 + 7) & 0xFFFFFFFFFFFFFFF8LL) - (void)v85;
  bzero(v85, v53);
  __int16 v54 = (char *)v85 + v53;
  uint64_t v85 = v54;
  uint64_t v55 = v54 - v44;
  *((_WORD *)v42 + 9) = (_WORD)v54 - (_WORD)v44;
  unint64_t v56 = v9[5];
  if (v56) {
    __int16 v57 = v56[12];
  }
  else {
    __int16 v57 = 0;
  }
  *((_WORD *)v42 + 10) = v57;
  uint64_t v86 = v10;
  uint64_t v87 = 0x40000000LL;
  uint64_t v88 = __catalog_chunk_unparse_procinfo_block_invoke;
  uint64_t v89 = &__block_descriptor_tmp_79;
  uint64_t v90 = v9;
  uint64_t v91 = &v85;
  uint64_t v92 = v43;
  if (v56)
  {
    unint64_t v58 = (void *)*((void *)v56 + 2);
    if (v58)
    {
      do
      {
        ((void (*)(uint64_t *, void))v88)(&v86, v58[4]);
        unint64_t v58 = (void *)*v58;
      }

      while (v58);
      __int16 v54 = (char *)v85;
      uint64_t v55 = (_BYTE *)v85 - v44;
    }
  }

  *((_WORD *)v42 + 11) = v55;
  *((_WORD *)v42 + 12) = 0;
  unint64_t v59 = v9[8];
  if (v59)
  {
    do
    {
      int v60 = *((_DWORD *)v59 + 8);
      if (v60)
      {
        *(_OWORD *)__int16 v54 = *((_OWORD *)v59 + 1);
        *((_DWORD *)v54 + 4) = v60;
        *((_DWORD *)v54 + 5) = *((_DWORD *)v59 + 9);
        unint64_t v61 = v54 + 24;
        uint64_t v85 = v54 + 24;
        if ((unint64_t)(v43 - (v54 + 24)) > 3)
        {
          *((_DWORD *)v54 + 6) = *(_DWORD *)(*((void *)v59 + 6) + 4LL);
          uint64_t v85 = v54 + 28;
          uint64_t v62 = (unsigned int *)*((void *)v59 + 6);
          uint64_t v63 = MEMORY[0x1895F87A8];
          uint64_t v86 = MEMORY[0x1895F87A8];
          uint64_t v87 = 0x40000000LL;
          uint64_t v88 = __catalog_chunk_unparse_subchunk_procinfos_block_invoke;
          uint64_t v89 = &__block_descriptor_tmp_82;
          uint64_t v90 = &v85;
          hashtable_iterate(v62, (uint64_t)&v86);
          unint64_t v61 = (char *)v85;
          if ((unint64_t)(v43 - (_BYTE *)v85) >= 4)
          {
            *(_DWORD *)uint64_t v85 = *(_DWORD *)(*((void *)v59 + 5) + 4LL);
            uint64_t v85 = v61 + 4;
            uint64_t v86 = v63;
            unsigned __int16 v64 = (unsigned int *)*((void *)v59 + 5);
            uint64_t v87 = 0x40000000LL;
            uint64_t v88 = __catalog_chunk_unparse_subchunk_subcats_block_invoke;
            uint64_t v89 = &__block_descriptor_tmp_83;
            uint64_t v90 = &v85;
            hashtable_iterate(v64, (uint64_t)&v86);
            unint64_t v61 = (char *)v85;
          }
        }

        ++*((_WORD *)v42 + 12);
        size_t v65 = ((unint64_t)(v61 + 7) & 0xFFFFFFFFFFFFFFF8LL) - (void)v61;
        bzero(v61, v65);
        __int16 v54 = (char *)v85 + v65;
        uint64_t v85 = (char *)v85 + v65;
      }

      unint64_t v59 = *(void **)v59;
    }

    while (v59);
    uint64_t v55 = v54 - v44;
  }

  if (v55 >= 0x10000) {
    goto LABEL_102;
  }
  int64_t v50 = v54 - v76;
  v42[1] = v50;
  uint64_t v51 = v50 + 16;
  if (v50 + 16 > v39) {
    goto LABEL_103;
  }
LABEL_78:
  if ((v50 & 7) != 0) {
    unint64_t v66 = (v50 & 0xFFFFFFFFFFFFFFF8LL) + 24;
  }
  else {
    unint64_t v66 = v51;
  }
  uint64_t v67 = (void *)(*(void *)(a1 + 96) + 16LL * *(unsigned int *)(a1 + 116));
  *uint64_t v67 = v42;
  v67[1] = v66;
  *(_DWORD *)(a1 + 112) += v66;
  uint64_t v68 = _os_trace_writev();
  if (v68 != -1)
  {
    *(void *)(a1 + 184) += v68;
    if (*(_DWORD *)(a1 + 104) >= 2u)
    {
      uint64_t v69 = *(void *)(a1 + 96);
      unint64_t v70 = 1LL;
      uint64_t v71 = 16LL;
      do
      {
        free(*(void **)(v69 + v71));
        uint64_t v69 = *(void *)(a1 + 96);
        int v72 = (void *)(v69 + v71);
        ++v70;
        *int v72 = 0LL;
        v72[1] = 0LL;
        v71 += 16LL;
      }

      while (v70 < *(unsigned int *)(a1 + 104));
    }

    *(_DWORD *)(a1 + 112) = 0;
    int v4 = 1;
LABEL_86:
    *(_DWORD *)(a1 + 104) = v4;
    _catalog_destroy(*(void *)(a1 + 24));
    _catalog_destroy(*(void *)(a1 + 80));
    *(void *)(a1 + 80) = 0LL;
    *(void *)(a1 + 24) = 0LL;
    uint64_t result = 1LL;
    *(void *)(a1 + 40) = 0LL;
    return result;
  }

  uint64_t v74 = __error();
  if (!a2) {
    return 0LL;
  }
  create_repack_error(*v74, @"Failed to write file data to temp file");
  id v75 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t result = 0LL;
  *a2 = v75;
  return result;
}

void _repack_ttl_compact_flush_chunkset()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v1 = dst_buffer;
  int v2 = 256;
  size_t v3 = compression_encode_buffer( dst_buffer,  0x10000uLL,  *(const uint8_t **)(v0 + 120),  *(unsigned int *)(v0 + 128),  0LL,  COMPRESSION_LZ4);
  if (v3)
  {
    size_t v4 = v3;
  }

  else
  {
    int v2 = 0;
    id v1 = *(uint8_t **)(v0 + 120);
    size_t v4 = *(unsigned int *)(v0 + 128);
  }

  uint64_t v5 = (void *)_os_trace_malloc();
  uint64_t v6 = (uint64_t)v5;
  if ((v4 & 7) != 0) {
    *(void *)((char *)v5 + ((v4 + 16) & 0xFFFFFFFFFFFFFFF8LL)) = 0LL;
  }
  void *v5 = 0x110000600DLL;
  v5[1] = v4;
  memcpy(v5 + 2, v1, v4);
  _repack_compact_add_iov(v0, v6);
  uint64_t v7 = *(void *)(v0 + 80);
  int v8 = *(_DWORD *)(v0 + 128);
  if (*(void *)(v7 + 80))
  {
    uint64_t v9 = **(void ***)(*(void *)(v7 + 72) + 8LL);
  }

  else
  {
    uint64_t v9 = _catalog_subchunk_entry_alloc(v7);
    uint64_t v7 = *(void *)(v0 + 80);
  }

  *((_DWORD *)v9 + _Block_object_dispose(va, 8) = v8;
  *((_DWORD *)v9 + 9) = v2;
  _catalog_subchunk_entry_alloc(v7);
  bzero(*(void **)(v0 + 120), *(unsigned int *)(v0 + 132));
  *(_DWORD *)(v0 + 12_Block_object_dispose(va, 8) = 0;
}

void ___repack_ttl_compact_close_catalog_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v3];
}

void ___repack_ttl_compact_close_catalog_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2 + 40];
  size_t v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2 + 24];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v4];
  uint64_t v5 = *(unsigned int **)(a2 + 56);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = ___repack_ttl_compact_close_catalog_block_invoke_3;
  void v7[3] = &__block_descriptor_40_e13_v24__0_v8_v16l;
  void v7[4] = *(void *)(a1 + 32);
  hashtable_iterate(v5, (uint64_t)v7);
}

id create_repack_error(int a1, void *a2)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *MEMORY[0x1896075E0];
  v9[0] = a2;
  id v3 = (void *)MEMORY[0x189603F68];
  id v4 = a2;
  [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607870] errorWithDomain:@"LogRepackErrorDomain" code:a1 userInfo:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void ___repack_ttl_compact_close_catalog_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3 + 16];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 192) + 32) addObject:v4];
}

uint64_t _repack_ttl_compact_open_catalog(uint64_t a1, uint64_t a2)
{
  uint64_t result = _catalog_create_with_chunk(a2, 0);
  *(void *)(a1 + 24) = result;
  if (result)
  {
    *(void *)(a1 + 40) = *(void *)(result + 64);
    *(_DWORD *)(a1 + 116) = *(_DWORD *)(a1 + 104);
    _repack_compact_add_iov(a1, 0LL);
    uint64_t result = (uint64_t)_catalog_create();
    *(void *)(a1 + 80) = result;
    unint64_t v4 = *(void *)(*(void *)(a1 + 24) + 8LL);
    if (*(void *)(result + 8) > v4) {
      *(void *)(result + _Block_object_dispose(va, 8) = v4;
    }
  }

  return result;
}

uint64_t _compact_chunkset()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  int v2 = v1;
  uint64_t v139 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = v0;
  uint64_t v164 = *MEMORY[0x1895F89C0];
  id v8 = v7;
  int v9 = *(_DWORD *)v6;
  if (*(int *)v6 <= 24587)
  {
    if ((v9 - 24578) < 3)
    {
LABEL_3:
      unsigned int v10 = *(_DWORD *)(v6 + 24);
      uint64_t v11 = *(void *)(v6 + 16);
      *(void *)(v5 + 32) = 0LL;
      int v12 = _os_procinfo_map_lookup(*(void **)(*(void *)(v5 + 24) + 40LL), v11, v10);
      *(void *)(v5 + 32) = v12;
      goto LABEL_4;
    }

    if (v9 != 24577) {
      goto LABEL_146;
    }
    unint64_t v82 = *(void *)(v6 + 8);
    unint64_t v83 = v82 - 16;
    if (v82 < 0x10)
    {
LABEL_107:
      *(void *)(v5 + 4_Block_object_dispose(va, 8) = 0LL;
      [NSString stringWithFormat:@"Warning: chunk with chunkset_start_addr and id: %p, %@ was unreadable!", v139, v8];
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v85 = (FILE *)*MEMORY[0x1895F89D0];
      id v86 = v84;
      fprintf(v85, "%s\n", (const char *)[v86 UTF8String]);
      goto LABEL_161;
    }

    uint64_t v121 = v6 + 32;
    if (v82 - 4113 >= 0xFFFFFFFFFFFFF00FLL)
    {
      unint64_t v122 = *(unsigned __int16 *)(v6 + 32);
      if (v83 < v122) {
        goto LABEL_107;
      }
      uint64_t v123 = *(unsigned __int16 *)(v6 + 34);
      if (v123 <= 0xFFF)
      {
        if (*(_BYTE *)(v6 + 29))
        {
          if (v83 <= v122 + (unsigned __int16)(4096 - v123))
          {
            *(void *)(v5 + 56) = v121 + v122;
            *(void *)(v5 + 64) = (unsigned __int16)(4096 - v123);
LABEL_166:
            *(void *)(v5 + 4_Block_object_dispose(va, 8) = v121;
            goto LABEL_3;
          }
        }

        else if (v83 == 4096)
        {
          *(void *)(v5 + 56) = v121 + v123;
          *(void *)(v5 + 64) = (unsigned __int16)(4096 - v123);
          goto LABEL_166;
        }
      }
    }

    *(void *)(v5 + 56) = 0LL;
    *(void *)(v5 + 64) = 0LL;
    goto LABEL_166;
  }

  if (v9 == 24588)
  {
    int v81 = *(unsigned __int8 *)(v6 + 29);
  }

  else
  {
    if (v9 != 24592) {
      goto LABEL_146;
    }
    int v81 = 0;
  }

  uint64_t v114 = *(void *)(v6 + 16);
  *(void *)(v5 + 32) = 0LL;
  uint64_t v115 = *(void *)(*(void *)(v5 + 24) + 40LL);
  if (!v115) {
    goto LABEL_145;
  }
  v116 = (void *)(v115 + 16);
  do
  {
    v116 = (void *)*v116;
    if (!v116) {
      goto LABEL_145;
    }
  }

  while (v116[2] != v114);
  int v12 = (void *)v116[4];
  *(void *)(v5 + 32) = v12;
  if (v12) {
    BOOL v117 = v81 == 0;
  }
  else {
    BOOL v117 = 1;
  }
  if (v117)
  {
LABEL_4:
    if (v12) {
      goto LABEL_5;
    }
LABEL_145:
    *(void *)(v5 + 4_Block_object_dispose(va, 8) = 0LL;
LABEL_146:
    [NSString stringWithFormat:@"ERROR: unpacking chunk with chunkset_start_addr and id: %p, %@ was unsuccessful", v139, v8];
    id v86 = (id)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      create_repack_error(65, v86);
      uint64_t v120 = 0LL;
      *int v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v120 = 0LL;
    }

    goto LABEL_162;
  }

  int v118 = *((__int16 *)v12 + 1);
  if (v118 < 0)
  {
    __int16 v119 = v118 & 0x7FFF;
    *((_WORD *)v12 + 1) = v119;
    if (v81 == 4) {
      *((_WORD *)v12 + 1) = v119 | 1;
    }
  }

LABEL_5:
  uint64_t v13 = *(void *)(v6 + 8);
  if ((v13 & 7) != 0) {
    unsigned int v14 = (v13 & 0xFFFFFFF8) + 24;
  }
  else {
    unsigned int v14 = v13 + 16;
  }
  if (*(_DWORD *)(v5 + 128) + v14 > *(_DWORD *)(v5 + 132)) {
    _repack_ttl_compact_flush_chunkset();
  }
  int v15 = *(_DWORD *)v6;
  id v138 = v8;
  if (v15 != 24577)
  {
    if ((*(_DWORD *)v6 - 24579) <= 1)
    {
      objc_msgSend(v138, "stringByAppendingFormat:", @"-%llu", v6 - v139);
      uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)v6 == 24580) {
        uint64_t v88 = (void *)(v6 + 56);
      }
      else {
        uint64_t v88 = (void *)(v6 + 48);
      }
      uint64_t v89 = _os_trace_uuid_map_lookup(*(void **)(*(void *)(v5 + 192) + 16LL), v88);
      unint64_t v90 = *(void *)(v6 + 32);
      _OSLogEventUnpackChunk_2919((void *)v6, *(void *)(v5 + 24), (uint64_t)&v141);
      uint64_t v91 = *(void *)(v5 + 40);
      unint64_t v93 = *(void *)(v91 + 16);
      size_t v92 = *(void *)(v91 + 24);
      __int128 v158 = v141;
      if (v93 <= v90) {
        unint64_t v93 = v90;
      }
      if (v93 < v92) {
        size_t v92 = v93;
      }
      uint64_t v95 = *(void *)(v5 + 160);
      uint64_t v94 = *(void *)(v5 + 168);
      uint64_t v96 = *(void *)(v5 + 24);
      LODWORD(__n) = 3;
      size_t v152 = v92;
      __int16 v153 = 0;
      uint64_t v154 = v94;
      uint64_t v155 = v6 - v139;
      uint64_t v156 = v95;
      uint64_t v157 = v96;
      __int128 v159 = v142;
      uint64_t v160 = v143;
      uint64_t v161 = 0LL;
      if ([**(id **)(v5 + 192) _setLogEvent:&__n rangeUUIDIndex:v89 machTimebase:*(void *)(v5 + 192) + 8 traceFilename:&stru_189F108F0])
      {
        if (((*(uint64_t (**)(void))(*(void *)(v5 + 136) + 16LL))() & 1) != 0)
        {

          goto LABEL_119;
        }

        ++*(void *)(v5 + 152);
      }

      goto LABEL_160;
    }

LABEL_119:
    memcpy((void *)(*(void *)(v5 + 120) + *(unsigned int *)(v5 + 128)), (const void *)v6, v14);
    *(_DWORD *)(v5 + 128) += v14;
    _catalog_subchunk_update_times(*(void *)(v5 + 80), *(void *)(v6 + 32));
    uint64_t v97 = _catalog_procinfo_create(*(void *)(v5 + 80), *(void *)(v5 + 32));
    *(void *)(v5 + 72) = v97;
    _catalog_subchunk_procinfo_add(*(void *)(v5 + 80), v97);
    *(void *)(v5 + 72) = 0LL;
    *(void *)(v5 + 32) = 0LL;
    goto LABEL_160;
  }

  uint64_t v137 = v6;
  id v130 = v8;
  uint64_t v16 = *(size_t **)(v5 + 48);
  size_t v152 = v16[1];
  size_t v17 = *v16;
  LODWORD(v17) = 268435472;
  size_t __n = v17;
  *(void *)(v5 + 8_Block_object_dispose(va, 8) = &__n;
  unint64_t v18 = v16 + 2;
  uint64_t v19 = *(unsigned __int16 *)v16;
  unint64_t v20 = (char *)v16 + v19;
  else {
    unint64_t v21 = (unint64_t)v20;
  }
  while (1)
  {
    unint64_t v22 = v18 + 3;
    unint64_t v23 = v18;
    size_t v24 = v18[2];
    uint64_t v25 = HIWORD(v24);
    if ((v24 & 0x7000000000000LL) != 0) {
      uint64_t v27 = (HIWORD(v24) & 0xFFF8) + 32LL;
    }
    else {
      uint64_t v27 = v25 + 24;
    }
    unint64_t v18 = (size_t *)((char *)v18 + v27);
    if (*v23)
    {
      context = (void *)MEMORY[0x186E40118]();
      objc_msgSend(v138, "stringByAppendingFormat:", @"-%llu", (char *)v23 - v139);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      int v29 = *(unsigned __int8 *)v23;
      unint64_t v30 = (v23[2] & 0xFFFFFFFFFFFFLL) + *(void *)(*(void *)(v5 + 48) + 8LL);
      _OSLogEventUnpackChunk_2919((void *)v137, *(void *)(v5 + 24), (uint64_t)v162);
      uint64_t v31 = *(void *)(v5 + 40);
      unint64_t v33 = *(void *)(v31 + 16);
      unint64_t v32 = *(void *)(v31 + 24);
      if (v33 <= v30) {
        unint64_t v33 = v30;
      }
      if (v33 < v32) {
        unint64_t v32 = v33;
      }
      uint64_t v35 = *(void *)(v5 + 160);
      uint64_t v34 = *(void *)(v5 + 168);
      uint64_t v36 = *(void *)(v5 + 24);
      LODWORD(v141) = 3;
      *((void *)&v141 + 1) = v32;
      LOWORD(v142) = 0;
      *((void *)&v142 + 1) = v34;
      size_t v143 = (char *)v23 - v139;
      uint64_t v144 = v35;
      uint64_t v145 = v36;
      __int128 v146 = *(_OWORD *)v162;
      __int128 v147 = *(_OWORD *)&v162[16];
      uint64_t v148 = v163;
      uuid_string_t v149 = v23;
      if (!objc_msgSend( **(id **)(v5 + 192),  "_setLogEvent:rangeUUIDIndex:machTimebase:traceFilename:",  &v141,  _os_trace_uuid_map_lookup(*(void **)(*(void *)(v5 + 192) + 16), v22),  *(void *)(v5 + 192) + 8,  &stru_189F108F0)) {
        goto LABEL_100;
      }
      if (((*(uint64_t (**)(void))(*(void *)(v5 + 136) + 16LL))() & 1) == 0)
      {
        ++*(void *)(v5 + 152);
        goto LABEL_100;
      }

      __int16 v37 = *((_WORD *)v23 + 1);
      if ((v37 & 1) != 0)
      {
        if (!(v23[2] >> 51)) {
          goto LABEL_100;
        }
        unint64_t v136 = 8LL;
        if ((v37 & 0x10) == 0) {
          goto LABEL_37;
        }
      }

      else
      {
        unint64_t v136 = 0LL;
        if ((v37 & 0x10) == 0) {
          goto LABEL_37;
        }
      }

      v136 += 8LL;
LABEL_37:
      if (v29 == 2)
      {
        if ((*((_WORD *)v23 + 1) & 0x200) != 0)
        {
          unint64_t v38 = v136 + 8;
        }

        else
        {
          unint64_t v38 = v136;
        }

        if (*((_BYTE *)v23 + 1) == 1)
        {
          v38 += 8LL;
        }

        LODWORD(v134) = 0;
        unint64_t v135 = 0LL;
        goto LABEL_46;
      }

      if ((*((_WORD *)v23 + 1) & 0x100) == 0)
      {
        LODWORD(v134) = 0;
        unint64_t v135 = 0LL;
        unint64_t v38 = v136;
LABEL_46:
        unint64_t v136 = 0LL;
        goto LABEL_47;
      }

      unint64_t v38 = v136 + 4;
      uint64_t v134 = WORD1(v22[v136 / 8]);
      unint64_t v135 = LOWORD(v22[v136 / 8]);
      if (v134 + v135 > 0x1000 || 4096LL - *(void *)(v5 + 64) > v135) {
        goto LABEL_100;
      }
LABEL_47:
      uint64_t v39 = *(void *)(v5 + 32);
      if ((*(_WORD *)(v39 + 2) & 1) != 0) {
        unsigned int v40 = 4;
      }
      else {
        unsigned int v40 = 6;
      }
      switch(v37 & 0xE)
      {
        case 2:
        case 4:
        case 6:
          unsigned int v40 = 4;
          break;
        case 8:
          break;
        case 0xA:
          unsigned int v40 = 20;
          break;
        case 0xC:
          unsigned int v40 = 6;
          break;
        default:
          unsigned int v40 = 0;
          break;
      }

      unint64_t v41 = v38 + v40;
      unint64_t v42 = v23[2];
      if (v41 <= HIWORD(v42) && v40)
      {
        int v43 = (unsigned int *)((char *)v22 + v38);
        if (v40 == 6)
        {
          unint64_t v44 = 0LL;
          unint64_t v45 = (unint64_t)*((unsigned __int16 *)v43 + 2) << 32;
        }

        else
        {
          unint64_t v45 = 0LL;
          unint64_t v44 = v40 == 4 ? 0LL : (uint64_t *)(v43 + 1);
        }

        unint64_t v46 = HIWORD(v42);
        unint64_t v47 = *v43;
        if ((v37 & 0x20) == 0 || (v41 += 2LL, v41 <= v46))
        {
          if (v29 == 2)
          {
            unint64_t v48 = 0LL;
LABEL_77:
            if (!*(void *)(v5 + 72))
            {
              __int16 v129 = (__int16)v22;
              id v132 = v44;
              unint64_t v22 = v48;
              uint64_t v51 = v18;
              unint64_t v52 = v21;
              size_t v53 = (char *)v47;
              uint64_t v54 = _catalog_procinfo_create(*(void *)(v5 + 80), *(void *)(v5 + 32));
              *(void *)(v5 + 72) = v54;
              _catalog_subchunk_procinfo_add(*(void *)(v5 + 80), v54);
              unint64_t v47 = (unint64_t)v53;
              unint64_t v21 = v52;
              unint64_t v18 = v51;
              unint64_t v48 = v22;
              unint64_t v44 = v132;
              LOWORD(v22) = v129;
              __int16 v37 = *((_WORD *)v23 + 1);
            }

            int v55 = v37 & 0xE;
            if (v55 == 10)
            {
              uint64_t v58 = *(void *)(*(void *)(v5 + 80) + 16LL);
              if (v58) {
                uint64_t v59 = *(void *)(v58 + 24);
              }
              else {
                uint64_t v59 = 0LL;
              }
              _os_trace_uuid_map_insert((float *)v58, v44, v59);
            }

            else if (v55 == 8)
            {
              uint64_t v56 = _catalog_procinfo_lookup_pc(*(void *)(v5 + 32), v45 | v47);
              if (v56)
              {
                *(void *)uint64_t v162 = *(void *)(v56 + 8);
                uint64_t v57 = *(void *)v56;
                *(_DWORD *)&v162[8] = *(void *)v56;
                *(_WORD *)&v162[12] = WORD2(v57);
                *(_OWORD *)&v162[14] = *(_OWORD *)(v56 + 16);
                _catalog_procinfo_uuidinfo_add(*(void *)(v5 + 80), *(void *)(v5 + 72), (uint64_t)v162);
              }
            }

            if (v48)
            {
              v133 = v48;
              uint64_t v60 = *(void *)(v5 + 72);
              uint64_t v61 = *(void *)(v5 + 80);
              __int16 v150 = (__int16)v22;
              uint64_t v62 = v60;
              if (!hashtable_lookup(*(void *)(v60 + 64), (uint64_t)&v150))
              {
                uint64_t v126 = v62;
                __int16 v63 = v150;
                __sa = (char *)v48[1];
                uint64_t v125 = (char *)v48[2];
                *(_WORD *)uint64_t v162 = v150;
                uint64_t v64 = _os_trace_calloc();
                *(_WORD *)uint64_t v64 = v63;
                size_t v65 = _os_trace_str_map_entry(*(void **)(v61 + 24), __sa);
                *(void *)(v64 + _Block_object_dispose(va, 8) = v65;
                if (!v65)
                {
                  _os_trace_str_map_insert((void **)(v61 + 24), __sa, *(void *)(v61 + 32));
                  size_t v66 = strlen(__sa);
                  uint64_t v67 = *(void **)(v61 + 24);
                  *(void *)(v61 + 32) += v66 + 1;
                  *(void *)(v64 + _Block_object_dispose(va, 8) = _os_trace_str_map_entry(v67, __sa);
                }

                uint64_t v68 = _os_trace_str_map_entry(*(void **)(v61 + 24), v125);
                *(void *)(v64 + 16) = v68;
                if (!v68)
                {
                  _os_trace_str_map_insert((void **)(v61 + 24), v125, *(void *)(v61 + 32));
                  size_t v69 = strlen(v125);
                  unint64_t v70 = *(void **)(v61 + 24);
                  *(void *)(v61 + 32) += v69 + 1;
                  *(void *)(v64 + 16) = _os_trace_str_map_entry(v70, v125);
                }

                hashtable_insert(*(int **)(v126 + 64), v162, v64);
                ++*(void *)(v61 + 56);
              }

              uint64_t v71 = *(void *)(v5 + 80);
              __int16 v72 = (unsigned __int16)_os_trace_str_map_lookup(*(void **)(v71 + 24), (char *)v133[1]);
              catalog_subchunk_string_insert(v71, v72);
              __int16 v73 = (unsigned __int16)_os_trace_str_map_lookup(*(void **)(v71 + 24), (char *)v133[2]);
              catalog_subchunk_string_insert(v71, v73);
            }

            _catalog_subchunk_update_times(*(void *)(v5 + 80), v30);
            uint64_t v74 = *(unsigned __int16 **)(v5 + 88);
            id v75 = (char *)v74 + *v74;
            unint64_t v76 = v23[2];
            if ((v76 & 0x7000000000000LL) != 0) {
              uint64_t v77 = (HIWORD(v76) & 0xFFF8) + 32;
            }
            else {
              uint64_t v77 = HIWORD(v76) + 24;
            }
            memcpy((char *)v74 + *v74, v23, (unsigned __int16)v77);
            *v74 += v77;
            if ((*((_BYTE *)v23 + 3) & 1) != 0)
            {
              uint64_t v78 = *(void *)(v5 + 64);
              unsigned __int16 v79 = v74[1] - v134;
              v74[1] = v79;
              memcpy((char *)v74 + v79, (const void *)(v78 + *(void *)(v5 + 56) + v135 - 4096), v134);
              uint64_t v80 = &v75[v136];
              *((_WORD *)v80 + 12) = v79;
              *((_WORD *)v80 + 13) = v134;
            }

            goto LABEL_100;
          }

          if ((*((_WORD *)v23 + 1) & 0x200) != 0)
          {
            __s = (char *)*v43;
            id v131 = v44;
            unint64_t v49 = v41 + 2;
            if (v41 + 2 > v46)
            {
              unint64_t v48 = 0LL;
              unint64_t v41 = HIWORD(v42);
            }

            else
            {
              LOWORD(v22) = *(_WORD *)((char *)v22 + v41);
              *(_WORD *)uint64_t v162 = (_WORD)v22;
              uint64_t v50 = hashtable_lookup(*(void *)(v39 + 64), (uint64_t)v162);
              __int16 v37 = *((_WORD *)v23 + 1);
              unint64_t v41 = v49;
              unint64_t v48 = (void *)v50;
            }

            unint64_t v44 = v131;
            unint64_t v47 = (unint64_t)__s;
            if ((v37 & 0x400) == 0) {
              goto LABEL_77;
            }
          }

          else
          {
            unint64_t v48 = 0LL;
            if ((*((_WORD *)v23 + 1) & 0x400) == 0) {
              goto LABEL_77;
            }
          }

          goto LABEL_77;
        }
      }

LABEL_100:
      objc_autoreleasePoolPop(context);
    }
  }

  id v8 = v130;
  if (*(void *)(v5 + 72))
  {
    size_t v98 = (unsigned __int16)__n;
    uint64_t v99 = WORD1(__n);
    unsigned int v100 = (unsigned __int16)__n - WORD1(__n) + 4096;
    BOOL v101 = v100 < 0xFF9;
    if (v100 >= 0xFF9) {
      unsigned int v100 = 4096;
    }
    if (WORD1(__n) == 4096) {
      size_t v102 = (unsigned __int16)__n;
    }
    else {
      size_t v102 = v100;
    }
    BOOL v103 = WORD1(__n) != 4096 && v101;
    int v104 = (void *)(*(void *)(v5 + 120) + *(unsigned int *)(v5 + 128));
    *int v104 = 24577LL;
    v104[1] = v102 + 16;
    uint64_t v105 = (*(_DWORD *)(v5 + 128) + 16);
    *(_DWORD *)(v5 + 12_Block_object_dispose(va, 8) = v105;
    LOWORD(v104) = *(_WORD *)(v137 + 30);
    uint64_t v106 = *(void *)(v5 + 120) + v105;
    uint64_t v107 = *(void *)(v137 + 16);
    int v108 = *(_DWORD *)(v137 + 24);
    *(_BYTE *)(v106 + 12) = *(_BYTE *)(v137 + 28);
    *(_DWORD *)(v106 + _Block_object_dispose(va, 8) = v108;
    *(void *)uint64_t v106 = v107;
    *(_BYTE *)(v106 + 13) = v103;
    *(_WORD *)(v106 + 14) = (_WORD)v104;
    uint64_t v109 = (*(_DWORD *)(v5 + 128) + 16);
    *(_DWORD *)(v5 + 12_Block_object_dispose(va, 8) = v109;
    uint64_t v110 = (void *)(*(void *)(v5 + 120) + v109);
    if (v103)
    {
      memcpy(v110, &__n, v98);
      int v111 = (v98 & 0xFFF8) + 8;
      if ((v98 & 7) == 0) {
        int v111 = v98;
      }
      uint64_t v112 = (*(_DWORD *)(v5 + 128) + v111);
      *(_DWORD *)(v5 + 12_Block_object_dispose(va, 8) = v112;
      memcpy((void *)(*(void *)(v5 + 120) + v112), (char *)&__n + v99, 4096 - v99);
      int v113 = *(_DWORD *)(v5 + 128) + ((4103 - v99) & 0xFFFFFFF8);
    }

    else
    {
      memcpy(v110, &__n, v102);
      int v113 = *(_DWORD *)(v5 + 128) + v102;
    }

    *(_DWORD *)(v5 + 12_Block_object_dispose(va, 8) = v113;
  }

  *(void *)(v5 + 72) = 0LL;
  *(void *)(v5 + 32) = 0LL;
  *(void *)(v5 + 8_Block_object_dispose(va, 8) = 0LL;
  *(void *)(v5 + 4_Block_object_dispose(va, 8) = 0LL;
LABEL_160:

  id v86 = 0LL;
LABEL_161:
  uint64_t v120 = 1LL;
LABEL_162:

  return v120;
}

void *_OSLogEventUnpackChunk_2919(void *result, uint64_t a2, uint64_t a3)
{
  *(void *)a3 = result;
  uint64_t v4 = (void *)(a3 + 16);
  int v5 = *(_DWORD *)result;
  switch(*(_DWORD *)result)
  {
    case 0x6001:
      unint64_t v6 = result[1];
      unint64_t v7 = v6 - 16;
      if (v6 < 0x10) {
        goto LABEL_22;
      }
      id v8 = (unsigned __int16 *)(result + 4);
      BOOL v9 = *((_BYTE *)result + 29) != 0;
      goto LABEL_16;
    case 0x6002:
      unint64_t v11 = result[1];
      unint64_t v7 = v11 - 32;
      if (v11 < 0x20) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 6);
      goto LABEL_16;
    case 0x6003:
      unint64_t v12 = result[1];
      unint64_t v7 = v12 - 48;
      if (v12 < 0x30) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 8);
      goto LABEL_16;
    case 0x6004:
      unint64_t v13 = result[1];
      unint64_t v7 = v13 - 72;
      if (v13 < 0x48) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 11);
      goto LABEL_16;
    case 0x6005:
    case 0x6006:
    case 0x6007:
    case 0x6008:
    case 0x6009:
    case 0x600A:
    case 0x600B:
      goto LABEL_7;
    case 0x600C:
      unint64_t v14 = result[1];
      unint64_t v7 = v14 - 16;
      if (v14 < 0x10) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)result + 15;
      goto LABEL_16;
    default:
      if (v5 != 24592)
      {
LABEL_7:
        *(_OWORD *)(a3 + 24) = 0u;
        *(_OWORD *)(a3 + _Block_object_dispose(va, 8) = 0u;
        return result;
      }

      unint64_t v10 = result[1];
      unint64_t v7 = v10 - 16;
      if (v10 < 0x10) {
        goto LABEL_22;
      }
      BOOL v9 = 0;
      id v8 = (unsigned __int16 *)(result + 4);
LABEL_16:
      if (v7 - 4097 < 0xFFFFFFFFFFFFF00FLL) {
        goto LABEL_17;
      }
      unint64_t v15 = *v8;
      if (v7 < v15)
      {
LABEL_22:
        *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
        *(void *)(a3 + 32) = 0LL;
        return result;
      }

      uint64_t v17 = v8[1];
      if (!v9)
      {
        if (v7 == 4096)
        {
          *uint64_t v4 = (char *)v8 + v17;
          uint64_t v18 = (unsigned __int16)(4096 - v17);
          goto LABEL_46;
        }

void _tracev3_chunk_decompress_and_enumerate_chunks_helper(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = _tracev3_chunk_decompress(a1, a2, (compression_algorithm *)&v16, &v17);
  if (v6)
  {
    unint64_t v7 = v17;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    unint64_t v12 = ___tracev3_chunk_decompress_and_enumerate_chunks_helper_block_invoke;
    unint64_t v13 = &unk_189F0FD40;
    id v14 = v5;
    unint64_t v15 = v6;
    id v8 = v11;
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
      unint64_t v9 = (v9 + v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    }

    while (v9 - 1 < v7);
  }

  if (v16) {
    free(v6);
  }
}

uint64_t ___tracev3_chunk_decompress_and_enumerate_chunks_helper_block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x186E40118]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
  return v3;
}

BOOL purge_unused_uuids(void *a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
  id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
  unint64_t v48 = v6;
  if (![v6 count])
  {
    id v30 = 0LL;
    BOOL v14 = 1LL;
    goto LABEL_45;
  }

  unint64_t v47 = v8;
  id v9 = v5;
  unint64_t v10 = opendir((const char *)[v9 UTF8String]);
  if (!v10)
  {
    uint64_t v39 = *__error();
    unsigned int v40 = (void *)[objc_alloc(NSString) initWithFormat:@"Unable to logarchive %@: %s (%d)", v9, strerror(v39), v39];
    create_repack_error(-1, v40);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v14 = 0LL;
    id v8 = v47;
    if (!a3) {
      goto LABEL_45;
    }
    goto LABEL_43;
  }

  unint64_t v11 = v10;
  unint64_t v45 = a3;
  id v44 = v5;
  unint64_t v12 = "dsc";
  id v46 = v9;
  while (1)
  {
    unint64_t v13 = readdir(v11);
    BOOL v14 = v13 == 0LL;
    if (!v13) {
      break;
    }
    if (v13->d_type == 4)
    {
      d_name = v13->d_name;
      if (strcmp(v13->d_name, ".."))
      {
        if (!strcmp(d_name, v12) || strlen(d_name) == 2)
        {
          snprintf( __str, 0x400uLL, "%s/%s", (const char *)[v9 UTF8String], d_name);
          int v16 = opendir(__str);
          if (!v16)
          {
            uint64_t v41 = *__error();
            id v36 = (id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unable to open %s: %s (%d)",  __str,  strerror(v41),  v41);
            create_repack_error(-1, v36);
            id v30 = (id)objc_claimAutoreleasedReturnValue();
            id v5 = v44;
            id v8 = v47;
            goto LABEL_42;
          }

          size_t v17 = v16;
          int v18 = 0;
          int v19 = 0;
          while (1)
          {
            unint64_t v20 = readdir(v17);
            if (!v20) {
              break;
            }
            uint64_t v21 = v20->d_name;
            if (strcmp(v20->d_name, "..") && *v21 != 46)
            {
              BOOL v22 = v12;
              int v23 = strcmp(d_name, v12);
              id v24 = objc_alloc(MEMORY[0x189607940]);
              if (v23) {
                uint64_t v25 = (void *)objc_msgSend(v24, "initWithFormat:", @"%s%s", d_name, v21);
              }
              else {
                uint64_t v25 = (void *)objc_msgSend(v24, "initWithFormat:", @"%s", v21, v43);
              }
              uint64_t v26 = v25;
              [v25 insertString:@"-" atIndex:8];
              [v26 insertString:@"-" atIndex:13];
              [v26 insertString:@"-" atIndex:18];
              [v26 insertString:@"-" atIndex:23];
              uint64_t v27 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v26];
              if (([v48 containsObject:v27] & 1) == 0)
              {
                int v43 = v21;
                id v28 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s/%s", __str);
                [v7 addObject:v28];
                ++v19;
              }

              ++v18;

              unint64_t v12 = v22;
              id v9 = v46;
            }
          }

          if (v19 == v18)
          {
            [NSString stringWithUTF8String:__str];
            int v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v47 addObject:v29];
          }

          closedir(v17);
        }
      }
    }
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v31 = v7;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
  id v5 = v44;
  id v8 = v47;
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v54;
    do
    {
      for (uint64_t i = 0LL; i != v33; ++i)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(v31);
        }
        unlink((const char *)[*(id *)(*((void *)&v53 + 1) + 8 * i) fileSystemRepresentation]);
      }

      uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }

    while (v33);
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v36 = v47;
  id v30 = (id)[v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v30)
  {
    uint64_t v37 = *(void *)v50;
    do
    {
      for (uint64_t j = 0LL; j != v30; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v50 != v37) {
          objc_enumerationMutation(v36);
        }
        rmdir((const char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)j) fileSystemRepresentation]);
      }

      id v30 = (id)[v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }

    while (v30);
  }

LABEL_45:
  return v14;
}

int *execute_repack(uint64_t a1, void *a2)
{
  uint64_t v164 = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 40) || !*(void *)(a1 + 48) || !*(void *)(a1 + 56))
  {
    create_repack_error( 64,  @"Please provide a non NULL function for print_stats, print_warning, and print_verbose");
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }

  print_verbose = *(uint64_t (**)(const char *, ...))(a1 + 56);
  if (!*(_BYTE *)(a1 + 24))
  {
    id v59 = 0LL;
    goto LABEL_107;
  }

  BOOL v117 = (void *)objc_opt_new();
  int v118 = (void *)objc_opt_new();
  uint64_t v145 = 0LL;
  __int128 v146 = &v145;
  uint64_t v147 = 0x3032000000LL;
  uint64_t v148 = __Block_byref_object_copy__2946;
  uuid_string_t v149 = __Block_byref_object_dispose__2947;
  id v150 = *(id *)(a1 + 64);
  id v3 = +[OSLogEventProxy _make](&OBJC_CLASS___OSLogEventProxy, "_make");
  [v3 _setIncludeSensitive:1];
  __int16 v119 = v3;
  uint64_t v139 = 0LL;
  char v140 = &v139;
  uint64_t v141 = 0x3032000000LL;
  __int128 v142 = __Block_byref_object_copy__2946;
  size_t v143 = __Block_byref_object_dispose__2947;
  id v144 = 0LL;
  uint64_t v4 = objc_alloc(&OBJC_CLASS____OSLogPredicateMapper);
  uint64_t v126 = -[_OSLogPredicateMapper initWithPredicate:](v4, "initWithPredicate:", v146[5]);
  id v128 = *(id *)a1;
  __snprintf_chk( v161,  0x400uLL,  0,  0x400uLL,  "%s/timesync",  (const char *)[v128 fileSystemRepresentation]);
  uint64_t v5 = open(v161, 0);
  uint64_t v6 = v5;
  if ((_DWORD)v5 == -1)
  {
    uint64_t v60 = @"Unable to open timesync database inside archive";
    goto LABEL_64;
  }

  uint64_t v7 = _timesync_db_openat(v5, ".");
  if (!v7)
  {
    uint64_t v60 = @"Unable to create timesync database structure";
LABEL_64:
    create_repack_error(74, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    int v62 = 0;
    id v124 = 0LL;
    uint64_t v125 = 0LL;
    unint64_t v122 = 0LL;
    uint64_t v123 = 0LL;
    if (v61) {
      goto LABEL_105;
    }
    goto LABEL_106;
  }

  uint64_t v8 = *(void *)(v7 + 80);
  v116 = (int *)v7;
  [v3 _setTimesyncDatabase:v7];
  id v9 = v128;
  uint64_t v10 = open((const char *)[v9 fileSystemRepresentation], 0x100000);
  if ((_DWORD)v10 == -1)
  {
    create_repack_error(74, @"Unable to open archive for UUIDs");
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (close(v6) == -1)
    {
      if (*__error() == 9) {
        goto LABEL_124;
      }
      __error();
      _os_assumes_log();
    }

LABEL_76:
    int v62 = 0;
    id v124 = 0LL;
    uint64_t v125 = 0LL;
    unint64_t v122 = 0LL;
    uint64_t v123 = 0LL;
    goto LABEL_104;
  }

  [v3 _setUUIDDBFileDescriptor:v10];
  id v11 = v9;
  unsigned int v127 = open((const char *)[v11 fileSystemRepresentation], 0x100000);
  if ((v127 & 0x80000000) != 0)
  {
    if (close(v10) == -1)
    {
      if (*__error() == 9) {
        goto LABEL_125;
      }
      __error();
      _os_assumes_log();
    }

    if (close(v6) == -1)
    {
      if (*__error() == 9) {
        goto LABEL_126;
      }
      __error();
      _os_assumes_log();
    }

    create_repack_error(74, @"Unable to open logarchive");
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_76;
  }

  unint64_t v122 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v127);
  uint64_t v123 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v6);
  id v124 = -[_OSLogDirectoryReference initWithDescriptor:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:",  v10);
  uint64_t v125 = -[_OSLogCollectionReference initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:]( objc_alloc(&OBJC_CLASS____OSLogCollectionReference),  "initWithDiagnosticsDirectory:timesyncDirectory:UUIDTextDirectory:",  v122,  v123,  v124);
  unint64_t v12 = objc_alloc(&OBJC_CLASS____OSLogCatalogFilter);
  uint64_t v13 = -[_OSLogCatalogFilter initWithPredicate:collection:](v12, "initWithPredicate:collection:", v146[5], v125);
  BOOL v14 = (void *)v140[5];
  v140[5] = v13;

  -[_OSLogPredicateMapper mappedPredicate](v126, "mappedPredicate");
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = v15 == 0LL;

  if (v16)
  {
    uint64_t v64 = (void *)NSString;
    -[_OSLogPredicateMapper validationErrors](v126, "validationErrors");
    size_t v65 = (void *)objc_claimAutoreleasedReturnValue();
    [v64 stringWithFormat:@"Unable to validate predicate: %@", v65];
    id v66 = (id)objc_claimAutoreleasedReturnValue();

    create_repack_error(64, v66);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_102;
  }

  uint64_t v17 = -[_OSLogPredicateMapper mappedPredicate](v126, "mappedPredicate");
  int v18 = (void *)v146[5];
  v146[5] = v17;

  [(id)v146[5] allowEvaluation];
  uint64_t v19 = MEMORY[0x1895F87A8];
  int v20 = *(unsigned __int8 *)(a1 + 27);
  v133[0] = MEMORY[0x1895F87A8];
  v133[1] = 3221225472LL;
  v133[2] = __compact_logarchive_block_invoke;
  void v133[3] = &unk_189F0FD68;
  uint64_t v137 = a1;
  id v113 = v117;
  id v134 = v113;
  id v138 = v3;
  id v111 = v118;
  id v135 = v111;
  unint64_t v136 = &v145;
  v132[0] = v19;
  v132[1] = 3221225472LL;
  v132[2] = __compact_logarchive_block_invoke_2;
  v132[3] = &unk_189F0FD90;
  v132[4] = &v139;
  id v115 = v11;
  id v21 = v3;
  uint64_t v121 = v133;
  uint64_t v120 = v132;
  uint64_t v155 = 0LL;
  BOOL v22 = operator new(0x28uLL);
  *BOOL v22 = 0u;
  v22[1] = 0u;
  *((_DWORD *)v22 + _Block_object_dispose(va, 8) = 1065353216;
  uint64_t v154 = 0LL;
  v153[1] = v8;
  v153[2] = v22;
  uint64_t v114 = v21;
  v153[0] = v21;
  v153[3] = v20;
  int v112 = v20;
  if (v20)
  {
    id v23 = objc_alloc_init(MEMORY[0x189603FE0]);
    id v24 = v154;
    uint64_t v154 = v23;
  }

  uint64_t v25 = 0LL;
  id v130 = 0LL;
  while (1)
  {
    uint64_t v26 = g_books[v25];
    uint64_t v27 = v121;
    id v28 = v120;
    print_verbose("Begin compacting book %s\n", v26);
    int v29 = openat(v127, v26, 1048832);
    int v30 = v29;
    if (v29 < 0)
    {
      uint64_t v43 = *__error();
      objc_msgSend(NSString, "stringWithFormat:", @"Unable to open fd for book %s: %d", v26, v43);
      id v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!strcmp(v26, "HighVolume") && (_DWORD)v43 == 2) {
        int v46 = -2;
      }
      else {
        int v46 = -1;
      }
      create_repack_error(v46, v44);
      id v36 = (id)objc_claimAutoreleasedReturnValue();

LABEL_48:
      id v36 = v36;
      char v53 = 0;
      __int128 v54 = v36;
      goto LABEL_49;
    }

    int v31 = dup(v29);
    int v32 = v31;
    if (v31 == -1)
    {
      __error();
      _os_assumes_log();
      goto LABEL_41;
    }

    if (lseek(v31, 0LL, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }

    uint64_t v33 = fdopendir(v32);
    uint64_t v34 = v33;
    if (!v33)
    {
      int v48 = *__error();
      if (close(v32) == -1)
      {
        int v49 = *__error();
        uint64_t v50 = *__error();
        if (v49 == 9) {
          goto LABEL_123;
        }
        _os_assumes_log();
      }

      *__error() = v48;
LABEL_41:
      objc_msgSend(NSString, "stringWithFormat:", @"Failed to open dir fd for book %s", v26);
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue();
      create_repack_error(-1, v51);
      id v36 = (id)objc_claimAutoreleasedReturnValue();

      char v47 = 0;
      goto LABEL_42;
    }

    uint64_t v35 = readdir(v33);
    id v36 = 0LL;
    while (1)
    {
      uint64_t v37 = v35;
      if (!v35)
      {
        char v47 = 1;
        goto LABEL_35;
      }

      unint64_t v38 = (void *)MEMORY[0x186E40118]();
      if (v37->d_type == 8)
      {
        d_name = v37->d_name;
        unsigned int v40 = strrchr(d_name, 46);
        if (v40)
        {
          if (!strcmp(v40, ".tracev3")) {
            break;
          }
        }
      }

LABEL_82:
      if (v112)
      {
        id v151 = v130;
        BOOL v70 = purge_unused_uuids(v115, v154, &v151);
        id v55 = v151;

        if (v70)
        {
          id v71 = 0LL;
          int v72 = 1;
          id v130 = v55;
          goto LABEL_86;
        }

LABEL_86:
      printf("Compaction complete with result: %d\n", v72);
      id v73 = v71;

      if (v73)
      {
        uint64_t v74 = (void *)NSString;
        uint64_t v75 = [v73 code];
        id v76 = [v73 localizedDescription];
        objc_msgSend(v74, "stringWithFormat:", @"Error: %ld: %s\n", v75, objc_msgSend(v76, "UTF8String"));
        id v66 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v77 = create_repack_error(-1, v66);
LABEL_101:
        uint64_t v61 = (void *)v77;

LABEL_102:
        int v62 = 0;
      }

      else
      {
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        id v66 = v113;
        uint64_t v78 = 0LL;
        uint64_t v79 = [v66 countByEnumeratingWithState:&v157 objects:v156 count:16];
        if (v79)
        {
          uint64_t v80 = *(void *)v158;
          while (2)
          {
            for (uint64_t i = 0LL; i != v79; ++i)
            {
              if (*(void *)v158 != v80) {
                objc_enumerationMutation(v66);
              }
              unint64_t v82 = *(void **)(*((void *)&v157 + 1) + 8 * i);
              if (([v82 isEqualToString:@"total"] & 1) == 0)
              {
                [v66 objectForKeyedSubscript:v82];
                unint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
                int v84 = [v83 intValue];

                if (v84 != 1)
                {
                  if (![v82 containsString:@"timesync"])
                  {
                    objc_msgSend( NSString, "stringWithFormat:", @"Found duplicate tracepoint_id '%s' in compaction: %lu", objc_msgSend(v82, "UTF8String"), v84);
                    id v73 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v77 = create_repack_error(65, v73);
                    goto LABEL_101;
                  }

                  (*(void (**)(const char *, ...))(a1 + 48))( "Found duplicate timesync file '%s'", (const char *)[v82 UTF8String]);
                  uint64_t v78 = v78 + v84 - 1;
                }
              }
            }

            uint64_t v79 = [v66 countByEnumeratingWithState:&v157 objects:v156 count:16];
            if (v79) {
              continue;
            }
            break;
          }
        }

        (*(void (**)(const char *))(a1 + 40))("Compaction results:\n");
        uint64_t v85 = *(void (**)(const char *, ...))(a1 + 40);
        [v66 objectForKeyedSubscript:@"total"];
        id v86 = (void *)objc_claimAutoreleasedReturnValue();
        v85("\tTotal matched events: %d\n", [v86 intValue]);

        (*(void (**)(const char *, ...))(a1 + 40))("\tTotal unique ids: %lu\n", [v111 count]);
        (*(void (**)(const char *, ...))(a1 + 40))("\tTotal duplicates: %lu\n", v78);
        uint64_t v61 = 0LL;
        int v62 = 1;
      }

      -[_OSLogCollectionReference close](v125, "close");
LABEL_104:
      [v119 _unmake];
      _timesync_db_close(v116);
      if (v61) {
LABEL_105:
      }
        id v87 = v61;
LABEL_106:

      _Block_object_dispose(&v139, 8);
      _Block_object_dispose(&v145, 8);

      id v59 = v61;
      id v56 = v59;
      if (v62)
      {
LABEL_107:
        id v88 = *(id *)a1;
        uint64_t v89 = (void *)MEMORY[0x189604030];
        unint64_t v90 = (void *)NSString;
        *(void *)uint64_t v161 = v88;
        uint64_t v162 = @"Info.plist";
        [MEMORY[0x189603F18] arrayWithObjects:v161 count:2];
        uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
        [v90 pathWithComponents:v91];
        size_t v92 = (void *)objc_claimAutoreleasedReturnValue();
        [v89 fileURLWithPath:v92 isDirectory:0];
        unint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189603FC8] dictionaryWithContentsOfURL:v93];
        uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
        id v95 = objc_alloc_init(MEMORY[0x189603F50]);
        if (!v94)
        {
          create_repack_error(74, @"Unable to open Info.plist");
          unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_114;
        }

        [v94 objectForKey:@"Repacked"];
        uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v97 = v96 == 0LL;

        if (v97)
        {
          [v95 description];
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
          *(void *)&v163.st_dev = v99;
          [MEMORY[0x189603F18] arrayWithObjects:&v163 count:1];
          size_t v98 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          [v94 objectForKey:@"Repacked"];
          size_t v98 = (void *)objc_claimAutoreleasedReturnValue();
          [v95 description];
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue();
          [v98 addObject:v99];
        }

        [v94 setObject:v98 forKey:@"Repacked"];
        v156[0] = 0LL;
        [v94 writeToURL:v93 error:v156];
        id v101 = v156[0];
        if (v101)
        {
          size_t v102 = v101;
          BOOL v103 = (void *)NSString;
          id v104 = [v101 localizedDescription];
          objc_msgSend( v103,  "stringWithFormat:",  @"Unable to finalize logarchive: %s",  objc_msgSend(v104, "UTF8String"));
          uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();

          create_repack_error(74, v105);
          unsigned int v100 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_114:
          if (v100)
          {
            id v106 = v100;

            char v107 = 0;
            goto LABEL_119;
          }

          char v107 = 0;
        }

        else
        {
          char v107 = 1;
        }

        id v106 = v59;
LABEL_119:

        id v56 = v106;
        if ((v107 & 1) != 0)
        {
          uint64_t v57 = 0LL;
LABEL_60:

          return (int *)v57;
        }
      }

void sub_1869C9C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__2946(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2947(uint64_t a1)
{
}

uint64_t __compact_logarchive_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"nil";
  }
  if ((-[__CFString containsString:](v4, "containsString:", @"nonsparse") & 1) != 0
    || (-[__CFString containsString:](v4, "containsString:", @"timesync") & 1) != 0)
  {
    uint64_t v5 = 1LL;
  }

  else
  {
    if (*(_BYTE *)(*(void *)(a1 + 56) + 26LL))
    {
      incr_val_for_key(*(void **)(a1 + 32), v4);
      incr_val_for_key(*(void **)(a1 + 32), @"total");
      [*(id *)(a1 + 40) addObject:v4];
    }

    id v6 = (id)[*(id *)(a1 + 64) composedMessage];
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) evaluateWithObject:*(void *)(a1 + 64)];
  }

  return v5;
}

uint64_t __compact_logarchive_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isKeptCatalog:a2];
}

int *_compact_tracev3( int a1, uint64_t a2, const char *a3, uint64_t *a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id aBlock = a6;
  id v40 = a7;
  [NSString stringWithUTF8String:a2];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:a3];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringByAppendingPathComponent:v14];
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v64 = 0LL;
  size_t v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  id v67 = __Block_byref_object_copy__2946;
  uint64_t v68 = __Block_byref_object_dispose__2947;
  id v69 = 0LL;
  uint64_t v38 = *a4;
  v63[0] = 0LL;
  v63[1] = v63;
  v63[2] = 0x2020000000LL;
  v63[3] = 0LL;
  uint64_t v62 = 0LL;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  memset(v55, 0, sizeof(v55));
  unint64_t v15 = (char *)_os_trace_mmap_at();
  if (!v15)
  {
    BOOL v28 = _delete_trace_file(a1, a3, v54);
LABEL_41:

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(&v64, 8);

    return (int *)v28;
  }

  int v16 = openat(a1, "tmp", 1538, 420LL);
  int v17 = v16;
  if (v16 != -1)
  {
    *(_OWORD *)((char *)v55 + _Block_object_dispose(va, 8) = xmmword_1869D9100;
    *((void *)&v61 + 1) = 0LL;
    LODWORD(v61) = v16;
    DWORD1(v5_Block_object_dispose(va, 8) = 0x10000;
    *((void *)&v57 + 1) = _os_trace_malloc();
    int v18 = _Block_copy(aBlock);
    uint64_t v19 = (void *)*((void *)&v58 + 1);
    *((void *)&v58 + 1) = v18;

    int v20 = _Block_copy(v40);
    id v21 = (void *)v59;
    *(void *)&__int128 v59 = v20;

    *((void *)&v59 + 1) = *a4;
    uint64_t v62 = a5;
    size_t v22 = v54;
    v46[0] = MEMORY[0x1895F87A8];
    v46[1] = 3221225472LL;
    char v47 = ___compact_tracev3_block_invoke;
    int v48 = &unk_189F0FDD8;
    int v52 = v15;
    id v49 = v42;
    uint64_t v50 = v63;
    char v53 = v55;
    __int128 v51 = &v64;
    id v23 = v46;
    unint64_t v24 = 0LL;
    do
    {
      if (v22 - v24 < 0x10) {
        break;
      }
      unint64_t v25 = *(void *)&v15[v24 + 8];
      if (v22 - v24 - 16 < v25) {
        break;
      }
      unint64_t v24 = (v24 + v25 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    }

    while (v24 - 1 < v22);

    uint64_t v26 = (id *)(v65 + 5);
    if (v65[5]
      || (uint64_t v31 = *((void *)&v59 + 1), v32 = *((void *)&v55[1] + 1), *a4 = *((void *)&v59 + 1), v32)
      && (obj = *v26, int v33 = _repack_ttl_compact_close_catalog((uint64_t)v55, &obj), objc_storeStrong(v26, obj), !v33))
    {
      int v27 = 0;
      goto LABEL_14;
    }

    if ((uint64_t)(*((void *)&v61 + 1) + DWORD2(v56)) > 1)
    {
      if (v31 != v38)
      {
        print_verbose("Removed %lu tracepoints\n", v31 - v38);
        if (faccessat(a1, a3, 0, 0) == -1)
        {
          uint64_t v36 = create_repack_error(-1, @"Tmp file no longer accessible");
        }

        else
        {
          if (lseek(v17, 0LL, 2) >= 1)
          {
            uint64_t v34 = (void *)_os_trace_mmap();
            __int128 value = 0u;
            uint64_t v71 = 0LL;
            LODWORD(value) = 1;
            uint64_t v72 = -1LL;
            uint64_t v73 = 0LL;
            _OSLogGenerateXattrs((uint64_t)v34, v44, (uint64_t)&value);
            if (munmap(v34, v44) == -1)
            {
              __error();
              _os_assumes_log();
            }

            if (fsetxattr(v17, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
            {
              __error();
              _os_assumes_log();
            }
          }

          fsync(v17);
          if (renameat(a1, "tmp", a1, a3) != -1) {
            goto LABEL_31;
          }
          uint64_t v36 = create_repack_error(-1, @"Failed to rename tmp to trace file");
        }

        int v30 = (void *)v65[5];
        v65[5] = v36;
        int v27 = 1;
        goto LABEL_13;
      }

      print_verbose("No tracepoints removed. Keeping file as is\n");
    }

    else if (!_delete_trace_file(a1, a3, v54))
    {
      uint64_t v29 = create_repack_error(-1, @"Nothing kept, but error deleting trace file");
      goto LABEL_12;
    }

void sub_1869CA3D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, void *a46, void *a47)
{
  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Block_object_dispose((const void *)(v47 - 192), 8);
  _Unwind_Resume(a1);
}

BOOL _delete_trace_file(int a1, const char *a2, uint64_t a3)
{
  int v5 = unlinkat(a1, a2, 0);
  if (v5 == -1)
  {
    id v6 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v7 = __error();
    fprintf(v6, "Failed to unlink trace file %s: error: %d\n", a2, *v7);
  }

  else
  {
    print_verbose("Deleted trace file %s of size %lu\n", a2, a3);
  }

  return v5 != -1;
}

uint64_t ___compact_tracev3_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 - *(void *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", @"-%llu", v4);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  id v6 = *(void **)(a1 + 64);
  v6[21] = v4;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v11 = *(void **)(v8 + 40);
  id v9 = (id *)(v8 + 40);
  id v10 = v11;
  id v12 = v5;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  BOOL v28 = __Block_byref_object_copy__2946;
  uint64_t v29 = __Block_byref_object_dispose__2947;
  id v30 = 0LL;
  int v13 = *(_DWORD *)a2;
  if (v7 == a2)
  {
    if (v13 == 4096 && *(void *)(a2 + 8) > 0x27uLL)
    {
      void *v6 = a2 + 144;
      _repack_compact_add_iov((uint64_t)v6, a2);
      v6[20] = a2;
      goto LABEL_17;
    }

    uint64_t v15 = create_repack_error(-1, @"Not a valid header");
    int v16 = (void *)v26[5];
    v26[5] = v15;
  }

  else if (v13 == 24589)
  {
    if (!v6[3] || !v6[5]) {
      goto LABEL_17;
    }
    uint64_t v18 = v6[5];
    obj[0] = (id)MEMORY[0x1895F87A8];
    obj[1] = (id)3221225472LL;
    obj[2] = ___compact_chunk_block_invoke;
    obj[3] = &unk_189F0FE00;
    unint64_t v24 = v6;
    id v22 = v12;
    id v23 = &v25;
    _tracev3_chunk_decompress_and_enumerate_chunks_helper(a2, v18, obj);
    uint64_t v19 = v26[5];

    if (!v19)
    {
LABEL_16:
      v6[5] = *(void *)v6[5];
      goto LABEL_17;
    }
  }

  else
  {
    if (v13 != 24587)
    {
LABEL_17:
      uint64_t v17 = 1LL;
      goto LABEL_18;
    }

    if (!v6[3]
      || (obj[0] = 0LL, int v14 = _repack_ttl_compact_close_catalog((uint64_t)v6, obj), objc_storeStrong(&v30, obj[0]), v14))
    {
      _repack_ttl_compact_open_catalog((uint64_t)v6, a2);
      _OSLogUUIDMapAddFromCatalog(v6[3], *(void *)(v6[24] + 16LL));
      goto LABEL_17;
    }
  }

  id v10 = (id) v26[5];
  uint64_t v17 = 0LL;
LABEL_18:
  _Block_object_dispose(&v25, 8);

  objc_storeStrong(v9, v10);
  return v17;
}

void sub_1869CA718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t ___compact_chunk_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8LL);
  obuint64_t j = *(id *)(v1 + 40);
  uint64_t v2 = _compact_chunkset();
  objc_storeStrong((id *)(v1 + 40), obj);
  return v2;
}

void incr_val_for_key(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 objectForKey:v3];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v5;
  if (v5) {
    uint64_t v6 = [v5 intValue] + 1;
  }
  else {
    uint64_t v6 = 1LL;
  }
  [MEMORY[0x189607968] numberWithInt:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKeyedSubscript:v3];
}

uint64_t _calculateTimeRefForBook(void *a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  [v3 diagnosticsDirectoryReference];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 fileDescriptor];

  int v6 = openat(v5, a2, 0);
  if (v6 == -1)
  {
    uint64_t v15 = 0LL;
    goto LABEL_23;
  }

  int v7 = v6;
  int v8 = _os_trace_fdscandir_b();
  if (v8 >= 1)
  {
    id v9 = 0LL;
    uint64_t v10 = 8LL * v8;
    do
    {
      id v11 = (const char *)(*v9 + 21LL);
      id v12 = strrchr(v11, 46);
      if (v12)
      {
        if (!strcmp(v12, ".tracev3"))
        {
          uint64_t v13 = openat(v7, v11, 0);
          if ((_DWORD)v13 != -1)
          {
            int v14 = v13;
            if (_OSLogFileFindExhaustivePoint(v13, (uint64_t)v22, (uint64_t)&v21) && *__error() == 2)
            {
              uint64_t v15 = 0LL;
            }

            else
            {
              int v16 = objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef);
              uint64_t v15 = -[_OSLogEventStoreTimeRef initWithUUID:continuous:](v16, "initWithUUID:continuous:", v22, v21);
            }

            if (close(v14) == -1)
            {
              int v17 = *__error();
              uint64_t v18 = *__error();
              if (v17 == 9)
              {
                qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                qword_18C695DD0 = v18;
                __break(1u);
              }

              _os_assumes_log();
              if (v15) {
                goto LABEL_19;
              }
            }

            else if (v15)
            {
              goto LABEL_19;
            }
          }
        }
      }

      ++v9;
    }

    while ((void *)v10 != v9);
  }

  uint64_t v15 = 0LL;
LABEL_19:
  _os_trace_scandir_free_namelist();
  if (close(v7) != -1) {
    goto LABEL_23;
  }
  int v19 = *__error();
  uint64_t result = *__error();
  if (v19 != 9)
  {
    _os_assumes_log();
LABEL_23:

    return (uint64_t)v15;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

uint64_t _enumerateArchiveIntoSource(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = a4;
  [v8 diagnosticsDirectoryReference];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 fileDescriptor];

  int v13 = dup(v12);
  if (v13 == -1)
  {
    __error();
    _os_assumes_log();
LABEL_23:
    uint64_t v39 = __error();
    _OSLogPOSIXError(11LL, *v39);
    id v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0LL, v40);

    uint64_t v37 = 0LL;
LABEL_24:

    return v37;
  }

  int v14 = v13;
  if (lseek(v13, 0LL, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }

  uint64_t v15 = fdopendir(v14);
  if (!v15)
  {
    int v38 = *__error();
    if (close(v14) == -1)
    {
      int v41 = *__error();
      uint64_t result = *__error();
      if (v41 == 9) {
        goto LABEL_29;
      }
      _os_assumes_log();
    }

    *__error() = v38;
    goto LABEL_23;
  }

  int v16 = v15;
  id v42 = v10;
  _enumerateDirectoryIntoSource(v7, v12, v15, 0LL, v8, v9);
  closedir(v16);
  uint64_t v17 = 0LL;
  while (1)
  {
    uint64_t v18 = (&_enumerateArchiveIntoSource_dirs)[v17];
    int v19 = openat(v12, v18, 0x100000);
    if (v19 == -1)
    {
      uint64_t v23 = __error();
      if (v17 * 8 && *v23 == 2) {
        goto LABEL_17;
      }
      [MEMORY[0x1896079E0] currentProgress];
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = v24;
      if (v9)
      {
        [v24 fractionCompleted];
        double v27 = v26;
        BOOL v28 = __error();
        _OSLogPOSIXError(18LL, *v28);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, double))v9 + 2))(v9, v29, v27);
      }

      goto LABEL_16;
    }

    int v20 = v19;
    uint64_t v21 = fdopendir(v19);
    if (!v21) {
      break;
    }
    id v22 = v21;
    _enumerateDirectoryIntoSource(v7, v20, v21, v18, v8, v9);
    closedir(v22);
LABEL_17:
    v17 += 2LL;
    if (v17 == 8)
    {
      uint64_t v37 = 1LL;
      uint64_t v10 = v42;
      goto LABEL_24;
    }
  }

  [MEMORY[0x1896079E0] currentProgress];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = v30;
  if (v9)
  {
    [v30 fractionCompleted];
    double v32 = v31;
    int v33 = __error();
    _OSLogPOSIXError(18LL, *v33);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, double))v9 + 2))(v9, v34, v32);
  }

  if (close(v20) != -1)
  {
LABEL_16:

    goto LABEL_17;
  }

  int v35 = *__error();
  uint64_t result = *__error();
  if (v35 != 9)
  {
    _os_assumes_log();
    goto LABEL_16;
  }

  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
LABEL_29:
  qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C695DD0 = result;
  __break(1u);
  return result;
}

void _enumerateDirectoryIntoSource(void *a1, int a2, DIR *a3, const char *a4, void *a5, void *a6)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v32 = a1;
  id v10 = a5;
  double v31 = a6;
  id v11 = readdir(a3);
  if (v11)
  {
    int v12 = v11;
    uint64_t v29 = (void *)*MEMORY[0x189607688];
    int v13 = (objc_class *)0x18C4AC000LL;
    do
    {
      d_name = (stat *)v12->d_name;
      uint64_t v15 = strrchr(v12->d_name, 46);
      if (v15 && !strcmp(v15, ".tracev3"))
      {
        int d_type = v12->d_type;
        if (!v12->d_type)
        {
          if (!fstatat(a2, v12->d_name, &v34, 0) && (v34.st_mode & 0xF000) == 0x8000) {
            v12->int d_type = 8;
          }
          int d_type = v12->d_type;
        }

        if (d_type == 8)
        {
          if (a4)
          {
            d_name = &v34;
            snprintf((char *)&v34, 0x400uLL, "%s/%s", a4, v12->d_name);
          }

          uint64_t v17 = (void *)[objc_alloc(v13 + 511) initWithCollection:v10 subpath:d_name];
          uint64_t v18 = objc_alloc(&OBJC_CLASS____OSLogIndexFile);
          id v33 = 0LL;
          int v19 = -[_OSLogIndexFile initWithTraceFile:error:](v18, "initWithTraceFile:error:", v17, &v33);
          id v20 = v33;
          uint64_t v21 = v20;
          if (v19)
          {
            [v32 _insertIndexFile:v19];
          }

          else
          {
            id v22 = v13;
            [v20 domain];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v24 = v23 == v29 && [v21 code] == 34;

            int v13 = v22;
            if (v31 && !v24)
            {
              [MEMORY[0x1896079E0] currentProgress];
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v25 fractionCompleted];
              double v27 = v26;
              _OSLogInternalError(17LL, v21);
              BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
              v31[2](v31, v28, v27);

              int v13 = v22;
            }
          }
        }
      }

      int v12 = readdir(a3);
    }

    while (v12);
  }
}

void _progress(void *a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = a1;
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + a3);
  uint64_t v6 = v5[3];

  if (v6)
  {
    [v7 fractionCompleted];
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
  }
}

uint64_t ctf_create(int *a1)
{
  uint64_t v2 = malloc(0x400uLL);
  if (v2)
  {
    id v7 = v2;
    id v11 = ".SUNW_ctf";
    __int128 v12 = xmmword_1869D9180;
    int v13 = &ctf_create_hdr;
    __int128 v14 = xmmword_1869D9190;
    uint64_t v15 = 0LL;
    uint64_t v8 = ctf_bufopen((uint64_t)&v11, 0LL, 0LL, a1, v3, v4, v5, v6);
    uint64_t v9 = v8;
    if (v8)
    {
      *(_DWORD *)(v8 + 556) |= 4u;
      *(void *)(v8 + 576) = 128LL;
      bzero(v7, 0x400uLL);
      *(void *)(v9 + 56_Block_object_dispose(va, 8) = v7;
      *(void *)(v9 + 600) = 8LL;
      *(_OWORD *)(v9 + 60_Block_object_dispose(va, 8) = xmmword_1869D9180;
    }

    else
    {
      free(v7);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    if (a1) {
      *a1 = 35;
    }
  }

  return v9;
}

uint64_t ctf_update(void *a1)
{
  unsigned int v2 = *((_DWORD *)a1 + 139);
  if ((v2 & 4) == 0)
  {
    int v3 = 1039;
LABEL_3:
    *((_DWORD *)a1 + 140) = v3;
    return 0xFFFFFFFFLL;
  }

  if ((v2 & 8) != 0)
  {
    uint64_t v5 = a1[74];
    if (v5)
    {
      unsigned int v6 = 0;
      do
      {
        int v7 = *(_DWORD *)(v5 + 44);
        int v8 = *(_DWORD *)(v5 + 48);
        else {
          int v9 = 12;
        }
        v6 += v9;
        int v10 = v7 & 0x3FF;
        switch((unsigned __int16)v7 >> 11)
        {
          case 1:
          case 2:
          case 14:
            v6 += 4;
            break;
          case 4:
            v6 += 12;
            break;
          case 5:
            v6 += 4 * (v10 + (v7 & 1));
            break;
          case 6:
          case 7:
            unsigned int v11 = v6 + 16 * v10;
            unsigned int v12 = v6 + 12 * v10;
            if (*(_DWORD *)(v5 + 48) >> 13) {
              unsigned int v6 = v11;
            }
            else {
              unsigned int v6 = v12;
            }
            break;
          case 8:
            v6 += 8 * v10;
            break;
          default:
            break;
        }

        uint64_t v5 = *(void *)(v5 + 8);
      }

      while (v5);
    }

    else
    {
      unsigned int v6 = 0;
    }

    uint64_t v13 = *((unsigned int *)a1 + 150);
    __int128 v14 = (char *)mmap(0LL, v13 + v6 + 36, 3, 4098, -1, 0LL);
    if (v14 == (char *)-1LL)
    {
      int v3 = 35;
      goto LABEL_3;
    }

    uint64_t v15 = v14;
    uint64_t v68 = v13 + v6 + 36;
    *(_WORD *)__int128 v14 = -12303;
    void v14[2] = 4;
    *(_DWORD *)(v14 + 3) = 0;
    v14[7] = 0;
    *((_DWORD *)v14 + 2) = (v2 >> 1) & 1;
    *(void *)(v14 + 20) = 0LL;
    *(void *)(v14 + 12) = 0LL;
    *((_DWORD *)v14 + 7) = v6;
    *((_DWORD *)v14 + _Block_object_dispose(va, 8) = v13;
    int v16 = (int32x2_t *)(v14 + 36);
    uint64_t v17 = &v14[v6 + 36];
    *(void *)uint64_t v17 = 0x544E4552415000LL;
    uint64_t v18 = (int64x2_t *)a1[74];
    if (v18)
    {
      int v19 = v17 + 8;
      while (2)
      {
        id v20 = &v18[2].i32[2];
        __int32 v21 = v18[2].i32[3];
        id v22 = (const char *)v18[1].i64[1];
        if (v22)
        {
          __int32 *v20 = (_DWORD)v19 - (_DWORD)v17;
          size_t v23 = strlen(v22) + 1;
          __int128 v14 = (char *)memmove(v19, v22, v23);
          v19 += v23;
        }

        else
        {
          __int32 *v20 = 0;
        }

        __int32 v24 = v18[3].i32[0];
        else {
          size_t v25 = 12LL;
        }
        __int128 v14 = (char *)memmove(v16, &v18[2].u64[1], v25);
        int v16 = (int32x2_t *)((char *)v16 + v25);
        switch((unsigned __int16)v21 >> 11)
        {
          case 1:
          case 2:
            int v26 = (v18[4].i32[1] << 16) | (v18[4].i32[0] << 24);
            __int32 v27 = v18[4].i32[2];
            goto LABEL_54;
          case 4:
            __int32 v35 = v18[5].i32[0];
            *int v16 = vmovn_s64(v18[4]);
            v16[1].i32[0] = v35;
            int v16 = (int32x2_t *)((char *)v16 + 12);
            goto LABEL_66;
          case 5:
            if ((v21 & 0x3FF) != 0)
            {
              uint64_t v36 = 0LL;
              do
              {
                v16->i32[0] = *(void *)(v18[4].i64[0] + v36);
                int v16 = (int32x2_t *)((char *)v16 + 4);
                v36 += 8LL;
              }

              while (8LL * (v21 & 0x3FF) != v36);
            }

            if ((v21 & 1) != 0)
            {
              v16->i32[0] = 0;
              int v16 = (int32x2_t *)((char *)v16 + 4);
            }

            goto LABEL_66;
          case 6:
          case 7:
            BOOL v28 = (void *)v18[4].i64[1];
            if ((unsigned __int32)v18[3].i32[0] >> 13)
            {
              if (v28)
              {
                uint64_t v41 = ((_DWORD)v19 - (_DWORD)v17);
                do
                {
                  id v42 = (const char *)v28[2];
                  if (v42)
                  {
                    uint64_t v43 = v41 + strlen(v42) + 1;
                  }

                  else
                  {
                    uint64_t v43 = v41;
                    LODWORD(v41) = 0;
                  }

                  uint64_t v45 = v28[3];
                  uint64_t v44 = v28[4];
                  if (*((_DWORD *)a1 + 141) == 4) {
                    v16->i32[1] = v45;
                  }
                  else {
                    v16->i32[1] = (unsigned __int16)v45;
                  }
                  v16->i32[0] = v41;
                  v16[1].i32[0] = HIDWORD(v44);
                  v16[1].i32[1] = v44;
                  v16 += 2;
                  BOOL v28 = (void *)v28[1];
                  uint64_t v41 = v43;
                }

                while (v28);
              }
            }

            else if (v28)
            {
              uint64_t v29 = ((_DWORD)v19 - (_DWORD)v17);
              do
              {
                id v30 = (const char *)v28[2];
                if (v30)
                {
                  uint64_t v31 = v29 + strlen(v30) + 1;
                }

                else
                {
                  uint64_t v31 = v29;
                  LODWORD(v29) = 0;
                }

                uint64_t v32 = v28[3];
                if (*((_DWORD *)a1 + 141) == 4)
                {
                  uint64_t v33 = v28[4];
                  v16->i32[0] = v29;
                  v16->i32[1] = v32;
                  v16[1].i16[0] = v33;
                  uint64_t v34 = 12LL;
                }

                else
                {
                  *int v16 = (int32x2_t)(((unint64_t)(unsigned __int16)v28[3] << 32) | (v28[4] << 48) | v29);
                  uint64_t v34 = 8LL;
                }

                int v16 = (int32x2_t *)((char *)v16 + v34);
                BOOL v28 = (void *)v28[1];
                uint64_t v29 = v31;
              }

              while (v28);
            }

            goto LABEL_64;
          case 8:
            uint64_t v37 = v18[4].i64[1];
            if (v37)
            {
              unsigned int v38 = (_DWORD)v19 - (_DWORD)v17;
              do
              {
                int v39 = strlen(*(const char **)(v37 + 16));
                uint64_t v40 = v38;
                v38 += v39 + 1;
                *v16++ = (int32x2_t)(v40 | ((unint64_t)*(unsigned int *)(v37 + 40) << 32));
                uint64_t v37 = *(void *)(v37 + 8);
              }

              while (v37);
LABEL_64:
              uint64_t v46 = v18[4].i64[1];
            }

            else
            {
              uint64_t v46 = 0LL;
            }

            __int128 v14 = ctf_copy_membnames(v46, v19);
            int v19 = v14;
LABEL_66:
            uint64_t v18 = (int64x2_t *)v18->i64[1];
            if (!v18) {
              break;
            }
            continue;
          case 14:
            int v26 = (v18[4].u8[4] << 24) | (v18[4].u8[0] << 16);
            __int32 v27 = v18[4].u16[1];
LABEL_54:
            v16->i32[0] = v26 | v27;
            int v16 = (int32x2_t *)((char *)v16 + 4);
            goto LABEL_66;
          default:
            goto LABEL_66;
        }

        break;
      }
    }

    mprotect(v15, v68, 1);
    BOOL v70 = ".SUNW_ctf";
    __int128 v71 = xmmword_1869D9180;
    uint64_t v72 = v15;
    uint64_t v73 = v68;
    __int128 v74 = xmmword_1869D9180;
    uint64_t v51 = ctf_bufopen((uint64_t)&v70, 0LL, 0LL, &v69, v47, v48, v49, v50);
    if (!v51)
    {
      munmap(v15, v68);
      int v3 = v69;
      goto LABEL_3;
    }

    uint64_t v58 = v51;
    __int128 v59 = &_libctf_models;
    while (*((_DWORD *)v59 + 2) != *(_DWORD *)(a1[65] + 8LL))
    {
      __int128 v60 = v59[7];
      v59 += 7;
      if (!v60)
      {
        *(_DWORD *)(v51 + 560) = 22;
        goto LABEL_77;
      }
    }

    *(void *)(v51 + 520) = v59;
LABEL_77:
    ctf_import(v51, a1[66], v52, v53, v54, v55, v56, v57);
    *(_DWORD *)(v58 + 552) = *((_DWORD *)a1 + 138);
    *(_DWORD *)(v58 + 556) |= *((_DWORD *)a1 + 139) & 0xFFFFFFF7;
    *(void *)(v58 + 32) = 0LL;
    *(void *)(v58 + 56_Block_object_dispose(va, 8) = a1[71];
    *(void *)(v58 + 576) = a1[72];
    *(_OWORD *)(v58 + 584) = *(_OWORD *)(a1 + 73);
    *(_OWORD *)(v58 + 600) = *(_OWORD *)(a1 + 75);
    *(void *)(v58 + 616) = a1[76] - 1LL;
    *(void *)(v58 + 624) = a1[78];
    *(_OWORD *)(a1 + 71) = 0u;
    *(_OWORD *)(a1 + 73) = 0u;
    memcpy(__dst, a1, sizeof(__dst));
    memmove(a1, (const void *)v58, 0x278uLL);
    memcpy((void *)v58, __dst, 0x278uLL);
    a1[40] = a1 + 22;
    a1[43] = a1 + 26;
    a1[46] = a1 + 30;
    a1[49] = a1 + 34;
    *(_DWORD *)(v58 + 552) = 1;
    ctf_close(v58, v61, v62, v63, v64, v65, v66, v67);
  }

  return 0LL;
}

char *ctf_copy_membnames(uint64_t a1, char *a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    do
    {
      uint64_t v4 = *(const void **)(v3 + 16);
      if (v4)
      {
        size_t v5 = strlen(*(const char **)(v3 + 16)) + 1;
        memmove(a2, v4, v5);
        a2 += v5;
      }

      uint64_t v3 = *(void *)(v3 + 8);
    }

    while (v3);
  }

  return a2;
}

void *ctf_dtd_insert(void *result, void *a2)
{
  uint64_t v2 = (result[72] - 1LL) & a2[4];
  uint64_t v3 = result[71];
  a2[2] = *(void *)(v3 + 8 * v2);
  *(void *)(v3 + 8 * v2) = a2;
  uint64_t v4 = result + 73;
  size_t v5 = (void *)result[73];
  result[73] = a2;
  *a2 = v5;
  a2[1] = 0LL;
  if (v5) {
    uint64_t v4 = v5;
  }
  v4[1] = a2;
  return result;
}

void ctf_dtd_delete(void *a1, unsigned int *a2)
{
  uint64_t v4 = (void *)(a1[71] + 8 * ((a1[72] - 1LL) & *((void *)a2 + 4)));
  do
  {
    size_t v5 = v4;
    unsigned int v6 = (unsigned int *)*v4;
    uint64_t v4 = (void *)(*v4 + 16LL);
    if (v6) {
      BOOL v7 = v6 == a2;
    }
    else {
      BOOL v7 = 1;
    }
  }

  while (!v7);
  if (v6) {
    void *v5 = *v4;
  }
  int v8 = (unsigned __int16)a2[11] >> 11;
  switch((unsigned __int16)a2[11] >> 11)
  {
    case 3:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      uint64_t v9 = a2[12];
      goto LABEL_11;
    case 4:
      ctf_ref_dec((uint64_t)a1, *((void *)a2 + 8));
      uint64_t v9 = *((void *)a2 + 9);
LABEL_11:
      ctf_ref_dec((uint64_t)a1, v9);
      break;
    case 5:
      ctf_ref_dec((uint64_t)a1, a2[12]);
      unsigned int v14 = a2[11];
      if ((v14 & 0x3FF) != 0)
      {
        unint64_t v15 = 0LL;
        do
        {
          uint64_t v16 = *(void *)(*((void *)a2 + 8) + 8 * v15);
          if (v16)
          {
            ctf_ref_dec((uint64_t)a1, v16);
            unsigned int v14 = a2[11];
          }

          ++v15;
        }

        while (v15 < (v14 & 0x3FF));
      }

      free(*((void **)a2 + 8));
      break;
    case 6:
    case 7:
    case 8:
      uint64_t v10 = *((void *)a2 + 9);
      if (v10)
      {
        do
        {
          unsigned int v11 = *(void **)(v10 + 16);
          if (v11)
          {
            size_t v12 = ~strlen(*(const char **)(v10 + 16));
            free(v11);
            a1[75] += v12;
          }

          if (v8 != 8) {
            ctf_ref_dec((uint64_t)a1, *(void *)(v10 + 24));
          }
          uint64_t v13 = *(void *)(v10 + 8);
          free((void *)v10);
          uint64_t v10 = v13;
        }

        while (v13);
      }

      break;
    default:
      break;
  }

  uint64_t v17 = (void *)*((void *)a2 + 3);
  if (v17)
  {
    size_t v18 = ~strlen(*((const char **)a2 + 3));
    free(v17);
    a1[75] += v18;
  }

  int v19 = a1 + 73;
  uint64_t v20 = *(void *)a2;
  if (*(void *)a2) {
    __int32 v21 = *(void **)a2;
  }
  else {
    __int32 v21 = a1 + 73;
  }
  v21[1] = *((void *)a2 + 1);
  if (*((void *)a2 + 1)) {
    int v19 = (void *)*((void *)a2 + 1);
  }
  *int v19 = v20;
  free(a2);
}

uint64_t ctf_ref_dec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 8 * ((*(void *)(result + 576) - 1LL) & a2));
    if (v3)
    {
      while (*(void *)(v3 + 32) != a2)
      {
        uint64_t v3 = *(void *)(v3 + 16);
        if (!v3) {
          return result;
        }
      }

      if ((*(_BYTE *)(result + 556) & 4) != 0) {
        --*(_DWORD *)(v3 + 60);
      }
    }
  }

  return result;
}

uint64_t ctf_dtd_lookup(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 568);
  if (!v2) {
    return 0LL;
  }
  for (uint64_t result = *(void *)(v2 + 8 * ((*(void *)(a1 + 576) - 1LL) & a2)); result; uint64_t result = *(void *)(result + 16))
  {
    if (*(void *)(result + 32) == a2) {
      break;
    }
  }

  return result;
}

uint64_t ctf_discard(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 556);
  if ((v2 & 4) != 0)
  {
    if ((v2 & 8) != 0)
    {
      uint64_t v4 = *(unsigned int **)(a1 + 584);
      if (v4)
      {
        do
        {
          size_t v5 = *(unsigned int **)v4;
          uint64_t v4 = v5;
        }

        while (v5);
        int v2 = *(_DWORD *)(a1 + 556);
      }

      uint64_t result = 0LL;
      *(void *)(a1 + 60_Block_object_dispose(va, 8) = *(void *)(a1 + 616) + 1LL;
      *(_DWORD *)(a1 + 556) = v2 & 0xFFFFFFF7;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 560) = 1039;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t ctf_add_integer(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  return ctf_add_encoded(a1, a2, a3, a4, 1);
}

uint64_t ctf_add_encoded(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, int a5)
{
  if (a4)
  {
    uint64_t result = ctf_add_generic(a1, a2, a3, &v14);
    if (result != -1)
    {
      unint64_t v9 = (-(-*(_DWORD *)(a4 + 8) & 0xFFFFFFF8) >> 3) - 1LL;
      unint64_t v10 = v9 | (v9 >> 1) | ((v9 | (v9 >> 1)) >> 2);
      unint64_t v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
      uint64_t v12 = v14;
      *(_DWORD *)(v14 + 44) = ((a2 != 0) << 10) | (a5 << 11);
      *(_DWORD *)(v12 + 4_Block_object_dispose(va, 8) = ((v11 >> 16) | v11) + 1;
      int v13 = *(_DWORD *)(a4 + 8);
      *(void *)(v12 + 64) = *(void *)a4;
      *(_DWORD *)(v12 + 72) = v13;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1LL;
  }

  return result;
}

uint64_t ctf_add_generic(uint64_t a1, unsigned int a2, const char *a3, void *a4)
{
  if (a2 >= 2)
  {
    int v5 = 22;
LABEL_13:
    *(_DWORD *)(a1 + 560) = v5;
    return -1LL;
  }

  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    int v5 = 1039;
    goto LABEL_13;
  }

  if ((*(uint64_t (**)(void, uint64_t))(*(void *)a1 + 48LL))(*(unsigned int *)(a1 + 608), 1LL) >= 0xFFFFFFFFLL)
  {
    int v5 = 1041;
    goto LABEL_13;
  }

  int v8 = malloc(0x58uLL);
  if (!v8)
  {
LABEL_12:
    int v5 = 35;
    goto LABEL_13;
  }

  unint64_t v9 = v8;
  if (a3 && *a3)
  {
    unint64_t v10 = ctf_strdup(a3);
    if (!v10)
    {
      free(v9);
      goto LABEL_12;
    }
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  ++*(void *)(a1 + 608);
  uint64_t v11 = (*(uint64_t (**)(void))(*(void *)a1 + 48LL))();
  *(_OWORD *)(v9 + 5) = 0u;
  *(_OWORD *)(v9 + 7) = 0u;
  *(_OWORD *)(v9 + 9) = 0u;
  void v9[3] = v10;
  void v9[4] = v11;
  if (v10) {
    *(void *)(a1 + 600) += strlen(v10) + 1;
  }
  uint64_t v13 = (*(void *)(a1 + 576) - 1LL) & v11;
  uint64_t v14 = *(void *)(a1 + 568);
  void v9[2] = *(void *)(v14 + 8 * v13);
  *(void *)(v14 + 8 * v13) = v9;
  uint64_t v15 = a1 + 584;
  uint64_t v16 = *(void *)(a1 + 584);
  *(void *)(a1 + 584) = v9;
  *unint64_t v9 = v16;
  v9[1] = 0LL;
  if (v16) {
    uint64_t v15 = v16;
  }
  *(void *)(v15 + _Block_object_dispose(va, 8) = v9;
  *(_DWORD *)(a1 + 556) |= 8u;
  *a4 = v9;
  return v11;
}

uint64_t ctf_add_float(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  return ctf_add_encoded(a1, a2, a3, a4, 2);
}

uint64_t ctf_add_pointer(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 3);
}

uint64_t ctf_add_reftype(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  if (a3 == -1 || a3 >= 0xFFFFFFFFLL)
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1LL;
  }

  else
  {
    uint64_t v8 = ctf_add_generic(a1, a2, 0LL, &v11);
    if (v8 != -1)
    {
      ctf_ref_inc(a1, a3);
      uint64_t v9 = v11;
      *(_DWORD *)(v11 + 44) = ((a2 != 0) << 10) | (a4 << 11);
      *(_DWORD *)(v9 + 4_Block_object_dispose(va, 8) = a3;
    }
  }

  return v8;
}

uint64_t ctf_ref_inc(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 8 * ((*(void *)(result + 576) - 1LL) & a2));
    if (v3)
    {
      while (*(void *)(v3 + 32) != a2)
      {
        uint64_t v3 = *(void *)(v3 + 16);
        if (!v3) {
          return result;
        }
      }

      if ((*(_BYTE *)(result + 556) & 4) != 0) {
        ++*(_DWORD *)(v3 + 60);
      }
    }
  }

  return result;
}

uint64_t ctf_add_array(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  if (!a3)
  {
    int v10 = 22;
LABEL_20:
    *(_DWORD *)(a1 + 560) = v10;
    return -1LL;
  }

  uint64_t v17 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v17, *a3))
  {
    uint64_t v11 = *(void *)(a1 + 568);
    if (!v11 || (uint64_t v12 = *(void *)(v11 + 8 * ((*(void *)(a1 + 576) - 1LL) & *a3))) == 0)
    {
LABEL_19:
      int v10 = 1020;
      goto LABEL_20;
    }

    while (*(void *)(v12 + 32) != *a3)
    {
      uint64_t v12 = *(void *)(v12 + 16);
      if (!v12) {
        goto LABEL_19;
      }
    }
  }

  uint64_t v17 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v17, a3[1]))
  {
    uint64_t v13 = *(void *)(a1 + 568);
    if (v13)
    {
      uint64_t v14 = a3[1];
      uint64_t v15 = *(void *)(v13 + 8 * ((*(void *)(a1 + 576) - 1LL) & v14));
      if (v15)
      {
        while (*(void *)(v15 + 32) != v14)
        {
          uint64_t v15 = *(void *)(v15 + 16);
          if (!v15) {
            goto LABEL_19;
          }
        }

        goto LABEL_4;
      }
    }

    goto LABEL_19;
  }

LABEL_4:
  uint64_t v6 = ctf_add_generic(a1, a2, 0LL, &v18);
  if (v6 != -1)
  {
    if (a2) {
      int v7 = 9216;
    }
    else {
      int v7 = 0x2000;
    }
    uint64_t v8 = v18;
    *(_DWORD *)(v18 + 44) = v7;
    *(_DWORD *)(v8 + 4_Block_object_dispose(va, 8) = 0;
    uint64_t v9 = a3[2];
    *(_OWORD *)(v8 + 64) = *(_OWORD *)a3;
    *(void *)(v8 + 80) = v9;
    ctf_ref_inc(a1, *a3);
    ctf_ref_inc(a1, a3[1]);
  }

  return v6;
}

uint64_t ctf_set_array(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *(void *)(a1 + 568);
  if (v5)
  {
    for (uint64_t i = *(void *)(v5 + 8 * ((*(void *)(a1 + 576) - 1LL) & a2)); i; uint64_t i = *(void *)(i + 16))
    {
      if (*(void *)(i + 32) == a2) {
        break;
      }
    }
  }

  else
  {
    uint64_t i = 0LL;
  }

  if ((*(_BYTE *)(a1 + 556) & 4) != 0)
  {
    if (!i || (*(_DWORD *)(i + 44) & 0xF800) != 0x2000) {
      goto LABEL_23;
    }
    uint64_t v15 = a1;
    if (!ctf_lookup_by_id((uint64_t)&v15, *a3))
    {
      uint64_t v10 = *(void *)(a1 + 568);
      if (!v10) {
        goto LABEL_23;
      }
      uint64_t v11 = *(void *)(v10 + 8 * ((*(void *)(a1 + 576) - 1LL) & *a3));
      if (!v11) {
        goto LABEL_23;
      }
      while (*(void *)(v11 + 32) != *a3)
      {
        uint64_t v11 = *(void *)(v11 + 16);
        if (!v11) {
          goto LABEL_23;
        }
      }
    }

    uint64_t v15 = a1;
    if (ctf_lookup_by_id((uint64_t)&v15, a3[1]))
    {
LABEL_13:
      ctf_ref_dec(a1, *(void *)(i + 64));
      ctf_ref_dec(a1, *(void *)(i + 72));
      *(_DWORD *)(a1 + 556) |= 8u;
      __int128 v8 = *(_OWORD *)a3;
      *(void *)(i + 80) = a3[2];
      *(_OWORD *)(i + 64) = v8;
      ctf_ref_inc(a1, *a3);
      ctf_ref_inc(a1, a3[1]);
      return 0LL;
    }

    uint64_t v12 = *(void *)(a1 + 568);
    if (v12)
    {
      uint64_t v13 = a3[1];
      uint64_t v14 = *(void *)(v12 + 8 * ((*(void *)(a1 + 576) - 1LL) & v13));
      if (v14)
      {
        while (*(void *)(v14 + 32) != v13)
        {
          uint64_t v14 = *(void *)(v14 + 16);
          if (!v14) {
            goto LABEL_23;
          }
        }

        goto LABEL_13;
      }
    }

uint64_t ctf_add_function(uint64_t a1, unsigned int a2, uint64_t a3, void *a4)
{
  if (!a3 || (unsigned int v6 = *(_DWORD *)(a3 + 12), v6 > 1) || (v9 = *(_DWORD *)(a3 + 8), !a4) && v9)
  {
    int v10 = 22;
LABEL_6:
    *(_DWORD *)(a1 + 560) = v10;
    return -1LL;
  }

  if (v6) {
    unsigned int v13 = v9 + 1;
  }
  else {
    unsigned int v13 = *(_DWORD *)(a3 + 8);
  }
  if (v13 >= 0x400)
  {
    int v10 = 84;
    goto LABEL_6;
  }

  uint64_t v26 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v26, *(void *)a3))
  {
    uint64_t v18 = *(void *)(a1 + 568);
    if (!v18 || (uint64_t v19 = *(void *)(v18 + 8 * ((*(void *)(a1 + 576) - 1LL) & *(void *)a3))) == 0)
    {
LABEL_28:
      int v10 = 1020;
      goto LABEL_6;
    }

    while (*(void *)(v19 + 32) != *(void *)a3)
    {
      uint64_t v19 = *(void *)(v19 + 16);
      if (!v19) {
        goto LABEL_28;
      }
    }
  }

  if (*(_DWORD *)(a3 + 8))
  {
    for (unint64_t i = 0LL; i < *(unsigned int *)(a3 + 8); ++i)
    {
      uint64_t v26 = a1;
      if (!ctf_lookup_by_id((uint64_t)&v26, a4[i]))
      {
        uint64_t v15 = *(void *)(a1 + 568);
        if (!v15) {
          goto LABEL_28;
        }
        uint64_t v16 = a4[i];
        uint64_t v17 = *(void *)(v15 + 8 * ((*(void *)(a1 + 576) - 1LL) & v16));
        if (!v17) {
          goto LABEL_28;
        }
        while (*(void *)(v17 + 32) != v16)
        {
          uint64_t v17 = *(void *)(v17 + 16);
          if (!v17) {
            goto LABEL_28;
          }
        }
      }
    }
  }

  if (v13)
  {
    uint64_t v20 = malloc(8LL * v13);
    if (!v20)
    {
      int v10 = 35;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  uint64_t v11 = ctf_add_generic(a1, a2, 0LL, &v27);
  if (v11 == -1)
  {
    free(v20);
  }

  else
  {
    if (a2) {
      int v21 = 11264;
    }
    else {
      int v21 = 10240;
    }
    uint64_t v22 = v27;
    *(_DWORD *)(v27 + 44) = v21 & 0xFFFFFC00 | v13 & 0x3FF;
    *(_DWORD *)(v22 + 4_Block_object_dispose(va, 8) = *(void *)a3;
    ctf_ref_inc(a1, *(void *)a3);
    if (*(_DWORD *)(a3 + 8))
    {
      unint64_t v23 = 0LL;
      do
      {
        ctf_ref_inc(a1, a4[v23++]);
        unint64_t v24 = *(unsigned int *)(a3 + 8);
      }

      while (v23 < v24);
      size_t v25 = 8 * v24;
    }

    else
    {
      size_t v25 = 0LL;
    }

    memcpy(v20, a4, v25);
    if ((*(_BYTE *)(a3 + 12) & 1) != 0) {
      *((void *)v20 + v13 - 1) = 0LL;
    }
    *(void *)(v22 + 64) = v20;
  }

  return v11;
}

uint64_t ctf_add_struct(uint64_t a1, unsigned int a2, char *__s)
{
  if (__s
    && (v6 = strlen(__s), (int v7 = ctf_hash_lookup(a1 + 176, a1, __s, v6)) != 0LL)
    && (__int128 v8 = v7, ctf_type_kind(a1, v7[1]) == 9))
  {
    uint64_t result = v8[1];
    uint64_t v10 = *(void *)(a1 + 568) + 8LL * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *(void *)(*(void *)v10 + 32LL);
      uint64_t v10 = *(void *)v10 + 16LL;
    }

    while (v12 != result);
  }

  else
  {
    uint64_t result = ctf_add_generic(a1, a2, __s, &v14);
    if (result == -1) {
      return result;
    }
    uint64_t v11 = v14;
  }

  if (a2) {
    int v13 = 13312;
  }
  else {
    int v13 = 12288;
  }
  *(_DWORD *)(v11 + 44) = v13;
  *(_DWORD *)(v11 + 4_Block_object_dispose(va, 8) = 0;
  return result;
}

uint64_t ctf_add_union(uint64_t a1, unsigned int a2, char *__s)
{
  if (__s
    && (v6 = strlen(__s), (int v7 = ctf_hash_lookup(a1 + 208, a1, __s, v6)) != 0LL)
    && (__int128 v8 = v7, ctf_type_kind(a1, v7[1]) == 9))
  {
    uint64_t result = v8[1];
    uint64_t v10 = *(void *)(a1 + 568) + 8LL * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *(void *)(*(void *)v10 + 32LL);
      uint64_t v10 = *(void *)v10 + 16LL;
    }

    while (v12 != result);
  }

  else
  {
    uint64_t result = ctf_add_generic(a1, a2, __s, &v14);
    if (result == -1) {
      return result;
    }
    uint64_t v11 = v14;
  }

  if (a2) {
    int v13 = 15360;
  }
  else {
    int v13 = 14336;
  }
  *(_DWORD *)(v11 + 44) = v13;
  *(_DWORD *)(v11 + 4_Block_object_dispose(va, 8) = 0;
  return result;
}

uint64_t ctf_add_enum(uint64_t a1, unsigned int a2, char *a3)
{
  return ctf_add_enum_sized(a1, a2, a3, *(unsigned __int16 *)(*(void *)(a1 + 520) + 40LL));
}

uint64_t ctf_add_enum_sized(uint64_t a1, unsigned int a2, char *__s, int a4)
{
  if (__s
    && (size_t v8 = strlen(__s), (v9 = ctf_hash_lookup(a1 + 240, a1, __s, v8)) != 0LL)
    && (uint64_t v10 = v9, ctf_type_kind(a1, v9[1]) == 9))
  {
    uint64_t result = v10[1];
    uint64_t v12 = *(void *)(a1 + 568) + 8LL * ((*(_DWORD *)(a1 + 576) - 1) & result);
    do
    {
      uint64_t v13 = *(void *)v12;
      uint64_t v14 = *(void *)(*(void *)v12 + 32LL);
      uint64_t v12 = *(void *)v12 + 16LL;
    }

    while (v14 != result);
  }

  else
  {
    uint64_t result = ctf_add_generic(a1, a2, __s, &v16);
    if (result == -1) {
      return result;
    }
    uint64_t v13 = v16;
  }

  if (a2) {
    int v15 = 17408;
  }
  else {
    int v15 = 0x4000;
  }
  *(_DWORD *)(v13 + 44) = v15;
  *(_DWORD *)(v13 + 4_Block_object_dispose(va, 8) = a4;
  return result;
}

uint64_t ctf_add_forward(uint64_t a1, unsigned int a2, char *__s, int a4)
{
  unsigned int v6 = a2;
  uint64_t v7 = a1;
  switch(a4)
  {
    case 8:
      uint64_t v8 = a1 + 240;
      if (__s) {
        goto LABEL_7;
      }
      break;
    case 7:
      uint64_t v8 = a1 + 208;
      if (__s) {
        goto LABEL_7;
      }
      break;
    case 6:
      uint64_t v8 = a1 + 176;
      if (!__s) {
        break;
      }
LABEL_7:
      size_t v9 = strlen(__s);
      uint64_t v10 = ctf_hash_lookup(v8, v7, __s, v9);
      if (v10) {
        return v10[1];
      }
      a1 = v7;
      a2 = v6;
      uint64_t v12 = __s;
      goto LABEL_13;
    default:
      *(_DWORD *)(a1 + 560) = 1023;
      return -1LL;
  }

  uint64_t v12 = 0LL;
LABEL_13:
  uint64_t result = ctf_add_generic(a1, a2, v12, &v15);
  if (result != -1)
  {
    uint64_t v13 = v15;
    if (v6) {
      int v14 = 19456;
    }
    else {
      int v14 = 18432;
    }
    *(_DWORD *)(v15 + 44) = v14;
    *(_DWORD *)(v13 + 4_Block_object_dispose(va, 8) = a4;
  }

  return result;
}

uint64_t ctf_add_typedef(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  uint64_t v14 = a1;
  if (a4 == -1) {
    goto LABEL_12;
  }
  if (!ctf_lookup_by_id((uint64_t)&v14, a4))
  {
    uint64_t v11 = *(void *)(a1 + 568);
    if (v11)
    {
      uint64_t v12 = *(void *)(v11 + 8 * ((*(void *)(a1 + 576) - 1LL) & a4));
      if (v12)
      {
        while (*(void *)(v12 + 32) != a4)
        {
          uint64_t v12 = *(void *)(v12 + 16);
          if (!v12) {
            goto LABEL_12;
          }
        }

        goto LABEL_3;
      }
    }

uint64_t ctf_add_volatile(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 11);
}

uint64_t ctf_add_const(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 12);
}

uint64_t ctf_add_restrict(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return ctf_add_reftype(a1, a2, a3, 13);
}

uint64_t ctf_add_enumerator(uint64_t a1, uint64_t a2, char *__s2, int a4)
{
  uint64_t v7 = *(void *)(a1 + 568);
  if (!v7)
  {
    uint64_t i = 0LL;
    if (__s2) {
      goto LABEL_6;
    }
LABEL_9:
    int v9 = 22;
    goto LABEL_16;
  }

  for (uint64_t i = *(void *)(v7 + 8 * ((*(void *)(a1 + 576) - 1LL) & a2)); i; uint64_t i = *(void *)(i + 16))
  {
    if (*(void *)(i + 32) == a2) {
      break;
    }
  }

  if (!__s2) {
    goto LABEL_9;
  }
LABEL_6:
  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    int v9 = 1039;
LABEL_16:
    *(_DWORD *)(a1 + 560) = v9;
    return 0xFFFFFFFFLL;
  }

  if (!i)
  {
    int v9 = 1020;
    goto LABEL_16;
  }

  int v10 = *(_DWORD *)(i + 44);
  if ((v10 & 0xF800) != 0x4000)
  {
    int v9 = 1022;
    goto LABEL_16;
  }

  if ((~v10 & 0x3FF) == 0)
  {
    int v9 = 1040;
    goto LABEL_16;
  }

  uint64_t v12 = *(void *)(i + 72);
  if (v12)
  {
    while (strcmp(*(const char **)(v12 + 16), __s2))
    {
      uint64_t v12 = *(void *)(v12 + 8);
      if (!v12) {
        goto LABEL_20;
      }
    }

    int v9 = 1042;
    goto LABEL_16;
  }

uint64_t ctf_add_member(uint64_t a1, uint64_t a2, char *__s2, uint64_t a4)
{
  uint64_t v5 = __s2;
  uint64_t v7 = *(void *)(a1 + 568);
  if (v7)
  {
    for (uint64_t i = *(void *)(v7 + 8 * ((*(void *)(a1 + 576) - 1LL) & a2)); i; uint64_t i = *(void *)(i + 16))
    {
      if (*(void *)(i + 32) == a2) {
        break;
      }
    }
  }

  else
  {
    uint64_t i = 0LL;
  }

  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    int v9 = 1039;
LABEL_15:
    *(_DWORD *)(a1 + 560) = v9;
    return 0xFFFFFFFFLL;
  }

  if (!i)
  {
    int v9 = 1020;
    goto LABEL_15;
  }

  int v10 = *(_DWORD *)(i + 44);
  int v11 = (unsigned __int16)v10 >> 11;
  if ((v11 - 8) <= 0xFFFFFFFD)
  {
    int v9 = 1021;
    goto LABEL_15;
  }

  if ((*(_DWORD *)(i + 44) & 0x3FF) == 0x3FF)
  {
    int v9 = 1040;
    goto LABEL_15;
  }

  if (__s2)
  {
    uint64_t v13 = *(void *)(i + 72);
    if (v13)
    {
      while (1)
      {
        uint64_t v14 = *(const char **)(v13 + 16);
        if (v14)
        {
          if (!strcmp(v14, v5)) {
            break;
          }
        }

        uint64_t v13 = *(void *)(v13 + 8);
        if (!v13) {
          goto LABEL_22;
        }
      }

      int v9 = 1042;
      goto LABEL_15;
    }
  }

LABEL_22:
  uint64_t v15 = ctf_type_size(a1, a4);
  if (v15 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = v15;
  unint64_t v17 = ctf_type_align(a1, a4);
  if (v17 == -1LL) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = v17;
  uint64_t v19 = malloc(0x30uLL);
  if (!v19)
  {
LABEL_29:
    int v9 = 35;
    goto LABEL_15;
  }

  uint64_t v20 = v19;
  if (v5)
  {
    if (*v5)
    {
      uint64_t v5 = ctf_strdup(v5);
      if (!v5)
      {
        free(v20);
        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  void v20[2] = v5;
  v20[3] = a4;
  *((_DWORD *)v20 + 10) = -1;
  if ((v10 & 0x3FF) != 0 && v11 == 6)
  {
    uint64_t v37 = v5;
    uint64_t v21 = *(void *)(i + 64);
    uint64_t v22 = ctf_type_resolve(a1, *(void *)(v21 + 24));
    uint64_t v23 = *(void *)(v21 + 32);
    if (ctf_type_encoding((uint64_t (***)(uint64_t))a1, v22, v38) == -1)
    {
      uint64_t v26 = ctf_type_size(a1, v22);
      uint64_t v24 = v23 + 8 * v26;
      if (v26 == -1) {
        uint64_t v24 = v23;
      }
    }

    else
    {
      uint64_t v24 = v23 + v38[2];
    }

    uint64_t v5 = v37;
    unint64_t v27 = v24 + 7;
    if (v18 <= 1) {
      unint64_t v28 = 1LL;
    }
    else {
      unint64_t v28 = v18;
    }
    unint64_t v29 = (v27 >> 3) % v28;
    unint64_t v30 = v28 - v29;
    if (v29) {
      unint64_t v31 = v30;
    }
    else {
      unint64_t v31 = 0LL;
    }
    unint64_t v32 = v31 + (v27 >> 3);
    v20[4] = 8 * v32;
    v16 += v32;
  }

  else
  {
    v20[4] = 0LL;
    int64_t ctt_size = ctf_get_ctt_size((_DWORD *)a1, i + 40, 0LL, 0LL);
    if (ctt_size > v16) {
      uint64_t v16 = ctt_size;
    }
  }

  if (v16 <= (*(unsigned int (**)(void))(*(void *)a1 + 56LL))())
  {
    int v33 = v16;
  }

  else
  {
    int v33 = (*(uint64_t (**)(void))(*(void *)a1 + 64LL))();
    *(void *)(i + 52) = __ROR8__(v16, 32);
  }

  uint64_t v36 = *(void **)(i + 64);
  __int32 v35 = (void *)(i + 64);
  uint64_t v34 = v36;
  *((_DWORD *)v35 - 5) = v10 & 0x400 | (v11 << 11) | (v10 + 1) & 0x3FF;
  *((_DWORD *)v35 - 4) = v33;
  void *v35 = v20;
  void *v20 = v36;
  v20[1] = 0LL;
  if (!v36) {
    uint64_t v34 = v35;
  }
  v34[1] = v20;
  if (v5) {
    *(void *)(a1 + 600) += strlen(v5) + 1;
  }
  ctf_ref_inc(a1, a4);
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_delete_type(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (v4)
  {
    for (uint64_t i = *(void *)(v4 + 8 * ((*(void *)(a1 + 576) - 1LL) & a2)); i; uint64_t i = *(void *)(i + 16))
    {
      if (*(void *)(i + 32) == a2) {
        break;
      }
    }
  }

  else
  {
    uint64_t i = 0LL;
  }

  if ((*(_BYTE *)(a1 + 556) & 4) == 0)
  {
    int v6 = 1039;
LABEL_20:
    *(_DWORD *)(a1 + 560) = v6;
    return 0xFFFFFFFFLL;
  }

  uint64_t v10 = a1;
  if (!ctf_lookup_by_id((uint64_t)&v10, a2))
  {
    uint64_t v7 = *(void *)(a1 + 568);
    if (!v7) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v8 = *(void *)(v7 + 8 * ((*(void *)(a1 + 576) - 1LL) & a2));
    if (!v8) {
      return 0xFFFFFFFFLL;
    }
    while (*(void *)(v8 + 32) != a2)
    {
      uint64_t v8 = *(void *)(v8 + 16);
      if (!v8) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if (!i)
  {
    int v6 = 1045;
    goto LABEL_20;
  }

  if (*(_DWORD *)(i + 60) || *(_DWORD *)(a1 + 552) >= 2u)
  {
    int v6 = 1044;
    goto LABEL_20;
  }

  ctf_dtd_delete((void *)a1, (unsigned int *)i);
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 556) |= 8u;
  return result;
}

uint64_t ctf_add_type(uint64_t a1, uint64_t (***a2)(uint64_t), uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v73 = a2;
  if (a2 != (uint64_t (***)(uint64_t))a1)
  {
    if ((*(_BYTE *)(a1 + 556) & 4) == 0)
    {
      int v5 = 1039;
LABEL_92:
      *(_DWORD *)(a1 + 560) = v5;
      return -1LL;
    }

    int v6 = (unsigned int *)ctf_lookup_by_id((uint64_t)&v73, a3);
    uint64_t v7 = v73;
    if (!v6)
    {
LABEL_91:
      int v5 = *((_DWORD *)v7 + 140);
      goto LABEL_92;
    }

    uint64_t v8 = v6;
    unint64_t v9 = *v6;
    uint64_t v10 = &v73[2 * (v9 >> 31)];
    int v11 = v10[53];
    if (v11)
    {
      unint64_t v12 = v9 & 0x7FFFFFFF;
      uint64_t v13 = (char *)v11 + v12;
      else {
        uint64_t v14 = v13;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = "(?)";
    }
    else {
      uint64_t v16 = *((unsigned __int16 *)v6 + 2);
    }
    int v17 = (**v73)(v16);
    else {
      uint64_t v18 = *((unsigned __int16 *)v8 + 2);
    }
    unsigned int v19 = (*v7)[1](v18);
    else {
      uint64_t v20 = *((unsigned __int16 *)v8 + 2);
    }
    __int16 v21 = (*v7)[2](v20);
    __int16 v22 = v21;
    switch(v17)
    {
      case 8:
        uint64_t v23 = a1 + 240;
        break;
      case 7:
        uint64_t v23 = a1 + 208;
        break;
      case 6:
        uint64_t v23 = a1 + 176;
        break;
      default:
        uint64_t v23 = a1 + 272;
        break;
    }

    unsigned int v61 = v19;
    if ((v19 & 1) != 0)
    {
      if (!*v15)
      {
        __int16 v25 = v21;
        int v24 = 0;
        goto LABEL_56;
      }

      size_t v26 = strlen(v15);
      unint64_t v27 = ctf_hash_lookup(v23, a1, v15, v26);
      if (v27)
      {
        uint64_t v28 = v27[1];
        int v29 = ctf_type_kind(a1, v28);
        if (v29 == v17)
        {
          __int16 v25 = v22;
          int v30 = 0;
          int v24 = v17;
          goto LABEL_57;
        }

        int v24 = 9;
        if (!*v15) {
          goto LABEL_31;
        }
      }

      else
      {
        int v24 = 0;
      }
    }

    else
    {
      int v24 = 0;
      if (!*v15)
      {
LABEL_31:
        __int16 v25 = v22;
LABEL_56:
        uint64_t v28 = -1LL;
        int v30 = 1;
LABEL_57:
        v72[0] = v7;
        v72[1] = v3;
        v72[2] = 0LL;
        uint64_t v69 = a1;
        uint64_t v70 = v28;
        __int128 v71 = 0LL;
        switch(v17)
        {
          case 1:
          case 2:
            if (v30)
            {
              if (v17 == 1) {
                int v37 = 1;
              }
              else {
                int v37 = 2;
              }
              return ctf_add_encoded(a1, v61, v15, (uint64_t)&v67, v37);
            }

            return v28;
          case 3:
          case 11:
          case 12:
          case 13:
            uint64_t v34 = ctf_type_reference((uint64_t)v7, v3);
            uint64_t v35 = ctf_add_type(a1, v7, v34);
            if (v35 == -1) {
              return -1LL;
            }
            return ctf_add_reftype(a1, v61, v35, v17);
          case 4:
            uint64_t v39 = ctf_add_type(a1, v7, v64);
            uint64_t v64 = v39;
            uint64_t v40 = ctf_add_type(a1, v7, v65);
            uint64_t v65 = v40;
            uint64_t v3 = -1LL;
            if (v39 == -1 || v40 == -1) {
              return v3;
            }
            if ((v30 & 1) != 0)
            {
              return ctf_add_array(a1, v61, &v64);
            }

            else
            {
              if (v64 != v63[0] || v65 != v63[1] || v66 != v63[2])
              {
                *(_DWORD *)(a1 + 560) = 1043;
                return v3;
              }
            }

            return v28;
          case 5:
            else {
              unsigned int v41 = *((unsigned __int16 *)v8 + 3);
            }
            uint64_t v64 = ctf_add_type(a1, v7, v41);
            uint64_t v65 = 0LL;
            if (v64 == -1) {
              return -1LL;
            }
            return ctf_add_function(a1, v61, (uint64_t)&v64, 0LL);
          case 6:
          case 7:
            if (v28 != -1 && v24 != 9)
            {
              uint64_t v38 = ctf_type_size((uint64_t)v7, v3);
              if (v38 != ctf_type_size(a1, v28)
                || ctf_member_iter( (int *)v7,  v3,  (uint64_t (*)(const char *, void, unint64_t, uint64_t))membcmp,  (uint64_t)&v69))
              {
                break;
              }

              return v28;
            }

            uint64_t v45 = ctf_add_generic(a1, v61, v15, &v62);
            if (v45 != -1)
            {
              uint64_t v28 = v45;
              uint64_t v46 = v62;
              uint64_t v70 = v45;
              __int128 v71 = v62;
              int v47 = ctf_member_iter( (int *)v7,  v3,  (uint64_t (*)(const char *, void, unint64_t, uint64_t))membadd,  (uint64_t)&v69) != 0;
              uint64_t v48 = ctf_type_size((uint64_t)v7, v3);
              if (v48 <= (*(unsigned int (**)(void))(*(void *)a1 + 56LL))())
              {
                int v49 = v48;
              }

              else
              {
                int v49 = (*(uint64_t (**)(void))(*(void *)a1 + 64LL))();
                *(uint64_t *)((char *)v46 + 52) = __ROR8__(v48, 32);
              }

              *((_DWORD *)v46 + 11) = (v17 << 11) | ((v61 != 0) << 10) | v25 & 0x3FF;
              *((_DWORD *)v46 + 12) = v49;
              for (uint64_t i = v46[9]; i; uint64_t i = *(void *)(i + 8))
              {
                uint64_t v55 = ctf_add_type(a1, v7, *(void *)(i + 24));
                *(void *)(i + 24) = v55;
                if (v55 == -1) {
                  ++v47;
                }
              }

              if (!v47)
              {
                for (uint64_t j = v46[9]; j; uint64_t j = *(void *)(j + 8))
                  ctf_ref_inc(a1, *(void *)(j + 24));
                return v28;
              }
            }

            return -1LL;
          case 8:
            if (v28 == -1 || v24 == 9)
            {
              else {
                LOWORD(v50) = *((_WORD *)v8 + 3);
              }
              uint64_t v57 = ctf_add_enum_sized(a1, v61, v15, (unsigned __int16)v50);
              uint64_t v70 = v57;
              if (v57 == -1) {
                return -1LL;
              }
              uint64_t v28 = v57;
              if (ctf_enum_iter( (uint64_t)v7,  v3,  (uint64_t (*)(char *, void, uint64_t))enumadd,  (uint64_t)&v69)) {
                return -1LL;
              }
              return v28;
            }

            if (!ctf_enum_iter( (uint64_t)v7,  v3,  (uint64_t (*)(char *, void, uint64_t))enumcmp,  (uint64_t)&v69)
              && !ctf_enum_iter( a1,  v28,  (uint64_t (*)(char *, void, uint64_t))enumcmp,  (uint64_t)v72))
            {
              return v28;
            }

            break;
          case 9:
            if (!v30) {
              return v28;
            }
            return ctf_add_forward(a1, v61, v15, 6);
          case 10:
            uint64_t v42 = ctf_type_reference((uint64_t)v7, v3);
            uint64_t v43 = ctf_add_type(a1, v7, v42);
            if (v43 == -1) {
              return -1LL;
            }
            if (!v30) {
              return v28;
            }
            return ctf_add_typedef(a1, v61, v15, v43);
          case 14:
            if ((v30 & 1) != 0) {
              goto LABEL_111;
            }
            if ((_DWORD)v64 != LODWORD(v63[0]) || WORD2(v64) != WORD2(v63[0])) {
              break;
            }
LABEL_111:
            uint64_t v52 = ctf_type_reference((uint64_t)v7, v3);
            uint64_t v53 = ctf_add_type(a1, v7, v52);
            if (v53 == -1) {
              return -1LL;
            }
            return ctf_add_ptrauth(a1, v61, v53, (uint64_t)&v64);
          default:
            int v5 = 1007;
            goto LABEL_92;
        }

uint64_t ctf_add_intrinsic(uint64_t a1, uint64_t a2, uint64_t a3, char *__s)
{
  if (!__s) {
    return 0LL;
  }
  if (!*__s) {
    return 0LL;
  }
  uint64_t v8 = a2 + 272;
  size_t v9 = strlen(__s);
  uint64_t result = (uint64_t)ctf_hash_lookup(v8, a2, __s, v9);
  if (result)
  {
    uint64_t v11 = *(unsigned int *)(result + 4);
    if (v11 == a3) {
      return 0LL;
    }
    if (ctf_type_encoding((uint64_t (***)(uint64_t))a2, v11, (unsigned int *)&v15)
      || ctf_type_encoding((uint64_t (***)(uint64_t))a2, a3, (unsigned int *)&v13))
    {
      *(_DWORD *)(a1 + 560) = *(_DWORD *)(a2 + 560);
      return -1LL;
    }

    else
    {
      uint64_t result = ctf_add_type(a1, a2, v11);
      if (result != -1) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t ctf_add_ptrauth(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (a3 < 0xFFFFFFFFLL)
  {
    uint64_t v5 = ctf_add_generic(a1, a2, 0LL, &v13);
    if (v5 != -1)
    {
      ctf_ref_inc(a1, a3);
      if (a2) {
        int v9 = 29696;
      }
      else {
        int v9 = 28672;
      }
      uint64_t v10 = v13;
      *(_DWORD *)(v13 + 44) = v9;
      *(_DWORD *)(v10 + 4_Block_object_dispose(va, 8) = a3;
      __int16 v11 = *(_WORD *)(a4 + 4);
      *(_DWORD *)(v10 + 64) = *(_DWORD *)a4;
      *(_WORD *)(v10 + 6_Block_object_dispose(va, 8) = v11;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 560) = 22;
    return -1LL;
  }

  return v5;
}

BOOL membcmp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = a1;
  v5[1] = a3;
  return ctf_member_iter( *(int **)a4,  *(void *)(a4 + 8),  (uint64_t (*)(const char *, void, unint64_t, uint64_t))membmatch,  (uint64_t)v5) != 1;
}

uint64_t membadd(const char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = malloc(0x30uLL);
  if (!v8) {
    goto LABEL_6;
  }
  int v9 = v8;
  if (a1 && *a1)
  {
    uint64_t v10 = ctf_strdup(a1);
    if (!v10)
    {
      free(v9);
LABEL_6:
      *(_DWORD *)(*a4 + 560LL) = 35;
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  void v9[2] = v10;
  void v9[3] = a2;
  void v9[4] = a3;
  *((_DWORD *)v9 + 10) = -1;
  uint64_t v12 = a4[2];
  uint64_t v15 = *(void **)(v12 + 64);
  uint64_t v13 = (void *)(v12 + 64);
  int v14 = v15;
  *uint64_t v13 = v9;
  *int v9 = v15;
  v9[1] = 0LL;
  if (v15) {
    uint64_t v13 = v14;
  }
  v13[1] = v9;
  uint64_t v16 = *a4;
  if (v10) {
    *(void *)(v16 + 600) += strlen(v10) + 1;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v16 + 556) |= 8u;
  return result;
}

BOOL enumcmp(const char *a1, int a2, uint64_t *a3)
{
  return ctf_enum_value(*a3, a3[1], a1, &v6) == -1 || v6 != a2;
}

BOOL enumadd(char *__s2, int a2, uint64_t *a3)
{
  return ctf_add_enumerator(*a3, a3[1], __s2, a2) == -1;
}

BOOL membmatch(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return !strcmp(a1, *(const char **)a4) && *(void *)(a4 + 8) == a3;
}

double ctf_decl_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 64) = -1LL;
  *(void *)(a1 + 72) = -1LL;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = a2;
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a2 + a3;
  return result;
}

void *ctf_decl_fini(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    double result = *(void **)(a1 + 16 * i + 8);
    if (result)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        free(result);
        double result = v4;
      }

      while (v4);
    }
  }

  return result;
}

uint64_t ctf_decl_push(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  while (2)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a1;
    int v33 = a2;
    uint64_t result = ctf_lookup_by_id((uint64_t)&v33, a3);
    int v6 = v33;
    if (!result)
    {
      int v9 = v33[140];
LABEL_51:
      v4[30] = v9;
      return result;
    }

    uint64_t v7 = (unsigned int *)result;
    else {
      uint64_t v8 = *(unsigned __int16 *)(result + 4);
    }
    int v10 = (**(uint64_t (***)(uint64_t))v33)(v8);
    int v11 = 0;
    int v12 = 1;
    unsigned int v13 = 0;
    switch(v10)
    {
      case 3:
        else {
          unsigned int v15 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v15);
        int v11 = 0;
        unsigned int v13 = 1;
        goto LABEL_34;
      case 4:
        ctf_array_info(v6, v3, (uint64_t)&v31);
        ctf_decl_push(v4, v6, v31);
        int v11 = 0;
        unsigned int v13 = 2;
        int v12 = v32;
        goto LABEL_34;
      case 5:
        else {
          unsigned int v16 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v16);
        int v11 = 0;
        unsigned int v13 = 3;
        goto LABEL_34;
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_34;
      case 10:
        unint64_t v17 = *v7;
        uint64_t v18 = &v6[4 * (v17 >> 31)];
        uint64_t v19 = *((void *)v18 + 53);
        if (v19)
        {
          unint64_t v20 = v17 & 0x7FFFFFFF;
          __int16 v21 = (const char *)(v19 + v20);
          if (*((void *)v18 + 54) <= v20) {
            __int16 v22 = 0LL;
          }
          else {
            __int16 v22 = v21;
          }
        }

        else
        {
          __int16 v22 = 0LL;
        }

        if (!v22) {
          __int16 v22 = "(?)";
        }
        if (!*v22)
        {
          else {
            unsigned int v30 = *((unsigned __int16 *)v7 + 3);
          }
          a3 = v30;
          a1 = v4;
          a2 = v6;
          continue;
        }

        int v11 = 0;
        unsigned int v13 = 0;
LABEL_34:
        uint64_t result = (uint64_t)malloc(0x20uLL);
        if (!result)
        {
          int v9 = 35;
          goto LABEL_51;
        }

        *(void *)(result + 16) = v3;
        *(_DWORD *)(result + 24) = v10;
        *(_DWORD *)(result + 2_Block_object_dispose(va, 8) = v12;
        int v24 = (uint64_t *)&v4[4 * v13];
        __int16 v25 = (uint64_t *)v24[1];
        if (!v25)
        {
          int v26 = v4[21];
          v4[21] = v26 + 1;
          v4[v13 + 16] = v26;
        }

        if (v13 <= 1 && v13 > v4[20]) {
          v4[20] = v13;
        }
        if (v13) {
          int v27 = 0;
        }
        else {
          int v27 = v11;
        }
        if (v10 != 4 && v27 == 0)
        {
          int v29 = (uint64_t *)*v24;
          *int v24 = result;
          *(void *)uint64_t result = v29;
          *(void *)(result + _Block_object_dispose(va, 8) = 0LL;
          if (v29) {
            int v24 = v29;
          }
          v24[1] = result;
        }

        else
        {
          v24[1] = result;
          *(void *)uint64_t result = 0LL;
          *(void *)(result + _Block_object_dispose(va, 8) = v25;
          if (v25) {
            int v24 = v25;
          }
          *int v24 = result;
        }

        return result;
      case 11:
      case 12:
      case 13:
        else {
          unsigned int v14 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v14);
        unsigned int v13 = v4[20];
        int v11 = 1;
        goto LABEL_34;
      case 14:
        else {
          unsigned int v23 = *((unsigned __int16 *)v7 + 3);
        }
        ctf_decl_push(v4, v6, v23);
        int v11 = 0;
        unsigned int v13 = v4[20];
        goto LABEL_34;
      default:
        unsigned int v13 = 0;
        goto LABEL_34;
    }
  }

uint64_t ctf_decl_sprintf(void *a1, char *__format, ...)
{
  uint64_t v3 = a1[13];
  uint64_t v4 = (char *)a1[12];
  unint64_t v5 = v3 - (void)v4;
  uint64_t result = vsnprintf(v4, v3 - (void)v4, __format, va);
  unint64_t v7 = (int)result;
  a1[12] += v7;
  a1[14] += (int)result;
  return result;
}

char *ctf_errmsg(int a1)
{
  else {
    uint64_t result = _ctf_errlist[a1 - 1000];
  }
  if (!result) {
    return "Unknown error";
  }
  return result;
}

uint64_t ctf_errno(uint64_t a1)
{
  return *(unsigned int *)(a1 + 560);
}

uint64_t ctf_hash_create(uint64_t a1, unint64_t a2)
{
  if (HIDWORD(a2)) {
    return 84LL;
  }
  if (a2)
  {
    unsigned int v4 = a2 + 1;
    *(_DWORD *)(a1 + 16) = 211;
    *(_DWORD *)(a1 + 20) = a2 + 1;
    *(_DWORD *)(a1 + 24) = 1;
    unint64_t v5 = malloc(0x34CuLL);
    *(void *)a1 = v5;
    size_t v6 = 12LL * v4;
    unint64_t v7 = malloc(v6);
    *(void *)(a1 + _Block_object_dispose(va, 8) = v7;
    if (v5 && (uint64_t v8 = v7) != 0LL)
    {
      bzero(v5, 0x34CuLL);
      bzero(v8, v6);
      return 0LL;
    }

    else
    {
      ctf_hash_destroy(a1);
      return 35LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)(a1 + 24) = 0LL;
    *(void *)a1 = &_CTF_EMPTY;
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    *(_DWORD *)(a1 + 16) = 1;
  }

  return result;
}

void ctf_hash_destroy(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2 && *(_DWORD *)(a1 + 16) != 1)
  {
    free(v2);
    *(void *)a1 = 0LL;
  }

  uint64_t v3 = *(void **)(a1 + 8);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

uint64_t ctf_hash_size(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  BOOL v2 = v1 != 0;
  unsigned int v3 = v1 - 1;
  if (v2) {
    return v3;
  }
  else {
    return 0LL;
  }
}

uint64_t ctf_hash_insert(uint64_t *a1, uint64_t a2, int a3, unsigned int a4)
{
  if (!a3) {
    return 22LL;
  }
  unsigned int v5 = *((_DWORD *)a1 + 6);
  if (v5 >= *((_DWORD *)a1 + 5)) {
    return 84LL;
  }
  uint64_t v6 = a4 >> 31;
  uint64_t v7 = *(void *)(a2 + 16LL * v6 + 424);
  if (!v7) {
    return 1018LL;
  }
  unint64_t v8 = a4 & 0x7FFFFFFF;
  if (*(void *)(a2 + 16 * v6 + 432) <= v8) {
    return 1019LL;
  }
  int v9 = (const char *)(v7 + v8);
  if (!*(_BYTE *)(v7 + v8)) {
    return 0LL;
  }
  uint64_t v10 = a1[1];
  *(_DWORD *)(v10 + 12LL * v5) = a4;
  *(_DWORD *)(v10 + 12LL * v5 + 4) = a3;
  int64_t v11 = strlen(v9);
  if (v11 < 1)
  {
    unint64_t v12 = 0LL;
  }

  else
  {
    unint64_t v12 = 0LL;
    unsigned int v13 = &v9[v11];
    do
    {
      uint64_t v14 = *v9++;
      unint64_t v12 = v14 + 16 * v12;
      if ((v12 & 0xF0000000) != 0) {
        unint64_t v12 = v12 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v12 & 0xF0000000) >> 24);
      }
    }

    while (v9 < v13);
  }

  uint64_t result = 0LL;
  unint64_t v16 = v12 % *((unsigned int *)a1 + 4);
  uint64_t v17 = *a1;
  *(_DWORD *)(v10 + 12LL * v5 + _Block_object_dispose(va, 8) = *(_DWORD *)(*a1 + 4 * v16);
  *((_DWORD *)a1 + 6) = v5 + 1;
  *(_DWORD *)(v17 + 4 * v16) = v5;
  return result;
}

uint64_t ctf_hash_define(uint64_t *a1, uint64_t a2, int a3, unsigned int a4)
{
  uint64_t v8 = a4 >> 31;
  uint64_t v9 = *(void *)(a2 + 16LL * v8 + 424);
  if (v9)
  {
    unint64_t v10 = a4 & 0x7FFFFFFF;
    int64_t v11 = (char *)(v9 + v10);
    if (*(void *)(a2 + 16 * v8 + 432) <= v10) {
      unint64_t v12 = 0LL;
    }
    else {
      unint64_t v12 = v11;
    }
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  if (v12) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = "(?)";
  }
  size_t v14 = strlen(v13);
  unsigned int v15 = ctf_hash_lookup((uint64_t)a1, a2, v13, v14);
  if (!v15) {
    return ctf_hash_insert(a1, a2, a3, a4);
  }
  v15[1] = a3;
  return 0LL;
}

_DWORD *ctf_hash_lookup(uint64_t a1, uint64_t a2, char *__s1, int64_t __n)
{
  if (__n < 1)
  {
    unint64_t v7 = 0LL;
  }

  else
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = __s1;
    do
    {
      uint64_t v9 = *v8++;
      unint64_t v7 = v9 + 16 * v7;
      if ((v7 & 0xF0000000) != 0) {
        unint64_t v7 = v7 & 0xFFFFFFFF0FFFFFFFLL ^ ((unint64_t)(v7 & 0xF0000000) >> 24);
      }
    }

    while (v8 < &__s1[__n]);
  }

  uint64_t v10 = *(unsigned int *)(*(void *)a1 + 4 * (v7 % *(unsigned int *)(a1 + 16)));
  if (!(_DWORD)v10) {
    return 0LL;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  while (1)
  {
    unint64_t v12 = (_DWORD *)(v11 + 12 * v10);
    if (!strncmp(__s1, v13, __n) && !v13[__n]) {
      break;
    }
    uint64_t v10 = *(unsigned int *)(v11 + 12 * v10 + 8);
    if (!(_DWORD)v10) {
      return 0LL;
    }
  }

  return v12;
}

uint64_t ctf_zopen( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = qword_18C696000;
  if (!qword_18C696000)
  {
    uint64_t v10 = dlopen("/usr/lib/libz.dylib", 5);
    qword_18C696000 = (uint64_t)v10;
    if (v10)
    {
      zlib = (uint64_t (*)(void))dlsym(v10, "uncompress");
      uint64_t v11 = (uint64_t (*)(void))dlsym((void *)qword_18C696000, "zError");
      off_18C695FF8 = v11;
      uint64_t result = qword_18C696000;
      if (zlib && v11) {
        return result;
      }
      dlclose((void *)qword_18C696000);
      off_18C695FF8 = 0LL;
      qword_18C696000 = 0LL;
      zlib = 0LL;
    }

    uint64_t result = 0LL;
    if (a1) {
      *a1 = 1015;
    }
  }

  return result;
}

uint64_t z_uncompress()
{
  return zlib();
}

uint64_t z_strerror()
{
  return off_18C695FF8();
}

char *ctf_sect_mmap(void *a1, int a2)
{
  uint64_t v4 = a1[6];
  int v5 = getpagesize();
  uint64_t v6 = v4 & (v5 - 1);
  uint64_t result = (char *)mmap(0LL, v6 + a1[4], 1, 2, a2, v4 & -v5);
  return result;
}

uint64_t ctf_sect_munmap(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 24);
  unint64_t v3 = (getpagesize() - 1) & v2;
  return munmap((void *)(v2 - v3), v3 + *(void *)(a1 + 32));
}

uint64_t ctf_fdopen(int a1, int *a2)
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  memset(v85, 0, sizeof(v85));
  memset(v86, 0, 24);
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v84 = 0LL;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v80 = 0LL;
  memset(__buf, 0, sizeof(__buf));
  __int128 v88 = 0u;
  if (fstat(a1, &v76) == -1) {
    goto LABEL_66;
  }
  unint64_t v4 = pread(a1, __buf, 0x40uLL, 0LL);
  if ((uint64_t)v4 <= 0)
  {
    if ((v4 & 0x8000000000000000LL) != 0)
    {
      int v6 = *__error();
      if (!a2) {
        return 0LL;
      }
    }

    else
    {
      int v6 = 1000;
      if (!a2) {
        return 0LL;
      }
    }

    uint64_t v5 = 0LL;
    goto LABEL_68;
  }

  if (v4 >= 4 && LOWORD(__buf[0]) == 53233)
  {
    if (BYTE2(__buf[0]) >= 5u)
    {
      if (a2)
      {
        uint64_t v5 = 0LL;
        int v6 = 1002;
LABEL_68:
        *a2 = v6;
        return v5;
      }

      return 0LL;
    }

    *((void *)&v85[1] + 1) = mmap(0LL, v76.st_size, 1, 2, a1, 0LL);
    if (*((void *)&v85[1] + 1) != -1LL)
    {
      *(_OWORD *)((char *)v85 + _Block_object_dispose(va, 8) = xmmword_1869D9170;
      *(void *)&v85[0] = ".SUNW_ctf";
      *(void *)&v86[0] = v76.st_size;
      *(_OWORD *)((char *)v86 + _Block_object_dispose(va, 8) = xmmword_1869D9180;
      uint64_t v5 = ctf_bufopen((uint64_t)v85, 0LL, 0LL, a2, v7, v8, v9, v10);
      if (!v5)
      {
        unint64_t v11 = *((void *)&v85[1] + 1);
        unint64_t v12 = (getpagesize() - 1) & v11;
        unsigned int v13 = (char *)(v11 - v12);
        size_t v14 = v12 + *(void *)&v86[0];
        goto LABEL_18;
      }

      return v5;
    }

LABEL_66:
    uint64_t v69 = __error();
    if (a2)
    {
      uint64_t v5 = 0LL;
      int v6 = *v69;
      goto LABEL_68;
    }

    return 0LL;
  }

  if (v4 < 0x34 || LODWORD(__buf[0]) != 1179403647)
  {
LABEL_13:
    if (a2)
    {
      uint64_t v5 = 0LL;
      int v6 = 1000;
      goto LABEL_68;
    }

    return 0LL;
  }

  if (BYTE5(__buf[0]) != 1)
  {
    if (a2)
    {
      uint64_t v5 = 0LL;
      int v6 = 1003;
      goto LABEL_68;
    }

    return 0LL;
  }

  if (DWORD1(__buf[1]) != 1)
  {
    if (a2)
    {
      uint64_t v5 = 0LL;
      int v6 = 1001;
      goto LABEL_68;
    }

    return 0LL;
  }

  if (BYTE4(__buf[0]) == 2)
  {
    if (v4 < 0x40) {
      goto LABEL_13;
    }
    unsigned int v15 = HIWORD(v88);
    LODWORD(v16) = WORD6(v88);
  }

  else
  {
    uint64_t v17 = LODWORD(__buf[2]);
    int v18 = DWORD1(__buf[2]);
    uint64_t v19 = *((void *)&__buf[2] + 1);
    LODWORD(v16) = (unsigned __int16)v88;
    unsigned int v15 = WORD1(v88);
    DWORD1(__buf[1]) = 1;
    *(void *)&__int128 v20 = DWORD2(__buf[1]);
    *((void *)&v20 + 1) = HIDWORD(__buf[1]);
    *(_OWORD *)((char *)&__buf[1] + _Block_object_dispose(va, 8) = v20;
    *((void *)&__buf[2] + 1) = v17;
    LODWORD(v8_Block_object_dispose(va, 8) = v18;
    *(void *)((char *)&v88 + 4) = v19;
    WORD6(v8_Block_object_dispose(va, 8) = v16;
    HIWORD(v8_Block_object_dispose(va, 8) = v15;
  }

  if (v15 >= v16)
  {
    if (a2)
    {
      uint64_t v5 = 0LL;
      int v6 = 1007;
      goto LABEL_68;
    }

    return 0LL;
  }

  __int16 v21 = (char *)malloc((unint64_t)v16 << 6);
  if (!v21) {
    goto LABEL_66;
  }
  __int16 v22 = v21;
  if (BYTE4(__buf[0]) == 1)
  {
    size_t v23 = 40LL * v16;
    int v24 = (char *)malloc(v23);
    if (v24)
    {
      __int16 v25 = v24;
      if (pread(a1, v24, 40LL * v16, *((off_t *)&__buf[2] + 1)) == v23)
      {
        uint64_t v26 = 0LL;
        int v27 = v22 + 24;
        do
        {
          uint64_t v28 = *(void *)&v25[v26 + 8];
          *((void *)v27 - 3) = *(void *)&v25[v26];
          *(void *)&__int128 v29 = v28;
          *((void *)&v29 + 1) = HIDWORD(v28);
          __int128 v30 = v29;
          uint64_t v31 = *(void *)&v25[v26 + 16];
          uint64_t v32 = *(void *)&v25[v26 + 24];
          *(void *)&__int128 v29 = v31;
          *((void *)&v29 + 1) = HIDWORD(v31);
          *((_OWORD *)v27 - 1) = v30;
          *(_OWORD *)int v27 = v29;
          *((void *)v27 + 2) = v32;
          uint64_t v33 = *(void *)&v25[v26 + 32];
          *(void *)&__int128 v29 = v33;
          *((void *)&v29 + 1) = HIDWORD(v33);
          *(_OWORD *)(v27 + 24) = v29;
          v27 += 64;
          v26 += 40LL;
        }

        while (v23 != v26);
        free(v25);
        goto LABEL_42;
      }
    }

uint64_t ctf_open(const char *a1, int *a2)
{
  int v3 = open(a1, 0);
  if (v3 == -1)
  {
    if (a2) {
      *a2 = *__error();
    }
    return 0LL;
  }

  else
  {
    int v4 = v3;
    uint64_t v5 = ctf_fdopen(v3, a2);
    close(v4);
    return v5;
  }

uint64_t ctf_write(uint64_t a1, int __fd)
{
  uint64_t v2 = *(void *)(a1 + 472);
  size_t v3 = v2 + 36;
  if (v2 == -36) {
    return 0LL;
  }
  int v6 = *(char **)(a1 + 456);
  while (1)
  {
    ssize_t v7 = write(__fd, v6, v3);
    if (v7 <= 0) {
      break;
    }
    v6 += v7;
    v3 -= v7;
    if (!v3) {
      return 0LL;
    }
  }

  *(_DWORD *)(a1 + 560) = *__error();
  return 0xFFFFFFFFLL;
}

uint64_t ctf_version( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a1 & 0x80000000) != 0)
  {
    uint64_t v9 = __error();
    int v10 = 22;
  }

  else
  {
    uint64_t v8 = a1;
    if (!(_DWORD)a1) {
      return _libctf_version;
    }
    if (a1 < 5)
    {
      ctf_dprintf("ctf_version: client using version %d\n", a2, a3, a4, a5, a6, a7, a8, a1);
      _libctf_version = v8;
      return v8;
    }

    uint64_t v9 = __error();
    int v10 = 45;
  }

  *uint64_t v9 = v10;
  return 0xFFFFFFFFLL;
}

uint64_t ctf_lookup_by_name(const char **a1, const char *a2)
{
  if (a2)
  {
    size_t v4 = strlen(a2);
    if (*a2)
    {
      uint64_t v5 = 0LL;
      int v6 = &a2[v4];
      uint64_t v7 = MEMORY[0x1895F8770];
      int v37 = a1 + 38;
      uint64_t v8 = a2;
      while (1)
      {
        uint64_t v9 = (char *)(v8 - 1);
        do
        {
          int v10 = v8;
          unint64_t v11 = v9;
          unsigned int v12 = *v8;
          if ((v12 & 0x80000000) != 0) {
            int v13 = __maskrune(v12, 0x4000uLL);
          }
          else {
            int v13 = *(_DWORD *)(v7 + 4LL * v12 + 60) & 0x4000;
          }
          ++v8;
          uint64_t v9 = v11 + 1;
        }

        while (v13);
        if (v10 == v6)
        {
          char v33 = *v6 != 0;
LABEL_52:
          if ((v33 & 1) == 0 && v5) {
            return v5;
          }
          break;
        }

        size_t v14 = strpbrk(v10 + 1, ctf_lookup_by_name_delimiters);
        if (v14) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v6;
        }
        if (*v10 == 42)
        {
          uint64_t v16 = a1[63];
          uint64_t v17 = *(unsigned int *)&v16[4 * (*((unsigned int (**)(uint64_t))*a1 + 5))(v5)];
          if (!(_DWORD)v17)
          {
            int v18 = a1[63];
            uint64_t v17 = *(unsigned int *)&v18[4 * (*((unsigned int (**)(void))*a1 + 5))()];
            if (!(_DWORD)v17) {
              goto LABEL_48;
            }
          }

          uint64_t v5 = (*((uint64_t (**)(uint64_t, void))*a1 + 6))(v17, (*((_DWORD *)a1 + 139) >> 1) & 1);
        }

        else
        {
          uint64_t v19 = (char *)(v15 - v10);
          unsigned int v20 = (_DWORD)v15 - (_DWORD)v10 + *(v15 - 1) - 105;
          if (v20 > 0x14
            || (&isqualifier_qhash)[2 * (int)v20 + 1] != v19
            || (uint64_t v8 = v15, strncmp((&isqualifier_qhash)[2 * (int)v20], v10, v15 - v10)))
          {
            __int16 v21 = *v37;
            if (!*v37) {
              goto LABEL_48;
            }
            __int16 v22 = a1 + 38;
            while (*v21)
            {
              if (!strncmp(v10, v21, (size_t)v19))
              {
                unint64_t v23 = v22[1];
              }

              int v24 = (const char *)v22[3];
              v22 += 3;
              __int16 v21 = v24;
              if (!v24) {
                goto LABEL_48;
              }
            }

            unint64_t v23 = v22[1];
LABEL_29:
            __int16 v25 = &v11[v23];
            do
            {
              unsigned int v26 = v25[1];
              if ((v26 & 0x80000000) != 0) {
                int v27 = __maskrune(v26, 0x4000uLL);
              }
              else {
                int v27 = *(_DWORD *)(v7 + 4LL * v26 + 60) & 0x4000;
              }
              ++v25;
            }

            while (v27);
            uint64_t v28 = strchr(v25, 42);
            __int128 v29 = v28 ? v28 : (char *)v6;
            uint64_t v8 = v29 + 1;
            do
            {
              unsigned int v30 = *(v8 - 2);
              if ((v30 & 0x80000000) != 0) {
                int v31 = __maskrune(v30, 0x4000uLL);
              }
              else {
                int v31 = *(_DWORD *)(v7 + 4LL * v30 + 60) & 0x4000;
              }
              --v8;
            }

            while (v31);
            uint64_t v32 = ctf_hash_lookup(v22[2], (uint64_t)a1, v25, v8 - v25);
            if (!v32 || !*v22)
            {
LABEL_48:
              *((_DWORD *)a1 + 140) = 1028;
              uint64_t v35 = a1[66];
              if (v35)
              {
                uint64_t v5 = ctf_lookup_by_name(v35, a2);
                if (v5 != -1) {
                  return v5;
                }
              }

              return -1LL;
            }

            uint64_t v5 = v32[1];
          }
        }

        char v33 = *v8;
        if (!*v8) {
          goto LABEL_52;
        }
      }
    }

    int v34 = 1029;
  }

  else
  {
    int v34 = 22;
  }

  *((_DWORD *)a1 + 140) = v34;
  return -1LL;
}

uint64_t ctf_lookup_by_symbol(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (!v2)
  {
    int v7 = 1010;
    goto LABEL_34;
  }

  if (*(void *)(a1 + 488) <= a2)
  {
    int v7 = 22;
    goto LABEL_34;
  }

  uint64_t v3 = *(void *)(a1 + 104);
  if (v3 == 20)
  {
    char v8 = *(_BYTE *)(v2 + 20 * a2 + 12);
    goto LABEL_25;
  }

  if (v3 != 16)
  {
    if (v3 == 12)
    {
      int v4 = *(_BYTE *)(v2 + 12 * a2 + 4) & 0xF;
      if (v4 == 1)
      {
        if (*(_BYTE *)(v2 + 12 * a2 + 5)) {
          goto LABEL_27;
        }
      }

      else if (v4 != 15 && v4 != 3)
      {
        goto LABEL_27;
      }

      uint64_t v6 = v2 + 12 * a2;
      goto LABEL_23;
    }

    char v8 = *(_BYTE *)(v2 + 40 * a2 + 8);
LABEL_25:
    int v12 = v8 & 0xF;
    goto LABEL_26;
  }

  uint64_t v9 = v2 + 16 * a2;
  int v10 = *(_BYTE *)(v9 + 4) & 0xF;
  if (v10 == 1)
  {
    if (*(_BYTE *)(v9 + 5)) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }

  if (v10 == 15 || v10 == 3)
  {
LABEL_22:
    uint64_t v6 = v2 + 16 * a2;
LABEL_23:
    int v12 = *(unsigned __int16 *)(v6 + 6);
LABEL_26:
    if (v12 == 1) {
      goto LABEL_27;
    }
    int v7 = 1032;
LABEL_34:
    *(_DWORD *)(a1 + 560) = v7;
    return -1LL;
  }

uint64_t ctf_lookup_by_id(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  if ((*(_BYTE *)(*(void *)a1 + 556LL) & 2) != 0
    && (*(unsigned int (**)(uint64_t))(*v4 + 24LL))(a2)
    && (int v4 = (void *)v4[66]) == 0LL)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(*(void *)a1 + 560LL) = 1011;
  }

  else
  {
    unsigned int v5 = (*(uint64_t (**)(uint64_t))(*v4 + 40LL))(a2);
    if (v5 && v4[64] >= (unint64_t)v5)
    {
      *(void *)a1 = v4;
      return *(unsigned int *)(v4[62] + 4LL * v5) + v4[58];
    }

    else
    {
      uint64_t result = 0LL;
      *((_DWORD *)v4 + 140) = 1020;
    }
  }

  return result;
}

uint64_t ctf_func_info(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (!*(void *)(a1 + 88))
  {
    int v10 = 1010;
LABEL_11:
    *(_DWORD *)(a1 + 560) = v10;
    return 0xFFFFFFFFLL;
  }

  if (*(void *)(a1 + 488) <= a2)
  {
    int v10 = 22;
    goto LABEL_11;
  }

  uint64_t v5 = *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2);
  if ((_DWORD)v5 == -1
    || ((int v7 = (int *)(*(void *)(a1 + 464) + v5), *(_DWORD *)(a1 + 564) != 4)
      ? (LOWORD(v8) = *(_WORD *)v7, uint64_t v9 = *((unsigned __int16 *)v7 + 1))
      : (int v8 = *v7, v9 = v7[1]),
        uint64_t v11 = (unsigned __int16)v8,
        int v12 = (**(uint64_t (***)(uint64_t))a1)(v11),
        int v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(v11),
        !(v12 | v13)))
  {
    int v10 = 1031;
    goto LABEL_11;
  }

  if (v12 != 5)
  {
    int v10 = 1007;
    goto LABEL_11;
  }

  *(void *)a3 = v9;
  *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v13;
  *(_DWORD *)(a3 + 12) = 0;
  uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2) + *(void *)(a1 + 464);
  int v16 = v13 - 1;
  if (*(_DWORD *)(a1 + 564) == 4) {
    int v17 = *(_DWORD *)(v15 + 4LL * v16 + 8);
  }
  else {
    int v17 = *(unsigned __int16 *)(v15 + 2LL * v16 + 4);
  }
  BOOL v18 = v17 == 0;
  BOOL v19 = v13 == 0;
  uint64_t result = 0LL;
  BOOL v19 = v19 || !v18;
  if (!v19)
  {
    *(_DWORD *)(a3 + _Block_object_dispose(va, 8) = v16;
    *(_DWORD *)(a3 + 12) = 1;
  }

  return result;
}

uint64_t ctf_func_args(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  uint64_t result = ctf_func_info(a1, a2, (uint64_t)&v15);
  if ((_DWORD)result != -1)
  {
    unsigned int v9 = v16;
    if (v16 >= a3) {
      unsigned int v9 = a3;
    }
    if (v9)
    {
      int v10 = *(_DWORD *)(a1 + 564);
      uint64_t v11 = 8LL;
      if (v10 < 4) {
        uint64_t v11 = 4LL;
      }
      int v12 = (unsigned int *)(v11 + *(void *)(a1 + 464) + *(unsigned int *)(*(void *)(a1 + 480) + 4 * a2));
      do
      {
        if (v10 == 4)
        {
          uint64_t v13 = *v12;
          uint64_t v14 = 4LL;
        }

        else
        {
          uint64_t v13 = *(unsigned __int16 *)v12;
          uint64_t v14 = 2LL;
        }

        int v12 = (unsigned int *)((char *)v12 + v14);
        *a4++ = v13;
        --v9;
      }

      while (v9);
    }

    return 0LL;
  }

  return result;
}

uint64_t ctf_bufopen( uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || (a2 != 0) == (a3 == 0))
  {
    if (a4)
    {
      uint64_t v38 = 0LL;
      int v39 = 22;
LABEL_20:
      *a4 = v39;
      return v38;
    }

    return 0LL;
  }

  if (a2)
  {
    uint64_t v12 = *(void *)(a2 + 40);
    if (v12 != 12 && v12 != 16)
    {
      if (a4)
      {
        uint64_t v38 = 0LL;
        int v39 = 1004;
        goto LABEL_20;
      }

      return 0LL;
    }

    if (!*(void *)(a2 + 24))
    {
      if (a4)
      {
        uint64_t v38 = 0LL;
        int v39 = 1005;
        goto LABEL_20;
      }

      return 0LL;
    }
  }

  if (a3 && !*(void *)(a3 + 24))
  {
    if (a4)
    {
      uint64_t v38 = 0LL;
      int v39 = 1006;
      goto LABEL_20;
    }

    return 0LL;
  }

  if (*(void *)(a1 + 32) <= 3uLL) {
    goto LABEL_43;
  }
  uint64_t v14 = *(unsigned __int16 **)(a1 + 24);
  ctf_dprintf("ctf_bufopen: magic=0x%x version=%u\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *v14);
  if (*v14 != 53233) {
    goto LABEL_43;
  }
  int v22 = *((unsigned __int8 *)v14 + 2);
  if ((v22 - 2) >= 3)
  {
    if (v22 != 1)
    {
      if (a4)
      {
        uint64_t v38 = 0LL;
        int v39 = 1002;
        goto LABEL_20;
      }

      return 0LL;
    }

    if (*(void *)(a1 + 32) >= 0x18uLL)
    {
      uint64_t v40 = *(void *)(a1 + 24);
      *(void *)((char *)&v103 + 4) = 0LL;
      HIDWORD(v103) = 0;
      LODWORD(v103) = *(_DWORD *)v40;
      __int128 v104 = *(_OWORD *)(v40 + 4);
      unsigned int v25 = *(_DWORD *)(v40 + 20);
      unsigned int v105 = v25;
      unsigned int v26 = HIDWORD(v104);
      uint64_t v28 = v25 + HIDWORD(v104);
      ctf_dprintf("ctf_bufopen: uncompressed size=%lu\n", v15, v16, v17, v18, v19, v20, v21, v25 + BYTE12(v104));
      unsigned int v27 = 0;
      unsigned int v36 = v104;
      size_t v37 = 24LL;
      goto LABEL_30;
    }

const char *init_symtab( uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 488);
  if (v8 >= 1)
  {
    uint64_t v11 = *(unsigned int **)(a1 + 480);
    uint64_t v12 = &v11[v8];
    int v13 = *(_DWORD *)(a1 + 564);
    uint64_t v14 = *(unsigned int **)(a3 + 24);
    unsigned int v40 = a2[4];
    unsigned int v41 = a2[5];
    if (v13 < 4) {
      char v15 = 1;
    }
    else {
      char v15 = 2;
    }
    if (v13 >= 4) {
      int v16 = 4;
    }
    else {
      int v16 = 2;
    }
    char v37 = v15;
    int v38 = v16;
    uint64_t v17 = *(void *)(a3 + 40);
    while (1)
    {
      switch(v17)
      {
        case 12LL:
          uint64_t v19 = *v14;
          if (!(_DWORD)v19) {
            goto LABEL_27;
          }
          uint64_t v20 = *(void *)(a4 + 24);
          uint64_t v21 = (_BYTE *)(v20 + v19);
          if (*v21 == 95) {
            LODWORD(v21) = (_DWORD)v21 + 1;
          }
          unint64_t v18 = ((_DWORD)v21 - v20);
          uint64_t v46 = v14[2];
          char v44 = 0;
          __int16 v22 = -2;
          break;
        case 16LL:
          uint64_t v23 = *v14;
          if (!(_DWORD)v23)
          {
LABEL_27:
            unint64_t v18 = 0LL;
            goto LABEL_34;
          }

          uint64_t v24 = *(void *)(a4 + 24);
          unsigned int v25 = (_BYTE *)(v24 + v23);
          if (*v25 == 95) {
            LODWORD(v25) = (_DWORD)v25 + 1;
          }
          unint64_t v18 = ((_DWORD)v25 - v24);
          uint64_t v46 = *((void *)v14 + 1);
          char v44 = 0;
          __int16 v22 = -3;
          break;
        case 20LL:
          unint64_t v18 = *v14;
          uint64_t v46 = v14[1];
          char v44 = *((_BYTE *)v14 + 12);
          __int16 v45 = *((_WORD *)v14 + 7);
          goto LABEL_34;
        default:
          unint64_t v18 = *(void *)v14;
          uint64_t v28 = (char *)v14;
          goto LABEL_35;
      }

      __int16 v45 = v22;
      unsigned int v26 = *((unsigned __int8 *)v14 + 4);
      if (v26 >= 0x20)
      {
        if (v26 == 32) {
          goto LABEL_32;
        }
        if (v26 == 36)
        {
          char v29 = 18;
LABEL_33:
          char v44 = v29;
        }
      }

      else
      {
        int v27 = v26 & 0xF;
        if (v27 != 1)
        {
          if (v27 == 15 || v27 == 3) {
            char v44 = *((_BYTE *)v14 + 6) & 0xF | 0x10;
          }
          goto LABEL_34;
        }

        if (!*((_BYTE *)v14 + 5))
        {
LABEL_32:
          char v29 = 17;
          goto LABEL_33;
        }
      }

LABEL_50:
        *uint64_t v11 = -1;
        goto LABEL_51;
      }

      if (v32 != 1 || v40 >= a2[5] || v31 == 65521 && !*((void *)v28 + 2)) {
        goto LABEL_50;
      }
      *uint64_t v11 = v40;
      v40 += v38;
LABEL_51:
      ++v11;
      uint64_t v17 = *(void *)(a3 + 40);
      uint64_t v14 = (unsigned int *)((char *)v14 + v17);
      if (v11 >= v12)
      {
        uint64_t v8 = *(void *)(a1 + 488);
        return ctf_dprintf("loaded %lu symtab entries\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v8);
      }
    }
  }

  return ctf_dprintf("loaded %lu symtab entries\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v8);
}

uint64_t init_types( uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v153 = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(void *)(a1 + 464);
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  unint64_t v12 = v9 + v10;
  unint64_t v13 = v9 + v11;
  __int128 v151 = 0u;
  memset(v152, 0, sizeof(v152));
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  int v14 = a2[2] != 0;
  unsigned int v138 = v11;
  unsigned int v140 = v10;
  __int128 v142 = (unsigned int *)(v9 + v10);
  if (v10 < v11)
  {
    while (1)
    {
      else {
        uint64_t v15 = *(unsigned __int16 *)(v12 + 4);
      }
      unsigned int v16 = (**(uint64_t (***)(uint64_t))a1)(v15);
      else {
        uint64_t v17 = *(unsigned __int16 *)(v12 + 4);
      }
      unsigned int v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(v17);
      ctf_get_ctt_size((_DWORD *)a1, v12, (unint64_t *)&v143, &v146);
      uint64_t v19 = v18;
      uint64_t v20 = 4LL;
      switch(v16)
      {
        case 0u:
          goto LABEL_47;
        case 1u:
        case 2u:
          goto LABEL_53;
        case 3u:
        case 0xAu:
        case 0xBu:
        case 0xCu:
        case 0xDu:
          else {
            uint64_t v21 = *(unsigned __int16 *)(v12 + 6);
          }
          uint64_t v20 = 0LL;
          v14 |= (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32LL))(v21);
          goto LABEL_53;
        case 4u:
          if (*(_DWORD *)(a1 + 564) == 4) {
            uint64_t v20 = 12LL;
          }
          else {
            uint64_t v20 = 8LL;
          }
          goto LABEL_53;
        case 5u:
          uint64_t v25 = (v19 & 1) + v19;
          uint64_t v26 = 2 * v25;
          uint64_t v27 = 4 * v25;
          if (*(_DWORD *)(a1 + 564) == 4) {
            uint64_t v20 = v27;
          }
          else {
            uint64_t v20 = v26;
          }
          goto LABEL_53;
        case 6u:
        case 7u:
          int v22 = *(_DWORD *)(a1 + 564);
          if (v22 == 1 || v143 < 0x2000)
          {
            if (v22 == 4)
            {
              uint64_t v20 = 12 * v19;
              if ((_DWORD)v19)
              {
                int v31 = (unsigned int *)(v146 + v12 + 4);
                do
                {
                  unsigned int v32 = *v31;
                  v31 += 3;
                  v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32LL))(v32);
                  LODWORD(v19) = v19 - 1;
                }

                while ((_DWORD)v19);
              }
            }

            else
            {
              uint64_t v20 = 8 * v19;
              if ((_DWORD)v19)
              {
                int v35 = (unsigned __int16 *)(v146 + v12 + 4);
                do
                {
                  unsigned int v36 = *v35;
                  v35 += 4;
                  v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32LL))(v36);
                  LODWORD(v19) = v19 - 1;
                }

                while ((_DWORD)v19);
              }
            }
          }

          else
          {
            uint64_t v20 = 16 * v19;
            if (v22 == 4)
            {
              if ((_DWORD)v19)
              {
                uint64_t v23 = (unsigned int *)(v146 + v12 + 4);
                do
                {
                  unsigned int v24 = *v23;
                  v23 += 4;
                  v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32LL))(v24);
                  LODWORD(v19) = v19 - 1;
                }

                while ((_DWORD)v19);
              }
            }

            else if ((_DWORD)v19)
            {
              uint64_t v33 = (unsigned __int16 *)(v146 + v12 + 4);
              do
              {
                unsigned int v34 = *v33;
                v33 += 8;
                v14 |= (*(uint64_t (**)(void))(*(void *)a1 + 32LL))(v34);
                LODWORD(v19) = v19 - 1;
              }

              while ((_DWORD)v19);
            }
          }

          goto LABEL_53;
        case 8u:
          uint64_t v20 = 8 * v19;
          goto LABEL_53;
        case 9u:
          if (*(int *)(a1 + 564) > 3)
          {
            uint64_t v28 = &v150;
            if (*(_DWORD *)(v12 + 8))
            {
              uint64_t v28 = &v150;
              if (*(_DWORD *)(v12 + 8) <= 0x1Eu)
              {
                uint64_t v29 = *(unsigned int *)(v12 + 8);
                goto LABEL_45;
              }
            }
          }

          else
          {
            uint64_t v28 = &v150;
            if (*(_WORD *)(v12 + 6))
            {
              uint64_t v28 = &v150;
              if (*(unsigned __int16 *)(v12 + 6) <= 0x1Eu)
              {
                uint64_t v29 = *(unsigned __int16 *)(v12 + 6);
LABEL_45:
                uint64_t v28 = (__int128 *)((char *)&v147 + 8 * v29);
              }
            }
          }

          ++*(void *)v28;
LABEL_47:
          uint64_t v20 = 0LL;
LABEL_53:
          v12 += v20 + v146;
          ++*((void *)&v147 + v16);
          ++*(void *)(a1 + 512);
          if (v13 <= v12) {
            goto LABEL_54;
          }
          break;
        case 0xEu:
          else {
            uint64_t v30 = *(unsigned __int16 *)(v12 + 6);
          }
          v14 |= (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32LL))(v30);
          uint64_t v20 = 4LL;
          goto LABEL_53;
        default:
          ctf_dprintf("detected invalid CTF kind -- %u\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v16);
          return 1007LL;
      }
    }
  }

LABEL_140:
                      v137[v48++] = (_DWORD)v142 - *(_DWORD *)(a1 + 464);
                      __int128 v142 = (unsigned int *)((char *)v142 + v63 + v145);
                      uint64_t v38 = *(void *)(a1 + 512);
                      break;
                    default:
LABEL_139:
                      uint64_t v63 = 0LL;
                      goto LABEL_140;
                  }

                  break;
                }
              }

              ctf_dprintf("%lu total types processed\n", v41, v42, v43, v44, v45, v46, v47, v38);
              int v92 = *(_DWORD *)(a1 + 260);
              BOOL v93 = v92 != 0;
              char v94 = v92 - 1;
              if (!v93) {
                char v94 = 0;
              }
              ctf_dprintf("%u enum names hashed\n", v85, v86, v87, v88, v89, v90, v91, v94);
              int v102 = *(_DWORD *)(a1 + 196);
              BOOL v93 = v102 != 0;
              char v103 = v102 - 1;
              if (!v93) {
                char v103 = 0;
              }
              ctf_dprintf("%u struct names hashed (%d long)\n", v95, v96, v97, v98, v99, v100, v101, v103);
              int v111 = *(_DWORD *)(a1 + 228);
              BOOL v93 = v111 != 0;
              char v112 = v111 - 1;
              if (!v93) {
                char v112 = 0;
              }
              ctf_dprintf("%u union names hashed (%d long)\n", v104, v105, v106, v107, v108, v109, v110, v112);
              int v120 = *(_DWORD *)(a1 + 292);
              BOOL v93 = v120 != 0;
              char v121 = v120 - 1;
              if (!v93) {
                char v121 = 0;
              }
              ctf_dprintf("%u base type names hashed\n", v113, v114, v115, v116, v117, v118, v119, v121);
              if (*(void *)(a1 + 512))
              {
                unint64_t v122 = 1LL;
                do
                {
                  int v123 = *(_DWORD *)(*(void *)(a1 + 504) + 4 * v122);
                  if (v123)
                  {
                    id v124 = (unsigned int *)(*(unsigned int *)(*(void *)(a1 + 496) + 4 * v122) + *(void *)(a1 + 464));
                    uint64_t v125 = *(int *)(a1 + 564) > 3 ? v124[1] : *((unsigned __int16 *)v124 + 2);
                    if ((**(unsigned int (***)(uint64_t))a1)(v125) == 10)
                    {
                      unint64_t v126 = *v124;
                      uint64_t v127 = a1 + 16 * (v126 >> 31);
                      uint64_t v128 = *(void *)(v127 + 424);
                      if (v128)
                      {
                        unint64_t v129 = v126 & 0x7FFFFFFF;
                        id v130 = (const char *)(v128 + v129);
                        if (*(void *)(v127 + 432) <= v129) {
                          id v131 = 0LL;
                        }
                        else {
                          id v131 = v130;
                        }
                      }

                      else
                      {
                        id v131 = 0LL;
                      }

                      if (!v131) {
                        id v131 = "(?)";
                      }
                      if (!*v131)
                      {
                        uint64_t v132 = *(int *)(a1 + 564) > 3 ? v124[2] : *((unsigned __int16 *)v124 + 3);
                        if (v14 == (*(unsigned int (**)(uint64_t))(*(void *)a1 + 32LL))(v132))
                        {
                          uint64_t v133 = *(int *)(a1 + 564) > 3 ? v124[2] : *((unsigned __int16 *)v124 + 3);
                          if (*(void *)(a1 + 512) >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40LL))(v133))
                          {
                            else {
                              uint64_t v134 = *((unsigned __int16 *)v124 + 3);
                            }
                            uint64_t v135 = *(void *)(a1 + 504);
                            *(_DWORD *)(v135
                                      + 4LL * (*(unsigned int (**)(uint64_t))(*(void *)a1 + 40LL))(v134)) = v123;
                          }
                        }
                      }
                    }
                  }

                  uint64_t result = 0LL;
                  BOOL v93 = v122++ >= *(void *)(a1 + 512);
                }

                while (!v93);
              }

              else
              {
                return 0LL;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

void ctf_close( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ctf_dprintf("ctf_close(%p) refcnt=%u\n", a2, a3, a4, a5, a6, a7, a8, a1);
    unsigned int v9 = *(_DWORD *)(a1 + 552);
    if (v9 < 2)
    {
      if (*(void *)(a1 + 528)) {
        ctf_close();
      }
      uint64_t v10 = *(unsigned int **)(a1 + 584);
      if (v10)
      {
        do
        {
          uint64_t v11 = *(unsigned int **)v10;
          ctf_dtd_delete((void *)a1, v10);
          uint64_t v10 = v11;
        }

        while (v11);
      }

      free(*(void **)(a1 + 568));
      if ((*(_BYTE *)(a1 + 556) & 1) != 0)
      {
        unint64_t v12 = *(void *)(a1 + 32);
        if (v12)
        {
          int v13 = getpagesize();
          munmap((void *)(v12 - ((v13 - 1) & v12)), ((v13 - 1) & v12) + *(void *)(a1 + 40));
        }

        unint64_t v14 = *(void *)(a1 + 88);
        if (v14)
        {
          int v15 = getpagesize();
          munmap((void *)(v14 - ((v15 - 1) & v14)), ((v15 - 1) & v14) + *(void *)(a1 + 96));
        }

        unint64_t v16 = *(void *)(a1 + 144);
        if (v16)
        {
          int v17 = getpagesize();
          munmap((void *)(v16 - ((v17 - 1) & v16)), ((v17 - 1) & v16) + *(void *)(a1 + 152));
        }
      }

      unsigned int v18 = *(void **)(a1 + 8);
      if (v18 != &_CTF_NULLSTR && v18 != 0LL) {
        free(v18);
      }
      uint64_t v20 = *(void **)(a1 + 64);
      if (v20 != &_CTF_NULLSTR && v20) {
        free(v20);
      }
      uint64_t v21 = *(void **)(a1 + 120);
      if (v21 != &_CTF_NULLSTR && v21) {
        free(v21);
      }
      int v22 = *(void **)(a1 + 456);
      uint64_t v23 = *(void **)(a1 + 480);
      if (v23) {
        free(v23);
      }
      unsigned int v24 = *(void **)(a1 + 496);
      if (v24) {
        free(v24);
      }
      uint64_t v25 = *(void **)(a1 + 504);
      if (v25) {
        free(v25);
      }
      ctf_hash_destroy(a1 + 176);
      ctf_hash_destroy(a1 + 208);
      ctf_hash_destroy(a1 + 240);
      ctf_hash_destroy(a1 + 272);
      free((void *)a1);
    }

    else
    {
      *(_DWORD *)(a1 + 552) = v9 - 1;
    }
  }

uint64_t get_kind_v1(unsigned __int16 a1)
{
  return a1 >> 12;
}

uint64_t get_root_v1(unsigned int a1)
{
  return (a1 >> 11) & 1;
}

uint64_t get_vlen_v1(__int16 a1)
{
  return a1 & 0x7FF;
}

BOOL is_parent_v1(uint64_t a1)
{
  return a1 < 0x8000;
}

BOOL is_child_v1(uint64_t a1)
{
  return a1 >= 0x8000;
}

uint64_t type_to_index_v1(__int16 a1)
{
  return a1 & 0x7FFF;
}

uint64_t index_to_type_v1(uint64_t result, int a2)
{
  if (a2) {
    return result | 0x8000;
  }
  else {
    return result;
  }
}

uint64_t max_size_v1()
{
  return 65534LL;
}

uint64_t lsize_sent_v1()
{
  return 0xFFFFLL;
}

uint64_t get_kind_v2(unsigned __int16 a1)
{
  return a1 >> 11;
}

uint64_t get_root_v2(unsigned int a1)
{
  return (a1 >> 10) & 1;
}

uint64_t get_vlen_v2(__int16 a1)
{
  return a1 & 0x3FF;
}

BOOL is_parent_v4(int a1)
{
  return a1 >= 0;
}

uint64_t is_child_v4(unint64_t a1)
{
  return (a1 >> 31) & 1;
}

uint64_t type_to_index_v4(int a1)
{
  return a1 & 0x7FFFFFFF;
}

uint64_t index_to_type_v4(uint64_t result, int a2)
{
  if (a2) {
    return result | 0x80000000;
  }
  else {
    return result;
  }
}

uint64_t max_size_v4()
{
  return 4294967294LL;
}

uint64_t lsize_sent_v4()
{
  return 0xFFFFFFFFLL;
}

uint64_t ctf_setmodel(uint64_t a1, int a2)
{
  for (uint64_t i = &_libctf_models; *((_DWORD *)i + 2) != a2; i += 7)
  {
    if (!i[7])
    {
      *(_DWORD *)(a1 + 560) = 22;
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v4 = 0LL;
  *(void *)(a1 + 520) = i;
  return v4;
}

uint64_t ctf_parent_file(uint64_t a1)
{
  return *(void *)(a1 + 528);
}

uint64_t ctf_parent_name(uint64_t a1)
{
  return *(void *)(a1 + 544);
}

uint64_t ctf_import( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || a1 == a2) {
    goto LABEL_7;
  }
  if (!a2) {
    goto LABEL_9;
  }
  if (!*(_DWORD *)(a2 + 552))
  {
LABEL_7:
    int v10 = 22;
    goto LABEL_8;
  }

  if (*(void *)(a2 + 520) != *(void *)(a1 + 520))
  {
    int v10 = 1012;
LABEL_8:
    *(_DWORD *)(a1 + 560) = v10;
    return 0xFFFFFFFFLL;
  }

uint64_t ctf_getmodel(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 520) + 8LL);
}

uint64_t ctf_setspecific(uint64_t result, uint64_t a2)
{
  *(void *)(result + 624) = a2;
  return result;
}

uint64_t ctf_getspecific(uint64_t a1)
{
  return *(void *)(a1 + 624);
}

void *ctf_data_alloc(size_t a1)
{
  return mmap(0LL, a1, 3, 4098, -1, 0LL);
}

uint64_t ctf_data_protect(void *a1, size_t a2)
{
  return mprotect(a1, a2, 1);
}

const char *ctf_dprintf( const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_libctf_debug)
  {
    unsigned int v9 = result;
    int v10 = (FILE **)MEMORY[0x1895F89D0];
    fputs("libctf DEBUG: ", (FILE *)*MEMORY[0x1895F89D0]);
    return (const char *)vfprintf(*v10, v9, &a9);
  }

  return result;
}

uint64_t get_type_ctt_info(uint64_t a1, uint64_t a2)
{
  else {
    return *(unsigned __int16 *)(a2 + 4);
  }
}

uint64_t get_type_ctt_type(uint64_t a1, uint64_t a2)
{
  else {
    return *(unsigned __int16 *)(a2 + 6);
  }
}

uint64_t get_type_ctt_name(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

uint64_t get_type_ctt_size(uint64_t a1, uint64_t a2)
{
  else {
    return *(unsigned __int16 *)(a2 + 6);
  }
}

unint64_t ctf_get_ctt_lsize(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 16LL;
  uint64_t v3 = 12LL;
  if (*(int *)(a1 + 564) < 4)
  {
    uint64_t v2 = 12LL;
    uint64_t v3 = 8LL;
  }

  return *(unsigned int *)(a2 + v2) | ((unint64_t)*(unsigned int *)(a2 + v3) << 32);
}

unint64_t ctf_get_ctt_size(_DWORD *a1, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  int v7 = a1[141];
  if (v7 < 2) {
    goto LABEL_15;
  }
  else {
    int v9 = *(unsigned __int16 *)(a2 + 6);
  }
  int v10 = (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 64LL))(a1);
  int v11 = a1[141];
  if (v9 != v10)
  {
    if (v11 > 3)
    {
      unsigned int v18 = *(_DWORD *)(a2 + 8);
      uint64_t v13 = 12LL;
LABEL_16:
      unint64_t result = v18;
      if (!a3) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }

uint64_t ctf_member_iter( int *a1, uint64_t a2, uint64_t (*a3)(const char *, void, unint64_t, uint64_t), uint64_t a4)
{
  uint64_t v54 = a1;
  uint64_t v7 = ctf_type_resolve((uint64_t)a1, a2);
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = ctf_lookup_by_id((uint64_t)&v54, v7);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  int v10 = v54;
  ctf_get_ctt_size(v54, v8, (unint64_t *)&v53, &v52);
  if (v10[141] > 3) {
    uint64_t v11 = *(unsigned int *)(v9 + 4);
  }
  else {
    uint64_t v11 = *(unsigned __int16 *)(v9 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v10)(v11) - 8 <= 0xFFFFFFFD)
  {
    a1[140] = 1021;
    return 0xFFFFFFFFLL;
  }

  int v13 = v10[141];
  uint64_t v14 = v52;
  uint64_t v15 = *(uint64_t (**)(void))(*(void *)v10 + 16LL);
  if (v13 == 1 || v53 < 0x2000)
  {
    if (v13 > 3)
    {
      uint64_t result = v15(*(unsigned int *)(v9 + 4));
      if ((_DWORD)result)
      {
        int v43 = result;
        uint64_t v44 = (unsigned int *)(v14 + v9);
        do
        {
          unint64_t v45 = *v44;
          uint64_t v46 = &v10[4 * (v45 >> 31)];
          uint64_t v47 = *((void *)v46 + 53);
          if (v47)
          {
            unint64_t v48 = v45 & 0x7FFFFFFF;
            uint64_t v49 = (const char *)(v47 + v48);
            if (*((void *)v46 + 54) <= v48) {
              int v50 = 0LL;
            }
            else {
              int v50 = v49;
            }
          }

          else
          {
            int v50 = 0LL;
          }

          if (v50) {
            uint64_t v51 = v50;
          }
          else {
            uint64_t v51 = "(?)";
          }
          uint64_t result = a3(v51, v44[1], *((unsigned __int16 *)v44 + 4), a4);
          if ((_DWORD)result) {
            break;
          }
          v44 += 3;
          --v43;
        }

        while (v43);
      }
    }

    else
    {
      uint64_t result = v15(*(unsigned __int16 *)(v9 + 4));
      if ((_DWORD)result)
      {
        int v25 = result;
        uint64_t v26 = (unsigned int *)(v14 + v9);
        do
        {
          unint64_t v27 = *v26;
          uint64_t v28 = &v10[4 * (v27 >> 31)];
          uint64_t v29 = *((void *)v28 + 53);
          if (v29)
          {
            unint64_t v30 = v27 & 0x7FFFFFFF;
            int v31 = (const char *)(v29 + v30);
            if (*((void *)v28 + 54) <= v30) {
              unsigned int v32 = 0LL;
            }
            else {
              unsigned int v32 = v31;
            }
          }

          else
          {
            unsigned int v32 = 0LL;
          }

          if (v32) {
            uint64_t v33 = v32;
          }
          else {
            uint64_t v33 = "(?)";
          }
          uint64_t result = a3(v33, *((unsigned __int16 *)v26 + 2), *((unsigned __int16 *)v26 + 3), a4);
          if ((_DWORD)result) {
            break;
          }
          v26 += 2;
          --v25;
        }

        while (v25);
      }
    }
  }

  else if (v13 > 3)
  {
    uint64_t result = v15(*(unsigned int *)(v9 + 4));
    if ((_DWORD)result)
    {
      int v34 = result;
      int v35 = (unsigned int *)(v14 + v9);
      do
      {
        unint64_t v36 = *v35;
        char v37 = &v10[4 * (v36 >> 31)];
        uint64_t v38 = *((void *)v37 + 53);
        if (v38)
        {
          unint64_t v39 = v36 & 0x7FFFFFFF;
          unsigned int v40 = (const char *)(v38 + v39);
          if (*((void *)v37 + 54) <= v39) {
            uint64_t v41 = 0LL;
          }
          else {
            uint64_t v41 = v40;
          }
        }

        else
        {
          uint64_t v41 = 0LL;
        }

        if (v41) {
          uint64_t v42 = v41;
        }
        else {
          uint64_t v42 = "(?)";
        }
        uint64_t result = a3(v42, v35[1], v35[3] | ((unint64_t)v35[2] << 32), a4);
        if ((_DWORD)result) {
          break;
        }
        v35 += 4;
        --v34;
      }

      while (v34);
    }
  }

  else
  {
    uint64_t result = v15(*(unsigned __int16 *)(v9 + 4));
    if ((_DWORD)result)
    {
      int v16 = result;
      int v17 = (unsigned int *)(v14 + v9);
      do
      {
        unint64_t v18 = *v17;
        uint64_t v19 = &v10[4 * (v18 >> 31)];
        uint64_t v20 = *((void *)v19 + 53);
        if (v20)
        {
          unint64_t v21 = v18 & 0x7FFFFFFF;
          int v22 = (const char *)(v20 + v21);
          if (*((void *)v19 + 54) <= v21) {
            uint64_t v23 = 0LL;
          }
          else {
            uint64_t v23 = v22;
          }
        }

        else
        {
          uint64_t v23 = 0LL;
        }

        if (v23) {
          unsigned int v24 = v23;
        }
        else {
          unsigned int v24 = "(?)";
        }
        uint64_t result = a3(v24, *((unsigned __int16 *)v17 + 2), v17[3] | ((unint64_t)v17[2] << 32), a4);
        if ((_DWORD)result) {
          break;
        }
        v17 += 4;
        --v16;
      }

      while (v16);
    }
  }

  return result;
}

uint64_t ctf_type_resolve(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = a2;
  while (1)
  {
    uint64_t v6 = ctf_lookup_by_id((uint64_t)&v21, v5);
    if (!v6) {
      break;
    }
    uint64_t v7 = v6;
    uint64_t v8 = v21;
    else {
      uint64_t v9 = *(unsigned __int16 *)(v6 + 4);
    }
    else {
      uint64_t v17 = *(unsigned __int16 *)(v7 + 6);
    }
    BOOL v19 = v5 == v17 || v17 == a2 || v4 == v17;
    uint64_t v4 = v5;
    uint64_t v5 = v17;
    if (v19)
    {
      ctf_dprintf("type %ld cycle detected\n", v10, v11, v12, v13, v14, v15, v16, a2);
      *(_DWORD *)(a1 + 560) = 1007;
      return -1LL;
    }
  }

  return -1LL;
}

uint64_t ctf_enum_iter(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, void, uint64_t), uint64_t a4)
{
  int v25 = (_DWORD *)a1;
  uint64_t v7 = ctf_type_resolve(a1, a2);
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = ctf_lookup_by_id((uint64_t)&v25, v7);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = v25;
  else {
    uint64_t v11 = *(unsigned __int16 *)(v8 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v25)(v11) != 8)
  {
    *(_DWORD *)(a1 + 560) = 1022;
    return 0xFFFFFFFFLL;
  }

  ctf_get_ctt_size(v10, v9, 0LL, &v24);
  else {
    uint64_t v12 = *(unsigned __int16 *)(v9 + 4);
  }
  uint64_t v14 = v24;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 16LL))(v12);
  if ((_DWORD)result)
  {
    int v15 = result;
    for (uint64_t i = (unsigned int *)(v14 + v9); ; i += 2)
    {
      unint64_t v17 = *i;
      unint64_t v18 = &v10[4 * (v17 >> 31)];
      uint64_t v19 = *((void *)v18 + 53);
      if (v19)
      {
        unint64_t v20 = v17 & 0x7FFFFFFF;
        uint64_t v21 = v19 + v20;
        int v22 = *((void *)v18 + 54) <= v20 ? 0LL : (const char *)v21;
      }

      else
      {
        int v22 = 0LL;
      }

      uint64_t v23 = v22 ? (char *)v22 : "(?)";
      uint64_t result = a3(v23, i[1], a4);
      if ((_DWORD)result) {
        break;
      }
      if (!--v15) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t ctf_type_iter(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 512);
  if (v3 >= 1)
  {
    uint64_t v7 = -v3;
    uint64_t v8 = 1LL;
    uint64_t v9 = (*(_DWORD *)(a1 + 556) >> 1) & 1;
    do
    {
      uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 496) + 4 * v8) + *(void *)(a1 + 464);
      if (*(int *)(a1 + 564) > 3)
      {
        if ((*(_DWORD *)(v10 + 4) & 0x400) != 0)
        {
LABEL_7:
          uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 48LL))(v8, v9);
          uint64_t result = a2(v11, a3);
          if ((_DWORD)result) {
            return result;
          }
        }
      }

      else if ((*(_WORD *)(v10 + 4) & 0x400) != 0)
      {
        goto LABEL_7;
      }

      ++v8;
    }

    while (v7 + v8 != 1);
  }

  return 0LL;
}

uint64_t ctf_type_lname(_DWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = -1LL;
  if (a1 || a2 != -1)
  {
    uint64_t v19 = 0LL;
    __int128 v23 = 0u;
    memset(v16, 0, sizeof(v16));
    uint64_t v17 = -1LL;
    uint64_t v18 = -1LL;
    uint64_t v20 = a3;
    uint64_t v21 = a3;
    uint64_t v22 = a3 + a4;
    ctf_decl_push(v16, a1, a2);
    if (DWORD2(v23))
    {
      ctf_decl_fini((uint64_t)v16);
      a1[140] = DWORD2(v23);
      return -1LL;
    }

    else
    {
      uint64_t v7 = 0LL;
      if (SHIDWORD(v17) > 1) {
        uint64_t v8 = 1LL;
      }
      else {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      uint64_t v9 = 2LL;
      uint64_t v14 = v8;
      if (SHIDWORD(v17) > 1) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = v9;
      }
      int v11 = 3;
      do
      {
        for (uint64_t i = *((void *)&v16[v7] + 1); i; uint64_t i = *(void *)(i + 8))
        {
          int v15 = a1;
          ctf_lookup_by_id((uint64_t)&v15, *(void *)(i + 16));
          if (v7 == v10)
          {
            ctf_decl_sprintf(v16, "(");
            uint64_t v10 = 0xFFFFFFFFLL;
          }

          switch(*(_DWORD *)(i + 24))
          {
            case 1:
            case 2:
            case 0xA:
              ctf_decl_sprintf(v16, "%s");
              break;
            case 3:
              ctf_decl_sprintf(v16, "*", v13);
              break;
            case 4:
              ctf_decl_sprintf(v16, "[%u]");
              break;
            case 5:
              ctf_decl_sprintf(v16, "()", v13);
              break;
            case 6:
            case 9:
              ctf_decl_sprintf(v16, "struct %s");
              break;
            case 7:
              ctf_decl_sprintf(v16, "union %s");
              break;
            case 8:
              ctf_decl_sprintf(v16, "enum %s");
              break;
            case 0xB:
              ctf_decl_sprintf(v16, "volatile", v13);
              break;
            case 0xC:
              ctf_decl_sprintf(v16, "const", v13);
              break;
            case 0xD:
              ctf_decl_sprintf(v16, "restrict", v13);
              break;
            case 0xE:
              ctf_decl_sprintf(v16, "ptrauth", v13);
              break;
            default:
              break;
          }

          int v11 = *(_DWORD *)(i + 24);
        }

        if (v14 == v7) {
          ctf_decl_sprintf(v16, ")");
        }
        ++v7;
      }

      while (v7 != 4);
      ctf_decl_fini((uint64_t)v16);
      return v23;
    }
  }

  return result;
}

char *__cdecl ctf_type_name(ctf_file_t *a1, ctf_id_t a2, char *a3, size_t a4)
{
  size_t v6 = ctf_type_lname(a1, a2, (uint64_t)a3, a4);
  else {
    return a3;
  }
}

uint64_t ctf_type_size(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t result = ctf_type_resolve(a1, a2);
  if (result != -1)
  {
    uint64_t v3 = result;
    uint64_t v4 = ctf_lookup_by_id((uint64_t)&v11, result);
    if (!v4) {
      return -1LL;
    }
    uint64_t v5 = v4;
    uint64_t v6 = v11;
    else {
      uint64_t v7 = *(unsigned __int16 *)(v4 + 4);
    }
    int v8 = (**(uint64_t (***)(uint64_t))v11)(v7);
    if (v8 > 4)
    {
      if (v8 == 5) {
        return 0LL;
      }
      if (v8 != 14) {
        return ctf_get_ctt_size((_DWORD *)v6, v5, 0LL, 0LL);
      }
    }

    else if (v8 != 3)
    {
      if (v8 == 4)
      {
        uint64_t result = ctf_get_ctt_size((_DWORD *)v6, v5, 0LL, 0LL);
        if (result > 0) {
          return result;
        }
        if (ctf_array_info((_DWORD *)v6, v3, (uint64_t)&v9) != -1)
        {
          uint64_t result = ctf_type_size(v6, v9);
          if (result != -1) {
            result *= v10;
          }
          return result;
        }

        return -1LL;
      }

      return ctf_get_ctt_size((_DWORD *)v6, v5, 0LL, 0LL);
    }

    return *(void *)(*(void *)(v6 + 520) + 16LL);
  }

  return result;
}

uint64_t ctf_array_info(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v5 = ctf_lookup_by_id((uint64_t)&v14, a2);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = v14;
  else {
    uint64_t v8 = *(unsigned __int16 *)(v5 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v14)(v8) != 4)
  {
    a1[140] = 1025;
    return 0xFFFFFFFFLL;
  }

  ctf_get_ctt_size(v7, v6, 0LL, &v13);
  uint64_t v9 = (unsigned __int16 *)(v13 + v6);
  uint64_t result = 0LL;
  if (v7[141] == 4)
  {
    *(void *)&__int128 v11 = *(void *)v9;
    *((void *)&v11 + 1) = HIDWORD(*(void *)v9);
    *(_OWORD *)a3 = v11;
    int v12 = *((_DWORD *)v9 + 2);
  }

  else
  {
    *(void *)a3 = *v9;
    *(void *)(a3 + _Block_object_dispose(va, 8) = v9[1];
    int v12 = *((_DWORD *)v9 + 1);
  }

  *(_DWORD *)(a3 + 16) = v12;
  return result;
}

unint64_t ctf_type_align(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    uint64_t v29 = (_DWORD *)a1;
    unint64_t v2 = ctf_type_resolve(a1, a2);
    if (v2 == -1LL) {
      return v2;
    }
    uint64_t v3 = ctf_lookup_by_id((uint64_t)&v29, v2);
    if (!v3) {
      return -1LL;
    }
    uint64_t v4 = v3;
    uint64_t v5 = v29;
    uint64_t v6 = (int)v29[141] > 3 ? *(unsigned int *)(v3 + 4) : *(unsigned __int16 *)(v3 + 4);
    unsigned int v7 = (**(uint64_t (***)(uint64_t))v29)(v6);
    if (v7 > 0xE) {
      break;
    }
    if (((1 << v7) & 0x4028) != 0) {
      return *(void *)(*((void *)v5 + 65) + 16LL);
    }
    if (((1 << v7) & 0xC0) != 0)
    {
      else {
        uint64_t v8 = *(unsigned __int16 *)(v4 + 4);
      }
      int v10 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 16LL))(v8);
      ctf_get_ctt_size(v5, v4, v28, &v27);
      else {
        uint64_t v11 = *(unsigned __int16 *)(v4 + 4);
      }
      uint64_t v12 = v27;
      else {
        int v13 = v10;
      }
      int v14 = v5[141];
      if (v14 == 1 || (uint64_t)v28[0] < 0x2000)
      {
        if (v14 == 4)
        {
          if (v13)
          {
            unint64_t v2 = 0LL;
            uint64_t v18 = (unsigned int *)(v12 + v4 + 4);
            do
            {
              unsigned int v19 = *v18;
              v18 += 3;
              unint64_t v20 = ctf_type_align(v5, v19);
              if (v2 <= v20) {
                unint64_t v2 = v20;
              }
              --v13;
            }

            while (v13);
            return v2;
          }
        }

        else if (v13)
        {
          unint64_t v2 = 0LL;
          uint64_t v24 = (unsigned __int16 *)(v12 + v4 + 4);
          do
          {
            unsigned int v25 = *v24;
            v24 += 4;
            unint64_t v26 = ctf_type_align(v5, v25);
            if (v2 <= v26) {
              unint64_t v2 = v26;
            }
            --v13;
          }

          while (v13);
          return v2;
        }
      }

      else if (v14 == 4)
      {
        if (v13)
        {
          unint64_t v2 = 0LL;
          int v15 = (unsigned int *)(v12 + v4 + 4);
          do
          {
            unsigned int v16 = *v15;
            v15 += 4;
            unint64_t v17 = ctf_type_align(v5, v16);
            if (v2 <= v17) {
              unint64_t v2 = v17;
            }
            --v13;
          }

          while (v13);
          return v2;
        }
      }

      else if (v13)
      {
        unint64_t v2 = 0LL;
        uint64_t v21 = (unsigned __int16 *)(v12 + v4 + 4);
        do
        {
          unsigned int v22 = *v21;
          v21 += 8;
          unint64_t v23 = ctf_type_align(v5, v22);
          if (v2 <= v23) {
            unint64_t v2 = v23;
          }
          --v13;
        }

        while (v13);
        return v2;
      }

      return 0LL;
    }

    if (v7 != 4) {
      return ctf_get_ctt_size(v5, v4, 0LL, 0LL);
    }
    a2 = v28[0];
    a1 = (uint64_t)v5;
  }

  return ctf_get_ctt_size(v5, v4, 0LL, 0LL);
}

uint64_t ctf_type_kind(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v2 = ctf_lookup_by_id((uint64_t)&v5, a2);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  else {
    uint64_t v3 = *(unsigned __int16 *)(v2 + 4);
  }
  return (**(uint64_t (***)(uint64_t))v5)(v3);
}

uint64_t ctf_type_reference(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t v3 = ctf_lookup_by_id((uint64_t)&v11, a2);
  if (!v3) {
    return -1LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = v11;
  else {
    uint64_t v6 = *(unsigned __int16 *)(v3 + 4);
  }
  int v7 = (**(uint64_t (***)(uint64_t))v11)(v6);
  if ((v7 - 10) >= 5 && v7 != 3)
  {
    *(_DWORD *)(a1 + 560) = 1026;
    return -1LL;
  }

  else {
    return *(unsigned __int16 *)(v4 + 6);
  }
}

uint64_t ctf_type_pointer(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = (void *)a1;
  if (ctf_lookup_by_id((uint64_t)&v11, a2))
  {
    uint64_t v4 = v11;
    uint64_t v5 = v11[63];
    uint64_t v6 = *(unsigned int *)(v5 + 4LL * (*(unsigned int (**)(uint64_t))(*v11 + 40LL))(a2));
    if ((_DWORD)v6) {
      return (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 48LL))(v6, (v4[139] >> 1) & 1);
    }
    uint64_t v8 = ctf_type_resolve((uint64_t)v4, a2);
    if (v8 != -1)
    {
      uint64_t v9 = v8;
      if (ctf_lookup_by_id((uint64_t)&v11, v8))
      {
        uint64_t v4 = v11;
        uint64_t v10 = v11[63];
        uint64_t v6 = *(unsigned int *)(v10 + 4LL * (*(unsigned int (**)(uint64_t))(*v11 + 40LL))(v9));
        if ((_DWORD)v6) {
          return (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 48LL))(v6, (v4[139] >> 1) & 1);
        }
      }
    }

    *(_DWORD *)(a1 + 560) = 1028;
  }

  return -1LL;
}

uint64_t ctf_type_encoding(uint64_t (***a1)(uint64_t), uint64_t a2, unsigned int *a3)
{
  int v13 = a1;
  uint64_t v5 = ctf_lookup_by_id((uint64_t)&v13, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = v13;
    ctf_get_ctt_size(v13, v5, 0LL, &v12);
    else {
      uint64_t v8 = *(unsigned __int16 *)(v6 + 4);
    }
    int v9 = (**v7)(v8);
    if (v9 == 2 || v9 == 1)
    {
      uint64_t result = 0LL;
      unsigned int v11 = *(_DWORD *)(v12 + v6);
      *a3 = HIBYTE(v11);
      a3[1] = BYTE2(v11);
      a3[2] = (unsigned __int16)v11;
      return result;
    }

    *((_DWORD *)a1 + 140) = 1024;
  }

  return 0xFFFFFFFFLL;
}

uint64_t ctf_type_ptrauth(unsigned int (***a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = a1;
  uint64_t v5 = ctf_lookup_by_id((uint64_t)&v12, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = v12;
    ctf_get_ctt_size(v12, v5, 0LL, &v11);
    else {
      uint64_t v8 = *(unsigned __int16 *)(v6 + 4);
    }
    if ((**v7)(v8) == 14)
    {
      uint64_t result = 0LL;
      int v10 = *(_DWORD *)(v11 + v6);
      *(_BYTE *)a3 = BYTE2(v10);
      *(_WORD *)(a3 + 2) = v10;
      *(_BYTE *)(a3 + 4) = (v10 & 0xFF000000) != 0;
      return result;
    }

    *((_DWORD *)a1 + 140) = 1046;
  }

  return 0xFFFFFFFFLL;
}

uint64_t ctf_type_cmp(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a2 < a4) {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v4 = a2 > a4;
  }
  if (a1 != a3)
  {
    uint64_t v6 = a3;
    unint64_t v7 = (unint64_t)a1;
    else {
      unsigned int v8 = v4;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return v4;
}

uint64_t ctf_type_compat( uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4)
{
  return ctf_type_compat_helper(a1, a2, a3, a4, 1);
}

uint64_t ctf_type_compat_helper( uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4, int a5)
{
  while (1)
  {
    int v5 = a5;
    uint64_t v6 = a4;
    uint64_t v7 = (uint64_t)a3;
    uint64_t v8 = a2;
    uint64_t v9 = (uint64_t)a1;
    unint64_t v45 = a3;
    uint64_t v46 = a1;
    uint64_t v10 = ctf_type_resolve(v9, v8);
    int v11 = ctf_type_kind(v9, v10);
    uint64_t v12 = ctf_type_resolve(v7, v6);
    int v13 = ctf_type_kind(v7, v12);
    int v14 = (unsigned int *)ctf_lookup_by_id((uint64_t)&v46, v10);
    uint64_t v15 = ctf_lookup_by_id((uint64_t)&v45, v12);
    if (v5)
    {
      unsigned int v16 = (unsigned int *)v15;
      uint64_t result = 0LL;
      if (v11 != v13 || !v14 || !v16) {
        return result;
      }
      unint64_t v18 = *v14;
      unsigned int v19 = &v46[2 * (v18 >> 31)];
      unint64_t v20 = v19[53];
      if (v20)
      {
        unint64_t v21 = v18 & 0x7FFFFFFF;
        uint64_t v22 = (uint64_t)v20 + v21;
        unint64_t v23 = (unint64_t)v19[54] <= v21 ? 0LL : (const char *)v22;
      }

      else
      {
        unint64_t v23 = 0LL;
      }

      uint64_t v24 = v23 ? v23 : "(?)";
      unint64_t v25 = *v16;
      unint64_t v26 = &v45[2 * (v25 >> 31)];
      uint64_t v27 = v26[53];
      if (v27)
      {
        unint64_t v28 = v25 & 0x7FFFFFFF;
        uint64_t v29 = (uint64_t)v27 + v28;
        unint64_t v30 = (unint64_t)v26[54] <= v28 ? 0LL : (const char *)v29;
      }

      else
      {
        unint64_t v30 = 0LL;
      }

      int v31 = v30 ? v30 : "(?)";
      if (strcmp(v24, v31)) {
        return 0LL;
      }
    }

    uint64_t result = 1LL;
    switch(v11)
    {
      case 1:
      case 2:
        if (ctf_type_encoding(v46, v10, (unsigned int *)&v42)
          || ctf_type_encoding(v45, v12, (unsigned int *)&v39))
        {
          return 0LL;
        }

        return v42 == v39 && v43 == (unint64_t)v40;
      case 3:
        goto LABEL_42;
      case 4:
        int v34 = v46;
        int v35 = v45;
        uint64_t result = ctf_type_compat_helper(v34, v42, v35, v39, 1LL);
        if (!(_DWORD)result) {
          return result;
        }
        a2 = v43;
        a4 = v40;
        a1 = v34;
        a3 = v35;
        goto LABEL_45;
      case 6:
      case 7:
        uint64_t v33 = ctf_type_size((uint64_t)v46, v10);
        return v33 == ctf_type_size((uint64_t)v45, v12);
      case 8:
      case 9:
        return result;
      case 14:
        uint64_t v10 = ctf_type_reference((uint64_t)v46, v10);
LABEL_42:
        unint64_t v36 = v45;
        if (v13 == 14) {
          uint64_t v12 = ctf_type_reference((uint64_t)v45, v12);
        }
        char v37 = v46;
        uint64_t v38 = ctf_type_reference((uint64_t)v46, v10);
        a4 = ctf_type_reference((uint64_t)v36, v12);
        a1 = v37;
        a2 = v38;
        a3 = v36;
LABEL_45:
        a5 = 1;
        break;
      default:
        return 0LL;
    }
  }

uint64_t ctf_type_printf_compat( uint64_t (***a1)(uint64_t), uint64_t a2, uint64_t (***a3)(uint64_t), uint64_t a4)
{
  return ctf_type_compat_helper(a1, a2, a3, a4, 0);
}

uint64_t ctf_member_info(int *a1, uint64_t a2, const char *a3, void *a4)
{
  return _ctf_member_info(a1, a2, a3, 0LL, a4);
}

uint64_t _ctf_member_info(int *a1, uint64_t a2, const char *a3, uint64_t a4, void *a5)
{
  char v66 = a1;
  uint64_t v9 = ctf_type_resolve((uint64_t)a1, a2);
  if (v9 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = ctf_lookup_by_id((uint64_t)&v66, v9);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v66;
  ctf_get_ctt_size(v66, v10, (unint64_t *)&v65, &v64);
  if (v12[141] > 3) {
    uint64_t v13 = *(unsigned int *)(v11 + 4);
  }
  else {
    uint64_t v13 = *(unsigned __int16 *)(v11 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v12)(v13) - 8 > 0xFFFFFFFD)
  {
    int v15 = v12[141];
    if (v15 == 1 || v65 < 0x2000)
    {
      if (v15 == 4)
      {
        uint64_t v28 = v64;
        int v29 = (*(uint64_t (**)(void))(*(void *)v12 + 16LL))(*(unsigned int *)(v11 + 4));
        if (v29)
        {
          int v30 = v29;
          uint64_t v31 = v28 + v11;
          while (1)
          {
            unsigned int v32 = *(_DWORD *)v31;
            if (!*(_DWORD *)v31)
            {
              uint64_t result = _ctf_member_info(v12, *(unsigned int *)(v31 + 4), a3, *(unsigned __int16 *)(v31 + 8) + a4, a5);
              if (!(_DWORD)result) {
                return result;
              }
              unsigned int v32 = *(_DWORD *)v31;
            }

            uint64_t v33 = v32 >> 31;
            uint64_t v34 = *(void *)&v12[4 * v33 + 106];
            if (v34)
            {
              unint64_t v35 = v32 & 0x7FFFFFFF;
              uint64_t v36 = v34 + v35;
              char v37 = *(void *)&v12[4 * v33 + 108] <= v35 ? 0LL : (const char *)v36;
            }

            else
            {
              char v37 = 0LL;
            }

            uint64_t v38 = v37 ? v37 : "(?)";
            uint64_t result = strcmp(v38, a3);
            if (!(_DWORD)result) {
              break;
            }
            v31 += 12LL;
            if (!--v30) {
              goto LABEL_81;
            }
          }

          *a5 = *(unsigned int *)(v31 + 4);
          unint64_t v63 = *(unsigned __int16 *)(v31 + 8);
          goto LABEL_90;
        }
      }

      else
      {
        if (v15 > 3) {
          uint64_t v40 = *(unsigned int *)(v11 + 4);
        }
        else {
          uint64_t v40 = *(unsigned __int16 *)(v11 + 4);
        }
        uint64_t v51 = v64;
        int v52 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 16LL))(v40);
        if (v52)
        {
          int v53 = v52;
          uint64_t v54 = v51 + v11;
          while (1)
          {
            unsigned int v55 = *(_DWORD *)v54;
            if (!*(_DWORD *)v54)
            {
              uint64_t result = _ctf_member_info( v12,  *(unsigned __int16 *)(v54 + 4),  a3,  *(unsigned __int16 *)(v54 + 6) + a4,  a5);
              if (!(_DWORD)result) {
                return result;
              }
              unsigned int v55 = *(_DWORD *)v54;
            }

            uint64_t v56 = v55 >> 31;
            uint64_t v57 = *(void *)&v12[4 * v56 + 106];
            if (v57)
            {
              unint64_t v58 = v55 & 0x7FFFFFFF;
              uint64_t v59 = v57 + v58;
              int v60 = *(void *)&v12[4 * v56 + 108] <= v58 ? 0LL : (const char *)v59;
            }

            else
            {
              int v60 = 0LL;
            }

            uint64_t v61 = v60 ? v60 : "(?)";
            uint64_t result = strcmp(v61, a3);
            if (!(_DWORD)result) {
              break;
            }
            v54 += 8LL;
            if (!--v53) {
              goto LABEL_81;
            }
          }

          *a5 = *(unsigned __int16 *)(v54 + 4);
          unint64_t v63 = *(unsigned __int16 *)(v54 + 6);
          goto LABEL_90;
        }
      }
    }

    else if (v15 == 4)
    {
      uint64_t v16 = v64;
      int v17 = (*(uint64_t (**)(void))(*(void *)v12 + 16LL))(*(unsigned int *)(v11 + 4));
      if (v17)
      {
        int v18 = v17;
        unsigned int v19 = (unsigned int *)(v16 + v11);
        while (1)
        {
          unsigned int v20 = *v19;
          if (!*v19)
          {
            uint64_t result = _ctf_member_info(v12, 0LL, a3, (v19[3] | ((unint64_t)v19[2] << 32)) + a4, a5);
            if (!(_DWORD)result) {
              return result;
            }
            unsigned int v20 = *v19;
          }

          uint64_t v22 = v20 >> 31;
          uint64_t v23 = *(void *)&v12[4 * v22 + 106];
          if (v23)
          {
            unint64_t v24 = v20 & 0x7FFFFFFF;
            uint64_t v25 = v23 + v24;
            unint64_t v26 = *(void *)&v12[4 * v22 + 108] <= v24 ? 0LL : (const char *)v25;
          }

          else
          {
            unint64_t v26 = 0LL;
          }

          uint64_t v27 = v26 ? v26 : "(?)";
          uint64_t result = strcmp(v27, a3);
          if (!(_DWORD)result) {
            break;
          }
          v19 += 4;
          if (!--v18) {
            goto LABEL_81;
          }
        }

        uint64_t v62 = v19[1];
LABEL_88:
        *a5 = v62;
        unint64_t v63 = v19[3] | ((unint64_t)v19[2] << 32);
LABEL_90:
        a5[1] = v63 + a4;
        return result;
      }
    }

    else
    {
      if (v15 > 3) {
        uint64_t v39 = *(unsigned int *)(v11 + 4);
      }
      else {
        uint64_t v39 = *(unsigned __int16 *)(v11 + 4);
      }
      uint64_t v41 = v64;
      int v42 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 16LL))(v39);
      if (v42)
      {
        int v43 = v42;
        unsigned int v19 = (unsigned int *)(v41 + v11);
        while (1)
        {
          unsigned int v44 = *v19;
          if (!*v19)
          {
            uint64_t result = _ctf_member_info(v12, 0LL, a3, (v19[3] | ((unint64_t)v19[2] << 32)) + a4, a5);
            if (!(_DWORD)result) {
              return result;
            }
            unsigned int v44 = *v19;
          }

          uint64_t v45 = v44 >> 31;
          uint64_t v46 = *(void *)&v12[4 * v45 + 106];
          if (v46)
          {
            unint64_t v47 = v44 & 0x7FFFFFFF;
            uint64_t v48 = v46 + v47;
            uint64_t v49 = *(void *)&v12[4 * v45 + 108] <= v47 ? 0LL : (const char *)v48;
          }

          else
          {
            uint64_t v49 = 0LL;
          }

          int v50 = v49 ? v49 : "(?)";
          uint64_t result = strcmp(v50, a3);
          if (!(_DWORD)result) {
            break;
          }
          v19 += 4;
          if (!--v43) {
            goto LABEL_81;
          }
        }

        uint64_t v62 = *((unsigned __int16 *)v19 + 2);
        goto LABEL_88;
      }
    }

LABEL_81:
    int v14 = 1038;
    goto LABEL_82;
  }

  int v14 = 1021;
LABEL_82:
  a1[140] = v14;
  return 0xFFFFFFFFLL;
}

const char *ctf_enum_name(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v22 = (_DWORD *)a1;
  uint64_t v5 = ctf_type_resolve(a1, a2);
  if (v5 == -1) {
    return 0LL;
  }
  uint64_t result = (const char *)ctf_lookup_by_id((uint64_t)&v22, v5);
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    uint64_t v8 = v22;
    else {
      uint64_t v9 = *((unsigned __int16 *)result + 2);
    }
    if ((**(unsigned int (***)(uint64_t))v22)(v9) == 8)
    {
      ctf_get_ctt_size(v8, v7, 0LL, &v21);
      else {
        uint64_t v10 = *(unsigned __int16 *)(v7 + 4);
      }
      uint64_t v12 = v21;
      int v13 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16LL))(v10);
      if (v13)
      {
        int v14 = (unsigned int *)(v12 + v7);
        while (v14[1] != a3)
        {
          v14 += 2;
          if (!--v13) {
            goto LABEL_16;
          }
        }

        unint64_t v15 = *v14;
        uint64_t v16 = &v8[4 * (v15 >> 31)];
        uint64_t v17 = *((void *)v16 + 53);
        if (v17)
        {
          unint64_t v18 = v15 & 0x7FFFFFFF;
          uint64_t v19 = v17 + v18;
          if (*((void *)v16 + 54) <= v18) {
            uint64_t v20 = 0LL;
          }
          else {
            uint64_t v20 = v19;
          }
        }

        else
        {
          uint64_t v20 = 0LL;
        }

        if (v20) {
          return (const char *)v20;
        }
        else {
          return "(?)";
        }
      }

LABEL_16:
      uint64_t result = 0LL;
      int v11 = 1037;
    }

    else
    {
      uint64_t result = 0LL;
      int v11 = 1022;
    }

    *(_DWORD *)(a1 + 560) = v11;
  }

  return result;
}

uint64_t ctf_enum_value(uint64_t a1, uint64_t a2, const char *a3, _DWORD *a4)
{
  uint64_t v28 = (_DWORD *)a1;
  uint64_t v7 = ctf_type_resolve(a1, a2);
  if (v7 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = ctf_lookup_by_id((uint64_t)&v28, v7);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  uint64_t v10 = v28;
  else {
    uint64_t v11 = *(unsigned __int16 *)(v8 + 4);
  }
  if ((**(unsigned int (***)(uint64_t))v28)(v11) != 8)
  {
    int v13 = 1022;
LABEL_24:
    *(_DWORD *)(a1 + 560) = v13;
    return 0xFFFFFFFFLL;
  }

  ctf_get_ctt_size(v10, v9, &v27, &v26);
  else {
    uint64_t v12 = *(unsigned __int16 *)(v9 + 4);
  }
  uint64_t v14 = v26;
  int v15 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 16LL))(v12);
  if (!v15)
  {
LABEL_23:
    int v13 = 1037;
    goto LABEL_24;
  }

  int v16 = v15;
  uint64_t v17 = (unsigned int *)(v14 + v9);
  while (1)
  {
    unint64_t v18 = *v17;
    uint64_t v19 = &v10[4 * (v18 >> 31)];
    uint64_t v20 = *((void *)v19 + 53);
    if (v20)
    {
      unint64_t v21 = v18 & 0x7FFFFFFF;
      uint64_t v22 = v20 + v21;
      uint64_t v23 = *((void *)v19 + 54) <= v21 ? 0LL : (const char *)v22;
    }

    else
    {
      uint64_t v23 = 0LL;
    }

    unint64_t v24 = v23 ? v23 : "(?)";
    if (!strcmp(v24, a3)) {
      break;
    }
    v17 += 2;
    if (!--v16) {
      goto LABEL_23;
    }
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = v17[1];
  }
  return result;
}

uint64_t ctf_type_visit( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  return ctf_type_rvisit(a1, a2, a3, a4, (uint64_t)&_CTF_NULLSTR, 0LL, 0LL);
}

uint64_t ctf_type_rvisit( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v68 = (_DWORD *)a1;
  uint64_t v13 = ctf_type_resolve(a1, a2);
  if (v13 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v14 = ctf_lookup_by_id((uint64_t)&v68, v13);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = v14;
  uint64_t result = a3(a5, a2, a6, a7, a4);
  if (!(_DWORD)result)
  {
    uint64_t v17 = v68;
    else {
      uint64_t v18 = *(unsigned __int16 *)(v15 + 4);
    }
    if ((**(unsigned int (***)(uint64_t))v68)(v18) - 8 >= 0xFFFFFFFE)
    {
      ctf_get_ctt_size(v17, v15, (unint64_t *)&v67, &v66);
      int v19 = v17[141];
      if (v19 == 1 || v67 < 0x2000)
      {
        if (v19 == 4)
        {
          uint64_t v31 = v66;
          uint64_t result = (*(uint64_t (**)(void))(*(void *)v17 + 16LL))(*(unsigned int *)(v15 + 4));
          if ((_DWORD)result)
          {
            int v32 = result;
            uint64_t v33 = (a7 + 1);
            uint64_t v34 = (unsigned __int16 *)(v31 + v15 + 8);
            do
            {
              unint64_t v35 = *((unsigned int *)v34 - 2);
              uint64_t v36 = &v17[4 * (v35 >> 31)];
              uint64_t v37 = *((void *)v36 + 53);
              if (v37)
              {
                unint64_t v38 = v35 & 0x7FFFFFFF;
                uint64_t v39 = (const char *)(v37 + v38);
                if (*((void *)v36 + 54) <= v38) {
                  uint64_t v40 = 0LL;
                }
                else {
                  uint64_t v40 = v39;
                }
              }

              else
              {
                uint64_t v40 = 0LL;
              }

              if (v40) {
                uint64_t v41 = v40;
              }
              else {
                uint64_t v41 = "(?)";
              }
              uint64_t result = ctf_type_rvisit(v17, *((unsigned int *)v34 - 1), a3, a4, v41, *v34 + a6, v33);
              if ((_DWORD)result) {
                break;
              }
              v34 += 6;
              --v32;
            }

            while (v32);
          }
        }

        else
        {
          if (v19 > 3) {
            uint64_t v43 = *(unsigned int *)(v15 + 4);
          }
          else {
            uint64_t v43 = *(unsigned __int16 *)(v15 + 4);
          }
          uint64_t v55 = v66;
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16LL))(v43);
          if ((_DWORD)result)
          {
            int v56 = result;
            uint64_t v57 = (a7 + 1);
            unint64_t v58 = (unsigned __int16 *)(v55 + v15 + 6);
            do
            {
              unint64_t v59 = *(unsigned int *)(v58 - 3);
              int v60 = &v17[4 * (v59 >> 31)];
              uint64_t v61 = *((void *)v60 + 53);
              if (v61)
              {
                unint64_t v62 = v59 & 0x7FFFFFFF;
                unint64_t v63 = (const char *)(v61 + v62);
                if (*((void *)v60 + 54) <= v62) {
                  uint64_t v64 = 0LL;
                }
                else {
                  uint64_t v64 = v63;
                }
              }

              else
              {
                uint64_t v64 = 0LL;
              }

              if (v64) {
                uint64_t v65 = v64;
              }
              else {
                uint64_t v65 = "(?)";
              }
              uint64_t result = ctf_type_rvisit(v17, *(v58 - 1), a3, a4, v65, *v58 + a6, v57);
              if ((_DWORD)result) {
                break;
              }
              v58 += 4;
              --v56;
            }

            while (v56);
          }
        }
      }

      else if (v19 == 4)
      {
        uint64_t v20 = v66;
        uint64_t result = (*(uint64_t (**)(void))(*(void *)v17 + 16LL))(*(unsigned int *)(v15 + 4));
        if ((_DWORD)result)
        {
          int v21 = result;
          uint64_t v22 = (a7 + 1);
          uint64_t v23 = (unsigned int *)(v20 + v15 + 8);
          do
          {
            unint64_t v24 = *(v23 - 2);
            uint64_t v25 = &v17[4 * (v24 >> 31)];
            uint64_t v26 = *((void *)v25 + 53);
            if (v26)
            {
              unint64_t v27 = v24 & 0x7FFFFFFF;
              uint64_t v28 = (const char *)(v26 + v27);
              if (*((void *)v25 + 54) <= v27) {
                int v29 = 0LL;
              }
              else {
                int v29 = v28;
              }
            }

            else
            {
              int v29 = 0LL;
            }

            if (v29) {
              int v30 = v29;
            }
            else {
              int v30 = "(?)";
            }
            uint64_t result = ctf_type_rvisit(v17, *(v23 - 1), a3, a4, v30, (v23[1] | ((unint64_t)*v23 << 32)) + a6, v22);
            if ((_DWORD)result) {
              break;
            }
            v23 += 4;
            --v21;
          }

          while (v21);
        }
      }

      else
      {
        if (v19 > 3) {
          uint64_t v42 = *(unsigned int *)(v15 + 4);
        }
        else {
          uint64_t v42 = *(unsigned __int16 *)(v15 + 4);
        }
        uint64_t v44 = v66;
        uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16LL))(v42);
        if ((_DWORD)result)
        {
          int v45 = result;
          uint64_t v46 = (a7 + 1);
          unint64_t v47 = (unsigned int *)(v44 + v15 + 8);
          do
          {
            unint64_t v48 = *(v47 - 2);
            uint64_t v49 = &v17[4 * (v48 >> 31)];
            uint64_t v50 = *((void *)v49 + 53);
            if (v50)
            {
              unint64_t v51 = v48 & 0x7FFFFFFF;
              int v52 = (const char *)(v50 + v51);
              if (*((void *)v49 + 54) <= v51) {
                int v53 = 0LL;
              }
              else {
                int v53 = v52;
              }
            }

            else
            {
              int v53 = 0LL;
            }

            if (v53) {
              uint64_t v54 = v53;
            }
            else {
              uint64_t v54 = "(?)";
            }
            uint64_t result = ctf_type_rvisit( v17,  *((unsigned __int16 *)v47 - 2),  a3,  a4,  v54,  (v47[1] | ((unint64_t)*v47 << 32)) + a6,  v46);
            if ((_DWORD)result) {
              break;
            }
            v47 += 4;
            --v45;
          }

          while (v45);
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

void *ctf_list_append(void *result, void *a2)
{
  uint64_t v2 = (void *)*result;
  *uint64_t result = a2;
  *a2 = v2;
  a2[1] = 0LL;
  if (!v2) {
    uint64_t v2 = result;
  }
  v2[1] = a2;
  return result;
}

void *ctf_list_prepend(void *result, void *a2)
{
  uint64_t v2 = (void *)result[1];
  result[1] = a2;
  *a2 = 0LL;
  a2[1] = v2;
  if (!v2) {
    uint64_t v2 = result;
  }
  *uint64_t v2 = a2;
  return result;
}

void *ctf_list_delete(void *result, uint64_t *a2)
{
  uint64_t v2 = (void *)*a2;
  if (*a2) {
    uint64_t v3 = (void *)*a2;
  }
  else {
    uint64_t v3 = result;
  }
  v3[1] = a2[1];
  uint64_t v4 = (void *)a2[1];
  if (!v4) {
    uint64_t v4 = result;
  }
  *uint64_t v4 = v2;
  return result;
}

uint64_t ctf_strraw(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a2 >> 31;
  uint64_t v3 = *(void *)(a1 + 16LL * v2 + 424);
  if (!v3) {
    return 0LL;
  }
  unint64_t v4 = a2 & 0x7FFFFFFF;
  uint64_t v5 = v3 + v4;
  if (*(void *)(a1 + 16 * v2 + 432) <= v4) {
    return 0LL;
  }
  else {
    return v5;
  }
}

const char *ctf_strptr(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a2 >> 31;
  uint64_t v3 = *(void *)(a1 + 16LL * v2 + 424);
  if (v3)
  {
    unint64_t v4 = a2 & 0x7FFFFFFF;
    uint64_t v5 = v3 + v4;
    if (*(void *)(a1 + 16 * v2 + 432) <= v4) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = v5;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if (v6) {
    return (const char *)v6;
  }
  else {
    return "(?)";
  }
}

char *ctf_strdup(const char *a1)
{
  size_t v2 = strlen(a1);
  uint64_t result = (char *)malloc(v2 + 1);
  if (result) {
    return strcpy(result, a1);
  }
  return result;
}

uint64_t ctf_set_open_errno(_DWORD *a1, int a2)
{
  if (a1) {
    *a1 = a2;
  }
  return 0LL;
}

uint64_t ctf_set_errno(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 560) = a2;
  return -1LL;
}

size_t _os_log_fmt_decode_error(size_t result)
{
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v1 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v1 - 1) <= 0x15)
    {
      return os_trace_blob_add_slow(result, "<decode: missing data>", 0x16uLL);
    }

    else
    {
      qmemcpy((void *)(*(void *)result + v1), "<decode: missing data>", 22);
      unsigned int v2 = *(_DWORD *)(result + 8) + 22;
      *(_DWORD *)(result + _Block_object_dispose(va, 8) = v2;
      if (!*(_BYTE *)(result + 22)) {
        *(_BYTE *)(*(void *)result + v2) = 0;
      }
    }
  }

  return result;
}

uint64_t _os_log_fmt_decode_cmd_mismatch( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a5;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
  unint64_t v17 = *a4;
  if (v17 > 0x4F)
  {
    os_trace_blob_addf(a1, "%d", v11, v12, v13, v14, v15, v16, *a4 >> 4);
  }

  else
  {
    uint64_t v18 = _cmd_type2str[v17 >> 4];
    unint64_t v19 = strlen(v18);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      int v26 = v19;
      uint64_t v27 = *(unsigned int *)(a1 + 8);
      if (v19 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
      {
        os_trace_blob_add_slow(a1, v18, v19);
      }

      else
      {
        memcpy((void *)(*(void *)a1 + v27), v18, v19);
        unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
        *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v28;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v2_Block_object_dispose(va, 8) = 0;
        }
      }
    }
  }

  if ((*a4 & 2) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v29 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 6)
    {
      os_trace_blob_add_slow(a1, " public", 7uLL);
    }

    else
    {
      int v30 = (_DWORD *)(*(void *)a1 + v29);
      *(_DWORD *)((char *)v30 + 3) = 1667853410;
      _DWORD *v30 = 1651863584;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 7;
      *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v31;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v31) = 0;
      }
    }
  }

  if ((*a4 & 1) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v32 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v32 - 1) <= 7)
    {
      os_trace_blob_add_slow(a1, " private", 8uLL);
    }

    else
    {
      *(void *)(*(void *)a1 + v32) = 0x6574617669727020LL;
      unsigned int v33 = *(_DWORD *)(a1 + 8) + 8;
      *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v33;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v33) = 0;
      }
    }
  }

  return os_trace_blob_addf(a1, " sz:%d]>", v20, v21, v22, v23, v24, v25, v8);
}

uint64_t _os_log_fmt_decode_bad_range( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf( a1,  "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>",  a3,  a4,  a5,  a6,  a7,  a8,  a3);
}

uint64_t _os_log_fmt_decode_masked_unknown( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_decode_give_up( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, a3);
}

id _OSLogFailWithPOSIXError(id result, void *a2)
{
  if (a2)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:(int)result userInfo:0];
    uint64_t result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }

  return result;
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
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

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x189611500]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x189611508]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x189607448](aClass, extraBytes, zone);
}

void NSDeallocateObject(id object)
{
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x189607720]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1896077B0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
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

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x189604230]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189F0D3D0(__sz);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1895F8998](a1, a2, *(void *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895F89A0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

uint64_t _dyld_dlsym_blocked()
{
  return MEMORY[0x1895F8BA8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895F8C40]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895F8D70]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_state_request_for_pidlist()
{
  return MEMORY[0x1895F8E58]();
}

uint64_t _os_trace_calloc()
{
  return MEMORY[0x1895F8E60]();
}

uint64_t _os_trace_fdscandir_b()
{
  return MEMORY[0x1895F8E68]();
}

uint64_t _os_trace_get_boot_uuid()
{
  return MEMORY[0x1895F8E70]();
}

uint64_t _os_trace_getxattr_at()
{
  return MEMORY[0x1895F8E78]();
}

uint64_t _os_trace_intprefsdir_path()
{
  return MEMORY[0x1895F8E80]();
}

uint64_t _os_trace_is_development_build()
{
  return MEMORY[0x1895F8E88]();
}

uint64_t _os_trace_malloc()
{
  return MEMORY[0x1895F8E98]();
}

uint64_t _os_trace_memdup()
{
  return MEMORY[0x1895F8EA0]();
}

uint64_t _os_trace_mmap()
{
  return MEMORY[0x1895F8EA8]();
}

uint64_t _os_trace_mmap_at()
{
  return MEMORY[0x1895F8EB0]();
}

uint64_t _os_trace_prefsdir_path()
{
  return MEMORY[0x1895F8EB8]();
}

uint64_t _os_trace_read_file_at()
{
  return MEMORY[0x1895F8EC0]();
}

uint64_t _os_trace_realloc()
{
  return MEMORY[0x1895F8EC8]();
}

uint64_t _os_trace_scandir_free_namelist()
{
  return MEMORY[0x1895F8ED0]();
}

uint64_t _os_trace_sysprefsdir_path()
{
  return MEMORY[0x1895F8ED8]();
}

uint64_t _os_trace_write()
{
  return MEMORY[0x1895F8EE0]();
}

uint64_t _os_trace_writev()
{
  return MEMORY[0x1895F8EE8]();
}

uint64_t _os_trace_zalloc()
{
  return MEMORY[0x1895F8EF0]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int alphasort(const dirent **a1, const dirent **a2)
{
  return MEMORY[0x1895F94B0](a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1895F9590](a1);
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

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x189616488](cls, outCount);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1896149A8](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1895FAC48](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_queue_set_specific( dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

unint64_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1895FAE58](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1895FAFB8](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1895FB0D0]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1895FB180](__file, __arg0);
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1895FB1C8](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1895FB218](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1895FB230](*(void *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

pid_t fork(void)
{
  return MEMORY[0x1895FB350]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FB458](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1895FB4A8](a1, a2, *(void *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getpagesize(void)
{
  return MEMORY[0x1895FB608]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FB728](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
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

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1895FBE78](__base, __nel, __width, __compar);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1895FBEF8](*(void *)&a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF00](a1);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1895FBF48](a1, *(void *)&a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1895FBF60](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBF80](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FC268](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

uint64_t os_log_backtrace_create_from_buffer()
{
  return MEMORY[0x1895FC420]();
}

uint64_t os_log_backtrace_destroy()
{
  return MEMORY[0x1895FC428]();
}

uint64_t os_log_backtrace_get_frames()
{
  return MEMORY[0x1895FC430]();
}

uint64_t os_log_backtrace_get_length()
{
  return MEMORY[0x1895FC438]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1896169F0](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x189616A00](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x189616A20](proto, outCount);
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

int putchar(int a1)
{
  return MEMORY[0x1895FCB88](*(void *)&a1);
}

int putenv(char *a1)
{
  return MEMORY[0x1895FCB90](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

size_t rb_tree_count(rb_tree_t *a1)
{
  return MEMORY[0x1895FCC00](a1);
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

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return MEMORY[0x1895FCD58](*(void *)&a1, a2, *(void *)&a3, a4);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FCD80](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1895FCF50](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD038](__big, __little);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
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

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strpbrk(const char *__s, const char *__charset)
{
  return (char *)MEMORY[0x1895FD110](__s, __charset);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1895FD118](a1, a2, a3);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x1895FD420]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1895FD470](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
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

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
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

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD990](connection);
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

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

uint64_t xpc_copy_short_description()
{
  return MEMORY[0x1895FDAD0]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBB8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
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

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
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

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}

uint64_t objc_msgSend_initWithPredicate_supportedKeys_supportedOperators_supportedCompoundTypes_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithPredicate_supportedKeys_supportedOperators_supportedCompoundTypes_);
}