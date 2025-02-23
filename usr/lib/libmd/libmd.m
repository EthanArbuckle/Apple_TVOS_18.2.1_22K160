_BYTE *MD4End(CC_MD4_CTX *c, _BYTE *a2)
{
  _BYTE *v2;
  unsigned __int8 *v4;
  uint64_t i;
  unsigned int v6;
  _BYTE *v7;
  unsigned __int8 md[16];
  uint64_t v10;
  v2 = a2;
  v10 = *MEMORY[0x1895F89C0];
  if (a2 || (v2 = malloc(0x21uLL)) != 0LL)
  {
    v4 = md;
    CC_MD4_Final(md, c);
    for (i = 0LL; i != 32; i += 2LL)
    {
      v6 = *v4++;
      v7 = &v2[i];
      *v7 = MD4End_hex[(unint64_t)v6 >> 4];
      v7[1] = MD4End_hex[v6 & 0xF];
    }

    v2[32] = 0;
  }

  return v2;
}

_BYTE *MD4Fd(int a1, _BYTE *a2)
{
  return MD4FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *MD4FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x7800000000LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_MD4_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial);
      while (__stlxr(v9 + 1, &dispatch_queue_serial));
      else {
        v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __MD4FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30C820;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __MD4FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30C870;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        v24 = MD4End((CC_MD4_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

uint64_t __MD4FdChunk_block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __MD4FdChunk_block_invoke_2(uint64_t result, int a2, dispatch_data_t data, int a4)
{
  v7 = (void *)result;
  if (data)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 0x40000000LL;
    applier[2] = __MD4FdChunk_block_invoke_3;
    applier[3] = &unk_18A30C848;
    applier[4] = *(void *)(result + 32);
    result = dispatch_data_apply(data, applier);
  }

  if (a4) {
    *(_DWORD *)(*(void *)(v7[5] + 8LL) + 24LL) = a4;
  }
  if (a2)
  {
    int v8 = (dispatch_semaphore_s *)v7[7];
    *(_BYTE *)(*(void *)(v7[6] + 8LL) + 24LL) = data == (dispatch_data_t)MEMORY[0x1895F8AA8];
    return dispatch_semaphore_signal(v8);
  }

  return result;
}

uint64_t __MD4FdChunk_block_invoke_3(uint64_t a1, int a2, int a3, void *data, unint64_t len)
{
  if (len >> 31) {
    MD4FdChunk_cold_1();
  }
  CC_MD4_Update((CC_MD4_CTX *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), data, len);
  return 1LL;
}

_BYTE *MD4File(const char *a1, _BYTE *a2)
{
  return MD4FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *MD4FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = MD4FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *MD4Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return MD4End(&c, a3);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

_BYTE *SHA384_End(CC_SHA512_CTX *c, _BYTE *a2)
{
  v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (v2 = malloc(0x61uLL)) != 0LL)
  {
    v4 = md;
    CC_SHA384_Final(md, c);
    for (uint64_t i = 0LL; i != 96; i += 2LL)
    {
      unsigned int v6 = *v4++;
      int v7 = &v2[i];
      _BYTE *v7 = SHA384_End_hex[(unint64_t)v6 >> 4];
      v7[1] = SHA384_End_hex[v6 & 0xF];
    }

    v2[96] = 0;
  }

  return v2;
}

_BYTE *SHA384_Fd(int a1, _BYTE *a2)
{
  return SHA384_FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA384_FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0xE800000000LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_SHA384_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_0);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_0));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __SHA384_FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30C898;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __SHA384_FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30C8E8;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        v24 = SHA384_End((CC_SHA512_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

_BYTE *SHA384_File(const char *a1, _BYTE *a2)
{
  return SHA384_FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA384_FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = SHA384_FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *SHA384_Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return SHA384_End(&v7, a3);
}

_BYTE *SHA224_End(CC_SHA256_CTX *c, _BYTE *a2)
{
  v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (v2 = malloc(0x39uLL)) != 0LL)
  {
    v4 = md;
    CC_SHA224_Final(md, c);
    for (uint64_t i = 0LL; i != 56; i += 2LL)
    {
      unsigned int v6 = *v4++;
      CC_SHA512_CTX v7 = &v2[i];
      _BYTE *v7 = SHA224_End_hex[(unint64_t)v6 >> 4];
      v7[1] = SHA224_End_hex[v6 & 0xF];
    }

    v2[56] = 0;
  }

  return v2;
}

_BYTE *SHA224_Fd(int a1, _BYTE *a2)
{
  return SHA224_FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA224_FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x8000000000LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_SHA224_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_1);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_1));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __SHA224_FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30C910;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __SHA224_FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30C960;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        v24 = SHA224_End((CC_SHA256_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

_BYTE *SHA224_File(const char *a1, _BYTE *a2)
{
  return SHA224_FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA224_FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = SHA224_FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *SHA224_Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return SHA224_End(&c, a3);
}

_BYTE *SHA1_End(CC_SHA1_CTX *c, _BYTE *a2)
{
  v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (v2 = malloc(0x29uLL)) != 0LL)
  {
    v4 = md;
    CC_SHA1_Final(md, c);
    for (uint64_t i = 0LL; i != 40; i += 2LL)
    {
      unsigned int v6 = *v4++;
      int v7 = &v2[i];
      _BYTE *v7 = SHA1_End_hex[(unint64_t)v6 >> 4];
      v7[1] = SHA1_End_hex[v6 & 0xF];
    }

    v2[40] = 0;
  }

  return v2;
}

_BYTE *SHA1_Fd(int a1, _BYTE *a2)
{
  return SHA1_FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA1_FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x7800000000LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_SHA1_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_2);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_2));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __SHA1_FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30C988;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __SHA1_FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30C9D8;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        v24 = SHA1_End((CC_SHA1_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

_BYTE *SHA1_File(const char *a1, _BYTE *a2)
{
  return SHA1_FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA1_FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = SHA1_FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *SHA1_Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return SHA1_End(&v7, a3);
}

_BYTE *SHA_End(SHA_CTX *c, _BYTE *a2)
{
  v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (v2 = malloc(0x29uLL)) != 0LL)
  {
    v4 = md;
    SHA_Final(md, c);
    for (uint64_t i = 0LL; i != 40; i += 2LL)
    {
      unsigned int v6 = *v4++;
      CC_SHA1_CTX v7 = &v2[i];
      _BYTE *v7 = SHA_End_hex[(unint64_t)v6 >> 4];
      v7[1] = SHA_End_hex[v6 & 0xF];
    }

    v2[40] = 0;
  }

  return v2;
}

_BYTE *SHA_Fd(int a1, _BYTE *a2)
{
  return SHA_FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA_FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x7800000000LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    SHA_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_3);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_3));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __SHA_FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30CA00;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __SHA_FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30CA50;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        v24 = SHA_End((SHA_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

_BYTE *SHA_File(const char *a1, _BYTE *a2)
{
  return SHA_FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA_FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = SHA_FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *SHA_Data(const void *a1, unsigned int a2, _BYTE *a3)
{
  return SHA_End(&v7, a3);
}

_BYTE *MD5End(CC_MD5_CTX *c, _BYTE *a2)
{
  v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (v2 = malloc(0x21uLL)) != 0LL)
  {
    v4 = md;
    CC_MD5_Final(md, c);
    for (uint64_t i = 0LL; i != 32; i += 2LL)
    {
      unsigned int v6 = *v4++;
      SHA_CTX v7 = &v2[i];
      _BYTE *v7 = MD5End_hex[(unint64_t)v6 >> 4];
      v7[1] = MD5End_hex[v6 & 0xF];
    }

    v2[32] = 0;
  }

  return v2;
}

_BYTE *MD5Fd(int a1, _BYTE *a2)
{
  return MD5FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *MD5FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x7800000000LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_MD5_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_4);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_4));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __MD5FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30CA78;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __MD5FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30CAC8;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        v24 = MD5End((CC_MD5_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

uint64_t __MD5FdChunk_block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __MD5FdChunk_block_invoke_2(uint64_t result, int a2, dispatch_data_t data, int a4)
{
  SHA_CTX v7 = (void *)result;
  if (data)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 0x40000000LL;
    applier[2] = __MD5FdChunk_block_invoke_3;
    applier[3] = &unk_18A30CAA0;
    applier[4] = *(void *)(result + 32);
    result = dispatch_data_apply(data, applier);
  }

  if (a4) {
    *(_DWORD *)(*(void *)(v7[5] + 8LL) + 24LL) = a4;
  }
  if (a2)
  {
    int v8 = (dispatch_semaphore_s *)v7[7];
    *(_BYTE *)(*(void *)(v7[6] + 8LL) + 24LL) = data == (dispatch_data_t)MEMORY[0x1895F8AA8];
    return dispatch_semaphore_signal(v8);
  }

  return result;
}

uint64_t __MD5FdChunk_block_invoke_3(uint64_t a1, int a2, int a3, void *data, unint64_t len)
{
  if (len >> 31) {
    MD4FdChunk_cold_1();
  }
  CC_MD5_Update((CC_MD5_CTX *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), data, len);
  return 1LL;
}

_BYTE *MD5File(const char *a1, _BYTE *a2)
{
  return MD5FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *MD5FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = MD5FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *MD5Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return MD5End(&c, a3);
}

int SHA_Init(SHA_CTX *c)
{
  *(_OWORD *)&c->h0 = xmmword_188E3CC80;
  *(void *)&c->h4 = 3285377520LL;
  c->Nh = 0;
  c->num = 0;
  return 1;
}

int SHA_Update(SHA_CTX *c, const void *data, size_t len)
{
  if (!len) {
    return 1;
  }
  size_t v3 = len;
  *(void *)&c->Nl += 8 * len;
  uint64_t num = (int)c->num;
  if (!(_DWORD)num)
  {
    int v10 = c->data;
    if (len >= 0x40)
    {
      do
      {
        if (data != v10)
        {
          __int128 v11 = *(_OWORD *)data;
          __int128 v12 = *((_OWORD *)data + 1);
          __int128 v13 = *((_OWORD *)data + 3);
          *(_OWORD *)&c->data[8] = *((_OWORD *)data + 2);
          *(_OWORD *)&c->data[12] = v13;
          *(_OWORD *)int v10 = v11;
          *(_OWORD *)&c->data[4] = v12;
        }

        float32x4x4_t v28 = vld4q_f32((const float *)v10);
        v29.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v28.val[0]);
        v29.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v28.val[1]);
        v29.val[2] = (float32x4_t)vrev32q_s8((int8x16_t)v28.val[2]);
        v29.val[3] = (float32x4_t)vrev32q_s8((int8x16_t)v28.val[3]);
        vst4q_f32((float *)v10, v29);
        data = (char *)data + 64;
        sha_block(c, (int *)c->data);
        v3 -= 64LL;
      }

      while (v3 > 0x3F);
    }

    c->uint64_t num = v3;
    int v14 = v3 & 3;
    if (v3 >= 4)
    {
      size_t v15 = v3 >> 2;
      size_t v16 = v3 >> 2;
      off_t v17 = c->data;
      do
      {
        unsigned int v18 = *(_DWORD *)data;
        data = (char *)data + 4;
        *v17++ = bswap32(v18);
        --v16;
      }

      while (v16);
    }

    else
    {
      size_t v15 = 0LL;
    }

    unsigned int v19 = 0;
    BOOL v20 = (char *)data + (v3 & 3);
    if (v14 != 1)
    {
      if (v14 != 2)
      {
        if (v14 != 3)
        {
LABEL_19:
          v10[v15] = v19;
          return 1;
        }

        int v21 = *--v20;
        unsigned int v19 = v21 << 8;
      }

      int v22 = *--v20;
      v19 |= v22 << 16;
    }

    v19 |= *(v20 - 1) << 24;
    goto LABEL_19;
  }

  int v7 = c->data;
  int v8 = (int)num >> 2;
  uint64_t v9 = num & 3;
  if (num + len >= 0x40) {
    __asm { BR              X14 }
  }

  c->num += len;
  if (v9 + len > 3) {
    __asm { BR              X15 }
  }

  uint64_t v24 = v8;
  unsigned int v25 = v7[v8];
  if ((_DWORD)v9 == 2
    || ((_DWORD)v9 == 1
     || !(_DWORD)v9
     && (int v26 = *(unsigned __int8 *)data, data = (char *)data + 1, v25 = v26 << 24, v3 = len - 1, len != 1))
    && (int v27 = *(unsigned __int8 *)data, data = (char *)data + 1, v25 |= v27 << 16, v3 != 1))
  {
    v25 |= *(unsigned __int8 *)data << 8;
  }

  v7[v24] = v25;
  return 1;
}

void sub_188E3AD64(uint64_t a1@<X1>, int a2@<W8>)
{
  int v8 = *v5;
  int v7 = v5 + 1;
  int v9 = v8 << 24;
  int v10 = *v7++;
  int v11 = v9 | (v10 << 16);
  int v12 = *v7++;
  int v13 = v11 | (v12 << 8);
  int v15 = *v7;
  int v14 = (unsigned int *)(v7 + 1);
  *(_DWORD *)(a1 + 4 * v4) = v13 | v15;
  int v16 = v2 + 1;
  if (v16 >= a2)
  {
    a2 = v16;
  }

  else
  {
    off_t v17 = (_DWORD *)(v6 + 4 * v4 + 32);
    uint64_t v18 = ~v4 + a2;
    do
    {
      unsigned int v19 = *v14++;
      *v17++ = bswap32(v19);
      --v18;
    }

    while (v18);
  }

  if (!v3) {
LABEL_14:
  }
    JUMPOUT(0x188E3ACC4LL);
  int v20 = 0;
  int v21 = (char *)v14 + v3;
  if (v3 != 1)
  {
    if (v3 != 2)
    {
      if (v3 != 3)
      {
LABEL_13:
        *(_DWORD *)(a1 + 4LL * a2) = v20;
        goto LABEL_14;
      }

      int v22 = *--v21;
      int v20 = v22 << 8;
    }

    int v23 = *--v21;
    v20 |= v23 << 16;
  }

  v20 |= *(v21 - 1) << 24;
  goto LABEL_13;
}

_DWORD *sha_block(_DWORD *result, int *a2)
{
  HIDWORD(v3) = *result;
  LODWORD(v3) = *result;
  int v2 = v3 >> 27;
  int v4 = result[2];
  int v412 = result[1];
  int v413 = result[3];
  HIDWORD(v3) = v412;
  LODWORD(v3) = v412;
  int v5 = v3 >> 2;
  int v414 = result[4];
  int v7 = *a2;
  int v6 = a2[1];
  int v8 = v414 + *a2 + v2 + (v4 & v412 | v413 & ~v412) + 1518500249;
  HIDWORD(v3) = v8;
  LODWORD(v3) = v8;
  int v9 = v3 >> 27;
  int v411 = v4;
  unint64_t v10 = __PAIR64__(*result, __ROR4__(v412, 2));
  unsigned int v11 = v413 + v6 + (*result & v10 | v4 & ~*result) + 1518500249 + v9;
  LODWORD(v10) = *result;
  int v12 = v10 >> 2;
  HIDWORD(v10) = v11;
  LODWORD(v10) = v11;
  int v13 = v10 >> 27;
  unint64_t v14 = __PAIR64__(v8, __ROR4__(*result, 2));
  int v15 = a2[2];
  int v16 = a2[3];
  unsigned int v17 = v4 + v15 + (v8 & v14 | v5 & ~v8) + 1518500249 + v13;
  LODWORD(v14) = v8;
  int v18 = v14 >> 2;
  HIDWORD(v14) = v17;
  LODWORD(v14) = v17;
  int v19 = v14 >> 27;
  unint64_t v20 = __PAIR64__(v11, __ROR4__(v8, 2));
  unsigned int v21 = v5 + v16 + (v11 & v20 | v12 & ~v11) + 1518500249 + v19;
  LODWORD(v20) = v11;
  int v22 = v20 >> 2;
  HIDWORD(v20) = v21;
  LODWORD(v20) = v21;
  int v23 = v20 >> 27;
  unint64_t v24 = __PAIR64__(v17, __ROR4__(v11, 2));
  int v26 = a2[4];
  int v25 = a2[5];
  unsigned int v27 = v12 + v26 + (v17 & v24 | v18 & ~v17) + 1518500249 + v23;
  LODWORD(v24) = v17;
  int v28 = v24 >> 2;
  HIDWORD(v24) = v27;
  LODWORD(v24) = v27;
  int v29 = v24 >> 27;
  unint64_t v30 = __PAIR64__(v21, __ROR4__(v17, 2));
  unsigned int v31 = v18 + v25 + (v21 & v30 | v22 & ~v21) + 1518500249 + v29;
  LODWORD(v30) = v21;
  int v32 = v30 >> 2;
  HIDWORD(v30) = v31;
  LODWORD(v30) = v31;
  int v33 = v30 >> 27;
  unint64_t v34 = __PAIR64__(v27, __ROR4__(v21, 2));
  int v36 = a2[6];
  int v35 = a2[7];
  unsigned int v37 = v36 + v22 + (v27 & v34 | v28 & ~v27) + 1518500249 + v33;
  LODWORD(v34) = v27;
  int v38 = v34 >> 2;
  HIDWORD(v34) = v37;
  LODWORD(v34) = v37;
  int v39 = v34 >> 27;
  unint64_t v40 = __PAIR64__(v31, __ROR4__(v27, 2));
  unsigned int v41 = v35 + v28 + (v31 & v40 | v32 & ~v31) + 1518500249 + v39;
  LODWORD(v40) = v31;
  int v42 = v40 >> 2;
  HIDWORD(v40) = v41;
  LODWORD(v40) = v41;
  int v43 = v40 >> 27;
  unint64_t v44 = __PAIR64__(v37, __ROR4__(v31, 2));
  int v46 = a2[8];
  int v45 = a2[9];
  unsigned int v47 = v46 + v32 + (v37 & v44 | v38 & ~v37) + 1518500249 + v43;
  LODWORD(v44) = v37;
  int v48 = v44 >> 2;
  HIDWORD(v44) = v47;
  LODWORD(v44) = v47;
  int v49 = v44 >> 27;
  unint64_t v50 = __PAIR64__(v41, __ROR4__(v37, 2));
  unsigned int v51 = v45 + v38 + (v41 & v50 | v42 & ~v41) + 1518500249 + v49;
  LODWORD(v50) = v41;
  int v52 = v50 >> 2;
  HIDWORD(v50) = v51;
  LODWORD(v50) = v51;
  int v53 = v50 >> 27;
  unint64_t v54 = __PAIR64__(v47, __ROR4__(v41, 2));
  int v56 = a2[10];
  int v55 = a2[11];
  unsigned int v57 = v56 + v42 + (v47 & v54 | v48 & ~v47) + 1518500249 + v53;
  LODWORD(v54) = v47;
  int v58 = v54 >> 2;
  HIDWORD(v54) = v57;
  LODWORD(v54) = v57;
  int v59 = v54 >> 27;
  unint64_t v60 = __PAIR64__(v51, __ROR4__(v47, 2));
  unsigned int v61 = v55 + v48 + (v51 & v60 | v52 & ~v51) + 1518500249 + v59;
  LODWORD(v60) = v51;
  int v62 = v60 >> 2;
  HIDWORD(v60) = v61;
  LODWORD(v60) = v61;
  int v63 = v60 >> 27;
  unint64_t v64 = __PAIR64__(v57, __ROR4__(v51, 2));
  int v65 = a2[12];
  int v66 = a2[13];
  unsigned int v67 = v65 + v52 + (v57 & v64 | v58 & ~v57) + 1518500249 + v63;
  LODWORD(v64) = v57;
  int v68 = v64 >> 2;
  HIDWORD(v64) = v67;
  LODWORD(v64) = v67;
  int v69 = v64 >> 27;
  unint64_t v70 = __PAIR64__(v61, __ROR4__(v57, 2));
  unsigned int v71 = v66 + v58 + (v61 & v70 | v62 & ~v61) + 1518500249 + v69;
  LODWORD(v70) = v61;
  int v72 = v70 >> 2;
  HIDWORD(v70) = v71;
  LODWORD(v70) = v71;
  int v73 = v70 >> 27;
  unint64_t v74 = __PAIR64__(v67, __ROR4__(v61, 2));
  int v75 = a2[14];
  int v76 = a2[15];
  unsigned int v77 = v75 + v62 + (v67 & v74 | v68 & ~v67) + 1518500249 + v73;
  LODWORD(v74) = v67;
  int v78 = v74 >> 2;
  HIDWORD(v74) = v77;
  LODWORD(v74) = v77;
  int v79 = v74 >> 27;
  unint64_t v80 = __PAIR64__(v71, __ROR4__(v67, 2));
  unsigned int v81 = v76 + v68 + (v71 & v80 | v72 & ~v71) + 1518500249 + v79;
  LODWORD(v80) = v71;
  int v82 = v80 >> 2;
  int v83 = v15 ^ v7 ^ v46 ^ v66;
  HIDWORD(v80) = v81;
  LODWORD(v80) = v81;
  int v84 = v80 >> 27;
  unint64_t v85 = __PAIR64__(v77, __ROR4__(v71, 2));
  int v86 = v83 + v72 + (v77 & v85 | v78 & ~v77) + 1518500249;
  LODWORD(v85) = v77;
  int v87 = v85 >> 2;
  unsigned int v88 = v86 + v84;
  int v89 = v16 ^ v6 ^ v45 ^ v75;
  HIDWORD(v85) = v88;
  LODWORD(v85) = v88;
  int v90 = v85 >> 27;
  unint64_t v91 = __PAIR64__(v81, __ROR4__(v77, 2));
  int v92 = v89 + v78 + (v81 & v91 | v82 & ~v81) + 1518500249 + v90;
  LODWORD(v91) = v81;
  int v93 = v91 >> 2;
  int v94 = v26 ^ v15 ^ v56 ^ v76;
  HIDWORD(v91) = v92;
  LODWORD(v91) = v92;
  int v95 = v91 >> 27;
  unint64_t v96 = __PAIR64__(v88, __ROR4__(v81, 2));
  unsigned int v97 = v94 + v82 + (v88 & v96 | v87 & ~v88) + 1518500249 + v95;
  LODWORD(v96) = v88;
  int v98 = v96 >> 2;
  unint64_t v99 = __PAIR64__(v97, __ROR4__(v88, 2));
  int v100 = v92 & v99 | v93 & ~v92;
  LODWORD(v99) = v97;
  int v101 = v99 >> 27;
  int v102 = v25 ^ v16 ^ v55 ^ v83;
  int v103 = v102 + v87 + v100 + 1518500249;
  HIDWORD(v99) = v92;
  LODWORD(v99) = v92;
  int v104 = v99 >> 2;
  unsigned int v105 = v103 + v101;
  int v106 = v36 ^ v26 ^ v65 ^ v89;
  HIDWORD(v99) = v105;
  LODWORD(v99) = v105;
  int v107 = v99 >> 27;
  unint64_t v108 = __PAIR64__(v97, __ROR4__(v88, 2));
  unsigned int v109 = v106 + v93 + (v104 ^ v108 ^ v97) + 1859775393 + v107;
  LODWORD(v108) = v97;
  int v110 = v108 >> 2;
  int v111 = v35 ^ v25 ^ v66 ^ v94;
  HIDWORD(v108) = v109;
  LODWORD(v108) = v109;
  int v112 = v108 >> 27;
  unint64_t v113 = __PAIR64__(v105, __ROR4__(v92, 2));
  unsigned int v114 = v111 + v98 + (v110 ^ v113 ^ v105) + 1859775393 + v112;
  LODWORD(v113) = v105;
  int v115 = v113 >> 2;
  int v116 = v46 ^ v36 ^ v75 ^ v102;
  HIDWORD(v113) = v114;
  LODWORD(v113) = v114;
  int v117 = v113 >> 27;
  unint64_t v118 = __PAIR64__(v109, __ROR4__(v97, 2));
  unsigned int v119 = v116 + v104 + (v115 ^ v118 ^ v109) + 1859775393 + v117;
  LODWORD(v118) = v109;
  int v120 = v118 >> 2;
  int v121 = v45 ^ v35 ^ v76 ^ v106;
  HIDWORD(v118) = v119;
  LODWORD(v118) = v119;
  int v122 = v118 >> 27;
  unint64_t v123 = __PAIR64__(v114, __ROR4__(v105, 2));
  unsigned int v124 = v121 + v110 + (v120 ^ v123 ^ v114) + 1859775393 + v122;
  LODWORD(v123) = v114;
  int v125 = v123 >> 2;
  int v126 = v56 ^ v46 ^ v83 ^ v111;
  HIDWORD(v123) = v124;
  LODWORD(v123) = v124;
  int v127 = v123 >> 27;
  unint64_t v128 = __PAIR64__(v119, __ROR4__(v109, 2));
  int v129 = v126 + v115 + (v125 ^ v128 ^ v119) + 1859775393;
  LODWORD(v128) = v119;
  int v130 = v128 >> 2;
  unsigned int v131 = v129 + v127;
  int v132 = v55 ^ v45 ^ v89 ^ v116;
  HIDWORD(v128) = v131;
  LODWORD(v128) = v131;
  int v133 = v128 >> 27;
  unint64_t v134 = __PAIR64__(v124, __ROR4__(v114, 2));
  unsigned int v135 = v132 + v120 + (v130 ^ v134 ^ v124) + 1859775393 + v133;
  LODWORD(v134) = v124;
  int v136 = v134 >> 2;
  int v137 = v65 ^ v56 ^ v94;
  HIDWORD(v134) = v135;
  LODWORD(v134) = v135;
  int v138 = v134 >> 27;
  int v139 = v137 ^ v121;
  unint64_t v140 = __PAIR64__(v131, __ROR4__(v119, 2));
  unsigned int v141 = (v137 ^ v121) + v125 + (v136 ^ v140 ^ v131) + 1859775393 + v138;
  LODWORD(v140) = v131;
  int v142 = v140 >> 2;
  int v143 = v66 ^ v55 ^ v102 ^ v126;
  HIDWORD(v140) = v141;
  LODWORD(v140) = v141;
  int v144 = v140 >> 27;
  unint64_t v145 = __PAIR64__(v135, __ROR4__(v124, 2));
  unsigned int v146 = v143 + v130 + (v142 ^ v145 ^ v135) + 1859775393 + v144;
  LODWORD(v145) = v135;
  int v147 = v145 >> 2;
  int v148 = v75 ^ v65 ^ v106 ^ v132;
  HIDWORD(v145) = v146;
  LODWORD(v145) = v146;
  int v149 = v145 >> 27;
  unint64_t v150 = __PAIR64__(v141, __ROR4__(v131, 2));
  unsigned int v151 = v148 + v136 + (v147 ^ v150 ^ v141) + 1859775393 + v149;
  LODWORD(v150) = v141;
  int v152 = v150 >> 2;
  int v153 = v76 ^ v66 ^ v111 ^ v139;
  HIDWORD(v150) = v151;
  LODWORD(v150) = v151;
  int v154 = v150 >> 27;
  unint64_t v155 = __PAIR64__(v146, __ROR4__(v135, 2));
  unsigned int v156 = v153 + v142 + (v152 ^ v155 ^ v146) + 1859775393 + v154;
  LODWORD(v155) = v146;
  int v157 = v155 >> 2;
  int v158 = v75 ^ v83 ^ v116 ^ v143;
  HIDWORD(v155) = v156;
  LODWORD(v155) = v156;
  int v159 = v155 >> 27;
  unint64_t v160 = __PAIR64__(v151, __ROR4__(v141, 2));
  int v161 = v158 + v147 + (v157 ^ v160 ^ v151) + 1859775393;
  LODWORD(v160) = v151;
  int v162 = v160 >> 2;
  unsigned int v163 = v161 + v159;
  int v164 = v76 ^ v89 ^ v121 ^ v148;
  HIDWORD(v160) = v163;
  LODWORD(v160) = v163;
  int v165 = v160 >> 27;
  unint64_t v166 = __PAIR64__(v156, __ROR4__(v146, 2));
  unsigned int v167 = v164 + v152 + (v162 ^ v166 ^ v156) + 1859775393 + v165;
  LODWORD(v166) = v156;
  int v168 = v166 >> 2;
  HIDWORD(v166) = v167;
  LODWORD(v166) = v167;
  int v169 = v166 >> 27;
  int v170 = v94 ^ v83 ^ v126 ^ v153;
  unint64_t v171 = __PAIR64__(v163, __ROR4__(v151, 2));
  unsigned int v172 = v170 + v157 + (v168 ^ v171 ^ v163) + 1859775393 + v169;
  LODWORD(v171) = v163;
  int v173 = v171 >> 2;
  int v174 = v89 ^ v102 ^ v132 ^ v158;
  HIDWORD(v171) = v172;
  LODWORD(v171) = v172;
  int v175 = v171 >> 27;
  unint64_t v176 = __PAIR64__(v167, __ROR4__(v156, 2));
  unsigned int v177 = v174 + v162 + (v173 ^ v176 ^ v167) + 1859775393 + v175;
  LODWORD(v176) = v167;
  int v178 = v176 >> 2;
  int v179 = v94 ^ v106 ^ v139 ^ v164;
  HIDWORD(v176) = v177;
  LODWORD(v176) = v177;
  int v180 = v176 >> 27;
  unint64_t v181 = __PAIR64__(v172, __ROR4__(v163, 2));
  unsigned int v182 = v179 + v168 + (v178 ^ v181 ^ v172) + 1859775393 + v180;
  LODWORD(v181) = v172;
  int v183 = v181 >> 2;
  int v184 = v111 ^ v102 ^ v143 ^ v170;
  HIDWORD(v181) = v182;
  LODWORD(v181) = v182;
  int v185 = v181 >> 27;
  unint64_t v186 = __PAIR64__(v177, __ROR4__(v167, 2));
  unsigned int v187 = v184 + v173 + (v183 ^ v186 ^ v177) + 1859775393 + v185;
  LODWORD(v186) = v177;
  int v188 = v186 >> 2;
  int v189 = v106 ^ v116 ^ v148 ^ v174;
  HIDWORD(v186) = v187;
  LODWORD(v186) = v187;
  int v190 = v186 >> 27;
  unint64_t v191 = __PAIR64__(v182, __ROR4__(v172, 2));
  int v192 = v189 + v178 + (v188 ^ v191 ^ v182) + 1859775393;
  LODWORD(v191) = v182;
  int v193 = v191 >> 2;
  unsigned int v194 = v192 + v190;
  int v195 = v111 ^ v121 ^ v153 ^ v179;
  HIDWORD(v191) = v194;
  LODWORD(v191) = v194;
  int v196 = v191 >> 27;
  unint64_t v197 = __PAIR64__(v187, __ROR4__(v177, 2));
  unsigned int v198 = v195 + v183 + (v193 ^ v197 ^ v187) + 1859775393 + v196;
  LODWORD(v197) = v187;
  int v199 = v197 >> 2;
  HIDWORD(v197) = v198;
  LODWORD(v197) = v198;
  int v200 = v197 >> 27;
  int v201 = v126 ^ v116 ^ v158 ^ v184;
  unint64_t v202 = __PAIR64__(v194, __ROR4__(v182, 2));
  unsigned int v203 = v201 + v188 + (v199 ^ v202 ^ v194) + 1859775393 + v200;
  LODWORD(v202) = v194;
  int v204 = v202 >> 2;
  int v205 = v121 ^ v132 ^ v164 ^ v189;
  HIDWORD(v202) = v203;
  LODWORD(v202) = v203;
  int v206 = v202 >> 27;
  unint64_t v207 = __PAIR64__(v198, __ROR4__(v187, 2));
  int v208 = v205 + v193 + (v204 ^ v207 ^ v198) + 1859775393 + v206;
  LODWORD(v207) = v198;
  int v209 = v207 >> 2;
  int v210 = v126 ^ v139 ^ v170 ^ v195;
  HIDWORD(v207) = v208;
  LODWORD(v207) = v208;
  int v211 = v207 >> 27;
  unint64_t v212 = __PAIR64__(v203, __ROR4__(v198, 2));
  unsigned int v213 = v210 + v199 + ((v203 | __ROR4__(v198, 2)) & __ROR4__(v194, 2) | v203 & v212) + v211 - 1894007588;
  LODWORD(v212) = v203;
  int v214 = v212 >> 2;
  int v215 = v143 ^ v132 ^ v174 ^ v201;
  unint64_t v216 = __PAIR64__(v213, __ROR4__(v203, 2));
  int v217 = (v208 | __ROR4__(v203, 2)) & __ROR4__(v198, 2) | v208 & v216;
  LODWORD(v216) = v213;
  unsigned int v218 = v215 + v204 + v217 + (v216 >> 27) - 1894007588;
  HIDWORD(v216) = v208;
  LODWORD(v216) = v208;
  int v219 = v216 >> 2;
  int v220 = v139 ^ v148 ^ v179 ^ v205;
  unint64_t v221 = __PAIR64__(v218, __ROR4__(v208, 2));
  int v222 = (v213 | __ROR4__(v208, 2)) & __ROR4__(v203, 2) | v213 & v221;
  LODWORD(v221) = v218;
  unsigned int v223 = v220 + v209 + v222 + (v221 >> 27) - 1894007588;
  HIDWORD(v221) = v213;
  LODWORD(v221) = v213;
  int v224 = v221 >> 2;
  int v225 = v143 ^ v153 ^ v184 ^ v210;
  unint64_t v226 = __PAIR64__(v223, __ROR4__(v213, 2));
  int v227 = (v218 | __ROR4__(v213, 2)) & __ROR4__(v208, 2) | v218 & v226;
  LODWORD(v226) = v223;
  unsigned int v228 = v225 + v214 + v227 + (v226 >> 27) - 1894007588;
  HIDWORD(v226) = v218;
  LODWORD(v226) = v218;
  int v229 = v226 >> 2;
  int v230 = v158 ^ v148 ^ v189 ^ v215;
  unint64_t v231 = __PAIR64__(v228, __ROR4__(v218, 2));
  int v232 = (v223 | __ROR4__(v218, 2)) & __ROR4__(v213, 2) | v223 & v231;
  LODWORD(v231) = v228;
  unsigned int v233 = v230 + v219 + v232 + (v231 >> 27) - 1894007588;
  HIDWORD(v231) = v223;
  LODWORD(v231) = v223;
  int v234 = v231 >> 2;
  int v235 = v153 ^ v164 ^ v195 ^ v220;
  unint64_t v236 = __PAIR64__(v233, __ROR4__(v223, 2));
  int v237 = (v228 | __ROR4__(v223, 2)) & __ROR4__(v218, 2) | v228 & v236;
  LODWORD(v236) = v233;
  unsigned int v238 = v235 + v224 + v237 + (v236 >> 27) - 1894007588;
  HIDWORD(v236) = v228;
  LODWORD(v236) = v228;
  int v239 = v236 >> 2;
  int v240 = v158 ^ v170 ^ v201 ^ v225;
  unint64_t v241 = __PAIR64__(v238, __ROR4__(v228, 2));
  int v242 = (v233 | __ROR4__(v228, 2)) & __ROR4__(v223, 2) | v233 & v241;
  LODWORD(v241) = v238;
  unsigned int v243 = v240 + v229 + v242 + (v241 >> 27) - 1894007588;
  HIDWORD(v241) = v233;
  LODWORD(v241) = v233;
  int v244 = v241 >> 2;
  int v245 = v174 ^ v164 ^ v205 ^ v230;
  unint64_t v246 = __PAIR64__(v243, __ROR4__(v233, 2));
  int v247 = (v238 | __ROR4__(v233, 2)) & __ROR4__(v228, 2) | v238 & v246;
  LODWORD(v246) = v243;
  unsigned int v248 = v245 + v234 + v247 + (v246 >> 27) - 1894007588;
  HIDWORD(v246) = v238;
  LODWORD(v246) = v238;
  int v249 = v246 >> 2;
  int v250 = v170 ^ v179 ^ v210 ^ v235;
  unint64_t v251 = __PAIR64__(v248, __ROR4__(v238, 2));
  int v252 = (v243 | __ROR4__(v238, 2)) & __ROR4__(v233, 2) | v243 & v251;
  LODWORD(v251) = v248;
  unsigned int v253 = v250 + v239 + v252 + (v251 >> 27) - 1894007588;
  HIDWORD(v251) = v243;
  LODWORD(v251) = v243;
  int v254 = v251 >> 2;
  int v255 = v174 ^ v184 ^ v215 ^ v240;
  unint64_t v256 = __PAIR64__(v253, __ROR4__(v243, 2));
  int v257 = (v248 | __ROR4__(v243, 2)) & __ROR4__(v238, 2) | v248 & v256;
  LODWORD(v256) = v253;
  unsigned int v258 = v255 + v244 + v257 + (v256 >> 27) - 1894007588;
  HIDWORD(v256) = v248;
  LODWORD(v256) = v248;
  int v259 = v256 >> 2;
  int v260 = v189 ^ v179 ^ v220 ^ v245;
  unint64_t v261 = __PAIR64__(v258, __ROR4__(v248, 2));
  int v262 = (v253 | __ROR4__(v248, 2)) & __ROR4__(v243, 2) | v253 & v261;
  LODWORD(v261) = v258;
  unsigned int v263 = v260 + v249 + v262 + (v261 >> 27) - 1894007588;
  HIDWORD(v261) = v253;
  LODWORD(v261) = v253;
  int v264 = v261 >> 2;
  int v265 = v184 ^ v195 ^ v225 ^ v250;
  unint64_t v266 = __PAIR64__(v263, __ROR4__(v253, 2));
  int v267 = (v258 | __ROR4__(v253, 2)) & __ROR4__(v248, 2) | v258 & v266;
  LODWORD(v266) = v263;
  unsigned int v268 = v265 + v254 + v267 + (v266 >> 27) - 1894007588;
  HIDWORD(v266) = v258;
  LODWORD(v266) = v258;
  int v269 = v266 >> 2;
  int v270 = v189 ^ v201 ^ v230 ^ v255;
  unint64_t v271 = __PAIR64__(v268, __ROR4__(v258, 2));
  int v272 = (v263 | __ROR4__(v258, 2)) & __ROR4__(v253, 2) | v263 & v271;
  LODWORD(v271) = v268;
  unsigned int v273 = v270 + v259 + v272 + (v271 >> 27) - 1894007588;
  HIDWORD(v271) = v263;
  LODWORD(v271) = v263;
  int v274 = v271 >> 2;
  int v275 = v205 ^ v195 ^ v235 ^ v260;
  unint64_t v276 = __PAIR64__(v273, __ROR4__(v263, 2));
  int v277 = (v268 | __ROR4__(v263, 2)) & __ROR4__(v258, 2) | v268 & v276;
  LODWORD(v276) = v273;
  unsigned int v278 = v275 + v264 + v277 + (v276 >> 27) - 1894007588;
  HIDWORD(v276) = v268;
  LODWORD(v276) = v268;
  int v279 = v276 >> 2;
  int v280 = v201 ^ v210 ^ v240 ^ v265;
  unint64_t v281 = __PAIR64__(v278, __ROR4__(v268, 2));
  int v282 = (v273 | __ROR4__(v268, 2)) & __ROR4__(v263, 2) | v273 & v281;
  LODWORD(v281) = v278;
  unsigned int v283 = v280 + v269 + v282 + (v281 >> 27) - 1894007588;
  HIDWORD(v281) = v273;
  LODWORD(v281) = v273;
  int v284 = v281 >> 2;
  int v285 = v205 ^ v215 ^ v245 ^ v270;
  unint64_t v286 = __PAIR64__(v283, __ROR4__(v273, 2));
  int v287 = (v278 | __ROR4__(v273, 2)) & __ROR4__(v268, 2) | v278 & v286;
  LODWORD(v286) = v283;
  unsigned int v288 = v285 + v274 + v287 + (v286 >> 27) - 1894007588;
  HIDWORD(v286) = v278;
  LODWORD(v286) = v278;
  int v289 = v286 >> 2;
  int v290 = v220 ^ v210 ^ v250 ^ v275;
  unint64_t v291 = __PAIR64__(v288, __ROR4__(v278, 2));
  int v292 = (v283 | __ROR4__(v278, 2)) & __ROR4__(v273, 2) | v283 & v291;
  LODWORD(v291) = v288;
  unsigned int v293 = v290 + v279 + v292 + (v291 >> 27) - 1894007588;
  HIDWORD(v291) = v283;
  LODWORD(v291) = v283;
  int v294 = v291 >> 2;
  int v295 = v215 ^ v225 ^ v255 ^ v280;
  unint64_t v296 = __PAIR64__(v293, __ROR4__(v283, 2));
  int v297 = (v288 | __ROR4__(v283, 2)) & __ROR4__(v278, 2) | v288 & v296;
  LODWORD(v296) = v293;
  unsigned int v298 = v295 + v284 + v297 + (v296 >> 27) - 1894007588;
  HIDWORD(v296) = v288;
  LODWORD(v296) = v288;
  int v299 = v296 >> 2;
  int v300 = v220 ^ v230 ^ v260 ^ v285;
  unint64_t v301 = __PAIR64__(v298, __ROR4__(v288, 2));
  int v302 = (v293 | __ROR4__(v288, 2)) & __ROR4__(v283, 2) | v293 & v301;
  LODWORD(v301) = v298;
  unsigned int v303 = v300 + v289 + v302 + (v301 >> 27) - 1894007588;
  HIDWORD(v301) = v293;
  LODWORD(v301) = v293;
  int v304 = v301 >> 2;
  int v305 = v235 ^ v225 ^ v265 ^ v290;
  unint64_t v306 = __PAIR64__(v303, __ROR4__(v293, 2));
  int v307 = (v298 | __ROR4__(v293, 2)) & __ROR4__(v288, 2) | v298 & v306;
  LODWORD(v306) = v303;
  unsigned int v308 = v305 + v294 + v307 + (v306 >> 27) - 1894007588;
  HIDWORD(v306) = v298;
  LODWORD(v306) = v298;
  int v309 = v306 >> 2;
  int v310 = v230 ^ v240 ^ v270 ^ v295;
  HIDWORD(v306) = v308;
  LODWORD(v306) = v308;
  int v311 = v306 >> 27;
  unint64_t v312 = __PAIR64__(v303, __ROR4__(v293, 2));
  int v313 = v310 + v299 + (v309 ^ v312 ^ v303) - 899497514;
  LODWORD(v312) = v303;
  int v314 = v312 >> 2;
  unsigned int v315 = v313 + v311;
  int v316 = v235 ^ v245 ^ v275 ^ v300;
  HIDWORD(v312) = v315;
  LODWORD(v312) = v315;
  int v317 = v312 >> 27;
  unint64_t v318 = __PAIR64__(v308, __ROR4__(v298, 2));
  unsigned int v319 = v316 + v304 + (v314 ^ v318 ^ v308) - 899497514 + v317;
  LODWORD(v318) = v308;
  int v320 = v318 >> 2;
  HIDWORD(v318) = v319;
  LODWORD(v318) = v319;
  int v321 = v318 >> 27;
  int v322 = v250 ^ v240 ^ v280 ^ v305;
  unint64_t v323 = __PAIR64__(v315, __ROR4__(v303, 2));
  unsigned int v324 = v322 + v309 + (v320 ^ v323 ^ v315) - 899497514 + v321;
  LODWORD(v323) = v315;
  int v325 = v323 >> 2;
  int v326 = v245 ^ v255 ^ v285 ^ v310;
  HIDWORD(v323) = v324;
  LODWORD(v323) = v324;
  int v327 = v323 >> 27;
  unint64_t v328 = __PAIR64__(v319, __ROR4__(v308, 2));
  unsigned int v329 = v326 + v314 + (v325 ^ v328 ^ v319) - 899497514 + v327;
  LODWORD(v328) = v319;
  int v330 = v328 >> 2;
  int v331 = v250 ^ v260 ^ v290 ^ v316;
  HIDWORD(v328) = v329;
  LODWORD(v328) = v329;
  int v332 = v328 >> 27;
  unint64_t v333 = __PAIR64__(v324, __ROR4__(v315, 2));
  unsigned int v334 = v331 + v320 + (v330 ^ v333 ^ v324) - 899497514 + v332;
  LODWORD(v333) = v324;
  int v335 = v333 >> 2;
  int v336 = v265 ^ v255 ^ v295 ^ v322;
  HIDWORD(v333) = v334;
  LODWORD(v333) = v334;
  int v337 = v333 >> 27;
  unint64_t v338 = __PAIR64__(v329, __ROR4__(v319, 2));
  unsigned int v339 = v336 + v325 + (v335 ^ v338 ^ v329) - 899497514 + v337;
  LODWORD(v338) = v329;
  int v340 = v338 >> 2;
  int v341 = v260 ^ v270 ^ v300 ^ v326;
  HIDWORD(v338) = v339;
  LODWORD(v338) = v339;
  int v342 = v338 >> 27;
  unint64_t v343 = __PAIR64__(v334, __ROR4__(v324, 2));
  int v344 = v341 + v330 + (v340 ^ v343 ^ v334) - 899497514;
  LODWORD(v343) = v334;
  int v345 = v343 >> 2;
  unsigned int v346 = v344 + v342;
  int v347 = v265 ^ v275 ^ v305 ^ v331;
  HIDWORD(v343) = v346;
  LODWORD(v343) = v346;
  int v348 = v343 >> 27;
  unint64_t v349 = __PAIR64__(v339, __ROR4__(v329, 2));
  unsigned int v350 = v347 + v335 + (v345 ^ v349 ^ v339) - 899497514 + v348;
  LODWORD(v349) = v339;
  int v351 = v349 >> 2;
  HIDWORD(v349) = v350;
  LODWORD(v349) = v350;
  int v352 = v349 >> 27;
  int v353 = v280 ^ v270 ^ v310 ^ v336;
  unint64_t v354 = __PAIR64__(v346, __ROR4__(v334, 2));
  unsigned int v355 = v353 + v340 + (v351 ^ v354 ^ v346) - 899497514 + v352;
  LODWORD(v354) = v346;
  int v356 = v354 >> 2;
  int v357 = v275 ^ v285 ^ v316 ^ v341;
  HIDWORD(v354) = v355;
  LODWORD(v354) = v355;
  int v358 = v354 >> 27;
  unint64_t v359 = __PAIR64__(v350, __ROR4__(v339, 2));
  unsigned int v360 = v357 + v345 + (v356 ^ v359 ^ v350) - 899497514 + v358;
  LODWORD(v359) = v350;
  int v361 = v359 >> 2;
  int v362 = v280 ^ v290 ^ v322 ^ v347;
  HIDWORD(v359) = v360;
  LODWORD(v359) = v360;
  int v363 = v359 >> 27;
  unint64_t v364 = __PAIR64__(v355, __ROR4__(v346, 2));
  unsigned int v365 = v362 + v351 + (v361 ^ v364 ^ v355) - 899497514 + v363;
  LODWORD(v364) = v355;
  int v366 = v364 >> 2;
  int v367 = v295 ^ v285 ^ v326 ^ v353;
  HIDWORD(v364) = v365;
  LODWORD(v364) = v365;
  int v368 = v364 >> 27;
  unint64_t v369 = __PAIR64__(v360, __ROR4__(v350, 2));
  int v370 = v367 + v356 + (v366 ^ v369 ^ v360) - 899497514 + v368;
  LODWORD(v369) = v360;
  int v371 = v369 >> 2;
  int v372 = v290 ^ v300 ^ v331 ^ v357;
  HIDWORD(v369) = v370;
  LODWORD(v369) = v370;
  int v373 = v369 >> 27;
  unint64_t v374 = __PAIR64__(v365, __ROR4__(v355, 2));
  int v375 = v372 + v361 + (v371 ^ v374 ^ v365) - 899497514;
  LODWORD(v374) = v365;
  int v376 = v374 >> 2;
  unsigned int v377 = v375 + v373;
  int v378 = v295 ^ v305 ^ v336 ^ v362;
  unint64_t v379 = __PAIR64__(v377, __ROR4__(v360, 2));
  int v380 = v378 + v366 + (v376 ^ v379 ^ v370);
  LODWORD(v379) = v377;
  unsigned int v381 = v380 - 899497514 + (v379 >> 27);
  int v382 = v310 ^ v300 ^ v341;
  HIDWORD(v379) = v370;
  LODWORD(v379) = v370;
  int v383 = v379 >> 2;
  int v384 = v382 ^ v367;
  unint64_t v385 = __PAIR64__(v381, __ROR4__(v365, 2));
  int v386 = v384 + v371 + (v383 ^ v385 ^ v377);
  LODWORD(v385) = v381;
  unsigned int v387 = v386 - 899497514 + (v385 >> 27);
  int v388 = v305 ^ v316 ^ v347 ^ v372;
  HIDWORD(v385) = v377;
  LODWORD(v385) = v377;
  int v389 = v385 >> 2;
  unint64_t v390 = __PAIR64__(v387, __ROR4__(v370, 2));
  int v391 = v388 + v376 + (v389 ^ v390 ^ v381);
  LODWORD(v390) = v387;
  int v392 = v391 - 899497514 + (v390 >> 27);
  int v393 = v310 ^ v322 ^ v353;
  HIDWORD(v390) = v381;
  LODWORD(v390) = v381;
  int v394 = v390 >> 2;
  int v395 = v393 ^ v378;
  HIDWORD(v390) = v392;
  LODWORD(v390) = v392;
  int v396 = v390 >> 27;
  unint64_t v397 = __PAIR64__(v387, __ROR4__(v377, 2));
  unsigned int v398 = v395 + v383 + (v394 ^ v397 ^ v387) - 899497514 + v396;
  int v399 = (v326 ^ v316 ^ v357 ^ v384) + v389;
  LODWORD(v397) = v387;
  int v400 = v397 >> 2;
  unint64_t v401 = __PAIR64__(v398, __ROR4__(v381, 2));
  int v402 = v399 + (v400 ^ v401 ^ v392);
  LODWORD(v401) = v398;
  unsigned int v403 = v402 - 899497514 + (v401 >> 27);
  HIDWORD(v401) = v392;
  LODWORD(v401) = v392;
  int v404 = v401 >> 2;
  unint64_t v405 = __PAIR64__(v403, __ROR4__(v387, 2));
  int v406 = (v322 ^ v331 ^ v362 ^ v388) + v394 + (v404 ^ v405 ^ v398);
  LODWORD(v405) = v403;
  unsigned int v407 = v406 - 899497514 + (v405 >> 27);
  HIDWORD(v405) = v398;
  LODWORD(v405) = v398;
  int v408 = v405 >> 2;
  unint64_t v409 = __PAIR64__(v407, __ROR4__(v392, 2));
  int v410 = *result + (v326 ^ v336 ^ v367 ^ v395) + v400 + (v408 ^ v409 ^ v403) - 899497514;
  LODWORD(v409) = v407;
  *result = v410 + (v409 >> 27);
  result[1] = v407 + v412;
  HIDWORD(v409) = v403;
  LODWORD(v409) = v403;
  result[2] = (v409 >> 2) + v411;
  result[3] = v408 + v413;
  result[4] = v404 + v414;
  return result;
}

int SHA_Final(unsigned __int8 *md, SHA_CTX *c)
{
  __asm { BR              X14 }

  return result;
}

uint64_t sub_188E3BD14@<X0>( uint64_t a1@<X8>, uint64_t a2, char __s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v12[a1] = 0x80000000;
  int v13 = a1 + 1;
  if (*(int *)(v11 + 92) >= 56)
  {
    if (v9 <= 59)
    {
      if (v13 <= 15) {
        int v14 = 15;
      }
      else {
        int v14 = a1 + 1;
      }
      bzero((void *)(v11 + 4 * a1 + 32), 4LL * (v14 + ~(_DWORD)a1) + 4);
    }

    sha_block((_DWORD *)v11, v12);
    int v13 = 0;
    goto LABEL_9;
  }

  if (v9 <= 51) {
LABEL_9:
  }
    bzero((void *)(v11 + 4LL * v13 + 28), 4LL * (13 - v13) + 4);
  *(int32x2_t *)(v11 + 84) = vrev64_s32(*(int32x2_t *)(v11 + 20));
  sha_block((_DWORD *)v11, v12);
  _DWORD *v10 = bswap32(*(_DWORD *)v11);
  v10[1] = bswap32(*(_DWORD *)(v11 + 4));
  v10[2] = bswap32(*(_DWORD *)(v11 + 8));
  v10[3] = bswap32(*(_DWORD *)(v11 + 12));
  v10[4] = bswap32(*(_DWORD *)(v11 + 16));
  memset_s(&v16, 8uLL, 0, 8uLL);
  return 1LL;
}

_BYTE *SHA256_End(CC_SHA256_CTX *c, _BYTE *a2)
{
  int v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (int v2 = malloc(0x41uLL)) != 0LL)
  {
    int v4 = md;
    CC_SHA256_Final(md, c);
    for (uint64_t i = 0LL; i != 64; i += 2LL)
    {
      unsigned int v6 = *v4++;
      int v7 = &v2[i];
      _BYTE *v7 = SHA256_End_hex[(unint64_t)v6 >> 4];
      v7[1] = SHA256_End_hex[v6 & 0xF];
    }

    v2[64] = 0;
  }

  return v2;
}

_BYTE *SHA256_Fd(int a1, _BYTE *a2)
{
  return SHA256_FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA256_FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  int v38 = &v37;
  uint64_t v39 = 0x8000000000LL;
  uint64_t v33 = 0LL;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  unint64_t v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    unint64_t v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_SHA256_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      unint64_t v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_5);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_5));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      int v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      int v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __SHA256_FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30CAF0;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      uint64_t v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __SHA256_FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30CB40;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        unint64_t v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        unint64_t v24 = SHA256_End((CC_SHA256_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

_BYTE *SHA256_File(const char *a1, _BYTE *a2)
{
  return SHA256_FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA256_FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = SHA256_FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *SHA256_Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return SHA256_End(&c, a3);
}

_BYTE *SHA512_End(CC_SHA512_CTX *c, _BYTE *a2)
{
  int v2 = a2;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a2 || (int v2 = malloc(0x81uLL)) != 0LL)
  {
    int v4 = md;
    CC_SHA512_Final(md, c);
    for (uint64_t i = 0LL; i != 128; i += 2LL)
    {
      unsigned int v6 = *v4++;
      int v7 = &v2[i];
      _BYTE *v7 = SHA512_End_hex[(unint64_t)v6 >> 4];
      v7[1] = SHA512_End_hex[v6 & 0xF];
    }

    v2[128] = 0;
  }

  return v2;
}

_BYTE *SHA512_Fd(int a1, _BYTE *a2)
{
  return SHA512_FdChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA512_FdChunk(int a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v37 = 0LL;
  int v38 = &v37;
  uint64_t v39 = 0xE800000000LL;
  uint64_t v33 = 0LL;
  unint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  int v36 = 0;
  uint64_t v29 = 0LL;
  unint64_t v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 0;
  if (a4 < 0)
  {
    unint64_t v24 = 0LL;
    *__error() = 22;
  }

  else
  {
    CC_SHA512_Init(&v40);
    if (a3 && ((*__error() = 0, lseek(a1, a3, 0) != a3) || a3 == -1 && *__error()))
    {
      unint64_t v24 = 0LL;
    }

    else
    {
      int v8 = fcntl(a1, 3);
      if ((v8 & 0x40000) == 0) {
        fcntl(a1, 48, 1LL);
      }
      do
        unint64_t v9 = __ldaxr(&dispatch_queue_serial_6);
      while (__stlxr(v9 + 1, &dispatch_queue_serial_6));
      else {
        uint64_t v10 = __str;
      }
      dispatch_queue_t v11 = dispatch_queue_create(v10, 0LL);
      if (!v11) {
        MD4FdChunk_cold_1();
      }
      int v12 = v11;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
      if (!v13) {
        MD4FdChunk_cold_1();
      }
      int v14 = v13;
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 0x40000000LL;
      cleanup_handler[2] = __SHA512_FdChunk_block_invoke;
      cleanup_handler[3] = &unk_18A30CB68;
      cleanup_handler[4] = &v33;
      cleanup_handler[5] = v13;
      dispatch_io_t v15 = dispatch_io_create(0LL, a1, v12, cleanup_handler);
      if (!v15) {
        MD4FdChunk_cold_1();
      }
      uint64_t v16 = v15;
      int v26 = a1;
      if (!*((_BYTE *)v30 + 24))
      {
        off_t v17 = 0LL;
        if (a4 >= 10485760) {
          uint64_t v18 = 10485760LL;
        }
        else {
          uint64_t v18 = a4;
        }
        if (a4) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = 10485760LL;
        }
        do
        {
          if (a4) {
            BOOL v20 = v17 < a4;
          }
          else {
            BOOL v20 = 1;
          }
          int v21 = v20;
          if (*((_DWORD *)v34 + 6)) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v21 == 0;
          }
          if (v22) {
            break;
          }
          io_handler[0] = MEMORY[0x1895F87A8];
          io_handler[1] = 0x40000000LL;
          io_handler[2] = __SHA512_FdChunk_block_invoke_2;
          io_handler[3] = &unk_18A30CBB8;
          io_handler[4] = &v37;
          io_handler[5] = &v33;
          io_handler[6] = &v29;
          io_handler[7] = v14;
          dispatch_io_read(v16, v17, v19, v12, io_handler);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
          v17 += 10485760LL;
        }

        while (!*((_BYTE *)v30 + 24));
      }

      dispatch_release(v16);
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v12);
      dispatch_release(v14);
      if ((v8 & 0x40000) == 0) {
        fcntl(v26, 48, 0LL);
      }
      int v23 = *((_DWORD *)v34 + 6);
      if (v23)
      {
        unint64_t v24 = 0LL;
        *__error() = v23;
      }

      else
      {
        unint64_t v24 = SHA512_End((CC_SHA512_CTX *)(v38 + 3), a2);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v24;
}

_BYTE *SHA512_File(const char *a1, _BYTE *a2)
{
  return SHA512_FileChunk(a1, a2, 0LL, 0LL);
}

_BYTE *SHA512_FileChunk(const char *a1, _BYTE *a2, off_t a3, uint64_t a4)
{
  int v7 = open(a1, 0);
  if (v7 < 0) {
    return 0LL;
  }
  int v8 = v7;
  unint64_t v9 = SHA512_FdChunk(v7, a2, a3, a4);
  int v10 = *__error();
  close(v8);
  *__error() = v10;
  return v9;
}

_BYTE *SHA512_Data(const void *a1, CC_LONG a2, _BYTE *a3)
{
  return SHA512_End(&v7, a3);
}

void MD4FdChunk_cold_1()
{
  v0 = (unsigned __int8 *)_os_crash();
  __break(1u);
  CC_MD4_Final(v0, v1);
}

int CC_MD4_Final(unsigned __int8 *md, CC_MD4_CTX *c)
{
  return MEMORY[0x1895F8258](md, c);
}

int CC_MD4_Init(CC_MD4_CTX *c)
{
  return MEMORY[0x1895F8260](c);
}

int CC_MD4_Update(CC_MD4_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8268](c, data, *(void *)&len);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8278](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8280](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8288](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82B8](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82C0](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82C8](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1895FABE8](data, applier);
}

dispatch_io_t dispatch_io_create( dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1895FAC98](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_read( dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}